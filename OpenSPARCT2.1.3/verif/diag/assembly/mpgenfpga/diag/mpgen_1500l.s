/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_1500l.s
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
!	Seed = 626120442
!	Riesling can be on
!	1 Thread, 1500 lines
!	mpgen   created on May 4, 2009 (15:17:56), Version 2.81
!	mpgen_1500l.s created on Jun 26, 2009 (12:04:42)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.090504 -rc random.rc -o mpgen_1500l -p 1 -l 1500

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
!	%f0  = 28c00508 107eabf9 45662c86 304c6ebf
!	%f4  = 0be77074 7d245635 31039852 42045bdb
!	%f8  = 5976c7a0 7e8be531 6e455dde 392c23b7
!	%f12 = 3c6ed68c 22c374ed 417fa92a 1c3bc253
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 343a2938 0d83e169 044e6636 21fbf3af
!	%f20 = 25d90ba4 192cc6a5 75214102 1b6233cb
!	%f24 = 44cd89d0 188080a1 2c87a58e 542cbea7
!	%f28 = 5fc76fbc 15202b5d 243cbfda 263e9043
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 5d104968 26c7a2d9 7bf37be6 3bbb649f
!	%f36 = 72b762d4 3f498315 67e285b2 3be3b7bb
!	%f40 = 667dc800 074b2811 7510493e 5eb0c597
!	%f44 = 618244ec 27c0adcd 0f5ef28a 23308a33
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x35715a1d00000053,%g7,%g1 ! %gsr scale = 10, align = 3
	wr	%g1,%g0,%gsr		! %gsr = 35715a1d00000053

	wr	%g0,%y			! Clear %y register
	xorcc	%g0,%g0,%g3		! %g3 = 0, %ccr = 44
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Starting 10 instruction Store Burst
!	Mem[000000001004141d] = 041a7f7b, %l2 = 411c540a78fca8bc
	ldstub	[%i1+0x01d],%l2		! %l2 = 000000000000001a
!	Mem[0000000010041408] = a66a6432, %l0 = 000000008a92da56
	swapa	[%i1+%o4]0x88,%l0	! %l0 = 00000000a66a6432
!	%l5 = 77afbd079aab62cd, Mem[0000000030041400] = 4d83ae58
	stba	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = cd83ae58
!	Mem[0000000010101400] = 3945c139 48af6472, %l2 = 0000001a, %l3 = 64183107
	ldda	[%i4+%g0]0x88,%l2	! %l2 = 0000000048af6472 000000003945c139
!	%f18 = 044e6636, Mem[0000000030141408] = d6c98c29
	sta	%f18,[%i5+%o4]0x89	! Mem[0000000030141408] = 044e6636
!	%f4  = 0be77074, %f22 = 75214102
	fcmpes	%fcc3,%f4 ,%f22		! %fcc3 = 1
!	%l5 = 77afbd079aab62cd, %l4 = 1dbae689313b6362, %y  = 00000000
	sdiv	%l5,%l4,%l6		! %l6 = 0000000000000003
	mov	%l0,%y			! %y = a66a6432
!	Mem[0000000030001410] = 64d02c53, %l1 = 0000000022eb3781
	swapa	[%i0+%o5]0x89,%l1	! %l1 = 0000000064d02c53
!	%f4  = 0be77074 7d245635, %l6 = 0000000000000003
!	Mem[0000000030101418] = 1618b1426f38bb0b
	add	%i4,0x018,%g1
	stda	%f4,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030101418] = 3556247d7470e70b
!	%l1 = 0000000064d02c53, Mem[0000000010041408] = 8a92da56
	stha	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 8a922c53

p0_label_2:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 548c1c15, %l7 = 532f2da88dfe24d3
	ldsha	[%i3+%o5]0x88,%l7	! %l7 = 0000000000001c15
!	Mem[000000001014140c] = 610297df, %l5 = 77afbd079aab62cd
	ldsw	[%i5+0x00c],%l5		! %l5 = 00000000610297df
!	Mem[0000000010041400] = 589ca2283cf42099, %f4  = 0be77074 7d245635, %asi = 80
	ldda	[%i1+0x000]%asi,%f4 	! %f4  = 589ca228 3cf42099
!	%o2 = deadbeefdeadbeef
	set	share2_start,%o2	! set %o2[0] to VA
!	Mem[00000000211c0000] = 44dfb4f8, %l6 = 0000000000000003
	ldub	[%o2+%g0],%l6		! %l6 = 0000000000000044
!	Mem[00000000100c1400] = 4658bae8 3bb95e59, %l0 = a66a6432, %l1 = 64d02c53
	ldda	[%i3+%g0]0x80,%l0	! %l0 = 000000004658bae8 000000003bb95e59
!	Mem[0000000030101410] = e499372e, %l1 = 000000003bb95e59
	lduha	[%i4+%o5]0x89,%l1	! %l1 = 000000000000372e
!	Mem[0000000010081410] = 63c0d9f4, %l1 = 000000000000372e
	lduwa	[%i2+%o5]0x80,%l1	! %l1 = 0000000063c0d9f4
!	Mem[0000000010181410] = 52094374 54fefd35, %l2 = 48af6472, %l3 = 3945c139
	ldda	[%i6+%o5]0x80,%l2	! %l2 = 0000000052094374 0000000054fefd35
!	Mem[0000000010041410] = 28cc1794, %l7 = 0000000000001c15
	lduwa	[%i1+%o5]0x80,%l7	! %l7 = 0000000028cc1794
!	Mem[00000000100c1418] = 26569b32, %l5 = 00000000610297df
	ldsw	[%i3+0x018],%l5		! %l5 = 0000000026569b32

p0_label_3:
!	Starting 10 instruction Store Burst
!	%f0  = 28c00508 107eabf9, %l2 = 0000000052094374
!	Mem[0000000010181408] = 7c00e7860a0b5dbf
	add	%i6,0x008,%g1
	stda	%f0,[%g1+%l2]ASI_PST16_PL ! Mem[0000000010181408] = 7c00e78608055dbf
!	%f15 = 1c3bc253, Mem[0000000010141400] = a8930419
	sta	%f15,[%i5+%g0]0x88	! Mem[0000000010141400] = 1c3bc253
!	%l4 = 1dbae689313b6362, immd = 00000d38, %y  = a66a6432
	sdiv	%l4,0xd38,%l2		! %l2 = ffffffff80000000
	mov	%l0,%y			! %y = 4658bae8
!	%l4 = 313b6362, %l5 = 26569b32, Mem[0000000010001410] = 34456624 f5dfbb40
	stda	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 313b6362 26569b32
!	%l5 = 0000000026569b32, Mem[00000000300c1408] = 16eb6266
	stba	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = 16eb6232
!	Mem[0000000030141408] = 36664e04, %l0 = 000000004658bae8
	swapa	[%i5+%o4]0x81,%l0	! %l0 = 0000000036664e04
!	Mem[0000000030081408] = 0b9b23b6, %l2 = 0000000080000000
	swapa	[%i2+%o4]0x81,%l2	! %l2 = 000000000b9b23b6
!	%l1 = 0000000063c0d9f4, imm = 00000000000008f6, %l6 = 0000000000000044
	orn	%l1,0x8f6,%l6		! %l6 = fffffffffffffffd
!	Mem[0000000010001400] = 1a3c7dc8, %l2 = 000000000b9b23b6
	swapa	[%i0+%g0]0x80,%l2	! %l2 = 000000001a3c7dc8
!	%o3 = deadbeefdeadbeef
	set	share3_start,%o3	! set %o3[0] to VA
!	%l7 = 0000000028cc1794, Mem[00000000218001c0] = 58f9c678
	sth	%l7,[%o3+0x1c0]		! Mem[00000000218001c0] = 1794c678

p0_label_4:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 14c16826, %l3 = 0000000054fefd35
	lduba	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000026
!	Mem[00000000300c1408] = 3262eb16, %l7 = 0000000028cc1794
	ldsha	[%i3+%o4]0x81,%l7	! %l7 = 0000000000003262
!	Code Fragment 4, seed = 858217
p0_fragment_1:
!	%l0 = 0000000036664e04
	setx	0x30cd46ab97006dde,%g7,%l0 ! %l0 = 30cd46ab97006dde
!	%l1 = 0000000063c0d9f4
	setx	0x55d09fe442111489,%g7,%l1 ! %l1 = 55d09fe442111489
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 30cd46ab97006dde
	setx	0x3157a166ca469744,%g7,%l0 ! %l0 = 3157a166ca469744
!	%l1 = 55d09fe442111489
	setx	0x036f042f2cc7790f,%g7,%l1 ! %l1 = 036f042f2cc7790f
p0_fragment_1_end:
!	Mem[0000000010001424] = 7b1e9af1, %l0 = 3157a166ca469744
	ldsw	[%i0+0x024],%l0		! %l0 = 000000007b1e9af1
!	Mem[000000001018143c] = 26d54153, %l2 = 000000001a3c7dc8
	lduh	[%i6+0x03c],%l2		! %l2 = 00000000000026d5
!	Mem[0000000010001424] = 7b1e9af1, %l2 = 00000000000026d5, %asi = 80
	ldswa	[%i0+0x024]%asi,%l2	! %l2 = 000000007b1e9af1
!	Mem[0000000010081400] = 2c88b688, %l6 = fffffffffffffffd
	lduwa	[%i2+%g0]0x80,%l6	! %l6 = 000000002c88b688
!	Mem[0000000010081410] = b5296873 f4d9c063, %l0 = 7b1e9af1, %l1 = 2cc7790f
	ldda	[%i2+%o5]0x88,%l0	! %l0 = 00000000f4d9c063 00000000b5296873
!	Mem[0000000010001408] = 69403b46, %l3 = 0000000000000026
	ldsha	[%i0+%o4]0x80,%l3	! %l3 = 0000000000006940
!	Mem[0000000010101408] = c698cd6b, %l2 = 000000007b1e9af1
	ldsba	[%i4+%o4]0x88,%l2	! %l2 = 000000000000006b

p0_label_5:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000003262, Mem[0000000030081400] = b8ba9630
	stha	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = b8ba3262
!	%l1 = 00000000b5296873, Mem[0000000021800180] = 44721248, %asi = 80
	stha	%l1,[%o3+0x180]%asi	! Mem[0000000021800180] = 68731248
!	%l4 = 1dbae689313b6362, Mem[0000000010101400] = 7264af48
	stba	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 6264af48
!	%o1 = deadbeefdeadbeef
	set	share1_start,%o1	! set %o1[0] to VA
!	Mem[0000000020800001] = 33450898, %l7 = 0000000000003262
	ldstub	[%o1+0x001],%l7		! %l7 = 0000000000000045
!	Mem[0000000010141434] = 6282f30d, %l0 = 00000000f4d9c063, %asi = 80
	swapa	[%i5+0x034]%asi,%l0	! %l0 = 000000006282f30d
!	%l7 = 0000000000000045, Mem[0000000010041420] = 60d998c054fe3dd1, %asi = 80
	stxa	%l7,[%i1+0x020]%asi	! Mem[0000000010041420] = 0000000000000045
!	%l1 = 00000000b5296873, Mem[0000000010081410] = 63c0d9f4
	stwa	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = b5296873
!	%l1 = 00000000b5296873, Mem[00000000100c1410] = 548c1c15
	stba	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = 548c1c73
!	Mem[0000000010041428] = 6bee6ffe2c6f1957, %l5 = 0000000026569b32, %l7 = 0000000000000045
	add	%i1,0x28,%g1
	casxa	[%g1]0x80,%l5,%l7	! %l7 = 6bee6ffe2c6f1957
!	Mem[0000000030181400] = 65f24c38, %l1 = 00000000b5296873
	ldstuba	[%i6+%g0]0x81,%l1	! %l1 = 0000000000000065

p0_label_6:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 5209437454fefd35, %f0  = 28c00508 107eabf9
	ldda	[%i6+%o5]0x80,%f0 	! %f0  = 52094374 54fefd35
!	%l1 = 0000000000000065, Mem[000000001008142f] = 0a18cb37
	stb	%l1,[%i2+0x02f]		! Mem[000000001008142c] = 0a18cb65
!	Mem[0000000010081410] = b5296873736829b5, %l6 = 000000002c88b688
	ldxa	[%i2+%o5]0x88,%l6	! %l6 = b5296873736829b5
!	Mem[0000000030041410] = 6c9f1ac45956a545, %f28 = 5fc76fbc 15202b5d
	ldda	[%i1+%o5]0x81,%f28	! %f28 = 6c9f1ac4 5956a545
!	Mem[00000000300c1400] = 18b7393c, %f9  = 7e8be531
	lda	[%i3+%g0]0x89,%f9 	! %f9 = 18b7393c
!	%o0 = deadbeefdeadbeef
	set	share0_start,%o0	! set %o0[0] to VA
!	Mem[00000000201c0000] = 03602c68, %l1 = 0000000000000065, %asi = 80
	ldsha	[%o0+0x000]%asi,%l1	! %l1 = 0000000000000360
!	%l6 = b5296873736829b5, Mem[0000000010101402] = 6264af48
	sth	%l6,[%i4+0x002]		! Mem[0000000010101400] = 626429b5
!	Mem[0000000030001410] = 8137eb22 0c6f8065, %l0 = 6282f30d, %l1 = 00000360
	ldda	[%i0+%o5]0x81,%l0	! %l0 = 000000008137eb22 000000000c6f8065
!	Mem[0000000030001400] = f891a814, %l4 = 1dbae689313b6362
	ldswa	[%i0+%g0]0x89,%l4	! %l4 = fffffffff891a814
!	Mem[0000000010141408] = 473f8826 610297df, %l6 = 736829b5, %l7 = 2c6f1957
	ldda	[%i5+%o4]0x80,%l6	! %l6 = 00000000473f8826 00000000610297df

p0_label_7:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 6232bab8, %l6 = 00000000473f8826
	ldstuba	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000062
!	%f26 = 2c87a58e 542cbea7, Mem[0000000030001408] = f6e42d30 6f3fff6b
	stda	%f26,[%i0+%o4]0x89	! Mem[0000000030001408] = 2c87a58e 542cbea7
!	%f8  = 5976c7a0 18b7393c, %l3 = 0000000000006940
!	Mem[0000000010141418] = 740f45f274884efb
	add	%i5,0x018,%g1
	stda	%f8,[%g1+%l3]ASI_PST16_P ! Mem[0000000010141418] = 740f45f274884efb
!	%l1 = 000000000c6f8065, Mem[00000000300c1400] = 3c39b71837630bc9
	stxa	%l1,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000000c6f8065
!	%l1 = 000000000c6f8065, Mem[0000000030101408] = 7622567f
	stwa	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = 0c6f8065
!	%l7 = 00000000610297df, Mem[0000000010141408] = 26883f47
	stba	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = 26883fdf
!	Mem[0000000030001400] = f891a814, %l1 = 000000000c6f8065
	swapa	[%i0+%g0]0x89,%l1	! %l1 = 00000000f891a814
!	Mem[00000000100c1433] = 20515e6c, %l6 = 0000000000000062
	ldstub	[%i3+0x033],%l6		! %l6 = 000000000000006c
!	Mem[0000000010181400] = 3e906808, %l0 = 000000008137eb22
	swapa	[%i6+%g0]0x80,%l0	! %l0 = 000000003e906808
!	%l2 = 000000000000006b, Mem[000000001018142a] = 0cf4f8de
	sth	%l2,[%i6+0x02a]		! Mem[0000000010181428] = 0cf4006b

p0_label_8:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 000000000c6f8065, %f20 = 25d90ba4 192cc6a5
	ldda	[%i3+%g0]0x81,%f20	! %f20 = 00000000 0c6f8065
!	Mem[0000000030001400] = 0c6f8065, %l6 = 000000000000006c
	lduha	[%i0+%g0]0x89,%l6	! %l6 = 0000000000008065
!	Mem[0000000030041408] = 17e6cc567fcc6d4f, %l5 = 0000000026569b32
	ldxa	[%i1+%o4]0x81,%l5	! %l5 = 17e6cc567fcc6d4f
!	Mem[0000000030141400] = d87f8f52, %l7 = 00000000610297df
	ldsha	[%i5+%g0]0x89,%l7	! %l7 = ffffffffffff8f52
!	Mem[0000000010141404] = 12d75c19, %l7 = ffffffffffff8f52, %asi = 80
	ldswa	[%i5+0x004]%asi,%l7	! %l7 = 0000000012d75c19
!	Mem[0000000010081400] = 2c88b688 68c7a779, %l4 = f891a814, %l5 = 7fcc6d4f
	ldd	[%i2+%g0],%l4		! %l4 = 000000002c88b688 0000000068c7a779
!	Mem[0000000010001408] = 69403b46 1c860a7f, %l0 = 3e906808, %l1 = f891a814
	ldda	[%i0+%o4]0x80,%l0	! %l0 = 0000000069403b46 000000001c860a7f
!	Mem[0000000010041408] = 532c928a 5464605f, %l0 = 69403b46, %l1 = 1c860a7f
	ldd	[%i1+%o4],%l0		! %l0 = 00000000532c928a 000000005464605f
!	Mem[0000000030001400] = 292f8008 0c6f8065, %l0 = 532c928a, %l1 = 5464605f
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 000000000c6f8065 00000000292f8008
!	Mem[0000000010001410] = 313b6362, %l6 = 0000000000008065
	ldswa	[%i0+%o5]0x88,%l6	! %l6 = 00000000313b6362

p0_label_9:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001430] = 7acaa34c, %l0 = 000000000c6f8065
	swap	[%i0+0x030],%l0		! %l0 = 000000007acaa34c
!	Mem[0000000010101408] = c698cd6b, %l4 = 000000002c88b688
	ldstuba	[%i4+%o4]0x88,%l4	! %l4 = 000000000000006b
!	Mem[0000000030101400] = 0ac4a378 2e330aa9 65806f0c 070216ef
!	%f16 = 343a2938 0d83e169 044e6636 21fbf3af
!	%f20 = 00000000 0c6f8065 75214102 1b6233cb
!	%f24 = 44cd89d0 188080a1 2c87a58e 542cbea7
!	%f28 = 6c9f1ac4 5956a545 243cbfda 263e9043
	stda	%f16,[%i4+%g0]ASI_COMMIT_S	! Block Store to 0000000030101400
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010101408] = ffcd98c6, %l4 = 000000000000006b
	ldstuba	[%i4+0x008]%asi,%l4	! %l4 = 00000000000000ff
!	%l0 = 000000007acaa34c, Mem[0000000030181408] = 341ee136
	stha	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = a34ce136
!	%l0 = 000000007acaa34c, Mem[0000000030041410] = 6c9f1ac4
	stba	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 4c9f1ac4
!	Mem[0000000010141400] = 1c3bc253, %l3 = 0000000000006940
	swapa	[%i5+%g0]0x88,%l3	! %l3 = 000000001c3bc253
!	Mem[0000000010081400] = 2c88b68868c7a779, %l2 = 000000000000006b, %l2 = 000000000000006b
	casxa	[%i2]0x80,%l2,%l2	! %l2 = 2c88b68868c7a779
!	%f30 = 243cbfda, Mem[0000000010081400] = 2c88b688
	sta	%f30,[%i2+%g0]0x80	! Mem[0000000010081400] = 243cbfda
!	%l4 = 00000000000000ff, Mem[0000000030141400] = 528f7fd8688d3989
	stxa	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000000000ff

p0_label_10:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 195cd712 00006940, %l0 = 7acaa34c, %l1 = 292f8008
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 0000000000006940 00000000195cd712
!	Mem[0000000010001430] = 0c6f8065, %l7 = 0000000012d75c19
	ldsh	[%i0+0x030],%l7		! %l7 = 0000000000000c6f
!	Mem[0000000030081408] = 80000000, %l4 = 00000000000000ff
	lduha	[%i2+%o4]0x81,%l4	! %l4 = 0000000000008000
!	Mem[0000000030101410] = 65806f0c00000000, %l1 = 00000000195cd712
	ldxa	[%i4+%o5]0x89,%l1	! %l1 = 65806f0c00000000
!	Mem[00000000300c1400] = 00000000, %l0 = 0000000000006940
	ldswa	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141409] = df3f8826, %l4 = 0000000000008000, %asi = 80
	ldsba	[%i5+0x009]%asi,%l4	! %l4 = 000000000000003f
!	Mem[00000000100c1408] = 1f1c3c0c66199358, %f2  = 45662c86 304c6ebf
	ldda	[%i3+%o4]0x88,%f2 	! %f2  = 1f1c3c0c 66199358
!	%l5 = 0000000068c7a779, %l4 = 000000000000003f, %l5 = 0000000068c7a779
	subc	%l5,%l4,%l5		! %l5 = 0000000068c7a73a
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000030081408] = 00000080 2f4bc173
	stda	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000 00000000
!	Mem[0000000010001410] = 313b6362, %l2 = 2c88b68868c7a779
	ldstuba	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000062

p0_label_11:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = b5296873, %l1 = 0000000000000000
	swapa	[%i2+%o5]0x80,%l1	! %l1 = 00000000b5296873
!	%l3 = 000000001c3bc253, immd = fffff90d, %y  = 4658bae8
	udiv	%l3,-0x6f3,%l0		! %l0 = 000000004658bcd0
	mov	%l0,%y			! %y = 4658bcd0
!	Mem[00000000100c1438] = 1110780a, %l7 = 0000000000000c6f
	swap	[%i3+0x038],%l7		! %l7 = 000000001110780a
!	%f10 = 6e455dde, Mem[0000000030001408] = a7be2c54
	sta	%f10,[%i0+%o4]0x81	! Mem[0000000030001408] = 6e455dde
!	%f6  = 31039852, Mem[0000000030181410] = a49e6e19
	sta	%f6 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 31039852
!	%l4 = 000000000000003f, Mem[00000000201c0000] = 03602c68, %asi = 80
	stha	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 003f2c68
!	%l3 = 000000001c3bc253, Mem[0000000010081408] = 78780a06710e663f
	stxa	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000001c3bc253
!	%l5 = 0000000068c7a73a, Mem[0000000010001422] = 03d6b860, %asi = 80
	stha	%l5,[%i0+0x022]%asi	! Mem[0000000010001420] = 03d6a73a
!	%l7 = 000000001110780a, Mem[0000000010181414] = 54fefd35
	stw	%l7,[%i6+0x014]		! Mem[0000000010181414] = 1110780a
!	Mem[0000000030081400] = b8ba32ff, %l3 = 000000001c3bc253
	ldstuba	[%i2+%g0]0x89,%l3	! %l3 = 00000000000000ff

p0_label_12:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00000000, %l0 = 000000004658bcd0
	ldsha	[%i2+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001410] = ff633b31329b5626, %l3 = 00000000000000ff, %asi = 80
	ldxa	[%i0+0x010]%asi,%l3	! %l3 = ff633b31329b5626
!	Mem[00000000100c1408] = 58931966, %l5 = 0000000068c7a73a
	lduba	[%i3+%o4]0x80,%l5	! %l5 = 0000000000000058
!	Mem[0000000010001408] = 69403b46, %l5 = 0000000000000058
	lduba	[%i0+%o4]0x80,%l5	! %l5 = 0000000000000069
!	Mem[00000000100c1428] = 612256be, %l2 = 0000000000000062
	ldsw	[%i3+0x028],%l2		! %l2 = 00000000612256be
!	%f6  = 31039852, %f25 = 188080a1, %f0  = 52094374
	fdivs	%f6 ,%f25,%f0 		! %f0  = 58031499
!	Mem[0000000010181438] = 3b46342a 26d54153, %l4 = 0000003f, %l5 = 00000069, %asi = 80
	ldda	[%i6+0x038]%asi,%l4	! %l4 = 000000003b46342a 0000000026d54153
!	Mem[0000000030041410] = c41a9f4c, %l2 = 00000000612256be
	ldsha	[%i1+%o5]0x89,%l2	! %l2 = ffffffffffff9f4c
!	Mem[0000000030081410] = 24550c01, %l7 = 000000001110780a
	lduba	[%i2+%o5]0x89,%l7	! %l7 = 0000000000000001
!	Mem[0000000030081410] = 010c5524, %l4 = 000000003b46342a
	ldswa	[%i2+%o5]0x81,%l4	! %l4 = 00000000010c5524

p0_label_13:
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffff9f4c, Mem[0000000010081437] = 15db786d, %asi = 80
	stba	%l2,[%i2+0x037]%asi	! Mem[0000000010081434] = 15db784c
!	Mem[00000000100c1428] = 612256be, %l4 = 00000000010c5524, %asi = 80
	swapa	[%i3+0x028]%asi,%l4	! %l4 = 00000000612256be
!	%f28 = 6c9f1ac4 5956a545, Mem[0000000010001400] = b6239b0b b9c94660
	stda	%f28,[%i0+%g0]0x88	! Mem[0000000010001400] = 6c9f1ac4 5956a545
!	Mem[0000000010141408] = df3f8826610297df, %l3 = ff633b31329b5626, %l6 = 00000000313b6362
	add	%i5,0x08,%g1
	casxa	[%g1]0x80,%l3,%l6	! %l6 = df3f8826610297df
!	Mem[00000000100c1408] = 58931966, %l3 = 00000000329b5626
	swapa	[%i3+%o4]0x80,%l3	! %l3 = 0000000058931966
!	Mem[0000000010101410] = b42eb758, %l0 = 0000000000000000
	swapa	[%i4+%o5]0x88,%l0	! %l0 = 00000000b42eb758
!	Mem[0000000010101408] = ffcd98c6, %l1 = 00000000b5296873
	swapa	[%i4+%o4]0x80,%l1	! %l1 = 00000000ffcd98c6
!	Code Fragment 3, seed = 206616
p0_fragment_2:
!	%l0 = 00000000b42eb758
	setx	0xdbdd6b518828d766,%g7,%l0 ! %l0 = dbdd6b518828d766
!	%l1 = 00000000ffcd98c6
	setx	0x72410f5ce231e791,%g7,%l1 ! %l1 = 72410f5ce231e791
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = dbdd6b518828d766
	setx	0xbf2cdc189f519bcc,%g7,%l0 ! %l0 = bf2cdc189f519bcc
!	%l1 = 72410f5ce231e791
	setx	0xbdda84a613a3f717,%g7,%l1 ! %l1 = bdda84a613a3f717
p0_fragment_2_end:
!	Mem[00000000100c1410] = 548c1c73, %l7 = 0000000000000001
	swapa	[%i3+%o5]0x88,%l7	! %l7 = 00000000548c1c73
!	%l5 = 0000000026d54153, Mem[0000000010081430] = 215a300c15db784c, %asi = 80
	stxa	%l5,[%i2+0x030]%asi	! Mem[0000000010081430] = 0000000026d54153

p0_label_14:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000, %f26 = 2c87a58e
	lda	[%i4+%o5]0x88,%f26	! %f26 = 00000000
!	Mem[0000000010081410] = 00000000 736829b5, %l2 = ffff9f4c, %l3 = 58931966
	ldda	[%i2+%o5]0x80,%l2	! %l2 = 0000000000000000 00000000736829b5
!	Mem[00000000300c1408] = 0fd9956716eb6232, %l3 = 00000000736829b5
	ldxa	[%i3+%o4]0x89,%l3	! %l3 = 0fd9956716eb6232
!	Mem[0000000010141410] = 2668c114, %l7 = 00000000548c1c73
	ldswa	[%i5+%o5]0x80,%l7	! %l7 = 000000002668c114
!	%f15 = 1c3bc253, %f16 = 343a2938
	fcmpes	%fcc3,%f15,%f16		! %fcc3 = 1
!	%f17 = 0d83e169, %f22 = 75214102
	fcmpes	%fcc0,%f17,%f22		! %fcc0 = 1
!	Mem[0000000010041400] = 589ca2283cf42099, %f10 = 6e455dde 392c23b7
	ldda	[%i1+%g0]0x80,%f10	! %f10 = 589ca228 3cf42099
!	Mem[0000000010181408] = 7c00e78608055dbf, %l0 = bf2cdc189f519bcc
	ldx	[%i6+%o4],%l0		! %l0 = 7c00e78608055dbf
!	Mem[0000000030001410] = 8137eb22, %l4 = 00000000612256be
	ldsha	[%i0+%o5]0x81,%l4	! %l4 = ffffffffffff8137
!	%f12 = 3c6ed68c, %f24 = 44cd89d0
	fcmps	%fcc2,%f12,%f24		! %fcc2 = 1

p0_label_15:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 38293a34, %l6 = 00000000610297df
	swapa	[%i4+%g0]0x89,%l6	! %l6 = 0000000038293a34
!	%l4 = ffffffffffff8137, Mem[00000000300c1400] = 65806f0c00000000
	stxa	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffffffffff8137
!	%l5 = 0000000026d54153, Mem[0000000010001410] = 313b63ff
	stha	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 313b4153
!	%l1 = bdda84a613a3f717, Mem[0000000030081408] = 0000000000000000
	stxa	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = bdda84a613a3f717
!	Mem[00000000100c1420] = 233d2980, %l0 = 0000000008055dbf
	swap	[%i3+0x020],%l0		! %l0 = 00000000233d2980
!	%l4 = ffff8137, %l5 = 26d54153, Mem[0000000030081410] = 24550c01 25fab613
	stda	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = ffff8137 26d54153
!	%l2 = 00000000, %l3 = 16eb6232, Mem[00000000300c1408] = 3262eb16 6795d90f
	stda	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000 16eb6232
!	Mem[0000000010001410] = 53413b31, %l2 = 0000000000000000, %asi = 80
	swapa	[%i0+0x010]%asi,%l2	! %l2 = 0000000053413b31
!	%f6  = 31039852 42045bdb, Mem[0000000010081410] = 00000000 736829b5
	stda	%f6 ,[%i2+%o5]0x80	! Mem[0000000010081410] = 31039852 42045bdb
!	%l6 = 38293a34, %l7 = 2668c114, Mem[0000000010101408] = 736829b5 ff81a54b
	stda	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 38293a34 2668c114

p0_label_16:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 329b5626, %l7 = 000000002668c114
	lduwa	[%i3+%o4]0x80,%l7	! %l7 = 00000000329b5626
!	Mem[00000000300c1410] = 057f086b 847f4c7e, %l2 = 53413b31, %l3 = 16eb6232
	ldda	[%i3+%o5]0x89,%l2	! %l2 = 00000000847f4c7e 00000000057f086b
!	Mem[00000000100c1430] = 20515eff6bd5714d, %f2  = 1f1c3c0c 66199358, %asi = 80
	ldda	[%i3+0x030]%asi,%f2 	! %f2  = 20515eff 6bd5714d
!	Mem[0000000010081408] = 000000001c3bc253, %l6 = 0000000038293a34
	ldxa	[%i2+%o4]0x80,%l6	! %l6 = 000000001c3bc253
!	%l3 = 00000000057f086b, %l2 = 00000000847f4c7e, %y  = 4658bcd0
	sdiv	%l3,%l2,%l0		! %l0 = ffffffff80000000
	mov	%l0,%y			! %y = 80000000
!	Mem[0000000030081410] = 3781ffff, %l4 = ffffffffffff8137
	lduba	[%i2+%o5]0x81,%l4	! %l4 = 0000000000000037
!	Mem[00000000100c1410] = 00000001, %l6 = 000000001c3bc253
	ldswa	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000001
!	Mem[0000000010101400] = b5296462, %l6 = 0000000000000001
	ldsba	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000062
!	Mem[000000001018142c] = 382072b7, %l5 = 0000000026d54153
	ldsw	[%i6+0x02c],%l5		! %l5 = 00000000382072b7
!	Mem[00000000100c1408] = 26569b32, %l3 = 00000000057f086b
	ldsha	[%i3+%o4]0x88,%l3	! %l3 = ffffffffffff9b32

p0_label_17:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 2668c114, %l5 = 00000000382072b7
	swapa	[%i5+%o5]0x80,%l5	! %l5 = 000000002668c114
!	%l6 = 0000000000000062, Mem[00000000211c0000] = 44dfb4f8, %asi = 80
	stha	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0062b4f8
!	%l2 = 00000000847f4c7e, Mem[0000000030181408] = a34ce136
	stba	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 7e4ce136
!	%l0 = ffffffff80000000, Mem[0000000010041410] = 28cc1794
	stwa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 80000000
!	%l0 = ffffffff80000000, Mem[0000000010181438] = 3b46342a
	sth	%l0,[%i6+0x038]		! Mem[0000000010181438] = 0000342a
!	Mem[0000000030181400] = 384cf2ff, %l6 = 0000000000000062
	ldstuba	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081400] = ff32bab8, %l6 = 00000000000000ff
	swapa	[%i2+%g0]0x81,%l6	! %l6 = 00000000ff32bab8
!	%l3 = ffffffffffff9b32, Mem[0000000010181408] = 7c00e786
	stba	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 3200e786
!	Mem[0000000010141410] = 382072b7, %f20 = 00000000
	lda	[%i5+0x010]%asi,%f20	! %f20 = 382072b7
!	%f23 = 1b6233cb, Mem[0000000010081400] = 243cbfda
	sta	%f23,[%i2+%g0]0x80	! Mem[0000000010081400] = 1b6233cb

p0_label_18:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1402] = 4658bae8, %l4 = 0000000000000037
	lduh	[%i3+0x002],%l4		! %l4 = 000000000000bae8
!	Mem[0000000010141400] = 4069000012d75c19, %f2  = 20515eff 6bd5714d
	ldda	[%i5+%g0]0x80,%f2 	! %f2  = 40690000 12d75c19
!	Mem[0000000030101408] = 044e6636, %l7 = 00000000329b5626
	lduwa	[%i4+%o4]0x81,%l7	! %l7 = 00000000044e6636
!	Mem[0000000010181410] = 520943741110780a, %f28 = 6c9f1ac4 5956a545, %asi = 80
	ldda	[%i6+0x010]%asi,%f28	! %f28 = 52094374 1110780a
!	Mem[0000000030101400] = 69e1830d610297df, %f10 = 589ca228 3cf42099
	ldda	[%i4+%g0]0x89,%f10	! %f10 = 69e1830d 610297df
!	Mem[0000000030081400] = 000000ff, %f27 = 542cbea7
	lda	[%i2+%g0]0x81,%f27	! %f27 = 000000ff
!	Mem[0000000030181408] = 36e14c7e, %l2 = 00000000847f4c7e
	lduwa	[%i6+%o4]0x89,%l2	! %l2 = 0000000036e14c7e
!	Mem[0000000010181400] = 8137eb22, %l1 = bdda84a613a3f717
	lduba	[%i6+%g0]0x80,%l1	! %l1 = 0000000000000081
!	Mem[0000000030181410] = 52980331, %l7 = 00000000044e6636
	lduba	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000052
!	Mem[0000000030081408] = a684dabd, %l6 = 00000000ff32bab8
	ldswa	[%i2+%o4]0x89,%l6	! %l6 = ffffffffa684dabd

p0_label_19:
!	Starting 10 instruction Store Burst
!	%f24 = 44cd89d0 188080a1, Mem[0000000030081400] = 000000ff 7e253ce9
	stda	%f24,[%i2+%g0]0x81	! Mem[0000000030081400] = 44cd89d0 188080a1
!	%l6 = ffffffffa684dabd, Mem[0000000010001408] = 463b4069
	stwa	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = a684dabd
!	%f6  = 31039852 42045bdb, %l2 = 0000000036e14c7e
!	Mem[0000000010101418] = 63a9b8925be0d31b
	add	%i4,0x018,%g1
	stda	%f6,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010101418] = 635b04425298031b
!	%l3 = ffffffffffff9b32, Mem[0000000030081410] = 3781ffff
	stba	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 3281ffff
!	%l3 = ffffffffffff9b32, Mem[0000000010141410] = b7722038
	stha	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = b7729b32
!	%l3 = ffffffffffff9b32, Mem[0000000030081400] = 44cd89d0
	stba	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = 32cd89d0
!	%f23 = 1b6233cb, Mem[0000000010101414] = 30e93375
	sta	%f23,[%i4+0x014]%asi	! Mem[0000000010101414] = 1b6233cb
!	%l2 = 36e14c7e, %l3 = ffff9b32, Mem[0000000010101408] = 343a2938 14c16826
	stda	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 36e14c7e ffff9b32
!	%l7 = 0000000000000052, Mem[00000000211c0001] = 0062b4f8
	stb	%l7,[%o2+0x001]		! Mem[00000000211c0000] = 0052b4f8
!	%f4  = 589ca228 3cf42099, Mem[0000000030141408] = 4658bae8 09be04cf
	stda	%f4 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 589ca228 3cf42099

p0_label_20:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 4069000012d75c19, %l5 = 000000002668c114
	ldxa	[%i5+%g0]0x80,%l5	! %l5 = 4069000012d75c19
!	Mem[0000000030141408] = 589ca2283cf42099, %l0 = ffffffff80000000
	ldxa	[%i5+%o4]0x81,%l0	! %l0 = 589ca2283cf42099
!	Mem[0000000010001400] = 6c9f1ac45956a545, %f16 = 343a2938 0d83e169
	ldda	[%i0+%g0]0x88,%f16	! %f16 = 6c9f1ac4 5956a545
!	Mem[0000000010041410] = 00000080, %l3 = ffffffffffff9b32
	ldsha	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000080
!	Mem[0000000010101410] = 00000000, %l1 = 0000000000000081
	ldsba	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = 6c9f1ac4 5956a545, %l0 = 3cf42099, %l1 = 00000000
	ldda	[%i0+%g0]0x88,%l0	! %l0 = 000000005956a545 000000006c9f1ac4
!	Mem[0000000010001408] = a684dabd, %l2 = 0000000036e14c7e
	ldsha	[%i0+%o4]0x88,%l2	! %l2 = ffffffffffffdabd
!	Mem[00000000201c0000] = 003f2c68, %l2 = ffffffffffffdabd
	ldub	[%o0+%g0],%l2		! %l2 = 0000000000000000
!	Mem[0000000010181410] = 52094374, %l6 = ffffffffa684dabd
	lduwa	[%i6+%o5]0x80,%l6	! %l6 = 0000000052094374
!	Mem[0000000030001410] = 8137eb22, %l5 = 4069000012d75c19
	ldsha	[%i0+%o5]0x81,%l5	! %l5 = ffffffffffff8137

p0_label_21:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 52980331, %l3 = 0000000000000080
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 0000000052980331
!	%l6 = 0000000052094374, Mem[000000001010143b] = 7401f16a, %asi = 80
	stba	%l6,[%i4+0x03b]%asi	! Mem[0000000010101438] = 7401f174
!	%l5 = ffffffffffff8137, Mem[0000000010101410] = 00000000
	stba	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000037
!	%f10 = 69e1830d 610297df, Mem[0000000010001400] = 5956a545 6c9f1ac4
	stda	%f10,[%i0+%g0]0x88	! Mem[0000000010001400] = 69e1830d 610297df
!	Mem[0000000030041400] = cd83ae58, %l6 = 0000000052094374
	ldstuba	[%i1+%g0]0x81,%l6	! %l6 = 00000000000000cd
!	Mem[0000000030001400] = 65806f0c, %l4 = 000000000000bae8
	ldstuba	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000065
!	Mem[0000000030081400] = 32cd89d0 188080a1 bdda84a6 13a3f717
!	%f0  = 58031499 54fefd35 40690000 12d75c19
!	%f4  = 589ca228 3cf42099 31039852 42045bdb
!	%f8  = 5976c7a0 18b7393c 69e1830d 610297df
!	%f12 = 3c6ed68c 22c374ed 417fa92a 1c3bc253
	stda	%f0 ,[%i2+%g0]ASI_BLK_AIUS	! Block Store to 0000000030081400
!	%l3 = 0000000052980331, Mem[0000000010001410] = 00000000
	stha	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = 03310000
!	%l4 = 0000000000000065, Mem[0000000010041408] = 532c928a
	stba	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 652c928a
!	Mem[0000000010181408] = 3200e786, %l2 = 0000000000000000
	lduh	[%i6+%o4],%l2		! %l2 = 0000000000003200

p0_label_22:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 626429b5, %l0 = 000000005956a545
	lduw	[%i4+%g0],%l0		! %l0 = 00000000626429b5
!	Mem[00000000100c1400] = 4658bae8, %l4 = 0000000000000065
	lduwa	[%i3+%g0]0x80,%l4	! %l4 = 000000004658bae8
!	Mem[0000000010001408] = a684dabd, %f17 = 5956a545
	lda	[%i0+%o4]0x88,%f17	! %f17 = a684dabd
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000030081410] = 28a29c58, %l3 = 0000000052980331
	ldsba	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000058
!	Mem[00000000300c1408] = 00000000, %l6 = 00000000000000cd
	lduba	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141408] = 26883fdf, %l2 = 0000000000003200
	lduha	[%i5+%o4]0x88,%l2	! %l2 = 0000000000003fdf
!	Mem[0000000030101410] = 00000000, %f15 = 1c3bc253
	lda	[%i4+%o5]0x81,%f15	! %f15 = 00000000
!	Mem[0000000010041410] = 8000000022f36cd5, %l3 = 0000000000000058, %asi = 80
	ldxa	[%i1+0x010]%asi,%l3	! %l3 = 8000000022f36cd5
!	Mem[00000000300c1410] = 847f4c7e, %l2 = 0000000000003fdf
	ldsba	[%i3+%o5]0x89,%l2	! %l2 = 000000000000007e
!	Mem[0000000021800000] = 782b8528, %l1 = 000000006c9f1ac4, %asi = 80
	ldsba	[%o3+0x000]%asi,%l1	! %l1 = 0000000000000078

p0_label_23:
!	Starting 10 instruction Store Burst
!	%f30 = 243cbfda, Mem[0000000030141400] = 00000000
	sta	%f30,[%i5+%g0]0x81	! Mem[0000000030141400] = 243cbfda
!	%f4  = 589ca228, Mem[0000000030101410] = 00000000
	sta	%f4 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 589ca228
!	Mem[0000000010001400] = 610297df, %l5 = 00000000ffff8137
	swapa	[%i0+%g0]0x88,%l5	! %l5 = 00000000610297df
!	Mem[0000000030001410] = 22eb3781, %l3 = 0000000022f36cd5
	swapa	[%i0+%o5]0x89,%l3	! %l3 = 0000000022eb3781
!	%l0 = 626429b5, %l1 = 00000078, Mem[0000000010041400] = 589ca228 3cf42099
	stda	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 626429b5 00000078
!	%l4 = 4658bae8, %l5 = 610297df, Mem[0000000030001400] = 0c6f80ff 292f8008
	stda	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 4658bae8 610297df
!	%f30 = 243cbfda, Mem[0000000030141408] = 28a29c58
	sta	%f30,[%i5+%o4]0x89	! Mem[0000000030141408] = 243cbfda
!	Mem[00000000300c1410] = 7e4c7f84, %l3 = 0000000022eb3781
	swapa	[%i3+%o5]0x81,%l3	! %l3 = 000000007e4c7f84
!	Mem[0000000020800040] = 23cbe0c8, %l2 = 000000000000007e
	ldstuba	[%o1+0x040]%asi,%l2	! %l2 = 0000000000000023
!	Mem[0000000030181400] = 384cf2ff, %l2 = 0000000000000023
	ldstuba	[%i6+%g0]0x89,%l2	! %l2 = 00000000000000ff

p0_label_24:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 626429b5, %l6 = 0000000000000000
	ldsba	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000062
!	Mem[00000000300c1400] = 3781ffff, %l5 = 00000000610297df
	lduha	[%i3+%g0]0x81,%l5	! %l5 = 0000000000003781
!	Mem[00000000100c1408] = 329b5626, %l5 = 0000000000003781
	ldswa	[%i3+%o4]0x80,%l5	! %l5 = 00000000329b5626
!	Mem[0000000030141408] = dabf3c24, %l2 = 00000000000000ff
	ldsha	[%i5+%o4]0x81,%l2	! %l2 = ffffffffffffdabf
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010041400] = 626429b5 00000078 652c928a 5464605f
!	Mem[0000000010041410] = 80000000 22f36cd5 5e87b072 04ff7f7b
!	Mem[0000000010041420] = 00000000 00000045 6bee6ffe 2c6f1957
!	Mem[0000000010041430] = 771ff1ac 1ed4af8d 2e96d54a 529c29f3
	ldda	[%i1+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010041400
!	Mem[0000000010141430] = 03d68b2cf4d9c063, %l3 = 000000007e4c7f84
	ldx	[%i5+0x030],%l3		! %l3 = 03d68b2cf4d9c063
!	Mem[0000000010181400] = 8137eb22, %l6 = 0000000000000062
	lduba	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000081
!	Mem[0000000010141408] = df97026126883fdf, %f4  = 589ca228 3cf42099
	ldda	[%i5+%o4]0x88,%f4 	! %f4  = df970261 26883fdf
!	Mem[0000000010181430] = 0214898c68267bed, %f12 = 3c6ed68c 22c374ed, %asi = 80
	ldda	[%i6+0x030]%asi,%f12	! %f12 = 0214898c 68267bed
!	Mem[00000000100c1400] = 4658bae8, %l7 = 0000000000000052
	lduha	[%i3+%g0]0x80,%l7	! %l7 = 0000000000004658

p0_label_25:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000626429b5, Mem[00000000100c1400] = 4658bae8
	stha	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 29b5bae8
!	%f18 = 5f606454, Mem[0000000030101408] = 044e6636
	sta	%f18,[%i4+%o4]0x81	! Mem[0000000030101408] = 5f606454
!	%f11 = 610297df, Mem[00000000300c1400] = ffff8137
	sta	%f11,[%i3+%g0]0x89	! Mem[00000000300c1400] = 610297df
!	%f8  = 5976c7a0 18b7393c, Mem[0000000010141420] = 58687a40 5856a951
	std	%f8 ,[%i5+0x020]	! Mem[0000000010141420] = 5976c7a0 18b7393c
!	Mem[0000000030081400] = 99140358, %l1 = 0000000000000078
	swapa	[%i2+%g0]0x89,%l1	! %l1 = 0000000099140358
!	%l0 = 00000000626429b5, Mem[0000000030181400] = fff24c38
	stwa	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 626429b5
!	%f1  = 54fefd35, Mem[0000000030001408] = 6e455dde
	sta	%f1 ,[%i0+%o4]0x81	! Mem[0000000030001408] = 54fefd35
!	%l5 = 00000000329b5626, Mem[00000000100c1410] = 00000001
	stha	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00005626
!	%f6  = 31039852, %f20 = d56cf322, %f9  = 18b7393c
	fmuls	%f6 ,%f20,%f9 		! %f9  = c6f39acd
!	%l0 = 00000000626429b5, Mem[0000000010001408] = a684dabd
	stwa	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 626429b5

p0_label_26:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 7e4ce136, %f8  = 5976c7a0
	lda	[%i6+%o4]0x81,%f8 	! %f8 = 7e4ce136
!	Mem[0000000010041418] = 5e87b072, %l0 = 00000000626429b5, %asi = 80
	lduha	[%i1+0x018]%asi,%l0	! %l0 = 0000000000005e87
!	Mem[0000000030101400] = df9702610d83e169, %l3 = 03d68b2cf4d9c063
	ldxa	[%i4+%g0]0x81,%l3	! %l3 = df9702610d83e169
!	Mem[000000001004141e] = 04ff7f7b, %l3 = df9702610d83e169, %asi = 80
	ldsha	[%i1+0x01e]%asi,%l3	! %l3 = 0000000000007f7b
!	Mem[0000000010181410] = 74430952, %l7 = 0000000000004658
	ldswa	[%i6+%o5]0x88,%l7	! %l7 = 0000000074430952
!	Mem[0000000010041410] = 80000000 22f36cd5, %l4 = 4658bae8, %l5 = 329b5626
	ldd	[%i1+%o5],%l4		! %l4 = 0000000080000000 0000000022f36cd5
!	Mem[0000000010041408] = 652c928a5464605f, %f0  = 58031499 54fefd35
	ldd	[%i1+%o4],%f0 		! %f0  = 652c928a 5464605f
!	Mem[0000000010081408] = 00000000, %l6 = 0000000000000081
	ldsha	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = 1b6233cb 68c7a779 00000000 1c3bc253
!	Mem[0000000010081410] = 31039852 42045bdb 7b7dedd2 3ce1eb5b
!	Mem[0000000010081420] = 48de6920 3be210b1 0031ab5e 0a18cb65
!	Mem[0000000010081430] = 00000000 26d54153 1b1f6eaa 6b8301d3
	ldda	[%i2+%g0]ASI_BLK_AIUPL,%f0 	! Block Load from 0000000010081400
!	Mem[0000000010041410] = 00000080, %l7 = 0000000074430952
	ldsba	[%i1+%o5]0x88,%l7	! %l7 = ffffffffffffff80

p0_label_27:
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffff80, Mem[0000000010181418] = 541f435208ea7adb, %asi = 80
	stxa	%l7,[%i6+0x018]%asi	! Mem[0000000010181418] = ffffffffffffff80
!	%f4  = db5b0442 52980331, Mem[0000000010181420] = 0de50aa0 68fb3c31, %asi = 80
	stda	%f4 ,[%i6+0x020]%asi	! Mem[0000000010181420] = db5b0442 52980331
	membar	#Sync			! Added by membar checker (4)
!	%l7 = ffffffffffffff80, Mem[0000000010041400] = 626429b5
	stwa	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = ffffff80
!	Mem[0000000010101410] = 37000000, %l7 = 00000000ffffff80
	swapa	[%i4+%o5]0x80,%l7	! %l7 = 0000000037000000
!	Mem[0000000010101408] = 36e14c7e, %l2 = ffffffffffffdabf
	ldstuba	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000036
!	Mem[0000000030041410] = c41a9f4c, %l4 = 0000000080000000
	ldstuba	[%i1+%o5]0x89,%l4	! %l4 = 000000000000004c
!	%l3 = 0000000000007f7b, Mem[0000000030001410] = 22f36cd5
	stha	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = 22f37f7b
!	Mem[0000000010141410] = b7729b32, %l4 = 000000000000004c
	swapa	[%i5+%o5]0x88,%l4	! %l4 = 00000000b7729b32
!	Mem[00000000218001c1] = 1794c678, %l0 = 0000000000005e87
	ldstuba	[%o3+0x1c1]%asi,%l0	! %l0 = 0000000000000094
!	Mem[0000000030141408] = dabf3c24, %l6 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l6	! %l6 = 00000000dabf3c24

p0_label_28:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001416] = 329b5626, %l3 = 0000000000007f7b, %asi = 80
	lduha	[%i0+0x016]%asi,%l3	! %l3 = 0000000000005626
!	Mem[00000000300c1400] = df970261, %l7 = 0000000037000000
	lduwa	[%i3+%g0]0x81,%l7	! %l7 = 00000000df970261
!	Mem[0000000030101410] = 28a29c580c6f8065, %l7 = 00000000df970261
	ldxa	[%i4+%o5]0x81,%l7	! %l7 = 28a29c580c6f8065
!	Mem[0000000030001408] = 35fdfe54, %l0 = 0000000000000094
	ldsba	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000054
!	Mem[0000000010101410] = 80ffffff, %l0 = 0000000000000054
	lduha	[%i4+%o5]0x88,%l0	! %l0 = 000000000000ffff
!	%l0 = 000000000000ffff, imm = 00000000000001cd, %l5 = 0000000022f36cd5
	or	%l0,0x1cd,%l5		! %l5 = 000000000000ffff
!	Mem[0000000010101410] = ffffff80, %l6 = 00000000dabf3c24
	ldsha	[%i4+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010141408] = df3f8826, %l6 = ffffffffffffffff
	ldsha	[%i5+%o4]0x80,%l6	! %l6 = ffffffffffffdf3f
!	Mem[0000000030081410] = 28a29c58, %l0 = 000000000000ffff
	lduha	[%i2+%o5]0x89,%l0	! %l0 = 0000000000009c58
!	Mem[0000000030181410] = a52d544d 80000000, %l0 = 00009c58, %l1 = 99140358
	ldda	[%i6+%o5]0x89,%l0	! %l0 = 0000000080000000 00000000a52d544d

p0_label_29:
!	Starting 10 instruction Store Burst
!	%f2  = 53c23b1c 00000000, %l6 = ffffffffffffdf3f
!	Mem[0000000010041408] = 652c928a5464605f
	add	%i1,0x008,%g1
	stda	%f2,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010041408] = 000000001c3bc253
!	%l3 = 0000000000005626, Mem[0000000030101410] = 28a29c580c6f8065
	stxa	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000000000005626
!	%l2 = 0000000000000036, Mem[000000001018141c] = ffffff80
	sth	%l2,[%i6+0x01c]		! Mem[000000001018141c] = 0036ff80
!	Mem[0000000030081408] = 40690000, %l1 = 00000000a52d544d
	swapa	[%i2+%o4]0x81,%l1	! %l1 = 0000000040690000
!	%l4 = 00000000b7729b32, Mem[0000000030141400] = 243cbfda
	stba	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 323cbfda
!	%f14 = d301836b, Mem[00000000100c1400] = 29b5bae8
	sta	%f14,[%i3+%g0]0x80	! Mem[00000000100c1400] = d301836b
!	Mem[0000000010141400] = 40690000, %l3 = 0000000000005626
	swapa	[%i5+%g0]0x80,%l3	! %l3 = 0000000040690000
!	Mem[00000000211c0000] = 0052b4f8, %l5 = 000000000000ffff
	ldstuba	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[000000001010142c] = 12993ef7, %l1 = 0000000040690000
	swap	[%i4+0x02c],%l1		! %l1 = 0000000012993ef7
!	Mem[000000001014141c] = 74884efb, %l4 = 00000000b7729b32
	ldstuba	[%i5+0x01c]%asi,%l4	! %l4 = 0000000000000074

p0_label_30:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1428] = 010c55246e942d17, %f0  = 79a7c768 cb33621b
	ldd	[%i3+0x028],%f0 	! %f0  = 010c5524 6e942d17
!	Mem[0000000030041408] = 17e6cc56, %l5 = 0000000000000000
	lduba	[%i1+%o4]0x81,%l5	! %l5 = 0000000000000017
!	Mem[0000000030141410] = 36a5a4444a5f18c5, %l1 = 0000000012993ef7
	ldxa	[%i5+%o5]0x81,%l1	! %l1 = 36a5a4444a5f18c5
!	Mem[0000000030101400] = 610297df, %l1 = 36a5a4444a5f18c5
	lduha	[%i4+%g0]0x89,%l1	! %l1 = 00000000000097df
!	Mem[0000000010001410] = 00003103, %f7  = d2ed7d7b
	lda	[%i0+%o5]0x88,%f7 	! %f7 = 00003103
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010041400] = ffffff80 00000078 00000000 1c3bc253
!	Mem[0000000010041410] = 80000000 22f36cd5 5e87b072 04ff7f7b
!	Mem[0000000010041420] = 00000000 00000045 6bee6ffe 2c6f1957
!	Mem[0000000010041430] = 771ff1ac 1ed4af8d 2e96d54a 529c29f3
	ldda	[%i1+%g0]ASI_BLK_AIUP,%f0 	! Block Load from 0000000010041400
!	Mem[00000000211c0000] = ff52b4f8, %l6 = ffffffffffffdf3f, %asi = 80
	ldsba	[%o2+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010001410] = 26569b3200003103, %l5 = 0000000000000017
	ldxa	[%i0+%o5]0x88,%l5	! %l5 = 26569b3200003103
!	Mem[0000000010141400] = 26560000, %l3 = 0000000040690000
	ldsha	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000000
!	%l6 = ffffffffffffffff, immd = 000007d7, %y  = 80000000
	sdiv	%l6,0x7d7,%l1		! %l1 = ffffffff80000000
	mov	%l0,%y			! %y = 80000000

p0_label_31:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 03310000, %l1 = 0000000080000000
	swapa	[%i0+%o5]0x80,%l1	! %l1 = 0000000003310000
!	Mem[0000000030181400] = 626429b5, %l7 = 000000000c6f8065
	swapa	[%i6+%g0]0x81,%l7	! %l7 = 00000000626429b5
!	Mem[0000000030041408] = 56cce617, %l1 = 0000000003310000
	swapa	[%i1+%o4]0x89,%l1	! %l1 = 0000000056cce617
!	Mem[0000000030101408] = 5f606454, %l7 = 00000000626429b5
	ldstuba	[%i4+%o4]0x81,%l7	! %l7 = 000000000000005f
!	Mem[0000000010141408] = 26883fdf, %l6 = ffffffffffffffff
	ldstuba	[%i5+%o4]0x88,%l6	! %l6 = 00000000000000df
!	%l1 = 0000000056cce617, Mem[0000000010181410] = 74430952
	stwa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = 56cce617
!	Mem[0000000010081424] = 3be210b1, %l5 = 0000000000003103
	swap	[%i2+0x024],%l5		! %l5 = 000000003be210b1
!	%l4 = 0000000000000074, Mem[0000000021800101] = 2a269de8, %asi = 80
	stba	%l4,[%o3+0x101]%asi	! Mem[0000000021800100] = 2a749de8
!	Code Fragment 3, seed = 113288
p0_fragment_3:
!	%l0 = 0000000080000000
	setx	0xdf8388cade52abe6,%g7,%l0 ! %l0 = df8388cade52abe6
!	%l1 = 0000000056cce617
	setx	0xb5752ef1042d9411,%g7,%l1 ! %l1 = b5752ef1042d9411
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = df8388cade52abe6
	setx	0xc64d93978b57a04c,%g7,%l0 ! %l0 = c64d93978b57a04c
!	%l1 = b5752ef1042d9411
	setx	0x3312bf663c84d397,%g7,%l1 ! %l1 = 3312bf663c84d397
p0_fragment_3_end:
!	%l6 = 00000000000000df, Mem[0000000030101400] = 69e1830d610297df
	stxa	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000000000df

p0_label_32:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff52b4f8, %l0 = c64d93978b57a04c
	ldub	[%o2+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030041410] = c41a9fff, %l2 = 0000000000000036
	ldsba	[%i1+%o5]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[000000001014140c] = 610297df, %l1 = 3312bf663c84d397
	ldsh	[%i5+0x00c],%l1		! %l1 = 0000000000006102
!	Mem[0000000010101400] = 626429b5, %f31 = 4ad5962e
	lda	[%i4+%g0]0x80,%f31	! %f31 = 626429b5
!	Mem[0000000030101400] = 00000000000000df, %l4 = 0000000000000074
	ldxa	[%i4+%g0]0x89,%l4	! %l4 = 00000000000000df
!	Mem[0000000030081410] = 589ca228, %l0 = 00000000000000ff
	lduha	[%i2+%o5]0x81,%l0	! %l0 = 000000000000589c
!	Mem[000000001008143c] = 6b8301d3, %f31 = 626429b5
	ld	[%i2+0x03c],%f31	! %f31 = 6b8301d3
!	Mem[000000001010143c] = 32cac193, %l3 = 0000000000000000
	ldub	[%i4+0x03c],%l3		! %l3 = 0000000000000032
!	Mem[00000000300c1410] = 057f086b8137eb22, %l4 = 00000000000000df
	ldxa	[%i3+%o5]0x89,%l4	! %l4 = 057f086b8137eb22
!	Mem[0000000010041408] = 00000000, %l6 = 00000000000000df
	ldswa	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000000

p0_label_33:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000006102, Mem[0000000010181418] = ffffffff
	sth	%l1,[%i6+0x018]		! Mem[0000000010181418] = 6102ffff
!	%l0 = 0000589c, %l1 = 00006102, Mem[0000000010001410] = 80000000 329b5626
	std	%l0,[%i0+%o5]		! Mem[0000000010001410] = 0000589c 00006102
!	Mem[0000000030081410] = 589ca228, %l7 = 000000000000005f
	swapa	[%i2+%o5]0x81,%l7	! %l7 = 00000000589ca228
!	Mem[00000000218000c1] = 6a4cddb8, %l7 = 00000000589ca228
	ldstub	[%o3+0x0c1],%l7		! %l7 = 000000000000004c
!	%l4 = 8137eb22, %l5 = 3be210b1, Mem[00000000100c1408] = 26569b32 1f1c3c0c
	stda	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 8137eb22 3be210b1
!	Mem[0000000030041408] = 03310000, %l6 = 0000000000000000
	swapa	[%i1+%o4]0x89,%l6	! %l6 = 0000000003310000
!	%l0 = 000000000000589c, Mem[0000000030081408] = 4d542da5
	stwa	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000589c
!	%f4  = 80000000, %f5  = 22f36cd5, %f14 = 2e96d54a
	fadds	%f4 ,%f5 ,%f14		! %f14 = 22f36cd5
!	Mem[0000000030001400] = e8ba5846 df970261 54fefd35 8ea5872c
!	%f0  = ffffff80 00000078 00000000 1c3bc253
!	%f4  = 80000000 22f36cd5 5e87b072 04ff7f7b
!	%f8  = 00000000 00000045 6bee6ffe 2c6f1957
!	%f12 = 771ff1ac 1ed4af8d 22f36cd5 529c29f3
	stda	%f0 ,[%i0+%g0]ASI_COMMIT_S	! Block Store to 0000000030001400
!	Mem[0000000010101414] = 1b6233cb, %l5 = 000000003be210b1
	ldstuba	[%i4+0x014]%asi,%l5	! %l5 = 000000000000001b

p0_label_34:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 323cbfda 000000ff, %l6 = 03310000, %l7 = 0000004c
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 00000000323cbfda 00000000000000ff
!	Mem[0000000030141408] = 000000003cf42099, %l7 = 00000000000000ff
	ldxa	[%i5+%o4]0x81,%l7	! %l7 = 000000003cf42099
!	Mem[0000000030081410] = 0000005f3cf42099, %f16 = 78000000 b5296462
	ldda	[%i2+%o5]0x81,%f16	! %f16 = 0000005f 3cf42099
!	Mem[0000000010141408] = 26883fff, %l2 = ffffffffffffffff
	lduwa	[%i5+%o4]0x88,%l2	! %l2 = 0000000026883fff
!	Mem[0000000030141400] = 323cbfda, %f19 = 8a922c65
	lda	[%i5+%g0]0x81,%f19	! %f19 = 323cbfda
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000030001400] = 7800000080ffffff, %l4 = 057f086b8137eb22
	ldxa	[%i0+%g0]0x89,%l4	! %l4 = 7800000080ffffff
!	Mem[0000000010041438] = 2e96d54a, %l6 = 00000000323cbfda, %asi = 80
	lduba	[%i1+0x038]%asi,%l6	! %l6 = 000000000000002e
!	Mem[00000000100c1410] = 26560000 2b921695, %l0 = 0000589c, %l1 = 00006102, %asi = 80
	ldda	[%i3+0x010]%asi,%l0	! %l0 = 0000000026560000 000000002b921695
!	Mem[0000000010081418] = 7b7dedd23ce1eb5b, %l5 = 000000000000001b
	ldx	[%i2+0x018],%l5		! %l5 = 7b7dedd23ce1eb5b
!	Mem[0000000010041400] = ffffff80, %l7 = 000000003cf42099
	ldsba	[%i1+%g0]0x80,%l7	! %l7 = ffffffffffffffff

p0_label_35:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = df000000, %l1 = 000000002b921695
	ldstuba	[%i4+%g0]0x81,%l1	! %l1 = 00000000000000df
!	%f12 = 771ff1ac 1ed4af8d, %l6 = 000000000000002e
!	Mem[0000000010081438] = 1b1f6eaa6b8301d3
	add	%i2,0x038,%g1
	stda	%f12,[%g1+%l6]ASI_PST32_P ! Mem[0000000010081438] = 771ff1ac6b8301d3
!	%f28 = 8dafd41e, %f26 = 57196f2c
	fcmps	%fcc3,%f28,%f26		! %fcc3 = 1
!	%l6 = 0000002e, %l7 = ffffffff, Mem[0000000010101428] = 56d8721e 40690000, %asi = 80
	stda	%l6,[%i4+0x028]%asi	! Mem[0000000010101428] = 0000002e ffffffff
!	%f18 = 5f606454 323cbfda, Mem[0000000030041408] = 00000000 7fcc6d4f
	stda	%f18,[%i1+%o4]0x81	! Mem[0000000030041408] = 5f606454 323cbfda
!	%f2  = 00000000 1c3bc253, Mem[0000000030041408] = 5464605f dabf3c32
	stda	%f2 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000 1c3bc253
!	%f18 = 5f606454 323cbfda, Mem[0000000030081400] = 78000000 54fefd35
	stda	%f18,[%i2+%g0]0x81	! Mem[0000000030081400] = 5f606454 323cbfda
!	%l4 = 7800000080ffffff, Mem[0000000030101400] = ff000000
	stha	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = ffff0000
!	%l1 = 00000000000000df, Mem[0000000010141400] = 00005626
	stba	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = df005626
!	%f24 = 45000000 00000000, Mem[0000000010181400] = 8137eb22 22f3a2f9
	stda	%f24,[%i6+%g0]0x80	! Mem[0000000010181400] = 45000000 00000000

p0_label_36:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 36e14c7e, %f9  = 00000045
	lda	[%i6+%o4]0x89,%f9 	! %f9 = 36e14c7e
!	Mem[0000000010041408] = 53c23b1c 00000000, %l4 = 80ffffff, %l5 = 3ce1eb5b
	ldda	[%i1+%o4]0x88,%l4	! %l4 = 0000000000000000 0000000053c23b1c
!	Mem[0000000010141432] = 03d68b2c, %l4 = 0000000000000000
	ldub	[%i5+0x032],%l4		! %l4 = 000000000000008b
!	Mem[00000000100c1408] = 22eb3781b110e23b, %f22 = 7b7fff04 72b0875e
	ldda	[%i3+%o4]0x80,%f22	! %f22 = 22eb3781 b110e23b
!	Mem[0000000010101408] = 7e4ce1ff, %l1 = 00000000000000df
	ldsha	[%i4+%o4]0x88,%l1	! %l1 = ffffffffffffe1ff
!	Mem[0000000030181400] = 65806f0c, %l7 = ffffffffffffffff
	lduha	[%i6+%g0]0x89,%l7	! %l7 = 0000000000006f0c
!	Mem[0000000010181400] = 00000045, %l6 = 000000000000002e
	lduwa	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000045
!	%f26 = 57196f2c, %f12 = 771ff1ac, %f2  = 00000000
	fadds	%f26,%f12,%f2 		! %f2  = 771ff1ac
!	Mem[0000000030181410] = 00000080, %l5 = 0000000053c23b1c
	ldsba	[%i6+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181408] = 3200e786, %l7 = 0000000000006f0c
	ldswa	[%i6+%o4]0x80,%l7	! %l7 = 000000003200e786

p0_label_37:
!	Starting 10 instruction Store Burst
!	%l6 = 00000045, %l7 = 3200e786, Mem[0000000010181408] = 3200e786 08055dbf
	stda	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000045 3200e786
!	%l7 = 000000003200e786, Mem[00000000100c1400] = d301836b
	stba	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 8601836b
!	Mem[0000000010001410] = 0000589c, %l5 = 0000000000000000
	swapa	[%i0+%o5]0x80,%l5	! %l5 = 000000000000589c
!	%f30 = f3299c52 6b8301d3, Mem[0000000010181408] = 00000045 3200e786
	stda	%f30,[%i6+%o4]0x80	! Mem[0000000010181408] = f3299c52 6b8301d3
!	%f24 = 45000000 00000000, Mem[00000000100c1408] = 8137eb22 3be210b1
	stda	%f24,[%i3+%o4]0x88	! Mem[00000000100c1408] = 45000000 00000000
!	%l0 = 0000000026560000, Mem[0000000010181408] = 529c29f3
	stba	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 529c2900
!	%l3 = 0000000000000032, Mem[0000000030001410] = 8000000022f36cd5
	stxa	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000000000032
!	%f11 = 2c6f1957, %f3  = 1c3bc253, %f0  = ffffff80
	fdivs	%f11,%f3 ,%f0 		! %f0  = 4fa2ffeb
!	Mem[0000000010081400] = 1b6233cb 68c7a779 00000000 1c3bc253
!	%f0  = 4fa2ffeb 00000078 771ff1ac 1c3bc253
!	%f4  = 80000000 22f36cd5 5e87b072 04ff7f7b
!	%f8  = 00000000 36e14c7e 6bee6ffe 2c6f1957
!	%f12 = 771ff1ac 1ed4af8d 22f36cd5 529c29f3
	stda	%f0 ,[%i2+%g0]ASI_BLK_PL	! Block Store to 0000000010081400
!	Mem[0000000030041410] = c41a9fff, %l5 = 000000000000589c
	swapa	[%i1+%o5]0x89,%l5	! %l5 = 00000000c41a9fff

p0_label_38:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041436] = 1ed4af8d, %l2 = 0000000026883fff, %asi = 80
	ldsha	[%i1+0x036]%asi,%l2	! %l2 = ffffffffffffaf8d
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010081420] = 7e4ce13600000000, %f24 = 45000000 00000000
	ldd	[%i2+0x020],%f24	! %f24 = 7e4ce136 00000000
!	Mem[0000000010181400] = 45000000, %l5 = 00000000c41a9fff
	lduwa	[%i6+%g0]0x80,%l5	! %l5 = 0000000045000000
!	Mem[00000000100c1410] = 00005626, %l5 = 0000000045000000
	ldswa	[%i3+%o5]0x88,%l5	! %l5 = 0000000000005626
!	Mem[00000000300c1408] = 00000000, %f17 = 3cf42099
	lda	[%i3+%o4]0x89,%f17	! %f17 = 00000000
!	Mem[0000000030001408] = 00000000, %l1 = ffffffffffffe1ff
	lduha	[%i0+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = 00000080, %l1 = 0000000000000000
	lduwa	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000080
!	Mem[00000000201c0000] = 003f2c68, %l6 = 0000000000000045
	ldsb	[%o0+%g0],%l6		! %l6 = 0000000000000000
!	Mem[0000000010001400] = ffff8137, %l3 = 0000000000000032
	lduha	[%i0+%g0]0x88,%l3	! %l3 = 0000000000008137
!	Mem[0000000010041410] = 80000000 22f36cd5, %l0 = 26560000, %l1 = 00000080
	ldda	[%i1+%o5]0x80,%l0	! %l0 = 0000000080000000 0000000022f36cd5

p0_label_39:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 0000589c, %l4 = 000000000000008b
	ldstuba	[%i1+%o5]0x89,%l4	! %l4 = 000000000000009c
!	Mem[0000000010141400] = df005626, %l7 = 000000003200e786
	ldstuba	[%i5+%g0]0x80,%l7	! %l7 = 00000000000000df
!	%l7 = 00000000000000df, %l0 = 0000000080000000, %l1 = 0000000022f36cd5
	sub	%l7,%l0,%l1		! %l1 = ffffffff800000df
!	%l4 = 000000000000009c, Mem[0000000010141410] = 0000004c
	stwa	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000009c
!	%f4  = 80000000, Mem[0000000010081400] = 78000000
	sta	%f4 ,[%i2+%g0]0x80	! Mem[0000000010081400] = 80000000
!	Mem[0000000030101400] = ffff0000, %l5 = 0000000000005626
	swapa	[%i4+%g0]0x81,%l5	! %l5 = 00000000ffff0000
!	Mem[0000000010141436] = f4d9c063, %l1 = ffffffff800000df
	ldstub	[%i5+0x036],%l1		! %l1 = 00000000000000c0
!	%l2 = ffffffffffffaf8d, Mem[00000000300c1400] = df970261ffffffff
	stxa	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffffffffaf8d
!	%l7 = 00000000000000df, Mem[0000000010041400] = 7800000080ffffff
	stxa	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000000000df
!	%l7 = 00000000000000df, Mem[0000000030001408] = 00000000
	stba	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = df000000

p0_label_40:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00005626, %l0 = 0000000080000000
	ldsba	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000026
!	%f1  = 00000078, %f17 = 00000000, %f27 = fe6fee6b
	fadds	%f1 ,%f17,%f27		! tt=0x22, %l0 = 0000000000000048
!	Mem[0000000021800181] = 68731248, %l6 = 0000000000000000
	ldub	[%o3+0x181],%l6		! %l6 = 0000000000000073
!	Mem[0000000030081410] = 0000005f, %l3 = 0000000000008137
	lduwa	[%i2+%o5]0x81,%l3	! %l3 = 000000000000005f
!	Mem[00000000300c1410] = 22eb3781, %f25 = 00000000
	lda	[%i3+%o5]0x81,%f25	! %f25 = 22eb3781
!	Mem[0000000010081408] = 53c23b1c, %l0 = 0000000000000048
	ldsha	[%i2+%o4]0x80,%l0	! %l0 = 00000000000053c2
!	Mem[0000000030041400] = 099e812858ae83ff, %f6  = 5e87b072 04ff7f7b
	ldda	[%i1+%g0]0x89,%f6 	! %f6  = 099e8128 58ae83ff
!	Mem[0000000010041410] = 80000000, %l5 = 00000000ffff0000
	ldsba	[%i1+%o5]0x80,%l5	! %l5 = ffffffffffffff80
!	Mem[0000000010081408] = 1c3bc253, %l1 = 00000000000000c0
	ldsha	[%i2+%o4]0x88,%l1	! %l1 = ffffffffffffc253
!	Mem[0000000010041408] = 000000001c3bc253, %l6 = 0000000000000073, %asi = 80
	ldxa	[%i1+0x008]%asi,%l6	! %l6 = 000000001c3bc253

p0_label_41:
!	Starting 10 instruction Store Burst
!	%f25 = 22eb3781, Mem[0000000030181410] = 00000080
	sta	%f25,[%i6+%o5]0x81	! Mem[0000000030181410] = 22eb3781
!	%l7 = 00000000000000df, Mem[0000000030181408] = 7e4ce136
	stwa	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000df
!	%l1 = ffffffffffffc253, imm = 000000000000047b, %l6 = 000000001c3bc253
	subc	%l1,0x47b,%l6		! %l6 = ffffffffffffbdd8
!	Mem[0000000010041414] = 22f36cd5, %l5 = 00000000ffffff80
	swap	[%i1+0x014],%l5		! %l5 = 0000000022f36cd5
!	%f21 = 00000080, Mem[0000000010181410] = 56cce617
	sta	%f21,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000080
!	%l2 = ffffffffffffaf8d, Mem[0000000030181408] = df000000
	stwa	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffaf8d
!	%l4 = 0000009c, %l5 = 22f36cd5, Mem[00000000100c1400] = 6b830186 595eb93b
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000009c 22f36cd5
!	%l6 = ffffffffffffbdd8, Mem[0000000010181408] = 00299c52
	stha	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = bdd89c52
!	Mem[0000000010081408] = 53c23b1c, %l5 = 0000000022f36cd5
	swapa	[%i2+%o4]0x80,%l5	! %l5 = 0000000053c23b1c
!	%l4 = 000000000000009c, Mem[00000000300c1400] = ffffffff
	stha	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffff009c

p0_label_42:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 771ff1acd56cf322, %l7 = 00000000000000df
	ldxa	[%i2+%o4]0x88,%l7	! %l7 = 771ff1acd56cf322
!	Mem[0000000010041408] = 00000000, %l3 = 000000000000005f
	lduba	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141408] = 00000000, %l2 = ffffffffffffaf8d
	lduwa	[%i5+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000021800180] = 68731248, %l3 = 0000000000000000
	ldsh	[%o3+0x180],%l3		! %l3 = 0000000000006873
!	Mem[0000000010081408] = 771ff1acd56cf322, %l4 = 000000000000009c
	ldxa	[%i2+%o4]0x88,%l4	! %l4 = 771ff1acd56cf322
!	Mem[0000000010141430] = 03d68b2c, %l3 = 0000000000006873
	ldsh	[%i5+0x030],%l3		! %l3 = 00000000000003d6
!	Mem[0000000010141437] = f4d9ff63, %l4 = 771ff1acd56cf322, %asi = 80
	ldsba	[%i5+0x037]%asi,%l4	! %l4 = 0000000000000063
!	Mem[0000000010101408] = ffe14c7effff9b32, %f28 = 8dafd41e acf11f77
	ldda	[%i4+%o4]0x80,%f28	! %f28 = ffe14c7e ffff9b32
!	Mem[0000000030101410] = 00000000, %l4 = 0000000000000063
	ldsba	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000211c0000] = ff52b4f8, %l0 = 00000000000053c2
	lduh	[%o2+%g0],%l0		! %l0 = 000000000000ff52

p0_label_43:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = ff580000, %l5 = 0000000053c23b1c
	swapa	[%i1+%o5]0x81,%l5	! %l5 = 00000000ff580000
!	%l1 = ffffffffffffc253, Mem[00000000201c0000] = 003f2c68, %asi = 80
	stha	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = c2532c68
!	%l7 = 771ff1acd56cf322, Mem[00000000300c1400] = ffff009c
	stha	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = fffff322
!	Mem[0000000010141418] = 740f45f2, %l3 = 00000000000003d6, %asi = 80
	swapa	[%i5+0x018]%asi,%l3	! %l3 = 00000000740f45f2
!	Mem[0000000010001408] = 626429b5, %l7 = 771ff1acd56cf322
	ldstuba	[%i0+%o4]0x88,%l7	! %l7 = 00000000000000b5
!	%l0 = 0000ff52, %l1 = ffffc253, Mem[0000000010141420] = 5976c7a0 18b7393c, %asi = 80
	stda	%l0,[%i5+0x020]%asi	! Mem[0000000010141420] = 0000ff52 ffffc253
!	Mem[0000000010081410] = d56cf322, %l7 = 00000000000000b5
	swapa	[%i2+%o5]0x80,%l7	! %l7 = 00000000d56cf322
!	%l1 = ffffffffffffc253, Mem[0000000030041408] = 000000001c3bc253
	stxa	%l1,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffffffffffc253
!	%f3  = 1c3bc253, Mem[0000000030081400] = 5f606454
	sta	%f3 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 1c3bc253
!	%l2 = 00000000, %l3 = 740f45f2, Mem[0000000010101408] = 7e4ce1ff 329bffff
	stda	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000 740f45f2

p0_label_44:
!	Starting 10 instruction Load Burst
!	%l4 = 0000000000000000, %l4 = 0000000000000000, %l1 = ffffffffffffc253
	subc	%l4,%l4,%l1		! %l1 = 0000000000000000
!	Mem[0000000010081410] = b5000000, %l0 = 000000000000ff52
	ldsba	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081408] = 195cd712 0000589c, %l6 = ffffbdd8, %l7 = d56cf322
	ldda	[%i2+%o4]0x89,%l6	! %l6 = 000000000000589c 00000000195cd712
!	Mem[00000000218001c1] = 17ffc678, %l1 = 0000000000000000
	ldsb	[%o3+0x1c1],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010081400] = 80000000ebffa24f, %f0  = 4fa2ffeb 00000078
	ldda	[%i2+%g0]0x80,%f0 	! %f0  = 80000000 ebffa24f
!	Mem[0000000010081400] = 80000000, %l7 = 00000000195cd712
	lduha	[%i2+%g0]0x80,%l7	! %l7 = 0000000000008000
!	Mem[0000000010001410] = 00000000, %l6 = 000000000000589c
	swapa	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = ffff8137, %l4 = 0000000000000000
	lduha	[%i0+%g0]0x88,%l4	! %l4 = 0000000000008137
!	Mem[0000000010181400] = 00000045, %f30 = f3299c52
	lda	[%i6+%g0]0x88,%f30	! %f30 = 00000045
!	Mem[0000000010041408] = 000000001c3bc253, %f16 = 0000005f 00000000
	ldda	[%i1+%o4]0x80,%f16	! %f16 = 00000000 1c3bc253

p0_label_45:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041435] = 1ed4af8d, %l6 = 0000000000000000
	ldstub	[%i1+0x035],%l6		! %l6 = 00000000000000d4
!	%l6 = 00000000000000d4, Mem[0000000010041408] = 00000000
	stwa	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 000000d4
!	%l7 = 0000000000008000, %l5 = 00000000ff580000, %l2  = 0000000000000000
	mulx	%l7,%l5,%l2		! %l2 = 00007fac00000000
!	%f0  = 80000000 ebffa24f, Mem[0000000010141400] = 265600ff 195cd712
	stda	%f0 ,[%i5+%g0]0x88	! Mem[0000000010141400] = 80000000 ebffa24f
!	Mem[0000000010081400] = 80000000, %l0 = 0000000000000000
	swap	[%i2+%g0],%l0		! %l0 = 0000000080000000
!	%l2 = 00007fac00000000, Mem[0000000030141408] = 00000000
	stha	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	Mem[0000000030081400] = 1c3bc253, %l2 = 00007fac00000000
	ldstuba	[%i2+%g0]0x81,%l2	! %l2 = 000000000000001c
!	Mem[0000000010001400] = 3781ffff 0d83e169 ff296462 1c860a7f
!	%f0  = 80000000 ebffa24f 771ff1ac 1c3bc253
!	%f4  = 80000000 22f36cd5 099e8128 58ae83ff
!	%f8  = 00000000 36e14c7e 6bee6ffe 2c6f1957
!	%f12 = 771ff1ac 1ed4af8d 22f36cd5 529c29f3
	stda	%f0 ,[%i0+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010001400
!	%f2  = 771ff1ac, Mem[0000000030141400] = dabf3c32
	sta	%f2 ,[%i5+%g0]0x89	! Mem[0000000030141400] = 771ff1ac
!	%l6 = 00000000000000d4, Mem[0000000030181410] = 8137eb22
	stha	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 813700d4

p0_label_46:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 000000b5, %f20 = d56cf322
	lda	[%i2+%o5]0x80,%f20	! %f20 = 000000b5
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000010081400] = 00000000 ebffa24f 22f36cd5 acf11f77
!	Mem[0000000010081410] = 000000b5 00000080 7b7fff04 72b0875e
!	Mem[0000000010081420] = 7e4ce136 00000000 57196f2c fe6fee6b
!	Mem[0000000010081430] = 8dafd41e acf11f77 f3299c52 d56cf322
	ldda	[%i2+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010081400
!	Mem[0000000010101400] = 626429b5 39c14539, %l0 = 80000000, %l1 = ffffffff, %asi = 80
	ldda	[%i4+0x000]%asi,%l0	! %l0 = 00000000626429b5 0000000039c14539
!	Mem[0000000030181410] = 813700d4, %f23 = b110e23b
	lda	[%i6+%o5]0x89,%f23	! %f23 = 813700d4
!	%l7 = 0000000000008000, Mem[0000000010141408] = ff3f8826610297df
	stxa	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000000000008000
!	Mem[0000000030181400] = 65806f0c, %l5 = 00000000ff580000
	ldsba	[%i6+%g0]0x89,%l5	! %l5 = 000000000000000c
!	Mem[0000000010081410] = b5000000, %f16 = 00000000
	lda	[%i2+%o5]0x88,%f16	! %f16 = b5000000
!	Mem[0000000030101410] = 00000000, %l0 = 00000000626429b5
	lduwa	[%i4+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = 771ff1ac, %f25 = 22eb3781
	lda	[%i5+%g0]0x89,%f25	! %f25 = 771ff1ac
!	Mem[0000000010081410] = 000000b500000080, %f20 = 000000b5 00000080
	ldda	[%i2+%o5]0x80,%f20	! %f20 = 000000b5 00000080

p0_label_47:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 00000000, %l2 = 000000000000001c
	swapa	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030081410] = 5f000000
	stha	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 5f000000
!	%l7 = 0000000000008000, Mem[0000000010001400] = 4fa2ffeb
	stwa	%l7,[%i0+%g0]0x80	! Mem[0000000010001400] = 00008000
!	%l4 = 0000000000008137, Mem[0000000010141408] = 00000000
	stba	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 37000000
!	Mem[00000000100c1408] = 00000000, %l1 = 0000000039c14539
	swapa	[%i3+%o4]0x80,%l1	! %l1 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010101408] = 00000000
	stha	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000030101410] = 1c000000 26560000
	stda	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000 00000000
!	%l6 = 00000000000000d4, Mem[0000000020800000] = 33ff0898
	sth	%l6,[%o1+%g0]		! Mem[0000000020800000] = 00d40898
!	%f6  = 7b7fff04, Mem[0000000010141408] = 00000037
	sta	%f6 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 7b7fff04
!	Mem[0000000030141408] = 00000000, %l5 = 000000000000000c
	swapa	[%i5+%o4]0x81,%l5	! %l5 = 0000000000000000

p0_label_48:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181418] = 6102ffff0036ff80, %f22 = 22eb3781 813700d4
	ldd	[%i6+0x018],%f22	! %f22 = 6102ffff 0036ff80
!	Mem[0000000010141400] = ebffa24f, %l3 = 00000000740f45f2
	ldsba	[%i5+%g0]0x88,%l3	! %l3 = 000000000000004f
!	Mem[0000000010081410] = b5000000, %f28 = ffe14c7e
	lda	[%i2+%o5]0x88,%f28	! %f28 = b5000000
!	Mem[0000000010041428] = 6bee6ffe, %l3 = 000000000000004f
	lduw	[%i1+0x028],%l3		! %l3 = 000000006bee6ffe
!	%l3 = 000000006bee6ffe, immd = 00000000000006b8, %l3  = 000000006bee6ffe
	mulx	%l3,0x6b8,%l3		! %l3 = 000002d52a007290
!	Mem[0000000010081400] = 00000000, %f28 = b5000000
	lda	[%i2+%g0]0x80,%f28	! %f28 = 00000000
!	Mem[000000001014142c] = 3ae000d7, %l5 = 0000000000000000, %asi = 80
	lduwa	[%i5+0x02c]%asi,%l5	! %l5 = 000000003ae000d7
!	Mem[00000000100c1400] = 22f36cd50000009c, %f22 = 6102ffff 0036ff80
	ldda	[%i3+%g0]0x88,%f22	! %f22 = 22f36cd5 0000009c
!	Mem[0000000010081408] = 771ff1ac d56cf322, %l0 = 00000000, %l1 = 00000000
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 00000000d56cf322 00000000771ff1ac
!	Mem[00000000100c1410] = 265600002b921695, %l1 = 00000000771ff1ac
	ldxa	[%i3+%o5]0x80,%l1	! %l1 = 265600002b921695

p0_label_49:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 00000080, %l4 = 0000000000008137
	ldstuba	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000080
!	Mem[0000000010181421] = db5b0442, %l4 = 0000000000000080
	ldstub	[%i6+0x021],%l4		! %l4 = 000000000000005b
!	Mem[0000000030181408] = 8dafffff, %l0 = 00000000d56cf322
	swapa	[%i6+%o4]0x81,%l0	! %l0 = 000000008dafffff
!	%f30 = 00000045 6b8301d3, Mem[0000000010001400] = 00008000 00000080, %asi = 80
	stda	%f30,[%i0+0x000]%asi	! Mem[0000000010001400] = 00000045 6b8301d3
!	%l5 = 000000003ae000d7, Mem[0000000030141408] = 0c000000
	stha	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = 0c0000d7
!	Mem[0000000010001420] = 7e4ce136, %l2 = 0000000000000000
	swap	[%i0+0x020],%l2		! %l2 = 000000007e4ce136
!	%f29 = ffff9b32, Mem[0000000030081410] = 0000005f
	sta	%f29,[%i2+%o5]0x81	! Mem[0000000030081410] = ffff9b32
!	%l5 = 000000003ae000d7, Mem[0000000010141424] = ffffc253
	stw	%l5,[%i5+0x024]		! Mem[0000000010141424] = 3ae000d7
!	Mem[0000000010101400] = 626429b5, %l2 = 000000007e4ce136
	swapa	[%i4+%g0]0x80,%l2	! %l2 = 00000000626429b5
!	%l4 = 000000000000005b, Mem[0000000030141400] = 771ff1ac
	stwa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000005b

p0_label_50:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 9920f43c0c0000d7, %l0 = 000000008dafffff
	ldxa	[%i5+%o4]0x89,%l0	! %l0 = 9920f43c0c0000d7
!	Mem[0000000010001410] = 22f36cd5, %l5 = 000000003ae000d7
	ldswa	[%i0+%o5]0x88,%l5	! %l5 = 0000000022f36cd5
!	%l6 = 00000000000000d4, imm = 000000000000042a, %l7 = 0000000000008000
	subc	%l6,0x42a,%l7		! %l7 = fffffffffffffcaa
!	Mem[0000000010101408] = 00000000, %l0 = 9920f43c0c0000d7
	lduwa	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = ff0000000000005b, %f22 = 22f36cd5 0000009c
	ldda	[%i5+%g0]0x89,%f22	! %f22 = ff000000 0000005b
!	Mem[0000000030041400] = ff83ae58, %l4 = 000000000000005b
	lduwa	[%i1+%g0]0x81,%l4	! %l4 = 00000000ff83ae58
!	Mem[0000000030101408] = 546460ff, %l3 = 000002d52a007290
	ldswa	[%i4+%o4]0x89,%l3	! %l3 = 00000000546460ff
!	Mem[0000000030041410] = 45a556591c3bc253, %l5 = 0000000022f36cd5
	ldxa	[%i1+%o5]0x89,%l5	! %l5 = 45a556591c3bc253
!	Mem[0000000030041400] = 58ae83ff, %l3 = 00000000546460ff
	ldsba	[%i1+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181428] = 0cf4006b382072b7, %l2 = 00000000626429b5, %asi = 80
	ldxa	[%i6+0x028]%asi,%l2	! %l2 = 0cf4006b382072b7

p0_label_51:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081405] = ebffa24f, %l0 = 0000000000000000
	ldstuba	[%i2+0x005]%asi,%l0	! %l0 = 00000000000000ff
!	%l6 = 00000000000000d4, Mem[00000000100c1410] = 26560000
	stha	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00d40000
!	Mem[0000000030141408] = d700000c, %l3 = ffffffffffffffff
	ldstuba	[%i5+%o4]0x81,%l3	! %l3 = 00000000000000d7
!	Mem[0000000010081401] = 00000000, %l2 = 0cf4006b382072b7
	ldstuba	[%i2+0x001]%asi,%l2	! %l2 = 0000000000000000
!	%l7 = fffffffffffffcaa, Mem[0000000010101408] = 00000000f2450f74
	stxa	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = fffffffffffffcaa
!	%l7 = fffffffffffffcaa, Mem[0000000010101408] = ffffffff
	stwa	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = fffffcaa
	membar	#Sync			! Added by membar checker (9)
!	%l6 = 00000000000000d4, Mem[0000000010081400] = 0000ff00
	stba	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000ffd4
!	%l6 = 000000d4, %l7 = fffffcaa, Mem[00000000300c1400] = fffff322 8dafffff
	stda	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000d4 fffffcaa
!	%l2 = 00000000, %l3 = 000000d7, Mem[0000000030081408] = 0000589c 195cd712
	stda	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000 000000d7
!	%l7 = fffffffffffffcaa, Mem[0000000020800040] = ffcbe0c8, %asi = 80
	stha	%l7,[%o1+0x040]%asi	! Mem[0000000020800040] = fcaae0c8

p0_label_52:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 0000ffd4, %f26 = 57196f2c
	lda	[%i2+%g0]0x88,%f26	! %f26 = 0000ffd4
!	Mem[0000000010041408] = d4000000, %l4 = 00000000ff83ae58
	lduwa	[%i1+%o4]0x88,%l4	! %l4 = 00000000d4000000
!	Mem[0000000010041408] = 000000d4, %l3 = 00000000000000d7
	ldswa	[%i1+%o4]0x80,%l3	! %l3 = 00000000000000d4
	membar	#Sync			! Added by membar checker (10)
!	Mem[00000000300c1400] = d4000000 aafcffff 00000000 16eb6232
!	Mem[00000000300c1410] = 22eb3781 6b087f05 7f0f5be2 7f79972b
!	Mem[00000000300c1420] = 5441c3b0 51262701 320b366e 44a20007
!	Mem[00000000300c1430] = 64df4f9c 655b1fbd 4c57a6ba 53600fa3
	ldda	[%i3+%g0]ASI_BLK_AIUSL,%f0 	! Block Load from 00000000300c1400
!	Mem[00000000300c1410] = 22eb37816b087f05, %l2 = 0000000000000000
	ldxa	[%i3+%o5]0x81,%l2	! %l2 = 22eb37816b087f05
!	%l0 = 00000000000000ff, imm = 00000000000003fd, %l0 = 00000000000000ff
	addc	%l0,0x3fd,%l0		! %l0 = 00000000000004fc
!	Mem[0000000030041408] = ffffc253, %l3 = 00000000000000d4
	ldswa	[%i1+%o4]0x89,%l3	! %l3 = ffffffffffffc253
!	Mem[0000000010181400] = 45000000, %l4 = 00000000d4000000
	ldswa	[%i6+%g0]0x80,%l4	! %l4 = 0000000045000000
!	Mem[0000000010081400] = d4ff0000ebffa24f, %l4 = 0000000045000000
	ldxa	[%i2+%g0]0x80,%l4	! %l4 = d4ff0000ebffa24f
!	Mem[0000000010001400] = 45000000, %l6 = 00000000000000d4
	lduwa	[%i0+%g0]0x88,%l6	! %l6 = 0000000045000000

p0_label_53:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 7b7fff04, %l1 = 000000002b921695
	swapa	[%i5+%o4]0x88,%l1	! %l1 = 000000007b7fff04
!	Code Fragment 3, seed = 554138
p0_fragment_4:
!	%l0 = 00000000000004fc
	setx	0xf7d10a254e0d8d56,%g7,%l0 ! %l0 = f7d10a254e0d8d56
!	%l1 = 000000007b7fff04
	setx	0x8b69d5c729a37a81,%g7,%l1 ! %l1 = 8b69d5c729a37a81
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f7d10a254e0d8d56
	setx	0x544ad99a59bd7bbc,%g7,%l0 ! %l0 = 544ad99a59bd7bbc
!	%l1 = 8b69d5c729a37a81
	setx	0x1e8778dc17bc9407,%g7,%l1 ! %l1 = 1e8778dc17bc9407
p0_fragment_4_end:
!	%f16 = b5000000 1c3bc253, Mem[0000000030041400] = ff83ae58 28819e09
	stda	%f16,[%i1+%g0]0x81	! Mem[0000000030041400] = b5000000 1c3bc253
!	%l0 = 544ad99a59bd7bbc, Mem[00000000211c0000] = ff52b4f8, %asi = 80
	stba	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = bc52b4f8
!	%f7  = e25b0f7f, %f15 = baa6574c, %f22 = ff000000
	fdivs	%f7 ,%f15,%f22		! %f22 = 67289160
!	Code Fragment 3, seed = 437368
p0_fragment_5:
!	%l0 = 544ad99a59bd7bbc
	setx	0x165ac70511700c66,%g7,%l0 ! %l0 = 165ac70511700c66
!	%l1 = 1e8778dc17bc9407
	setx	0x74304a6920b70c91,%g7,%l1 ! %l1 = 74304a6920b70c91
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 165ac70511700c66
	setx	0x3add4d36d971b0cc,%g7,%l0 ! %l0 = 3add4d36d971b0cc
!	%l1 = 74304a6920b70c91
	setx	0x884d3391c52bfc17,%g7,%l1 ! %l1 = 884d3391c52bfc17
p0_fragment_5_end:
!	%l2 = 22eb37816b087f05, immd = 0000000000000b29, %l3  = ffffffffffffc253
	mulx	%l2,0xb29,%l3		! %l3 = b30e735381d18ecd
!	Mem[0000000010001408] = 1c3bc253, %l5 = 000000001c3bc253
	swapa	[%i0+%o4]0x88,%l5	! %l5 = 000000001c3bc253
!	Mem[0000000010041400] = 000000df, %l2 = 22eb37816b087f05
	ldstuba	[%i1+%g0]0x88,%l2	! %l2 = 00000000000000df
!	Mem[00000000218000c1] = 6affddb8, %l1 = 884d3391c52bfc17
	ldstuba	[%o3+0x0c1]%asi,%l1	! %l1 = 00000000000000ff

p0_label_54:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 22f36cd5, %l2 = 00000000000000df
	ldswa	[%i2+%o4]0x80,%l2	! %l2 = 0000000022f36cd5
!	Mem[000000001000143e] = d56cf322, %l7 = fffffffffffffcaa
	lduh	[%i0+0x03e],%l7		! %l7 = 000000000000f322
!	Mem[0000000030181408] = 22f36cd5, %l7 = 000000000000f322
	ldswa	[%i6+%o4]0x89,%l7	! %l7 = 0000000022f36cd5
!	Code Fragment 4, seed = 990203
p0_fragment_6:
!	%l0 = 3add4d36d971b0cc
	setx	0xece9b9bd23e2834e,%g7,%l0 ! %l0 = ece9b9bd23e2834e
!	%l1 = 00000000000000ff
	setx	0xe68d2eeb7317eef9,%g7,%l1 ! %l1 = e68d2eeb7317eef9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = ece9b9bd23e2834e
	setx	0x0be0f660d97b26b4,%g7,%l0 ! %l0 = 0be0f660d97b26b4
!	%l1 = e68d2eeb7317eef9
	setx	0x92175ca39c9fad7f,%g7,%l1 ! %l1 = 92175ca39c9fad7f
p0_fragment_6_end:
!	Mem[0000000010081424] = 00000000, %f1  = 000000d4
	lda	[%i2+0x024]%asi,%f1 	! %f1 = 00000000
!	Mem[0000000030181410] = 813700d4, %l5 = 000000001c3bc253
	lduwa	[%i6+%o5]0x89,%l5	! %l5 = 00000000813700d4
!	Mem[0000000030001410] = 00000000 00000032, %l2 = 22f36cd5, %l3 = 81d18ecd
	ldda	[%i0+%o5]0x81,%l2	! %l2 = 0000000000000000 0000000000000032
!	%f15 = baa6574c, %f25 = 771ff1ac, %f6  = 2b97797f
	fadds	%f15,%f25,%f6 		! %f6  = 771ff1ac
!	Mem[0000000030081400] = 53c23bff, %l0 = 0be0f660d97b26b4
	lduha	[%i2+%g0]0x89,%l0	! %l0 = 0000000000003bff
!	Mem[0000000030001408] = 000000df, %l5 = 00000000813700d4
	ldsba	[%i0+%o4]0x89,%l5	! %l5 = ffffffffffffffdf

p0_label_55:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081428] = 57196f2c, %l3 = 0000000000000032
	swap	[%i2+0x028],%l3		! %l3 = 0000000057196f2c
!	Mem[0000000010081400] = d4ff0000ebffa24f, %l7 = 0000000022f36cd5, %l6 = 0000000045000000
	casxa	[%i2]0x80,%l7,%l6	! %l6 = d4ff0000ebffa24f
!	Mem[0000000010001400] = 00000045 6b8301d3 53c23b1c acf11f77
!	%f16 = b5000000 1c3bc253 5f606454 323cbfda
!	%f20 = 000000b5 00000080 67289160 0000005b
!	%f24 = 7e4ce136 771ff1ac 0000ffd4 fe6fee6b
!	%f28 = 00000000 ffff9b32 00000045 6b8301d3
	stda	%f16,[%i0+%g0]ASI_COMMIT_P	! Block Store to 0000000010001400
!	%f23 = 0000005b, Mem[0000000010181410] = 80000000
	sta	%f23,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000005b
!	%l5 = ffffffffffffffdf, Mem[0000000010101400] = 7e4ce136
	stwa	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = ffffffdf
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010001408] = 5464605f, %l1 = 000000009c9fad7f
	swapa	[%i0+%o4]0x88,%l1	! %l1 = 000000005464605f
!	Code Fragment 4, seed = 130342
p0_fragment_7:
!	%l0 = 0000000000003bff
	setx	0x3eec9d989f6b94f6,%g7,%l0 ! %l0 = 3eec9d989f6b94f6
!	%l1 = 000000005464605f
	setx	0xfdcc8e3b9af37021,%g7,%l1 ! %l1 = fdcc8e3b9af37021
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3eec9d989f6b94f6
	setx	0xf9f095ba4173ff5c,%g7,%l0 ! %l0 = f9f095ba4173ff5c
!	%l1 = fdcc8e3b9af37021
	setx	0x130ae6da96ac45a7,%g7,%l1 ! %l1 = 130ae6da96ac45a7
p0_fragment_7_end:
!	%l5 = ffffffffffffffdf, Mem[0000000010081410] = 000000b500000080, %asi = 80
	stxa	%l5,[%i2+0x010]%asi	! Mem[0000000010081410] = ffffffffffffffdf
!	%f4  = 057f086b 8137eb22, Mem[00000000100c1408] = 39c14539 00000045
	stda	%f4 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 057f086b 8137eb22
!	%l0 = 4173ff5c, %l1 = 96ac45a7, Mem[00000000300c1410] = 8137eb22 057f086b
	stda	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 4173ff5c 96ac45a7

p0_label_56:
!	Starting 10 instruction Load Burst
!	%l2 = 0000000000000000, imm = fffffffffffffafe, %l6 = d4ff0000ebffa24f
	addc	%l2,-0x502,%l6		! %l6 = fffffffffffffafe
!	Mem[0000000030001400] = 80ffffff, %l6 = fffffffffffffafe
	lduha	[%i0+%g0]0x89,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030101400] = 26560000, %l0 = f9f095ba4173ff5c
	ldswa	[%i4+%g0]0x89,%l0	! %l0 = 0000000026560000
!	Mem[0000000010141420] = 0000ff523ae000d7, %f4  = 057f086b 8137eb22
	ldd	[%i5+0x020],%f4 	! %f4  = 0000ff52 3ae000d7
!	Mem[0000000010101418] = 635b0442 5298031b, %l6 = 0000ffff, %l7 = 22f36cd5
	ldd	[%i4+0x018],%l6		! %l6 = 00000000635b0442 000000005298031b
!	Mem[00000000201c0000] = c2532c68, %l7 = 000000005298031b, %asi = 80
	lduba	[%o0+0x000]%asi,%l7	! %l7 = 00000000000000c2
!	Mem[0000000030181410] = a52d544d813700d4, %l0 = 0000000026560000
	ldxa	[%i6+%o5]0x89,%l0	! %l0 = a52d544d813700d4
!	%l7 = 00000000000000c2, immd = fffff92f, %y  = 80000000
	smul	%l7,-0x6d1,%l5		! %l5 = fffffffffffad59e, %y = ffffffff
!	Mem[00000000100c1438] = 00000c6f242a89b3, %f0  = fffffcaa 00000000, %asi = 80
	ldda	[%i3+0x038]%asi,%f0 	! %f0  = 00000c6f 242a89b3
!	Mem[0000000010001400] = 000000b5, %l2 = 0000000000000000
	ldsba	[%i0+%g0]0x88,%l2	! %l2 = ffffffffffffffb5

p0_label_57:
!	Starting 10 instruction Store Burst
!	%l4 = ebffa24f, %l5 = fffad59e, Mem[0000000030001400] = ffffff80 00000078
	stda	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = ebffa24f fffad59e
!	%l3 = 0000000057196f2c, Mem[0000000030001410] = 00000000
	stha	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 6f2c0000
!	%l5 = fffffffffffad59e, Mem[0000000010081416] = ffffffdf
	sth	%l5,[%i2+0x016]		! Mem[0000000010081414] = ffffd59e
!	%l0 = 813700d4, %l1 = 96ac45a7, Mem[00000000100c1400] = 9c000000 d56cf322, %asi = 80
	stda	%l0,[%i3+0x000]%asi	! Mem[00000000100c1400] = 813700d4 96ac45a7
!	%f26 = 0000ffd4 fe6fee6b, Mem[0000000010141400] = ebffa24f 80000000
	stda	%f26,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000ffd4 fe6fee6b
!	%f12 = bd1f5b65 9c4fdf64, %l1 = 130ae6da96ac45a7
!	Mem[0000000030141430] = 75876c5c3a09d17d
	add	%i5,0x030,%g1
	stda	%f12,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030141430] = 64df4f5c3a5bd1bd
!	Mem[000000001004142c] = 2c6f1957, %l2 = 00000000ffffffb5, %asi = 80
	swapa	[%i1+0x02c]%asi,%l2	! %l2 = 000000002c6f1957
!	%f31 = 6b8301d3, Mem[0000000030001410] = 00002c6f
	sta	%f31,[%i0+%o5]0x89	! Mem[0000000030001410] = 6b8301d3
!	%l6 = 00000000635b0442, Mem[0000000010001400] = b5000000
	stba	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 42000000
!	%f4  = 0000ff52 3ae000d7, Mem[0000000010101410] = 80ffffff cb3362ff
	stda	%f4 ,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000ff52 3ae000d7

p0_label_58:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = fffffcaa, %l5 = fffffffffffad59e
	lduba	[%i4+%o4]0x88,%l5	! %l5 = 00000000000000aa
!	%f28 = 00000000 ffff9b32, %l4 = d4ff0000ebffa24f
!	Mem[0000000010181400] = 4500000000000000
	stda	%f28,[%i6+%l4]ASI_PST32_P ! Mem[0000000010181400] = 00000000ffff9b32
!	Mem[0000000010001418] = 672891600000005b, %l2 = 000000002c6f1957, %asi = 80
	ldxa	[%i0+0x018]%asi,%l2	! %l2 = 672891600000005b
!	Mem[0000000010081408] = d56cf322, %l5 = 00000000000000aa
	ldswa	[%i2+%o4]0x88,%l5	! %l5 = ffffffffd56cf322
!	Mem[0000000030081410] = 9920f43c329bffff, %l4 = d4ff0000ebffa24f
	ldxa	[%i2+%o5]0x89,%l4	! %l4 = 9920f43c329bffff
!	Mem[0000000030081400] = ff3bc253 323cbfda, %l2 = 0000005b, %l3 = 57196f2c
	ldda	[%i2+%g0]0x81,%l2	! %l2 = 00000000ff3bc253 00000000323cbfda
!	Mem[0000000030181400] = 65806f0c, %l5 = ffffffffd56cf322
	lduha	[%i6+%g0]0x89,%l5	! %l5 = 0000000000006f0c
!	Mem[0000000030081400] = ff3bc253, %l7 = 00000000000000c2
	lduba	[%i2+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141408] = 9920f43c0c0000ff, %l2 = 00000000ff3bc253
	ldxa	[%i5+%o4]0x89,%l2	! %l2 = 9920f43c0c0000ff
!	Mem[0000000030101410] = 00000000 00000000, %l0 = 813700d4, %l1 = 96ac45a7
	ldda	[%i4+%o5]0x81,%l0	! %l0 = 0000000000000000 0000000000000000

p0_label_59:
!	Starting 10 instruction Store Burst
!	%l2 = 0c0000ff, %l3 = 323cbfda, Mem[0000000010041428] = 6bee6ffe ffffffb5
	std	%l2,[%i1+0x028]		! Mem[0000000010041428] = 0c0000ff 323cbfda
!	%f2  = 3262eb16, Mem[0000000010141418] = 000003d6
	st	%f2 ,[%i5+0x018]	! Mem[0000000010141418] = 3262eb16
!	%l4 = 329bffff, %l5 = 00006f0c, Mem[0000000030081408] = 00000000 d7000000
	stda	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 329bffff 00006f0c
!	%l4 = 9920f43c329bffff, Mem[0000000021800000] = 782b8528
	stb	%l4,[%o3+%g0]		! Mem[0000000021800000] = ff2b8528
!	%f6  = 771ff1ac e25b0f7f, Mem[0000000010001410] = b5000000 80000000
	stda	%f6 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 771ff1ac e25b0f7f
!	%l6 = 00000000635b0442, Mem[00000000100c1408] = 6b087f05
	stwa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 635b0442
!	%f16 = b5000000, Mem[00000000300c1400] = d4000000
	sta	%f16,[%i3+%g0]0x81	! Mem[00000000300c1400] = b5000000
!	Mem[0000000030101400] = 00005626, %l6 = 00000000635b0442
	ldstuba	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%l5 = 0000000000006f0c, Mem[00000000100c1408] = 22eb3781635b0442
	stxa	%l5,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000000000006f0c
!	Mem[0000000030001408] = df000000, %l3 = 00000000323cbfda
	swapa	[%i0+%o4]0x81,%l3	! %l3 = 00000000df000000

p0_label_60:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00800000 2b921695, %l2 = 0c0000ff, %l3 = df000000
	ldda	[%i5+%o4]0x88,%l2	! %l2 = 000000002b921695 0000000000800000
!	Mem[0000000010081408] = 22f36cd5, %l7 = 00000000000000ff
	ldswa	[%i2+%o4]0x80,%l7	! %l7 = 0000000022f36cd5
!	Mem[0000000010081400] = 4fa2ffeb 0000ffd4, %l4 = 329bffff, %l5 = 00006f0c
	ldda	[%i2+%g0]0x88,%l4	! %l4 = 000000000000ffd4 000000004fa2ffeb
!	Mem[0000000010181410] = 5b000000, %l2 = 000000002b921695
	ldswa	[%i6+%o5]0x88,%l2	! %l2 = 000000005b000000
!	Mem[0000000030001408] = dabf3c32, %l0 = 0000000000000000
	lduwa	[%i0+%o4]0x89,%l0	! %l0 = 00000000dabf3c32
!	Mem[0000000010141400] = fe6fee6b, %l0 = 00000000dabf3c32
	lduwa	[%i5+%g0]0x88,%l0	! %l0 = 00000000fe6fee6b
!	Mem[0000000010001400] = 00000042, %l1 = 0000000000000000
	lduwa	[%i0+%g0]0x88,%l1	! %l1 = 0000000000000042
!	Mem[0000000010141408] = 9516922b 00008000, %l2 = 5b000000, %l3 = 00800000
	ldda	[%i5+%o4]0x80,%l2	! %l2 = 000000009516922b 0000000000008000
!	Mem[0000000010181407] = ffff9b32, %l6 = 0000000000000000
	ldstuba	[%i6+0x007]%asi,%l6	! %l6 = 0000000000000032
!	Mem[0000000010141408] = 9516922b, %l4 = 000000000000ffd4
	lduba	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000095

p0_label_61:
!	Starting 10 instruction Store Burst
!	%f0  = 00000c6f, Mem[0000000030041408] = ffffc253
	sta	%f0 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000c6f
!	%l4 = 00000095, %l5 = 4fa2ffeb, Mem[0000000010141410] = 0000009c 5580e554
	stda	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000095 4fa2ffeb
!	%f14 = a30f6053, Mem[0000000030141410] = 36a5a444
	sta	%f14,[%i5+%o5]0x81	! Mem[0000000030141410] = a30f6053
!	Mem[0000000010181408] = bdd89c52, %l1 = 0000000000000042
	swapa	[%i6+%o4]0x80,%l1	! %l1 = 00000000bdd89c52
!	%l4 = 00000095, %l5 = 4fa2ffeb, Mem[0000000010181410] = 5b000000 0a781011
	stda	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000095 4fa2ffeb
!	%f10 = 0700a244 6e360b32, %l1 = 00000000bdd89c52
!	Mem[0000000010141418] = 3262eb16ff884efb
	add	%i5,0x018,%g1
	stda	%f10,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010141418] = 3262366eff884efb
!	Mem[0000000010001420] = 7e4ce136, %l0 = 00000000fe6fee6b
	swap	[%i0+0x020],%l0		! %l0 = 000000007e4ce136
!	%l6 = 0000000000000032, Mem[0000000010081400] = d4ff0000
	stba	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 32ff0000
!	Mem[0000000030181408] = 22f36cd5, %l5 = 000000004fa2ffeb
	ldstuba	[%i6+%o4]0x89,%l5	! %l5 = 00000000000000d5
!	%l7 = 0000000022f36cd5, Mem[0000000010101408] = fffffcaa
	stwa	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = 22f36cd5

p0_label_62:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = dfffffff, %l5 = 00000000000000d5
	lduha	[%i4+%g0]0x88,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010101420] = 734dd9e028964671, %l0 = 000000007e4ce136
	ldx	[%i4+0x020],%l0		! %l0 = 734dd9e028964671
!	Mem[00000000300c1400] = b5000000, %l4 = 0000000000000095
	ldsha	[%i3+%g0]0x81,%l4	! %l4 = ffffffffffffb500
!	Mem[0000000010181420] = dbff0442, %f0  = 00000c6f
	ld	[%i6+0x020],%f0 	! %f0 = dbff0442
!	Mem[0000000030081400] = ff3bc253, %l1 = 00000000bdd89c52
	ldsba	[%i2+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010101410] = 3ae000d7, %l3 = 0000000000008000
	ldswa	[%i4+%o5]0x88,%l3	! %l3 = 000000003ae000d7
!	Mem[0000000030141410] = a30f6053, %l7 = 0000000022f36cd5
	lduba	[%i5+%o5]0x81,%l7	! %l7 = 00000000000000a3
!	Mem[0000000010101408] = aafcffff 22f36cd5, %l0 = 28964671, %l1 = ffffffff
	ldda	[%i4+%o4]0x88,%l0	! %l0 = 0000000022f36cd5 00000000aafcffff
!	Mem[0000000010001400] = 42000000, %l2 = 000000009516922b
	ldsba	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000042
!	Mem[0000000010141400] = fe6fee6b, %l0 = 0000000022f36cd5
	ldsha	[%i5+%g0]0x88,%l0	! %l0 = ffffffffffffee6b

p0_label_63:
!	Starting 10 instruction Store Burst
!	%f4  = 0000ff52, Mem[0000000030141410] = 53600fa3
	sta	%f4 ,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000ff52
!	Mem[0000000010041400] = ff000000, %l0 = ffffffffffffee6b
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	%f14 = a30f6053, Mem[0000000030101410] = 00000000
	sta	%f14,[%i4+%o5]0x81	! Mem[0000000030101410] = a30f6053
!	%l4 = ffffffffffffb500, Mem[00000000201c0000] = c2532c68
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = b5002c68
!	Mem[0000000010041430] = 771ff1ac1effaf8d, %l1 = 00000000aafcffff, %l7 = 00000000000000a3
	add	%i1,0x30,%g1
	casxa	[%g1]0x80,%l1,%l7	! %l7 = 771ff1ac1effaf8d
!	Mem[0000000010041401] = ff000000, %l4 = ffffffffffffb500
	ldstuba	[%i1+0x001]%asi,%l4	! %l4 = 0000000000000000
!	%l0 = 00000000000000ff, Mem[00000000211c0000] = bc52b4f8
	stb	%l0,[%o2+%g0]		! Mem[00000000211c0000] = ff52b4f8
!	%f15 = baa6574c, %f19 = 323cbfda, %f31 = 6b8301d3
	fmuls	%f15,%f19,%f31		! %f31 = ad754989
!	Mem[0000000010141410] = 00000095, %l3 = 000000003ae000d7
	swapa	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000095
!	%f23 = 0000005b, Mem[0000000030041410] = 53c23b1c
	sta	%f23,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000005b

p0_label_64:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 0000005b, %l0 = 00000000000000ff
	lduwa	[%i5+%g0]0x89,%l0	! %l0 = 000000000000005b
!	Mem[000000001004142c] = 323cbfda, %l0 = 000000000000005b, %asi = 80
	ldswa	[%i1+0x02c]%asi,%l0	! %l0 = 00000000323cbfda
!	Mem[0000000010181438] = 0000342a 26d54153, %l6 = 00000032, %l7 = 1effaf8d
	ldd	[%i6+0x038],%l6		! %l6 = 000000000000342a 0000000026d54153
!	Mem[0000000010101410] = d700e03a, %l1 = 00000000aafcffff
	lduwa	[%i4+%o5]0x80,%l1	! %l1 = 00000000d700e03a
!	Mem[0000000020800000] = 00d40898, %l4 = 0000000000000000, %asi = 80
	lduha	[%o1+0x000]%asi,%l4	! %l4 = 00000000000000d4
!	Mem[0000000030181410] = 813700d4, %f22 = 67289160
	lda	[%i6+%o5]0x89,%f22	! %f22 = 813700d4
!	%f1  = 242a89b3, Mem[0000000010041408] = 000000d4
	sta	%f1 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 242a89b3
!	Mem[00000000100c1410] = 0000d400, %l3 = 0000000000000095
	ldsha	[%i3+%o5]0x88,%l3	! %l3 = ffffffffffffd400
!	Mem[0000000020800000] = 00d40898, %l6 = 000000000000342a, %asi = 80
	lduha	[%o1+0x000]%asi,%l6	! %l6 = 00000000000000d4
!	Code Fragment 4, seed = 799854
p0_fragment_8:
!	%l0 = 00000000323cbfda
	setx	0x43ab62c51a5ba2b6,%g7,%l0 ! %l0 = 43ab62c51a5ba2b6
!	%l1 = 00000000d700e03a
	setx	0xe199218dee4911e1,%g7,%l1 ! %l1 = e199218dee4911e1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 43ab62c51a5ba2b6
	setx	0xfe18f57f1ecaf51c,%g7,%l0 ! %l0 = fe18f57f1ecaf51c
!	%l1 = e199218dee4911e1
	setx	0x4e1442d4f7d44f67,%g7,%l1 ! %l1 = 4e1442d4f7d44f67
p0_fragment_8_end:

p0_label_65:
!	Starting 10 instruction Store Burst
!	%l0 = fe18f57f1ecaf51c, Mem[00000000100c1400] = d4003781
	stwa	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 1ecaf51c
!	%f14 = a30f6053, Mem[0000000030081410] = 329bffff
	sta	%f14,[%i2+%o5]0x89	! Mem[0000000030081410] = a30f6053
!	%l2 = 00000042, %l3 = ffffd400, Mem[0000000010181400] = 00000000 ff9bffff
	stda	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000042 ffffd400
!	%l0 = 1ecaf51c, %l1 = f7d44f67, Mem[00000000300c1410] = 5cff7341 a745ac96
	stda	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 1ecaf51c f7d44f67
!	Code Fragment 4, seed = 101784
p0_fragment_9:
!	%l0 = fe18f57f1ecaf51c
	setx	0x2470a13b03e42366,%g7,%l0 ! %l0 = 2470a13b03e42366
!	%l1 = 4e1442d4f7d44f67
	setx	0x3f13bb84abfb7391,%g7,%l1 ! %l1 = 3f13bb84abfb7391
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2470a13b03e42366
	setx	0x6a10c2d126d567cc,%g7,%l0 ! %l0 = 6a10c2d126d567cc
!	%l1 = 3f13bb84abfb7391
	setx	0x2e8a7e3128ce0317,%g7,%l1 ! %l1 = 2e8a7e3128ce0317
p0_fragment_9_end:
!	%f4  = 0000ff52 3ae000d7, %l3 = ffffffffffffd400
!	Mem[0000000030181430] = 3338e2bc7ec7f25d
	add	%i6,0x030,%g1
	stda	%f4,[%g1+%l3]ASI_PST32_S ! Mem[0000000030181430] = 3338e2bc7ec7f25d
!	%l0 = 6a10c2d126d567cc, Mem[0000000030181400] = 0c6f806518699869
	stxa	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 6a10c2d126d567cc
!	%f12 = bd1f5b65 9c4fdf64, Mem[0000000010141408] = 9516922b 00008000
	stda	%f12,[%i5+%o4]0x80	! Mem[0000000010141408] = bd1f5b65 9c4fdf64
!	%l0 = 6a10c2d126d567cc, Mem[00000000201c0000] = b5002c68, %asi = 80
	stba	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = cc002c68
!	%l7 = 0000000026d54153, Mem[0000000030001400] = ebffa24f
	stwa	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = 26d54153

p0_label_66:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = bd1f5b65, %f21 = 00000080
	lda	[%i5+%o4]0x80,%f21	! %f21 = bd1f5b65
!	Mem[00000000300c1410] = 1cf5ca1e, %l0 = 6a10c2d126d567cc
	lduha	[%i3+%o5]0x89,%l0	! %l0 = 000000000000ca1e
!	Mem[0000000030041410] = 0000005b, %l2 = 0000000000000042
	ldsha	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = d301836b 00000032, %l6 = 000000d4, %l7 = 26d54153
	ldda	[%i0+%o5]0x81,%l6	! %l6 = 00000000d301836b 0000000000000032
!	Mem[0000000030101408] = ff60645421fbf3af, %f30 = 00000045 ad754989
	ldda	[%i4+%o4]0x81,%f30	! %f30 = ff606454 21fbf3af
!	Mem[0000000010081400] = 32ff0000 ebffa24f, %l4 = 000000d4, %l5 = 0000ffff
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 0000000032ff0000 00000000ebffa24f
!	Mem[0000000030041408] = 6f0c0000, %l2 = 0000000000000000
	lduha	[%i1+%o4]0x81,%l2	! %l2 = 0000000000006f0c
!	Mem[0000000030001408] = dabf3c32, %l4 = 0000000032ff0000
	ldsha	[%i0+%o4]0x89,%l4	! %l4 = 0000000000003c32
!	Mem[0000000020800041] = fcaae0c8, %l2 = 0000000000006f0c
	ldsb	[%o1+0x041],%l2		! %l2 = ffffffffffffffaa
!	Mem[00000000300c1408] = 0000000016eb6232, %l4 = 0000000000003c32
	ldxa	[%i3+%o4]0x81,%l4	! %l4 = 0000000016eb6232

p0_label_67:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 32ff0000, %l6 = 00000000d301836b
	swapa	[%i2+%g0]0x80,%l6	! %l6 = 0000000032ff0000
!	%f6  = 771ff1ac, %f6  = 771ff1ac, %f18 = 5f606454 323cbfda
	fsmuld	%f6 ,%f6 ,%f18		! %f18 = 4dd8fb85 f352e400
!	%f5  = 3ae000d7, %f5  = 3ae000d7, %f11 = 6e360b32
	fdivs	%f5 ,%f5 ,%f11		! %f11 = 3f800000
!	%l0 = 000000000000ca1e, imm = 0000000000000b1d, %l0 = 000000000000ca1e
	sub	%l0,0xb1d,%l0		! %l0 = 000000000000bf01
!	%l2 = ffffffaa, %l3 = ffffd400, Mem[0000000010081410] = ffffffff 9ed5ffff
	stda	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = ffffffaa ffffd400
!	%f0  = dbff0442, Mem[0000000030041408] = 00000c6f
	sta	%f0 ,[%i1+%o4]0x89	! Mem[0000000030041408] = dbff0442
!	Mem[00000000300c1408] = 00000000, %l4 = 0000000016eb6232
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%l6 = 32ff0000, %l7 = 00000032, Mem[0000000010041400] = ffff0000 00000000
	stda	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 32ff0000 00000032
!	%f18 = 4dd8fb85 f352e400, %l0 = 000000000000bf01
!	Mem[0000000030081418] = 3103985242045bdb
	add	%i2,0x018,%g1
	stda	%f18,[%g1+%l0]ASI_PST8_S ! Mem[0000000030081418] = 3103985242045b00
!	%f8  = 01272651 b0c34154, %l0 = 000000000000bf01
!	Mem[00000000300c1400] = b5000000aafcffff
	stda	%f8,[%i3+%l0]ASI_PST8_SL ! Mem[00000000300c1400] = 54000000aafcffff

p0_label_68:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = bd1f5b65, %f23 = 0000005b
	lda	[%i5+%o4]0x80,%f23	! %f23 = bd1f5b65
!	Mem[0000000010101408] = d56cf322, %l7 = 0000000000000032
	lduba	[%i4+%o4]0x80,%l7	! %l7 = 00000000000000d5
!	Mem[0000000030181400] = 6a10c2d1, %l1 = 2e8a7e3128ce0317
	lduha	[%i6+%g0]0x81,%l1	! %l1 = 0000000000006a10
!	Mem[00000000100c1400] = 1cf5ca1e, %l4 = 0000000000000000
	ldswa	[%i3+%g0]0x80,%l4	! %l4 = 000000001cf5ca1e
!	Mem[0000000010101410] = d700e03a, %l7 = 00000000000000d5
	ldsba	[%i4+%o5]0x80,%l7	! %l7 = ffffffffffffffd7
!	Mem[0000000010001400] = 42000000, %l3 = ffffffffffffd400
	ldswa	[%i0+%g0]0x80,%l3	! %l3 = 0000000042000000
!	%l0 = 000000000000bf01, %l0 = 000000000000bf01, %y  = ffffffff
	udiv	%l0,%l0,%l4		! %l4 = 00000000ffffffff
	mov	%l0,%y			! %y = 0000bf01
!	Mem[0000000030181400] = cc67d526d1c2106a, %f0  = dbff0442 242a89b3
	ldda	[%i6+%g0]0x89,%f0 	! %f0  = cc67d526 d1c2106a
!	Mem[0000000010141408] = 655b1fbd, %l7 = ffffffffffffffd7
	lduwa	[%i5+%o4]0x88,%l7	! %l7 = 00000000655b1fbd
!	Mem[0000000010181410] = 95000000, %l7 = 00000000655b1fbd
	lduba	[%i6+%o5]0x80,%l7	! %l7 = 0000000000000095

p0_label_69:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000032ff0000, Mem[0000000010081400] = 6b8301d3
	stha	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 6b830000
!	Mem[0000000010101400] = ffffffdf, %l4 = 00000000ffffffff
	swapa	[%i4+%g0]0x80,%l4	! %l4 = 00000000ffffffdf
!	Mem[0000000030001408] = 323cbfda, %l4 = 00000000ffffffdf
	ldstuba	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000032
!	Mem[000000001014141c] = ff884efb, %l2 = 00000000ffffffaa, %asi = 80
	swapa	[%i5+0x01c]%asi,%l2	! %l2 = 00000000ff884efb
!	%l5 = 00000000ebffa24f, Mem[0000000030001410] = 6b8301d3
	stba	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 6b83014f
!	%l0 = 0000bf01, %l1 = 00006a10, Mem[0000000010141410] = 3ae000d7 4fa2ffeb
	stda	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000bf01 00006a10
!	%l7 = 0000000000000095, Mem[00000000300c1400] = 54000000
	stwa	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000095
!	%f22 = 813700d4 bd1f5b65, Mem[00000000300c1408] = 16eb6232 16eb6232
	stda	%f22,[%i3+%o4]0x81	! Mem[00000000300c1408] = 813700d4 bd1f5b65
!	Mem[00000000300c1410] = 1cf5ca1e, %l5 = 00000000ebffa24f
	ldstuba	[%i3+%o5]0x89,%l5	! %l5 = 000000000000001e
!	Mem[00000000211c0001] = ff52b4f8, %l1 = 0000000000006a10
	ldstub	[%o2+0x001],%l1		! %l1 = 0000000000000052

p0_label_70:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 0000836b, %l5 = 000000000000001e
	lduha	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Code Fragment 3, seed = 639609
p0_fragment_10:
!	%l0 = 000000000000bf01
	setx	0x2a0fc191a4322d5e,%g7,%l0 ! %l0 = 2a0fc191a4322d5e
!	%l1 = 0000000000000052
	setx	0x1950a8d9fb2cbc09,%g7,%l1 ! %l1 = 1950a8d9fb2cbc09
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2a0fc191a4322d5e
	setx	0xa444d5ba1f47a6c4,%g7,%l0 ! %l0 = a444d5ba1f47a6c4
!	%l1 = 1950a8d9fb2cbc09
	setx	0x722b0a8752d1708f,%g7,%l1 ! %l1 = 722b0a8752d1708f
p0_fragment_10_end:
!	Mem[00000000300c1408] = d4003781, %f20 = 000000b5
	lda	[%i3+%o4]0x89,%f20	! %f20 = d4003781
!	Mem[0000000030081408] = 329bffff00006f0c, %l5 = 0000000000000000
	ldxa	[%i2+%o4]0x81,%l5	! %l5 = 329bffff00006f0c
!	Mem[0000000010001424] = 771ff1ac, %l7 = 0000000000000095, %asi = 80
	ldsha	[%i0+0x024]%asi,%l7	! %l7 = 000000000000771f
!	Mem[0000000030041410] = 5b000000, %l2 = 00000000ff884efb
	lduwa	[%i1+%o5]0x89,%l2	! %l2 = 000000005b000000
!	Mem[0000000030141408] = ff00000c 3cf42099, %l6 = 32ff0000, %l7 = 0000771f
	ldda	[%i5+%o4]0x81,%l6	! %l6 = 00000000ff00000c 000000003cf42099
!	Mem[0000000010081400] = 0000836b ebffa24f, %l4 = 00000032, %l5 = 00006f0c
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 000000000000836b 00000000ebffa24f
!	Mem[0000000030181410] = 813700d4, %l4 = 000000000000836b
	ldsba	[%i6+%o5]0x89,%l4	! %l4 = ffffffffffffffd4
!	Mem[0000000030081410] = a30f6053, %l5 = 00000000ebffa24f
	ldswa	[%i2+%o5]0x89,%l5	! %l5 = ffffffffa30f6053

p0_label_71:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 53c23bff, %l0 = a444d5ba1f47a6c4
	ldstuba	[%i2+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141428] = 256bfd7e, %l5 = 00000000a30f6053, %asi = 80
	swapa	[%i5+0x028]%asi,%l5	! %l5 = 00000000256bfd7e
!	%f31 = 21fbf3af, Mem[0000000030081410] = 53600fa3
	sta	%f31,[%i2+%o5]0x81	! Mem[0000000030081410] = 21fbf3af
!	Mem[0000000010101420] = 734dd9e0, %l1 = 722b0a8752d1708f
	ldstuba	[%i4+0x020]%asi,%l1	! %l1 = 0000000000000073
!	%l7 = 000000003cf42099, Mem[00000000211c0000] = ffffb4f8, %asi = 80
	stba	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = 99ffb4f8
!	%l7 = 000000003cf42099, Mem[0000000030081410] = 21fbf3af
	stwa	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 3cf42099
!	%l0 = 000000ff, %l1 = 00000073, Mem[00000000100c1408] = 00006f0c 00000000
	stda	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff 00000073
!	%f6  = 771ff1ac, Mem[0000000030141410] = 52ff0000
	sta	%f6 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 771ff1ac
!	%l7 = 000000003cf42099, Mem[0000000010041410] = 000000ff
	stba	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000099
!	%l0 = 00000000000000ff, Mem[00000000100c1400] = 1ecaf51c
	stwa	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff

p0_label_72:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 01bf0000, %l3 = 0000000042000000
	ldswa	[%i5+%o5]0x80,%l3	! %l3 = 0000000001bf0000
!	Mem[00000000211c0001] = 99ffb4f8, %l2 = 000000005b000000
	ldsb	[%o2+0x001],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010181400] = 4200000000d4ffff, %l4 = ffffffffffffffd4
	ldxa	[%i6+%g0]0x80,%l4	! %l4 = 4200000000d4ffff
!	Mem[0000000010101410] = d700e03a, %f13 = 9c4fdf64
	lda	[%i4+%o5]0x80,%f13	! %f13 = d700e03a
!	Mem[0000000010001420] = fe6fee6b771ff1ac, %l2 = ffffffffffffffff, %asi = 80
	ldxa	[%i0+0x020]%asi,%l2	! %l2 = fe6fee6b771ff1ac
!	Mem[00000000300c1410] = 1cf5caff, %l0 = 00000000000000ff
	lduba	[%i3+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000201c0000] = cc002c68, %l2 = fe6fee6b771ff1ac, %asi = 80
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = ffffffffffffcc00
!	Mem[0000000010141408] = 655b1fbd, %l7 = 000000003cf42099
	ldsba	[%i5+%o4]0x88,%l7	! %l7 = ffffffffffffffbd
!	%f21 = bd1f5b65, %f17 = 1c3bc253
	fcmpes	%fcc2,%f21,%f17		! %fcc2 = 1
!	Mem[00000000100c1400] = a745ac96000000ff, %l6 = 00000000ff00000c
	ldxa	[%i3+%g0]0x88,%l6	! %l6 = a745ac96000000ff

p0_label_73:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000256bfd7e, Mem[0000000010101400] = 3945c139ffffffff
	stxa	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000256bfd7e
!	Mem[00000000211c0000] = 99ffb4f8, %l2 = ffffffffffffcc00
	ldstub	[%o2+%g0],%l2		! %l2 = 0000000000000099
!	%l0 = 00000000000000ff, Mem[000000001018142a] = 0cf4006b, %asi = 80
	stha	%l0,[%i6+0x02a]%asi	! Mem[0000000010181428] = 0cf400ff
!	%l4 = 4200000000d4ffff, %l4 = 4200000000d4ffff, %y  = 0000bf01
	umul	%l4,%l4,%l7		! %l7 = 0000b138fe560001, %y = 0000b138
!	Mem[0000000010101410] = d700e03a, %l7 = 00000000fe560001
	swap	[%i4+%o5],%l7		! %l7 = 00000000d700e03a
!	Mem[0000000030001400] = 26d54153 fffad59e ff3cbfda 1c3bc253
!	%f0  = cc67d526 d1c2106a 3262eb16 00000000
!	%f4  = 0000ff52 3ae000d7 771ff1ac e25b0f7f
!	%f8  = 01272651 b0c34154 0700a244 3f800000
!	%f12 = bd1f5b65 d700e03a a30f6053 baa6574c
	stda	%f0 ,[%i0+%g0]ASI_BLK_AIUS	! Block Store to 0000000030001400
!	Mem[0000000030081400] = 53c23bff, %l1 = 0000000000000073
	swapa	[%i2+%g0]0x89,%l1	! %l1 = 0000000053c23bff
!	%l5 = 00000000256bfd7e, Mem[0000000030001408] = 3262eb1600000000
	stxa	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000256bfd7e
!	%l2 = 0000000000000099, Mem[0000000030001410] = 0000ff52
	stha	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 0099ff52
!	%f12 = bd1f5b65 d700e03a, %l6 = a745ac96000000ff
!	Mem[0000000030181428] = 3e05008e3f1fcda7
	add	%i6,0x028,%g1
	stda	%f12,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030181428] = 3ae000d7655b1fbd

p0_label_74:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = bd1f5b65, %l1 = 0000000053c23bff
	ldswa	[%i5+%o4]0x80,%l1	! %l1 = ffffffffbd1f5b65
!	Mem[000000001010143d] = 32cac193, %l2 = 0000000000000099, %asi = 80
	ldsba	[%i4+0x03d]%asi,%l2	! %l2 = ffffffffffffffca
!	Mem[0000000010181408] = 00000042, %f21 = bd1f5b65
	lda	[%i6+%o4]0x80,%f21	! %f21 = 00000042
!	Mem[00000000100c1400] = a745ac96000000ff, %f20 = d4003781 00000042
	ldda	[%i3+%g0]0x88,%f20	! %f20 = a745ac96 000000ff
!	Mem[000000001004141c] = 04ff7f7b, %l7 = 00000000d700e03a, %asi = 80
	ldswa	[%i1+0x01c]%asi,%l7	! %l7 = 0000000004ff7f7b
!	Mem[0000000010181420] = dbff0442 52980331, %l4 = 00d4ffff, %l5 = 256bfd7e
	ldd	[%i6+0x020],%l4		! %l4 = 00000000dbff0442 0000000052980331
!	Mem[0000000010101410] = 0000ff52010056fe, %f16 = b5000000 1c3bc253
	ldda	[%i4+%o5]0x88,%f16	! %f16 = 0000ff52 010056fe
!	Mem[0000000010141410] = 0000bf01, %f18 = 4dd8fb85
	lda	[%i5+%o5]0x88,%f18	! %f18 = 0000bf01
!	Mem[0000000030041408] = ffffffff dbff0442, %l2 = ffffffca, %l3 = 01bf0000
	ldda	[%i1+%o4]0x89,%l2	! %l2 = 00000000dbff0442 00000000ffffffff
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000010001400] = 00000042, %f19 = f352e400
	lda	[%i0+%g0]0x88,%f19	! %f19 = 00000042

p0_label_75:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[0000000010101410] = 010056fe
	stba	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 010056ff
!	%l0 = 00000000000000ff, immd = fffff47c, %y  = 0000b138
	umul	%l0,-0xb84,%l6		! %l6 = 000000fefff48784, %y = 000000fe
!	Mem[0000000010041410] = 99000000, %l2 = 00000000dbff0442
	swapa	[%i1+%o5]0x80,%l2	! %l2 = 0000000099000000
!	%l2 = 99000000, %l3 = ffffffff, Mem[0000000030181408] = ff6cf322 3381a2af
	stda	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 99000000 ffffffff
!	%l4 = 00000000dbff0442, Mem[0000000030001408] = 00000000
	stha	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000442
!	%l4 = 00000000dbff0442, Mem[00000000300c1410] = 1cf5caff
	stwa	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = dbff0442
!	%l6 = 000000fefff48784, Mem[00000000100c1432] = 20515eff, %asi = 80
	stba	%l6,[%i3+0x032]%asi	! Mem[00000000100c1430] = 205184ff
!	Mem[0000000030001410] = 52ff9900, %l5 = 0000000052980331
	ldstuba	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000000
!	%f19 = 00000042, Mem[0000000030001408] = 00000442
	sta	%f19,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000042
!	%l0 = 00000000000000ff, Mem[0000000010141408] = bd1f5b65
	stwa	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000ff

p0_label_76:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 42000000, %l4 = 00000000dbff0442
	ldsba	[%i6+%g0]0x80,%l4	! %l4 = 0000000000000042
!	Mem[0000000030081408] = 329bffff, %l3 = 00000000ffffffff
	lduba	[%i2+%o4]0x81,%l3	! %l3 = 0000000000000032
!	Mem[0000000010001408] = dabf3c329c9fad7f, %f0  = cc67d526 d1c2106a
	ldda	[%i0+%o4]0x88,%f0 	! %f0  = dabf3c32 9c9fad7f
!	Mem[0000000030101408] = ff60645421fbf3af, %l2 = 0000000099000000
	ldxa	[%i4+%o4]0x81,%l2	! %l2 = ff60645421fbf3af
!	Mem[00000000201c0000] = cc002c68, %l6 = 000000fefff48784, %asi = 80
	lduba	[%o0+0x000]%asi,%l6	! %l6 = 00000000000000cc
!	Mem[0000000030041400] = 53c23b1c000000b5, %l1 = ffffffffbd1f5b65
	ldxa	[%i1+%g0]0x89,%l1	! %l1 = 53c23b1c000000b5
!	Mem[00000000300c1400] = 95000000, %f30 = ff606454
	lda	[%i3+%g0]0x89,%f30	! %f30 = 95000000
!	Mem[0000000030081400] = 00000073, %l0 = 00000000000000ff
	ldsha	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000073
!	Mem[0000000010101408] = d56cf322 fffffcaa, %l4 = 00000042, %l5 = 00000000
	ldda	[%i4+%o4]0x80,%l4	! %l4 = 00000000d56cf322 00000000fffffcaa
!	Mem[0000000030081408] = 329bffff, %l0 = 0000000000000073
	lduba	[%i2+%o4]0x81,%l0	! %l0 = 0000000000000032

p0_label_77:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000004ff7f7b, Mem[0000000030041410] = 0000005b5956a545
	stxa	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000000004ff7f7b
!	%f8  = 01272651 b0c34154, Mem[0000000010081410] = aaffffff 00d4ffff, %asi = 80
	stda	%f8 ,[%i2+0x010]%asi	! Mem[0000000010081410] = 01272651 b0c34154
!	Mem[0000000010001408] = 7fad9f9c, %l2 = ff60645421fbf3af
	ldstuba	[%i0+%o4]0x80,%l2	! %l2 = 000000000000007f
!	%l6 = 000000cc, %l7 = 04ff7f7b, Mem[0000000010141418] = 3262366e ffffffaa
	std	%l6,[%i5+0x018]		! Mem[0000000010141418] = 000000cc 04ff7f7b
!	%l5 = 00000000fffffcaa, Mem[00000000300c1400] = 00000095
	stha	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = fcaa0095
!	Mem[0000000010141400] = fe6fee6b, %l7 = 0000000004ff7f7b
	swapa	[%i5+%g0]0x88,%l7	! %l7 = 00000000fe6fee6b
!	Mem[0000000030001400] = cc67d526, %l7 = 00000000fe6fee6b
	ldstuba	[%i0+%g0]0x81,%l7	! %l7 = 00000000000000cc
!	Mem[00000000300c1400] = fcaa0095 aafcffff 813700d4 bd1f5b65
!	%f0  = dabf3c32 9c9fad7f 3262eb16 00000000
!	%f4  = 0000ff52 3ae000d7 771ff1ac e25b0f7f
!	%f8  = 01272651 b0c34154 0700a244 3f800000
!	%f12 = bd1f5b65 d700e03a a30f6053 baa6574c
	stda	%f0 ,[%i3+%g0]ASI_COMMIT_S	! Block Store to 00000000300c1400
!	%l7 = 00000000000000cc, Mem[0000000010101410] = ff560001
	stwa	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000cc
!	%l6 = 00000000000000cc, Mem[0000000020800040] = fcaae0c8, %asi = 80
	stha	%l6,[%o1+0x040]%asi	! Mem[0000000020800040] = 00cce0c8

p0_label_78:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = cc000000, %l5 = 00000000fffffcaa
	lduha	[%i4+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041408] = 242a89b3, %l4 = 00000000d56cf322
	lduha	[%i1+%o4]0x80,%l4	! %l4 = 000000000000242a
!	%l6 = 00000000000000cc, %l6 = 00000000000000cc, %l5 = 0000000000000000
	xnor	%l6,%l6,%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010181410] = 95000000, %l7 = 00000000000000cc
	lduba	[%i6+%o5]0x80,%l7	! %l7 = 0000000000000095
!	Mem[0000000010141400] = 7b7fff04d4ff0000, %l2 = 000000000000007f
	ldxa	[%i5+%g0]0x80,%l2	! %l2 = 7b7fff04d4ff0000
!	%f26 = 0000ffd4, %f26 = 0000ffd4, %f19 = 00000042
	fdivs	%f26,%f26,%f19		! tt=0x22, %l0 = 0000000000000054
!	Mem[00000000201c0000] = cc002c68, %l6 = 00000000000000cc, %asi = 80
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 000000000000cc00
!	Mem[0000000010001410] = 7f0f5be2 acf11f77, %l2 = d4ff0000, %l3 = 00000032, %asi = 80
	ldda	[%i0+0x010]%asi,%l2	! %l2 = 000000007f0f5be2 00000000acf11f77
!	Mem[0000000010001434] = ffff9b32, %l0 = 0000000000000054, %asi = 80
	ldswa	[%i0+0x034]%asi,%l0	! %l0 = ffffffffffff9b32
!	Mem[0000000030181408] = 00000099, %l7 = 0000000000000095
	lduwa	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000099

p0_label_79:
!	Starting 10 instruction Store Burst
!	Code Fragment 4, seed = 771443
p0_fragment_11:
!	%l0 = ffffffffffff9b32
	setx	0xdd4c77d231382f8e,%g7,%l0 ! %l0 = dd4c77d231382f8e
!	%l1 = 53c23b1c000000b5
	setx	0xaedcfffdf322e739,%g7,%l1 ! %l1 = aedcfffdf322e739
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = dd4c77d231382f8e
	setx	0x7c4b4cf47129aaf4,%g7,%l0 ! %l0 = 7c4b4cf47129aaf4
!	%l1 = aedcfffdf322e739
	setx	0x262428802a8bfdbf,%g7,%l1 ! %l1 = 262428802a8bfdbf
p0_fragment_11_end:
!	%l2 = 000000007f0f5be2, Mem[0000000010181408] = 00000042
	stwa	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 7f0f5be2
!	Mem[0000000030141408] = 0c0000ff, %l2 = 000000007f0f5be2
	swapa	[%i5+%o4]0x89,%l2	! %l2 = 000000000c0000ff
!	Mem[0000000030101408] = 546460ff, %l2 = 000000000c0000ff
	swapa	[%i4+%o4]0x89,%l2	! %l2 = 00000000546460ff
!	%l5 = ffffffffffffffff, imm = fffffffffffffa21, %l3 = 00000000acf11f77
	or	%l5,-0x5df,%l3		! %l3 = ffffffffffffffff
!	%f29 = ffff9b32, Mem[0000000030101400] = 265600ff
	sta	%f29,[%i4+%g0]0x89	! Mem[0000000030101400] = ffff9b32
!	%l3 = ffffffffffffffff, Mem[0000000030001408] = 00000042
	stha	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000ffff
!	%f12 = bd1f5b65 d700e03a, %l0 = 7c4b4cf47129aaf4
!	Mem[0000000030001420] = 01272651b0c34154
	add	%i0,0x020,%g1
	stda	%f12,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030001420] = 01272651b0c34154
!	Mem[0000000010081408] = 22f36cd5, %l2 = 00000000546460ff
	swapa	[%i2+%o4]0x80,%l2	! %l2 = 0000000022f36cd5
	membar	#Sync			! Added by membar checker (13)
!	%l7 = 0000000000000099, Mem[00000000100c1408] = ff000000
	stwa	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000099

p0_label_80:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ffff9b32, %l7 = 0000000000000099
	lduwa	[%i2+%o4]0x89,%l7	! %l7 = 00000000ffff9b32
!	Mem[0000000030081408] = ffff9b32, %l3 = ffffffffffffffff
	lduha	[%i2+%o4]0x89,%l3	! %l3 = 0000000000009b32
!	Mem[00000000201c0001] = cc002c68, %l5 = ffffffffffffffff, %asi = 80
	lduba	[%o0+0x001]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001410] = 7f0f5be2, %f1  = 9c9fad7f
	lda	[%i0+%o5]0x80,%f1 	! %f1 = 7f0f5be2
!	Mem[0000000010001430] = 00000000ffff9b32, %l0 = 7c4b4cf47129aaf4, %asi = 80
	ldxa	[%i0+0x030]%asi,%l0	! %l0 = 00000000ffff9b32
!	Mem[0000000010101438] = 7401f17432cac193, %l7 = 00000000ffff9b32
	ldx	[%i4+0x038],%l7		! %l7 = 7401f17432cac193
!	Mem[0000000010001408] = dabf3c329c9fadff, %l2 = 0000000022f36cd5
	ldxa	[%i0+%o4]0x88,%l2	! %l2 = dabf3c329c9fadff
!	Mem[0000000010101400] = 7efd6b25, %l1 = 262428802a8bfdbf
	lduwa	[%i4+%g0]0x80,%l1	! %l1 = 000000007efd6b25
!	Mem[0000000030041408] = 4204ffdb, %l1 = 000000007efd6b25
	ldsha	[%i1+%o4]0x81,%l1	! %l1 = 0000000000004204
!	Mem[0000000010001424] = 771ff1ac, %l2 = dabf3c329c9fadff
	lduw	[%i0+0x024],%l2		! %l2 = 00000000771ff1ac

p0_label_81:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010001408] = ffad9f9c
	stba	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 00ad9f9c
!	%f16 = 0000ff52 010056fe, Mem[0000000010101430] = 76dd7ccc 713a9a2d
	std	%f16,[%i4+0x030]	! Mem[0000000010101430] = 0000ff52 010056fe
!	Mem[0000000030001410] = 52ff99ff, %l6 = 000000000000cc00
	swapa	[%i0+%o5]0x89,%l6	! %l6 = 0000000052ff99ff
!	%l4 = 000000000000242a, Mem[0000000030081408] = 329bffff
	stha	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 242affff
!	Mem[00000000218000c1] = 6affddb8, %l7 = 7401f17432cac193
	ldstuba	[%o3+0x0c1]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001410] = 00cc0000, %l1 = 0000000000004204
	ldstuba	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%l0 = 00000000ffff9b32, Mem[0000000030141408] = 7f0f5be2
	stwa	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = ffff9b32
!	%f2  = 3262eb16 00000000, Mem[0000000030041400] = 000000b5 53c23b1c
	stda	%f2 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 3262eb16 00000000
!	%l5 = 0000000000000000, Mem[0000000030181400] = 6a10c2d126d567cc
	stxa	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000000000000
!	Mem[0000000020800041] = 00cce0c8, %l0 = 00000000ffff9b32
	ldstuba	[%o1+0x041]%asi,%l0	! %l0 = 00000000000000cc

p0_label_82:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001434] = ffff9b32, %f30 = 95000000
	lda	[%i0+0x034]%asi,%f30	! %f30 = ffff9b32
!	Mem[0000000030181410] = d40037814d542da5, %l0 = 00000000000000cc
	ldxa	[%i6+%o5]0x81,%l0	! %l0 = d40037814d542da5
!	Mem[0000000010041408] = b3892a24, %l7 = 00000000000000ff
	ldsba	[%i1+%o4]0x88,%l7	! %l7 = 0000000000000024
!	Mem[0000000010101408] = 22f36cd5, %l4 = 000000000000242a
	lduha	[%i4+%o4]0x88,%l4	! %l4 = 0000000000006cd5
!	Mem[00000000300c1408] = 3262eb16, %l6 = 0000000052ff99ff
	lduwa	[%i3+%o4]0x81,%l6	! %l6 = 000000003262eb16
!	Mem[00000000300c1410] = 0000ff52, %l2 = 00000000771ff1ac
	ldsha	[%i3+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = 546460ff, %l2 = 0000000000000000
	ldswa	[%i2+%o4]0x80,%l2	! %l2 = 00000000546460ff
!	Mem[0000000030101408] = 0c0000ff, %l0 = d40037814d542da5
	lduba	[%i4+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101408] = 0c0000ff, %l5 = 0000000000000000
	ldsba	[%i4+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030101410] = a30f6053, %l6 = 000000003262eb16
	ldswa	[%i4+%o5]0x81,%l6	! %l6 = ffffffffa30f6053

p0_label_83:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000546460ff, Mem[0000000010001408] = dabf3c329c9fad00
	stxa	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000546460ff
!	%f10 = 0700a244, Mem[0000000010141408] = 000000ff
	sta	%f10,[%i5+%o4]0x80	! Mem[0000000010141408] = 0700a244
!	Mem[0000000010101408] = d56cf322, %l4 = 0000000000006cd5
	swapa	[%i4+%o4]0x80,%l4	! %l4 = 00000000d56cf322
!	Mem[0000000010101400] = 256bfd7e, %l4 = 00000000d56cf322
	swapa	[%i4+%g0]0x88,%l4	! %l4 = 00000000256bfd7e
!	%f24 = 7e4ce136 771ff1ac, Mem[0000000030101408] = 0c0000ff aff3fb21
	stda	%f24,[%i4+%o4]0x89	! Mem[0000000030101408] = 7e4ce136 771ff1ac
!	%l6 = ffffffffa30f6053, Mem[0000000030101400] = 329bffff
	stba	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 539bffff
!	Mem[0000000010141400] = 04ff7f7b, %l7 = 0000000000000024
	ldstuba	[%i5+%g0]0x88,%l7	! %l7 = 000000000000007b
!	Mem[0000000030101408] = 771ff1ac, %l3 = 0000000000009b32
	swapa	[%i4+%o4]0x89,%l3	! %l3 = 00000000771ff1ac
!	%f16 = 0000ff52 010056fe, Mem[0000000030101408] = 00009b32 7e4ce136
	stda	%f16,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000ff52 010056fe
!	%f2  = 3262eb16, Mem[00000000300c1410] = 52ff0000
	sta	%f2 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = 3262eb16

p0_label_84:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 242a89b3, %l6 = ffffffffa30f6053
	ldsba	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000024
!	Mem[0000000010141410] = 01bf0000106a0000, %l7 = 000000000000007b
	ldxa	[%i5+%o5]0x80,%l7	! %l7 = 01bf0000106a0000
!	%l2 = 00000000546460ff, %l0 = 00000000000000ff, %y  = 000000fe
	umul	%l2,%l0,%l4		! %l4 = 000000540ffc9e01, %y = 00000054
!	Mem[0000000030101408] = 0000ff52 010056fe, %l4 = 0ffc9e01, %l5 = ffffffff
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 00000000010056fe 000000000000ff52
!	Mem[0000000030001400] = ff67d526d1c2106a, %l5 = 000000000000ff52
	ldxa	[%i0+%g0]0x81,%l5	! %l5 = ff67d526d1c2106a
!	Mem[0000000010001411] = 7f0f5be2, %l7 = 01bf0000106a0000
	ldsb	[%i0+0x011],%l7		! %l7 = 000000000000000f
!	Mem[0000000010181400] = ffffd40000000042, %f12 = bd1f5b65 d700e03a
	ldda	[%i6+%g0]0x88,%f12	! %f12 = ffffd400 00000042
!	Mem[00000000100c1408] = 00000099, %l1 = 0000000000000000, %asi = 80
	ldsha	[%i3+0x008]%asi,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1420] = 08055dbf02c21391, %l4 = 00000000010056fe, %asi = 80
	ldxa	[%i3+0x020]%asi,%l4	! %l4 = 08055dbf02c21391
!	Mem[0000000030101408] = 010056fe, %l5 = ff67d526d1c2106a
	lduba	[%i4+%o4]0x89,%l5	! %l5 = 00000000000000fe

p0_label_85:
!	Starting 10 instruction Store Burst
!	%l4 = 02c21391, %l5 = 000000fe, Mem[0000000030101408] = 010056fe 0000ff52
	stda	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 02c21391 000000fe
!	%f30 = ffff9b32 21fbf3af, Mem[0000000010001410] = e25b0f7f 771ff1ac
	stda	%f30,[%i0+%o5]0x88	! Mem[0000000010001410] = ffff9b32 21fbf3af
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000010101408] = 00006cd5 fffffcaa
	stda	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff 00000000
!	Mem[0000000010081428] = 00000032, %l3 = 00000000771ff1ac
	swap	[%i2+0x028],%l3		! %l3 = 0000000000000032
!	%l3 = 0000000000000032, Mem[0000000010141428] = a30f6053, %asi = 80
	stwa	%l3,[%i5+0x028]%asi	! Mem[0000000010141428] = 00000032
!	Mem[0000000030001408] = ffff0000, %l7 = 000000000000000f
	swapa	[%i0+%o4]0x81,%l7	! %l7 = 00000000ffff0000
!	Mem[0000000030101400] = 539bffff, %l1 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l1	! %l1 = 0000000000000053
!	%l5 = 00000000000000fe, Mem[000000001014140c] = 9c4fdf64
	stw	%l5,[%i5+0x00c]		! Mem[000000001014140c] = 000000fe
!	%l6 = 0000000000000024, Mem[0000000030181410] = d4003781
	stba	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 24003781
!	%l1 = 0000000000000053, Mem[0000000030041410] = 00000000
	stwa	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000053

p0_label_86:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 0000836bebffa24f, %f18 = 0000bf01 00000042
	ldda	[%i2+%g0]0x80,%f18	! %f18 = 0000836b ebffa24f
!	Mem[0000000010001400] = 00000042, %l4 = 08055dbf02c21391
	lduha	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000042
!	Mem[0000000010141408] = 0700a244 000000fe, %l4 = 00000042, %l5 = 000000fe, %asi = 80
	ldda	[%i5+0x008]%asi,%l4	! %l4 = 000000000700a244 00000000000000fe
!	Mem[0000000030141400] = 0000005b, %l1 = 0000000000000053
	lduba	[%i5+%g0]0x89,%l1	! %l1 = 000000000000005b
!	Mem[0000000010041410] = dbff0442ffffff80, %l0 = 00000000000000ff
	ldx	[%i1+%o5],%l0		! %l0 = dbff0442ffffff80
!	Mem[00000000100c1410] = 9516922b 0000d400, %l4 = 0700a244, %l5 = 000000fe
	ldda	[%i3+%o5]0x88,%l4	! %l4 = 000000000000d400 000000009516922b
!	Mem[0000000010041437] = 1effaf8d, %l6 = 0000000000000024
	ldsb	[%i1+0x037],%l6		! %l6 = ffffffffffffff8d
!	Mem[0000000030041400] = 00000000, %l6 = ffffffffffffff8d
	lduha	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%l3 = 0000000000000032, imm = fffffffffffff9ae, %l0 = dbff0442ffffff80
	xnor	%l3,-0x652,%l0		! %l0 = 0000000000000663
!	Mem[0000000010101410] = cc000000, %l3 = 0000000000000032
	lduwa	[%i4+%o5]0x88,%l3	! %l3 = 00000000cc000000

p0_label_87:
!	Starting 10 instruction Store Burst
!	%f2  = 3262eb16, %f12 = ffffd400, %f1  = 7f0f5be2
	fsubs	%f2 ,%f12,%f1 		! %f1  = ffffd400
!	%l4 = 0000d400, %l5 = 9516922b, Mem[0000000010081420] = 7e4ce136 00000000, %asi = 80
	stda	%l4,[%i2+0x020]%asi	! Mem[0000000010081420] = 0000d400 9516922b
!	%l3 = 00000000cc000000, Mem[0000000010001408] = ff606454
	stha	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 00006454
!	Mem[0000000010041400] = 32ff0000, %l1 = 000000000000005b
	swapa	[%i1+%g0]0x80,%l1	! %l1 = 0000000032ff0000
!	%l6 = 0000000000000000, Mem[0000000030181408] = 00000099
	stha	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	Mem[0000000010081400] = 0000836b, %l4 = 000000000000d400
	ldstuba	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000
!	%l7 = 00000000ffff0000, %l3 = 00000000cc000000, %y  = 00000054
	umul	%l7,%l3,%l5		! %l5 = cbff340000000000, %y = cbff3400
!	%f22 = 813700d4, Mem[0000000010001400] = 00000042
	sta	%f22,[%i0+%g0]0x88	! Mem[0000000010001400] = 813700d4
!	%l0 = 0000000000000663, Mem[0000000010141400] = 0000ffd404ff7fff
	stxa	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000000000000663
!	%l4 = 0000000000000000, Mem[0000000030181410] = 81370024
	stba	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 81370000

p0_label_88:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 320000005b000000, %l4 = 0000000000000000
	ldxa	[%i1+%g0]0x88,%l4	! %l4 = 320000005b000000
!	Mem[0000000030081408] = ffff2a24, %l2 = 00000000546460ff
	lduwa	[%i2+%o4]0x89,%l2	! %l2 = 00000000ffff2a24
!	Mem[0000000030001410] = ffcc0000 3ae000d7, %l0 = 00000663, %l1 = 32ff0000
	ldda	[%i0+%o5]0x81,%l0	! %l0 = 00000000ffcc0000 000000003ae000d7
!	Mem[0000000010041400] = 5b000000, %l3 = 00000000cc000000
	lduba	[%i1+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181408] = e25b0f7f, %l1 = 000000003ae000d7
	lduba	[%i6+%o4]0x88,%l1	! %l1 = 000000000000007f
!	Mem[00000000211c0000] = ffffb4f8, %l7 = 00000000ffff0000, %asi = 80
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030141400] = 5b000000, %l3 = 0000000000000000
	ldsha	[%i5+%g0]0x81,%l3	! %l3 = 0000000000005b00
!	Mem[0000000030041410] = 00000053, %l6 = 0000000000000000
	lduwa	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000053
!	Mem[0000000030101400] = ffff9bff, %l0 = 00000000ffcc0000
	ldsba	[%i4+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	%l2 = 00000000ffff2a24, Mem[00000000100c1400] = a745ac96000000ff
	stxa	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000ffff2a24

p0_label_89:
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffffffff, Mem[0000000010001420] = fe6fee6b771ff1ac
	stx	%l0,[%i0+0x020]		! Mem[0000000010001420] = ffffffffffffffff
!	%f14 = a30f6053 baa6574c, %l5 = cbff340000000000
!	Mem[0000000030081400] = 73000000323cbfda
	stda	%f14,[%i2+%l5]ASI_PST16_S ! Mem[0000000030081400] = 73000000323cbfda
!	%l5 = cbff340000000000, Mem[000000001014141e] = 04ff7f7b
	stb	%l5,[%i5+0x01e]		! Mem[000000001014141c] = 04ff007b
!	Mem[0000000030141400] = 5b000000, %l1 = 000000000000007f
	swapa	[%i5+%g0]0x81,%l1	! %l1 = 000000005b000000
!	%l5 = cbff340000000000, Mem[0000000010101408] = 000000ff
	stba	%l5,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff
!	Mem[0000000010181404] = 00d4ffff, %l6 = 00000053, %l7 = ffffffff
	add	%i6,0x04,%g1
	casa	[%g1]0x80,%l6,%l7	! %l7 = 0000000000d4ffff
!	%l6 = 0000000000000053, Mem[00000000100c1410] = 00d400002b921695
	stxa	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000000000000053
!	%f27 = fe6fee6b, %f22 = 813700d4, %f12 = ffffd400 00000042
	fsmuld	%f27,%f22,%f12		! %f12 = 40057086 a5ce1380
!	%l5 = cbff340000000000, Mem[00000000300c1408] = 3262eb1600000000
	stxa	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = cbff340000000000
!	%l2 = ffff2a24, %l3 = 00005b00, Mem[0000000030101410] = a30f6053 00000000
	stda	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = ffff2a24 00005b00

p0_label_90:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 000000000034ffcb, %f8  = 01272651 b0c34154
	ldda	[%i3+%o4]0x89,%f8 	! %f8  = 00000000 0034ffcb
!	Mem[0000000010101400] = 22f36cd5, %l3 = 0000000000005b00
	ldswa	[%i4+%g0]0x80,%l3	! %l3 = 0000000022f36cd5
!	Mem[00000000100c1410] = 00000000, %l0 = ffffffffffffffff
	ldswa	[%i3+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800000] = 00d40898, %l1 = 000000005b000000, %asi = 80
	lduha	[%o1+0x000]%asi,%l1	! %l1 = 00000000000000d4
!	Mem[0000000010181410] = 00000095, %f25 = 771ff1ac
	lda	[%i6+%o5]0x88,%f25	! %f25 = 00000095
!	Mem[0000000030141408] = 329bffff3cf42099, %f4  = 0000ff52 3ae000d7
	ldda	[%i5+%o4]0x81,%f4 	! %f4  = 329bffff 3cf42099
!	%f3  = 00000000, %f31 = 21fbf3af
	fcmpes	%fcc0,%f3 ,%f31		! %fcc0 = 1
!	Mem[0000000010141400] = 00000663, %l3 = 0000000022f36cd5
	ldsha	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000663
!	Mem[0000000030141408] = 329bffff, %l5 = cbff340000000000
	lduwa	[%i5+%o4]0x81,%l5	! %l5 = 00000000329bffff
!	Mem[0000000010141410] = 01bf0000, %l4 = 320000005b000000
	ldsha	[%i5+%o5]0x80,%l4	! %l4 = 00000000000001bf

p0_label_91:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = 5b000000, %l0 = 0000000000000000
	ldstuba	[%i1+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%l7 = 0000000000d4ffff, %l3 = 0000000000000663, %l4 = 00000000000001bf
	udivx	%l7,%l3,%l4		! %l4 = 0000000000002159
!	Mem[0000000010101434] = 010056fe, %l5 = 00000000329bffff
	ldstuba	[%i4+0x034]%asi,%l5	! %l5 = 0000000000000001
!	%l7 = 0000000000d4ffff, Mem[0000000010081410] = 01272651
	stwa	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = 00d4ffff
!	Mem[0000000010041408] = 242a89b3, %l3 = 0000000000000663
	ldstuba	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000024
!	%l2 = 00000000ffff2a24, Mem[0000000010101400] = d56cf322
	stba	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = d56cf324
!	%f8  = 00000000 0034ffcb, %l6 = 0000000000000053
!	Mem[0000000030101428] = 2c87a58e542cbea7
	add	%i4,0x028,%g1
	stda	%f8,[%g1+%l6]ASI_PST32_S ! Mem[0000000030101428] = 000000000034ffcb
!	%f14 = a30f6053 baa6574c, Mem[0000000030141400] = 0000007f 000000ff
	stda	%f14,[%i5+%g0]0x81	! Mem[0000000030141400] = a30f6053 baa6574c
!	%l0 = 0000000000000000, Mem[0000000010101410] = cc000000
	stwa	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	Mem[000000001008140b] = 546460ff, %l0 = 0000000000000000
	ldstuba	[%i2+0x00b]%asi,%l0	! %l0 = 00000000000000ff

p0_label_92:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = dbff0442, %l7 = 0000000000d4ffff
	ldsha	[%i1+%o5]0x80,%l7	! %l7 = ffffffffffffdbff
!	Mem[0000000010041400] = ff00005b, %l4 = 0000000000002159
	ldsha	[%i1+%g0]0x80,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000010001410] = aff3fb21, %f3  = 00000000
	lda	[%i0+%o5]0x80,%f3 	! %f3 = aff3fb21
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000030101400] = ff9bffff 00000000 9113c202 fe000000
!	Mem[0000000030101410] = ffff2a24 00005b00 75214102 1b6233cb
!	Mem[0000000030101420] = 44cd89d0 188080a1 00000000 0034ffcb
!	Mem[0000000030101430] = 6c9f1ac4 5956a545 243cbfda 263e9043
	ldda	[%i4+%g0]ASI_BLK_AIUS,%f16	! Block Load from 0000000030101400
!	Mem[0000000021800180] = 68731248, %l5 = 0000000000000001, %asi = 80
	lduha	[%o3+0x180]%asi,%l5	! %l5 = 0000000000006873
!	Mem[00000000201c0001] = cc002c68, %l1 = 00000000000000d4
	ldsb	[%o0+0x001],%l1		! %l1 = 0000000000000000
!	%l3 = 0000000000000024, %l3 = 0000000000000024, %l0 = 00000000000000ff
	andn	%l3,%l3,%l0		! %l0 = 0000000000000000
!	Mem[0000000010181400] = 4200000000d4ffff, %f12 = 40057086 a5ce1380, %asi = 80
	ldda	[%i6+0x000]%asi,%f12	! %f12 = 42000000 00d4ffff
!	%l7 = ffffffffffffdbff, Mem[0000000030081410] = 9920f43c
	stha	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 9920dbff
!	Mem[000000001004140c] = 1c3bc253, %l7 = ffffffffffffdbff
	ldstub	[%i1+0x00c],%l7		! %l7 = 000000000000001c

p0_label_93:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010001400] = d4003781, %asi = 80
	stha	%l1,[%i0+0x000]%asi	! Mem[0000000010001400] = 00003781
!	Mem[0000000010081410] = 00d4ffff, %l4 = ffffffffffffff00
	ldstuba	[%i2+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1408] = 99000000, %l0 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l0	! %l0 = 0000000099000000
!	%l2 = 00000000ffff2a24, Mem[0000000030041410] = 53000000
	stba	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 53000024
!	%l0 = 0000000099000000, Mem[0000000021800080] = 74d71988
	stb	%l0,[%o3+0x080]		! Mem[0000000021800080] = 00d71988
!	%f4  = 329bffff 3cf42099, %l1 = 0000000000000000
!	Mem[0000000030081400] = 73000000323cbfda
	stda	%f4,[%i2+%l1]ASI_PST16_S ! Mem[0000000030081400] = 73000000323cbfda
!	%f22 = 75214102 1b6233cb, Mem[0000000010101408] = 000000ff 00000000
	stda	%f22,[%i4+%o4]0x80	! Mem[0000000010101408] = 75214102 1b6233cb
!	%l3 = 0000000000000024, Mem[0000000030001410] = ffcc0000
	stba	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 24cc0000
!	%f4  = 329bffff, Mem[0000000010081408] = 546460ff
	sta	%f4 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 329bffff
!	Mem[00000000201c0001] = cc002c68, %l1 = 0000000000000000
	ldstub	[%o0+0x001],%l1		! %l1 = 0000000000000000

p0_label_94:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ff9bffff, %l6 = 0000000000000053
	lduba	[%i4+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141400] = 6306000000000000, %l7 = 000000000000001c
	ldxa	[%i5+%g0]0x80,%l7	! %l7 = 6306000000000000
!	Mem[0000000010001402] = 00003781, %l2 = 00000000ffff2a24
	lduh	[%i0+0x002],%l2		! %l2 = 0000000000003781
!	Mem[0000000010141408] = 0700a244, %l1 = 0000000000000000
	ldsha	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000700
!	Mem[00000000300c1408] = 0034ffcb, %l5 = 0000000000006873
	lduha	[%i3+%o4]0x89,%l5	! %l5 = 000000000000ffcb
!	Mem[0000000030081410] = ffdb2099, %l1 = 0000000000000700
	lduha	[%i2+%o5]0x81,%l1	! %l1 = 000000000000ffdb
!	Mem[00000000100c140b] = 00000000, %l3 = 0000000000000024, %asi = 80
	lduba	[%i3+0x00b]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800040] = 00ffe0c8, %l5 = 000000000000ffcb, %asi = 80
	ldsba	[%o1+0x040]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = dabf3c32 9c9fad7f cbff3400 00000000
!	Mem[00000000300c1410] = 16eb6232 3ae000d7 771ff1ac e25b0f7f
!	Mem[00000000300c1420] = 01272651 b0c34154 0700a244 3f800000
!	Mem[00000000300c1430] = bd1f5b65 d700e03a a30f6053 baa6574c
	ldda	[%i3+%g0]ASI_BLK_AIUS,%f0 	! Block Load from 00000000300c1400
!	Mem[0000000030141400] = 53600fa3, %f31 = 263e9043
	lda	[%i5+%g0]0x89,%f31	! %f31 = 53600fa3

p0_label_95:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (15)
!	%l2 = 00003781, %l3 = 00000000, Mem[0000000030101410] = ffff2a24 00005b00
	stda	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 00003781 00000000
!	%l1 = 000000000000ffdb, Mem[000000001014143e] = 199ba973, %asi = 80
	stha	%l1,[%i5+0x03e]%asi	! Mem[000000001014143c] = 199bffdb
!	Mem[0000000030001410] = 0000cc24, %l7 = 6306000000000000
	ldstuba	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000024
!	%l6 = 00000000000000ff, Mem[0000000030141410] = acf11f77
	stwa	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000ff
!	Mem[0000000010041400] = ff00005b, %l4 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081408] = 329bffff, %l7 = 0000000000000024
	ldstuba	[%i2+%o4]0x80,%l7	! %l7 = 0000000000000032
!	Mem[0000000010141400] = 00000663, %l3 = 0000000000000000
	ldstuba	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000063
!	Mem[0000000010041408] = ff2a89b3, %l4 = 00000000000000ff
	ldstuba	[%i1+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181400] = 42000000, %l0 = 0000000099000000
	ldstuba	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000042
!	%l6 = 00000000000000ff, Mem[0000000010081400] = ff00836b
	stwa	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff

p0_label_96:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041420] = 0000000000000045, %l2 = 0000000000003781
	ldx	[%i1+0x020],%l2		! %l2 = 0000000000000045
!	Mem[0000000030141408] = 329bffff, %l6 = 00000000000000ff
	lduwa	[%i5+%o4]0x81,%l6	! %l6 = 00000000329bffff
!	Mem[0000000010041418] = 5e87b072, %l4 = 00000000000000ff, %asi = 80
	lduwa	[%i1+0x018]%asi,%l4	! %l4 = 000000005e87b072
!	Mem[00000000300c1408] = cbff3400, %l0 = 0000000000000042
	ldsba	[%i3+%o4]0x81,%l0	! %l0 = ffffffffffffffcb
!	Mem[0000000030001408] = 0000000f, %l3 = 0000000000000063
	ldsha	[%i0+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041408] = dbff0442, %l4 = 000000005e87b072
	lduba	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000042
!	Mem[0000000010041408] = ff2a89b3ff3bc253, %l2 = 0000000000000045
	ldxa	[%i1+%o4]0x80,%l2	! %l2 = ff2a89b3ff3bc253
!	Mem[000000001018141c] = 0036ff80, %l2 = ff2a89b3ff3bc253, %asi = 80
	ldswa	[%i6+0x01c]%asi,%l2	! %l2 = 000000000036ff80
!	Mem[0000000010081408] = 771ff1ac ffff9bff, %l4 = 00000042, %l5 = 00000000
	ldda	[%i2+%o4]0x88,%l4	! %l4 = 00000000ffff9bff 00000000771ff1ac
!	Mem[0000000030081400] = 73000000, %l3 = 0000000000000000
	ldsha	[%i2+%g0]0x81,%l3	! %l3 = 0000000000007300

p0_label_97:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000329bffff, Mem[0000000010101408] = 02412175
	stwa	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 329bffff
!	%l2 = 000000000036ff80, Mem[0000000010141410] = 0000bf01
	stwa	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = 0036ff80
!	Mem[0000000030101410] = 81370000, %l1 = 000000000000ffdb
	swapa	[%i4+%o5]0x89,%l1	! %l1 = 0000000081370000
!	%f31 = 53600fa3, Mem[0000000010001410] = aff3fb21
	sta	%f31,[%i0+%o5]0x80	! Mem[0000000010001410] = 53600fa3
!	%l2 = 0036ff80, %l3 = 00007300, Mem[0000000030081410] = ffdb2099 3cf42099
	stda	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 0036ff80 00007300
!	%l2 = 0036ff80, %l3 = 00007300, Mem[0000000010101400] = 24f36cd5 00000000
	stda	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 0036ff80 00007300
!	Mem[000000001008143c] = d56cf322, %l1 = 81370000, %l1 = 81370000
	add	%i2,0x3c,%g1
	casa	[%g1]0x80,%l1,%l1	! %l1 = 00000000d56cf322
!	%f5  = 3ae000d7, Mem[0000000010001428] = 0000ffd4
	st	%f5 ,[%i0+0x028]	! Mem[0000000010001428] = 3ae000d7
!	%l0 = ffffffffffffffcb, Mem[0000000010181400] = 000000ff
	stha	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000ffcb
!	%l4 = ffff9bff, %l5 = 771ff1ac, Mem[0000000010081410] = ffffd4ff 5441c3b0
	stda	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = ffff9bff 771ff1ac

p0_label_98:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ff000000, %l1 = 00000000d56cf322
	ldsha	[%i5+%o5]0x81,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000010001400] = 53c23b1c 81370000, %l4 = ffff9bff, %l5 = 771ff1ac
	ldda	[%i0+%g0]0x88,%l4	! %l4 = 0000000081370000 0000000053c23b1c
!	Mem[0000000010181428] = 0cf400ff, %l2 = 000000000036ff80
	ldsh	[%i6+0x028],%l2		! %l2 = 0000000000000cf4
!	Mem[0000000010081400] = ff000000, %l5 = 0000000053c23b1c
	lduwa	[%i2+%g0]0x88,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010001400] = 00003781 1c3bc253, %l6 = 329bffff, %l7 = 00000032
	ldda	[%i0+%g0]0x80,%l6	! %l6 = 0000000000003781 000000001c3bc253
!	Mem[0000000010041410] = 80ffffff 4204ffdb, %l4 = 81370000, %l5 = ff000000
	ldda	[%i1+%o5]0x88,%l4	! %l4 = 000000004204ffdb 0000000080ffffff
!	Mem[0000000010101410] = 00000000, %l1 = ffffffffffffff00
	ldsba	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Code Fragment 3, seed = 50518
p0_fragment_12:
!	%l0 = ffffffffffffffcb
	setx	0xd50b3859dba48376,%g7,%l0 ! %l0 = d50b3859dba48376
!	%l1 = 0000000000000000
	setx	0x11d03317475b16a1,%g7,%l1 ! %l1 = 11d03317475b16a1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d50b3859dba48376
	setx	0xd3290e8c172cdddc,%g7,%l0 ! %l0 = d3290e8c172cdddc
!	%l1 = 11d03317475b16a1
	setx	0x6ae7cc019750dc27,%g7,%l1 ! %l1 = 6ae7cc019750dc27
p0_fragment_12_end:
!	Mem[0000000010001408] = 54640000, %l5 = 0000000080ffffff
	lduba	[%i0+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[000000001004142a] = 0c0000ff, %l2 = 0000000000000cf4
	lduh	[%i1+0x02a],%l2		! %l2 = 00000000000000ff

p0_label_99:
!	Starting 10 instruction Store Burst
!	%f2  = cbff3400, Mem[0000000010141438] = 638bdaca
	sta	%f2 ,[%i5+0x038]%asi	! Mem[0000000010141438] = cbff3400
!	Code Fragment 4, seed = 579181
p0_fragment_13:
!	%l0 = d3290e8c172cdddc
	setx	0x36ecbc072cd3c1be,%g7,%l0 ! %l0 = 36ecbc072cd3c1be
!	%l1 = 6ae7cc019750dc27
	setx	0x8f05ee7ef0f9a269,%g7,%l1 ! %l1 = 8f05ee7ef0f9a269
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 36ecbc072cd3c1be
	setx	0x49a3c5dada473f24,%g7,%l0 ! %l0 = 49a3c5dada473f24
!	%l1 = 8f05ee7ef0f9a269
	setx	0xb8321ba6c7ed1aef,%g7,%l1 ! %l1 = b8321ba6c7ed1aef
p0_fragment_13_end:
!	%f18 = 9113c202, Mem[000000001010143c] = 32cac193
	sta	%f18,[%i4+0x03c]%asi	! Mem[000000001010143c] = 9113c202
!	Mem[00000000300c1400] = 323cbfda, %l5 = 0000000000000000
	ldstuba	[%i3+%g0]0x89,%l5	! %l5 = 00000000000000da
!	Mem[0000000021800140] = 1ecf5a18, %l0 = 49a3c5dada473f24
	ldstuba	[%o3+0x140]%asi,%l0	! %l0 = 000000000000001e
!	%l2 = 00000000000000ff, Mem[00000000300c1408] = 0034ffcb
	stwa	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff
!	Mem[0000000010181410] = 95000000, %l7 = 1c3bc253, %l0 = 0000001e
	add	%i6,0x10,%g1
	casa	[%g1]0x80,%l7,%l0	! %l0 = 0000000095000000
!	Mem[0000000010181408] = 7f0f5be2, %l1 = 00000000c7ed1aef
	swapa	[%i6+%o4]0x80,%l1	! %l1 = 000000007f0f5be2
!	%l7 = 000000001c3bc253, Mem[0000000030081400] = 73000000
	stha	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = c2530000
!	%l7 = 000000001c3bc253, Mem[0000000010181400] = cbff000000d4ffff
	stx	%l7,[%i6+%g0]		! Mem[0000000010181400] = 000000001c3bc253

p0_label_100:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ff060000 00000000, %l2 = 000000ff, %l3 = 00007300
	ldda	[%i5+%g0]0x80,%l2	! %l2 = 00000000ff060000 0000000000000000
!	Mem[0000000030141410] = ff0000004a5f18c5, %f16 = ff9bffff 00000000
	ldda	[%i5+%o5]0x81,%f16	! %f16 = ff000000 4a5f18c5
!	Mem[00000000100c1418] = 26569b3273bc073b, %f20 = ffff2a24 00005b00, %asi = 80
	ldda	[%i3+0x018]%asi,%f20	! %f20 = 26569b32 73bc073b
!	Mem[0000000010141408] = fe00000044a20007, %f12 = bd1f5b65 d700e03a
	ldda	[%i5+%o4]0x88,%f12	! %f12 = fe000000 44a20007
!	Mem[0000000010001408] = 0000645400000000, %l0 = 0000000095000000
	ldxa	[%i0+%o4]0x80,%l0	! %l0 = 0000645400000000
!	Mem[0000000010081400] = 4fa2ffebff000000, %f24 = 44cd89d0 188080a1
	ldda	[%i2+%g0]0x88,%f24	! %f24 = 4fa2ffeb ff000000
!	Mem[000000001018142c] = 382072b7, %l1 = 000000007f0f5be2
	ldsh	[%i6+0x02c],%l1		! %l1 = 0000000000003820
!	Mem[0000000030041400] = 00000000, %l2 = 00000000ff060000
	lduba	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1408] = ff000000, %l1 = 0000000000003820
	lduwa	[%i3+%o4]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010141410] = 80ff3600, %l7 = 000000001c3bc253
	lduwa	[%i5+%o5]0x80,%l7	! %l7 = 0000000080ff3600

p0_label_101:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000080ff3600, Mem[0000000030001408] = 0000000f
	stha	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 3600000f
!	%l0 = 0000645400000000, Mem[0000000010141408] = 0700a244
	stwa	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	%l0 = 0000645400000000, Mem[0000000010041410] = 4204ffdb
	stwa	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%f12 = fe000000 44a20007, %l2 = 0000000000000000
!	Mem[0000000030081400] = c2530000323cbfda
	stda	%f12,[%i2+%l2]ASI_PST16_S ! Mem[0000000030081400] = c2530000323cbfda
!	%l1 = 00000000ff000000, Mem[0000000010041408] = ff2a89b3ff3bc253
	stxa	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000ff000000
!	%f28 = 6c9f1ac4 5956a545, Mem[0000000010101418] = 635b0442 5298031b
	std	%f28,[%i4+0x018]	! Mem[0000000010101418] = 6c9f1ac4 5956a545
!	%l0 = 00000000, %l1 = ff000000, Mem[0000000010141400] = ff060000 00000000
	stda	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000 ff000000
!	%l6 = 00003781, %l7 = 80ff3600, Mem[0000000010041438] = 2e96d54a 529c29f3, %asi = 80
	stda	%l6,[%i1+0x038]%asi	! Mem[0000000010041438] = 00003781 80ff3600
!	Mem[0000000010041438] = 00003781, %l5 = 00000000000000da
	ldstub	[%i1+0x038],%l5		! %l5 = 0000000000000000
!	%f28 = 6c9f1ac4 5956a545, Mem[0000000010001428] = 3ae000d7 fe6fee6b
	std	%f28,[%i0+0x028]	! Mem[0000000010001428] = 6c9f1ac4 5956a545

p0_label_102:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ffff9bff, %l1 = 00000000ff000000
	ldswa	[%i2+%o5]0x88,%l1	! %l1 = ffffffffffff9bff
!	Mem[0000000030101400] = 00000000ffff9bff, %f4  = 16eb6232 3ae000d7
	ldda	[%i4+%g0]0x89,%f4 	! %f4  = 00000000 ffff9bff
!	Mem[0000000010101436] = ff0056fe, %l0 = 0000645400000000, %asi = 80
	ldsba	[%i4+0x036]%asi,%l0	! %l0 = 0000000000000056
!	Mem[00000000100c1400] = 242affff, %l4 = 000000004204ffdb
	lduba	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000024
!	Mem[0000000010081420] = 0000d4009516922b, %l7 = 0000000080ff3600
	ldx	[%i2+0x020],%l7		! %l7 = 0000d4009516922b
!	Mem[0000000030001410] = ffcc00003ae000d7, %l3 = 0000000000000000
	ldxa	[%i0+%o5]0x81,%l3	! %l3 = ffcc00003ae000d7
!	Mem[0000000010081408] = ff9bffff, %l5 = 0000000000000000
	ldsba	[%i2+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000300c1408] = 000000ff, %f17 = 4a5f18c5
	lda	[%i3+%o4]0x89,%f17	! %f17 = 000000ff
!	Mem[0000000010081400] = 000000ff, %f30 = 243cbfda
	lda	[%i2+%g0]0x80,%f30	! %f30 = 000000ff
!	Mem[0000000010181400] = 00000000, %f0  = dabf3c32
	lda	[%i6+%g0]0x80,%f0 	! %f0 = 00000000

p0_label_103:
!	Starting 10 instruction Store Burst
!	%l4 = 00000024, %l5 = ffffffff, Mem[0000000010101408] = ffff9b32 1b6233cb
	stda	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000024 ffffffff
!	Mem[0000000010001430] = 00000000, %l2 = 0000000000000000, %asi = 80
	swapa	[%i0+0x030]%asi,%l2	! %l2 = 0000000000000000
!	%f0  = 00000000 9c9fad7f, Mem[0000000010081400] = ff000000 4fa2ffeb
	stda	%f0 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000 9c9fad7f
!	%f26 = 00000000, Mem[00000000100c1410] = 00000000
	sta	%f26,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	Code Fragment 4, seed = 576826
p0_fragment_14:
!	%l0 = 0000000000000056
	setx	0x39722bd1a4e56856,%g7,%l0 ! %l0 = 39722bd1a4e56856
!	%l1 = ffffffffffff9bff
	setx	0x8b23ffae8a506581,%g7,%l1 ! %l1 = 8b23ffae8a506581
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 39722bd1a4e56856
	setx	0x71a07af30d7276bc,%g7,%l0 ! %l0 = 71a07af30d7276bc
!	%l1 = 8b23ffae8a506581
	setx	0xa588cfa85d3c9f07,%g7,%l1 ! %l1 = a588cfa85d3c9f07
p0_fragment_14_end:
!	%f5  = ffff9bff, %f24 = 4fa2ffeb, %f9  = b0c34154
	fsubs	%f5 ,%f24,%f9 		! %f9  = ffff9bff
!	Mem[000000001000141a] = 67289160, %l7 = 0000d4009516922b
	ldstuba	[%i0+0x01a]%asi,%l7	! %l7 = 0000000000000091
!	Mem[0000000030041410] = 24000053, %l3 = ffcc00003ae000d7
	ldstuba	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000024
!	%l6 = 0000000000003781, Mem[00000000300c1400] = 7fad9f9c323cbfff
	stxa	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000000003781
!	Mem[00000000201c0000] = ccff2c68, %l5 = ffffffffffffffff
	ldstub	[%o0+%g0],%l5		! %l5 = 00000000000000cc

p0_label_104:
!	Starting 10 instruction Load Burst
!	%l5 = 00000000000000cc, imm = fffffffffffff535, %l2 = 0000000000000000
	addc	%l5,-0xacb,%l2		! %l2 = fffffffffffff601
!	Mem[0000000010041410] = 00000000, %l1 = a588cfa85d3c9f07
	ldsba	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%l5 = 00000000000000cc, %l6 = 0000000000003781, %l6 = 0000000000003781
	addc	%l5,%l6,%l6		! %l6 = 000000000000384d
!	Mem[00000000300c1408] = 000000ff, %l7 = 0000000000000091
	lduha	[%i3+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1430] = 205184ff6bd5714d, %l2 = fffffffffffff601
	ldx	[%i3+0x030],%l2		! %l2 = 205184ff6bd5714d
!	%f14 = a30f6053, %f7  = e25b0f7f, %f12 = fe000000
	fadds	%f14,%f7 ,%f12		! %f12 = e25b0f7f
!	Mem[0000000030041408] = 4204ffdb, %l5 = 00000000000000cc
	ldswa	[%i1+%o4]0x81,%l5	! %l5 = 000000004204ffdb
!	Mem[00000000100c1400] = ffff2a24, %l6 = 000000000000384d
	lduwa	[%i3+%g0]0x88,%l6	! %l6 = 00000000ffff2a24
!	Mem[000000001010142c] = ffffffff, %l1 = 0000000000000000
	ldsw	[%i4+0x02c],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000030001408] = 7efd6b250f000036, %l0 = 71a07af30d7276bc
	ldxa	[%i0+%o4]0x89,%l0	! %l0 = 7efd6b250f000036

p0_label_105:
!	Starting 10 instruction Store Burst
!	%f20 = 26569b32 73bc073b, %l7 = 00000000000000ff
!	Mem[0000000030141438] = 6a51797a5c8fdf63
	add	%i5,0x038,%g1
	stda	%f20,[%g1+%l7]ASI_PST32_S ! Mem[0000000030141438] = 26569b3273bc073b
!	%l1 = ffffffffffffffff, Mem[0000000010081400] = 9c9fad7f
	stba	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = 9c9fadff
!	Mem[0000000030101408] = 02c21391, %l2 = 000000006bd5714d
	swapa	[%i4+%o4]0x89,%l2	! %l2 = 0000000002c21391
!	%l5 = 000000004204ffdb, Mem[0000000010001408] = 54640000
	stba	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 546400db
!	Mem[0000000010001410] = a30f6053, %l6 = 00000000ffff2a24
	swapa	[%i0+%o5]0x88,%l6	! %l6 = 00000000a30f6053
!	%l5 = 000000004204ffdb, Mem[0000000010041408] = 00000000
	stba	%l5,[%i1+%o4]0x80	! Mem[0000000010041408] = db000000
!	Mem[0000000010181410] = 95000000, %l7 = 00000000000000ff
	swapa	[%i6+%o5]0x80,%l7	! %l7 = 0000000095000000
!	%l3 = 0000000000000024, Mem[0000000030101400] = ff9bffff
	stwa	%l3,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000024
!	%l6 = 00000000a30f6053, Mem[0000000010181428] = 0cf400ff382072b7, %asi = 80
	stxa	%l6,[%i6+0x028]%asi	! Mem[0000000010181428] = 00000000a30f6053
!	%f14 = a30f6053 baa6574c, Mem[0000000010081400] = ffad9f9c 00000000
	stda	%f14,[%i2+%g0]0x80	! Mem[0000000010081400] = a30f6053 baa6574c

p0_label_106:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = c7ed1aef, %l1 = ffffffffffffffff
	lduha	[%i6+%o4]0x80,%l1	! %l1 = 000000000000c7ed
!	Mem[0000000030001410] = ffcc0000, %l1 = 000000000000c7ed
	lduha	[%i0+%o5]0x81,%l1	! %l1 = 000000000000ffcc
!	Mem[0000000010081400] = a30f6053baa6574c, %l2 = 0000000002c21391, %asi = 80
	ldxa	[%i2+0x000]%asi,%l2	! %l2 = a30f6053baa6574c
!	Mem[0000000010101408] = 24000000, %l2 = a30f6053baa6574c
	lduwa	[%i4+%o4]0x88,%l2	! %l2 = 0000000024000000
!	Mem[0000000030001408] = 3600000f, %l5 = 000000004204ffdb
	lduha	[%i0+%o4]0x81,%l5	! %l5 = 0000000000003600
!	Mem[0000000030141400] = a30f6053baa6574c, %l6 = 00000000a30f6053
	ldxa	[%i5+%g0]0x81,%l6	! %l6 = a30f6053baa6574c
!	%l7 = 0000000095000000, %l4 = 0000000000000024, %l2 = 0000000024000000
	sub	%l7,%l4,%l2		! %l2 = 0000000094ffffdc
!	Mem[00000000100c1420] = 08055dbf, %f23 = 1b6233cb
	ld	[%i3+0x020],%f23	! %f23 = 08055dbf
!	Mem[0000000010181414] = ebffa24f, %f1  = 9c9fad7f
	lda	[%i6+0x014]%asi,%f1 	! %f1 = ebffa24f
!	Mem[0000000020800000] = 00d40898, %l2 = 0000000094ffffdc
	ldsb	[%o1+%g0],%l2		! %l2 = 0000000000000000

p0_label_107:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000010141408] = 00000000
	stha	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%f9  = ffff9bff, Mem[00000000300c1410] = 3262eb16
	sta	%f9 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffff9bff
!	%l0 = 7efd6b250f000036, Mem[0000000030181410] = 000037814d542da5
	stxa	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 7efd6b250f000036
!	%l1 = 000000000000ffcc, Mem[0000000030041410] = 7b7fff04530000ff
	stxa	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000000000ffcc
!	%l0 = 7efd6b250f000036, Mem[0000000030101410] = 0000ffdb
	stha	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000036
!	Mem[0000000010181437] = 68267bed, %l6 = a30f6053baa6574c
	ldstuba	[%i6+0x037]%asi,%l6	! %l6 = 00000000000000ed
!	%l2 = 0000000000000000, Mem[0000000010081410] = ff9bffff
	stha	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000ffff
!	Mem[000000001008140b] = ff9bffff, %l6 = 00000000000000ed
	ldstub	[%i2+0x00b],%l6		! %l6 = 00000000000000ff
!	%l4 = 0000000000000024, Mem[0000000010081400] = a30f6053
	stwa	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000024
!	%l1 = 000000000000ffcc, Mem[0000000010141408] = 00000000000000fe
	stxa	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000000000ffcc

p0_label_108:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = db000000, %l2 = 0000000000000000
	ldsba	[%i1+%o4]0x80,%l2	! %l2 = ffffffffffffffdb
!	Mem[0000000010001410] = 242affff329bffff, %f14 = a30f6053 baa6574c
	ldda	[%i0+%o5]0x80,%f14	! %f14 = 242affff 329bffff
	membar	#Sync			! Added by membar checker (16)
!	Mem[00000000300c1400] = 81370000 00000000 ff000000 00000000
!	Mem[00000000300c1410] = ff9bffff 3ae000d7 771ff1ac e25b0f7f
!	Mem[00000000300c1420] = 01272651 b0c34154 0700a244 3f800000
!	Mem[00000000300c1430] = bd1f5b65 d700e03a a30f6053 baa6574c
	ldda	[%i3+%g0]ASI_BLK_AIUSL,%f0 	! Block Load from 00000000300c1400
!	Mem[0000000030041410] = ccff0000, %l4 = 0000000000000024
	lduwa	[%i1+%o5]0x81,%l4	! %l4 = 00000000ccff0000
!	Mem[0000000010081400] = 24000000, %l5 = 0000000000003600
	ldsha	[%i2+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001408] = 7efd6b25 0f000036, %l0 = 0f000036, %l1 = 0000ffcc
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 000000000f000036 000000007efd6b25
!	Mem[0000000010041408] = db000000, %l5 = 0000000000000000
	lduba	[%i1+%o4]0x80,%l5	! %l5 = 00000000000000db
!	Mem[0000000030001400] = 26d567ff, %l5 = 00000000000000db
	ldswa	[%i0+%g0]0x89,%l5	! %l5 = 0000000026d567ff
!	Mem[0000000030141400] = 4c57a6ba53600fa3, %f22 = 75214102 08055dbf
	ldda	[%i5+%g0]0x89,%f22	! %f22 = 4c57a6ba 53600fa3
!	Mem[00000000201c0000] = ffff2c68, %l0 = 000000000f000036
	ldub	[%o0+%g0],%l0		! %l0 = 00000000000000ff

p0_label_109:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = ffcc00003ae000d7, %l7 = 0000000095000000
	ldxa	[%i0+%o5]0x81,%l7	! %l7 = ffcc00003ae000d7
!	%l2 = ffffffdb, %l3 = 00000024, Mem[00000000100c1418] = 26569b32 73bc073b, %asi = 80
	stda	%l2,[%i3+0x018]%asi	! Mem[00000000100c1418] = ffffffdb 00000024
!	Mem[0000000030141408] = 329bffff, %l5 = 0000000026d567ff
	swapa	[%i5+%o4]0x81,%l5	! %l5 = 00000000329bffff
!	Mem[0000000010101418] = 6c9f1ac4, %l3 = 00000024, %l6 = 000000ff
	add	%i4,0x18,%g1
	casa	[%g1]0x80,%l3,%l6	! %l6 = 000000006c9f1ac4
!	Mem[0000000010041400] = ff00005b, %l7 = 3ae000d7, %l1 = 7efd6b25
	casa	[%i1]0x80,%l7,%l1	! %l1 = 00000000ff00005b
!	Mem[000000001014142c] = 3ae000d7, %l3 = 00000024, %l3 = 00000024
	add	%i5,0x2c,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 000000003ae000d7
!	%l4 = 00000000ccff0000, Mem[0000000010141410] = 0036ff80
	stba	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 0036ff00
!	%l7 = ffcc00003ae000d7, Mem[0000000030141400] = 53600fa3
	stwa	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = 3ae000d7
!	Mem[0000000010101400] = 0036ff80 00007300 00000024 ffffffff
!	%f0  = 00000000 00003781 00000000 000000ff
!	%f4  = d700e03a ffff9bff 7f0f5be2 acf11f77
!	%f8  = 5441c3b0 51262701 0000803f 44a20007
!	%f12 = 3ae000d7 655b1fbd 4c57a6ba 53600fa3
	stda	%f0 ,[%i4+%g0]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	%f18 = 9113c202 fe000000, Mem[0000000010041418] = 5e87b072 04ff7f7b, %asi = 80
	stda	%f18,[%i1+0x018]%asi	! Mem[0000000010041418] = 9113c202 fe000000

p0_label_110:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = dbff0442, %l7 = ffcc00003ae000d7
	ldsha	[%i1+%o4]0x89,%l7	! %l7 = 0000000000000442
!	Mem[0000000030001410] = ffcc00003ae000d7, %l1 = 00000000ff00005b
	ldxa	[%i0+%o5]0x81,%l1	! %l1 = ffcc00003ae000d7
!	Mem[0000000030101410] = 36000000, %l4 = 00000000ccff0000
	lduwa	[%i4+%o5]0x81,%l4	! %l4 = 0000000036000000
!	Mem[0000000010001408] = 546400db, %l7 = 0000000000000442
	ldsba	[%i0+%o4]0x88,%l7	! %l7 = ffffffffffffffdb
!	Mem[0000000010001410] = ffff2a24, %l3 = 000000003ae000d7
	lduha	[%i0+%o5]0x88,%l3	! %l3 = 0000000000002a24
!	Mem[0000000030001400] = ff67d526, %l0 = 00000000000000ff
	ldsba	[%i0+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030181400] = 00000000, %l5 = 00000000329bffff
	lduha	[%i6+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101408] = 4d71d56b, %l4 = 0000000036000000
	ldsba	[%i4+%o4]0x81,%l4	! %l4 = 000000000000004d
!	Mem[0000000030041410] = ccff0000, %l3 = 0000000000002a24
	ldswa	[%i1+%o5]0x81,%l3	! %l3 = ffffffffccff0000
!	Mem[0000000010181408] = c7ed1aef6b8301d3, %f26 = 00000000 0034ffcb, %asi = 80
	ldda	[%i6+0x008]%asi,%f26	! %f26 = c7ed1aef 6b8301d3

p0_label_111:
!	Starting 10 instruction Store Burst
!	%l1 = ffcc00003ae000d7, Mem[0000000010101406] = 00003781, %asi = 80
	stha	%l1,[%i4+0x006]%asi	! Mem[0000000010101404] = 000000d7
!	Mem[0000000010081408] = ff9bffff, %l2 = ffffffffffffffdb
	ldstuba	[%i2+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	%f9  = 51262701, Mem[00000000100c1408] = 00000000
	sta	%f9 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 51262701
!	Mem[0000000020800040] = 00ffe0c8, %l4 = 000000000000004d
	ldstuba	[%o1+0x040]%asi,%l4	! %l4 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010001410] = 242affff
	stwa	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	%l7 = ffffffffffffffdb, Mem[0000000030101400] = 24000000
	stha	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = 2400ffdb
!	%f24 = 4fa2ffeb, Mem[0000000030101410] = 00000036
	sta	%f24,[%i4+%o5]0x89	! Mem[0000000030101410] = 4fa2ffeb
!	%l0 = ffffffff, %l1 = 3ae000d7, Mem[00000000100c1438] = 00000c6f 242a89b3, %asi = 80
	stda	%l0,[%i3+0x038]%asi	! Mem[00000000100c1438] = ffffffff 3ae000d7
!	%l3 = ffffffffccff0000, Mem[0000000010001400] = 00003781
	stwa	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = ccff0000
!	%l0 = ffffffffffffffff, Mem[0000000030141400] = 4c57a6ba3ae000d7
	stxa	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffffffffffffff

p0_label_112:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 000000ffebffa24f, %l4 = 0000000000000000
	ldxa	[%i6+%o5]0x80,%l4	! %l4 = 000000ffebffa24f
!	Mem[0000000010141438] = cbff3400, %l2 = 00000000000000ff
	ldsw	[%i5+0x038],%l2		! %l2 = ffffffffcbff3400
!	Mem[0000000030141400] = ffffffffffffffff, %f16 = ff000000 000000ff
	ldda	[%i5+%g0]0x81,%f16	! %f16 = ffffffff ffffffff
!	Mem[0000000030001410] = ffcc0000, %l1 = ffcc00003ae000d7
	ldswa	[%i0+%o5]0x81,%l1	! %l1 = ffffffffffcc0000
!	Mem[0000000010081408] = ff9bffff, %l0 = ffffffffffffffff, %asi = 80
	ldswa	[%i2+0x008]%asi,%l0	! %l0 = ffffffffff9bffff
!	Mem[0000000030001400] = 26d567ff, %l5 = 0000000000000000
	lduba	[%i0+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1400] = 242affff00000000, %f28 = 6c9f1ac4 5956a545
	ldda	[%i3+%g0]0x80,%f28	! %f28 = 242affff 00000000
!	Mem[0000000030181400] = 00000000, %l2 = ffffffffcbff3400
	lduha	[%i6+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = 000000db, %l4 = 000000ffebffa24f
	lduha	[%i1+%o4]0x88,%l4	! %l4 = 00000000000000db
!	Mem[0000000010181424] = 52980331, %l6 = 000000006c9f1ac4
	ldsw	[%i6+0x024],%l6		! %l6 = 0000000052980331

p0_label_113:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 0036ff00, %l1 = ffffffffffcc0000
	ldstuba	[%i5+%o5]0x88,%l1	! %l1 = 0000000000000000
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000010101412] = d700e03a, %l6 = 0000000052980331
	ldstub	[%i4+0x012],%l6		! %l6 = 00000000000000e0
!	%f25 = ff000000, Mem[0000000030041410] = 0000ffcc
	sta	%f25,[%i1+%o5]0x89	! Mem[0000000030041410] = ff000000
!	Mem[00000000300c1410] = ffff9bff, %l2 = 0000000000000000
	swapa	[%i3+%o5]0x89,%l2	! %l2 = 00000000ffff9bff
!	%f25 = ff000000, Mem[0000000010001408] = 546400db
	sta	%f25,[%i0+%o4]0x88	! Mem[0000000010001408] = ff000000
!	Mem[0000000010041410] = 00000000, %l0 = ffffffffff9bffff
	ldstuba	[%i1+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101425] = 51262701, %l4 = 00000000000000db
	ldstub	[%i4+0x025],%l4		! %l4 = 0000000000000026
!	%f3  = 000000ff, Mem[0000000030081410] = 80ff3600
	sta	%f3 ,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff
!	%f18 = 9113c202 fe000000, Mem[0000000010081408] = ff9bffff acf11f77
	stda	%f18,[%i2+%o4]0x80	! Mem[0000000010081408] = 9113c202 fe000000
!	Mem[0000000010041400] = 5b0000ff, %l7 = 00000000ffffffdb
	swapa	[%i1+%g0]0x88,%l7	! %l7 = 000000005b0000ff

p0_label_114:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ffff9b32 00000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000000 00000000ffff9b32
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010081400] = 00000024 baa6574c 9113c202 fe000000
!	Mem[0000000010081410] = 0000ffff acf11f77 7b7fff04 72b0875e
!	Mem[0000000010081420] = 0000d400 9516922b 771ff1ac fe6fee6b
!	Mem[0000000010081430] = 8dafd41e acf11f77 f3299c52 d56cf322
	ldda	[%i2+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010081400
!	Mem[0000000010001408] = 000000ff, %f1  = 00003781
	lda	[%i0+%o4]0x80,%f1 	! %f1 = 000000ff
!	Mem[0000000010081438] = f3299c52, %l5 = 00000000000000ff, %asi = 80
	ldsba	[%i2+0x038]%asi,%l5	! %l5 = fffffffffffffff3
!	Mem[0000000010141400] = 00000000, %l0 = 0000000000000000
	lduwa	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = 000000ff, %l5 = fffffffffffffff3
	ldsha	[%i0+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = 00000024 baa6574c 9113c202 fe000000
!	Mem[0000000010081410] = 0000ffff acf11f77 7b7fff04 72b0875e
!	Mem[0000000010081420] = 0000d400 9516922b 771ff1ac fe6fee6b
!	Mem[0000000010081430] = 8dafd41e acf11f77 f3299c52 d56cf322
	ldda	[%i2+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010081400
!	Mem[0000000030181400] = 0000000000000000, %f0  = 00000000 000000ff
	ldda	[%i6+%g0]0x81,%f0 	! %f0  = 00000000 00000000
!	Mem[0000000030181410] = 256bfd7e, %f1  = 00000000
	lda	[%i6+%o5]0x89,%f1 	! %f1 = 256bfd7e
!	Mem[000000001014143e] = 199bffdb, %l6 = 00000000000000e0
	ldsb	[%i5+0x03e],%l6		! %l6 = ffffffffffffffff

p0_label_115:
!	Starting 10 instruction Store Burst
!	%l7 = 000000005b0000ff, Mem[0000000010101410] = d700ff3a
	stha	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 00ffff3a
!	Mem[0000000010081410] = ffff0000, %l1 = 00000000ffff9b32
	ldstuba	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000000
	membar	#Sync			! Added by membar checker (19)
!	%f10 = 0000803f 44a20007, Mem[0000000010081418] = 7b7fff04 72b0875e
	std	%f10,[%i2+0x018]	! Mem[0000000010081418] = 0000803f 44a20007
!	%l5 = 0000000000000000, Mem[00000000300c1400] = 8137000000000000
	stxa	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000000000000
!	%l4 = 0000000000000026, Mem[0000000010001408] = 000000ff
	stwa	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000026
!	%l6 = ffffffff, %l7 = 5b0000ff, Mem[0000000030141400] = ffffffff ffffffff
	stda	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffffff 5b0000ff
!	%f8  = 5441c3b0 51262701, %l5 = 0000000000000000
!	Mem[0000000030141418] = 270076a26b968eeb
	add	%i5,0x018,%g1
	stda	%f8,[%g1+%l5]ASI_PST32_S ! Mem[0000000030141418] = 270076a26b968eeb
!	%l5 = 0000000000000000, Mem[0000000030001400] = 26d567ff
	stha	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 26d50000
!	Mem[0000000030141408] = 26d567ff, %l0 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l0	! %l0 = 0000000026d567ff
!	Mem[0000000010001400] = 0000ffcc, %l2 = 00000000ffff9bff
	swapa	[%i0+%g0]0x88,%l2	! %l2 = 000000000000ffcc

p0_label_116:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 51262701, %l3 = ffffffffccff0000
	ldsw	[%i3+%o4],%l3		! %l3 = 0000000051262701
!	Mem[00000000100c1404] = 00000000, %l6 = ffffffffffffffff
	ldsw	[%i3+0x004],%l6		! %l6 = 0000000000000000
!	Mem[0000000010081410] = ffff00ff, %l3 = 0000000051262701
	lduwa	[%i2+%o5]0x88,%l3	! %l3 = 00000000ffff00ff
!	Mem[0000000010101420] = 5441c3b0 51ff2701, %l6 = 00000000, %l7 = 5b0000ff, %asi = 80
	ldda	[%i4+0x020]%asi,%l6	! %l6 = 000000005441c3b0 0000000051ff2701
!	Mem[0000000010041410] = 000000ff, %l2 = 000000000000ffcc
	ldsba	[%i1+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[000000001018142c] = a30f6053, %l7 = 0000000051ff2701, %asi = 80
	ldsha	[%i6+0x02c]%asi,%l7	! %l7 = ffffffffffffa30f
!	Mem[00000000100c1424] = 02c21391, %l4 = 0000000000000026, %asi = 80
	lduha	[%i3+0x024]%asi,%l4	! %l4 = 00000000000002c2
!	Mem[0000000010041408] = 000000db, %l6 = 000000005441c3b0
	ldsba	[%i1+%o4]0x88,%l6	! %l6 = ffffffffffffffdb
!	Mem[0000000030101410] = ebffa24f00000000, %f16 = 4c57a6ba 24000000
	ldda	[%i4+%o5]0x81,%f16	! %f16 = ebffa24f 00000000
!	Mem[0000000010041400] = ffffffdb, %f26 = 6bee6ffe
	lda	[%i1+%g0]0x88,%f26	! %f26 = ffffffdb

p0_label_117:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 000053c2, %l1 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l1	! %l1 = 00000000000053c2
!	%l7 = ffffffffffffa30f, Mem[00000000100c1408] = 51262701
	stba	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0f262701
!	%l6 = ffffffffffffffdb, Mem[0000000030181400] = 00000000
	stha	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000ffdb
!	Mem[0000000010081410] = ff00ffff, %l1 = 00000000000053c2
	swapa	[%i2+%o5]0x80,%l1	! %l1 = 00000000ff00ffff
!	Mem[0000000010181408] = c7ed1aef, %l0 = 0000000026d567ff
	swapa	[%i6+%o4]0x80,%l0	! %l0 = 00000000c7ed1aef
!	%l2 = ffffffffffffffff, Mem[0000000010181408] = d301836bff67d526
	stxa	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffffffffffffff
!	%l4 = 00000000000002c2, Mem[00000000201c0001] = ffff2c68
	stb	%l4,[%o0+0x001]		! Mem[00000000201c0000] = ffc22c68
!	Mem[0000000030001400] = 26d50000, %l2 = ffffffffffffffff
	ldstuba	[%i0+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = 0000ccff, %l5 = 0000000000000000
	swapa	[%i0+%o5]0x89,%l5	! %l5 = 000000000000ccff
!	%l4 = 00000000000002c2, Mem[00000000211c0000] = ffffb4f8
	sth	%l4,[%o2+%g0]		! Mem[00000000211c0000] = 02c2b4f8

p0_label_118:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101416] = ffff9bff, %l2 = 0000000000000000
	lduh	[%i4+0x016],%l2		! %l2 = 0000000000009bff
!	Mem[0000000010141408] = 00000000, %l2 = 0000000000009bff
	lduha	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081434] = acf11f77, %f16 = ebffa24f
	ld	[%i2+0x034],%f16	! %f16 = acf11f77
!	Mem[0000000010101410] = 00ffff3affff9bff, %f18 = 000000fe 02c21391
	ldda	[%i4+%o5]0x80,%f18	! %f18 = 00ffff3a ffff9bff
!	Mem[0000000030001400] = ff00d526, %l3 = 00000000ffff00ff
	lduwa	[%i0+%g0]0x81,%l3	! %l3 = 00000000ff00d526
!	Mem[000000001008142c] = fe6fee6b, %l6 = ffffffffffffffdb
	lduw	[%i2+0x02c],%l6		! %l6 = 00000000fe6fee6b
!	Mem[000000001018142c] = a30f6053, %l0 = 00000000c7ed1aef
	lduh	[%i6+0x02c],%l0		! %l0 = 000000000000a30f
!	Mem[0000000010081410] = 000053c2acf11f77, %f18 = 00ffff3a ffff9bff
	ldda	[%i2+%o5]0x80,%f18	! %f18 = 000053c2 acf11f77
!	Mem[0000000010141410] = 00006a10 0036ffff, %l0 = 0000a30f, %l1 = ff00ffff
	ldda	[%i5+%o5]0x88,%l0	! %l0 = 000000000036ffff 0000000000006a10
!	Mem[0000000030041400] = 00000000, %l1 = 0000000000006a10
	lduwa	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000000

p0_label_119:
!	Starting 10 instruction Store Burst
!	Code Fragment 3, seed = 910197
p0_fragment_15:
!	%l0 = 000000000036ffff
	setx	0x3d1d58cb8f6ee17e,%g7,%l0 ! %l0 = 3d1d58cb8f6ee17e
!	%l1 = 0000000000000000
	setx	0x002691be46f5b629,%g7,%l1 ! %l1 = 002691be46f5b629
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3d1d58cb8f6ee17e
	setx	0xf813782f0fe206e4,%g7,%l0 ! %l0 = f813782f0fe206e4
!	%l1 = 002691be46f5b629
	setx	0x9b40fa2937f856af,%g7,%l1 ! %l1 = 9b40fa2937f856af
p0_fragment_15_end:
!	%l0 = f813782f0fe206e4, Mem[0000000030001410] = 00000000
	stha	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 000006e4
!	%l7 = ffffffffffffa30f, Mem[0000000030141408] = 00000000
	stba	%l7,[%i5+%o4]0x81	! Mem[0000000030141408] = 0f000000
!	%f24 = 2b921695, Mem[0000000010101410] = 00ffff3a
	sta	%f24,[%i4+%o5]0x80	! Mem[0000000010101410] = 2b921695
!	Mem[0000000010141408] = 00000000, %l7 = 00000000ffffa30f
	swapa	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000000
!	%l0 = f813782f0fe206e4, Mem[0000000030141410] = 000000ff
	stwa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 0fe206e4
!	%l4 = 00000000000002c2, Mem[00000000300c1408] = ff000000
	stha	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 02c20000
!	%l5 = 000000000000ccff, Mem[0000000010081410] = 771ff1acc2530000
	stxa	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000000000ccff
!	Mem[00000000100c1410] = 00000000, %l6 = 00000000fe6fee6b
	swap	[%i3+%o5],%l6		! %l6 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l6 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000

p0_label_120:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 0127260f, %l7 = 0000000000000000
	ldswa	[%i3+%o4]0x88,%l7	! %l7 = 000000000127260f
!	Mem[0000000030141400] = ffffffff5b0000ff, %f16 = acf11f77 00000000
	ldda	[%i5+%g0]0x81,%f16	! %f16 = ffffffff 5b0000ff
!	Mem[0000000030081410] = 000000ff, %l2 = 0000000000000000
	lduha	[%i2+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101410] = 9516922b, %f15 = 53600fa3
	lda	[%i4+%o5]0x88,%f15	! %f15 = 9516922b
!	Mem[0000000030001410] = e4060000, %l7 = 000000000127260f
	lduha	[%i0+%o5]0x81,%l7	! %l7 = 000000000000e406
!	Mem[0000000030141410] = 0fe206e4, %l3 = 00000000ff00d526
	lduba	[%i5+%o5]0x89,%l3	! %l3 = 00000000000000e4
!	Mem[0000000010141410] = ffff3600, %f22 = 5e87b072
	lda	[%i5+%o5]0x80,%f22	! %f22 = ffff3600
!	Mem[0000000010001408] = 26000000, %l1 = 9b40fa2937f856af
	lduwa	[%i0+%o4]0x88,%l1	! %l1 = 0000000026000000
!	Mem[0000000030101410] = 4fa2ffeb, %l5 = 000000000000ccff
	ldswa	[%i4+%o5]0x89,%l5	! %l5 = 000000004fa2ffeb
!	Mem[0000000020800001] = 00d40898, %l1 = 0000000026000000, %asi = 80
	lduba	[%o1+0x001]%asi,%l1	! %l1 = 00000000000000d4

p0_label_121:
!	Starting 10 instruction Store Burst
!	%l0 = 0fe206e4, %l1 = 000000d4, Mem[0000000010181400] = 00000000 1c3bc253
	stda	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 0fe206e4 000000d4
!	%f2  = 00000000, Mem[0000000010141408] = 0fa3ffff
	sta	%f2 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%l2 = 00000000000000ff, Mem[000000001010142e] = 44a20007, %asi = 80
	stha	%l2,[%i4+0x02e]%asi	! Mem[000000001010142c] = 44a200ff
!	%f2  = 00000000 000000ff, Mem[0000000030101400] = dbff0024 00000000
	stda	%f2 ,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000 000000ff
!	%l0 = f813782f0fe206e4, %l3 = 00000000000000e4, %y  = cbff3400
	sdiv	%l0,%l3,%l6		! %l6 = ffffffff80000000
	mov	%l0,%y			! %y = 0fe206e4
!	%f27 = acf11f77, %f29 = 1ed4af8d, %f22 = ffff3600
	fdivs	%f27,%f29,%f22		! %f22 = cd911d3f
!	Mem[0000000010041410] = ff000000, %l2 = 00000000000000ff
	ldstuba	[%i1+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%l3 = 00000000000000e4, Mem[0000000010141408] = 00000000
	stba	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000e4
!	%f4  = d700e03a ffff9bff, Mem[0000000030101400] = 00000000 000000ff
	stda	%f4 ,[%i4+%g0]0x81	! Mem[0000000030101400] = d700e03a ffff9bff
!	%l2 = 00000000000000ff, Mem[0000000030081408] = 242affff
	stba	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = ff2affff

p0_label_122:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffc22c68, %l1 = 00000000000000d4
	ldub	[%o0+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010101400] = 00000000, %f29 = 1ed4af8d
	lda	[%i4+%g0]0x88,%f29	! %f29 = 00000000
!	Mem[0000000010181400] = 0fe206e4 000000d4, %l2 = 000000ff, %l3 = 000000e4
	ldda	[%i6+%g0]0x80,%l2	! %l2 = 000000000fe206e4 00000000000000d4
!	Mem[000000001018142c] = a30f6053, %l2 = 000000000fe206e4
	lduh	[%i6+0x02c],%l2		! %l2 = 000000000000a30f
!	Mem[0000000010041408] = 000000db, %l6 = ffffffff80000000
	lduba	[%i1+%o4]0x88,%l6	! %l6 = 00000000000000db
!	Mem[0000000030181408] = 00000000, %l2 = 000000000000a30f
	ldsha	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101408] = ff00000000000000, %l2 = 0000000000000000
	ldxa	[%i4+%o4]0x88,%l2	! %l2 = ff00000000000000
!	Mem[0000000030101410] = 4fa2ffeb, %f19 = acf11f77
	lda	[%i4+%o5]0x89,%f19	! %f19 = 4fa2ffeb
!	Mem[0000000010081433] = 8dafd41e, %l6 = 00000000000000db
	ldsb	[%i2+0x033],%l6		! %l6 = 000000000000001e
!	Mem[0000000010081410] = 000000000000ccff, %f6  = 7f0f5be2 acf11f77
	ldda	[%i2+%o5]0x88,%f6 	! %f6  = 00000000 0000ccff

p0_label_123:
!	Starting 10 instruction Store Burst
!	%f19 = 4fa2ffeb, Mem[0000000010001408] = 00000026
	sta	%f19,[%i0+0x008]%asi	! Mem[0000000010001408] = 4fa2ffeb
!	Mem[0000000030181400] = dbff0000, %l4 = 00000000000002c2
	ldstuba	[%i6+%g0]0x81,%l4	! %l4 = 00000000000000db
!	Mem[00000000100c1400] = ffff2a24, %l0 = f813782f0fe206e4
	ldstuba	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000024
!	%l2 = ff00000000000000, Mem[0000000030081408] = 0c6f0000ffff2aff
	stxa	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = ff00000000000000
!	Mem[0000000010141410] = ffff3600, %l1 = 00000000000000ff
	swapa	[%i5+%o5]0x80,%l1	! %l1 = 00000000ffff3600
!	Mem[0000000020800040] = ffffe0c8, %l7 = 000000000000e406
	ldstub	[%o1+0x040],%l7		! %l7 = 00000000000000ff
!	%f14 = 4c57a6ba, %f14 = 4c57a6ba
	fcmps	%fcc1,%f14,%f14		! %fcc1 = 0
!	Mem[000000001018140c] = ffffffff, %l3 = 00000000000000d4, %asi = 80
	swapa	[%i6+0x00c]%asi,%l3	! %l3 = 00000000ffffffff
!	%l6 = 000000000000001e, Mem[0000000010041410] = ff000000
	stba	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 1e000000
!	%l2 = ff00000000000000, Mem[0000000010141408] = e4000000
	stba	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000

p0_label_124:
!	Starting 10 instruction Load Burst
!	%f6  = 00000000, %f12 = 3ae000d7, %f4  = d700e03a
	fmuls	%f6 ,%f12,%f4 		! %f4  = 00000000
!	Mem[0000000030001410] = 000006e4, %l0 = 0000000000000024
	ldswa	[%i0+%o5]0x89,%l0	! %l0 = 00000000000006e4
!	%l2 = ff00000000000000, %l1 = 00000000ffff3600, %l6 = 000000000000001e
	sub	%l2,%l1,%l6		! %l6 = feffffff0000ca00
!	Mem[0000000010101410] = 2b921695, %l4 = 00000000000000db
	lduha	[%i4+%o5]0x80,%l4	! %l4 = 0000000000002b92
!	Mem[00000000100c1400] = ff2affff00000000, %f6  = 00000000 0000ccff, %asi = 80
	ldda	[%i3+0x000]%asi,%f6 	! %f6  = ff2affff 00000000
!	Mem[0000000010101408] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = 9113c202, %l4 = 0000000000002b92
	lduwa	[%i2+%o4]0x80,%l4	! %l4 = 000000009113c202
!	Mem[00000000100c1408] = 0f262701, %l7 = 0000000000000000
	lduba	[%i3+%o4]0x80,%l7	! %l7 = 000000000000000f
!	Mem[0000000030101400] = d700e03a ffff9bff, %l2 = 00000000, %l3 = ffffffff
	ldda	[%i4+%g0]0x81,%l2	! %l2 = 00000000d700e03a 00000000ffff9bff
!	Mem[00000000100c1400] = ff2affff, %l1 = 00000000ffff3600
	lduba	[%i3+%g0]0x80,%l1	! %l1 = 00000000000000ff

p0_label_125:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 00000000, %l0 = 00000000000006e4
	ldstuba	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041410] = ff000000, %l4 = 000000009113c202
	ldstuba	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000000
!	%f4  = 00000000 ffff9bff, %l3 = 00000000ffff9bff
!	Mem[00000000100c1408] = 0f26270173000000
	add	%i3,0x008,%g1
	stda	%f4,[%g1+%l3]ASI_PST8_PL ! Mem[00000000100c1408] = ff9bffff00000000
!	Mem[00000000300c1410] = 00000000, %l6 = feffffff0000ca00
	ldstuba	[%i3+%o5]0x89,%l6	! %l6 = 0000000000000000
!	%l2 = 00000000d700e03a, Mem[00000000201c0001] = ffc22c68, %asi = 80
	stba	%l2,[%o0+0x001]%asi	! Mem[00000000201c0000] = ff3a2c68
!	%l6 = 0000000000000000, Mem[00000000100c1400] = ffff2aff
	stha	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffff0000
!	%l3 = 00000000ffff9bff, Mem[0000000010081408] = 9113c202
	stw	%l3,[%i2+%o4]		! Mem[0000000010081408] = ffff9bff
!	%f16 = ffffffff 5b0000ff, %l6 = 0000000000000000
!	Mem[0000000030081438] = 417fa92a1c3bc253
	add	%i2,0x038,%g1
	stda	%f16,[%g1+%l6]ASI_PST32_S ! Mem[0000000030081438] = 417fa92a1c3bc253
!	%f16 = ffffffff 5b0000ff, Mem[0000000030001408] = 3600000f 256bfd7e
	stda	%f16,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffffff 5b0000ff
!	%f5  = ffff9bff, Mem[0000000030001400] = 26d500ff
	sta	%f5 ,[%i0+%g0]0x89	! Mem[0000000030001400] = ffff9bff

p0_label_126:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1405] = 00000000, %l0 = 0000000000000000, %asi = 80
	ldsba	[%i3+0x005]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141410] = e406e20f, %l2 = 00000000d700e03a
	lduba	[%i5+%o5]0x81,%l2	! %l2 = 00000000000000e4
!	Mem[0000000010101400] = 00000000, %l2 = 00000000000000e4
	ldswa	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = ff9bffff, %l3 = 00000000ffff9bff
	lduha	[%i2+%o4]0x88,%l3	! %l3 = 000000000000ffff
!	Mem[00000000100c141b] = ffffffdb, %l4 = 0000000000000000
	ldub	[%i3+0x01b],%l4		! %l4 = 00000000000000db
!	Mem[00000000100c1410] = 530000006bee6ffe, %f16 = ffffffff 5b0000ff
	ldda	[%i3+%o5]0x88,%f16	! %f16 = 53000000 6bee6ffe
!	Mem[0000000010081400] = 00000024baa6574c, %f10 = 0000803f 44a20007
	ldda	[%i2+%g0]0x80,%f10	! %f10 = 00000024 baa6574c
!	Mem[000000001004143c] = 80ff3600, %l3 = 000000000000ffff
	ldsb	[%i1+0x03c],%l3		! %l3 = ffffffffffffff80
!	Mem[00000000300c1408] = 02c20000, %l7 = 000000000000000f
	ldsba	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000002
!	Mem[0000000030001400] = ff9bffff, %l7 = 0000000000000002
	ldsba	[%i0+%g0]0x81,%l7	! %l7 = ffffffffffffffff

p0_label_127:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = ffffff80, Mem[0000000010101400] = 00000000 000000d7
	stda	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000 ffffff80
!	%l7 = ffffffffffffffff, Mem[0000000030001400] = ff9bffff
	stha	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = ffffffff
!	%l4 = 00000000000000db, Mem[0000000030001408] = ffffffff
	stwa	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000db
!	%f30 = 22f36cd5, Mem[0000000030181408] = 00000000
	sta	%f30,[%i6+%o4]0x89	! Mem[0000000030181408] = 22f36cd5
!	%l6 = 00000000, %l7 = ffffffff, Mem[0000000010181438] = 0000342a 26d54153, %asi = 80
	stda	%l6,[%i6+0x038]%asi	! Mem[0000000010181438] = 00000000 ffffffff
!	Mem[0000000030101408] = 4d71d56b, %l3 = 00000000ffffff80
	swapa	[%i4+%o4]0x81,%l3	! %l3 = 000000004d71d56b
!	%f30 = 22f36cd5, Mem[0000000010001404] = 1c3bc253
	sta	%f30,[%i0+0x004]%asi	! Mem[0000000010001404] = 22f36cd5
!	Code Fragment 4, seed = 311169
p0_fragment_16:
!	%l0 = 0000000000000000
	setx	0xc995b203900dcd1e,%g7,%l0 ! %l0 = c995b203900dcd1e
!	%l1 = 00000000000000ff
	setx	0x8d1205fa00814fc9,%g7,%l1 ! %l1 = 8d1205fa00814fc9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c995b203900dcd1e
	setx	0xed662d452ed2ee84,%g7,%l0 ! %l0 = ed662d452ed2ee84
!	%l1 = 8d1205fa00814fc9
	setx	0x0e0bf504a3e52c4f,%g7,%l1 ! %l1 = 0e0bf504a3e52c4f
p0_fragment_16_end:
!	%l7 = ffffffffffffffff, Mem[0000000030081400] = 00000000
	stba	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff
!	%l6 = 0000000000000000, Mem[0000000030101410] = ebffa24f
	stwa	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000

p0_label_128:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff000000, %l1 = 0e0bf504a3e52c4f
	ldsha	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081410] = ffcc0000, %l4 = 00000000000000db
	lduha	[%i2+%o5]0x80,%l4	! %l4 = 000000000000ffcc
!	Mem[0000000021800040] = 411a5158, %l0 = ed662d452ed2ee84, %asi = 80
	ldsba	[%o3+0x040]%asi,%l0	! %l0 = 0000000000000041
!	Mem[00000000300c1410] = d700e03a000000ff, %l1 = 0000000000000000
	ldxa	[%i3+%o5]0x89,%l1	! %l1 = d700e03a000000ff
!	Mem[0000000010041400] = dbffffff, %l6 = 0000000000000000
	ldsha	[%i1+%g0]0x80,%l6	! %l6 = ffffffffffffdbff
!	Mem[0000000030141408] = 0f0000003cf42099, %l4 = 000000000000ffcc
	ldxa	[%i5+%o4]0x81,%l4	! %l4 = 0f0000003cf42099
!	Mem[0000000010101400] = 00000000, %l6 = ffffffffffffdbff
	lduwa	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l5 = 000000004fa2ffeb
	lduba	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181428] = 00000000, %l5 = 0000000000000000, %asi = 80
	ldswa	[%i6+0x028]%asi,%l5	! %l5 = 0000000000000000
!	Mem[000000001014142c] = 3ae000d7, %l0 = 0000000000000041, %asi = 80
	lduwa	[%i5+0x02c]%asi,%l0	! %l0 = 000000003ae000d7

p0_label_129:
!	Starting 10 instruction Store Burst
!	%f11 = baa6574c, Mem[00000000300c1408] = 02c20000
	sta	%f11,[%i3+%o4]0x81	! Mem[00000000300c1408] = baa6574c
!	Mem[0000000010141434] = f4d9ff63, %l0 = 3ae000d7, %l0 = 3ae000d7
	add	%i5,0x34,%g1
	casa	[%g1]0x80,%l0,%l0	! %l0 = 00000000f4d9ff63
!	%l3 = 000000004d71d56b, Mem[0000000030041410] = ff0000ff
	stwa	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = 4d71d56b
!	%l4 = 0f0000003cf42099, Mem[0000000010181408] = ffffffff
	stha	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = ffff2099
!	%l2 = 0000000000000000, Mem[0000000010041410] = 1e000000
	stwa	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	%l2 = 0000000000000000, Mem[00000000100c1410] = fe6fee6b
	stba	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 006fee6b
!	Mem[0000000010141410] = ff000000, %f0  = 00000000
	lda	[%i5+%o5]0x88,%f0 	! %f0 = ff000000
!	Mem[0000000010101400] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = 4c57a6ba, %l1 = 00000000000000ff
	swapa	[%i3+%o4]0x89,%l1	! %l1 = 000000004c57a6ba
!	%f26 = ffffffdb acf11f77, %l1 = 000000004c57a6ba
!	Mem[0000000010041420] = 0000000000000045
	add	%i1,0x020,%g1
	stda	%f26,[%g1+%l1]ASI_PST8_P ! Mem[0000000010041420] = ff00ffdbac001f45

p0_label_130:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00000000000000ff, %f26 = ffffffdb acf11f77
	ldda	[%i3+%o4]0x89,%f26	! %f26 = 00000000 000000ff
!	Mem[0000000030101408] = ffffff80, %l6 = 0000000000000000
	ldsba	[%i4+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	%f14 = 4c57a6ba 9516922b, %f25 = 00d40000
	fdtoi	%f14,%f25		! %f25 = 7fffffff
!	Mem[0000000030181408] = d56cf322, %l6 = ffffffffffffffff
	lduha	[%i6+%o4]0x81,%l6	! %l6 = 000000000000d56c
!	Mem[0000000020800000] = 00d40898, %l6 = 000000000000d56c
	ldsh	[%o1+%g0],%l6		! %l6 = 00000000000000d4
!	Mem[0000000010001400] = ff9bffff, %l4 = 0f0000003cf42099
	lduba	[%i0+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041410] = 00000000, %l7 = ffffffffffffffff
	ldswa	[%i1+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081400] = 00000024baa6574c, %l0 = 00000000f4d9ff63
	ldxa	[%i2+%g0]0x80,%l0	! %l0 = 00000024baa6574c
!	Mem[000000001018140d] = 000000d4, %l7 = 0000000000000000, %asi = 80
	lduba	[%i6+0x00d]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041434] = 1effaf8d, %f13 = 655b1fbd
	ld	[%i1+0x034],%f13	! %f13 = 1effaf8d

p0_label_131:
!	Starting 10 instruction Store Burst
!	%f11 = baa6574c, Mem[0000000010101410] = 9516922b
	sta	%f11,[%i4+%o5]0x88	! Mem[0000000010101410] = baa6574c
!	%l0 = baa6574c, %l1 = 4c57a6ba, Mem[00000000300c1410] = ff000000 3ae000d7
	stda	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = baa6574c 4c57a6ba
!	%l1 = 000000004c57a6ba, Mem[0000000010081410] = 000000000000ccff
	stxa	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000004c57a6ba
!	%f9  = 51262701, Mem[0000000030141410] = 0fe206e4
	sta	%f9 ,[%i5+%o5]0x89	! Mem[0000000030141410] = 51262701
!	%l1 = 000000004c57a6ba, Mem[000000001018140f] = 000000d4
	stb	%l1,[%i6+0x00f]		! Mem[000000001018140c] = 000000ba
!	%l2 = 00000000, %l3 = 4d71d56b, Mem[0000000010141408] = 00000000 ccff0000
	stda	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 4d71d56b
!	%l1 = 000000004c57a6ba, Mem[0000000010181408] = 9920ffff
	stba	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = ba20ffff
!	Mem[0000000020800041] = ffffe0c8, %l5 = 0000000000000000
	ldstuba	[%o1+0x041]%asi,%l5	! %l5 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[00000000201c0000] = ff3a2c68, %asi = 80
	stba	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = 003a2c68
!	%f16 = 53000000, Mem[0000000010041400] = dbffffff
	sta	%f16,[%i1+%g0]0x80	! Mem[0000000010041400] = 53000000

p0_label_132:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00000000, %l0 = 00000024baa6574c
	ldsha	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181408] = ffff20ba, %l3 = 000000004d71d56b
	ldsha	[%i6+%o4]0x88,%l3	! %l3 = 00000000000020ba
!	%f11 = baa6574c, %f12 = 3ae000d7
	fsqrts	%f11,%f12		! %f12 = 7fffffff
!	Mem[0000000030181408] = d56cf322 ffffffff, %l0 = 00000000, %l1 = 4c57a6ba
	ldda	[%i6+%o4]0x81,%l0	! %l0 = 00000000d56cf322 00000000ffffffff
!	Mem[0000000030101408] = 000000fe80ffffff, %f28 = 771ff1ac 00000000
	ldda	[%i4+%o4]0x89,%f28	! %f28 = 000000fe 80ffffff
!	Mem[00000000100c1438] = ffffffff, %l7 = 0000000000000000
	ldub	[%i3+0x038],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030141400] = ffffffff, %f3  = 000000ff
	lda	[%i5+%g0]0x81,%f3 	! %f3 = ffffffff
!	Mem[0000000030181400] = ffff0000, %f28 = 000000fe
	lda	[%i6+%g0]0x81,%f28	! %f28 = ffff0000
!	Mem[0000000010081410] = 4c57a6ba, %l5 = 00000000000000ff
	ldsha	[%i2+%o5]0x88,%l5	! %l5 = ffffffffffffa6ba
!	Mem[0000000010181414] = ebffa24f, %l1 = 00000000ffffffff
	lduh	[%i6+0x014],%l1		! %l1 = 000000000000ebff

p0_label_133:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 00000000, %l6 = 00000000000000d4
	ldstuba	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000000
!	%l3 = 00000000000020ba, Mem[00000000300c1408] = ff000000
	stwa	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000020ba
!	Mem[0000000030041408] = dbff0442, %l4 = 00000000000000ff
	swapa	[%i1+%o4]0x89,%l4	! %l4 = 00000000dbff0442
!	Mem[00000000300c1410] = baa6574c, %l2 = 0000000000000000
	swapa	[%i3+%o5]0x81,%l2	! %l2 = 00000000baa6574c
!	%l4 = 00000000dbff0442, Mem[0000000030141400] = ffffffff
	stba	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffff42
!	%f28 = ffff0000 80ffffff, Mem[0000000030041408] = 000000ff ffffffff
	stda	%f28,[%i1+%o4]0x89	! Mem[0000000030041408] = ffff0000 80ffffff
!	Mem[0000000010181420] = dbff044252980331, %l5 = ffffffffffffa6ba, %l0 = 00000000d56cf322
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l5,%l0	! %l0 = dbff044252980331
!	Mem[00000000100c1438] = ffffffff3ae000d7, %l2 = 00000000baa6574c, %l5 = ffffffffffffa6ba
	add	%i3,0x38,%g1
	casxa	[%g1]0x80,%l2,%l5	! %l5 = ffffffff3ae000d7
!	%l5 = ffffffff3ae000d7, Mem[0000000030041400] = 00000000
	stha	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = 00d70000
!	%l7 = 00000000000000ff, Mem[0000000030081408] = 00000000
	stba	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = ff000000

p0_label_134:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 000000ff, %l1 = 000000000000ebff
	ldsba	[%i4+%g0]0x88,%l1	! %l1 = ffffffffffffffff
!	%f27 = 000000ff, %f28 = ffff0000
	fcmpes	%fcc3,%f27,%f28		! %fcc3 = 3
!	Mem[0000000010101408] = 00000000, %l2 = 00000000baa6574c
	lduba	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000021800000] = ff2b8528, %l6 = 0000000000000000
	ldsh	[%o3+%g0],%l6		! %l6 = ffffffffffffff2b
!	Mem[0000000010101400] = ff000000 ffffff80, %l6 = ffffff2b, %l7 = 000000ff
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 00000000ff000000 00000000ffffff80
!	Mem[00000000100c1408] = 00000000ffff9bff, %f10 = 00000024 baa6574c
	ldda	[%i3+%o4]0x88,%f10	! %f10 = 00000000 ffff9bff
!	%l6 = 00000000ff000000, %l6 = 00000000ff000000, %y  = 0fe206e4
	umul	%l6,%l6,%l4		! %l4 = fe01000000000000, %y = fe010000
!	Mem[00000000300c1410] = 00000000, %l4 = fe01000000000000
	lduwa	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l0 = dbff044252980331
	ldsha	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000010081400] = 00000024 baa6574c ffff9bff fe000000
!	Mem[0000000010081410] = baa6574c 00000000 0000803f 44a20007
!	Mem[0000000010081420] = 0000d400 9516922b 771ff1ac fe6fee6b
!	Mem[0000000010081430] = 8dafd41e acf11f77 f3299c52 d56cf322
	ldda	[%i2+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010081400

p0_label_135:
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffffff, Mem[0000000030181400] = ffff0000
	stwa	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = ffffffff
!	%l0 = 0000000000000000, Mem[0000000030081408] = ff000000000000ff
	stxa	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000000000000000
	membar	#Sync			! Added by membar checker (21)
!	%l0 = 00000000, %l1 = ffffffff, Mem[0000000010081408] = ffff9bff fe000000
	stda	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000 ffffffff
!	%l3 = 00000000000020ba, Mem[0000000010001406] = 22f36cd5, %asi = 80
	stha	%l3,[%i0+0x006]%asi	! Mem[0000000010001404] = 22f320ba
!	%l0 = 00000000, %l1 = ffffffff, Mem[00000000100c1408] = ffff9bff 00000000
	stda	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 ffffffff
!	%l5 = ffffffff3ae000d7, Mem[00000000211c0001] = 02c2b4f8, %asi = 80
	stba	%l5,[%o2+0x001]%asi	! Mem[00000000211c0000] = 02d7b4f8
!	Mem[00000000201c0000] = 003a2c68, %l0 = 0000000000000000
	ldstub	[%o0+%g0],%l0		! %l0 = 0000000000000000
!	Mem[0000000010001408] = ebffa24f, %l2 = 0000000000000000
	ldstuba	[%i0+%o4]0x88,%l2	! %l2 = 000000000000004f
!	%l3 = 00000000000020ba, Mem[00000000100c1410] = 6bee6f00
	stba	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = 6bee6fba
!	Mem[0000000030141400] = ffffff42, %l7 = 00000000ffffff80
	swapa	[%i5+%g0]0x89,%l7	! %l7 = 00000000ffffff42

p0_label_136:
!	Starting 10 instruction Load Burst
!	%f21 = 00000000, %f17 = baa6574c
	fcmps	%fcc1,%f21,%f17		! %fcc1 = 2
!	Mem[0000000030141400] = ffffff80, %f21 = 00000000
	lda	[%i5+%g0]0x89,%f21	! %f21 = ffffff80
!	Mem[0000000030081410] = 000000ff, %l6 = 00000000ff000000
	lduba	[%i2+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041429] = 0c0000ff, %l5 = ffffffff3ae000d7
	ldsb	[%i1+0x029],%l5		! %l5 = 0000000000000000
!	Mem[0000000030181408] = d56cf322, %l0 = 0000000000000000
	ldswa	[%i6+%o4]0x81,%l0	! %l0 = ffffffffd56cf322
!	Mem[0000000030101410] = 00000000 00000000, %l2 = 0000004f, %l3 = 000020ba
	ldda	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000030081400] = dabf3c32000000ff, %f22 = 0000803f 44a20007
	ldda	[%i2+%g0]0x89,%f22	! %f22 = dabf3c32 000000ff
!	Mem[0000000010141400] = 00000000, %f30 = f3299c52
	lda	[%i5+%g0]0x88,%f30	! %f30 = 00000000
!	Mem[0000000020800000] = 00d40898, %l4 = 0000000000000000
	lduh	[%o1+%g0],%l4		! %l4 = 00000000000000d4
!	Mem[0000000030101408] = ffffff80fe000000, %l4 = 00000000000000d4
	ldxa	[%i4+%o4]0x81,%l4	! %l4 = ffffff80fe000000

p0_label_137:
!	Starting 10 instruction Store Burst
!	%f30 = 00000000 d56cf322, Mem[0000000010081410] = baa6574c 00000000
	stda	%f30,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000 d56cf322
!	%f17 = baa6574c, Mem[000000001010143c] = 53600fa3
	st	%f17,[%i4+0x03c]	! Mem[000000001010143c] = baa6574c
!	%l1 = ffffffffffffffff, Mem[0000000010181408] = ba20ffff000000ba
	stxa	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = ffffffffffffffff
!	Mem[0000000020800041] = ffffe0c8, %l4 = ffffff80fe000000
	ldstuba	[%o1+0x041]%asi,%l4	! %l4 = 00000000000000ff
!	%l0 = ffffffffd56cf322, Mem[00000000100c1424] = 02c21391, %asi = 80
	stba	%l0,[%i3+0x024]%asi	! Mem[00000000100c1424] = 22c21391
!	%l3 = 0000000000000000, Mem[0000000030081400] = ff000000323cbfda
	stxa	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000000000000000
!	Mem[000000001000142c] = 5956a545, %l7 = ffffff42, %l2 = 00000000
	add	%i0,0x2c,%g1
	casa	[%g1]0x80,%l7,%l2	! %l2 = 000000005956a545
!	Mem[0000000010141408] = ff000000, %l7 = 00000000ffffff42
	swapa	[%i5+%o4]0x80,%l7	! %l7 = 00000000ff000000
!	Mem[00000000100c1410] = ba6fee6b, %l5 = 0000000000000000, %asi = 80
	swapa	[%i3+0x010]%asi,%l5	! %l5 = 00000000ba6fee6b
!	Mem[0000000010141408] = ffffff42, %l7 = 00000000ff000000
	ldstuba	[%i5+%o4]0x80,%l7	! %l7 = 00000000000000ff

p0_label_138:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ff000000329bffff, %l2 = 000000005956a545, %asi = 80
	ldxa	[%i0+0x010]%asi,%l2	! %l2 = ff000000329bffff
!	Mem[0000000010081428] = 771ff1ac fe6fee6b, %l6 = 000000ff, %l7 = 000000ff, %asi = 80
	ldda	[%i2+0x028]%asi,%l6	! %l6 = 00000000771ff1ac 00000000fe6fee6b
!	Mem[0000000021800000] = ff2b8528, %l0 = ffffffffd56cf322
	ldsh	[%o3+%g0],%l0		! %l0 = ffffffffffffff2b
!	Mem[0000000010041400] = 53000000, %l1 = ffffffffffffffff
	ldsha	[%i1+%g0]0x80,%l1	! %l1 = 0000000000005300
!	Mem[0000000010141410] = 000000ff106a0000, %l7 = 00000000fe6fee6b, %asi = 80
	ldxa	[%i5+0x010]%asi,%l7	! %l7 = 000000ff106a0000
!	%l3 = 0000000000000000, imm = fffffffffffff21d, %l1 = 0000000000005300
	orn	%l3,-0xde3,%l1		! %l1 = 0000000000000de2
!	Mem[0000000010141410] = ff000000, %l7 = 000000ff106a0000
	lduha	[%i5+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001400] = ba20f322 ffff9bff, %l0 = ffffff2b, %l1 = 00000de2
	ldda	[%i0+%g0]0x88,%l0	! %l0 = 00000000ffff9bff 00000000ba20f322
!	Mem[0000000010041408] = db000000ff000000, %l4 = 00000000000000ff
	ldxa	[%i1+%o4]0x80,%l4	! %l4 = db000000ff000000
!	%f5  = ffff9bff, %f29 = acf11f77
	fcmps	%fcc2,%f5 ,%f29		! %fcc2 = 3

p0_label_139:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ba20f322, Mem[0000000030081400] = 00000000
	stha	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = f3220000
!	Mem[0000000010141404] = ff000000, %l6 = 771ff1ac, %l1 = ba20f322
	add	%i5,0x04,%g1
	casa	[%g1]0x80,%l6,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010141400] = 00000000, %l6 = 00000000771ff1ac
	ldstuba	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000030001400] = ffffffff
	stba	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 00ffffff
!	%l0 = 00000000ffff9bff, imm = fffffffffffff519, %l0 = 00000000ffff9bff
	subc	%l0,-0xae7,%l0		! %l0 = 00000000ffffa6e6
!	Mem[0000000010181408] = ffffffff, %l4 = db000000ff000000
	ldstuba	[%i6+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%l5 = 00000000ba6fee6b, Mem[0000000030141400] = 80ffffff
	stba	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 6bffffff
!	%f12 = 7fffffff, Mem[0000000030041408] = 80ffffff
	sta	%f12,[%i1+%o4]0x89	! Mem[0000000030041408] = 7fffffff
!	%f5  = ffff9bff, Mem[0000000030141410] = 51262701
	sta	%f5 ,[%i5+%o5]0x89	! Mem[0000000030141410] = ffff9bff
!	%f10 = 00000000, %f30 = 00000000, %f16 = 00000024 baa6574c
	fsmuld	%f10,%f30,%f16		! %f16 = 00000000 00000000

p0_label_140:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 4c57a6ba, %l1 = 00000000ff000000
	lduwa	[%i4+%o5]0x80,%l1	! %l1 = 000000004c57a6ba
!	Mem[0000000030001410] = 000006e4, %l6 = 0000000000000000
	ldsha	[%i0+%o5]0x89,%l6	! %l6 = 00000000000006e4
!	Mem[0000000030001408] = db0000005b0000ff, %f30 = 00000000 d56cf322
	ldda	[%i0+%o4]0x81,%f30	! %f30 = db000000 5b0000ff
!	Mem[0000000030181408] = d56cf322 ffffffff, %l6 = 000006e4, %l7 = 00000000
	ldda	[%i6+%o4]0x81,%l6	! %l6 = 00000000d56cf322 00000000ffffffff
!	Mem[0000000030001410] = d700e03a000006e4, %f4  = 00000000 ffff9bff
	ldda	[%i0+%o5]0x89,%f4 	! %f4  = d700e03a 000006e4
!	Mem[0000000010081438] = f3299c52 d56cf322, %l6 = d56cf322, %l7 = ffffffff, %asi = 80
	ldda	[%i2+0x038]%asi,%l6	! %l6 = 00000000f3299c52 00000000d56cf322
!	Mem[0000000010081400] = 00000024, %l6 = 00000000f3299c52
	ldsba	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181415] = ebffa24f, %l5 = 00000000ba6fee6b, %asi = 80
	lduba	[%i6+0x015]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081408] = 00000000, %l7 = 00000000d56cf322
	lduwa	[%i2+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081435] = acf11f77, %l7 = 0000000000000000, %asi = 80
	ldsba	[%i2+0x035]%asi,%l7	! %l7 = fffffffffffffff1

p0_label_141:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ffffa6e6, Mem[00000000201c0001] = ff3a2c68
	stb	%l0,[%o0+0x001]		! Mem[00000000201c0000] = ffe62c68
!	%l2 = ff000000329bffff, Mem[0000000030141408] = 0f000000
	stba	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = ff000000
!	Mem[0000000030141400] = 6bffffff, %l0 = 00000000ffffa6e6
	swapa	[%i5+%g0]0x81,%l0	! %l0 = 000000006bffffff
!	Mem[0000000010081400] = 24000000, %l5 = 00000000000000ff
	swapa	[%i2+%g0]0x88,%l5	! %l5 = 0000000024000000
!	%f9  = 51262701, %f20 = baa6574c
	fsqrts	%f9 ,%f20		! %f20 = 484e3d7b
!	Mem[0000000010101408] = 00000000, %l7 = fffffffffffffff1
	ldstuba	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000
!	%f10 = 00000000, Mem[0000000030181410] = 7efd6b25
	sta	%f10,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	%l0 = 000000006bffffff, Mem[0000000030181408] = d56cf322
	stwa	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 6bffffff
!	%f8  = 5441c3b0 51262701, %l7 = 0000000000000000
!	Mem[0000000010101400] = ff000000ffffff80
	stda	%f8,[%i4+%l7]ASI_PST16_PL ! Mem[0000000010101400] = ff000000ffffff80
!	%l1 = 000000004c57a6ba, Mem[0000000010181408] = ffffffffffffffff
	stxa	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000004c57a6ba

p0_label_142:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ffffff42, %l4 = 00000000000000ff
	lduha	[%i5+%o4]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[0000000020800000] = 00d40898, %l2 = ff000000329bffff
	lduh	[%o1+%g0],%l2		! %l2 = 00000000000000d4
!	Mem[0000000030141408] = 000000ff, %l5 = 0000000024000000
	lduba	[%i5+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101410] = 00000000, %l3 = 0000000000000000
	ldsba	[%i4+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l3 = 0000000000000000
	ldsba	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = e406e20f, %l0 = 000000006bffffff
	ldsba	[%i6+%g0]0x88,%l0	! %l0 = 000000000000000f
!	Mem[0000000030081400] = f322000000000000, %f26 = 771ff1ac fe6fee6b
	ldda	[%i2+%g0]0x81,%f26	! %f26 = f3220000 00000000
!	Mem[0000000010041400] = 5300000000000032, %l3 = 0000000000000000
	ldxa	[%i1+%g0]0x80,%l3	! %l3 = 5300000000000032
!	Mem[0000000010081418] = 0000803f, %f27 = 00000000
	lda	[%i2+0x018]%asi,%f27	! %f27 = 0000803f
!	Mem[0000000030141400] = e6a6ffff, %f25 = 9516922b
	lda	[%i5+%g0]0x89,%f25	! %f25 = e6a6ffff

p0_label_143:
!	Starting 10 instruction Store Burst
!	%f17 = 00000000, Mem[0000000030181410] = 00000000
	sta	%f17,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	Mem[0000000010001400] = ffff9bff, %l3 = 5300000000000032
	ldstuba	[%i0+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	%f21 = ffffff80, Mem[0000000030101400] = d700e03a
	sta	%f21,[%i4+%g0]0x81	! Mem[0000000030101400] = ffffff80
!	Mem[0000000010001400] = ffff9bff, %l6 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	%f11 = ffff9bff, Mem[0000000010041400] = 53000000
	st	%f11,[%i1+%g0]		! Mem[0000000010041400] = ffff9bff
!	%l7 = 0000000000000000, %l1 = 000000004c57a6ba, %l0 = 000000000000000f
	udivx	%l7,%l1,%l0		! %l0 = 0000000000000000
!	Mem[0000000010101422] = 5441c3b0, %l7 = 0000000000000000
	ldstuba	[%i4+0x022]%asi,%l7	! %l7 = 00000000000000c3
!	Mem[0000000030001400] = 00ffffff, %l0 = 0000000000000000
	ldstuba	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041400] = ffff9bff, %l2 = 00000000000000d4
	swapa	[%i1+%g0]0x80,%l2	! %l2 = 00000000ffff9bff
!	Mem[0000000030001408] = db000000, %l0 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l0	! %l0 = 00000000db000000

p0_label_144:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ff000000, %l2 = 00000000ffff9bff
	ldswa	[%i5+%o5]0x88,%l2	! %l2 = ffffffffff000000
!	Mem[00000000201c0001] = ffe62c68, %l5 = 00000000000000ff
	ldsb	[%o0+0x001],%l5		! %l5 = ffffffffffffffe6
!	%l6 = 00000000000000ff, imm = 0000000000000dda, %l6 = 00000000000000ff
	addc	%l6,0xdda,%l6		! %l6 = 0000000000000ed9
!	Mem[0000000030001408] = 00000000, %l1 = 000000004c57a6ba
	ldsha	[%i0+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141408] = 9920f43c000000ff, %f4  = d700e03a 000006e4
	ldda	[%i5+%o4]0x89,%f4 	! %f4  = 9920f43c 000000ff
!	Mem[0000000010101410] = ff9bffff baa6574c, %l2 = ff000000, %l3 = 000000ff
	ldda	[%i4+%o5]0x88,%l2	! %l2 = 00000000baa6574c 00000000ff9bffff
!	Mem[0000000010001410] = ff000000, %l3 = 00000000ff9bffff
	lduha	[%i0+%o5]0x80,%l3	! %l3 = 000000000000ff00
!	Mem[0000000030181400] = ffffffff00000000, %l2 = 00000000baa6574c
	ldxa	[%i6+%g0]0x81,%l2	! %l2 = ffffffff00000000
!	%l3 = 000000000000ff00, %l0 = 00000000db000000, %y  = fe010000
	sdiv	%l3,%l0,%l6		! %l6 = 000000000dcf914c
	mov	%l0,%y			! %y = db000000
!	Mem[0000000021800140] = ffcf5a18, %l6 = 000000000dcf914c, %asi = 80
	ldsba	[%o3+0x140]%asi,%l6	! %l6 = ffffffffffffffff

p0_label_145:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = db000000, %l2 = 0000000000000000
	swapa	[%i1+%o4]0x80,%l2	! %l2 = 00000000db000000
!	%f8  = 5441c3b0 51262701, %l5 = ffffffffffffffe6
!	Mem[0000000010101418] = 7f0f5be2acf11f77
	add	%i4,0x018,%g1
	stda	%f8,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010101418] = 7f0f5be2b0c34154
!	%l6 = ffffffff, %l7 = 000000c3, Mem[0000000010101408] = ff000000 000000ff
	std	%l6,[%i4+%o4]		! Mem[0000000010101408] = ffffffff 000000c3
!	Mem[0000000010081410] = 00000000, %l5 = ffffffffffffffe6
	ldstuba	[%i2+%o5]0x80,%l5	! %l5 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000030101400] = 80ffffff
	stha	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 80ff0000
!	%l7 = 00000000000000c3, Mem[00000000300c1408] = 000020ba00000000
	stxa	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000000000c3
!	%l6 = ffffffff, %l7 = 000000c3, Mem[0000000010101420] = 5441ffb0 51ff2701
	std	%l6,[%i4+0x020]		! Mem[0000000010101420] = ffffffff 000000c3
!	%f28 = 8dafd41e, Mem[0000000010041410] = 00000000
	sta	%f28,[%i1+%o5]0x80	! Mem[0000000010041410] = 8dafd41e
!	Mem[0000000010141400] = 000000ff, %l3 = 000000000000ff00
	ldstuba	[%i5+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	%l6 = ffffffffffffffff, Mem[0000000030041408] = 7fffffff
	stba	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 7fffffff

p0_label_146:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ff00005b00000000, %f0  = ff000000 256bfd7e
	ldda	[%i0+%o4]0x89,%f0 	! %f0  = ff00005b 00000000
!	Mem[0000000030001408] = 00000000, %l0 = 00000000db000000
	lduwa	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l0 = 0000000000000000
	lduha	[%i1+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = 0000ff80, %l3 = 00000000000000ff
	lduha	[%i4+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l1 = 0000000000000000
	lduba	[%i3+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l0 = 0000000000000000
	lduba	[%i3+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000218001c1] = 17ffc678, %l5 = 0000000000000000, %asi = 80
	ldsba	[%o3+0x1c1]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030001410] = d700e03a000006e4, %f20 = 484e3d7b ffffff80
	ldda	[%i0+%o5]0x89,%f20	! %f20 = d700e03a 000006e4
!	Mem[00000000100c1424] = 22c21391, %l6 = ffffffffffffffff, %asi = 80
	lduwa	[%i3+0x024]%asi,%l6	! %l6 = 0000000022c21391
!	Mem[0000000010181410] = ff000000, %l0 = 0000000000000000
	lduwa	[%i6+%o5]0x88,%l0	! %l0 = 00000000ff000000

p0_label_147:
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffffff, %l2 = 00000000db000000, %y  = db000000
	sdiv	%l5,%l2,%l6		! %l6 = 000000007fffffff
	mov	%l0,%y			! %y = ff000000
!	%l0 = 00000000ff000000, Mem[0000000030181408] = ffffff6b
	stba	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffff00
!	%l2 = 00000000db000000, Mem[0000000030181400] = ffffffff
	stwa	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = db000000
!	%l1 = 0000000000000000, Mem[0000000030081410] = ff00000000007300
	stxa	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000000000000000
!	Mem[0000000010181400] = 0fe206e4 000000d4 00000000 4c57a6ba
!	%f0  = ff00005b 00000000 00000000 ffffffff
!	%f4  = 9920f43c 000000ff ff2affff 00000000
!	%f8  = 5441c3b0 51262701 00000000 ffff9bff
!	%f12 = 7fffffff 1effaf8d 4c57a6ba 9516922b
	stda	%f0 ,[%i6+%g0]ASI_BLK_AIUP	! Block Store to 0000000010181400
!	Mem[0000000010041408] = 00000000, %l7 = 00000000000000c3
	swapa	[%i1+%o4]0x88,%l7	! %l7 = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000030001410] = 000006e4
	stwa	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	%l0 = 00000000ff000000, Mem[0000000010101430] = 3ae000d7655b1fbd, %asi = 80
	stxa	%l0,[%i4+0x030]%asi	! Mem[0000000010101430] = 00000000ff000000
!	Mem[00000000100c1400] = 0000ffff, %l2 = 00000000db000000
	ldstuba	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000010181436] = 1effaf8d, %l2 = 0000000000000000
	ldstuba	[%i6+0x036]%asi,%l2	! %l2 = 00000000000000af

p0_label_148:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ffffff80, %f11 = ffff9bff
	lda	[%i4+%o4]0x81,%f11	! %f11 = ffffff80
!	Mem[00000000100c1438] = ffffffff, %l7 = 0000000000000000, %asi = 80
	lduha	[%i3+0x038]%asi,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010001408] = ffa2ffeb00000000, %l6 = 000000007fffffff
	ldxa	[%i0+%o4]0x80,%l6	! %l6 = ffa2ffeb00000000
!	Mem[0000000010181408] = 00000000ffffffff, %f24 = 0000d400 e6a6ffff
	ldd	[%i6+%o4],%f24		! %f24 = 00000000 ffffffff
!	%l1 = 0000000000000000, immd = fffff0e1, %y  = ff000000
	udiv	%l1,-0xf1f,%l5		! %l5 = 00000000ff000f0f
	mov	%l0,%y			! %y = ff000000
!	Mem[0000000010081410] = 000000ff, %l5 = 00000000ff000f0f
	lduwa	[%i2+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081410] = 000000ff, %l5 = 00000000000000ff
	ldswa	[%i2+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001408] = 00000000, %l5 = 00000000000000ff
	lduba	[%i0+%o4]0x81,%l5	! %l5 = 0000000000000000
!	%l4 = 000000000000ffff, %l3 = 0000000000000000, %l0 = 00000000ff000000
	udivx	%l4,%l3,%l0		! Div by zero, %l0 = 00000000ff000028
!	Mem[0000000030001410] = 00000000, %l5 = 0000000000000000
	ldsha	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000000

p0_label_149:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1434] = 6bd5714d, %l1 = 0000000000000000
	swap	[%i3+0x034],%l1		! %l1 = 000000006bd5714d
!	%l3 = 0000000000000000, Mem[00000000100c141b] = ffffffdb, %asi = 80
	stba	%l3,[%i3+0x01b]%asi	! Mem[00000000100c1418] = ffffff00
!	%l7 = 000000000000ffff, Mem[0000000010041400] = 32000000d4000000
	stxa	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000000000ffff
!	%l5 = 0000000000000000, Mem[0000000030101400] = 0000ff80ffff9bff
	stxa	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000000000
!	Mem[0000000030041400] = 00d70000, %l5 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l5	! %l5 = 0000000000d70000
!	%l2 = 00000000000000af, Mem[00000000211c0000] = 02d7b4f8
	sth	%l2,[%o2+%g0]		! Mem[00000000211c0000] = 00afb4f8
!	%l4 = 000000000000ffff, Mem[0000000030141400] = ff00005be6a6ffff
	stxa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000000000ffff
!	%l2 = 00000000000000af, immd = 00000000000005dc, %l108 = 0000000000000005
	sdivx	%l2,0x5dc,%l5		! %l5 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l0 = 00000000ff000028
	swapa	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000000
!	%l2 = 000000af, %l3 = 00000000, Mem[0000000010081410] = 000000ff 22f36cd5
	stda	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000af 00000000

p0_label_150:
!	Starting 10 instruction Load Burst
!	%l0 = 0000000000000000, %l7 = 000000000000ffff, %l7 = 000000000000ffff
	xor	%l0,%l7,%l7		! %l7 = 000000000000ffff
!	Mem[0000000010101400] = 000000ff, %l5 = 0000000000000000
	ldsba	[%i4+%g0]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030101408] = ffffff80, %l6 = ffa2ffeb00000000
	ldsba	[%i4+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000100c1410] = 00000000, %f22 = dabf3c32
	lda	[%i3+%o5]0x88,%f22	! %f22 = 00000000
!	Mem[00000000100c1408] = 00000000, %l6 = ffffffffffffffff
	lduwa	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[000000001018142c] = ffff9bff, %l4 = 000000000000ffff
	ldsh	[%i6+0x02c],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030141408] = 000000ff, %f21 = 000006e4
	lda	[%i5+%o4]0x89,%f21	! %f21 = 000000ff
!	Mem[0000000030101410] = 00000000, %l6 = 0000000000000000
	ldsba	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181408] = 00ffffff, %l5 = ffffffffffffffff
	ldsha	[%i6+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181408] = 00000000, %l0 = 0000000000000000
	lduwa	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000000

!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 0000000000000000
	bne	%xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 000000006bd5714d
	bne	%xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 00000000000000af
	bne	%xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000000000
	bne	%xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be ffffffffffffffff
	bne	%xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000000000ff
	bne	%xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000000
	bne	%xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 000000000000ffff
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
	cmp	%l0,%l1			! %f0  should be ff00005b 00000000
	bne	%xcc,p0_freg_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00000000 ffffffff
	bne	%xcc,p0_freg_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 9920f43c 000000ff
	bne	%xcc,p0_freg_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be ff2affff 00000000
	bne	%xcc,p0_freg_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 5441c3b0 51262701
	bne	%xcc,p0_freg_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000000 ffffff80
	bne	%xcc,p0_freg_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 7fffffff 1effaf8d
	bne	%xcc,p0_freg_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 4c57a6ba 9516922b
	bne	%xcc,p0_freg_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00000000 00000000
	bne	%xcc,p0_freg_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be ffff9bff fe000000
	bne	%xcc,p0_freg_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be d700e03a 000000ff
	bne	%xcc,p0_freg_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 00000000 000000ff
	bne	%xcc,p0_freg_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 00000000 ffffffff
	bne	%xcc,p0_freg_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be f3220000 0000803f
	bne	%xcc,p0_freg_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 8dafd41e acf11f77
	bne	%xcc,p0_freg_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be db000000 5b0000ff
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
	ldx	[%g1+0x000],%l0		! %l0 = c643531d8a92da56
	ldx	[%g1+0x008],%l1		! %l1 = b3b75f6922eb3781
	ldx	[%g1+0x010],%l2		! %l2 = 411c540a78fca8bc
	ldx	[%g1+0x018],%l3		! %l3 = ec04c23264183107
	ldx	[%g1+0x020],%l4		! %l4 = 1dbae689313b6362
	ldx	[%g1+0x028],%l5		! %l5 = 77afbd079aab62cd
	ldx	[%g1+0x030],%l6		! %l6 = 712d7a8a889fe248
	ldx	[%g1+0x038],%l7		! %l7 = 532f2da88dfe24d3

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
	and	%l1,-0x664,%l2
	or	%l1,-0x08e,%l2
	xor	%l1,%l3,%l0
	sub	%l4,-0xbf1,%l4
	jmpl	%o7,%g0
	xnor	%l2,0xea5,%l2
p0_near_0_he:
	jmpl	%o7,%g0
	or	%l1,-0x7c1,%l5
	jmpl	%o7,%g0
	nop
p0_near_0_lo:
	and	%l1,-0x664,%l2
	or	%l1,-0x08e,%l2
	xor	%l1,%l3,%l0
	sub	%l4,-0xbf1,%l4
	jmpl	%o7,%g0
	xnor	%l2,0xea5,%l2
p0_near_0_ho:
	jmpl	%o7,%g0
	or	%l1,-0x7c1,%l5
	jmpl	%o7,%g0
	nop
near0_b2b_h:
	add	%l4,%l6,%l1
	and	%l6,0x356,%l1
	mulx	%l6,%l6,%l0
	fcmps	%fcc3,%f30,%f18
	fitod	%f22,%f16
	jmpl	%o7,%g0
	orn	%l1,0x21c,%l2
near0_b2b_l:
	mulx	%l5,0x839,%l2
	mulx	%l0,%l1,%l6
	fcmps	%fcc3,%f4 ,%f3 
	addc	%l5,0xb52,%l6
	fsubs	%f15,%f15,%f12
	jmpl	%o7,%g0
	fmuls	%f7 ,%f0 ,%f6 
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
	add	%l7,-0xa25,%l0
	fdivs	%f14,%f3 ,%f0 
	jmpl	%o7,%g0
	fdivs	%f1 ,%f0 ,%f7 
p0_near_1_he:
	sdivx	%l5,0xbdc,%l1
	fsubs	%f20,%f21,%f19
	sub	%l7,%l7,%l0
	ldstub	[%i1+0x037],%l4		! Mem[0000000010041437]
	umul	%l3,0x12d,%l6
	jmpl	%o7,%g0
	fdivs	%f23,%f20,%f21
p0_near_1_lo:
	add	%l7,-0xa25,%l0
	fdivs	%f14,%f3 ,%f0 
	jmpl	%o7,%g0
	fdivs	%f1 ,%f0 ,%f7 
p0_near_1_ho:
	sdivx	%l5,0xbdc,%l1
	fsubs	%f20,%f21,%f19
	sub	%l7,%l7,%l0
	ldstub	[%o1+0x037],%l4		! Mem[0000000010041437]
	umul	%l3,0x12d,%l6
	jmpl	%o7,%g0
	fdivs	%f23,%f20,%f21
near1_b2b_h:
	xor	%l3,%l7,%l6
	jmpl	%o7,%g0
	fitos	%f23,%f20
near1_b2b_l:
	fdivs	%f3 ,%f0 ,%f9 
	jmpl	%o7,%g0
	fdivs	%f14,%f6 ,%f1 
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
	sdivx	%l6,%l2,%l0
	fcmps	%fcc3,%f8 ,%f8 
	addc	%l6,-0xb29,%l1
	fadds	%f11,%f7 ,%f7 
	or	%l0,%l3,%l1
	udivx	%l4,%l4,%l7
	sub	%l7,%l7,%l3
	jmpl	%o7,%g0
	sdivx	%l5,%l2,%l3
p0_near_2_he:
	umul	%l0,0x303,%l2
	jmpl	%o7,%g0
	andn	%l7,%l3,%l4
p0_near_2_lo:
	sdivx	%l6,%l2,%l0
	fcmps	%fcc3,%f8 ,%f8 
	addc	%l6,-0xb29,%l1
	fadds	%f11,%f7 ,%f7 
	or	%l0,%l3,%l1
	udivx	%l4,%l4,%l7
	sub	%l7,%l7,%l3
	jmpl	%o7,%g0
	sdivx	%l5,%l2,%l3
p0_near_2_ho:
	umul	%l0,0x303,%l2
	jmpl	%o7,%g0
	andn	%l7,%l3,%l4
near2_b2b_h:
	jmpl	%o7,%g0
	xor	%l0,%l3,%l1
	jmpl	%o7,%g0
	nop
near2_b2b_l:
	jmpl	%o7,%g0
	fcmps	%fcc3,%f2 ,%f1 
	jmpl	%o7,%g0
	nop
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
	stw	%l4,[%i6+0x038]		! Mem[0000000010181438]
	andn	%l5,0x8f3,%l3
	fsqrts	%f15,%f14
	umul	%l6,-0x8e2,%l5
	smul	%l1,-0xec4,%l0
	smul	%l7,%l7,%l3
	xnor	%l2,0x046,%l3
	jmpl	%o7,%g0
	fmuls	%f10,%f8 ,%f2 
p0_near_3_he:
	xnor	%l1,0x940,%l0
	xnor	%l2,0x39b,%l4
	andn	%l3,%l1,%l0
	jmpl	%o7,%g0
	andn	%l2,0x76e,%l3
p0_near_3_lo:
	stw	%l4,[%o6+0x038]		! Mem[0000000010181438]
	andn	%l5,0x8f3,%l3
	fsqrts	%f15,%f14
	umul	%l6,-0x8e2,%l5
	smul	%l1,-0xec4,%l0
	smul	%l7,%l7,%l3
	xnor	%l2,0x046,%l3
	jmpl	%o7,%g0
	fmuls	%f10,%f8 ,%f2 
p0_near_3_ho:
	xnor	%l1,0x940,%l0
	xnor	%l2,0x39b,%l4
	andn	%l3,%l1,%l0
	jmpl	%o7,%g0
	andn	%l2,0x76e,%l3
near3_b2b_h:
	xor	%l6,%l0,%l5
	umul	%l2,%l2,%l2
	jmpl	%o7,%g0
	umul	%l6,%l1,%l1
near3_b2b_l:
	xnor	%l1,%l1,%l3
	andn	%l4,-0xa9b,%l0
	jmpl	%o7,%g0
	smul	%l6,0x170,%l4
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
	fdtos	%f4 ,%f5 
	sdivx	%l6,0x3ae,%l6
	jmpl	%o7,%g0
	andn	%l1,0x0fc,%l7
p0_far_0_he:
	st	%f17,[%i1+0x018]	! Mem[0000000010041418]
	jmpl	%o7,%g0
	and	%l1,%l6,%l6
p0_far_0_lo:
	fdtos	%f4 ,%f5 
	sdivx	%l6,0x3ae,%l6
	jmpl	%o7,%g0
	andn	%l1,0x0fc,%l7
p0_far_0_ho:
	st	%f17,[%o1+0x018]	! Mem[0000000010041418]
	jmpl	%o7,%g0
	and	%l1,%l6,%l6
far0_b2b_h:
	mulx	%l7,0xa68,%l3
	and	%l3,0x20a,%l0
	jmpl	%o7,%g0
	smul	%l0,%l6,%l5
far0_b2b_l:
	xor	%l2,-0x74e,%l2
	fsubs	%f10,%f4 ,%f12
	jmpl	%o7,%g0
	and	%l6,%l0,%l2
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
	jmpl	%o7,%g0
	sdivx	%l4,%l6,%l5
	jmpl	%o7,%g0
	nop
p0_far_1_he:
	smul	%l2,-0x1b1,%l6
	fcmps	%fcc2,%f18,%f26
	fcmps	%fcc3,%f26,%f27
	jmpl	%o7,%g0
	fsqrts	%f26,%f30
p0_far_1_lo:
	jmpl	%o7,%g0
	sdivx	%l4,%l6,%l5
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
p0_far_1_ho:
	smul	%l2,-0x1b1,%l6
	fcmps	%fcc2,%f18,%f26
	fcmps	%fcc3,%f26,%f27
	jmpl	%o7,%g0
	fsqrts	%f26,%f30
far1_b2b_h:
	fdivs	%f21,%f23,%f21
	fsubs	%f30,%f25,%f28
	fmuls	%f17,%f26,%f30
	jmpl	%o7,%g0
	sdivx	%l2,0x049,%l7
far1_b2b_l:
	sdivx	%l2,0x97d,%l1
	smul	%l1,-0x2e5,%l3
	sdivx	%l1,%l3,%l3
	jmpl	%o7,%g0
	add	%l7,-0x3cd,%l4
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
	xnor	%l5,-0x2a5,%l1
	jmpl	%o7,%g0
	umul	%l5,-0x3b7,%l1
p0_far_2_he:
	ld	[%i5+0x008],%f17	! Mem[0000000010141408]
	fcmps	%fcc1,%f18,%f29
	smul	%l3,%l7,%l4
	udivx	%l2,0xe40,%l4
	jmpl	%o7,%g0
	xnor	%l2,-0xf7d,%l1
p0_far_2_lo:
	xnor	%l5,-0x2a5,%l1
	jmpl	%o7,%g0
	umul	%l5,-0x3b7,%l1
p0_far_2_ho:
	ld	[%o5+0x008],%f17	! Mem[0000000010141408]
	fcmps	%fcc1,%f18,%f29
	smul	%l3,%l7,%l4
	udivx	%l2,0xe40,%l4
	jmpl	%o7,%g0
	xnor	%l2,-0xf7d,%l1
far2_b2b_h:
	addc	%l2,-0xc3d,%l1
	fsubs	%f31,%f20,%f23
	xnor	%l0,0x8c6,%l7
	and	%l1,%l4,%l4
	sdivx	%l1,0x430,%l7
	add	%l1,0x90d,%l7
	jmpl	%o7,%g0
	sub	%l2,%l1,%l1
far2_b2b_l:
	fadds	%f9 ,%f14,%f13
	orn	%l5,-0xe60,%l1
	smul	%l2,0x1be,%l5
	orn	%l5,-0xa87,%l6
	fdivs	%f0 ,%f4 ,%f8 
	and	%l5,0xace,%l7
	jmpl	%o7,%g0
	xnor	%l7,-0xc0d,%l0
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
	mulx	%l1,-0xb3b,%l4
	jmpl	%o7,%g0
	nop
p0_far_3_he:
	smul	%l5,%l1,%l7
	andn	%l0,%l7,%l4
	jmpl	%o7,%g0
	add	%l7,0x4bb,%l0
p0_far_3_lo:
	jmpl	%o7,%g0
	mulx	%l1,-0xb3b,%l4
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
p0_far_3_ho:
	smul	%l5,%l1,%l7
	andn	%l0,%l7,%l4
	jmpl	%o7,%g0
	add	%l7,0x4bb,%l0
far3_b2b_h:
	umul	%l3,0x94c,%l6
	sub	%l0,%l7,%l7
	and	%l1,0x343,%l3
	fsubs	%f23,%f22,%f29
	jmpl	%o7,%g0
	fcmps	%fcc0,%f26,%f19
far3_b2b_l:
	fdtos	%f8 ,%f15
	xnor	%l4,-0xc68,%l4
	umul	%l6,0x6a7,%l1
	fsqrts	%f5 ,%f8 
	jmpl	%o7,%g0
	fmuls	%f5 ,%f10,%f11
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	.skip	16
p0_jmpl_0_le:
	fsqrts	%f9 ,%f10
	umul	%l6,0xcc3,%l3
	fadds	%f0 ,%f15,%f12
	fcmps	%fcc3,%f14,%f13
	jmpl	%g6+8,%g0
	sdivx	%l4,%l7,%l6
p0_call_0_le:
	mulx	%l4,%l2,%l0
	subc	%l0,-0x259,%l3
	subc	%l0,0xeb5,%l0
	xor	%l3,%l0,%l5
	retl
	addc	%l1,%l7,%l4
p0_jmpl_0_lo:
	fsqrts	%f9 ,%f10
	umul	%l6,0xcc3,%l3
	fadds	%f0 ,%f15,%f12
	fcmps	%fcc3,%f14,%f13
	jmpl	%g6+8,%g0
	sdivx	%l4,%l7,%l6
p0_call_0_lo:
	mulx	%l4,%l2,%l0
	subc	%l0,-0x259,%l3
	subc	%l0,0xeb5,%l0
	xor	%l3,%l0,%l5
	retl
	addc	%l1,%l7,%l4
p0_jmpl_0_he:
	and	%l0,%l0,%l4
	fcmps	%fcc1,%f21,%f16
	nop
	jmpl	%g6+8,%g0
	xor	%l4,%l6,%l1
p0_call_0_he:
	sdivx	%l1,0xa97,%l6
	fitod	%f16,%f22
	mulx	%l7,0xd6b,%l4
	smul	%l0,%l7,%l1
	sdivx	%l0,0xb98,%l3
	orn	%l1,0xbd6,%l2
	xor	%l4,%l1,%l2
	retl
	xnor	%l6,-0xeb2,%l1
p0_jmpl_0_ho:
	and	%l0,%l0,%l4
	fcmps	%fcc1,%f21,%f16
	nop
	jmpl	%g6+8,%g0
	xor	%l4,%l6,%l1
p0_call_0_ho:
	sdivx	%l1,0xa97,%l6
	fitod	%f16,%f22
	mulx	%l7,0xd6b,%l4
	smul	%l0,%l7,%l1
	sdivx	%l0,0xb98,%l3
	orn	%l1,0xbd6,%l2
	xor	%l4,%l1,%l2
	retl
	xnor	%l6,-0xeb2,%l1
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	.skip	32
p0_jmpl_1_le:
	fadds	%f6 ,%f12,%f10
	subc	%l0,0xa78,%l5
	jmpl	%g6+8,%g0
	xnor	%l4,-0xd4e,%l3
p0_call_1_le:
	umul	%l6,0x9ac,%l5
	sdivx	%l5,0x7f7,%l1
	add	%l4,%l0,%l1
	retl
	fsqrts	%f8 ,%f3 
p0_jmpl_1_lo:
	fadds	%f6 ,%f12,%f10
	subc	%l0,0xa78,%l5
	jmpl	%g6+8,%g0
	xnor	%l4,-0xd4e,%l3
p0_call_1_lo:
	umul	%l6,0x9ac,%l5
	sdivx	%l5,0x7f7,%l1
	add	%l4,%l0,%l1
	retl
	fsqrts	%f8 ,%f3 
p0_jmpl_1_he:
	xnor	%l3,%l6,%l1
	and	%l2,%l7,%l0
	fmuls	%f26,%f31,%f18
	jmpl	%g6+8,%g0
	addc	%l3,%l2,%l5
p0_call_1_he:
	umul	%l3,%l1,%l0
	retl
	udivx	%l7,%l0,%l6
p0_jmpl_1_ho:
	xnor	%l3,%l6,%l1
	and	%l2,%l7,%l0
	fmuls	%f26,%f31,%f18
	jmpl	%g6+8,%g0
	addc	%l3,%l2,%l5
p0_call_1_ho:
	umul	%l3,%l1,%l0
	retl
	udivx	%l7,%l0,%l6
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	.skip	48
p0_jmpl_2_le:
	xor	%l5,%l6,%l1
	jmpl	%g6+8,%g0
	fsubs	%f12,%f7 ,%f0 
p0_call_2_le:
	addc	%l2,%l6,%l2
	ldstub	[%o0+0x001],%l5		! Mem[00000000201c0001]
	sdivx	%l2,%l5,%l3
	fdivs	%f10,%f2 ,%f0 
	andn	%l1,0x200,%l7
	add	%l0,-0xc64,%l5
	retl
	xnor	%l4,-0x54e,%l2
p0_jmpl_2_lo:
	xor	%l5,%l6,%l1
	jmpl	%g6+8,%g0
	fsubs	%f12,%f7 ,%f0 
p0_call_2_lo:
	addc	%l2,%l6,%l2
	ldstub	[%i0+0x001],%l5		! Mem[00000000201c0001]
	sdivx	%l2,%l5,%l3
	fdivs	%f10,%f2 ,%f0 
	andn	%l1,0x200,%l7
	add	%l0,-0xc64,%l5
	retl
	xnor	%l4,-0x54e,%l2
p0_jmpl_2_he:
	add	%l2,-0x20b,%l6
	fdivs	%f25,%f21,%f22
	xnor	%l1,%l0,%l6
	smul	%l1,%l6,%l2
	sdivx	%l7,0x7a6,%l3
	sub	%l4,-0x240,%l7
	sub	%l5,-0x692,%l2
	jmpl	%g6+8,%g0
	fsubs	%f16,%f20,%f31
p0_call_2_he:
	fsubs	%f17,%f18,%f23
	mulx	%l3,%l7,%l0
	xnor	%l7,%l2,%l3
	fsubs	%f23,%f19,%f30
	xor	%l5,%l1,%l6
	addc	%l6,%l3,%l2
	retl
	fcmps	%fcc3,%f18,%f19
p0_jmpl_2_ho:
	add	%l2,-0x20b,%l6
	fdivs	%f25,%f21,%f22
	xnor	%l1,%l0,%l6
	smul	%l1,%l6,%l2
	sdivx	%l7,0x7a6,%l3
	sub	%l4,-0x240,%l7
	sub	%l5,-0x692,%l2
	jmpl	%g6+8,%g0
	fsubs	%f16,%f20,%f31
p0_call_2_ho:
	fsubs	%f17,%f18,%f23
	mulx	%l3,%l7,%l0
	xnor	%l7,%l2,%l3
	fsubs	%f23,%f19,%f30
	xor	%l5,%l1,%l6
	addc	%l6,%l3,%l2
	retl
	fcmps	%fcc3,%f18,%f19
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	.skip	64
p0_jmpl_3_le:
	xnor	%l4,-0x05f,%l5
	umul	%l7,%l4,%l1
	jmpl	%g6+8,%g0
	fmuls	%f13,%f2 ,%f1 
p0_call_3_le:
	fdivs	%f2 ,%f4 ,%f15
	fsqrts	%f1 ,%f11
	and	%l1,%l0,%l0
	retl
	sdivx	%l2,0xe93,%l0
p0_jmpl_3_lo:
	xnor	%l4,-0x05f,%l5
	umul	%l7,%l4,%l1
	jmpl	%g6+8,%g0
	fmuls	%f13,%f2 ,%f1 
p0_call_3_lo:
	fdivs	%f2 ,%f4 ,%f15
	fsqrts	%f1 ,%f11
	and	%l1,%l0,%l0
	retl
	sdivx	%l2,0xe93,%l0
p0_jmpl_3_he:
	add	%l4,%l4,%l6
	jmpl	%g6+8,%g0
	fmuls	%f26,%f21,%f22
p0_call_3_he:
	fadds	%f28,%f23,%f23
	orn	%l1,0xcdd,%l7
	sdivx	%l2,0x479,%l7
	stx	%l6,[%i3+0x010]		! Mem[00000000100c1410]
	smul	%l4,%l4,%l0
	xor	%l0,0x21f,%l6
	stw	%l0,[%i1+0x038]		! Mem[0000000010041438]
	retl
	fmuls	%f23,%f21,%f22
p0_jmpl_3_ho:
	add	%l4,%l4,%l6
	jmpl	%g6+8,%g0
	fmuls	%f26,%f21,%f22
p0_call_3_ho:
	fadds	%f28,%f23,%f23
	orn	%l1,0xcdd,%l7
	sdivx	%l2,0x479,%l7
	stx	%l6,[%o3+0x010]		! Mem[00000000100c1410]
	smul	%l4,%l4,%l0
	xor	%l0,0x21f,%l6
	stw	%l0,[%o1+0x038]		! Mem[0000000010041438]
	retl
	fmuls	%f23,%f21,%f22
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
	.word	0xc643531d,0x8a92da56		! Init value for %l0
	.word	0xb3b75f69,0x22eb3781		! Init value for %l1
	.word	0x411c540a,0x78fca8bc		! Init value for %l2
	.word	0xec04c232,0x64183107		! Init value for %l3
	.word	0x1dbae689,0x313b6362		! Init value for %l4
	.word	0x77afbd07,0x9aab62cd		! Init value for %l5
	.word	0x712d7a8a,0x889fe248		! Init value for %l6
	.word	0x532f2da8,0x8dfe24d3		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x28c00508,0x107eabf9		! Init value for %f0 
	.word	0x45662c86,0x304c6ebf		! Init value for %f2 
	.word	0x0be77074,0x7d245635		! Init value for %f4 
	.word	0x31039852,0x42045bdb		! Init value for %f6 
	.word	0x5976c7a0,0x7e8be531		! Init value for %f8 
	.word	0x6e455dde,0x392c23b7		! Init value for %f10
	.word	0x3c6ed68c,0x22c374ed		! Init value for %f12
	.word	0x417fa92a,0x1c3bc253		! Init value for %f14
	.word	0x343a2938,0x0d83e169		! Init value for %f16
	.word	0x044e6636,0x21fbf3af		! Init value for %f18
	.word	0x25d90ba4,0x192cc6a5		! Init value for %f20
	.word	0x75214102,0x1b6233cb		! Init value for %f22
	.word	0x44cd89d0,0x188080a1		! Init value for %f24
	.word	0x2c87a58e,0x542cbea7		! Init value for %f26
	.word	0x5fc76fbc,0x15202b5d		! Init value for %f28
	.word	0x243cbfda,0x263e9043		! Init value for %f30
	.word	0x5d104968,0x26c7a2d9		! Init value for %f32
	.word	0x7bf37be6,0x3bbb649f		! Init value for %f34
	.word	0x72b762d4,0x3f498315		! Init value for %f36
	.word	0x67e285b2,0x3be3b7bb		! Init value for %f38
	.word	0x667dc800,0x074b2811		! Init value for %f40
	.word	0x7510493e,0x5eb0c597		! Init value for %f42
	.word	0x618244ec,0x27c0adcd		! Init value for %f44
	.word	0x0f5ef28a,0x23308a33		! Init value for %f46
	.word	0x23ad6598,0x1c28f049
	.word	0x75586d96,0x24a1c18f
	.word	0x22dd7604,0x69898b85
	.word	0x05ba6662,0x4a4fe7ab
	.word	0x61d28230,0x562adb81
	.word	0x12c248ee,0x4e2f3887
	.word	0x0ada561c,0x7e13fc3d
	.word	0x2739413a,0x5638b023
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
	.word	0x00000000,0x00000000		! %l0
	.word	0x00000000,0x6bd5714d		! %l1
	.word	0x00000000,0x000000af		! %l2
	.word	0x00000000,0x00000000		! %l3
	.word	0xffffffff,0xffffffff		! %l4
	.word	0x00000000,0x000000ff		! %l5
	.word	0x00000000,0x00000000		! %l6
	.word	0x00000000,0x0000ffff		! %l7
p0_expected_fp_regs:
	.word	0xff00005b,0x00000000		! %f0
	.word	0x00000000,0xffffffff		! %f2
	.word	0x9920f43c,0x000000ff		! %f4
	.word	0xff2affff,0x00000000		! %f6
	.word	0x5441c3b0,0x51262701		! %f8
	.word	0x00000000,0xffffff80		! %f10
	.word	0x7fffffff,0x1effaf8d		! %f12
	.word	0x4c57a6ba,0x9516922b		! %f14
	.word	0x00000000,0x00000000		! %f16
	.word	0xffff9bff,0xfe000000		! %f18
	.word	0xd700e03a,0x000000ff		! %f20
	.word	0x00000000,0x000000ff		! %f22
	.word	0x00000000,0xffffffff		! %f24
	.word	0xf3220000,0x0000803f		! %f26
	.word	0x8dafd41e,0xacf11f77		! %f28
	.word	0xdb000000,0x5b0000ff		! %f30
	.word	0x0000003e,0x00000621		! %fsr
p0_local0_expect:
	.word	0xff9bffff,0x22f320ba,0xffa2ffeb,0x00000000 ! PA = 0000000010001400
	.word	0xff000000,0x329bffff,0x6728ff60,0x0000005b ! PA = 0000000010001410
	.word	0xffffffff,0xffffffff,0x6c9f1ac4,0x5956a545 ! PA = 0000000010001420
	.word	0x00000000,0xffff9b32,0x00000045,0x6b8301d3 ! PA = 0000000010001430
p0_local0_sec_expect:
	.word	0xffffffff,0xd1c2106a,0x280000ff,0x5b0000ff ! PA = 0000000030001400
	.word	0x00000000,0x3ae000d7,0x771ff1ac,0xe25b0f7f ! PA = 0000000030001410
	.word	0x01272651,0xb0c34154,0x0700a244,0x3f800000 ! PA = 0000000030001420
	.word	0xbd1f5b65,0xd700e03a,0xa30f6053,0xbaa6574c ! PA = 0000000030001430
!	Scratch Area for Non-Transactional Memory Stores
	.word	0x003bad66,0xd0bb7d07,0x3189de4a,0x5748fd33
	.word	0x437d374e,0x614fc1bf,0x2eae4172,0xd8d2c5ab
	.word	0x6d960db6,0xd7599bf7,0xfe04751a,0x302b2fa3
	.word	0x5258589e,0xde8e83af,0x7509e142,0x75c1731b
p0_local1_expect:
	.word	0xffff0000,0x00000000,0xc3000000,0xff000000 ! PA = 0000000010041400
	.word	0x8dafd41e,0xffffff80,0x9113c202,0xfe000000 ! PA = 0000000010041410
	.word	0xff00ffdb,0xac001f45,0x0c0000ff,0x323cbfda ! PA = 0000000010041420
	.word	0x771ff1ac,0x1effaf8d,0xff003781,0x80ff3600 ! PA = 0000000010041430
p0_local1_sec_expect:
	.word	0x00000000,0x16eb6232,0xffffff7f,0x0000ffff ! PA = 0000000030041400
	.word	0x4d71d56b,0x00000000,0x00380122,0x7cf75f6b ! PA = 0000000030041410
	.word	0x36ae42f0,0x7ba82141,0x3623dfae,0x257d3c47 ! PA = 0000000030041420
	.word	0x1e3af2dc,0x7d492dfd,0x3f8f93fa,0x0c82ffe3 ! PA = 0000000030041430
p0_local2_expect:
	.word	0xff000000,0xbaa6574c,0x00000000,0xffffffff ! PA = 0000000010081400
	.word	0xaf000000,0x00000000,0x0000803f,0x44a20007 ! PA = 0000000010081410
	.word	0x0000d400,0x9516922b,0x771ff1ac,0xfe6fee6b ! PA = 0000000010081420
	.word	0x8dafd41e,0xacf11f77,0xf3299c52,0xd56cf322 ! PA = 0000000010081430
p0_local2_sec_expect:
	.word	0xf3220000,0x00000000,0x00000000,0x00000000 ! PA = 0000000030081400
	.word	0x00000000,0x00000000,0x31039852,0x42045b00 ! PA = 0000000030081410
	.word	0x5976c7a0,0x18b7393c,0x69e1830d,0x610297df ! PA = 0000000030081420
	.word	0x3c6ed68c,0x22c374ed,0x417fa92a,0x1c3bc253 ! PA = 0000000030081430
p0_local3_expect:
	.word	0xff00ffff,0x00000000,0x00000000,0xffffffff ! PA = 00000000100c1400
	.word	0x00000000,0x00000053,0xffffff00,0x00000024 ! PA = 00000000100c1410
	.word	0x08055dbf,0x22c21391,0x010c5524,0x6e942d17 ! PA = 00000000100c1420
	.word	0x205184ff,0x00000000,0xffffffff,0x3ae000d7 ! PA = 00000000100c1430
p0_local3_sec_expect:
	.word	0x00000000,0x00000000,0x00000000,0x000000c3 ! PA = 00000000300c1400
	.word	0x00000000,0x4c57a6ba,0x771ff1ac,0xe25b0f7f ! PA = 00000000300c1410
	.word	0x01272651,0xb0c34154,0x0700a244,0x3f800000 ! PA = 00000000300c1420
	.word	0xbd1f5b65,0xd700e03a,0xa30f6053,0xbaa6574c ! PA = 00000000300c1430
p0_local4_expect:
	.word	0xff000000,0xffffff80,0xffffffff,0x000000c3 ! PA = 0000000010101400
	.word	0x4c57a6ba,0xffff9bff,0x7f0f5be2,0xb0c34154 ! PA = 0000000010101410
	.word	0xffffffff,0x000000c3,0x0000803f,0x44a200ff ! PA = 0000000010101420
	.word	0x00000000,0xff000000,0x4c57a6ba,0xbaa6574c ! PA = 0000000010101430
p0_local4_sec_expect:
	.word	0x00000000,0x00000000,0xffffff80,0xfe000000 ! PA = 0000000030101400
	.word	0x00000000,0x00000000,0x75214102,0x1b6233cb ! PA = 0000000030101410
	.word	0x44cd89d0,0x188080a1,0x00000000,0x0034ffcb ! PA = 0000000030101420
	.word	0x6c9f1ac4,0x5956a545,0x243cbfda,0x263e9043 ! PA = 0000000030101430
p0_local5_expect:
	.word	0xff000000,0xff000000,0xffffff42,0x6bd5714d ! PA = 0000000010141400
	.word	0x000000ff,0x106a0000,0x000000cc,0x04ff007b ! PA = 0000000010141410
	.word	0x0000ff52,0x3ae000d7,0x00000032,0x3ae000d7 ! PA = 0000000010141420
	.word	0x03d68b2c,0xf4d9ff63,0xcbff3400,0x199bffdb ! PA = 0000000010141430
p0_local5_sec_expect:
	.word	0xffff0000,0x00000000,0xff000000,0x3cf42099 ! PA = 0000000030141400
	.word	0xff9bffff,0x4a5f18c5,0x270076a2,0x6b968eeb ! PA = 0000000030141410
	.word	0x554d0470,0x4e64ecc1,0x47384d2e,0x715d83c7 ! PA = 0000000030141420
	.word	0x64df4f5c,0x3a5bd1bd,0x26569b32,0x73bc073b ! PA = 0000000030141430
p0_local6_expect:
	.word	0xff00005b,0x00000000,0x00000000,0xffffffff ! PA = 0000000010181400
	.word	0x9920f43c,0x000000ff,0xff2affff,0x00000000 ! PA = 0000000010181410
	.word	0x5441c3b0,0x51262701,0x00000000,0xffff9bff ! PA = 0000000010181420
	.word	0x7fffffff,0x1effff8d,0x4c57a6ba,0x9516922b ! PA = 0000000010181430
p0_local6_sec_expect:
	.word	0x000000db,0x00000000,0x00ffffff,0xffffffff ! PA = 0000000030181400
	.word	0x00000000,0x0f000036,0x4c5eac02,0x25cb12cb ! PA = 0000000030181410
	.word	0x7dfb8cd0,0x59d897a1,0x3ae000d7,0x655b1fbd ! PA = 0000000030181420
	.word	0x3338e2bc,0x7ec7f25d,0x1f3d0ada,0x7e12cf43 ! PA = 0000000030181430
share0_expect:
	.word	0xffe62c68,0x720e19d9,0x1729b6e6,0x1077d39f ! PA = 00000000201c0000
	.word	0x0b70b5d4,0x5aadaa15,0x3c71b0b2,0x303f56bb ! PA = 00000000201c0010
	.word	0x6b1b8b00,0x5d7bff11,0x498b643e,0x67129497 ! PA = 00000000201c0020
	.word	0x086f77ec,0x169d34cd,0x12c8fd8a,0x74af8933 ! PA = 00000000201c0030
share1_expect:
	.word	0x00d40898,0x1bc02749,0x6a246896,0x5404f08f ! PA = 0000000020800000
	.word	0x346a8904,0x631a7285,0x5ccb5162,0x1b0e46ab ! PA = 0000000020800010
	.word	0x14900530,0x2b247281,0x766b23ee,0x316fc787 ! PA = 0000000020800020
	.word	0x26f3491c,0x3f15433d,0x763d0c3a,0x19d26f23 ! PA = 0000000020800030
	.word	0xffffe0c8,0x341ec0b9,0x21d1f646,0x49fff97f ! PA = 0000000020800040
	.word	0x5e771834,0x7b6986f5,0x219e8e12,0x4dbee29b ! PA = 0000000020800050
	.word	0x6363fb60,0x64d0f1f1,0x13473f9e,0x306e6677 ! PA = 0000000020800060
	.word	0x09bf564c,0x6e5f1dad,0x3dac36ea,0x69628113 ! PA = 0000000020800070
share2_expect:
	.word	0x00afb4f8,0x7c88e629,0x12b55ff6,0x46ffee6f ! PA = 00000000211c0000
	.word	0x41716364,0x5729e765,0x6ade66c2,0x14982a8b ! PA = 00000000211c0010
	.word	0x1a626d90,0x07407d61,0x2682b74e,0x77057167 ! PA = 00000000211c0020
	.word	0x318e9f7c,0x7169c41d,0x20e97d9a,0x3c06bf03 ! PA = 00000000211c0030
share3_expect:
	.word	0xff2b8528,0x491d9799,0x2111a5a6,0x185bcf5f ! PA = 0000000021800000
	.word	0x32f46a94,0x38aa93d5,0x343ddb72,0x10a11e7b ! PA = 0000000021800010
	.word	0x06165bc0,0x59f214d1,0x1e408afe,0x08ebe857 ! PA = 0000000021800020
	.word	0x54dc24ac,0x5be4368d,0x4b87e04a,0x372628f3 ! PA = 0000000021800030
	.word	0x411a5158,0x70bbd509,0x70e9c756,0x742a9c4f ! PA = 0000000021800040
	.word	0x565b2dc4,0x60fa8c45,0x452fec22,0x27a0be6b ! PA = 0000000021800050
	.word	0x2ccac5f0,0x5f24b841,0x0063baae,0x4a98cb47 ! PA = 0000000021800060
	.word	0x0fe2e5dc,0x783d74fd,0x0cda5efa,0x3ce7bee3 ! PA = 0000000021800070
	.word	0x00d71988,0x3d029e79,0x1600c506,0x6943553f ! PA = 0000000021800080
	.word	0x4cc0acf4,0x7fe8d0b5,0x60e798d2,0x741e0a5b ! PA = 0000000021800090
	.word	0x7e8aac20,0x43d767b1,0x1a8f465e,0x71431a37 ! PA = 00000000218000a0
	.word	0x149de30c,0x37a47f6d,0x07f3f9aa,0x5c3280d3 ! PA = 00000000218000b0
	.word	0x6affddb8,0x5a50f3e9,0x43d99eb6,0x4f3cfa2f ! PA = 00000000218000c0
	.word	0x64ffe824,0x24046125,0x7657e182,0x3560024b ! PA = 00000000218000d0
	.word	0x05210e50,0x4fc92321,0x32262e0e,0x72e1d527 ! PA = 00000000218000e0
	.word	0x5ac81c3c,0x220855dd,0x63a7b05a,0x40ad6ec3 ! PA = 00000000218000f0
	.word	0x2a749de8,0x47c5d559,0x7db75466,0x366e8b1f ! PA = 0000000021800100
	.word	0x4bb3df54,0x2a9c3d95,0x5033c632,0x3f6da63b ! PA = 0000000021800110
	.word	0x1418ec80,0x5578ea91,0x344b71be,0x762bfc17 ! PA = 0000000021800120
	.word	0x4fdc916c,0x4617f84d,0x7a88830a,0x22bf88b3 ! PA = 0000000021800130
	.word	0xffcf5a18,0x474042c9,0x469ce616,0x57ef080f ! PA = 0000000021800140
	.word	0x3b379284,0x2fbf6605,0x44ee46e2,0x6b0df62b ! PA = 0000000021800150
	.word	0x78bd46b0,0x2225be01,0x65e2116e,0x42988f07 ! PA = 0000000021800160
	.word	0x0716429c,0x294266bd,0x0ae971ba,0x378fcea3 ! PA = 0000000021800170
	.word	0x68731248,0x4d5f3c39,0x514d53c6,0x059570ff ! PA = 0000000021800180
	.word	0x2ba601b4,0x7e3cda75,0x66ba6392,0x05c7f21b ! PA = 0000000021800190
	.word	0x2a191ce0,0x6dce9d71,0x138d0d1e,0x305e8df7 ! PA = 00000000218001a0
	.word	0x69702fcc,0x37b6a12d,0x66dd7c6a,0x21054093 ! PA = 00000000218001b0
	.word	0x17ffc678,0x7181c1a9,0x304b9d76,0x19f8c5ef ! PA = 00000000218001c0
	.word	0x02da2ce4,0x7fa39ae5,0x338b1c42,0x41e29a0b ! PA = 00000000218001d0
	.word	0x78f76f10,0x4b3288e1,0x41af64ce,0x1874f8e7 ! PA = 00000000218001e0
	.word	0x65a558fc,0x3463a79d,0x2437a31a,0x5dc6de83 ! PA = 00000000218001f0
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
	.word	0x1a3c7dc8,0x6046c9b9,0x69403b46,0x1c860a7f	! PA = 0000000010001400
	.word	0x24664534,0x40bbdff5,0x06dbe312,0x622dc39b	! PA = 0000000010001410
	.word	0x03d6b860,0x7b1e9af1,0x5840a49e,0x28df1777	! PA = 0000000010001420
	.word	0x7acaa34c,0x224916ad,0x23deabea,0x6f3e0213	! PA = 0000000010001430
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
	.word	0x14a891f8,0x08802f29,0x302de4f6,0x6bff3f6f	! PA = 0000000030001400
	.word	0x532cd064,0x0c6f8065,0x0f39fbc2,0x03c44b8b	! PA = 0000000030001410
	.word	0x73556a90,0x46e56661,0x4fee5c4e,0x75b76267	! PA = 0000000030001420
	.word	0x560e2c7c,0x754efd1d,0x0122329a,0x7ae78003	! PA = 0000000030001430
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
	.word	0x589ca228,0x3cf42099,0x32646aa6,0x5464605f	! PA = 0000000010041400
	.word	0x28cc1794,0x22f36cd5,0x5e87b072,0x041a7f7b	! PA = 0000000010041410
	.word	0x60d998c0,0x54fe3dd1,0x6bee6ffe,0x2c6f1957	! PA = 0000000010041420
	.word	0x771ff1ac,0x1ed4af8d,0x2e96d54a,0x529c29f3	! PA = 0000000010041430
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
	.word	0x4d83ae58,0x28819e09,0x17e6cc56,0x7fcc6d4f	! PA = 0000000030041400
	.word	0x6c9f1ac4,0x5956a545,0x00380122,0x7cf75f6b	! PA = 0000000030041410
	.word	0x36ae42f0,0x7ba82141,0x3623dfae,0x257d3c47	! PA = 0000000030041420
	.word	0x1e3af2dc,0x7d492dfd,0x3f8f93fa,0x0c82ffe3	! PA = 0000000030041430
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
	.word	0x2c88b688,0x68c7a779,0x78780a06,0x710e663f	! PA = 0000000010081400
	.word	0x63c0d9f4,0x736829b5,0x7b7dedd2,0x3ce1eb5b	! PA = 0000000010081410
	.word	0x48de6920,0x3be210b1,0x0031ab5e,0x0a18cb37	! PA = 0000000010081420
	.word	0x215a300c,0x15db786d,0x1b1f6eaa,0x6b8301d3	! PA = 0000000010081430
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
	.word	0x3096bab8,0x7e253ce9,0x0b9b23b6,0x73c14b2f	! PA = 0000000030081400
	.word	0x010c5524,0x13b6fa25,0x034c7682,0x3721234b	! PA = 0000000030081410
	.word	0x05350b50,0x316b0c21,0x137ad30e,0x4438c627	! PA = 0000000030081420
	.word	0x1c38a93c,0x047a8edd,0x2c19655a,0x4f432fc3	! PA = 0000000030081430
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
	.word	0x4658bae8,0x3bb95e59,0x58931966,0x0c3c1c1f	! PA = 00000000100c1400
	.word	0x151c8c54,0x2b921695,0x26569b32,0x73bc073b	! PA = 00000000100c1410
	.word	0x233d2980,0x02c21391,0x612256be,0x6e942d17	! PA = 00000000100c1420
	.word	0x20515e6c,0x6bd5714d,0x1110780a,0x242a89b3	! PA = 00000000100c1430
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
	.word	0x3c39b718,0x37630bc9,0x6662eb16,0x6795d90f	! PA = 00000000300c1400
	.word	0x7e4c7f84,0x6b087f05,0x7f0f5be2,0x7f79972b	! PA = 00000000300c1410
	.word	0x5441c3b0,0x51262701,0x320b366e,0x44a20007	! PA = 00000000300c1420
	.word	0x64df4f9c,0x655b1fbd,0x4c57a6ba,0x53600fa3	! PA = 00000000300c1430
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
	.word	0x7264af48,0x39c14539,0x6bcd98c6,0x4ba581ff	! PA = 0000000010101400
	.word	0x58b72eb4,0x30e93375,0x63a9b892,0x5be0d31b	! PA = 0000000010101410
	.word	0x734dd9e0,0x28964671,0x56d8721e,0x12993ef7	! PA = 0000000010101420
	.word	0x76dd7ccc,0x713a9a2d,0x7401f16a,0x32cac193	! PA = 0000000010101430
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
	.word	0x0ac4a378,0x2e330aa9,0x7f562276,0x070216ef	! PA = 0000000030101400
	.word	0x2e3799e4,0x7ac333e5,0x1618b142,0x6f38bb0b	! PA = 0000000030101410
	.word	0x352c6c10,0x6fd171e1,0x57ed09ce,0x2570e9e7	! PA = 0000000030101420
	.word	0x6906e5fc,0x6662e09d,0x61e2581a,0x75119f83	! PA = 0000000030101430
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
	.word	0x190493a8,0x12d75c19,0x473f8826,0x610297df	! PA = 0000000010141400
	.word	0x2668c114,0x54e58055,0x740f45f2,0x74884efb	! PA = 0000000010141410
	.word	0x58687a40,0x5856a951,0x256bfd7e,0x3ae000d7	! PA = 0000000010141420
	.word	0x03d68b2c,0x6282f30d,0x638bdaca,0x199ba973	! PA = 0000000010141430
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
	.word	0x528f7fd8,0x688d3989,0x298cc9d6,0x09be04cf	! PA = 0000000030141400
	.word	0x36a5a444,0x4a5f18c5,0x270076a2,0x6b968eeb	! PA = 0000000030141410
	.word	0x554d0470,0x4e64ecc1,0x47384d2e,0x715d83c7	! PA = 0000000030141420
	.word	0x75876c5c,0x3a09d17d,0x6a51797a,0x5c8fdf63	! PA = 0000000030141430
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
	.word	0x3e906808,0x22f3a2f9,0x7c00e786,0x0a0b5dbf	! PA = 0000000010181400
	.word	0x52094374,0x54fefd35,0x541f4352,0x08ea7adb	! PA = 0000000010181410
	.word	0x0de50aa0,0x68fb3c31,0x0cf4f8de,0x382072b7	! PA = 0000000010181420
	.word	0x0214898c,0x68267bed,0x3b46342a,0x26d54153	! PA = 0000000010181430
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
	.word	0x65f24c38,0x18699869,0x341ee136,0x3381a2af	! PA = 0000000030181400
	.word	0x196e9ea4,0x4d542da5,0x4c5eac02,0x25cb12cb	! PA = 0000000030181410
	.word	0x7dfb8cd0,0x59d897a1,0x3e05008e,0x3f1fcda7	! PA = 0000000030181420
	.word	0x3338e2bc,0x7ec7f25d,0x1f3d0ada,0x7e12cf43	! PA = 0000000030181430
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
	.word	0x03602c68,0x720e19d9,0x1729b6e6,0x1077d39f	! PA = 00000000201c0000
	.word	0x0b70b5d4,0x5aadaa15,0x3c71b0b2,0x303f56bb	! PA = 00000000201c0010
	.word	0x6b1b8b00,0x5d7bff11,0x498b643e,0x67129497	! PA = 00000000201c0020
	.word	0x086f77ec,0x169d34cd,0x12c8fd8a,0x74af8933	! PA = 00000000201c0030
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
	.word	0x33450898,0x1bc02749,0x6a246896,0x5404f08f	! PA = 0000000020800000
	.word	0x346a8904,0x631a7285,0x5ccb5162,0x1b0e46ab	! PA = 0000000020800010
	.word	0x14900530,0x2b247281,0x766b23ee,0x316fc787	! PA = 0000000020800020
	.word	0x26f3491c,0x3f15433d,0x763d0c3a,0x19d26f23	! PA = 0000000020800030
	.word	0x23cbe0c8,0x341ec0b9,0x21d1f646,0x49fff97f	! PA = 0000000020800040
	.word	0x5e771834,0x7b6986f5,0x219e8e12,0x4dbee29b	! PA = 0000000020800050
	.word	0x6363fb60,0x64d0f1f1,0x13473f9e,0x306e6677	! PA = 0000000020800060
	.word	0x09bf564c,0x6e5f1dad,0x3dac36ea,0x69628113	! PA = 0000000020800070
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
	.word	0x44dfb4f8,0x7c88e629,0x12b55ff6,0x46ffee6f	! PA = 00000000211c0000
	.word	0x41716364,0x5729e765,0x6ade66c2,0x14982a8b	! PA = 00000000211c0010
	.word	0x1a626d90,0x07407d61,0x2682b74e,0x77057167	! PA = 00000000211c0020
	.word	0x318e9f7c,0x7169c41d,0x20e97d9a,0x3c06bf03	! PA = 00000000211c0030
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
	.word	0x782b8528,0x491d9799,0x2111a5a6,0x185bcf5f	! PA = 0000000021800000
	.word	0x32f46a94,0x38aa93d5,0x343ddb72,0x10a11e7b	! PA = 0000000021800010
	.word	0x06165bc0,0x59f214d1,0x1e408afe,0x08ebe857	! PA = 0000000021800020
	.word	0x54dc24ac,0x5be4368d,0x4b87e04a,0x372628f3	! PA = 0000000021800030
	.word	0x411a5158,0x70bbd509,0x70e9c756,0x742a9c4f	! PA = 0000000021800040
	.word	0x565b2dc4,0x60fa8c45,0x452fec22,0x27a0be6b	! PA = 0000000021800050
	.word	0x2ccac5f0,0x5f24b841,0x0063baae,0x4a98cb47	! PA = 0000000021800060
	.word	0x0fe2e5dc,0x783d74fd,0x0cda5efa,0x3ce7bee3	! PA = 0000000021800070
	.word	0x74d71988,0x3d029e79,0x1600c506,0x6943553f	! PA = 0000000021800080
	.word	0x4cc0acf4,0x7fe8d0b5,0x60e798d2,0x741e0a5b	! PA = 0000000021800090
	.word	0x7e8aac20,0x43d767b1,0x1a8f465e,0x71431a37	! PA = 00000000218000a0
	.word	0x149de30c,0x37a47f6d,0x07f3f9aa,0x5c3280d3	! PA = 00000000218000b0
	.word	0x6a4cddb8,0x5a50f3e9,0x43d99eb6,0x4f3cfa2f	! PA = 00000000218000c0
	.word	0x64ffe824,0x24046125,0x7657e182,0x3560024b	! PA = 00000000218000d0
	.word	0x05210e50,0x4fc92321,0x32262e0e,0x72e1d527	! PA = 00000000218000e0
	.word	0x5ac81c3c,0x220855dd,0x63a7b05a,0x40ad6ec3	! PA = 00000000218000f0
	.word	0x2a269de8,0x47c5d559,0x7db75466,0x366e8b1f	! PA = 0000000021800100
	.word	0x4bb3df54,0x2a9c3d95,0x5033c632,0x3f6da63b	! PA = 0000000021800110
	.word	0x1418ec80,0x5578ea91,0x344b71be,0x762bfc17	! PA = 0000000021800120
	.word	0x4fdc916c,0x4617f84d,0x7a88830a,0x22bf88b3	! PA = 0000000021800130
	.word	0x1ecf5a18,0x474042c9,0x469ce616,0x57ef080f	! PA = 0000000021800140
	.word	0x3b379284,0x2fbf6605,0x44ee46e2,0x6b0df62b	! PA = 0000000021800150
	.word	0x78bd46b0,0x2225be01,0x65e2116e,0x42988f07	! PA = 0000000021800160
	.word	0x0716429c,0x294266bd,0x0ae971ba,0x378fcea3	! PA = 0000000021800170
	.word	0x44721248,0x4d5f3c39,0x514d53c6,0x059570ff	! PA = 0000000021800180
	.word	0x2ba601b4,0x7e3cda75,0x66ba6392,0x05c7f21b	! PA = 0000000021800190
	.word	0x2a191ce0,0x6dce9d71,0x138d0d1e,0x305e8df7	! PA = 00000000218001a0
	.word	0x69702fcc,0x37b6a12d,0x66dd7c6a,0x21054093	! PA = 00000000218001b0
	.word	0x58f9c678,0x7181c1a9,0x304b9d76,0x19f8c5ef	! PA = 00000000218001c0
	.word	0x02da2ce4,0x7fa39ae5,0x338b1c42,0x41e29a0b	! PA = 00000000218001d0
	.word	0x78f76f10,0x4b3288e1,0x41af64ce,0x1874f8e7	! PA = 00000000218001e0
	.word	0x65a558fc,0x3463a79d,0x2437a31a,0x5dc6de83	! PA = 00000000218001f0
share3_end:
