/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_500_2.s
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
!	Seed = 327141851
!	Riesling can be on
!	1 Thread, 500 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_500_2.s created on Mar 27, 2009 (14:18:51)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_500_2 -p 1 -l 500

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
!	%f0  = d9ba90ac a0728117 bfc25ba5 ec61e5c6
!	%f4  = e943b5c4 1cb13fbb aa2bcf4c 0acd682e
!	%f8  = fd46d6d1 cd28d31f 25965c3b c48f7312
!	%f12 = e14df3e8 f9f0ef0d a965791d 9a032802
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 746c16f9 6fa1352a 9f036284 de930b18
!	%f20 = 7070cc2c 615177bb 9920f412 89385b71
!	%f24 = b7552aba e7546c94 992ee4cc 298b3929
!	%f28 = 8aac0410 263fbd6e ec9086a7 50bdced7
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 929d9c0a 9a8b861f 93b77452 84db3f96
!	%f36 = 74ea536a d7f48357 487a869b 48dc41bf
!	%f40 = 0dab6079 779d9e8b 44dff6fa 6fb3dbb9
!	%f44 = 2134da4a 89ea7d38 64cea8f8 fdde4d12
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x9f57319000000003,%g7,%g1 ! GSR scale =  0, align = 3
	wr	%g1,%g0,%gsr		! GSR = 9f57319000000003
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[00000000100c1434] = 723348cb, %l1 = f170e958795e5134
	lduw	[%i3+0x034],%l1		! %l1 = 00000000723348cb
!	Mem[0000000030181408] = ad1f5674, %l5 = 1ed02e6a9ee40797
	swapa	[%i6+%o4]0x89,%l5	! %l5 = 00000000ad1f5674
!	Mem[0000000030081408] = 665125c1, %l5 = 00000000ad1f5674
	ldsba	[%i2+%o4]0x89,%l5	! %l5 = ffffffffffffffc1
!	Mem[0000000010181408] = 12fe536d, %l7 = 94666e52ab567b94
	swapa	[%i6+%o4]0x88,%l7	! %l7 = 0000000012fe536d
!	Mem[0000000030081410] = e2f7a4ed, %l4 = 97dcfd187e9c6b66
	swapa	[%i2+%o5]0x89,%l4	! %l4 = 00000000e2f7a4ed
!	%f26 = 992ee4cc 298b3929, Mem[0000000010081408] = c841a952 cc56c357
	stda	%f26,[%i2+%o4]0x88	! Mem[0000000010081408] = 992ee4cc 298b3929
!	Mem[000000001004141c] = cd11cf1c, %l1 = 00000000723348cb
	ldsha	[%i1+0x01e]%asi,%l1	! %l1 = ffffffffffffcf1c
!	Mem[00000000201c0000] = 388d387c, %l7 = 0000000012fe536d
	lduh	[%o0+%g0],%l7		! %l7 = 000000000000388d
!	%f29 = 263fbd6e, Mem[0000000010141428] = 8a235de6
	st	%f29,[%i5+0x028]	! Mem[0000000010141428] = 263fbd6e
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffcf1c, Mem[0000000030041400] = 4d6d9ebd
	stha	%l1,[%i1+%g0]0x89	! Mem[0000000030041400] = 4d6dcf1c

p0_label_2:
!	%l0 = 7138cabc5d96979e, Mem[000000001010142c] = 1dd38acf, %asi = 80
	stha	%l0,[%i4+0x02c]%asi	! Mem[000000001010142c] = 979e8acf
!	%f26 = 992ee4cc, Mem[0000000030101400] = 80b0b2a0
	sta	%f26,[%i4+%g0]0x89	! Mem[0000000030101400] = 992ee4cc
!	%f15 = 9a032802, Mem[0000000030181410] = e9d1d1a0
	sta	%f15,[%i6+%o5]0x81	! Mem[0000000030181410] = 9a032802
!	%f19 = de930b18, Mem[0000000010081408] = 29398b29
	sta	%f19,[%i2+%o4]0x80	! Mem[0000000010081408] = de930b18
!	Mem[00000000300c1410] = fd7e2db4, %l7 = 000000000000388d
	swapa	[%i3+%o5]0x81,%l7	! %l7 = 00000000fd7e2db4
!	Code Fragment 4
p0_fragment_1:
!	%l0 = 7138cabc5d96979e
	setx	0x9158d06f8bb96617,%g7,%l0 ! %l0 = 9158d06f8bb96617
!	%l1 = ffffffffffffcf1c
	setx	0x604091a02863a9c5,%g7,%l1 ! %l1 = 604091a02863a9c5
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9158d06f8bb96617
	setx	0xe3fd652f955917f7,%g7,%l0 ! %l0 = e3fd652f955917f7
!	%l1 = 604091a02863a9c5
	setx	0xa3674658032fde94,%g7,%l1 ! %l1 = a3674658032fde94
!	%l1 = a3674658032fde94, Mem[0000000010181400] = 1a5688df
	stha	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = de9488df
!	%l0 = e3fd652f955917f7, Mem[0000000010041400] = af8baadd
	stwa	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 955917f7
!	%l0 = 955917f7, %l1 = 032fde94, Mem[0000000010101410] = c9b8d136 79dc8aad
	std	%l0,[%i4+%o5]		! Mem[0000000010101410] = 955917f7 032fde94
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1438] = 2615d42c82f372d7, %f12 = e14df3e8 f9f0ef0d
	ldda	[%i3+0x038]%asi,%f12	! %f12 = 2615d42c 82f372d7

p0_label_3:
!	Mem[00000000100c1410] = b1c10095, %l7 = 00000000fd7e2db4
	lduha	[%i3+%o5]0x80,%l7	! %l7 = 000000000000b1c1
!	Mem[000000001014143c] = 74666f04, %f7  = 0acd682e
	lda	[%i5+0x03c]%asi,%f7 	! %f7 = 74666f04
!	Mem[0000000010001408] = a4e8baf42a304e0b, %l1 = a3674658032fde94
	ldxa	[%i0+%o4]0x88,%l1	! %l1 = a4e8baf42a304e0b
!	Mem[0000000030041400] = 1ccf6d4d, %l1 = a4e8baf42a304e0b
	ldswa	[%i1+%g0]0x81,%l1	! %l1 = 000000001ccf6d4d
!	Mem[0000000030041410] = adc26b2ab43d549d, %l5 = ffffffffffffffc1
	ldxa	[%i1+%o5]0x89,%l5	! %l5 = adc26b2ab43d549d
!	Mem[0000000010041418] = d3e78ae6, %f6  = aa2bcf4c
	lda	[%i1+0x018]%asi,%f6 	! %f6 = d3e78ae6
!	Mem[0000000030041400] = 1ccf6d4d, %l4 = 00000000e2f7a4ed
	lduba	[%i1+%g0]0x81,%l4	! %l4 = 000000000000001c
!	Mem[0000000030101400] = 992ee4cc, %l7 = 000000000000b1c1
	lduwa	[%i4+%g0]0x89,%l7	! %l7 = 00000000992ee4cc
!	Mem[0000000030141408] = f5678610, %l2 = 6c54bbafc24715f2
	lduwa	[%i5+%o4]0x89,%l2	! %l2 = 00000000f5678610
!	Starting 10 instruction Store Burst
!	%l6 = 8718ff3e49e485bd, Mem[0000000010101410] = f7175995
	stwa	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 49e485bd

p0_label_4:
!	%l4 = 000000000000001c, Mem[0000000030181400] = d434d1b2
	stha	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = d434001c
!	Mem[0000000010181408] = 947b56ab, %l0 = e3fd652f955917f7
	swapa	[%i6+%o4]0x80,%l0	! %l0 = 00000000947b56ab
!	%l3 = 91f201ca4f78b804, Mem[0000000010101408] = a2cdad68
	stwa	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = 4f78b804
!	%l5 = adc26b2ab43d549d, Mem[00000000211c0000] = 3f17d373, %asi = 80
	stha	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 549dd373
!	%l0 = 00000000947b56ab, Mem[00000000100c1410] = b1c10095fd8329c3
	stxa	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000947b56ab
!	Mem[00000000300c1410] = 8d380000, %l6 = 8718ff3e49e485bd
	swapa	[%i3+%o5]0x89,%l6	! %l6 = 000000008d380000
!	Mem[00000000211c0000] = 549dd373, %l4 = 000000000000001c
	ldstub	[%o2+%g0],%l4		! %l4 = 00000054000000ff
!	%l4 = 00000054, %l5 = b43d549d, Mem[0000000030181408] = 9ee40797 e22f42ab
	stda	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000054 b43d549d
!	%l6 = 8d380000, %l7 = 992ee4cc, Mem[0000000030041400] = 4d6dcf1c ca1e335f
	stda	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 8d380000 992ee4cc
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 71cafb5b, %l6 = 000000008d380000
	ldsha	[%i3+%o4]0x80,%l6	! %l6 = 00000000000071ca

p0_label_5:
!	Mem[00000000300c1410] = bd85e449, %l0 = 00000000947b56ab
	lduha	[%i3+%o5]0x81,%l0	! %l0 = 000000000000bd85
!	Mem[00000000100c1408] = 71cafb5b, %l0 = 000000000000bd85
	lduwa	[%i3+%o4]0x80,%l0	! %l0 = 0000000071cafb5b
!	Mem[0000000030081410] = 666b9c7e b793e110, %l6 = 000071ca, %l7 = 992ee4cc
	ldda	[%i2+%o5]0x81,%l6	! %l6 = 00000000666b9c7e 00000000b793e110
!	Mem[00000000300c1400] = d88da573, %l1 = 000000001ccf6d4d
	ldsha	[%i3+%g0]0x81,%l1	! %l1 = ffffffffffffd88d
!	Mem[0000000021800140] = 4e9767c3, %l3 = 91f201ca4f78b804
	ldub	[%o3+0x140],%l3		! %l3 = 000000000000004e
!	Mem[0000000030141410] = 8a68cac3, %f26 = 992ee4cc
	lda	[%i5+%o5]0x89,%f26	! %f26 = 8a68cac3
!	Mem[0000000010041410] = 4f606bd5, %l5 = adc26b2ab43d549d
	ldswa	[%i1+0x010]%asi,%l5	! %l5 = 000000004f606bd5
!	Mem[0000000030141410] = c3ca688a, %l1 = ffffffffffffd88d
	lduwa	[%i5+%o5]0x81,%l1	! %l1 = 00000000c3ca688a
!	Mem[00000000100c1410] = 00000000, %l1 = 00000000c3ca688a
	lduba	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f8  = fd46d6d1, %f15 = 9a032802, %f18 = 9f036284 de930b18
	fsmuld	%f8 ,%f15,%f18		! %f18 = 42f977c0 04556880

p0_label_6:
!	Mem[0000000030081408] = c1255166, %l2 = 00000000f5678610
	ldstuba	[%i2+%o4]0x81,%l2	! %l2 = 000000c1000000ff
!	Mem[0000000010081400] = d9bbd094, %l5 = 000000004f606bd5
	swapa	[%i2+%g0]0x88,%l5	! %l5 = 00000000d9bbd094
!	%f24 = b7552aba e7546c94, Mem[0000000010181400] = de9488df 5aebd598
	stda	%f24,[%i6+%g0]0x80	! Mem[0000000010181400] = b7552aba e7546c94
!	%l5 = 00000000d9bbd094, Mem[0000000010141400] = bcd4b3b5
	stha	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = d094b3b5
!	Mem[0000000010001408] = 0b4e302a, %l0 = 0000000071cafb5b
	ldstuba	[%i0+%o4]0x80,%l0	! %l0 = 0000000b000000ff
!	Mem[0000000010041410] = d56b604f, %l3 = 000000000000004e
	ldstuba	[%i1+%o5]0x88,%l3	! %l3 = 0000004f000000ff
!	%f30 = ec9086a7 50bdced7, Mem[0000000010001400] = 0d608fe8 a48b5f81
	stda	%f30,[%i0+%g0]0x80	! Mem[0000000010001400] = ec9086a7 50bdced7
!	%f4  = e943b5c4 1cb13fbb, Mem[0000000010001410] = f702d52a 2ee49c4b
	stda	%f4 ,[%i0+%o5]0x88	! Mem[0000000010001410] = e943b5c4 1cb13fbb
!	%l0 = 000000000000000b, Mem[0000000030041408] = 8f5f1956
	stha	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 8f5f000b
!	Starting 10 instruction Load Burst
!	Mem[0000000021800100] = 442b5022, %l6 = 00000000666b9c7e
	ldub	[%o3+0x101],%l6		! %l6 = 000000000000002b

p0_label_7:
!	%f3  = ec61e5c6, %f4  = e943b5c4
	fcmps	%fcc1,%f3 ,%f4 		! %fcc1 = 1
!	Mem[0000000010001408] = a4e8baf4 2a304eff, %l2 = 000000c1, %l3 = 0000004f
	ldda	[%i0+%o4]0x88,%l2	! %l2 = 000000002a304eff 00000000a4e8baf4
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 000000000000000b
	setx	0x004a732825cedb7c,%g7,%l0 ! %l0 = 004a732825cedb7c
!	%l1 = 0000000000000000
	setx	0x58ac142fe57bcc37,%g7,%l1 ! %l1 = 58ac142fe57bcc37
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 004a732825cedb7c
	setx	0xee1d2d9862b19d90,%g7,%l0 ! %l0 = ee1d2d9862b19d90
!	%l1 = 58ac142fe57bcc37
	setx	0x7b1fd89f89a2330a,%g7,%l1 ! %l1 = 7b1fd89f89a2330a
!	Mem[0000000030041410] = 9d543db42a6bc2ad, %f6  = d3e78ae6 74666f04
	ldda	[%i1+%o5]0x81,%f6 	! %f6  = 9d543db4 2a6bc2ad
!	Mem[0000000010081400] = 4f606bd5, %l1 = 7b1fd89f89a2330a
	ldsha	[%i2+%g0]0x88,%l1	! %l1 = 0000000000006bd5
!	Mem[0000000030041408] = 0b005f8f, %l4 = 0000000000000054
	ldsha	[%i1+%o4]0x81,%l4	! %l4 = 0000000000000b00
!	Mem[0000000030041410] = 9d543db4, %l5 = 00000000d9bbd094
	lduwa	[%i1+%o5]0x81,%l5	! %l5 = 000000009d543db4
!	Mem[0000000030181400] = a97d062fd434001c, %l4 = 0000000000000b00
	ldxa	[%i6+%g0]0x89,%l4	! %l4 = a97d062fd434001c
!	Mem[0000000021800140] = 4e9767c3, %l2 = 000000002a304eff
	ldub	[%o3+0x141],%l2		! %l2 = 0000000000000097
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = ff9dd373, %l1 = 0000000000006bd5
	ldstuba	[%o2+0x000]%asi,%l1	! %l1 = 000000ff000000ff

p0_label_8:
!	%l5 = 000000009d543db4, Mem[0000000030101400] = 992ee4cc
	stba	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 992ee4b4
!	%l2 = 0000000000000097, Mem[0000000030181408] = b43d549d00000054
	stxa	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000000000000097
!	%l0 = ee1d2d9862b19d90, Mem[0000000030141400] = 05d777fa0dc3aca5
	stxa	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = ee1d2d9862b19d90
!	%l4 = a97d062fd434001c, Mem[00000000300c1410] = bd85e449
	stha	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 001ce449
!	%f15 = 9a032802, Mem[00000000300c1410] = 49e41c00
	sta	%f15,[%i3+%o5]0x89	! Mem[00000000300c1410] = 9a032802
!	%l2 = 0000000000000097, Mem[00000000100c1400] = fcbff38d
	stha	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = fcbf0097
!	%l2 = 00000097, %l3 = a4e8baf4, Mem[0000000010101408] = 4f78b804 89c028dc
	stda	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000097 a4e8baf4
!	%l2 = 0000000000000097, Mem[0000000010001410] = bb3fb11cc4b543e9
	stxa	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000097
!	%l1 = 00000000000000ff, Mem[0000000030081400] = 0b80ad30
	stha	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 00ffad30
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = f5678610, %l0 = ee1d2d9862b19d90
	lduwa	[%i5+%o4]0x89,%l0	! %l0 = 00000000f5678610

p0_label_9:
!	Mem[0000000010041408] = 3424c8fb8a9ff528, %l5 = 000000009d543db4
	ldxa	[%i1+%o4]0x88,%l5	! %l5 = 3424c8fb8a9ff528
!	Mem[0000000030101410] = 5fea4a750f4e44ac, %f8  = fd46d6d1 cd28d31f
	ldda	[%i4+%o5]0x81,%f8 	! %f8  = 5fea4a75 0f4e44ac
!	Mem[0000000010081410] = d36c0a66, %l5 = 3424c8fb8a9ff528
	lduba	[%i2+%o5]0x88,%l5	! %l5 = 0000000000000066
!	Mem[0000000030141408] = f5678610, %l4 = a97d062fd434001c
	ldsha	[%i5+%o4]0x89,%l4	! %l4 = ffffffffffff8610
!	Mem[0000000010081400] = 4f606bd5, %l2 = 0000000000000097
	lduba	[%i2+%g0]0x88,%l2	! %l2 = 00000000000000d5
!	Mem[0000000030101408] = 000c48fa, %l2 = 00000000000000d5
	lduha	[%i4+%o4]0x89,%l2	! %l2 = 00000000000048fa
!	%l2 = 00000000000048fa, immed = fffffbb5, %y  = 00000000
	umul	%l2,-0x44b,%l2		! %l2 = 000048f9fec6b6c2, %y = 000048f9
!	Mem[0000000010181400] = b7552aba, %f19 = 04556880
	lda	[%i6+%g0]0x80,%f19	! %f19 = b7552aba
!	Mem[0000000030141408] = f5678610, %l1 = 00000000000000ff
	lduwa	[%i5+%o4]0x89,%l1	! %l1 = 00000000f5678610
!	Starting 10 instruction Store Burst
!	%f31 = 50bdced7, Mem[0000000030181410] = 9a032802
	sta	%f31,[%i6+%o5]0x81	! Mem[0000000030181410] = 50bdced7

p0_label_10:
!	Mem[0000000030081400] = 30adff00, %l4 = ffffffffffff8610
	ldstuba	[%i2+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[000000001004141c] = cd11cf1c, %l6 = 0000002b, %l6 = 0000002b
	add	%i1,0x1c,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 00000000cd11cf1c
!	Mem[0000000030001400] = 0c63c841, %l6 = 00000000cd11cf1c
	ldstuba	[%i0+%g0]0x81,%l6	! %l6 = 0000000c000000ff
!	%l4 = 0000000000000000, Mem[0000000010181400] = b7552aba
	stwa	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	%f0  = d9ba90ac a0728117, Mem[0000000030081400] = 30adffff 7d2352a7
	stda	%f0 ,[%i2+%g0]0x89	! Mem[0000000030081400] = d9ba90ac a0728117
!	%l4 = 0000000000000000, Mem[0000000010041400] = f7175995
	stba	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = f7175900
!	%l4 = 00000000, %l5 = 00000066, Mem[00000000100c1400] = fcbf0097 f4a95bb1
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 00000066
!	Mem[0000000010041400] = 005917f7c76f2c9b, %l6 = 000000000000000c, %l2 = 000048f9fec6b6c2
	casxa	[%i1]0x80,%l6,%l2	! %l2 = 005917f7c76f2c9b
!	%f22 = 9920f412 89385b71, %l0 = 00000000f5678610
!	Mem[00000000100c1410] = 00000000947b56ab
	add	%i3,0x010,%g1
	stda	%f22,[%g1+%l0]ASI_PST8_P ! Mem[00000000100c1410] = 00000012947b56ab
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = a0728117, %l5 = 0000000000000066
	lduha	[%i2+%g0]0x89,%l5	! %l5 = 0000000000008117

p0_label_11:
!	Mem[0000000030181410] = 50bdced7, %l6 = 000000000000000c
	lduha	[%i6+%o5]0x81,%l6	! %l6 = 00000000000050bd
!	Mem[0000000010041410] = ff606bd5a46d3925, %f26 = 8a68cac3 298b3929
	ldda	[%i1+%o5]0x80,%f26	! %f26 = ff606bd5 a46d3925
!	Mem[0000000030081408] = ff255166, %l2 = 005917f7c76f2c9b
	ldswa	[%i2+%o4]0x81,%l2	! %l2 = ffffffffff255166
!	Mem[0000000010101410] = 49e485bd, %l3 = 00000000a4e8baf4
	lduha	[%i4+%o5]0x88,%l3	! %l3 = 00000000000085bd
!	Mem[0000000010081410] = d36c0a66, %l7 = 00000000b793e110
	lduha	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000a66
!	Mem[0000000010101410] = bd85e449, %l4 = 0000000000000000
	lduha	[%i4+%o5]0x80,%l4	! %l4 = 000000000000bd85
!	Mem[00000000100c1408] = bc1d63ed5bfbca71, %l0 = 00000000f5678610
	ldxa	[%i3+%o4]0x88,%l0	! %l0 = bc1d63ed5bfbca71
!	%l6 = 00000000000050bd, %l3 = 00000000000085bd, %y  = 000048f9
	sdiv	%l6,%l3,%l1		! %l1 = 000000007fffffff
	mov	%l0,%y			! %y = 5bfbca71
!	Mem[0000000030001400] = 41c863ff, %l1 = 000000007fffffff
	ldsha	[%i0+%g0]0x89,%l1	! %l1 = 00000000000063ff
!	Starting 10 instruction Store Burst
!	%l2 = ff255166, %l3 = 000085bd, Mem[0000000010041400] = 005917f7 c76f2c9b
	stda	%l2,[%i1+0x000]%asi	! Mem[0000000010041400] = ff255166 000085bd

p0_label_12:
!	%f0  = d9ba90ac, %f2  = bfc25ba5
	fcmps	%fcc0,%f0 ,%f2 		! %fcc0 = 1
!	Mem[0000000030101408] = 000c48fa, %l6 = 00000000000050bd
	swapa	[%i4+%o4]0x89,%l6	! %l6 = 00000000000c48fa
!	%l2 = ffffffffff255166, Mem[0000000030141410] = c3ca688acaaafc6c
	stxa	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffffffff255166
!	%l2 = ffffffffff255166, Mem[0000000020800040] = 71369e7c, %asi = 80
	stha	%l2,[%o1+0x040]%asi	! Mem[0000000020800040] = 51669e7c
!	%l4 = 000000000000bd85, Mem[0000000030081410] = 10e193b77e9c6b66
	stxa	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000000000bd85
!	Mem[0000000010041400] = ff255166, %l7 = 0000000000000a66
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 00000000ff255166
!	%l4 = 000000000000bd85, Mem[0000000010041400] = 00000a66
	stba	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 85000a66
!	Mem[0000000010181410] = 1a5e0999, %l2 = ffffffffff255166
	ldstuba	[%i6+%o5]0x80,%l2	! %l2 = 0000001a000000ff
!	%l5 = 0000000000008117, Mem[00000000100c1408] = bc1d63ed5bfbca71
	stxa	%l5,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000000000008117
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = d8b3a7819eaa8a15, %f24 = b7552aba e7546c94
	ldda	[%i4+%g0]0x88,%f24	! %f24 = d8b3a781 9eaa8a15

p0_label_13:
!	Mem[00000000201c0000] = 388d387c, %l4 = 000000000000bd85
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = 000000000000388d
!	Mem[0000000030081400] = a0728117, %l3 = 00000000000085bd
	lduwa	[%i2+%g0]0x89,%l3	! %l3 = 00000000a0728117
!	Mem[0000000010181410] = ff5e0999, %l2 = 000000000000001a
	ldswa	[%i6+%o5]0x80,%l2	! %l2 = ffffffffff5e0999
!	%l6 = 00000000000c48fa, imm = 0000000000000ece, %l6 = 00000000000c48fa
	xor	%l6,0xece,%l6		! %l6 = 00000000000c4634
!	Mem[0000000010141408] = 6cf862e1 5b2069f2, %l4 = 0000388d, %l5 = 00008117
	ldda	[%i5+%o4]0x88,%l4	! %l4 = 000000005b2069f2 000000006cf862e1
!	Mem[0000000010001410] = 00000000, %l7 = 00000000ff255166
	ldsha	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041400] = bd850000660a0085, %f16 = 746c16f9 6fa1352a
	ldda	[%i1+%g0]0x88,%f16	! %f16 = bd850000 660a0085
!	Mem[00000000300c1400] = d88da573 a8c6ffab, %l2 = ff5e0999, %l3 = a0728117
	ldda	[%i3+%g0]0x81,%l2	! %l2 = 00000000d88da573 00000000a8c6ffab
!	Mem[0000000010041414] = a46d3925, %l5 = 000000006cf862e1
	lduh	[%i1+0x014],%l5		! %l5 = 000000000000a46d
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000a46d, Mem[0000000020800000] = 4ecfab32
	sth	%l5,[%o1+%g0]		! Mem[0000000020800000] = a46dab32

p0_label_14:
!	%l4 = 5b2069f2, %l5 = 0000a46d, Mem[0000000010081410] = 660a6cd3 35da95d7
	stda	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 5b2069f2 0000a46d
!	Mem[0000000010141410] = 8b77ef8e, %l0 = bc1d63ed5bfbca71
	swapa	[%i5+%o5]0x88,%l0	! %l0 = 000000008b77ef8e
!	%f4  = e943b5c4, Mem[0000000010141410] = 71cafb5b
	sta	%f4 ,[%i5+%o5]0x80	! Mem[0000000010141410] = e943b5c4
!	%f15 = 9a032802, Mem[0000000030001400] = ff63c841
	sta	%f15,[%i0+%g0]0x81	! Mem[0000000030001400] = 9a032802
!	%f5  = 1cb13fbb, %f18 = 42f977c0
	fcmps	%fcc3,%f5 ,%f18		! %fcc3 = 1
!	%f20 = 7070cc2c 615177bb, Mem[0000000030141400] = 982d1dee 909db162
	stda	%f20,[%i5+%g0]0x89	! Mem[0000000030141400] = 7070cc2c 615177bb
!	Mem[0000000010001408] = 2a304eff, %l5 = 000000000000a46d
	ldstuba	[%i0+%o4]0x88,%l5	! %l5 = 000000ff000000ff
!	%f0  = d9ba90ac, Mem[0000000030041410] = 9d543db4
	sta	%f0 ,[%i1+%o5]0x81	! Mem[0000000030041410] = d9ba90ac
!	%l7 = 0000000000000000, Mem[0000000030181410] = 50bdced7
	stba	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 00bdced7
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 1c0034d4 2f067da9, %l0 = 8b77ef8e, %l1 = 000063ff
	ldda	[%i6+%g0]0x81,%l0	! %l0 = 000000001c0034d4 000000002f067da9

p0_label_15:
!	Mem[0000000010081400] = d56b604f, %l1 = 000000002f067da9
	ldsba	[%i2+%g0]0x80,%l1	! %l1 = ffffffffffffffd5
!	Mem[0000000010141408] = 5b2069f2, %l4 = 000000005b2069f2
	lduba	[%i5+%o4]0x88,%l4	! %l4 = 00000000000000f2
!	Mem[0000000010041410] = 25396da4d56b60ff, %f30 = ec9086a7 50bdced7
	ldda	[%i1+%o5]0x88,%f30	! %f30 = 25396da4 d56b60ff
!	Mem[0000000010181400] = 00000000, %l2 = 00000000d88da573
	lduwa	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%f5  = 1cb13fbb, %f0  = d9ba90ac, %f27 = a46d3925
	fdivs	%f5 ,%f0 ,%f27		! %f27 = 82733771
!	%l5 = 00000000000000ff, imm = 0000000000000b40, %l5 = 00000000000000ff
	orn	%l5,0xb40,%l5		! %l5 = fffffffffffff4ff
!	Mem[0000000010001400] = a78690ec, %l6 = 00000000000c4634
	ldswa	[%i0+%g0]0x88,%l6	! %l6 = ffffffffa78690ec
!	Mem[0000000030041408] = e0f687dc8f5f000b, %f8  = 5fea4a75 0f4e44ac
	ldda	[%i1+%o4]0x89,%f8 	! %f8  = e0f687dc 8f5f000b
!	Mem[00000000201c0000] = 388d387c, %l0 = 000000001c0034d4
	ldsba	[%o0+0x001]%asi,%l0	! %l0 = ffffffffffffff8d
!	Starting 10 instruction Store Burst
!	%l3 = 00000000a8c6ffab, Mem[0000000010041408] = 28f59f8a, %asi = 80
	stwa	%l3,[%i1+0x008]%asi	! Mem[0000000010041408] = a8c6ffab

p0_label_16:
!	%f17 = 660a0085, %f3  = ec61e5c6
	fcmpes	%fcc0,%f17,%f3 		! %fcc0 = 2
!	Mem[0000000021800041] = d5f89a7f, %l0 = ffffffffffffff8d
	ldstub	[%o3+0x041],%l0		! %l0 = 000000f8000000ff
!	%l6 = a78690ec, %l7 = 00000000, Mem[0000000030001400] = 0228039a 27443056
	stda	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = a78690ec 00000000
!	%l6 = ffffffffa78690ec, %l5 = fffffffffffff4ff, %y  = 5bfbca71
	umul	%l6,%l5,%l1		! %l1 = a78689b8903f4b14, %y = a78689b8
!	Mem[0000000030181400] = 1c0034d4, %l0 = 00000000000000f8
	ldstuba	[%i6+%g0]0x81,%l0	! %l0 = 0000001c000000ff
!	Mem[0000000010041420] = d259f2a8a9bd1c9b, %l6 = ffffffffa78690ec, %l0 = 000000000000001c
	add	%i1,0x20,%g1
	casxa	[%g1]0x80,%l6,%l0	! %l0 = d259f2a8a9bd1c9b
!	%l4 = 000000f2, %l5 = fffff4ff, Mem[0000000010081408] = 180b93de 992ee4cc
	stda	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000f2 fffff4ff
!	%l7 = 0000000000000000, imm = 00000000000009ac, %l3 = 00000000a8c6ffab
	xnor	%l7,0x9ac,%l3		! %l3 = fffffffffffff653
!	%f9  = 8f5f000b, Mem[00000000100c1400] = 00000000
	sta	%f9 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 8f5f000b
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 178172a0, %l0 = d259f2a8a9bd1c9b
	lduwa	[%i2+%g0]0x81,%l0	! %l0 = 00000000178172a0

p0_label_17:
!	Mem[0000000030041400] = 0000388d, %l0 = 00000000178172a0
	lduba	[%i1+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101410] = 49e485bd, %l6 = ffffffffa78690ec
	ldswa	[%i4+%o5]0x88,%l6	! %l6 = 0000000049e485bd
!	Mem[0000000010101400] = 9eaa8a15, %l1 = a78689b8903f4b14
	lduha	[%i4+%g0]0x88,%l1	! %l1 = 0000000000008a15
!	Mem[00000000100c1410] = 12000000, %l4 = 00000000000000f2
	ldswa	[%i3+%o5]0x88,%l4	! %l4 = 0000000012000000
!	Mem[0000000010181438] = 095d4335, %l0 = 0000000000000000
	ldsw	[%i6+0x038],%l0		! %l0 = 00000000095d4335
!	%l3 = fffffffffffff653, %l4 = 0000000012000000, %y  = a78689b8
	smul	%l3,%l4,%l6		! %l6 = ffffff51d6000000, %y = ffffff51
!	Mem[0000000030181400] = ff0034d42f067da9, %l2 = 0000000000000000
	ldxa	[%i6+%g0]0x81,%l2	! %l2 = ff0034d42f067da9
!	Mem[0000000010041410] = ff606bd5, %f9  = 8f5f000b
	lda	[%i1+%o5]0x80,%f9 	! %f9 = ff606bd5
!	Mem[00000000201c0000] = 388d387c, %l3 = fffffffffffff653
	lduh	[%o0+%g0],%l3		! %l3 = 000000000000388d
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000388d, Mem[00000000300c1408] = fcfde954
	stba	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 8dfde954

p0_label_18:
!	Mem[0000000010081400] = d56b604f, %l7 = 0000000000000000
	swap	[%i2+%g0],%l7		! %l7 = 00000000d56b604f
!	%f4  = e943b5c4 1cb13fbb, %l1 = 0000000000008a15
!	Mem[0000000010001430] = 7427df15b0f8f861
	add	%i0,0x030,%g1
	stda	%f4,[%g1+%l1]ASI_PST32_P ! Mem[0000000010001430] = 7427df151cb13fbb
!	%f22 = 9920f412 89385b71, Mem[0000000030101408] = 000050bd 445c9d38
	stda	%f22,[%i4+%o4]0x89	! Mem[0000000030101408] = 9920f412 89385b71
!	%l7 = 00000000d56b604f, Mem[0000000030181410] = 00bdced7
	stwa	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = d56b604f
!	%l1 = 0000000000008a15, Mem[0000000030101410] = ac444e0f754aea5f
	stxa	%l1,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000000000008a15
!	%l6 = ffffff51d6000000, Mem[0000000030041400] = 0000388d
	stba	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000388d
!	%f24 = d8b3a781 9eaa8a15, %l6 = ffffff51d6000000
!	Mem[0000000010101420] = 7b9c8d1a4eb67d44
	add	%i4,0x020,%g1
	stda	%f24,[%g1+%l6]ASI_PST8_P ! Mem[0000000010101420] = 7b9c8d1a4eb67d44
!	%f21 = 615177bb, %f14 = a965791d
	fcmpes	%fcc3,%f21,%f14		! %fcc3 = 2
!	%l2 = ff0034d42f067da9, Mem[0000000010181418] = f5456514, %asi = 80
	stwa	%l2,[%i6+0x018]%asi	! Mem[0000000010181418] = 2f067da9
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 388d387c, %l5 = fffffffffffff4ff
	ldsh	[%o0+%g0],%l5		! %l5 = 000000000000388d

p0_label_19:
!	Mem[0000000030181410] = 4f606bd5, %l2 = ff0034d42f067da9
	ldswa	[%i6+%o5]0x89,%l2	! %l2 = 000000004f606bd5
!	Mem[00000000100c1400] = 00000066 8f5f000b, %l2 = 4f606bd5, %l3 = 0000388d
	ldda	[%i3+%g0]0x88,%l2	! %l2 = 000000008f5f000b 0000000000000066
!	Mem[00000000100c1410] = 00000012, %l7 = 00000000d56b604f
	lduwa	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000012
!	Mem[0000000010041410] = ff606bd5, %l5 = 000000000000388d
	lduba	[%i1+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181408] = 955917f7, %l5 = 00000000000000ff
	ldsba	[%i6+%o4]0x80,%l5	! %l5 = ffffffffffffff95
!	Mem[0000000010141414] = fa6eab54, %l6 = ffffff51d6000000
	ldsb	[%i5+0x016],%l6		! %l6 = ffffffffffffffab
!	Mem[0000000010101438] = 37602d1e, %f7  = 2a6bc2ad
	lda	[%i4+0x038]%asi,%f7 	! %f7 = 37602d1e
!	Mem[00000000201c0000] = 388d387c, %l3 = 0000000000000066
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 000000000000388d
!	Mem[0000000030041410] = ac90bad9, %l7 = 0000000000000012
	lduha	[%i1+%o5]0x89,%l7	! %l7 = 000000000000bad9
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000388d, Mem[0000000010181400] = 00000000
	stba	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 8d000000

p0_label_20:
!	Mem[0000000010101400] = 158aaa9e, %l2 = 000000008f5f000b
	swapa	[%i4+%g0]0x80,%l2	! %l2 = 00000000158aaa9e
!	%f29 = 263fbd6e, %f1  = a0728117, %f8  = e0f687dc
	fdivs	%f29,%f1 ,%f8 		! %f8  = c54a691c
!	%l1 = 0000000000008a15, Mem[0000000010081408] = f2000000
	stwa	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 00008a15
!	%l0 = 00000000095d4335, Mem[0000000010041408] = a8c6ffabfbc82434
	stxa	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000095d4335
!	%l5 = ffffffffffffff95, Mem[0000000030081410] = 85bd000000000000
	stxa	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffffffffffff95
!	%f31 = d56b60ff, Mem[0000000030141400] = 615177bb
	sta	%f31,[%i5+%g0]0x89	! Mem[0000000030141400] = d56b60ff
!	Mem[0000000030041400] = 8d380000, %l0 = 00000000095d4335
	ldstuba	[%i1+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	%f22 = 9920f412 89385b71, %l6 = ffffffffffffffab
!	Mem[0000000010181410] = ff5e0999373c3747
	add	%i6,0x010,%g1
	stda	%f22,[%g1+%l6]ASI_PST8_P ! Mem[0000000010181410] = 995ef499893c5b71
!	Mem[00000000100c1408] = 17810000, %l7 = 000000000000bad9
	swapa	[%i3+%o4]0x80,%l7	! %l7 = 0000000017810000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ec9086a7, %f22 = 9920f412
	lda	[%i0+%g0]0x80,%f22	! %f22 = ec9086a7

p0_label_21:
!	Mem[0000000010081438] = 9cceeadc ce245629, %l2 = 158aaa9e, %l3 = 0000388d
	ldd	[%i2+0x038],%l2		! %l2 = 000000009cceeadc 00000000ce245629
!	Mem[00000000300c1410] = 9a032802, %l1 = 0000000000008a15
	lduba	[%i3+%o5]0x89,%l1	! %l1 = 0000000000000002
!	Mem[0000000010001400] = a78690ec, %l5 = ffffffffffffff95
	lduba	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000ec
!	Mem[00000000100c1408] = 0000bad9, %f14 = a965791d
	lda	[%i3+%o4]0x80,%f14	! %f14 = 0000bad9
!	Mem[0000000030101408] = 89385b71, %l4 = 0000000012000000
	ldswa	[%i4+%o4]0x89,%l4	! %l4 = ffffffff89385b71
!	Mem[0000000030181408] = 97000000, %l5 = 00000000000000ec
	lduha	[%i6+%o4]0x81,%l5	! %l5 = 0000000000009700
!	Mem[0000000010041428] = 6a86a25f8903761e, %l5 = 0000000000009700
	ldx	[%i1+0x028],%l5		! %l5 = 6a86a25f8903761e
!	%l4 = ffffffff89385b71, Mem[0000000030001400] = ec9086a7
	stwa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 89385b71
!	Mem[00000000100c1428] = dd244346, %l2 = 000000009cceeadc
	lduwa	[%i3+0x028]%asi,%l2	! %l2 = 00000000dd244346
!	Starting 10 instruction Store Burst
!	%l4 = 89385b71, %l5 = 8903761e, Mem[0000000030041400] = 8d3800ff 992ee4cc
	stda	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 89385b71 8903761e

p0_label_22:
!	Mem[00000000100c1410] = 12000000, %l7 = 0000000017810000
	swapa	[%i3+%o5]0x88,%l7	! %l7 = 0000000012000000
!	%l1 = 0000000000000002, Mem[00000000100c1400] = 8f5f000b
	stba	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = 8f5f0002
!	%l5 = 6a86a25f8903761e, Mem[0000000020800000] = a46dab32, %asi = 80
	stha	%l5,[%o1+0x000]%asi	! Mem[0000000020800000] = 761eab32
!	%l2 = 00000000dd244346, Mem[0000000010181400] = 0000008d
	stha	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 00004346
!	%l0 = 0000000000000000, Mem[0000000010041410] = ff606bd5
	stwa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	%l0 = 0000000000000000, Mem[00000000100c1400] = 02005f8f66000000
	stxa	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000000000000000
!	Mem[0000000010141408] = f269205b, %l0 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l0	! %l0 = 00000000f269205b
!	%l1 = 0000000000000002, Mem[0000000030101400] = b4e42e9984194110
	stxa	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000000002
!	Mem[0000000010081400] = 00000000, %l3 = ce245629, %l2 = dd244346
	casa	[%i2]0x80,%l3,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = d88da573, %l0 = 00000000f269205b
	lduwa	[%i3+%g0]0x81,%l0	! %l0 = 00000000d88da573

p0_label_23:
!	Mem[0000000030141410] = ffffffff, %l6 = ffffffffffffffab
	lduha	[%i5+%o5]0x89,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030081408] = 665125ff, %f28 = 8aac0410
	lda	[%i2+%o4]0x89,%f28	! %f28 = 665125ff
!	Mem[0000000030101400] = 00000000, %l1 = 0000000000000002
	lduha	[%i4+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081400] = a0728117, %l6 = 000000000000ffff
	ldsha	[%i2+%g0]0x89,%l6	! %l6 = ffffffffffff8117
!	Mem[0000000030101408] = 715b3889, %l2 = 0000000000000000
	lduha	[%i4+%o4]0x81,%l2	! %l2 = 000000000000715b
!	Mem[00000000201c0000] = 388d387c, %l5 = 6a86a25f8903761e
	lduha	[%o0+0x000]%asi,%l5	! %l5 = 000000000000388d
!	Mem[0000000030181400] = d43400ff, %l7 = 0000000012000000
	lduwa	[%i6+%g0]0x89,%l7	! %l7 = 00000000d43400ff
!	Mem[00000000300c1408] = 8dfde954, %f8  = c54a691c
	lda	[%i3+%o4]0x81,%f8 	! %f8 = 8dfde954
!	%l0 = 00000000d88da573, immd = 0000000000000b98, %l0 = 00000000d88da573
	sdivx	%l0,0xb98,%l0		! %l0 = 000000000012adaf
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 2a304eff, %l4 = ffffffff89385b71
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 000000ff000000ff

p0_label_24:
!	%l3 = 00000000ce245629, Mem[00000000100c1408] = 0000bad900000000, %asi = 80
	stxa	%l3,[%i3+0x008]%asi	! Mem[00000000100c1408] = 00000000ce245629
!	Mem[0000000030181410] = 4f606bd5, %l7 = 00000000d43400ff
	swapa	[%i6+%o5]0x89,%l7	! %l7 = 000000004f606bd5
!	%l6 = ffffffffffff8117, Mem[0000000010141400] = d094b3b5
	stha	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 8117b3b5
!	Mem[0000000030001408] = 0f468fd4, %l0 = 000000000012adaf
	ldstuba	[%i0+%o4]0x89,%l0	! %l0 = 000000d4000000ff
!	%l6 = ffffffffffff8117, Mem[0000000010181408] = f7175995
	stwa	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = ffff8117
!	%l0 = 00000000000000d4, Mem[0000000010141428] = 263fbd6e80392da7, %asi = 80
	stxa	%l0,[%i5+0x028]%asi	! Mem[0000000010141428] = 00000000000000d4
!	%l0 = 00000000000000d4, Mem[0000000030101408] = 89385b71
	stba	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 89385bd4
!	%l1 = 0000000000000000, Mem[0000000030081408] = 665125ff
	stba	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 66512500
!	%l4 = 000000ff, %l5 = 0000388d, Mem[0000000010081408] = 158a0000 fffff4ff
	stda	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000ff 0000388d
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010041400] = 85000a66 000085bd 00000000 095d4335
!	Mem[0000000010041410] = 00000000 a46d3925 d3e78ae6 cd11cf1c
!	Mem[0000000010041420] = d259f2a8 a9bd1c9b 6a86a25f 8903761e
!	Mem[0000000010041430] = 3f0365f6 e9b3ff58 125b9d80 d13ea1f3
	ldda	[%i1]ASI_BLK_PL,%f16	! Block Load from 0000000010041400

p0_label_25:
!	%l1 = 0000000000000000, %l0 = 00000000000000d4, %y  = ffffff51
	smul	%l1,%l0,%l4		! %l4 = 0000000000000000, %y = 00000000
!	Mem[0000000030101400] = 0200000000000000, %l5 = 000000000000388d
	ldxa	[%i4+%g0]0x89,%l5	! %l5 = 0200000000000000
!	Mem[0000000010141400] = b5b31781, %l5 = 0200000000000000
	lduwa	[%i5+%g0]0x88,%l5	! %l5 = 00000000b5b31781
!	Mem[0000000010141408] = 00000000, %f3  = ec61e5c6
	lda	[%i5+%o4]0x88,%f3 	! %f3 = 00000000
!	Mem[0000000010181400] = 46430000, %f15 = 9a032802
	lda	[%i6+%g0]0x80,%f15	! %f15 = 46430000
!	Mem[0000000030181410] = ff0034d4, %l6 = ffffffffffff8117
	ldsba	[%i6+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010141408] = 00000000, %f8  = 8dfde954
	lda	[%i5+%o4]0x88,%f8 	! %f8 = 00000000
!	Mem[00000000300c1400] = abffc6a8 73a58dd8, %l2 = 0000715b, %l3 = ce245629
	ldda	[%i3+%g0]0x89,%l2	! %l2 = 0000000073a58dd8 00000000abffc6a8
!	Mem[0000000010141408] = 00000000, %l6 = ffffffffffffffff
	ldsba	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000030081408] = 66512500
	stba	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 66512500

p0_label_26:
!	%l2 = 73a58dd8, %l3 = abffc6a8, Mem[0000000010081408] = ff000000 8d380000
	stda	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 73a58dd8 abffc6a8
!	%l1 = 0000000000000000, Mem[0000000030001400] = 89385b7100000000
	stxa	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000000000000000
!	%l0 = 00000000000000d4, Mem[0000000010001408] = a4e8baf42a304eff
	stxa	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000000000d4
!	Mem[00000000300c1408] = 8dfde954 2ee28bad, %l4 = 00000000, %l5 = b5b31781
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 000000008dfde954 000000002ee28bad
!	%l4 = 000000008dfde954, Mem[0000000010101410] = 94de2f0349e485bd
	stxa	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000008dfde954
	membar	#Sync			! Added by membar checker (2)
!	%l6 = 0000000000000000, Mem[0000000010041400] = 85000a66
	stba	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000a66
!	%l0 = 00000000000000d4, Mem[0000000030181400] = d43400ff
	stha	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = d43400d4
!	%l0 = 00000000000000d4, Mem[00000000300c1410] = 9a032802
	stba	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 9a0328d4
!	%l2 = 0000000073a58dd8, Mem[0000000010101412] = 54e9fd8d
	sth	%l2,[%i4+0x012]		! Mem[0000000010101410] = 54e98dd8
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00000000, %l3 = 00000000abffc6a8
	ldsha	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000

p0_label_27:
!	Mem[0000000010081400] = 00000000, %l6 = 0000000000000000
	ldsba	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141400] = ff606bd5, %l6 = 0000000000000000
	ldsha	[%i5+%g0]0x81,%l6	! %l6 = ffffffffffffff60
!	Mem[0000000010081410] = 5b2069f20000a46d, %f14 = 0000bad9 46430000
	ldda	[%i2+%o5]0x80,%f14	! %f14 = 5b2069f2 0000a46d
!	Mem[0000000010181410] = 99f45e99, %l7 = 000000004f606bd5
	ldsba	[%i6+%o5]0x88,%l7	! %l7 = ffffffffffffff99
!	Mem[0000000010001428] = d4ad7722, %l7 = ffffffffffffff99
	lduw	[%i0+0x028],%l7		! %l7 = 00000000d4ad7722
!	Mem[00000000100c1410] = ab567b94 17810000, %l6 = ffffff60, %l7 = d4ad7722
	ldda	[%i3+%o5]0x88,%l6	! %l6 = 0000000017810000 00000000ab567b94
!	Mem[0000000010101414] = 00000000, %l1 = 0000000000000000
	lduh	[%i4+0x014],%l1		! %l1 = 0000000000000000
!	Mem[00000000201c0000] = 388d387c, %l4 = 000000008dfde954
	lduh	[%o0+%g0],%l4		! %l4 = 000000000000388d
!	Mem[0000000010181410] = 995ef499, %l0 = 00000000000000d4
	lduwa	[%i6+%o5]0x80,%l0	! %l0 = 00000000995ef499
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 00000000, %l6 = 0000000017810000
	ldstuba	[%i0+%o5]0x80,%l6	! %l6 = 00000000000000ff

p0_label_28:
!	%f2  = bfc25ba5, Mem[00000000100c1408] = 00000000
	sta	%f2 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = bfc25ba5
!	%l2 = 0000000073a58dd8, Mem[0000000010181400] = 46430000, %asi = 80
	stwa	%l2,[%i6+0x000]%asi	! Mem[0000000010181400] = 73a58dd8
!	%l7 = 00000000ab567b94, Mem[000000001014141e] = e0b48386
	sth	%l7,[%i5+0x01e]		! Mem[000000001014141c] = e0b47b94
!	%l1 = 0000000000000000, Mem[0000000020800001] = 761eab32
	stb	%l1,[%o1+0x001]		! Mem[0000000020800000] = 7600ab32
!	Mem[0000000030001400] = 00000000, %l3 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1410] = 9a0328d4, %l4 = 000000000000388d
	swapa	[%i3+%o5]0x89,%l4	! %l4 = 000000009a0328d4
!	Mem[0000000010101420] = 7b9c8d1a, %l5 = 000000002ee28bad
	swap	[%i4+0x020],%l5		! %l5 = 000000007b9c8d1a
!	%l6 = 00000000, %l7 = ab567b94, Mem[0000000030101400] = 00000000 02000000
	stda	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000 ab567b94
!	Mem[0000000010181400] = d88da573, %l1 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l1	! %l1 = 00000000d88da573
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000, %l6 = 0000000000000000
	lduwa	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000000

p0_label_29:
!	Mem[0000000010101408] = 00000097a4e8baf4, %l7 = 00000000ab567b94
	ldxa	[%i4+%o4]0x80,%l7	! %l7 = 00000097a4e8baf4
!	Mem[0000000030101408] = d45b3889, %l6 = 0000000000000000
	lduwa	[%i4+%o4]0x81,%l6	! %l6 = 00000000d45b3889
!	Mem[00000000300c1408] = 54e9fd8d, %l6 = 00000000d45b3889
	lduha	[%i3+%o4]0x89,%l6	! %l6 = 000000000000fd8d
!	Mem[0000000010081400] = 00000000, %l7 = 00000097a4e8baf4
	lduha	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101408] = d45b3889, %l6 = 000000000000fd8d
	lduha	[%i4+%o4]0x81,%l6	! %l6 = 000000000000d45b
!	Mem[000000001014142c] = 000000d4, %l0 = 00000000995ef499
	lduw	[%i5+0x02c],%l0		! %l0 = 00000000000000d4
!	Mem[0000000010041428] = 6a86a25f 8903761e, %l6 = 0000d45b, %l7 = 00000000
	ldd	[%i1+0x028],%l6		! %l6 = 000000006a86a25f 000000008903761e
!	Mem[0000000030081408] = 00255166, %l1 = 00000000d88da573
	ldsba	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001408] = d4000000, %l7 = 000000008903761e
	ldsba	[%i0+%o4]0x80,%l7	! %l7 = ffffffffffffffd4
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000010041419] = d3e78ae6
	stb	%l3,[%i1+0x019]		! Mem[0000000010041418] = d3008ae6

p0_label_30:
!	%f8  = 00000000, %f17 = 660a0085
	fcmps	%fcc0,%f8 ,%f17		! %fcc0 = 1
!	%l0 = 000000d4, %l1 = 00000000, Mem[0000000010001410] = 000000ff 97000000
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000d4 00000000
!	%l7 = ffffffffffffffd4, Mem[0000000030101400] = 00000000
	stba	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = d4000000
!	%l0 = 00000000000000d4, Mem[00000000100c1410] = 00008117, %asi = 80
	stba	%l0,[%i3+0x010]%asi	! Mem[00000000100c1410] = d4008117
!	Mem[0000000030181408] = 97000000, %l3 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l3	! %l3 = 0000000097000000
!	%l7 = ffffffffffffffd4, Mem[0000000030141400] = d56b60ff
	stha	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = d56bffd4
!	%l3 = 0000000097000000, Mem[0000000010001408] = 000000d4
	stwa	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 97000000
!	%l6 = 000000006a86a25f, Mem[00000000300c1400] = d88da573
	stba	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 5f8da573
!	Mem[0000000010141408] = 00000000, %l3 = 0000000097000000
	swap	[%i5+%o4],%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00000097a4e8baf4, %f22 = 1ccf11cd e68ae7d3
	ldda	[%i4+%o4]0x80,%f22	! %f22 = 00000097 a4e8baf4

p0_label_31:
!	Mem[0000000010181434] = 21dbbcf8, %l6 = 000000006a86a25f
	ldub	[%i6+0x036],%l6		! %l6 = 00000000000000bc
!	Mem[0000000010141410] = c4b543e9, %l1 = 0000000000000000
	lduwa	[%i5+%o5]0x88,%l1	! %l1 = 00000000c4b543e9
!	Mem[00000000100c1408] = a55bc2bf, %l4 = 000000009a0328d4
	ldsba	[%i3+%o4]0x88,%l4	! %l4 = ffffffffffffffbf
!	Mem[00000000201c0000] = 388d387c, %l2 = 0000000073a58dd8
	ldub	[%o0+0x001],%l2		! %l2 = 000000000000008d
!	Mem[0000000010001410] = d4000000, %l1 = 00000000c4b543e9
	lduh	[%i0+0x012],%l1		! %l1 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l2 = 000000000000008d
	lduba	[%i3+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081400] = 178172a0 ac90bad9, %l2 = 00000000, %l3 = 00000000
	ldda	[%i2+%g0]0x81,%l2	! %l2 = 00000000178172a0 00000000ac90bad9
!	Mem[0000000010081428] = 1d01eb24, %l3 = 00000000ac90bad9
	ldsw	[%i2+0x028],%l3		! %l3 = 000000001d01eb24
!	Mem[0000000030041400] = 715b3889, %f7  = 37602d1e
	lda	[%i1+%g0]0x81,%f7 	! %f7 = 715b3889
!	Starting 10 instruction Store Burst
!	%f1  = a0728117, Mem[00000000300c1408] = 54e9fd8d
	sta	%f1 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = a0728117

p0_label_32:
!	%l7 = ffffffffffffffd4, Mem[0000000010181406] = e7546c94
	sth	%l7,[%i6+0x006]		! Mem[0000000010181404] = e754ffd4
!	Mem[0000000030141400] = d56bffd4, %l7 = ffffffffffffffd4
	swapa	[%i5+%g0]0x89,%l7	! %l7 = 00000000d56bffd4
!	Mem[0000000010041408] = 00000000, %l5 = 000000007b9c8d1a
	swapa	[%i1+%o4]0x80,%l5	! %l5 = 0000000000000000
!	%l4 = ffffffffffffffbf, Mem[0000000030081410] = ffffffff
	stwa	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffffbf
!	Mem[0000000010141408] = 00000097, %l2 = 00000000178172a0
	swapa	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000097
!	%l6 = 00000000000000bc, Mem[00000000300c1410] = 0000388d
	stba	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000038bc
!	%f8  = 00000000 ff606bd5, %l5 = 0000000000000000
!	Mem[0000000010181438] = 095d4335545ebe57
	add	%i6,0x038,%g1
	stda	%f8,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010181438] = 095d4335545ebe57
!	Mem[0000000010181400] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i6+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%f16 = bd850000 660a0085 35435d09 00000000
!	%f20 = 25396da4 00000000 00000097 a4e8baf4
!	%f24 = 9b1cbda9 a8f259d2 1e760389 5fa2866a
!	%f28 = 58ffb3e9 f665033f f3a13ed1 809d5b12
	stda	%f16,[%i0]ASI_BLK_PL	! Block Store to 0000000010001400
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 000000ff, %l6 = 00000000000000bc
	ldsba	[%i6+%g0]0x88,%l6	! %l6 = ffffffffffffffff

p0_label_33:
!	Mem[0000000010081400] = 00000000 6ea5980e 73a58dd8 abffc6a8
!	Mem[0000000010081410] = 5b2069f2 0000a46d 9e86b923 bdf85de0
!	Mem[0000000010081420] = 345a82e7 69cfe569 1d01eb24 d9cd3499
!	Mem[0000000010081430] = 004b4167 f74bd567 9cceeadc ce245629
	ldda	[%i2]ASI_BLK_P,%f16	! Block Load from 0000000010081400
!	Mem[0000000030141400] = d4ffffff 2ccc7070, %l6 = ffffffff, %l7 = d56bffd4
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 00000000d4ffffff 000000002ccc7070
!	Mem[0000000010141434] = e5434ecc, %l5 = 0000000000000000
	lduba	[%i5+0x034]%asi,%l5	! %l5 = 00000000000000e5
!	Mem[00000000300c1400] = 73a58d5f, %l1 = 0000000000000000
	ldsha	[%i3+%g0]0x89,%l1	! %l1 = ffffffffffff8d5f
!	Mem[0000000030181410] = d43400ff, %f4  = e943b5c4
	lda	[%i6+%o5]0x89,%f4 	! %f4 = d43400ff
!	Mem[000000001008141c] = bdf85de0, %l4 = ffffffffffffffbf
	lduwa	[%i2+0x01c]%asi,%l4	! %l4 = 00000000bdf85de0
!	Mem[00000000100c1414] = 947b56ab, %l1 = ffffffffffff8d5f
	lduw	[%i3+0x014],%l1		! %l1 = 00000000947b56ab
	membar	#Sync			! Added by membar checker (3)
!	Mem[000000001000143c] = d13ea1f3, %f12 = 2615d42c
	ld	[%i0+0x03c],%f12	! %f12 = d13ea1f3
!	Mem[0000000010141408] = a0728117e162f86c, %f30 = 9cceeadc ce245629
	ldda	[%i5+%o4]0x80,%f30	! %f30 = a0728117 e162f86c
!	Starting 10 instruction Store Burst
!	%f20 = 5b2069f2 0000a46d, %l2 = 0000000000000097
!	Mem[00000000300c1430] = 64901da02d4eb4bc
	add	%i3,0x030,%g1
	stda	%f20,[%g1+%l2]ASI_PST32_SL ! Mem[00000000300c1430] = 6da40000f269205b

p0_label_34:
!	%l7 = 000000002ccc7070, Mem[0000000010101408] = 97000000
	stha	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = 97007070
!	%l0 = 00000000000000d4, Mem[00000000300c1400] = 5f8da573
	stba	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = d48da573
!	%l4 = 00000000bdf85de0, Mem[0000000010081400] = 00000000
	stha	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 5de00000
!	Mem[00000000100c1410] = d4008117, %l2 = 0000000000000097
	ldstuba	[%i3+%o5]0x80,%l2	! %l2 = 000000d4000000ff
!	%f30 = a0728117, Mem[0000000010041400] = 00000a66
	sta	%f30,[%i1+%g0]0x80	! Mem[0000000010041400] = a0728117
!	Mem[0000000010181430] = e5d455ec, %l4 = bdf85de0, %l6 = d4ffffff
	add	%i6,0x30,%g1
	casa	[%g1]0x80,%l4,%l6	! %l6 = 00000000e5d455ec
!	%l5 = 00000000000000e5, Mem[0000000010181410] = 995ef499
	stwa	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000e5
!	Mem[0000000010081405] = 6ea5980e, %l3 = 000000001d01eb24
	ldstuba	[%i2+0x005]%asi,%l3	! %l3 = 000000a5000000ff
!	%f6  = 9d543db4, Mem[0000000030181408] = 00000000
	sta	%f6 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 9d543db4
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 70700097, %l7 = 000000002ccc7070
	lduba	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000070

p0_label_35:
!	Code Fragment 4
p0_fragment_3:
!	%l0 = 00000000000000d4
	setx	0xc4bf7bd7c87ccee8,%g7,%l0 ! %l0 = c4bf7bd7c87ccee8
!	%l1 = 00000000947b56ab
	setx	0x1ff912786604aa3f,%g7,%l1 ! %l1 = 1ff912786604aa3f
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c4bf7bd7c87ccee8
	setx	0xe91472b7f2ad844b,%g7,%l0 ! %l0 = e91472b7f2ad844b
!	%l1 = 1ff912786604aa3f
	setx	0xf660b337b0c16850,%g7,%l1 ! %l1 = f660b337b0c16850
!	Mem[0000000010181408] = 35273578ffff8117, %l6 = 00000000e5d455ec
	ldxa	[%i6+%o4]0x88,%l6	! %l6 = 35273578ffff8117
!	Mem[0000000010101408] = 70700097, %l6 = 35273578ffff8117
	lduha	[%i4+%o4]0x80,%l6	! %l6 = 0000000000007070
!	Mem[0000000010181400] = ff000000e754ffd4, %l7 = 0000000000000070
	ldxa	[%i6+%g0]0x80,%l7	! %l7 = ff000000e754ffd4
!	Mem[0000000010101408] = 70700097, %l1 = f660b337b0c16850
	ldsha	[%i4+%o4]0x80,%l1	! %l1 = 0000000000007070
!	Mem[0000000010181400] = ff000000, %l2 = 00000000000000d4
	ldswa	[%i6+%g0]0x80,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010001410] = 00000000 a46d3925, %l0 = f2ad844b, %l1 = 00007070
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000000 00000000a46d3925
!	Mem[0000000030181410] = ff0034d4, %f6  = 9d543db4
	lda	[%i6+%o5]0x81,%f6 	! %f6 = ff0034d4
!	Mem[00000000211c0000] = ff9dd373, %l5 = 00000000000000e5
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 000000000000ff9d
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000007070, Mem[0000000030081410] = bfffffff
	stba	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = bfffff70

p0_label_36:
!	%l5 = 000000000000ff9d, Mem[00000000201c0000] = 388d387c, %asi = 80
	stba	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = 9d8d387c
!	%l0 = 00000000, %l1 = a46d3925, Mem[0000000010001410] = 00000000 a46d3925
	stda	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000 a46d3925
!	%l0 = 0000000000000000, Mem[0000000010081414] = 0000a46d, %asi = 80
	stha	%l0,[%i2+0x014]%asi	! Mem[0000000010081414] = 0000a46d
!	%f26 = 1d01eb24 d9cd3499, %l3 = 00000000000000a5
!	Mem[0000000010001400] = 85000a66000085bd
	stda	%f26,[%i0+%l3]ASI_PST16_PL ! Mem[0000000010001400] = 99340a6624eb85bd
!	%l5 = 000000000000ff9d, Mem[0000000030041410] = d9ba90ac2a6bc2ad
	stxa	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000000000ff9d
!	%f14 = 5b2069f2 0000a46d, Mem[0000000030181400] = d43400d4 a97d062f
	stda	%f14,[%i6+%g0]0x89	! Mem[0000000030181400] = 5b2069f2 0000a46d
!	%l4 = 00000000bdf85de0, Mem[0000000020800040] = 51669e7c
	stb	%l4,[%o1+0x040]		! Mem[0000000020800040] = e0669e7c
!	%l4 = 00000000bdf85de0, Mem[0000000030101408] = 9920f41289385bd4
	stxa	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000bdf85de0
!	Mem[00000000300c1410] = bc380000, %l4 = 00000000bdf85de0
	ldstuba	[%i3+%o5]0x81,%l4	! %l4 = 000000bc000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 5de00000, %f16 = 00000000
	lda	[%i2+%g0]0x80,%f16	! %f16 = 5de00000

p0_label_37:
!	%f22 = 9e86b923, %f26 = 1d01eb24, %f12 = d13ea1f3 82f372d7
	fsmuld	%f22,%f26,%f12		! %f12 = b78117c2 620a7b00
!	Mem[0000000030081400] = 178172a0, %l6 = 0000000000007070
	ldsba	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000017
!	Mem[0000000030101410] = 158a0000, %l5 = 000000000000ff9d
	lduba	[%i4+%o5]0x81,%l5	! %l5 = 0000000000000015
!	Mem[0000000010181410] = 000000e5, %l5 = 0000000000000015
	lduha	[%i6+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Code Fragment 3
p0_fragment_4:
!	%l0 = 0000000000000000
	setx	0x14413b9800d5fea5,%g7,%l0 ! %l0 = 14413b9800d5fea5
!	%l1 = 00000000a46d3925
	setx	0xebf500b7caf17dcc,%g7,%l1 ! %l1 = ebf500b7caf17dcc
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 14413b9800d5fea5
	setx	0x9b03bfdfa99ff366,%g7,%l0 ! %l0 = 9b03bfdfa99ff366
!	%l1 = ebf500b7caf17dcc
	setx	0xa6600dbf95951080,%g7,%l1 ! %l1 = a6600dbf95951080
!	Mem[0000000010041404] = 000085bd, %l7 = ff000000e754ffd4
	ldsw	[%i1+0x004],%l7		! %l7 = 00000000000085bd
!	Mem[0000000030101410] = 00008a15, %f19 = abffc6a8
	lda	[%i4+%o5]0x89,%f19	! %f19 = 00008a15
!	Mem[0000000010081410] = 5b2069f20000a46d, %l4 = 00000000000000bc
	ldxa	[%i2+0x010]%asi,%l4	! %l4 = 5b2069f20000a46d
!	Mem[00000000100c1400] = 0000000000000000, %f26 = 1d01eb24 d9cd3499
	ldda	[%i3+%g0]0x80,%f26	! %f26 = 00000000 00000000
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000085bd, Mem[0000000030081408] = 740322d666512500
	stxa	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000000085bd

p0_label_38:
!	%f10 = 25965c3b c48f7312, Mem[0000000010181408] = ffff8117 35273578
	stda	%f10,[%i6+%o4]0x88	! Mem[0000000010181408] = 25965c3b c48f7312
!	Mem[00000000100c1400] = 00000000, %l6 = 0000000000000017
	swapa	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[000000001010142e] = 979e8acf, %l7 = 00000000000085bd
	ldstuba	[%i4+0x02e]%asi,%l7	! %l7 = 0000008a000000ff
!	%l3 = 00000000000000a5, Mem[0000000010101408] = 97007070
	stwa	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000a5
!	Mem[00000000300c1410] = 000038ff, %l6 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l6	! %l6 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[0000000021800000] = 22935d05, %asi = 80
	stha	%l5,[%o3+0x000]%asi	! Mem[0000000021800000] = 00005d05
!	%f24 = 345a82e7, %f17 = 6ea5980e, %f18 = 73a58dd8 00008a15
	fsmuld	%f24,%f17,%f18		! %f18 = 4471ab05 11ea1440
!	%f1  = a0728117, %f28 = 004b4167
	fcmpes	%fcc2,%f1 ,%f28		! %fcc2 = 1
!	%l5 = 0000000000000000, Mem[0000000030181408] = 9d543db4
	stba	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 00543db4
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 35435d09 00000000, %l6 = 000000ff, %l7 = 0000008a
	ldda	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000000 0000000035435d09

p0_label_39:
!	Mem[0000000010081408] = 73a58dd8, %l6 = 0000000000000000
	ldsha	[%i2+%o4]0x80,%l6	! %l6 = 00000000000073a5
!	Mem[0000000030001400] = 00000000, %l7 = 0000000035435d09
	lduba	[%i0+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = 12738fc4, %l6 = 00000000000073a5
	ldsha	[%i6+%o4]0x80,%l6	! %l6 = 0000000000001273
!	Mem[0000000010041404] = 000085bd, %l1 = a6600dbf95951080
	ldswa	[%i1+0x004]%asi,%l1	! %l1 = 00000000000085bd
!	Mem[0000000010081424] = 69cfe569, %l4 = 5b2069f20000a46d
	ldsb	[%i2+0x026],%l4		! %l4 = ffffffffffffffe5
!	Mem[0000000010141424] = 9abf4673, %l3 = 00000000000000a5
	lduba	[%i5+0x026]%asi,%l3	! %l3 = 0000000000000046
!	Mem[0000000010181410] = 000000e5 893c5b71, %l6 = 00001273, %l7 = 00000000
	ldda	[%i6+%o5]0x80,%l6	! %l6 = 00000000000000e5 00000000893c5b71
!	Mem[0000000020800040] = e0669e7c, %l0 = 9b03bfdfa99ff366
	lduba	[%o1+0x041]%asi,%l0	! %l0 = 0000000000000066
!	Mem[0000000030101410] = 00008a15, %l0 = 0000000000000066
	lduwa	[%i4+%o5]0x89,%l0	! %l0 = 0000000000008a15
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = ff9dd373, %l4 = ffffffffffffffe5
	ldstub	[%o2+%g0],%l4		! %l4 = 000000ff000000ff

p0_label_40:
!	%f24 = 345a82e7, %f24 = 345a82e7
	fcmpes	%fcc0,%f24,%f24		! %fcc0 = 0
!	Mem[0000000010001438] = 125b9d80, %l1 = 00000000000085bd
	swap	[%i0+0x038],%l1		! %l1 = 00000000125b9d80
!	Mem[0000000010081408] = d88da573, %l7 = 00000000893c5b71
	swapa	[%i2+%o4]0x88,%l7	! %l7 = 00000000d88da573
!	%l0 = 00008a15, %l1 = 125b9d80, Mem[0000000030081410] = 70ffffbf ffffff95
	stda	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 00008a15 125b9d80
!	%l0 = 0000000000008a15, Mem[0000000030101410] = 158a000000000000
	stxa	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000000000008a15
!	%l4 = 00000000000000ff, Mem[0000000030001410] = f7ab353f
	stwa	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000ff
!	%l6 = 00000000000000e5, Mem[00000000100c1419] = b3ac9f3d, %asi = 80
	stba	%l6,[%i3+0x019]%asi	! Mem[00000000100c1418] = b3e59f3d
!	%l6 = 00000000000000e5, Mem[00000000201c0001] = 9d8d387c
	stb	%l6,[%o0+0x001]		! Mem[00000000201c0000] = 9de5387c
!	Mem[00000000211c0001] = ff9dd373, %l0 = 0000000000008a15
	ldstuba	[%o2+0x001]%asi,%l0	! %l0 = 0000009d000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000 a46d3925, %l0 = 0000009d, %l1 = 125b9d80
	ldd	[%i1+%o5],%l0		! %l0 = 0000000000000000 00000000a46d3925

p0_label_41:
!	Mem[0000000030041408] = 8f5f000b, %l7 = 00000000d88da573
	lduba	[%i1+%o4]0x89,%l7	! %l7 = 000000000000000b
!	Mem[0000000010141400] = b5b31781, %l4 = 00000000000000ff
	lduwa	[%i5+%g0]0x88,%l4	! %l4 = 00000000b5b31781
!	Mem[0000000010001400] = bd85eb24 660a3499, %l0 = 00000000, %l1 = a46d3925
	ldda	[%i0+%g0]0x88,%l0	! %l0 = 00000000660a3499 00000000bd85eb24
!	Mem[00000000300c1408] = ad8be22ea0728117, %f6  = ff0034d4 715b3889
	ldda	[%i3+%o4]0x89,%f6 	! %f6  = ad8be22e a0728117
!	Mem[0000000030101400] = d4000000 947b56ab, %l2 = ff000000, %l3 = 00000046
	ldda	[%i4+%g0]0x81,%l2	! %l2 = 00000000d4000000 00000000947b56ab
!	Mem[0000000030041408] = e0f687dc8f5f000b, %l4 = 00000000b5b31781
	ldxa	[%i1+%o4]0x89,%l4	! %l4 = e0f687dc8f5f000b
!	Mem[0000000030041410] = 00000000, %l4 = e0f687dc8f5f000b
	ldsba	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081430] = 004b4167 f74bd567, %l2 = d4000000, %l3 = 947b56ab
	ldd	[%i2+0x030],%l2		! %l2 = 00000000004b4167 00000000f74bd567
!	Mem[0000000010001410] = 00000000, %l6 = 00000000000000e5
	ldsh	[%i0+0x012],%l6		! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 715b3889, %l5 = 0000000000000000
	ldstuba	[%i1+%g0]0x81,%l5	! %l5 = 00000071000000ff

p0_label_42:
!	%l6 = 0000000000000000, Mem[0000000010101408] = 000000a5
	stha	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	%f18 = 4471ab05, Mem[0000000010181410] = e5000000
	sta	%f18,[%i6+%o5]0x88	! Mem[0000000010181410] = 4471ab05
!	Mem[0000000030081410] = 158a0000, %l0 = 00000000660a3499
	ldstuba	[%i2+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000030041400] = ff5b3889
	stba	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 005b3889
!	Mem[0000000010101408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181410] = 4471ab05, %l6 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l6	! %l6 = 00000005000000ff
!	Mem[0000000030001410] = 000000ff, %l1 = 00000000bd85eb24
	swapa	[%i0+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	%l6 = 0000000000000005, %l6 = 0000000000000005, %y  = 00000000
	umul	%l6,%l6,%l1		! %l1 = 0000000000000019, %y = 00000000
!	%f25 = 69cfe569, Mem[0000000030101400] = d4000000
	sta	%f25,[%i4+%g0]0x81	! Mem[0000000030101400] = 69cfe569
!	Starting 10 instruction Load Burst
!	%f1  = a0728117, %f15 = 0000a46d
	fcmpes	%fcc1,%f1 ,%f15		! %fcc1 = 1

p0_label_43:
!	Mem[00000000201c0000] = 9de5387c, %l3 = 00000000f74bd567
	ldsba	[%o0+0x001]%asi,%l3	! %l3 = ffffffffffffffe5
!	Mem[0000000010181400] = ff000000, %l1 = 0000000000000019
	ldswa	[%i6+%g0]0x80,%l1	! %l1 = ffffffffff000000
!	Mem[00000000100c1400] = 0000000000000017, %f18 = 4471ab05 11ea1440
	ldda	[%i3+%g0]0x88,%f18	! %f18 = 00000000 00000017
!	Mem[0000000030181408] = 00543db4 00000000, %l0 = 00000000, %l1 = ff000000
	ldda	[%i6+%o4]0x81,%l0	! %l0 = 0000000000543db4 0000000000000000
!	Mem[0000000010001400] = 660a3499, %l3 = ffffffffffffffe5
	ldsba	[%i0+%g0]0x88,%l3	! %l3 = ffffffffffffff99
!	Mem[000000001014141c] = e0b47b94, %l0 = 0000000000543db4
	ldswa	[%i5+0x01c]%asi,%l0	! %l0 = ffffffffe0b47b94
!	Mem[00000000100c1430] = 2ebf36ae 723348cb, %l0 = e0b47b94, %l1 = 00000000
	ldda	[%i3+0x030]%asi,%l0	! %l0 = 000000002ebf36ae 00000000723348cb
!	Mem[00000000211c0000] = ffffd373, %l6 = 0000000000000005
	lduba	[%o2+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101410] = 00000000, %l4 = 0000000000000000
	ldswa	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000004b4167, Mem[0000000030081400] = d9ba90aca0728117
	stxa	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000004b4167

p0_label_44:
!	Mem[0000000010001400] = 660a3499, %l5 = 0000000000000071
	swapa	[%i0+%g0]0x88,%l5	! %l5 = 00000000660a3499
!	%l3 = ffffffffffffff99, Mem[0000000010141408] = 178172a0
	stba	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 17817299
!	%l3 = ffffffffffffff99, Mem[0000000030001408] = ff8f460f
	stha	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = ff99460f
!	%f18 = 00000000 00000017, Mem[0000000010181410] = 4471abff 715b3c89
	stda	%f18,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000 00000017
!	Mem[0000000030041400] = 005b3889, %l2 = 00000000004b4167
	ldstuba	[%i1+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%l5 = 00000000660a3499, Mem[0000000030101400] = 69e5cf69
	stha	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 69e53499
!	Mem[0000000020800001] = 7600ab32, %l3 = ffffffffffffff99
	ldstuba	[%o1+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	%f31 = e162f86c, %f31 = e162f86c
	fcmps	%fcc2,%f31,%f31		! %fcc2 = 0
!	Mem[00000000100c1410] = ff008117, %l7 = 000000000000000b
	swapa	[%i3+%o5]0x80,%l7	! %l7 = 00000000ff008117
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 000085bd, %l2 = 0000000000000000
	ldswa	[%i2+%o4]0x89,%l2	! %l2 = 00000000000085bd

p0_label_45:
!	Mem[0000000010081400] = 5de00000, %f28 = 004b4167
	lda	[%i2+%g0]0x80,%f28	! %f28 = 5de00000
!	Mem[0000000030101408] = e05df8bd, %l5 = 00000000660a3499
	lduwa	[%i4+%o4]0x81,%l5	! %l5 = 00000000e05df8bd
!	Mem[00000000100c1400] = 00000017, %l2 = 00000000000085bd
	lduha	[%i3+%g0]0x88,%l2	! %l2 = 0000000000000017
!	Mem[0000000030101408] = e05df8bd, %f4  = d43400ff
	lda	[%i4+%o4]0x81,%f4 	! %f4 = e05df8bd
!	Mem[0000000030081410] = ff008a15, %l6 = 00000000000000ff
	lduba	[%i2+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101408] = 00000000bdf85de0, %l0 = 000000002ebf36ae
	ldxa	[%i4+%o4]0x89,%l0	! %l0 = 00000000bdf85de0
!	Mem[0000000010081404] = 6eff980e, %l0 = 00000000bdf85de0
	lduh	[%i2+0x004],%l0		! %l0 = 0000000000006eff
!	Mem[00000000300c1400] = d48da573, %l7 = 00000000ff008117
	ldswa	[%i3+%g0]0x81,%l7	! %l7 = ffffffffd48da573
!	Mem[0000000010141410] = e943b5c4, %l4 = 0000000000000000
	lduba	[%i5+%o5]0x80,%l4	! %l4 = 00000000000000e9
!	Starting 10 instruction Store Burst
!	%f0  = d9ba90ac a0728117 bfc25ba5 00000000
!	%f4  = e05df8bd 1cb13fbb ad8be22e a0728117
!	%f8  = 00000000 ff606bd5 25965c3b c48f7312
!	%f12 = b78117c2 620a7b00 5b2069f2 0000a46d
	stda	%f0,[%i4]ASI_COMMIT_S	! Block Store to 0000000030101400

p0_label_46:
	membar	#Sync			! Added by membar checker (4)
!	%l5 = 00000000e05df8bd, Mem[0000000030101400] = d9ba90ac
	stba	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = bdba90ac
!	Mem[0000000010001408] = 00000000, %l3 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000000
!	%f2  = bfc25ba5, Mem[00000000300c1400] = 73a58dd4
	sta	%f2 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = bfc25ba5
!	%l6 = 000000ff, %l7 = d48da573, Mem[0000000010081410] = 5b2069f2 0000a46d
	stda	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff d48da573
!	%l4 = 00000000000000e9, Mem[00000000100c1400] = 00000017
	stwa	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000e9
!	%f16 = 5de00000 6ea5980e, Mem[0000000010101400] = 8f5f000b 81a7b3d8
	std	%f16,[%i4+%g0]	! Mem[0000000010101400] = 5de00000 6ea5980e
!	%l1 = 00000000723348cb, Mem[0000000010081408] = 893c5b71
	stwa	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = 723348cb
!	%l5 = 00000000e05df8bd, Mem[0000000030041408] = 0b005f8f
	stwa	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = e05df8bd
!	Mem[0000000030001410] = bd85eb24, %l6 = 00000000000000ff
	ldstuba	[%i0+%o5]0x81,%l6	! %l6 = 000000bd000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 67414b0000000000, %f0  = d9ba90ac a0728117
	ldda	[%i2+%g0]0x81,%f0 	! %f0  = 67414b00 00000000

p0_label_47:
!	Mem[0000000010001400] = 00000071, %f19 = 00000017
	lda	[%i0+%g0]0x88,%f19	! %f19 = 00000071
!	Mem[0000000010001408] = 35435d09 00000000, %l6 = 000000bd, %l7 = d48da573
	ldda	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000000 0000000035435d09
!	Mem[0000000030181400] = 6da40000, %f31 = e162f86c
	lda	[%i6+%g0]0x81,%f31	! %f31 = 6da40000
!	Mem[0000000020800000] = 76ffab32, %l7 = 0000000035435d09
	lduh	[%o1+%g0],%l7		! %l7 = 00000000000076ff
!	Mem[0000000030041410] = 9dff000000000000, %f28 = 5de00000 f74bd567
	ldda	[%i1+%o5]0x89,%f28	! %f28 = 9dff0000 00000000
!	Mem[0000000010101410] = 54e98dd8, %l0 = 0000000000006eff
	ldswa	[%i4+%o5]0x80,%l0	! %l0 = 0000000054e98dd8
!	Mem[0000000010001410] = 25396da400000000, %f22 = 9e86b923 bdf85de0
	ldda	[%i0+%o5]0x88,%f22	! %f22 = 25396da4 00000000
!	Mem[00000000100c1438] = 2615d42c, %l4 = 00000000000000e9
	ldub	[%i3+0x038],%l4		! %l4 = 0000000000000026
!	Mem[0000000030141400] = d4ffffff, %f17 = 6ea5980e
	lda	[%i5+%g0]0x81,%f17	! %f17 = d4ffffff
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000017, immd = 00000000000001dd, %l4 = 0000000000000026
	udivx	%l2,0x1dd,%l4		! %l4 = 0000000000000000

p0_label_48:
!	%l7 = 00000000000076ff, Mem[0000000010181400] = 000000ff
	stwa	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = 000076ff
!	Mem[0000000030141408] = f5678610, %l2 = 0000000000000017
	swapa	[%i5+%o4]0x89,%l2	! %l2 = 00000000f5678610
!	Mem[0000000030181410] = ff0034d4, %l6 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l6	! %l6 = 00000000ff0034d4
!	Mem[0000000010081400] = 5de000006eff980e, %l0 = 0000000054e98dd8, %l4 = 0000000000000000
	casxa	[%i2]0x80,%l0,%l4	! %l4 = 5de000006eff980e
!	%l4 = 5de000006eff980e, Mem[0000000010141410] = e943b5c4
	stwa	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 6eff980e
!	Mem[0000000010001400] = 71000000, %l4 = 5de000006eff980e
	ldstuba	[%i0+%g0]0x80,%l4	! %l4 = 00000071000000ff
!	%f14 = 5b2069f2, Mem[0000000030081408] = bd850000
	sta	%f14,[%i2+%o4]0x81	! Mem[0000000030081408] = 5b2069f2
!	%l5 = 00000000e05df8bd, Mem[0000000010101434] = a1ada7ca, %asi = 80
	stwa	%l5,[%i4+0x034]%asi	! Mem[0000000010101434] = e05df8bd
!	%f8  = 00000000 ff606bd5, Mem[00000000300c1400] = bfc25ba5 abffc6a8
	stda	%f8 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 ff606bd5
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ff008a15125b9d80, %l3 = 0000000000000000
	ldxa	[%i2+%o5]0x81,%l3	! %l3 = ff008a15125b9d80

p0_label_49:
!	Mem[00000000300c1400] = ff606bd5, %f4  = e05df8bd
	lda	[%i3+%g0]0x89,%f4 	! %f4 = ff606bd5
!	Mem[0000000030101408] = 00000000 a55bc2bf, %l4 = 00000071, %l5 = e05df8bd
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 00000000a55bc2bf 0000000000000000
!	Mem[0000000030081400] = 67414b00, %l4 = 00000000a55bc2bf
	lduha	[%i2+%g0]0x81,%l4	! %l4 = 0000000000006741
!	Mem[00000000100c1400] = e900000000000000, %f8  = 00000000 ff606bd5
	ldda	[%i3+%g0]0x80,%f8 	! %f8  = e9000000 00000000
!	Mem[0000000010101408] = 000000ff, %f12 = b78117c2
	lda	[%i4+%o4]0x88,%f12	! %f12 = 000000ff
!	Mem[0000000010081438] = 9cceeadcce245629, %l7 = 00000000000076ff
	ldx	[%i2+0x038],%l7		! %l7 = 9cceeadcce245629
!	Mem[0000000010141410] = 6eff980e, %l4 = 0000000000006741
	ldswa	[%i5+%o5]0x80,%l4	! %l4 = 000000006eff980e
!	Mem[0000000010001408] = 00000000, %l5 = 0000000000000000
	lduwa	[%i0+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041408] = bdf85de0, %l2 = 00000000f5678610
	ldsha	[%i1+%o4]0x89,%l2	! %l2 = 0000000000005de0
!	Starting 10 instruction Store Burst
!	%l6 = ff0034d4, %l7 = ce245629, Mem[00000000100c1400] = 000000e9 00000000
	stda	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = ff0034d4 ce245629

p0_label_50:
!	%l2 = 0000000000005de0, Mem[0000000010181408] = 12738fc4
	stwa	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 00005de0
!	%l0 = 54e98dd8, %l1 = 723348cb, Mem[00000000300c1408] = a0728117 ad8be22e
	stda	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 54e98dd8 723348cb
!	Mem[0000000010101420] = 2ee28bad, %l6 = 00000000ff0034d4
	lduw	[%i4+0x020],%l6		! %l6 = 000000002ee28bad
!	%f30 = a0728117 6da40000, Mem[0000000010041408] = 7b9c8d1a 095d4335
	std	%f30,[%i1+%o4]	! Mem[0000000010041408] = a0728117 6da40000
!	%l1 = 00000000723348cb, Mem[0000000030041410] = 00000000
	stha	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = 48cb0000
!	%l5 = 0000000000000000, imm = 0000000000000e37, %l0 = 0000000054e98dd8
	xor	%l5,0xe37,%l0		! %l0 = 0000000000000e37
!	Mem[0000000010081400] = 0000e05d, %l1 = 00000000723348cb
	ldstuba	[%i2+%g0]0x88,%l1	! %l1 = 0000005d000000ff
!	%f30 = a0728117 6da40000, %l1 = 000000000000005d
!	Mem[0000000030081400] = 67414b0000000000
	stda	%f30,[%i2+%l1]ASI_PST8_S ! Mem[0000000030081400] = 67724b176da40000
!	Mem[0000000010001410] = 00000000, %l0 = 0000000000000e37
	ldstuba	[%i0+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 158a00ff, %l6 = 000000002ee28bad
	lduwa	[%i2+%o5]0x89,%l6	! %l6 = 00000000158a00ff

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	mulx	%l6,%l0,%l5
	sdiv	%l6,%l5,%l7
	stb	%l6,[%i3+0x030]
	lda	[%i1+0x028]%asi,%l4
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 000000000000005d
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000005de0
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be ff008a15125b9d80
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 000000006eff980e
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 00000000158a00ff
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 9cceeadcce245629
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check Floating Point Registers

p0_check_fp_registers:
	set	p0_expected_fp_regs,%g3
	std	%f0,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x00],%l0
	cmp	%l0,%l1			! %f0  should be 67414b00 00000000
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be bfc25ba5 00000000
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be ff606bd5 1cb13fbb
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be ad8be22e a0728117
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be e9000000 00000000
	bne	%xcc,p0_f8_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 000000ff 620a7b00
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 5b2069f2 0000a46d
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 5de00000 d4ffffff
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00000000 00000071
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 5b2069f2 0000a46d
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 25396da4 00000000
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 345a82e7 69cfe569
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 00000000 00000000
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 9dff0000 00000000
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be a0728117 6da40000
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
	xor	%l5,-0x228,%l4
	orn	%l5,%l4,%l2
	udivx	%l6,%l4,%l5
	fcmps	%fcc1,%f0 ,%f4 
	fmuls	%f13,%f1 ,%f6 
	mulx	%l3,-0xfec,%l7
	done

p0_trap1o:
	xor	%l5,-0x228,%l4
	orn	%l5,%l4,%l2
	udivx	%l6,%l4,%l5
	fcmps	%fcc1,%f0 ,%f4 
	fmuls	%f13,%f1 ,%f6 
	mulx	%l3,-0xfec,%l7
	done


p0_trap2e:
	or	%l2,%l4,%l2
	done

p0_trap2o:
	or	%l2,%l4,%l2
	done


p0_trap3e:
	orn	%l1,0x11f,%l0
	xor	%l2,0xf88,%l6
	orn	%l3,%l1,%l0
	addc	%l2,-0x068,%l1
	add	%l6,0x8b5,%l3
	subc	%l7,%l1,%l0
	done

p0_trap3o:
	orn	%l1,0x11f,%l0
	xor	%l2,0xf88,%l6
	orn	%l3,%l1,%l0
	addc	%l2,-0x068,%l1
	add	%l6,0x8b5,%l3
	subc	%l7,%l1,%l0
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
	ldx	[%g1+0x000],%l0		! %l0 = 7138cabc5d96979e
	ldx	[%g1+0x008],%l1		! %l1 = f170e958795e5134
	ldx	[%g1+0x010],%l2		! %l2 = 6c54bbafc24715f2
	ldx	[%g1+0x018],%l3		! %l3 = 91f201ca4f78b804
	ldx	[%g1+0x020],%l4		! %l4 = 97dcfd187e9c6b66
	ldx	[%g1+0x028],%l5		! %l5 = 1ed02e6a9ee40797
	ldx	[%g1+0x030],%l6		! %l6 = 8718ff3e49e485bd
	ldx	[%g1+0x038],%l7		! %l7 = 94666e52ab567b94

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
	xor	%l5,-0x228,%l4
	orn	%l5,%l4,%l2
	udivx	%l6,%l4,%l5
	fcmps	%fcc1,%f0 ,%f4 
	fmuls	%f13,%f1 ,%f6 
	mulx	%l3,-0xfec,%l7
	jmpl	%o7,%g0
	smul	%l6,%l2,%l0
p0_near_0_he:
	add	%l1,-0x93c,%l0
	and	%l0,-0xc2a,%l7
	jmpl	%o7,%g0
	swap	[%i1+0x028],%l2		! Mem[0000000010041428]
near0_b2b_h:
	and	%l6,%l1,%l5
	sdivx	%l5,%l2,%l4
	xnor	%l1,-0x7e8,%l4
	xor	%l4,%l7,%l6
	jmpl	%o7,%g0
	fdivs	%f29,%f17,%f27
near0_b2b_l:
	andn	%l7,%l4,%l6
	fmuls	%f15,%f15,%f1 
	fadds	%f6 ,%f12,%f0 
	fsqrts	%f9 ,%f13
	jmpl	%o7,%g0
	fcmps	%fcc3,%f12,%f6 
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	fdivs	%f15,%f8 ,%f1 
	and	%l3,%l4,%l2
	mulx	%l5,-0x5e0,%l7
	fsqrts	%f11,%f13
	add	%l7,%l0,%l2
	fsqrts	%f8 ,%f9 
	udivx	%l2,%l5,%l0
	jmpl	%o7,%g0
	sdivx	%l1,-0x6bd,%l6
p0_near_1_he:
	fsqrts	%f29,%f17
	and	%l3,%l4,%l5
	sub	%l1,-0xadd,%l0
	fadds	%f26,%f23,%f22
	jmpl	%o7,%g0
	subc	%l6,-0x763,%l7
near1_b2b_h:
	fmuls	%f26,%f30,%f21
	mulx	%l7,%l4,%l5
	mulx	%l6,0xdc5,%l3
	fsubs	%f17,%f31,%f22
	umul	%l7,%l0,%l1
	fmuls	%f31,%f16,%f22
	jmpl	%o7,%g0
	mulx	%l7,-0x5cd,%l0
near1_b2b_l:
	xor	%l3,%l2,%l6
	fcmps	%fcc2,%f0 ,%f10
	mulx	%l3,%l7,%l2
	mulx	%l3,0x9a0,%l5
	add	%l5,-0xb32,%l5
	fsqrts	%f3 ,%f1 
	jmpl	%o7,%g0
	mulx	%l6,0xe80,%l3
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	fadds	%f7 ,%f13,%f12
	fdivs	%f5 ,%f7 ,%f8 
	jmpl	%o7,%g0
	or	%l6,%l3,%l1
p0_near_2_he:
	and	%l4,%l0,%l3
	subc	%l1,-0xe04,%l7
	fsubs	%f26,%f28,%f28
	ldx	[%i4+0x010],%l6		! Mem[0000000010101410]
	add	%l3,%l5,%l3
	jmpl	%o7,%g0
	ldsb	[%i5+0x01d],%l4		! Mem[000000001014141d]
near2_b2b_h:
	xor	%l0,%l4,%l0
	fadds	%f17,%f25,%f31
	sub	%l6,%l3,%l4
	jmpl	%o7,%g0
	xnor	%l0,%l1,%l4
near2_b2b_l:
	subc	%l0,0x848,%l4
	addc	%l4,%l3,%l1
	subc	%l6,%l6,%l2
	jmpl	%o7,%g0
	fstod	%f1 ,%f14
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	xor	%l2,-0x345,%l3
	jmpl	%o7,%g0
	udivx	%l2,-0xf04,%l7
p0_near_3_he:
	ldd	[%i1+0x028],%f22	! Mem[0000000010041428]
	or	%l0,0xb33,%l3
	smul	%l2,0x27e,%l7
	mulx	%l7,-0x72b,%l5
	jmpl	%o7,%g0
	subc	%l7,%l5,%l6
near3_b2b_h:
	udivx	%l4,%l7,%l6
	umul	%l2,0xb06,%l3
	addc	%l6,%l6,%l6
	mulx	%l0,0x441,%l7
	andn	%l4,0x2e9,%l2
	jmpl	%o7,%g0
	umul	%l4,-0xf65,%l1
near3_b2b_l:
	sdivx	%l5,%l7,%l7
	addc	%l4,-0x0af,%l2
	andn	%l3,%l5,%l3
	smul	%l0,0x7e0,%l0
	fcmps	%fcc1,%f2 ,%f4 
	jmpl	%o7,%g0
	subc	%l7,0x798,%l1
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	smul	%l6,-0x2f1,%l2
	mulx	%l3,0x784,%l4
	sdivx	%l6,-0x06c,%l0
	fdivs	%f11,%f7 ,%f14
	and	%l1,-0x1f4,%l6
	jmpl	%o7,%g0
	and	%l2,%l0,%l2
p0_far_0_lem:
	smul	%l6,-0x2f1,%l2
	mulx	%l3,0x784,%l4
	sdivx	%l6,-0x06c,%l0
	fdivs	%f11,%f7 ,%f14
	and	%l1,-0x1f4,%l6
	jmpl	%o7,%g0
	and	%l2,%l0,%l2
p0_far_0_he:
	orn	%l6,%l6,%l1
	mulx	%l5,-0x8df,%l7
	xnor	%l7,%l4,%l4
	xor	%l3,-0x55c,%l2
	fadds	%f18,%f18,%f30
	swap	[%i5+0x024],%l1		! Mem[0000000010141424]
	xor	%l3,%l4,%l0
	jmpl	%o7,%g0
	umul	%l1,-0xe4a,%l5
p0_far_0_hem:
	orn	%l6,%l6,%l1
	mulx	%l5,-0x8df,%l7
	xnor	%l7,%l4,%l4
	xor	%l3,-0x55c,%l2
	fadds	%f18,%f18,%f30
	membar	#Sync
	swap	[%i5+0x024],%l1		! Mem[0000000010141424]
	xor	%l3,%l4,%l0
	jmpl	%o7,%g0
	umul	%l1,-0xe4a,%l5
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	umul	%l1,0x5e2,%l3
	jmpl	%o7,%g0
	xnor	%l7,-0x519,%l5
far0_b2b_l:
	xnor	%l1,0x378,%l3
	jmpl	%o7,%g0
	sdivx	%l7,-0x27e,%l2
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	fcmps	%fcc3,%f0 ,%f13
	umul	%l1,%l1,%l6
	jmpl	%o7,%g0
	fadds	%f3 ,%f8 ,%f5 
p0_far_1_lem:
	fcmps	%fcc3,%f0 ,%f13
	umul	%l1,%l1,%l6
	jmpl	%o7,%g0
	fadds	%f3 ,%f8 ,%f5 
p0_far_1_he:
	orn	%l3,%l2,%l4
	sdivx	%l5,0xfec,%l3
	mulx	%l7,-0x5b8,%l3
	subc	%l2,0xd18,%l6
	xor	%l4,%l5,%l3
	fdivs	%f23,%f22,%f22
	or	%l1,%l4,%l1
	jmpl	%o7,%g0
	fdivs	%f19,%f23,%f30
p0_far_1_hem:
	orn	%l3,%l2,%l4
	sdivx	%l5,0xfec,%l3
	mulx	%l7,-0x5b8,%l3
	subc	%l2,0xd18,%l6
	xor	%l4,%l5,%l3
	fdivs	%f23,%f22,%f22
	or	%l1,%l4,%l1
	jmpl	%o7,%g0
	fdivs	%f19,%f23,%f30
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	jmpl	%o7,%g0
	xnor	%l4,0x417,%l4
	jmpl	%o7,%g0
	nop
far1_b2b_l:
	jmpl	%o7,%g0
	fsqrts	%f3 ,%f3 
	jmpl	%o7,%g0
	nop
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	fstod	%f10,%f12
	and	%l4,%l0,%l3
	or	%l0,0x91c,%l6
	mulx	%l5,%l4,%l2
	fdivs	%f6 ,%f5 ,%f10
	addc	%l7,0x9bd,%l0
	xnor	%l3,%l6,%l5
	jmpl	%o7,%g0
	mulx	%l0,0xef0,%l3
p0_far_2_lem:
	fstod	%f10,%f12
	and	%l4,%l0,%l3
	or	%l0,0x91c,%l6
	mulx	%l5,%l4,%l2
	fdivs	%f6 ,%f5 ,%f10
	addc	%l7,0x9bd,%l0
	xnor	%l3,%l6,%l5
	jmpl	%o7,%g0
	mulx	%l0,0xef0,%l3
p0_far_2_he:
	mulx	%l0,%l5,%l0
	add	%l1,%l0,%l0
	sdivx	%l3,%l1,%l7
	or	%l4,%l5,%l7
	jmpl	%o7,%g0
	udivx	%l1,0x370,%l7
p0_far_2_hem:
	mulx	%l0,%l5,%l0
	add	%l1,%l0,%l0
	sdivx	%l3,%l1,%l7
	or	%l4,%l5,%l7
	jmpl	%o7,%g0
	udivx	%l1,0x370,%l7
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	sdivx	%l5,-0xadf,%l7
	mulx	%l3,%l4,%l2
	xor	%l0,-0xcb5,%l2
	fcmps	%fcc3,%f22,%f18
	add	%l6,%l7,%l4
	fsubs	%f19,%f27,%f31
	jmpl	%o7,%g0
	umul	%l6,-0x63e,%l6
far2_b2b_l:
	andn	%l1,%l1,%l7
	orn	%l2,%l4,%l0
	or	%l3,%l5,%l1
	fsubs	%f2 ,%f5 ,%f11
	andn	%l1,%l3,%l7
	andn	%l0,-0xb24,%l1
	jmpl	%o7,%g0
	addc	%l6,0x248,%l1
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	fdivs	%f14,%f3 ,%f15
	jmpl	%o7,%g0
	subc	%l6,%l1,%l4
p0_far_3_lem:
	fdivs	%f14,%f3 ,%f15
	jmpl	%o7,%g0
	subc	%l6,%l1,%l4
p0_far_3_he:
	fsubs	%f27,%f18,%f16
	udivx	%l5,%l2,%l1
	mulx	%l4,0x5c8,%l4
	sub	%l2,%l2,%l7
	lduw	[%i2+0x028],%l5		! Mem[0000000010081428]
	andn	%l6,0x801,%l1
	jmpl	%o7,%g0
	fmuls	%f17,%f19,%f17
p0_far_3_hem:
	fsubs	%f27,%f18,%f16
	udivx	%l5,%l2,%l1
	mulx	%l4,0x5c8,%l4
	sub	%l2,%l2,%l7
	membar	#Sync
	lduw	[%i2+0x028],%l5		! Mem[0000000010081428]
	andn	%l6,0x801,%l1
	jmpl	%o7,%g0
	fmuls	%f17,%f19,%f17
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	udivx	%l1,0xd41,%l5
	fmuls	%f25,%f23,%f17
	fsubs	%f22,%f22,%f29
	mulx	%l2,%l4,%l0
	jmpl	%o7,%g0
	mulx	%l6,%l7,%l4
far3_b2b_l:
	fsqrts	%f12,%f5 
	fsqrts	%f5 ,%f11
	fmuls	%f11,%f0 ,%f11
	fadds	%f10,%f13,%f7 
	jmpl	%o7,%g0
	add	%l6,0x15c,%l4
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	umul	%l4,0x064,%l5
	udivx	%l6,%l6,%l1
	and	%l1,-0x493,%l3
	xor	%l1,0x878,%l5
	sub	%l0,%l2,%l6
	xnor	%l1,0x529,%l5
	jmpl	%g6+8,%g0
	sub	%l4,%l6,%l1
p0_call_0_le:
	mulx	%l2,%l2,%l5
	mulx	%l0,%l7,%l4
	retl
	fdivs	%f3 ,%f3 ,%f8 
p0_jmpl_0_lo:
	umul	%l4,0x064,%l5
	udivx	%l6,%l6,%l1
	and	%l1,-0x493,%l3
	xor	%l1,0x878,%l5
	sub	%l0,%l2,%l6
	xnor	%l1,0x529,%l5
	jmpl	%g6+8,%g0
	sub	%l4,%l6,%l1
p0_call_0_lo:
	mulx	%l2,%l2,%l5
	mulx	%l0,%l7,%l4
	retl
	fdivs	%f3 ,%f3 ,%f8 
p0_jmpl_0_he:
	xor	%l1,%l2,%l5
	sdivx	%l3,-0xa44,%l3
	orn	%l3,0xa72,%l3
	and	%l5,-0x033,%l2
	jmpl	%g6+8,%g0
	xnor	%l6,%l0,%l4
p0_call_0_he:
	retl
	mulx	%l3,%l0,%l2
p0_jmpl_0_ho:
	xor	%l1,%l2,%l5
	sdivx	%l3,-0xa44,%l3
	orn	%l3,0xa72,%l3
	and	%l5,-0x033,%l2
	jmpl	%g6+8,%g0
	xnor	%l6,%l0,%l4
p0_call_0_ho:
	retl
	mulx	%l3,%l0,%l2
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	or	%l6,0xf34,%l1
	umul	%l6,-0xde9,%l5
	sub	%l0,0xdf1,%l2
	fadds	%f2 ,%f7 ,%f6 
	jmpl	%g6+8,%g0
	or	%l7,%l3,%l4
p0_call_1_le:
	retl
	ldsw	[%i6+0x01c],%l2		! Mem[000000001018141c]
p0_jmpl_1_lo:
	or	%l6,0xf34,%l1
	umul	%l6,-0xde9,%l5
	sub	%l0,0xdf1,%l2
	fadds	%f2 ,%f7 ,%f6 
	jmpl	%g6+8,%g0
	or	%l7,%l3,%l4
p0_call_1_lo:
	retl
	ldsw	[%o6+0x01c],%l2		! Mem[000000001018141c]
p0_jmpl_1_he:
	xnor	%l2,%l2,%l4
	andn	%l2,%l4,%l4
	fdtos	%f18,%f26
	and	%l0,%l3,%l4
	sub	%l2,0x1db,%l3
	add	%l7,-0xf5f,%l5
	fmuls	%f17,%f29,%f26
	jmpl	%g6+8,%g0
	fadds	%f28,%f17,%f21
p0_call_1_he:
	fdivs	%f16,%f28,%f17
	orn	%l4,-0x13e,%l7
	add	%l7,%l0,%l5
	andn	%l7,%l6,%l1
	st	%f25,[%i0+0x038]	! Mem[0000000010001438]
	fadds	%f23,%f30,%f16
	fadds	%f19,%f21,%f16
	retl
	umul	%l7,0xc2b,%l1
p0_jmpl_1_ho:
	xnor	%l2,%l2,%l4
	andn	%l2,%l4,%l4
	fdtos	%f18,%f26
	and	%l0,%l3,%l4
	sub	%l2,0x1db,%l3
	add	%l7,-0xf5f,%l5
	fmuls	%f17,%f29,%f26
	jmpl	%g6+8,%g0
	fadds	%f28,%f17,%f21
p0_call_1_ho:
	fdivs	%f16,%f28,%f17
	orn	%l4,-0x13e,%l7
	add	%l7,%l0,%l5
	andn	%l7,%l6,%l1
	st	%f25,[%o0+0x038]	! Mem[0000000010001438]
	fadds	%f23,%f30,%f16
	fadds	%f19,%f21,%f16
	retl
	umul	%l7,0xc2b,%l1
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	mulx	%l4,0xb4b,%l4
	mulx	%l7,0x68e,%l2
	sdivx	%l2,0x9f4,%l6
	xnor	%l0,%l7,%l6
	fstoi	%f11,%f10
	jmpl	%g6+8,%g0
	or	%l3,%l1,%l3
p0_call_2_le:
	and	%l5,%l7,%l4
	fcmps	%fcc1,%f4 ,%f0 
	fsubs	%f1 ,%f9 ,%f13
	sub	%l5,%l4,%l4
	umul	%l1,%l5,%l2
	fdivs	%f4 ,%f5 ,%f14
	retl
	andn	%l4,0x391,%l7
p0_jmpl_2_lo:
	mulx	%l4,0xb4b,%l4
	mulx	%l7,0x68e,%l2
	sdivx	%l2,0x9f4,%l6
	xnor	%l0,%l7,%l6
	fstoi	%f11,%f10
	jmpl	%g6+8,%g0
	or	%l3,%l1,%l3
p0_call_2_lo:
	and	%l5,%l7,%l4
	fcmps	%fcc1,%f4 ,%f0 
	fsubs	%f1 ,%f9 ,%f13
	sub	%l5,%l4,%l4
	umul	%l1,%l5,%l2
	fdivs	%f4 ,%f5 ,%f14
	retl
	andn	%l4,0x391,%l7
p0_jmpl_2_he:
	subc	%l4,-0x9a7,%l3
	or	%l6,-0x6d3,%l1
	xnor	%l1,%l7,%l3
	addc	%l3,%l7,%l3
	fcmps	%fcc1,%f30,%f22
	jmpl	%g6+8,%g0
	sdivx	%l2,-0xfe1,%l7
p0_call_2_he:
	fadds	%f29,%f24,%f27
	umul	%l2,-0xec6,%l2
	fadds	%f19,%f28,%f19
	swap	[%i2+0x02c],%l6		! Mem[000000001008142c]
	xor	%l7,%l0,%l3
	retl
	andn	%l4,-0xe7c,%l5
p0_jmpl_2_ho:
	subc	%l4,-0x9a7,%l3
	or	%l6,-0x6d3,%l1
	xnor	%l1,%l7,%l3
	addc	%l3,%l7,%l3
	fcmps	%fcc1,%f30,%f22
	jmpl	%g6+8,%g0
	sdivx	%l2,-0xfe1,%l7
p0_call_2_ho:
	fadds	%f29,%f24,%f27
	umul	%l2,-0xec6,%l2
	fadds	%f19,%f28,%f19
	swap	[%o2+0x02c],%l6		! Mem[000000001008142c]
	xor	%l7,%l0,%l3
	retl
	andn	%l4,-0xe7c,%l5
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	mulx	%l2,%l2,%l2
	andn	%l1,%l7,%l2
	addc	%l7,0xb68,%l1
	jmpl	%g6+8,%g0
	lduw	[%i0+0x028],%l0		! Mem[0000000010001428]
p0_call_3_le:
	fsubs	%f15,%f4 ,%f15
	mulx	%l6,0x933,%l6
	fdivs	%f15,%f7 ,%f8 
	fadds	%f11,%f4 ,%f6 
	fsubs	%f4 ,%f4 ,%f8 
	andn	%l6,%l2,%l0
	retl
	fadds	%f0 ,%f3 ,%f15
p0_jmpl_3_lo:
	mulx	%l2,%l2,%l2
	andn	%l1,%l7,%l2
	addc	%l7,0xb68,%l1
	jmpl	%g6+8,%g0
	lduw	[%o0+0x028],%l0		! Mem[0000000010001428]
p0_call_3_lo:
	fsubs	%f15,%f4 ,%f15
	mulx	%l6,0x933,%l6
	fdivs	%f15,%f7 ,%f8 
	fadds	%f11,%f4 ,%f6 
	fsubs	%f4 ,%f4 ,%f8 
	andn	%l6,%l2,%l0
	retl
	fadds	%f0 ,%f3 ,%f15
p0_jmpl_3_he:
	fdtos	%f28,%f16
	lduw	[%i1+0x008],%l0		! Mem[0000000010041408]
	fmuls	%f22,%f17,%f23
	jmpl	%g6+8,%g0
	fcmps	%fcc2,%f24,%f22
p0_call_3_he:
	fadds	%f17,%f26,%f18
	andn	%l2,%l2,%l5
	or	%l5,-0x419,%l1
	xnor	%l4,%l6,%l1
	fcmps	%fcc1,%f19,%f19
	or	%l0,0x802,%l1
	retl
	sdivx	%l3,%l5,%l6
p0_jmpl_3_ho:
	fdtos	%f28,%f16
	lduw	[%o1+0x008],%l0		! Mem[0000000010041408]
	fmuls	%f22,%f17,%f23
	jmpl	%g6+8,%g0
	fcmps	%fcc2,%f24,%f22
p0_call_3_ho:
	fadds	%f17,%f26,%f18
	andn	%l2,%l2,%l5
	or	%l5,-0x419,%l1
	xnor	%l4,%l6,%l1
	fcmps	%fcc1,%f19,%f19
	or	%l0,0x802,%l1
	retl
	sdivx	%l3,%l5,%l6
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
	.word	0x7138cabc,0x5d96979e		! Init value for %l0
	.word	0xf170e958,0x795e5134		! Init value for %l1
	.word	0x6c54bbaf,0xc24715f2		! Init value for %l2
	.word	0x91f201ca,0x4f78b804		! Init value for %l3
	.word	0x97dcfd18,0x7e9c6b66		! Init value for %l4
	.word	0x1ed02e6a,0x9ee40797		! Init value for %l5
	.word	0x8718ff3e,0x49e485bd		! Init value for %l6
	.word	0x94666e52,0xab567b94		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xd9ba90ac,0xa0728117		! Init value for %f0 
	.word	0xbfc25ba5,0xec61e5c6		! Init value for %f2 
	.word	0xe943b5c4,0x1cb13fbb		! Init value for %f4 
	.word	0xaa2bcf4c,0x0acd682e		! Init value for %f6 
	.word	0xfd46d6d1,0xcd28d31f		! Init value for %f8 
	.word	0x25965c3b,0xc48f7312		! Init value for %f10
	.word	0xe14df3e8,0xf9f0ef0d		! Init value for %f12
	.word	0xa965791d,0x9a032802		! Init value for %f14
	.word	0x746c16f9,0x6fa1352a		! Init value for %f16
	.word	0x9f036284,0xde930b18		! Init value for %f18
	.word	0x7070cc2c,0x615177bb		! Init value for %f20
	.word	0x9920f412,0x89385b71		! Init value for %f22
	.word	0xb7552aba,0xe7546c94		! Init value for %f24
	.word	0x992ee4cc,0x298b3929		! Init value for %f26
	.word	0x8aac0410,0x263fbd6e		! Init value for %f28
	.word	0xec9086a7,0x50bdced7		! Init value for %f30
	.word	0x929d9c0a,0x9a8b861f		! Init value for %f32
	.word	0x93b77452,0x84db3f96		! Init value for %f34
	.word	0x74ea536a,0xd7f48357		! Init value for %f36
	.word	0x487a869b,0x48dc41bf		! Init value for %f38
	.word	0x0dab6079,0x779d9e8b		! Init value for %f40
	.word	0x44dff6fa,0x6fb3dbb9		! Init value for %f42
	.word	0x2134da4a,0x89ea7d38		! Init value for %f44
	.word	0x64cea8f8,0xfdde4d12		! Init value for %f46
	.word	0xf7d765b0,0x9b201231
	.word	0xd3f256c8,0x38d97321
	.word	0x80251aba,0xd30265ef
	.word	0xfce84800,0x60651c0b
	.word	0x22adf022,0xb7ebf47e
	.word	0xb917062a,0xd5bfe8a7
	.word	0xb8aa7a5f,0xfebed526
	.word	0xd4d4bc0e,0x61abf57a
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
	.word	0x00000000,0x00000000
	.word	0x00000000,0x0000005d
	.word	0x00000000,0x00005de0
	.word	0xff008a15,0x125b9d80
	.word	0x00000000,0x6eff980e
	.word	0x00000000,0x00000000
	.word	0x00000000,0x158a00ff
	.word	0x9cceeadc,0xce245629
p0_expected_fp_regs:
	.word	0x67414b00,0x00000000
	.word	0xbfc25ba5,0x00000000
	.word	0xff606bd5,0x1cb13fbb
	.word	0xad8be22e,0xa0728117
	.word	0xe9000000,0x00000000
	.word	0x25965c3b,0xc48f7312
	.word	0x000000ff,0x620a7b00
	.word	0x5b2069f2,0x0000a46d
	.word	0x5de00000,0xd4ffffff
	.word	0x00000000,0x00000071
	.word	0x5b2069f2,0x0000a46d
	.word	0x25396da4,0x00000000
	.word	0x345a82e7,0x69cfe569
	.word	0x00000000,0x00000000
	.word	0x9dff0000,0x00000000
	.word	0xa0728117,0x6da40000
	.word	0x00000021,0x00000000		! %fsr = 0000002100000000
p0_local0_expect:
	.word	0xff000000,0x24eb85bd
	.word	0x00000000,0x095d4335
	.word	0xff000000,0xa46d3925
	.word	0xf4bae8a4,0x97000000
	.word	0xd259f2a8,0xa9bd1c9b
	.word	0x6a86a25f,0x8903761e
	.word	0x3f0365f6,0xe9b3ff58
	.word	0x000085bd,0xd13ea1f3
p0_local0_sec_expect:
	.word	0x00000000,0x00000000
	.word	0xff99460f,0x6272cf26
	.word	0xff85eb24,0xe2d1e882
	.word	0x1d327534,0x807a8c98
	.word	0x016df2a9,0x71a7ed1e
	.word	0x02a8b530,0xde57f5bd
	.word	0x0d85d0a1,0x55c92b02
	.word	0x5817bc4d,0x780d4c36
p0_local1_expect:
	.word	0xa0728117,0x000085bd
	.word	0xa0728117,0x6da40000
	.word	0x00000000,0xa46d3925
	.word	0xd3008ae6,0xcd11cf1c
	.word	0xd259f2a8,0xa9bd1c9b
	.word	0x6a86a25f,0x8903761e
	.word	0x3f0365f6,0xe9b3ff58
	.word	0x125b9d80,0xd13ea1f3
p0_local1_sec_expect:
	.word	0xff5b3889,0x1e760389
	.word	0xe05df8bd,0xdc87f6e0
	.word	0x48cb0000,0x0000ff9d
	.word	0x34de58e2,0x13db988a
	.word	0xf0ec0ea3,0x56cd56c3
	.word	0xcc8e963d,0x78d7aa83
	.word	0x1d0ee3e1,0xcdb86ad8
	.word	0x557add0a,0x11faf3ff
p0_local2_expect:
	.word	0xffe00000,0x6eff980e
	.word	0xcb483372,0xabffc6a8
	.word	0x000000ff,0xd48da573
	.word	0x9e86b923,0xbdf85de0
	.word	0x345a82e7,0x69cfe569
	.word	0x1d01eb24,0xd9cd3499
	.word	0x004b4167,0xf74bd567
	.word	0x9cceeadc,0xce245629
p0_local2_sec_expect:
	.word	0x67724b17,0x6da40000
	.word	0x5b2069f2,0x00000000
	.word	0xff008a15,0x125b9d80
	.word	0x3c87b14e,0x0dc4a64c
	.word	0x18914094,0x5f927e1a
	.word	0x84613201,0x3ce214fe
	.word	0xa27079a4,0xb8f2edba
	.word	0xf0073fcc,0xa6d64b95
p0_local3_expect:
	.word	0xd43400ff,0x295624ce
	.word	0xbfc25ba5,0xce245629
	.word	0x0000000b,0x947b56ab
	.word	0xb3e59f3d,0x738fa4b8
	.word	0x1b5003c4,0xa48d7929
	.word	0xdd244346,0x1df5248e
	.word	0x2ebf36ae,0x723348cb
	.word	0x2615d42c,0x82f372d7
p0_local3_sec_expect:
	.word	0xd56b60ff,0x00000000
	.word	0xd88de954,0xcb483372
	.word	0xff380000,0x55ff5b4c
	.word	0xc4541e00,0xd5258922
	.word	0x3c222838,0x6becd18a
	.word	0xfb969173,0x9c5d9a29
	.word	0x6da40000,0xf269205b
	.word	0x6ef17276,0x1534d2b5
p0_local4_expect:
	.word	0x5de00000,0x6ea5980e
	.word	0xff000000,0xa4e8baf4
	.word	0x54e98dd8,0x00000000
	.word	0xadda0eae,0x5ef3353a
	.word	0x2ee28bad,0x4eb67d44
	.word	0x089d51fc,0x979effcf
	.word	0x604e2e43,0xe05df8bd
	.word	0x37602d1e,0x97fc3de2
p0_local4_sec_expect:
	.word	0xbdba90ac,0xa0728117
	.word	0xbfc25ba5,0x00000000
	.word	0xe05df8bd,0x1cb13fbb
	.word	0xad8be22e,0xa0728117
	.word	0x00000000,0xff606bd5
	.word	0x25965c3b,0xc48f7312
	.word	0xb78117c2,0x620a7b00
	.word	0x5b2069f2,0x0000a46d
p0_local5_expect:
	.word	0x8117b3b5,0xab901376
	.word	0x99728117,0xe162f86c
	.word	0x6eff980e,0xfa6eab54
	.word	0x0ece6440,0xe0b47b94
	.word	0xa8c037ac,0x9abf4673
	.word	0x00000000,0x000000d4
	.word	0xab6975e7,0xe5434ecc
	.word	0xe5a25319,0x74666f04
p0_local5_sec_expect:
	.word	0xd4ffffff,0x2ccc7070
	.word	0x17000000,0x12d90626
	.word	0xffffffff,0xff255166
	.word	0xa5d2e679,0xbb84de56
	.word	0x7fe5f8c1,0x2e0872ed
	.word	0x15531a42,0xfaa579b1
	.word	0x5904a293,0x8355e29f
	.word	0xf22e2748,0x376c915b
p0_local6_expect:
	.word	0xff760000,0xe754ffd4
	.word	0x00005de0,0x3b5c9625
	.word	0x17000000,0x00000000
	.word	0x2f067da9,0x5e1388f7
	.word	0xada7f046,0x76d6c07d
	.word	0xd3e7c898,0x6cb93112
	.word	0xe5d455ec,0x21dbbcf8
	.word	0x095d4335,0x545ebe57
p0_local6_sec_expect:
	.word	0x6da40000,0xf269205b
	.word	0x00543db4,0x00000000
	.word	0x00000000,0x46f89bf9
	.word	0xc019b8e6,0xe52afe6a
	.word	0x54ae44f5,0xdbf5c255
	.word	0x67d664b6,0x3ed5d0d9
	.word	0xbd937dd9,0x7723ab76
	.word	0x1d59ea05,0xa7a61403
share0_expect:
	.word	0x9de5387c,0xc8eb7d7f
	.word	0xde7f1a6a,0x4f511471
	.word	0x40d1052b,0xca38b040
	.word	0x1ed04b7b,0x920a4afe
	.word	0x494bbcb2,0xe13e1b1f
	.word	0x619fecfb,0x6772e10a
	.word	0xd589e66a,0x0eb27ee3
	.word	0xff0c010e,0x662a8a08
share1_expect:
	.word	0x76ffab32,0x7a10b7f4
	.word	0x92af9768,0xd920e6a7
	.word	0x730e08f0,0x31f63f25
	.word	0x63d99132,0x58b832fc
	.word	0xb32ecd77,0x0eeb7d8c
	.word	0x7289f074,0xeeea3547
	.word	0x1a252796,0x1253f6ed
	.word	0x34b55e70,0x1fc7d32f
	.word	0xe0669e7c,0xa3e56a9f
	.word	0xc4960889,0x9cf0a498
	.word	0x0b973b2e,0xb3d6e124
	.word	0x6923aba0,0x01988f64
	.word	0xc0158e5c,0x61a87f8b
	.word	0x86701526,0x8b87cc2e
	.word	0xda1a4cfd,0xf27ec3a1
	.word	0x7a02cd30,0x1cf879d0
share2_expect:
	.word	0xffffd373,0xeac65011
	.word	0xe6f26455,0xa916d8b5
	.word	0xe2948e06,0x94087b03
	.word	0x525f59fb,0xbba3237e
	.word	0x0e7d1b57,0xdf660728
	.word	0xee99e99c,0x988e369a
	.word	0xa2700db2,0x5f299346
	.word	0x4087332b,0xa527132f
share3_expect:
	.word	0x00005d05,0x4e1ea55b
	.word	0xdd875549,0x3f41a87e
	.word	0x6c47ceea,0xc185cad5
	.word	0xf6581ae9,0x080f085d
	.word	0xb318f37d,0xd0ee3c7e
	.word	0x5342327b,0xb4e15c52
	.word	0x52c36ff3,0x17a01830
	.word	0x579eb8af,0x70cad3fd
	.word	0xd5ff9a7f,0x057ad7d0
	.word	0x97f27168,0x613ab257
	.word	0xfbf2b070,0x98062238
	.word	0xd6c0df20,0x5b939efb
	.word	0x8bd3d0ba,0x4eea8a77
	.word	0xff64dcb2,0x1c2ff183
	.word	0xd041cc83,0x4e1138e4
	.word	0x025d3292,0x37c0dde7
	.word	0x76848239,0x90175259
	.word	0xb07261c6,0x3727b9f4
	.word	0x91c434bd,0x1103b5f0
	.word	0x473409e2,0x93af73fb
	.word	0xf0144e45,0x037edcf3
	.word	0x2ecfb67d,0xa523f3dc
	.word	0x8425fb2a,0x0bdb8052
	.word	0xc3f995c1,0x357902ee
	.word	0x95624bf1,0x8d922e3c
	.word	0x14e24c58,0x7c74188e
	.word	0xa4d394dd,0x4466d3d2
	.word	0x47dd178a,0x5674abbd
	.word	0xea9aaf41,0xc7326bc6
	.word	0xc80a4fa6,0xcaa993be
	.word	0xf307cc83,0x3e36258d
	.word	0x58addaea,0x8007e07f
	.word	0x442b5022,0xb6138ad3
	.word	0x5e008b8b,0x7d6633af
	.word	0x08ca9200,0x7f978c49
	.word	0x45346710,0x3f6544d9
	.word	0xd3c909b6,0x94784fcf
	.word	0xebacbf41,0xa00a4e2d
	.word	0x01ff60fd,0x4079cb49
	.word	0x677fb155,0x05fe6b04
	.word	0x4e9767c3,0x07c104b2
	.word	0x2a2c8639,0x0fcd7117
	.word	0x692492a3,0x1b87e9c3
	.word	0x27a641a6,0x4862e344
	.word	0xfb16d83b,0x6ef68d39
	.word	0xe7b89ea0,0x46c22f01
	.word	0x140069c0,0xd4ec9dc6
	.word	0xc519c052,0xbe8a370c
	.word	0x73c934e1,0xb65fedc3
	.word	0xc06ec1c0,0x494b4e33
	.word	0x95d9901b,0x4fa7f917
	.word	0x6965c8b2,0x26540cfe
	.word	0xb121d42f,0xffd6b7ca
	.word	0xea91c43d,0xfbd0712d
	.word	0xd4f60315,0xad432852
	.word	0xcbef37bd,0x8c11285c
	.word	0x0b1442fd,0x01a6dc39
	.word	0xa47a035a,0x242c4a01
	.word	0x08b62e83,0x205522b8
	.word	0xfb44a6d3,0xb6369f23
	.word	0x8f80940e,0x2552f5f2
	.word	0x2c20be98,0xbbe30de9
	.word	0x86a644d3,0xdac4ff34
	.word	0x449b72ba,0xe3410c6f
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
	.word	0xf12acec0,0x33a77a49
	.word	0x00000000,0x00000002
	.word	0x180119b0,0x43051686
	.word	0x00000000,0x00000003
	.word	0x0e001288,0x175c5d0e
	.word	0x00000000,0x00000004
	.word	0x87b330cf,0xa8d029ce
	.word	0x00000000,0x00000005
	.word	0x75a58b18,0x51d4906a
	.word	0x00000000,0x00000006
	.word	0x6d5d176f,0xfa515351
	.word	0x00000000,0x00000007
	.word	0x43ab1f78,0x6a4fb468
	.word	0x00000000,0x00000008
	.word	0xac65e7d0,0x541bbb18
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
	.word	0x0d608fe8,0xa48b5f81,0x0b4e302a,0xf4bae8a4
	.word	0x2ad502f7,0x4b9ce42e,0x79a2ee9d,0x8243d7ae
	.word	0xfe1cafde,0x5b059132,0xd4ad7722,0xfd569727
	.word	0x7427df15,0xb0f8f861,0x3fd85656,0x87252bbd
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
	.word	0x0c63c841,0x56304427,0xd48f460f,0x6272cf26
	.word	0xf7ab353f,0xe2d1e882,0x1d327534,0x807a8c98
	.word	0x016df2a9,0x71a7ed1e,0x02a8b530,0xde57f5bd
	.word	0x0d85d0a1,0x55c92b02,0x5817bc4d,0x780d4c36
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
	.word	0xaf8baadd,0xc76f2c9b,0x28f59f8a,0xfbc82434
	.word	0x4f606bd5,0xa46d3925,0xd3e78ae6,0xcd11cf1c
	.word	0xd259f2a8,0xa9bd1c9b,0x6a86a25f,0x8903761e
	.word	0x3f0365f6,0xe9b3ff58,0x125b9d80,0xd13ea1f3
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
	.word	0xbd9e6d4d,0x5f331eca,0x56195f8f,0xdc87f6e0
	.word	0x9d543db4,0x2a6bc2ad,0x34de58e2,0x13db988a
	.word	0xf0ec0ea3,0x56cd56c3,0xcc8e963d,0x78d7aa83
	.word	0x1d0ee3e1,0xcdb86ad8,0x557add0a,0x11faf3ff
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
	.word	0x94d0bbd9,0x6ea5980e,0x52a941c8,0x57c356cc
	.word	0x660a6cd3,0x35da95d7,0x9e86b923,0xbdf85de0
	.word	0x345a82e7,0x69cfe569,0x1d01eb24,0xd9cd3499
	.word	0x004b4167,0xf74bd567,0x9cceeadc,0xce245629
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
	.word	0x0b80ad30,0xa752237d,0xc1255166,0xd6220374
	.word	0xeda4f7e2,0xb793e110,0x3c87b14e,0x0dc4a64c
	.word	0x18914094,0x5f927e1a,0x84613201,0x3ce214fe
	.word	0xa27079a4,0xb8f2edba,0xf0073fcc,0xa6d64b95
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
	.word	0x8df3bffc,0xb15ba9f4,0x71cafb5b,0xed631dbc
	.word	0xb1c10095,0xfd8329c3,0xb3ac9f3d,0x738fa4b8
	.word	0x1b5003c4,0xa48d7929,0xdd244346,0x1df5248e
	.word	0x2ebf36ae,0x723348cb,0x2615d42c,0x82f372d7
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
	.word	0xd88da573,0xa8c6ffab,0xfcfde954,0x2ee28bad
	.word	0xfd7e2db4,0x55ff5b4c,0xc4541e00,0xd5258922
	.word	0x3c222838,0x6becd18a,0xfb969173,0x9c5d9a29
	.word	0x64901da0,0x2d4eb4bc,0x6ef17276,0x1534d2b5
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
	.word	0x158aaa9e,0x81a7b3d8,0xa2cdad68,0x89c028dc
	.word	0xc9b8d136,0x79dc8aad,0xadda0eae,0x5ef3353a
	.word	0x7b9c8d1a,0x4eb67d44,0x089d51fc,0x1dd38acf
	.word	0x604e2e43,0xa1ada7ca,0x37602d1e,0x97fc3de2
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
	.word	0xa0b2b080,0x84194110,0xfa480c00,0x389d5c44
	.word	0x5fea4a75,0x0f4e44ac,0x25da6200,0x7dec22a9
	.word	0x1a54e66b,0x10349d08,0xbcdd83fc,0x8fffd425
	.word	0x49402ee3,0x590eeb78,0x48954d0e,0xd23b9e7f
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
	.word	0xbcd4b3b5,0xab901376,0xf269205b,0xe162f86c
	.word	0x8eef778b,0xfa6eab54,0x0ece6440,0xe0b48386
	.word	0xa8c037ac,0x9abf4673,0x8a235de6,0x80392da7
	.word	0xab6975e7,0xe5434ecc,0xe5a25319,0x74666f04
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
	.word	0x05d777fa,0x0dc3aca5,0x108667f5,0x12d90626
	.word	0xc3ca688a,0xcaaafc6c,0xa5d2e679,0xbb84de56
	.word	0x7fe5f8c1,0x2e0872ed,0x15531a42,0xfaa579b1
	.word	0x5904a293,0x8355e29f,0xf22e2748,0x376c915b
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
	.word	0x1a5688df,0x5aebd598,0x6d53fe12,0x78352735
	.word	0x1a5e0999,0x373c3747,0xf5456514,0x5e1388f7
	.word	0xada7f046,0x76d6c07d,0xd3e7c898,0x6cb93112
	.word	0xe5d455ec,0x21dbbcf8,0x095d4335,0x545ebe57
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
	.word	0xb2d134d4,0x2f067da9,0x74561fad,0xab422fe2
	.word	0xe9d1d1a0,0x46f89bf9,0xc019b8e6,0xe52afe6a
	.word	0x54ae44f5,0xdbf5c255,0x67d664b6,0x3ed5d0d9
	.word	0xbd937dd9,0x7723ab76,0x1d59ea05,0xa7a61403
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
	.word	0x388d387c,0xc8eb7d7f,0xde7f1a6a,0x4f511471
	.word	0x40d1052b,0xca38b040,0x1ed04b7b,0x920a4afe
	.word	0x494bbcb2,0xe13e1b1f,0x619fecfb,0x6772e10a
	.word	0xd589e66a,0x0eb27ee3,0xff0c010e,0x662a8a08
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
	.word	0x4ecfab32,0x7a10b7f4,0x92af9768,0xd920e6a7
	.word	0x730e08f0,0x31f63f25,0x63d99132,0x58b832fc
	.word	0xb32ecd77,0x0eeb7d8c,0x7289f074,0xeeea3547
	.word	0x1a252796,0x1253f6ed,0x34b55e70,0x1fc7d32f
	.word	0x71369e7c,0xa3e56a9f,0xc4960889,0x9cf0a498
	.word	0x0b973b2e,0xb3d6e124,0x6923aba0,0x01988f64
	.word	0xc0158e5c,0x61a87f8b,0x86701526,0x8b87cc2e
	.word	0xda1a4cfd,0xf27ec3a1,0x7a02cd30,0x1cf879d0
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
	.word	0x3f17d373,0xeac65011,0xe6f26455,0xa916d8b5
	.word	0xe2948e06,0x94087b03,0x525f59fb,0xbba3237e
	.word	0x0e7d1b57,0xdf660728,0xee99e99c,0x988e369a
	.word	0xa2700db2,0x5f299346,0x4087332b,0xa527132f
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
	.word	0x22935d05,0x4e1ea55b,0xdd875549,0x3f41a87e
	.word	0x6c47ceea,0xc185cad5,0xf6581ae9,0x080f085d
	.word	0xb318f37d,0xd0ee3c7e,0x5342327b,0xb4e15c52
	.word	0x52c36ff3,0x17a01830,0x579eb8af,0x70cad3fd
	.word	0xd5f89a7f,0x057ad7d0,0x97f27168,0x613ab257
	.word	0xfbf2b070,0x98062238,0xd6c0df20,0x5b939efb
	.word	0x8bd3d0ba,0x4eea8a77,0xff64dcb2,0x1c2ff183
	.word	0xd041cc83,0x4e1138e4,0x025d3292,0x37c0dde7
	.word	0x76848239,0x90175259,0xb07261c6,0x3727b9f4
	.word	0x91c434bd,0x1103b5f0,0x473409e2,0x93af73fb
	.word	0xf0144e45,0x037edcf3,0x2ecfb67d,0xa523f3dc
	.word	0x8425fb2a,0x0bdb8052,0xc3f995c1,0x357902ee
	.word	0x95624bf1,0x8d922e3c,0x14e24c58,0x7c74188e
	.word	0xa4d394dd,0x4466d3d2,0x47dd178a,0x5674abbd
	.word	0xea9aaf41,0xc7326bc6,0xc80a4fa6,0xcaa993be
	.word	0xf307cc83,0x3e36258d,0x58addaea,0x8007e07f
	.word	0x442b5022,0xb6138ad3,0x5e008b8b,0x7d6633af
	.word	0x08ca9200,0x7f978c49,0x45346710,0x3f6544d9
	.word	0xd3c909b6,0x94784fcf,0xebacbf41,0xa00a4e2d
	.word	0x01ff60fd,0x4079cb49,0x677fb155,0x05fe6b04
	.word	0x4e9767c3,0x07c104b2,0x2a2c8639,0x0fcd7117
	.word	0x692492a3,0x1b87e9c3,0x27a641a6,0x4862e344
	.word	0xfb16d83b,0x6ef68d39,0xe7b89ea0,0x46c22f01
	.word	0x140069c0,0xd4ec9dc6,0xc519c052,0xbe8a370c
	.word	0x73c934e1,0xb65fedc3,0xc06ec1c0,0x494b4e33
	.word	0x95d9901b,0x4fa7f917,0x6965c8b2,0x26540cfe
	.word	0xb121d42f,0xffd6b7ca,0xea91c43d,0xfbd0712d
	.word	0xd4f60315,0xad432852,0xcbef37bd,0x8c11285c
	.word	0x0b1442fd,0x01a6dc39,0xa47a035a,0x242c4a01
	.word	0x08b62e83,0x205522b8,0xfb44a6d3,0xb6369f23
	.word	0x8f80940e,0x2552f5f2,0x2c20be98,0xbbe30de9
	.word	0x86a644d3,0xdac4ff34,0x449b72ba,0xe3410c6f
share3_end:
