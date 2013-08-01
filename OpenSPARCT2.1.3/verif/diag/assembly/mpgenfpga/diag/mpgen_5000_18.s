/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_5000_18.s
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
!	1 Thread, 5000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_5000_18.s created on Mar 27, 2009 (14:45:39)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_5000_18 -p 1 -l 5000

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

p0_label_151:
!	Mem[0000000010141400] = 00000000, %l5 = 00000000000000f3
	ldswa	[%i5+%g0]0x80,%l5	! %l5 = 0000000000000000
!	%f14 = 00000000, %f31 = aeffffff
	fcmpes	%fcc3,%f14,%f31		! %fcc3 = 2
!	Mem[0000000010101430] = 00000000 a5f1b543, %l6 = 000000ff, %l7 = ffff0000
	ldd	[%i4+0x030],%l6		! %l6 = 0000000000000000 00000000a5f1b543
!	Mem[00000000201c0000] = 5a528819, %l2 = 000000002ef3f120
	lduh	[%o0+%g0],%l2		! %l2 = 0000000000005a52
!	Mem[0000000010081410] = 000000ff 00000000, %l0 = ffffff91, %l1 = 00000000
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 00000000000000ff 0000000000000000
!	%f22 = 9673005a, %f30 = ff0000f5, %f6  = 69ffff64
	fmuls	%f22,%f30,%f6 		! %f6  = 55f3022b
!	Mem[0000000010041410] = ffffffff, %l1 = 0000000000000000
	lduha	[%i1+%o5]0x88,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010041410] = ffffffff, %l5 = 0000000000000000
	ldsba	[%i1+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030081400] = 26f686ff, %l1 = 000000000000ffff
	lduba	[%i2+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 00000054, %l1 = 00000000000000ff
	swapa	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000054

p0_label_152:
!	%f2  = d0d02310 036e77e0, %l3 = ffffffffffffffff
!	Mem[0000000030141430] = 3e00e1d6cebfda01
	add	%i5,0x030,%g1
	stda	%f2,[%g1+%l3]ASI_PST16_S ! Mem[0000000030141430] = d0d02310036e77e0
!	%f16 = 44100000 f3ff75ff 00000000 00000010
!	%f20 = 0e30509a 00000000 9673005a a1000000
!	%f24 = ffff0052 ff16658b a15a0000 20f1f32e
!	%f28 = ff000000 000000ff ff0000f5 aeffffff
	stda	%f16,[%i3]ASI_BLK_SL	! Block Store to 00000000300c1400
!	%l6 = 0000000000000000, Mem[00000000201c0000] = 5a528819, %asi = 80
	stba	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00528819
!	%l2 = 00005a52, %l3 = ffffffff, Mem[0000000030081400] = ff86f626 00000000
	stda	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 00005a52 ffffffff
!	%l4 = 00000000, %l5 = ffffffff, Mem[0000000010041410] = ffffffff 00007d7d
	stda	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000 ffffffff
!	%l2 = 0000000000005a52, %l2 = 0000000000005a52, %l0 = 00000000000000ff
	udivx	%l2,%l2,%l0		! %l0 = 0000000000000001
!	Mem[0000000010141418] = 1faa00ac, %l0 = 0000000000000001, %asi = 80
	swapa	[%i5+0x018]%asi,%l0	! %l0 = 000000001faa00ac
!	Mem[0000000010041400] = 2ef3f120, %l0 = 000000001faa00ac
	swapa	[%i1+%g0]0x88,%l0	! %l0 = 000000002ef3f120
!	%f14 = 00000000 0000dd89, %l6 = 0000000000000000
!	Mem[00000000100c1408] = 000000001023d0d0
	add	%i3,0x008,%g1
	stda	%f14,[%g1+%l6]ASI_PST8_PL ! Mem[00000000100c1408] = 000000001023d0d0
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (30)
!	Mem[00000000100c1400] = 64ffff69 0000ffae, %l4 = 00000000, %l5 = ffffffff
	ldda	[%i3+%g0]0x88,%l4	! %l4 = 000000000000ffae 0000000064ffff69

p0_label_153:
!	Mem[0000000030081400] = 525a0000, %f1  = 69ffff64
	lda	[%i2+%g0]0x89,%f1 	! %f1 = 525a0000
!	Mem[0000000030181410] = ff73cfff, %l3 = ffffffffffffffff
	ldsha	[%i6+%o5]0x81,%l3	! %l3 = ffffffffffffff73
!	Mem[000000001004143c] = e7b4a6bd, %l3 = ffffffffffffff73
	ldswa	[%i1+0x03c]%asi,%l3	! %l3 = ffffffffe7b4a6bd
!	Mem[0000000030181408] = a15a0000, %l0 = 000000002ef3f120
	ldsba	[%i6+%o4]0x81,%l0	! %l0 = ffffffffffffffa1
!	Mem[0000000010181410] = ffffffff, %l2 = 0000000000005a52
	lduwa	[%i6+%o5]0x88,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000010101408] = ff000000, %l7 = 00000000a5f1b543
	lduba	[%i4+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%l2 = 00000000ffffffff, Mem[0000000030001408] = d0d02310036e77e0
	stxa	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000ffffffff
!	Mem[0000000010001400] = 01000000, %l0 = ffffffffffffffa1
	lduba	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000001
!	Mem[0000000010101410] = ffffffff7d7d0000, %f22 = 9673005a a1000000
	ldda	[%i4+%o5]0x80,%f22	! %f22 = ffffffff 7d7d0000
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffe7b4a6bd, Mem[0000000010001434] = d0d0ffff
	stw	%l3,[%i0+0x034]		! Mem[0000000010001434] = e7b4a6bd

p0_label_154:
!	%l6 = 0000000000000000, Mem[0000000030001400] = 69ffff64
	stha	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 69ff0000
!	%l1 = 0000000000000054, Mem[00000000300c1400] = ff75fff3
	stba	%l1,[%i3+%g0]0x81	! Mem[00000000300c1400] = 5475fff3
!	Mem[0000000030181408] = 00005aa1, %l7 = 00000000000000ff
	swapa	[%i6+%o4]0x89,%l7	! %l7 = 0000000000005aa1
!	Mem[00000000211c0000] = ff00fcae, %l2 = 00000000ffffffff
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 000000000000ff00
!	%l2 = 000000000000ff00, Mem[0000000010141410] = 00000010
	stha	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = ff000010
!	%l2 = 000000000000ff00, Mem[0000000010181400] = ff0000000000ffff
	stxa	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000000000ff00
!	Mem[0000000010041410] = 00000000, %l6 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000000
!	%f14 = 00000000 0000dd89, Mem[0000000010181410] = ffffffff 000000f3
	stda	%f14,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000 0000dd89
!	%l4 = 0000ffae, %l5 = 64ffff69, Mem[0000000030001408] = ffffffff 00000000
	stda	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000ffae 64ffff69
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 000000ff, %l1 = 0000000000000054
	lduwa	[%i2+%o5]0x80,%l1	! %l1 = 00000000000000ff

p0_label_155:
!	Mem[0000000010141424] = ff16658b, %l0 = 0000000000000001
	ldsw	[%i5+0x024],%l0		! %l0 = ffffffffff16658b
!	Mem[0000000010081410] = 000000ff, %l6 = 0000000000000000
	lduha	[%i2+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1400] = f3ff7554, %f10 = ffd436ff
	lda	[%i3+%g0]0x89,%f10	! %f10 = f3ff7554
!	Mem[0000000010001410] = 00000000, %l0 = ffffffffff16658b
	ldsha	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l3 = ffffffffe7b4a6bd
	ldsba	[%i1+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001418] = 000000a1, %l2 = 000000000000ff00
	lduwa	[%i0+0x018]%asi,%l2	! %l2 = 00000000000000a1
!	Mem[00000000300c1400] = 5475fff3, %l6 = 0000000000000000
	lduba	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000054
!	Mem[0000000030041408] = ff000000, %l3 = 0000000000000000
	lduba	[%i1+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041408] = 000000ff, %f27 = 20f1f32e
	lda	[%i1+%o4]0x89,%f27	! %f27 = 000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000005aa1, Mem[0000000010081408] = 00005a00
	stwa	%l7,[%i2+%o4]0x88	! Mem[0000000010081408] = 00005aa1

p0_label_156:
!	Mem[00000000100c1400] = aeff0000, %l4 = 000000000000ffae
	lduwa	[%i3+%g0]0x80,%l4	! %l4 = 00000000aeff0000
!	%f4  = 2ef3f120 00000000, Mem[0000000010181418] = ffff0000 00000010
	std	%f4 ,[%i6+0x018]	! Mem[0000000010181418] = 2ef3f120 00000000
!	Mem[0000000010101408] = ff000000, %l6 = 0000000000000054
	ldstuba	[%i4+0x008]%asi,%l6	! %l6 = 000000ff000000ff
!	%f2  = d0d02310, Mem[0000000030001400] = 0000ff69
	sta	%f2 ,[%i0+%g0]0x81	! Mem[0000000030001400] = d0d02310
!	%l1 = 00000000000000ff, Mem[0000000010141400] = 00000000
	stba	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff
!	%l7 = 0000000000005aa1, Mem[00000000100c1408] = 00000000
	stba	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000a1
!	Mem[0000000010181408] = 00000000, %l4 = 00000000aeff0000
	ldstub	[%i6+%o4],%l4		! %l4 = 00000000000000ff
!	%f0  = aeff0000 525a0000 d0d02310 036e77e0
!	%f4  = 2ef3f120 00000000 55f3022b f3d436ff
!	%f8  = c3d757ff 00000000 f3ff7554 00000000
!	%f12 = 7d7d0000 c5a5f115 00000000 0000dd89
	stda	%f0,[%i5]ASI_BLK_AIUP	! Block Store to 0000000010141400
!	%l1 = 00000000000000ff, Mem[0000000020800040] = 5affbf87
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040] = 00ffbf87
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000, %f26 = a15a0000
	lda	[%i0+%o5]0x88,%f26	! %f26 = 00000000

p0_label_157:
!	Mem[0000000030081408] = ffd436ff, %l6 = 00000000000000ff
	ldsba	[%i2+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	%l5 = 0000000064ffff69, %l1 = 00000000000000ff, %l5 = 0000000064ffff69
	or	%l5,%l1,%l5		! %l5 = 0000000064ffffff
!	Mem[0000000010081400] = 00000000, %l2 = 00000000000000a1
	ldsb	[%i2+0x001],%l2		! %l2 = 0000000000000000
!	Mem[0000000010101400] = ff23d0d0, %l0 = 0000000000000000
	lduha	[%i4+%g0]0x80,%l0	! %l0 = 000000000000ff23
!	Mem[00000000100c1410] = ffffd0d0, %l5 = 0000000064ffffff
	ldsha	[%i3+%o5]0x88,%l5	! %l5 = ffffffffffffd0d0
!	Mem[0000000030081410] = 96002310 ffff8a44, %l0 = 0000ff23, %l1 = 000000ff
	ldda	[%i2+%o5]0x81,%l0	! %l0 = 0000000096002310 00000000ffff8a44
!	Mem[0000000030181408] = ff000000, %l2 = 0000000000000000
	ldswa	[%i6+%o4]0x81,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010001410] = 00000000, %l3 = 00000000000000ff
	ldswa	[%i0+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141408] = ffffffae, %f18 = 00000000
	lda	[%i5+%o4]0x89,%f18	! %f18 = ffffffae
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000005aa1, Mem[000000001018140e] = 9a50300e, %asi = 80
	stha	%l7,[%i6+0x00e]%asi	! Mem[000000001018140c] = 9a505aa1

p0_label_158:
!	%f26 = 00000000, Mem[00000000100c1400] = aeff0000
	sta	%f26,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	%l5 = ffffffffffffd0d0, Mem[00000000100c1408] = a10000001023d0d0
	stxa	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffffffffffffd0d0
!	%f18 = ffffffae, Mem[0000000010181400] = 00000000
	sta	%f18,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffffae
!	%l2 = ffffffffff000000, Mem[0000000010141408] = d0d02310
	stwa	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = ff000000
!	%f27 = 000000ff, Mem[0000000010081400] = 00000000
	sta	%f27,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff
!	Mem[0000000010001404] = 00001044, %l1 = ffff8a44, %l2 = ff000000
	add	%i0,0x04,%g1
	casa	[%g1]0x80,%l1,%l2	! %l2 = 0000000000001044
!	%f24 = ffff0052 ff16658b, Mem[0000000010181410] = 00000000 0000dd89
	stda	%f24,[%i6+%o5]0x80	! Mem[0000000010181410] = ffff0052 ff16658b
!	Mem[0000000010081424] = 7dff0000, %l0 = 0000000096002310
	ldstub	[%i2+0x024],%l0		! %l0 = 0000007d000000ff
!	Mem[00000000201c0000] = 00528819, %l7 = 0000000000005aa1
	ldstub	[%o0+%g0],%l7		! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = d0d0ffffffffffff, %f24 = ffff0052 ff16658b
	ldda	[%i3+%o4]0x88,%f24	! %f24 = d0d0ffff ffffffff

p0_label_159:
!	Mem[0000000010081400] = 91000000 000000ff, %l0 = 0000007d, %l1 = ffff8a44
	ldda	[%i2+%g0]0x88,%l0	! %l0 = 00000000000000ff 0000000091000000
!	Mem[0000000010181408] = ff000000, %l6 = ffffffffffffffff
	ldsba	[%i6+%o4]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000300c1400] = 5475fff3, %f21 = 00000000
	lda	[%i3+%g0]0x81,%f21	! %f21 = 5475fff3
	membar	#Sync			! Added by membar checker (31)
!	Mem[0000000010141400] = 0000ffae, %l2 = 0000000000001044
	ldsba	[%i5+%g0]0x88,%l2	! %l2 = ffffffffffffffae
!	Mem[0000000030001408] = aeff0000, %l1 = 0000000091000000
	lduha	[%i0+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001428] = 2ef3f120 00005aa1, %l4 = 00000000, %l5 = ffffd0d0
	ldd	[%i0+0x028],%l4		! %l4 = 000000002ef3f120 0000000000005aa1
!	Mem[0000000030081408] = ff36d4ff, %l0 = 00000000000000ff
	lduba	[%i2+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181408] = 000000ff, %l6 = ffffffffffffffff
	lduba	[%i6+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101408] = 000000ff, %l5 = 0000000000005aa1
	lduba	[%i4+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f16 = 44100000 f3ff75ff ffffffae 00000010
!	%f20 = 0e30509a 5475fff3 ffffffff 7d7d0000
!	%f24 = d0d0ffff ffffffff 00000000 000000ff
!	%f28 = ff000000 000000ff ff0000f5 aeffffff
	stda	%f16,[%i6]ASI_BLK_S	! Block Store to 0000000030181400

p0_label_160:
!	%l4 = 000000002ef3f120, Mem[0000000020800000] = ff9ac3ca, %asi = 80
	stha	%l4,[%o1+0x000]%asi	! Mem[0000000020800000] = f120c3ca
!	%l7 = 0000000000000000, %l1 = 0000000000000000, %l5 = 00000000000000ff
	and	%l7,%l1,%l5		! %l5 = 0000000000000000
!	Mem[0000000030041408] = 000000ff, %l1 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030081400] = 525a0000, %l1 = 00000000000000ff
	swapa	[%i2+%g0]0x89,%l1	! %l1 = 00000000525a0000
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000030101400] = 9a50300e ff36d4f3
	stda	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff 00000000
!	%l2 = ffffffffffffffae, Mem[0000000030181408] = ffffffae00000010
	stxa	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffffffffffffae
!	Mem[00000000211c0001] = ff00fcae, %l0 = 00000000000000ff
	ldstub	[%o2+0x001],%l0		! %l0 = 00000000000000ff
!	%l4 = 000000002ef3f120, Mem[0000000010141400] = aeff0000525a0000
	stxa	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000002ef3f120
!	Mem[0000000010081414] = 00000000, %f14 = 00000000
	ld	[%i2+0x014],%f14	! %f14 = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 1fdcd6e6, %l3 = 0000000000000000
	lduha	[%i4+%o5]0x81,%l3	! %l3 = 0000000000001fdc

p0_label_161:
!	Mem[000000001014143c] = 0000dd89, %l1 = 00000000525a0000
	lduw	[%i5+0x03c],%l1		! %l1 = 000000000000dd89
!	Mem[0000000010041408] = d0d00000, %l2 = ffffffffffffffae
	lduwa	[%i1+%o4]0x80,%l2	! %l2 = 00000000d0d00000
!	Mem[0000000010141408] = ff000000, %l2 = 00000000d0d00000
	lduba	[%i5+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081408] = a15a0000, %l4 = 000000002ef3f120
	lduba	[%i2+%o4]0x80,%l4	! %l4 = 00000000000000a1
!	Mem[0000000010001400] = 00000001, %l2 = 00000000000000ff
	lduwa	[%i0+%g0]0x88,%l2	! %l2 = 0000000000000001
!	Mem[0000000030041408] = ff000000, %l6 = 00000000000000ff
	lduba	[%i1+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141438] = 00000000, %l0 = 0000000000000000
	ldsb	[%i5+0x039],%l0		! %l0 = 0000000000000000
!	Mem[00000000100c1420] = c3d757ff26a3ee55, %l0 = 0000000000000000
	ldxa	[%i3+0x020]%asi,%l0	! %l0 = c3d757ff26a3ee55
!	Mem[0000000030101410] = e6d6dc1f, %l1 = 000000000000dd89
	lduha	[%i4+%o5]0x89,%l1	! %l1 = 000000000000dc1f
!	Starting 10 instruction Store Burst
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000010101430] = 00000000 a5f1b543
	std	%l6,[%i4+0x030]		! Mem[0000000010101430] = 000000ff 00000000

p0_label_162:
!	Mem[0000000010001400] = 00000001, %l4 = 00000000000000a1
	swapa	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000001
!	%l4 = 0000000000000001, Mem[0000000010141410] = 20f1f32e
	stwa	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000001
!	%l4 = 0000000000000001, Mem[0000000030181400] = 00001044
	stha	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000001
!	Mem[0000000030101410] = e6d6dc1f, %l1 = 000000000000dc1f
	swapa	[%i4+%o5]0x89,%l1	! %l1 = 00000000e6d6dc1f
!	Mem[0000000030081400] = 000000ff, %l0 = c3d757ff26a3ee55
	ldstuba	[%i2+%g0]0x89,%l0	! %l0 = 000000ff000000ff
!	%f14 = 00000000 0000dd89, Mem[0000000010181408] = ff000000 9a505aa1
	stda	%f14,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 0000dd89
!	%l5 = 0000000000000000, Mem[0000000010181418] = 2ef3f12000000000
	stx	%l5,[%i6+0x018]		! Mem[0000000010181418] = 0000000000000000
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000010141418] = 55f3022b f3d436ff
	stda	%l6,[%i5+0x018]%asi	! Mem[0000000010141418] = 000000ff 00000000
!	Mem[00000000211c0000] = fffffcae, %l0 = 00000000000000ff
	ldstub	[%o2+%g0],%l0		! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ffffffae, %l3 = 0000000000001fdc
	ldswa	[%i5+%o4]0x89,%l3	! %l3 = ffffffffffffffae

p0_label_163:
!	Mem[0000000021800000] = ffffb05a, %l4 = 0000000000000001
	ldsba	[%o3+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001400] = a100000000001044, %f0  = aeff0000 525a0000
	ldda	[%i0+%g0]0x80,%f0 	! %f0  = a1000000 00001044
!	Mem[0000000030141410] = ffffd0d0, %l7 = 0000000000000000
	lduha	[%i5+%o5]0x89,%l7	! %l7 = 000000000000d0d0
!	Mem[0000000010101400] = ff23d0d0, %l3 = ffffffffffffffae
	ldsba	[%i4+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	%l1 = 00000000e6d6dc1f, imm = fffffffffffffc95, %l7 = 000000000000d0d0
	or	%l1,-0x36b,%l7		! %l7 = fffffffffffffc9f
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000010181410] = 8b6516ff 5200ffff, %l4 = ffffffff, %l5 = 00000000
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 000000005200ffff 000000008b6516ff
!	Mem[0000000030081410] = 96002310, %l0 = 00000000000000ff
	ldsha	[%i2+%o5]0x81,%l0	! %l0 = ffffffffffff9600
!	Mem[0000000030181408] = aeffffffffffffff, %l1 = 00000000e6d6dc1f
	ldxa	[%i6+%o4]0x89,%l1	! %l1 = aeffffffffffffff
!	Mem[0000000030181410] = f3ff75549a50300e, %l1 = aeffffffffffffff
	ldxa	[%i6+%o5]0x89,%l1	! %l1 = f3ff75549a50300e
!	Starting 10 instruction Store Burst
!	%f16 = 44100000 f3ff75ff, %l2 = 0000000000000001
!	Mem[0000000010041418] = d0d02310036e77e0
	add	%i1,0x018,%g1
	stda	%f16,[%g1+%l2]ASI_PST16_PL ! Mem[0000000010041418] = ff752310036e77e0

p0_label_164:
!	%f16 = 44100000 f3ff75ff ffffffae 00000010
!	%f20 = 0e30509a 5475fff3 ffffffff 7d7d0000
!	%f24 = d0d0ffff ffffffff 00000000 000000ff
!	%f28 = ff000000 000000ff ff0000f5 aeffffff
	stda	%f16,[%i3]ASI_BLK_AIUPL	! Block Store to 00000000100c1400
!	%f9  = 00000000, Mem[0000000010101400] = ff23d0d0
	sta	%f9 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	Mem[00000000300c1410] = 00000000, %l7 = fffffffffffffc9f
	swapa	[%i3+%o5]0x89,%l7	! %l7 = 0000000000000000
!	%l2 = 0000000000000001, Mem[000000001004141c] = 036e77e0, %asi = 80
	stwa	%l2,[%i1+0x01c]%asi	! Mem[000000001004141c] = 00000001
!	%l7 = 0000000000000000, Mem[0000000010041408] = d0d00000, %asi = 80
	stwa	%l7,[%i1+0x008]%asi	! Mem[0000000010041408] = 00000000
!	%l1 = f3ff75549a50300e, imm = 00000000000003ec, %l0 = ffffffffffff9600
	subc	%l1,0x3ec,%l0		! %l0 = f3ff75549a502c22
!	Mem[0000000010081404] = 00000091, %l7 = 00000000, %l7 = 00000000
	add	%i2,0x04,%g1
	casa	[%g1]0x80,%l7,%l7	! %l7 = 0000000000000091
!	%f10 = f3ff7554 00000000, %l3 = ffffffffffffffff
!	Mem[0000000010081408] = a15a000076ffffff
	add	%i2,0x008,%g1
	stda	%f10,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010081408] = 000000005475fff3
!	Mem[000000001004143c] = e7b4a6bd, %l6 = 000000ff, %l4 = 5200ffff
	add	%i1,0x3c,%g1
	casa	[%g1]0x80,%l6,%l4	! %l4 = 00000000e7b4a6bd
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00000000, %f9  = 00000000
	lda	[%i4+%g0]0x80,%f9 	! %f9 = 00000000

p0_label_165:
!	Mem[0000000010101400] = 00000000, %l7 = 0000000000000091
	ldswa	[%i4+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181408] = ffffffffffffffae, %l4 = 00000000e7b4a6bd
	ldxa	[%i6+%o4]0x81,%l4	! %l4 = ffffffffffffffae
!	Mem[0000000030001400] = 1023d0d0, %l1 = f3ff75549a50300e
	lduha	[%i0+%g0]0x89,%l1	! %l1 = 000000000000d0d0
!	Mem[0000000010141400] = 20f1f32e 00000000, %l0 = 9a502c22, %l1 = 0000d0d0
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 0000000000000000 0000000020f1f32e
!	Mem[0000000010141400] = 20f1f32e 00000000, %l4 = ffffffae, %l5 = 8b6516ff
	ldda	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000000 0000000020f1f32e
!	%l0 = 0000000000000000, imm = 00000000000009ec, %l1 = 0000000020f1f32e
	or	%l0,0x9ec,%l1		! %l1 = 00000000000009ec
!	Mem[0000000010001414] = 9a50300e, %l5 = 0000000020f1f32e
	ldsb	[%i0+0x014],%l5		! %l5 = ffffffffffffff9a
!	Mem[0000000010001404] = 00001044, %f13 = c5a5f115
	lda	[%i0+0x004]%asi,%f13	! %f13 = 00001044
	membar	#Sync			! Added by membar checker (33)
!	Mem[00000000100c1400] = ff75fff300001044, %f8  = c3d757ff 00000000
	ldd	[%i3+%g0],%f8 		! %f8  = ff75fff3 00001044
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000030081410] = 448affff10230096
	stxa	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000000000000000

p0_label_166:
!	%l2 = 0000000000000001, Mem[0000000010081419] = 9a50300e, %asi = 80
	stba	%l2,[%i2+0x019]%asi	! Mem[0000000010081418] = 9a01300e
!	%l0 = 0000000000000000, Mem[0000000010041400] = ac00aa1f
	stha	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000aa1f
!	%l1 = 00000000000009ec, Mem[0000000010141418] = 000000ff00000000, %asi = 80
	stxa	%l1,[%i5+0x018]%asi	! Mem[0000000010141418] = 00000000000009ec
!	%f10 = f3ff7554 00000000, %l7 = 0000000000000000
!	Mem[0000000010141430] = 7d7d0000c5a5f115
	add	%i5,0x030,%g1
	stda	%f10,[%g1+%l7]ASI_PST32_P ! Mem[0000000010141430] = 7d7d0000c5a5f115
!	Mem[0000000030001410] = 00000000, %l5 = ffffffffffffff9a
	swapa	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010041400] = 0000aa1f00000000
	stxa	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010101400] = 00000000
	stba	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	Mem[00000000300c1408] = 10000000, %l5 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l5	! %l5 = 0000000010000000
!	%l6 = 00000000000000ff, Mem[0000000030081408] = ffd436ff
	stha	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 00ff36ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ffffffff, %l4 = 0000000000000000
	ldswa	[%i4+%o5]0x88,%l4	! %l4 = ffffffffffffffff

p0_label_167:
!	Mem[0000000010141400] = 00000000, %f0  = a1000000
	lda	[%i5+%g0]0x88,%f0 	! %f0 = 00000000
!	Mem[0000000030041400] = f5d0fb1d, %f28 = ff000000
	lda	[%i1+%g0]0x89,%f28	! %f28 = f5d0fb1d
!	Mem[0000000030001408] = 0000ffae, %l0 = 0000000000000000
	ldsba	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101408] = ff00000000005aa1, %f28 = f5d0fb1d 000000ff
	ldda	[%i4+%o4]0x80,%f28	! %f28 = ff000000 00005aa1
!	Mem[0000000030041408] = 000000ff, %l2 = 0000000000000001
	ldswa	[%i1+%o4]0x89,%l2	! %l2 = 00000000000000ff
	membar	#Sync			! Added by membar checker (34)
!	Mem[0000000010041400] = 00000000 00000000 00000000 00000000
!	Mem[0000000010041410] = 00000000 ffffffff ff752310 00000001
!	Mem[0000000010041420] = 00000000 a15a0000 70114fed 30a6b062
!	Mem[0000000010041430] = d0d02310 036e77e0 9495b8c3 e7b4a6bd
	ldda	[%i1]ASI_BLK_P,%f0	! Block Load from 0000000010041400
!	Mem[0000000010101400] = a175fff300000000, %l1 = 00000000000009ec
	ldxa	[%i4+%g0]0x88,%l1	! %l1 = a175fff300000000
!	Mem[0000000030081400] = ffffffff 000000ff, %l2 = 000000ff, %l3 = ffffffff
	ldda	[%i2+%g0]0x89,%l2	! %l2 = 00000000000000ff 00000000ffffffff
!	Mem[0000000021800040] = 709c7f92, %l5 = 0000000010000000
	ldsb	[%o3+0x041],%l5		! %l5 = ffffffffffffff9c
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i1+%o5]0x80,%l7	! %l7 = 00000000000000ff

p0_label_168:
!	%l0 = 0000000000000000, Mem[0000000030041410] = 00000000
	stha	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	%f28 = ff000000 00005aa1, Mem[0000000010101400] = 00000000 a175fff3
	stda	%f28,[%i4+%g0]0x88	! Mem[0000000010101400] = ff000000 00005aa1
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000030181400] = 00000001 ff75fff3
	stda	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000 00000000
!	%f20 = 0e30509a 5475fff3, Mem[0000000030041410] = 00000000 ffd436ff
	stda	%f20,[%i1+%o5]0x89	! Mem[0000000030041410] = 0e30509a 5475fff3
!	%l6 = 00000000000000ff, Mem[0000000030001410] = ffffff9a
	stba	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = ffffffff
!	Mem[0000000010101410] = ffffffff, %l5 = ffffffffffffff9c
	ldstuba	[%i4+%o5]0x80,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030181410] = 0e30509a, %l6 = 00000000000000ff
	ldstuba	[%i6+%o5]0x81,%l6	! %l6 = 0000000e000000ff
!	%l4 = ffffffffffffffff, Mem[0000000010081400] = ff000000
	stba	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = ff000000
!	%l2 = 00000000000000ff, Mem[0000000021800101] = dd89a03e, %asi = 80
	stba	%l2,[%o3+0x101]%asi	! Mem[0000000021800100] = ddffa03e
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = a15a0000, %l5 = 00000000000000ff
	ldsba	[%i4+%g0]0x80,%l5	! %l5 = ffffffffffffffa1

p0_label_169:
!	Mem[0000000010001400] = a1000000 00001044, %l0 = 00000000, %l1 = 00000000
	ldda	[%i0+%g0]0x80,%l0	! %l0 = 00000000a1000000 0000000000001044
!	Mem[0000000030041410] = 5475fff3, %l1 = 0000000000001044
	lduha	[%i1+%o5]0x89,%l1	! %l1 = 000000000000fff3
!	Mem[00000000300c1400] = 5475fff300001044, %f22 = ffffffff 7d7d0000
	ldda	[%i3+%g0]0x81,%f22	! %f22 = 5475fff3 00001044
!	Mem[0000000010001410] = 00000000, %l3 = 00000000ffffffff
	ldsba	[%i0+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = ffffffae, %l5 = ffffffffffffffa1
	ldsha	[%i6+%g0]0x88,%l5	! %l5 = ffffffffffffffae
!	Mem[0000000030101408] = 00000000, %l3 = 0000000000000000
	ldsba	[%i4+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101410] = 00000000 0000dc1f, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i4+%o5]0x89,%l2	! %l2 = 000000000000dc1f 0000000000000000
!	Mem[0000000010181404] = 0000ff00, %l7 = 0000000000000000
	ldsb	[%i6+0x005],%l7		! %l7 = 0000000000000000
!	Mem[0000000030101410] = 1fdc000000000000, %l1 = 000000000000fff3
	ldxa	[%i4+%o5]0x81,%l1	! %l1 = 1fdc000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c142c] = 00000000, %l2 = 0000dc1f, %l5 = ffffffae
	add	%i3,0x2c,%g1
	casa	[%g1]0x80,%l2,%l5	! %l5 = 0000000000000000

p0_label_170:
!	%l4 = ffffffff, %l5 = 00000000, Mem[0000000030001410] = ffffffff 20f1f32e
	stda	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = ffffffff 00000000
!	Mem[0000000010081410] = 000000ff, %l0 = 00000000a1000000
	ldstuba	[%i2+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%f30 = ff0000f5 aeffffff, %l5 = 0000000000000000
!	Mem[0000000010001408] = 01000000ff000000
	add	%i0,0x008,%g1
	stda	%f30,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010001408] = 01000000ff000000
!	%l7 = 0000000000000000, Mem[00000000100c1410] = f3ff7554
	stha	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00007554
!	%l2 = 000000000000dc1f, imm = 0000000000000da8, %l7 = 0000000000000000
	sub	%l2,0xda8,%l7		! %l7 = 000000000000ce77
!	Mem[0000000030101408] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	%l7 = 000000000000ce77, Mem[00000000100c1438] = ffffffaef50000ff
	stx	%l7,[%i3+0x038]		! Mem[00000000100c1438] = 000000000000ce77
!	%f18 = ffffffae 00000010, Mem[0000000030181400] = 00000000 00000000
	stda	%f18,[%i6+%g0]0x81	! Mem[0000000030181400] = ffffffae 00000010
	membar	#Sync			! Added by membar checker (35)
!	%l1 = 1fdc000000000000, Mem[0000000010041400] = 00000000
	stha	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = aeff0000, %l6 = 000000000000000e
	ldswa	[%i0+%o4]0x89,%l6	! %l6 = ffffffffaeff0000

p0_label_171:
!	Mem[0000000010141410] = 00000001, %l2 = 000000000000dc1f
	ldsha	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000001
!	Mem[0000000010041400] = 00000000, %l4 = ffffffffffffffff
	ldsba	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l3 = 0000000000000000
	lduba	[%i6+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l5 = 0000000000000000
	lduba	[%i2+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0000] = ff528819, %l4 = 0000000000000000
	ldub	[%o0+0x001],%l4		! %l4 = 0000000000000052
!	Mem[0000000030081410] = 0000000000000000, %l1 = 1fdc000000000000
	ldxa	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000021800000] = ffffb05a, %l4 = 0000000000000052
	ldsb	[%o3+0x001],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010181408] = 89dd000000000000, %l4 = ffffffffffffffff
	ldxa	[%i6+%o4]0x88,%l4	! %l4 = 89dd000000000000
!	Mem[00000000100c1410] = 54750000, %l4 = 89dd000000000000
	ldswa	[%i3+%o5]0x88,%l4	! %l4 = 0000000054750000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 00000000, %l6 = ffffffffaeff0000
	swapa	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000000

p0_label_172:
!	%l3 = 0000000000000000, Mem[0000000030141408] = aeffffff
	stba	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = 00ffffff
!	%f0  = 00000000 00000000 00000000 00000000
!	%f4  = 00000000 ffffffff ff752310 00000001
!	%f8  = 00000000 a15a0000 70114fed 30a6b062
!	%f12 = d0d02310 036e77e0 9495b8c3 e7b4a6bd
	stda	%f0,[%i4]ASI_BLK_SL	! Block Store to 0000000030101400
!	%l2 = 0000000000000001, Mem[0000000010041400] = 00000000
	stwa	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000001
!	%f30 = ff0000f5, Mem[0000000030181400] = ffffffae
	sta	%f30,[%i6+%g0]0x81	! Mem[0000000030181400] = ff0000f5
!	%f16 = 44100000, Mem[0000000010141410] = 00000001
	sta	%f16,[%i5+%o5]0x88	! Mem[0000000010141410] = 44100000
!	Mem[0000000010081408] = 00000000, %l2 = 0000000000000001
	ldstuba	[%i2+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000030041410] = 5475fff3
	stba	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = 5475ff00
!	Mem[0000000010081400] = 000000ff, %l7 = 000000000000ce77
	ldstuba	[%i2+%g0]0x88,%l7	! %l7 = 000000ff000000ff
!	%l0 = 0000000000000000, Mem[0000000010101408] = 000000ff
	stba	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ff528819, %l3 = 0000000000000000
	ldsba	[%o0+0x000]%asi,%l3	! %l3 = ffffffffffffffff

p0_label_173:
!	Mem[0000000030001410] = ffffffff, %l4 = 0000000054750000
	lduha	[%i0+%o5]0x81,%l4	! %l4 = 000000000000ffff
	membar	#Sync			! Added by membar checker (36)
!	Mem[0000000030101410] = 00000000ffffffff, %f20 = 0e30509a 5475fff3
	ldda	[%i4+%o5]0x89,%f20	! %f20 = 00000000 ffffffff
!	Mem[0000000030041400] = f5d0fb1d, %l3 = ffffffffffffffff
	ldswa	[%i1+%g0]0x89,%l3	! %l3 = fffffffff5d0fb1d
!	Mem[0000000010101408] = 00000000 00005aa1, %l2 = 00000000, %l3 = f5d0fb1d
	ldda	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000000 0000000000005aa1
!	Mem[0000000010001400] = 000000a1, %l2 = 0000000000000000
	lduba	[%i0+%g0]0x88,%l2	! %l2 = 00000000000000a1
!	Mem[0000000030101400] = 0000000000000000, %l2 = 00000000000000a1
	ldxa	[%i4+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001400] = 1023d0d0, %l0 = 0000000000000000
	ldsha	[%i0+%g0]0x89,%l0	! %l0 = ffffffffffffd0d0
!	Mem[0000000030101408] = 00000000, %l0 = ffffffffffffd0d0
	ldsha	[%i4+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000021800140] = ff033eed, %l1 = 0000000000000000
	ldsha	[%o3+0x140]%asi,%l1	! %l1 = ffffffffffffff03
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000005aa1, Mem[0000000010041400] = 00000001
	stw	%l3,[%i1+%g0]		! Mem[0000000010041400] = 00005aa1

p0_label_174:
!	%f12 = d0d02310 036e77e0, Mem[0000000010141408] = ff000000 036e77e0
	stda	%f12,[%i5+0x008]%asi	! Mem[0000000010141408] = d0d02310 036e77e0
!	%l2 = 0000000000000000, Mem[0000000010001410] = 00000000
	stba	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	%l0 = 0000000000000000, Mem[0000000010141400] = 00000000
	stba	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010001408] = 00000001
	stba	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
!	Mem[00000000100c142c] = 00000000, %l0 = 0000000000000000
	swap	[%i3+0x02c],%l0		! %l0 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010041400] = 00005aa1
	stba	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 00005aa1
!	%l0 = 0000000000000000, Mem[0000000010181410] = 5200ffff
	stwa	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	%l3 = 0000000000005aa1, Mem[0000000030181400] = f50000ff
	stwa	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 00005aa1
!	%l6 = 00000000, %l7 = 000000ff, Mem[00000000100c1410] = 00007554 9a50300e
	stda	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = a15a0000 000000ff 00000000 00005aa1
!	Mem[0000000010101410] = ffffffff 7d7d0000 10000000 00000000
!	Mem[0000000010101420] = ff000000 000000ff 15f1a5c5 2ef3f120
!	Mem[0000000010101430] = 000000ff 00000000 8a5e64bd 00005aa1
	ldda	[%i4]ASI_BLK_AIUP,%f16	! Block Load from 0000000010101400

p0_label_175:
!	Mem[00000000300c1410] = 9ffcffff, %f15 = e7b4a6bd
	lda	[%i3+%o5]0x81,%f15	! %f15 = 9ffcffff
!	Mem[0000000030141408] = 1023d0d0ffffff00, %l3 = 0000000000005aa1
	ldxa	[%i5+%o4]0x89,%l3	! %l3 = 1023d0d0ffffff00
!	%l2 = 0000000000000000, imm = ffffffffffffff9b, %l7 = 00000000000000ff
	addc	%l2,-0x065,%l7		! %l7 = ffffffffffffff9b
!	Mem[00000000300c1410] = 9ffcffff, %l7 = ffffffffffffff9b
	ldswa	[%i3+%o5]0x81,%l7	! %l7 = ffffffff9ffcffff
!	Mem[0000000010041400] = a15a0000, %f9  = a15a0000
	lda	[%i1+%g0]0x88,%f9 	! %f9 = a15a0000
!	Mem[0000000010001408] = 00000000, %l5 = 0000000000000000
	lduba	[%i0+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l7 = ffffffff9ffcffff
	ldsha	[%i4+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000201c0000] = ff528819, %l6 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l6	! %l6 = ffffffffffffff52
!	Mem[00000000100c1400] = ff75fff3, %f13 = 036e77e0
	lda	[%i3+%g0]0x80,%f13	! %f13 = ff75fff3
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (37)
!	%f2  = 00000000 00000000, Mem[0000000010101410] = ffffffff 7d7d0000
	stda	%f2 ,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000 00000000

p0_label_176:
!	Code Fragment 4
p0_fragment_20:
!	%l0 = 0000000000000000
	setx	0x4c19116f90f65e14,%g7,%l0 ! %l0 = 4c19116f90f65e14
!	%l1 = ffffffffffffff03
	setx	0xe45e1a885c7263df,%g7,%l1 ! %l1 = e45e1a885c7263df
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4c19116f90f65e14
	setx	0x0e5b5a07d8c4ec7a,%g7,%l0 ! %l0 = 0e5b5a07d8c4ec7a
!	%l1 = e45e1a885c7263df
	setx	0x8d2a6fa04f8f69a7,%g7,%l1 ! %l1 = 8d2a6fa04f8f69a7
!	%f16 = a15a0000 000000ff 00000000 00005aa1
!	%f20 = ffffffff 7d7d0000 10000000 00000000
!	%f24 = ff000000 000000ff 15f1a5c5 2ef3f120
!	%f28 = 000000ff 00000000 8a5e64bd 00005aa1
	stda	%f16,[%i2]ASI_BLK_AIUSL	! Block Store to 0000000030081400
!	%f12 = d0d02310, %f7  = 00000001
	fsqrts	%f12,%f7 		! %f7  = 7fffffff
!	Mem[0000000020800040] = 00ffbf87, %l6 = ffffffffffffff52
	ldstub	[%o1+0x040],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010101408] = 00000000, %l3 = 1023d0d0ffffff00
	swapa	[%i4+%o4]0x88,%l3	! %l3 = 0000000000000000
!	%l5 = 0000000000000000, %l7 = 0000000000000000, %l0 = 0e5b5a07d8c4ec7a
	orn	%l5,%l7,%l0		! %l0 = ffffffffffffffff
!	%l4 = 000000000000ffff, Mem[0000000010081410] = ff0000ff
	stwa	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000ffff
!	%f0  = 00000000 00000000, %l2 = 0000000000000000
!	Mem[0000000030181418] = ffffffff7d7d0000
	add	%i6,0x018,%g1
	stda	%f0,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030181418] = ffffffff7d7d0000
!	%f12 = d0d02310 ff75fff3, %l1 = 8d2a6fa04f8f69a7
!	Mem[0000000010141430] = 7d7d0000c5a5f115
	add	%i5,0x030,%g1
	stda	%f12,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010141430] = f3ff7500c523f1d0
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (38)
!	Mem[0000000010081400] = 91000000000000ff, %l4 = 000000000000ffff
	ldxa	[%i2+%g0]0x88,%l4	! %l4 = 91000000000000ff

p0_label_177:
!	Mem[000000001008140c] = 5475fff3, %l0 = ffffffffffffffff
	lduha	[%i2+0x00e]%asi,%l0	! %l0 = 000000000000fff3
!	Mem[0000000010081410] = ffff0000, %l0 = 000000000000fff3
	ldsha	[%i2+%o5]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010181400] = aeffffff, %l2 = 0000000000000000
	ldsb	[%i6+0x003],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000030041410] = 5475ff00, %l3 = 0000000000000000
	ldsha	[%i1+%o5]0x89,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000030081400] = ff000000 00005aa1 a15a0000 00000000
!	Mem[0000000030081410] = 00007d7d ffffffff 00000000 00000010
!	Mem[0000000030081420] = ff000000 000000ff 20f1f32e c5a5f115
!	Mem[0000000030081430] = 00000000 ff000000 a15a0000 bd645e8a
	ldda	[%i2]ASI_BLK_AIUS,%f0	! Block Load from 0000000030081400
!	Mem[00000000100c1424] = ffffd0d0, %l0 = ffffffffffffffff
	ldsh	[%i3+0x024],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010001408] = 00000000, %l0 = ffffffffffffffff
	ldsha	[%i0+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800000] = f120c3ca, %l2 = ffffffffffffffff
	lduh	[%o1+%g0],%l2		! %l2 = 000000000000f120
!	Mem[0000000010181410] = 00000000, %l4 = 91000000000000ff
	lduha	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f16 = a15a0000 000000ff 00000000 00005aa1
!	%f20 = ffffffff 7d7d0000 10000000 00000000
!	%f24 = ff000000 000000ff 15f1a5c5 2ef3f120
!	%f28 = 000000ff 00000000 8a5e64bd 00005aa1
	stda	%f16,[%i0]ASI_BLK_P	! Block Store to 0000000010001400

p0_label_178:
!	Mem[00000000201c0001] = ff528819, %l4 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l4	! %l4 = 00000052000000ff
!	%l6 = 0000000000000000, %l7 = 0000000000000000, %l3 = ffffffffffffff00
	or	%l6,%l7,%l3		! %l3 = 0000000000000000
!	Code Fragment 3
p0_fragment_21:
!	%l0 = 0000000000000000
	setx	0x23fddaff931caca3,%g7,%l0 ! %l0 = 23fddaff931caca3
!	%l1 = 8d2a6fa04f8f69a7
	setx	0xa48013384be2220b,%g7,%l1 ! %l1 = a48013384be2220b
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 23fddaff931caca3
	setx	0x12167417c64e7f69,%g7,%l0 ! %l0 = 12167417c64e7f69
!	%l1 = a48013384be2220b
	setx	0xedd4b18fb64732f3,%g7,%l1 ! %l1 = edd4b18fb64732f3
!	%l2 = 000000000000f120, Mem[0000000030001410] = ffffffff00000000
	stxa	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000000000f120
!	Mem[0000000010081430] = 7cffb22d, %l3 = 0000000000000000
	swap	[%i2+0x030],%l3		! %l3 = 000000007cffb22d
!	%l5 = 0000000000000000, Mem[0000000030181408] = ffffffff
	stha	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = ffff0000
!	%f8  = ff000000 000000ff, Mem[0000000030101408] = 00000000 00000000
	stda	%f8 ,[%i4+%o4]0x81	! Mem[0000000030101408] = ff000000 000000ff
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010141410] = 00001044 00000000
	stda	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 00000000
!	%l2 = 0000f120, %l3 = 7cffb22d, Mem[00000000300c1408] = 00000000 00000000
	stda	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000f120 7cffb22d
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l4 = 0000000000000052
	ldsba	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000

p0_label_179:
!	Mem[0000000030001410] = 00000000, %l2 = 000000000000f120
	ldsba	[%i0+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141408] = 1023d0d0, %l5 = 0000000000000000
	lduba	[%i5+%o4]0x88,%l5	! %l5 = 00000000000000d0
!	Mem[0000000010041410] = 000000ff, %l3 = 000000007cffb22d
	lduwa	[%i1+%o5]0x88,%l3	! %l3 = 00000000000000ff
	membar	#Sync			! Added by membar checker (39)
!	Mem[0000000010001408] = 00000000, %f11 = c5a5f115
	lda	[%i0+%o4]0x80,%f11	! %f11 = 00000000
!	Mem[00000000100c1400] = 44100000f3ff75ff, %l6 = 0000000000000000
	ldxa	[%i3+%g0]0x88,%l6	! %l6 = 44100000f3ff75ff
!	Mem[0000000030101408] = 000000ff, %l0 = 12167417c64e7f69
	lduha	[%i4+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	%l3 = 00000000000000ff, %l4 = 0000000000000000, %l5 = 00000000000000d0
	xor	%l3,%l4,%l5		! %l5 = 00000000000000ff
!	Mem[0000000010001428] = 15f1a5c52ef3f120, %f26 = 15f1a5c5 2ef3f120
	ldda	[%i0+0x028]%asi,%f26	! %f26 = 15f1a5c5 2ef3f120
!	Mem[0000000030141408] = 00ffffff, %l4 = 0000000000000000
	lduwa	[%i5+%o4]0x81,%l4	! %l4 = 0000000000ffffff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010181410] = 00000000
	stha	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000

p0_label_180:
!	Mem[00000000100c141c] = ffffffff, %l0 = 00000000000000ff
	swap	[%i3+0x01c],%l0		! %l0 = 00000000ffffffff
!	Mem[0000000030001410] = 00000000, %l6 = 44100000f3ff75ff
	ldstuba	[%i0+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%l0 = ffffffff, %l1 = b64732f3, Mem[0000000030101400] = 00000000 00000000
	stda	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffffff b64732f3
!	%f30 = 8a5e64bd 00005aa1, Mem[0000000010041400] = 00005aa1 00000000
	stda	%f30,[%i1+%g0]0x80	! Mem[0000000010041400] = 8a5e64bd 00005aa1
!	Mem[0000000010081408] = ff000000, %l5 = 00000000000000ff
	ldstuba	[%i2+%o4]0x80,%l5	! %l5 = 000000ff000000ff
!	%l2 = 0000000000000000, Mem[0000000021800000] = ffffb05a, %asi = 80
	stha	%l2,[%o3+0x000]%asi	! Mem[0000000021800000] = 0000b05a
!	%l0 = 00000000ffffffff, Mem[0000000010041408] = 00000000
	stwa	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffffff
!	%f6  = 00000000 00000010, Mem[0000000030141408] = 00ffffff d0d02310
	stda	%f6 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000 00000010
!	%f0  = ff000000 00005aa1, Mem[0000000030081410] = 7d7d0000 ffffffff
	stda	%f0 ,[%i2+%o5]0x89	! Mem[0000000030081410] = ff000000 00005aa1
!	Starting 10 instruction Load Burst
!	Mem[0000000010001420] = ff000000, %l6 = 0000000000000000
	lduwa	[%i0+0x020]%asi,%l6	! %l6 = 00000000ff000000

p0_label_181:
!	Mem[0000000010001408] = 00000000 00005aa1, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i0+0x008]%asi,%l2	! %l2 = 0000000000000000 0000000000005aa1
!	Mem[0000000030001400] = aeff0000 1023d0d0, %l4 = 00ffffff, %l5 = 000000ff
	ldda	[%i0+%g0]0x89,%l4	! %l4 = 000000001023d0d0 00000000aeff0000
!	Mem[00000000100c1400] = ff75fff3, %l3 = 0000000000005aa1
	ldswa	[%i3+%g0]0x80,%l3	! %l3 = ffffffffff75fff3
!	Mem[0000000010001430] = 000000ff, %f8  = ff000000
	lda	[%i0+0x030]%asi,%f8 	! %f8 = 000000ff
!	Mem[0000000030001410] = ff000000, %l3 = ffffffffff75fff3
	ldswa	[%i0+%o5]0x81,%l3	! %l3 = ffffffffff000000
!	Mem[0000000010041400] = bd645e8a, %l6 = 00000000ff000000
	ldsba	[%i1+%g0]0x88,%l6	! %l6 = ffffffffffffff8a
!	Mem[0000000030101408] = 000000ff, %l6 = ffffffffffffff8a
	lduwa	[%i4+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081408] = 00005aa1, %l3 = ffffffffff000000
	lduha	[%i2+%o4]0x89,%l3	! %l3 = 0000000000005aa1
!	Mem[0000000010101410] = 00000000, %l3 = 0000000000005aa1
	ldswa	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ffffffff, Mem[0000000010081418] = 9a01300eba4f7588
	stx	%l0,[%i2+0x018]		! Mem[0000000010081418] = 00000000ffffffff

p0_label_182:
!	%l4 = 1023d0d0, %l5 = aeff0000, Mem[0000000030101408] = 000000ff ff000000
	stda	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 1023d0d0 aeff0000
!	Mem[0000000010141414] = 00000000, %l0 = 00000000ffffffff, %asi = 80
	swapa	[%i5+0x014]%asi,%l0	! %l0 = 0000000000000000
!	%l4 = 1023d0d0, %l5 = aeff0000, Mem[0000000030081410] = a15a0000 000000ff
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 1023d0d0 aeff0000
!	Mem[0000000030041410] = 5475ff00, %l6 = 00000000000000ff
	swapa	[%i1+%o5]0x89,%l6	! %l6 = 000000005475ff00
!	%f22 = 10000000 00000000, %l1 = edd4b18fb64732f3
!	Mem[0000000010081428] = 00001f576f4004d8
	add	%i2,0x028,%g1
	stda	%f22,[%g1+%l1]ASI_PST16_P ! Mem[0000000010081428] = 00001f5700000000
!	Mem[0000000010181408] = 00000000, %l5 = 00000000aeff0000
	swapa	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000000
!	%l4 = 000000001023d0d0, Mem[0000000030181410] = ff30509a
	stba	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = d030509a
!	%f8  = 000000ff 000000ff, Mem[0000000010041408] = ffffffff 00000000
	stda	%f8 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff 000000ff
!	Mem[0000000030181410] = d030509a, %l3 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l3	! %l3 = 000000d0000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 000000ff, %l7 = 0000000000000000
	lduha	[%i1+%o4]0x89,%l7	! %l7 = 00000000000000ff

p0_label_183:
!	Mem[0000000030141408] = 00000000, %f15 = bd645e8a
	lda	[%i5+%o4]0x81,%f15	! %f15 = 00000000
!	Mem[0000000010041400] = 8a5e64bd, %l7 = 00000000000000ff
	lduha	[%i1+%g0]0x80,%l7	! %l7 = 0000000000008a5e
!	Mem[0000000010181410] = 00000000, %l0 = 0000000000000000
	lduwa	[%i6+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041400] = 1dfbd0f5, %f15 = 00000000
	lda	[%i1+%g0]0x81,%f15	! %f15 = 1dfbd0f5
!	Mem[0000000010101408] = 00ffffff, %l2 = 0000000000000000
	lduh	[%i4+%o4],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010181410] = 00000000, %l6 = 000000005475ff00
	lduha	[%i6+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = aeff0000, %l2 = 00000000000000ff
	lduba	[%i6+%o4]0x80,%l2	! %l2 = 00000000000000ae
!	Mem[0000000010181428] = f5d0fb1d5e7e7ede, %l6 = 0000000000000000
	ldx	[%i6+0x028],%l6		! %l6 = f5d0fb1d5e7e7ede
!	Mem[0000000030041400] = f5d0fb1d, %l6 = f5d0fb1d5e7e7ede
	lduha	[%i1+%g0]0x89,%l6	! %l6 = 000000000000fb1d
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 20f10000, %l2 = 00000000000000ae
	swapa	[%i3+%o4]0x81,%l2	! %l2 = 0000000020f10000

p0_label_184:
!	%l2 = 0000000020f10000, %l7 = 0000000000008a5e, %l2  = 0000000020f10000
	mulx	%l2,%l7,%l2		! %l2 = 000011ce027e0000
!	%l6 = 0000fb1d, %l7 = 00008a5e, Mem[0000000010181408] = 0000ffae 89dd0000
	stda	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000fb1d 00008a5e
!	Mem[00000000100c1410] = 00000000, %l2 = 000011ce027e0000
	ldstuba	[%i3+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001410] = ffffffff, %l5 = 0000000000000000
	ldstuba	[%i0+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	%f19 = 00005aa1, %f29 = 00000000, %f4  = 00007d7d
	fdivs	%f19,%f29,%f4 		! %f4  = 7f800000
!	%l1 = edd4b18fb64732f3, Mem[0000000030081400] = 000000ff
	stba	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000f3
!	%l0 = 0000000000000000, Mem[0000000030141408] = 00000000
	stha	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	Mem[0000000030081400] = 000000f3, %l4 = 000000001023d0d0
	swapa	[%i2+%g0]0x89,%l4	! %l4 = 00000000000000f3
!	Code Fragment 3
p0_fragment_22:
!	%l0 = 0000000000000000
	setx	0xca45a6182737ea06,%g7,%l0 ! %l0 = ca45a6182737ea06
!	%l1 = edd4b18fb64732f3
	setx	0x2c86e7b044161265,%g7,%l1 ! %l1 = 2c86e7b044161265
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ca45a6182737ea06
	setx	0xf81047001a1f0ba3,%g7,%l0 ! %l0 = f81047001a1f0ba3
!	%l1 = 2c86e7b044161265
	setx	0x9d56b9f021750000,%g7,%l1 ! %l1 = 9d56b9f021750000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = a15a000000000000, %f18 = 00000000 00005aa1
	ldda	[%i2+%o4]0x81,%f18	! %f18 = a15a0000 00000000

p0_label_185:
!	Mem[0000000030141410] = d0d0ffff 00000000, %l6 = 0000fb1d, %l7 = 00008a5e
	ldda	[%i5+%o5]0x81,%l6	! %l6 = 00000000d0d0ffff 0000000000000000
!	Mem[0000000010101408] = 00ffffff, %l7 = 0000000000000000
	ldsha	[%i4+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181408] = 0000ffff, %l7 = 00000000000000ff
	ldsha	[%i6+%o4]0x81,%l7	! %l7 = 0000000000000000
!	%l6 = d0d0ffff, %l7 = 00000000, Mem[0000000030101410] = ffffffff 00000000
	stda	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = d0d0ffff 00000000
!	Mem[0000000010181410] = 00000000 ff16658b, %l2 = 00000000, %l3 = 000000d0
	ldda	[%i6+%o5]0x80,%l2	! %l2 = 0000000000000000 00000000ff16658b
!	Mem[0000000030041408] = ff0000001dfbd0f5, %l2 = 0000000000000000
	ldxa	[%i1+%o4]0x81,%l2	! %l2 = ff0000001dfbd0f5
!	Mem[00000000100c1420] = ffffffff, %l2 = ff0000001dfbd0f5
	lduwa	[%i3+0x020]%asi,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000010081408] = 000000ff, %f6  = 00000000
	lda	[%i2+%o4]0x88,%f6 	! %f6 = 000000ff
!	Mem[0000000010101410] = 00000000, %l0 = f81047001a1f0ba3
	ldswa	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 000000ff, %l7 = 0000000000000000
	swapa	[%i0+%o5]0x89,%l7	! %l7 = 00000000000000ff

p0_label_186:
!	Mem[0000000030001400] = 1023d0d0, %l5 = 00000000000000ff
	ldstuba	[%i0+%g0]0x89,%l5	! %l5 = 000000d0000000ff
!	%l0 = 0000000000000000, Mem[0000000010001410] = 00007d7dffffffff
	stxa	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000000000
!	%f6  = 000000ff, Mem[00000000100c1408] = 10000000
	sta	%f6 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ff
!	%l3 = 00000000ff16658b, %l4 = 00000000000000f3, %l5 = 00000000000000d0
	xnor	%l3,%l4,%l5		! %l5 = ffffffff00e99a87
!	Mem[0000000030081408] = a15a0000, %l7 = 00000000000000ff
	swapa	[%i2+%o4]0x81,%l7	! %l7 = 00000000a15a0000
!	Mem[0000000010001428] = 15f1a5c5, %l0 = 0000000000000000
	ldstuba	[%i0+0x028]%asi,%l0	! %l0 = 00000015000000ff
!	%l4 = 00000000000000f3, %l3 = 00000000ff16658b, %l3 = 00000000ff16658b
	subc	%l4,%l3,%l3		! %l3 = ffffffff00e99b68
!	%f26 = 15f1a5c5 2ef3f120, Mem[0000000010181400] = aeffffff 0000ff00
	stda	%f26,[%i6+%g0]0x80	! Mem[0000000010181400] = 15f1a5c5 2ef3f120
!	%l3 = ffffffff00e99b68, Mem[0000000010141408] = d0d02310
	stba	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 68d02310
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_23:
!	%l0 = 0000000000000015
	setx	0x095822ffafdaffe0,%g7,%l0 ! %l0 = 095822ffafdaffe0
!	%l1 = 9d56b9f021750000
	setx	0x620b1d881627518e,%g7,%l1 ! %l1 = 620b1d881627518e
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 095822ffafdaffe0
	setx	0x74b59ec87bac5584,%g7,%l0 ! %l0 = 74b59ec87bac5584
!	%l1 = 620b1d881627518e
	setx	0x88f595e028673e95,%g7,%l1 ! %l1 = 88f595e028673e95

p0_label_187:
!	Mem[0000000030181408] = ffff0000, %f16 = a15a0000
	lda	[%i6+%o4]0x89,%f16	! %f16 = ffff0000
!	Mem[0000000030141400] = 5aa164bd, %l4 = 00000000000000f3
	lduha	[%i5+%g0]0x81,%l4	! %l4 = 0000000000005aa1
!	Mem[0000000010141408] = 68d02310 036e77e0, %l2 = ffffffff, %l3 = 00e99b68
	ldda	[%i5+%o4]0x80,%l2	! %l2 = 0000000068d02310 00000000036e77e0
!	Mem[0000000010001400] = 00005aa1, %l6 = 00000000d0d0ffff
	ldswa	[%i0+%g0]0x88,%l6	! %l6 = 0000000000005aa1
!	Mem[00000000300c1410] = 9ffcffff9a50300e, %l3 = 00000000036e77e0
	ldxa	[%i3+%o5]0x81,%l3	! %l3 = 9ffcffff9a50300e
!	Mem[0000000010081410] = ffff0000, %l4 = 0000000000005aa1
	lduwa	[%i2+%o5]0x80,%l4	! %l4 = 00000000ffff0000
!	Mem[0000000010001408] = 00000000, %f29 = 00000000
	lda	[%i0+%o4]0x80,%f29	! %f29 = 00000000
!	%f19 = 00000000, %f14 = a15a0000, %f2  = a15a0000 00000000
	fsmuld	%f19,%f14,%f2 		! %f2  = 80000000 00000000
!	Mem[0000000030181400] = 1000000000005aa1, %f8  = 000000ff 000000ff
	ldda	[%i6+%g0]0x89,%f8 	! %f8  = 10000000 00005aa1
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = aeff0000, %l5 = ffffffff00e99a87
	swapa	[%i0+%o4]0x89,%l5	! %l5 = 00000000aeff0000

p0_label_188:
!	%l5 = 00000000aeff0000, Mem[0000000030001410] = 20f1000000000000
	stxa	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000aeff0000
!	%l0 = 74b59ec87bac5584, %l7 = 00000000a15a0000, %y  = fefffc0c
	udiv	%l0,%l7,%l4		! %l4 = 00000000ffffffff
	mov	%l0,%y			! %y = 7bac5584
!	%l0 = 74b59ec87bac5584, Mem[00000000211c0000] = fffffcae, %asi = 80
	stba	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = 84fffcae
!	Mem[0000000010101410] = 00000000, %l5 = 00000000aeff0000
	swapa	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000
!	%l0 = 74b59ec87bac5584, Mem[00000000100c1408] = ff000000
	stwa	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 7bac5584
!	%l1 = 88f595e028673e95, Mem[0000000030101410] = ffffd0d0
	stha	%l1,[%i4+%o5]0x89	! Mem[0000000030101410] = ffff3e95
!	Mem[0000000021800181] = 662d8f81, %l5 = 0000000000000000
	ldstuba	[%o3+0x181]%asi,%l5	! %l5 = 0000002d000000ff
!	%l5 = 000000000000002d, Mem[0000000010101400] = 00005aa1
	stba	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = 00005a2d
!	%l2 = 0000000068d02310, Mem[0000000010101410] = 0000ffae
	stba	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000ff10
!	Starting 10 instruction Load Burst
!	Mem[000000001008140c] = 5475fff3, %l4 = 00000000ffffffff
	lduha	[%i2+0x00c]%asi,%l4	! %l4 = 0000000000005475

p0_label_189:
!	Mem[0000000030141408] = 00000000, %l0 = 74b59ec87bac5584
	ldswa	[%i5+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = 00005a2d, %l6 = 0000000000005aa1
	lduha	[%i4+%g0]0x88,%l6	! %l6 = 0000000000005a2d
!	Mem[00000000211c0000] = 84fffcae, %l3 = 9ffcffff9a50300e
	lduha	[%o2+0x000]%asi,%l3	! %l3 = 00000000000084ff
!	Mem[0000000010081408] = ff0000005475fff3, %l0 = 0000000000000000
	ldxa	[%i2+%o4]0x80,%l0	! %l0 = ff0000005475fff3
!	Mem[0000000030041408] = ff0000001dfbd0f5, %l3 = 00000000000084ff
	ldxa	[%i1+%o4]0x81,%l3	! %l3 = ff0000001dfbd0f5
!	Mem[00000000100c1410] = ff000000000000ff, %l0 = ff0000005475fff3
	ldxa	[%i3+%o5]0x80,%l0	! %l0 = ff000000000000ff
!	Mem[0000000010041438] = 9495b8c3, %l3 = ff0000001dfbd0f5
	ldswa	[%i1+0x038]%asi,%l3	! %l3 = ffffffff9495b8c3
!	Mem[0000000030141410] = ffffd0d0, %l4 = 0000000000005475
	ldsha	[%i5+%o5]0x89,%l4	! %l4 = ffffffffffffd0d0
!	Mem[0000000010141410] = 00000000, %l4 = ffffffffffffd0d0
	lduha	[%i5+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = ffffffff9495b8c3, %l6 = 0000000000005a2d, %y  = 7bac5584
	smul	%l3,%l6,%l6		! %l6 = ffffda29c1460847, %y = ffffda29

p0_label_190:
!	%l3 = ffffffff9495b8c3, Mem[00000000100c1410] = ff000000
	stwa	%l3,[%i3+%o5]0x80	! Mem[00000000100c1410] = 9495b8c3
!	Mem[0000000030101408] = d0d02310, %l2 = 0000000068d02310
	swapa	[%i4+%o4]0x81,%l2	! %l2 = 00000000d0d02310
!	%l4 = 00000000, %l5 = 0000002d, Mem[0000000010041408] = ff000000 ff000000
	stda	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000 0000002d
!	%l2 = 00000000d0d02310, Mem[0000000030081410] = 1023d0d0
	stba	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 1023d0d0
!	Mem[00000000100c1400] = f3ff75ff, %l1 = 88f595e028673e95
	ldstuba	[%i3+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	%f24 = ff000000, Mem[0000000030141410] = ffffd0d0
	sta	%f24,[%i5+%o5]0x89	! Mem[0000000030141410] = ff000000
!	Mem[0000000010081408] = 000000ff, %l2 = 00000000d0d02310
	ldstuba	[%i2+%o4]0x88,%l2	! %l2 = 000000ff000000ff
!	%f16 = ffff0000 000000ff a15a0000 00000000
!	%f20 = ffffffff 7d7d0000 10000000 00000000
!	%f24 = ff000000 000000ff 15f1a5c5 2ef3f120
!	%f28 = 000000ff 00000000 8a5e64bd 00005aa1
	stda	%f16,[%i1]ASI_BLK_AIUS	! Block Store to 0000000030041400
!	Mem[0000000030101410] = 953effff, %l1 = 00000000000000ff
	ldstuba	[%i4+%o5]0x81,%l1	! %l1 = 00000095000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (40)
!	Mem[0000000030041408] = a15a000000000000, %l0 = ff000000000000ff
	ldxa	[%i1+%o4]0x81,%l0	! %l0 = a15a000000000000

p0_label_191:
!	Mem[0000000021800080] = 15ff0203, %l2 = 00000000000000ff
	ldsba	[%o3+0x081]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030041400] = ffff0000 000000ff a15a0000 00000000
!	Mem[0000000030041410] = ffffffff 7d7d0000 10000000 00000000
!	Mem[0000000030041420] = ff000000 000000ff 15f1a5c5 2ef3f120
!	Mem[0000000030041430] = 000000ff 00000000 8a5e64bd 00005aa1
	ldda	[%i1]ASI_BLK_S,%f16	! Block Load from 0000000030041400
!	Mem[0000000010001410] = 00000000 00000000, %l0 = 00000000, %l1 = 00000095
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010141424] = 00000000, %l4 = 0000000000000000
	lduw	[%i5+0x024],%l4		! %l4 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l2 = ffffffffffffffff
	lduwa	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181408] = 0000fb1d, %l3 = ffffffff9495b8c3
	lduba	[%i6+%o4]0x88,%l3	! %l3 = 000000000000001d
!	Mem[0000000030181400] = 10000000 00005aa1, %l2 = 00000000, %l3 = 0000001d
	ldda	[%i6+%g0]0x89,%l2	! %l2 = 0000000000005aa1 0000000010000000
!	Mem[00000000300c1410] = 9ffcffff, %l4 = 0000000000000000
	lduba	[%i3+%o5]0x81,%l4	! %l4 = 000000000000009f
!	Mem[0000000030041400] = ffff0000, %l3 = 0000000010000000
	ldsba	[%i1+%g0]0x81,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010041410] = ff000000
	stha	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000

p0_label_192:
!	%l7 = 00000000a15a0000, Mem[00000000201c0000] = ffff8819, %asi = 80
	stba	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ff8819
!	%l1 = 0000000000000000, Mem[0000000010101408] = 00ffffff00005aa1
	stxa	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000000000000000
!	%f14 = a15a0000 1dfbd0f5, %l6 = ffffda29c1460847
!	Mem[0000000030181408] = 0000ffffffffffae
	add	%i6,0x008,%g1
	stda	%f14,[%g1+%l6]ASI_PST8_S ! Mem[0000000030181408] = 005afffffffbd0f5
!	%l6 = ffffda29c1460847, Mem[0000000030081400] = d0d0231000005aa1
	stxa	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffda29c1460847
!	%l6 = ffffda29c1460847, Mem[0000000030081400] = 29daffff
	stwa	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = c1460847
	membar	#Sync			! Added by membar checker (41)
!	%l7 = 00000000a15a0000, Mem[0000000030041410] = ffffffff
	stwa	%l7,[%i1+%o5]0x89	! Mem[0000000030041410] = a15a0000
!	Mem[0000000010181410] = 00000000ff16658b, %l5 = 000000000000002d, %l3 = ffffffffffffffff
	add	%i6,0x10,%g1
	casxa	[%g1]0x80,%l5,%l3	! %l3 = 00000000ff16658b
!	%l0 = 0000000000000000, Mem[0000000030181408] = f5d0fbffffff5a00
	stxa	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000000000000000
!	Mem[0000000010101409] = 00000000, %l0 = 0000000000000000
	ldstub	[%i4+0x009],%l0		! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 68d02310, %l0 = 0000000000000000
	lduba	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000068

p0_label_193:
!	Mem[0000000010141400] = 00000000, %l5 = 000000000000002d
	lduwa	[%i5+%g0]0x88,%l5	! %l5 = 0000000000000000
!	%l5 = 0000000000000000, %l1 = 0000000000000000, %l6 = ffffda29c1460847
	andn	%l5,%l1,%l6		! %l6 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l4 = 000000000000009f
	lduha	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000211c0000] = 84fffcae, %l2 = 0000000000005aa1
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = ffffffffffff84ff
!	Mem[00000000300c1400] = 5475fff3 00001044 000000ae 2db2ff7c
!	Mem[00000000300c1410] = 9ffcffff 9a50300e 000000a1 5a007396
!	Mem[00000000300c1420] = 8b6516ff 5200ffff 2ef3f120 00005aa1
!	Mem[00000000300c1430] = ff000000 000000ff ffffffae f50000ff
	ldda	[%i3]ASI_BLK_AIUS,%f16	! Block Load from 00000000300c1400
!	Mem[0000000020800040] = ffffbf87, %l4 = 0000000000000000
	ldsb	[%o1+0x041],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010141400] = 000000002ef3f120, %l5 = 0000000000000000
	ldxa	[%i5+0x000]%asi,%l5	! %l5 = 000000002ef3f120
!	Mem[0000000010101410] = 0000ff10, %l6 = 0000000000000000
	lduwa	[%i4+%o5]0x88,%l6	! %l6 = 000000000000ff10
!	Mem[0000000030081408] = ff000000, %f5  = ffffffff
	lda	[%i2+%o4]0x89,%f5 	! %f5 = ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 00000000, %l3 = 00000000ff16658b
	swapa	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000000

p0_label_194:
!	Mem[0000000030001410] = aeff0000, %l5 = 000000002ef3f120
	swapa	[%i0+%o5]0x89,%l5	! %l5 = 00000000aeff0000
!	%l7 = 00000000a15a0000, Mem[0000000030181400] = 1000000000005aa1
	stxa	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000a15a0000
!	%l2 = ffffffffffff84ff, Mem[00000000100c1400] = ff75fff3
	stwa	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffff84ff
!	Mem[0000000030141408] = 00000000, %l0 = 0000000000000068
	swapa	[%i5+%o4]0x89,%l0	! %l0 = 0000000000000000
!	%l4 = ffffffffffffffff, Mem[0000000010141402] = 00000000
	stb	%l4,[%i5+0x002]		! Mem[0000000010141400] = 0000ff00
!	%l3 = 0000000000000000, Mem[000000001010140c] = 00000000, %asi = 80
	stwa	%l3,[%i4+0x00c]%asi	! Mem[000000001010140c] = 00000000
!	Mem[0000000010041428] = 70114fed, %l2 = ffffffffffff84ff
	ldstuba	[%i1+0x028]%asi,%l2	! %l2 = 00000070000000ff
!	%l2 = 0000000000000070, Mem[0000000010001408] = 00000000
	stba	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 70000000
!	Mem[0000000010141400] = 00ff0000, %l0 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l0	! %l0 = 0000000000ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 2ef3f120, %l3 = 0000000000000000
	ldsba	[%i0+%o5]0x89,%l3	! %l3 = 0000000000000020

p0_label_195:
!	Mem[0000000030101400] = ffffffff, %l1 = 0000000000000000
	lduha	[%i4+%g0]0x81,%l1	! %l1 = 000000000000ffff
!	%l0 = 0000000000ff0000, %l0 = 0000000000ff0000, %l7 = 00000000a15a0000
	subc	%l0,%l0,%l7		! %l7 = 0000000000000000
!	Mem[0000000030101410] = ff3effff, %l6 = 000000000000ff10
	ldsha	[%i4+%o5]0x81,%l6	! %l6 = ffffffffffffff3e
!	Mem[00000000300c1410] = 9ffcffff9a50300e, %f6  = 000000ff 00000010
	ldda	[%i3+%o5]0x81,%f6 	! %f6  = 9ffcffff 9a50300e
!	Mem[00000000300c1400] = f3ff7554, %l5 = 00000000aeff0000
	ldsba	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000054
!	Mem[0000000030141410] = 000000ff, %l1 = 000000000000ffff
	ldsba	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101410] = ffff3eff, %f4  = 7f800000
	lda	[%i4+%o5]0x89,%f4 	! %f4 = ffff3eff
!	Mem[00000000100c1418] = 00007d7d, %l0 = 0000000000ff0000
	ldsw	[%i3+0x018],%l0		! %l0 = 0000000000007d7d
!	Mem[0000000010041408] = 000000000000002d, %l2 = 0000000000000070
	ldxa	[%i1+%o4]0x80,%l2	! %l2 = 000000000000002d
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000054, Mem[0000000030081408] = 00000000ff000000
	stxa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000000000000054

p0_label_196:
!	%l4 = ffffffff, %l5 = 00000054, Mem[00000000100c1408] = 8455ac7b aeffffff
	stda	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffffffff 00000054
!	Mem[0000000030081400] = 470846c1, %l7 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l7	! %l7 = 00000000470846c1
!	Mem[0000000010001400] = 00005aa1, %l2 = 000000000000002d
	ldstuba	[%i0+%g0]0x88,%l2	! %l2 = 000000a1000000ff
!	Mem[0000000010181408] = 0000fb1d, %l0 = 0000000000007d7d
	ldstuba	[%i6+%o4]0x88,%l0	! %l0 = 0000001d000000ff
!	%l2 = 00000000000000a1, Mem[0000000030081408] = 5400000000000000
	stxa	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000000000a1
!	%f16 = 5475fff3 00001044 000000ae 2db2ff7c
!	%f20 = 9ffcffff 9a50300e 000000a1 5a007396
!	%f24 = 8b6516ff 5200ffff 2ef3f120 00005aa1
!	%f28 = ff000000 000000ff ffffffae f50000ff
	stda	%f16,[%i1]ASI_COMMIT_P	! Block Store to 0000000010041400
	membar	#Sync			! Added by membar checker (42)
!	%l3 = 0000000000000020, Mem[000000001004142a] = 2ef3f120
	stb	%l3,[%i1+0x02a]		! Mem[0000000010041428] = 2ef32020
!	%l6 = ffffffffffffff3e, Mem[00000000211c0000] = 84fffcae
	sth	%l6,[%o2+%g0]		! Mem[00000000211c0000] = ff3efcae
!	%l4 = ffffffffffffffff, Mem[0000000020800040] = ffffbf87
	sth	%l4,[%o1+0x040]		! Mem[0000000020800040] = ffffbf87
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 0e30509afffffc9f, %f0  = ff000000 00005aa1
	ldda	[%i1+%o5]0x88,%f0 	! %f0  = 0e30509a fffffc9f

p0_label_197:
!	Mem[00000000300c1408] = ae000000, %l3 = 0000000000000020
	ldswa	[%i3+%o4]0x89,%l3	! %l3 = ffffffffae000000
!	Mem[0000000010141400] = 000000002ef3f120, %f8  = 10000000 00005aa1
	ldda	[%i5+%g0]0x80,%f8 	! %f8  = 00000000 2ef3f120
!	%l6 = ffffffffffffff3e, %l0 = 000000000000001d, %y  = ffffda29
	udiv	%l6,%l0,%l4		! %l4 = 00000000ffffffff
	mov	%l0,%y			! %y = 0000001d
!	Mem[0000000010001410] = 00000000, %f2  = 80000000
	lda	[%i0+%o5]0x88,%f2 	! %f2 = 00000000
!	%f5  = ff000000, %f22 = 000000a1
	fsqrts	%f5 ,%f22		! %f22 = 7fffffff
!	Mem[0000000030101408] = 68d02310, %l3 = ffffffffae000000
	ldsha	[%i4+%o4]0x81,%l3	! %l3 = 00000000000068d0
!	Mem[0000000010181400] = c5a5f115, %f28 = ff000000
	lda	[%i6+%g0]0x88,%f28	! %f28 = c5a5f115
!	Mem[0000000010001400] = ff5a0000, %l7 = 00000000470846c1
	ldsba	[%i0+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000300c1408] = ae000000, %l1 = 0000000000000000
	lduwa	[%i3+%o4]0x89,%l1	! %l1 = 00000000ae000000
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ae000000, Mem[0000000010081408] = f3ff7554000000ff
	stxa	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000ae000000

p0_label_198:
!	%f29 = 000000ff, Mem[0000000030001400] = ffd02310
	sta	%f29,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000ff
!	%l2 = 00000000000000a1, Mem[00000000100c1408] = ffffffff
	stha	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffff00a1
!	%l0 = 000000000000001d, Mem[0000000030181410] = 9a5030ff
	stha	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 9a50001d
!	%f30 = ffffffae f50000ff, Mem[0000000010101410] = 10ff0000 00000000
	stda	%f30,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffffae f50000ff
!	%l0 = 000000000000001d, Mem[0000000010041410] = 9ffcffff
	stha	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 001dffff
!	Mem[0000000010081400] = ff000000, %l5 = 0000000000000054
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 000000ff000000ff
!	%l4 = 00000000ffffffff, %l2 = 00000000000000a1, %l6 = ffffffffffffff3e
	xnor	%l4,%l2,%l6		! %l6 = ffffffff000000a1
!	%f30 = ffffffae, Mem[0000000010001420] = ff000000
	st	%f30,[%i0+0x020]	! Mem[0000000010001420] = ffffffae
!	%l5 = 00000000000000ff, Mem[0000000010001410] = 00000000
	stba	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 9495b8c3 000000ff, %l0 = 0000001d, %l1 = ae000000
	ldd	[%i3+%o5],%l0		! %l0 = 000000009495b8c3 00000000000000ff

p0_label_199:
!	Mem[0000000030041410] = 00007d7da15a0000, %f4  = ffff3eff ff000000
	ldda	[%i1+%o5]0x89,%f4 	! %f4  = 00007d7d a15a0000
!	Mem[00000000211c0000] = ff3efcae, %l2 = 00000000000000a1
	ldsba	[%o2+0x001]%asi,%l2	! %l2 = 000000000000003e
!	Mem[0000000010001410] = 000000ff, %l3 = 00000000000068d0
	lduha	[%i0+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081408] = 00000000 000000a1, %l6 = 000000a1, %l7 = ffffffff
	ldda	[%i2+%o4]0x81,%l6	! %l6 = 0000000000000000 00000000000000a1
!	Mem[0000000030001400] = 000000ff, %l2 = 000000000000003e
	ldsba	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1410] = ff000000c3b89594, %f22 = 7fffffff 5a007396
	ldda	[%i3+%o5]0x88,%f22	! %f22 = ff000000 c3b89594
!	Mem[000000001000141c] = 00000000, %l3 = 00000000000000ff
	lduwa	[%i0+0x01c]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001408] = 00e99a87, %l7 = 00000000000000a1
	ldsba	[%i0+%o4]0x89,%l7	! %l7 = ffffffffffffff87
!	%f31 = f50000ff, %f6  = 9ffcffff, %f20 = 9ffcffff
	fdivs	%f31,%f6 ,%f20		! %f20 = 7f800000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 00000000, %l7 = ffffffffffffff87
	ldstuba	[%i5+%g0]0x88,%l7	! %l7 = 00000000000000ff

p0_label_200:
!	Mem[0000000010181408] = 0000fbff, %l2 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l2	! %l2 = 000000ff000000ff
!	%f28 = c5a5f115 000000ff, %l6 = 0000000000000000
!	Mem[0000000030081410] = 1023d0d0aeff0000
	add	%i2,0x010,%g1
	stda	%f28,[%g1+%l6]ASI_PST8_S ! Mem[0000000030081410] = 1023d0d0aeff0000
!	%l1 = 00000000000000ff, Mem[0000000030001410] = 2ef3f120
	stwa	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff
!	%f25 = 5200ffff, %f20 = 7f800000
	fsqrts	%f25,%f20		! %f20 = 48b5b99d
!	%l3 = 0000000000000000, Mem[0000000010141400] = 000000ff
	stha	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	Mem[0000000010001410] = 000000ff, %l7 = 0000000000000000
	ldstuba	[%i0+%o5]0x88,%l7	! %l7 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000010041400] = f3ff7554
	stwa	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	%f6  = 9ffcffff 9a50300e, %l6 = 0000000000000000
!	Mem[0000000030101418] = 01000000102375ff
	add	%i4,0x018,%g1
	stda	%f6,[%g1+%l6]ASI_PST16_S ! Mem[0000000030101418] = 01000000102375ff
!	%l4 = 00000000ffffffff, %l6 = 0000000000000000, %l6 = 0000000000000000
	subc	%l4,%l6,%l6		! %l6 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff5a0000, %f2  = 00000000
	lda	[%i0+%g0]0x80,%f2 	! %f2 = ff5a0000

p0_label_201:
!	Mem[00000000300c1410] = 9ffcffff, %l1 = 00000000000000ff
	lduha	[%i3+%o5]0x81,%l1	! %l1 = 0000000000009ffc
!	Mem[0000000010101430] = 000000ff00000000, %l2 = 00000000000000ff
	ldxa	[%i4+0x030]%asi,%l2	! %l2 = 000000ff00000000
!	Mem[0000000030101408] = 68d023100000ffae, %f16 = 5475fff3 00001044
	ldda	[%i4+%o4]0x81,%f16	! %f16 = 68d02310 0000ffae
!	Mem[0000000010081408] = ae000000, %l4 = 00000000ffffffff
	ldswa	[%i2+%o4]0x88,%l4	! %l4 = ffffffffae000000
!	Mem[0000000010001400] = ff5a0000, %l3 = 0000000000000000
	ldub	[%i0+0x001],%l3		! %l3 = 000000000000005a
!	Mem[0000000030181408] = 0000000000000000, %l4 = ffffffffae000000
	ldxa	[%i6+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141400] = bd64a15a, %l7 = 00000000000000ff
	lduba	[%i5+%g0]0x89,%l7	! %l7 = 000000000000005a
!	Mem[00000000211c0000] = ff3efcae, %l4 = 0000000000000000
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = ffffffffffffff3e
!	Mem[0000000010101410] = aeffffff, %l7 = 000000000000005a
	ldsha	[%i4+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Code Fragment 3
p0_fragment_24:
!	%l0 = 000000009495b8c3
	setx	0xcba8e0c85910442a,%g7,%l0 ! %l0 = cba8e0c85910442a
!	%l1 = 0000000000009ffc
	setx	0x90cdb6883ca3b69b,%g7,%l1 ! %l1 = 90cdb6883ca3b69b
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = cba8e0c85910442a
	setx	0xe734d8efc8d5f7f2,%g7,%l0 ! %l0 = e734d8efc8d5f7f2
!	%l1 = 90cdb6883ca3b69b
	setx	0x25e248e06668b697,%g7,%l1 ! %l1 = 25e248e06668b697

p0_label_202:
!	%l3 = 000000000000005a, Mem[0000000030181410] = 9a50001d
	stha	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = 9a50005a
!	Mem[0000000030001408] = 879ae900, %l6 = 00000000ffffffff
	swapa	[%i0+%o4]0x81,%l6	! %l6 = 00000000879ae900
!	Mem[0000000030001400] = ff000000, %l5 = 00000000000000ff
	ldstuba	[%i0+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%l5 = 0000000000000000, imm = 00000000000004ba, %l2 = 000000ff00000000
	and	%l5,0x4ba,%l2		! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010141438] = 00000000
	stw	%l2,[%i5+0x038]		! Mem[0000000010141438] = 00000000
!	Mem[00000000300c1408] = 000000ae, %l7 = ffffffffffffffff
	swapa	[%i3+%o4]0x81,%l7	! %l7 = 00000000000000ae
!	Mem[0000000010181408] = 0000fbff, %l5 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l5	! %l5 = 000000ff000000ff
!	%l4 = ffffffffffffff3e, Mem[00000000201c0000] = 00ff8819
	stb	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 3eff8819
!	%f1  = fffffc9f, Mem[0000000010041418] = 000000a1
	sta	%f1 ,[%i1+0x018]%asi	! Mem[0000000010041418] = fffffc9f
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00000000 000000a1, %l6 = 879ae900, %l7 = 000000ae
	ldda	[%i2+%o4]0x81,%l6	! %l6 = 0000000000000000 00000000000000a1

p0_label_203:
!	Mem[0000000010081410] = ffff0000, %f3  = 00000000
	lda	[%i2+%o5]0x80,%f3 	! %f3 = ffff0000
!	Mem[0000000030141408] = 68000000 00000010, %l2 = 00000000, %l3 = 0000005a
	ldda	[%i5+%o4]0x81,%l2	! %l2 = 0000000068000000 0000000000000010
!	Mem[00000000100c142c] = 00000000, %l5 = 00000000000000ff
	lduh	[%i3+0x02c],%l5		! %l5 = 0000000000000000
!	Mem[00000000201c0000] = 3eff8819, %l3 = 0000000000000010
	ldsba	[%o0+0x000]%asi,%l3	! %l3 = 000000000000003e
!	Mem[0000000010001400] = 00005aff, %l1 = 25e248e06668b697
	ldsba	[%i0+%g0]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000020800040] = ffffbf87, %l2 = 0000000068000000
	ldsba	[%o1+0x041]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c140c] = 00000054, %f30 = ffffffae
	ld	[%i3+0x00c],%f30	! %f30 = 00000054
!	Mem[0000000010001400] = ff5a0000, %l6 = 0000000000000000
	ldswa	[%i0+%g0]0x80,%l6	! %l6 = ffffffffff5a0000
!	Mem[0000000010101400] = ff000000 00005a2d, %l6 = ff5a0000, %l7 = 000000a1
	ldda	[%i4+%g0]0x88,%l6	! %l6 = 0000000000005a2d 00000000ff000000
!	Starting 10 instruction Store Burst
!	%f9  = 2ef3f120, Mem[0000000030141400] = 5aa164bd
	sta	%f9 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 2ef3f120

p0_label_204:
!	Mem[0000000030081408] = 00000000, %l7 = 00000000ff000000
	ldstuba	[%i2+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%f18 = 000000ae 2db2ff7c, %l3 = 000000000000003e
!	Mem[0000000030041408] = a15a000000000000
	add	%i1,0x008,%g1
	stda	%f18,[%g1+%l3]ASI_PST32_S ! Mem[0000000030041408] = 000000ae00000000
!	%l5 = 0000000000000000, Mem[00000000100c1434] = 000000ff
	sth	%l5,[%i3+0x034]		! Mem[00000000100c1434] = 000000ff
!	Mem[0000000010141400] = 00000000, %l1 = ffffffffffffffff
	ldstuba	[%i5+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	%f30 = 00000054 f50000ff, Mem[0000000030141410] = ff000000 00000000
	stda	%f30,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000054 f50000ff
!	%f30 = 00000054 f50000ff, %l2 = ffffffffffffffff
!	Mem[0000000010041408] = 000000ae2db2ff7c
	add	%i1,0x008,%g1
	stda	%f30,[%g1+%l2]ASI_PST16_PL ! Mem[0000000010041408] = ff0000f554000000
!	%f6  = 9ffcffff 9a50300e, Mem[0000000010101410] = ffffffae f50000ff
	stda	%f6 ,[%i4+%o5]0x80	! Mem[0000000010101410] = 9ffcffff 9a50300e
!	%l3 = 000000000000003e, Mem[0000000010001400] = ff5a0000
	stha	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = 003e0000
!	%l6 = 0000000000005a2d, Mem[0000000030041410] = 00007d7da15a0000
	stxa	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000000000005a2d
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00000000ffffffff, %f0  = 0e30509a fffffc9f
	ldda	[%i5+%o5]0x80,%f0 	! %f0  = 00000000 ffffffff

p0_label_205:
!	Mem[0000000030041408] = 00000000ae000000, %l6 = 0000000000005a2d
	ldxa	[%i1+%o4]0x89,%l6	! %l6 = 00000000ae000000
!	Mem[0000000030001408] = ffffffff, %f0  = 00000000
	lda	[%i0+%o4]0x89,%f0 	! %f0 = ffffffff
!	Mem[0000000020800040] = ffffbf87, %l3 = 000000000000003e
	lduba	[%o1+0x041]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101410] = fffffc9f, %l7 = 0000000000000000
	lduba	[%i4+%o5]0x88,%l7	! %l7 = 000000000000009f
!	Mem[0000000010141410] = 00000000, %l6 = 00000000ae000000
	lduba	[%i5+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141408] = 1023d068, %l6 = 0000000000000000
	ldsba	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000068
!	Mem[0000000030041410] = 2d5a000000000000, %l1 = 0000000000000000
	ldxa	[%i1+%o5]0x81,%l1	! %l1 = 2d5a000000000000
	membar	#Sync			! Added by membar checker (43)
!	Mem[0000000030001400] = ff0000ff 0000ffae ffffffff 64ffff69
!	Mem[0000000030001410] = ff000000 00000000 ff36d4f3 64ffff69
!	Mem[0000000030001420] = 00000000 ff57d7c3 00000000 ff36d4ff
!	Mem[0000000030001430] = 15f1a5c5 00007d7d 89dd0000 00000000
	ldda	[%i0]ASI_BLK_SL,%f16	! Block Load from 0000000030001400
!	Mem[00000000100c1418] = 00007d7d000000ff, %l7 = 000000000000009f
	ldx	[%i3+0x018],%l7		! %l7 = 00007d7d000000ff
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ff, Mem[000000001004141c] = 5a007396, %asi = 80
	stha	%l3,[%i1+0x01c]%asi	! Mem[000000001004141c] = 00ff7396

p0_label_206:
!	Code Fragment 4
p0_fragment_25:
!	%l0 = e734d8efc8d5f7f2
	setx	0x7081f30045a70783,%g7,%l0 ! %l0 = 7081f30045a70783
!	%l1 = 2d5a000000000000
	setx	0x95b958d816f18520,%g7,%l1 ! %l1 = 95b958d816f18520
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7081f30045a70783
	setx	0x19c969bf878b97ef,%g7,%l0 ! %l0 = 19c969bf878b97ef
!	%l1 = 95b958d816f18520
	setx	0x2096ffe0520e6ded,%g7,%l1 ! %l1 = 2096ffe0520e6ded
!	%l1 = 2096ffe0520e6ded, Mem[0000000030081408] = ff000000
	stwa	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 520e6ded
	membar	#Sync			! Added by membar checker (44)
!	%f8  = 00000000 2ef3f120, %l5 = 0000000000000000
!	Mem[0000000030001418] = ff36d4f364ffff69
	add	%i0,0x018,%g1
	stda	%f8,[%g1+%l5]ASI_PST16_SL ! Mem[0000000030001418] = ff36d4f364ffff69
!	Mem[0000000010001400] = 00003e00, %l5 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l5	! %l5 = 0000000000003e00
!	Mem[0000000010041428] = 2ef32020, %l0 = 19c969bf878b97ef, %asi = 80
	swapa	[%i1+0x028]%asi,%l0	! %l0 = 000000002ef32020
!	%f8  = 00000000 2ef3f120, %l4 = ffffffffffffff3e
!	Mem[0000000030101420] = 00005aa100000000
	add	%i4,0x020,%g1
	stda	%f8,[%g1+%l4]ASI_PST16_S ! Mem[0000000030101420] = 000000002ef30000
!	%l5 = 0000000000003e00, Mem[0000000030001400] = aeff0000ff0000ff
	stxa	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000000000003e00
!	%f14 = a15a0000 1dfbd0f5, Mem[00000000100c1408] = a100ffff 00000054
	stda	%f14,[%i3+%o4]0x80	! Mem[00000000100c1408] = a15a0000 1dfbd0f5
!	%l0 = 000000002ef32020, Mem[0000000010081408] = ae000000
	stwa	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 2ef32020
!	Starting 10 instruction Load Burst
!	%f20 = 00000000, %f25 = 00000000, %f30 = 00000000
	fdivs	%f20,%f25,%f30		! %f30 = 7fffffff

p0_label_207:
!	Mem[0000000030001400] = 00003e00, %l0 = 000000002ef32020
	ldswa	[%i0+%g0]0x89,%l0	! %l0 = 0000000000003e00
!	Mem[0000000010101410] = fffffc9f, %l6 = 0000000000000068
	ldswa	[%i4+%o5]0x88,%l6	! %l6 = fffffffffffffc9f
!	%l7 = 00007d7d000000ff, %l3 = 00000000000000ff, %l5 = 0000000000003e00
	andn	%l7,%l3,%l5		! %l5 = 00007d7d00000000
!	Mem[0000000010101400] = 2d5a0000 000000ff, %l6 = fffffc9f, %l7 = 000000ff
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 000000002d5a0000 00000000000000ff
!	Mem[00000000100c1420] = ffffffffffffd0d0, %l0 = 0000000000003e00
	ldxa	[%i3+0x020]%asi,%l0	! %l0 = ffffffffffffd0d0
!	Mem[0000000030101400] = ffffffff, %l3 = 00000000000000ff
	ldswa	[%i4+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181410] = 00000000, %l4 = ffffffffffffff3e
	ldsha	[%i6+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i6+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041408] = ff0000f554000000, %f24 = c3d757ff 00000000
	ldda	[%i1+%o4]0x80,%f24	! %f24 = ff0000f5 54000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000030001410] = ff00000000000000
	stxa	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000000000000

p0_label_208:
!	%l6 = 000000002d5a0000, Mem[0000000010101400] = 00005a2d
	stha	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000
!	Mem[000000001008141b] = 00000000, %l6 = 000000002d5a0000
	ldstuba	[%i2+0x01b]%asi,%l6	! %l6 = 00000000000000ff
!	%f10 = 20f1f32e, Mem[0000000010141400] = 000000ff
	sta	%f10,[%i5+%g0]0x88	! Mem[0000000010141400] = 20f1f32e
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010181410] = 00000000 8b6516ff
	stda	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000 00000000
!	Mem[0000000010181410] = 00000000, %l5 = 00007d7d00000000
	ldstuba	[%i6+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[000000001000140d] = 00005aa1, %asi = 80
	stba	%l5,[%i0+0x00d]%asi	! Mem[000000001000140c] = 00005aa1
!	Mem[0000000010001428] = fff1a5c52ef3f120, %l7 = 0000000000000000, %l1 = 2096ffe0520e6ded
	add	%i0,0x28,%g1
	casxa	[%g1]0x80,%l7,%l1	! %l1 = fff1a5c52ef3f120
!	%l2 = ffffffff, %l3 = ffffffff, Mem[00000000100c1438] = 00000000 0000ce77
	std	%l2,[%i3+0x038]		! Mem[00000000100c1438] = ffffffff ffffffff
!	%l7 = 0000000000000000, immd = fffffffffffffbb7, %l7  = 0000000000000000
	mulx	%l7,-0x449,%l7		! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ffffffff, %l6 = 0000000000000000
	lduha	[%i3+%o4]0x89,%l6	! %l6 = 000000000000ffff

p0_label_209:
!	Mem[0000000030081410] = 1023d0d0, %l0 = ffffffffffffd0d0
	ldsba	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000010
!	Mem[0000000010041410] = ffff1d00, %f26 = ffd436ff
	lda	[%i1+%o5]0x88,%f26	! %f26 = ffff1d00
!	Mem[0000000010101438] = 8a5e64bd 00005aa1, %l2 = ffffffff, %l3 = ffffffff
	ldd	[%i4+0x038],%l2		! %l2 = 000000008a5e64bd 0000000000005aa1
!	Code Fragment 4
p0_fragment_26:
!	%l0 = 0000000000000010
	setx	0xd1917f603a7460a7,%g7,%l0 ! %l0 = d1917f603a7460a7
!	%l1 = fff1a5c52ef3f120
	setx	0x08f82cd85f12e52e,%g7,%l1 ! %l1 = 08f82cd85f12e52e
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = d1917f603a7460a7
	setx	0xb98d0a907285301b,%g7,%l0 ! %l0 = b98d0a907285301b
!	%l1 = 08f82cd85f12e52e
	setx	0x9f4b78780c8b4241,%g7,%l1 ! %l1 = 9f4b78780c8b4241
!	Mem[0000000010041400] = 00000000, %l7 = 0000000000000000
	lduba	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001410] = 00000000, %l0 = b98d0a907285301b
	lduba	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041424] = 5200ffff, %l6 = 000000000000ffff
	lduwa	[%i1+0x024]%asi,%l6	! %l6 = 000000005200ffff
!	Mem[0000000010101408] = 00ff0000, %l1 = 9f4b78780c8b4241
	ldsha	[%i4+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181408] = fffb0000, %l5 = 0000000000000000
	ldsba	[%i6+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000030081408] = 520e6ded
	stha	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 00006ded

p0_label_210:
!	%f0  = ffffffff ffffffff, %l4 = 0000000000000000
!	Mem[00000000300c1410] = 9ffcffff9a50300e
	add	%i3,0x010,%g1
	stda	%f0,[%g1+%l4]ASI_PST16_S ! Mem[00000000300c1410] = 9ffcffff9a50300e
!	Mem[0000000010001410] = ff000000, %l3 = 0000000000005aa1
	swapa	[%i0+%o5]0x80,%l3	! %l3 = 00000000ff000000
!	%l5 = ffffffffffffffff, %l2 = 000000008a5e64bd, %l0 = 0000000000000000
	or	%l5,%l2,%l0		! %l0 = ffffffffffffffff
!	Mem[000000001018141d] = 00000000, %l6 = 000000005200ffff
	ldstuba	[%i6+0x01d]%asi,%l6	! %l6 = 00000000000000ff
!	%l1 = 00000000000000ff, %l2 = 000000008a5e64bd, %l1 = 00000000000000ff
	addc	%l1,%l2,%l1		! %l1 = 000000008a5e65bc
!	Mem[0000000010101400] = 00000000, %l2 = 000000008a5e64bd
	swapa	[%i4+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181408] = 0000fbff, %l4 = 0000000000000000
	swapa	[%i6+%o4]0x88,%l4	! %l4 = 000000000000fbff
!	%l2 = 00000000, %l3 = ff000000, Mem[0000000010141400] = 2ef3f120 2ef3f120
	stda	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000 ff000000
!	%f4  = 00007d7d a15a0000, %l6 = 0000000000000000
!	Mem[0000000030181420] = d0d0ffffffffffff
	add	%i6,0x020,%g1
	stda	%f4,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030181420] = d0d0ffffffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff3efcae, %l7 = 0000000000000000
	ldub	[%o2+0x001],%l7		! %l7 = 000000000000003e

p0_label_211:
!	Mem[0000000010101408] = 000000000000ff00, %f28 = 7d7d0000 c5a5f115
	ldda	[%i4+%o4]0x88,%f28	! %f28 = 00000000 0000ff00
!	Mem[00000000100c1410] = 9495b8c3, %f31 = 0000dd89
	lda	[%i3+%o5]0x80,%f31	! %f31 = 9495b8c3
!	Mem[0000000010041408] = ff0000f5, %l2 = 0000000000000000
	lduba	[%i1+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041410] = 2d5a000000000000, %l1 = 000000008a5e65bc
	ldxa	[%i1+%o5]0x81,%l1	! %l1 = 2d5a000000000000
!	Mem[0000000010081430] = 00000000 bac82067, %l6 = 00000000, %l7 = 0000003e
	ldd	[%i2+0x030],%l6		! %l6 = 0000000000000000 00000000bac82067
!	Mem[0000000010041428] = 878b97ef, %l6 = 0000000000000000
	ldsw	[%i1+0x028],%l6		! %l6 = ffffffff878b97ef
!	Mem[0000000010141408] = 68d02310, %l1 = 2d5a000000000000
	ldub	[%i5+0x009],%l1		! %l1 = 00000000000000d0
!	Mem[0000000030141410] = ff0000f5, %f31 = 9495b8c3
	lda	[%i5+%o5]0x81,%f31	! %f31 = ff0000f5
!	Mem[00000000100c1410] = c3b89594, %f4  = 00007d7d
	lda	[%i3+%o5]0x88,%f4 	! %f4 = c3b89594
!	Starting 10 instruction Store Burst
!	%f10 = 20f1f32e 00000000, %l0 = ffffffffffffffff
!	Mem[0000000030001430] = 15f1a5c500007d7d
	add	%i0,0x030,%g1
	stda	%f10,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030001430] = 000000002ef3f120

p0_label_212:
!	%l4 = 0000fbff, %l5 = ffffffff, Mem[0000000010101410] = 9ffcffff 9a50300e
	stda	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000fbff ffffffff
!	%l5 = ffffffffffffffff, Mem[0000000010141408] = 1023d068
	stha	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 1023ffff
!	%l5 = ffffffffffffffff, Mem[0000000030141400] = 2ef3f12000005aa1
	stxa	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffffffffffffff
!	%l5 = ffffffffffffffff, imm = fffffffffffff165, %l2 = 00000000000000ff
	or	%l5,-0xe9b,%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010141408] = ffff2310, %l6 = ffffffff878b97ef
	swapa	[%i5+%o4]0x80,%l6	! %l6 = 00000000ffff2310
!	Mem[0000000030141400] = ffffffff, %l5 = ffffffffffffffff
	ldstuba	[%i5+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010141434] = c523f1d0, %l0 = ffffffffffffffff, %asi = 80
	swapa	[%i5+0x034]%asi,%l0	! %l0 = 00000000c523f1d0
!	%l0 = c523f1d0, %l1 = 000000d0, Mem[0000000010181408] = 00000000 5e8a0000
	std	%l0,[%i6+%o4]		! Mem[0000000010181408] = c523f1d0 000000d0
!	%f8  = 00000000, Mem[0000000010101430] = 000000ff
	st	%f8 ,[%i4+0x030]	! Mem[0000000010101430] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[000000001018140c] = 000000d0, %l2 = ffffffffffffffff
	ldsh	[%i6+0x00c],%l2		! %l2 = 0000000000000000

p0_label_213:
!	Mem[0000000030101400] = ffffffff, %l3 = 00000000ff000000
	lduha	[%i4+%g0]0x89,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010081410] = ffff0000, %l1 = 00000000000000d0
	lduba	[%i2+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141400] = ffffffff ffffffff, %l0 = c523f1d0, %l1 = 000000ff
	ldda	[%i5+%g0]0x89,%l0	! %l0 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000030141408] = 68000000, %l1 = 00000000ffffffff
	ldswa	[%i5+%o4]0x81,%l1	! %l1 = 0000000068000000
!	Mem[000000001018140c] = 000000d0, %f18 = 69ffff64
	ld	[%i6+0x00c],%f18	! %f18 = 000000d0
!	Mem[0000000010081408] = 2020f32e, %l5 = 00000000000000ff
	lduwa	[%i2+%o4]0x80,%l5	! %l5 = 000000002020f32e
!	Mem[0000000010041408] = ff0000f5, %l7 = 00000000bac82067
	ldswa	[%i1+%o4]0x80,%l7	! %l7 = ffffffffff0000f5
!	Mem[00000000100c1400] = ffff84ff 00001044, %l2 = 00000000, %l3 = 0000ffff
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 00000000ffff84ff 0000000000001044
!	Mem[0000000030081410] = d0d02310, %l1 = 0000000068000000
	lduha	[%i2+%o5]0x89,%l1	! %l1 = 0000000000002310
!	Starting 10 instruction Store Burst
!	%f21 = 000000ff, Mem[0000000030081400] = 00000000
	sta	%f21,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000ff

p0_label_214:
!	Mem[00000000100c1408] = a15a0000, %l7 = ffffffffff0000f5
	swapa	[%i3+%o4]0x80,%l7	! %l7 = 00000000a15a0000
!	%l4 = 000000000000fbff, Mem[0000000030041400] = ffff0000000000ff
	stxa	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000000000fbff
!	%l6 = ffff2310, %l7 = a15a0000, Mem[00000000300c1410] = 9ffcffff 9a50300e
	stda	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffff2310 a15a0000
!	%l7 = 00000000a15a0000, Mem[0000000010081408] = 2020f32e
	stwa	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = a15a0000
!	Mem[0000000030041408] = 000000ae, %l5 = 000000002020f32e
	ldstuba	[%i1+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[000000001004143c] = f50000ff, %l7 = 00000000a15a0000
	ldstuba	[%i1+0x03c]%asi,%l7	! %l7 = 000000f5000000ff
!	Code Fragment 3
p0_fragment_27:
!	%l0 = 00000000ffffffff
	setx	0x9efc55ff920ed11c,%g7,%l0 ! %l0 = 9efc55ff920ed11c
!	%l1 = 0000000000002310
	setx	0x26ccf81830836016,%g7,%l1 ! %l1 = 26ccf81830836016
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9efc55ff920ed11c
	setx	0x30786fffd3cc574c,%g7,%l0 ! %l0 = 30786fffd3cc574c
!	%l1 = 26ccf81830836016
	setx	0x78676d88038ebd4b,%g7,%l1 ! %l1 = 78676d88038ebd4b
!	Mem[0000000030001400] = 003e0000, %l0 = 30786fffd3cc574c
	swapa	[%i0+%g0]0x81,%l0	! %l0 = 00000000003e0000
!	%l3 = 0000000000001044, Mem[0000000030141400] = ffffffffffffffff
	stxa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000000000001044
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00006ded, %l1 = 78676d88038ebd4b
	ldsba	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000000

p0_label_215:
!	Mem[0000000010101400] = 8a5e64bd, %l2 = 00000000ffff84ff
	lduwa	[%i4+%g0]0x88,%l2	! %l2 = 000000008a5e64bd
!	Mem[0000000010181410] = ff000000, %l0 = 00000000003e0000
	ldswa	[%i6+%o5]0x80,%l0	! %l0 = ffffffffff000000
!	Mem[00000000100c141c] = 000000ff, %f20 = 00000000
	ld	[%i3+0x01c],%f20	! %f20 = 000000ff
!	Mem[0000000030001410] = 0000000000000000, %l4 = 000000000000fbff
	ldxa	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = 000000ff, %l3 = 0000000000001044
	lduba	[%i2+%g0]0x81,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (45)
!	Mem[0000000030141400] = 00000000 00001044 68000000 00000010
!	Mem[0000000030141410] = ff0000f5 54000000 1062a465 b92ab835
!	Mem[0000000030141420] = 46375da6 265aff0a f72db4ac 935ea4f9
!	Mem[0000000030141430] = d0d02310 036e77e0 2ca1722d 891eac02
	ldda	[%i5]ASI_BLK_S,%f16	! Block Load from 0000000030141400
!	Mem[0000000010001400] = 00000000, %l2 = 000000008a5e64bd
	lduha	[%i0+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1400] = 44100000ff84ffff, %f4  = c3b89594 a15a0000
	ldda	[%i3+%g0]0x88,%f4 	! %f4  = 44100000 ff84ffff
!	%l7 = 00000000000000f5, %l1 = 0000000000000000, %l0 = ffffffffff000000
	or	%l7,%l1,%l0		! %l0 = 00000000000000f5
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = f50000ff, %l2 = 0000000000000000
	ldstuba	[%i3+%o4]0x88,%l2	! %l2 = 000000ff000000ff

p0_label_216:
!	%f0  = ffffffff ffffffff, Mem[0000000010181408] = c523f1d0 000000d0
	stda	%f0 ,[%i6+%o4]0x80	! Mem[0000000010181408] = ffffffff ffffffff
!	%l7 = 00000000000000f5, Mem[0000000010001400] = ff00000000000000
	stxa	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000000000f5
!	%f15 = 1dfbd0f5, %f6  = 9ffcffff
	fcmps	%fcc1,%f15,%f6 		! %fcc1 = 2
!	Mem[0000000030101410] = ff3effff, %l4 = 0000000000000000
	swapa	[%i4+%o5]0x81,%l4	! %l4 = 00000000ff3effff
!	%l5 = 0000000000000000, Mem[0000000030181400] = 00005aa1
	stba	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = 00005aa1
!	Mem[0000000010141410] = 00000000, %l0 = 00000000000000f5
	swapa	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141410] = f50000ff, %l6 = 00000000ffff2310
	swapa	[%i5+%o5]0x89,%l6	! %l6 = 00000000f50000ff
!	%l6 = 00000000f50000ff, Mem[0000000010101400] = 8a5e64bd
	stha	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 8a5e00ff
!	%f16 = 00000000 00001044 68000000 00000010
!	%f20 = ff0000f5 54000000 1062a465 b92ab835
!	%f24 = 46375da6 265aff0a f72db4ac 935ea4f9
!	%f28 = d0d02310 036e77e0 2ca1722d 891eac02
	stda	%f16,[%i0]ASI_BLK_SL	! Block Store to 0000000030001400
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = fffffffff33247b6, %l3 = 0000000000000000
	ldxa	[%i4+%g0]0x81,%l3	! %l3 = fffffffff33247b6

p0_label_217:
!	Mem[0000000030101408] = 1023d068, %l7 = 00000000000000f5
	lduwa	[%i4+%o4]0x89,%l7	! %l7 = 000000001023d068
!	Mem[0000000030041400] = 00000000, %l3 = fffffffff33247b6
	ldswa	[%i1+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181410] = ff000000, %l1 = 0000000000000000
	lduba	[%i6+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1410] = 9495b8c3, %l0 = 0000000000000000
	lduha	[%i3+%o5]0x80,%l0	! %l0 = 0000000000009495
!	Mem[0000000030101400] = ffffffff, %l5 = 0000000000000000
	lduha	[%i4+%g0]0x81,%l5	! %l5 = 000000000000ffff
!	Mem[0000000020800040] = ffffbf87, %l5 = 000000000000ffff
	ldsba	[%o1+0x040]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010181400] = 15f1a5c5 2ef3f120, %l6 = f50000ff, %l7 = 1023d068
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 0000000015f1a5c5 000000002ef3f120
!	Mem[0000000010081400] = 000000ff, %f14 = a15a0000
	lda	[%i2+%g0]0x88,%f14	! %f14 = 000000ff
!	Mem[0000000030101400] = ffffffff, %l0 = 0000000000009495
	lduha	[%i4+%g0]0x89,%l0	! %l0 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l6 = 15f1a5c5, %l7 = 2ef3f120, Mem[0000000010101418] = 10000000 00000000
	stda	%l6,[%i4+0x018]%asi	! Mem[0000000010101418] = 15f1a5c5 2ef3f120

p0_label_218:
!	%f6  = 9ffcffff 9a50300e, %l6 = 0000000015f1a5c5
!	Mem[0000000030001428] = f9a45e93acb42df7
	add	%i0,0x028,%g1
	stda	%f6,[%g1+%l6]ASI_PST32_S ! Mem[0000000030001428] = f9a45e939a50300e
!	%l6 = 15f1a5c5, %l7 = 2ef3f120, Mem[0000000030181410] = 5a00509a 5475fff3
	stda	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 15f1a5c5 2ef3f120
!	Mem[000000001018140d] = ffffffff, %l6 = 0000000015f1a5c5
	ldstub	[%i6+0x00d],%l6		! %l6 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (46)
!	Mem[0000000010001400] = 000000f5, %l1 = 00000000000000ff
	swapa	[%i0+%g0]0x88,%l1	! %l1 = 00000000000000f5
!	Mem[00000000300c1408] = ffffffff, %l6 = 00000000000000ff
	swapa	[%i3+%o4]0x81,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000010001408] = 70000000, %l3 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l3	! %l3 = 0000000070000000
!	%l0 = 0000ffff, %l1 = 000000f5, Mem[0000000010181408] = ffffffff ffffffff
	std	%l0,[%i6+%o4]		! Mem[0000000010181408] = 0000ffff 000000f5
!	%l4 = 00000000ff3effff, Mem[0000000010001430] = 000000ff
	stw	%l4,[%i0+0x030]		! Mem[0000000010001430] = ff3effff
!	Mem[0000000010181400] = 15f1a5c5, %l5 = ffffffffffffffff
	ldstuba	[%i6+%g0]0x80,%l5	! %l5 = 00000015000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ff000000, %f20 = ff0000f5
	lda	[%i2+%g0]0x89,%f20	! %f20 = ff000000

p0_label_219:
!	Mem[0000000030101400] = ffffffff, %f6  = 9ffcffff
	lda	[%i4+%g0]0x89,%f6 	! %f6 = ffffffff
!	Mem[0000000010181408] = 0000ffff 000000f5, %l2 = 000000ff, %l3 = 70000000
	ldda	[%i6+%o4]0x80,%l2	! %l2 = 000000000000ffff 00000000000000f5
!	Mem[0000000010181428] = f5d0fb1d, %l1 = 00000000000000f5
	ldsb	[%i6+0x029],%l1		! %l1 = ffffffffffffffd0
!	Mem[00000000100c1410] = 9495b8c3, %l4 = 00000000ff3effff
	lduba	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000094
!	Mem[0000000010101410] = 0000fbff, %l1 = ffffffffffffffd0
	lduha	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081410] = 0000ffae d0d02310, %l0 = 0000ffff, %l1 = 00000000
	ldda	[%i2+%o5]0x89,%l0	! %l0 = 00000000d0d02310 000000000000ffae
!	Mem[0000000010101430] = 00000000, %f29 = 036e77e0
	ld	[%i4+0x030],%f29	! %f29 = 00000000
!	Mem[0000000010081420] = 00000000, %l5 = 0000000000000015
	ldsb	[%i2+0x021],%l5		! %l5 = 0000000000000000
!	Mem[0000000010141420] = c3d757ff, %l0 = 00000000d0d02310
	ldub	[%i5+0x023],%l0		! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041420] = 8b6516ff5200ffff, %l7 = 000000002ef3f120, %l1 = 000000000000ffae
	add	%i1,0x20,%g1
	casxa	[%g1]0x80,%l7,%l1	! %l1 = 8b6516ff5200ffff

p0_label_220:
!	%l2 = 000000000000ffff, Mem[0000000010141408] = 878b97ef036e77e0
	stxa	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000000000ffff
!	Mem[0000000010081400] = ff000000, %l5 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010101410] = 0000fbff, %l3 = 00000000000000f5
	swapa	[%i4+%o5]0x80,%l3	! %l3 = 000000000000fbff
!	Mem[0000000030041410] = 00005a2d, %l4 = 0000000000000094
	swapa	[%i1+%o5]0x89,%l4	! %l4 = 0000000000005a2d
!	%f0  = ffffffff ffffffff ff5a0000 ffff0000
!	%f4  = 44100000 ff84ffff ffffffff 9a50300e
!	%f8  = 00000000 2ef3f120 20f1f32e 00000000
!	%f12 = 00000000 ff000000 000000ff 1dfbd0f5
	stda	%f0,[%i1]ASI_COMMIT_P	! Block Store to 0000000010041400
!	Mem[0000000030181410] = c5a5f115, %l5 = 00000000ff000000
	ldstuba	[%i6+%o5]0x89,%l5	! %l5 = 00000015000000ff
!	%l6 = 00000000ffffffff, Mem[0000000030001410] = 00000054
	stwa	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = ffffffff
	membar	#Sync			! Added by membar checker (47)
!	%l4 = 0000000000005a2d, Mem[0000000010041400] = ffffffff
	stba	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = ffffff2d
!	%f17 = 00001044, Mem[000000001010140c] = 00000000
	st	%f17,[%i4+0x00c]	! Mem[000000001010140c] = 00001044
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ffffbf87, %l5 = 0000000000000015
	ldsh	[%o1+0x040],%l5		! %l5 = ffffffffffffffff

p0_label_221:
!	Mem[0000000020800040] = ffffbf87, %l2 = 000000000000ffff
	ldub	[%o1+0x041],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010001410] = a15a0000, %l5 = ffffffffffffffff
	ldsba	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181408] = 0000ffff, %l2 = 00000000000000ff
	lduwa	[%i6+%o4]0x80,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030001408] = 00000010, %l1 = 8b6516ff5200ffff
	lduha	[%i0+%o4]0x89,%l1	! %l1 = 0000000000000010
!	Mem[000000001008142c] = 00000000, %l1 = 0000000000000010
	ldsha	[%i2+0x02c]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = 00000000 0000ffff, %l2 = 0000ffff, %l3 = 0000fbff
	ldda	[%i5+%o4]0x80,%l2	! %l2 = 0000000000000000 000000000000ffff
!	Mem[0000000030141410] = ffff2310, %l4 = 0000000000005a2d
	ldsba	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000010
!	Mem[0000000010181428] = f5d0fb1d, %l4 = 0000000000000010
	lduha	[%i6+0x028]%asi,%l4	! %l4 = 000000000000f5d0
!	Mem[0000000030181408] = 00000000, %f17 = 00001044
	lda	[%i6+%o4]0x89,%f17	! %f17 = 00000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ffffffff, Mem[0000000010141410] = 000000f5
	stwa	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffffff

p0_label_222:
!	%l3 = 000000000000ffff, Mem[00000000100c1408] = ff0000f5
	stba	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff0000f5
!	%l3 = 000000000000ffff, Mem[0000000030181408] = 0000000000000000
	stxa	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000000000ffff
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000030141400] = 00000000 00001044
	stda	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000ff 00000000
!	Mem[0000000010181438] = a15a0000, %l5 = 0000000000000000
	swap	[%i6+0x038],%l5		! %l5 = 00000000a15a0000
!	%l4 = 000000000000f5d0, Mem[0000000010101410] = f5000000
	stba	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = f50000d0
!	%f27 = 935ea4f9, Mem[0000000010101400] = ff005e8a
	sta	%f27,[%i4+%g0]0x80	! Mem[0000000010101400] = 935ea4f9
!	%f0  = ffffffff, %f27 = 935ea4f9, %f12 = 00000000
	fdivs	%f0 ,%f27,%f12		! %f12 = ffffffff
!	%l1 = 0000000000000000, Mem[0000000030101408] = 68d023100000ffae
	stxa	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000000000000000
!	%l4 = 0000f5d0, %l5 = a15a0000, Mem[0000000030101400] = ffffffff f33247b6
	stda	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000f5d0 a15a0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000000000000ff, %l6 = 00000000ffffffff
	ldxa	[%i0+%g0]0x88,%l6	! %l6 = 00000000000000ff

p0_label_223:
!	Mem[0000000010001408] = 00000000, %l6 = 00000000000000ff
	ldsha	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1400] = ffff84ff, %l3 = 000000000000ffff
	lduwa	[%i3+%g0]0x80,%l3	! %l3 = 00000000ffff84ff
!	Mem[0000000030181408] = 00000000 0000ffff, %l2 = 00000000, %l3 = ffff84ff
	ldda	[%i6+%o4]0x89,%l2	! %l2 = 000000000000ffff 0000000000000000
!	Mem[0000000030041408] = ae0000ff, %l3 = 0000000000000000
	lduba	[%i1+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081408] = a15a0000, %l0 = 00000000000000ff
	lduha	[%i2+%o4]0x80,%l0	! %l0 = 000000000000a15a
!	Mem[0000000030141408] = 00000068, %l3 = 00000000000000ff
	ldsha	[%i5+%o4]0x89,%l3	! %l3 = 0000000000000068
!	Mem[0000000010001400] = ff000000, %l7 = 000000002ef3f120
	lduwa	[%i0+0x000]%asi,%l7	! %l7 = 00000000ff000000
!	Mem[000000001004141c] = 9a50300e, %l0 = 000000000000a15a
	lduw	[%i1+0x01c],%l0		! %l0 = 000000009a50300e
!	Mem[0000000010041408] = 0000ffff 00005aff, %l0 = 9a50300e, %l1 = 00000000
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 0000000000005aff 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = f3ff7554, %l6 = 0000000000000000
	ldstuba	[%i3+%g0]0x89,%l6	! %l6 = 00000054000000ff

p0_label_224:
!	%l4 = 000000000000f5d0, Mem[0000000010081430] = 00000000bac82067, %asi = 80
	stxa	%l4,[%i2+0x030]%asi	! Mem[0000000010081430] = 000000000000f5d0
!	Mem[0000000010081410] = 0000ffff, %l1 = 000000000000ffff
	ldstuba	[%i2+%o5]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010101400] = 935ea4f9, %l1 = 00000000000000ff
	swapa	[%i4+%g0]0x80,%l1	! %l1 = 00000000935ea4f9
!	%l1 = 00000000935ea4f9, Mem[0000000030181408] = 000000000000ffff
	stxa	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000935ea4f9
!	%f4  = 44100000 ff84ffff, %l6 = 0000000000000054
!	Mem[0000000030101418] = 01000000102375ff
	add	%i4,0x018,%g1
	stda	%f4,[%g1+%l6]ASI_PST32_S ! Mem[0000000030101418] = 01000000102375ff
!	Mem[00000000201c0000] = 3eff8819, %l0 = 0000000000005aff
	ldstuba	[%o0+0x000]%asi,%l0	! %l0 = 0000003e000000ff
!	%l3 = 0000000000000068, Mem[0000000010081412] = ffff0000
	stb	%l3,[%i2+0x012]		! Mem[0000000010081410] = ffff6800
!	%l1 = 00000000935ea4f9, Mem[0000000010101408] = 00ff0000
	stba	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = f9ff0000
!	%l5 = 00000000a15a0000, Mem[00000000100c1408] = f5d0fb1df50000ff
	stxa	%l5,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000a15a0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 94000000, %l3 = 0000000000000068
	lduwa	[%i1+%o5]0x81,%l3	! %l3 = 0000000094000000

p0_label_225:
!	Mem[0000000030001408] = 00000010, %l0 = 000000000000003e
	ldswa	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000010
!	Mem[0000000030141400] = 000000ff, %l4 = 000000000000f5d0
	ldswa	[%i5+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181400] = c5a5f1ff, %f16 = 00000000
	lda	[%i6+%g0]0x88,%f16	! %f16 = c5a5f1ff
!	Mem[0000000010141428] = f3ff7554, %l2 = 000000000000ffff
	ldsba	[%i5+0x02a]%asi,%l2	! %l2 = 0000000000000075
!	Mem[0000000010101428] = 15f1a5c5, %l2 = 0000000000000075
	lduba	[%i4+0x02b]%asi,%l2	! %l2 = 00000000000000c5
!	Mem[0000000030181410] = fff1a5c52ef3f120, %l7 = 00000000ff000000
	ldxa	[%i6+%o5]0x81,%l7	! %l7 = fff1a5c52ef3f120
!	Mem[0000000010101428] = 15f1a5c5, %l7 = fff1a5c52ef3f120
	ldub	[%i4+0x02b],%l7		! %l7 = 00000000000000c5
!	Mem[0000000030041400] = 00000000, %l7 = 00000000000000c5
	ldsha	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %l5 = 00000000a15a0000
	lduba	[%i4+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = f9a45e93, %l2 = 00000000000000c5
	ldstuba	[%i6+%o4]0x81,%l2	! %l2 = 000000f9000000ff

p0_label_226:
!	Mem[0000000030181410] = c5a5f1ff, %l7 = 0000000000000000
	ldstuba	[%i6+%o5]0x89,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010041400] = ffffff2d, %l7 = 00000000000000ff
	ldstuba	[%i1+%g0]0x88,%l7	! %l7 = 0000002d000000ff
!	%l0 = 0000000000000010, Mem[0000000010081408] = 0000000000005aa1
	stxa	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000000000000010
!	%f22 = 1062a465 b92ab835, %l0 = 0000000000000010
!	Mem[0000000010181400] = fff1a5c52ef3f120
	stda	%f22,[%i6+%l0]ASI_PST16_P ! Mem[0000000010181400] = fff1a5c52ef3f120
!	%l7 = 000000000000002d, imm = 0000000000000029, %l6 = 0000000000000054
	xnor	%l7,0x029,%l6		! %l6 = fffffffffffffffb
!	Code Fragment 3
p0_fragment_28:
!	%l0 = 0000000000000010
	setx	0xc8941cc03056dc9c,%g7,%l0 ! %l0 = c8941cc03056dc9c
!	%l1 = 00000000935ea4f9
	setx	0xe4d1daf80b673d2e,%g7,%l1 ! %l1 = e4d1daf80b673d2e
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = c8941cc03056dc9c
	setx	0xe82b16b80eea3cd8,%g7,%l0 ! %l0 = e82b16b80eea3cd8
!	%l1 = e4d1daf80b673d2e
	setx	0xa8e0269f9b4d99f2,%g7,%l1 ! %l1 = a8e0269f9b4d99f2
!	%f6  = ffffffff, Mem[000000001010140c] = 00001044
	st	%f6 ,[%i4+0x00c]	! Mem[000000001010140c] = ffffffff
!	Mem[0000000030141410] = 1023ffff, %l2 = 00000000000000f9
	ldstuba	[%i5+%o5]0x81,%l2	! %l2 = 00000010000000ff
!	%f12 = ffffffff, Mem[0000000030041408] = ae0000ff
	sta	%f12,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = a15a0000, %l7 = 000000000000002d
	ldsba	[%i3+%o4]0x88,%l7	! %l7 = 0000000000000000

p0_label_227:
!	Mem[0000000020800040] = ffffbf87, %l0 = e82b16b80eea3cd8
	lduh	[%o1+0x040],%l0		! %l0 = 000000000000ffff
!	Mem[0000000010081408] = 00000010, %l4 = 00000000000000ff
	ldsha	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000010
!	Mem[0000000030181408] = ffa45e93, %l2 = 0000000000000010
	ldsha	[%i6+%o4]0x81,%l2	! %l2 = ffffffffffffffa4
!	Mem[0000000010141400] = 00000000 ff000000, %l0 = 0000ffff, %l1 = 9b4d99f2
	ldd	[%i5+%g0],%l0		! %l0 = 0000000000000000 00000000ff000000
!	Mem[00000000300c1408] = 000000ff, %l0 = 0000000000000000
	ldsba	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001400] = 44100000, %l5 = 0000000000000000
	lduwa	[%i0+%g0]0x81,%l5	! %l5 = 0000000044100000
!	Mem[0000000010141400] = 00000000, %l6 = fffffffffffffffb
	lduba	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l3 = 0000000094000000
	ldsha	[%i1+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l4 = 0000000000000010
	ldsha	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[000000001010141c] = 2ef3f120, %l5 = 0000000044100000
	ldstuba	[%i4+0x01c]%asi,%l5	! %l5 = 0000002e000000ff

p0_label_228:
!	%l4 = 0000000000000000, Mem[0000000030081410] = 1023d0d0aeff0000
	stxa	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000000000000000
!	Mem[00000000218000c0] = ff6adddc, %l2 = ffffffffffffffa4
	ldstuba	[%o3+0x0c0]%asi,%l2	! %l2 = 000000ff000000ff
!	%l5 = 000000000000002e, Mem[0000000030101410] = 00000000
	stba	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000002e
!	Mem[0000000010101414] = ffffffff, %l6 = 0000000000000000
	ldstub	[%i4+0x014],%l6		! %l6 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000030181410] = c5a5f1ff
	stwa	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	%f18 = 68000000 00000010, Mem[0000000010001400] = 000000ff 00000000
	stda	%f18,[%i0+%g0]0x88	! Mem[0000000010001400] = 68000000 00000010
!	%l5 = 000000000000002e, immed = 0000047a, %y  = 0000001d
	umul	%l5,0x47a,%l5		! %l5 = 000000000000cdec, %y = 00000000
!	Mem[0000000010181433] = 15f1a5c7, %l3 = 0000000000000000
	ldstuba	[%i6+0x033]%asi,%l3	! %l3 = 000000c7000000ff
!	%l6 = 00000000000000ff, Mem[0000000021800040] = 709c7f92, %asi = 80
	stba	%l6,[%o3+0x040]%asi	! Mem[0000000021800040] = ff9c7f92
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00000000 0000ffff, %l2 = 000000ff, %l3 = 000000c7
	ldda	[%i5+0x008]%asi,%l2	! %l2 = 0000000000000000 000000000000ffff

p0_label_229:
!	%l3 = 000000000000ffff, Mem[00000000201c0000] = ffff8819
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = ffff8819
!	Mem[0000000010001410] = 00005aa1 00000000, %l2 = 00000000, %l3 = 0000ffff
	ldda	[%i0+%o5]0x80,%l2	! %l2 = 0000000000005aa1 0000000000000000
	membar	#Sync			! Added by membar checker (48)
!	Mem[0000000010001400] = 10000000 00000068 00000000 00005aa1
!	Mem[0000000010001410] = 00005aa1 00000000 10000000 00000000
!	Mem[0000000010001420] = ffffffae 000000ff fff1a5c5 2ef3f120
!	Mem[0000000010001430] = ff3effff 00000000 8a5e64bd 00005aa1
	ldda	[%i0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010001400
!	Mem[0000000030081400] = 000000ff, %l1 = 00000000ff000000
	ldsba	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081408] = 00006ded, %l2 = 0000000000005aa1
	ldsha	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041404] = ffffffff, %l6 = 00000000000000ff
	ldsba	[%i1+0x005]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101408] = ffffffff0000fff9, %l0 = 0000000000000000
	ldxa	[%i4+%o4]0x88,%l0	! %l0 = ffffffff0000fff9
!	Mem[0000000010001408] = a15a000000000000, %f2  = ff5a0000 ffff0000
	ldda	[%i0+%o4]0x88,%f2 	! %f2  = a15a0000 00000000
!	Mem[0000000010181410] = 000000ff, %l7 = 0000000000000000
	lduha	[%i6+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000020800040] = ffffbf87
	sth	%l4,[%o1+0x040]		! Mem[0000000020800040] = 0000bf87

p0_label_230:
!	%l4 = 00000000, %l5 = 0000cdec, Mem[0000000030141410] = ff23ffff 54000000
	stda	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 0000cdec
!	Mem[00000000201c0000] = ffff8819, %l6 = ffffffffffffffff
	lduba	[%o0+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	%f11 = 00000000, Mem[0000000030081408] = ed6d0000
	sta	%f11,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%l3 = 0000000000000000, Mem[00000000100c1410] = 9495b8c3
	stba	%l3,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0095b8c3
!	%l6 = 000000ff, %l7 = 000000ff, Mem[00000000300c1408] = 000000ff 2db2ff7c
	stda	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000ff 000000ff
!	%f4  = 44100000 ff84ffff, Mem[0000000010081408] = 00000010 00000000
	stda	%f4 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 44100000 ff84ffff
!	Mem[00000000201c0001] = ffff8819, %l3 = 0000000000000000
	ldstub	[%o0+0x001],%l3		! %l3 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (49)
!	%l4 = 0000000000000000, Mem[0000000010001408] = 00000000
	stha	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	Mem[0000000010001408] = 00000000, %l0 = ffffffff0000fff9
	ldstuba	[%i0+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 935ea4ff, %f15 = 1dfbd0f5
	lda	[%i6+%o4]0x89,%f15	! %f15 = 935ea4ff

p0_label_231:
!	Mem[0000000010001410] = 00005aa100000000, %f26 = 20f1f32e c5a5f1ff
	ldda	[%i0+0x010]%asi,%f26	! %f26 = 00005aa1 00000000
!	Mem[0000000010081400] = 00000000, %f15 = 935ea4ff
	lda	[%i2+%g0]0x88,%f15	! %f15 = 00000000
!	Mem[0000000030001400] = 44100000 00000000 10000000 00000068
!	Mem[0000000030001410] = ffffffff f50000ff 35b82ab9 65a46210
!	Mem[0000000030001420] = 0aff5a26 a65d3746 f9a45e93 9a50300e
!	Mem[0000000030001430] = e0776e03 1023d0d0 02ac1e89 2d72a12c
	ldda	[%i0]ASI_BLK_AIUS,%f0	! Block Load from 0000000030001400
!	Mem[0000000030041410] = 0000000000000094, %f30 = a15a0000 bd645e8a
	ldda	[%i1+%o5]0x89,%f30	! %f30 = 00000000 00000094
!	%f19 = 00000000, %f20 = 00000000
	fsqrts	%f19,%f20		! %f20 = 00000000
!	Mem[00000000201c0000] = ffff8819, %l1 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041408] = 00005aff, %l1 = ffffffffffffffff
	ldsha	[%i1+%o4]0x88,%l1	! %l1 = 0000000000005aff
!	Mem[0000000010041408] = 00005aff, %l0 = 0000000000000000
	ldsba	[%i1+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030101408] = 00000000, %l5 = 000000000000cdec
	lduwa	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = c5a5f1ff, %l0 = ffffffffffffffff
	swapa	[%i6+%g0]0x88,%l0	! %l0 = 00000000c5a5f1ff

p0_label_232:
!	%f26 = 00005aa1 00000000, Mem[0000000010181438] = 00000000 00000000
	stda	%f26,[%i6+0x038]%asi	! Mem[0000000010181438] = 00005aa1 00000000
!	%f31 = 00000094, Mem[0000000010181410] = ff000000
	sta	%f31,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000094
	membar	#Sync			! Added by membar checker (50)
!	%l2 = 0000000000000000, Mem[0000000030001408] = 10000000
	stha	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	%l0 = 00000000c5a5f1ff, Mem[00000000201c0001] = ffff8819
	stb	%l0,[%o0+0x001]		! Mem[00000000201c0000] = ffff8819
!	Mem[0000000010081408] = ff84ffff, %l0 = 00000000c5a5f1ff
	swapa	[%i2+%o4]0x88,%l0	! %l0 = 00000000ff84ffff
!	%l5 = 0000000000000000, imm = 0000000000000834, %l0 = 00000000ff84ffff
	and	%l5,0x834,%l0		! %l0 = 0000000000000000
!	Mem[0000000010101438] = 8a5e64bd, %l6 = 00000000000000ff, %asi = 80
	swapa	[%i4+0x038]%asi,%l6	! %l6 = 000000008a5e64bd
!	%l6 = 000000008a5e64bd, Mem[0000000030141410] = 000000000000cdec
	stxa	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000008a5e64bd
!	%l0 = 0000000000000000, Mem[0000000010041430] = 00000000ff000000, %asi = 80
	stxa	%l0,[%i1+0x030]%asi	! Mem[0000000010041430] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = f3ff75ff, %l0 = 0000000000000000
	lduwa	[%i3+%g0]0x89,%l0	! %l0 = 00000000f3ff75ff

p0_label_233:
!	Mem[0000000030101400] = d0f50000, %l1 = 0000000000005aff
	lduba	[%i4+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000021800100] = ddffa03e, %l3 = 00000000000000ff
	lduba	[%o3+0x101]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081400] = 00000000, %l4 = 0000000000000000
	lduba	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041408] = ffffffff00000000, %f26 = 00005aa1 00000000
	ldda	[%i1+%o4]0x81,%f26	! %f26 = ffffffff 00000000
!	Mem[0000000021800100] = ddffa03e, %l3 = 00000000000000ff
	ldsha	[%o3+0x100]%asi,%l3	! %l3 = ffffffffffffddff
!	Mem[0000000010001400] = 68000000 00000010, %l6 = 8a5e64bd, %l7 = 000000ff
	ldda	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000010 0000000068000000
!	Mem[0000000030141408] = 00000068, %f15 = 2d72a12c
	lda	[%i5+%o4]0x89,%f15	! %f15 = 00000068
!	Mem[0000000030041410] = 94000000, %l3 = ffffffffffffddff
	ldsba	[%i1+%o5]0x81,%l3	! %l3 = ffffffffffffff94
!	Mem[0000000010101408] = ffffffff 0000fff9, %l0 = f3ff75ff, %l1 = 00000000
	ldda	[%i4+%o4]0x88,%l0	! %l0 = 000000000000fff9 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%f6  = 35b82ab9 65a46210, Mem[0000000010181410] = 00000094 00000000
	std	%f6 ,[%i6+%o5]	! Mem[0000000010181410] = 35b82ab9 65a46210

p0_label_234:
!	Mem[0000000030181408] = ffa45e93, %l3 = ffffffffffffff94
	swapa	[%i6+%o4]0x81,%l3	! %l3 = 00000000ffa45e93
!	Mem[000000001010140c] = ffffffff, %l1 = ffffffff, %l3 = ffa45e93
	add	%i4,0x0c,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 00000000ffffffff
!	%f21 = a15a0000, Mem[0000000030041400] = 00000000
	sta	%f21,[%i1+%g0]0x89	! Mem[0000000030041400] = a15a0000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010141410] = ffffffff ffffffff
	stda	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000 00000000
!	Mem[0000000010001408] = ff000000, %l0 = 000000000000fff9
	swapa	[%i0+%o4]0x80,%l0	! %l0 = 00000000ff000000
!	%f14 = 02ac1e89 00000068, %l4 = 0000000000000000
!	Mem[0000000030081410] = 0000000000000000
	add	%i2,0x010,%g1
	stda	%f14,[%g1+%l4]ASI_PST16_SL ! Mem[0000000030081410] = 0000000000000000
!	%l1 = 00000000ffffffff, Mem[000000001000141c] = 00000000, %asi = 80
	stha	%l1,[%i0+0x01c]%asi	! Mem[000000001000141c] = ffff0000
!	Mem[0000000020800040] = 0000bf87, %l4 = 0000000000000000
	ldstuba	[%o1+0x040]%asi,%l4	! %l4 = 00000000000000ff
!	%l6 = 00000010, %l7 = 68000000, Mem[0000000030041410] = 00000094 00000000
	stda	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000010 68000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = a15a0000, %f28 = 00000000
	lda	[%i0+%o5]0x88,%f28	! %f28 = a15a0000

p0_label_235:
!	Mem[0000000020800000] = f120c3ca, %l2 = 0000000000000000
	ldsba	[%o1+0x000]%asi,%l2	! %l2 = fffffffffffffff1
!	Mem[0000000010001404] = 00000068, %l0 = 00000000ff000000
	lduw	[%i0+0x004],%l0		! %l0 = 0000000000000068
!	Mem[00000000100c1410] = c3b89500, %l6 = 0000000000000010
	lduwa	[%i3+%o5]0x88,%l6	! %l6 = 00000000c3b89500
!	Mem[0000000010041400] = ffffffff, %l4 = 0000000000000000
	lduba	[%i1+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141408] = 00000068, %l3 = 00000000ffffffff
	ldsba	[%i5+%o4]0x89,%l3	! %l3 = 0000000000000068
!	%l0 = 0000000000000068, Mem[0000000030181408] = ffffff94
	stwa	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000068
!	Mem[0000000010041410] = 44100000, %f28 = a15a0000
	lda	[%i1+%o5]0x80,%f28	! %f28 = 44100000
!	%f17 = 00000010, %f9  = a65d3746, %f25 = aeffffff
	fadds	%f17,%f9 ,%f25		! %l0 = 000000000000008a, Unfinished, %fsr = 2a00000000
!	Mem[0000000010101400] = 000000ff, %f9  = a65d3746
	lda	[%i4+%g0]0x80,%f9 	! %f9 = 000000ff
!	Starting 10 instruction Store Burst
!	%l6 = 00000000c3b89500, Mem[0000000030141400] = 000000ff
	stha	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 950000ff

p0_label_236:
!	Mem[0000000030081410] = 00000000, %l2 = fffffffffffffff1
	swapa	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081408] = 00000000, %l6 = 00000000c3b89500
	ldstuba	[%i2+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000020800001] = f120c3ca, %l0 = 000000000000008a
	ldstuba	[%o1+0x001]%asi,%l0	! %l0 = 00000020000000ff
!	%f16 = 68000000 00000010 a15a0000 00000000
!	%f20 = 00000000 a15a0000 00000000 00000010
!	%f24 = ff000000 aeffffff ffffffff 00000000
!	%f28 = 44100000 ffff3eff 00000000 00000094
	stda	%f16,[%i3]ASI_BLK_AIUP	! Block Store to 00000000100c1400
!	%l4 = 00000000000000ff, Mem[00000000201c0000] = ffff8819, %asi = 80
	stba	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = ffff8819
!	%l1 = 00000000ffffffff, Mem[0000000030141410] = 00000000
	stwa	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffffff
!	Mem[0000000010181408] = ffff0000, %l4 = 00000000000000ff
	swapa	[%i6+%o4]0x88,%l4	! %l4 = 00000000ffff0000
!	Mem[0000000030181408] = 00000068, %l2 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001408] = f9ff0000, %l4 = 00000000ffff0000
	swapa	[%i0+%o4]0x88,%l4	! %l4 = 00000000f9ff0000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ff000000ff000000, %l2 = 0000000000000000
	ldxa	[%i3+%o4]0x89,%l2	! %l2 = ff000000ff000000

p0_label_237:
!	Mem[0000000030001408] = 6800000000000000, %f14 = 02ac1e89 00000068
	ldda	[%i0+%o4]0x89,%f14	! %f14 = 68000000 00000000
!	Mem[0000000010101408] = f9ff0000, %f4  = ffffffff
	lda	[%i4+%o4]0x80,%f4 	! %f4 = f9ff0000
!	Mem[00000000211c0000] = ff3efcae, %l5 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 000000000000ff3e
!	Mem[0000000030101410] = 00000000 0000002e, %l4 = f9ff0000, %l5 = 0000ff3e
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 000000000000002e 0000000000000000
	membar	#Sync			! Added by membar checker (51)
!	Mem[00000000100c1400] = 10000000 00000068, %l4 = 0000002e, %l5 = 00000000
	ldda	[%i3+%g0]0x88,%l4	! %l4 = 0000000000000068 0000000010000000
!	%l4 = 0000000000000068, imm = fffffffffffffd34, %l0 = 0000000000000020
	addc	%l4,-0x2cc,%l0		! %l0 = fffffffffffffd9c
!	Mem[0000000010101408] = f9ff0000, %l3 = 0000000000000068
	ldswa	[%i4+%o4]0x80,%l3	! %l3 = fffffffff9ff0000
!	Mem[0000000010101408] = 935ea4ff0000fff9, %l0 = fffffffffffffd9c
	ldxa	[%i4+%o4]0x88,%l0	! %l0 = 935ea4ff0000fff9
!	Mem[0000000010181408] = 000000ff, %f20 = 00000000
	lda	[%i6+%o4]0x88,%f20	! %f20 = 000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000068000000, Mem[00000000300c1400] = f3ff75ff
	stwa	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = 68000000

p0_label_238:
!	%l0 = 935ea4ff0000fff9, Mem[0000000010101410] = d00000f5
	stwa	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000fff9
!	Mem[0000000030041408] = ffffffff, %l1 = 00000000ffffffff
	swapa	[%i1+%o4]0x81,%l1	! %l1 = 00000000ffffffff
!	%f14 = 68000000, %f31 = 00000094, %f8  = 0aff5a26
	fadds	%f14,%f31,%f8 		! %l0 = 935ea4ff0001001b, Unfinished, %fsr = 2a00000000
!	%l4 = 0000000000000068, Mem[00000000211c0000] = ff3efcae, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0068fcae
!	%l3 = fffffffff9ff0000, Mem[00000000100c1400] = 00000068
	stba	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	%l1 = 00000000ffffffff, Mem[00000000211c0001] = 0068fcae
	stb	%l1,[%o2+0x001]		! Mem[00000000211c0000] = 00fffcae
!	%l6 = 00000000, %l7 = 68000000, Mem[0000000030001400] = 44100000 00000000
	stda	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 68000000
!	%l3 = fffffffff9ff0000, Mem[00000000100c1434] = ffff3eff
	sth	%l3,[%i3+0x034]		! Mem[00000000100c1434] = 00003eff
!	%f9  = 000000ff, Mem[000000001010143c] = 00005aa1
	sta	%f9 ,[%i4+0x03c]%asi	! Mem[000000001010143c] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = f9ff0000, %l3 = fffffffff9ff0000
	lduba	[%i4+%o4]0x80,%l3	! %l3 = 00000000000000f9

p0_label_239:
!	Mem[0000000030001408] = 00000000, %l5 = 0000000010000000
	lduha	[%i0+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1408] = a15a0000, %l6 = 0000000000000000
	ldsha	[%i3+%o4]0x80,%l6	! %l6 = ffffffffffffa15a
!	Mem[00000000100c1408] = a15a0000, %l6 = ffffffffffffa15a
	lduha	[%i3+%o4]0x80,%l6	! %l6 = 000000000000a15a
!	Mem[0000000010081408] = fff1a5c5, %f0  = 44100000
	lda	[%i2+%o4]0x80,%f0 	! %f0 = fff1a5c5
!	Mem[0000000010181408] = 000000ff, %l5 = 0000000000000000
	lduha	[%i6+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181408] = ff000068, %l0 = 935ea4ff0001001b
	lduha	[%i6+%o4]0x81,%l0	! %l0 = 000000000000ff00
!	Mem[0000000030181400] = a15a0000, %l1 = 00000000ffffffff
	lduwa	[%i6+%g0]0x89,%l1	! %l1 = 00000000a15a0000
	membar	#Sync			! Added by membar checker (52)
!	Mem[00000000100c1400] = 00000000 00000010 a15a0000 00000000
!	Mem[00000000100c1410] = 00000000 a15a0000 00000000 00000010
!	Mem[00000000100c1420] = ff000000 aeffffff ffffffff 00000000
!	Mem[00000000100c1430] = 44100000 00003eff 00000000 00000094
	ldda	[%i3]ASI_BLK_PL,%f16	! Block Load from 00000000100c1400
!	Mem[0000000010001414] = 00000000, %l5 = 00000000000000ff
	ldsw	[%i0+0x014],%l5		! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[00000000211c0000] = 00fffcae, %asi = 80
	stha	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0000fcae

p0_label_240:
!	%f9  = 000000ff, Mem[0000000010001408] = 0000ffff
	sta	%f9 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000ff
!	%f8  = 0aff5a26 000000ff, %l5 = 0000000000000000
!	Mem[0000000010041428] = 20f1f32e00000000
	add	%i1,0x028,%g1
	stda	%f8,[%g1+%l5]ASI_PST8_P ! Mem[0000000010041428] = 20f1f32e00000000
!	Mem[00000000300c1400] = 00000068, %l1 = 00000000a15a0000
	swapa	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000068
!	Mem[0000000010181418] = 00000000, %l6 = 0000a15a, %l6 = 0000a15a
	add	%i6,0x18,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 0000000000000000
!	%l0 = 000000000000ff00, Mem[00000000201c0000] = ffff8819
	sth	%l0,[%o0+%g0]		! Mem[00000000201c0000] = ff008819
!	%l7 = 0000000068000000, Mem[0000000030101408] = 00000000
	stwa	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 68000000
!	%l1 = 0000000000000068, Mem[0000000010181430] = 15f1a5ff44100000
	stx	%l1,[%i6+0x030]		! Mem[0000000010181430] = 0000000000000068
!	%l4 = 0000000000000068, Mem[000000001018141a] = 00000000
	sth	%l4,[%i6+0x01a]		! Mem[0000000010181418] = 00000068
!	Mem[0000000020800000] = f1ffc3ca, %l0 = 000000000000ff00
	ldstuba	[%o1+0x000]%asi,%l0	! %l0 = 000000f1000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000a15a0000, %l1 = 0000000000000068
	ldxa	[%i0+%o5]0x88,%l1	! %l1 = 00000000a15a0000

p0_label_241:
!	Mem[0000000030081410] = f1ffffff, %f1  = 00000000
	lda	[%i2+%o5]0x89,%f1 	! %f1 = f1ffffff
!	Mem[0000000010181410] = 35b82ab965a46210, %f14 = 68000000 00000000
	ldda	[%i6+%o5]0x80,%f14	! %f14 = 35b82ab9 65a46210
!	Mem[0000000030001410] = ff0000f5ffffffff, %f12 = e0776e03 1023d0d0
	ldda	[%i0+%o5]0x89,%f12	! %f12 = ff0000f5 ffffffff
!	Mem[0000000010001400] = 10000000 00000068, %l0 = 000000f1, %l1 = a15a0000
	ldda	[%i0+%g0]0x80,%l0	! %l0 = 0000000010000000 0000000000000068
!	Mem[0000000010181434] = 00000068, %l7 = 0000000068000000
	ldsb	[%i6+0x034],%l7		! %l7 = 0000000000000000
!	Mem[0000000010001400] = 68000000 00000010, %l6 = 00000000, %l7 = 00000000
	ldda	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000010 0000000068000000
!	Mem[0000000030001410] = ffffffff, %l0 = 0000000010000000
	lduwa	[%i0+%o5]0x81,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000010081418] = 000000ff, %l6 = 0000000000000010
	lduw	[%i2+0x018],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010081408] = fff1a5c5, %l6 = 00000000000000ff
	ldsba	[%i2+%o4]0x80,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f6  = 35b82ab9 65a46210, Mem[0000000010001410] = 00005aa1 00000000
	stda	%f6 ,[%i0+0x010]%asi	! Mem[0000000010001410] = 35b82ab9 65a46210

p0_label_242:
	membar	#Sync			! Added by membar checker (53)
!	%l4 = 0000000000000068, Mem[00000000100c1408] = a15a000000000000
	stxa	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000000068
!	%l0 = 00000000ffffffff, %l3 = 00000000000000f9, %l1 = 0000000000000068
	or	%l0,%l3,%l1		! %l1 = 00000000ffffffff
!	%f28 = ff3e0000 00001044, Mem[0000000010001410] = b92ab835 1062a465
	stda	%f28,[%i0+%o5]0x88	! Mem[0000000010001410] = ff3e0000 00001044
!	Mem[00000000300c1410] = 1023ffff, %l1 = 00000000ffffffff
	swapa	[%i3+%o5]0x89,%l1	! %l1 = 000000001023ffff
!	%l1 = 000000001023ffff, Mem[00000000201c0000] = ff008819, %asi = 80
	stha	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = ffff8819
!	%f2  = 10000000, %f31 = 00000000, %f25 = 000000ff
	fmuls	%f2 ,%f31,%f25		! %f25 = 00000000
!	%l7 = 0000000068000000, Mem[0000000010141410] = 00000000
	stwa	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 68000000
!	Mem[0000000021800001] = 0000b05a, %l0 = 00000000ffffffff
	ldstub	[%o3+0x001],%l0		! %l0 = 00000000000000ff
!	%f0  = fff1a5c5 f1ffffff 10000000 00000068
!	%f4  = f9ff0000 f50000ff 35b82ab9 65a46210
!	%f8  = 0aff5a26 000000ff f9a45e93 9a50300e
!	%f12 = ff0000f5 ffffffff 35b82ab9 65a46210
	stda	%f0,[%i6]ASI_BLK_S	! Block Store to 0000000030181400
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff000000, %l0 = 0000000000000000
	ldsha	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000

p0_label_243:
	membar	#Sync			! Added by membar checker (54)
!	Mem[0000000010181408] = ff000000, %l7 = 0000000068000000
	lduba	[%i6+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081424] = ffff0000, %l3 = 00000000000000f9
	lduha	[%i2+0x026]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181438] = 00005aa1, %l0 = 0000000000000000
	ldsw	[%i6+0x038],%l0		! %l0 = 0000000000005aa1
!	Mem[0000000030081400] = 000000ffc1460847, %f26 = 00000000 ffffffff
	ldda	[%i2+%g0]0x81,%f26	! %f26 = 000000ff c1460847
!	Mem[0000000030101400] = d0f50000, %l7 = 00000000000000ff
	lduwa	[%i4+%g0]0x89,%l7	! %l7 = 00000000d0f50000
!	Mem[0000000030141408] = 00000068, %l3 = 0000000000000000
	lduha	[%i5+%o4]0x89,%l3	! %l3 = 0000000000000068
!	Mem[0000000030101408] = 68000000, %l4 = 0000000000000068
	lduba	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = 00000000 a15a0000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000 00000000a15a0000
!	%l3 = 0000000000000068, Mem[0000000030001408] = 00000000
	stba	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000068
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = a15a0000, %l4 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l4	! %l4 = 000000a1000000ff

p0_label_244:
!	Mem[00000000300c1400] = ff5a0000, %l7 = 00000000d0f50000
	ldstuba	[%i3+%g0]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010141437] = ffffffff, %l6 = ffffffffffffffff
	ldstuba	[%i5+0x037]%asi,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030101408] = 68000000, %l5 = 00000000a15a0000
	ldstuba	[%i4+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%l1 = 000000001023ffff, Mem[0000000010101420] = ff000000000000ff, %asi = 80
	stxa	%l1,[%i4+0x020]%asi	! Mem[0000000010101420] = 000000001023ffff
!	Mem[0000000010041408] = ff5a0000, %l5 = 0000000000000000
	ldsha	[%i1+%o4]0x80,%l5	! %l5 = ffffffffffffff5a
!	Mem[0000000030101400] = d0f50000, %l3 = 0000000000000068
	ldstuba	[%i4+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[000000001010143c] = 000000ff, %l0 = 0000000000005aa1, %asi = 80
	swapa	[%i4+0x03c]%asi,%l0	! %l0 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[000000001014142c] = 00000000, %asi = 80
	stwa	%l6,[%i5+0x02c]%asi	! Mem[000000001014142c] = 000000ff
!	%l7 = 00000000000000ff, Mem[0000000030181408] = 10000000
	stha	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = 00ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ff000000, %l5 = ffffffffffffff5a
	ldswa	[%i6+%o4]0x80,%l5	! %l5 = ffffffffff000000

p0_label_245:
!	Mem[00000000300c1400] = 00005aff, %l7 = 00000000000000ff
	ldswa	[%i3+%g0]0x89,%l7	! %l7 = 0000000000005aff
!	Mem[0000000030141410] = ffffffff, %l2 = ff000000ff000000
	lduwa	[%i5+%o5]0x89,%l2	! %l2 = 00000000ffffffff
!	Mem[00000000211c0000] = 0000fcae, %l7 = 0000000000005aff
	ldsb	[%o2+0x001],%l7		! %l7 = 0000000000000000
!	Mem[0000000010181410] = 35b82ab9, %l6 = 00000000000000ff
	lduba	[%i6+0x012]%asi,%l6	! %l6 = 000000000000002a
!	Mem[0000000010001408] = ff000000, %l0 = 00000000000000ff
	lduwa	[%i0+%o4]0x88,%l0	! %l0 = 00000000ff000000
!	Mem[0000000010081420] = 00000000ffff0000, %l3 = 0000000000000000
	ldxa	[%i2+0x020]%asi,%l3	! %l3 = 00000000ffff0000
!	%l7 = 0000000000000000, %l4 = 00000000000000a1, %l1 = 000000001023ffff
	sub	%l7,%l4,%l1		! %l1 = ffffffffffffff5f
!	Mem[0000000030101408] = 00000000680000ff, %l6 = 000000000000002a
	ldxa	[%i4+%o4]0x89,%l6	! %l6 = 00000000680000ff
!	Mem[0000000010101400] = ff000000, %f19 = 00005aa1
	lda	[%i4+%g0]0x88,%f19	! %f19 = ff000000
!	Starting 10 instruction Store Burst
!	%l2 = ffffffff, %l3 = ffff0000, Mem[0000000010041400] = ffffffff ffffffff
	stda	%l2,[%i1+0x000]%asi	! Mem[0000000010041400] = ffffffff ffff0000

p0_label_246:
!	%l2 = 00000000ffffffff, Mem[0000000010101438] = 000000ff00005aa1
	stx	%l2,[%i4+0x038]		! Mem[0000000010101438] = 00000000ffffffff
!	Mem[0000000010181419] = 00000068, %l0 = 00000000ff000000
	ldstuba	[%i6+0x019]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081410] = 0068ffff, %l7 = 0000000000000000
	swapa	[%i2+%o5]0x88,%l7	! %l7 = 000000000068ffff
!	Mem[0000000010141408] = 00000000, %l5 = ffffffffff000000
	ldstuba	[%i5+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	%f10 = f9a45e93 9a50300e, %l2 = 00000000ffffffff
!	Mem[0000000030041418] = 1000000000000000
	add	%i1,0x018,%g1
	stda	%f10,[%g1+%l2]ASI_PST8_S ! Mem[0000000030041418] = f9a45e939a50300e
!	Mem[0000000010141410] = 68000000, %l7 = 000000000068ffff
	ldstuba	[%i5+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%f4  = f9ff0000 f50000ff, Mem[0000000010181410] = b92ab835 1062a465
	stda	%f4 ,[%i6+%o5]0x88	! Mem[0000000010181410] = f9ff0000 f50000ff
!	%l4 = 000000a1, %l5 = 00000000, Mem[0000000030081400] = 000000ff c1460847
	stda	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000a1 00000000
!	Code Fragment 4
p0_fragment_29:
!	%l0 = 0000000000000000
	setx	0x17ca6a78701fe6bb,%g7,%l0 ! %l0 = 17ca6a78701fe6bb
!	%l1 = ffffffffffffff5f
	setx	0x0f06dde06c306736,%g7,%l1 ! %l1 = 0f06dde06c306736
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 17ca6a78701fe6bb
	setx	0x362dd617cd7edba1,%g7,%l0 ! %l0 = 362dd617cd7edba1
!	%l1 = 0f06dde06c306736
	setx	0x9386af3faadfc218,%g7,%l1 ! %l1 = 9386af3faadfc218
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000068, %l3 = 00000000ffff0000
	ldsba	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000068

p0_label_247:
!	Mem[00000000100c1408] = 00000000, %f0  = fff1a5c5
	lda	[%i3+%o4]0x88,%f0 	! %f0 = 00000000
!	Mem[0000000030041400] = 00005aa1, %l3 = 0000000000000068
	ldsba	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = 680000ff, %l1 = 9386af3faadfc218
	lduba	[%i5+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181400] = ffffffff, %l3 = 0000000000000000
	lduba	[%i6+0x002]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101438] = 00000000, %f24 = ffffffae
	ld	[%i4+0x038],%f24	! %f24 = 00000000
!	Mem[0000000020800000] = ffffc3ca, %l5 = 0000000000000000
	ldsb	[%o1+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[00000000100c1434] = 00003eff, %l4 = 00000000000000a1
	ldsha	[%i3+0x034]%asi,%l4	! %l4 = 0000000000000000
!	Mem[000000001018141c] = 00ff0000, %l4 = 0000000000000000
	ldsha	[%i6+0x01c]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001410] = ffffffff, %l7 = 0000000000000000
	lduwa	[%i0+%o5]0x89,%l7	! %l7 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[0000000010001410] = 00001044
	stba	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 000010ff

p0_label_248:
!	%f4  = f9ff0000 f50000ff, %l1 = 00000000000000ff
!	Mem[0000000030081418] = 0000000000000010
	add	%i2,0x018,%g1
	stda	%f4,[%g1+%l1]ASI_PST16_S ! Mem[0000000030081418] = f9ff0000f50000ff
!	%l5 = ffffffffffffffff, %l1 = 00000000000000ff, %y  = 00000000
	sdiv	%l5,%l1,%l4		! %l4 = 0000000001010101
	mov	%l0,%y			! %y = cd7edba1
!	%f28 = ff3e0000 00001044, Mem[0000000010081400] = 00000000 00000091
	stda	%f28,[%i2+%g0]0x80	! Mem[0000000010081400] = ff3e0000 00001044
!	%l6 = 00000000680000ff, Mem[0000000030041408] = ffffffff
	stwa	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 680000ff
!	Mem[0000000010101410] = f9ff0000, %l4 = 0000000001010101
	ldstuba	[%i4+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%l6 = 00000000680000ff, Mem[000000001010140c] = ffa45e93
	sth	%l6,[%i4+0x00c]		! Mem[000000001010140c] = 00ff5e93
!	%l0 = cd7edba1, %l1 = 000000ff, Mem[0000000030081408] = 000000ff a1000000
	stda	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = cd7edba1 000000ff
!	%l6 = 00000000680000ff, Mem[00000000211c0000] = 0000fcae, %asi = 80
	stha	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00fffcae
!	%l7 = 00000000ffffffff, Mem[0000000010001400] = 00000010
	stba	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800000] = 00ffb05a, %l3 = 00000000000000ff
	ldsb	[%o3+%g0],%l3		! %l3 = 0000000000000000

p0_label_249:
!	Mem[0000000010141400] = 00000000, %l5 = ffffffffffffffff
	lduba	[%i5+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1410] = ffffffff, %f12 = ff0000f5
	lda	[%i3+%o5]0x81,%f12	! %f12 = ffffffff
!	Mem[0000000010181410] = ff0000f5, %l3 = 0000000000000000
	ldsha	[%i6+%o5]0x80,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000010001410] = 000010ff, %l4 = 0000000000000000
	lduha	[%i0+%o5]0x88,%l4	! %l4 = 00000000000010ff
!	Mem[0000000030181410] = f9ff0000, %l6 = 00000000680000ff
	ldswa	[%i6+%o5]0x81,%l6	! %l6 = fffffffff9ff0000
!	Mem[0000000030181400] = fffffff1c5a5f1ff, %l2 = 00000000ffffffff
	ldxa	[%i6+%g0]0x89,%l2	! %l2 = fffffff1c5a5f1ff
!	Mem[00000000100c1400] = 00000000, %l0 = 362dd617cd7edba1
	ldsba	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081400] = ff3e0000 00001044, %l4 = 000010ff, %l5 = 00000000
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 00000000ff3e0000 0000000000001044
!	%l3 = ffffffffffffff00, immed = 00000ae3, %y  = cd7edba1
	udiv	%l3,0xae3,%l5		! %l5 = 00000000ffffffff
	mov	%l0,%y			! %y = 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = fff1a5c5, %l3 = ffffffffffffff00
	ldstuba	[%i2+%o4]0x80,%l3	! %l3 = 000000ff000000ff

p0_label_250:
!	%f14 = 35b82ab9 65a46210, Mem[0000000010081410] = 00000000 00000000
	stda	%f14,[%i2+%o5]0x88	! Mem[0000000010081410] = 35b82ab9 65a46210
!	%l2 = fffffff1c5a5f1ff, Mem[0000000010141420] = c3d757ff, %asi = 80
	stwa	%l2,[%i5+0x020]%asi	! Mem[0000000010141420] = c5a5f1ff
!	Mem[0000000010141434] = ffffffff, %l4 = 00000000ff3e0000
	ldstuba	[%i5+0x034]%asi,%l4	! %l4 = 000000ff000000ff
!	%l4 = 00000000000000ff, Mem[0000000010101418] = 15f1a5c5fff3f120, %asi = 80
	stxa	%l4,[%i4+0x018]%asi	! Mem[0000000010101418] = 00000000000000ff
!	%l2 = fffffff1c5a5f1ff, Mem[0000000030181400] = c5a5f1ff
	stba	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = c5a5f1ff
!	Mem[000000001004140c] = ffff0000, %l5 = 00000000ffffffff, %asi = 80
	swapa	[%i1+0x00c]%asi,%l5	! %l5 = 00000000ffff0000
!	%l6 = f9ff0000, %l7 = ffffffff, Mem[0000000010101410] = f9ff00ff ffffffff
	stda	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = f9ff0000 ffffffff
!	%l7 = 00000000ffffffff, Mem[00000000211c0001] = 00fffcae
	stb	%l7,[%o2+0x001]		! Mem[00000000211c0000] = 00fffcae
!	%f12 = ffffffff ffffffff, Mem[0000000010001420] = ffffffae 000000ff
	stda	%f12,[%i0+0x020]%asi	! Mem[0000000010001420] = ffffffff ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ffffffff, %l4 = 00000000000000ff
	lduba	[%i5+%o5]0x81,%l4	! %l4 = 00000000000000ff

p0_label_251:
!	Mem[0000000010001400] = 000000ff, %l1 = 00000000000000ff
	ldstuba	[%i0+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	%f22 = 10000000, %f4  = f9ff0000, %f1  = f1ffffff
	fdivs	%f22,%f4 ,%f1 		! %f1  = 80000000
!	Mem[0000000030101408] = 680000ff, %l4 = 00000000000000ff
	lduwa	[%i4+%o4]0x89,%l4	! %l4 = 00000000680000ff
!	Mem[0000000010141408] = 000000ff, %f24 = 00000000
	lda	[%i5+%o4]0x88,%f24	! %f24 = 000000ff
!	Mem[0000000010141408] = ff0000000000ffff, %f20 = 00005aa1 00000000
	ldda	[%i5+%o4]0x80,%f20	! %f20 = ff000000 0000ffff
!	Mem[0000000010081408] = c5a5f1ff, %f21 = 0000ffff
	lda	[%i2+%o4]0x88,%f21	! %f21 = c5a5f1ff
!	Mem[0000000010101408] = 0000fff9, %l0 = 0000000000000000
	ldsba	[%i4+%o4]0x88,%l0	! %l0 = fffffffffffffff9
!	Mem[00000000201c0000] = ffff8819, %l3 = 00000000000000ff
	ldsba	[%o0+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000100c1410] = 00000000, %l6 = fffffffff9ff0000
	lduha	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[000000001008140c] = 00001044, %l0 = fffffffffffffff9
	swap	[%i2+0x00c],%l0		! %l0 = 0000000000001044

p0_label_252:
!	Mem[0000000030081410] = fffffff1, %l3 = ffffffffffffffff
	swapa	[%i2+%o5]0x81,%l3	! %l3 = 00000000fffffff1
!	Mem[0000000030041400] = 00005aa1, %l5 = 00000000ffff0000
	ldstuba	[%i1+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	%f0  = 00000000 80000000 10000000 00000068
!	%f4  = f9ff0000 f50000ff 35b82ab9 65a46210
!	%f8  = 0aff5a26 000000ff f9a45e93 9a50300e
!	%f12 = ffffffff ffffffff 35b82ab9 65a46210
	stda	%f0,[%i6]ASI_BLK_AIUPL	! Block Store to 0000000010181400
!	%f28 = ff3e0000 00001044, %l5 = 0000000000000000
!	Mem[0000000030141418] = 1062a465b92ab835
	add	%i5,0x018,%g1
	stda	%f28,[%g1+%l5]ASI_PST16_S ! Mem[0000000030141418] = 1062a465b92ab835
	membar	#Sync			! Added by membar checker (55)
!	Mem[0000000010181400] = 80000000, %l2 = fffffff1c5a5f1ff
	swapa	[%i6+%g0]0x88,%l2	! %l2 = 0000000080000000
!	Mem[0000000010181410] = ff0000f5, %l6 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l6	! %l6 = 00000000ff0000f5
!	%l3 = 00000000fffffff1, Mem[00000000211c0000] = 00fffcae, %asi = 80
	stba	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = f1fffcae
!	%f6  = 35b82ab9 65a46210, %l5 = 0000000000000000
!	Mem[0000000030181430] = ff0000f5ffffffff
	add	%i6,0x030,%g1
	stda	%f6,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030181430] = ff0000f5ffffffff
!	%f10 = f9a45e93 9a50300e, Mem[0000000030181410] = 0000fff9 ff0000f5
	stda	%f10,[%i6+%o5]0x89	! Mem[0000000030181410] = f9a45e93 9a50300e
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 2e00000000000000, %l4 = 00000000680000ff
	ldxa	[%i4+%o5]0x81,%l4	! %l4 = 2e00000000000000

p0_label_253:
!	Mem[0000000030081400] = 000000a1, %l3 = 00000000fffffff1
	lduwa	[%i2+%g0]0x81,%l3	! %l3 = 00000000000000a1
!	Mem[00000000100c1408] = 00000000, %l0 = 0000000000001044
	ldsha	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800000] = ffffc3ca, %l5 = 0000000000000000
	lduha	[%o1+0x000]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030181410] = 9a50300e, %f13 = ffffffff
	lda	[%i6+%o5]0x89,%f13	! %f13 = 9a50300e
!	Mem[00000000201c0000] = ffff8819, %l6 = 00000000ff0000f5
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010141410] = ff000068, %l7 = 00000000ffffffff
	lduwa	[%i5+%o5]0x80,%l7	! %l7 = 00000000ff000068
!	Mem[00000000100c1400] = 00000000 00000010 00000000 00000068
!	Mem[00000000100c1410] = 00000000 a15a0000 00000000 00000010
!	Mem[00000000100c1420] = ff000000 aeffffff ffffffff 00000000
!	Mem[00000000100c1430] = 44100000 00003eff 00000000 00000094
	ldda	[%i3]ASI_BLK_PL,%f0	! Block Load from 00000000100c1400
!	Mem[0000000030041408] = ff000068, %l3 = 00000000000000a1
	lduba	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000068
!	Mem[0000000010101420] = 00000000, %l6 = 000000000000ffff
	ldswa	[%i4+0x020]%asi,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f20 = ff000000, Mem[0000000030101408] = ff000068
	sta	%f20,[%i4+%o4]0x81	! Mem[0000000030101408] = ff000000

p0_label_254:
!	Mem[0000000030081400] = 000000a1, %l0 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l0	! %l0 = 00000000000000a1
!	%l2 = 0000000080000000, Mem[00000000211c0000] = f1fffcae
	sth	%l2,[%o2+%g0]		! Mem[00000000211c0000] = 0000fcae
!	%l2 = 0000000080000000, Mem[0000000030001408] = 00000068
	stba	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	Mem[0000000030081410] = ffffffff, %l6 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l6	! %l6 = 000000ff000000ff
!	%l4 = 2e00000000000000, %l5 = 000000000000ffff, %l4  = 2e00000000000000
	mulx	%l4,%l5,%l4		! %l4 = d200000000000000
!	Mem[0000000020800041] = ff00bf87, %l1 = 00000000000000ff
	ldstub	[%o1+0x041],%l1		! %l1 = 00000000000000ff
!	%l0 = 000000a1, %l1 = 00000000, Mem[0000000010141408] = 000000ff ffff0000
	stda	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000a1 00000000
!	%f16 = 10000000 00000000 00000000 ff000000
!	%f20 = ff000000 c5a5f1ff 10000000 00000000
!	%f24 = 000000ff 00000000 000000ff c1460847
!	%f28 = ff3e0000 00001044 94000000 00000000
	stda	%f16,[%i1]ASI_BLK_S	! Block Store to 0000000030041400
!	Mem[0000000030101400] = d0f500ff, %l0 = 00000000000000a1
	swapa	[%i4+%g0]0x89,%l0	! %l0 = 00000000d0f500ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l5 = 000000000000ffff
	ldswa	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000

p0_label_255:
!	Mem[00000000300c1400] = ff5a000000001044, %l5 = 0000000000000000
	ldxa	[%i3+%g0]0x81,%l5	! %l5 = ff5a000000001044
!	Mem[000000001000140c] = 00005aa1, %l6 = 00000000000000ff
	lduh	[%i0+0x00e],%l6		! %l6 = 0000000000005aa1
!	Mem[0000000010181410] = f9ff000000000000, %f12 = ff3e0000 00001044
	ldda	[%i6+%o5]0x88,%f12	! %f12 = f9ff0000 00000000
!	Mem[00000000201c0000] = ffff8819, %l0 = 00000000d0f500ff
	lduh	[%o0+%g0],%l0		! %l0 = 000000000000ffff
!	Mem[0000000010101410] = f9ff0000, %l1 = 0000000000000000
	ldsba	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800040] = ffffbf87, %l2 = 0000000080000000
	ldsb	[%o1+0x040],%l2		! %l2 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (56)
!	Mem[0000000010041410] = ffff84ff00001044, %f14 = 94000000 00000000
	ldda	[%i1+%o5]0x88,%f14	! %f14 = ffff84ff 00001044
!	Mem[00000000100c1400] = 1000000000000000, %f12 = f9ff0000 00000000
	ldda	[%i3+%g0]0x88,%f12	! %f12 = 10000000 00000000
!	Mem[0000000010081400] = 00003eff, %l6 = 0000000000005aa1
	ldswa	[%i2+%g0]0x88,%l6	! %l6 = 0000000000003eff
!	Starting 10 instruction Store Burst
!	%f24 = 000000ff 00000000, %l1 = 0000000000000000
!	Mem[0000000010101438] = 00000000ffffffff
	add	%i4,0x038,%g1
	stda	%f24,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010101438] = 00000000ffffffff

p0_label_256:
!	%l6 = 0000000000003eff, Mem[0000000010181400] = c5a5f1ff
	stha	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = c5a53eff
!	%l0 = 0000ffff, %l1 = 00000000, Mem[0000000030001400] = 00000000 00000068
	stda	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000ffff 00000000
!	Mem[00000000211c0000] = 0000fcae, %l2 = ffffffffffffffff
	ldstub	[%o2+%g0],%l2		! %l2 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000010041400] = ffffffff
	stha	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = ffff0000
!	%l3 = 0000000000000068, Mem[0000000010141410] = 680000ff
	stwa	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000068
!	%f22 = 10000000 00000000, Mem[0000000010001430] = ff3effff 00000000
	std	%f22,[%i0+0x030]	! Mem[0000000010001430] = 10000000 00000000
!	Mem[0000000010181400] = ff3ea5c5, %l7 = ff000068, %l1 = 00000000
	casa	[%i6]0x80,%l7,%l1	! %l1 = 00000000ff3ea5c5
!	Mem[0000000030041410] = 000000ff, %l2 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1408] = ff000000, %l1 = 00000000ff3ea5c5
	swapa	[%i3+%o4]0x89,%l1	! %l1 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000 00000068, %l0 = 0000ffff, %l1 = ff000000
	ldda	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000000 0000000000000068

p0_label_257:
!	Mem[0000000020800040] = ffffbf87, %l1 = 0000000000000068
	ldsb	[%o1+0x041],%l1		! %l1 = ffffffffffffffff
!	%l0 = 0000000000000000, %l0 = 0000000000000000, %l7  = 00000000ff000068
	mulx	%l0,%l0,%l7		! %l7 = 0000000000000000
!	Mem[0000000030041408] = 000000ff00000000, %f18 = 00000000 ff000000
	ldda	[%i1+%o4]0x89,%f18	! %f18 = 000000ff 00000000
!	Mem[0000000020800040] = ffffbf87, %l5 = ff5a000000001044
	lduba	[%o1+0x041]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001400] = ffff0000 00000000, %l2 = 000000ff, %l3 = 00000068
	ldda	[%i0+%g0]0x81,%l2	! %l2 = 00000000ffff0000 0000000000000000
!	Mem[000000001004140c] = ffffffff, %l6 = 0000000000003eff
	ldswa	[%i1+0x00c]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030141410] = ffffffff, %l3 = 0000000000000000
	ldsha	[%i5+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030041400] = 10000000, %l0 = 0000000000000000
	lduha	[%i1+%g0]0x81,%l0	! %l0 = 0000000000001000
!	Mem[0000000030081408] = a1db7ecdff000000, %f10 = 00000000 ffffffff
	ldda	[%i2+%o4]0x81,%f10	! %f10 = a1db7ecd ff000000
!	Starting 10 instruction Store Burst
!	%l2 = ffff0000, %l3 = ffffffff, Mem[0000000010081438] = ff0000f5 00005ca1
	stda	%l2,[%i2+0x038]%asi	! Mem[0000000010081438] = ffff0000 ffffffff

p0_label_258:
!	Code Fragment 4
p0_fragment_30:
!	%l0 = 0000000000001000
	setx	0x71d54ae7cb8540e3,%g7,%l0 ! %l0 = 71d54ae7cb8540e3
!	%l1 = ffffffffffffffff
	setx	0x4cf4e4f7913680ba,%g7,%l1 ! %l1 = 4cf4e4f7913680ba
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 71d54ae7cb8540e3
	setx	0xf98f6a3fe2691aac,%g7,%l0 ! %l0 = f98f6a3fe2691aac
!	%l1 = 4cf4e4f7913680ba
	setx	0x656064b04b0eda4f,%g7,%l1 ! %l1 = 656064b04b0eda4f
!	%f5  = 00000000, Mem[000000001000141c] = ffff0000
	sta	%f5 ,[%i0+0x01c]%asi	! Mem[000000001000141c] = 00000000
!	Mem[00000000100c141e] = 00000010, %l2 = 00000000ffff0000
	ldstub	[%i3+0x01e],%l2		! %l2 = 00000000000000ff
!	%f11 = ff000000, Mem[00000000300c1400] = ff5a0000
	sta	%f11,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff000000
!	%l1 = 656064b04b0eda4f, Mem[0000000030081410] = ffffffff
	stha	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = da4fffff
!	Mem[0000000030181408] = 00ff0000, %l1 = 656064b04b0eda4f
	ldstuba	[%i6+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000030101408] = 000000ff
	stba	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	%l5 = 00000000000000ff, Mem[0000000010101410] = 0000fff9
	stba	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = ff00fff9
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff000000, %l1 = 0000000000000000
	lduha	[%i4+%g0]0x88,%l1	! %l1 = 0000000000000000

p0_label_259:
!	Mem[0000000030001400] = 000000000000ffff, %l6 = ffffffffffffffff
	ldxa	[%i0+%g0]0x89,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030101410] = 000000000000002e, %l6 = 000000000000ffff
	ldxa	[%i4+%o5]0x89,%l6	! %l6 = 000000000000002e
!	Mem[0000000010141408] = 000000a1, %f16 = 10000000
	lda	[%i5+%o4]0x88,%f16	! %f16 = 000000a1
!	Mem[0000000030041408] = 00000000, %l3 = ffffffffffffffff
	ldswa	[%i1+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081410] = 1062a465, %l7 = 0000000000000000
	ldsba	[%i2+%o5]0x80,%l7	! %l7 = 0000000000000010
!	Mem[00000000100c1408] = 00000000, %f14 = ffff84ff
	lda	[%i3+%o4]0x88,%f14	! %f14 = 00000000
!	Mem[0000000010081410] = 35b82ab965a46210, %l6 = 000000000000002e
	ldxa	[%i2+%o5]0x88,%l6	! %l6 = 35b82ab965a46210
!	Mem[0000000030081410] = ffff4fda, %l4 = d200000000000000
	ldswa	[%i2+%o5]0x89,%l4	! %l4 = ffffffffffff4fda
!	Mem[00000000100c1410] = 00000000a15a0000, %l7 = 0000000000000010
	ldxa	[%i3+%o5]0x80,%l7	! %l7 = 00000000a15a0000
!	Starting 10 instruction Store Burst
!	%l4 = ffff4fda, %l5 = 000000ff, Mem[0000000030001400] = ffff0000 00000000
	stda	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = ffff4fda 000000ff

p0_label_260:
!	%l4 = ffffffffffff4fda, Mem[0000000030041408] = 00000000
	stha	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 4fda0000
!	Mem[00000000100c1408] = 00000000, %l4 = ffffffffffff4fda
	swapa	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0000] = ffff8819, %l3 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030001408] = 00000000, %l7 = 00000000a15a0000
	ldstuba	[%i0+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101400] = ff000000, %l4 = 0000000000000000
	swapa	[%i4+%g0]0x88,%l4	! %l4 = 00000000ff000000
!	%l7 = 0000000000000000, Mem[0000000010001410] = ff3e0000000010ff
	stxa	%l7,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000000000
!	%l4 = ff000000, %l5 = 000000ff, Mem[0000000010041420] = 00000000 2ef3f120
	std	%l4,[%i1+0x020]		! Mem[0000000010041420] = ff000000 000000ff
!	Mem[0000000010181408] = 00000068, %l5 = 00000000000000ff
	ldstuba	[%i6+%o4]0x88,%l5	! %l5 = 00000068000000ff
!	%l7 = 0000000000000000, Mem[0000000030001410] = fffffffff50000ff
	stxa	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff000000, %l6 = 35b82ab965a46210
	lduwa	[%i0+%o4]0x88,%l6	! %l6 = 00000000ff000000

p0_label_261:
!	Mem[0000000010001408] = ff000000, %l4 = 00000000ff000000
	lduha	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141410] = bd645e8affffffff, %l3 = 00000000000000ff
	ldxa	[%i5+%o5]0x89,%l3	! %l3 = bd645e8affffffff
!	Mem[0000000010101400] = 00000000, %l7 = 0000000000000000
	ldsha	[%i4+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = ff000000 00000010, %l0 = e2691aac, %l1 = 00000000
	ldda	[%i6+%o4]0x80,%l0	! %l0 = 00000000ff000000 0000000000000010
!	Mem[0000000010181410] = ff000000, %l5 = 0000000000000068
	lduha	[%i6+%o5]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030141400] = 950000ff00000000, %f0  = 10000000 00000000
	ldda	[%i5+%g0]0x81,%f0 	! %f0  = 950000ff 00000000
!	%l7 = 0000000000000000, imm = 0000000000000d5b, %l2 = 0000000000000000
	and	%l7,0xd5b,%l2		! %l2 = 0000000000000000
!	%f25 = 00000000, %f25 = 00000000, %f5  = 00000000
	fmuls	%f25,%f25,%f5 		! %f5  = 00000000
!	Mem[0000000030141408] = 1000000000000068, %f16 = 000000a1 00000000
	ldda	[%i5+%o4]0x89,%f16	! %f16 = 10000000 00000068
!	Starting 10 instruction Store Burst
!	%f14 = 00000000 00001044, Mem[0000000010181400] = c5a53eff 00000000
	stda	%f14,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000 00001044

p0_label_262:
!	%f12 = 10000000 00000000, %l5 = 000000000000ff00
!	Mem[0000000030001400] = ffff4fda000000ff
	stda	%f12,[%i0+%l5]ASI_PST32_S ! Mem[0000000030001400] = ffff4fda000000ff
!	%l2 = 00000000, %l3 = ffffffff, Mem[0000000010181438] = 1062a465 b92ab835
	std	%l2,[%i6+0x038]		! Mem[0000000010181438] = 00000000 ffffffff
!	%f9  = 000000ff, %f21 = c5a5f1ff, %f26 = 000000ff
	fmuls	%f9 ,%f21,%f26		! %l0 = 00000000ff000022, Unfinished, %fsr = 2a00000000
!	%l7 = 0000000000000000, Mem[0000000030181400] = c5a5f1ff
	stwa	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	%f14 = 00000000 00001044, Mem[0000000010181400] = 44100000 00000000
	stda	%f14,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 00001044
!	%f22 = 10000000 00000000, Mem[0000000030001400] = ffff4fda 000000ff
	stda	%f22,[%i0+%g0]0x81	! Mem[0000000030001400] = 10000000 00000000
!	%l4 = 0000000000000000, Mem[00000000211c0000] = ff00fcae, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0000fcae
!	%l3 = bd645e8affffffff, imm = 0000000000000a9f, %l2 = 0000000000000000
	subc	%l3,0xa9f,%l2		! %l2 = bd645e8afffff560
!	%f0  = 950000ff 00000000, Mem[0000000030181400] = 00000000 f1ffffff
	stda	%f0 ,[%i6+%g0]0x81	! Mem[0000000030181400] = 950000ff 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l5 = 000000000000ff00
	lduba	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000

p0_label_263:
!	Mem[00000000300c1400] = 44100000000000ff, %f8  = ffffffae 000000ff
	ldda	[%i3+%g0]0x89,%f8 	! %f8  = 44100000 000000ff
!	Mem[0000000010101408] = f9ff000000ff5e93, %l0 = 00000000ff000022
	ldxa	[%i4+%o4]0x80,%l0	! %l0 = f9ff000000ff5e93
!	Mem[0000000030081408] = cd7edba1, %f23 = 00000000
	lda	[%i2+%o4]0x89,%f23	! %f23 = cd7edba1
!	Mem[0000000010041424] = 000000ff, %f13 = 00000000
	ld	[%i1+0x024],%f13	! %f13 = 000000ff
!	Mem[0000000030041408] = 4fda0000, %l3 = bd645e8affffffff
	ldsba	[%i1+%o4]0x81,%l3	! %l3 = 000000000000004f
!	Mem[0000000021800180] = 66ff8f81, %l4 = 0000000000000000
	ldub	[%o3+0x181],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030041400] = 10000000, %l0 = f9ff000000ff5e93
	ldsba	[%i1+%g0]0x81,%l0	! %l0 = 0000000000000010
!	Mem[0000000010141400] = 00000000, %l2 = bd645e8afffff560
	ldswa	[%i5+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001400] = 00000010, %l1 = 0000000000000010
	ldswa	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000010
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000010, imm = 000000000000008f, %l4 = 00000000000000ff
	add	%l0,0x08f,%l4		! %l4 = 000000000000009f

p0_label_264:
!	%f20 = ff000000 c5a5f1ff, %l3 = 000000000000004f
!	Mem[0000000030101408] = 0000000000000000
	add	%i4,0x008,%g1
	stda	%f20,[%g1+%l3]ASI_PST16_S ! Mem[0000000030101408] = ff000000c5a5f1ff
!	%f26 = 000000ff, Mem[00000000300c1400] = 000000ff
	sta	%f26,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ff
!	%l5 = 0000000000000000, Mem[0000000030141408] = 1000000000000068
	stxa	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000000000000000
!	%f20 = ff000000, Mem[0000000010001410] = 00000000
	sta	%f20,[%i0+%o5]0x80	! Mem[0000000010001410] = ff000000
!	Mem[0000000030001400] = 00000010, %l4 = 000000000000009f
	swapa	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000010
!	Mem[00000000300c1408] = ff3ea5c5, %l2 = 0000000000000000
	lduha	[%i3+%o4]0x89,%l2	! %l2 = 000000000000a5c5
!	%f31 = 00000000, Mem[0000000030141400] = ff000095
	sta	%f31,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	Mem[00000000201c0001] = ffff8819, %l6 = 00000000ff000000
	ldstub	[%o0+0x001],%l6		! %l6 = 000000ff000000ff
!	Mem[0000000010141410] = 00000068, %l7 = 0000000000000000
	ldstuba	[%i5+%o5]0x88,%l7	! %l7 = 00000068000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 0000ffff, %f10 = a1db7ecd
	lda	[%i6+%o4]0x89,%f10	! %f10 = 0000ffff

p0_label_265:
!	Mem[0000000030181408] = ffff0000, %l0 = 0000000000000010
	ldsba	[%i6+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010081410] = 65a46210, %l0 = ffffffffffffffff
	lduha	[%i2+%o5]0x88,%l0	! %l0 = 0000000000006210
!	Mem[0000000030181408] = ffff0000, %l4 = 0000000000000010
	ldsha	[%i6+%o4]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041408] = ffffffff 00005aff, %l0 = 00006210, %l1 = 00000010
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 0000000000005aff 00000000ffffffff
!	Mem[0000000030141408] = 0000000000000000, %f18 = 000000ff 00000000
	ldda	[%i5+%o4]0x81,%f18	! %f18 = 00000000 00000000
!	Mem[00000000300c1410] = 00005aa1ffffffff, %f10 = 0000ffff ff000000
	ldda	[%i3+%o5]0x89,%f10	! %f10 = 00005aa1 ffffffff
!	%f18 = 00000000 00000000, %f12 = 10000000 000000ff
	fxtod	%f18,%f12		! %f12 = 00000000 00000000
!	Mem[0000000030041410] = 00000000, %l1 = 00000000ffffffff
	lduwa	[%i1+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081400] = 00003eff, %l7 = 0000000000000068
	ldsba	[%i2+%g0]0x88,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l0 = 00005aff, %l1 = 00000000, Mem[00000000100c1408] = da4fffff 00000068
	stda	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00005aff 00000000

p0_label_266:
!	%f8  = 44100000 000000ff, Mem[0000000010101430] = 00000000 00000000
	stda	%f8 ,[%i4+0x030]%asi	! Mem[0000000010101430] = 44100000 000000ff
!	%l2 = 000000000000a5c5, Mem[0000000030101410] = 000000000000002e
	stxa	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000000000a5c5
!	%l3 = 000000000000004f, Mem[00000000201c0001] = ffff8819, %asi = 80
	stba	%l3,[%o0+0x001]%asi	! Mem[00000000201c0000] = ff4f8819
!	Mem[0000000030041410] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i1+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	%f12 = 00000000, %f22 = 10000000, %f22 = 10000000 cd7edba1
	fsmuld	%f12,%f22,%f22		! %f22 = 00000000 00000000
!	%l4 = ffffffff, %l5 = 00000000, Mem[0000000010001408] = 000000ff 00005aa1
	stda	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = ffffffff 00000000
!	%l7 = ffffffffffffffff, Mem[0000000030181400] = 950000ff00000000
	stxa	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = ffffffffffffffff
!	%l3 = 000000000000004f, Mem[0000000030081410] = 00000000ffff4fda
	stxa	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000000000004f
!	%f16 = 10000000 00000068, Mem[0000000010001408] = ffffffff 00000000
	stda	%f16,[%i0+%o4]0x88	! Mem[0000000010001408] = 10000000 00000068
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ff000000, %l7 = ffffffffffffffff
	ldsha	[%i4+%o4]0x81,%l7	! %l7 = ffffffffffffff00

p0_label_267:
!	Mem[0000000030001400] = 000000000000009f, %f10 = 00005aa1 ffffffff
	ldda	[%i0+%g0]0x89,%f10	! %f10 = 00000000 0000009f
!	Mem[0000000010001430] = 10000000 00000000, %l0 = 00005aff, %l1 = 00000000
	ldda	[%i0+0x030]%asi,%l0	! %l0 = 0000000010000000 0000000000000000
!	Mem[0000000010141408] = 000000a1, %l6 = 00000000000000ff
	lduha	[%i5+%o4]0x88,%l6	! %l6 = 00000000000000a1
!	Mem[00000000100c1408] = 00005aff, %l7 = ffffffffffffff00
	lduh	[%i3+%o4],%l7		! %l7 = 0000000000000000
!	Mem[0000000030041400] = 00000010, %l3 = 000000000000004f
	lduba	[%i1+%g0]0x89,%l3	! %l3 = 0000000000000010
!	Mem[0000000010101428] = 15f1a5c5 2ef3f120, %l4 = ffffffff, %l5 = 00000000
	ldd	[%i4+0x028],%l4		! %l4 = 0000000015f1a5c5 000000002ef3f120
!	Code Fragment 4
p0_fragment_31:
!	%l0 = 0000000010000000
	setx	0xbf300c38181ae012,%g7,%l0 ! %l0 = bf300c38181ae012
!	%l1 = 0000000000000000
	setx	0x2272438835701dc2,%g7,%l1 ! %l1 = 2272438835701dc2
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = bf300c38181ae012
	setx	0x77b89a387e5325a3,%g7,%l0 ! %l0 = 77b89a387e5325a3
!	%l1 = 2272438835701dc2
	setx	0x981f32d7a43ff5f9,%g7,%l1 ! %l1 = 981f32d7a43ff5f9
!	Code Fragment 3
p0_fragment_32:
!	%l0 = 77b89a387e5325a3
	setx	0xca031ec86879ae16,%g7,%l0 ! %l0 = ca031ec86879ae16
!	%l1 = 981f32d7a43ff5f9
	setx	0x6cf48910323790bb,%g7,%l1 ! %l1 = 6cf48910323790bb
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ca031ec86879ae16
	setx	0x35ed704fe3e5c942,%g7,%l0 ! %l0 = 35ed704fe3e5c942
!	%l1 = 6cf48910323790bb
	setx	0xc3cc158fd44b4132,%g7,%l1 ! %l1 = c3cc158fd44b4132
!	Mem[0000000030101400] = a1000000, %l0 = 35ed704fe3e5c942
	lduba	[%i4+%g0]0x81,%l0	! %l0 = 00000000000000a1
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1419] = 00000000, %l0 = 00000000000000a1
	ldstuba	[%i3+0x019]%asi,%l0	! %l0 = 00000000000000ff

p0_label_268:
!	%l5 = 000000002ef3f120, Mem[0000000010101410] = fffffffff9ff00ff
	stxa	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000002ef3f120
!	%l2 = 000000000000a5c5, Mem[0000000021800000] = 00ffb05a
	sth	%l2,[%o3+%g0]		! Mem[0000000021800000] = a5c5b05a
!	%l3 = 0000000000000010, Mem[00000000201c0000] = ff4f8819, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00108819
!	%l0 = 0000000000000000, Mem[0000000010101410] = 000000002ef3f120
	stxa	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000000000000
!	%l2 = 000000000000a5c5, Mem[0000000010141400] = 00000000
	stwa	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000a5c5
!	%l7 = 0000000000000000, Mem[0000000030001400] = 9f000000
	stwa	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	%f28 = ff3e0000 00001044, %l3 = 0000000000000010
!	Mem[0000000010101400] = 00000000000000ff
	stda	%f28,[%i4+%l3]ASI_PST32_P ! Mem[0000000010101400] = 00000000000000ff
!	%f13 = 00000000, Mem[000000001008142c] = 00000000
	st	%f13,[%i2+0x02c]	! Mem[000000001008142c] = 00000000
!	%f0  = 950000ff, %f0  = 950000ff, %f12 = 00000000
	fdivs	%f0 ,%f0 ,%f12		! %f12 = 3f800000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = a1db7ecdff000000, %l6 = 00000000000000a1
	ldxa	[%i2+%o4]0x81,%l6	! %l6 = a1db7ecdff000000

p0_label_269:
!	Mem[0000000010141410] = ff000000, %l6 = a1db7ecdff000000
	lduwa	[%i5+%o5]0x80,%l6	! %l6 = 00000000ff000000
!	Mem[0000000010181408] = 000000ff, %f2  = 68000000
	lda	[%i6+%o4]0x88,%f2 	! %f2 = 000000ff
!	Mem[0000000030181408] = ffff0000, %f28 = ff3e0000
	lda	[%i6+%o4]0x81,%f28	! %f28 = ffff0000
!	Mem[00000000100c1410] = 00000000a15a0000, %l0 = 0000000000000000
	ldxa	[%i3+%o5]0x80,%l0	! %l0 = 00000000a15a0000
!	Mem[0000000030001410] = 00000000, %l1 = c3cc158fd44b4132
	lduba	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101408] = 000000ff, %l6 = 00000000ff000000
	ldsba	[%i4+%o4]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081410] = 1062a465, %l4 = 0000000015f1a5c5
	lduwa	[%i2+%o5]0x80,%l4	! %l4 = 000000001062a465
!	Mem[0000000010181410] = ff0000000000fff9, %f28 = ffff0000 00001044
	ldda	[%i6+%o5]0x80,%f28	! %f28 = ff000000 0000fff9
!	Mem[0000000010081400] = 00003eff, %f27 = c1460847
	lda	[%i2+%g0]0x88,%f27	! %f27 = 00003eff
!	Starting 10 instruction Store Burst
!	%l0 = a15a0000, %l1 = 00000000, Mem[0000000030181400] = ffffffff ffffffff
	stda	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = a15a0000 00000000

p0_label_270:
!	%l6 = ffffffffffffffff, Mem[00000000300c1410] = ffffffff
	stha	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffffffff
!	%l4 = 000000001062a465, Mem[0000000010001400] = ff000000
	stwa	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 1062a465
!	Mem[0000000010041400] = 0000ffff, %l4 = 000000001062a465
	swapa	[%i1+%g0]0x80,%l4	! %l4 = 000000000000ffff
!	%f14 = 00000000, Mem[0000000010001408] = 00000068
	sta	%f14,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
!	Mem[00000000300c1408] = c5a53eff, %l6 = ffffffffffffffff
	ldstuba	[%i3+%o4]0x81,%l6	! %l6 = 000000c5000000ff
!	Mem[0000000010101400] = 00000000, %l7 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Code Fragment 3
p0_fragment_33:
!	%l0 = 00000000a15a0000
	setx	0xcc190b706a04298f,%g7,%l0 ! %l0 = cc190b706a04298f
!	%l1 = 0000000000000000
	setx	0x735465d807666739,%g7,%l1 ! %l1 = 735465d807666739
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = cc190b706a04298f
	setx	0x287b70dfef1036c2,%g7,%l0 ! %l0 = 287b70dfef1036c2
!	%l1 = 735465d807666739
	setx	0x17a80167a0a82c5d,%g7,%l1 ! %l1 = 17a80167a0a82c5d
!	%f16 = 10000000, Mem[0000000010001408] = 00000000
	sta	%f16,[%i0+%o4]0x88	! Mem[0000000010001408] = 10000000
!	Mem[00000000300c1410] = ffffffff, %l2 = 000000000000a5c5
	ldstuba	[%i3+%o5]0x81,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 10000000, %f30 = 94000000
	lda	[%i0+%o4]0x88,%f30	! %f30 = 10000000

p0_label_271:
!	Mem[0000000010141434] = ffffffff, %l7 = 0000000000000000
	lduw	[%i5+0x034],%l7		! %l7 = 00000000ffffffff
!	Mem[0000000010001410] = ff000000, %l6 = 00000000000000c5
	ldswa	[%i0+%o5]0x80,%l6	! %l6 = ffffffffff000000
!	Mem[0000000030141408] = 0000000000000000, %f26 = 000000ff 00003eff
	ldda	[%i5+%o4]0x81,%f26	! %f26 = 00000000 00000000
!	Mem[00000000100c1410] = 00000000, %l1 = 17a80167a0a82c5d
	ldsw	[%i3+%o5],%l1		! %l1 = 0000000000000000
!	Mem[0000000030041408] = 0000da4f, %l2 = 00000000000000ff
	ldswa	[%i1+%o4]0x89,%l2	! %l2 = 000000000000da4f
!	Mem[0000000010081400] = ff3e0000, %l3 = 0000000000000010
	ldsha	[%i2+%g0]0x80,%l3	! %l3 = ffffffffffffff3e
!	Mem[0000000021800040] = ff9c7f92, %l7 = 00000000ffffffff
	ldsha	[%o3+0x040]%asi,%l7	! %l7 = ffffffffffffff9c
!	Mem[0000000030101400] = 000000a1, %l5 = 000000002ef3f120
	ldsba	[%i4+%g0]0x89,%l5	! %l5 = ffffffffffffffa1
!	Mem[00000000211c0000] = 0000fcae, %l2 = 000000000000da4f
	ldub	[%o2+%g0],%l2		! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = ff000000, %l0 = 287b70dfef1036c2
	swapa	[%i6+%o5]0x80,%l0	! %l0 = 00000000ff000000

p0_label_272:
!	Mem[0000000020800041] = ffffbf87, %l4 = 000000000000ffff
	ldstub	[%o1+0x041],%l4		! %l4 = 000000ff000000ff
!	%f21 = c5a5f1ff, Mem[0000000010081430] = 00000000
	st	%f21,[%i2+0x030]	! Mem[0000000010081430] = c5a5f1ff
!	Mem[0000000020800000] = ffffc3ca, %l3 = ffffffffffffff3e
	ldstuba	[%o1+0x000]%asi,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000020800040] = ffffbf87, %l7 = ffffffffffffff9c
	ldstub	[%o1+0x040],%l7		! %l7 = 000000ff000000ff
!	%f6  = 10000000, Mem[0000000030001408] = ff000000
	sta	%f6 ,[%i0+%o4]0x81	! Mem[0000000030001408] = 10000000
!	Mem[0000000030081408] = a1db7ecd, %l2 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l2	! %l2 = 000000a1000000ff
!	%l2 = 00000000000000a1, Mem[0000000030041400] = 1000000000000000
	stxa	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000000000a1
!	%l3 = 00000000000000ff, Mem[00000000100c142c] = 00000000, %asi = 80
	stha	%l3,[%i3+0x02c]%asi	! Mem[00000000100c142c] = 00ff0000
!	%l4 = 000000ff, %l5 = ffffffa1, Mem[0000000030101410] = c5a50000 00000000
	stda	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000ff ffffffa1
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 000000a1, %l6 = ffffffffff000000
	lduha	[%i4+%g0]0x89,%l6	! %l6 = 00000000000000a1

p0_label_273:
!	Mem[00000000100c1410] = 00000000, %l6 = 00000000000000a1
	ldswa	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141410] = ff000000, %l2 = 00000000000000a1
	ldsha	[%i5+%o5]0x80,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010141410] = ff00000000000000, %l3 = 00000000000000ff
	ldxa	[%i5+%o5]0x80,%l3	! %l3 = ff00000000000000
!	Mem[0000000030001410] = 00000000, %l5 = ffffffffffffffa1
	lduwa	[%i0+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l7 = 00000000000000ff
	lduwa	[%i3+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l0 = 00000000ff000000
	ldsha	[%i1+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141408] = 00000000, %l4 = 00000000000000ff
	ldswa	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001408] = 00000010, %l7 = 0000000000000000
	ldsha	[%i0+%o4]0x89,%l7	! %l7 = 0000000000000010
!	Mem[0000000030001408] = 00000010, %l7 = 0000000000000010
	lduwa	[%i0+%o4]0x89,%l7	! %l7 = 0000000000000010
!	Starting 10 instruction Store Burst
!	%f14 = 00000000 00001044, %l0 = 0000000000000000
!	Mem[0000000010041430] = 0000000000000000
	add	%i1,0x030,%g1
	stda	%f14,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010041430] = 0000000000000000

p0_label_274:
!	%f16 = 10000000 00000068, Mem[0000000010001408] = 00000010 00000010
	stda	%f16,[%i0+%o4]0x80	! Mem[0000000010001408] = 10000000 00000068
!	Mem[000000001018143a] = 00000000, %l1 = 0000000000000000
	ldstub	[%i6+0x03a],%l1		! %l1 = 00000000000000ff
!	%l2 = ffffffffffffff00, Mem[0000000010141404] = ff000000
	sth	%l2,[%i5+0x004]		! Mem[0000000010141404] = ff000000
!	%l4 = 0000000000000000, Mem[00000000100c143c] = 00000094, %asi = 80
	stwa	%l4,[%i3+0x03c]%asi	! Mem[00000000100c143c] = 00000000
!	%l3 = ff00000000000000, imm = fffffffffffffe17, %l7 = 0000000000000010
	xor	%l3,-0x1e9,%l7		! %l7 = 00fffffffffffe17
!	%l6 = 0000000000000000, Mem[0000000010041400] = 1062a465ffff0000
	stxa	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000000000000000
!	%f0  = 950000ff 00000000 000000ff 00000000
!	%f4  = 00005aa1 00000000 10000000 00000000
!	%f8  = 44100000 000000ff 00000000 0000009f
!	%f12 = 3f800000 00000000 00000000 00001044
	stda	%f0,[%i2]ASI_BLK_AIUPL	! Block Store to 0000000010081400
!	%f27 = 00000000, Mem[0000000030041410] = 000000ff
	sta	%f27,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	%l2 = ffffff00, %l3 = 00000000, Mem[0000000030001408] = 00000010 68000000
	stda	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffff00 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 000000ff, %f27 = 00000000
	lda	[%i6+%o4]0x88,%f27	! %f27 = 000000ff

p0_label_275:
!	Mem[0000000030181400] = a15a0000 00000000, %l6 = 00000000, %l7 = fffffe17
	ldda	[%i6+%g0]0x81,%l6	! %l6 = 00000000a15a0000 0000000000000000
	membar	#Sync			! Added by membar checker (57)
!	Mem[0000000010081420] = ff000000, %l5 = 0000000000000000
	ldsha	[%i2+0x022]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000211c0000] = 0000fcae, %l7 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041408] = 00005aff, %l6 = 00000000a15a0000
	lduwa	[%i1+%o4]0x88,%l6	! %l6 = 0000000000005aff
!	Mem[0000000010101400] = 00000000, %l3 = ff00000000000000
	ldswa	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[000000001018140c] = 00000010, %l5 = 0000000000000000
	lduba	[%i6+0x00d]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = fff1a5c500000000, %l2 = ffffffffffffff00
	ldxa	[%i1+%o5]0x89,%l2	! %l2 = fff1a5c500000000
!	Mem[0000000030101410] = 000000ff, %l0 = 0000000000000000
	lduwa	[%i4+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%f9  = 000000ff, %f23 = 00000000
	fcmpes	%fcc0,%f9 ,%f23		! %fcc0 = 2
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[0000000010001410] = ff00000000000000
	stxa	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000000000ff

p0_label_276:
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030081410] = 4f000000 00000000
	stda	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000 00000000
!	%l0 = 00000000000000ff, Mem[0000000010041408] = 00005aff
	stha	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff
!	%l0 = 00000000000000ff, Mem[0000000021800100] = ddffa03e, %asi = 80
	stba	%l0,[%o3+0x100]%asi	! Mem[0000000021800100] = ffffa03e
!	%f16 = 10000000 00000068 00000000 00000000
!	%f20 = ff000000 c5a5f1ff 00000000 00000000
!	%f24 = 000000ff 00000000 00000000 000000ff
!	%f28 = ff000000 0000fff9 10000000 00000000
	stda	%f16,[%i5]ASI_BLK_AIUP	! Block Store to 0000000010141400
!	Mem[0000000030101400] = 000000a1, %l7 = 0000000000000000
	swapa	[%i4+%g0]0x89,%l7	! %l7 = 00000000000000a1
!	%l4 = 0000000000000000, Mem[0000000030041400] = 00000000
	stba	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
!	Mem[0000000010081410] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%f8  = 44100000 000000ff, Mem[0000000010041400] = 00000000 00000000
	stda	%f8 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 44100000 000000ff
!	%l6 = 00005aff, %l7 = 000000a1, Mem[0000000010141410] = ff000000 c5a5f1ff
	stda	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 00005aff 000000a1
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ffffc3ca, %l4 = 0000000000000000
	lduh	[%o1+%g0],%l4		! %l4 = 000000000000ffff

p0_label_277:
!	Mem[000000001008142c] = 00000000, %f14 = 00000000
	lda	[%i2+0x02c]%asi,%f14	! %f14 = 00000000
!	Mem[0000000021800180] = 66ff8f81, %l5 = 0000000000000000
	ldsha	[%o3+0x180]%asi,%l5	! %l5 = 00000000000066ff
!	Mem[00000000201c0000] = 00108819, %l6 = 0000000000005aff
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 0000000000000010
!	%l3 = 0000000000000000, immd = 000000000000066e, %l1 = 0000000000000000
	sdivx	%l3,0x66e,%l1		! %l1 = 0000000000000000
!	Mem[00000000100c1430] = 4410000000003eff, %f8  = 44100000 000000ff
	ldd	[%i3+0x030],%f8 	! %f8  = 44100000 00003eff
!	%f15 = 00001044, %f0  = 950000ff, %f15 = 00001044
	fmuls	%f15,%f0 ,%f15		! %f15 = 80000000
!	Mem[00000000100c1408] = 00005aff00000000, %f14 = 00000000 80000000
	ldda	[%i3+%o4]0x80,%f14	! %f14 = 00005aff 00000000
!	Mem[0000000010001420] = ffffffff, %l6 = 0000000000000010
	ldsba	[%i0+0x022]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010041410] = 00001044, %l3 = 0000000000000000
	ldsba	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000044
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[00000000100c1410] = 00000000
	stba	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ff

p0_label_278:
!	Mem[0000000010001408] = 10000000, %l0 = 00000000000000ff
	swapa	[%i0+%o4]0x80,%l0	! %l0 = 0000000010000000
!	%f10 = 00000000 0000009f, %l6 = ffffffffffffffff
!	Mem[00000000100c1400] = 0000000000000010
	stda	%f10,[%i3+%l6]ASI_PST32_P ! Mem[00000000100c1400] = 000000000000009f
!	%l5 = 00000000000066ff, Mem[0000000010141400] = 00000010
	stba	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff
!	%l7 = 00000000000000a1, Mem[00000000211c0000] = 0000fcae, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00a1fcae
!	Mem[00000000100c1438] = 0000000000000000, %l3 = 0000000000000044, %l1 = 0000000000000000
	add	%i3,0x38,%g1
	casxa	[%g1]0x80,%l3,%l1	! %l1 = 0000000000000000
!	%f12 = 3f800000, Mem[0000000030041410] = 00000000
	sta	%f12,[%i1+%o5]0x89	! Mem[0000000030041410] = 3f800000
!	%l3 = 0000000000000044, Mem[0000000010041410] = 00001044
	stha	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000044
!	Mem[0000000030041408] = 4fda0000, %l3 = 0000000000000044
	swapa	[%i1+%o4]0x81,%l3	! %l3 = 000000004fda0000
!	Mem[0000000030081408] = cd7edbff, %l0 = 0000000010000000
	swapa	[%i2+%o4]0x89,%l0	! %l0 = 00000000cd7edbff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00000000, %l5 = 00000000000066ff
	lduha	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000000

p0_label_279:
!	Mem[00000000201c0000] = 00108819, %l4 = 000000000000ffff
	ldsba	[%o0+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = ff000000, %l0 = 00000000cd7edbff
	lduba	[%i6+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101420] = 00000000, %l4 = 0000000000000000
	lduwa	[%i4+0x020]%asi,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (58)
!	Mem[0000000010141410] = 00005aff000000a1, %l5 = 0000000000000000
	ldxa	[%i5+%o5]0x80,%l5	! %l5 = 00005aff000000a1
!	Mem[0000000010141438] = 10000000, %f27 = 000000ff
	ld	[%i5+0x038],%f27	! %f27 = 10000000
!	Mem[00000000218001c0] = f9d8186d, %l1 = 0000000000000000
	lduh	[%o3+0x1c0],%l1		! %l1 = 000000000000f9d8
!	Mem[0000000030081408] = 10000000, %l4 = 0000000000000000
	lduba	[%i2+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = 00005aa1 000000ff, %l2 = 00000000, %l3 = 4fda0000
	ldda	[%i2+%o5]0x88,%l2	! %l2 = 00000000000000ff 0000000000005aa1
!	Mem[0000000010001410] = 00000000, %l5 = 00005aff000000a1
	lduba	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[00000000300c1400] = ff000000
	stwa	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000ff

p0_label_280:
!	%l3 = 0000000000005aa1, Mem[0000000010001408] = ff000000
	stha	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = ff005aa1
!	Mem[0000000010081410] = 000000ff, %l3 = 0000000000005aa1
	swapa	[%i2+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%f16 = 10000000 00000068, %l3 = 00000000000000ff
!	Mem[0000000030101418] = 01000000102375ff
	add	%i4,0x018,%g1
	stda	%f16,[%g1+%l3]ASI_PST16_S ! Mem[0000000030101418] = 1000000000000068
!	%l6 = ffffffffffffffff, Mem[0000000030041408] = 00000044ff000000
	stxa	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffffffffffff
!	%l0 = 00000000000000ff, Mem[0000000010041400] = 44100000000000ff
	stxa	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000000000ff
!	%f4  = 00005aa1 00000000, %l3 = 00000000000000ff
!	Mem[0000000010081408] = 00000000ff000000
	add	%i2,0x008,%g1
	stda	%f4,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010081408] = 00000000a15a0000
!	%l6 = ffffffffffffffff, Mem[0000000010081410] = 00005aa1
	stha	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000ffff
!	Mem[0000000010081400] = 00000000ff000095, %l5 = 0000000000000000, %l7 = 00000000000000a1
	casxa	[%i2]0x80,%l5,%l7	! %l7 = 00000000ff000095
!	%l1 = 000000000000f9d8, Mem[00000000201c0000] = 00108819
	sth	%l1,[%o0+%g0]		! Mem[00000000201c0000] = f9d88819
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ffffffff, %l1 = 000000000000f9d8
	ldsha	[%i1+%o4]0x81,%l1	! %l1 = ffffffffffffffff

p0_label_281:
!	Mem[0000000020800040] = ffffbf87, %l3 = 00000000000000ff
	lduha	[%o1+0x040]%asi,%l3	! %l3 = 000000000000ffff
!	Mem[00000000300c1408] = ff3ea5ff, %l0 = 00000000000000ff
	lduba	[%i3+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001410] = 00000000, %l3 = 000000000000ffff
	ldsha	[%i0+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181400] = 00000000 00005aa1, %l0 = 000000ff, %l1 = ffffffff
	ldda	[%i6+%g0]0x89,%l0	! %l0 = 0000000000005aa1 0000000000000000
!	Mem[0000000030001410] = 00000000, %l2 = 00000000000000ff
	lduha	[%i0+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041420] = ff000000, %l0 = 0000000000005aa1
	ldsh	[%i1+0x020],%l0		! %l0 = ffffffffffffff00
!	Mem[0000000020800000] = ffffc3ca, %l0 = ffffffffffffff00
	ldsha	[%o1+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000300c1408] = ff3ea5ff, %l2 = 0000000000000000
	lduba	[%i3+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1400] = 00000000, %l3 = 0000000000000000
	ldswa	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010141408] = 00000000 00000000
	std	%l4,[%i5+%o4]		! Mem[0000000010141408] = 00000000 00000000

p0_label_282:
!	%l1 = 0000000000000000, Mem[0000000010101408] = 935eff000000fff9
	stxa	%l1,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000000000000000
!	%f0  = 950000ff 00000000 000000ff 00000000
!	%f4  = 00005aa1 00000000 10000000 00000000
!	%f8  = 44100000 00003eff 00000000 0000009f
!	%f12 = 3f800000 00000000 00005aff 00000000
	stda	%f0,[%i1]ASI_BLK_AIUS	! Block Store to 0000000030041400
!	Mem[00000000100c1418] = 00ff0000, %l7 = 00000000ff000095, %asi = 80
	swapa	[%i3+0x018]%asi,%l7	! %l7 = 0000000000ff0000
	membar	#Sync			! Added by membar checker (59)
!	Mem[0000000010041408] = ff000000, %l1 = 0000000000000000
	ldstuba	[%i1+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000100c1408] = ff5a0000, %l3 = 0000000000000000
	ldstuba	[%i3+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000020800040] = ffffbf87, %l1 = 00000000000000ff
	ldstub	[%o1+0x040],%l1		! %l1 = 000000ff000000ff
!	%f14 = 00005aff 00000000, %l3 = 0000000000000000
!	Mem[0000000030081410] = 0000000000000000
	add	%i2,0x010,%g1
	stda	%f14,[%g1+%l3]ASI_PST8_SL ! Mem[0000000030081410] = 0000000000000000
!	%l0 = ffffffff, %l1 = 000000ff, Mem[0000000030101408] = 000000ff fff1a5c5
	stda	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = ffffffff 000000ff
!	%f16 = 10000000 00000068, %l5 = 0000000000000000
!	Mem[0000000030141438] = 2ca1722d891eac02
	add	%i5,0x038,%g1
	stda	%f16,[%g1+%l5]ASI_PST8_S ! Mem[0000000030141438] = 2ca1722d891eac02
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ff000000, %l4 = 0000000000000000
	ldsba	[%i6+%o4]0x80,%l4	! %l4 = ffffffffffffffff

p0_label_283:
!	Mem[0000000030101400] = 00000000, %l4 = ffffffffffffffff
	ldsha	[%i4+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101400] = 00000000000000ff, %f16 = 10000000 00000068
	ldd	[%i4+%g0],%f16		! %f16 = 00000000 000000ff
!	Mem[0000000010001410] = 00000000, %l7 = 0000000000ff0000
	ldsha	[%i0+0x012]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041400] = ff00000000000000, %f24 = 000000ff 00000000
	ldda	[%i1+%g0]0x88,%f24	! %f24 = ff000000 00000000
!	Mem[0000000020800040] = ffffbf87, %l0 = ffffffffffffffff
	lduh	[%o1+0x040],%l0		! %l0 = 000000000000ffff
!	Mem[0000000030101408] = ffffffff, %l1 = 00000000000000ff
	ldsba	[%i4+%o4]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010081430] = 000000000000803f, %f12 = 3f800000 00000000
	ldda	[%i2+0x030]%asi,%f12	! %f12 = 00000000 0000803f
!	Mem[0000000030001400] = 00000000, %l3 = 0000000000000000
	lduha	[%i0+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l0 = 000000000000ffff
	ldsba	[%i2+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010001400] = 1062a46500000068
	stxa	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000000000000000

p0_label_284:
!	%l1 = ffffffffffffffff, Mem[0000000010041422] = ff000000, %asi = 80
	stha	%l1,[%i1+0x022]%asi	! Mem[0000000010041420] = ff00ffff
!	%l7 = 0000000000000000, Mem[00000000211c0000] = 00a1fcae
	sth	%l7,[%o2+%g0]		! Mem[00000000211c0000] = 0000fcae
!	%l3 = 0000000000000000, Mem[00000000100c1410] = 000000ff
	stwa	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030141408] = 00000000 00000000
	stda	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000 00000000
!	%l2 = 00000000000000ff, Mem[0000000010041408] = 000000ff
	stba	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff
!	%l0 = 0000000000000000, Mem[0000000030081410] = 00000000
	stwa	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	%l4 = 0000000000000000, Mem[0000000010041410] = ffff84ff00000044
	stxa	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000000000000000
!	%l3 = 0000000000000000, Mem[00000000300c1400] = ff000000
	stwa	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	Mem[0000000010081408] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i2+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00000000 00001044, %l0 = 00000000, %l1 = ffffffff
	ldda	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000000 0000000000001044

p0_label_285:
!	Mem[0000000010101400] = 00000000, %f29 = 0000fff9
	lda	[%i4+%g0]0x88,%f29	! %f29 = 00000000
!	Mem[0000000010001410] = ff00000000000000, %f0  = 950000ff 00000000
	ldda	[%i0+%o5]0x88,%f0 	! %f0  = ff000000 00000000
!	Mem[0000000030081408] = 10000000, %l2 = 00000000000000ff
	lduba	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1434] = 00003eff, %f22 = 00000000
	lda	[%i3+0x034]%asi,%f22	! %f22 = 00003eff
!	Mem[0000000030041400] = 950000ff 00000000 000000ff 00000000
!	Mem[0000000030041410] = 00005aa1 00000000 10000000 00000000
!	Mem[0000000030041420] = 44100000 00003eff 00000000 0000009f
!	Mem[0000000030041430] = 3f800000 00000000 00005aff 00000000
	ldda	[%i1]ASI_BLK_S,%f0	! Block Load from 0000000030041400
!	Mem[0000000010001400] = 00000000, %l2 = 0000000000000000
	lduwa	[%i0+%g0]0x88,%l2	! %l2 = 0000000000000000
!	%l4 = 0000000000000000, %l2 = 0000000000000000, %l1  = 0000000000001044
	mulx	%l4,%l2,%l1		! %l1 = 0000000000000000
!	Mem[0000000030001410] = 00000000, %l2 = 0000000000000000
	lduha	[%i0+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081400] = 00000000 00000000, %l6 = ffffffff, %l7 = 00000000
	ldda	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000000 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l4	! %l4 = 00000000000000ff

p0_label_286:
!	%l1 = 0000000000000000, imm = 0000000000000552, %l7 = 0000000000000000
	or	%l1,0x552,%l7		! %l7 = 0000000000000552
!	Mem[0000000010101400] = 00000000000000ff, %l7 = 0000000000000552, %l0 = 0000000000000000
	casxa	[%i4]0x80,%l7,%l0	! %l0 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000030141408] = 0000000000000000
	stxa	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000000000000000
!	%f16 = 00000000 000000ff, %l7 = 0000000000000552
!	Mem[0000000030101420] = 000000002ef30000
	add	%i4,0x020,%g1
	stda	%f16,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030101420] = 000000002ef30000
!	%f27 = 10000000, Mem[0000000030101400] = 00000000
	sta	%f27,[%i4+%g0]0x89	! Mem[0000000030101400] = 10000000
!	%l2 = 0000000000000000, Mem[0000000010081400] = 00000000
	stwa	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	Code Fragment 3
p0_fragment_34:
!	%l0 = 00000000000000ff
	setx	0x3a696fdf889c61e0,%g7,%l0 ! %l0 = 3a696fdf889c61e0
!	%l1 = 0000000000000000
	setx	0x11a3cd3057091c42,%g7,%l1 ! %l1 = 11a3cd3057091c42
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3a696fdf889c61e0
	setx	0xfdc6e38865e332fe,%g7,%l0 ! %l0 = fdc6e38865e332fe
!	%l1 = 11a3cd3057091c42
	setx	0xbd87f5084b9b04c9,%g7,%l1 ! %l1 = bd87f5084b9b04c9
!	%l2 = 0000000000000000, Mem[0000000020800000] = ffffc3ca, %asi = 80
	stha	%l2,[%o1+0x000]%asi	! Mem[0000000020800000] = 0000c3ca
	membar	#Sync			! Added by membar checker (60)
!	%f16 = 00000000, Mem[0000000030041410] = a15a0000
	sta	%f16,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 950000ff, %l4 = 0000000000000000
	ldsba	[%i1+%g0]0x81,%l4	! %l4 = ffffffffffffff95

p0_label_287:
!	Mem[0000000010141400] = 000000ff, %l4 = ffffffffffffff95
	lduha	[%i5+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141400] = 00000000, %l5 = 0000000000000000
	lduwa	[%i5+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = 10000000, %l4 = 00000000000000ff
	ldsba	[%i4+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l7 = 0000000000000552
	lduba	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1418] = ff0000950000ff10, %f6  = 10000000 00000000
	ldda	[%i3+0x018]%asi,%f6 	! %f6  = ff000095 0000ff10
!	Mem[0000000030081400] = 00000000, %l5 = 0000000000000000
	ldsba	[%i2+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l3 = 0000000000000000
	ldsba	[%i2+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = ff000000, %l1 = bd87f5084b9b04c9
	ldsha	[%i1+%o4]0x80,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000030141408] = 00000000, %l6 = 0000000000000000
	lduba	[%i5+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 00000000, %l0 = fdc6e38865e332fe
	swapa	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000000

p0_label_288:
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030181410] = 0e30509a 935ea4f9
	stda	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000 00000000
!	Mem[0000000030101408] = ffffffff, %l6 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l6	! %l6 = 00000000ffffffff
!	%l4 = 0000000000000000, Mem[0000000010181410] = c23610ef
	stha	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = c2360000
!	%f24 = ff000000 00000000, Mem[0000000030141410] = ffffffff bd645e8a
	stda	%f24,[%i5+%o5]0x89	! Mem[0000000030141410] = ff000000 00000000
!	Mem[0000000010101418] = 00000000, %l2 = 0000000000000000
	swap	[%i4+0x018],%l2		! %l2 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l4 = 0000000000000000
	swapa	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000021800080] = 15ff0203, %l5 = 0000000000000000
	ldstuba	[%o3+0x080]%asi,%l5	! %l5 = 00000015000000ff
!	%l4 = 0000000000000000, Mem[00000000201c0000] = f9d88819, %asi = 80
	stha	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00008819
!	%f18 = 00000000 00000000, Mem[0000000010081400] = 00000000 950000ff
	stda	%f18,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ff5a0000, %l6 = 00000000ffffffff
	lduha	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000

p0_label_289:
!	Mem[0000000010081410] = 0000ffff, %l0 = 0000000000000000
	ldswa	[%i2+%o5]0x88,%l0	! %l0 = 000000000000ffff
!	Mem[00000000300c1400] = 00000000 00001044 ffa53eff 000000ff
!	Mem[00000000300c1410] = ffffffff a15a0000 000000a1 5a007396
!	Mem[00000000300c1420] = 8b6516ff 5200ffff 2ef3f120 00005aa1
!	Mem[00000000300c1430] = ff000000 000000ff ffffffae f50000ff
	ldda	[%i3]ASI_BLK_AIUS,%f16	! Block Load from 00000000300c1400
!	Mem[00000000201c0000] = 00008819, %l1 = ffffffffffffff00
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = ff00000000000000, %f10 = 00000000 0000009f
	ldda	[%i4+%g0]0x88,%f10	! %f10 = ff000000 00000000
!	%f4  = 00005aa1, %f11 = 00000000, %f3  = 00000000
	fadds	%f4 ,%f11,%f3 		! %l0 = 0000000000010021, Unfinished, %fsr = 2a00000800
!	Mem[0000000010141430] = ff000000, %l4 = 0000000000000000
	lduw	[%i5+0x030],%l4		! %l4 = 00000000ff000000
!	Mem[0000000030041408] = ff000000, %f6  = ff000095
	lda	[%i1+%o4]0x89,%f6 	! %f6 = ff000000
!	Mem[00000000100c1438] = 0000000000000000, %l3 = 0000000000000000
	ldxa	[%i3+0x038]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001408] = ffffff00, %l3 = 0000000000000000
	lduba	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030101400] = 00000010
	stba	%l3,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000010

p0_label_290:
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010141408] = 00000000 00000000
	stda	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 00000000
!	Mem[0000000030141410] = 00000000, %l0 = 0000000000010021
	ldstuba	[%i5+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010041400] = 00000000 ff000000
	stda	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000 00000000
!	%l2 = 0000000000000000, Mem[00000000218000c0] = ff6adddc
	sth	%l2,[%o3+0x0c0]		! Mem[00000000218000c0] = 0000dddc
!	%l2 = 0000000000000000, Mem[0000000010181418] = 1062a465b92ab835, %asi = 80
	stxa	%l2,[%i6+0x018]%asi	! Mem[0000000010181418] = 0000000000000000
!	%f6  = ff000000 0000ff10, Mem[0000000010001408] = ff005aa1 68000000
	stda	%f6 ,[%i0+%o4]0x88	! Mem[0000000010001408] = ff000000 0000ff10
!	%f10 = ff000000 00000000, %l6 = 0000000000000000
!	Mem[0000000030001428] = f9a45e939a50300e
	add	%i0,0x028,%g1
	stda	%f10,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030001428] = f9a45e939a50300e
!	%l2 = 0000000000000000, Mem[0000000020800001] = 0000c3ca
	stb	%l2,[%o1+0x001]		! Mem[0000000020800000] = 0000c3ca
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000, %l3 = 0000000000000000
	ldub	[%i1+0x002],%l3		! %l3 = 0000000000000000

p0_label_291:
!	Mem[0000000010141400] = ff000000, %l3 = 0000000000000000
	lduwa	[%i5+%g0]0x80,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010181410] = c2360000, %l0 = 0000000000000000
	lduha	[%i6+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l7 = 0000000000000000
	lduwa	[%i4+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800040] = ffffbf87, %l4 = 00000000ff000000
	ldsh	[%o1+0x040],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030041400] = 950000ff, %l5 = 0000000000000015
	ldsha	[%i1+%g0]0x81,%l5	! %l5 = ffffffffffff9500
!	Mem[0000000010001400] = 00000000, %l6 = 0000000000000000
	ldsha	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = 00ffffff, %l5 = ffffffffffff9500
	lduwa	[%i0+%o4]0x81,%l5	! %l5 = 0000000000ffffff
!	%f8  = 44100000, %f1  = 00000000
	fcmpes	%fcc3,%f8 ,%f1 		! %fcc3 = 2
!	Mem[0000000010001414] = 000000ff, %f1  = 00000000
	lda	[%i0+0x014]%asi,%f1 	! %f1 = 000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041434] = 00000000, %l3 = 00000000ff000000
	ldstub	[%i1+0x034],%l3		! %l3 = 00000000000000ff

p0_label_292:
!	Mem[0000000010001410] = 00000000, %l6 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000
!	%f16 = 00000000 00001044 ffa53eff 000000ff
!	%f20 = ffffffff a15a0000 000000a1 5a007396
!	%f24 = 8b6516ff 5200ffff 2ef3f120 00005aa1
!	%f28 = ff000000 000000ff ffffffae f50000ff
	stda	%f16,[%i1]ASI_BLK_SL	! Block Store to 0000000030041400
!	%l1 = 0000000000000000, immd = ffffffffffffff54, %l7 = 0000000000000000
	sdivx	%l1,-0x0ac,%l7		! %l7 = 0000000000000000
!	%l5 = 0000000000ffffff, Mem[0000000010181408] = 000000ff
	stha	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000ffff
!	%l5 = 0000000000ffffff, Mem[0000000020800000] = 0000c3ca
	sth	%l5,[%o1+%g0]		! Mem[0000000020800000] = ffffc3ca
!	%l5 = 0000000000ffffff, Mem[00000000211c0000] = 0000fcae, %asi = 80
	stba	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = ff00fcae
!	%l5 = 0000000000ffffff, Mem[0000000010101400] = 00000000
	stha	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = ffff0000
!	%l0 = 0000000000000000, Mem[0000000010081400] = 00000000
	stha	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	%f2  = 000000ff 00000000, %l2 = 0000000000000000
!	Mem[0000000010041430] = 00000000ff000000
	add	%i1,0x030,%g1
	stda	%f2,[%g1+%l2]ASI_PST32_P ! Mem[0000000010041430] = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l0 = 0000000000000000
	ldsha	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000000

p0_label_293:
!	Mem[000000001014142c] = 000000ff, %l7 = 0000000000000000
	ldub	[%i5+0x02c],%l7		! %l7 = 0000000000000000
!	Mem[0000000010141410] = 00005aff, %l7 = 0000000000000000
	ldswa	[%i5+%o5]0x80,%l7	! %l7 = 0000000000005aff
!	Mem[0000000030101410] = ff0000ff, %l6 = 0000000000000000
	ldsha	[%i4+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181408] = ffff0000, %l1 = 0000000000000000
	lduba	[%i6+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1410] = ffffffff, %l7 = 0000000000005aff
	lduha	[%i3+%o5]0x89,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010141400] = ff000000, %l0 = 0000000000000000
	lduwa	[%i5+%g0]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[0000000010081400] = 0000000000000000, %l1 = 00000000000000ff
	ldxa	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081410] = 0000000000000000, %l7 = 000000000000ffff
	ldxa	[%i2+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l0 = 00000000ff000000
	ldsha	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, imm = 0000000000000e08, %l0 = 0000000000000000
	xor	%l7,0xe08,%l0		! %l0 = 0000000000000e08

p0_label_294:
!	%l7 = 0000000000000000, Mem[0000000010141410] = ff5a0000
	stba	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = ff5a0000
!	%l5 = 0000000000ffffff, Mem[0000000010001410] = ff00000000000000
	stxa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000ffffff
!	Mem[00000000100c1410] = 00000000, %l2 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l2	! %l2 = 0000000000000000
!	%f6  = ff000000 0000ff10, %l6 = 00000000000000ff
!	Mem[0000000010001438] = 8a5e64bd00005aa1
	add	%i0,0x038,%g1
	stda	%f6,[%g1+%l6]ASI_PST32_P ! Mem[0000000010001438] = ff0000000000ff10
!	Mem[0000000030141410] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i5+%o5]0x81,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030181408] = ffff0000, %l2 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l2	! %l2 = 000000ff000000ff
!	%f0  = 950000ff 000000ff 000000ff 00000000
!	%f4  = 00005aa1 00000000 ff000000 0000ff10
!	%f8  = 44100000 00003eff ff000000 00000000
!	%f12 = 3f800000 00000000 00005aff 00000000
	stda	%f0,[%i4]ASI_COMMIT_P	! Block Store to 0000000010101400
!	%l7 = 0000000000000000, Mem[0000000010181408] = 0000ffff
	stha	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	Mem[00000000201c0000] = 00008819, %l1 = 0000000000000000
	lduh	[%o0+%g0],%l1		! %l1 = 0000000000000000
!	Starting 10 instruction Load Burst
!	%f26 = 2ef3f120, %f24 = 8b6516ff
	fcmps	%fcc3,%f26,%f24		! %fcc3 = 2

p0_label_295:
!	Mem[0000000010081408] = 000000ff, %l2 = 00000000000000ff
	ldsba	[%i2+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	%f29 = 000000ff, %f25 = 5200ffff, %f25 = 5200ffff
	fdivs	%f29,%f25,%f25		! %f25 = 00000000
	membar	#Sync			! Added by membar checker (61)
!	Mem[0000000010101408] = 00000000ff000000, %f18 = ffa53eff 000000ff
	ldda	[%i4+%o4]0x88,%f18	! %f18 = 00000000 ff000000
!	Mem[00000000300c1408] = ffa53eff, %l7 = 0000000000000000
	ldswa	[%i3+%o4]0x81,%l7	! %l7 = ffffffffffa53eff
!	Mem[0000000010001408] = 0000ff10, %l3 = 00000000000000ff
	lduba	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000010
!	Mem[0000000010141410] = ff5a0000, %l6 = 00000000000000ff
	lduba	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001408] = 0000ff10, %l0 = 0000000000000e08
	lduwa	[%i0+%o4]0x88,%l0	! %l0 = 000000000000ff10
!	%l2 = ffffffffffffffff, imm = fffffffffffff6e5, %l1 = 0000000000000000
	xnor	%l2,-0x91b,%l1		! %l1 = fffffffffffff6e5
!	Mem[0000000030141400] = 00000000, %l3 = 0000000000000010
	lduha	[%i5+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 00000000, %l4 = ffffffffffffffff
	swapa	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000

p0_label_296:
!	%l3 = 0000000000000000, Mem[00000000100c1400] = fe32e365
	stba	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0032e365
!	Mem[0000000010181400] = 00000000, %l2 = ffffffffffffffff
	swapa	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%f0  = 950000ff 000000ff, Mem[0000000010181410] = c2360000 f9ff0000
	stda	%f0 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 950000ff 000000ff
!	%l6 = 00000000, %l7 = ffa53eff, Mem[0000000010141438] = 10000000 00000000
	std	%l6,[%i5+0x038]		! Mem[0000000010141438] = 00000000 ffa53eff
!	Mem[0000000030141410] = ff000000, %l1 = fffffffffffff6e5
	ldstuba	[%i5+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	%f14 = 00005aff 00000000, Mem[0000000030101400] = 00000010 a15a0000
	stda	%f14,[%i4+%g0]0x81	! Mem[0000000030101400] = 00005aff 00000000
!	%f16 = 00000000 00001044, %l0 = 000000000000ff10
!	Mem[00000000100c1400] = 0032e3650000009f
	stda	%f16,[%i3+%l0]ASI_PST16_PL ! Mem[00000000100c1400] = 0032e3650000009f
!	%l1 = 00000000000000ff, Mem[0000000010101400] = 950000ff
	stwa	%l1,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000ff
!	Mem[0000000030101410] = ff0000ff, %l3 = 0000000000000000
	swapa	[%i4+%o5]0x89,%l3	! %l3 = 00000000ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 0000000000000000, %l0 = 000000000000ff10
	ldxa	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000000

p0_label_297:
!	Mem[0000000010141430] = ff000000, %l6 = 0000000000000000
	ldsha	[%i5+0x032]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = 000000ff, %l0 = 0000000000000000
	lduha	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l3 = 00000000ff0000ff
	lduha	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = ff5a0000, %l0 = 0000000000000000
	ldsha	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l1 = 00000000000000ff
	ldsha	[%i5+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l5 = 0000000000ffffff
	lduwa	[%i0+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1410] = ffffffff, %f12 = 3f800000
	lda	[%i3+%o5]0x81,%f12	! %f12 = ffffffff
!	%f4  = 00005aa1 00000000, Mem[0000000010001410] = 00ffffff 00000000
	stda	%f4 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 00005aa1 00000000
!	Mem[00000000100c1410] = 00000000, %l3 = 0000000000000000
	lduha	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f0  = 950000ff, Mem[0000000010141408] = ff000000
	sta	%f0 ,[%i5+%o4]0x80	! Mem[0000000010141408] = 950000ff

p0_label_298:
!	%f0  = 950000ff 000000ff 000000ff 00000000
!	%f4  = 00005aa1 00000000 ff000000 0000ff10
!	%f8  = 44100000 00003eff ff000000 00000000
!	%f12 = ffffffff 00000000 00005aff 00000000
	stda	%f0,[%i2]ASI_COMMIT_P	! Block Store to 0000000010081400
!	%l0 = 0000000000000000, Mem[00000000100c1400] = 65e33200
	stwa	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	%l1 = 0000000000000000, Mem[0000000010101400] = ff000000
	stwa	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000
!	Mem[0000000030081410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000030041408] = 000000ff
	stwa	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	Mem[000000001018143c] = ffffffff, %l6 = 0000000000000000, %asi = 80
	swapa	[%i6+0x03c]%asi,%l6	! %l6 = 00000000ffffffff
!	%f28 = ff000000 000000ff, %l5 = 0000000000000000
!	Mem[00000000300c1400] = 0000000000001044
	stda	%f28,[%i3+%l5]ASI_PST32_SL ! Mem[00000000300c1400] = 0000000000001044
!	%l5 = 0000000000000000, %l7 = ffffffffffa53eff, %l0 = 0000000000000000
	addc	%l5,%l7,%l0		! %l0 = ffffffffffa53eff
!	%f18 = 00000000 ff000000, Mem[00000000100c1408] = ff5a00ff 00000000
	stda	%f18,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 00000000, %l6 = 00000000ffffffff
	lduha	[%i3+0x000]%asi,%l6	! %l6 = 0000000000000000

p0_label_299:
!	Mem[0000000030101408] = 000000ff ffffffff, %l6 = 00000000, %l7 = ffa53eff
	ldda	[%i4+%o4]0x89,%l6	! %l6 = 00000000ffffffff 00000000000000ff
!	Mem[000000001000140c] = 000000ff, %l4 = 0000000000000000
	ldsba	[%i0+0x00c]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141410] = ff5a0000, %l7 = 00000000000000ff
	lduha	[%i5+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041408] = 000000ff, %l2 = 0000000000000000
	ldsba	[%i1+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010101410] = 00005aa1, %l0 = ffffffffffa53eff
	ldsba	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1424] = aeffffff, %l2 = ffffffffffffffff
	lduh	[%i3+0x026],%l2		! %l2 = 000000000000ffff
!	Mem[0000000010041400] = 00000000, %l6 = 00000000ffffffff
	lduha	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101408] = 000000ff00000000, %f30 = ffffffae f50000ff
	ldda	[%i4+%o4]0x80,%f30	! %f30 = 000000ff 00000000
!	Mem[0000000010001410] = 00000000, %l5 = 0000000000000000
	ldswa	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000021800141] = ff033eed, %asi = 80
	stba	%l4,[%o3+0x141]%asi	! Mem[0000000021800140] = ff003eed

p0_label_300:
	membar	#Sync			! Added by membar checker (62)
!	%l2 = 000000000000ffff, Mem[0000000010081418] = ff0000000000ff10
	stx	%l2,[%i2+0x018]		! Mem[0000000010081418] = 000000000000ffff
!	Mem[0000000010001410] = 00000000, %l1 = 0000000000000000
	swapa	[%i0+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000030141410] = 000000ff
	stwa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	%f6  = ff000000, Mem[00000000300c1408] = ffa53eff
	sta	%f6 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff000000
!	Mem[0000000010081408] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i2+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010001408] = 10ff0000 000000ff
	stda	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000 00000000
!	%l4 = 0000000000000000, Mem[0000000030101408] = ffffffff
	stwa	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	%l2 = 000000000000ffff, %l4 = 0000000000000000, %y  = 00000000
	sdiv	%l2,%l4,%l2		! Div by zero, %l0 = 0000000000000050
	mov	%l0,%y			! %y = 00000028
!	%f18 = 00000000, Mem[00000000300c1400] = 00000000
	sta	%f18,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ffffc3ca, %l5 = 0000000000000000
	lduh	[%o1+%g0],%l5		! %l5 = 000000000000ffff

p0_label_301:
!	Mem[0000000010001400] = 00000000, %l4 = 0000000000000000
	ldsha	[%i0+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l1 = 0000000000000000
	ldsba	[%i3+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l1 = 0000000000000000
	lduba	[%i1+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041410] = a15a0000, %l4 = 0000000000000000
	ldsba	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1410] = 00005aa1ffffffff, %l4 = 0000000000000000
	ldxa	[%i3+%o5]0x89,%l4	! %l4 = 00005aa1ffffffff
!	Mem[00000000100c1408] = ff000000, %l2 = 000000000000ffff
	ldsha	[%i3+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[000000001004140c] = ffffffff, %l5 = 000000000000ffff
	ldsw	[%i1+0x00c],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000021800000] = a5c5b05a, %l2 = 0000000000000000
	ldsha	[%o3+0x000]%asi,%l2	! %l2 = ffffffffffffa5c5
!	Mem[0000000010101400] = 00000000, %l7 = 0000000000000000
	lduba	[%i4+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f2  = 000000ff 00000000, %l0 = 0000000000000028
!	Mem[0000000030101420] = 000000002ef30000
	add	%i4,0x020,%g1
	stda	%f2,[%g1+%l0]ASI_PST16_S ! Mem[0000000030101420] = 000000002ef30000

p0_label_302:
!	Mem[0000000010081408] = ff0000ff, %l2 = ffffffffffffa5c5
	swapa	[%i2+%o4]0x88,%l2	! %l2 = 00000000ff0000ff
!	Mem[0000000030181408] = 0000ffff, %l5 = ffffffffffffffff
	ldstuba	[%i6+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	%l6 = 0000000000000000, immed = fffff10b, %y  = 00000028
	smul	%l6,-0xef5,%l2		! %l2 = 0000000000000000, %y = 00000000
!	Mem[0000000030001410] = 00000000, %l4 = 00005aa1ffffffff
	swapa	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000000
!	%l1 = 0000000000000000, Mem[00000000300c1408] = 000000ff
	stwa	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	Mem[0000000020800001] = ffffc3ca, %l7 = 0000000000000000
	ldstuba	[%o1+0x001]%asi,%l7	! %l7 = 000000ff000000ff
!	%f20 = ffffffff a15a0000, %l5 = 00000000000000ff
!	Mem[0000000030081400] = 0000000000000000
	stda	%f20,[%i2+%l5]ASI_PST32_SL ! Mem[0000000030081400] = 00005aa1ffffffff
!	%l4 = 0000000000000000, Mem[0000000010101408] = 000000ff
	stba	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff
!	%f30 = 000000ff 00000000, Mem[0000000010081400] = 950000ff 000000ff
	stda	%f30,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00000000, %f17 = 00001044
	lda	[%i4+%g0]0x80,%f17	! %f17 = 00000000

p0_label_303:
!	Mem[0000000010001408] = 00000000, %l7 = 00000000000000ff
	ldsba	[%i0+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001410] = ffffffff, %l3 = 0000000000000000
	ldsba	[%i0+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010081404] = 00000000, %l5 = 00000000000000ff
	ldswa	[%i2+0x004]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = 950000ff00000000, %l2 = 0000000000000000
	ldxa	[%i5+%o4]0x80,%l2	! %l2 = 950000ff00000000
!	Mem[0000000030181410] = 00000000, %l3 = ffffffffffffffff
	ldsha	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041400] = 0000000000001044, %f6  = ff000000 0000ff10
	ldda	[%i1+%g0]0x89,%f6 	! %f6  = 00000000 00001044
!	Mem[0000000030041400] = 0000000000001044, %f18 = 00000000 ff000000
	ldda	[%i1+%g0]0x89,%f18	! %f18 = 00000000 00001044
!	Mem[0000000030001408] = 00ffffff, %l3 = 0000000000000000
	ldsba	[%i0+%o4]0x81,%l3	! %l3 = 0000000000000000
!	%f7  = 00001044, %f17 = 00000000
	fcmps	%fcc1,%f7 ,%f17		! %fcc1 = 2
!	Starting 10 instruction Store Burst
!	%l2 = 950000ff00000000, Mem[0000000030081408] = 00000010ff000000
	stxa	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 950000ff00000000

p0_label_304:
!	%l6 = 0000000000000000, Mem[00000000300c1400] = 00000000
	stba	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	%l7 = 0000000000000000, Mem[00000000100c1428] = ffffffff
	sth	%l7,[%i3+0x028]		! Mem[00000000100c1428] = 0000ffff
!	%f16 = 00000000 00000000, Mem[0000000010041408] = ff000000 ffffffff
	stda	%f16,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000 00000000
!	%l5 = 0000000000000000, Mem[0000000010081434] = 00000000, %asi = 80
	stwa	%l5,[%i2+0x034]%asi	! Mem[0000000010081434] = 00000000
!	Mem[0000000030081408] = 950000ff, %l7 = 0000000000000000
	swapa	[%i2+%o4]0x81,%l7	! %l7 = 00000000950000ff
!	Mem[0000000030101400] = ff5a0000, %l6 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1404] = 0000009f, %l2 = 950000ff00000000
	swap	[%i3+0x004],%l2		! %l2 = 000000000000009f
!	Mem[00000000211c0001] = ff00fcae, %l2 = 000000000000009f
	ldstub	[%o2+0x001],%l2		! %l2 = 00000000000000ff
!	%f16 = 00000000, Mem[0000000010041410] = 00000000
	sta	%f16,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000, %l1 = 0000000000000000
	lduha	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000000

p0_label_305:
!	Mem[0000000020800000] = ffffc3ca, %l4 = 0000000000000000
	ldsb	[%o1+%g0],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010181410] = ff000000ff000095, %f8  = 44100000 00003eff
	ldda	[%i6+%o5]0x80,%f8 	! %f8  = ff000000 ff000095
!	Mem[000000001000141c] = 00000000, %l2 = 0000000000000000
	lduwa	[%i0+0x01c]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041410] = a15a0000, %f26 = 2ef3f120
	lda	[%i1+%o5]0x89,%f26	! %f26 = a15a0000
!	Mem[0000000010081410] = a15a0000, %l1 = 0000000000000000
	lduba	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041410] = a15a0000, %l2 = 0000000000000000
	ldsba	[%i1+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l3 = 0000000000000000
	lduwa	[%i4+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l1 = 0000000000000000
	ldswa	[%i4+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1410] = ffffffffa15a0000, %l5 = 0000000000000000
	ldxa	[%i3+%o5]0x81,%l5	! %l5 = ffffffffa15a0000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 00000000, %l1 = 0000000000000000
	swapa	[%i4+%o5]0x81,%l1	! %l1 = 0000000000000000

p0_label_306:
!	%f30 = 000000ff, Mem[00000000300c1408] = 00000000
	sta	%f30,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000ff
!	%l5 = ffffffffa15a0000, Mem[0000000020800040] = ffffbf87, %asi = 80
	stha	%l5,[%o1+0x040]%asi	! Mem[0000000020800040] = 0000bf87
!	%l0 = 00000028, %l1 = 00000000, Mem[0000000010181400] = ffffffff 44100000
	stda	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000028 00000000
!	%l4 = ffffffffffffffff, Mem[0000000010001406] = 00000000
	sth	%l4,[%i0+0x006]		! Mem[0000000010001404] = 0000ffff
!	%l0 = 0000000000000028, Mem[0000000030001400] = 00000000
	stwa	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000028
!	%l6 = 00000000, %l7 = 950000ff, Mem[00000000100c1410] = 00000000 a15a0000
	std	%l6,[%i3+%o5]		! Mem[00000000100c1410] = 00000000 950000ff
!	%l6 = 0000000000000000, Mem[0000000010101400] = 00000000
	stwa	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000
!	%f28 = ff000000 000000ff, Mem[00000000100c1410] = 00000000 950000ff
	stda	%f28,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff000000 000000ff
!	%f28 = ff000000 000000ff, Mem[0000000010101410] = 00005aa1 00000000
	stda	%f28,[%i4+0x010]%asi	! Mem[0000000010101410] = ff000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ffff000000000068, %f6  = 00000000 00001044
	ldda	[%i6+%o4]0x81,%f6 	! %f6  = ffff0000 00000068

p0_label_307:
!	Mem[0000000010041400] = 00000000 00000000, %l6 = 00000000, %l7 = 950000ff
	ldda	[%i1+%g0]0x88,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010141400] = 000000ff, %l5 = ffffffffa15a0000
	ldswa	[%i5+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001408] = 00000000, %l2 = 0000000000000000
	ldswa	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000000
!	%l0 = 0000000000000028, %l7 = 0000000000000000, %l2 = 0000000000000000
	addc	%l0,%l7,%l2		! %l2 = 0000000000000028
!	Mem[0000000010181410] = 950000ff000000ff, %l6 = 0000000000000000
	ldxa	[%i6+%o5]0x88,%l6	! %l6 = 950000ff000000ff
!	Mem[0000000010181410] = 000000ff, %l5 = 00000000000000ff
	ldswa	[%i6+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081400] = 000000ff, %l7 = 0000000000000000
	ldsha	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101410] = ff000000, %l0 = 0000000000000028
	ldswa	[%i4+%o5]0x80,%l0	! %l0 = ffffffffff000000
!	Mem[0000000030001400] = 00000028, %l0 = ffffffffff000000
	ldswa	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000028
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030141400] = 00000000
	stwa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000

p0_label_308:
!	%l0 = 0000000000000028, Mem[0000000010041438] = 000000ff1dfbd0f5
	stx	%l0,[%i1+0x038]		! Mem[0000000010041438] = 0000000000000028
!	%l0 = 00000028, %l1 = 00000000, Mem[0000000030001408] = ffffff00 00000000
	stda	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000028 00000000
!	%f0  = 950000ff 000000ff, %l6 = 950000ff000000ff
!	Mem[0000000010141400] = ff00000000000068
	stda	%f0,[%i5+%l6]ASI_PST32_P ! Mem[0000000010141400] = 950000ff000000ff
!	Mem[0000000030001410] = ffffffff, %l5 = 00000000000000ff
	swapa	[%i0+%o5]0x81,%l5	! %l5 = 00000000ffffffff
!	%l3 = 0000000000000000, Mem[0000000010081410] = a15a0000
	stwa	%l3,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000
!	%f20 = ffffffff a15a0000, Mem[0000000010041410] = 00000000 00000000
	stda	%f20,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffff a15a0000
!	%l2 = 00000028, %l3 = 00000000, Mem[0000000010001410] = 00000000 00005aa1
	stda	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000028 00000000
!	Mem[00000000201c0000] = 00008819, %l6 = 950000ff000000ff
	ldstuba	[%o0+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	%f4  = 00005aa1 00000000, %l7 = 0000000000000000
!	Mem[0000000030141420] = 46375da6265aff0a
	add	%i5,0x020,%g1
	stda	%f4,[%g1+%l7]ASI_PST32_SL ! Mem[0000000030141420] = 46375da6265aff0a
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff000095, %l0 = 0000000000000028
	ldswa	[%i5+%o4]0x88,%l0	! %l0 = ffffffffff000095

p0_label_309:
!	Mem[0000000010101410] = ff000000000000ff, %f10 = ff000000 00000000
	ldda	[%i4+0x010]%asi,%f10	! %f10 = ff000000 000000ff
!	%f15 = 00000000, %f18 = 00000000
	fcmps	%fcc3,%f15,%f18		! %fcc3 = 0
!	Mem[0000000030001410] = ff000000, %l0 = ffffffffff000095
	ldswa	[%i0+%o5]0x89,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010181400] = 28000000 00000000, %l2 = 00000028, %l3 = 00000000
	ldda	[%i6+0x000]%asi,%l2	! %l2 = 0000000028000000 0000000000000000
!	Mem[00000000100c1400] = 00000000, %f24 = 8b6516ff
	lda	[%i3+%g0]0x80,%f24	! %f24 = 00000000
!	Mem[0000000030081408] = 00000000, %l6 = 0000000000000000
	lduha	[%i2+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = ff000000 ff000000, %l4 = ffffffff, %l5 = ffffffff
	ldda	[%i3+%o4]0x89,%l4	! %l4 = 00000000ff000000 00000000ff000000
!	Mem[0000000010101408] = 000000ff00000000, %f12 = ffffffff 00000000
	ldd	[%i4+%o4],%f12		! %f12 = 000000ff 00000000
	membar	#Sync			! Added by membar checker (63)
!	Mem[0000000030001400] = 28000000 00000000 28000000 00000000
!	Mem[0000000030001410] = 000000ff 00000000 35b82ab9 65a46210
!	Mem[0000000030001420] = 0aff5a26 a65d3746 f9a45e93 9a50300e
!	Mem[0000000030001430] = e0776e03 1023d0d0 02ac1e89 2d72a12c
	ldda	[%i0]ASI_BLK_S,%f16	! Block Load from 0000000030001400
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 00000000, %l5 = 00000000ff000000
	swapa	[%i0+%g0]0x88,%l5	! %l5 = 0000000000000000

p0_label_310:
!	Mem[0000000010041408] = 00000000, %l4 = 00000000ff000000
	swapa	[%i1+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Code Fragment 3
p0_fragment_35:
!	%l0 = ffffffffff000000
	setx	0xd254d697e47752ba,%g7,%l0 ! %l0 = d254d697e47752ba
!	%l1 = 0000000000000000
	setx	0xab072017e7c5ce16,%g7,%l1 ! %l1 = ab072017e7c5ce16
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d254d697e47752ba
	setx	0x478ee03838ea7be8,%g7,%l0 ! %l0 = 478ee03838ea7be8
!	%l1 = ab072017e7c5ce16
	setx	0xb25497ffb40a3a57,%g7,%l1 ! %l1 = b25497ffb40a3a57
!	%l0 = 38ea7be8, %l1 = b40a3a57, Mem[0000000010081410] = 00000000 00000000
	stda	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 38ea7be8 b40a3a57
!	%l5 = 0000000000000000, Mem[0000000010101426] = 00003eff
	sth	%l5,[%i4+0x026]		! Mem[0000000010101424] = 00000000
!	%l4 = 0000000000000000, Mem[0000000010101430] = 3f80000000000000
	stx	%l4,[%i4+0x030]		! Mem[0000000010101430] = 0000000000000000
!	%f14 = 00005aff, Mem[0000000030081408] = 00000000
	sta	%f14,[%i2+%o4]0x81	! Mem[0000000030081408] = 00005aff
!	Mem[00000000300c1400] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i3+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030181400] = 00005aa1, %l7 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 000000a1000000ff
!	Mem[0000000030101410] = 00000000, %l7 = 00000000000000a1
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 950000ff, %l1 = b25497ffb40a3a57
	ldsba	[%i5+%g0]0x80,%l1	! %l1 = ffffffffffffff95

p0_label_311:
!	Mem[0000000010101410] = ff000000000000ff, %f0  = 950000ff 000000ff
	ldda	[%i4+0x010]%asi,%f0 	! %f0  = ff000000 000000ff
!	Mem[0000000010001400] = 000000ff, %l6 = 0000000000000000
	ldsb	[%i0+0x002],%l6		! %l6 = 0000000000000000
!	Mem[0000000010101408] = 000000ff, %l2 = 0000000028000000
	lduba	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101410] = 000000a1ffffffa1, %l1 = ffffffffffffff95
	ldxa	[%i4+%o5]0x81,%l1	! %l1 = 000000a1ffffffa1
!	Mem[00000000100c1400] = 00000000, %l7 = 0000000000000000
	ldsba	[%i3+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = 000000a1ffffffa1, %l0 = 478ee03838ea7be8
	ldxa	[%i4+%o5]0x81,%l0	! %l0 = 000000a1ffffffa1
!	Mem[0000000030141408] = 0000000000000000, %l0 = 000000a1ffffffa1
	ldxa	[%i5+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = 0000000000000000, %f10 = ff000000 000000ff
	ldda	[%i0+%o4]0x88,%f10	! %f10 = 00000000 00000000
!	Mem[00000000300c1408] = ff000000ff000000, %l3 = 0000000000000000
	ldxa	[%i3+%o4]0x89,%l3	! %l3 = ff000000ff000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000021800000] = a5c5b05a
	sth	%l4,[%o3+%g0]		! Mem[0000000021800000] = 0000b05a

p0_label_312:
!	%f15 = 00000000, %f2  = 000000ff
	fcmpes	%fcc1,%f15,%f2 		! %fcc1 = 1
!	%l0 = 0000000000000000, Mem[0000000030101400] = ff5a00ff
	stha	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = ff5a0000
!	%l5 = 0000000000000000, Mem[0000000030181400] = 00005aff
	stba	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = 00005a00
	membar	#Sync			! Added by membar checker (64)
!	%f22 = 35b82ab9, Mem[0000000030001410] = 000000ff
	sta	%f22,[%i0+%o5]0x81	! Mem[0000000030001410] = 35b82ab9
!	%l1 = 000000a1ffffffa1, Mem[00000000100c1400] = 00000000
	stha	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000ffa1
!	Mem[0000000010041410] = 00005aa1, %l4 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 0000000000005aa1
!	%f10 = 00000000, Mem[00000000100c1400] = 0000ffa1
	sta	%f10,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	Mem[0000000030141410] = 00000000, %l1 = 000000a1ffffffa1
	swapa	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%l3 = ff000000ff000000, Mem[0000000010141400] = 950000ff000000ff
	stxa	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = ff000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 00000000, %l0 = 0000000000000000
	ldswa	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000

p0_label_313:
!	Mem[0000000030181410] = 00000000, %l5 = 0000000000000000
	ldswa	[%i6+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l2 = 0000000000000000
	ldswa	[%i1+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Code Fragment 3
p0_fragment_36:
!	%l0 = 0000000000000000
	setx	0xdd35ea1fe736ee7c,%g7,%l0 ! %l0 = dd35ea1fe736ee7c
!	%l1 = 0000000000000000
	setx	0x531f14b7f1f19750,%g7,%l1 ! %l1 = 531f14b7f1f19750
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = dd35ea1fe736ee7c
	setx	0xf8af620fa44bd31f,%g7,%l0 ! %l0 = f8af620fa44bd31f
!	%l1 = 531f14b7f1f19750
	setx	0xe81c3a88702a7396,%g7,%l1 ! %l1 = e81c3a88702a7396
!	Mem[0000000030141400] = 00000000, %l5 = 0000000000000000
	lduwa	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000000
!	%l7 = 0000000000000000, %l0 = f8af620fa44bd31f, %l2 = 0000000000000000
	andn	%l7,%l0,%l2		! %l2 = 0000000000000000
!	Mem[0000000030181410] = 0000000000000000, %l5 = 0000000000000000
	ldxa	[%i6+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l2 = 0000000000000000
	ldswa	[%i1+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101410] = ff000000, %l1 = e81c3a88702a7396
	lduba	[%i4+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%f8  = ff000000, %f2  = 000000ff, %f1  = 000000ff
	fdivs	%f8 ,%f2 ,%f1 		! %f1  = ff800000
!	Starting 10 instruction Store Burst
!	%f22 = 35b82ab9 65a46210, %l2 = 0000000000000000
!	Mem[0000000030041430] = ff000000000000ff
	add	%i1,0x030,%g1
	stda	%f22,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030041430] = ff000000000000ff

p0_label_314:
!	%f19 = 00000000, Mem[0000000030181410] = 00000000
	sta	%f19,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	Mem[0000000010141400] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i5+%g0]0x80,%l5	! %l5 = 000000ff000000ff
!	%f5  = 00000000, Mem[0000000010181400] = 00000028
	sta	%f5 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	Mem[0000000030041400] = 00001044, %l4 = 0000000000005aa1
	swapa	[%i1+%g0]0x89,%l4	! %l4 = 0000000000001044
!	%l4 = 0000000000001044, Mem[00000000100c1410] = ff000000
	stwa	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00001044
!	Mem[0000000010181400] = 00000000, %l4 = 0000000000001044
	swapa	[%i6+%g0]0x80,%l4	! %l4 = 0000000000000000
!	%f17 = 00000000, Mem[0000000010101400] = 00000000
	sta	%f17,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000
!	Mem[0000000030081410] = 000000ff, %l7 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l7	! %l7 = 000000ff000000ff
!	%l4 = 0000000000000000, Mem[0000000010101408] = ff000000
	stwa	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = fffffcae, %l1 = 00000000000000ff
	lduba	[%o2+0x000]%asi,%l1	! %l1 = 00000000000000ff

p0_label_315:
!	Mem[0000000010001428] = fff1a5c5, %l7 = 00000000000000ff
	lduha	[%i0+0x02a]%asi,%l7	! %l7 = 000000000000a5c5
!	Mem[0000000010181400] = 00001044, %l1 = 00000000000000ff
	ldswa	[%i6+%g0]0x80,%l1	! %l1 = 0000000000001044
!	Mem[0000000030001400] = 0000000000000028, %f28 = e0776e03 1023d0d0
	ldda	[%i0+%g0]0x89,%f28	! %f28 = 00000000 00000028
!	Mem[0000000010081400] = ff000000, %l1 = 0000000000001044
	ldswa	[%i2+%g0]0x88,%l1	! %l1 = ffffffffff000000
!	Mem[0000000010181408] = 00000000, %l0 = f8af620fa44bd31f
	lduba	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101418] = ff000000, %l2 = 0000000000000000
	ldsb	[%i4+0x01a],%l2		! %l2 = 0000000000000000
!	Mem[0000000010081410] = e87bea38, %l7 = 000000000000a5c5
	ldstuba	[%i2+%o5]0x88,%l7	! %l7 = 00000038000000ff
!	Mem[0000000030181408] = ffff0000, %l4 = 0000000000000000
	lduba	[%i6+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001400] = 000000ff, %l5 = 00000000000000ff
	ldsba	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 00005aa1, %l5 = 0000000000000000
	swapa	[%i1+%g0]0x89,%l5	! %l5 = 0000000000005aa1

p0_label_316:
!	%l2 = 0000000000000000, Mem[0000000030001410] = b92ab835
	stwa	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010001400] = ffff0000ff000000
	stxa	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000000
!	%l3 = ff000000ff000000, Mem[00000000100c140c] = 00000000, %asi = 80
	stwa	%l3,[%i3+0x00c]%asi	! Mem[00000000100c140c] = ff000000
!	Mem[0000000010041428] = 20f1f32e00000000, %l6 = 0000000000000000, %l2 = 0000000000000000
	add	%i1,0x28,%g1
	casxa	[%g1]0x80,%l6,%l2	! %l2 = 20f1f32e00000000
!	%l0 = 0000000000000000, Mem[0000000030181408] = 680000000000ffff
	stxa	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000000000000000
!	%l5 = 0000000000005aa1, Mem[0000000010101410] = ff000000
	stwa	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 00005aa1
!	Mem[0000000010081420] = 4410000000003eff, %l4 = 00000000000000ff, %l2 = 20f1f32e00000000
	add	%i2,0x20,%g1
	casxa	[%g1]0x80,%l4,%l2	! %l2 = 4410000000003eff
!	%l3 = ff000000ff000000, Mem[0000000010001438] = ff0000000000ff10
	stx	%l3,[%i0+0x038]		! Mem[0000000010001438] = ff000000ff000000
!	Mem[0000000010041408] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ffa53eff00000000, %f18 = 28000000 00000000
	ldda	[%i1+%o4]0x89,%f18	! %f18 = ffa53eff 00000000

p0_label_317:
!	Mem[000000001000141c] = 00000000, %l4 = 00000000000000ff
	ldsha	[%i0+0x01c]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141408] = 00000000 ff000095, %l6 = 000000ff, %l7 = 00000038
	ldda	[%i5+%o4]0x88,%l6	! %l6 = 00000000ff000095 0000000000000000
!	Mem[0000000030001408] = 28000000, %l7 = 0000000000000000
	lduwa	[%i0+%o4]0x81,%l7	! %l7 = 0000000028000000
!	Mem[0000000030081410] = ff000000 00000000, %l6 = ff000095, %l7 = 28000000
	ldda	[%i2+%o5]0x81,%l6	! %l6 = 00000000ff000000 0000000000000000
!	Mem[0000000010181400] = 44100000, %l7 = 0000000000000000
	lduha	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = 00005aff, %l4 = 0000000000000000
	ldswa	[%i5+%o5]0x80,%l4	! %l4 = 0000000000005aff
!	Mem[00000000100c1430] = 4410000000003eff, %f30 = 02ac1e89 2d72a12c
	ldda	[%i3+0x030]%asi,%f30	! %f30 = 44100000 00003eff
!	Mem[0000000030101400] = 00005aff, %l1 = ffffffffff000000
	lduwa	[%i4+%g0]0x81,%l1	! %l1 = 0000000000005aff
!	Mem[0000000030041400] = 00000000, %l4 = 0000000000005aff
	ldsba	[%i1+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = ff000000, %l7 = 00000000, Mem[0000000030101410] = a1000000 a1ffffff
	stda	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = ff000000 00000000

p0_label_318:
!	%f0  = ff000000 ff800000 000000ff 00000000
!	%f4  = 00005aa1 00000000 ffff0000 00000068
!	%f8  = ff000000 ff000095 00000000 00000000
!	%f12 = 000000ff 00000000 00005aff 00000000
	stda	%f0,[%i3]ASI_BLK_PL	! Block Store to 00000000100c1400
!	%l7 = 0000000000000000, Mem[0000000010041428] = 20f1f32e00000000
	stx	%l7,[%i1+0x028]		! Mem[0000000010041428] = 0000000000000000
	membar	#Sync			! Added by membar checker (65)
!	Mem[00000000100c1410] = 00000000, %l2 = 4410000000003eff
	swapa	[%i3+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101400] = 00000000, %l1 = 0000000000005aff
	ldstuba	[%i4+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000010041400] = 00000000
	stwa	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	Mem[00000000300c1400] = 000000ff, %l1 = 0000000000000000
	swapa	[%i3+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%f12 = 000000ff 00000000, %l1 = 00000000000000ff
!	Mem[0000000010101400] = ff000000000000ff
	stda	%f12,[%i4+%l1]ASI_PST16_PL ! Mem[0000000010101400] = 00000000ff000000
!	Mem[0000000010081410] = ffea7be8, %l6 = 00000000ff000000, %asi = 80
	swapa	[%i2+0x010]%asi,%l6	! %l6 = 00000000ffea7be8
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 000000ff, %l1 = 00000000000000ff
	ldswa	[%i5+%g0]0x88,%l1	! %l1 = 00000000000000ff

p0_label_319:
!	Mem[0000000010141408] = ff000095, %l0 = 0000000000000000
	ldsha	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000095
!	%l3 = ff000000ff000000, imm = fffffffffffffa48, %l0 = 0000000000000095
	andn	%l3,-0x5b8,%l0		! %l0 = 0000000000000000
!	Mem[0000000030041410] = 00005aa1, %l4 = 0000000000000000
	ldswa	[%i1+%o5]0x81,%l4	! %l4 = 0000000000005aa1
!	Mem[0000000010081400] = 000000ff, %l5 = 0000000000005aa1
	ldswa	[%i2+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101410] = 00005aa1, %f17 = 00000000
	lda	[%i4+%o5]0x80,%f17	! %f17 = 00005aa1
!	Mem[0000000010141404] = ff000000, %l1 = 00000000000000ff
	lduh	[%i5+0x006],%l1		! %l1 = 0000000000000000
!	Mem[0000000010181400] = 00001044, %l0 = 0000000000000000
	ldsba	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = 00005aa1ffffffff, %f20 = 000000ff 00000000
	ldda	[%i2+%g0]0x81,%f20	! %f20 = 00005aa1 ffffffff
!	Mem[0000000030081400] = 00005aa1ffffffff, %f28 = 00000000 00000028
	ldda	[%i2+%g0]0x81,%f28	! %f28 = 00005aa1 ffffffff
!	Starting 10 instruction Store Burst
!	%f10 = 00000000 00000000, Mem[00000000300c1400] = 00000000 44100000
	stda	%f10,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 00000000

p0_label_320:
!	Mem[0000000030181408] = 0000000000000000, %f24 = 0aff5a26 a65d3746
	ldda	[%i6+%o4]0x81,%f24	! %f24 = 00000000 00000000
!	Mem[0000000030001400] = 00000028, %l1 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 00000028000000ff
!	%f24 = 00000000 00000000, Mem[0000000030141400] = 00000000 00000000
	stda	%f24,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000 00000000
!	%l1 = 0000000000000028, Mem[00000000100c1418] = 680000000000ffff, %asi = 80
	stxa	%l1,[%i3+0x018]%asi	! Mem[00000000100c1418] = 0000000000000028
!	%l5 = 00000000000000ff, Mem[00000000300c1410] = ffffffff
	stha	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffff00ff
!	%f20 = 00005aa1 ffffffff, %l6 = 00000000ffea7be8
!	Mem[0000000030181438] = 35b82ab965a46210
	add	%i6,0x038,%g1
	stda	%f20,[%g1+%l6]ASI_PST16_S ! Mem[0000000030181438] = 00002ab965a46210
!	%l4 = 0000000000005aa1, Mem[0000000010181438] = 0000ff00, %asi = 80
	stha	%l4,[%i6+0x038]%asi	! Mem[0000000010181438] = 5aa1ff00
!	Mem[0000000030081408] = ff5a0000, %l2 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%f12 = 000000ff, Mem[000000001008142c] = 00000000
	sta	%f12,[%i2+0x02c]%asi	! Mem[000000001008142c] = 000000ff
!	Starting 10 instruction Load Burst
!	%f17 = 00005aa1, %f0  = ff000000
	fcmps	%fcc0,%f17,%f0 		! %fcc0 = 2

p0_label_321:
!	Mem[0000000010001418] = 10000000, %l1 = 0000000000000028
	lduha	[%i0+0x01a]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081410] = 000000ff, %l4 = 0000000000005aa1
	lduwa	[%i2+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1438] = 00000000ff5a0000, %f6  = ffff0000 00000068
	ldd	[%i3+0x038],%f6 	! %f6  = 00000000 ff5a0000
	membar	#Sync			! Added by membar checker (66)
!	Mem[00000000300c1400] = 00000000 00000000 000000ff 000000ff
!	Mem[00000000300c1410] = ff00ffff a15a0000 000000a1 5a007396
!	Mem[00000000300c1420] = 8b6516ff 5200ffff 2ef3f120 00005aa1
!	Mem[00000000300c1430] = ff000000 000000ff ffffffae f50000ff
	ldda	[%i3]ASI_BLK_AIUS,%f16	! Block Load from 00000000300c1400
!	Mem[0000000030081400] = a15a0000, %l2 = 0000000000000000
	ldsba	[%i2+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081410] = 00000000000000ff, %f0  = ff000000 ff800000
	ldda	[%i2+%o5]0x89,%f0 	! %f0  = 00000000 000000ff
!	Mem[0000000010141408] = ff000095, %l3 = ff000000ff000000
	ldsha	[%i5+%o4]0x88,%l3	! %l3 = 0000000000000095
!	Mem[0000000030101400] = 00005aff, %l6 = 00000000ffea7be8
	ldsha	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000218000c0] = 0000dddc, %l5 = 00000000000000ff
	lduh	[%o3+0x0c0],%l5		! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = ff008819, %l2 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l2	! %l2 = 000000ff000000ff

p0_label_322:
!	%l6 = 0000000000000000, Mem[0000000010141410] = ff5a0000
	stba	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = ff5a0000
!	%f1  = 000000ff, Mem[0000000030141410] = a1ffffff
	sta	%f1 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000ff
!	%f14 = 00005aff 00000000, %l0 = 0000000000000000
!	Mem[0000000010141408] = 950000ff00000000
	add	%i5,0x008,%g1
	stda	%f14,[%g1+%l0]ASI_PST8_P ! Mem[0000000010141408] = 950000ff00000000
!	Mem[0000000030101400] = ff5a0000, %l2 = 00000000000000ff
	swapa	[%i4+%g0]0x89,%l2	! %l2 = 00000000ff5a0000
!	%l2 = 00000000ff5a0000, %l3 = 0000000000000095, %l1 = 0000000000000000
	add	%l2,%l3,%l1		! %l1 = 00000000ff5a0095
!	%f10 = 00000000, Mem[0000000010101400] = 00000000
	sta	%f10,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	%l3 = 0000000000000095, Mem[0000000010181408] = 1000000000000000
	stxa	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000000000000095
!	Mem[0000000030041408] = 00000000, %l3 = 0000000000000095
	swapa	[%i1+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141410] = ff000000, %l2 = 00000000ff5a0000
	ldstuba	[%i5+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001014140c] = 00000000, %l7 = 0000000000000000
	lduha	[%i5+0x00c]%asi,%l7	! %l7 = 0000000000000000

p0_label_323:
!	Mem[00000000300c1400] = 0000000000000000, %f10 = 00000000 00000000
	ldda	[%i3+%g0]0x81,%f10	! %f10 = 00000000 00000000
!	Mem[0000000010001408] = 0000000000000000, %l5 = 0000000000000000
	ldxa	[%i0+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081400] = 00005aa1, %f14 = 00005aff
	lda	[%i2+%g0]0x81,%f14	! %f14 = 00005aa1
!	Mem[00000000100c1408] = 00000000 ff000000, %l0 = 00000000, %l1 = ff5a0095
	ldda	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000000 00000000ff000000
!	Mem[0000000010101410] = 00005aa1000000ff, %l3 = 0000000000000000
	ldxa	[%i4+%o5]0x80,%l3	! %l3 = 00005aa1000000ff
!	Mem[0000000030181408] = 0000000000000000, %l3 = 00005aa1000000ff
	ldxa	[%i6+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %f0  = 00000000
	lda	[%i4+%g0]0x80,%f0 	! %f0 = 00000000
!	Mem[0000000030081400] = ffffffffa15a0000, %l6 = 0000000000000000
	ldxa	[%i2+%g0]0x89,%l6	! %l6 = ffffffffa15a0000
!	Mem[0000000030141410] = ff0000ff, %f14 = 00005aa1
	lda	[%i5+%o5]0x89,%f14	! %f14 = ff0000ff
!	Starting 10 instruction Store Burst
!	%f3  = 00000000, Mem[0000000030001408] = 00000028
	sta	%f3 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000

p0_label_324:
!	Mem[00000000201c0000] = ff008819, %l7 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030041410] = 00005aa1, %l5 = 0000000000000000
	ldstuba	[%i1+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000010141408] = 00000000ff000095
	stxa	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000020800000] = ffffc3ca, %asi = 80
	stba	%l2,[%o1+0x000]%asi	! Mem[0000000020800000] = 00ffc3ca
!	%f2  = 000000ff, Mem[0000000010141408] = 00000000
	sta	%f2 ,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000ff
!	%l7 = 00000000000000ff, Mem[0000000010041428] = 00000000
	stw	%l7,[%i1+0x028]		! Mem[0000000010041428] = 000000ff
!	%f0  = 00000000 000000ff 000000ff 00000000
!	%f4  = 00005aa1 00000000 00000000 ff5a0000
!	%f8  = ff000000 ff000095 00000000 00000000
!	%f12 = 000000ff 00000000 ff0000ff 00000000
	stda	%f0,[%i0]ASI_BLK_AIUP	! Block Store to 0000000010001400
!	Mem[0000000030101408] = 00000000, %l2 = 0000000000000000
	swapa	[%i4+%o4]0x89,%l2	! %l2 = 0000000000000000
!	%l4 = 00000000000000ff, Mem[0000000010081409] = c5a5ffff, %asi = 80
	stba	%l4,[%i2+0x009]%asi	! Mem[0000000010081408] = c5ffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00005aff000000a1, %l1 = 00000000ff000000
	ldx	[%i5+%o5],%l1		! %l1 = 00005aff000000a1

p0_label_325:
!	Mem[0000000010041404] = 00000000, %l0 = 0000000000000000
	ldub	[%i1+0x006],%l0		! %l0 = 0000000000000000
!	%l7 = 00000000000000ff, %l0 = 0000000000000000, %y  = 00000000
	smul	%l7,%l0,%l0		! %l0 = 0000000000000000, %y = 00000000
	membar	#Sync			! Added by membar checker (67)
!	Mem[0000000010141400] = ff000000 ff000000 000000ff 00000000
!	Mem[0000000010141410] = 00005aff 000000a1 00000000 00000000
!	Mem[0000000010141420] = 000000ff 00000000 00000000 000000ff
!	Mem[0000000010141430] = ff000000 0000fff9 00000000 ffa53eff
	ldda	[%i5]ASI_BLK_AIUP,%f0	! Block Load from 0000000010141400
!	Mem[0000000030041400] = 00000000, %l4 = 00000000000000ff
	lduwa	[%i1+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001400] = 00000000 000000ff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i0+%g0]0x89,%l2	! %l2 = 00000000000000ff 0000000000000000
!	Mem[0000000010181400] = 00000000 44100000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i6+%g0]0x88,%l4	! %l4 = 0000000044100000 0000000000000000
!	Mem[0000000010041408] = 000000ff, %l4 = 0000000044100000
	lduha	[%i1+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c143c] = ff5a0000, %f31 = f50000ff
	lda	[%i3+0x03c]%asi,%f31	! %f31 = ff5a0000
!	Mem[00000000300c1400] = 00000000, %l4 = 00000000000000ff
	lduba	[%i3+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = ff000000, %l7 = 00000000000000ff
	ldstuba	[%i3+%o4]0x89,%l7	! %l7 = 00000000000000ff

p0_label_326:
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010001410] = a15a0000 00000000
	stda	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 00000000
!	%l7 = 0000000000000000, Mem[0000000010001410] = 0000000000000000
	stxa	%l7,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000000000
!	%l4 = 00000000, %l5 = 00000000, Mem[00000000300c1408] = ff0000ff 000000ff
	stda	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000 00000000
!	%l7 = 0000000000000000, Mem[0000000010041430] = 00000000
	stb	%l7,[%i1+0x030]		! Mem[0000000010041430] = 00000000
!	Mem[0000000020800040] = 0000bf87, %l7 = 0000000000000000
	ldstub	[%o1+0x040],%l7		! %l7 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000030181400] = 005a0000
	stwa	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	Mem[0000000010041410] = 00000000, %l6 = ffffffffa15a0000
	ldstuba	[%i1+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	%f16 = 00000000, Mem[0000000030081408] = ff5a00ff
	sta	%f16,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%l4 = 0000000000000000, Mem[00000000211c0001] = fffffcae, %asi = 80
	stba	%l4,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff00fcae
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ff000000 ff000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i5+%g0]0x80,%l4	! %l4 = 00000000ff000000 00000000ff000000

p0_label_327:
!	Mem[0000000010101400] = 00000000, %l1 = 00005aff000000a1
	ldsba	[%i4+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l5 = 00000000ff000000
	ldswa	[%i1+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181408] = 95000000, %f21 = a15a0000
	lda	[%i6+%o4]0x80,%f21	! %f21 = 95000000
!	Mem[0000000030041400] = 00000000, %f24 = 8b6516ff
	lda	[%i1+%g0]0x89,%f24	! %f24 = 00000000
!	%l5 = 0000000000000000, imm = 0000000000000d8d, %l6 = 0000000000000000
	or	%l5,0xd8d,%l6		! %l6 = 0000000000000d8d
!	Mem[0000000010041400] = 0000000000000000, %f18 = 000000ff 000000ff
	ldda	[%i1+%g0]0x88,%f18	! %f18 = 00000000 00000000
!	Mem[0000000010181428] = 0e30509a, %l5 = 0000000000000000
	ldub	[%i6+0x028],%l5		! %l5 = 000000000000000e
!	Mem[0000000030101408] = 00000000, %l5 = 000000000000000e
	ldswa	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181408] = 95000000 00000000, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i6+%o4]0x80,%l2	! %l2 = 0000000095000000 0000000000000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (68)
!	%l1 = 0000000000000000, Mem[0000000010141400] = ff000000ff000000
	stxa	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000000000000000

p0_label_328:
!	%l4 = 00000000ff000000, Mem[0000000010101410] = a15a0000
	stba	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = a15a0000
!	Mem[0000000010081408] = c5ffffff, %l3 = 0000000000000000
	swapa	[%i2+%o4]0x80,%l3	! %l3 = 00000000c5ffffff
!	%l5 = 0000000000000000, Mem[00000000300c1400] = 0000000000000000
	stxa	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000000000000
!	Mem[0000000010141408] = 000000ff00000000, %l4 = 00000000ff000000, %l3 = 00000000c5ffffff
	add	%i5,0x08,%g1
	casxa	[%g1]0x80,%l4,%l3	! %l3 = 000000ff00000000
!	%f6  = 00000000, Mem[0000000010181414] = ff000095
	st	%f6 ,[%i6+0x014]	! Mem[0000000010181414] = 00000000
!	Mem[00000000100c1408] = 00000000, %l4 = 00000000ff000000
	swapa	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000000
!	%l3 = 000000ff00000000, %l6 = 0000000000000d8d, %l6 = 0000000000000d8d
	subc	%l3,%l6,%l6		! %l6 = 000000fefffff273
!	Mem[00000000300c1408] = 00000000, %f10 = 00000000
	lda	[%i3+%o4]0x81,%f10	! %f10 = 00000000
!	%l3 = 000000ff00000000, Mem[0000000010001408] = 00000000ff000000
	stxa	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 0000000000000000, %l5 = 0000000000000000
	ldxa	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000000

p0_label_329:
!	Mem[0000000030001410] = 00000000, %l3 = 000000ff00000000
	lduwa	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 000000ff 00000000, %l6 = fffff273, %l7 = 00000000
	ldd	[%i5+%o4],%l6		! %l6 = 00000000000000ff 0000000000000000
!	Mem[0000000010041410] = 000000ff, %l2 = 0000000095000000
	ldsba	[%i1+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030001400] = ff000000, %l3 = 0000000000000000
	lduba	[%i0+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101410] = ff000000, %l7 = 0000000000000000
	lduba	[%i4+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[000000001000143c] = 00000000, %l5 = 0000000000000000
	ldub	[%i0+0x03e],%l5		! %l5 = 0000000000000000
!	Mem[0000000010141438] = 00000000 ffa53eff, %l4 = 00000000, %l5 = 00000000
	ldd	[%i5+0x038],%l4		! %l4 = 0000000000000000 00000000ffa53eff
!	Mem[0000000010001408] = 00000000, %l5 = 00000000ffa53eff
	ldswa	[%i0+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101408] = 000000ff, %l1 = 0000000000000000
	ldsha	[%i4+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = ff008819, %l6 = 00000000000000ff
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 00000000000000ff

p0_label_330:
!	%f20 = ff00ffff 95000000, %l7 = 0000000000000000
!	Mem[0000000030041408] = 00000095ff3ea5ff
	add	%i1,0x008,%g1
	stda	%f20,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030041408] = 00000095ff3ea5ff
!	Mem[00000000100c1408] = 000000ff, %l4 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[00000000100c1400] = 000080ff
	stwa	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030081400] = a15a0000 ffffffff
	stda	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000 00000000
!	Mem[0000000010081410] = 000000ff, %l0 = 0000000000000000
	ldstuba	[%i2+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	%f17 = 00000000, Mem[000000001000141c] = ff5a0000
	st	%f17,[%i0+0x01c]	! Mem[000000001000141c] = 00000000
!	%f11 = 000000ff, Mem[0000000010041400] = 00000000
	sta	%f11,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000ff
!	%l0 = 00000000000000ff, Mem[00000000300c1400] = 00000000
	stha	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ff
!	%f4  = 00005aff 000000a1, %l5 = 0000000000000000
!	Mem[0000000010141418] = 0000000000000000
	add	%i5,0x018,%g1
	stda	%f4,[%g1+%l5]ASI_PST8_P ! Mem[0000000010141418] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 000000ff, %l5 = 0000000000000000
	ldsba	[%i6+%o5]0x88,%l5	! %l5 = ffffffffffffffff

p0_label_331:
!	Mem[0000000010141410] = ff5a0000, %l7 = 0000000000000000
	ldswa	[%i5+%o5]0x88,%l7	! %l7 = ffffffffff5a0000
!	Mem[0000000030001400] = 00000000 000000ff, %l4 = 000000ff, %l5 = ffffffff
	ldda	[%i0+%g0]0x89,%l4	! %l4 = 00000000000000ff 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l2 = ffffffffffffffff
	lduha	[%i3+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l4 = 00000000000000ff
	lduba	[%i4+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181410] = ff000000, %l3 = 00000000000000ff
	ldsh	[%i6+%o5],%l3		! %l3 = ffffffffffffff00
!	Mem[0000000030001400] = ff000000, %l0 = 00000000000000ff
	lduba	[%i0+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1418] = 00000000 00000028, %l4 = 00000000, %l5 = 00000000
	ldd	[%i3+0x018],%l4		! %l4 = 0000000000000000 0000000000000028
!	%l4 = 0000000000000000, %l2 = 0000000000000000, %l6 = 0000000000000000
	orn	%l4,%l2,%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030001400] = ff000000, %l1 = 00000000000000ff
	ldsha	[%i0+%g0]0x81,%l1	! %l1 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 000000ff, %l3 = ffffffffffffff00
	ldsw	[%i3+%g0],%l3		! %l3 = 00000000000000ff

p0_label_332:
!	Mem[0000000010141416] = 000000a1, %l1 = ffffffffffffff00
	ldstub	[%i5+0x016],%l1		! %l1 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000010141408] = 000000ff00000000
	stxa	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000000000000000
!	%l6 = ffffffff, %l7 = ff5a0000, Mem[00000000100c1410] = 00003eff a15a0000
	stda	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffffffff ff5a0000
!	%l7 = ffffffffff5a0000, Mem[0000000010181400] = 00001044
	stba	%l7,[%i6+%g0]0x80	! Mem[0000000010181400] = 00001044
!	Mem[0000000030081400] = 00000000, %l0 = 00000000000000ff
	swapa	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000000
!	%l6 = ffffffffffffffff, Mem[0000000010141410] = 00005aff
	stwa	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffffff
!	%f14 = 00000000, Mem[0000000010041418] = ffffffff
	sta	%f14,[%i1+0x018]%asi	! Mem[0000000010041418] = 00000000
!	%l3 = 00000000000000ff, Mem[0000000030001400] = 00000000000000ff
	stxa	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000030181410] = 0000000000000000
	stxa	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00000000ff000000, %l1 = 0000000000000000
	ldxa	[%i4+%g0]0x80,%l1	! %l1 = 00000000ff000000

p0_label_333:
!	Mem[0000000010041410] = ff000000, %l4 = 0000000000000000
	ldsha	[%i1+%o5]0x80,%l4	! %l4 = ffffffffffffff00
!	Mem[000000001010140c] = 00000000, %l0 = 0000000000000000
	ldsha	[%i4+0x00e]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1410] = ff00ffffa15a0000, %f16 = 00000000 00000000
	ldda	[%i3+%o5]0x81,%f16	! %f16 = ff00ffff a15a0000
!	Mem[0000000010041420] = ff00ffff, %l4 = ffffffffffffff00
	ldsba	[%i1+0x023]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010181410] = ff00000000000000, %l6 = ffffffffffffffff
	ldxa	[%i6+0x010]%asi,%l6	! %l6 = ff00000000000000
!	Mem[00000000211c0000] = ff00fcae, %l7 = ffffffffff5a0000
	ldub	[%o2+0x001],%l7		! %l7 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l3 = 00000000000000ff
	lduba	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001430] = 000000ff, %l1 = 00000000ff000000
	ldsh	[%i0+0x032],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010101430] = 00000000, %l3 = 0000000000000000
	ldub	[%i4+0x030],%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010081408] = 0000000000000000
	stxa	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000000

p0_label_334:
!	Mem[0000000030141400] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i5+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%l5 = 0000000000000028, Mem[00000000211c0001] = ff00fcae, %asi = 80
	stba	%l5,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff28fcae
!	%l6 = ff00000000000000, Mem[0000000030181408] = 00000000
	stha	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	Mem[0000000010141404] = 00000000, %l3 = 0000000000000000, %asi = 80
	swapa	[%i5+0x004]%asi,%l3	! %l3 = 0000000000000000
!	%f14 = 00000000 ffa53eff, Mem[00000000100c1408] = 00000000 ff000000
	stda	%f14,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 ffa53eff
!	%l1 = 00000000000000ff, Mem[0000000010001410] = 0000000000000000
	stxa	%l1,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000000000ff
!	Mem[00000000100c1408] = 00000000, %l6 = ff00000000000000
	swapa	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101410] = ff000000, %l1 = 00000000000000ff
	ldstuba	[%i4+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1410] = ffffffff, %l3 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l3	! %l3 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ff000000, %l4 = ffffffffffffffff
	ldsh	[%i1+0x00a],%l4		! %l4 = 0000000000000000

p0_label_335:
!	Mem[0000000010001400] = 00000000, %l1 = 0000000000000000
	lduba	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1400] = ff000000, %l2 = 0000000000000000
	lduba	[%i3+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181400] = 00001044, %l2 = 00000000000000ff
	lduba	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000211c0000] = ff28fcae, %l1 = 0000000000000000
	lduh	[%o2+%g0],%l1		! %l1 = 000000000000ff28
!	Mem[0000000010041430] = 00000000ff000000, %f20 = ff00ffff 95000000
	ldda	[%i1+0x030]%asi,%f20	! %f20 = 00000000 ff000000
!	Mem[0000000030181408] = 00000000, %l3 = 00000000ffffffff
	ldsha	[%i6+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001410] = 00000000, %l1 = 000000000000ff28
	ldswa	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l0 = 0000000000000000
	ldsha	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001410] = 00000000, %l6 = 0000000000000000
	ldsha	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[00000000100c1408] = 00000000
	stha	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000

p0_label_336:
!	%l7 = 0000000000000000, Mem[000000001010141e] = 0000ff10, %asi = 80
	stba	%l7,[%i4+0x01e]%asi	! Mem[000000001010141c] = 00000010
!	Mem[0000000030181400] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000030181410] = 00000000
	stwa	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	%l5 = 0000000000000028, Mem[00000000300c1408] = 00000000
	stha	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000028
!	Mem[0000000021800080] = ffff0203, %l3 = 0000000000000000
	ldstub	[%o3+0x080],%l3		! %l3 = 000000ff000000ff
!	Mem[00000000100c1410] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%l2 = 0000000000000000, immd = 0000000000000494, %l3  = 00000000000000ff
	mulx	%l2,0x494,%l3		! %l3 = 0000000000000000
!	Mem[0000000030081410] = ff000000, %l3 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l3	! %l3 = 00000000ff000000
!	%f22 = 000000a1 5a007396, Mem[0000000010081418] = 00000000 0000ffff
	stda	%f22,[%i2+0x018]%asi	! Mem[0000000010081418] = 000000a1 5a007396
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %l2 = 0000000000000000
	lduwa	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000

p0_label_337:
!	Mem[00000000100c1408] = 00000000, %l3 = 00000000ff000000
	lduha	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = ff000000, %l2 = 0000000000000000
	ldsba	[%i3+%g0]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030081408] = 00000000, %l4 = 0000000000000000
	lduha	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%l2 = ffffffffffffffff, imm = fffffffffffffd94, %l0 = 0000000000000000
	addc	%l2,-0x26c,%l0		! %l0 = fffffffffffffd93
!	Mem[0000000010001400] = 00000000000000ff, %f12 = ff000000 0000fff9
	ldd	[%i0+%g0],%f12		! %f12 = 00000000 000000ff
!	Mem[0000000030001408] = 00000000, %l2 = ffffffffffffffff
	lduha	[%i0+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000021800180] = 66ff8f81, %l0 = fffffffffffffd93
	lduba	[%o3+0x181]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001410] = 00000000, %l4 = 0000000000000000
	lduha	[%i0+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = 00005aa1 000000ff, %l4 = 00000000, %l5 = 00000028
	ldda	[%i4+%o5]0x80,%l4	! %l4 = 0000000000005aa1 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[00000000211c0000] = ff28fcae
	stb	%l7,[%o2+%g0]		! Mem[00000000211c0000] = 0028fcae

p0_label_338:
!	%l5 = 00000000000000ff, Mem[0000000010081400] = 000000ff
	stba	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = ff0000ff
!	Mem[00000000300c1408] = 00000028, %l3 = 0000000000000000
	ldstuba	[%i3+%o4]0x89,%l3	! %l3 = 00000028000000ff
!	Mem[0000000030001410] = 00000000, %l3 = 0000000000000028
	swapa	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000000
!	%l4 = 00005aa1, %l5 = 000000ff, Mem[0000000010081408] = 00000000 00000000
	stda	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 00005aa1 000000ff
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030181400] = 000000ff 00000000
	stda	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000 00000000
!	%f23 = 5a007396, Mem[0000000010041400] = ff000000
	sta	%f23,[%i1+%g0]0x80	! Mem[0000000010041400] = 5a007396
!	%l0 = 00000000000000ff, Mem[0000000010081404] = 00000000
	stb	%l0,[%i2+0x004]		! Mem[0000000010081404] = ff000000
!	%l5 = 00000000000000ff, Mem[0000000010081410] = 000000ff
	stha	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff
!	%l0 = 00000000000000ff, Mem[0000000010101400] = 00000000
	stba	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ff000000 ff0000ff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i5+%o5]0x89,%l2	! %l2 = 00000000ff0000ff 00000000ff000000

p0_label_339:
!	Mem[00000000100c1400] = ff000000ff000000, %f10 = 00000000 000000ff
	ldda	[%i3+%g0]0x88,%f10	! %f10 = ff000000 ff000000
!	Mem[00000000201c0000] = ffff8819, %l2 = 00000000ff0000ff
	ldsh	[%o0+%g0],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000030081408] = 00000000, %f29 = 000000ff
	lda	[%i2+%o4]0x81,%f29	! %f29 = 00000000
!	Mem[0000000010001408] = 00000000, %l3 = 00000000ff000000
	ldswa	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001410] = 28000000, %l6 = 0000000000000000
	lduba	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %f23 = 5a007396
	lda	[%i1+%g0]0x81,%f23	! %f23 = 00000000
	membar	#Sync			! Added by membar checker (69)
!	Mem[0000000030101400] = ff000000 00000000 00000000 ff000000
!	Mem[0000000030101410] = ff0000ff 00000000 10000000 00000068
!	Mem[0000000030101420] = 00000000 2ef30000 62b0a630 ed4f1170
!	Mem[0000000030101430] = e0776e03 1023d0d0 bda6b4e7 c3b89594
	ldda	[%i4]ASI_BLK_AIUS,%f16	! Block Load from 0000000030101400
!	Mem[0000000030181400] = 00000000 00000000, %l4 = 00005aa1, %l5 = 000000ff
	ldda	[%i6+%g0]0x81,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010141408] = 00000000, %l7 = 0000000000000000
	lduwa	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010081408] = a15a0000ff000000
	stxa	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000000

p0_label_340:
!	Mem[0000000010181400] = 44100000, %l3 = 0000000000000000
	ldstuba	[%i6+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[00000000201c0000] = ffff8819, %asi = 80
	stha	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00008819
!	Mem[0000000010181400] = ff001044, %l1 = 0000000000000000
	ldstuba	[%i6+%g0]0x80,%l1	! %l1 = 000000ff000000ff
!	%f2  = 000000ff, Mem[00000000100c1400] = ff000000
	sta	%f2 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff
!	%l3 = 0000000000000000, Mem[0000000030041410] = ff005aa1
	stha	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = 00005aa1
!	Mem[0000000010101410] = a15a0000, %l5 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[000000001014142c] = 000000ff, %l2 = ffffffff, %l0 = 000000ff
	add	%i5,0x2c,%g1
	casa	[%g1]0x80,%l2,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041424] = 000000ff, %l2 = ffffffffffffffff
	ldstuba	[%i1+0x024]%asi,%l2	! %l2 = 00000000000000ff
!	%f2  = 000000ff, Mem[0000000030001400] = ff000000
	sta	%f2 ,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 000000ff, %f3  = 00000000
	lda	[%i4+%g0]0x88,%f3 	! %f3 = 000000ff

p0_label_341:
!	Mem[0000000010101408] = 000000ff, %l1 = 00000000000000ff
	lduwa	[%i4+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001408] = 0000000000000000, %l1 = 00000000000000ff
	ldxa	[%i0+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141410] = ffffffff, %l6 = 0000000000000000
	ldsha	[%i5+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010041408] = 00000000 000000ff, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[0000000010101418] = ff00000000000010, %f2  = 000000ff 000000ff
	ldd	[%i4+0x018],%f2 	! %f2  = ff000000 00000010
!	Mem[0000000030081408] = 0000000000000000, %l3 = 0000000000000000
	ldxa	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = 00000000ff000000, %l7 = 0000000000000000
	ldxa	[%i0+0x008]%asi,%l7	! %l7 = 00000000ff000000
!	Mem[0000000010001400] = 00000000, %l2 = 0000000000000000
	lduba	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000211c0000] = 0028fcae, %l5 = 0000000000000000
	ldub	[%o2+0x001],%l5		! %l5 = 0000000000000028
!	Starting 10 instruction Store Burst
!	Mem[0000000010041428] = 000000ff, %l2 = 00000000, %l4 = 00000000
	add	%i1,0x28,%g1
	casa	[%g1]0x80,%l2,%l4	! %l4 = 00000000000000ff

p0_label_342:
!	%l5 = 0000000000000028, Mem[00000000201c0001] = 00008819
	stb	%l5,[%o0+0x001]		! Mem[00000000201c0000] = 00288819
!	%l0 = 00000000000000ff, Mem[000000001010140c] = 00000000
	stw	%l0,[%i4+0x00c]		! Mem[000000001010140c] = 000000ff
!	Mem[0000000010001400] = 00000000 000000ff 00000000 ff000000
!	Mem[0000000010001410] = ff000000 00000000 00000000 00000000
!	Mem[0000000010001420] = ff000000 ff000095 00000000 00000000
!	Mem[0000000010001430] = 000000ff 00000000 ff0000ff 00000000
	ldda	[%i0]ASI_BLK_AIUP,%f0	! Block Load from 0000000010001400
!	Mem[0000000030041400] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000030141410] = ff000000ff0000ff
	stxa	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000000000000
!	Mem[00000000211c0000] = 0028fcae, %l5 = 0000000000000028
	ldstub	[%o2+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010101428] = ff00000000000000, %l7 = 00000000ff000000, %l2 = 0000000000000000
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l7,%l2	! %l2 = ff00000000000000
!	%f18 = 00000000 ff000000, Mem[0000000010181408] = 95000000 00000000
	stda	%f18,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 ff000000
!	%f26 = 62b0a630, Mem[0000000030141400] = ff000000
	sta	%f26,[%i5+%g0]0x81	! Mem[0000000030141400] = 62b0a630
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (70)
!	Mem[0000000030001400] = 000000ff 00000000 00000000 00000000
!	Mem[0000000030001410] = 00000028 00000000 35b82ab9 65a46210
!	Mem[0000000030001420] = 0aff5a26 a65d3746 f9a45e93 9a50300e
!	Mem[0000000030001430] = e0776e03 1023d0d0 02ac1e89 2d72a12c
	ldda	[%i0]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030001400

p0_label_343:
!	Mem[000000001018143c] = 00000000, %l0 = 00000000000000ff
	ldsb	[%i6+0x03f],%l0		! %l0 = 0000000000000000
!	Mem[0000000030041400] = 000000ff, %f25 = 2ef30000
	lda	[%i1+%g0]0x89,%f25	! %f25 = 000000ff
!	Mem[0000000030181410] = 00000000, %l1 = 0000000000000000
	ldswa	[%i6+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041408] = 00000095 ff3ea5ff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000095 00000000ff3ea5ff
!	Mem[00000000300c1408] = 000000ff, %l6 = ffffffffffffffff
	ldswa	[%i3+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081410] = ff000000b40a3a57, %l5 = 0000000000000000
	ldxa	[%i2+%o5]0x80,%l5	! %l5 = ff000000b40a3a57
!	Mem[0000000021800180] = 66ff8f81, %l0 = 0000000000000000
	ldsh	[%o3+0x180],%l0		! %l0 = 00000000000066ff
!	Mem[0000000030081410] = 0000000000000000, %l0 = 00000000000066ff
	ldxa	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000211c0000] = ff28fcae, %l0 = 0000000000000000
	lduh	[%o2+%g0],%l0		! %l0 = 000000000000ff28
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[0000000030181408] = 00000000
	stha	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 00ff0000

p0_label_344:
!	%f30 = bda6b4e7 c3b89594, Mem[0000000010041410] = 000000ff ffffffff
	stda	%f30,[%i1+%o5]0x88	! Mem[0000000010041410] = bda6b4e7 c3b89594
!	Mem[0000000010041425] = ff0000ff, %l4 = 00000000000000ff
	ldstub	[%i1+0x025],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010101420] = 4410000000000000, %l6 = 00000000000000ff, %l1 = 0000000000000000
	add	%i4,0x20,%g1
	casxa	[%g1]0x80,%l6,%l1	! %l1 = 4410000000000000
!	Mem[00000000100c1430] = 00000000, %l4 = 0000000000000000, %asi = 80
	swapa	[%i3+0x030]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = ff000000, %l2 = 0000000000000095
	ldstuba	[%i2+%g0]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000021800040] = ff9c7f92, %l5 = ff000000b40a3a57
	ldstub	[%o3+0x040],%l5		! %l5 = 000000ff000000ff
!	Mem[0000000020800040] = ff00bf87, %l2 = 00000000000000ff
	ldstuba	[%o1+0x040]%asi,%l2	! %l2 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (71)
!	%f26 = 62b0a630, Mem[0000000030001408] = 00000000
	sta	%f26,[%i0+%o4]0x89	! Mem[0000000030001408] = 62b0a630
!	Mem[0000000030001400] = ff000000, %l1 = 4410000000000000
	swapa	[%i0+%g0]0x89,%l1	! %l1 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ff000000, %l0 = 000000000000ff28
	lduba	[%i1+%o4]0x80,%l0	! %l0 = 00000000000000ff

p0_label_345:
!	Mem[0000000021800180] = 66ff8f81, %l1 = 00000000ff000000
	lduha	[%o3+0x180]%asi,%l1	! %l1 = 00000000000066ff
!	Mem[0000000010001408] = 00000000, %l7 = 00000000ff000000
	ldsha	[%i0+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041410] = a15a0000, %f27 = ed4f1170
	lda	[%i1+%o5]0x89,%f27	! %f27 = a15a0000
!	Mem[0000000010081400] = ff0000ff, %l7 = 0000000000000000
	ldsha	[%i2+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181400] = 00000000 441000ff, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i6+%g0]0x88,%l4	! %l4 = 00000000441000ff 0000000000000000
!	Mem[0000000010101408] = ff000000000000ff, %l4 = 00000000441000ff
	ldxa	[%i4+%o4]0x88,%l4	! %l4 = ff000000000000ff
!	%l5 = 0000000000000000, immd = 000000000000057e, %l2  = 00000000000000ff
	mulx	%l5,0x57e,%l2		! %l2 = 0000000000000000
!	Mem[0000000030081408] = 00000000, %l1 = 00000000000066ff
	lduwa	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l4 = ff000000000000ff
	lduha	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f2  = 00000000, Mem[0000000030081400] = 000000ff
	sta	%f2 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000

p0_label_346:
!	Mem[000000001004143c] = 00000028, %l3 = 00000000ff3ea5ff
	swap	[%i1+0x03c],%l3		! %l3 = 0000000000000028
!	%l2 = 0000000000000000, Mem[00000000211c0001] = ff28fcae
	stb	%l2,[%o2+0x001]		! Mem[00000000211c0000] = ff00fcae
!	%l4 = 0000000000000000, Mem[0000000030101408] = 000000ff00000000
	stxa	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000000
!	%f28 = e0776e03, Mem[0000000010081400] = ff0000ff
	sta	%f28,[%i2+%g0]0x88	! Mem[0000000010081400] = e0776e03
!	%f24 = 00000000, Mem[0000000010001418] = 00000000
	sta	%f24,[%i0+0x018]%asi	! Mem[0000000010001418] = 00000000
!	%f16 = ff000000 00000000 00000000 ff000000
!	%f20 = ff0000ff 00000000 10000000 00000068
!	%f24 = 00000000 000000ff 62b0a630 a15a0000
!	%f28 = e0776e03 1023d0d0 bda6b4e7 c3b89594
	stda	%f16,[%i2]ASI_BLK_S	! Block Store to 0000000030081400
!	Mem[0000000030041408] = 95000000, %l6 = 00000000000000ff
	ldstuba	[%i1+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000010001410] = ff000000 00000000
	stda	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000ff 00000000
!	%l2 = 00000000, %l3 = 00000028, Mem[0000000010101408] = ff000000 000000ff
	stda	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000 00000028
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00000000, %l7 = 00000000000000ff
	ldswa	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000000

p0_label_347:
!	Mem[0000000030001410] = 28000000, %l5 = 0000000000000000
	ldsba	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001418] = 0000000000000000, %f2  = 00000000 00000000
	ldd	[%i0+0x018],%f2 	! %f2  = 00000000 00000000
!	Mem[0000000010141410] = ffffffff, %l7 = 0000000000000000
	lduha	[%i5+%o5]0x80,%l7	! %l7 = 000000000000ffff
!	%f4  = 00000000 28000000, %f7  = b92ab835
	fdtoi	%f4 ,%f7 		! %l0 = 0000000000000121, Unfinished, %fsr = 0900000800
!	Mem[000000001000141c] = 00000000, %l2 = 0000000000000000
	lduh	[%i0+0x01c],%l2		! %l2 = 0000000000000000
!	Mem[00000000100c1430] = 00000000, %l7 = 000000000000ffff
	lduha	[%i3+0x030]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %f7  = b92ab835
	lda	[%i6+%o5]0x81,%f7 	! %f7 = 00000000
!	Mem[00000000300c1400] = 00000000 000000ff, %l0 = 00000121, %l1 = 00000000
	ldda	[%i3+%g0]0x89,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[0000000030101408] = 00000000, %l6 = 0000000000000000
	ldsba	[%i4+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 00000000, %l3 = 0000000000000028
	ldstuba	[%i6+%o5]0x89,%l3	! %l3 = 00000000000000ff

p0_label_348:
!	%f0  = 00000000, Mem[0000000010081404] = ff000000
	sta	%f0 ,[%i2+0x004]%asi	! Mem[0000000010081404] = 00000000
!	Mem[000000001004141c] = 9a50300e, %l6 = 0000000000000000
	ldstuba	[%i1+0x01c]%asi,%l6	! %l6 = 0000009a000000ff
!	%f9  = 265aff0a, Mem[0000000010001408] = 00000000
	sta	%f9 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 265aff0a
!	Mem[00000000100c1400] = ff000000, %l0 = 00000000000000ff
	ldstuba	[%i3+%g0]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010181410] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	%f6  = 1062a465 00000000, Mem[0000000010181410] = 000000ff 00000000
	stda	%f6 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 1062a465 00000000
!	Mem[0000000010001410] = 000000ff, %l6 = 000000000000009a
	ldstuba	[%i0+0x010]%asi,%l6	! %l6 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010001424] = ff000095
	stw	%l7,[%i0+0x024]		! Mem[0000000010001424] = 00000000
!	Mem[0000000030001410] = 00000028, %l6 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000028
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (72)
!	Mem[0000000010081408] = 00000000, %l4 = 00000000000000ff
	ldsba	[%i2+%o4]0x80,%l4	! %l4 = 0000000000000000

p0_label_349:
!	Mem[0000000010141400] = 00000000, %l1 = 0000000000000000
	lduba	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041410] = 00005aa1, %l5 = 0000000000000000
	lduba	[%i1+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1428] = 00000000, %l7 = 0000000000000000
	lduwa	[%i3+0x028]%asi,%l7	! %l7 = 0000000000000000
!	%l5 = 0000000000000000, imm = fffffffffffff83f, %l3 = 0000000000000000
	xnor	%l5,-0x7c1,%l3		! %l3 = 00000000000007c0
!	Mem[0000000010081410] = 000000ff, %l4 = 0000000000000000
	lduwa	[%i2+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1428] = 0000000000000000, %f16 = ff000000 00000000
	ldda	[%i3+0x028]%asi,%f16	! %f16 = 00000000 00000000
!	Mem[0000000030101400] = ff00000000000000, %l2 = 0000000000000000
	ldxa	[%i4+%g0]0x81,%l2	! %l2 = ff00000000000000
!	Mem[0000000030141400] = 30a6b062, %l6 = 0000000000000028
	ldswa	[%i5+%g0]0x89,%l6	! %l6 = 0000000030a6b062
!	Mem[00000000300c1410] = ff00ffffa15a0000, %f6  = 1062a465 00000000
	ldda	[%i3+%o5]0x81,%f6 	! %f6  = ff00ffff a15a0000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000030a6b062, Mem[0000000030181400] = 0000000000000000
	stxa	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000030a6b062

p0_label_350:
!	%l2 = ff00000000000000, Mem[0000000010081418] = 000000a1
	stw	%l2,[%i2+0x018]		! Mem[0000000010081418] = 00000000
!	Mem[0000000010041428] = 000000ff, %l5 = 00000000, %l1 = 00000000
	add	%i1,0x28,%g1
	casa	[%g1]0x80,%l5,%l1	! %l1 = 00000000000000ff
!	%f18 = 00000000 ff000000, %l6 = 0000000030a6b062
!	Mem[0000000030181418] = 35b82ab965a46210
	add	%i6,0x018,%g1
	stda	%f18,[%g1+%l6]ASI_PST16_S ! Mem[0000000030181418] = 35b82ab9ff006210
!	Mem[0000000030041408] = ff000095, %l5 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[000000001000142f] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i0+0x02f]%asi,%l7	! %l7 = 00000000000000ff
!	%f15 = 891eac02, Mem[0000000010181408] = 00000000
	sta	%f15,[%i6+%o4]0x88	! Mem[0000000010181408] = 891eac02
!	Mem[0000000030001408] = 62b0a630, %l1 = 00000000000000ff
	ldstuba	[%i0+%o4]0x89,%l1	! %l1 = 00000030000000ff
!	%l2 = 00000000, %l3 = 000007c0, Mem[0000000030101400] = 000000ff 00000000
	stda	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000 000007c0
!	Mem[0000000010041439] = 00000000, %l6 = 0000000030a6b062
	ldstub	[%i1+0x039],%l6		! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ff0000ff, %l3 = 00000000000007c0
	lduba	[%i0+%o5]0x88,%l3	! %l3 = 00000000000000ff

p0_label_351:
!	Mem[0000000010181400] = ff001044 00000000, %l2 = 00000000, %l3 = 000000ff
	ldd	[%i6+%g0],%l2		! %l2 = 00000000ff001044 0000000000000000
!	Mem[0000000010041420] = ff00ffff, %l7 = 0000000000000000
	ldsh	[%i1+0x020],%l7		! %l7 = ffffffffffffff00
!	Mem[00000000100c1414] = ff5a0000, %l6 = 0000000000000000
	lduh	[%i3+0x016],%l6		! %l6 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l2 = 00000000ff001044
	lduba	[%i4+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081400] = ff00000000000000, %l7 = ffffffffffffff00
	ldxa	[%i2+%g0]0x81,%l7	! %l7 = ff00000000000000
!	Mem[0000000010041410] = c3b89594, %l4 = 00000000000000ff
	lduha	[%i1+%o5]0x88,%l4	! %l4 = 0000000000009594
!	Mem[000000001000140c] = ff000000, %f18 = 00000000
	ld	[%i0+0x00c],%f18	! %f18 = ff000000
!	Mem[0000000010101434] = 00000000, %l5 = 00000000000000ff
	ldsw	[%i4+0x034],%l5		! %l5 = 0000000000000000
!	Mem[000000001008143c] = 00000000, %l7 = ff00000000000000
	ldsba	[%i2+0x03d]%asi,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00009594, %l5 = 00000000, Mem[0000000010081408] = 00000000 00000000
	stda	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 00009594 00000000

p0_label_352:
!	Mem[00000000300c1410] = ff00ffff, %l6 = 0000000000000000
	swapa	[%i3+%o5]0x81,%l6	! %l6 = 00000000ff00ffff
!	%l6 = 00000000ff00ffff, Mem[0000000010141400] = 00000000
	stwa	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = ff00ffff
!	%l6 = ff00ffff, %l7 = 00000000, Mem[0000000010141410] = ffffffff a1ff0000
	stda	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = ff00ffff 00000000
!	%l7 = 0000000000000000, Mem[0000000030041400] = 00000000000000ff
	stxa	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000000000000000
!	%l4 = 00009594, %l5 = 00000000, Mem[0000000010181408] = 891eac02 000000ff
	stda	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 00009594 00000000
!	%l6 = ff00ffff, %l7 = 00000000, Mem[0000000010181400] = 441000ff 00000000
	stda	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = ff00ffff 00000000
!	%l2 = 0000000000000000, Mem[0000000010041410] = 9495b8c3
	stwa	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	%l7 = 0000000000000000, Mem[0000000030141410] = 00000000
	stha	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	Mem[00000000300c1400] = ff000000, %l3 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l3	! %l3 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181434] = ffffffff, %l2 = 0000000000000000
	lduha	[%i6+0x036]%asi,%l2	! %l2 = 000000000000ffff

p0_label_353:
!	Mem[0000000010001410] = ff0000ff00000000, %f6  = ff00ffff a15a0000
	ldda	[%i0+%o5]0x80,%f6 	! %f6  = ff0000ff 00000000
!	Mem[0000000010101400] = ff000000, %l3 = 00000000ff000000
	lduba	[%i4+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181400] = ff00ffff, %l6 = 00000000ff00ffff
	ldsba	[%i6+%g0]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030141410] = 00000000, %l6 = ffffffffffffffff
	ldsba	[%i5+%o5]0x89,%l6	! %l6 = 0000000000000000
!	%l2 = 000000000000ffff, %l0 = 00000000000000ff, %l2 = 000000000000ffff
	subc	%l2,%l0,%l2		! %l2 = 000000000000ff00
!	Mem[0000000010081400] = 036e77e0, %l3 = 00000000000000ff
	ldswa	[%i2+%g0]0x80,%l3	! %l3 = 00000000036e77e0
!	Mem[0000000030101408] = 00000000, %l1 = 0000000000000030
	lduba	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = 00005aff 000000ff, %l2 = 0000ff00, %l3 = 036e77e0
	ldda	[%i3+%o5]0x88,%l2	! %l2 = 00000000000000ff 0000000000005aff
!	Mem[0000000020800040] = ff00bf87, %l3 = 0000000000005aff
	lduha	[%o1+0x040]%asi,%l3	! %l3 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[0000000010081410] = ff000000
	stha	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 00ff0000

p0_label_354:
!	Mem[0000000010181410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181400] = 00000000, %l0 = 00000000000000ff
	swapa	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000000
!	%l3 = 000000000000ff00, Mem[0000000010101430] = 00000000, %asi = 80
	stwa	%l3,[%i4+0x030]%asi	! Mem[0000000010101430] = 0000ff00
!	%f28 = e0776e03 1023d0d0, Mem[0000000010081400] = e0776e03 00000000
	stda	%f28,[%i2+%g0]0x88	! Mem[0000000010081400] = e0776e03 1023d0d0
!	Mem[00000000100c1410] = ff000000, %l7 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l7	! %l7 = 000000ff000000ff
!	%l4 = 00009594, %l5 = 00000000, Mem[0000000030001410] = 00000000 00000000
	stda	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 00009594 00000000
!	Mem[0000000010181422] = ff000000, %l4 = 0000000000009594
	ldstuba	[%i6+0x022]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c140c] = ffa53eff, %l0 = 00000000, %l6 = 00000000
	add	%i3,0x0c,%g1
	casa	[%g1]0x80,%l0,%l6	! %l6 = 00000000ffa53eff
!	%f26 = 62b0a630 a15a0000, %l5 = 0000000000000000
!	Mem[0000000030001418] = 35b82ab965a46210
	add	%i0,0x018,%g1
	stda	%f26,[%g1+%l5]ASI_PST16_S ! Mem[0000000030001418] = 35b82ab965a46210
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff00fcae, %l1 = 0000000000000000
	ldsba	[%o2+0x000]%asi,%l1	! %l1 = ffffffffffffffff

p0_label_355:
!	Mem[00000000300c1400] = 00000000, %l5 = 0000000000000000
	ldsba	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l2 = 00000000000000ff
	ldswa	[%i1+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = 000000ff0aff5a26, %l1 = ffffffffffffffff
	ldxa	[%i0+%o4]0x88,%l1	! %l1 = 000000ff0aff5a26
!	Mem[00000000100c1400] = ff000000, %l2 = 0000000000000000
	ldsha	[%i3+%g0]0x80,%l2	! %l2 = ffffffffffffff00
!	Code Fragment 4
p0_fragment_37:
!	%l0 = 0000000000000000
	setx	0x14b202802b338104,%g7,%l0 ! %l0 = 14b202802b338104
!	%l1 = 000000ff0aff5a26
	setx	0x1d552a00702f69c4,%g7,%l1 ! %l1 = 1d552a00702f69c4
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 14b202802b338104
	setx	0x3fb6d5c7fa1caa6d,%g7,%l0 ! %l0 = 3fb6d5c7fa1caa6d
!	%l1 = 1d552a00702f69c4
	setx	0x422b92483aed9578,%g7,%l1 ! %l1 = 422b92483aed9578
!	Mem[0000000010041410] = bda6b4e700000000, %f18 = ff000000 ff000000
	ldda	[%i1+%o5]0x88,%f18	! %f18 = bda6b4e7 00000000
!	Mem[0000000010001408] = 0aff5a26, %l3 = 000000000000ff00
	lduwa	[%i0+%o4]0x88,%l3	! %l3 = 000000000aff5a26
!	Mem[0000000010041404] = 00000000, %l3 = 000000000aff5a26
	lduba	[%i1+0x007]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l3 = 0000000000000000
	ldsba	[%i5+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f12 = d0d02310 036e77e0, Mem[0000000010081400] = 1023d0d0 e0776e03
	stda	%f12,[%i2+%g0]0x88	! Mem[0000000010081400] = d0d02310 036e77e0

p0_label_356:
!	%l3 = 0000000000000000, Mem[00000000100c1420] = 950000ff, %asi = 80
	stha	%l3,[%i3+0x020]%asi	! Mem[00000000100c1420] = 000000ff
!	%l7 = 00000000000000ff, Mem[000000001000141c] = 00000000
	sth	%l7,[%i0+0x01c]		! Mem[000000001000141c] = 00ff0000
!	%f20 = ff0000ff 00000000, Mem[0000000010181408] = 00009594 00000000
	stda	%f20,[%i6+%o4]0x88	! Mem[0000000010181408] = ff0000ff 00000000
!	Mem[0000000030181410] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	%l0 = fa1caa6d, %l1 = 3aed9578, Mem[0000000010181410] = ff000000 65a46210
	stda	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = fa1caa6d 3aed9578
!	%f2  = 00000000, Mem[0000000010041410] = 00000000
	sta	%f2 ,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	%l2 = ffffffffffffff00, Mem[0000000030081408] = 00000000
	stwa	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = ffffff00
!	Mem[0000000010001400] = 00000000, %l1 = 422b92483aed9578
	swapa	[%i0+%g0]0x88,%l1	! %l1 = 0000000000000000
!	%l0 = fa1caa6d, %l1 = 00000000, Mem[0000000010101430] = 0000ff00 00000000
	std	%l0,[%i4+0x030]		! Mem[0000000010101430] = fa1caa6d 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 0000000000000000, %l6 = 00000000ffa53eff
	ldxa	[%i5+%o4]0x81,%l6	! %l6 = 0000000000000000

p0_label_357:
!	Mem[0000000030181408] = 0000ff00, %l4 = 00000000000000ff
	ldsha	[%i6+%o4]0x89,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000010081410] = 00ff0000 b40a3a57, %l2 = ffffff00, %l3 = 00000000
	ldda	[%i2+0x010]%asi,%l2	! %l2 = 0000000000ff0000 00000000b40a3a57
!	Mem[0000000010001410] = 00000000ff0000ff, %l1 = 0000000000000000
	ldxa	[%i0+%o5]0x88,%l1	! %l1 = 00000000ff0000ff
!	Mem[0000000010141400] = ffff00ff00000000, %f20 = ff0000ff 00000000
	ldda	[%i5+0x000]%asi,%f20	! %f20 = ffff00ff 00000000
!	Mem[0000000030181400] = 000000ff, %l7 = 00000000000000ff
	ldsha	[%i6+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141410] = 0000000000000000, %l0 = 3fb6d5c7fa1caa6d
	ldxa	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1418] = 0000000000000028, %f22 = 10000000 00000068
	ldda	[%i3+0x018]%asi,%f22	! %f22 = 00000000 00000028
!	Mem[0000000030001400] = 0000000000000000, %f26 = 62b0a630 a15a0000
	ldda	[%i0+%g0]0x89,%f26	! %f26 = 00000000 00000000
!	Mem[00000000300c1400] = 00000000, %l3 = 00000000b40a3a57
	ldswa	[%i3+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l6	! %l6 = 00000000000000ff

p0_label_358:
!	%l4 = ffffffffffffff00, Mem[00000000300c1408] = 000000ff
	stwa	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffff00
!	%f2  = 00000000, %f30 = bda6b4e7
	fitos	%f2 ,%f30		! %f30 = 00000000
!	Mem[00000000100c1410] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010001400] = 7895ed3a, %l0 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l0	! %l0 = 00000078000000ff
!	%f19 = 00000000, Mem[00000000300c1410] = 00000000
	sta	%f19,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	Mem[0000000030041408] = 950000ff, %l1 = 00000000ff0000ff
	swapa	[%i1+%o4]0x89,%l1	! %l1 = 00000000950000ff
!	%l7 = 0000000000000000, imm = fffffffffffff16f, %l7 = 0000000000000000
	or	%l7,-0xe91,%l7		! %l7 = fffffffffffff16f
!	Mem[0000000030001400] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i0+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000010101438] = 00005aff, %asi = 80
	stba	%l6,[%i4+0x038]%asi	! Mem[0000000010101438] = 00005aff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 0aff5a26, %l0 = 0000000000000078
	ldsha	[%i0+%o4]0x88,%l0	! %l0 = 0000000000005a26

p0_label_359:
!	%l4 = ffffffffffffff00, imm = 000000000000093a, %l4 = ffffffffffffff00
	or	%l4,0x93a,%l4		! %l4 = ffffffffffffff3a
!	Mem[0000000030081410] = ff0000ff 00000000, %l2 = 00ff0000, %l3 = 000000ff
	ldda	[%i2+%o5]0x81,%l2	! %l2 = 00000000ff0000ff 0000000000000000
!	Mem[0000000020800000] = 00ffc3ca, %l0 = 0000000000005a26
	lduba	[%o1+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[00000000300c1408] = 00ffffff, %l5 = 0000000000000000
	lduha	[%i3+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1400] = 000000ff, %l0 = 00000000000000ff
	ldsha	[%i3+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101400] = 00000000, %l4 = ffffffffffffff3a
	ldsha	[%i4+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = 00000000 ff0000ff, %l6 = 00000000, %l7 = fffff16f
	ldd	[%i6+%o4],%l6		! %l6 = 0000000000000000 00000000ff0000ff
!	Mem[0000000010001410] = ff0000ff, %l6 = 0000000000000000
	lduwa	[%i0+%o5]0x88,%l6	! %l6 = 00000000ff0000ff
!	Mem[0000000010081410] = 573a0ab40000ff00, %l5 = 00000000000000ff
	ldxa	[%i2+%o5]0x88,%l5	! %l5 = 573a0ab40000ff00
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l4	! %l4 = 00000000000000ff

p0_label_360:
!	%f8  = 46375da6 265aff0a, %l4 = 0000000000000000
!	Mem[0000000010081438] = 00005aff00000000
	add	%i2,0x038,%g1
	stda	%f8,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010081438] = 00005aff00000000
!	Mem[0000000030101410] = ff0000ff, %l0 = 00000000000000ff
	ldstuba	[%i4+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	Code Fragment 4
p0_fragment_38:
!	%l0 = 00000000000000ff
	setx	0x026183504078e3ff,%g7,%l0 ! %l0 = 026183504078e3ff
!	%l1 = 00000000950000ff
	setx	0xacf066bfeab2f1bb,%g7,%l1 ! %l1 = acf066bfeab2f1bb
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 026183504078e3ff
	setx	0xc7d38e17edc28803,%g7,%l0 ! %l0 = c7d38e17edc28803
!	%l1 = acf066bfeab2f1bb
	setx	0xddd858406a5a1637,%g7,%l1 ! %l1 = ddd858406a5a1637
!	%f8  = 46375da6 265aff0a, %l0 = c7d38e17edc28803
!	Mem[00000000300c1438] = ffffffaef50000ff
	add	%i3,0x038,%g1
	stda	%f8,[%g1+%l0]ASI_PST8_SL ! Mem[00000000300c1438] = 0affffaef50000ff
!	Mem[0000000010141418] = 0000000000000000, %l5 = 573a0ab40000ff00, %l1 = ddd858406a5a1637
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l5,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081400] = e0776e03, %l3 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l3	! %l3 = 00000000e0776e03
!	%l0 = c7d38e17edc28803, Mem[0000000010181410] = fa1caa6d
	stba	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 031caa6d
!	%l0 = c7d38e17edc28803, Mem[0000000010001408] = 0aff5a26
	stba	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 0aff5a03
!	%l3 = 00000000e0776e03, Mem[00000000100c143a] = 00000000
	sth	%l3,[%i3+0x03a]		! Mem[00000000100c1438] = 00006e03
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000000, %f13 = 036e77e0
	lda	[%i2+%g0]0x80,%f13	! %f13 = 00000000

p0_label_361:
!	Mem[0000000010141428] = 00000000, %l0 = c7d38e17edc28803
	ldsw	[%i5+0x028],%l0		! %l0 = 0000000000000000
!	Mem[0000000030101408] = ff000000, %l1 = 0000000000000000
	ldsha	[%i4+%o4]0x81,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000010181408] = 00000000, %l5 = 573a0ab40000ff00
	lduh	[%i6+0x00a],%l5		! %l5 = 0000000000000000
!	Mem[0000000010001410] = ff0000ff 00000000, %l0 = 00000000, %l1 = ffffff00
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 00000000ff0000ff 0000000000000000
!	Mem[0000000010001430] = 000000ff, %l0 = 00000000ff0000ff
	ldub	[%i0+0x032],%l0		! %l0 = 0000000000000000
!	Mem[0000000010041410] = 00000000e7b4a6bd, %f14 = 2ca1722d 891eac02
	ldda	[%i1+%o5]0x80,%f14	! %f14 = 00000000 e7b4a6bd
!	Mem[0000000010141408] = 00000000, %l5 = 0000000000000000
	ldswa	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041414] = e7b4a6bd, %l7 = 00000000ff0000ff
	ldswa	[%i1+0x014]%asi,%l7	! %l7 = ffffffffe7b4a6bd
!	Mem[0000000030141400] = 0000000030a6b062, %f10 = 0e30509a 935ea4f9
	ldda	[%i5+%g0]0x89,%f10	! %f10 = 00000000 30a6b062
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 00000000, %l7 = ffffffffe7b4a6bd
	ldstuba	[%i3+%g0]0x89,%l7	! %l7 = 00000000000000ff

p0_label_362:
!	%l5 = 0000000000000000, Mem[0000000010181410] = 6daa1c03
	stwa	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	%l7 = 0000000000000000, %l7 = 0000000000000000, %l6 = 00000000ff0000ff
	sdivx	%l7,%l7,%l6		! Div by zero, %l0 = 0000000000000050
!	%l2 = 00000000ff0000ff, Mem[000000001004143c] = ff3ea5ff, %asi = 80
	stwa	%l2,[%i1+0x03c]%asi	! Mem[000000001004143c] = ff0000ff
!	Mem[00000000100c1408] = 00000000, %l4 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Code Fragment 3
p0_fragment_39:
!	%l0 = 0000000000000028
	setx	0x216d73302de1b576,%g7,%l0 ! %l0 = 216d73302de1b576
!	%l1 = 0000000000000000
	setx	0x2449e8fff1de283a,%g7,%l1 ! %l1 = 2449e8fff1de283a
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 216d73302de1b576
	setx	0x39d4e0004d3332db,%g7,%l0 ! %l0 = 39d4e0004d3332db
!	%l1 = 2449e8fff1de283a
	setx	0x45a80558034c93ab,%g7,%l1 ! %l1 = 45a80558034c93ab
!	Code Fragment 3
p0_fragment_40:
!	%l0 = 39d4e0004d3332db
	setx	0x6e79e0e789fbb2c9,%g7,%l0 ! %l0 = 6e79e0e789fbb2c9
!	%l1 = 45a80558034c93ab
	setx	0xafded72fa3422ac7,%g7,%l1 ! %l1 = afded72fa3422ac7
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 6e79e0e789fbb2c9
	setx	0x7eb105c0475a9ef0,%g7,%l0 ! %l0 = 7eb105c0475a9ef0
!	%l1 = afded72fa3422ac7
	setx	0x0acc6e5032cce6f4,%g7,%l1 ! %l1 = 0acc6e5032cce6f4
!	%l6 = 00000000ff0000ff, Mem[0000000010001410] = ff0000ff
	stba	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = ff0000ff
!	Mem[0000000030041408] = ff0000ff, %l6 = 00000000ff0000ff
	ldstuba	[%i1+%o4]0x89,%l6	! %l6 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[0000000010101408] = 00000000
	stwa	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00ff0000, %l3 = 00000000e0776e03
	ldsha	[%i6+%o4]0x81,%l3	! %l3 = 00000000000000ff

p0_label_363:
!	Mem[0000000010101410] = a15a00ff, %l2 = 00000000ff0000ff
	ldsba	[%i4+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141410] = ff00ffff, %l5 = 0000000000000000
	ldsba	[%i5+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010141400] = ff00ffff, %l3 = 00000000000000ff
	ldsba	[%i5+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030181408] = 0000ff00, %l4 = 0000000000000000
	lduwa	[%i6+%o4]0x89,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010001408] = 035aff0a, %l1 = 0acc6e5032cce6f4
	ldsba	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000003
!	Mem[0000000030141410] = 0000000000000000, %l5 = ffffffffffffffff
	ldxa	[%i5+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101438] = 00005aff00000000, %l1 = 0000000000000003
	ldx	[%i4+0x038],%l1		! %l1 = 00005aff00000000
!	%l2 = ffffffffffffffff, Mem[0000000010041410] = 00000000
	stwa	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffffff
!	Mem[0000000010041418] = 00000000ff50300e, %f14 = 00000000 e7b4a6bd
	ldda	[%i1+0x018]%asi,%f14	! %f14 = 00000000 ff50300e
!	Starting 10 instruction Store Burst
!	%l1 = 00005aff00000000, Mem[0000000010101400] = ff000000ff000000
	stx	%l1,[%i4+%g0]		! Mem[0000000010101400] = 00005aff00000000

p0_label_364:
!	Mem[0000000010181400] = ff00ffff, %l6 = 00000000000000ff
	ldstuba	[%i6+%g0]0x88,%l6	! %l6 = 000000ff000000ff
!	%l0 = 7eb105c0475a9ef0, Mem[0000000030081408] = 00ffffff
	stha	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 00ff9ef0
!	%f2  = 00000000, Mem[0000000030041400] = 00000000
	sta	%f2 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
!	%f21 = 00000000, %f12 = d0d02310, %f19 = 00000000
	fmuls	%f21,%f12,%f19		! %f19 = 80000000
!	Mem[0000000010181400] = ffff00ff00000000, %l2 = ffffffffffffffff, %l4 = 000000000000ff00
	casxa	[%i6]0x80,%l2,%l4	! %l4 = ffff00ff00000000
!	%l5 = 0000000000000000, Mem[0000000030141408] = 00000000000000ff
	stxa	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l6 = 00000000000000ff
	swapa	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041408] = ff000000, %l1 = 00005aff00000000
	ldstuba	[%i1+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	%l2 = ffffffffffffffff, Mem[0000000030001408] = ffa6b062
	stba	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = ffa6b062
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 000000ff, %l6 = 0000000000000000
	lduwa	[%i6+%g0]0x81,%l6	! %l6 = 00000000000000ff

p0_label_365:
!	Mem[0000000010081410] = 00ff0000, %l5 = 0000000000000000
	lduba	[%i2+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = 00005aa1, %l0 = 7eb105c0475a9ef0
	ldsba	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Code Fragment 4
p0_fragment_41:
!	%l0 = 0000000000000000
	setx	0x3d2cab4fc83879d1,%g7,%l0 ! %l0 = 3d2cab4fc83879d1
!	%l1 = 00000000000000ff
	setx	0xe8d1782032819240,%g7,%l1 ! %l1 = e8d1782032819240
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3d2cab4fc83879d1
	setx	0x1a48c4bfc0441950,%g7,%l0 ! %l0 = 1a48c4bfc0441950
!	%l1 = e8d1782032819240
	setx	0x24b54fe063315bf1,%g7,%l1 ! %l1 = 24b54fe063315bf1
!	Mem[00000000100c1408] = 00000000, %l6 = 00000000000000ff
	ldsha	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1400] = ff000000 000000ff, %l6 = 00000000, %l7 = 00000000
	ldda	[%i3+%g0]0x88,%l6	! %l6 = 00000000000000ff 00000000ff000000
!	Mem[0000000010181400] = ffff00ff, %f5  = 28000000
	lda	[%i6+%g0]0x80,%f5 	! %f5 = ffff00ff
!	Mem[0000000030001400] = 000000ff, %l2 = ffffffffffffffff
	ldsha	[%i0+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1400] = ff000000, %l0 = 1a48c4bfc0441950
	lduba	[%i3+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101410] = ff0000ff, %l2 = 00000000000000ff
	lduha	[%i4+%o5]0x81,%l2	! %l2 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l2 = 000000000000ff00, Mem[0000000010181410] = 00000000
	stha	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = ff000000

p0_label_366:
!	%l3 = ffffffffffffffff, Mem[0000000010101410] = a15a00ff
	stwa	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffffff
!	%l0 = 00000000000000ff, immed = fffff7a0, %y  = 00000000
	umul	%l0,-0x860,%l6		! %l6 = 000000fefff7a860, %y = 000000fe
!	Mem[0000000021800040] = ff9c7f92, %l1 = 24b54fe063315bf1
	ldstuba	[%o3+0x040]%asi,%l1	! %l1 = 000000ff000000ff
!	%l6 = 000000fefff7a860, Mem[0000000030041410] = 00005aa1
	stwa	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = fff7a860
!	%l1 = 00000000000000ff, Mem[0000000020800041] = ff00bf87, %asi = 80
	stba	%l1,[%o1+0x041]%asi	! Mem[0000000020800040] = ffffbf87
!	%l4 = ffff00ff00000000, Mem[0000000010001418] = 00000000, %asi = 80
	stha	%l4,[%i0+0x018]%asi	! Mem[0000000010001418] = 00000000
!	Mem[00000000100c1410] = 000000ff, %l1 = 00000000000000ff
	ldstuba	[%i3+%o5]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010181400] = ffff00ff, %l5 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l5	! %l5 = 00000000ffff00ff
!	%l6 = fff7a860, %l7 = ff000000, Mem[0000000010181410] = 000000ff 7895ed3a
	stda	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = fff7a860 ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 000000ff, %l5 = 00000000ffff00ff
	lduha	[%i4+%o4]0x89,%l5	! %l5 = 00000000000000ff

p0_label_367:
!	Mem[0000000010081408] = 00009594 00000000, %l6 = fff7a860, %l7 = ff000000
	ldda	[%i2+%o4]0x80,%l6	! %l6 = 0000000000009594 0000000000000000
!	Mem[0000000010181408] = ff0000ff00000000, %l0 = 00000000000000ff
	ldxa	[%i6+%o4]0x88,%l0	! %l0 = ff0000ff00000000
!	Mem[000000001004140c] = 00000000, %l4 = ffff00ff00000000
	ldsba	[%i1+0x00c]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = 000000ff, %l4 = 0000000000000000
	lduha	[%i2+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101400] = ff5a0000, %l2 = 000000000000ff00
	lduwa	[%i4+%g0]0x88,%l2	! %l2 = 00000000ff5a0000
!	Mem[0000000030101400] = ff000000, %l0 = ff0000ff00000000
	ldsba	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l3 = ffffffffffffffff
	lduba	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l2 = 00000000ff5a0000
	ldsha	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1408] = 00ffffff, %l0 = 0000000000000000
	lduba	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[0000000010141412] = ffff00ff
	stb	%l4,[%i5+0x012]		! Mem[0000000010141410] = ffffffff

p0_label_368:
!	%f20 = ffff00ff 00000000, Mem[0000000030141400] = 62b0a630 00000000
	stda	%f20,[%i5+%g0]0x81	! Mem[0000000030141400] = ffff00ff 00000000
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030081410] = ff0000ff 00000000
	stda	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000 00000000
!	%l1 = 00000000000000ff, Mem[0000000030041400] = 00000000
	stha	%l1,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ff
!	%f13 = 00000000, Mem[00000000300c1400] = 000000ff
	sta	%f13,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	Mem[0000000010181400] = 00000000, %l4 = 00000000000000ff
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000000
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010101410] = ffffffff 000000ff
	stda	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000 00000000
!	%f16 = 00000000 00000000, %l3 = 0000000000000000
!	Mem[0000000010041418] = 00000000ff50300e
	add	%i1,0x018,%g1
	stda	%f16,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010041418] = 00000000ff50300e
!	Mem[0000000010041410] = ffffffff, %l1 = 00000000000000ff
	ldstuba	[%i1+%o5]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000300c1400] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i3+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00000000 0000ff00, %l4 = 00000000, %l5 = 00000000
	ldda	[%i6+%o4]0x89,%l4	! %l4 = 000000000000ff00 0000000000000000

p0_label_369:
!	Mem[0000000030041408] = ff0000ff, %l5 = 0000000000000000
	lduba	[%i1+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030141410] = 00000000, %l3 = 0000000000000000
	lduwa	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181418] = 00000000, %l7 = 0000000000000000
	lduh	[%i6+0x01a],%l7		! %l7 = 0000000000000000
!	Mem[0000000021800040] = ff9c7f92, %l1 = 00000000000000ff
	lduba	[%o3+0x041]%asi,%l1	! %l1 = 000000000000009c
!	Mem[0000000010081410] = 00ff0000, %l6 = 0000000000009594
	lduw	[%i2+%o5],%l6		! %l6 = 0000000000ff0000
!	Mem[0000000030101408] = 00000000 000000ff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000ff 0000000000000000
!	Mem[0000000030001408] = ffa6b062, %l0 = 0000000000000000
	ldsba	[%i0+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001410] = ff0000ff, %l6 = 0000000000ff0000
	ldstuba	[%i0+0x010]%asi,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010101438] = 00005aff00000000, %f10 = 00000000 30a6b062
	ldd	[%i4+0x038],%f10	! %f10 = 00005aff 00000000
!	Starting 10 instruction Store Burst
!	%f18 = bda6b4e7 80000000, Mem[0000000010181410] = fff7a860 ff000000
	stda	%f18,[%i6+%o5]0x88	! Mem[0000000010181410] = bda6b4e7 80000000

p0_label_370:
!	Mem[0000000030001410] = 94950000, %l2 = 00000000000000ff
	ldstuba	[%i0+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181410] = 000000ff, %l0 = ffffffffffffffff
	swapa	[%i6+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101400] = ff5a0000, %l3 = 0000000000000000
	swapa	[%i4+%g0]0x88,%l3	! %l3 = 00000000ff5a0000
!	%l2 = 0000000000000000, Mem[0000000030141410] = 00000000
	stwa	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	Mem[0000000010001400] = 3aed95ff, %l1 = 000000000000009c
	swapa	[%i0+%g0]0x88,%l1	! %l1 = 000000003aed95ff
!	Mem[0000000010081410] = 00ff0000, %l6 = 00000000000000ff
	swapa	[%i2+%o5]0x80,%l6	! %l6 = 0000000000ff0000
!	Mem[00000000300c1400] = 000000ff, %l3 = 00000000ff5a0000
	ldstuba	[%i3+%g0]0x89,%l3	! %l3 = 000000ff000000ff
!	%f4  = 00000000 ffff00ff, Mem[0000000010181428] = 0e30509a 935ea4f9
	std	%f4 ,[%i6+0x028]	! Mem[0000000010181428] = 00000000 ffff00ff
!	%l4 = 0000ff00, %l5 = 000000ff, Mem[0000000030141410] = 00000000 00000000
	stda	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000ff00 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 0000000000000000, %l3 = 00000000000000ff
	ldxa	[%i5+%o4]0x81,%l3	! %l3 = 0000000000000000

p0_label_371:
!	Mem[0000000030101400] = ff000000, %l1 = 000000003aed95ff
	lduba	[%i4+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081400] = 000000ff, %l6 = 0000000000ff0000
	ldswa	[%i2+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001410] = ff009594, %f21 = 00000000
	lda	[%i0+%o5]0x81,%f21	! %f21 = ff009594
!	Mem[0000000030001408] = 00000000 62b0a6ff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i0+%o4]0x89,%l2	! %l2 = 0000000062b0a6ff 0000000000000000
!	Mem[0000000010041408] = ff000000, %l5 = 00000000000000ff
	lduha	[%i1+%o4]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[00000000211c0000] = ff00fcae, %l2 = 0000000062b0a6ff
	ldsh	[%o2+%g0],%l2		! %l2 = ffffffffffffff00
!	Mem[0000000020800040] = ffffbf87, %l2 = ffffffffffffff00
	ldsba	[%o1+0x040]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010181400] = ff00000000000000, %f4  = 00000000 ffff00ff
	ldda	[%i6+%g0]0x80,%f4 	! %f4  = ff000000 00000000
!	Mem[0000000020800040] = ffffbf87, %l5 = 000000000000ff00
	ldsba	[%o1+0x041]%asi,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f27 = 00000000, %f1  = ff000000, %f20 = ffff00ff ff009594
	fsmuld	%f27,%f1 ,%f20		! %f20 = 80000000 00000000

p0_label_372:
!	Mem[0000000010001410] = ff0000ff, %l7 = 0000000000000000
	swapa	[%i0+%o5]0x80,%l7	! %l7 = 00000000ff0000ff
!	Mem[0000000010181408] = 00000000, %l7 = 00000000ff0000ff
	ldstuba	[%i6+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[00000000201c0000] = 00288819, %l7 = 0000000000000000
	ldstub	[%o0+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030081408] = f09eff00, %l3 = 0000000000000000
	swapa	[%i2+%o4]0x81,%l3	! %l3 = 00000000f09eff00
!	Mem[0000000010041410] = ffffffff, %l1 = 0000000000000000
	ldstuba	[%i1+%o5]0x88,%l1	! %l1 = 000000ff000000ff
!	%f0  = 00000000, %f19 = 80000000, %f23 = 00000028
	fdivs	%f0 ,%f19,%f23		! %f23 = 7fffffff
!	Mem[0000000030001410] = ff009594, %l0 = 00000000000000ff
	swapa	[%i0+%o5]0x81,%l0	! %l0 = 00000000ff009594
!	Mem[000000001010141a] = ff000000, %l3 = 00000000f09eff00
	ldstub	[%i4+0x01a],%l3		! %l3 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000010001410] = 00000000
	stwa	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000, %f1  = ff000000
	lda	[%i0+%o5]0x80,%f1 	! %f1 = 00000000

p0_label_373:
!	Mem[00000000211c0000] = ff00fcae, %l4 = 000000000000ff00
	lduha	[%o2+0x000]%asi,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010101400] = 0000000000000000, %l6 = 00000000000000ff
	ldx	[%i4+%g0],%l6		! %l6 = 0000000000000000
!	Mem[0000000030001400] = ff00000000000000, %l7 = 0000000000000000
	ldxa	[%i0+%g0]0x81,%l7	! %l7 = ff00000000000000
!	Mem[0000000030141408] = 00000000, %l3 = 0000000000000000
	ldswa	[%i5+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081410] = 000000ff, %l1 = 00000000000000ff
	lduha	[%i2+0x010]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l2 = ffffffffffffffff
	lduba	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001410] = 0000000000000000, %l1 = 0000000000000000
	ldxa	[%i0+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000021800180] = 66ff8f81, %l5 = ffffffffffffffff
	ldsh	[%o3+0x180],%l5		! %l5 = 00000000000066ff
!	Mem[0000000030081408] = 000000ff00000000, %l2 = 0000000000000000
	ldxa	[%i2+%o4]0x89,%l2	! %l2 = 000000ff00000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 00ffffff, %l7 = ff00000000000000
	ldstuba	[%i3+%o4]0x81,%l7	! %l7 = 00000000000000ff

p0_label_374:
!	Mem[0000000010101403] = 00000000, %l5 = 00000000000066ff
	ldstub	[%i4+0x003],%l5		! %l5 = 00000000000000ff
!	%f14 = 00000000, Mem[0000000010181404] = 00000000
	sta	%f14,[%i6+0x004]%asi	! Mem[0000000010181404] = 00000000
!	Mem[0000000030081408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001410] = ff000000, %l7 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[00000000211c0000] = ff00fcae, %asi = 80
	stba	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0000fcae
!	Mem[00000000100c1410] = ff000000, %l1 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l1	! %l1 = 00000000ff000000
!	%l2 = 000000ff00000000, Mem[000000001000140c] = ff000000
	stw	%l2,[%i0+0x00c]		! Mem[000000001000140c] = 00000000
!	Mem[00000000211c0001] = 0000fcae, %l1 = 00000000ff000000
	ldstub	[%o2+0x001],%l1		! %l1 = 00000000000000ff
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030101408] = 000000ff 00000000
	stda	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ffff00ff, %l6 = 0000000000000000
	lduwa	[%i5+%g0]0x81,%l6	! %l6 = 00000000ffff00ff

p0_label_375:
!	Mem[00000000100c1408] = 00000000ffa53eff, %l3 = 0000000000000000
	ldxa	[%i3+0x008]%asi,%l3	! %l3 = 00000000ffa53eff
!	Mem[0000000030181408] = 00ff0000, %l4 = 000000000000ff00
	lduwa	[%i6+%o4]0x81,%l4	! %l4 = 0000000000ff0000
!	Mem[0000000030001410] = ff0000ff, %l1 = 0000000000000000
	ldsha	[%i0+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181410] = ffffffff, %f0  = 00000000
	lda	[%i6+%o5]0x89,%f0 	! %f0 = ffffffff
!	Mem[0000000010181408] = 000000ff, %l4 = 0000000000ff0000
	lduwa	[%i6+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101410] = ff0000ff, %l6 = 00000000ffff00ff
	ldsha	[%i4+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1410] = 00000000, %l2 = 000000ff00000000
	ldswa	[%i3+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041408] = ff0000ff ff3ea5ff, %l2 = 00000000, %l3 = ffa53eff
	ldda	[%i1+%o4]0x81,%l2	! %l2 = 00000000ff0000ff 00000000ff3ea5ff
!	Mem[0000000010181400] = 000000ff, %f6  = ff0000ff
	lda	[%i6+%g0]0x88,%f6 	! %f6 = 000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ff009594, Mem[0000000030041410] = fff7a860
	stba	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 94f7a860

p0_label_376:
!	Mem[0000000030081408] = ff000000, %l3 = 00000000ff3ea5ff
	swapa	[%i2+%o4]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[0000000020800001] = 00ffc3ca, %l6 = 00000000000000ff
	ldstub	[%o1+0x001],%l6		! %l6 = 000000ff000000ff
!	%l2 = ff0000ff, %l3 = ff000000, Mem[0000000010041408] = ff000000 00000000
	stda	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = ff0000ff ff000000
!	%f14 = 00000000 ff50300e, %l0 = 00000000ff009594
!	Mem[0000000010181408] = ff000000ff0000ff
	add	%i6,0x008,%g1
	stda	%f14,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010181408] = ff00500000000000
!	%f22 = 00000000, Mem[0000000010141410] = ffffffff
	sta	%f22,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	%f3  = 00000000, Mem[0000000030101410] = ff0000ff
	sta	%f3 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	Code Fragment 4
p0_fragment_42:
!	%l0 = 00000000ff009594
	setx	0xda2f6e47d698fa3e,%g7,%l0 ! %l0 = da2f6e47d698fa3e
!	%l1 = 00000000000000ff
	setx	0xc4f205c04b3ea42c,%g7,%l1 ! %l1 = c4f205c04b3ea42c
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = da2f6e47d698fa3e
	setx	0x08a2946026af1e58,%g7,%l0 ! %l0 = 08a2946026af1e58
!	%l1 = c4f205c04b3ea42c
	setx	0x263c64c8440fdcdc,%g7,%l1 ! %l1 = 263c64c8440fdcdc
!	Mem[00000000100c1421] = 000000ff, %l6 = 00000000000000ff
	ldstuba	[%i3+0x021]%asi,%l6	! %l6 = 00000000000000ff
!	%f6  = 000000ff, Mem[00000000300c1410] = 00000000
	sta	%f6 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 62b0a6ff, %l0 = 08a2946026af1e58
	ldsba	[%i0+%o4]0x89,%l0	! %l0 = ffffffffffffffff

p0_label_377:
!	Mem[0000000010081410] = 000000ff, %l7 = 0000000000000000
	lduba	[%i2+%o5]0x80,%l7	! %l7 = 0000000000000000
!	%f29 = 1023d0d0, Mem[0000000030001408] = ffa6b062
	sta	%f29,[%i0+%o4]0x81	! Mem[0000000030001408] = 1023d0d0
!	Mem[0000000030101410] = 00000000, %f21 = 00000000
	lda	[%i4+%o5]0x89,%f21	! %f21 = 00000000
!	Mem[0000000010141408] = 00000000 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010141400] = ffff00ff, %l4 = 00000000000000ff
	lduwa	[%i5+%g0]0x80,%l4	! %l4 = 00000000ffff00ff
!	Mem[00000000211c0000] = 00fffcae, %l6 = 0000000000000000
	lduh	[%o2+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010041428] = 000000ff, %l1 = 263c64c8440fdcdc
	ldub	[%i1+0x029],%l1		! %l1 = 0000000000000000
!	Mem[0000000021800180] = 66ff8f81, %l0 = ffffffffffffffff
	lduha	[%o3+0x180]%asi,%l0	! %l0 = 00000000000066ff
!	Mem[0000000020800040] = ffffbf87, %l5 = 0000000000000000
	ldsh	[%o1+0x040],%l5		! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f23 = 7fffffff, Mem[0000000010101408] = 00000000
	st	%f23,[%i4+%o4]		! Mem[0000000010101408] = 7fffffff

p0_label_378:
!	%f16 = 00000000 00000000, Mem[0000000010001410] = 00000000 00000000
	std	%f16,[%i0+%o5]	! Mem[0000000010001410] = 00000000 00000000
!	%l6 = 00000000000000ff, Mem[0000000010101410] = 0000000000000000
	stxa	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000000000ff
!	%l0 = 000066ff, %l1 = 00000000, Mem[00000000100c1400] = ff000000 000000ff
	stda	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000066ff 00000000
!	%f13 = 00000000, Mem[0000000030181400] = 000000ff
	sta	%f13,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	%l2 = 00000000ff0000ff, Mem[00000000300c1400] = ff00000000000000
	stxa	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000ff0000ff
!	Mem[0000000010041408] = ff0000ff, %l7 = 0000000000000000
	swapa	[%i1+%o4]0x88,%l7	! %l7 = 00000000ff0000ff
!	Mem[00000000211c0000] = 00fffcae, %l3 = 00000000ff000000
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141400] = ffff00ff, %l1 = 0000000000000000
	swapa	[%i5+%g0]0x81,%l1	! %l1 = 00000000ffff00ff
!	Code Fragment 3
p0_fragment_43:
!	%l0 = 00000000000066ff
	setx	0xa6ea3f9854fd32e2,%g7,%l0 ! %l0 = a6ea3f9854fd32e2
!	%l1 = 00000000ffff00ff
	setx	0x27c87377cc9fa2a0,%g7,%l1 ! %l1 = 27c87377cc9fa2a0
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a6ea3f9854fd32e2
	setx	0xebd7d0ef8e7b9bc2,%g7,%l0 ! %l0 = ebd7d0ef8e7b9bc2
!	%l1 = 27c87377cc9fa2a0
	setx	0xe457f1406610b5cc,%g7,%l1 ! %l1 = e457f1406610b5cc
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00000000, %l5 = ffffffffffffffff
	ldswa	[%i4+%o5]0x89,%l5	! %l5 = 0000000000000000

p0_label_379:
!	Mem[000000001004143c] = ff0000ff, %l7 = 00000000ff0000ff
	ldsh	[%i1+0x03e],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010001410] = 0000000000000000, %f0  = ffffffff 00000000
	ldda	[%i0+%o5]0x80,%f0 	! %f0  = 00000000 00000000
!	Mem[00000000211c0000] = fffffcae, %l4 = 00000000ffff00ff
	ldub	[%o2+0x001],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030081410] = 00000000, %l4 = 00000000000000ff
	lduba	[%i2+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000021800100] = ffffa03e, %l4 = 0000000000000000
	ldsb	[%o3+0x100],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010141400] = ffff00ff, %l1 = e457f1406610b5cc
	lduha	[%i5+%g0]0x80,%l1	! %l1 = 000000000000ffff
!	Mem[00000000100c140c] = ffa53eff, %f18 = bda6b4e7
	lda	[%i3+0x00c]%asi,%f18	! %f18 = ffa53eff
!	Mem[0000000010141428] = 00000000000000ff, %f6  = 000000ff 00000000
	ldd	[%i5+0x028],%f6 	! %f6  = 00000000 000000ff
	membar	#Sync			! Added by membar checker (73)
!	Mem[00000000100c1400] = 000066ff 00000000 00000000 ffa53eff
!	Mem[00000000100c1410] = 00000000 ff5a0000 00000000 00000028
!	Mem[00000000100c1420] = 00ff00ff 000000ff 00000000 00000000
!	Mem[00000000100c1430] = 00000000 ff000000 00006e03 ff5a0000
	ldda	[%i3]ASI_BLK_P,%f16	! Block Load from 00000000100c1400
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = ff005000, %l3 = 0000000000000000
	ldstuba	[%i6+%o4]0x80,%l3	! %l3 = 000000ff000000ff

p0_label_380:
!	%f0  = 00000000, Mem[0000000010001408] = 0aff5a03
	sta	%f0 ,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
	membar	#Sync			! Added by membar checker (74)
!	%l4 = ffffffffffffffff, Mem[00000000100c1408] = 00000000
	stwa	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffffffff
!	%l0 = 8e7b9bc2, %l1 = 0000ffff, Mem[00000000100c1428] = 00000000 00000000
	std	%l0,[%i3+0x028]		! Mem[00000000100c1428] = 8e7b9bc2 0000ffff
!	%l4 = ffffffff, %l5 = 00000000, Mem[0000000010001408] = 00000000 00000000
	stda	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffffff 00000000
!	%f3  = 00000000, Mem[000000001008140c] = 00000000
	st	%f3 ,[%i2+0x00c]	! Mem[000000001008140c] = 00000000
!	%l2 = 00000000ff0000ff, Mem[0000000010181400] = 000000ff
	stwa	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = ff0000ff
!	%l5 = 0000000000000000, Mem[0000000030001410] = ff0000ff
	stha	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = ff000000
!	%l4 = ffffffffffffffff, Mem[0000000021800000] = 0000b05a, %asi = 80
	stha	%l4,[%o3+0x000]%asi	! Mem[0000000021800000] = ffffb05a
!	%f18 = 00000000, %f21 = ff5a0000, %f10 = 00005aff
	fsubs	%f18,%f21,%f10		! %f10 = 7f5a0000
!	Starting 10 instruction Load Burst
!	Mem[000000001014142c] = 000000ff, %l6 = 00000000000000ff
	ldsw	[%i5+0x02c],%l6		! %l6 = 00000000000000ff

p0_label_381:
!	Mem[0000000030181408] = 0000ff00, %l1 = 000000000000ffff
	ldswa	[%i6+%o4]0x89,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010181410] = 00000080, %l7 = 00000000000000ff
	ldswa	[%i6+%o5]0x80,%l7	! %l7 = 0000000000000080
!	Mem[0000000010141400] = ffff00ff, %l0 = ebd7d0ef8e7b9bc2
	lduha	[%i5+%g0]0x80,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010081408] = 94950000, %l3 = 00000000000000ff
	lduwa	[%i2+%o4]0x88,%l3	! %l3 = 0000000094950000
!	Mem[0000000010081430] = ffffffff, %l6 = 00000000000000ff
	lduba	[%i2+0x032]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1428] = 8e7b9bc20000ffff, %l0 = 000000000000ffff
	ldxa	[%i3+0x028]%asi,%l0	! %l0 = 8e7b9bc20000ffff
!	Mem[0000000010081408] = 00009594, %l6 = 00000000000000ff
	ldsha	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = ffff00ff, %l0 = 8e7b9bc20000ffff
	ldsba	[%i5+%g0]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010081400] = 00000000 1023d0d0, %l2 = ff0000ff, %l3 = 94950000
	ldda	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000 000000001023d0d0
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffffffff, Mem[0000000030081410] = 00000000
	stwa	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffffff

p0_label_382:
!	%l5 = 0000000000000000, Mem[0000000030141410] = 0000ff00
	stwa	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	Mem[0000000010141410] = 00000000, %l0 = ffffffffffffffff
	swapa	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030081408] = ff3ea5ff
	stha	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000a5ff
!	Mem[000000001018143c] = 00000000, %l3 = 000000001023d0d0
	swap	[%i6+0x03c],%l3		! %l3 = 0000000000000000
!	Code Fragment 3
p0_fragment_44:
!	%l0 = 0000000000000000
	setx	0x50d51637dd24e9fd,%g7,%l0 ! %l0 = 50d51637dd24e9fd
!	%l1 = 000000000000ff00
	setx	0x8d1eb3e7c7713160,%g7,%l1 ! %l1 = 8d1eb3e7c7713160
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 50d51637dd24e9fd
	setx	0x1f8898602730c1d4,%g7,%l0 ! %l0 = 1f8898602730c1d4
!	%l1 = 8d1eb3e7c7713160
	setx	0x24cd18f02d00a659,%g7,%l1 ! %l1 = 24cd18f02d00a659
!	%f24 = 00ff00ff, Mem[0000000010081400] = 00000000
	sta	%f24,[%i2+%g0]0x80	! Mem[0000000010081400] = 00ff00ff
!	%l3 = 0000000000000000, Mem[0000000010001408] = 00000000ffffffff
	stxa	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000030081400] = 000000ff
	stwa	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	Mem[0000000030081410] = ffffffff, %l2 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00000000ff00ffff, %l4 = ffffffffffffffff
	ldxa	[%i5+%g0]0x88,%l4	! %l4 = 00000000ff00ffff

p0_label_383:
!	Mem[0000000010101400] = 000000ff, %l6 = 0000000000000000
	lduwa	[%i4+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[000000001000140c] = 00000000, %l0 = 1f8898602730c1d4
	ldsba	[%i0+0x00f]%asi,%l0	! %l0 = 0000000000000000
!	%l6 = 00000000000000ff, imm = fffffffffffffc94, %l6 = 00000000000000ff
	andn	%l6,-0x36c,%l6		! %l6 = 000000000000006b
!	Mem[000000001008142c] = 000000ff, %l3 = 0000000000000000
	ldsw	[%i2+0x02c],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010081408] = 0000959400000000, %l3 = 00000000000000ff
	ldxa	[%i2+%o4]0x80,%l3	! %l3 = 0000959400000000
!	Mem[0000000010041408] = 00000000, %l6 = 000000000000006b
	lduwa	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l4 = 00000000ff00ffff
	lduha	[%i0+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041400] = 5a00739600000000, %l0 = 0000000000000000
	ldxa	[%i1+%g0]0x80,%l0	! %l0 = 5a00739600000000
!	Mem[00000000100c1408] = ffffffff, %f2  = 00000000
	ld	[%i3+%o4],%f2 	! %f2 = ffffffff
!	Starting 10 instruction Store Burst
!	%f14 = 00000000, %f27 = 00000000
	fsqrts	%f14,%f27		! %f27 = 00000000

p0_label_384:
!	%l3 = 0000959400000000, Mem[0000000030001410] = 000000ff
	stwa	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	Mem[0000000010001408] = 00000000, %l0 = 5a00739600000000
	swapa	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l4 = 0000000000000000
	swapa	[%i0+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1408] = ffffffff, %l5 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000030101400] = ff000000, %l0 = 0000000000000000
	swapa	[%i4+%g0]0x89,%l0	! %l0 = 00000000ff000000
!	Mem[0000000010181408] = 005000ff, %l3 = 0000959400000000
	ldstuba	[%i6+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	%l4 = 00000000, %l5 = ffffffff, Mem[0000000010101408] = 7fffffff 00000028
	stda	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000 ffffffff
!	Mem[0000000010081400] = 00ff00ff, %l1 = 24cd18f02d00a659
	ldstuba	[%i2+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001408] = 00000000, %l7 = 0000000000000080
	ldstuba	[%i0+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1424] = 000000ff, %l6 = 0000000000000000
	lduba	[%i3+0x026]%asi,%l6	! %l6 = 0000000000000000

p0_label_385:
!	%l1 = 0000000000000000, imm = 000000000000034e, %l6 = 0000000000000000
	add	%l1,0x34e,%l6		! %l6 = 000000000000034e
!	Mem[0000000030101400] = 00000000, %l6 = 000000000000034e
	lduha	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l5 = 00000000ffffffff
	ldswa	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %l6 = 0000000000000000
	ldsba	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041404] = 00000000, %l5 = 0000000000000000
	lduba	[%i1+0x005]%asi,%l5	! %l5 = 0000000000000000
!	Mem[000000001000140c] = 00000000, %l7 = 0000000000000000
	lduw	[%i0+0x00c],%l7		! %l7 = 0000000000000000
!	%l5 = 0000000000000000, immed = 000007c3, %y  = 000000fe
	sdiv	%l5,0x7c3,%l1		! %l1 = 0000000020b986a2
	mov	%l0,%y			! %y = ff000000
!	Mem[0000000010101410] = ff00000000000000, %f28 = 00000000 ff000000
	ldda	[%i4+%o5]0x80,%f28	! %f28 = ff000000 00000000
!	Mem[0000000030081410] = ffffffff, %l5 = 0000000000000000
	ldsha	[%i2+%o5]0x81,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000030141410] = 00000000 000000ff
	stda	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000ff 000000ff

p0_label_386:
!	Mem[0000000010081408] = 00009594, %l7 = 0000000000000000
	swapa	[%i2+%o4]0x80,%l7	! %l7 = 0000000000009594
!	%l0 = 00000000ff000000, Mem[00000000201c0000] = ff288819
	sth	%l0,[%o0+%g0]		! Mem[00000000201c0000] = 00008819
!	%l7 = 0000000000009594, Mem[0000000030141400] = 00000000
	stwa	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = 00009594
!	%l1 = 0000000020b986a2, Mem[0000000010141400] = ffff00ff
	stba	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = a2ff00ff
!	Mem[0000000030001400] = ff000000, %l7 = 0000000000009594
	ldstuba	[%i0+%g0]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000211c0001] = fffffcae, %l5 = ffffffffffffffff
	ldstuba	[%o2+0x001]%asi,%l5	! %l5 = 000000ff000000ff
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000030081408] = ffa50000 000000ff
	stda	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000ff 000000ff
!	%l6 = 0000000000000000, Mem[0000000010101438] = 00005aff
	stw	%l6,[%i4+0x038]		! Mem[0000000010101438] = 00000000
!	Mem[0000000010081410] = ff000000, %l0 = 00000000ff000000
	swapa	[%i2+%o5]0x88,%l0	! %l0 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff000000, %l7 = 00000000000000ff
	ldswa	[%i0+%o4]0x80,%l7	! %l7 = ffffffffff000000

p0_label_387:
!	Mem[0000000020800000] = 00ffc3ca, %l3 = 00000000000000ff
	ldub	[%o1+0x001],%l3		! %l3 = 00000000000000ff
!	Mem[0000000030001400] = ff000000, %l3 = 00000000000000ff
	lduba	[%i0+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	%f28 = ff000000, %f6  = 00000000, %f28 = ff000000 00000000
	fsmuld	%f28,%f6 ,%f28		! %f28 = 80000000 00000000
!	Mem[0000000030101408] = 00000000 00000000, %l0 = ff000000, %l1 = 20b986a2
	ldda	[%i4+%o4]0x89,%l0	! %l0 = 0000000000000000 0000000000000000
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000030181410] = ffffffff 00000000
	stda	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000 000000ff
!	Mem[0000000030141400] = 00009594, %l1 = 0000000000000000
	ldsha	[%i5+%g0]0x89,%l1	! %l1 = ffffffffffff9594
!	%l3 = 00000000000000ff, %l4 = 0000000000000000, %y  = ff000000
	smul	%l3,%l4,%l6		! %l6 = 0000000000000000, %y = 00000000
!	Mem[0000000030141408] = 0000000000000000, %f30 = 00006e03 ff5a0000
	ldda	[%i5+%o4]0x81,%f30	! %f30 = 00000000 00000000
!	Mem[00000000300c1410] = 000000ff, %l3 = 00000000000000ff
	lduba	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = ff000000, %l7 = ffffffffff000000
	ldstuba	[%i0+%o4]0x80,%l7	! %l7 = 000000ff000000ff

p0_label_388:
!	Mem[0000000010101410] = 000000ff, %l1 = ffffffffffff9594
	ldstuba	[%i4+%o5]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010101428] = ff000000, %l3 = 0000000000000000, %asi = 80
	swapa	[%i4+0x028]%asi,%l3	! %l3 = 00000000ff000000
!	Mem[00000000100c1414] = ff5a0000, %l5 = 00000000000000ff, %asi = 80
	swapa	[%i3+0x014]%asi,%l5	! %l5 = 00000000ff5a0000
!	Mem[0000000030141400] = 00009594, %l1 = 00000000000000ff
	swapa	[%i5+%g0]0x89,%l1	! %l1 = 0000000000009594
!	Mem[0000000010081408] = 00000000, %l4 = 0000000000000000
	ldswa	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000000
!	%l7 = 00000000000000ff, Mem[0000000010141408] = 0000000000000000
	stxa	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000030081410] = ffffffff
	stba	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffff00
!	%f8  = 46375da6, Mem[0000000030181400] = 00000000
	sta	%f8 ,[%i6+%g0]0x89	! Mem[0000000030181400] = 46375da6
!	Mem[000000001000142f] = 000000ff, %l4 = 0000000000000000
	ldstub	[%i0+0x02f],%l4		! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 9c000000, %l6 = 0000000000000000
	lduwa	[%i0+%g0]0x80,%l6	! %l6 = 000000009c000000

p0_label_389:
!	Mem[0000000010141400] = a2ff00ff, %l2 = 00000000000000ff
	ldsba	[%i5+%g0]0x80,%l2	! %l2 = ffffffffffffffa2
!	Mem[00000000300c1410] = 000000ffa15a0000, %f0  = 00000000 00000000
	ldda	[%i3+%o5]0x81,%f0 	! %f0  = 000000ff a15a0000
!	Mem[0000000010041410] = bda6b4e7ffffffff, %l3 = 00000000ff000000
	ldxa	[%i1+%o5]0x88,%l3	! %l3 = bda6b4e7ffffffff
!	Mem[0000000010101420] = 4410000000000000, %l4 = 00000000000000ff
	ldx	[%i4+0x020],%l4		! %l4 = 4410000000000000
!	Mem[0000000010041410] = ffffffff, %l2 = ffffffffffffffa2
	ldswa	[%i1+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030001410] = 0000000000000000, %f18 = 00000000 ffa53eff
	ldda	[%i0+%o5]0x89,%f18	! %f18 = 00000000 00000000
!	Mem[0000000010101400] = 000000ff, %l3 = bda6b4e7ffffffff
	ldsha	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l2 = ffffffffffffffff
	lduha	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Code Fragment 4
p0_fragment_45:
!	%l0 = 0000000000000000
	setx	0x26a09a5818d2c27b,%g7,%l0 ! %l0 = 26a09a5818d2c27b
!	%l1 = 0000000000009594
	setx	0x2bc967901eee50db,%g7,%l1 ! %l1 = 2bc967901eee50db
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 26a09a5818d2c27b
	setx	0x2d87d6ff9493a58f,%g7,%l0 ! %l0 = 2d87d6ff9493a58f
!	%l1 = 2bc967901eee50db
	setx	0x02c76a8f9c9cd1ef,%g7,%l1 ! %l1 = 02c76a8f9c9cd1ef
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, %l2 = 0000000000000000, %l4 = 4410000000000000
	add	%l3,%l2,%l4		! %l4 = 0000000000000000

p0_label_390:
!	%f16 = 000066ff 00000000 00000000 00000000
!	%f20 = 00000000 ff5a0000 00000000 00000028
!	%f24 = 00ff00ff 000000ff 00000000 00000000
!	%f28 = 80000000 00000000 00000000 00000000
	stda	%f16,[%i6]ASI_BLK_P	! Block Store to 0000000010181400
!	Mem[0000000030041408] = ff0000ff, %l7 = 00000000000000ff
	swapa	[%i1+%o4]0x89,%l7	! %l7 = 00000000ff0000ff
!	%l3 = 0000000000000000, Mem[0000000030181400] = 46375da6
	stba	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 46375d00
!	%f9  = 265aff0a, Mem[0000000030001400] = 000000ff
	sta	%f9 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 265aff0a
!	%f12 = d0d02310 00000000, %l5 = 00000000ff5a0000
!	Mem[0000000010041420] = ff00ffffffff00ff
	add	%i1,0x020,%g1
	stda	%f12,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010041420] = ff00ffffffff00ff
!	%l3 = 0000000000000000, Mem[0000000030101400] = 00000000
	stha	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	Mem[0000000010081400] = ff00ffff, %l3 = 0000000000000000
	ldstuba	[%i2+%g0]0x88,%l3	! %l3 = 000000ff000000ff
!	%f14 = 00000000 ff50300e, %l6 = 000000009c000000
!	Mem[0000000030141408] = 0000000000000000
	add	%i5,0x008,%g1
	stda	%f14,[%g1+%l6]ASI_PST8_S ! Mem[0000000030141408] = 0000000000000000
!	%f8  = 46375da6 265aff0a, %l0 = 2d87d6ff9493a58f
!	Mem[0000000030181408] = 00ff000000000000
	add	%i6,0x008,%g1
	stda	%f8,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030181408] = 0aff5a26a65d3746
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ffffffff, %l5 = 00000000ff5a0000
	ldswa	[%i1+%o5]0x88,%l5	! %l5 = ffffffffffffffff

p0_label_391:
!	Mem[00000000100c1400] = 000066ff, %l5 = ffffffffffffffff
	ldsba	[%i3+0x002]%asi,%l5	! %l5 = 0000000000000066
!	Mem[0000000010141410] = ffffffff00000000, %l6 = 000000009c000000
	ldxa	[%i5+%o5]0x80,%l6	! %l6 = ffffffff00000000
!	Mem[0000000010101410] = 000000ff, %l4 = 0000000000000000
	lduba	[%i4+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081408] = 00000000 00000000, %l6 = 00000000, %l7 = ff0000ff
	ldda	[%i2+0x008]%asi,%l6	! %l6 = 0000000000000000 0000000000000000
!	%l7 = 0000000000000000, immed = 00000f3b, %y  = 00000000
	smul	%l7,0xf3b,%l1		! %l1 = 0000000000000000, %y = 00000000
!	Mem[0000000010101400] = 000000ff, %l4 = 00000000000000ff
	lduwa	[%i4+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101430] = fa1caa6d, %l5 = 0000000000000066
	lduwa	[%i4+0x030]%asi,%l5	! %l5 = 00000000fa1caa6d
!	Mem[0000000030041408] = ff000000, %l2 = 0000000000000000
	ldswa	[%i1+%o4]0x81,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010141408] = 00000000, %l1 = 0000000000000000
	ldswa	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = ffff00ff, %l1 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l1	! %l1 = 000000ff000000ff

p0_label_392:
!	%f14 = 00000000, Mem[0000000010041404] = 00000000
	st	%f14,[%i1+0x004]	! Mem[0000000010041404] = 00000000
!	%l2 = ffffffffff000000, Mem[0000000030041400] = ff000000
	stwa	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = ff000000
!	%f5  = 00000000, Mem[0000000010001428] = 00000000
	sta	%f5 ,[%i0+0x028]%asi	! Mem[0000000010001428] = 00000000
!	%f14 = 00000000, Mem[00000000300c1410] = 000000ff
	sta	%f14,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	%l0 = 9493a58f, %l1 = 000000ff, Mem[0000000030041410] = 94f7a860 ffffffff
	stda	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 9493a58f 000000ff
!	%f6  = 00000000 000000ff, %l3 = 00000000000000ff
!	Mem[0000000010181430] = 8000000000000000
	add	%i6,0x030,%g1
	stda	%f6,[%g1+%l3]ASI_PST8_P ! Mem[0000000010181430] = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000030141400] = 000000ff
	stba	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	%l4 = 00000000000000ff, Mem[0000000030181408] = 46375da6265aff0a
	stxa	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000000000ff
!	Mem[0000000010041410] = ffffffff, %l6 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l6	! %l6 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_46:
!	%l0 = 2d87d6ff9493a58f
	setx	0x88ac20e00d80a7c3,%g7,%l0 ! %l0 = 88ac20e00d80a7c3
!	%l1 = 00000000000000ff
	setx	0xce663fe06dd38df3,%g7,%l1 ! %l1 = ce663fe06dd38df3
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 88ac20e00d80a7c3
	setx	0xef910f8007977773,%g7,%l0 ! %l0 = ef910f8007977773
!	%l1 = ce663fe06dd38df3
	setx	0x1658c210061029c7,%g7,%l1 ! %l1 = 1658c210061029c7

p0_label_393:
	membar	#Sync			! Added by membar checker (75)
!	Mem[0000000030141400] = 00000000 00000000 00000000 00000000
!	Mem[0000000030141410] = 000000ff 000000ff 1062a465 b92ab835
!	Mem[0000000030141420] = 46375da6 265aff0a f72db4ac 935ea4f9
!	Mem[0000000030141430] = d0d02310 036e77e0 2ca1722d 891eac02
	ldda	[%i5]ASI_BLK_AIUS,%f0	! Block Load from 0000000030141400
!	Mem[0000000010081434] = 00000000, %l1 = 1658c210061029c7
	lduh	[%i2+0x034],%l1		! %l1 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l5 = 00000000fa1caa6d
	ldswa	[%i3+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = ffff00ff, %l0 = ef910f8007977773
	ldsba	[%i2+%g0]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030041400] = ff000000 00000000 ff000000 ff3ea5ff
!	Mem[0000000030041410] = 9493a58f 000000ff 9673005a a1000000
!	Mem[0000000030041420] = ffff0052 ff16658b a15a0000 20f1f32e
!	Mem[0000000030041430] = ff000000 000000ff ff0000f5 aeffffff
	ldda	[%i1]ASI_BLK_S,%f16	! Block Load from 0000000030041400
!	Mem[0000000010001410] = 00000000 00000000, %l0 = ffffffff, %l1 = 00000000
	ldda	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[00000000100c1410] = 00000000 000000ff, %l6 = ffffffff, %l7 = 00000000
	ldda	[%i3+0x010]%asi,%l6	! %l6 = 0000000000000000 00000000000000ff
!	%f8  = 46375da6, %f15 = 891eac02, %f11 = 935ea4f9
	fsubs	%f8 ,%f15,%f11		! %f11 = 46375da6
!	Mem[000000001010141c] = 00000010, %l6 = 0000000000000000
	lduw	[%i4+0x01c],%l6		! %l6 = 0000000000000010
!	Starting 10 instruction Store Burst
!	Mem[0000000021800081] = ffff0203, %l6 = 0000000000000010
	ldstub	[%o3+0x081],%l6		! %l6 = 000000ff000000ff

p0_label_394:
!	%f9  = 265aff0a, Mem[0000000010081410] = ff000000
	sta	%f9 ,[%i2+%o5]0x88	! Mem[0000000010081410] = 265aff0a
!	%l5 = 0000000000000000, Mem[000000001014142a] = 00000000, %asi = 80
	stha	%l5,[%i5+0x02a]%asi	! Mem[0000000010141428] = 00000000
!	Mem[00000000100c1408] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101410] = ff000000, %l3 = 00000000000000ff
	swapa	[%i4+%o5]0x80,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010001410] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i0+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181400] = 005d3746, %l5 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	%l3 = 00000000ff000000, Mem[0000000010081410] = 0aff5a26
	stha	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = 00005a26
!	Mem[0000000010001400] = 9c000000, %l6 = 000000ff, %l3 = ff000000
	casa	[%i0]0x80,%l6,%l3	! %l3 = 000000009c000000
!	%f5  = 000000ff, %f0  = 00000000
	fcmps	%fcc1,%f5 ,%f0 		! %fcc1 = 2
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00000000, %l2 = ffffffffff000000
	lduha	[%i0+%o5]0x81,%l2	! %l2 = 0000000000000000

p0_label_395:
!	Mem[000000001004143c] = ff0000ff, %l5 = 0000000000000000
	ldsh	[%i1+0x03c],%l5		! %l5 = ffffffffffffff00
!	Mem[0000000010101428] = 00000000, %f10 = f72db4ac
	ld	[%i4+0x028],%f10	! %f10 = 00000000
!	Mem[0000000010081418] = 000000005a007396, %l7 = 0000000000000000
	ldx	[%i2+0x018],%l7		! %l7 = 000000005a007396
!	Mem[0000000010001410] = ff000000 00000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 00000000ff000000 0000000000000000
!	Mem[0000000030041400] = ff00000000000000, %l2 = 0000000000000000
	ldxa	[%i1+%g0]0x81,%l2	! %l2 = ff00000000000000
!	Mem[0000000030081400] = 0000000000000000, %f6  = 1062a465 b92ab835
	ldda	[%i2+%g0]0x81,%f6 	! %f6  = 00000000 00000000
!	Mem[0000000010101410] = ff000000, %l5 = ffffffffffffff00
	ldswa	[%i4+%o5]0x88,%l5	! %l5 = ffffffffff000000
!	Mem[0000000010041408] = 000000ff 00000000, %l4 = 000000ff, %l5 = ff000000
	ldda	[%i1+%o4]0x88,%l4	! %l4 = 0000000000000000 00000000000000ff
!	Mem[0000000010001408] = 000000ff, %l3 = 000000009c000000
	lduba	[%i0+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 000000ff, Mem[00000000300c1408] = ffffffff 00000000
	stda	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000 000000ff

p0_label_396:
!	%l0 = 00000000ff000000, Mem[0000000030101410] = 0000000000000000
	stxa	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000ff000000
!	Mem[0000000010001414] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i0+0x014]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i2+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	%f12 = d0d02310 036e77e0, Mem[0000000010081410] = 00005a26 b40a3a57
	stda	%f12,[%i2+%o5]0x80	! Mem[0000000010081410] = d0d02310 036e77e0
!	%f10 = 00000000 46375da6, Mem[00000000100c1418] = 00000000 00000028
	stda	%f10,[%i3+0x018]%asi	! Mem[00000000100c1418] = 00000000 46375da6
!	Mem[00000000300c1410] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i3+%o5]0x89,%l5	! %l5 = 00000000000000ff
	membar	#Sync			! Added by membar checker (76)
!	%l5 = 0000000000000000, Mem[0000000030041410] = 8fa59394
	stba	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = 8fa59300
!	Mem[0000000010141433] = ff000000, %l3 = 0000000000000000
	ldstub	[%i5+0x033],%l3		! %l3 = 00000000000000ff
!	%f28 = ff000000, Mem[0000000030081408] = ff000000
	sta	%f28,[%i2+%o4]0x81	! Mem[0000000030081408] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l0 = 00000000ff000000
	lduha	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000000

p0_label_397:
!	Mem[00000000100c1400] = 000066ff, %l5 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l0 = 0000000000000000
	lduha	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001410] = 00000000, %l3 = 0000000000000000
	lduba	[%i0+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = ffff00ff 1023d0d0, %l2 = 00000000, %l3 = 00000000
	ldda	[%i2+%g0]0x80,%l2	! %l2 = 00000000ffff00ff 000000001023d0d0
!	Mem[00000000211c0000] = fffffcae, %l4 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010081428] = ff000000000000ff, %l2 = 00000000ffff00ff
	ldxa	[%i2+0x028]%asi,%l2	! %l2 = ff000000000000ff
!	Mem[0000000030141400] = 00000000, %l0 = 0000000000000000
	ldsha	[%i5+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081410] = d0d02310036e77e0, %f20 = 9493a58f 000000ff
	ldda	[%i2+%o5]0x80,%f20	! %f20 = d0d02310 036e77e0
!	Mem[0000000010041428] = 000000ff, %l2 = ff000000000000ff
	lduha	[%i1+0x02a]%asi,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l3 = 000000001023d0d0, Mem[0000000010181410] = 00000000
	stha	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000d0d0

p0_label_398:
!	Mem[0000000010141408] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[0000000010181408] = 0000000000000000
	stxa	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000000000ff
!	Mem[000000001014143b] = 00000000, %l7 = 000000005a007396
	ldstuba	[%i5+0x03b]%asi,%l7	! %l7 = 00000000000000ff
!	%f26 = a15a0000 20f1f32e, %l7 = 0000000000000000
!	Mem[0000000010101420] = 4410000000000000
	add	%i4,0x020,%g1
	stda	%f26,[%g1+%l7]ASI_PST8_P ! Mem[0000000010101420] = 4410000000000000
!	%f22 = 9673005a a1000000, Mem[0000000010081408] = ff000000 00000000
	stda	%f22,[%i2+%o4]0x80	! Mem[0000000010081408] = 9673005a a1000000
!	%f0  = 00000000 00000000, Mem[0000000030181408] = ff000000 00000000
	stda	%f0 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000 00000000
!	%l3 = 000000001023d0d0, Mem[0000000030141408] = 00000000
	stha	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000d0d0
!	%l6 = 00000000000000ff, Mem[0000000020800040] = ffffbf87
	sth	%l6,[%o1+0x040]		! Mem[0000000020800040] = 00ffbf87
!	%f0  = 00000000, Mem[0000000030101408] = 00000000
	sta	%f0 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 000066ff, %l5 = 0000000000000000
	ldsba	[%i6+%g0]0x80,%l5	! %l5 = 0000000000000000

p0_label_399:
!	Mem[0000000030101408] = 00000000, %l4 = 000000000000ffff
	ldsha	[%i4+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181400] = 46375dff, %l4 = 0000000000000000
	lduha	[%i6+%g0]0x89,%l4	! %l4 = 0000000000005dff
!	Mem[0000000030141410] = ff000000 ff000000, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i5+%o5]0x89,%l6	! %l6 = 00000000ff000000 00000000ff000000
!	Mem[0000000010081410] = d0d02310, %l7 = 00000000ff000000
	lduha	[%i2+%o5]0x80,%l7	! %l7 = 000000000000d0d0
!	Mem[0000000030081400] = 00000000, %l4 = 0000000000005dff
	ldsha	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081408] = 000000ff, %l6 = 00000000ff000000
	lduba	[%i2+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141410] = 000000ff, %l4 = 0000000000000000
	ldsba	[%i5+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[000000001014143c] = ffa53eff, %l5 = 0000000000000000
	ldswa	[%i5+0x03c]%asi,%l5	! %l5 = ffffffffffa53eff
!	Mem[00000000100c1400] = 000066ff00000000, %l1 = 0000000000000000
	ldxa	[%i3+0x000]%asi,%l1	! %l1 = 000066ff00000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = ff000000, %l7 = 000000000000d0d0
	ldstuba	[%i3+%o5]0x81,%l7	! %l7 = 000000ff000000ff

p0_label_400:
!	%l6 = 00000000000000ff, Mem[0000000030081400] = 0000000000000000
	stxa	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000000000ff
!	Mem[000000001000143c] = 00000000, %l0 = 0000000000000000
	ldstub	[%i0+0x03c],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010101400] = 000000ff, %l1 = 000066ff00000000
	swapa	[%i4+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	%f28 = ff000000 000000ff, Mem[00000000100c1418] = 00000000 46375da6
	std	%f28,[%i3+0x018]	! Mem[00000000100c1418] = ff000000 000000ff
!	Mem[0000000010181400] = 000066ff, %l2 = 00000000000000ff
	ldstuba	[%i6+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[0000000010141400] = ff00ffa2
	stwa	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff
!	%l5 = ffffffffffa53eff, Mem[0000000030041400] = ff00000000000000
	stxa	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffffffffa53eff
!	%f0  = 00000000 00000000 00000000 00000000
!	%f4  = 000000ff 000000ff 00000000 00000000
!	%f8  = 46375da6 265aff0a 00000000 46375da6
!	%f12 = d0d02310 036e77e0 2ca1722d 891eac02
	stda	%f0,[%i4]ASI_BLK_AIUSL	! Block Store to 0000000030101400
!	%f29 = 000000ff, Mem[0000000030081400] = 00000000
	sta	%f29,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = fffffcae, %l4 = 0000000000000000
	lduh	[%o2+%g0],%l4		! %l4 = 000000000000ffff

p0_label_401:
!	Mem[0000000010081400] = ffff00ff1023d0d0, %f30 = ff0000f5 aeffffff
	ldda	[%i2+0x000]%asi,%f30	! %f30 = ffff00ff 1023d0d0
	membar	#Sync			! Added by membar checker (77)
!	Mem[0000000030101408] = 0000000000000000, %f20 = d0d02310 036e77e0
	ldda	[%i4+%o4]0x81,%f20	! %f20 = 00000000 00000000
!	Mem[0000000030081410] = 00ffffff00000000, %f24 = ffff0052 ff16658b
	ldda	[%i2+%o5]0x81,%f24	! %f24 = 00ffffff 00000000
!	Mem[0000000030081408] = ff000000ff000000, %f6  = 00000000 00000000
	ldda	[%i2+%o4]0x81,%f6 	! %f6  = ff000000 ff000000
!	Mem[0000000020800000] = 00ffc3ca, %l6 = 00000000000000ff
	ldub	[%o1+%g0],%l6		! %l6 = 0000000000000000
!	Mem[0000000030081408] = ff000000, %l3 = 000000001023d0d0
	ldsha	[%i2+%o4]0x81,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000030141400] = 00000000, %f9  = 265aff0a
	lda	[%i5+%g0]0x81,%f9 	! %f9 = 00000000
!	Mem[0000000030081408] = 000000ff, %l6 = 0000000000000000
	ldswa	[%i2+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041400] = 5a007396 00000000 00000000 ff000000
!	Mem[0000000010041410] = 00000000 e7b4a6bd 00000000 ff50300e
!	Mem[0000000010041420] = ff00ffff ffff00ff 000000ff 00000000
!	Mem[0000000010041430] = 00000000 ff000000 00ff0000 ff0000ff
	ldda	[%i1]ASI_BLK_AIUP,%f0	! Block Load from 0000000010041400
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = ffffff00, Mem[0000000030181400] = 46375dff 62b0a630
	stda	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000 ffffff00

p0_label_402:
!	%l4 = 000000000000ffff, Mem[0000000010001418] = 00000000
	sth	%l4,[%i0+0x018]		! Mem[0000000010001418] = ffff0000
!	%f30 = ffff00ff, %f24 = 00ffffff 00000000
	fstox	%f30,%f24		! %f24 = 80000000 00000000
!	Code Fragment 4
p0_fragment_47:
!	%l0 = 0000000000000000
	setx	0xb04f3507afaa161e,%g7,%l0 ! %l0 = b04f3507afaa161e
!	%l1 = 00000000000000ff
	setx	0x3e685527a8f848d1,%g7,%l1 ! %l1 = 3e685527a8f848d1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b04f3507afaa161e
	setx	0x6fbddc0065111926,%g7,%l0 ! %l0 = 6fbddc0065111926
!	%l1 = 3e685527a8f848d1
	setx	0x23cfb70fcc9f447a,%g7,%l1 ! %l1 = 23cfb70fcc9f447a
!	%l3 = ffffffffffffff00, Mem[0000000030101400] = 00000000
	stwa	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffff00
!	%f20 = 00000000 00000000, Mem[0000000010181410] = 0000d0d0 00005aff
	stda	%f20,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000 00000000
!	%l0 = 6fbddc0065111926, Mem[0000000010141408] = 000000ff
	stba	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000026
!	%l6 = 00000000000000ff, %l1 = 23cfb70fcc9f447a, %l3 = ffffffffffffff00
	andn	%l6,%l1,%l3		! %l3 = 0000000000000085
!	%f26 = a15a0000 20f1f32e, %l0 = 6fbddc0065111926
!	Mem[0000000010001420] = ff00000000000000
	add	%i0,0x020,%g1
	stda	%f26,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010001420] = fff3f10000000000
!	Mem[00000000211c0000] = fffffcae, %l3 = 0000000000000085
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff0000000000009c, %l1 = 23cfb70fcc9f447a
	ldxa	[%i0+%g0]0x88,%l1	! %l1 = ff0000000000009c

p0_label_403:
!	Mem[0000000010041400] = 5a007396, %f26 = a15a0000
	lda	[%i1+%g0]0x80,%f26	! %f26 = 5a007396
!	Mem[0000000030141400] = 00000000, %l2 = 0000000000000000
	ldswa	[%i5+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %f30 = ffff00ff
	lda	[%i4+%g0]0x88,%f30	! %f30 = 00000000
!	Mem[0000000010181400] = ff0066ff00000000, %f22 = 9673005a a1000000
	ldda	[%i6+%g0]0x80,%f22	! %f22 = ff0066ff 00000000
!	Mem[00000000100c1408] = ff3ea5ff 000000ff, %l4 = 0000ffff, %l5 = ffa53eff
	ldda	[%i3+%o4]0x88,%l4	! %l4 = 00000000000000ff 00000000ff3ea5ff
!	Mem[00000000300c1410] = ff000000, %f29 = 000000ff
	lda	[%i3+%o5]0x81,%f29	! %f29 = ff000000
!	Mem[0000000030141410] = ff000000 ff000000, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i5+%o5]0x89,%l6	! %l6 = 00000000ff000000 00000000ff000000
!	Mem[00000000100c1408] = ff000000, %l1 = ff0000000000009c
	lduba	[%i3+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001408] = d0d02310, %l0 = 6fbddc0065111926
	lduba	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000010
!	Starting 10 instruction Store Burst
!	Code Fragment 4
p0_fragment_48:
!	%l0 = 0000000000000010
	setx	0x56c12e6f9b2f08ba,%g7,%l0 ! %l0 = 56c12e6f9b2f08ba
!	%l1 = 00000000000000ff
	setx	0x235980f8222133f5,%g7,%l1 ! %l1 = 235980f8222133f5
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 56c12e6f9b2f08ba
	setx	0x309d2bf83eb6a57d,%g7,%l0 ! %l0 = 309d2bf83eb6a57d
!	%l1 = 235980f8222133f5
	setx	0x4b844c282b653ee5,%g7,%l1 ! %l1 = 4b844c282b653ee5

p0_label_404:
!	Mem[0000000030181400] = 00000000, %l7 = 00000000ff000000
	swapa	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081410] = ffffff00, %l5 = 00000000ff3ea5ff
	swapa	[%i2+%o5]0x89,%l5	! %l5 = 00000000ffffff00
!	Mem[00000000100c1410] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i3+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[00000000100c1408] = ff3ea5ff000000ff
	stxa	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000000000000000
!	%f16 = ff000000 00000000, Mem[0000000010081408] = 9673005a a1000000
	stda	%f16,[%i2+%o4]0x80	! Mem[0000000010081408] = ff000000 00000000
!	%l4 = 00000000000000ff, Mem[0000000030181408] = 00000000
	stha	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ff
!	%l3 = 00000000000000ff, immd = 0000000000000598, %l4  = 00000000000000ff
	mulx	%l3,0x598,%l4		! %l4 = 0000000000059268
!	%l4 = 00059268, %l5 = ffffff00, Mem[0000000010101418] = ff00ff00 00000010
	std	%l4,[%i4+0x018]		! Mem[0000000010101418] = 00059268 ffffff00
!	%l5 = 00000000ffffff00, Mem[00000000300c1408] = 00000000
	stba	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 0aff5a26, %l7 = 0000000000000000
	lduwa	[%i0+%g0]0x81,%l7	! %l7 = 000000000aff5a26

p0_label_405:
!	Mem[000000001000141c] = 00ff0000, %l7 = 000000000aff5a26
	ldswa	[%i0+0x01c]%asi,%l7	! %l7 = 0000000000ff0000
!	Mem[0000000030101410] = ff000000, %l3 = 00000000000000ff
	ldsha	[%i4+%o5]0x81,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000010181418] = 00000000, %l3 = ffffffffffffff00
	lduba	[%i6+0x018]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = ffa53eff, %l4 = 0000000000059268
	ldsha	[%i2+%o5]0x81,%l4	! %l4 = ffffffffffffffa5
!	Mem[00000000201c0000] = 00008819, %l7 = 0000000000ff0000
	lduha	[%o0+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001400] = 265aff0a, %l4 = ffffffffffffffa5
	lduha	[%i0+%g0]0x89,%l4	! %l4 = 000000000000ff0a
!	Mem[00000000100c1408] = 00000000, %l0 = 309d2bf83eb6a57d
	ldsba	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = 00000000 000000ff, %l0 = 00000000, %l1 = 2b653ee5
	ldda	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000000 00000000000000ff
!	Mem[0000000010041408] = 00000000ff000000, %l5 = 00000000ffffff00
	ldxa	[%i1+%o4]0x80,%l5	! %l5 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = fffffcae, %l3 = 0000000000000000
	ldstub	[%o2+0x001],%l3		! %l3 = 000000ff000000ff

p0_label_406:
!	%f8  = ff00ffff ffff00ff, %l5 = 00000000ff000000
!	Mem[0000000010101438] = 0000000000000000
	add	%i4,0x038,%g1
	stda	%f8,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010101438] = 0000000000000000
!	Mem[0000000030181408] = ff000000, %l2 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l2	! %l2 = 00000000ff000000
!	%l4 = 000000000000ff0a, Mem[0000000010101410] = ff000000
	stwa	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000ff0a
!	%l7 = 0000000000000000, Mem[00000000100c1408] = 0000000000000000
	stxa	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000000000
!	%f20 = 00000000 00000000, %f14 = 00ff0000 ff0000ff
	fdtox	%f20,%f14		! %f14 = 00000000 00000000
!	Mem[0000000021800000] = ffffb05a, %l6 = 00000000ff000000
	ldstuba	[%o3+0x000]%asi,%l6	! %l6 = 000000ff000000ff
!	%f2  = 00000000 ff000000, %l5 = 00000000ff000000
!	Mem[0000000030081428] = 62b0a630a15a0000
	add	%i2,0x028,%g1
	stda	%f2,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030081428] = 62b0a630a15a0000
!	Mem[00000000100c1408] = 00000000, %l5 = 00000000ff000000
	swapa	[%i3+%o4]0x80,%l5	! %l5 = 0000000000000000
!	%l4 = 000000000000ff0a, Mem[00000000100c1400] = ff660000
	stba	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = ff66000a
!	Starting 10 instruction Load Burst
!	Mem[000000001014143c] = ffa53eff, %l0 = 0000000000000000
	ldsw	[%i5+0x03c],%l0		! %l0 = ffffffffffa53eff

p0_label_407:
!	Mem[00000000211c0000] = fffffcae, %l3 = 00000000000000ff
	lduha	[%o2+0x000]%asi,%l3	! %l3 = 000000000000ffff
!	Mem[000000001014142c] = 000000ff, %f23 = 00000000
	ld	[%i5+0x02c],%f23	! %f23 = 000000ff
!	Mem[00000000100c1410] = ff000000, %l5 = 0000000000000000
	lduwa	[%i3+%o5]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[000000001014143c] = ffa53eff, %l0 = ffffffffffa53eff
	lduw	[%i5+0x03c],%l0		! %l0 = 00000000ffa53eff
!	Mem[0000000030001408] = d0d02310, %l7 = 0000000000000000
	ldsha	[%i0+%o4]0x89,%l7	! %l7 = 0000000000002310
!	Mem[0000000010101404] = 00000000, %l7 = 0000000000002310
	lduba	[%i4+0x004]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141408] = 26000000000000ff, %l1 = 00000000000000ff
	ldxa	[%i5+0x008]%asi,%l1	! %l1 = 26000000000000ff
!	Mem[0000000030041408] = 000000ff, %l4 = 000000000000ff0a
	ldsha	[%i1+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141400] = 000000ff, %l7 = 0000000000000000
	lduba	[%i5+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = ff000000, %l1 = 26000000000000ff
	swapa	[%i2+%g0]0x81,%l1	! %l1 = 00000000ff000000

p0_label_408:
!	Mem[0000000010041430] = 00000000ff000000, %l1 = 00000000ff000000, %l6 = 00000000000000ff
	add	%i1,0x30,%g1
	casxa	[%g1]0x80,%l1,%l6	! %l6 = 00000000ff000000
!	%l5 = 00000000ff000000, Mem[0000000010101420] = 4410000000000000
	stx	%l5,[%i4+0x020]		! Mem[0000000010101420] = 00000000ff000000
!	Mem[00000000211c0000] = fffffcae, %l1 = 00000000ff000000
	ldstuba	[%o2+0x000]%asi,%l1	! %l1 = 000000ff000000ff
!	%l0 = 00000000ffa53eff, Mem[0000000010001410] = 000000ff
	stha	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 00003eff
!	%l5 = 00000000ff000000, Mem[0000000010181408] = 000000ff
	stba	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	Mem[0000000030101400] = 00ffffff, %l6 = 00000000ff000000
	ldstuba	[%i4+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	%l4 = 000000ff, %l5 = ff000000, Mem[0000000010081410] = 1023d0d0 e0776e03
	stda	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff ff000000
	membar	#Sync			! Added by membar checker (78)
!	%l2 = 00000000ff000000, Mem[0000000010041410] = 00000000
	stwa	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = ff000000
!	%l4 = 00000000000000ff, Mem[0000000010141406] = 00000000
	sth	%l4,[%i5+0x006]		! Mem[0000000010141404] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 000000ff, %l4 = 00000000000000ff
	lduba	[%i2+%o5]0x88,%l4	! %l4 = 00000000000000ff

p0_label_409:
!	Mem[0000000010101410] = 000000000000ff0a, %l1 = 00000000000000ff
	ldxa	[%i4+%o5]0x88,%l1	! %l1 = 000000000000ff0a
!	Mem[0000000010141400] = ff000000, %l4 = 00000000000000ff
	ldswa	[%i5+%g0]0x80,%l4	! %l4 = ffffffffff000000
!	Mem[0000000010041410] = 000000ffe7b4a6bd, %l4 = ffffffffff000000
	ldxa	[%i1+%o5]0x80,%l4	! %l4 = 000000ffe7b4a6bd
!	%l7 = 00000000000000ff, immed = fffff5c0, %y  = 00000000
	udiv	%l7,-0xa40,%l5		! %l5 = 0000000000000000
	mov	%l0,%y			! %y = ffa53eff
!	Mem[0000000030081400] = ff000000, %f22 = ff0066ff
	lda	[%i2+%g0]0x89,%f22	! %f22 = ff000000
!	Mem[00000000300c1410] = ff000000 a15a0000, %l4 = e7b4a6bd, %l5 = 00000000
	ldda	[%i3+%o5]0x81,%l4	! %l4 = 00000000ff000000 00000000a15a0000
!	Mem[0000000010081400] = ffff00ff, %l0 = 00000000ffa53eff
	lduha	[%i2+%g0]0x80,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010181410] = 00000000, %l0 = 000000000000ffff
	ldsba	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[000000001010140c] = ffffffff, %l0 = 0000000000000000
	ldsh	[%i4+0x00c],%l0		! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 00000000, %l3 = 000000000000ffff
	swapa	[%i5+%g0]0x81,%l3	! %l3 = 0000000000000000

p0_label_410:
!	Mem[0000000010101400] = 0000000000000000, %l5 = 00000000a15a0000, %l7 = 00000000000000ff
	casxa	[%i4]0x80,%l5,%l7	! %l7 = 0000000000000000
!	%l4 = 00000000ff000000, Mem[0000000010101415] = 00000000
	stb	%l4,[%i4+0x015]		! Mem[0000000010101414] = 00000000
!	Mem[0000000030001410] = 00000000, %l4 = 00000000ff000000
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%f4  = 00000000, Mem[0000000030001400] = 265aff0a
	sta	%f4 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	Mem[0000000030001410] = 000000ff, %l7 = 0000000000000000
	swapa	[%i0+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	%f4  = 00000000, Mem[0000000010081418] = 00000000
	st	%f4 ,[%i2+0x018]	! Mem[0000000010081418] = 00000000
!	Mem[0000000010001408] = 000000ff, %l0 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[00000000100c1400] = 0a0066ff, %l2 = 00000000ff000000
	swapa	[%i3+%g0]0x80,%l2	! %l2 = 000000000a0066ff
!	%f14 = 00000000 00000000, Mem[0000000010141408] = 00000026 ff000000
	stda	%f14,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001438] = ff0000ffff000000, %f20 = 00000000 00000000
	ldda	[%i0+0x038]%asi,%f20	! %f20 = ff0000ff ff000000

p0_label_411:
!	Mem[0000000010141408] = 00000000, %f13 = ff000000
	lda	[%i5+%o4]0x80,%f13	! %f13 = 00000000
!	Mem[0000000010181400] = ff6600ff, %l5 = 00000000a15a0000
	ldsba	[%i6+%g0]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010001410] = 00003eff, %l3 = 0000000000000000
	ldsha	[%i0+%o5]0x88,%l3	! %l3 = 0000000000003eff
!	Mem[0000000010181400] = ff6600ff, %l6 = 0000000000000000
	lduba	[%i6+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[000000001008143c] = 00000000, %l0 = 00000000000000ff
	lduw	[%i2+0x03c],%l0		! %l0 = 0000000000000000
!	Mem[0000000030001400] = 0000000000000000, %l2 = 000000000a0066ff
	ldxa	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l5 = ffffffffffffffff
	lduba	[%i6+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001410] = 00000000, %l6 = 00000000000000ff
	lduba	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %l6 = 0000000000000000
	ldswa	[%i4+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = ff6600ff, %l2 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l2	! %l2 = 00000000ff6600ff

p0_label_412:
!	%l0 = 0000000000000000, Mem[0000000010001400] = 0000009c
	stha	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	Mem[0000000030141408] = d0d00000, %l7 = 00000000000000ff
	ldstuba	[%i5+%o4]0x81,%l7	! %l7 = 000000d0000000ff
!	Mem[0000000030041408] = 000000ff, %l7 = 00000000000000d0
	swapa	[%i1+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%f16 = ff000000 00000000 ff000000 ff3ea5ff
!	%f20 = ff0000ff ff000000 ff000000 000000ff
!	%f24 = 80000000 00000000 5a007396 20f1f32e
!	%f28 = ff000000 ff000000 00000000 1023d0d0
	stda	%f16,[%i4]ASI_BLK_PL	! Block Store to 0000000010101400
!	%l4 = 0000000000000000, Mem[00000000300c1410] = 000000ff
	stha	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	Mem[0000000030181410] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i6+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181438] = 00000000, %l6 = 0000000000000000
	swap	[%i6+0x038],%l6		! %l6 = 0000000000000000
!	Mem[0000000030041408] = 000000d0, %l4 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l4	! %l4 = 000000d0000000ff
!	Mem[0000000010141431] = ff0000ff, %l4 = 00000000000000d0
	ldstub	[%i5+0x031],%l4		! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = d0d02310, %f15 = 00000000
	lda	[%i0+%o4]0x89,%f15	! %f15 = d0d02310

p0_label_413:
!	Mem[00000000100c1408] = 000000ff, %l4 = 0000000000000000
	lduba	[%i3+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1410] = 00000000, %l4 = 00000000000000ff
	ldsba	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001408] = d0d02310, %l0 = 0000000000000000
	lduwa	[%i0+%o4]0x89,%l0	! %l0 = 00000000d0d02310
!	%f4  = 00000000, %f15 = d0d02310
	fsqrts	%f4 ,%f15		! %f15 = 00000000
!	Mem[0000000030141410] = ff000000, %l2 = 00000000ff6600ff
	ldsba	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000
!	%f0  = 5a007396 00000000, Mem[00000000100c1408] = 000000ff 00000000
	stda	%f0 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 5a007396 00000000
!	Mem[0000000010081400] = ffff00ff1023d0d0, %f4  = 00000000 e7b4a6bd
	ldd	[%i2+%g0],%f4 		! %f4  = ffff00ff 1023d0d0
!	Mem[0000000010141408] = 00000000, %l6 = 0000000000000000
	lduwa	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l5 = 0000000000000000
	ldsba	[%i0+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (79)
!	Mem[0000000010101430] = 000000ff, %l1 = 000000000000ff0a, %asi = 80
	swapa	[%i4+0x030]%asi,%l1	! %l1 = 00000000000000ff

p0_label_414:
!	%f28 = ff000000 ff000000, Mem[0000000010001400] = 00000000 000000ff
	stda	%f28,[%i0+0x000]%asi	! Mem[0000000010001400] = ff000000 ff000000
!	%l2 = 0000000000000000, Mem[0000000010041400] = 5a007396
	sth	%l2,[%i1+%g0]		! Mem[0000000010041400] = 00007396
!	Mem[0000000030101410] = 000000ff, %l5 = 0000000000000000
	swapa	[%i4+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000010141400] = ff000000000000ff
	stxa	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000000000000000
!	%l5 = 00000000000000ff, Mem[0000000030181400] = 000000ff
	stha	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = 00ff00ff
!	Mem[00000000300c1408] = 00000000, %l2 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l4 = 0000000000000000
	swapa	[%i1+%o4]0x80,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, Mem[00000000300c1400] = 00000000
	stwa	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	%l0 = 00000000d0d02310, Mem[0000000030041408] = 000000ff
	stwa	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = d0d02310
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 0000000000000000, %l2 = 0000000000000000
	ldxa	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000000

p0_label_415:
!	Mem[0000000030141408] = 00000000 0000d0ff, %l2 = 00000000, %l3 = 00003eff
	ldda	[%i5+%o4]0x89,%l2	! %l2 = 000000000000d0ff 0000000000000000
!	Mem[0000000021800000] = ffffb05a, %l5 = 00000000000000ff
	ldsh	[%o3+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010101410] = ff000000, %l1 = 00000000000000ff
	lduwa	[%i4+%o5]0x88,%l1	! %l1 = 00000000ff000000
!	Mem[00000000100c1404] = 00000000, %l0 = 00000000d0d02310
	lduwa	[%i3+0x004]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = 00000000 00000000, %l0 = 00000000, %l1 = ff000000
	ldda	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010001400] = ff000000, %l1 = 0000000000000000
	ldsw	[%i0+%g0],%l1		! %l1 = ffffffffff000000
!	Mem[0000000030101410] = 00000000, %f26 = 5a007396
	lda	[%i4+%o5]0x89,%f26	! %f26 = 00000000
!	Mem[0000000030041408] = 1023d0d0 ff3ea5ff, %l4 = 00000000, %l5 = ffffffff
	ldda	[%i1+%o4]0x81,%l4	! %l4 = 000000001023d0d0 00000000ff3ea5ff
!	%l2 = 000000000000d0ff, immed = fffffafc, %y  = ffa53eff
	umul	%l2,-0x504,%l5		! %l5 = 0000d0fefbe7c104, %y = 0000d0fe
!	Starting 10 instruction Store Burst
!	%f2  = 00000000, %f1  = 00000000, %f24 = 80000000
	fdivs	%f2 ,%f1 ,%f24		! %f24 = 7fffffff

p0_label_416:
!	%f2  = 00000000, Mem[0000000010101400] = 00000000
	sta	%f2 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	Mem[0000000010101400] = 00000000, %l5 = 0000d0fefbe7c104, %asi = 80
	swapa	[%i4+0x000]%asi,%l5	! %l5 = 0000000000000000
!	%l2 = 000000000000d0ff, Mem[000000001014143c] = ffa53eff, %asi = 80
	stha	%l2,[%i5+0x03c]%asi	! Mem[000000001014143c] = d0ff3eff
!	Mem[0000000010041410] = 000000ff, %l3 = 0000000000000000
	ldstuba	[%i1+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081400] = ffff00ff, %l5 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010001408] = 000000ff, %l2 = 000000000000d0ff
	swapa	[%i0+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%f24 = 7fffffff 00000000, Mem[0000000010181408] = 00000000 00000000
	stda	%f24,[%i6+%o4]0x88	! Mem[0000000010181408] = 7fffffff 00000000
!	Mem[0000000020800000] = 00ffc3ca, %l5 = 00000000000000ff
	ldstuba	[%o1+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	%f6  = 00000000, Mem[0000000010181410] = 00000000
	sta	%f6 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[000000001010142c] = 9673005a, %l5 = 0000000000000000
	ldsw	[%i4+0x02c],%l5		! %l5 = ffffffff9673005a

p0_label_417:
!	Mem[0000000010181410] = 00000000 00000000, %l0 = 00000000, %l1 = ff000000
	ldda	[%i6+%o5]0x88,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010101408] = ffa53eff000000ff, %f4  = ffff00ff 1023d0d0
	ldda	[%i4+%o4]0x80,%f4 	! %f4  = ffa53eff 000000ff
!	Mem[00000000100c1418] = ff000000, %l1 = 0000000000000000
	ldsb	[%i3+0x01b],%l1		! %l1 = 0000000000000000
!	%l2 = 00000000000000ff, imm = 0000000000000669, %l0 = 0000000000000000
	addc	%l2,0x669,%l0		! %l0 = 0000000000000768
!	%l3 = 0000000000000000, immed = fffff86a, %y  = 0000d0fe
	umul	%l3,-0x796,%l1		! %l1 = 0000000000000000, %y = 00000000
!	%l1 = 0000000000000000, immd = 0000000000000151, %l5 = ffffffff9673005a
	sdivx	%l1,0x151,%l5		! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (80)
!	Mem[00000000300c1400] = 00000000 ff0000ff 00000000 ff000000
!	Mem[00000000300c1410] = 00000000 a15a0000 000000a1 5a007396
!	Mem[00000000300c1420] = 8b6516ff 5200ffff 2ef3f120 00005aa1
!	Mem[00000000300c1430] = ff000000 000000ff 0affffae f50000ff
	ldda	[%i3]ASI_BLK_AIUSL,%f0	! Block Load from 00000000300c1400
!	Mem[0000000030101408] = 00000000, %f18 = ff000000
	lda	[%i4+%o4]0x81,%f18	! %f18 = 00000000
!	Mem[0000000030001408] = 1023d0d0, %l2 = 00000000000000ff
	lduha	[%i0+%o4]0x81,%l2	! %l2 = 0000000000001023
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030001400] = 00000000
	stha	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000

p0_label_418:
	membar	#Sync			! Added by membar checker (81)
!	%f16 = ff000000 00000000, %l3 = 0000000000000000
!	Mem[00000000300c1400] = 00000000ff0000ff
	stda	%f16,[%i3+%l3]ASI_PST32_S ! Mem[00000000300c1400] = 00000000ff0000ff
!	%f6  = 9673005a, %f24 = 7fffffff, %f2  = 000000ff 00000000
	fsmuld	%f6 ,%f24,%f2 		! %f2  = 7fffffff e0000000
!	%l4 = 000000001023d0d0, Mem[0000000030141400] = 0000ffff
	stha	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = d0d0ffff
!	%l1 = 0000000000000000, Mem[0000000010041408] = 00000000
	stwa	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	%l2 = 00001023, %l3 = 00000000, Mem[00000000100c1400] = ff000000 00000000
	stda	%l2,[%i3+0x000]%asi	! Mem[00000000100c1400] = 00001023 00000000
!	%f26 = 00000000 20f1f32e, Mem[00000000100c1410] = ff000000 000000ff
	stda	%f26,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000 20f1f32e
!	Mem[0000000010181410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000030101408] = 0000000000000000
	stxa	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000000
!	%f27 = 20f1f32e, Mem[0000000030001408] = d0d02310
	sta	%f27,[%i0+%o4]0x89	! Mem[0000000030001408] = 20f1f32e
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000, %l2 = 0000000000001023
	ldsha	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000000

p0_label_419:
!	Mem[0000000030141400] = 00000000ffffd0d0, %f4  = 00005aa1 00000000
	ldda	[%i5+%g0]0x89,%f4 	! %f4  = 00000000 ffffd0d0
!	Mem[0000000010101408] = ffa53eff, %l7 = 00000000000000ff
	lduha	[%i4+%o4]0x80,%l7	! %l7 = 000000000000ffa5
!	Mem[0000000010181408] = 00000000 ffffff7f, %l0 = 00000768, %l1 = 00000000
	ldd	[%i6+%o4],%l0		! %l0 = 0000000000000000 00000000ffffff7f
!	Mem[0000000010001410] = ff3e0000ff000000, %l3 = 0000000000000000
	ldxa	[%i0+%o5]0x80,%l3	! %l3 = ff3e0000ff000000
!	Mem[0000000010041408] = 00000000ff000000, %l0 = 0000000000000000
	ldxa	[%i1+0x008]%asi,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030101400] = ffffffff, %l5 = 0000000000000000
	ldswa	[%i4+%g0]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010181428] = 00000000, %l1 = 00000000ffffff7f
	ldub	[%i6+0x02a],%l1		! %l1 = 0000000000000000
!	Mem[0000000010001410] = ff3e0000, %l1 = 0000000000000000
	ldsha	[%i0+%o5]0x80,%l1	! %l1 = ffffffffffffff3e
!	%l6 = 0000000000000000, %l6 = 0000000000000000, %l7 = 000000000000ffa5
	sdivx	%l6,%l6,%l7		! Div by zero, %l0 = 00000000ff000050
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = 00008819, %l6 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 00000000000000ff

p0_label_420:
!	Mem[0000000010101408] = ffa53eff, %l4 = 000000001023d0d0
	swapa	[%i4+%o4]0x80,%l4	! %l4 = 00000000ffa53eff
!	%l6 = 00000000, %l7 = 0000ffa5, Mem[00000000100c1408] = 00000000 5a007396
	stda	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 0000ffa5
!	Mem[0000000010041410] = ff0000ff, %l1 = ffffffffffffff3e
	swapa	[%i1+%o5]0x80,%l1	! %l1 = 00000000ff0000ff
!	Mem[0000000010101439] = d0d02310, %l3 = ff3e0000ff000000
	ldstuba	[%i4+0x039]%asi,%l3	! %l3 = 000000d0000000ff
!	Mem[0000000030181410] = ff000000, %l6 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010101430] = 0000ff0a000000ff, %l0 = 00000000ff000028, %l4 = 00000000ffa53eff
	add	%i4,0x30,%g1
	casxa	[%g1]0x80,%l0,%l4	! %l4 = 0000ff0a000000ff
!	%l3 = 00000000000000d0, Mem[0000000030101408] = 00000000
	stba	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = d0000000
!	%f3  = e0000000, Mem[0000000030181408] = 00000000
	sta	%f3 ,[%i6+%o4]0x81	! Mem[0000000030181408] = e0000000
!	%f26 = 00000000 20f1f32e, %l7 = 000000000000ffa5
!	Mem[0000000030041400] = ffffffffffa53eff
	stda	%f26,[%i1+%l7]ASI_PST8_S ! Mem[0000000030041400] = 00ff00fffff13e2e
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ff000000ff000000, %l7 = 000000000000ffa5
	ldxa	[%i5+%o5]0x89,%l7	! %l7 = ff000000ff000000

p0_label_421:
!	Mem[0000000010001400] = ff000000, %l0 = 00000000ff000028
	ldsb	[%i0+0x001],%l0		! %l0 = 0000000000000000
!	Mem[0000000010001410] = ff3e0000, %l0 = 0000000000000000
	ldswa	[%i0+%o5]0x80,%l0	! %l0 = ffffffffff3e0000
!	Mem[0000000010141408] = 00000000, %l2 = 0000000000000000
	ldsw	[%i5+%o4],%l2		! %l2 = 0000000000000000
!	Mem[0000000010101400] = 04c1e7fb, %l3 = 00000000000000d0
	lduha	[%i4+%g0]0x88,%l3	! %l3 = 000000000000e7fb
!	Mem[0000000030101410] = 00000000, %l5 = ffffffffffffffff
	lduwa	[%i4+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001410] = ff3e0000, %l0 = ffffffffff3e0000
	lduba	[%i0+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1400] = 23100000, %f3  = e0000000
	lda	[%i3+%g0]0x88,%f3 	! %f3 = 23100000
!	Mem[0000000010141430] = ffff00ff, %l0 = 00000000000000ff
	lduha	[%i5+0x030]%asi,%l0	! %l0 = 000000000000ffff
!	Mem[0000000020800040] = 00ffbf87, %l0 = 000000000000ffff
	lduha	[%o1+0x040]%asi,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f16 = ff000000 00000000, Mem[0000000030041408] = d0d02310 ffa53eff
	stda	%f16,[%i1+%o4]0x89	! Mem[0000000030041408] = ff000000 00000000

p0_label_422:
!	Mem[00000000201c0000] = 00ff8819, %l6 = 00000000000000ff
	ldstuba	[%o0+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	%l7 = ff000000ff000000, Mem[0000000010001428] = 00000000000000ff
	stx	%l7,[%i0+0x028]		! Mem[0000000010001428] = ff000000ff000000
!	%l7 = ff000000ff000000, Mem[000000001010143a] = d0ff2310
	sth	%l7,[%i4+0x03a]		! Mem[0000000010101438] = d0ff0000
!	%l5 = 0000000000000000, Mem[0000000010101410] = ff0000ffff000000
	stxa	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000010081438] = 00005aff00000000, %asi = 80
	stxa	%l6,[%i2+0x038]%asi	! Mem[0000000010081438] = 0000000000000000
!	Mem[00000000218000c1] = 0000dddc, %l0 = 00000000000000ff
	ldstub	[%o3+0x0c1],%l0		! %l0 = 00000000000000ff
!	Code Fragment 4
p0_fragment_49:
!	%l0 = 0000000000000000
	setx	0x648f299006c4d0e8,%g7,%l0 ! %l0 = 648f299006c4d0e8
!	%l1 = 00000000ff0000ff
	setx	0x7a3dff306a78cc2b,%g7,%l1 ! %l1 = 7a3dff306a78cc2b
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 648f299006c4d0e8
	setx	0xce3d62ffbb8344a6,%g7,%l0 ! %l0 = ce3d62ffbb8344a6
!	%l1 = 7a3dff306a78cc2b
	setx	0x983ec71847409698,%g7,%l1 ! %l1 = 983ec71847409698
!	%l3 = 000000000000e7fb, Mem[0000000030001408] = 0000000020f1f32e
	stxa	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000000000e7fb
!	Starting 10 instruction Load Burst
!	Mem[00000000218001c0] = f9d8186d, %l4 = 0000ff0a000000ff
	ldub	[%o3+0x1c0],%l4		! %l4 = 00000000000000f9

p0_label_423:
!	%l3 = 000000000000e7fb, imm = 0000000000000645, %l7 = ff000000ff000000
	andn	%l3,0x645,%l7		! %l7 = 000000000000e1ba
!	Mem[0000000010141408] = 0000000000000000, %l1 = 983ec71847409698
	ldxa	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l2 = 0000000000000000
	ldsba	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l1 = 0000000000000000
	ldsha	[%i1+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101420] = 00000000, %l2 = 0000000000000000
	ldsh	[%i4+0x020],%l2		! %l2 = 0000000000000000
!	Mem[0000000010041420] = ff00ffff ffff00ff, %l6 = 00000000, %l7 = 0000e1ba
	ldd	[%i1+0x020],%l6		! %l6 = 00000000ff00ffff 00000000ffff00ff
!	Mem[0000000010181408] = ff000000, %l2 = 0000000000000000
	lduwa	[%i6+%o4]0x80,%l2	! %l2 = 00000000ff000000
!	Mem[00000000300c1408] = 00000000, %f1  = 00000000
	lda	[%i3+%o4]0x89,%f1 	! %f1 = 00000000
!	Mem[0000000010181408] = 7fffffff000000ff, %f0  = ff0000ff 00000000
	ldda	[%i6+%o4]0x88,%f0 	! %f0  = 7fffffff 000000ff
!	Starting 10 instruction Store Burst
!	%f16 = ff000000 00000000 00000000 ff3ea5ff
!	%f20 = ff0000ff ff000000 ff000000 000000ff
!	%f24 = 7fffffff 00000000 00000000 20f1f32e
!	%f28 = ff000000 ff000000 00000000 1023d0d0
	stda	%f16,[%i1]ASI_COMMIT_S	! Block Store to 0000000030041400

p0_label_424:
!	Mem[0000000030141400] = d0d0ffff, %l3 = 000000000000e7fb
	swapa	[%i5+%g0]0x81,%l3	! %l3 = 00000000d0d0ffff
!	Code Fragment 3
p0_fragment_50:
!	%l0 = ce3d62ffbb8344a6
	setx	0xb070059fd34266f1,%g7,%l0 ! %l0 = b070059fd34266f1
!	%l1 = 0000000000000000
	setx	0xd3071147e90d040b,%g7,%l1 ! %l1 = d3071147e90d040b
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b070059fd34266f1
	setx	0xd59a7bafcac9fbbe,%g7,%l0 ! %l0 = d59a7bafcac9fbbe
!	%l1 = d3071147e90d040b
	setx	0x1a3cd8a78efad4bf,%g7,%l1 ! %l1 = 1a3cd8a78efad4bf
!	Mem[0000000010101410] = 00000000, %l3 = 00000000d0d0ffff
	ldsba	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%f6  = 9673005a a1000000, %l7 = 00000000ffff00ff
!	Mem[0000000030141410] = 000000ff000000ff
	add	%i5,0x010,%g1
	stda	%f6,[%g1+%l7]ASI_PST16_S ! Mem[0000000030141410] = 9673005aa1000000
!	%f10 = a15a0000 20f1f32e, Mem[0000000030141410] = 9673005a a1000000
	stda	%f10,[%i5+%o5]0x81	! Mem[0000000030141410] = a15a0000 20f1f32e
!	Mem[0000000030081400] = ff000000, %l1 = 1a3cd8a78efad4bf
	swapa	[%i2+%g0]0x89,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010081424] = 00003eff, %l5 = 0000000000000000, %asi = 80
	swapa	[%i2+0x024]%asi,%l5	! %l5 = 0000000000003eff
!	%l7 = 00000000ffff00ff, Mem[0000000030141410] = 00005aa1
	stha	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000ff
!	%l3 = 0000000000000000, Mem[0000000010141408] = 00000000
	stba	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (82)
!	Mem[0000000030041410] = ff0000ff, %l5 = 0000000000003eff
	lduba	[%i1+%o5]0x89,%l5	! %l5 = 00000000000000ff

p0_label_425:
!	Mem[0000000010001400] = ff000000, %l0 = d59a7bafcac9fbbe
	lduwa	[%i0+%g0]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030001408] = 0000e7fb, %l7 = 00000000ffff00ff
	lduba	[%i0+%o4]0x89,%l7	! %l7 = 00000000000000fb
!	Mem[00000000300c1408] = 00000000, %f10 = a15a0000
	lda	[%i3+%o4]0x81,%f10	! %f10 = 00000000
!	Mem[00000000201c0000] = ffff8819, %l6 = 00000000ff00ffff
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030001410] = 00000000, %l6 = 000000000000ffff
	ldsha	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = fbe7c104, %l2 = 00000000ff000000
	lduha	[%i4+%g0]0x80,%l2	! %l2 = 000000000000fbe7
!	Mem[00000000300c1400] = 00000000, %l2 = 000000000000fbe7
	ldswa	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = ffffffff 00000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i5+%o5]0x80,%l2	! %l2 = 00000000ffffffff 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l5 = 00000000000000ff
	lduha	[%i3+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 00000000, %l2 = 00000000ffffffff
	ldstuba	[%i3+%g0]0x89,%l2	! %l2 = 00000000000000ff

p0_label_426:
!	%l6 = 0000000000000000, Mem[00000000201c0000] = ffff8819, %asi = 80
	stha	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00008819
!	%l1 = 00000000ff000000, imm = 000000000000035f, %l4 = 00000000000000f9
	xor	%l1,0x35f,%l4		! %l4 = 00000000ff00035f
!	Mem[0000000010181428] = 00000000, %l1 = ff000000, %l5 = 00000000
	add	%i6,0x28,%g1
	casa	[%g1]0x80,%l1,%l5	! %l5 = 0000000000000000
!	%f8  = ffff0052 ff16658b, Mem[0000000010081438] = 00000000 00000000
	stda	%f8 ,[%i2+0x038]%asi	! Mem[0000000010081438] = ffff0052 ff16658b
!	%f30 = 00000000 1023d0d0, Mem[00000000300c1400] = 000000ff ff0000ff
	stda	%f30,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 1023d0d0
!	%l4 = 00000000ff00035f, Mem[0000000010041410] = ffffff3e, %asi = 80
	stha	%l4,[%i1+0x010]%asi	! Mem[0000000010041410] = 035fff3e
!	%l3 = 0000000000000000, Mem[0000000010001408] = ffd00000, %asi = 80
	stwa	%l3,[%i0+0x008]%asi	! Mem[0000000010001408] = 00000000
!	%f20 = ff0000ff ff000000, Mem[0000000010001400] = ff000000 ff000000
	stda	%f20,[%i0+%g0]0x80	! Mem[0000000010001400] = ff0000ff ff000000
!	Mem[00000000100c141c] = 000000ff, %l4 = ff00035f, %l3 = 00000000
	add	%i3,0x1c,%g1
	casa	[%g1]0x80,%l4,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff000000, %f15 = aeffff0a
	ld	[%i6+%o5],%f15	! %f15 = ff000000

p0_label_427:
!	Mem[0000000010141408] = 0000000000000000, %f12 = ff000000 000000ff
	ldda	[%i5+%o4]0x80,%f12	! %f12 = 00000000 00000000
!	Mem[0000000030141408] = 0000d0ff, %l1 = 00000000ff000000
	ldsha	[%i5+%o4]0x89,%l1	! %l1 = ffffffffffffd0ff
!	Code Fragment 4
p0_fragment_51:
!	%l0 = 00000000ff000000
	setx	0xd4bfc1884e973c4e,%g7,%l0 ! %l0 = d4bfc1884e973c4e
!	%l1 = ffffffffffffd0ff
	setx	0xf25f9877e01abf40,%g7,%l1 ! %l1 = f25f9877e01abf40
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = d4bfc1884e973c4e
	setx	0x4549e1e0167f69fa,%g7,%l0 ! %l0 = 4549e1e0167f69fa
!	%l1 = f25f9877e01abf40
	setx	0xf590443fa619ee22,%g7,%l1 ! %l1 = f590443fa619ee22
!	%f10 = 00000000, %f6  = 9673005a a1000000
	fstox	%f10,%f6 		! %f6  = 00000000 00000000
!	Mem[0000000030081400] = bfd4fa8e 000000ff, %l0 = 167f69fa, %l1 = a619ee22
	ldda	[%i2+%g0]0x81,%l0	! %l0 = 00000000bfd4fa8e 00000000000000ff
!	Mem[00000000300c1400] = d0d02310, %f11 = 20f1f32e
	lda	[%i3+%g0]0x81,%f11	! %f11 = d0d02310
!	Mem[0000000010081410] = ff000000000000ff, %f30 = 00000000 1023d0d0
	ldda	[%i2+%o5]0x80,%f30	! %f30 = ff000000 000000ff
!	Mem[0000000010041408] = 00000000, %l4 = 00000000ff00035f
	lduha	[%i1+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = ff000000ffffff7f, %l2 = 0000000000000000
	ldx	[%i6+%o4],%l2		! %l2 = ff000000ffffff7f
!	Starting 10 instruction Store Burst
!	Mem[0000000020800001] = ffffc3ca, %l4 = 0000000000000000
	ldstub	[%o1+0x001],%l4		! %l4 = 000000ff000000ff

p0_label_428:
!	%l6 = 00000000, %l7 = 000000fb, Mem[0000000030141410] = ff000000 20f1f32e
	stda	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 000000fb
!	%f28 = ff000000 ff000000, Mem[0000000010081408] = ff000000 00000000
	stda	%f28,[%i2+%o4]0x80	! Mem[0000000010081408] = ff000000 ff000000
!	%f16 = ff000000 00000000 00000000 ff3ea5ff
!	%f20 = ff0000ff ff000000 ff000000 000000ff
!	%f24 = 7fffffff 00000000 00000000 20f1f32e
!	%f28 = ff000000 ff000000 ff000000 000000ff
	stda	%f16,[%i1]ASI_BLK_AIUP	! Block Store to 0000000010041400
!	Mem[0000000010181423] = 00ff00ff, %l6 = 0000000000000000
	ldstub	[%i6+0x023],%l6		! %l6 = 000000ff000000ff
!	%l2 = ff000000ffffff7f, Mem[0000000021800140] = ff003eed
	stb	%l2,[%o3+0x140]		! Mem[0000000021800140] = 7f003eed
!	Mem[00000000100c1404] = 00000000, %l1 = 00000000000000ff, %asi = 80
	swapa	[%i3+0x004]%asi,%l1	! %l1 = 0000000000000000
!	%l7 = 00000000000000fb, Mem[0000000010101410] = 0000000000000000
	stxa	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000000000fb
!	%l7 = 00000000000000fb, Mem[00000000100c1410] = 0000000020f1f32e, %asi = 80
	stxa	%l7,[%i3+0x010]%asi	! Mem[00000000100c1410] = 00000000000000fb
!	%l6 = 000000ff, %l7 = 000000fb, Mem[0000000010001438] = ff0000ff ff000000
	std	%l6,[%i0+0x038]		! Mem[0000000010001438] = 000000ff 000000fb
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 000000ff, %l1 = 0000000000000000
	ldsba	[%i2+%o4]0x89,%l1	! %l1 = ffffffffffffffff

p0_label_429:
!	Mem[0000000010001408] = 00000000, %f10 = 00000000
	lda	[%i0+%o4]0x80,%f10	! %f10 = 00000000
!	%l4 = 00000000000000ff, imm = 000000000000006c, %l2 = ff000000ffffff7f
	or	%l4,0x06c,%l2		! %l2 = 00000000000000ff
!	Mem[00000000300c1408] = 000000ff00000000, %l3 = 00000000000000ff
	ldxa	[%i3+%o4]0x89,%l3	! %l3 = 000000ff00000000
!	Mem[0000000030001400] = 00000000, %l0 = 00000000bfd4fa8e
	ldsha	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l0 = 0000000000000000
	lduba	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l6 = 00000000000000ff
	ldswa	[%i5+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %f2  = 7fffffff
	lda	[%i3+%o5]0x80,%f2 	! %f2 = 00000000
!	Mem[0000000010001410] = ff3e0000ff000000, %l7 = 00000000000000fb
	ldxa	[%i0+%o5]0x80,%l7	! %l7 = ff3e0000ff000000
!	Mem[0000000010001420] = fff3f100, %l0 = 0000000000000000
	ldsw	[%i0+0x020],%l0		! %l0 = fffffffffff3f100
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[00000000100c1400] = 23100000
	stba	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 231000ff

p0_label_430:
!	Mem[00000000218001c0] = f9d8186d, %l4 = 00000000000000ff
	ldstub	[%o3+0x1c0],%l4		! %l4 = 000000f9000000ff
!	Mem[00000000100c142d] = 0000ffff, %l7 = ff3e0000ff000000
	ldstuba	[%i3+0x02d]%asi,%l7	! %l7 = 00000000000000ff
!	%l0 = fffffffffff3f100, Mem[0000000030181400] = 00ff00ff
	stwa	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = fff3f100
!	%l2 = 00000000000000ff, Mem[0000000010101414] = 00000000, %asi = 80
	stha	%l2,[%i4+0x014]%asi	! Mem[0000000010101414] = 00ff0000
!	Mem[0000000010081428] = ff000000, %l6 = 00000000, %l4 = 000000f9
	add	%i2,0x28,%g1
	casa	[%g1]0x80,%l6,%l4	! %l4 = 00000000ff000000
!	%l0 = fffffffffff3f100, Mem[0000000030001410] = 00000000
	stba	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	%l7 = 0000000000000000, Mem[0000000010001400] = 000000ffff0000ff
	stxa	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000000
!	Mem[0000000010081400] = ff00ffff, %l0 = fffffffffff3f100
	ldstuba	[%i2+%g0]0x88,%l0	! %l0 = 000000ff000000ff
!	%f10 = 00000000 d0d02310, %l0 = 00000000000000ff
!	Mem[0000000030081410] = ffa53eff00000000
	add	%i2,0x010,%g1
	stda	%f10,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030081410] = 1023d0d000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff000000, %l6 = 0000000000000000
	lduw	[%i2+%o5],%l6		! %l6 = 00000000ff000000

p0_label_431:
!	Mem[0000000030141410] = 00000000, %l3 = 000000ff00000000
	ldswa	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = 1023d0d0, %l4 = 00000000ff000000
	lduba	[%i3+%g0]0x89,%l4	! %l4 = 00000000000000d0
!	%f7  = 00000000, Mem[0000000010181400] = 00000000
	sta	%f7 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	%l0 = 00000000000000ff, imm = fffffffffffff4ff, %l4 = 00000000000000d0
	subc	%l0,-0xb01,%l4		! %l4 = 0000000000000c00
!	Mem[0000000010101408] = 1023d0d0000000ff, %f14 = ff0000f5 ff000000
	ldda	[%i4+%o4]0x80,%f14	! %f14 = 1023d0d0 000000ff
!	%l6 = 00000000ff000000, %l0 = 00000000000000ff, %l4 = 0000000000000c00
	subc	%l6,%l0,%l4		! %l4 = 00000000feffff01
!	Mem[0000000030101410] = 00000000, %f19 = ff3ea5ff
	lda	[%i4+%o5]0x81,%f19	! %f19 = 00000000
!	Mem[0000000010181400] = 00000000, %f17 = 00000000
	lda	[%i6+%g0]0x80,%f17	! %f17 = 00000000
!	Mem[0000000030181408] = e000000000000000, %f4  = 00000000 ffffd0d0
	ldda	[%i6+%o4]0x81,%f4 	! %f4  = e0000000 00000000
!	Starting 10 instruction Store Burst
!	%f22 = ff000000 000000ff, Mem[0000000010041428] = 00000000 20f1f32e
	stda	%f22,[%i1+0x028]%asi	! Mem[0000000010041428] = ff000000 000000ff

p0_label_432:
!	Mem[0000000010001400] = 00000000, %l5 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000000
!	%f0  = 7fffffff 000000ff 00000000 23100000
!	%f4  = e0000000 00000000 00000000 00000000
!	%f8  = ffff0052 ff16658b 00000000 d0d02310
!	%f12 = 00000000 00000000 1023d0d0 000000ff
	stda	%f0,[%i4]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	%f31 = 000000ff, Mem[00000000100c1400] = 231000ff
	sta	%f31,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff
!	Mem[0000000010181400] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i6+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%f26 = 00000000 20f1f32e, Mem[0000000010041400] = ff000000 00000000
	stda	%f26,[%i1+0x000]%asi	! Mem[0000000010041400] = 00000000 20f1f32e
!	Mem[0000000010181408] = 000000ff, %l0 = 00000000000000ff
	swapa	[%i6+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141434] = 0000fff9, %l7 = 0000000000000000, %asi = 80
	swapa	[%i5+0x034]%asi,%l7	! %l7 = 000000000000fff9
!	%f31 = 000000ff, Mem[0000000010001408] = 00000000
	sta	%f31,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff
!	%l0 = 00000000000000ff, Mem[0000000030101408] = d0000000
	stha	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 00ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000000, %l6 = 00000000ff000000
	lduba	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000000

p0_label_433:
!	Mem[0000000030101400] = ffffffff, %l4 = 00000000feffff01
	ldswa	[%i4+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	%l6 = 00000000, %l7 = 0000fff9, Mem[0000000010141410] = ffffffff 00000000
	stda	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000 0000fff9
!	Mem[0000000010001408] = 000000ff, %l0 = 00000000000000ff
	ldswa	[%i0+%o4]0x88,%l0	! %l0 = 00000000000000ff
	membar	#Sync			! Added by membar checker (83)
!	Mem[0000000010101408] = 00000000, %l6 = 0000000000000000
	lduha	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141400] = 00000000fbe70000, %f8  = ffff0052 ff16658b
	ldda	[%i5+%g0]0x89,%f8 	! %f8  = 00000000 fbe70000
!	Mem[0000000030101408] = 00ff0000 00000000, %l0 = 000000ff, %l1 = ffffffff
	ldda	[%i4+%o4]0x81,%l0	! %l0 = 0000000000ff0000 0000000000000000
!	Mem[0000000010141408] = 00000000 00000000, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010181408] = ff000000ffffff7f, %f10 = 00000000 d0d02310
	ldd	[%i6+%o4],%f10		! %f10 = ff000000 ffffff7f
!	%f12 = 00000000 00000000, %f10 = ff000000 ffffff7f
	fdtox	%f12,%f10		! %f10 = 00000000 00000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000010181400] = 000000ff
	stba	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000

p0_label_434:
!	Mem[00000000100c140c] = a5ff0000, %l3 = 0000000000000000, %asi = 80
	swapa	[%i3+0x00c]%asi,%l3	! %l3 = 00000000a5ff0000
!	%f6  = 00000000, Mem[0000000030181410] = ff000000
	sta	%f6 ,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	%l5 = 0000000000000000, Mem[0000000030101408] = 00ff000000000000
	stxa	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000000000000000
!	Mem[00000000211c0000] = fffffcae, %l6 = 0000000000000000
	ldstub	[%o2+%g0],%l6		! %l6 = 000000ff000000ff
!	%l0 = 00ff0000, %l1 = 00000000, Mem[00000000300c1400] = d0d02310 00000000
	stda	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00ff0000 00000000
!	%l3 = 00000000a5ff0000, Mem[0000000030101408] = 0000000000000000
	stxa	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000a5ff0000
!	Mem[0000000010041400] = 00000000, %l7 = 000000000000fff9
	ldstuba	[%i1+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[0000000010041414] = ff000000, %asi = 80
	stba	%l6,[%i1+0x014]%asi	! Mem[0000000010041414] = ff000000
!	%l0 = 0000000000ff0000, Mem[0000000010081421] = 44100000, %asi = 80
	stba	%l0,[%i2+0x021]%asi	! Mem[0000000010081420] = 44000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 1023d0d0, %l1 = 0000000000000000
	lduwa	[%i2+%o5]0x81,%l1	! %l1 = 000000001023d0d0

p0_label_435:
!	Mem[0000000010001400] = 00000000 00000000, %l4 = ffffffff, %l5 = 00000000
	ldda	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000000 0000000000000000
!	%l2 = 0000000000000000, imm = 0000000000000530, %l4 = 0000000000000000
	xnor	%l2,0x530,%l4		! %l4 = fffffffffffffacf
!	Mem[0000000010001410] = 00003eff, %l5 = 0000000000000000
	ldsba	[%i0+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010041410] = 000000ff ff0000ff, %l0 = 00ff0000, %l1 = 1023d0d0
	ldda	[%i1+%o5]0x88,%l0	! %l0 = 00000000ff0000ff 00000000000000ff
!	Mem[0000000030181410] = 00000000, %l0 = 00000000ff0000ff
	lduha	[%i6+%o5]0x89,%l0	! %l0 = 0000000000000000
!	%f5  = 00000000, %f15 = 000000ff, %f18 = 00000000 00000000
	fsmuld	%f5 ,%f15,%f18		! %f18 = 00000000 00000000
!	Mem[0000000010081408] = ff000000, %f0  = 7fffffff
	lda	[%i2+0x008]%asi,%f0 	! %f0 = ff000000
!	%f2  = 00000000, %f30 = ff000000
	fcmpes	%fcc2,%f2 ,%f30		! %fcc2 = 2
!	Mem[00000000300c1410] = 00000000, %f5  = 00000000
	lda	[%i3+%o5]0x89,%f5 	! %f5 = 00000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, %l1 = 00000000000000ff, %y  = 00000000
	smul	%l6,%l1,%l6		! %l6 = 000000000000fe01, %y = 00000000

p0_label_436:
!	%l6 = 000000000000fe01, Mem[0000000020800040] = 00ffbf87, %asi = 80
	stha	%l6,[%o1+0x040]%asi	! Mem[0000000020800040] = fe01bf87
!	Mem[00000000300c1400] = 0000ff00, %l4 = fffffffffffffacf
	swapa	[%i3+%g0]0x89,%l4	! %l4 = 000000000000ff00
!	%l4 = 0000ff00, %l5 = ffffffff, Mem[0000000030101410] = 00000000 000000ff
	stda	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000ff00 ffffffff
!	%f28 = ff000000, Mem[0000000030101408] = 00000000
	sta	%f28,[%i4+%o4]0x89	! Mem[0000000030101408] = ff000000
!	Mem[0000000030001408] = fbe70000, %l5 = ffffffffffffffff
	swapa	[%i0+%o4]0x81,%l5	! %l5 = 00000000fbe70000
!	%l3 = 00000000a5ff0000, Mem[0000000010181430] = 00000000, %asi = 80
	stha	%l3,[%i6+0x030]%asi	! Mem[0000000010181430] = 00000000
!	%l4 = 000000000000ff00, Mem[0000000030081400] = 8efad4bf
	stwa	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000ff00
!	%l3 = 00000000a5ff0000, Mem[0000000030001410] = 0000000000000000
	stxa	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000a5ff0000
!	%l7 = 0000000000000000, Mem[0000000010001410] = ff3e0000ff000000
	stxa	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff000000, %l4 = 000000000000ff00
	ldsba	[%i2+%o4]0x80,%l4	! %l4 = ffffffffffffffff

p0_label_437:
!	Mem[00000000100c1400] = ff000000, %l1 = 00000000000000ff
	ldsha	[%i3+%g0]0x80,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000010181408] = 7fffffff000000ff, %f0  = ff000000 000000ff
	ldda	[%i6+%o4]0x88,%f0 	! %f0  = 7fffffff 000000ff
!	Mem[00000000300c1410] = 00000000 a15a0000, %l0 = 00000000, %l1 = ffffff00
	ldda	[%i3+%o5]0x81,%l0	! %l0 = 0000000000000000 00000000a15a0000
!	%l1 = 00000000a15a0000, immed = fffff3a0, %y  = 00000000
	udiv	%l1,-0xc60,%l0		! %l0 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000030041400] = ff000000, %l2 = 0000000000000000
	ldswa	[%i1+%g0]0x81,%l2	! %l2 = ffffffffff000000
!	Mem[0000000030101400] = ffffffff, %l3 = 00000000a5ff0000
	lduba	[%i4+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1410] = 00000000, %f22 = ff000000
	lda	[%i3+%o5]0x89,%f22	! %f22 = 00000000
!	Mem[00000000300c1400] = fffffacf, %l5 = 00000000fbe70000
	lduwa	[%i3+%g0]0x89,%l5	! %l5 = 00000000fffffacf
!	Mem[0000000030001400] = 00000000 00000000, %l2 = ff000000, %l3 = 000000ff
	ldda	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000030101410] = 0000ff00
	stha	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000

p0_label_438:
!	Mem[00000000100c1408] = 00000000, %l0 = 0000000000000000
	ldstub	[%i3+%o4],%l0		! %l0 = 00000000000000ff
!	%f29 = ff000000, Mem[0000000030101408] = ff000000
	sta	%f29,[%i4+%o4]0x89	! Mem[0000000030101408] = ff000000
!	%f0  = 7fffffff 000000ff, %l6 = 000000000000fe01
!	Mem[0000000010141420] = 000000ff00000000
	add	%i5,0x020,%g1
	stda	%f0,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010141420] = ff0000ff00000000
!	Mem[0000000010141410] = 00000000, %l1 = 00000000a15a0000
	swapa	[%i5+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081400] = 0000ff00, %l1 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l1	! %l1 = 000000000000ff00
!	%l5 = 00000000fffffacf, Mem[0000000010001438] = 000000ff000000fb
	stx	%l5,[%i0+0x038]		! Mem[0000000010001438] = 00000000fffffacf
!	%f16 = ff000000 00000000, %l7 = 0000000000000000
!	Mem[0000000030101400] = ffffffff00000000
	stda	%f16,[%i4+%l7]ASI_PST32_SL ! Mem[0000000030101400] = ffffffff00000000
!	%f12 = 00000000, Mem[0000000030041410] = ff0000ff
	sta	%f12,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	%l0 = 00000000, %l1 = 0000ff00, Mem[0000000010181420] = 00ff00ff 000000ff
	std	%l0,[%i6+0x020]		! Mem[0000000010181420] = 00000000 0000ff00
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = fffffcae, %l0 = 0000000000000000
	lduh	[%o2+%g0],%l0		! %l0 = 000000000000ffff

p0_label_439:
!	Mem[0000000010181410] = 00000000000000ff, %f24 = 7fffffff 00000000
	ldda	[%i6+%o5]0x88,%f24	! %f24 = 00000000 000000ff
!	Mem[0000000010181408] = ff000000 ffffff7f, %l2 = 00000000, %l3 = 00000000
	ldda	[%i6+%o4]0x80,%l2	! %l2 = 00000000ff000000 00000000ffffff7f
!	Mem[0000000010041410] = ff0000ff, %l5 = 00000000fffffacf
	ldsha	[%i1+%o5]0x80,%l5	! %l5 = ffffffffffffff00
!	Mem[00000000100c1410] = 00000000, %l3 = 00000000ffffff7f
	ldsha	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000021800040] = ff9c7f92, %l5 = ffffffffffffff00
	ldsh	[%o3+0x040],%l5		! %l5 = ffffffffffffff9c
!	Mem[0000000010001400] = 00000000, %l2 = 00000000ff000000
	lduha	[%i0+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = 000000ff, %l7 = 0000000000000000
	lduwa	[%i0+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001430] = 000000ff, %f7  = 00000000
	ld	[%i0+0x030],%f7 	! %f7 = 000000ff
!	Mem[0000000010101418] = 00000000 00000000, %l4 = ffffffff, %l5 = ffffff9c
	ldd	[%i4+0x018],%l4		! %l4 = 0000000000000000 0000000000000000
!	Starting 10 instruction Store Burst
!	Code Fragment 3
p0_fragment_52:
!	%l0 = 000000000000ffff
	setx	0x72e5d9906318c553,%g7,%l0 ! %l0 = 72e5d9906318c553
!	%l1 = 000000000000ff00
	setx	0x6d771f1873597449,%g7,%l1 ! %l1 = 6d771f1873597449
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 72e5d9906318c553
	setx	0x9755507fa0e0e301,%g7,%l0 ! %l0 = 9755507fa0e0e301
!	%l1 = 6d771f1873597449
	setx	0xaccdb69f87eb2905,%g7,%l1 ! %l1 = accdb69f87eb2905

p0_label_440:
!	%l0 = 9755507fa0e0e301, Mem[0000000030081400] = 00000000
	stwa	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = a0e0e301
!	%l6 = 000000000000fe01, Mem[0000000010141410] = 0000fff900005aa1
	stxa	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000000000fe01
!	%l6 = 000000000000fe01, Mem[0000000030141400] = fbe70000
	stha	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = fbe7fe01
!	%f6  = 00000000 000000ff, %l4 = 0000000000000000
!	Mem[0000000030141408] = ffd0000000000000
	add	%i5,0x008,%g1
	stda	%f6,[%g1+%l4]ASI_PST8_S ! Mem[0000000030141408] = ffd0000000000000
!	%l5 = 0000000000000000, Mem[00000000100c1416] = 000000fb
	sth	%l5,[%i3+0x016]		! Mem[00000000100c1414] = 00000000
!	%l2 = 0000000000000000, Mem[0000000020800040] = fe01bf87
	sth	%l2,[%o1+0x040]		! Mem[0000000020800040] = 0000bf87
!	%l4 = 0000000000000000, Mem[00000000211c0000] = fffffcae, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0000fcae
!	Mem[0000000010041428] = ff000000000000ff, %l5 = 0000000000000000, %l0 = 9755507fa0e0e301
	add	%i1,0x28,%g1
	casxa	[%g1]0x80,%l5,%l0	! %l0 = ff000000000000ff
!	%f19 = 00000000, Mem[0000000010081410] = ff000000
	sta	%f19,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 01fe0000, %l7 = 00000000000000ff
	lduwa	[%i5+%o5]0x80,%l7	! %l7 = 0000000001fe0000

p0_label_441:
!	Mem[0000000030081408] = 000000ff, %f15 = 000000ff
	lda	[%i2+%o4]0x89,%f15	! %f15 = 000000ff
!	Mem[00000000300c1408] = 00000000, %l1 = accdb69f87eb2905
	lduba	[%i3+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181410] = ff00000000000000, %l3 = 0000000000000000
	ldxa	[%i6+%o5]0x80,%l3	! %l3 = ff00000000000000
!	Mem[0000000010141408] = 00000000 00000000, %l6 = 0000fe01, %l7 = 01fe0000
	ldda	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010001418] = ffff0000, %l0 = ff000000000000ff
	ldsb	[%i0+0x018],%l0		! %l0 = ffffffffffffffff
!	Mem[00000000100c1400] = ff000000, %l1 = 0000000000000000
	ldsha	[%i3+%g0]0x80,%l1	! %l1 = ffffffffffffff00
!	Mem[00000000300c1408] = 00000000, %l7 = 0000000000000000
	lduwa	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l1 = ffffffffffffff00
	lduha	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l3 = ff00000000000000
	lduba	[%i6+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[00000000201c0000] = 00008819
	stb	%l2,[%o0+%g0]		! Mem[00000000201c0000] = 00008819

p0_label_442:
!	Mem[0000000010041400] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l3	! %l3 = 000000ff000000ff
!	%l0 = ffffffffffffffff, Mem[0000000030101410] = 00000000
	stwa	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = ffffffff
!	%l5 = 0000000000000000, Mem[0000000010181400] = 00000000
	stba	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	Mem[0000000030041400] = 000000ff, %l4 = 0000000000000000
	swapa	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%f22 = 00000000 000000ff, Mem[0000000030001410] = 00000000 a5ff0000
	stda	%f22,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000 000000ff
!	%l7 = 0000000000000000, Mem[0000000010041410] = ff0000ff
	stha	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = ff000000
!	%l0 = ffffffffffffffff, Mem[0000000010001410] = 00000000
	stwa	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = ffffffff
!	%l2 = 0000000000000000, Mem[0000000030081400] = a0e0e301000000ff
	stxa	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000000000000000
!	Mem[000000001018141c] = 00000028, %l3 = 00000000000000ff, %asi = 80
	swapa	[%i6+0x01c]%asi,%l3	! %l3 = 0000000000000028
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 00000000, %l2 = 0000000000000000
	lduwa	[%i6+%o5]0x89,%l2	! %l2 = 0000000000000000

p0_label_443:
!	Mem[0000000010041410] = 000000ffff000000, %f26 = 00000000 20f1f32e
	ldda	[%i1+0x010]%asi,%f26	! %f26 = 000000ff ff000000
!	Mem[0000000010041408] = 00000000, %f22 = 00000000
	lda	[%i1+0x008]%asi,%f22	! %f22 = 00000000
!	%f14 = 1023d0d0, %f16 = ff000000, %f19 = 00000000
	fdivs	%f14,%f16,%f19		! %f19 = 80000000
!	Mem[0000000030081400] = 00000000, %l1 = 0000000000000000
	lduha	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = 000000ff, %l0 = ffffffffffffffff
	ldsha	[%i2+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141408] = 00000000 00000000, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010101410] = 000000e0, %l7 = 0000000000000000
	ldswa	[%i4+%o5]0x88,%l7	! %l7 = 00000000000000e0
!	Mem[0000000010001400] = 00000000, %l2 = 0000000000000000
	lduba	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000201c0000] = 00008819, %l6 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f16 = ff000000, %f13 = 00000000, %f5  = 00000000
	fsubs	%f16,%f13,%f5 		! %f5  = ff000000

p0_label_444:
!	Mem[00000000100c141c] = 000000ff, %l0 = 00000000, %l6 = 00000000
	add	%i3,0x1c,%g1
	casa	[%g1]0x80,%l0,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101408] = 00000000, %l0 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	%f1  = 000000ff, Mem[0000000010141410] = 01fe0000
	sta	%f1 ,[%i5+0x010]%asi	! Mem[0000000010141410] = 000000ff
!	%l1 = 0000000000000000, Mem[0000000010101400] = 7fffffff
	stba	%l1,[%i4+%g0]0x80	! Mem[0000000010101400] = 00ffffff
!	%l7 = 00000000000000e0, Mem[0000000030101400] = ffffffff00000000
	stxa	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000000000e0
!	%f12 = 00000000, Mem[0000000010181400] = 00000000
	sta	%f12,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	Mem[0000000010081430] = ffffffff, %l2 = 0000000000000000, %asi = 80
	swapa	[%i2+0x030]%asi,%l2	! %l2 = 00000000ffffffff
!	Mem[00000000300c1400] = cffaffff, %l2 = 00000000ffffffff
	swapa	[%i3+%g0]0x81,%l2	! %l2 = 00000000cffaffff
!	Mem[0000000010081430] = 00000000, %l2 = 00000000cffaffff, %asi = 80
	swapa	[%i2+0x030]%asi,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ff000000 000000ff, %l2 = 00000000, %l3 = 00000028
	ldda	[%i3+%g0]0x88,%l2	! %l2 = 00000000000000ff 00000000ff000000

p0_label_445:
!	Mem[0000000030041400] = 0000000000000000, %f6  = 00000000 000000ff
	ldda	[%i1+%g0]0x89,%f6 	! %f6  = 00000000 00000000
!	Mem[0000000010001414] = 00000000, %l0 = 0000000000000000
	lduha	[%i0+0x016]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1410] = 00000000 00000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010181400] = 00000000, %l7 = 00000000000000e0
	lduwa	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[000000001000140c] = 00000000, %l3 = 00000000ff000000
	ldsha	[%i0+0x00c]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081408] = 000000ff, %l0 = 0000000000000000
	lduwa	[%i2+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101408] = 000000ff, %l1 = 0000000000000000
	ldsba	[%i4+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101428] = 00000000d0d02310, %f16 = ff000000 00000000
	ldd	[%i4+0x028],%f16	! %f16 = 00000000 d0d02310
!	Mem[0000000010001408] = ff000000, %l3 = 0000000000000000
	lduba	[%i0+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000020800001] = ffffc3ca, %l6 = 00000000000000ff
	ldstuba	[%o1+0x001]%asi,%l6	! %l6 = 000000ff000000ff

p0_label_446:
!	%l7 = 0000000000000000, Mem[0000000010101410] = e0000000
	stha	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	%l2 = 00000000000000ff, Mem[0000000010101410] = 0000000000000000
	stxa	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000010081438] = ffff0052ff16658b
	stx	%l5,[%i2+0x038]		! Mem[0000000010081438] = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l6 = 00000000000000ff
	ldstuba	[%i5+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1408] = ff000000, %l6 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000010041408] = 00000000 ff3ea5ff
	stda	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 000000ff 00000000
!	Mem[0000000021800040] = ff9c7f92, %l5 = 0000000000000000
	ldstuba	[%o3+0x040]%asi,%l5	! %l5 = 000000ff000000ff
!	%f27 = ff000000, Mem[0000000030081400] = 00000000
	sta	%f27,[%i2+%g0]0x89	! Mem[0000000030081400] = ff000000
!	Mem[0000000030181408] = 000000e0, %l4 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l4	! %l4 = 00000000000000e0
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 0000fcae, %l7 = 0000000000000000
	lduh	[%o2+%g0],%l7		! %l7 = 0000000000000000

p0_label_447:
!	Mem[0000000030101410] = ffffffff, %l3 = 00000000000000ff
	lduwa	[%i4+%o5]0x81,%l3	! %l3 = 00000000ffffffff
!	Mem[00000000211c0000] = 0000fcae, %l5 = 00000000000000ff
	ldub	[%o2+0x001],%l5		! %l5 = 0000000000000000
!	Mem[000000001018143c] = 00000000, %f4  = e0000000
	ld	[%i6+0x03c],%f4 	! %f4 = 00000000
!	Mem[0000000020800040] = 0000bf87, %l6 = 00000000000000ff
	lduba	[%o1+0x041]%asi,%l6	! %l6 = 0000000000000000
!	%l7 = 0000000000000000, immd = fffffffffffff020, %l1  = 0000000000000000
	mulx	%l7,-0xfe0,%l1		! %l1 = 0000000000000000
!	Mem[0000000030181400] = 00f1f3ff, %f19 = 80000000
	lda	[%i6+%g0]0x89,%f19	! %f19 = 00f1f3ff
!	Mem[0000000010181408] = ff000000, %l4 = 00000000000000e0
	lduba	[%i6+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%f30 = ff000000, %f6  = 00000000
	fcmpes	%fcc0,%f30,%f6 		! %fcc0 = 1
!	Mem[0000000010181400] = 00000000 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030101408] = ff000000 0000ffa5
	stda	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 00000000

p0_label_448:
!	%f22 = 00000000 000000ff, Mem[0000000010041410] = ff000000 000000ff
	stda	%f22,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000 000000ff
!	%l5 = 0000000000000000, Mem[0000000020800000] = ffffc3ca, %asi = 80
	stha	%l5,[%o1+0x000]%asi	! Mem[0000000020800000] = 0000c3ca
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010081410] = 00000000 ff000000
	stda	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000 00000000
!	%l7 = 0000000000000000, Mem[0000000020800000] = 0000c3ca
	sth	%l7,[%o1+%g0]		! Mem[0000000020800000] = 0000c3ca
!	Mem[0000000010081408] = ff000000, %l6 = 0000000000000000
	swapa	[%i2+%o4]0x80,%l6	! %l6 = 00000000ff000000
!	%f15 = 000000ff, Mem[0000000010081410] = 00000000
	sta	%f15,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff
!	%l6 = ff000000, %l7 = 00000000, Mem[0000000030181410] = 00000000 ff000000
	stda	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = ff000000 00000000
!	%l0 = 00000000000000ff, Mem[0000000030181408] = 00000000
	stba	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ff
!	Mem[0000000030141400] = 01fee7fb, %l4 = 00000000000000ff
	swapa	[%i5+%g0]0x81,%l4	! %l4 = 0000000001fee7fb
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ff000000, %l4 = 0000000001fee7fb
	ldsha	[%i3+0x000]%asi,%l4	! %l4 = ffffffffffffff00

p0_label_449:
!	Mem[0000000010101400] = 00ffffff, %f28 = ff000000
	lda	[%i4+%g0]0x80,%f28	! %f28 = 00ffffff
!	Mem[0000000010101410] = 00000000, %l3 = 00000000ffffffff
	lduba	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001408] = ffffffff, %l5 = 0000000000000000
	ldsba	[%i0+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030181400] = ffffff0000f1f3ff, %l3 = 0000000000000000
	ldxa	[%i6+%g0]0x89,%l3	! %l3 = ffffff0000f1f3ff
!	Mem[0000000030041400] = 0000000000000000, %f0  = 7fffffff 000000ff
	ldda	[%i1+%g0]0x81,%f0 	! %f0  = 00000000 00000000
!	Mem[0000000010001408] = ff000000, %l1 = 0000000000000000
	lduwa	[%i0+%o4]0x80,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010001400] = 00000000, %l3 = ffffff0000f1f3ff
	lduba	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
!	%l3 = 0000000000000000, imm = fffffffffffffb52, %l7 = 0000000000000000
	subc	%l3,-0x4ae,%l7		! %l7 = 00000000000004ae
!	Mem[0000000030141410] = 00000000, %l3 = 0000000000000000
	lduwa	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000030001400] = 00000000
	stha	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff

p0_label_450:
!	%l4 = ffffffffffffff00, Mem[0000000010141410] = ff000000
	stba	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = ff000000
!	Mem[0000000010181410] = 000000ff, %l1 = 00000000ff000000
	ldstuba	[%i6+%o5]0x88,%l1	! %l1 = 000000ff000000ff
!	%f14 = 1023d0d0 000000ff, Mem[0000000010001408] = ff000000 00000000
	std	%f14,[%i0+%o4]	! Mem[0000000010001408] = 1023d0d0 000000ff
!	Mem[0000000010141418] = 00000000, %l4 = ffffffffffffff00, %asi = 80
	swapa	[%i5+0x018]%asi,%l4	! %l4 = 0000000000000000
!	%l2 = 000000ff, %l3 = 00000000, Mem[00000000100c1400] = ff000000 000000ff
	stda	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff 00000000
!	Mem[0000000010101404] = 000000ff, %l4 = 0000000000000000
	swap	[%i4+0x004],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030181408] = 000000ff, %l4 = 00000000000000ff
	ldstuba	[%i6+%o4]0x89,%l4	! %l4 = 000000ff000000ff
!	%f28 = 00ffffff, %f21 = ff000000, %f16 = 00000000
	fsubs	%f28,%f21,%f16		! %f16 = 7f000000
!	Mem[000000001008143c] = 00000000, %l2 = 000000ff, %l4 = 000000ff
	add	%i2,0x3c,%g1
	casa	[%g1]0x80,%l2,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000, %l0 = 00000000000000ff
	ldsba	[%i1+%o4]0x81,%l0	! %l0 = 0000000000000000

p0_label_451:
!	%l5 = ffffffffffffffff, immed = 00000956, %y  = 00000000
	sdiv	%l5,0x956,%l4		! %l4 = 00000000001b6bc1
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000010001400] = 0000000000000000, %l6 = 00000000ff000000
	ldxa	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l6 = 0000000000000000
	ldsha	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l7 = 00000000000004ae
	lduba	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101408] = 00000000 23100000, %l4 = 001b6bc1, %l5 = ffffffff
	ldda	[%i4+0x008]%asi,%l4	! %l4 = 0000000000000000 0000000023100000
!	Mem[0000000030041408] = 00000000, %l0 = 0000000000000000
	lduba	[%i1+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101410] = 00000000 000000ff, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000 00000000000000ff
!	Mem[00000000211c0000] = 0000fcae, %l6 = 0000000000000000
	ldsba	[%o2+0x001]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1410] = 0000000000000000, %l6 = 0000000000000000
	ldxa	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f20 = ff0000ff ff000000, %l3 = 0000000000000000
!	Mem[0000000010101428] = 00000000d0d02310
	add	%i4,0x028,%g1
	stda	%f20,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010101428] = 00000000d0d02310

p0_label_452:
!	Mem[00000000100c1400] = 000000ff, %l2 = 00000000000000ff
	ldstuba	[%i3+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010001400] = 00000000
	stba	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	%f8  = 00000000 fbe70000, Mem[0000000010181408] = 000000ff 7fffffff
	stda	%f8 ,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000 fbe70000
!	%l7 = 0000000000000000, Mem[0000000010101400] = 00ffffff00000000, %asi = 80
	stxa	%l7,[%i4+0x000]%asi	! Mem[0000000010101400] = 0000000000000000
!	%f27 = ff000000, Mem[0000000010081410] = 000000ff
	sta	%f27,[%i2+%o5]0x80	! Mem[0000000010081410] = ff000000
!	%l3 = 0000000000000000, Mem[0000000010001408] = d0d02310
	stha	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = d0d00000
!	Code Fragment 3
p0_fragment_53:
!	%l0 = 0000000000000000
	setx	0xd8cfc4478e5d91c8,%g7,%l0 ! %l0 = d8cfc4478e5d91c8
!	%l1 = 00000000000000ff
	setx	0x6d04f9cfde152893,%g7,%l1 ! %l1 = 6d04f9cfde152893
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d8cfc4478e5d91c8
	setx	0xcb39adb0342d15ac,%g7,%l0 ! %l0 = cb39adb0342d15ac
!	%l1 = 6d04f9cfde152893
	setx	0xf4a40987d22e8bbc,%g7,%l1 ! %l1 = f4a40987d22e8bbc
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010101438] = 1023d0d0 000000ff
	std	%l2,[%i4+0x038]		! Mem[0000000010101438] = 00000000 00000000
!	%f15 = 000000ff, Mem[0000000030081400] = 000000ff
	sta	%f15,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00000000, %f3  = 23100000
	lda	[%i6+%g0]0x80,%f3 	! %f3 = 00000000

p0_label_453:
!	%f14 = 1023d0d0, %f16 = 7f000000, %f8  = 00000000 fbe70000
	fsmuld	%f14,%f16,%f8 		! %f8  = 41f47a1a 00000000
!	Mem[0000000010141400] = 00000000, %l0 = cb39adb0342d15ac
	lduha	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041400] = 0000000000000000, %f30 = ff000000 000000ff
	ldda	[%i1+%g0]0x89,%f30	! %f30 = 00000000 00000000
!	Mem[0000000030101400] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101408] = 00000000, %l2 = 0000000000000000
	ldsha	[%i4+0x00a]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000211c0000] = 0000fcae, %l5 = 0000000023100000
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181408] = 000000ff, %l4 = 0000000000000000
	lduwa	[%i6+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141410] = fb00000000000000, %l2 = 0000000000000000
	ldxa	[%i5+%o5]0x89,%l2	! %l2 = fb00000000000000
!	Mem[0000000010101400] = 0000000000000000, %f2  = 00000000 00000000
	ldda	[%i4+%g0]0x80,%f2 	! %f2  = 00000000 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 000000ff, %l3 = 0000000000000000
	swapa	[%i2+%o4]0x89,%l3	! %l3 = 00000000000000ff

p0_label_454:
!	Mem[00000000100c1410] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000010041410] = ff000000
	stba	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = ff000000
!	Mem[0000000021800181] = 66ff8f81, %l2 = fb00000000000000
	ldstub	[%o3+0x181],%l2		! %l2 = 000000ff000000ff
!	%l0 = 0000000000000000, Mem[0000000010081414] = 00000000
	stw	%l0,[%i2+0x014]		! Mem[0000000010081414] = 00000000
!	%f14 = 1023d0d0 000000ff, %l1 = f4a40987d22e8bbc
!	Mem[0000000010081418] = 000000005a007396
	add	%i2,0x018,%g1
	stda	%f14,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010081418] = 000000005a007396
!	%l2 = 00000000000000ff, Mem[0000000030081410] = d0d02310
	stha	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = d0d000ff
!	%f6  = 00000000 00000000, Mem[0000000030081400] = 000000ff 00000000
	stda	%f6 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000 00000000
!	%l4 = 00000000000000ff, Mem[0000000010181408] = fbe70000
	stba	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = fbe700ff
!	%l5 = 0000000000000000, Mem[0000000010081410] = 000000ff
	stwa	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff000000, %l4 = 00000000000000ff
	lduba	[%i5+%o4]0x80,%l4	! %l4 = 00000000000000ff

p0_label_455:
!	Mem[00000000100c1410] = ff00000000000000, %f0  = 00000000 00000000
	ldda	[%i3+%o5]0x80,%f0 	! %f0  = ff000000 00000000
!	Mem[00000000300c1408] = 00000000, %l7 = 0000000000000000
	ldswa	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001400] = 00000000 00000000, %l0 = 00000000, %l1 = d22e8bbc
	ldd	[%i0+%g0],%l0		! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010141410] = ff000000, %f29 = ff000000
	lda	[%i5+%o5]0x88,%f29	! %f29 = ff000000
!	Mem[0000000030101400] = 000000ff, %l3 = 00000000000000ff
	ldswa	[%i4+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%l4 = 00000000000000ff, immed = fffff43c, %y  = 00000000
	umul	%l4,-0xbc4,%l7		! %l7 = 000000fefff447c4, %y = 000000fe
!	Mem[0000000030001400] = 000000ff, %l0 = 0000000000000000
	lduba	[%i0+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[000000001014142c] = 000000ff, %l1 = 0000000000000000
	lduba	[%i5+0x02d]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001400] = ff000000, %l2 = 00000000000000ff
	ldsba	[%i0+%g0]0x81,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, imm = fffffffffffff2e2, %l3 = 00000000000000ff
	andn	%l6,-0xd1e,%l3		! %l3 = 0000000000000000

p0_label_456:
!	%l2 = ffffffffffffffff, Mem[000000001014142c] = 000000ff, %asi = 80
	stwa	%l2,[%i5+0x02c]%asi	! Mem[000000001014142c] = ffffffff
!	%l7 = 000000fefff447c4, Mem[00000000201c0000] = 00008819
	stb	%l7,[%o0+%g0]		! Mem[00000000201c0000] = c4008819
!	Mem[0000000010081400] = ffff00ff, %l2 = ffffffffffffffff
	ldstuba	[%i2+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	%f20 = ff0000ff ff000000, Mem[0000000010001410] = ffffffff 00000000
	stda	%f20,[%i0+%o5]0x88	! Mem[0000000010001410] = ff0000ff ff000000
!	Mem[0000000010081410] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081410] = ff00d0d0, %l6 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030041410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i1+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	%f6  = 00000000, Mem[0000000010081410] = ff000000
	sta	%f6 ,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	%l1 = 0000000000000000, %l2 = 00000000000000ff, %y  = 000000fe
	sdiv	%l1,%l2,%l2		! %l2 = 000000007fffffff
	mov	%l0,%y			! %y = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 000000ff, %l5 = 0000000000000000
	lduha	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000000

p0_label_457:
!	%l5 = 0000000000000000, %l0 = 00000000000000ff, %l2 = 000000007fffffff
	andn	%l5,%l0,%l2		! %l2 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l5 = 0000000000000000
	ldsha	[%i3+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l0 = 00000000000000ff
	lduba	[%i4+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l5 = 0000000000000000
	ldsba	[%i5+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = ff000000, %l2 = 0000000000000000
	ldsba	[%i5+0x009]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1400] = ff0000ff 00000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 00000000ff0000ff 0000000000000000
!	Mem[0000000030101410] = ffffffffffffffff, %f14 = 1023d0d0 000000ff
	ldda	[%i4+%o5]0x89,%f14	! %f14 = ffffffff ffffffff
!	Mem[0000000010001400] = 00000000, %l1 = 0000000000000000
	ldswa	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l1 = 0000000000000000
	lduha	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[00000000100c1408] = 000000ff
	stha	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000

p0_label_458:
!	%l2 = 00000000ff0000ff, Mem[000000001010143e] = 00000000
	stb	%l2,[%i4+0x03e]		! Mem[000000001010143c] = 0000ff00
!	%l1 = 0000000000000000, Mem[00000000100c1400] = ff0000ff00000000, %asi = 80
	stxa	%l1,[%i3+0x000]%asi	! Mem[00000000100c1400] = 0000000000000000
!	Mem[00000000100c1410] = ff000000, %l2 = ff0000ff, %l5 = 00000000
	add	%i3,0x10,%g1
	casa	[%g1]0x80,%l2,%l5	! %l5 = 00000000ff000000
!	Mem[00000000201c0000] = c4008819, %l5 = 00000000ff000000
	ldstub	[%o0+%g0],%l5		! %l5 = 000000c4000000ff
!	Mem[000000001000140c] = 000000ff, %l0 = 0000000000000000
	ldstub	[%i0+0x00c],%l0		! %l0 = 00000000000000ff
!	Mem[00000000300c1408] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081410] = 00000000, %l5 = 00000000000000c4
	swapa	[%i2+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000020800000] = 0000c3ca, %l7 = 000000fefff447c4
	ldstub	[%o1+%g0],%l7		! %l7 = 00000000000000ff
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000010141428] = 00000000 ffffffff
	stda	%l6,[%i5+0x028]%asi	! Mem[0000000010141428] = 000000ff 00000000
!	Starting 10 instruction Load Burst
!	%l4 = 00000000000000ff, immed = fffff909, %y  = 000000ff
	sdiv	%l4,-0x6f7,%l0		! %l0 = ffffffffdb63366b
	mov	%l0,%y			! %y = db63366b

p0_label_459:
!	Mem[0000000010101400] = 00000000, %l2 = 00000000ff0000ff
	lduba	[%i4+0x001]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = 000000ff, %l3 = 0000000000000000
	ldswa	[%i5+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181408] = ff000000, %l0 = ffffffffdb63366b
	lduba	[%i6+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001428] = ff000000, %l2 = 0000000000000000
	ldsb	[%i0+0x02a],%l2		! %l2 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %f22 = 00000000
	lda	[%i4+%g0]0x88,%f22	! %f22 = 00000000
!	Mem[0000000030041400] = 0000000000000000, %l0 = 00000000000000ff
	ldxa	[%i1+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %f19 = 00f1f3ff
	lda	[%i3+%g0]0x80,%f19	! %f19 = 00000000
!	Mem[0000000020800040] = 0000bf87, %l5 = 0000000000000000
	ldsh	[%o1+0x040],%l5		! %l5 = 0000000000000000
!	Mem[0000000010041408] = ff000000, %l3 = 00000000000000ff
	lduba	[%i1+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[00000000300c1410] = 00000000
	stha	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000

p0_label_460:
!	%f20 = ff0000ff, %f1  = 00000000
	fcmpes	%fcc3,%f20,%f1 		! %fcc3 = 1
!	%f28 = 00ffffff ff000000, Mem[00000000100c1400] = 00000000 00000000
	std	%f28,[%i3+%g0]	! Mem[00000000100c1400] = 00ffffff ff000000
!	%l0 = 0000000000000000, Mem[0000000030081408] = 00000000
	stba	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%f17 = d0d02310, Mem[0000000010041408] = 000000ff
	sta	%f17,[%i1+%o4]0x80	! Mem[0000000010041408] = d0d02310
!	Mem[0000000030001410] = 00000000, %l7 = 0000000000000000
	swapa	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141408] = ffd00000, %l4 = 00000000000000ff
	ldstuba	[%i5+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030141400] = ff000000 00000000
	stda	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 00000000
!	%l2 = 0000000000000000, Mem[0000000010141410] = 000000ff
	stba	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000ff
!	Mem[0000000030001408] = ffffffff, %l5 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l5	! %l5 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 00000000 000000ff, %l4 = 000000ff, %l5 = ffffffff
	ldda	[%i0+%g0]0x89,%l4	! %l4 = 00000000000000ff 0000000000000000

p0_label_461:
!	Mem[0000000030041408] = 00000000, %l4 = 00000000000000ff
	lduwa	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000000
!	%l0 = 0000000000000000, %l2 = 0000000000000000, %l5 = 0000000000000000
	or	%l0,%l2,%l5		! %l5 = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l4 = 0000000000000000
	lduha	[%i5+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101420] = ffff0052ff16658b, %l4 = 0000000000000000
	ldx	[%i4+0x020],%l4		! %l4 = ffff0052ff16658b
!	Mem[00000000211c0000] = 0000fcae, %l7 = 0000000000000000
	ldub	[%o2+0x001],%l7		! %l7 = 0000000000000000
	membar	#Sync			! Added by membar checker (84)
!	Mem[0000000030101400] = ff000000 000000e0 00000000 00000000
!	Mem[0000000030101410] = ffffffff ffffffff 00000000 00000000
!	Mem[0000000030101420] = 0aff5a26 a65d3746 a65d3746 00000000
!	Mem[0000000030101430] = e0776e03 1023d0d0 02ac1e89 2d72a12c
	ldda	[%i4]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030101400
!	Mem[0000000010141430] = ffff00ff, %f12 = 00000000
	lda	[%i5+0x030]%asi,%f12	! %f12 = ffff00ff
!	Mem[0000000030081410] = d0d000ff, %l6 = 00000000000000ff
	ldsba	[%i2+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181400] = 00000000, %f6  = 00000000
	lda	[%i6+%g0]0x88,%f6 	! %f6 = 00000000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, immd = 0000000000000f72, %l1  = 0000000000000000
	mulx	%l2,0xf72,%l1		! %l1 = 0000000000000000

p0_label_462:
!	%l4 = ffff0052ff16658b, Mem[0000000010081400] = ffff00ff1023d0d0, %asi = 80
	stxa	%l4,[%i2+0x000]%asi	! Mem[0000000010081400] = ffff0052ff16658b
!	%l6 = ffffffffffffffff, imm = fffffffffffffd70, %l2 = 0000000000000000
	sub	%l6,-0x290,%l2		! %l2 = 000000000000028f
!	%f0  = ff000000 00000000 00000000 00000000
!	%f4  = 00000000 ff000000 00000000 00000000
!	%f8  = 41f47a1a 00000000 00000000 00000000
!	%f12 = ffff00ff 00000000 ffffffff ffffffff
	stda	%f0,[%i1]ASI_BLK_SL	! Block Store to 0000000030041400
!	%l6 = ffffffffffffffff, Mem[0000000030081408] = 00000000
	stba	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000ff
!	%l3 = 0000000000000000, Mem[0000000010181410] = ff000000
	stba	%l3,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	%l1 = 0000000000000000, Mem[00000000300c1408] = ff000000
	stha	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	%f28 = d0d02310 036e77e0, Mem[00000000100c1408] = 00000000 00000000
	stda	%f28,[%i3+0x008]%asi	! Mem[00000000100c1408] = d0d02310 036e77e0
!	%f27 = 46375da6, %f24 = 46375da6
	fcmps	%fcc3,%f27,%f24		! %fcc3 = 0
!	%l4 = ffff0052ff16658b, Mem[0000000010001410] = ff0000ffff000000
	stxa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = ffff0052ff16658b
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000 000000ff, %l6 = ffffffff, %l7 = 00000000
	ldda	[%i3+%o5]0x88,%l6	! %l6 = 00000000000000ff 0000000000000000

p0_label_463:
!	%l4 = ffff0052ff16658b, immed = 0000072d, %y  = db63366b
	umul	%l4,0x72d,%l6		! %l6 = 0000072673b6a66f, %y = 00000726
!	Mem[0000000010101408] = 00001023 00000000, %l4 = ff16658b, %l5 = 00000000
	ldda	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000000 0000000000001023
!	Mem[00000000211c0000] = 0000fcae, %l6 = 0000072673b6a66f
	ldsba	[%o2+0x001]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101410] = ffffffff, %l4 = 0000000000000000
	ldsba	[%i4+%o5]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010181408] = ff00e7fb, %l6 = 0000000000000000
	lduha	[%i6+%o4]0x80,%l6	! %l6 = 000000000000ff00
!	%f31 = 891eac02, Mem[00000000300c1400] = ffffffff
	sta	%f31,[%i3+%g0]0x89	! Mem[00000000300c1400] = 891eac02
!	Mem[00000000100c1410] = 000000ff, %l2 = 000000000000028f
	lduha	[%i3+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001408] = 0000d0d0ff0000ff, %l6 = 000000000000ff00
	ldxa	[%i0+%o4]0x80,%l6	! %l6 = 0000d0d0ff0000ff
!	Mem[0000000030101408] = 00000000, %l5 = 0000000000001023
	ldsba	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081428] = ff000000000000ff, %l1 = 0000000000000000, %l3 = 0000000000000000
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l1,%l3	! %l3 = ff000000000000ff

p0_label_464:
!	%l3 = ff000000000000ff, Mem[0000000030141408] = ffd0000000000000
	stxa	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = ff000000000000ff
!	%f26 = 00000000 46375da6, Mem[0000000010181400] = 00000000 00000000
	stda	%f26,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000 46375da6
!	%f16 = e0000000 000000ff, Mem[0000000010181430] = 00000000 000000ff
	stda	%f16,[%i6+0x030]%asi	! Mem[0000000010181430] = e0000000 000000ff
!	%l1 = 0000000000000000, Mem[0000000030001400] = 00000000000000ff
	stxa	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000000000000000
!	%f24 = 46375da6 265aff0a, Mem[0000000010101400] = 00000000 00000000
	stda	%f24,[%i4+%g0]0x88	! Mem[0000000010101400] = 46375da6 265aff0a
!	%l6 = ff0000ff, %l7 = 00000000, Mem[0000000010001400] = 00000000 00000000
	stda	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = ff0000ff 00000000
!	%l1 = 0000000000000000, Mem[0000000020800000] = ff00c3ca
	sth	%l1,[%o1+%g0]		! Mem[0000000020800000] = 0000c3ca
	membar	#Sync			! Added by membar checker (85)
!	Mem[0000000010041400] = ff000000, %l0 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030101410] = ffffffff, %l6 = 0000d0d0ff0000ff
	ldstuba	[%i4+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = d0d00000, %f21 = ffffffff
	lda	[%i0+%o4]0x88,%f21	! %f21 = d0d00000

p0_label_465:
!	Mem[0000000010101408] = 00000000, %l7 = 0000000000000000
	ldsha	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l0 = 00000000ff000000
	ldsba	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = d0d00000, %l0 = 0000000000000000
	lduba	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181418] = 00000000000000ff, %l4 = ffffffffffffffff
	ldx	[%i6+0x018],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010181400] = a65d3746, %l2 = 00000000000000ff
	ldub	[%i6+0x003],%l2		! %l2 = 0000000000000046
!	Mem[0000000030041410] = 00000000ff000000, %f28 = d0d02310 036e77e0
	ldda	[%i1+%o5]0x89,%f28	! %f28 = 00000000 ff000000
!	Mem[0000000030141400] = 00000000, %f7  = 00000000
	lda	[%i5+%g0]0x81,%f7 	! %f7 = 00000000
!	Mem[00000000100c1408] = d0d02310, %l7 = 0000000000000000
	ldsba	[%i3+%o4]0x80,%l7	! %l7 = ffffffffffffffd0
!	Mem[0000000010081400] = 5200ffff, %f10 = 00000000
	lda	[%i2+%g0]0x88,%f10	! %f10 = 5200ffff
!	Starting 10 instruction Store Burst
!	%f30 = 2ca1722d 891eac02, %l5 = 0000000000000000
!	Mem[0000000030141400] = 0000000000000000
	stda	%f30,[%i5+%l5]ASI_PST16_S ! Mem[0000000030141400] = 0000000000000000

p0_label_466:
!	Mem[0000000010041408] = 1023d0d0, %l3 = ff000000000000ff
	ldstuba	[%i1+%o4]0x88,%l3	! %l3 = 000000d0000000ff
!	%l3 = 00000000000000d0, Mem[0000000010001424] = 00000000, %asi = 80
	stha	%l3,[%i0+0x024]%asi	! Mem[0000000010001424] = 00d00000
!	Mem[0000000030041410] = 000000ff, %l0 = 0000000000000000
	ldstuba	[%i1+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%f2  = 00000000 00000000, %l0 = 0000000000000000
!	Mem[0000000030041408] = 0000000000000000
	add	%i1,0x008,%g1
	stda	%f2,[%g1+%l0]ASI_PST8_S ! Mem[0000000030041408] = 0000000000000000
!	%f16 = e0000000 000000ff 00000000 00000000
!	%f20 = ffffffff d0d00000 00000000 00000000
!	%f24 = 46375da6 265aff0a 00000000 46375da6
!	%f28 = 00000000 ff000000 2ca1722d 891eac02
	stda	%f16,[%i5]ASI_BLK_AIUSL	! Block Store to 0000000030141400
	membar	#Sync			! Added by membar checker (86)
!	Mem[0000000010141400] = 00000000, %l2 = 0000000000000046
	swapa	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000030181400] = 00f1f3ff
	stha	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = 00f10000
!	%l6 = 00000000000000ff, %l7 = ffffffffffffffd0, %l0 = 0000000000000000
	xnor	%l6,%l7,%l0		! %l0 = 00000000000000d0
!	%l7 = ffffffffffffffd0, Mem[00000000201c0000] = ff008819
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = ffd08819
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 0000fcae, %l5 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000

p0_label_467:
!	Mem[0000000030001408] = 00000000, %l5 = 0000000000000000
	ldsha	[%i0+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181404] = 00000000, %l2 = 0000000000000000
	ldswa	[%i6+0x004]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %l2 = 0000000000000000
	ldsba	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1408] = 1023d0d0, %f6  = 00000000
	lda	[%i3+%o4]0x88,%f6 	! %f6 = 1023d0d0
!	Mem[000000001014141c] = 00000000, %l2 = 0000000000000000
	ldsba	[%i5+0x01d]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081408] = 000000ff 000000ff, %l0 = 000000d0, %l1 = 00000000
	ldda	[%i2+%o4]0x89,%l0	! %l0 = 00000000000000ff 00000000000000ff
!	Mem[0000000010001408] = d0d00000, %l0 = 00000000000000ff
	ldsha	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081400] = ffff0052 ff16658b 00000000 ff000000
!	Mem[0000000010081410] = 000000c4 00000000 00000000 5a007396
!	Mem[0000000010081420] = 44000000 00000000 ff000000 000000ff
!	Mem[0000000010081430] = cffaffff 00000000 00000000 00000000
	ldda	[%i2]ASI_BLK_PL,%f0	! Block Load from 0000000010081400
!	Mem[00000000100c1418] = ff000000, %l2 = 0000000000000000
	lduw	[%i3+0x018],%l2		! %l2 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000030001408] = 00000000
	stwa	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000

p0_label_468:
	membar	#Sync			! Added by membar checker (87)
!	%f30 = 2ca1722d 891eac02, %l5 = 0000000000000000
!	Mem[0000000010081418] = 000000005a007396
	add	%i2,0x018,%g1
	stda	%f30,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010081418] = 000000005a007396
!	%l3 = 00000000000000d0, Mem[00000000211c0001] = 0000fcae
	stb	%l3,[%o2+0x001]		! Mem[00000000211c0000] = 00d0fcae
!	Mem[0000000030181400] = 00f10000, %l5 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%l3 = 00000000000000d0, Mem[0000000010081400] = 5200ffff
	stwa	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000d0
!	%l6 = 00000000000000ff, Mem[0000000010141408] = 00000000000000ff
	stxa	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000000000ff
!	%f2  = 000000ff 00000000, Mem[0000000010081408] = 00000000 ff000000
	stda	%f2 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000ff 00000000
!	%f4  = 00000000, %f5  = c4000000, %f0  = 8b6516ff 5200ffff
	fsmuld	%f4 ,%f5 ,%f0 		! %f0  = 80000000 00000000
!	%l4 = 00000000000000ff, Mem[0000000010041434] = ff000000, %asi = 80
	stha	%l4,[%i1+0x034]%asi	! Mem[0000000010041434] = 00ff0000
!	Mem[0000000030101408] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000 ff0000ff, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i1+%o5]0x89,%l0	! %l0 = 00000000ff0000ff 0000000000000000

p0_label_469:
!	Mem[00000000100c142c] = 00ffffff, %f7  = 00000000
	lda	[%i3+0x02c]%asi,%f7 	! %f7 = 00ffffff
!	Mem[0000000030181410] = 000000ff, %l7 = ffffffffffffffd0
	lduha	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = 00ffffff, %l0 = 00000000ff0000ff
	lduwa	[%i3+%g0]0x80,%l0	! %l0 = 0000000000ffffff
!	Mem[0000000010101434] = 00000000, %l3 = 00000000000000d0
	ldsh	[%i4+0x034],%l3		! %l3 = 0000000000000000
!	Mem[0000000010001408] = 0000d0d0ff0000ff, %l1 = 0000000000000000
	ldxa	[%i0+%o4]0x80,%l1	! %l1 = 0000d0d0ff0000ff
!	Mem[0000000010081410] = 000000c400000000, %l6 = 00000000000000ff
	ldxa	[%i2+%o5]0x80,%l6	! %l6 = 000000c400000000
!	Mem[0000000010181428] = 00000000, %l3 = 0000000000000000
	lduh	[%i6+0x02a],%l3		! %l3 = 0000000000000000
!	Mem[0000000010041410] = 00000000 000000ff, %l0 = 00ffffff, %l1 = ff0000ff
	ldda	[%i1+%o5]0x88,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[00000000100c1410] = 000000ff, %l2 = 00000000ff000000
	ldsba	[%i3+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000030081410] = ff00d0d0
	stwa	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000

p0_label_470:
!	%l0 = 00000000000000ff, Mem[0000000010141400] = 00000046, %asi = 80
	stha	%l0,[%i5+0x000]%asi	! Mem[0000000010141400] = 00ff0046
!	%l7 = 0000000000000000, Mem[00000000300c1410] = 00000000
	stba	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	%l1 = 0000000000000000, Mem[00000000201c0000] = ffd08819, %asi = 80
	stba	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00d08819
!	%l0 = 00000000000000ff, Mem[0000000030141408] = 00000000
	stha	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000ff
!	%f5  = c4000000, Mem[0000000010001400] = ff0000ff
	sta	%f5 ,[%i0+%g0]0x88	! Mem[0000000010001400] = c4000000
!	%l2 = ffffffffffffffff, Mem[0000000030101410] = ffffffff
	stwa	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = ffffffff
!	%l4 = 00000000000000ff, Mem[0000000030081408] = ff000000ff000000
	stxa	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000000000ff
!	Mem[00000000201c0000] = 00d08819, %l7 = 0000000000000000
	ldstub	[%o0+%g0],%l7		! %l7 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000010141408] = 000000ff
	stba	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001424] = 00d00000, %l3 = 0000000000000000
	ldsha	[%i0+0x026]%asi,%l3	! %l3 = 0000000000000000

p0_label_471:
!	Mem[0000000010081410] = c4000000, %l1 = 0000000000000000
	ldsba	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l6 = 000000c400000000
	ldswa	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[000000001018140c] = 00000000, %l0 = 00000000000000ff
	swap	[%i6+0x00c],%l0		! %l0 = 0000000000000000
!	Mem[0000000021800000] = ffffb05a, %l6 = 0000000000000000
	ldsba	[%o3+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081408] = 00000000ff000000, %l7 = 0000000000000000
	ldxa	[%i2+%o4]0x88,%l7	! %l7 = 00000000ff000000
!	Mem[0000000030001400] = 00000000, %l4 = 00000000000000ff
	lduba	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = ff00e7fb, %l7 = 00000000ff000000
	ldsha	[%i6+%o4]0x80,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000030001408] = 00000000, %l4 = 0000000000000000
	lduwa	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000020800040] = 0000bf87, %l3 = 0000000000000000
	ldsh	[%o1+0x040],%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000030101408] = ff000000
	stba	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000

p0_label_472:
!	Mem[0000000030001400] = 00000000, %l0 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000
!	%f22 = 00000000 00000000, %l3 = 0000000000000000
!	Mem[0000000010041430] = ff00000000ff0000
	add	%i1,0x030,%g1
	stda	%f22,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010041430] = ff00000000ff0000
!	%f6  = 9673005a, Mem[00000000100c1408] = 1023d0d0
	sta	%f6 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 9673005a
!	%l7 = ffffffffffffff00, Mem[0000000030001400] = 0000000000000000
	stxa	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = ffffffffffffff00
!	Mem[0000000030041410] = ff0000ff, %l3 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	%l4 = 0000000000000000, Mem[0000000010181424] = 0000ff00, %asi = 80
	stha	%l4,[%i6+0x024]%asi	! Mem[0000000010181424] = 0000ff00
!	Mem[0000000030101408] = 00000000, %l1 = 0000000000000000
	swapa	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000030101400] = e0000000000000ff
	stxa	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000000000000000
!	%l7 = ffffffffffffff00, Mem[000000001000140c] = ff0000ff
	stw	%l7,[%i0+0x00c]		! Mem[000000001000140c] = ffffff00
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 000000ff, %l6 = ffffffffffffffff
	lduba	[%i5+%o4]0x89,%l6	! %l6 = 00000000000000ff

p0_label_473:
!	Mem[0000000010081420] = 4400000000000000, %f10 = ff000000 000000ff
	ldd	[%i2+0x020],%f10	! %f10 = 44000000 00000000
!	Mem[00000000100c1408] = 5a007396, %l0 = 0000000000000000
	ldsw	[%i3+%o4],%l0		! %l0 = 000000005a007396
!	Mem[0000000010141410] = ff000000, %l5 = 0000000000000000
	ldsba	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l6 = 00000000000000ff
	lduwa	[%i1+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181408] = 00000000000000ff, %l7 = ffffffffffffff00
	ldxa	[%i6+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041400] = 00000000, %l1 = 0000000000000000
	lduwa	[%i1+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = ff00e7fb000000ff, %f28 = 00000000 ff000000
	ldda	[%i6+%o4]0x80,%f28	! %f28 = ff00e7fb 000000ff
!	Mem[0000000030041408] = 00000000, %l7 = 00000000000000ff
	lduwa	[%i1+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001410] = ff16658b, %l2 = ffffffffffffffff
	ldsba	[%i0+%o5]0x88,%l2	! %l2 = ffffffffffffff8b
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010141410] = ff000000
	stha	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = ff000000

p0_label_474:
!	%f0  = 80000000 00000000, Mem[0000000010101410] = 00000000 ff000000
	stda	%f0 ,[%i4+%o5]0x88	! Mem[0000000010101410] = 80000000 00000000
!	Mem[0000000010181400] = 46375da6, %l1 = 0000000000000000
	ldstuba	[%i6+%g0]0x88,%l1	! %l1 = 000000a6000000ff
!	Mem[0000000010141438] = 000000ffd0ff3eff, %l7 = 0000000000000000, %l0 = 000000005a007396
	add	%i5,0x38,%g1
	casxa	[%g1]0x80,%l7,%l0	! %l0 = 000000ffd0ff3eff
!	%l1 = 00000000000000a6, Mem[00000000300c1400] = 891eac02
	stwa	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000a6
!	%f0  = 80000000 00000000, %l4 = 0000000000000000
!	Mem[0000000010081420] = 4400000000000000
	add	%i2,0x020,%g1
	stda	%f0,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010081420] = 4400000000000000
!	Mem[00000000100c140f] = 036e77e0, %l6 = 0000000000000000
	ldstub	[%i3+0x00f],%l6		! %l6 = 000000e0000000ff
!	Mem[0000000010101400] = 0aff5a26, %l2 = ffffffffffffff8b
	swapa	[%i4+%g0]0x80,%l2	! %l2 = 000000000aff5a26
!	%l3 = 00000000000000ff, %l7 = 0000000000000000, %l4 = 0000000000000000
	subc	%l3,%l7,%l4		! %l4 = 00000000000000ff
!	%f18 = 00000000 00000000, %l3 = 00000000000000ff
!	Mem[0000000010041430] = ff00000000ff0000
	add	%i1,0x030,%g1
	stda	%f18,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010041430] = 0000000000000000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (88)
!	Mem[0000000030041400] = 00000000 000000ff 00000000 00000000
!	Mem[0000000030041410] = ff0000ff 00000000 00000000 00000000
!	Mem[0000000030041420] = 00000000 1a7af441 00000000 00000000
!	Mem[0000000030041430] = 00000000 ff00ffff ffffffff ffffffff
	ldda	[%i1]ASI_BLK_SL,%f16	! Block Load from 0000000030041400

p0_label_475:
!	Mem[0000000010001410] = ff16658b, %l4 = 00000000000000ff
	ldswa	[%i0+%o5]0x88,%l4	! %l4 = ffffffffff16658b
!	Mem[0000000010101400] = ffffff8b, %l1 = 00000000000000a6
	lduwa	[%i4+0x000]%asi,%l1	! %l1 = 00000000ffffff8b
!	Mem[0000000030141408] = 000000ff, %l3 = 00000000000000ff
	lduwa	[%i5+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000021800180] = 66ff8f81, %l6 = 00000000000000e0
	ldsha	[%o3+0x180]%asi,%l6	! %l6 = 00000000000066ff
!	Mem[0000000010101420] = ffff0052, %f9  = 00000044
	lda	[%i4+0x020]%asi,%f9 	! %f9 = ffff0052
	membar	#Sync			! Added by membar checker (89)
!	%l0 = 000000ffd0ff3eff, Mem[0000000030041408] = 00000000
	stwa	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = d0ff3eff
!	Mem[0000000010141424] = 00000000, %l6 = 00000000000066ff
	ldub	[%i5+0x027],%l6		! %l6 = 0000000000000000
!	Mem[00000000201c0000] = ffd08819, %l5 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l5	! %l5 = ffffffffffffffd0
!	%l7 = 0000000000000000, immd = fffffffffffffcc6, %l4  = ffffffffff16658b
	mulx	%l7,-0x33a,%l4		! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = ffffff8b, %l0 = 000000ffd0ff3eff
	ldstuba	[%i4+%g0]0x80,%l0	! %l0 = 000000ff000000ff

p0_label_476:
!	%f26 = 00000000 00000000, Mem[0000000030041400] = 00000000 000000ff
	stda	%f26,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000 00000000
!	%l0 = 000000ff, %l1 = ffffff8b, Mem[0000000030041400] = 00000000 00000000
	stda	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff ffffff8b
!	%l4 = 0000000000000000, Mem[0000000010141410] = 000000ff00000000
	stxa	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i2+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1410] = ff000000, %l1 = 00000000ffffff8b
	lduba	[%i3+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041434] = 00000000, %l2 = 000000000aff5a26
	swap	[%i1+0x034],%l2		! %l2 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %l7 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000
!	%l7 = 0000000000000000, Mem[00000000300c1410] = 00000000
	stwa	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	%f31 = ffffffff, Mem[0000000030041408] = ff3effd0
	sta	%f31,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000 000000a6, %l2 = 00000000, %l3 = 00000000
	ldda	[%i3+%g0]0x89,%l2	! %l2 = 00000000000000a6 0000000000000000

p0_label_477:
!	Mem[0000000010041400] = 00000000, %f25 = 00000000
	lda	[%i1+%g0]0x80,%f25	! %f25 = 00000000
!	Mem[00000000100c1434] = ff000000, %l3 = 0000000000000000
	lduh	[%i3+0x034],%l3		! %l3 = 000000000000ff00
!	Mem[00000000100c1438] = 00006e03ff5a0000, %l6 = 0000000000000000
	ldxa	[%i3+0x038]%asi,%l6	! %l6 = 00006e03ff5a0000
!	Mem[00000000100c1400] = 00ffffffff000000, %f10 = 44000000 00000000
	ldda	[%i3+%g0]0x80,%f10	! %f10 = 00ffffff ff000000
!	Mem[0000000010081400] = 000000d0, %l7 = 0000000000000000
	lduwa	[%i2+%g0]0x88,%l7	! %l7 = 00000000000000d0
!	Mem[0000000030141400] = 000000ff, %l3 = 000000000000ff00
	lduha	[%i5+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1400] = 00000000 000000a6, %l6 = ff5a0000, %l7 = 000000d0
	ldda	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000a6 0000000000000000
!	Mem[00000000100c1400] = 00ffffff, %l7 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1400] = a6000000, %f31 = ffffffff
	lda	[%i3+%g0]0x81,%f31	! %f31 = a6000000
!	Starting 10 instruction Store Burst
!	%f24 = 41f47a1a, Mem[00000000100c1400] = 00ffffff
	sta	%f24,[%i3+%g0]0x80	! Mem[00000000100c1400] = 41f47a1a

p0_label_478:
!	%l5 = ffffffffffffffd0, imm = 0000000000000040, %l6 = 00000000000000a6
	and	%l5,0x040,%l6		! %l6 = 0000000000000040
!	%l7 = 0000000000000000, imm = 00000000000003ed, %l0 = 00000000000000ff
	addc	%l7,0x3ed,%l0		! %l0 = 00000000000003ed
!	%f1  = 00000000, Mem[0000000010001400] = 000000c4
	sta	%f1 ,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	%l3 = 00000000000000ff, Mem[0000000010001400] = 0000000000000000
	stx	%l3,[%i0+%g0]		! Mem[0000000010001400] = 00000000000000ff
!	%f20 = 00000000, Mem[0000000030101410] = ffffffff
	sta	%f20,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	Mem[0000000030041400] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101408] = 00000000, %l1 = 00000000000000ff
	swapa	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001438] = 00000000fffffacf, %l2 = 00000000000000a6, %l0 = 00000000000003ed
	add	%i0,0x38,%g1
	casxa	[%g1]0x80,%l2,%l0	! %l0 = 00000000fffffacf
!	Mem[0000000010101400] = ffffff8b, %l6 = 0000000000000040
	swapa	[%i4+%g0]0x80,%l6	! %l6 = 00000000ffffff8b
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ff000000 fbe700ff, %l2 = 000000a6, %l3 = 000000ff
	ldda	[%i6+%o4]0x88,%l2	! %l2 = 00000000fbe700ff 00000000ff000000

p0_label_479:
!	Mem[0000000030081400] = 00000000, %l3 = 00000000ff000000
	lduha	[%i2+%g0]0x89,%l3	! %l3 = 0000000000000000
!	%f24 = 41f47a1a, %f4  = 00000000, %f28 = ffff00ff 00000000
	fsmuld	%f24,%f4 ,%f28		! %f28 = 00000000 00000000
!	Mem[0000000010141410] = 00000000, %l4 = 0000000000000000
	lduha	[%i5+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = 8000000000000000, %l3 = 0000000000000000
	ldxa	[%i4+%o5]0x88,%l3	! %l3 = 8000000000000000
!	Mem[0000000010001408] = 0000d0d0 ffffff00, %l0 = fffffacf, %l1 = 00000000
	ldda	[%i0+%o4]0x80,%l0	! %l0 = 000000000000d0d0 00000000ffffff00
!	Mem[0000000030001400] = ffffffffffffff00, %f22 = 00000000 00000000
	ldda	[%i0+%g0]0x81,%f22	! %f22 = ffffffff ffffff00
!	Mem[0000000010001400] = 00000000 000000ff, %l4 = 00000000, %l5 = ffffffd0
	ldda	[%i0+%g0]0x80,%l4	! %l4 = 0000000000000000 00000000000000ff
!	Mem[0000000010181400] = ff5d3746, %l2 = 00000000fbe700ff
	lduba	[%i6+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041408] = ffffffff 00000000, %l6 = ffffff8b, %l7 = 00000000
	ldda	[%i1+%o4]0x81,%l6	! %l6 = 00000000ffffffff 0000000000000000
!	Starting 10 instruction Store Burst
!	%f0  = 80000000, Mem[00000000100c1410] = ff000000
	sta	%f0 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = 80000000

p0_label_480:
!	%f16 = ff000000 00000000 00000000 00000000
!	%f20 = 00000000 ff0000ff ffffffff ffffff00
!	%f24 = 41f47a1a 00000000 00000000 00000000
!	%f28 = 00000000 00000000 ffffffff a6000000
	stda	%f16,[%i2]ASI_COMMIT_S	! Block Store to 0000000030081400
	membar	#Sync			! Added by membar checker (90)
!	%l4 = 0000000000000000, Mem[0000000010081430] = cffaffff, %asi = 80
	stwa	%l4,[%i2+0x030]%asi	! Mem[0000000010081430] = 00000000
!	%f2  = 000000ff 00000000, Mem[0000000030181410] = ff000000 00000000
	stda	%f2 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff 00000000
!	Mem[0000000010001410] = 8b6516ff, %l3 = 8000000000000000
	ldstuba	[%i0+%o5]0x80,%l3	! %l3 = 0000008b000000ff
!	%f20 = 00000000 ff0000ff, Mem[00000000100c1408] = 9673005a ff776e03
	stda	%f20,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 ff0000ff
!	%l6 = 00000000ffffffff, Mem[0000000030081400] = ff000000
	stba	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = ff000000
!	%l6 = ffffffff, %l7 = 00000000, Mem[0000000010081430] = 00000000 00000000
	stda	%l6,[%i2+0x030]%asi	! Mem[0000000010081430] = ffffffff 00000000
!	%f2  = 000000ff 00000000, Mem[0000000010081400] = 000000d0 8b6516ff
	stda	%f2 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff 00000000
!	Mem[0000000010001428] = ff000000ff000000, %l0 = 000000000000d0d0, %l2 = 00000000000000ff
	add	%i0,0x28,%g1
	casxa	[%g1]0x80,%l0,%l2	! %l2 = ff000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff000000, %l0 = 000000000000d0d0
	ldsba	[%i5+%o4]0x80,%l0	! %l0 = ffffffffffffffff

p0_label_481:
!	Mem[00000000300c1410] = 00000000, %l0 = ffffffffffffffff
	lduha	[%i3+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181400] = ff5d3746, %l5 = 00000000000000ff
	lduwa	[%i6+%g0]0x80,%l5	! %l5 = 00000000ff5d3746
!	Mem[0000000010001400] = 00000000, %l1 = 00000000ffffff00
	lduba	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = 0000d0d0, %f16 = ff000000
	lda	[%i5+%o5]0x81,%f16	! %f16 = 0000d0d0
!	Mem[0000000010081424] = 00000000, %l5 = 00000000ff5d3746
	lduba	[%i2+0x025]%asi,%l5	! %l5 = 0000000000000000
!	%l5 = 0000000000000000, immd = fffffffffffffcf1, %l4  = 0000000000000000
	mulx	%l5,-0x30f,%l4		! %l4 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %l1 = 0000000000000000
	lduba	[%i4+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001410] = 00000000, %l3 = 000000000000008b
	ldsba	[%i0+%o5]0x89,%l3	! %l3 = 0000000000000000
!	%l2 = ff000000ff000000, Mem[0000000030101408] = ff00000000000000
	stxa	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = ff000000ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = ff00e7fb, %l7 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l7	! %l7 = 00000000ff00e7fb

p0_label_482:
!	Mem[00000000211c0001] = 00d0fcae, %l7 = 00000000ff00e7fb
	ldstuba	[%o2+0x001]%asi,%l7	! %l7 = 000000d0000000ff
!	Mem[0000000030101400] = 00000000, %l5 = 0000000000000000
	swapa	[%i4+%g0]0x81,%l5	! %l5 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000030041400] = ff0000ff
	stba	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = ff000000
!	%f12 = 00000000 fffffacf, %l0 = 0000000000000000
!	Mem[0000000010141410] = 0000000000000000
	add	%i5,0x010,%g1
	stda	%f12,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010141410] = 0000000000000000
!	Mem[00000000100c1434] = ff000000, %l3 = 0000000000000000
	swap	[%i3+0x034],%l3		! %l3 = 00000000ff000000
!	Mem[0000000010141408] = 000000ff, %l7 = 00000000000000d0
	swapa	[%i5+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%f3  = 00000000, Mem[0000000010101408] = 00000000
	sta	%f3 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	Mem[0000000010101414] = 00000080, %l6 = 00000000ffffffff
	swap	[%i4+0x014],%l6		! %l6 = 0000000000000080
!	%l2 = ff000000ff000000, Mem[0000000010001438] = 00000000
	stw	%l2,[%i0+0x038]		! Mem[0000000010001438] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 0000bf87, %l5 = 0000000000000000
	ldsba	[%o1+0x041]%asi,%l5	! %l5 = 0000000000000000

p0_label_483:
!	Mem[0000000010081428] = ff000000, %l6 = 0000000000000080
	ldub	[%i2+0x02b],%l6		! %l6 = 0000000000000000
!	Mem[00000000100c1410] = 8000000000000000, %f8  = 00000000 ffff0052
	ldda	[%i3+%o5]0x80,%f8 	! %f8  = 80000000 00000000
!	Mem[0000000030081410] = 00000000 ff0000ff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i2+%o5]0x81,%l4	! %l4 = 0000000000000000 00000000ff0000ff
!	Mem[00000000100c1414] = 00000000, %l4 = 0000000000000000
	ldsh	[%i3+0x016],%l4		! %l4 = 0000000000000000
!	Mem[0000000030001400] = 00ffffff ffffffff, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i0+%g0]0x89,%l6	! %l6 = 00000000ffffffff 0000000000ffffff
!	Mem[0000000010181410] = 00000000, %f6  = 9673005a
	lda	[%i6+%o5]0x88,%f6 	! %f6 = 00000000
!	Mem[0000000030041410] = ff0000ff00000000, %l6 = 00000000ffffffff
	ldxa	[%i1+%o5]0x81,%l6	! %l6 = ff0000ff00000000
!	Mem[00000000100c1408] = ff0000ff, %l0 = 0000000000000000
	ldsha	[%i3+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001410] = 00000000, %l1 = 0000000000000000
	ldsba	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = ff0000ff00000000, Mem[0000000010101410] = 00000000ffffffff
	stxa	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = ff0000ff00000000

p0_label_484:
!	%l4 = 0000000000000000, Mem[0000000030001400] = ffffffffffffff00
	stxa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000000000000000
!	%l0 = 00000000000000ff, Mem[0000000020800000] = 0000c3ca, %asi = 80
	stha	%l0,[%o1+0x000]%asi	! Mem[0000000020800000] = 00ffc3ca
!	%l0 = 00000000000000ff, Mem[0000000010001410] = ff1665ff
	stba	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = ff1665ff
!	%l3 = 00000000ff000000, Mem[0000000030081410] = 00000000
	stha	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	%l2 = ff000000ff000000, Mem[0000000010001418] = ffff000000ff0000, %asi = 80
	stxa	%l2,[%i0+0x018]%asi	! Mem[0000000010001418] = ff000000ff000000
!	Mem[0000000010181410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101408] = 00000000, %l0 = 00000000000000ff
	swapa	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010001408] = 0000d0d0 ffffff00
	stda	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000 00000000
!	%l7 = 0000000000ffffff, Mem[00000000100c1408] = ff0000ff00000000, %asi = 80
	stxa	%l7,[%i3+0x008]%asi	! Mem[00000000100c1408] = 0000000000ffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 1023d0ff, %l0 = 0000000000000000
	ldsba	[%i1+%o4]0x88,%l0	! %l0 = ffffffffffffffff

p0_label_485:
!	Mem[0000000010181408] = 00000000, %l7 = 0000000000ffffff
	ldsba	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l3 = 00000000ff000000
	lduha	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081408] = 00000000, %l6 = ff0000ff00000000
	ldswa	[%i2+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181408] = ff000000, %l0 = ffffffffffffffff
	ldsba	[%i6+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141410] = 00000000, %l0 = ffffffffffffffff
	lduwa	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %l0 = 0000000000000000
	lduba	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081410] = 000000c4, %f0  = 80000000
	lda	[%i2+%o5]0x80,%f0 	! %f0 = 000000c4
!	Mem[0000000010141428] = 000000ff00000000, %l1 = 0000000000000000
	ldxa	[%i5+0x028]%asi,%l1	! %l1 = 000000ff00000000
!	Mem[0000000010041408] = ffd02310, %l3 = 0000000000000000
	ldswa	[%i1+%o4]0x80,%l3	! %l3 = ffffffffffd02310
!	Starting 10 instruction Store Burst
!	%l2 = ff000000, %l3 = ffd02310, Mem[0000000030101410] = 00000000 ffffffff
	stda	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = ff000000 ffd02310

p0_label_486:
!	Mem[0000000030141410] = d0d00000, %l2 = ff000000ff000000
	swapa	[%i5+%o5]0x89,%l2	! %l2 = 00000000d0d00000
!	Mem[0000000010001408] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i0+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	%l3 = ffffffffffd02310, Mem[0000000010041400] = 00000000, %asi = 80
	stwa	%l3,[%i1+0x000]%asi	! Mem[0000000010041400] = ffd02310
!	%f8  = 80000000 00000000, Mem[00000000300c1408] = 00000000 ff000000
	stda	%f8 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = 80000000 00000000
!	Mem[0000000010041408] = ffd02310, %l0 = 0000000000000000
	ldstuba	[%i1+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	%l4 = 0000000000000000, Mem[0000000030041400] = ff000000
	stha	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = ff000000
!	Mem[00000000100c1410] = 00000080, %l2 = 00000000d0d00000
	swapa	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000080
!	Mem[0000000030181400] = 00f100ff, %l0 = 00000000000000ff
	swapa	[%i6+%g0]0x89,%l0	! %l0 = 0000000000f100ff
!	%f18 = 00000000 00000000, Mem[0000000030041410] = ff0000ff 00000000
	stda	%f18,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ff0000ff 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i2+%o5]0x89,%l6	! %l6 = 0000000000000000 00000000ff0000ff

p0_label_487:
!	Mem[0000000030081400] = ff000000, %l4 = 0000000000000000
	ldsha	[%i2+%g0]0x81,%l4	! %l4 = ffffffffffffff00
!	Mem[000000001010142c] = d0d02310, %l6 = 0000000000000000
	ldsw	[%i4+0x02c],%l6		! %l6 = ffffffffd0d02310
!	Mem[0000000030001400] = 00000000 00000000, %l0 = 00f100ff, %l1 = 00000000
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010141400] = 00ff0046, %l3 = ffffffffffd02310
	lduba	[%i5+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1410] = 00000000 d0d00000, %l4 = ffffff00, %l5 = ff0000ff
	ldda	[%i3+%o5]0x88,%l4	! %l4 = 00000000d0d00000 0000000000000000
!	Mem[0000000010041410] = 000000ff, %l6 = ffffffffd0d02310
	ldsba	[%i1+%o5]0x88,%l6	! %l6 = ffffffffffffffff
!	%f12 = 00000000 fffffacf, %f28 = 00000000 00000000
	fdtox	%f12,%f28		! %l0 = 0000000000000022, Unfinished, %fsr = 0a00000400
!	Mem[0000000010141410] = 00000000, %l5 = 0000000000000000
	ldsha	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101430] = 00000000, %l4 = 00000000d0d00000
	lduba	[%i4+0x033]%asi,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = ff000000, %l6 = ffffffffffffffff
	swapa	[%i6+%g0]0x81,%l6	! %l6 = 00000000ff000000

p0_label_488:
!	Mem[0000000010041410] = 000000ff, %l2 = 0000000000000080
	ldstuba	[%i1+%o5]0x88,%l2	! %l2 = 000000ff000000ff
!	%f4  = 00000000 c4000000, Mem[0000000030141408] = 000000ff 00000000
	stda	%f4 ,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000 c4000000
!	Mem[0000000010181400] = ff5d3746, %l5 = 0000000000000000
	ldstuba	[%i6+%g0]0x80,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030181408] = ff000000, %l7 = 00000000ff0000ff
	swapa	[%i6+%o4]0x81,%l7	! %l7 = 00000000ff000000
!	Mem[0000000010141410] = 00000000, %l0 = 0000000000000022
	swapa	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010101408] = ff000000
	stha	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	Mem[0000000010001408] = 000000ff, %l0 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[00000000100c1434] = 00000000, %asi = 80
	stha	%l2,[%i3+0x034]%asi	! Mem[00000000100c1434] = 00ff0000
!	Mem[0000000010181408] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i6+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 0000000000ffffff, %f18 = 00000000 00000000
	ldda	[%i3+%o4]0x80,%f18	! %f18 = 00000000 00ffffff

p0_label_489:
!	Mem[00000000100c1410] = 0000d0d0, %l5 = 00000000000000ff
	lduwa	[%i3+%o5]0x80,%l5	! %l5 = 000000000000d0d0
!	Mem[0000000010181418] = 00000000, %l5 = 000000000000d0d0
	ldsba	[%i6+0x018]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = ff5d3746, %l5 = 0000000000000000
	ldsba	[%i6+%g0]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030001400] = 00000000, %l2 = 0000000000000000
	lduba	[%i0+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1420] = 00ff00ff 000000ff, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i3+0x020]%asi,%l0	! %l0 = 0000000000ff00ff 00000000000000ff
!	Mem[00000000100c1408] = ffffff0000000000, %l5 = ffffffffffffffff
	ldxa	[%i3+%o4]0x88,%l5	! %l5 = ffffff0000000000
!	Mem[0000000030001400] = 00000000, %l0 = 0000000000ff00ff
	lduba	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041410] = 00000000000000ff, %f22 = ffffffff ffffff00
	ldda	[%i1+%o5]0x88,%f22	! %f22 = 00000000 000000ff
!	Mem[00000000300c1408] = 80000000, %l2 = 0000000000000000
	lduha	[%i3+%o4]0x81,%l2	! %l2 = 0000000000008000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = c4000000, %l2 = 0000000000008000
	ldstuba	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000ff

p0_label_490:
!	%f13 = fffffacf, %f12 = 00000000, %f6  = 00000000 00ffffff
	fsmuld	%f13,%f12,%f6 		! %f6  = ffffff59 e0000000
!	%l5 = ffffff0000000000, Mem[0000000030041408] = ffffffff
	stha	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000ffff
!	%f4  = 00000000, Mem[0000000010101400] = 00000040
	sta	%f4 ,[%i4+0x000]%asi	! Mem[0000000010101400] = 00000000
!	Mem[00000000300c1410] = 00000000, %l7 = 00000000ff000000
	swapa	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l7 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101408] = 000000ff, %l5 = ffffff0000000000
	swapa	[%i4+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%f6  = ffffff59 e0000000, Mem[0000000010101400] = 00000000 46375da6
	stda	%f6 ,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffff59 e0000000
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000030101408] = 00000000 000000ff
	stda	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 000000ff
!	%l4 = 0000000000000000, Mem[0000000030141408] = ff0000c400000000
	stxa	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 000000ff, %l2 = 0000000000000000
	ldsba	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000000

p0_label_491:
!	Mem[0000000020800040] = 0000bf87, %l1 = 00000000000000ff
	ldsb	[%o1+0x041],%l1		! %l1 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l7 = 0000000000000000
	ldsba	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = ff000000, %l2 = 0000000000000000
	lduha	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000
!	%f30 = ffffffff, %f8  = 80000000, %f16 = 0000d0d0
	fsubs	%f30,%f8 ,%f16		! %f16 = ffffffff
!	%l1 = 0000000000000000, %l4 = 0000000000000000, %y  = 00000726
	udiv	%l1,%l4,%l5		! Div by zero, %l0 = 0000000000000050
	mov	%l0,%y			! %y = 00000028
!	Mem[0000000030101408] = 00000000, %l0 = 0000000000000028
	lduba	[%i4+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141410] = 000000ffffffffff, %f18 = 00000000 00ffffff
	ldda	[%i5+%o5]0x81,%f18	! %f18 = 000000ff ffffffff
!	Mem[0000000030101408] = 00000000, %l3 = 0000000000000000
	lduha	[%i4+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081408] = ff000000, %l6 = 00000000ff000000
	ldsba	[%i2+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f7  = e0000000, Mem[0000000030081410] = 00000000
	sta	%f7 ,[%i2+%o5]0x81	! Mem[0000000030081410] = e0000000

p0_label_492:
!	%l0 = 0000000000000000, Mem[0000000010181410] = 000000ff
	stha	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	Mem[0000000021800181] = 66ff8f81, %l0 = 0000000000000000
	ldstub	[%o3+0x181],%l0		! %l0 = 000000ff000000ff
!	Mem[0000000010081430] = ffffffff00000000, %l4 = 0000000000000000, %l5 = 00000000000000ff
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l4,%l5	! %l5 = ffffffff00000000
!	%l6 = 0000000000000000, Mem[0000000010101418] = 00000000, %asi = 80
	stwa	%l6,[%i4+0x018]%asi	! Mem[0000000010101418] = 00000000
!	Mem[0000000030001400] = 00000000, %l7 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	%l5 = ffffffff00000000, Mem[0000000010101408] = 00000000
	stha	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	Mem[00000000100c1400] = 1a7af441, %l4 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l4	! %l4 = 000000001a7af441
!	%f21 = ff0000ff, Mem[0000000010001438] = ff000000
	sta	%f21,[%i0+0x038]%asi	! Mem[0000000010001438] = ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 4600ff00, %l6 = 0000000000000000
	ldsha	[%i5+%g0]0x88,%l6	! %l6 = ffffffffffffff00

p0_label_493:
!	%l0 = 00000000000000ff, %l4 = 000000001a7af441, %l2 = 0000000000000000
	and	%l0,%l4,%l2		! %l2 = 0000000000000041
!	Mem[0000000010141410] = 00000022, %l5 = ffffffff00000000
	lduha	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141400] = 4600ff00, %l5 = 0000000000000000
	lduha	[%i5+%g0]0x88,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030041408] = 0000ffff, %f26 = 00000000
	lda	[%i1+%o4]0x81,%f26	! %f26 = 0000ffff
!	Mem[0000000010081414] = 00000000, %l4 = 000000001a7af441
	lduw	[%i2+0x014],%l4		! %l4 = 0000000000000000
!	Mem[0000000020800000] = 00ffc3ca, %l0 = 00000000000000ff
	ldub	[%o1+0x001],%l0		! %l0 = 00000000000000ff
!	Mem[00000000100c1408] = 00000000, %l2 = 0000000000000041
	ldsha	[%i3+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = 00000000 1023d0ff, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 000000001023d0ff 0000000000000000
!	Mem[000000001018140c] = 000000ff, %l7 = 0000000000000000
	lduh	[%i6+0x00c],%l7		! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = ffffff00, %l7 = 00000000, Mem[00000000300c1400] = a6000000 00000000
	stda	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffff00 00000000

p0_label_494:
!	Mem[0000000010001400] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[00000000300c1400] = 0000000000ffffff
	stxa	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000000000000
!	%l4 = 00000000, %l5 = 0000ff00, Mem[0000000010181438] = 00000000 00000000
	stda	%l4,[%i6+0x038]%asi	! Mem[0000000010181438] = 00000000 0000ff00
!	Mem[0000000030101408] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041410] = 00000000, %l5 = 000000000000ff00
	swapa	[%i1+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041438] = ff000000, %l6 = ffffffffffffff00, %asi = 80
	swapa	[%i1+0x038]%asi,%l6	! %l6 = 00000000ff000000
!	%l6 = 00000000ff000000, Mem[0000000010101410] = ff0000ff
	stba	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = ff000000
!	%l4 = 00000000, %l5 = 00000000, Mem[00000000100c1400] = 00000000 000000ff
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 00000000
!	Mem[00000000211c0000] = 00fffcae, %l0 = 000000001023d0ff
	ldstuba	[%o2+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000ffff0000, %f10 = 00ffffff ff000000
	ldda	[%i1+%o4]0x89,%f10	! %f10 = 00000000 ffff0000

p0_label_495:
!	Mem[0000000010081408] = ff000000, %l0 = 0000000000000000
	lduba	[%i2+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181434] = 000000ff, %l1 = 0000000000000000
	ldsw	[%i6+0x034],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010041410] = ff000000, %l0 = 0000000000000000
	lduwa	[%i1+%o5]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030041400] = 000000ff ffffff8b, %l0 = ff000000, %l1 = 000000ff
	ldda	[%i1+%g0]0x81,%l0	! %l0 = 00000000000000ff 00000000ffffff8b
!	%f20 = 00000000, %f15 = 00000000
	fcmpes	%fcc1,%f20,%f15		! %fcc1 = 0
!	Mem[0000000010101410] = 000000ff00000000, %f24 = 41f47a1a 00000000
	ldd	[%i4+%o5],%f24		! %f24 = 000000ff 00000000
!	Mem[0000000030041410] = 0000ff00, %l4 = 0000000000000000
	ldsha	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = 000000e0, %l0 = 00000000000000ff
	lduha	[%i2+%o5]0x89,%l0	! %l0 = 00000000000000e0
!	Mem[0000000020800000] = 00ffc3ca, %l5 = 0000000000000000
	ldsb	[%o1+%g0],%l5		! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 00000000, %l6 = 00000000ff000000
	swapa	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000

p0_label_496:
!	%f8  = 80000000, Mem[00000000100c1434] = 00ff0000
	st	%f8 ,[%i3+0x034]	! Mem[00000000100c1434] = 80000000
!	%l7 = 0000000000000000, Mem[00000000300c1400] = 00000000
	stba	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010101408] = 0000000023100000
	stx	%l6,[%i4+%o4]		! Mem[0000000010101408] = 0000000000000000
!	Mem[0000000020800001] = 00ffc3ca, %l2 = 0000000000000000
	ldstub	[%o1+0x001],%l2		! %l2 = 000000ff000000ff
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010181430] = e0000000 000000ff
	stda	%l6,[%i6+0x030]%asi	! Mem[0000000010181430] = 00000000 00000000
!	%f6  = ffffff59, Mem[0000000030041410] = 0000ff00
	sta	%f6 ,[%i1+%o5]0x81	! Mem[0000000030041410] = ffffff59
!	Mem[0000000010081430] = ffffffff, %l0 = 000000e0, %l2 = 000000ff
	add	%i2,0x30,%g1
	casa	[%g1]0x80,%l0,%l2	! %l2 = 00000000ffffffff
!	%f0  = 000000c4, Mem[0000000030041408] = ffff0000
	sta	%f0 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000c4
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010181410] = 00000000 00000000
	stda	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00000000, %l2 = 00000000ffffffff
	swapa	[%i4+%g0]0x89,%l2	! %l2 = 0000000000000000

p0_label_497:
!	Mem[00000000100c1400] = 00000000, %l3 = 0000000000000000
	lduwa	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %l0 = 00000000000000e0
	lduba	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800000] = 00ffc3ca, %l5 = 0000000000000000
	ldsb	[%o1+%g0],%l5		! %l5 = 0000000000000000
!	Mem[0000000030001408] = 000000ff, %l7 = 0000000000000000
	lduwa	[%i0+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141408] = 00000000, %l2 = 0000000000000000
	lduha	[%i5+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = 4600ff00, %l5 = 0000000000000000
	lduha	[%i5+%g0]0x88,%l5	! %l5 = 000000000000ff00
	membar	#Sync			! Added by membar checker (91)
!	Mem[0000000010141400] = 00ff0046 00000000 d0000000 00000000
!	Mem[0000000010141410] = 00000022 00000000 ffffff00 00000000
!	Mem[0000000010141420] = ff0000ff 00000000 000000ff 00000000
!	Mem[0000000010141430] = ffff00ff 00000000 000000ff d0ff3eff
	ldda	[%i5]ASI_BLK_P,%f16	! Block Load from 0000000010141400
!	Mem[0000000010081408] = ff000000, %l1 = 00000000ffffff8b
	lduha	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = d0d00000, %l1 = 0000000000000000
	ldsba	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f6  = ffffff59 e0000000, %l6 = 0000000000000000
!	Mem[0000000030001418] = 35b82ab965a46210
	add	%i0,0x018,%g1
	stda	%f6,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030001418] = 35b82ab965a46210

p0_label_498:
!	Mem[0000000020800001] = 00ffc3ca, %l1 = 0000000000000000
	ldstub	[%o1+0x001],%l1		! %l1 = 000000ff000000ff
!	Mem[0000000010141410] = 22000000, %l6 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l6	! %l6 = 0000000022000000
!	%f14 = 00000000 00000000, %l4 = 0000000000000000
!	Mem[0000000030001418] = 35b82ab965a46210
	add	%i0,0x018,%g1
	stda	%f14,[%g1+%l4]ASI_PST16_S ! Mem[0000000030001418] = 35b82ab965a46210
!	%f4  = 00000000 c4000000, %l3 = 0000000000000000
!	Mem[0000000030001400] = 0000000000000000
	stda	%f4,[%i0+%l3]ASI_PST32_S ! Mem[0000000030001400] = 0000000000000000
!	%f6  = ffffff59, Mem[00000000100c1410] = 0000d0d0
	st	%f6 ,[%i3+%o5]		! Mem[00000000100c1410] = ffffff59
!	Mem[00000000300c1408] = 80000000, %l6 = 0000000022000000
	ldstuba	[%i3+%o4]0x81,%l6	! %l6 = 00000080000000ff
!	Mem[0000000010181408] = ff000000, %l5 = 000000000000ff00
	swapa	[%i6+%o4]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[0000000020800040] = 0000bf87, %l7 = 00000000000000ff
	ldstuba	[%o1+0x040]%asi,%l7	! %l7 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010181418] = 00000000
	stw	%l4,[%i6+0x018]		! Mem[0000000010181418] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141414] = 00000000, %f14 = 00000000
	lda	[%i5+0x014]%asi,%f14	! %f14 = 00000000

p0_label_499:
!	Mem[0000000010181408] = 0000ff00, %l3 = 0000000000000000
	ldsh	[%i6+%o4],%l3		! %l3 = 0000000000000000
!	%l5 = 00000000ff000000, Mem[0000000030141400] = ff000000
	stha	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	Mem[0000000030141408] = 00000000, %l7 = 0000000000000000
	ldswa	[%i5+%o4]0x89,%l7	! %l7 = 0000000000000000
!	%l4 = 0000000000000000, imm = fffffffffffff71f, %l4 = 0000000000000000
	or	%l4,-0x8e1,%l4		! %l4 = fffffffffffff71f
!	Mem[0000000030081408] = 00000000, %l2 = 0000000000000000
	lduwa	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141410] = 000000ff ffffffff, %l4 = fffff71f, %l5 = ff000000
	ldda	[%i5+%o5]0x81,%l4	! %l4 = 00000000000000ff 00000000ffffffff
!	Mem[0000000030041408] = 000000c4, %l1 = 00000000000000ff
	ldswa	[%i1+%o4]0x89,%l1	! %l1 = 00000000000000c4
!	Mem[0000000010101400] = e0000000, %l5 = 00000000ffffffff
	lduha	[%i4+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0000] = ffd08819, %l4 = 00000000000000ff
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = ffffffffffffffd0
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 00000000, %l5 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l5	! %l5 = 0000000000000000

p0_label_500:
!	Mem[0000000030041408] = c4000000, %l4 = ffffffffffffffd0
	ldstuba	[%i1+%o4]0x81,%l4	! %l4 = 000000c4000000ff
!	%f7  = e0000000, Mem[0000000010101430] = 00000000
	st	%f7 ,[%i4+0x030]	! Mem[0000000010101430] = e0000000
!	Code Fragment 3
p0_fragment_54:
!	%l0 = 0000000000000000
	setx	0x2cb07ec7e22382ff,%g7,%l0 ! %l0 = 2cb07ec7e22382ff
!	%l1 = 00000000000000c4
	setx	0xb201686fd6c1877d,%g7,%l1 ! %l1 = b201686fd6c1877d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2cb07ec7e22382ff
	setx	0xbcf2c367d36e247d,%g7,%l0 ! %l0 = bcf2c367d36e247d
!	%l1 = b201686fd6c1877d
	setx	0xf95cf0dffb468c4a,%g7,%l1 ! %l1 = f95cf0dffb468c4a
!	Mem[0000000010141408] = 000000d0, %l1 = f95cf0dffb468c4a
	ldstuba	[%i5+%o4]0x88,%l1	! %l1 = 000000d0000000ff
!	%l3 = 0000000000000000, Mem[0000000030141400] = e000000000000000
	stxa	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000000
!	%f12 = 00000000 fffffacf, Mem[0000000030141410] = ff000000 ffffffff
	stda	%f12,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000 fffffacf
!	Mem[0000000010041400] = ffd02310, %l4 = 00000000000000c4
	ldstuba	[%i1+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000020800000] = 00ffc3ca
	sth	%l3,[%o1+%g0]		! Mem[0000000020800000] = 0000c3ca
!	Mem[00000000201c0001] = ffd08819, %l4 = 00000000000000ff
	ldstub	[%o0+0x001],%l4		! %l4 = 000000d0000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %l4 = 00000000000000d0
	ldswa	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000000

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

1:	membar	#Sync			! Force all stores to complete


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be bcf2c367d36e247d
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 00000000000000d0
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000080
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x00000028,%g2
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
	cmp	%l0,%l1			! %f0  should be 000000c4 00000000
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 000000ff 00000000
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00000000 c4000000
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be ffffff59 e0000000
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 80000000 00000000
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000000 ffff0000
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 00000000 fffffacf
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 00000000 00000000
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00ff0046 00000000
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be d0000000 00000000
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00000022 00000000
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be ffffff00 00000000
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be ff0000ff 00000000
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 000000ff 00000000
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be ffff00ff 00000000
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 000000ff d0ff3eff
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
	.word	0xbcf2c367,0xd36e247d
	.word	0x00000000,0x000000d0
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000080
	.word	0x00000000,0x00000000
p0_expected_fp_regs:
	.word	0x000000c4,0x00000000
	.word	0x000000ff,0x00000000
	.word	0x00000000,0xc4000000
	.word	0xffffff59,0xe0000000
	.word	0x80000000,0x00000000
	.word	0x00000000,0xffff0000
	.word	0x00000000,0xfffffacf
	.word	0x00000000,0x00000000
	.word	0x00ff0046,0x00000000
	.word	0xd0000000,0x00000000
	.word	0x00000022,0x00000000
	.word	0xffffff00,0x00000000
	.word	0xff0000ff,0x00000000
	.word	0x000000ff,0x00000000
	.word	0xffff00ff,0x00000000
	.word	0x000000ff,0xd0ff3eff
	.word	0x00000008,0x00000400		! %fsr = 0000000800000400
p0_local0_expect:
	.word	0xff000000,0x000000ff
	.word	0x00000000,0x00000000
	.word	0xff6516ff,0x5200ffff
	.word	0xff000000,0xff000000
	.word	0xfff3f100,0x00d00000
	.word	0xff000000,0xff000000
	.word	0x000000ff,0x00000000
	.word	0xff0000ff,0xfffffacf
p0_local0_sec_expect:
	.word	0x00000000,0x00000000
	.word	0xff000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x35b82ab9,0x65a46210
	.word	0x0aff5a26,0xa65d3746
	.word	0xf9a45e93,0x9a50300e
	.word	0xe0776e03,0x1023d0d0
	.word	0x02ac1e89,0x2d72a12c
p0_local1_expect:
	.word	0xffd02310,0x20f1f32e
	.word	0xffd02310,0x00000000
	.word	0xff000000,0x00000000
	.word	0xff000000,0x000000ff
	.word	0x7fffffff,0x00000000
	.word	0xff000000,0x000000ff
	.word	0x00000000,0x0aff5a26
	.word	0xffffff00,0x000000ff
p0_local1_sec_expect:
	.word	0x000000ff,0xffffff8b
	.word	0xff000000,0x00000000
	.word	0xffffff59,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x1a7af441
	.word	0x00000000,0x00000000
	.word	0x00000000,0xff00ffff
	.word	0xffffffff,0xffffffff
p0_local2_expect:
	.word	0x00000000,0xff000000
	.word	0x000000ff,0x00000000
	.word	0x000000c4,0x00000000
	.word	0x00000000,0x5a007396
	.word	0x44000000,0x00000000
	.word	0xff000000,0x000000ff
	.word	0xffffffff,0x00000000
	.word	0x00000000,0x00000000
p0_local2_sec_expect:
	.word	0xff000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xe0000000,0xff0000ff
	.word	0xffffffff,0xffffff00
	.word	0x41f47a1a,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xa6000000
p0_local3_expect:
	.word	0x00000000,0x00000000
	.word	0xff000000,0x00ffffff
	.word	0xffffff59,0x00000000
	.word	0xff000000,0x000000ff
	.word	0x00ff00ff,0x000000ff
	.word	0x8e7b9bc2,0x00ffffff
	.word	0x00000000,0x80000000
	.word	0x00006e03,0xff5a0000
p0_local3_sec_expect:
	.word	0x00000000,0x00000000
	.word	0xff000000,0x00000000
	.word	0xff000000,0xa15a0000
	.word	0x000000a1,0x5a007396
	.word	0x8b6516ff,0x5200ffff
	.word	0x2ef3f120,0x00005aa1
	.word	0xff000000,0x000000ff
	.word	0x0affffae,0xf50000ff
p0_local4_expect:
	.word	0x000000e0,0x59ffffff
	.word	0x00000000,0x00000000
	.word	0x000000ff,0x00000000
	.word	0x00000000,0x00000000
	.word	0xffff0052,0xff16658b
	.word	0x00000000,0xd0d02310
	.word	0xe0000000,0x00000000
	.word	0x00000000,0x0000ff00
p0_local4_sec_expect:
	.word	0xffffffff,0x00000000
	.word	0xff000000,0xff000000
	.word	0x000000ff,0x1023d0ff
	.word	0x00000000,0x00000000
	.word	0x0aff5a26,0xa65d3746
	.word	0xa65d3746,0x00000000
	.word	0xe0776e03,0x1023d0d0
	.word	0x02ac1e89,0x2d72a12c
p0_local5_expect:
	.word	0x00ff0046,0x00000000
	.word	0xff000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xffffff00,0x00000000
	.word	0xff0000ff,0x00000000
	.word	0x000000ff,0x00000000
	.word	0xffff00ff,0x00000000
	.word	0x000000ff,0xd0ff3eff
p0_local5_sec_expect:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xcffaffff,0x00000000
	.word	0x00000000,0x00000000
	.word	0x0aff5a26,0xa65d3746
	.word	0xa65d3746,0x00000000
	.word	0x000000ff,0x00000000
	.word	0x02ac1e89,0x2d72a12c
p0_local6_expect:
	.word	0xff5d3746,0x00000000
	.word	0x0000ff00,0x000000ff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x0000ff00
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x0000ff00
p0_local6_sec_expect:
	.word	0xffffffff,0x00ffffff
	.word	0xff0000ff,0x00000000
	.word	0x00000000,0xff000000
	.word	0x35b82ab9,0xff006210
	.word	0x0aff5a26,0x000000ff
	.word	0xf9a45e93,0x9a50300e
	.word	0xff0000f5,0xffffffff
	.word	0x00002ab9,0x65a46210
share0_expect:
	.word	0xffff8819,0xa3030399
	.word	0x68a22cb6,0x0eb90485
	.word	0x1fb8a583,0xae6bfafc
	.word	0x260925ff,0x6e8e3eaa
	.word	0x55807531,0x5a32786b
	.word	0xc297b2c0,0xe81a827b
	.word	0x953f103e,0xd7c32df2
	.word	0x61441bdf,0x6fad8b3b
share1_expect:
	.word	0x0000c3ca,0x374e00aa
	.word	0x694292e3,0xe3e3b1ce
	.word	0x16e0af08,0x8e89d632
	.word	0x1439bfb4,0x74f11ea8
	.word	0x0316a567,0x70dc2130
	.word	0xba59a625,0x444d8e72
	.word	0xe6bcf87c,0xbee3e477
	.word	0x5be9f90c,0x9fdaa5b4
	.word	0xff00bf87,0xb8090156
	.word	0x9fbf602d,0xdc29cbb0
	.word	0x3ca6ce6f,0x9703f93c
	.word	0x1289dd9f,0x89a99409
	.word	0xc74db418,0x4e26662e
	.word	0x002dec24,0x046517e0
	.word	0x06044324,0x249b161c
	.word	0x77c3ae0b,0x478f72a6
share2_expect:
	.word	0xfffffcae,0x0b4956fd
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
	.word	0xff9c7f92,0x114c7eb3
	.word	0x05d04470,0x85ca9b6f
	.word	0xd0f2cf3d,0x8e175b7f
	.word	0x43cd90d0,0x1e8e02e8
	.word	0xdaed4897,0x300420f0
	.word	0x10757ff8,0xbac61ea0
	.word	0x9911a27b,0x2f69bcfa
	.word	0x76a9b077,0x444d25f2
	.word	0xffff0203,0xe5a0ea43
	.word	0x2345baa4,0x96ab6c12
	.word	0xcffbab67,0x89240a79
	.word	0x17625059,0x867bb106
	.word	0x4e41f634,0x631690fd
	.word	0xdf6469b0,0x614500e2
	.word	0xca5655fb,0x36799205
	.word	0xa31b1db3,0x5f075d3d
	.word	0x00ffdddc,0x5d98a5aa
	.word	0x240c9e52,0x6ad43601
	.word	0x81a4db6e,0xcf92d3f1
	.word	0x39966afc,0x738d6c18
	.word	0xf9cb738e,0x32c5fe5d
	.word	0x0c1a0a92,0x56176a8a
	.word	0x7287af7d,0x9debf401
	.word	0x3e7aff06,0xe75f6e66
	.word	0xffffa03e,0xe6e27e03
	.word	0x8079294d,0x12ef38ea
	.word	0x675fdc3f,0xf93c55e2
	.word	0x70a03d93,0x8a3c388b
	.word	0x4de01aaf,0x4636db00
	.word	0x1e0cb549,0x7f1a5090
	.word	0x4c9f1c19,0xc23c2476
	.word	0x93f34a8f,0xaab60181
	.word	0x7f003eed,0xf3c05c3d
	.word	0x55a53cc9,0xd9fef715
	.word	0xf167cb44,0xd6238283
	.word	0x49edb332,0xd96ff079
	.word	0x17fc00d7,0x3c169f63
	.word	0x7d159c83,0x923c73a6
	.word	0x19e9ca44,0xe8ecd0bb
	.word	0x0b5d5679,0xc7d2cea0
	.word	0x66ff8f81,0x99e491c0
	.word	0x433bf246,0xaa97f712
	.word	0x93d36dcc,0x9a25a821
	.word	0x20686983,0x25c9fd80
	.word	0x828cff73,0xed83e55b
	.word	0xb2fb1bd7,0x8c3ad5b2
	.word	0x5b88607e,0x32eb9baf
	.word	0x4e453c8a,0xf0f1fb7d
	.word	0xffd8186d,0x7a2503d5
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
