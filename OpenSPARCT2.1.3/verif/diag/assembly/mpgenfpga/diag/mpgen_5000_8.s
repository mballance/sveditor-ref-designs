/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_5000_8.s
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
!	Seed = 626172913
!	Riesling can be on
!	1 Thread, 5000 lines
!	mpgen   created on May 4, 2009 (15:17:56), Version 2.81
!	mpgen_5000l_24.s created on Jun 26, 2009 (17:29:13)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.090504 -rc random.rc -o mpgen_5000l_24 -p 1 -l 5000

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
!	%f0  = 46b9eeb0 2626c601 6999f96e 775fd707
!	%f4  = 67936a9c 2b71eebd 2505d9ba 205996a3
!	%f8  = 6557ba48 73054439 24f63bc6 1fe9b8ff
!	%f12 = 7f5c29b4 4f216275 5f97cb92 25aeba1b
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 0f87c4e0 5c39a571 4dc6f51e 485fd5f7
!	%f20 = 53ff57cc 2870292d 171be46a 0a290893
!	%f24 = 78916e78 43d1c9a9 0bb68576 5bc70def
!	%f28 = 6be254e4 155222e5 57ca8442 5a63620b
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 4c581710 108790e1 1ceb4cce 443040e7
!	%f36 = 78c680fc 28272f9d 5d180b1a 5fc4a683
!	%f40 = 10db1ea8 1940db19 6387ab26 52384edf
!	%f44 = 71493c14 6b3b2f55 1734d8f2 1fffb5fb
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x4a91ea5e00000022,%g7,%g1 ! %gsr scale =  4, align = 2
	wr	%g1,%g0,%gsr		! %gsr = 4a91ea5e00000022

	wr	%g0,%y			! Clear %y register
	xorcc	%g0,%g0,%g3		! %g3 = 0, %ccr = 44
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 3cb78c78, %l1 = 00000000b7b9f449
	swapa	[%i5+%o5]0x88,%l1	! %l1 = 000000003cb78c78
!	%l6 = 5cf2e8ec37b90a90, Mem[0000000030101410] = 0cbe8415
	stha	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 0cbe0a90
!	Mem[0000000010141400] = 50b9416c, %l7 = f362335be72a7a9b
	ldstuba	[%i5+%g0]0x88,%l7	! %l7 = 000000000000006c
!	%l2 = 625cd77828e46b04, Mem[0000000010101408] = ae7dcf09
	stha	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = ae7d6b04
!	%l3 = b634bfdcfc5800cf, Mem[00000000100c1408] = 0cbefa4e
	stba	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = cfbefa4e
!	%l7 = 000000000000006c, %l6 = 5cf2e8ec37b90a90, %l1 = 000000003cb78c78
	or	%l7,%l6,%l1		! %l1 = 5cf2e8ec37b90afc
!	%l0 = 2ee1b759a0de199e, Mem[000000001008141c] = 5431f623
	stw	%l0,[%i2+0x01c]		! Mem[000000001008141c] = a0de199e
!	Mem[0000000010081410] = 4255641c, %l4 = 8efbba452d83c8aa
	lduha	[%i2+%o5]0x80,%l4	! %l4 = 0000000000004255
!	%l7 = 000000000000006c, Mem[0000000010001400] = 45ec2f7024908bc1
	stxa	%l7,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000000000006c
!	Mem[0000000030181408] = 2df7901e, %l1 = 5cf2e8ec37b90afc
	ldstuba	[%i6+%o4]0x81,%l1	! %l1 = 000000000000002d

p0_label_2:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 6ed4ec35, %l2 = 625cd77828e46b04
	lduba	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000035
!	Code Fragment 4, seed = 493364
p0_fragment_1:
!	%l0 = 2ee1b759a0de199e
	setx	0x53fd9b287f6cb286,%g7,%l0 ! %l0 = 53fd9b287f6cb286
!	%l1 = 000000000000002d
	setx	0x18083c4667a558b1,%g7,%l1 ! %l1 = 18083c4667a558b1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 53fd9b287f6cb286
	setx	0x6b7dd74ec418c2ec,%g7,%l0 ! %l0 = 6b7dd74ec418c2ec
!	%l1 = 18083c4667a558b1
	setx	0xc96370780a28f437,%g7,%l1 ! %l1 = c96370780a28f437
p0_fragment_1_end:
!	Mem[0000000010001410] = 5c871263, %l3 = b634bfdcfc5800cf
	ldswa	[%i0+%o5]0x88,%l3	! %l3 = 000000005c871263
!	Mem[0000000030101400] = 54799720, %l3 = 000000005c871263
	lduba	[%i4+%g0]0x81,%l3	! %l3 = 0000000000000054
!	Mem[0000000030101410] = 900abe0c, %l0 = 6b7dd74ec418c2ec
	ldsba	[%i4+%o5]0x81,%l0	! %l0 = ffffffffffffff90
!	%l6 = 5cf2e8ec37b90a90, immd = 00000364, %y  = 00000000
	sdiv	%l6,0x364,%l1		! %l1 = 0000000000106f33
	mov	%l0,%y			! %y = ffffff90
!	Mem[0000000030001400] = 5505f5a0, %l4 = 0000000000004255
	ldsba	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000055
!	Mem[0000000010001410] = 5c871263, %l1 = 0000000000106f33
	lduwa	[%i0+%o5]0x88,%l1	! %l1 = 000000005c871263
!	Mem[0000000010081410] = 4255641c, %l3 = 0000000000000054
	ldsba	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000042
!	Mem[0000000030141400] = 80579b69, %l5 = d46ff0eed8666595
	ldsha	[%i5+%g0]0x89,%l5	! %l5 = ffffffffffff9b69

p0_label_3:
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000006c, Mem[0000000010101418] = 79f591fa247a45e3
	stx	%l7,[%i4+0x018]		! Mem[0000000010101418] = 000000000000006c
!	Mem[0000000030181400] = e007ef63, %l4 = 0000000000000055
	swapa	[%i6+%g0]0x89,%l4	! %l4 = 00000000e007ef63
!	Mem[000000001014140c] = 1c6a2c27, %l7 = 000000000000006c
	swap	[%i5+0x00c],%l7		! %l7 = 000000001c6a2c27
!	%f0  = 46b9eeb0 2626c601, %l1 = 000000005c871263
!	Mem[0000000030041430] = 2227c4047fe1e185
	add	%i1,0x030,%g1
	stda	%f0,[%g1+%l1]ASI_PST32_S ! Mem[0000000030041430] = 46b9eeb02626c601
!	%f7  = 205996a3, %f12 = 7f5c29b4 4f216275
	fstox	%f7 ,%f12		! %f12 = 00000000 00000000
!	%l1 = 000000005c871263, Mem[0000000030001408] = 2c427bde
	stwa	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 5c871263
!	%l4 = 00000000e007ef63, Mem[00000000100c1428] = 6557c8a67ad7865f
	stx	%l4,[%i3+0x028]		! Mem[00000000100c1428] = 00000000e007ef63
!	Mem[0000000010041408] = 7e22438e, %l2 = 0000000000000035
	ldstuba	[%i1+%o4]0x80,%l2	! %l2 = 000000000000007e
!	Mem[0000000010141408] = 0e718169, %l5 = ffffffffffff9b69
	ldstuba	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000069
!	%l4 = e007ef63, %l5 = 00000069, Mem[0000000010141408] = ff81710e 0000006c
	stda	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = e007ef63 00000069

p0_label_4:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 56563030 297b1181, %l2 = 0000007e, %l3 = 00000042, %asi = 80
	ldda	[%i2+0x000]%asi,%l2	! %l2 = 0000000056563030 00000000297b1181
!	%o1 = deadbeefdeadbeef
	set	share1_start,%o1	! set %o1[0] to VA
!	Mem[0000000020800000] = 22cca840, %l0 = ffffffffffffff90, %asi = 80
	ldsba	[%o1+0x000]%asi,%l0	! %l0 = 0000000000000022
!	Mem[0000000030041410] = ecd21334, %l1 = 000000005c871263
	lduba	[%i1+%o5]0x89,%l1	! %l1 = 0000000000000034
!	Mem[0000000010141434] = 7262ec95, %f24 = 78916e78
	lda	[%i5+0x034]%asi,%f24	! %f24 = 7262ec95
!	Mem[0000000010041418] = 33c1bdda7f78d643, %f16 = 0f87c4e0 5c39a571
	ldd	[%i1+0x018],%f16	! %f16 = 33c1bdda 7f78d643
!	%l1 = 0000000000000034, imm = 0000000000000365, %l5 = 0000000000000069
	addc	%l1,0x365,%l5		! %l5 = 0000000000000399
!	Mem[0000000010181410] = 47265d9c, %f9  = 73054439
	lda	[%i6+0x010]%asi,%f9 	! %f9 = 47265d9c
!	Mem[0000000010101434] = 1d11ffb5, %l7 = 000000001c6a2c27
	ldsw	[%i4+0x034],%l7		! %l7 = 000000001d11ffb5
!	Mem[0000000030141400] = 699b5780, %l1 = 0000000000000034
	ldswa	[%i5+%g0]0x81,%l1	! %l1 = 00000000699b5780
!	Mem[0000000010001408] = 4466102e, %l7 = 000000001d11ffb5, %asi = 80
	lduba	[%i0+0x008]%asi,%l7	! %l7 = 0000000000000044

p0_label_5:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000699b5780, Mem[0000000030041410] = 3413d2ec
	stwa	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = 699b5780
!	%f28 = 6be254e4 155222e5, %l5 = 0000000000000399
!	Mem[0000000010101410] = 1c1c00dc6aa543fd
	add	%i4,0x010,%g1
	stda	%f28,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010101410] = e51c0015e4a5436b
!	%f13 = 00000000, Mem[00000000100c1400] = 13dc1890
	st	%f13,[%i3+%g0]		! Mem[00000000100c1400] = 00000000
!	%l4 = e007ef63, %l5 = 00000399, Mem[00000000100c1408] = 4efabecf 67c84a53
	stda	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = e007ef63 00000399
!	%l2 = 0000000056563030, Mem[0000000030041410] = 699b57802ebb43cd
	stxa	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000000056563030
!	%f6  = 2505d9ba 205996a3, %l1 = 00000000699b5780
!	Mem[0000000030141410] = 2eaeec6c6fec074d
	add	%i5,0x010,%g1
	stda	%f6,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030141410] = 2eaeec6c6fec074d
!	Mem[0000000010001435] = 11322c35, %l3 = 00000000297b1181
	ldstuba	[%i0+0x035]%asi,%l3	! %l3 = 0000000000000032
!	%l6 = 37b90a90, %l7 = 00000044, Mem[00000000100c1408] = 63ef07e0 99030000
	stda	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 37b90a90 00000044
!	%f13 = 00000000, %f14 = 5f97cb92
	fcmpes	%fcc2,%f13,%f14		! %fcc2 = 1
!	%f11 = 1fe9b8ff, %f4  = 67936a9c, %f31 = 5a63620b
	fsubs	%f11,%f4 ,%f31		! %f31 = e7936a9c

p0_label_6:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ac7f9718, %l3 = 0000000000000032
	ldsha	[%i3+%o5]0x89,%l3	! %l3 = ffffffffffff9718
!	Mem[0000000030141400] = 699b5780 35f2c991, %l6 = 37b90a90, %l7 = 00000044
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 00000000699b5780 0000000035f2c991
!	Mem[0000000030001410] = 8c64cd12, %l3 = ffffffffffff9718
	ldswa	[%i0+%o5]0x89,%l3	! %l3 = ffffffff8c64cd12
!	Mem[0000000010101400] = 12b7f0f0, %l0 = 0000000000000022
	lduwa	[%i4+%g0]0x80,%l0	! %l0 = 0000000012b7f0f0
!	Mem[00000000100c1408] = 900ab937, %l3 = ffffffff8c64cd12
	ldsba	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000037
!	Mem[0000000010081410] = 4255641c 7662123d, %l6 = 699b5780, %l7 = 35f2c991
	ldda	[%i2+%o5]0x80,%l6	! %l6 = 000000004255641c 000000007662123d
!	Mem[0000000030141408] = be74a66c, %l4 = 00000000e007ef63
	lduwa	[%i5+%o4]0x89,%l4	! %l4 = 00000000be74a66c
!	%f30 = 57ca8442 e7936a9c, Mem[0000000030081408] = 45f3c29e 443afd77
	stda	%f30,[%i2+%o4]0x81	! Mem[0000000030081408] = 57ca8442 e7936a9c
!	Mem[0000000010101408] = 046b7dae, %l3 = 0000000000000037
	lduwa	[%i4+%o4]0x80,%l3	! %l3 = 00000000046b7dae
!	Mem[0000000030001400] = 5505f5a0 1f899b31, %l0 = 12b7f0f0, %l1 = 699b5780
	ldda	[%i0+%g0]0x81,%l0	! %l0 = 000000005505f5a0 000000001f899b31

p0_label_7:
!	Starting 10 instruction Store Burst
!	%l2 = 56563030, %l3 = 046b7dae, Mem[0000000010001400] = 00000000 6c000000
	stda	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 56563030 046b7dae
!	%f2  = 6999f96e, Mem[00000000100c1400] = 00000000
	sta	%f2 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 6999f96e
!	Mem[0000000010081410] = 1c645542, %l2 = 0000000056563030
	swapa	[%i2+%o5]0x88,%l2	! %l2 = 000000001c645542
!	Mem[0000000010101410] = e51c0015, %l0 = 000000005505f5a0
	ldstuba	[%i4+%o5]0x80,%l0	! %l0 = 00000000000000e5
!	%f0  = 46b9eeb0, Mem[0000000030001410] = 12cd648c
	sta	%f0 ,[%i0+%o5]0x81	! Mem[0000000030001410] = 46b9eeb0
!	%f25 = 43d1c9a9, Mem[0000000030141400] = 699b5780
	sta	%f25,[%i5+%g0]0x81	! Mem[0000000030141400] = 43d1c9a9
!	Mem[0000000030141410] = 6cecae2e, %l0 = 00000000000000e5
	ldstuba	[%i5+%o5]0x89,%l0	! %l0 = 000000000000002e
!	Mem[0000000030141408] = 6ca674be, %l4 = 00000000be74a66c
	ldstuba	[%i5+%o4]0x81,%l4	! %l4 = 000000000000006c
!	%l6 = 4255641c, %l7 = 7662123d, Mem[0000000010081428] = 37f89946 508a307f
	std	%l6,[%i2+0x028]		! Mem[0000000010081428] = 4255641c 7662123d
!	%f12 = 00000000 00000000, %l3 = 00000000046b7dae
!	Mem[0000000030001418] = 28ef272a39268853
	add	%i0,0x018,%g1
	stda	%f12,[%g1+%l3]ASI_PST32_S ! Mem[0000000030001418] = 0000000039268853

p0_label_8:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = e007ef63 00000069, %l6 = 4255641c, %l7 = 7662123d
	ldda	[%i5+%o4]0x80,%l6	! %l6 = 00000000e007ef63 0000000000000069
!	Mem[0000000030001408] = 5c871263, %l5 = 0000000000000399
	ldswa	[%i0+%o4]0x81,%l5	! %l5 = 000000005c871263
!	Mem[0000000010141400] = 50b941ff, %l1 = 000000001f899b31
	lduba	[%i5+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141410] = b7b9f449, %l4 = 000000000000006c
	ldswa	[%i5+%o5]0x88,%l4	! %l4 = ffffffffb7b9f449
!	Mem[0000000030001408] = 5c871263, %l5 = 000000005c871263
	ldswa	[%i0+%o4]0x81,%l5	! %l5 = 000000005c871263
!	Mem[0000000030001400] = a0f50555, %l3 = 00000000046b7dae
	lduwa	[%i0+%g0]0x89,%l3	! %l3 = 00000000a0f50555
!	Code Fragment 3, seed = 187108
p0_fragment_2:
!	%l0 = 000000000000002e
	setx	0xf2b115dba7a4c506,%g7,%l0 ! %l0 = f2b115dba7a4c506
!	%l1 = 00000000000000ff
	setx	0x19ff15df89b2e331,%g7,%l1 ! %l1 = 19ff15df89b2e331
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f2b115dba7a4c506
	setx	0x37f04dd17f62456c,%g7,%l0 ! %l0 = 37f04dd17f62456c
!	%l1 = 19ff15df89b2e331
	setx	0xb5706296c34ceeb7,%g7,%l1 ! %l1 = b5706296c34ceeb7
p0_fragment_2_end:
!	%o3 = deadbeefdeadbeef
	set	share3_start,%o3	! set %o3[0] to VA
!	Mem[00000000218001c0] = 123dda20, %l2 = 000000001c645542
	lduh	[%o3+0x1c0],%l2		! %l2 = 000000000000123d
!	Mem[00000000300c1400] = 6131c6c0, %l6 = 00000000e007ef63
	ldswa	[%i3+%g0]0x81,%l6	! %l6 = 000000006131c6c0
!	Mem[0000000030181408] = 1e90f7ff, %l7 = 0000000000000069
	ldsha	[%i6+%o4]0x89,%l7	! %l7 = fffffffffffff7ff

p0_label_9:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181414] = 2dc535bd, %l5 = 000000005c871263
	ldstuba	[%i6+0x014]%asi,%l5	! %l5 = 000000000000002d
!	%f10 = 24f63bc6 1fe9b8ff, Mem[00000000100c1438] = 67c16e72 383e857b
	std	%f10,[%i3+0x038]	! Mem[00000000100c1438] = 24f63bc6 1fe9b8ff
!	Mem[0000000010141408] = 63ef07e0, %l4 = 00000000b7b9f449
	swapa	[%i5+%o4]0x88,%l4	! %l4 = 0000000063ef07e0
!	%f18 = 4dc6f51e 485fd5f7, Mem[0000000030041400] = 5ecff600 5c1fde11
	stda	%f18,[%i1+%g0]0x81	! Mem[0000000030041400] = 4dc6f51e 485fd5f7
!	%f14 = 5f97cb92 25aeba1b, %l6 = 000000006131c6c0
!	Mem[00000000100c1438] = 24f63bc61fe9b8ff
	add	%i3,0x038,%g1
	stda	%f14,[%g1+%l6]ASI_PST16_P ! Mem[00000000100c1438] = 24f63bc61fe9b8ff
!	%l7 = fffffffffffff7ff, Mem[0000000010141410] = 49f4b9b7329da4dd
	stxa	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = fffffffffffff7ff
!	%f17 = 7f78d643, Mem[0000000030141410] = 6cecaeff
	sta	%f17,[%i5+%o5]0x89	! Mem[0000000030141410] = 7f78d643
!	Mem[0000000020800040] = 3a62b270, %l5 = 000000000000002d
	ldstub	[%o1+0x040],%l5		! %l5 = 000000000000003a
!	Mem[00000000100c1438] = 24f63bc61fe9b8ff, %l7 = fffffffffffff7ff, %l7 = fffffffffffff7ff
	add	%i3,0x38,%g1
	casxa	[%g1]0x80,%l7,%l7	! %l7 = 24f63bc61fe9b8ff
!	Mem[0000000010001400] = 30305656, %l5 = 000000000000003a
	ldstuba	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000030

p0_label_10:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 55d171b0, %l3 = 00000000a0f50555
	ldsha	[%i6+%g0]0x80,%l3	! %l3 = 00000000000055d1
!	Mem[0000000010041410] = bc7d4f2f, %l2 = 000000000000123d
	lduwa	[%i1+%o5]0x88,%l2	! %l2 = 00000000bc7d4f2f
!	Mem[0000000010141408] = b7b9f449, %l3 = 00000000000055d1
	lduha	[%i5+%o4]0x88,%l3	! %l3 = 000000000000f449
!	%l4 = 0000000063ef07e0, %l1 = b5706296c34ceeb7, %y  = ffffff90
	umul	%l4,%l1,%l4		! %l4 = 4c3d1b259fb0e120, %y = 4c3d1b25
!	Mem[0000000010081400] = 56563030, %l6 = 000000006131c6c0
	ldswa	[%i2+%g0]0x80,%l6	! %l6 = 0000000056563030
!	Mem[000000001000140e] = 43de5ac7, %l1 = b5706296c34ceeb7
	ldsh	[%i0+0x00e],%l1		! %l1 = 0000000000005ac7
!	Mem[0000000010081400] = 56563030, %l1 = 0000000000005ac7
	lduba	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000056
!	Mem[0000000010141410] = fff7ffffffffffff, %l3 = 000000000000f449
	ldxa	[%i5+%o5]0x88,%l3	! %l3 = fff7ffffffffffff
!	Mem[0000000010101418] = 00000000, %f27 = 5bc70def
	ld	[%i4+0x018],%f27	! %f27 = 00000000
!	Mem[0000000010141400] = 2142800350b941ff, %l5 = 0000000000000030
	ldxa	[%i5+%g0]0x88,%l5	! %l5 = 2142800350b941ff

p0_label_11:
!	Starting 10 instruction Store Burst
!	%l0 = 37f04dd17f62456c, Mem[0000000030101408] = 5ec99a4b
	stwa	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 7f62456c
!	%l5 = 2142800350b941ff, Mem[0000000030081410] = 510f314c324aacad
	stxa	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = 2142800350b941ff
!	%l1 = 0000000000000056, Mem[0000000010141410] = fff7ffffffffffff
	stxa	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000000056
!	Mem[0000000010081410] = 56563030, %l0 = 37f04dd17f62456c
	ldstuba	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000030
!	%f26 = 0bb68576 00000000, %l0 = 0000000000000030
!	Mem[0000000030001418] = 0000000039268853
	add	%i0,0x018,%g1
	stda	%f26,[%g1+%l0]ASI_PST16_S ! Mem[0000000030001418] = 0000000039268853
!	Mem[00000000100c1405] = 384c9c61, %l5 = 2142800350b941ff
	ldstuba	[%i3+0x005]%asi,%l5	! %l5 = 000000000000004c
!	%l1 = 0000000000000056, Mem[0000000010041422] = 6b3db768
	stb	%l1,[%i1+0x022]		! Mem[0000000010041420] = 6b3d5668
!	%l6 = 56563030, %l7 = 1fe9b8ff, Mem[00000000100c1400] = 6ef99969 38ff9c61
	stda	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 56563030 1fe9b8ff
!	%f26 = 0bb68576, Mem[0000000030081408] = 4284ca57
	sta	%f26,[%i2+%o4]0x89	! Mem[0000000030081408] = 0bb68576
!	Mem[00000000300c1400] = c0c63161, %l5 = 000000000000004c
	ldstuba	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000061

p0_label_12:
!	Starting 10 instruction Load Burst
!	%l0 = 0000000000000030, %l0 = 0000000000000030, %l7 = 24f63bc61fe9b8ff
	and	%l0,%l0,%l7		! %l7 = 0000000000000030
!	Mem[00000000100c1408] = 900ab937, %l3 = fff7ffffffffffff
	lduba	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000037
!	Mem[0000000010041410] = bc7d4f2f, %l6 = 0000000056563030
	ldsba	[%i1+%o5]0x88,%l6	! %l6 = 000000000000002f
!	Mem[00000000100c1408] = 37b90a90, %f21 = 2870292d
	lda	[%i3+%o4]0x80,%f21	! %f21 = 37b90a90
!	Mem[0000000030081408] = 0bb68576, %l6 = 000000000000002f
	ldswa	[%i2+%o4]0x89,%l6	! %l6 = 000000000bb68576
!	Mem[0000000030181400] = 55000000 171dfc71, %l6 = 0bb68576, %l7 = 00000030
	ldda	[%i6+%g0]0x81,%l6	! %l6 = 0000000055000000 00000000171dfc71
!	Mem[0000000010181400] = 015dd265b071d155, %f30 = 57ca8442 e7936a9c
	ldda	[%i6+%g0]0x88,%f30	! %f30 = 015dd265 b071d155
!	Mem[0000000030041410] = 00000000, %f9  = 47265d9c
	lda	[%i1+%o5]0x89,%f9 	! %f9 = 00000000
!	Mem[0000000010181418] = 34d3a4ba, %l0 = 0000000000000030, %asi = 80
	ldsha	[%i6+0x018]%asi,%l0	! %l0 = 00000000000034d3
!	Mem[0000000010001419] = 2eceac7a, %l6 = 0000000055000000, %asi = 80
	lduba	[%i0+0x019]%asi,%l6	! %l6 = 00000000000000ce

p0_label_13:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 4528673e, %l4 = 000000009fb0e120
	swapa	[%i1+%o4]0x81,%l4	! %l4 = 000000004528673e
!	%l0 = 000034d3, %l1 = 00000056, Mem[00000000300c1410] = ac7f9718 8d455d31
	stda	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000034d3 00000056
!	Mem[0000000030141400] = a9c9d143, %l4 = 000000004528673e
	ldstuba	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000043
!	%f14 = 5f97cb92 25aeba1b, %l7 = 00000000171dfc71
!	Mem[0000000010141400] = ff41b95003804221
	stda	%f14,[%i5+%l7]ASI_PST32_P ! Mem[0000000010141400] = ff41b95025aeba1b
!	%f18 = 4dc6f51e 485fd5f7, %l5 = 0000000000000061
!	Mem[0000000030101418] = 1bbaecaa1169c7d3
	add	%i4,0x018,%g1
	stda	%f18,[%g1+%l5]ASI_PST16_SL ! Mem[0000000030101418] = f7d5ecaa1169c7d3
!	%f0  = 46b9eeb0, %f8  = 6557ba48, %f12 = 00000000
	fsubs	%f0 ,%f8 ,%f12		! %f12 = e557ba48
!	%l1 = 0000000000000056, Mem[0000000010001400] = 046b7dae565630ff
	stxa	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000056
!	%f20 = 53ff57cc 37b90a90, Mem[0000000030101400] = 20977954 b1c63b35
	stda	%f20,[%i4+%g0]0x89	! Mem[0000000030101400] = 53ff57cc 37b90a90
!	%f29 = 155222e5, Mem[0000000030041410] = 00000000
	sta	%f29,[%i1+%o5]0x89	! Mem[0000000030041410] = 155222e5
!	%f30 = 015dd265 b071d155, %l2 = 00000000bc7d4f2f
!	Mem[00000000100c1410] = 5cfc3a7c3b64131d
	add	%i3,0x010,%g1
	stda	%f30,[%g1+%l2]ASI_PST16_P ! Mem[00000000100c1410] = 015dd265b071d155

p0_label_14:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 000034d3, %l5 = 0000000000000061
	ldswa	[%i3+%o5]0x89,%l5	! %l5 = 00000000000034d3
!	Mem[00000000100c1432] = 2642e594, %l0 = 00000000000034d3, %asi = 80
	lduba	[%i3+0x032]%asi,%l0	! %l0 = 00000000000000e5
!	Mem[0000000010001410] = 6312875c0d3ba07d, %l7 = 00000000171dfc71
	ldxa	[%i0+%o5]0x80,%l7	! %l7 = 6312875c0d3ba07d
!	Mem[0000000030101400] = 53ff57cc 37b90a90, %l0 = 000000e5, %l1 = 00000056
	ldda	[%i4+%g0]0x89,%l0	! %l0 = 0000000037b90a90 0000000053ff57cc
!	Mem[00000000100c143e] = 1fe9b8ff, %l4 = 0000000000000043, %asi = 80
	ldsha	[%i3+0x03e]%asi,%l4	! %l4 = ffffffffffffb8ff
!	Mem[0000000030001408] = 5c871263, %l5 = 00000000000034d3
	ldsba	[%i0+%o4]0x81,%l5	! %l5 = 000000000000005c
!	Mem[0000000030141400] = ffd1c9a9, %l5 = 000000000000005c
	lduba	[%i5+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181410] = cc0aee26, %f5  = 2b71eebd
	lda	[%i6+%o5]0x89,%f5 	! %f5 = cc0aee26
!	Mem[0000000010001406] = 00000000, %l3 = 0000000000000037
	ldsb	[%i0+0x006],%l3		! %l3 = 0000000000000000
!	Mem[0000000010101400] = f0f0b712, %l0 = 0000000037b90a90
	lduba	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000012

p0_label_15:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101424] = 5f679d79, %l3 = 0000000000000000
	ldstub	[%i4+0x024],%l3		! %l3 = 000000000000005f
!	%f30 = 015dd265 b071d155, Mem[0000000030041410] = 155222e5 30305656
	stda	%f30,[%i1+%o5]0x89	! Mem[0000000030041410] = 015dd265 b071d155
!	%l7 = 6312875c0d3ba07d, Mem[0000000010181410] = 9c5d2647
	stwa	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 0d3ba07d
!	%l2 = bc7d4f2f, %l3 = 0000005f, Mem[0000000010081410] = 565630ff 3d126276
	stda	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = bc7d4f2f 0000005f
!	%f28 = 6be254e4 155222e5, %l5 = 00000000000000ff
!	Mem[0000000010001420] = 680a73087842a1f9
	add	%i0,0x020,%g1
	stda	%f28,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010001420] = e5225215e454e26b
!	%f11 = 1fe9b8ff, Mem[0000000010041408] = ff22438e
	sta	%f11,[%i1+0x008]%asi	! Mem[0000000010041408] = 1fe9b8ff
!	Mem[0000000010001400] = 00000056, %l1 = 0000000053ff57cc
	swapa	[%i0+%g0]0x88,%l1	! %l1 = 0000000000000056
!	Mem[0000000010101408] = 046b7dae, %l4 = ffffb8ff, %l5 = 000000ff
	add	%i4,0x08,%g1
	casa	[%g1]0x80,%l4,%l5	! %l5 = 00000000046b7dae
!	Mem[0000000010101408] = ae7d6b04, %l2 = 00000000bc7d4f2f
	ldstuba	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000004
!	Mem[0000000030001410] = 46b9eeb0, %l6 = 00000000000000ce
	ldstuba	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000046

p0_label_16:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = f0f0b712, %l3 = 000000000000005f
	ldsba	[%i4+%g0]0x88,%l3	! %l3 = 0000000000000012
!	Mem[00000000300c1408] = fe8dbc42, %f5  = cc0aee26
	lda	[%i3+%o4]0x89,%f5 	! %f5 = fe8dbc42
!	%l4 = ffffffffffffb8ff, immd = 00000d00, %y  = 4c3d1b25
	smul	%l4,0xd00,%l0		! %l0 = fffffffffc64f300, %y = ffffffff
!	%l2 = 0000000000000004, immd = fffff34f, %y  = ffffffff
	smul	%l2,-0xcb1,%l2		! %l2 = ffffffffffffcd3c, %y = ffffffff
!	Mem[0000000010041408] = 1fe9b8ff6d2224a7, %f2  = 6999f96e 775fd707
	ldd	[%i1+%o4],%f2 		! %f2  = 1fe9b8ff 6d2224a7
!	Mem[00000000218001c0] = 123dda20, %l4 = ffffffffffffb8ff
	ldsb	[%o3+0x1c0],%l4		! %l4 = 0000000000000012
!	Mem[0000000010101400] = f0f0b712, %l3 = 0000000000000012
	ldswa	[%i4+%g0]0x88,%l3	! %l3 = fffffffff0f0b712
!	Mem[00000000300c1410] = 00000056000034d3, %l0 = fffffffffc64f300
	ldxa	[%i3+%o5]0x89,%l0	! %l0 = 00000056000034d3
!	Mem[0000000030141410] = 7f78d643, %f10 = 24f63bc6
	lda	[%i5+%o5]0x89,%f10	! %f10 = 7f78d643
!	Mem[0000000030041410] = 55d171b0, %l5 = 00000000046b7dae
	lduha	[%i1+%o5]0x81,%l5	! %l5 = 00000000000055d1

p0_label_17:
!	Starting 10 instruction Store Burst
!	%f8  = 6557ba48, Mem[0000000010081410] = bc7d4f2f
	sta	%f8 ,[%i2+%o5]0x88	! Mem[0000000010081410] = 6557ba48
!	Mem[0000000010041400] = 5cce37d0, %l6 = 0000000000000046
	ldstuba	[%i1+%g0]0x80,%l6	! %l6 = 000000000000005c
!	%l7 = 6312875c0d3ba07d, Mem[00000000100c1409] = 37b90a90
	stb	%l7,[%i3+0x009]		! Mem[00000000100c1408] = 377d0a90
!	%l6 = 000000000000005c, Mem[0000000010001410] = 6312875c
	stha	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 005c875c
!	%l6 = 000000000000005c, Mem[0000000030101400] = 37b90a90
	stha	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = 37b9005c
!	%f3  = 6d2224a7, Mem[0000000010141408] = b7b9f449
	sta	%f3 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 6d2224a7
!	Mem[0000000010181408] = 6ed4ec35, %l6 = 000000000000005c
	swapa	[%i6+%o4]0x88,%l6	! %l6 = 000000006ed4ec35
!	%f26 = 0bb68576, %f16 = 33c1bdda, %f14 = 5f97cb92
	fsubs	%f26,%f16,%f14		! %f14 = b3c1bdda
!	%f28 = 6be254e4, Mem[0000000030081400] = 686be660
	sta	%f28,[%i2+%g0]0x81	! Mem[0000000030081400] = 6be254e4
!	%l6 = 000000006ed4ec35, %l7 = 6312875c0d3ba07d, %l2 = ffffffffffffcd3c
	xnor	%l6,%l7,%l2		! %l2 = 9ced78a39c10b3b7

p0_label_18:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 15001cff, %f7  = 205996a3
	lda	[%i4+%o5]0x88,%f7 	! %f7 = 15001cff
!	Mem[0000000030141408] = be74a6ff, %f25 = 43d1c9a9
	lda	[%i5+%o4]0x89,%f25	! %f25 = be74a6ff
!	Mem[0000000010101408] = ff6b7dae, %l5 = 00000000000055d1
	ldsba	[%i4+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	%o2 = deadbeefdeadbeef
	set	share2_start,%o2	! set %o2[0] to VA
!	Mem[00000000211c0000] = 218c38a0, %l6 = 000000006ed4ec35, %asi = 80
	ldsha	[%o2+0x000]%asi,%l6	! %l6 = 000000000000218c
!	Mem[0000000021800141] = 128689c0, %l0 = 00000056000034d3, %asi = 80
	lduba	[%o3+0x141]%asi,%l0	! %l0 = 0000000000000086
!	Mem[0000000010181410] = 7da03b0d, %f25 = be74a6ff
	lda	[%i6+%o5]0x80,%f25	! %f25 = 7da03b0d
!	%l6 = 000000000000218c, %l5 = ffffffffffffffff, %l3 = fffffffff0f0b712
	sdivx	%l6,%l5,%l3		! %l3 = ffffffffffffde74
!	Mem[000000001008140b] = 6437e6ee, %l7 = 6312875c0d3ba07d
	ldsb	[%i2+0x00b],%l7		! %l7 = ffffffffffffffee
!	Mem[0000000030001400] = a0f50555, %l0 = 0000000000000086
	lduba	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000055
!	Mem[0000000030041410] = 55d171b0 65d25d01, %l4 = 00000012, %l5 = ffffffff
	ldda	[%i1+%o5]0x81,%l4	! %l4 = 0000000055d171b0 0000000065d25d01

p0_label_19:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000056, Mem[0000000030001408] = 6312875c
	stha	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 63120056
!	%l4 = 55d171b0, %l5 = 65d25d01, Mem[0000000010081410] = 6557ba48 0000005f
	stda	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 55d171b0 65d25d01
!	%f7  = 15001cff, Mem[0000000010001438] = 7d3c5652
	st	%f7 ,[%i0+0x038]	! Mem[0000000010001438] = 15001cff
!	%l3 = ffffffffffffde74, Mem[0000000010081408] = 6437e6ee
	stba	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = 7437e6ee
!	Mem[0000000030101410] = 0cbe0a90, %l1 = 0000000000000056
	ldstuba	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000090
!	%l2 = 9c10b3b7, %l3 = ffffde74, Mem[0000000030001408] = 56001263 2d6a09b7
	stda	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 9c10b3b7 ffffde74
!	%l0 = 0000000000000055, Mem[0000000010041410] = 2f4f7dbc5927415d
	stxa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000000055
!	%l6 = 000000000000218c, Mem[0000000030141400] = ffd1c9a935f2c991
	stxa	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000000000218c
!	%l2 = 9c10b3b7, %l3 = ffffde74, Mem[0000000030001408] = 9c10b3b7 ffffde74
	stda	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 9c10b3b7 ffffde74
!	%f2  = 1fe9b8ff 6d2224a7, %l0 = 0000000000000055
!	Mem[0000000010141420] = 0b1228e861d05459
	add	%i5,0x020,%g1
	stda	%f2,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010141420] = a724226d61d05459

p0_label_20:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = c0c631ff, %f2  = 1fe9b8ff
	lda	[%i3+%g0]0x89,%f2 	! %f2 = c0c631ff
!	Mem[0000000030141408] = be74a6ff, %l5 = 0000000065d25d01
	ldswa	[%i5+%o4]0x89,%l5	! %l5 = ffffffffbe74a6ff
!	Mem[0000000030001408] = 74deffff b7b3109c, %l2 = 9c10b3b7, %l3 = ffffde74
	ldda	[%i0+%o4]0x89,%l2	! %l2 = 00000000b7b3109c 0000000074deffff
!	Mem[0000000020800041] = ff62b270, %l0 = 0000000000000055, %asi = 80
	ldsba	[%o1+0x041]%asi,%l0	! %l0 = 0000000000000062
!	Mem[0000000010001400] = 53ff57cc, %l5 = ffffffffbe74a6ff
	ldsha	[%i0+%g0]0x88,%l5	! %l5 = 00000000000057cc
!	Mem[00000000100c1408] = 377d0a90 00000044, %l2 = b7b3109c, %l3 = 74deffff
	ldda	[%i3+%o4]0x80,%l2	! %l2 = 00000000377d0a90 0000000000000044
!	Mem[0000000010181410] = bd35c5ff0d3ba07d, %f20 = 53ff57cc 37b90a90
	ldda	[%i6+%o5]0x88,%f20	! %f20 = bd35c5ff 0d3ba07d
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010001400] = cc57ff53 00000000 4466102e 43de5ac7
!	Mem[0000000010001410] = 005c875c 0d3ba07d 2eceac7a 38bc6663
!	Mem[0000000010001420] = e5225215 e454e26b 5e288a86 37f294bf
!	Mem[0000000010001430] = 09e53e74 11ff2c35 15001cff 41cb61db
	ldda	[%i0+%g0]ASI_BLK_AIUP,%f16	! Block Load from 0000000010001400
!	Mem[0000000010001408] = 2e106644, %l6 = 000000000000218c
	ldsha	[%i0+%o4]0x88,%l6	! %l6 = 0000000000006644
!	Mem[00000000100c1400] = 56563030, %l2 = 00000000377d0a90
	lduwa	[%i3+%g0]0x80,%l2	! %l2 = 0000000056563030

p0_label_21:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000056563030, Mem[0000000030001410] = ffb9eeb0
	stwa	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 56563030
!	%f18 = 4466102e, Mem[0000000010141400] = ff41b950
	sta	%f18,[%i5+%g0]0x80	! Mem[0000000010141400] = 4466102e
!	Mem[0000000010101408] = ff6b7dae, %l5 = 00000000000057cc
	swapa	[%i4+%o4]0x80,%l5	! %l5 = 00000000ff6b7dae
!	Mem[0000000010141408] = a724226d, %l5 = 00000000ff6b7dae
	swapa	[%i5+%o4]0x80,%l5	! %l5 = 00000000a724226d
!	Mem[0000000021800001] = 2c143ad0, %l6 = 0000000000006644
	ldstub	[%o3+0x001],%l6		! %l6 = 0000000000000014
!	Mem[0000000010001408] = 2e106644, %l3 = 0000000000000044
	swapa	[%i0+%o4]0x88,%l3	! %l3 = 000000002e106644
!	%l0 = 0000000000000062, Mem[0000000010081408] = 7437e6ee42b39e87
	stxa	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000062
!	Mem[0000000010041430] = 590830d44a7e5915, %l0 = 0000000000000062, %l3 = 000000002e106644
	add	%i1,0x30,%g1
	casxa	[%g1]0x80,%l0,%l3	! %l3 = 590830d44a7e5915
!	%l0 = 0000000000000062, Mem[00000000100c1408] = 377d0a90
	stha	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00620a90
!	%f21 = 0d3ba07d, Mem[0000000030001408] = 9c10b3b7
	sta	%f21,[%i0+%o4]0x81	! Mem[0000000030001408] = 0d3ba07d

p0_label_22:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = cc0aee26, %l1 = 0000000000000090
	lduha	[%i6+%o5]0x89,%l1	! %l1 = 000000000000ee26
!	Mem[0000000010041400] = a1b6392fd037ceff, %l6 = 0000000000000014
	ldxa	[%i1+%g0]0x88,%l6	! %l6 = a1b6392fd037ceff
!	Mem[0000000010141430] = 07b95a54 7262ec95, %l6 = d037ceff, %l7 = ffffffee
	ldd	[%i5+0x030],%l6		! %l6 = 0000000007b95a54 000000007262ec95
!	Mem[0000000010041406] = 2f39b6a1, %l5 = 00000000a724226d
	ldsh	[%i1+0x006],%l5		! %l5 = ffffffffffffb6a1
!	Mem[0000000020800040] = ff62b270, %l2 = 0000000056563030
	ldsh	[%o1+0x040],%l2		! %l2 = ffffffffffffff62
!	Mem[0000000021800100] = 49011b90, %l5 = ffffffffffffb6a1
	ldsh	[%o3+0x100],%l5		! %l5 = 0000000000004901
!	Mem[0000000030041400] = 4dc6f51e, %l6 = 0000000007b95a54
	lduha	[%i1+%g0]0x81,%l6	! %l6 = 0000000000004dc6
!	Mem[0000000010041400] = d037ceff, %l1 = 000000000000ee26
	lduwa	[%i1+%g0]0x88,%l1	! %l1 = 00000000d037ceff
!	%l4 = 0000000055d171b0, %l6 = 0000000000004dc6, %l4  = 0000000055d171b0
	mulx	%l4,%l6,%l4		! %l4 = 00001a125f2fde20
!	Mem[0000000010081408] = 0000000000000062, %l0 = 0000000000000062
	ldxa	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000062

p0_label_23:
!	Starting 10 instruction Store Burst
!	%l7 = 000000007262ec95, Mem[0000000030101400] = 37b9005c
	stha	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = 37b9ec95
!	%l6 = 0000000000004dc6, Mem[0000000030181400] = 55000000
	stwa	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 00004dc6
!	%f20 = 005c875c 0d3ba07d, Mem[0000000030181408] = 1e90f7ff f724311e
	stda	%f20,[%i6+%o4]0x89	! Mem[0000000030181408] = 005c875c 0d3ba07d
!	%l5 = 0000000000004901, Mem[0000000010041410] = 0000000000000055
	stxa	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000004901
!	%f20 = 005c875c, Mem[0000000030181410] = 26ee0acc
	sta	%f20,[%i6+%o5]0x81	! Mem[0000000030181410] = 005c875c
!	Mem[0000000020800040] = ff62b270, %l1 = 00000000d037ceff
	ldstuba	[%o1+0x040]%asi,%l1	! %l1 = 00000000000000ff
!	%l0 = 0000000000000062, Mem[0000000030141408] = ffa674be
	stha	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 006274be
!	Mem[0000000010081408] = 00000000, %l2 = ffffffffffffff62
	ldstuba	[%i2+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101400] = 37b9ec95, %l1 = 00000000000000ff
	swapa	[%i4+%g0]0x89,%l1	! %l1 = 0000000037b9ec95
!	%f18 = 4466102e, Mem[0000000030101400] = 000000ff
	sta	%f18,[%i4+%g0]0x89	! Mem[0000000030101400] = 4466102e

p0_label_24:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041430] = 590830d44a7e5915, %l4 = 00001a125f2fde20
	ldx	[%i1+0x030],%l4		! %l4 = 590830d44a7e5915
!	Mem[0000000010141408] = ae7d6bff, %l7 = 000000007262ec95
	lduha	[%i5+%o4]0x88,%l7	! %l7 = 0000000000006bff
!	Mem[0000000010081410] = 65d25d0155d171b0, %l6 = 0000000000004dc6
	ldxa	[%i2+%o5]0x88,%l6	! %l6 = 65d25d0155d171b0
!	%l1 = 0000000037b9ec95, %l7 = 0000000000006bff, %l2 = 0000000000000000
	sdivx	%l1,%l7,%l2		! %l2 = 0000000000008418
!	Mem[0000000010041408] = 1fe9b8ff, %l3 = 590830d44a7e5915
	ldsha	[%i1+%o4]0x80,%l3	! %l3 = 0000000000001fe9
!	Mem[00000000100c1404] = 1fe9b8ff, %l5 = 0000000000004901, %asi = 80
	ldsba	[%i3+0x004]%asi,%l5	! %l5 = 000000000000001f
!	Mem[0000000010041400] = ffce37d02f39b6a1, %f2  = c0c631ff 6d2224a7, %asi = 80
	ldda	[%i1+0x000]%asi,%f2 	! %f2  = ffce37d0 2f39b6a1
!	Mem[0000000010081400] = 56563030, %l3 = 0000000000001fe9
	lduha	[%i2+%g0]0x80,%l3	! %l3 = 0000000000005656
!	Mem[0000000010001408] = 00000044, %l6 = 65d25d0155d171b0
	lduba	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000044
!	Mem[0000000010041402] = ffce37d0, %l5 = 000000000000001f, %asi = 80
	ldsha	[%i1+0x002]%asi,%l5	! %l5 = 00000000000037d0

p0_label_25:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000044, Mem[0000000030101408] = 6c45627f
	stwa	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000044
	membar	#Sync			! Added by membar checker (2)
!	%l5 = 00000000000037d0, Mem[0000000010001408] = c75ade4300000044
	stxa	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000000037d0
!	%l0 = 00000062, %l1 = 37b9ec95, Mem[00000000300c1408] = fe8dbc42 57ff991f
	stda	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000062 37b9ec95
!	Mem[0000000010001410] = 5c875c00, %l6 = 0000000000000044
	ldswa	[%i0+%o5]0x88,%l6	! %l6 = 000000005c875c00
!	%l3 = 0000000000005656, Mem[0000000010141408] = ae7d6bff
	stha	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = ae7d5656
!	%l1 = 0000000037b9ec95, Mem[0000000030181408] = 7da03b0d
	stwa	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 37b9ec95
!	%l3 = 0000000000005656, Mem[0000000010001400] = cc57ff53
	stba	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = 5657ff53
!	%l6 = 5c875c00, %l7 = 00006bff, Mem[0000000030041410] = 55d171b0 65d25d01
	stda	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 5c875c00 00006bff
!	%f0  = 46b9eeb0, Mem[0000000030041400] = 4dc6f51e
	sta	%f0 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 46b9eeb0
!	%l2 = 0000000000008418, Mem[0000000030141408] = 006274be
	stba	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 186274be

p0_label_26:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff31c6c0, %l6 = 000000005c875c00
	ldswa	[%i3+%g0]0x81,%l6	! %l6 = ffffffffff31c6c0
!	Mem[0000000030041408] = 9fb0e120, %l4 = 590830d44a7e5915
	lduba	[%i1+%o4]0x81,%l4	! %l4 = 000000000000009f
!	Mem[00000000100c1400] = 56563030, %f28 = 09e53e74
	lda	[%i3+%g0]0x80,%f28	! %f28 = 56563030
!	Mem[0000000010041408] = 1fe9b8ff 6d2224a7, %l4 = 0000009f, %l5 = 000037d0, %asi = 80
	ldda	[%i1+0x008]%asi,%l4	! %l4 = 000000001fe9b8ff 000000006d2224a7
!	%o0 = deadbeefdeadbeef
	set	share0_start,%o0	! set %o0[0] to VA
!	Mem[00000000201c0000] = 20bf1a10, %l2 = 0000000000008418
	ldsh	[%o0+%g0],%l2		! %l2 = 00000000000020bf
!	Mem[0000000030141400] = 00000000, %l5 = 000000006d2224a7
	lduwa	[%i5+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181408] = 37b9ec95, %f25 = e454e26b
	lda	[%i6+%o4]0x81,%f25	! %f25 = 37b9ec95
!	Mem[0000000010181408] = 0000005c, %l3 = 0000000000005656
	lduha	[%i6+%o4]0x88,%l3	! %l3 = 000000000000005c
!	Mem[000000001004142c] = 7ad08a9f, %f2  = ffce37d0
	ld	[%i1+0x02c],%f2 	! %f2 = 7ad08a9f
!	Mem[0000000010181400] = 015dd265b071d155, %l0 = 0000000000000062
	ldxa	[%i6+%g0]0x88,%l0	! %l0 = 015dd265b071d155

p0_label_27:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 2e106644, %l2 = 00000000000020bf
	swapa	[%i5+%g0]0x88,%l2	! %l2 = 000000002e106644
!	Mem[00000000100c1430] = 2642e59438f642d5, %l4 = 000000001fe9b8ff, %l2 = 000000002e106644
	add	%i3,0x30,%g1
	casxa	[%g1]0x80,%l4,%l2	! %l2 = 2642e59438f642d5
!	%f12 = e557ba48 00000000, Mem[0000000010181428] = 7071f6c6 3a65a7ff, %asi = 80
	stda	%f12,[%i6+0x028]%asi	! Mem[0000000010181428] = e557ba48 00000000
!	Mem[0000000030101410] = ff0abe0c, %l4 = 000000001fe9b8ff
	swapa	[%i4+%o5]0x81,%l4	! %l4 = 00000000ff0abe0c
!	%l5 = 0000000000000000, Mem[0000000010181430] = 6926fcb4
	stw	%l5,[%i6+0x030]		! Mem[0000000010181430] = 00000000
!	Mem[0000000030001400] = 5505f5a0, %l2 = 2642e59438f642d5
	ldstuba	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000055
!	%l0 = 015dd265b071d155, Mem[0000000030041408] = 20e1b09f
	stwa	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = b071d155
!	%l2 = 0000000000000055, %l2 = 0000000000000055, %y  = ffffffff
	umul	%l2,%l2,%l7		! %l7 = 0000000000001c39, %y = 00000000
!	Mem[00000000100c143c] = 1fe9b8ff, %l6 = 00000000ff31c6c0, %asi = 80
	swapa	[%i3+0x03c]%asi,%l6	! %l6 = 000000001fe9b8ff
!	%l3 = 000000000000005c, Mem[0000000010001408] = d037000000000000
	stxa	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000000000005c

p0_label_28:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 53ff57cc4466102e, %f2  = 7ad08a9f 2f39b6a1
	ldda	[%i4+%g0]0x89,%f2 	! %f2  = 53ff57cc 4466102e
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000030101400] = 2e106644 cc57ff53 00000044 0292b137
!	Mem[0000000030101410] = 1fe9b8ff 646b0e6d f7d5ecaa 1169c7d3
!	Mem[0000000030101420] = 42eea8b8 6650b2e9 7c7701b6 552af12f
!	Mem[0000000030101430] = 418fa324 4ec45025 34d6b482 4603a94b
	ldda	[%i4+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030101400
!	Mem[0000000010101424] = ff679d79, %f30 = 15001cff
	lda	[%i4+0x024]%asi,%f30	! %f30 = ff679d79
!	Mem[0000000010081410] = 65d25d01 55d171b0, %l2 = 00000055, %l3 = 0000005c
	ldda	[%i2+%o5]0x88,%l2	! %l2 = 0000000055d171b0 0000000065d25d01
!	Mem[0000000030101400] = 4466102e, %l2 = 0000000055d171b0
	ldsba	[%i4+%g0]0x89,%l2	! %l2 = 000000000000002e
!	Mem[0000000010041400] = d037ceff, %l2 = 000000000000002e
	lduha	[%i1+%g0]0x88,%l2	! %l2 = 000000000000ceff
!	Mem[00000000300c1410] = 00000056000034d3, %f16 = cc57ff53 00000000
	ldda	[%i3+%o5]0x89,%f16	! %f16 = 00000056 000034d3
!	Mem[0000000030041410] = 5c875c00, %l0 = 015dd265b071d155
	lduwa	[%i1+%o5]0x81,%l0	! %l0 = 000000005c875c00
!	Mem[00000000201c0000] = 20bf1a10, %l7 = 0000000000001c39
	lduh	[%o0+%g0],%l7		! %l7 = 00000000000020bf
!	Mem[0000000010081430] = 4a8a13340c97b5f5, %l2 = 000000000000ceff, %asi = 80
	ldxa	[%i2+0x030]%asi,%l2	! %l2 = 4a8a13340c97b5f5

p0_label_29:
!	Starting 10 instruction Store Burst
!	%l2 = 4a8a13340c97b5f5, Mem[0000000010041400] = ffce37d0
	stwa	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 0c97b5f5
!	Mem[000000001004140c] = 6d2224a7, %l2 = 000000000c97b5f5
	swap	[%i1+0x00c],%l2		! %l2 = 000000006d2224a7
!	Mem[00000000100c1410] = 015dd265, %l7 = 00000000000020bf
	ldstuba	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000001
!	Mem[0000000030041400] = 46b9eeb0 485fd5f7 55d171b0 0fbdab97
!	%f16 = 00000056 000034d3 4466102e 43de5ac7
!	%f20 = 005c875c 0d3ba07d 2eceac7a 38bc6663
!	%f24 = e5225215 37b9ec95 5e288a86 37f294bf
!	%f28 = 56563030 11ff2c35 ff679d79 41cb61db
	stda	%f16,[%i1+%g0]ASI_BLK_SL	! Block Store to 0000000030041400
!	%f23 = 38bc6663, Mem[0000000010081410] = 55d171b0
	sta	%f23,[%i2+%o5]0x88	! Mem[0000000010081410] = 38bc6663
!	Mem[0000000030081408] = 7685b60b, %l6 = 000000001fe9b8ff
	swapa	[%i2+%o4]0x81,%l6	! %l6 = 000000007685b60b
!	%l7 = 0000000000000001, Mem[0000000010181408] = 0000005c
	stha	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000001
!	%l6 = 000000007685b60b, Mem[0000000010081410] = 65d25d0138bc6663
	stxa	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000007685b60b
!	%f12 = 418fa324 4ec45025, Mem[0000000030181408] = 95ecb937 005c875c
	stda	%f12,[%i6+%o4]0x89	! Mem[0000000030181408] = 418fa324 4ec45025
!	Mem[0000000030181408] = 4ec45025, %l3 = 0000000065d25d01
	ldstuba	[%i6+%o4]0x89,%l3	! %l3 = 0000000000000025

p0_label_30:
!	Starting 10 instruction Load Burst
!	%l1 = 0000000037b9ec95, imm = 0000000000000107, %l4 = 00000000ff0abe0c
	and	%l1,0x107,%l4		! %l4 = 0000000000000005
!	Mem[0000000010141400] = 1bbaae25 000020bf, %l0 = 5c875c00, %l1 = 37b9ec95
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 00000000000020bf 000000001bbaae25
!	Mem[0000000010081400] = 56563030297b1181, %l5 = 0000000000000000
	ldxa	[%i2+%g0]0x80,%l5	! %l5 = 56563030297b1181
!	Mem[00000000100c1410] = ff5dd265, %l4 = 0000000000000005
	lduha	[%i3+%o5]0x80,%l4	! %l4 = 000000000000ff5d
!	Mem[0000000030141400] = 00000000, %l4 = 000000000000ff5d
	ldsba	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000030041410] = 7da03b0d, %l7 = 0000000000000001
	ldsha	[%i1+%o5]0x81,%l7	! %l7 = 0000000000007da0
!	Mem[00000000218001c1] = 123dda20, %l3 = 0000000000000025
	ldsb	[%o3+0x1c1],%l3		! %l3 = 000000000000003d
!	Mem[0000000030141410] = 7f78d643, %l7 = 0000000000007da0
	lduha	[%i5+%o5]0x89,%l7	! %l7 = 000000000000d643
!	Mem[0000000010141410] = 00000056, %l4 = 0000000000000000
	ldsba	[%i5+%o5]0x88,%l4	! %l4 = 0000000000000056
!	Mem[0000000010041400] = 0c97b5f5, %l1 = 000000001bbaae25
	lduba	[%i1+%g0]0x80,%l1	! %l1 = 000000000000000c

p0_label_31:
!	Starting 10 instruction Store Burst
!	%f26 = 5e288a86, %f7  = 1169c7d3
	fsqrts	%f26,%f7 		! %f7  = 4ecfb7a8
!	Mem[0000000010041434] = 4a7e5915, %l2 = 000000006d2224a7, %asi = 80
	swapa	[%i1+0x034]%asi,%l2	! %l2 = 000000004a7e5915
!	%l0 = 00000000000020bf, Mem[0000000010001400] = 5657ff53
	stha	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 20bfff53
!	%l1 = 000000000000000c, immd = 00000231, %y  = 00000000
	umul	%l1,0x231,%l4		! %l4 = 0000000000001a4c, %y = 00000000
!	Mem[0000000030141408] = be746218, %l2 = 000000004a7e5915
	ldstuba	[%i5+%o4]0x89,%l2	! %l2 = 0000000000000018
!	Mem[0000000030081400] = e454e26b, %l1 = 000000000000000c
	ldstuba	[%i2+%g0]0x89,%l1	! %l1 = 000000000000006b
!	%l1 = 000000000000006b, Mem[00000000100c1400] = 30305656
	stha	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = 3030006b
!	%l6 = 000000007685b60b, Mem[0000000010081408] = 62000000000000ff
	stxa	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000007685b60b
!	Mem[0000000010181400] = 55d171b0, %l2 = 00000018, %l5 = 297b1181
	casa	[%i6]0x80,%l2,%l5	! %l5 = 0000000055d171b0
!	%l0 = 00000000000020bf, Mem[0000000030001410] = 30305656
	stha	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 303020bf

p0_label_32:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 3030006b, %l2 = 0000000000000018
	lduha	[%i3+%g0]0x88,%l2	! %l2 = 000000000000006b
!	Mem[0000000030041408] = c75ade43 2e106644, %l6 = 7685b60b, %l7 = 0000d643
	ldda	[%i1+%o4]0x81,%l6	! %l6 = 00000000c75ade43 000000002e106644
!	Mem[0000000030041408] = c75ade43, %l1 = 000000000000006b
	ldsha	[%i1+%o4]0x81,%l1	! %l1 = ffffffffffffc75a
!	Mem[0000000030001400] = ff05f5a0, %l4 = 0000000000001a4c
	lduba	[%i0+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1408] = 00000062, %l0 = 00000000000020bf
	ldsha	[%i3+%o4]0x89,%l0	! %l0 = 0000000000000062
!	Mem[00000000300c1410] = d3340000, %l7 = 000000002e106644
	lduwa	[%i3+%o5]0x81,%l7	! %l7 = 00000000d3340000
!	Mem[0000000030001400] = a0f505ff, %f26 = 5e288a86
	lda	[%i0+%g0]0x89,%f26	! %f26 = a0f505ff
!	Mem[0000000030101408] = 000000440292b137, %f20 = 005c875c 0d3ba07d
	ldda	[%i4+%o4]0x81,%f20	! %f20 = 00000044 0292b137
!	Mem[0000000030041408] = c75ade43, %l5 = 0000000055d171b0
	lduba	[%i1+%o4]0x81,%l5	! %l5 = 00000000000000c7
!	Mem[0000000030041400] = d3340000, %l5 = 00000000000000c7
	lduwa	[%i1+%g0]0x81,%l5	! %l5 = 00000000d3340000

p0_label_33:
!	Starting 10 instruction Store Burst
!	Mem[000000001004143f] = 0249bdbb, %l1 = ffffffffffffc75a
	ldstub	[%i1+0x03f],%l1		! %l1 = 00000000000000bb
!	Mem[0000000030141400] = 00000000, %l7 = 00000000d3340000
	lduba	[%i5+%g0]0x89,%l7	! %l7 = 0000000000000000
!	%l2 = 000000000000006b, Mem[0000000010081408] = 7685b60b
	stha	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 7685006b
!	Mem[00000000100c1408] = 00620a90, %f14 = 34d6b482
	lda	[%i3+%o4]0x80,%f14	! %f14 = 00620a90
!	%f14 = 00620a90, Mem[0000000010041400] = f5b5970c
	sta	%f14,[%i1+%g0]0x88	! Mem[0000000010041400] = 00620a90
!	%l4 = 00000000000000ff, Mem[0000000030141400] = 000000000000218c
	stxa	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000000000ff
!	%l6 = 00000000c75ade43, Mem[0000000030101410] = ffb8e91f
	stwa	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = c75ade43
!	%f0  = 2e106644 cc57ff53, Mem[00000000100c1408] = 00620a90 00000044, %asi = 80
	stda	%f0 ,[%i3+0x008]%asi	! Mem[00000000100c1408] = 2e106644 cc57ff53
!	%l7 = 0000000000000000, Mem[0000000010101410] = 6b43a5e415001cff
	stxa	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000000000000
!	Mem[0000000010101410] = 0000000000000000, %l5 = 00000000d3340000, %l7 = 0000000000000000
	add	%i4,0x10,%g1
	casxa	[%g1]0x80,%l5,%l7	! %l7 = 0000000000000000

p0_label_34:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 53ffbf20, %l5 = 00000000d3340000
	ldswa	[%i0+%g0]0x88,%l5	! %l5 = 0000000053ffbf20
!	Mem[0000000030001410] = bf203030, %f7  = 4ecfb7a8
	lda	[%i0+%o5]0x81,%f7 	! %f7 = bf203030
!	Mem[0000000010041410] = 00000000, %l6 = 00000000c75ade43
	lduha	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = 53ffbf20, %l2 = 000000000000006b
	lduha	[%i0+%g0]0x88,%l2	! %l2 = 000000000000bf20
!	Mem[00000000300c1410] = 000034d3, %f12 = 418fa324
	lda	[%i3+%o5]0x89,%f12	! %f12 = 000034d3
!	Mem[0000000030041408] = c75ade43, %l4 = 00000000000000ff
	lduba	[%i1+%o4]0x81,%l4	! %l4 = 00000000000000c7
!	Mem[00000000300c1408] = 00000062, %l3 = 000000000000003d
	lduha	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000062
!	Mem[0000000010101400] = 12b7f0f02ca65741, %l0 = 0000000000000062
	ldxa	[%i4+%g0]0x80,%l0	! %l0 = 12b7f0f02ca65741
!	%f5  = 646b0e6d, %f4  = 1fe9b8ff
	fcmps	%fcc0,%f5 ,%f4 		! %fcc0 = 2
!	Mem[00000000100c1400] = 6b003030, %f20 = 00000044
	lda	[%i3+%g0]0x80,%f20	! %f20 = 6b003030

p0_label_35:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000c7, Mem[000000001008143c] = 24b2c99b
	stw	%l4,[%i2+0x03c]		! Mem[000000001008143c] = 000000c7
!	Mem[00000000100c1438] = 24f63bc6, %l0 = 12b7f0f02ca65741
	ldstuba	[%i3+0x038]%asi,%l0	! %l0 = 0000000000000024
!	%l4 = 00000000000000c7, Mem[0000000030101400] = 53ff57cc4466102e
	stxa	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000000000c7
!	Mem[0000000010101408] = 000057cc, %l0 = 0000000000000024
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 00000000000057cc
!	%l0 = 00000000000057cc, Mem[0000000030001408] = 0d3ba07d
	stba	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = cc3ba07d
!	%l2 = 0000bf20, %l3 = 00000062, Mem[0000000030041400] = d3340000 56000000
	stda	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000bf20 00000062
!	%l7 = 0000000000000000, Mem[0000000010001400] = 20bfff53
	stba	%l7,[%i0+%g0]0x80	! Mem[0000000010001400] = 00bfff53
!	%l0 = 00000000000057cc, imm = 00000000000007cc, %l4 = 00000000000000c7
	xnor	%l0,0x7cc,%l4		! %l4 = ffffffffffffafff
!	%l4 = ffffffffffffafff, Mem[0000000010141408] = ae7d5656
	stba	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = ae7d56ff
!	%l0 = 00000000000057cc, Mem[00000000211c0000] = 218c38a0, %asi = 80
	stha	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = 57cc38a0

p0_label_36:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 7685006b, %l3 = 0000000000000062
	ldswa	[%i2+%o4]0x88,%l3	! %l3 = 000000007685006b
!	Mem[0000000010181410] = bd35c5ff 0d3ba07d, %l0 = 000057cc, %l1 = 000000bb
	ldda	[%i6+%o5]0x88,%l0	! %l0 = 000000000d3ba07d 00000000bd35c5ff
!	Mem[0000000030141400] = 00000000, %l7 = 0000000000000000
	lduwa	[%i5+%g0]0x89,%l7	! %l7 = 0000000000000000
!	%f12 = 000034d3, %f29 = 11ff2c35, %f9  = 6650b2e9
	fdivs	%f12,%f29,%f9 		! tt=0x22, %l0 = 000000000d3ba09f
!	Mem[000000001014140f] = 00000069, %l6 = 0000000000000000, %asi = 80
	lduba	[%i5+0x00f]%asi,%l6	! %l6 = 0000000000000069
!	Mem[0000000030181400] = c64d0000, %l6 = 0000000000000069
	ldswa	[%i6+%g0]0x89,%l6	! %l6 = ffffffffc64d0000
!	Mem[0000000010081400] = 30305656, %l7 = 0000000000000000
	lduwa	[%i2+%g0]0x88,%l7	! %l7 = 0000000030305656
!	Mem[00000000100c1410] = ff5dd265 b071d155, %l4 = ffffafff, %l5 = 53ffbf20, %asi = 80
	ldda	[%i3+0x010]%asi,%l4	! %l4 = 00000000ff5dd265 00000000b071d155
!	Mem[0000000010001408] = 00000000, %l2 = 000000000000bf20
	ldswa	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[000000001014141d] = 5c7975c3, %l7 = 0000000030305656, %asi = 80
	lduba	[%i5+0x01d]%asi,%l7	! %l7 = 0000000000000079

p0_label_37:
!	Starting 10 instruction Store Burst
!	Code Fragment 4, seed = 277202
p0_fragment_3:
!	%l0 = 000000000d3ba09f
	setx	0x45a0bccdfce31396,%g7,%l0 ! %l0 = 45a0bccdfce31396
!	%l1 = 00000000bd35c5ff
	setx	0x701eb8d973af2cc1,%g7,%l1 ! %l1 = 701eb8d973af2cc1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 45a0bccdfce31396
	setx	0xe6f5756c359799fc,%g7,%l0 ! %l0 = e6f5756c359799fc
!	%l1 = 701eb8d973af2cc1
	setx	0x7a391617cd895e47,%g7,%l1 ! %l1 = 7a391617cd895e47
p0_fragment_3_end:
!	Mem[0000000030181400] = 00004dc6 171dfc71 ff50c44e 24a38f41
!	%f0  = 2e106644 cc57ff53 00000044 0292b137
!	%f4  = 1fe9b8ff 646b0e6d f7d5ecaa bf203030
!	%f8  = 42eea8b8 6650b2e9 7c7701b6 552af12f
!	%f12 = 000034d3 4ec45025 00620a90 4603a94b
	stda	%f0 ,[%i6+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030181400
!	%f31 = 41cb61db, %f18 = 4466102e, %f25 = 37b9ec95
	fmuls	%f31,%f18,%f25		! %f25 = 46b6c6c5
!	%l5 = 00000000b071d155, immd = fffffa72, %y  = 00000000
	sdiv	%l5,-0x58e,%l6		! %l6 = ffffffffffe03c2a
	mov	%l0,%y			! %y = 359799fc
!	%l7 = 0000000000000079, Mem[00000000100c1408] = 4466102e
	stba	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 44661079
!	Mem[0000000010041400] = 900a6200, %l5 = 00000000b071d155
	swapa	[%i1+%g0]0x80,%l5	! %l5 = 00000000900a6200
!	Mem[0000000030041400] = 20bf0000, %l6 = ffffffffffe03c2a
	ldstuba	[%i1+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c140f] = cc57ff53, %l2 = 0000000000000000
	ldstuba	[%i3+0x00f]%asi,%l2	! %l2 = 0000000000000053
!	%l1 = 7a391617cd895e47, Mem[000000001008143c] = 000000c7, %asi = 80
	stha	%l1,[%i2+0x03c]%asi	! Mem[000000001008143c] = 5e4700c7

p0_label_38:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000, %l1 = 7a391617cd895e47
	ldsha	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010181408] = 010000002e626607, %l5 = 00000000900a6200, %asi = 80
	ldxa	[%i6+0x008]%asi,%l5	! %l5 = 010000002e626607
!	Mem[0000000010041418] = 33c1bdda7f78d643, %l3 = 000000007685006b, %asi = 80
	ldxa	[%i1+0x018]%asi,%l3	! %l3 = 33c1bdda7f78d643
!	Mem[0000000030181408] = 000000440292b137, %l6 = 0000000000000000
	ldxa	[%i6+%o4]0x89,%l6	! %l6 = 000000440292b137
!	Mem[0000000010041410] = 00000000, %l1 = 0000000000000000
	ldsha	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041401] = b071d155, %l6 = 000000440292b137, %asi = 80
	ldsba	[%i1+0x001]%asi,%l6	! %l6 = 0000000000000071
!	%l3 = 33c1bdda7f78d643, imm = 0000000000000036, %l6 = 0000000000000071
	subc	%l3,0x036,%l6		! %l6 = 33c1bdda7f78d60d
!	Mem[0000000021800040] = 7785b900, %l6 = 33c1bdda7f78d60d, %asi = 80
	lduha	[%o3+0x040]%asi,%l6	! %l6 = 0000000000007785
!	Mem[0000000010181408] = 010000002e626607, %l2 = 0000000000000053
	ldxa	[%i6+%o4]0x80,%l2	! %l2 = 010000002e626607
!	Mem[0000000030001400] = 319b891fa0f505ff, %l6 = 0000000000007785
	ldxa	[%i0+%g0]0x89,%l6	! %l6 = 319b891fa0f505ff

p0_label_39:
!	Starting 10 instruction Store Burst
!	%l5 = 010000002e626607, Mem[0000000030181400] = 53ff57cc
	stba	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = 07ff57cc
!	%l2 = 2e626607, %l3 = 7f78d643, Mem[0000000030001408] = 7da03bcc 74deffff
	stda	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 2e626607 7f78d643
!	%l4 = 00000000ff5dd265, Mem[0000000010181410] = bd35c5ff0d3ba07d
	stxa	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000ff5dd265
!	Mem[0000000020800041] = ff62b270, %l3 = 33c1bdda7f78d643
	ldstub	[%o1+0x041],%l3		! %l3 = 0000000000000062
!	Mem[000000001000140c] = 0000005c, %l0 = 00000000359799fc
	swap	[%i0+0x00c],%l0		! %l0 = 000000000000005c
!	%l4 = 00000000ff5dd265, Mem[0000000010041410] = 00000000
	stha	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000d265
!	%l2 = 2e626607, %l3 = 00000062, Mem[00000000300c1410] = 000034d3 00000056
	stda	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 2e626607 00000062
!	%l0 = 0000005c, %l1 = 00000000, Mem[00000000300c1408] = 00000062 37b9ec95
	stda	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000005c 00000000
!	%l5 = 010000002e626607, Mem[0000000030001410] = bf203030
	stha	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = 66073030
!	Mem[0000000030081408] = 1fe9b8ff, %l4 = 00000000ff5dd265
	ldstuba	[%i2+%o4]0x81,%l4	! %l4 = 000000000000001f

p0_label_40:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c140d] = cc57ffff, %l5 = 010000002e626607, %asi = 80
	lduba	[%i3+0x00d]%asi,%l5	! %l5 = 0000000000000057
!	Mem[0000000010001405] = 00000000, %l3 = 0000000000000062, %asi = 80
	lduba	[%i0+0x005]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101410] = 43de5ac7, %l2 = 010000002e626607
	lduba	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000043
!	Mem[0000000030001400] = ff05f5a0, %l2 = 0000000000000043
	ldsha	[%i0+%g0]0x81,%l2	! %l2 = ffffffffffffff05
!	Mem[000000001008142f] = 7662123d, %l5 = 0000000000000057, %asi = 80
	ldsba	[%i2+0x02f]%asi,%l5	! %l5 = 000000000000003d
!	Mem[00000000218000c0] = 58112960, %l4 = 000000000000001f
	lduh	[%o3+0x0c0],%l4		! %l4 = 0000000000005811
!	Mem[0000000030001400] = ff05f5a0 1f899b31, %l0 = 0000005c, %l1 = 00000000
	ldda	[%i0+%g0]0x81,%l0	! %l0 = 00000000ff05f5a0 000000001f899b31
!	Mem[0000000030141408] = 1713dd59 be7462ff, %l0 = ff05f5a0, %l1 = 1f899b31
	ldda	[%i5+%o4]0x89,%l0	! %l0 = 00000000be7462ff 000000001713dd59
!	Mem[00000000201c0000] = 20bf1a10, %l7 = 0000000000000079, %asi = 80
	lduha	[%o0+0x000]%asi,%l7	! %l7 = 00000000000020bf
!	Mem[0000000030181408] = 0292b137, %l3 = 0000000000000000
	lduba	[%i6+%o4]0x89,%l3	! %l3 = 0000000000000037

p0_label_41:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 1fe9b8ff 0c97b5f5, %l4 = 00005811, %l5 = 0000003d
	ldda	[%i1+%o4]0x80,%l4	! %l4 = 000000001fe9b8ff 000000000c97b5f5
!	Mem[0000000010041408] = ffb8e91f, %l0 = 00000000be7462ff
	swapa	[%i1+%o4]0x88,%l0	! %l0 = 00000000ffb8e91f
!	Mem[0000000010001400] = 00bfff53, %l4 = 000000001fe9b8ff
	swapa	[%i0+%g0]0x80,%l4	! %l4 = 0000000000bfff53
!	%f25 = 46b6c6c5, %f15 = 4603a94b, %f28 = 56563030 11ff2c35
	fsmuld	%f25,%f15,%f28		! %f28 = 41a78025 64d22dc0
!	Mem[0000000010081408] = 7685006b, %l6 = 319b891fa0f505ff
	ldstuba	[%i2+%o4]0x88,%l6	! %l6 = 000000000000006b
!	Mem[0000000010141408] = ae7d56ff, %l2 = ffffffffffffff05
	ldstuba	[%i5+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%f4  = 1fe9b8ff, %f31 = 41cb61db
	fcmpes	%fcc2,%f4 ,%f31		! %fcc2 = 1
!	Mem[0000000030001400] = ff05f5a0 1f899b31 0766622e 43d6787f
!	%f16 = 00000056 000034d3 4466102e 43de5ac7
!	%f20 = 6b003030 0292b137 2eceac7a 38bc6663
!	%f24 = e5225215 46b6c6c5 a0f505ff 37f294bf
!	%f28 = 41a78025 64d22dc0 ff679d79 41cb61db
	stda	%f16,[%i0+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030001400
!	%l1 = 000000001713dd59, Mem[0000000010181408] = 01000000
	stha	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = dd590000
!	Mem[0000000010181408] = dd590000, %l5 = 000000000c97b5f5
	swapa	[%i6+%o4]0x80,%l5	! %l5 = 00000000dd590000

p0_label_42:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000010001408] = 00000000, %l0 = 00000000ffb8e91f
	ldsha	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
!	%l2 = 00000000000000ff, %l0 = 0000000000000000, %y  = 359799fc
	sdiv	%l2,%l0,%l3		! Div by zero, %l0 = 0000000000000028
!	Mem[0000000010081400] = 56563030297b1181, %f18 = 4466102e 43de5ac7
	ldda	[%i2+%g0]0x80,%f18	! %f18 = 56563030 297b1181
!	Mem[0000000010181418] = 34d3a4ba 1b5555a3, %l4 = 00bfff53, %l5 = dd590000
	ldd	[%i6+0x018],%l4		! %l4 = 0000000034d3a4ba 000000001b5555a3
!	Code Fragment 4, seed = 858118
p0_fragment_4:
!	%l0 = 0000000000000028
	setx	0xf4a364d7ff839df6,%g7,%l0 ! %l0 = f4a364d7ff839df6
!	%l1 = 000000001713dd59
	setx	0x22c92cf0e7012921,%g7,%l1 ! %l1 = 22c92cf0e7012921
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f4a364d7ff839df6
	setx	0x41b919692d48685c,%g7,%l0 ! %l0 = 41b919692d48685c
!	%l1 = 22c92cf0e7012921
	setx	0xdd78f6a1a1485ea7,%g7,%l1 ! %l1 = dd78f6a1a1485ea7
p0_fragment_4_end:
!	Mem[0000000010181400] = 015dd265b071d155, %f4  = 1fe9b8ff 646b0e6d
	ldda	[%i6+%g0]0x88,%f4 	! %f4  = 015dd265 b071d155
!	Mem[00000000211c0000] = 57cc38a0, %l5 = 000000001b5555a3, %asi = 80
	ldsba	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000057
!	Mem[0000000010041410] = 0000d265, %l0 = 41b919692d48685c
	ldsba	[%i1+%o5]0x88,%l0	! %l0 = 0000000000000065
!	Mem[0000000030001400] = d334000056000000, %f20 = 6b003030 0292b137
	ldda	[%i0+%g0]0x81,%f20	! %f20 = d3340000 56000000
!	Mem[0000000030181408] = 37b1920244000000, %l2 = 00000000000000ff
	ldxa	[%i6+%o4]0x81,%l2	! %l2 = 37b1920244000000

p0_label_43:
!	Starting 10 instruction Store Burst
!	%f2  = 00000044 0292b137, %l2 = 37b1920244000000
!	Mem[0000000030141420] = 2334a5185fc581c9
	add	%i5,0x020,%g1
	stda	%f2,[%g1+%l2]ASI_PST8_S ! Mem[0000000030141420] = 2334a5185fc581c9
!	Mem[0000000010141408] = 69000000 ae7d56ff, %l2 = 44000000, %l3 = 00000037
	ldda	[%i5+%o4]0x88,%l2	! %l2 = 00000000ae7d56ff 0000000069000000
!	%l2 = ae7d56ff, %l3 = 69000000, Mem[0000000030141400] = ff000000 000000ff
	stda	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = ae7d56ff 69000000
!	%l4 = 0000000034d3a4ba, Mem[0000000030141400] = 00000069ff567dae
	stxa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000034d3a4ba
!	%l3 = 0000000069000000, Mem[0000000030081400] = ffe254e4
	stha	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = 000054e4
!	%l5 = 0000000000000057, Mem[00000000201c0000] = 20bf1a10, %asi = 80
	stha	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00571a10
!	%f26 = a0f505ff 37f294bf, %l5 = 0000000000000057
!	Mem[0000000030041418] = 6366bc387aacce2e
	add	%i1,0x018,%g1
	stda	%f26,[%g1+%l5]ASI_PST32_S ! Mem[0000000030041418] = a0f505ff37f294bf
!	Mem[0000000010081400] = 30305656, %l6 = 000000000000006b
	ldstuba	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000056
!	%l0 = 00000065, %l1 = a1485ea7, Mem[0000000030001408] = c75ade43 2e106644
	stda	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000065 a1485ea7
!	%l3 = 0000000069000000, Mem[0000000010001410] = 005c875c
	stwa	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = 69000000

p0_label_44:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 6d0e6b64, %f10 = 7c7701b6
	lda	[%i6+%o5]0x81,%f10	! %f10 = 6d0e6b64
!	Mem[0000000010101408] = 24000000, %l7 = 00000000000020bf
	lduba	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000
!	%f12 = 000034d3, %f12 = 000034d3, %f5  = b071d155
	fmuls	%f12,%f12,%f5 		! %f5  = 00000000
!	Mem[0000000010001408] = fc99973500000000, %l2 = 00000000ae7d56ff
	ldxa	[%i0+%o4]0x88,%l2	! %l2 = fc99973500000000
!	Mem[0000000010181400] = 55d171b065d25d01, %f10 = 6d0e6b64 552af12f
	ldda	[%i6+%g0]0x80,%f10	! %f10 = 55d171b0 65d25d01
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000030041400] = ff00bf20 00000062 c75ade43 2e106644
!	Mem[0000000030041410] = 7da03b0d 5c875c00 a0f505ff 37f294bf
!	Mem[0000000030041420] = 95ecb937 155222e5 bf94f237 868a285e
!	Mem[0000000030041430] = 352cff11 30305656 db61cb41 799d67ff
	ldda	[%i1+%g0]ASI_BLK_AIUS,%f0 	! Block Load from 0000000030041400
!	Mem[0000000030101410] = 43de5ac7, %l6 = 0000000000000056
	ldswa	[%i4+%o5]0x81,%l6	! %l6 = 0000000043de5ac7
!	Mem[0000000030041400] = 20bf00ff, %l5 = 0000000000000057
	ldswa	[%i1+%g0]0x89,%l5	! %l5 = 0000000020bf00ff
!	Mem[0000000030141408] = be7462ff, %l3 = 0000000069000000
	lduha	[%i5+%o4]0x89,%l3	! %l3 = 00000000000062ff
!	Mem[000000001000141e] = 38bc6663, %l0 = 0000000000000065
	ldsb	[%i0+0x01e],%l0		! %l0 = 0000000000000066

p0_label_45:
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = 57cc38a0, %l5 = 0000000020bf00ff
	ldstub	[%o2+0x001],%l5		! %l5 = 00000000000000cc
!	Code Fragment 3, seed = 425106
p0_fragment_5:
!	%l0 = 0000000000000066
	setx	0xe7498982237ec596,%g7,%l0 ! %l0 = e7498982237ec596
!	%l1 = dd78f6a1a1485ea7
	setx	0x2af3174dc6e43ec1,%g7,%l1 ! %l1 = 2af3174dc6e43ec1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e7498982237ec596
	setx	0x87d3de9815a80bfc,%g7,%l0 ! %l0 = 87d3de9815a80bfc
!	%l1 = 2af3174dc6e43ec1
	setx	0x73e38d0b4f173047,%g7,%l1 ! %l1 = 73e38d0b4f173047
p0_fragment_5_end:
!	%f21 = 56000000, Mem[00000000300c1410] = 2e626607
	sta	%f21,[%i3+%o5]0x89	! Mem[00000000300c1410] = 56000000
!	Mem[0000000010001408] = 00000000, %l5 = 00000000000000cc
	ldstuba	[%i0+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001410] = 0292b137, %l4 = 0000000034d3a4ba
	swapa	[%i0+%o5]0x89,%l4	! %l4 = 000000000292b137
!	%l0 = 15a80bfc, %l1 = 4f173047, Mem[0000000030141410] = 7f78d643 4d07ec6f
	stda	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 15a80bfc 4f173047
!	Mem[0000000030001408] = 00000065, %l7 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000000
!	%l6 = 0000000043de5ac7, Mem[0000000010141410] = 5600000000000000, %asi = 80
	stxa	%l6,[%i5+0x010]%asi	! Mem[0000000010141410] = 0000000043de5ac7
!	Mem[0000000010141408] = ae7d56ff, %l3 = 00000000000062ff
	swapa	[%i5+%o4]0x88,%l3	! %l3 = 00000000ae7d56ff
!	Mem[00000000100c141c] = 231fc603, %l3 = 00000000ae7d56ff
	swap	[%i3+0x01c],%l3		! %l3 = 00000000231fc603

p0_label_46:
!	Starting 10 instruction Load Burst
!	%l4 = 000000000292b137, %l4 = 000000000292b137, %l1 = 73e38d0b4f173047
	sub	%l4,%l4,%l1		! %l1 = 0000000000000000
!	Mem[0000000030141400] = 0000000034d3a4ba, %f20 = d3340000 56000000
	ldda	[%i5+%g0]0x89,%f20	! %f20 = 00000000 34d3a4ba
!	%l4 = 000000000292b137, %l1 = 0000000000000000, %l3 = 00000000231fc603
	orn	%l4,%l1,%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030101408] = 44000000, %l4 = 000000000292b137
	ldsha	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000211c0001] = 57ff38a0, %l6 = 0000000043de5ac7
	ldub	[%o2+0x001],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030181410] = 1fe9b8ff 646b0e6d, %l2 = 00000000, %l3 = ffffffff
	ldda	[%i6+%o5]0x89,%l2	! %l2 = 00000000646b0e6d 000000001fe9b8ff
!	Mem[0000000030081410] = 21428003 50b941ff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i2+%o5]0x81,%l4	! %l4 = 0000000021428003 0000000050b941ff
!	Mem[0000000030141408] = ff6274be, %l0 = 87d3de9815a80bfc
	ldswa	[%i5+%o4]0x81,%l0	! %l0 = ffffffffff6274be
!	Mem[0000000010001400] = 00000000 ffb8e91f, %l2 = 646b0e6d, %l3 = 1fe9b8ff
	ldda	[%i0+%g0]0x88,%l2	! %l2 = 00000000ffb8e91f 0000000000000000
!	Mem[0000000010141400] = 1bbaae25 000020bf, %l2 = ffb8e91f, %l3 = 00000000
	ldda	[%i5+%g0]0x88,%l2	! %l2 = 00000000000020bf 000000001bbaae25

p0_label_47:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000030101408] = 00000044
	stba	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000044
!	%l0 = ffffffffff6274be, Mem[0000000010001400] = 1fe9b8ff
	stba	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = bee9b8ff
!	%f31 = 41cb61db, Mem[0000000010101414] = 00000000
	st	%f31,[%i4+0x014]	! Mem[0000000010101414] = 41cb61db
!	%l6 = 00000000000000ff, Mem[0000000010001400] = 00000000ffb8e9be
	stxa	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000000000ff
!	%l3 = 000000001bbaae25, %l1 = 0000000000000000, %l3  = 000000001bbaae25
	mulx	%l3,%l1,%l3		! %l3 = 0000000000000000
!	Mem[0000000030041400] = 20bf00ff, %l1 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%l5 = 0000000050b941ff, Mem[0000000030141400] = 34d3a4ba
	stwa	%l5,[%i5+%g0]0x89	! Mem[0000000030141400] = 50b941ff
!	Mem[0000000030001408] = ff000065, %l4 = 0000000021428003
	swapa	[%i0+%o4]0x81,%l4	! %l4 = 00000000ff000065
	membar	#Sync			! Added by membar checker (8)
!	%l3 = 0000000000000000, Mem[0000000030041410] = 005c875c0d3ba07d
	stxa	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000000000000000
!	Mem[0000000010181410] = 65d25dff, %l7 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l7	! %l7 = 0000000000000065

p0_label_48:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141430] = 07b95a54 7262ec95, %l0 = ff6274be, %l1 = 000000ff
	ldd	[%i5+0x030],%l0		! %l0 = 0000000007b95a54 000000007262ec95
!	%f7  = 37f294bf, %f22 = 2eceac7a, %f22 = 2eceac7a 38bc6663
	fsmuld	%f7 ,%f22,%f22		! %f22 = 3ce87ae4 27a6e0c0
!	Mem[000000001014142a] = 267c7766, %l0 = 0000000007b95a54, %asi = 80
	lduha	[%i5+0x02a]%asi,%l0	! %l0 = 0000000000007766
!	Mem[0000000010181408] = 0c97b5f5, %l3 = 0000000000000000
	lduba	[%i6+%o4]0x80,%l3	! %l3 = 000000000000000c
!	Mem[0000000010101400] = f0f0b712, %l4 = 00000000ff000065
	ldswa	[%i4+%g0]0x88,%l4	! %l4 = fffffffff0f0b712
!	Mem[0000000030001408] = 03804221, %f3  = 2e106644
	lda	[%i0+%o4]0x89,%f3 	! %f3 = 03804221
!	Mem[0000000010181410] = ffd25dff, %l1 = 000000007262ec95
	lduwa	[%i6+%o5]0x80,%l1	! %l1 = 00000000ffd25dff
!	Mem[0000000030101410] = c75ade43, %f21 = 34d3a4ba
	lda	[%i4+%o5]0x89,%f21	! %f21 = c75ade43
!	Mem[0000000030081408] = ffe9b8ff, %l7 = 0000000000000065
	ldswa	[%i2+%o4]0x81,%l7	! %l7 = ffffffffffe9b8ff
!	Mem[0000000030101400] = c7000000 00000000, %l6 = 000000ff, %l7 = ffe9b8ff
	ldda	[%i4+%g0]0x81,%l6	! %l6 = 00000000c7000000 0000000000000000

p0_label_49:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = c75ade43, %l1 = 00000000ffd25dff
	swapa	[%i4+%o5]0x89,%l1	! %l1 = 00000000c75ade43
!	%l1 = 00000000c75ade43, Mem[0000000010141410] = 00000000
	stba	%l1,[%i5+%o5]0x80	! Mem[0000000010141410] = 43000000
!	%f0  = ff00bf20, Mem[0000000010081434] = 0c97b5f5
	sta	%f0 ,[%i2+0x034]%asi	! Mem[0000000010081434] = ff00bf20
!	%f23 = 27a6e0c0, Mem[0000000030081410] = 21428003
	sta	%f23,[%i2+%o5]0x81	! Mem[0000000030081410] = 27a6e0c0
!	%l6 = c7000000, %l7 = 00000000, Mem[0000000030001400] = 000034d3 00000056
	stda	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = c7000000 00000000
!	%f26 = a0f505ff 37f294bf, %l1 = 00000000c75ade43
!	Mem[0000000030101410] = ff5dd2ff646b0e6d
	add	%i4,0x010,%g1
	stda	%f26,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030101410] = bf94d2ff646bf56d
!	Mem[00000000100c1400] = 3030006b, %l7 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l7	! %l7 = 000000000000006b
!	Mem[0000000010101419] = 00000000, %l5 = 0000000050b941ff
	ldstub	[%i4+0x019],%l5		! %l5 = 0000000000000000
!	Mem[0000000030001400] = c7000000, %l5 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l5	! %l5 = 0000000000000000
!	%l0 = 00007766, %l1 = c75ade43, Mem[00000000300c1400] = c0c631ff d1f30056
	stda	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00007766 c75ade43

p0_label_50:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181412] = ffd25dff, %l1 = 00000000c75ade43, %asi = 80
	ldsha	[%i6+0x012]%asi,%l1	! %l1 = 0000000000005dff
!	Mem[0000000010041410] = 0000d265, %l4 = fffffffff0f0b712
	ldsba	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000065
!	Mem[0000000010081408] = ff008576 00000000, %l4 = 00000065, %l5 = 00000000
	ldda	[%i2+%o4]0x80,%l4	! %l4 = 00000000ff008576 0000000000000000
!	Mem[0000000010101418] = 00ff0000, %l0 = 0000000000007766
	ldsb	[%i4+0x018],%l0		! %l0 = 0000000000000000
!	Mem[0000000010001408] = ff000000, %l7 = 000000000000006b
	ldsha	[%i0+%o4]0x80,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000030181410] = 6d0e6b64ffb8e91f, %l1 = 0000000000005dff
	ldxa	[%i6+%o5]0x81,%l1	! %l1 = 6d0e6b64ffb8e91f
!	Mem[0000000010141414] = 43de5ac7, %l1 = 6d0e6b64ffb8e91f
	ldsw	[%i5+0x014],%l1		! %l1 = 0000000043de5ac7
!	Mem[0000000010141410] = 4300000043de5ac7, %f18 = 56563030 297b1181
	ldda	[%i5+%o5]0x80,%f18	! %f18 = 43000000 43de5ac7
!	Mem[0000000010041410] = 65d20000, %l6 = 00000000c7000000
	ldsba	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000065
!	Mem[00000000300c1410] = 0000006256000000, %l7 = ffffffffffffff00
	ldxa	[%i3+%o5]0x89,%l7	! %l7 = 0000006256000000

p0_label_51:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000065, Mem[00000000100c143c] = ff31c6c0, %asi = 80
	stwa	%l6,[%i3+0x03c]%asi	! Mem[00000000100c143c] = 00000065
!	Mem[0000000010001438] = 15001cff, %l3 = 000000000000000c, %asi = 80
	swapa	[%i0+0x038]%asi,%l3	! %l3 = 0000000015001cff
!	%l0 = 00000000, %l1 = 43de5ac7, Mem[0000000030181408] = 0292b137 00000044
	stda	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 43de5ac7
!	%l3 = 0000000015001cff, imm = 0000000000000664, %l0 = 0000000000000000
	add	%l3,0x664,%l0		! %l0 = 0000000015002363
!	Mem[00000000218001c1] = 123dda20, %l6 = 0000000000000065
	ldstuba	[%o3+0x1c1]%asi,%l6	! %l6 = 000000000000003d
!	%l1 = 0000000043de5ac7, Mem[00000000218001c0] = 12ffda20
	sth	%l1,[%o3+0x1c0]		! Mem[00000000218001c0] = 5ac7da20
!	%l5 = 0000000000000000, Mem[0000000030041410] = 00000000
	stha	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	Mem[0000000010001410] = 69000000, %l5 = 0000000000000000
	ldstuba	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000069
!	%f22 = 3ce87ae4 27a6e0c0, Mem[0000000030081408] = ffe9b8ff e7936a9c
	stda	%f22,[%i2+%o4]0x81	! Mem[0000000030081408] = 3ce87ae4 27a6e0c0
!	%l1 = 0000000043de5ac7, Mem[0000000020800040] = ffffb270
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040] = 5ac7b270

p0_label_52:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = fc0ba815, %l0 = 0000000015002363
	ldswa	[%i5+%o5]0x81,%l0	! %l0 = fffffffffc0ba815
!	Mem[00000000211c0000] = 57ff38a0, %l5 = 0000000000000069, %asi = 80
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = 00000000000057ff
!	Mem[0000000030181400] = cc57ff07, %l7 = 0000006256000000
	lduba	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000007
!	Mem[0000000010101408] = 00000024, %l4 = 00000000ff008576
	lduba	[%i4+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = 0bb6857600000000, %l6 = 000000000000003d
	ldxa	[%i2+%o5]0x80,%l6	! %l6 = 0bb6857600000000
!	Mem[0000000010181408] = 0c97b5f52e626607, %f28 = 41a78025 64d22dc0
	ldd	[%i6+%o4],%f28		! %f28 = 0c97b5f5 2e626607
!	Mem[0000000030001410] = 34d3a4ba, %l3 = 0000000015001cff
	ldswa	[%i0+%o5]0x89,%l3	! %l3 = 0000000034d3a4ba
!	%l4 = 0000000000000000, imm = fffffffffffff50e, %l6 = 0bb6857600000000
	sub	%l4,-0xaf2,%l6		! %l6 = 0000000000000af2
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000010181400] = 55d171b0 65d25d01 0c97b5f5 2e626607
!	Mem[0000000010181410] = ffd25dff 00000000 34d3a4ba 1b5555a3
!	Mem[0000000010181420] = 43811d48 20cf3b39 e557ba48 00000000
!	Mem[0000000010181430] = 00000000 5e610975 79647692 25e1d91b
	ldda	[%i6+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010181400
!	%l1 = 0000000043de5ac7, %l6 = 0000000000000af2, %l3 = 0000000034d3a4ba
	sdivx	%l1,%l6,%l3		! %l3 = 0000000000063360

p0_label_53:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000007, Mem[0000000010141408] = ff62000000000069
	stxa	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000000000000007
!	%f0  = ff00bf20 00000062, %l1 = 0000000043de5ac7
!	Mem[0000000030141410] = fc0ba8154730174f
	add	%i5,0x010,%g1
	stda	%f0,[%g1+%l1]ASI_PST32_S ! Mem[0000000030141410] = ff00bf2000000062
!	Mem[00000000100c1430] = 2642e594, %l1 = 0000000043de5ac7, %asi = 80
	swapa	[%i3+0x030]%asi,%l1	! %l1 = 000000002642e594
	membar	#Sync			! Added by membar checker (10)
!	%l6 = 00000af2, %l7 = 00000007, Mem[0000000010181438] = 79647692 25e1d91b, %asi = 80
	stda	%l6,[%i6+0x038]%asi	! Mem[0000000010181438] = 00000af2 00000007
!	Code Fragment 3, seed = 732116
p0_fragment_6:
!	%l0 = fffffffffc0ba815
	setx	0xec114dbc37362d86,%g7,%l0 ! %l0 = ec114dbc37362d86
!	%l1 = 000000002642e594
	setx	0x83afbebf6f11e3b1,%g7,%l1 ! %l1 = 83afbebf6f11e3b1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ec114dbc37362d86
	setx	0xbe9a0a9f12fb5dec,%g7,%l0 ! %l0 = be9a0a9f12fb5dec
!	%l1 = 83afbebf6f11e3b1
	setx	0x0c47c42acbe49f37,%g7,%l1 ! %l1 = 0c47c42acbe49f37
p0_fragment_6_end:
!	%l1 = 0c47c42acbe49f37, Mem[0000000030181408] = 00000000
	stwa	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = cbe49f37
!	%l1 = 0c47c42acbe49f37, Mem[0000000030181400] = cc57ff07
	stba	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = cc57ff37
!	%f18 = 0c97b5f5, Mem[00000000100c1414] = b071d155
	st	%f18,[%i3+0x014]	! Mem[00000000100c1414] = 0c97b5f5
!	Mem[0000000030041400] = ff00bf20, %l2 = 00000000000020bf
	swapa	[%i1+%g0]0x81,%l2	! %l2 = 00000000ff00bf20
!	Mem[0000000010181408] = 0c97b5f5, %l7 = 0000000000000007
	swapa	[%i6+%o4]0x80,%l7	! %l7 = 000000000c97b5f5

p0_label_54:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ff003030, %f16 = 55d171b0
	lda	[%i3+%g0]0x80,%f16	! %f16 = ff003030
!	%f17 = 65d25d01, %f26 = e557ba48, %f8  = 95ecb937
	fadds	%f17,%f26,%f8 		! %f8  = 654cffba
!	Mem[00000000300c1410] = 56000000, %l2 = 00000000ff00bf20
	lduha	[%i3+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000201c0000] = 00571a10, %l7 = 000000000c97b5f5, %asi = 80
	lduha	[%o0+0x000]%asi,%l7	! %l7 = 0000000000000057
!	Mem[0000000010101408] = 24000000, %l6 = 0000000000000af2
	ldsba	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1408] = 79106644, %l3 = 0000000000063360
	lduba	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000079
!	Randomly selected nop
	nop
!	Mem[0000000010001410] = 000000ff, %l7 = 0000000000000057
	lduha	[%i0+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041410] = 00000000, %f6  = a0f505ff
	lda	[%i1+%o5]0x89,%f6 	! %f6 = 00000000
!	Code Fragment 3, seed = 174455
p0_fragment_7:
!	%l0 = be9a0a9f12fb5dec
	setx	0xd79c2dd1a938536e,%g7,%l0 ! %l0 = d79c2dd1a938536e
!	%l1 = 0c47c42acbe49f37
	setx	0x9ad6654408df4519,%g7,%l1 ! %l1 = 9ad6654408df4519
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d79c2dd1a938536e
	setx	0x2ee5b95e97f522d4,%g7,%l0 ! %l0 = 2ee5b95e97f522d4
!	%l1 = 9ad6654408df4519
	setx	0x377ad0f216c36f9f,%g7,%l1 ! %l1 = 377ad0f216c36f9f
p0_fragment_7_end:

p0_label_55:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[00000000300c1410] = 56000000
	stba	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 56000000
!	%f5  = 5c875c00, Mem[0000000030141400] = 50b941ff
	sta	%f5 ,[%i5+%g0]0x89	! Mem[0000000030141400] = 5c875c00
!	%f0  = ff00bf20 00000062, %l1 = 377ad0f216c36f9f
!	Mem[0000000030081410] = 27a6e0c050b941ff
	add	%i2,0x010,%g1
	stda	%f0,[%g1+%l1]ASI_PST8_S ! Mem[0000000030081410] = ffa6e02000000062
!	%l3 = 0000000000000079, Mem[000000001004142b] = 01f0d9e6
	stb	%l3,[%i1+0x02b]		! Mem[0000000010041428] = 01f0d979
!	Mem[00000000100c1410] = ff5dd265, %l2 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%l2 = 000000ff, %l3 = 00000079, Mem[0000000010181428] = e557ba48 00000000
	std	%l2,[%i6+0x028]		! Mem[0000000010181428] = 000000ff 00000079
!	%f10 = bf94f237, %f4  = 7da03b0d, %f10 = bf94f237 868a285e
	fsmuld	%f10,%f4 ,%f10		! %f10 = c7b74e6f 70be72c0
!	%f28 = 00000000 5e610975, Mem[0000000010081410] = 0bb68576 00000000
	stda	%f28,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000 5e610975
!	%l2 = 000000ff, %l3 = 00000079, Mem[0000000030181410] = 646b0e6d 1fe9b8ff
	stda	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff 00000079
!	Mem[0000000021800140] = 128689c0, %l1 = 377ad0f216c36f9f
	ldstub	[%o3+0x140],%l1		! %l1 = 0000000000000012

p0_label_56:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff000000359799fc, %l2 = 00000000000000ff
	ldxa	[%i0+%o4]0x80,%l2	! %l2 = ff000000359799fc
!	Mem[0000000020800000] = 22cca840, %l4 = 0000000000000000, %asi = 80
	lduha	[%o1+0x000]%asi,%l4	! %l4 = 00000000000022cc
!	Mem[0000000030141410] = ff00bf20, %l3 = 0000000000000079
	ldsba	[%i5+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	%l4 = 000022cc, %l5 = 000057ff, Mem[0000000010181400] = 55d171b0 65d25d01, %asi = 80
	stda	%l4,[%i6+0x000]%asi	! Mem[0000000010181400] = 000022cc 000057ff
!	%f12 = 352cff11 30305656, Mem[0000000030081408] = 3ce87ae4 27a6e0c0
	stda	%f12,[%i2+%o4]0x81	! Mem[0000000030081408] = 352cff11 30305656
!	Mem[00000000211c0001] = 57ff38a0, %l1 = 0000000000000012
	ldub	[%o2+0x001],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030001410] = 6b00303034d3a4ba, %l4 = 00000000000022cc
	ldxa	[%i0+%o5]0x89,%l4	! %l4 = 6b00303034d3a4ba
!	Mem[0000000030141410] = ff00bf20 00000062, %l0 = 97f522d4, %l1 = 000000ff
	ldda	[%i5+%o5]0x81,%l0	! %l0 = 00000000ff00bf20 0000000000000062
!	Mem[0000000030001408] = 21428003 a1485ea7, %l2 = 359799fc, %l3 = ffffffff
	ldda	[%i0+%o4]0x81,%l2	! %l2 = 0000000021428003 00000000a1485ea7
!	Mem[0000000030041410] = 00000000, %l6 = 0000000000000000
	lduba	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000000

p0_label_57:
!	Starting 10 instruction Store Burst
!	%f20 = ffd25dff 00000000, %l5 = 00000000000057ff
!	Mem[0000000010081428] = 4255641c7662123d
	add	%i2,0x028,%g1
	stda	%f20,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010081428] = 00000000ff5dd2ff
!	Mem[0000000010041408] = be7462ff, %l1 = 0000000000000062
	ldstuba	[%i1+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%l0 = ff00bf20, %l1 = 000000ff, Mem[0000000010141400] = bf200000 25aeba1b
	stda	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = ff00bf20 000000ff
!	%l0 = 00000000ff00bf20, Mem[00000000218000c0] = 58112960, %asi = 80
	stha	%l0,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = bf202960
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010141438] = 44665932 6b9e0d3b
	std	%l6,[%i5+0x038]		! Mem[0000000010141438] = 00000000 000000ff
!	%l0 = ff00bf20, %l1 = 000000ff, Mem[0000000030101408] = 44000000 37b19202
	stda	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = ff00bf20 000000ff
!	Code Fragment 3, seed = 267076
p0_fragment_8:
!	%l0 = 00000000ff00bf20
	setx	0x242e6ca1bc216206,%g7,%l0 ! %l0 = 242e6ca1bc216206
!	%l1 = 00000000000000ff
	setx	0x5ed8bac0a790f031,%g7,%l1 ! %l1 = 5ed8bac0a790f031
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 242e6ca1bc216206
	setx	0xa22349a419a6c26c,%g7,%l0 ! %l0 = a22349a419a6c26c
!	%l1 = 5ed8bac0a790f031
	setx	0x41bcfda701ecdbb7,%g7,%l1 ! %l1 = 41bcfda701ecdbb7
p0_fragment_8_end:
!	Mem[0000000030041400] = bf200000, %l7 = 00000000000000ff
	ldstuba	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041400] = b071d155, %l2 = 0000000021428003
	ldstub	[%i1+%g0],%l2		! %l2 = 00000000000000b0
!	Mem[0000000010041408] = ff6274be, %l3 = 00000000a1485ea7
	swapa	[%i1+%o4]0x80,%l3	! %l3 = 00000000ff6274be

p0_label_58:
!	Starting 10 instruction Load Burst
!	Mem[00000000218000c0] = bf202960, %l5 = 00000000000057ff, %asi = 80
	ldsha	[%o3+0x0c0]%asi,%l5	! %l5 = ffffffffffffbf20
!	Mem[0000000010101414] = 41cb61db, %l4 = 6b00303034d3a4ba, %asi = 80
	ldsha	[%i4+0x014]%asi,%l4	! %l4 = 00000000000041cb
!	Mem[0000000030081408] = 352cff11, %l1 = 41bcfda701ecdbb7
	ldsba	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000035
!	Mem[000000001000143d] = 41cb61db, %l6 = 0000000000000000, %asi = 80
	ldsba	[%i0+0x03d]%asi,%l6	! %l6 = ffffffffffffffcb
!	Mem[0000000030001400] = c70000ff, %l2 = 00000000000000b0
	ldsba	[%i0+%g0]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000218001c0] = 5ac7da20, %l4 = 00000000000041cb, %asi = 80
	lduha	[%o3+0x1c0]%asi,%l4	! %l4 = 0000000000005ac7
!	Mem[0000000030081400] = e4540000, %l7 = 0000000000000000
	lduba	[%i2+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001400] = ff0000c7, %l3 = 00000000ff6274be
	lduwa	[%i0+%g0]0x81,%l3	! %l3 = 00000000ff0000c7
!	Mem[0000000030001408] = 21428003, %l3 = 00000000ff0000c7
	ldsha	[%i0+%o4]0x81,%l3	! %l3 = 0000000000002142
!	Mem[0000000010101410] = 00000000, %l7 = 0000000000000000
	ldsba	[%i4+%o5]0x80,%l7	! %l7 = 0000000000000000

p0_label_59:
!	Starting 10 instruction Store Burst
!	%l4 = 00005ac7, %l5 = ffffbf20, Mem[0000000030141410] = ff00bf20 00000062
	stda	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 00005ac7 ffffbf20
!	%l5 = ffffffffffffbf20, immd = fffffffffffff3b8, %l0  = a22349a419a6c26c
	mulx	%l5,-0xc48,%l0		! %l0 = 00000000031cbf00
!	%f1  = 00000062, Mem[00000000100c1400] = ff003030
	sta	%f1 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000062
!	%f8  = 654cffba 155222e5, %l5 = ffffffffffffbf20
!	Mem[0000000010081418] = 41893f3aa0de199e
	add	%i2,0x018,%g1
	stda	%f8,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010081418] = 41893f3aa0ff199e
!	%l3 = 0000000000002142, Mem[00000000300c1408] = 5c000000
	stwa	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00002142
!	Mem[0000000010101408] = 24000000, %l6 = 00000000ffffffcb
	swapa	[%i4+%o4]0x88,%l6	! %l6 = 0000000024000000
!	%f10 = c7b74e6f 70be72c0, %l7 = 0000000000000000
!	Mem[0000000010101418] = 00ff00000000006c
	add	%i4,0x018,%g1
	stda	%f10,[%g1+%l7]ASI_PST32_P ! Mem[0000000010101418] = 00ff00000000006c
!	Mem[0000000021800180] = 12ec73f0, %l4 = 0000000000005ac7
	ldstuba	[%o3+0x180]%asi,%l4	! %l4 = 0000000000000012
!	%l0 = 00000000031cbf00, Mem[0000000010001400] = 00000000000000ff
	stxa	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000031cbf00
!	%l6 = 24000000, %l7 = 00000000, Mem[00000000100c1408] = 79106644 cc57ffff
	stda	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 24000000 00000000

p0_label_60:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 57ff38a0, %l4 = 0000000000000012, %asi = 80
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = 00000000000057ff
!	Mem[0000000030141400] = 5c875c00, %f8  = 654cffba
	lda	[%i5+%g0]0x89,%f8 	! %f8 = 5c875c00
!	Mem[0000000030041408] = 43de5ac7, %l1 = 0000000000000035
	ldsha	[%i1+%o4]0x89,%l1	! %l1 = 0000000000005ac7
!	Mem[0000000030041410] = 00000000 00000000, %l6 = 24000000, %l7 = 00000000
	ldda	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010041410] = 65d2000000004901, %l0 = 00000000031cbf00
	ldxa	[%i1+%o5]0x80,%l0	! %l0 = 65d2000000004901
!	Mem[000000001004142e] = 7ad08a9f, %l0 = 65d2000000004901, %asi = 80
	ldsba	[%i1+0x02e]%asi,%l0	! %l0 = ffffffffffffff8a
!	Mem[0000000010181408] = 00000007 2e626607, %l0 = ffffff8a, %l1 = 00005ac7
	ldda	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000007 000000002e626607
!	Mem[0000000030081408] = 352cff11, %l6 = 0000000000000000
	ldsha	[%i2+%o4]0x81,%l6	! %l6 = 000000000000352c
!	Mem[0000000021800180] = ffec73f0, %l0 = 0000000000000007
	ldsh	[%o3+0x180],%l0		! %l0 = ffffffffffffffec
!	Mem[0000000010001408] = ff000000, %l6 = 000000000000352c
	lduwa	[%i0+%o4]0x80,%l6	! %l6 = 00000000ff000000

p0_label_61:
!	Starting 10 instruction Store Burst
!	%l0 = ffffffec, %l1 = 2e626607, Mem[0000000010101400] = 12b7f0f0 2ca65741
	stda	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = ffffffec 2e626607
!	Mem[0000000010001400] = 00bf1c03, %l3 = 0000000000002142
	ldstuba	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
!	%l5 = ffffffffffffbf20, imm = fffffffffffff791, %l3 = 0000000000000000
	addc	%l5,-0x86f,%l3		! %l3 = ffffffffffffb6b1
!	Mem[0000000020800040] = 5ac7b270, %l3 = ffffffffffffb6b1
	ldstuba	[%o1+0x040]%asi,%l3	! %l3 = 000000000000005a
!	%l0 = ffffffec, %l1 = 2e626607, Mem[0000000030041400] = bf2000ff 62000000
	stda	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffffec 2e626607
!	%l6 = 00000000ff000000, Mem[0000000010001400] = ffbf1c03
	stha	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 00001c03
!	%l6 = 00000000ff000000, Mem[00000000100c1408] = 00000024
	stha	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	%l4 = 00000000000057ff, Mem[00000000100c1400] = 62000000
	stba	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 620000ff
!	Mem[0000000010001410] = 000000ff, %l6 = 00000000ff000000
	swapa	[%i0+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	%l5 = ffffffffffffbf20, Mem[0000000020800000] = 22cca840
	sth	%l5,[%o1+%g0]		! Mem[0000000020800000] = bf20a840

p0_label_62:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000030101400] = c7000000 00000000 20bf00ff ff000000
!	Mem[0000000030101410] = bf94d2ff 646bf56d f7d5ecaa 1169c7d3
!	Mem[0000000030101420] = 42eea8b8 6650b2e9 7c7701b6 552af12f
!	Mem[0000000030101430] = 418fa324 4ec45025 34d6b482 4603a94b
	ldda	[%i4+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030101400
!	%f18 = 0c97b5f5 2e626607, %f21 = 00000000
	fxtos	%f18,%f21		! %f21 = 5d497b5f
!	Mem[0000000010041408] = a1485ea70c97b5f5, %l3 = 000000000000005a, %asi = 80
	ldxa	[%i1+0x008]%asi,%l3	! %l3 = a1485ea70c97b5f5
!	%l7 = 0000000000000000, imm = fffffffffffff0da, %l7 = 0000000000000000
	and	%l7,-0xf26,%l7		! %l7 = 0000000000000000
!	Mem[0000000030041400] = ecffffff0766622e, %l7 = 0000000000000000
	ldxa	[%i1+%g0]0x81,%l7	! %l7 = ecffffff0766622e
!	Mem[0000000010141400] = ff00bf20, %f27 = 00000000
	lda	[%i5+%g0]0x80,%f27	! %f27 = ff00bf20
!	Mem[0000000010181408] = 0766622e07000000, %f20 = ffd25dff 5d497b5f
	ldda	[%i6+%o4]0x88,%f20	! %f20 = 0766622e 07000000
!	%l0 = ffffffffffffffec, %l3 = a1485ea70c97b5f5, %l7 = ecffffff0766622e
	or	%l0,%l3,%l7		! %l7 = fffffffffffffffd
!	Mem[00000000211c0001] = 57ff38a0, %l5 = ffffffffffffbf20
	ldsb	[%o2+0x001],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010181432] = 00000000, %l5 = ffffffffffffffff
	ldub	[%i6+0x032],%l5		! %l5 = 0000000000000000

p0_label_63:
!	Starting 10 instruction Store Burst
!	%l7 = fffffffffffffffd, Mem[00000000300c1400] = 66770000
	stwa	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = fffffffd
!	Mem[0000000010001408] = 000000ff, %l7 = fffffffffffffffd
	ldstuba	[%i0+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000030041400] = ecffffff0766622e
	stxa	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000000000ff
!	%f2  = 20bf00ff ff000000, Mem[0000000010041408] = a1485ea7 0c97b5f5
	stda	%f2 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 20bf00ff ff000000
!	%f24 = 43811d48, Mem[0000000030081400] = 000054e4
	sta	%f24,[%i2+%g0]0x81	! Mem[0000000030081400] = 43811d48
!	Mem[0000000010101437] = 1d11ffb5, %l2 = ffffffffffffffff
	ldstuba	[%i4+0x037]%asi,%l2	! %l2 = 00000000000000b5
!	Mem[0000000020800041] = ffc7b270, %l2 = 00000000000000b5
	ldstub	[%o1+0x041],%l2		! %l2 = 00000000000000c7
!	Mem[0000000030001400] = ff0000c7, %l4 = 00000000000057ff
	swapa	[%i0+%g0]0x81,%l4	! %l4 = 00000000ff0000c7
!	%f12 = 418fa324 4ec45025, Mem[00000000100c1400] = 620000ff ffb8e91f
	stda	%f12,[%i3+%g0]0x88	! Mem[00000000100c1400] = 418fa324 4ec45025
!	Mem[0000000030081400] = 481d8143, %l6 = 00000000000000ff
	swapa	[%i2+%g0]0x89,%l6	! %l6 = 00000000481d8143

p0_label_64:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141430] = 07b95a54, %l4 = 00000000ff0000c7, %asi = 80
	lduha	[%i5+0x030]%asi,%l4	! %l4 = 00000000000007b9
!	Mem[0000000010141400] = ff00bf20000000ff, %f18 = 0c97b5f5 2e626607
	ldda	[%i5+%g0]0x80,%f18	! %f18 = ff00bf20 000000ff
!	Mem[0000000010181410] = ffd25dff00000000, %f28 = 00000000 5e610975
	ldd	[%i6+%o5],%f28		! %f28 = ffd25dff 00000000
!	Mem[0000000030081408] = 352cff11, %l5 = 0000000000000000
	lduwa	[%i2+%o4]0x81,%l5	! %l5 = 00000000352cff11
!	Mem[0000000010101408] = 47a29f39 ffffffcb, %l0 = ffffffec, %l1 = 2e626607
	ldda	[%i4+%o4]0x88,%l0	! %l0 = 00000000ffffffcb 0000000047a29f39
!	Mem[0000000030001410] = baa4d334, %l0 = 00000000ffffffcb
	ldsba	[%i0+%o5]0x81,%l0	! %l0 = ffffffffffffffba
!	Mem[0000000010041408] = ff00bf20, %l3 = a1485ea70c97b5f5
	ldsha	[%i1+%o4]0x88,%l3	! %l3 = ffffffffffffbf20
!	Mem[0000000020800040] = ffffb270, %l7 = 00000000000000ff, %asi = 80
	ldsha	[%o1+0x040]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041418] = 33c1bdda 7f78d643, %l4 = 000007b9, %l5 = 352cff11, %asi = 80
	ldda	[%i1+0x018]%asi,%l4	! %l4 = 0000000033c1bdda 000000007f78d643
!	Mem[0000000030081410] = ffa6e020, %l2 = 00000000000000c7
	ldsba	[%i2+%o5]0x81,%l2	! %l2 = ffffffffffffffff

p0_label_65:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 00000000, %l3 = ffffffffffffbf20
	ldstuba	[%i2+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%l5 = 000000007f78d643, %l4 = 0000000033c1bdda, %l7 = ffffffffffffffff
	addc	%l5,%l4,%l7		! %l7 = 00000000b33a941d
!	Mem[0000000010181408] = 00000007, %l0 = 00000000ffffffba
	swapa	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000007
!	%f28 = ffd25dff 00000000, Mem[0000000030181410] = 000000ff 00000079
	stda	%f28,[%i6+%o5]0x89	! Mem[0000000030181410] = ffd25dff 00000000
!	%l6 = 00000000481d8143, Mem[00000000218000c0] = bf202960, %asi = 80
	stha	%l6,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 81432960
!	%l2 = ffffffffffffffff, Mem[0000000010181400] = 000022cc000057ff
	stxa	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = ffffffffffffffff
!	%f4  = bf94d2ff 646bf56d, %l5 = 000000007f78d643
!	Mem[0000000030041418] = a0f505ff37f294bf
	add	%i1,0x018,%g1
	stda	%f4,[%g1+%l5]ASI_PST8_S ! Mem[0000000030041418] = a09405ff37f2f56d
!	%f24 = 43811d48 20cf3b39, Mem[0000000010041400] = ff71d155 2f39b6a1
	stda	%f24,[%i1+%g0]0x80	! Mem[0000000010041400] = 43811d48 20cf3b39
!	%l7 = 00000000b33a941d, Mem[0000000030141410] = 00005ac7ffffbf20
	stxa	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000b33a941d
!	%l0 = 0000000000000007, Mem[0000000010001410] = 000000ff0d3ba07d
	stxa	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000007

p0_label_66:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = bf94d2ff646bf56d, %l6 = 00000000481d8143
	ldxa	[%i4+%o5]0x81,%l6	! %l6 = bf94d2ff646bf56d
!	Mem[00000000100c1400] = 2550c44e, %l3 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000025
!	Mem[0000000010101408] = cbffffff399fa247, %l3 = 0000000000000025
	ldxa	[%i4+%o4]0x80,%l3	! %l3 = cbffffff399fa247
!	Mem[0000000010001410] = 0000000000000007, %f4  = bf94d2ff 646bf56d
	ldda	[%i0+%o5]0x80,%f4 	! %f4  = 00000000 00000007
!	Mem[00000000100c143c] = 00000065, %l0 = 0000000000000007
	lduw	[%i3+0x03c],%l0		! %l0 = 0000000000000065
!	Mem[00000000100c1410] = ff5dd265, %l1 = 0000000047a29f39
	ldsba	[%i3+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030181408] = cbe49f37c75ade43, %f8  = 42eea8b8 6650b2e9
	ldda	[%i6+%o4]0x81,%f8 	! %f8  = cbe49f37 c75ade43
!	Mem[000000001000140e] = 359799fc, %l4 = 0000000033c1bdda
	ldub	[%i0+0x00e],%l4		! %l4 = 0000000000000099
!	Mem[00000000201c0000] = 00571a10, %l2 = ffffffffffffffff, %asi = 80
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = 0000000000000057
!	Mem[0000000010181410] = ffd25dff00000000, %l2 = 0000000000000057
	ldx	[%i6+%o5],%l2		! %l2 = ffd25dff00000000

p0_label_67:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 00000000, %l3 = 00000000399fa247
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = ff000000, %l6 = 00000000646bf56d
	swapa	[%i0+%o4]0x80,%l6	! %l6 = 00000000ff000000
!	%l6 = ff000000, %l7 = b33a941d, Mem[0000000030001410] = baa4d334 3030006b
	stda	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = ff000000 b33a941d
!	%l6 = ff000000, %l7 = b33a941d, Mem[0000000010141410] = 43000000 43de5ac7
	stda	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = ff000000 b33a941d
!	%f6  = f7d5ecaa 1169c7d3, %l6 = 00000000ff000000
!	Mem[0000000030141430] = 18e2cd842ffcd505
	add	%i5,0x030,%g1
	stda	%f6,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030141430] = 18e2cd842ffcd505
!	Mem[0000000010001408] = 646bf56d, %l4 = 0000000000000099
	ldstuba	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000064
!	%l4 = 0000000000000064, Mem[0000000030001410] = ff000000
	stha	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 00640000
!	%l0 = 0000000000000065, Mem[0000000030181408] = cbe49f37
	stwa	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000065
!	Mem[0000000010101408] = cbffffff, %l2 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l2	! %l2 = 00000000cbffffff
!	%l7 = 00000000b33a941d, Mem[0000000010041408] = 20bf00ff, %asi = 80
	stwa	%l7,[%i1+0x008]%asi	! Mem[0000000010041408] = b33a941d

p0_label_68:
!	Starting 10 instruction Load Burst
!	%f24 = 43811d48, %f8  = cbe49f37
	fcmps	%fcc0,%f24,%f8 		! %fcc0 = 2
!	Mem[00000000100c1400] = 2550c44e, %l3 = 0000000000000000
	lduwa	[%i3+%g0]0x80,%l3	! %l3 = 000000002550c44e
!	Mem[0000000030141410] = 00000000, %l6 = 00000000ff000000
	ldsha	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101410] = 0000000041cb61db, %l5 = 000000007f78d643
	ldxa	[%i4+%o5]0x80,%l5	! %l5 = 0000000041cb61db
!	Mem[0000000010141410] = 000000ff, %l7 = 00000000b33a941d
	ldswa	[%i5+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1410] = f5b5970c65d25dff, %f6  = f7d5ecaa 1169c7d3
	ldda	[%i3+%o5]0x88,%f6 	! %f6  = f5b5970c 65d25dff
!	%f24 = 43811d48 20cf3b39, %l7 = 00000000000000ff
!	Mem[0000000030001418] = 6366bc387aacce2e
	add	%i0,0x018,%g1
	stda	%f24,[%g1+%l7]ASI_PST8_S ! Mem[0000000030001418] = 43811d4820cf3b39
!	Mem[0000000010101410] = 00000000, %f7  = 65d25dff
	lda	[%i4+%o5]0x88,%f7 	! %f7 = 00000000
!	Mem[00000000100c1406] = 24a38f41, %l3 = 000000002550c44e
	ldsh	[%i3+0x006],%l3		! %l3 = ffffffffffff8f41
!	Mem[0000000010001400] = 00000000031c0000, %l5 = 0000000041cb61db
	ldxa	[%i0+%g0]0x88,%l5	! %l5 = 00000000031c0000

p0_label_69:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = be7462ff, %l5 = 00000000031c0000
	swapa	[%i5+%o4]0x89,%l5	! %l5 = 00000000be7462ff
!	%l6 = 0000000000000000, Mem[00000000100c1418] = 69bd309aae7d56ff, %asi = 80
	stxa	%l6,[%i3+0x018]%asi	! Mem[00000000100c1418] = 0000000000000000
!	Code Fragment 4, seed = 975579
p0_fragment_9:
!	%l0 = 0000000000000065
	setx	0xb33ae67c74c12c4e,%g7,%l0 ! %l0 = b33ae67c74c12c4e
!	%l1 = ffffffffffffffff
	setx	0x15252e8251aa47f9,%g7,%l1 ! %l1 = 15252e8251aa47f9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b33ae67c74c12c4e
	setx	0xd6a1d292a5322fb4,%g7,%l0 ! %l0 = d6a1d292a5322fb4
!	%l1 = 15252e8251aa47f9
	setx	0x175abedf2e1c667f,%g7,%l1 ! %l1 = 175abedf2e1c667f
p0_fragment_9_end:
!	Mem[0000000010081408] = 768500ff, %l5 = 00000000be7462ff
	ldstuba	[%i2+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1408] = 00002142, %l5 = 00000000000000ff
	ldstuba	[%i3+%o4]0x81,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (12)
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000030101410] = ffd294bf 6df56b64
	stda	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000 000000ff
!	Mem[0000000010041430] = 590830d46d2224a7, %l2 = 00000000cbffffff, %l5 = 0000000000000000
	add	%i1,0x30,%g1
	casxa	[%g1]0x80,%l2,%l5	! %l5 = 590830d46d2224a7
!	Mem[0000000010141410] = ff000000, %l3 = ffffffffffff8f41
	ldstuba	[%i5+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1410] = 65d25dff, %l0 = d6a1d292a5322fb4
	ldstuba	[%i3+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	%l1 = 175abedf2e1c667f, Mem[0000000010101410] = 00000000
	stwa	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = 2e1c667f

p0_label_70:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 0000d265, %l7 = 00000000000000ff
	ldswa	[%i1+%o5]0x88,%l7	! %l7 = 000000000000d265
!	%l0 = 00000000000000ff, %l3 = 00000000000000ff, %y  = 359799fc
	sdiv	%l0,%l3,%l2		! %l2 = 000000007fffffff
	mov	%l0,%y			! %y = 000000ff
!	Mem[0000000030001408] = 03804221, %f19 = 000000ff
	lda	[%i0+%o4]0x89,%f19	! %f19 = 03804221
!	Mem[0000000010001408] = ff6bf56d359799fc, %l7 = 000000000000d265
	ldxa	[%i0+%o4]0x80,%l7	! %l7 = ff6bf56d359799fc
!	Mem[0000000010081408] = 768500ff, %l3 = 00000000000000ff
	ldswa	[%i2+%o4]0x88,%l3	! %l3 = 00000000768500ff
!	Mem[00000000100c1410] = f5b5970c 65d25dff, %l0 = 000000ff, %l1 = 2e1c667f
	ldda	[%i3+%o5]0x88,%l0	! %l0 = 0000000065d25dff 00000000f5b5970c
!	Mem[0000000010101408] = 00000000399fa247, %l4 = 0000000000000064
	ldxa	[%i4+%o4]0x80,%l4	! %l4 = 00000000399fa247
!	Mem[0000000030081408] = 352cff11 30305656, %l0 = 65d25dff, %l1 = f5b5970c
	ldda	[%i2+%o4]0x81,%l0	! %l0 = 00000000352cff11 0000000030305656
!	Mem[0000000010101410] = 7f661c2e, %l3 = 00000000768500ff
	lduha	[%i4+%o5]0x80,%l3	! %l3 = 0000000000007f66
!	Mem[0000000010001408] = fc9997356df56bff, %f8  = cbe49f37 c75ade43
	ldda	[%i0+%o4]0x88,%f8 	! %f8  = fc999735 6df56bff

p0_label_71:
!	Starting 10 instruction Store Burst
!	%l2 = 7fffffff, %l3 = 00007f66, Mem[0000000010101410] = 2e1c667f db61cb41
	stda	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 7fffffff 00007f66
!	%l4 = 00000000399fa247, Mem[0000000030081400] = ff000000
	stha	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = a2470000
!	Mem[0000000010001410] = 00000000, %l1 = 30305656, %l2 = 7fffffff
	add	%i0,0x10,%g1
	casa	[%g1]0x80,%l1,%l2	! %l2 = 0000000000000000
!	Mem[000000001000142f] = 37f294bf, %l1 = 0000000030305656
	ldstuba	[%i0+0x02f]%asi,%l1	! %l1 = 00000000000000bf
!	Mem[0000000010001410] = 00000000, %l1 = 00000000000000bf
	ldstuba	[%i0+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%f13 = 4ec45025, Mem[0000000030041410] = 00000000
	sta	%f13,[%i1+%o5]0x81	! Mem[0000000030041410] = 4ec45025
!	%f16 = ff003030 65d25d01, %l6 = 0000000000000000
!	Mem[0000000030081400] = a2470000054a50f1
	stda	%f16,[%i2+%l6]ASI_PST32_S ! Mem[0000000030081400] = a2470000054a50f1
!	Code Fragment 4, seed = 310379
p0_fragment_10:
!	%l0 = 00000000352cff11
	setx	0xb04a91abbff0efce,%g7,%l0 ! %l0 = b04a91abbff0efce
!	%l1 = 0000000000000000
	setx	0x7ee81cd343b4b379,%g7,%l1 ! %l1 = 7ee81cd343b4b379
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b04a91abbff0efce
	setx	0x824c78819a36c334,%g7,%l0 ! %l0 = 824c78819a36c334
!	%l1 = 7ee81cd343b4b379
	setx	0x446e6483de22a1ff,%g7,%l1 ! %l1 = 446e6483de22a1ff
p0_fragment_10_end:
!	Code Fragment 4, seed = 349608
p0_fragment_11:
!	%l0 = 824c78819a36c334
	setx	0x495dd110985af2e6,%g7,%l0 ! %l0 = 495dd110985af2e6
!	%l1 = 446e6483de22a1ff
	setx	0xbc16c2587a8f2b11,%g7,%l1 ! %l1 = bc16c2587a8f2b11
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 495dd110985af2e6
	setx	0xd94c786e0511874c,%g7,%l0 ! %l0 = d94c786e0511874c
!	%l1 = bc16c2587a8f2b11
	setx	0xeb5e29417c660a97,%g7,%l1 ! %l1 = eb5e29417c660a97
p0_fragment_11_end:
!	%l3 = 0000000000007f66, Mem[0000000010101408] = 00000000
	stwa	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = 00007f66

p0_label_72:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141414] = b33a941d, %f5  = 00000007
	lda	[%i5+0x014]%asi,%f5 	! %f5 = b33a941d
!	Mem[0000000010081408] = 768500ff, %f21 = 07000000
	lda	[%i2+%o4]0x88,%f21	! %f21 = 768500ff
!	Mem[00000000201c0000] = 00571a10, %l0 = d94c786e0511874c
	ldsb	[%o0+%g0],%l0		! %l0 = 0000000000000000
!	Mem[0000000030181400] = 37ff57cc, %l5 = 590830d46d2224a7
	lduba	[%i6+%g0]0x81,%l5	! %l5 = 0000000000000037
!	Mem[00000000100c1408] = 00000000 00000000, %l6 = 00000000, %l7 = 359799fc
	ldda	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010041419] = 33c1bdda, %l3 = 0000000000007f66
	ldub	[%i1+0x019],%l3		! %l3 = 00000000000000c1
!	Mem[0000000010141420] = a724226d, %l6 = 0000000000000000, %asi = 80
	ldswa	[%i5+0x020]%asi,%l6	! %l6 = ffffffffa724226d
!	Mem[0000000010181410] = ffd25dff, %f20 = 0766622e
	lda	[%i6+%o5]0x80,%f20	! %f20 = ffd25dff
!	Mem[0000000030001400] = ff570000, %l1 = eb5e29417c660a97
	lduba	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = 2550c44e 24a38f41, %l2 = 00000000, %l3 = 000000c1
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 000000002550c44e 0000000024a38f41

p0_label_73:
!	Starting 10 instruction Store Burst
!	%l6 = a724226d, %l7 = 00000000, Mem[0000000010001408] = ff6bf56d 359799fc
	stda	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = a724226d 00000000
!	%l7 = 0000000000000000, Mem[0000000030041408] = 43de5ac7
	stha	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = 43de0000
!	Mem[0000000010081400] = ff563030, %l6 = 00000000a724226d
	swapa	[%i2+%g0]0x80,%l6	! %l6 = 00000000ff563030
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010181408] = baffffff 0766622e
	stda	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000 00000000
!	Mem[0000000010041400] = 43811d48 20cf3b39 b33a941d ff000000
!	%f16 = ff003030 65d25d01 ff00bf20 03804221
!	%f20 = ffd25dff 768500ff 34d3a4ba 1b5555a3
!	%f24 = 43811d48 20cf3b39 e557ba48 ff00bf20
!	%f28 = ffd25dff 00000000 79647692 25e1d91b
	stda	%f16,[%i1+%g0]ASI_COMMIT_P	! Block Store to 0000000010041400
!	%l5 = 0000000000000037, Mem[0000000010001410] = ff00000000000007
	stxa	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000037
!	Mem[0000000030101410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000020800040] = ffffb270, %asi = 80
	stha	%l7,[%o1+0x040]%asi	! Mem[0000000020800040] = 0000b270
!	%l3 = 0000000024a38f41, Mem[0000000010001408] = 6d2224a7
	stwa	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 24a38f41
!	Mem[0000000020800040] = 0000b270, %l3 = 0000000024a38f41
	ldstub	[%o1+0x040],%l3		! %l3 = 0000000000000000

p0_label_74:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00000065, %f14 = 34d6b482
	lda	[%i6+%o4]0x81,%f14	! %f14 = 00000065
!	Mem[000000001018142d] = 00000079, %l4 = 00000000399fa247
	ldub	[%i6+0x02d],%l4		! %l4 = 0000000000000000
!	Mem[00000000201c0000] = 00571a10, %l0 = 0000000000000000, %asi = 80
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 0000000000000057
!	Mem[0000000030101408] = ff00bf20, %l2 = 000000002550c44e
	ldswa	[%i4+%o4]0x89,%l2	! %l2 = ffffffffff00bf20
!	Mem[00000000100c1410] = f5b5970c65d25dff, %f12 = 418fa324 4ec45025
	ldda	[%i3+%o5]0x88,%f12	! %f12 = f5b5970c 65d25dff
!	Code Fragment 3, seed = 548533
p0_fragment_12:
!	%l0 = 0000000000000057
	setx	0xce64a7c8133a477e,%g7,%l0 ! %l0 = ce64a7c8133a477e
!	%l1 = 0000000000000000
	setx	0xdc35cd37f15c3c29,%g7,%l1 ! %l1 = dc35cd37f15c3c29
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ce64a7c8133a477e
	setx	0xb43e9b959479ace4,%g7,%l0 ! %l0 = b43e9b959479ace4
!	%l1 = dc35cd37f15c3c29
	setx	0x58d3a6962e771caf,%g7,%l1 ! %l1 = 58d3a6962e771caf
p0_fragment_12_end:
!	Mem[0000000010101408] = 00007f66, %l7 = 0000000000000000
	ldsba	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000066
!	Mem[0000000030081410] = 62000000 20e0a6ff, %l4 = 00000000, %l5 = 00000037
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 0000000020e0a6ff 0000000062000000
!	Mem[0000000030041400] = 00000000, %l5 = 0000000062000000
	lduwa	[%i1+%g0]0x81,%l5	! %l5 = 0000000000000000
!	%f14 = 00000065, %f1  = 00000000, %f0  = c7000000 00000000
	fsmuld	%f14,%f1 ,%f0 		! %f0  = 00000000 00000000

p0_label_75:
!	Starting 10 instruction Store Burst
!	%l2 = ff00bf20, %l3 = 00000000, Mem[0000000010181408] = 00000000 00000000
	std	%l2,[%i6+%o4]		! Mem[0000000010181408] = ff00bf20 00000000
!	Mem[0000000010181404] = ffffffff, %l5 = 00000000, %l6 = ff563030
	add	%i6,0x04,%g1
	casa	[%g1]0x80,%l5,%l6	! %l6 = 00000000ffffffff
!	%l4 = 20e0a6ff, %l5 = 00000000, Mem[0000000030081410] = 20e0a6ff 62000000
	stda	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 20e0a6ff 00000000
!	%f22 = 34d3a4ba 1b5555a3, Mem[0000000010101420] = 245f2488 ff679d79
	std	%f22,[%i4+0x020]	! Mem[0000000010101420] = 34d3a4ba 1b5555a3
!	Mem[0000000030081400] = a2470000 054a50f1 352cff11 30305656
!	%f16 = ff003030 65d25d01 ff00bf20 03804221
!	%f20 = ffd25dff 768500ff 34d3a4ba 1b5555a3
!	%f24 = 43811d48 20cf3b39 e557ba48 ff00bf20
!	%f28 = ffd25dff 00000000 79647692 25e1d91b
	stda	%f16,[%i2+%g0]ASI_BLK_S	! Block Store to 0000000030081400
!	Mem[0000000010001408] = 418fa324, %l2 = ffffffffff00bf20
	ldstuba	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000041
!	Mem[0000000030141410] = 00000000, %l5 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (13)
!	%l3 = 0000000000000000, Mem[0000000010041423] = 43811d48
	stb	%l3,[%i1+0x023]		! Mem[0000000010041420] = 43811d00
!	%l4 = 0000000020e0a6ff, Mem[0000000010041408] = ff00bf20
	stba	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = ff00bf20
!	Mem[00000000300c1408] = 422100ff, %l6 = 00000000ffffffff
	swapa	[%i3+%o4]0x89,%l6	! %l6 = 00000000422100ff

p0_label_76:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ff00bf20, %l6 = 00000000422100ff
	lduha	[%i1+%o4]0x80,%l6	! %l6 = 000000000000ff00
!	Mem[00000000201c0001] = 00571a10, %l3 = 0000000000000000, %asi = 80
	lduba	[%o0+0x001]%asi,%l3	! %l3 = 0000000000000057
!	Mem[0000000010081408] = 768500ff, %l7 = 0000000000000066
	lduwa	[%i2+%o4]0x88,%l7	! %l7 = 00000000768500ff
!	Mem[00000000211c0000] = 57ff38a0, %l2 = 0000000000000041
	ldsb	[%o2+%g0],%l2		! %l2 = 0000000000000057
!	Mem[0000000010001408] = 24a38fff, %l5 = 0000000000000000
	lduba	[%i0+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041437] = 00000000, %l2 = 0000000000000057
	ldub	[%i1+0x037],%l2		! %l2 = 0000000000000000
!	Code Fragment 3, seed = 387309
p0_fragment_13:
!	%l0 = b43e9b959479ace4
	setx	0x486fe501c305adbe,%g7,%l0 ! %l0 = 486fe501c305adbe
!	%l1 = 58d3a6962e771caf
	setx	0x87104ad707f7ce69,%g7,%l1 ! %l1 = 87104ad707f7ce69
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 486fe501c305adbe
	setx	0x581865c1bd5dab24,%g7,%l0 ! %l0 = 581865c1bd5dab24
!	%l1 = 87104ad707f7ce69
	setx	0x10efeae6d0a7c6ef,%g7,%l1 ! %l1 = 10efeae6d0a7c6ef
p0_fragment_13_end:
!	Mem[0000000010181420] = 43811d4820cf3b39, %l5 = 00000000000000ff, %asi = 80
	ldxa	[%i6+0x020]%asi,%l5	! %l5 = 43811d4820cf3b39
!	Mem[0000000010081418] = 41893f3a, %l6 = 000000000000ff00, %asi = 80
	ldsha	[%i2+0x018]%asi,%l6	! %l6 = 0000000000004189
!	Mem[0000000010081400] = 6d2224a7, %l3 = 0000000000000057
	lduba	[%i2+%g0]0x88,%l3	! %l3 = 00000000000000a7

p0_label_77:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 000000a7, Mem[0000000030101410] = ff000000 ff000000
	stda	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000 000000a7
!	%l5 = 43811d4820cf3b39, Mem[0000000030001410] = 00006400
	stba	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 00006439
!	Mem[0000000010041430] = ffd25dff00000000, %l3 = 00000000000000a7, %l4 = 0000000020e0a6ff
	add	%i1,0x30,%g1
	casxa	[%g1]0x80,%l3,%l4	! %l4 = ffd25dff00000000
!	%f22 = 34d3a4ba, Mem[0000000030081400] = ff003030
	sta	%f22,[%i2+%g0]0x81	! Mem[0000000030081400] = 34d3a4ba
!	%f20 = ffd25dff, Mem[0000000030041410] = 4ec45025
	sta	%f20,[%i1+%o5]0x81	! Mem[0000000030041410] = ffd25dff
!	Mem[00000000211c0000] = 57ff38a0, %l7 = 00000000768500ff
	ldstub	[%o2+%g0],%l7		! %l7 = 0000000000000057
!	Mem[0000000030181400] = cc57ff37, %l3 = 00000000000000a7
	swapa	[%i6+%g0]0x89,%l3	! %l3 = 00000000cc57ff37
!	Mem[0000000030001400] = 000057ff, %l7 = 0000000000000057
	ldstuba	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000000
!	%l2 = 0000000000000000, %l0 = 581865c1bd5dab24, %l4 = ffd25dff00000000
	andn	%l2,%l0,%l4		! %l4 = 0000000000000000
!	%f3  = ff000000, Mem[00000000100c1408] = 00000000
	sta	%f3 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff000000

p0_label_78:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800040] = 7785b900, %l4 = 0000000000000000
	ldsh	[%o3+0x040],%l4		! %l4 = 0000000000007785
!	Mem[00000000300c1400] = fffffffd 43de5ac7, %l2 = 00000000, %l3 = cc57ff37
	ldda	[%i3+%g0]0x81,%l2	! %l2 = 00000000fffffffd 0000000043de5ac7
!	Mem[00000000300c1408] = 00000000ffffffff, %l5 = 43811d4820cf3b39
	ldxa	[%i3+%o4]0x89,%l5	! %l5 = 00000000ffffffff
!	Mem[000000001008142c] = ff5dd2ff, %f11 = 552af12f
	ld	[%i2+0x02c],%f11	! %f11 = ff5dd2ff
!	Mem[0000000030041408] = 0000de432e106644, %f12 = f5b5970c 65d25dff
	ldda	[%i1+%o4]0x81,%f12	! %f12 = 0000de43 2e106644
!	Mem[0000000010181410] = 00000000ff5dd2ff, %l6 = 0000000000004189
	ldxa	[%i6+%o5]0x88,%l6	! %l6 = 00000000ff5dd2ff
!	Mem[0000000010041408] = ff00bf2003804221, %l0 = 581865c1bd5dab24
	ldxa	[%i1+%o4]0x80,%l0	! %l0 = ff00bf2003804221
!	Mem[00000000300c1408] = 00000000ffffffff, %f6  = f5b5970c 00000000
	ldda	[%i3+%o4]0x89,%f6 	! %f6  = 00000000 ffffffff
!	Mem[0000000010001432] = 09e53e74, %l4 = 0000000000007785, %asi = 80
	ldsba	[%i0+0x032]%asi,%l4	! %l4 = 000000000000003e
!	Mem[0000000030041400] = 00000000, %l5 = 00000000ffffffff
	ldswa	[%i1+%g0]0x81,%l5	! %l5 = 0000000000000000

p0_label_79:
!	Starting 10 instruction Store Burst
!	Mem[000000001014143c] = 000000ff, %l2 = fffffffd, %l6 = ff5dd2ff
	add	%i5,0x3c,%g1
	casa	[%g1]0x80,%l2,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041400] = 00000000, %l0 = ff00bf2003804221
	ldstuba	[%i1+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = 5c875c00, %l5 = 0000000000000000
	ldstuba	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041400] = 303000ff, %l7 = 0000000000000000
	ldstuba	[%i1+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081400] = a724226d, %l5 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l5	! %l5 = 00000000a724226d
!	%l6 = 00000000000000ff, Mem[0000000010081410] = ff0000005e610975
	stxa	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000000000ff
!	Mem[00000000100c1408] = ff000000, %l2 = 00000000fffffffd
	swap	[%i3+%o4],%l2		! %l2 = 00000000ff000000
!	%l2 = 00000000ff000000, %l6 = 00000000000000ff, %l0 = 0000000000000000
	add	%l2,%l6,%l0		! %l0 = 00000000ff0000ff
!	%l5 = 00000000a724226d, Mem[00000000211c0001] = ffff38a0
	stb	%l5,[%o2+0x001]		! Mem[00000000211c0000] = ff6d38a0
!	%l4 = 000000000000003e, Mem[00000000218000c0] = 81432960, %asi = 80
	stba	%l4,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 3e432960

p0_label_80:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff5dd2ff, %l7 = 00000000000000ff
	ldsha	[%i6+%o5]0x88,%l7	! %l7 = ffffffffffffd2ff
!	Mem[0000000030181400] = 000000a7, %l6 = 00000000000000ff
	ldsba	[%i6+%g0]0x89,%l6	! %l6 = ffffffffffffffa7
!	Mem[0000000010101437] = 1d11ffff, %l5 = 00000000a724226d
	ldsb	[%i4+0x037],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000030001410] = 1d943ab3 00006439, %l6 = ffffffa7, %l7 = ffffd2ff
	ldda	[%i0+%o5]0x89,%l6	! %l6 = 0000000000006439 000000001d943ab3
!	Mem[0000000010181400] = ffffffff, %l5 = ffffffffffffffff
	ldswa	[%i6+%g0]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030141400] = 5c875cff, %l6 = 0000000000006439
	ldsba	[%i5+%g0]0x89,%l6	! %l6 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000010081400] = 00000000 297b1181 ff008576 00000000
!	Mem[0000000010081410] = 00000000 000000ff 41893f3a a0ff199e
!	Mem[0000000010081420] = 36ccebc8 2c78bfb9 00000000 ff5dd2ff
!	Mem[0000000010081430] = 4a8a1334 ff00bf20 72eaa112 5e4700c7
	ldda	[%i2+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010081400
!	Mem[0000000030101400] = c7000000, %f22 = 34d3a4ba
	lda	[%i4+%g0]0x81,%f22	! %f22 = c7000000
!	Mem[00000000300c1400] = fdffffff, %l2 = 00000000ff000000
	lduba	[%i3+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181400] = 000000a7, %l5 = ffffffffffffffff
	lduha	[%i6+%g0]0x89,%l5	! %l5 = 00000000000000a7

p0_label_81:
!	Starting 10 instruction Store Burst
!	%f24 = 43811d48 20cf3b39, %l3 = 0000000043de5ac7
!	Mem[0000000030101410] = 00000000000000a7
	add	%i4,0x010,%g1
	stda	%f24,[%g1+%l3]ASI_PST32_SL ! Mem[0000000030101410] = 393bcf20481d8143
!	%l4 = 000000000000003e, Mem[0000000030001408] = 21428003
	stba	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 3e428003
!	Mem[0000000010081410] = 00000000, %l4 = 000000000000003e
	swapa	[%i2+%o5]0x80,%l4	! %l4 = 0000000000000000
!	%l0 = ff0000ff, %l1 = d0a7c6ef, Mem[0000000010001400] = 00001c03 00000000
	stda	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = ff0000ff d0a7c6ef
!	%l5 = 00000000000000a7, Mem[0000000030141410] = 00000000b33a941d
	stxa	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000000000a7
!	%l2 = 00000000000000ff, Mem[0000000030101400] = c7000000
	stwa	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff
!	%l5 = 00000000000000a7, Mem[0000000010041408] = 20bf00ff
	stba	%l5,[%i1+%o4]0x88	! Mem[0000000010041408] = 20bf00a7
!	%l1 = 10efeae6d0a7c6ef, Mem[0000000010001420] = e5225215e454e26b, %asi = 80
	stxa	%l1,[%i0+0x020]%asi	! Mem[0000000010001420] = 10efeae6d0a7c6ef
!	Mem[0000000010101418] = 00ff00000000006c, %l3 = 0000000043de5ac7, %l4 = 0000000000000000
	add	%i4,0x18,%g1
	casxa	[%g1]0x80,%l3,%l4	! %l4 = 00ff00000000006c
!	%f31 = 25e1d91b, Mem[0000000010101400] = ffffffec
	sta	%f31,[%i4+%g0]0x80	! Mem[0000000010101400] = 25e1d91b

p0_label_82:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff6d38a0, %l1 = 10efeae6d0a7c6ef, %asi = 80
	ldsha	[%o2+0x000]%asi,%l1	! %l1 = ffffffffffffff6d
!	%f5  = 000000ff, %f21 = 768500ff
	fsqrts	%f5 ,%f21		! tt=0x22, %l0 = 00000000ff000121
!	Mem[00000000300c1410] = 56000000, %f24 = 43811d48
	lda	[%i3+%o5]0x89,%f24	! %f24 = 56000000
!	Mem[0000000010181428] = 000000ff, %l1 = ffffffffffffff6d
	lduw	[%i6+0x028],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010181408] = ff00bf20, %f29 = 00000000
	lda	[%i6+%o4]0x80,%f29	! %f29 = ff00bf20
!	Mem[0000000030041410] = ff5dd2ff, %f22 = c7000000
	lda	[%i1+%o5]0x89,%f22	! %f22 = ff5dd2ff
!	Mem[0000000030081400] = baa4d334, %l7 = 000000001d943ab3
	ldswa	[%i2+%g0]0x89,%l7	! %l7 = ffffffffbaa4d334
!	Mem[0000000010141400] = ff00bf20, %l5 = 00000000000000a7
	lduha	[%i5+%g0]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[00000000100c1428] = 00000000e007ef63, %l5 = 000000000000ff00
	ldx	[%i3+0x028],%l5		! %l5 = 00000000e007ef63
!	Mem[0000000030001400] = ff5700ff, %f16 = ff003030
	lda	[%i0+%g0]0x89,%f16	! %f16 = ff5700ff

p0_label_83:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 2550c44e, %l0 = 00000000ff000121
	swapa	[%i3+%g0]0x80,%l0	! %l0 = 000000002550c44e
!	%l2 = 00000000000000ff, Mem[0000000030181410] = ffd25dff47a29f39
	stxa	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000000000ff
!	Mem[0000000010101408] = 00007f66, %l7 = ffffffffbaa4d334
	lduba	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000066
!	%f7  = a0ff199e, %f18 = ff00bf20
	fcmps	%fcc2,%f7 ,%f18		! %fcc2 = 2
!	%l4 = 00ff00000000006c, Mem[00000000201c0000] = 00571a10
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 006c1a10
!	Mem[0000000010001430] = 09e53e7411ff2c35, %l5 = 00000000e007ef63, %l1 = 00000000000000ff
	add	%i0,0x30,%g1
	casxa	[%g1]0x80,%l5,%l1	! %l1 = 09e53e7411ff2c35
!	%l0 = 000000002550c44e, Mem[00000000211c0000] = ff6d38a0, %asi = 80
	stha	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = c44e38a0
!	%l0 = 2550c44e, %l1 = 11ff2c35, Mem[0000000030181400] = a7000000 4466102e
	stda	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 2550c44e 11ff2c35
!	%f22 = ff5dd2ff 1b5555a3, %l7 = 0000000000000066
!	Mem[0000000010041418] = 34d3a4ba1b5555a3
	add	%i1,0x018,%g1
	stda	%f22,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010041418] = 34d3551bffd255a3
!	%l7 = 0000000000000066, Mem[00000000201c0000] = 006c1a10
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 00661a10

p0_label_84:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff0000ff, %l1 = 09e53e7411ff2c35
	ldsha	[%i0+%g0]0x80,%l1	! %l1 = ffffffffffffff00
!	Mem[00000000300c1400] = c75ade43fdffffff, %l6 = ffffffffffffffff
	ldxa	[%i3+%g0]0x89,%l6	! %l6 = c75ade43fdffffff
!	Mem[0000000010181400] = ffffffff, %l6 = c75ade43fdffffff
	lduwa	[%i6+%g0]0x88,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000030181408] = 65000000, %l0 = 000000002550c44e
	lduba	[%i6+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041410] = ff5dd2ff, %l4 = 00ff00000000006c
	ldsba	[%i1+%o5]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030101410] = 393bcf20, %f29 = ff00bf20
	lda	[%i4+%o5]0x81,%f29	! %f29 = 393bcf20
!	Mem[0000000010081430] = 4a8a1334, %f17 = 65d25d01
	ld	[%i2+0x030],%f17	! %f17 = 4a8a1334
!	Mem[0000000030081400] = 34d3a4ba, %l0 = 0000000000000000
	ldswa	[%i2+%g0]0x81,%l0	! %l0 = 0000000034d3a4ba
!	Mem[0000000010141410] = 000000ff, %l0 = 0000000034d3a4ba
	ldsha	[%i5+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101410] = 7fffffff, %l1 = ffffffffffffff00
	ldsha	[%i4+%o5]0x88,%l1	! %l1 = ffffffffffffffff

p0_label_85:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001432] = 09e53e74, %l0 = 00000000000000ff
	ldstuba	[%i0+0x032]%asi,%l0	! %l0 = 000000000000003e
!	Mem[0000000010081408] = ff008576, %l6 = 00000000ffffffff
	swapa	[%i2+%o4]0x80,%l6	! %l6 = 00000000ff008576
!	%l6 = 00000000ff008576, imm = fffffffffffff6d2, %l0 = 000000000000003e
	and	%l6,-0x92e,%l0		! %l0 = 00000000ff008452
!	%l4 = ffffffffffffffff, Mem[0000000030181410] = 000000ff
	stha	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000ffff
!	%l3 = 0000000043de5ac7, Mem[0000000030181400] = 352cff114ec45025
	stxa	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000000043de5ac7
!	%f10 = 00000000 ff5dd2ff, Mem[0000000030081408] = 20bf00ff 21428003
	stda	%f10,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000 ff5dd2ff
!	%l5 = 00000000e007ef63, Mem[0000000010041400] = ff003030
	stha	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = ef633030
!	%l7 = 0000000000000066, imm = fffffffffffff772, %l6 = 00000000ff008576
	xor	%l7,-0x88e,%l6		! %l6 = fffffffffffff714
!	%f6  = 41893f3a a0ff199e, %l2 = 00000000000000ff
!	Mem[0000000030101400] = 000000ff00000000
	stda	%f6,[%i4+%l2]ASI_PST16_S ! Mem[0000000030101400] = 41893f3aa0ff199e
!	Mem[0000000010181400] = ffffffff, %l7 = 0000000000000066
	ldstuba	[%i6+%g0]0x80,%l7	! %l7 = 00000000000000ff

p0_label_86:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ef633030, %f21 = 768500ff
	lda	[%i1+%g0]0x80,%f21	! %f21 = ef633030
!	Mem[0000000030141400] = ff5c875c, %l4 = ffffffffffffffff
	lduha	[%i5+%g0]0x81,%l4	! %l4 = 000000000000ff5c
!	Mem[0000000010001400] = ff0000ff, %l1 = ffffffffffffffff
	lduba	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030041400] = 000000ff, %l6 = fffffffffffff714
	lduha	[%i1+%g0]0x89,%l6	! %l6 = 00000000000000ff
	membar	#Sync			! Added by membar checker (15)
!	Mem[00000000100c1400] = ff000121 24a38f41 fffffffd 00000000
!	Mem[00000000100c1410] = ff5dd265 0c97b5f5 00000000 00000000
!	Mem[00000000100c1420] = 03101028 559d1699 00000000 e007ef63
!	Mem[00000000100c1430] = 43de5ac7 38f642d5 fff63bc6 00000065
	ldda	[%i3+%g0]ASI_BLK_AIUPL,%f0 	! Block Load from 00000000100c1400
!	Mem[0000000010001404] = d0a7c6ef, %l5 = 00000000e007ef63, %asi = 80
	lduwa	[%i0+0x004]%asi,%l5	! %l5 = 00000000d0a7c6ef
!	Mem[0000000010101400] = 25e1d91b, %l7 = 00000000000000ff
	lduwa	[%i4+%g0]0x80,%l7	! %l7 = 0000000025e1d91b
!	Mem[0000000010101408] = 47a29f3900007f66, %l4 = 000000000000ff5c
	ldxa	[%i4+%o4]0x88,%l4	! %l4 = 47a29f3900007f66
!	Mem[0000000010081410] = 0000003e000000ff, %l3 = 0000000043de5ac7
	ldxa	[%i2+%o5]0x80,%l3	! %l3 = 0000003e000000ff
!	Mem[00000000100c1408] = fffffffd, %l3 = 0000003e000000ff
	ldsba	[%i3+%o4]0x80,%l3	! %l3 = ffffffffffffffff

p0_label_87:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = ffd25dff, %l6 = 00000000000000ff
	ldstuba	[%i1+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	%l3 = ffffffffffffffff, Mem[0000000010141433] = 07b95a54
	stb	%l3,[%i5+0x033]		! Mem[0000000010141430] = 07b95aff
	membar	#Sync			! Added by membar checker (16)
!	%f20 = ffd25dff, Mem[00000000100c1408] = fdffffff
	sta	%f20,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffd25dff
!	Mem[0000000010101410] = ffffff7f, %l6 = 00000000000000ff
	ldstuba	[%i4+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	%l2 = 000000ff, %l3 = ffffffff, Mem[0000000030041410] = ff5dd2ff 00000000
	stda	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff ffffffff
!	%f10 = 63ef07e0 00000000, %l7 = 0000000025e1d91b
!	Mem[0000000010041430] = ffd25dff00000000
	add	%i1,0x030,%g1
	stda	%f10,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010041430] = 00005d00e0000000
!	%l5 = 00000000d0a7c6ef, imm = fffffffffffffe99, %l1 = 00000000000000ff
	and	%l5,-0x167,%l1		! %l1 = 00000000d0a7c689
!	%l2 = 000000ff, %l3 = ffffffff, Mem[0000000010141410] = ff000000 b33a941d
	stda	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000ff ffffffff
!	%l2 = 00000000000000ff, %l5 = 00000000d0a7c6ef, %y  = 000000ff
	sdiv	%l2,%l5,%l1		! %l1 = fffffffffffffa9e
	mov	%l0,%y			! %y = ff008452
!	%f28 = ffd25dff 393bcf20, Mem[0000000010141408] = 00000000 00000007
	stda	%f28,[%i5+%o4]0x80	! Mem[0000000010141408] = ffd25dff 393bcf20

p0_label_88:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff0000ff, %l6 = 00000000000000ff
	lduba	[%i0+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141438] = 00000000 000000ff, %l2 = 000000ff, %l3 = ffffffff, %asi = 80
	ldda	[%i5+0x038]%asi,%l2	! %l2 = 0000000000000000 00000000000000ff
!	Mem[000000001010143c] = 1824f15b, %l0 = 00000000ff008452, %asi = 80
	lduwa	[%i4+0x03c]%asi,%l0	! %l0 = 000000001824f15b
!	Mem[0000000030101400] = 3a3f8941, %l5 = 00000000d0a7c6ef
	ldsba	[%i4+%g0]0x89,%l5	! %l5 = 0000000000000041
!	Mem[0000000030181408] = 00000065c75ade43, %f0  = 418fa324 210100ff
	ldda	[%i6+%o4]0x81,%f0 	! %f0  = 00000065 c75ade43
!	Mem[0000000010141400] = ff00bf20, %l2 = 0000000000000000
	ldsha	[%i5+%g0]0x80,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000030081400] = 34d3a4ba65d25d01, %f12 = d542f638 c75ade43
	ldda	[%i2+%g0]0x81,%f12	! %f12 = 34d3a4ba 65d25d01
!	Mem[0000000010181420] = 43811d48, %f15 = c63bf6ff
	ld	[%i6+0x020],%f15	! %f15 = 43811d48
!	Mem[0000000030001408] = 0380423e, %f8  = 99169d55
	lda	[%i0+%o4]0x89,%f8 	! %f8 = 0380423e
!	Mem[00000000211c0000] = c44e38a0, %l7 = 0000000025e1d91b, %asi = 80
	lduha	[%o2+0x000]%asi,%l7	! %l7 = 000000000000c44e

p0_label_89:
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffff00, Mem[0000000010181408] = 20bf00ff
	stwa	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffff00
!	%f18 = ff00bf20, Mem[0000000030001400] = ff0057ff
	sta	%f18,[%i0+%g0]0x81	! Mem[0000000030001400] = ff00bf20
!	%l0 = 000000001824f15b, Mem[000000001000142a] = 5e288a86, %asi = 80
	stha	%l0,[%i0+0x02a]%asi	! Mem[0000000010001428] = 5e28f15b
!	Mem[0000000010101400] = 25e1d91b, %l3 = 00000000000000ff
	ldstuba	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000025
!	Mem[0000000020800000] = bf20a840, %l0 = 000000001824f15b
	ldstuba	[%o1+0x000]%asi,%l0	! %l0 = 00000000000000bf
!	%l7 = 000000000000c44e, Mem[0000000010101408] = 667f0000399fa247
	stxa	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000000000c44e
!	Mem[0000000010181408] = ffffff00, %l6 = 00000000000000ff
	ldstuba	[%i6+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141408] = ffd25dff, %l6 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l6	! %l6 = 00000000ffd25dff
!	%f24 = 56000000, %f11 = 00000000
	fsqrts	%f24,%f11		! %f11 = 4ab504f3
!	%l2 = ffffff00, %l3 = 00000025, Mem[0000000010081400] = 00000000 81117b29
	stda	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffff00 00000025

p0_label_90:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00001c03, %l0 = 00000000000000bf
	ldswa	[%i5+%o4]0x81,%l0	! %l0 = 0000000000001c03
!	%l5 = 0000000000000041, %l1 = fffffffffffffa9e, %l6  = 00000000ffd25dff
	mulx	%l5,%l1,%l6		! %l6 = fffffffffffea21e
!	%f30 = 79647692, %f25 = 20cf3b39, %f26 = e557ba48
	fdivs	%f30,%f25,%f26		! %f26 = 7f800000
!	%l5 = 0000000000000041, imm = 0000000000000d93, %l4 = 47a29f3900007f66
	and	%l5,0xd93,%l4		! %l4 = 0000000000000001
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000010101400] = ffe1d91b 2e626607 00000000 0000c44e
!	Mem[0000000010101410] = ffffff7f 667f0000 00ff0000 0000006c
!	Mem[0000000010101420] = 34d3a4ba 1b5555a3 6b266806 47708c3f
!	Mem[0000000010101430] = 100aa7f4 1d11ffff 5562abd2 1824f15b
	ldda	[%i4+%g0]ASI_BLK_AIUPL,%f0 	! Block Load from 0000000010101400
!	Mem[0000000030181410] = ffff0000 00000000, %l4 = 00000001, %l5 = 00000041
	ldda	[%i6+%o5]0x81,%l4	! %l4 = 00000000ffff0000 0000000000000000
!	Mem[0000000010141410] = 000000ff, %l5 = 0000000000000000
	ldswa	[%i5+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030141410] = 00000000, %l4 = 00000000ffff0000
	ldsha	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041410] = ffd25dff768500ff, %l1 = fffffffffffffa9e
	ldx	[%i1+%o5],%l1		! %l1 = ffd25dff768500ff
!	Mem[0000000010101408] = 00000000, %l2 = ffffffffffffff00
	ldswa	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000000

p0_label_91:
!	Starting 10 instruction Store Burst
!	%l0 = 00001c03, %l1 = 768500ff, Mem[0000000010181410] = ff5dd2ff 00000000
	stda	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 00001c03 768500ff
!	Mem[00000000100c1408] = ff5dd2ff, %l2 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l2	! %l2 = 00000000ff5dd2ff
	membar	#Sync			! Added by membar checker (18)
!	%l3 = 0000000000000025, Mem[000000001010143c] = 1824f15b, %asi = 80
	stwa	%l3,[%i4+0x03c]%asi	! Mem[000000001010143c] = 00000025
!	Mem[0000000010081410] = 0000003e, %l0 = 0000000000001c03
	ldstub	[%i2+%o5],%l0		! %l0 = 0000000000000000
!	Mem[0000000010181400] = ffffffff, %l6 = fffffffffffea21e
	ldstuba	[%i6+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181404] = ffffffff, %l0 = 0000000000000000, %asi = 80
	swapa	[%i6+0x004]%asi,%l0	! %l0 = 00000000ffffffff
!	%l3 = 0000000000000025, Mem[0000000020800040] = ff00b270
	sth	%l3,[%o1+0x040]		! Mem[0000000020800040] = 0025b270
!	Mem[0000000010141413] = 000000ff, %l0 = 00000000ffffffff
	ldstub	[%i5+0x013],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030181400] = 43de5ac7, %l3 = 0000000000000025
	ldsha	[%i6+%g0]0x89,%l3	! %l3 = 0000000000005ac7
!	Mem[0000000030181410] = ffff0000, %l7 = 000000000000c44e
	swapa	[%i6+%o5]0x81,%l7	! %l7 = 00000000ffff0000

p0_label_92:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ff00bf20, %l3 = 0000000000005ac7
	lduwa	[%i5+%g0]0x80,%l3	! %l3 = 00000000ff00bf20
!	Mem[0000000030001400] = ff00bf20 00000000 3e428003 a1485ea7
!	Mem[0000000030001410] = 39640000 b33a941d 43811d48 20cf3b39
!	Mem[0000000030001420] = c5c6b646 155222e5 bf94f237 ff05f5a0
!	Mem[0000000030001430] = c02dd264 2580a741 db61cb41 799d67ff
	ldda	[%i0+%g0]ASI_BLK_AIUSL,%f0 	! Block Load from 0000000030001400
!	Mem[00000000100c1418] = 00000000 00000000, %l4 = 00000000, %l5 = 000000ff, %asi = 80
	ldda	[%i3+0x018]%asi,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000030181408] = 43de5ac7 65000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i6+%o4]0x89,%l4	! %l4 = 0000000065000000 0000000043de5ac7
!	Mem[00000000218001c1] = 5ac7da20, %l1 = ffd25dff768500ff
	ldsb	[%o3+0x1c1],%l1		! %l1 = ffffffffffffffc7
!	Mem[00000000100c1420] = 03101028, %f19 = 03804221
	lda	[%i3+0x020]%asi,%f19	! %f19 = 03101028
!	Mem[0000000010081410] = ff00003e, %l3 = 00000000ff00bf20
	lduha	[%i2+%o5]0x80,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010101418] = 00ff0000, %l4 = 0000000065000000, %asi = 80
	lduha	[%i4+0x018]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181410] = 031c0000 ff008576, %l0 = 000000ff, %l1 = ffffffc7, %asi = 80
	ldda	[%i6+0x010]%asi,%l0	! %l0 = 00000000031c0000 00000000ff008576
!	Mem[0000000010141408] = 00000000393bcf20, %l7 = 00000000ffff0000
	ldx	[%i5+%o4],%l7		! %l7 = 00000000393bcf20

p0_label_93:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000393bcf20, Mem[0000000010041410] = ffd25dff
	stba	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = 20d25dff
!	%f10 = a0f505ff 37f294bf, Mem[0000000010081430] = 4a8a1334 ff00bf20
	std	%f10,[%i2+0x030]	! Mem[0000000010081430] = a0f505ff 37f294bf
!	%l5 = 0000000043de5ac7, Mem[0000000030041408] = 43de0000
	stwa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 43de5ac7
!	Mem[0000000010081408] = ffffffff, %l7 = 00000000393bcf20
	ldstuba	[%i2+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000010101400] = ffe1d91b
	stha	%l7,[%i4+%g0]0x80	! Mem[0000000010101400] = 00ffd91b
!	%l4 = 00000000000000ff, Mem[0000000030181410] = 0000c44e
	stba	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = ff00c44e
!	%l7 = 00000000000000ff, Mem[0000000010141408] = 00000000
	stwa	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000ff
!	Mem[0000000030041408] = c75ade43, %l5 = 0000000043de5ac7
	ldstuba	[%i1+%o4]0x81,%l5	! %l5 = 00000000000000c7
!	%l2 = 00000000ff5dd2ff, Mem[00000000100c1400] = ff000121
	stha	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = d2ff0121
!	Mem[0000000010041414] = 768500ff, %l1 = 00000000ff008576
	swap	[%i1+0x014],%l1		! %l1 = 00000000768500ff

p0_label_94:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00001c03 59dd1317, %l4 = 000000ff, %l5 = 000000c7
	ldda	[%i5+%o4]0x81,%l4	! %l4 = 0000000000001c03 0000000059dd1317
!	Mem[0000000010101418] = 00ff0000, %f16 = ff5700ff
	lda	[%i4+0x018]%asi,%f16	! %f16 = 00ff0000
!	%l2 = 00000000ff5dd2ff, %l7 = 00000000000000ff, %l7 = 00000000000000ff
	udivx	%l2,%l7,%l7		! %l7 = 0000000001005e31
!	Code Fragment 4, seed = 765151
p0_fragment_14:
!	%l0 = 00000000031c0000
	setx	0xf760bc959558202e,%g7,%l0 ! %l0 = f760bc959558202e
!	%l1 = 00000000768500ff
	setx	0x75aff84e908475d9,%g7,%l1 ! %l1 = 75aff84e908475d9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f760bc959558202e
	setx	0x404f96b75af27794,%g7,%l0 ! %l0 = 404f96b75af27794
!	%l1 = 75aff84e908475d9
	setx	0x380bb069336fa85f,%g7,%l1 ! %l1 = 380bb069336fa85f
p0_fragment_14_end:
!	Mem[0000000010141414] = ffffffff, %l5 = 0000000059dd1317
	ldsh	[%i5+0x014],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010101408] = 000000000000c44e, %f30 = 79647692 25e1d91b, %asi = 80
	ldda	[%i4+0x008]%asi,%f30	! %f30 = 00000000 0000c44e
!	Mem[0000000010101400] = 0766622e1bd9ff00, %f2  = a75e48a1 0380423e
	ldda	[%i4+%g0]0x88,%f2 	! %f2  = 0766622e 1bd9ff00
!	Mem[00000000211c0000] = c44e38a0, %l3 = 000000000000ff00, %asi = 80
	ldsha	[%o2+0x000]%asi,%l3	! %l3 = ffffffffffffc44e
!	Mem[0000000010141408] = 000000ff, %l0 = 404f96b75af27794
	ldsha	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = 4ec400ff, %l5 = ffffffffffffffff
	lduwa	[%i6+%o5]0x89,%l5	! %l5 = 000000004ec400ff

p0_label_95:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (19)
!	%f18 = ff00bf20 03101028, Mem[0000000030001410] = 00006439 1d943ab3
	stda	%f18,[%i0+%o5]0x89	! Mem[0000000030001410] = ff00bf20 03101028
!	%f22 = ff5dd2ff 1b5555a3, Mem[0000000010041400] = ef633030 65d25d01
	stda	%f22,[%i1+%g0]0x80	! Mem[0000000010041400] = ff5dd2ff 1b5555a3
!	Mem[0000000030141410] = 00000000, %l4 = 0000000000001c03
	swapa	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, Mem[000000001004141c] = ffd255a3, %asi = 80
	stha	%l4,[%i1+0x01c]%asi	! Mem[000000001004141c] = 000055a3
!	%l5 = 000000004ec400ff, Mem[00000000100c1408] = 00000000
	stwa	%l5,[%i3+%o4]0x88	! Mem[00000000100c1408] = 4ec400ff
!	%f26 = 7f800000 ff00bf20, %l6 = 00000000000000ff
!	Mem[0000000030041408] = ff5ade432e106644
	add	%i1,0x008,%g1
	stda	%f26,[%g1+%l6]ASI_PST32_S ! Mem[0000000030041408] = 7f800000ff00bf20
!	%f12 = 41a78025 64d22dc0, Mem[00000000300c1400] = fdffffff c75ade43
	stda	%f12,[%i3+%g0]0x89	! Mem[00000000300c1400] = 41a78025 64d22dc0
!	Mem[0000000030181410] = ff00c44e, %l6 = 00000000000000ff
	ldstuba	[%i6+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	%f24 = 56000000 20cf3b39, Mem[0000000030081408] = ff5dd2ff 00000000
	stda	%f24,[%i2+%o4]0x89	! Mem[0000000030081408] = 56000000 20cf3b39
!	%l2 = ff5dd2ff, %l3 = ffffc44e, Mem[0000000030001410] = 28101003 20bf00ff
	stda	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = ff5dd2ff ffffc44e

p0_label_96:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800001] = ff20a840, %l6 = 00000000000000ff
	ldub	[%o1+0x001],%l6		! %l6 = 0000000000000020
!	Mem[0000000010081408] = ffffffff00000000, %l2 = 00000000ff5dd2ff
	ldxa	[%i2+%o4]0x80,%l2	! %l2 = ffffffff00000000
!	Mem[0000000010081400] = 00ffffff, %l5 = 000000004ec400ff, %asi = 80
	ldsha	[%i2+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081410] = ffd25dff, %l7 = 0000000001005e31
	ldswa	[%i2+%o5]0x81,%l7	! %l7 = ffffffffffd25dff
!	Code Fragment 4, seed = 83029
p0_fragment_15:
!	%l0 = 0000000000000000
	setx	0xaa9ec4f0e96aba7e,%g7,%l0 ! %l0 = aa9ec4f0e96aba7e
!	%l1 = 380bb069336fa85f
	setx	0x237b33690fde3f29,%g7,%l1 ! %l1 = 237b33690fde3f29
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = aa9ec4f0e96aba7e
	setx	0xd127d84015d83fe4,%g7,%l0 ! %l0 = d127d84015d83fe4
!	%l1 = 237b33690fde3f29
	setx	0x07b5765b434d3faf,%g7,%l1 ! %l1 = 07b5765b434d3faf
p0_fragment_15_end:
!	Mem[0000000010181400] = ffffffff, %l4 = 0000000000000000
	lduha	[%i6+%g0]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[00000000300c1410] = 0000006256000000, %l0 = d127d84015d83fe4
	ldxa	[%i3+%o5]0x89,%l0	! %l0 = 0000006256000000
!	Mem[0000000010081408] = ffffffff, %l2 = ffffffff00000000
	ldsba	[%i2+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010001400] = ff0000ff, %f2  = 0766622e
	lda	[%i0+%g0]0x80,%f2 	! %f2 = ff0000ff
!	Mem[0000000010181408] = ffffffff, %l4 = 000000000000ffff
	ldswa	[%i6+%o4]0x80,%l4	! %l4 = ffffffffffffffff

p0_label_97:
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffd25dff, Mem[0000000030001408] = 3e428003
	stba	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = ff428003
!	%f17 = 4a8a1334, Mem[00000000300c1410] = 56000000
	sta	%f17,[%i3+%o5]0x89	! Mem[00000000300c1410] = 4a8a1334
!	%l4 = ffffffffffffffff, Mem[0000000010101408] = 4ec4000000000000
	stxa	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffffffffffffff
!	%l3 = ffffffffffffc44e, Mem[0000000030101410] = 393bcf20
	stba	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 4e3bcf20
!	Mem[0000000010081410] = ff00003e, %l6 = 0000000000000020
	swapa	[%i2+%o5]0x80,%l6	! %l6 = 00000000ff00003e
!	Mem[0000000010081408] = ffffffff, %l2 = ffffffffffffffff
	ldstuba	[%i2+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	%f6  = 393bcf20 481d8143, %l3 = ffffffffffffc44e
!	Mem[0000000010081420] = 36ccebc82c78bfb9
	add	%i2,0x020,%g1
	stda	%f6,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010081420] = 36cc1d4820cf3b39
!	%f20 = ffd25dff, Mem[0000000030041410] = 000000ff
	sta	%f20,[%i1+%o5]0x89	! Mem[0000000030041410] = ffd25dff
!	Mem[00000000100c1400] = d2ff0121, %l5 = 00000000000000ff
	ldstuba	[%i3+%g0]0x80,%l5	! %l5 = 00000000000000d2
!	%f2  = ff0000ff, Mem[0000000030041400] = ff000000
	sta	%f2 ,[%i1+%g0]0x81	! Mem[0000000030041400] = ff0000ff

p0_label_98:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 20cf3b4e, %l3 = ffffffffffffc44e
	lduha	[%i4+%o5]0x89,%l3	! %l3 = 0000000000003b4e
!	Mem[0000000030101400] = 9e19ffa03a3f8941, %f26 = 7f800000 ff00bf20
	ldda	[%i4+%g0]0x89,%f26	! %f26 = 9e19ffa0 3a3f8941
!	%l2 = 00000000000000ff, imm = 0000000000000bd6, %l5 = 00000000000000d2
	subc	%l2,0xbd6,%l5		! %l5 = fffffffffffff529
!	%l6 = 00000000ff00003e, %l3 = 0000000000003b4e, %l5 = fffffffffffff529
	sdivx	%l6,%l3,%l5		! %l5 = 0000000000044cc1
!	Mem[0000000010181400] = ffffffff, %l6 = 00000000ff00003e
	lduba	[%i6+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[000000001004143c] = 25e1d91b, %f8  = e5225215
	lda	[%i1+0x03c]%asi,%f8 	! %f8 = 25e1d91b
!	Mem[0000000030081400] = baa4d334, %f12 = 41a78025
	lda	[%i2+%g0]0x89,%f12	! %f12 = baa4d334
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000030001400] = ff00bf20 00000000 ff428003 a1485ea7
!	Mem[0000000030001410] = ff5dd2ff ffffc44e 43811d48 20cf3b39
!	Mem[0000000030001420] = c5c6b646 155222e5 bf94f237 ff05f5a0
!	Mem[0000000030001430] = c02dd264 2580a741 db61cb41 799d67ff
	ldda	[%i0+%g0]ASI_BLK_AIUS,%f16	! Block Load from 0000000030001400
!	Mem[0000000010001410] = 00000000, %l7 = ffffffffffd25dff
	lduba	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081400] = 34d3a4ba 65d25d01 393bcf20 00000056
!	Mem[0000000030081410] = ffd25dff 768500ff 34d3a4ba 1b5555a3
!	Mem[0000000030081420] = 43811d48 20cf3b39 e557ba48 ff00bf20
!	Mem[0000000030081430] = ffd25dff 00000000 79647692 25e1d91b
	ldda	[%i2+%g0]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030081400

p0_label_99:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000003b4e, imm = fffffffffffff1d1, %l7 = 0000000000000000
	and	%l3,-0xe2f,%l7		! %l7 = 0000000000003140
!	Mem[0000000010101400] = 00ffd91b, %l3 = 0000000000003b4e
	ldstuba	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000000
!	%f28 = 00000000, Mem[0000000030101410] = 4e3bcf20
	sta	%f28,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	Mem[0000000010041408] = 20bf00a7, %l5 = 0000000000044cc1
	ldstuba	[%i1+%o4]0x88,%l5	! %l5 = 00000000000000a7
!	%l6 = 00000000000000ff, Mem[0000000010181408] = ffffffff
	stwa	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000ff
!	%f26 = 20bf00ff, Mem[0000000010001408] = ff8fa324
	sta	%f26,[%i0+0x008]%asi	! Mem[0000000010001408] = 20bf00ff
!	%l7 = 0000000000003140, Mem[0000000010141400] = 20bf00ff
	stha	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 20bf3140
!	%f28 = 00000000 ff5dd2ff, Mem[0000000010101408] = ffffffff ffffffff
	stda	%f28,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000 ff5dd2ff
!	%l6 = 00000000000000ff, Mem[0000000010001408] = ff00bf20
	stha	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = ff0000ff
!	%l5 = 00000000000000a7, Mem[00000000201c0001] = 00661a10
	stb	%l5,[%o0+0x001]		! Mem[00000000201c0000] = 00a71a10

p0_label_100:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00001c03, %l6 = 00000000000000ff
	lduha	[%i6+%o5]0x88,%l6	! %l6 = 0000000000001c03
!	Mem[00000000201c0000] = 00a71a10, %l1 = 07b5765b434d3faf, %asi = 80
	lduba	[%o0+0x000]%asi,%l1	! %l1 = 0000000000000000
!	Mem[000000001018140e] = 00000000, %l0 = 0000006256000000
	ldub	[%i6+0x00e],%l0		! %l0 = 0000000000000000
!	Mem[0000000010141408] = ff000000, %l5 = 00000000000000a7
	lduwa	[%i5+%o4]0x88,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010001414] = 00000037, %l6 = 0000000000001c03
	lduh	[%i0+0x014],%l6		! %l6 = 0000000000000000
!	Mem[000000001010141d] = 0000006c, %l2 = 00000000000000ff
	ldub	[%i4+0x01d],%l2		! %l2 = 0000000000000000
!	Mem[0000000010041418] = 34d3551b000055a3, %f4  = 1d943ab3 00006439, %asi = 80
	ldda	[%i1+0x018]%asi,%f4 	! %f4  = 34d3551b 000055a3
!	%l5 = 00000000ff000000, imm = 0000000000000c2f, %l5 = 00000000ff000000
	and	%l5,0xc2f,%l5		! %l5 = 0000000000000000
!	Mem[0000000010001408] = ff0000ff, %f5  = 000055a3
	lda	[%i0+%o4]0x80,%f5 	! %f5 = ff0000ff
!	Mem[0000000030101408] = 20bf00ff, %l3 = 0000000000000000
	ldsba	[%i4+%o4]0x81,%l3	! %l3 = 0000000000000020

p0_label_101:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 031c0000, %l0 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l0	! %l0 = 00000000031c0000
!	Mem[00000000300c1410] = 34138a4a, %l2 = 0000000000000000
	ldstuba	[%i3+%o5]0x81,%l2	! %l2 = 0000000000000034
!	Mem[00000000100c1410] = 65d25dff, %l1 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 0000000065d25dff
	membar	#Sync			! Added by membar checker (21)
!	%f28 = 00000000 ff5dd2ff, %l1 = 0000000065d25dff
!	Mem[0000000030081408] = 393bcf2000000056
	add	%i2,0x008,%g1
	stda	%f28,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030081408] = ffd25dff00000000
!	%f27 = 48ba57e5, Mem[0000000010001400] = ff0000ff
	sta	%f27,[%i0+%g0]0x88	! Mem[0000000010001400] = 48ba57e5
!	%l7 = 0000000000003140, Mem[0000000030181410] = 4ec400ff
	stba	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 4ec40040
!	Mem[0000000030041408] = 7f800000, %l6 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l6	! %l6 = 000000000000007f
!	%l0 = 00000000031c0000, Mem[0000000010101410] = ffffff7f
	stba	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 00ffff7f
!	Mem[0000000010181408] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l5	! %l5 = 0000000000000000
!	%l3 = 0000000000000020, Mem[0000000030181408] = 00000065
	stwa	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000020

p0_label_102:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 41893f3a, %l3 = 0000000000000020
	ldswa	[%i4+%g0]0x81,%l3	! %l3 = 0000000041893f3a
!	Mem[0000000010101400] = 1bd9ffff, %l3 = 0000000041893f3a
	lduwa	[%i4+%g0]0x88,%l3	! %l3 = 000000001bd9ffff
!	Mem[0000000010141408] = ff000000, %l2 = 0000000000000034
	ldsba	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181408] = 00000020 c75ade43, %l4 = ffffffff, %l5 = 00000000
	ldda	[%i6+%o4]0x81,%l4	! %l4 = 0000000000000020 00000000c75ade43
!	Mem[000000001010141f] = 0000006c, %l2 = 0000000000000000, %asi = 80
	lduba	[%i4+0x01f]%asi,%l2	! %l2 = 000000000000006c
!	Mem[0000000010001400] = e557ba48d0a7c6ef, %f22 = a355551b baa4d334
	ldda	[%i0+%g0]0x80,%f22	! %f22 = e557ba48 d0a7c6ef
!	Mem[0000000010041410] = 20d25dff, %l4 = 0000000000000020
	lduba	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000020
!	Mem[000000001010141c] = 0000006c, %l7 = 0000000000003140
	lduw	[%i4+0x01c],%l7		! %l7 = 000000000000006c
!	Mem[0000000010101430] = 100aa7f41d11ffff, %f0  = 00000000 20bf00ff, %asi = 80
	ldda	[%i4+0x030]%asi,%f0 	! %f0  = 100aa7f4 1d11ffff
!	Mem[0000000030041408] = 20bf00ff000080ff, %l3 = 000000001bd9ffff
	ldxa	[%i1+%o4]0x89,%l3	! %l3 = 20bf00ff000080ff

p0_label_103:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000031c0000, Mem[00000000201c0000] = 00a71a10, %asi = 80
	stha	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00001a10
!	%f18 = 56000000, Mem[0000000010081428] = 00000000
	sta	%f18,[%i2+0x028]%asi	! Mem[0000000010081428] = 56000000
!	%l5 = 00000000c75ade43, Mem[0000000010181400] = ffffffff
	stba	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffff43
!	%l5 = 00000000c75ade43, Mem[0000000030101400] = 9e19ffa03a3f8941
	stxa	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000c75ade43
!	Mem[0000000010041410] = ff5dd220, %l0 = 00000000031c0000
	swapa	[%i1+%o5]0x88,%l0	! %l0 = 00000000ff5dd220
!	%l3 = 20bf00ff000080ff, Mem[0000000030041408] = ff800000
	stwa	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 000080ff
!	%f30 = 1bd9e125 92766479, Mem[0000000010101408] = ffd25dff 00000000
	stda	%f30,[%i4+%o4]0x80	! Mem[0000000010101408] = 1bd9e125 92766479
!	%l3 = 20bf00ff000080ff, Mem[0000000030101408] = 000000ffff00bf20
	stxa	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 20bf00ff000080ff
!	%l5 = 00000000c75ade43, imm = fffffffffffff870, %l2 = 000000000000006c
	xor	%l5,-0x790,%l2		! %l2 = ffffffff38a52633
!	%l2 = ffffffff38a52633, %l1 = 0000000065d25dff, %y  = ff008452
	umul	%l2,%l1,%l2		! %l2 = 1687b457e03793cd, %y = 1687b457

p0_label_104:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 20bf3140, %l3 = 20bf00ff000080ff
	ldsha	[%i5+%g0]0x88,%l3	! %l3 = 0000000000003140
!	Mem[00000000201c0000] = 00001a10, %l4 = 0000000000000020, %asi = 80
	lduha	[%o0+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = 00000020, %l0 = 00000000ff5dd220, %asi = 80
	lduwa	[%i2+0x010]%asi,%l0	! %l0 = 0000000000000020
!	Mem[0000000030101400] = c75ade43, %f18 = 56000000
	lda	[%i4+%g0]0x89,%f18	! %f18 = c75ade43
!	%l2 = 1687b457e03793cd, %l1 = 0000000065d25dff, %l7 = 000000000000006c
	sdivx	%l2,%l1,%l7		! %l7 = 0000000038a52633
!	Mem[0000000010001410] = 00000000, %l4 = 0000000000000000, %asi = 80
	ldswa	[%i0+0x010]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101408] = ff800000ff00bf20, %f4  = 34d3551b ff0000ff
	ldda	[%i4+%o4]0x81,%f4 	! %f4  = ff800000 ff00bf20
!	Mem[00000000100c1404] = 24a38f41, %f2  = ff0000ff
	ld	[%i3+0x004],%f2 	! %f2 = 24a38f41
!	Mem[0000000010081428] = 56000000ff5dd2ff, %l1 = 0000000065d25dff
	ldx	[%i2+0x028],%l1		! %l1 = 56000000ff5dd2ff
!	Mem[0000000030141400] = 5c875cff, %l3 = 0000000000003140
	ldsha	[%i5+%g0]0x89,%l3	! %l3 = 0000000000005cff

p0_label_105:
!	Starting 10 instruction Store Burst
!	%l2 = 1687b457e03793cd, Mem[0000000030081400] = baa4d334
	stha	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = baa493cd
!	Mem[00000000300c1408] = ffffffff, %l0 = 0000000000000020
	swapa	[%i3+%o4]0x81,%l0	! %l0 = 00000000ffffffff
!	%l6 = 000000000000007f, Mem[000000001000140a] = ff0000ff, %asi = 80
	stba	%l6,[%i0+0x00a]%asi	! Mem[0000000010001408] = ff007fff
!	%f20 = ff008576 ff5dd2ff, Mem[00000000100c1408] = 4ec400ff 00000000
	stda	%f20,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff008576 ff5dd2ff
!	%f31 = 92766479, Mem[0000000010081408] = ffffffff
	sta	%f31,[%i2+%o4]0x88	! Mem[0000000010081408] = 92766479
!	%l4 = 0000000000000000, %l6 = 000000000000007f, %l1 = 56000000ff5dd2ff
	add	%l4,%l6,%l1		! %l1 = 000000000000007f
!	%f15 = 41cb61db, Mem[000000001004143c] = 25e1d91b
	st	%f15,[%i1+0x03c]	! Mem[000000001004143c] = 41cb61db
!	%l0 = 00000000ffffffff, Mem[00000000300c1408] = 20000000
	stha	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 2000ffff
!	Mem[0000000020800000] = ff20a840, %l6 = 000000000000007f
	ldstuba	[%o1+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	%f18 = c75ade43 20cf3b39, Mem[00000000300c1410] = 4a8a13ff 00000062
	stda	%f18,[%i3+%o5]0x89	! Mem[00000000300c1410] = c75ade43 20cf3b39

p0_label_106:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800040] = 7785b900, %l1 = 000000000000007f, %asi = 80
	lduba	[%o3+0x040]%asi,%l1	! %l1 = 0000000000000077
!	Mem[0000000010081418] = 41893f3aa0ff199e, %f14 = ff679d79 41cb61db
	ldd	[%i2+0x018],%f14	! %f14 = 41893f3a a0ff199e
!	Mem[0000000010081410] = 00000020, %l2 = 1687b457e03793cd
	lduha	[%i2+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = 92766479, %l6 = 00000000000000ff
	ldsha	[%i2+%o4]0x88,%l6	! %l6 = 0000000000006479
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000030081400] = cd93a4ba 65d25d01 ffd25dff 00000000
!	Mem[0000000030081410] = ffd25dff 768500ff 34d3a4ba 1b5555a3
!	Mem[0000000030081420] = 43811d48 20cf3b39 e557ba48 ff00bf20
!	Mem[0000000030081430] = ffd25dff 00000000 79647692 25e1d91b
	ldda	[%i2+%g0]ASI_BLK_AIUS,%f16	! Block Load from 0000000030081400
!	Mem[0000000030101408] = ff800000, %l7 = 0000000038a52633
	lduha	[%i4+%o4]0x81,%l7	! %l7 = 000000000000ff80
!	Mem[0000000030181408] = 00000020, %f9  = 46b6c6c5
	lda	[%i6+%o4]0x81,%f9 	! %f9 = 00000020
!	Mem[0000000010081418] = 41893f3a, %f7  = 481d8143
	ld	[%i2+0x018],%f7 	! %f7 = 41893f3a
!	Mem[0000000010041408] = ff00bf2003804221, %l7 = 000000000000ff80
	ldxa	[%i1+%o4]0x80,%l7	! %l7 = ff00bf2003804221
!	Mem[0000000010041400] = ff5dd2ff, %l5 = 00000000c75ade43
	ldswa	[%i1+%g0]0x80,%l5	! %l5 = ffffffffff5dd2ff

p0_label_107:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 00000000, %l3 = 0000000000005cff
	ldstuba	[%i6+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%l3 = 0000000000000000, %l6 = 0000000000006479, %l2 = 0000000000000000
	xnor	%l3,%l6,%l2		! %l2 = ffffffffffff9b86
!	Mem[0000000010181422] = 43811d48, %l5 = ffffffffff5dd2ff
	ldstub	[%i6+0x022],%l5		! %l5 = 000000000000001d
!	Mem[0000000030181410] = 4ec40040, %l1 = 0000000000000077
	ldstuba	[%i6+%o5]0x89,%l1	! %l1 = 0000000000000040
!	Mem[0000000010101438] = 5562abd200000025, %l3 = 0000000000000000, %l6 = 0000000000006479
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l3,%l6	! %l6 = 5562abd200000025
!	%l4 = 00000000, %l5 = 0000001d, Mem[0000000010101400] = ffffd91b 2e626607
	stda	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000 0000001d
!	Mem[0000000010181408] = ff0000ff, %l3 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%f2  = 24a38f41 1bd9ff00, Mem[0000000010041410] = 031c0000 768500ff
	stda	%f2 ,[%i1+%o5]0x88	! Mem[0000000010041410] = 24a38f41 1bd9ff00
!	%f30 = 79647692 25e1d91b, Mem[0000000010001408] = ff007fff 00000000
	stda	%f30,[%i0+%o4]0x80	! Mem[0000000010001408] = 79647692 25e1d91b
!	%l0 = ffffffff, %l1 = 00000040, Mem[0000000010181400] = ffffff43 00000000
	stda	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffffff 00000040

p0_label_108:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ffd25dff, %l4 = 0000000000000000
	lduba	[%i2+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041408] = 000080ff, %l0 = 00000000ffffffff
	lduwa	[%i1+%o4]0x81,%l0	! %l0 = 00000000000080ff
!	Mem[0000000030141410] = 031c0000, %l0 = 00000000000080ff
	lduha	[%i5+%o5]0x81,%l0	! %l0 = 000000000000031c
!	Mem[0000000030101400] = c75ade43, %l6 = 5562abd200000025
	lduba	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000043
!	Mem[0000000030041400] = ff0000ff, %l0 = 000000000000031c
	ldsha	[%i1+%g0]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010041408] = ff00bf20 03804221, %l0 = ffffff00, %l1 = 00000040
	ldd	[%i1+%o4],%l0		! %l0 = 00000000ff00bf20 0000000003804221
!	Mem[00000000201c0001] = 00001a10, %l2 = ffffffffffff9b86
	ldsb	[%o0+0x001],%l2		! %l2 = 0000000000000000
!	Mem[0000000010081408] = 92766479, %l0 = 00000000ff00bf20
	ldsba	[%i2+%o4]0x88,%l0	! %l0 = 0000000000000079
!	Mem[0000000010141408] = 000000ff, %l0 = 0000000000000079
	lduw	[%i5+%o4],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010181430] = 000000005e610975, %f6  = 393bcf20 41893f3a, %asi = 80
	ldda	[%i6+0x030]%asi,%f6 	! %f6  = 00000000 5e610975

p0_label_109:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181404] = 40000000, %l5 = 000000000000001d
	swap	[%i6+0x004],%l5		! %l5 = 0000000040000000
!	%f22 = 34d3a4ba 1b5555a3, %l6 = 0000000000000043
!	Mem[0000000010101428] = 6b26680647708c3f
	add	%i4,0x028,%g1
	stda	%f22,[%g1+%l6]ASI_PST8_P ! Mem[0000000010101428] = 6bd36806477055a3
!	%l7 = ff00bf2003804221, Mem[0000000010081408] = 7964769200000000
	stxa	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = ff00bf2003804221
!	%l2 = 0000000000000000, Mem[0000000030101400] = 43de5ac7
	stwa	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	Mem[0000000010101407] = 0000001d, %l2 = 0000000000000000
	ldstuba	[%i4+0x007]%asi,%l2	! %l2 = 000000000000001d
!	%l3 = 00000000000000ff, Mem[000000001008140c] = 03804221, %asi = 80
	stha	%l3,[%i2+0x00c]%asi	! Mem[000000001008140c] = 00ff4221
!	Mem[0000000030081408] = ffd25dff, %l0 = 00000000000000ff
	ldstuba	[%i2+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	%l3 = 00000000000000ff, imm = fffffffffffff880, %l5 = 0000000040000000
	addc	%l3,-0x780,%l5		! %l5 = fffffffffffff97f
!	Mem[0000000030081408] = ffd25dff, %l4 = 00000000000000ff
	swapa	[%i2+%o4]0x81,%l4	! %l4 = 00000000ffd25dff
!	Mem[0000000010001410] = 00000000, %l1 = 0000000003804221
	swapa	[%i0+%o5]0x80,%l1	! %l1 = 0000000000000000

p0_label_110:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ffffffffff000000, %l3 = 00000000000000ff
	ldxa	[%i5+%o5]0x88,%l3	! %l3 = ffffffffff000000
!	Mem[00000000300c1400] = 41a78025 64d22dc0, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i3+%g0]0x89,%l0	! %l0 = 0000000064d22dc0 0000000041a78025
!	Mem[0000000010181410] = ff000000, %l4 = 00000000ffd25dff
	ldsba	[%i6+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c1428] = 00000000e007ef63, %f8  = 25e1d91b 00000020, %asi = 80
	ldda	[%i3+0x028]%asi,%f8 	! %f8  = 00000000 e007ef63
!	Mem[0000000010041400] = ffd25dff, %l1 = 0000000041a78025
	ldsba	[%i1+%g0]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030041410] = ffd25dff, %l0 = 0000000064d22dc0
	ldswa	[%i1+%o5]0x89,%l0	! %l0 = ffffffffffd25dff
!	Mem[0000000010141408] = ff000000, %l3 = ffffffffff000000
	ldswa	[%i5+%o4]0x88,%l3	! %l3 = ffffffffff000000
!	%l6 = 0000000000000043, %l3 = ffffffffff000000, %y  = 1687b457
	udiv	%l6,%l3,%l7		! %l7 = 00000000169e52a9
	mov	%l0,%y			! %y = ffd25dff
!	Mem[000000001004142f] = ff00bf20, %l0 = ffffffffffd25dff
	ldsb	[%i1+0x02f],%l0		! %l0 = 0000000000000020
!	Mem[0000000020800040] = 0025b270, %l7 = 00000000169e52a9, %asi = 80
	lduha	[%o1+0x040]%asi,%l7	! %l7 = 0000000000000025

p0_label_111:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 000000ff, %l2 = 000000000000001d
	ldstuba	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000000
!	%f24 = 43811d48 20cf3b39, Mem[00000000100c1408] = ffd25dff 768500ff
	stda	%f24,[%i3+%o4]0x80	! Mem[00000000100c1408] = 43811d48 20cf3b39
!	Mem[0000000010001410] = 21428003, %l0 = 0000000000000020
	swapa	[%i0+%o5]0x88,%l0	! %l0 = 0000000021428003
!	%f1  = 1d11ffff, Mem[0000000030101408] = ff800000
	sta	%f1 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 1d11ffff
!	%f14 = 41893f3a, Mem[0000000030041410] = ff5dd2ff
	sta	%f14,[%i1+%o5]0x81	! Mem[0000000030041410] = 41893f3a
!	%f30 = 79647692 25e1d91b, Mem[0000000010081400] = 00ffffff 25000000
	stda	%f30,[%i2+%g0]0x80	! Mem[0000000010081400] = 79647692 25e1d91b
!	Mem[0000000010041400] = ff5dd2ff 1b5555a3 ff00bf20 03804221
!	%f0  = 100aa7f4 1d11ffff 24a38f41 1bd9ff00
!	%f4  = ff800000 ff00bf20 00000000 5e610975
!	%f8  = 00000000 e007ef63 a0f505ff 37f294bf
!	%f12 = baa4d334 64d22dc0 41893f3a a0ff199e
	stda	%f0 ,[%i1+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010041400
!	%l6 = 0000000000000043, Mem[000000001004143e] = 3a3f8941, %asi = 80
	stha	%l6,[%i1+0x03e]%asi	! Mem[000000001004143c] = 3a3f0043
!	Mem[00000000300c1410] = 393bcf20, %l0 = 0000000021428003
	ldstuba	[%i3+%o5]0x81,%l0	! %l0 = 0000000000000039
!	Mem[0000000010101414] = 667f0000, %l5 = fffffffffffff97f, %asi = 80
	lduwa	[%i4+0x014]%asi,%l5	! %l5 = 00000000667f0000

p0_label_112:
!	Starting 10 instruction Load Burst
!	Mem[000000001014142e] = 100d421f, %l2 = 0000000000000000
	ldub	[%i5+0x02e],%l2		! %l2 = 0000000000000042
!	Mem[0000000030101408] = ffff111d, %l1 = ffffffffffffffff
	lduwa	[%i4+%o4]0x89,%l1	! %l1 = 00000000ffff111d
!	Mem[0000000030181400] = 00000000 43de5ac7, %l4 = ffffffff, %l5 = 667f0000
	ldda	[%i6+%g0]0x89,%l4	! %l4 = 0000000043de5ac7 0000000000000000
!	Mem[0000000010081410] = 00000020, %l0 = 0000000000000039
	lduha	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181408] = 00000020, %f25 = 20cf3b39
	lda	[%i6+%o4]0x81,%f25	! %f25 = 00000020
!	Mem[0000000020800040] = 0025b270, %l0 = 0000000000000000, %asi = 80
	lduha	[%o1+0x040]%asi,%l0	! %l0 = 0000000000000025
!	Mem[0000000030141410] = 031c0000, %l1 = 00000000ffff111d
	ldsba	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000003
!	Mem[0000000010141420] = a724226d 61d05459, %l0 = 00000025, %l1 = 00000003, %asi = 80
	ldda	[%i5+0x020]%asi,%l0	! %l0 = 00000000a724226d 0000000061d05459
!	Mem[00000000211c0000] = c44e38a0, %l0 = 00000000a724226d, %asi = 80
	lduha	[%o2+0x000]%asi,%l0	! %l0 = 000000000000c44e
!	Mem[0000000010001410] = 37000000 00000020, %l4 = 43de5ac7, %l5 = 00000000
	ldda	[%i0+%o5]0x88,%l4	! %l4 = 0000000000000020 0000000037000000

p0_label_113:
!	Starting 10 instruction Store Burst
!	%l6 = 00000043, %l7 = 00000025, Mem[0000000010101410] = 00ffff7f 667f0000
	stda	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000043 00000025
!	%l7 = 0000000000000025, Mem[000000001004141e] = 00000000, %asi = 80
	stha	%l7,[%i1+0x01e]%asi	! Mem[000000001004141c] = 00000025
!	%l6 = 0000000000000043, Mem[0000000030001400] = 20bf00ff
	stwa	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000043
!	%f20 = ffd25dff, Mem[000000001004140c] = 418fa324
	sta	%f20,[%i1+0x00c]%asi	! Mem[000000001004140c] = ffd25dff
!	%l6 = 0000000000000043, Mem[0000000010001408] = 79647692
	stba	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = 43647692
!	%l5 = 0000000037000000, Mem[0000000021800141] = ff8689c0
	stb	%l5,[%o3+0x141]		! Mem[0000000021800140] = ff0089c0
!	%l3 = ffffffffff000000, imm = fffffffffffff5c9, %l5 = 0000000037000000
	subc	%l3,-0xa37,%l5		! %l5 = ffffffffff000a37
!	Mem[0000000030081408] = ff0000ff, %l5 = 00000000ff000a37
	swapa	[%i2+%o4]0x89,%l5	! %l5 = 00000000ff0000ff
!	%l6 = 00000043, %l7 = 00000025, Mem[0000000010101400] = 00000000 000000ff
	stda	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000043 00000025
!	Mem[00000000211c0000] = c44e38a0, %l1 = 0000000061d05459
	ldstuba	[%o2+0x000]%asi,%l1	! %l1 = 00000000000000c4

p0_label_114:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ff000000 20bf3140, %l4 = 00000020, %l5 = ff0000ff
	ldda	[%i5+%g0]0x88,%l4	! %l4 = 0000000020bf3140 00000000ff000000
!	Mem[00000000100c1408] = 481d8143, %f25 = 00000020
	lda	[%i3+%o4]0x88,%f25	! %f25 = 481d8143
!	Mem[00000000300c1410] = ff3bcf20 43de5ac7, %l4 = 20bf3140, %l5 = ff000000
	ldda	[%i3+%o5]0x81,%l4	! %l4 = 00000000ff3bcf20 0000000043de5ac7
!	Mem[0000000010081400] = 7964769225e1d91b, %f24 = 43811d48 481d8143
	ldda	[%i2+%g0]0x80,%f24	! %f24 = 79647692 25e1d91b
!	Mem[0000000010141420] = a724226d, %l1 = 00000000000000c4, %asi = 80
	lduba	[%i5+0x020]%asi,%l1	! %l1 = 00000000000000a7
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000010041400] = 100aa7f4 1d11ffff, %l6 = 00000043, %l7 = 00000025
	ldda	[%i1+%g0]0x88,%l6	! %l6 = 000000001d11ffff 00000000100aa7f4
!	Mem[0000000030081410] = ff5dd2ff, %l5 = 0000000043de5ac7
	lduwa	[%i2+%o5]0x89,%l5	! %l5 = 00000000ff5dd2ff
!	Mem[0000000010041430] = c02dd26434d3a4ba, %f6  = 00000000 5e610975
	ldd	[%i1+0x030],%f6 	! %f6  = c02dd264 34d3a4ba
!	Mem[00000000100c1400] = ffff0121, %l6 = 000000001d11ffff
	lduha	[%i3+%g0]0x80,%l6	! %l6 = 000000000000ffff
!	%f31 = 25e1d91b, %f27 = ff00bf20, %f16 = cd93a4ba 65d25d01
	fsmuld	%f31,%f27,%f16		! %f16 = c4ac654a ad921800

p0_label_115:
!	Starting 10 instruction Store Burst
!	Mem[0000000021800100] = 49011b90, %l0 = 000000000000c44e
	ldstuba	[%o3+0x100]%asi,%l0	! %l0 = 0000000000000049
!	Mem[00000000100c1410] = 00000000, %l3 = ffffffffff000000
	ldstuba	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141400] = 20bf3140, %l5 = 00000000ff5dd2ff
	ldstuba	[%i5+%g0]0x88,%l5	! %l5 = 0000000000000040
!	%l2 = 0000000000000042, Mem[0000000010041400] = ffff111d
	stha	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 0042111d
!	%f16 = c4ac654a, Mem[0000000010101400] = 43000000
	sta	%f16,[%i4+%g0]0x88	! Mem[0000000010101400] = c4ac654a
!	Mem[00000000300c1408] = ffff0020, %l5 = 0000000000000040
	swapa	[%i3+%o4]0x81,%l5	! %l5 = 00000000ffff0020
!	Mem[0000000010081400] = 79647692 25e1d91b ff00bf20 00ff4221
!	%f16 = c4ac654a ad921800 ffd25dff 00000000
!	%f20 = ffd25dff 768500ff 34d3a4ba 1b5555a3
!	%f24 = 79647692 25e1d91b e557ba48 ff00bf20
!	%f28 = ffd25dff 00000000 79647692 25e1d91b
	stda	%f16,[%i2+%g0]ASI_BLK_AIUP	! Block Store to 0000000010081400
!	%f12 = baa4d334, Mem[00000000100c1410] = ff000000
	sta	%f12,[%i3+%o5]0x80	! Mem[00000000100c1410] = baa4d334
!	%l5 = 00000000ffff0020, Mem[0000000010181410] = 000000ff
	stwa	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = ffff0020
!	Mem[0000000020800001] = ff20a840, %l0 = 0000000000000049
	ldstub	[%o1+0x001],%l0		! %l0 = 0000000000000020

p0_label_116:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000 ff0000ff, %l4 = ff3bcf20, %l5 = ffff0020
	ldda	[%i6+%o4]0x88,%l4	! %l4 = 00000000ff0000ff 0000000000000000
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000010081408] = ffd25dff00000000, %f14 = 41893f3a a0ff199e
	ldd	[%i2+%o4],%f14		! %f14 = ffd25dff 00000000
!	Mem[00000000300c1410] = 20cf3bff, %l3 = 0000000000000000
	lduba	[%i3+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181400] = ffffffff, %l3 = 00000000000000ff
	ldswa	[%i6+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010001410] = 20000000, %l4 = 00000000ff0000ff
	ldswa	[%i0+%o5]0x80,%l4	! %l4 = 0000000020000000
!	Mem[0000000030001408] = a75e48a1038042ff, %l5 = 0000000000000000
	ldxa	[%i0+%o4]0x89,%l5	! %l5 = a75e48a1038042ff
!	Mem[0000000030081410] = ff5dd2ff, %l3 = ffffffffffffffff
	ldswa	[%i2+%o5]0x89,%l3	! %l3 = ffffffffff5dd2ff
!	Mem[00000000201c0001] = 00001a10, %l7 = 00000000100aa7f4
	ldsb	[%o0+0x001],%l7		! %l7 = 0000000000000000
!	Mem[00000000100c1400] = ffff012124a38f41, %l0 = 0000000000000020
	ldxa	[%i3+%g0]0x80,%l0	! %l0 = ffff012124a38f41
!	Mem[0000000010041428] = bf94f237 ff05f5a0, %l4 = 20000000, %l5 = 038042ff, %asi = 80
	ldda	[%i1+0x028]%asi,%l4	! %l4 = 00000000bf94f237 00000000ff05f5a0

p0_label_117:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = c75ade43, %l2 = 0000000000000042
	lduba	[%i6+%g0]0x81,%l2	! %l2 = 00000000000000c7
!	%f27 = ff00bf20, %f16 = c4ac654a, %f13 = 64d22dc0
	fdivs	%f27,%f16,%f13		! %f13 = 79bf2edb
!	%l4 = 00000000bf94f237, Mem[00000000201c0000] = 00001a10
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = f2371a10
!	Mem[00000000100c142f] = e007ef63, %l4 = 00000000bf94f237
	ldstub	[%i3+0x02f],%l4		! %l4 = 0000000000000063
!	%l1 = 00000000000000a7, Mem[0000000030101400] = 0000000000000000
	stxa	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000000000a7
!	%l7 = 0000000000000000, Mem[00000000300c1400] = c02dd264
	stwa	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	%l6 = 000000000000ffff, Mem[0000000010081414] = 768500ff, %asi = 80
	stha	%l6,[%i2+0x014]%asi	! Mem[0000000010081414] = ffff00ff
!	%l2 = 00000000000000c7, Mem[00000000201c0000] = f2371a10, %asi = 80
	stba	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = c7371a10
!	Mem[0000000010081400] = c4ac654a, %l5 = 00000000ff05f5a0
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 00000000000000c4
!	Mem[0000000010181414] = ff008576, %l3 = 00000000ff5dd2ff
	swap	[%i6+0x014],%l3		! %l3 = 00000000ff008576

p0_label_118:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = c7371a10, %l6 = 000000000000ffff
	ldsb	[%o0+%g0],%l6		! %l6 = ffffffffffffffc7
!	Mem[0000000010041410] = 20bf00ff000080ff, %f22 = 34d3a4ba 1b5555a3
	ldd	[%i1+%o5],%f22		! %f22 = 20bf00ff 000080ff
!	Mem[0000000010041408] = 00ffd91bffd25dff, %f4  = ff800000 ff00bf20
	ldda	[%i1+%o4]0x80,%f4 	! %f4  = 00ffd91b ffd25dff
!	Mem[0000000030041408] = ff800000, %l4 = 0000000000000063
	lduha	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000211c0000] = ff4e38a0, %l3 = 00000000ff008576, %asi = 80
	lduha	[%o2+0x000]%asi,%l3	! %l3 = 000000000000ff4e
!	Mem[0000000030081400] = baa493cd, %l5 = 00000000000000c4
	ldsba	[%i2+%g0]0x89,%l5	! %l5 = ffffffffffffffcd
!	Mem[0000000030041408] = ff800000, %l0 = ffff012124a38f41
	ldsha	[%i1+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %f26 = e557ba48
	lda	[%i3+%g0]0x81,%f26	! %f26 = 00000000
!	Mem[0000000021800141] = ff0089c0, %l2 = 00000000000000c7, %asi = 80
	lduba	[%o3+0x141]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c140f] = 20cf3b39, %l3 = 000000000000ff4e
	ldub	[%i3+0x00f],%l3		! %l3 = 0000000000000039

p0_label_119:
!	Starting 10 instruction Store Burst
!	%f4  = 00ffd91b ffd25dff, %l2 = 0000000000000000
!	Mem[0000000010141400] = ff31bf20000000ff
	stda	%f4,[%i5+%l2]ASI_PST32_P ! Mem[0000000010141400] = ff31bf20000000ff
!	Mem[00000000100c1410] = 34d3a4ba, %l4 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l4	! %l4 = 0000000034d3a4ba
!	%l1 = 00000000000000a7, immd = 00000e44, %y  = ffd25dff
	smul	%l1,0xe44,%l2		! %l2 = 0000000000094e5c, %y = 00000000
!	%l6 = ffffffc7, %l7 = 00000000, Mem[0000000010101410] = 00000043 00000025
	stda	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffffc7 00000000
!	Mem[00000000100c1400] = ffff0121 24a38f41 43811d48 20cf3b39
!	%f0  = 100aa7f4 1d11ffff 24a38f41 1bd9ff00
!	%f4  = 00ffd91b ffd25dff c02dd264 34d3a4ba
!	%f8  = 00000000 e007ef63 a0f505ff 37f294bf
!	%f12 = baa4d334 79bf2edb ffd25dff 00000000
	stda	%f0 ,[%i3+%g0]ASI_BLK_PL	! Block Store to 00000000100c1400
!	%l5 = ffffffffffffffcd, Mem[0000000010141410] = ff000000
	stwa	%l5,[%i5+%o5]0x88	! Mem[0000000010141410] = ffffffcd
!	%l3 = 0000000000000039, Mem[0000000030141410] = 031c0000
	stwa	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000039
!	Mem[0000000010181418] = 34d3a4ba, %l7 = 0000000000000000
	swap	[%i6+0x018],%l7		! %l7 = 0000000034d3a4ba
!	Mem[0000000030041400] = ff0000ff 000000ff 000080ff ff00bf20
!	%f0  = 100aa7f4 1d11ffff 24a38f41 1bd9ff00
!	%f4  = 00ffd91b ffd25dff c02dd264 34d3a4ba
!	%f8  = 00000000 e007ef63 a0f505ff 37f294bf
!	%f12 = baa4d334 79bf2edb ffd25dff 00000000
	stda	%f0 ,[%i1+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030041400
!	%l3 = 0000000000000039, Mem[0000000030041410] = ffd25dff
	stwa	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000039

p0_label_120:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = c75ade43 00000000, %l2 = 00094e5c, %l3 = 00000039
	ldda	[%i6+%g0]0x81,%l2	! %l2 = 00000000c75ade43 0000000000000000
!	Mem[0000000010181410] = 2000ffffff5dd2ff, %l1 = 00000000000000a7
	ldxa	[%i6+%o5]0x80,%l1	! %l1 = 2000ffffff5dd2ff
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000010041422] = 63ef07e0, %l0 = 0000000000000000, %asi = 80
	lduba	[%i1+0x022]%asi,%l0	! %l0 = 0000000000000007
!	Mem[0000000010141408] = 20cf3b39 ff000000, %l6 = ffffffc7, %l7 = 34d3a4ba
	ldda	[%i5+%o4]0x88,%l6	! %l6 = 00000000ff000000 0000000020cf3b39
!	Mem[00000000211c0000] = ff4e38a0, %l5 = ffffffffffffffcd, %asi = 80
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 000000000000ff4e
!	Mem[0000000010041408] = 00ffd91bffd25dff, %l2 = 00000000c75ade43
	ldxa	[%i1+%o4]0x80,%l2	! %l2 = 00ffd91bffd25dff
!	Mem[0000000010181410] = 2000ffff, %l0 = 0000000000000007
	ldsha	[%i6+%o5]0x80,%l0	! %l0 = 0000000000002000
!	%l6 = 00000000ff000000, immd = 000003d7, %y  = 00000000
	umul	%l6,0x3d7,%l5		! %l5 = 000003d329000000, %y = 000003d3
!	Mem[0000000010081400] = ffac654a, %l1 = 2000ffffff5dd2ff
	lduwa	[%i2+%g0]0x80,%l1	! %l1 = 00000000ffac654a
!	Mem[0000000010181421] = 4381ff48, %l6 = 00000000ff000000
	ldub	[%i6+0x021],%l6		! %l6 = 0000000000000081

p0_label_121:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 000000a7, %l2 = 00000000ffd25dff
	swapa	[%i4+%g0]0x89,%l2	! %l2 = 00000000000000a7
!	%l6 = 00000081, %l7 = 20cf3b39, Mem[00000000100c1418] = baa4d334 64d22dc0, %asi = 80
	stda	%l6,[%i3+0x018]%asi	! Mem[00000000100c1418] = 00000081 20cf3b39
!	%f16 = c4ac654a ad921800, Mem[00000000100c1410] = ff5dd2ff 1bd9ff00
	std	%f16,[%i3+%o5]		! Mem[00000000100c1410] = c4ac654a ad921800
!	%l2 = 000000a7, %l3 = 00000000, Mem[0000000030041400] = 1d11ffff 100aa7f4
	stda	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000a7 00000000
!	%f5  = ffd25dff, %f24 = 79647692, %f30 = 79647692
	fmuls	%f5 ,%f24,%f30		! %f30 = ffd25dff
!	Mem[0000000010081409] = ffd25dff, %l3 = 0000000000000000
	ldstub	[%i2+0x009],%l3		! %l3 = 00000000000000d2
!	%l7 = 0000000020cf3b39, Mem[0000000030081410] = ff008576ff5dd2ff
	stxa	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000000020cf3b39
!	%f20 = ffd25dff 768500ff, Mem[0000000030141400] = ff5c875c 00000000
	stda	%f20,[%i5+%g0]0x81	! Mem[0000000030141400] = ffd25dff 768500ff
!	%l2 = 00000000000000a7, Mem[0000000010181408] = ff0000ff
	stba	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = ff0000a7
!	%l4 = 0000000034d3a4ba, Mem[0000000030041410] = 00000039
	stha	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000a4ba

p0_label_122:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 0025b270, %l7 = 0000000020cf3b39
	ldsh	[%o1+0x040],%l7		! %l7 = 0000000000000025
!	Mem[0000000030181410] = ff00c44e, %l4 = 0000000034d3a4ba
	ldsba	[%i6+%o5]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030001408] = ff428003, %f11 = 37f294bf
	lda	[%i0+%o4]0x81,%f11	! %f11 = ff428003
!	Mem[0000000010081400] = 4a65acff, %l2 = 00000000000000a7
	ldswa	[%i2+%g0]0x88,%l2	! %l2 = 000000004a65acff
!	Mem[0000000010001400] = e557ba48 d0a7c6ef, %l0 = 00002000, %l1 = ffac654a
	ldd	[%i0+%g0],%l0		! %l0 = 00000000e557ba48 00000000d0a7c6ef
!	Mem[0000000030041408] = 1bd9ff00, %l4 = ffffffffffffffff
	ldsba	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, %l2 = 000000004a65acff, %l4 = 0000000000000000
	xnor	%l4,%l2,%l4		! %l4 = ffffffffb59a5300
!	%f15 = 00000000, %f3  = 1bd9ff00, %f15 = 00000000
	fadds	%f15,%f3 ,%f15		! %f15 = 1bd9ff00
!	Mem[0000000010181408] = ff0000a7, %l4 = ffffffffb59a5300
	lduha	[%i6+%o4]0x88,%l4	! %l4 = 00000000000000a7
!	Mem[0000000010141410] = ffffffcd, %l1 = 00000000d0a7c6ef
	ldsba	[%i5+%o5]0x88,%l1	! %l1 = ffffffffffffffcd

p0_label_123:
!	Starting 10 instruction Store Burst
!	%f15 = 1bd9ff00, Mem[0000000030001410] = ff5dd2ff
	sta	%f15,[%i0+%o5]0x81	! Mem[0000000030001410] = 1bd9ff00
!	%f30 = ffd25dff 25e1d91b, Mem[00000000100c1428] = bf94f237 ff05f5a0
	std	%f30,[%i3+0x028]	! Mem[00000000100c1428] = ffd25dff 25e1d91b
!	%l6 = 00000081, %l7 = 00000025, Mem[0000000030001408] = ff428003 a1485ea7
	stda	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000081 00000025
!	%l4 = 00000000000000a7, Mem[00000000201c0000] = c7371a10, %asi = 80
	stba	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = a7371a10
!	Mem[0000000021800040] = 7785b900, %l3 = 00000000000000d2
	ldstub	[%o3+0x040],%l3		! %l3 = 0000000000000077
!	Mem[0000000030001410] = 1bd9ff00, %l5 = 000003d329000000
	ldstuba	[%i0+%o5]0x81,%l5	! %l5 = 000000000000001b
!	%l5 = 000000000000001b, Mem[0000000030101410] = 00000000
	stba	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = 1b000000
!	%f12 = baa4d334 79bf2edb, %f10 = a0f505ff ff428003
	fxtod	%f12,%f10		! %f10 = c3d156cb 32e19034
!	Mem[0000000010101408] = 25e1d91b, %l0 = 00000000e557ba48
	swapa	[%i4+%o4]0x88,%l0	! %l0 = 0000000025e1d91b
!	%l7 = 0000000000000025, Mem[0000000010001400] = 48ba57e5
	stba	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 48ba5725

p0_label_124:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ff00000020bf31ff, %l2 = 000000004a65acff
	ldxa	[%i5+%g0]0x88,%l2	! %l2 = ff00000020bf31ff
!	Mem[0000000010181408] = a70000ff, %f28 = ffd25dff
	ld	[%i6+%o4],%f28		! %f28 = a70000ff
!	Mem[0000000010001408] = 43647692, %l3 = 0000000000000077
	lduwa	[%i0+%o4]0x80,%l3	! %l3 = 0000000043647692
!	Mem[0000000010001408] = 4364769225e1d91b, %f14 = ffd25dff 1bd9ff00
	ldda	[%i0+%o4]0x80,%f14	! %f14 = 43647692 25e1d91b
!	Mem[0000000030101400] = ff5dd2ff, %l0 = 0000000025e1d91b
	ldsba	[%i4+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010181408] = a70000ff00000000, %l6 = 0000000000000081
	ldxa	[%i6+%o4]0x80,%l6	! %l6 = a70000ff00000000
!	Mem[0000000020800000] = ffffa840, %l0 = ffffffffffffffff
	ldsh	[%o1+%g0],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010181424] = 20cf3b39, %f28 = a70000ff
	ld	[%i6+0x024],%f28	! %f28 = 20cf3b39
!	Mem[0000000010001410] = 00000020, %l6 = a70000ff00000000
	ldsba	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000020
!	Mem[0000000010041410] = 20bf00ff000080ff, %l3 = 0000000043647692
	ldxa	[%i1+%o5]0x80,%l3	! %l3 = 20bf00ff000080ff

p0_label_125:
!	Starting 10 instruction Store Burst
!	Mem[0000000020800041] = 0025b270, %l2 = ff00000020bf31ff
	ldstuba	[%o1+0x041]%asi,%l2	! %l2 = 0000000000000025
!	%l6 = 0000000000000020, Mem[0000000010001410] = 20000000
	stwa	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000020
!	%l2 = 0000000000000025, %l4 = 00000000000000a7, %l1 = ffffffffffffffcd
	add	%l2,%l4,%l1		! %l1 = 00000000000000cc
!	Mem[0000000010181408] = ff0000a7, %l0 = 00000000ffffffff
	swapa	[%i6+%o4]0x88,%l0	! %l0 = 00000000ff0000a7
!	%l0 = 00000000ff0000a7, Mem[0000000010101438] = 5562abd2
	sth	%l0,[%i4+0x038]		! Mem[0000000010101438] = 00a7abd2
!	%f2  = 24a38f41 1bd9ff00, Mem[0000000010141408] = ff000000 20cf3b39
	stda	%f2 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 24a38f41 1bd9ff00
!	%f18 = ffd25dff, %f27 = ff00bf20
	fcmpes	%fcc0,%f18,%f27		! %fcc0 = 3
!	Mem[0000000030081400] = cd93a4ba, %l4 = 00000000000000a7
	ldstuba	[%i2+%g0]0x81,%l4	! %l4 = 00000000000000cd
!	%l2 = 00000025, %l3 = 000080ff, Mem[0000000030101408] = ffff111d 20bf00ff
	stda	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000025 000080ff
!	Mem[0000000010141400] = 20bf31ff, %l1 = 00000000000000cc
	swapa	[%i5+%g0]0x88,%l1	! %l1 = 0000000020bf31ff

p0_label_126:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 92766443, %f29 = 00000000
	lda	[%i0+%o4]0x88,%f29	! %f29 = 92766443
!	Mem[0000000030001410] = 4ec4ffff00ffd9ff, %l7 = 0000000000000025
	ldxa	[%i0+%o5]0x89,%l7	! %l7 = 4ec4ffff00ffd9ff
!	Mem[0000000010001425] = d0a7c6ef, %l6 = 0000000000000020
	ldub	[%i0+0x025],%l6		! %l6 = 00000000000000a7
!	Mem[0000000010001420] = 10efeae6d0a7c6ef, %l0 = 00000000ff0000a7, %asi = 80
	ldxa	[%i0+0x020]%asi,%l0	! %l0 = 10efeae6d0a7c6ef
!	%f19 = 00000000, %f23 = 000080ff, %f3  = 1bd9ff00
	fmuls	%f19,%f23,%f3 		! %f3  = 00000000
!	Mem[0000000010041400] = 0042111d, %l5 = 000000000000001b
	ldsha	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000042
!	Mem[0000000010041408] = 00ffd91b, %l5 = 0000000000000042
	ldsha	[%i1+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001400] = 2557ba48d0a7c6ef, %f24 = 79647692 25e1d91b
	ldda	[%i0+%g0]0x80,%f24	! %f24 = 2557ba48 d0a7c6ef
!	Code Fragment 3, seed = 158070
p0_fragment_16:
!	%l0 = 10efeae6d0a7c6ef
	setx	0xa9abb28eff158276,%g7,%l0 ! %l0 = a9abb28eff158276
!	%l1 = 0000000020bf31ff
	setx	0xa9bb989ca327e5a1,%g7,%l1 ! %l1 = a9bb989ca327e5a1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a9abb28eff158276
	setx	0xd749ed1844cc7cdc,%g7,%l0 ! %l0 = d749ed1844cc7cdc
!	%l1 = a9bb989ca327e5a1
	setx	0x6d7e7a9e828a4b27,%g7,%l1 ! %l1 = 6d7e7a9e828a4b27
p0_fragment_16_end:
!	Mem[0000000030001410] = ffd9ff00, %l7 = 4ec4ffff00ffd9ff
	lduba	[%i0+%o5]0x81,%l7	! %l7 = 00000000000000ff

p0_label_127:
!	Starting 10 instruction Store Burst
!	Mem[000000001018143c] = 00000007, %l4 = 00000000000000cd, %asi = 80
	swapa	[%i6+0x03c]%asi,%l4	! %l4 = 0000000000000007
!	%l0 = d749ed1844cc7cdc, Mem[0000000010101407] = 00000025
	stb	%l0,[%i4+0x007]		! Mem[0000000010101404] = 000000dc
!	Mem[0000000010001408] = 92766443, %l7 = 00000000000000ff
	ldstuba	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000043
!	%f5  = ffd25dff, %f29 = 92766443
	fcmpes	%fcc1,%f5 ,%f29		! %fcc1 = 3
!	Mem[000000001014143c] = 000000ff, %l7 = 0000000000000043
	swap	[%i5+0x03c],%l7		! %l7 = 00000000000000ff
!	%l3 = 20bf00ff000080ff, Mem[0000000030101400] = 00000000ffd25dff
	stxa	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = 20bf00ff000080ff
!	%l4 = 0000000000000007, %l0 = d749ed1844cc7cdc, %l2 = 0000000000000025
	andn	%l4,%l0,%l2		! %l2 = 0000000000000003
!	%l7 = 00000000000000ff, Mem[0000000010041410] = 20bf00ff000080ff
	stxa	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000000000ff
!	Mem[0000000030081408] = 370a00ff, %l4 = 0000000000000007
	swapa	[%i2+%o4]0x81,%l4	! %l4 = 00000000370a00ff
!	%l2 = 0000000000000003, Mem[0000000030101400] = ff800000ff00bf20
	stxa	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000000003

p0_label_128:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ffffffff, %f0  = 100aa7f4
	lda	[%i6+0x008]%asi,%f0 	! %f0 = ffffffff
!	Mem[0000000030041400] = 000000a7, %l5 = 00000000000000ff
	lduha	[%i1+%g0]0x89,%l5	! %l5 = 00000000000000a7
!	Mem[0000000030041400] = 000000a7, %l2 = 0000000000000003
	ldsba	[%i1+%g0]0x89,%l2	! %l2 = ffffffffffffffa7
!	Mem[0000000030181410] = ff00c44e00000000, %f22 = 20bf00ff 000080ff
	ldda	[%i6+%o5]0x81,%f22	! %f22 = ff00c44e 00000000
!	Mem[00000000100c1400] = ffff111d, %l3 = 20bf00ff000080ff
	ldswa	[%i3+%g0]0x80,%l3	! %l3 = ffffffffffff111d
!	Mem[0000000030081410] = 20cf3b39, %l3 = ffffffffffff111d
	ldsha	[%i2+%o5]0x89,%l3	! %l3 = 0000000000003b39
!	Mem[0000000010001408] = ff647692, %l2 = ffffffffffffffa7
	lduwa	[%i0+%o4]0x80,%l2	! %l2 = 00000000ff647692
!	Mem[0000000010001408] = ff64769225e1d91b, %l5 = 00000000000000a7, %asi = 80
	ldxa	[%i0+0x008]%asi,%l5	! %l5 = ff64769225e1d91b
!	Mem[0000000010081410] = ff5dd2ff, %f15 = 25e1d91b
	lda	[%i2+%o5]0x88,%f15	! %f15 = ff5dd2ff
!	Mem[0000000030141410] = a700000039000000, %f10 = c3d156cb 32e19034
	ldda	[%i5+%o5]0x89,%f10	! %f10 = a7000000 39000000

p0_label_129:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000010041408] = 1bd9ff00
	stba	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = 1bd9ffff
!	%l2 = 00000000ff647692, Mem[00000000211c0000] = ff4e38a0, %asi = 80
	stba	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 924e38a0
!	Mem[0000000030101408] = 25000000, %l1 = 00000000828a4b27
	swapa	[%i4+%o4]0x81,%l1	! %l1 = 0000000025000000
!	%l3 = 0000000000003b39, %l2 = 00000000ff647692, %l3 = 0000000000003b39
	and	%l3,%l2,%l3		! %l3 = 0000000000003210
!	Mem[0000000030181410] = 4ec400ff, %l1 = 0000000025000000
	ldstuba	[%i6+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%l6 = 00000000000000a7, Mem[0000000010101400] = 4a65acc4
	stwa	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000a7
!	Mem[0000000010101400] = 000000a7, %l1 = 000000ff, %l2 = ff647692
	casa	[%i4]0x80,%l1,%l2	! %l2 = 00000000000000a7
!	%l1 = 00000000000000ff, Mem[0000000030081400] = ff93a4ba65d25d01
	stxa	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000000000ff
!	%l4 = 00000000370a00ff, Mem[000000001014141a] = 7bca635a, %asi = 80
	stha	%l4,[%i5+0x01a]%asi	! Mem[0000000010141418] = 7bca00ff
!	%f2  = 24a38f41 00000000, Mem[0000000010001400] = 48ba5725 efc6a7d0
	stda	%f2 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 24a38f41 00000000

p0_label_130:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = baa40000, %l1 = 00000000000000ff
	ldsba	[%i1+%o5]0x81,%l1	! %l1 = ffffffffffffffba
!	Mem[0000000030101410] = 0000001b, %f16 = c4ac654a
	lda	[%i4+%o5]0x89,%f16	! %f16 = 0000001b
!	Mem[0000000010001400] = 00000000, %l3 = 0000000000003210
	lduha	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000201c0000] = a7371a10, %l2 = 00000000000000a7
	lduh	[%o0+%g0],%l2		! %l2 = 000000000000a737
!	Mem[0000000030041410] = baa40000, %l5 = ff64769225e1d91b
	lduwa	[%i1+%o5]0x81,%l5	! %l5 = 00000000baa40000
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000030141400] = ffd25dff 768500ff 00001c03 59dd1317
!	Mem[0000000030141410] = 00000039 000000a7 50b6f60a 2a104fb3
!	Mem[0000000030141420] = 2334a518 5fc581c9 0839c916 5d2e7f0f
!	Mem[0000000030141430] = 18e2cd84 2ffcd505 368499e2 4dbb1d2b
	ldda	[%i5+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030141400
!	Mem[0000000020800040] = 00ffb270, %l5 = 00000000baa40000
	ldsh	[%o1+0x040],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010141428] = 267c7766 100d421f, %l2 = 0000a737, %l3 = 00000000
	ldd	[%i5+0x028],%l2		! %l2 = 00000000267c7766 00000000100d421f
!	Mem[0000000030141400] = ff5dd2ff, %l0 = d749ed1844cc7cdc
	ldswa	[%i5+%g0]0x89,%l0	! %l0 = ffffffffff5dd2ff
!	Mem[0000000010181408] = ffffffff 00000000, %l6 = 000000a7, %l7 = 000000ff, %asi = 80
	ldda	[%i6+0x008]%asi,%l6	! %l6 = 00000000ffffffff 0000000000000000

p0_label_131:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = ffffffff, %l2 = 00000000267c7766
	swapa	[%i6+%o4]0x88,%l2	! %l2 = 00000000ffffffff
!	%l0 = ffffffffff5dd2ff, Mem[0000000010101408] = e557ba48
	stwa	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = ff5dd2ff
!	%f13 = 79bf2edb, %f3  = 00000000, %f15 = ff5dd2ff
	fadds	%f13,%f3 ,%f15		! %f15 = 79bf2edb
!	%f30 = 368499e2, Mem[0000000030081408] = 07000000
	sta	%f30,[%i2+%o4]0x89	! Mem[0000000030081408] = 368499e2
!	Mem[0000000030101410] = 1b000000, %l1 = 00000000ffffffba
	swapa	[%i4+%o5]0x81,%l1	! %l1 = 000000001b000000
!	%l0 = ff5dd2ff, %l1 = 1b000000, Mem[0000000010041420] = 63ef07e0 00000000, %asi = 80
	stda	%l0,[%i1+0x020]%asi	! Mem[0000000010041420] = ff5dd2ff 1b000000
!	Mem[00000000300c1408] = 40000000, %l5 = 00000000000000ff
	swapa	[%i3+%o4]0x89,%l5	! %l5 = 0000000040000000
!	%f12 = baa4d334 79bf2edb, Mem[0000000010141418] = 7bca00ff 5c7975c3
	std	%f12,[%i5+0x018]	! Mem[0000000010141418] = baa4d334 79bf2edb
!	%l2 = 00000000ffffffff, Mem[000000001010142a] = 6bd36806, %asi = 80
	stha	%l2,[%i4+0x02a]%asi	! Mem[0000000010101428] = 6bd3ffff
!	%l4 = 370a00ff, %l5 = 40000000, Mem[0000000010141408] = 00ffd91b 418fa324
	stda	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 370a00ff 40000000

p0_label_132:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = baffffff, %f12 = baa4d334
	lda	[%i4+%o5]0x89,%f12	! %f12 = baffffff
!	Mem[00000000300c1410] = c75ade43 20cf3bff, %l6 = ffffffff, %l7 = 00000000
	ldda	[%i3+%o5]0x89,%l6	! %l6 = 0000000020cf3bff 00000000c75ade43
!	Mem[0000000030181408] = 20000000, %l1 = 000000001b000000
	lduha	[%i6+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081410] = ffd25dff, %l1 = 0000000000000000
	lduwa	[%i2+%o5]0x80,%l1	! %l1 = 00000000ffd25dff
!	Mem[0000000030041400] = 00000000000000a7, %l3 = 00000000100d421f
	ldxa	[%i1+%g0]0x89,%l3	! %l3 = 00000000000000a7
!	Mem[0000000010181408] = 267c7766, %l3 = 00000000000000a7
	ldsba	[%i6+%o4]0x88,%l3	! %l3 = 0000000000000066
!	Mem[0000000010141408] = 00000040ff000a37, %f6  = c02dd264 34d3a4ba
	ldda	[%i5+%o4]0x88,%f6 	! %f6  = 00000040 ff000a37
!	Mem[00000000100c1400] = ffff111d, %l7 = 00000000c75ade43, %asi = 80
	ldswa	[%i3+0x000]%asi,%l7	! %l7 = ffffffffffff111d
!	Mem[0000000030081400] = 00000000, %f3  = 00000000
	lda	[%i2+%g0]0x89,%f3 	! %f3 = 00000000
!	Mem[0000000020800001] = ffffa840, %l4 = 00000000370a00ff, %asi = 80
	ldsba	[%o1+0x001]%asi,%l4	! %l4 = ffffffffffffffff

p0_label_133:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ffd25dff, Mem[0000000030001400] = 00000043
	stwa	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = ffd25dff
!	%l1 = 00000000ffd25dff, Mem[0000000010041410] = 00000000000000ff
	stxa	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000ffd25dff
!	%l5 = 0000000040000000, Mem[0000000010181438] = 00000af2000000cd, %asi = 80
	stxa	%l5,[%i6+0x038]%asi	! Mem[0000000010181438] = 0000000040000000
!	Mem[00000000100c1400] = 1d11ffff, %l1 = 00000000ffd25dff
	ldstuba	[%i3+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001410] = 00000020, %l7 = 00000000ffff111d
	swapa	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000020
!	%f26 = 0839c916, Mem[0000000030101408] = 828a4b27
	sta	%f26,[%i4+%o4]0x81	! Mem[0000000030101408] = 0839c916
!	Mem[0000000030181410] = ff00c44e, %l0 = ffffffffff5dd2ff
	ldstuba	[%i6+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%l5 = 0000000040000000, Mem[0000000010041410] = 00000000
	stba	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	%l2 = ffffffff, %l3 = 00000066, Mem[0000000030001408] = 81000000 25000000
	stda	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffff 00000066
!	Mem[0000000021800140] = ff0089c0, %l0 = 00000000000000ff
	ldstub	[%o3+0x140],%l0		! %l0 = 00000000000000ff

p0_label_134:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 100aa7f4 1d11ffff, %l4 = ffffffff, %l5 = 40000000
	ldda	[%i3+%g0]0x88,%l4	! %l4 = 000000001d11ffff 00000000100aa7f4
!	Mem[0000000010181434] = 5e610975, %l3 = 0000000000000066
	ldsh	[%i6+0x034],%l3		! %l3 = 0000000000005e61
!	Mem[0000000010041410] = ff5dd2ff00000000, %f18 = 00001c03 59dd1317
	ldda	[%i1+%o5]0x88,%f18	! %f18 = ff5dd2ff 00000000
!	Mem[0000000010041410] = 00000000, %l2 = 00000000ffffffff
	ldsba	[%i1+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141410] = 00000039, %l0 = 00000000000000ff
	ldsba	[%i5+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081410] = ffd25dff, %l4 = 000000001d11ffff
	lduwa	[%i2+%o5]0x80,%l4	! %l4 = 00000000ffd25dff
!	Mem[00000000100c1410] = c4ac654aad921800, %f14 = 43647692 79bf2edb
	ldda	[%i3+%o5]0x80,%f14	! %f14 = c4ac654a ad921800
!	Mem[0000000030081410] = 393bcf2000000000, %f4  = 00ffd91b ffd25dff
	ldda	[%i2+%o5]0x81,%f4 	! %f4  = 393bcf20 00000000
!	Mem[0000000010101408] = ffd25dff, %l2 = 0000000000000000
	ldswa	[%i4+%o4]0x80,%l2	! %l2 = ffffffffffd25dff
!	Mem[0000000020800041] = 00ffb270, %l6 = 0000000020cf3bff
	ldsb	[%o1+0x041],%l6		! %l6 = ffffffffffffffff

p0_label_135:
!	Starting 10 instruction Store Burst
!	%l2 = ffd25dff, %l3 = 00005e61, Mem[0000000010001400] = 00000000 418fa324
	stda	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = ffd25dff 00005e61
!	%l1 = 00000000000000ff, Mem[0000000010001410] = 370000001d11ffff
	stxa	%l1,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000000000ff
!	Mem[0000000010181430] = 000000005e610975, %l7 = 0000000000000020, %l7 = 0000000000000020
	add	%i6,0x30,%g1
	casxa	[%g1]0x80,%l7,%l7	! %l7 = 000000005e610975
!	%f4  = 393bcf20, Mem[0000000010181410] = ffff0020
	sta	%f4 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 393bcf20
!	%l0 = 00000000, %l1 = 000000ff, Mem[00000000100c1410] = c4ac654a ad921800
	stda	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000 000000ff
!	%l1 = 00000000000000ff, Mem[0000000030001400] = ff5dd2ff00000000
	stxa	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000030001408] = ffffffff
	stba	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffff00
	membar	#Sync			! Added by membar checker (27)
!	%l1 = 00000000000000ff, Mem[0000000030141408] = 031c0000
	stha	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = 031c00ff
!	Mem[0000000010181438] = 00000000, %l4 = 00000000ffd25dff
	ldstuba	[%i6+0x038]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041400] = 1d114200, %l3 = 0000000000005e61
	lduba	[%i1+%g0]0x88,%l3	! %l3 = 0000000000000000

p0_label_136:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 0839c916, %l1 = 00000000000000ff
	ldsba	[%i4+%o4]0x81,%l1	! %l1 = 0000000000000008
!	Mem[0000000030001400] = 00000000, %l7 = 000000005e610975
	lduwa	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081400] = ffac654aad921800, %f10 = a7000000 39000000
	ldda	[%i2+%g0]0x80,%f10	! %f10 = ffac654a ad921800
!	%l6 = ffffffffffffffff, immd = fffffffffffff937, %l108 = 0000000000000002
	sdivx	%l6,-0x6c9,%l2		! %l2 = 0000000000000000
!	Mem[00000000100c1400] = ffff111d, %f14 = c4ac654a
	ld	[%i3+%g0],%f14		! %f14 = ffff111d
!	Mem[0000000010081410] = ffd25dffffff00ff, %l1 = 0000000000000008
	ldxa	[%i2+%o5]0x80,%l1	! %l1 = ffd25dffffff00ff
!	Mem[00000000100c1428] = ffd25dff, %l7 = 0000000000000000, %asi = 80
	ldswa	[%i3+0x028]%asi,%l7	! %l7 = ffffffffffd25dff
!	Mem[00000000100c1431] = db2ebf79, %l6 = ffffffffffffffff, %asi = 80
	ldsba	[%i3+0x031]%asi,%l6	! %l6 = 000000000000002e
!	Mem[0000000010181418] = 00000000, %f15 = ad921800
	lda	[%i6+0x018]%asi,%f15	! %f15 = 00000000
!	Mem[0000000010001400] = ffd25dff, %l3 = 0000000000000000
	lduba	[%i0+%g0]0x80,%l3	! %l3 = 00000000000000ff

p0_label_137:
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffd25dff, Mem[0000000030101400] = 0300000000000000
	stxa	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffffffffd25dff
!	%l1 = ffd25dffffff00ff, Mem[0000000010101400] = a7000000
	stha	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = a70000ff
!	%f28 = 18e2cd84, %f15 = 00000000, %f2  = 24a38f41 00000000
	fsmuld	%f28,%f15,%f2 		! %f2  = 00000000 00000000
!	%l5 = 00000000100aa7f4, Mem[000000001000141c] = 38bc6663, %asi = 80
	stwa	%l5,[%i0+0x01c]%asi	! Mem[000000001000141c] = 100aa7f4
!	%f10 = ffac654a ad921800, %l6 = 000000000000002e
!	Mem[0000000010041400] = 0042111df4a70a10
	stda	%f10,[%i1+%l6]ASI_PST8_PL ! Mem[0000000010041400] = 001892adf4650a10
!	Mem[0000000010041400] = 001892ad, %l7 = ffffffffffd25dff
	ldstuba	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001424] = d0a7c6ef, %l5 = 100aa7f4, %l0 = 00000000
	add	%i0,0x24,%g1
	casa	[%g1]0x80,%l5,%l0	! %l0 = 00000000d0a7c6ef
!	Mem[0000000010141410] = ffffffcd, %l7 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l7	! %l7 = 00000000ffffffcd
!	%f24 = 2334a518 5fc581c9, Mem[0000000030101400] = ffd25dff ffffffff
	stda	%f24,[%i4+%g0]0x89	! Mem[0000000030101400] = 2334a518 5fc581c9
!	Mem[0000000030041410] = baa40000, %l0 = 00000000d0a7c6ef
	swapa	[%i1+%o5]0x81,%l0	! %l0 = 00000000baa40000

p0_label_138:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101404] = 000000dc, %l5 = 00000000100aa7f4, %asi = 80
	lduwa	[%i4+0x004]%asi,%l5	! %l5 = 00000000000000dc
!	Mem[00000000100c1410] = 00000000, %l1 = ffd25dffffff00ff
	ldswa	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141400] = cc000000, %l5 = 00000000000000dc
	lduh	[%i5+%g0],%l5		! %l5 = 000000000000cc00
!	Mem[00000000300c1410] = ff3bcf20, %l4 = 0000000000000000
	ldswa	[%i3+%o5]0x81,%l4	! %l4 = ffffffffff3bcf20
!	Mem[0000000010001400] = ff5dd2ff, %l6 = 000000000000002e
	ldswa	[%i0+%g0]0x88,%l6	! %l6 = ffffffffff5dd2ff
!	Mem[00000000201c0000] = a7371a10, %l0 = 00000000baa40000
	ldsh	[%o0+%g0],%l0		! %l0 = ffffffffffffa737
!	Mem[0000000010041410] = 00000000, %l4 = ffffffffff3bcf20
	ldsba	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l3 = 00000000000000ff
	ldsba	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141400] = cc000000, %l0 = ffffffffffffa737
	ldswa	[%i5+%g0]0x80,%l0	! %l0 = ffffffffcc000000
!	Mem[0000000030001408] = ffffff00, %l2 = 0000000000000000
	lduwa	[%i0+%o4]0x89,%l2	! %l2 = 00000000ffffff00

p0_label_139:
!	Starting 10 instruction Store Burst
!	%l2 = ffffff00, %l3 = 00000000, Mem[0000000030001400] = 00000000 ff000000
	stda	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffff00 00000000
!	%l7 = 00000000ffffffcd, Mem[0000000021800100] = ff011b90
	sth	%l7,[%o3+0x100]		! Mem[0000000021800100] = ffcd1b90
!	Code Fragment 3, seed = 515126
p0_fragment_17:
!	%l0 = ffffffffcc000000
	setx	0x461a44de6498ac76,%g7,%l0 ! %l0 = 461a44de6498ac76
!	%l1 = 0000000000000000
	setx	0x2c0f59dfb00aefa1,%g7,%l1 ! %l1 = 2c0f59dfb00aefa1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 461a44de6498ac76
	setx	0x255d7199c08966dc,%g7,%l0 ! %l0 = 255d7199c08966dc
!	%l1 = 2c0f59dfb00aefa1
	setx	0x88f611dfa37b1527,%g7,%l1 ! %l1 = 88f611dfa37b1527
p0_fragment_17_end:
!	%f22 = 50b6f60a 2a104fb3, %l3 = 0000000000000000
!	Mem[00000000300c1438] = 7f573f2221fae56b
	add	%i3,0x038,%g1
	stda	%f22,[%g1+%l3]ASI_PST16_S ! Mem[00000000300c1438] = 7f573f2221fae56b
!	%f18 = ff5dd2ff 00000000, %l5 = 000000000000cc00
!	Mem[0000000010101428] = 6bd3ffff477055a3
	add	%i4,0x028,%g1
	stda	%f18,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010101428] = 6bd3ffff477055a3
!	Mem[0000000010101400] = ff0000a7, %l4 = 0000000000000000
	ldstuba	[%i4+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	%l6 = ffffffffff5dd2ff, Mem[00000000201c0001] = a7371a10, %asi = 80
	stba	%l6,[%o0+0x001]%asi	! Mem[00000000201c0000] = a7ff1a10
!	%l5 = 000000000000cc00, imm = ffffffffffffff93, %l0 = 255d7199c08966dc
	sub	%l5,-0x06d,%l0		! %l0 = 000000000000cc6d
!	%l4 = 00000000000000ff, Mem[0000000020800000] = ffffa840
	stb	%l4,[%o1+%g0]		! Mem[0000000020800000] = ffffa840
!	%f16 = ffd25dff 768500ff, Mem[0000000030141408] = ff001c03 59dd1317
	stda	%f16,[%i5+%o4]0x81	! Mem[0000000030141408] = ffd25dff 768500ff

p0_label_140:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff5dd2ff, %l4 = 00000000000000ff
	lduwa	[%i4+%o4]0x88,%l4	! %l4 = 00000000ff5dd2ff
!	Mem[0000000010181410] = 20cf3b39ff5dd2ff, %f20 = 00000039 000000a7
	ldda	[%i6+%o5]0x80,%f20	! %f20 = 20cf3b39 ff5dd2ff
!	Mem[0000000010181434] = 5e610975, %l5 = 000000000000cc00, %asi = 80
	ldswa	[%i6+0x034]%asi,%l5	! %l5 = 000000005e610975
!	Mem[0000000030041400] = a7000000, %l2 = 00000000ffffff00
	ldsba	[%i1+%g0]0x81,%l2	! %l2 = ffffffffffffffa7
!	Mem[0000000030001408] = 00ffffff66000000, %f4  = 393bcf20 00000000
	ldda	[%i0+%o4]0x81,%f4 	! %f4  = 00ffffff 66000000
!	Mem[0000000030081400] = 00000000, %l3 = 0000000000000000
	lduwa	[%i2+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181410] = 20cf3b39 ff5dd2ff, %l4 = ff5dd2ff, %l5 = 5e610975, %asi = 80
	ldda	[%i6+0x010]%asi,%l4	! %l4 = 0000000020cf3b39 00000000ff5dd2ff
!	Mem[000000001004142f] = ff05f5a0, %l2 = ffffffffffffffa7, %asi = 80
	ldsba	[%i1+0x02f]%asi,%l2	! %l2 = ffffffffffffffa0
!	Mem[0000000010181408] = 66777c2600000000, %f4  = 00ffffff 66000000
	ldda	[%i6+%o4]0x80,%f4 	! %f4  = 66777c26 00000000
!	Mem[0000000010181408] = 267c7766, %l0 = 000000000000cc6d
	ldswa	[%i6+%o4]0x88,%l0	! %l0 = 00000000267c7766

p0_label_141:
!	Starting 10 instruction Store Burst
!	%l1 = 88f611dfa37b1527, Mem[0000000021800081] = 1b2bb330, %asi = 80
	stba	%l1,[%o3+0x081]%asi	! Mem[0000000021800080] = 1b27b330
!	%f8  = 00000000, Mem[00000000300c1410] = 20cf3bff
	sta	%f8 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	%l0 = 267c7766, %l1 = a37b1527, Mem[0000000030041408] = 1bd9ff00 24a38f41
	stda	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 267c7766 a37b1527
!	%l3 = 0000000000000000, Mem[0000000030041410] = efc6a7d0
	stha	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = efc60000
!	%l2 = ffffffa0, %l3 = 00000000, Mem[0000000030141410] = 39000000 a7000000
	stda	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffffa0 00000000
!	%f2  = 00000000 00000000, Mem[0000000010181400] = ffffffff 0000001d
	stda	%f2 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 00000000
!	%l3 = 0000000000000000, Mem[0000000030101410] = ffffffba
	stba	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 00ffffba
!	Mem[0000000030001400] = ffffff00, %l4 = 0000000020cf3b39
	ldstuba	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1400] = ffff111d, %l1 = 88f611dfa37b1527
	ldstuba	[%i3+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001410] = ff000000, %l4 = 0000000000000000
	swapa	[%i0+%o5]0x80,%l4	! %l4 = 00000000ff000000

p0_label_142:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00ffffba, %l0 = 00000000267c7766
	ldsha	[%i4+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %f25 = 5fc581c9
	lda	[%i6+%g0]0x88,%f25	! %f25 = 00000000
!	Mem[0000000010101408] = ff5dd2ff, %l4 = 00000000ff000000
	ldswa	[%i4+%o4]0x88,%l4	! %l4 = ffffffffff5dd2ff
!	Mem[0000000030001408] = 00ffffff, %l4 = ffffffffff5dd2ff
	ldsba	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181408] = 00000020 c75ade43, %l6 = ff5dd2ff, %l7 = ffffffcd
	ldda	[%i6+%o4]0x81,%l6	! %l6 = 0000000000000020 00000000c75ade43
!	Mem[000000001010142a] = 6bd3ffff, %l5 = 00000000ff5dd2ff
	lduh	[%i4+0x02a],%l5		! %l5 = 000000000000ffff
!	Mem[0000000010181408] = 00000000267c7766, %f20 = 20cf3b39 ff5dd2ff
	ldda	[%i6+%o4]0x88,%f20	! %f20 = 00000000 267c7766
!	Mem[0000000030181400] = 43de5ac7, %f19 = 00000000
	lda	[%i6+%g0]0x89,%f19	! %f19 = 43de5ac7
!	Mem[00000000100c1424] = 00000000, %f25 = 00000000
	lda	[%i3+0x024]%asi,%f25	! %f25 = 00000000
!	Mem[0000000030101400] = c981c55f18a53423, %f2  = 00000000 00000000
	ldda	[%i4+%g0]0x81,%f2 	! %f2  = c981c55f 18a53423

p0_label_143:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 1bd9ffff, %l3 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%l2 = ffffffffffffffa0, Mem[0000000030181410] = ff00c44e
	stwa	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffffa0
!	%l3 = 00000000000000ff, imm = 0000000000000ac1, %l7 = 00000000c75ade43
	xor	%l3,0xac1,%l7		! %l7 = 0000000000000a3e
!	%l1 = 00000000000000ff, %l3 = 00000000000000ff, %l2 = ffffffffffffffa0
	xor	%l1,%l3,%l2		! %l2 = 0000000000000000
!	Mem[000000001004141f] = 00000025, %l2 = 0000000000000000
	ldstub	[%i1+0x01f],%l2		! %l2 = 0000000000000025
!	%l0 = 00000000000000ff, Mem[0000000010041408] = ffffd91bffd25dff
	stxa	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000000000ff
!	Mem[0000000030041410] = efc60000, %l4 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l4	! %l4 = 00000000efc60000
!	Mem[0000000010041420] = ff5dd2ff1b000000, %l6 = 0000000000000020, %l7 = 0000000000000a3e
	add	%i1,0x20,%g1
	casxa	[%g1]0x80,%l6,%l7	! %l7 = ff5dd2ff1b000000
!	%l7 = ff5dd2ff1b000000, Mem[0000000030001410] = ffd9ff00ffffc44e
	stxa	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = ff5dd2ff1b000000
!	%l4 = efc60000, %l5 = 0000ffff, Mem[00000000100c1428] = ffd25dff 25e1d91b, %asi = 80
	stda	%l4,[%i3+0x028]%asi	! Mem[00000000100c1428] = efc60000 0000ffff

p0_label_144:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 000000a7, %l1 = 00000000000000ff
	ldswa	[%i1+%g0]0x89,%l1	! %l1 = 00000000000000a7
!	Mem[0000000030081410] = 393bcf20, %l3 = 00000000000000ff
	ldsba	[%i2+%o5]0x81,%l3	! %l3 = 0000000000000039
!	Mem[0000000010101400] = a70000ff, %l4 = 00000000efc60000
	ldsha	[%i4+%g0]0x88,%l4	! %l4 = 00000000000000ff
	membar	#Sync			! Added by membar checker (28)
!	Mem[00000000300c1400] = 00000000 2580a741 ff000000 00000000
!	Mem[00000000300c1410] = 00000000 43de5ac7 13a7534a 7e03eff3
!	Mem[00000000300c1420] = 6ab89c58 01f61409 5347aa56 2a87134f
!	Mem[00000000300c1430] = 4a8f68c4 73fcfb45 7f573f22 21fae56b
	ldda	[%i3+%g0]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	%l4 = 00000000000000ff, %l6 = 0000000000000020, %y  = 000003d3
	sdiv	%l4,%l6,%l1		! %l1 = 000000007fffffff
	mov	%l0,%y			! %y = 000000ff
!	Mem[0000000030081410] = 393bcf20, %l6 = 0000000000000020
	lduba	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000039
!	Mem[0000000030181408] = 00000020, %l0 = 00000000000000ff
	lduwa	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000020
!	Mem[0000000030181400] = c75ade43, %l3 = 0000000000000039
	lduba	[%i6+%g0]0x81,%l3	! %l3 = 00000000000000c7
!	Mem[0000000010041408] = 00000000, %l2 = 0000000000000025
	lduha	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001410] = 0000000000000000, %l6 = 0000000000000039
	ldxa	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000

p0_label_145:
!	Starting 10 instruction Store Burst
!	%l4 = 000000ff, %l5 = 0000ffff, Mem[0000000030101410] = 00ffffba 481d8143
	stda	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000ff 0000ffff
!	%l5 = 000000000000ffff, Mem[0000000010081424] = 25e1d91b
	sth	%l5,[%i2+0x024]		! Mem[0000000010081424] = ffffd91b
!	%l5 = 000000000000ffff, Mem[0000000030101408] = 0839c916
	stwa	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000ffff
!	Mem[0000000030101410] = 000000ff, %l1 = 000000007fffffff
	swapa	[%i4+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	%f17 = 2580a741, Mem[0000000030101408] = ffff0000
	sta	%f17,[%i4+%o4]0x89	! Mem[0000000030101408] = 2580a741
!	Mem[0000000010181420] = 4381ff48, %l6 = 00000000, %l5 = 0000ffff
	add	%i6,0x20,%g1
	casa	[%g1]0x80,%l6,%l5	! %l5 = 000000004381ff48
!	Mem[0000000030141400] = ff5dd2ff, %l5 = 000000004381ff48
	swapa	[%i5+%g0]0x89,%l5	! %l5 = 00000000ff5dd2ff
!	Mem[0000000010101424] = 1b5555a3, %l7 = 000000001b000000
	swap	[%i4+0x024],%l7		! %l7 = 000000001b5555a3
!	%l7 = 000000001b5555a3, Mem[0000000030001400] = ffffffff
	stwa	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = 1b5555a3
!	%l7 = 000000001b5555a3, Mem[0000000010101417] = 00000000, %asi = 80
	stba	%l7,[%i4+0x017]%asi	! Mem[0000000010101414] = 000000a3

p0_label_146:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff000a37, %l6 = 0000000000000000
	ldsha	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000a37
!	Mem[0000000010101400] = a70000ff, %f13 = 79bf2edb
	lda	[%i4+%g0]0x88,%f13	! %f13 = a70000ff
!	Mem[0000000030081410] = 0000000020cf3b39, %l5 = 00000000ff5dd2ff
	ldxa	[%i2+%o5]0x89,%l5	! %l5 = 0000000020cf3b39
!	Mem[0000000030081408] = e2998436, %l5 = 0000000020cf3b39
	ldstuba	[%i2+%o4]0x81,%l5	! %l5 = 00000000000000e2
!	Code Fragment 4, seed = 889091
p0_fragment_18:
!	%l0 = 0000000000000020
	setx	0xe672d1f0c49a630e,%g7,%l0 ! %l0 = e672d1f0c49a630e
!	%l1 = 00000000000000ff
	setx	0x31d591e57b94c2b9,%g7,%l1 ! %l1 = 31d591e57b94c2b9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = e672d1f0c49a630e
	setx	0x66b2f743d8baae74,%g7,%l0 ! %l0 = 66b2f743d8baae74
!	%l1 = 31d591e57b94c2b9
	setx	0xdd0583771433a93f,%g7,%l1 ! %l1 = dd0583771433a93f
p0_fragment_18_end:
!	Mem[0000000010001408] = 1bd9e125927664ff, %f18 = ff000000 00000000
	ldda	[%i0+%o4]0x88,%f18	! %f18 = 1bd9e125 927664ff
!	Mem[00000000100c1410] = 00000000, %f9  = e007ef63
	lda	[%i3+%o5]0x80,%f9 	! %f9 = 00000000
!	Mem[00000000201c0000] = a7ff1a10, %l4 = 00000000000000ff, %asi = 80
	lduha	[%o0+0x000]%asi,%l4	! %l4 = 000000000000a7ff
!	Mem[00000000211c0001] = 924e38a0, %l4 = 000000000000a7ff
	ldsb	[%o2+0x001],%l4		! %l4 = 000000000000004e
!	Mem[0000000010141428] = 267c7766, %l4 = 000000000000004e, %asi = 80
	ldsha	[%i5+0x028]%asi,%l4	! %l4 = 000000000000267c

p0_label_147:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = 20000000, %l5 = 00000000000000e2
	ldstuba	[%i6+%o4]0x89,%l5	! %l5 = 0000000000000000
!	%f30 = 7f573f22 21fae56b, Mem[0000000010101400] = ff0000a7 000000dc, %asi = 80
	stda	%f30,[%i4+0x000]%asi	! Mem[0000000010101400] = 7f573f22 21fae56b
!	%l4 = 0000267c, %l5 = 00000000, Mem[00000000100c1410] = 00000000 000000ff
	stda	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000267c 00000000
!	%f4  = 66777c26 00000000, Mem[0000000030181408] = 200000ff 43de5ac7
	stda	%f4 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 66777c26 00000000
!	Mem[0000000030101410] = ffffff7f, %l0 = 66b2f743d8baae74
	ldstuba	[%i4+%o5]0x89,%l0	! %l0 = 000000000000007f
!	Mem[0000000030001410] = ff5dd2ff, %l4 = 000000000000267c
	swapa	[%i0+%o5]0x81,%l4	! %l4 = 00000000ff5dd2ff
!	%l3 = 00000000000000c7, Mem[0000000010041418] = 7509615e000000ff, %asi = 80
	stxa	%l3,[%i1+0x018]%asi	! Mem[0000000010041418] = 00000000000000c7
!	Mem[0000000010001410] = 00000000, %l0 = 000000000000007f
	ldstuba	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030081400] = 00000000
	stha	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	%l5 = 0000000000000000, %l5 = 0000000000000000, %l6 = 0000000000000a37
	and	%l5,%l5,%l6		! %l6 = 0000000000000000

p0_label_148:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 000000a7, %l1 = dd0583771433a93f
	ldswa	[%i1+%g0]0x89,%l1	! %l1 = 00000000000000a7
!	Mem[0000000010181410] = ffd25dff393bcf20, %l2 = 0000000000000000
	ldxa	[%i6+%o5]0x88,%l2	! %l2 = ffd25dff393bcf20
!	Mem[0000000030081400] = ff000000 00000000, %l2 = 393bcf20, %l3 = 000000c7
	ldda	[%i2+%g0]0x89,%l2	! %l2 = 0000000000000000 00000000ff000000
!	Mem[0000000010001408] = 1bd9e125927664ff, %l4 = 00000000ff5dd2ff
	ldxa	[%i0+%o4]0x88,%l4	! %l4 = 1bd9e125927664ff
!	Mem[0000000010181410] = 20cf3b39 ff5dd2ff, %l6 = 00000000, %l7 = 1b5555a3
	ldda	[%i6+%o5]0x80,%l6	! %l6 = 0000000020cf3b39 00000000ff5dd2ff
!	Mem[0000000010041400] = ff1892adf4650a10, %l4 = 1bd9e125927664ff
	ldxa	[%i1+%g0]0x80,%l4	! %l4 = ff1892adf4650a10
!	Mem[0000000010001424] = d0a7c6ef, %l4 = ff1892adf4650a10
	ldsw	[%i0+0x024],%l4		! %l4 = ffffffffd0a7c6ef
!	Mem[0000000010141410] = 00000000 ffffffff, %l2 = 00000000, %l3 = ff000000, %asi = 80
	ldda	[%i5+0x010]%asi,%l2	! %l2 = 0000000000000000 00000000ffffffff
!	Mem[0000000030081410] = 20cf3b39, %l6 = 0000000020cf3b39
	ldswa	[%i2+%o5]0x89,%l6	! %l6 = 0000000020cf3b39
!	Mem[000000001008141a] = 34d3a4ba, %l7 = 00000000ff5dd2ff, %asi = 80
	ldsha	[%i2+0x01a]%asi,%l7	! %l7 = ffffffffffffa4ba

p0_label_149:
!	Starting 10 instruction Store Burst
!	%f11 = ad921800, Mem[0000000030001410] = 0000267c
	sta	%f11,[%i0+%o5]0x81	! Mem[0000000030001410] = ad921800
!	%l6 = 20cf3b39, %l7 = ffffa4ba, Mem[0000000010081408] = ffff5dff 00000000
	stda	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 20cf3b39 ffffa4ba
!	%l0 = 0000000000000000, Mem[0000000010001410] = 00000000000000ff
	stxa	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000000000
!	%f6  = 00000040 ff000a37, Mem[0000000010041408] = 00000000 ff000000
	stda	%f6 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000040 ff000a37
!	Mem[0000000030001410] = ad921800, %l2 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l2	! %l2 = 00000000000000ad
	membar	#Sync			! Added by membar checker (29)
!	%f30 = 7f573f22 21fae56b, Mem[00000000300c1400] = 00000000 2580a741
	stda	%f30,[%i3+%g0]0x81	! Mem[00000000300c1400] = 7f573f22 21fae56b
!	%l4 = ffffffffd0a7c6ef, %l4 = ffffffffd0a7c6ef, %l5 = 0000000000000000
	xnor	%l4,%l4,%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010141410] = 00000000, %l5 = 00000000ffffffff
	swapa	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000000
!	%l4 = ffffffffd0a7c6ef, Mem[0000000030081400] = ff00000000000000
	stxa	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffffd0a7c6ef
!	%l2 = 00000000000000ad, Mem[0000000010181433] = 00000000
	stb	%l2,[%i6+0x033]		! Mem[0000000010181430] = 000000ad

p0_label_150:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 223f577f, %f13 = a70000ff
	lda	[%i3+%g0]0x89,%f13	! %f13 = 223f577f
!	Mem[0000000010001408] = ff647692, %l7 = ffffffffffffa4ba
	lduha	[%i0+%o4]0x80,%l7	! %l7 = 000000000000ff64
!	Mem[0000000010101408] = ffd25dff, %l7 = 000000000000ff64
	ldswa	[%i4+%o4]0x80,%l7	! %l7 = ffffffffffd25dff
!	Mem[0000000030101408] = 41a78025ff800000, %l5 = 0000000000000000
	ldxa	[%i4+%o4]0x81,%l5	! %l5 = 41a78025ff800000
!	Mem[0000000010041400] = ff1892ad, %l1 = 00000000000000a7
	ldsh	[%i1+%g0],%l1		! %l1 = ffffffffffffff18
!	Mem[00000000100c1428] = efc60000 0000ffff, %l4 = d0a7c6ef, %l5 = ff800000, %asi = 80
	ldda	[%i3+0x028]%asi,%l4	! %l4 = 00000000efc60000 000000000000ffff
!	Mem[0000000010001410] = 00000000, %f22 = 13a7534a
	lda	[%i0+%o5]0x88,%f22	! %f22 = 00000000
!	Mem[0000000030141408] = ff008576 ff5dd2ff, %l0 = 00000000, %l1 = ffffff18
	ldda	[%i5+%o4]0x89,%l0	! %l0 = 00000000ff5dd2ff 00000000ff008576
!	Mem[0000000030041408] = a37b1527267c7766, %l2 = 00000000000000ad
	ldxa	[%i1+%o4]0x89,%l2	! %l2 = a37b1527267c7766
!	Mem[00000000201c0001] = a7ff1a10, %l6 = 0000000020cf3b39, %asi = 80
	ldsba	[%o0+0x001]%asi,%l6	! %l6 = ffffffffffffffff

p0_label_151:
!	Starting 10 instruction Store Burst
!	%l3 = 00000000ffffffff, Mem[0000000010181408] = 267c7766
	stha	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 267cffff
!	%l6 = ffffffff, %l7 = ffd25dff, Mem[0000000010001408] = ff647692 25e1d91b
	stda	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = ffffffff ffd25dff
!	Mem[0000000010101408] = ff5dd2ff, %l7 = 00000000ffd25dff
	swapa	[%i4+%o4]0x88,%l7	! %l7 = 00000000ff5dd2ff
!	%l7 = 00000000ff5dd2ff, Mem[0000000030181410] = a0ffffff
	stha	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = a0ffd2ff
!	Mem[0000000010041410] = 00000000, %l6 = ffffffffffffffff
	ldstuba	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000000
!	%l7 = 00000000ff5dd2ff, Mem[0000000030001410] = 001892ff
	stwa	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = ff5dd2ff
!	%l1 = 00000000ff008576, Mem[0000000010001408] = ff5dd2ffffffffff
	stxa	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000ff008576
!	Mem[0000000030041400] = 000000a7, %l3 = 00000000ffffffff
	ldstuba	[%i1+%g0]0x89,%l3	! %l3 = 00000000000000a7
!	Mem[0000000010101408] = ff5dd2ff, %l4 = 00000000efc60000
	swapa	[%i4+%o4]0x80,%l4	! %l4 = 00000000ff5dd2ff
!	%l2 = 267c7766, %l3 = 000000a7, Mem[00000000300c1408] = ff000000 00000000
	stda	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 267c7766 000000a7

p0_label_152:
!	Starting 10 instruction Load Burst
!	Mem[000000001010142b] = 6bd3ffff, %l6 = 0000000000000000, %asi = 80
	lduba	[%i4+0x02b]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1410] = 0000267c, %l5 = 000000000000ffff
	lduba	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001410] = ffd25dff, %f10 = ffac654a
	lda	[%i0+%o5]0x81,%f10	! %f10 = ffd25dff
!	Mem[0000000010001410] = 00000000, %l4 = 00000000ff5dd2ff
	ldswa	[%i0+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0000] = a7ff1a10, %l0 = 00000000ff5dd2ff
	ldsb	[%o0+%g0],%l0		! %l0 = ffffffffffffffa7
!	Mem[0000000010141410] = ffffffffffffffff, %f30 = 7f573f22 21fae56b
	ldda	[%i5+%o5]0x88,%f30	! %f30 = ffffffff ffffffff
!	Mem[0000000010141400] = 000000cc, %l4 = 0000000000000000
	ldswa	[%i5+%g0]0x88,%l4	! %l4 = 00000000000000cc
!	%l6 = 000000ff, %l7 = ff5dd2ff, Mem[0000000010141408] = ff000a37 00000040
	stda	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff ff5dd2ff
!	Mem[0000000010101410] = ffffffc7, %l4 = 00000000000000cc
	ldswa	[%i4+%o5]0x80,%l4	! %l4 = ffffffffffffffc7
!	Mem[000000001000142c] = 37f294ff, %l4 = ffffffffffffffc7
	ldsh	[%i0+0x02c],%l4		! %l4 = 00000000000037f2

p0_label_153:
!	Starting 10 instruction Store Burst
!	%f12 = baffffff, Mem[0000000010141410] = ffffffff
	sta	%f12,[%i5+%o5]0x88	! Mem[0000000010141410] = baffffff
!	%l0 = ffffffffffffffa7, Mem[0000000010081408] = 20cf3b39
	stha	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = ffa73b39
!	%l2 = 267c7766, %l3 = 000000a7, Mem[0000000030181408] = 00000000 267c7766
	stda	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 267c7766 000000a7
!	Mem[0000000030081408] = 368499ff, %l7 = 00000000ff5dd2ff
	ldstuba	[%i2+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%f26 = 5347aa56 2a87134f, Mem[0000000010081408] = ffa73b39 ffffa4ba
	std	%f26,[%i2+%o4]		! Mem[0000000010081408] = 5347aa56 2a87134f
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000030141400] = 4381ff48 ff008576
	stda	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff 000000ff
!	Mem[0000000030101408] = 41a78025, %l0 = 00000000ffffffa7
	swapa	[%i4+%o4]0x81,%l0	! %l0 = 0000000041a78025
!	Mem[0000000020800001] = ffffa840, %l2 = a37b1527267c7766
	ldstub	[%o1+0x001],%l2		! %l2 = 00000000000000ff
!	%f20 = 00000000, Mem[0000000030081400] = d0a7c6ef
	sta	%f20,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	Mem[0000000010181400] = 00000000, %l1 = 00000000ff008576
	ldstuba	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000

p0_label_154:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ff99843600000000, %l4 = 00000000000037f2
	ldxa	[%i2+%o4]0x81,%l4	! %l4 = ff99843600000000
!	Mem[0000000030001400] = a355551b, %l4 = ff99843600000000
	ldswa	[%i0+%g0]0x81,%l4	! %l4 = ffffffffa355551b
!	Code Fragment 4, seed = 686449
p0_fragment_19:
!	%l0 = 0000000041a78025
	setx	0xed160771866ced9e,%g7,%l0 ! %l0 = ed160771866ced9e
!	%l1 = 0000000000000000
	setx	0x9f61700cefa08849,%g7,%l1 ! %l1 = 9f61700cefa08849
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = ed160771866ced9e
	setx	0x327128eace96bf04,%g7,%l0 ! %l0 = 327128eace96bf04
!	%l1 = 9f61700cefa08849
	setx	0x5d8b4806610a14cf,%g7,%l1 ! %l1 = 5d8b4806610a14cf
p0_fragment_19_end:
!	%f14 = ffff111d, %f14 = ffff111d
	fcmpes	%fcc2,%f14,%f14		! %fcc2 = 3
!	Mem[0000000030141410] = a0ffffff, %l3 = 00000000000000a7
	ldsha	[%i5+%o5]0x81,%l3	! %l3 = ffffffffffffa0ff
!	Mem[00000000100c1408] = 1bd9ff00, %f11 = ad921800
	lda	[%i3+%o4]0x88,%f11	! %f11 = 1bd9ff00
!	Mem[0000000030001400] = a355551b, %l0 = 327128eace96bf04
	lduha	[%i0+%g0]0x81,%l0	! %l0 = 000000000000a355
!	Mem[0000000010041400] = ff1892ad, %l5 = 0000000000000000
	ldsha	[%i1+%g0]0x80,%l5	! %l5 = ffffffffffffff18
!	Mem[0000000010141410] = ffffffbaffffffff, %l4 = ffffffffa355551b
	ldxa	[%i5+%o5]0x80,%l4	! %l4 = ffffffbaffffffff
!	Mem[0000000030181408] = a700000066777c26, %f18 = 1bd9e125 927664ff
	ldda	[%i6+%o4]0x89,%f18	! %f18 = a7000000 66777c26

p0_label_155:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000010041408] = ff000a37
	stwa	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff
!	Mem[0000000030001408] = 00ffffff, %l5 = 00000000ffffff18
	swapa	[%i0+%o4]0x81,%l5	! %l5 = 0000000000ffffff
!	Mem[0000000030101400] = 5fc581c9, %l2 = 00000000000000ff
	ldstuba	[%i4+%g0]0x89,%l2	! %l2 = 00000000000000c9
!	%l2 = 000000c9, %l3 = ffffa0ff, Mem[0000000010081438] = 79647692 25e1d91b, %asi = 80
	stda	%l2,[%i2+0x038]%asi	! Mem[0000000010081438] = 000000c9 ffffa0ff
!	Mem[0000000030181410] = a0ffd2ff, %l4 = ffffffbaffffffff
	ldstuba	[%i6+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001400] = ffd25dff, %l4 = 00000000000000ff
	ldstuba	[%i0+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	%f12 = baffffff 223f577f, Mem[0000000030141408] = ffd25dff 768500ff
	stda	%f12,[%i5+%o4]0x81	! Mem[0000000030141408] = baffffff 223f577f
!	%f14 = ffff111d, Mem[0000000030181408] = 66777c26
	sta	%f14,[%i6+%o4]0x89	! Mem[0000000030181408] = ffff111d
!	Mem[0000000030181410] = ffd2ffa0, %l4 = 00000000000000ff
	swapa	[%i6+%o5]0x81,%l4	! %l4 = 00000000ffd2ffa0
!	Mem[0000000030081410] = 393bcf20, %l1 = 00000000610a14cf
	swapa	[%i2+%o5]0x81,%l1	! %l1 = 00000000393bcf20

p0_label_156:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000, %l4 = 00000000ffd2ffa0
	lduba	[%i0+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = ffd25dff, %l1 = 00000000393bcf20
	lduha	[%i2+%o5]0x80,%l1	! %l1 = 000000000000ffd2
!	Mem[0000000030001410] = ffd25dff, %f31 = ffffffff
	lda	[%i0+%o5]0x81,%f31	! %f31 = ffd25dff
!	Mem[0000000010081438] = 000000c9ffffa0ff, %f4  = 66777c26 00000000
	ldd	[%i2+0x038],%f4 	! %f4  = 000000c9 ffffa0ff
!	Mem[0000000010001410] = 0000000000000000, %f6  = 00000040 ff000a37
	ldda	[%i0+%o5]0x88,%f6 	! %f6  = 00000000 00000000
!	Mem[0000000030081400] = 00000000, %l0 = 000000000000a355
	ldsha	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000211c0001] = 924e38a0, %l0 = 0000000000000000
	ldub	[%o2+0x001],%l0		! %l0 = 000000000000004e
!	Mem[0000000030041400] = ff000000 00000000, %l0 = 0000004e, %l1 = 0000ffd2
	ldda	[%i1+%g0]0x81,%l0	! %l0 = 00000000ff000000 0000000000000000
!	Mem[0000000010181410] = ffd25dff 393bcf20, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i6+%o5]0x88,%l6	! %l6 = 00000000393bcf20 00000000ffd25dff
!	%f27 = 2a87134f, %f28 = 4a8f68c4, %f25 = 01f61409
	fdivs	%f27,%f28,%f25		! %f25 = 1f711f90

p0_label_157:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = ff5dd2ff, %l6 = 00000000393bcf20
	swapa	[%i2+%o5]0x88,%l6	! %l6 = 00000000ff5dd2ff
!	%l6 = 00000000ff5dd2ff, Mem[0000000030081400] = ffffffff00000000
	stxa	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000ff5dd2ff
!	Mem[0000000030101400] = ff81c55f, %l2 = 00000000000000c9
	swapa	[%i4+%g0]0x81,%l2	! %l2 = 00000000ff81c55f
!	Mem[000000001008141c] = 1b5555a3, %l7 = 00000000ffd25dff, %asi = 80
	swapa	[%i2+0x01c]%asi,%l7	! %l7 = 000000001b5555a3
!	%l1 = 0000000000000000, %l4 = 0000000000000000, %l2 = 00000000ff81c55f
	or	%l1,%l4,%l2		! %l2 = 0000000000000000
!	Mem[00000000300c1400] = 7f573f22 21fae56b 267c7766 000000a7
!	%f0  = ffffffff 1d11ffff c981c55f 18a53423
!	%f4  = 000000c9 ffffa0ff 00000000 00000000
!	%f8  = 00000000 00000000 ffd25dff 1bd9ff00
!	%f12 = baffffff 223f577f ffff111d 00000000
	stda	%f0 ,[%i3+%g0]ASI_COMMIT_S	! Block Store to 00000000300c1400
!	Mem[0000000010141404] = 000000ff, %l4 = 0000000000000000, %asi = 80
	swapa	[%i5+0x004]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041400] = ad9218ff, %l0 = 00000000ff000000
	swapa	[%i1+%g0]0x88,%l0	! %l0 = 00000000ad9218ff
!	Mem[0000000010041410] = ff000000, %l6 = 00000000ff5dd2ff
	swapa	[%i1+%o5]0x80,%l6	! %l6 = 00000000ff000000
!	%l7 = 000000001b5555a3, Mem[0000000030181410] = ff000000
	stwa	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 1b5555a3

p0_label_158:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ffffffff, %l6 = 00000000ff000000
	lduwa	[%i4+%o5]0x89,%l6	! %l6 = 00000000ffffffff
	membar	#Sync			! Added by membar checker (30)
!	Mem[00000000100c1408] = 00ffd91b 418fa324, %l6 = ffffffff, %l7 = 1b5555a3
	ldda	[%i3+%o4]0x80,%l6	! %l6 = 0000000000ffd91b 00000000418fa324
!	Mem[0000000030141408] = ffffffba, %l4 = 00000000000000ff
	lduba	[%i5+%o4]0x89,%l4	! %l4 = 00000000000000ba
!	Mem[000000001018140c] = 00000000, %l2 = 0000000000000000, %asi = 80
	ldswa	[%i6+0x00c]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1418] = 00000081, %l6 = 0000000000ffd91b, %asi = 80
	lduwa	[%i3+0x018]%asi,%l6	! %l6 = 0000000000000081
!	Mem[0000000010041430] = c02dd264, %l6 = 0000000000000081
	lduw	[%i1+0x030],%l6		! %l6 = 00000000c02dd264
!	Mem[00000000211c0000] = 924e38a0, %l1 = 0000000000000000, %asi = 80
	ldsha	[%o2+0x000]%asi,%l1	! %l1 = ffffffffffff924e
!	Mem[0000000030101408] = ffffffa7 ff800000, %l2 = 00000000, %l3 = ffffa0ff
	ldda	[%i4+%o4]0x81,%l2	! %l2 = 00000000ffffffa7 00000000ff800000
!	Mem[0000000010081400] = 4a65acff, %l0 = 00000000ad9218ff
	ldsba	[%i2+%g0]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001430] = 09e5ff74 11ff2c35, %l6 = c02dd264, %l7 = 418fa324
	ldd	[%i0+0x030],%l6		! %l6 = 0000000009e5ff74 0000000011ff2c35

p0_label_159:
!	Starting 10 instruction Store Burst
!	%f22 = 00000000, Mem[0000000030101410] = ffffffff
	sta	%f22,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	%l5 = 0000000000ffffff, Mem[0000000010001410] = 00000000
	stba	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000ff
!	%l4 = 00000000000000ba, Mem[00000000211c0000] = 924e38a0, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ba38a0
!	%l4 = 00000000000000ba, Mem[0000000030141410] = a0ffffff
	stha	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 00baffff
!	%l1 = ffffffffffff924e, Mem[0000000010081418] = 34d3a4ba, %asi = 80
	stwa	%l1,[%i2+0x018]%asi	! Mem[0000000010081418] = ffff924e
!	Mem[0000000010101410] = ffffffc7, %l2 = 00000000ffffffa7
	swapa	[%i4+%o5]0x80,%l2	! %l2 = 00000000ffffffc7
!	Mem[0000000030081400] = ffd25dff, %l4 = 00000000000000ba
	ldstuba	[%i2+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%f4  = 000000c9 ffffa0ff, %l6 = 0000000009e5ff74
!	Mem[0000000030101420] = 42eea8b86650b2e9
	add	%i4,0x020,%g1
	stda	%f4,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030101420] = 42eea8b86650b2e9
!	Mem[0000000010101424] = 1b000000, %l0 = ffffffff, %l7 = 11ff2c35
	add	%i4,0x24,%g1
	casa	[%g1]0x80,%l0,%l7	! %l7 = 000000001b000000
!	%f10 = ffd25dff, Mem[0000000010141410] = ffffffba
	sta	%f10,[%i5+%o5]0x80	! Mem[0000000010141410] = ffd25dff

p0_label_160:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = baffffff223f577f, %l0 = ffffffffffffffff
	ldxa	[%i5+%o4]0x81,%l0	! %l0 = baffffff223f577f
!	Mem[00000000100c1428] = efc60000 0000ffff, %l2 = ffffffc7, %l3 = ff800000, %asi = 80
	ldda	[%i3+0x028]%asi,%l2	! %l2 = 00000000efc60000 000000000000ffff
!	Mem[0000000010181420] = 4381ff48, %l3 = 000000000000ffff
	lduh	[%i6+0x020],%l3		! %l3 = 0000000000004381
!	Mem[0000000030081408] = 00000000 368499ff, %l2 = efc60000, %l3 = 00004381
	ldda	[%i2+%o4]0x89,%l2	! %l2 = 00000000368499ff 0000000000000000
!	Mem[00000000300c1408] = c981c55f, %l5 = 0000000000ffffff
	ldsha	[%i3+%o4]0x81,%l5	! %l5 = ffffffffffffc981
!	Mem[0000000030101410] = 00000000, %f21 = 43de5ac7
	lda	[%i4+%o5]0x89,%f21	! %f21 = 00000000
!	Mem[00000000300c1408] = c981c55f18a53423, %f4  = 000000c9 ffffa0ff
	ldda	[%i3+%o4]0x81,%f4 	! %f4  = c981c55f 18a53423
!	Mem[0000000030001400] = a355551b00000000, %l5 = ffffffffffffc981
	ldxa	[%i0+%g0]0x81,%l5	! %l5 = a355551b00000000
!	Mem[0000000010041404] = f4650a10, %l7 = 000000001b000000, %asi = 80
	lduwa	[%i1+0x004]%asi,%l7	! %l7 = 00000000f4650a10
!	Mem[000000001004142f] = ff05f5a0, %l4 = 00000000000000ff, %asi = 80
	ldsba	[%i1+0x02f]%asi,%l4	! %l4 = ffffffffffffffa0

p0_label_161:
!	Starting 10 instruction Store Burst
!	%f16 = 00000000 2580a741, Mem[0000000010081410] = 393bcf20 ff00ffff
	stda	%f16,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000 2580a741
!	%f1  = 1d11ffff, Mem[00000000300c1410] = 000000c9
	sta	%f1 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 1d11ffff
!	Mem[0000000021800180] = ffec73f0, %l6 = 0000000009e5ff74
	ldstub	[%o3+0x180],%l6		! %l6 = 00000000000000ff
!	%l2 = 00000000368499ff, Mem[0000000010041408] = ff000000
	stwa	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 368499ff
!	%l6 = 00000000000000ff, Mem[0000000030101400] = 000000c9
	stha	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 00ff00c9
!	%l4 = ffffffffffffffa0, Mem[00000000100c1408] = 1bd9ff00
	stba	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 1bd9ffa0
!	%l4 = ffffffa0, %l5 = 00000000, Mem[0000000010141408] = 000000ff ff5dd2ff
	stda	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffffa0 00000000
!	Mem[0000000010081408] = 5347aa56, %l0 = 00000000223f577f
	swapa	[%i2+%o4]0x80,%l0	! %l0 = 000000005347aa56
!	%l3 = 0000000000000000, Mem[00000000201c0001] = a7ff1a10, %asi = 80
	stba	%l3,[%o0+0x001]%asi	! Mem[00000000201c0000] = a7001a10
!	%l0 = 000000005347aa56, Mem[0000000010101408] = efc60000
	stba	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 56c60000

p0_label_162:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = ff0089c0, %l6 = 00000000000000ff, %asi = 80
	lduha	[%o3+0x140]%asi,%l6	! %l6 = 000000000000ff00
!	Mem[0000000010001408] = 768500ff00000000, %l6 = 000000000000ff00
	ldxa	[%i0+%o4]0x80,%l6	! %l6 = 768500ff00000000
!	Mem[00000000201c0000] = a7001a10, %l3 = 0000000000000000
	ldsb	[%o0+%g0],%l3		! %l3 = ffffffffffffffa7
!	%f4  = c981c55f, %f28 = 4a8f68c4, %f22 = 00000000
	fadds	%f4 ,%f28,%f22		! %f22 = 4a5deed8
!	Mem[0000000010041400] = 000000ff f4650a10, %l0 = 5347aa56, %l1 = ffff924e, %asi = 80
	ldda	[%i1+0x000]%asi,%l0	! %l0 = 00000000000000ff 00000000f4650a10
!	Mem[00000000211c0000] = 00ba38a0, %l7 = 00000000f4650a10, %asi = 80
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = 00000000000000ba
!	Mem[0000000010041408] = 368499ff, %l6 = 768500ff00000000
	ldub	[%i1+%o4],%l6		! %l6 = 0000000000000036
!	Mem[00000000100c1410] = 000000007c260000, %f8  = 00000000 00000000
	ldda	[%i3+%o5]0x88,%f8 	! %f8  = 00000000 7c260000
!	Mem[0000000010101400] = 7f573f22, %l3 = ffffffffffffffa7
	ldswa	[%i4+%g0]0x80,%l3	! %l3 = 000000007f573f22
!	Mem[0000000010041438] = 9e19ffa03a3f0043, %l1 = 00000000f4650a10, %asi = 80
	ldxa	[%i1+0x038]%asi,%l1	! %l1 = 9e19ffa03a3f0043

p0_label_163:
!	Starting 10 instruction Store Burst
!	%l6 = 00000036, %l7 = 000000ba, Mem[0000000030081408] = ff998436 00000000
	stda	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000036 000000ba
!	%l7 = 00000000000000ba, Mem[0000000030001410] = 0000001bff5dd2ff
	stxa	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000000000ba
!	Mem[0000000010041410] = ffd25dff, %l3 = 000000007f573f22
	ldstuba	[%i1+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%l5 = a355551b00000000, Mem[0000000010181418] = 00000000
	sth	%l5,[%i6+0x018]		! Mem[0000000010181418] = 00000000
!	%l1 = 9e19ffa03a3f0043, Mem[0000000030041408] = 66777c2627157ba3
	stxa	%l1,[%i1+%o4]0x81	! Mem[0000000030041408] = 9e19ffa03a3f0043
!	Mem[00000000100c140b] = a0ffd91b, %l6 = 0000000000000036
	ldstuba	[%i3+0x00b]%asi,%l6	! %l6 = 000000000000001b
!	%f30 = ffffffff ffd25dff, %l2 = 00000000368499ff
!	Mem[00000000300c1408] = c981c55f18a53423
	add	%i3,0x008,%g1
	stda	%f30,[%g1+%l2]ASI_PST16_SL ! Mem[00000000300c1408] = ff5dd2ffffffffff
!	%f18 = a7000000 66777c26, Mem[0000000010101410] = a7ffffff a3000000
	stda	%f18,[%i4+%o5]0x88	! Mem[0000000010101410] = a7000000 66777c26
!	%l5 = a355551b00000000, Mem[00000000100c1424] = 00000000, %asi = 80
	stwa	%l5,[%i3+0x024]%asi	! Mem[00000000100c1424] = 00000000
!	Mem[0000000010141408] = a0ffffff, %l1 = 9e19ffa03a3f0043
	ldstuba	[%i5+%o4]0x80,%l1	! %l1 = 00000000000000a0

p0_label_164:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1428] = efc60000, %l0 = 00000000000000ff, %asi = 80
	ldswa	[%i3+0x028]%asi,%l0	! %l0 = ffffffffefc60000
!	Mem[0000000010041408] = 00000040 ff998436, %l4 = ffffffa0, %l5 = 00000000
	ldda	[%i1+%o4]0x88,%l4	! %l4 = 00000000ff998436 0000000000000040
!	Mem[0000000030041408] = a0ff199e, %l3 = 00000000000000ff
	lduwa	[%i1+%o4]0x89,%l3	! %l3 = 00000000a0ff199e
!	Mem[0000000010081410] = 41a78025, %l6 = 000000000000001b
	lduha	[%i2+%o5]0x80,%l6	! %l6 = 00000000000041a7
!	Mem[0000000030001408] = ffffff18, %l4 = 00000000ff998436
	ldsba	[%i0+%o4]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041435] = 34d3a4ba, %l3 = 00000000a0ff199e
	ldub	[%i1+0x035],%l3		! %l3 = 00000000000000d3
!	Mem[00000000100c1416] = 00000000, %l7 = 00000000000000ba, %asi = 80
	lduha	[%i3+0x016]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041408] = a0ff199e, %l6 = 00000000000041a7
	lduwa	[%i1+%o4]0x89,%l6	! %l6 = 00000000a0ff199e
!	Mem[0000000010181400] = 00000000000000ff, %f16 = 00000000 2580a741
	ldda	[%i6+%g0]0x88,%f16	! %f16 = 00000000 000000ff
!	Mem[0000000010081408] = 223f577f, %l3 = 00000000000000d3
	ldswa	[%i2+%o4]0x80,%l3	! %l3 = 00000000223f577f

p0_label_165:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000040, Mem[0000000010181400] = ff00000000000000
	stxa	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000000000000040
!	%l6 = 00000000a0ff199e, Mem[0000000030141408] = baffffff
	stwa	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = a0ff199e
!	%l6 = a0ff199e, %l7 = 00000000, Mem[0000000010181410] = 20cf3b39 ff5dd2ff
	stda	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = a0ff199e 00000000
!	Mem[00000000100c1400] = ffff111d f4a70a10 a0ffd9ff 418fa324
!	%f16 = 00000000 000000ff a7000000 66777c26
!	%f20 = 00000000 00000000 4a5deed8 7e03eff3
!	%f24 = 6ab89c58 1f711f90 5347aa56 2a87134f
!	%f28 = 4a8f68c4 73fcfb45 ffffffff ffd25dff
	stda	%f16,[%i3+%g0]ASI_COMMIT_P	! Block Store to 00000000100c1400
!	Mem[0000000030081410] = 610a14cf, %l7 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l7	! %l7 = 0000000000000061
!	Mem[0000000030101400] = 00ff00c9, %l3 = 00000000223f577f
	ldstuba	[%i4+%g0]0x81,%l3	! %l3 = 0000000000000000
!	%l1 = 00000000000000a0, Mem[0000000030181408] = 1d11ffff
	stba	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = a011ffff
	membar	#Sync			! Added by membar checker (31)
!	%f22 = 4a5deed8 7e03eff3, Mem[00000000100c1410] = 00000000 00000000
	stda	%f22,[%i3+%o5]0x80	! Mem[00000000100c1410] = 4a5deed8 7e03eff3
!	Mem[00000000100c141d] = 7e03eff3, %l3 = 0000000000000000
	ldstuba	[%i3+0x01d]%asi,%l3	! %l3 = 0000000000000003
!	Mem[00000000100c1418] = 4a5deed8, %l4 = ffffffffffffffff
	ldstub	[%i3+0x018],%l4		! %l4 = 000000000000004a

p0_label_166:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 9e19ffa0, %l7 = 0000000000000061
	lduha	[%i6+%o5]0x88,%l7	! %l7 = 000000000000ffa0
!	Mem[00000000100c1410] = 4a5deed87e03eff3, %l6 = 00000000a0ff199e
	ldx	[%i3+%o5],%l6		! %l6 = 4a5deed87e03eff3
!	Mem[0000000030141410] = ffffba00, %l0 = ffffffffefc60000
	ldsha	[%i5+%o5]0x89,%l0	! %l0 = ffffffffffffba00
!	Mem[0000000010101414] = 000000a7, %l4 = 000000000000004a
	ldsw	[%i4+0x014],%l4		! %l4 = 00000000000000a7
!	Mem[00000000300c1408] = ff5dd2ffffffffff, %l4 = 00000000000000a7
	ldxa	[%i3+%o4]0x81,%l4	! %l4 = ff5dd2ffffffffff
!	Mem[00000000300c1408] = ffd25dff, %l5 = 0000000000000040
	lduha	[%i3+%o4]0x89,%l5	! %l5 = 0000000000005dff
!	Mem[0000000030001400] = 1b5555a3, %l6 = 4a5deed87e03eff3
	lduwa	[%i0+%g0]0x89,%l6	! %l6 = 000000001b5555a3
!	Mem[0000000010001400] = ff5dd2ff, %l6 = 000000001b5555a3
	ldsba	[%i0+%g0]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081400] = ffac654a, %l3 = 0000000000000003
	lduwa	[%i2+%g0]0x80,%l3	! %l3 = 00000000ffac654a
!	%f23 = 7e03eff3, %f8  = 00000000, %f7  = 00000000
	fdivs	%f23,%f8 ,%f7 		! %f7  = 7f800000

p0_label_167:
!	Starting 10 instruction Store Burst
!	%l2 = 368499ff, %l3 = ffac654a, Mem[0000000010081408] = 223f577f 2a87134f
	std	%l2,[%i2+%o4]		! Mem[0000000010081408] = 368499ff ffac654a
!	%f20 = 00000000, Mem[0000000030141408] = a0ff199e
	sta	%f20,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	%l6 = ffffffffffffffff, Mem[0000000030041410] = 00000000
	stha	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = ffff0000
!	Mem[0000000010101408] = 56c60000, %l0 = ffffffffffffba00
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000056
!	%l2 = 00000000368499ff, Mem[0000000010041434] = 34d3a4ba, %asi = 80
	stwa	%l2,[%i1+0x034]%asi	! Mem[0000000010041434] = 368499ff
!	Mem[00000000100c1439] = ffffffff, %l2 = 00000000368499ff
	ldstub	[%i3+0x039],%l2		! %l2 = 00000000000000ff
!	Mem[00000000100c1410] = d8ee5d4a, %l2 = 00000000000000ff
	ldstuba	[%i3+%o5]0x88,%l2	! %l2 = 000000000000004a
!	%f2  = c981c55f 18a53423, Mem[0000000030141400] = ff000000 ff000000
	stda	%f2 ,[%i5+%g0]0x81	! Mem[0000000030141400] = c981c55f 18a53423
!	Mem[0000000010081408] = ff998436, %l1 = 00000000000000a0
	swapa	[%i2+%o4]0x88,%l1	! %l1 = 00000000ff998436
!	%f0  = ffffffff 1d11ffff, %l5 = 0000000000005dff
!	Mem[0000000010001420] = 10efeae6d0a7c6ef
	add	%i0,0x020,%g1
	stda	%f0,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010001420] = ffff111dffffffff

p0_label_168:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001418] = 2eceac7a 100aa7f4, %l0 = 00000056, %l1 = ff998436
	ldd	[%i0+0x018],%l0		! %l0 = 000000002eceac7a 00000000100aa7f4
!	Mem[0000000010101438] = 00a7abd200000025, %l6 = ffffffffffffffff
	ldx	[%i4+0x038],%l6		! %l6 = 00a7abd200000025
!	Mem[0000000010101410] = 267c7766, %l5 = 0000000000005dff
	ldsba	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000026
!	Mem[0000000010101400] = 6be5fa21 223f577f, %l4 = ffffffff, %l5 = 00000026
	ldda	[%i4+%g0]0x88,%l4	! %l4 = 00000000223f577f 000000006be5fa21
!	Mem[00000000201c0000] = a7001a10, %l4 = 00000000223f577f
	ldsh	[%o0+%g0],%l4		! %l4 = ffffffffffffa700
!	Mem[0000000030101408] = 000080ffa7ffffff, %l2 = 000000000000004a
	ldxa	[%i4+%o4]0x89,%l2	! %l2 = 000080ffa7ffffff
!	Mem[0000000021800100] = ffcd1b90, %l3 = 00000000ffac654a, %asi = 80
	ldsha	[%o3+0x100]%asi,%l3	! %l3 = ffffffffffffffcd
!	Mem[0000000010001410] = 000000ff, %l4 = ffffffffffffa700
	lduba	[%i0+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1408] = ffffffffffd25dff, %f8  = 00000000 7c260000
	ldda	[%i3+%o4]0x89,%f8 	! %f8  = ffffffff ffd25dff
!	Mem[00000000100c1400] = 00000000, %l2 = 000080ffa7ffffff
	lduw	[%i3+%g0],%l2		! %l2 = 0000000000000000

p0_label_169:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000100aa7f4, imm = 0000000000000dd4, %l5 = 000000006be5fa21
	sub	%l1,0xdd4,%l5		! %l5 = 00000000100a9a20
!	%l4 = 000000ff, %l5 = 100a9a20, Mem[0000000010001400] = ff5dd2ff 615e0000
	stda	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff 100a9a20
!	Mem[0000000010081410] = 41a78025, %l0 = 000000002eceac7a
	ldstuba	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000041
!	%l4 = 00000000000000ff, Mem[00000000300c1408] = ff5dd2ffffffffff
	stxa	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000000000ff
!	%f1  = 1d11ffff, Mem[0000000010081408] = a0000000
	sta	%f1 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 1d11ffff
!	%l3 = ffffffffffffffcd, Mem[0000000010001410] = 000000ff
	stba	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000cd
!	%l1 = 00000000100aa7f4, Mem[0000000030181410] = a355551b
	stwa	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = 100aa7f4
!	%l1 = 00000000100aa7f4, Mem[0000000010081424] = ffffd91b, %asi = 80
	stha	%l1,[%i2+0x024]%asi	! Mem[0000000010081424] = a7f4d91b
!	Mem[0000000030001410] = ba000000, %l5 = 00000000100a9a20
	swapa	[%i0+%o5]0x81,%l5	! %l5 = 00000000ba000000
!	%l7 = 000000000000ffa0, Mem[0000000010101404] = 21fae56b
	sth	%l7,[%i4+0x004]		! Mem[0000000010101404] = ffa0e56b

p0_label_170:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = cc000000, %l1 = 00000000100aa7f4
	ldsha	[%i5+%g0]0x80,%l1	! %l1 = ffffffffffffcc00
!	Mem[0000000030001410] = 100a9a2000000000, %f30 = ffffffff ffd25dff
	ldda	[%i0+%o5]0x81,%f30	! %f30 = 100a9a20 00000000
!	Mem[0000000030041410] = 0000ffff, %l4 = 00000000000000ff
	ldswa	[%i1+%o5]0x89,%l4	! %l4 = 000000000000ffff
!	Mem[00000000100c1420] = 6ab89c581f711f90, %l0 = 0000000000000041, %asi = 80
	ldxa	[%i3+0x020]%asi,%l0	! %l0 = 6ab89c581f711f90
!	Mem[0000000030041408] = 9e19ffa0, %l4 = 000000000000ffff
	ldsba	[%i1+%o4]0x81,%l4	! %l4 = ffffffffffffff9e
	membar	#Sync			! Added by membar checker (32)
!	Mem[00000000300c1400] = ffffffff 1d11ffff 00000000 000000ff
!	Mem[00000000300c1410] = 1d11ffff ffffa0ff 00000000 00000000
!	Mem[00000000300c1420] = 00000000 00000000 ffd25dff 1bd9ff00
!	Mem[00000000300c1430] = baffffff 223f577f ffff111d 00000000
	ldda	[%i3+%g0]ASI_BLK_AIUSL,%f16	! Block Load from 00000000300c1400
!	Mem[0000000030181400] = 43de5ac7, %l5 = 00000000ba000000
	lduha	[%i6+%g0]0x89,%l5	! %l5 = 0000000000005ac7
!	Mem[0000000010181410] = 9e19ffa0, %f4  = c981c55f
	lda	[%i6+%o5]0x88,%f4 	! %f4 = 9e19ffa0
!	Mem[0000000010001410] = cd00000000000000, %f0  = ffffffff 1d11ffff
	ldda	[%i0+%o5]0x80,%f0 	! %f0  = cd000000 00000000
!	Mem[00000000300c1408] = 00000000000000ff, %l5 = 0000000000005ac7
	ldxa	[%i3+%o4]0x81,%l5	! %l5 = 00000000000000ff

p0_label_171:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = ffd25dff, %l4 = ffffffffffffff9e
	ldstuba	[%i5+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%l2 = 00000000, %l3 = ffffffcd, Mem[0000000010041400] = 000000ff f4650a10, %asi = 80
	stda	%l2,[%i1+0x000]%asi	! Mem[0000000010041400] = 00000000 ffffffcd
!	%l7 = 000000000000ffa0, Mem[0000000030081410] = cf140aff
	stha	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = cf14ffa0
!	%l0 = 6ab89c581f711f90, Mem[0000000020800000] = ffffa840
	sth	%l0,[%o1+%g0]		! Mem[0000000020800000] = 1f90a840
!	%l7 = 000000000000ffa0, Mem[0000000010101410] = 267c7766
	stwa	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000ffa0
!	%f18 = ff000000, Mem[0000000030181408] = ffff11a0
	sta	%f18,[%i6+%o4]0x89	! Mem[0000000030181408] = ff000000
!	%l7 = 000000000000ffa0, Mem[0000000010181408] = 267cffff
	stba	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 267cffa0
!	Mem[0000000030141410] = ffffba00, %l3 = ffffffffffffffcd
	ldstuba	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000030101408] = 000080ffa7ffffff
	stxa	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000000
!	%l5 = 00000000000000ff, Mem[00000000100c1408] = a7000000
	stwa	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ff

p0_label_172:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = f4a70a10, %l7 = 000000000000ffa0
	ldswa	[%i6+%o5]0x89,%l7	! %l7 = fffffffff4a70a10
!	Mem[0000000030101410] = ffff000000000000, %l7 = fffffffff4a70a10
	ldxa	[%i4+%o5]0x89,%l7	! %l7 = ffff000000000000
	membar	#Sync			! Added by membar checker (33)
!	Mem[0000000010141400] = cc000000 00000000 ffffffff 00000000
!	Mem[0000000010141410] = ffd25dff ffffffff baa4d334 79bf2edb
!	Mem[0000000010141420] = a724226d 61d05459 267c7766 100d421f
!	Mem[0000000010141430] = 07b95aff 7262ec95 00000000 00000043
	ldda	[%i5+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010141400
!	Mem[0000000010141400] = cc000000, %l4 = 00000000000000ff
	ldswa	[%i5+%g0]0x80,%l4	! %l4 = ffffffffcc000000
!	Mem[00000000100c1428] = 5347aa56, %l2 = 0000000000000000
	ldsw	[%i3+0x028],%l2		! %l2 = 000000005347aa56
!	Mem[0000000010081404] = ad921800, %l4 = ffffffffcc000000
	ldsw	[%i2+0x004],%l4		! %l4 = ffffffffad921800
!	Mem[0000000010181410] = 9e19ffa0, %l6 = 00a7abd200000025
	lduha	[%i6+%o5]0x88,%l6	! %l6 = 000000000000ffa0
!	Mem[0000000010141408] = ffffffff, %l0 = 6ab89c581f711f90
	lduba	[%i5+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000021800040] = ff85b900, %l2 = 000000005347aa56, %asi = 80
	lduha	[%o3+0x040]%asi,%l2	! %l2 = 000000000000ff85
!	Mem[0000000030041410] = 0000ffff, %l5 = 00000000000000ff
	ldswa	[%i1+%o5]0x89,%l5	! %l5 = 000000000000ffff

p0_label_173:
!	Starting 10 instruction Store Burst
!	Code Fragment 4, seed = 947605
p0_fragment_20:
!	%l0 = 00000000000000ff
	setx	0xa853ace6cb36707e,%g7,%l0 ! %l0 = a853ace6cb36707e
!	%l1 = ffffffffffffcc00
	setx	0x83333875fa941529,%g7,%l1 ! %l1 = 83333875fa941529
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = a853ace6cb36707e
	setx	0x878f821797de35e4,%g7,%l0 ! %l0 = 878f821797de35e4
!	%l1 = 83333875fa941529
	setx	0xca337048162955af,%g7,%l1 ! %l1 = ca337048162955af
p0_fragment_20_end:
!	%l0 = 878f821797de35e4, Mem[0000000030181400] = c75ade43
	stba	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = e45ade43
!	%l4 = ffffffffad921800, Mem[00000000201c0000] = a7001a10
	stb	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 00001a10
!	%l6 = 000000000000ffa0, Mem[0000000010101400] = 223f577f
	stba	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 223f57a0
!	Mem[0000000030081408] = 00000036, %l2 = 000000000000ff85
	swapa	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000036
	membar	#Sync			! Added by membar checker (34)
!	%f6  = baa4d334 79bf2edb, Mem[0000000010141408] = ffffffff 00000000
	stda	%f6 ,[%i5+%o4]0x80	! Mem[0000000010141408] = baa4d334 79bf2edb
!	%f28 = 7f573f22 ffffffba, %l5 = 000000000000ffff
!	Mem[0000000030141400] = c981c55f18a53423
	stda	%f28,[%i5+%l5]ASI_PST8_SL ! Mem[0000000030141400] = baffffff223f577f
!	%f28 = 7f573f22, Mem[0000000030041410] = ffff0000
	sta	%f28,[%i1+%o5]0x81	! Mem[0000000030041410] = 7f573f22
!	Mem[00000000201c0001] = 00001a10, %l5 = 000000000000ffff, %asi = 80
	ldsba	[%o0+0x001]%asi,%l5	! %l5 = 0000000000000000
!	%f8  = a724226d 61d05459, %l5 = 0000000000000000
!	Mem[0000000030181430] = 2550c44ed3340000
	add	%i6,0x030,%g1
	stda	%f8,[%g1+%l5]ASI_PST8_S ! Mem[0000000030181430] = 2550c44ed3340000

p0_label_174:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 267c7766ff000000, %f12 = 07b95aff 7262ec95
	ldda	[%i3+%o4]0x88,%f12	! %f12 = 267c7766 ff000000
!	Mem[0000000010141408] = baa4d33479bf2edb, %l5 = 0000000000000000
	ldxa	[%i5+%o4]0x80,%l5	! %l5 = baa4d33479bf2edb
!	Mem[0000000030181400] = e45ade43, %l4 = ffffffffad921800
	ldsha	[%i6+%g0]0x81,%l4	! %l4 = ffffffffffffe45a
!	Mem[00000000300c1408] = 00000000, %l2 = 0000000000000036
	ldswa	[%i3+%o4]0x89,%l2	! %l2 = 0000000000000000
!	%l3 = 0000000000000000, %l4 = ffffffffffffe45a, %y  = 000000ff
	sdiv	%l3,%l4,%l2		! %l2 = fffffffff6c6ed1f
	mov	%l0,%y			! %y = 97de35e4
!	Mem[0000000030101400] = ffff00c9, %l7 = ffff000000000000
	ldsha	[%i4+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030041410] = 7f573f22, %l7 = ffffffffffffffff
	ldswa	[%i1+%o5]0x81,%l7	! %l7 = 000000007f573f22
!	Mem[0000000010041408] = 00000040ff998436, %l2 = fffffffff6c6ed1f
	ldxa	[%i1+%o4]0x88,%l2	! %l2 = 00000040ff998436
!	Mem[00000000100c1408] = 267c7766 ff000000, %l6 = 0000ffa0, %l7 = 7f573f22
	ldda	[%i3+%o4]0x88,%l6	! %l6 = 00000000ff000000 00000000267c7766
!	Mem[00000000100c1408] = 000000ff, %l6 = 00000000ff000000
	lduba	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000

p0_label_175:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 267c7766, Mem[0000000010041410] = ffd25dff ff5dd2ff
	stda	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000 267c7766
!	%f24 = 00000000, Mem[0000000010141438] = 00000000
	sta	%f24,[%i5+0x038]%asi	! Mem[0000000010141438] = 00000000
!	%l5 = baa4d33479bf2edb, Mem[0000000030041408] = a0ff199e
	stba	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = a0ff19db
!	Mem[0000000010141400] = cc000000, %l6 = 0000000000000000
	ldstuba	[%i5+%g0]0x80,%l6	! %l6 = 00000000000000cc
!	Mem[0000000030041410] = 7f573f22, %l6 = 00000000000000cc
	ldstuba	[%i1+%o5]0x81,%l6	! %l6 = 000000000000007f
!	Mem[0000000010181400] = 00000000, %l5 = 0000000079bf2edb
	swapa	[%i6+%g0]0x88,%l5	! %l5 = 0000000000000000
!	%l4 = ffffe45a, %l5 = 00000000, Mem[0000000010141400] = 000000ff 00000000
	stda	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffe45a 00000000
!	%f15 = 00000043, Mem[0000000010081408] = ffff111d
	sta	%f15,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000043
!	%f29 = ffffffba, Mem[00000000300c1400] = ffffffff
	sta	%f29,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffba
!	%f24 = 00000000 00000000, Mem[0000000030041410] = 223f57ff 00ffd91b
	stda	%f24,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000 00000000

p0_label_176:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = a0ff14cf, %l3 = 0000000000000000
	lduwa	[%i2+%o5]0x81,%l3	! %l3 = 00000000a0ff14cf
!	Mem[0000000010081412] = ffa78025, %l3 = 00000000a0ff14cf, %asi = 80
	ldsba	[%i2+0x012]%asi,%l3	! %l3 = ffffffffffffff80
!	Mem[0000000030001400] = 1b5555a3, %l4 = ffffffffffffe45a
	lduha	[%i0+%g0]0x89,%l4	! %l4 = 00000000000055a3
!	Mem[0000000010141408] = baa4d334, %l0 = 878f821797de35e4
	lduwa	[%i5+%o4]0x80,%l0	! %l0 = 00000000baa4d334
!	Mem[0000000010101430] = 100aa7f4, %l3 = ffffffffffffff80
	ldsh	[%i4+0x030],%l3		! %l3 = 000000000000100a
!	Mem[0000000030181408] = ff000000, %l6 = 000000000000007f
	lduwa	[%i6+%o4]0x89,%l6	! %l6 = 00000000ff000000
!	Mem[0000000030101400] = 2334a518c900ffff, %l1 = ca337048162955af
	ldxa	[%i4+%g0]0x89,%l1	! %l1 = 2334a518c900ffff
!	Mem[0000000030081410] = a0ff14cf00000000, %l1 = 2334a518c900ffff
	ldxa	[%i2+%o5]0x81,%l1	! %l1 = a0ff14cf00000000
!	Mem[00000000201c0000] = 00001a10, %l4 = 00000000000055a3
	ldsb	[%o0+%g0],%l4		! %l4 = 0000000000000000
!	Mem[0000000010101400] = 223f57a0, %l6 = 00000000ff000000
	lduha	[%i4+%g0]0x88,%l6	! %l6 = 00000000000057a0

p0_label_177:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000057a0, Mem[0000000030141408] = 00000000
	stwa	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 000057a0
!	Mem[0000000030101410] = 00000000, %l5 = 0000000000000000
	swapa	[%i4+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = ffffffba, %l7 = 00000000267c7766
	ldstuba	[%i3+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[00000000100c1400] = ff00000000000000
	stxa	%l5,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000000000000000
!	Mem[0000000021800181] = ffec73f0, %l5 = 0000000000000000
	ldstub	[%o3+0x181],%l5		! %l5 = 00000000000000ec
!	%l2 = 00000040ff998436, Mem[0000000021800140] = ff0089c0
	sth	%l2,[%o3+0x140]		! Mem[0000000021800140] = 843689c0
!	%l7 = 00000000000000ff, Mem[0000000010141408] = baa4d334
	stha	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 00ffd334
!	Mem[0000000030181410] = f4a70a10, %l4 = 0000000000000000
	swapa	[%i6+%o5]0x89,%l4	! %l4 = 00000000f4a70a10
!	%l0 = 00000000baa4d334, Mem[00000000100c1408] = 267c7766ff000000
	stxa	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000baa4d334
!	Mem[0000000030081410] = cf14ffa0, %l4 = 00000000f4a70a10
	swapa	[%i2+%o5]0x89,%l4	! %l4 = 00000000cf14ffa0

p0_label_178:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001420] = ffff111dffffffff, %f22 = 00000000 00000000, %asi = 80
	ldda	[%i0+0x020]%asi,%f22	! %f22 = ffff111d ffffffff
!	Mem[0000000030141410] = 00000000ffffbaff, %l1 = a0ff14cf00000000
	ldxa	[%i5+%o5]0x89,%l1	! %l1 = 00000000ffffbaff
!	Mem[00000000201c0000] = 00001a10, %l5 = 00000000000000ec
	ldsh	[%o0+%g0],%l5		! %l5 = 0000000000000000
!	Mem[00000000300c1410] = 1d11ffffffffa0ff, %f18 = ff000000 00000000
	ldda	[%i3+%o5]0x81,%f18	! %f18 = 1d11ffff ffffa0ff
!	Mem[0000000030101410] = 000000000000ffff, %f30 = 00000000 1d11ffff
	ldda	[%i4+%o5]0x81,%f30	! %f30 = 00000000 0000ffff
!	Mem[0000000030101408] = 0000000000000000, %f6  = baa4d334 79bf2edb
	ldda	[%i4+%o4]0x81,%f6 	! %f6  = 00000000 00000000
!	Mem[00000000100c1408] = 34d3a4ba, %l6 = 00000000000057a0
	ldswa	[%i3+%o4]0x80,%l6	! %l6 = 0000000034d3a4ba
!	Mem[0000000010041408] = ff998436, %l2 = 00000040ff998436
	ldsha	[%i1+%o4]0x88,%l2	! %l2 = ffffffffffff8436
!	Mem[0000000010041410] = 0000000066777c26, %l6 = 0000000034d3a4ba
	ldxa	[%i1+%o5]0x80,%l6	! %l6 = 0000000066777c26
!	Mem[0000000020800000] = 1f90a840, %l5 = 0000000000000000
	ldub	[%o1+%g0],%l5		! %l5 = 000000000000001f

p0_label_179:
!	Starting 10 instruction Store Burst
!	%l6 = 66777c26, %l7 = 000000ff, Mem[0000000010181408] = 267cffa0 00000000
	stda	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 66777c26 000000ff
!	%l0 = baa4d334, %l1 = ffffbaff, Mem[0000000010101408] = ffc60000 92766479
	stda	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = baa4d334 ffffbaff
!	%f27 = ff5dd2ff, Mem[00000000100c1408] = 34d3a4ba
	sta	%f27,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff5dd2ff
!	%l0 = 00000000baa4d334, immd = 000001f5, %y  = 97de35e4
	sdiv	%l0,0x1f5,%l2		! %l2 = ffffffff80000000
	mov	%l0,%y			! %y = baa4d334
!	Mem[0000000010081408] = 43000000, %l6 = 0000000066777c26
	ldstuba	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000043
!	Mem[0000000010181410] = 9e19ffa0, %l2 = ffffffff80000000
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 00000000000000a0
!	%l4 = 00000000cf14ffa0, Mem[0000000010081438] = 000000c9
	stw	%l4,[%i2+0x038]		! Mem[0000000010081438] = cf14ffa0
!	%f26 = 00ffd91b ff5dd2ff, %l0 = 00000000baa4d334
!	Mem[0000000030101438] = 34d6b4824603a94b
	add	%i4,0x038,%g1
	stda	%f26,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030101438] = 34d6b4821bd9a94b
!	%l3 = 000000000000100a, Mem[0000000010141408] = 00ffd334
	stha	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 100ad334
!	Mem[00000000100c1400] = 00000000 00000000 ff5dd2ff 00000000
!	%f0  = cc000000 00000000 ffffffff 00000000
!	%f4  = ffd25dff ffffffff 00000000 00000000
!	%f8  = a724226d 61d05459 267c7766 100d421f
!	%f12 = 267c7766 ff000000 00000000 00000043
	stda	%f0 ,[%i3+%g0]ASI_COMMIT_P	! Block Store to 00000000100c1400

p0_label_180:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000, %l3 = 000000000000100a
	ldswa	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041406] = ffffffcd, %l1 = 00000000ffffbaff
	lduh	[%i1+0x006],%l1		! %l1 = 000000000000ffcd
!	Mem[0000000030081410] = f4a70a10, %l6 = 0000000000000043
	lduha	[%i2+%o5]0x89,%l6	! %l6 = 0000000000000a10
!	Mem[0000000010141408] = 100ad334, %l5 = 000000000000001f
	ldsha	[%i5+%o4]0x80,%l5	! %l5 = 000000000000100a
!	Mem[0000000010141410] = ffffffff ff5dd2ff, %l0 = baa4d334, %l1 = 0000ffcd
	ldda	[%i5+%o5]0x88,%l0	! %l0 = 00000000ff5dd2ff 00000000ffffffff
!	Mem[0000000030141400] = baffffff 223f577f, %l6 = 00000a10, %l7 = 000000ff
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 00000000baffffff 00000000223f577f
	membar	#Sync			! Added by membar checker (35)
!	Mem[00000000100c1400] = 00000000000000cc, %f26 = 00ffd91b ff5dd2ff
	ldda	[%i3+%g0]0x88,%f26	! %f26 = 00000000 000000cc
!	Mem[00000000100c1408] = ffffffff, %l3 = 0000000000000000
	ldsba	[%i3+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030041400] = 00000000000000ff, %l5 = 000000000000100a
	ldxa	[%i1+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101410] = 0000ffa0, %l0 = 00000000ff5dd2ff
	lduh	[%i4+%o5],%l0		! %l0 = 0000000000000000

p0_label_181:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181430] = 000000ad5e610975, %l2 = 00000000000000a0, %l0 = 0000000000000000
	add	%i6,0x30,%g1
	casxa	[%g1]0x80,%l2,%l0	! %l0 = 000000ad5e610975
!	%f0  = cc000000, %f1  = 00000000, %f18 = 1d11ffff
	fadds	%f0 ,%f1 ,%f18		! %f18 = cc000000
!	%l5 = 00000000000000ff, Mem[0000000030181408] = 000000ff000000a7
	stxa	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000000000ff
!	Mem[0000000030001410] = 209a0a10, %l6 = 00000000baffffff
	swapa	[%i0+%o5]0x89,%l6	! %l6 = 00000000209a0a10
!	%l4 = 00000000cf14ffa0, Mem[00000000211c0000] = 00ba38a0, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffa038a0
!	Mem[0000000020800040] = 00ffb270, %l7 = 00000000223f577f
	ldstub	[%o1+0x040],%l7		! %l7 = 0000000000000000
!	%l5 = 00000000000000ff, Mem[0000000030081408] = 85ff0000
	stwa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000ff
!	Mem[0000000030101400] = ffff00c9, %l1 = 00000000ffffffff
	swapa	[%i4+%g0]0x81,%l1	! %l1 = 00000000ffff00c9
!	Mem[0000000010081408] = ff000000, %l0 = 000000005e610975
	swapa	[%i2+%o4]0x80,%l0	! %l0 = 00000000ff000000
!	%f30 = 00000000 0000ffff, %l3 = ffffffffffffffff
!	Mem[0000000030141408] = 000057a0223f577f
	add	%i5,0x008,%g1
	stda	%f30,[%g1+%l3]ASI_PST32_S ! Mem[0000000030141408] = 000000000000ffff

p0_label_182:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000, %f31 = 0000ffff
	lda	[%i1+%o5]0x89,%f31	! %f31 = 00000000
!	Mem[0000000010141410] = ff5dd2ff, %l4 = 00000000cf14ffa0
	ldswa	[%i5+%o5]0x88,%l4	! %l4 = ffffffffff5dd2ff
!	Mem[0000000030041400] = ff000000, %l2 = 00000000000000a0
	ldsba	[%i1+%g0]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1408] = ffffffff, %l2 = ffffffffffffffff
	ldswa	[%i3+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030001408] = 0000006618ffffff, %f26 = 00000000 000000cc
	ldda	[%i0+%o4]0x89,%f26	! %f26 = 00000066 18ffffff
!	Mem[0000000010141410] = ffd25dff, %l1 = 00000000ffff00c9
	ldstuba	[%i5+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081408] = 5e610975, %l3 = ffffffffffffffff
	lduba	[%i2+%o4]0x80,%l3	! %l3 = 000000000000005e
!	Mem[0000000010001400] = ff000000, %l7 = 0000000000000000
	lduba	[%i0+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[000000001014143a] = 00000000, %l6 = 00000000209a0a10
	ldsh	[%i5+0x03a],%l6		! %l6 = 0000000000000000
!	Mem[0000000010081438] = cf14ffa0, %f31 = 00000000
	lda	[%i2+0x038]%asi,%f31	! %f31 = cf14ffa0

p0_label_183:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001420] = ffff111d, %l0 = 00000000ff000000, %asi = 80
	swapa	[%i0+0x020]%asi,%l0	! %l0 = 00000000ffff111d
!	Mem[0000000030001410] = baffffff, %l1 = 00000000000000ff
	swapa	[%i0+%o5]0x89,%l1	! %l1 = 00000000baffffff
!	Mem[00000000211c0000] = ffa038a0, %l3 = 000000000000005e
	ldstub	[%o2+%g0],%l3		! %l3 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[00000000100c1408] = ffffffff
	stwa	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff
!	Mem[0000000010041410] = 00000000, %l0 = 00000000ffff111d
	ldstuba	[%i1+%o5]0x88,%l0	! %l0 = 0000000000000000
!	%f8  = a724226d, Mem[0000000030141400] = baffffff
	sta	%f8 ,[%i5+%g0]0x81	! Mem[0000000030141400] = a724226d
!	%l7 = 00000000000000ff, Mem[0000000010041400] = 00000000
	stwa	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff
!	%l2 = ffffffff, %l3 = 000000ff, Mem[0000000010141410] = ffd25dff ffffffff
	stda	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffffff 000000ff
!	%f4  = ffd25dff, Mem[00000000100c1428] = 267c7766
	st	%f4 ,[%i3+0x028]	! Mem[00000000100c1428] = ffd25dff
!	Mem[0000000010101400] = 223f57a0, %l6 = 0000000000000000
	ldstuba	[%i4+%g0]0x88,%l6	! %l6 = 00000000000000a0

p0_label_184:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = cd00000000000000, %f8  = a724226d 61d05459
	ldda	[%i0+%o5]0x80,%f8 	! %f8  = cd000000 00000000
!	Mem[0000000010141410] = ffffffff000000ff, %f2  = ffffffff 00000000
	ldda	[%i5+%o5]0x80,%f2 	! %f2  = ffffffff 000000ff
!	Mem[00000000100c1436] = ff000000, %l3 = 00000000000000ff
	lduh	[%i3+0x036],%l3		! %l3 = 0000000000000000
!	Mem[0000000010141414] = 000000ff, %l7 = 00000000000000ff
	lduh	[%i5+0x014],%l7		! %l7 = 0000000000000000
!	Mem[0000000030041408] = db19ffa0 3a3f0043, %l6 = 000000a0, %l7 = 00000000
	ldda	[%i1+%o4]0x81,%l6	! %l6 = 00000000db19ffa0 000000003a3f0043
!	Mem[0000000020800001] = 1f90a840, %l7 = 000000003a3f0043
	ldub	[%o1+0x001],%l7		! %l7 = 0000000000000090
!	Mem[0000000010041400] = 000000ff, %l0 = 0000000000000000
	ldsba	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001408] = ffffff18, %l2 = ffffffffffffffff
	lduba	[%i0+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181408] = 000000ff66777c26, %f24 = 00000000 00000000
	ldda	[%i6+%o4]0x88,%f24	! %f24 = 000000ff 66777c26
	membar	#Sync			! Added by membar checker (36)
!	Mem[0000000010141400] = 5ae4ffff 00000000 100ad334 79bf2edb
!	Mem[0000000010141410] = ffffffff 000000ff baa4d334 79bf2edb
!	Mem[0000000010141420] = a724226d 61d05459 267c7766 100d421f
!	Mem[0000000010141430] = 07b95aff 7262ec95 00000000 00000043
	ldda	[%i5+%g0]ASI_BLK_AIUP,%f0 	! Block Load from 0000000010141400

p0_label_185:
!	Starting 10 instruction Store Burst
!	%l2 = 000000ff, %l3 = 00000000, Mem[00000000300c1410] = ffff111d ffa0ffff
	stda	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000ff 00000000
!	Mem[0000000030101410] = 00000000, %l1 = 00000000baffffff
	swapa	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%l2 = 000000ff, %l3 = 00000000, Mem[00000000100c1410] = ffd25dff ffffffff
	std	%l2,[%i3+%o5]		! Mem[00000000100c1410] = 000000ff 00000000
!	Mem[0000000030001400] = 1b5555a3, %l0 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l0	! %l0 = 00000000000000a3
!	Mem[0000000030081400] = ff5dd2ff, %l7 = 0000000000000090
	ldstuba	[%i2+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	%l6 = 00000000db19ffa0, Mem[00000000300c1400] = baffffff
	stha	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = baffffa0
!	Mem[0000000010101408] = baa4d334, %l6 = 00000000db19ffa0
	swapa	[%i4+%o4]0x80,%l6	! %l6 = 00000000baa4d334
!	%l0 = 000000a3, %l1 = 00000000, Mem[0000000010041408] = ff998436 00000040
	stda	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000a3 00000000
	membar	#Sync			! Added by membar checker (37)
!	%l2 = 00000000000000ff, Mem[0000000010141400] = ffffe45a
	stba	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffe4ff
!	%l6 = 00000000baa4d334, Mem[0000000010081410] = 2580a7ff
	stba	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 2580a734

p0_label_186:
!	Starting 10 instruction Load Burst
!	%f8  = a724226d, %f25 = 66777c26, %f19 = ffffa0ff
	fdivs	%f8 ,%f25,%f19		! tt=0x22, %l0 = 00000000000000c5
!	Mem[00000000100c1400] = cc00000000000000, %l2 = 00000000000000ff
	ldxa	[%i3+%g0]0x80,%l2	! %l2 = cc00000000000000
!	Mem[000000001014142e] = 100d421f, %l6 = 00000000baa4d334, %asi = 80
	lduha	[%i5+0x02e]%asi,%l6	! %l6 = 000000000000421f
!	Mem[0000000010101400] = 223f57ff, %l4 = ffffffffff5dd2ff
	ldsha	[%i4+%g0]0x88,%l4	! %l4 = 00000000000057ff
!	Mem[0000000010101410] = a0ff0000, %l1 = 0000000000000000
	ldsha	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141410] = ffffffff, %l7 = 00000000000000ff
	ldsba	[%i5+%o5]0x80,%l7	! %l7 = ffffffffffffffff
!	%l2 = cc00000000000000, %l0 = 00000000000000c5, %l3 = 0000000000000000
	andn	%l2,%l0,%l3		! %l3 = cc00000000000000
!	%l3 = cc00000000000000, Mem[0000000030001410] = 00000000000000ff
	stxa	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = cc00000000000000
!	Mem[0000000010001400] = ff000000 209a0a10 768500ff 00000000
!	Mem[0000000010001410] = cd000000 00000000 2eceac7a 100aa7f4
!	Mem[0000000010001420] = ff000000 ffffffff 5e28f15b 37f294ff
!	Mem[0000000010001430] = 09e5ff74 11ff2c35 0000000c 41cb61db
	ldda	[%i0+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010001400
!	Mem[0000000010101411] = 0000ffa0, %l1 = 0000000000000000
	ldsb	[%i4+0x011],%l1		! %l1 = 0000000000000000

p0_label_187:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 34a78025, %l7 = ffffffffffffffff
	ldstuba	[%i2+%o5]0x80,%l7	! %l7 = 0000000000000034
!	%f22 = 2eceac7a 100aa7f4, Mem[0000000010041408] = 000000a3 00000000
	stda	%f22,[%i1+%o4]0x88	! Mem[0000000010041408] = 2eceac7a 100aa7f4
!	%f25 = ffffffff, Mem[0000000010081410] = 2580a7ff
	sta	%f25,[%i2+%o5]0x88	! Mem[0000000010081410] = ffffffff
!	Mem[0000000030041408] = a0ff19db, %l2 = 0000000000000000
	swapa	[%i1+%o4]0x89,%l2	! %l2 = 00000000a0ff19db
!	%l6 = 000000000000421f, Mem[0000000010101408] = a0ff19db
	stba	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = a0ff191f
!	%l7 = 0000000000000034, Mem[00000000201c0000] = 00001a10
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 00341a10
!	%f0  = 5ae4ffff 00000000, %l5 = 00000000000000ff
!	Mem[0000000010081418] = ffff924effd25dff
	add	%i2,0x018,%g1
	stda	%f0,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010081418] = 00000000ffffe45a
!	%l7 = 0000000000000034, Mem[0000000030001400] = 1b5555ff
	stha	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = 1b550034
!	Mem[0000000010141408] = 34d30a10, %l6 = 000000000000421f
	swapa	[%i5+%o4]0x88,%l6	! %l6 = 0000000034d30a10
!	Mem[0000000010181400] = 79bf2edb, %l2 = 00000000a0ff19db
	ldstuba	[%i6+%g0]0x88,%l2	! %l2 = 00000000000000db

p0_label_188:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 000000ff, %f7  = 79bf2edb
	lda	[%i2+%o4]0x89,%f7 	! %f7 = 000000ff
	membar	#Sync			! Added by membar checker (38)
!	Mem[0000000010081400] = ffac654a ad921800 5e610975 ffac654a
!	Mem[0000000010081410] = ffffffff 00000000 00000000 ffffe45a
!	Mem[0000000010081420] = 79647692 a7f4d91b e557ba48 ff00bf20
!	Mem[0000000010081430] = ffd25dff 00000000 cf14ffa0 ffffa0ff
	ldda	[%i2+%g0]ASI_BLK_PL,%f16	! Block Load from 0000000010081400
!	%l5 = 00000000000000ff, %l1 = 0000000000000000, %y  = baa4d334
	udiv	%l5,%l1,%l2		! Div by zero, %l0 = 00000000000000ed
!	%l4 = 00000000000057ff, Mem[0000000010041408] = f4a70a10
	stwa	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 000057ff
!	Mem[0000000010181400] = ff2ebf79, %l3 = cc00000000000000
	ldsha	[%i6+%g0]0x80,%l3	! %l3 = ffffffffffffff2e
!	Mem[0000000010181408] = 267c7766, %l6 = 0000000034d30a10
	ldsba	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000026
!	Mem[0000000010141400] = ffffe4ff, %l6 = 0000000000000026
	ldsba	[%i5+%g0]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030041400] = 000000ff, %l6 = ffffffffffffffff
	ldswa	[%i1+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141408] = 00000000, %l3 = ffffffffffffff2e
	ldswa	[%i5+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101400] = ffffffff, %l6 = 00000000000000ff
	ldswa	[%i4+%g0]0x89,%l6	! %l6 = ffffffffffffffff

p0_label_189:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ed, Mem[0000000010101418] = 00ff00000000006c
	stx	%l0,[%i4+0x018]		! Mem[0000000010101418] = 00000000000000ed
!	Mem[00000000300c1400] = baffffa0, %l6 = ffffffffffffffff
	ldstuba	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000a0
!	%l7 = 0000000000000034, Mem[0000000030041408] = 43003f3a00000000
	stxa	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000000000034
!	%f1  = 00000000, Mem[0000000010001400] = 000000ff
	sta	%f1 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
	membar	#Sync			! Added by membar checker (39)
!	%l7 = 0000000000000034, Mem[0000000010081410] = ffffffff
	stwa	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000034
!	%l3 = 0000000000000000, Mem[0000000010001410] = cd000000
	stba	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	Mem[0000000020800040] = ffffb270, %l4 = 00000000000057ff
	ldstub	[%o1+0x040],%l4		! %l4 = 00000000000000ff
!	%l2 = 00000000000000db, Mem[0000000010081410] = 00000034
	stwa	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000db
!	%l5 = 00000000000000ff, %l6 = 00000000000000a0, %l0 = 00000000000000ed
	or	%l5,%l6,%l0		! %l0 = 00000000000000ff
!	Mem[0000000010001410] = 00000000, %l1 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 0000000000000000

p0_label_190:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 000000db00000000, %f18 = 4a65acff 7509615e
	ldda	[%i2+%o5]0x80,%f18	! %f18 = 000000db 00000000
!	Mem[0000000010101408] = ffbaffff a0ff191f, %l2 = 000000db, %l3 = 00000000
	ldda	[%i4+%o4]0x88,%l2	! %l2 = 00000000a0ff191f 00000000ffbaffff
!	Mem[00000000100c1402] = cc000000, %l4 = 00000000000000ff
	ldsb	[%i3+0x002],%l4		! %l4 = 0000000000000000
!	Mem[0000000010181414] = 00000000, %l3 = 00000000ffbaffff, %asi = 80
	lduwa	[%i6+0x014]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041400] = 000000ff, %l7 = 0000000000000034
	lduha	[%i1+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1408] = ff00000000000000, %l5 = 00000000000000ff
	ldxa	[%i3+%o4]0x80,%l5	! %l5 = ff00000000000000
!	Mem[0000000010041438] = 9e19ffa0, %l3 = 0000000000000000
	lduw	[%i1+0x038],%l3		! %l3 = 000000009e19ffa0
!	Mem[0000000010141408] = 1f420000, %l5 = ff00000000000000
	lduha	[%i5+%o4]0x80,%l5	! %l5 = 0000000000001f42
!	Mem[0000000010181428] = 000000ff 00000079, %l2 = a0ff191f, %l3 = 9e19ffa0
	ldd	[%i6+0x028],%l2		! %l2 = 00000000000000ff 0000000000000079
!	Mem[0000000010041400] = 000000ff, %l2 = 00000000000000ff
	lduha	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000

p0_label_191:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000010181410] = 9e19ffff
	stba	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 9e19ffff
!	Mem[0000000010041400] = 000000ff ffffffcd 000057ff 7aacce2e
!	%f0  = 5ae4ffff 00000000 100ad334 79bf2edb
!	%f4  = ffffffff 000000ff baa4d334 000000ff
!	%f8  = a724226d 61d05459 267c7766 100d421f
!	%f12 = 07b95aff 7262ec95 00000000 00000043
	stda	%f0 ,[%i1+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010041400
!	%l4 = 0000000000000000, Mem[0000000010181400] = 79bf2eff
	stba	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 79bf2e00
!	Mem[0000000010101400] = ff573f22 ffa0e56b 1f19ffa0 ffffbaff
!	%f16 = 001892ad 4a65acff 000000db 00000000
!	%f20 = 00000000 ffffffff 5ae4ffff 00000000
!	%f24 = 1bd9f4a7 92766479 20bf00ff 48ba57e5
!	%f28 = 00000000 ff5dd2ff ffa0ffff a0ff14cf
	stda	%f16,[%i4+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010101400
!	%l0 = 00000000000000ff, Mem[0000000020800000] = 1f90a840
	sth	%l0,[%o1+%g0]		! Mem[0000000020800000] = 00ffa840
!	%l0 = 00000000000000ff, Mem[0000000030181400] = e45ade43
	stba	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = ff5ade43
!	Mem[0000000030041400] = ff000000 00000000 34000000 00000000
!	%f16 = 001892ad 4a65acff 000000db 00000000
!	%f20 = 00000000 ffffffff 5ae4ffff 00000000
!	%f24 = 1bd9f4a7 92766479 20bf00ff 48ba57e5
!	%f28 = 00000000 ff5dd2ff ffa0ffff a0ff14cf
	stda	%f16,[%i1+%g0]ASI_BLK_SL	! Block Store to 0000000030041400
!	Mem[00000000100c1408] = ff000000, %l3 = 0000000000000079
	swapa	[%i3+%o4]0x80,%l3	! %l3 = 00000000ff000000
!	Mem[0000000030141400] = 6d2224a7, %l1 = 0000000000000000
	swapa	[%i5+%g0]0x89,%l1	! %l1 = 000000006d2224a7
!	Mem[000000001008141f] = ffffe45a, %l1 = 000000006d2224a7
	ldstub	[%i2+0x01f],%l1		! %l1 = 000000000000005a

p0_label_192:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000, %l5 = 0000000000001f42
	lduba	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081408] = 000000ff, %l7 = 00000000000000ff
	ldsha	[%i2+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001410] = 00000000, %l3 = 00000000ff000000
	ldsba	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1420] = a724226d61d05459, %f10 = 267c7766 100d421f
	ldd	[%i3+0x020],%f10	! %f10 = a724226d 61d05459
!	Mem[0000000030141410] = ffbaffff, %l0 = 00000000000000ff
	ldswa	[%i5+%o5]0x81,%l0	! %l0 = ffffffffffbaffff
!	Code Fragment 4, seed = 182182
p0_fragment_21:
!	%l0 = ffffffffffbaffff
	setx	0xf46172751eb7c0f6,%g7,%l0 ! %l0 = f46172751eb7c0f6
!	%l1 = 000000000000005a
	setx	0x796fe5db0cf7dc21,%g7,%l1 ! %l1 = 796fe5db0cf7dc21
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f46172751eb7c0f6
	setx	0xe8c465aabdbcab5c,%g7,%l0 ! %l0 = e8c465aabdbcab5c
!	%l1 = 796fe5db0cf7dc21
	setx	0x31c8dace8f0531a7,%g7,%l1 ! %l1 = 31c8dace8f0531a7
p0_fragment_21_end:
!	Mem[00000000100c1410] = 000000ff, %l6 = 00000000000000a0
	lduba	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000
	membar	#Sync			! Added by membar checker (40)
!	Mem[0000000010101410] = ffffffff, %l5 = 0000000000000000
	lduba	[%i4+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041410] = ffffffff000000ff, %f12 = 07b95aff 7262ec95
	ldda	[%i1+%o5]0x88,%f12	! %f12 = ffffffff 000000ff
!	Mem[0000000010041408] = db2ebf79 34d30a10, %l0 = bdbcab5c, %l1 = 8f0531a7
	ldda	[%i1+%o4]0x80,%l0	! %l0 = 00000000db2ebf79 0000000034d30a10

p0_label_193:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030141400] = 00000000 223f577f
	stda	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000 00000000
!	%l5 = 00000000000000ff, Mem[0000000010081410] = db000000
	stha	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = db0000ff
!	%l1 = 0000000034d30a10, Mem[0000000010001410] = 00000000
	stba	%l1,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000010
!	%l2 = 0000000000000000, Mem[0000000010181410] = 9e19ffff
	stha	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 9e190000
!	Mem[0000000010081430] = ffd25dff, %l3 = 0000000000000000, %asi = 80
	lduwa	[%i2+0x030]%asi,%l3	! %l3 = 00000000ffd25dff
!	Mem[0000000030041410] = ffffffff, %l7 = 00000000000000ff
	ldstuba	[%i1+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000030001408] = ffffff18
	stba	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 00ffff18
!	Mem[0000000010001430] = 09e5ff74, %l7 = 000000ff, %l2 = 00000000
	add	%i0,0x30,%g1
	casa	[%g1]0x80,%l7,%l2	! %l2 = 0000000009e5ff74
!	Mem[0000000030041410] = ffffffff, %l7 = 00000000000000ff
	ldstuba	[%i1+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041400] = 00000000, %l5 = 00000000000000ff
	swapa	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000000

p0_label_194:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00000000, %l3 = 00000000ffd25dff
	ldsba	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l5 = 0000000000000000
	lduha	[%i5+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = 1f42000079bf2edb, %l7 = 00000000000000ff
	ldxa	[%i5+%o4]0x80,%l7	! %l7 = 1f42000079bf2edb
!	Mem[0000000010101408] = 00000000, %f22 = 5ae4ffff
	lda	[%i4+%o4]0x88,%f22	! %f22 = 00000000
!	Mem[0000000010041400] = ff000000, %l7 = 1f42000079bf2edb
	lduwa	[%i1+%g0]0x88,%l7	! %l7 = 00000000ff000000
!	%f15 = 00000043, %f7  = 000000ff, %f23 = 00000000
	fsubs	%f15,%f7 ,%f23		! tt=0x22, %l0 = 00000000db2ebf9b
!	Mem[0000000010041400] = 000000ff ffffe45a, %l4 = 00000000, %l5 = 00000000
	ldda	[%i1+%g0]0x80,%l4	! %l4 = 00000000000000ff 00000000ffffe45a
!	Mem[0000000010181400] = 4000000079bf2e00, %f4  = ffffffff 000000ff
	ldda	[%i6+%g0]0x88,%f4 	! %f4  = 40000000 79bf2e00
!	Mem[0000000010041400] = 5ae4ffff ff000000, %l2 = 09e5ff74, %l3 = 00000000
	ldda	[%i1+%g0]0x88,%l2	! %l2 = 00000000ff000000 000000005ae4ffff
!	Mem[00000000300c1410] = 000000ff, %l5 = 00000000ffffe45a
	lduba	[%i3+%o5]0x89,%l5	! %l5 = 00000000000000ff

p0_label_195:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000034d30a10, Mem[0000000010081418] = 00000000ffffe4ff
	stx	%l1,[%i2+0x018]		! Mem[0000000010081418] = 0000000034d30a10
!	Mem[0000000030041400] = ffac654a, %l1 = 0000000034d30a10
	ldstuba	[%i1+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000010141420] = a724226d 61d05459, %asi = 80
	stda	%l4,[%i5+0x020]%asi	! Mem[0000000010141420] = 000000ff 000000ff
!	Mem[0000000010081410] = ff0000db, %l3 = 000000005ae4ffff
	ldstuba	[%i2+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	%f12 = ffffffff 000000ff, Mem[0000000010181410] = 0000199e 00000000
	std	%f12,[%i6+%o5]		! Mem[0000000010181410] = ffffffff 000000ff
!	%l5 = 00000000000000ff, Mem[0000000010101430] = ffd25dff00000000
	stx	%l5,[%i4+0x030]		! Mem[0000000010101430] = 00000000000000ff
!	%f20 = 00000000 ffffffff, %l0 = 00000000db2ebf9b
!	Mem[0000000030181428] = 2ff12a55b601777c
	add	%i6,0x028,%g1
	stda	%f20,[%g1+%l0]ASI_PST8_S ! Mem[0000000030181428] = 00f12a00ff01ffff
!	Mem[0000000010141418] = baa4d334, %l5 = 00000000000000ff, %asi = 80
	swapa	[%i5+0x018]%asi,%l5	! %l5 = 00000000baa4d334
!	%l1 = 00000000000000ff, Mem[0000000030141410] = ffffbaff
	stha	%l1,[%i5+%o5]0x89	! Mem[0000000030141410] = ffff00ff
!	%l1 = 00000000000000ff, %l2 = 00000000ff000000, %l7 = 00000000ff000000
	subc	%l1,%l2,%l7		! %l7 = ffffffff010000ff

p0_label_196:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ffac654a, %l7 = ffffffff010000ff
	ldswa	[%i1+%g0]0x81,%l7	! %l7 = ffffffffffac654a
!	%l5 = 00000000baa4d334, imm = 0000000000000f02, %l7 = ffffffffffac654a
	andn	%l5,0xf02,%l7		! %l7 = 00000000baa4d034
!	Mem[00000000211c0000] = ffa038a0, %l5 = 00000000baa4d334, %asi = 80
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = ffffffffffffffa0
!	Mem[0000000030001410] = 00000000000000cc, %f6  = baa4d334 000000ff
	ldda	[%i0+%o5]0x81,%f6 	! %f6  = 00000000 000000cc
!	Mem[00000000211c0000] = ffa038a0, %l6 = 0000000000000000
	ldsh	[%o2+%g0],%l6		! %l6 = ffffffffffffffa0
!	Mem[00000000300c1410] = 000000ff, %l2 = 00000000ff000000
	lduwa	[%i3+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181408] = 00000000, %l4 = 00000000000000ff
	lduwa	[%i6+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081408] = 7509615e, %l3 = 00000000000000ff
	lduba	[%i2+%o4]0x88,%l3	! %l3 = 000000000000005e
!	Mem[0000000021800140] = 843689c0, %l7 = 00000000baa4d034, %asi = 80
	ldsha	[%o3+0x140]%asi,%l7	! %l7 = ffffffffffff8436
!	Mem[0000000010141410] = ffffffff, %l2 = 00000000000000ff
	lduba	[%i5+%o5]0x88,%l2	! %l2 = 00000000000000ff

p0_label_197:
!	Starting 10 instruction Store Burst
!	%f22 = 00000000 00000000, Mem[0000000030041410] = ffffffff 00000000
	stda	%f22,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 00000000
!	Mem[00000000300c1400] = baffffff, %l4 = 0000000000000000
	ldstuba	[%i3+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%f24 = 1bd9f4a7 92766479, Mem[0000000010041400] = 000000ff ffffe45a
	stda	%f24,[%i1+%g0]0x80	! Mem[0000000010041400] = 1bd9f4a7 92766479
!	Mem[0000000030041410] = 00000000, %l7 = ffffffffffff8436
	ldstuba	[%i1+%o5]0x89,%l7	! %l7 = 0000000000000000
!	%l0 = 00000000db2ebf9b, imm = fffffffffffffd13, %l2 = 00000000000000ff
	xnor	%l0,-0x2ed,%l2		! %l2 = 00000000db2ebd77
!	Mem[0000000010001408] = ff008576, %l5 = 00000000ffffffa0
	swapa	[%i0+%o4]0x88,%l5	! %l5 = 00000000ff008576
!	%f21 = ffffffff, Mem[0000000030041408] = 00000000
	sta	%f21,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffff
!	Mem[0000000010081428] = e557ba48, %l0 = 00000000db2ebf9b, %asi = 80
	swapa	[%i2+0x028]%asi,%l0	! %l0 = 00000000e557ba48
!	%l6 = ffffffa0, %l7 = 00000000, Mem[0000000010181400] = 79bf2e00 40000000
	stda	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffffa0 00000000
!	Mem[0000000010001424] = ffffffff, %l4 = 000000ff, %l0 = e557ba48
	add	%i0,0x24,%g1
	casa	[%g1]0x80,%l4,%l0	! %l0 = 00000000ffffffff

p0_label_198:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ff000000, %f17 = 4a65acff
	lda	[%i1+%o5]0x81,%f17	! %f17 = ff000000
!	Mem[0000000010001400] = 00000000, %l6 = ffffffffffffffa0
	lduha	[%i0+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = ffac654a ad921800, %l0 = ffffffff, %l1 = 000000ff, %asi = 80
	ldda	[%i2+0x000]%asi,%l0	! %l0 = 00000000ffac654a 00000000ad921800
!	Mem[0000000010081408] = 7509615e, %l2 = 00000000db2ebd77
	lduwa	[%i2+%o4]0x88,%l2	! %l2 = 000000007509615e
!	Mem[0000000030141408] = 00000000, %l3 = 000000000000005e
	ldsha	[%i5+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = ffffffba, %l2 = 000000007509615e
	lduwa	[%i3+%g0]0x81,%l2	! %l2 = 00000000ffffffba
!	Mem[0000000030041400] = 4a65acff, %l2 = 00000000ffffffba
	lduwa	[%i1+%g0]0x89,%l2	! %l2 = 000000004a65acff
!	Mem[0000000030081400] = ffd25dff, %l5 = 00000000ff008576
	lduha	[%i2+%g0]0x81,%l5	! %l5 = 000000000000ffd2
!	Mem[0000000021800180] = ffff73f0, %l2 = 000000004a65acff, %asi = 80
	ldsha	[%o3+0x180]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010041408] = db2ebf79, %l6 = 0000000000000000
	ldsha	[%i1+%o4]0x80,%l6	! %l6 = ffffffffffffdb2e

p0_label_199:
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffffff, imm = 000000000000069f, %l0 = 00000000ffac654a
	addc	%l2,0x69f,%l0		! %l0 = 000000000000069e
!	Mem[0000000030181400] = 43de5aff, %l5 = 000000000000ffd2
	ldstuba	[%i6+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%l3 = 0000000000000000, immd = 0000000000000a03, %l108 = 0000000000000005
	sdivx	%l3,0xa03,%l5		! %l5 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010141410] = ffffffff
	stwa	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	Mem[000000001004143c] = 00000000, %l2 = 00000000ffffffff, %asi = 80
	swapa	[%i1+0x03c]%asi,%l2	! %l2 = 0000000000000000
!	%l0 = 0000069e, %l1 = ad921800, Mem[0000000010101438] = cf14ffa0 ffffa0ff
	std	%l0,[%i4+0x038]		! Mem[0000000010101438] = 0000069e ad921800
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000010081408] = 7509615e 4a65acff
	stda	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000ff 00000000
!	%l7 = 0000000000000000, Mem[0000000030041400] = ffac654a
	stba	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = 00ac654a
!	%l3 = 0000000000000000, %l4 = 00000000000000ff, %l3 = 0000000000000000
	addc	%l3,%l4,%l3		! %l3 = 00000000000000ff
!	%f22 = 00000000, Mem[0000000030181408] = 00000000
	sta	%f22,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000

p0_label_200:
!	Starting 10 instruction Load Burst
!	%l5 = 0000000000000000, Mem[0000000030141410] = 00000000ffff00ff
	stxa	%l5,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l4 = 00000000000000ff
	ldsha	[%i5+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041418] = ff000000 34d3a4ba, %l2 = 00000000, %l3 = 000000ff, %asi = 80
	ldda	[%i1+0x018]%asi,%l2	! %l2 = 00000000ff000000 0000000034d3a4ba
!	Mem[0000000030081400] = ffd25dff00000000, %l1 = 00000000ad921800
	ldxa	[%i2+%g0]0x81,%l1	! %l1 = ffd25dff00000000
!	Mem[0000000010141402] = ffe4ffff, %l5 = 0000000000000000, %asi = 80
	lduha	[%i5+0x002]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030101410] = ffffffba, %l5 = 000000000000ffff
	ldsha	[%i4+%o5]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010101400] = ffac654a ad921800, %l6 = ffffdb2e, %l7 = 00000000
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 00000000ffac654a 00000000ad921800
!	%l0 = 000000000000069e, %l2 = 00000000ff000000, %y  = baa4d334
	umul	%l0,%l2,%l0		! %l0 = 0000069762000000, %y = 00000697
!	%f18 = 000000db, %f28 = 00000000
	fsqrts	%f18,%f28		! tt=0x22, %l0 = 0000069762000022
!	Mem[00000000300c1400] = baffffff, %l0 = 0000069762000022
	lduha	[%i3+%g0]0x89,%l0	! %l0 = 000000000000ffff

p0_label_201:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141430] = 07b95aff, %l6 = ffac654a, %l3 = 34d3a4ba
	add	%i5,0x30,%g1
	casa	[%g1]0x80,%l6,%l3	! %l3 = 0000000007b95aff
!	%l6 = 00000000ffac654a, Mem[0000000010101400] = ffac654aad921800
	stxa	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000ffac654a
!	%l7 = 00000000ad921800, Mem[0000000010101410] = ffffffff
	stha	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 1800ffff
!	%f16 = 001892ad ff000000, Mem[0000000010101410] = ffff0018 00000000
	stda	%f16,[%i4+%o5]0x88	! Mem[0000000010101410] = 001892ad ff000000
!	%l5 = ffffffffffffffff, Mem[0000000030081410] = f4a70a10
	stwa	%l5,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffffff
!	Mem[0000000010041408] = 79bf2edb, %l6 = 00000000ffac654a
	ldstuba	[%i1+%o4]0x88,%l6	! %l6 = 00000000000000db
!	%l0 = 0000ffff, %l1 = 00000000, Mem[0000000010181438] = ff000000 40000000
	std	%l0,[%i6+0x038]		! Mem[0000000010181438] = 0000ffff 00000000
!	Mem[00000000201c0001] = 00341a10, %l2 = 00000000ff000000
	ldstub	[%o0+0x001],%l2		! %l2 = 0000000000000034
!	%l4 = 0000000000000000, Mem[0000000020800040] = ffffb270
	sth	%l4,[%o1+0x040]		! Mem[0000000020800040] = 0000b270
!	%l0 = 0000ffff, %l1 = 00000000, Mem[0000000010101400] = 00000000 ffac654a
	stda	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000ffff 00000000

p0_label_202:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00000000, %f23 = 00000000
	lda	[%i0+%o5]0x81,%f23	! %f23 = 00000000
!	Mem[0000000010081420] = 79647692 a7f4d91b, %l4 = 00000000, %l5 = ffffffff, %asi = 80
	ldda	[%i2+0x020]%asi,%l4	! %l4 = 0000000079647692 00000000a7f4d91b
!	Mem[0000000030001408] = 0000006618ffff00, %f2  = 100ad334 79bf2edb
	ldda	[%i0+%o4]0x89,%f2 	! %f2  = 00000066 18ffff00
!	Mem[0000000010181410] = ffffffff, %l3 = 0000000007b95aff
	lduwa	[%i6+%o5]0x80,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000030141400] = 00000000, %l6 = 00000000000000db
	ldsha	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1408] = 0000000079000000, %f16 = 001892ad ff000000
	ldda	[%i3+%o4]0x88,%f16	! %f16 = 00000000 79000000
!	Mem[0000000030001410] = 00000000, %l7 = 00000000ad921800
	ldsha	[%i0+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101400] = ffff0000, %l3 = 00000000ffffffff
	lduba	[%i4+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 1f42000079bf2edb, %f16 = 00000000 79000000
	ldda	[%i5+%o4]0x80,%f16	! %f16 = 1f420000 79bf2edb
!	Mem[0000000021800180] = ffff73f0, %l6 = 0000000000000000, %asi = 80
	lduba	[%o3+0x180]%asi,%l6	! %l6 = 00000000000000ff

p0_label_203:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 00000000, %l3 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081430] = ffd25dff00000000, %l4 = 0000000079647692, %l6 = 00000000000000ff
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l4,%l6	! %l6 = ffd25dff00000000
!	%l0 = 000000000000ffff, imm = fffffffffffffd77, %l5 = 00000000a7f4d91b
	subc	%l0,-0x289,%l5		! %l5 = 0000000000010288
!	%l2 = 0000000000000034, Mem[0000000030001408] = 00ffff18
	stha	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 0034ff18
!	%l6 = ffd25dff00000000, Mem[0000000020800040] = 0000b270, %asi = 80
	stha	%l6,[%o1+0x040]%asi	! Mem[0000000020800040] = 0000b270
!	%l3 = 0000000000000000, %l6 = ffd25dff00000000, %y  = 00000697
	umul	%l3,%l6,%l4		! %l4 = 0000000000000000, %y = 00000000
!	%l7 = 0000000000000000, Mem[00000000211c0000] = ffa038a0
	sth	%l7,[%o2+%g0]		! Mem[00000000211c0000] = 000038a0
!	%f31 = a0ff14cf, Mem[0000000030141408] = 00000000
	sta	%f31,[%i5+%o4]0x81	! Mem[0000000030141408] = a0ff14cf
!	Mem[0000000020800001] = 00ffa840, %l1 = ffd25dff00000000
	ldstub	[%o1+0x001],%l1		! %l1 = 00000000000000ff
!	%l5 = 0000000000010288, Mem[0000000030141400] = 00000000
	stwa	%l5,[%i5+%g0]0x89	! Mem[0000000030141400] = 00010288

p0_label_204:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 000000ff, %l5 = 0000000000010288
	ldswa	[%i2+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041410] = ff000000, %f30 = ffa0ffff
	lda	[%i1+%o5]0x80,%f30	! %f30 = ff000000
!	Mem[0000000010181400] = ffffffa0, %l1 = 00000000000000ff
	ldswa	[%i6+%g0]0x88,%l1	! %l1 = ffffffffffffffa0
!	Mem[0000000030101408] = 00000000, %l1 = ffffffffffffffa0
	lduwa	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = 0000421f, %f12 = ffffffff
	lda	[%i5+%o4]0x88,%f12	! %f12 = 0000421f
!	Mem[0000000030181400] = 43de5aff, %l4 = 0000000000000000
	ldsha	[%i6+%g0]0x89,%l4	! %l4 = 0000000000005aff
!	Mem[0000000030041400] = 4a65ac00, %l4 = 0000000000005aff
	ldsha	[%i1+%g0]0x89,%l4	! %l4 = ffffffffffffac00
!	Mem[0000000030081400] = ffd25dff, %l1 = 0000000000000000
	lduba	[%i2+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141408] = cf14ffa0, %l3 = 0000000000000000
	lduwa	[%i5+%o4]0x89,%l3	! %l3 = 00000000cf14ffa0
!	Mem[0000000030041408] = 000000dbffffffff, %f30 = ff000000 a0ff14cf
	ldda	[%i1+%o4]0x89,%f30	! %f30 = 000000db ffffffff

p0_label_205:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1423] = a724226d, %l5 = 00000000000000ff
	ldstub	[%i3+0x023],%l5		! %l5 = 000000000000006d
!	Mem[00000000100c1408] = 79000000, %l3 = 00000000cf14ffa0
	ldstuba	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000000
!	%l0 = 0000ffff, %l1 = 000000ff, Mem[0000000010101410] = 000000ff ad921800
	stda	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000ffff 000000ff
!	%l2 = 0000000000000034, Mem[0000000010181400] = ffffffa0
	stha	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = ffff0034
!	Mem[00000000100c1404] = 00000000, %l1 = 000000ff, %l7 = 00000000
	add	%i3,0x04,%g1
	casa	[%g1]0x80,%l1,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101400] = 0000ffff 00000000 00000000 db000000
!	%f0  = 5ae4ffff 00000000 00000066 18ffff00
!	%f4  = 40000000 79bf2e00 00000000 000000cc
!	%f8  = a724226d 61d05459 a724226d 61d05459
!	%f12 = 0000421f 000000ff 00000000 00000043
	stda	%f0 ,[%i4+%g0]ASI_BLK_P	! Block Store to 0000000010101400
!	%f9  = 61d05459, Mem[0000000030141408] = a0ff14cf
	sta	%f9 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 61d05459
!	%l3 = 0000000000000000, Mem[0000000010041410] = 000000ff
	stha	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%l5 = 000000000000006d, Mem[0000000010041409] = ff2ebf79
	stb	%l5,[%i1+0x009]		! Mem[0000000010041408] = ff6dbf79
!	%f8  = a724226d 61d05459, Mem[0000000010081428] = db2ebf9b ff00bf20, %asi = 80
	stda	%f8 ,[%i2+0x028]%asi	! Mem[0000000010081428] = a724226d 61d05459

p0_label_206:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 000000ff, %f21 = ffffffff
	ld	[%i3+%o5],%f21		! %f21 = 000000ff
!	Mem[0000000010081410] = ff0000db, %f24 = 1bd9f4a7
	lda	[%i2+%o5]0x80,%f24	! %f24 = ff0000db
!	Mem[0000000030101410] = baffffff, %l5 = 000000000000006d
	ldswa	[%i4+%o5]0x89,%l5	! %l5 = ffffffffbaffffff
!	Mem[00000000100c1408] = 790000ff, %l3 = 0000000000000000
	ldsba	[%i3+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030181408] = ff000000 00000000, %l0 = 0000ffff, %l1 = 000000ff
	ldda	[%i6+%o4]0x89,%l0	! %l0 = 0000000000000000 00000000ff000000
!	Mem[0000000030181408] = 00000000, %l2 = 0000000000000034
	ldsba	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l3 = ffffffffffffffff
	ldsba	[%i3+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141400] = 00010288, %l2 = 0000000000000000
	lduba	[%i5+%g0]0x89,%l2	! %l2 = 0000000000000088
!	%l3 = 0000000000000000, imm = fffffffffffffb09, %l1 = 00000000ff000000
	addc	%l3,-0x4f7,%l1		! %l1 = fffffffffffffb09
!	Mem[00000000201c0000] = 00ff1a10, %l0 = 0000000000000000, %asi = 80
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 00000000000000ff

p0_label_207:
!	Starting 10 instruction Store Burst
!	%l6 = ffd25dff00000000, Mem[0000000030141408] = 61d054590000ffff
	stxa	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = ffd25dff00000000
!	Mem[00000000300c1408] = 00000000, %l1 = fffffffffffffb09
	ldstuba	[%i3+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = ff000000, %l3 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l3	! %l3 = 00000000ff000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010101400] = 5ae4ffff 00000000
	std	%l6,[%i4+%g0]		! Mem[0000000010101400] = 00000000 00000000
!	Mem[0000000010181408] = 267c7766, %l4 = 00000000ffffac00
	swap	[%i6+%o4],%l4		! %l4 = 00000000267c7766
!	%f28 = 00000000 ff5dd2ff, Mem[0000000010141410] = 00000000 000000ff
	stda	%f28,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 ff5dd2ff
!	Mem[00000000300c1410] = ff000000, %l6 = ffd25dff00000000
	ldstuba	[%i3+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	%f22 = 00000000 00000000, Mem[0000000010101400] = 00000000 00000000
	stda	%f22,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000 00000000
!	Mem[0000000010041401] = 1bd9f4a7, %l3 = 00000000ff000000
	ldstuba	[%i1+0x001]%asi,%l3	! %l3 = 00000000000000d9
!	%f2  = 00000066 18ffff00, %l0 = 00000000000000ff
!	Mem[0000000010001418] = 2eceac7a100aa7f4
	add	%i0,0x018,%g1
	stda	%f2,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010001418] = 00ffff1866000000

p0_label_208:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1418] = 0000000000000000, %l6 = 00000000000000ff
	ldx	[%i3+0x018],%l6		! %l6 = 0000000000000000
!	Mem[0000000010181410] = ffffffff, %l7 = 0000000000000000
	ldsha	[%i6+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030081408] = ff000000, %l7 = ffffffffffffffff
	ldsha	[%i2+%o4]0x81,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000030081410] = ffffffff00000000, %l5 = ffffffffbaffffff
	ldxa	[%i2+%o5]0x81,%l5	! %l5 = ffffffff00000000
!	Mem[0000000030041410] = ff000000, %l6 = 0000000000000000
	lduha	[%i1+%o5]0x81,%l6	! %l6 = 000000000000ff00
!	Mem[00000000100c1408] = 790000ff, %f27 = 48ba57e5
	lda	[%i3+%o4]0x88,%f27	! %f27 = 790000ff
!	Mem[0000000010081408] = 000000ff, %l5 = ffffffff00000000
	lduba	[%i2+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081400] = ff5dd2ff, %l1 = 0000000000000000
	ldswa	[%i2+%g0]0x89,%l1	! %l1 = ffffffffff5dd2ff
!	Mem[0000000010041400] = 1bfff4a7, %f26 = 20bf00ff
	lda	[%i1+%g0]0x80,%f26	! %f26 = 1bfff4a7
!	Mem[0000000030041400] = 00ac654a, %l2 = 0000000000000088
	ldsba	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000000

p0_label_209:
!	Starting 10 instruction Store Burst
!	%l0 = 000000ff, %l1 = ff5dd2ff, Mem[00000000300c1408] = ff000000 000000ff
	stda	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000ff ff5dd2ff
!	%l6 = 000000000000ff00, Mem[0000000030041410] = ff00000000000000
	stxa	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000000000ff00
!	%l2 = 00000000, %l3 = 000000d9, Mem[0000000010001400] = 00000000 100a9a20
	stda	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000 000000d9
!	Mem[00000000201c0001] = 00ff1a10, %l5 = 00000000000000ff
	ldstub	[%o0+0x001],%l5		! %l5 = 00000000000000ff
!	%l3 = 00000000000000d9, Mem[0000000030181400] = 43de5aff
	stha	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 43de00d9
!	%l2 = 0000000000000000, Mem[0000000010141435] = 7262ec95
	stb	%l2,[%i5+0x035]		! Mem[0000000010141434] = 7200ec95
!	%l2 = 0000000000000000, Mem[0000000010001400] = 00000000
	stha	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	Mem[00000000300c1400] = ffffffba 1d11ffff 000000ff ff5dd2ff
!	%f0  = 5ae4ffff 00000000 00000066 18ffff00
!	%f4  = 40000000 79bf2e00 00000000 000000cc
!	%f8  = a724226d 61d05459 a724226d 61d05459
!	%f12 = 0000421f 000000ff 00000000 00000043
	stda	%f0 ,[%i3+%g0]ASI_COMMIT_S	! Block Store to 00000000300c1400
!	Mem[0000000010041400] = 1bfff4a7 92766479 ff6dbf79 34d30a10
!	%f0  = 5ae4ffff 00000000 00000066 18ffff00
!	%f4  = 40000000 79bf2e00 00000000 000000cc
!	%f8  = a724226d 61d05459 a724226d 61d05459
!	%f12 = 0000421f 000000ff 00000000 00000043
	stda	%f0 ,[%i1+%g0]ASI_BLK_PL	! Block Store to 0000000010041400
!	Mem[0000000030101400] = ffffffff, %l0 = 00000000000000ff
	swapa	[%i4+%g0]0x89,%l0	! %l0 = 00000000ffffffff

p0_label_210:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (41)
!	Mem[00000000300c1400] = ffffe45a, %l5 = 00000000000000ff
	lduha	[%i3+%g0]0x89,%l5	! %l5 = 000000000000e45a
!	Mem[00000000211c0000] = 000038a0, %l5 = 000000000000e45a, %asi = 80
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141408] = ffd25dff, %l5 = 0000000000000000
	ldsba	[%i5+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000100c1400] = cc000000, %l7 = ffffffffffffff00
	lduba	[%i3+%g0]0x80,%l7	! %l7 = 00000000000000cc
!	Mem[0000000030001410] = 00000000, %l0 = 00000000ffffffff
	lduha	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000021800180] = ffff73f0, %l7 = 00000000000000cc, %asi = 80
	lduha	[%o3+0x180]%asi,%l7	! %l7 = 000000000000ffff
!	Mem[00000000300c1400] = ffffe45a, %l4 = 00000000267c7766
	lduba	[%i3+%g0]0x89,%l4	! %l4 = 000000000000005a
!	Mem[0000000010081404] = ad921800, %l5 = 00000000ffffffff
	swap	[%i2+0x004],%l5		! %l5 = 00000000ad921800
!	Mem[0000000010101400] = 00000000 00000000 00000066 18ffff00
!	Mem[0000000010101410] = 40000000 79bf2e00 00000000 000000cc
!	Mem[0000000010101420] = a724226d 61d05459 a724226d 61d05459
!	Mem[0000000010101430] = 0000421f 000000ff 00000000 00000043
	ldda	[%i4+%g0]ASI_BLK_AIUP,%f16	! Block Load from 0000000010101400
!	Mem[0000000010081428] = a724226d, %l0 = 0000000000000000
	lduh	[%i2+0x028],%l0		! %l0 = 000000000000a724

p0_label_211:
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000ffff, Mem[0000000030141400] = 88020100
	stha	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = ffff0100
!	Mem[0000000010181408] = 00acffff, %l2 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%l6 = 000000000000ff00, Mem[0000000010141410] = ffd25dff00000000
	stxa	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000000000ff00
!	%l4 = 000000000000005a, Mem[0000000010001400] = 00000000d9000000
	stx	%l4,[%i0+%g0]		! Mem[0000000010001400] = 000000000000005a
!	%l2 = 00000000000000ff, Mem[0000000010041408] = 18ffff00
	stha	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 18ff00ff
!	%f23 = 000000cc, Mem[0000000030041400] = 00ac654a
	sta	%f23,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000cc
!	%l0 = 000000000000a724, Mem[0000000010041409] = ff00ff18
	stb	%l0,[%i1+0x009]		! Mem[0000000010041408] = ff24ff18
!	Mem[0000000010001408] = ffffffa0, %l1 = ffffffffff5dd2ff
	ldstuba	[%i0+%o4]0x88,%l1	! %l1 = 00000000000000a0
!	Mem[0000000030101410] = ffffffba, %l6 = 000000000000ff00
	swapa	[%i4+%o5]0x81,%l6	! %l6 = 00000000ffffffba
!	%l2 = 000000ff, %l3 = 000000d9, Mem[0000000010041400] = 00000000 ffffe45a
	stda	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff 000000d9

p0_label_212:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 0000006618ffff00, %f8  = a724226d 61d05459
	ldda	[%i4+%o4]0x80,%f8 	! %f8  = 00000066 18ffff00
!	Mem[00000000100c1410] = 00000000, %l4 = 000000000000005a
	ldsha	[%i3+%o5]0x88,%l4	! %l4 = 0000000000000000
!	%f6  = 00000000, %f30 = 00000000, %f7  = 000000cc
	fsubs	%f6 ,%f30,%f7 		! %f7  = 00000000
!	%l5 = 00000000ad921800, %l3 = 00000000000000d9, %l0 = 000000000000a724
	xnor	%l5,%l3,%l0		! %l0 = ffffffff526de726
!	Mem[0000000010081424] = a7f4d91b, %l3 = 00000000000000d9
	ldsw	[%i2+0x024],%l3		! %l3 = ffffffffa7f4d91b
!	Mem[00000000100c1400] = cc000000, %l1 = 00000000000000a0
	lduha	[%i3+%g0]0x80,%l1	! %l1 = 000000000000cc00
!	Mem[0000000010141408] = 0000421f, %l7 = 000000000000ffff
	lduba	[%i5+%o4]0x88,%l7	! %l7 = 000000000000001f
!	Mem[0000000030001400] = 3400551b, %l1 = 000000000000cc00
	ldsba	[%i0+%g0]0x81,%l1	! %l1 = 0000000000000034
!	Mem[0000000021800040] = ff85b900, %l4 = 0000000000000000, %asi = 80
	lduba	[%o3+0x040]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001408] = 0034ff18, %l6 = 00000000ffffffba
	ldsba	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000000

p0_label_213:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001414] = 00000000, %l7 = 000000000000001f, %asi = 80
	swapa	[%i0+0x014]%asi,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = ff000079, %l1 = 0000000000000034
	swapa	[%i3+%o4]0x80,%l1	! %l1 = 00000000ff000079
!	Mem[0000000010181410] = ffffffff, %l4 = 00000000000000ff
	swapa	[%i6+%o5]0x88,%l4	! %l4 = 00000000ffffffff
!	Mem[00000000100c1410] = 00000000, %l7 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Code Fragment 4, seed = 935262
p0_fragment_22:
!	%l0 = ffffffff526de726
	setx	0x27e1afa68fdf0b36,%g7,%l0 ! %l0 = 27e1afa68fdf0b36
!	%l1 = 00000000ff000079
	setx	0x87a88e063efa1261,%g7,%l1 ! %l1 = 87a88e063efa1261
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 27e1afa68fdf0b36
	setx	0x8ce05b5925160d9c,%g7,%l0 ! %l0 = 8ce05b5925160d9c
!	%l1 = 87a88e063efa1261
	setx	0xc2974ec65c7dffe7,%g7,%l1 ! %l1 = c2974ec65c7dffe7
p0_fragment_22_end:
!	%f20 = 40000000 79bf2e00, Mem[00000000300c1400] = 5ae4ffff 00000000
	stda	%f20,[%i3+%g0]0x81	! Mem[00000000300c1400] = 40000000 79bf2e00
!	Mem[0000000010081418] = 00000000, %l1 = c2974ec65c7dffe7
	ldstub	[%i2+0x018],%l1		! %l1 = 0000000000000000
!	%l2 = 00000000000000ff, Mem[00000000100c1410] = 00000000
	stba	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff000000
!	%f0  = 5ae4ffff 00000000, %l3 = ffffffffa7f4d91b
!	Mem[00000000100c1418] = 0000000000000000
	add	%i3,0x018,%g1
	stda	%f0,[%g1+%l3]ASI_PST8_P ! Mem[00000000100c1418] = 000000ff00000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030041400] = 000000cc ad921800
	stda	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000 00000000

p0_label_214:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 000038a0, %l7 = 0000000000000000
	ldsb	[%o2+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000010101438] = 00000000, %l3 = ffffffffa7f4d91b, %asi = 80
	ldswa	[%i4+0x038]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001408] = 0000006618ff3400, %l1 = 0000000000000000
	ldxa	[%i0+%o4]0x89,%l1	! %l1 = 0000006618ff3400
!	Mem[0000000030081408] = 000000ff, %l4 = 00000000ffffffff
	ldsba	[%i2+%o4]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010101410] = 40000000, %l2 = 00000000000000ff
	ldsha	[%i4+%o5]0x80,%l2	! %l2 = 0000000000004000
!	Mem[0000000030081410] = ffffffff, %l7 = 0000000000000000
	ldsha	[%i2+%o5]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010081400] = 4a65acff, %l5 = 00000000ad921800
	ldswa	[%i2+%g0]0x88,%l5	! %l5 = 000000004a65acff
!	%l3 = 0000000000000000, %l6 = 0000000000000000, %l1 = 0000006618ff3400
	udivx	%l3,%l6,%l1		! Div by zero, %l0 = 8ce05b5925160dc4
!	Mem[0000000010101408] = 00000066, %f6  = 00000000
	lda	[%i4+%o4]0x80,%f6 	! %f6 = 00000066
!	Mem[0000000010041400] = d9000000 ff000000, %l0 = 25160dc4, %l1 = 18ff3400
	ldda	[%i1+%g0]0x88,%l0	! %l0 = 00000000ff000000 00000000d9000000

p0_label_215:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000d9000000, %l0 = 00000000ff000000, %l1 = 00000000d9000000
	add	%l1,%l0,%l1		! %l1 = 00000001d8000000
	membar	#Sync			! Added by membar checker (42)
!	%l1 = 00000001d8000000, Mem[0000000010101400] = 00000000
	stw	%l1,[%i4+%g0]		! Mem[0000000010101400] = d8000000
!	%l1 = 00000001d8000000, Mem[0000000030181400] = 43de00d9
	stba	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = 43de0000
!	Mem[0000000010141414] = 00000000, %l4 = 00000000ffffffff
	swap	[%i5+0x014],%l4		! %l4 = 0000000000000000
!	%l0 = 00000000ff000000, Mem[00000000300c1410] = 00000040
	stha	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	%l6 = 0000000000000000, imm = fffffffffffff4cb, %l5 = 000000004a65acff
	or	%l6,-0xb35,%l5		! %l5 = fffffffffffff4cb
!	%l7 = ffffffffffffffff, Mem[00000000300c1408] = 00000066
	stha	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffff0066
!	Mem[0000000030001400] = 3400551b, %l0 = 00000000ff000000
	swapa	[%i0+%g0]0x81,%l0	! %l0 = 000000003400551b
!	%l7 = ffffffffffffffff, Mem[0000000010001410] = 10000000
	stw	%l7,[%i0+%o5]		! Mem[0000000010001410] = ffffffff
!	Code Fragment 4, seed = 756047
p0_fragment_23:
!	%l0 = 000000003400551b
	setx	0xc53a74eefc10acae,%g7,%l0 ! %l0 = c53a74eefc10acae
!	%l1 = 00000001d8000000
	setx	0x29064a7c0e315a59,%g7,%l1 ! %l1 = 29064a7c0e315a59
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c53a74eefc10acae
	setx	0x0fe2fd7f96443414,%g7,%l0 ! %l0 = 0fe2fd7f96443414
!	%l1 = 29064a7c0e315a59
	setx	0x04602ddc3e2ebcdf,%g7,%l1 ! %l1 = 04602ddc3e2ebcdf
p0_fragment_23_end:

p0_label_216:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800001] = 2cff3ad0, %l6 = 0000000000000000
	ldub	[%o3+0x001],%l6		! %l6 = 00000000000000ff
!	%l6 = 00000000000000ff, immd = fffffffffffff912, %l0  = 0fe2fd7f96443414
	mulx	%l6,-0x6ee,%l0		! %l0 = fffffffffff918ee
!	Mem[0000000030081410] = ffffffff, %l7 = ffffffffffffffff
	lduwa	[%i2+%o5]0x89,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000030101400] = ff000000, %l1 = 04602ddc3e2ebcdf
	ldsba	[%i4+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010181400] = 3400ffff, %l1 = ffffffffffffffff
	ldsba	[%i6+%g0]0x80,%l1	! %l1 = 0000000000000034
!	Mem[0000000030181400] = 0000de43, %l7 = 00000000ffffffff
	lduha	[%i6+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141400] = 0001ffff, %l0 = fffffffffff918ee
	ldsha	[%i5+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010181400] = 3400ffff, %f11 = 61d05459
	lda	[%i6+%g0]0x80,%f11	! %f11 = 3400ffff
!	%l3 = 0000000000000000, %l4 = 0000000000000000, %l2 = 0000000000004000
	subc	%l3,%l4,%l2		! %l2 = 0000000000000000
!	Mem[0000000010041408] = 18ff24ff, %l5 = fffffffffffff4cb
	lduha	[%i1+%o4]0x88,%l5	! %l5 = 00000000000024ff

p0_label_217:
!	Starting 10 instruction Store Burst
!	Mem[000000001014140c] = 79bf2edb, %l1 = 00000034, %l0 = ffffffff
	add	%i5,0x0c,%g1
	casa	[%g1]0x80,%l1,%l0	! %l0 = 0000000079bf2edb
!	%l4 = 0000000000000000, Mem[0000000010101408] = 66000000
	stha	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 66000000
!	%f5  = 79bf2e00, Mem[0000000030181408] = 00000000
	sta	%f5 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 79bf2e00
!	%l0 = 0000000079bf2edb, immd = fffffffffffffa13, %l6  = 00000000000000ff
	mulx	%l0,-0x5ed,%l6		! %l6 = fffffd2e8e175841
!	Mem[0000000030041410] = 00000000, %l6 = fffffd2e8e175841
	ldstuba	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081410] = db0000ff, %l0 = 0000000079bf2edb
	swapa	[%i2+%o5]0x88,%l0	! %l0 = 00000000db0000ff
!	%l2 = 0000000000000000, %l2 = 0000000000000000, %l2 = 0000000000000000
	xor	%l2,%l2,%l2		! %l2 = 0000000000000000
!	%f6  = 00000066 00000000, Mem[00000000100c1420] = a72422ff 61d05459, %asi = 80
	stda	%f6 ,[%i3+0x020]%asi	! Mem[00000000100c1420] = 00000066 00000000
!	%l5 = 00000000000024ff, Mem[0000000010181416] = 000000ff, %asi = 80
	stha	%l5,[%i6+0x016]%asi	! Mem[0000000010181414] = 000024ff
!	%l2 = 0000000000000000, Mem[0000000030181400] = 0000de4300000000
	stxa	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000000000000

p0_label_218:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ff0000000000ff00, %f4  = 40000000 79bf2e00
	ldda	[%i1+%o5]0x81,%f4 	! %f4  = ff000000 0000ff00
!	Mem[0000000030001410] = 00000000, %l0 = 00000000db0000ff
	ldstuba	[%i0+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = d8000000, %l5 = 00000000000024ff
	ldswa	[%i4+%g0]0x80,%l5	! %l5 = ffffffffd8000000
!	Mem[00000000300c1410] = 00000000, %l4 = 0000000000000000
	ldsha	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000211c0000] = 000038a0, %l6 = 0000000000000000, %asi = 80
	lduha	[%o2+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1408] = 00000034, %l2 = 0000000000000000
	lduwa	[%i3+%o4]0x80,%l2	! %l2 = 0000000000000034
!	Mem[0000000010141400] = ffffe4ff, %l7 = 0000000000000000
	ldsba	[%i5+%g0]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[000000001008141c] = 34d30a10, %f17 = 00000000
	lda	[%i2+0x01c]%asi,%f17	! %f17 = 34d30a10
!	Mem[0000000030181408] = 002ebf79, %l5 = ffffffffd8000000
	ldsba	[%i6+%o4]0x89,%l5	! %l5 = 0000000000000079
!	%f29 = 000000ff, %f25 = 61d05459
	fcmpes	%fcc0,%f29,%f25		! %fcc0 = 1

p0_label_219:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 00000000, %l3 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000
!	%l1 = 0000000000000034, Mem[0000000010041420] = 5954d061, %asi = 80
	stwa	%l1,[%i1+0x020]%asi	! Mem[0000000010041420] = 00000034
!	Mem[0000000030101408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1400] = cc00000000000000, %l7 = ffffffffffffffff, %l2 = 0000000000000034
	casxa	[%i3]0x80,%l7,%l2	! %l2 = cc00000000000000
!	%f29 = 000000ff, %f26 = a724226d
	fcmpes	%fcc1,%f29,%f26		! %fcc1 = 2
!	Mem[0000000010101408] = 00000066, %l0 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000066
!	Mem[0000000010181438] = 0000ffff, %l0 = 00000066, %l2 = 00000000
	add	%i6,0x38,%g1
	casa	[%g1]0x80,%l0,%l2	! %l2 = 000000000000ffff
!	Mem[00000000100c1408] = 34000000, %l1 = 0000000000000034
	ldstuba	[%i3+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041433] = ff000000, %l5 = 0000000000000079
	ldstuba	[%i1+0x033]%asi,%l5	! %l5 = 0000000000000000
!	%l2 = 0000ffff, %l3 = 00000000, Mem[0000000030081400] = ff5dd2ff 00000000
	stda	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000ffff 00000000

p0_label_220:
!	Starting 10 instruction Load Burst
!	%f6  = 00000066, %f31 = 00000043
	fcmpes	%fcc2,%f6 ,%f31		! %fcc2 = 2
!	Mem[0000000010081408] = 00000000000000ff, %l5 = 0000000000000000
	ldxa	[%i2+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081410] = 79bf2edb, %l2 = 000000000000ffff
	ldsha	[%i2+%o5]0x88,%l2	! %l2 = 0000000000002edb
!	Mem[0000000030141410] = 00000000, %l2 = 0000000000002edb
	ldsba	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101400] = 000000d8, %l1 = 0000000000000000
	lduba	[%i4+%g0]0x88,%l1	! %l1 = 00000000000000d8
!	%f25 = 61d05459, %f15 = 00000043, %f8  = 00000066
	fmuls	%f25,%f15,%f8 		! tt=0x22, %l0 = 0000000000000088
!	Mem[0000000010141400] = ffe4ffff, %l7 = ffffffffffffffff
	lduwa	[%i5+%g0]0x80,%l7	! %l7 = 00000000ffe4ffff
!	Mem[0000000010041410] = 002ebf79, %f0  = 5ae4ffff
	lda	[%i1+%o5]0x80,%f0 	! %f0 = 002ebf79
!	Mem[0000000010141410] = 00ff0000, %l7 = 00000000ffe4ffff
	ldsba	[%i5+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = 000000ff, %l4 = 0000000000000000
	ldsha	[%i2+%o4]0x88,%l4	! %l4 = 00000000000000ff

p0_label_221:
!	Starting 10 instruction Store Burst
!	%f6  = 00000066, Mem[0000000030001400] = 000000ff
	sta	%f6 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000066
!	%f19 = 18ffff00, Mem[0000000010141410] = 0000ff00
	sta	%f19,[%i5+%o5]0x88	! Mem[0000000010141410] = 18ffff00
!	%l1 = 00000000000000d8, Mem[00000000211c0000] = 000038a0, %asi = 80
	stha	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00d838a0
!	%l0 = 0000000000000088, imm = fffffffffffff9ec, %l4 = 00000000000000ff
	andn	%l0,-0x614,%l4		! %l4 = 0000000000000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030101410] = 0000ff00 0000ffff
	stda	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000 00000000
!	%l7 = 0000000000000000, Mem[0000000010141410] = 00ffff18ffffffff
	stxa	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010141408] = db2ebf790000421f
	stxa	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010041410] = 79bf2e00
	stwa	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010081408] = ff000000 00000000
	stda	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000 00000000
!	%f0  = 002ebf79, Mem[0000000030141400] = ffff0100
	sta	%f0 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 002ebf79

p0_label_222:
!	Starting 10 instruction Load Burst
!	%f26 = a724226d, %f22 = 00000000, %f24 = a724226d
	fmuls	%f26,%f22,%f24		! %f24 = 80000000
!	Mem[00000000201c0000] = 00ff1a10, %l4 = 0000000000000000, %asi = 80
	ldsba	[%o0+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = 00000000ffffffff, %l3 = 0000000000000000
	ldxa	[%i2+%o5]0x89,%l3	! %l3 = 00000000ffffffff
!	Mem[00000000100c1405] = 00000000, %l2 = 0000000000000000, %asi = 80
	ldsba	[%i3+0x005]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181400] = 3400ffff, %l2 = 0000000000000000
	ldswa	[%i6+%g0]0x80,%l2	! %l2 = 000000003400ffff
!	Mem[0000000010181430] = 000000ad, %l3 = 00000000ffffffff
	ldsh	[%i6+0x030],%l3		! %l3 = 0000000000000000
!	Mem[0000000030001410] = cc000000 000000ff, %l2 = 3400ffff, %l3 = 00000000
	ldda	[%i0+%o5]0x89,%l2	! %l2 = 00000000000000ff 00000000cc000000
!	Mem[0000000010181400] = 00000000ffff0034, %f30 = 00000000 00000043
	ldda	[%i6+%g0]0x88,%f30	! %f30 = 00000000 ffff0034
!	Mem[00000000211c0000] = 00d838a0, %l1 = 00000000000000d8
	lduh	[%o2+%g0],%l1		! %l1 = 00000000000000d8
!	Mem[0000000030181410] = 00000000, %l7 = 0000000000000000
	lduba	[%i6+%o5]0x89,%l7	! %l7 = 0000000000000000

p0_label_223:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000d8, Mem[0000000030001408] = 18ff3400
	stha	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 18ff00d8
!	%f19 = 18ffff00, Mem[0000000010141410] = 00000000
	sta	%f19,[%i5+%o5]0x88	! Mem[0000000010141410] = 18ffff00
!	%f15 = 00000043, %f9  = 18ffff00, %f11 = 3400ffff
	fdivs	%f15,%f9 ,%f11		! tt=0x22, %l0 = 00000000000000aa
!	%l0 = 000000aa, %l1 = 000000d8, Mem[0000000010181418] = 00000000 1b5555a3, %asi = 80
	stda	%l0,[%i6+0x018]%asi	! Mem[0000000010181418] = 000000aa 000000d8
!	%f21 = 79bf2e00, Mem[000000001014143c] = 00000043
	st	%f21,[%i5+0x03c]	! Mem[000000001014143c] = 79bf2e00
!	Mem[0000000010141400] = ffffe4ff, %l1 = 00000000000000d8
	swapa	[%i5+%g0]0x88,%l1	! %l1 = 00000000ffffe4ff
!	Mem[0000000010181410] = ff240000 000000ff, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 00000000000000ff 00000000ff240000
!	%f2  = 00000066, Mem[0000000030041410] = ff000000
	sta	%f2 ,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000066
!	Mem[0000000020800040] = 0000b270, %l6 = 0000000000000000
	ldstuba	[%o1+0x040]%asi,%l6	! %l6 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010001400] = 000000000000005a
	stxa	%l7,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000000000000000

p0_label_224:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ffffffff, %l5 = 00000000ff240000
	lduha	[%i1+%o4]0x89,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010001401] = 00000000, %l6 = 0000000000000000
	ldsb	[%i0+0x001],%l6		! %l6 = 0000000000000000
!	Mem[00000000100c1408] = 340000ff, %f13 = 000000ff
	lda	[%i3+%o4]0x88,%f13	! %f13 = 340000ff
!	Mem[0000000030041410] = 00000066, %l2 = 00000000000000ff
	lduwa	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000066
!	%l7 = 0000000000000000, immd = fffffcc9, %y  = 00000000
	sdiv	%l7,-0x337,%l5		! %l5 = 0000000000000000
	mov	%l0,%y			! %y = 000000aa
!	Mem[0000000010101408] = 00000000, %l0 = 00000000000000aa
	lduba	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	%f13 = 340000ff, %f19 = 18ffff00, %f19 = 18ffff00
	fadds	%f13,%f19,%f19		! %f19 = 340000ff
!	Mem[0000000010181400] = 00000000ffff0034, %l3 = 00000000cc000000
	ldxa	[%i6+%g0]0x88,%l3	! %l3 = 00000000ffff0034
!	Mem[0000000010081410] = db2ebf79, %l1 = 00000000ffffe4ff
	lduwa	[%i2+%o5]0x80,%l1	! %l1 = 00000000db2ebf79
!	%f3  = 18ffff00, %f13 = 340000ff
	fcmpes	%fcc0,%f3 ,%f13		! %fcc0 = 1

p0_label_225:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 40000000, %l6 = 0000000000000000
	swapa	[%i4+%o5]0x80,%l6	! %l6 = 0000000040000000
!	%f16 = 00000000 34d30a10, Mem[0000000010041410] = 00000000 40000000
	stda	%f16,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000 34d30a10
!	Mem[0000000030141400] = 79bf2e00, %l3 = 00000000ffff0034
	swapa	[%i5+%g0]0x89,%l3	! %l3 = 0000000079bf2e00
!	Mem[0000000010001434] = 11ff2c35, %l6 = 0000000040000000
	swap	[%i0+0x034],%l6		! %l6 = 0000000011ff2c35
!	Mem[00000000300c1400] = 40000000 79bf2e00 ffff0066 18ffff00
!	%f16 = 00000000 34d30a10 00000066 340000ff
!	%f20 = 40000000 79bf2e00 00000000 000000cc
!	%f24 = 80000000 61d05459 a724226d 61d05459
!	%f28 = 0000421f 000000ff 00000000 ffff0034
	stda	%f16,[%i3+%g0]ASI_BLK_AIUSL	! Block Store to 00000000300c1400
!	Mem[00000000201c0001] = 00ff1a10, %l4 = 00000000000000ff
	ldstub	[%o0+0x001],%l4		! %l4 = 00000000000000ff
!	%f10 = a724226d, Mem[0000000010141408] = 00000000
	st	%f10,[%i5+%o4]		! Mem[0000000010141408] = a724226d
!	Mem[0000000030081408] = 000000ff, %l6 = 0000000011ff2c35
	ldstuba	[%i2+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001408] = ffffffff, %l3 = 0000000079bf2e00
	swapa	[%i0+%o4]0x80,%l3	! %l3 = 00000000ffffffff
!	%f22 = 00000000 000000cc, %l6 = 00000000000000ff
!	Mem[0000000030081430] = ffd25dff00000000
	add	%i2,0x030,%g1
	stda	%f22,[%g1+%l6]ASI_PST16_S ! Mem[0000000030081430] = 00000000000000cc

p0_label_226:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000000, %l3 = 00000000ffffffff
	ldswa	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081408] = ba000000000000ff, %l6 = 00000000000000ff
	ldxa	[%i2+%o4]0x89,%l6	! %l6 = ba000000000000ff
!	Mem[0000000010181430] = 000000ad 5e610975, %l4 = 000000ff, %l5 = 00000000, %asi = 80
	ldda	[%i6+0x030]%asi,%l4	! %l4 = 00000000000000ad 000000005e610975
!	Mem[0000000010181408] = ffffac00 ff000000, %l4 = 000000ad, %l5 = 5e610975
	ldda	[%i6+%o4]0x80,%l4	! %l4 = 00000000ffffac00 00000000ff000000
!	Mem[0000000030101408] = ff000000, %l3 = 0000000000000000
	ldsha	[%i4+%o4]0x81,%l3	! %l3 = ffffffffffffff00
	membar	#Sync			! Added by membar checker (43)
!	Mem[00000000100c1408] = ff000034, %f10 = a724226d
	lda	[%i3+%o4]0x80,%f10	! %f10 = ff000034
!	Mem[0000000010041400] = 000000ff 000000d9, %l2 = 00000066, %l3 = ffffff00
	ldd	[%i1+%g0],%l2		! %l2 = 00000000000000ff 00000000000000d9
!	Mem[0000000010181410] = 000000ff, %l3 = 00000000000000d9
	lduba	[%i6+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000211c0000] = 00d838a0, %l7 = 0000000000000000, %asi = 80
	lduba	[%o2+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = 0000000000000000, %l6 = ba000000000000ff
	ldxa	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000000

p0_label_227:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 0000ffff, %l5 = 00000000ff000000
	ldstuba	[%i2+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000030141408] = ffd25dff 00000000
	stda	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000ff 000000ff
!	Mem[0000000010001400] = 00000000 00000000 79bf2e00 00000000
!	%f16 = 00000000 34d30a10 00000066 340000ff
!	%f20 = 40000000 79bf2e00 00000000 000000cc
!	%f24 = 80000000 61d05459 a724226d 61d05459
!	%f28 = 0000421f 000000ff 00000000 ffff0034
	stda	%f16,[%i0+%g0]ASI_BLK_AIUP	! Block Store to 0000000010001400
!	Mem[0000000030141400] = 3400ffff, %l0 = 0000000000000000
	swapa	[%i5+%g0]0x81,%l0	! %l0 = 000000003400ffff
!	Mem[0000000030041410] = 00000066, %l3 = 00000000000000ff
	ldstuba	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000000
!	%l1 = 00000000db2ebf79, Mem[0000000010081410] = db2ebf7900000000, %asi = 80
	stxa	%l1,[%i2+0x010]%asi	! Mem[0000000010081410] = 00000000db2ebf79
!	Mem[0000000030001408] = d800ff18, %l1 = 00000000db2ebf79
	swapa	[%i0+%o4]0x81,%l1	! %l1 = 00000000d800ff18
!	%l1 = 00000000d800ff18, Mem[0000000010041408] = 18ff24ff
	stha	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 18ffff18
!	%f10 = ff000034, Mem[0000000030181400] = 00000000
	sta	%f10,[%i6+%g0]0x89	! Mem[0000000030181400] = ff000034
!	Mem[0000000010081430] = ffd25dff, %l5 = 00000000000000ff
	swap	[%i2+0x030],%l5		! %l5 = 00000000ffd25dff

p0_label_228:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 00000000, %l0 = 000000003400ffff
	ldsba	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0000] = 00ff1a10, %l0 = 0000000000000000
	lduh	[%o0+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010141410] = 00ffff18, %l2 = 00000000000000ff
	ldswa	[%i5+%o5]0x80,%l2	! %l2 = 0000000000ffff18
!	Mem[0000000021800040] = ff85b900, %l3 = 0000000000000000
	ldub	[%o3+0x040],%l3		! %l3 = 00000000000000ff
!	Mem[0000000030001410] = 000000ff, %l2 = 0000000000ffff18
	ldsba	[%i0+%o5]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000201c0000] = 00ff1a10, %l0 = 00000000000000ff, %asi = 80
	lduba	[%o0+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181408] = ffffac00ff000000, %f10 = ff000034 3400ffff
	ldda	[%i6+%o4]0x80,%f10	! %f10 = ffffac00 ff000000
!	Mem[00000000218000c1] = 3e432960, %l2 = ffffffffffffffff
	ldstub	[%o3+0x0c1],%l2		! %l2 = 0000000000000043
!	Mem[0000000021800180] = ffff73f0, %l7 = 0000000000000000, %asi = 80
	ldsha	[%o3+0x180]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181410] = 000000ff, %l4 = 00000000ffffac00
	ldsba	[%i6+%o5]0x88,%l4	! %l4 = ffffffffffffffff

p0_label_229:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (44)
!	Mem[0000000010001410] = 40000000, %l6 = 0000000000000000
	swapa	[%i0+%o5]0x80,%l6	! %l6 = 0000000040000000
!	%f5  = 0000ff00, Mem[0000000010101408] = 00000000
	sta	%f5 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000ff00
!	%l2 = 00000043, %l3 = 000000ff, Mem[0000000030101408] = 000000ff 00000000
	stda	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000043 000000ff
!	%l2 = 00000043, %l3 = 000000ff, Mem[0000000010141428] = 267c7766 100d421f, %asi = 80
	stda	%l2,[%i5+0x028]%asi	! Mem[0000000010141428] = 00000043 000000ff
!	%l2 = 0000000000000043, Mem[0000000021800040] = ff85b900
	sth	%l2,[%o3+0x040]		! Mem[0000000021800040] = 0043b900
!	%l5 = 00000000ffd25dff, %l6 = 0000000040000000, %l6  = 0000000040000000
	mulx	%l5,%l6,%l6		! %l6 = 3ff4977fc0000000
!	Mem[00000000100c1410] = ff00000000000000, %f18 = 00000066 340000ff
	ldda	[%i3+%o5]0x80,%f18	! %f18 = ff000000 00000000
!	Mem[0000000010001424] = 61d05459, %l3 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x024]%asi,%l3	! %l3 = 0000000061d05459
!	%l3 = 0000000061d05459, Mem[00000000211c0000] = 00d838a0, %asi = 80
	stha	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = 545938a0
!	%l5 = 00000000ffd25dff, Mem[0000000010081400] = ffac654a
	stha	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 5dff654a

p0_label_230:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001416] = 79bf2e00, %l3 = 0000000061d05459
	lduh	[%i0+0x016],%l3		! %l3 = 0000000000002e00
!	Mem[0000000021800040] = 0043b900, %l2 = 0000000000000043, %asi = 80
	lduha	[%o3+0x040]%asi,%l2	! %l2 = 0000000000000043
!	Mem[0000000010141408] = a724226d00000000, %l5 = 00000000ffd25dff
	ldxa	[%i5+%o4]0x80,%l5	! %l5 = a724226d00000000
!	%f15 = 00000043, %f16 = 00000000
	fitos	%f15,%f16		! %f16 = 42860000
!	Mem[0000000021800140] = 843689c0, %l5 = a724226d00000000, %asi = 80
	lduba	[%o3+0x140]%asi,%l5	! %l5 = 0000000000000084
!	Mem[0000000010181400] = 00000000ffff0034, %l3 = 0000000000002e00
	ldxa	[%i6+%g0]0x88,%l3	! %l3 = 00000000ffff0034
!	Mem[0000000010001410] = 0000000079bf2e00, %l5 = 0000000000000084
	ldx	[%i0+%o5],%l5		! %l5 = 0000000079bf2e00
!	Mem[0000000010081408] = 00000000 00000000, %l2 = 00000043, %l3 = ffff0034
	ldda	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010141400] = d800000000000000, %f16 = 42860000 34d30a10
	ldda	[%i5+%g0]0x80,%f16	! %f16 = d8000000 00000000
!	Mem[00000000300c1400] = 100ad334 00000000, %l6 = c0000000, %l7 = ffffffff
	ldda	[%i3+%g0]0x81,%l6	! %l6 = 00000000100ad334 0000000000000000

p0_label_231:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 0000ffff, %l0 = 0000000000000000
	ldstuba	[%i2+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	%f2  = 00000066 18ffff00, Mem[0000000030141408] = 000000ff 000000ff
	stda	%f2 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000066 18ffff00
!	Mem[0000000010001410] = 00000000, %l5 = 0000000079bf2e00
	swapa	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010141410] = 00ffff18
	stha	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000ff18
!	%l3 = 0000000000000000, Mem[0000000010001417] = 79bf2e00, %asi = 80
	stba	%l3,[%i0+0x017]%asi	! Mem[0000000010001414] = 79bf2e00
!	Mem[0000000010141408] = 6d2224a7, %l5 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l5	! %l5 = 00000000000000a7
!	%f13 = 340000ff, Mem[0000000030181410] = 00000000
	sta	%f13,[%i6+%o5]0x81	! Mem[0000000030181410] = 340000ff
!	%l3 = 0000000000000000, Mem[0000000010081400] = 5dff654affffffff
	stxa	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000000000
!	Mem[00000000300c1400] = 34d30a10, %l0 = 00000000000000ff
	swapa	[%i3+%g0]0x89,%l0	! %l0 = 0000000034d30a10
!	%f0  = 002ebf79, Mem[0000000030181410] = ff000034
	sta	%f0 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 002ebf79

p0_label_232:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 100ad334, %l5 = 00000000000000a7
	lduwa	[%i1+%o5]0x80,%l5	! %l5 = 00000000100ad334
!	Mem[0000000010081410] = 00000000db2ebf79, %l0 = 0000000034d30a10
	ldxa	[%i2+%o5]0x80,%l0	! %l0 = 00000000db2ebf79
!	Mem[00000000201c0000] = 00ff1a10, %l6 = 00000000100ad334, %asi = 80
	ldsha	[%o0+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001408] = 66000000, %l4 = ffffffffffffffff
	lduba	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l7 = 0000000000000000
	lduwa	[%i5+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181400] = 00000000 ff000034, %l2 = 00000000, %l3 = 00000000
	ldda	[%i6+%g0]0x89,%l2	! %l2 = 00000000ff000034 0000000000000000
!	Mem[0000000030101400] = 000000ff, %l0 = 00000000db2ebf79
	lduba	[%i4+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041408] = 18ffff18, %l0 = 00000000000000ff
	lduba	[%i1+%o4]0x88,%l0	! %l0 = 0000000000000018
!	Mem[0000000030141408] = 00000066, %l2 = 00000000ff000034
	ldswa	[%i5+%o4]0x81,%l2	! %l2 = 0000000000000066
!	Mem[0000000030101400] = ff000000, %l4 = 0000000000000000
	lduwa	[%i4+%g0]0x81,%l4	! %l4 = 00000000ff000000

p0_label_233:
!	Starting 10 instruction Store Burst
!	%f18 = ff000000 00000000, %l5 = 00000000100ad334
!	Mem[0000000030181430] = 2550c44ed3340000
	add	%i6,0x030,%g1
	stda	%f18,[%g1+%l5]ASI_PST16_SL ! Mem[0000000030181430] = 2550c44e00000000
!	%f18 = ff000000, Mem[0000000010181408] = 00acffff
	sta	%f18,[%i6+%o4]0x88	! Mem[0000000010181408] = ff000000
!	%l3 = 0000000000000000, Mem[0000000030101410] = 00000000
	stba	%l3,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	%l6 = 00000000000000ff, Mem[0000000010001408] = 00000066340000ff
	stxa	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000000000ff
!	%l0 = 0000000000000018, Mem[0000000010001408] = 00000000, %asi = 80
	stwa	%l0,[%i0+0x008]%asi	! Mem[0000000010001408] = 00000018
!	Mem[0000000010041420] = 000000346d2224a7, %l1 = 00000000d800ff18, %l6 = 00000000000000ff
	add	%i1,0x20,%g1
	casxa	[%g1]0x80,%l1,%l6	! %l6 = 000000346d2224a7
!	Mem[00000000100c1410] = ff000000, %l7 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l7	! %l7 = 00000000ff000000
!	%f31 = ffff0034, Mem[00000000100c1400] = cc000000
	st	%f31,[%i3+%g0]		! Mem[00000000100c1400] = ffff0034
!	%l3 = 0000000000000000, Mem[0000000030181410] = 79bf2e00
	stha	%l3,[%i6+%o5]0x81	! Mem[0000000030181410] = 00002e00
!	%l6 = 6d2224a7, %l7 = ff000000, Mem[0000000010181408] = ff000000 000000ff
	stda	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 6d2224a7 ff000000

p0_label_234:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001428] = a724226d61d05459, %l5 = 00000000100ad334, %asi = 80
	ldxa	[%i0+0x028]%asi,%l5	! %l5 = a724226d61d05459
!	Mem[0000000010101408] = 0000ff00, %l1 = 00000000d800ff18
	lduba	[%i4+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001400] = 66000000, %l2 = 0000000000000066
	swapa	[%i0+%g0]0x81,%l2	! %l2 = 0000000066000000
!	Mem[0000000010041400] = 000000ff000000d9, %l2 = 0000000066000000
	ldxa	[%i1+%g0]0x80,%l2	! %l2 = 000000ff000000d9
!	Mem[0000000010001408] = 00000018000000ff, %f20 = 40000000 79bf2e00, %asi = 80
	ldda	[%i0+0x008]%asi,%f20	! %f20 = 00000018 000000ff
!	Mem[00000000201c0000] = 00ff1a10, %l1 = 0000000000000000
	ldsb	[%o0+%g0],%l1		! %l1 = 0000000000000000
!	Mem[0000000010041424] = 6d2224a7, %l1 = 0000000000000000, %asi = 80
	lduwa	[%i1+0x024]%asi,%l1	! %l1 = 000000006d2224a7
!	Mem[0000000010041400] = 000000ff, %l4 = 00000000ff000000
	lduba	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001408] = 18000000, %f30 = 00000000
	lda	[%i0+%o4]0x88,%f30	! %f30 = 18000000
!	Mem[0000000030181410] = 002e0000, %l7 = 00000000ff000000
	lduba	[%i6+%o5]0x89,%l7	! %l7 = 0000000000000000

p0_label_235:
!	Starting 10 instruction Store Burst
!	%l1 = 000000006d2224a7, Mem[0000000010181400] = ffff0034
	stba	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = ffff00a7
!	%l2 = 000000ff000000d9, Mem[0000000010141410] = 0000ff1800000000
	stxa	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000ff000000d9
!	%l2 = 000000ff000000d9, Mem[0000000010141422] = 000000ff, %asi = 80
	stha	%l2,[%i5+0x022]%asi	! Mem[0000000010141420] = 000000d9
!	Mem[0000000030001400] = 66000000, %l4 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l4	! %l4 = 0000000066000000
!	%l6 = 6d2224a7, %l7 = 00000000, Mem[0000000030141410] = 00000000 00000000
	stda	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 6d2224a7 00000000
!	Mem[0000000010001410] = 79bf2e00, %l2 = 000000ff000000d9
	ldstuba	[%i0+%o5]0x80,%l2	! %l2 = 0000000000000079
!	Mem[0000000010041408] = 18ffff18, %l0 = 0000000000000018
	swap	[%i1+%o4],%l0		! %l0 = 0000000018ffff18
!	Mem[0000000010041400] = 000000ff 000000d9 00000018 66000000
!	%f16 = d8000000 00000000 ff000000 00000000
!	%f20 = 00000018 000000ff 00000000 000000cc
!	%f24 = 80000000 61d05459 a724226d 61d05459
!	%f28 = 0000421f 000000ff 18000000 ffff0034
	stda	%f16,[%i1+%g0]ASI_COMMIT_P	! Block Store to 0000000010041400
!	%l5 = a724226d61d05459, Mem[0000000010101410] = 00000000
	stba	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 59000000
!	%f6  = 00000066 00000000, %l6 = 000000346d2224a7
!	Mem[00000000100c1408] = ff00003400000000
	add	%i3,0x008,%g1
	stda	%f6,[%g1+%l6]ASI_PST32_P ! Mem[00000000100c1408] = 0000006600000000

p0_label_236:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ffff0034, %l7 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l7	! %l7 = 00000000000000ff
	membar	#Sync			! Added by membar checker (45)
!	Mem[0000000010081400] = 00000000 00000000 00000000 00000000
!	Mem[0000000010081410] = 00000000 db2ebf79 ff000000 34d30a10
!	Mem[0000000010081420] = 79647692 a7f4d91b a724226d 61d05459
!	Mem[0000000010081430] = 000000ff 00000000 cf14ffa0 ffffa0ff
	ldda	[%i2+%g0]ASI_BLK_AIUP,%f16	! Block Load from 0000000010081400
!	Mem[0000000010041400] = 000000d8, %l5 = a724226d61d05459
	ldsba	[%i1+%g0]0x88,%l5	! %l5 = ffffffffffffffd8
!	Mem[0000000030181410] = 00002e00, %l2 = 0000000000000079
	ldswa	[%i6+%o5]0x81,%l2	! %l2 = 0000000000002e00
!	Mem[0000000010041438] = 18000000 ffff0034, %l6 = 6d2224a7, %l7 = 000000ff
	ldd	[%i1+0x038],%l6		! %l6 = 0000000018000000 00000000ffff0034
!	Mem[0000000010141410] = ff000000, %l4 = 0000000066000000
	ldsha	[%i5+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1408] = 00000066340000ff, %f14 = 00000000 00000043
	ldda	[%i3+%o4]0x89,%f14	! %f14 = 00000066 340000ff
!	%f2  = 00000066, %f14 = 00000066
	fcmpes	%fcc0,%f2 ,%f14		! %fcc0 = 0
!	Code Fragment 4, seed = 670853
p0_fragment_24:
!	%l0 = 0000000018ffff18
	setx	0x54311826368228fe,%g7,%l0 ! %l0 = 54311826368228fe
!	%l1 = 000000006d2224a7
	setx	0xc565447438dc65a9,%g7,%l1 ! %l1 = c565447438dc65a9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 54311826368228fe
	setx	0xa5125955665f9e64,%g7,%l0 ! %l0 = a5125955665f9e64
!	%l1 = c565447438dc65a9
	setx	0xca7dd21fc778562f,%g7,%l1 ! %l1 = ca7dd21fc778562f
p0_fragment_24_end:
!	Mem[0000000030001400] = 00000000, %l1 = ca7dd21fc778562f
	lduha	[%i0+%g0]0x81,%l1	! %l1 = 0000000000000000

p0_label_237:
!	Starting 10 instruction Store Burst
!	%f6  = 00000066 00000000, Mem[0000000030081408] = ff000000 000000ba
	stda	%f6 ,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000066 00000000
!	Mem[0000000030141408] = 00000066, %l3 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181410] = 00002e00, %l5 = 00000000ffffffd8
	swapa	[%i6+%o5]0x81,%l5	! %l5 = 0000000000002e00
!	Mem[0000000030181408] = 002ebf79, %l5 = 0000000000002e00
	swapa	[%i6+%o4]0x89,%l5	! %l5 = 00000000002ebf79
!	Mem[0000000010101400] = d8000000, %l5 = 00000000002ebf79
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 00000000000000d8
!	%l1 = 0000000000000000, Mem[0000000010101408] = 00ff0000
	stwa	%l1,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	Mem[00000000201c0001] = 00ff1a10, %l0 = a5125955665f9e64
	ldstuba	[%o0+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	%l2 = 0000000000002e00, Mem[0000000030001408] = db2ebf79
	stwa	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 00002e00
!	%l0 = 00000000000000ff, Mem[00000000300c1408] = 340000ff
	stwa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff
!	%l0 = 00000000000000ff, Mem[0000000010141400] = d8000000
	stwa	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000ff

p0_label_238:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 545938a0, %l6 = 0000000018000000, %asi = 80
	ldsha	[%o2+0x000]%asi,%l6	! %l6 = 0000000000005459
!	Mem[0000000030141400] = 0000000000000000, %l4 = 0000000000000000
	ldxa	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l6 = 0000000000005459
	ldswa	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101410] = 00000000 00000000, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i4+%o5]0x81,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[00000000300c1410] = 002ebf79, %l1 = 0000000000000000
	ldsba	[%i3+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141408] = ff000066, %l1 = 0000000000000000
	lduwa	[%i5+%o4]0x81,%l1	! %l1 = 00000000ff000066
!	Mem[0000000010081410] = 00000000, %l6 = 0000000000000000
	ldsha	[%i2+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000201c0001] = 00ff1a10, %l7 = 00000000ffff0034
	ldsb	[%o0+0x001],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010041438] = 18000000, %l4 = 0000000000000000, %asi = 80
	lduha	[%i1+0x038]%asi,%l4	! %l4 = 0000000000001800
!	Mem[00000000201c0001] = 00ff1a10, %l3 = 0000000000000000
	ldsb	[%o0+0x001],%l3		! %l3 = ffffffffffffffff

p0_label_239:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = ff000000, %l3 = ffffffffffffffff
	ldstuba	[%i4+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	%l1 = 00000000ff000066, Mem[0000000020800040] = ff00b270
	stb	%l1,[%o1+0x040]		! Mem[0000000020800040] = 6600b270
!	%l5 = 00000000000000d8, Mem[0000000030001400] = 0000000000000000
	stxa	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000000000d8
!	%f11 = ff000000, Mem[0000000030181400] = 340000ff
	sta	%f11,[%i6+%g0]0x81	! Mem[0000000030181400] = ff000000
!	Mem[0000000010141400] = 000000ff, %l3 = 00000000000000ff
	ldstuba	[%i5+%g0]0x80,%l3	! %l3 = 0000000000000000
!	%l4 = 0000000000001800, Mem[0000000010001404] = 34d30a10
	stw	%l4,[%i0+0x004]		! Mem[0000000010001404] = 00001800
!	%l0 = 0000000000000000, Mem[0000000030101400] = ff000000
	stha	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	%l1 = 00000000ff000066, Mem[0000000030101400] = 00000000
	stwa	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = ff000066
!	%f16 = 00000000, %f11 = ff000000, %f5  = 0000ff00
	fdivs	%f16,%f11,%f5 		! %f5  = 80000000
!	Mem[0000000010101408] = 00000000, %l7 = 00000000ffffffff, %asi = 80
	swapa	[%i4+0x008]%asi,%l7	! %l7 = 0000000000000000

p0_label_240:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 002e0000, %l2 = 0000000000002e00
	ldswa	[%i0+%o4]0x89,%l2	! %l2 = 00000000002e0000
	membar	#Sync			! Added by membar checker (46)
!	%l4 = 0000000000001800, Mem[0000000010081410] = 00000000
	stb	%l4,[%i2+%o5]		! Mem[0000000010081410] = 00000000
!	Mem[0000000010181400] = a700ffff, %l7 = 0000000000000000
	lduwa	[%i6+%g0]0x80,%l7	! %l7 = 00000000a700ffff
!	Mem[0000000030141410] = 6d2224a7, %l4 = 0000000000001800
	ldswa	[%i5+%o5]0x81,%l4	! %l4 = 000000006d2224a7
!	Mem[0000000030141400] = 00000000, %l1 = 00000000ff000066
	lduha	[%i5+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[000000001010142c] = 61d05459, %l4 = 000000006d2224a7, %asi = 80
	lduha	[%i4+0x02c]%asi,%l4	! %l4 = 00000000000061d0
!	Mem[00000000100c1410] = 00000000, %l6 = 0000000000000000
	lduba	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = 002e0000, %l3 = 0000000000000000
	lduha	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181408] = a724226d 000000ff, %l4 = 000061d0, %l5 = 000000d8
	ldda	[%i6+%o4]0x80,%l4	! %l4 = 00000000a724226d 00000000000000ff
!	Mem[00000000100c1410] = 0000000000000000, %f6  = 00000066 00000000
	ldda	[%i3+%o5]0x88,%f6 	! %f6  = 00000000 00000000

p0_label_241:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081429] = a724226d, %l4 = 00000000a724226d
	ldstub	[%i2+0x029],%l4		! %l4 = 0000000000000024
!	%l4 = 00000024, %l5 = 000000ff, Mem[0000000030041408] = ffffffff db000000
	stda	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000024 000000ff
!	%l3 = 0000000000000000, Mem[00000000100c140b] = 00000066
	stb	%l3,[%i3+0x00b]		! Mem[00000000100c1408] = 00000000
!	Mem[0000000010081437] = 00000000, %l7 = 00000000a700ffff
	ldstub	[%i2+0x037],%l7		! %l7 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010001438] = 00000000
	stw	%l6,[%i0+0x038]		! Mem[0000000010001438] = 00000000
!	%f10 = ffffac00 ff000000, Mem[0000000010181410] = ff000000 000024ff
	stda	%f10,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffac00 ff000000
!	%l6 = 00000000, %l7 = 00000000, Mem[00000000100c1408] = 00000000 00000000
	stda	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 00000000
!	Code Fragment 3, seed = 315585
p0_fragment_25:
!	%l0 = 0000000000000000
	setx	0xac6f7e383b22831e,%g7,%l0 ! %l0 = ac6f7e383b22831e
!	%l1 = 0000000000000000
	setx	0x55ddb9bbe63025c9,%g7,%l1 ! %l1 = 55ddb9bbe63025c9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ac6f7e383b22831e
	setx	0x0d402796ee81e484,%g7,%l0 ! %l0 = 0d402796ee81e484
!	%l1 = 55ddb9bbe63025c9
	setx	0xaa109167381a424f,%g7,%l1 ! %l1 = aa109167381a424f
p0_fragment_25_end:
!	%l5 = 00000000000000ff, Mem[0000000010101428] = a724226d61d05459
	stx	%l5,[%i4+0x028]		! Mem[0000000010101428] = 00000000000000ff
!	%l5 = 00000000000000ff, %l4 = 0000000000000024, %l7 = 0000000000000000
	andn	%l5,%l4,%l7		! %l7 = 00000000000000db

p0_label_242:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ffffffff, %l6 = 0000000000000000
	lduwa	[%i4+%o4]0x80,%l6	! %l6 = 00000000ffffffff
!	Mem[00000000100c1428] = ffd25dff100d421f, %l3 = 0000000000000000
	ldx	[%i3+0x028],%l3		! %l3 = ffd25dff100d421f
!	Mem[0000000030001410] = 000000ff, %l0 = 0d402796ee81e484
	ldsha	[%i0+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1424] = 00000000, %l0 = 00000000000000ff
	lduw	[%i3+0x024],%l0		! %l0 = 0000000000000000
!	Mem[0000000010141410] = ff000000, %l1 = aa109167381a424f
	lduwa	[%i5+%o5]0x88,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010181428] = 000000ff, %l6 = 00000000ffffffff
	lduw	[%i6+0x028],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010041410] = 00000018000000ff, %l3 = ffd25dff100d421f
	ldxa	[%i1+%o5]0x80,%l3	! %l3 = 00000018000000ff
!	Mem[0000000030181400] = ff000000 00000000 002e0000 000000ff
!	Mem[0000000030181410] = ffffffd8 00000000 303020bf aaecd5f7
!	Mem[0000000030181420] = e9b25066 b8a8ee42 00f12a00 ff01ffff
!	Mem[0000000030181430] = 2550c44e 00000000 4ba90346 900a6200
	ldda	[%i6+%g0]ASI_BLK_AIUSL,%f0 	! Block Load from 0000000030181400
!	Mem[00000000201c0000] = 00ff1a10, %l7 = 00000000000000db, %asi = 80
	lduha	[%o0+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001438] = 00000000, %l6 = 00000000000000ff
	ldsb	[%i0+0x038],%l6		! %l6 = 0000000000000000

p0_label_243:
!	Starting 10 instruction Store Burst
!	%f16 = 00000000 00000000, %l2 = 00000000002e0000
!	Mem[0000000010141408] = ff24226d00000000
	add	%i5,0x008,%g1
	stda	%f16,[%g1+%l2]ASI_PST32_P ! Mem[0000000010141408] = ff24226d00000000
!	%l6 = 0000000000000000, %l0 = 0000000000000000, %y  = 000000aa
	sdiv	%l6,%l0,%l1		! Div by zero, %l0 = 0000000000000028
!	Mem[0000000010141400] = ff0000ff, %l0 = 0000000000000028
	swapa	[%i5+%g0]0x80,%l0	! %l0 = 00000000ff0000ff
!	%l4 = 0000000000000024, Mem[0000000010041408] = ff000000
	stha	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 00240000
!	Mem[0000000010141438] = 00000000, %l1 = 00000000ff000000
	swap	[%i5+0x038],%l1		! %l1 = 0000000000000000
!	%f27 = 61d05459, Mem[0000000010101414] = 79bf2e00
	st	%f27,[%i4+0x014]	! Mem[0000000010101414] = 61d05459
!	%l1 = 0000000000000000, %l1 = 0000000000000000, %l5 = 00000000000000ff
	addc	%l1,%l1,%l5		! %l5 = 0000000000000000
!	Mem[0000000030041408] = 24000000, %l3 = 00000018000000ff
	ldstuba	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101410] = 59000000, %l0 = 00000000ff0000ff
	ldstuba	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000059
!	%l7 = 00000000000000ff, Mem[00000000300c1408] = 000000ff
	stwa	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff

p0_label_244:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000000 a724226d, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i5+%o5]0x89,%l6	! %l6 = 00000000a724226d 0000000000000000
!	Mem[0000000030001408] = 002e0000, %l6 = 00000000a724226d
	ldswa	[%i0+%o4]0x89,%l6	! %l6 = 00000000002e0000
!	Mem[00000000100c1410] = 00000000, %l0 = 0000000000000059
	lduwa	[%i3+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001410] = 002ebf79002ebfff, %f26 = a724226d 61d05459
	ldda	[%i0+%o5]0x88,%f26	! %f26 = 002ebf79 002ebfff
!	Mem[0000000030101400] = 660000ff, %f24 = 79647692
	lda	[%i4+%g0]0x81,%f24	! %f24 = 660000ff
!	Mem[0000000010001400] = 00000000, %l6 = 00000000002e0000
	ldsba	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = 00000043, %l5 = 0000000000000000
	lduha	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000043
!	%l3 = 0000000000000000, immd = 0000000000000957, %l7  = 0000000000000000
	mulx	%l3,0x957,%l7		! %l7 = 0000000000000000
!	Mem[0000000030041410] = 660000ff, %l4 = 0000000000000024
	ldswa	[%i1+%o5]0x89,%l4	! %l4 = 00000000660000ff
!	%l6 = 0000000000000000, Mem[0000000010181412] = ffffac00
	sth	%l6,[%i6+0x012]		! Mem[0000000010181410] = ffff0000

p0_label_245:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010101400] = ff000000 00000000
	stda	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000 00000000
!	%l0 = 0000000000000000, Mem[0000000030041408] = ff000024
	stba	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000024
!	Mem[0000000010001400] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i0+0x000]%asi,%l3	! %l3 = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000030041400] = 00000000
	stwa	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010101408] = ffffffff
	stwa	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	Code Fragment 3, seed = 379085
p0_fragment_26:
!	%l0 = 0000000000000000
	setx	0xf65a0e7b6c4c8ebe,%g7,%l0 ! %l0 = f65a0e7b6c4c8ebe
!	%l1 = 0000000000000000
	setx	0xbb3afb4f20dcdf69,%g7,%l1 ! %l1 = bb3afb4f20dcdf69
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f65a0e7b6c4c8ebe
	setx	0xae67a15c3349ec24,%g7,%l0 ! %l0 = ae67a15c3349ec24
!	%l1 = bb3afb4f20dcdf69
	setx	0x33763d1f08b437ef,%g7,%l1 ! %l1 = 33763d1f08b437ef
p0_fragment_26_end:
!	Mem[0000000021800181] = ffff73f0, %l1 = 33763d1f08b437ef
	ldstuba	[%o3+0x181]%asi,%l1	! %l1 = 00000000000000ff
!	%l6 = 0000000000000000, immd = 00000da9, %y  = 000000aa
	sdiv	%l6,0xda9,%l5		! %l5 = 000000000c71e86d
	mov	%l0,%y			! %y = 3349ec24
!	%l4 = 660000ff, %l5 = 0c71e86d, Mem[0000000010181408] = a724226d 000000ff
	stda	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 660000ff 0c71e86d
!	%f22 = ff000000 34d30a10, %l5 = 000000000c71e86d
!	Mem[0000000010101410] = ff00000061d05459
	add	%i4,0x010,%g1
	stda	%f22,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010101410] = 100ad33461d05459

p0_label_246:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00002e00, %l0 = ae67a15c3349ec24
	ldsha	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000000
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000030101410] = 00000000 00000000
	stda	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000 000000ff
!	Mem[0000000010081414] = db2ebf79, %l6 = 0000000000000000
	lduw	[%i2+0x014],%l6		! %l6 = 00000000db2ebf79
!	Mem[0000000010141410] = 000000ff, %f18 = 00000000
	lda	[%i5+%o5]0x80,%f18	! %f18 = 000000ff
!	Mem[0000000030181400] = ff000000, %f24 = 660000ff
	lda	[%i6+%g0]0x81,%f24	! %f24 = ff000000
!	%l7 = 0000000000000000, imm = 00000000000007ae, %l1 = 00000000000000ff
	xor	%l7,0x7ae,%l1		! %l1 = 00000000000007ae
!	Mem[0000000030001410] = ff000000, %l4 = 00000000660000ff
	ldswa	[%i0+%o5]0x81,%l4	! %l4 = ffffffffff000000
!	Mem[0000000030181400] = ff000000, %f15 = 4603a94b
	lda	[%i6+%g0]0x81,%f15	! %f15 = ff000000
!	Mem[0000000010041408] = 0024000000000000, %f10 = ffff01ff 002af100
	ldda	[%i1+%o4]0x80,%f10	! %f10 = 00240000 00000000
!	Mem[0000000010001400] = ff00000000001800, %f18 = 000000ff 00000000
	ldda	[%i0+%g0]0x80,%f18	! %f18 = ff000000 00001800

p0_label_247:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, immd = ffffffffffffffa0, %l108 = 0000000000000002
	sdivx	%l0,-0x060,%l2		! %l2 = 0000000000000000
!	Mem[0000000010001410] = ffbf2e00, %l2 = 0000000000000000
	ldstuba	[%i0+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%l1 = 00000000000007ae, Mem[00000000218000c0] = 3eff2960
	sth	%l1,[%o3+0x0c0]		! Mem[00000000218000c0] = 07ae2960
!	Mem[0000000010101400] = 00000000, %l4 = 00000000ff000000
	swap	[%i4+%g0],%l4		! %l4 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010081414] = db2ebf79, %asi = 80
	stwa	%l0,[%i2+0x014]%asi	! Mem[0000000010081414] = 00000000
!	%f17 = 00000000, Mem[0000000030041410] = 660000ff
	sta	%f17,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
	membar	#Sync			! Added by membar checker (47)
!	%l4 = 00000000, %l5 = 0c71e86d, Mem[0000000030181408] = 002e0000 000000ff
	stda	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000 0c71e86d
!	Mem[0000000020800000] = 00ffa840, %l4 = 0000000000000000
	ldstub	[%o1+%g0],%l4		! %l4 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l5 = 000000000c71e86d
	swapa	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000000
!	%l6 = 00000000db2ebf79, Mem[0000000030141408] = 660000ff
	stba	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 66000079

p0_label_248:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 66000000, %l7 = 0000000000000000
	lduba	[%i2+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081400] = 00000000 00000000 00000000 00000000
!	Mem[0000000010081410] = 00000000 00000000 ff000000 34d30a10
!	Mem[0000000010081420] = 79647692 a7f4d91b a7ff226d 61d05459
!	Mem[0000000010081430] = 000000ff 000000ff cf14ffa0 ffffa0ff
	ldda	[%i2+%g0]ASI_BLK_PL,%f0 	! Block Load from 0000000010081400
!	Mem[0000000010001408] = 00000018, %f30 = cf14ffa0
	lda	[%i0+%o4]0x80,%f30	! %f30 = 00000018
!	Mem[0000000010141438] = ff000000, %l3 = 0000000000000000
	ldsh	[%i5+0x038],%l3		! %l3 = ffffffffffffff00
!	Mem[0000000030101410] = 00000000, %f29 = 00000000
	lda	[%i4+%o5]0x81,%f29	! %f29 = 00000000
!	Mem[0000000030041400] = 6de8710c, %l0 = 0000000000000000
	lduwa	[%i1+%g0]0x81,%l0	! %l0 = 000000006de8710c
!	Mem[0000000010081434] = 000000ff, %f19 = 00001800
	ld	[%i2+0x034],%f19	! %f19 = 000000ff
!	Mem[0000000030141410] = a724226d, %l7 = 0000000000000000
	lduha	[%i5+%o5]0x89,%l7	! %l7 = 000000000000226d
!	Mem[0000000030041400] = 6de8710c, %l4 = 0000000000000000
	ldswa	[%i1+%g0]0x81,%l4	! %l4 = 000000006de8710c
!	Mem[0000000030081410] = 00000000 ffffffff, %l4 = 6de8710c, %l5 = 00000000
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 00000000ffffffff 0000000000000000

p0_label_249:
!	Starting 10 instruction Store Burst
!	%l6 = db2ebf79, %l7 = 0000226d, Mem[0000000030101410] = 00000000 000000ff
	stda	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = db2ebf79 0000226d
!	Mem[0000000030181400] = 000000ff, %l0 = 000000006de8710c
	swapa	[%i6+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	%f0  = 00000000, %f14 = ffa0ffff, %f27 = 002ebfff
	fmuls	%f0 ,%f14,%f27		! %f27 = ffe0ffff
!	%l0 = 00000000000000ff, Mem[0000000030141408] = 7900006618ffff00
	stxa	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000000000ff
!	Mem[00000000300c1410] = 79bf2e00, %l0 = 00000000000000ff
	ldstuba	[%i3+%o5]0x89,%l0	! %l0 = 0000000000000000
!	%l2 = 000000ff, %l3 = ffffff00, Mem[0000000010141400] = 28000000 00000000
	stda	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff ffffff00
!	Mem[0000000030001408] = 002e0000, %l4 = 00000000ffffffff
	swapa	[%i0+%o4]0x89,%l4	! %l4 = 00000000002e0000
!	Mem[00000000218000c1] = 07ae2960, %l7 = 000000000000226d
	ldstuba	[%o3+0x0c1]%asi,%l7	! %l7 = 00000000000000ae
!	%l4 = 002e0000, %l5 = 00000000, Mem[0000000010101400] = 000000ff 00000000
	stda	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 002e0000 00000000
!	Mem[0000000030181408] = 00000000, %l1 = 00000000000007ae
	ldstuba	[%i6+%o4]0x89,%l1	! %l1 = 0000000000000000

p0_label_250:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000000, %l7 = 00000000000000ae
	lduha	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l4 = 00000000002e0000
	ldswa	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001400] = ff00000000001800, %l6 = 00000000db2ebf79
	ldx	[%i0+%g0],%l6		! %l6 = ff00000000001800
!	Mem[0000000030141408] = 00000000, %f19 = 000000ff
	lda	[%i5+%o4]0x89,%f19	! %f19 = 00000000
!	Mem[0000000010001400] = 000000ff, %l0 = 0000000000000000
	lduwa	[%i0+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041410] = 00000018000000ff, %f28 = 000000ff 00000000
	ldda	[%i1+%o5]0x80,%f28	! %f28 = 00000018 000000ff
!	Mem[00000000100c1408] = 0000000000000000, %f30 = 00000018 ffffa0ff, %asi = 80
	ldda	[%i3+0x008]%asi,%f30	! %f30 = 00000000 00000000
!	Mem[0000000010001414] = 79bf2e00, %l2 = 00000000000000ff
	ldsb	[%i0+0x014],%l2		! %l2 = 0000000000000079
!	Mem[0000000030041410] = 000000000000ff00, %f20 = 00000000 db2ebf79
	ldda	[%i1+%o5]0x81,%f20	! %f20 = 00000000 0000ff00
!	Mem[0000000030181408] = ff0000000c71e86d, %l7 = 0000000000000000
	ldxa	[%i6+%o4]0x81,%l7	! %l7 = ff0000000c71e86d

p0_label_251:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010181430] = 000000ad
	stw	%l4,[%i6+0x030]		! Mem[0000000010181430] = 00000000
	membar	#Sync			! Added by membar checker (48)
!	%f28 = 00000018, Mem[0000000010081408] = 00000000
	sta	%f28,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000018
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030081408] = 66000000 00000000
	stda	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000 00000000
!	%l2 = 00000079, %l3 = ffffff00, Mem[0000000030041408] = 00000024 000000ff
	stda	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000079 ffffff00
!	Mem[00000000218000c0] = 07ff2960, %l6 = ff00000000001800
	ldstuba	[%o3+0x0c0]%asi,%l6	! %l6 = 0000000000000007
!	%l2 = 0000000000000079, Mem[00000000100c1400] = 000000003400ffff
	stxa	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000000000000079
!	%f28 = 00000018 000000ff, Mem[0000000030041408] = 79000000 00ffffff
	stda	%f28,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000018 000000ff
!	%f8  = 1bd9f4a7 92766479, Mem[0000000030181410] = d8ffffff 00000000
	stda	%f8 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 1bd9f4a7 92766479
!	%l2 = 0000000000000079, Mem[00000000211c0000] = 545938a0, %asi = 80
	stha	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 007938a0
!	%l2 = 0000000000000079, %l7 = ff0000000c71e86d, %y  = 3349ec24
	smul	%l2,%l7,%l2		! %l2 = 00000005e1d6db85, %y = 00000005

p0_label_252:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff000000, %l1 = 0000000000000000
	ldswa	[%i0+%o5]0x81,%l1	! %l1 = ffffffffff000000
!	Mem[0000000030141410] = 00000000a724226d, %f30 = 00000000 00000000
	ldda	[%i5+%o5]0x89,%f30	! %f30 = 00000000 a724226d
!	%f8  = 1bd9f4a7 92766479, %l1 = ffffffffff000000
!	Mem[0000000010081430] = 000000ff000000ff
	add	%i2,0x030,%g1
	stda	%f8,[%g1+%l1]ASI_PST16_P ! Mem[0000000010081430] = 000000ff000000ff
!	Mem[0000000010181410] = 0000ffff, %l4 = 0000000000000000
	lduba	[%i6+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101408] = 00000043, %l3 = ffffffffffffff00
	lduha	[%i4+%o4]0x89,%l3	! %l3 = 0000000000000043
!	Mem[0000000010001408] = 00000018 000000ff, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000018 00000000000000ff
!	Mem[0000000030181410] = 1bd9f4a792766479, %f2  = 00000000 00000000
	ldda	[%i6+%o5]0x89,%f2 	! %f2  = 1bd9f4a7 92766479
!	%f9  = 92766479, %f11 = 6d22ffa7
	fcmpes	%fcc0,%f9 ,%f11		! %fcc0 = 1
!	Mem[0000000010181408] = 6de8710cff000066, %f10 = 5954d061 6d22ffa7
	ldda	[%i6+%o4]0x88,%f10	! %f10 = 6de8710c ff000066
!	Mem[0000000010041408] = 00002400, %l4 = 0000000000000018
	lduba	[%i1+%o4]0x88,%l4	! %l4 = 0000000000000000

p0_label_253:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000030181408] = ff000000
	stha	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	%l7 = ff0000000c71e86d, Mem[0000000010081400] = 00000000
	stwa	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = 0c71e86d
!	Mem[0000000030101400] = ff000066, %l4 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l4	! %l4 = 0000000000000066
!	Mem[0000000010081408] = 00000018, %l6 = 0000000000000007
	swapa	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000018
!	Mem[0000000030001400] = 00000000 000000d8 ffffffff 66000000
!	%f16 = 00000000 00000000 ff000000 00000000
!	%f20 = 00000000 0000ff00 ff000000 34d30a10
!	%f24 = ff000000 a7f4d91b 002ebf79 ffe0ffff
!	%f28 = 00000018 000000ff 00000000 a724226d
	stda	%f16,[%i0+%g0]ASI_BLK_SL	! Block Store to 0000000030001400
!	Mem[0000000010101408] = 00000000, %l6 = 0000000000000018
	swapa	[%i4+%o4]0x80,%l6	! %l6 = 0000000000000000
!	%l4 = 00000066, %l5 = 000000ff, Mem[0000000010081400] = 0c71e86d 00000000
	stda	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000066 000000ff
!	%f30 = 00000000, %f3  = 92766479, %f6  = 100ad334
	fdivs	%f30,%f3 ,%f6 		! %f6  = 80000000
!	Mem[0000000030101408] = 00000043, %l2 = 00000000e1d6db85
	swapa	[%i4+%o4]0x89,%l2	! %l2 = 0000000000000043
!	Mem[0000000030181410] = 79647692, %l0 = 00000000000000ff
	ldstuba	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000079

p0_label_254:
!	Starting 10 instruction Load Burst
!	%f15 = a0ff14cf, %f11 = ff000066, %f15 = a0ff14cf
	fmuls	%f15,%f11,%f15		! %f15 = 607f159a
!	Mem[0000000010181408] = ff000066, %l2 = 0000000000000043
	lduwa	[%i6+%o4]0x88,%l2	! %l2 = 00000000ff000066
!	Mem[0000000030181408] = 6de8710c 00000000, %l2 = ff000066, %l3 = 00000043
	ldda	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000000 000000006de8710c
!	%l5 = 00000000000000ff, imm = 000000000000053e, %l4 = 0000000000000066
	addc	%l5,0x53e,%l4		! %l4 = 000000000000063d
!	%l0 = 0000000000000079, immd = fffff6d3, %y  = 00000005
	smul	%l0,-0x92d,%l4		! %l4 = fffffffffffba9bb, %y = ffffffff
!	Mem[0000000010181400] = 00000000 ffff00a7, %l2 = 00000000, %l3 = 6de8710c
	ldda	[%i6+%g0]0x88,%l2	! %l2 = 00000000ffff00a7 0000000000000000
!	Mem[00000000300c1410] = ff2ebf79, %l6 = 0000000000000000
	lduha	[%i3+%o5]0x81,%l6	! %l6 = 000000000000ff2e
!	Mem[0000000030041410] = 00000000, %f2  = 1bd9f4a7
	lda	[%i1+%o5]0x89,%f2 	! %f2 = 00000000
!	Mem[0000000030141400] = 00000000 00000000, %l6 = 0000ff2e, %l7 = 0c71e86d
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030081410] = ffffffff, %l1 = ffffffffff000000
	ldsba	[%i2+%o5]0x81,%l1	! %l1 = ffffffffffffffff

p0_label_255:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010101400] = 00002e00
	stwa	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	%f28 = 00000018 000000ff, Mem[0000000030001410] = 0000ff00 00000000
	stda	%f28,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000018 000000ff
!	%f20 = 00000000, Mem[0000000010101410] = 34d30a10
	sta	%f20,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	Mem[0000000010101410] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l7	! %l7 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010181410] = ffff0000ff000000, %asi = 80
	stxa	%l3,[%i6+0x010]%asi	! Mem[0000000010181410] = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010101410] = ff000000
	stwa	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	%l7 = 0000000000000000, %l7 = 0000000000000000, %y  = ffffffff
	udiv	%l7,%l7,%l1		! Div by zero, %l0 = 00000000000000a1
!	%f25 = a7f4d91b, %f20 = 00000000
	fcmps	%fcc3,%f25,%f20		! %fcc3 = 1
!	%l5 = 00000000000000ff, Mem[0000000010041410] = 18000000
	stha	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = 180000ff
!	%l0 = 00000000000000a1, immd = fffffffffffffe68, %l5  = 00000000000000ff
	mulx	%l0,-0x198,%l5		! %l5 = fffffffffffeff68

p0_label_256:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (49)
!	Mem[0000000030001410] = 00000018000000ff, %f8  = 1bd9f4a7 92766479
	ldda	[%i0+%o5]0x89,%f8 	! %f8  = 00000018 000000ff
!	Mem[00000000300c1400] = ff000000, %l3 = 0000000000000000
	ldswa	[%i3+%g0]0x81,%l3	! %l3 = ffffffffff000000
!	Mem[0000000030181400] = 0c71e86d, %l3 = ffffffffff000000
	ldsba	[%i6+%g0]0x81,%l3	! %l3 = 000000000000000c
!	Mem[00000000100c1428] = ffd25dff 100d421f, %l6 = 00000000, %l7 = 00000000
	ldd	[%i3+0x028],%l6		! %l6 = 00000000ffd25dff 00000000100d421f
!	Mem[0000000020800040] = 6600b270, %l2 = 00000000ffff00a7
	lduh	[%o1+0x040],%l2		! %l2 = 0000000000006600
!	Mem[0000000030141400] = 0000000000000000, %f22 = ff000000 34d30a10
	ldda	[%i5+%g0]0x89,%f22	! %f22 = 00000000 00000000
!	Mem[0000000010001400] = 000000ff, %l0 = 00000000000000a1
	ldsha	[%i0+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001408] = 00000000, %l2 = 0000000000006600
	lduba	[%i0+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041408] = ff00000018000000, %l2 = 0000000000000000
	ldxa	[%i1+%o4]0x81,%l2	! %l2 = ff00000018000000
!	Mem[00000000100c140a] = 00000000, %l5 = fffffffffffeff68
	ldsh	[%i3+0x00a],%l5		! %l5 = 0000000000000000

p0_label_257:
!	Starting 10 instruction Store Burst
!	%f30 = 00000000 a724226d, Mem[0000000030001408] = 00000000 ff000000
	stda	%f30,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000 a724226d
!	%l3 = 000000000000000c, Mem[00000000201c0000] = 00ff1a10
	stb	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 0cff1a10
!	%l0 = 00000000000000ff, Mem[0000000010101400] = 00000000
	stwa	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff
!	%f29 = 000000ff, %f27 = ffe0ffff
	fsqrts	%f29,%f27		! tt=0x22, %l0 = 0000000000000121
!	%l1 = ffffffffffffffff, Mem[0000000030181400] = 0c71e86d
	stha	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = ffffe86d
!	Mem[0000000030041408] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	%l2 = 18000000, %l3 = 0000000c, Mem[0000000030081400] = ffff0000 00000000
	stda	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 18000000 0000000c
!	Mem[00000000100c1400] = 79000000, %l3 = 000000000000000c
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 0000000079000000
!	%l4 = fffffffffffba9bb, Mem[0000000010041408] = 00002400
	stwa	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = fffba9bb
!	Mem[0000000030141400] = 00000000, %l2 = ff00000018000000
	ldstuba	[%i5+%g0]0x81,%l2	! %l2 = 0000000000000000

p0_label_258:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041428] = a724226d 61d05459, %l0 = 00000121, %l1 = ffffffff, %asi = 80
	ldda	[%i1+0x028]%asi,%l0	! %l0 = 00000000a724226d 0000000061d05459
!	Mem[0000000030041410] = 00ff0000 00000000, %l0 = a724226d, %l1 = 61d05459
	ldda	[%i1+%o5]0x89,%l0	! %l0 = 0000000000000000 0000000000ff0000
!	Mem[0000000030041408] = 00000018000000ff, %f30 = 00000000 a724226d
	ldda	[%i1+%o4]0x89,%f30	! %f30 = 00000018 000000ff
!	Mem[0000000030081410] = ffffffff 00000000, %l4 = fffba9bb, %l5 = 000000ff
	ldda	[%i2+%o5]0x81,%l4	! %l4 = 00000000ffffffff 0000000000000000
!	Mem[0000000010081400] = 000000ff00000066, %f0  = 00000000 00000000
	ldda	[%i2+%g0]0x88,%f0 	! %f0  = 000000ff 00000066
!	Mem[0000000010181408] = 6de8710cff000066, %f4  = 00000000 00000000
	ldda	[%i6+%o4]0x88,%f4 	! %f4  = 6de8710c ff000066
!	Mem[0000000030101410] = db2ebf79 0000226d, %l0 = 00000000, %l1 = 00ff0000
	ldda	[%i4+%o5]0x81,%l0	! %l0 = 00000000db2ebf79 000000000000226d
!	Mem[0000000010181400] = a700ffff 00000000, %l6 = ffd25dff, %l7 = 100d421f
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 00000000a700ffff 0000000000000000
!	Mem[0000000010141400] = 000000ff, %l2 = 0000000000000000
	lduwa	[%i5+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181400] = ffffe86d00000000, %f2  = 00000000 92766479
	ldda	[%i6+%g0]0x81,%f2 	! %f2  = ffffe86d 00000000

p0_label_259:
!	Starting 10 instruction Store Burst
!	%f24 = ff000000 a7f4d91b, Mem[0000000030001410] = ff000000 18000000
	stda	%f24,[%i0+%o5]0x81	! Mem[0000000030001410] = ff000000 a7f4d91b
!	%f5  = ff000066, Mem[0000000030141408] = 00000000
	sta	%f5 ,[%i5+%o4]0x89	! Mem[0000000030141408] = ff000066
!	%f14 = ffa0ffff 607f159a, Mem[0000000010081410] = 00000000 00000000
	stda	%f14,[%i2+%o5]0x88	! Mem[0000000010081410] = ffa0ffff 607f159a
!	Mem[0000000030101410] = 79bf2edb, %l7 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l7	! %l7 = 00000000000000db
!	Mem[0000000010041427] = 61d05459, %l0 = 00000000db2ebf79
	ldstub	[%i1+0x027],%l0		! %l0 = 0000000000000059
!	%f11 = ff000066, Mem[0000000010181434] = 5e610975
	st	%f11,[%i6+0x034]	! Mem[0000000010181434] = ff000066
!	Mem[0000000010081408] = 07000000, %l1 = 000000000000226d
	ldstuba	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = ff000007, %l6 = 00000000a700ffff
	swap	[%i2+%o4],%l6		! %l6 = 00000000ff000007
!	%l6 = 00000000ff000007, Mem[0000000030181410] = ff647692
	stba	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 07647692
!	Mem[0000000030001410] = ff000000, %l6 = 00000000ff000007
	swapa	[%i0+%o5]0x81,%l6	! %l6 = 00000000ff000000

p0_label_260:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 007938a0, %l4 = 00000000ffffffff
	ldub	[%o2+%g0],%l4		! %l4 = 0000000000000000
!	Mem[00000000300c1400] = ff000000, %l6 = 00000000ff000000
	ldswa	[%i3+%g0]0x81,%l6	! %l6 = ffffffffff000000
!	Mem[0000000030181400] = 6de8ffff, %f0  = 000000ff
	lda	[%i6+%g0]0x89,%f0 	! %f0 = 6de8ffff
!	Mem[0000000010141408] = ff24226d, %f22 = 00000000
	ld	[%i5+%o4],%f22		! %f22 = ff24226d
!	Mem[0000000010041438] = 18000000ffff0034, %f26 = 002ebf79 ffe0ffff
	ldd	[%i1+0x038],%f26	! %f26 = 18000000 ffff0034
!	%l4 = 0000000000000000, immd = fffff401, %y  = ffffffff
	udiv	%l4,-0xbff,%l5		! %l5 = 00000000ffffffff
	mov	%l0,%y			! %y = 00000059
!	Mem[0000000030101408] = 000000ffe1d6db85, %f4  = 6de8710c ff000066
	ldda	[%i4+%o4]0x89,%f4 	! %f4  = 000000ff e1d6db85
	membar	#Sync			! Added by membar checker (50)
!	Mem[0000000010181400] = a700ffff 00000000 660000ff 0c71e86d
!	Mem[0000000010181410] = 00000000 00000000 000000aa 000000d8
!	Mem[0000000010181420] = 4381ff48 20cf3b39 000000ff 00000079
!	Mem[0000000010181430] = 00000000 ff000066 0000ffff 00000000
	ldda	[%i6+%g0]ASI_BLK_PL,%f0 	! Block Load from 0000000010181400
!	Mem[0000000010101420] = a724226d61d05459, %f28 = 00000018 000000ff, %asi = 80
	ldda	[%i4+0x020]%asi,%f28	! %f28 = a724226d 61d05459
!	Mem[00000000211c0000] = 007938a0, %l2 = 00000000000000ff, %asi = 80
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = 0000000000000079

p0_label_261:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010141410] = ff000000
	stha	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = ff000000
!	Mem[00000000100c1410] = 00000000, %l1 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	%f0  = 00000000, Mem[0000000010001400] = ff000000
	sta	%f0 ,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	%l6 = ff000000, %l7 = 000000db, Mem[0000000030141408] = 660000ff 000000ff
	stda	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = ff000000 000000db
!	%f16 = 00000000, %f16 = 00000000, %f27 = ffff0034
	fadds	%f16,%f16,%f27		! %f27 = 00000000
!	%l7 = 00000000000000db, Mem[000000001010142c] = 000000ff
	stb	%l7,[%i4+0x02c]		! Mem[000000001010142c] = db0000ff
!	%l0 = 0000000000000059, Mem[0000000030001400] = 00000000
	stwa	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000059
!	%l0 = 00000059, %l1 = 00000000, Mem[00000000100c1400] = 0c000000 00000000
	stda	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000059 00000000
!	%l5 = 00000000ffffffff, Mem[0000000010141408] = ff24226d
	stwa	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = ffffffff
!	%f13 = 00000000, %f5  = 00000000
	fcmpes	%fcc0,%f13,%f5 		! %fcc0 = 0

p0_label_262:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101422] = a724226d, %l2 = 0000000000000079
	ldsh	[%i4+0x022],%l2		! %l2 = 000000000000226d
!	Mem[0000000010001410] = ffbf2e00, %l0 = 0000000000000059
	lduha	[%i0+%o5]0x80,%l0	! %l0 = 000000000000ffbf
!	Mem[0000000010101410] = 00000000, %l5 = 00000000ffffffff
	ldswa	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = 00000018, %l2 = 000000000000226d
	lduwa	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000018
!	Mem[0000000010041400] = d800000000000000, %l4 = 0000000000000000
	ldxa	[%i1+%g0]0x80,%l4	! %l4 = d800000000000000
	membar	#Sync			! Added by membar checker (51)
!	Mem[0000000010001400] = 00000000 00001800 00000018 000000ff
!	Mem[0000000010001410] = ffbf2e00 79bf2e00 00000000 000000cc
!	Mem[0000000010001420] = 80000000 000000ff a724226d 61d05459
!	Mem[0000000010001430] = 0000421f 000000ff 00000000 ffff0034
	ldda	[%i0+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010001400
!	Mem[0000000010081410] = 607f159a, %l2 = 0000000000000018
	lduwa	[%i2+%o5]0x88,%l2	! %l2 = 00000000607f159a
!	Mem[0000000010101428] = 00000000, %f25 = a7f4d91b
	lda	[%i4+0x028]%asi,%f25	! %f25 = 00000000
!	Mem[0000000010181400] = a700ffff, %l7 = 00000000000000db
	ldsha	[%i6+%g0]0x80,%l7	! %l7 = ffffffffffffa700
!	Mem[0000000010181410] = 00000000, %l0 = 000000000000ffbf
	lduha	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000

p0_label_263:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 6d2224a7, %l0 = 0000000000000000
	ldstuba	[%i5+%o5]0x81,%l0	! %l0 = 000000000000006d
!	%f23 = 00000000, Mem[0000000030001410] = ff000007
	sta	%f23,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	%l7 = ffffffffffffa700, Mem[0000000010041408] = fffba9bb
	stba	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = fffba900
!	%l0 = 000000000000006d, Mem[0000000010081400] = 66000000
	stwa	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000006d
!	Mem[0000000030181400] = 6de8ffff, %l3 = 0000000079000000
	swapa	[%i6+%g0]0x89,%l3	! %l3 = 000000006de8ffff
!	%l0 = 000000000000006d, Mem[0000000010101420] = a724226d61d05459
	stx	%l0,[%i4+0x020]		! Mem[0000000010101420] = 000000000000006d
!	%l5 = 0000000000000000, Mem[0000000020800000] = ffffa840
	stb	%l5,[%o1+%g0]		! Mem[0000000020800000] = 00ffa840
!	Mem[0000000010001410] = ffbf2e00, %l0 = 000000000000006d
	swapa	[%i0+%o5]0x80,%l0	! %l0 = 00000000ffbf2e00
!	Mem[000000001014141e] = 79bf2edb, %l4 = d800000000000000
	ldstuba	[%i5+0x01e]%asi,%l4	! %l4 = 000000000000002e
!	%l1 = 0000000000000000, Mem[00000000211c0000] = 007938a0
	sth	%l1,[%o2+%g0]		! Mem[00000000211c0000] = 000038a0

p0_label_264:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000, %l3 = 000000006de8ffff
	ldsha	[%i6+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081400] = 18000000, %l1 = 0000000000000000
	ldsba	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000018
!	Mem[0000000010081400] = 6d000000, %l4 = 000000000000002e
	ldswa	[%i2+%g0]0x88,%l4	! %l4 = 000000006d000000
!	Mem[00000000201c0000] = 0cff1a10, %l0 = 00000000ffbf2e00, %asi = 80
	lduba	[%o0+0x000]%asi,%l0	! %l0 = 000000000000000c
!	Mem[0000000030101400] = ff0000ff, %l6 = ffffffffff000000
	ldsha	[%i4+%g0]0x81,%l6	! %l6 = ffffffffffffff00
!	Mem[000000001004141c] = 000000cc, %l3 = 0000000000000000
	ldsw	[%i1+0x01c],%l3		! %l3 = 00000000000000cc
!	Mem[00000000201c0000] = 0cff1a10, %l7 = ffffffffffffa700
	ldsh	[%o0+%g0],%l7		! %l7 = 0000000000000cff
!	Mem[0000000010041400] = d8000000 00000000, %l0 = 0000000c, %l1 = 00000018
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 00000000d8000000 0000000000000000
!	%f20 = 00000000 0000ff00, Mem[0000000030181410] = 92766407 1bd9f4a7
	stda	%f20,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000 0000ff00
!	Code Fragment 3, seed = 758675
p0_fragment_27:
!	%l0 = 00000000d8000000
	setx	0xb36748c23d01de8e,%g7,%l0 ! %l0 = b36748c23d01de8e
!	%l1 = 0000000000000000
	setx	0xdf05c7b339a96639,%g7,%l1 ! %l1 = df05c7b339a96639
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b36748c23d01de8e
	setx	0x797ba50e5213f9f4,%g7,%l0 ! %l0 = 797ba50e5213f9f4
!	%l1 = df05c7b339a96639
	setx	0xa55a73b640d11cbf,%g7,%l1 ! %l1 = a55a73b640d11cbf
p0_fragment_27_end:

p0_label_265:
!	Starting 10 instruction Store Burst
!	%l4 = 6d000000, %l5 = 00000000, Mem[00000000100c1410] = 00000000 00000000
	stda	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 6d000000 00000000
!	%l6 = ffffffffffffff00, Mem[0000000010081408] = ffff00a7
	stha	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffff00
!	%l4 = 000000006d000000, Mem[0000000010041430] = 0000421f000000ff
	stx	%l4,[%i1+0x030]		! Mem[0000000010041430] = 000000006d000000
!	%f8  = 80000000 000000ff, Mem[0000000010181430] = 00000000 ff000066
	std	%f8 ,[%i6+0x030]	! Mem[0000000010181430] = 80000000 000000ff
!	Mem[0000000010001420] = 80000000000000ff, %l7 = 0000000000000cff, %l2 = 00000000607f159a
	add	%i0,0x20,%g1
	casxa	[%g1]0x80,%l7,%l2	! %l2 = 80000000000000ff
!	%l0 = 797ba50e5213f9f4, Mem[0000000010101408] = 18000000
	stha	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 1800f9f4
!	Mem[0000000010001408] = 00000018, %l1 = 40d11cbf, %l3 = 000000cc
	add	%i0,0x08,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 0000000000000018
!	%l2 = 80000000000000ff, Mem[0000000010101400] = 000000ff
	stwa	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff
!	%l4 = 000000006d000000, Mem[0000000030141400] = 000000ff
	stba	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	Mem[0000000010001410] = 0000006d, %l2 = 80000000000000ff
	ldstuba	[%i0+%o5]0x80,%l2	! %l2 = 0000000000000000

p0_label_266:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00000000, %l7 = 0000000000000cff
	lduwa	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	%f31 = 000000ff, %f12 = 0000421f, %f25 = 00000000
	fdivs	%f31,%f12,%f25		! tt=0x22, %l0 = 797ba50e5213fa16
!	Mem[00000000211c0001] = 000038a0, %l7 = 0000000000000000
	ldub	[%o2+0x001],%l7		! %l7 = 0000000000000000
!	Mem[0000000010081410] = 607f159a, %l2 = 0000000000000000
	ldswa	[%i2+%o5]0x88,%l2	! %l2 = 00000000607f159a
!	Mem[0000000010181404] = 00000000, %l7 = 0000000000000000, %asi = 80
	lduba	[%i6+0x004]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141408] = 00000000 ffffffff, %l4 = 6d000000, %l5 = 00000000
	ldda	[%i5+%o4]0x88,%l4	! %l4 = 00000000ffffffff 0000000000000000
!	Mem[0000000010081431] = 000000ff, %l2 = 00000000607f159a
	ldsb	[%i2+0x031],%l2		! %l2 = 0000000000000000
!	Mem[0000000010141400] = ffffff00 000000ff, %l2 = 00000000, %l3 = 00000018
	ldda	[%i5+%g0]0x88,%l2	! %l2 = 00000000000000ff 00000000ffffff00
!	Mem[0000000010101400] = 000000ff, %f9  = 000000ff
	lda	[%i4+%g0]0x88,%f9 	! %f9 = 000000ff
!	Mem[0000000030101410] = ff2ebf79, %f7  = 000000cc
	lda	[%i4+%o5]0x81,%f7 	! %f7 = ff2ebf79

p0_label_267:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (52)
!	%l0 = 797ba50e5213fa16, Mem[000000001000141b] = 00000000
	stb	%l0,[%i0+0x01b]		! Mem[0000000010001418] = 00000016
!	%l2 = 000000ff, %l3 = ffffff00, Mem[0000000010041400] = d8000000 00000000
	std	%l2,[%i1+%g0]		! Mem[0000000010041400] = 000000ff ffffff00
!	Mem[0000000010141400] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i5+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%l3 = 00000000ffffff00, Mem[0000000010101410] = 00000000
	stwa	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffff00
!	%l5 = 00000000000000ff, Mem[0000000030001410] = 00000000
	stha	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = 00ff0000
!	Mem[0000000010181400] = a700ffff, %l0 = 000000005213fa16
	swap	[%i6+%g0],%l0		! %l0 = 00000000a700ffff
!	Mem[0000000010081400] = 0000006d, %l3 = 00000000ffffff00
	ldstuba	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000000
!	%f8  = 80000000 000000ff, %l3 = 0000000000000000
!	Mem[0000000030041408] = ff00000018000000
	add	%i1,0x008,%g1
	stda	%f8,[%g1+%l3]ASI_PST16_S ! Mem[0000000030041408] = ff00000018000000
!	%f17 = 00000000, Mem[00000000100c1410] = 6d000000
	sta	%f17,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	%l4 = ffffffff, %l5 = 000000ff, Mem[0000000030081410] = ffffffff 00000000
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffffff 000000ff

p0_label_268:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00a9fbff, %l4 = 00000000ffffffff
	ldsba	[%i1+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = ffffffff 000000ff, %l6 = ffffff00, %l7 = 00000000
	ldda	[%i2+%o5]0x81,%l6	! %l6 = 00000000ffffffff 00000000000000ff
!	Mem[00000000100c1400] = 59000000, %l6 = 00000000ffffffff
	lduha	[%i3+%g0]0x80,%l6	! %l6 = 0000000000005900
!	Mem[0000000010181400] = 16fa1352, %l6 = 0000000000005900
	lduha	[%i6+%g0]0x88,%l6	! %l6 = 0000000000001352
!	Mem[0000000010181408] = 660000ff0c71e86d, %f24 = ff000000 00000000
	ldda	[%i6+%o4]0x80,%f24	! %f24 = 660000ff 0c71e86d
!	Mem[0000000010081408] = ffffff00, %l7 = 00000000000000ff
	lduha	[%i2+%o4]0x88,%l7	! %l7 = 000000000000ff00
!	Mem[00000000211c0000] = 000038a0, %l3 = 0000000000000000, %asi = 80
	lduha	[%o2+0x000]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041400] = 000000ffffffff00, %l0 = 00000000a700ffff, %asi = 80
	ldxa	[%i1+0x000]%asi,%l0	! %l0 = 000000ffffffff00
	membar	#Sync			! Added by membar checker (53)
!	Mem[0000000010081400] = ff00006d ff000000 00ffffff 00000000
!	Mem[0000000010081410] = 9a157f60 ffffa0ff ff000000 34d30a10
!	Mem[0000000010081420] = 79647692 a7f4d91b a7ff226d 61d05459
!	Mem[0000000010081430] = 000000ff 000000ff cf14ffa0 ffffa0ff
	ldda	[%i2+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010081400
!	Mem[0000000010001419] = 00000016, %l5 = 00000000000000ff, %asi = 80
	ldsba	[%i0+0x019]%asi,%l5	! %l5 = 0000000000000000

p0_label_269:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 00000000, %l0 = 00000000ffffff00
	swapa	[%i3+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001410] = 00ff0000, %l7 = 000000000000ff00
	swapa	[%i0+%o5]0x81,%l7	! %l7 = 0000000000ff0000
!	%l2 = 00000000000000ff, Mem[0000000030101408] = e1d6db85
	stha	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = e1d600ff
!	Mem[0000000010001400] = 00000000, %l6 = 0000000000001352
	ldstuba	[%i0+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000030141408] = ff000000 000000db
	stda	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000ff 00000000
!	%l2 = 00000000000000ff, Mem[0000000010001408] = 00000018
	sth	%l2,[%i0+%o4]		! Mem[0000000010001408] = 00ff0018
!	Mem[0000000010101408] = f4f90018, %l2 = 00000000000000ff
	swapa	[%i4+%o4]0x80,%l2	! %l2 = 00000000f4f90018
!	%l1 = a55a73b640d11cbf, Mem[0000000010181420] = 4381ff4820cf3b39, %asi = 80
	stxa	%l1,[%i6+0x020]%asi	! Mem[0000000010181420] = a55a73b640d11cbf
!	%f0  = 00000000 00001800, Mem[0000000030001400] = 00000059 00000000
	stda	%f0 ,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 00001800
	membar	#Sync			! Added by membar checker (54)
!	%l5 = 0000000000000000, Mem[0000000010081400] = 6d0000ff
	stha	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 6d000000

p0_label_270:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = a724226d, %l3 = 0000000000000000
	lduba	[%i0+%o4]0x89,%l3	! %l3 = 000000000000006d
!	Mem[0000000010101400] = 000000ff, %l6 = 0000000000000000
	lduha	[%i4+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081408] = 00000000 00000000, %l0 = 00000000, %l1 = 40d11cbf
	ldda	[%i2+%o4]0x81,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[00000000100c1408] = 00000000 00000000, %l0 = 00000000, %l1 = 00000000, %asi = 80
	ldda	[%i3+0x008]%asi,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000021800081] = 1b27b330, %l7 = 0000000000ff0000
	ldub	[%o3+0x081],%l7		! %l7 = 0000000000000027
!	Mem[0000000030141408] = 000000ff, %l0 = 0000000000000000
	ldsba	[%i5+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081410] = 9a157f60, %l3 = 000000000000006d
	lduwa	[%i2+%o5]0x80,%l3	! %l3 = 000000009a157f60
!	Mem[0000000010001438] = 00000000ffff0034, %f10 = a724226d 61d05459, %asi = 80
	ldda	[%i0+0x038]%asi,%f10	! %f10 = 00000000 ffff0034
!	Mem[0000000030141400] = 00000000, %l4 = 0000000000000000
	ldswa	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = ffffff00, %l5 = 0000000000000000
	lduba	[%i3+%o5]0x80,%l5	! %l5 = 00000000000000ff

p0_label_271:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[000000001018141c] = 000000d8
	stw	%l4,[%i6+0x01c]		! Mem[000000001018141c] = 00000000
!	%l2 = f4f90018, %l3 = 9a157f60, Mem[0000000010081428] = a7ff226d 61d05459
	std	%l2,[%i2+0x028]		! Mem[0000000010081428] = f4f90018 9a157f60
!	Mem[00000000100c1418] = 000000ff, %l4 = 0000000000000000
	swap	[%i3+0x018],%l4		! %l4 = 00000000000000ff
!	Mem[00000000100c1408] = 00000000, %l7 = 0000000000000027
	swap	[%i3+%o4],%l7		! %l7 = 0000000000000000
!	%f2  = 00000018 000000ff, %l1 = 0000000000000000
!	Mem[0000000030141428] = 0839c9165d2e7f0f
	add	%i5,0x028,%g1
	stda	%f2,[%g1+%l1]ASI_PST8_S ! Mem[0000000030141428] = 0839c9165d2e7f0f
!	%l6 = 00000000000000ff, Mem[00000000100c1420] = 0000006600000000
	stx	%l6,[%i3+0x020]		! Mem[00000000100c1420] = 00000000000000ff
!	Mem[00000000201c0001] = 0cff1a10, %l3 = 000000009a157f60
	ldstuba	[%o0+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181408] = 00000000, %l6 = 00000000000000ff
	swapa	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141400] = 00000000 00000000 000000ff 00000000
!	%f0  = 00000000 00001800 00000018 000000ff
!	%f4  = ffbf2e00 79bf2e00 00000000 ff2ebf79
!	%f8  = 80000000 000000ff 00000000 ffff0034
!	%f12 = 0000421f 000000ff 00000000 ffff0034
	stda	%f0 ,[%i5+%g0]ASI_BLK_SL	! Block Store to 0000000030141400
!	Mem[0000000030041408] = 000000ff, %l2 = 00000000f4f90018
	swapa	[%i1+%o4]0x89,%l2	! %l2 = 00000000000000ff

p0_label_272:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (55)
!	Mem[0000000030141400] = 00001800, %f25 = a7f4d91b
	lda	[%i5+%g0]0x89,%f25	! %f25 = 00001800
!	Mem[0000000030041408] = f4f90018, %l4 = 00000000000000ff
	ldsha	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000018
!	%f11 = ffff0034, %f31 = ffffa0ff, %f0  = 00000000
	fdivs	%f11,%f31,%f0 		! %f0  = ffffa0ff
!	Mem[00000000100c1410] = ffffff00, %l3 = 00000000000000ff
	lduba	[%i3+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1400] = 00000059, %l5 = 00000000000000ff
	ldsba	[%i3+%g0]0x88,%l5	! %l5 = 0000000000000059
!	Mem[0000000010101400] = 00000000000000ff, %l5 = 0000000000000059
	ldxa	[%i4+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001410] = 0000ff00 a7f4d91b, %l0 = 00000000, %l1 = 00000000
	ldda	[%i0+%o5]0x81,%l0	! %l0 = 000000000000ff00 00000000a7f4d91b
!	Mem[0000000010041408] = 00a9fbff00000000, %l1 = 00000000a7f4d91b
	ldx	[%i1+%o4],%l1		! %l1 = 00a9fbff00000000
!	Mem[0000000010081410] = 607f159a, %f4  = ffbf2e00
	lda	[%i2+%o5]0x88,%f4 	! %f4 = 607f159a
!	Mem[0000000010181400] = 5213fa16 00000000 660000ff 0c71e86d
!	Mem[0000000010181410] = 00000000 00000000 000000aa 00000000
!	Mem[0000000010181420] = a55a73b6 40d11cbf 000000ff 00000079
!	Mem[0000000010181430] = 80000000 000000ff 0000ffff 00000000
	ldda	[%i6+%g0]ASI_BLK_AIUPL,%f0 	! Block Load from 0000000010181400

p0_label_273:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000030041410] = 00000000
	stwa	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	%l3 = 00000000000000ff, %l7 = 0000000000000000, %l0 = 000000000000ff00
	xnor	%l3,%l7,%l0		! %l0 = ffffffffffffff00
!	Mem[0000000030181400] = 79000000, %l6 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l6	! %l6 = 0000000000000000
!	%l4 = 0000000000000018, Mem[0000000030001400] = 0018000000000000
	stxa	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000000000000018
!	Mem[00000000100c1410] = ffffff0000000000, %f18 = 00ffffff 00000000
	ldda	[%i3+%o5]0x80,%f18	! %f18 = ffffff00 00000000
!	%f0  = 00000000 16fa1352, %l0 = ffffffffffffff00
!	Mem[0000000030101420] = 42eea8b86650b2e9
	add	%i4,0x020,%g1
	stda	%f0,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030101420] = 42eea8b86650b2e9
!	Mem[000000001014141c] = 79bfffdb, %l4 = 0000000000000018
	swap	[%i5+0x01c],%l4		! %l4 = 0000000079bfffdb
!	%l4 = 0000000079bfffdb, Mem[0000000010101400] = ff000000
	stba	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = db000000
!	Mem[0000000010001425] = 000000ff, %l0 = ffffffffffffff00
	ldstub	[%i0+0x025],%l0		! %l0 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000030181408] = ff000000
	stwa	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000

p0_label_274:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000018, %l3 = 00000000000000ff
	ldsha	[%i2+%g0]0x89,%l3	! %l3 = 0000000000000018
!	Mem[0000000010141400] = ff000000, %l7 = 0000000000000000
	lduwa	[%i5+%g0]0x80,%l7	! %l7 = 00000000ff000000
!	Mem[00000000100c1408] = 0000000027000000, %l6 = 0000000000000000
	ldxa	[%i3+%o4]0x88,%l6	! %l6 = 0000000027000000
!	Mem[0000000021800000] = 2cff3ad0, %l2 = 00000000000000ff, %asi = 80
	lduha	[%o3+0x000]%asi,%l2	! %l2 = 0000000000002cff
!	Mem[0000000030041410] = 00000000, %l4 = 0000000079bfffdb
	lduha	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001414] = 79bf2e00, %l1 = 00a9fbff00000000
	ldsb	[%i0+0x014],%l1		! %l1 = 0000000000000079
!	Code Fragment 4, seed = 101628
p0_fragment_28:
!	%l0 = 0000000000000000
	setx	0xfaeefec52c74cc46,%g7,%l0 ! %l0 = faeefec52c74cc46
!	%l1 = 0000000000000079
	setx	0xf2ba0c8e3b854671,%g7,%l1 ! %l1 = f2ba0c8e3b854671
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = faeefec52c74cc46
	setx	0x88023083c2d844ac,%g7,%l0 ! %l0 = 88023083c2d844ac
!	%l1 = f2ba0c8e3b854671
	setx	0xd89866936443c9f7,%g7,%l1 ! %l1 = d89866936443c9f7
p0_fragment_28_end:
!	Mem[0000000010001408] = 1800ff00, %l4 = 0000000000000000
	lduwa	[%i0+%o4]0x88,%l4	! %l4 = 000000001800ff00
!	Mem[0000000010001408] = 1800ff00, %l2 = 0000000000002cff
	lduha	[%i0+%o4]0x88,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030081410] = ffffffff, %l7 = 00000000ff000000
	ldswa	[%i2+%o5]0x89,%l7	! %l7 = ffffffffffffffff

p0_label_275:
!	Starting 10 instruction Store Burst
!	%l4 = 000000001800ff00, Mem[0000000010101410] = ffffff0061d05459
	stx	%l4,[%i4+%o5]		! Mem[0000000010101410] = 000000001800ff00
!	Mem[0000000010081408] = 00ffffff, %l1 = 000000006443c9f7
	swapa	[%i2+%o4]0x80,%l1	! %l1 = 0000000000ffffff
!	%f0  = 00000000 16fa1352, %l5 = 00000000000000ff
!	Mem[0000000030081420] = 43811d4820cf3b39
	add	%i2,0x020,%g1
	stda	%f0,[%g1+%l5]ASI_PST32_S ! Mem[0000000030081420] = 0000000016fa1352
!	Mem[0000000010101400] = 000000db, %l2 = 000000000000ff00
	ldstuba	[%i4+%g0]0x88,%l2	! %l2 = 00000000000000db
!	Mem[0000000030181408] = 00000000, %l5 = 00000000000000ff
	swapa	[%i6+%o4]0x89,%l5	! %l5 = 0000000000000000
!	%l0 = c2d844ac, %l1 = 00ffffff, Mem[0000000030101400] = ff0000ff 2334a518
	stda	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = c2d844ac 00ffffff
!	Mem[0000000030001410] = 0000ff00, %l1 = 0000000000ffffff
	swapa	[%i0+%o5]0x81,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010081408] = f7c94364, %l4 = 000000001800ff00
	ldstuba	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000064
!	Mem[0000000030001408] = 6d2224a7, %l2 = 00000000000000db
	ldstuba	[%i0+%o4]0x81,%l2	! %l2 = 000000000000006d
!	Mem[0000000010181400] = 16fa1352, %l0 = 00000000c2d844ac
	swapa	[%i6+%g0]0x88,%l0	! %l0 = 0000000016fa1352

p0_label_276:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff000000, %l3 = 0000000000000018
	lduwa	[%i4+%o4]0x88,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010041400] = ff000000, %f17 = ff000000
	lda	[%i1+%g0]0x88,%f17	! %f17 = ff000000
!	Mem[00000000100c1404] = 00000000, %f19 = 00000000
	ld	[%i3+0x004],%f19	! %f19 = 00000000
!	Mem[0000000030081400] = 18000000, %l1 = 000000000000ff00
	ldsha	[%i2+%g0]0x81,%l1	! %l1 = 0000000000001800
!	Mem[00000000100c1400] = 59000000, %l4 = 0000000000000064
	ldsha	[%i3+%g0]0x80,%l4	! %l4 = 0000000000005900
!	Mem[0000000030101410] = ff2ebf79, %l3 = 00000000ff000000
	ldswa	[%i4+%o5]0x81,%l3	! %l3 = ffffffffff2ebf79
!	Mem[00000000300c1410] = 79bf2eff, %l6 = 0000000027000000
	ldsha	[%i3+%o5]0x89,%l6	! %l6 = 0000000000002eff
!	Mem[0000000030041400] = 00000000 0c71e86d, %l6 = 00002eff, %l7 = ffffffff
	ldda	[%i1+%g0]0x89,%l6	! %l6 = 000000000c71e86d 0000000000000000
!	Mem[0000000010001408] = ff000000 1800ff00, %l6 = 0c71e86d, %l7 = 00000000
	ldda	[%i0+%o4]0x88,%l6	! %l6 = 000000001800ff00 00000000ff000000
!	Mem[00000000100c1400] = 00000000 00000059, %l0 = 16fa1352, %l1 = 00001800
	ldda	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000059 0000000000000000

p0_label_277:
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffff2ebf79, Mem[00000000201c0000] = 0cff1a10, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = bf791a10
!	%f26 = a7ff226d 61d05459, Mem[0000000010001400] = ff000000 00001800
	stda	%f26,[%i0+%g0]0x80	! Mem[0000000010001400] = a7ff226d 61d05459
!	Mem[00000000100c1410] = 00ffffff, %l0 = 0000000000000059
	swapa	[%i3+%o5]0x88,%l0	! %l0 = 0000000000ffffff
!	Mem[00000000300c1408] = 000000ff, %l2 = 000000000000006d
	swapa	[%i3+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%f15 = ffff0000, Mem[00000000100c1410] = 59000000
	sta	%f15,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffff0000
!	%f31 = ffffa0ff, Mem[00000000100c1438] = 00000000
	st	%f31,[%i3+0x038]	! Mem[00000000100c1438] = ffffa0ff
!	Mem[0000000010081400] = 0000006d, %l5 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (56)
!	%f6  = 00000000 aa000000, Mem[0000000010181410] = 00000000 00000000
	stda	%f6 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000 aa000000
!	%f18 = ffffff00 00000000, %l5 = 0000000000000000
!	Mem[0000000010081400] = ff00006dff000000
	stda	%f18,[%i2+%l5]ASI_PST16_P ! Mem[0000000010081400] = ff00006dff000000
!	Mem[0000000030101408] = ff00d6e1, %l3 = 00000000ff2ebf79
	swapa	[%i4+%o4]0x81,%l3	! %l3 = 00000000ff00d6e1

p0_label_278:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1438] = ffffa0ff00000043, %l3 = 00000000ff00d6e1, %asi = 80
	ldxa	[%i3+0x038]%asi,%l3	! %l3 = ffffa0ff00000043
!	Mem[00000000100c142c] = 100d421f, %l7 = 00000000ff000000
	ldsw	[%i3+0x02c],%l7		! %l7 = 00000000100d421f
!	Mem[0000000010101418] = 00000000000000cc, %l3 = ffffa0ff00000043, %asi = 80
	ldxa	[%i4+0x018]%asi,%l3	! %l3 = 00000000000000cc
!	Mem[0000000010141400] = 000000ff, %l2 = 00000000000000ff
	lduba	[%i5+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041430] = 00000000, %l5 = 0000000000000000
	ldsb	[%i1+0x030],%l5		! %l5 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %f14 = 00000000
	lda	[%i6+%o5]0x80,%f14	! %f14 = 00000000
!	Mem[0000000010101430] = 0000421f000000ff, %l2 = 00000000000000ff
	ldx	[%i4+0x030],%l2		! %l2 = 0000421f000000ff
!	Mem[0000000010141430] = 07b95aff, %f6  = 00000000
	ld	[%i5+0x030],%f6 	! %f6 = 07b95aff
!	Mem[0000000030081410] = ffffffff, %l7 = 00000000100d421f
	lduwa	[%i2+%o5]0x89,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000010001408] = 00ff0018 000000ff, %l4 = 00005900, %l5 = 00000000
	ldd	[%i0+%o4],%l4		! %l4 = 0000000000ff0018 00000000000000ff

p0_label_279:
!	Starting 10 instruction Store Burst
!	Mem[000000001008140c] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i2+0x00c]%asi,%l1	! %l1 = 0000000000000000
!	%f25 = 00001800, Mem[0000000010181408] = 660000ff
	st	%f25,[%i6+%o4]		! Mem[0000000010181408] = 00001800
!	Mem[0000000010141408] = ffffffff, %l3 = 00000000000000cc
	ldstuba	[%i5+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101420] = 00000000, %l4 = 0000000000ff0018
	swap	[%i4+0x020],%l4		! %l4 = 0000000000000000
!	%f25 = 00001800, %f20 = 9a157f60, %f8  = bf1cd140 b6735aa5
	fsmuld	%f25,%f20,%f8 		! tt=0x22, %l0 = 0000000001000021
!	Mem[00000000201c0000] = bf791a10, %l6 = 000000001800ff00
	ldstuba	[%o0+0x000]%asi,%l6	! %l6 = 00000000000000bf
!	%l4 = 0000000000000000, Mem[0000000030001410] = 00ffffff
	stwa	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	%l2 = 0000421f000000ff, %l4 = 0000000000000000, %l7 = 00000000ffffffff
	subc	%l2,%l4,%l7		! %l7 = 0000421f000000ff
!	%l3 = 00000000000000ff, Mem[0000000010141428] = 00000043000000ff
	stx	%l3,[%i5+0x028]		! Mem[0000000010141428] = 00000000000000ff
!	%f16 = ff00006d ff000000, Mem[0000000010101410] = 00000000 1800ff00
	stda	%f16,[%i4+%o5]0x80	! Mem[0000000010101410] = ff00006d ff000000

p0_label_280:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 6d0000ff, %l6 = 00000000000000bf
	ldsha	[%i0+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000020800001] = 00ffa840, %l3 = 00000000000000ff
	ldub	[%o1+0x001],%l3		! %l3 = 00000000000000ff
!	Mem[00000000100c1408] = 27000000, %l0 = 0000000001000021
	ldsba	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041408] = 00000000 fffba900, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i1+%o4]0x88,%l4	! %l4 = 00000000fffba900 0000000000000000
!	%l3 = 00000000000000ff, imm = ffffffffffffff97, %l1 = 0000000000000000
	xnor	%l3,-0x069,%l1		! %l1 = 0000000000000097
!	Mem[0000000030001400] = 00000018, %f29 = 000000ff
	lda	[%i0+%g0]0x89,%f29	! %f29 = 00000018
!	Mem[0000000030181408] = ff000000, %l0 = 0000000000000000
	lduba	[%i6+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030181400] = ff000079 00000000 ff000000 0c71e86d
!	Mem[0000000030181410] = 00ff0000 00000000 303020bf aaecd5f7
!	Mem[0000000030181420] = e9b25066 b8a8ee42 00f12a00 ff01ffff
!	Mem[0000000030181430] = 2550c44e 00000000 4ba90346 900a6200
	ldda	[%i6+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030181400
!	Mem[0000000010141433] = 07b95aff, %l2 = 0000421f000000ff, %asi = 80
	ldsba	[%i5+0x033]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010181408] = 00001800, %l2 = ffffffffffffffff
	ldswa	[%i6+%o4]0x80,%l2	! %l2 = 0000000000001800

p0_label_281:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 00000027, %l2 = 0000000000001800
	swapa	[%i3+%o4]0x80,%l2	! %l2 = 0000000000000027
!	%l3 = 00000000000000ff, Mem[0000000010041410] = ff000018000000ff
	stxa	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000000000ff
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000010001438] = 00000000 ffff0034, %asi = 80
	stda	%l6,[%i0+0x038]%asi	! Mem[0000000010001438] = 000000ff 000000ff
!	%f30 = cf14ffa0 ffffa0ff, Mem[0000000030101410] = 79bf2eff 6d220000
	stda	%f30,[%i4+%o5]0x89	! Mem[0000000030101410] = cf14ffa0 ffffa0ff
!	%f26 = a7ff226d, Mem[0000000030141400] = 00001800
	sta	%f26,[%i5+%g0]0x89	! Mem[0000000030141400] = a7ff226d
!	%l7 = 0000421f000000ff, Mem[0000000020800040] = 6600b270, %asi = 80
	stba	%l7,[%o1+0x040]%asi	! Mem[0000000020800040] = ff00b270
!	Mem[0000000030041408] = 1800f9f4, %l6 = 00000000000000ff
	ldstuba	[%i1+%o4]0x81,%l6	! %l6 = 0000000000000018
!	Mem[000000001008143e] = ffffa0ff, %l3 = 00000000000000ff
	ldstub	[%i2+0x03e],%l3		! %l3 = 00000000000000a0
!	%l4 = 00000000fffba900, Mem[0000000010101410] = ff00006d
	stba	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000006d
!	%l6 = 0000000000000018, Mem[0000000030101400] = ac44d8c2
	stba	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 1844d8c2

p0_label_282:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00a9fbff, %l7 = 0000421f000000ff
	ldsba	[%i1+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101400] = ff000000, %l1 = 0000000000000097
	lduwa	[%i4+%g0]0x80,%l1	! %l1 = 00000000ff000000
!	Mem[0000000030001410] = 00000000, %l4 = 00000000fffba900
	lduba	[%i0+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141410] = 79bf2e00, %f19 = 00000000
	lda	[%i5+%o5]0x89,%f19	! %f19 = 79bf2e00
!	Mem[00000000300c1408] = 0000006d, %l6 = 0000000000000018
	lduba	[%i3+%o4]0x89,%l6	! %l6 = 000000000000006d
!	Mem[0000000010001404] = 61d05459, %f18 = ffffff00
	ld	[%i0+0x004],%f18	! %f18 = 61d05459
!	%l0 = 00000000000000ff, Mem[0000000010101408] = 000000ff18ffff00
	stxa	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000000000ff
!	Mem[0000000010141408] = ffffffff, %l7 = 0000000000000000
	lduba	[%i5+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000020800000] = 00ffa840, %l4 = 0000000000000000, %asi = 80
	lduha	[%o1+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041410] = 00000000, %l2 = 0000000000000027
	lduha	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000

p0_label_283:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 00ff0000, %l0 = 00000000000000ff
	ldstuba	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000000
!	%l5 = 0000000000000000, Mem[00000000100c1410] = 0000ffff
	stba	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000ff00
!	Mem[0000000030101410] = ffa0ffff, %l7 = 00000000000000ff
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 00000000ffa0ffff
!	%l1 = 00000000ff000000, Mem[0000000010041410] = 00000000
	stba	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%l6 = 0000006d, %l7 = ffa0ffff, Mem[0000000010041410] = 00000000 ff000000
	stda	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000006d ffa0ffff
!	%l2 = 0000000000000000, Mem[0000000021800040] = 0043b900
	stb	%l2,[%o3+0x040]		! Mem[0000000021800040] = 0043b900
!	%l3 = 00000000000000a0, Mem[0000000010141410] = d9000000ff000000
	stxa	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000000000a0
!	Mem[0000000030181400] = 790000ff, %l1 = 00000000ff000000
	ldstuba	[%i6+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000010041430] = 00000000, %asi = 80
	stwa	%l5,[%i1+0x030]%asi	! Mem[0000000010041430] = 00000000
!	%f5  = 00000000, %f12 = 2550c44e, %f30 = cf14ffa0 ffffa0ff
	fsmuld	%f5 ,%f12,%f30		! %f30 = 00000000 00000000

p0_label_284:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff000000, %l6 = 000000000000006d
	ldsha	[%i4+%g0]0x80,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000030101410] = ff000000, %l7 = 00000000ffa0ffff
	lduha	[%i4+%o5]0x89,%l7	! %l7 = 0000000000000000
!	%l3 = 00000000000000a0, %l2 = 0000000000000000, %l0  = 0000000000000000
	mulx	%l3,%l2,%l0		! %l0 = 0000000000000000
!	Mem[0000000030081408] = 00000000, %l7 = 0000000000000000
	ldsha	[%i2+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[000000001000141d] = 000000cc, %l2 = 0000000000000000, %asi = 80
	lduba	[%i0+0x01d]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = 000000ff, %l4 = 00000000000000ff
	ldsba	[%i5+%g0]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010101408] = 00000000, %l0 = 0000000000000000
	ldsba	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1410] = 00ff0000, %l3 = 00000000000000a0
	ldswa	[%i3+%o5]0x80,%l3	! %l3 = 0000000000ff0000
!	Mem[0000000030041410] = 00000000, %l7 = 0000000000000000
	ldsha	[%i1+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = 00000059, %f25 = 00001800
	lda	[%i3+%g0]0x88,%f25	! %f25 = 00000059

p0_label_285:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000010141420] = 000000d9 000000ff, %asi = 80
	stda	%l0,[%i5+0x020]%asi	! Mem[0000000010141420] = 00000000 000000ff
!	%l2 = 00000000, %l3 = 00ff0000, Mem[0000000030001410] = 00000000 1bd9f4a7
	stda	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000 00ff0000
!	Mem[00000000300c1408] = 6d000000, %l3 = 0000000000ff0000
	swapa	[%i3+%o4]0x81,%l3	! %l3 = 000000006d000000
!	%f0  = ff000079 00000000, Mem[0000000030081410] = ffffffff ff000000
	stda	%f0 ,[%i2+%o5]0x89	! Mem[0000000030081410] = ff000079 00000000
!	Mem[00000000300c1400] = ff000000, %l2 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l2	! %l2 = 00000000ff000000
!	Mem[0000000030081400] = 18000000, %l2 = 00000000ff000000
	ldstuba	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000018
!	%f24 = 79647692 00000059, Mem[0000000010101400] = ff000000 00000000
	std	%f24,[%i4+%g0]		! Mem[0000000010101400] = 79647692 00000059
!	Mem[0000000030041408] = ff00f9f4, %l2 = 0000000000000018
	ldstuba	[%i1+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[0000000010181408] = 000018000c71e86d, %asi = 80
	stxa	%l1,[%i6+0x008]%asi	! Mem[0000000010181408] = 00000000000000ff
!	Mem[0000000010001420] = 80000000, %l4 = ffffffff, %l0 = 00000000
	add	%i0,0x20,%g1
	casa	[%g1]0x80,%l4,%l0	! %l0 = 0000000080000000

p0_label_286:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1418] = 00000000, %f7  = aaecd5f7
	lda	[%i3+0x018]%asi,%f7 	! %f7 = 00000000
!	%l3 = 000000006d000000, %l0 = 0000000080000000, %l4 = ffffffffffffffff
	and	%l3,%l0,%l4		! %l4 = 0000000000000000
!	Mem[0000000010081408] = f7c943ff, %l6 = ffffffffffffff00
	lduwa	[%i2+%o4]0x88,%l6	! %l6 = 00000000f7c943ff
!	Mem[0000000010181420] = a55a73b640d11cbf, %l6 = 00000000f7c943ff
	ldx	[%i6+0x020],%l6		! %l6 = a55a73b640d11cbf
!	%l2 = 00000000000000ff, %l7 = 0000000000000000, %l3 = 000000006d000000
	xor	%l2,%l7,%l3		! %l3 = 00000000000000ff
!	Mem[0000000030181408] = 000000ff, %l1 = 00000000000000ff
	lduwa	[%i6+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030041408] = ff00f9f4, %l2 = 00000000000000ff
	ldswa	[%i1+%o4]0x81,%l2	! %l2 = ffffffffff00f9f4
!	Mem[0000000010141410] = 000000a0, %l7 = 0000000000000000
	lduha	[%i5+%o5]0x88,%l7	! %l7 = 00000000000000a0
!	Mem[0000000010141408] = ffffffff, %l7 = 00000000000000a0
	lduba	[%i5+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141410] = 000000a0, %l4 = 0000000000000000
	ldsha	[%i5+%o5]0x88,%l4	! %l4 = 00000000000000a0

p0_label_287:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081424] = a7f4d91b, %l5 = 00000000, %l0 = 80000000
	add	%i2,0x24,%g1
	casa	[%g1]0x80,%l5,%l0	! %l0 = 00000000a7f4d91b
!	%l0 = 00000000a7f4d91b, immd = fffffffffffff6d9, %l3  = 00000000000000ff
	mulx	%l0,-0x927,%l3		! %l3 = fffff9fece10f9e3
!	%l3 = fffff9fece10f9e3, Mem[00000000201c0001] = ff791a10
	stb	%l3,[%o0+0x001]		! Mem[00000000201c0000] = ffe31a10
!	Mem[0000000010001420] = 80000000, %l7 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x020]%asi,%l7	! %l7 = 0000000080000000
!	Mem[0000000010081408] = f7c943ff, %l2 = ffffffffff00f9f4
	ldstuba	[%i2+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%f2  = ff000000, Mem[0000000010081400] = ff00006d
	sta	%f2 ,[%i2+%g0]0x80	! Mem[0000000010081400] = ff000000
!	Code Fragment 4, seed = 46523
p0_fragment_29:
!	%l0 = 00000000a7f4d91b
	setx	0xcb2186ef11db754e,%g7,%l0 ! %l0 = cb2186ef11db754e
!	%l1 = 00000000000000ff
	setx	0xa528ce8c282640f9,%g7,%l1 ! %l1 = a528ce8c282640f9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = cb2186ef11db754e
	setx	0x67db9a135d20d8b4,%g7,%l0 ! %l0 = 67db9a135d20d8b4
!	%l1 = a528ce8c282640f9
	setx	0xbca086d406bebf7f,%g7,%l1 ! %l1 = bca086d406bebf7f
p0_fragment_29_end:
!	%l6 = a55a73b640d11cbf, Mem[0000000030081408] = 00000000
	stwa	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 40d11cbf
!	%l5 = 0000000000000000, Mem[0000000030001400] = 00000018
	stwa	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	%f5  = 00000000, Mem[0000000010081410] = 607f159a
	sta	%f5 ,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000

p0_label_288:
!	Starting 10 instruction Load Burst
!	Mem[000000001014143a] = ff000000, %l5 = 0000000000000000, %asi = 80
	lduha	[%i5+0x03a]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l0 = 67db9a135d20d8b4
	lduba	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081408] = 40d11cbf, %l0 = 0000000000000000
	ldsha	[%i2+%o4]0x81,%l0	! %l0 = 00000000000040d1
!	Mem[0000000010141408] = ffffffff, %l1 = bca086d406bebf7f
	ldsha	[%i5+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030001408] = a72422ff, %l7 = 0000000080000000
	ldswa	[%i0+%o4]0x89,%l7	! %l7 = ffffffffa72422ff
!	Mem[00000000300c1400] = 00000000, %l1 = ffffffffffffffff
	ldswa	[%i3+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101408] = ff000000 00000000, %l6 = 40d11cbf, %l7 = a72422ff
	ldda	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000000 00000000ff000000
!	Mem[0000000010081410] = ffa0ffff00000000, %f20 = 9a157f60 ffffa0ff
	ldda	[%i2+%o5]0x88,%f20	! %f20 = ffa0ffff 00000000
!	Mem[0000000010081408] = ff43c9f7, %l1 = 0000000000000000
	ldswa	[%i2+%o4]0x80,%l1	! %l1 = ffffffffff43c9f7
!	Mem[0000000030081408] = bf1cd140, %l7 = 00000000ff000000
	lduwa	[%i2+%o4]0x89,%l7	! %l7 = 00000000bf1cd140

p0_label_289:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000040d1, Mem[0000000030081410] = 00000000
	stba	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000d1
!	%f12 = 2550c44e 00000000, Mem[0000000010141410] = 000000a0 00000000
	stda	%f12,[%i5+%o5]0x88	! Mem[0000000010141410] = 2550c44e 00000000
!	%l2 = 000000ff, %l3 = ce10f9e3, Mem[0000000030041400] = 6de8710c 00000000
	stda	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff ce10f9e3
!	%l0 = 00000000000040d1, Mem[0000000010041408] = fffba900
	stha	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = fffb40d1
!	Mem[0000000030001400] = 00000000, %l3 = fffff9fece10f9e3
	ldstuba	[%i0+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[000000001010142b] = 00000000, %l7 = 00000000bf1cd140
	ldstub	[%i4+0x02b],%l7		! %l7 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000030141410] = 002ebf79
	stba	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = 002ebf79
!	%f4  = 00ff0000 00000000, %l0 = 00000000000040d1
!	Mem[0000000010001408] = 00ff0018000000ff
	add	%i0,0x008,%g1
	stda	%f4,[%g1+%l0]ASI_PST16_P ! Mem[0000000010001408] = 00ff001800000000
!	Mem[00000000100c1408] = 00180000, %l2 = 00000000000000ff
	ldstuba	[%i3+%o4]0x88,%l2	! %l2 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010001408] = 00ff0018
	stba	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 00ff0018

p0_label_290:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = a7ff226d, %f15 = 900a6200
	lda	[%i0+%g0]0x80,%f15	! %f15 = a7ff226d
!	Mem[0000000030141410] = 002ebf79 002ebfff, %l6 = 00000000, %l7 = 00000000
	ldda	[%i5+%o5]0x81,%l6	! %l6 = 00000000002ebf79 00000000002ebfff
!	Mem[0000000030181400] = ff00007900000000, %l1 = ffffffffff43c9f7
	ldxa	[%i6+%g0]0x81,%l1	! %l1 = ff00007900000000
!	Mem[0000000030181408] = 000000ff, %l3 = 0000000000000000
	lduwa	[%i6+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1410] = 79bf2eff, %l3 = 00000000000000ff
	lduba	[%i3+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141400] = 6d22ffa7, %f22 = ff000000
	lda	[%i5+%g0]0x81,%f22	! %f22 = 6d22ffa7
!	Mem[0000000010141410] = 00000000, %l2 = 0000000000000000
	lduwa	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000020800040] = ff00b270, %l2 = 0000000000000000
	lduh	[%o1+0x040],%l2		! %l2 = 000000000000ff00
!	Mem[00000000300c1400] = 00000000, %l3 = 00000000000000ff
	ldswa	[%i3+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1400] = 59000000, %l6 = 00000000002ebf79
	ldsh	[%i3+%g0],%l6		! %l6 = 0000000000005900

p0_label_291:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (57)
!	%f11 = ff01ffff, Mem[0000000030181410] = 0000ffff
	sta	%f11,[%i6+%o5]0x89	! Mem[0000000030181410] = ff01ffff
!	Mem[0000000030081408] = 40d11cbf, %l3 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l3	! %l3 = 0000000000000040
!	Mem[0000000010041428] = a724226d, %l6 = 0000000000005900, %asi = 80
	swapa	[%i1+0x028]%asi,%l6	! %l6 = 00000000a724226d
!	%f26 = a7ff226d, %f0  = ff000079
	fcmpes	%fcc0,%f26,%f0 		! %fcc0 = 2
!	%l0 = 00000000000040d1, Mem[0000000010101425] = 0000006d, %asi = 80
	stba	%l0,[%i4+0x025]%asi	! Mem[0000000010101424] = 00d1006d
!	%l2 = 0000ff00, %l3 = 00000040, Mem[0000000030101410] = ff000000 cf14ffa0
	stda	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000ff00 00000040
!	Mem[0000000010001408] = 1800ff00, %l1 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l1	! %l1 = 000000001800ff00
!	Mem[0000000010141408] = ffffffff, %l2 = 000000000000ff00
	swapa	[%i5+%o4]0x80,%l2	! %l2 = 00000000ffffffff
!	%l0 = 000040d1, %l1 = 1800ff00, Mem[0000000010141410] = 00000000 4ec45025
	stda	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 000040d1 1800ff00
!	Mem[0000000020800000] = 00ffa840, %l2 = 00000000ffffffff
	ldstuba	[%o1+0x000]%asi,%l2	! %l2 = 0000000000000000

p0_label_292:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 000000ff 6d000000, %l4 = 000000a0, %l5 = 00000000
	ldda	[%i4+%o5]0x88,%l4	! %l4 = 000000006d000000 00000000000000ff
!	Mem[00000000100c1400] = 59000000, %l2 = 0000000000000000
	ldsba	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000059
!	Mem[0000000010041400] = 000000ff ffffff00, %l6 = a724226d, %l7 = 002ebfff
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 00000000000000ff 00000000ffffff00
!	Mem[0000000010001410] = ff00006d, %l6 = 00000000000000ff
	ldsba	[%i0+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030181400] = ff00007900000000, %l4 = 000000006d000000
	ldxa	[%i6+%g0]0x81,%l4	! %l4 = ff00007900000000
!	Mem[0000000010101422] = 00ff0018, %l2 = 0000000000000059
	lduh	[%i4+0x022],%l2		! %l2 = 0000000000000018
!	Mem[0000000030001400] = 000000ff, %l0 = 00000000000040d1
	ldsha	[%i0+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000300c1410] = ff2ebf79, %l5 = 00000000000000ff
	ldsha	[%i3+%o5]0x81,%l5	! %l5 = ffffffffffffff2e
!	Mem[0000000010101408] = ff00000000000000, %f8  = e9b25066 b8a8ee42
	ldda	[%i4+%o4]0x88,%f8 	! %f8  = ff000000 00000000
!	Mem[0000000010141400] = 000000ff, %l7 = 00000000ffffff00
	ldsba	[%i5+%g0]0x88,%l7	! %l7 = ffffffffffffffff

p0_label_293:
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = ffe31a10, %l2 = 0000000000000018
	ldstuba	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1401] = 59000000, %l6 = ffffffffffffffff
	ldstuba	[%i3+0x001]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081408] = f7c943ff, %l4 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l4	! %l4 = 00000000f7c943ff
!	Code Fragment 3, seed = 58613
p0_fragment_30:
!	%l0 = 00000000000000ff
	setx	0xfe0abcc9ca10557e,%g7,%l0 ! %l0 = fe0abcc9ca10557e
!	%l1 = 000000001800ff00
	setx	0x84653df533ecea29,%g7,%l1 ! %l1 = 84653df533ecea29
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = fe0abcc9ca10557e
	setx	0x2eafeaef2242fae4,%g7,%l0 ! %l0 = 2eafeaef2242fae4
!	%l1 = 84653df533ecea29
	setx	0x9e3a002506970aaf,%g7,%l1 ! %l1 = 9e3a002506970aaf
p0_fragment_30_end:
!	Mem[00000000300c1410] = 79bf2eff, %l4 = 00000000f7c943ff
	swapa	[%i3+%o5]0x89,%l4	! %l4 = 0000000079bf2eff
!	%f16 = ff00006d ff000000, Mem[0000000010041408] = d140fbff 00000000
	stda	%f16,[%i1+%o4]0x80	! Mem[0000000010041408] = ff00006d ff000000
!	Mem[0000000030101410] = 0000ff00, %l3 = 0000000000000040
	swapa	[%i4+%o5]0x89,%l3	! %l3 = 000000000000ff00
!	%l5 = ffffffffffffff2e, Mem[0000000021800180] = ffff73f0
	stb	%l5,[%o3+0x180]		! Mem[0000000021800180] = 2eff73f0
!	Randomly selected nop
	nop
!	%f16 = ff00006d, %f22 = 6d22ffa7, %f15 = a7ff226d
	fadds	%f16,%f22,%f15		! %f15 = ff00006d

p0_label_294:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ff00006dff000000, %l7 = ffffffffffffffff
	ldxa	[%i1+%o4]0x80,%l7	! %l7 = ff00006dff000000
!	Mem[0000000030141400] = 6d22ffa7, %l2 = 00000000000000ff
	lduwa	[%i5+%g0]0x81,%l2	! %l2 = 000000006d22ffa7
!	%l1 = 9e3a002506970aaf, imm = fffffffffffff779, %l4 = 0000000079bf2eff
	xnor	%l1,-0x887,%l4		! %l4 = 9e3a002506970229
!	Mem[0000000010041400] = 00ffffffff000000, %l5 = ffffffffffffff2e
	ldxa	[%i1+%g0]0x88,%l5	! %l5 = 00ffffffff000000
!	Mem[0000000010081410] = 00000000, %l5 = 00ffffffff000000
	ldsha	[%i2+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[000000001000140c] = 00000000, %f26 = a7ff226d
	ld	[%i0+0x00c],%f26	! %f26 = 00000000
!	Mem[0000000030041400] = ff000000, %l2 = 000000006d22ffa7
	lduba	[%i1+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101400] = 1844d8c2ffffff00, %l5 = 0000000000000000
	ldxa	[%i4+%g0]0x81,%l5	! %l5 = 1844d8c2ffffff00
!	Mem[0000000030101400] = 00ffffffc2d84418, %f0  = ff000079 00000000
	ldda	[%i4+%g0]0x89,%f0 	! %f0  = 00ffffff c2d84418
!	Mem[00000000100c1400] = 59ff0000, %f18 = 61d05459
	lda	[%i3+%g0]0x80,%f18	! %f18 = 59ff0000

p0_label_295:
!	Starting 10 instruction Store Burst
!	Mem[000000001014143e] = 79bf2e00, %l0 = 2eafeaef2242fae4
	ldstuba	[%i5+0x03e]%asi,%l0	! %l0 = 000000000000002e
!	%f0  = 00ffffff c2d84418, %l3 = 000000000000ff00
!	Mem[0000000030101430] = 418fa3244ec45025
	add	%i4,0x030,%g1
	stda	%f0,[%g1+%l3]ASI_PST8_S ! Mem[0000000030101430] = 418fa3244ec45025
!	%l1 = 9e3a002506970aaf, Mem[00000000100c1400] = 000000000000ff59
	stxa	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = 9e3a002506970aaf
!	%l0 = 000000000000002e, Mem[0000000010141421] = 00000000
	stb	%l0,[%i5+0x021]		! Mem[0000000010141420] = 002e0000
!	%l6 = 00000000, %l7 = ff000000, Mem[00000000100c1430] = 267c7766 ff000000, %asi = 80
	stda	%l6,[%i3+0x030]%asi	! Mem[00000000100c1430] = 00000000 ff000000
!	%l0 = 0000002e, %l1 = 06970aaf, Mem[0000000030081400] = 000000ff 0c000000
	stda	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000002e 06970aaf
!	%f10 = 00f12a00 ff01ffff, %l3 = 000000000000ff00
!	Mem[0000000030101428] = 7c7701b6552af12f
	add	%i4,0x028,%g1
	stda	%f10,[%g1+%l3]ASI_PST32_SL ! Mem[0000000030101428] = 7c7701b6552af12f
!	Mem[0000000010141410] = 000040d1, %l4 = 0000000006970229, %asi = 80
	swapa	[%i5+0x010]%asi,%l4	! %l4 = 00000000000040d1
!	%f18 = 59ff0000 79bf2e00, Mem[0000000010181408] = 00000000 ff000000
	stda	%f18,[%i6+%o4]0x88	! Mem[0000000010181408] = 59ff0000 79bf2e00
!	Mem[00000000300c1408] = 00ff0000, %l1 = 0000000006970aaf
	swapa	[%i3+%o4]0x81,%l1	! %l1 = 0000000000ff0000

p0_label_296:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 6d000000ffffa0ff, %l6 = 0000000000000000
	ldx	[%i1+%o5],%l6		! %l6 = 6d000000ffffa0ff
!	Mem[0000000010181430] = 80000000000000ff, %l7 = ff00006dff000000
	ldx	[%i6+0x030],%l7		! %l7 = 80000000000000ff
!	Mem[00000000218001c0] = 5ac7da20, %l6 = 6d000000ffffa0ff
	ldsh	[%o3+0x1c0],%l6		! %l6 = 0000000000005ac7
!	%l7 = 80000000000000ff, imm = 0000000000000eef, %l5 = 1844d8c2ffffff00
	addc	%l7,0xeef,%l5		! %l5 = 8000000000000fee
!	%f1  = c2d84418, %f15 = ff00006d, %f15 = ff00006d
	fdivs	%f1 ,%f15,%f15		! %f15 = 03584360
!	Mem[00000000100c1415] = 00000000, %l3 = 000000000000ff00, %asi = 80
	ldsba	[%i3+0x015]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041400] = 000000ff ce10f9e3 ff00f9f4 18000000
!	Mem[0000000030041410] = 00000000 0000ff00 00000000 ffffe45a
!	Mem[0000000030041420] = 79647692 a7f4d91b e557ba48 ff00bf20
!	Mem[0000000030041430] = ffd25dff 00000000 cf14ffa0 ffffa0ff
	ldda	[%i1+%g0]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030041400
!	Mem[0000000010181400] = c2d844ac, %l2 = 0000000000000000
	ldswa	[%i6+%g0]0x88,%l2	! %l2 = ffffffffc2d844ac
!	Mem[0000000030081408] = bf1cd1ff, %l1 = 0000000000ff0000
	lduba	[%i2+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001410] = 002ebf796d0000ff, %l1 = 00000000000000ff
	ldxa	[%i0+%o5]0x88,%l1	! %l1 = 002ebf796d0000ff

p0_label_297:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000005ac7, immd = fffff2bc, %y  = 00000059
	udiv	%l6,-0xd44,%l4		! %l4 = 0000000000000059
	mov	%l0,%y			! %y = 0000002e
!	%l4 = 0000000000000059, Mem[0000000010001408] = 00000000
	stba	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000059
!	Mem[0000000030081400] = 0000002e, %l5 = 8000000000000fee
	ldstuba	[%i2+%g0]0x89,%l5	! %l5 = 000000000000002e
!	Mem[0000000010141400] = ff000000, %l3 = 0000000000000000
	swapa	[%i5+%g0]0x80,%l3	! %l3 = 00000000ff000000
!	%l6 = 0000000000005ac7, Mem[0000000030001410] = 00000000
	stha	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 00005ac7
!	%f2  = ff000000, %f4  = 00ff0000, %f0  = 00ffffff c2d84418
	fsmuld	%f2 ,%f4 ,%f0 		! %f0  = c00fe000 00000000
!	Mem[0000000030181410] = ffff01ff, %l0 = 000000000000002e
	ldstuba	[%i6+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%l5 = 000000000000002e, Mem[0000000010181400] = ac44d8c2
	stwa	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000002e
	membar	#Sync			! Added by membar checker (58)
!	%l6 = 00005ac7, %l7 = 000000ff, Mem[0000000030041400] = ff000000 e3f910ce
	stda	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 00005ac7 000000ff
!	%f10 = 00f12a00, Mem[0000000030141410] = 79bf2e00
	sta	%f10,[%i5+%o5]0x89	! Mem[0000000030141410] = 00f12a00

p0_label_298:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081433] = 000000ff, %l1 = 002ebf796d0000ff, %asi = 80
	ldsba	[%i2+0x033]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001410] = ff00006d, %l2 = ffffffffc2d844ac
	ldswa	[%i0+%o5]0x80,%l2	! %l2 = ffffffffff00006d
!	Mem[00000000300c1400] = 00000000, %l2 = ffffffffff00006d
	lduba	[%i3+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = 00005ac7, %l2 = 0000000000000000
	lduha	[%i1+%g0]0x89,%l2	! %l2 = 0000000000005ac7
!	%l6 = 0000000000005ac7, %l6 = 0000000000005ac7, %l1 = ffffffffffffffff
	addc	%l6,%l6,%l1		! %l1 = 000000000000b58e
!	Mem[00000000100c1410] = 0000ff00, %f15 = 03584360
	lda	[%i3+%o5]0x88,%f15	! %f15 = 0000ff00
!	Mem[0000000010081430] = 000000ff000000ff, %l6 = 0000000000005ac7
	ldx	[%i2+0x030],%l6		! %l6 = 000000ff000000ff
!	Mem[00000000300c1408] = 06970aaf, %l1 = 000000000000b58e
	ldswa	[%i3+%o4]0x81,%l1	! %l1 = 0000000006970aaf
!	Mem[0000000010001408] = 59000000, %l1 = 0000000006970aaf
	lduwa	[%i0+%o4]0x80,%l1	! %l1 = 0000000059000000
!	Mem[00000000211c0001] = 000038a0, %l0 = 00000000000000ff
	ldub	[%o2+0x001],%l0		! %l0 = 0000000000000000

p0_label_299:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = ff43c9f7, %l4 = 0000000000000059
	swapa	[%i3+%o5]0x81,%l4	! %l4 = 00000000ff43c9f7
!	%f25 = 92766479, Mem[0000000030081400] = 000000ff
	sta	%f25,[%i2+%g0]0x89	! Mem[0000000030081400] = 92766479
!	Mem[0000000010041410] = 0000006d, %l0 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l0	! %l0 = 000000000000006d
!	%l2 = 0000000000005ac7, Mem[0000000030081410] = 000000d1
	stwa	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 00005ac7
!	%f21 = 00000000, Mem[00000000100c1410] = 0000ff00
	sta	%f21,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	%l0 = 0000006d, %l1 = 59000000, Mem[0000000030001410] = c75a0000 0000ff00
	stda	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000006d 59000000
!	%l2 = 0000000000005ac7, Mem[0000000010081400] = ff000000ff000000
	stxa	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000005ac7
!	%f30 = ffa0ffff, %f26 = 20bf00ff
	fsqrts	%f30,%f26		! %f26 = ffe0ffff
!	%f3  = 0c71e86d, %f13 = 00000000, %f18 = 00000018
	fmuls	%f3 ,%f13,%f18		! %f18 = 00000000
!	%l2 = 00005ac7, %l3 = ff000000, Mem[0000000030181410] = ffff01ff 00000000
	stda	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = 00005ac7 ff000000

p0_label_300:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00ff0000 00000000, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000000 0000000000ff0000
!	Mem[0000000010181408] = 002ebf79, %l1 = 0000000059000000
	lduha	[%i6+%o4]0x80,%l1	! %l1 = 000000000000002e
!	Mem[0000000030001408] = ff2224a700000000, %f12 = 2550c44e 00000000
	ldda	[%i0+%o4]0x81,%f12	! %f12 = ff2224a7 00000000
!	Mem[00000000201c0000] = ffe31a10, %l5 = 000000000000002e
	ldsb	[%o0+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010041400] = ff000000, %l5 = 00000000ffffffff
	swapa	[%i1+%g0]0x88,%l5	! %l5 = 00000000ff000000
!	Mem[00000000100c1410] = 00000000, %l4 = 00000000ff43c9f7
	lduha	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000
!	%l4 = 00000000, %l5 = ff000000, Mem[0000000030101410] = 40000000 40000000
	stda	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000 ff000000
!	Mem[0000000030041410] = 00000000, %l3 = 00000000ff000000
	ldsha	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l6 = 0000000000000000
	lduwa	[%i6+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = af0a9706, %l7 = 0000000000ff0000
	ldsba	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000006

p0_label_301:
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000006d, Mem[0000000010041410] = 00000000
	stha	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 006d0000
!	Mem[0000000010141420] = 002e0000, %l0 = 000000000000006d
	swap	[%i5+0x020],%l0		! %l0 = 00000000002e0000
!	Mem[0000000010001408] = 00000059, %l4 = 0000000000000000
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000059
!	%l3 = 0000000000000000, Mem[0000000010101410] = 0000006dff000000
	stxa	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010001410] = 6d0000ff
	stba	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 6d000000
!	%f24 = 1bd9f4a7, Mem[000000001004141c] = 000000cc
	st	%f24,[%i1+0x01c]	! Mem[000000001004141c] = 1bd9f4a7
!	%l6 = 0000000000000000, Mem[0000000030101408] = ff2ebf79
	stwa	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	%l2 = 0000000000005ac7, Mem[0000000020800001] = ffffa840
	stb	%l2,[%o1+0x001]		! Mem[0000000020800000] = ffc7a840
!	Mem[000000001018140e] = 0000ff59, %l3 = 0000000000000000
	ldstub	[%i6+0x00e],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010081410] = 00000000, %l5 = 00000000ff000000
	swapa	[%i2+%o5]0x80,%l5	! %l5 = 0000000000000000

p0_label_302:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081438] = cf14ffa0ffffffff, %f8  = ff000000 00000000
	ldd	[%i2+0x038],%f8 	! %f8  = cf14ffa0 ffffffff
!	Mem[0000000010181430] = 80000000 000000ff, %l0 = 002e0000, %l1 = 0000002e, %asi = 80
	ldda	[%i6+0x030]%asi,%l0	! %l0 = 0000000080000000 00000000000000ff
!	Mem[0000000010041424] = 61d054ff, %f24 = 1bd9f4a7
	lda	[%i1+0x024]%asi,%f24	! %f24 = 61d054ff
!	Mem[0000000010001410] = 0000006d79bf2e00, %l3 = 00000000000000ff
	ldxa	[%i0+%o5]0x80,%l3	! %l3 = 0000006d79bf2e00
!	Mem[00000000300c1408] = af0a9706, %l4 = 0000000000000059
	lduwa	[%i3+%o4]0x89,%l4	! %l4 = 00000000af0a9706
!	Mem[00000000300c1410] = 40000000 59000000, %l0 = 80000000, %l1 = 000000ff
	ldda	[%i3+%o5]0x89,%l0	! %l0 = 0000000059000000 0000000040000000
!	Mem[0000000030081400] = 79647692, %f15 = 0000ff00
	lda	[%i2+%g0]0x81,%f15	! %f15 = 79647692
!	Code Fragment 4, seed = 438439
p0_fragment_31:
!	%l0 = 0000000059000000
	setx	0xb1bac4e349b649ee,%g7,%l0 ! %l0 = b1bac4e349b649ee
!	%l1 = 0000000040000000
	setx	0xafcbe88c111d7399,%g7,%l1 ! %l1 = afcbe88c111d7399
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b1bac4e349b649ee
	setx	0x829b80fbaa5e0954,%g7,%l0 ! %l0 = 829b80fbaa5e0954
!	%l1 = afcbe88c111d7399
	setx	0xc69419417bb98e1f,%g7,%l1 ! %l1 = c69419417bb98e1f
p0_fragment_31_end:
!	Mem[0000000010081410] = ff000000 ffffa0ff, %l6 = 00000000, %l7 = 00000006
	ldda	[%i2+%o5]0x80,%l6	! %l6 = 00000000ff000000 00000000ffffa0ff
!	Mem[00000000201c0000] = ffe31a10, %l3 = 0000006d79bf2e00, %asi = 80
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 000000000000ffe3

p0_label_303:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ff000000, Mem[0000000030001400] = ff000000
	stba	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	%l6 = 00000000ff000000, Mem[0000000030101410] = 000000ff00000000
	stxa	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000ff000000
!	Mem[00000000100c142c] = 100d421f, %l4 = 00000000af0a9706, %asi = 80
	swapa	[%i3+0x02c]%asi,%l4	! %l4 = 00000000100d421f
!	Mem[0000000030081400] = 79647692, %l0 = 00000000aa5e0954
	swapa	[%i2+%g0]0x81,%l0	! %l0 = 0000000079647692
!	%f12 = ff2224a7 00000000, %l7 = 00000000ffffa0ff
!	Mem[0000000030181410] = 00005ac7ff000000
	add	%i6,0x010,%g1
	stda	%f12,[%g1+%l7]ASI_PST8_S ! Mem[0000000030181410] = ff2224a700000000
!	%f20 = 00ff0000 00000000, Mem[00000000100c1408] = ff001800 00000000
	std	%f20,[%i3+%o4]		! Mem[00000000100c1408] = 00ff0000 00000000
!	Mem[00000000300c1408] = af0a9706, %l3 = 000000000000ffe3
	ldstuba	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000006
!	%f18 = 00000000 f4f900ff, Mem[00000000100c1408] = 00ff0000 00000000
	stda	%f18,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 f4f900ff
!	Mem[00000000211c0000] = 000038a0, %l1 = c69419417bb98e1f
	ldstub	[%o2+%g0],%l1		! %l1 = 0000000000000000
!	Mem[000000001004141a] = 00000000, %l3 = 0000000000000006
	ldstub	[%i1+0x01a],%l3		! %l3 = 0000000000000000

p0_label_304:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l3 = 0000000000000000
	lduha	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l7 = 00000000ffffa0ff
	ldsha	[%i3+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l2 = 0000000000005ac7
	ldswa	[%i6+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[000000001004143a] = 18000000, %l7 = 0000000000000000, %asi = 80
	lduha	[%i1+0x03a]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081410] = 000000ff, %f18 = 00000000
	lda	[%i2+%o5]0x88,%f18	! %f18 = 000000ff
!	Mem[0000000010041408] = ff00006d, %f2  = ff000000
	lda	[%i1+%o4]0x80,%f2 	! %f2 = ff00006d
!	Mem[0000000010101400] = 79647692, %l2 = 0000000000000000, %asi = 80
	lduwa	[%i4+0x000]%asi,%l2	! %l2 = 0000000079647692
!	Mem[0000000010041408] = 6d0000ff, %l3 = 0000000000000000
	ldswa	[%i1+%o4]0x88,%l3	! %l3 = 000000006d0000ff
!	Mem[0000000030041410] = 00000000, %l4 = 00000000100d421f
	ldswa	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181400] = 790000ff, %f2  = ff00006d
	lda	[%i6+%g0]0x89,%f2 	! %f2 = 790000ff

p0_label_305:
!	Starting 10 instruction Store Burst
!	%l0 = 79647692, %l1 = 00000000, Mem[00000000300c1400] = 00000000 00000000
	stda	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 79647692 00000000
!	Code Fragment 3, seed = 917861
p0_fragment_32:
!	%l0 = 0000000079647692
	setx	0xe3a76ba5019ee1fe,%g7,%l0 ! %l0 = e3a76ba5019ee1fe
!	%l1 = 0000000000000000
	setx	0x38303fece28fcea9,%g7,%l1 ! %l1 = 38303fece28fcea9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e3a76ba5019ee1fe
	setx	0xb62c67f674aab764,%g7,%l0 ! %l0 = b62c67f674aab764
!	%l1 = 38303fece28fcea9
	setx	0xa497fec9b48c1f2f,%g7,%l1 ! %l1 = a497fec9b48c1f2f
p0_fragment_32_end:
!	Mem[0000000010141400] = 00000000, %l3 = 000000006d0000ff
	swap	[%i5+%g0],%l3		! %l3 = 0000000000000000
!	Mem[0000000030001410] = 6d000000, %l1 = a497fec9b48c1f2f
	ldstuba	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = 00ff0000, %l4 = 0000000000000000
	swapa	[%i5+%o4]0x88,%l4	! %l4 = 0000000000ff0000
!	Mem[00000000100c1400] = 06970aaf, %l3 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l3	! %l3 = 0000000006970aaf
!	%l5 = 0000000000000000, Mem[0000000030001410] = 000000596d0000ff
	stxa	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000000000000000
!	%l3 = 0000000006970aaf, Mem[000000001000143c] = 000000ff
	sth	%l3,[%i0+0x03c]		! Mem[000000001000143c] = 0aaf00ff
!	Mem[00000000100c1400] = 00000000 25003a9e 00000000 f4f900ff
!	%f16 = e3f910ce ff000000 000000ff f4f900ff
!	%f20 = 00ff0000 00000000 5ae4ffff 00000000
!	%f24 = 61d054ff 92766479 ffe0ffff 48ba57e5
!	%f28 = 00000000 ff5dd2ff ffa0ffff a0ff14cf
	stda	%f16,[%i3+%g0]ASI_BLK_P	! Block Store to 00000000100c1400
!	%f30 = ffa0ffff a0ff14cf, %l3 = 0000000006970aaf
!	Mem[0000000030001428] = ffffe0ff79bf2e00
	add	%i0,0x028,%g1
	stda	%f30,[%g1+%l3]ASI_PST16_S ! Mem[0000000030001428] = ffa0ffffa0ff14cf

p0_label_306:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffe31a10, %l6 = 00000000ff000000, %asi = 80
	ldsha	[%o0+0x000]%asi,%l6	! %l6 = ffffffffffffffe3
!	Mem[0000000030101400] = c2d84418, %l6 = ffffffffffffffe3
	lduha	[%i4+%g0]0x89,%l6	! %l6 = 0000000000004418
!	Mem[0000000030041410] = 00ff0000 00000000, %l6 = 00004418, %l7 = 00000000
	ldda	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000000 0000000000ff0000
	membar	#Sync			! Added by membar checker (59)
!	Mem[00000000100c1400] = 000000ffce10f9e3, %f0  = c00fe000 00000000
	ldda	[%i3+%g0]0x88,%f0 	! %f0  = 000000ff ce10f9e3
!	Mem[0000000030081400] = aa5e0954, %f18 = 000000ff
	lda	[%i2+%g0]0x81,%f18	! %f18 = aa5e0954
!	Mem[0000000010141410] = 00ff001829029706, %f2  = 790000ff 0c71e86d
	ldda	[%i5+%o5]0x88,%f2 	! %f2  = 00ff0018 29029706
!	Mem[0000000010141400] = 6d0000ff, %l5 = 0000000000000000
	ldsba	[%i5+%g0]0x80,%l5	! %l5 = 000000000000006d
!	%f0  = 000000ff, %f30 = ffa0ffff, %f22 = 5ae4ffff 00000000
	fsmuld	%f0 ,%f30,%f22		! %f22 = fffc1fff e0000000
!	Mem[00000000100c1408] = ff00f9f4 ff000000, %l6 = 00000000, %l7 = 00ff0000
	ldda	[%i3+%o4]0x88,%l6	! %l6 = 00000000ff000000 00000000ff00f9f4
!	%f2  = 00ff0018, %f4  = 00ff0000
	fcmpes	%fcc3,%f2 ,%f4 		! %fcc3 = 2

p0_label_307:
!	Starting 10 instruction Store Burst
!	%f7  = 00000000, %f20 = 00ff0000, %f25 = 92766479
	fdivs	%f7 ,%f20,%f25		! %f25 = 00000000
!	%l6 = 00000000ff000000, Mem[0000000030041400] = c75a0000
	stha	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	%f5  = 00000000, Mem[0000000010101410] = 00000000
	sta	%f5 ,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	%f12 = ff2224a7 00000000, %l3 = 0000000006970aaf
!	Mem[0000000030041418] = 00000000ffffe45a
	add	%i1,0x018,%g1
	stda	%f12,[%g1+%l3]ASI_PST32_S ! Mem[0000000030041418] = ff2224a700000000
!	%l3 = 0000000006970aaf, Mem[0000000030101408] = 00000000
	stba	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = af000000
!	%l6 = 00000000ff000000, Mem[0000000030141410] = 00f12a00
	stwa	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = ff000000
!	Mem[0000000010081410] = 000000ff, %l7 = 00000000ff00f9f4
	ldstuba	[%i2+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%l5 = 000000000000006d, Mem[0000000030041400] = 00000000
	stwa	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000006d
!	%l0 = b62c67f674aab764, Mem[0000000021800180] = 2eff73f0, %asi = 80
	stha	%l0,[%o3+0x180]%asi	! Mem[0000000021800180] = b76473f0
!	Mem[0000000010081400] = 00000000 00005ac7 00000000 ff000000
!	%f0  = 000000ff ce10f9e3 00ff0018 29029706
!	%f4  = 00ff0000 00000000 303020bf 00000000
!	%f8  = cf14ffa0 ffffffff 00f12a00 ff01ffff
!	%f12 = ff2224a7 00000000 4ba90346 79647692
	stda	%f0 ,[%i2+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010081400

p0_label_308:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ff000000, %l6 = 00000000ff000000
	ldsha	[%i5+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = 00006d00, %l5 = 000000000000006d
	lduha	[%i1+%o5]0x88,%l5	! %l5 = 0000000000006d00
!	Mem[0000000030181400] = 790000ff, %l5 = 0000000000006d00
	ldsba	[%i6+%g0]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030001400] = 0000000000000000, %l4 = 0000000000ff0000
	ldxa	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = aa5e0954af0a9706, %l2 = 0000000079647692
	ldxa	[%i2+%g0]0x81,%l2	! %l2 = aa5e0954af0a9706
!	Mem[0000000010181420] = a55a73b6 40d11cbf, %l6 = 00000000, %l7 = 000000ff, %asi = 80
	ldda	[%i6+0x020]%asi,%l6	! %l6 = 00000000a55a73b6 0000000040d11cbf
!	Mem[0000000010041438] = 18000000ffff0034, %f16 = e3f910ce ff000000, %asi = 80
	ldda	[%i1+0x038]%asi,%f16	! %f16 = 18000000 ffff0034
!	Mem[0000000010041410] = ffa0ffff00006d00, %l6 = 00000000a55a73b6
	ldxa	[%i1+%o5]0x88,%l6	! %l6 = ffa0ffff00006d00
!	%l0 = b62c67f674aab764, %l7 = 0000000040d11cbf, %y  = 0000002e
	sdiv	%l0,%l7,%l3		! %l3 = 00000000000000b7
	mov	%l0,%y			! %y = 74aab764
!	Mem[00000000100c1400] = e3f910ce ff000000, %l4 = 00000000, %l5 = ffffffff
	ldda	[%i3+%g0]0x80,%l4	! %l4 = 00000000e3f910ce 00000000ff000000

p0_label_309:
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = ffe31a10, %l7 = 0000000040d11cbf
	ldstuba	[%o0+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001418] = 00000016, %l4 = 00000000e3f910ce
	ldstuba	[%i0+0x018]%asi,%l4	! %l4 = 0000000000000000
!	%l6 = ffa0ffff00006d00, Mem[0000000030181408] = 6de8710c000000ff
	stxa	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = ffa0ffff00006d00
!	Mem[0000000010141410] = 06970229, %l2 = 00000000af0a9706, %asi = 80
	swapa	[%i5+0x010]%asi,%l2	! %l2 = 0000000006970229
!	Mem[00000000100c1410] = 00ff000000000000, %l0 = b62c67f674aab764, %l5 = 00000000ff000000
	add	%i3,0x10,%g1
	casxa	[%g1]0x80,%l0,%l5	! %l5 = 00ff000000000000
!	Mem[0000000020800040] = ff00b270, %l0 = b62c67f674aab764
	ldstub	[%o1+0x040],%l0		! %l0 = 00000000000000ff
!	%f16 = 18000000, %f22 = fffc1fff, %f18 = aa5e0954
	fadds	%f16,%f22,%f18		! %f18 = fffc1fff
!	%l4 = 0000000000000000, Mem[0000000010041400] = 00ffffffffffffff
	stxa	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000000000000000
!	Mem[0000000030001410] = 00000000, %l6 = 0000000000006d00
	swapa	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000
!	%f21 = 00000000, Mem[0000000030001408] = ff2224a7
	sta	%f21,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000

p0_label_310:
!	Starting 10 instruction Load Burst
!	%f22 = fffc1fff, %f17 = ffff0034, %f22 = fffc1fff
	fadds	%f22,%f17,%f22		! %f22 = ffff0034
!	Mem[00000000300c1410] = 59000000, %l4 = 0000000000000000
	lduba	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181410] = 00000000aa000000, %f28 = 00000000 ff5dd2ff
	ldda	[%i6+%o5]0x80,%f28	! %f28 = 00000000 aa000000
	membar	#Sync			! Added by membar checker (60)
!	Mem[0000000010081408] = 06970229, %l5 = 00ff000000000000
	ldsba	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000006
!	Mem[0000000030101400] = c2d84418, %l1 = 0000000000000000
	lduha	[%i4+%g0]0x89,%l1	! %l1 = 0000000000004418
!	Mem[00000000100c1400] = e3f910ce ff000000, %l0 = 000000ff, %l1 = 00004418, %asi = 80
	ldda	[%i3+0x000]%asi,%l0	! %l0 = 00000000e3f910ce 00000000ff000000
!	Mem[0000000010181410] = 00000000, %l3 = 00000000000000b7
	ldsha	[%i6+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = 0000006d, %l2 = 0000000006970229
	lduwa	[%i0+%o5]0x80,%l2	! %l2 = 000000000000006d
!	Mem[000000001014143d] = 79bfff00, %l3 = 0000000000000000, %asi = 80
	lduba	[%i5+0x03d]%asi,%l3	! %l3 = 00000000000000bf
!	Mem[00000000100c142e] = 48ba57e5, %l0 = 00000000e3f910ce
	lduh	[%i3+0x02e],%l0		! %l0 = 00000000000057e5

p0_label_311:
!	Starting 10 instruction Store Burst
!	Mem[000000001004141c] = 1bd9f4a7, %l1 = ff000000, %l5 = 00000006
	add	%i1,0x1c,%g1
	casa	[%g1]0x80,%l1,%l5	! %l5 = 000000001bd9f4a7
!	%l0 = 00000000000057e5, Mem[0000000010181410] = 00000000
	stwa	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 000057e5
!	Mem[0000000030041408] = ff00f9f4, %l7 = 00000000000000ff
	swapa	[%i1+%o4]0x81,%l7	! %l7 = 00000000ff00f9f4
!	%l4 = 0000000000000000, Mem[0000000010101400] = 92766479
	stha	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 92760000
!	Mem[0000000010141408] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030141408] = ff000000
	stwa	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	Mem[0000000030081410] = 00005ac7, %l6 = 0000000000000000
	ldsha	[%i2+%o5]0x89,%l6	! %l6 = 0000000000005ac7
!	Mem[00000000211c0000] = ff0038a0, %l0 = 00000000000057e5
	ldstuba	[%o2+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[00000000300c1408] = ff970aaf, %l4 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	%l1 = 00000000ff000000, Mem[0000000010141400] = ff00006d
	stba	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = ff000000

p0_label_312:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 0000ff00, %l0 = 00000000000000ff
	ldswa	[%i3+%o5]0x88,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010001408] = 000000ff, %l7 = 00000000ff00f9f4
	lduba	[%i0+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000211c0000] = ff0038a0, %l2 = 000000000000006d
	ldsh	[%o2+%g0],%l2		! %l2 = ffffffffffffff00
!	Mem[0000000010101400] = 92760000, %l1 = 00000000ff000000
	lduba	[%i4+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141408] = 00000000, %l0 = 000000000000ff00
	lduha	[%i5+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1400] = 92766479, %l4 = 00000000000000ff
	ldswa	[%i3+%g0]0x81,%l4	! %l4 = ffffffff92766479
!	Mem[00000000201c0000] = ffe31a10, %l6 = 0000000000005ac7
	ldsh	[%o0+%g0],%l6		! %l6 = ffffffffffffffe3
!	Mem[00000000100c1424] = 92766479, %l4 = ffffffff92766479
	lduw	[%i3+0x024],%l4		! %l4 = 0000000092766479
!	Mem[0000000010181408] = 59ff000079bf2e00, %f4  = 00ff0000 00000000
	ldda	[%i6+%o4]0x88,%f4 	! %f4  = 59ff0000 79bf2e00
!	Mem[0000000030181410] = ff2224a7, %l0 = 0000000000000000
	ldsha	[%i6+%o5]0x81,%l0	! %l0 = ffffffffffffff22

p0_label_313:
!	Starting 10 instruction Store Burst
!	%f23 = e0000000, Mem[0000000010001408] = ff000000
	sta	%f23,[%i0+%o4]0x80	! Mem[0000000010001408] = e0000000
!	%l2 = ffffffffffffff00, Mem[0000000010141408] = ff000000
	stwa	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = ffffff00
!	%f6  = 303020bf 00000000, %l6 = ffffffffffffffe3
!	Mem[0000000030041428] = e557ba48ff00bf20
	add	%i1,0x028,%g1
	stda	%f6,[%g1+%l6]ASI_PST32_S ! Mem[0000000030041428] = 303020bf00000000
!	%f5  = 79bf2e00, Mem[0000000010141400] = ff000000
	sta	%f5 ,[%i5+%g0]0x88	! Mem[0000000010141400] = 79bf2e00
!	Mem[0000000010181400] = 2e000000, %l7 = 00000000000000ff
	swapa	[%i6+%g0]0x88,%l7	! %l7 = 000000002e000000
!	Mem[0000000030001410] = 006d0000, %l4 = 0000000092766479
	swapa	[%i0+%o5]0x89,%l4	! %l4 = 00000000006d0000
!	%l0 = ffffffffffffff22, Mem[0000000010101400] = 5900000092760000
	stxa	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffffffffffff22
!	Mem[0000000010081400] = e3f910ce ff000000 06970229 1800ff00
!	%f16 = 18000000 ffff0034 fffc1fff f4f900ff
!	%f20 = 00ff0000 00000000 ffff0034 e0000000
!	%f24 = 61d054ff 00000000 ffe0ffff 48ba57e5
!	%f28 = 00000000 aa000000 ffa0ffff a0ff14cf
	stda	%f16,[%i2+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010081400
!	%l1 = 0000000000000000, Mem[0000000010081408] = f4f900ff
	stba	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = f4f90000
!	%f23 = e0000000, %f17 = ffff0034, %f2  = 00ff0018
	fadds	%f23,%f17,%f2 		! %f2  = ffff0034

p0_label_314:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = af000000ff000000, %f2  = ffff0034 29029706
	ldda	[%i4+%o4]0x81,%f2 	! %f2  = af000000 ff000000
!	Mem[00000000300c1408] = af0a97ff, %l6 = ffffffffffffffe3
	ldsha	[%i3+%o4]0x89,%l6	! %l6 = ffffffffffff97ff
!	Mem[0000000010101408] = ff00000000000000, %l4 = 00000000006d0000
	ldxa	[%i4+%o4]0x88,%l4	! %l4 = ff00000000000000
!	Mem[00000000100c1408] = ff000000, %l6 = ffffffffffff97ff
	ldsba	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = 6d000000, %l0 = ffffffffffffff22
	ldswa	[%i0+%o5]0x88,%l0	! %l0 = 000000006d000000
!	Mem[0000000020800000] = ffc7a840, %l3 = 00000000000000bf
	lduh	[%o1+%g0],%l3		! %l3 = 000000000000ffc7
!	Mem[0000000010141400] = 79bf2e00, %f9  = ffffffff
	lda	[%i5+%g0]0x88,%f9 	! %f9 = 79bf2e00
!	Mem[0000000030141408] = 00000000, %f14 = 4ba90346
	lda	[%i5+%o4]0x81,%f14	! %f14 = 00000000
	membar	#Sync			! Added by membar checker (61)
!	Mem[000000001008143c] = ffffa0ff, %l3 = 000000000000ffc7
	ldsw	[%i2+0x03c],%l3		! %l3 = ffffffffffffa0ff
!	Mem[0000000010141408] = 00ffffff, %l2 = ffffffffffffff00
	lduha	[%i5+%o4]0x88,%l2	! %l2 = 000000000000ffff

p0_label_315:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000020800000] = ffc7a840, %asi = 80
	stha	%l6,[%o1+0x000]%asi	! Mem[0000000020800000] = 0000a840
!	Mem[0000000010181410] = e5570000, %l3 = ffffffffffffa0ff
	ldstuba	[%i6+%o5]0x80,%l3	! %l3 = 00000000000000e5
!	%f14 = 00000000 79647692, Mem[0000000010141408] = 00ffffff 00000000
	stda	%f14,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 79647692
!	%f2  = af000000 ff000000, Mem[00000000100c1400] = e3f910ce ff000000
	std	%f2 ,[%i3+%g0]		! Mem[00000000100c1400] = af000000 ff000000
!	Mem[0000000010001408] = 000000e0, %l0 = 000000006d000000
	ldstuba	[%i0+%o4]0x88,%l0	! %l0 = 00000000000000e0
!	%f18 = fffc1fff f4f900ff, Mem[0000000010041400] = 00000000 00000000
	stda	%f18,[%i1+%g0]0x88	! Mem[0000000010041400] = fffc1fff f4f900ff
!	%l7 = 000000002e000000, Mem[00000000300c1400] = 92766479
	stwa	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = 2e000000
!	Mem[0000000010081420] = 00000000, %l4 = ff00000000000000
	ldstub	[%i2+0x020],%l4		! %l4 = 0000000000000000
!	Mem[00000000211c0000] = ff0038a0, %l3 = 00000000000000e5
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	%l2 = 000000000000ffff, Mem[0000000010181410] = ff570000
	stw	%l2,[%i6+%o5]		! Mem[0000000010181410] = 0000ffff

p0_label_316:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1424] = 92766479, %l4 = 0000000000000000, %asi = 80
	ldswa	[%i3+0x024]%asi,%l4	! %l4 = ffffffff92766479
!	Mem[0000000010041438] = 18000000ffff0034, %l3 = 00000000000000ff
	ldx	[%i1+0x038],%l3		! %l3 = 18000000ffff0034
!	Mem[000000001018142c] = 00000079, %l6 = 0000000000000000, %asi = 80
	lduwa	[%i6+0x02c]%asi,%l6	! %l6 = 0000000000000079
!	Mem[00000000211c0001] = ff0038a0, %l4 = ffffffff92766479, %asi = 80
	lduba	[%o2+0x001]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141408] = 00000000, %f24 = 61d054ff
	lda	[%i5+%o4]0x89,%f24	! %f24 = 00000000
!	Mem[0000000030001408] = 0000000000000000, %l0 = 00000000000000e0
	ldxa	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081408] = 0000f9f4ff1ffcff, %f12 = ff2224a7 00000000
	ldda	[%i2+%o4]0x80,%f12	! %f12 = 0000f9f4 ff1ffcff
!	Mem[0000000030001408] = 00000000, %f0  = 000000ff
	lda	[%i0+%o4]0x89,%f0 	! %f0 = 00000000
!	Mem[00000000300c1408] = ff970aaf, %l3 = 18000000ffff0034
	ldsba	[%i3+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010001408] = ff000000, %l3 = ffffffffffffffff
	ldsba	[%i0+%o4]0x80,%l3	! %l3 = ffffffffffffffff

p0_label_317:
!	Starting 10 instruction Store Burst
!	%f30 = ffa0ffff a0ff14cf, %l1 = 0000000000000000
!	Mem[0000000010001420] = 000000ff00ff00ff
	add	%i0,0x020,%g1
	stda	%f30,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010001420] = 000000ff00ff00ff
!	%f30 = ffa0ffff a0ff14cf, Mem[0000000030101400] = 1844d8c2 ffffff00
	stda	%f30,[%i4+%g0]0x81	! Mem[0000000030101400] = ffa0ffff a0ff14cf
!	%f26 = ffe0ffff, Mem[0000000030141400] = 6d22ffa7
	sta	%f26,[%i5+%g0]0x81	! Mem[0000000030141400] = ffe0ffff
!	Mem[0000000020800040] = ff00b270, %l4 = 0000000000000000
	ldstub	[%o1+0x040],%l4		! %l4 = 00000000000000ff
!	%l7 = 000000002e000000, Mem[0000000010041400] = ff00f9f4
	stha	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000f9f4
!	Mem[000000001018140e] = 0000ff59, %l2 = 000000000000ffff
	ldstuba	[%i6+0x00e]%asi,%l2	! %l2 = 00000000000000ff
!	%f12 = 0000f9f4 ff1ffcff, %l4 = 00000000000000ff
!	Mem[0000000030041418] = ff2224a700000000
	add	%i1,0x018,%g1
	stda	%f12,[%g1+%l4]ASI_PST32_S ! Mem[0000000030041418] = 0000f9f4ff1ffcff
!	Code Fragment 4, seed = 698360
p0_fragment_33:
!	%l0 = 0000000000000000
	setx	0x16b4301bcfa3b066,%g7,%l0 ! %l0 = 16b4301bcfa3b066
!	%l1 = 0000000000000000
	setx	0x90543d464c697091,%g7,%l1 ! %l1 = 90543d464c697091
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 16b4301bcfa3b066
	setx	0x62ddf1bbf166d4cc,%g7,%l0 ! %l0 = 62ddf1bbf166d4cc
!	%l1 = 90543d464c697091
	setx	0xb8aae8e25ce7e017,%g7,%l1 ! %l1 = b8aae8e25ce7e017
p0_fragment_33_end:
!	Mem[00000000100c1408] = 000000ff, %l7 = 000000002e000000
	swapa	[%i3+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%l5 = 000000001bd9f4a7, Mem[0000000010081410] = 00000000
	stba	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = a7000000

p0_label_318:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ffffff22, %l0 = 62ddf1bbf166d4cc
	ldsha	[%i4+%g0]0x88,%l0	! %l0 = ffffffffffffff22
!	Mem[0000000030181410] = ff2224a7, %l6 = 0000000000000079
	lduha	[%i6+%o5]0x81,%l6	! %l6 = 000000000000ff22
!	Mem[00000000201c0001] = ffe31a10, %l3 = ffffffffffffffff, %asi = 80
	lduba	[%o0+0x001]%asi,%l3	! %l3 = 00000000000000e3
!	Mem[0000000010181408] = 79bf2e00, %l3 = 00000000000000e3
	lduwa	[%i6+%o4]0x88,%l3	! %l3 = 0000000079bf2e00
!	Mem[0000000030081400] = 06970aaf 54095eaa, %l2 = 000000ff, %l3 = 79bf2e00
	ldda	[%i2+%g0]0x89,%l2	! %l2 = 0000000054095eaa 0000000006970aaf
!	Mem[0000000010101400] = ffffff22, %l4 = 00000000000000ff
	ldsha	[%i4+%g0]0x88,%l4	! %l4 = ffffffffffffff22
!	Mem[00000000300c1400] = 2e00000000000000, %f10 = 00f12a00 ff01ffff
	ldda	[%i3+%g0]0x81,%f10	! %f10 = 2e000000 00000000
!	Mem[0000000010101408] = 00000000, %l0 = ffffffffffffff22
	lduwa	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000
!	%l5 = 000000001bd9f4a7, %l1 = b8aae8e25ce7e017, %l1 = b8aae8e25ce7e017
	orn	%l5,%l1,%l1		! %l1 = 4755171dbbd9ffef
!	%l5 = 000000001bd9f4a7, imm = fffffffffffffd77, %l2 = 0000000054095eaa
	xnor	%l5,-0x289,%l2		! %l2 = 000000001bd9f62f

p0_label_319:
!	Starting 10 instruction Store Burst
!	%f7  = 00000000, %f26 = ffe0ffff, %f15 = 79647692
	fadds	%f7 ,%f26,%f15		! %f15 = ffe0ffff
!	Mem[0000000010101400] = 22ffffff, %l7 = 00000000000000ff
	ldstuba	[%i4+%g0]0x80,%l7	! %l7 = 0000000000000022
!	%f20 = 00ff0000 00000000, Mem[0000000010141408] = 92766479 00000000
	stda	%f20,[%i5+%o4]0x80	! Mem[0000000010141408] = 00ff0000 00000000
!	%l4 = ffffff22, %l5 = 1bd9f4a7, Mem[0000000010181400] = 000000ff 00000000
	stda	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffff22 1bd9f4a7
!	Mem[00000000201c0000] = ffe31a10, %l3 = 0000000006970aaf
	ldstuba	[%o0+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181400] = 22ffffff, %l0 = 0000000000000000
	swap	[%i6+%g0],%l0		! %l0 = 0000000022ffffff
!	%f3  = ff000000, Mem[0000000010081408] = 0000f9f4
	sta	%f3 ,[%i2+%o4]0x80	! Mem[0000000010081408] = ff000000
!	%l5 = 000000001bd9f4a7, %l3 = 00000000000000ff, %l6 = 000000000000ff22
	sdivx	%l5,%l3,%l6		! %l6 = 00000000001bf5ea
!	%l4 = ffffffffffffff22, %l0 = 0000000022ffffff, %y  = 74aab764
	udiv	%l4,%l0,%l5		! %l5 = 00000000ffffffff
	mov	%l0,%y			! %y = 22ffffff
!	%l5 = 00000000ffffffff, Mem[0000000010101400] = ffffffffffffffff
	stxa	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000ffffffff

p0_label_320:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 000000ff6d000000, %l2 = 000000001bd9f62f
	ldxa	[%i1+%g0]0x89,%l2	! %l2 = 000000ff6d000000
!	Mem[0000000010001410] = 0000006d79bf2e00, %l6 = 00000000001bf5ea
	ldxa	[%i0+%o5]0x80,%l6	! %l6 = 0000006d79bf2e00
!	Mem[0000000030141408] = 0000000018000000, %f8  = cf14ffa0 79bf2e00
	ldda	[%i5+%o4]0x81,%f8 	! %f8  = 00000000 18000000
	membar	#Sync			! Added by membar checker (62)
!	Mem[0000000010081400] = 3400ffff 00000018 ff000000 ff1ffcff
!	Mem[0000000010081410] = a7000000 0000ff00 000000e0 3400ffff
!	Mem[0000000010081420] = ff000000 ff54d061 e557ba48 ffffe0ff
!	Mem[0000000010081430] = 000000aa 00000000 cf14ffa0 ffffa0ff
	ldda	[%i2+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010081400
!	Mem[0000000010041410] = ffa0ffff00006d00, %f28 = 00000000 aa000000
	ldda	[%i1+%o5]0x88,%f28	! %f28 = ffa0ffff 00006d00
!	Mem[00000000211c0000] = ff0038a0, %l7 = 0000000000000022
	lduh	[%o2+%g0],%l7		! %l7 = 000000000000ff00
!	Mem[0000000030041400] = 000000ff6d000000, %l1 = 4755171dbbd9ffef
	ldxa	[%i1+%g0]0x89,%l1	! %l1 = 000000ff6d000000
!	Mem[0000000010101410] = 00000000, %f18 = fffc1fff
	lda	[%i4+%o5]0x80,%f18	! %f18 = 00000000
!	Mem[0000000030181408] = 00006d00, %l2 = 000000ff6d000000
	lduha	[%i6+%o4]0x89,%l2	! %l2 = 0000000000006d00
!	Mem[0000000030181410] = ff2224a7, %f21 = 00000000
	lda	[%i6+%o5]0x81,%f21	! %f21 = ff2224a7

p0_label_321:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = ff000000, %l7 = 000000000000ff00
	ldstuba	[%i4+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041400] = 6d000000, %l7 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000000
!	%l6 = 0000006d79bf2e00, Mem[0000000010101400] = 00000000
	stha	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 00002e00
!	%f10 = e557ba48 ffffe0ff, Mem[0000000010181410] = ffff0000 000000aa
	stda	%f10,[%i6+%o5]0x88	! Mem[0000000010181410] = e557ba48 ffffe0ff
!	%l5 = 00000000ffffffff, Mem[0000000010041408] = 000000ff6d0000ff
	stxa	%l5,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000ffffffff
!	%l6 = 0000006d79bf2e00, Mem[0000000030141400] = ffffe0ff
	stba	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffe000
!	%l5 = 00000000ffffffff, Mem[0000000020800040] = ff00b270, %asi = 80
	stha	%l5,[%o1+0x040]%asi	! Mem[0000000020800040] = ffffb270
!	%f26 = ffe0ffff, Mem[0000000010101408] = 00000000
	sta	%f26,[%i4+%o4]0x88	! Mem[0000000010101408] = ffe0ffff
!	%l6 = 0000006d79bf2e00, Mem[0000000010181410] = ffffe0ff
	stba	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffe000
!	Mem[00000000201c0001] = ffe31a10, %l1 = 000000ff6d000000
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 00000000000000e3

p0_label_322:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 0000002e, %l1 = 00000000000000e3
	ldsha	[%i3+%g0]0x89,%l1	! %l1 = 000000000000002e
!	Mem[0000000030041408] = 000000ff, %f26 = ffe0ffff
	lda	[%i1+%o4]0x81,%f26	! %f26 = 000000ff
!	Mem[0000000030041410] = 00000000, %l3 = 00000000000000ff
	ldsba	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181438] = 0000ffff, %f25 = 00000000
	lda	[%i6+0x038]%asi,%f25	! %f25 = 0000ffff
!	Mem[0000000030141400] = ffffe000, %l2 = 0000000000006d00
	ldswa	[%i5+%g0]0x89,%l2	! %l2 = ffffffffffffe000
!	Mem[0000000030041408] = 00000018ff000000, %l4 = ffffffffffffff22
	ldxa	[%i1+%o4]0x89,%l4	! %l4 = 00000018ff000000
!	Mem[0000000030141410] = 000000ff, %l7 = 0000000000000000
	ldsba	[%i5+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001410] = 6d000000, %l7 = 0000000000000000
	lduha	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141420] = 0000006d, %f23 = e0000000
	lda	[%i5+0x020]%asi,%f23	! %f23 = 0000006d
!	%l3 = 0000000000000000, %l2 = ffffffffffffe000, %l2 = ffffffffffffe000
	udivx	%l3,%l2,%l2		! %l2 = 0000000000000000

p0_label_323:
!	Starting 10 instruction Store Burst
!	%l6 = 0000006d79bf2e00, Mem[0000000010181428] = 000000ff00000079, %asi = 80
	stxa	%l6,[%i6+0x028]%asi	! Mem[0000000010181428] = 0000006d79bf2e00
!	Mem[0000000010101408] = ffffe0ff, %l6 = 0000000079bf2e00
	swapa	[%i4+%o4]0x80,%l6	! %l6 = 00000000ffffe0ff
!	%f21 = ff2224a7, %f3  = ff1ffcff, %f26 = 000000ff
	fdivs	%f21,%f3 ,%f26		! %f26 = 3f81b95b
!	%l4 = 00000018ff000000, imm = 0000000000000f82, %l6 = 00000000ffffe0ff
	xnor	%l4,0xf82,%l6		! %l6 = ffffffe700fff07d
!	%l1 = 000000000000002e, Mem[000000001000143e] = 0aaf00ff, %asi = 80
	stha	%l1,[%i0+0x03e]%asi	! Mem[000000001000143c] = 0aaf002e
!	%f26 = 3f81b95b 48ba57e5, %l1 = 000000000000002e
!	Mem[0000000030081438] = 7964769225e1d91b
	add	%i2,0x038,%g1
	stda	%f26,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030081438] = 7964ba485bb9813f
!	%f3  = ff1ffcff, Mem[0000000030081408] = bf1cd1ff
	sta	%f3 ,[%i2+%o4]0x89	! Mem[0000000030081408] = ff1ffcff
!	%l1 = 000000000000002e, Mem[0000000020800040] = ffffb270
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040] = 002eb270
!	%l4 = 00000018ff000000, %l5 = 00000000ffffffff, %l1 = 000000000000002e
	udivx	%l4,%l5,%l1		! %l1 = 0000000000000018
!	%l0 = 0000000022ffffff, %l3 = 0000000000000000, %y  = 22ffffff
	smul	%l0,%l3,%l0		! %l0 = 0000000000000000, %y = 00000000

p0_label_324:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001420] = 000000ff 00ff00ff, %l4 = ff000000, %l5 = ffffffff
	ldd	[%i0+0x020],%l4		! %l4 = 00000000000000ff 0000000000ff00ff
!	Mem[00000000300c1400] = 2e000000, %f8  = ff000000
	lda	[%i3+%g0]0x81,%f8 	! %f8 = 2e000000
!	Mem[0000000030001408] = 00000000, %l6 = ffffffe700fff07d
	lduba	[%i0+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041400] = 0000f9f4, %l1 = 0000000000000018
	ldswa	[%i1+%g0]0x80,%l1	! %l1 = 000000000000f9f4
!	Mem[0000000030001400] = 00000000, %l0 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0000] = ffff1a10, %l7 = 0000000000000000
	ldsb	[%o0+%g0],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000030181410] = a72422ff, %l7 = ffffffffffffffff
	ldsha	[%i6+%o5]0x89,%l7	! %l7 = 00000000000022ff
!	Mem[0000000021800140] = 843689c0, %l2 = 0000000000000000, %asi = 80
	ldsha	[%o3+0x140]%asi,%l2	! %l2 = ffffffffffff8436
!	Mem[0000000010081426] = ff54d061, %l4 = 00000000000000ff, %asi = 80
	lduba	[%i2+0x026]%asi,%l4	! %l4 = 00000000000000d0
!	Mem[00000000100c1400] = 000000af, %l4 = 00000000000000d0
	ldsha	[%i3+%g0]0x88,%l4	! %l4 = 00000000000000af

p0_label_325:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 000000a7, %l0 = 0000000000000000
	ldstuba	[%i2+%o5]0x88,%l0	! %l0 = 00000000000000a7
!	%l2 = ffff8436, %l3 = 00000000, Mem[00000000100c1400] = af000000 ff000000
	stda	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffff8436 00000000
!	%l6 = 0000000000000000, Mem[0000000010141400] = 002ebf79
	stwa	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	%l2 = ffffffffffff8436, Mem[0000000010101400] = 002e0000
	stha	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 84360000
!	%l7 = 00000000000022ff, Mem[0000000030041410] = 00000000
	stha	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = 22ff0000
!	%l0 = 00000000000000a7, Mem[0000000030081400] = 54095eaa
	stha	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = 540900a7
!	%l1 = 000000000000f9f4, Mem[00000000100c1410] = 0000ff00
	stha	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000f9f4
!	Mem[0000000030081408] = fffc1fff, %l3 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%f6  = 000000e0 3400ffff, Mem[0000000030041408] = ff000000 00000018
	stda	%f6 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000e0 3400ffff
!	%f25 = 0000ffff, Mem[00000000100c1408] = 0000002e
	sta	%f25,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000ffff

p0_label_326:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ffa0ffffa0ff14cf, %l1 = 000000000000f9f4
	ldxa	[%i4+%g0]0x81,%l1	! %l1 = ffa0ffffa0ff14cf
!	Mem[00000000300c1408] = ff970aaf, %l5 = 0000000000ff00ff
	ldsha	[%i3+%o4]0x81,%l5	! %l5 = ffffffffffffff97
!	Mem[0000000030101408] = 000000af, %l7 = 00000000000022ff
	lduwa	[%i4+%o4]0x89,%l7	! %l7 = 00000000000000af
!	Mem[0000000030081400] = a7000954, %l3 = 00000000000000ff
	lduba	[%i2+%g0]0x81,%l3	! %l3 = 00000000000000a7
!	Mem[0000000010041437] = 6d000000, %l1 = ffa0ffffa0ff14cf
	ldsb	[%i1+0x037],%l1		! %l1 = 0000000000000000
!	Mem[0000000030141400] = 00e0ffff, %l6 = 0000000000000000
	lduba	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%f17 = ffff0034, %f25 = 0000ffff, %f14 = cf14ffa0
	fmuls	%f17,%f25,%f14		! %f14 = ffff0034
!	Mem[0000000010081414] = 0000ff00, %l7 = 00000000000000af, %asi = 80
	ldsba	[%i2+0x014]%asi,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = ffff0000, %l1 = 0000000000000000
	ldswa	[%i3+%o4]0x80,%l1	! %l1 = ffffffffffff0000
!	Mem[0000000030081410] = c75a0000790000ff, %l4 = 00000000000000af
	ldxa	[%i2+%o5]0x81,%l4	! %l4 = c75a0000790000ff

p0_label_327:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000030101408] = 000000ff000000af
	stxa	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000000
	membar	#Sync			! Added by membar checker (63)
!	%l2 = ffff8436, %l3 = 000000a7, Mem[0000000010081428] = e557ba48 ffffe0ff
	std	%l2,[%i2+0x028]		! Mem[0000000010081428] = ffff8436 000000a7
!	%f21 = ff2224a7, Mem[00000000100c1404] = 00000000
	sta	%f21,[%i3+0x004]%asi	! Mem[00000000100c1404] = ff2224a7
!	%l1 = ffffffffffff0000, Mem[0000000010181410] = ffffe000
	stwa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = ffff0000
!	Mem[00000000300c1410] = 59000000, %l4 = c75a0000790000ff
	ldstuba	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000
!	%f26 = 3f81b95b 48ba57e5, Mem[0000000030181408] = 00006d00 ffa0ffff
	stda	%f26,[%i6+%o4]0x89	! Mem[0000000030181408] = 3f81b95b 48ba57e5
!	%f18 = 00000000, %f21 = ff2224a7, %f21 = ff2224a7
	fadds	%f18,%f21,%f21		! %f21 = ff2224a7
!	%f28 = ffa0ffff 00006d00, Mem[0000000030081400] = 540900a7 06970aaf
	stda	%f28,[%i2+%g0]0x89	! Mem[0000000030081400] = ffa0ffff 00006d00
!	%l7 = 0000000000000000, Mem[0000000010101420] = 00ff0018
	stw	%l7,[%i4+0x020]		! Mem[0000000010101420] = 00000000
!	%f31 = a0ff14cf, Mem[0000000010101400] = 00003684
	sta	%f31,[%i4+%g0]0x88	! Mem[0000000010101400] = a0ff14cf

p0_label_328:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = af0a97ff, %l3 = 00000000000000a7
	lduba	[%i3+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1408] = ffff0000, %l6 = 0000000000000000, %asi = 80
	lduba	[%i3+0x008]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[00000000201c0000] = ffff1a10, %l5 = ffffffffffffff97
	lduh	[%o0+%g0],%l5		! %l5 = 000000000000ffff
!	Mem[0000000010101400] = ffffffffa0ff14cf, %l2 = ffffffffffff8436
	ldxa	[%i4+%g0]0x88,%l2	! %l2 = ffffffffa0ff14cf
!	Mem[0000000030001410] = 79647692, %l3 = 00000000000000ff
	lduha	[%i0+%o5]0x81,%l3	! %l3 = 0000000000007964
!	Mem[0000000030101410] = ff0000ff, %l6 = 00000000000000ff
	ldsba	[%i4+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000020800001] = 0000a840, %l6 = ffffffffffffffff
	ldub	[%o1+0x001],%l6		! %l6 = 0000000000000000
!	Mem[0000000010001410] = 0000006d, %l6 = 0000000000000000
	lduwa	[%i0+%o5]0x80,%l6	! %l6 = 000000000000006d
!	Mem[000000001014142c] = 000000ff, %l4 = 0000000000000000
	lduw	[%i5+0x02c],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010141410] = af0a9706, %l5 = 000000000000ffff
	lduwa	[%i5+%o5]0x80,%l5	! %l5 = 00000000af0a9706

p0_label_329:
!	Starting 10 instruction Store Burst
!	%l6 = 000000000000006d, Mem[0000000010041408] = ffffffff
	stba	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 6dffffff
!	%f30 = ffa0ffff, Mem[0000000030141400] = 00e0ffff
	sta	%f30,[%i5+%g0]0x81	! Mem[0000000030141400] = ffa0ffff
!	%f20 = 00ff0000 ff2224a7, Mem[00000000100c1430] = 00000000 ff5dd2ff, %asi = 80
	stda	%f20,[%i3+0x030]%asi	! Mem[00000000100c1430] = 00ff0000 ff2224a7
!	%f4  = a7000000, Mem[00000000300c1408] = ff970aaf
	sta	%f4 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = a7000000
!	%l4 = 000000ff, %l5 = af0a9706, Mem[00000000100c1438] = ffa0ffff a0ff14cf, %asi = 80
	stda	%l4,[%i3+0x038]%asi	! Mem[00000000100c1438] = 000000ff af0a9706
!	%l5 = 00000000af0a9706, Mem[0000000030001400] = 00000000
	stha	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 00009706
!	Mem[0000000020800000] = 0000a840, %l3 = 0000000000007964
	ldstub	[%o1+%g0],%l3		! %l3 = 0000000000000000
!	%l6 = 0000006d, %l7 = 00000000, Mem[00000000100c1400] = 3684ffff a72422ff
	stda	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000006d 00000000
!	Mem[0000000030041410] = 0000ff22, %l4 = 00000000000000ff
	swapa	[%i1+%o5]0x89,%l4	! %l4 = 000000000000ff22
!	%f22 = ffff0034 0000006d, Mem[0000000030141410] = 000000ff 002ebfff
	stda	%f22,[%i5+%o5]0x81	! Mem[0000000030141410] = ffff0034 0000006d

p0_label_330:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 79647692 00000000, %l0 = 000000a7, %l1 = ffff0000
	ldda	[%i0+%o5]0x81,%l0	! %l0 = 0000000079647692 0000000000000000
!	Mem[0000000030081408] = 00000000 ff1ffcff, %l0 = 79647692, %l1 = 00000000
	ldda	[%i2+%o4]0x89,%l0	! %l0 = 00000000ff1ffcff 0000000000000000
!	%f31 = a0ff14cf, %f31 = a0ff14cf, %f12 = 000000aa
	fdivs	%f31,%f31,%f12		! %f12 = 3f800000
!	Mem[0000000010101400] = a0ff14cf, %l7 = 0000000000000000
	lduha	[%i4+%g0]0x88,%l7	! %l7 = 00000000000014cf
!	Mem[0000000010181408] = 002ebf79 0000ff59, %l6 = 0000006d, %l7 = 000014cf
	ldda	[%i6+%o4]0x80,%l6	! %l6 = 00000000002ebf79 000000000000ff59
!	Mem[0000000030141410] = 3400ffff, %l2 = ffffffffa0ff14cf
	lduba	[%i5+%o5]0x89,%l2	! %l2 = 00000000000000ff
	membar	#Sync			! Added by membar checker (64)
!	Mem[0000000010181400] = 00000000 a7f4d91b 002ebf79 0000ff59
!	Mem[0000000010181410] = 0000ffff 48ba57e5 000000aa 00000000
!	Mem[0000000010181420] = a55a73b6 40d11cbf 0000006d 79bf2e00
!	Mem[0000000010181430] = 80000000 000000ff 0000ffff 00000000
	ldda	[%i6+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010181400
!	Mem[0000000030101408] = 00000000, %l1 = 0000000000000000
	ldsba	[%i4+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000211c0000] = ff0038a0, %l7 = 000000000000ff59
	ldsh	[%o2+%g0],%l7		! %l7 = ffffffffffffff00
!	%l1 = 0000000000000000, immd = fffffe9c, %y  = 00000000
	smul	%l1,-0x164,%l2		! %l2 = 0000000000000000, %y = 00000000

p0_label_331:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 0000006d, %l6 = 00000000002ebf79
	ldstuba	[%i3+%g0]0x88,%l6	! %l6 = 000000000000006d
!	%l1 = 0000000000000000, Mem[0000000010001410] = 6d000000
	stwa	%l1,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	Randomly selected nop
	nop
!	%f20 = e557ba48 ffff0000, Mem[0000000010081400] = ffff0034 18000000
	stda	%f20,[%i2+%g0]0x88	! Mem[0000000010081400] = e557ba48 ffff0000
	membar	#Sync			! Added by membar checker (65)
!	%f9  = ff54d061, Mem[0000000010181408] = 002ebf79
	sta	%f9 ,[%i6+%o4]0x80	! Mem[0000000010181408] = ff54d061
!	Mem[00000000218000c0] = ffff2960, %l3 = 0000000000000000
	ldstuba	[%o3+0x0c0]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101400] = a0ff14cf, %l5 = 00000000af0a9706
	swapa	[%i4+%g0]0x88,%l5	! %l5 = 00000000a0ff14cf
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010181430] = 80000000 000000ff
	std	%l2,[%i6+0x030]		! Mem[0000000010181430] = 00000000 000000ff
!	Mem[0000000030101410] = ff0000ff, %l4 = 000000000000ff22
	ldstuba	[%i4+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101410] = 00000000, %l0 = 00000000ff1ffcff
	ldstuba	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000

p0_label_332:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 79647692, %l1 = 0000000000000000
	lduha	[%i0+%o5]0x81,%l1	! %l1 = 0000000000007964
!	Mem[0000000030141408] = 0000000018000000, %l5 = 00000000a0ff14cf
	ldxa	[%i5+%o4]0x81,%l5	! %l5 = 0000000018000000
!	%f22 = 00000000, %f29 = 00000080, %f5  = 0000ff00
	fdivs	%f22,%f29,%f5 		! %f5  = 00000000
!	Mem[0000000010101438] = 00000000, %l7 = ffffffffffffff00
	lduw	[%i4+0x038],%l7		! %l7 = 0000000000000000
!	Mem[0000000010181410] = 0000ffff, %f26 = 002ebf79
	lda	[%i6+0x010]%asi,%f26	! %f26 = 0000ffff
!	Mem[0000000010081410] = 000000ff, %l5 = 0000000018000000
	ldsba	[%i2+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000100c1408] = ffff0000, %l1 = 0000000000007964
	lduwa	[%i3+%o4]0x80,%l1	! %l1 = 00000000ffff0000
!	Mem[0000000010001400] = a7ff226d, %l3 = 00000000000000ff
	lduwa	[%i0+%g0]0x80,%l3	! %l3 = 00000000a7ff226d
!	Mem[0000000010181400] = 00000000, %l2 = 0000000000000000
	ldsha	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1400] = ff000000, %l4 = 00000000000000ff
	lduba	[%i3+%g0]0x80,%l4	! %l4 = 00000000000000ff

p0_label_333:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = ffff0034, %l4 = 00000000000000ff
	swapa	[%i1+%o4]0x81,%l4	! %l4 = 00000000ffff0034
!	%l2 = 0000000000000000, Mem[00000000211c0000] = ff0038a0, %asi = 80
	stha	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 000038a0
!	%l6 = 0000006d, %l7 = 00000000, Mem[0000000010141410] = 06970aaf 00ff0018
	stda	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000006d 00000000
!	%f20 = e557ba48, Mem[0000000030001400] = 06970000
	sta	%f20,[%i0+%g0]0x81	! Mem[0000000030001400] = e557ba48
!	%l0 = 0000000000000000, Mem[0000000030041410] = 000000ff
	stba	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	Mem[0000000030181410] = ff2224a7, %l5 = 00000000ffffffff
	swapa	[%i6+%o5]0x81,%l5	! %l5 = 00000000ff2224a7
!	%l0 = 0000000000000000, imm = fffffffffffff728, %l3 = 00000000a7ff226d
	orn	%l0,-0x8d8,%l3		! %l3 = 00000000000008d7
!	%l2 = 0000000000000000, Mem[0000000030041408] = ff000000
	stwa	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	%l5 = 00000000ff2224a7, Mem[00000000100c1408] = ffff0000
	stwa	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff2224a7
!	Mem[00000000211c0001] = 000038a0, %l6 = 000000000000006d
	ldstuba	[%o2+0x001]%asi,%l6	! %l6 = 0000000000000000

p0_label_334:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00ff38a0, %l5 = 00000000ff2224a7, %asi = 80
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141408] = 0000ff00, %f1  = 00000018
	lda	[%i5+%o4]0x88,%f1 	! %f1 = 0000ff00
!	Mem[0000000030001408] = 00000000, %l3 = 00000000000008d7
	ldsha	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800040] = 002eb270, %l4 = 00000000ffff0034
	ldsh	[%o1+0x040],%l4		! %l4 = 000000000000002e
!	Mem[0000000010141422] = 0000006d, %l4 = 000000000000002e
	ldsh	[%i5+0x022],%l4		! %l4 = 000000000000006d
!	Mem[0000000010001400] = a7ff226d, %l2 = 0000000000000000
	lduwa	[%i0+%g0]0x80,%l2	! %l2 = 00000000a7ff226d
!	Mem[0000000010141410] = 0000006d, %f5  = 00000000
	lda	[%i5+%o5]0x88,%f5 	! %f5 = 0000006d
!	Mem[0000000010041408] = 6dffffff, %l0 = 0000000000000000
	ldswa	[%i1+%o4]0x80,%l0	! %l0 = 000000006dffffff
!	Mem[0000000010181408] = ff54d061, %l7 = 0000000000000000
	lduha	[%i6+%o4]0x80,%l7	! %l7 = 000000000000ff54
!	Mem[0000000030001410] = 00000000 92766479, %l4 = 0000006d, %l5 = 000000ff
	ldda	[%i0+%o5]0x89,%l4	! %l4 = 0000000092766479 0000000000000000

p0_label_335:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = f4f90000, %l3 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l3	! %l3 = 00000000f4f90000
!	Mem[00000000218000c1] = ffff2960, %l3 = 00000000f4f90000
	ldstub	[%o3+0x0c1],%l3		! %l3 = 00000000000000ff
!	Mem[0000000030141400] = ffa0ffff 00000000 00000000 18000000
!	%f0  = 3400ffff 0000ff00 ff000000 ff1ffcff
!	%f4  = a7000000 0000006d 000000e0 3400ffff
!	%f8  = 2e000000 ff54d061 e557ba48 ffffe0ff
!	%f12 = 3f800000 00000000 ffff0034 ffffa0ff
	stda	%f0 ,[%i5+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030141400
!	Mem[00000000100c1400] = ff000000, %l2 = 00000000a7ff226d
	ldstuba	[%i3+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[00000000211c0001] = 00ff38a0, %l6 = 0000000000000000
	ldstub	[%o2+0x001],%l6		! %l6 = 00000000000000ff
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000010181430] = 00000000 000000ff
	std	%l2,[%i6+0x030]		! Mem[0000000010181430] = 000000ff 000000ff
!	%l6 = 000000ff, %l7 = 0000ff54, Mem[00000000100c1410] = 00000000 00000000
	stda	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ff 0000ff54
!	%l6 = 00000000000000ff, Mem[0000000010041410] = 006d0000, %asi = 80
	stwa	%l6,[%i1+0x010]%asi	! Mem[0000000010041410] = 000000ff
!	%l6 = 00000000000000ff, Mem[0000000010141438] = ff00000079bfff00
	stx	%l6,[%i5+0x038]		! Mem[0000000010141438] = 00000000000000ff
!	Mem[0000000020800001] = ff00a840, %l3 = 00000000000000ff
	ldstub	[%o1+0x001],%l3		! %l3 = 0000000000000000

p0_label_336:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ffff0000, %f20 = e557ba48
	lda	[%i2+%g0]0x88,%f20	! %f20 = ffff0000
!	Code Fragment 4, seed = 435170
p0_fragment_34:
!	%l0 = 000000006dffffff
	setx	0xc6a16da5d6d5db16,%g7,%l0 ! %l0 = c6a16da5d6d5db16
!	%l1 = 00000000ffff0000
	setx	0xb3b352a7385d5c41,%g7,%l1 ! %l1 = b3b352a7385d5c41
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c6a16da5d6d5db16
	setx	0xe5c54caf1a44b17c,%g7,%l0 ! %l0 = e5c54caf1a44b17c
!	%l1 = b3b352a7385d5c41
	setx	0x5e44af44ea20ddc7,%g7,%l1 ! %l1 = 5e44af44ea20ddc7
p0_fragment_34_end:
!	Mem[0000000021800101] = ffcd1b90, %l5 = 0000000000000000, %asi = 80
	lduba	[%o3+0x101]%asi,%l5	! %l5 = 00000000000000cd
!	Mem[00000000211c0000] = 00ff38a0, %l5 = 00000000000000cd, %asi = 80
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[000000001000142c] = 61d05459, %l2 = 00000000000000ff
	lduh	[%i0+0x02c],%l2		! %l2 = 00000000000061d0
!	Mem[0000000010001432] = 0000421f, %l0 = e5c54caf1a44b17c, %asi = 80
	lduba	[%i0+0x032]%asi,%l0	! %l0 = 0000000000000042
!	Mem[0000000010181408] = 61d054ff, %l3 = 0000000000000000
	lduwa	[%i6+%o4]0x88,%l3	! %l3 = 0000000061d054ff
!	Mem[0000000030101410] = 00000000ff0000ff, %l5 = 00000000000000ff
	ldxa	[%i4+%o5]0x89,%l5	! %l5 = 00000000ff0000ff
!	Mem[0000000010001400] = a7ff226d, %l3 = 0000000061d054ff
	ldsha	[%i0+%g0]0x80,%l3	! %l3 = ffffffffffffa7ff
!	Mem[0000000010181430] = 000000ff, %l4 = 0000000092766479
	lduw	[%i6+0x030],%l4		! %l4 = 00000000000000ff

p0_label_337:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ff0000ff, Mem[0000000010041400] = f4f90000
	stwa	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = ff0000ff
!	Mem[00000000300c1410] = ff000059, %l6 = 00000000000000ff
	swapa	[%i3+%o5]0x81,%l6	! %l6 = 00000000ff000059
!	Code Fragment 3, seed = 692025
p0_fragment_35:
!	%l0 = 0000000000000042
	setx	0xadd58dec6654875e,%g7,%l0 ! %l0 = add58dec6654875e
!	%l1 = 5e44af44ea20ddc7
	setx	0x1f67eefd9647f609,%g7,%l1 ! %l1 = 1f67eefd9647f609
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = add58dec6654875e
	setx	0x14cebefd5b85c0c4,%g7,%l0 ! %l0 = 14cebefd5b85c0c4
!	%l1 = 1f67eefd9647f609
	setx	0x31bc5e49483c6a8f,%g7,%l1 ! %l1 = 31bc5e49483c6a8f
p0_fragment_35_end:
!	%l4 = 000000ff, %l5 = ff0000ff, Mem[0000000010141400] = 00000000 00ffffff
	std	%l4,[%i5+%g0]		! Mem[0000000010141400] = 000000ff ff0000ff
!	%l6 = 00000000ff000059, Mem[0000000010141400] = ff000000
	stha	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = ff000059
!	%l4 = 00000000000000ff, immd = 0000000000000f61, %l6  = 00000000ff000059
	mulx	%l4,0xf61,%l6		! %l6 = 00000000000f519f
!	Mem[00000000211c0000] = 00ff38a0, %l2 = 00000000000061d0
	ldstub	[%o2+%g0],%l2		! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (66)
!	Mem[0000000010141400] = 590000ff, %l6 = 00000000000f519f, %asi = 80
	swapa	[%i5+0x000]%asi,%l6	! %l6 = 00000000590000ff
!	Mem[00000000300c1400] = 0000002e, %l1 = 00000000483c6a8f
	swapa	[%i3+%g0]0x89,%l1	! %l1 = 000000000000002e
!	%l6 = 590000ff, %l7 = 0000ff54, Mem[00000000300c1408] = a7000000 66000000
	stda	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 590000ff 0000ff54

p0_label_338:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000, %l2 = 0000000000000000
	lduha	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001408] = 00000000 00000000, %l2 = 00000000, %l3 = ffffa7ff
	ldda	[%i0+%o4]0x89,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000030041408] = 00000000, %l2 = 0000000000000000
	ldsba	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081411] = ff000000, %l2 = 0000000000000000
	ldsb	[%i2+0x011],%l2		! %l2 = 0000000000000000
!	Mem[0000000010001408] = 000000ff, %l6 = 00000000590000ff
	lduwa	[%i0+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141410] = 0000006d, %l6 = 00000000000000ff
	ldsba	[%i5+%o5]0x88,%l6	! %l6 = 000000000000006d
!	Mem[0000000030141400] = 0000ff00, %l7 = 000000000000ff54
	lduwa	[%i5+%g0]0x89,%l7	! %l7 = 000000000000ff00
!	Mem[000000001010143a] = 00000000, %l7 = 000000000000ff00
	lduh	[%i4+0x03a],%l7		! %l7 = 0000000000000000
!	Mem[0000000010101408] = 79bf2e00, %l6 = 000000000000006d
	ldsha	[%i4+%o4]0x80,%l6	! %l6 = 00000000000079bf
!	Mem[0000000010001408] = 00000000000000ff, %l5 = 00000000ff0000ff
	ldxa	[%i0+%o4]0x88,%l5	! %l5 = 00000000000000ff

p0_label_339:
!	Starting 10 instruction Store Burst
!	%f10 = e557ba48, Mem[00000000300c1408] = ff000059
	sta	%f10,[%i3+%o4]0x89	! Mem[00000000300c1408] = e557ba48
!	Mem[0000000030181408] = 48ba57e5, %l0 = 000000005b85c0c4
	swapa	[%i6+%o4]0x89,%l0	! %l0 = 0000000048ba57e5
!	%l2 = 0000000000000000, Mem[0000000010141433] = 07b95aff, %asi = 80
	stba	%l2,[%i5+0x033]%asi	! Mem[0000000010141430] = 07b95a00
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000010001408] = ff000000 00000000, %asi = 80
	stda	%l4,[%i0+0x008]%asi	! Mem[0000000010001408] = 000000ff 000000ff
!	Mem[0000000030181408] = 5b85c0c4, %l3 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l3	! %l3 = 00000000000000c4
!	%l2 = 00000000, %l3 = 000000c4, Mem[0000000010141400] = 000f519f ff0000ff
	stda	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000 000000c4
!	Mem[0000000030041400] = ff00006d, %l3 = 00000000000000c4
	swapa	[%i1+%g0]0x81,%l3	! %l3 = 00000000ff00006d
!	%l5 = 00000000000000ff, Mem[0000000010081410] = ff000000
	stha	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = 00ff0000
!	Mem[0000000010141408] = 00ff0000, %l0 = 0000000048ba57e5
	swapa	[%i5+%o4]0x80,%l0	! %l0 = 0000000000ff0000
!	Mem[0000000030101408] = 00000000, %l7 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l7	! %l7 = 0000000000000000

p0_label_340:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000, %f30 = 00000000
	lda	[%i0+%o5]0x80,%f30	! %f30 = 00000000
!	Mem[0000000030181400] = ff000079, %l7 = 0000000000000000
	ldsha	[%i6+%g0]0x81,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000010081410] = 00ff0000, %l2 = 0000000000000000
	lduha	[%i2+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[000000001014142d] = 000000ff, %l4 = 00000000000000ff
	ldub	[%i5+0x02d],%l4		! %l4 = 0000000000000000
!	Mem[0000000010141410] = 000000000000006d, %l3 = 00000000ff00006d
	ldxa	[%i5+%o5]0x88,%l3	! %l3 = 000000000000006d
!	Mem[0000000010141410] = 6d000000 00000000, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i5+%o5]0x80,%l4	! %l4 = 000000006d000000 0000000000000000
!	Mem[0000000010081400] = 0000ffff48ba57e5, %l7 = ffffffffffffff00, %asi = 80
	ldxa	[%i2+0x000]%asi,%l7	! %l7 = 0000ffff48ba57e5
	membar	#Sync			! Added by membar checker (67)
!	Mem[0000000010001400] = a7ff226d 61d05459 000000ff 000000ff
!	Mem[0000000010001410] = 00000000 79bf2e00 ff000016 000000cc
!	Mem[0000000010001420] = 000000ff 00ff00ff a724226d 61d05459
!	Mem[0000000010001430] = 0000421f 000000ff 000000ff 0aaf002e
	ldda	[%i0+%g0]ASI_BLK_AIUP,%f0 	! Block Load from 0000000010001400
!	Mem[0000000030181408] = 5b85c0ff, %f23 = aa000000
	lda	[%i6+%o4]0x89,%f23	! %f23 = 5b85c0ff
!	Mem[0000000010141410] = 00000000 0000006d, %l0 = 00ff0000, %l1 = 0000002e
	ldda	[%i5+%o5]0x88,%l0	! %l0 = 000000000000006d 0000000000000000

p0_label_341:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1422] = 61d054ff, %l0 = 000000000000006d
	ldstub	[%i3+0x022],%l0		! %l0 = 0000000000000054
!	%l6 = 000079bf, %l7 = 48ba57e5, Mem[0000000030041400] = c4000000 000000ff
	stda	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 000079bf 48ba57e5
!	%l2 = 00000000000000ff, %l6 = 00000000000079bf, %l5 = 0000000000000000
	addc	%l2,%l6,%l5		! %l5 = 0000000000007abe
!	%l5 = 0000000000007abe, Mem[0000000010081408] = ff000000
	stha	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = 7abe0000
!	Mem[0000000030001400] = e557ba48 00000000 00000000 00000000
!	%f16 = 1bd9f4a7 00000000 59ff0000 79bf2e00
!	%f20 = ffff0000 ffff0000 00000000 5b85c0ff
!	%f24 = bf1cd140 b6735aa5 0000ffff 6d000000
!	%f28 = ff000000 00000080 00000000 ffff0000
	stda	%f16,[%i0+%g0]ASI_BLK_AIUS	! Block Store to 0000000030001400
!	%l1 = 0000000000000000, Mem[0000000010041408] = ffffff6d
	stba	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffff00
!	Mem[000000001008143e] = ffffa0ff, %l4 = 000000006d000000
	ldstub	[%i2+0x03e],%l4		! %l4 = 00000000000000a0
!	%l5 = 0000000000007abe, Mem[0000000030001410] = ffff0000
	stwa	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = 00007abe
!	%l0 = 0000000000000054, Mem[0000000030101410] = ff0000ff
	stha	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 005400ff
	membar	#Sync			! Added by membar checker (68)
!	Mem[0000000030001408] = 0000ff59, %l3 = 000000000000006d
	ldstuba	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000059

p0_label_342:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 6d000000, %l4 = 00000000000000a0
	lduwa	[%i5+%o5]0x80,%l4	! %l4 = 000000006d000000
!	Mem[0000000030001408] = ffff0000, %l2 = 00000000000000ff
	lduha	[%i0+%o4]0x81,%l2	! %l2 = 000000000000ffff
!	Mem[0000000020800040] = 002eb270, %l0 = 0000000000000054
	ldsh	[%o1+0x040],%l0		! %l0 = 000000000000002e
!	Mem[0000000030101410] = ff005400, %l2 = 000000000000ffff
	ldsba	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101400] = 06970aaf ffffffff 79bf2e00 000000ff
!	Mem[0000000010101410] = ff000000 00000000 00000000 000000cc
!	Mem[0000000010101420] = 00000000 00d1006d 000000ff db0000ff
!	Mem[0000000010101430] = 0000421f 000000ff 00000000 00000043
	ldda	[%i4+%g0]ASI_BLK_PL,%f16	! Block Load from 0000000010101400
!	Mem[00000000100c1410] = ff000000, %l7 = 0000ffff48ba57e5
	lduba	[%i3+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141400] = 00000000, %l2 = 0000000000000000
	lduba	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141436] = 7200ec95, %l3 = 0000000000000059, %asi = 80
	lduba	[%i5+0x036]%asi,%l3	! %l3 = 00000000000000ec
!	%l5 = 0000000000007abe, %l7 = 00000000000000ff, %l0 = 000000000000002e
	udivx	%l5,%l7,%l0		! %l0 = 000000000000007b
!	Code Fragment 3, seed = 165794
p0_fragment_36:
!	%l0 = 000000000000007b
	setx	0xd9efd74f12e67d16,%g7,%l0 ! %l0 = d9efd74f12e67d16
!	%l1 = 0000000000000000
	setx	0x5535b1c97db45e41,%g7,%l1 ! %l1 = 5535b1c97db45e41
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d9efd74f12e67d16
	setx	0xc681e3aa6d94137c,%g7,%l0 ! %l0 = c681e3aa6d94137c
!	%l1 = 5535b1c97db45e41
	setx	0x8f65b65d997a9fc7,%g7,%l1 ! %l1 = 8f65b65d997a9fc7
p0_fragment_36_end:

p0_label_343:
!	Starting 10 instruction Store Burst
!	%l4 = 000000006d000000, Mem[0000000010041424] = 61d054ff
	stw	%l4,[%i1+0x024]		! Mem[0000000010041424] = 6d000000
!	%f0  = a7ff226d, Mem[0000000010081410] = 0000ff00
	sta	%f0 ,[%i2+%o5]0x88	! Mem[0000000010081410] = a7ff226d
!	%l0 = c681e3aa6d94137c, Mem[0000000030101410] = ff005400
	stwa	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 6d94137c
!	%l1 = 8f65b65d997a9fc7, Mem[0000000010041400] = ff0000ff
	stba	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = c70000ff
!	Mem[0000000010041418] = 0000ff00, %l3 = 00000000000000ec
	swap	[%i1+0x018],%l3		! %l3 = 000000000000ff00
!	%f22 = cc000000 00000000, %l2 = 0000000000000000
!	Mem[0000000030041430] = ffd25dff00000000
	add	%i1,0x030,%g1
	stda	%f22,[%g1+%l2]ASI_PST8_S ! Mem[0000000030041430] = ffd25dff00000000
!	Mem[00000000100c1424] = 92766479, %l0 = 000000006d94137c, %asi = 80
	swapa	[%i3+0x024]%asi,%l0	! %l0 = 0000000092766479
!	%l1 = 8f65b65d997a9fc7, Mem[0000000030101408] = 00000000
	stwa	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = 997a9fc7
!	%f17 = af0a9706, Mem[0000000010141400] = 00000000
	sta	%f17,[%i5+%g0]0x80	! Mem[0000000010141400] = af0a9706
!	%f30 = 43000000 00000000, Mem[00000000100c1410] = ff000000 54ff0000, %asi = 80
	stda	%f30,[%i3+0x010]%asi	! Mem[00000000100c1410] = 43000000 00000000

p0_label_344:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff000000, %l4 = 000000006d000000
	ldsba	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1400] = ff000000, %l4 = 0000000000000000
	lduwa	[%i3+%g0]0x80,%l4	! %l4 = 00000000ff000000
!	Mem[0000000010141400] = 06970aaf, %l5 = 0000000000007abe
	ldsha	[%i5+%g0]0x88,%l5	! %l5 = 0000000000000aaf
!	Mem[0000000010101428] = 000000ff, %f11 = 61d05459
	ld	[%i4+0x028],%f11	! %f11 = 000000ff
!	Mem[0000000010101400] = 06970aaf, %l3 = 000000000000ff00
	lduwa	[%i4+%g0]0x80,%l3	! %l3 = 0000000006970aaf
	membar	#Sync			! Added by membar checker (69)
!	Mem[0000000030101400] = ffa0ffff a0ff14cf 997a9fc7 00000000
!	Mem[0000000030101410] = 7c13946d 00000000 f7d5ecaa 1169c7d3
!	Mem[0000000030101420] = 42eea8b8 6650b2e9 7c7701b6 552af12f
!	Mem[0000000030101430] = 418fa324 4ec45025 34d6b482 1bd9a94b
	ldda	[%i4+%g0]ASI_BLK_AIUS,%f0 	! Block Load from 0000000030101400
!	Mem[00000000100c1418] = 5ae4ffff, %l1 = 8f65b65d997a9fc7
	lduw	[%i3+0x018],%l1		! %l1 = 000000005ae4ffff
!	Mem[0000000030001410] = 00007abe, %l4 = 00000000ff000000
	lduha	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041430] = 000000006d000000, %f28 = ff000000 1f420000
	ldd	[%i1+0x030],%f28	! %f28 = 00000000 6d000000
!	Mem[0000000010081400] = e557ba48ffff0000, %f18 = ff000000 002ebf79
	ldda	[%i2+%g0]0x88,%f18	! %f18 = e557ba48 ffff0000

p0_label_345:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000aaf, Mem[0000000010081408] = 7abe0000
	stwa	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000aaf
!	Mem[00000000300c1408] = 48ba57e5, %l0 = 0000000092766479
	swapa	[%i3+%o4]0x81,%l0	! %l0 = 0000000048ba57e5
!	Mem[0000000010141400] = af0a9706, %l6 = 00000000000079bf
	swap	[%i5+%g0],%l6		! %l6 = 00000000af0a9706
!	Mem[0000000030081408] = fffc1fff, %l2 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[00000000201c0000] = ffff1a10, %l2 = 00000000000000ff
	ldstuba	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141412] = 6d000000, %l4 = 0000000000000000
	ldstub	[%i5+0x012],%l4		! %l4 = 0000000000000000
!	%f7  = 1169c7d3, Mem[0000000030141408] = fffc1fff
	sta	%f7 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 1169c7d3
!	Mem[0000000020800041] = 002eb270, %l0 = 0000000048ba57e5
	ldstub	[%o1+0x041],%l0		! %l0 = 000000000000002e
!	%l4 = 0000000000000000, Mem[0000000010081410] = 6d22ffa7
	stha	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000ffa7
!	%f26 = ff0000db ff000000, %l4 = 0000000000000000
!	Mem[0000000030001400] = 1bd9f4a700000000
	stda	%f26,[%i0+%l4]ASI_PST8_S ! Mem[0000000030001400] = 1bd9f4a700000000

p0_label_346:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = a7ff226d 61d05459 000000ff 000000ff
!	Mem[0000000010001410] = 00000000 79bf2e00 ff000016 000000cc
!	Mem[0000000010001420] = 000000ff 00ff00ff a724226d 61d05459
!	Mem[0000000010001430] = 0000421f 000000ff 000000ff 0aaf002e
	ldda	[%i0+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010001400
!	Mem[0000000030101408] = c79f7a99, %l3 = 0000000006970aaf
	ldswa	[%i4+%o4]0x89,%l3	! %l3 = ffffffffc79f7a99
!	Mem[0000000030081400] = 006d0000, %l4 = 0000000000000000
	ldsha	[%i2+%g0]0x81,%l4	! %l4 = 000000000000006d
!	Mem[0000000030181410] = ffffffff, %f17 = af0a9706
	lda	[%i6+%o5]0x81,%f17	! %f17 = ffffffff
!	%l3 = ffffffffc79f7a99, imm = 0000000000000dd1, %l3 = ffffffffc79f7a99
	xnor	%l3,0xdd1,%l3		! %l3 = 00000000386088b7
!	Mem[0000000010081408] = fffc1fffaf0a0000, %l1 = 000000005ae4ffff
	ldxa	[%i2+%o4]0x88,%l1	! %l1 = fffc1fffaf0a0000
!	Mem[0000000030141400] = 0000ff00, %l7 = 00000000000000ff
	lduwa	[%i5+%g0]0x89,%l7	! %l7 = 000000000000ff00
!	%f22 = cc000000 00000000, %l1 = fffc1fffaf0a0000
!	Mem[0000000030041420] = 79647692a7f4d91b
	add	%i1,0x020,%g1
	stda	%f22,[%g1+%l1]ASI_PST8_S ! Mem[0000000030041420] = 79647692a7f4d91b
!	Mem[0000000030181408] = ffc0855b5bb9813f, %f18 = e557ba48 ffff0000
	ldda	[%i6+%o4]0x81,%f18	! %f18 = ffc0855b 5bb9813f
!	Mem[0000000010141408] = 48ba57e5 00000000, %l4 = 0000006d, %l5 = 00000aaf
	ldda	[%i5+%o4]0x80,%l4	! %l4 = 0000000048ba57e5 0000000000000000

p0_label_347:
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000ff00, Mem[00000000100c1435] = ff2224a7
	stb	%l7,[%i3+0x035]		! Mem[00000000100c1434] = ff0024a7
!	Mem[0000000010181410] = 0000ffff48ba57e5, %l4 = 0000000048ba57e5, %l0 = 000000000000002e
	add	%i6,0x10,%g1
	casxa	[%g1]0x80,%l4,%l0	! %l0 = 0000ffff48ba57e5
	membar	#Sync			! Added by membar checker (70)
!	%l3 = 00000000386088b7, Mem[0000000030101408] = 997a9fc700000000
	stxa	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000386088b7
!	%f19 = 5bb9813f, %f17 = ffffffff
	fcmps	%fcc0,%f19,%f17		! %fcc0 = 3
!	Mem[0000000010001404] = 61d05459, %l2 = 00000000000000ff
	ldstuba	[%i0+0x004]%asi,%l2	! %l2 = 0000000000000061
!	%l6 = 00000000af0a9706, Mem[00000000201c0000] = ffff1a10, %asi = 80
	stba	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = 06ff1a10
!	Mem[0000000010141410] = 6d00ff00, %l3 = 00000000386088b7
	ldstuba	[%i5+%o5]0x80,%l3	! %l3 = 000000000000006d
!	Mem[0000000010001408] = 000000ff, %l6 = 00000000af0a9706
	ldstuba	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001410] = 00007abe, %l5 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l5	! %l5 = 0000000000007abe
!	%l6 = 0000000000000000, Mem[0000000030001408] = ffff0000
	stha	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000

p0_label_348:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000 0000ff00, %l6 = 00000000, %l7 = 0000ff00
	ldda	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000000 000000000000ff00
!	Mem[0000000010001400] = a7ff226d, %l0 = 0000ffff48ba57e5
	lduba	[%i0+%g0]0x80,%l0	! %l0 = 00000000000000a7
!	Mem[00000000211c0001] = ffff38a0, %l1 = fffc1fffaf0a0000
	ldub	[%o2+0x001],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010041400] = c70000ff, %l2 = 0000000000000061
	lduha	[%i1+%g0]0x80,%l2	! %l2 = 000000000000c700
!	Mem[0000000010181410] = 0000ffff 48ba57e5, %l0 = 000000a7, %l1 = 000000ff
	ldda	[%i6+%o5]0x80,%l0	! %l0 = 000000000000ffff 0000000048ba57e5
!	Mem[0000000030081410] = c75a0000, %l7 = 000000000000ff00
	lduha	[%i2+%o5]0x81,%l7	! %l7 = 000000000000c75a
!	Mem[00000000100c1400] = 000000ff, %l3 = 000000000000006d
	ldswa	[%i3+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001410] = 0000ffff00000000, %f4  = 00000000 79bf2e00
	ldda	[%i0+%o5]0x89,%f4 	! %f4  = 0000ffff 00000000
!	Mem[0000000010041400] = c70000ff ff1ffcff 00ffffff 00000000
!	Mem[0000000010041410] = 000000ff ffffa0ff 000000ec 1bd9f4a7
!	Mem[0000000010041420] = 80000000 6d000000 00005900 61d05459
!	Mem[0000000010041430] = 00000000 6d000000 18000000 ffff0034
	ldda	[%i1+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	Mem[0000000010101400] = 06970aafffffffff, %l3 = 00000000000000ff
	ldx	[%i4+%g0],%l3		! %l3 = 06970aafffffffff

p0_label_349:
!	Starting 10 instruction Store Burst
!	%l0 = 0000ffff, %l1 = 48ba57e5, Mem[0000000010001410] = 00000000 002ebf79
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000ffff 48ba57e5
!	Mem[0000000030181408] = 5b85c0ff, %l2 = 000000000000c700
	ldstuba	[%i6+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141410] = ff00ff00, %l4 = 0000000048ba57e5
	swapa	[%i5+%o5]0x80,%l4	! %l4 = 00000000ff00ff00
!	%l6 = 00000000, %l7 = 0000c75a, Mem[0000000010101408] = 002ebf79 ff000000
	stda	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000 0000c75a
!	Mem[00000000300c1400] = 8f6a3c48, %l0 = 000000000000ffff
	swapa	[%i3+%g0]0x81,%l0	! %l0 = 000000008f6a3c48
!	%l4 = 00000000ff00ff00, Mem[0000000010141430] = 07b95a00, %asi = 80
	stha	%l4,[%i5+0x030]%asi	! Mem[0000000010141430] = ff005a00
!	Mem[0000000030101410] = 6d94137c, %l4 = 00000000ff00ff00
	ldstuba	[%i4+%o5]0x89,%l4	! %l4 = 000000000000007c
!	%f26 = 00005900, Mem[0000000030141410] = 6d000000
	sta	%f26,[%i5+%o5]0x81	! Mem[0000000030141410] = 00005900
!	%l7 = 000000000000c75a, Mem[0000000020800000] = ffffa840
	sth	%l7,[%o1+%g0]		! Mem[0000000020800000] = c75aa840
!	%l1 = 0000000048ba57e5, Mem[00000000218000c0] = ffff2960
	stb	%l1,[%o3+0x0c0]		! Mem[00000000218000c0] = e5ff2960

p0_label_350:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ffff0000, %f13 = 000000ff
	lda	[%i6+%o5]0x88,%f13	! %f13 = ffff0000
!	Mem[0000000010001408] = ff0000ff000000ff, %f8  = 000000ff 00ff00ff
	ldda	[%i0+%o4]0x80,%f8 	! %f8  = ff0000ff 000000ff
!	Mem[0000000030001410] = 00000000, %l5 = 0000000000007abe
	ldsha	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041404] = ff1ffcff, %l3 = 06970aafffffffff
	lduh	[%i1+0x004],%l3		! %l3 = 000000000000ff1f
!	Mem[0000000010101408] = 00000000, %l1 = 0000000048ba57e5
	lduwa	[%i4+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081400] = ffff0000, %l4 = 000000000000007c
	lduha	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041400] = 000079bf, %l6 = 0000000000000000
	lduba	[%i1+%g0]0x89,%l6	! %l6 = 00000000000000bf
!	Mem[0000000010081410] = a7ff0000, %l1 = 0000000000000000
	ldsha	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l6 = 00000000000000bf
	ldswa	[%i4+%o4]0x89,%l6	! %l6 = 0000000000000000
	membar	#Sync			! Added by membar checker (71)
!	Mem[0000000030101400] = ffa0ffff a0ff14cf 00000000 386088b7
!	Mem[0000000030101410] = ff13946d 00000000 f7d5ecaa 1169c7d3
!	Mem[0000000030101420] = 42eea8b8 6650b2e9 7c7701b6 552af12f
!	Mem[0000000030101430] = 418fa324 4ec45025 34d6b482 1bd9a94b
	ldda	[%i4+%g0]ASI_BLK_AIUSL,%f0 	! Block Load from 0000000030101400

p0_label_351:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010081428] = ffff8436, %asi = 80
	stha	%l6,[%i2+0x028]%asi	! Mem[0000000010081428] = 00008436
!	Mem[0000000010141410] = e557ba48, %l5 = 0000000000000000
	ldstuba	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000048
!	%f22 = 000000ec 1bd9f4a7, %l3 = 000000000000ff1f
!	Mem[0000000010141428] = 00000000000000ff
	add	%i5,0x028,%g1
	stda	%f22,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010141428] = a7f4d91bec0000ff
!	Mem[0000000010041434] = 6d000000, %l1 = 00000000, %l0 = 8f6a3c48
	add	%i1,0x34,%g1
	casa	[%g1]0x80,%l1,%l0	! %l0 = 000000006d000000
!	%f27 = 61d05459, %f31 = ffff0034, %f25 = 6d000000
	fdivs	%f27,%f31,%f25		! %f25 = ffff0034
!	Mem[0000000010141428] = a7f4d91b, %l3 = 000000000000ff1f, %asi = 80
	swapa	[%i5+0x028]%asi,%l3	! %l3 = 00000000a7f4d91b
!	%l0 = 6d000000, %l1 = 00000000, Mem[0000000030041408] = 00000000 000000e0
	stda	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 6d000000 00000000
!	%l2 = 00000000000000ff, Mem[0000000010041408] = ffffff00
	stha	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = ffff00ff
!	%l1 = 0000000000000000, Mem[00000000100c1408] = ff00f9f4a72422ff
	stxa	%l1,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000000000000000
!	%l3 = 00000000a7f4d91b, Mem[0000000010041400] = c70000ff
	stha	%l3,[%i1+%g0]0x80	! Mem[0000000010041400] = d91b00ff

p0_label_352:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ffff0000, %l1 = 0000000000000000
	lduwa	[%i0+%o5]0x80,%l1	! %l1 = 00000000ffff0000
!	Mem[0000000030001400] = 00000000a7f4d91b, %f28 = 00000000 6d000000
	ldda	[%i0+%g0]0x89,%f28	! %f28 = 00000000 a7f4d91b
!	Mem[0000000010041408] = ffff00ff, %l5 = 0000000000000048
	ldsha	[%i1+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081408] = 00000000ff1ffcff, %f18 = 00ffffff 00000000
	ldda	[%i2+%o4]0x89,%f18	! %f18 = 00000000 ff1ffcff
!	%l0 = 000000006d000000, %l5 = 00000000000000ff, %l4  = 0000000000000000
	mulx	%l0,%l5,%l4		! %l4 = 0000006c93000000
!	Mem[0000000010081400] = 0000ffff, %l0 = 000000006d000000
	ldsha	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800000] = c75aa840, %l0 = 0000000000000000, %asi = 80
	lduha	[%o1+0x000]%asi,%l0	! %l0 = 000000000000c75a
!	%l4 = 0000006c93000000, Mem[00000000300c1400] = 0000ffff
	stwa	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 93000000
	membar	#Sync			! Added by membar checker (72)
!	Mem[00000000300c1400] = 93000000 00000000 92766479 0000ff54
!	Mem[00000000300c1410] = 000000ff 00000040 cc000000 00000000
!	Mem[00000000300c1420] = 5954d061 00000080 5954d061 6d2224a7
!	Mem[00000000300c1430] = ff000000 1f420000 3400ffff 00000000
	ldda	[%i3+%g0]ASI_BLK_S,%f0 	! Block Load from 00000000300c1400
!	Mem[00000000300c1410] = 000000ff, %l3 = 00000000a7f4d91b
	ldsba	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000000

p0_label_353:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 79647692, %l6 = 0000000000000000
	ldstuba	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000092
!	Mem[0000000010101438] = 0000000000000043, %l1 = 00000000ffff0000, %l3 = 0000000000000000
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l1,%l3	! %l3 = 0000000000000043
!	%l5 = 00000000000000ff, Mem[00000000100c1400] = ff00000000000000, %asi = 80
	stxa	%l5,[%i3+0x000]%asi	! Mem[00000000100c1400] = 00000000000000ff
!	%l5 = 00000000000000ff, %l7 = 000000000000c75a, %l1 = 00000000ffff0000
	or	%l5,%l7,%l1		! %l1 = 000000000000c7ff
!	%f6  = cc000000 00000000, Mem[0000000010001400] = a7ff226d ffd05459, %asi = 80
	stda	%f6 ,[%i0+0x000]%asi	! Mem[0000000010001400] = cc000000 00000000
!	Mem[0000000010081438] = cf14ffa0, %l7 = 000000000000c75a
	ldstuba	[%i2+0x038]%asi,%l7	! %l7 = 00000000000000cf
!	%f7  = 00000000, Mem[0000000010141408] = 48ba57e5
	sta	%f7 ,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	Mem[0000000030041400] = bf790000, %l0 = 000000000000c75a
	ldstuba	[%i1+%g0]0x81,%l0	! %l0 = 00000000000000bf
!	%f23 = 1bd9f4a7, %f19 = ff1ffcff, %f30 = 18000000
	fsubs	%f23,%f19,%f30		! %f30 = 7f1ffcff
!	Mem[0000000010181410] = 0000ffff, %l4 = 0000006c93000000
	ldstuba	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000000

p0_label_354:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101438] = 0000000000000043, %f18 = 00000000 ff1ffcff
	ldd	[%i4+0x038],%f18	! %f18 = 00000000 00000043
!	Mem[00000000300c1410] = ff000000, %l5 = 00000000000000ff
	ldsha	[%i3+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = 0000ffff, %l4 = 0000000000000000
	ldsha	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001402] = cc000000, %l5 = 0000000000000000
	ldsh	[%i0+0x002],%l5		! %l5 = 0000000000000000
!	Mem[0000000010141428] = 0000ff1f, %l6 = 0000000000000092
	ldsw	[%i5+0x028],%l6		! %l6 = 000000000000ff1f
!	Mem[0000000030001408] = 00000000, %l3 = 0000000000000043
	ldswa	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041400] = 48ba57e5000079ff, %f28 = 00000000 a7f4d91b
	ldda	[%i1+%g0]0x89,%f28	! %f28 = 48ba57e5 000079ff
!	Mem[0000000030081400] = 006d0000ffffa0ff, %f16 = c70000ff ff1ffcff
	ldda	[%i2+%g0]0x81,%f16	! %f16 = 006d0000 ffffa0ff
!	Mem[0000000010041408] = ff00ffff00000000, %l0 = 00000000000000bf
	ldxa	[%i1+%o4]0x80,%l0	! %l0 = ff00ffff00000000
!	Mem[000000001014142c] = ec0000ff, %f20 = 000000ff
	ld	[%i5+0x02c],%f20	! %f20 = ec0000ff

p0_label_355:
!	Starting 10 instruction Store Burst
!	Mem[0000000020800000] = c75aa840, %l7 = 00000000000000cf
	ldstuba	[%o1+0x000]%asi,%l7	! %l7 = 00000000000000c7
!	Mem[0000000010181418] = 000000aa00000000, %l4 = 0000000000000000, %l4 = 0000000000000000
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l4,%l4	! %l4 = 000000aa00000000
!	Mem[00000000300c1408] = ff766479, %l4 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 00000000ff766479
!	Mem[0000000030081410] = 00005ac7, %l4 = 00000000ff766479
	ldstuba	[%i2+%o5]0x89,%l4	! %l4 = 00000000000000c7
!	%l4 = 000000c7, %l5 = 00000000, Mem[0000000030081400] = 00006d00 ffa0ffff
	stda	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000c7 00000000
!	Mem[00000000100c141c] = 00000000, %l7 = 00000000000000c7, %asi = 80
	swapa	[%i3+0x01c]%asi,%l7	! %l7 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000030081410] = ff5a0000
	stha	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	%l4 = 00000000000000c7, Mem[0000000010081400] = 0000ffff
	stwa	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000c7
!	%f16 = 006d0000 ffffa0ff, Mem[0000000010001410] = 0000ffff 48ba57e5
	stda	%f16,[%i0+%o5]0x88	! Mem[0000000010001410] = 006d0000 ffffa0ff
!	Mem[0000000030101408] = 00000000, %l4 = 00000000000000c7
	swapa	[%i4+%o4]0x81,%l4	! %l4 = 0000000000000000

p0_label_356:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 000000ffffffa0ff, %l7 = 0000000000000000
	ldxa	[%i1+%o5]0x80,%l7	! %l7 = 000000ffffffa0ff
!	%f20 = ec0000ff, %f24 = 80000000
	fsqrts	%f20,%f24		! %f24 = 7fffffff
!	Mem[00000000300c1400] = 93000000, %l7 = 000000ffffffa0ff
	lduwa	[%i3+%g0]0x81,%l7	! %l7 = 0000000093000000
!	Mem[00000000300c1400] = 93000000, %l7 = 0000000093000000
	lduwa	[%i3+%g0]0x81,%l7	! %l7 = 0000000093000000
!	Mem[00000000300c1408] = 54ff000000000000, %l5 = 0000000000000000
	ldxa	[%i3+%o4]0x89,%l5	! %l5 = 54ff000000000000
!	Mem[0000000030001410] = 00000000, %l0 = ff00ffff00000000
	lduba	[%i0+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l5 = 54ff000000000000
	lduwa	[%i6+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041410] = 000000ff, %l4 = 0000000000000000
	ldsha	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001400] = a7f4d91b, %l6 = 000000000000ff1f
	ldsba	[%i0+%g0]0x89,%l6	! %l6 = 000000000000001b
!	Mem[0000000010041410] = ff000000, %l6 = 000000000000001b
	ldsba	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000000

p0_label_357:
!	Starting 10 instruction Store Burst
!	%f28 = 48ba57e5 000079ff, Mem[0000000010141410] = ffba57e5 00000000
	stda	%f28,[%i5+%o5]0x80	! Mem[0000000010141410] = 48ba57e5 000079ff
!	%l2 = 00000000000000ff, %l2 = 00000000000000ff, %l0 = 0000000000000000
	sdivx	%l2,%l2,%l0		! %l0 = 0000000000000001
!	Mem[0000000010081408] = af0a0000, %l7 = 0000000093000000
	ldsha	[%i2+%o4]0x88,%l7	! %l7 = 0000000000000000
!	%l0 = 0000000000000001, Mem[0000000030101400] = ffa0ffff
	stwa	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000001
!	%l4 = 0000000000000000, Mem[000000001000143a] = 000000ff, %asi = 80
	stba	%l4,[%i0+0x03a]%asi	! Mem[0000000010001438] = 000000ff
!	%l2 = 00000000000000ff, Mem[00000000201c0001] = 06ff1a10, %asi = 80
	stba	%l2,[%o0+0x001]%asi	! Mem[00000000201c0000] = 06ff1a10
!	%l7 = 0000000000000000, Mem[0000000020800040] = 00ffb270, %asi = 80
	stha	%l7,[%o1+0x040]%asi	! Mem[0000000020800040] = 0000b270
!	%l3 = 0000000000000000, Mem[0000000010001410] = ffa0ffff
	stha	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000ffff
!	Mem[0000000030041410] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i1+%o5]0x81,%l5	! %l5 = 0000000000000000
!	%l0 = 0000000000000001, Mem[0000000030001408] = 00000000
	stba	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000001

p0_label_358:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = c7000000, %l0 = 0000000000000001
	lduba	[%i4+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = 000079bf, %l1 = 000000000000c7ff
	ldsha	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001410] = 006d0000ffff0000, %f4  = 000000ff 00000040
	ldda	[%i0+%o5]0x88,%f4 	! %f4  = 006d0000 ffff0000
!	Mem[0000000010001400] = 00000000000000cc, %l7 = 0000000000000000
	ldxa	[%i0+%g0]0x88,%l7	! %l7 = 00000000000000cc
	membar	#Sync			! Added by membar checker (73)
!	Mem[00000000300c1400] = 93000000 00000000 00000000 0000ff54
!	Mem[00000000300c1410] = 000000ff 00000040 cc000000 00000000
!	Mem[00000000300c1420] = 5954d061 00000080 5954d061 6d2224a7
!	Mem[00000000300c1430] = ff000000 1f420000 3400ffff 00000000
	ldda	[%i3+%g0]ASI_BLK_AIUS,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010041420] = 80000000, %l3 = 0000000000000000, %asi = 80
	ldsba	[%i1+0x020]%asi,%l3	! %l3 = ffffffffffffff80
!	Mem[0000000030001410] = 0000ffff00000000, %l1 = 0000000000000000
	ldxa	[%i0+%o5]0x89,%l1	! %l1 = 0000ffff00000000
!	Mem[0000000030101400] = 00000001, %l7 = 00000000000000cc
	lduba	[%i4+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1400] = 00000093, %l0 = 0000000000000000
	ldsha	[%i3+%g0]0x89,%l0	! %l0 = 0000000000000093
!	Mem[0000000030101410] = 6d9413ff, %l6 = 0000000000000000
	ldsha	[%i4+%o5]0x89,%l6	! %l6 = 00000000000013ff

p0_label_359:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000093, Mem[0000000010101400] = af0a9706
	stha	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = af0a0093
!	Mem[0000000010001430] = 0000421f000000ff, %l1 = 0000ffff00000000, %l7 = 0000000000000000
	add	%i0,0x30,%g1
	casxa	[%g1]0x80,%l1,%l7	! %l7 = 0000421f000000ff
!	Mem[00000000211c0001] = ffff38a0, %l4 = 0000000000000000
	ldstub	[%o2+0x001],%l4		! %l4 = 00000000000000ff
!	%f8  = 5954d061 00000080, Mem[0000000010081408] = af0a0000 fffc1fff
	stda	%f8 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 5954d061 00000080
!	%l2 = 000000ff, %l3 = ffffff80, Mem[0000000010181408] = 61d054ff 59ff0000
	stda	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff ffffff80
!	%l2 = 00000000000000ff, Mem[0000000010041420] = 80000000
	stw	%l2,[%i1+0x020]		! Mem[0000000010041420] = 000000ff
!	%l3 = ffffffffffffff80, Mem[0000000010081400] = c7000000
	stwa	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffff80
!	%l2 = 00000000000000ff, Mem[0000000030041400] = ff790000
	stha	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 00ff0000
!	%l7 = 0000421f000000ff, Mem[0000000010041410] = 000000ffffffa0ff
	stxa	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000421f000000ff
!	%f4  = 006d0000, Mem[00000000100c1408] = 00000000
	sta	%f4 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 006d0000

p0_label_360:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 0000ff00, %l1 = 0000ffff00000000
	lduha	[%i1+%g0]0x89,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010101410] = ff000000, %l0 = 0000000000000093
	ldswa	[%i4+%o5]0x80,%l0	! %l0 = ffffffffff000000
!	Mem[00000000100c1400] = 00000000000000ff, %l5 = 0000000000000000
	ldxa	[%i3+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001430] = 0000421f, %l0 = 00000000ff000000
	swap	[%i0+0x030],%l0		! %l0 = 000000000000421f
!	Mem[0000000010001410] = ffff0000, %l5 = 00000000000000ff
	ldsha	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181410] = ffff00ff, %l7 = 0000421f000000ff
	ldsha	[%i6+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%l3 = ffffffffffffff80, %l4 = 00000000000000ff, %l2  = 00000000000000ff
	mulx	%l3,%l4,%l2		! %l2 = ffffffffffff8080
!	Mem[0000000030041410] = ff000000, %l7 = 00000000000000ff
	lduba	[%i1+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041408] = 6d000000, %l1 = 000000000000ff00
	ldswa	[%i1+%o4]0x89,%l1	! %l1 = 000000006d000000
!	Mem[0000000030001400] = a7f4d91b, %l1 = 000000006d000000
	ldsha	[%i0+%g0]0x89,%l1	! %l1 = ffffffffffffd91b

p0_label_361:
!	Starting 10 instruction Store Burst
!	%f16 = 93000000, Mem[0000000010101408] = 00000000
	sta	%f16,[%i4+%o4]0x88	! Mem[0000000010101408] = 93000000
!	%l0 = 0000421f, %l1 = ffffd91b, Mem[0000000010081400] = ffffff80 e557ba48
	stda	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000421f ffffd91b
!	%l5 = 0000000000000000, Mem[0000000010181400] = 00000000
	stwa	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	%l1 = ffffffffffffd91b, %l4 = 00000000000000ff, %l0 = 000000000000421f
	xnor	%l1,%l4,%l0		! %l0 = 000000000000261b
!	%l1 = ffffffffffffd91b, Mem[0000000010101420] = 00000000
	stw	%l1,[%i4+0x020]		! Mem[0000000010101420] = ffffd91b
!	%l4 = 00000000000000ff, Mem[0000000030001410] = 00000000
	stwa	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000ff
!	Mem[0000000010081400] = 0000421f, %l0 = 000000000000261b
	swapa	[%i2+%g0]0x88,%l0	! %l0 = 000000000000421f
!	Mem[0000000010141434] = 7200ec95, %l4 = 00000000000000ff, %asi = 80
	swapa	[%i5+0x034]%asi,%l4	! %l4 = 000000007200ec95
!	%l4 = 000000007200ec95, Mem[0000000030001408] = 01000000
	stwa	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 7200ec95
!	Mem[0000000030141408] = 1169c7d3, %l2 = 00000000ffff8080
	swapa	[%i5+%o4]0x81,%l2	! %l2 = 000000001169c7d3

p0_label_362:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181438] = 0000ffff 00000000, %l4 = 7200ec95, %l5 = 00000000
	ldd	[%i6+0x038],%l4		! %l4 = 000000000000ffff 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l4 = 000000000000ffff
	ldsba	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%f11 = 6d2224a7, %f6  = cc000000, %f19 = 0000ff54
	fadds	%f11,%f6 ,%f19		! %f19 = 6d2224a7
!	Mem[00000000100c1410] = 43000000, %l0 = 000000000000421f
	ldsba	[%i3+%o5]0x80,%l0	! %l0 = 0000000000000043
!	Mem[0000000010001400] = 00000000000000cc, %l5 = 0000000000000000
	ldxa	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000cc
!	Mem[0000000030001408] = 002ebf7995ec0072, %f2  = 92766479 0000ff54
	ldda	[%i0+%o4]0x89,%f2 	! %f2  = 002ebf79 95ec0072
!	Mem[0000000030001408] = 95ec0072, %l5 = 00000000000000cc
	ldswa	[%i0+%o4]0x89,%l5	! %l5 = ffffffff95ec0072
!	Mem[00000000300c1400] = 9300000000000000, %l3 = ffffffffffffff80
	ldxa	[%i3+%g0]0x81,%l3	! %l3 = 9300000000000000
!	Mem[0000000021800100] = ffcd1b90, %l5 = ffffffff95ec0072
	lduh	[%o3+0x100],%l5		! %l5 = 000000000000ffcd
!	Mem[0000000010101408] = 00000093, %l7 = 00000000000000ff
	ldsha	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000000

p0_label_363:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 80000000, %l6 = 00000000000013ff
	ldstuba	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000080
!	%f4  = 006d0000, %f22 = cc000000
	fcmpes	%fcc0,%f4 ,%f22		! %fcc0 = 2
!	%f16 = 93000000 00000000, Mem[0000000010081418] = 000000e0 3400ffff
	std	%f16,[%i2+0x018]	! Mem[0000000010081418] = 93000000 00000000
!	Mem[0000000030041400] = 0000ff00, %l5 = 000000000000ffcd
	swapa	[%i1+%g0]0x89,%l5	! %l5 = 000000000000ff00
!	%l0 = 0000000000000043, Mem[00000000201c0000] = 06ff1a10, %asi = 80
	stha	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00431a10
!	%l6 = 00000080, %l7 = 00000000, Mem[0000000010141400] = bf790000 c4000000
	stda	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000080 00000000
!	Mem[0000000010101408] = 00000093, %l6 = 0000000000000080
	swapa	[%i4+%o4]0x80,%l6	! %l6 = 0000000000000093
!	Mem[0000000010181410] = ff00ffff, %l6 = 0000000000000093
	ldstuba	[%i6+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %l6 = 00000000000000ff
	swapa	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041430] = 000000006d000000, %l3 = 9300000000000000, %l7 = 0000000000000000
	add	%i1,0x30,%g1
	casxa	[%g1]0x80,%l3,%l7	! %l7 = 000000006d000000

p0_label_364:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = b7886038c7000000, %f6  = cc000000 00000000
	ldda	[%i4+%o4]0x89,%f6 	! %f6  = b7886038 c7000000
!	Mem[0000000030001408] = 002ebf7995ec0072, %f18 = 00000000 6d2224a7
	ldda	[%i0+%o4]0x89,%f18	! %f18 = 002ebf79 95ec0072
!	Mem[000000001008143d] = ffffffff, %l4 = 0000000000000000
	ldub	[%i2+0x03d],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010141410] = e557ba48, %l4 = 00000000000000ff
	ldswa	[%i5+%o5]0x88,%l4	! %l4 = ffffffffe557ba48
!	Mem[0000000030101408] = 000000c7, %l7 = 000000006d000000
	ldswa	[%i4+%o4]0x81,%l7	! %l7 = 00000000000000c7
!	Mem[0000000010081410] = 0000ffa7 0000ff00, %l6 = 00000000, %l7 = 000000c7
	ldda	[%i2+%o5]0x80,%l6	! %l6 = 000000000000ffa7 000000000000ff00
!	Mem[00000000100c1410] = 43000000, %f23 = 00000000
	lda	[%i3+%o5]0x80,%f23	! %f23 = 43000000
!	Mem[0000000010101410] = 00000000000000ff, %f28 = ff000000 1f420000
	ldda	[%i4+%o5]0x88,%f28	! %f28 = 00000000 000000ff
!	Mem[0000000010101408] = 0000c75a 80000000, %l2 = 1169c7d3, %l3 = 00000000
	ldda	[%i4+%o4]0x88,%l2	! %l2 = 0000000080000000 000000000000c75a
!	Mem[0000000010081408] = ff000000, %l6 = 000000000000ffa7
	lduha	[%i2+%o4]0x80,%l6	! %l6 = 000000000000ff00

p0_label_365:
!	Starting 10 instruction Store Burst
!	%f30 = 3400ffff 00000000, Mem[0000000010181410] = ff00ffff 48ba57e5
	stda	%f30,[%i6+%o5]0x80	! Mem[0000000010181410] = 3400ffff 00000000
!	%f16 = 93000000 00000000, Mem[0000000030101408] = 000000c7 386088b7
	stda	%f16,[%i4+%o4]0x81	! Mem[0000000030101408] = 93000000 00000000
!	%f14 = 3400ffff 00000000, Mem[0000000010141410] = e557ba48 ff790000
	stda	%f14,[%i5+%o5]0x88	! Mem[0000000010141410] = 3400ffff 00000000
!	%l7 = 000000000000ff00, Mem[000000001018142a] = 0000006d
	sth	%l7,[%i6+0x02a]		! Mem[0000000010181428] = 0000ff00
!	Mem[0000000030141408] = ffff8080, %l2 = 0000000080000000
	swapa	[%i5+%o4]0x81,%l2	! %l2 = 00000000ffff8080
!	%l5 = 000000000000ff00, Mem[0000000010101410] = ff000000
	stba	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	%l4 = ffffffffe557ba48, Mem[0000000010101410] = 00000000
	stba	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 48000000
!	%f13 = 1f420000, Mem[0000000030101400] = 00000001
	sta	%f13,[%i4+%g0]0x81	! Mem[0000000030101400] = 1f420000
!	%l0 = 0000000000000043, Mem[00000000100c1408] = 006d0000
	stwa	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000043
!	Mem[0000000010141424] = 000000ff, %l0 = 00000043, %l1 = ffffd91b
	add	%i5,0x24,%g1
	casa	[%g1]0x80,%l0,%l1	! %l1 = 00000000000000ff

p0_label_366:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (74)
!	Mem[0000000030001400] = 1bd9f4a7 00000000 7200ec95 79bf2e00
!	Mem[0000000030001410] = 000000ff ffff0000 00000000 5b85c0ff
!	Mem[0000000030001420] = bf1cd140 b6735aa5 0000ffff 6d000000
!	Mem[0000000030001430] = ff000000 00000080 00000000 ffff0000
	ldda	[%i0+%g0]ASI_BLK_AIUS,%f16	! Block Load from 0000000030001400
!	Mem[000000001010142a] = 000000ff, %l4 = ffffffffe557ba48
	ldsh	[%i4+0x02a],%l4		! %l4 = 00000000000000ff
!	Mem[00000000100c1428] = ffe0ffff, %l0 = 0000000000000043, %asi = 80
	ldsba	[%i3+0x028]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000300c1410] = 000000ff, %l0 = ffffffffffffffff
	ldsha	[%i3+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041400] = cdff0000 e557ba48, %l6 = 0000ff00, %l7 = 0000ff00
	ldda	[%i1+%g0]0x81,%l6	! %l6 = 00000000cdff0000 00000000e557ba48
!	Mem[0000000030041408] = 0000006d, %l2 = 00000000ffff8080
	lduba	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1410] = 43000000, %l5 = 000000000000ff00
	lduba	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000043
!	Mem[0000000010081438] = ff14ffa0, %l3 = 000000000000c75a
	ldsh	[%i2+0x038],%l3		! %l3 = ffffffffffffff14
!	Mem[0000000030001410] = ff000000, %l4 = 00000000000000ff
	lduba	[%i0+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c141c] = 000000c7, %l4 = 0000000000000000
	lduh	[%i3+0x01c],%l4		! %l4 = 0000000000000000

p0_label_367:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[00000000300c1400] = 00000093
	stba	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	%l5 = 0000000000000043, Mem[00000000100c1400] = 00000000
	stha	%l5,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00430000
!	%l7 = 00000000e557ba48, Mem[0000000030041410] = ff000000
	stba	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = 48000000
!	Mem[000000001014143d] = 000000ff, %l4 = 0000000000000000
	ldstub	[%i5+0x03d],%l4		! %l4 = 0000000000000000
!	Mem[0000000030101410] = 6d9413ff, %l2 = 0000000000000000
	swapa	[%i4+%o5]0x89,%l2	! %l2 = 000000006d9413ff
!	Mem[0000000030041408] = 0000006d, %l0 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101408] = 80000000, %l4 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141400] = 00ff0000, %l3 = ffffffffffffff14
	ldstuba	[%i5+%g0]0x81,%l3	! %l3 = 0000000000000000
!	%l1 = 00000000000000ff, Mem[0000000030181400] = ff000079
	stba	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = ff000079
!	%f12 = ff000000 1f420000, Mem[0000000010081408] = 000000ff 5954d061
	stda	%f12,[%i2+%o4]0x88	! Mem[0000000010081408] = ff000000 1f420000

p0_label_368:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800041] = 0000b270, %l2 = 000000006d9413ff
	ldsb	[%o1+0x041],%l2		! %l2 = 0000000000000000
!	Mem[0000000030081408] = fffc1fff00000000, %l2 = 0000000000000000
	ldxa	[%i2+%o4]0x81,%l2	! %l2 = fffc1fff00000000
!	Mem[0000000030181410] = ffffffff, %f8  = 5954d061
	lda	[%i6+%o5]0x81,%f8 	! %f8 = ffffffff
!	Mem[0000000020800000] = ff5aa840, %l6 = 00000000cdff0000
	ldsb	[%o1+%g0],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030141408] = 00000080, %l7 = 00000000e557ba48
	ldswa	[%i5+%o4]0x89,%l7	! %l7 = 0000000000000080
!	Mem[0000000030001410] = 000000ffffff0000, %f8  = ffffffff 00000080
	ldda	[%i0+%o5]0x81,%f8 	! %f8  = 000000ff ffff0000
!	Mem[0000000030041410] = 48000000, %l2 = fffc1fff00000000
	ldswa	[%i1+%o5]0x81,%l2	! %l2 = 0000000048000000
!	Mem[0000000021800141] = 843689c0, %l5 = 0000000000000043, %asi = 80
	ldsba	[%o3+0x141]%asi,%l5	! %l5 = 0000000000000036
!	Mem[00000000100c1400] = 00430000, %l2 = 0000000048000000
	ldsha	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000043
!	Mem[00000000300c1400] = 00000000, %l1 = 00000000000000ff
	lduha	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000000

p0_label_369:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000043, Mem[0000000030101400] = 0000421f
	stba	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 00004243
!	Mem[0000000010041422] = 000000ff, %l5 = 0000000000000036
	ldstub	[%i1+0x022],%l5		! %l5 = 0000000000000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010101408] = ff000080 5ac70000, %asi = 80
	stda	%l0,[%i4+0x008]%asi	! Mem[0000000010101408] = 00000000 00000000
!	Mem[0000000010081418] = 93000000, %l5 = 0000000000000000
	ldstuba	[%i2+0x018]%asi,%l5	! %l5 = 0000000000000093
!	%f22 = 00000000 5b85c0ff, Mem[00000000100c1410] = 43000000 00000000
	stda	%f22,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000 5b85c0ff
!	Mem[00000000100c1438] = 000000ffaf0a9706, %l5 = 0000000000000093, %l6 = ffffffffffffffff
	add	%i3,0x38,%g1
	casxa	[%g1]0x80,%l5,%l6	! %l6 = 000000ffaf0a9706
!	%l2 = 00000043, %l3 = 00000000, Mem[0000000030101408] = 00000093 00000000
	stda	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000043 00000000
!	%f6  = b7886038 c7000000, Mem[0000000010181408] = ff000000 80ffffff
	stda	%f6 ,[%i6+%o4]0x80	! Mem[0000000010181408] = b7886038 c7000000
!	Mem[0000000030081400] = 000000c7, %l3 = 0000000000000000
	ldstuba	[%i2+%g0]0x89,%l3	! %l3 = 00000000000000c7
!	%l4 = 00000000, %l5 = 00000093, Mem[0000000010141418] = 000000ff 00000018
	std	%l4,[%i5+0x018]		! Mem[0000000010141418] = 00000000 00000093

p0_label_370:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 0000261b, %l7 = 0000000000000080
	lduwa	[%i2+%g0]0x88,%l7	! %l7 = 000000000000261b
	membar	#Sync			! Added by membar checker (75)
!	Mem[0000000010181400] = 00000000 a7f4d91b b7886038 c7000000
!	Mem[0000000010181410] = 3400ffff 00000000 000000aa 00000000
!	Mem[0000000010181420] = a55a73b6 40d11cbf 0000ff00 79bf2e00
!	Mem[0000000010181430] = 000000ff 000000ff 0000ffff 00000000
	ldda	[%i6+%g0]ASI_BLK_AIUPL,%f0 	! Block Load from 0000000010181400
!	Mem[0000000010181408] = b7886038, %l2 = 0000000000000043
	lduwa	[%i6+%o4]0x80,%l2	! %l2 = 00000000b7886038
!	%f2  = 000000c7, %f18 = 7200ec95, %f20 = 000000ff
	fdivs	%f2 ,%f18,%f20		! %f20 = 00000000
!	Mem[0000000010181400] = 00000000, %l2 = 00000000b7886038
	lduwa	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = 00000000 ffff0034, %l6 = af0a9706, %l7 = 0000261b
	ldda	[%i5+%o5]0x80,%l6	! %l6 = 0000000000000000 00000000ffff0034
!	Mem[00000000300c1410] = 000000ff, %f26 = 0000ffff
	lda	[%i3+%o5]0x81,%f26	! %f26 = 000000ff
!	Mem[0000000030141408] = 80000000, %l4 = 0000000000000000
	ldsha	[%i5+%o4]0x81,%l4	! %l4 = ffffffffffff8000
!	Mem[0000000030101410] = 0000000000000000, %f20 = 00000000 ffff0000
	ldda	[%i4+%o5]0x89,%f20	! %f20 = 00000000 00000000
!	Mem[0000000010101410] = 48000000, %l0 = 0000000000000000
	ldswa	[%i4+%o5]0x80,%l0	! %l0 = 0000000048000000

p0_label_371:
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffff8000, Mem[0000000030001408] = 95ec0072
	stha	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 95ec8000
!	%f20 = 00000000 00000000, Mem[0000000010141400] = 00000080 00000000
	stda	%f20,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000 00000000
!	Mem[0000000010001410] = ffff0000, %l5 = 0000000000000093
	swapa	[%i0+%o5]0x88,%l5	! %l5 = 00000000ffff0000
!	Mem[0000000021800140] = 843689c0, %l5 = 00000000ffff0000
	ldstuba	[%o3+0x140]%asi,%l5	! %l5 = 0000000000000084
!	Mem[0000000030141410] = 00005900, %l2 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l2	! %l2 = 0000000000005900
!	Mem[0000000010081410] = 0000ffa7, %l3 = 00000000000000c7
	swapa	[%i2+%o5]0x80,%l3	! %l3 = 000000000000ffa7
!	%f22 = 00000000, Mem[0000000010081400] = 0000261b
	sta	%f22,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
	membar	#Sync			! Added by membar checker (76)
!	%l0 = 0000000048000000, Mem[0000000010181408] = b7886038c7000000
	stxa	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000048000000
!	Mem[0000000030101410] = 00000000, %l2 = 0000000000005900
	swapa	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000
!	%l2 = 00000000, %l3 = 0000ffa7, Mem[0000000030001400] = 1bd9f4a7 00000000
	stda	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 0000ffa7

p0_label_372:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101418] = 00000000 000000cc, %l4 = ffff8000, %l5 = 00000084, %asi = 80
	ldda	[%i4+0x018]%asi,%l4	! %l4 = 0000000000000000 00000000000000cc
!	Mem[0000000010001408] = ff000000ff0000ff, %l1 = 0000000000000000
	ldxa	[%i0+%o4]0x88,%l1	! %l1 = ff000000ff0000ff
!	Mem[0000000030041408] = ff00006d00000000, %f8  = bf1cd140 b6735aa5
	ldda	[%i1+%o4]0x81,%f8 	! %f8  = ff00006d 00000000
!	Mem[0000000030181408] = 5b85c0ff, %l4 = 0000000000000000
	lduwa	[%i6+%o4]0x89,%l4	! %l4 = 000000005b85c0ff
!	Mem[00000000300c1408] = 00000000, %l3 = 000000000000ffa7
	lduwa	[%i3+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = 00000000 000000cc, %l6 = 00000000, %l7 = ffff0034
	ldda	[%i0+%g0]0x88,%l6	! %l6 = 00000000000000cc 0000000000000000
!	Mem[0000000020800041] = 0000b270, %l0 = 0000000048000000
	ldub	[%o1+0x041],%l0		! %l0 = 0000000000000000
!	Mem[0000000010181403] = 00000000, %l3 = 0000000000000000
	ldsb	[%i6+0x003],%l3		! %l3 = 0000000000000000
!	Mem[0000000030001408] = 0080ec95, %l3 = 0000000000000000
	ldswa	[%i0+%o4]0x81,%l3	! %l3 = 000000000080ec95
!	%f12 = ff000000 ff000000, %f25 = b6735aa5
	fdtoi	%f12,%f25		! %f25 = 80000000

p0_label_373:
!	Starting 10 instruction Store Burst
!	%f16 = 1bd9f4a7 00000000, Mem[00000000100c1408] = 00000043 00000000
	stda	%f16,[%i3+%o4]0x80	! Mem[00000000100c1408] = 1bd9f4a7 00000000
!	Mem[0000000010001410] = 00000093, %l5 = 00000000000000cc
	ldstuba	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000093
!	Mem[00000000201c0001] = 00431a10, %l1 = ff000000ff0000ff
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 0000000000000043
!	Mem[0000000010141434] = 000000ff, %l6 = 00000000000000cc
	swap	[%i5+0x034],%l6		! %l6 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[00000000211c0000] = ffff38a0, %asi = 80
	stha	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ff38a0
!	%l4 = 5b85c0ff, %l5 = 00000093, Mem[0000000010041430] = 00000000 6d000000
	std	%l4,[%i1+0x030]		! Mem[0000000010041430] = 5b85c0ff 00000093
!	Mem[0000000020800040] = 0000b270, %l0 = 0000000000000000
	ldstuba	[%o1+0x040]%asi,%l0	! %l0 = 0000000000000000
!	%l6 = 00000000000000ff, Mem[0000000010141416] = ffff0034
	sth	%l6,[%i5+0x016]		! Mem[0000000010141414] = ffff00ff
!	%f14 = 00000000 ffff0000, Mem[00000000300c1408] = 00000000 0000ff54
	stda	%f14,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000 ffff0000
!	Mem[0000000020800041] = ff00b270, %l0 = 0000000000000000
	ldstuba	[%o1+0x041]%asi,%l0	! %l0 = 0000000000000000

p0_label_374:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = fffc1fff 00000000, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i2+%o4]0x81,%l6	! %l6 = 00000000fffc1fff 0000000000000000
!	Mem[0000000030081400] = 00000000000000ff, %f0  = 1bd9f4a7 00000000
	ldda	[%i2+%g0]0x89,%f0 	! %f0  = 00000000 000000ff
!	Mem[0000000030041400] = 48ba57e5 0000ffcd, %l0 = 00000000, %l1 = 00000043
	ldda	[%i1+%g0]0x89,%l0	! %l0 = 000000000000ffcd 0000000048ba57e5
!	Mem[00000000201c0000] = 00ff1a10, %l1 = 0000000048ba57e5, %asi = 80
	ldsha	[%o0+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141408] = 80000000000000ff, %l3 = 000000000080ec95
	ldxa	[%i5+%o4]0x81,%l3	! %l3 = 80000000000000ff
!	Mem[0000000030081408] = ff1ffcff, %l6 = 00000000fffc1fff
	ldsha	[%i2+%o4]0x89,%l6	! %l6 = fffffffffffffcff
!	Mem[0000000010081410] = 000000c7, %l0 = 000000000000ffcd
	ldsba	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l3 = 80000000000000ff
	ldsha	[%i2+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l0 = 0000000000000000
	ldswa	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141408] = ff000000, %l4 = 000000005b85c0ff
	ldsh	[%i5+%o4],%l4		! %l4 = ffffffffffffff00

p0_label_375:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l2	! %l2 = 0000000000000000
!	%l6 = fffffcff, %l7 = 00000000, Mem[0000000030141408] = 80000000 000000ff
	stda	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = fffffcff 00000000
!	Mem[0000000010001410] = 000000ff, %l4 = 00000000ffffff00
	swapa	[%i0+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081408] = fffc1fff, %l2 = 0000000000000000
	swapa	[%i2+%o4]0x81,%l2	! %l2 = 00000000fffc1fff
!	%l3 = 0000000000000000, Mem[00000000100c1400] = 00430000000000ff
	stx	%l3,[%i3+%g0]		! Mem[00000000100c1400] = 0000000000000000
!	%f0  = 00000000 000000ff, Mem[0000000010181410] = 3400ffff 00000000
	stda	%f0 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000 000000ff
!	%f21 = 00000000, Mem[0000000010141410] = 00000000
	sta	%f21,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	Mem[0000000030001410] = 000000ff, %l4 = 00000000000000ff
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000000
!	%l5 = 0000000000000093, imm = 000000000000095c, %l3 = 0000000000000000
	xor	%l5,0x95c,%l3		! %l3 = 00000000000009cf
!	%f1  = 000000ff, Mem[0000000010001400] = cc000000
	sta	%f1 ,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000ff

p0_label_376:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00000043, %l5 = 0000000000000093
	lduba	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000043
!	Mem[0000000010041410] = 0000421f, %l2 = 00000000fffc1fff
	lduwa	[%i1+%o5]0x80,%l2	! %l2 = 000000000000421f
!	Mem[0000000010041418] = 000000ec, %l0 = 0000000000000000, %asi = 80
	lduwa	[%i1+0x018]%asi,%l0	! %l0 = 00000000000000ec
!	Mem[0000000030141408] = fffffcff, %l4 = 0000000000000000
	lduwa	[%i5+%o4]0x81,%l4	! %l4 = 00000000fffffcff
!	Mem[0000000030041400] = 0000ffcd, %l3 = 00000000000009cf
	ldsba	[%i1+%g0]0x89,%l3	! %l3 = ffffffffffffffcd
!	Mem[0000000030101408] = 00000043, %l6 = fffffffffffffcff
	lduwa	[%i4+%o4]0x89,%l6	! %l6 = 0000000000000043
	membar	#Sync			! Added by membar checker (77)
!	Mem[0000000010001400] = 000000ff 00000000 ff0000ff 000000ff
!	Mem[0000000010001410] = 00ffffff 00006d00 ff000016 000000cc
!	Mem[0000000010001420] = 000000ff 00ff00ff a724226d 61d05459
!	Mem[0000000010001430] = ff000000 000000ff 000000ff 0aaf002e
	ldda	[%i0+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010001400
!	Mem[00000000201c0000] = 00ff1a10, %l2 = 000000000000421f
	ldsb	[%o0+%g0],%l2		! %l2 = 0000000000000000
!	Mem[00000000100c1404] = 00000000, %l1 = 00000000000000ff
	lduw	[%i3+0x004],%l1		! %l1 = 0000000000000000
!	Mem[0000000010181408] = 0000000048000000, %f22 = 00000000 5b85c0ff
	ldda	[%i6+%o4]0x80,%f22	! %f22 = 00000000 48000000

p0_label_377:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000043, Mem[0000000010081408] = 1f420000
	stha	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = 1f420043
!	Mem[0000000030001410] = ff0000ff, %l5 = 0000000000000043
	ldstuba	[%i0+%o5]0x81,%l5	! %l5 = 00000000000000ff
	membar	#Sync			! Added by membar checker (78)
!	%l6 = 00000043, %l7 = 00000000, Mem[0000000010001408] = ff0000ff 000000ff
	std	%l6,[%i0+%o4]		! Mem[0000000010001408] = 00000043 00000000
!	%l6 = 0000000000000043, Mem[00000000100c1408] = 1bd9f4a7
	stha	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0043f4a7
!	Mem[0000000010101419] = 00000000, %l1 = 0000000000000000
	ldstub	[%i4+0x019],%l1		! %l1 = 0000000000000000
!	Mem[0000000030181400] = ff000079, %l1 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l1	! %l1 = 00000000ff000079
!	Mem[0000000010141400] = 0000000000000000, %l4 = 00000000fffffcff, %l6 = 0000000000000043
	casxa	[%i5]0x80,%l4,%l6	! %l6 = 0000000000000000
!	%l4 = 00000000fffffcff, Mem[0000000010001410] = 00ffffff
	sth	%l4,[%i0+%o5]		! Mem[0000000010001410] = fcffffff
!	%f9  = 00ff00ff, Mem[0000000010041408] = ffff00ff
	sta	%f9 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 00ff00ff
!	%f28 = ff000000 00000080, Mem[0000000010101408] = 00000000 00000000
	stda	%f28,[%i4+%o4]0x88	! Mem[0000000010101408] = ff000000 00000080

p0_label_378:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 000000ff, %f18 = 7200ec95
	lda	[%i3+%o5]0x81,%f18	! %f18 = 000000ff
!	Mem[0000000010181400] = 00000000, %l1 = 00000000ff000079
	lduha	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[000000001004140a] = ff00ff00, %l3 = ffffffffffffffcd, %asi = 80
	lduha	[%i1+0x00a]%asi,%l3	! %l3 = 000000000000ff00
!	Mem[0000000030181410] = 00000000ffffffff, %l6 = 0000000000000000
	ldxa	[%i6+%o5]0x89,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000010001408] = 00000043, %l1 = 0000000000000000
	lduwa	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000043
!	Mem[0000000030141410] = 00000000, %l2 = 0000000000000000
	ldswa	[%i5+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081410] = c7000000, %l6 = 00000000ffffffff
	lduba	[%i2+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041408] = ff00ff00, %l5 = 00000000000000ff
	lduha	[%i1+%o4]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030041408] = ff00006d, %l6 = 0000000000000000
	lduba	[%i1+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1400] = 00000000 000000ff, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000ff 0000000000000000

p0_label_379:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 00000048, %l5 = 000000000000ff00
	ldstuba	[%i4+%o5]0x88,%l5	! %l5 = 0000000000000048
!	Mem[00000000300c1410] = ff000000, %l6 = 00000000000000ff
	swapa	[%i3+%o5]0x89,%l6	! %l6 = 00000000ff000000
!	%l3 = 000000000000ff00, %l3 = 000000000000ff00, %l2  = 0000000000000000
	mulx	%l3,%l3,%l2		! %l2 = 00000000fe010000
!	%l6 = ff000000, %l7 = 00000000, Mem[0000000010181418] = 000000aa 00000000, %asi = 80
	stda	%l6,[%i6+0x018]%asi	! Mem[0000000010181418] = ff000000 00000000
!	%l4 = fffffcff, %l5 = 00000048, Mem[0000000010001408] = 00000043 00000000
	std	%l4,[%i0+%o4]		! Mem[0000000010001408] = fffffcff 00000048
!	Mem[0000000010181414] = 000000ff, %l1 = 0000000000000043, %asi = 80
	swapa	[%i6+0x014]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030041408] = ff00006d, %l6 = 00000000ff000000
	swapa	[%i1+%o4]0x81,%l6	! %l6 = 00000000ff00006d
!	%f0  = 000000ff, Mem[0000000030101408] = 43000000
	sta	%f0 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ff
!	%l5 = 0000000000000048, Mem[0000000030181408] = 3f81b95b5b85c0ff
	stxa	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000000000000048
!	%f20 = 00000000 00000000, %l3 = 000000000000ff00
!	Mem[0000000010101420] = ffffd91b00d1006d
	add	%i4,0x020,%g1
	stda	%f20,[%g1+%l3]ASI_PST32_P ! Mem[0000000010101420] = ffffd91b00d1006d

p0_label_380:
!	Starting 10 instruction Load Burst
!	%f0  = 000000ff, %f4  = 00ffffff
	fsqrts	%f0 ,%f4 		! tt=0x22, %l0 = 000000000000010e
!	Mem[0000000030081408] = 00000000, %l7 = 0000000000000000
	ldsba	[%i2+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l7 = 0000000000000000
	lduha	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l2 = 00000000fe010000
	ldswa	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1418] = 5ae4ffff000000c7, %l4 = 00000000fffffcff
	ldx	[%i3+0x018],%l4		! %l4 = 5ae4ffff000000c7
!	Mem[0000000030181408] = 00000048, %f3  = 000000ff
	lda	[%i6+%o4]0x89,%f3 	! %f3 = 00000048
!	Mem[0000000010081410] = 000000c7, %l1 = 00000000000000ff
	ldsha	[%i2+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l1 = 0000000000000000
	lduba	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101406] = ffffffff, %l1 = 0000000000000000, %asi = 80
	lduha	[%i4+0x006]%asi,%l1	! %l1 = 000000000000ffff
!	Mem[000000001004143f] = ffff0034, %l1 = 000000000000ffff, %asi = 80
	ldsba	[%i1+0x03f]%asi,%l1	! %l1 = 0000000000000034

p0_label_381:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000034, Mem[0000000030181400] = 0000000000000000
	stxa	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000000000000034
!	%l5 = 0000000000000048, immd = 000009b0, %y  = 00000000
	sdiv	%l5,0x9b0,%l0		! %l0 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000021800101] = ffcd1b90, %l6 = 00000000ff00006d
	ldstub	[%o3+0x101],%l6		! %l6 = 00000000000000cd
!	%l2 = 0000000000000000, Mem[00000000300c1400] = ff000000
	stba	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	%l4 = 5ae4ffff000000c7, Mem[00000000100c1410] = 00000000
	stba	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000c7
!	%l2 = 0000000000000000, Mem[0000000010001408] = fffcffff
	stha	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = fffc0000
!	%l1 = 0000000000000034, Mem[0000000010001400] = 000000ff
	stha	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = 003400ff
!	%l0 = 00000000, %l1 = 00000034, Mem[0000000030141400] = ffff0000 ffff0034
	stda	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000 00000034
!	%l2 = 0000000000000000, Mem[0000000010041410] = 1f420000
	stba	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 1f420000
!	%f22 = 00000000, Mem[0000000030041400] = 0000ffcd
	sta	%f22,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000

p0_label_382:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = fffffcff, %l5 = 0000000000000048
	ldswa	[%i5+%o4]0x81,%l5	! %l5 = fffffffffffffcff
!	Mem[0000000010081410] = 000000c70000ff00, %f26 = 000000ff 6d000000
	ldda	[%i2+%o5]0x80,%f26	! %f26 = 000000c7 0000ff00
!	Mem[00000000100c1428] = ffe0ffff 48ba57e5, %l0 = 00000000, %l1 = 00000034
	ldd	[%i3+0x028],%l0		! %l0 = 00000000ffe0ffff 0000000048ba57e5
!	Mem[0000000010081400] = 00000000, %f13 = 000000ff
	lda	[%i2+%g0]0x88,%f13	! %f13 = 00000000
!	Mem[0000000030141410] = 00000000, %f21 = 00000000
	lda	[%i5+%o5]0x89,%f21	! %f21 = 00000000
!	Mem[00000000300c1408] = 00000000, %l2 = 0000000000000000
	ldswa	[%i3+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = 48ba57e5 00000000, %l2 = 00000000, %l3 = 0000ff00
	ldda	[%i1+%g0]0x89,%l2	! %l2 = 0000000000000000 0000000048ba57e5
!	Mem[0000000010141400] = 00000000 00000000 ff000000 00000000
!	Mem[0000000010141410] = 00000000 ffff00ff 00000000 00000093
!	Mem[0000000010141420] = 0000006d 000000ff 0000ff1f ec0000ff
!	Mem[0000000010141430] = ff005a00 000000cc 00000000 00ff00ff
	ldda	[%i5+%g0]ASI_BLK_PL,%f0 	! Block Load from 0000000010141400
!	Mem[0000000010101400] = ffffffffaf0a0093, %l0 = 00000000ffe0ffff
	ldxa	[%i4+%g0]0x88,%l0	! %l0 = ffffffffaf0a0093
!	Mem[0000000030041408] = 000000ff, %l3 = 0000000048ba57e5
	lduwa	[%i1+%o4]0x89,%l3	! %l3 = 00000000000000ff

p0_label_383:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 000000ff, %l1 = 0000000048ba57e5
	swapa	[%i4+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	%f22 = 00000000 48000000, %l6 = 00000000000000cd
!	Mem[0000000010101418] = 00ff0000000000cc
	add	%i4,0x018,%g1
	stda	%f22,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010101418] = 00ff004800000000
!	Mem[0000000010181408] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010001428] = a724226d
	stw	%l7,[%i0+0x028]		! Mem[0000000010001428] = 00000000
!	%f28 = ff000000 00000080, Mem[0000000030081408] = 00000000 00000000
	stda	%f28,[%i2+%o4]0x81	! Mem[0000000030081408] = ff000000 00000080
!	Mem[0000000030081400] = ff000000 00000000 ff000000 00000080
!	%f16 = 1bd9f4a7 00000000 000000ff 79bf2e00
!	%f20 = 00000000 00000000 00000000 48000000
!	%f24 = bf1cd140 80000000 000000c7 0000ff00
!	%f28 = ff000000 00000080 00000000 ffff0000
	stda	%f16,[%i2+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030081400
!	%l1 = 00000000000000ff, Mem[0000000030081408] = 002ebf79
	stba	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = ff2ebf79
!	Mem[0000000030181400] = 00000034, %l4 = 00000000000000c7
	swapa	[%i6+%g0]0x89,%l4	! %l4 = 0000000000000034
!	%f8  = ff000000 6d000000, Mem[0000000010081408] = 4300421f 000000ff
	stda	%f8 ,[%i2+%o4]0x80	! Mem[0000000010081408] = ff000000 6d000000
!	Mem[0000000010141400] = 00000000, %l1 = 00000000000000ff
	swapa	[%i5+%g0]0x88,%l1	! %l1 = 0000000000000000

p0_label_384:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 34000000 00000000, %l4 = 00000034, %l5 = fffffcff
	ldda	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000000 0000000034000000
!	Mem[000000001004140c] = 00000000, %l5 = 0000000034000000, %asi = 80
	lduwa	[%i1+0x00c]%asi,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (79)
!	Mem[0000000010081410] = 00ff0000c7000000, %f10 = ff0000ec 1fff0000
	ldda	[%i2+%o5]0x88,%f10	! %f10 = 00ff0000 c7000000
!	Mem[0000000010181408] = ff00000048000000, %l1 = 0000000000000000
	ldxa	[%i6+%o4]0x80,%l1	! %l1 = ff00000048000000
!	Mem[0000000010141428] = 0000ff1f, %l2 = 0000000000000000, %asi = 80
	lduha	[%i5+0x028]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = 000000ff, %f1  = 00000000
	lda	[%i2+%o4]0x88,%f1 	! %f1 = 000000ff
!	Mem[00000000100c1400] = 00000000, %f2  = 00000000
	lda	[%i3+%g0]0x80,%f2 	! %f2 = 00000000
!	Mem[0000000010101410] = 000000ff, %l6 = 00000000000000cd
	swapa	[%i4+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001408] = 002ebf7995ec8000, %l3 = 00000000000000ff
	ldxa	[%i0+%o4]0x89,%l3	! %l3 = 002ebf7995ec8000
!	Mem[0000000030001408] = 0080ec95, %l6 = 00000000000000ff
	ldswa	[%i0+%o4]0x81,%l6	! %l6 = 000000000080ec95

p0_label_385:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000030101408] = 48ba57e5
	stha	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 000057e5
!	%f16 = 1bd9f4a7 00000000, Mem[0000000010101438] = 00000000 00000043, %asi = 80
	stda	%f16,[%i4+0x038]%asi	! Mem[0000000010101438] = 1bd9f4a7 00000000
!	%l7 = 0000000000000000, Mem[0000000021800100] = ffff1b90
	sth	%l7,[%o3+0x100]		! Mem[0000000021800100] = 00001b90
!	Mem[0000000010101418] = 00ff004800000000, %l5 = 0000000000000000
	ldx	[%i4+0x018],%l5		! %l5 = 00ff004800000000
!	Mem[0000000030141400] = 00000000 00000034 fffffcff 00000000
!	%f0  = 00000000 000000ff 00000000 000000ff
!	%f4  = ff00ffff 00000000 93000000 00000000
!	%f8  = ff000000 6d000000 00ff0000 c7000000
!	%f12 = cc000000 005a00ff ff00ff00 00000000
	stda	%f0 ,[%i5+%g0]ASI_BLK_S	! Block Store to 0000000030141400
!	%l4 = 00000000, %l5 = 00000000, Mem[00000000100c1408] = a7f44300 00000000
	stda	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 00000000
!	%l5 = 00ff004800000000, Mem[0000000010001408] = fffc0000
	stha	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = fffc0000
!	%l7 = 0000000000000000, Mem[0000000010141408] = 00000000000000ff
	stxa	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l4 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%l0 = ffffffffaf0a0093, Mem[00000000218001c0] = 5ac7da20, %asi = 80
	stha	%l0,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 0093da20

p0_label_386:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff0000ff, %l4 = 0000000000000000
	lduha	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	%f0  = 00000000, %f9  = 6d000000
	fcmpes	%fcc2,%f0 ,%f9 		! %fcc2 = 1
!	%f26 = 000000c7, %f26 = 000000c7, %f31 = ffff0000
	fmuls	%f26,%f26,%f31		! %f31 = 00000000
!	Mem[00000000100c1427] = 6d94137c, %l2 = 0000000000000000
	ldsb	[%i3+0x027],%l2		! %l2 = 000000000000007c
!	Mem[0000000010081400] = 00000000, %l0 = ffffffffaf0a0093
	lduwa	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (80)
!	Mem[0000000030141408] = 00000000, %f21 = 00000000
	lda	[%i5+%o4]0x89,%f21	! %f21 = 00000000
!	Mem[0000000030101400] = cf14ffa000004243, %l0 = 0000000000000000
	ldxa	[%i4+%g0]0x89,%l0	! %l0 = cf14ffa000004243
!	Mem[0000000010001408] = fffc0000, %l1 = ff00000048000000
	lduba	[%i0+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141430] = ff005a00000000cc, %f24 = bf1cd140 80000000, %asi = 80
	ldda	[%i5+0x030]%asi,%f24	! %f24 = ff005a00 000000cc
!	Mem[0000000030041400] = 00000000, %l1 = 0000000000000000
	lduba	[%i1+%g0]0x89,%l1	! %l1 = 0000000000000000

p0_label_387:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101414] = 00000000, %l1 = 0000000000000000
	ldstub	[%i4+0x014],%l1		! %l1 = 0000000000000000
!	%f28 = ff000000 00000080, Mem[00000000100c1408] = 00000000 00000000
	stda	%f28,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff000000 00000080
!	Mem[0000000030041408] = ff000000, %l2 = 000000000000007c
	swapa	[%i1+%o4]0x81,%l2	! %l2 = 00000000ff000000
!	%l3 = 002ebf7995ec8000, Mem[0000000030101400] = 00004243
	stwa	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = 95ec8000
!	Mem[00000000100c1406] = 00000000, %l5 = 00ff004800000000
	ldstuba	[%i3+0x006]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 000000c7, %l4 = 00000000000000ff
	ldstuba	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000c7
!	Mem[0000000010001418] = ff000016, %l3 = 0000000095ec8000, %asi = 80
	swapa	[%i0+0x018]%asi,%l3	! %l3 = 00000000ff000016
!	%f14 = ff00ff00 00000000, Mem[00000000100c1408] = 00000080 ff000000
	stda	%f14,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff00ff00 00000000
!	Mem[0000000010081408] = ff000000, %l7 = 0000000000000000
	ldstuba	[%i2+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%l2 = 00000000ff000000, Mem[0000000030101400] = 0080ec95a0ff14cf
	stxa	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000ff000000

p0_label_388:
!	Starting 10 instruction Load Burst
!	Mem[000000001010143a] = 1bd9f4a7, %l3 = 00000000ff000016, %asi = 80
	lduha	[%i4+0x03a]%asi,%l3	! %l3 = 000000000000f4a7
!	Mem[0000000021800140] = ff3689c0, %l3 = 000000000000f4a7, %asi = 80
	lduba	[%o3+0x140]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1408] = 00000000, %l2 = 00000000ff000000
	ldswa	[%i3+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000201c0000] = 00ff1a10, %l3 = 00000000000000ff
	lduh	[%o0+%g0],%l3		! %l3 = 00000000000000ff
!	Mem[0000000030081408] = 000000ff79bf2eff, %l2 = 0000000000000000
	ldxa	[%i2+%o4]0x89,%l2	! %l2 = 000000ff79bf2eff
!	Mem[0000000030181400] = c7000000, %l1 = 0000000000000000
	ldsha	[%i6+%g0]0x81,%l1	! %l1 = ffffffffffffc700
!	Mem[0000000010041400] = d91b00ff, %l3 = 00000000000000ff
	ldsba	[%i1+%g0]0x80,%l3	! %l3 = ffffffffffffffd9
!	Mem[0000000030041400] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181410] = 4300000000000000, %l0 = cf14ffa000004243
	ldxa	[%i6+%o5]0x88,%l0	! %l0 = 4300000000000000
!	Mem[0000000010001400] = 003400ff, %l1 = ffffffffffffc700
	ldsba	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000000

p0_label_389:
!	Starting 10 instruction Store Burst
!	Mem[0000000020800000] = ff5aa840, %l7 = 0000000000000000
	ldstuba	[%o1+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	%l4 = 00000000000000c7, Mem[0000000010181410] = 0000000000000043
	stxa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000000000c7
!	%l3 = ffffffffffffffd9, Mem[0000000010001438] = 000000ff0aaf002e
	stx	%l3,[%i0+0x038]		! Mem[0000000010001438] = ffffffffffffffd9
!	%l6 = 0080ec95, %l7 = 000000ff, Mem[0000000010181428] = 0000ff00 79bf2e00
	std	%l6,[%i6+0x028]		! Mem[0000000010181428] = 0080ec95 000000ff
!	Mem[000000001008141c] = 00000000, %l4 = 00000000000000c7
	swap	[%i2+0x01c],%l4		! %l4 = 0000000000000000
!	Mem[0000000010081408] = ff000000, %l2 = 0000000079bf2eff
	swapa	[%i2+%o4]0x80,%l2	! %l2 = 00000000ff000000
!	%l5 = 0000000000000000, Mem[0000000030081408] = ff2ebf79ff000000
	stxa	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000000000000
!	%l3 = ffffffffffffffd9, Mem[00000000300c1400] = 0000000000000000
	stxa	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffffffffffd9
!	Mem[0000000020800041] = ffffb270, %l2 = 00000000ff000000
	ldstub	[%o1+0x041],%l2		! %l2 = 00000000000000ff
!	%f26 = 000000c7 0000ff00, %l1 = 0000000000000000
!	Mem[00000000300c1400] = ffffffffffffffd9
	stda	%f26,[%i3+%l1]ASI_PST16_SL ! Mem[00000000300c1400] = ffffffffffffffd9

p0_label_390:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00000000, %l6 = 000000000080ec95
	ldswa	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181400] = c700000000000000, %f8  = ff000000 6d000000
	ldda	[%i6+%g0]0x81,%f8 	! %f8  = c7000000 00000000
!	Mem[0000000010001428] = 00000000, %l1 = 0000000000000000, %asi = 80
	ldswa	[%i0+0x028]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101408] = 00000000e5570000, %f30 = 00000000 00000000
	ldda	[%i4+%o4]0x89,%f30	! %f30 = 00000000 e5570000
!	Mem[00000000211c0000] = 00ff38a0, %l6 = 0000000000000000, %asi = 80
	lduha	[%o2+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1400] = d9ffffff ffffffff, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i3+%g0]0x89,%l6	! %l6 = 00000000ffffffff 00000000d9ffffff
!	Code Fragment 3, seed = 70665
p0_fragment_37:
!	%l0 = 4300000000000000
	setx	0x02c3b718024e30de,%g7,%l0 ! %l0 = 02c3b718024e30de
!	%l1 = 0000000000000000
	setx	0x9b15ed81316f6789,%g7,%l1 ! %l1 = 9b15ed81316f6789
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 02c3b718024e30de
	setx	0xd7e172aab8107a44,%g7,%l0 ! %l0 = d7e172aab8107a44
!	%l1 = 9b15ed81316f6789
	setx	0x051c531ae067ec0f,%g7,%l1 ! %l1 = 051c531ae067ec0f
p0_fragment_37_end:
!	Mem[0000000010181410] = 00000000000000c7, %l7 = 00000000d9ffffff
	ldxa	[%i6+%o5]0x80,%l7	! %l7 = 00000000000000c7
!	Mem[0000000010041400] = fffc1fffff001bd9, %f26 = 000000c7 0000ff00
	ldda	[%i1+%g0]0x88,%f26	! %f26 = fffc1fff ff001bd9
!	%l7 = 00000000000000c7, %l6 = 00000000ffffffff, %l4 = 0000000000000000
	orn	%l7,%l6,%l4		! %l4 = ffffffff000000c7

p0_label_391:
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffd9, Mem[0000000030101400] = 000000ff00000000
	stxa	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffffffffffffd9
!	%l2 = 00000000000000ff, Mem[000000001014143b] = 00000000, %asi = 80
	stba	%l2,[%i5+0x03b]%asi	! Mem[0000000010141438] = 000000ff
!	Mem[0000000010101410] = cd000000, %l2 = 00000000000000ff
	swapa	[%i4+%o5]0x80,%l2	! %l2 = 00000000cd000000
!	Mem[00000000100c1400] = 00000000, %l6 = 00000000ffffffff
	swapa	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c140b] = 00000000, %l7 = 00000000000000c7
	ldstub	[%i3+0x00b],%l7		! %l7 = 0000000000000000
!	Mem[0000000010141400] = ff000000, %l6 = 0000000000000000
	ldstuba	[%i5+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	%l2 = 00000000cd000000, Mem[0000000030001408] = 002ebf7995ec8000
	stxa	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000cd000000
!	%l0 = d7e172aab8107a44, Mem[0000000030181400] = c7000000
	stwa	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = b8107a44
!	%f18 = 000000ff, Mem[000000001004141c] = 1bd9f4a7
	st	%f18,[%i1+0x01c]	! Mem[000000001004141c] = 000000ff
!	Mem[0000000010181400] = 00000000, %l7 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000

p0_label_392:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 93000aaf ffffffff, %l6 = 000000ff, %l7 = 00000000
	ldd	[%i4+%g0],%l6		! %l6 = 0000000093000aaf 00000000ffffffff
!	Mem[0000000010041408] = ff00ff00 00000000, %l4 = 000000c7, %l5 = 00000000
	ldda	[%i1+%o4]0x80,%l4	! %l4 = 00000000ff00ff00 0000000000000000
!	Mem[0000000010041410] = 0000421f, %f0  = 00000000
	lda	[%i1+%o5]0x80,%f0 	! %f0 = 0000421f
!	Mem[0000000010101408] = 80000000, %l3 = ffffffffffffffd9, %asi = 80
	ldswa	[%i4+0x008]%asi,%l3	! %l3 = ffffffff80000000
!	Mem[0000000030041408] = 0000007c, %f18 = 000000ff
	lda	[%i1+%o4]0x81,%f18	! %f18 = 0000007c
!	Mem[0000000030181408] = 48000000, %l1 = 051c531ae067ec0f
	ldsba	[%i6+%o4]0x81,%l1	! %l1 = 0000000000000048
!	Mem[00000000300c1400] = ffffffffffffffd9, %l6 = 0000000093000aaf
	ldxa	[%i3+%g0]0x81,%l6	! %l6 = ffffffffffffffd9
!	Mem[0000000010041410] = ff0000001f420000, %f6  = 93000000 00000000
	ldda	[%i1+%o5]0x88,%f6 	! %f6  = ff000000 1f420000
!	Mem[0000000030141408] = 00000000 000000ff, %l2 = cd000000, %l3 = 80000000
	ldda	[%i5+%o4]0x81,%l2	! %l2 = 0000000000000000 00000000000000ff
!	Mem[0000000010141400] = ff000000, %l1 = 0000000000000048
	ldswa	[%i5+%g0]0x80,%l1	! %l1 = ffffffffff000000

p0_label_393:
!	Starting 10 instruction Store Burst
!	%l0 = d7e172aab8107a44, Mem[0000000030041408] = 0000007c
	stba	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 4400007c
!	Mem[000000001010143b] = 1bd9f4a7, %l2 = 0000000000000000
	ldstub	[%i4+0x03b],%l2		! %l2 = 00000000000000a7
!	%l0 = b8107a44, %l1 = ff000000, Mem[0000000010101410] = ff000000 000000ff
	stda	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = b8107a44 ff000000
!	Mem[00000000218000c0] = e5ff2960, %l3 = 00000000000000ff
	ldstub	[%o3+0x0c0],%l3		! %l3 = 00000000000000e5
!	%f2  = 00000000 000000ff, Mem[0000000010001400] = ff003400 00000000
	stda	%f2 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000 000000ff
!	%l5 = 0000000000000000, Mem[0000000030101408] = e5570000
	stha	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = e5570000
!	%l0 = b8107a44, %l1 = ff000000, Mem[0000000030181410] = ffffffff 00000000
	stda	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = b8107a44 ff000000
!	%l4 = ff00ff00, %l5 = 00000000, Mem[0000000010041400] = d91b00ff ff1ffcff
	stda	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = ff00ff00 00000000
!	Mem[00000000100c1408] = 000000ff, %l4 = 00000000ff00ff00
	swapa	[%i3+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%l2 = 00000000000000a7, Mem[0000000010101400] = 93000aaf
	stha	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 00a70aaf

p0_label_394:
!	Starting 10 instruction Load Burst
!	%l2 = 00000000000000a7, %l3 = 00000000000000e5, %l0 = d7e172aab8107a44
	subc	%l2,%l3,%l0		! %l0 = ffffffffffffffc2
!	Mem[0000000030081410] = 00000000, %l1 = ffffffffff000000
	ldsba	[%i2+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = 447a10b8 000000ff, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i4+%o5]0x80,%l4	! %l4 = 00000000447a10b8 00000000000000ff
!	Mem[0000000010041410] = 0000421f, %l4 = 00000000447a10b8
	ldsba	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = 000000c7, %l3 = 00000000000000e5
	lduha	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%f31 = e5570000, %f25 = 000000cc
	fsqrts	%f31,%f25		! %f25 = 7fffffff
!	Mem[0000000030181400] = 447a10b8, %l1 = 0000000000000000
	ldsba	[%i6+%g0]0x89,%l1	! %l1 = ffffffffffffffb8
!	Mem[000000001018143c] = 00000000, %l6 = ffffffffffffffd9
	lduw	[%i6+0x03c],%l6		! %l6 = 0000000000000000
!	Mem[0000000030041408] = 4400007c, %l7 = 00000000ffffffff
	lduwa	[%i1+%o4]0x81,%l7	! %l7 = 000000004400007c
!	Mem[0000000010181400] = 1bd9f4a700000000, %f4  = ff00ffff 00000000
	ldda	[%i6+%g0]0x88,%f4 	! %f4  = 1bd9f4a7 00000000

p0_label_395:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010041424] = 6d000000
	sth	%l4,[%i1+0x024]		! Mem[0000000010041424] = 00000000
!	Mem[00000000300c1400] = ffffffff, %l3 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[000000001018142c] = 000000ff, %asi = 80
	stwa	%l4,[%i6+0x02c]%asi	! Mem[000000001018142c] = 00000000
!	%f14 = ff00ff00 00000000, Mem[0000000030101400] = ffffffd9 ffffffff
	stda	%f14,[%i4+%g0]0x89	! Mem[0000000030101400] = ff00ff00 00000000
!	%l5 = 00000000000000ff, Mem[0000000010181408] = ff00000048000000
	stx	%l5,[%i6+%o4]		! Mem[0000000010181408] = 00000000000000ff
!	%l2 = 000000a7, %l3 = 000000ff, Mem[0000000010101420] = ffffd91b 00d1006d
	std	%l2,[%i4+0x020]		! Mem[0000000010101420] = 000000a7 000000ff
!	Mem[0000000010101408] = 80000000, %l7 = 000000004400007c
	swapa	[%i4+%o4]0x80,%l7	! %l7 = 0000000080000000
!	%l2 = 00000000000000a7, Mem[0000000010181410] = 00000000
	stwa	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000a7
!	%l1 = ffffffffffffffb8, Mem[0000000030141400] = 00000000
	stha	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = ffb80000
!	%f4  = 1bd9f4a7 00000000, Mem[0000000010041408] = 00ff00ff 00000000
	stda	%f4 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 1bd9f4a7 00000000

p0_label_396:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = fcffffff, %l1 = ffffffffffffffb8
	ldsha	[%i0+%o5]0x80,%l1	! %l1 = fffffffffffffcff
!	Mem[00000000100c1400] = ffffffff, %f29 = 00000080
	lda	[%i3+%g0]0x80,%f29	! %f29 = ffffffff
!	Mem[0000000010081400] = 00000000, %l5 = 00000000000000ff
	lduba	[%i2+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l5 = 0000000000000000
	lduha	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101410] = 00005900, %l7 = 0000000080000000
	ldsha	[%i4+%o5]0x89,%l7	! %l7 = 0000000000005900
!	Mem[0000000010041402] = ff00ff00, %l6 = 0000000000000000, %asi = 80
	lduha	[%i1+0x002]%asi,%l6	! %l6 = 000000000000ff00
!	Mem[00000000300c1408] = 0000ffff 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000 000000000000ffff
!	Mem[0000000030081408] = 0000000000000000, %l7 = 0000000000005900
	ldxa	[%i2+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1410] = ff000000, %l2 = 00000000000000a7
	lduha	[%i3+%o5]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010001408] = 0000fcff 00000048, %l0 = ffffffc2, %l1 = fffffcff
	ldda	[%i0+%o4]0x80,%l0	! %l0 = 000000000000fcff 0000000000000048

p0_label_397:
!	Starting 10 instruction Store Burst
!	Mem[0000000020800041] = ffffb270, %l4 = 0000000000000000
	ldstub	[%o1+0x041],%l4		! %l4 = 00000000000000ff
!	%l1 = 0000000000000048, Mem[0000000030141408] = 00000000
	stba	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000048
!	%l0 = 000000000000fcff, Mem[0000000010181400] = 00000000
	stwa	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000fcff
!	%l1 = 0000000000000048, Mem[0000000010041410] = 0000421f
	stwa	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000048
!	Mem[0000000010181400] = fffc0000, %l7 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l7	! %l7 = 00000000fffc0000
!	%l3 = 00000000000000ff, Mem[0000000030081400] = 00000000
	stha	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = 00ff0000
!	Mem[0000000010181430] = 000000ff000000ff, %l3 = 00000000000000ff, %l0 = 000000000000fcff
	add	%i6,0x30,%g1
	casxa	[%g1]0x80,%l3,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010101439] = 1bd9f4ff, %l6 = 000000000000ff00
	ldstuba	[%i4+0x039]%asi,%l6	! %l6 = 00000000000000d9
!	%l1 = 0000000000000048, Mem[0000000010141430] = ff005a00000000cc
	stx	%l1,[%i5+0x030]		! Mem[0000000010141430] = 0000000000000048
!	%f20 = 00000000 00000000, Mem[0000000030141410] = ffff00ff 00000000
	stda	%f20,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000 00000000

p0_label_398:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 48000000 0000ff00, %l0 = 000000ff, %l1 = 00000048
	ldda	[%i1+%o5]0x81,%l0	! %l0 = 0000000048000000 000000000000ff00
!	Mem[00000000100c1408] = ff00ff00, %f22 = 00000000
	ld	[%i3+%o4],%f22		! %f22 = ff00ff00
!	Mem[0000000030101400] = 00000000, %l2 = 000000000000ff00
	lduha	[%i4+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000020800040] = ffffb270, %l3 = 00000000000000ff
	ldsh	[%o1+0x040],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030041408] = 4400007c 00000000, %l2 = 00000000, %l3 = ffffffff
	ldda	[%i1+%o4]0x81,%l2	! %l2 = 000000004400007c 0000000000000000
!	Mem[0000000030101410] = 00000000 00005900, %l2 = 4400007c, %l3 = 00000000
	ldda	[%i4+%o5]0x89,%l2	! %l2 = 0000000000005900 0000000000000000
!	%l6 = 00000000000000d9, %l7 = 00000000fffc0000, %y  = 00000000
	sdiv	%l6,%l7,%l5		! %l5 = 0000000000000000
	mov	%l0,%y			! %y = 48000000
!	Mem[0000000030001400] = a7ff000000000000, %f28 = ff000000 ffffffff
	ldda	[%i0+%g0]0x89,%f28	! %f28 = a7ff0000 00000000
!	Mem[0000000010181438] = 0000ffff, %l2 = 0000000000005900, %asi = 80
	ldswa	[%i6+0x038]%asi,%l2	! %l2 = 000000000000ffff
!	%l0 = 0000000048000000, %l7 = 00000000fffc0000, %l0 = 0000000048000000
	add	%l0,%l7,%l0		! %l0 = 0000000147fc0000

p0_label_399:
!	Starting 10 instruction Store Burst
!	%l2 = 000000000000ffff, Mem[0000000030141410] = 00000000
	stwa	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000ffff
!	%l5 = 0000000000000000, %l5 = 0000000000000000, %y  = 48000000
	umul	%l5,%l5,%l7		! %l7 = 0000000000000000, %y = 00000000
!	Mem[000000001004140e] = a7f4d91b, %l6 = 00000000000000d9
	ldstuba	[%i1+0x00e]%asi,%l6	! %l6 = 00000000000000d9
!	Mem[0000000010101428] = 000000ff, %l6 = 000000d9, %l2 = 0000ffff
	add	%i4,0x28,%g1
	casa	[%g1]0x80,%l6,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081400] = 0000ff00, %l4 = 00000000000000ff
	ldstuba	[%i2+%g0]0x89,%l4	! %l4 = 0000000000000000
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000030181408] = 00000048 00000000
	stda	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ff 00000000
!	%l3 = 0000000000000000, Mem[0000000010001400] = 000000ff
	stha	%l3,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	%f28 = a7ff0000, Mem[000000001014142c] = ec0000ff
	sta	%f28,[%i5+0x02c]%asi	! Mem[000000001014142c] = a7ff0000
!	Mem[0000000030101410] = 00005900, %l7 = 0000000000000000
	swapa	[%i4+%o5]0x89,%l7	! %l7 = 0000000000005900
!	%f22 = ff00ff00 48000000, %l0 = 0000000147fc0000
!	Mem[0000000030001428] = 0000ffff6d000000
	add	%i0,0x028,%g1
	stda	%f22,[%g1+%l0]ASI_PST32_S ! Mem[0000000030001428] = 0000ffff6d000000

p0_label_400:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101428] = 000000ff, %l3 = 0000000000000000, %asi = 80
	ldsha	[%i4+0x028]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181400] = b8107a4400000000, %f20 = 00000000 00000000
	ldda	[%i6+%g0]0x81,%f20	! %f20 = b8107a44 00000000
!	Mem[00000000100c1400] = ffffffff0000ff00, %l0 = 0000000147fc0000, %asi = 80
	ldxa	[%i3+0x000]%asi,%l0	! %l0 = ffffffff0000ff00
!	Mem[0000000030181408] = 00000000000000ff, %l3 = 0000000000000000
	ldxa	[%i6+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1410] = 000000ff, %l7 = 0000000000005900
	lduwa	[%i3+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141400] = ffb80000 000000ff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i5+%g0]0x81,%l4	! %l4 = 00000000ffb80000 00000000000000ff
!	%l4 = 00000000ffb80000, %l0 = ffffffff0000ff00, %l6 = 00000000000000d9
	udivx	%l4,%l0,%l6		! %l6 = 0000000000000000
!	Mem[0000000030141400] = ffb80000, %l3 = 00000000000000ff
	ldsba	[%i5+%g0]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081400] = 1bd9f4a70000ffff, %f10 = 00ff0000 c7000000
	ldda	[%i2+%g0]0x89,%f10	! %f10 = 1bd9f4a7 0000ffff
!	Mem[0000000010181400] = 1bd9f4a7 00000000, %l0 = 0000ff00, %l1 = 0000ff00
	ldda	[%i6+%g0]0x88,%l0	! %l0 = 0000000000000000 000000001bd9f4a7

p0_label_401:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010141400] = ff00000000000000
	stxa	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000000000000000
!	%f0  = 0000421f 000000ff, Mem[0000000030181408] = 000000ff 00000000
	stda	%f0 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000421f 000000ff
!	Mem[00000000211c0000] = 00ff38a0, %l4 = 00000000ffb80000
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 0000000000000000
!	%l5 = 00000000000000ff, Mem[0000000030101408] = 00000000e5570000
	stxa	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000000000ff
!	%f22 = ff00ff00 48000000, Mem[00000000100c1418] = 5ae4ffff 000000c7
	std	%f22,[%i3+0x018]	! Mem[00000000100c1418] = ff00ff00 48000000
!	%l6 = 0000000000000000, Mem[0000000030181408] = 000000ff
	stba	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	Mem[000000001000142f] = 61d05459, %l7 = 00000000000000ff
	ldstuba	[%i0+0x02f]%asi,%l7	! %l7 = 0000000000000059
!	%l3 = ffffffffffffffff, Mem[0000000021800040] = 0043b900, %asi = 80
	stba	%l3,[%o3+0x040]%asi	! Mem[0000000021800040] = ff43b900
!	%l2 = 000000ff, %l3 = ffffffff, Mem[0000000030001410] = ff0000ff 0000ffff
	stda	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff ffffffff
!	%l6 = 0000000000000000, Mem[00000000100c1408] = 00ff00ff
	stba	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00ff0000

p0_label_402:
!	Starting 10 instruction Load Burst
!	%l5 = 00000000000000ff, imm = 00000000000003f3, %l4 = 0000000000000000
	or	%l5,0x3f3,%l4		! %l4 = 00000000000003ff
!	Mem[0000000010001408] = fffc0000, %l1 = 000000001bd9f4a7
	ldswa	[%i0+%o4]0x88,%l1	! %l1 = fffffffffffc0000
!	Mem[0000000010081408] = ff2ebf79, %l4 = 00000000000003ff
	ldsba	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000079
!	Mem[0000000010041410] = 00000048 000000ff, %l2 = 000000ff, %l3 = ffffffff
	ldda	[%i1+%o5]0x80,%l2	! %l2 = 0000000000000048 00000000000000ff
!	Mem[0000000030101408] = ff000000, %l1 = fffffffffffc0000
	lduha	[%i4+%o4]0x81,%l1	! %l1 = 000000000000ff00
!	Mem[0000000030081410] = 00000000, %l5 = 00000000000000ff
	lduba	[%i2+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1400] = 00ff0000ffffffff, %l3 = 00000000000000ff
	ldxa	[%i3+%g0]0x88,%l3	! %l3 = 00ff0000ffffffff
!	Mem[0000000030101400] = 00000000, %l7 = 0000000000000059
	swapa	[%i4+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001408] = 0000fcff00000048, %f30 = 00000000 e5570000
	ldd	[%i0+%o4],%f30		! %f30 = 0000fcff 00000048
!	Mem[0000000010101408] = 4400007c, %f11 = 0000ffff
	lda	[%i4+%o4]0x80,%f11	! %f11 = 4400007c

p0_label_403:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 00000048, %l6 = 0000000000000000
	ldstuba	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010101408] = 7c000044
	stba	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 7c000000
!	%l5 = 0000000000000000, Mem[0000000010141410] = 00000000ffff00ff
	stxa	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000000000000
!	%f28 = a7ff0000, Mem[0000000030101410] = 00000000
	sta	%f28,[%i4+%o5]0x81	! Mem[0000000030101410] = a7ff0000
!	Mem[0000000010081410] = c7000000, %l7 = 0000000000000000
	ldstuba	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000000
!	%l6 = 0000000000000000, Mem[00000000100c1408] = 00ff0000
	stha	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00ff0000
!	%l7 = 0000000000000000, Mem[0000000030081400] = ffff0000
	stwa	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	%l5 = 0000000000000000, Mem[0000000030041408] = 7c000044
	stwa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	%l0 = 0000000000000000, Mem[0000000030101408] = 00000000000000ff
	stxa	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000000
!	%l1 = 000000000000ff00, %l1 = 000000000000ff00, %y  = 00000000
	smul	%l1,%l1,%l3		! %l3 = 00000000fe010000, %y = 00000000

p0_label_404:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001409] = 0000fcff, %l1 = 000000000000ff00
	ldsb	[%i0+0x009],%l1		! %l1 = 0000000000000000
!	Mem[0000000030001410] = 000000ff, %l5 = 0000000000000000
	ldsha	[%i0+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001436] = 000000ff, %l1 = 0000000000000000
	lduh	[%i0+0x036],%l1		! %l1 = 00000000000000ff
!	Mem[00000000100c140c] = 00ff00ff, %f28 = a7ff0000
	lda	[%i3+0x00c]%asi,%f28	! %f28 = 00ff00ff
!	Mem[0000000030001400] = 00000000, %l4 = 0000000000000079
	ldsha	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041408] = 00000000a7f4ff1b, %f10 = 1bd9f4a7 4400007c
	ldda	[%i1+%o4]0x80,%f10	! %f10 = 00000000 a7f4ff1b
!	Mem[0000000010101408] = 0000007c, %l2 = 0000000000000048
	ldsha	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101418] = 00ff004800000000, %l1 = 00000000000000ff
	ldx	[%i4+0x018],%l1		! %l1 = 00ff004800000000
!	Mem[0000000010081400] = 00000000, %l6 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l2 = 0000000000000000
	ldsba	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000000

p0_label_405:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = a7ff0000, %l6 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l6	! %l6 = 00000000000000a7
!	Mem[0000000030181410] = 447a10b8, %l1 = 00ff004800000000
	ldstuba	[%i6+%o5]0x81,%l1	! %l1 = 0000000000000044
!	Mem[000000001000143c] = ffffffd9, %l2 = 0000000000000000
	swap	[%i0+0x03c],%l2		! %l2 = 00000000ffffffd9
!	%f22 = ff00ff00 48000000, %l5 = 00000000000000ff
!	Mem[0000000030181420] = e9b25066b8a8ee42
	add	%i6,0x020,%g1
	stda	%f22,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030181420] = 0000004800ff00ff
!	%f15 = 00000000, Mem[0000000010141408] = 00000000
	sta	%f15,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	Mem[0000000030141410] = ffff0000, %l3 = 00000000fe010000
	swapa	[%i5+%o5]0x89,%l3	! %l3 = 00000000ffff0000
!	Mem[0000000030101400] = 00000059, %l0 = 0000000000000000
	swapa	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000059
!	Mem[0000000010081408] = ff2ebf79, %l1 = 0000000000000044
	ldstuba	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000079
!	Mem[0000000010001400] = 0000000000000000, %l2 = 00000000ffffffd9, %l3 = 00000000ffff0000
	casxa	[%i0]0x80,%l2,%l3	! %l3 = 0000000000000000
!	%f24 = ff005a00, Mem[0000000010001408] = fffc0000
	sta	%f24,[%i0+%o4]0x88	! Mem[0000000010001408] = ff005a00

p0_label_406:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ff1a10, %l5 = 00000000000000ff
	lduh	[%o0+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010101428] = 000000ff db0000ff, %l4 = 00000000, %l5 = 000000ff, %asi = 80
	ldda	[%i4+0x028]%asi,%l4	! %l4 = 00000000000000ff 00000000db0000ff
!	Mem[0000000010101434] = 000000ff, %l4 = 00000000000000ff, %asi = 80
	lduwa	[%i4+0x034]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141410] = fe010000, %l2 = 00000000ffffffd9
	lduba	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = 0000000000000000, %f24 = ff005a00 7fffffff
	ldda	[%i5+%g0]0x88,%f24	! %f24 = 00000000 00000000
!	Mem[00000000100c1400] = ffffffff, %l0 = 0000000000000059
	lduha	[%i3+%g0]0x88,%l0	! %l0 = 000000000000ffff
!	Mem[00000000100c1410] = ff000000, %l3 = 0000000000000000
	ldsha	[%i3+%o5]0x80,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000030081410] = 00000000, %l7 = 0000000000000000
	ldsba	[%i2+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141400] = 0000b8ff, %l7 = 0000000000000000
	lduwa	[%i5+%g0]0x89,%l7	! %l7 = 000000000000b8ff
!	Mem[0000000010041428] = 00005900, %f0  = 0000421f
	ld	[%i1+0x028],%f0 	! %f0 = 00005900

p0_label_407:
!	Starting 10 instruction Store Burst
!	%f7  = 1f420000, Mem[0000000030141408] = 48000000
	sta	%f7 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 1f420000
!	Mem[0000000010041420] = 0000ffff, %l5 = 00000000db0000ff
	ldstuba	[%i1+0x020]%asi,%l5	! %l5 = 0000000000000000
!	%l2 = 00000000, %l3 = ffffff00, Mem[0000000010181410] = a7000000 000000c7
	stda	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000 ffffff00
!	%f0  = 00005900 000000ff, Mem[0000000010001400] = 00000000 00000000
	std	%f0 ,[%i0+%g0]		! Mem[0000000010001400] = 00005900 000000ff
!	%f0  = 00005900 000000ff, %l2 = 0000000000000000
!	Mem[0000000030141430] = cc000000005a00ff
	add	%i5,0x030,%g1
	stda	%f0,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030141430] = cc000000005a00ff
!	%l5 = 0000000000000000, Mem[0000000030101408] = 0000000000000000
	stxa	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000000000000000
!	%l7 = 000000000000b8ff, Mem[0000000030081410] = 00000000
	stwa	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000b8ff
!	Mem[0000000010181424] = 40d11cbf, %l4 = 000000ff, %l6 = 000000a7
	add	%i6,0x24,%g1
	casa	[%g1]0x80,%l4,%l6	! %l6 = 0000000040d11cbf
!	%l2 = 00000000, %l3 = ffffff00, Mem[0000000010001400] = 00005900 000000ff
	stda	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000 ffffff00
!	%l2 = 00000000, %l3 = ffffff00, Mem[00000000100c1400] = ffffffff 00ff0000
	stda	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 ffffff00

p0_label_408:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 0000b8ff, %l4 = 00000000000000ff
	lduwa	[%i5+%g0]0x89,%l4	! %l4 = 000000000000b8ff
!	Mem[0000000030081400] = 00000000, %l2 = 0000000000000000
	lduha	[%i2+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l3 = ffffffffffffff00
	ldsha	[%i6+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = fcffffff, %l3 = 0000000000000000
	ldsha	[%i0+%o5]0x80,%l3	! %l3 = fffffffffffffcff
!	Mem[0000000010101410] = 447a10b8, %l4 = 000000000000b8ff
	ldswa	[%i4+%o5]0x80,%l4	! %l4 = 00000000447a10b8
!	Mem[00000000300c1408] = 00000000, %l7 = 000000000000b8ff
	lduwa	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Code Fragment 3, seed = 782253
p0_fragment_38:
!	%l0 = 000000000000ffff
	setx	0xcebd00fa715837be,%g7,%l0 ! %l0 = cebd00fa715837be
!	%l1 = 0000000000000079
	setx	0x16fc95ccc00c3869,%g7,%l1 ! %l1 = 16fc95ccc00c3869
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = cebd00fa715837be
	setx	0x92663b3ae10df524,%g7,%l0 ! %l0 = 92663b3ae10df524
!	%l1 = 16fc95ccc00c3869
	setx	0xae9e18a4a2adf0ef,%g7,%l1 ! %l1 = ae9e18a4a2adf0ef
p0_fragment_38_end:
!	Mem[00000000300c1410] = 000000ff, %l2 = 0000000000000000
	lduba	[%i3+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%l4 = 00000000447a10b8, imm = 0000000000000211, %l3 = fffffffffffffcff
	subc	%l4,0x211,%l3		! %l3 = 00000000447a0ea7
!	Mem[0000000010141410] = 00000000, %l5 = 0000000000000000
	ldsba	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000

p0_label_409:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001430] = ff000000, %l5 = 0000000000000000, %asi = 80
	swapa	[%i0+0x030]%asi,%l5	! %l5 = 00000000ff000000
!	%f23 = 48000000, Mem[0000000030101410] = 0000ffff
	sta	%f23,[%i4+%o5]0x89	! Mem[0000000030101410] = 48000000
!	%l2 = 00000000000000ff, Mem[0000000010101410] = 447a10b8
	stha	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = 00ff10b8
!	Mem[0000000010041410] = 480000ff, %l2 = 00000000000000ff
	ldstuba	[%i1+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%f20 = b8107a44 00000000, Mem[0000000010081418] = ff000000 000000c7
	std	%f20,[%i2+0x018]	! Mem[0000000010081418] = b8107a44 00000000
!	Mem[0000000010101410] = 00ff10b8, %l2 = 00000000000000ff
	swapa	[%i4+%o5]0x80,%l2	! %l2 = 0000000000ff10b8
!	%l4 = 447a10b8, %l5 = ff000000, Mem[0000000030141410] = 000001fe 00000000
	stda	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 447a10b8 ff000000
!	Mem[0000000010081434] = 00000000, %l1 = 00000000a2adf0ef
	swap	[%i2+0x034],%l1		! %l1 = 0000000000000000
!	%l0 = 92663b3ae10df524, Mem[0000000010101410] = 000000ff
	stha	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = f52400ff
!	Mem[0000000030181408] = 00000000, %l5 = 00000000ff000000
	ldstuba	[%i6+%o4]0x81,%l5	! %l5 = 0000000000000000

p0_label_410:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00a70aaf, %l3 = 00000000447a0ea7
	ldsha	[%i4+%g0]0x80,%l3	! %l3 = 00000000000000a7
!	Mem[0000000010041410] = 480000ff, %l7 = 0000000000000000
	ldsba	[%i1+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010001400] = 00000000, %l6 = 0000000040d11cbf
	lduha	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181420] = a55a73b640d11cbf, %f10 = 00000000 a7f4ff1b, %asi = 80
	ldda	[%i6+0x020]%asi,%f10	! %f10 = a55a73b6 40d11cbf
!	Mem[00000000201c0001] = 00ff1a10, %l7 = ffffffffffffffff
	ldsb	[%o0+0x001],%l7		! %l7 = ffffffffffffffff
!	Mem[00000000300c1400] = ffffffff, %l7 = ffffffffffffffff
	lduha	[%i3+%g0]0x81,%l7	! %l7 = 000000000000ffff
!	Mem[00000000211c0000] = ffff38a0, %l4 = 00000000447a10b8, %asi = 80
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030101410] = 48000000, %l0 = 92663b3ae10df524
	ldsha	[%i4+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = b8107aff, %l4 = ffffffffffffffff
	lduba	[%i6+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000201c0001] = 00ff1a10, %l7 = 000000000000ffff
	ldsb	[%o0+0x001],%l7		! %l7 = ffffffffffffffff

p0_label_411:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[0000000030001400] = 00000000
	stba	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff
!	%f27 = ff001bd9, Mem[00000000100c1410] = ff000000
	sta	%f27,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff001bd9
!	%f16 = 1bd9f4a7 00000000, Mem[0000000030181408] = ff000000 1f420000
	stda	%f16,[%i6+%o4]0x81	! Mem[0000000030181408] = 1bd9f4a7 00000000
!	%l7 = ffffffffffffffff, Mem[0000000010101410] = ff0024f5
	stba	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = ff0024ff
!	Mem[000000001000142d] = 61d054ff, %l3 = 00000000000000a7
	ldstub	[%i0+0x02d],%l3		! %l3 = 00000000000000d0
!	Mem[0000000010141410] = 00000000, %l7 = 00000000ffffffff
	swapa	[%i5+%o5]0x80,%l7	! %l7 = 0000000000000000
!	%f6  = ff000000 1f420000, Mem[0000000010181408] = 00000000 ff000000
	stda	%f6 ,[%i6+%o4]0x88	! Mem[0000000010181408] = ff000000 1f420000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030181408] = 1bd9f4a7 00000000
	stda	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000 00000000
!	%f0  = 00005900 000000ff, %l3 = 00000000000000d0
!	Mem[00000000100c1420] = 61d0ffff6d94137c
	add	%i3,0x020,%g1
	stda	%f0,[%g1+%l3]ASI_PST8_PL ! Mem[00000000100c1420] = 61d0ffff00940000
!	%l1 = 0000000000000000, imm = 00000000000003d5, %l7 = 0000000000000000
	sub	%l1,0x3d5,%l7		! %l7 = fffffffffffffc2b

p0_label_412:
!	Starting 10 instruction Load Burst
!	%l1 = 0000000000000000, %l4 = 00000000000000ff, %l7 = fffffffffffffc2b
	xnor	%l1,%l4,%l7		! %l7 = ffffffffffffff00
!	Mem[0000000030081410] = ffb80000, %l5 = 0000000000000000
	lduwa	[%i2+%o5]0x81,%l5	! %l5 = 00000000ffb80000
!	%l4 = 00000000000000ff, %l7 = ffffffffffffff00, %l4 = 00000000000000ff
	udivx	%l4,%l7,%l4		! %l4 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %f23 = 48000000
	lda	[%i4+%g0]0x89,%f23	! %f23 = 00000000
!	Mem[00000000300c1410] = ff000000, %l6 = 0000000000000000
	lduha	[%i3+%o5]0x81,%l6	! %l6 = 000000000000ff00
!	Mem[0000000010001410] = fcffffff, %l7 = ffffffffffffff00
	lduwa	[%i0+%o5]0x80,%l7	! %l7 = 00000000fcffffff
!	Mem[0000000010141438] = 000000ff00ff00ff, %l3 = 00000000000000d0, %asi = 80
	ldxa	[%i5+0x038]%asi,%l3	! %l3 = 000000ff00ff00ff
!	Mem[0000000010101410] = ff0024ff, %l0 = 0000000000000000
	ldsha	[%i4+%o5]0x88,%l0	! %l0 = 00000000000024ff
!	Mem[00000000211c0001] = ffff38a0, %l1 = 0000000000000000, %asi = 80
	lduba	[%o2+0x001]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081400] = 00000000, %f2  = 00000000
	lda	[%i2+%g0]0x80,%f2 	! %f2 = 00000000

p0_label_413:
!	Starting 10 instruction Store Burst
!	%f22 = ff00ff00 00000000, Mem[0000000010181408] = 1f420000 ff000000
	stda	%f22,[%i6+%o4]0x88	! Mem[0000000010181408] = ff00ff00 00000000
!	Mem[0000000010081430] = 000000aa, %l3 = 0000000000ff00ff, %asi = 80
	swapa	[%i2+0x030]%asi,%l3	! %l3 = 00000000000000aa
!	%l5 = 00000000ffb80000, %l2 = 0000000000ff10b8, %l2 = 0000000000ff10b8
	xnor	%l5,%l2,%l2		! %l2 = ffffffff00b8ef47
!	%l2 = ffffffff00b8ef47, Mem[0000000010181430] = 000000ff, %asi = 80
	stwa	%l2,[%i6+0x030]%asi	! Mem[0000000010181430] = 00b8ef47
!	%f10 = a55a73b6 40d11cbf, Mem[0000000030141410] = b8107a44 000000ff
	stda	%f10,[%i5+%o5]0x89	! Mem[0000000030141410] = a55a73b6 40d11cbf
!	%f6  = ff000000 1f420000, Mem[0000000030001410] = 000000ff ffffffff
	stda	%f6 ,[%i0+%o5]0x89	! Mem[0000000030001410] = ff000000 1f420000
!	%l6 = 0000ff00, %l7 = fcffffff, Mem[0000000010081400] = 00000000 1bd9ffff
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000ff00 fcffffff
!	%f24 = 00000000 00000000, Mem[0000000010181400] = 00000000 a7f4d91b
	stda	%f24,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 00000000
!	%f14 = ff00ff00 00000000, Mem[00000000300c1408] = 00000000 ffff0000
	stda	%f14,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff00ff00 00000000
!	%l5 = 00000000ffb80000, Mem[0000000030001408] = 000000cd00000000
	stxa	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000ffb80000

p0_label_414:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101430] = 0000421f000000ff, %l4 = 0000000000000000, %asi = 80
	ldxa	[%i4+0x030]%asi,%l4	! %l4 = 0000421f000000ff
!	Mem[0000000010081410] = 00ff0000 c70000ff, %l4 = 000000ff, %l5 = ffb80000
	ldda	[%i2+%o5]0x88,%l4	! %l4 = 00000000c70000ff 0000000000ff0000
!	Mem[0000000010001400] = 00000000, %l4 = 00000000c70000ff
	ldsha	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = ff0000c70000ff00, %l6 = 000000000000ff00
	ldx	[%i2+%o5],%l6		! %l6 = ff0000c70000ff00
!	Mem[0000000010001408] = 005a00ff00000048, %f16 = 1bd9f4a7 00000000
	ldda	[%i0+%o4]0x80,%f16	! %f16 = 005a00ff 00000048
!	Mem[0000000030001410] = ff000000 1f420000, %l6 = 0000ff00, %l7 = fcffffff
	ldda	[%i0+%o5]0x89,%l6	! %l6 = 000000001f420000 00000000ff000000
!	Mem[0000000030101410] = 48000000, %f4  = 1bd9f4a7
	lda	[%i4+%o5]0x89,%f4 	! %f4 = 48000000
!	Mem[0000000020800001] = ff5aa840, %l1 = 00000000000000ff, %asi = 80
	ldsba	[%o1+0x001]%asi,%l1	! %l1 = 000000000000005a
!	Mem[0000000010141410] = ffffffff, %l6 = 000000001f420000
	lduha	[%i5+%o5]0x88,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010041408] = 00000000, %l6 = 000000000000ffff
	lduwa	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000000

p0_label_415:
!	Starting 10 instruction Store Burst
!	%f4  = 48000000, Mem[0000000030081410] = ffb80000
	sta	%f4 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 48000000
!	%f14 = ff00ff00, Mem[0000000030041410] = 48000000
	sta	%f14,[%i1+%o5]0x81	! Mem[0000000030041410] = ff00ff00
!	Mem[0000000010041410] = 480000ff, %l2 = 0000000000b8ef47
	swapa	[%i1+%o5]0x88,%l2	! %l2 = 00000000480000ff
!	Mem[0000000010001410] = fcffffff, %l5 = 0000000000ff0000
	swapa	[%i0+%o5]0x80,%l5	! %l5 = 00000000fcffffff
!	%l1 = 000000000000005a, Mem[0000000010101410] = ff0024ff
	stba	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = ff00245a
!	%l1 = 000000000000005a, Mem[0000000030081410] = 00000048
	stba	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000005a
!	%l3 = 00000000000000aa, Mem[0000000030041408] = 00000000
	stha	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 00aa0000
!	%l0 = 000024ff, %l1 = 0000005a, Mem[00000000300c1400] = ffffffff d9ffffff
	stda	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000024ff 0000005a
!	%l3 = 00000000000000aa, Mem[0000000010101408] = 7c000000
	stwa	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000aa
!	%l3 = 00000000000000aa, Mem[00000000100c1410] = ff001bd95b85c0ff
	stxa	%l3,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000000000aa

p0_label_416:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000000, %l0 = 00000000000024ff
	lduha	[%i2+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041400] = ff00ff0000000000, %f16 = 005a00ff 00000048
	ldda	[%i1+%g0]0x80,%f16	! %f16 = ff00ff00 00000000
!	Mem[0000000030041410] = ff00ff000000ff00, %l4 = 0000000000000000
	ldxa	[%i1+%o5]0x81,%l4	! %l4 = ff00ff000000ff00
!	Mem[0000000010081410] = ff0000c70000ff00, %f6  = ff000000 1f420000
	ldda	[%i2+%o5]0x80,%f6 	! %f6  = ff0000c7 0000ff00
!	Mem[0000000010081410] = ff0000c7, %l0 = 0000000000000000
	ldsba	[%i2+%o5]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030101410] = 0000004800000000, %l5 = 00000000fcffffff
	ldxa	[%i4+%o5]0x81,%l5	! %l5 = 0000004800000000
!	Mem[0000000010001420] = 000000ff, %l0 = ffffffffffffffff, %asi = 80
	lduha	[%i0+0x020]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %f2  = 00000000
	lda	[%i5+%g0]0x88,%f2 	! %f2 = 00000000
!	Mem[0000000010181400] = 0000000000000000, %f20 = b8107a44 00000000
	ldda	[%i6+%g0]0x88,%f20	! %f20 = 00000000 00000000
	membar	#Sync			! Added by membar checker (81)
!	Mem[00000000100c1400] = 00000000 00ffffff 0000ff00 00ff00ff
!	Mem[00000000100c1410] = 00000000 000000aa ff00ff00 48000000
!	Mem[00000000100c1420] = 61d0ffff 00940000 ffe0ffff 48ba57e5
!	Mem[00000000100c1430] = 00ff0000 ff0024a7 000000ff af0a9706
	ldda	[%i3+%g0]ASI_BLK_P,%f0 	! Block Load from 00000000100c1400

p0_label_417:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 00ff00ff, %l3 = 00000000000000aa
	ldstuba	[%i1+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041400] = 00000000, %l7 = 00000000ff000000
	ldstuba	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000000
!	%f26 = fffc1fff ff001bd9, Mem[0000000030081410] = 5a000000 00000000
	stda	%f26,[%i2+%o5]0x81	! Mem[0000000030081410] = fffc1fff ff001bd9
!	Mem[0000000030001410] = 0000421f, %l0 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030141400] = ffb80000
	stha	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	%f6  = ff00ff00 48000000, %l3 = 00000000000000ff
!	Mem[0000000030081410] = fffc1fffff001bd9
	add	%i2,0x010,%g1
	stda	%f6,[%g1+%l3]ASI_PST8_SL ! Mem[0000000030081410] = 0000004800ff00ff
!	%f20 = 00000000, %f3  = 00ff00ff, %f21 = 00000000
	fdivs	%f20,%f3 ,%f21		! %f21 = 00000000
!	Mem[0000000030041410] = 00ff00ff, %l7 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l7	! %l7 = 0000000000ff00ff
!	%f24 = 00000000, Mem[0000000010101410] = ff00245a
	sta	%f24,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	Mem[0000000010001410] = 0000ff00, %l3 = 00000000000000ff
	ldstuba	[%i0+%o5]0x88,%l3	! %l3 = 0000000000000000

p0_label_418:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 000000aa, %l0 = 0000000000000000
	ldsha	[%i4+%o4]0x88,%l0	! %l0 = 00000000000000aa
!	Mem[0000000010141410] = ffffffff, %l6 = 0000000000000000
	lduba	[%i5+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1400] = 0000005a000024ff, %l6 = 00000000000000ff
	ldxa	[%i3+%g0]0x89,%l6	! %l6 = 0000005a000024ff
!	Mem[00000000300c1400] = ff240000, %l7 = 0000000000ff00ff
	lduwa	[%i3+%g0]0x81,%l7	! %l7 = 00000000ff240000
!	Mem[0000000030181400] = b8107a44, %l0 = 00000000000000aa
	ldsha	[%i6+%g0]0x81,%l0	! %l0 = ffffffffffffb810
!	Mem[00000000300c1408] = 00ff00ff, %f23 = 00000000
	lda	[%i3+%o4]0x89,%f23	! %f23 = 00ff00ff
!	Mem[0000000010101408] = 000000aa, %l1 = 000000000000005a
	ldsha	[%i4+%o4]0x88,%l1	! %l1 = 00000000000000aa
!	%f18 = 0000007c, %f1  = 00ffffff, %f20 = 00000000 00000000
	fsmuld	%f18,%f1 ,%f20		! tt=0x22, %l0 = ffffffffffffb832
!	Mem[0000000030001410] = ff00421f000000ff, %l4 = ff00ff000000ff00
	ldxa	[%i0+%o5]0x81,%l4	! %l4 = ff00421f000000ff
!	Mem[0000000010041400] = 00ff00ff, %l7 = 00000000ff240000
	ldswa	[%i1+%g0]0x88,%l7	! %l7 = 0000000000ff00ff

p0_label_419:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = ffffffff, %l2 = 00000000480000ff
	swapa	[%i5+%o5]0x88,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000030181400] = b8107a44, %l1 = 00000000000000aa
	ldstuba	[%i6+%g0]0x81,%l1	! %l1 = 00000000000000b8
!	%l0 = ffffb832, %l1 = 000000b8, Mem[0000000030001400] = 000000ff a7ff0000
	stda	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffb832 000000b8
!	%l2 = ffffffff, %l3 = 00000000, Mem[0000000010081408] = ffbf2eff 6d000000
	stda	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffffff 00000000
!	Mem[000000001010142e] = db0000ff, %l2 = 00000000ffffffff
	ldstuba	[%i4+0x02e]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000021800181] = b76473f0, %l7 = 0000000000ff00ff
	ldstub	[%o3+0x181],%l7		! %l7 = 0000000000000064
!	%l3 = 0000000000000000, Mem[00000000300c1400] = ff2400005a000000
	stxa	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000000000000
!	%f12 = 00ff0000 ff0024a7, %l5 = 0000004800000000
!	Mem[0000000030001430] = ff00000000000080
	add	%i0,0x030,%g1
	stda	%f12,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030001430] = ff00000000000080
!	Mem[0000000030101408] = 00000000, %l3 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l3	! %l3 = 0000000000000000
!	%l6 = 000024ff, %l7 = 00000064, Mem[0000000030081400] = 00000000 1bd9f4a7
	stda	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 000024ff 00000064

p0_label_420:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 0000000000ff00ff, %l1 = 00000000000000b8
	ldxa	[%i4+%g0]0x81,%l1	! %l1 = 0000000000ff00ff
!	Mem[0000000030141410] = 40d11cbf, %l3 = 0000000000000000
	lduba	[%i5+%o5]0x89,%l3	! %l3 = 00000000000000bf
!	Mem[0000000010181408] = 0000000000ff00ff, %l3 = 00000000000000bf
	ldxa	[%i6+%o4]0x80,%l3	! %l3 = 0000000000ff00ff
!	Mem[0000000030101400] = 0000000000ff00ff, %f0  = 00000000 00ffffff
	ldda	[%i4+%g0]0x81,%f0 	! %f0  = 00000000 00ff00ff
!	Mem[0000000030041400] = 000000ff, %l4 = ff00421f000000ff
	lduwa	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001400] = 32b8ffff, %l2 = 0000000000000000
	ldswa	[%i0+%g0]0x81,%l2	! %l2 = 0000000032b8ffff
!	Mem[0000000010141410] = 00000000480000ff, %l6 = 0000005a000024ff
	ldxa	[%i5+%o5]0x88,%l6	! %l6 = 00000000480000ff
!	%f11 = 48ba57e5, %f9  = 00940000
	fcmps	%fcc0,%f11,%f9 		! %fcc0 = 2
!	Mem[000000001004143c] = ffff0034, %l7 = 0000000000000064
	lduh	[%i1+0x03c],%l7		! %l7 = 000000000000ffff
!	Mem[00000000300c1410] = ff000000, %l2 = 0000000032b8ffff
	ldsba	[%i3+%o5]0x81,%l2	! %l2 = ffffffffffffffff

p0_label_421:
!	Starting 10 instruction Store Burst
!	%f23 = 00ff00ff, Mem[00000000300c1410] = ff000000
	sta	%f23,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00ff00ff
!	%l0 = ffffffffffffb832, Mem[0000000030141400] = 00000000
	stwa	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffb832
!	%l7 = 000000000000ffff, Mem[0000000010081408] = 00000000ffffffff
	stxa	%l7,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000000000ffff
!	Mem[0000000030081408] = 00000000, %l1 = 0000000000ff00ff
	swapa	[%i2+%o4]0x89,%l1	! %l1 = 0000000000000000
!	%l5 = 0000004800000000, Mem[000000001004142a] = 00005900
	sth	%l5,[%i1+0x02a]		! Mem[0000000010041428] = 00000000
!	%l6 = 480000ff, %l7 = 0000ffff, Mem[0000000010001410] = 0000ffff 006d0000
	stda	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 480000ff 0000ffff
!	%f0  = 00000000 00ff00ff, Mem[0000000030001400] = ffffb832 000000b8
	stda	%f0 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 00ff00ff
!	Mem[0000000010101410] = 00000000, %l3 = 0000000000ff00ff
	ldstuba	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000
!	%l0 = ffffb832, %l1 = 00000000, Mem[0000000010001400] = ff000000 ffffff00, %asi = 80
	stda	%l0,[%i0+0x000]%asi	! Mem[0000000010001400] = ffffb832 00000000

p0_label_422:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff00421f 000000ff, %l0 = ffffb832, %l1 = 00000000
	ldda	[%i0+%o5]0x81,%l0	! %l0 = 00000000ff00421f 00000000000000ff
!	Mem[0000000010081400] = 0000ff00, %l5 = 0000004800000000
	lduba	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %f11 = 48ba57e5
	lda	[%i3+%o5]0x88,%f11	! %f11 = 00000000
!	Mem[0000000030001400] = 00ff00ff, %l7 = 000000000000ffff
	ldsha	[%i0+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1410] = ff00ff00, %l1 = 00000000000000ff
	ldsba	[%i3+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = ffff0000, %l7 = 00000000000000ff
	ldsha	[%i2+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010141400] = 00000000, %l0 = 00000000ff00421f
	lduwa	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (82)
!	Mem[0000000030101400] = 00000000 00ff00ff 00000000 00000000
!	Mem[0000000030101410] = 00000048 00000000 f7d5ecaa 1169c7d3
!	Mem[0000000030101420] = 42eea8b8 6650b2e9 7c7701b6 552af12f
!	Mem[0000000030101430] = 418fa324 4ec45025 34d6b482 1bd9a94b
	ldda	[%i4+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Mem[0000000010001408] = 48000000 ff005a00, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i0+%o4]0x88,%l4	! %l4 = 00000000ff005a00 0000000048000000
!	Mem[0000000010081400] = 0000ff00, %l3 = 0000000000000000
	lduwa	[%i2+%g0]0x80,%l3	! %l3 = 000000000000ff00

p0_label_423:
!	Starting 10 instruction Store Burst
!	%f17 = 00ff00ff, %f3  = 00ff00ff, %f10 = ffe0ffff
	fdivs	%f17,%f3 ,%f10		! %f10 = 3f800000
!	%l4 = ff005a00, %l5 = 48000000, Mem[0000000010041430] = 5b85c0ff 00000093
	std	%l4,[%i1+0x030]		! Mem[0000000010041430] = ff005a00 48000000
!	Mem[0000000030101408] = 00000000, %l6 = 00000000480000ff
	ldstuba	[%i4+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = 00a70aafffffffff, %l6 = 0000000000000000, %l2 = ffffffffffffffff
	casxa	[%i4]0x80,%l6,%l2	! %l2 = 00a70aafffffffff
!	%l7 = ffffffffffffffff, Mem[0000000010041400] = 0000000000ff00ff
	stxa	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = ffffffffffffffff
!	%l7 = ffffffffffffffff, Mem[0000000030041408] = 00aa000000000000
	stxa	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffffffffffff
!	Code Fragment 3, seed = 454960
p0_fragment_39:
!	%l0 = 0000000000000000
	setx	0x15e497c495681ea6,%g7,%l0 ! %l0 = 15e497c495681ea6
!	%l1 = 0000000000000000
	setx	0x7e6fd85ad24f8ad1,%g7,%l1 ! %l1 = 7e6fd85ad24f8ad1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 15e497c495681ea6
	setx	0xd2939f8c202edb0c,%g7,%l0 ! %l0 = d2939f8c202edb0c
!	%l1 = 7e6fd85ad24f8ad1
	setx	0x8e619478f65e1257,%g7,%l1 ! %l1 = 8e619478f65e1257
p0_fragment_39_end:
!	Mem[0000000010001408] = ff005a00, %l6 = 0000000000000000
	ldstuba	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141410] = ff000048, %l0 = 00000000202edb0c
	swapa	[%i5+%o5]0x80,%l0	! %l0 = 00000000ff000048
!	%l2 = 00a70aafffffffff, Mem[0000000010141410] = 202edb0c
	stb	%l2,[%i5+%o5]		! Mem[0000000010141410] = ff2edb0c

p0_label_424:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff00421f, %l1 = 8e619478f65e1257
	ldswa	[%i0+%o5]0x81,%l1	! %l1 = ffffffffff00421f
!	Mem[0000000010001424] = 00ff00ff, %l0 = 00000000ff000048, %asi = 80
	ldswa	[%i0+0x024]%asi,%l0	! %l0 = 0000000000ff00ff
!	Mem[0000000010181400] = 00000000, %f6  = ff00ff00
	lda	[%i6+%g0]0x80,%f6 	! %f6 = 00000000
!	Mem[0000000010001408] = ff005aff, %l6 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l6	! %l6 = 00000000ff005aff
!	Mem[00000000300c1408] = 00ff00ff, %l0 = 0000000000ff00ff
	ldsba	[%i3+%o4]0x89,%l0	! %l0 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (83)
!	Mem[0000000010041400] = ffffffff ffffffff 00000000 a7f4ff1b
!	Mem[0000000010041410] = 47efb800 000000ff 000000ec 000000ff
!	Mem[0000000010041420] = ff00ffff 00000000 00000000 61d05459
!	Mem[0000000010041430] = ff005a00 48000000 18000000 ffff0034
	ldda	[%i1+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	Mem[0000000030141400] = ff000000ffffb832, %f8  = 61d0ffff 00940000
	ldda	[%i5+%g0]0x89,%f8 	! %f8  = ff000000 ffffb832
!	Mem[00000000100c1408] = 0000ff00, %l6 = 00000000ff005aff
	lduha	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = 00ff0000, %l0 = ffffffffffffffff
	lduha	[%i2+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l4 = 00000000ff005a00
	lduwa	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000000

p0_label_425:
!	Starting 10 instruction Store Burst
!	Mem[000000001000141c] = 000000cc, %l6 = 0000000000000000
	swap	[%i0+0x01c],%l6		! %l6 = 00000000000000cc
!	Mem[00000000211c0001] = ffff38a0, %l7 = ffffffffffffffff
	ldstub	[%o2+0x001],%l7		! %l7 = 00000000000000ff
!	Mem[00000000211c0001] = ffff38a0, %l1 = ffffffffff00421f
	ldstuba	[%o2+0x001]%asi,%l1	! %l1 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010181408] = 0000000000ff00ff
	stxa	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000000000000
!	%l5 = 0000000048000000, Mem[0000000030001400] = ff00ff00
	stwa	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 48000000
!	Mem[0000000030181400] = 447a10ff, %l5 = 0000000048000000
	swapa	[%i6+%g0]0x89,%l5	! %l5 = 00000000447a10ff
!	%f2  = 0000ff00 00ff00ff, %l6 = 00000000000000cc
!	Mem[0000000030141430] = cc000000005a00ff
	add	%i5,0x030,%g1
	stda	%f2,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030141430] = cc000000005a00ff
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000010181408] = 00000000 00000000
	stda	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 000000ff
!	%l3 = 000000000000ff00, Mem[0000000010001400] = ffffb832
	stwa	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000ff00
!	Mem[0000000010081430] = 00ff00ff, %l6 = 00000000000000cc
	ldstuba	[%i2+0x030]%asi,%l6	! %l6 = 0000000000000000

p0_label_426:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = aa000000, %l4 = 0000000000000000
	lduwa	[%i4+%o4]0x80,%l4	! %l4 = 00000000aa000000
!	Mem[0000000010081400] = 00ff0000, %l2 = 00a70aafffffffff
	ldswa	[%i2+%g0]0x88,%l2	! %l2 = 0000000000ff0000
!	Mem[0000000030141400] = 32b8ffff000000ff, %l0 = 0000000000000000
	ldxa	[%i5+%g0]0x81,%l0	! %l0 = 32b8ffff000000ff
!	Mem[0000000010081404] = fcffffff, %l2 = 0000000000ff0000, %asi = 80
	lduha	[%i2+0x004]%asi,%l2	! %l2 = 000000000000fcff
!	Mem[0000000010181408] = 00000000, %l1 = 00000000000000ff
	lduwa	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000211c0000] = ffff38a0, %l0 = 32b8ffff000000ff
	lduh	[%o2+%g0],%l0		! %l0 = 000000000000ffff
!	Mem[0000000010101400] = af0aa700, %l7 = 00000000000000ff
	ldsba	[%i4+%g0]0x88,%l7	! %l7 = 0000000000000000
!	%l5 = 00000000447a10ff, %l7 = 0000000000000000, %y  = 00000000
	umul	%l5,%l7,%l2		! %l2 = 0000000000000000, %y = 00000000
!	Mem[0000000030081400] = ff240000, %l5 = 00000000447a10ff
	ldsha	[%i2+%g0]0x81,%l5	! %l5 = ffffffffffffff24
!	Mem[00000000100c1434] = ff0024a7, %l3 = 000000000000ff00
	ldsw	[%i3+0x034],%l3		! %l3 = ffffffffff0024a7

p0_label_427:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010101430] = 0000421f 000000ff, %asi = 80
	stda	%l6,[%i4+0x030]%asi	! Mem[0000000010101430] = 00000000 00000000
!	Mem[0000000010001426] = 00ff00ff, %l7 = 0000000000000000
	ldstub	[%i0+0x026],%l7		! %l7 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010101408] = ff000000000000aa
	stxa	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000000000000000
!	%f16 = ffffffff, Mem[0000000010141430] = 00000000
	st	%f16,[%i5+0x030]	! Mem[0000000010141430] = ffffffff
!	Mem[00000000100c1408] = 00ff0000, %l3 = ffffffffff0024a7
	ldstuba	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181410] = ff7a10b8, %l2 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1400] = 00000000, %l5 = 00000000ffffff24
	swapa	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000000
!	%l2 = 00000000000000ff, Mem[0000000030181400] = 0000004800000000
	stxa	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000000000ff
!	%l4 = aa000000, %l5 = 00000000, Mem[0000000030181408] = 00000000 00000000
	stda	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = aa000000 00000000

p0_label_428:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00ff00ff, %l2 = 00000000000000ff
	lduha	[%i3+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[000000001018142c] = 00000000, %f18 = 00000000
	lda	[%i6+0x02c]%asi,%f18	! %f18 = 00000000
!	Mem[00000000211c0000] = ffff38a0, %l4 = 00000000aa000000
	ldsh	[%o2+%g0],%l4		! %l4 = ffffffffffffffff
!	%f9  = ffffb832, %f19 = a7f4ff1b
	fcmps	%fcc0,%f9 ,%f19		! %fcc0 = 3
!	Mem[0000000020800001] = ff5aa840, %l0 = 000000000000ffff
	ldub	[%o1+0x001],%l0		! %l0 = 000000000000005a
!	Mem[00000000100c1408] = 00ff00ff, %f18 = 00000000
	lda	[%i3+%o4]0x88,%f18	! %f18 = 00ff00ff
!	Mem[0000000010101408] = 00000000, %f3  = 00ff00ff
	lda	[%i4+%o4]0x88,%f3 	! %f3 = 00000000
!	Mem[0000000010001408] = 00000000, %f18 = 00ff00ff
	lda	[%i0+0x008]%asi,%f18	! %f18 = 00000000
!	Mem[0000000010081400] = 00ff0000, %l0 = 000000000000005a
	ldswa	[%i2+%g0]0x88,%l0	! %l0 = 0000000000ff0000
!	Mem[0000000010001400] = 00ff0000, %l1 = 0000000000000000
	ldsba	[%i0+%g0]0x88,%l1	! %l1 = 0000000000000000

p0_label_429:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000030041408] = ffffffff
	stwa	%l1,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	Mem[0000000030101400] = 000000ff, %l3 = 0000000000000000
	swapa	[%i4+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[00000000211c0000] = ffff38a0
	stb	%l5,[%o2+%g0]		! Mem[00000000211c0000] = 00ff38a0
!	Mem[0000000030101410] = 00000048, %l7 = 0000000000000000
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 0000000000000048
!	%l3 = 00000000000000ff, Mem[0000000020800000] = ff5aa840
	stb	%l3,[%o1+%g0]		! Mem[0000000020800000] = ff5aa840
!	%f17 = ffffffff, %f17 = ffffffff
	fcmpes	%fcc1,%f17,%f17		! %fcc1 = 3
!	%l3 = 00000000000000ff, Mem[00000000300c1408] = ff00ff00
	stwa	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000ff
!	Mem[00000000300c1408] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000000
!	%f12 = 00ff0000 ff0024a7, %l6 = 0000000000000000
!	Mem[0000000030041400] = ff000000e557ba48
	stda	%f12,[%i1+%l6]ASI_PST16_SL ! Mem[0000000030041400] = ff000000e557ba48
	membar	#Sync			! Added by membar checker (84)
!	%l4 = ffffffffffffffff, Mem[0000000010041420] = ff00ffff, %asi = 80
	stwa	%l4,[%i1+0x020]%asi	! Mem[0000000010041420] = ffffffff

p0_label_430:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ff00ff00, %l4 = ffffffffffffffff
	lduba	[%i3+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[000000001008141a] = b8107a44, %l0 = 0000000000ff0000, %asi = 80
	lduba	[%i2+0x01a]%asi,%l0	! %l0 = 000000000000007a
!	Mem[00000000201c0000] = 00ff1a10, %l2 = 00000000000000ff, %asi = 80
	ldsba	[%o0+0x000]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = 0000000000000000, %l7 = 0000000000000048
	ldxa	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000201c0000] = 00ff1a10, %l0 = 000000000000007a
	ldsh	[%o0+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010041408] = 00000000, %l3 = 00000000000000ff
	ldsha	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000000
!	%l2 = 0000000000000000, %l7 = 0000000000000000, %l3 = 0000000000000000
	xnor	%l2,%l7,%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010101408] = 00000000 00000000, %l0 = 000000ff, %l1 = 00000000
	ldd	[%i4+%o4],%l0		! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000030081408] = 00ff00ff, %l4 = 00000000000000ff
	lduwa	[%i2+%o4]0x89,%l4	! %l4 = 0000000000ff00ff
!	%l3 = ffffffffffffffff, imm = 00000000000006d2, %l6 = 0000000000000000
	add	%l3,0x6d2,%l6		! %l6 = 00000000000006d1

p0_label_431:
!	Starting 10 instruction Store Burst
!	%f13 = ff0024a7, %f27 = 61d05459, %f17 = ffffffff
	fadds	%f13,%f27,%f17		! %f17 = ff0024a7
!	Mem[00000000211c0000] = 00ff38a0, %l3 = ffffffffffffffff
	ldstub	[%o2+%g0],%l3		! %l3 = 0000000000000000
!	%f28 = ff005a00 48000000, %l5 = 0000000000000000
!	Mem[0000000030081408] = ff00ff0000000000
	add	%i2,0x008,%g1
	stda	%f28,[%g1+%l5]ASI_PST16_S ! Mem[0000000030081408] = ff00ff0000000000
!	Mem[0000000010181400] = 00000000, %l1 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800041] = ffffb270, %l1 = 0000000000000000
	ldstuba	[%o1+0x041]%asi,%l1	! %l1 = 00000000000000ff
!	%l6 = 00000000000006d1, Mem[00000000100c1410] = 00000000
	stba	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000d1
!	%l6 = 000006d1, %l7 = 00000000, Mem[0000000030081408] = 00ff00ff 00000000
	stda	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 000006d1 00000000
!	Mem[0000000010001408] = 00000000, %l0 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l0	! %l0 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000030141400] = ff000000ffffb832
	stxa	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000000
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000010081408] = 0000ffff 00000000
	stda	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000 000000ff

p0_label_432:
!	Starting 10 instruction Load Burst
!	Mem[000000001010143c] = 00000000, %l2 = 0000000000000000, %asi = 80
	ldsha	[%i4+0x03c]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = 00000000000000ff, %l2 = 0000000000000000
	ldxa	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041400] = ffffffff, %l6 = 00000000000006d1
	lduwa	[%i1+%g0]0x88,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000010141410] = 0cdb2eff, %f14 = 000000ff
	lda	[%i5+%o5]0x88,%f14	! %f14 = 0cdb2eff
!	Mem[0000000010081410] = 00ff0000c70000ff, %l2 = 00000000000000ff
	ldxa	[%i2+%o5]0x88,%l2	! %l2 = 00ff0000c70000ff
!	Mem[0000000010141408] = 00000000, %f23 = 000000ff
	lda	[%i5+%o4]0x88,%f23	! %f23 = 00000000
!	Mem[0000000030181410] = b8107aff, %l2 = 00ff0000c70000ff
	ldswa	[%i6+%o5]0x89,%l2	! %l2 = ffffffffb8107aff
!	Mem[0000000030041408] = 00000000, %l0 = 0000000000000000
	lduwa	[%i1+%o4]0x81,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (85)
!	Mem[00000000100c1400] = ffffff24 00ffffff ff00ff00 00ff00ff
!	Mem[00000000100c1410] = d1000000 000000aa ff00ff00 48000000
!	Mem[00000000100c1420] = 61d0ffff 00940000 ffe0ffff 48ba57e5
!	Mem[00000000100c1430] = 00ff0000 ff0024a7 000000ff af0a9706
	ldda	[%i3+%g0]ASI_BLK_AIUP,%f16	! Block Load from 00000000100c1400
!	Mem[000000001004142e] = 61d05459, %l4 = 0000000000ff00ff, %asi = 80
	lduha	[%i1+0x02e]%asi,%l4	! %l4 = 0000000000005459

p0_label_433:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (86)
!	%l4 = 0000000000005459, Mem[00000000100c1408] = ff00ff00
	stwa	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00005459
!	Mem[00000000211c0000] = ffff38a0, %l3 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	%l2 = ffffffffb8107aff, Mem[0000000030001410] = ff00421f000000ff
	stxa	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = ffffffffb8107aff
!	Mem[0000000030101400] = 00000000, %l4 = 0000000000005459
	ldstuba	[%i4+%g0]0x89,%l4	! %l4 = 0000000000000000
!	%l6 = 00000000ffffffff, Mem[00000000300c1400] = 0000000000000000
	stxa	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000ffffffff
!	%l1 = 00000000000000ff, Mem[00000000300c1410] = 00ff00ff
	stha	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00ff00ff
!	%l4 = 0000000000000000, Mem[0000000010081408] = 00000000ff000000
	stxa	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000000
!	Mem[0000000021800080] = 1b27b330, %l5 = 0000000000000000, %asi = 80
	ldsha	[%o3+0x080]%asi,%l5	! %l5 = 0000000000001b27
!	Mem[0000000030001400] = 48000000, %l2 = 00000000b8107aff
	swapa	[%i0+%g0]0x81,%l2	! %l2 = 0000000048000000
!	%l3 = 00000000000000ff, Mem[0000000030141408] = ff0000000000421f
	stxa	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000000000ff

p0_label_434:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 0000000000000048, %l7 = 0000000000000000
	ldx	[%i0+%o4],%l7		! %l7 = 0000000000000048
!	Mem[0000000010001418] = 95ec8000, %l1 = 00000000000000ff
	ldsw	[%i0+0x018],%l1		! %l1 = ffffffff95ec8000
!	Mem[0000000010041400] = ffffffffffffffff, %f30 = 000000ff af0a9706
	ldda	[%i1+%g0]0x80,%f30	! %f30 = ffffffff ffffffff
!	Mem[0000000030141410] = bf1cd140, %l7 = 0000000000000048
	ldsba	[%i5+%o5]0x81,%l7	! %l7 = ffffffffffffffbf
!	Mem[0000000010041400] = ffffffff, %l1 = ffffffff95ec8000
	lduwa	[%i1+%g0]0x80,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000030041400] = 000000ff, %l7 = ffffffffffffffbf
	ldsba	[%i1+%g0]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030081408] = 000006d1, %l5 = 0000000000001b27
	ldswa	[%i2+%o4]0x89,%l5	! %l5 = 00000000000006d1
!	%f9  = ffffb832, %f28 = 00ff0000
	fcmpes	%fcc3,%f9 ,%f28		! %fcc3 = 3
!	Mem[0000000010181438] = 0000ffff 00000000, %l0 = 00000000, %l1 = ffffffff
	ldd	[%i6+0x038],%l0		! %l0 = 000000000000ffff 0000000000000000
!	Mem[0000000030001410] = ffffffff, %l7 = ffffffffffffffff
	lduwa	[%i0+%o5]0x89,%l7	! %l7 = 00000000ffffffff

p0_label_435:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000006d1, Mem[0000000010181408] = 00000000
	stw	%l5,[%i6+%o4]		! Mem[0000000010181408] = 000006d1
!	%l5 = 00000000000006d1, %l4 = 0000000000000000, %l0 = 000000000000ffff
	orn	%l5,%l4,%l0		! %l0 = ffffffffffffffff
!	%f12 = 00ff0000 ff0024a7, Mem[0000000010181400] = 00000000 00000000
	std	%f12,[%i6+%g0]		! Mem[0000000010181400] = 00ff0000 ff0024a7
!	Mem[00000000300c1400] = ffffffff, %l0 = ffffffffffffffff
	ldsba	[%i3+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[000000001014142c] = a7ff0000, %l7 = 00000000ffffffff
	ldstub	[%i5+0x02c],%l7		! %l7 = 00000000000000a7
!	%l1 = 0000000000000000, Mem[0000000010081408] = 00000000
	stba	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	%f22 = ff00ff00 48000000, Mem[0000000030101408] = 000000ff 00000000
	stda	%f22,[%i4+%o4]0x89	! Mem[0000000030101408] = ff00ff00 48000000
!	Mem[0000000030101408] = 00000048, %l7 = 00000000000000a7
	swapa	[%i4+%o4]0x81,%l7	! %l7 = 0000000000000048
!	Mem[00000000300c1408] = ff0000ff, %l1 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l1	! %l1 = 00000000ff0000ff
!	%f30 = ffffffff ffffffff, Mem[0000000010181400] = 00ff0000 ff0024a7, %asi = 80
	stda	%f30,[%i6+0x000]%asi	! Mem[0000000010181400] = ffffffff ffffffff

p0_label_436:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 0000000000000000, %f6  = 00000000 48000000
	ldda	[%i4+%o5]0x81,%f6 	! %f6  = 00000000 00000000
!	Code Fragment 4, seed = 749900
p0_fragment_40:
!	%l0 = ffffffffffffffff
	setx	0xdb0b70fb26caf9c6,%g7,%l0 ! %l0 = db0b70fb26caf9c6
!	%l1 = 00000000ff0000ff
	setx	0x66c09c3283b1fbf1,%g7,%l1 ! %l1 = 66c09c3283b1fbf1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = db0b70fb26caf9c6
	setx	0x2c37baba99b5022c,%g7,%l0 ! %l0 = 2c37baba99b5022c
!	%l1 = 66c09c3283b1fbf1
	setx	0x9d4d450151720f77,%g7,%l1 ! %l1 = 9d4d450151720f77
p0_fragment_40_end:
!	Mem[0000000010081410] = c70000ff, %l2 = 0000000048000000
	lduwa	[%i2+%o5]0x88,%l2	! %l2 = 00000000c70000ff
	membar	#Sync			! Added by membar checker (87)
!	Mem[0000000010181400] = ffffffff ffffffff 000006d1 000000ff
!	Mem[0000000010181410] = 00000000 ffffff00 ff000000 00000000
!	Mem[0000000010181420] = a55a73b6 40d11cbf 0080ec95 00000000
!	Mem[0000000010181430] = 00b8ef47 000000ff 0000ffff 00000000
	ldda	[%i6+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010181400
!	Mem[0000000010101413] = ff000000, %l1 = 9d4d450151720f77
	ldsb	[%i4+0x013],%l1		! %l1 = 0000000000000000
!	Mem[00000000100c1410] = 000000d1, %l5 = 00000000000006d1
	lduba	[%i3+%o5]0x88,%l5	! %l5 = 00000000000000d1
!	Mem[0000000030181410] = ff000000b8107aff, %l3 = 00000000000000ff
	ldxa	[%i6+%o5]0x89,%l3	! %l3 = ff000000b8107aff
!	Mem[0000000010041410] = ff00000000b8ef47, %l1 = 0000000000000000
	ldxa	[%i1+%o5]0x88,%l1	! %l1 = ff00000000b8ef47
!	Mem[0000000010101403] = 00a70aaf, %l1 = ff00000000b8ef47
	ldub	[%i4+0x003],%l1		! %l1 = 00000000000000af
!	Mem[0000000030141408] = 000000ff, %l0 = 2c37baba99b5022c
	ldsba	[%i5+%o4]0x89,%l0	! %l0 = ffffffffffffffff

p0_label_437:
!	Starting 10 instruction Store Burst
!	%f1  = ffffffff, Mem[0000000010141400] = 00000000
	st	%f1 ,[%i5+%g0]		! Mem[0000000010141400] = ffffffff
!	%l3 = ff000000b8107aff, Mem[00000000300c1408] = 00000000
	stha	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00007aff
!	Mem[0000000030181400] = 00000000, %l7 = 0000000000000048
	ldstuba	[%i6+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081400] = ff240000 64000000 d1060000 00000000
!	%f16 = ffffff24 00ffffff ff00ff00 00ff00ff
!	%f20 = d1000000 000000aa ff00ff00 48000000
!	%f24 = 61d0ffff 00940000 ffe0ffff 48ba57e5
!	%f28 = 00ff0000 ff0024a7 ffffffff ffffffff
	stda	%f16,[%i2+%g0]ASI_BLK_S	! Block Store to 0000000030081400
!	%l6 = 00000000ffffffff, Mem[00000000100c1404] = 00ffffff, %asi = 80
	stwa	%l6,[%i3+0x004]%asi	! Mem[00000000100c1404] = ffffffff
!	Mem[000000001014141e] = 00000093, %l0 = ffffffffffffffff
	ldstuba	[%i5+0x01e]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1410] = ff00ff00, %l5 = 00000000000000d1
	ldstuba	[%i3+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101410] = ff000000, %l4 = 0000000000000000
	ldstub	[%i4+%o5],%l4		! %l4 = 00000000000000ff
!	%f6  = ff000000 00000000, Mem[0000000030141400] = 00000000 00000000
	stda	%f6 ,[%i5+%g0]0x89	! Mem[0000000030141400] = ff000000 00000000
!	Mem[00000000100c1408] = 00005459, %l3 = 00000000b8107aff
	swapa	[%i3+%o4]0x80,%l3	! %l3 = 0000000000005459

p0_label_438:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00ff0000, %l6 = 00000000ffffffff
	lduha	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %f0  = ffffffff
	lda	[%i1+%o5]0x81,%f0 	! %f0 = 00000000
!	Mem[0000000030001408] = 00000000ffb80000, %l5 = 0000000000000000
	ldxa	[%i0+%o4]0x81,%l5	! %l5 = 00000000ffb80000
!	Mem[0000000010041410] = 47efb800, %f12 = 00b8ef47
	lda	[%i1+%o5]0x80,%f12	! %f12 = 47efb800
!	Mem[0000000010181400] = ffffffff, %l5 = 00000000ffb80000
	ldsba	[%i6+%g0]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030141410] = bf1cd140b6735aa5, %l2 = 00000000c70000ff
	ldxa	[%i5+%o5]0x81,%l2	! %l2 = bf1cd140b6735aa5
!	Mem[0000000030101408] = a7000000, %f6  = ff000000
	lda	[%i4+%o4]0x89,%f6 	! %f6 = a7000000
!	Mem[00000000100c1410] = d1000000, %l6 = 0000000000000000
	ldsba	[%i3+%o5]0x80,%l6	! %l6 = ffffffffffffffd1
!	Mem[0000000030041408] = 00000000ffffffff, %f6  = a7000000 00000000
	ldda	[%i1+%o4]0x81,%f6 	! %f6  = 00000000 ffffffff
!	%l3 = 0000000000005459, imm = fffffffffffffaa1, %l5 = ffffffffffffffff
	addc	%l3,-0x55f,%l5		! %l5 = 0000000000004efa

p0_label_439:
!	Starting 10 instruction Store Burst
!	%l2 = bf1cd140b6735aa5, Mem[0000000030081408] = ff00ff00
	stha	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 5aa5ff00
!	Mem[0000000010101408] = 00000000, %l2 = 00000000b6735aa5
	swapa	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000000
!	%l1 = 00000000000000af, Mem[0000000010081400] = 00ff0000
	stba	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = 00ff00af
	membar	#Sync			! Added by membar checker (88)
!	%l2 = 0000000000000000, Mem[0000000010181408] = 000006d1
	stwa	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000
!	%f10 = 0080ec95 00000000, %l2 = 0000000000000000
!	Mem[0000000010101400] = 00a70aafffffffff
	stda	%f10,[%i4+%l2]ASI_PST16_P ! Mem[0000000010101400] = 00a70aafffffffff
!	%l0 = 00000000, %l1 = 000000af, Mem[0000000010101400] = 00a70aaf ffffffff
	stda	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000 000000af
!	%l3 = 0000000000005459, Mem[0000000010141408] = 00000000
	stwa	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 00005459
!	%l2 = 0000000000000000, Mem[0000000030001400] = b8107aff
	stwa	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	Mem[0000000010041400] = ffffffff, %l1 = 00000000000000af
	ldstuba	[%i1+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	%l5 = 0000000000004efa, Mem[00000000100c1400] = ffffff24ffffffff
	stxa	%l5,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000000000004efa

p0_label_440:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000000, %l6 = ffffffffffffffd1
	lduha	[%i2+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1410] = ffff00ff, %l4 = 00000000000000ff
	lduwa	[%i3+%o5]0x81,%l4	! %l4 = 00000000ffff00ff
!	Mem[0000000010181410] = 00ffffff00000000, %l3 = 0000000000005459
	ldxa	[%i6+%o5]0x88,%l3	! %l3 = 00ffffff00000000
!	Mem[0000000010081400] = af00ff00, %l2 = 0000000000000000
	lduwa	[%i2+%g0]0x80,%l2	! %l2 = 00000000af00ff00
!	Mem[0000000010101400] = 00000000, %l2 = 00000000af00ff00
	ldswa	[%i4+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = ffffffff, %l4 = 00000000ffff00ff
	lduba	[%i0+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[00000000211c0001] = ffff38a0, %l1 = 00000000000000ff, %asi = 80
	lduba	[%o2+0x001]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030081410] = aa000000 000000d1, %l4 = 000000ff, %l5 = 00004efa
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 00000000000000d1 00000000aa000000
!	Mem[0000000030001408] = 00000000, %l5 = 00000000aa000000
	lduba	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001408] = 00000000 ffb80000, %l4 = 000000d1, %l5 = 00000000
	ldda	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000 00000000ffb80000

p0_label_441:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[0000000030081400] = ffffff0024ffffff
	stxa	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000000000ff
!	Mem[0000000010081410] = ff0000c7, %l2 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%f28 = 00ff0000 ff0024a7, %l7 = 0000000000000000
!	Mem[0000000010001418] = 95ec800000000000
	add	%i0,0x018,%g1
	stda	%f28,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010001418] = 95ec800000000000
!	Mem[0000000010041410] = 00b8ef47, %l0 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l0	! %l0 = 0000000000b8ef47
!	%l3 = 00ffffff00000000, Mem[00000000300c1400] = ffffffff
	stwa	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	%l7 = 0000000000000000, Mem[0000000030081410] = d1000000000000aa
	stxa	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000000000000000
!	%f18 = ff00ff00 00ff00ff, Mem[0000000030101408] = 000000a7 00ff00ff
	stda	%f18,[%i4+%o4]0x81	! Mem[0000000030101408] = ff00ff00 00ff00ff
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000030181408] = aa000000 00000000
	stda	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ff 00000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010081408] = 00000000 00000000
	stda	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000 00000000
!	Mem[0000000010041408] = 00000000a7f4ff1b, %l3 = 00ffffff00000000, %l4 = 0000000000000000
	add	%i1,0x08,%g1
	casxa	[%g1]0x80,%l3,%l4	! %l4 = 00000000a7f4ff1b

p0_label_442:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1438] = 000000ff af0a9706, %l0 = 00b8ef47, %l1 = 000000ff, %asi = 80
	ldda	[%i3+0x038]%asi,%l0	! %l0 = 00000000000000ff 00000000af0a9706
!	Mem[0000000010101438] = 1bfff4ff00000000, %l6 = 0000000000000000
	ldx	[%i4+0x038],%l6		! %l6 = 1bfff4ff00000000
!	Mem[0000000020800000] = ff5aa840, %l6 = 1bfff4ff00000000, %asi = 80
	ldsba	[%o1+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[000000001010143c] = 00000000, %l2 = 00000000000000ff
	ldsh	[%i4+0x03c],%l2		! %l2 = 0000000000000000
!	Mem[000000001010143b] = 1bfff4ff, %l7 = 0000000000000000, %asi = 80
	lduba	[%i4+0x03b]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181402] = ffffffff, %l6 = ffffffffffffffff, %asi = 80
	ldsha	[%i6+0x002]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181424] = 40d11cbf, %l4 = 00000000a7f4ff1b
	ldsh	[%i6+0x024],%l4		! %l4 = 00000000000040d1
!	Mem[0000000010041410] = 00000000000000ff, %l7 = 00000000000000ff
	ldx	[%i1+%o5],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030181410] = ff7a10b8, %l4 = 00000000000040d1
	ldsba	[%i6+%o5]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010101410] = ff000000, %l1 = 00000000af0a9706
	lduwa	[%i4+%o5]0x80,%l1	! %l1 = 00000000ff000000

p0_label_443:
!	Starting 10 instruction Store Burst
!	Mem[000000001010143d] = 00000000, %l1 = 00000000ff000000
	ldstub	[%i4+0x03d],%l1		! %l1 = 0000000000000000
!	Mem[0000000010101428] = 000000ff, %l5 = 00000000ffb80000, %asi = 80
	swapa	[%i4+0x028]%asi,%l5	! %l5 = 00000000000000ff
!	%l6 = ffffffffffffffff, Mem[0000000010041436] = 48000000
	sth	%l6,[%i1+0x036]		! Mem[0000000010041434] = 4800ffff
!	%l0 = 00000000000000ff, Mem[0000000010181430] = 00b8ef47000000ff, %asi = 80
	stxa	%l0,[%i6+0x030]%asi	! Mem[0000000010181430] = 00000000000000ff
!	Mem[0000000010181410] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010041410] = 00000000
	stwa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	Mem[00000000100c140a] = b8107aff, %l2 = 0000000000000000
	ldstub	[%i3+0x00a],%l2		! %l2 = 000000000000007a
!	%l4 = ffffffff, %l5 = 000000ff, Mem[0000000030101400] = ff000000 00ff00ff
	stda	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = ffffffff 000000ff
!	%f25 = 00940000, Mem[0000000010141410] = 0cdb2eff
	sta	%f25,[%i5+%o5]0x88	! Mem[0000000010141410] = 00940000
!	%l3 = 00ffffff00000000, Mem[0000000010001410] = 480000ff
	stwa	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000

p0_label_444:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00000000 59540000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i5+%o4]0x88,%l0	! %l0 = 0000000059540000 0000000000000000
!	Mem[0000000010181410] = 000000ff, %l4 = ffffffffffffffff
	ldsha	[%i6+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101400] = 00000000, %l2 = 000000000000007a
	lduha	[%i4+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = ff7a10b8ffffffff, %f10 = 0080ec95 00000000
	ldda	[%i0+%o5]0x89,%f10	! %f10 = ff7a10b8 ffffffff
!	Mem[0000000030041410] = 00000000, %l0 = 0000000059540000
	lduwa	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001410] = 00000000 ffff0000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i0+%o5]0x80,%l2	! %l2 = 0000000000000000 00000000ffff0000
!	Mem[0000000010101408] = a55a73b6, %l4 = 00000000000000ff
	lduba	[%i4+%o4]0x80,%l4	! %l4 = 00000000000000a5
!	Mem[0000000010001408] = 00000000, %l5 = 00000000000000ff
	ldsba	[%i0+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101410] = ff000000, %l0 = 0000000000000000
	lduba	[%i4+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101420] = 000000a7, %l4 = 00000000000000a5, %asi = 80
	lduwa	[%i4+0x020]%asi,%l4	! %l4 = 00000000000000a7

p0_label_445:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 000000d1, %l4 = 00000000000000a7
	swapa	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000d1
!	Mem[00000000300c1410] = ff00ffff, %l6 = 00000000ffffffff
	swapa	[%i3+%o5]0x89,%l6	! %l6 = 00000000ff00ffff
!	%l0 = 00000000000000ff, Mem[0000000010081438] = ff14ffa0
	sth	%l0,[%i2+0x038]		! Mem[0000000010081438] = 00ffffa0
!	%f28 = 00ff0000 ff0024a7, %l5 = 0000000000000000
!	Mem[0000000030041410] = 000000000000ff00
	add	%i1,0x010,%g1
	stda	%f28,[%g1+%l5]ASI_PST8_S ! Mem[0000000030041410] = 000000000000ff00
!	%f4  = 00000000 ffffff00, Mem[0000000010001400] = 00ff0000 00000000
	stda	%f4 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000 ffffff00
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000010081408] = 00000000 00000000
	stda	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000ff 00000000
!	%l6 = ff00ffff, %l7 = 000000ff, Mem[0000000010101408] = b6735aa5 00000000
	stda	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = ff00ffff 000000ff
!	%l6 = 00000000ff00ffff, Mem[0000000010181400] = ffffffff
	stha	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffffff
!	%l3 = 00000000ffff0000, Mem[0000000010101410] = ff000000000000ff
	stxa	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000ffff0000
!	%l4 = 00000000000000d1, Mem[0000000010181400] = ffffffff
	stwa	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000d1

p0_label_446:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00000000, %l2 = 0000000000000000
	lduha	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000021800000] = 2cff3ad0, %l7 = 00000000000000ff, %asi = 80
	ldsha	[%o3+0x000]%asi,%l7	! %l7 = 0000000000002cff
!	%f23 = 48000000, %f21 = 000000aa, %f13 = 000000ff
	fdivs	%f23,%f21,%f13		! %f13 = 7f800000
!	Mem[0000000030081408] = 5aa5ff00, %l0 = 00000000000000ff
	lduba	[%i2+%o4]0x81,%l0	! %l0 = 000000000000005a
!	Mem[00000000300c1408] = 00007aff, %l7 = 0000000000002cff
	lduwa	[%i3+%o4]0x89,%l7	! %l7 = 0000000000007aff
!	Mem[0000000010081400] = af00ff00, %l2 = 0000000000000000
	lduha	[%i2+%g0]0x80,%l2	! %l2 = 000000000000af00
!	Mem[0000000030181410] = b8107aff, %l6 = 00000000ff00ffff
	ldsha	[%i6+%o5]0x89,%l6	! %l6 = 0000000000007aff
!	Mem[00000000201c0000] = 00ff1a10, %l1 = 0000000000000000, %asi = 80
	lduba	[%o0+0x000]%asi,%l1	! %l1 = 0000000000000000
	membar	#Sync			! Added by membar checker (89)
!	Mem[0000000010081400] = af00ff00 fcffffff ff000000 00000000
!	Mem[0000000010081410] = ff0000c7 0000ff00 b8107a44 00000000
!	Mem[0000000010081420] = ff000000 ff54d061 00008436 000000a7
!	Mem[0000000010081430] = ffff00ff a2adf0ef 00ffffa0 ffffffff
	ldda	[%i2+%g0]ASI_BLK_AIUP,%f16	! Block Load from 0000000010081400
!	Mem[0000000010141410] = 0000000000940000, %f0  = 00000000 ffffffff
	ldda	[%i5+%o5]0x88,%f0 	! %f0  = 00000000 00940000

p0_label_447:
!	Starting 10 instruction Store Burst
!	Mem[0000000021800040] = ff43b900, %l2 = 000000000000af00
	ldstuba	[%o3+0x040]%asi,%l2	! %l2 = 00000000000000ff
!	%f2  = 000006d1 000000ff, Mem[0000000010001410] = 00000000 ffff0000
	stda	%f2 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 000006d1 000000ff
!	%f4  = 00000000 ffffff00, Mem[0000000010041408] = 00000000 a7f4ff1b
	stda	%f4 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000 ffffff00
!	%l2 = 00000000000000ff, Mem[00000000218001c0] = 0093da20
	sth	%l2,[%o3+0x1c0]		! Mem[00000000218001c0] = 00ffda20
!	%f4  = 00000000 ffffff00, Mem[00000000300c1408] = 00007aff 00000000
	stda	%f4 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000 ffffff00
!	%l1 = 0000000000000000, Mem[000000001004141c] = 000000ff
	stw	%l1,[%i1+0x01c]		! Mem[000000001004141c] = 00000000
!	%f18 = ff000000 00000000, Mem[0000000030101410] = 00000000 00000000
	stda	%f18,[%i4+%o5]0x89	! Mem[0000000030101410] = ff000000 00000000
!	%f20 = ff0000c7 0000ff00, Mem[0000000010101410] = 0000ffff 00000000
	stda	%f20,[%i4+%o5]0x80	! Mem[0000000010101410] = ff0000c7 0000ff00
!	%l0 = 000000000000005a, Mem[00000000300c1400] = 00000000
	stba	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000005a
!	%l3 = 00000000ffff0000, Mem[0000000030181408] = ff000000
	stba	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000

p0_label_448:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000, %f1  = 00940000
	lda	[%i6+%o4]0x80,%f1 	! %f1 = 00000000
!	Mem[00000000300c1400] = 0000005a, %l2 = 00000000000000ff
	ldswa	[%i3+%g0]0x89,%l2	! %l2 = 000000000000005a
!	Mem[00000000100c1400] = 00000000, %l0 = 000000000000005a
	lduwa	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l5 = 0000000000000000
	lduwa	[%i3+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001410] = ffffffff, %l2 = 000000000000005a
	lduba	[%i0+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[000000001008142c] = 000000a7, %f11 = ffffffff
	lda	[%i2+0x02c]%asi,%f11	! %f11 = 000000a7
!	Mem[0000000010041408] = 00000000, %l7 = 0000000000007aff
	ldsha	[%i1+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101408] = ff00ff0000ff00ff, %f12 = 47efb800 7f800000
	ldda	[%i4+%o4]0x89,%f12	! %f12 = ff00ff00 00ff00ff
!	Mem[0000000010181408] = ff00000000000000, %l0 = 0000000000000000
	ldxa	[%i6+%o4]0x88,%l0	! %l0 = ff00000000000000
!	Mem[0000000030081410] = 00000000, %l3 = 00000000ffff0000
	lduwa	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000000

p0_label_449:
!	Starting 10 instruction Store Burst
!	Mem[0000000021800140] = ff3689c0, %l6 = 0000000000007aff
	ldstub	[%o3+0x140],%l6		! %l6 = 00000000000000ff
!	Mem[00000000100c1400] = 00000000, %l6 = 00000000000000ff
	swapa	[%i3+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000030081400] = ff00000000000000
	stxa	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l3 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l3	! %l3 = 0000000000000000
!	%l1 = 0000000000000000, Mem[00000000201c0000] = 00ff1a10
	stb	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 00ff1a10
!	%f0  = 00000000 00000000, %l2 = 00000000000000ff
!	Mem[0000000030081430] = 00ff0000ff0024a7
	add	%i2,0x030,%g1
	stda	%f0,[%g1+%l2]ASI_PST32_S ! Mem[0000000030081430] = 0000000000000000
!	Mem[0000000030041400] = 000000ff, %l4 = 00000000000000d1
	ldstuba	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1408] = ffffff00, %l2 = 00000000000000ff
	swapa	[%i3+%o4]0x89,%l2	! %l2 = 00000000ffffff00
!	%f13 = 00ff00ff, Mem[00000000300c1408] = 000000ff
	sta	%f13,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00ff00ff
!	%l3 = 0000000000000000, Mem[0000000010181410] = ff000000
	stwa	%l3,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000

p0_label_450:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ffffffffffffffff, %f12 = ff00ff00 00ff00ff
	ldda	[%i1+%g0]0x80,%f12	! %f12 = ffffffff ffffffff
!	Mem[0000000030081400] = 00000000, %l2 = 00000000ffffff00
	ldsha	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l5 = 0000000000000000
	ldswa	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001414] = 000000ff, %l5 = 0000000000000000
	ldsh	[%i0+0x014],%l5		! %l5 = 0000000000000000
!	%l2 = 0000000000000000, %l0 = ff00000000000000, %l7 = 0000000000000000
	udivx	%l2,%l0,%l7		! %l7 = 0000000000000000
!	Mem[00000000100c1404] = 00004efa, %l3 = 0000000000000000
	ldsh	[%i3+0x004],%l3		! %l3 = 0000000000000000
!	Mem[0000000030141408] = ff000000, %l1 = 0000000000000000
	lduwa	[%i5+%o4]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[000000001014143b] = 000000ff, %l2 = 0000000000000000, %asi = 80
	ldsba	[%i5+0x03b]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030001408] = 0000b8ff00000000, %f18 = ff000000 00000000
	ldda	[%i0+%o4]0x89,%f18	! %f18 = 0000b8ff 00000000
!	Mem[00000000201c0000] = 00ff1a10, %l2 = ffffffffffffffff, %asi = 80
	lduba	[%o0+0x000]%asi,%l2	! %l2 = 0000000000000000

p0_label_451:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = ff0000c7, %l3 = 0000000000000000
	swapa	[%i2+%o5]0x80,%l3	! %l3 = 00000000ff0000c7
!	%l3 = 00000000ff0000c7, Mem[0000000030081400] = 00000000
	stba	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = c7000000
!	Mem[0000000010181400] = 000000d1, %l5 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l5	! %l5 = 00000000000000d1
!	Mem[0000000010001400] = 00ffffff, %l7 = 0000000000000000
	ldstuba	[%i0+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141408] = 59540000, %l0 = 0000000000000000
	swapa	[%i5+%o4]0x88,%l0	! %l0 = 0000000059540000
!	Mem[0000000010081400] = af00ff00 fcffffff ff000000 00000000
!	%f16 = af00ff00 fcffffff 0000b8ff 00000000
!	%f20 = ff0000c7 0000ff00 b8107a44 00000000
!	%f24 = ff000000 ff54d061 00008436 000000a7
!	%f28 = ffff00ff a2adf0ef 00ffffa0 ffffffff
	stda	%f16,[%i2+%g0]ASI_BLK_PL	! Block Store to 0000000010081400
!	%l6 = 0000000000000000, Mem[0000000010001410] = d1060000
	stba	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = d1060000
!	%l6 = 0000000000000000, %l1 = 00000000ff000000, %l2 = 0000000000000000
	or	%l6,%l1,%l2		! %l2 = 00000000ff000000
!	%l0 = 0000000059540000, Mem[0000000010041408] = 00000000
	stba	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	Mem[0000000030081400] = c7000000, %l2 = 00000000ff000000
	ldstuba	[%i2+%g0]0x81,%l2	! %l2 = 00000000000000c7

p0_label_452:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = c70000ff, %l5 = 00000000000000d1
	ldsha	[%i4+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181400] = 000000ff, %l5 = 00000000000000ff
	ldsba	[%i6+%g0]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010041408] = 00ffffff00000000, %l4 = 00000000000000ff
	ldxa	[%i1+%o4]0x88,%l4	! %l4 = 00ffffff00000000
!	Mem[0000000010041410] = 00000000, %l1 = 00000000ff000000
	lduwa	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l3 = 00000000ff0000c7
	lduha	[%i6+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l7 = 0000000000000000
	ldswa	[%i0+%o4]0x89,%l7	! %l7 = 0000000000000000
!	%l1 = 0000000000000000, %l2 = 00000000000000c7, %l2 = 00000000000000c7
	orn	%l1,%l2,%l2		! %l2 = ffffffffffffff38
!	Mem[00000000100c1400] = ff000000, %l5 = ffffffffffffffff
	lduwa	[%i3+%g0]0x88,%l5	! %l5 = 00000000ff000000
	membar	#Sync			! Added by membar checker (90)
!	Mem[0000000010081408] = 00000000, %l6 = 0000000000000000
	lduha	[%i2+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %f7  = ffffffff
	ld	[%i6+%o5],%f7 		! %f7 = 00000000

p0_label_453:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 00000000, %l1 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l4 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000000
!	%f16 = af00ff00 fcffffff, %l2 = ffffffffffffff38
!	Mem[00000000300c1420] = 5954d06100000080
	add	%i3,0x020,%g1
	stda	%f16,[%g1+%l2]ASI_PST16_S ! Mem[00000000300c1420] = af00d06100000080
!	%l2 = ffffff38, %l3 = 00000000, Mem[0000000010101430] = 00000000 00000000, %asi = 80
	stda	%l2,[%i4+0x030]%asi	! Mem[0000000010101430] = ffffff38 00000000
!	Mem[0000000030001408] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l4 = 0000000000000000, %asi = 80
	swapa	[%i0+0x008]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000020800001] = ff5aa840, %l3 = 0000000000000000
	ldstub	[%o1+0x001],%l3		! %l3 = 000000000000005a
!	Mem[0000000010041418] = 000000ec, %l7 = 0000000000000000
	swap	[%i1+0x018],%l7		! %l7 = 00000000000000ec
!	%l6 = 00000000, %l7 = 000000ec, Mem[0000000010081408] = 00000000 0000b8ff
	stda	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000 000000ec
!	%l2 = ffffffffffffff38, Mem[0000000010181410] = 00000000
	stba	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000038

p0_label_454:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = b810ffff, %l3 = 000000000000005a
	lduba	[%i3+%o4]0x80,%l3	! %l3 = 00000000000000b8
!	Mem[0000000030041410] = 00000000, %l5 = 00000000ff000000
	lduha	[%i1+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l2 = ffffffffffffff38
	ldswa	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041410] = 00ff000000000000, %f0  = 00000000 00000000
	ldda	[%i1+%o5]0x89,%f0 	! %f0  = 00ff0000 00000000
!	Mem[0000000010001400] = ffffffff, %l7 = 00000000000000ec
	ldswa	[%i0+%g0]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000300c1410] = 40000000 ffffffff, %l0 = 59540000, %l1 = 00000000
	ldda	[%i3+%o5]0x89,%l0	! %l0 = 00000000ffffffff 0000000040000000
!	Mem[0000000030081400] = 000000ff, %l5 = 0000000000000000
	ldsha	[%i2+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030041410] = 00000000, %l2 = 0000000000000000
	ldswa	[%i1+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041400] = ffffffff, %l1 = 0000000040000000
	lduwa	[%i1+%g0]0x80,%l1	! %l1 = 00000000ffffffff
!	%l7 = ffffffffffffffff, %l7 = ffffffffffffffff, %l0 = 00000000ffffffff
	andn	%l7,%l7,%l0		! %l0 = 0000000000000000

p0_label_455:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = ff000000, %l3 = 00000000000000b8
	swapa	[%i1+%g0]0x81,%l3	! %l3 = 00000000ff000000
!	%f22 = b8107a44 00000000, Mem[0000000030141408] = 000000ff 00000000
	stda	%f22,[%i5+%o4]0x89	! Mem[0000000030141408] = b8107a44 00000000
!	%f18 = 0000b8ff 00000000, Mem[0000000010101408] = ffff00ff ff000000
	stda	%f18,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000b8ff 00000000
!	%l2 = 0000000000000000, %l0 = 0000000000000000, %y  = 00000000
	umul	%l2,%l0,%l7		! %l7 = 0000000000000000, %y = 00000000
!	Mem[00000000100c1400] = ff000000, %l7 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l7	! %l7 = 00000000ff000000
!	%l4 = 0000000000000000, Mem[00000000100c1408] = b810ffff
	stba	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0010ffff
!	%l6 = 0000000000000000, Mem[0000000030141400] = 00000000
	stba	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	Mem[0000000010101432] = ffffff38, %l5 = 00000000000000ff
	ldstub	[%i4+0x032],%l5		! %l5 = 00000000000000ff
!	%f22 = b8107a44 00000000, %l6 = 0000000000000000
!	Mem[0000000010081410] = 00ff0000c70000ff
	add	%i2,0x010,%g1
	stda	%f22,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010081410] = 00ff0000c70000ff
!	%l1 = 00000000ffffffff, Mem[0000000010181410] = 00000038
	stwa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffffff

p0_label_456:
!	Starting 10 instruction Load Burst
!	Mem[000000001014140a] = 00000000, %l1 = 00000000ffffffff
	lduh	[%i5+0x00a],%l1		! %l1 = 0000000000000000
!	Mem[00000000300c1408] = ff00ff00, %l5 = 00000000000000ff
	ldsba	[%i3+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010041430] = ff005a004800ffff, %f26 = 00008436 000000a7
	ldd	[%i1+0x030],%f26	! %f26 = ff005a00 4800ffff
!	Mem[0000000010001400] = 00000000 ffffffff, %l6 = 00000000, %l7 = ff000000
	ldda	[%i0+%g0]0x88,%l6	! %l6 = 00000000ffffffff 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l5 = ffffffffffffffff
	ldsba	[%i3+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0000] = 00ff1a10, %l1 = 0000000000000000, %asi = 80
	ldsba	[%o0+0x000]%asi,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1434] = ff0024a7, %l4 = 0000000000000000, %asi = 80
	lduha	[%i3+0x034]%asi,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010001410] = 000006d1, %l2 = 0000000000000000
	lduwa	[%i0+%o5]0x80,%l2	! %l2 = 00000000000006d1
!	Mem[00000000100c1410] = 000000a7, %l3 = 00000000ff000000
	lduba	[%i3+%o5]0x88,%l3	! %l3 = 00000000000000a7
!	Mem[0000000010101410] = 00ff0000c70000ff, %l1 = 0000000000000000
	ldxa	[%i4+%o5]0x88,%l1	! %l1 = 00ff0000c70000ff

p0_label_457:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000, %l1 = c70000ff, Mem[0000000010101410] = c70000ff 00ff0000
	stda	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000 c70000ff
!	%f0  = 00ff0000 00000000, Mem[0000000010181438] = 0000ffff 00000000
	std	%f0 ,[%i6+0x038]	! Mem[0000000010181438] = 00ff0000 00000000
!	%f14 = 0000ffff, Mem[0000000010141418] = 00000000
	st	%f14,[%i5+0x018]	! Mem[0000000010141418] = 0000ffff
!	%l0 = 0000000000000000, Mem[0000000030001408] = ff000000
	stba	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	%f22 = b8107a44 00000000, Mem[0000000030041408] = 00000000 ffffffff
	stda	%f22,[%i1+%o4]0x81	! Mem[0000000030041408] = b8107a44 00000000
!	Mem[0000000010001408] = 00000000, %l0 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
!	%l0 = 00000000, %l1 = c70000ff, Mem[00000000100c1400] = 00000000 fa4e0000
	stda	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 c70000ff
!	%l4 = 000000000000ff00, %l0 = 0000000000000000, %y  = 00000000
	udiv	%l4,%l0,%l4		! Div by zero, %l0 = 0000000000000028
!	Code Fragment 4, seed = 230042
p0_fragment_41:
!	%l0 = 0000000000000028
	setx	0xee5366b8bca31d56,%g7,%l0 ! %l0 = ee5366b8bca31d56
!	%l1 = 00ff0000c70000ff
	setx	0xaf07a5932f840a81,%g7,%l1 ! %l1 = af07a5932f840a81
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = ee5366b8bca31d56
	setx	0xd594948570f90bbc,%g7,%l0 ! %l0 = d594948570f90bbc
!	%l1 = af07a5932f840a81
	setx	0xec6eef18dd632407,%g7,%l1 ! %l1 = ec6eef18dd632407
p0_fragment_41_end:
!	Mem[00000000211c0001] = ffff38a0, %l4 = 000000000000ff00
	ldstub	[%o2+0x001],%l4		! %l4 = 00000000000000ff

p0_label_458:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 00000000, %l5 = 0000000000000000
	lduha	[%i0+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1410] = ffffffff, %l2 = 00000000000006d1
	ldswa	[%i3+%o5]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1408] = ff00ff00 ffff1000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i3+%o4]0x88,%l4	! %l4 = 00000000ffff1000 00000000ff00ff00
!	%l0 = d594948570f90bbc, Mem[0000000030001410] = ffffffff
	stha	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 0bbcffff
!	Mem[0000000010001400] = ffffffff, %l1 = ec6eef18dd632407
	lduwa	[%i0+%g0]0x80,%l1	! %l1 = 00000000ffffffff
!	%l7 = 0000000000000000, immd = 0000000000000ebc, %l108 = 0000000000000002
	sdivx	%l7,0xebc,%l2		! %l2 = 0000000000000000
!	Mem[0000000010141410] = 00009400, %l7 = 0000000000000000
	lduwa	[%i5+%o5]0x80,%l7	! %l7 = 0000000000009400
!	Mem[00000000100c1408] = 0010ffff, %l4 = 00000000ffff1000
	ldswa	[%i3+%o4]0x80,%l4	! %l4 = 000000000010ffff
!	Mem[0000000030101400] = ffffffff, %f19 = 00000000
	lda	[%i4+%g0]0x89,%f19	! %f19 = ffffffff
!	Mem[0000000010141408] = 00000000, %l1 = 00000000ffffffff
	ldsba	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000000

p0_label_459:
!	Starting 10 instruction Store Burst
!	%l0 = d594948570f90bbc, Mem[0000000010081410] = 00ff0000
	stha	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 0bbc0000
!	Mem[00000000100c1410] = a7000000, %l2 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l2	! %l2 = 00000000a7000000
!	%f6  = 00000000 00000000, %l1 = 0000000000000000
!	Mem[0000000010001418] = 95ec800000000000
	add	%i0,0x018,%g1
	stda	%f6,[%g1+%l1]ASI_PST32_P ! Mem[0000000010001418] = 95ec800000000000
!	%f26 = ff005a00, Mem[0000000010041410] = 00000000
	st	%f26,[%i1+%o5]		! Mem[0000000010041410] = ff005a00
!	Mem[0000000030001410] = 0bbcffff, %l3 = 00000000000000a7
	ldstuba	[%i0+%o5]0x81,%l3	! %l3 = 000000000000000b
!	%f0  = 00ff0000 00000000, %l5 = 00000000ff00ff00
!	Mem[0000000030181400] = ff000000000000ff
	stda	%f0,[%i6+%l5]ASI_PST8_S ! Mem[0000000030181400] = ff000000000000ff
!	%l3 = 000000000000000b, Mem[0000000010081400] = fffffffc00ff00af
	stxa	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000000000000b
!	%l3 = 000000000000000b, Mem[0000000010101410] = 00000000
	stwa	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000b
!	%f29 = a2adf0ef, Mem[00000000100c1404] = ff0000c7
	st	%f29,[%i3+0x004]	! Mem[00000000100c1404] = a2adf0ef
!	Mem[0000000010041410] = ff005a00, %l7 = 0000000000009400
	ldstuba	[%i1+%o5]0x80,%l7	! %l7 = 00000000000000ff

p0_label_460:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 000000000000ff00, %f16 = af00ff00 fcffffff
	ldda	[%i1+%o5]0x81,%f16	! %f16 = 00000000 0000ff00
!	Mem[0000000030081400] = ff000000, %l2 = 00000000a7000000
	ldsha	[%i2+%g0]0x81,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010001408] = 00000000 00000048, %l0 = 70f90bbc, %l1 = 00000000
	ldda	[%i0+%o4]0x80,%l0	! %l0 = 0000000000000000 0000000000000048
!	Mem[00000000100c1408] = ff00ff00ffff1000, %f12 = ffffffff ffffffff
	ldda	[%i3+%o4]0x88,%f12	! %f12 = ff00ff00 ffff1000
!	Mem[0000000010101410] = 0b000000, %l6 = 00000000ffffffff
	lduba	[%i4+%o5]0x80,%l6	! %l6 = 000000000000000b
!	Mem[0000000010181410] = ffffffff, %l0 = 0000000000000000
	lduha	[%i6+%o5]0x80,%l0	! %l0 = 000000000000ffff
!	Mem[00000000100c1408] = 0010ffff00ff00ff, %l4 = 000000000010ffff
	ldxa	[%i3+%o4]0x80,%l4	! %l4 = 0010ffff00ff00ff
!	Mem[00000000211c0000] = ffff38a0, %l7 = 00000000000000ff, %asi = 80
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030001408] = 00000000, %l6 = 000000000000000b
	ldsha	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000000
!	%l3 = 000000000000000b, imm = fffffffffffff685, %l3 = 000000000000000b
	subc	%l3,-0x97b,%l3		! %l3 = 0000000000000986

p0_label_461:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010141418] = 0000ffff0000ff93, %asi = 80
	stxa	%l6,[%i5+0x018]%asi	! Mem[0000000010141418] = 0000000000000000
!	%l0 = 000000000000ffff, Mem[00000000201c0000] = 00ff1a10
	stb	%l0,[%o0+%g0]		! Mem[00000000201c0000] = ffff1a10
!	%l3 = 0000000000000986, %l1 = 0000000000000048, %l0 = 000000000000ffff
	orn	%l3,%l1,%l0		! %l0 = ffffffffffffffb7
!	Mem[000000001010142c] = db00ffff, %l4 = 00ff00ff, %l0 = ffffffb7
	add	%i4,0x2c,%g1
	casa	[%g1]0x80,%l4,%l0	! %l0 = 00000000db00ffff
!	%l4 = 0010ffff00ff00ff, Mem[0000000020800041] = ffffb270
	stb	%l4,[%o1+0x041]		! Mem[0000000020800040] = ffffb270
!	%l3 = 0000000000000986, Mem[0000000010001418] = 95ec8000
	sth	%l3,[%i0+0x018]		! Mem[0000000010001418] = 09868000
!	Mem[0000000010041400] = ffffffff, %l4 = 0000000000ff00ff
	swapa	[%i1+%g0]0x88,%l4	! %l4 = 00000000ffffffff
!	%f24 = ff000000, %f22 = b8107a44, %f18 = 0000b8ff
	fdivs	%f24,%f22,%f18		! %f18 = 7f800000
!	%l0 = 00000000db00ffff, Mem[0000000010001420] = 000000ff
	stw	%l0,[%i0+0x020]		! Mem[0000000010001420] = db00ffff
!	Mem[0000000010081410] = 0bbc0000, %l0 = 00000000db00ffff
	swapa	[%i2+%o5]0x80,%l0	! %l0 = 000000000bbc0000

p0_label_462:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1428] = ffe0ffff, %l1 = 0000000000000048
	ldsw	[%i3+0x028],%l1		! %l1 = ffffffffffe0ffff
!	Mem[0000000020800001] = ffffa840, %l2 = ffffffffffffff00
	ldsb	[%o1+0x001],%l2		! %l2 = ffffffffffffffff
!	Mem[00000000100c1434] = ff0024a7, %f26 = ff005a00
	lda	[%i3+0x034]%asi,%f26	! %f26 = ff0024a7
!	Mem[0000000030001410] = ffffbcff, %f20 = ff0000c7
	lda	[%i0+%o5]0x89,%f20	! %f20 = ffffbcff
!	Mem[0000000010001404] = 00000000, %l0 = 000000000bbc0000
	lduw	[%i0+0x004],%l0		! %l0 = 0000000000000000
!	Mem[0000000030141408] = b8107a4400000000, %f26 = ff0024a7 4800ffff
	ldda	[%i5+%o4]0x89,%f26	! %f26 = b8107a44 00000000
!	Mem[0000000010041400] = 00ff00ff, %f31 = ffffffff
	lda	[%i1+%g0]0x88,%f31	! %f31 = 00ff00ff
!	Mem[0000000030101410] = 00000000, %l4 = 00000000ffffffff
	ldsha	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %f15 = 00000000
	lda	[%i2+%o4]0x80,%f15	! %f15 = 00000000
!	Mem[0000000010081400] = 00000000, %l3 = 0000000000000986
	lduwa	[%i2+%g0]0x88,%l3	! %l3 = 0000000000000000

p0_label_463:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ff00ff00, Mem[0000000010181408] = 00000000
	stba	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000
!	%l4 = 0000000000000000, Mem[0000000020800001] = ffffa840
	stb	%l4,[%o1+0x001]		! Mem[0000000020800000] = ff00a840
!	Mem[0000000030181410] = ff7a10b8, %l1 = ffffffffffe0ffff
	ldstuba	[%i6+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[00000000211c0000] = ffff38a0, %l0 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[0000000010001428] = 0000000061ff54ff, %asi = 80
	stxa	%l1,[%i0+0x028]%asi	! Mem[0000000010001428] = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000010141410] = 0000940000000000
	stxa	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000000000ff
!	%f29 = a2adf0ef, Mem[00000000100c1400] = 00000000
	sta	%f29,[%i3+%g0]0x88	! Mem[00000000100c1400] = a2adf0ef
!	%l0 = 00000000000000ff, Mem[0000000010141418] = 00000000
	stb	%l0,[%i5+0x018]		! Mem[0000000010141418] = ff000000
!	%l1 = 00000000000000ff, Mem[0000000030081408] = 00ffa55a
	stha	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 00ff00ff
!	Mem[0000000030181410] = ff7a10b8, %l5 = 00000000ff00ff00
	swapa	[%i6+%o5]0x81,%l5	! %l5 = 00000000ff7a10b8

p0_label_464:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041420] = ffffffff00000000, %f10 = ff7a10b8 000000a7
	ldd	[%i1+0x020],%f10	! %f10 = ffffffff 00000000
!	Mem[00000000100c1418] = ff00ff0048000000, %f8  = a55a73b6 40d11cbf
	ldd	[%i3+0x018],%f8 	! %f8  = ff00ff00 48000000
!	Mem[0000000010101418] = 00ff004800000000, %l4 = 0000000000000000
	ldx	[%i4+0x018],%l4		! %l4 = 00ff004800000000
!	Mem[00000000201c0000] = ffff1a10, %l3 = 0000000000000000
	ldsh	[%o0+%g0],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030081410] = 0000000000000000, %f10 = ffffffff 00000000
	ldda	[%i2+%o5]0x89,%f10	! %f10 = 00000000 00000000
!	Mem[0000000010081408] = 000000ec 00000000, %l4 = 00000000, %l5 = ff7a10b8
	ldda	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000000 00000000000000ec
!	Mem[0000000030041410] = 00ff000000000000, %f8  = ff00ff00 48000000
	ldda	[%i1+%o5]0x89,%f8 	! %f8  = 00ff0000 00000000
!	Mem[0000000030041408] = b8107a4400000000, %f16 = 00000000 0000ff00
	ldda	[%i1+%o4]0x81,%f16	! %f16 = b8107a44 00000000
!	Mem[0000000030101400] = ffffffff, %f13 = ffff1000
	lda	[%i4+%g0]0x81,%f13	! %f13 = ffffffff
!	Mem[0000000030101408] = 00ff00ff, %f11 = 00000000
	lda	[%i4+%o4]0x89,%f11	! %f11 = 00ff00ff

p0_label_465:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 00000000, %l6 = 0000000000000000
	ldsha	[%i6+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181400] = 000000ff, %l7 = ffffffffffffffff
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[000000001004143c] = ffff0034, %asi = 80
	stha	%l7,[%i1+0x03c]%asi	! Mem[000000001004143c] = 00ff0034
!	Mem[000000001004143a] = 18000000, %l4 = 0000000000000000
	ldstub	[%i1+0x03a],%l4		! %l4 = 0000000000000000
!	%f24 = ff000000 ff54d061, Mem[0000000030181408] = 00000000 00000000
	stda	%f24,[%i6+%o4]0x81	! Mem[0000000030181408] = ff000000 ff54d061
!	Mem[0000000030101408] = 00ff00ff, %l1 = 00000000000000ff
	ldstuba	[%i4+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%f20 = ffffbcff, Mem[0000000010041410] = 005a00ff
	sta	%f20,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffbcff
!	Mem[0000000030141408] = 00000000, %l6 = 0000000000000000
	swapa	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000000
!	%f6  = 00000000 00000000, Mem[0000000010001400] = ffffffff 00000000
	stda	%f6 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000 00000000
!	%l4 = 0000000000000000, Mem[0000000030181410] = 00ff00ff
	stwa	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000

p0_label_466:
!	Starting 10 instruction Load Burst
!	Code Fragment 4, seed = 179106
p0_fragment_42:
!	%l0 = 00000000000000ff
	setx	0x2cd933788d58dd16,%g7,%l0 ! %l0 = 2cd933788d58dd16
!	%l1 = 00000000000000ff
	setx	0x7432af20a518be41,%g7,%l1 ! %l1 = 7432af20a518be41
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2cd933788d58dd16
	setx	0x36ba8df8174a737c,%g7,%l0 ! %l0 = 36ba8df8174a737c
!	%l1 = 7432af20a518be41
	setx	0xf7469fc61ce2ffc7,%g7,%l1 ! %l1 = f7469fc61ce2ffc7
p0_fragment_42_end:
!	Mem[0000000010141400] = ffffffff, %l7 = 00000000000000ff
	ldswa	[%i5+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000021800140] = ff3689c0, %l5 = 00000000000000ec
	ldsh	[%o3+0x140],%l5		! %l5 = ffffffffffffff36
!	Mem[0000000010181400] = 00000000 ffffffff, %l0 = 174a737c, %l1 = 1ce2ffc7
	ldda	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000000 00000000ffffffff
!	Mem[00000000100c1408] = ffff1000, %l4 = 0000000000000000
	lduwa	[%i3+%o4]0x88,%l4	! %l4 = 00000000ffff1000
!	Mem[0000000030141410] = bf1cd140, %l7 = ffffffffffffffff
	ldsba	[%i5+%o5]0x81,%l7	! %l7 = ffffffffffffffbf
!	Mem[0000000030141408] = 00000000, %l7 = ffffffffffffffbf
	lduba	[%i5+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101408] = ff00ff0000ff00ff, %l3 = ffffffffffffffff
	ldxa	[%i4+%o4]0x89,%l3	! %l3 = ff00ff0000ff00ff
!	Mem[0000000010101408] = 00000000ffb80000, %l2 = ffffffffffffffff
	ldxa	[%i4+%o4]0x88,%l2	! %l2 = 00000000ffb80000
!	Mem[0000000010101408] = ffb80000, %l0 = 0000000000000000
	ldsba	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000

p0_label_467:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[00000000100c1410] = 00000000
	stha	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	Mem[0000000030081410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l6	! %l6 = 0000000000000000
!	%l2 = ffb80000, %l3 = 00ff00ff, Mem[0000000030041400] = 000000b8 e557ba48
	stda	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = ffb80000 00ff00ff
!	%l0 = 0000000000000000, Mem[0000000030181400] = 000000ff
	stwa	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	%l0 = 0000000000000000, Mem[00000000100c1410] = 00000000
	stha	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	%f13 = ffffffff, Mem[0000000010041410] = ffbcffff
	sta	%f13,[%i1+0x010]%asi	! Mem[0000000010041410] = ffffffff
!	Mem[0000000010001416] = 000000ff, %l4 = 00000000ffff1000
	ldstub	[%i0+0x016],%l4		! %l4 = 0000000000000000
!	%f20 = ffffbcff 0000ff00, Mem[0000000030181408] = 000000ff 61d054ff
	stda	%f20,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffbcff 0000ff00
!	%f4  = 00000000 ffffff00, %l0 = 0000000000000000
!	Mem[0000000030181400] = 00000000000000ff
	stda	%f4,[%i6+%l0]ASI_PST32_S ! Mem[0000000030181400] = 00000000000000ff
!	Mem[0000000010181404] = ffffffff, %l2 = 00000000ffb80000
	ldstuba	[%i6+0x004]%asi,%l2	! %l2 = 00000000000000ff

p0_label_468:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000 000000aa, %l0 = 00000000, %l1 = ffffffff
	ldda	[%i3+%o5]0x80,%l0	! %l0 = 0000000000000000 00000000000000aa
!	Mem[0000000030181410] = 00000000, %l4 = 0000000000000000
	lduha	[%i6+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1408] = ff00ff00, %l7 = 0000000000000000
	ldsba	[%i3+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010141418] = ff00000000000000, %f16 = b8107a44 00000000
	ldd	[%i5+0x018],%f16	! %f16 = ff000000 00000000
!	Mem[0000000010001400] = 00000000, %l5 = ffffffffffffff36
	lduha	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l2 = 00000000000000ff
	lduba	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = 0000000000000048, %l0 = 0000000000000000
	ldxa	[%i0+%o4]0x80,%l0	! %l0 = 0000000000000048
!	%f16 = ff000000, Mem[0000000030081410] = 000000ff
	sta	%f16,[%i2+%o5]0x89	! Mem[0000000030081410] = ff000000
!	Mem[0000000010101430] = ffffff38 00000000, %l0 = 00000048, %l1 = 000000aa
	ldd	[%i4+0x030],%l0		! %l0 = 00000000ffffff38 0000000000000000
!	Mem[0000000030181408] = 00ff0000, %l5 = 0000000000000000
	ldsba	[%i6+%o4]0x81,%l5	! %l5 = 0000000000000000

p0_label_469:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 0000005a, %l7 = ffffffffffffffff
	ldstuba	[%i3+%g0]0x89,%l7	! %l7 = 000000000000005a
!	%f28 = ffff00ff, %f26 = b8107a44 00000000
	fitod	%f28,%f26		! %f26 = c0efe020 00000000
!	%f12 = ff00ff00, Mem[00000000300c1408] = ff00ff00
	sta	%f12,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff00ff00
!	%l6 = 0000000000000000, Mem[0000000030041410] = 00000000
	stwa	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	%l0 = 00000000ffffff38, Mem[0000000010041400] = 00ff00ff
	stba	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 00ff0038
!	%l1 = 0000000000000000, Mem[00000000100c1438] = 000000ff, %asi = 80
	stwa	%l1,[%i3+0x038]%asi	! Mem[00000000100c1438] = 00000000
!	Mem[00000000300c1400] = ff000000, %l0 = 00000000ffffff38
	swapa	[%i3+%g0]0x81,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030041410] = 00000000, %l2 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l3 = ff00ff0000ff00ff
	lduba	[%i0+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[000000001018140c] = 000000ff, %l0 = 00000000ff000000
	ldstub	[%i6+0x00c],%l0		! %l0 = 0000000000000000

p0_label_470:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000, %l2 = 0000000000000000
	lduba	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101400] = ffffffff, %l0 = 0000000000000000
	lduba	[%i4+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101438] = 1bfff4ff00ff0000, %l3 = 0000000000000000, %asi = 80
	ldxa	[%i4+0x038]%asi,%l3	! %l3 = 1bfff4ff00ff0000
!	Mem[0000000010101408] = ffb80000, %l0 = 00000000000000ff
	ldsba	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041400] = 3800ff00ffffffff, %l2 = 0000000000000000
	ldxa	[%i1+%g0]0x80,%l2	! %l2 = 3800ff00ffffffff
!	Mem[000000001010140e] = 00000000, %l0 = 0000000000000000
	lduh	[%i4+0x00e],%l0		! %l0 = 0000000000000000
!	Mem[00000000100c1410] = aa00000000000000, %f30 = 00ffffa0 00ff00ff
	ldda	[%i3+%o5]0x88,%f30	! %f30 = aa000000 00000000
!	%f26 = c0efe020, %f12 = ff00ff00
	fsqrts	%f26,%f12		! %f12 = 7fffffff
!	Mem[0000000010181438] = 00ff0000 00000000, %l0 = 00000000, %l1 = 00000000
	ldd	[%i6+0x038],%l0		! %l0 = 0000000000ff0000 0000000000000000
!	Mem[0000000010041408] = 00000000, %f23 = 00000000
	lda	[%i1+%o4]0x88,%f23	! %f23 = 00000000

p0_label_471:
!	Starting 10 instruction Store Burst
!	%l2 = 3800ff00ffffffff, Mem[0000000030081410] = ff000000
	stba	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = ff0000ff
!	%f18 = 7f800000 ffffffff, %l2 = 3800ff00ffffffff
!	Mem[0000000010141428] = 0000ff1fffff0000
	add	%i5,0x028,%g1
	stda	%f18,[%g1+%l2]ASI_PST32_P ! Mem[0000000010141428] = 7f800000ffffffff
!	%l3 = 1bfff4ff00ff0000, immd = fffffcce, %y  = 00000000
	smul	%l3,-0x332,%l2		! %l2 = fffffffcd1320000, %y = fffffffc
!	Mem[0000000010041410] = ffffffff, %l4 = 0000000000000000
	ldstuba	[%i1+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000010181400] = 00000000
	stwa	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	%l5 = 0000000000000000, Mem[0000000030141408] = b8107a4400000000
	stxa	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000000000000000
!	%f25 = ff54d061, Mem[0000000030101408] = 00ff00ff
	sta	%f25,[%i4+%o4]0x89	! Mem[0000000030101408] = ff54d061
!	%l5 = 0000000000000000, %l6 = 0000000000000000, %y  = fffffffc
	umul	%l5,%l6,%l1		! %l1 = 0000000000000000, %y = 00000000
!	Mem[0000000010181424] = 40d11cbf, %l1 = 0000000000000000
	ldstub	[%i6+0x024],%l1		! %l1 = 0000000000000040
!	%l4 = 00000000000000ff, Mem[0000000010081410] = ffff00db
	stba	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = ffff00ff

p0_label_472:
!	Starting 10 instruction Load Burst
!	%l4 = 00000000000000ff, %l2 = fffffffcd1320000, %l6 = 0000000000000000
	xnor	%l4,%l2,%l6		! %l6 = 000000032ecdff00
!	Mem[0000000010181408] = ff0000ff 00000000, %l0 = 00ff0000, %l1 = 00000040
	ldda	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000000 00000000ff0000ff
!	Mem[0000000010081408] = 00000000ec000000, %l2 = fffffffcd1320000
	ldxa	[%i2+%o4]0x80,%l2	! %l2 = 00000000ec000000
!	Mem[0000000010181400] = 00000000, %f12 = 7fffffff
	lda	[%i6+%g0]0x80,%f12	! %f12 = 00000000
!	Mem[0000000010081400] = 00000000, %l4 = 00000000000000ff
	ldswa	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101400] = ffffffff, %l7 = 000000000000005a
	ldsba	[%i4+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	%f10 = 00000000, %f11 = 00ff00ff
	fcmpes	%fcc2,%f10,%f11		! %fcc2 = 1
!	Mem[00000000211c0000] = ffff38a0, %l7 = ffffffffffffffff, %asi = 80
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010001400] = 00000000, %l5 = 0000000000000000
	ldsha	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000021800080] = 1b27b330, %l5 = 0000000000000000, %asi = 80
	ldsha	[%o3+0x080]%asi,%l5	! %l5 = 0000000000001b27

p0_label_473:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 00000000, %l4 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101400] = ffffffff, %l6 = 000000032ecdff00
	ldstuba	[%i4+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%f25 = ff54d061, %f10 = 00000000, %f1  = 00000000
	fsubs	%f25,%f10,%f1 		! %f1  = ff54d061
!	Code Fragment 4, seed = 656882
p0_fragment_43:
!	%l0 = 0000000000000000
	setx	0xc97347dd4009da96,%g7,%l0 ! %l0 = c97347dd4009da96
!	%l1 = 00000000ff0000ff
	setx	0x0693fa616ae743c1,%g7,%l1 ! %l1 = 0693fa616ae743c1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c97347dd4009da96
	setx	0xcdab992cfa6000fc,%g7,%l0 ! %l0 = cdab992cfa6000fc
!	%l1 = 0693fa616ae743c1
	setx	0x78b190f36d311547,%g7,%l1 ! %l1 = 78b190f36d311547
p0_fragment_43_end:
!	Code Fragment 3, seed = 219582
p0_fragment_44:
!	%l0 = cdab992cfa6000fc
	setx	0xce352ca7ab58c836,%g7,%l0 ! %l0 = ce352ca7ab58c836
!	%l1 = 78b190f36d311547
	setx	0x812865fd51cb3f61,%g7,%l1 ! %l1 = 812865fd51cb3f61
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ce352ca7ab58c836
	setx	0x2d314d38f863aa9c,%g7,%l0 ! %l0 = 2d314d38f863aa9c
!	%l1 = 812865fd51cb3f61
	setx	0x7a62f59a145d0ce7,%g7,%l1 ! %l1 = 7a62f59a145d0ce7
p0_fragment_44_end:
!	%l3 = 1bfff4ff00ff0000, Mem[0000000010101400] = 00000000000000af
	stxa	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = 1bfff4ff00ff0000
!	%l5 = 0000000000001b27, Mem[0000000010001400] = 00000000
	stba	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 27000000
!	Mem[0000000030081400] = ff000000, %l6 = 00000000000000ff
	swapa	[%i2+%g0]0x81,%l6	! %l6 = 00000000ff000000
!	%l5 = 0000000000001b27, Mem[0000000010181408] = 00000000
	stba	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 27000000
!	Mem[0000000020800040] = ffffb270, %l7 = ffffffffffffffff
	ldstub	[%o1+0x040],%l7		! %l7 = 00000000000000ff

p0_label_474:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ffffffff, %l1 = 7a62f59a145d0ce7
	lduba	[%i6+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1400] = ffffff3800000000, %l4 = 0000000000000000
	ldxa	[%i3+%g0]0x81,%l4	! %l4 = ffffff3800000000
!	Mem[0000000010041424] = 00000000, %l7 = 00000000000000ff, %asi = 80
	ldswa	[%i1+0x024]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l2 = 00000000ec000000
	lduba	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141410] = 40d11cbf, %l2 = 0000000000000000
	ldswa	[%i5+%o5]0x89,%l2	! %l2 = 0000000040d11cbf
!	Mem[0000000010081410] = ffff00ff, %l4 = ffffff3800000000
	lduha	[%i2+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101410] = 0000000b, %l4 = 00000000000000ff
	lduwa	[%i4+%o5]0x88,%l4	! %l4 = 000000000000000b
!	Mem[000000001014142c] = ffffffff, %l4 = 000000000000000b
	ldsw	[%i5+0x02c],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010101400] = 1bfff4ff, %l2 = 0000000040d11cbf
	lduwa	[%i4+%g0]0x80,%l2	! %l2 = 000000001bfff4ff
!	Mem[0000000030101400] = ffffffff, %l5 = 0000000000001b27
	ldsha	[%i4+%g0]0x89,%l5	! %l5 = ffffffffffffffff

p0_label_475:
!	Starting 10 instruction Store Burst
!	%l0 = 2d314d38f863aa9c, Mem[0000000010181408] = 27000000
	stha	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = aa9c0000
!	%l0 = 2d314d38f863aa9c, Mem[0000000010001410] = 000006d1
	stba	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 9c0006d1
!	%l2 = 1bfff4ff, %l3 = 00ff0000, Mem[0000000010181408] = aa9c0000 ff0000ff
	stda	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 1bfff4ff 00ff0000
!	%l4 = ffffffffffffffff, Mem[00000000211c0000] = ffff38a0, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffff38a0
!	%l6 = ff000000, %l7 = 00000000, Mem[0000000010101408] = ffb80000 00000000
	stda	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = ff000000 00000000
!	%l7 = 0000000000000000, Mem[00000000100c141a] = ff00ff00, %asi = 80
	stha	%l7,[%i3+0x01a]%asi	! Mem[00000000100c1418] = ff000000
!	%l7 = 0000000000000000, Mem[00000000100c143a] = 00000000, %asi = 80
	stha	%l7,[%i3+0x03a]%asi	! Mem[00000000100c1438] = 00000000
!	%l5 = ffffffffffffffff, %l2 = 000000001bfff4ff, %l4 = ffffffffffffffff
	xor	%l5,%l2,%l4		! %l4 = ffffffffe4000b00
!	Mem[0000000030081400] = 000000ff 00000000 ff00ff00 00ff00ff
!	%f16 = ff000000 00000000 7f800000 ffffffff
!	%f20 = ffffbcff 0000ff00 b8107a44 00000000
!	%f24 = ff000000 ff54d061 c0efe020 00000000
!	%f28 = ffff00ff a2adf0ef aa000000 00000000
	stda	%f16,[%i2+%g0]ASI_BLK_SL	! Block Store to 0000000030081400
!	%f3  = 000000ff, Mem[00000000300c1400] = 38ffffff
	sta	%f3 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ff

p0_label_476:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ffffffff, %f8  = 00ff0000
	lda	[%i1+%o5]0x88,%f8 	! %f8 = ffffffff
	membar	#Sync			! Added by membar checker (91)
!	Mem[0000000010081400] = 00000000, %l1 = 00000000000000ff
	lduwa	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141408] = 00000000, %l2 = 000000001bfff4ff
	ldswa	[%i5+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1400] = eff0ada2 a2adf0ef, %l4 = e4000b00, %l5 = ffffffff
	ldda	[%i3+%g0]0x80,%l4	! %l4 = 00000000eff0ada2 00000000a2adf0ef
!	Mem[0000000030141410] = a55a73b640d11cbf, %l6 = 00000000ff000000
	ldxa	[%i5+%o5]0x89,%l6	! %l6 = a55a73b640d11cbf
!	Mem[00000000100c1410] = aa00000000000000, %f16 = ff000000 00000000
	ldda	[%i3+%o5]0x88,%f16	! %f16 = aa000000 00000000
!	Mem[0000000030141408] = 00000000, %l0 = 2d314d38f863aa9c
	lduha	[%i5+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081408] = ffffffff0000807f, %l5 = 00000000a2adf0ef
	ldxa	[%i2+%o4]0x81,%l5	! %l5 = ffffffff0000807f
!	Mem[0000000030041408] = 00000000 447a10b8, %l6 = 40d11cbf, %l7 = 00000000
	ldda	[%i1+%o4]0x89,%l6	! %l6 = 00000000447a10b8 0000000000000000
!	Mem[00000000100c1400] = eff0ada2, %l1 = 0000000000000000
	ldsha	[%i3+%g0]0x80,%l1	! %l1 = ffffffffffffeff0

p0_label_477:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010141408] = 00000000
	stba	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	Mem[00000000300c1410] = ffffffff, %l2 = 0000000000000000
	ldstuba	[%i3+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	%f10 = 00000000, Mem[0000000030141410] = bf1cd140
	sta	%f10,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	Mem[0000000030101408] = ff54d061, %l6 = 00000000447a10b8
	ldstuba	[%i4+%o4]0x89,%l6	! %l6 = 0000000000000061
!	%l3 = 1bfff4ff00ff0000, Mem[0000000010041424] = 00000000, %asi = 80
	stha	%l3,[%i1+0x024]%asi	! Mem[0000000010041424] = 00000000
!	%f18 = 7f800000 ffffffff, %l0 = 0000000000000000
!	Mem[0000000010001400] = 2700000000000000
	stda	%f18,[%i0+%l0]ASI_PST8_P ! Mem[0000000010001400] = 2700000000000000
!	Mem[0000000030081410] = 0000ff00, %l1 = ffffffffffffeff0
	ldstuba	[%i2+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%f1  = ff54d061, Mem[0000000010081404] = 0000000b
	sta	%f1 ,[%i2+0x004]%asi	! Mem[0000000010081404] = ff54d061
!	Mem[0000000010081408] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i2+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = 27000000 00000000 00000000 00000048
!	%f16 = aa000000 00000000 7f800000 ffffffff
!	%f20 = ffffbcff 0000ff00 b8107a44 00000000
!	%f24 = ff000000 ff54d061 c0efe020 00000000
!	%f28 = ffff00ff a2adf0ef aa000000 00000000
	stda	%f16,[%i0+%g0]ASI_BLK_AIUP	! Block Store to 0000000010001400

p0_label_478:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff000000ec000000, %l6 = 0000000000000061
	ldxa	[%i2+%o4]0x80,%l6	! %l6 = ff000000ec000000
!	%l3 = 1bfff4ff00ff0000, %l0 = 0000000000000000, %l4 = 00000000eff0ada2
	sub	%l3,%l0,%l4		! %l4 = 1bfff4ff00ff0000
	membar	#Sync			! Added by membar checker (92)
!	Mem[0000000010001400] = 000000aa, %l3 = 1bfff4ff00ff0000
	ldsha	[%i0+%g0]0x88,%l3	! %l3 = 00000000000000aa
!	Mem[0000000030001408] = 00000000, %f29 = a2adf0ef
	lda	[%i0+%o4]0x89,%f29	! %f29 = 00000000
!	Mem[0000000010141400] = ffffffff 00000000, %l6 = ec000000, %l7 = 00000000, %asi = 80
	ldda	[%i5+0x000]%asi,%l6	! %l6 = 00000000ffffffff 0000000000000000
!	Mem[0000000030001410] = ffbcffffb8107aff, %l5 = ffffffff0000807f
	ldxa	[%i0+%o5]0x81,%l5	! %l5 = ffbcffffb8107aff
!	Mem[0000000010041400] = 3800ff00 ffffffff 00000000 ffffff00
!	Mem[0000000010041410] = ffffffff 000000ff 00000000 00000000
!	Mem[0000000010041420] = ffffffff 00000000 00000000 61d05459
!	Mem[0000000010041430] = ff005a00 4800ffff 1800ff00 00ff0034
	ldda	[%i1+%g0]ASI_BLK_PL,%f16	! Block Load from 0000000010041400
!	Mem[00000000300c1408] = 00ff00ff, %l6 = 00000000ffffffff
	ldsha	[%i3+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000020800000] = ff00a840, %l5 = ffbcffffb8107aff
	lduh	[%o1+%g0],%l5		! %l5 = 000000000000ff00
!	Mem[0000000030001410] = ffbcffff, %f4  = 00000000
	lda	[%i0+%o5]0x81,%f4 	! %f4 = ffbcffff

p0_label_479:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 00000000 000000ff 00ff0000 ffbcffff
!	%f16 = ffffffff 00ff0038 00ffffff 00000000
!	%f20 = ff000000 ffffffff 00000000 00000000
!	%f24 = 00000000 ffffffff 5954d061 00000000
!	%f28 = ffff0048 005a00ff 3400ff00 00ff0018
	stda	%f16,[%i6+%g0]ASI_BLK_SL	! Block Store to 0000000030181400
!	%f16 = ffffffff 00ff0038, Mem[0000000010181438] = 00ff0000 00000000
	std	%f16,[%i6+0x038]	! Mem[0000000010181438] = ffffffff 00ff0038
!	Mem[0000000030081408] = ffffffff, %l2 = 00000000000000ff
	swapa	[%i2+%o4]0x89,%l2	! %l2 = 00000000ffffffff
!	%l7 = 0000000000000000, Mem[0000000030041410] = 00000000
	stba	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	Mem[0000000010041416] = 000000ff, %l4 = 1bfff4ff00ff0000
	ldstuba	[%i1+0x016]%asi,%l4	! %l4 = 0000000000000000
!	%f10 = 00000000 00ff00ff, Mem[0000000030101400] = ffffffff 000000ff
	stda	%f10,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000 00ff00ff
!	%l2 = 00000000ffffffff, Mem[00000000100c1410] = 00000000
	stha	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000ffff
!	%l3 = 00000000000000aa, Mem[0000000010181408] = 1bfff4ff
	stha	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 00aaf4ff
!	%l1 = 0000000000000000, Mem[0000000030181410] = ffffffff
	stwa	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	%f14 = 0000ffff 00000000, %l7 = 0000000000000000
!	Mem[0000000010001410] = ffffbcff0000ff00
	add	%i0,0x010,%g1
	stda	%f14,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010001410] = ffffbcff0000ff00

p0_label_480:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ffffbcff0000ffff, %f8  = ffffffff 00000000
	ldda	[%i2+%o5]0x89,%f8 	! %f8  = ffffbcff 0000ffff
	membar	#Sync			! Added by membar checker (93)
!	Mem[0000000010181400] = 00000000, %l6 = 00000000000000ff
	ldswa	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1400] = ff00000000000000, %f10 = 00000000 00ff00ff
	ldda	[%i3+%g0]0x81,%f10	! %f10 = ff000000 00000000
!	Mem[0000000010101408] = ff000000, %l2 = 00000000ffffffff
	ldsha	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l7 = 0000000000000000
	ldsba	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l3 = 00000000000000aa
	lduwa	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = ffffbcff, %l0 = 0000000000000000
	lduwa	[%i0+%o5]0x80,%l0	! %l0 = 00000000ffffbcff
!	Mem[0000000030041410] = 000000000000ff00, %f24 = 00000000 ffffffff
	ldda	[%i1+%o5]0x81,%f24	! %f24 = 00000000 0000ff00
!	Mem[0000000020800040] = ffffb270, %l6 = 0000000000000000
	lduh	[%o1+0x040],%l6		! %l6 = 000000000000ffff
!	Mem[0000000030041408] = b8107a44, %l3 = 0000000000000000
	lduba	[%i1+%o4]0x81,%l3	! %l3 = 00000000000000b8

p0_label_481:
!	Starting 10 instruction Store Burst
!	Mem[0000000021800101] = 00001b90, %l7 = 0000000000000000
	ldstuba	[%o3+0x101]%asi,%l7	! %l7 = 0000000000000000
!	%l4 = 00000000, %l5 = 0000ff00, Mem[0000000010101408] = 000000ff 00000000
	std	%l4,[%i4+%o4]		! Mem[0000000010101408] = 00000000 0000ff00
!	%f4  = ffbcffff ffffff00, %l2 = 0000000000000000
!	Mem[00000000300c1428] = 5954d0616d2224a7
	add	%i3,0x028,%g1
	stda	%f4,[%g1+%l2]ASI_PST8_SL ! Mem[00000000300c1428] = 5954d0616d2224a7
!	%f8  = ffffbcff 0000ffff, Mem[0000000030001400] = 00000000 00000000
	stda	%f8 ,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffbcff 0000ffff
!	Mem[0000000010081434] = ff00ffff, %f12 = 00000000
	ld	[%i2+0x034],%f12	! %f12 = ff00ffff
!	Mem[0000000030001400] = ffff0000, %l2 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l2	! %l2 = 00000000ffff0000
!	Mem[0000000010081410] = ff00ffff, %l4 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141408] = 00000000, %l7 = 0000000000000000
	swapa	[%i5+%o4]0x89,%l7	! %l7 = 0000000000000000
!	%f0  = 00ff0000 ff54d061, Mem[0000000010081400] = 00000000 61d054ff
	stda	%f0 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 00ff0000 ff54d061
!	%l6 = 0000ffff, %l7 = 00000000, Mem[0000000010081400] = ff54d061 00ff0000
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000ffff 00000000

p0_label_482:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ffd054ff 00ff00ff, %l0 = ffffbcff, %l1 = 00000000
	ldda	[%i4+%o4]0x81,%l0	! %l0 = 00000000ffd054ff 0000000000ff00ff
!	Mem[0000000010001400] = aa000000, %l5 = 000000000000ff00
	ldswa	[%i0+%g0]0x80,%l5	! %l5 = ffffffffaa000000
!	Mem[0000000010141410] = 00000000, %l5 = ffffffffaa000000
	lduba	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %l3 = 00000000000000b8
	ldsba	[%i4+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = 00ffffff00000000, %l2 = 00000000ffff0000
	ldxa	[%i1+%o4]0x88,%l2	! %l2 = 00ffffff00000000
!	Mem[0000000030141408] = 00000000, %f19 = 00000000
	lda	[%i5+%o4]0x89,%f19	! %f19 = 00000000
!	Mem[0000000010101400] = 1bfff4ff, %l0 = 00000000ffd054ff
	lduba	[%i4+%g0]0x80,%l0	! %l0 = 000000000000001b
!	Mem[0000000030181410] = 00000000000000ff, %f6  = 00000000 00000000
	ldda	[%i6+%o5]0x81,%f6 	! %f6  = 00000000 000000ff
!	Mem[0000000010141408] = 0000000000000000, %l6 = 000000000000ffff
	ldxa	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000201c0000] = ffff1a10, %l1 = 0000000000ff00ff, %asi = 80
	ldsba	[%o0+0x000]%asi,%l1	! %l1 = ffffffffffffffff

p0_label_483:
!	Starting 10 instruction Store Burst
!	%l0 = 0000001b, %l1 = ffffffff, Mem[0000000030101408] = ff54d0ff ff00ff00
	stda	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000001b ffffffff
!	Mem[0000000010001410] = ffffbcff, %l0 = 000000000000001b
	ldstuba	[%i0+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101424] = 000000ff, %l1 = 00000000ffffffff
	swap	[%i4+0x024],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030101410] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081400] = ffff0000 00000000 ff000000 ec000000
!	%f16 = ffffffff 00ff0038 00ffffff 00000000
!	%f20 = ff000000 ffffffff 00000000 00000000
!	%f24 = 00000000 0000ff00 5954d061 00000000
!	%f28 = ffff0048 005a00ff 3400ff00 00ff0018
	stda	%f16,[%i2+%g0]ASI_BLK_P	! Block Store to 0000000010081400
!	Mem[0000000010041408] = 00000000, %l2 = 00ffffff00000000
	ldstuba	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1408] = 00ff00ff, %l1 = 00000000000000ff
	ldstuba	[%i3+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041422] = ffffffff, %l6 = 0000000000000000
	ldstub	[%i1+0x022],%l6		! %l6 = 00000000000000ff
!	Mem[00000000100c1400] = a2adf0ef, %l7 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l7	! %l7 = 00000000a2adf0ef
!	%l2 = 0000000000000000, Mem[0000000030041400] = ffb8000000ff00ff
	stxa	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000000000000000

p0_label_484:
!	Starting 10 instruction Load Burst
!	Mem[000000001004142c] = 61d05459, %l2 = 0000000000000000, %asi = 80
	ldsha	[%i1+0x02c]%asi,%l2	! %l2 = 00000000000061d0
!	Mem[00000000300c1408] = ff00ff00, %l6 = 00000000000000ff
	ldsba	[%i3+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101410] = 0b000000, %l3 = 0000000000000000
	lduwa	[%i4+%o5]0x80,%l3	! %l3 = 000000000b000000
	membar	#Sync			! Added by membar checker (94)
!	Mem[0000000010081408] = 00ffffff, %l6 = ffffffffffffffff
	ldsba	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001408] = 0000807f, %l5 = 0000000000000000
	lduha	[%i0+%o4]0x88,%l5	! %l5 = 000000000000807f
!	Mem[00000000201c0001] = ffff1a10, %l1 = 00000000000000ff
	ldub	[%o0+0x001],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010001410] = ffffbcff, %l6 = 0000000000000000
	lduwa	[%i0+%o5]0x80,%l6	! %l6 = 00000000ffffbcff
!	%l7 = 00000000a2adf0ef, %l2 = 00000000000061d0, %l1 = 00000000000000ff
	sub	%l7,%l2,%l1		! %l1 = 00000000a2ad8f1f
!	Mem[00000000300c1408] = ff00ff00, %f18 = 00ffffff
	lda	[%i3+%o4]0x81,%f18	! %f18 = ff00ff00
!	Mem[0000000010041400] = ffffffff00ff0038, %l0 = 00000000000000ff
	ldxa	[%i1+%g0]0x88,%l0	! %l0 = ffffffff00ff0038

p0_label_485:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, %l6 = 00000000ffffbcff, %l7 = 00000000a2adf0ef
	xor	%l4,%l6,%l7		! %l7 = 00000000ffffbc00
!	Mem[0000000030181400] = 3800ff00, %l6 = 00000000ffffbcff
	ldstuba	[%i6+%g0]0x81,%l6	! %l6 = 0000000000000038
!	%l3 = 000000000b000000, Mem[0000000030101410] = ff000000000000ff
	stxa	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000000b000000
!	Mem[0000000021800180] = b7ff73f0, %l2 = 00000000000061d0
	ldstub	[%o3+0x180],%l2		! %l2 = 00000000000000b7
!	%f11 = 00000000, %f22 = 00000000
	fcmps	%fcc1,%f11,%f22		! %fcc1 = 0
!	%l3 = 000000000b000000, Mem[0000000030141410] = 00000000
	stba	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	Mem[0000000010141400] = ffffffff, %l0 = 0000000000ff0038, %asi = 80
	swapa	[%i5+0x000]%asi,%l0	! %l0 = 00000000ffffffff
!	%l3 = 000000000b000000, Mem[0000000010141410] = 00000000
	stba	%l3,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	Mem[0000000030041410] = 00000000, %l0 = 00000000ffffffff
	ldstuba	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000000
!	%l2 = 00000000000000b7, Mem[0000000010001408] = 0000807f
	stwa	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000b7

p0_label_486:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000, %f22 = 00000000
	lda	[%i0+%o4]0x81,%f22	! %f22 = 00000000
!	Mem[0000000030101408] = 0000001b, %l2 = 00000000000000b7
	lduha	[%i4+%o4]0x89,%l2	! %l2 = 000000000000001b
!	Mem[00000000100c1408] = 0010ffff, %l3 = 000000000b000000
	ldsba	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = ffffffff, %l6 = 0000000000000038
	ldswa	[%i2+%g0]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030181410] = 00000000, %l6 = ffffffffffffffff
	lduba	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001400] = ffffbcff00000000, %f0  = 00ff0000 ff54d061
	ldda	[%i0+%g0]0x89,%f0 	! %f0  = ffffbcff 00000000
!	Mem[00000000300c1408] = 00ff00ff, %l3 = 0000000000000000
	lduha	[%i3+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041400] = 0000000000000000, %l3 = 00000000000000ff
	ldxa	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l7 = 00000000ffffbc00
	ldsha	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041408] = 447a10b8, %l4 = 00000000000000ff
	lduba	[%i1+%o4]0x89,%l4	! %l4 = 00000000000000b8

p0_label_487:
!	Starting 10 instruction Store Burst
!	%l4 = 000000b8, %l5 = 0000807f, Mem[0000000030181408] = 00000000 00ffffff
	stda	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000b8 0000807f
!	Mem[0000000030081408] = ff000000, %l5 = 000000000000807f
	swapa	[%i2+%o4]0x81,%l5	! %l5 = 00000000ff000000
!	%l5 = 00000000ff000000, Mem[0000000010081400] = ffffffff00ff0038
	stxa	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000ff000000
!	Mem[00000000100c1400] = 00000000, %l2 = 000000000000001b
	ldstuba	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%l0 = 00000000, %l1 = a2ad8f1f, Mem[0000000010041400] = 3800ff00 ffffffff
	stda	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000 a2ad8f1f
!	%l5 = 00000000ff000000, Mem[0000000010081410] = ffffffff000000ff
	stxa	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000ff000000
!	Mem[0000000030101400] = 00000000 00ff00ff 1b000000 ffffffff
!	%f16 = ffffffff 00ff0038 ff00ff00 00000000
!	%f20 = ff000000 ffffffff 00000000 00000000
!	%f24 = 00000000 0000ff00 5954d061 00000000
!	%f28 = ffff0048 005a00ff 3400ff00 00ff0018
	stda	%f16,[%i4+%g0]ASI_BLK_SL	! Block Store to 0000000030101400
!	%l5 = 00000000ff000000, Mem[0000000010001400] = aa00000000000000
	stx	%l5,[%i0+%g0]		! Mem[0000000010001400] = 00000000ff000000
!	Mem[0000000010181418] = ff000000, %l3 = 00000000, %l3 = 00000000
	add	%i6,0x18,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 00000000ff000000
!	%l7 = 0000000000000000, Mem[0000000010181410] = ffffffffffffff00
	stxa	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000000000000

p0_label_488:
!	Starting 10 instruction Load Burst
!	Mem[00000000218001c1] = 00ffda20, %l5 = 00000000ff000000, %asi = 80
	lduba	[%o3+0x1c1]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181414] = 00000000, %f8  = ffffbcff
	lda	[%i6+0x014]%asi,%f8 	! %f8 = 00000000
!	Mem[0000000030181400] = ff00ff00ffffffff, %l6 = 0000000000000000
	ldxa	[%i6+%g0]0x81,%l6	! %l6 = ff00ff00ffffffff
!	Mem[00000000100c1410] = 0000ffff, %l1 = 00000000a2ad8f1f
	ldswa	[%i3+%o5]0x88,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030001410] = ffffbcff, %l7 = 0000000000000000
	lduha	[%i0+%o5]0x89,%l7	! %l7 = 000000000000bcff
	membar	#Sync			! Added by membar checker (95)
!	Mem[0000000030101400] = 3800ff00 ffffffff 00000000 00ff00ff
!	Mem[0000000030101410] = ffffffff 000000ff 00000000 00000000
!	Mem[0000000030101420] = 00ff0000 00000000 00000000 61d05459
!	Mem[0000000030101430] = ff005a00 4800ffff 1800ff00 00ff0034
	ldda	[%i4+%g0]ASI_BLK_AIUSL,%f0 	! Block Load from 0000000030101400
!	Mem[0000000010041408] = ff000000ffffff00, %l0 = 0000000000000000, %asi = 80
	ldxa	[%i1+0x008]%asi,%l0	! %l0 = ff000000ffffff00
!	Mem[0000000030041410] = ff000000, %l1 = 000000000000ffff
	ldsba	[%i1+%o5]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030041400] = 00000000, %l5 = 00000000000000ff
	lduwa	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l2 = 0000000000000000
	ldsha	[%i4+%o4]0x89,%l2	! %l2 = 0000000000000000

p0_label_489:
!	Starting 10 instruction Store Burst
!	Mem[0000000020800000] = ff00a840, %l2 = 0000000000000000
	ldstuba	[%o1+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141418] = ff000000, %l7 = 000000000000bcff, %asi = 80
	swapa	[%i5+0x018]%asi,%l7	! %l7 = 00000000ff000000
!	Mem[000000001000141c] = 00000000, %l2 = 00000000000000ff
	swap	[%i0+0x01c],%l2		! %l2 = 0000000000000000
!	Mem[0000000010041408] = ff000000, %l0 = ffffff00, %l2 = 00000000
	add	%i1,0x08,%g1
	casa	[%g1]0x80,%l0,%l2	! %l2 = 00000000ff000000
!	Mem[0000000010001429] = c0efe020, %l0 = ff000000ffffff00
	ldstuba	[%i0+0x029]%asi,%l0	! %l0 = 00000000000000ef
!	%l0 = 00000000000000ef, Mem[0000000030141410] = 00000000
	stwa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000ef
!	Mem[0000000010001400] = 00000000, %l2 = 00000000ff000000
	swapa	[%i0+%g0]0x88,%l2	! %l2 = 0000000000000000
!	%f24 = 00000000 0000ff00, Mem[0000000030041410] = ff000000 0000ff00
	stda	%f24,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 0000ff00
!	Mem[0000000010101418] = 00ff004800000000, %l5 = 0000000000000000, %l6 = ff00ff00ffffffff
	add	%i4,0x18,%g1
	casxa	[%g1]0x80,%l5,%l6	! %l6 = 00ff004800000000
!	%l1 = ffffffffffffffff, Mem[0000000030181410] = 00000000
	stba	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = ff000000

p0_label_490:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 0000000000000000, %l0 = 00000000000000ef
	ldxa	[%i5+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001410] = ffbcffff, %l1 = ffffffffffffffff
	lduba	[%i0+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141400] = 3800ff00, %l3 = 00000000ff000000
	lduha	[%i5+%g0]0x88,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010041410] = ffffffff, %l5 = 0000000000000000
	ldsha	[%i1+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010081408] = 00ffffff 00000000, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i2+%o4]0x80,%l0	! %l0 = 0000000000ffffff 0000000000000000
!	Mem[0000000030181408] = 000000b8, %l3 = 000000000000ff00
	lduha	[%i6+%o4]0x89,%l3	! %l3 = 00000000000000b8
!	Mem[0000000010041408] = 000000ff, %l5 = ffffffffffffffff
	ldsba	[%i1+%o4]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030101410] = ffffffff, %l3 = 00000000000000b8
	lduha	[%i4+%o5]0x81,%l3	! %l3 = 000000000000ffff
!	%l0 = 0000000000ffffff, %l1 = 0000000000000000, %l6 = 00ff004800000000
	addc	%l0,%l1,%l6		! %l6 = 0000000000ffffff
!	Mem[00000000300c1400] = ff000000, %l6 = 0000000000ffffff
	ldsba	[%i3+%g0]0x81,%l6	! %l6 = ffffffffffffffff

p0_label_491:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 00ff0038, %l3 = 000000000000ffff
	ldstuba	[%i4+%g0]0x89,%l3	! %l3 = 0000000000000038
!	Mem[0000000030001410] = ffffbcff, %l6 = 00000000ffffffff
	swapa	[%i0+%o5]0x89,%l6	! %l6 = 00000000ffffbcff
!	Mem[0000000030181400] = ff00ff00, %l4 = 00000000000000b8
	swapa	[%i6+%g0]0x81,%l4	! %l4 = 00000000ff00ff00
	membar	#Sync			! Added by membar checker (96)
!	%f8  = 00000000 0000ff00, Mem[0000000030101410] = ffffffff 000000ff
	stda	%f8 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000 0000ff00
!	Mem[00000000100c1434] = ff0024a7, %l5 = 00000000ffffffff
	swap	[%i3+0x034],%l5		! %l5 = 00000000ff0024a7
!	Mem[0000000010141438] = 000000ff, %l2 = 00000000, %l7 = ff000000
	add	%i5,0x38,%g1
	casa	[%g1]0x80,%l2,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1408] = 00ff00ff, %l0 = 0000000000ffffff
	ldstuba	[%i3+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000010141400] = 3800ff00
	stwa	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff
!	Mem[0000000010141410] = 00000000, %l2 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000000
!	%f0  = ffffffff, Mem[0000000010041400] = 00000000
	sta	%f0 ,[%i1+%g0]0x80	! Mem[0000000010041400] = ffffffff

p0_label_492:
!	Starting 10 instruction Load Burst
!	%f2  = ff00ff00, %f20 = ff000000
	fcmpes	%fcc2,%f2 ,%f20		! %fcc2 = 1
!	Mem[0000000010181438] = ffffffff00ff0038, %l3 = 0000000000000038
	ldx	[%i6+0x038],%l3		! %l3 = ffffffff00ff0038
!	Mem[000000001004143c] = 00ff0034, %l6 = 00000000ffffbcff
	lduw	[%i1+0x03c],%l6		! %l6 = 0000000000ff0034
!	Mem[0000000030141408] = 00000000, %l6 = 0000000000ff0034
	ldswa	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000000
!	%f14 = 3400ff00, %f13 = 005a00ff
	fitos	%f14,%f13		! %f13 = 4e5003fc
!	Mem[0000000030041408] = 447a10b8, %l0 = 00000000000000ff
	lduba	[%i1+%o4]0x89,%l0	! %l0 = 00000000000000b8
!	Mem[0000000010081410] = 000000ff 00000000, %l0 = 000000b8, %l1 = 00000000
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[00000000300c1410] = ffffffff, %l4 = 00000000ff00ff00
	lduha	[%i3+%o5]0x89,%l4	! %l4 = 000000000000ffff
!	%l2 = 0000000000000000, Mem[0000000030101408] = 00000000
	stwa	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	Mem[0000000030001408] = 00000000, %l7 = 00000000000000ff
	lduba	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000000

p0_label_493:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, imm = 00000000000004f2, %l2 = 0000000000000000
	xnor	%l2,0x4f2,%l2		! %l2 = fffffffffffffb0d
!	Mem[0000000030181408] = 000000b8, %l4 = 000000000000ffff
	ldstuba	[%i6+%o4]0x89,%l4	! %l4 = 00000000000000b8
!	Mem[0000000010101403] = 1bfff4ff, %l6 = 0000000000000000
	ldstuba	[%i4+0x003]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1400] = 000000ff, %l4 = 00000000000000b8
	swapa	[%i3+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000030141410] = 000000ef
	stba	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	Mem[0000000010141438] = 000000ff00ff00ff, %l7 = 0000000000000000, %l5 = 00000000ff0024a7
	add	%i5,0x38,%g1
	casxa	[%g1]0x80,%l7,%l5	! %l5 = 000000ff00ff00ff
!	%l5 = 000000ff00ff00ff, Mem[0000000010101400] = fff4ff1b
	stha	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = fff400ff
!	%l1 = 0000000000000000, imm = 0000000000000085, %l2 = fffffffffffffb0d
	xor	%l1,0x085,%l2		! %l2 = 0000000000000085
!	Mem[0000000010041408] = 000000ff, %l3 = 0000000000ff0038
	swapa	[%i1+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1408] = ffff1000, %l6 = 00000000000000ff
	ldstuba	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000000

p0_label_494:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ffffffff, %l2 = 0000000000000085
	lduha	[%i1+%o5]0x80,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010001400] = 000000ff, %l2 = 000000000000ffff
	ldswa	[%i0+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101410] = 00000000, %l3 = 00000000000000ff
	ldsha	[%i4+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1400] = 000000ff, %l0 = 00000000000000ff
	ldsha	[%i3+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[00000000218001c0] = 00ffda20, %l3 = 0000000000000000
	lduh	[%o3+0x1c0],%l3		! %l3 = 00000000000000ff
!	%f30 = 3400ff00, %f15 = 00ff0018, %f11 = 00000000
	fmuls	%f30,%f15,%f11		! tt=0x22, %l0 = 0000000000000121
!	Mem[0000000030181410] = ff000000000000ff, %l3 = 00000000000000ff
	ldxa	[%i6+%o5]0x89,%l3	! %l3 = ff000000000000ff
!	Mem[0000000030181400] = 000000b8ffffffff, %f16 = ffffffff 00ff0038
	ldda	[%i6+%g0]0x81,%f16	! %f16 = 000000b8 ffffffff
!	Mem[0000000020800000] = ff00a840, %l7 = 0000000000000000
	ldsh	[%o1+%g0],%l7		! %l7 = ffffffffffffff00
!	Code Fragment 3, seed = 311134
p0_fragment_45:
!	%l0 = 0000000000000121
	setx	0x37c7c7bb71c53b36,%g7,%l0 ! %l0 = 37c7c7bb71c53b36
!	%l1 = 0000000000000000
	setx	0x1ea475181bc94261,%g7,%l1 ! %l1 = 1ea475181bc94261
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 37c7c7bb71c53b36
	setx	0x0e72609ffc7e3d9c,%g7,%l0 ! %l0 = 0e72609ffc7e3d9c
!	%l1 = 1ea475181bc94261
	setx	0x7be8fbb7df2f2fe7,%g7,%l1 ! %l1 = 7be8fbb7df2f2fe7
p0_fragment_45_end:

p0_label_495:
!	Starting 10 instruction Store Burst
!	%l0 = fc7e3d9c, %l1 = df2f2fe7, Mem[0000000030101400] = 00ff00ff ffffffff
	stda	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = fc7e3d9c df2f2fe7
!	Mem[0000000030181410] = ff000000, %l1 = 7be8fbb7df2f2fe7
	ldstuba	[%i6+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	%f10 = 5954d061 00000000, %l3 = ff000000000000ff
!	Mem[00000000100c1400] = ff000000a2adf0ef
	stda	%f10,[%i3+%l3]ASI_PST32_PL ! Mem[00000000100c1400] = 0000000061d05459
!	%f31 = 00ff0018, Mem[0000000010041408] = 3800ff00
	sta	%f31,[%i1+%o4]0x80	! Mem[0000000010041408] = 00ff0018
!	%f30 = 3400ff00, %f25 = 0000ff00
	fcmpes	%fcc3,%f30,%f25		! %fcc3 = 2
!	%f23 = 00000000, %f18 = ff00ff00, %f8  = 00000000
	fdivs	%f23,%f18,%f8 		! %f8  = 80000000
!	Mem[0000000010001408] = b7000000, %l0 = 00000000fc7e3d9c
	swap	[%i0+%o4],%l0		! %l0 = 00000000b7000000
!	Mem[0000000010041431] = ff005a00, %l1 = 00000000000000ff
	ldstub	[%i1+0x031],%l1		! %l1 = 0000000000000000
!	Mem[0000000010141400] = 000000ff, %l4 = 00000000000000ff
	ldstuba	[%i5+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%l5 = 000000ff00ff00ff, Mem[00000000300c1408] = ff00ff00
	stha	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00ffff00

p0_label_496:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00000000, %l1 = 0000000000000000
	lduha	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141400] = 000000ff, %l4 = 00000000000000ff
	lduba	[%i5+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001408] = fc7e3d9cffffffff, %f12 = ffff0048 4e5003fc
	ldda	[%i0+%o4]0x80,%f12	! %f12 = fc7e3d9c ffffffff
!	Mem[0000000030001400] = 00000000, %l0 = 00000000b7000000
	ldswa	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l7 = ffffffffffffff00
	lduba	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1400] = b8000000, %l7 = 0000000000000000
	ldsba	[%i3+%g0]0x81,%l7	! %l7 = ffffffffffffffb8
!	Mem[0000000030081410] = ffff0000, %l2 = 00000000000000ff
	lduwa	[%i2+%o5]0x81,%l2	! %l2 = 00000000ffff0000
!	Mem[00000000300c1408] = 00ffff00, %f17 = ffffffff
	lda	[%i3+%o4]0x81,%f17	! %f17 = 00ffff00
!	Mem[0000000021800040] = ff43b900, %l4 = 00000000000000ff
	ldsh	[%o3+0x040],%l4		! %l4 = ffffffffffffff43
!	Mem[000000001008142c] = 00000000, %f30 = 3400ff00
	ld	[%i2+0x02c],%f30	! %f30 = 00000000

p0_label_497:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 00000000, %l4 = ffffffffffffff43
	ldstuba	[%i6+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = 00000000 000000ff 0000807f 0000807f
!	%f0  = ffffffff 00ff0038 ff00ff00 00000000
!	%f4  = ff000000 ffffffff 00000000 00000000
!	%f8  = 80000000 0000ff00 5954d061 00000000
!	%f12 = fc7e3d9c ffffffff 3400ff00 00ff0018
	stda	%f0 ,[%i2+%g0]ASI_BLK_SL	! Block Store to 0000000030081400
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010101410] = 0b000000 ff0000c7
	stda	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000 00000000
!	Mem[0000000010041410] = ffffffff, %l1 = 0000000000000000
	ldstuba	[%i1+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %l7 = ffffffffffffffb8
	ldstuba	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041400] = ffffffff, %l0 = 0000000000000000
	ldstuba	[%i1+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%f6  = 00000000, Mem[0000000030001410] = ffffffff
	sta	%f6 ,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	%l4 = 0000000000000000, Mem[0000000010041400] = 1f8fada2ffffffff
	stxa	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000000000000000
!	Mem[0000000010041404] = 00000000, %l3 = 000000ff, %l4 = 00000000
	add	%i1,0x04,%g1
	casa	[%g1]0x80,%l3,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001402] = 000000ff, %l1 = 00000000000000ff
	ldstuba	[%i0+0x002]%asi,%l1	! %l1 = 0000000000000000

p0_label_498:
!	Starting 10 instruction Load Burst
!	Mem[00000000218000c0] = ffff2960, %l1 = 0000000000000000
	ldsh	[%o3+0x0c0],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010141408] = ff000000, %l7 = 0000000000000000
	ldsha	[%i5+%o4]0x80,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000010001408] = 9c3d7efc, %l6 = 0000000000000000
	lduha	[%i0+%o4]0x88,%l6	! %l6 = 0000000000007efc
!	Mem[0000000010041428] = 0000000061d05459, %l4 = 0000000000000000
	ldx	[%i1+0x028],%l4		! %l4 = 0000000061d05459
!	Code Fragment 4, seed = 151773
p0_fragment_46:
!	%l0 = 00000000000000ff
	setx	0x1ede7d4d15bd5e3e,%g7,%l0 ! %l0 = 1ede7d4d15bd5e3e
!	%l1 = ffffffffffffffff
	setx	0x2859d1c1fb4a96e9,%g7,%l1 ! %l1 = 2859d1c1fb4a96e9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1ede7d4d15bd5e3e
	setx	0x1ae5ca3ade400ba4,%g7,%l0 ! %l0 = 1ae5ca3ade400ba4
!	%l1 = 2859d1c1fb4a96e9
	setx	0x7174755193e63f6f,%g7,%l1 ! %l1 = 7174755193e63f6f
p0_fragment_46_end:
!	Mem[0000000010141408] = ff000000, %l5 = 000000ff00ff00ff
	lduwa	[%i5+%o4]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010181408] = fff4aa00, %l2 = 00000000ffff0000
	ldswa	[%i6+%o4]0x88,%l2	! %l2 = fffffffffff4aa00
!	Mem[00000000300c1408] = 00ffff00, %l6 = 0000000000007efc
	lduwa	[%i3+%o4]0x81,%l6	! %l6 = 0000000000ffff00
!	Mem[0000000030001410] = 00000000 b8107aff, %l0 = de400ba4, %l1 = 93e63f6f
	ldda	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000000 00000000b8107aff
!	Mem[0000000010141400] = 000000ff, %l3 = ff000000000000ff
	lduwa	[%i5+%g0]0x88,%l3	! %l3 = 00000000000000ff

p0_label_499:
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ff, Mem[0000000010001410] = ffbcffff
	stba	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = ffbcffff
!	Mem[0000000030041408] = b8107a44, %l6 = 0000000000ffff00
	swapa	[%i1+%o4]0x81,%l6	! %l6 = 00000000b8107a44
!	Mem[0000000010041400] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%l7 = ffffffffffffff00, Mem[0000000010101408] = 00000000
	stba	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	%l0 = 0000000000000000, Mem[00000000100c1414] = 000000aa
	stw	%l0,[%i3+0x014]		! Mem[00000000100c1414] = 00000000
!	Mem[0000000010001408] = 9c3d7efc, %l6 = 00000000b8107a44
	ldstuba	[%i0+%o4]0x88,%l6	! %l6 = 00000000000000fc
!	Mem[0000000010041410] = ffffffff, %l3 = 00000000000000ff
	ldstuba	[%i1+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%f18 = ff00ff00 00000000, Mem[0000000010081400] = 00000000 ff000000
	stda	%f18,[%i2+%g0]0x80	! Mem[0000000010081400] = ff00ff00 00000000
!	%l1 = 00000000b8107aff, Mem[0000000030101410] = 00000000
	stwa	%l1,[%i4+%o5]0x89	! Mem[0000000030101410] = b8107aff
!	%l6 = 00000000000000fc, Mem[0000000010101408] = 00000000
	stba	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = fc000000

p0_label_500:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (97)
!	Mem[000000001008142c] = 00000000, %l1 = 00000000b8107aff
	lduw	[%i2+0x02c],%l1		! %l1 = 0000000000000000
!	Mem[0000000030181410] = 000000ff, %f2  = ff00ff00
	lda	[%i6+%o5]0x89,%f2 	! %f2 = 000000ff
!	Mem[0000000030001400] = 00000000, %l0 = 0000000000000000
	lduwa	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1408] = ff10ffff, %l0 = 0000000000000000
	lduha	[%i3+%o4]0x80,%l0	! %l0 = 000000000000ff10
!	Mem[0000000010141408] = ff00000000000000, %l5 = 00000000ff000000
	ldxa	[%i5+%o4]0x80,%l5	! %l5 = ff00000000000000
!	Mem[0000000010001408] = 9c3d7eff, %l6 = 00000000000000fc
	ldswa	[%i0+%o4]0x88,%l6	! %l6 = ffffffff9c3d7eff
!	Mem[0000000010041408] = 00ff0018, %l5 = ff00000000000000
	lduwa	[%i1+%o4]0x80,%l5	! %l5 = 0000000000ff0018
!	Mem[00000000100c1400] = 00000000, %l4 = 0000000061d05459
	lduwa	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141420] = 0000006d, %l6 = ffffffff9c3d7eff, %asi = 80
	ldsha	[%i5+0x020]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041428] = 00000000, %l6 = 0000000000000000, %asi = 80
	lduba	[%i1+0x028]%asi,%l6	! %l6 = 0000000000000000

!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 000000000000ff10
	bne	%xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000000000000
	bne	%xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be fffffffffff4aa00
	bne	%xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 00000000000000ff
	bne	%xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000000000
	bne	%xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000000ff0018
	bne	%xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000000
	bne	%xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be ffffffffffffff00
	bne	%xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x00000000,%g2
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
	cmp	%l0,%l1			! %f0  should be ffffffff 00ff0038
	bne	%xcc,p0_freg_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 000000ff 00000000
	bne	%xcc,p0_freg_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be ff000000 ffffffff
	bne	%xcc,p0_freg_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 00000000 00000000
	bne	%xcc,p0_freg_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 80000000 0000ff00
	bne	%xcc,p0_freg_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 5954d061 00000000
	bne	%xcc,p0_freg_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be fc7e3d9c ffffffff
	bne	%xcc,p0_freg_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 3400ff00 00ff0018
	bne	%xcc,p0_freg_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 000000b8 00ffff00
	bne	%xcc,p0_freg_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be ff00ff00 00000000
	bne	%xcc,p0_freg_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be ff000000 ffffffff
	bne	%xcc,p0_freg_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 00000000 00000000
	bne	%xcc,p0_freg_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 00000000 0000ff00
	bne	%xcc,p0_freg_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 5954d061 00000000
	bne	%xcc,p0_freg_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be ffff0048 005a00ff
	bne	%xcc,p0_freg_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 00000000 00ff0018
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
	ldx	[%g1+0x000],%l0		! %l0 = 2ee1b759a0de199e
	ldx	[%g1+0x008],%l1		! %l1 = e50a515fb7b9f449
	ldx	[%g1+0x010],%l2		! %l2 = 625cd77828e46b04
	ldx	[%g1+0x018],%l3		! %l3 = b634bfdcfc5800cf
	ldx	[%g1+0x020],%l4		! %l4 = 8efbba452d83c8aa
	ldx	[%g1+0x028],%l5		! %l5 = d46ff0eed8666595
	ldx	[%g1+0x030],%l6		! %l6 = 5cf2e8ec37b90a90
	ldx	[%g1+0x038],%l7		! %l7 = f362335be72a7a9b

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
	andn	%l6,%l1,%l7
	mulx	%l6,0xf43,%l3
	fdivs	%f7 ,%f15,%f3 
	sub	%l6,0xac1,%l0
	subc	%l7,%l1,%l1
	jmpl	%o7,%g0
	ldsw	[%i5+0x00c],%l0		! Mem[000000001014140c]
p0_near_0_he:
	mulx	%l0,-0xfcd,%l2
	smul	%l6,0xd32,%l4
	mulx	%l2,0x189,%l1
	or	%l5,%l6,%l6
	jmpl	%o7,%g0
	mulx	%l7,%l7,%l2
p0_near_0_lo:
	andn	%l6,%l1,%l7
	mulx	%l6,0xf43,%l3
	fdivs	%f7 ,%f15,%f3 
	sub	%l6,0xac1,%l0
	subc	%l7,%l1,%l1
	jmpl	%o7,%g0
	ldsw	[%o5+0x00c],%l0		! Mem[000000001014140c]
p0_near_0_ho:
	mulx	%l0,-0xfcd,%l2
	smul	%l6,0xd32,%l4
	mulx	%l2,0x189,%l1
	or	%l5,%l6,%l6
	jmpl	%o7,%g0
	mulx	%l7,%l7,%l2
near0_b2b_h:
	mulx	%l3,-0xf7d,%l4
	mulx	%l5,%l0,%l2
	add	%l1,-0x634,%l4
	sub	%l5,-0x94a,%l1
	jmpl	%o7,%g0
	xor	%l3,0xba7,%l5
near0_b2b_l:
	xor	%l1,%l1,%l7
	and	%l4,0x11a,%l4
	addc	%l1,-0x757,%l7
	xnor	%l6,0xa5b,%l1
	jmpl	%o7,%g0
	fdivs	%f8 ,%f13,%f14
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
	fsqrts	%f15,%f12
	addc	%l5,%l4,%l6
	xnor	%l5,0x548,%l0
	xor	%l1,0x53e,%l2
	sub	%l3,%l6,%l5
	jmpl	%o7,%g0
	smul	%l3,-0x466,%l4
p0_near_1_he:
	sdivx	%l0,0x9ff,%l0
	jmpl	%o7,%g0
	fdivs	%f24,%f19,%f24
p0_near_1_lo:
	fsqrts	%f15,%f12
	addc	%l5,%l4,%l6
	xnor	%l5,0x548,%l0
	xor	%l1,0x53e,%l2
	sub	%l3,%l6,%l5
	jmpl	%o7,%g0
	smul	%l3,-0x466,%l4
p0_near_1_ho:
	sdivx	%l0,0x9ff,%l0
	jmpl	%o7,%g0
	fdivs	%f24,%f19,%f24
near1_b2b_h:
	fcmps	%fcc2,%f26,%f30
	jmpl	%o7,%g0
	xor	%l6,%l5,%l3
near1_b2b_l:
	sdivx	%l4,0xa09,%l3
	jmpl	%o7,%g0
	fdivs	%f15,%f4 ,%f11
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
	addc	%l5,%l2,%l1
	smul	%l5,-0x733,%l0
	or	%l5,%l7,%l3
	jmpl	%o7,%g0
	addc	%l1,-0x8fd,%l6
p0_near_2_he:
	fmuls	%f26,%f27,%f17
	mulx	%l2,%l4,%l7
	addc	%l5,%l6,%l5
	xor	%l6,%l6,%l4
	sub	%l1,%l1,%l7
	jmpl	%o7,%g0
	fdivs	%f23,%f26,%f30
p0_near_2_lo:
	addc	%l5,%l2,%l1
	smul	%l5,-0x733,%l0
	or	%l5,%l7,%l3
	jmpl	%o7,%g0
	addc	%l1,-0x8fd,%l6
p0_near_2_ho:
	fmuls	%f26,%f27,%f17
	mulx	%l2,%l4,%l7
	addc	%l5,%l6,%l5
	xor	%l6,%l6,%l4
	sub	%l1,%l1,%l7
	jmpl	%o7,%g0
	fdivs	%f23,%f26,%f30
near2_b2b_h:
	or	%l5,-0xc4a,%l5
	fmuls	%f21,%f25,%f18
	andn	%l3,-0x1a9,%l7
	jmpl	%o7,%g0
	xor	%l2,0x386,%l2
near2_b2b_l:
	fadds	%f8 ,%f2 ,%f8 
	andn	%l0,%l1,%l1
	add	%l4,%l2,%l2
	jmpl	%o7,%g0
	orn	%l6,%l6,%l2
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
	fsqrts	%f5 ,%f2 
	jmpl	%o7,%g0
	swap	[%i3+0x01c],%l5		! Mem[00000000100c141c]
p0_near_3_he:
	fadds	%f30,%f16,%f20
	umul	%l0,0x246,%l0
	xnor	%l3,0x984,%l0
	sth	%l4,[%i2+0x038]		! Mem[0000000010081438]
	subc	%l4,0xaa2,%l7
	jmpl	%o7,%g0
	subc	%l0,%l3,%l1
p0_near_3_lo:
	fsqrts	%f5 ,%f2 
	jmpl	%o7,%g0
	swap	[%o3+0x01c],%l5		! Mem[00000000100c141c]
p0_near_3_ho:
	fadds	%f30,%f16,%f20
	umul	%l0,0x246,%l0
	xnor	%l3,0x984,%l0
	sth	%l4,[%o2+0x038]		! Mem[0000000010081438]
	subc	%l4,0xaa2,%l7
	jmpl	%o7,%g0
	subc	%l0,%l3,%l1
near3_b2b_h:
	subc	%l2,%l3,%l4
	jmpl	%o7,%g0
	fcmps	%fcc0,%f29,%f18
near3_b2b_l:
	fdivs	%f13,%f6 ,%f15
	jmpl	%o7,%g0
	fsubs	%f12,%f11,%f0 
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
	mulx	%l1,%l4,%l2
	xor	%l3,%l5,%l0
	and	%l6,%l6,%l2
	addc	%l0,%l5,%l5
	jmpl	%o7,%g0
	smul	%l7,%l5,%l4
p0_far_0_he:
	xor	%l7,-0x448,%l4
	smul	%l0,%l7,%l3
	mulx	%l0,%l5,%l0
	jmpl	%o7,%g0
	mulx	%l4,%l5,%l4
p0_far_0_lo:
	mulx	%l1,%l4,%l2
	xor	%l3,%l5,%l0
	and	%l6,%l6,%l2
	addc	%l0,%l5,%l5
	jmpl	%o7,%g0
	smul	%l7,%l5,%l4
p0_far_0_ho:
	xor	%l7,-0x448,%l4
	smul	%l0,%l7,%l3
	mulx	%l0,%l5,%l0
	jmpl	%o7,%g0
	mulx	%l4,%l5,%l4
far0_b2b_h:
	xnor	%l4,%l3,%l7
	fmuls	%f28,%f16,%f23
	fcmps	%fcc1,%f24,%f22
	fdivs	%f30,%f31,%f20
	jmpl	%o7,%g0
	sub	%l3,%l1,%l6
far0_b2b_l:
	fcmps	%fcc0,%f6 ,%f15
	smul	%l6,0x2dd,%l7
	smul	%l6,%l7,%l5
	add	%l2,-0x38a,%l6
	jmpl	%o7,%g0
	and	%l4,0xb1e,%l2
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
	smul	%l1,0x63c,%l5
	xor	%l0,-0xc80,%l6
	orn	%l0,%l4,%l4
	fsqrts	%f15,%f4 
	jmpl	%o7,%g0
	xor	%l7,-0x95b,%l0
p0_far_1_he:
	fadds	%f16,%f19,%f19
	add	%l7,%l0,%l6
	jmpl	%o7,%g0
	or	%l0,-0xe28,%l3
p0_far_1_lo:
	smul	%l1,0x63c,%l5
	xor	%l0,-0xc80,%l6
	orn	%l0,%l4,%l4
	fsqrts	%f15,%f4 
	jmpl	%o7,%g0
	xor	%l7,-0x95b,%l0
p0_far_1_ho:
	fadds	%f16,%f19,%f19
	add	%l7,%l0,%l6
	jmpl	%o7,%g0
	or	%l0,-0xe28,%l3
far1_b2b_h:
	and	%l3,%l6,%l6
	smul	%l0,0x597,%l6
	add	%l7,-0x0f9,%l6
	sdivx	%l4,%l7,%l7
	jmpl	%o7,%g0
	fmuls	%f26,%f29,%f30
far1_b2b_l:
	addc	%l4,%l0,%l4
	addc	%l4,%l7,%l6
	smul	%l3,%l0,%l6
	fdivs	%f3 ,%f12,%f4 
	jmpl	%o7,%g0
	or	%l4,0x6a0,%l2
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
	sth	%l6,[%i4+0x014]		! Mem[0000000010101414]
	mulx	%l6,%l7,%l0
	sth	%l6,[%o1+0x040]		! Mem[0000000020800040]
	umul	%l2,0xeff,%l0
	jmpl	%o7,%g0
	fadds	%f6 ,%f2 ,%f10
p0_far_2_he:
	orn	%l5,%l3,%l6
	fdivs	%f29,%f22,%f22
	addc	%l0,%l6,%l3
	fadds	%f31,%f16,%f17
	addc	%l6,%l3,%l1
	jmpl	%o7,%g0
	or	%l6,%l0,%l5
p0_far_2_lo:
	sth	%l6,[%o4+0x014]		! Mem[0000000010101414]
	mulx	%l6,%l7,%l0
	sth	%l6,[%i1+0x040]		! Mem[0000000020800040]
	umul	%l2,0xeff,%l0
	jmpl	%o7,%g0
	fadds	%f6 ,%f2 ,%f10
p0_far_2_ho:
	orn	%l5,%l3,%l6
	fdivs	%f29,%f22,%f22
	addc	%l0,%l6,%l3
	fadds	%f31,%f16,%f17
	addc	%l6,%l3,%l1
	jmpl	%o7,%g0
	or	%l6,%l0,%l5
far2_b2b_h:
	udivx	%l1,%l5,%l6
	fcmps	%fcc0,%f23,%f17
	fsubs	%f30,%f30,%f25
	sub	%l0,-0xb65,%l2
	fsqrts	%f25,%f31
	jmpl	%o7,%g0
	andn	%l5,0x143,%l4
far2_b2b_l:
	subc	%l1,0xff3,%l6
	fmuls	%f11,%f15,%f4 
	nop
	fdivs	%f0 ,%f7 ,%f10
	xnor	%l7,0xa81,%l1
	jmpl	%o7,%g0
	and	%l5,-0xbd9,%l1
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
	jmpl	%o7,%g0
	mulx	%l6,%l7,%l4
	jmpl	%o7,%g0
	nop
p0_far_3_he:
	fmuls	%f28,%f24,%f26
	xnor	%l1,-0x5ba,%l5
	fsubs	%f25,%f22,%f24
	ldub	[%i1+0x00e],%l1		! Mem[000000001004140e]
	sth	%l6,[%o3+0x1c0]		! Mem[00000000218001c0]
	fadds	%f17,%f27,%f31
	jmpl	%o7,%g0
	smul	%l5,%l1,%l0
p0_far_3_lo:
	jmpl	%o7,%g0
	mulx	%l6,%l7,%l4
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
p0_far_3_ho:
	fmuls	%f28,%f24,%f26
	xnor	%l1,-0x5ba,%l5
	fsubs	%f25,%f22,%f24
	ldub	[%o1+0x00e],%l1		! Mem[000000001004140e]
	sth	%l6,[%i3+0x1c0]		! Mem[00000000218001c0]
	fadds	%f17,%f27,%f31
	jmpl	%o7,%g0
	smul	%l5,%l1,%l0
far3_b2b_h:
	and	%l0,-0xcf1,%l4
	smul	%l1,0x946,%l3
	fmuls	%f27,%f24,%f17
	jmpl	%o7,%g0
	andn	%l4,0x8ed,%l2
far3_b2b_l:
	fmuls	%f4 ,%f15,%f11
	addc	%l0,%l2,%l4
	sdivx	%l7,0x0b6,%l3
	jmpl	%o7,%g0
	umul	%l7,-0xa40,%l5
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	.skip	16
p0_jmpl_0_le:
	fmuls	%f14,%f15,%f9 
	smul	%l7,-0x14d,%l6
	lduw	[%i2+0x01c],%l1		! Mem[000000001008141c]
	orn	%l0,0x69a,%l7
	mulx	%l2,-0x411,%l6
	jmpl	%g6+8,%g0
	smul	%l1,0xb8b,%l2
p0_call_0_le:
	fadds	%f11,%f1 ,%f7 
	fadds	%f6 ,%f7 ,%f6 
	xnor	%l3,%l5,%l1
	retl
	sub	%l4,%l4,%l6
p0_jmpl_0_lo:
	fmuls	%f14,%f15,%f9 
	smul	%l7,-0x14d,%l6
	lduw	[%o2+0x01c],%l1		! Mem[000000001008141c]
	orn	%l0,0x69a,%l7
	mulx	%l2,-0x411,%l6
	jmpl	%g6+8,%g0
	smul	%l1,0xb8b,%l2
p0_call_0_lo:
	fadds	%f11,%f1 ,%f7 
	fadds	%f6 ,%f7 ,%f6 
	xnor	%l3,%l5,%l1
	retl
	sub	%l4,%l4,%l6
p0_jmpl_0_he:
	smul	%l2,-0x510,%l5
	subc	%l4,%l2,%l6
	xnor	%l0,%l5,%l1
	sdivx	%l2,%l3,%l3
	jmpl	%g6+8,%g0
	fsubs	%f26,%f26,%f16
p0_call_0_he:
	fadds	%f31,%f28,%f29
	retl
	fdivs	%f22,%f28,%f31
p0_jmpl_0_ho:
	smul	%l2,-0x510,%l5
	subc	%l4,%l2,%l6
	xnor	%l0,%l5,%l1
	sdivx	%l2,%l3,%l3
	jmpl	%g6+8,%g0
	fsubs	%f26,%f26,%f16
p0_call_0_ho:
	fadds	%f31,%f28,%f29
	retl
	fdivs	%f22,%f28,%f31
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	.skip	32
p0_jmpl_1_le:
	ldsh	[%i4+0x00c],%l1		! Mem[000000001010140c]
	ldstub	[%o0+0x001],%l3		! Mem[00000000201c0001]
	udivx	%l4,0x16e,%l2
	fdivs	%f8 ,%f12,%f3 
	mulx	%l6,0xbbe,%l5
	smul	%l1,0x942,%l1
	fsqrts	%f11,%f2 
	jmpl	%g6+8,%g0
	add	%l3,%l0,%l2
p0_call_1_le:
	xnor	%l2,%l1,%l2
	fdtos	%f4 ,%f11
	addc	%l4,%l1,%l5
	andn	%l3,%l0,%l0
	retl
	fmuls	%f6 ,%f1 ,%f13
p0_jmpl_1_lo:
	ldsh	[%o4+0x00c],%l1		! Mem[000000001010140c]
	ldstub	[%i0+0x001],%l3		! Mem[00000000201c0001]
	udivx	%l4,0x16e,%l2
	fdivs	%f8 ,%f12,%f3 
	mulx	%l6,0xbbe,%l5
	smul	%l1,0x942,%l1
	fsqrts	%f11,%f2 
	jmpl	%g6+8,%g0
	add	%l3,%l0,%l2
p0_call_1_lo:
	xnor	%l2,%l1,%l2
	fdtos	%f4 ,%f11
	addc	%l4,%l1,%l5
	andn	%l3,%l0,%l0
	retl
	fmuls	%f6 ,%f1 ,%f13
p0_jmpl_1_he:
	fdivs	%f26,%f24,%f28
	andn	%l0,%l5,%l3
	sth	%l5,[%i6+0x008]		! Mem[0000000010181408]
	and	%l1,%l5,%l4
	orn	%l2,%l3,%l4
	fsqrts	%f31,%f25
	jmpl	%g6+8,%g0
	fcmps	%fcc0,%f31,%f29
p0_call_1_he:
	andn	%l2,%l3,%l1
	ldd	[%i2+0x000],%f18	! Mem[0000000010081400]
	or	%l3,%l6,%l1
	retl
	ldub	[%o3+0x041],%l3		! Mem[0000000021800041]
p0_jmpl_1_ho:
	fdivs	%f26,%f24,%f28
	andn	%l0,%l5,%l3
	sth	%l5,[%o6+0x008]		! Mem[0000000010181408]
	and	%l1,%l5,%l4
	orn	%l2,%l3,%l4
	fsqrts	%f31,%f25
	jmpl	%g6+8,%g0
	fcmps	%fcc0,%f31,%f29
p0_call_1_ho:
	andn	%l2,%l3,%l1
	ldd	[%o2+0x000],%f18	! Mem[0000000010081400]
	or	%l3,%l6,%l1
	retl
	ldub	[%i3+0x041],%l3		! Mem[0000000021800041]
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	.skip	48
p0_jmpl_2_le:
	addc	%l3,0xef9,%l4
	fcmps	%fcc0,%f4 ,%f5 
	fdivs	%f3 ,%f15,%f12
	fdivs	%f5 ,%f7 ,%f12
	orn	%l5,%l6,%l4
	mulx	%l7,-0xcd2,%l1
	fsubs	%f0 ,%f15,%f0 
	jmpl	%g6+8,%g0
	andn	%l4,-0x150,%l6
p0_call_2_le:
	xnor	%l3,-0x094,%l7
	mulx	%l3,%l7,%l0
	xnor	%l0,%l0,%l3
	fdivs	%f9 ,%f4 ,%f7 
	retl
	subc	%l2,-0x514,%l3
p0_jmpl_2_lo:
	addc	%l3,0xef9,%l4
	fcmps	%fcc0,%f4 ,%f5 
	fdivs	%f3 ,%f15,%f12
	fdivs	%f5 ,%f7 ,%f12
	orn	%l5,%l6,%l4
	mulx	%l7,-0xcd2,%l1
	fsubs	%f0 ,%f15,%f0 
	jmpl	%g6+8,%g0
	andn	%l4,-0x150,%l6
p0_call_2_lo:
	xnor	%l3,-0x094,%l7
	mulx	%l3,%l7,%l0
	xnor	%l0,%l0,%l3
	fdivs	%f9 ,%f4 ,%f7 
	retl
	subc	%l2,-0x514,%l3
p0_jmpl_2_he:
	fcmps	%fcc1,%f16,%f19
	sub	%l7,-0x32a,%l1
	andn	%l7,-0x5b4,%l6
	subc	%l7,-0xfd1,%l2
	jmpl	%g6+8,%g0
	and	%l7,%l3,%l7
p0_call_2_he:
	sub	%l7,0xe29,%l3
	smul	%l2,%l7,%l2
	umul	%l4,%l7,%l6
	retl
	umul	%l1,0x027,%l2
p0_jmpl_2_ho:
	fcmps	%fcc1,%f16,%f19
	sub	%l7,-0x32a,%l1
	andn	%l7,-0x5b4,%l6
	subc	%l7,-0xfd1,%l2
	jmpl	%g6+8,%g0
	and	%l7,%l3,%l7
p0_call_2_ho:
	sub	%l7,0xe29,%l3
	smul	%l2,%l7,%l2
	umul	%l4,%l7,%l6
	retl
	umul	%l1,0x027,%l2
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	.skip	64
p0_jmpl_3_le:
	subc	%l1,%l3,%l2
	fsqrts	%f0 ,%f7 
	fdivs	%f0 ,%f10,%f11
	umul	%l3,0x3d1,%l5
	fdtos	%f4 ,%f4 
	jmpl	%g6+8,%g0
	subc	%l7,%l5,%l3
p0_call_3_le:
	fadds	%f0 ,%f12,%f1 
	or	%l0,0x662,%l0
	sdivx	%l7,0x55f,%l1
	xor	%l6,%l0,%l6
	fstoi	%f15,%f10
	add	%l6,%l5,%l3
	fadds	%f13,%f12,%f11
	retl
	fdivs	%f1 ,%f6 ,%f8 
p0_jmpl_3_lo:
	subc	%l1,%l3,%l2
	fsqrts	%f0 ,%f7 
	fdivs	%f0 ,%f10,%f11
	umul	%l3,0x3d1,%l5
	fdtos	%f4 ,%f4 
	jmpl	%g6+8,%g0
	subc	%l7,%l5,%l3
p0_call_3_lo:
	fadds	%f0 ,%f12,%f1 
	or	%l0,0x662,%l0
	sdivx	%l7,0x55f,%l1
	xor	%l6,%l0,%l6
	fstoi	%f15,%f10
	add	%l6,%l5,%l3
	fadds	%f13,%f12,%f11
	retl
	fdivs	%f1 ,%f6 ,%f8 
p0_jmpl_3_he:
	jmpl	%g6+8,%g0
	fdivs	%f23,%f31,%f21
p0_call_3_he:
	umul	%l7,%l1,%l6
	umul	%l4,0x1ba,%l3
	umul	%l4,-0x522,%l7
	and	%l3,0x341,%l2
	fsubs	%f25,%f17,%f17
	fdivs	%f22,%f31,%f16
	retl
	mulx	%l0,-0xa48,%l1
p0_jmpl_3_ho:
	jmpl	%g6+8,%g0
	fdivs	%f23,%f31,%f21
p0_call_3_ho:
	umul	%l7,%l1,%l6
	umul	%l4,0x1ba,%l3
	umul	%l4,-0x522,%l7
	and	%l3,0x341,%l2
	fsubs	%f25,%f17,%f17
	fdivs	%f22,%f31,%f16
	retl
	mulx	%l0,-0xa48,%l1
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
	.word	0x2ee1b759,0xa0de199e		! Init value for %l0
	.word	0xe50a515f,0xb7b9f449		! Init value for %l1
	.word	0x625cd778,0x28e46b04		! Init value for %l2
	.word	0xb634bfdc,0xfc5800cf		! Init value for %l3
	.word	0x8efbba45,0x2d83c8aa		! Init value for %l4
	.word	0xd46ff0ee,0xd8666595		! Init value for %l5
	.word	0x5cf2e8ec,0x37b90a90		! Init value for %l6
	.word	0xf362335b,0xe72a7a9b		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x46b9eeb0,0x2626c601		! Init value for %f0 
	.word	0x6999f96e,0x775fd707		! Init value for %f2 
	.word	0x67936a9c,0x2b71eebd		! Init value for %f4 
	.word	0x2505d9ba,0x205996a3		! Init value for %f6 
	.word	0x6557ba48,0x73054439		! Init value for %f8 
	.word	0x24f63bc6,0x1fe9b8ff		! Init value for %f10
	.word	0x7f5c29b4,0x4f216275		! Init value for %f12
	.word	0x5f97cb92,0x25aeba1b		! Init value for %f14
	.word	0x0f87c4e0,0x5c39a571		! Init value for %f16
	.word	0x4dc6f51e,0x485fd5f7		! Init value for %f18
	.word	0x53ff57cc,0x2870292d		! Init value for %f20
	.word	0x171be46a,0x0a290893		! Init value for %f22
	.word	0x78916e78,0x43d1c9a9		! Init value for %f24
	.word	0x0bb68576,0x5bc70def		! Init value for %f26
	.word	0x6be254e4,0x155222e5		! Init value for %f28
	.word	0x57ca8442,0x5a63620b		! Init value for %f30
	.word	0x4c581710,0x108790e1		! Init value for %f32
	.word	0x1ceb4cce,0x443040e7		! Init value for %f34
	.word	0x78c680fc,0x28272f9d		! Init value for %f36
	.word	0x5d180b1a,0x5fc4a683		! Init value for %f38
	.word	0x10db1ea8,0x1940db19		! Init value for %f40
	.word	0x6387ab26,0x52384edf		! Init value for %f42
	.word	0x71493c14,0x6b3b2f55		! Init value for %f44
	.word	0x1734d8f2,0x1fffb5fb		! Init value for %f46
	.word	0x77b5e540,0x408f8851
	.word	0x632a007e,0x548817d7
	.word	0x1a63e62c,0x5446020d
	.word	0x208d4dca,0x0c937073
	.word	0x1f9fcad8,0x40317889
	.word	0x2e6cacd6,0x5f547bcf
	.word	0x00ebdf44,0x67eb87c5
	.word	0x2349c9a2,0x624ab5eb
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
	.word	0x00000000,0x0000ff10		! %l0
	.word	0x00000000,0x00000000		! %l1
	.word	0xffffffff,0xfff4aa00		! %l2
	.word	0x00000000,0x000000ff		! %l3
	.word	0x00000000,0x00000000		! %l4
	.word	0x00000000,0x00ff0018		! %l5
	.word	0x00000000,0x00000000		! %l6
	.word	0xffffffff,0xffffff00		! %l7
p0_expected_fp_regs:
	.word	0xffffffff,0x00ff0038		! %f0
	.word	0x000000ff,0x00000000		! %f2
	.word	0xff000000,0xffffffff		! %f4
	.word	0x00000000,0x00000000		! %f6
	.word	0x80000000,0x0000ff00		! %f8
	.word	0x5954d061,0x00000000		! %f10
	.word	0xfc7e3d9c,0xffffffff		! %f12
	.word	0x3400ff00,0x00ff0018		! %f14
	.word	0x000000b8,0x00ffff00		! %f16
	.word	0xff00ff00,0x00000000		! %f18
	.word	0xff000000,0xffffffff		! %f20
	.word	0x00000000,0x00000000		! %f22
	.word	0x00000000,0x0000ff00		! %f24
	.word	0x5954d061,0x00000000		! %f26
	.word	0xffff0048,0x005a00ff		! %f28
	.word	0x00000000,0x00ff0018		! %f30
	.word	0x00000024,0x00000fe0		! %fsr
p0_local0_expect:
	.word	0x0000ffff,0xff000000,0xff7e3d9c,0xffffffff ! PA = 0000000010001400
	.word	0xffffbcff,0x0000ff00,0xb8107a44,0x000000ff ! PA = 0000000010001410
	.word	0xff000000,0xff54d061,0xc0ffe020,0x00000000 ! PA = 0000000010001420
	.word	0xffff00ff,0xa2adf0ef,0xaa000000,0x00000000 ! PA = 0000000010001430
p0_local0_sec_expect:
	.word	0x00000000,0xffbcffff,0x00000000,0xffb80000 ! PA = 0000000030001400
	.word	0x00000000,0xb8107aff,0x00000000,0x5b85c0ff ! PA = 0000000030001410
	.word	0xbf1cd140,0xb6735aa5,0x0000ffff,0x6d000000 ! PA = 0000000030001420
	.word	0xff000000,0x00000080,0x00000000,0xffff0000 ! PA = 0000000030001430
!	Scratch Area for Non-Transactional Memory Stores
	.word	0x5a2be5be,0x83e6d70f,0x65945f62,0x7fcef97b
	.word	0xee55f726,0x036c8247,0x4902660a,0x703ffc73
	.word	0xe4016d0e,0x143f0aff,0x0d131532,0x8cb328eb
	.word	0xc1f3ef76,0xe33e6937,0x41b354da,0xfbb636e3
p0_local1_expect:
	.word	0xff000000,0x00000000,0x00ff0018,0xffffff00 ! PA = 0000000010041400
	.word	0xffffffff,0x0000ffff,0x00000000,0x00000000 ! PA = 0000000010041410
	.word	0xffffffff,0x00000000,0x00000000,0x61d05459 ! PA = 0000000010041420
	.word	0xffff5a00,0x4800ffff,0x1800ff00,0x00ff0034 ! PA = 0000000010041430
p0_local1_sec_expect:
	.word	0x00000000,0x00000000,0x00ffff00,0x00000000 ! PA = 0000000030041400
	.word	0x00000000,0x0000ff00,0x0000f9f4,0xff1ffcff ! PA = 0000000030041410
	.word	0x79647692,0xa7f4d91b,0x303020bf,0x00000000 ! PA = 0000000030041420
	.word	0xffd25dff,0x00000000,0xcf14ffa0,0xffffa0ff ! PA = 0000000030041430
p0_local2_expect:
	.word	0xff00ff00,0x00000000,0x00ffffff,0x00000000 ! PA = 0000000010081400
	.word	0x000000ff,0x00000000,0x00000000,0x00000000 ! PA = 0000000010081410
	.word	0x00000000,0x0000ff00,0x5954d061,0x00000000 ! PA = 0000000010081420
	.word	0xffff0048,0x005a00ff,0x3400ff00,0x00ff0018 ! PA = 0000000010081430
p0_local2_sec_expect:
	.word	0x3800ff00,0xffffffff,0x00000000,0x00ff00ff ! PA = 0000000030081400
	.word	0xffffffff,0x000000ff,0x00000000,0x00000000 ! PA = 0000000030081410
	.word	0x00ff0000,0x00000080,0x00000000,0x61d05459 ! PA = 0000000030081420
	.word	0xffffffff,0x9c3d7efc,0x1800ff00,0x00ff0034 ! PA = 0000000030081430
p0_local3_expect:
	.word	0x00000000,0x61d05459,0xff10ffff,0x00ff00ff ! PA = 00000000100c1400
	.word	0xffff0000,0x00000000,0xff000000,0x48000000 ! PA = 00000000100c1410
	.word	0x61d0ffff,0x00940000,0xffe0ffff,0x48ba57e5 ! PA = 00000000100c1420
	.word	0x00ff0000,0xffffffff,0x00000000,0xaf0a9706 ! PA = 00000000100c1430
p0_local3_sec_expect:
	.word	0xb8000000,0x00000000,0x00ffff00,0x00000000 ! PA = 00000000300c1400
	.word	0xffffffff,0x00000040,0xcc000000,0x00000000 ! PA = 00000000300c1410
	.word	0xaf00d061,0x00000080,0x5954d061,0x6d2224a7 ! PA = 00000000300c1420
	.word	0xff000000,0x1f420000,0x3400ffff,0x00000000 ! PA = 00000000300c1430
p0_local4_expect:
	.word	0xff00f4ff,0x00ff0000,0xfc000000,0x0000ff00 ! PA = 0000000010101400
	.word	0x00000000,0x00000000,0x00ff0048,0x00000000 ! PA = 0000000010101410
	.word	0x000000a7,0xffffffff,0xffb80000,0xdb00ffff ! PA = 0000000010101420
	.word	0xffffff38,0x00000000,0x1bfff4ff,0x00ff0000 ! PA = 0000000010101430
p0_local4_sec_expect:
	.word	0x9c3d7efc,0xe72f2fdf,0x00000000,0x00ff00ff ! PA = 0000000030101400
	.word	0xff7a10b8,0x0000ff00,0x00000000,0x00000000 ! PA = 0000000030101410
	.word	0x00ff0000,0x00000000,0x00000000,0x61d05459 ! PA = 0000000030101420
	.word	0xff005a00,0x4800ffff,0x1800ff00,0x00ff0034 ! PA = 0000000030101430
p0_local5_expect:
	.word	0xff000000,0x00000000,0xff000000,0x00000000 ! PA = 0000000010141400
	.word	0x00000000,0x000000ff,0x0000bcff,0x00000000 ! PA = 0000000010141410
	.word	0x0000006d,0x000000ff,0x7f800000,0xffffffff ! PA = 0000000010141420
	.word	0xffffffff,0x00000048,0x000000ff,0x00ff00ff ! PA = 0000000010141430
p0_local5_sec_expect:
	.word	0x00000000,0x000000ff,0x00000000,0x00000000 ! PA = 0000000030141400
	.word	0x00000000,0xb6735aa5,0x93000000,0x00000000 ! PA = 0000000030141410
	.word	0xff000000,0x6d000000,0x00ff0000,0xc7000000 ! PA = 0000000030141420
	.word	0xcc000000,0x005a00ff,0xff00ff00,0x00000000 ! PA = 0000000030141430
p0_local6_expect:
	.word	0xff000000,0xffffffff,0x00aaf4ff,0x00ff0000 ! PA = 0000000010181400
	.word	0x00000000,0x00000000,0xff000000,0x00000000 ! PA = 0000000010181410
	.word	0xa55a73b6,0xffd11cbf,0x0080ec95,0x00000000 ! PA = 0000000010181420
	.word	0x00000000,0x000000ff,0xffffffff,0x00ff0038 ! PA = 0000000010181430
p0_local6_sec_expect:
	.word	0x000000b8,0xffffffff,0xff000000,0x7f800000 ! PA = 0000000030181400
	.word	0xff000000,0x000000ff,0x00000000,0x00000000 ! PA = 0000000030181410
	.word	0xffffffff,0x00000000,0x00000000,0x61d05459 ! PA = 0000000030181420
	.word	0xff005a00,0x4800ffff,0x1800ff00,0x00ff0034 ! PA = 0000000030181430
share0_expect:
	.word	0xffff1a10,0x2894a7e1,0x7529a7ce,0x2e404fe7 ! PA = 00000000201c0000
	.word	0x38c0f3fc,0x6293f69d,0x26a9561a,0x7d45e583 ! PA = 00000000201c0010
	.word	0x760401a8,0x0c5c5219,0x1e1ee626,0x3831bddf ! PA = 00000000201c0020
	.word	0x6c2b8f14,0x72845655,0x74f503f2,0x062854fb ! PA = 00000000201c0030
share1_expect:
	.word	0xff00a840,0x43b55f51,0x13a61b7e,0x5446e6d7 ! PA = 0000000020800000
	.word	0x1d1a192c,0x3e27890d,0x0bc858ca,0x0fff6f73 ! PA = 0000000020800010
	.word	0x01506dd8,0x25ddaf89,0x1fd9a7d6,0x4034aacf ! PA = 0000000020800020
	.word	0x6be1f244,0x5fa16ec5,0x64cbb4a2,0x391614eb ! PA = 0000000020800030
	.word	0xffffb270,0x4cbf22c1,0x294feb2e,0x66bbe9c7 ! PA = 0000000020800040
	.word	0x5a347a5c,0x4381e77d,0x0ee3777a,0x6a832563 ! PA = 0000000020800050
	.word	0x66f2d608,0x406f98f9,0x009b4586,0x072983bf ! PA = 0000000020800060
	.word	0x249f1174,0x2c44d335,0x73b00152,0x17a980db ! PA = 0000000020800070
share2_expect:
	.word	0xffff38a0,0x52b0f231,0x1dca16de,0x0cd658b7 ! PA = 00000000211c0000
	.word	0x0c0b178c,0x65d211ed,0x0d0db22a,0x2db80753 ! PA = 00000000211c0010
	.word	0x07d63a38,0x2a710e69,0x4de6bf36,0x16a748af ! PA = 00000000211c0020
	.word	0x0f3deca4,0x28fd83a5,0x0a94ea02,0x332998cb ! PA = 00000000211c0030
share3_expect:
	.word	0x2cff3ad0,0x7f49cda1,0x50779e8e,0x2e8d33a7 ! PA = 0000000021800000
	.word	0x1458f0bc,0x2f07085d,0x671a08da,0x17451543 ! PA = 0000000021800010
	.word	0x76a59a68,0x05010fd9,0x64ff14e6,0x3104f99f ! PA = 0000000021800020
	.word	0x025983d4,0x751a8015,0x6e2d6eb2,0x319d5cbb ! PA = 0000000021800030
	.word	0xff43b900,0x0708b511,0x487b823e,0x64977a97 ! PA = 0000000021800040
	.word	0x4a9905ec,0x2fcfcacd,0x319b7b8a,0x71914f33 ! PA = 0000000021800050
	.word	0x27cbf698,0x33fe9d49,0x22e74696,0x4159968f ! PA = 0000000021800060
	.word	0x624cd704,0x6eaac885,0x6eec8f62,0x3dcbccab ! PA = 0000000021800070
	.word	0x1b27b330,0x192ca881,0x64b8c1ee,0x686c2d87 ! PA = 0000000021800080
	.word	0x2c06571c,0x6f9b593d,0x64e50a3a,0x03c3b523 ! PA = 0000000021800090
	.word	0x21744ec8,0x4e08b6b9,0x14625446,0x4b7c1f7f ! PA = 00000000218000a0
	.word	0x5132e634,0x227d5cf5,0x19054c12,0x773be89b ! PA = 00000000218000b0
	.word	0xffff2960,0x4fb4a7f1,0x0bd25d9e,0x04424c77 ! PA = 00000000218000c0
	.word	0x0b9be44c,0x5c98b3ad,0x0d09b4ea,0x01c34713 ! PA = 00000000218000d0
	.word	0x2b89a2f8,0x0c7e5c29,0x25f33df6,0x5c03946f ! PA = 00000000218000e0
	.word	0x5ee6b164,0x3c213d65,0x646aa4c2,0x6234b08b ! PA = 00000000218000f0
	.word	0x00ff1b90,0x1f5fb361,0x5c2b554e,0x0310d767 ! PA = 0000000021800100
	.word	0x4214ad7c,0x3bb6da1d,0x79dc7b9a,0x7c370503 ! PA = 0000000021800110
	.word	0x7fb6f328,0x3b7e8d99,0x53dd03a6,0x7846f55f ! PA = 0000000021800120
	.word	0x39033894,0x75e569d5,0x64cf9972,0x57bd247b ! PA = 0000000021800130
	.word	0xff3689c0,0x47accad1,0x5be6a8fe,0x208ece57 ! PA = 0000000021800140
	.word	0x5debb2ac,0x18a4cc8d,0x6ef05e4a,0x5085eef3 ! PA = 0000000021800150
	.word	0x79673f58,0x29e84b09,0x5a22a556,0x0e5d424f ! PA = 0000000021800160
	.word	0x5ae37bc4,0x08d8e245,0x79a72a22,0x759c446b ! PA = 0000000021800170
	.word	0xffff73f0,0x42daee41,0x28e758ae,0x79333147 ! PA = 0000000021800180
	.word	0x535bf3dc,0x35d18afd,0x53985cfa,0x18d704e3 ! PA = 0000000021800190
	.word	0x45c58788,0x195a9479,0x64872306,0x651d7b3f ! PA = 00000000218001a0
	.word	0x3da27af4,0x1ccaa6b5,0x7e2456d2,0x0e59105b ! PA = 00000000218001b0
	.word	0x00ffda20,0x35e91db1,0x28d0645e,0x7a350037 ! PA = 00000000218001c0
	.word	0x2c60710c,0x7c6c156d,0x62e777aa,0x1c1146d3 ! PA = 00000000218001d0
	.word	0x13bccbb8,0x2e3469e9,0x3e8d7cb6,0x0c1ea02f ! PA = 00000000218001e0
	.word	0x081b3624,0x3849b725,0x793a1f82,0x193a884b ! PA = 00000000218001f0
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
	.word	0x45ec2f70,0x24908bc1,0x4466102e,0x43de5ac7	! PA = 0000000010001400
	.word	0x6312875c,0x0d3ba07d,0x2eceac7a,0x38bc6663	! PA = 0000000010001410
	.word	0x680a7308,0x7842a1f9,0x5e288a86,0x37f294bf	! PA = 0000000010001420
	.word	0x09e53e74,0x11322c35,0x7d3c5652,0x41cb61db	! PA = 0000000010001430
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
	.word	0x5505f5a0,0x1f899b31,0x2c427bde,0x2d6a09b7	! PA = 0000000030001400
	.word	0x12cd648c,0x5a370aed,0x28ef272a,0x39268853	! PA = 0000000030001410
	.word	0x2f061738,0x63d35769,0x043e4436,0x59a999af	! PA = 0000000030001420
	.word	0x291059a4,0x4b9e1ca5,0x51ff7f02,0x03c8b9cb	! PA = 0000000030001430
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
	.word	0x5cce37d0,0x2f39b6a1,0x7e22438e,0x6d2224a7	! PA = 0000000010041400
	.word	0x2f4f7dbc,0x5927415d,0x33c1bdda,0x7f78d643	! PA = 0000000010041410
	.word	0x6b3db768,0x780298d9,0x01f0d9e6,0x7ad08a9f	! PA = 0000000010041420
	.word	0x590830d4,0x4a7e5915,0x2a4643b2,0x0249bdbb	! PA = 0000000010041430
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
	.word	0x5ecff600,0x5c1fde11,0x4528673e,0x0fbdab97	! PA = 0000000030041400
	.word	0x3413d2ec,0x2ebb43cd,0x27d9708a,0x0a1a5033	! PA = 0000000030041410
	.word	0x751c5398,0x6caf6649,0x38434b96,0x7a7e678f	! PA = 0000000030041420
	.word	0x2227c404,0x7fe1e185,0x1a83a462,0x1c156dab	! PA = 0000000030041430
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
	.word	0x56563030,0x297b1181,0x6437e6ee,0x42b39e87	! PA = 0000000010081400
	.word	0x4255641c,0x7662123d,0x41893f3a,0x5431f623	! PA = 0000000010081410
	.word	0x36ccebc8,0x2c78bfb9,0x37f89946,0x508a307f	! PA = 0000000010081420
	.word	0x4a8a1334,0x0c97b5f5,0x72eaa112,0x24b2c99b	! PA = 0000000010081430
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
	.word	0x686be660,0x054a50f1,0x45f3c29e,0x443afd77	! PA = 0000000030081400
	.word	0x510f314c,0x324aacad,0x50e429ea,0x45a6c813	! PA = 0000000030081410
	.word	0x5c3a7ff8,0x44bda529,0x7193c2f6,0x7d8ae56f	! PA = 0000000030081420
	.word	0x060a1e64,0x302ed665,0x6f6e39c2,0x5468d18b	! PA = 0000000030081430
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
	.word	0x13dc1890,0x384c9c61,0x0cbefa4e,0x534ac867	! PA = 00000000100c1400
	.word	0x5cfc3a7c,0x3b64131d,0x69bd309a,0x231fc603	! PA = 00000000100c1410
	.word	0x03101028,0x559d1699,0x6557c8a6,0x7ad7865f	! PA = 00000000100c1420
	.word	0x2642e594,0x38f642d5,0x67c16e72,0x383e857b	! PA = 00000000100c1430
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
	.word	0x6131c6c0,0x5600f3d1,0x42bc8dfe,0x1f99ff57	! PA = 00000000300c1400
	.word	0x18977fac,0x315d458d,0x13a7534a,0x7e03eff3	! PA = 00000000300c1410
	.word	0x6ab89c58,0x01f61409,0x5347aa56,0x2a87134f	! PA = 00000000300c1420
	.word	0x4a8f68c4,0x73fcfb45,0x7f573f22,0x21fae56b	! PA = 00000000300c1430
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
	.word	0x12b7f0f0,0x2ca65741,0x09cf7dae,0x399fa247	! PA = 0000000010101400
	.word	0x1c1c00dc,0x6aa543fd,0x79f591fa,0x247a45e3	! PA = 0000000010101410
	.word	0x245f2488,0x5f679d79,0x6b266806,0x47708c3f	! PA = 0000000010101420
	.word	0x100aa7f4,0x1d11ffb5,0x5562abd2,0x1824f15b	! PA = 0000000010101430
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
	.word	0x54799720,0x353bc6b1,0x4b9ac95e,0x0292b137	! PA = 0000000030101400
	.word	0x1584be0c,0x646b0e6d,0x1bbaecaa,0x1169c7d3	! PA = 0000000030101410
	.word	0x42eea8b8,0x6650b2e9,0x7c7701b6,0x552af12f	! PA = 0000000030101420
	.word	0x418fa324,0x4ec45025,0x34d6b482,0x4603a94b	! PA = 0000000030101430
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
	.word	0x6c41b950,0x03804221,0x6981710e,0x1c6a2c27	! PA = 0000000010141400
	.word	0x788cb73c,0x329da4dd,0x7bca635a,0x5c7975c3	! PA = 0000000010141410
	.word	0x0b1228e8,0x61d05459,0x267c7766,0x100d421f	! PA = 0000000010141420
	.word	0x07b95a54,0x7262ec95,0x44665932,0x6b9e0d3b	! PA = 0000000010141430
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
	.word	0x699b5780,0x35f2c991,0x6ca674be,0x59dd1317	! PA = 0000000030141400
	.word	0x2eaeec6c,0x6fec074d,0x50b6f60a,0x2a104fb3	! PA = 0000000030141410
	.word	0x2334a518,0x5fc581c9,0x0839c916,0x5d2e7f0f	! PA = 0000000030141420
	.word	0x18e2cd84,0x2ffcd505,0x368499e2,0x4dbb1d2b	! PA = 0000000030141430
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
	.word	0x55d171b0,0x65d25d01,0x35ecd46e,0x2e626607	! PA = 0000000010181400
	.word	0x47265d9c,0x2dc535bd,0x34d3a4ba,0x1b5555a3	! PA = 0000000010181410
	.word	0x43811d48,0x20cf3b39,0x7071f6c6,0x3a65a7ff	! PA = 0000000010181420
	.word	0x6926fcb4,0x5e610975,0x79647692,0x25e1d91b	! PA = 0000000010181430
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
	.word	0x63ef07e0,0x171dfc71,0x2df7901e,0x1e3124f7	! PA = 0000000030181400
	.word	0x26ee0acc,0x6458302d,0x56336f6a,0x3e2f8793	! PA = 0000000030181410
	.word	0x65e29178,0x084c80a9,0x0da80076,0x2e49bcef	! PA = 0000000030181420
	.word	0x5a60e7e4,0x731e89e5,0x66f8ef42,0x1259410b	! PA = 0000000030181430
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
	.word	0x20bf1a10,0x2894a7e1,0x7529a7ce,0x2e404fe7	! PA = 00000000201c0000
	.word	0x38c0f3fc,0x6293f69d,0x26a9561a,0x7d45e583	! PA = 00000000201c0010
	.word	0x760401a8,0x0c5c5219,0x1e1ee626,0x3831bddf	! PA = 00000000201c0020
	.word	0x6c2b8f14,0x72845655,0x74f503f2,0x062854fb	! PA = 00000000201c0030
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
	.word	0x22cca840,0x43b55f51,0x13a61b7e,0x5446e6d7	! PA = 0000000020800000
	.word	0x1d1a192c,0x3e27890d,0x0bc858ca,0x0fff6f73	! PA = 0000000020800010
	.word	0x01506dd8,0x25ddaf89,0x1fd9a7d6,0x4034aacf	! PA = 0000000020800020
	.word	0x6be1f244,0x5fa16ec5,0x64cbb4a2,0x391614eb	! PA = 0000000020800030
	.word	0x3a62b270,0x4cbf22c1,0x294feb2e,0x66bbe9c7	! PA = 0000000020800040
	.word	0x5a347a5c,0x4381e77d,0x0ee3777a,0x6a832563	! PA = 0000000020800050
	.word	0x66f2d608,0x406f98f9,0x009b4586,0x072983bf	! PA = 0000000020800060
	.word	0x249f1174,0x2c44d335,0x73b00152,0x17a980db	! PA = 0000000020800070
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
	.word	0x218c38a0,0x52b0f231,0x1dca16de,0x0cd658b7	! PA = 00000000211c0000
	.word	0x0c0b178c,0x65d211ed,0x0d0db22a,0x2db80753	! PA = 00000000211c0010
	.word	0x07d63a38,0x2a710e69,0x4de6bf36,0x16a748af	! PA = 00000000211c0020
	.word	0x0f3deca4,0x28fd83a5,0x0a94ea02,0x332998cb	! PA = 00000000211c0030
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
	.word	0x2c143ad0,0x7f49cda1,0x50779e8e,0x2e8d33a7	! PA = 0000000021800000
	.word	0x1458f0bc,0x2f07085d,0x671a08da,0x17451543	! PA = 0000000021800010
	.word	0x76a59a68,0x05010fd9,0x64ff14e6,0x3104f99f	! PA = 0000000021800020
	.word	0x025983d4,0x751a8015,0x6e2d6eb2,0x319d5cbb	! PA = 0000000021800030
	.word	0x7785b900,0x0708b511,0x487b823e,0x64977a97	! PA = 0000000021800040
	.word	0x4a9905ec,0x2fcfcacd,0x319b7b8a,0x71914f33	! PA = 0000000021800050
	.word	0x27cbf698,0x33fe9d49,0x22e74696,0x4159968f	! PA = 0000000021800060
	.word	0x624cd704,0x6eaac885,0x6eec8f62,0x3dcbccab	! PA = 0000000021800070
	.word	0x1b2bb330,0x192ca881,0x64b8c1ee,0x686c2d87	! PA = 0000000021800080
	.word	0x2c06571c,0x6f9b593d,0x64e50a3a,0x03c3b523	! PA = 0000000021800090
	.word	0x21744ec8,0x4e08b6b9,0x14625446,0x4b7c1f7f	! PA = 00000000218000a0
	.word	0x5132e634,0x227d5cf5,0x19054c12,0x773be89b	! PA = 00000000218000b0
	.word	0x58112960,0x4fb4a7f1,0x0bd25d9e,0x04424c77	! PA = 00000000218000c0
	.word	0x0b9be44c,0x5c98b3ad,0x0d09b4ea,0x01c34713	! PA = 00000000218000d0
	.word	0x2b89a2f8,0x0c7e5c29,0x25f33df6,0x5c03946f	! PA = 00000000218000e0
	.word	0x5ee6b164,0x3c213d65,0x646aa4c2,0x6234b08b	! PA = 00000000218000f0
	.word	0x49011b90,0x1f5fb361,0x5c2b554e,0x0310d767	! PA = 0000000021800100
	.word	0x4214ad7c,0x3bb6da1d,0x79dc7b9a,0x7c370503	! PA = 0000000021800110
	.word	0x7fb6f328,0x3b7e8d99,0x53dd03a6,0x7846f55f	! PA = 0000000021800120
	.word	0x39033894,0x75e569d5,0x64cf9972,0x57bd247b	! PA = 0000000021800130
	.word	0x128689c0,0x47accad1,0x5be6a8fe,0x208ece57	! PA = 0000000021800140
	.word	0x5debb2ac,0x18a4cc8d,0x6ef05e4a,0x5085eef3	! PA = 0000000021800150
	.word	0x79673f58,0x29e84b09,0x5a22a556,0x0e5d424f	! PA = 0000000021800160
	.word	0x5ae37bc4,0x08d8e245,0x79a72a22,0x759c446b	! PA = 0000000021800170
	.word	0x12ec73f0,0x42daee41,0x28e758ae,0x79333147	! PA = 0000000021800180
	.word	0x535bf3dc,0x35d18afd,0x53985cfa,0x18d704e3	! PA = 0000000021800190
	.word	0x45c58788,0x195a9479,0x64872306,0x651d7b3f	! PA = 00000000218001a0
	.word	0x3da27af4,0x1ccaa6b5,0x7e2456d2,0x0e59105b	! PA = 00000000218001b0
	.word	0x123dda20,0x35e91db1,0x28d0645e,0x7a350037	! PA = 00000000218001c0
	.word	0x2c60710c,0x7c6c156d,0x62e777aa,0x1c1146d3	! PA = 00000000218001d0
	.word	0x13bccbb8,0x2e3469e9,0x3e8d7cb6,0x0c1ea02f	! PA = 00000000218001e0
	.word	0x081b3624,0x3849b725,0x793a1f82,0x193a884b	! PA = 00000000218001f0
share3_end:
