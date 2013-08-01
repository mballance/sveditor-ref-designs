/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_500_1.s
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
!	Seed = 327141850
!	Riesling can be on
!	1 Thread, 500 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_500_1.s created on Mar 27, 2009 (14:18:50)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_500_1 -p 1 -l 500

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
!	%f0  = 9e1bdc59 69976c4b 69e1928e 0671d8ed
!	%f4  = 6f6c4f9d 9c7cd870 3eceb9fd 96428ade
!	%f8  = ce932fdd fc7c934a faffbeba f2a1c102
!	%f12 = ecd0d1b5 7084f5fc 24c763bb e498d7e4
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 8430a335 b782fb51 9ede5b8f 81794a99
!	%f20 = 08b1eb20 e665809a db3e31c6 0450166c
!	%f24 = e3d600e8 abf4bad9 e211d49c 7578155b
!	%f28 = 4460d4a2 816743af d15e3bf5 8d87e153
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 35ae85c4 8542d0ed d85febe2 03f1cd7f
!	%f36 = 9adc830f 0d1b71df 50665c11 b105d759
!	%f40 = b25adba2 25a69ddc 7e420fee 5d959230
!	%f44 = 2f50eb2f 1dcbee0e b7f5eaf4 08c4370e
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x17474abf00000040,%g7,%g1 ! GSR scale =  8, align = 0
	wr	%g1,%g0,%gsr		! GSR = 17474abf00000040
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000030081410] = 8a9ae594, %l1 = f3b420725df7f72c
	ldsha	[%i2+%o5]0x81,%l1	! %l1 = ffffffffffff8a9a
!	Mem[0000000010081410] = cc8dc2cfec27ada0, %l0 = 66ab53b830a8b0c7
	ldx	[%i2+%o5],%l0		! %l0 = cc8dc2cfec27ada0
!	Mem[0000000010181424] = 314adcee, %l0 = cc8dc2cfec27ada0
	ldub	[%i6+0x024],%l0		! %l0 = 0000000000000031
!	Mem[0000000030181408] = 79b4cea6, %l1 = ffffffffffff8a9a
	lduba	[%i6+%o4]0x89,%l1	! %l1 = 00000000000000a6
!	%f12 = ecd0d1b5 7084f5fc, %l7 = 9ef1a489e9db7b3c
!	Mem[0000000030001420] = ca422b55e8a85632
	add	%i0,0x020,%g1
	stda	%f12,[%g1+%l7]ASI_PST32_SL ! Mem[0000000030001420] = ca422b55e8a85632
!	Mem[00000000300c1400] = d6eed72b, %l7 = 9ef1a489e9db7b3c
	ldstuba	[%i3+%g0]0x81,%l7	! %l7 = 000000d6000000ff
!	Mem[0000000010041408] = a6c69597, %l0 = 0000000000000031
	ldsha	[%i1+%o4]0x88,%l0	! %l0 = ffffffffffff9597
!	Mem[0000000030001408] = 284bcbf1 c3b3a65e, %l2 = 33d2fe4b, %l3 = fbaedc75
	ldda	[%i0+%o4]0x89,%l2	! %l2 = 00000000c3b3a65e 00000000284bcbf1
!	Mem[0000000030101400] = c984b88a, %l1 = 00000000000000a6
	swapa	[%i4+%g0]0x81,%l1	! %l1 = 00000000c984b88a
!	Starting 10 instruction Store Burst
!	Mem[0000000010141421] = 5682861b, %l5 = 93c9be6bf0c41a4e
	ldstub	[%i5+0x021],%l5		! %l5 = 00000082000000ff

p0_label_2:
!	Mem[0000000010181430] = 24033a07cabb9aed, %l5 = 0000000000000082, %l5 = 0000000000000082
	add	%i6,0x30,%g1
	casxa	[%g1]0x80,%l5,%l5	! %l5 = 24033a07cabb9aed
!	Code Fragment 4
p0_fragment_1:
!	%l0 = ffffffffffff9597
	setx	0xbfa7d5efbd58cee2,%g7,%l0 ! %l0 = bfa7d5efbd58cee2
!	%l1 = 00000000c984b88a
	setx	0xe694bb4026717348,%g7,%l1 ! %l1 = e694bb4026717348
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = bfa7d5efbd58cee2
	setx	0x6683902f883d48fa,%g7,%l0 ! %l0 = 6683902f883d48fa
!	%l1 = e694bb4026717348
	setx	0x82796fbfb9184e06,%g7,%l1 ! %l1 = 82796fbfb9184e06
!	%l0 = 6683902f883d48fa, Mem[0000000010181410] = b0e46a78
	stw	%l0,[%i6+%o5]		! Mem[0000000010181410] = 883d48fa
!	%l7 = 00000000000000d6, Mem[0000000010081408] = 93f3d07c
	stha	%l7,[%i2+%o4]0x88	! Mem[0000000010081408] = 93f300d6
!	%l7 = 00000000000000d6, Mem[0000000030001400] = 62e04295
	stba	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = 62e042d6
!	%f3  = 0671d8ed, Mem[0000000030101400] = a6000000
	sta	%f3 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 0671d8ed
!	%l0 = 6683902f883d48fa, Mem[0000000010041410] = aba29f13
	stba	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = aba29ffa
!	Mem[0000000030181408] = a6ceb479, %l7 = 00000000000000d6
	swapa	[%i6+%o4]0x81,%l7	! %l7 = 00000000a6ceb479
!	Mem[0000000010081400] = 1e4a62cd4856f7df, %l1 = 82796fbfb9184e06, %l1 = 82796fbfb9184e06
	casxa	[%i2]0x80,%l1,%l1	! %l1 = 1e4a62cd4856f7df
!	Starting 10 instruction Load Burst
!	Mem[0000000021800100] = 69d92afa, %l6 = bf7b8d1a9e303068
	lduha	[%o3+0x100]%asi,%l6	! %l6 = 00000000000069d9

p0_label_3:
!	Mem[0000000010101410] = e5f5f8b6, %l5 = 24033a07cabb9aed
	ldub	[%i4+%o5],%l5		! %l5 = 00000000000000e5
!	Mem[0000000030081410] = 8a9ae594, %f18 = 9ede5b8f
	lda	[%i2+%o5]0x81,%f18	! %f18 = 8a9ae594
!	Mem[0000000010041408] = 9795c6a6 b03a7a01, %l0 = 883d48fa, %l1 = 4856f7df
	ldda	[%i1+%o4]0x80,%l0	! %l0 = 000000009795c6a6 00000000b03a7a01
!	Mem[0000000010001408] = bf41dbf9, %l4 = d9078b9fcb62b76c
	ldsba	[%i0+%o4]0x88,%l4	! %l4 = fffffffffffffff9
!	Mem[0000000010181410] = fa483d88, %l0 = 000000009795c6a6
	lduwa	[%i6+%o5]0x88,%l0	! %l0 = 00000000fa483d88
!	Mem[0000000030041410] = 9f46338a, %l2 = 00000000c3b3a65e
	ldsba	[%i1+%o5]0x89,%l2	! %l2 = ffffffffffffff8a
!	Mem[0000000030141408] = 623728eb4b3eef16, %l3 = 00000000284bcbf1
	ldxa	[%i5+%o4]0x89,%l3	! %l3 = 623728eb4b3eef16
!	Mem[0000000010141408] = 23fef980, %f22 = db3e31c6
	lda	[%i5+%o4]0x88,%f22	! %f22 = 23fef980
!	Mem[0000000010181408] = aa944a13, %l7 = 00000000a6ceb479
	ldswa	[%i6+0x008]%asi,%l7	! %l7 = ffffffffaa944a13
!	Starting 10 instruction Store Burst
!	%l0 = fa483d88, %l1 = b03a7a01, Mem[00000000100c1400] = 84830496 3fe9f2d9
	stda	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = fa483d88 b03a7a01

p0_label_4:
!	%l2 = ffffffffffffff8a, Mem[0000000010001408] = 2f39a52fbf41dbf9
	stxa	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffffffffffff8a
!	%l1 = 00000000b03a7a01, Mem[00000000100c1410] = 1c77ae1d
	stwa	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = b03a7a01
!	%l7 = ffffffffaa944a13, Mem[0000000030081408] = aeeaa77b
	stba	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = aeeaa713
!	%f1  = 69976c4b, %f26 = e211d49c
	fitos	%f1 ,%f26		! %f26 = 4ed32ed9
!	%l0 = 00000000fa483d88, Mem[0000000030141400] = 830641ed1869f7b1
	stxa	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000fa483d88
!	%l4 = fffffffffffffff9, Mem[0000000010181418] = c12af152e161c938, %asi = 80
	stxa	%l4,[%i6+0x018]%asi	! Mem[0000000010181418] = fffffffffffffff9
!	Mem[000000001010142a] = 904f5624, %l7 = ffffffffaa944a13
	ldstuba	[%i4+0x02a]%asi,%l7	! %l7 = 00000056000000ff
!	%l1 = 00000000b03a7a01, %l7 = 0000000000000056, %l3 = 623728eb4b3eef16
	sub	%l1,%l7,%l3		! %l3 = 00000000b03a79ab
!	Mem[00000000201c0001] = c3dc2e73, %l0 = 00000000fa483d88
	ldstuba	[%o0+0x001]%asi,%l0	! %l0 = 000000dc000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = fa9fa2ab44e48ca9, %f4  = 6f6c4f9d 9c7cd870
	ldda	[%i1+%o5]0x80,%f4 	! %f4  = fa9fa2ab 44e48ca9

p0_label_5:
!	Mem[0000000030001410] = 1401cb7088b3979e, %f8  = ce932fdd fc7c934a
	ldda	[%i0+%o5]0x89,%f8 	! %f8  = 1401cb70 88b3979e
!	Mem[0000000030001400] = 62e042d6, %l6 = 00000000000069d9
	ldstuba	[%i0+%g0]0x89,%l6	! %l6 = 000000d6000000ff
!	Mem[0000000030001408] = 5ea6b3c3, %l6 = 00000000000000d6
	ldsha	[%i0+%o4]0x81,%l6	! %l6 = 0000000000005ea6
!	Mem[0000000010041408] = 9795c6a6, %l1 = 00000000b03a7a01
	lduwa	[%i1+%o4]0x80,%l1	! %l1 = 000000009795c6a6
!	Mem[0000000010141410] = 1d58cd57 7cd06654, %l4 = fffffff9, %l5 = 000000e5
	ldda	[%i5+%o5]0x80,%l4	! %l4 = 000000001d58cd57 000000007cd06654
!	Mem[0000000010181434] = cabb9aed, %l7 = 0000000000000056
	ldsh	[%i6+0x034],%l7		! %l7 = ffffffffffffcabb
!	Mem[0000000030101410] = 8ed508a2, %l1 = 000000009795c6a6
	lduba	[%i4+%o5]0x81,%l1	! %l1 = 000000000000008e
!	Mem[0000000010081400] = 1e4a62cd, %l5 = 000000007cd06654
	lduba	[%i2+%g0]0x80,%l5	! %l5 = 000000000000001e
!	Mem[0000000030041400] = 78adad2d, %l7 = ffffffffffffcabb
	lduba	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000078
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = fa9fa2ab, %l2 = ffffffffffffff8a
	ldswa	[%i1+%o5]0x80,%l2	! %l2 = fffffffffa9fa2ab

p0_label_6:
!	%f24 = e3d600e8 abf4bad9, Mem[0000000030041400] = 2dadad78 e9046887
	stda	%f24,[%i1+%g0]0x89	! Mem[0000000030041400] = e3d600e8 abf4bad9
!	Mem[0000000030141400] = fa483d88, %l5 = 000000000000001e
	ldstuba	[%i5+%g0]0x89,%l5	! %l5 = 00000088000000ff
!	%l2 = fffffffffa9fa2ab, %l7 = 0000000000000078, %l1 = 000000000000008e
	addc	%l2,%l7,%l1		! %l1 = fffffffffa9fa323
!	%l3 = 00000000b03a79ab, Mem[0000000010081410] = cc8dc2cf
	stwa	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = b03a79ab
!	%l7 = 0000000000000078, Mem[0000000030001410] = 9e97b388
	stwa	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000078
!	%l2 = fffffffffa9fa2ab, Mem[0000000030001400] = ff42e062
	stba	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = ab42e062
!	%l0 = 00000000000000dc, Mem[0000000030001400] = ab42e06289c0fed3
	stxa	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000000000dc
!	Mem[0000000030081400] = f896d7e2, %l4 = 000000001d58cd57
	swapa	[%i2+%g0]0x89,%l4	! %l4 = 00000000f896d7e2
!	%l6 = 0000000000005ea6, Mem[0000000030141400] = ff3d48fa
	stwa	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 00005ea6
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 64f3d741eda57a60, %f22 = 23fef980 0450166c
	ldda	[%i6+%g0]0x80,%f22	! %f22 = 64f3d741 eda57a60

p0_label_7:
!	Mem[0000000010001400] = 86cc251c, %l6 = 0000000000005ea6
	ldswa	[%i0+%g0]0x88,%l6	! %l6 = ffffffff86cc251c
!	Mem[0000000030001410] = 78000000, %l7 = 0000000000000078
	lduwa	[%i0+%o5]0x89,%l7	! %l7 = 0000000078000000
!	Mem[00000000100c1408] = 5ccc6c2b, %f7  = 96428ade
	ld	[%i3+%o4],%f7 	! %f7 = 5ccc6c2b
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 00000000000000dc
	setx	0x9fd2cca7d7d04b69,%g7,%l0 ! %l0 = 9fd2cca7d7d04b69
!	%l1 = fffffffffa9fa323
	setx	0x8c148277bedbfd07,%g7,%l1 ! %l1 = 8c148277bedbfd07
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9fd2cca7d7d04b69
	setx	0x3e15edf820327ab5,%g7,%l0 ! %l0 = 3e15edf820327ab5
!	%l1 = 8c148277bedbfd07
	setx	0x0d8d7817f2cdcf6b,%g7,%l1 ! %l1 = 0d8d7817f2cdcf6b
!	Mem[0000000030001410] = 78000000, %l1 = 0d8d7817f2cdcf6b
	ldsba	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = fa483d88, %l3 = 00000000b03a79ab
	lduwa	[%i3+%g0]0x88,%l3	! %l3 = 00000000fa483d88
!	Mem[00000000201c0000] = c3ff2e73, %l4 = 00000000f896d7e2
	lduha	[%o0+0x000]%asi,%l4	! %l4 = 000000000000c3ff
!	Mem[00000000300c1400] = ffeed72b b1e9610e, %l0 = 20327ab5, %l1 = 00000000
	ldda	[%i3+%g0]0x81,%l0	! %l0 = 00000000ffeed72b 00000000b1e9610e
!	Mem[00000000100c1408] = 5ccc6c2bfcc9970f, %f10 = faffbeba f2a1c102
	ldda	[%i3+%o4]0x80,%f10	! %f10 = 5ccc6c2b fcc9970f
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ffeed72b, Mem[0000000010001410] = 425e0c86
	stba	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 425e0c2b

p0_label_8:
!	Mem[0000000030001408] = 5ea6b3c3, %l4 = 000000000000c3ff
	ldstuba	[%i0+%o4]0x81,%l4	! %l4 = 0000005e000000ff
!	%l3 = 00000000fa483d88, Mem[00000000300c1400] = 2bd7eeff
	stha	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 2bd73d88
!	%f16 = 8430a335 b782fb51, Mem[0000000010041408] = 9795c6a6 b03a7a01
	stda	%f16,[%i1+%o4]0x80	! Mem[0000000010041408] = 8430a335 b782fb51
!	Mem[0000000010041408] = 35a33084, %l5 = 0000000000000088
	ldstuba	[%i1+%o4]0x88,%l5	! %l5 = 00000084000000ff
!	%f9  = 88b3979e, Mem[0000000030101400] = 0671d8ed
	sta	%f9 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 88b3979e
!	Mem[00000000201c0001] = c3ff2e73, %l2 = fffffffffa9fa2ab
	ldstuba	[%o0+0x001]%asi,%l2	! %l2 = 000000ff000000ff
!	%f29 = 816743af, Mem[0000000030181400] = 820ed3b3
	sta	%f29,[%i6+%g0]0x81	! Mem[0000000030181400] = 816743af
!	%f0  = 9e1bdc59, %f9  = 88b3979e, %f6  = 3eceb9fd 5ccc6c2b
	fsmuld	%f0 ,%f9 ,%f6 		! %f6  = 34eb55d8 595f7b80
!	Mem[0000000010141400] = aa744c29017198bd, %l7 = 0000000078000000, %l5 = 0000000000000084
	casxa	[%i5]0x80,%l7,%l5	! %l5 = aa744c29017198bd
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = fa9fa2ab, %l6 = ffffffff86cc251c
	lduha	[%i1+%o5]0x80,%l6	! %l6 = 000000000000fa9f

p0_label_9:
!	Mem[00000000100c1400] = 883d48fa, %l3 = 00000000fa483d88
	ldswa	[%i3+%g0]0x80,%l3	! %l3 = ffffffff883d48fa
!	Mem[0000000010041400] = 776af13d, %l3 = ffffffff883d48fa
	ldsba	[%i1+%g0]0x88,%l3	! %l3 = 000000000000003d
!	Mem[0000000030181408] = d6000000, %f14 = 24c763bb
	lda	[%i6+%o4]0x89,%f14	! %f14 = d6000000
!	Mem[0000000030041400] = abf4bad9, %l2 = 00000000000000ff
	lduha	[%i1+%g0]0x89,%l2	! %l2 = 000000000000bad9
!	%l6 = 000000000000fa9f, %l2 = 000000000000bad9, %y  = 00000000
	smul	%l6,%l2,%l6		! %l6 = 00000000b6ebf6c7, %y = 00000000
!	Mem[0000000030141400] = 00005ea6, %l7 = 0000000078000000
	ldsha	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141400] = a65e0000, %l1 = 00000000b1e9610e
	ldswa	[%i5+%g0]0x89,%l1	! %l1 = ffffffffa65e0000
!	Mem[0000000010141410] = 5466d07c57cd581d, %l2 = 000000000000bad9
	ldxa	[%i5+%o5]0x88,%l2	! %l2 = 5466d07c57cd581d
!	Mem[0000000010001408] = 8affffff, %l3 = 000000000000003d
	ldsba	[%i0+%o4]0x80,%l3	! %l3 = ffffffffffffff8a
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ffeed72b, Mem[0000000030101410] = a208d58e
	stwa	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = ffeed72b

p0_label_10:
!	Code Fragment 3
p0_fragment_3:
!	%l0 = 00000000ffeed72b
	setx	0x95faceffe09ecaf8,%g7,%l0 ! %l0 = 95faceffe09ecaf8
!	%l1 = ffffffffa65e0000
	setx	0xeac53f77b71ad0b7,%g7,%l1 ! %l1 = eac53f77b71ad0b7
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 95faceffe09ecaf8
	setx	0x8bf71ae7c86def2d,%g7,%l0 ! %l0 = 8bf71ae7c86def2d
!	%l1 = eac53f77b71ad0b7
	setx	0x3bbe045fd281631e,%g7,%l1 ! %l1 = 3bbe045fd281631e
!	%f18 = 8a9ae594 81794a99, Mem[0000000010181410] = 883d48fa db721f5f
	stda	%f18,[%i6+%o5]0x80	! Mem[0000000010181410] = 8a9ae594 81794a99
!	Mem[0000000020800001] = 1f25d27f, %l6 = 00000000b6ebf6c7
	ldstuba	[%o1+0x001]%asi,%l6	! %l6 = 00000025000000ff
!	Mem[0000000030181410] = 3dbb3e86, %l6 = 0000000000000025
	swapa	[%i6+%o5]0x89,%l6	! %l6 = 000000003dbb3e86
!	Mem[0000000010081410] = ab793ab0, %l3 = ffffffffffffff8a
	swapa	[%i2+%o5]0x88,%l3	! %l3 = 00000000ab793ab0
!	%f4  = fa9fa2ab 44e48ca9, Mem[0000000010101410] = e5f5f8b6 3c241327
	std	%f4 ,[%i4+%o5]	! Mem[0000000010101410] = fa9fa2ab 44e48ca9
!	%l7 = 0000000000000000, Mem[0000000030101408] = 75b77ea6
	stha	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 75b70000
!	%l3 = 00000000ab793ab0, Mem[00000000100c142c] = 08a031d1, %asi = 80
	stwa	%l3,[%i3+0x02c]%asi	! Mem[00000000100c142c] = ab793ab0
!	%l1 = 3bbe045fd281631e, Mem[0000000010181403] = 64f3d741, %asi = 80
	stba	%l1,[%i6+0x003]%asi	! Mem[0000000010181400] = 64f3d71e
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 57cd581d, %l1 = 3bbe045fd281631e
	ldswa	[%i2+%g0]0x81,%l1	! %l1 = 0000000057cd581d

p0_label_11:
!	Mem[0000000030041400] = abf4bad9, %l2 = 5466d07c57cd581d
	lduba	[%i1+%g0]0x89,%l2	! %l2 = 00000000000000d9
!	Mem[0000000010081410] = ffffff8a, %l2 = 00000000000000d9
	ldswa	[%i2+%o5]0x88,%l2	! %l2 = ffffffffffffff8a
!	Mem[0000000030141410] = e4d8ff4f, %l5 = aa744c29017198bd
	ldsba	[%i5+%o5]0x89,%l5	! %l5 = 000000000000004f
!	Mem[0000000030001400] = 00000000, %l5 = 000000000000004f
	lduba	[%i0+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1408] = 2b6ccc5c, %l1 = 0000000057cd581d
	ldsha	[%i3+%o4]0x88,%l1	! %l1 = ffffffffffffcc5c
!	Mem[0000000030081408] = 13a7eaae, %l7 = 0000000000000000
	ldswa	[%i2+%o4]0x81,%l7	! %l7 = 0000000013a7eaae
!	Mem[0000000030081408] = 13a7eaae, %l2 = ffffffffffffff8a
	lduha	[%i2+%o4]0x81,%l2	! %l2 = 00000000000013a7
!	Mem[0000000010081400] = 1e4a62cd, %l0 = 8bf71ae7c86def2d
	ldswa	[%i2+%g0]0x80,%l0	! %l0 = 000000001e4a62cd
!	%f25 = abf4bad9, %f15 = e498d7e4, %f24 = e3d600e8
	fsubs	%f25,%f15,%f24		! %f24 = 6498d7e4
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 23fef980, %l5 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l5	! %l5 = 00000080000000ff

p0_label_12:
!	%l5 = 0000000000000080, Mem[0000000010101400] = 779bff80
	stba	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = 809bff80
!	%l1 = ffffffffffffcc5c, Mem[0000000030001410] = 1401cb7078000000
	stxa	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = ffffffffffffcc5c
!	Mem[0000000030081400] = 1d58cd57, %l5 = 0000000000000080
	swapa	[%i2+%g0]0x89,%l5	! %l5 = 000000001d58cd57
!	%l1 = ffffffffffffcc5c, imm = fffffffffffff0ff, %l6 = 000000003dbb3e86
	and	%l1,-0xf01,%l6		! %l6 = ffffffffffffc05c
!	%f24 = 6498d7e4, %f16 = 8430a335, %f23 = eda57a60
	fsubs	%f24,%f16,%f23		! %f23 = 6498d7e4
!	Mem[0000000010041408] = 35a330ff, %l4 = 000000000000005e
	ldstuba	[%i1+%o4]0x88,%l4	! %l4 = 000000ff000000ff
!	%l3 = 00000000ab793ab0, Mem[0000000010041410] = aba29ffa
	stha	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = aba23ab0
!	%l5 = 000000001d58cd57, %l7 = 0000000013a7eaae, %l2 = 00000000000013a7
	sdivx	%l5,%l7,%l2		! %l2 = 0000000000000001
!	%l4 = 00000000000000ff, Mem[0000000010041408] = ff30a335
	stba	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = ff30a335
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 8a9ae594a7bc65c8, %l3 = 00000000ab793ab0
	ldxa	[%i2+%o5]0x81,%l3	! %l3 = 8a9ae594a7bc65c8

p0_label_13:
!	%f27 = 7578155b, %f17 = b782fb51, %f30 = d15e3bf5
	fmuls	%f27,%f17,%f30		! %f30 = ed7ddcc7
!	Mem[0000000030041408] = 06dd0ffe, %l5 = 000000001d58cd57
	lduha	[%i1+%o4]0x81,%l5	! %l5 = 00000000000006dd
!	Mem[0000000010181410] = 8a9ae594, %f27 = 7578155b
	lda	[%i6+%o5]0x80,%f27	! %f27 = 8a9ae594
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010141400] = aa744c29 017198bd fff9fe23 8d7ef7ca
!	Mem[0000000010141410] = 1d58cd57 7cd06654 7404ec24 984a0952
!	Mem[0000000010141420] = 56ff861b 4407699b ccf9467b 71eb05b0
!	Mem[0000000010141430] = 81b7a0d5 84553aa1 be2204bc b94fb8c7
	ldda	[%i5]ASI_BLK_AIUP,%f16	! Block Load from 0000000010141400
!	Mem[00000000100c1400] = 883d48fa017a3ab0, %f14 = d6000000 e498d7e4
	ldda	[%i3+%g0]0x80,%f14	! %f14 = 883d48fa 017a3ab0
!	%l5 = 00000000000006dd, %l4 = 00000000000000ff, %l6 = ffffffffffffc05c
	udivx	%l5,%l4,%l6		! %l6 = 0000000000000006
!	Mem[0000000030081410] = 94e59a8a, %l4 = 00000000000000ff
	lduba	[%i2+%o5]0x89,%l4	! %l4 = 000000000000008a
!	Mem[00000000300c1400] = 883dd72b, %l2 = 0000000000000001
	lduba	[%i3+%g0]0x81,%l2	! %l2 = 0000000000000088
!	Mem[0000000010081438] = 02774f52 ee7fe48c, %l6 = 00000006, %l7 = 13a7eaae
	ldd	[%i2+0x038],%l6		! %l6 = 0000000002774f52 00000000ee7fe48c
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 75b70000, %l4 = 000000000000008a
	swapa	[%i4+%o4]0x89,%l4	! %l4 = 0000000075b70000

p0_label_14:
!	%l0 = 000000001e4a62cd, Mem[0000000010101408] = 264e3255
	stwa	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 1e4a62cd
!	%l2 = 0000000000000088, Mem[0000000030181400] = 28ce77deaf436781
	stxa	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000000000000088
!	%f2  = 69e1928e, Mem[00000000100c1400] = fa483d88
	sta	%f2 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 69e1928e
!	%l4 = 0000000075b70000, Mem[0000000030101408] = 8a000000
	stha	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	%l1 = ffffffffffffcc5c, %l4 = 0000000075b70000, %l0 = 000000001e4a62cd
	andn	%l1,%l4,%l0		! %l0 = ffffffff8a48cc5c
!	%l2 = 00000088, %l3 = a7bc65c8, Mem[0000000030041400] = d9baf4ab e800d6e3
	stda	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000088 a7bc65c8
!	%l3 = 8a9ae594a7bc65c8, Mem[0000000010101408] = 1e4a62cd
	stba	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = c84a62cd
!	Mem[0000000010081408] = 93f300d6, %l1 = ffffffffffffcc5c
	ldstuba	[%i2+%o4]0x88,%l1	! %l1 = 000000d6000000ff
!	Mem[0000000010181400] = 64f3d71e, %l6 = 0000000002774f52
	swapa	[%i6+%g0]0x80,%l6	! %l6 = 0000000064f3d71e
!	Starting 10 instruction Load Burst
!	Mem[000000001014140c] = 8d7ef7ca, %l7 = 00000000ee7fe48c
	ldub	[%i5+0x00c],%l7		! %l7 = 000000000000008d

p0_label_15:
!	Mem[0000000010141408] = 23fef9ff, %l1 = 00000000000000d6
	lduwa	[%i5+%o4]0x88,%l1	! %l1 = 0000000023fef9ff
!	%l4 = 0000000075b70000, %l7 = 000000000000008d, %y  = 00000000
	smul	%l4,%l7,%l6		! %l6 = 00000040d5cb0000, %y = 00000040
!	%f9  = 88b3979e, %f15 = 017a3ab0
	fcmpes	%fcc1,%f9 ,%f15		! %fcc1 = 1
!	Mem[0000000010041408] = 35a330ff, %l7 = 000000000000008d
	lduwa	[%i1+%o4]0x88,%l7	! %l7 = 0000000035a330ff
!	Mem[0000000010081400] = cd624a1e, %l0 = ffffffff8a48cc5c
	lduha	[%i2+%g0]0x88,%l0	! %l0 = 0000000000004a1e
!	%l4 = 0000000075b70000, %l6 = 00000040d5cb0000, %l5 = 00000000000006dd
	and	%l4,%l6,%l5		! %l5 = 0000000055830000
!	Mem[0000000010041400] = 6981e8d2 776af13d, %l4 = 75b70000, %l5 = 55830000
	ldda	[%i1+%g0]0x88,%l4	! %l4 = 00000000776af13d 000000006981e8d2
!	Mem[0000000010181410] = 8a9ae594, %l5 = 000000006981e8d2
	ldswa	[%i6+%o5]0x80,%l5	! %l5 = ffffffff8a9ae594
!	Mem[0000000030181410] = 00000025, %l1 = 0000000023fef9ff
	lduba	[%i6+%o5]0x89,%l1	! %l1 = 0000000000000025
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 06dd0ffe, %l6 = 00000040d5cb0000
	swapa	[%i1+%o4]0x81,%l6	! %l6 = 0000000006dd0ffe

p0_label_16:
!	%f16 = aa744c29 017198bd fff9fe23 8d7ef7ca
!	%f20 = 1d58cd57 7cd06654 7404ec24 984a0952
!	%f24 = 56ff861b 4407699b ccf9467b 71eb05b0
!	%f28 = 81b7a0d5 84553aa1 be2204bc b94fb8c7
	stda	%f16,[%i0]ASI_COMMIT_P	! Block Store to 0000000010001400
!	%l4 = 776af13d, %l5 = 8a9ae594, Mem[0000000030101400] = 88b3979e 9cd2eeef
	stda	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 776af13d 8a9ae594
!	%f10 = 5ccc6c2b fcc9970f, Mem[00000000300c1400] = 2bd73d88 0e61e9b1
	stda	%f10,[%i3+%g0]0x89	! Mem[00000000300c1400] = 5ccc6c2b fcc9970f
!	Mem[00000000300c1408] = 805e8a71, %l4 = 00000000776af13d
	ldstuba	[%i3+%o4]0x89,%l4	! %l4 = 00000071000000ff
!	%f6  = 34eb55d8 595f7b80, %l1 = 0000000000000025
!	Mem[0000000030101408] = 000000009f02bfe9
	add	%i4,0x008,%g1
	stda	%f6,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030101408] = 807b0000d855bfe9
!	Mem[0000000020800001] = 1fffd27f, %l0 = 0000000000004a1e
	ldstub	[%o1+0x001],%l0		! %l0 = 000000ff000000ff
!	%l7 = 0000000035a330ff, Mem[0000000030001400] = dc00000000000000
	stxa	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000000035a330ff
!	%f8  = 1401cb70 88b3979e, %l5 = ffffffff8a9ae594
!	Mem[0000000010181418] = fffffffffffffff9
	add	%i6,0x018,%g1
	stda	%f8,[%g1+%l5]ASI_PST8_P ! Mem[0000000010181418] = 14ffff70ffb3fff9
!	Mem[00000000211c0000] = b0ea8232, %l6 = 0000000006dd0ffe
	ldstub	[%o2+%g0],%l6		! %l6 = 000000b0000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 35a330ff, %l2 = 0000000000000088
	lduwa	[%i0+%g0]0x89,%l2	! %l2 = 0000000035a330ff

p0_label_17:
!	Mem[0000000030141400] = a65e0000, %f13 = 7084f5fc
	lda	[%i5+%g0]0x89,%f13	! %f13 = a65e0000
!	Mem[0000000010041434] = 9e791399, %l5 = ffffffff8a9ae594
	ldsba	[%i1+0x036]%asi,%l5	! %l5 = 0000000000000013
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000010001408] = 23fef9ff, %l1 = 0000000000000025
	lduwa	[%i0+%o4]0x88,%l1	! %l1 = 0000000023fef9ff
!	Mem[0000000030181408] = 000000d6, %l0 = 00000000000000ff
	lduba	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1400] = 0f97c9fc 2b6ccc5c, %l6 = 000000b0, %l7 = 35a330ff
	ldda	[%i3+%g0]0x81,%l6	! %l6 = 000000000f97c9fc 000000002b6ccc5c
!	Mem[0000000030181410] = 00000025, %l3 = 8a9ae594a7bc65c8
	lduwa	[%i6+%o5]0x89,%l3	! %l3 = 0000000000000025
!	Mem[0000000030041400] = 00000088a7bc65c8, %l1 = 0000000023fef9ff
	ldxa	[%i1+%g0]0x81,%l1	! %l1 = 00000088a7bc65c8
!	Mem[0000000030041408] = d5cb0000, %f8  = 1401cb70
	lda	[%i1+%o4]0x81,%f8 	! %f8 = d5cb0000
!	%f10 = 5ccc6c2b, %f11 = fcc9970f, %f4  = fa9fa2ab
	fdivs	%f10,%f11,%f4 		! %f4  = 9f81cc69
!	Starting 10 instruction Store Burst
!	%l1 = 00000088a7bc65c8, Mem[000000001014143c] = b94fb8c7, %asi = 80
	stha	%l1,[%i5+0x03c]%asi	! Mem[000000001014143c] = 65c8b8c7

p0_label_18:
!	%l2 = 0000000035a330ff, Mem[0000000010041406] = d2e88169, %asi = 80
	stha	%l2,[%i1+0x006]%asi	! Mem[0000000010041404] = d2e830ff
!	Mem[0000000030181408] = 000000d6, %l2 = 0000000035a330ff
	ldstuba	[%i6+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	%f18 = fff9fe23 8d7ef7ca, %l7 = 000000002b6ccc5c
!	Mem[0000000030181418] = 545517434a634e12
	add	%i6,0x018,%g1
	stda	%f18,[%g1+%l7]ASI_PST8_S ! Mem[0000000030181418] = 54f917238d7e4e12
!	Mem[0000000010181410] = 8a9ae594, %l1 = 00000088a7bc65c8
	ldstuba	[%i6+%o5]0x80,%l1	! %l1 = 0000008a000000ff
!	Mem[00000000300c1410] = b5ea27fb, %l5 = 0000000000000013
	swapa	[%i3+%o5]0x89,%l5	! %l5 = 00000000b5ea27fb
!	%l3 = 0000000000000025, %l3 = 0000000000000025, %l7 = 000000002b6ccc5c
	xnor	%l3,%l3,%l7		! %l7 = ffffffffffffffff
!	Mem[0000000030181400] = 00000088, %l0 = 0000000000000000
	swapa	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000088
!	Mem[0000000030041400] = 88000000, %l6 = 000000000f97c9fc
	ldstuba	[%i1+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%l4 = 0000000000000071, Mem[0000000010101404] = e512c076
	stw	%l4,[%i4+0x004]		! Mem[0000000010101404] = 00000071
!	Starting 10 instruction Load Burst
!	Mem[0000000010181438] = fd5fc11b 4164d557, %l6 = 00000000, %l7 = ffffffff
	ldd	[%i6+0x038],%l6		! %l6 = 00000000fd5fc11b 000000004164d557

p0_label_19:
!	Mem[00000000100c1410] = b03a7a01, %l3 = 0000000000000025
	ldsh	[%i3+0x012],%l3		! %l3 = 0000000000007a01
!	Mem[0000000030181400] = 00000000, %l3 = 0000000000007a01
	ldsha	[%i6+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000201c0000] = c3ff2e73, %l1 = 000000000000008a
	lduba	[%o0+0x000]%asi,%l1	! %l1 = 00000000000000c3
!	%l4 = 0000000000000071, Mem[0000000010041410] = aba23ab0
	stwa	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000071
!	Mem[0000000010141400] = aa744c29017198bd, %l6 = 00000000fd5fc11b
	ldxa	[%i5+%g0]0x80,%l6	! %l6 = aa744c29017198bd
!	Mem[0000000010081410] = 8affffffec27ada0, %l5 = 00000000b5ea27fb
	ldxa	[%i2+%o5]0x80,%l5	! %l5 = 8affffffec27ada0
!	Mem[0000000010001414] = 7cd06654, %f26 = ccf9467b
	ld	[%i0+0x014],%f26	! %f26 = 7cd06654
!	Mem[00000000300c1410] = 00000013, %l0 = 0000000000000088
	ldsba	[%i3+%o5]0x89,%l0	! %l0 = 0000000000000013
!	Mem[0000000010041410] = 00000071, %l7 = 000000004164d557
	ldsha	[%i1+%o5]0x88,%l7	! %l7 = 0000000000000071
!	Starting 10 instruction Store Burst
!	%l6 = aa744c29017198bd, Mem[0000000030001410] = 5cccffff
	stwa	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 017198bd

p0_label_20:
!	%f14 = 883d48fa, Mem[0000000030041408] = 0000cbd5
	sta	%f14,[%i1+%o4]0x89	! Mem[0000000030041408] = 883d48fa
!	%l4 = 0000000000000071, Mem[00000000300c1410] = 00000013
	stwa	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000071
!	%f0  = 9e1bdc59, %f19 = 8d7ef7ca, %f14 = 883d48fa
	fmuls	%f0 ,%f19,%f14		! %f14 = 00000000
!	Mem[0000000030101408] = 807b0000, %l5 = 8affffffec27ada0
	swapa	[%i4+%o4]0x81,%l5	! %l5 = 00000000807b0000
!	%f14 = 00000000, Mem[0000000010001438] = be2204bc
	st	%f14,[%i0+0x038]	! Mem[0000000010001438] = 00000000
!	%f16 = aa744c29 017198bd, Mem[0000000010001430] = 81b7a0d5 84553aa1
	std	%f16,[%i0+0x030]	! Mem[0000000010001430] = aa744c29 017198bd
!	%l4 = 0000000000000071, %l3 = 0000000000000000, %l0 = 0000000000000013
	add	%l4,%l3,%l0		! %l0 = 0000000000000071
!	%l1 = 00000000000000c3, Mem[0000000010001400] = aa744c29
	stba	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = c3744c29
!	%f9  = 88b3979e, Mem[0000000010181410] = 94e59aff
	sta	%f9 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 88b3979e
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 00000000 35a330ff, %l0 = 00000071, %l1 = 000000c3
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 0000000035a330ff 0000000000000000

p0_label_21:
!	Mem[0000000010141400] = aa744c29, %l3 = 0000000000000000
	ldswa	[%i5+%g0]0x80,%l3	! %l3 = ffffffffaa744c29
!	Mem[00000000300c1410] = 00000071, %l4 = 0000000000000071
	ldsha	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000071
!	Mem[0000000010041430] = f7c2e0599e791399, %f22 = 7404ec24 984a0952
	ldda	[%i1+0x030]%asi,%f22	! %f22 = f7c2e059 9e791399
!	%l5 = 00000000807b0000, immed = 000006d9, %y  = 00000040
	umul	%l5,0x6d9,%l4		! %l4 = 0000036fca430000, %y = 0000036f
!	Mem[0000000030101400] = 776af13d, %l1 = 0000000000000000
	ldswa	[%i4+%g0]0x89,%l1	! %l1 = 00000000776af13d
!	Mem[0000000010181438] = fd5fc11b4164d557, %l3 = ffffffffaa744c29
	ldxa	[%i6+0x038]%asi,%l3	! %l3 = fd5fc11b4164d557
!	Mem[0000000030101400] = 3df16a7794e59a8a, %l6 = aa744c29017198bd
	ldxa	[%i4+%g0]0x81,%l6	! %l6 = 3df16a7794e59a8a
!	Mem[0000000030101410] = 2bd7eeff, %f29 = 84553aa1
	lda	[%i4+%o5]0x81,%f29	! %f29 = 2bd7eeff
!	Mem[0000000010041408] = ff30a335 b782fb51, %l4 = ca430000, %l5 = 807b0000
	ldda	[%i1+%o4]0x80,%l4	! %l4 = 00000000ff30a335 00000000b782fb51
!	Starting 10 instruction Store Burst
!	Mem[0000000010141413] = 1d58cd57, %l2 = 0000000000000000
	ldstub	[%i5+0x013],%l2		! %l2 = 00000057000000ff

p0_label_22:
!	%f0  = 9e1bdc59 69976c4b 69e1928e 0671d8ed
!	%f4  = 9f81cc69 44e48ca9 34eb55d8 595f7b80
!	%f8  = d5cb0000 88b3979e 5ccc6c2b fcc9970f
!	%f12 = ecd0d1b5 a65e0000 00000000 017a3ab0
	stda	%f0,[%i2]ASI_BLK_AIUSL	! Block Store to 0000000030081400
!	Mem[00000000201c0000] = c3ff2e73, %l4 = 00000000ff30a335
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 000000c3000000ff
!	%f24 = 56ff861b 4407699b, Mem[0000000010041400] = 3df16a77 d2e830ff
	stda	%f24,[%i1+%g0]0x80	! Mem[0000000010041400] = 56ff861b 4407699b
!	Mem[0000000030041400] = ff000088, %l2 = 0000000000000057
	ldstuba	[%i1+%g0]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010141408] = fff9fe23, %l0 = 0000000035a330ff
	ldstuba	[%i5+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010101408] = cd624ac8, %l1 = 00000000776af13d
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 00000000cd624ac8
!	%l0 = 00000000000000ff, Mem[0000000010101408] = 7d6cb537776af13d
	stxa	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000000000ff
!	Code Fragment 3
p0_fragment_4:
!	%l0 = 00000000000000ff
	setx	0xde672b57c31656b2,%g7,%l0 ! %l0 = de672b57c31656b2
!	%l1 = 00000000cd624ac8
	setx	0xc0d1654797a055f7,%g7,%l1 ! %l1 = c0d1654797a055f7
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = de672b57c31656b2
	setx	0x03842c47973528ea,%g7,%l0 ! %l0 = 03842c47973528ea
!	%l1 = c0d1654797a055f7
	setx	0x6c8728efeb09d6e1,%g7,%l1 ! %l1 = 6c8728efeb09d6e1
!	%f16 = aa744c29 017198bd fff9fe23 8d7ef7ca
!	%f20 = 1d58cd57 7cd06654 f7c2e059 9e791399
!	%f24 = 56ff861b 4407699b 7cd06654 71eb05b0
!	%f28 = 81b7a0d5 2bd7eeff be2204bc b94fb8c7
	stda	%f16,[%i3]ASI_BLK_PL	! Block Store to 00000000100c1400
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = fa9fa2ab, %l4 = 00000000000000c3
	lduwa	[%i4+%o5]0x80,%l4	! %l4 = 00000000fa9fa2ab

p0_label_23:
!	Mem[0000000010041408] = ff30a335b782fb51, %f10 = 5ccc6c2b fcc9970f
	ldda	[%i1+%o4]0x80,%f10	! %f10 = ff30a335 b782fb51
!	Mem[000000001010142c] = 505c22c3, %l2 = 00000000000000ff
	ldsb	[%i4+0x02c],%l2		! %l2 = 0000000000000050
!	Mem[00000000300c1410] = 710000004f19ac2c, %l3 = fd5fc11b4164d557
	ldxa	[%i3+%o5]0x81,%l3	! %l3 = 710000004f19ac2c
	membar	#Sync			! Added by membar checker (3)
!	Mem[00000000100c1408] = fff9fe238d7ef7ca, %f4  = 9f81cc69 44e48ca9
	ldda	[%i3+%o4]0x88,%f4 	! %f4  = fff9fe23 8d7ef7ca
!	Mem[0000000010141400] = 294c74aa, %l3 = 710000004f19ac2c
	ldsha	[%i5+%g0]0x88,%l3	! %l3 = 00000000000074aa
!	Mem[0000000030101410] = ffeed72b, %l4 = 00000000fa9fa2ab
	ldsba	[%i4+%o5]0x89,%l4	! %l4 = 000000000000002b
!	Mem[0000000010041410] = 71000000, %l3 = 00000000000074aa
	ldsba	[%i1+%o5]0x80,%l3	! %l3 = 0000000000000071
!	Mem[0000000030101408] = ec27ada0 d855bfe9, %l0 = 973528ea, %l1 = eb09d6e1
	ldda	[%i4+%o4]0x81,%l0	! %l0 = 00000000ec27ada0 00000000d855bfe9
!	Mem[0000000030141400] = 00005ea6, %l2 = 0000000000000050
	lduba	[%i5+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 00000071, Mem[0000000030101408] = a0ad27ec e9bf55d8
	stda	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 00000071

p0_label_24:
!	%f24 = 56ff861b 4407699b, Mem[00000000100c1418] = 9913799e 59e0c2f7
	std	%f24,[%i3+0x018]	! Mem[00000000100c1418] = 56ff861b 4407699b
!	%l5 = 00000000b782fb51, Mem[000000001004141e] = a9dfd5b0, %asi = 80
	stha	%l5,[%i1+0x01e]%asi	! Mem[000000001004141c] = a9dffb51
!	Mem[0000000010081408] = ff00f393, %l2 = 0000000000000000
	ldstuba	[%i2+%o4]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030141410] = e4d8ff4f, %l1 = 00000000d855bfe9
	ldstuba	[%i5+%o5]0x89,%l1	! %l1 = 0000004f000000ff
!	%l3 = 0000000000000071, Mem[0000000010081400] = 1e4a62cd4856f7df
	stxa	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000000071
!	Mem[0000000010141408] = fff9fe23, %l3 = 0000000000000071
	ldstuba	[%i5+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	Mem[00000000100c143c] = bc0422be, %l5 = 00000000b782fb51
	swap	[%i3+0x03c],%l5		! %l5 = 00000000bc0422be
!	Mem[0000000030101408] = 00000000, %l4 = 000000000000002b
	ldstuba	[%i4+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181400] = 02774f52eda57a60, %l2 = 00000000000000ff, %l0 = 00000000ec27ada0
	casxa	[%i6]0x80,%l2,%l0	! %l0 = 02774f52eda57a60
!	Starting 10 instruction Load Burst
!	Mem[0000000021800080] = 2b31d749, %l2 = 00000000000000ff
	ldsb	[%o3+0x080],%l2		! %l2 = 000000000000002b

p0_label_25:
!	Mem[0000000030141410] = ffffd8e4, %f5  = 8d7ef7ca
	lda	[%i5+%o5]0x81,%f5 	! %f5 = ffffd8e4
!	Mem[0000000010141408] = 23fef9ff, %l3 = 00000000000000ff
	lduha	[%i5+%o4]0x88,%l3	! %l3 = 000000000000f9ff
!	Mem[0000000030101408] = 000000ff, %l4 = 0000000000000000
	lduha	[%i4+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1438] = c7b84fb9 b782fb51, %l6 = 94e59a8a, %l7 = 00000071
	ldda	[%i3+0x038]%asi,%l6	! %l6 = 00000000c7b84fb9 00000000b782fb51
!	Mem[00000000100c143c] = b782fb51, %l5 = 00000000bc0422be
	ldsw	[%i3+0x03c],%l5		! %l5 = ffffffffb782fb51
!	Mem[0000000010181400] = 02774f52, %l5 = ffffffffb782fb51
	ldswa	[%i6+0x000]%asi,%l5	! %l5 = 0000000002774f52
!	Mem[0000000010081408] = ff00f393, %l7 = 00000000b782fb51
	ldsba	[%i2+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030041408] = 883d48fa, %l3 = 000000000000f9ff
	ldswa	[%i1+%o4]0x89,%l3	! %l3 = ffffffff883d48fa
!	Mem[0000000030141408] = 4b3eef16, %l4 = 00000000000000ff
	lduba	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000016
!	Starting 10 instruction Store Burst
!	%f5  = ffffd8e4, Mem[0000000010041410] = 00000071
	sta	%f5 ,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffd8e4

p0_label_26:
!	%f27 = 71eb05b0, Mem[0000000010141400] = aa744c29
	sta	%f27,[%i5+%g0]0x80	! Mem[0000000010141400] = 71eb05b0
!	%f16 = aa744c29 017198bd fff9fe23 8d7ef7ca
!	%f20 = 1d58cd57 7cd06654 f7c2e059 9e791399
!	%f24 = 56ff861b 4407699b 7cd06654 71eb05b0
!	%f28 = 81b7a0d5 2bd7eeff be2204bc b94fb8c7
	stda	%f16,[%i4]ASI_BLK_AIUSL	! Block Store to 0000000030101400
!	%f6  = 34eb55d8, %f6  = 34eb55d8, %f5  = ffffd8e4
	fdivs	%f6 ,%f6 ,%f5 		! %f5  = 3f800000
!	%l4 = 0000000000000016, Mem[00000000300c1400] = fcc9970f
	stwa	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000016
!	%f8  = d5cb0000, Mem[0000000030041400] = 880000ff
	sta	%f8 ,[%i1+%g0]0x89	! Mem[0000000030041400] = d5cb0000
!	%l2 = 000000000000002b, Mem[0000000030181408] = d60000ff
	stba	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = d600002b
!	%f1  = 69976c4b, Mem[0000000030041400] = d5cb0000
	sta	%f1 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 69976c4b
!	%l1 = 000000000000004f, Mem[0000000010181428] = 2635df10360c5a49, %asi = 80
	stxa	%l1,[%i6+0x028]%asi	! Mem[0000000010181428] = 000000000000004f
!	%l3 = ffffffff883d48fa, Mem[0000000030001410] = 017198bdffffffff
	stxa	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = ffffffff883d48fa
!	Starting 10 instruction Load Burst
!	Mem[0000000010081438] = 02774f52, %l6 = 00000000c7b84fb9
	lduha	[%i2+0x03a]%asi,%l6	! %l6 = 0000000000004f52

p0_label_27:
!	Mem[0000000030141408] = 16ef3e4b, %f5  = 3f800000
	lda	[%i5+%o4]0x81,%f5 	! %f5 = 16ef3e4b
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000010181400] = 02774f52 eda57a60 aa944a13 0abe50ae
!	Mem[0000000010181410] = 9e97b388 81794a99 14ffff70 ffb3fff9
!	Mem[0000000010181420] = 5d376b08 314adcee 00000000 0000004f
!	Mem[0000000010181430] = 24033a07 cabb9aed fd5fc11b 4164d557
	ldda	[%i6]ASI_BLK_PL,%f16	! Block Load from 0000000010181400
!	Mem[0000000030001410] = ffffffff, %l7 = ffffffffffffffff
	ldsba	[%i0+%o5]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030101410] = 7cd06654, %l2 = 000000000000002b
	lduwa	[%i4+%o5]0x89,%l2	! %l2 = 000000007cd06654
!	Mem[0000000030181408] = 2b0000d6, %f0  = 9e1bdc59
	lda	[%i6+%o4]0x81,%f0 	! %f0 = 2b0000d6
!	Mem[0000000010001410] = 5466d07c57cd581d, %l4 = 0000000000000016
	ldxa	[%i0+%o5]0x88,%l4	! %l4 = 5466d07c57cd581d
!	Mem[0000000030001400] = 0000000035a330ff, %l1 = 000000000000004f
	ldxa	[%i0+%g0]0x89,%l1	! %l1 = 0000000035a330ff
!	Mem[0000000030041400] = 4b6c9769, %l2 = 000000007cd06654
	ldsha	[%i1+%g0]0x81,%l2	! %l2 = 0000000000004b6c
!	Mem[0000000010181410] = 9e97b388, %l2 = 0000000000004b6c
	lduba	[%i6+%o5]0x80,%l2	! %l2 = 000000000000009e
!	Starting 10 instruction Store Burst
!	%f6  = 34eb55d8, Mem[0000000030041408] = fa483d88
	sta	%f6 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 34eb55d8

p0_label_28:
!	Mem[0000000010141430] = 81b7a0d5, %l1 = 0000000035a330ff, %asi = 80
	swapa	[%i5+0x030]%asi,%l1	! %l1 = 0000000081b7a0d5
!	%l2 = 0000009e, %l3 = 883d48fa, Mem[0000000010001418] = 7404ec24 984a0952
	std	%l2,[%i0+0x018]		! Mem[0000000010001418] = 0000009e 883d48fa
!	Mem[00000000300c1408] = 805e8aff, %l2 = 000000000000009e
	swapa	[%i3+%o4]0x89,%l2	! %l2 = 00000000805e8aff
!	%f9  = 88b3979e, Mem[0000000030041408] = d855eb34
	sta	%f9 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 88b3979e
!	Mem[0000000010081438] = 02774f52ee7fe48c, %l2 = 00000000805e8aff, %l2 = 00000000805e8aff
	add	%i2,0x38,%g1
	casxa	[%g1]0x80,%l2,%l2	! %l2 = 02774f52ee7fe48c
!	%l5 = 0000000002774f52, Mem[0000000010101408] = ff000000
	stha	%l5,[%i4+%o4]0x80	! Mem[0000000010101408] = 4f520000
!	%l5 = 0000000002774f52, imm = 0000000000000a55, %l4 = 5466d07c57cd581d
	orn	%l5,0xa55,%l4		! %l4 = fffffffffffffffa
!	Code Fragment 4
p0_fragment_5:
!	%l0 = 02774f52eda57a60
	setx	0x9477803fe51428af,%g7,%l0 ! %l0 = 9477803fe51428af
!	%l1 = 0000000081b7a0d5
	setx	0x564414e7bfc68b51,%g7,%l1 ! %l1 = 564414e7bfc68b51
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9477803fe51428af
	setx	0x0c64670f937e93ae,%g7,%l0 ! %l0 = 0c64670f937e93ae
!	%l1 = 564414e7bfc68b51
	setx	0x60098d3821aa51d0,%g7,%l1 ! %l1 = 60098d3821aa51d0
!	%f2  = 69e1928e 0671d8ed, %l2 = 02774f52ee7fe48c
!	Mem[0000000030181410] = 2500000004a2c80c
	add	%i6,0x010,%g1
	stda	%f2,[%g1+%l2]ASI_PST32_S ! Mem[0000000030181410] = 2500000004a2c80c
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 1d58cdff7cd06654, %f6  = 34eb55d8 595f7b80
	ldd	[%i5+%o5],%f6 		! %f6  = 1d58cdff 7cd06654

p0_label_29:
!	Mem[0000000010041408] = ff30a335, %f11 = b782fb51
	lda	[%i1+%o4]0x80,%f11	! %f11 = ff30a335
!	Mem[0000000010181410] = 88b3979e, %l4 = fffffffffffffffa
	ldsba	[%i6+%o5]0x88,%l4	! %l4 = ffffffffffffff9e
!	Mem[0000000030041400] = 4b6c9769, %f0  = 2b0000d6
	lda	[%i1+%g0]0x81,%f0 	! %f0 = 4b6c9769
!	Mem[0000000030141410] = ffffd8e49b4094b8, %f16 = 607aa5ed 524f7702
	ldda	[%i5+%o5]0x81,%f16	! %f16 = ffffd8e4 9b4094b8
!	Mem[0000000010041410] = e4d8ffff, %l2 = 02774f52ee7fe48c
	ldsha	[%i1+%o5]0x80,%l2	! %l2 = ffffffffffffe4d8
!	Mem[0000000030001408] = c3b3a6ff, %l6 = 0000000000004f52
	lduha	[%i0+%o4]0x89,%l6	! %l6 = 000000000000a6ff
!	Mem[000000001010141c] = f06aab63, %l5 = 0000000002774f52
	ldsh	[%i4+0x01c],%l5		! %l5 = fffffffffffff06a
!	Mem[00000000201c0000] = ffff2e73, %l3 = ffffffff883d48fa
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010041414] = 44e48ca9, %l0 = 0c64670f937e93ae
	lduh	[%i1+0x016],%l0		! %l0 = 0000000000008ca9
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000ffff, Mem[0000000010001422] = 56ff861b, %asi = 80
	stba	%l3,[%i0+0x022]%asi	! Mem[0000000010001420] = 56ffff1b

p0_label_30:
!	%f21 = 88b3979e, %f7  = 7cd06654
	fcmps	%fcc1,%f21,%f7 		! %fcc1 = 1
!	Mem[0000000010141438] = be2204bc, %l5 = fffff06a, %l0 = 00008ca9
	add	%i5,0x38,%g1
	casa	[%g1]0x80,%l5,%l0	! %l0 = 00000000be2204bc
!	%f20 = 994a7981 88b3979e, Mem[0000000030001400] = ff30a335 00000000
	stda	%f20,[%i0+%g0]0x81	! Mem[0000000030001400] = 994a7981 88b3979e
!	%l1 = 60098d3821aa51d0, Mem[0000000010001408] = fff9fe23
	stba	%l1,[%i0+%o4]0x80	! Mem[0000000010001408] = d0f9fe23
!	%l7 = ffffffffffffffff, Mem[0000000030081408] = 0671d8ed
	stba	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = 0671d8ff
!	Mem[0000000021800040] = 7afe3fcb, %l5 = fffffffffffff06a
	ldstuba	[%o3+0x040]%asi,%l5	! %l5 = 0000007a000000ff
	membar	#Sync			! Added by membar checker (5)
!	%l2 = ffffffffffffe4d8, Mem[0000000010181410] = 9e97b388
	stwa	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffe4d8
!	%l7 = ffffffffffffffff, Mem[0000000030041410] = 8a33469f3e378b9e
	stxa	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = ffffffffffffffff
!	%l5 = 000000000000007a, Mem[0000000030041410] = ffffffffffffffff
	stxa	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000000000007a
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffea8232, %l1 = 60098d3821aa51d0
	ldsb	[%o2+%g0],%l1		! %l1 = ffffffffffffffff

p0_label_31:
!	Mem[0000000010081438] = 02774f52, %f18 = ae50be0a
	lda	[%i2+0x038]%asi,%f18	! %f18 = 02774f52
!	Mem[0000000010041410] = e4d8ffff, %l1 = ffffffffffffffff
	ldsba	[%i1+%o5]0x80,%l1	! %l1 = ffffffffffffffe4
!	Mem[0000000010081434] = 059fc52e, %l5 = 000000000000007a
	ldswa	[%i2+0x034]%asi,%l5	! %l5 = 00000000059fc52e
!	Mem[0000000030041400] = c865bca769976c4b, %l4 = ffffffffffffff9e
	ldxa	[%i1+%g0]0x89,%l4	! %l4 = c865bca769976c4b
!	Mem[0000000030001410] = ffffffff, %l6 = 000000000000a6ff
	ldsha	[%i0+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101410] = fa9fa2ab, %l4 = c865bca769976c4b
	ldsw	[%i4+%o5],%l4		! %l4 = fffffffffa9fa2ab
!	Mem[0000000030041400] = c865bca7 69976c4b, %l0 = be2204bc, %l1 = ffffffe4
	ldda	[%i1+%g0]0x89,%l0	! %l0 = 0000000069976c4b 00000000c865bca7
!	Mem[0000000010101410] = fa9fa2ab44e48ca9, %l1 = 00000000c865bca7
	ldxa	[%i4+%o5]0x80,%l1	! %l1 = fa9fa2ab44e48ca9
!	%l0 = 0000000069976c4b, %l3 = 000000000000ffff, %y  = 0000036f
	smul	%l0,%l3,%l7		! %l7 = 0000699702b393b5, %y = 00006997
!	Starting 10 instruction Store Burst
!	%l7 = 0000699702b393b5, Mem[0000000010101428] = 904fff24505c22c3, %asi = 80
	stxa	%l7,[%i4+0x028]%asi	! Mem[0000000010101428] = 0000699702b393b5

p0_label_32:
!	%f20 = 994a7981 88b3979e, %l5 = 00000000059fc52e
!	Mem[0000000010081430] = ae6faa42059fc52e
	add	%i2,0x030,%g1
	stda	%f20,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010081430] = ae6faa4281794a99
!	%l2 = ffffffffffffe4d8, Mem[0000000030141408] = 16ef3e4beb283762
	stxa	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffffffffffe4d8
!	Mem[0000000030101408] = 8d7ef7ca, %l6 = ffffffffffffffff
	swapa	[%i4+%o4]0x89,%l6	! %l6 = 000000008d7ef7ca
!	%l7 = 0000699702b393b5, Mem[0000000030081410] = 9f81cc6944e48ca9
	stxa	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000699702b393b5
!	%l1 = fa9fa2ab44e48ca9, Mem[0000000030001408] = c3b3a6ff
	stba	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = c3b3a6a9
!	Mem[00000000201c0001] = ffff2e73, %l7 = 0000699702b393b5
	ldstuba	[%o0+0x001]%asi,%l7	! %l7 = 000000ff000000ff
!	%l5 = 00000000059fc52e, Mem[0000000010081410] = 8affffffec27ada0
	stxa	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000059fc52e
!	Mem[0000000010181400] = 02774f52, %l7 = 00000000000000ff
	ldstuba	[%i6+%g0]0x80,%l7	! %l7 = 00000002000000ff
!	%l4 = fffffffffa9fa2ab, Mem[0000000030101408] = ffffffff
	stwa	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = fa9fa2ab
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 4f520000, %l5 = 00000000059fc52e
	ldswa	[%i4+%o4]0x80,%l5	! %l5 = 000000004f520000

p0_label_33:
!	Mem[0000000010041410] = e4d8ffff 44e48ca9, %l0 = 69976c4b, %l1 = 44e48ca9
	ldd	[%i1+%o5],%l0		! %l0 = 00000000e4d8ffff 0000000044e48ca9
!	Mem[0000000010041410] = e4d8ffff, %l1 = 0000000044e48ca9
	lduba	[%i1+%o5]0x80,%l1	! %l1 = 00000000000000e4
!	Mem[0000000030181410] = 0cc8a20400000025, %f24 = eedc4a31 086b375d
	ldda	[%i6+%o5]0x89,%f24	! %f24 = 0cc8a204 00000025
!	Mem[0000000030041400] = 69976c4b, %f23 = 70ffff14
	lda	[%i1+%g0]0x89,%f23	! %f23 = 69976c4b
!	Mem[0000000030181408] = d600002b, %l3 = 000000000000ffff
	ldswa	[%i6+%o4]0x89,%l3	! %l3 = ffffffffd600002b
!	Mem[0000000010001420] = 56ffff1b, %l7 = 0000000000000002
	ldsw	[%i0+0x020],%l7		! %l7 = 0000000056ffff1b
!	Mem[0000000030081400] = 9e1bdc5969976c4b, %l6 = 000000008d7ef7ca
	ldxa	[%i2+%g0]0x89,%l6	! %l6 = 9e1bdc5969976c4b
!	Mem[0000000021800040] = fffe3fcb, %l7 = 0000000056ffff1b
	ldsb	[%o3+0x041],%l7		! %l7 = fffffffffffffffe
!	Mem[0000000030101410] = 5466d07c, %l6 = 9e1bdc5969976c4b
	lduha	[%i4+%o5]0x81,%l6	! %l6 = 0000000000005466
!	Starting 10 instruction Store Burst
!	%l4 = fa9fa2ab, %l5 = 4f520000, Mem[0000000010101410] = aba29ffa a98ce444
	stda	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = fa9fa2ab 4f520000

p0_label_34:
!	Mem[0000000020800000] = 1fffd27f, %l6 = 0000000000005466
	ldstuba	[%o1+0x000]%asi,%l6	! %l6 = 0000001f000000ff
!	Mem[0000000010081430] = ae6faa42, %l7 = fffffffffffffffe, %asi = 80
	swapa	[%i2+0x030]%asi,%l7	! %l7 = 00000000ae6faa42
!	%f28 = ed9abbca 073a0324, %l1 = 00000000000000e4
!	Mem[0000000010081410] = 00000000059fc52e
	add	%i2,0x010,%g1
	stda	%f28,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010081410] = 00003a0005bb9aed
!	Mem[0000000010041400] = 56ff861b 4407699b ff30a335 b782fb51
!	Mem[0000000010041410] = e4d8ffff 44e48ca9 3409b38f a9dffb51
!	Mem[0000000010041420] = c82a189f e595edb0 6f1d190d db428663
!	Mem[0000000010041430] = f7c2e059 9e791399 425cdb36 5ae7c764
	ldda	[%i1]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	%l0 = e4d8ffff, %l1 = 000000e4, Mem[0000000010001410] = 57cd581d 5466d07c
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = e4d8ffff 000000e4
!	Mem[0000000010181400] = 524f77ff, %l6 = 000000000000001f
	ldstuba	[%i6+%g0]0x88,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000020800041] = 1eae2aff, %l6 = 00000000000000ff
	ldstub	[%o1+0x041],%l6		! %l6 = 000000ae000000ff
!	Mem[0000000030141408] = ffffffff, %l2 = ffffffffffffe4d8
	swapa	[%i5+%o4]0x81,%l2	! %l2 = 00000000ffffffff
!	%l0 = 00000000e4d8ffff, Mem[0000000010181410] = d8e4ffff
	stwa	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = e4d8ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = fff9fe23, %l1 = 00000000000000e4
	lduwa	[%i5+%o4]0x80,%l1	! %l1 = 00000000fff9fe23

p0_label_35:
!	Mem[0000000030101408] = aba29ffa, %l6 = 00000000000000ae
	ldsba	[%i4+%o4]0x81,%l6	! %l6 = ffffffffffffffab
!	Mem[0000000010001410] = ffffd8e4e4000000, %f6  = 1d58cdff 7cd06654
	ldda	[%i0+0x010]%asi,%f6 	! %f6  = ffffd8e4 e4000000
!	Mem[0000000010081410] = 003a0000, %l1 = 00000000fff9fe23
	lduwa	[%i2+%o5]0x88,%l1	! %l1 = 00000000003a0000
!	Mem[0000000010081408] = 93f300ff, %l3 = ffffffffd600002b
	lduwa	[%i2+%o4]0x88,%l3	! %l3 = 0000000093f300ff
!	Mem[0000000010101400] = 809bff80, %l5 = 000000004f520000
	ldsha	[%i4+%g0]0x80,%l5	! %l5 = ffffffffffff809b
!	Mem[0000000010001418] = 0000009e, %l4 = fffffffffa9fa2ab
	ldsha	[%i0+0x01a]%asi,%l4	! %l4 = 000000000000009e
!	Mem[0000000010081408] = 93f300ff, %l2 = 00000000ffffffff
	lduha	[%i2+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081400] = 69976c4b, %l0 = 00000000e4d8ffff
	ldsba	[%i2+%g0]0x89,%l0	! %l0 = 000000000000004b
!	Mem[00000000300c1400] = 16000000, %l7 = 00000000ae6faa42
	lduha	[%i3+%g0]0x81,%l7	! %l7 = 0000000000001600
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = d600002b, %l4 = 000000000000009e
	ldstuba	[%i6+%o4]0x89,%l4	! %l4 = 0000002b000000ff

p0_label_36:
!	Mem[0000000010181408] = aa944a13, %l4 = 000000000000002b
	swapa	[%i6+%o4]0x80,%l4	! %l4 = 00000000aa944a13
!	Mem[0000000030141408] = ffffe4d8, %l5 = ffffffffffff809b
	ldstuba	[%i5+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010081400] = 00000000, %l1 = 00000000003a0000
	swapa	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%l3 = 0000000093f300ff, Mem[0000000030141400] = 00005ea6
	stwa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 93f300ff
!	%l0 = 000000000000004b, %l2 = 00000000000000ff, %l3 = 0000000093f300ff
	xor	%l0,%l2,%l3		! %l3 = 00000000000000b4
!	Mem[0000000010001424] = 4407699b, %l1 = 00000000, %l1 = 00000000
	add	%i0,0x24,%g1
	casa	[%g1]0x80,%l1,%l1	! %l1 = 000000004407699b
!	Mem[0000000010181410] = ffffd8e4, %f15 = 017a3ab0
	lda	[%i6+0x010]%asi,%f15	! %f15 = ffffd8e4
!	%l7 = 0000000000001600, imm = 000000000000025f, %l6 = ffffffffffffffab
	addc	%l7,0x25f,%l6		! %l6 = 000000000000185f
!	Mem[00000000211c0001] = ffea8232, %l6 = 000000000000185f
	ldstuba	[%o2+0x001]%asi,%l6	! %l6 = 000000ea000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ffffffff 883d48fa, %l2 = 000000ff, %l3 = 000000b4
	ldda	[%i0+%o5]0x81,%l2	! %l2 = 00000000ffffffff 00000000883d48fa

p0_label_37:
!	Mem[0000000030181408] = ff0000d6 e530693d, %l0 = 0000004b, %l1 = 4407699b
	ldda	[%i6+%o4]0x81,%l0	! %l0 = 00000000ff0000d6 00000000e530693d
!	%f10 = ff30a335, %f4  = fff9fe23, %f12 = ecd0d1b5
	fmuls	%f10,%f4 ,%f12		! %f12 = fff9fe23
!	Mem[00000000218000c0] = 0ce93437, %l1 = 00000000e530693d
	lduh	[%o3+0x0c0],%l1		! %l1 = 0000000000000ce9
!	Mem[0000000010141404] = 017198bd, %l5 = 00000000000000ff
	lduw	[%i5+0x004],%l5		! %l5 = 00000000017198bd
!	Mem[0000000010141408] = 23fef9ff, %l7 = 0000000000001600
	ldswa	[%i5+%o4]0x88,%l7	! %l7 = 0000000023fef9ff
!	Mem[00000000100c1410] = 1d58cd577cd06654, %l4 = 00000000aa944a13
	ldxa	[%i3+%o5]0x88,%l4	! %l4 = 1d58cd577cd06654
!	Mem[0000000030141410] = e4d8ffff, %f13 = a65e0000
	lda	[%i5+%o5]0x89,%f13	! %f13 = e4d8ffff
!	Mem[0000000030101408] = fa9fa2ab, %l0 = 00000000ff0000d6
	ldsha	[%i4+%o4]0x89,%l0	! %l0 = ffffffffffffa2ab
!	Mem[0000000010181430] = 24033a07, %l4 = 1d58cd577cd06654
	ldub	[%i6+0x031],%l4		! %l4 = 0000000000000003
!	Starting 10 instruction Store Burst
!	%f3  = 0671d8ed, Mem[0000000030141408] = d8e4ffff
	sta	%f3 ,[%i5+%o4]0x89	! Mem[0000000030141408] = 0671d8ed

p0_label_38:
!	Mem[0000000010181410] = ffffd8e4, %l3 = 00000000883d48fa
	swapa	[%i6+%o5]0x80,%l3	! %l3 = 00000000ffffd8e4
!	%l5 = 00000000017198bd, Mem[0000000010181410] = fa483d88
	stba	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = fa483dbd
!	Mem[0000000030001408] = c3b3a6a9, %l7 = 0000000023fef9ff
	ldstuba	[%i0+%o4]0x89,%l7	! %l7 = 000000a9000000ff
!	Mem[00000000211c0000] = ffff8232, %l4 = 0000000000000003
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010041400] = 1b86ff56, %l0 = ffffffffffffa2ab
	ldstuba	[%i1+%g0]0x88,%l0	! %l0 = 00000056000000ff
!	%l4 = 00000000000000ff, Mem[0000000030141400] = 00000000ff00f393
	stxa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000000000ff
!	Mem[0000000030101408] = aba29ffa, %l7 = 00000000000000a9
	ldstuba	[%i4+%o4]0x81,%l7	! %l7 = 000000ab000000ff
!	Mem[0000000010141410] = ffcd581d, %l4 = 00000000000000ff
	ldstuba	[%i5+%o5]0x88,%l4	! %l4 = 0000001d000000ff
!	%l5 = 00000000017198bd, Mem[0000000010181408] = 0000002b
	stha	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 98bd002b
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ffff861b, %l5 = 00000000017198bd
	lduwa	[%i1+%g0]0x80,%l5	! %l5 = 00000000ffff861b

p0_label_39:
!	Mem[0000000010101400] = 809bff8000000071, %f4  = fff9fe23 16ef3e4b
	ldda	[%i4+%g0]0x80,%f4 	! %f4  = 809bff80 00000071
!	Mem[00000000100c1408] = caf77e8d23fef9ff, %f12 = fff9fe23 e4d8ffff
	ldda	[%i3+0x008]%asi,%f12	! %f12 = caf77e8d 23fef9ff
!	Mem[0000000010101410] = aba29ffa, %l2 = 00000000ffffffff
	ldswa	[%i4+%o5]0x80,%l2	! %l2 = ffffffffaba29ffa
!	%l1 = 0000000000000ce9, immed = fffff4e5, %y  = 00006997
	udiv	%l1,-0xb1b,%l4		! %l4 = 0000000000006997
	mov	%l0,%y			! %y = 00000056
!	Mem[0000000010081410] = 00003a00, %l1 = 0000000000000ce9
	lduba	[%i2+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%f19 = b782fb51, %f6  = ffffd8e4, %f26 = 6f1d190d
	fdivs	%f19,%f6 ,%f26		! %f26 = ffffd8e4
!	Mem[0000000030001400] = 994a7981, %l2 = ffffffffaba29ffa
	ldswa	[%i0+%g0]0x81,%l2	! %l2 = ffffffff994a7981
!	Mem[0000000010081400] = 003a0000, %l4 = 0000000000006997
	lduwa	[%i2+%g0]0x80,%l4	! %l4 = 00000000003a0000
!	Mem[0000000010181410] = bd3d48fa81794a99, %f0  = 4b6c9769 69976c4b
	ldda	[%i6+%o5]0x80,%f0 	! %f0  = bd3d48fa 81794a99
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 00000071, %l7 = 00000000000000ab
	ldstuba	[%i3+%o5]0x89,%l7	! %l7 = 00000071000000ff

p0_label_40:
!	%l6 = 00000000000000ea, Mem[0000000010001410] = ffffd8e4e4000000
	stxa	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000000000ea
!	%f11 = ff30a335, Mem[0000000010001408] = d0f9fe23
	sta	%f11,[%i0+%o4]0x80	! Mem[0000000010001408] = ff30a335
!	%l1 = 0000000000000000, Mem[00000000100c1410] = 7cd06654
	stha	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = 7cd00000
!	Mem[000000001004140c] = b782fb51, %l2 = ffffffff994a7981
	lduh	[%i1+0x00c],%l2		! %l2 = 000000000000b782
	membar	#Sync			! Added by membar checker (6)
!	%l5 = 00000000ffff861b, Mem[0000000010041410] = e4d8ffff
	stba	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = 1bd8ffff
!	%l2 = 000000000000b782, Mem[00000000300c1410] = ff0000004f19ac2c
	stxa	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000000000b782
!	%l0 = 0000000000000056, Mem[00000000300c1410] = 00000000
	stha	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000056
!	%l1 = 0000000000000000, Mem[0000000030141408] = edd87106
	stha	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = 00007106
!	%f10 = ff30a335 ff30a335, Mem[0000000010181400] = ff774f52 eda57a60
	stda	%f10,[%i6+0x000]%asi	! Mem[0000000010181400] = ff30a335 ff30a335
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 00000025, %f9  = 88b3979e
	lda	[%i6+%o5]0x89,%f9 	! %f9 = 00000025

p0_label_41:
!	Mem[00000000100c1418] = 56ff861b, %l0 = 0000000000000056
	lduba	[%i3+0x018]%asi,%l0	! %l0 = 0000000000000056
!	Mem[0000000010001410] = ea00000000000000, %f10 = ff30a335 ff30a335
	ldda	[%i0+%o5]0x88,%f10	! %f10 = ea000000 00000000
!	Mem[0000000010141404] = 017198bd, %l2 = 000000000000b782
	lduwa	[%i5+0x004]%asi,%l2	! %l2 = 00000000017198bd
!	Mem[0000000010141404] = 017198bd, %l7 = 0000000000000071
	ldub	[%i5+0x006],%l7		! %l7 = 0000000000000098
!	Mem[0000000010141408] = fff9fe23 8d7ef7ca, %l0 = 00000056, %l1 = 00000000
	ldda	[%i5+%o4]0x80,%l0	! %l0 = 00000000fff9fe23 000000008d7ef7ca
!	Mem[0000000010181408] = 2b00bd98, %l5 = 00000000ffff861b
	lduwa	[%i6+%o4]0x88,%l5	! %l5 = 000000002b00bd98
!	Mem[00000000100c1400] = aa744c29017198bd, %f0  = bd3d48fa 81794a99
	ldda	[%i3+%g0]0x88,%f0 	! %f0  = aa744c29 017198bd
!	Mem[00000000300c1408] = f53cd0d1 0000009e, %l6 = 000000ea, %l7 = 00000098
	ldda	[%i3+%o4]0x89,%l6	! %l6 = 000000000000009e 00000000f53cd0d1
!	Mem[0000000010101410] = aba29ffa, %l7 = 00000000f53cd0d1
	ldsha	[%i4+%o5]0x80,%l7	! %l7 = ffffffffffffaba2
!	Starting 10 instruction Store Burst
!	%l0 = 00000000fff9fe23, Mem[0000000030101408] = fa9fa2ff
	stha	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = fa9ffe23

p0_label_42:
!	%f20 = e4d8ffff, Mem[0000000030141408] = 06710000
	sta	%f20,[%i5+%o4]0x89	! Mem[0000000030141408] = e4d8ffff
!	%l0 = fff9fe23, %l1 = 8d7ef7ca, Mem[00000000100c1408] = caf77e8d 23fef9ff
	stda	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = fff9fe23 8d7ef7ca
!	%f20 = e4d8ffff 44e48ca9, %l0 = 00000000fff9fe23
!	Mem[0000000010101400] = 809bff8000000071
	stda	%f20,[%i4+%l0]ASI_PST32_PL ! Mem[0000000010101400] = a98ce444ffffd8e4
!	%l7 = ffffffffffffaba2, Mem[00000000300c1400] = 00000016
	stba	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000a2
!	%l6 = 000000000000009e, Mem[0000000010041422] = c82a189f
	sth	%l6,[%i1+0x022]		! Mem[0000000010041420] = c82a009e
!	Mem[0000000010041438] = 425cdb36, %l2 = 017198bd, %l2 = 017198bd
	add	%i1,0x38,%g1
	casa	[%g1]0x80,%l2,%l2	! %l2 = 00000000425cdb36
!	Mem[0000000010001400] = 294c74c3, %l7 = ffffffffffffaba2
	swapa	[%i0+%g0]0x88,%l7	! %l7 = 00000000294c74c3
!	%l6 = 000000000000009e, %l6 = 000000000000009e, %l3 = 00000000ffffd8e4
	udivx	%l6,%l6,%l3		! %l3 = 0000000000000001
!	Mem[0000000030081400] = 69976c4b, %l2 = 00000000425cdb36
	ldstuba	[%i2+%g0]0x89,%l2	! %l2 = 0000004b000000ff
!	Starting 10 instruction Load Burst
!	%l2 = 000000000000004b, Mem[0000000021800100] = 69d92afa, %asi = 80
	stha	%l2,[%o3+0x100]%asi	! Mem[0000000021800100] = 004b2afa

p0_label_43:
!	Mem[00000000100c1400] = aa744c29017198bd, %l2 = 000000000000004b
	ldxa	[%i3+%g0]0x88,%l2	! %l2 = aa744c29017198bd
!	Mem[0000000010041400] = ffff861b, %l2 = aa744c29017198bd
	ldsha	[%i1+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1408] = fff9fe238d7ef7ca, %f24 = c82a189f e595edb0
	ldda	[%i3+%o4]0x80,%f24	! %f24 = fff9fe23 8d7ef7ca
!	Mem[00000000100c1410] = 0000d07c57cd581d, %f2  = 69e1928e 0671d8ed
	ldd	[%i3+%o5],%f2 		! %f2  = 0000d07c 57cd581d
!	Mem[0000000030001408] = ffa6b3c3 f1cb4b28, %l6 = 0000009e, %l7 = 294c74c3
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 00000000ffa6b3c3 00000000f1cb4b28
!	Mem[00000000300c1400] = 5ccc6c2b000000a2, %f4  = 809bff80 00000071
	ldda	[%i3+%g0]0x89,%f4 	! %f4  = 5ccc6c2b 000000a2
!	Mem[000000001000143c] = b94fb8c7, %l1 = 000000008d7ef7ca
	ldsh	[%i0+0x03e],%l1		! %l1 = ffffffffffffb8c7
!	Mem[0000000010101400] = a98ce444, %l7 = 00000000f1cb4b28
	ldsba	[%i4+%g0]0x80,%l7	! %l7 = ffffffffffffffa9
!	Mem[0000000030041410] = 0000007a, %l6 = 00000000ffa6b3c3
	ldsha	[%i1+%o5]0x89,%l6	! %l6 = 000000000000007a
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffffff, Mem[0000000010001410] = 00000000
	stha	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000ffff

p0_label_44:
!	Mem[00000000300c1410] = 56000000, %l4 = 00000000003a0000
	swapa	[%i3+%o5]0x81,%l4	! %l4 = 0000000056000000
!	Mem[0000000010041438] = 425cdb36, %l0 = fff9fe23, %l0 = fff9fe23
	add	%i1,0x38,%g1
	casa	[%g1]0x80,%l0,%l0	! %l0 = 00000000425cdb36
!	%l2 = ffffffffffffffff, Mem[0000000010101410] = 4f520000fa9fa2ab
	stxa	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffffffffffffff
!	%l3 = 0000000000000001, Mem[0000000021800180] = 2518ca23, %asi = 80
	stha	%l3,[%o3+0x180]%asi	! Mem[0000000021800180] = 0001ca23
!	Mem[0000000010101424] = 81e00039, %l4 = 0000000056000000
	ldstub	[%i4+0x024],%l4		! %l4 = 00000081000000ff
!	%f18 = ff30a335, Mem[0000000010141410] = ffcd58ff
	sta	%f18,[%i5+%o5]0x88	! Mem[0000000010141410] = ff30a335
!	Mem[0000000010181410] = fa483dbd, %l2 = ffffffffffffffff
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 000000bd000000ff
!	Mem[0000000010101400] = a98ce444, %l1 = ffffffffffffb8c7
	swapa	[%i4+%g0]0x80,%l1	! %l1 = 00000000a98ce444
!	%f19 = b782fb51, %f30 = 425cdb36
	fcmps	%fcc0,%f19,%f30		! %fcc0 = 1
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = fa483dff, %l6 = 000000000000007a
	lduba	[%i6+%o5]0x88,%l6	! %l6 = 00000000000000ff

p0_label_45:
!	Mem[0000000030181410] = 25000000, %l6 = 00000000000000ff
	lduha	[%i6+%o5]0x81,%l6	! %l6 = 0000000000002500
!	Mem[0000000030141408] = ffffd8e4, %l7 = ffffffffffffffa9
	ldsha	[%i5+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000300c1400] = 000000a2, %l5 = 000000002b00bd98
	lduwa	[%i3+%g0]0x89,%l5	! %l5 = 00000000000000a2
!	Mem[0000000010001408] = caf77e8d35a330ff, %f22 = 3409b38f a9dffb51
	ldda	[%i0+%o4]0x88,%f22	! %f22 = caf77e8d 35a330ff
!	%l7 = ffffffffffffffff, imm = 00000000000005cf, %l6 = 0000000000002500
	xor	%l7,0x5cf,%l6		! %l6 = fffffffffffffa30
!	Mem[00000000100c1408] = fff9fe238d7ef7ca, %f30 = 425cdb36 5ae7c764
	ldda	[%i3+%o4]0x80,%f30	! %f30 = fff9fe23 8d7ef7ca
!	Mem[0000000010041410] = ffffd81b, %l4 = 0000000000000081
	ldsba	[%i1+%o5]0x88,%l4	! %l4 = 000000000000001b
!	Mem[0000000010001420] = 56ffff1b4407699b, %f28 = f7c2e059 9e791399
	ldda	[%i0+0x020]%asi,%f28	! %f28 = 56ffff1b 4407699b
!	Mem[0000000010141400] = 71eb05b0, %f26 = ffffd8e4
	lda	[%i5+%g0]0x80,%f26	! %f26 = 71eb05b0
!	Starting 10 instruction Store Burst
!	%l0 = 00000000425cdb36, Mem[0000000010141408] = fff9fe23
	stwa	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 425cdb36

p0_label_46:
!	%f28 = 56ffff1b, Mem[0000000030001400] = 81794a99
	sta	%f28,[%i0+%g0]0x89	! Mem[0000000030001400] = 56ffff1b
!	%l6 = fffffffffffffa30, Mem[0000000010181408] = 98bd002b
	stba	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 30bd002b
!	Mem[0000000030001408] = c3b3a6ff, %l4 = 000000000000001b
	swapa	[%i0+%o4]0x89,%l4	! %l4 = 00000000c3b3a6ff
!	Mem[00000000211c0001] = ffff8232, %l0 = 00000000425cdb36
	ldstub	[%o2+0x001],%l0		! %l0 = 000000ff000000ff
!	Mem[0000000030141400] = ff000000, %l3 = 0000000000000001
	swapa	[%i5+%g0]0x81,%l3	! %l3 = 00000000ff000000
!	%l3 = 00000000ff000000, Mem[0000000030181400] = 00000000
	stwa	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = ff000000
!	Mem[0000000010041438] = 425cdb365ae7c764, %l0 = 00000000000000ff, %l7 = ffffffffffffffff
	add	%i1,0x38,%g1
	casxa	[%g1]0x80,%l0,%l7	! %l7 = 425cdb365ae7c764
!	%l4 = 00000000c3b3a6ff, Mem[0000000030141408] = e4d8ffff
	stwa	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = c3b3a6ff
!	%l4 = 00000000c3b3a6ff, Mem[00000000300c1408] = f53cd0d10000009e
	stxa	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000c3b3a6ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 000000a2, %l7 = 425cdb365ae7c764
	ldswa	[%i3+%g0]0x89,%l7	! %l7 = 00000000000000a2

p0_label_47:
!	Mem[00000000218001c0] = e21a08a6, %l5 = 00000000000000a2
	ldub	[%o3+0x1c0],%l5		! %l5 = 00000000000000e2
!	Mem[0000000010041400] = 1b86ffff, %l7 = 00000000000000a2
	ldsba	[%i1+%g0]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010001430] = aa744c29017198bd, %f14 = 00000000 ffffd8e4
	ldd	[%i0+0x030],%f14	! %f14 = aa744c29 017198bd
!	Mem[0000000030141400] = 00000001, %l1 = 00000000a98ce444
	ldsha	[%i5+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1400] = 5ccc6c2b000000a2, %f14 = aa744c29 017198bd
	ldda	[%i3+%g0]0x89,%f14	! %f14 = 5ccc6c2b 000000a2
!	Mem[0000000030041408] = 88b3979e, %l0 = 00000000000000ff
	ldsha	[%i1+%o4]0x89,%l0	! %l0 = ffffffffffff979e
!	Mem[0000000010181410] = fa483dff, %l3 = 00000000ff000000
	ldsha	[%i6+%o5]0x88,%l3	! %l3 = 0000000000003dff
!	Mem[0000000010081410] = 00003a0005bb9aed, %f4  = 5ccc6c2b 000000a2
	ldda	[%i2+0x010]%asi,%f4 	! %f4  = 00003a00 05bb9aed
!	Mem[0000000010081410] = 00003a00 05bb9aed, %l4 = c3b3a6ff, %l5 = 000000e2
	ldda	[%i2+%o5]0x80,%l4	! %l4 = 0000000000003a00 0000000005bb9aed
!	Starting 10 instruction Store Burst
!	%l6 = fffffa30, %l7 = ffffffff, Mem[0000000010181400] = ff30a335 ff30a335
	stda	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = fffffa30 ffffffff

p0_label_48:
!	Mem[0000000030081408] = ffd87106, %l5 = 0000000005bb9aed
	swapa	[%i2+%o4]0x81,%l5	! %l5 = 00000000ffd87106
!	%l3 = 0000000000003dff, Mem[0000000010181410] = fa483dff
	stwa	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 00003dff
!	Mem[0000000010181430] = 24033a07, %l3 = 0000000000003dff, %asi = 80
	swapa	[%i6+0x030]%asi,%l3	! %l3 = 0000000024033a07
!	%l0 = ffffffffffff979e, Mem[0000000030101410] = 7cd06654
	stha	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 7cd0979e
!	%f10 = ea000000 00000000, %l2 = 00000000000000bd
!	Mem[0000000030181430] = a95b95312678e605
	add	%i6,0x030,%g1
	stda	%f10,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030181430] = 00009531000000ea
!	%l3 = 0000000024033a07, Mem[0000000030141400] = 00000001
	stha	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 3a070001
!	Mem[0000000020800000] = ffffd27f, %l6 = fffffffffffffa30
	ldstuba	[%o1+0x000]%asi,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010041400] = 1b86ffff, %l5 = 00000000ffd87106
	ldstuba	[%i1+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	%f20 = e4d8ffff 44e48ca9, Mem[0000000010141410] = 35a330ff 7cd06654
	stda	%f20,[%i5+%o5]0x80	! Mem[0000000010141410] = e4d8ffff 44e48ca9
!	Starting 10 instruction Load Burst
!	Mem[0000000010141420] = 56ff861b, %l3 = 0000000024033a07
	lduwa	[%i5+0x020]%asi,%l3	! %l3 = 0000000056ff861b

p0_label_49:
!	Mem[0000000010141434] = 84553aa1, %l5 = 00000000000000ff
	ldsba	[%i5+0x037]%asi,%l5	! %l5 = ffffffffffffffa1
!	Mem[0000000030181410] = 00000025, %l0 = ffffffffffff979e
	lduha	[%i6+%o5]0x89,%l0	! %l0 = 0000000000000025
!	Mem[00000000100c1404] = 294c74aa, %l5 = ffffffffffffffa1
	lduha	[%i3+0x006]%asi,%l5	! %l5 = 00000000000074aa
!	Mem[0000000010101410] = ffffffff ffffffff, %l0 = 00000025, %l1 = 00000000
	ldda	[%i4+%o5]0x88,%l0	! %l0 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000010101400] = c7b8ffff, %l1 = 00000000ffffffff
	ldsha	[%i4+%g0]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030101410] = 7cd0979e, %l2 = 00000000000000bd
	lduha	[%i4+%o5]0x89,%l2	! %l2 = 000000000000979e
!	%l1 = ffffffffffffffff, imm = 000000000000040a, %l7 = ffffffffffffffff
	sub	%l1,0x40a,%l7		! %l7 = fffffffffffffbf5
!	Mem[0000000010041418] = 3409b38f, %l0 = 00000000ffffffff
	ldsw	[%i1+0x018],%l0		! %l0 = 000000003409b38f
!	Mem[00000000100c1410] = 0000d07c, %l4 = 0000000000003a00
	lduwa	[%i3+%o5]0x80,%l4	! %l4 = 000000000000d07c
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = ffffffff, %l4 = 000000000000d07c
	swapa	[%i0+%o5]0x81,%l4	! %l4 = 00000000ffffffff

p0_label_50:
!	Mem[0000000010081408] = ff00f393, %l2 = 000000000000979e
	ldstuba	[%i2+%o4]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000100c1410] = 0000d07c, %l7 = fffffffffffffbf5
	ldstuba	[%i3+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001410] = ffff0000, %l3 = 0000000056ff861b
	ldstuba	[%i0+%o5]0x80,%l3	! %l3 = 000000ff000000ff
!	%l0 = 000000003409b38f, Mem[0000000030141408] = c3b3a6ff
	stwa	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 3409b38f
!	%l4 = 00000000ffffffff, Mem[00000000300c1400] = a2000000
	stha	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffff0000
!	Mem[000000001000141f] = 883d48fa, %l4 = 00000000ffffffff
	ldstuba	[%i0+0x01f]%asi,%l4	! %l4 = 000000fa000000ff
!	%f6  = ffffd8e4 e4000000, Mem[0000000030081410] = 02b393b5 00006997
	stda	%f6 ,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffd8e4 e4000000
!	%l6 = 00000000000000ff, immd = 000000000000082e, %l1 = ffffffffffffffff
	udivx	%l6,0x82e,%l1		! %l1 = 0000000000000000
!	%l5 = 00000000000074aa, Mem[0000000030101400] = 017198bd
	stha	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 017174aa
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 88b3979e, %l3 = 00000000000000ff
	lduha	[%i1+%o4]0x89,%l3	! %l3 = 000000000000979e

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	fsubs	%f8,%f4,%f9
	fdivs	%f0,%f8,%f2
	xnor	%l1,%l5,%l5
	addc	%l1,%l4,%l1
	addc	%l5,%l6,%l7
	andn	%l3,%l6,%l3
	stda	%l6,[%i6+0x010]%asi
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 000000003409b38f
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 000000000000979e
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000000000fa
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000000074aa
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x00000056,%g2
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
	cmp	%l0,%l1			! %f0  should be aa744c29 017198bd
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 0000d07c 57cd581d
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00003a00 05bb9aed
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be ffffd8e4 e4000000
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be d5cb0000 00000025
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be ea000000 00000000
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be caf77e8d 23fef9ff
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 5ccc6c2b 000000a2
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 56ff861b 4407699b
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be ff30a335 b782fb51
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be e4d8ffff 44e48ca9
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be caf77e8d 35a330ff
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be fff9fe23 8d7ef7ca
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 71eb05b0 db428663
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 56ffff1b 4407699b
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be fff9fe23 8d7ef7ca
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
	smul	%l1,%l4,%l2
	fsubs	%f3 ,%f8 ,%f5 
	sub	%l4,%l2,%l6
	fmuls	%f8 ,%f5 ,%f13
	subc	%l7,%l0,%l4
	done

p0_trap1o:
	smul	%l1,%l4,%l2
	fsubs	%f3 ,%f8 ,%f5 
	sub	%l4,%l2,%l6
	fmuls	%f8 ,%f5 ,%f13
	subc	%l7,%l0,%l4
	done


p0_trap2e:
	sub	%l0,%l7,%l3
	done

p0_trap2o:
	sub	%l0,%l7,%l3
	done


p0_trap3e:
	or	%l5,-0x73f,%l4
	or	%l7,%l4,%l2
	xnor	%l1,0xb6c,%l4
	xor	%l0,%l1,%l7
	addc	%l0,%l0,%l0
	done

p0_trap3o:
	or	%l5,-0x73f,%l4
	or	%l7,%l4,%l2
	xnor	%l1,0xb6c,%l4
	xor	%l0,%l1,%l7
	addc	%l0,%l0,%l0
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
	ldx	[%g1+0x000],%l0		! %l0 = 66ab53b830a8b0c7
	ldx	[%g1+0x008],%l1		! %l1 = f3b420725df7f72c
	ldx	[%g1+0x010],%l2		! %l2 = 62e740a633d2fe4b
	ldx	[%g1+0x018],%l3		! %l3 = 9c33bf46fbaedc75
	ldx	[%g1+0x020],%l4		! %l4 = d9078b9fcb62b76c
	ldx	[%g1+0x028],%l5		! %l5 = 93c9be6bf0c41a4e
	ldx	[%g1+0x030],%l6		! %l6 = bf7b8d1a9e303068
	ldx	[%g1+0x038],%l7		! %l7 = 9ef1a489e9db7b3c

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
	smul	%l1,%l4,%l2
	fsubs	%f3 ,%f8 ,%f5 
	sub	%l4,%l2,%l6
	fmuls	%f8 ,%f5 ,%f13
	jmpl	%o7,%g0
	fsqrts	%f0 ,%f10
p0_near_0_he:
	jmpl	%o7,%g0
	mulx	%l3,%l1,%l7
	jmpl	%o7,%g0
	nop
near0_b2b_h:
	or	%l5,-0xd0e,%l6
	jmpl	%o7,%g0
	or	%l7,%l4,%l2
near0_b2b_l:
	or	%l5,%l1,%l4
	jmpl	%o7,%g0
	xnor	%l1,0xb6c,%l4
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	smul	%l6,%l7,%l0
	andn	%l1,0x2a0,%l4
	xnor	%l5,0x338,%l6
	addc	%l0,-0x7e7,%l6
	or	%l3,%l2,%l3
	jmpl	%o7,%g0
	sdivx	%l6,%l4,%l5
p0_near_1_he:
	and	%l5,%l2,%l3
	fdivs	%f18,%f31,%f25
	sub	%l3,-0x4e7,%l1
	jmpl	%o7,%g0
	fmuls	%f28,%f30,%f30
near1_b2b_h:
	xnor	%l7,%l1,%l5
	add	%l5,%l6,%l1
	or	%l7,-0x955,%l4
	and	%l6,%l4,%l2
	fcmps	%fcc0,%f25,%f18
	xnor	%l3,-0x251,%l5
	or	%l4,%l3,%l5
	jmpl	%o7,%g0
	fsubs	%f31,%f31,%f23
near1_b2b_l:
	fdtoi	%f0 ,%f6 
	fsubs	%f9 ,%f0 ,%f7 
	fadds	%f0 ,%f9 ,%f7 
	subc	%l3,%l3,%l7
	umul	%l6,0x6b0,%l2
	umul	%l5,0xfd5,%l0
	smul	%l1,%l0,%l0
	jmpl	%o7,%g0
	fsubs	%f9 ,%f15,%f0 
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	fcmps	%fcc0,%f5 ,%f11
	mulx	%l6,%l6,%l2
	sdivx	%l3,-0xb8a,%l3
	smul	%l6,-0x284,%l1
	ldd	[%i6+0x028],%f14	! Mem[0000000010181428]
	jmpl	%o7,%g0
	xnor	%l4,%l1,%l4
p0_near_2_he:
	sdivx	%l3,-0x289,%l7
	add	%l3,%l0,%l5
	jmpl	%o7,%g0
	umul	%l1,0x23d,%l4
near2_b2b_h:
	xor	%l4,0x30a,%l6
	jmpl	%o7,%g0
	or	%l4,-0x2a1,%l0
near2_b2b_l:
	mulx	%l6,%l5,%l6
	jmpl	%o7,%g0
	smul	%l1,0x0ed,%l6
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	sdivx	%l0,%l6,%l6
	jmpl	%o7,%g0
	mulx	%l4,0xdaf,%l4
p0_near_3_he:
	sub	%l3,%l1,%l0
	fadds	%f17,%f30,%f16
	fmuls	%f25,%f26,%f22
	fdivs	%f23,%f27,%f22
	andn	%l4,-0x8e0,%l7
	fcmps	%fcc1,%f26,%f30
	sth	%l0,[%i5+0x02e]		! Mem[000000001014142e]
	jmpl	%o7,%g0
	fdivs	%f30,%f20,%f31
near3_b2b_h:
	fsubs	%f16,%f31,%f31
	mulx	%l3,%l7,%l3
	xor	%l3,0xd0a,%l5
	jmpl	%o7,%g0
	orn	%l1,0x60f,%l4
near3_b2b_l:
	fadds	%f15,%f14,%f0 
	fmuls	%f5 ,%f4 ,%f15
	fsubs	%f2 ,%f2 ,%f14
	jmpl	%o7,%g0
	fadds	%f2 ,%f1 ,%f11
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	addc	%l0,%l1,%l0
	or	%l6,0xf90,%l0
	jmpl	%o7,%g0
	xnor	%l5,0x773,%l0
p0_far_0_lem:
	addc	%l0,%l1,%l0
	or	%l6,0xf90,%l0
	jmpl	%o7,%g0
	xnor	%l5,0x773,%l0
p0_far_0_he:
	xor	%l1,0xed4,%l0
	umul	%l0,-0x698,%l7
	fmuls	%f30,%f30,%f24
	jmpl	%o7,%g0
	xor	%l2,%l4,%l3
p0_far_0_hem:
	xor	%l1,0xed4,%l0
	umul	%l0,-0x698,%l7
	fmuls	%f30,%f30,%f24
	jmpl	%o7,%g0
	xor	%l2,%l4,%l3
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	mulx	%l6,%l7,%l6
	orn	%l6,%l5,%l6
	sdivx	%l3,-0x782,%l7
	udivx	%l4,-0x8dc,%l3
	subc	%l3,%l5,%l2
	addc	%l4,%l1,%l1
	sdivx	%l4,%l3,%l2
	jmpl	%o7,%g0
	xnor	%l7,0x668,%l5
far0_b2b_l:
	andn	%l4,%l3,%l0
	add	%l7,0x558,%l7
	orn	%l1,0xa9b,%l2
	umul	%l7,-0x403,%l2
	andn	%l4,%l3,%l0
	fadds	%f14,%f15,%f4 
	fdivs	%f8 ,%f7 ,%f4 
	jmpl	%o7,%g0
	fdivs	%f8 ,%f3 ,%f7 
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	jmpl	%o7,%g0
	fadds	%f14,%f15,%f4 
	jmpl	%o7,%g0
	nop
p0_far_1_lem:
	jmpl	%o7,%g0
	fadds	%f14,%f15,%f4 
	jmpl	%o7,%g0
	nop
p0_far_1_he:
	stw	%l7,[%i0+0x014]		! Mem[0000000010001414]
	fstod	%f19,%f16
	sub	%l2,0x111,%l6
	fsqrts	%f17,%f26
	swap	[%i4+0x024],%l4		! Mem[0000000010101424]
	udivx	%l1,0xb3c,%l6
	jmpl	%o7,%g0
	subc	%l1,%l0,%l2
p0_far_1_hem:
	membar	#Sync
	stw	%l7,[%i0+0x014]		! Mem[0000000010001414]
	fstod	%f19,%f16
	sub	%l2,0x111,%l6
	fsqrts	%f17,%f26
	swap	[%i4+0x024],%l4		! Mem[0000000010101424]
	udivx	%l1,0xb3c,%l6
	jmpl	%o7,%g0
	subc	%l1,%l0,%l2
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	sdivx	%l7,%l4,%l5
	fitod	%f22,%f30
	smul	%l7,%l3,%l0
	fsubs	%f23,%f24,%f20
	jmpl	%o7,%g0
	and	%l7,0x42b,%l4
far1_b2b_l:
	or	%l5,%l3,%l3
	add	%l5,%l5,%l6
	xnor	%l4,%l3,%l4
	subc	%l7,-0xccc,%l5
	jmpl	%o7,%g0
	andn	%l6,-0x804,%l6
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	fcmps	%fcc0,%f12,%f4 
	jmpl	%o7,%g0
	fdivs	%f4 ,%f13,%f9 
p0_far_2_lem:
	fcmps	%fcc0,%f12,%f4 
	jmpl	%o7,%g0
	fdivs	%f4 ,%f13,%f9 
p0_far_2_he:
	jmpl	%o7,%g0
	mulx	%l0,%l0,%l5
	jmpl	%o7,%g0
	nop
p0_far_2_hem:
	jmpl	%o7,%g0
	mulx	%l0,%l0,%l5
	jmpl	%o7,%g0
	nop
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	fsubs	%f25,%f27,%f27
	fmuls	%f24,%f18,%f18
	fadds	%f19,%f27,%f19
	xor	%l0,%l5,%l3
	jmpl	%o7,%g0
	subc	%l2,%l0,%l4
far2_b2b_l:
	fadds	%f0 ,%f0 ,%f12
	udivx	%l2,-0xff9,%l7
	fmuls	%f0 ,%f8 ,%f15
	andn	%l0,%l0,%l4
	jmpl	%o7,%g0
	sdivx	%l3,%l4,%l3
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	sub	%l5,0x17d,%l4
	add	%l5,%l4,%l7
	xor	%l1,-0x3a0,%l1
	smul	%l5,%l0,%l0
	jmpl	%o7,%g0
	fdivs	%f8 ,%f7 ,%f10
p0_far_3_lem:
	sub	%l5,0x17d,%l4
	add	%l5,%l4,%l7
	xor	%l1,-0x3a0,%l1
	smul	%l5,%l0,%l0
	jmpl	%o7,%g0
	fdivs	%f8 ,%f7 ,%f10
p0_far_3_he:
	sdivx	%l0,%l7,%l5
	sdivx	%l4,%l2,%l5
	or	%l7,%l6,%l7
	jmpl	%o7,%g0
	mulx	%l0,0x2eb,%l1
p0_far_3_hem:
	sdivx	%l0,%l7,%l5
	sdivx	%l4,%l2,%l5
	or	%l7,%l6,%l7
	jmpl	%o7,%g0
	mulx	%l0,0x2eb,%l1
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	andn	%l4,0xeb3,%l6
	jmpl	%o7,%g0
	fmuls	%f24,%f17,%f29
far3_b2b_l:
	addc	%l3,0x3bc,%l7
	jmpl	%o7,%g0
	sub	%l0,%l3,%l4
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	smul	%l2,0x9fd,%l6
	ldsw	[%i6+0x014],%l3		! Mem[0000000010181414]
	xnor	%l4,-0x3dd,%l5
	addc	%l7,%l7,%l2
	jmpl	%g6+8,%g0
	fsubs	%f15,%f9 ,%f14
p0_call_0_le:
	sub	%l2,-0x564,%l3
	subc	%l2,0xe84,%l5
	fdivs	%f10,%f0 ,%f11
	xnor	%l7,0x999,%l1
	fsubs	%f7 ,%f4 ,%f5 
	retl
	subc	%l7,%l6,%l3
p0_jmpl_0_lo:
	smul	%l2,0x9fd,%l6
	ldsw	[%o6+0x014],%l3		! Mem[0000000010181414]
	xnor	%l4,-0x3dd,%l5
	addc	%l7,%l7,%l2
	jmpl	%g6+8,%g0
	fsubs	%f15,%f9 ,%f14
p0_call_0_lo:
	sub	%l2,-0x564,%l3
	subc	%l2,0xe84,%l5
	fdivs	%f10,%f0 ,%f11
	xnor	%l7,0x999,%l1
	fsubs	%f7 ,%f4 ,%f5 
	retl
	subc	%l7,%l6,%l3
p0_jmpl_0_he:
	addc	%l3,0x7ce,%l6
	xor	%l5,0x111,%l7
	ldx	[%i1+0x000],%l4		! Mem[0000000010041400]
	mulx	%l6,%l7,%l1
	sub	%l3,%l0,%l6
	fsubs	%f23,%f22,%f24
	and	%l2,-0x102,%l3
	jmpl	%g6+8,%g0
	fadds	%f16,%f21,%f23
p0_call_0_he:
	umul	%l0,%l4,%l5
	retl
	addc	%l2,-0x4a6,%l4
p0_jmpl_0_ho:
	addc	%l3,0x7ce,%l6
	xor	%l5,0x111,%l7
	ldx	[%o1+0x000],%l4		! Mem[0000000010041400]
	mulx	%l6,%l7,%l1
	sub	%l3,%l0,%l6
	fsubs	%f23,%f22,%f24
	and	%l2,-0x102,%l3
	jmpl	%g6+8,%g0
	fadds	%f16,%f21,%f23
p0_call_0_ho:
	umul	%l0,%l4,%l5
	retl
	addc	%l2,-0x4a6,%l4
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	xor	%l1,0xdc8,%l7
	umul	%l6,%l7,%l4
	jmpl	%g6+8,%g0
	fdivs	%f1 ,%f4 ,%f4 
p0_call_1_le:
	umul	%l6,0x130,%l0
	addc	%l6,-0x296,%l6
	xor	%l6,-0x2ec,%l3
	fadds	%f0 ,%f10,%f10
	std	%f4 ,[%i4+0x020]	! Mem[0000000010101420]
	smul	%l3,-0x712,%l6
	retl
	orn	%l4,0xb92,%l1
p0_jmpl_1_lo:
	xor	%l1,0xdc8,%l7
	umul	%l6,%l7,%l4
	jmpl	%g6+8,%g0
	fdivs	%f1 ,%f4 ,%f4 
p0_call_1_lo:
	umul	%l6,0x130,%l0
	addc	%l6,-0x296,%l6
	xor	%l6,-0x2ec,%l3
	fadds	%f0 ,%f10,%f10
	std	%f4 ,[%o4+0x020]	! Mem[0000000010101420]
	smul	%l3,-0x712,%l6
	retl
	orn	%l4,0xb92,%l1
p0_jmpl_1_he:
	sth	%l2,[%i0+0x032]		! Mem[0000000010001432]
	smul	%l7,-0x6d2,%l3
	udivx	%l2,0x6c3,%l0
	xnor	%l3,%l6,%l6
	sdivx	%l6,%l2,%l5
	and	%l1,-0x967,%l2
	sub	%l3,%l5,%l5
	jmpl	%g6+8,%g0
	fdivs	%f23,%f20,%f24
p0_call_1_he:
	fcmps	%fcc3,%f22,%f25
	fsubs	%f16,%f19,%f27
	xor	%l4,%l7,%l4
	ldsb	[%i1+0x03b],%l0		! Mem[000000001004143b]
	xor	%l5,0x13f,%l4
	xor	%l7,%l0,%l5
	retl
	orn	%l5,%l4,%l1
p0_jmpl_1_ho:
	sth	%l2,[%o0+0x032]		! Mem[0000000010001432]
	smul	%l7,-0x6d2,%l3
	udivx	%l2,0x6c3,%l0
	xnor	%l3,%l6,%l6
	sdivx	%l6,%l2,%l5
	and	%l1,-0x967,%l2
	sub	%l3,%l5,%l5
	jmpl	%g6+8,%g0
	fdivs	%f23,%f20,%f24
p0_call_1_ho:
	fcmps	%fcc3,%f22,%f25
	fsubs	%f16,%f19,%f27
	xor	%l4,%l7,%l4
	ldsb	[%o1+0x03b],%l0		! Mem[000000001004143b]
	xor	%l5,0x13f,%l4
	xor	%l7,%l0,%l5
	retl
	orn	%l5,%l4,%l1
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	ldstub	[%i6+0x011],%l2		! Mem[0000000010181411]
	xnor	%l1,-0x3d3,%l2
	orn	%l4,0xa0b,%l4
	jmpl	%g6+8,%g0
	fsubs	%f9 ,%f4 ,%f13
p0_call_2_le:
	subc	%l1,-0x0bc,%l1
	fdivs	%f4 ,%f11,%f5 
	retl
	fdivs	%f5 ,%f12,%f9 
p0_jmpl_2_lo:
	ldstub	[%o6+0x011],%l2		! Mem[0000000010181411]
	xnor	%l1,-0x3d3,%l2
	orn	%l4,0xa0b,%l4
	jmpl	%g6+8,%g0
	fsubs	%f9 ,%f4 ,%f13
p0_call_2_lo:
	subc	%l1,-0x0bc,%l1
	fdivs	%f4 ,%f11,%f5 
	retl
	fdivs	%f5 ,%f12,%f9 
p0_jmpl_2_he:
	sub	%l6,%l1,%l6
	or	%l1,-0x1e2,%l1
	orn	%l5,-0xf07,%l5
	addc	%l3,0x91f,%l3
	fmuls	%f18,%f18,%f21
	udivx	%l1,%l5,%l2
	add	%l4,%l0,%l6
	jmpl	%g6+8,%g0
	fdivs	%f30,%f21,%f22
p0_call_2_he:
	fcmps	%fcc1,%f17,%f23
	sub	%l5,%l2,%l1
	add	%l7,%l2,%l5
	orn	%l7,0xb6b,%l2
	fsubs	%f28,%f27,%f30
	and	%l1,%l1,%l4
	add	%l2,0x886,%l5
	retl
	fcmps	%fcc2,%f26,%f25
p0_jmpl_2_ho:
	sub	%l6,%l1,%l6
	or	%l1,-0x1e2,%l1
	orn	%l5,-0xf07,%l5
	addc	%l3,0x91f,%l3
	fmuls	%f18,%f18,%f21
	udivx	%l1,%l5,%l2
	add	%l4,%l0,%l6
	jmpl	%g6+8,%g0
	fdivs	%f30,%f21,%f22
p0_call_2_ho:
	fcmps	%fcc1,%f17,%f23
	sub	%l5,%l2,%l1
	add	%l7,%l2,%l5
	orn	%l7,0xb6b,%l2
	fsubs	%f28,%f27,%f30
	and	%l1,%l1,%l4
	add	%l2,0x886,%l5
	retl
	fcmps	%fcc2,%f26,%f25
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	xnor	%l3,-0x570,%l6
	fdivs	%f6 ,%f14,%f5 
	fsqrts	%f13,%f10
	fsubs	%f2 ,%f6 ,%f0 
	udivx	%l2,%l0,%l2
	sub	%l1,-0x4a5,%l4
	jmpl	%g6+8,%g0
	orn	%l5,0xd1f,%l1
p0_call_3_le:
	and	%l7,%l1,%l5
	fdivs	%f11,%f11,%f3 
	add	%l0,-0xb27,%l2
	retl
	sub	%l5,%l7,%l1
p0_jmpl_3_lo:
	xnor	%l3,-0x570,%l6
	fdivs	%f6 ,%f14,%f5 
	fsqrts	%f13,%f10
	fsubs	%f2 ,%f6 ,%f0 
	udivx	%l2,%l0,%l2
	sub	%l1,-0x4a5,%l4
	jmpl	%g6+8,%g0
	orn	%l5,0xd1f,%l1
p0_call_3_lo:
	and	%l7,%l1,%l5
	fdivs	%f11,%f11,%f3 
	add	%l0,-0xb27,%l2
	retl
	sub	%l5,%l7,%l1
p0_jmpl_3_he:
	and	%l3,0x9eb,%l0
	and	%l7,%l0,%l6
	and	%l4,0x634,%l6
	mulx	%l6,%l5,%l3
	sdivx	%l1,-0xe86,%l3
	fsubs	%f21,%f23,%f25
	jmpl	%g6+8,%g0
	mulx	%l1,%l5,%l2
p0_call_3_he:
	fmuls	%f18,%f19,%f19
	addc	%l6,%l5,%l0
	fitos	%f31,%f24
	fdivs	%f30,%f25,%f17
	fcmps	%fcc1,%f18,%f21
	fsubs	%f22,%f29,%f31
	andn	%l2,0x96f,%l7
	retl
	add	%l4,%l2,%l7
p0_jmpl_3_ho:
	and	%l3,0x9eb,%l0
	and	%l7,%l0,%l6
	and	%l4,0x634,%l6
	mulx	%l6,%l5,%l3
	sdivx	%l1,-0xe86,%l3
	fsubs	%f21,%f23,%f25
	jmpl	%g6+8,%g0
	mulx	%l1,%l5,%l2
p0_call_3_ho:
	fmuls	%f18,%f19,%f19
	addc	%l6,%l5,%l0
	fitos	%f31,%f24
	fdivs	%f30,%f25,%f17
	fcmps	%fcc1,%f18,%f21
	fsubs	%f22,%f29,%f31
	andn	%l2,0x96f,%l7
	retl
	add	%l4,%l2,%l7
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
	.word	0x66ab53b8,0x30a8b0c7		! Init value for %l0
	.word	0xf3b42072,0x5df7f72c		! Init value for %l1
	.word	0x62e740a6,0x33d2fe4b		! Init value for %l2
	.word	0x9c33bf46,0xfbaedc75		! Init value for %l3
	.word	0xd9078b9f,0xcb62b76c		! Init value for %l4
	.word	0x93c9be6b,0xf0c41a4e		! Init value for %l5
	.word	0xbf7b8d1a,0x9e303068		! Init value for %l6
	.word	0x9ef1a489,0xe9db7b3c		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x9e1bdc59,0x69976c4b		! Init value for %f0 
	.word	0x69e1928e,0x0671d8ed		! Init value for %f2 
	.word	0x6f6c4f9d,0x9c7cd870		! Init value for %f4 
	.word	0x3eceb9fd,0x96428ade		! Init value for %f6 
	.word	0xce932fdd,0xfc7c934a		! Init value for %f8 
	.word	0xfaffbeba,0xf2a1c102		! Init value for %f10
	.word	0xecd0d1b5,0x7084f5fc		! Init value for %f12
	.word	0x24c763bb,0xe498d7e4		! Init value for %f14
	.word	0x8430a335,0xb782fb51		! Init value for %f16
	.word	0x9ede5b8f,0x81794a99		! Init value for %f18
	.word	0x08b1eb20,0xe665809a		! Init value for %f20
	.word	0xdb3e31c6,0x0450166c		! Init value for %f22
	.word	0xe3d600e8,0xabf4bad9		! Init value for %f24
	.word	0xe211d49c,0x7578155b		! Init value for %f26
	.word	0x4460d4a2,0x816743af		! Init value for %f28
	.word	0xd15e3bf5,0x8d87e153		! Init value for %f30
	.word	0x35ae85c4,0x8542d0ed		! Init value for %f32
	.word	0xd85febe2,0x03f1cd7f		! Init value for %f34
	.word	0x9adc830f,0x0d1b71df		! Init value for %f36
	.word	0x50665c11,0xb105d759		! Init value for %f38
	.word	0xb25adba2,0x25a69ddc		! Init value for %f40
	.word	0x7e420fee,0x5d959230		! Init value for %f42
	.word	0x2f50eb2f,0x1dcbee0e		! Init value for %f44
	.word	0xb7f5eaf4,0x08c4370e		! Init value for %f46
	.word	0x356eb805,0x0b38bc0b
	.word	0x0393a581,0x1b68d1e9
	.word	0x2d927aa3,0xf25c5b46
	.word	0x34e2ce94,0x1270c18e
	.word	0x17140832,0x351898b5
	.word	0x1e724be1,0x2090c690
	.word	0x29887665,0x9e922195
	.word	0x429e8d00,0x63cb2931
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
	.word	0x00000000,0x3409b38f
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x0000979e
	.word	0x00000000,0x000000fa
	.word	0x00000000,0x000074aa
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x00000000
p0_expected_fp_regs:
	.word	0xaa744c29,0x017198bd
	.word	0x0000d07c,0x57cd581d
	.word	0x00003a00,0x05bb9aed
	.word	0xffffd8e4,0xe4000000
	.word	0xd5cb0000,0x00000025
	.word	0xea000000,0x00000000
	.word	0xcaf77e8d,0x23fef9ff
	.word	0x5ccc6c2b,0x000000a2
	.word	0x56ff861b,0x4407699b
	.word	0xff30a335,0xb782fb51
	.word	0xe4d8ffff,0x44e48ca9
	.word	0xcaf77e8d,0x35a330ff
	.word	0xfff9fe23,0x8d7ef7ca
	.word	0x71eb05b0,0xdb428663
	.word	0x56ffff1b,0x4407699b
	.word	0xfff9fe23,0x8d7ef7ca
	.word	0x00000001,0x00000400		! %fsr = 0000000100000400
p0_local0_expect:
	.word	0xa2abffff,0x017198bd
	.word	0xff30a335,0x8d7ef7ca
	.word	0xffff0000,0x000000ea
	.word	0x0000009e,0x883d48ff
	.word	0x56ffff1b,0x4407699b
	.word	0xccf9467b,0x71eb05b0
	.word	0xaa744c29,0x017198bd
	.word	0x00000000,0xb94fb8c7
p0_local0_sec_expect:
	.word	0x1bffff56,0x88b3979e
	.word	0x1b000000,0xf1cb4b28
	.word	0x0000d07c,0x883d48fa
	.word	0xe019cd48,0x48c91d46
	.word	0xca422b55,0xe8a85632
	.word	0x855e16f0,0x7e0c8011
	.word	0x95735daf,0x8b0bb48b
	.word	0xddb78644,0x349676b0
p0_local1_expect:
	.word	0xffff861b,0x4407699b
	.word	0xff30a335,0xb782fb51
	.word	0x1bd8ffff,0x44e48ca9
	.word	0x3409b38f,0xa9dffb51
	.word	0xc82a009e,0xe595edb0
	.word	0x6f1d190d,0xdb428663
	.word	0xf7c2e059,0x9e791399
	.word	0x425cdb36,0x5ae7c764
p0_local1_sec_expect:
	.word	0x4b6c9769,0xa7bc65c8
	.word	0x9e97b388,0xecc5ea83
	.word	0x7a000000,0x00000000
	.word	0x6dad841c,0xe8204b12
	.word	0x173a8631,0xddd559eb
	.word	0xeb791c24,0xd8c5ef3b
	.word	0x824747dc,0x31cfabbb
	.word	0x985e8d1e,0x937a6ba0
p0_local2_expect:
	.word	0x003a0000,0x00000071
	.word	0xff00f393,0x9bee79b5
	.word	0x00003a00,0x05bb9aed
	.word	0xd37c9082,0xc5012207
	.word	0x71d2d556,0x60c58732
	.word	0xc96e3280,0x588d6f58
	.word	0xfffffffe,0x81794a99
	.word	0x02774f52,0xee7fe48c
p0_local2_sec_expect:
	.word	0xff6c9769,0x59dc1b9e
	.word	0x05bb9aed,0x8e92e169
	.word	0x000000e4,0xe4d8ffff
	.word	0x807b5f59,0xd855eb34
	.word	0x9e97b388,0x0000cbd5
	.word	0x0f97c9fc,0x2b6ccc5c
	.word	0x00005ea6,0xb5d1d0ec
	.word	0xb03a7a01,0x00000000
p0_local3_expect:
	.word	0xbd987101,0x294c74aa
	.word	0xfff9fe23,0x8d7ef7ca
	.word	0xff00d07c,0x57cd581d
	.word	0x56ff861b,0x4407699b
	.word	0x9b690744,0x1b86ff56
	.word	0xb005eb71,0x5466d07c
	.word	0xffeed72b,0xd5a0b781
	.word	0xc7b84fb9,0xb782fb51
p0_local3_sec_expect:
	.word	0xffff0000,0x2b6ccc5c
	.word	0xffa6b3c3,0x00000000
	.word	0x003a0000,0x0000b782
	.word	0xf2c37ba9,0x91e4e4c6
	.word	0xce9e879c,0x6c6c74a8
	.word	0xdb9d47b8,0x2eb6a492
	.word	0xdced11d7,0xb83eb05b
	.word	0xc2010254,0x5cde8129
p0_local4_expect:
	.word	0xffffb8c7,0xffffd8e4
	.word	0x4f520000,0x00000000
	.word	0xffffffff,0xffffffff
	.word	0x0a11cf8c,0xf06aab63
	.word	0xf2af9a9e,0xffe00039
	.word	0x00006997,0x02b393b5
	.word	0x384137fe,0x31ce1829
	.word	0xf4217e1c,0xf1b54a53
p0_local4_sec_expect:
	.word	0xaa747101,0x294c74aa
	.word	0x23fe9ffa,0x23fef9ff
	.word	0x9e97d07c,0x57cd581d
	.word	0x9913799e,0x59e0c2f7
	.word	0x9b690744,0x1b86ff56
	.word	0xb005eb71,0x5466d07c
	.word	0xffeed72b,0xd5a0b781
	.word	0xc7b84fb9,0xbc0422be
p0_local5_expect:
	.word	0x71eb05b0,0x017198bd
	.word	0x425cdb36,0x8d7ef7ca
	.word	0xe4d8ffff,0x44e48ca9
	.word	0x7404ec24,0x984a0952
	.word	0x56ff861b,0x4407699b
	.word	0xccf9467b,0x71eb05b0
	.word	0x35a330ff,0x84553aa1
	.word	0xbe2204bc,0x65c8b8c7
p0_local5_sec_expect:
	.word	0x3a070001,0x00000000
	.word	0x8fb30934,0xffffe4d8
	.word	0xffffd8e4,0x9b4094b8
	.word	0x8120e8c2,0xa6217e46
	.word	0x37fa06f0,0xabd68994
	.word	0xba6c91f6,0xcc52323c
	.word	0x672d6400,0x7f0ef815
	.word	0x8e5c5aeb,0x57ff1701
p0_local6_expect:
	.word	0xfffffa30,0xffffffff
	.word	0x30bd002b,0x0abe50ae
	.word	0xff3d0000,0x81794a99
	.word	0x14ffff70,0xffb3fff9
	.word	0x5d376b08,0x314adcee
	.word	0x00000000,0x0000004f
	.word	0x00003dff,0xcabb9aed
	.word	0xfd5fc11b,0x4164d557
p0_local6_sec_expect:
	.word	0xff000000,0x00000000
	.word	0xff0000d6,0xe530693d
	.word	0x25000000,0x04a2c80c
	.word	0x54f91723,0x8d7e4e12
	.word	0x18574c10,0x1c67d1a9
	.word	0xb563902b,0xa9024630
	.word	0x00009531,0x000000ea
	.word	0xf01236cc,0xa81fe1a8
share0_expect:
	.word	0xffff2e73,0x46751146
	.word	0x530d2526,0x3f0d2ffe
	.word	0x457abb80,0x3bfaa1b3
	.word	0x65e2e88e,0xaa881f2e
	.word	0x93ae2846,0xab044e7e
	.word	0x82c407ca,0x1ff8ae23
	.word	0x734c7dcc,0xe3f93967
	.word	0x827ba4c5,0x7699ac97
share1_expect:
	.word	0xffffd27f,0x20a87c05
	.word	0x1d95a0a1,0x8f578ba9
	.word	0xbdd4daad,0x7f0a4f05
	.word	0x64229f22,0x6530e3b9
	.word	0x09aef06b,0x6648c199
	.word	0x27c86d26,0x0ddf6b10
	.word	0x4c2042a6,0x39623eca
	.word	0x63c4a206,0x17f24a24
	.word	0x1eff2aff,0x8737a38a
	.word	0x84aa50ed,0xdf60a7e1
	.word	0xe8424831,0xd96c2e36
	.word	0xeb32e45a,0xd16bf15c
	.word	0xd805d7e7,0xab63c05a
	.word	0x8e264392,0xa5c27dbf
	.word	0x94b8c7a1,0x17489ae4
	.word	0x9d082a2b,0x32fcb5cc
share2_expect:
	.word	0xffff8232,0x79491d4a
	.word	0xd82a922a,0x157686bb
	.word	0x33359d92,0xdc32872f
	.word	0x6296fa21,0x2f98e5b1
	.word	0x7b179e60,0x787354d6
	.word	0x260c3115,0xcfbfaa4b
	.word	0xf8d0dd1f,0xaaa929fd
	.word	0xb7562f58,0x45827af4
share3_expect:
	.word	0x167b613f,0x523b0e2a
	.word	0x638f690a,0xfe4c0c85
	.word	0xcd21eb17,0x8e8f1ee8
	.word	0x63b8de9f,0xc215c801
	.word	0x55be3904,0x29546153
	.word	0x76b1dcae,0x3616d34f
	.word	0x260ede8e,0x5548ab98
	.word	0x0fd5fd55,0x01cc7350
	.word	0xfffe3fcb,0x00e783de
	.word	0x48c18420,0xbf14b451
	.word	0x112538f8,0xcd328870
	.word	0xad5c7572,0x52cc1eb8
	.word	0x67015589,0x6465b68f
	.word	0xf7e89b29,0xce2e4d85
	.word	0x216503ca,0x4a82299d
	.word	0xa9da71a9,0xf935b913
	.word	0x2b31d749,0x37c96f69
	.word	0xfe127f56,0xc5cfa021
	.word	0x068f76f3,0x2ee3d266
	.word	0x08835982,0xf3ad8adb
	.word	0x05949249,0x230c9603
	.word	0xe154c3e8,0x0323e78a
	.word	0x18e3afa5,0x174f9871
	.word	0x3badec36,0x35468b63
	.word	0x0ce93437,0x90cff648
	.word	0xf26aef47,0x28ab67fb
	.word	0x72191a9a,0xb6939380
	.word	0x7bb50ba0,0xe03a7409
	.word	0xb42dfca6,0x045eb0dd
	.word	0x280c4db5,0xbbad7ac1
	.word	0x43357fef,0x315b4809
	.word	0x6ed37178,0x99707784
	.word	0x004b2afa,0xf1d1665c
	.word	0x051e6976,0xcc950efc
	.word	0xd260a3d9,0x198fb1ce
	.word	0x0468ebf9,0x0b190724
	.word	0x599bb323,0x9295b62e
	.word	0x81bfc008,0x91339d53
	.word	0x0c6428c3,0x02fc89bd
	.word	0xe825e089,0xc5d0670a
	.word	0xc0efee0f,0x965951c5
	.word	0xcd7b32bd,0x93661f36
	.word	0x69465a1e,0x832df691
	.word	0x2265099b,0x9e8072f7
	.word	0x13702516,0xbcae6df7
	.word	0x3ebd0d55,0x7bcdb4f6
	.word	0xb2905967,0x34686d73
	.word	0xca3a9a56,0x287e3ef4
	.word	0x0001ca23,0xc8025daa
	.word	0xb0278b5a,0x8a954498
	.word	0x89f95805,0x0ab27f10
	.word	0x072ae2be,0xac6d6600
	.word	0x830eba6d,0x259b5972
	.word	0xa4cce4a2,0xe8f864fb
	.word	0x463e081d,0xe079b459
	.word	0xc5fbd36c,0x1605cdf8
	.word	0xe21a08a6,0xfd050c70
	.word	0xb2a3e0a3,0x69398c3a
	.word	0xef140291,0x4c488b0a
	.word	0xa78fac12,0x503122a3
	.word	0x03192e81,0x9ecfc4a1
	.word	0xd99c20df,0xe501360c
	.word	0x414e658b,0x1b1e9f4f
	.word	0x721c44f3,0xf3b75246
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
	.word	0x85fcfad0,0x0a97fed7
	.word	0x00000000,0x00000002
	.word	0xee783e8f,0xa97887d5
	.word	0x00000000,0x00000003
	.word	0x9f334207,0x8cecc801
	.word	0x00000000,0x00000004
	.word	0x1fdfa770,0x7e5c0d87
	.word	0x00000000,0x00000005
	.word	0x48ca24f7,0xf14c2383
	.word	0x00000000,0x00000006
	.word	0x28041558,0x60f1ee72
	.word	0x00000000,0x00000007
	.word	0x71bd4588,0x0e27d8e1
	.word	0x00000000,0x00000008
	.word	0x7182eea8,0x286d1a39
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
	.word	0x1c25cc86,0x802ae391,0xf9db41bf,0x2fa5392f
	.word	0x860c5e42,0x43487a52,0xe9badc72,0xe5a04d86
	.word	0x68cb11d4,0x84258168,0xbd72edd6,0xdb938db8
	.word	0x9b80cbe3,0x437eb3e6,0xda63732d,0x0f0060dd
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
	.word	0x9542e062,0x89c0fed3,0x5ea6b3c3,0xf1cb4b28
	.word	0x9e97b388,0x70cb0114,0xe019cd48,0x48c91d46
	.word	0xca422b55,0xe8a85632,0x855e16f0,0x7e0c8011
	.word	0x95735daf,0x8b0bb48b,0xddb78644,0x349676b0
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
	.word	0x3df16a77,0xd2e88169,0x9795c6a6,0xb03a7a01
	.word	0x139fa2ab,0x44e48ca9,0x3409b38f,0xa9dfd5b0
	.word	0xc82a189f,0xe595edb0,0x6f1d190d,0xdb428663
	.word	0xf7c2e059,0x9e791399,0x425cdb36,0x5ae7c764
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
	.word	0x78adad2d,0x876804e9,0x06dd0ffe,0xecc5ea83
	.word	0x8a33469f,0x3e378b9e,0x6dad841c,0xe8204b12
	.word	0x173a8631,0xddd559eb,0xeb791c24,0xd8c5ef3b
	.word	0x824747dc,0x31cfabbb,0x985e8d1e,0x937a6ba0
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
	.word	0x1e4a62cd,0x4856f7df,0x7cd0f393,0x9bee79b5
	.word	0xcc8dc2cf,0xec27ada0,0xd37c9082,0xc5012207
	.word	0x71d2d556,0x60c58732,0xc96e3280,0x588d6f58
	.word	0xae6faa42,0x059fc52e,0x02774f52,0xee7fe48c
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
	.word	0xe2d796f8,0xed3f114b,0x7ba7eaae,0xf1e112de
	.word	0x8a9ae594,0xa7bc65c8,0x715cabf2,0xb69956a9
	.word	0x8e956981,0xfe287ce2,0xb5f8590a,0x0cf24b3d
	.word	0xe9e4ec4d,0x09b1658d,0x8d3e535b,0xe35c5b3f
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
	.word	0x96048384,0xd9f2e93f,0x5ccc6c2b,0xfcc9970f
	.word	0x1c77ae1d,0xeb050fb5,0xd442bc67,0x5e9bbc57
	.word	0x6e37599a,0xf039cf6a,0xa6bc4074,0x08a031d1
	.word	0x9c8260b4,0x7e0c5021,0xeb538bb7,0x8bd8f042
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
	.word	0xd6eed72b,0xb1e9610e,0x718a5e80,0xd1d03cf5
	.word	0xfb27eab5,0x4f19ac2c,0xf2c37ba9,0x91e4e4c6
	.word	0xce9e879c,0x6c6c74a8,0xdb9d47b8,0x2eb6a492
	.word	0xdced11d7,0xb83eb05b,0xc2010254,0x5cde8129
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
	.word	0x779bff80,0xe512c076,0x264e3255,0x37b56c7d
	.word	0xe5f5f8b6,0x3c241327,0x0a11cf8c,0xf06aab63
	.word	0xf2af9a9e,0x81e00039,0x904f5624,0x505c22c3
	.word	0x384137fe,0x31ce1829,0xf4217e1c,0xf1b54a53
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
	.word	0xc984b88a,0xefeed29c,0xa67eb775,0x9f02bfe9
	.word	0x8ed508a2,0x99b6aaab,0x01f578be,0x26eb3037
	.word	0xb41f7b39,0x9e06b873,0x935cb3fb,0x99cf6818
	.word	0x166a84d4,0x66bc210c,0x18094bb4,0x6d01b78d
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
	.word	0xaa744c29,0x017198bd,0x80f9fe23,0x8d7ef7ca
	.word	0x1d58cd57,0x7cd06654,0x7404ec24,0x984a0952
	.word	0x5682861b,0x4407699b,0xccf9467b,0x71eb05b0
	.word	0x81b7a0d5,0x84553aa1,0xbe2204bc,0xb94fb8c7
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
	.word	0xb1f76918,0xed410683,0x16ef3e4b,0xeb283762
	.word	0x4fffd8e4,0x9b4094b8,0x8120e8c2,0xa6217e46
	.word	0x37fa06f0,0xabd68994,0xba6c91f6,0xcc52323c
	.word	0x672d6400,0x7f0ef815,0x8e5c5aeb,0x57ff1701
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
	.word	0x64f3d741,0xeda57a60,0xaa944a13,0x0abe50ae
	.word	0xb0e46a78,0xdb721f5f,0xc12af152,0xe161c938
	.word	0x5d376b08,0x314adcee,0x2635df10,0x360c5a49
	.word	0x24033a07,0xcabb9aed,0xfd5fc11b,0x4164d557
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
	.word	0x820ed3b3,0xde77ce28,0xa6ceb479,0xe530693d
	.word	0x863ebb3d,0x04a2c80c,0x54551743,0x4a634e12
	.word	0x18574c10,0x1c67d1a9,0xb563902b,0xa9024630
	.word	0xa95b9531,0x2678e605,0xf01236cc,0xa81fe1a8
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
	.word	0xc3dc2e73,0x46751146,0x530d2526,0x3f0d2ffe
	.word	0x457abb80,0x3bfaa1b3,0x65e2e88e,0xaa881f2e
	.word	0x93ae2846,0xab044e7e,0x82c407ca,0x1ff8ae23
	.word	0x734c7dcc,0xe3f93967,0x827ba4c5,0x7699ac97
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
	.word	0x1f25d27f,0x20a87c05,0x1d95a0a1,0x8f578ba9
	.word	0xbdd4daad,0x7f0a4f05,0x64229f22,0x6530e3b9
	.word	0x09aef06b,0x6648c199,0x27c86d26,0x0ddf6b10
	.word	0x4c2042a6,0x39623eca,0x63c4a206,0x17f24a24
	.word	0x1eae2aff,0x8737a38a,0x84aa50ed,0xdf60a7e1
	.word	0xe8424831,0xd96c2e36,0xeb32e45a,0xd16bf15c
	.word	0xd805d7e7,0xab63c05a,0x8e264392,0xa5c27dbf
	.word	0x94b8c7a1,0x17489ae4,0x9d082a2b,0x32fcb5cc
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
	.word	0xb0ea8232,0x79491d4a,0xd82a922a,0x157686bb
	.word	0x33359d92,0xdc32872f,0x6296fa21,0x2f98e5b1
	.word	0x7b179e60,0x787354d6,0x260c3115,0xcfbfaa4b
	.word	0xf8d0dd1f,0xaaa929fd,0xb7562f58,0x45827af4
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
	.word	0x167b613f,0x523b0e2a,0x638f690a,0xfe4c0c85
	.word	0xcd21eb17,0x8e8f1ee8,0x63b8de9f,0xc215c801
	.word	0x55be3904,0x29546153,0x76b1dcae,0x3616d34f
	.word	0x260ede8e,0x5548ab98,0x0fd5fd55,0x01cc7350
	.word	0x7afe3fcb,0x00e783de,0x48c18420,0xbf14b451
	.word	0x112538f8,0xcd328870,0xad5c7572,0x52cc1eb8
	.word	0x67015589,0x6465b68f,0xf7e89b29,0xce2e4d85
	.word	0x216503ca,0x4a82299d,0xa9da71a9,0xf935b913
	.word	0x2b31d749,0x37c96f69,0xfe127f56,0xc5cfa021
	.word	0x068f76f3,0x2ee3d266,0x08835982,0xf3ad8adb
	.word	0x05949249,0x230c9603,0xe154c3e8,0x0323e78a
	.word	0x18e3afa5,0x174f9871,0x3badec36,0x35468b63
	.word	0x0ce93437,0x90cff648,0xf26aef47,0x28ab67fb
	.word	0x72191a9a,0xb6939380,0x7bb50ba0,0xe03a7409
	.word	0xb42dfca6,0x045eb0dd,0x280c4db5,0xbbad7ac1
	.word	0x43357fef,0x315b4809,0x6ed37178,0x99707784
	.word	0x69d92afa,0xf1d1665c,0x051e6976,0xcc950efc
	.word	0xd260a3d9,0x198fb1ce,0x0468ebf9,0x0b190724
	.word	0x599bb323,0x9295b62e,0x81bfc008,0x91339d53
	.word	0x0c6428c3,0x02fc89bd,0xe825e089,0xc5d0670a
	.word	0xc0efee0f,0x965951c5,0xcd7b32bd,0x93661f36
	.word	0x69465a1e,0x832df691,0x2265099b,0x9e8072f7
	.word	0x13702516,0xbcae6df7,0x3ebd0d55,0x7bcdb4f6
	.word	0xb2905967,0x34686d73,0xca3a9a56,0x287e3ef4
	.word	0x2518ca23,0xc8025daa,0xb0278b5a,0x8a954498
	.word	0x89f95805,0x0ab27f10,0x072ae2be,0xac6d6600
	.word	0x830eba6d,0x259b5972,0xa4cce4a2,0xe8f864fb
	.word	0x463e081d,0xe079b459,0xc5fbd36c,0x1605cdf8
	.word	0xe21a08a6,0xfd050c70,0xb2a3e0a3,0x69398c3a
	.word	0xef140291,0x4c488b0a,0xa78fac12,0x503122a3
	.word	0x03192e81,0x9ecfc4a1,0xd99c20df,0xe501360c
	.word	0x414e658b,0x1b1e9f4f,0x721c44f3,0xf3b75246
share3_end:
