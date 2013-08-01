/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_1500_18.s
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
!	Seed = 327144539
!	Riesling can be on
!	1 Thread, 1500 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_1500_18.s created on Mar 27, 2009 (14:45:39)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_1500_18 -p 1 -l 1500

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
!	%f0  = 4640482c 1b89d9d7 dd8dd265 10398246
!	%f4  = c0224344 5ca1977b ba80af0c c28f756e
!	%f8  = 654e9191 ade7ca5f f5678abb 4704f312
!	%f12 = df0239a8 4cef418d a014395d f5419702
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 23bd08f9 38efb2ea 4e438604 f9e63498
!	%f20 = a234496c ca6b4ffb 78f87cd2 34874531
!	%f24 = 014e67ba cd9c8014 f272538c 5ab72769
!	%f28 = 3f0a0310 b5cb3fee ec9a48e7 2561a4d7
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 9f73204a 9c8d1b1f 4ca24452 b1dfe6d6
!	%f36 = 71a0faaa 3dcfe597 c387ed9b c9a2d6bf
!	%f40 = 7aa68ef9 939b080b 629e1cfa 2a8f08f9
!	%f44 = ebf07fca d0aad178 35d043b8 e2798f12
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x1f70a39000000003,%g7,%g1 ! GSR scale =  0, align = 3
	wr	%g1,%g0,%gsr		! GSR = 1f70a39000000003
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[00000000100c1410] = 0d92c255, %l1 = 2fae58582c0f9ff4
	ldsha	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000d92
!	%l2 = 053f74b2, %l3 = c2fa1044, Mem[0000000030001408] = 61fa0899 566c2645
	stda	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 053f74b2 c2fa1044
!	Mem[00000000100c1423] = c3d7577c, %l1 = 0000000000000d92
	ldstuba	[%i3+0x023]%asi,%l1	! %l1 = 0000007c000000ff
!	%l4 = 59045e985c7e2726, Mem[0000000030181408] = e9d308f8189b0675
	stxa	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 59045e985c7e2726
!	Mem[0000000030041410] = 10be99b3, %l0 = 3e9a7f3c1f8e6e5e
	ldsba	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000010
!	%f4  = c0224344 5ca1977b, Mem[0000000010001420] = 21ae8624 4d7df1f7
	std	%f4 ,[%i0+0x020]	! Mem[0000000010001420] = c0224344 5ca1977b
!	%f18 = 4e438604 f9e63498, Mem[0000000010181400] = 71c7667e 13f6eddc
	stda	%f18,[%i6+%g0]0x88	! Mem[0000000010181400] = 4e438604 f9e63498
!	Mem[00000000300c1400] = aedacb6d0ea3ffd8, %l5 = e2681969c21f80d7
	ldxa	[%i3+%g0]0x89,%l5	! %l5 = aedacb6d0ea3ffd8
!	%l4 = 59045e985c7e2726, Mem[00000000201c0000] = e2678819
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 27268819
!	Starting 10 instruction Store Burst
!	Mem[00000000218000c0] = 616adddc, %l3 = dfac614ac2fa1044
	ldstuba	[%o3+0x0c0]%asi,%l3	! %l3 = 00000061000000ff

p0_label_2:
!	%l3 = 0000000000000061, %l6 = 7c476ebe03647cfd, %l0 = 0000000000000010
	xnor	%l3,%l6,%l0		! %l0 = 83b89141fc9b8363
!	Code Fragment 3
p0_fragment_1:
!	%l0 = 83b89141fc9b8363
	setx	0x52ff66c7f26ae9ec,%g7,%l0 ! %l0 = 52ff66c7f26ae9ec
!	%l1 = 000000000000007c
	setx	0x160bffb04bad5beb,%g7,%l1 ! %l1 = 160bffb04bad5beb
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 52ff66c7f26ae9ec
	setx	0x52d8aadfc78a591a,%g7,%l0 ! %l0 = 52d8aadfc78a591a
!	%l1 = 160bffb04bad5beb
	setx	0x5bd9ddd82c39adf5,%g7,%l1 ! %l1 = 5bd9ddd82c39adf5
!	Mem[0000000030181400] = c9339792, %l2 = 69e0a4b0053f74b2
	swapa	[%i6+%g0]0x81,%l2	! %l2 = 00000000c9339792
!	%l2 = 00000000c9339792, Mem[00000000300c1400] = d8ffa30e6dcbdaae
	stxa	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000c9339792
!	%l5 = aedacb6d0ea3ffd8, Mem[0000000010141408] = 3804f0e4
	stba	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 3804f0d8
!	%l1 = 5bd9ddd82c39adf5, Mem[0000000030081400] = 196fb9ac
	stba	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = 196fb9f5
!	Code Fragment 4
p0_fragment_2:
!	%l0 = 52d8aadfc78a591a
	setx	0xe0a0f6601b4b7aa4,%g7,%l0 ! %l0 = e0a0f6601b4b7aa4
!	%l1 = 5bd9ddd82c39adf5
	setx	0x27f6f4d87d66b65f,%g7,%l1 ! %l1 = 27f6f4d87d66b65f
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = e0a0f6601b4b7aa4
	setx	0xdfda72ffcae5bcf4,%g7,%l0 ! %l0 = dfda72ffcae5bcf4
!	%l1 = 27f6f4d87d66b65f
	setx	0x60772890628b9b35,%g7,%l1 ! %l1 = 60772890628b9b35
!	Mem[0000000010081404] = a2886d21, %l4 = 59045e985c7e2726, %asi = 80
	swapa	[%i2+0x004]%asi,%l4	! %l4 = 00000000a2886d21
!	Mem[0000000010001408] = 75cef13e, %l4 = 00000000a2886d21
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 0000003e000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1430] = 5aa1d778, %l7 = dead225236da1794
	lduh	[%i3+0x030],%l7		! %l7 = 0000000000005aa1

p0_label_3:
!	Mem[0000000010101400] = 60839b93 e9ed999c, %l4 = 0000003e, %l5 = 0ea3ffd8
	ldda	[%i4+%g0]0x88,%l4	! %l4 = 00000000e9ed999c 0000000060839b93
!	Mem[0000000010001410] = adf0cd01, %l6 = 7c476ebe03647cfd
	lduba	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000001
!	Mem[00000000201c0000] = 27268819, %l0 = dfda72ffcae5bcf4
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = 0000000000002726
!	Mem[0000000030101410] = 401237c122bf4ca7, %f28 = 3f0a0310 b5cb3fee
	ldda	[%i4+%o5]0x89,%f28	! %f28 = 401237c1 22bf4ca7
!	Mem[0000000010181400] = 9834e6f90486434e, %f6  = ba80af0c c28f756e
	ldd	[%i6+%g0],%f6 		! %f6  = 9834e6f9 0486434e
!	Mem[0000000030141410] = 320f97c4, %l3 = 0000000000000061
	lduba	[%i5+%o5]0x81,%l3	! %l3 = 0000000000000032
!	Mem[0000000010001408] = fff1ce75, %l4 = 00000000e9ed999c
	lduha	[%i0+0x008]%asi,%l4	! %l4 = 000000000000fff1
!	Mem[00000000201c0000] = 27268819, %l0 = 0000000000002726
	lduh	[%o0+%g0],%l0		! %l0 = 0000000000002726
!	%l7 = 0000000000005aa1, Mem[00000000300c1400] = 00000000
	stba	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000a1
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = adf0cd01, %l1 = 60772890628b9b35
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 00000000adf0cd01

p0_label_4:
!	%l2 = 00000000c9339792, Mem[0000000010101410] = f5d2b3ea
	stwa	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = c9339792
!	Mem[0000000020800041] = 91bbbf87, %l5 = 0000000060839b93
	ldstub	[%o1+0x041],%l5		! %l5 = 000000bb000000ff
!	%l0 = 0000000000002726, Mem[0000000010001408] = fff1ce75
	stba	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 26f1ce75
!	%l7 = 0000000000005aa1, Mem[0000000010001410] = 359b8b62e6225fe8
	stx	%l7,[%i0+%o5]		! Mem[0000000010001410] = 0000000000005aa1
!	%l2 = 00000000c9339792, Mem[0000000030181400] = 053f74b237c53cec
	stxa	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000c9339792
!	%l5 = 00000000000000bb, Mem[0000000010041410] = 9d28b559b6ddb793
	stxa	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000000000bb
!	Mem[0000000010081408] = d8152c64, %l6 = 0000000000000001
	ldstuba	[%i2+%o4]0x88,%l6	! %l6 = 00000064000000ff
!	Mem[0000000030181410] = e8de8857, %l6 = 0000000000000064
	ldstuba	[%i6+%o5]0x81,%l6	! %l6 = 000000e8000000ff
!	Mem[0000000030041410] = 10be99b3, %l3 = 0000000000000032
	ldstuba	[%i1+%o5]0x81,%l3	! %l3 = 00000010000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 4e438604f9e63498, %f20 = a234496c ca6b4ffb
	ldda	[%i6+%g0]0x88,%f20	! %f20 = 4e438604 f9e63498

p0_label_5:
!	%l5 = 00000000000000bb, Mem[0000000010141400] = 83a94f65
	stwa	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000bb
!	Mem[0000000010001408] = 26f1ce75 b731bac8, %l4 = 0000fff1, %l5 = 000000bb
	ldda	[%i0+%o4]0x80,%l4	! %l4 = 0000000026f1ce75 00000000b731bac8
!	Mem[0000000030141400] = a6108027, %l5 = 00000000b731bac8
	lduha	[%i5+%g0]0x81,%l5	! %l5 = 000000000000a610
!	Mem[0000000030001408] = b2743f05, %l0 = 0000000000002726
	lduwa	[%i0+%o4]0x81,%l0	! %l0 = 00000000b2743f05
!	Mem[0000000010101408] = bcd3cb83, %l1 = 00000000adf0cd01
	lduba	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000083
!	Mem[0000000010041418] = 83f65f9b, %l4 = 0000000026f1ce75
	lduha	[%i1+0x018]%asi,%l4	! %l4 = 00000000000083f6
!	Mem[0000000010141410] = f5cd4b41bfa2e598, %l5 = 000000000000a610
	ldxa	[%i5+%o5]0x88,%l5	! %l5 = f5cd4b41bfa2e598
!	Mem[0000000010181408] = 5a1bf45f, %l2 = 00000000c9339792
	lduba	[%i6+%o4]0x80,%l2	! %l2 = 000000000000005a
!	Mem[000000001000142c] = 717feadd, %f12 = df0239a8
	ld	[%i0+0x02c],%f12	! %f12 = 717feadd
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = 3dcdfcae, %l1 = 0000000000000083
	ldstuba	[%o2+0x000]%asi,%l1	! %l1 = 0000003d000000ff

p0_label_6:
!	Mem[0000000030001400] = c7e000e7, %l4 = 00000000000083f6
	ldstuba	[%i0+%g0]0x81,%l4	! %l4 = 000000c7000000ff
!	Mem[0000000030141410] = c4970f32, %l1 = 000000000000003d
	ldstuba	[%i5+%o5]0x89,%l1	! %l1 = 00000032000000ff
!	%f6  = 9834e6f9, Mem[0000000030181408] = 59045e98
	sta	%f6 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 9834e6f9
!	%l3 = 0000000000000010, Mem[0000000030141410] = ff0f97c4262da0fa
	stxa	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000000000000010
!	Mem[0000000030081408] = 97268467, %l3 = 0000000000000010
	ldstuba	[%i2+%o4]0x81,%l3	! %l3 = 00000097000000ff
!	Mem[0000000030001410] = 5abc2c7d, %l2 = 000000000000005a
	swapa	[%i0+%o5]0x81,%l2	! %l2 = 000000005abc2c7d
!	%l4 = 000000c7, %l5 = bfa2e598, Mem[0000000030101410] = 22bf4ca7 401237c1
	stda	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000c7 bfa2e598
!	Mem[0000000010181400] = 9834e6f9, %l7 = 0000000000005aa1
	swapa	[%i6+%g0]0x80,%l7	! %l7 = 000000009834e6f9
!	%l4 = 00000000000000c7, Mem[00000000100c1410] = 55c2920d
	stha	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 55c200c7
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 637401c9bb000000, %f8  = 654e9191 ade7ca5f
	ldda	[%i5+%g0]0x88,%f8 	! %f8  = 637401c9 bb000000

p0_label_7:
!	%l6 = 00000000000000e8, immed = 00000620, %y  = 00000000
	sdiv	%l6,0x620,%l2		! %l2 = 0000000000000000
	mov	%l0,%y			! %y = b2743f05
!	Mem[0000000030001408] = b2743f05, %l1 = 0000000000000032
	ldsba	[%i0+%o4]0x81,%l1	! %l1 = ffffffffffffffb2
!	Mem[00000000201c0000] = 27268819, %l1 = ffffffffffffffb2
	ldsh	[%o0+%g0],%l1		! %l1 = 0000000000002726
!	Mem[0000000010001428] = d1e46d6e 717feadd, %l4 = 000000c7, %l5 = bfa2e598
	ldd	[%i0+0x028],%l4		! %l4 = 00000000d1e46d6e 00000000717feadd
!	Mem[0000000030181400] = 00000000, %l5 = 00000000717feadd
	ldsha	[%i6+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = 672ffc4f, %l2 = 0000000000000000
	ldsba	[%i4+%g0]0x81,%l2	! %l2 = 0000000000000067
!	%l5 = 0000000000000000, %l2 = 0000000000000067, %l2 = 0000000000000067
	andn	%l5,%l2,%l2		! %l2 = 0000000000000000
!	Mem[0000000010181408] = 5ff41b5a, %l4 = 00000000d1e46d6e
	ldsha	[%i6+%o4]0x88,%l4	! %l4 = 0000000000001b5a
!	Mem[0000000021800180] = 662d8f81, %l2 = 0000000000000000
	lduh	[%o3+0x180],%l2		! %l2 = 000000000000662d
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = f5b96f19, %l0 = 00000000b2743f05
	ldstuba	[%i2+%g0]0x81,%l0	! %l0 = 000000f5000000ff

p0_label_8:
!	Mem[0000000010001405] = f348754f, %l2 = 000000000000662d
	ldstub	[%i0+0x005],%l2		! %l2 = 00000048000000ff
!	%l1 = 0000000000002726, Mem[0000000010181408] = 5a1bf45f
	stba	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = 261bf45f
!	%l1 = 0000000000002726, Mem[0000000010101420] = 2513e0dc
	stw	%l1,[%i4+0x020]		! Mem[0000000010101420] = 00002726
!	Mem[0000000010001430] = 20f1f32e7f2178de, %l0 = 00000000000000f5, %l5 = 0000000000000000
	add	%i0,0x30,%g1
	casxa	[%g1]0x80,%l0,%l5	! %l5 = 20f1f32e7f2178de
!	%l0 = 00000000000000f5, Mem[0000000010101424] = e2a6b9b6
	stw	%l0,[%i4+0x024]		! Mem[0000000010101424] = 000000f5
!	Mem[0000000021800140] = c8033eed, %l4 = 0000000000001b5a
	ldstuba	[%o3+0x140]%asi,%l4	! %l4 = 000000c8000000ff
!	Mem[0000000010141410] = 98e5a2bf, %l7 = 000000009834e6f9
	swapa	[%i5+%o5]0x80,%l7	! %l7 = 0000000098e5a2bf
!	%f10 = f5678abb 4704f312, %l4 = 00000000000000c8
!	Mem[0000000010181430] = d24e80379fa033c6
	add	%i6,0x030,%g1
	stda	%f10,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010181430] = d24e80379fa033c6
!	%l0 = 00000000000000f5, Mem[00000000218001c0] = 1009186d, %asi = 80
	stha	%l0,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 00f5186d
!	Starting 10 instruction Load Burst
!	Mem[0000000010001430] = 20f1f32e7f2178de, %f26 = f272538c 5ab72769
	ldda	[%i0+0x030]%asi,%f26	! %f26 = 20f1f32e 7f2178de

p0_label_9:
!	Mem[00000000300c1410] = 331d295f 17bb05c0, %l6 = 000000e8, %l7 = 98e5a2bf
	ldda	[%i3+%o5]0x89,%l6	! %l6 = 0000000017bb05c0 00000000331d295f
!	Mem[0000000010001408] = 26f1ce75, %l3 = 0000000000000097
	lduha	[%i0+%o4]0x80,%l3	! %l3 = 00000000000026f1
!	Mem[000000001008142c] = be19cd23, %f22 = 78f87cd2
	ld	[%i2+0x02c],%f22	! %f22 = be19cd23
!	Mem[0000000030001400] = ffe000e7, %l4 = 00000000000000c8
	ldswa	[%i0+%g0]0x81,%l4	! %l4 = ffffffffffe000e7
!	Mem[0000000010181438] = 7a9b1b3d, %l1 = 0000000000002726
	lduw	[%i6+0x038],%l1		! %l1 = 000000007a9b1b3d
!	Mem[0000000010101410] = 929733c9843fd55e, %l1 = 000000007a9b1b3d
	ldx	[%i4+%o5],%l1		! %l1 = 929733c9843fd55e
!	Mem[00000000100c1408] = 0a50fdba b1d3b4cc, %l4 = ffe000e7, %l5 = 7f2178de
	ldd	[%i3+%o4],%l4		! %l4 = 000000000a50fdba 00000000b1d3b4cc
!	Mem[0000000010081408] = d8152cff, %l7 = 00000000331d295f
	ldswa	[%i2+%o4]0x88,%l7	! %l7 = ffffffffd8152cff
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010001400] = 68f66f14 f3ff754f 26f1ce75 b731bac8
!	Mem[0000000010001410] = 00000000 00005aa1 6c4a7a81 c5f9822a
!	Mem[0000000010001420] = c0224344 5ca1977b d1e46d6e 717feadd
!	Mem[0000000010001430] = 20f1f32e 7f2178de 760826f2 cfd7dfe2
	ldda	[%i0]ASI_BLK_P,%f0	! Block Load from 0000000010001400
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 053f74b2, %l3 = 00000000000026f1
	ldstuba	[%i0+%o4]0x89,%l3	! %l3 = 000000b2000000ff

p0_label_10:
!	%f26 = 20f1f32e 7f2178de, %l4 = 000000000a50fdba
!	Mem[0000000030041430] = bb53fa0ae93043a3
	add	%i1,0x030,%g1
	stda	%f26,[%g1+%l4]ASI_PST32_S ! Mem[0000000030041430] = 20f1f32ee93043a3
!	%l7 = ffffffffd8152cff, Mem[0000000030141400] = 67fea5f1278010a6
	stxa	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffffffd8152cff
!	Mem[0000000010141434] = e6e736ac, %l5 = 00000000b1d3b4cc
	swap	[%i5+0x034],%l5		! %l5 = 00000000e6e736ac
!	%l4 = 0a50fdba, %l5 = e6e736ac, Mem[0000000030041410] = ffbe99b3 775b8d0d
	stda	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 0a50fdba e6e736ac
!	%f22 = be19cd23 34874531, %l6 = 0000000017bb05c0
!	Mem[0000000030081410] = 68ce09698421db70
	add	%i2,0x010,%g1
	stda	%f22,[%g1+%l6]ASI_PST8_S ! Mem[0000000030081410] = be1909698421db70
!	%l6 = 17bb05c0, %l7 = d8152cff, Mem[0000000030041408] = d8c079b8 00796c89
	stda	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 17bb05c0 d8152cff
	membar	#Sync			! Added by membar checker (2)
!	%l4 = 0a50fdba, %l5 = e6e736ac, Mem[0000000010001408] = 75cef126 c8ba31b7
	stda	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = 0a50fdba e6e736ac
!	%l2 = 0000000000000048, Mem[00000000300c1408] = 0be2d64b4c1725ec
	stxa	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000000000048
!	%f10 = d1e46d6e 717feadd, %l4 = 000000000a50fdba
!	Mem[0000000030001430] = a62039980f7b9ea9
	add	%i0,0x030,%g1
	stda	%f10,[%g1+%l4]ASI_PST8_S ! Mem[0000000030001430] = d1206d6e717beaa9
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = aac60a8a, %l7 = ffffffffd8152cff
	lduwa	[%i4+%o4]0x81,%l7	! %l7 = 00000000aac60a8a

p0_label_11:
!	Mem[0000000010181400] = 00005aa1 0486434e 261bf45f f1fc9e48
!	Mem[0000000010181410] = dd918a1b ac72aa1f cbf57ad8 e0b97b92
!	Mem[0000000010181420] = 1dfbd0f5 4e768fd9 475e0387 213850d4
!	Mem[0000000010181430] = d24e8037 9fa033c6 7a9b1b3d 47e365d8
	ldda	[%i6]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010181400
!	Mem[00000000100c1408] = 0a50fdba b1d3b4cc, %l2 = 00000048, %l3 = 000000b2
	ldd	[%i3+%o4],%l2		! %l2 = 000000000a50fdba 00000000b1d3b4cc
!	Mem[0000000010101438] = 14f78a44 d0d0237c, %l4 = 0a50fdba, %l5 = e6e736ac
	ldda	[%i4+0x038]%asi,%l4	! %l4 = 0000000014f78a44 00000000d0d0237c
!	Mem[00000000100c1410] = 55c200c7, %l7 = 00000000aac60a8a
	ldsba	[%i3+%o5]0x88,%l7	! %l7 = ffffffffffffffc7
!	Mem[0000000030081408] = ff268467, %l3 = 00000000b1d3b4cc
	ldsha	[%i2+%o4]0x81,%l3	! %l3 = ffffffffffffff26
!	Mem[0000000010141400] = 000000bb, %l3 = ffffffffffffff26
	ldswa	[%i5+%g0]0x80,%l3	! %l3 = 00000000000000bb
!	Mem[0000000030001410] = 5a000000, %l4 = 0000000014f78a44
	lduwa	[%i0+%o5]0x89,%l4	! %l4 = 000000005a000000
!	Mem[0000000010001408] = 0a50fdba, %l1 = 929733c9843fd55e
	lduba	[%i0+%o4]0x88,%l1	! %l1 = 00000000000000ba
!	Mem[00000000100c1418] = 87d772b4, %l2 = 000000000a50fdba
	ldsb	[%i3+0x01b],%l2		! %l2 = ffffffffffffffb4
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffffb4, Mem[00000000300c1400] = a1000000
	stha	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffb40000

p0_label_12:
!	%l5 = 00000000d0d0237c, %l5 = 00000000d0d0237c, %l1 = 00000000000000ba
	or	%l5,%l5,%l1		! %l1 = 00000000d0d0237c
!	Mem[00000000100c1400] = d924827e, %l4 = 000000005a000000
	swapa	[%i3+%g0]0x80,%l4	! %l4 = 00000000d924827e
!	%f16 = 23bd08f9 38efb2ea, Mem[0000000030081408] = ff268467 0450b61c
	stda	%f16,[%i2+%o4]0x81	! Mem[0000000030081408] = 23bd08f9 38efb2ea
!	Mem[0000000030081410] = 690919be, %l3 = 00000000000000bb
	swapa	[%i2+%o5]0x89,%l3	! %l3 = 00000000690919be
!	Mem[0000000030081410] = 000000bb, %l6 = 0000000017bb05c0
	lduba	[%i2+%o5]0x89,%l6	! %l6 = 00000000000000bb
!	%l5 = 00000000d0d0237c, Mem[0000000020800040] = 91ffbf87, %asi = 80
	stha	%l5,[%o1+0x040]%asi	! Mem[0000000020800040] = 237cbf87
!	Mem[0000000010181410] = dd918a1b, %l3 = 00000000690919be, %asi = 80
	swapa	[%i6+0x010]%asi,%l3	! %l3 = 00000000dd918a1b
!	%l5 = 00000000d0d0237c, Mem[0000000010081408] = d8152cff
	stba	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = d8152c7c
!	Mem[00000000300c1408] = 00000000, %l0 = 00000000000000f5
	swapa	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 261bf45f f1fc9e48, %l2 = ffffffb4, %l3 = dd918a1b
	ldda	[%i6+0x008]%asi,%l2	! %l2 = 00000000261bf45f 00000000f1fc9e48

p0_label_13:
!	Mem[0000000010141408] = d8f0043862763c8e, %l2 = 00000000261bf45f
	ldxa	[%i5+%o4]0x80,%l2	! %l2 = d8f0043862763c8e
!	%f28 = 401237c1, %f22 = be19cd23
	fcmpes	%fcc2,%f28,%f22		! %fcc2 = 2
!	Mem[0000000010141410] = 9834e6f9, %l2 = d8f0043862763c8e
	lduw	[%i5+%o5],%l2		! %l2 = 000000009834e6f9
!	Mem[0000000010101418] = 6f4004d8, %l0 = 0000000000000000
	lduha	[%i4+0x01a]%asi,%l0	! %l0 = 00000000000004d8
!	Mem[00000000100c1408] = bafd500a, %l0 = 00000000000004d8
	ldswa	[%i3+%o4]0x88,%l0	! %l0 = ffffffffbafd500a
!	Mem[0000000010081410] = 7f113cb8, %l3 = 00000000f1fc9e48
	lduha	[%i2+%o5]0x88,%l3	! %l3 = 0000000000003cb8
!	Mem[0000000030081410] = 70db2184000000bb, %f24 = 014e67ba cd9c8014
	ldda	[%i2+%o5]0x89,%f24	! %f24 = 70db2184 000000bb
!	Mem[0000000020800040] = 237cbf87, %l4 = 00000000d924827e
	lduba	[%o1+0x040]%asi,%l4	! %l4 = 0000000000000023
!	%f31 = 2561a4d7, %f28 = 401237c1
	fcmps	%fcc1,%f31,%f28		! %fcc1 = 1
!	Starting 10 instruction Store Burst
!	%l1 = 00000000d0d0237c, Mem[00000000100c1408] = 0a50fdbab1d3b4cc
	stxa	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000d0d0237c

p0_label_14:
!	Mem[0000000030101410] = c7000000, %l4 = 0000000000000023
	ldstuba	[%i4+%o5]0x81,%l4	! %l4 = 000000c7000000ff
!	%f28 = 401237c1 22bf4ca7, Mem[0000000030181400] = 00000000 929733c9
	stda	%f28,[%i6+%g0]0x89	! Mem[0000000030181400] = 401237c1 22bf4ca7
!	Mem[0000000030181400] = a74cbf22, %l4 = 00000000000000c7
	ldstuba	[%i6+%g0]0x81,%l4	! %l4 = 000000a7000000ff
!	Mem[00000000100c1410] = c700c255, %l1 = 00000000d0d0237c
	ldstuba	[%i3+%o5]0x80,%l1	! %l1 = 000000c7000000ff
!	%l2 = 9834e6f9, %l3 = 00003cb8, Mem[0000000010141408] = d8f00438 62763c8e
	std	%l2,[%i5+%o4]		! Mem[0000000010141408] = 9834e6f9 00003cb8
!	%f4  = 1faa72ac 1b8a91dd, Mem[0000000010141418] = 3249f4f6 a38d321b
	std	%f4 ,[%i5+0x018]	! Mem[0000000010141418] = 1faa72ac 1b8a91dd
!	%l7 = ffffffffffffffc7, Mem[0000000010001428] = d1e46d6e717feadd, %asi = 80
	stxa	%l7,[%i0+0x028]%asi	! Mem[0000000010001428] = ffffffffffffffc7
!	%l2 = 9834e6f9, %l3 = 00003cb8, Mem[0000000010041418] = 83f65f9b 0ec8d10a
	std	%l2,[%i1+0x018]		! Mem[0000000010041418] = 9834e6f9 00003cb8
!	%f26 = 20f1f32e 7f2178de, %l2 = 000000009834e6f9
!	Mem[00000000300c1408] = 000000f500000048
	add	%i3,0x008,%g1
	stda	%f26,[%g1+%l2]ASI_PST32_SL ! Mem[00000000300c1408] = de78217f00000048
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = c005bb17 ff2c15d8, %l4 = 000000a7, %l5 = d0d0237c
	ldda	[%i1+%o4]0x81,%l4	! %l4 = 00000000c005bb17 00000000ff2c15d8

p0_label_15:
!	Mem[0000000030081410] = 000000bb, %l4 = 00000000c005bb17
	ldswa	[%i2+%o5]0x89,%l4	! %l4 = 00000000000000bb
!	Mem[0000000030101408] = 8a0ac6aa, %l7 = ffffffffffffffc7
	lduwa	[%i4+%o4]0x89,%l7	! %l7 = 000000008a0ac6aa
!	Mem[00000000201c0000] = 27268819, %l7 = 000000008a0ac6aa
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = 0000000000002726
!	Mem[0000000030001408] = ff743f05 4410fac2, %l0 = bafd500a, %l1 = 000000c7
	ldda	[%i0+%o4]0x81,%l0	! %l0 = 00000000ff743f05 000000004410fac2
!	Mem[0000000010001408] = e6e736ac0a50fdba, %f24 = 70db2184 000000bb
	ldda	[%i0+%o4]0x88,%f24	! %f24 = e6e736ac 0a50fdba
!	Mem[00000000218000c0] = ff6adddc, %l6 = 00000000000000bb
	lduha	[%o3+0x0c0]%asi,%l6	! %l6 = 000000000000ff6a
!	Mem[00000000201c0000] = 27268819, %l6 = 000000000000ff6a
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 0000000000002726
!	Mem[0000000010041408] = 5364d642, %l0 = 00000000ff743f05
	ldsha	[%i1+%o4]0x80,%l0	! %l0 = 0000000000005364
!	Mem[00000000201c0000] = 27268819, %l7 = 0000000000002726
	lduh	[%o0+%g0],%l7		! %l7 = 0000000000002726
!	Starting 10 instruction Store Burst
!	%f23 = 34874531, Mem[00000000100c1408] = 00000000
	sta	%f23,[%i3+%o4]0x80	! Mem[00000000100c1408] = 34874531

p0_label_16:
!	%l1 = 000000004410fac2, Mem[0000000030081408] = f908bd23
	stha	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = f908fac2
!	%l4 = 00000000000000bb, Mem[0000000030101400] = 672ffc4f0cdc7843
	stxa	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000000000bb
!	%l2 = 9834e6f9, %l3 = 00003cb8, Mem[00000000100c1410] = 55c200ff 7c046891
	stda	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 9834e6f9 00003cb8
!	Mem[0000000010141430] = 2cd42806, %l2 = 9834e6f9, %l7 = 00002726
	add	%i5,0x30,%g1
	casa	[%g1]0x80,%l2,%l7	! %l7 = 000000002cd42806
!	Mem[00000000100c1400] = 0000005a, %l6 = 0000000000002726
	ldstuba	[%i3+%g0]0x88,%l6	! %l6 = 0000005a000000ff
!	Mem[0000000010041408] = 5364d642, %l5 = 00000000ff2c15d8
	swapa	[%i1+%o4]0x80,%l5	! %l5 = 000000005364d642
!	Mem[0000000030181410] = ffde8857, %l7 = 000000002cd42806
	ldstuba	[%i6+%o5]0x81,%l7	! %l7 = 000000ff000000ff
!	%l1 = 000000004410fac2, Mem[0000000010101408] = 83cbd3bc
	stwa	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = 4410fac2
!	Mem[0000000030041410] = bafd500a, %l1 = 000000004410fac2
	swapa	[%i1+%o5]0x89,%l1	! %l1 = 00000000bafd500a
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = bafd500aac36e7e6, %l0 = 0000000000005364
	ldxa	[%i0+0x008]%asi,%l0	! %l0 = bafd500aac36e7e6

p0_label_17:
!	Mem[0000000010181400] = 00005aa1, %l2 = 000000009834e6f9
	ldswa	[%i6+%g0]0x80,%l2	! %l2 = 0000000000005aa1
!	Mem[0000000030181408] = 9834e6f9, %l7 = 00000000000000ff
	ldsba	[%i6+%o4]0x81,%l7	! %l7 = ffffffffffffff98
!	Mem[0000000010101408] = c2fa1044, %l4 = 00000000000000bb
	ldsha	[%i4+%o4]0x88,%l4	! %l4 = 0000000000001044
!	Mem[0000000010141414] = 414bcdf5, %l6 = 000000000000005a
	ldsw	[%i5+0x014],%l6		! %l6 = 00000000414bcdf5
!	Code Fragment 4
p0_fragment_3:
!	%l0 = bafd500aac36e7e6
	setx	0x46e4d12fe292a40b,%g7,%l0 ! %l0 = 46e4d12fe292a40b
!	%l1 = 00000000bafd500a
	setx	0x110140b82b6aed4e,%g7,%l1 ! %l1 = 110140b82b6aed4e
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 46e4d12fe292a40b
	setx	0xd9bbca27c543eaac,%g7,%l0 ! %l0 = d9bbca27c543eaac
!	%l1 = 110140b82b6aed4e
	setx	0xdf250597c85a68e3,%g7,%l1 ! %l1 = df250597c85a68e3
!	Mem[00000000100c1400] = 000000ff, %l7 = ffffffffffffff98
	ldswa	[%i3+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001410] = 0000005a 467a8b01, %l0 = c543eaac, %l1 = c85a68e3
	ldda	[%i0+%o5]0x81,%l0	! %l0 = 000000000000005a 00000000467a8b01
!	Mem[0000000030141410] = 00000000, %l5 = 000000005364d642
	lduwa	[%i5+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041418] = 9834e6f900003cb8, %f24 = e6e736ac 0a50fdba
	ldd	[%i1+0x018],%f24	! %f24 = 9834e6f9 00003cb8
!	Starting 10 instruction Store Burst
!	%f0  = 4e438604, Mem[0000000030081408] = c2fa08f9
	sta	%f0 ,[%i2+%o4]0x81	! Mem[0000000030081408] = 4e438604

p0_label_18:
!	Mem[0000000010101408] = c2fa1044, %l3 = 0000000000003cb8
	ldstuba	[%i4+%o4]0x88,%l3	! %l3 = 00000044000000ff
!	%f20 = 4e438604 f9e63498, %l4 = 0000000000001044
!	Mem[0000000010141438] = 26f66bb31fdcd6e6
	add	%i5,0x038,%g1
	stda	%f20,[%g1+%l4]ASI_PST16_P ! Mem[0000000010141438] = 26f686041fdcd6e6
!	%l1 = 00000000467a8b01, Mem[0000000030041400] = 7011a7de
	stba	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = 0111a7de
!	Mem[00000000100c1400] = ff00000069e04f64, %l7 = 00000000000000ff, %l3 = 0000000000000044
	casxa	[%i3]0x80,%l7,%l3	! %l3 = ff00000069e04f64
!	Mem[0000000010041428] = 64266065433910a6, %l4 = 0000000000001044, %l1 = 00000000467a8b01
	add	%i1,0x28,%g1
	casxa	[%g1]0x80,%l4,%l1	! %l1 = 64266065433910a6
!	Mem[0000000030001400] = ffe000e7, %l6 = 00000000414bcdf5
	ldstuba	[%i0+%g0]0x81,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010141400] = bb000000, %l0 = 000000000000005a
	swapa	[%i5+%g0]0x88,%l0	! %l0 = 00000000bb000000
!	%l4 = 0000000000001044, Mem[0000000030041408] = c005bb17ff2c15d8
	stxa	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000000000001044
!	Mem[0000000030141410] = 00000000, %l0 = 00000000bb000000
	swapa	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141434] = b1d3b4cc, %l5 = 0000000000000000
	lduwa	[%i5+0x034]%asi,%l5	! %l5 = 00000000b1d3b4cc

p0_label_19:
!	Mem[0000000010041400] = 215a2b81bdc8508b, %l7 = 00000000000000ff
	ldxa	[%i1+%g0]0x88,%l7	! %l7 = 215a2b81bdc8508b
!	Mem[0000000030101410] = bfa2e598000000ff, %f0  = 4e438604 a15a0000
	ldda	[%i4+%o5]0x89,%f0 	! %f0  = bfa2e598 000000ff
!	Mem[0000000010001410] = 00000000, %l6 = 00000000000000ff
	ldsha	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041408] = cdec84c8 d8152cff, %l2 = 00005aa1, %l3 = 69e04f64
	ldda	[%i1+%o4]0x88,%l2	! %l2 = 00000000d8152cff 00000000cdec84c8
!	Mem[0000000030181408] = 9834e6f9, %l6 = 0000000000000000
	ldswa	[%i6+%o4]0x81,%l6	! %l6 = ffffffff9834e6f9
!	Mem[00000000300c1408] = 480000007f2178de, %f30 = ec9a48e7 2561a4d7
	ldda	[%i3+%o4]0x89,%f30	! %f30 = 48000000 7f2178de
!	Mem[00000000300c1400] = ffb40000, %l0 = 0000000000000000
	lduha	[%i3+%g0]0x81,%l0	! %l0 = 000000000000ffb4
!	Mem[0000000030001410] = 5a000000, %f20 = 4e438604
	lda	[%i0+%o5]0x89,%f20	! %f20 = 5a000000
!	Mem[0000000010001410] = 00000000, %l2 = 00000000d8152cff
	lduwa	[%i0+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f4  = 1faa72ac, %f7  = d87af5cb, %f28 = 401237c1 22bf4ca7
	fsmuld	%f4 ,%f7 ,%f28		! %f28 = bf14e2f4 5bf14c80

p0_label_20:
!	%l4 = 0000000000001044, imm = fffffffffffff975, %l2 = 0000000000000000
	addc	%l4,-0x68b,%l2		! %l2 = 00000000000009b9
!	Mem[0000000030101410] = ff000000, %l7 = 215a2b81bdc8508b
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 00000000ff000000
!	Mem[0000000010001408] = 0a50fdba, %l0 = 000000000000ffb4
	ldswa	[%i0+%o4]0x88,%l0	! %l0 = 000000000a50fdba
!	%f15 = 3d1b9b7a, %f30 = 48000000 7f2178de
	fstox	%f15,%f30		! %f30 = 00000000 00000000
!	%f4  = 1faa72ac, Mem[00000000100c1414] = b83c0000
	sta	%f4 ,[%i3+0x014]%asi	! Mem[00000000100c1414] = 1faa72ac
!	Mem[0000000030081408] = 0486434e, %l0 = 000000000a50fdba
	ldstuba	[%i2+%o4]0x89,%l0	! %l0 = 0000004e000000ff
!	%f12 = c633a09f, %f18 = 4e438604, %f5  = 1b8a91dd
	fdivs	%f12,%f18,%f5 		! %f5  = b76b2feb
!	%f14 = d865e347 3d1b9b7a, Mem[0000000030081408] = ff438604 38efb2ea
	stda	%f14,[%i2+%o4]0x81	! Mem[0000000030081408] = d865e347 3d1b9b7a
!	Mem[0000000030141410] = 000000bb, %l4 = 0000000000001044
	ldstuba	[%i5+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 0cf6a7b1, %l4 = 0000000000000000
	lduwa	[%i5+%o4]0x89,%l4	! %l4 = 000000000cf6a7b1

p0_label_21:
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010101400] = 9c99ede9 939b8360 ff10fac2 13132df6
!	Mem[0000000010101410] = 929733c9 843fd55e 6f4004d8 136a9ee8
!	Mem[0000000010101420] = 00002726 000000f5 7cceb22d 1c255eee
!	Mem[0000000010101430] = a266c8ba 2430509a 14f78a44 d0d0237c
	ldda	[%i4]ASI_BLK_AIUP,%f16	! Block Load from 0000000010101400
!	Mem[0000000010101420] = 00002726 000000f5, %l2 = 000009b9, %l3 = cdec84c8
	ldda	[%i4+0x020]%asi,%l2	! %l2 = 0000000000002726 00000000000000f5
!	Mem[0000000030181408] = f9e63498, %l4 = 000000000cf6a7b1
	ldswa	[%i6+%o4]0x89,%l4	! %l4 = fffffffff9e63498
!	Mem[0000000030101400] = 00000000, %l1 = 64266065433910a6
	ldsha	[%i4+%g0]0x89,%l1	! %l1 = 0000000000000000
!	%f11 = 87035e47, %f11 = 87035e47, %f6  = 927bb9e0
	fdivs	%f11,%f11,%f6 		! %f6  = 3f800000
!	Mem[00000000300c1400] = ffb40000, %l0 = 000000000000004e
	ldswa	[%i3+%g0]0x81,%l0	! %l0 = ffffffffffb40000
!	Mem[0000000010181408] = 489efcf1 5ff41b26, %l4 = f9e63498, %l5 = b1d3b4cc
	ldda	[%i6+%o4]0x88,%l4	! %l4 = 000000005ff41b26 00000000489efcf1
!	Mem[0000000010141408] = 9834e6f9, %l6 = ffffffff9834e6f9
	ldsba	[%i5+%o4]0x80,%l6	! %l6 = ffffffffffffff98
!	Mem[00000000300c1400] = 0000b4ff, %f1  = 000000ff
	lda	[%i3+%g0]0x89,%f1 	! %f1 = 0000b4ff
!	Starting 10 instruction Store Burst
!	Code Fragment 3
p0_fragment_4:
!	%l0 = ffffffffffb40000
	setx	0xa2c6f7cffa22faa6,%g7,%l0 ! %l0 = a2c6f7cffa22faa6
!	%l1 = 0000000000000000
	setx	0x56e63d887d153565,%g7,%l1 ! %l1 = 56e63d887d153565
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a2c6f7cffa22faa6
	setx	0x3863202fff717928,%g7,%l0 ! %l0 = 3863202fff717928
!	%l1 = 56e63d887d153565
	setx	0x3bde7be7d74a031b,%g7,%l1 ! %l1 = 3bde7be7d74a031b

p0_label_22:
!	%f15 = 3d1b9b7a, Mem[0000000010141400] = 5a000000
	sta	%f15,[%i5+%g0]0x80	! Mem[0000000010141400] = 3d1b9b7a
!	%l3 = 00000000000000f5, Mem[0000000010181410] = be190969
	stba	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = be1909f5
!	Mem[0000000010141434] = b1d3b4cc, %l0 = 3863202fff717928
	ldstub	[%i5+0x034],%l0		! %l0 = 000000b1000000ff
!	Mem[0000000030101408] = 8a0ac6aa, %l6 = ffffffffffffff98
	swapa	[%i4+%o4]0x89,%l6	! %l6 = 000000008a0ac6aa
!	%l5 = 00000000489efcf1, Mem[0000000030081410] = bb0000008421db70
	stxa	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000489efcf1
!	%f7  = d87af5cb, Mem[0000000030101408] = ffffff98
	sta	%f7 ,[%i4+%o4]0x89	! Mem[0000000030101408] = d87af5cb
!	%f8  = d98f764e f5d0fb1d, Mem[0000000010081400] = 2b4a6d03 5c7e2726
	stda	%f8 ,[%i2+%g0]0x80	! Mem[0000000010081400] = d98f764e f5d0fb1d
!	%l0 = 00000000000000b1, Mem[0000000010041400] = bdc8508b
	stha	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = bdc800b1
!	%f0  = bfa2e598 0000b4ff, %l5 = 00000000489efcf1
!	Mem[0000000030181438] = 8b9717d59b280e76
	add	%i6,0x038,%g1
	stda	%f0,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030181438] = ff9717d598e5a2bf
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00005aa1, %l4 = 000000005ff41b26
	ldsha	[%i6+%g0]0x80,%l4	! %l4 = 0000000000000000

p0_label_23:
!	Mem[0000000030081400] = 196fb9ff, %l5 = 00000000489efcf1
	lduba	[%i2+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%l7 = 00000000ff000000, imm = 0000000000000f0d, %l0 = 00000000000000b1
	sub	%l7,0xf0d,%l0		! %l0 = 00000000fefff0f3
!	Mem[0000000010001400] = 68f66f14, %l3 = 00000000000000f5
	ldsha	[%i0+%g0]0x80,%l3	! %l3 = 00000000000068f6
!	Mem[0000000010081400] = d98f764e f5d0fb1d, %l0 = fefff0f3, %l1 = d74a031b
	ldda	[%i2+%g0]0x80,%l0	! %l0 = 00000000d98f764e 00000000f5d0fb1d
!	Mem[0000000010101414] = 843fd55e, %l5 = 00000000000000ff
	lduw	[%i4+0x014],%l5		! %l5 = 00000000843fd55e
!	Mem[00000000100c1400] = 000000ff, %l7 = 00000000ff000000
	lduha	[%i3+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	%f12 = c633a09f, %f4  = 1faa72ac
	fcmpes	%fcc1,%f12,%f4 		! %fcc1 = 1
!	Mem[00000000211c0000] = ffcdfcae, %l1 = 00000000f5d0fb1d
	ldub	[%o2+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010081420] = 0dfe930c, %l7 = 00000000000000ff
	ldsh	[%i2+0x022],%l7		! %l7 = ffffffffffff930c
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[00000000300c1408] = de78217f00000048
	stxa	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000000000ff

p0_label_24:
!	Mem[0000000010141400] = 7a9b1b3d, %l2 = 0000000000002726
	ldstuba	[%i5+%g0]0x88,%l2	! %l2 = 0000003d000000ff
!	%f28 = a266c8ba 2430509a, Mem[0000000030001410] = 5a000000 018b7a46
	stda	%f28,[%i0+%o5]0x89	! Mem[0000000030001410] = a266c8ba 2430509a
!	%f8  = d98f764e f5d0fb1d, %l1 = 00000000000000ff
!	Mem[0000000010041408] = ff2c15d8c884eccd
	add	%i1,0x008,%g1
	stda	%f8,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010041408] = 1dfbd0f54e768fd9
!	%l2 = 0000003d, %l3 = 000068f6, Mem[00000000300c1410] = 17bb05c0 331d295f
	stda	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000003d 000068f6
!	%l1 = 00000000000000ff, Mem[00000000100c1408] = 31458734
	stba	%l1,[%i3+%o4]0x88	! Mem[00000000100c1408] = 314587ff
!	%l1 = 00000000000000ff, Mem[000000001004142c] = 433910a6
	sth	%l1,[%i1+0x02c]		! Mem[000000001004142c] = 00ff10a6
!	Mem[0000000030181410] = 5788deff, %l3 = 00000000000068f6
	swapa	[%i6+%o5]0x89,%l3	! %l3 = 000000005788deff
!	Mem[00000000100c1410] = f9e63498, %l6 = 000000008a0ac6aa
	swapa	[%i3+%o5]0x80,%l6	! %l6 = 00000000f9e63498
!	%f9  = f5d0fb1d, Mem[000000001004140c] = 4e768fd9
	st	%f9 ,[%i1+0x00c]	! Mem[000000001004140c] = f5d0fb1d
!	Starting 10 instruction Load Burst
!	%l0 = 00000000d98f764e, %l5 = 00000000843fd55e, %l2 = 000000000000003d
	udivx	%l0,%l5,%l2		! %l2 = 0000000000000001

p0_label_25:
!	Mem[0000000030041408] = 44100000 00000000, %l4 = 00000000, %l5 = 843fd55e
	ldda	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000000 0000000044100000
!	Mem[0000000010041420] = c57ad1f4c5a5f115, %l1 = 00000000000000ff
	ldxa	[%i1+0x020]%asi,%l1	! %l1 = c57ad1f4c5a5f115
!	Mem[0000000010181410] = be1909f5, %l6 = 00000000f9e63498
	lduba	[%i6+%o5]0x88,%l6	! %l6 = 00000000000000f5
!	Mem[0000000030101410] = bfa2e5988b50c8bd, %l7 = ffffffffffff930c
	ldxa	[%i4+%o5]0x89,%l7	! %l7 = bfa2e5988b50c8bd
!	Mem[0000000010081408] = 0a39c11ed8152c7c, %l6 = 00000000000000f5
	ldxa	[%i2+%o4]0x88,%l6	! %l6 = 0a39c11ed8152c7c
!	Mem[0000000030041410] = c2fa1044e6e736ac, %f16 = 9c99ede9 939b8360
	ldda	[%i1+%o5]0x81,%f16	! %f16 = c2fa1044 e6e736ac
!	Mem[00000000100c1410] = 8a0ac6aa1faa72ac, %l6 = 0a39c11ed8152c7c
	ldxa	[%i3+%o5]0x80,%l6	! %l6 = 8a0ac6aa1faa72ac
!	Mem[0000000030081408] = d865e347, %f9  = f5d0fb1d
	lda	[%i2+%o4]0x81,%f9 	! %f9 = d865e347
!	Mem[0000000010101400] = 60839b93 e9ed999c, %l6 = 1faa72ac, %l7 = 8b50c8bd
	ldda	[%i4+%g0]0x88,%l6	! %l6 = 00000000e9ed999c 0000000060839b93
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = ffb40000, %l3 = 000000005788deff
	swapa	[%i3+%g0]0x81,%l3	! %l3 = 00000000ffb40000

p0_label_26:
!	Mem[00000000201c0000] = 27268819, %l5 = 0000000044100000
	ldstuba	[%o0+0x000]%asi,%l5	! %l5 = 00000027000000ff
!	%l3 = 00000000ffb40000, Mem[0000000010141400] = ff1b9b7a
	stha	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 00009b7a
!	Mem[000000001018142f] = 213850d4, %l5 = 0000000000000027
	ldstub	[%i6+0x02f],%l5		! %l5 = 000000d4000000ff
!	Mem[0000000010041410] = bb000000, %l1 = c57ad1f4c5a5f115
	ldstuba	[%i1+%o5]0x80,%l1	! %l1 = 000000bb000000ff
	membar	#Sync			! Added by membar checker (4)
!	%l6 = e9ed999c, %l7 = 60839b93, Mem[0000000010101410] = c9339792 5ed53f84
	stda	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = e9ed999c 60839b93
!	Mem[0000000030001408] = 053f74ff, %l5 = 00000000000000d4
	ldstuba	[%i0+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	%l2 = 0000000000000001, Mem[0000000010081438] = d08d29e9dee7b124, %asi = 80
	stxa	%l2,[%i2+0x038]%asi	! Mem[0000000010081438] = 0000000000000001
!	%l6 = e9ed999c, %l7 = 60839b93, Mem[0000000010101408] = c2fa10ff f62d1313
	stda	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = e9ed999c 60839b93
!	%f27 = 1c255eee, Mem[00000000100c1410] = 8a0ac6aa
	sta	%f27,[%i3+%o5]0x80	! Mem[00000000100c1410] = 1c255eee
!	Starting 10 instruction Load Burst
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000030101410] = bdc8508b 98e5a2bf
	stda	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000 000000ff

p0_label_27:
!	Mem[0000000010081418] = 7cdb760ed14f7588, %f18 = ff10fac2 13132df6
	ldda	[%i2+0x018]%asi,%f18	! %f18 = 7cdb760e d14f7588
!	%l5 = 00000000000000ff, %l3 = 00000000ffb40000, %l4 = 0000000000000000
	addc	%l5,%l3,%l4		! %l4 = 00000000ffb400ff
!	Mem[00000000100c1400] = 000000ff, %f31 = d0d0237c
	lda	[%i3+%g0]0x88,%f31	! %f31 = 000000ff
!	Mem[0000000030181408] = 9834e6f95c7e2726, %f0  = bfa2e598 0000b4ff
	ldda	[%i6+%o4]0x81,%f0 	! %f0  = 9834e6f9 5c7e2726
!	Mem[0000000020800000] = b67bc3ca, %l7 = 0000000060839b93
	ldub	[%o1+%g0],%l7		! %l7 = 00000000000000b6
!	Mem[00000000100c1410] = ee5e251c, %l2 = 0000000000000001
	ldsba	[%i3+%o5]0x88,%l2	! %l2 = 000000000000001c
!	Mem[0000000010041408] = 1dfbd0f5, %l7 = 00000000000000b6
	lduwa	[%i1+%o4]0x80,%l7	! %l7 = 000000001dfbd0f5
!	Mem[0000000010181434] = 9fa033c6, %l4 = 00000000ffb400ff
	ldsha	[%i6+0x034]%asi,%l4	! %l4 = ffffffffffff9fa0
!	Mem[0000000010001424] = 5ca1977b, %l2 = 000000000000001c
	lduwa	[%i0+0x024]%asi,%l2	! %l2 = 000000005ca1977b
!	Starting 10 instruction Store Burst
!	Mem[0000000010041404] = 812b5a21, %l7 = 000000001dfbd0f5
	ldstub	[%i1+0x004],%l7		! %l7 = 00000081000000ff

p0_label_28:
!	Mem[0000000010041410] = ff000000, %l2 = 000000005ca1977b, %asi = 80
	swapa	[%i1+0x010]%asi,%l2	! %l2 = 00000000ff000000
!	%f19 = d14f7588, Mem[0000000030181400] = ff4cbf22
	sta	%f19,[%i6+%g0]0x81	! Mem[0000000030181400] = d14f7588
!	Mem[0000000010041410] = 7b97a15c, %l5 = 00000000000000ff
	swapa	[%i1+%o5]0x88,%l5	! %l5 = 000000007b97a15c
!	%l2 = 00000000ff000000, Mem[00000000201c0001] = ff268819
	stb	%l2,[%o0+0x001]		! Mem[00000000201c0000] = ff008819
!	Mem[0000000030001410] = 9a503024, %l7 = 0000000000000081
	ldstuba	[%i0+%o5]0x81,%l7	! %l7 = 0000009a000000ff
!	Mem[00000000201c0000] = ff008819, %l0 = 00000000d98f764e
	ldstuba	[%o0+0x000]%asi,%l0	! %l0 = 000000ff000000ff
!	%f22 = 6f4004d8, %f16 = c2fa1044, %f10 = d4503821
	fdivs	%f22,%f16,%f10		! %f10 = ebc493d1
!	%l7 = 000000000000009a, Mem[0000000020800001] = b67bc3ca, %asi = 80
	stba	%l7,[%o1+0x001]%asi	! Mem[0000000020800000] = b69ac3ca
!	Mem[0000000010001430] = 20f1f32e7f2178de, %l5 = 000000007b97a15c, %l4 = ffffffffffff9fa0
	add	%i0,0x30,%g1
	casxa	[%g1]0x80,%l5,%l4	! %l4 = 20f1f32e7f2178de
!	Starting 10 instruction Load Burst
!	Mem[000000001000140c] = ac36e7e6, %l3 = 00000000ffb40000
	ldub	[%i0+0x00e],%l3		! %l3 = 00000000000000e7

p0_label_29:
!	Mem[0000000030001408] = ff743f05 4410fac2, %l2 = ff000000, %l3 = 000000e7
	ldda	[%i0+%o4]0x81,%l2	! %l2 = 00000000ff743f05 000000004410fac2
!	Mem[0000000010001404] = f3ff754f, %l6 = 00000000e9ed999c
	ldswa	[%i0+0x004]%asi,%l6	! %l6 = fffffffff3ff754f
!	Mem[0000000030041410] = c2fa1044, %l6 = fffffffff3ff754f
	lduwa	[%i1+%o5]0x81,%l6	! %l6 = 00000000c2fa1044
!	Mem[0000000010181400] = 00005aa1, %l7 = 000000000000009a
	ldsba	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1400] = 5788deff, %l0 = 00000000000000ff
	lduwa	[%i3+%g0]0x81,%l0	! %l0 = 000000005788deff
!	Mem[00000000211c0000] = ffcdfcae, %l5 = 000000007b97a15c
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = ffffffffffffffcd
!	Mem[0000000010081400] = 4e768fd9, %l5 = ffffffffffffffcd
	ldsha	[%i2+%g0]0x88,%l5	! %l5 = ffffffffffff8fd9
!	Mem[0000000030081408] = 47e365d8, %l1 = 00000000000000bb
	lduwa	[%i2+%o4]0x89,%l1	! %l1 = 0000000047e365d8
!	Mem[00000000100c1408] = 314587ff, %l3 = 000000004410fac2
	ldsba	[%i3+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l6 = c2fa1044, %l7 = 00000000, Mem[0000000030101410] = 00000000 ff000000
	stda	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = c2fa1044 00000000

p0_label_30:
!	%l7 = 0000000000000000, Mem[0000000010081410] = 7f113cb8
	stha	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = 7f110000
!	%l5 = ffffffffffff8fd9, Mem[0000000030081408] = d865e3473d1b9b7a
	stxa	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = ffffffffffff8fd9
!	Mem[0000000010001430] = 20f1f32e, %l4 = 7f2178de, %l4 = 7f2178de
	add	%i0,0x30,%g1
	casa	[%g1]0x80,%l4,%l4	! %l4 = 0000000020f1f32e
!	Mem[0000000030181410] = 000068f6, %l3 = ffffffffffffffff
	swapa	[%i6+%o5]0x89,%l3	! %l3 = 00000000000068f6
!	Mem[0000000010181408] = 5ff41b26, %l2 = 00000000ff743f05
	ldstuba	[%i6+%o4]0x88,%l2	! %l2 = 00000026000000ff
!	Mem[0000000010181410] = be1909f5, %l3 = 00000000000068f6
	ldstuba	[%i6+%o5]0x88,%l3	! %l3 = 000000f5000000ff
!	%l3 = 00000000000000f5, %l3 = 00000000000000f5, %l0 = 000000005788deff
	add	%l3,%l3,%l0		! %l0 = 00000000000001ea
!	Code Fragment 3
p0_fragment_5:
!	%l0 = 00000000000001ea
	setx	0x693fce5fd219cffe,%g7,%l0 ! %l0 = 693fce5fd219cffe
!	%l1 = 0000000047e365d8
	setx	0x869e4c4fe8cf2d37,%g7,%l1 ! %l1 = 869e4c4fe8cf2d37
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 693fce5fd219cffe
	setx	0x8e444548639ef010,%g7,%l0 ! %l0 = 8e444548639ef010
!	%l1 = 869e4c4fe8cf2d37
	setx	0x5b4af9c7e2ab5ed3,%g7,%l1 ! %l1 = 5b4af9c7e2ab5ed3
!	Mem[0000000030001408] = 053f74ff, %l4 = 0000000020f1f32e
	ldstuba	[%i0+%o4]0x89,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = f9e63498, %l5 = ffffffffffff8fd9
	ldswa	[%i5+%o4]0x88,%l5	! %l5 = fffffffff9e63498

p0_label_31:
!	Mem[00000000100c1408] = 7c23d0d0314587ff, %f6  = 3f800000 d87af5cb
	ldda	[%i3+%o4]0x88,%f6 	! %f6  = 7c23d0d0 314587ff
!	Mem[0000000010141400] = 7a9b0000, %l5 = fffffffff9e63498
	ldswa	[%i5+%g0]0x88,%l5	! %l5 = 000000007a9b0000
!	Mem[0000000030001408] = 053f74ff, %l3 = 00000000000000f5
	lduba	[%i0+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081410] = f1fc9e4800000000, %f16 = c2fa1044 e6e736ac
	ldda	[%i2+%o5]0x89,%f16	! %f16 = f1fc9e48 00000000
!	Mem[00000000300c1408] = ff00000000000000, %l6 = 00000000c2fa1044
	ldxa	[%i3+%o4]0x89,%l6	! %l6 = ff00000000000000
!	Mem[0000000010141438] = 26f68604, %l3 = 00000000000000ff
	lduh	[%i5+0x03a],%l3		! %l3 = 0000000000008604
!	Mem[0000000030181410] = 94b99440ffffffff, %f4  = 1faa72ac b76b2feb
	ldda	[%i6+%o5]0x89,%f4 	! %f4  = 94b99440 ffffffff
!	Mem[0000000030041400] = 0111a7de c3ad8ff6, %l0 = 639ef010, %l1 = e2ab5ed3
	ldda	[%i1+%g0]0x81,%l0	! %l0 = 000000000111a7de 00000000c3ad8ff6
!	Mem[00000000300c1410] = 3d000000, %l7 = 0000000000000000
	ldsba	[%i3+%o5]0x81,%l7	! %l7 = 000000000000003d
!	Starting 10 instruction Store Burst
!	%f16 = f1fc9e48, Mem[0000000010101410] = 9c99ede9
	sta	%f16,[%i4+%o5]0x80	! Mem[0000000010101410] = f1fc9e48

p0_label_32:
!	Mem[00000000211c0000] = ffcdfcae, %l3 = 0000000000008604
	ldstub	[%o2+%g0],%l3		! %l3 = 000000ff000000ff
!	%f16 = f1fc9e48 00000000, Mem[00000000100c1408] = ff874531 d0d0237c
	std	%f16,[%i3+%o4]	! Mem[00000000100c1408] = f1fc9e48 00000000
!	Code Fragment 4
p0_fragment_6:
!	%l0 = 000000000111a7de
	setx	0x441605a029916196,%g7,%l0 ! %l0 = 441605a029916196
!	%l1 = 00000000c3ad8ff6
	setx	0x0255282f875bb99e,%g7,%l1 ! %l1 = 0255282f875bb99e
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 441605a029916196
	setx	0xb61ea01fba30e2d5,%g7,%l0 ! %l0 = b61ea01fba30e2d5
!	%l1 = 0255282f875bb99e
	setx	0x53b7f2ff8317b120,%g7,%l1 ! %l1 = 53b7f2ff8317b120
!	Mem[0000000020800041] = 237cbf87, %l5 = 000000007a9b0000
	ldstuba	[%o1+0x041]%asi,%l5	! %l5 = 0000007c000000ff
!	%l0 = b61ea01fba30e2d5, Mem[00000000100c1410] = ee5e251c
	stba	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = ee5e25d5
!	%l7 = 000000000000003d, Mem[0000000010001408] = 0a50fdba
	stha	%l7,[%i0+%o4]0x88	! Mem[0000000010001408] = 0a50003d
!	%l7 = 000000000000003d, Mem[0000000030141400] = ff2c15d8
	stha	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = 003d15d8
!	%f0  = 9834e6f9 5c7e2726, Mem[0000000030081400] = ffb96f19 378e9c67
	stda	%f0 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 9834e6f9 5c7e2726
!	%l5 = 000000000000007c, Mem[00000000211c0001] = ffcdfcae, %asi = 80
	stba	%l5,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff7cfcae
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 0000117f82b12959, %l4 = 00000000000000ff
	ldxa	[%i2+%o5]0x80,%l4	! %l4 = 0000117f82b12959

p0_label_33:
!	Mem[0000000030141408] = 0cf6a7b1, %l1 = 53b7f2ff8317b120
	ldsha	[%i5+%o4]0x89,%l1	! %l1 = ffffffffffffa7b1
!	Mem[0000000030081408] = ffffffff, %l2 = 0000000000000026
	lduwa	[%i2+%o4]0x81,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000010001410] = 0000000000005aa1, %f26 = 7cceb22d 1c255eee
	ldd	[%i0+%o5],%f26		! %f26 = 00000000 00005aa1
!	%f1  = 5c7e2726, %f3  = 5ff41b26
	fcmps	%fcc1,%f1 ,%f3 		! %fcc1 = 1
!	Mem[00000000300c1400] = 5788deff, %l7 = 000000000000003d
	ldsha	[%i3+%g0]0x81,%l7	! %l7 = 0000000000005788
!	Mem[00000000300c1400] = ffde8857, %l1 = ffffffffffffa7b1
	lduwa	[%i3+%g0]0x89,%l1	! %l1 = 00000000ffde8857
!	Mem[0000000030101400] = bb00000000000000, %f26 = 00000000 00005aa1
	ldda	[%i4+%g0]0x89,%f26	! %f26 = bb000000 00000000
!	Mem[0000000030041408] = 00000000, %l5 = 000000000000007c
	lduwa	[%i1+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = e6e736ac 0a50003d, %l2 = ffffffff, %l3 = 000000ff
	ldda	[%i0+%o4]0x88,%l2	! %l2 = 000000000a50003d 00000000e6e736ac
!	Starting 10 instruction Store Burst
!	%f10 = ebc493d1 87035e47, Mem[0000000010041400] = b100c8bd ff2b5a21
	stda	%f10,[%i1+%g0]0x80	! Mem[0000000010041400] = ebc493d1 87035e47

p0_label_34:
!	%l0 = b61ea01fba30e2d5, Mem[00000000100c1408] = 489efcf1
	stba	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 489efcd5
!	%f20 = 929733c9 843fd55e, Mem[0000000010041400] = ebc493d1 87035e47
	stda	%f20,[%i1+%g0]0x80	! Mem[0000000010041400] = 929733c9 843fd55e
!	%l0 = b61ea01fba30e2d5, Mem[000000001008140d] = 1ec1390a
	stb	%l0,[%i2+0x00d]		! Mem[000000001008140c] = 1ed5390a
!	Mem[0000000010181400] = a15a0000, %f15 = 3d1b9b7a
	lda	[%i6+%g0]0x88,%f15	! %f15 = a15a0000
!	Mem[0000000030101410] = 4410fac2, %l4 = 0000117f82b12959
	ldstuba	[%i4+%o5]0x81,%l4	! %l4 = 00000044000000ff
!	%f12 = c633a09f 37804ed2, Mem[0000000030001400] = e700e0ff 555f8be3
	stda	%f12,[%i0+%g0]0x89	! Mem[0000000030001400] = c633a09f 37804ed2
!	Mem[0000000010001418] = 6c4a7a81c5f9822a, %l0 = b61ea01fba30e2d5, %l1 = 00000000ffde8857
	add	%i0,0x18,%g1
	casxa	[%g1]0x80,%l0,%l1	! %l1 = 6c4a7a81c5f9822a
!	Mem[00000000100c1400] = 000000ff, %l2 = 000000000a50003d
	ldstuba	[%i3+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000300c1400] = 5788deff, %l2 = 00000000000000ff
	swapa	[%i3+%g0]0x81,%l2	! %l2 = 000000005788deff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = d5fc9e48, %l5 = 0000000000000000
	ldsba	[%i3+%o4]0x80,%l5	! %l5 = ffffffffffffffd5

p0_label_35:
!	Mem[00000000100c1410] = ac72aa1f ee5e25d5, %l4 = 00000044, %l5 = ffffffd5
	ldda	[%i3+%o5]0x88,%l4	! %l4 = 00000000ee5e25d5 00000000ac72aa1f
!	Mem[0000000010041408] = 1dfbd0f5, %l3 = 00000000e6e736ac
	lduwa	[%i1+%o4]0x80,%l3	! %l3 = 000000001dfbd0f5
!	Mem[0000000030141410] = 10000000 bb0000ff, %l0 = ba30e2d5, %l1 = c5f9822a
	ldda	[%i5+%o5]0x89,%l0	! %l0 = 00000000bb0000ff 0000000010000000
!	Mem[0000000010081408] = 7c2c15d8, %f11 = 87035e47
	ld	[%i2+%o4],%f11	! %f11 = 7c2c15d8
!	Mem[0000000030001408] = ff743f05, %f24 = 00002726
	lda	[%i0+%o4]0x81,%f24	! %f24 = ff743f05
!	Mem[0000000010101408] = e9ed999c, %l4 = 00000000ee5e25d5
	lduha	[%i4+%o4]0x88,%l4	! %l4 = 000000000000999c
!	Mem[00000000300c1410] = 0000003d, %l6 = ff00000000000000
	lduba	[%i3+%o5]0x89,%l6	! %l6 = 000000000000003d
!	Mem[0000000010081408] = 7c2c15d8, %l7 = 0000000000005788
	ldsha	[%i2+%o4]0x80,%l7	! %l7 = 0000000000007c2c
!	Mem[0000000010181424] = 4e768fd9, %l5 = 00000000ac72aa1f
	ldsba	[%i6+0x024]%asi,%l5	! %l5 = 000000000000004e
!	Starting 10 instruction Store Burst
!	%l3 = 000000001dfbd0f5, Mem[0000000010001410] = 00000000
	stwa	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 1dfbd0f5

p0_label_36:
!	Mem[0000000010101408] = e9ed999c, %l4 = 000000000000999c
	swapa	[%i4+%o4]0x88,%l4	! %l4 = 00000000e9ed999c
!	%l4 = 00000000e9ed999c, Mem[00000000100c1408] = d5fc9e48
	stha	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 999c9e48
!	Mem[0000000010141416] = 414bcdf5, %l3 = 000000001dfbd0f5
	ldstuba	[%i5+0x016]%asi,%l3	! %l3 = 000000cd000000ff
!	%f12 = c633a09f, Mem[0000000030141408] = b1a7f60c
	sta	%f12,[%i5+%o4]0x81	! Mem[0000000030141408] = c633a09f
!	%f20 = 929733c9, Mem[0000000010181434] = 9fa033c6
	sta	%f20,[%i6+0x034]%asi	! Mem[0000000010181434] = 929733c9
!	Mem[0000000010041408] = 1dfbd0f5, %l3 = 00000000000000cd
	swapa	[%i1+%o4]0x80,%l3	! %l3 = 000000001dfbd0f5
!	%l2 = 5788deff, %l3 = 1dfbd0f5, Mem[0000000030081410] = 00000000 f1fc9e48
	stda	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 5788deff 1dfbd0f5
!	%f24 = ff743f05 000000f5, %l1 = 0000000010000000
!	Mem[0000000010181428] = 475e0387213850ff
	add	%i6,0x028,%g1
	stda	%f24,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010181428] = 475e0387213850ff
!	%l5 = 000000000000004e, Mem[0000000030181410] = ffffffff
	stha	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = 004effff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = e9ed999c, %l2 = 000000005788deff
	ldsha	[%i4+%g0]0x88,%l2	! %l2 = ffffffffffff999c

p0_label_37:
!	Mem[00000000300c1410] = 0000003d, %l5 = 000000000000004e
	lduha	[%i3+%o5]0x89,%l5	! %l5 = 000000000000003d
!	Mem[000000001008140c] = 1ed5390a, %f11 = 7c2c15d8
	lda	[%i2+0x00c]%asi,%f11	! %f11 = 1ed5390a
!	Mem[00000000300c1408] = 00000000000000ff, %f14 = d865e347 a15a0000
	ldda	[%i3+%o4]0x81,%f14	! %f14 = 00000000 000000ff
!	Mem[0000000010001400] = 146ff668, %l6 = 000000000000003d
	lduha	[%i0+%g0]0x88,%l6	! %l6 = 000000000000f668
!	Mem[0000000010041438] = f3d4369b, %l5 = 000000000000003d
	lduwa	[%i1+0x038]%asi,%l5	! %l5 = 00000000f3d4369b
!	Mem[0000000010041400] = 929733c9843fd55e, %f24 = ff743f05 000000f5
	ldda	[%i1+%g0]0x80,%f24	! %f24 = 929733c9 843fd55e
!	%l3 = 000000001dfbd0f5, immed = 0000031e, %y  = b2743f05
	smul	%l3,0x31e,%l0		! %l0 = 0000005d76f55bb6, %y = 0000005d
!	Mem[00000000100c1410] = d5255eee 1faa72ac, %l2 = ffff999c, %l3 = 1dfbd0f5
	ldda	[%i3+0x010]%asi,%l2	! %l2 = 00000000d5255eee 000000001faa72ac
!	Mem[0000000010041400] = 5ed53f84c9339792, %f0  = 9834e6f9 5c7e2726
	ldda	[%i1+%g0]0x88,%f0 	! %f0  = 5ed53f84 c9339792
!	Starting 10 instruction Store Burst
!	%l6 = 000000000000f668, Mem[0000000010041404] = 843fd55e
	sth	%l6,[%i1+0x004]		! Mem[0000000010041404] = f668d55e

p0_label_38:
!	Mem[0000000030101400] = 00000000, %l4 = 00000000e9ed999c
	ldstuba	[%i4+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041410] = 4410fac2, %l0 = 0000005d76f55bb6
	swapa	[%i1+%o5]0x89,%l0	! %l0 = 000000004410fac2
!	Mem[0000000030141410] = bb0000ff, %l5 = 00000000f3d4369b
	swapa	[%i5+%o5]0x89,%l5	! %l5 = 00000000bb0000ff
!	Mem[0000000030001400] = d24e8037, %l7 = 0000000000007c2c
	ldstuba	[%i0+%g0]0x81,%l7	! %l7 = 000000d2000000ff
!	Mem[0000000010141400] = 7a9b0000, %l3 = 000000001faa72ac
	ldstuba	[%i5+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	%l0 = 4410fac2, %l1 = 10000000, Mem[00000000300c1400] = ff000000 929733c9
	stda	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 4410fac2 10000000
!	Mem[0000000021800001] = 52fdb05a, %l3 = 0000000000000000
	ldstuba	[%o3+0x001]%asi,%l3	! %l3 = 000000fd000000ff
!	Mem[0000000030101400] = 000000ff, %l0 = 000000004410fac2
	ldstuba	[%i4+%g0]0x89,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010081410] = 7f110000, %l2 = 00000000d5255eee
	swapa	[%i2+%o5]0x88,%l2	! %l2 = 000000007f110000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000 000000ff, %l0 = 000000ff, %l1 = 10000000
	ldda	[%i1+%o5]0x88,%l0	! %l0 = 00000000000000ff 0000000000000000

p0_label_39:
!	Mem[00000000300c1400] = 100000004410fac2, %f10 = ebc493d1 1ed5390a
	ldda	[%i3+%g0]0x89,%f10	! %f10 = 10000000 4410fac2
!	Mem[0000000010081438] = 00000000, %l5 = 00000000bb0000ff
	ldsw	[%i2+0x038],%l5		! %l5 = 0000000000000000
!	%f28 = a266c8ba, %f2  = 489efcf1
	fsqrts	%f28,%f2 		! %f2  = 7fffffff
!	Mem[0000000030141408] = c633a09f, %l2 = 000000007f110000
	lduwa	[%i5+%o4]0x81,%l2	! %l2 = 00000000c633a09f
!	Mem[000000001014141c] = 1b8a91dd, %f11 = 4410fac2
	lda	[%i5+0x01c]%asi,%f11	! %f11 = 1b8a91dd
!	Mem[0000000010141410] = f9e63498, %l0 = 00000000000000ff
	ldsha	[%i5+%o5]0x88,%l0	! %l0 = 0000000000003498
!	Mem[000000001000143c] = cfd7dfe2, %l7 = 00000000000000d2
	lduba	[%i0+0x03c]%asi,%l7	! %l7 = 00000000000000cf
!	Mem[0000000010101408] = 0000999c, %f11 = 1b8a91dd
	lda	[%i4+%o4]0x88,%f11	! %f11 = 0000999c
!	Mem[0000000030001408] = ff743f05, %l2 = 00000000c633a09f
	lduba	[%i0+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 243050ff, %l6 = 000000000000f668
	ldstuba	[%i0+%o5]0x89,%l6	! %l6 = 000000ff000000ff

p0_label_40:
!	Mem[0000000010001410] = 1dfbd0f5, %l4 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l4	! %l4 = 000000001dfbd0f5
!	Mem[00000000100c1408] = 999c9e48, %l2 = 00000000000000ff
	swapa	[%i3+%o4]0x80,%l2	! %l2 = 00000000999c9e48
!	Code Fragment 4
p0_fragment_7:
!	%l0 = 0000000000003498
	setx	0x69dfe75795385bc0,%g7,%l0 ! %l0 = 69dfe75795385bc0
!	%l1 = 0000000000000000
	setx	0xe46333dfe8a22f0c,%g7,%l1 ! %l1 = e46333dfe8a22f0c
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 69dfe75795385bc0
	setx	0xe9d59a682f744a4d,%g7,%l0 ! %l0 = e9d59a682f744a4d
!	%l1 = e46333dfe8a22f0c
	setx	0x0e474e1019578325,%g7,%l1 ! %l1 = 0e474e1019578325
!	%f0  = 5ed53f84, Mem[0000000010041400] = c9339792
	sta	%f0 ,[%i1+%g0]0x88	! Mem[0000000010041400] = 5ed53f84
!	Mem[0000000010141410] = 9834e6f9, %l7 = 00000000000000cf
	ldstuba	[%i5+0x010]%asi,%l7	! %l7 = 00000098000000ff
!	%l1 = 0e474e1019578325, Mem[0000000010181408] = ff1bf45ff1fc9e48
	stxa	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = 0e474e1019578325
!	Mem[0000000030141410] = f3d4369b, %l6 = 00000000000000ff
	swapa	[%i5+%o5]0x89,%l6	! %l6 = 00000000f3d4369b
!	%l4 = 000000001dfbd0f5, Mem[0000000010081404] = f5d0fb1d, %asi = 80
	stwa	%l4,[%i2+0x004]%asi	! Mem[0000000010081404] = 1dfbd0f5
!	%l6 = 00000000f3d4369b, Mem[0000000010101408] = 9c990000939b8360
	stxa	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000f3d4369b
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00000000, %l2 = 00000000999c9e48
	ldsba	[%i3+%o4]0x89,%l2	! %l2 = 0000000000000000

p0_label_41:
!	Mem[00000000100c1420] = c3d757ff, %l0 = e9d59a682f744a4d
	ldsha	[%i3+0x022]%asi,%l0	! %l0 = 00000000000057ff
!	%f14 = 00000000, %f11 = 0000999c, %f20 = 929733c9 843fd55e
	fsmuld	%f14,%f11,%f20		! %f20 = 00000000 00000000
!	Mem[00000000201c0000] = ff008819, %l1 = 0e474e1019578325
	ldsba	[%o0+0x001]%asi,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1430] = 5aa1d7782864c544, %l6 = 00000000f3d4369b
	ldxa	[%i3+0x030]%asi,%l6	! %l6 = 5aa1d7782864c544
!	Mem[0000000010001400] = 68f66f14, %l6 = 5aa1d7782864c544
	ldsha	[%i0+%g0]0x80,%l6	! %l6 = 00000000000068f6
!	Mem[0000000030181408] = f9e63498, %l7 = 0000000000000098
	lduha	[%i6+%o4]0x89,%l7	! %l7 = 0000000000003498
!	Mem[0000000010081400] = d98f764e, %f5  = ffffffff
	lda	[%i2+%g0]0x80,%f5 	! %f5 = d98f764e
!	Mem[0000000010181408] = 104e470e, %l7 = 0000000000003498
	lduba	[%i6+%o4]0x88,%l7	! %l7 = 000000000000000e
!	%l5 = 0000000000000000, %l1 = 0000000000000000, %l3 = 00000000000000fd
	xor	%l5,%l1,%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f22 = 6f4004d8, Mem[0000000030101408] = d87af5cb
	sta	%f22,[%i4+%o4]0x89	! Mem[0000000030101408] = 6f4004d8

p0_label_42:
!	%l4 = 000000001dfbd0f5, Mem[0000000030081408] = ffffffff
	stwa	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 1dfbd0f5
!	Mem[0000000030001408] = ff743f05, %l3 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010081400] = d98f764e, %l3 = 00000000000000ff
	ldstuba	[%i2+%g0]0x80,%l3	! %l3 = 000000d9000000ff
!	Mem[0000000010141410] = f9e634ff, %l0 = 00000000000057ff
	ldstuba	[%i5+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	%f10 = 10000000 0000999c, Mem[0000000030041410] = b65bf576 e6e736ac
	stda	%f10,[%i1+%o5]0x81	! Mem[0000000030041410] = 10000000 0000999c
!	%f0  = 5ed53f84 c9339792, Mem[0000000030181408] = 9834e6f9 5c7e2726
	stda	%f0 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 5ed53f84 c9339792
!	Mem[0000000010081410] = ee5e25d5, %l7 = 000000000000000e
	swapa	[%i2+%o5]0x80,%l7	! %l7 = 00000000ee5e25d5
!	Mem[0000000010101408] = 00000000, %l1 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041408] = 000000cd, %l0 = 00000000000000ff
	ldstuba	[%i1+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000, %l7 = 00000000ee5e25d5
	ldsba	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000000

p0_label_43:
!	Mem[0000000021800080] = 15e80203, %l7 = 0000000000000000
	lduba	[%o3+0x080]%asi,%l7	! %l7 = 0000000000000015
!	Mem[0000000030101400] = ff000000, %l4 = 000000001dfbd0f5
	lduha	[%i4+%g0]0x81,%l4	! %l4 = 000000000000ff00
!	Mem[00000000211c0000] = ff7cfcae, %l4 = 000000000000ff00
	ldsh	[%o2+%g0],%l4		! %l4 = ffffffffffffff7c
!	Mem[0000000010041434] = b1eb9628, %l6 = 00000000000068f6
	lduwa	[%i1+0x034]%asi,%l6	! %l6 = 00000000b1eb9628
!	Mem[0000000030181400] = 88754fd1, %l7 = 0000000000000015
	ldsba	[%i6+%g0]0x89,%l7	! %l7 = ffffffffffffffd1
!	Mem[0000000010041410] = 000000ff, %l6 = 00000000b1eb9628
	ldswa	[%i1+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101414] = 939b8360, %f20 = 00000000
	ld	[%i4+0x014],%f20	! %f20 = 939b8360
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010101400] = 9c99ede9 939b8360 00000000 f3d4369b
!	Mem[0000000010101410] = f1fc9e48 939b8360 6f4004d8 136a9ee8
!	Mem[0000000010101420] = 00002726 000000f5 7cceb22d 1c255eee
!	Mem[0000000010101430] = a266c8ba 2430509a 14f78a44 d0d0237c
	ldda	[%i4]ASI_BLK_P,%f0	! Block Load from 0000000010101400
!	Mem[0000000010081400] = ff8f764e1dfbd0f5, %f24 = 929733c9 843fd55e
	ldda	[%i2+%g0]0x80,%f24	! %f24 = ff8f764e 1dfbd0f5
!	Starting 10 instruction Store Burst
!	Mem[000000001014142c] = 5e9c2100, %l4 = ffffffffffffff7c, %asi = 80
	swapa	[%i5+0x02c]%asi,%l4	! %l4 = 000000005e9c2100

p0_label_44:
!	%l7 = ffffffffffffffd1, Mem[0000000010181408] = 104e470e
	stha	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 104effd1
!	%f18 = 7cdb760e, Mem[0000000030181400] = 88754fd1
	sta	%f18,[%i6+%g0]0x89	! Mem[0000000030181400] = 7cdb760e
!	Mem[0000000010181408] = d1ff4e10, %l5 = 00000000, %l6 = 000000ff
	add	%i6,0x08,%g1
	casa	[%g1]0x80,%l5,%l6	! %l6 = 00000000d1ff4e10
!	%f20 = 939b8360, %f22 = 6f4004d8, %f22 = 6f4004d8
	fadds	%f20,%f22,%f22		! %f22 = 6f4004d8
	membar	#Sync			! Added by membar checker (6)
!	%f24 = ff8f764e 1dfbd0f5, Mem[0000000010101420] = 00002726 000000f5
	stda	%f24,[%i4+0x020]%asi	! Mem[0000000010101420] = ff8f764e 1dfbd0f5
!	%l0 = 0000000000000000, Mem[0000000010081410] = 0000000e
	stha	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000000e
!	Mem[00000000100c1408] = ff000000, %l4 = 000000005e9c2100
	ldstuba	[%i3+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[00000000100c1428] = 95ddcdc3f8d32cbd, %asi = 80
	stxa	%l4,[%i3+0x028]%asi	! Mem[00000000100c1428] = 0000000000000000
!	%f15 = d0d0237c, Mem[0000000010001400] = 146ff668
	sta	%f15,[%i0+%g0]0x88	! Mem[0000000010001400] = d0d0237c
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff000000, %l7 = ffffffffffffffd1
	ldsha	[%i1+%o5]0x80,%l7	! %l7 = ffffffffffffff00

p0_label_45:
!	Mem[0000000010041408] = 1dfbd0f5 cd0000ff, %l6 = d1ff4e10, %l7 = ffffff00
	ldda	[%i1+%o4]0x88,%l6	! %l6 = 00000000cd0000ff 000000001dfbd0f5
!	Mem[0000000030141410] = ff000000 00000010, %l0 = 00000000, %l1 = 00000000
	ldda	[%i5+%o5]0x81,%l0	! %l0 = 00000000ff000000 0000000000000010
!	Mem[0000000010141400] = ff009b7a c9017463, %l2 = 00000000, %l3 = 000000d9
	ldda	[%i5+%g0]0x80,%l2	! %l2 = 00000000ff009b7a 00000000c9017463
!	%f17 = 00000000, %f11 = 1c255eee
	fstoi	%f17,%f11		! %f11 = 00000000
!	%l5 = 0000000000000000, immed = 000000d2, %y  = 0000005d
	umul	%l5,0x0d2,%l7		! %l7 = 0000000000000000, %y = 00000000
!	%l5 = 0000000000000000, %l5 = 0000000000000000, %l5 = 0000000000000000
	sub	%l5,%l5,%l5		! %l5 = 0000000000000000
!	Mem[0000000010041400] = 843fd55e, %f8  = 00002726
	lda	[%i1+%g0]0x80,%f8 	! %f8 = 843fd55e
!	Mem[0000000010081428] = 559e1f57, %l4 = 0000000000000000
	ldswa	[%i2+0x028]%asi,%l4	! %l4 = 00000000559e1f57
!	Mem[0000000030101410] = ff10fac2 00000000, %l0 = ff000000, %l1 = 00000010
	ldda	[%i4+%o5]0x81,%l0	! %l0 = 00000000ff10fac2 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = f9e634ff, %l3 = 00000000c9017463
	swapa	[%i5+%o5]0x88,%l3	! %l3 = 00000000f9e634ff

p0_label_46:
!	Mem[0000000030101400] = 000000ff, %l3 = 00000000f9e634ff
	ldstuba	[%i4+%g0]0x89,%l3	! %l3 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[0000000010181410] = be1909ff
	stba	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = be190900
!	Mem[0000000010141408] = 9834e6f900003cb8, %l6 = 00000000cd0000ff, %l1 = 0000000000000000
	add	%i5,0x08,%g1
	casxa	[%g1]0x80,%l6,%l1	! %l1 = 9834e6f900003cb8
!	Mem[00000000300c1408] = 00000000, %l5 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081408] = 7c2c15d8, %l0 = 00000000ff10fac2
	swapa	[%i2+%o4]0x80,%l0	! %l0 = 000000007c2c15d8
!	%l1 = 9834e6f900003cb8, Mem[0000000010101400] = 9c99ede9
	stba	%l1,[%i4+%g0]0x80	! Mem[0000000010101400] = b899ede9
!	Mem[0000000010181431] = d24e8037, %l1 = 9834e6f900003cb8
	ldstuba	[%i6+0x031]%asi,%l1	! %l1 = 0000004e000000ff
!	Mem[0000000030081408] = f5d0fb1d, %l7 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l7	! %l7 = 000000f5000000ff
!	%l2 = 00000000ff009b7a, Mem[0000000030081400] = f9e63498
	stha	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = f9e69b7a
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 9b36d4f3 00000000, %l2 = ff009b7a, %l3 = 000000ff
	ldda	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000000 000000009b36d4f3

p0_label_47:
!	Mem[0000000021800040] = 189c7f92, %l6 = 00000000cd0000ff
	lduha	[%o3+0x040]%asi,%l6	! %l6 = 000000000000189c
!	Mem[0000000010041408] = cd0000ff, %l4 = 00000000559e1f57
	lduha	[%i1+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101410] = 60839b93 489efcf1, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i4+%o5]0x88,%l4	! %l4 = 00000000489efcf1 0000000060839b93
!	Mem[00000000300c1408] = 00000000, %l5 = 0000000060839b93
	lduba	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Code Fragment 3
p0_fragment_8:
!	%l0 = 000000007c2c15d8
	setx	0xdf3d85307a0d0880,%g7,%l0 ! %l0 = df3d85307a0d0880
!	%l1 = 000000000000004e
	setx	0x031880487bf71cd9,%g7,%l1 ! %l1 = 031880487bf71cd9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = df3d85307a0d0880
	setx	0xea02d907cb3c278b,%g7,%l0 ! %l0 = ea02d907cb3c278b
!	%l1 = 031880487bf71cd9
	setx	0xd411edff9e290c7d,%g7,%l1 ! %l1 = d411edff9e290c7d
!	Mem[00000000100c1424] = 26a3ee55, %l5 = 0000000000000000
	lduw	[%i3+0x024],%l5		! %l5 = 0000000026a3ee55
!	Mem[0000000010181408] = 104effd1, %l2 = 0000000000000000
	ldsha	[%i6+%o4]0x88,%l2	! %l2 = ffffffffffffffd1
!	Mem[00000000300c1410] = 0000003d, %l1 = d411edff9e290c7d
	lduba	[%i3+%o5]0x89,%l1	! %l1 = 000000000000003d
!	Mem[0000000010081410] = 0000000e 82b12959, %l6 = 0000189c, %l7 = 000000f5
	ldda	[%i2+%o5]0x80,%l6	! %l6 = 000000000000000e 0000000082b12959
!	Starting 10 instruction Store Burst
!	%l4 = 00000000489efcf1, Mem[0000000021800081] = 15e80203, %asi = 80
	stba	%l4,[%o3+0x081]%asi	! Mem[0000000021800080] = 15f10203

p0_label_48:
!	%f20 = 939b8360 00000000, Mem[0000000030081410] = 5788deff 1dfbd0f5
	stda	%f20,[%i2+%o5]0x89	! Mem[0000000030081410] = 939b8360 00000000
!	%l4 = 00000000489efcf1, Mem[0000000030141410] = ff00000000000010
	stxa	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000489efcf1
!	%f28 = a266c8ba 2430509a, %l5 = 0000000026a3ee55
!	Mem[0000000010081430] = cd850fa036412067
	add	%i2,0x030,%g1
	stda	%f28,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010081430] = 9a500fa0bac82067
!	%l4 = 489efcf1, %l5 = 26a3ee55, Mem[0000000010041400] = 5ed53f84 5ed568f6
	stda	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 489efcf1 26a3ee55
!	Mem[0000000010141428] = eccf2554, %l1 = 000000000000003d
	ldstub	[%i5+0x028],%l1		! %l1 = 000000ec000000ff
!	Mem[0000000030181408] = 843fd55e, %l2 = ffffffffffffffd1
	ldsba	[%i6+%o4]0x89,%l2	! %l2 = 000000000000005e
!	Mem[0000000030001408] = ff743f05, %l7 = 0000000082b12959
	ldstuba	[%i0+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000020800041] = 23ffbf87, %l2 = 000000000000005e
	ldstub	[%o1+0x041],%l2		! %l2 = 000000ff000000ff
!	Mem[0000000010101429] = 7cceb22d, %l5 = 0000000026a3ee55
	ldstub	[%i4+0x029],%l5		! %l5 = 000000ce000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 5ed53f84c9339792, %f18 = 7cdb760e d14f7588
	ldda	[%i6+%o4]0x81,%f18	! %f18 = 5ed53f84 c9339792

p0_label_49:
!	Mem[0000000030181410] = ffff4e00, %l6 = 000000000000000e
	ldswa	[%i6+%o5]0x89,%l6	! %l6 = ffffffffffff4e00
!	Mem[0000000010001408] = 0a50003d, %l4 = 00000000489efcf1
	lduha	[%i0+%o4]0x88,%l4	! %l4 = 000000000000003d
!	Mem[0000000030041410] = 10000000, %l6 = ffffffffffff4e00
	lduba	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000010
!	Mem[0000000030041410] = 00000010, %l4 = 000000000000003d
	ldstuba	[%i1+%o5]0x89,%l4	! %l4 = 00000010000000ff
!	Mem[00000000300c1410] = 0000003d, %l0 = ea02d907cb3c278b
	ldsha	[%i3+%o5]0x89,%l0	! %l0 = 000000000000003d
!	Mem[0000000010181400] = a15a0000, %l7 = 00000000000000ff
	ldswa	[%i6+%g0]0x88,%l7	! %l7 = ffffffffa15a0000
!	Mem[0000000010081408] = ff10fac2, %l6 = 0000000000000010
	ldsha	[%i2+%o4]0x80,%l6	! %l6 = ffffffffffffff10
!	%l3 = 000000009b36d4f3, %l2 = 00000000000000ff, %l5 = 00000000000000ce
	xor	%l3,%l2,%l5		! %l5 = 000000009b36d40c
!	Mem[0000000010041400] = 489efcf1, %l3 = 000000009b36d4f3
	lduha	[%i1+%g0]0x88,%l3	! %l3 = 000000000000fcf1
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ec, Mem[000000001004142c] = 00ff10a6, %asi = 80
	stha	%l1,[%i1+0x02c]%asi	! Mem[000000001004142c] = 00ec10a6

p0_label_50:
!	Mem[0000000010181408] = d1ff4e10, %l1 = 00000000000000ec
	ldstuba	[%i6+%o4]0x80,%l1	! %l1 = 000000d1000000ff
!	Mem[0000000030081410] = 00000000, %l3 = 000000000000fcf1
	ldstuba	[%i2+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1410] = 0000003d, %l5 = 000000009b36d40c
	swapa	[%i3+%o5]0x89,%l5	! %l5 = 000000000000003d
!	Mem[0000000010101410] = 489efcf1, %l7 = ffffffffa15a0000
	swapa	[%i4+%o5]0x88,%l7	! %l7 = 00000000489efcf1
!	Mem[0000000010101408] = 00000000, %l4 = 0000000000000010
	swapa	[%i4+%o4]0x80,%l4	! %l4 = 0000000000000000
!	%l6 = ffffffffffffff10, Mem[0000000010001400] = d0d0237c
	stba	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = d0d02310
!	Mem[0000000010101400] = e9ed99b8, %l6 = ffffffffffffff10
	swapa	[%i4+%g0]0x88,%l6	! %l6 = 00000000e9ed99b8
!	Mem[0000000030141410] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i5+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	%l2 = 00000000000000ff, immed = fffff83b, %y  = 00000000
	smul	%l2,-0x7c5,%l2		! %l2 = fffffffffff842c5, %y = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 000000ff, %l7 = 00000000489efcf1
	ldswa	[%i3+%g0]0x88,%l7	! %l7 = 00000000000000ff

p0_label_51:
!	Mem[0000000010001408] = 0a50003d, %l7 = 00000000000000ff
	ldswa	[%i0+%o4]0x88,%l7	! %l7 = 000000000a50003d
!	Mem[0000000030001410] = 243050ff, %l3 = 0000000000000000
	ldsba	[%i0+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181400] = 00005aa10486434e, %l0 = 000000000000003d, %l3 = ffffffffffffffff
	casxa	[%i6]0x80,%l0,%l3	! %l3 = 00005aa10486434e
!	Mem[0000000010041408] = ff0000cd, %l5 = 000000000000003d
	lduba	[%i1+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141400] = ff009b7a, %l0 = 000000000000003d
	lduha	[%i5+%g0]0x80,%l0	! %l0 = 000000000000ff00
!	%f15 = d0d0237c, %f25 = 1dfbd0f5, %f31 = 000000ff
	fmuls	%f15,%f25,%f31		! %f31 = af4cbcaf
!	Mem[0000000030001400] = 37804eff, %l4 = 0000000000000000
	ldsba	[%i0+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030081400] = 26277e5cf9e69b7a, %l1 = 00000000000000d1
	ldxa	[%i2+%g0]0x89,%l1	! %l1 = 26277e5cf9e69b7a
!	Mem[0000000010181410] = 1faa72acbe190900, %f30 = 14f78a44 af4cbcaf
	ldda	[%i6+%o5]0x88,%f30	! %f30 = 1faa72ac be190900
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 10000000, %l2 = fffffffffff842c5
	ldstuba	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff

p0_label_52:
!	%f8  = 843fd55e 000000f5, %l6 = 00000000e9ed99b8
!	Mem[0000000030041430] = 20f1f32ee93043a3
	add	%i1,0x030,%g1
	stda	%f8,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030041430] = 20f1f32ee93043a3
!	Mem[0000000030081408] = 1dfbd0ff, %l4 = ffffffffffffffff
	ldstuba	[%i2+%o4]0x89,%l4	! %l4 = 000000ff000000ff
!	%l2 = 0000000000000000, Mem[0000000010181400] = a15a0000
	stba	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = a15a0000
!	Mem[0000000030001410] = 243050ff, %l3 = 00005aa10486434e
	ldstuba	[%i0+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030001400] = ff4e8037, %l0 = 000000000000ff00
	ldstuba	[%i0+%g0]0x81,%l0	! %l0 = 000000ff000000ff
!	%f31 = be190900, Mem[0000000010041410] = 000000ff
	sta	%f31,[%i1+%o5]0x88	! Mem[0000000010041410] = be190900
!	%f18 = 5ed53f84 c9339792, Mem[00000000300c1410] = 9b36d40c 000068f6
	stda	%f18,[%i3+%o5]0x89	! Mem[00000000300c1410] = 5ed53f84 c9339792
!	%l3 = 00000000000000ff, Mem[0000000030081400] = f9e69b7a
	stba	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = f9e69bff
!	%f0  = 9c99ede9 939b8360 00000000 f3d4369b
!	%f4  = f1fc9e48 939b8360 6f4004d8 136a9ee8
!	%f8  = 843fd55e 000000f5 7cceb22d 00000000
!	%f12 = a266c8ba 2430509a 14f78a44 d0d0237c
	stda	%f0,[%i6]ASI_BLK_PL	! Block Store to 0000000010181400
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = d804406f, %l6 = 00000000e9ed99b8
	lduwa	[%i4+%o4]0x81,%l6	! %l6 = 00000000d804406f

p0_label_53:
!	Mem[0000000010041410] = 000919be00000000, %l4 = 00000000000000ff
	ldxa	[%i1+%o5]0x80,%l4	! %l4 = 000919be00000000
!	Mem[0000000021800040] = 189c7f92, %l5 = 00000000000000ff
	lduha	[%o3+0x040]%asi,%l5	! %l5 = 000000000000189c
!	Mem[000000001014141c] = 1b8a91dd, %l4 = 000919be00000000
	ldswa	[%i5+0x01c]%asi,%l4	! %l4 = 000000001b8a91dd
!	Mem[0000000010001418] = 6c4a7a81 c5f9822a, %l0 = 000000ff, %l1 = f9e69b7a
	ldda	[%i0+0x018]%asi,%l0	! %l0 = 000000006c4a7a81 00000000c5f9822a
!	Mem[0000000030081410] = ff000000, %l1 = 00000000c5f9822a
	lduwa	[%i2+%o5]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010041408] = ff0000cd, %l2 = 0000000000000000
	ldswa	[%i1+%o4]0x80,%l2	! %l2 = ffffffffff0000cd
!	Mem[00000000211c0000] = ff7cfcae, %l5 = 000000000000189c
	ldsh	[%o2+%g0],%l5		! %l5 = ffffffffffffff7c
!	%f24 = ff8f764e 1dfbd0f5, Mem[0000000030141410] = ff000000 489efcf1
	stda	%f24,[%i5+%o5]0x81	! Mem[0000000030141410] = ff8f764e 1dfbd0f5
!	Mem[0000000010101400] = 10ffffff 939b8360, %l0 = 6c4a7a81, %l1 = ff000000
	ldda	[%i4+%g0]0x80,%l0	! %l0 = 0000000010ffffff 00000000939b8360
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = d804406f, %l0 = 0000000010ffffff
	ldstuba	[%i4+%o4]0x81,%l0	! %l0 = 000000d8000000ff

p0_label_54:
!	%f20 = 939b8360 00000000, Mem[0000000010141400] = 7a9b00ff 637401c9
	stda	%f20,[%i5+%g0]0x88	! Mem[0000000010141400] = 939b8360 00000000
!	%f26 = bb000000 00000000, %l3 = 00000000000000ff
!	Mem[0000000030041420] = b3c329e0f249c7b4
	add	%i1,0x020,%g1
	stda	%f26,[%g1+%l3]ASI_PST8_SL ! Mem[0000000030041420] = 00000000000000bb
!	%f30 = 1faa72ac be190900, %l1 = 00000000939b8360
!	Mem[0000000030001400] = ff4e80379fa033c6
	stda	%f30,[%i0+%l1]ASI_PST8_S ! Mem[0000000030001400] = ffaa72379fa033c6
!	%l6 = d804406f, %l7 = 0a50003d, Mem[0000000010181400] = 939b8360 9c99ede9
	stda	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = d804406f 0a50003d
!	Mem[0000000010041408] = cd0000ff, %l1 = 00000000939b8360
	swapa	[%i1+%o4]0x88,%l1	! %l1 = 00000000cd0000ff
!	Mem[0000000010041400] = 489efcf1, %l4 = 000000001b8a91dd
	swapa	[%i1+%g0]0x88,%l4	! %l4 = 00000000489efcf1
!	%l6 = 00000000d804406f, Mem[0000000030001408] = ff743f05
	stwa	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = d804406f
!	%l0 = 00000000000000d8, Mem[0000000010141408] = 9834e6f900003cb8
	stxa	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000000000d8
!	%l2 = ffffffffff0000cd, Mem[0000000010081410] = 0e000000
	stha	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 0e0000cd
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ff008819, %l0 = 00000000000000d8
	lduba	[%o0+0x000]%asi,%l0	! %l0 = 00000000000000ff

p0_label_55:
!	Mem[00000000100c1400] = 644fe069 000000ff, %l2 = ff0000cd, %l3 = 000000ff
	ldda	[%i3+%g0]0x88,%l2	! %l2 = 00000000000000ff 00000000644fe069
!	Mem[0000000030081408] = 1dfbd0ff, %l6 = 00000000d804406f
	lduba	[%i2+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041408] = 00000000, %f31 = be190900
	lda	[%i1+%o4]0x81,%f31	! %f31 = 00000000
!	Mem[0000000010141420] = 7d7d3b2c, %l7 = 000000000a50003d
	ldsha	[%i5+0x020]%asi,%l7	! %l7 = 0000000000007d7d
!	Mem[00000000211c0000] = ff7cfcae, %l5 = ffffffffffffff7c
	ldub	[%o2+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030141410] = 4e768fff, %l1 = 00000000cd0000ff
	ldsha	[%i5+%o5]0x89,%l1	! %l1 = ffffffffffff8fff
!	Mem[0000000030081410] = ff000000 60839b93, %l2 = 000000ff, %l3 = 644fe069
	ldda	[%i2+%o5]0x81,%l2	! %l2 = 00000000ff000000 0000000060839b93
!	Mem[0000000010001400] = 1023d0d0f3ff754f, %f28 = a266c8ba 2430509a
	ldda	[%i0+%g0]0x80,%f28	! %f28 = 1023d0d0 f3ff754f
!	Mem[0000000030101410] = 00000000c2fa10ff, %f20 = 939b8360 00000000
	ldda	[%i4+%o5]0x89,%f20	! %f20 = 00000000 c2fa10ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001428] = ffffffff, %l7 = 0000000000007d7d
	swap	[%i0+0x028],%l7		! %l7 = 00000000ffffffff

p0_label_56:
!	%l4 = 00000000489efcf1, Mem[00000000100c1410] = ee5e25d5
	stha	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = ee5efcf1
!	%l6 = 00000000000000ff, Mem[0000000010101410] = a15a0000
	stba	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = a15a00ff
!	Mem[0000000010141404] = 60839b93, %l3 = 0000000060839b93
	swap	[%i5+0x004],%l3		! %l3 = 0000000060839b93
!	%l3 = 0000000060839b93, Mem[0000000030141408] = 9fa033c6
	stha	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 9fa09b93
!	Mem[0000000010141400] = 00000000, %l4 = 00000000489efcf1
	ldstuba	[%i5+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000030141410] = ff8f764e 1dfbd0f5
	stda	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 000000ff
!	%l3 = 0000000060839b93, Mem[0000000010001420] = c0224344
	stb	%l3,[%i0+0x020]		! Mem[0000000010001420] = 93224344
!	%f25 = 1dfbd0f5, Mem[0000000030181408] = 843fd55e
	sta	%f25,[%i6+%o4]0x89	! Mem[0000000030181408] = 1dfbd0f5
!	%l1 = ffffffffffff8fff, Mem[00000000300c1400] = 4410fac2
	stwa	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffff8fff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff8f764e, %l2 = 00000000ff000000
	lduwa	[%i2+%g0]0x80,%l2	! %l2 = 00000000ff8f764e

p0_label_57:
!	Mem[0000000010041408] = 60839b93, %l5 = 00000000000000ff
	lduba	[%i1+%o4]0x80,%l5	! %l5 = 0000000000000060
!	Mem[0000000010141410] = 637401c9, %l0 = 00000000000000ff
	lduha	[%i5+%o5]0x80,%l0	! %l0 = 0000000000006374
!	Mem[00000000201c0000] = ff008819, %l4 = 0000000000000000
	ldsb	[%o0+0x001],%l4		! %l4 = 0000000000000000
!	Mem[0000000030081400] = ff9be6f9, %l6 = 00000000000000ff
	lduwa	[%i2+%g0]0x81,%l6	! %l6 = 00000000ff9be6f9
!	Mem[0000000030101408] = def5d922 6f4004ff, %l0 = 00006374, %l1 = ffff8fff
	ldda	[%i4+%o4]0x89,%l0	! %l0 = 000000006f4004ff 00000000def5d922
!	Mem[0000000030181400] = 401237c17cdb760e, %l4 = 0000000000000000
	ldxa	[%i6+%g0]0x89,%l4	! %l4 = 401237c17cdb760e
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010181400] = 6f4004d8, %l4 = 401237c17cdb760e
	ldsh	[%i6+%g0],%l4		! %l4 = 0000000000006f40
!	Mem[0000000030181400] = 7cdb760e, %l4 = 0000000000006f40
	ldswa	[%i6+%g0]0x89,%l4	! %l4 = 000000007cdb760e
!	Mem[0000000010141410] = c9017463, %l7 = 00000000ffffffff
	ldsha	[%i5+%o5]0x88,%l7	! %l7 = 0000000000007463
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 0a50003d, %l4 = 000000007cdb760e
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 0000003d000000ff

p0_label_58:
!	%l6 = 00000000ff9be6f9, Mem[0000000010081400] = 4e768fff
	stwa	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = ff9be6f9
!	%f0  = 9c99ede9 939b8360, %l7 = 0000000000007463
!	Mem[00000000300c1430] = 96afd2a26b2d7cb8
	add	%i3,0x030,%g1
	stda	%f0,[%g1+%l7]ASI_PST32_SL ! Mem[00000000300c1430] = 60839b93e9ed999c
!	%f10 = 7cceb22d 00000000, Mem[0000000010081410] = 0e0000cd 5929b182
	stda	%f10,[%i2+%o5]0x88	! Mem[0000000010081410] = 7cceb22d 00000000
!	Mem[0000000010101400] = 10ffffff, %l0 = 000000006f4004ff
	ldstuba	[%i4+%g0]0x80,%l0	! %l0 = 00000010000000ff
!	%l1 = 00000000def5d922, Mem[00000000201c0000] = ff008819, %asi = 80
	stha	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = d9228819
!	Mem[0000000030181400] = 0e76db7c, %l1 = 00000000def5d922
	ldstuba	[%i6+%g0]0x81,%l1	! %l1 = 0000000e000000ff
!	%l2 = ff8f764e, %l3 = 60839b93, Mem[0000000010101410] = ff005aa1 939b8360
	std	%l2,[%i4+%o5]		! Mem[0000000010101410] = ff8f764e 60839b93
!	%l6 = 00000000ff9be6f9, Mem[00000000218001c0] = 00f5186d, %asi = 80
	stba	%l6,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = f9f5186d
!	%l6 = 00000000ff9be6f9, Mem[0000000030001410] = ff503024bac866a2
	stxa	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000ff9be6f9
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 9fa09b93, %l3 = 0000000060839b93
	ldsba	[%i5+%o4]0x89,%l3	! %l3 = ffffffffffffff93

p0_label_59:
!	Mem[00000000211c0000] = ff7cfcae, %l3 = ffffffffffffff93
	ldsba	[%o2+0x001]%asi,%l3	! %l3 = 000000000000007c
!	Mem[0000000010101410] = ff8f764e 60839b93, %l4 = 0000003d, %l5 = 00000060
	ldda	[%i4+%o5]0x80,%l4	! %l4 = 00000000ff8f764e 0000000060839b93
!	Mem[0000000030181408] = 1dfbd0f5, %l1 = 000000000000000e
	lduwa	[%i6+%o4]0x89,%l1	! %l1 = 000000001dfbd0f5
!	Mem[00000000100c1400] = 000000ff, %l7 = 0000000000007463
	lduwa	[%i3+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041414] = 00000000, %l0 = 0000000000000010
	ldswa	[%i1+0x014]%asi,%l0	! %l0 = 0000000000000000
!	%l6 = 00000000ff9be6f9, %l1 = 000000001dfbd0f5, %l7 = 00000000000000ff
	addc	%l6,%l1,%l7		! %l7 = 000000011d97b7ee
!	Mem[0000000030181408] = f5d0fb1d, %l7 = 000000011d97b7ee
	lduwa	[%i6+%o4]0x81,%l7	! %l7 = 00000000f5d0fb1d
!	Mem[0000000030001408] = 6f4004d8, %l6 = 00000000ff9be6f9
	ldswa	[%i0+%o4]0x89,%l6	! %l6 = 000000006f4004d8
!	Mem[0000000030101410] = ff10fac2, %l0 = 0000000000000000
	ldswa	[%i4+%o5]0x81,%l0	! %l0 = ffffffffff10fac2
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ff8f764e, Mem[0000000030141410] = 00000000
	stwa	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = ff8f764e

p0_label_60:
!	%l2 = 00000000ff8f764e, Mem[00000000201c0000] = d9228819
	sth	%l2,[%o0+%g0]		! Mem[00000000201c0000] = 764e8819
!	Mem[0000000010041408] = 60839b93, %l4 = 00000000ff8f764e
	ldstuba	[%i1+%o4]0x80,%l4	! %l4 = 00000060000000ff
!	%l2 = ff8f764e, %l3 = 0000007c, Mem[0000000030101408] = 6f4004ff def5d922
	stda	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = ff8f764e 0000007c
!	%l2 = 00000000ff8f764e, Mem[0000000010041406] = 55eea326, %asi = 80
	stha	%l2,[%i1+0x006]%asi	! Mem[0000000010041404] = 55ee764e
!	Mem[0000000010181410] = 939b8360, %l2 = 00000000ff8f764e
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 00000060000000ff
!	Mem[00000000100c1418] = 87d772b4d9e6cc5b, %l5 = 0000000060839b93, %l7 = 00000000f5d0fb1d
	add	%i3,0x18,%g1
	casxa	[%g1]0x80,%l5,%l7	! %l7 = 87d772b4d9e6cc5b
!	%l6 = 000000006f4004d8, Mem[0000000010041400] = 1b8a91dd
	stha	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 1b8a04d8
!	%l2 = 00000060, %l3 = 0000007c, Mem[0000000010041400] = 1b8a04d8 4e76ee55
	stda	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000060 0000007c
!	%f22 = 6f4004d8, Mem[000000001008142c] = be19cd23
	sta	%f22,[%i2+0x02c]%asi	! Mem[000000001008142c] = 6f4004d8
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000, %l7 = 87d772b4d9e6cc5b
	lduha	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000000

p0_label_61:
!	Mem[0000000010001410] = a15a000000000000, %f18 = 5ed53f84 c9339792
	ldda	[%i0+%o5]0x88,%f18	! %f18 = a15a0000 00000000
!	Mem[0000000010141400] = 939b8360000000ff, %f28 = 1023d0d0 f3ff754f
	ldda	[%i5+%g0]0x88,%f28	! %f28 = 939b8360 000000ff
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000030181400] = ff76db7c c1371240 f5d0fb1d c9339792
!	Mem[0000000030181410] = 004effff 4094b994 b8d681a9 cc6573ad
!	Mem[0000000030181420] = a5a0bba2 41939a60 2dd5d8f9 96358d26
!	Mem[0000000030181430] = 4c28dc6a 271ef5b5 ff9717d5 98e5a2bf
	ldda	[%i6]ASI_BLK_SL,%f16	! Block Load from 0000000030181400
!	Mem[0000000010041400] = 60000000 7c000000 ff839b93 f5d0fb1d
!	Mem[0000000010041410] = 000919be 00000000 9834e6f9 00003cb8
!	Mem[0000000010041420] = c57ad1f4 c5a5f115 64266065 00ec10a6
!	Mem[0000000010041430] = 56ec41dc b1eb9628 f3d4369b 81eac8df
	ldda	[%i1]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010041400
!	Mem[0000000010001400] = 1023d0d0, %l5 = 0000000060839b93
	lduba	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000010
!	Mem[0000000010101438] = 14f78a44, %l7 = 0000000000000000
	lduw	[%i4+0x038],%l7		! %l7 = 0000000014f78a44
!	Mem[0000000030041410] = 000000ff, %l6 = 000000006f4004d8
	lduba	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1408] = ff0000ff, %l6 = 00000000000000ff
	ldswa	[%i3+%o4]0x88,%l6	! %l6 = ffffffffff0000ff
!	Mem[0000000010041420] = c57ad1f4, %l6 = ffffffffff0000ff
	ldswa	[%i1+0x020]%asi,%l6	! %l6 = ffffffffc57ad1f4
!	Starting 10 instruction Store Burst
!	%l4 = 00000060, %l5 = 00000010, Mem[0000000010081400] = f9e69bff 1dfbd0f5
	std	%l4,[%i2+%g0]		! Mem[0000000010081400] = 00000060 00000010

p0_label_62:
!	%l6 = c57ad1f4, %l7 = 14f78a44, Mem[0000000030001410] = 00000000 f9e69bff
	stda	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = c57ad1f4 14f78a44
!	Mem[0000000010101410] = ff8f764e, %l6 = ffffffffc57ad1f4
	ldstuba	[%i4+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	%l6 = 00000000000000ff, Mem[00000000300c1408] = 00000000
	stwa	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000ff
!	%l5 = 0000000000000010, Mem[0000000030141400] = 003d15d8
	stha	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 001015d8
!	%l2 = 0000000000000060, Mem[0000000030101408] = ff8f764e
	stwa	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000060
!	%l4 = 0000000000000060, imm = 0000000000000e8e, %l5 = 0000000000000010
	or	%l4,0xe8e,%l5		! %l5 = 0000000000000eee
!	%l5 = 0000000000000eee, Mem[0000000020800040] = 23ffbf87, %asi = 80
	stha	%l5,[%o1+0x040]%asi	! Mem[0000000020800040] = 0eeebf87
!	Code Fragment 4
p0_fragment_9:
!	%l0 = ffffffffff10fac2
	setx	0x3d127f2ff256e6a5,%g7,%l0 ! %l0 = 3d127f2ff256e6a5
!	%l1 = 000000001dfbd0f5
	setx	0xcfd0f4879be91196,%g7,%l1 ! %l1 = cfd0f4879be91196
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3d127f2ff256e6a5
	setx	0x873e51dfef69039b,%g7,%l0 ! %l0 = 873e51dfef69039b
!	%l1 = cfd0f4879be91196
	setx	0xb548dcb002e7460d,%g7,%l1 ! %l1 = b548dcb002e7460d
!	%l0 = 873e51dfef69039b, %l7 = 0000000014f78a44, %l0 = 873e51dfef69039b
	addc	%l0,%l7,%l0		! %l0 = 873e51e004608ddf
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 000000ff, %l2 = 0000000000000060
	ldsha	[%i4+%g0]0x89,%l2	! %l2 = 00000000000000ff

p0_label_63:
!	Mem[0000000010181430] = 9a503024, %l2 = 00000000000000ff
	lduwa	[%i6+0x030]%asi,%l2	! %l2 = 000000009a503024
!	Mem[0000000030101410] = ff10fac2, %l0 = 873e51e004608ddf
	ldswa	[%i4+%o5]0x81,%l0	! %l0 = ffffffffff10fac2
!	Mem[0000000010041408] = 939b83ff, %l7 = 0000000014f78a44
	lduha	[%i1+%o4]0x88,%l7	! %l7 = 00000000000083ff
!	Mem[0000000010041410] = 00000000 be190900, %l4 = 00000060, %l5 = 00000eee
	ldda	[%i1+%o5]0x88,%l4	! %l4 = 00000000be190900 0000000000000000
!	Mem[0000000010141408] = 00000000000000d8, %l0 = ffffffffff10fac2
	ldxa	[%i5+%o4]0x80,%l0	! %l0 = 00000000000000d8
!	Mem[0000000010001408] = e6e736ac0a5000ff, %f22 = ad7365cc a981d6b8
	ldda	[%i0+%o4]0x88,%f22	! %f22 = e6e736ac 0a5000ff
!	Mem[00000000201c0000] = 764e8819, %l0 = 00000000000000d8
	ldsb	[%o0+%g0],%l0		! %l0 = 0000000000000076
!	Mem[0000000030001400] = ffaa72379fa033c6, %f18 = 929733c9 1dfbd0f5
	ldda	[%i0+%g0]0x81,%f18	! %f18 = ffaa7237 9fa033c6
!	%l3 = 000000000000007c, imm = fffffffffffff8ce, %l6 = 00000000000000ff
	subc	%l3,-0x732,%l6		! %l6 = 00000000000007ae
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 4e768fff, %l1 = b548dcb002e7460d
	ldstuba	[%i5+%o5]0x81,%l1	! %l1 = 0000004e000000ff

p0_label_64:
!	%l0 = 0000000000000076, Mem[0000000030101408] = 0000007c00000060
	stxa	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000076
!	%l1 = 000000000000004e, Mem[0000000030081408] = ffd0fb1d
	stba	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 4ed0fb1d
!	%f23 = 0a5000ff, Mem[0000000030141410] = ff8f76ff
	sta	%f23,[%i5+%o5]0x89	! Mem[0000000030141410] = 0a5000ff
!	%l6 = 00000000000007ae, Mem[0000000030041400] = f68fadc3dea71101
	stxa	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000000007ae
!	%l2 = 000000009a503024, Mem[00000000201c0000] = 764e8819
	sth	%l2,[%o0+%g0]		! Mem[00000000201c0000] = 30248819
!	%l5 = 0000000000000000, Mem[0000000010081400] = 00000060
	stwa	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	%l1 = 000000000000004e, Mem[00000000100c1400] = ff000000
	stha	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = 004e0000
!	%f24 = 609a9341, Mem[00000000300c1408] = ff000000
	sta	%f24,[%i3+%o4]0x89	! Mem[00000000300c1408] = 609a9341
!	%l3 = 000000000000007c, Mem[0000000010181438] = 7c23d0d0, %asi = 80
	stwa	%l3,[%i6+0x038]%asi	! Mem[0000000010181438] = 0000007c
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff00500a, %f28 = b5f51e27
	lda	[%i0+%o4]0x80,%f28	! %f28 = ff00500a

p0_label_65:
!	Mem[0000000030181408] = 929733c91dfbd0f5, %l3 = 000000000000007c
	ldxa	[%i6+%o4]0x89,%l3	! %l3 = 929733c91dfbd0f5
!	Mem[0000000030101400] = ff000000, %l1 = 000000000000004e
	lduha	[%i4+%g0]0x81,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010181410] = ff839b93, %l7 = 00000000000083ff
	ldsba	[%i6+%o5]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010081400] = 10000000 00000000, %l2 = 9a503024, %l3 = 1dfbd0f5
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000000 0000000010000000
!	Mem[0000000030041400] = ae070000, %l6 = 00000000000007ae
	lduba	[%i1+%g0]0x81,%l6	! %l6 = 00000000000000ae
!	Mem[0000000010181410] = 939b83ff, %l0 = 0000000000000076
	ldsha	[%i6+%o5]0x88,%l0	! %l0 = ffffffffffff83ff
!	%l0 = ffffffffffff83ff, imm = fffffffffffff742, %l3 = 0000000010000000
	andn	%l0,-0x8be,%l3		! %l3 = 00000000000000bd
!	Mem[0000000030041410] = ff0000000000999c, %f24 = 609a9341 a2bba0a5
	ldda	[%i1+%o5]0x81,%f24	! %f24 = ff000000 0000999c
!	Mem[0000000030181408] = f5d0fb1d, %l7 = ffffffffffffffff
	lduwa	[%i6+%o4]0x81,%l7	! %l7 = 00000000f5d0fb1d
!	Starting 10 instruction Store Burst
!	%f16 = 401237c1 7cdb76ff ffaa7237 9fa033c6
!	%f20 = 94b99440 ffff4e00 e6e736ac 0a5000ff
!	%f24 = ff000000 0000999c 268d3596 f9d8d52d
!	%f28 = ff00500a 6adc284c bfa2e598 d51797ff
	stda	%f16,[%i1]ASI_COMMIT_P	! Block Store to 0000000010041400

p0_label_66:
!	%f16 = 401237c1 7cdb76ff ffaa7237 9fa033c6
!	%f20 = 94b99440 ffff4e00 e6e736ac 0a5000ff
!	%f24 = ff000000 0000999c 268d3596 f9d8d52d
!	%f28 = ff00500a 6adc284c bfa2e598 d51797ff
	stda	%f16,[%i6]ASI_BLK_PL	! Block Store to 0000000010181400
!	Mem[00000000201c0001] = 30248819, %l2 = 0000000000000000
	ldstub	[%o0+0x001],%l2		! %l2 = 00000024000000ff
!	%l6 = 00000000000000ae, Mem[000000001014142c] = ffffff7c, %asi = 80
	stha	%l6,[%i5+0x02c]%asi	! Mem[000000001014142c] = 00aeff7c
!	Mem[00000000100c1400] = 004e0000, %l2 = 0000000000000024
	ldstuba	[%i3+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	%l1 = 000000000000ff00, Mem[0000000010141410] = c9017463
	stba	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = c9017400
!	%f8  = 15f1a5c5 f4d17ac5, %l6 = 00000000000000ae
!	Mem[0000000030041430] = 20f1f32ee93043a3
	add	%i1,0x030,%g1
	stda	%f8,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030041430] = 20f1f32ec5a5f115
!	Mem[0000000030101410] = ff10fac2, %l1 = 000000000000ff00
	swapa	[%i4+%o5]0x81,%l1	! %l1 = 00000000ff10fac2
!	%l7 = 00000000f5d0fb1d, Mem[0000000030041408] = 00000000
	stwa	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = f5d0fb1d
!	Code Fragment 3
p0_fragment_10:
!	%l0 = ffffffffffff83ff
	setx	0xb7fc78e79bf5e0b2,%g7,%l0 ! %l0 = b7fc78e79bf5e0b2
!	%l1 = 00000000ff10fac2
	setx	0xdddf5e304fd54756,%g7,%l1 ! %l1 = dddf5e304fd54756
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b7fc78e79bf5e0b2
	setx	0xbfb32047b9c8f4ff,%g7,%l0 ! %l0 = bfb32047b9c8f4ff
!	%l1 = dddf5e304fd54756
	setx	0xe01654005f3c57ae,%g7,%l1 ! %l1 = e01654005f3c57ae
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000010041404] = 7cdb76ff, %l1 = e01654005f3c57ae
	lduba	[%i1+0x006]%asi,%l1	! %l1 = 0000000000000076

p0_label_67:
!	Mem[000000001010140c] = f3d4369b, %f31 = d51797ff
	ld	[%i4+0x00c],%f31	! %f31 = f3d4369b
!	Mem[0000000030041400] = ae070000 00000000 f5d0fb1d 00001044
!	Mem[0000000030041410] = ff000000 0000999c bd645e8a 3942f58f
!	Mem[0000000030041420] = 00000000 000000bb 70114fed 30a6b062
!	Mem[0000000030041430] = 20f1f32e c5a5f115 9495b8c3 e7b4a6bd
	ldda	[%i1]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030041400
!	Mem[0000000010001410] = a15a000000000000, %f22 = e6e736ac 0a5000ff
	ldda	[%i0+%o5]0x88,%f22	! %f22 = a15a0000 00000000
!	Mem[00000000211c0000] = ff7cfcae, %l4 = 00000000be190900
	ldsh	[%o2+%g0],%l4		! %l4 = ffffffffffffff7c
!	Mem[00000000100c1400] = ff4e0000, %l7 = 00000000f5d0fb1d
	ldsba	[%i3+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010081400] = 00000000, %l4 = ffffffffffffff7c
	ldsha	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1400] = ff8fffff, %l4 = 0000000000000000
	lduba	[%i3+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041400] = 00000000000007ae, %f22 = a15a0000 00000000
	ldda	[%i1+%g0]0x89,%f22	! %f22 = 00000000 000007ae
!	Mem[0000000030001410] = f4d17ac5, %l2 = 0000000000000000
	lduha	[%i0+%o5]0x81,%l2	! %l2 = 000000000000f4d1
!	Starting 10 instruction Store Burst
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000030101408] = 00000076 00000000
	stda	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000ff 00000000

p0_label_68:
!	%f24 = ff000000 0000999c, %l1 = 0000000000000076
!	Mem[0000000010081410] = 000000002db2ce7c
	add	%i2,0x010,%g1
	stda	%f24,[%g1+%l1]ASI_PST32_P ! Mem[0000000010081410] = ff0000002db2ce7c
!	%l3 = 00000000000000bd, Mem[0000000030141400] = 001015d8
	stha	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 00bd15d8
!	%f0  = 00000000 000007ae 44100000 1dfbd0f5
!	%f4  = 9c990000 000000ff 8ff54239 8a5e64bd
!	%f8  = bb000000 00000000 62b0a630 ed4f1170
!	%f12 = 15f1a5c5 2ef3f120 bda6b4e7 c3b89594
	stda	%f0,[%i3]ASI_COMMIT_S	! Block Store to 00000000300c1400
	membar	#Sync			! Added by membar checker (10)
!	%l3 = 00000000000000bd, Mem[00000000100c1408] = ff0000ff
	stba	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = bd0000ff
!	%f17 = 7cdb76ff, Mem[0000000010101418] = 6f4004d8
	sta	%f17,[%i4+0x018]%asi	! Mem[0000000010101418] = 7cdb76ff
!	%l0 = bfb32047b9c8f4ff, Mem[0000000030001410] = f4d17ac5448af714
	stxa	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = bfb32047b9c8f4ff
!	%l4 = 00000000000000ff, Mem[00000000201c0000] = 30ff8819
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 00ff8819
!	%l6 = 00000000000000ae, Mem[0000000030001410] = bfb32047
	stha	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 00ae2047
!	Mem[0000000010101408] = 100000ff, %l6 = 00000000000000ae
	ldstuba	[%i4+%o4]0x88,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ff9be6f9, %f4  = 9c990000
	lda	[%i2+%g0]0x81,%f4 	! %f4 = ff9be6f9

p0_label_69:
!	Mem[00000000300c1410] = 9c990000, %f5  = 000000ff
	lda	[%i3+%o5]0x81,%f5 	! %f5 = 9c990000
!	Mem[0000000030101400] = ff000000, %l6 = 00000000000000ff
	lduwa	[%i4+%g0]0x81,%l6	! %l6 = 00000000ff000000
!	Mem[0000000030041410] = 000000ff, %l2 = 000000000000f4d1
	ldsha	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1400] = 00000000 000007ae, %l0 = b9c8f4ff, %l1 = 00000076
	ldda	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000 00000000000007ae
!	Mem[0000000030081408] = 1dfbd04e, %l6 = 00000000ff000000
	ldsha	[%i2+%o4]0x89,%l6	! %l6 = ffffffffffffd04e
!	%l6 = ffffffffffffd04e, imm = 0000000000000041, %l7 = ffffffffffffffff
	sub	%l6,0x041,%l7		! %l7 = ffffffffffffd00d
!	Mem[0000000010081408] = ff10fac2, %l6 = ffffffffffffd04e
	lduha	[%i2+%o4]0x80,%l6	! %l6 = 000000000000ff10
!	Mem[0000000010101400] = 60839b93ffffffff, %f18 = ffaa7237 9fa033c6
	ldda	[%i4+%g0]0x88,%f18	! %f18 = 60839b93 ffffffff
!	Mem[0000000010101408] = 100000ff, %l0 = 0000000000000000
	ldsha	[%i4+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[0000000010001434] = 7f2178de, %asi = 80
	stwa	%l0,[%i0+0x034]%asi	! Mem[0000000010001434] = 000000ff

p0_label_70:
!	%f2  = 44100000 1dfbd0f5, Mem[00000000100c1410] = ee5efcf1 ac72aa1f
	stda	%f2 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = 44100000 1dfbd0f5
!	%l3 = 00000000000000bd, Mem[00000000100c1410] = f5d0fb1d00001044
	stxa	%l3,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000000000bd
!	Mem[0000000010041400] = 401237c1, %l1 = 00000000000007ae
	swapa	[%i1+%g0]0x80,%l1	! %l1 = 00000000401237c1
!	%l4 = 00000000000000ff, Mem[0000000010141410] = 007401c9414bfff5
	stxa	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000000000ff
!	%l1 = 00000000401237c1, Mem[0000000030001400] = ffaa7237
	stwa	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 401237c1
!	%l2 = 00000000000000ff, Mem[0000000010141410] = ff00000000000000
	stxa	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000000000ff
!	Mem[0000000010081420] = 0dfe930c, %l7 = ffffffffffffd00d, %asi = 80
	swapa	[%i2+0x020]%asi,%l7	! %l7 = 000000000dfe930c
!	Mem[0000000030181400] = ff76db7c, %l0 = 00000000000000ff
	swapa	[%i6+%g0]0x81,%l0	! %l0 = 00000000ff76db7c
!	%l0 = 00000000ff76db7c, Mem[0000000010101410] = ff8f764e
	stha	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = db7c764e
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ff000000 00000000, %l0 = ff76db7c, %l1 = 401237c1
	ldd	[%i5+%o5],%l0		! %l0 = 00000000ff000000 0000000000000000

p0_label_71:
!	Mem[0000000030181408] = f5d0fb1dc9339792, %l7 = 000000000dfe930c
	ldxa	[%i6+%o4]0x81,%l7	! %l7 = f5d0fb1dc9339792
!	Mem[0000000010081410] = ff000000 2db2ce7c, %l4 = 000000ff, %l5 = 00000000
	ldd	[%i2+%o5],%l4		! %l4 = 00000000ff000000 000000002db2ce7c
!	Mem[0000000030081400] = ff9be6f9 5c7e2726, %l6 = 0000ff10, %l7 = c9339792
	ldda	[%i2+%g0]0x81,%l6	! %l6 = 00000000ff9be6f9 000000005c7e2726
!	Mem[0000000030041408] = 1dfbd0f5, %l0 = 00000000ff000000
	lduba	[%i1+%o4]0x89,%l0	! %l0 = 00000000000000f5
!	Mem[0000000010001410] = 00000000, %f26 = 268d3596
	lda	[%i0+%o5]0x88,%f26	! %f26 = 00000000
!	Mem[0000000010101408] = ff000010f3d4369b, %f26 = 00000000 f9d8d52d
	ldda	[%i4+%o4]0x80,%f26	! %f26 = ff000010 f3d4369b
!	Mem[0000000030041400] = 000007ae, %l6 = 00000000ff9be6f9
	ldswa	[%i1+%g0]0x89,%l6	! %l6 = 00000000000007ae
!	Mem[0000000010101400] = ffffffff, %l4 = 00000000ff000000
	lduha	[%i4+%g0]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010141410] = ff000000, %l2 = 00000000000000ff
	ldsha	[%i5+%o5]0x80,%l2	! %l2 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%f3  = 1dfbd0f5, %f22 = 00000000, %f20 = 94b99440 ffff4e00
	fsmuld	%f3 ,%f22,%f20		! %f20 = 00000000 00000000

p0_label_72:
!	Mem[0000000010141410] = 000000ff, %l3 = 00000000000000bd
	ldstuba	[%i5+%o5]0x88,%l3	! %l3 = 000000ff000000ff
!	%l4 = 0000ffff, %l5 = 2db2ce7c, Mem[00000000100c1430] = 5aa1d778 2864c544
	std	%l4,[%i3+0x030]		! Mem[00000000100c1430] = 0000ffff 2db2ce7c
!	%l6 = 00000000000007ae, Mem[0000000010001438] = 760826f2cfd7dfe2
	stx	%l6,[%i0+0x038]		! Mem[0000000010001438] = 00000000000007ae
!	%f4  = ff9be6f9, Mem[0000000030081410] = ff000000
	sta	%f4 ,[%i2+%o5]0x81	! Mem[0000000030081410] = ff9be6f9
!	%l0 = 000000f5, %l1 = 00000000, Mem[0000000010081438] = 00000000 00000001
	std	%l0,[%i2+0x038]		! Mem[0000000010081438] = 000000f5 00000000
!	%l3 = 00000000000000ff, Mem[0000000030041410] = ff000000
	stba	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = ff000000
!	Mem[00000000300c1400] = 00000000, %l5 = 000000002db2ce7c
	swapa	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = 000000ff, %l6 = 00000000000007ae
	swapa	[%i4+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%l0 = 00000000000000f5, Mem[0000000010041410] = 94b99440
	stwa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000f5
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010041400] = 000007ae 7cdb76ff ffaa7237 9fa033c6
!	Mem[0000000010041410] = 000000f5 ffff4e00 e6e736ac 0a5000ff
!	Mem[0000000010041420] = ff000000 0000999c 268d3596 f9d8d52d
!	Mem[0000000010041430] = ff00500a 6adc284c bfa2e598 d51797ff
	ldda	[%i1]ASI_BLK_P,%f0	! Block Load from 0000000010041400

p0_label_73:
!	%l0 = 00000000000000f5, Mem[0000000010181410] = ffff4e00
	stba	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = ffff4ef5
!	Mem[0000000021800080] = 15f10203, %l6 = 00000000000000ff
	lduha	[%o3+0x080]%asi,%l6	! %l6 = 00000000000015f1
!	Mem[0000000010081408] = ff10fac2, %l4 = 000000000000ffff
	ldsba	[%i2+%o4]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030041410] = ff000000, %l5 = 0000000000000000
	lduba	[%i1+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041438] = bfa2e598d51797ff, %f16 = 401237c1 7cdb76ff
	ldda	[%i1+0x038]%asi,%f16	! %f16 = bfa2e598 d51797ff
!	Mem[0000000010081410] = ff0000002db2ce7c, %f22 = 00000000 000007ae
	ldda	[%i2+%o5]0x80,%f22	! %f22 = ff000000 2db2ce7c
!	Mem[0000000030001400] = c1371240, %l6 = 00000000000015f1
	ldsha	[%i0+%g0]0x89,%l6	! %l6 = 0000000000001240
!	Mem[0000000030001408] = 6f4004d8, %f31 = f3d4369b
	lda	[%i0+%o4]0x89,%f31	! %f31 = 6f4004d8
!	Mem[00000000100c1400] = ff4e0000, %l5 = 00000000000000ff
	ldsba	[%i3+%g0]0x80,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffffff, %l6 = 0000000000001240, %y  = ffffffff
	umul	%l5,%l6,%l6		! %l6 = 0000123fffffedc0, %y = 0000123f

p0_label_74:
!	Mem[0000000030001408] = 6f4004d8, %l4 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x89,%l4	! %l4 = 000000d8000000ff
!	%f30 = bfa2e598 6f4004d8, %l2 = ffffffffffffff00
!	Mem[0000000010181408] = c633a09f3772aaff
	add	%i6,0x008,%g1
	stda	%f30,[%g1+%l2]ASI_PST8_P ! Mem[0000000010181408] = c633a09f3772aaff
!	%l4 = 00000000000000d8, Mem[00000000218001c1] = f9f5186d, %asi = 80
	stba	%l4,[%o3+0x1c1]%asi	! Mem[00000000218001c0] = f9d8186d
!	Mem[0000000010001410] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i0+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000010141410] = 00000000000000ff
	stxa	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000000000
	membar	#Sync			! Added by membar checker (12)
!	%l6 = 0000123fffffedc0, Mem[0000000010041408] = ffaa7237
	stha	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = edc07237
!	%l4 = 00000000000000d8, imm = 0000000000000ef2, %l6 = 0000123fffffedc0
	xor	%l4,0xef2,%l6		! %l6 = 0000000000000e2a
!	Mem[0000000010041426] = 0000999c, %l4 = 00000000000000d8
	ldstuba	[%i1+0x026]%asi,%l4	! %l4 = 00000099000000ff
!	Mem[0000000010181418] = ff00500aac36e7e6, %l0 = 00000000000000f5, %l7 = 000000005c7e2726
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l0,%l7	! %l7 = ff00500aac36e7e6
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = fff4c8b94720ae00, %f30 = bfa2e598 6f4004d8
	ldda	[%i0+%o5]0x89,%f30	! %f30 = fff4c8b9 4720ae00

p0_label_75:
!	Mem[0000000030001400] = c1371240, %f23 = 2db2ce7c
	lda	[%i0+%g0]0x89,%f23	! %f23 = c1371240
!	Mem[0000000030041400] = ae070000, %l0 = 00000000000000f5
	lduha	[%i1+%g0]0x81,%l0	! %l0 = 000000000000ae07
!	Mem[0000000030101408] = 000000ff, %l2 = ffffffffffffff00
	ldswa	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081408] = ff10fac2, %f30 = fff4c8b9
	lda	[%i2+%o4]0x80,%f30	! %f30 = ff10fac2
!	Mem[0000000010081410] = 7cceb22d000000ff, %l1 = 0000000000000000
	ldxa	[%i2+%o5]0x88,%l1	! %l1 = 7cceb22d000000ff
!	Mem[0000000010041400] = 000007ae, %l3 = 0000000000000000
	lduha	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = 1023d0d0 f3ff754f ff00500a ac36e7e6
!	Mem[0000000010001410] = ff000000 00005aa1 6c4a7a81 c5f9822a
!	Mem[0000000010001420] = 93224344 5ca1977b 00007d7d ffffffc7
!	Mem[0000000010001430] = 20f1f32e 000000ff 00000000 000007ae
	ldda	[%i0]ASI_BLK_PL,%f16	! Block Load from 0000000010001400
!	Mem[0000000030181408] = f5d0fb1d, %l1 = 7cceb22d000000ff
	lduwa	[%i6+%o4]0x81,%l1	! %l1 = 00000000f5d0fb1d
!	Code Fragment 3
p0_fragment_11:
!	%l0 = 000000000000ae07
	setx	0xda0c8b7076ec0d93,%g7,%l0 ! %l0 = da0c8b7076ec0d93
!	%l1 = 00000000f5d0fb1d
	setx	0x87549a704b91f3ed,%g7,%l1 ! %l1 = 87549a704b91f3ed
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = da0c8b7076ec0d93
	setx	0x33a66d97c6ea8adf,%g7,%l0 ! %l0 = 33a66d97c6ea8adf
!	%l1 = 87549a704b91f3ed
	setx	0x4dae95b0036e77e0,%g7,%l1 ! %l1 = 4dae95b0036e77e0
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffffff, Mem[0000000010141404] = 60839b93
	stb	%l5,[%i5+0x004]		! Mem[0000000010141404] = ff839b93

p0_label_76:
!	%f12 = ff00500a 6adc284c, Mem[0000000030001410] = 4720ae00 fff4c8b9
	stda	%f12,[%i0+%o5]0x89	! Mem[0000000030001410] = ff00500a 6adc284c
!	Mem[0000000010101400] = ffffffff939b8360, %l5 = ffffffffffffffff, %l5 = ffffffffffffffff
	casxa	[%i4]0x80,%l5,%l5	! %l5 = ffffffff939b8360
!	%f14 = bfa2e598, Mem[00000000300c1408] = 00001044
	sta	%f14,[%i3+%o4]0x89	! Mem[00000000300c1408] = bfa2e598
!	Mem[0000000010181432] = 4c28dc6a, %l3 = 0000000000000000
	ldstub	[%i6+0x032],%l3		! %l3 = 000000dc000000ff
!	%l3 = 00000000000000dc, Mem[0000000010081408] = c2fa10ff
	stha	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = c2fa00dc
!	%l4 = 00000099, %l5 = 939b8360, Mem[00000000100c1410] = 00000000 000000bd
	stda	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000099 939b8360
!	%l2 = 000000ff, %l3 = 000000dc, Mem[0000000030101400] = ae070000 000000bb
	stda	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff 000000dc
!	%l0 = c6ea8adf, %l1 = 036e77e0, Mem[00000000100c1408] = bd0000ff 00000000
	stda	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = c6ea8adf 036e77e0
!	%l0 = 33a66d97c6ea8adf, Mem[00000000100c1408] = c6ea8adf
	stha	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 8adf8adf
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff7cfcae, %l0 = 33a66d97c6ea8adf
	ldsb	[%o2+0x001],%l0		! %l0 = 000000000000007c

p0_label_77:
!	Mem[0000000030001410] = 4c28dc6a, %l6 = 0000000000000e2a
	lduwa	[%i0+%o5]0x81,%l6	! %l6 = 000000004c28dc6a
!	%f6  = e6e736ac, %f12 = ff00500a, %f3  = 9fa033c6
	fdivs	%f6 ,%f12,%f3 		! %f3  = 2766a672
!	Mem[0000000030081410] = f9e69bff, %l2 = 00000000000000ff
	ldsba	[%i2+%o5]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030181410] = 94b99440 ffff4e00, %l4 = 00000099, %l5 = 939b8360
	ldda	[%i6+%o5]0x89,%l4	! %l4 = 00000000ffff4e00 0000000094b99440
!	Mem[00000000201c0000] = 00ff8819, %l2 = ffffffffffffffff
	ldsh	[%o0+%g0],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %l1 = 4dae95b0036e77e0
	ldsha	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041420] = ff000000 0000ff9c, %l4 = ffff4e00, %l5 = 94b99440
	ldda	[%i1+0x020]%asi,%l4	! %l4 = 00000000ff000000 000000000000ff9c
!	Mem[00000000100c1410] = 00000099, %l6 = 000000004c28dc6a
	lduwa	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000099
!	Mem[00000000300c1410] = 0000999c, %l7 = ff00500aac36e7e6
	ldswa	[%i3+%o5]0x89,%l7	! %l7 = 000000000000999c
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 000000ff, %l0 = 000000000000007c
	ldstuba	[%i1+%o5]0x89,%l0	! %l0 = 000000ff000000ff

p0_label_78:
!	Mem[00000000100c1405] = 69e04f64, %l3 = 00000000000000dc
	ldstuba	[%i3+0x005]%asi,%l3	! %l3 = 000000e0000000ff
!	Mem[0000000010001408] = ff00500a, %l6 = 0000000000000099
	swapa	[%i0+%o4]0x80,%l6	! %l6 = 00000000ff00500a
	membar	#Sync			! Added by membar checker (13)
!	%f22 = 2a82f9c5 817a4a6c, Mem[0000000010001400] = d0d02310 4f75fff3
	stda	%f22,[%i0+%g0]0x88	! Mem[0000000010001400] = 2a82f9c5 817a4a6c
!	%f0  = 000007ae 7cdb76ff, Mem[0000000010001400] = 6c4a7a81 c5f9822a
	stda	%f0 ,[%i0+%g0]0x80	! Mem[0000000010001400] = 000007ae 7cdb76ff
!	%f10 = 268d3596 f9d8d52d, Mem[00000000100c1418] = 87d772b4 d9e6cc5b
	std	%f10,[%i3+0x018]	! Mem[00000000100c1418] = 268d3596 f9d8d52d
!	Mem[000000001010140f] = f3d4369b, %l7 = 000000000000999c
	ldstuba	[%i4+0x00f]%asi,%l7	! %l7 = 0000009b000000ff
!	%l2 = 000000ff, %l3 = 000000e0, Mem[0000000010141408] = 00000000 000000d8
	stda	%l2,[%i5+0x008]%asi	! Mem[0000000010141408] = 000000ff 000000e0
!	Mem[00000000100c1418] = 268d3596, %l0 = 00000000000000ff, %asi = 80
	swapa	[%i3+0x018]%asi,%l0	! %l0 = 00000000268d3596
!	%f28 = ff000000, Mem[0000000030101408] = ff000000
	sta	%f28,[%i4+%o4]0x81	! Mem[0000000030101408] = ff000000
!	Starting 10 instruction Load Burst
!	%f22 = 2a82f9c5, %f4  = 000000f5, %f30 = ae070000
	fmuls	%f22,%f4 ,%f30		! %f30 = 00000000

p0_label_79:
!	Mem[0000000030001408] = 6f4004ff, %f25 = 44432293
	lda	[%i0+%o4]0x89,%f25	! %f25 = 6f4004ff
!	Mem[0000000030101400] = 000000ff000000dc, %l6 = 00000000ff00500a
	ldxa	[%i4+%g0]0x81,%l6	! %l6 = 000000ff000000dc
!	Mem[0000000010041408] = 3772c0ed, %l2 = 00000000000000ff
	ldswa	[%i1+%o4]0x88,%l2	! %l2 = 000000003772c0ed
!	Mem[0000000030001400] = 401237c1, %f2  = ffaa7237
	lda	[%i0+%g0]0x81,%f2 	! %f2 = 401237c1
!	Mem[0000000010041428] = 268d3596f9d8d52d, %f22 = 2a82f9c5 817a4a6c
	ldd	[%i1+0x028],%f22	! %f22 = 268d3596 f9d8d52d
!	Mem[0000000010101408] = ff000010f3d436ff, %f22 = 268d3596 f9d8d52d
	ldda	[%i4+0x008]%asi,%f22	! %f22 = ff000010 f3d436ff
!	Mem[0000000030081410] = 939b8360 f9e69bff, %l4 = ff000000, %l5 = 0000ff9c
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 00000000f9e69bff 00000000939b8360
!	Mem[0000000030041408] = f5d0fb1d, %f26 = c7ffffff
	lda	[%i1+%o4]0x81,%f26	! %f26 = f5d0fb1d
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000010101400] = ffffffff 939b8360 ff000010 f3d436ff
!	Mem[0000000010101410] = db7c764e 60839b93 7cdb76ff 136a9ee8
!	Mem[0000000010101420] = ff8f764e 1dfbd0f5 7cffb22d 1c255eee
!	Mem[0000000010101430] = a266c8ba 2430509a 14f78a44 d0d0237c
	ldda	[%i4]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010101400
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = ff76db7c, %l3 = 00000000000000e0
	ldstuba	[%i6+%g0]0x80,%l3	! %l3 = 000000ff000000ff

p0_label_80:
!	Mem[0000000030081408] = 1dfbd04e, %l2 = 000000003772c0ed
	swapa	[%i2+%o4]0x89,%l2	! %l2 = 000000001dfbd04e
!	%f28 = ff000000 2ef3f120, Mem[0000000010001400] = ae070000 ff76db7c
	stda	%f28,[%i0+%g0]0x88	! Mem[0000000010001400] = ff000000 2ef3f120
!	%l6 = 000000ff000000dc, Mem[0000000010001424] = 5ca1977b
	sth	%l6,[%i0+0x024]		! Mem[0000000010001424] = 00dc977b
!	%l0 = 268d3596, %l1 = 00000000, Mem[0000000030081400] = ff9be6f9 5c7e2726
	stda	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 268d3596 00000000
!	%l7 = 000000000000009b, Mem[00000000300c1400] = 7cceb22d000007ae
	stxa	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000000000009b
!	Mem[0000000030181408] = f5d0fb1d, %l3 = 00000000000000ff
	swapa	[%i6+%o4]0x81,%l3	! %l3 = 00000000f5d0fb1d
!	%l6 = 000000ff000000dc, Mem[0000000010181410] = f54effff
	stba	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = dc4effff
!	%l1 = 0000000000000000, immed = 00000c6b, %y  = 0000123f
	umul	%l1,0xc6b,%l6		! %l6 = 0000000000000000, %y = 00000000
!	%l6 = 0000000000000000, Mem[0000000010081426] = 7d54a593
	sth	%l6,[%i2+0x026]		! Mem[0000000010081424] = 7d540000
!	Starting 10 instruction Load Burst
!	%f27 = 7d7d0000, %f27 = 7d7d0000
	fsqrts	%f27,%f27		! %f27 = 5e7e7ede

p0_label_81:
!	Mem[0000000010081400] = 00000000, %l6 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041400] = 000007ae, %l6 = 0000000000000000
	lduba	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101404] = 939b8360, %l0 = 00000000268d3596
	lduw	[%i4+0x004],%l0		! %l0 = 00000000939b8360
!	Mem[00000000300c1408] = 98e5a2bf, %l7 = 000000000000009b
	lduwa	[%i3+%o4]0x81,%l7	! %l7 = 0000000098e5a2bf
!	Mem[0000000010101408] = ff000010, %l2 = 000000001dfbd04e
	lduwa	[%i4+%o4]0x80,%l2	! %l2 = 00000000ff000010
!	Mem[0000000010141408] = 000000ff, %l3 = 00000000f5d0fb1d
	lduha	[%i5+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 000000ff, %l4 = 00000000f9e69bff
	ldswa	[%i5+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081438] = 000000f5, %l4 = 00000000000000ff
	ldsba	[%i2+0x03b]%asi,%l4	! %l4 = fffffffffffffff5
!	Mem[00000000100c1400] = ff4e0000 69ff4f64, %l2 = ff000010, %l3 = 00000000
	ldda	[%i3+0x000]%asi,%l2	! %l2 = 00000000ff4e0000 0000000069ff4f64
!	Starting 10 instruction Store Burst
!	%l3 = 0000000069ff4f64, Mem[0000000010141400] = ff000000
	stha	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 4f640000

p0_label_82:
!	%l5 = 00000000939b8360, %l4 = fffffffffffffff5, %l1  = 0000000000000000
	mulx	%l5,%l4,%l1		! %l1 = fffffff9a8515ae0
!	Mem[0000000010141408] = ff000000, %l3 = 0000000069ff4f64
	ldstuba	[%i5+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%f20 = a15a0000 000000ff, Mem[0000000010001400] = 2ef3f120 ff000000
	stda	%f20,[%i0+%g0]0x88	! Mem[0000000010001400] = a15a0000 000000ff
!	%l4 = fffffff5, %l5 = 939b8360, Mem[0000000030041400] = 000007ae 00000000
	stda	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = fffffff5 939b8360
!	%l1 = fffffff9a8515ae0, Mem[0000000010001400] = 000000ff
	stwa	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = a8515ae0
!	%l2 = ff4e0000, %l3 = 00000000, Mem[0000000010141400] = 4f640000 ff839b93
	stda	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = ff4e0000 00000000
!	%f30 = 00000000 00000000, Mem[0000000030001408] = ff04406f 4410fac2
	stda	%f30,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000 00000000
!	%l4 = fffffffffffffff5, Mem[0000000030001408] = 00000000
	stba	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = f5000000
!	Mem[0000000030001408] = 000000f5, %l3 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l3	! %l3 = 00000000000000f5
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 0000ff00, %l1 = fffffff9a8515ae0
	lduba	[%i4+%o5]0x81,%l1	! %l1 = 0000000000000000

p0_label_83:
!	Mem[0000000010141408] = ff0000ff 000000e0, %l0 = 939b8360, %l1 = 00000000
	ldda	[%i5+0x008]%asi,%l0	! %l0 = 00000000ff0000ff 00000000000000e0
!	Mem[0000000030181408] = 000000ffc9339792, %l0 = 00000000ff0000ff
	ldxa	[%i6+%o4]0x81,%l0	! %l0 = 000000ffc9339792
!	Mem[0000000010081418] = 7cdb760e, %l4 = fffffffffffffff5
	ldswa	[%i2+0x018]%asi,%l4	! %l4 = 000000007cdb760e
!	Mem[0000000010081400] = 00000000, %f0  = 60839b93
	lda	[%i2+%g0]0x88,%f0 	! %f0 = 00000000
!	Mem[0000000030081408] = edc07237 ffff8fd9, %l2 = ff4e0000, %l3 = 000000f5
	ldda	[%i2+%o4]0x81,%l2	! %l2 = 00000000edc07237 00000000ffff8fd9
!	%l3 = 00000000ffff8fd9, %l3 = 00000000ffff8fd9, %l5  = 00000000939b8360
	mulx	%l3,%l3,%l5		! %l5 = ffff1fb2312225f1
!	%l7 = 0000000098e5a2bf, imm = fffffffffffff9cf, %l1 = 00000000000000e0
	and	%l7,-0x631,%l1		! %l1 = 0000000098e5a08f
!	Mem[0000000010001408] = 00000099, %f18 = e6e736ac
	ld	[%i0+%o4],%f18	! %f18 = 00000099
!	Mem[0000000010181400] = ff76db7c, %l7 = 0000000098e5a2bf
	ldsha	[%i6+%g0]0x80,%l7	! %l7 = ffffffffffffff76
!	Starting 10 instruction Store Burst
!	Mem[000000001010141c] = 136a9ee8, %l0 = 000000ffc9339792, %asi = 80
	swapa	[%i4+0x01c]%asi,%l0	! %l0 = 00000000136a9ee8

p0_label_84:
!	%f0  = 00000000, Mem[0000000010141400] = ff4e0000
	sta	%f0 ,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	%f18 = 00000099, Mem[0000000010001410] = 000000ff
	sta	%f18,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000099
!	Mem[0000000010181400] = 7cdb76ff, %l1 = 0000000098e5a08f
	ldstuba	[%i6+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	%f12 = 9a503024 bac866a2, %l0 = 00000000136a9ee8
!	Mem[0000000010081418] = 7cdb760ed14f7588
	add	%i2,0x018,%g1
	stda	%f12,[%g1+%l0]ASI_PST8_P ! Mem[0000000010081418] = 9a50300eba4f7588
!	%l6 = 00000000, %l7 = ffffff76, Mem[0000000010081408] = c2fa00dc 0a39d51e
	stda	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000 ffffff76
!	Mem[0000000030041410] = ff000000, %l2 = 00000000edc07237
	swapa	[%i1+%o5]0x81,%l2	! %l2 = 00000000ff000000
!	%l0 = 00000000136a9ee8, Mem[0000000021800040] = 189c7f92
	stb	%l0,[%o3+0x040]		! Mem[0000000021800040] = e89c7f92
!	%f22 = ff000010 f3d436ff, Mem[0000000030101400] = 000000ff 000000dc
	stda	%f22,[%i4+%g0]0x81	! Mem[0000000030101400] = ff000010 f3d436ff
!	Mem[0000000010181404] = c1371240, %l2 = ff000000, %l7 = ffffff76
	add	%i6,0x04,%g1
	casa	[%g1]0x80,%l2,%l7	! %l7 = 00000000c1371240
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 268d3596, %f22 = ff000010
	lda	[%i2+%g0]0x81,%f22	! %f22 = 268d3596

p0_label_85:
!	Mem[0000000030041410] = edc072370000999c, %l5 = ffff1fb2312225f1
	ldxa	[%i1+%o5]0x81,%l5	! %l5 = edc072370000999c
!	Mem[0000000030181400] = ff000000, %l4 = 000000007cdb760e
	ldswa	[%i6+%g0]0x89,%l4	! %l4 = ffffffffff000000
!	Mem[0000000030001410] = 4c28dc6a 0a5000ff, %l0 = 136a9ee8, %l1 = 000000ff
	ldda	[%i0+%o5]0x81,%l0	! %l0 = 000000004c28dc6a 000000000a5000ff
!	Code Fragment 4
p0_fragment_12:
!	%l0 = 000000004c28dc6a
	setx	0xb583d4ffe9416572,%g7,%l0 ! %l0 = b583d4ffe9416572
!	%l1 = 000000000a5000ff
	setx	0xf5e7392057fc7b64,%g7,%l1 ! %l1 = f5e7392057fc7b64
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b583d4ffe9416572
	setx	0xb2a0e39fb2b2c0be,%g7,%l0 ! %l0 = b2a0e39fb2b2c0be
!	%l1 = f5e7392057fc7b64
	setx	0xb85f40b7db590f78,%g7,%l1 ! %l1 = b85f40b7db590f78
!	Mem[0000000010141410] = 00000000, %l3 = 00000000ffff8fd9
	lduwa	[%i5+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041408] = f5d0fb1d, %l5 = edc072370000999c
	ldsba	[%i1+%o4]0x81,%l5	! %l5 = fffffffffffffff5
!	Mem[0000000030041408] = f5d0fb1d00001044, %l6 = 0000000000000000
	ldxa	[%i1+%o4]0x81,%l6	! %l6 = f5d0fb1d00001044
!	Mem[0000000010081410] = ff000000 2db2ce7c, %l0 = b2b2c0be, %l1 = db590f78
	ldd	[%i2+%o5],%l0		! %l0 = 00000000ff000000 000000002db2ce7c
!	Mem[00000000100c1404] = 69ff4f64, %l1 = 000000002db2ce7c
	lduwa	[%i3+0x004]%asi,%l1	! %l1 = 0000000069ff4f64
!	Starting 10 instruction Store Burst
!	Mem[00000000100c142c] = 00000000, %l1 = 0000000069ff4f64, %asi = 80
	swapa	[%i3+0x02c]%asi,%l1	! %l1 = 0000000000000000

p0_label_86:
!	%f14 = 7c23d0d0 448af714, Mem[0000000030001400] = 401237c1 9fa033c6
	stda	%f14,[%i0+%g0]0x81	! Mem[0000000030001400] = 7c23d0d0 448af714
!	Mem[0000000010001408] = 00000099, %l4 = ffffffffff000000
	ldstuba	[%i0+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%l3 = 0000000000000000, %l3 = 0000000000000000, %l2 = 00000000ff000000
	or	%l3,%l3,%l2		! %l2 = 0000000000000000
!	Mem[0000000010001400] = e05a51a8, %l5 = fffffffffffffff5
	swapa	[%i0+%g0]0x80,%l5	! %l5 = 00000000e05a51a8
!	%l3 = 0000000000000000, Mem[0000000030081410] = f9e69bff
	stba	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = f9e69b00
	membar	#Sync			! Added by membar checker (15)
!	%l4 = 0000000000000000, Mem[0000000010101408] = 100000ff
	stwa	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	%l2 = 0000000000000000, Mem[0000000010181410] = dc4effff
	stwa	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	Mem[0000000030001400] = 7c23d0d0, %l3 = 0000000000000000
	ldstuba	[%i0+%g0]0x81,%l3	! %l3 = 0000007c000000ff
!	%f24 = 7b97a15c 6f4004ff, Mem[00000000100c1428] = 00000000 69ff4f64
	stda	%f24,[%i3+0x028]%asi	! Mem[00000000100c1428] = 7b97a15c 6f4004ff
!	Starting 10 instruction Load Burst
!	Mem[000000001014142c] = 00aeff7c, %l2 = 0000000000000000
	lduba	[%i5+0x02e]%asi,%l2	! %l2 = 00000000000000ff

p0_label_87:
!	Mem[0000000010101410] = 4e767cdb, %l1 = 0000000000000000
	lduwa	[%i4+%o5]0x88,%l1	! %l1 = 000000004e767cdb
!	Mem[00000000201c0000] = 00ff8819, %l0 = 00000000ff000000
	lduba	[%o0+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = ff000099, %l6 = f5d0fb1d00001044
	lduwa	[%i0+%o4]0x80,%l6	! %l6 = 00000000ff000099
!	Mem[0000000030141408] = 9fa09b93, %f10 = ee5e251c
	lda	[%i5+%o4]0x89,%f10	! %f10 = 9fa09b93
!	Mem[0000000010141400] = 00000000, %l7 = 00000000c1371240
	ldsha	[%i5+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = 98e5a2bf 1dfbd0f5, %l2 = 000000ff, %l3 = 0000007c
	ldda	[%i3+%o4]0x81,%l2	! %l2 = 0000000098e5a2bf 000000001dfbd0f5
!	Mem[0000000030081400] = 268d3596, %l7 = 0000000000000000
	lduwa	[%i2+%g0]0x81,%l7	! %l7 = 00000000268d3596
!	Mem[0000000010001414] = 00005aa1, %f12 = 9a503024
	ld	[%i0+0x014],%f12	! %f12 = 00005aa1
!	Mem[0000000010141408] = ff0000ff, %l7 = 00000000268d3596
	lduba	[%i5+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f24 = 7b97a15c, Mem[0000000010141408] = ff0000ff
	sta	%f24,[%i5+%o4]0x88	! Mem[0000000010141408] = 7b97a15c

p0_label_88:
!	%f2  = ff36d4f3 100000ff, Mem[00000000300c1400] = 00000000 0000009b
	stda	%f2 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff36d4f3 100000ff
!	%l3 = 000000001dfbd0f5, Mem[0000000010041408] = edc072379fa033c6
	stxa	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = 000000001dfbd0f5
!	Mem[0000000010001410] = 99000000, %l4 = 0000000000000000
	swapa	[%i0+%o5]0x80,%l4	! %l4 = 0000000099000000
!	Mem[0000000010141438] = 26f68604, %l2 = 98e5a2bf, %l5 = e05a51a8
	add	%i5,0x38,%g1
	casa	[%g1]0x80,%l2,%l5	! %l5 = 0000000026f68604
!	Mem[0000000030101408] = ff000000, %l0 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030041400] = f5ffffff, %l0 = 00000000000000ff
	ldstuba	[%i1+%g0]0x81,%l0	! %l0 = 000000f5000000ff
!	Mem[0000000030181410] = 004effff, %l6 = 00000000ff000099
	swapa	[%i6+%o5]0x81,%l6	! %l6 = 00000000004effff
!	%f10 = 9fa09b93, %f6  = e89e6a13
	fsqrts	%f10,%f6 		! %f6  = 7fffffff
!	%f14 = 7c23d0d0 448af714, Mem[0000000010001408] = ff000099 ac36e7e6
	stda	%f14,[%i0+%o4]0x80	! Mem[0000000010001408] = 7c23d0d0 448af714
!	Starting 10 instruction Load Burst
!	Mem[00000000100c140c] = 036e77e0, %l5 = 0000000026f68604
	ldsha	[%i3+0x00c]%asi,%l5	! %l5 = 000000000000036e

p0_label_89:
!	Mem[0000000030001400] = d0d023ff, %l3 = 000000001dfbd0f5
	lduha	[%i0+%g0]0x89,%l3	! %l3 = 00000000000023ff
!	Mem[0000000010001408] = d0d0237c, %l0 = 00000000000000f5
	lduha	[%i0+%o4]0x88,%l0	! %l0 = 000000000000237c
!	Mem[00000000300c1400] = ff000010 f3d436ff, %l0 = 0000237c, %l1 = 4e767cdb
	ldda	[%i3+%g0]0x89,%l0	! %l0 = 00000000f3d436ff 00000000ff000010
!	%l3 = 00000000000023ff, imm = 00000000000007e0, %l1 = 00000000ff000010
	subc	%l3,0x7e0,%l1		! %l1 = 0000000000001c1f
!	Mem[00000000100c1400] = ff4e0000, %l7 = 00000000000000ff
	ldsha	[%i3+%g0]0x80,%l7	! %l7 = ffffffffffffff4e
!	Mem[0000000030081400] = 96358d26, %l2 = 0000000098e5a2bf
	lduwa	[%i2+%g0]0x89,%l2	! %l2 = 0000000096358d26
!	Mem[0000000030101410] = 00ff0000, %l5 = 000000000000036e
	ldsba	[%i4+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141410] = ff00500a, %f30 = 00000000
	lda	[%i5+%o5]0x81,%f30	! %f30 = ff00500a
!	Mem[0000000030141400] = d815bd00, %l2 = 0000000096358d26
	ldsha	[%i5+%g0]0x89,%l2	! %l2 = ffffffffffffbd00
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = 000000ff, %l1 = 0000000000001c1f
	ldstuba	[%i6+%o4]0x81,%l1	! %l1 = 00000000000000ff

p0_label_90:
!	%f28 = ff000000, Mem[0000000030101408] = ff000000
	sta	%f28,[%i4+%o4]0x81	! Mem[0000000030101408] = ff000000
!	Mem[00000000100c1401] = ff4e0000, %l7 = ffffffffffffff4e
	ldstuba	[%i3+0x001]%asi,%l7	! %l7 = 0000004e000000ff
!	Mem[0000000010081408] = 00000000, %l3 = 00000000000023ff
	swapa	[%i2+%o4]0x88,%l3	! %l3 = 0000000000000000
!	%l0 = f3d436ff, %l1 = 00000000, Mem[0000000010041400] = 000007ae 7cdb76ff
	stda	%l0,[%i1+0x000]%asi	! Mem[0000000010041400] = f3d436ff 00000000
!	Mem[000000001000143d] = 000007ae, %l2 = ffffffffffffbd00
	ldstuba	[%i0+0x03d]%asi,%l2	! %l2 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[00000000100c142c] = 6f4004ff, %asi = 80
	stwa	%l5,[%i3+0x02c]%asi	! Mem[00000000100c142c] = 00000000
!	%f0  = 00000000 ffffffff ff36d4f3 100000ff
!	%f4  = 939b8360 4e767cdb 7fffffff ff76db7c
!	%f8  = f5d0fb1d 4e768fff 9fa09b93 2db2ff7c
!	%f12 = 00005aa1 bac866a2 7c23d0d0 448af714
	stda	%f0,[%i0]ASI_BLK_SL	! Block Store to 0000000030001400
!	%f16 = 4f75fff3, Mem[0000000010101410] = 4e767cdb
	sta	%f16,[%i4+%o5]0x88	! Mem[0000000010101410] = 4f75fff3
!	%f19 = 0a5000ff, %f29 = 2ef3f120
	fsqrts	%f19,%f29		! %f29 = 24e6c1e8
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000010001400] = fffffff500005aa1, %l2 = 0000000000000000
	ldxa	[%i0+0x000]%asi,%l2	! %l2 = fffffff500005aa1

p0_label_91:
!	Mem[00000000100c1400] = ffff000069ff4f64, %l5 = 0000000000000000
	ldxa	[%i3+%g0]0x80,%l5	! %l5 = ffff000069ff4f64
!	Mem[0000000030141400] = d815bd00, %l5 = ffff000069ff4f64
	lduha	[%i5+%g0]0x89,%l5	! %l5 = 000000000000bd00
!	Mem[0000000030001408] = ff000010f3d436ff, %l1 = 0000000000000000
	ldxa	[%i0+%o4]0x81,%l1	! %l1 = ff000010f3d436ff
!	Mem[0000000010041400] = 00000000ff36d4f3, %f6  = 7fffffff ff76db7c
	ldda	[%i1+%g0]0x88,%f6 	! %f6  = 00000000 ff36d4f3
!	Mem[00000000100c1400] = 0000ffff, %l1 = ff000010f3d436ff
	ldsba	[%i3+%g0]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041408] = 000000001dfbd0f5, %f18 = 00000099 0a5000ff
	ldd	[%i1+%o4],%f18		! %f18 = 00000000 1dfbd0f5
!	Mem[00000000300c1408] = bfa2e598, %f13 = bac866a2
	lda	[%i3+%o4]0x89,%f13	! %f13 = bfa2e598
!	Mem[00000000100c1420] = c3d757ff, %l4 = 0000000099000000
	ldswa	[%i3+0x020]%asi,%l4	! %l4 = ffffffffc3d757ff
!	Mem[0000000010081400] = 10000000 00000000, %l4 = c3d757ff, %l5 = 0000bd00
	ldda	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000 0000000010000000
!	Starting 10 instruction Store Burst
!	%f6  = 00000000 ff36d4f3, Mem[0000000010041408] = 00000000 1dfbd0f5
	stda	%f6 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000 ff36d4f3

p0_label_92:
!	%l4 = 00000000, %l5 = 10000000, Mem[0000000010001408] = 7c23d0d0 448af714
	std	%l4,[%i0+%o4]		! Mem[0000000010001408] = 00000000 10000000
!	Mem[00000000100c141c] = f9d8d52d, %l0 = 00000000f3d436ff
	swap	[%i3+0x01c],%l0		! %l0 = 00000000f9d8d52d
!	Mem[0000000030041408] = 1dfbd0f5, %l6 = 00000000004effff
	ldstuba	[%i1+%o4]0x89,%l6	! %l6 = 000000f5000000ff
!	%f24 = 7b97a15c 6f4004ff, %l6 = 00000000000000f5
!	Mem[0000000030101408] = ff00000000000000
	add	%i4,0x008,%g1
	stda	%f24,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030101408] = ff0400005ca10000
!	%l6 = 00000000000000f5, Mem[0000000010181410] = 00000000
	stha	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000f5
!	%f9  = 4e768fff, Mem[0000000010181410] = f5000000
	sta	%f9 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 4e768fff
!	%l6 = 00000000000000f5, imm = 00000000000005ea, %l6 = 00000000000000f5
	xnor	%l6,0x5ea,%l6		! %l6 = fffffffffffffae0
!	%l2 = 00005aa1, %l3 = 00000000, Mem[0000000030101408] = 000004ff 0000a15c
	stda	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 00005aa1 00000000
!	%l0 = 00000000f9d8d52d, Mem[0000000030181410] = 990000ff
	stba	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 9900002d
!	Starting 10 instruction Load Burst
!	%l7 = 000000000000004e, imm = fffffffffffff6ce, %l2 = fffffff500005aa1
	andn	%l7,-0x932,%l2		! %l2 = 0000000000000000

p0_label_93:
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000030041400] = ffffffff 60839b93 ffd0fb1d 00001044
!	Mem[0000000030041410] = edc07237 0000999c bd645e8a 3942f58f
!	Mem[0000000030041420] = 00000000 000000bb 70114fed 30a6b062
!	Mem[0000000030041430] = 20f1f32e c5a5f115 9495b8c3 e7b4a6bd
	ldda	[%i1]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030041400
!	Mem[0000000010181408] = c633a09f, %l6 = fffffffffffffae0
	ldsba	[%i6+%o4]0x80,%l6	! %l6 = ffffffffffffffc6
!	Mem[0000000010181410] = 4e768fff4094b994, %l2 = 0000000000000000
	ldxa	[%i6+%o5]0x80,%l2	! %l2 = 4e768fff4094b994
!	Mem[0000000010081400] = 00000000, %l3 = 0000000000000000
	lduwa	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = ff76db7cc1371240, %l1 = ffffffffffffffff
	ldxa	[%i6+%g0]0x80,%l1	! %l1 = ff76db7cc1371240
!	%l4 = 0000000000000000, immd = fffffffffffff557, %l7 = 000000000000004e
	sdivx	%l4,-0xaa9,%l7		! %l7 = 0000000000000000
!	Mem[00000000100c1434] = 2db2ce7c, %l3 = 0000000000000000
	ldsha	[%i3+0x036]%asi,%l3	! %l3 = ffffffffffffce7c
!	Mem[0000000030041410] = edc07237, %l1 = ff76db7cc1371240
	ldsba	[%i1+%o5]0x81,%l1	! %l1 = ffffffffffffffed
!	Mem[0000000010181408] = ffaa72379fa033c6, %f30 = ff00500a 00000000
	ldda	[%i6+%o4]0x88,%f30	! %f30 = ffaa7237 9fa033c6
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, imm = fffffffffffff8dd, %l1 = ffffffffffffffed
	andn	%l7,-0x723,%l1		! %l1 = 0000000000000000

p0_label_94:
!	%l4 = 0000000000000000, Mem[0000000020800041] = 0eeebf87, %asi = 80
	stba	%l4,[%o1+0x041]%asi	! Mem[0000000020800040] = 0e00bf87
!	%l0 = 00000000f9d8d52d, Mem[0000000030001408] = 100000ff
	stwa	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = f9d8d52d
!	Mem[0000000030041408] = ffd0fb1d, %l2 = 4e768fff4094b994
	swapa	[%i1+%o4]0x81,%l2	! %l2 = 00000000ffd0fb1d
!	%f16 = 4f75fff3 d0d02310 00000000 1dfbd0f5
!	%f20 = a15a0000 000000ff 268d3596 f3d436ff
!	%f24 = 7b97a15c 6f4004ff f5d0fb1d 5e7e7ede
!	%f28 = ff000000 24e6c1e8 ffaa7237 9fa033c6
	stda	%f16,[%i1]ASI_BLK_AIUS	! Block Store to 0000000030041400
!	%f9  = 00000000, %f11 = ed4f1170, %f4  = 9c990000
	fdivs	%f9 ,%f11,%f4 		! %f4  = 80000000
!	Mem[0000000010181400] = 7cdb76ff, %l7 = 0000000000000000
	ldstuba	[%i6+%g0]0x88,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010181420] = 9c990000000000ff, %l2 = 00000000ffd0fb1d, %l0 = 00000000f9d8d52d
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l2,%l0	! %l0 = 9c990000000000ff
!	%l5 = 0000000010000000, Mem[0000000010081400] = 00000000
	stba	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	%l6 = ffffffffffffffc6, Mem[0000000010081400] = 00000000
	stha	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000ffc6
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = c6ff0000, %l0 = 9c990000000000ff
	lduba	[%i2+%g0]0x80,%l0	! %l0 = 00000000000000c6

p0_label_95:
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010041400] = ff36d4f3, %l4 = 0000000000000000
	lduwa	[%i1+%g0]0x88,%l4	! %l4 = 00000000ff36d4f3
!	Mem[0000000030001410] = db7c764e, %f4  = 80000000
	lda	[%i0+%o5]0x81,%f4 	! %f4 = db7c764e
!	Mem[00000000201c0000] = 00ff8819, %l3 = ffffffffffffce7c
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181400] = 000000ff, %l3 = 00000000000000ff
	ldsba	[%i6+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1410] = 00000099, %l1 = 0000000000000000
	ldsha	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l2 = 00000000ffd0fb1d
	lduba	[%i1+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141418] = 1faa72ac, %l0 = 00000000000000c6
	ldsha	[%i5+0x01a]%asi,%l0	! %l0 = 00000000000072ac
!	Mem[0000000030101408] = 00005aa1, %l3 = 0000000000000000
	lduwa	[%i4+%o4]0x89,%l3	! %l3 = 0000000000005aa1
!	%f12 = 15f1a5c5, %f7  = 8a5e64bd, %f28 = ff000000
	fsubs	%f12,%f7 ,%f28		! %f28 = 15f1a5c7
!	Starting 10 instruction Store Burst
!	%f0  = 939b8360 ffffffff 44100000 1dfbd0ff
!	%f4  = db7c764e 3772c0ed 8ff54239 8a5e64bd
!	%f8  = bb000000 00000000 62b0a630 ed4f1170
!	%f12 = 15f1a5c5 2ef3f120 bda6b4e7 c3b89594
	stda	%f0,[%i1]ASI_BLK_AIUPL	! Block Store to 0000000010041400

p0_label_96:
!	Mem[0000000020800000] = b69ac3ca, %l1 = 0000000000000000
	ldstub	[%o1+%g0],%l1		! %l1 = 000000b6000000ff
!	Mem[0000000030081410] = f9e69b00, %l7 = 00000000000000ff
	ldstuba	[%i2+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	%f22 = 268d3596 f3d436ff, Mem[0000000010001400] = fffffff5 00005aa1
	stda	%f22,[%i0+%g0]0x80	! Mem[0000000010001400] = 268d3596 f3d436ff
!	Mem[00000000100c143c] = d112ea86, %l4 = 00000000ff36d4f3
	swap	[%i3+0x03c],%l4		! %l4 = 00000000d112ea86
!	%f16 = 4f75fff3 d0d02310, Mem[0000000030141408] = 939ba09f 33ebd959
	stda	%f16,[%i5+%o4]0x81	! Mem[0000000030141408] = 4f75fff3 d0d02310
!	%l2 = 00000000, %l3 = 00005aa1, Mem[0000000010101410] = 4f75fff3 939b8360
	stda	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000 00005aa1
!	%l6 = ffffffc6, %l7 = 00000000, Mem[0000000010141400] = 00000000 00000000
	stda	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffffc6 00000000
!	Mem[0000000010001408] = 00000000, %l4 = 00000000d112ea86, %asi = 80
	swapa	[%i0+0x008]%asi,%l4	! %l4 = 0000000000000000
!	%f22 = 268d3596 f3d436ff, Mem[0000000010181410] = 4e768fff 4094b994
	stda	%f22,[%i6+%o5]0x80	! Mem[0000000010181410] = 268d3596 f3d436ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 0000ffc6, %l1 = 00000000000000b6
	lduba	[%i2+%g0]0x88,%l1	! %l1 = 00000000000000c6

p0_label_97:
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000010041400] = ffffffff, %l7 = 0000000000000000
	lduha	[%i1+%g0]0x88,%l7	! %l7 = 000000000000ffff
!	Mem[00000000100c1400] = ffff000069ff4f64, %l7 = 000000000000ffff
	ldxa	[%i3+%g0]0x80,%l7	! %l7 = ffff000069ff4f64
!	Mem[0000000010001434] = 000000ff, %l6 = ffffffffffffffc6
	ldsba	[%i0+0x037]%asi,%l6	! %l6 = ffffffffffffffff
!	%l4 = 0000000000000000, %l4 = 0000000000000000, %l6 = ffffffffffffffff
	udivx	%l4,%l4,%l6		! Div by zero, %l0 = 00000000000072fc
!	Mem[0000000021800100] = dd89a03e, %l3 = 0000000000005aa1
	lduha	[%o3+0x100]%asi,%l3	! %l3 = 000000000000dd89
!	Mem[0000000010041408] = ffd0fb1d, %l6 = ffffffffffffffff
	ldsba	[%i1+%o4]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[000000001018140c] = 3772aaff, %l7 = ffff000069ff4f64
	lduwa	[%i6+0x00c]%asi,%l7	! %l7 = 000000003772aaff
!	Mem[0000000010101408] = 00000000, %l1 = 00000000000000c6
	ldsba	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141430] = 2cd42806ffd3b4cc, %l4 = 0000000000000000
	ldxa	[%i5+0x030]%asi,%l4	! %l4 = 2cd42806ffd3b4cc
!	Starting 10 instruction Store Burst
!	%f2  = 44100000, Mem[0000000010041410] = edc07237
	sta	%f2 ,[%i1+%o5]0x80	! Mem[0000000010041410] = 44100000

p0_label_98:
!	%l2 = 0000000000000000, Mem[0000000010101400] = ffffffff
	stba	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffff00
!	%f14 = bda6b4e7, %f15 = c3b89594, %f10 = 62b0a630
	fmuls	%f14,%f15,%f10		! %f10 = 41f066db
!	Mem[0000000010001400] = 268d3596f3d436ff, %l0 = 00000000000072d4, %l5 = 0000000010000000
	casxa	[%i0]0x80,%l0,%l5	! %l5 = 268d3596f3d436ff
!	%f12 = 15f1a5c5 2ef3f120, Mem[0000000010041408] = 1dfbd0ff 44100000
	stda	%f12,[%i1+%o4]0x88	! Mem[0000000010041408] = 15f1a5c5 2ef3f120
!	%l2 = 00000000, %l3 = 0000dd89, Mem[00000000100c1438] = 64eb7f29 ff36d4f3
	stda	%l2,[%i3+0x038]%asi	! Mem[00000000100c1438] = 00000000 0000dd89
!	Mem[00000000100c1410] = 99000000, %l4 = 2cd42806ffd3b4cc
	swapa	[%i3+%o5]0x88,%l4	! %l4 = 0000000099000000
!	Mem[0000000010141400] = c6ffffff, %l0 = 00000000000072d4
	swapa	[%i5+%g0]0x80,%l0	! %l0 = 00000000c6ffffff
!	%l5 = 268d3596f3d436ff, Mem[0000000010001414] = 00005aa1, %asi = 80
	stba	%l5,[%i0+0x014]%asi	! Mem[0000000010001414] = ff005aa1
!	Mem[000000001018140c] = 3772aaff, %l1 = 00000000, %l0 = c6ffffff
	add	%i6,0x0c,%g1
	casa	[%g1]0x80,%l1,%l0	! %l0 = 000000003772aaff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ffffffff, %l5 = 268d3596f3d436ff
	lduha	[%i0+%g0]0x81,%l5	! %l5 = 000000000000ffff

p0_label_99:
!	Mem[0000000010141408] = 5ca1977b 000000e0, %l0 = 3772aaff, %l1 = 00000000
	ldda	[%i5+%o4]0x80,%l0	! %l0 = 000000005ca1977b 00000000000000e0
!	Mem[0000000010101400] = 60839b93ffffff00, %l3 = 000000000000dd89
	ldxa	[%i4+%g0]0x88,%l3	! %l3 = 60839b93ffffff00
!	Mem[0000000010041410] = 44100000, %f29 = 24e6c1e8
	lda	[%i1+%o5]0x80,%f29	! %f29 = 44100000
!	Mem[0000000010081400] = 0000ffc6, %l0 = 000000005ca1977b
	ldsba	[%i2+%g0]0x88,%l0	! %l0 = ffffffffffffffc6
!	Mem[0000000010141408] = 5ca1977b, %l4 = 0000000099000000
	lduha	[%i5+%o4]0x80,%l4	! %l4 = 0000000000005ca1
!	Mem[00000000211c0000] = ff7cfcae, %l2 = 0000000000000000
	lduh	[%o2+%g0],%l2		! %l2 = 000000000000ff7c
!	Mem[00000000300c1400] = ff36d4f3, %l7 = 000000003772aaff
	lduha	[%i3+%g0]0x81,%l7	! %l7 = 000000000000ff36
!	Mem[0000000030081400] = 268d3596, %l3 = 60839b93ffffff00
	ldsha	[%i2+%g0]0x81,%l3	! %l3 = 000000000000268d
!	Mem[000000001018140c] = 3772aaff, %l0 = ffffffffffffffc6
	lduwa	[%i6+0x00c]%asi,%l0	! %l0 = 000000003772aaff
!	Starting 10 instruction Store Burst
!	%l2 = 000000000000ff7c, Mem[0000000010141408] = e00000007b97a15c
	stxa	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000000000ff7c

p0_label_100:
!	%f7  = 8a5e64bd, Mem[0000000010041400] = ffffffff
	sta	%f7 ,[%i1+%g0]0x88	! Mem[0000000010041400] = 8a5e64bd
!	Mem[0000000030101400] = ff000010, %l3 = 000000000000268d
	swapa	[%i4+%g0]0x81,%l3	! %l3 = 00000000ff000010
!	Mem[0000000010001428] = 00007d7dffffffc7, %l3 = 00000000ff000010, %l2 = 000000000000ff7c
	add	%i0,0x28,%g1
	casxa	[%g1]0x80,%l3,%l2	! %l2 = 00007d7dffffffc7
!	%l3 = 00000000ff000010, Mem[0000000010081410] = 000000ff
	stha	%l3,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000010
!	%l2 = 00007d7dffffffc7, Mem[00000000100c1408] = df8adf8a
	stwa	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffffffc7
!	%l4 = 0000000000005ca1, Mem[000000001008143c] = 00000000
	stw	%l4,[%i2+0x03c]		! Mem[000000001008143c] = 00005ca1
!	Mem[0000000010081400] = 0000ffc6, %l4 = 0000000000005ca1
	ldstuba	[%i2+%g0]0x88,%l4	! %l4 = 000000c6000000ff
!	Mem[0000000010181406] = c1371240, %l3 = 00000000ff000010
	ldstuba	[%i6+0x006]%asi,%l3	! %l3 = 00000012000000ff
!	Mem[0000000030041400] = 4f75fff3, %l4 = 00000000000000c6
	ldstuba	[%i1+%g0]0x81,%l4	! %l4 = 0000004f000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800180] = 662d8f81, %l1 = 00000000000000e0
	lduba	[%o3+0x180]%asi,%l1	! %l1 = 0000000000000066

p0_label_101:
!	Code Fragment 3
p0_fragment_13:
!	%l0 = 000000003772aaff
	setx	0xcddcfd60685844e1,%g7,%l0 ! %l0 = cddcfd60685844e1
!	%l1 = 0000000000000066
	setx	0xbeb190781ae3651f,%g7,%l1 ! %l1 = beb190781ae3651f
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = cddcfd60685844e1
	setx	0x500d444fa914d30b,%g7,%l0 ! %l0 = 500d444fa914d30b
!	%l1 = beb190781ae3651f
	setx	0x3bd54a8fe8b8fc89,%g7,%l1 ! %l1 = 3bd54a8fe8b8fc89
!	Mem[0000000030001400] = ffffffff 00000000 2dd5d8f9 f3d436ff
!	Mem[0000000030001410] = db7c764e 60839b93 7cdb76ff ffffff7f
!	Mem[0000000030001420] = ff8f764e 1dfbd0f5 7cffb22d 939ba09f
!	Mem[0000000030001430] = a266c8ba a15a0000 14f78a44 d0d0237c
	ldda	[%i0]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030001400
!	Mem[0000000030181408] = ff0000ff, %l3 = 0000000000000012
	ldsba	[%i6+%o4]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030041410] = a15a0000, %l0 = 500d444fa914d30b
	ldsba	[%i1+%o5]0x81,%l0	! %l0 = ffffffffffffffa1
!	Mem[0000000030101410] = 0000ff0000000000, %f22 = 268d3596 f3d436ff
	ldda	[%i4+%o5]0x81,%f22	! %f22 = 0000ff00 00000000
!	Mem[0000000010041410] = 441000004e767cdb, %f30 = ffaa7237 9fa033c6
	ldda	[%i1+%o5]0x80,%f30	! %f30 = 44100000 4e767cdb
!	Mem[00000000300c1408] = 98e5a2bf 1dfbd0f5, %l4 = 0000004f, %l5 = 0000ffff
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 0000000098e5a2bf 000000001dfbd0f5
!	Mem[0000000010081408] = ff230000 76ffffff, %l6 = ffffffff, %l7 = 0000ff36
	ldda	[%i2+0x008]%asi,%l6	! %l6 = 00000000ff230000 0000000076ffffff
!	Mem[0000000010041410] = 44100000, %f24 = 7b97a15c
	lda	[%i1+0x010]%asi,%f24	! %f24 = 44100000
!	Starting 10 instruction Store Burst
!	%l1 = 3bd54a8fe8b8fc89, Mem[0000000010101434] = 2430509a, %asi = 80
	stwa	%l1,[%i4+0x034]%asi	! Mem[0000000010101434] = e8b8fc89

p0_label_102:
!	%l2 = 00007d7dffffffc7, Mem[0000000010041410] = db7c764e00001044
	stxa	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 00007d7dffffffc7
!	%l6 = 00000000ff230000, Mem[0000000030141408] = f3ff754f
	stha	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = f3ff0000
!	%f20 = a15a0000, Mem[0000000010141410] = 00000000
	sta	%f20,[%i5+%o5]0x80	! Mem[0000000010141410] = a15a0000
!	%l3 = ffffffffffffffff, Mem[0000000030181410] = 2d0000994094b994
	stxa	%l3,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffffffffffffff
!	%l6 = 00000000ff230000, Mem[0000000010141408] = 0000ff7c
	stwa	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = ff230000
!	%l1 = 3bd54a8fe8b8fc89, Mem[0000000010081408] = 000023ff
	stha	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000fc89
!	Mem[0000000030041410] = a15a0000, %l1 = 3bd54a8fe8b8fc89
	swapa	[%i1+%o5]0x81,%l1	! %l1 = 00000000a15a0000
!	%l6 = 00000000ff230000, Mem[0000000010001410] = a15a00ff00000000
	stxa	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000ff230000
!	%f18 = 00000000 1dfbd0f5, Mem[0000000030141410] = ff00500a 000000ff
	stda	%f18,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 1dfbd0f5
!	Starting 10 instruction Load Burst
!	Mem[000000001010142c] = 1c255eee, %l1 = 00000000a15a0000
	lduh	[%i4+0x02c],%l1		! %l1 = 0000000000001c25

p0_label_103:
!	Mem[0000000010141410] = 00005aa1, %l0 = ffffffffffffffa1
	ldsha	[%i5+%o5]0x88,%l0	! %l0 = 0000000000005aa1
!	Mem[0000000010081400] = ffff000000000010, %f22 = 0000ff00 00000000
	ldda	[%i2+%g0]0x80,%f22	! %f22 = ffff0000 00000010
!	Mem[0000000030041400] = f3ff75ff, %f30 = 44100000
	lda	[%i1+%g0]0x89,%f30	! %f30 = f3ff75ff
!	Mem[00000000201c0000] = 00ff8819, %l3 = ffffffffffffffff
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141408] = f3ff0000, %l2 = 00007d7dffffffc7
	ldswa	[%i5+%o4]0x89,%l2	! %l2 = fffffffff3ff0000
!	Mem[0000000010141400] = 000072d4 00000000, %l4 = 98e5a2bf, %l5 = 1dfbd0f5
	ldda	[%i5+%g0]0x80,%l4	! %l4 = 00000000000072d4 0000000000000000
!	Mem[0000000030141408] = f3ff0000, %l1 = 0000000000001c25
	lduha	[%i5+%o4]0x89,%l1	! %l1 = 0000000000000000
!	%l2 = fffffffff3ff0000, imm = 00000000000009e4, %l4 = 00000000000072d4
	xor	%l2,0x9e4,%l4		! %l4 = fffffffff3ff09e4
!	Mem[0000000030041408] = 00000000, %l0 = 0000000000005aa1
	lduha	[%i1+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010081420] = ffffd00d
	stw	%l1,[%i2+0x020]		! Mem[0000000010081420] = 00000000

p0_label_104:
!	%l6 = 00000000ff230000, Mem[0000000030141410] = 00000000
	stha	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	Code Fragment 4
p0_fragment_14:
!	%l0 = 0000000000000000
	setx	0x39e0be586ea71b7a,%g7,%l0 ! %l0 = 39e0be586ea71b7a
!	%l1 = 0000000000000000
	setx	0x86a7f4bfee5b11e3,%g7,%l1 ! %l1 = 86a7f4bfee5b11e3
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 39e0be586ea71b7a
	setx	0x23e9d8c81e4bdd08,%g7,%l0 ! %l0 = 23e9d8c81e4bdd08
!	%l1 = 86a7f4bfee5b11e3
	setx	0xc1fd25e7de0086ec,%g7,%l1 ! %l1 = c1fd25e7de0086ec
!	Mem[0000000010141408] = ff230000, %l0 = 23e9d8c81e4bdd08
	ldstuba	[%i5+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030041410] = 89fcb8e8, %l3 = 00000000000000ff
	ldstuba	[%i1+%o5]0x89,%l3	! %l3 = 000000e8000000ff
!	%f22 = ffff0000 00000010, %l5 = 0000000000000000
!	Mem[0000000030141438] = 2ca1722d891eac02
	add	%i5,0x038,%g1
	stda	%f22,[%g1+%l5]ASI_PST16_S ! Mem[0000000030141438] = 2ca1722d891eac02
!	%l6 = 00000000ff230000, Mem[00000000201c0000] = 00ff8819
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 00008819
!	%f20 = a15a0000 000000ff, %l5 = 0000000000000000
!	Mem[0000000030141430] = 3e00e1d6cebfda01
	add	%i5,0x030,%g1
	stda	%f20,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030141430] = 3e00e1d6cebfda01
!	%l1 = c1fd25e7de0086ec, Mem[00000000201c0000] = 00008819
	stb	%l1,[%o0+%g0]		! Mem[00000000201c0000] = ec008819
!	%l7 = 0000000076ffffff, Mem[0000000010001400] = 96358d26
	stwa	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 76ffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ff75fff3, %l2 = fffffffff3ff0000
	ldsha	[%i1+%g0]0x81,%l2	! %l2 = ffffffffffffff75

p0_label_105:
!	Mem[0000000010141410] = a15a000000000000, %f14 = 7c23d0d0 448af714
	ldda	[%i5+%o5]0x80,%f14	! %f14 = a15a0000 00000000
!	Mem[0000000030001408] = 2dd5d8f9, %l2 = ffffffffffffff75
	lduha	[%i0+%o4]0x81,%l2	! %l2 = 0000000000002dd5
!	Mem[0000000030181410] = ffffffff, %l5 = 0000000000000000
	lduwa	[%i6+%o5]0x81,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000030041400] = f3ff75ff, %l6 = 00000000ff230000
	lduha	[%i1+%g0]0x89,%l6	! %l6 = 00000000000075ff
!	Mem[0000000010041408] = 20f1f32e, %l5 = 00000000ffffffff
	lduwa	[%i1+%o4]0x80,%l5	! %l5 = 0000000020f1f32e
!	Mem[00000000211c0000] = ff7cfcae, %l2 = 0000000000002dd5
	ldub	[%o2+0x001],%l2		! %l2 = 000000000000007c
!	%l4 = fffffffff3ff09e4, immd = 0000000000000dbc, %l6  = 00000000000075ff
	mulx	%l4,0xdbc,%l6		! %l6 = ffffff5b22cbd770
!	Mem[0000000030141400] = 00bd15d8, %l4 = fffffffff3ff09e4
	lduwa	[%i5+%g0]0x81,%l4	! %l4 = 0000000000bd15d8
!	Mem[0000000010081408] = 89fc0000, %l4 = 0000000000bd15d8
	lduba	[%i2+%o4]0x80,%l4	! %l4 = 0000000000000089
!	Starting 10 instruction Store Burst
!	%f5  = 4e767cdb, Mem[0000000030181400] = ff000000
	sta	%f5 ,[%i6+%g0]0x89	! Mem[0000000030181400] = 4e767cdb

p0_label_106:
!	Mem[0000000030101408] = a15a000000000000, %f30 = f3ff75ff 4e767cdb
	ldda	[%i4+%o4]0x81,%f30	! %f30 = a15a0000 00000000
!	%l4 = 0000000000000089, Mem[00000000300c1408] = 98e5a2bf
	stba	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 89e5a2bf
!	%l6 = ffffff5b22cbd770, Mem[0000000021800040] = e89c7f92, %asi = 80
	stba	%l6,[%o3+0x040]%asi	! Mem[0000000021800040] = 709c7f92
!	%f16 = 4f75fff3 d0d02310 00000000 1dfbd0f5
!	%f20 = a15a0000 000000ff ffff0000 00000010
!	%f24 = 44100000 6f4004ff f5d0fb1d 5e7e7ede
!	%f28 = 15f1a5c7 44100000 a15a0000 00000000
	stda	%f16,[%i6]ASI_BLK_AIUP	! Block Store to 0000000010181400
!	Mem[00000000201c0000] = ec008819, %l0 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l0	! %l0 = 000000ec000000ff
!	%f0  = 00000000 ffffffff, Mem[0000000030041410] = ffb8fc89 000000ff
	stda	%f0 ,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 ffffffff
!	%l1 = c1fd25e7de0086ec, Mem[0000000010081400] = ffff0000
	stba	%l1,[%i2+%g0]0x80	! Mem[0000000010081400] = ecff0000
!	%l6 = ffffff5b22cbd770, Mem[0000000010141410] = a15a0000
	stha	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = d7700000
!	Mem[0000000010081410] = 10000000, %l4 = 0000000000000089
	swapa	[%i2+%o5]0x80,%l4	! %l4 = 0000000010000000
!	Starting 10 instruction Load Burst
!	%f9  = 4e768fff, %f9  = 4e768fff, %f2  = ff36d4f3 f9d8d52d
	fsmuld	%f9 ,%f9 ,%f2 		! %f2  = 43adaf21 e25c0020

p0_label_107:
!	Mem[0000000030181408] = ff0000ff, %l6 = ffffff5b22cbd770
	ldsba	[%i6+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101428] = 7cffb22d, %l3 = 00000000000000e8
	lduwa	[%i4+0x028]%asi,%l3	! %l3 = 000000007cffb22d
!	Mem[0000000010101424] = 1dfbd0f5, %l5 = 0000000020f1f32e
	ldub	[%i4+0x026],%l5		! %l5 = 00000000000000d0
!	Mem[0000000030101410] = 0000ff00 00000000, %l0 = 000000ec, %l1 = de0086ec
	ldda	[%i4+%o5]0x81,%l0	! %l0 = 000000000000ff00 0000000000000000
!	Code Fragment 3
p0_fragment_15:
!	%l0 = 000000000000ff00
	setx	0xb242a0eff3972b31,%g7,%l0 ! %l0 = b242a0eff3972b31
!	%l1 = 0000000000000000
	setx	0x7f7003587f6662f4,%g7,%l1 ! %l1 = 7f7003587f6662f4
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b242a0eff3972b31
	setx	0x099d0e079673cfe6,%g7,%l0 ! %l0 = 099d0e079673cfe6
!	%l1 = 7f7003587f6662f4
	setx	0x0348e7f0456bd850,%g7,%l1 ! %l1 = 0348e7f0456bd850
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000030041400] = ff75fff3 d0d02310 00000000 1dfbd0f5
!	Mem[0000000030041410] = 00000000 ffffffff 268d3596 f3d436ff
!	Mem[0000000030041420] = 7b97a15c 6f4004ff f5d0fb1d 5e7e7ede
!	Mem[0000000030041430] = ff000000 24e6c1e8 ffaa7237 9fa033c6
	ldda	[%i1]ASI_BLK_SL,%f0	! Block Load from 0000000030041400
!	Mem[0000000030101400] = 0000268d, %l7 = 0000000076ffffff
	lduba	[%i4+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101400] = 8d260000, %l1 = 0348e7f0456bd850
	lduha	[%i4+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = ff0000ff, %l4 = 0000000010000000
	ldsba	[%i6+%o4]0x89,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081438] = 000000f5, %l2 = 000000000000007c
	ldstub	[%i2+0x038],%l2		! %l2 = 00000000000000ff

p0_label_108:
!	%l7 = 0000000000000000, Mem[0000000030181408] = 929733c9ff0000ff
	stxa	%l7,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000000000000000
!	%f24 = 44100000 6f4004ff, %l3 = 000000007cffb22d
!	Mem[0000000030181418] = b8d681a9cc6573ad
	add	%i6,0x018,%g1
	stda	%f24,[%g1+%l3]ASI_PST32_S ! Mem[0000000030181418] = b8d681a96f4004ff
!	Mem[0000000030181400] = db7c764e, %l1 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l1	! %l1 = 00000000db7c764e
!	Mem[0000000010081400] = 0000ffec, %l0 = 099d0e079673cfe6
	swapa	[%i2+%g0]0x88,%l0	! %l0 = 000000000000ffec
!	%f29 = 44100000, %f27 = 5e7e7ede, %f27 = 5e7e7ede
	fsubs	%f29,%f27,%f27		! %f27 = de7e7ede
!	Mem[0000000010081418] = 9a50300e, %l7 = 00000000, %l3 = 7cffb22d
	add	%i2,0x18,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 000000009a50300e
!	Mem[00000000300c1408] = 89e5a2bf, %l7 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l7	! %l7 = 0000000089e5a2bf
!	%f28 = 15f1a5c7 44100000, %f28 = 15f1a5c7 44100000
	fxtod	%f28,%f28		! %f28 = 43b5f1a5 c7441000
!	%l2 = 00000000, %l3 = 9a50300e, Mem[0000000010101408] = 00000000 f3d436ff
	stda	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000 9a50300e
!	Starting 10 instruction Load Burst
!	Mem[0000000010001434] = 000000ff, %l2 = 0000000000000000
	ldsb	[%i0+0x036],%l2		! %l2 = 0000000000000000

p0_label_109:
!	Mem[0000000030081400] = 268d3596, %l0 = 000000000000ffec
	lduwa	[%i2+%g0]0x81,%l0	! %l0 = 00000000268d3596
!	Mem[0000000010081410] = 00000089, %l0 = 00000000268d3596
	lduha	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[000000001000141c] = c5f9822a, %l5 = 00000000000000d0
	lduha	[%i0+0x01e]%asi,%l5	! %l5 = 000000000000822a
!	Mem[0000000030001410] = db7c764e 60839b93, %l6 = ffffffff, %l7 = 89e5a2bf
	ldda	[%i0+%o5]0x81,%l6	! %l6 = 00000000db7c764e 0000000060839b93
!	Mem[0000000030181400] = 00000000, %f19 = 1dfbd0f5
	lda	[%i6+%g0]0x89,%f19	! %f19 = 00000000
!	Mem[0000000010001400] = ff36d4f376ffffff, %f26 = f5d0fb1d de7e7ede
	ldda	[%i0+%g0]0x88,%f26	! %f26 = ff36d4f3 76ffffff
!	Mem[0000000010181410] = 00005aa1, %l1 = 00000000db7c764e
	lduha	[%i6+%o5]0x88,%l1	! %l1 = 0000000000005aa1
!	Mem[0000000010041410] = c7ffffff, %l4 = ffffffffffffffff
	lduba	[%i1+%o5]0x80,%l4	! %l4 = 00000000000000c7
!	Mem[00000000201c0000] = ff008819, %l5 = 000000000000822a
	lduha	[%o0+0x000]%asi,%l5	! %l5 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[00000000201c0000] = ff008819, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00008819

p0_label_110:
!	Mem[0000000030101400] = 0000268d, %l1 = 0000000000005aa1
	ldstuba	[%i4+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1410] = 0000999c, %l1 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l1	! %l1 = 0000009c000000ff
!	Mem[0000000010141410] = 000070d7, %l3 = 000000009a50300e
	swapa	[%i5+%o5]0x88,%l3	! %l3 = 00000000000070d7
!	%l2 = 0000000000000000, Mem[0000000030141400] = d815bd00
	stba	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = d815bd00
!	%l0 = 0000000000000000, Mem[0000000010001400] = 76ffffff
	stha	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 76ff0000
!	Mem[0000000010081408] = 89fc0000, %l2 = 0000000000000000
	swapa	[%i2+%o4]0x80,%l2	! %l2 = 0000000089fc0000
!	%l7 = 0000000060839b93, Mem[0000000010101410] = 00000000
	stba	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000093
!	Mem[0000000030081400] = 96358d26, %l2 = 0000000089fc0000
	ldstuba	[%i2+%g0]0x89,%l2	! %l2 = 00000026000000ff
	membar	#Sync			! Added by membar checker (21)
!	%l4 = 00000000000000c7, Mem[0000000030041410] = 00000000
	stba	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000c7
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 2dd5d8f9, %l1 = 000000000000009c
	ldsba	[%i0+%o4]0x81,%l1	! %l1 = 000000000000002d

p0_label_111:
!	Mem[0000000030181408] = 00000000, %f22 = ffff0000
	lda	[%i6+%o4]0x89,%f22	! %f22 = 00000000
!	Mem[0000000010181400] = f3ff754f, %l7 = 0000000060839b93
	ldswa	[%i6+%g0]0x88,%l7	! %l7 = fffffffff3ff754f
!	Mem[0000000030181408] = 00000000, %f18 = 00000000
	lda	[%i6+%o4]0x81,%f18	! %f18 = 00000000
!	Code Fragment 3
p0_fragment_16:
!	%l0 = 0000000000000000
	setx	0x7656e54846b2db7b,%g7,%l0 ! %l0 = 7656e54846b2db7b
!	%l1 = 000000000000002d
	setx	0x7e4a43afdacf01de,%g7,%l1 ! %l1 = 7e4a43afdacf01de
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7656e54846b2db7b
	setx	0xf871ec1035001d3b,%g7,%l0 ! %l0 = f871ec1035001d3b
!	%l1 = 7e4a43afdacf01de
	setx	0x6a0a3ff0549bc1c3,%g7,%l1 ! %l1 = 6a0a3ff0549bc1c3
!	Mem[00000000300c1400] = ff36d4f3, %l1 = 6a0a3ff0549bc1c3
	ldswa	[%i3+%g0]0x81,%l1	! %l1 = ffffffffff36d4f3
!	Mem[0000000010041410] = c7ffffff7d7d0000, %f20 = a15a0000 000000ff
	ldda	[%i1+0x010]%asi,%f20	! %f20 = c7ffffff 7d7d0000
!	Mem[00000000201c0000] = 00008819, %l7 = fffffffff3ff754f
	ldsba	[%o0+0x001]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %l7 = 0000000000000000
	lduha	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041430] = 20f1f32ec5a5f115, %f26 = ff36d4f3 76ffffff
	ldda	[%i1+0x030]%asi,%f26	! %f26 = 20f1f32e c5a5f115
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000070d7, Mem[0000000010081410] = 89000000
	stba	%l3,[%i2+%o5]0x88	! Mem[0000000010081410] = 890000d7

p0_label_112:
!	%f16 = 4f75fff3 d0d02310 00000000 00000000
!	%f20 = c7ffffff 7d7d0000 00000000 00000010
!	%f24 = 44100000 6f4004ff 20f1f32e c5a5f115
!	%f28 = 43b5f1a5 c7441000 a15a0000 00000000
	stda	%f16,[%i2]ASI_COMMIT_S	! Block Store to 0000000030081400
!	%l1 = ffffffffff36d4f3, Mem[00000000300c1400] = f3d436ff
	stha	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = f3d4d4f3
!	%l5 = 000000000000ff00, Mem[0000000030181408] = 00000000
	stha	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000ff00
!	%l6 = 00000000db7c764e, Mem[000000001000142e] = ffffffc7, %asi = 80
	stha	%l6,[%i0+0x02e]%asi	! Mem[000000001000142c] = ffff764e
!	%l3 = 00000000000070d7, Mem[00000000300c1400] = ff000010f3d4d4f3
	stxa	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000000070d7
!	Mem[0000000030181408] = 0000ff00, %l1 = ffffffffff36d4f3
	swapa	[%i6+%o4]0x89,%l1	! %l1 = 000000000000ff00
	membar	#Sync			! Added by membar checker (22)
!	%l0 = f871ec1035001d3b, Mem[0000000030081410] = c7ffffff
	stha	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 1d3bffff
!	Mem[00000000100c1408] = c7ffffff, %l5 = 000000000000ff00
	ldstuba	[%i3+%o4]0x80,%l5	! %l5 = 000000c7000000ff
!	Code Fragment 4
p0_fragment_17:
!	%l0 = f871ec1035001d3b
	setx	0x1088e388375e1319,%g7,%l0 ! %l0 = 1088e388375e1319
!	%l1 = 000000000000ff00
	setx	0xd84e52803fdc66ac,%g7,%l1 ! %l1 = d84e52803fdc66ac
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1088e388375e1319
	setx	0x3f902c47d016669d,%g7,%l0 ! %l0 = 3f902c47d016669d
!	%l1 = d84e52803fdc66ac
	setx	0x46a04fd02f549734,%g7,%l1 ! %l1 = 46a04fd02f549734
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ff75fff3, %l6 = 00000000db7c764e
	lduwa	[%i1+%g0]0x81,%l6	! %l6 = 00000000ff75fff3

p0_label_113:
!	Mem[00000000300c1410] = 000099ff, %l6 = 00000000ff75fff3
	lduba	[%i3+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001400] = 0000ff76, %l5 = 00000000000000c7
	lduba	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101410] = 0000ff0000000000, %f20 = c7ffffff 7d7d0000
	ldda	[%i4+%o5]0x81,%f20	! %f20 = 0000ff00 00000000
!	Mem[0000000010041410] = c7ffffff 7d7d0000, %l2 = 00000026, %l3 = 000070d7
	ldda	[%i1+%o5]0x80,%l2	! %l2 = 00000000c7ffffff 000000007d7d0000
!	Mem[0000000030101408] = a15a0000, %l5 = 0000000000000000
	lduwa	[%i4+%o4]0x81,%l5	! %l5 = 00000000a15a0000
!	Mem[0000000010081410] = 890000d7, %l1 = 46a04fd02f549734
	lduwa	[%i2+%o5]0x88,%l1	! %l1 = 00000000890000d7
!	Mem[0000000010001410] = 000023ff00000000, %l1 = 00000000890000d7
	ldxa	[%i0+%o5]0x80,%l1	! %l1 = 000023ff00000000
!	Mem[00000000211c0001] = ff7cfcae, %l4 = 00000000000000c7
	ldstub	[%o2+0x001],%l4		! %l4 = 0000007c000000ff
!	Mem[0000000010081400] = 9673cfe6, %l6 = 00000000000000ff
	ldsha	[%i2+%g0]0x88,%l6	! %l6 = ffffffffffffcfe6
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = a15a0000, %l5 = 00000000a15a0000
	swapa	[%i4+%o4]0x81,%l5	! %l5 = 00000000a15a0000

p0_label_114:
!	Mem[0000000030101410] = 00ff0000, %l7 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101400] = ff00268d, %l6 = ffffffffffffcfe6
	swapa	[%i4+%g0]0x81,%l6	! %l6 = 00000000ff00268d
!	Mem[0000000010101438] = 14f78a44d0d0237c, %l4 = 000000000000007c, %l7 = 0000000000000000
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l4,%l7	! %l7 = 14f78a44d0d0237c
!	%l7 = 14f78a44d0d0237c, Mem[0000000010101400] = 00ffffff
	stwa	%l7,[%i4+%g0]0x80	! Mem[0000000010101400] = d0d0237c
!	%l5 = 00000000a15a0000, Mem[0000000030101410] = 0000000000ff00ff
	stxa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000a15a0000
!	%f26 = 20f1f32e c5a5f115, Mem[00000000100c1430] = 0000ffff 2db2ce7c
	stda	%f26,[%i3+0x030]%asi	! Mem[00000000100c1430] = 20f1f32e c5a5f115
!	Mem[0000000030001410] = db7c764e, %l3 = 000000007d7d0000
	swapa	[%i0+%o5]0x81,%l3	! %l3 = 00000000db7c764e
!	%l3 = 00000000db7c764e, Mem[00000000201c0000] = 00008819, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 764e8819
!	%f28 = 43b5f1a5 c7441000, %l4 = 000000000000007c
!	Mem[0000000030041428] = f5d0fb1d5e7e7ede
	add	%i1,0x028,%g1
	stda	%f28,[%g1+%l4]ASI_PST32_S ! Mem[0000000030041428] = f5d0fb1d5e7e7ede
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 7d7d0000, %f11 = 1dfbd0f5
	lda	[%i0+%o5]0x81,%f11	! %f11 = 7d7d0000

p0_label_115:
!	Mem[0000000010101428] = 7cffb22d, %f2  = f5d0fb1d
	lda	[%i4+0x028]%asi,%f2 	! %f2 = 7cffb22d
!	Mem[0000000010041428] = 70114fed, %l3 = 00000000db7c764e
	ldub	[%i1+0x028],%l3		! %l3 = 0000000000000070
!	Mem[0000000030041400] = ff75fff3, %l2 = 00000000c7ffffff
	ldsba	[%i1+%g0]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141430] = 2cd42806, %f18 = 00000000
	lda	[%i5+0x030]%asi,%f18	! %f18 = 2cd42806
!	Mem[0000000030181408] = f3d436ff, %l1 = 000023ff00000000
	lduba	[%i6+%o4]0x81,%l1	! %l1 = 00000000000000f3
!	Mem[0000000010081410] = d7000089, %l7 = 14f78a44d0d0237c
	ldsha	[%i2+%o5]0x80,%l7	! %l7 = ffffffffffffd700
!	Mem[0000000010041410] = c7ffffff, %l6 = 00000000ff00268d
	ldsha	[%i1+%o5]0x80,%l6	! %l6 = ffffffffffffc7ff
!	Mem[000000001018141c] = 00000010, %l6 = ffffffffffffc7ff
	ldsha	[%i6+0x01c]%asi,%l6	! %l6 = 0000000000000000
!	%l4 = 000000000000007c, imm = ffffffffffffffb0, %l3 = 0000000000000070
	addc	%l4,-0x050,%l3		! %l3 = 000000000000002c
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000007c, Mem[0000000030081410] = 00007d7dffff3b1d
	stxa	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000000000007c

p0_label_116:
!	Mem[0000000010141430] = 2cd42806ffd3b4cc, %l0 = 3f902c47d016669d, %l4 = 000000000000007c
	add	%i5,0x30,%g1
	casxa	[%g1]0x80,%l0,%l4	! %l4 = 2cd42806ffd3b4cc
!	%l2 = ffffffff, %l3 = 0000002c, Mem[0000000010001400] = 0000ff76 f3d436ff
	std	%l2,[%i0+%g0]		! Mem[0000000010001400] = ffffffff 0000002c
!	Mem[0000000030101408] = 00005aa1, %l3 = 000000000000002c
	swapa	[%i4+%o4]0x89,%l3	! %l3 = 0000000000005aa1
!	%f2  = 7cffb22d, Mem[0000000010081430] = 9a500fa0
	st	%f2 ,[%i2+0x030]	! Mem[0000000010081430] = 7cffb22d
!	%l5 = 00000000a15a0000, Mem[00000000100c1410] = ccb4d3ff939b8360, %asi = 80
	stxa	%l5,[%i3+0x010]%asi	! Mem[00000000100c1410] = 00000000a15a0000
!	%l7 = ffffffffffffd700, Mem[000000001014141d] = 1b8a91dd
	stb	%l7,[%i5+0x01d]		! Mem[000000001014141c] = 1b0091dd
!	%l3 = 0000000000005aa1, Mem[0000000030041400] = f3ff75ff
	stba	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = f3ff75a1
!	Mem[0000000030041410] = 000000c7, %l1 = 00000000000000f3
	ldstuba	[%i1+%o5]0x89,%l1	! %l1 = 000000c7000000ff
!	Mem[0000000030181408] = ff36d4f3, %l7 = ffffffffffffd700
	ldstuba	[%i6+%o4]0x89,%l7	! %l7 = 000000f3000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 93000000, %l1 = 00000000000000c7
	lduha	[%i4+0x012]%asi,%l1	! %l1 = 0000000000000000

p0_label_117:
!	Mem[0000000010041400] = bd645e8a, %f31 = 00000000
	lda	[%i1+%g0]0x80,%f31	! %f31 = bd645e8a
!	Mem[0000000010041410] = 00007d7d ffffffc7, %l6 = 00000000, %l7 = 000000f3
	ldda	[%i1+%o5]0x88,%l6	! %l6 = 00000000ffffffc7 0000000000007d7d
!	Mem[00000000300c1400] = 000070d7, %f14 = c633a09f
	lda	[%i3+%g0]0x89,%f14	! %f14 = 000070d7
!	Mem[00000000300c1400] = 000070d7, %l1 = 0000000000000000
	lduha	[%i3+%g0]0x89,%l1	! %l1 = 00000000000070d7
!	Mem[0000000030181408] = 00000000 ff36d4ff, %l2 = ffffffff, %l3 = 00005aa1
	ldda	[%i6+%o4]0x89,%l2	! %l2 = 00000000ff36d4ff 0000000000000000
!	Mem[0000000010041438] = 9495b8c3 e7b4a6bd, %l6 = ffffffc7, %l7 = 00007d7d
	ldd	[%i1+0x038],%l6		! %l6 = 000000009495b8c3 00000000e7b4a6bd
!	Mem[0000000010041400] = bd645e8a, %l4 = 2cd42806ffd3b4cc
	ldsha	[%i1+%g0]0x80,%l4	! %l4 = ffffffffffffbd64
!	Mem[0000000030141400] = ffffffffd815bd00, %f20 = 0000ff00 00000000
	ldda	[%i5+%g0]0x89,%f20	! %f20 = ffffffff d815bd00
!	Mem[0000000010181418] = ffff0000, %l0 = 3f902c47d016669d
	lduha	[%i6+0x01a]%asi,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i2+%o4]0x80,%l0	! %l0 = 00000000000000ff

p0_label_118:
!	%f30 = a15a0000, Mem[0000000030001410] = 7d7d0000
	sta	%f30,[%i0+%o5]0x81	! Mem[0000000030001410] = a15a0000
!	%l2 = 00000000ff36d4ff, Mem[0000000030141408] = 0000fff3
	stwa	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = ff36d4ff
!	%l2 = 00000000ff36d4ff, Mem[0000000030041410] = ff000000ffffffff
	stxa	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000ff36d4ff
!	Mem[000000001010141c] = c9339792, %l6 = 000000009495b8c3, %asi = 80
	swapa	[%i4+0x01c]%asi,%l6	! %l6 = 00000000c9339792
!	Mem[0000000010041400] = 8a5e64bd, %l0 = 0000000000000000
	ldstuba	[%i1+%g0]0x88,%l0	! %l0 = 000000bd000000ff
!	Mem[0000000010101410] = 93000000, %l0 = 00000000000000bd
	ldstuba	[%i4+%o5]0x80,%l0	! %l0 = 00000093000000ff
!	%l6 = 00000000c9339792, Mem[0000000020800040] = 0e00bf87, %asi = 80
	stba	%l6,[%o1+0x040]%asi	! Mem[0000000020800040] = 9200bf87
!	%l1 = 00000000000070d7, Mem[0000000030181410] = ffffffff
	stha	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = ffff70d7
!	Mem[0000000030181400] = 00000000, %l1 = 00000000000070d7
	ldsba	[%i6+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ffffffff0000002c, %l7 = 00000000e7b4a6bd
	ldxa	[%i0+%g0]0x80,%l7	! %l7 = ffffffff0000002c

p0_label_119:
!	Mem[0000000010101408] = 00000000, %l0 = 0000000000000093
	lduha	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = a15a0000 000000ff, %l2 = ff36d4ff, %l3 = 00000000
	ldda	[%i6+%o5]0x80,%l2	! %l2 = 00000000a15a0000 00000000000000ff
!	Mem[0000000010181420] = 44100000, %l0 = 0000000000000000
	ldsw	[%i6+0x020],%l0		! %l0 = 0000000044100000
!	Mem[0000000030081408] = 0000000000000000, %f10 = de7e7e5e 7d7d0000
	ldda	[%i2+%o4]0x81,%f10	! %f10 = 00000000 00000000
!	Mem[0000000010181408] = 00000000, %f22 = 00000000
	lda	[%i6+%o4]0x88,%f22	! %f22 = 00000000
!	Mem[00000000300c1410] = 000099ff, %l6 = 00000000c9339792
	ldsba	[%i3+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010141410] = 00000000 9a50300e, %l6 = ffffffff, %l7 = 0000002c
	ldda	[%i5+%o5]0x88,%l6	! %l6 = 000000009a50300e 0000000000000000
!	Mem[0000000030041408] = 00000000, %f16 = 4f75fff3
	lda	[%i1+%o4]0x89,%f16	! %f16 = 00000000
!	Mem[0000000030001410] = 939b8360 00005aa1, %l6 = 9a50300e, %l7 = 00000000
	ldda	[%i0+%o5]0x89,%l6	! %l6 = 0000000000005aa1 00000000939b8360
!	Starting 10 instruction Store Burst
!	%l6 = 00005aa1, %l7 = 939b8360, Mem[0000000010141430] = 2cd42806 ffd3b4cc
	std	%l6,[%i5+0x030]		! Mem[0000000010141430] = 00005aa1 939b8360

p0_label_120:
!	%f0  = 1023d0d0 f3ff75ff, Mem[0000000010001410] = ff230000 00000000
	stda	%f0 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 1023d0d0 f3ff75ff
!	%l5 = 00000000a15a0000, Mem[0000000010041424] = 000000bb, %asi = 80
	stwa	%l5,[%i1+0x024]%asi	! Mem[0000000010041424] = a15a0000
!	%l5 = 00000000a15a0000, Mem[0000000010081408] = ff000000
	stha	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	%f30 = a15a0000, Mem[0000000010081408] = 00000000
	sta	%f30,[%i2+%o4]0x80	! Mem[0000000010081408] = a15a0000
!	%l2 = 00000000a15a0000, Mem[00000000211c0001] = fffffcae
	stb	%l2,[%o2+0x001]		! Mem[00000000211c0000] = ff00fcae
!	%l0 = 0000000044100000, Mem[0000000030081410] = 7c000000
	stba	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	Mem[00000000300c1400] = 000070d7, %l0 = 0000000044100000
	swapa	[%i3+%g0]0x89,%l0	! %l0 = 00000000000070d7
!	%l0 = 00000000000070d7, Mem[00000000201c0000] = 764e8819, %asi = 80
	stha	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = 70d78819
!	Mem[0000000010081400] = 9673cfe6, %l1 = 0000000000000000
	ldstuba	[%i2+%g0]0x88,%l1	! %l1 = 000000e6000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00000000 00000000, %l2 = a15a0000, %l3 = 000000ff
	ldda	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000000 0000000000000000

p0_label_121:
!	Mem[0000000010181410] = a15a0000, %l1 = 00000000000000e6
	ldsba	[%i6+%o5]0x80,%l1	! %l1 = ffffffffffffffa1
!	Mem[0000000010041400] = 939b83608a5e64ff, %f10 = 00000000 00000000
	ldda	[%i1+%g0]0x88,%f10	! %f10 = 939b8360 8a5e64ff
!	Mem[00000000201c0000] = 70d78819, %l7 = 00000000939b8360
	lduba	[%o0+0x000]%asi,%l7	! %l7 = 0000000000000070
!	Mem[0000000010181438] = a15a0000, %f18 = 2cd42806
	ld	[%i6+0x038],%f18	! %f18 = a15a0000
!	Mem[00000000100c1400] = ffff0000, %l0 = 00000000000070d7
	lduha	[%i3+%g0]0x80,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010041410] = 00007d7dffffffc7, %f20 = ffffffff d815bd00
	ldda	[%i1+%o5]0x88,%f20	! %f20 = 00007d7d ffffffc7
!	Mem[00000000100c1400] = 644fff69 0000ffff, %l4 = ffffbd64, %l5 = a15a0000
	ldda	[%i3+%g0]0x88,%l4	! %l4 = 000000000000ffff 00000000644fff69
!	Mem[0000000030081408] = 00000000, %l2 = 0000000000000000
	lduwa	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000000
!	%l3 = 0000000000000000, imm = 0000000000000488, %l2 = 0000000000000000
	andn	%l3,0x488,%l2		! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = ffd436ff, %l3 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l3	! %l3 = 000000ff000000ff

p0_label_122:
!	%f30 = a15a0000 bd645e8a, Mem[0000000030141400] = d815bd00 ffffffff
	stda	%f30,[%i5+%g0]0x89	! Mem[0000000030141400] = a15a0000 bd645e8a
!	Mem[0000000020800041] = 9200bf87, %l0 = 000000000000ffff
	ldstuba	[%o1+0x041]%asi,%l0	! %l0 = 00000000000000ff
!	%l7 = 0000000000000070, Mem[0000000010181400] = 4f75fff3, %asi = 80
	stwa	%l7,[%i6+0x000]%asi	! Mem[0000000010181400] = 00000070
!	%l6 = 0000000000005aa1, Mem[0000000030001410] = a15a0000
	stha	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 5aa10000
!	%l2 = 0000000000000000, Mem[0000000020800040] = 92ffbf87, %asi = 80
	stba	%l2,[%o1+0x040]%asi	! Mem[0000000020800040] = 00ffbf87
!	%l1 = ffffffffffffffa1, %l1 = ffffffffffffffa1, %l2 = 0000000000000000
	xor	%l1,%l1,%l2		! %l2 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010081408] = a15a0000
	stba	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 005a0000
!	%l7 = 0000000000000070, Mem[0000000010181408] = 000000001dfbd0f5, %asi = 80
	stxa	%l7,[%i6+0x008]%asi	! Mem[0000000010181408] = 0000000000000070
!	%l6 = 0000000000005aa1, Mem[00000000201c0000] = 70d78819, %asi = 80
	stha	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = 5aa18819
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ffffcfe6, %l1 = ffffffffffffffa1
	lduha	[%i4+%g0]0x81,%l1	! %l1 = 000000000000ffff

p0_label_123:
!	Mem[0000000010081438] = ff0000f5, %l7 = 0000000000000070
	ldsw	[%i2+0x038],%l7		! %l7 = ffffffffff0000f5
!	Mem[0000000030141410] = 00000000, %f2  = 7cffb22d
	lda	[%i5+%o5]0x89,%f2 	! %f2 = 00000000
!	Mem[00000000211c0000] = ff00fcae, %l0 = 0000000000000000
	ldsb	[%o2+%g0],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010101408] = 00000000, %l6 = 0000000000005aa1
	ldswa	[%i4+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081408] = 00000000, %l1 = 000000000000ffff
	ldsha	[%i2+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141430] = 00005aa1, %l6 = 0000000000000000
	ldswa	[%i5+0x030]%asi,%l6	! %l6 = 0000000000005aa1
!	Mem[0000000030081408] = 00000000, %l5 = 00000000644fff69
	lduwa	[%i2+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041434] = c5a5f115, %f9  = 5ca1977b
	lda	[%i1+0x034]%asi,%f9 	! %f9 = c5a5f115
!	Mem[00000000300c1408] = 000000001dfbd0f5, %f24 = 44100000 6f4004ff
	ldda	[%i3+%o4]0x81,%f24	! %f24 = 00000000 1dfbd0f5
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[00000000100c1410] = 00000000
	stb	%l1,[%i3+%o5]		! Mem[00000000100c1410] = 00000000

p0_label_124:
!	Mem[0000000010141400] = d4720000, %l2 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l2	! %l2 = 00000000d4720000
!	%l3 = 00000000000000ff, %l0 = ffffffffffffffff, %l7 = ffffffffff0000f5
	andn	%l3,%l0,%l7		! %l7 = 0000000000000000
!	%l4 = 000000000000ffff, Mem[0000000030081408] = 00000000
	stwa	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000ffff
!	%l4 = 000000000000ffff, Mem[0000000010181410] = a15a0000
	stha	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = ffff0000
!	%l4 = 0000ffff, %l5 = 00000000, Mem[0000000010081410] = 890000d7 7cceb22d
	stda	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000ffff 00000000
!	%f17 = d0d02310, Mem[00000000100c1408] = ffffffff
	sta	%f17,[%i3+%o4]0x80	! Mem[00000000100c1408] = d0d02310
!	%l7 = 0000000000000000, Mem[00000000300c1408] = 00000000
	stwa	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	Mem[0000000030101408] = 0000002c, %l0 = ffffffffffffffff
	ldstuba	[%i4+%o4]0x89,%l0	! %l0 = 0000002c000000ff
!	%l6 = 0000000000005aa1, Mem[0000000010041410] = ffffffc7
	stba	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffa1
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = a1ffffff, %l3 = 00000000000000ff
	lduha	[%i1+%o5]0x80,%l3	! %l3 = 000000000000a1ff

p0_label_125:
!	Mem[0000000030001410] = 5aa10000, %l4 = 000000000000ffff
	ldswa	[%i0+%o5]0x81,%l4	! %l4 = 000000005aa10000
!	%l4 = 000000005aa10000, immd = 00000000000003a9, %l0 = 000000000000002c
	sdivx	%l4,0x3a9,%l0		! %l0 = 000000000018c2cc
!	Mem[00000000100c1408] = d0d02310, %l6 = 0000000000005aa1
	lduha	[%i3+0x00a]%asi,%l6	! %l6 = 0000000000002310
!	Mem[0000000030041400] = a175fff3, %f16 = 00000000
	lda	[%i1+%g0]0x81,%f16	! %f16 = a175fff3
!	Mem[0000000010181410] = ff000000 0000ffff, %l0 = 0018c2cc, %l1 = 00000000
	ldda	[%i6+%o5]0x88,%l0	! %l0 = 000000000000ffff 00000000ff000000
!	Mem[0000000010181408] = 00000000, %l4 = 000000005aa10000
	lduha	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101438] = 14f78a44, %l7 = 0000000000000000
	ldsha	[%i4+0x03a]%asi,%l7	! %l7 = ffffffffffff8a44
!	Mem[00000000100c1410] = 00000000, %l1 = 00000000ff000000
	ldswa	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101408] = 00000000000000ff, %f24 = 00000000 1dfbd0f5
	ldda	[%i4+%o4]0x89,%f24	! %f24 = 00000000 000000ff
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000030181400] = 00000000
	stba	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000

p0_label_126:
!	%l0 = 000000000000ffff, Mem[0000000030001408] = 2dd5d8f9
	stba	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = ffd5d8f9
!	%f9  = c5a5f115, Mem[00000000300c1410] = 000099ff
	sta	%f9 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = c5a5f115
!	Mem[0000000030041408] = 00000000, %l2 = 00000000d4720000
	ldstuba	[%i1+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	%l7 = ffffffffffff8a44, immed = 00000a91, %y  = 00000000
	smul	%l7,0xa91,%l0		! %l0 = fffffffffb23f884, %y = ffffffff
!	%l6 = 00002310, %l7 = ffff8a44, Mem[0000000030081410] = 00000000 00000000
	stda	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 00002310 ffff8a44
!	Mem[0000000010101436] = e8b8fc89, %l2 = 0000000000000000
	ldstuba	[%i4+0x036]%asi,%l2	! %l2 = 000000fc000000ff
!	Mem[0000000010081400] = ffcf7396, %l4 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l4	! %l4 = 000000ff000000ff
!	%f16 = a175fff3 d0d02310 a15a0000 00000000
!	%f20 = 00007d7d ffffffc7 00000000 00000010
!	%f24 = 00000000 000000ff 20f1f32e c5a5f115
!	%f28 = 43b5f1a5 c7441000 a15a0000 bd645e8a
	stda	%f16,[%i4]ASI_BLK_AIUPL	! Block Store to 0000000010101400
!	Mem[0000000010141424] = 0b16658b, %l5 = 0000000000000000
	ldstuba	[%i5+0x024]%asi,%l5	! %l5 = 0000000b000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 00ffbf87, %l3 = 000000000000a1ff
	ldsh	[%o1+0x040],%l3		! %l3 = 00000000000000ff

p0_label_127:
!	Mem[00000000300c1400] = 00001044, %l6 = 0000000000002310
	lduba	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l7 = ffffffffffff8a44
	ldsw	[%i5+%g0],%l7		! %l7 = 0000000000000000
!	Mem[00000000201c0000] = 5aa18819, %l4 = 00000000000000ff
	lduh	[%o0+%g0],%l4		! %l4 = 0000000000005aa1
!	Mem[0000000010001410] = f3ff75ff, %l5 = 000000000000000b
	ldsha	[%i0+%o5]0x88,%l5	! %l5 = 00000000000075ff
!	Mem[0000000010081410] = 0000ffff, %l3 = 00000000000000ff
	ldswa	[%i2+%o5]0x88,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010141410] = 9a50300e, %l3 = 000000000000ffff
	lduha	[%i5+%o5]0x88,%l3	! %l3 = 000000000000300e
!	Mem[0000000030041408] = ff0000001dfbd0f5, %f6  = ff36d4f3 96358d26
	ldda	[%i1+%o4]0x81,%f6 	! %f6  = ff000000 1dfbd0f5
!	Mem[0000000010081400] = 100000009673cfff, %l0 = fffffffffb23f884
	ldxa	[%i2+%g0]0x88,%l0	! %l0 = 100000009673cfff
!	Mem[000000001000143c] = 00ff07ae, %l5 = 00000000000075ff
	ldsba	[%i0+0x03f]%asi,%l5	! %l5 = ffffffffffffffae
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 00000000, %l3 = 000000000000300e
	ldstuba	[%i6+%g0]0x89,%l3	! %l3 = 00000000000000ff

p0_label_128:
!	Code Fragment 4
p0_fragment_18:
!	%l0 = 100000009673cfff
	setx	0x2aa23ad7e521fbbb,%g7,%l0 ! %l0 = 2aa23ad7e521fbbb
!	%l1 = 0000000000000000
	setx	0xb8832817be4c5b43,%g7,%l1 ! %l1 = b8832817be4c5b43
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2aa23ad7e521fbbb
	setx	0x32c226802b57282c,%g7,%l0 ! %l0 = 32c226802b57282c
!	%l1 = b8832817be4c5b43
	setx	0x391fc187a9c43cb3,%g7,%l1 ! %l1 = 391fc187a9c43cb3
!	%f3  = 00000000, Mem[0000000010001414] = d0d02310
	sta	%f3 ,[%i0+0x014]%asi	! Mem[0000000010001414] = 00000000
!	%f2  = 00000000, Mem[0000000030101400] = ffffcfe6
	sta	%f2 ,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	%f3  = 00000000, Mem[00000000300c1400] = 00001044
	sta	%f3 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	%l4 = 0000000000005aa1, Mem[0000000030081408] = 000000000000ffff
	stxa	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000000000005aa1
!	Mem[0000000010001408] = 86ea12d1, %l3 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l3	! %l3 = 0000000086ea12d1
!	%l2 = 00000000000000fc, Mem[0000000010141408] = ff0023ff00000000
	stxa	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000000000fc
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000010101410] = ffffffc7, %l0 = 32c226802b57282c
	ldstuba	[%i4+%o5]0x88,%l0	! %l0 = 000000c7000000ff
!	%f22 = 00000000 00000010, Mem[0000000010141408] = 00000000 000000fc
	stda	%f22,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000 00000010
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000000, %l1 = 391fc187a9c43cb3
	ldswa	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000000

p0_label_129:
!	Mem[0000000010041410] = a1ffffff7d7d0000, %l6 = 0000000000000000
	ldxa	[%i1+%o5]0x80,%l6	! %l6 = a1ffffff7d7d0000
!	Mem[0000000030081400] = f3ff754f, %l2 = 00000000000000fc
	lduwa	[%i2+%g0]0x89,%l2	! %l2 = 00000000f3ff754f
!	Mem[00000000100c1408] = d0d02310036e77e0, %l1 = 0000000000000000
	ldxa	[%i3+%o4]0x80,%l1	! %l1 = d0d02310036e77e0
!	%f27 = c5a5f115, %f26 = 20f1f32e, %f12 = e8c1e624
	fmuls	%f27,%f26,%f12		! %f12 = a71cd596
!	Mem[0000000030081408] = a15a000000000000, %l0 = 00000000000000c7
	ldxa	[%i2+%o4]0x81,%l0	! %l0 = a15a000000000000
!	%f25 = 000000ff, %f23 = 00000010
	fcmps	%fcc1,%f25,%f23		! %fcc1 = 2
!	Mem[0000000010041408] = 2ef3f120, %l0 = a15a000000000000
	lduha	[%i1+%o4]0x88,%l0	! %l0 = 000000000000f120
!	%f18 = a15a0000, %f5  = 00000000, %f12 = a71cd596
	fsubs	%f18,%f5 ,%f12		! %f12 = a15a0000
!	Mem[0000000010081400] = ffcf7396, %l7 = 0000000000000000
	ldswa	[%i2+%g0]0x80,%l7	! %l7 = ffffffffffcf7396
!	Starting 10 instruction Store Burst
!	%l1 = d0d02310036e77e0, Mem[0000000010041430] = 20f1f32ec5a5f115, %asi = 80
	stxa	%l1,[%i1+0x030]%asi	! Mem[0000000010041430] = d0d02310036e77e0

p0_label_130:
!	Code Fragment 4
p0_fragment_19:
!	%l0 = 000000000000f120
	setx	0x0210bd30735c43c0,%g7,%l0 ! %l0 = 0210bd30735c43c0
!	%l1 = d0d02310036e77e0
	setx	0xfca7788fdb6c0148,%g7,%l1 ! %l1 = fca7788fdb6c0148
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0210bd30735c43c0
	setx	0x22f9d55064fbe6fc,%g7,%l0 ! %l0 = 22f9d55064fbe6fc
!	%l1 = fca7788fdb6c0148
	setx	0x751ade0f96b11bd7,%g7,%l1 ! %l1 = 751ade0f96b11bd7
!	%l5 = ffffffffffffffae, Mem[0000000010001400] = ffffffff
	stwa	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = ffffffae
!	%l7 = ffffffffffcf7396, Mem[0000000030181410] = ffffffffffff70d7
	stxa	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = ffffffffffcf7396
!	Mem[00000000100c1430] = 20f1f32e, %l6 = a1ffffff7d7d0000
	swap	[%i3+0x030],%l6		! %l6 = 0000000020f1f32e
!	%f9  = c5a5f115, %f15 = 3772aaff, %f3  = 00000000
	fdivs	%f9 ,%f15,%f3 		! %f3  = cdaf0ef8
!	%l6 = 0000000020f1f32e, Mem[0000000010081410] = 0000ffff
	stwa	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 20f1f32e
!	%l5 = ffffffffffffffae, Mem[0000000030041400] = a175fff3d0d02310
	stxa	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffffffffffffae
!	%l7 = ffffffffffcf7396, Mem[0000000010181400] = 00000070
	stba	%l7,[%i6+%g0]0x80	! Mem[0000000010181400] = 96000070
!	%f14 = 000070d7 3772aaff, %l0 = 22f9d55064fbe6fc
!	Mem[0000000030041430] = ff00000024e6c1e8
	add	%i1,0x030,%g1
	stda	%f14,[%g1+%l0]ASI_PST32_S ! Mem[0000000030041430] = ff00000024e6c1e8
!	Starting 10 instruction Load Burst
!	Mem[0000000010081420] = 00000000, %l7 = ffffffffffcf7396
	lduha	[%i2+0x022]%asi,%l7	! %l7 = 0000000000000000

p0_label_131:
!	Mem[0000000030041400] = ffffffff, %l1 = 751ade0f96b11bd7
	lduwa	[%i1+%g0]0x81,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000030001410] = 5aa1000060839b93, %f18 = a15a0000 00000000
	ldda	[%i0+%o5]0x81,%f18	! %f18 = 5aa10000 60839b93
!	Mem[0000000030181400] = 401237c1000000ff, %l2 = 00000000f3ff754f
	ldxa	[%i6+%g0]0x89,%l2	! %l2 = 401237c1000000ff
!	Mem[0000000010041400] = 8a5e64ff, %l0 = 22f9d55064fbe6fc
	ldswa	[%i1+%g0]0x88,%l0	! %l0 = ffffffff8a5e64ff
!	%l1 = 00000000ffffffff, immed = 00000d54, %y  = ffffffff
	umul	%l1,0xd54,%l0		! %l0 = 00000d53fffff2ac, %y = 00000d53
!	Mem[0000000010001400] = 2c000000aeffffff, %l1 = 00000000ffffffff
	ldxa	[%i0+%g0]0x88,%l1	! %l1 = 2c000000aeffffff
!	Mem[00000000300c1408] = 00000000, %l3 = 0000000086ea12d1
	lduha	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101408] = 00000000000000ff, %f24 = 00000000 000000ff
	ldda	[%i4+%o4]0x89,%f24	! %f24 = 00000000 000000ff
!	Mem[0000000030041408] = ff000000, %f7  = 1dfbd0f5
	lda	[%i1+%o4]0x81,%f7 	! %f7 = ff000000
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffffae, %l7 = 0000000000000000, %l1 = 2c000000aeffffff
	sdivx	%l5,%l7,%l1		! Div by zero, %l0 = 00000d53fffff2fc

p0_label_132:
!	%l6 = 20f1f32e, %l7 = 00000000, Mem[0000000030141410] = 00000000 1dfbd0f5
	stda	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 20f1f32e 00000000
!	%l5 = ffffffffffffffae, Mem[00000000100c1410] = 00000000
	stha	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffae0000
!	%l1 = 2c000000aeffffff, Mem[0000000030001400] = ffffffff
	stha	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffffff
!	%l6 = 0000000020f1f32e, Mem[00000000300c1408] = 000000001dfbd0f5
	stxa	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000020f1f32e
!	%l1 = 2c000000aeffffff, Mem[0000000010101410] = ffffffff
	stha	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffffff
!	%l5 = ffffffffffffffae, Mem[0000000030041400] = ffffffff
	stwa	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffffae
!	Mem[0000000030141408] = ff36d4ff, %l1 = 2c000000aeffffff
	swapa	[%i5+%o4]0x81,%l1	! %l1 = 00000000ff36d4ff
!	%f2  = 00000000 cdaf0ef8, %l3 = 0000000000000000
!	Mem[0000000010081418] = 9a50300eba4f7588
	add	%i2,0x018,%g1
	stda	%f2,[%g1+%l3]ASI_PST8_P ! Mem[0000000010081418] = 9a50300eba4f7588
!	%l6 = 0000000020f1f32e, Mem[0000000010101400] = d0d02310
	stba	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = d0d0232e
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000010141400] = 00000000 00000000 00000000 00000010
!	Mem[0000000010141410] = 0e30509a 00000000 1faa72ac 1b0091dd
!	Mem[0000000010141420] = 7d7d3b2c ff16658b ffcf2554 00aeff7c
!	Mem[0000000010141430] = 00005aa1 939b8360 26f68604 1fdcd6e6
	ldda	[%i5]ASI_BLK_P,%f16	! Block Load from 0000000010141400

p0_label_133:
!	Mem[0000000010081400] = ffcf7396, %f6  = ff000000
	lda	[%i2+%g0]0x80,%f6 	! %f6 = ffcf7396
!	Mem[0000000030141410] = 20f1f32e, %l3 = 0000000000000000
	ldswa	[%i5+%o5]0x81,%l3	! %l3 = 0000000020f1f32e
!	Mem[0000000030041400] = aeffffff, %l5 = ffffffffffffffae
	lduba	[%i1+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081400] = f3ff754f, %l3 = 0000000020f1f32e
	ldsba	[%i2+%g0]0x89,%l3	! %l3 = 000000000000004f
!	Mem[0000000030141408] = ffffffae, %l0 = 00000d53fffff2d4
	lduwa	[%i5+%o4]0x89,%l0	! %l0 = 00000000ffffffae
!	Mem[0000000010101408] = 0000000000005aa1, %f12 = a15a0000 000000ff
	ldda	[%i4+0x008]%asi,%f12	! %f12 = 00000000 00005aa1
!	Mem[0000000010041400] = 8a5e64ff, %l1 = 00000000ff36d4ff
	ldsha	[%i1+%g0]0x88,%l1	! %l1 = 00000000000064ff
!	%f10 = 939b8360, Mem[0000000030001400] = ffffffff
	sta	%f10,[%i0+%g0]0x89	! Mem[0000000030001400] = 939b8360
!	Mem[0000000010181434] = 44100000, %f0  = 1023d0d0
	ld	[%i6+0x034],%f0 	! %f0 = 44100000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ffffffae, Mem[0000000010181400] = 96000070
	stwa	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = ffffffae

p0_label_134:
	membar	#Sync			! Added by membar checker (25)
!	%f0  = 44100000 f3ff75ff, Mem[0000000010141410] = 0e30509a 00000000
	stda	%f0 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 44100000 f3ff75ff
!	Mem[0000000010041410] = ffffffa1, %l1 = 00000000000064ff
	ldstuba	[%i1+%o5]0x88,%l1	! %l1 = 000000a1000000ff
!	%f26 = ffcf2554 00aeff7c, %l7 = 0000000000000000
!	Mem[0000000030081418] = 0000000000000010
	add	%i2,0x018,%g1
	stda	%f26,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030081418] = 0000000000000010
!	Mem[0000000010081400] = ffcf7396, %l2 = 401237c1000000ff
	ldstuba	[%i2+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000300c1408] = 00000000, %l4 = 0000000000005aa1
	swapa	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101400] = 2e23d0d0, %l1 = 00000000000000a1
	ldstuba	[%i4+%g0]0x80,%l1	! %l1 = 0000002e000000ff
!	%f31 = 1fdcd6e6, Mem[0000000030101410] = 00005aa1
	sta	%f31,[%i4+%o5]0x81	! Mem[0000000030101410] = 1fdcd6e6
!	Mem[0000000030041400] = aeffffff, %l2 = 00000000000000ff
	swapa	[%i1+%g0]0x89,%l2	! %l2 = 00000000aeffffff
!	%l0 = 00000000ffffffae, Mem[00000000100c1400] = 0000ffff
	stha	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000ffae
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = d0d02310, %l2 = 00000000aeffffff
	ldswa	[%i3+%o4]0x80,%l2	! %l2 = ffffffffd0d02310

p0_label_135:
!	Mem[0000000010041400] = ff645e8a, %l6 = 0000000020f1f32e
	ldsha	[%i1+%g0]0x80,%l6	! %l6 = ffffffffffffff64
!	Mem[0000000010001410] = f3ff75ff, %l2 = ffffffffd0d02310
	lduwa	[%i0+%o5]0x88,%l2	! %l2 = 00000000f3ff75ff
!	Mem[0000000010181408] = 00000000, %l6 = ffffffffffffff64
	ldswa	[%i6+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = 00005aa1, %l4 = 0000000000000000
	ldswa	[%i3+%o4]0x89,%l4	! %l4 = 0000000000005aa1
!	Mem[0000000010081400] = ffcf739600000010, %l5 = 00000000000000ff
	ldxa	[%i2+0x000]%asi,%l5	! %l5 = ffcf739600000010
!	Mem[0000000030101410] = 1fdcd6e6 00000000, %l0 = ffffffae, %l1 = 0000002e
	ldda	[%i4+%o5]0x81,%l0	! %l0 = 000000001fdcd6e6 0000000000000000
!	Mem[000000001010141c] = 00000000, %l7 = 0000000000000000
	ldswa	[%i4+0x01c]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = 1fdcd6e6, %l2 = 00000000f3ff75ff
	lduha	[%i4+%o5]0x81,%l2	! %l2 = 0000000000001fdc
!	Mem[0000000030181410] = ffffffff ffcf7396, %l2 = 00001fdc, %l3 = 0000004f
	ldda	[%i6+%o5]0x89,%l2	! %l2 = 00000000ffcf7396 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%f23 = 1b0091dd, %f28 = 00005aa1, %f13 = 00005aa1
	fmuls	%f23,%f28,%f13		! %f13 = 00000000

p0_label_136:
!	Mem[00000000300c1400] = 00000000, %l7 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181410] = 0000ffff, %l1 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l1	! %l1 = 000000ff000000ff
!	%l2 = 00000000ffcf7396, Mem[000000001000142c] = ffff764e
	stw	%l2,[%i0+0x02c]		! Mem[000000001000142c] = ffcf7396
!	%f21 = 00000000, Mem[0000000010101430] = 001044c7
	sta	%f21,[%i4+0x030]%asi	! Mem[0000000010101430] = 00000000
!	Mem[00000000100c1406] = 69ff4f64, %l2 = 00000000ffcf7396
	ldstuba	[%i3+0x006]%asi,%l2	! %l2 = 0000004f000000ff
!	Mem[00000000300c1410] = c5a5f115, %l0 = 000000001fdcd6e6
	swapa	[%i3+%o5]0x89,%l0	! %l0 = 00000000c5a5f115
!	%l4 = 00005aa1, %l5 = 00000010, Mem[0000000010141408] = 00000000 10000000
	stda	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 00005aa1 00000010
!	%l4 = 0000000000005aa1, Mem[0000000030141400] = 8a5e64bd
	stha	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 5aa164bd
!	%l7 = 0000000000000000, Mem[0000000010081428] = 559e1f57, %asi = 80
	stha	%l7,[%i2+0x028]%asi	! Mem[0000000010081428] = 00001f57
!	Starting 10 instruction Load Burst
!	Mem[000000001018141c] = 00000010, %l7 = 0000000000000000
	ldswa	[%i6+0x01c]%asi,%l7	! %l7 = 0000000000000010

p0_label_137:
!	Mem[0000000030041408] = f5d0fb1d 000000ff, %l6 = 00000000, %l7 = 00000010
	ldda	[%i1+%o4]0x89,%l6	! %l6 = 00000000000000ff 00000000f5d0fb1d
!	%f21 = 00000000, %f15 = 3772aaff
	fcmps	%fcc1,%f21,%f15		! %fcc1 = 1
!	Mem[0000000030041410] = 00000000, %l6 = 00000000000000ff
	ldswa	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181410] = ffff0000000000ff, %l2 = 000000000000004f
	ldx	[%i6+%o5],%l2		! %l2 = ffff0000000000ff
!	Mem[00000000300c1408] = a15a000020f1f32e, %f26 = ffcf2554 00aeff7c
	ldda	[%i3+%o4]0x81,%f26	! %f26 = a15a0000 20f1f32e
!	Mem[0000000010181408] = 00000000 00000070, %l4 = 00005aa1, %l5 = 00000010
	ldda	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000000 0000000000000070
!	Mem[0000000030001410] = 0000a15a, %l3 = 00000000ffffffff
	ldsba	[%i0+%o5]0x89,%l3	! %l3 = 000000000000005a
!	Mem[00000000100c1400] = 0000ffae, %l6 = 0000000000000000
	lduha	[%i3+%g0]0x88,%l6	! %l6 = 000000000000ffae
	membar	#Sync			! Added by membar checker (26)
!	Mem[00000000100c1400] = aeff0000 69ffff64 d0d02310 036e77e0
!	Mem[00000000100c1410] = ffae0000 a15a0000 000000ff f3d436ff
!	Mem[00000000100c1420] = c3d757ff 26a3ee55 7b97a15c 00000000
!	Mem[00000000100c1430] = 7d7d0000 c5a5f115 00000000 0000dd89
	ldda	[%i3]ASI_BLK_AIUP,%f0	! Block Load from 00000000100c1400
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 00000000, %l6 = 000000000000ffae
	swapa	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000000

p0_label_138:
!	%l1 = 00000000000000ff, Mem[0000000021800081] = 15f10203
	stb	%l1,[%o3+0x081]		! Mem[0000000021800080] = 15ff0203
!	%l3 = 000000000000005a, Mem[0000000010081400] = 9673cfff
	stha	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = 9673005a
!	Mem[0000000030041400] = 000000ff, %l7 = 00000000f5d0fb1d
	swapa	[%i1+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	%f20 = 0e30509a, Mem[0000000030101400] = 0000ffae
	sta	%f20,[%i4+%g0]0x81	! Mem[0000000030101400] = 0e30509a
!	%l6 = 0000000000000000, Mem[0000000010041408] = 2ef3f120
	stha	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 2ef30000
!	Mem[0000000030181410] = 9673cfff, %l5 = 0000000000000070
	ldstuba	[%i6+%o5]0x81,%l5	! %l5 = 00000096000000ff
!	%l2 = ffff0000000000ff, Mem[0000000010181400] = 1023d0d0aeffffff
	stxa	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = ffff0000000000ff
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010141400] = 00000000 00000000
	stda	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000 000000ff
!	%l2 = ffff0000000000ff, Mem[0000000030081408] = 00005aa1
	stha	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 9a50300e, %l2 = ffff0000000000ff
	lduwa	[%i4+%g0]0x89,%l2	! %l2 = 000000009a50300e

p0_label_139:
!	Mem[00000000100c1410] = ffae0000, %l3 = 000000000000005a
	lduha	[%i3+%o5]0x80,%l3	! %l3 = 000000000000ffae
!	Mem[0000000010041410] = ffffffff, %l7 = 00000000000000ff
	lduha	[%i1+%o5]0x88,%l7	! %l7 = 000000000000ffff
!	Mem[00000000300c1410] = e6d6dc1f000000ff, %f30 = 26f68604 1fdcd6e6
	ldda	[%i3+%o5]0x81,%f30	! %f30 = e6d6dc1f 000000ff
!	Mem[0000000010141410] = 44100000f3ff75ff, %f16 = 00000000 00000000
	ldda	[%i5+%o5]0x80,%f16	! %f16 = 44100000 f3ff75ff
!	Mem[0000000030001410] = 939b8360 0000a15a, %l0 = c5a5f115, %l1 = 000000ff
	ldda	[%i0+%o5]0x89,%l0	! %l0 = 000000000000a15a 00000000939b8360
!	Mem[0000000010081400] = 5a007396, %l7 = 000000000000ffff
	lduwa	[%i2+%g0]0x80,%l7	! %l7 = 000000005a007396
!	Mem[0000000030101408] = ff000000, %l2 = 000000009a50300e
	ldswa	[%i4+%o4]0x81,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010101420] = ff000000, %f22 = 1faa72ac
	lda	[%i4+0x020]%asi,%f22	! %f22 = ff000000
!	Mem[0000000021800000] = 52ffb05a, %l2 = ffffffffff000000
	lduha	[%o3+0x000]%asi,%l2	! %l2 = 00000000000052ff
!	Starting 10 instruction Store Burst
!	%f20 = 0e30509a, Mem[0000000030141410] = 20f1f32e
	sta	%f20,[%i5+%o5]0x81	! Mem[0000000030141410] = 0e30509a

p0_label_140:
!	%l5 = 0000000000000096, Mem[0000000030081410] = 10230000
	stha	%l5,[%i2+%o5]0x89	! Mem[0000000030081410] = 10230096
!	%l0 = 000000000000a15a, Mem[0000000020800040] = 00ffbf87, %asi = 80
	stba	%l0,[%o1+0x040]%asi	! Mem[0000000020800040] = 5affbf87
!	%l7 = 000000005a007396, Mem[00000000300c1400] = 00000000
	stwa	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = 5a007396
!	Mem[0000000010141408] = 00005aa1, %l6 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l6	! %l6 = 000000a1000000ff
!	%l0 = 0000a15a, %l1 = 939b8360, Mem[0000000010181408] = 00000000 00000070
	stda	%l0,[%i6+0x008]%asi	! Mem[0000000010181408] = 0000a15a 939b8360
!	%l6 = 000000a1, %l7 = 5a007396, Mem[0000000030001400] = 60839b93 00000000
	stda	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000a1 5a007396
!	%l4 = 0000000000000000, %l3 = 000000000000ffae, %l4 = 0000000000000000
	sub	%l4,%l3,%l4		! %l4 = ffffffffffff0052
!	%l3 = 000000000000ffae, immd = fffffffffffff2a7, %l3  = 000000000000ffae
	mulx	%l3,-0xd59,%l3		! %l3 = fffffffff2ab4682
!	Mem[0000000010041400] = ff645e8a, %l4 = ffffffffffff0052
	swapa	[%i1+%g0]0x80,%l4	! %l4 = 00000000ff645e8a
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ffffffffffcf73ff, %l2 = 00000000000052ff
	ldxa	[%i6+%o5]0x89,%l2	! %l2 = ffffffffffcf73ff

p0_label_141:
!	Mem[0000000010141408] = 00005aff, %l0 = 000000000000a15a
	lduba	[%i5+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101400] = ff23d0d0, %l4 = 00000000ff645e8a
	lduha	[%i4+0x002]%asi,%l4	! %l4 = 000000000000d0d0
!	Mem[0000000030101400] = 0e30509a, %l4 = 000000000000d0d0
	lduha	[%i4+%g0]0x81,%l4	! %l4 = 0000000000000e30
!	Mem[0000000030001400] = 9673005aa1000000, %f22 = ff000000 1b0091dd
	ldda	[%i0+%g0]0x89,%f22	! %f22 = 9673005a a1000000
!	Mem[0000000010141408] = ff5a0000 10000000, %l0 = 000000ff, %l1 = 939b8360
	ldda	[%i5+%o4]0x80,%l0	! %l0 = 00000000ff5a0000 0000000010000000
!	%l4 = 0000000000000e30, immd = fffffffffffffac4, %l3 = fffffffff2ab4682
	sdivx	%l4,-0x53c,%l3		! %l3 = fffffffffffffffe
!	%l2 = ffffffffffcf73ff, Mem[0000000030181408] = ffd436ff
	stha	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 73ff36ff
!	Mem[0000000030041410] = ffd436ff 00000000, %l0 = ff5a0000, %l1 = 10000000
	ldda	[%i1+%o5]0x89,%l0	! %l0 = 0000000000000000 00000000ffd436ff
!	Mem[00000000300c1410] = 1fdcd6e6, %l4 = 0000000000000e30
	ldsba	[%i3+%o5]0x89,%l4	! %l4 = ffffffffffffffe6
!	Starting 10 instruction Store Burst
!	Mem[000000001014141e] = 1b0091dd, %l2 = ffffffffffcf73ff
	ldstub	[%i5+0x01e],%l2		! %l2 = 00000091000000ff

p0_label_142:
!	Mem[0000000010141438] = 26f68604, %l7 = 000000005a007396
	swap	[%i5+0x038],%l7		! %l7 = 0000000026f68604
!	Mem[0000000030001400] = 000000a1, %l0 = 0000000000000000
	ldstuba	[%i0+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	%f2  = d0d02310 036e77e0, %l1 = 00000000ffd436ff
!	Mem[0000000010041418] = bd645e8a3942f58f
	add	%i1,0x018,%g1
	stda	%f2,[%g1+%l1]ASI_PST16_P ! Mem[0000000010041418] = d0d02310036e77e0
!	Mem[000000001014140c] = 10000000, %l4 = ffffffffffffffe6
	swap	[%i5+0x00c],%l4		! %l4 = 0000000010000000
!	%l7 = 0000000026f68604, Mem[0000000030081400] = 1023d0d0f3ff754f
	stxa	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000000026f68604
!	%l0 = 0000000000000000, Mem[000000001014141a] = 1faa72ac, %asi = 80
	stba	%l0,[%i5+0x01a]%asi	! Mem[0000000010141418] = 1faa00ac
!	Mem[00000000201c0001] = 5aa18819, %l6 = 00000000000000a1
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 000000a1000000ff
!	%l2 = 0000000000000091, Mem[0000000010081400] = 5a00739600000010
	stx	%l2,[%i2+%g0]		! Mem[0000000010081400] = 0000000000000091
	membar	#Sync			! Added by membar checker (27)
!	%l0 = 0000000000000000, Mem[00000000100c1428] = 7b97a15c, %asi = 80
	stha	%l0,[%i3+0x028]%asi	! Mem[00000000100c1428] = 0000a15c
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 44100000, %f6  = 000000ff
	lda	[%i5+%o5]0x80,%f6 	! %f6 = 44100000

p0_label_143:
!	Mem[0000000030181400] = 000000ff, %f10 = 7b97a15c
	lda	[%i6+%g0]0x89,%f10	! %f10 = 000000ff
!	Mem[0000000010001400] = 2c000000aeffffff, %f30 = e6d6dc1f 000000ff
	ldda	[%i0+%g0]0x88,%f30	! %f30 = 2c000000 aeffffff
!	Mem[0000000010081410] = 2ef3f12000000000, %f4  = ffae0000 a15a0000
	ldda	[%i2+%o5]0x80,%f4 	! %f4  = 2ef3f120 00000000
!	Mem[0000000010101410] = ffffffff, %l0 = 0000000000000000
	ldsha	[%i4+%o5]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c141c] = f3d436ff, %l6 = 00000000000000a1
	lduw	[%i3+0x01c],%l6		! %l6 = 00000000f3d436ff
!	Mem[0000000010081408] = 00005a00, %l5 = 0000000000000096
	lduwa	[%i2+%o4]0x88,%l5	! %l5 = 0000000000005a00
!	Mem[00000000100c1408] = d0d02310, %l2 = 0000000000000091
	ldsha	[%i3+%o4]0x80,%l2	! %l2 = ffffffffffffd0d0
!	Mem[00000000100c1434] = c5a5f115, %l0 = ffffffffffffffff
	lduba	[%i3+0x034]%asi,%l0	! %l0 = 00000000000000c5
!	Mem[0000000030041410] = ffd436ff00000000, %f10 = 000000ff 00000000
	ldda	[%i1+%o5]0x89,%f10	! %f10 = ffd436ff 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 2ef30000, %l7 = 0000000026f68604
	swapa	[%i1+%o4]0x88,%l7	! %l7 = 000000002ef30000

p0_label_144:
!	%f19 = 00000010, Mem[0000000010141410] = 44100000
	sta	%f19,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000010
!	Mem[0000000030081408] = ff000000, %l6 = 00000000f3d436ff
	swapa	[%i2+%o4]0x81,%l6	! %l6 = 00000000ff000000
!	%f28 = 00005aa1, Mem[0000000010081410] = 2ef3f120
	sta	%f28,[%i2+%o5]0x80	! Mem[0000000010081410] = 00005aa1
!	Mem[0000000010081425] = 7d540000, %l3 = fffffffffffffffe
	ldstub	[%i2+0x025],%l3		! %l3 = 00000054000000ff
!	%l6 = 00000000ff000000, immed = fffffc09, %y  = 00000d53
	umul	%l6,-0x3f7,%l5		! %l5 = fefffc0cf7000000, %y = fefffc0c
!	%f16 = 44100000 f3ff75ff 00000000 00000010
!	%f20 = 0e30509a 00000000 9673005a a1000000
!	%f24 = 7d7d3b2c ff16658b a15a0000 20f1f32e
!	%f28 = 00005aa1 939b8360 2c000000 aeffffff
	stda	%f16,[%i0]ASI_BLK_AIUPL	! Block Store to 0000000010001400
!	Mem[00000000300c1400] = 9673005a, %l3 = 0000000000000054
	swapa	[%i3+%g0]0x81,%l3	! %l3 = 000000009673005a
!	%l2 = ffffd0d0, %l3 = 9673005a, Mem[00000000100c1410] = 0000aeff 00005aa1
	stda	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffffd0d0 9673005a
!	Mem[0000000030141410] = 9a50300e, %l2 = ffffffffffffd0d0
	swapa	[%i5+%o5]0x89,%l2	! %l2 = 000000009a50300e
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 5aff8819, %l3 = 000000009673005a
	lduh	[%o0+%g0],%l3		! %l3 = 0000000000005aff

p0_label_145:
!	Mem[00000000300c1408] = 00005aa1, %l2 = 000000009a50300e
	lduha	[%i3+%o4]0x89,%l2	! %l2 = 0000000000005aa1
!	Mem[0000000030181410] = ff73cfff, %l5 = fefffc0cf7000000
	lduba	[%i6+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	%l1 = 00000000ffd436ff, %l6 = 00000000ff000000, %l4 = 0000000010000000
	udivx	%l1,%l6,%l4		! %l4 = 0000000000000001
!	Mem[0000000030041400] = 1dfbd0f5, %l7 = 000000002ef30000
	ldsba	[%i1+%g0]0x81,%l7	! %l7 = 000000000000001d
!	Mem[00000000100c1408] = 1023d0d0, %l0 = 00000000000000c5
	lduwa	[%i3+%o4]0x88,%l0	! %l0 = 000000001023d0d0
!	Mem[0000000030141410] = d0d0ffff, %l7 = 000000000000001d
	ldswa	[%i5+%o5]0x81,%l7	! %l7 = ffffffffd0d0ffff
!	Mem[0000000030141410] = d0d0ffff, %l1 = 00000000ffd436ff
	ldswa	[%i5+%o5]0x81,%l1	! %l1 = ffffffffd0d0ffff
!	Mem[0000000010081408] = 005a0000, %l3 = 0000000000005aff
	lduha	[%i2+%o4]0x80,%l3	! %l3 = 000000000000005a
!	%l2 = 0000000000005aa1, %l7 = ffffffffd0d0ffff, %l7 = ffffffffd0d0ffff
	sdivx	%l2,%l7,%l7		! Div by zero, %l0 = 000000001023d0f8
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000001, Mem[0000000010001400] = f3ff75ff
	stwa	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000001

p0_label_146:
!	%f1  = 69ffff64, %f11 = 00000000, %f6  = 44100000
	fsubs	%f1 ,%f11,%f6 		! %f6  = 69ffff64
!	%l2 = 0000000000005aa1, Mem[0000000010041408] = 15f1a5c526f68604
	stxa	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000005aa1
!	%f0  = aeff0000 69ffff64, %l2 = 0000000000005aa1
!	Mem[0000000030001428] = 7cffb22d939ba09f
	add	%i0,0x028,%g1
	stda	%f0,[%g1+%l2]ASI_PST8_S ! Mem[0000000030001428] = aeff002d939ba064
!	Mem[0000000010081410] = a15a0000, %l6 = 00000000ff000000
	swapa	[%i2+%o5]0x88,%l6	! %l6 = 00000000a15a0000
!	%l4 = 00000001, %l5 = 000000ff, Mem[0000000010001408] = 00000010 00000000
	stda	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000001 000000ff
!	%l5 = 00000000000000ff, Mem[0000000030101408] = ff00000000000000
	stxa	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000000000ff
!	%l0 = 000000001023d0d0, Mem[00000000100c140c] = 036e77e0, %asi = 80
	stwa	%l0,[%i3+0x00c]%asi	! Mem[00000000100c140c] = 1023d0d0
!	%l3 = 000000000000005a, imm = fffffffffffff3d4, %l3 = 000000000000005a
	and	%l3,-0xc2c,%l3		! %l3 = 0000000000000050
!	%l1 = ffffffffd0d0ffff, Mem[0000000010001430] = 60839b93a15a0000, %asi = 80
	stxa	%l1,[%i0+0x030]%asi	! Mem[0000000010001430] = ffffffffd0d0ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000, %f9  = 26a3ee55
	lda	[%i1+%o5]0x89,%f9 	! %f9 = 00000000

p0_label_147:
!	Mem[0000000010181420] = 44100000, %l4 = 0000000000000001
	lduwa	[%i6+0x020]%asi,%l4	! %l4 = 0000000044100000
!	Mem[0000000010041410] = 00007d7d ffffffff, %l2 = 00005aa1, %l3 = 00000050
	ldda	[%i1+%o5]0x88,%l2	! %l2 = 00000000ffffffff 0000000000007d7d
!	Mem[0000000010181408] = 5aa10000, %l2 = 00000000ffffffff
	ldsha	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l2 = 0000000000000000
	lduba	[%i4+%o4]0x81,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000010001410] = 00000000, %l5 = 00000000000000ff
	ldsha	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %l3 = 0000000000007d7d
	lduha	[%i4+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001428] = 2ef3f120, %l2 = 0000000000000000
	ldsh	[%i0+0x02a],%l2		! %l2 = fffffffffffff120
!	Mem[0000000010101410] = ffffffff, %l4 = 0000000044100000
	ldsba	[%i4+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001428] = 2ef3f120, %l2 = fffffffffffff120
	lduw	[%i0+0x028],%l2		! %l2 = 000000002ef3f120
!	Starting 10 instruction Store Burst
!	Mem[0000000010101427] = 00000000, %l6 = 00000000a15a0000
	ldstuba	[%i4+0x027]%asi,%l6	! %l6 = 00000000000000ff

p0_label_148:
!	%f26 = a15a0000 20f1f32e, Mem[0000000030181408] = 73ff36ff 00000000
	stda	%f26,[%i6+%o4]0x81	! Mem[0000000030181408] = a15a0000 20f1f32e
!	Mem[0000000030081408] = ff36d4f3, %l5 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l5	! %l5 = 000000f3000000ff
!	%l0 = 000000001023d0d0, Mem[0000000010041408] = 00005aa1
	stha	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000d0d0
!	%l4 = ffffffff, %l5 = 000000f3, Mem[0000000010181410] = ffff0000 000000ff
	stda	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffffff 000000f3
!	Mem[0000000021800000] = 52ffb05a, %l6 = 0000000000000000
	ldstub	[%o3+%g0],%l6		! %l6 = 00000052000000ff
!	%f21 = 00000000, Mem[00000000100c1408] = 1023d0d0
	sta	%f21,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	%f6  = 69ffff64 f3d436ff, %l6 = 0000000000000052
!	Mem[0000000010141438] = 5a0073961fdcd6e6
	add	%i5,0x038,%g1
	stda	%f6,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010141438] = 5a36739664dcffe6
!	%f0  = aeff0000 69ffff64 d0d02310 036e77e0
!	%f4  = 2ef3f120 00000000 69ffff64 f3d436ff
!	%f8  = c3d757ff 00000000 ffd436ff 00000000
!	%f12 = 7d7d0000 c5a5f115 00000000 0000dd89
	stda	%f0,[%i0]ASI_BLK_AIUSL	! Block Store to 0000000030001400
!	%f20 = 0e30509a 00000000, Mem[0000000010181408] = 5aa10000 60839b93
	stda	%f20,[%i6+%o4]0x88	! Mem[0000000010181408] = 0e30509a 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 000000ff, %l7 = 0000000000000000
	ldswa	[%i6+%g0]0x89,%l7	! %l7 = 00000000000000ff

p0_label_149:
!	Mem[000000001014141c] = 1b00ffdd, %l3 = 0000000000000000
	lduw	[%i5+0x01c],%l3		! %l3 = 000000001b00ffdd
!	Mem[0000000010041400] = ffff0052, %f24 = 7d7d3b2c
	lda	[%i1+%g0]0x80,%f24	! %f24 = ffff0052
!	Mem[0000000010081438] = ff0000f5, %f30 = 2c000000
	lda	[%i2+0x038]%asi,%f30	! %f30 = ff0000f5
!	Mem[0000000030041410] = 00000000, %l0 = 000000001023d0d0
	ldswa	[%i1+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101420] = ff000000000000ff, %f28 = 00005aa1 939b8360
	ldd	[%i4+0x020],%f28	! %f28 = ff000000 000000ff
!	Mem[0000000010181410] = ffffffff, %l3 = 000000001b00ffdd
	ldsha	[%i6+%o5]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010081410] = 000000ff, %l4 = ffffffffffffffff
	ldsha	[%i2+%o5]0x80,%l4	! %l4 = 0000000000000000
!	%f19 = 00000010, %f31 = aeffffff, %f20 = 0e30509a
	fdivs	%f19,%f31,%f20		! %l0 = 0000000000000022, Unfinished, %fsr = 0900000000
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000010001428] = 2ef3f120, %l1 = ffffffffd0d0ffff
	lduw	[%i0+0x028],%l1		! %l1 = 000000002ef3f120
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000052, Mem[00000000201c0001] = 5aff8819
	stb	%l6,[%o0+0x001]		! Mem[00000000201c0000] = 5a528819

p0_label_150:
!	Mem[0000000010081404] = 00000091, %l0 = 0000000000000022
	ldsb	[%i2+0x007],%l0		! %l0 = ffffffffffffff91
!	%l3 = ffffffffffffffff, Mem[0000000010041410] = ffffffff
	stwa	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffffff
!	Mem[0000000010101408] = 00000000, %l1 = 000000002ef3f120
	ldstuba	[%i4+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	%l5 = 00000000000000f3, Mem[0000000010181424] = 6f4004ff
	stw	%l5,[%i6+0x024]		! Mem[0000000010181424] = 000000f3
!	%l3 = ffffffffffffffff, Mem[0000000030081400] = 26f68604
	stba	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = 26f686ff
!	%l3 = ffffffffffffffff, Mem[0000000010101408] = 000000ff
	stba	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000ff
!	Mem[0000000010181400] = 000000ff, %l6 = 0000000000000052
	ldstuba	[%i6+%g0]0x88,%l6	! %l6 = 000000ff000000ff
!	%f10 = ffd436ff 00000000, Mem[0000000010141400] = 00000000 ff000000
	stda	%f10,[%i5+%g0]0x88	! Mem[0000000010141400] = ffd436ff 00000000
!	%l2 = 000000002ef3f120, Mem[0000000010041400] = 939b83605200ffff
	stxa	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000002ef3f120
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ffff0000 000000ff, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i6+%g0]0x88,%l6	! %l6 = 00000000000000ff 00000000ffff0000

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	sdiv	%l4,0xe36,%l4
	xnor	%l3,0x9be,%l3
	fsubs	%f14,%f22,%f26
	stxa	%l0,[%i4+0x028]%asi
	fadds	%f22,%f2,%f6
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be ffffffffffffff91
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 000000002ef3f120
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be ffffffffffffffff
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000000000f3
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 00000000ffff0000
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0xfefffc0c,%g2
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
	cmp	%l0,%l1			! %f0  should be aeff0000 69ffff64
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be d0d02310 036e77e0
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 2ef3f120 00000000
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 69ffff64 f3d436ff
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be c3d757ff 00000000
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be ffd436ff 00000000
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 7d7d0000 c5a5f115
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 00000000 0000dd89
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 44100000 f3ff75ff
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00000000 00000010
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 0e30509a 00000000
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 9673005a a1000000
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be ffff0052 ff16658b
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be a15a0000 20f1f32e
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be ff000000 000000ff
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be ff0000f5 aeffffff
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
	lduha	[%i3+%o5]ASI_AS_IF_USER_PRIMARY,%l4	! Mem[00000000100c1410]
	done

p0_trap1o:
	lduha	[%o3+%i5]ASI_AS_IF_USER_PRIMARY,%l4	! Mem[00000000100c1410]
	done


p0_trap2e:
	addc	%l5,%l4,%l2
	mulx	%l6,%l4,%l5
	smul	%l6,%l0,%l1
	fadds	%f6 ,%f0 ,%f10
	done

p0_trap2o:
	addc	%l5,%l4,%l2
	mulx	%l6,%l4,%l5
	smul	%l6,%l0,%l1
	fadds	%f6 ,%f0 ,%f10
	done


p0_trap3e:
	xnor	%l0,0xa1d,%l2
	addc	%l0,%l5,%l3
	sub	%l4,0xc10,%l0
	sub	%l0,0xcd0,%l7
	xor	%l3,%l5,%l6
	done

p0_trap3o:
	xnor	%l0,0xa1d,%l2
	addc	%l0,%l5,%l3
	sub	%l4,0xc10,%l0
	sub	%l0,0xcd0,%l7
	xor	%l3,%l5,%l6
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
	ldx	[%g1+0x000],%l0		! %l0 = 3e9a7f3c1f8e6e5e
	ldx	[%g1+0x008],%l1		! %l1 = 2fae58582c0f9ff4
	ldx	[%g1+0x010],%l2		! %l2 = 69e0a4b0053f74b2
	ldx	[%g1+0x018],%l3		! %l3 = dfac614ac2fa1044
	ldx	[%g1+0x020],%l4		! %l4 = 59045e985c7e2726
	ldx	[%g1+0x028],%l5		! %l5 = e2681969c21f80d7
	ldx	[%g1+0x030],%l6		! %l6 = 7c476ebe03647cfd
	ldx	[%g1+0x038],%l7		! %l7 = dead225236da1794

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
	lduh	[%i2+0x024],%l1		! Mem[0000000010081424]
	umul	%l6,-0x099,%l5
	xnor	%l3,0x33b,%l1
	smul	%l0,0x5a6,%l6
	xnor	%l6,%l1,%l2
	fsubs	%f15,%f8 ,%f9 
	jmpl	%o7,%g0
	fsubs	%f6 ,%f1 ,%f13
p0_near_0_he:
	jmpl	%o7,%g0
	or	%l6,%l1,%l3
	jmpl	%o7,%g0
	nop
near0_b2b_h:
	fsqrts	%f20,%f25
	fadds	%f23,%f24,%f18
	andn	%l1,%l5,%l5
	fsubs	%f18,%f20,%f21
	andn	%l0,%l4,%l5
	jmpl	%o7,%g0
	smul	%l1,0x555,%l2
near0_b2b_l:
	fsqrts	%f15,%f0 
	sub	%l2,%l3,%l4
	add	%l3,0x1bf,%l5
	andn	%l1,%l0,%l4
	smul	%l6,-0xc95,%l5
	jmpl	%o7,%g0
	fdivs	%f4 ,%f5 ,%f14
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	andn	%l2,0x9c6,%l6
	fstod	%f3 ,%f8 
	sub	%l0,%l4,%l7
	xnor	%l2,0xed4,%l5
	smul	%l4,0x98b,%l2
	jmpl	%o7,%g0
	or	%l7,0xa07,%l1
p0_near_1_he:
	xor	%l0,0x250,%l3
	orn	%l1,-0xa61,%l1
	sub	%l1,0x09d,%l3
	smul	%l0,-0xa48,%l5
	fsqrts	%f22,%f21
	xnor	%l3,%l5,%l3
	fdivs	%f26,%f20,%f30
	jmpl	%o7,%g0
	fdivs	%f20,%f20,%f25
near1_b2b_h:
	jmpl	%o7,%g0
	and	%l7,0x5f3,%l7
	jmpl	%o7,%g0
	nop
near1_b2b_l:
	jmpl	%o7,%g0
	subc	%l0,%l2,%l4
	jmpl	%o7,%g0
	nop
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	or	%l1,%l3,%l7
	and	%l0,-0x37d,%l5
	jmpl	%o7,%g0
	fmuls	%f9 ,%f8 ,%f11
p0_near_2_he:
	jmpl	%o7,%g0
	andn	%l4,-0x077,%l4
	jmpl	%o7,%g0
	nop
near2_b2b_h:
	fadds	%f22,%f21,%f23
	addc	%l5,0x3ef,%l1
	subc	%l2,%l3,%l5
	and	%l1,%l1,%l4
	smul	%l7,%l2,%l7
	and	%l2,%l4,%l6
	and	%l7,0x4d9,%l6
	jmpl	%o7,%g0
	mulx	%l0,%l7,%l5
near2_b2b_l:
	fsubs	%f2 ,%f10,%f0 
	fdivs	%f9 ,%f2 ,%f0 
	fcmps	%fcc2,%f8 ,%f6 
	andn	%l4,0x49c,%l3
	orn	%l4,-0x710,%l7
	smul	%l0,-0x0c8,%l4
	addc	%l5,0xf9c,%l0
	jmpl	%o7,%g0
	fmuls	%f5 ,%f12,%f3 
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	fdivs	%f14,%f12,%f8 
	jmpl	%o7,%g0
	xnor	%l7,%l0,%l5
p0_near_3_he:
	andn	%l7,%l4,%l1
	subc	%l0,0x7ce,%l4
	fmuls	%f21,%f21,%f20
	jmpl	%o7,%g0
	mulx	%l7,0x705,%l4
near3_b2b_h:
	fdivs	%f27,%f25,%f25
	fsubs	%f24,%f31,%f22
	sub	%l1,0xc73,%l4
	jmpl	%o7,%g0
	sdivx	%l6,%l5,%l5
near3_b2b_l:
	fadds	%f9 ,%f6 ,%f1 
	fadds	%f14,%f13,%f3 
	andn	%l0,0xa3d,%l2
	jmpl	%o7,%g0
	fsubs	%f15,%f8 ,%f5 
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	fsubs	%f7 ,%f8 ,%f15
	subc	%l6,%l7,%l2
	fsubs	%f4 ,%f8 ,%f13
	xor	%l5,%l2,%l2
	fcmps	%fcc0,%f4 ,%f1 
	jmpl	%o7,%g0
	mulx	%l0,0xcd1,%l1
p0_far_0_lem:
	fsubs	%f7 ,%f8 ,%f15
	subc	%l6,%l7,%l2
	fsubs	%f4 ,%f8 ,%f13
	xor	%l5,%l2,%l2
	fcmps	%fcc0,%f4 ,%f1 
	jmpl	%o7,%g0
	mulx	%l0,0xcd1,%l1
p0_far_0_he:
	jmpl	%o7,%g0
	udivx	%l5,%l1,%l3
	jmpl	%o7,%g0
	nop
p0_far_0_hem:
	jmpl	%o7,%g0
	udivx	%l5,%l1,%l3
	jmpl	%o7,%g0
	nop
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	jmpl	%o7,%g0
	mulx	%l0,%l3,%l4
	jmpl	%o7,%g0
	nop
far0_b2b_l:
	jmpl	%o7,%g0
	fmuls	%f15,%f7 ,%f13
	jmpl	%o7,%g0
	nop
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	sdivx	%l5,%l3,%l6
	mulx	%l1,0xad8,%l7
	umul	%l2,%l1,%l7
	jmpl	%o7,%g0
	fmuls	%f1 ,%f15,%f8 
p0_far_1_lem:
	sdivx	%l5,%l3,%l6
	mulx	%l1,0xad8,%l7
	umul	%l2,%l1,%l7
	jmpl	%o7,%g0
	fmuls	%f1 ,%f15,%f8 
p0_far_1_he:
	ld	[%i5+0x020],%f26	! Mem[0000000010141420]
	jmpl	%o7,%g0
	fadds	%f31,%f18,%f21
p0_far_1_hem:
	membar	#Sync
	ld	[%i5+0x020],%f26	! Mem[0000000010141420]
	jmpl	%o7,%g0
	fadds	%f31,%f18,%f21
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	jmpl	%o7,%g0
	umul	%l7,%l6,%l0
	jmpl	%o7,%g0
	nop
far1_b2b_l:
	jmpl	%o7,%g0
	fsubs	%f1 ,%f6 ,%f3 
	jmpl	%o7,%g0
	nop
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	add	%l5,%l1,%l4
	fdivs	%f12,%f5 ,%f9 
	fdivs	%f14,%f12,%f2 
	orn	%l7,%l5,%l5
	jmpl	%o7,%g0
	udivx	%l4,%l3,%l1
p0_far_2_lem:
	add	%l5,%l1,%l4
	fdivs	%f12,%f5 ,%f9 
	fdivs	%f14,%f12,%f2 
	orn	%l7,%l5,%l5
	jmpl	%o7,%g0
	udivx	%l4,%l3,%l1
p0_far_2_he:
	addc	%l2,%l4,%l3
	fcmps	%fcc0,%f21,%f22
	jmpl	%o7,%g0
	subc	%l3,-0x8ad,%l6
p0_far_2_hem:
	addc	%l2,%l4,%l3
	fcmps	%fcc0,%f21,%f22
	jmpl	%o7,%g0
	subc	%l3,-0x8ad,%l6
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	nop
	jmpl	%o7,%g0
	fsubs	%f25,%f21,%f18
far2_b2b_l:
	add	%l2,0x8e2,%l2
	jmpl	%o7,%g0
	and	%l7,-0xb76,%l0
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	fsubs	%f6 ,%f4 ,%f10
	mulx	%l5,%l3,%l2
	sub	%l7,0x65f,%l5
	sub	%l4,-0x0eb,%l1
	fmuls	%f7 ,%f11,%f15
	umul	%l3,-0xab9,%l5
	fcmps	%fcc0,%f1 ,%f3 
	jmpl	%o7,%g0
	andn	%l7,0x2cf,%l1
p0_far_3_lem:
	fsubs	%f6 ,%f4 ,%f10
	mulx	%l5,%l3,%l2
	sub	%l7,0x65f,%l5
	sub	%l4,-0x0eb,%l1
	fmuls	%f7 ,%f11,%f15
	umul	%l3,-0xab9,%l5
	fcmps	%fcc0,%f1 ,%f3 
	jmpl	%o7,%g0
	andn	%l7,0x2cf,%l1
p0_far_3_he:
	fmuls	%f31,%f30,%f25
	sdivx	%l0,0xacb,%l1
	jmpl	%o7,%g0
	fmuls	%f16,%f26,%f19
p0_far_3_hem:
	fmuls	%f31,%f30,%f25
	sdivx	%l0,0xacb,%l1
	jmpl	%o7,%g0
	fmuls	%f16,%f26,%f19
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	or	%l5,%l1,%l1
	jmpl	%o7,%g0
	sub	%l5,-0xa2e,%l4
far3_b2b_l:
	add	%l0,-0xb99,%l2
	jmpl	%o7,%g0
	sdivx	%l0,%l2,%l1
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	fcmps	%fcc0,%f13,%f4 
	addc	%l6,-0xeeb,%l6
	subc	%l3,0xba9,%l5
	sdivx	%l5,%l2,%l5
	umul	%l1,%l1,%l6
	sdivx	%l4,0xfe8,%l3
	jmpl	%g6+8,%g0
	umul	%l2,0x37c,%l2
p0_call_0_le:
	retl
	orn	%l5,0xf61,%l7
p0_jmpl_0_lo:
	fcmps	%fcc0,%f13,%f4 
	addc	%l6,-0xeeb,%l6
	subc	%l3,0xba9,%l5
	sdivx	%l5,%l2,%l5
	umul	%l1,%l1,%l6
	sdivx	%l4,0xfe8,%l3
	jmpl	%g6+8,%g0
	umul	%l2,0x37c,%l2
p0_call_0_lo:
	retl
	orn	%l5,0xf61,%l7
p0_jmpl_0_he:
	jmpl	%g6+8,%g0
	stw	%l6,[%i3+0x01c]		! Mem[00000000100c141c]
p0_call_0_he:
	and	%l0,%l5,%l3
	fdivs	%f24,%f25,%f31
	umul	%l5,-0xdd9,%l7
	retl
	or	%l1,0xe19,%l6
p0_jmpl_0_ho:
	jmpl	%g6+8,%g0
	stw	%l6,[%o3+0x01c]		! Mem[00000000100c141c]
p0_call_0_ho:
	and	%l0,%l5,%l3
	fdivs	%f24,%f25,%f31
	umul	%l5,-0xdd9,%l7
	retl
	or	%l1,0xe19,%l6
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	subc	%l3,0x6f7,%l1
	or	%l6,0x2f5,%l6
	orn	%l2,-0x296,%l4
	jmpl	%g6+8,%g0
	smul	%l4,0xadd,%l3
p0_call_1_le:
	retl
	sub	%l0,%l0,%l3
p0_jmpl_1_lo:
	subc	%l3,0x6f7,%l1
	or	%l6,0x2f5,%l6
	orn	%l2,-0x296,%l4
	jmpl	%g6+8,%g0
	smul	%l4,0xadd,%l3
p0_call_1_lo:
	retl
	sub	%l0,%l0,%l3
p0_jmpl_1_he:
	ldsh	[%i3+0x00c],%l6		! Mem[00000000100c140c]
	orn	%l6,%l5,%l4
	andn	%l2,0xc99,%l7
	smul	%l3,-0x5ca,%l3
	fdivs	%f24,%f20,%f31
	jmpl	%g6+8,%g0
	sdivx	%l2,%l7,%l0
p0_call_1_he:
	xnor	%l4,0xd23,%l3
	fstod	%f17,%f26
	subc	%l5,%l1,%l5
	retl
	sdivx	%l7,%l1,%l0
p0_jmpl_1_ho:
	ldsh	[%o3+0x00c],%l6		! Mem[00000000100c140c]
	orn	%l6,%l5,%l4
	andn	%l2,0xc99,%l7
	smul	%l3,-0x5ca,%l3
	fdivs	%f24,%f20,%f31
	jmpl	%g6+8,%g0
	sdivx	%l2,%l7,%l0
p0_call_1_ho:
	xnor	%l4,0xd23,%l3
	fstod	%f17,%f26
	subc	%l5,%l1,%l5
	retl
	sdivx	%l7,%l1,%l0
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	smul	%l3,%l0,%l5
	jmpl	%g6+8,%g0
	addc	%l7,-0x398,%l1
p0_call_2_le:
	ldsw	[%i3+0x02c],%l5		! Mem[00000000100c142c]
	add	%l4,-0x993,%l3
	orn	%l3,0xcca,%l7
	swap	[%i4+0x010],%l7		! Mem[0000000010101410]
	fmuls	%f9 ,%f10,%f7 
	fdivs	%f4 ,%f14,%f10
	retl
	or	%l7,%l7,%l7
p0_jmpl_2_lo:
	smul	%l3,%l0,%l5
	jmpl	%g6+8,%g0
	addc	%l7,-0x398,%l1
p0_call_2_lo:
	ldsw	[%o3+0x02c],%l5		! Mem[00000000100c142c]
	add	%l4,-0x993,%l3
	orn	%l3,0xcca,%l7
	swap	[%o4+0x010],%l7		! Mem[0000000010101410]
	fmuls	%f9 ,%f10,%f7 
	fdivs	%f4 ,%f14,%f10
	retl
	or	%l7,%l7,%l7
p0_jmpl_2_he:
	fcmps	%fcc1,%f22,%f24
	mulx	%l7,0x0fc,%l4
	ldx	[%i5+0x010],%l0		! Mem[0000000010141410]
	jmpl	%g6+8,%g0
	orn	%l7,%l4,%l3
p0_call_2_he:
	subc	%l4,-0x65d,%l2
	fsubs	%f18,%f24,%f26
	smul	%l2,0xd54,%l2
	fdivs	%f16,%f16,%f16
	sub	%l2,%l3,%l0
	udivx	%l3,0x8e2,%l6
	retl
	or	%l0,%l5,%l5
p0_jmpl_2_ho:
	fcmps	%fcc1,%f22,%f24
	mulx	%l7,0x0fc,%l4
	ldx	[%o5+0x010],%l0		! Mem[0000000010141410]
	jmpl	%g6+8,%g0
	orn	%l7,%l4,%l3
p0_call_2_ho:
	subc	%l4,-0x65d,%l2
	fsubs	%f18,%f24,%f26
	smul	%l2,0xd54,%l2
	fdivs	%f16,%f16,%f16
	sub	%l2,%l3,%l0
	udivx	%l3,0x8e2,%l6
	retl
	or	%l0,%l5,%l5
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	or	%l5,%l5,%l0
	subc	%l4,-0x92c,%l3
	xnor	%l6,0x5df,%l5
	jmpl	%g6+8,%g0
	fdtos	%f2 ,%f10
p0_call_3_le:
	xnor	%l5,-0x63d,%l7
	orn	%l0,-0x357,%l4
	fcmps	%fcc2,%f13,%f9 
	retl
	xnor	%l7,-0xb19,%l1
p0_jmpl_3_lo:
	or	%l5,%l5,%l0
	subc	%l4,-0x92c,%l3
	xnor	%l6,0x5df,%l5
	jmpl	%g6+8,%g0
	fdtos	%f2 ,%f10
p0_call_3_lo:
	xnor	%l5,-0x63d,%l7
	orn	%l0,-0x357,%l4
	fcmps	%fcc2,%f13,%f9 
	retl
	xnor	%l7,-0xb19,%l1
p0_jmpl_3_he:
	fitos	%f31,%f18
	and	%l1,-0xa07,%l6
	sub	%l2,%l3,%l2
	fsubs	%f20,%f24,%f19
	jmpl	%g6+8,%g0
	fmuls	%f29,%f28,%f29
p0_call_3_he:
	std	%f20,[%i0+0x010]	! Mem[0000000010001410]
	smul	%l6,-0x2aa,%l5
	fsubs	%f17,%f16,%f30
	xor	%l1,%l4,%l3
	or	%l1,0x9fc,%l7
	retl
	addc	%l0,%l4,%l4
p0_jmpl_3_ho:
	fitos	%f31,%f18
	and	%l1,-0xa07,%l6
	sub	%l2,%l3,%l2
	fsubs	%f20,%f24,%f19
	jmpl	%g6+8,%g0
	fmuls	%f29,%f28,%f29
p0_call_3_ho:
	std	%f20,[%o0+0x010]	! Mem[0000000010001410]
	smul	%l6,-0x2aa,%l5
	fsubs	%f17,%f16,%f30
	xor	%l1,%l4,%l3
	or	%l1,0x9fc,%l7
	retl
	addc	%l0,%l4,%l4
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
	.word	0x3e9a7f3c,0x1f8e6e5e		! Init value for %l0
	.word	0x2fae5858,0x2c0f9ff4		! Init value for %l1
	.word	0x69e0a4b0,0x053f74b2		! Init value for %l2
	.word	0xdfac614a,0xc2fa1044		! Init value for %l3
	.word	0x59045e98,0x5c7e2726		! Init value for %l4
	.word	0xe2681969,0xc21f80d7		! Init value for %l5
	.word	0x7c476ebe,0x03647cfd		! Init value for %l6
	.word	0xdead2252,0x36da1794		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x4640482c,0x1b89d9d7		! Init value for %f0 
	.word	0xdd8dd265,0x10398246		! Init value for %f2 
	.word	0xc0224344,0x5ca1977b		! Init value for %f4 
	.word	0xba80af0c,0xc28f756e		! Init value for %f6 
	.word	0x654e9191,0xade7ca5f		! Init value for %f8 
	.word	0xf5678abb,0x4704f312		! Init value for %f10
	.word	0xdf0239a8,0x4cef418d		! Init value for %f12
	.word	0xa014395d,0xf5419702		! Init value for %f14
	.word	0x23bd08f9,0x38efb2ea		! Init value for %f16
	.word	0x4e438604,0xf9e63498		! Init value for %f18
	.word	0xa234496c,0xca6b4ffb		! Init value for %f20
	.word	0x78f87cd2,0x34874531		! Init value for %f22
	.word	0x014e67ba,0xcd9c8014		! Init value for %f24
	.word	0xf272538c,0x5ab72769		! Init value for %f26
	.word	0x3f0a0310,0xb5cb3fee		! Init value for %f28
	.word	0xec9a48e7,0x2561a4d7		! Init value for %f30
	.word	0x9f73204a,0x9c8d1b1f		! Init value for %f32
	.word	0x4ca24452,0xb1dfe6d6		! Init value for %f34
	.word	0x71a0faaa,0x3dcfe597		! Init value for %f36
	.word	0xc387ed9b,0xc9a2d6bf		! Init value for %f38
	.word	0x7aa68ef9,0x939b080b		! Init value for %f40
	.word	0x629e1cfa,0x2a8f08f9		! Init value for %f42
	.word	0xebf07fca,0xd0aad178		! Init value for %f44
	.word	0x35d043b8,0xe2798f12		! Init value for %f46
	.word	0xff1e5930,0x4c540e71
	.word	0xb2058848,0xe87939e1
	.word	0x3bbe103a,0xa74fb1af
	.word	0xd309ba00,0x1c9dc78b
	.word	0x1a969362,0x354de8be
	.word	0x4cce756a,0x54f09c67
	.word	0x1d32161f,0x0da82aa6
	.word	0x4826ee4e,0xc10e77fa
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
	.word	0xffffffff,0xffffff91
	.word	0x00000000,0x00000000
	.word	0x00000000,0x2ef3f120
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000f3
	.word	0x00000000,0x000000ff
	.word	0x00000000,0xffff0000
p0_expected_fp_regs:
	.word	0xaeff0000,0x69ffff64
	.word	0xd0d02310,0x036e77e0
	.word	0x2ef3f120,0x00000000
	.word	0x69ffff64,0xf3d436ff
	.word	0xc3d757ff,0x00000000
	.word	0xffd436ff,0x00000000
	.word	0x7d7d0000,0xc5a5f115
	.word	0x00000000,0x0000dd89
	.word	0x44100000,0xf3ff75ff
	.word	0x00000000,0x00000010
	.word	0x0e30509a,0x00000000
	.word	0x9673005a,0xa1000000
	.word	0xffff0052,0xff16658b
	.word	0xa15a0000,0x20f1f32e
	.word	0xff000000,0x000000ff
	.word	0xff0000f5,0xaeffffff
	.word	0x00000009,0x00000000		! %fsr = 0000000900000000
p0_local0_expect:
	.word	0x01000000,0x00001044
	.word	0x01000000,0xff000000
	.word	0x00000000,0x9a50300e
	.word	0x000000a1,0x5a007396
	.word	0x8b6516ff,0x2c3b7d7d
	.word	0x2ef3f120,0x00005aa1
	.word	0xffffffff,0xd0d0ffff
	.word	0xffffffae,0x0000002c
p0_local0_sec_expect:
	.word	0x64ffff69,0x0000ffae
	.word	0xe0776e03,0x1023d0d0
	.word	0x00000000,0x20f1f32e
	.word	0xff36d4f3,0x64ffff69
	.word	0x00000000,0xff57d7c3
	.word	0x00000000,0xff36d4ff
	.word	0x15f1a5c5,0x00007d7d
	.word	0x89dd0000,0x00000000
p0_local1_expect:
	.word	0x20f1f32e,0x00000000
	.word	0xd0d00000,0x00000000
	.word	0xffffffff,0x7d7d0000
	.word	0xd0d02310,0x036e77e0
	.word	0x00000000,0xa15a0000
	.word	0x70114fed,0x30a6b062
	.word	0xd0d02310,0x036e77e0
	.word	0x9495b8c3,0xe7b4a6bd
p0_local1_sec_expect:
	.word	0x1dfbd0f5,0xffffffae
	.word	0xff000000,0x1dfbd0f5
	.word	0x00000000,0xff36d4ff
	.word	0x268d3596,0xf3d436ff
	.word	0x7b97a15c,0x6f4004ff
	.word	0xf5d0fb1d,0x5e7e7ede
	.word	0xff000000,0x24e6c1e8
	.word	0xffaa7237,0x9fa033c6
p0_local2_expect:
	.word	0x00000000,0x00000091
	.word	0x005a0000,0x76ffffff
	.word	0x000000ff,0x00000000
	.word	0x9a50300e,0xba4f7588
	.word	0x00000000,0x7dff0000
	.word	0x00001f57,0x6f4004d8
	.word	0x7cffb22d,0xbac82067
	.word	0xff0000f5,0x00005ca1
p0_local2_sec_expect:
	.word	0xff86f626,0x00000000
	.word	0xffd436ff,0x00000000
	.word	0x96002310,0xffff8a44
	.word	0x00000000,0x00000010
	.word	0x44100000,0x6f4004ff
	.word	0x20f1f32e,0xc5a5f115
	.word	0x43b5f1a5,0xc7441000
	.word	0xa15a0000,0x00000000
p0_local3_expect:
	.word	0xaeff0000,0x69ffff64
	.word	0x00000000,0x1023d0d0
	.word	0xd0d0ffff,0x5a007396
	.word	0x000000ff,0xf3d436ff
	.word	0xc3d757ff,0x26a3ee55
	.word	0x0000a15c,0x00000000
	.word	0x7d7d0000,0xc5a5f115
	.word	0x00000000,0x0000dd89
p0_local3_sec_expect:
	.word	0x00000054,0x00000000
	.word	0xa15a0000,0x20f1f32e
	.word	0xe6d6dc1f,0x000000ff
	.word	0x8ff54239,0x8a5e64bd
	.word	0xbb000000,0x00000000
	.word	0x62b0a630,0xed4f1170
	.word	0x15f1a5c5,0x2ef3f120
	.word	0xbda6b4e7,0xc3b89594
p0_local4_expect:
	.word	0xff23d0d0,0xf3ff75a1
	.word	0xff000000,0x00005aa1
	.word	0xffffffff,0x7d7d0000
	.word	0x10000000,0x00000000
	.word	0xff000000,0x000000ff
	.word	0x15f1a5c5,0x2ef3f120
	.word	0x00000000,0xa5f1b543
	.word	0x8a5e64bd,0x00005aa1
p0_local4_sec_expect:
	.word	0x0e30509a,0xf3d436ff
	.word	0x00000000,0x000000ff
	.word	0x1fdcd6e6,0x00000000
	.word	0xac11b850,0x06a8b600
	.word	0xe4878c44,0x17319675
	.word	0x3db3396c,0x53a9c980
	.word	0x7067e9a9,0x955f7ceb
	.word	0x99189e88,0x9e6920bc
p0_local5_expect:
	.word	0x00000000,0xff36d4ff
	.word	0xff5a0000,0xffffffe6
	.word	0x00000010,0xf3ff75ff
	.word	0x1faa00ac,0x1b00ffdd
	.word	0x7d7d3b2c,0xff16658b
	.word	0xffcf2554,0x00aeff7c
	.word	0x00005aa1,0x939b8360
	.word	0x5a367396,0x64dcffe6
p0_local5_sec_expect:
	.word	0x5aa164bd,0x00005aa1
	.word	0xaeffffff,0xd0d02310
	.word	0xd0d0ffff,0x00000000
	.word	0x1062a465,0xb92ab835
	.word	0x46375da6,0x265aff0a
	.word	0xf72db4ac,0x935ea4f9
	.word	0x3e00e1d6,0xcebfda01
	.word	0x2ca1722d,0x891eac02
p0_local6_expect:
	.word	0xff000000,0x0000ffff
	.word	0x00000000,0x9a50300e
	.word	0xffffffff,0x000000f3
	.word	0xffff0000,0x00000010
	.word	0x44100000,0x000000f3
	.word	0xf5d0fb1d,0x5e7e7ede
	.word	0x15f1a5c7,0x44100000
	.word	0xa15a0000,0x00000000
p0_local6_sec_expect:
	.word	0xff000000,0xc1371240
	.word	0xa15a0000,0x20f1f32e
	.word	0xff73cfff,0xffffffff
	.word	0xb8d681a9,0x6f4004ff
	.word	0xa5a0bba2,0x41939a60
	.word	0x2dd5d8f9,0x96358d26
	.word	0x4c28dc6a,0x271ef5b5
	.word	0xff9717d5,0x98e5a2bf
share0_expect:
	.word	0x5a528819,0xa3030399
	.word	0x68a22cb6,0x0eb90485
	.word	0x1fb8a583,0xae6bfafc
	.word	0x260925ff,0x6e8e3eaa
	.word	0x55807531,0x5a32786b
	.word	0xc297b2c0,0xe81a827b
	.word	0x953f103e,0xd7c32df2
	.word	0x61441bdf,0x6fad8b3b
share1_expect:
	.word	0xff9ac3ca,0x374e00aa
	.word	0x694292e3,0xe3e3b1ce
	.word	0x16e0af08,0x8e89d632
	.word	0x1439bfb4,0x74f11ea8
	.word	0x0316a567,0x70dc2130
	.word	0xba59a625,0x444d8e72
	.word	0xe6bcf87c,0xbee3e477
	.word	0x5be9f90c,0x9fdaa5b4
	.word	0x5affbf87,0xb8090156
	.word	0x9fbf602d,0xdc29cbb0
	.word	0x3ca6ce6f,0x9703f93c
	.word	0x1289dd9f,0x89a99409
	.word	0xc74db418,0x4e26662e
	.word	0x002dec24,0x046517e0
	.word	0x06044324,0x249b161c
	.word	0x77c3ae0b,0x478f72a6
share2_expect:
	.word	0xff00fcae,0x0b4956fd
	.word	0x87b6cd61,0x575fe430
	.word	0x7ef4b550,0xc74b2f73
	.word	0x0320e851,0x218e2295
	.word	0x202c6675,0x95d2ae46
	.word	0x80025903,0x4e8926bb
	.word	0x7e3b623e,0x48643457
	.word	0x7e4199a8,0x7ce6cf9c
share3_expect:
	.word	0xffffb05a,0x1a8060f2
	.word	0x40d70906,0x4798ff2b
	.word	0x88215eaf,0x359018c5
	.word	0x488475db,0xcdf5bbc9
	.word	0xa99bac3e,0x389719ea
	.word	0x6cb63095,0x20e99569
	.word	0x531eec9d,0xe563a6bd
	.word	0x1b2ceb7e,0xc7a0a13b
	.word	0x709c7f92,0x114c7eb3
	.word	0x05d04470,0x85ca9b6f
	.word	0xd0f2cf3d,0x8e175b7f
	.word	0x43cd90d0,0x1e8e02e8
	.word	0xdaed4897,0x300420f0
	.word	0x10757ff8,0xbac61ea0
	.word	0x9911a27b,0x2f69bcfa
	.word	0x76a9b077,0x444d25f2
	.word	0x15ff0203,0xe5a0ea43
	.word	0x2345baa4,0x96ab6c12
	.word	0xcffbab67,0x89240a79
	.word	0x17625059,0x867bb106
	.word	0x4e41f634,0x631690fd
	.word	0xdf6469b0,0x614500e2
	.word	0xca5655fb,0x36799205
	.word	0xa31b1db3,0x5f075d3d
	.word	0xff6adddc,0x5d98a5aa
	.word	0x240c9e52,0x6ad43601
	.word	0x81a4db6e,0xcf92d3f1
	.word	0x39966afc,0x738d6c18
	.word	0xf9cb738e,0x32c5fe5d
	.word	0x0c1a0a92,0x56176a8a
	.word	0x7287af7d,0x9debf401
	.word	0x3e7aff06,0xe75f6e66
	.word	0xdd89a03e,0xe6e27e03
	.word	0x8079294d,0x12ef38ea
	.word	0x675fdc3f,0xf93c55e2
	.word	0x70a03d93,0x8a3c388b
	.word	0x4de01aaf,0x4636db00
	.word	0x1e0cb549,0x7f1a5090
	.word	0x4c9f1c19,0xc23c2476
	.word	0x93f34a8f,0xaab60181
	.word	0xff033eed,0xf3c05c3d
	.word	0x55a53cc9,0xd9fef715
	.word	0xf167cb44,0xd6238283
	.word	0x49edb332,0xd96ff079
	.word	0x17fc00d7,0x3c169f63
	.word	0x7d159c83,0x923c73a6
	.word	0x19e9ca44,0xe8ecd0bb
	.word	0x0b5d5679,0xc7d2cea0
	.word	0x662d8f81,0x99e491c0
	.word	0x433bf246,0xaa97f712
	.word	0x93d36dcc,0x9a25a821
	.word	0x20686983,0x25c9fd80
	.word	0x828cff73,0xed83e55b
	.word	0xb2fb1bd7,0x8c3ad5b2
	.word	0x5b88607e,0x32eb9baf
	.word	0x4e453c8a,0xf0f1fb7d
	.word	0xf9d8186d,0x7a2503d5
	.word	0xdabcc6d2,0x5f155dbd
	.word	0xcf16afdc,0x5ed6987d
	.word	0xcc282bf9,0x1ece121a
	.word	0x664cb8c1,0x94652e03
	.word	0x4ca7daf8,0x8b64e793
	.word	0xdc098d23,0xe09d500e
	.word	0xd59fdf32,0x87eb1a98
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
	.word	0x656a1cf8,0x52cc586d
	.word	0x00000000,0x00000002
	.word	0x879a7a87,0x8eba310f
	.word	0x00000000,0x00000003
	.word	0x7dd4f027,0xe4af4e15
	.word	0x00000000,0x00000004
	.word	0x10864c28,0x394b2596
	.word	0x00000000,0x00000005
	.word	0xcfbafe78,0x592365e9
	.word	0x00000000,0x00000006
	.word	0x1a47e11f,0x820a43aa
	.word	0x00000000,0x00000007
	.word	0xdc4dda3f,0xb5c2f5ee
	.word	0x00000000,0x00000008
	.word	0x43680af7,0xa46aee7f
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
	.word	0x68f66f14,0xf348754f,0x3ef1ce75,0xb731bac8
	.word	0x01cdf0ad,0xe6225fe8,0x6c4a7a81,0xc5f9822a
	.word	0x21ae8624,0x4d7df1f7,0xd1e46d6e,0x717feadd
	.word	0x20f1f32e,0x7f2178de,0x760826f2,0xcfd7dfe2
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
	.word	0xc7e000e7,0xe38b5f55,0x9908fa61,0x45266c56
	.word	0x5abc2c7d,0x467a8b01,0x5e9582e7,0xe722af4f
	.word	0x49f867e6,0x25e836ff,0xedd0fac2,0x5f789cf4
	.word	0xa6203998,0x0f7b9ea9,0x0a6907de,0x230654b0
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
	.word	0x8b50c8bd,0x812b5a21,0x5364d642,0xc884eccd
	.word	0x93b7ddb6,0x59b5289d,0x83f65f9b,0x0ec8d10a
	.word	0xc57ad1f4,0xc5a5f115,0x64266065,0x433910a6
	.word	0x56ec41dc,0xb1eb9628,0xf3d4369b,0x81eac8df
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
	.word	0x7011a7de,0xc3ad8ff6,0xb879c0d8,0x896c7900
	.word	0x10be99b3,0x775b8d0d,0xbd645e8a,0x3942f58f
	.word	0xb3c329e0,0xf249c7b4,0x70114fed,0x30a6b062
	.word	0xbb53fa0a,0xe93043a3,0x9495b8c3,0xe7b4a6bd
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
	.word	0x2b4a6d03,0xa2886d21,0x642c15d8,0x1ec1390a
	.word	0xb83c117f,0x82b12959,0x7cdb760e,0xd14f7588
	.word	0x0dfe930c,0x7d54a593,0x559e1f57,0xbe19cd23
	.word	0xcd850fa0,0x36412067,0xd08d29e9,0xdee7b124
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
	.word	0xacb96f19,0x378e9c67,0x97268467,0x0450b61c
	.word	0x68ce0969,0x8421db70,0xa097483d,0x1112cd26
	.word	0xb5c0ef34,0x7abfa762,0x9b5f80d0,0xbb602a8e
	.word	0x6f3b3ccc,0x035f3bd4,0xb1be10da,0x35aafc01
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
	.word	0xd924827e,0x69e04f64,0x0a50fdba,0xb1d3b4cc
	.word	0x0d92c255,0x9168047c,0x87d772b4,0xd9e6cc5b
	.word	0xc3d7577c,0x26a3ee55,0x95ddcdc3,0xf8d32cbd
	.word	0x5aa1d778,0x2864c544,0x64eb7f29,0xd112ea86
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
	.word	0xd8ffa30e,0x6dcbdaae,0x0be2d64b,0x4c1725ec
	.word	0xc005bb17,0x5f291d33,0x515769ab,0xfeb406d4
	.word	0x9fd31c6d,0x4636b3f4,0x77d8168c,0x5bab75c0
	.word	0x96afd2a2,0x6b2d7cb8,0x2d34acca,0xac9fdb73
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
	.word	0x9c99ede9,0x939b8360,0x83cbd3bc,0x13132df6
	.word	0xeab3d2f5,0x843fd55e,0x6f4004d8,0x136a9ee8
	.word	0x2513e0dc,0xe2a6b9b6,0x7cceb22d,0x1c255eee
	.word	0xa266c8ba,0x2430509a,0x14f78a44,0xd0d0237c
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
	.word	0x672ffc4f,0x0cdc7843,0xaac60a8a,0x22d9f5de
	.word	0xa74cbf22,0xc1371240,0xac11b850,0x06a8b600
	.word	0xe4878c44,0x17319675,0x3db3396c,0x53a9c980
	.word	0x7067e9a9,0x955f7ceb,0x99189e88,0x9e6920bc
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
	.word	0x83a94f65,0xc9017463,0xe4f00438,0x62763c8e
	.word	0x98e5a2bf,0x414bcdf5,0x3249f4f6,0xa38d321b
	.word	0x7d7d3b2c,0x0b16658b,0xeccf2554,0x5e9c2100
	.word	0x2cd42806,0xe6e736ac,0x26f66bb3,0x1fdcd6e6
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
	.word	0xa6108027,0xf1a5fe67,0xb1a7f60c,0x33ebd959
	.word	0x320f97c4,0x262da0fa,0x1062a465,0xb92ab835
	.word	0x46375da6,0x265aff0a,0xf72db4ac,0x935ea4f9
	.word	0x3e00e1d6,0xcebfda01,0x2ca1722d,0x891eac02
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
	.word	0x7e66c771,0xdcedf613,0x5a1bf45f,0xf1fc9e48
	.word	0xdd918a1b,0xac72aa1f,0xcbf57ad8,0xe0b97b92
	.word	0x1dfbd0f5,0x4e768fd9,0x475e0387,0x213850d4
	.word	0xd24e8037,0x9fa033c6,0x7a9b1b3d,0x47e365d8
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
	.word	0xc9339792,0x37c53cec,0xe9d308f8,0x189b0675
	.word	0xe8de8857,0x4094b994,0xb8d681a9,0xcc6573ad
	.word	0xa5a0bba2,0x41939a60,0x2dd5d8f9,0x96358d26
	.word	0x4c28dc6a,0x271ef5b5,0x8b9717d5,0x9b280e76
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
	.word	0xe2678819,0xa3030399,0x68a22cb6,0x0eb90485
	.word	0x1fb8a583,0xae6bfafc,0x260925ff,0x6e8e3eaa
	.word	0x55807531,0x5a32786b,0xc297b2c0,0xe81a827b
	.word	0x953f103e,0xd7c32df2,0x61441bdf,0x6fad8b3b
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
	.word	0xb67bc3ca,0x374e00aa,0x694292e3,0xe3e3b1ce
	.word	0x16e0af08,0x8e89d632,0x1439bfb4,0x74f11ea8
	.word	0x0316a567,0x70dc2130,0xba59a625,0x444d8e72
	.word	0xe6bcf87c,0xbee3e477,0x5be9f90c,0x9fdaa5b4
	.word	0x91bbbf87,0xb8090156,0x9fbf602d,0xdc29cbb0
	.word	0x3ca6ce6f,0x9703f93c,0x1289dd9f,0x89a99409
	.word	0xc74db418,0x4e26662e,0x002dec24,0x046517e0
	.word	0x06044324,0x249b161c,0x77c3ae0b,0x478f72a6
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
	.word	0x3dcdfcae,0x0b4956fd,0x87b6cd61,0x575fe430
	.word	0x7ef4b550,0xc74b2f73,0x0320e851,0x218e2295
	.word	0x202c6675,0x95d2ae46,0x80025903,0x4e8926bb
	.word	0x7e3b623e,0x48643457,0x7e4199a8,0x7ce6cf9c
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
	.word	0x52fdb05a,0x1a8060f2,0x40d70906,0x4798ff2b
	.word	0x88215eaf,0x359018c5,0x488475db,0xcdf5bbc9
	.word	0xa99bac3e,0x389719ea,0x6cb63095,0x20e99569
	.word	0x531eec9d,0xe563a6bd,0x1b2ceb7e,0xc7a0a13b
	.word	0x189c7f92,0x114c7eb3,0x05d04470,0x85ca9b6f
	.word	0xd0f2cf3d,0x8e175b7f,0x43cd90d0,0x1e8e02e8
	.word	0xdaed4897,0x300420f0,0x10757ff8,0xbac61ea0
	.word	0x9911a27b,0x2f69bcfa,0x76a9b077,0x444d25f2
	.word	0x15e80203,0xe5a0ea43,0x2345baa4,0x96ab6c12
	.word	0xcffbab67,0x89240a79,0x17625059,0x867bb106
	.word	0x4e41f634,0x631690fd,0xdf6469b0,0x614500e2
	.word	0xca5655fb,0x36799205,0xa31b1db3,0x5f075d3d
	.word	0x616adddc,0x5d98a5aa,0x240c9e52,0x6ad43601
	.word	0x81a4db6e,0xcf92d3f1,0x39966afc,0x738d6c18
	.word	0xf9cb738e,0x32c5fe5d,0x0c1a0a92,0x56176a8a
	.word	0x7287af7d,0x9debf401,0x3e7aff06,0xe75f6e66
	.word	0xdd89a03e,0xe6e27e03,0x8079294d,0x12ef38ea
	.word	0x675fdc3f,0xf93c55e2,0x70a03d93,0x8a3c388b
	.word	0x4de01aaf,0x4636db00,0x1e0cb549,0x7f1a5090
	.word	0x4c9f1c19,0xc23c2476,0x93f34a8f,0xaab60181
	.word	0xc8033eed,0xf3c05c3d,0x55a53cc9,0xd9fef715
	.word	0xf167cb44,0xd6238283,0x49edb332,0xd96ff079
	.word	0x17fc00d7,0x3c169f63,0x7d159c83,0x923c73a6
	.word	0x19e9ca44,0xe8ecd0bb,0x0b5d5679,0xc7d2cea0
	.word	0x662d8f81,0x99e491c0,0x433bf246,0xaa97f712
	.word	0x93d36dcc,0x9a25a821,0x20686983,0x25c9fd80
	.word	0x828cff73,0xed83e55b,0xb2fb1bd7,0x8c3ad5b2
	.word	0x5b88607e,0x32eb9baf,0x4e453c8a,0xf0f1fb7d
	.word	0x1009186d,0x7a2503d5,0xdabcc6d2,0x5f155dbd
	.word	0xcf16afdc,0x5ed6987d,0xcc282bf9,0x1ece121a
	.word	0x664cb8c1,0x94652e03,0x4ca7daf8,0x8b64e793
	.word	0xdc098d23,0xe09d500e,0xd59fdf32,0x87eb1a98
share3_end:
