/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_1500_11.s
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
!	Seed = 626121548
!	Riesling can be on
!	1 Thread, 1500 lines
!	mpgen   created on May 4, 2009 (15:17:56), Version 2.81
!	mpgen_1500_11.s created on Jun 26, 2009 (12:15:48)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.090504 -rc random.rc -o mpgen_1500_11 -p 1 -l 1500

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
!	%f0  = 4f9067b8 4fc815e9 1f96f8b6 72e4ac2f
!	%f4  = 66919224 4d3d2325 414c5b82 2e6e544b
!	%f8  = 45dad850 33f58521 2f7bc80e 7598c727
!	%f12 = 2ca4063c 46fa57dd 36a86a5a 4cef00c3
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 383ea7e8 73ef7759 23cd2e66 69bcbd1f
!	%f20 = 64420954 470f7f95 3ae8c032 46ea783b
!	%f24 = 12773680 6fe7cc91 03498bbe 20996e17
!	%f28 = 2684fb6c 32d47a4d 5599bd0a 127f9ab3
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 015be418 633c64c9 57ab4016 5503ba0f
!	%f36 = 68623c84 428d2805 5203c0e2 5519482b
!	%f40 = 246010b0 5ff72001 0b28ab6e 22dc8107
!	%f44 = 642b2c9c 54e968bd 14ab2bba 72ee60a3
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x86d42d5b00000075,%g7,%g1 ! %gsr scale = 14, align = 5
	wr	%g1,%g0,%gsr		! %gsr = 86d42d5b00000075

	wr	%g0,%y			! Clear %y register
	xorcc	%g0,%g0,%g3		! %g3 = 0, %ccr = 44
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 382a8b46, %l6 = 00000000d0bc9fb8
	swapa	[%i3+%o4]0x81,%l6	! %l6 = 00000000382a8b46
!	%o2 = deadbeefdeadbeef
	set	share2_start,%o2	! set %o2[0] to VA
!	Mem[00000000211c0001] = 420c63a8, %l6 = 00000000382a8b46
	ldstub	[%o2+0x001],%l6		! %l6 = 000000000000000c
!	Mem[0000000030101410] = 33fce794, %l1 = 00000000f809abf1
	swapa	[%i4+%o5]0x81,%l1	! %l1 = 0000000033fce794
!	%l6 = 0000000c, %l7 = 285f2743, Mem[0000000030041410] = 52804074 1b97e635
	stda	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000000c 285f2743
!	%l4 = 05452b32bb1e66d2, Mem[0000000010041410] = 499c6144
	stha	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 66d26144
!	%f18 = 23cd2e66 69bcbd1f, Mem[0000000010081418] = 79b09102 13e243cb, %asi = 80
	stda	%f18,[%i2+0x018]%asi	! Mem[0000000010081418] = 23cd2e66 69bcbd1f
!	%l0 = 53339e05e121a9c6, Mem[000000001018143a] = 675ab55a, %asi = 80
	stha	%l0,[%i6+0x03a]%asi	! Mem[0000000010181438] = 675aa9c6
!	%o0 = deadbeefdeadbeef
	set	share0_start,%o0	! set %o0[0] to VA
!	%l4 = 05452b32bb1e66d2, Mem[00000000201c0000] = 02358718, %asi = 80
	stha	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 66d28718
!	%l1 = 0000000033fce794, Mem[00000000100c1400] = 7d893598
	stba	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = 94893598
!	%l0 = 53339e05e121a9c6, Mem[0000000010141400] = 356f7e58
	stha	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = a9c67e58

p0_label_2:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 41bb80a8, %l2 = 4fdee1f67c3db22c
	ldsba	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000041
!	Mem[0000000010101400] = 29bf322bf8618c4b, %l1 = 0000000033fce794
	ldxa	[%i4+%g0]0x88,%l1	! %l1 = 29bf322bf8618c4b
!	Mem[00000000300c1410] = 34150f5a, %l3 = dcc95f10df5bbf77
	lduha	[%i3+%o5]0x89,%l3	! %l3 = 0000000000000f5a
!	Mem[0000000010081428] = 41f7f58e 1969cea7, %l6 = 0000000c, %l7 = 285f2743
	ldd	[%i2+0x028],%l6		! %l6 = 0000000041f7f58e 000000001969cea7
!	Mem[0000000030001410] = 55e9df44143e2f71, %f2  = 1f96f8b6 72e4ac2f
	ldda	[%i0+%o5]0x89,%f2 	! %f2  = 55e9df44 143e2f71
!	Mem[00000000201c0000] = 66d28718, %l2 = 0000000000000041
	lduh	[%o0+%g0],%l2		! %l2 = 00000000000066d2
!	Mem[0000000030041400] = f93bed1008d58f14, %l1 = 29bf322bf8618c4b
	ldxa	[%i1+%g0]0x89,%l1	! %l1 = f93bed1008d58f14
!	Mem[0000000030101400] = 1d847228, %f18 = 23cd2e66
	lda	[%i4+%g0]0x81,%f18	! %f18 = 1d847228
!	%o1 = deadbeefdeadbeef
	set	share1_start,%o1	! set %o1[0] to VA
!	Mem[0000000020800040] = 7dc87378, %l1 = f93bed1008d58f14, %asi = 80
	lduha	[%o1+0x040]%asi,%l1	! %l1 = 0000000000007dc8
!	Mem[0000000010101410] = 64a01941, %l4 = 05452b32bb1e66d2
	ldsba	[%i4+%o5]0x88,%l4	! %l4 = 0000000000000041

p0_label_3:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000f5a, Mem[00000000211c0001] = 42ff63a8, %asi = 80
	stba	%l3,[%o2+0x001]%asi	! Mem[00000000211c0000] = 425a63a8
!	%l2 = 00000000000066d2, %l0 = 53339e05e121a9c6, %l1  = 0000000000007dc8
	mulx	%l2,%l0,%l1		! %l1 = d14df8861742286c
!	Mem[0000000010141428] = 7c6c2fae, %l3 = 00000f5a, %l7 = 1969cea7
	add	%i5,0x28,%g1
	casa	[%g1]0x80,%l3,%l7	! %l7 = 000000007c6c2fae
!	%l0 = e121a9c6, %l1 = 1742286c, Mem[0000000030101410] = f1ab09f8 d5fc9e34
	stda	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = e121a9c6 1742286c
!	%l4 = 00000041, %l5 = fdf7cb3d, Mem[0000000010181400] = b88a8a1d e9cca774
	stda	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000041 fdf7cb3d
!	%l3 = 0000000000000f5a, Mem[00000000100c1400] = 98358994
	stwa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000f5a
!	%l6 = 0000000041f7f58e, Mem[0000000010181408] = b673397d
	stwa	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 41f7f58e
!	%f21 = 470f7f95, Mem[00000000100c1400] = 5a0f0000
	sta	%f21,[%i3+%g0]0x80	! Mem[00000000100c1400] = 470f7f95
!	%l5 = 4a0347aafdf7cb3d, Mem[0000000010041410] = 66d26144
	stwa	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = fdf7cb3d
!	Mem[00000000300c1410] = 5a0f1534, %l6 = 0000000041f7f58e
	swapa	[%i3+%o5]0x81,%l6	! %l6 = 000000005a0f1534

p0_label_4:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 1e3d1c56, %l7 = 000000007c6c2fae
	ldsba	[%i5+%o4]0x80,%l7	! %l7 = 000000000000001e
!	Mem[0000000010181410] = 42092524, %l0 = 53339e05e121a9c6
	ldswa	[%i6+%o5]0x80,%l0	! %l0 = 0000000042092524
!	Mem[0000000010141400] = 587ec6a9, %l3 = 0000000000000f5a
	ldsha	[%i5+%g0]0x88,%l3	! %l3 = ffffffffffffc6a9
!	Mem[00000000100c1400] = 470f7f95, %l6 = 000000005a0f1534, %asi = 80
	lduwa	[%i3+0x000]%asi,%l6	! %l6 = 00000000470f7f95
!	Mem[00000000100c1408] = 011ebd96, %l3 = ffffffffffffc6a9
	ldsba	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000001
!	Mem[0000000020800041] = 7dc87378, %l2 = 00000000000066d2
	ldub	[%o1+0x041],%l2		! %l2 = 00000000000000c8
!	%f24 = 12773680, %f12 = 2ca4063c, %f3  = 143e2f71
	fsubs	%f24,%f12,%f3 		! %f3  = aca4063c
!	Mem[0000000020800040] = 7dc87378, %l6 = 00000000470f7f95
	ldsb	[%o1+0x040],%l6		! %l6 = 000000000000007d
!	Mem[0000000010041400] = 89929375d8acc237, %l3 = 0000000000000001
	ldxa	[%i1+%g0]0x88,%l3	! %l3 = 89929375d8acc237
!	Mem[0000000010001438] = 1f3a5d1a08c27083, %l4 = 0000000000000041, %asi = 80
	ldxa	[%i0+0x038]%asi,%l4	! %l4 = 1f3a5d1a08c27083

p0_label_5:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000c8, Mem[00000000100c1400] = 470f7f95
	stba	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = c80f7f95
!	Mem[00000000211c0001] = 425a63a8, %l4 = 1f3a5d1a08c27083
	ldstuba	[%o2+0x001]%asi,%l4	! %l4 = 000000000000005a
!	Mem[0000000030081410] = 66d832d4, %l4 = 000000000000005a
	ldstuba	[%i2+%o5]0x81,%l4	! %l4 = 0000000000000066
!	Mem[0000000010041400] = d8acc237, %l4 = 0000000000000066
	swapa	[%i1+%g0]0x88,%l4	! %l4 = 00000000d8acc237
!	%l7 = 000000000000001e, Mem[00000000100c1400] = c80f7f95
	stwa	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000001e
!	%f0  = 4f9067b8 4fc815e9, Mem[0000000030181408] = 3b556966 6e432c1f
	stda	%f0 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 4f9067b8 4fc815e9
!	Mem[0000000010081410] = a4dbb510, %l6 = 000000000000007d
	swapa	[%i2+%o5]0x88,%l6	! %l6 = 00000000a4dbb510
!	%f20 = 64420954 470f7f95, %l1 = d14df8861742286c
!	Mem[00000000300c1410] = 41f7f58e67ff6ff5
	add	%i3,0x010,%g1
	stda	%f20,[%g1+%l1]ASI_PST8_S ! Mem[00000000300c1410] = 4142098e470f6ff5
!	%l5 = 4a0347aafdf7cb3d, Mem[0000000010001400] = a9e3823878504f07
	stxa	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 4a0347aafdf7cb3d
!	%l2 = 00000000000000c8, Mem[00000000100c1400] = 0000001e1af38049
	stxa	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000000000c8

p0_label_6:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = af034f7136b6cc00, %f26 = 03498bbe 20996e17
	ldda	[%i2+%o4]0x88,%f26	! %f26 = af034f71 36b6cc00
!	Mem[0000000010101400] = f8618c4b, %f6  = 414c5b82
	lda	[%i4+%g0]0x88,%f6 	! %f6 = f8618c4b
!	Mem[00000000100c1400] = 00000000, %l1 = d14df8861742286c
	lduha	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000000
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000030101400] = 1d847228 231ab099 3e96baa6 141b705f
!	Mem[0000000030101410] = c6a921e1 6c284217 710b0072 0a3e8f7b
!	Mem[0000000030101420] = 30a368c0 653ecdd1 6192bffe 20902957
!	Mem[0000000030101430] = 1ad2c1ac 2dba3f8d 3d2c254a 314a39f3
	ldda	[%i4+%g0]ASI_BLK_AIUS,%f0 	! Block Load from 0000000030101400
!	Mem[00000000100c1410] = 4542460425191b85, %l1 = 0000000000000000
	ldx	[%i3+%o5],%l1		! %l1 = 4542460425191b85
!	Mem[0000000030141410] = f4a97958, %l3 = 89929375d8acc237
	lduha	[%i5+%o5]0x89,%l3	! %l3 = 0000000000007958
!	%f30 = 5599bd0a, %f20 = 64420954, %f24 = 12773680
	fadds	%f30,%f20,%f24		! %f24 = 64420954
!	Mem[0000000030081410] = ffd832d440251315, %l1 = 4542460425191b85
	ldxa	[%i2+%o5]0x81,%l1	! %l1 = ffd832d440251315
!	Mem[0000000030041410] = 0000000c, %l4 = 00000000d8acc237
	lduha	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181420] = 048adb50, %f18 = 1d847228
	lda	[%i6+0x020]%asi,%f18	! %f18 = 048adb50

p0_label_7:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010181400] = 41000000
	stwa	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	%f24 = 64420954 6fe7cc91, Mem[0000000030141408] = 065af235 3f76ed2f
	stda	%f24,[%i5+%o4]0x89	! Mem[0000000030141408] = 64420954 6fe7cc91
!	%l3 = 0000000000007958, Mem[0000000030001400] = 41bb80a8
	stba	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 58bb80a8
!	Mem[0000000010101400] = f8618c4b, %l5 = 4a0347aafdf7cb3d
	ldstuba	[%i4+%g0]0x88,%l5	! %l5 = 000000000000004b
!	%l1 = ffd832d440251315, Mem[0000000010081408] = 00ccb636
	stha	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 1315b636
!	%f26 = af034f71 36b6cc00, Mem[0000000030081410] = ffd832d4 40251315
	stda	%f26,[%i2+%o5]0x81	! Mem[0000000030081410] = af034f71 36b6cc00
	membar	#Sync			! Added by membar checker (2)
!	%f28 = 2684fb6c, Mem[0000000030101410] = e121a9c6
	sta	%f28,[%i4+%o5]0x89	! Mem[0000000030101410] = 2684fb6c
!	Mem[0000000010181418] = 06fbc6823e41334b, %l7 = 000000000000001e, %l6 = 00000000a4dbb510
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l7,%l6	! %l6 = 06fbc6823e41334b
!	%l2 = 00000000000000c8, Mem[0000000010041408] = d61e2e57
	stba	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = d61e2ec8
!	Mem[0000000010101408] = f6343c3f, %l3 = 0000000000007958
	ldstuba	[%i4+%o4]0x88,%l3	! %l3 = 000000000000003f

p0_label_8:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff3c34f629a24f6f, %f24 = 64420954 6fe7cc91
	ldda	[%i4+%o4]0x80,%f24	! %f24 = ff3c34f6 29a24f6f
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010101400] = ff8c61f8 2b32bf29 ff3c34f6 29a24f6f
!	Mem[0000000010101410] = 4119a064 10671065 6b594bc2 7b945b8b
!	Mem[0000000010101420] = 729b3a90 6b31f661 11eeac4e 1b447267
!	Mem[0000000010101430] = 11fcfc7c 66008d1d 5ad3829a 56c19003
	ldda	[%i4+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010101400
!	Mem[00000000201c0000] = 66d28718, %l0 = 0000000042092524, %asi = 80
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = 00000000000066d2
!	Mem[0000000030001400] = 1975fa2fa880bb58, %f6  = 710b0072 0a3e8f7b
	ldda	[%i0+%g0]0x89,%f6 	! %f6  = 1975fa2f a880bb58
!	Mem[0000000010041400] = 66000000, %l2 = 00000000000000c8
	lduba	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000066
!	Mem[000000001010141e] = 7b945b8b, %l7 = 000000000000001e
	lduh	[%i4+0x01e],%l7		! %l7 = 0000000000005b8b
!	Mem[0000000030101410] = 2684fb6c, %l2 = 0000000000000066
	ldsba	[%i4+%o5]0x89,%l2	! %l2 = 000000000000006c
!	Mem[0000000010141406] = 731c2e09, %l5 = 000000000000004b, %asi = 80
	ldsha	[%i5+0x006]%asi,%l5	! %l5 = 0000000000002e09
!	Mem[000000001018141c] = 3e41334b, %l1 = ffd832d440251315, %asi = 80
	lduwa	[%i6+0x01c]%asi,%l1	! %l1 = 000000003e41334b
!	Mem[0000000010141408] = 561c3d1e, %l0 = 00000000000066d2
	ldsha	[%i5+%o4]0x88,%l0	! %l0 = 0000000000003d1e

p0_label_9:
!	Starting 10 instruction Store Burst
!	%f8  = 30a368c0, Mem[0000000010001408] = 192af776
	sta	%f8 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 30a368c0
!	Mem[0000000030041410] = 0000000c, %l2 = 000000000000006c
	swapa	[%i1+%o5]0x81,%l2	! %l2 = 000000000000000c
!	%l5 = 0000000000002e09, Mem[0000000030101410] = 2684fb6c
	stba	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 2684fb09
!	%l4 = 0000000000000000, Mem[00000000100c1438] = 1e22913a376ac023
	stx	%l4,[%i3+0x038]		! Mem[00000000100c1438] = 0000000000000000
!	%l5 = 0000000000002e09, %l6 = 06fbc6823e41334b, %l1 = 000000003e41334b
	add	%l5,%l6,%l1		! %l1 = 06fbc6823e416154
!	%f10 = 6192bffe, Mem[00000000100c1438] = 00000000
	sta	%f10,[%i3+0x038]%asi	! Mem[00000000100c1438] = 6192bffe
!	%l0 = 0000000000003d1e, Mem[00000000300c1408] = d0bc9fb8
	stwa	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00003d1e
!	%l3 = 000000000000003f, Mem[0000000010141438] = 3008e3fa, %asi = 80
	stwa	%l3,[%i5+0x038]%asi	! Mem[0000000010141438] = 0000003f
!	Mem[00000000300c1410] = 4142098e, %l7 = 0000000000005b8b
	ldstuba	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000041
!	Mem[0000000010001410] = e4d61d72, %l1 = 000000003e416154
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 00000000e4d61d72

p0_label_10:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00003d1e, %l3 = 000000000000003f
	lduwa	[%i3+%o4]0x81,%l3	! %l3 = 0000000000003d1e
!	Mem[0000000030101408] = 3e96baa6, %l7 = 0000000000000041
	lduba	[%i4+%o4]0x81,%l7	! %l7 = 000000000000003e
!	Mem[0000000030081408] = 9f742269 e6cb9501, %l2 = 0000000c, %l3 = 00003d1e
	ldda	[%i2+%o4]0x89,%l2	! %l2 = 00000000e6cb9501 000000009f742269
!	Mem[0000000030081408] = 0195cbe6, %l1 = 00000000e4d61d72
	lduba	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000001
!	Mem[000000001000141a] = 2d419642, %l5 = 0000000000002e09, %asi = 80
	lduba	[%i0+0x01a]%asi,%l5	! %l5 = 0000000000000096
!	Mem[0000000010181418] = 06fbc682, %l7 = 000000000000003e
	ldsw	[%i6+0x018],%l7		! %l7 = 0000000006fbc682
!	Mem[0000000030001400] = 58bb80a8, %l6 = 06fbc6823e41334b
	lduba	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000058
!	Mem[0000000030041408] = 867cc075, %l2 = 00000000e6cb9501
	ldswa	[%i1+%o4]0x89,%l2	! %l2 = ffffffff867cc075
!	Mem[0000000030081410] = af034f71, %l2 = ffffffff867cc075
	ldswa	[%i2+%o5]0x81,%l2	! %l2 = ffffffffaf034f71
!	Mem[0000000030181408] = e915c84f b867904f, %l4 = 00000000, %l5 = 00000096
	ldda	[%i6+%o4]0x89,%l4	! %l4 = 00000000b867904f 00000000e915c84f

p0_label_11:
!	Starting 10 instruction Store Burst
!	%l6 = 00000058, %l7 = 06fbc682, Mem[0000000030041410] = 0000006c 285f2743
	stda	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000058 06fbc682
!	Mem[00000000211c0001] = 42ff63a8, %l7 = 0000000006fbc682
	ldstuba	[%o2+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	%l3 = 000000009f742269, Mem[0000000030181400] = 15508ae879afee59
	stxa	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000009f742269
!	%l4 = 00000000b867904f, Mem[0000000020800001] = 04647f48, %asi = 80
	stba	%l4,[%o1+0x001]%asi	! Mem[0000000020800000] = 044f7f48
!	Mem[0000000010001400] = 3dcbf7fd, %l4 = 00000000b867904f
	swapa	[%i0+%g0]0x80,%l4	! %l4 = 000000003dcbf7fd
	membar	#Sync			! Added by membar checker (4)
!	%f3  = 141b705f, Mem[0000000010101404] = 2b32bf29
	sta	%f3 ,[%i4+0x004]%asi	! Mem[0000000010101404] = 141b705f
!	%l6 = 00000058, %l7 = 000000ff, Mem[00000000100c1408] = 011ebd96 191cd18f
	stda	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000058 000000ff
!	%l1 = 0000000000000001, Mem[0000000010001400] = b867904f
	stba	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = 0167904f
!	Mem[00000000100c1430] = 4641261c, %l4 = 000000003dcbf7fd, %asi = 80
	swapa	[%i3+0x030]%asi,%l4	! %l4 = 000000004641261c
!	%l3 = 000000009f742269, Mem[00000000201c0000] = 66d28718
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 22698718

p0_label_12:
!	Starting 10 instruction Load Burst
!	Code Fragment 3, seed = 426293
p0_fragment_1:
!	%l0 = 0000000000003d1e
	setx	0xc59a9427c773b37e,%g7,%l0 ! %l0 = c59a9427c773b37e
!	%l1 = 0000000000000001
	setx	0xd5474cc8fdc9e829,%g7,%l1 ! %l1 = d5474cc8fdc9e829
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = c59a9427c773b37e
	setx	0xde3c24a3c7e798e4,%g7,%l0 ! %l0 = de3c24a3c7e798e4
!	%l1 = d5474cc8fdc9e829
	setx	0x57daa4e50df148af,%g7,%l1 ! %l1 = 57daa4e50df148af
p0_fragment_1_end:
!	Mem[0000000010041418] = 519ddba2, %f18 = ff3c34f6
	lda	[%i1+0x018]%asi,%f18	! %f18 = 519ddba2
!	Mem[0000000030101410] = 2684fb09, %f20 = 4119a064
	lda	[%i4+%o5]0x89,%f20	! %f20 = 2684fb09
!	Mem[0000000010181404] = 3dcbf7fd, %l1 = 57daa4e50df148af, %asi = 80
	lduha	[%i6+0x004]%asi,%l1	! %l1 = 0000000000003dcb
!	Mem[00000000100c1410] = 45424604 25191b85, %l4 = 4641261c, %l5 = e915c84f
	ldd	[%i3+%o5],%l4		! %l4 = 0000000045424604 0000000025191b85
!	Mem[0000000010141408] = 4f7d972a561c3d1e, %f28 = 11fcfc7c 66008d1d
	ldda	[%i5+%o4]0x88,%f28	! %f28 = 4f7d972a 561c3d1e
!	Mem[0000000010101430] = 11fcfc7c66008d1d, %f4  = c6a921e1 6c284217, %asi = 80
	ldda	[%i4+0x030]%asi,%f4 	! %f4  = 11fcfc7c 66008d1d
!	Mem[0000000030001408] = 6b929d26, %l4 = 0000000045424604
	ldswa	[%i0+%o4]0x81,%l4	! %l4 = 000000006b929d26
!	Mem[0000000010041408] = cfe58036d61e2ec8, %f24 = 729b3a90 6b31f661
	ldda	[%i1+%o4]0x88,%f24	! %f24 = cfe58036 d61e2ec8
!	Code Fragment 4, seed = 82877
p0_fragment_2:
!	%l0 = de3c24a3c7e798e4
	setx	0x51a03980e98ea73e,%g7,%l0 ! %l0 = 51a03980e98ea73e
!	%l1 = 0000000000003dcb
	setx	0x4f49c316d6cd8fe9,%g7,%l1 ! %l1 = 4f49c316d6cd8fe9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 51a03980e98ea73e
	setx	0x42ad41415885b4a4,%g7,%l0 ! %l0 = 42ad41415885b4a4
!	%l1 = 4f49c316d6cd8fe9
	setx	0x3d339ad0ab2f986f,%g7,%l1 ! %l1 = 3d339ad0ab2f986f
p0_fragment_2_end:

p0_label_13:
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffaf034f71, Mem[00000000100c1410] = 04464245
	stba	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 04464271
!	Mem[0000000030181410] = 545c5d07, %l1 = 3d339ad0ab2f986f
	ldstuba	[%i6+%o5]0x89,%l1	! %l1 = 0000000000000007
!	Mem[0000000010001400] = 0167904faa47034a, %f22 = 6b594bc2 7b945b8b
	ldda	[%i0+%g0]0x80,%f22	! %f22 = 0167904f aa47034a
!	%l7 = 00000000000000ff, Mem[00000000100c1408] = 58000000
	stba	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 580000ff
!	%l0 = 5885b4a4, %l1 = 00000007, Mem[0000000030041400] = 08d58f14 f93bed10
	stda	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 5885b4a4 00000007
!	%f8  = 30a368c0, Mem[0000000010181420] = 048adb50
	st	%f8 ,[%i6+0x020]	! Mem[0000000010181420] = 30a368c0
!	%l5 = 0000000025191b85, Mem[0000000010101410] = 4119a064
	stwa	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 25191b85
!	%l0 = 42ad41415885b4a4, Mem[0000000010181408] = 41f7f58e
	stha	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 41f7b4a4
!	Mem[000000001014143b] = 0000003f, %l2 = ffffffffaf034f71
	ldstub	[%i5+0x03b],%l2		! %l2 = 000000000000003f
!	Mem[0000000030041410] = 00000058, %l7 = 00000000000000ff
	ldstuba	[%i1+%o5]0x81,%l7	! %l7 = 0000000000000000

p0_label_14:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = a880bb58, %l0 = 42ad41415885b4a4
	lduwa	[%i0+%g0]0x89,%l0	! %l0 = 00000000a880bb58
!	%l6 = 0000000000000058, %l7 = 0000000000000000, %y  = 00000000
	sdiv	%l6,%l7,%l6		! Div by zero, %l0 = 00000000a880bb80
!	Mem[0000000030101410] = 2684fb09, %f16 = ff8c61f8
	lda	[%i4+%o5]0x89,%f16	! %f16 = 2684fb09
!	Mem[0000000030081400] = 6819e867, %l4 = 000000006b929d26
	lduha	[%i2+%g0]0x89,%l4	! %l4 = 000000000000e867
!	Mem[0000000010101408] = 6f4fa229f6343cff, %l7 = 0000000000000000
	ldxa	[%i4+%o4]0x88,%l7	! %l7 = 6f4fa229f6343cff
!	Mem[0000000030001400] = 58bb80a82ffa7519, %l1 = 0000000000000007
	ldxa	[%i0+%g0]0x81,%l1	! %l1 = 58bb80a82ffa7519
!	Mem[0000000010001400] = 0167904f, %l1 = 58bb80a82ffa7519
	ldsha	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000167
!	Mem[00000000211c0000] = 42ff63a8, %l1 = 0000000000000167
	lduh	[%o2+%g0],%l1		! %l1 = 00000000000042ff
!	Mem[0000000030141408] = 644209546fe7cc91, %l4 = 000000000000e867
	ldxa	[%i5+%o4]0x89,%l4	! %l4 = 644209546fe7cc91
!	Mem[00000000100c1408] = ff000000 580000ff, %l6 = 00000058, %l7 = f6343cff
	ldda	[%i3+%o4]0x88,%l6	! %l6 = 00000000580000ff 00000000ff000000

p0_label_15:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 6fe7cc91, %l5 = 0000000025191b85
	ldstuba	[%i5+%o4]0x89,%l5	! %l5 = 0000000000000091
!	%l0 = a880bb80, %l1 = 000042ff, Mem[0000000030041400] = 5885b4a4 00000007
	stda	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = a880bb80 000042ff
!	Mem[00000000211c0001] = 42ff63a8, %l4 = 644209546fe7cc91
	ldstub	[%o2+0x001],%l4		! %l4 = 00000000000000ff
!	%f26 = 11eeac4e 1b447267, Mem[0000000030081400] = 6819e867 d9321e45
	stda	%f26,[%i2+%g0]0x89	! Mem[0000000030081400] = 11eeac4e 1b447267
!	%l5 = 0000000000000091, Mem[0000000010001410] = 3e416154
	stwa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000091
!	%l5 = 0000000000000091, Mem[0000000020800000] = 044f7f48, %asi = 80
	stha	%l5,[%o1+0x000]%asi	! Mem[0000000020800000] = 00917f48
!	%l0 = a880bb80, %l1 = 000042ff, Mem[0000000010001400] = 4f906701 4a0347aa
	stda	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = a880bb80 000042ff
!	%l3 = 000000009f742269, Mem[0000000010041410] = fdf7cb3d
	stba	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 69f7cb3d
!	%l6 = 00000000580000ff, Mem[0000000030041408] = 75c07c86
	stba	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = ffc07c86
!	%l4 = 00000000000000ff, Mem[0000000010141410] = 3a13eac469b63545
	stxa	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000000000ff

p0_label_16:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 0195cbe6, %l2 = 000000000000003f
	ldsba	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000001
!	Mem[00000000100c1408] = ff000058, %f20 = 2684fb09
	lda	[%i3+%o4]0x80,%f20	! %f20 = ff000058
!	Mem[0000000010101408] = f6343cff, %l7 = 00000000ff000000
	ldswa	[%i4+%o4]0x88,%l7	! %l7 = fffffffff6343cff
!	Mem[0000000030001400] = a880bb58, %l3 = 000000009f742269
	lduha	[%i0+%g0]0x89,%l3	! %l3 = 000000000000bb58
!	Mem[0000000030181408] = 4f9067b8, %l5 = 0000000000000091
	lduba	[%i6+%o4]0x81,%l5	! %l5 = 000000000000004f
!	Mem[0000000010041410] = 69f7cb3d26a0c1c5, %f18 = 519ddba2 29a24f6f
	ldd	[%i1+%o5],%f18		! %f18 = 69f7cb3d 26a0c1c5
!	Mem[0000000030181408] = 4f9067b8, %l1 = 00000000000042ff
	ldsba	[%i6+%o4]0x81,%l1	! %l1 = 000000000000004f
!	Mem[0000000010101408] = f6343cff, %l2 = 0000000000000001
	ldswa	[%i4+%o4]0x88,%l2	! %l2 = fffffffff6343cff
!	Mem[0000000010041408] = c82e1ed6, %l2 = fffffffff6343cff
	lduha	[%i1+%o4]0x80,%l2	! %l2 = 000000000000c82e
!	Mem[0000000030181400] = 00000000, %l4 = 00000000000000ff
	ldsha	[%i6+%g0]0x89,%l4	! %l4 = 0000000000000000

p0_label_17:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[00000000300c1400] = 181c4dc8208559b9
	stxa	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000000000000
!	Mem[00000000100c1434] = 655d8c3d, %l7 = 00000000f6343cff, %asi = 80
	swapa	[%i3+0x034]%asi,%l7	! %l7 = 00000000655d8c3d
!	%l2 = 000000000000c82e, Mem[0000000030001400] = 58bb80a8
	stha	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = c82e80a8
!	Mem[0000000010041408] = d61e2ec8, %l5 = 000000000000004f
	ldstuba	[%i1+%o4]0x88,%l5	! %l5 = 00000000000000c8
!	Mem[000000001010141c] = 7b945b8b, %l6 = 00000000580000ff, %asi = 80
	swapa	[%i4+0x01c]%asi,%l6	! %l6 = 000000007b945b8b
!	Mem[0000000010081408] = 1315b636714f03af, %l4 = 0000000000000000, %l6 = 000000007b945b8b
	add	%i2,0x08,%g1
	casxa	[%g1]0x80,%l4,%l6	! %l6 = 1315b636714f03af
!	Mem[0000000030181410] = 545c5dff, %l3 = 000000000000bb58
	swapa	[%i6+%o5]0x89,%l3	! %l3 = 00000000545c5dff
!	%l2 = 000000000000c82e, Mem[0000000030101400] = 1d847228
	stha	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = c82e7228
!	Mem[00000000100c1400] = 00000000, %l6 = 00000000714f03af
	swapa	[%i3+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%f23 = aa47034a, Mem[0000000030101408] = 3e96baa6
	sta	%f23,[%i4+%o4]0x81	! Mem[0000000030101408] = aa47034a

p0_label_18:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 28722ec8, %l2 = 000000000000c82e
	lduwa	[%i4+%g0]0x89,%l2	! %l2 = 0000000028722ec8
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010101400] = ff8c61f8 141b705f ff3c34f6 29a24f6f
!	Mem[0000000010101410] = 25191b85 10671065 6b594bc2 580000ff
!	Mem[0000000010101420] = 729b3a90 6b31f661 11eeac4e 1b447267
!	Mem[0000000010101430] = 11fcfc7c 66008d1d 5ad3829a 56c19003
	ldda	[%i4+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010101400
!	Mem[0000000030081410] = af034f71, %l1 = 000000000000004f
	lduba	[%i2+%o5]0x81,%l1	! %l1 = 00000000000000af
!	Mem[0000000030001410] = 143e2f71, %l6 = 0000000000000000
	lduwa	[%i0+%o5]0x89,%l6	! %l6 = 00000000143e2f71
!	Mem[0000000030081408] = e6cb9501, %l2 = 0000000028722ec8
	ldswa	[%i2+%o4]0x89,%l2	! %l2 = ffffffffe6cb9501
!	Mem[0000000010081408] = 1315b636, %l5 = 00000000000000c8
	lduha	[%i2+%o4]0x80,%l5	! %l5 = 0000000000001315
!	Mem[0000000030001400] = a8802ec8, %f13 = 2dba3f8d
	lda	[%i0+%g0]0x89,%f13	! %f13 = a8802ec8
!	Mem[0000000010001400] = 80bb80a8, %f0  = 1d847228
	lda	[%i0+0x000]%asi,%f0 	! %f0 = 80bb80a8
!	Mem[0000000030181400] = 00000000, %l3 = 00000000545c5dff
	ldswa	[%i6+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101410] = 25191b85, %l4 = 0000000000000000
	lduha	[%i4+%o5]0x80,%l4	! %l4 = 0000000000002519

p0_label_19:
!	Starting 10 instruction Store Burst
!	%f3  = 141b705f, %f16 = ff8c61f8, %f6  = 1975fa2f
	fsubs	%f3 ,%f16,%f6 		! %f6  = ffcc61f8
	membar	#Sync			! Added by membar checker (6)
!	%f6  = ffcc61f8 a880bb58, %l7 = 00000000655d8c3d
!	Mem[0000000010101418] = 6b594bc2580000ff
	add	%i4,0x018,%g1
	stda	%f6,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010101418] = 585980a8f86100ff
!	Mem[0000000010081400] = 38f90d05, %l0 = 00000000a880bb80
	swapa	[%i2+%g0]0x88,%l0	! %l0 = 0000000038f90d05
!	%l4 = 0000000000002519, Mem[0000000030081400] = 6772441b
	stha	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 2519441b
!	%f16 = ff8c61f8, Mem[000000001018143c] = 4c6d3fc3
	st	%f16,[%i6+0x03c]	! Mem[000000001018143c] = ff8c61f8
!	Mem[00000000300c1408] = 1e3d0000, %l5 = 0000000000001315
	swapa	[%i3+%o4]0x89,%l5	! %l5 = 000000001e3d0000
!	Mem[0000000010001410] = 91000000, %l1 = 00000000000000af
	swapa	[%i0+%o5]0x80,%l1	! %l1 = 0000000091000000
!	Mem[00000000300c1400] = 00000000, %l2 = 00000000e6cb9501
	swapa	[%i3+%g0]0x81,%l2	! %l2 = 0000000000000000
!	%f10 = 6192bffe 20902957, Mem[0000000030101410] = 2684fb09 1742286c
	stda	%f10,[%i4+%o5]0x89	! Mem[0000000030101410] = 6192bffe 20902957
!	%l6 = 143e2f71, %l7 = 655d8c3d, Mem[0000000010041400] = 66000000 75939289
	stda	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 143e2f71 655d8c3d

p0_label_20:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 6971666ca880bb80, %f12 = 1ad2c1ac a8802ec8
	ldda	[%i2+%g0]0x88,%f12	! %f12 = 6971666c a880bb80
!	Mem[0000000010181410] = 24250942, %l3 = 0000000000000000
	lduba	[%i6+%o5]0x88,%l3	! %l3 = 0000000000000042
!	Mem[00000000300c1408] = 7f1a150100001315, %f16 = ff8c61f8 141b705f
	ldda	[%i3+%o4]0x89,%f16	! %f16 = 7f1a1501 00001315
!	Mem[0000000010101412] = 25191b85, %l4 = 0000000000002519
	ldub	[%i4+0x012],%l4		! %l4 = 000000000000001b
!	Mem[00000000100c1408] = 580000ff, %l1 = 0000000091000000
	lduwa	[%i3+%o4]0x88,%l1	! %l1 = 00000000580000ff
!	%l6 = 143e2f71, %l7 = 655d8c3d, Mem[0000000030181408] = 4f9067b8 4fc815e9
	stda	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 143e2f71 655d8c3d
!	Mem[0000000010101400] = ff8c61f8, %l1 = 00000000580000ff
	ldswa	[%i4+%g0]0x80,%l1	! %l1 = ffffffffff8c61f8
!	Mem[0000000010081408] = 1315b636714f03af, %f26 = 11eeac4e 1b447267
	ldda	[%i2+%o4]0x80,%f26	! %f26 = 1315b636 714f03af
!	Mem[0000000010001410] = 000000af, %l5 = 000000001e3d0000
	lduha	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000000
!	%l7 = 00000000655d8c3d, %l3 = 0000000000000042, %y  = 00000000
	smul	%l7,%l3,%l2		! %l2 = 0000001a221e27ba, %y = 0000001a

p0_label_21:
!	Starting 10 instruction Store Burst
!	%l2 = 0000001a221e27ba, Mem[0000000030001400] = 1975fa2fa8802ec8
	stxa	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000001a221e27ba
!	Mem[00000000300c1400] = 0195cbe6, %l4 = 000000000000001b
	swapa	[%i3+%g0]0x89,%l4	! %l4 = 000000000195cbe6
!	%f26 = 1315b636 714f03af, %l6 = 00000000143e2f71
!	Mem[00000000100c1428] = 447a98ee71944887
	add	%i3,0x028,%g1
	stda	%f26,[%g1+%l6]ASI_PST16_P ! Mem[00000000100c1428] = 447a98ee719403af
!	%l3 = 0000000000000042, Mem[0000000030001410] = 143e2f71
	stba	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = 143e2f42
!	%l0 = 0000000038f90d05, %l1 = ffffffffff8c61f8, %l6 = 00000000143e2f71
	xor	%l0,%l1,%l6		! %l6 = ffffffffc7756cfd
!	Mem[0000000030081400] = 1b441925, %l0 = 0000000038f90d05
	ldstuba	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000025
!	%l1 = ffffffffff8c61f8, Mem[0000000010081400] = a880bb80
	stha	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = a88061f8
!	%l1 = ffffffffff8c61f8, Mem[0000000020800000] = 00917f48
	sth	%l1,[%o1+%g0]		! Mem[0000000020800000] = 61f87f48
!	%f13 = a880bb80, Mem[0000000010041400] = 143e2f71
	sta	%f13,[%i1+%g0]0x80	! Mem[0000000010041400] = a880bb80
!	%f2  = 3e96baa6, Mem[0000000030141410] = 5879a9f4
	sta	%f2 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 3e96baa6

p0_label_22:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101418] = 585980a8f86100ff, %f10 = 6192bffe 20902957
	ldd	[%i4+0x018],%f10	! %f10 = 585980a8 f86100ff
!	%f22 = 6b594bc2, %f0  = 80bb80a8, %f10 = 585980a8
	fdivs	%f22,%f0 ,%f10		! %f10 = ff800000
!	Mem[0000000010141410] = 00000000, %l2 = 0000001a221e27ba
	lduha	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000020800000] = 61f87f48, %l6 = ffffffffc7756cfd, %asi = 80
	lduha	[%o1+0x000]%asi,%l6	! %l6 = 00000000000061f8
!	Mem[00000000201c0000] = 22698718, %l2 = 0000000000000000
	ldub	[%o0+%g0],%l2		! %l2 = 0000000000000022
!	Mem[0000000030081400] = ff19441b, %l4 = 000000000195cbe6
	ldsha	[%i2+%g0]0x81,%l4	! %l4 = ffffffffffffff19
!	Mem[0000000010101400] = ff8c61f8, %l7 = 00000000655d8c3d
	lduwa	[%i4+%g0]0x80,%l7	! %l7 = 00000000ff8c61f8
!	Mem[0000000010101410] = 25191b85, %l7 = 00000000ff8c61f8
	lduha	[%i4+%o5]0x80,%l7	! %l7 = 0000000000002519
!	Mem[0000000010181400] = 00000000, %l5 = 0000000000000000
	lduha	[%i6+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081432] = 2ea63fbc, %l2 = 0000000000000022, %asi = 80
	lduba	[%i2+0x032]%asi,%l2	! %l2 = 000000000000003f

p0_label_23:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[00000000100c1400] = 714f03af000000c8
	stxa	%l5,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000000000000000
!	%f14 = 3d2c254a 314a39f3, Mem[0000000010181400] = 00000000 fdf7cb3d
	stda	%f14,[%i6+%g0]0x88	! Mem[0000000010181400] = 3d2c254a 314a39f3
!	%f16 = 7f1a1501 00001315, Mem[0000000010041410] = 69f7cb3d 26a0c1c5
	stda	%f16,[%i1+%o5]0x80	! Mem[0000000010041410] = 7f1a1501 00001315
!	%l5 = 0000000000000000, Mem[0000000030181408] = 712f3e14
	stba	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = 712f3e00
!	%f20 = 25191b85 10671065, %l7 = 0000000000002519
!	Mem[0000000010141420] = 0bfc12f038dcb141
	add	%i5,0x020,%g1
	stda	%f20,[%g1+%l7]ASI_PST16_P ! Mem[0000000010141420] = 251912f038dc1065
!	Mem[0000000010081400] = a88061f8, %l7 = 0000000000002519
	swapa	[%i2+%g0]0x88,%l7	! %l7 = 00000000a88061f8
!	%l6 = 00000000000061f8, Mem[00000000300c1400] = 1b000000
	stha	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 61f80000
!	Mem[00000000201c0000] = 22698718, %l5 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l5	! %l5 = 0000000000000022
!	%l6 = 00000000000061f8, Mem[0000000010141410] = 00000000000000ff
	stxa	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000000061f8
!	%f10 = ff800000 f86100ff, Mem[0000000030001408] = 6b929d26 2f9838df
	stda	%f10,[%i0+%o4]0x81	! Mem[0000000030001408] = ff800000 f86100ff

p0_label_24:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 000000009f742269, %f30 = 5ad3829a 56c19003
	ldda	[%i6+%g0]0x81,%f30	! %f30 = 00000000 9f742269
!	Mem[00000000211c0000] = 42ff63a8, %l2 = 000000000000003f, %asi = 80
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = 00000000000042ff
!	Mem[00000000300c1408] = 7f1a1501 00001315, %l6 = 000061f8, %l7 = a88061f8
	ldda	[%i3+%o4]0x89,%l6	! %l6 = 0000000000001315 000000007f1a1501
!	Mem[0000000010081410] = 0000007d, %l1 = ffffffffff8c61f8
	lduwa	[%i2+%o5]0x88,%l1	! %l1 = 000000000000007d
!	Mem[0000000010141400] = a9c67e58, %l4 = ffffffffffffff19
	ldswa	[%i5+%g0]0x80,%l4	! %l4 = ffffffffa9c67e58
!	Mem[0000000010041408] = d61e2eff, %l4 = ffffffffa9c67e58
	lduha	[%i1+%o4]0x88,%l4	! %l4 = 0000000000002eff
!	Mem[00000000100c1430] = 3dcbf7fd, %f4  = 11fcfc7c
	lda	[%i3+0x030]%asi,%f4 	! %f4 = 3dcbf7fd
!	Mem[0000000030081400] = ff19441b 4eacee11, %l2 = 000042ff, %l3 = 00000042
	ldda	[%i2+%g0]0x81,%l2	! %l2 = 00000000ff19441b 000000004eacee11
!	Mem[00000000201c0001] = ff698718, %l2 = 00000000ff19441b, %asi = 80
	ldsba	[%o0+0x001]%asi,%l2	! %l2 = 0000000000000069
!	Mem[0000000030141400] = 8886780c, %l2 = 0000000000000069
	ldsha	[%i5+%g0]0x89,%l2	! %l2 = 000000000000780c

p0_label_25:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 04464271, %l4 = 0000000000002eff
	swapa	[%i3+%o5]0x88,%l4	! %l4 = 0000000004464271
!	Mem[0000000030141408] = 6fe7ccff, %l5 = 0000000000000022
	ldstuba	[%i5+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%f28 = 11fcfc7c 66008d1d, Mem[0000000010181410] = 24250942 258a7e74
	stda	%f28,[%i6+%o5]0x88	! Mem[0000000010181410] = 11fcfc7c 66008d1d
!	%f9  = 653ecdd1, %f29 = 66008d1d, %f2  = 3e96baa6
	fdivs	%f9 ,%f29,%f2 		! %f2  = 3ebdfc5e
!	Mem[0000000010141408] = 1e3d1c56, %l7 = 000000007f1a1501
	swapa	[%i5+%o4]0x80,%l7	! %l7 = 000000001e3d1c56
!	%f12 = 6971666c a880bb80, Mem[0000000030101408] = aa47034a 141b705f
	stda	%f12,[%i4+%o4]0x81	! Mem[0000000030101408] = 6971666c a880bb80
!	%f18 = ff3c34f6 29a24f6f, Mem[0000000030081410] = af034f71 36b6cc00
	stda	%f18,[%i2+%o5]0x81	! Mem[0000000030081410] = ff3c34f6 29a24f6f
!	%l1 = 000000000000007d, Mem[000000001000141c] = 0d6aec0b, %asi = 80
	stha	%l1,[%i0+0x01c]%asi	! Mem[000000001000141c] = 007dec0b
!	%l3 = 000000004eacee11, Mem[0000000030181408] = 003e2f71
	stha	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = ee112f71
!	%f30 = 00000000 9f742269, Mem[0000000010181400] = f3394a31 4a252c3d
	stda	%f30,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 9f742269

p0_label_26:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 1d8d0066, %l1 = 000000000000007d
	lduba	[%i6+%o5]0x80,%l1	! %l1 = 000000000000001d
!	Mem[0000000030081408] = 0195cbe6, %l6 = 0000000000001315
	lduba	[%i2+%o4]0x81,%l6	! %l6 = 0000000000000001
!	Mem[0000000030101408] = 6c667169, %l7 = 000000001e3d1c56
	lduwa	[%i4+%o4]0x89,%l7	! %l7 = 000000006c667169
!	Mem[0000000010001418] = 2d419642, %l0 = 0000000000000025
	ldsw	[%i0+0x018],%l0		! %l0 = 000000002d419642
!	Mem[000000001014141f] = 4a6f6f6b, %l4 = 0000000004464271, %asi = 80
	ldsba	[%i5+0x01f]%asi,%l4	! %l4 = 000000000000006b
!	Mem[0000000030181408] = ee112f71, %f24 = 729b3a90
	lda	[%i6+%o4]0x81,%f24	! %f24 = ee112f71
!	Mem[0000000010081400] = 00002519, %f18 = ff3c34f6
	lda	[%i2+%g0]0x88,%f18	! %f18 = 00002519
!	Mem[0000000010081408] = 1315b636714f03af, %f22 = 6b594bc2 580000ff
	ldda	[%i2+%o4]0x80,%f22	! %f22 = 1315b636 714f03af
!	Mem[0000000030001408] = ff800000, %l1 = 000000000000001d
	lduha	[%i0+%o4]0x81,%l1	! %l1 = 000000000000ff80
!	Mem[0000000010041408] = cfe58036d61e2eff, %l4 = 000000000000006b
	ldxa	[%i1+%o4]0x88,%l4	! %l4 = cfe58036d61e2eff

p0_label_27:
!	Starting 10 instruction Store Burst
!	%l3 = 000000004eacee11, Mem[0000000010041400] = 3d8c5d6580bb80a8
	stxa	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000004eacee11
!	Mem[0000000010041408] = ff2e1ed6, %l7 = 000000006c667169
	swapa	[%i1+%o4]0x80,%l7	! %l7 = 00000000ff2e1ed6
!	%l5 = 00000000000000ff, imm = fffffffffffff4e5, %l4 = cfe58036d61e2eff
	xnor	%l5,-0xb1b,%l4		! %l4 = 0000000000000be5
!	%l7 = 00000000ff2e1ed6, Mem[0000000010181410] = 1d8d00667cfcfc11, %asi = 80
	stxa	%l7,[%i6+0x010]%asi	! Mem[0000000010181410] = 00000000ff2e1ed6
!	Mem[0000000030041410] = 580000ff, %l1 = 000000000000ff80
	ldstuba	[%i1+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%l4 = 0000000000000be5, Mem[0000000030101410] = 6192bffe20902957
	stxa	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000000000000be5
!	Mem[0000000030081410] = f6343cff, %l2 = 000000000000780c
	swapa	[%i2+%o5]0x89,%l2	! %l2 = 00000000f6343cff
!	Mem[0000000030001400] = 221e27ba, %l6 = 0000000000000001
	swapa	[%i0+%g0]0x89,%l6	! %l6 = 00000000221e27ba
!	%f24 = ee112f71, %f24 = ee112f71
	fcmps	%fcc3,%f24,%f24		! %fcc3 = 0
!	Mem[0000000030001400] = 01000000, %l5 = 00000000000000ff
	swapa	[%i0+%g0]0x81,%l5	! %l5 = 0000000001000000

p0_label_28:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 580000ff, %l1 = 00000000000000ff
	lduba	[%i3+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141410] = 00000000, %f11 = f86100ff
	lda	[%i5+%o5]0x80,%f11	! %f11 = 00000000
!	Mem[0000000010041410] = 1513000001151a7f, %f24 = ee112f71 6b31f661
	ldda	[%i1+%o5]0x88,%f24	! %f24 = 15130000 01151a7f
!	Mem[0000000010081400] = 19250000, %l6 = 00000000221e27ba
	ldsba	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000019
!	Mem[0000000010041430] = 4a54495c, %f4  = 3dcbf7fd
	ld	[%i1+0x030],%f4 	! %f4 = 4a54495c
!	Mem[0000000010101410] = 851b1925, %l5 = 0000000001000000
	ldswa	[%i4+%o5]0x88,%l5	! %l5 = ffffffff851b1925
!	Mem[0000000010081408] = 1315b636, %l5 = ffffffff851b1925
	ldsba	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000013
!	%l1 = 00000000000000ff, %l5 = 0000000000000013, %l3 = 000000004eacee11
	and	%l1,%l5,%l3		! %l3 = 0000000000000013
!	Mem[0000000030001410] = 422f3e14, %l2 = 00000000f6343cff
	lduba	[%i0+%o5]0x81,%l2	! %l2 = 0000000000000042
!	Mem[0000000030041410] = ff00005806fbc682, %l6 = 0000000000000019
	ldxa	[%i1+%o5]0x81,%l6	! %l6 = ff00005806fbc682

p0_label_29:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[0000000010081420] = 140359d0, %asi = 80
	stwa	%l1,[%i2+0x020]%asi	! Mem[0000000010081420] = 000000ff
!	%o3 = deadbeefdeadbeef
	set	share3_start,%o3	! set %o3[0] to VA
!	Mem[0000000021800101] = 2560d898, %l1 = 00000000000000ff
	ldstuba	[%o3+0x101]%asi,%l1	! %l1 = 0000000000000060
!	Mem[0000000010101408] = f6343cff, %l4 = 0000000000000be5
	swapa	[%i4+%o4]0x88,%l4	! %l4 = 00000000f6343cff
!	%l3 = 0000000000000013, Mem[0000000030181408] = 712f11ee
	stha	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 712f0013
!	%l3 = 0000000000000013, Mem[0000000010181410] = 00000000
	stha	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000013
!	%l2 = 00000042, %l3 = 00000013, Mem[00000000300c1408] = 15130000 01151a7f
	stda	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000042 00000013
!	%l5 = 0000000000000013, Mem[0000000010041410] = 7f1a1501
	stwa	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000013
!	%l6 = 06fbc682, %l7 = ff2e1ed6, Mem[0000000010041428] = 344ec22e 440d04c7
	std	%l6,[%i1+0x028]		! Mem[0000000010041428] = 06fbc682 ff2e1ed6
!	Mem[000000001014143c] = 47050fe3, %l0 = 2d419642, %l6 = 06fbc682
	add	%i5,0x3c,%g1
	casa	[%g1]0x80,%l0,%l6	! %l6 = 0000000047050fe3
!	Mem[0000000010101408] = e50b0000, %l5 = 0000000000000013
	ldstuba	[%i4+%o4]0x80,%l5	! %l5 = 00000000000000e5

p0_label_30:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 11eeac4e, %l5 = 00000000000000e5
	ldsw	[%i1+%g0],%l5		! %l5 = 0000000011eeac4e
!	Mem[0000000030081410] = 0c780000, %l6 = 0000000047050fe3
	ldsha	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000c78
!	Mem[00000000300c1410] = 8e0942ff, %l4 = 00000000f6343cff
	ldsha	[%i3+%o5]0x89,%l4	! %l4 = 00000000000042ff
!	Mem[00000000211c0000] = 42ff63a8, %l5 = 0000000011eeac4e, %asi = 80
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = 00000000000042ff
!	Mem[0000000030001408] = 000080ff, %l6 = 0000000000000c78
	ldsba	[%i0+%o4]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030081410] = 0000780c, %l0 = 000000002d419642
	lduwa	[%i2+%o5]0x89,%l0	! %l0 = 000000000000780c
!	Mem[0000000010181428] = 520b230e, %f15 = 314a39f3
	lda	[%i6+0x028]%asi,%f15	! %f15 = 520b230e
!	Mem[0000000010101400] = f8618cff, %l1 = 0000000000000060
	ldsba	[%i4+%g0]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001408] = c068a330, %l3 = 0000000000000013
	lduba	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000030
!	Mem[0000000030041400] = 80bb80a8, %l3 = 0000000000000030
	ldsha	[%i1+%g0]0x81,%l3	! %l3 = ffffffffffff80bb

p0_label_31:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041432] = 4a54495c, %l6 = ffffffffffffffff, %asi = 80
	lduha	[%i1+0x032]%asi,%l6	! %l6 = 000000000000495c
!	%l0 = 000000000000780c, Mem[0000000010181404] = 9f742269, %asi = 80
	stwa	%l0,[%i6+0x004]%asi	! Mem[0000000010181404] = 0000780c
!	%f6  = ffcc61f8, Mem[0000000030081400] = ff19441b
	sta	%f6 ,[%i2+%g0]0x81	! Mem[0000000030081400] = ffcc61f8
!	Mem[0000000030081408] = 0195cbe6, %l4 = 00000000000042ff
	ldstuba	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000001
!	%l0 = 000000000000780c, Mem[00000000300c1410] = 8e0942ff
	stwa	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000780c
!	%l3 = ffffffffffff80bb, Mem[0000000010181410] = 13000000
	stha	%l3,[%i6+%o5]0x80	! Mem[0000000010181410] = 80bb0000
!	Mem[0000000010081400] = 00002519, %l5 = 00000000000042ff
	swapa	[%i2+%g0]0x88,%l5	! %l5 = 0000000000002519
!	%l0 = 0000780c, %l1 = ffffffff, Mem[0000000010141408] = 7f1a1501 2a977d4f
	stda	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000780c ffffffff
!	%f9  = 653ecdd1, %f24 = 15130000, %f14 = 3d2c254a
	fmuls	%f9 ,%f24,%f14		! %f14 = 3adb205e
!	%l7 = 00000000ff2e1ed6, Mem[0000000010181410] = 0000bb80
	stwa	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = ff2e1ed6

p0_label_32:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = f861ccff, %l0 = 000000000000780c
	ldsha	[%i2+%g0]0x89,%l0	! %l0 = ffffffffffffccff
!	Mem[0000000010001408] = 30a368c0, %l5 = 0000000000002519
	ldsba	[%i0+%o4]0x80,%l5	! %l5 = 0000000000000030
!	Mem[0000000030101410] = e50b0000, %l3 = ffffffffffff80bb
	ldsba	[%i4+%o5]0x81,%l3	! %l3 = ffffffffffffffe5
!	Mem[0000000010141410] = 00000000, %l3 = ffffffffffffffe5
	ldsba	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181418] = 06fbc682, %l0 = ffffffffffffccff
	ldsw	[%i6+0x018],%l0		! %l0 = 0000000006fbc682
!	%l6 = 000000000000495c, %l1 = ffffffffffffffff, %l6 = 000000000000495c
	xor	%l6,%l1,%l6		! %l6 = ffffffffffffb6a3
!	%f16 = 7f1a1501, %f7  = a880bb58, %f4  = 4a54495c 66008d1d
	fsmuld	%f16,%f7 ,%f4 		! %f4  = c5035ed0 b3bcd600
!	Mem[0000000010041430] = 4a54495c44751a7d, %l7 = 00000000ff2e1ed6
	ldx	[%i1+0x030],%l7		! %l7 = 4a54495c44751a7d
!	Mem[0000000030081408] = e6cb95ff, %l3 = 0000000000000000
	lduba	[%i2+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %l4 = 0000000000000001
	ldswa	[%i6+%g0]0x80,%l4	! %l4 = 0000000000000000

p0_label_33:
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ff, Mem[0000000030101400] = c82e7228
	stwa	%l3,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff
!	%l2 = 00000042, %l3 = 000000ff, Mem[0000000010081400] = ff420000 6c667169
	stda	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000042 000000ff
!	%f20 = 25191b85 10671065, %l1 = ffffffffffffffff
!	Mem[0000000010181418] = 06fbc6823e41334b
	add	%i6,0x018,%g1
	stda	%f20,[%g1+%l1]ASI_PST32_P ! Mem[0000000010181418] = 25191b8510671065
!	Mem[0000000010081408] = 1315b636, %l2 = 0000000000000042
	ldstuba	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000013
!	%l4 = 00000000, %l5 = 00000030, Mem[0000000010181400] = 00000000 0000780c
	stda	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 00000030
!	%l0 = 0000000006fbc682, Mem[0000000010081404] = 000000ff, %asi = 80
	stha	%l0,[%i2+0x004]%asi	! Mem[0000000010081404] = c68200ff
!	Mem[0000000010141400] = a9c67e58, %l0 = 0000000006fbc682
	swapa	[%i5+%g0]0x80,%l0	! %l0 = 00000000a9c67e58
!	%l0 = 00000000a9c67e58, Mem[0000000010041400] = 4eacee11
	stha	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 4eac7e58
!	%f24 = 15130000 01151a7f, %l3 = 00000000000000ff
!	Mem[0000000010081418] = 23cd2e6669bcbd1f
	add	%i2,0x018,%g1
	stda	%f24,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010081418] = 7f1a150100001315
!	Mem[0000000030041408] = 867cc0ff, %l5 = 0000000000000030
	ldstuba	[%i1+%o4]0x89,%l5	! %l5 = 00000000000000ff

p0_label_34:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 3e96baa6, %l0 = 00000000a9c67e58
	lduwa	[%i5+%o5]0x81,%l0	! %l0 = 000000003e96baa6
!	Mem[0000000010001410] = 000000af, %l0 = 000000003e96baa6
	ldswa	[%i0+%o5]0x80,%l0	! %l0 = 00000000000000af
!	Mem[0000000030141400] = 8886780c, %l6 = ffffffffffffb6a3
	ldswa	[%i5+%g0]0x89,%l6	! %l6 = ffffffff8886780c
!	Mem[0000000010041408] = 6971666c, %f18 = 00002519
	lda	[%i1+%o4]0x88,%f18	! %f18 = 6971666c
!	Mem[0000000021800100] = 25ffd898, %l7 = 4a54495c44751a7d, %asi = 80
	lduba	[%o3+0x100]%asi,%l7	! %l7 = 0000000000000025
!	Mem[0000000010081408] = ff15b636714f03af, %l4 = 0000000000000000
	ldxa	[%i2+%o4]0x80,%l4	! %l4 = ff15b636714f03af
!	Mem[00000000100c1400] = 0000000000000000, %l6 = ffffffff8886780c, %asi = 80
	ldxa	[%i3+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000201c0000] = ff698718, %l3 = 00000000000000ff, %asi = 80
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 000000000000ff69
!	Code Fragment 4, seed = 128041
p0_fragment_3:
!	%l0 = 00000000000000af
	setx	0x4248ae21f5c14fde,%g7,%l0 ! %l0 = 4248ae21f5c14fde
!	%l1 = ffffffffffffffff
	setx	0xe01d740420245689,%g7,%l1 ! %l1 = e01d740420245689
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4248ae21f5c14fde
	setx	0x49b69f683e9e3944,%g7,%l0 ! %l0 = 49b69f683e9e3944
!	%l1 = e01d740420245689
	setx	0x57f6d6cf03b57b0f,%g7,%l1 ! %l1 = 57f6d6cf03b57b0f
p0_fragment_3_end:
!	Mem[0000000030141408] = 6fe7ccff, %f0  = 80bb80a8
	lda	[%i5+%o4]0x89,%f0 	! %f0 = 6fe7ccff

p0_label_35:
!	Starting 10 instruction Store Burst
!	%f7  = a880bb58, Mem[0000000010081410] = 7d000000
	sta	%f7 ,[%i2+%o5]0x80	! Mem[0000000010081410] = a880bb58
!	%l4 = ff15b636714f03af, Mem[00000000100c140c] = 000000ff, %asi = 80
	stba	%l4,[%i3+0x00c]%asi	! Mem[00000000100c140c] = af0000ff
!	%l6 = 0000000000000000, Mem[0000000010181410] = d61e2eff
	stba	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 001e2eff
!	%l0 = 49b69f683e9e3944, Mem[0000000030041410] = 580000ff
	stha	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 58003944
!	%f6  = ffcc61f8 a880bb58, %l7 = 0000000000000025
!	Mem[0000000030041428] = 2111adde1cd533b7
	add	%i1,0x028,%g1
	stda	%f6,[%g1+%l7]ASI_PST16_S ! Mem[0000000030041428] = 211161f81cd5bb58
!	%f30 = 00000000 9f742269, Mem[0000000010181400] = 00000000 30000000
	stda	%f30,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000 9f742269
!	%l1 = 57f6d6cf03b57b0f, %l4 = ff15b636714f03af, %l2 = 0000000000000013
	add	%l1,%l4,%l2		! %l2 = 570c8d0575047ebe
!	Mem[0000000010001400] = 80bb80a8, %l6 = 0000000000000000, %asi = 80
	swapa	[%i0+0x000]%asi,%l6	! %l6 = 0000000080bb80a8
!	%l3 = 000000000000ff69, Mem[0000000010101400] = ff8c61f8, %asi = 80
	stba	%l3,[%i4+0x000]%asi	! Mem[0000000010101400] = 698c61f8
!	%f22 = 1315b636 714f03af, Mem[0000000030001410] = 422f3e14 44dfe955
	stda	%f22,[%i0+%o5]0x81	! Mem[0000000030001410] = 1315b636 714f03af

p0_label_36:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000000, %f8  = 30a368c0
	lda	[%i0+%g0]0x88,%f8 	! %f8 = 00000000
!	Mem[0000000030081400] = f861ccff, %l2 = 570c8d0575047ebe
	lduwa	[%i2+%g0]0x89,%l2	! %l2 = 00000000f861ccff
!	Mem[0000000030081408] = ff95cbe66922749f, %f2  = 3ebdfc5e 141b705f
	ldda	[%i2+%o4]0x81,%f2 	! %f2  = ff95cbe6 6922749f
!	Mem[0000000020800000] = 61f87f48, %l3 = 000000000000ff69
	ldsb	[%o1+%g0],%l3		! %l3 = 0000000000000061
!	Mem[00000000201c0001] = ff698718, %l3 = 0000000000000061
	ldsb	[%o0+0x001],%l3		! %l3 = 0000000000000069
!	Mem[0000000010001438] = 1f3a5d1a08c27083, %l2 = 00000000f861ccff, %asi = 80
	ldxa	[%i0+0x038]%asi,%l2	! %l2 = 1f3a5d1a08c27083
!	Mem[0000000010181410] = d61e2eff ff2e1e00, %l4 = 714f03af, %l5 = 000000ff
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 00000000ff2e1e00 00000000d61e2eff
!	Mem[0000000010081410] = a880bb58, %f25 = 01151a7f
	lda	[%i2+%o5]0x80,%f25	! %f25 = a880bb58
!	Mem[0000000010141408] = 0000780c, %l3 = 0000000000000069
	lduwa	[%i5+%o4]0x80,%l3	! %l3 = 000000000000780c
!	Mem[00000000100c1418] = 1c11b662, %f24 = 15130000
	lda	[%i3+0x018]%asi,%f24	! %f24 = 1c11b662

p0_label_37:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 867cc0ff, %l6 = 0000000080bb80a8
	ldstuba	[%i1+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000020800000] = 61f87f48, %l3 = 000000000000780c
	ldstuba	[%o1+0x000]%asi,%l3	! %l3 = 0000000000000061
!	%l5 = 00000000d61e2eff, Mem[000000001004140c] = 3680e5cf
	stw	%l5,[%i1+0x00c]		! Mem[000000001004140c] = d61e2eff
!	%f14 = 3adb205e, Mem[0000000010081400] = 42000000
	sta	%f14,[%i2+%g0]0x88	! Mem[0000000010081400] = 3adb205e
!	Mem[00000000300c1410] = 0000780c, %l2 = 1f3a5d1a08c27083
	ldstuba	[%i3+%o5]0x89,%l2	! %l2 = 000000000000000c
!	Mem[0000000030141410] = a6ba963e, %l4 = 00000000ff2e1e00
	ldstuba	[%i5+%o5]0x89,%l4	! %l4 = 000000000000003e
!	Mem[0000000030041408] = 867cc0ff, %l1 = 0000000003b57b0f
	swapa	[%i1+%o4]0x89,%l1	! %l1 = 00000000867cc0ff
!	%f0  = 6fe7ccff, %f3  = 6922749f
	fcmpes	%fcc2,%f0 ,%f3 		! %fcc2 = 2
!	%f26 = 1315b636, Mem[0000000010101410] = 851b1925
	sta	%f26,[%i4+%o5]0x88	! Mem[0000000010101410] = 1315b636
!	%l1 = 00000000867cc0ff, Mem[00000000100c1408] = 580000ff
	stwa	%l1,[%i3+%o4]0x88	! Mem[00000000100c1408] = 867cc0ff

p0_label_38:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 001e2effff2e1ed6, %l0 = 49b69f683e9e3944
	ldxa	[%i6+%o5]0x80,%l0	! %l0 = 001e2effff2e1ed6
!	Mem[00000000218000c0] = 5677fc68, %l5 = 00000000d61e2eff
	lduh	[%o3+0x0c0],%l5		! %l5 = 0000000000005677
!	Mem[0000000010101408] = ff0b0000, %f9  = 653ecdd1
	lda	[%i4+%o4]0x80,%f9 	! %f9 = ff0b0000
!	Mem[0000000010181410] = 001e2eff, %l3 = 0000000000000061
	ldsba	[%i6+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181408] = 13002f71, %l1 = 00000000867cc0ff
	ldsba	[%i6+%o4]0x81,%l1	! %l1 = 0000000000000013
!	Mem[000000001010141c] = f86100ff, %l6 = 00000000000000ff
	lduw	[%i4+0x01c],%l6		! %l6 = 00000000f86100ff
!	Mem[0000000010141414] = 000061f8, %l2 = 000000000000000c, %asi = 80
	lduha	[%i5+0x014]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181400] = 00000000 9f742269, %l0 = ff2e1ed6, %l1 = 00000013
	ldda	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000000 000000009f742269
!	%f1  = 231ab099, %f27 = 714f03af, %f31 = 9f742269
	fmuls	%f1 ,%f27,%f31		! %f31 = 54fa2e0b
!	Mem[0000000010141408] = 0000780c, %f31 = 54fa2e0b
	lda	[%i5+%o4]0x80,%f31	! %f31 = 0000780c

p0_label_39:
!	Starting 10 instruction Store Burst
!	%l1 = 000000009f742269, Mem[0000000030181408] = 13002f71
	stha	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 22692f71
!	Mem[0000000010141400] = 06fbc682 731c2e09 0000780c ffffffff
!	%f0  = 6fe7ccff 231ab099 ff95cbe6 6922749f
!	%f4  = c5035ed0 b3bcd600 ffcc61f8 a880bb58
!	%f8  = 00000000 ff0b0000 ff800000 00000000
!	%f12 = 6971666c a880bb80 3adb205e 520b230e
	stda	%f0 ,[%i5+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010141400
!	%l0 = 0000000000000000, Mem[0000000030181410] = 58bb0000
	stwa	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	%l4 = 0000003e, %l5 = 00005677, Mem[0000000010181428] = 520b230e 5a15d627
	std	%l4,[%i6+0x028]		! Mem[0000000010181428] = 0000003e 00005677
!	%l2 = 0000000000000000, Mem[0000000010141400] = 99b01a23
	stwa	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	Mem[0000000010081422] = 000000ff, %l3 = 0000000000000000
	ldstub	[%i2+0x022],%l3		! %l3 = 0000000000000000
!	%l7 = 0000000000000025, Mem[0000000010141410] = c5035ed0b3bcd600
	stxa	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000000025
!	Mem[00000000201c0001] = ff698718, %l1 = 000000009f742269
	ldstub	[%o0+0x001],%l1		! %l1 = 0000000000000069
!	%l4 = 0000003e, %l5 = 00005677, Mem[0000000030081400] = f861ccff 11eeac4e
	stda	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000003e 00005677
!	%f17 = 00001315, Mem[0000000010181408] = a4b4f741
	sta	%f17,[%i6+%o4]0x80	! Mem[0000000010181408] = 00001315

p0_label_40:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00000000, %l0 = 0000000000000000
	ldsba	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000000
!	%l3 = 0000000000000000, Mem[00000000100c1400] = 0000000000000000
	stx	%l3,[%i3+%g0]		! Mem[00000000100c1400] = 0000000000000000
!	Mem[0000000010081400] = 5e20db3ac68200ff, %f16 = 7f1a1501 00001315, %asi = 80
	ldda	[%i2+0x000]%asi,%f16	! %f16 = 5e20db3a c68200ff
!	Mem[0000000030041408] = 03b57b0f, %l3 = 0000000000000000
	ldswa	[%i1+%o4]0x89,%l3	! %l3 = 0000000003b57b0f
!	Mem[0000000010041400] = 587eac4e, %l4 = 000000000000003e
	ldsha	[%i1+%g0]0x80,%l4	! %l4 = 000000000000587e
!	Mem[0000000030181408] = 712f6922, %l2 = 0000000000000000
	ldsba	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000022
!	Mem[0000000030041410] = 44390058, %l2 = 0000000000000022
	ldsba	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000044
!	Mem[0000000010101408] = 6f4fa22900000bff, %l4 = 000000000000587e
	ldxa	[%i4+%o4]0x88,%l4	! %l4 = 6f4fa22900000bff
!	Mem[0000000030141408] = ffcce76f 54094264, %l4 = 00000bff, %l5 = 00005677
	ldda	[%i5+%o4]0x81,%l4	! %l4 = 00000000ffcce76f 0000000054094264
!	%l1 = 0000000000000069, %l2 = 0000000000000044, %l7 = 0000000000000025
	or	%l1,%l2,%l7		! %l7 = 000000000000006d

p0_label_41:
!	Starting 10 instruction Store Burst
!	%f26 = 1315b636 714f03af, Mem[00000000100c1408] = ffc07c86 af0000ff
	stda	%f26,[%i3+%o4]0x80	! Mem[00000000100c1408] = 1315b636 714f03af
!	Mem[0000000010041400] = 587eac4e 00000000 6c667169 d61e2eff
!	%f0  = 6fe7ccff 231ab099 ff95cbe6 6922749f
!	%f4  = c5035ed0 b3bcd600 ffcc61f8 a880bb58
!	%f8  = 00000000 ff0b0000 ff800000 00000000
!	%f12 = 6971666c a880bb80 3adb205e 520b230e
	stda	%f0 ,[%i1+%g0]ASI_BLK_PL	! Block Store to 0000000010041400
!	%l5 = 0000000054094264, Mem[0000000030101410] = 00000be5
	stwa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 54094264
!	%f8  = 00000000 ff0b0000, Mem[0000000010041410] = b3bcd600 c5035ed0
	stda	%f8 ,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000 ff0b0000
!	%l2 = 00000044, %l3 = 03b57b0f, Mem[0000000030001410] = 1315b636 714f03af
	stda	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000044 03b57b0f
!	%l1 = 0000000000000069, %l0 = 0000000000000000, %l0 = 0000000000000000
	and	%l1,%l0,%l0		! %l0 = 0000000000000000
!	%l3 = 0000000003b57b0f, Mem[00000000300c1400] = 61f8000000000000
	stxa	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000003b57b0f
!	%f24 = 1c11b662 a880bb58, Mem[0000000010141410] = 25000000 00000000
	stda	%f24,[%i5+%o5]0x80	! Mem[0000000010141410] = 1c11b662 a880bb58
!	%f19 = 29a24f6f, Mem[00000000300c1408] = 00000042
	sta	%f19,[%i3+%o4]0x81	! Mem[00000000300c1408] = 29a24f6f
!	%l5 = 0000000054094264, Mem[0000000010141410] = 62b6111c
	stba	%l5,[%i5+%o5]0x88	! Mem[0000000010141410] = 62b61164

p0_label_42:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 58003944, %l1 = 0000000000000069
	ldswa	[%i1+%o5]0x89,%l1	! %l1 = 0000000058003944
!	Mem[0000000010001408] = 30a368c078fa77ef, %f16 = 5e20db3a c68200ff
	ldda	[%i0+%o4]0x80,%f16	! %f16 = 30a368c0 78fa77ef
!	%f19 = 29a24f6f, %f26 = 1315b636
	fsqrts	%f19,%f26		! %f26 = 34902349
!	%l2 = 0000000000000044, immd = ffffff7c, %y  = 0000001a
	umul	%l2,-0x084,%l7		! %l7 = 00000043ffffdcf0, %y = 00000043
!	Mem[0000000010101408] = ff0b0000, %l3 = 0000000003b57b0f
	ldswa	[%i4+%o4]0x80,%l3	! %l3 = ffffffffff0b0000
!	Mem[00000000100c1408] = 36b61513, %l3 = ffffffffff0b0000
	ldsba	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000013
!	Mem[0000000030041400] = 80bb80a8, %l4 = 00000000ffcce76f
	ldsha	[%i1+%g0]0x81,%l4	! %l4 = ffffffffffff80bb
!	Mem[00000000201c0000] = ffff8718, %l4 = ffffffffffff80bb, %asi = 80
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001438] = 1f3a5d1a, %l0 = 0000000000000000
	ldsw	[%i0+0x038],%l0		! %l0 = 000000001f3a5d1a
!	Mem[0000000030181400] = 00000000, %l4 = ffffffffffffffff
	lduba	[%i6+%g0]0x89,%l4	! %l4 = 0000000000000000

p0_label_43:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = ff2e1e00, %l0 = 000000001f3a5d1a
	ldstuba	[%i6+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0001] = ffff8718, %l5 = 0000000054094264
	ldstuba	[%o0+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	%l2 = 00000044, %l3 = 00000013, Mem[0000000010041400] = 231ab099 6fe7ccff
	stda	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000044 00000013
!	%f4  = c5035ed0 b3bcd600, Mem[0000000010141400] = 00000000 6fe7ccff
	stda	%f4 ,[%i5+%g0]0x88	! Mem[0000000010141400] = c5035ed0 b3bcd600
!	Mem[00000000100c1400] = 00000000, %l7 = 00000000ffffdcf0
	swapa	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001408] = ff800000, %l1 = 0000000058003944
	swapa	[%i0+%o4]0x81,%l1	! %l1 = 00000000ff800000
!	%f20 = 25191b85, Mem[0000000010001410] = af000000
	sta	%f20,[%i0+%o5]0x88	! Mem[0000000010001410] = 25191b85
!	%l4 = 00000000, %l5 = 000000ff, Mem[00000000100c1410] = 00002eff 851b1925
	stda	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000 000000ff
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010141410] = 6411b662, %l3 = 0000000000000013
	swapa	[%i5+%o5]0x80,%l3	! %l3 = 000000006411b662
!	%l3 = 000000006411b662, imm = 0000000000000c52, %l2 = 0000000000000044
	add	%l3,0xc52,%l2		! %l2 = 000000006411c2b4

p0_label_44:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000, %l1 = 00000000ff800000
	ldsha	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c143c] = 00000000, %l5 = 00000000000000ff, %asi = 80
	ldsha	[%i3+0x03c]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141410] = ff96baa6, %l6 = 00000000f86100ff
	ldswa	[%i5+%o5]0x81,%l6	! %l6 = ffffffffff96baa6
!	Mem[0000000030041408] = 03b57b0f, %l5 = 0000000000000000
	lduba	[%i1+%o4]0x89,%l5	! %l5 = 000000000000000f
!	Mem[0000000030081400] = 0000003e, %l1 = 0000000000000000
	lduwa	[%i2+%g0]0x89,%l1	! %l1 = 000000000000003e
!	Mem[0000000010181400] = 9f742269, %l2 = 000000006411c2b4
	ldstuba	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000069
!	Mem[0000000010101408] = 00000bff, %f19 = 29a24f6f
	lda	[%i4+%o4]0x88,%f19	! %f19 = 00000bff
!	Mem[0000000010181400] = ff22749f, %l4 = 0000000000000000
	lduha	[%i6+%g0]0x80,%l4	! %l4 = 000000000000ff22
!	Mem[0000000010181410] = ff1e2effff2e1ed6, %f30 = 00000000 0000780c
	ldda	[%i6+%o5]0x80,%f30	! %f30 = ff1e2eff ff2e1ed6
!	Mem[0000000030041408] = 0f7bb503, %l1 = 000000000000003e
	lduba	[%i1+%o4]0x81,%l1	! %l1 = 000000000000000f

p0_label_45:
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000000f, Mem[0000000010041400] = 44000000
	stba	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 0f000000
!	Mem[0000000030041408] = 0f7bb503, %l4 = 000000000000ff22
	swapa	[%i1+%o4]0x81,%l4	! %l4 = 000000000f7bb503
!	%l5 = 000000000000000f, Mem[0000000010081400] = ff0082c63adb205e
	stxa	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000000000000f
!	Mem[0000000010041410] = ff0b0000, %l4 = 000000000f7bb503
	ldstuba	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000000
!	%f14 = 3adb205e 520b230e, %l7 = 0000000000000000
!	Mem[0000000030181400] = 000000009f742269
	stda	%f14,[%i6+%l7]ASI_PST32_S ! Mem[0000000030181400] = 000000009f742269
!	%l2 = 0000000000000069, Mem[0000000030101410] = 6442095400000000
	stxa	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000000000000069
!	%l2 = 00000069, %l3 = 6411b662, Mem[0000000010181408] = 00001315 2fb45b2f
	stda	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000069 6411b662
!	Mem[00000000100c1408] = 1315b636, %l4 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l4	! %l4 = 000000001315b636
!	%f30 = ff1e2eff ff2e1ed6, %l7 = 0000000000000000
!	Mem[00000000300c1430] = 53f5734c45c6a6ad
	add	%i3,0x030,%g1
	stda	%f30,[%g1+%l7]ASI_PST8_SL ! Mem[00000000300c1430] = 53f5734c45c6a6ad
!	Mem[0000000010041430] = 80bb80a86c667169, %l6 = ffffffffff96baa6, %l3 = 000000006411b662
	add	%i1,0x30,%g1
	casxa	[%g1]0x80,%l6,%l3	! %l3 = 80bb80a86c667169

p0_label_46:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = c068a330, %l0 = 0000000000000000
	lduba	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000030
!	Mem[0000000020800041] = 7dc87378, %l2 = 0000000000000069, %asi = 80
	ldsba	[%o1+0x041]%asi,%l2	! %l2 = ffffffffffffffc8
!	Mem[00000000300c1408] = 29a24f6f, %l1 = 000000000000000f
	lduwa	[%i3+%o4]0x81,%l1	! %l1 = 0000000029a24f6f
!	%l3 = 80bb80a86c667169, immd = 00000000000002df, %l108 = 0000000000000001
	sdivx	%l3,0x2df,%l1		! %l1 = ffd3ac3c22fa37e2
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000010041400] = 0f000000 13000000 9f742269 e6cb95ff
!	Mem[0000000010041410] = ff000bff 00000000 58bb80a8 f861ccff
!	Mem[0000000010041420] = 00000bff 00000000 00000000 000080ff
!	Mem[0000000010041430] = 80bb80a8 6c667169 0e230b52 5e20db3a
	ldda	[%i1+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	Mem[0000000010101410] = 65106710 1315b636, %l4 = 1315b636, %l5 = 0000000f
	ldda	[%i4+%o5]0x88,%l4	! %l4 = 000000001315b636 0000000065106710
!	%l3 = 80bb80a86c667169, imm = fffffffffffff62a, %l1 = ffd3ac3c22fa37e2
	or	%l3,-0x9d6,%l1		! %l1 = fffffffffffff76b
!	Mem[0000000030141400] = 0c788688 78d63779 ffcce76f 54094264
!	Mem[0000000030141410] = ff96baa6 337bb9b5 61c93dd2 4aadfb5b
!	Mem[0000000030141420] = 18b03920 270aa0b1 741dfb5e 7661db37
!	Mem[0000000030141430] = 2395000c 5429086d 5a7cbeaa 1ad911d3
	ldda	[%i5+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030141400
!	%l2 = ffffffffffffffc8, %l2 = ffffffffffffffc8, %y  = 00000043
	umul	%l2,%l2,%l4		! %l4 = ffffff9000000c40, %y = ffffff90
!	Mem[0000000010181410] = d61e2eff ff2e1eff, %l2 = ffffffc8, %l3 = 6c667169
	ldda	[%i6+%o5]0x88,%l2	! %l2 = 00000000ff2e1eff 00000000d61e2eff

p0_label_47:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (9)
!	%l6 = ff96baa6, %l7 = 00000000, Mem[0000000010041430] = 80bb80a8 6c667169
	std	%l6,[%i1+0x030]		! Mem[0000000010041430] = ff96baa6 00000000
!	%f6  = ffcc61f8, Mem[0000000010101400] = 698c61f8
	sta	%f6 ,[%i4+%g0]0x80	! Mem[0000000010101400] = ffcc61f8
!	Mem[0000000010181400] = 9f7422ff, %l2 = 00000000ff2e1eff
	ldstuba	[%i6+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[000000001014141c] = f861ccff, %l4 = 00000c40, %l0 = 00000030
	add	%i5,0x1c,%g1
	casa	[%g1]0x80,%l4,%l0	! %l0 = 00000000f861ccff
!	%f7  = a880bb58, Mem[0000000010081400] = 0000000f
	sta	%f7 ,[%i2+%g0]0x88	! Mem[0000000010081400] = a880bb58
!	%l6 = ff96baa6, %l7 = 00000000, Mem[0000000010141400] = 00d6bcb3 d05e03c5
	stda	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = ff96baa6 00000000
!	%l3 = 00000000d61e2eff, Mem[0000000010041418] = 58bb80a8, %asi = 80
	stha	%l3,[%i1+0x018]%asi	! Mem[0000000010041418] = 2eff80a8
!	%l5 = 0000000065106710, Mem[0000000010181428] = 0000003e00005677, %asi = 80
	stxa	%l5,[%i6+0x028]%asi	! Mem[0000000010181428] = 0000000065106710
!	Mem[0000000030041400] = 80bb80a8, %l1 = fffffffffffff76b
	ldstuba	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000080
!	Mem[0000000020800001] = fff87f48, %l6 = ffffffffff96baa6
	ldstub	[%o1+0x001],%l6		! %l6 = 00000000000000f8

p0_label_48:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = b5b97b33 a6ba96ff, %l4 = 00000c40, %l5 = 65106710
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 00000000a6ba96ff 00000000b5b97b33
!	Mem[0000000010001400] = 00000000, %l4 = 00000000a6ba96ff
	lduwa	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = ff96baa600000000, %f20 = ff96baa6 337bb9b5
	ldda	[%i5+%g0]0x80,%f20	! %f20 = ff96baa6 00000000
!	Mem[0000000010101408] = 6f4fa22900000bff, %l2 = 00000000000000ff
	ldxa	[%i4+%o4]0x88,%l2	! %l2 = 6f4fa22900000bff
!	Mem[00000000100c1408] = 00000000, %l4 = 0000000000000000
	ldsha	[%i3+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081400] = a880bb58, %l6 = 00000000000000f8
	lduwa	[%i2+%g0]0x88,%l6	! %l6 = 00000000a880bb58
!	Mem[0000000010101427] = 6b31f661, %l1 = 0000000000000080, %asi = 80
	ldsba	[%i4+0x027]%asi,%l1	! %l1 = 0000000000000061
!	Mem[0000000010101428] = 11eeac4e1b447267, %f22 = 61c93dd2 4aadfb5b
	ldd	[%i4+0x028],%f22	! %f22 = 11eeac4e 1b447267
!	Mem[0000000010101408] = 00000bff, %l4 = 0000000000000000
	lduha	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000bff
!	Mem[00000000100c1400] = ffffdcf0, %l4 = 0000000000000bff
	ldswa	[%i3+%g0]0x80,%l4	! %l4 = ffffffffffffdcf0

p0_label_49:
!	Starting 10 instruction Store Burst
!	%l2 = 00000bff, %l3 = d61e2eff, Mem[0000000030181400] = 00000000 6922749f
	stda	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000bff d61e2eff
!	%l4 = ffffdcf0, %l5 = b5b97b33, Mem[0000000010041400] = 0f000000 13000000
	stda	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = ffffdcf0 b5b97b33
!	%l6 = 00000000a880bb58, Mem[0000000010041400] = 337bb9b5f0dcffff
	stxa	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000a880bb58
!	%f22 = 11eeac4e, %f29 = 5429086d
	fcmpes	%fcc2,%f22,%f29		! %fcc2 = 1
!	%l3 = 00000000d61e2eff, Mem[0000000030101410] = 6900000000000000
	stxa	%l3,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000d61e2eff
!	%l2 = 6f4fa22900000bff, Mem[0000000010101428] = 11eeac4e
	stw	%l2,[%i4+0x028]		! Mem[0000000010101428] = 00000bff
!	%l5 = 00000000b5b97b33, Mem[0000000030101400] = 000000ff
	stba	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 330000ff
!	Mem[0000000010041408] = 9f742269, %l1 = 0000000000000061, %asi = 80
	swapa	[%i1+0x008]%asi,%l1	! %l1 = 000000009f742269
!	%f4  = c5035ed0, Mem[0000000010041410] = ff000bff
	st	%f4 ,[%i1+%o5]		! Mem[0000000010041410] = c5035ed0
!	%f2  = ff95cbe6, Mem[0000000030181408] = 22692f71
	sta	%f2 ,[%i6+%o4]0x81	! Mem[0000000030181408] = ff95cbe6

p0_label_50:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 30a368c0, %l4 = ffffffffffffdcf0
	lduba	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000030
!	Mem[0000000010001400] = 00000000ff420000, %l3 = 00000000d61e2eff
	ldxa	[%i0+%g0]0x80,%l3	! %l3 = 00000000ff420000
!	Mem[0000000010001408] = c068a330, %l2 = 6f4fa22900000bff
	lduha	[%i0+%o4]0x88,%l2	! %l2 = 000000000000a330
!	Mem[0000000010181408] = 00000069, %l7 = 0000000000000000
	lduwa	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000069
!	Mem[0000000030101408] = 6c667169, %l3 = 00000000ff420000
	ldswa	[%i4+%o4]0x89,%l3	! %l3 = 000000006c667169
!	Mem[0000000010001408] = ef77fa78c068a330, %f2  = ff95cbe6 6922749f
	ldda	[%i0+%o4]0x88,%f2 	! %f2  = ef77fa78 c068a330
!	Mem[0000000010001408] = c068a330, %l1 = 000000009f742269
	ldsha	[%i0+%o4]0x88,%l1	! %l1 = ffffffffffffa330
!	Mem[0000000010001400] = 00000000, %l3 = 000000006c667169
	lduba	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1430] = 3dcbf7fd f6343cff, %l6 = a880bb58, %l7 = 00000069, %asi = 80
	ldda	[%i3+0x030]%asi,%l6	! %l6 = 000000003dcbf7fd 00000000f6343cff
!	Mem[0000000030041408] = 0000ff22, %l2 = 000000000000a330
	ldsba	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000

p0_label_51:
!	Starting 10 instruction Store Burst
!	%f3  = c068a330, %f17 = 78d63779
	fcmpes	%fcc0,%f3 ,%f17		! %fcc0 = 1
!	%l5 = 00000000b5b97b33, Mem[0000000010041438] = 0e230b52, %asi = 80
	stha	%l5,[%i1+0x038]%asi	! Mem[0000000010041438] = 7b330b52
!	%f28 = 2395000c, %f17 = 78d63779, %f18 = ffcce76f
	fmuls	%f28,%f17,%f18		! %f18 = 5cf95ca7
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010141420] = 00000bff 00000000, %asi = 80
	stda	%l2,[%i5+0x020]%asi	! Mem[0000000010141420] = 00000000 00000000
!	Mem[000000001004140c] = e6cb95ff, %l3 = 0000000000000000
	swap	[%i1+0x00c],%l3		! %l3 = 00000000e6cb95ff
!	Mem[0000000020800041] = 7dc87378, %l5 = 00000000b5b97b33
	ldstuba	[%o1+0x041]%asi,%l5	! %l5 = 00000000000000c8
!	Mem[00000000100c1408] = 00000000, %l7 = 00000000f6343cff
	ldstuba	[%i3+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = ff95cbe6, %l7 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	%l2 = 00000000, %l3 = e6cb95ff, Mem[0000000010101400] = ffcc61f8 141b705f, %asi = 80
	stda	%l2,[%i4+0x000]%asi	! Mem[0000000010101400] = 00000000 e6cb95ff
!	Code Fragment 3, seed = 145032
p0_fragment_4:
!	%l0 = 00000000f861ccff
	setx	0x2b769125b38acbe6,%g7,%l0 ! %l0 = 2b769125b38acbe6
!	%l1 = ffffffffffffa330
	setx	0x81e500e64e6bb411,%g7,%l1 ! %l1 = 81e500e64e6bb411
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2b769125b38acbe6
	setx	0x8193e50633bbc04c,%g7,%l0 ! %l0 = 8193e50633bbc04c
!	%l1 = 81e500e64e6bb411
	setx	0x46f7f907622ef397,%g7,%l1 ! %l1 = 46f7f907622ef397
p0_fragment_4_end:

p0_label_52:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 9f742269e6cb95ff, %f22 = 11eeac4e 1b447267
	ldda	[%i5+%o4]0x80,%f22	! %f22 = 9f742269 e6cb95ff
!	Mem[0000000030141400] = 0c78868878d63779, %f30 = 5a7cbeaa 1ad911d3
	ldda	[%i5+%g0]0x81,%f30	! %f30 = 0c788688 78d63779
!	Mem[0000000030081400] = 0000003e, %l1 = 46f7f907622ef397
	ldsba	[%i2+%g0]0x89,%l1	! %l1 = 000000000000003e
!	Mem[00000000211c0000] = 42ff63a8, %l7 = 00000000000000ff, %asi = 80
	ldsba	[%o2+0x000]%asi,%l7	! %l7 = 0000000000000042
!	Mem[0000000010041418] = 2eff80a8f861ccff, %f12 = 6971666c a880bb80, %asi = 80
	ldda	[%i1+0x018]%asi,%f12	! %f12 = 2eff80a8 f861ccff
!	Mem[0000000021800000] = 469b4fd8, %l6 = 000000003dcbf7fd, %asi = 80
	ldsba	[%o3+0x000]%asi,%l6	! %l6 = 0000000000000046
!	Mem[0000000010101410] = 36b6151310671065, %l4 = 0000000000000030
	ldxa	[%i4+%o5]0x80,%l4	! %l4 = 36b6151310671065
!	Mem[0000000010181400] = ff22749f, %l1 = 000000000000003e
	ldsba	[%i6+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010081408] = ff15b636, %l1 = ffffffffffffffff
	lduha	[%i2+%o4]0x80,%l1	! %l1 = 000000000000ff15
!	Mem[0000000030081410] = 6f4fa229 0000780c, %l6 = 00000046, %l7 = 00000042
	ldda	[%i2+%o5]0x89,%l6	! %l6 = 000000000000780c 000000006f4fa229

p0_label_53:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141420] = 0000000000000000, %l4 = 36b6151310671065, %l3 = 00000000e6cb95ff
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l4,%l3	! %l3 = 0000000000000000
!	Mem[000000001000141c] = 007dec0b, %l6 = 000000000000780c, %asi = 80
	swapa	[%i0+0x01c]%asi,%l6	! %l6 = 00000000007dec0b
!	%l2 = 0000000000000000, Mem[0000000010081429] = 41f7f58e, %asi = 80
	stba	%l2,[%i2+0x029]%asi	! Mem[0000000010081428] = 4100f58e
!	%f23 = e6cb95ff, Mem[0000000010101418] = 585980a8
	sta	%f23,[%i4+0x018]%asi	! Mem[0000000010101418] = e6cb95ff
!	Code Fragment 3, seed = 786691
p0_fragment_5:
!	%l0 = 8193e50633bbc04c
	setx	0x0d20a3893e16e30e,%g7,%l0 ! %l0 = 0d20a3893e16e30e
!	%l1 = 000000000000ff15
	setx	0x8aacf4afd66942b9,%g7,%l1 ! %l1 = 8aacf4afd66942b9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0d20a3893e16e30e
	setx	0xc5bc733735672e74,%g7,%l0 ! %l0 = c5bc733735672e74
!	%l1 = 8aacf4afd66942b9
	setx	0xe87bc5caab38293f,%g7,%l1 ! %l1 = e87bc5caab38293f
p0_fragment_5_end:
!	%l4 = 10671065, %l5 = 000000c8, Mem[00000000100c1408] = 000000ff af034f71
	stda	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 10671065 000000c8
!	%l7 = 000000006f4fa229, immd = fffff3df, %y  = ffffff90
	udiv	%l7,-0xc21,%l2		! %l2 = 00000000ffffffff
	mov	%l0,%y			! %y = 35672e74
!	%l2 = 00000000ffffffff, Mem[0000000010141400] = ff96baa6
	stha	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = ffffbaa6
!	%l0 = c5bc733735672e74, Mem[0000000010001422] = 6e033910, %asi = 80
	stha	%l0,[%i0+0x022]%asi	! Mem[0000000010001420] = 6e032e74
!	Mem[0000000010081408] = 36b615ff, %l0 = c5bc733735672e74
	ldstuba	[%i2+%o4]0x88,%l0	! %l0 = 00000000000000ff

p0_label_54:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 58bb80a8 00000000, %l4 = 10671065, %l5 = 000000c8
	ldd	[%i1+%g0],%l4		! %l4 = 0000000058bb80a8 0000000000000000
!	Mem[0000000010041428] = 00000000 000080ff, %l0 = 000000ff, %l1 = ab38293f
	ldd	[%i1+0x028],%l0		! %l0 = 0000000000000000 00000000000080ff
!	Mem[0000000010001408] = 30a368c0 78fa77ef, %l4 = 58bb80a8, %l5 = 00000000
	ldda	[%i0+%o4]0x80,%l4	! %l4 = 0000000030a368c0 0000000078fa77ef
!	Mem[0000000030041410] = 44390058, %l4 = 0000000030a368c0
	lduwa	[%i1+%o5]0x81,%l4	! %l4 = 0000000044390058
!	Mem[0000000010181400] = 9f7422ff, %l0 = 0000000000000000
	lduwa	[%i6+%g0]0x88,%l0	! %l0 = 000000009f7422ff
!	Mem[0000000010001408] = 30a368c0, %f13 = f861ccff
	lda	[%i0+%o4]0x80,%f13	! %f13 = 30a368c0
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000010141400] = ffffbaa6 00000000 9f742269 e6cb95ff
!	Mem[0000000010141410] = 00000013 a880bb58 58bb80a8 f861ccff
!	Mem[0000000010141420] = 00000000 00000000 00000000 000080ff
!	Mem[0000000010141430] = 80bb80a8 6c667169 0e230b52 5e20db3a
	ldda	[%i5+%g0]ASI_BLK_AIUPL,%f0 	! Block Load from 0000000010141400
!	Mem[0000000010001408] = 30a368c078fa77ef, %l6 = 00000000007dec0b
	ldxa	[%i0+%o4]0x80,%l6	! %l6 = 30a368c078fa77ef
!	Mem[0000000010041410] = c5035ed0, %l1 = 00000000000080ff
	ldswa	[%i1+%o5]0x80,%l1	! %l1 = ffffffffc5035ed0
!	Mem[0000000030141408] = 6fe7ccff, %l1 = ffffffffc5035ed0
	lduha	[%i5+%o4]0x89,%l1	! %l1 = 000000000000ccff

p0_label_55:
!	Starting 10 instruction Store Burst
!	%f14 = 3adb205e 520b230e, %l5 = 0000000078fa77ef
!	Mem[0000000010001418] = 2d4196420000780c
	add	%i0,0x018,%g1
	stda	%f14,[%g1+%l5]ASI_PST16_P ! Mem[0000000010001418] = 3adb205e520b230e
!	Mem[0000000010141424] = 00000000, %l3 = 0000000000000000
	swap	[%i5+0x024],%l3		! %l3 = 0000000000000000
!	Mem[0000000030141400] = 0c788688 78d63779 ffcce76f 54094264
!	%f16 = 0c788688 78d63779 5cf95ca7 54094264
!	%f20 = ff96baa6 00000000 9f742269 e6cb95ff
!	%f24 = 18b03920 270aa0b1 741dfb5e 7661db37
!	%f28 = 2395000c 5429086d 0c788688 78d63779
	stda	%f16,[%i5+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030141400
!	%l6 = 78fa77ef, %l7 = 6f4fa229, Mem[0000000030081408] = e6cb95ff 9f742269
	stda	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 78fa77ef 6f4fa229
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010141408] = 6922749f, %l5 = 0000000078fa77ef
	ldstuba	[%i5+%o4]0x88,%l5	! %l5 = 000000000000009f
!	%f26 = 741dfb5e 7661db37, Mem[0000000010001400] = 00000000 ff420000
	stda	%f26,[%i0+%g0]0x80	! Mem[0000000010001400] = 741dfb5e 7661db37
!	%l6 = 30a368c078fa77ef, Mem[0000000010041400] = a880bb58
	stba	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = a880bbef
!	Mem[0000000021800080] = 2f061c38, %l2 = 00000000ffffffff
	ldstub	[%o3+0x080],%l2		! %l2 = 000000000000002f
!	Mem[000000001014142c] = 000080ff, %l6 = 30a368c078fa77ef
	ldsw	[%i5+0x02c],%l6		! %l6 = 00000000000080ff
!	%f20 = ff96baa6, Mem[0000000010141400] = a6baffff
	sta	%f20,[%i5+%g0]0x88	! Mem[0000000010141400] = ff96baa6

p0_label_56:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000, %l5 = 000000000000009f
	lduwa	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001400] = 000000ff, %l4 = 0000000044390058
	lduha	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = 00005677 0000003e, %l4 = 00000000, %l5 = 00000000
	ldda	[%i2+%g0]0x89,%l4	! %l4 = 000000000000003e 0000000000005677
!	Mem[000000001004142d] = 000080ff, %l6 = 00000000000080ff
	ldsb	[%i1+0x02d],%l6		! %l6 = 0000000000000000
!	Mem[0000000010001408] = 30a368c0, %l2 = 000000000000002f
	lduha	[%i0+%o4]0x80,%l2	! %l2 = 00000000000030a3
!	%f26 = 741dfb5e, %f18 = 5cf95ca7, %f28 = 2395000c
	fdivs	%f26,%f18,%f28		! %f28 = 56a22ffb
!	Mem[0000000010001410] = e55c8628 25191b85, %l2 = 000030a3, %l3 = 00000000
	ldda	[%i0+%o5]0x88,%l2	! %l2 = 0000000025191b85 00000000e55c8628
!	Mem[0000000010141408] = ff742269, %l1 = 000000000000ccff
	ldsba	[%i5+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001400] = 5efb1d74, %l2 = 0000000025191b85
	lduwa	[%i0+%g0]0x88,%l2	! %l2 = 000000005efb1d74
!	Mem[0000000010181408] = 00000069, %l5 = 0000000000005677
	ldswa	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000069

p0_label_57:
!	Starting 10 instruction Store Burst
!	%f22 = 9f742269 e6cb95ff, Mem[0000000010081410] = a880bb58 505456a5, %asi = 80
	stda	%f22,[%i2+0x010]%asi	! Mem[0000000010081410] = 9f742269 e6cb95ff
!	%l5 = 0000000000000069, Mem[000000001000143d] = 08c27083
	stb	%l5,[%i0+0x03d]		! Mem[000000001000143c] = 08697083
!	Mem[0000000010001410] = 851b1925, %l1 = 00000000ffffffff
	swapa	[%i0+%o5]0x80,%l1	! %l1 = 00000000851b1925
!	%f14 = 3adb205e 520b230e, Mem[00000000100c1400] = ffffdcf0 00000000
	stda	%f14,[%i3+%g0]0x80	! Mem[00000000100c1400] = 3adb205e 520b230e
!	Mem[0000000030101408] = 6c667169, %l0 = 000000009f7422ff
	ldstuba	[%i4+%o4]0x89,%l0	! %l0 = 0000000000000069
!	%f30 = 0c788688 78d63779, Mem[00000000100c1400] = 3adb205e 520b230e
	std	%f30,[%i3+%g0]		! Mem[00000000100c1400] = 0c788688 78d63779
!	Mem[00000000100c1408] = 10671065, %l0 = 0000000000000069
	swapa	[%i3+%o4]0x88,%l0	! %l0 = 0000000010671065
!	%f14 = 3adb205e, Mem[0000000010141408] = ff742269
	sta	%f14,[%i5+%o4]0x80	! Mem[0000000010141408] = 3adb205e
!	%l5 = 0000000000000069, Mem[0000000030081408] = ef77fa78
	stba	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = 6977fa78
!	%l6 = 00000000, %l7 = 6f4fa229, Mem[0000000010101400] = 00000000 e6cb95ff
	std	%l6,[%i4+%g0]		! Mem[0000000010101400] = 00000000 6f4fa229

p0_label_58:
!	Starting 10 instruction Load Burst
!	Code Fragment 4, seed = 690088
p0_fragment_6:
!	%l0 = 0000000010671065
	setx	0x4cab29fe5e0362e6,%g7,%l0 ! %l0 = 4cab29fe5e0362e6
!	%l1 = 00000000851b1925
	setx	0x6b89af8acc8c9b11,%g7,%l1 ! %l1 = 6b89af8acc8c9b11
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4cab29fe5e0362e6
	setx	0x9ab98af59753f74c,%g7,%l0 ! %l0 = 9ab98af59753f74c
!	%l1 = 6b89af8acc8c9b11
	setx	0x4496fa537fdd7a97,%g7,%l1 ! %l1 = 4496fa537fdd7a97
p0_fragment_6_end:
!	Mem[0000000030181400] = ff0b0000, %l6 = 0000000000000000
	lduwa	[%i6+%g0]0x81,%l6	! %l6 = 00000000ff0b0000
!	Mem[00000000300c1408] = 29a24f6f00000013, %f22 = 9f742269 e6cb95ff
	ldda	[%i3+%o4]0x81,%f22	! %f22 = 29a24f6f 00000013
!	Mem[0000000010101410] = 651067101315b636, %l5 = 0000000000000069
	ldxa	[%i4+%o5]0x88,%l5	! %l5 = 651067101315b636
!	Mem[000000001004143c] = 5e20db3a, %f27 = 7661db37
	lda	[%i1+0x03c]%asi,%f27	! %f27 = 5e20db3a
!	Mem[0000000010141400] = ff96baa6, %l6 = 00000000ff0b0000
	ldsha	[%i5+%g0]0x88,%l6	! %l6 = ffffffffffffbaa6
!	Mem[00000000211c0000] = 42ff63a8, %l5 = 651067101315b636, %asi = 80
	lduba	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000042
!	Mem[0000000030041400] = ffbb80a8ff420000, %f14 = 3adb205e 520b230e
	ldda	[%i1+%g0]0x81,%f14	! %f14 = ffbb80a8 ff420000
!	Mem[0000000010041408] = 61000000, %l1 = 4496fa537fdd7a97
	ldsba	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000218000c0] = 5677fc68, %l4 = 000000000000003e
	ldsh	[%o3+0x0c0],%l4		! %l4 = 0000000000005677

p0_label_59:
!	Starting 10 instruction Store Burst
!	%l7 = 000000006f4fa229, Mem[0000000030101410] = ff2e1ed600000000
	stxa	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000006f4fa229
!	%l1 = 0000000000000000, Mem[0000000030001400] = 0000001aff000000
	stxa	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000000000000000
!	%f8  = 00000000 00000000, %l7 = 000000006f4fa229
!	Mem[0000000010081438] = 6c5e0fda70c8a043
	add	%i2,0x038,%g1
	stda	%f8,[%g1+%l7]ASI_PST16_P ! Mem[0000000010081438] = 00000fda70c80000
!	%f15 = ff420000, Mem[0000000030181410] = 00000000
	sta	%f15,[%i6+%o5]0x89	! Mem[0000000030181410] = ff420000
!	%l3 = 00000000e55c8628, %l7 = 000000006f4fa229, %l2 = 000000005efb1d74
	addc	%l3,%l7,%l2		! %l2 = 0000000154ac2851
!	Mem[0000000010001410] = ffffffff, %l5 = 0000000000000042
	swapa	[%i0+%o5]0x80,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010141414] = a880bb58, %l6 = 00000000ffffbaa6, %asi = 80
	swapa	[%i5+0x014]%asi,%l6	! %l6 = 00000000a880bb58
!	Mem[0000000010041428] = 00000000, %l2 = 54ac2851, %l3 = e55c8628
	add	%i1,0x28,%g1
	casa	[%g1]0x80,%l2,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1409] = 69000000, %l6 = 00000000a880bb58
	ldstub	[%i3+0x009],%l6		! %l6 = 0000000000000000
!	Mem[0000000010101408] = ff0b0000, %l7 = 000000006f4fa229
	swapa	[%i4+%o4]0x80,%l7	! %l7 = 00000000ff0b0000

p0_label_60:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %f2  = ff95cbe6
	lda	[%i3+%o5]0x88,%f2 	! %f2 = 00000000
!	Mem[0000000030041410] = 58003944, %l3 = 0000000000000000
	lduwa	[%i1+%o5]0x89,%l3	! %l3 = 0000000058003944
!	%f6  = ffcc61f8, %f22 = 29a24f6f, %f22 = 29a24f6f
	fadds	%f6 ,%f22,%f22		! %f22 = ffcc61f8
!	Mem[000000001018141e] = 10671065, %l6 = 0000000000000000
	lduh	[%i6+0x01e],%l6		! %l6 = 0000000000001065
!	Mem[0000000010141400] = a6ba96ff00000000, %f24 = 18b03920 270aa0b1
	ldda	[%i5+%g0]0x80,%f24	! %f24 = a6ba96ff 00000000
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000030001400] = 00000000 00000000 58003944 f86100ff
!	Mem[0000000030001410] = 00000044 03b57b0f 190a6af2 40dbbffb
!	Mem[0000000030001420] = 61138740 5e896251 704c327e 2b1a41d7
!	Mem[0000000030001430] = 6a4b282c 6c1efc0d 1a1e1fca 5835ba73
	ldda	[%i0+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030001400
!	Mem[0000000030041400] = a880bbff, %l6 = 0000000000001065
	lduwa	[%i1+%g0]0x89,%l6	! %l6 = 00000000a880bbff
!	Mem[0000000010101408] = 6f4fa229, %l2 = 0000000154ac2851
	ldsha	[%i4+%o4]0x80,%l2	! %l2 = 0000000000006f4f
!	Mem[00000000300c1400] = 0f7bb50300000000, %f30 = 0c788688 78d63779
	ldda	[%i3+%g0]0x89,%f30	! %f30 = 0f7bb503 00000000
!	Mem[0000000010081410] = 9f742269, %l5 = 00000000ffffffff
	lduba	[%i2+%o5]0x80,%l5	! %l5 = 000000000000009f

p0_label_61:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (13)
!	%f11 = 2b1a41d7, Mem[0000000030001408] = 44390058
	sta	%f11,[%i0+%o4]0x89	! Mem[0000000030001408] = 2b1a41d7
!	%f0  = 00000000 00000000, Mem[0000000010181418] = 25191b85 10671065
	std	%f0 ,[%i6+0x018]	! Mem[0000000010181418] = 00000000 00000000
!	Mem[0000000030101400] = 330000ff, %l1 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l1	! %l1 = 0000000000000033
!	%l2 = 0000000000006f4f, Mem[0000000010101408] = 29a24f6f
	stba	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 29a24f4f
!	Mem[0000000010081400] = 58bb80a8, %l6 = 00000000a880bbff
	ldstuba	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000058
!	Mem[0000000010041400] = a880bbef, %l6 = 0000000000000058
	swapa	[%i1+%g0]0x88,%l6	! %l6 = 00000000a880bbef
!	Mem[00000000100c1400] = 0c788688 78d63779 69ff0000 c8000000
!	%f0  = 00000000 00000000 58003944 f86100ff
!	%f4  = 00000044 03b57b0f 190a6af2 40dbbffb
!	%f8  = 61138740 5e896251 704c327e 2b1a41d7
!	%f12 = 6a4b282c 6c1efc0d 1a1e1fca 5835ba73
	stda	%f0 ,[%i3+%g0]ASI_COMMIT_P	! Block Store to 00000000100c1400
!	Mem[0000000030181400] = 00000bff, %l2 = 0000000000006f4f
	swapa	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000bff
!	%l2 = 00000bff, %l3 = 58003944, Mem[0000000030041400] = ffbb80a8 ff420000
	stda	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000bff 58003944
!	%f5  = 03b57b0f, Mem[0000000030101400] = ff0000ff
	sta	%f5 ,[%i4+%g0]0x81	! Mem[0000000030101400] = 03b57b0f

p0_label_62:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000000, %f18 = 5cf95ca7
	lda	[%i5+%o5]0x89,%f18	! %f18 = 00000000
!	Mem[0000000010041410] = d05e03c5, %f28 = 56a22ffb
	lda	[%i1+%o5]0x88,%f28	! %f28 = d05e03c5
!	Mem[0000000030101408] = ff71666c, %l2 = 0000000000000bff
	ldswa	[%i4+%o4]0x81,%l2	! %l2 = ffffffffff71666c
!	Mem[0000000010101408] = 6f4fa229 29a24f4f, %l4 = 00005677, %l5 = 0000009f
	ldda	[%i4+%o4]0x88,%l4	! %l4 = 0000000029a24f4f 000000006f4fa229
!	Mem[0000000010181438] = 675aa9c6, %l4 = 0000000029a24f4f, %asi = 80
	lduha	[%i6+0x038]%asi,%l4	! %l4 = 000000000000675a
!	Mem[0000000010101408] = 6f4fa22929a24f4f, %f16 = 0c788688 78d63779
	ldda	[%i4+%o4]0x88,%f16	! %f16 = 6f4fa229 29a24f4f
	membar	#Sync			! Added by membar checker (14)
!	Mem[00000000100c1400] = 00000000, %f25 = 00000000
	ld	[%i3+%g0],%f25		! %f25 = 00000000
!	Mem[0000000010181427] = 0b879c21, %l7 = 00000000ff0b0000, %asi = 80
	ldsba	[%i6+0x027]%asi,%l7	! %l7 = 0000000000000021
!	%l5 = 000000006f4fa229, imm = fffffffffffff14a, %l0 = 9ab98af59753f74c
	add	%l5,-0xeb6,%l0		! %l0 = 000000006f4f9373
!	%f16 = 6f4fa229 29a24f4f, %l7 = 0000000000000021
!	Mem[00000000100c1400] = 0000000000000000
	stda	%f16,[%i3+%l7]ASI_PST16_P ! Mem[00000000100c1400] = 0000000000004f4f

p0_label_63:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001404] = 7661db37, %l0 = 000000006f4f9373, %asi = 80
	swapa	[%i0+0x004]%asi,%l0	! %l0 = 000000007661db37
!	%f18 = 00000000 54094264, Mem[0000000010141408] = 3adb205e e6cb95ff, %asi = 80
	stda	%f18,[%i5+0x008]%asi	! Mem[0000000010141408] = 00000000 54094264
!	%l4 = 000000000000675a, Mem[0000000010101408] = 29a24f4f
	stwa	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000675a
!	%l4 = 000000000000675a, Mem[00000000100c1400] = 00000000
	stwa	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000675a
!	%l0 = 000000007661db37, Mem[00000000100c1404] = 00004f4f
	stw	%l0,[%i3+0x004]		! Mem[00000000100c1404] = 7661db37
!	%l6 = a880bbef, %l7 = 00000021, Mem[0000000030181400] = 4f6f0000 ff2e1ed6
	stda	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = a880bbef 00000021
!	%f14 = 1a1e1fca 5835ba73, Mem[0000000010101400] = 00000000 6f4fa229
	stda	%f14,[%i4+%g0]0x80	! Mem[0000000010101400] = 1a1e1fca 5835ba73
!	Mem[00000000211c0000] = 42ff63a8, %l2 = ffffffffff71666c
	ldstuba	[%o2+0x000]%asi,%l2	! %l2 = 0000000000000042
!	%f0  = 00000000 00000000, Mem[0000000030181410] = 000042ff 5e0da695
	stda	%f0 ,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000 00000000
!	%l3 = 0000000058003944, Mem[0000000030181408] = ff95cbe6655d8c3d
	stxa	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000000058003944

p0_label_64:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 0c788688 78d63779, %l6 = a880bbef, %l7 = 00000021
	ldda	[%i5+%g0]0x89,%l6	! %l6 = 0000000078d63779 000000000c788688
!	Mem[0000000030041408] = 0000ff22, %f26 = 741dfb5e
	lda	[%i1+%o4]0x81,%f26	! %f26 = 0000ff22
!	Mem[00000000201c0000] = ffff8718, %l0 = 000000007661db37
	ldsb	[%o0+%g0],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010101410] = 1315b636, %l7 = 000000000c788688
	ldsba	[%i4+%o5]0x88,%l7	! %l7 = 0000000000000036
!	Mem[0000000010141432] = 80bb80a8, %l7 = 0000000000000036
	ldsb	[%i5+0x032],%l7		! %l7 = ffffffffffffff80
!	Mem[0000000010141400] = 00000000ff96baa6, %l4 = 000000000000675a
	ldxa	[%i5+%g0]0x88,%l4	! %l4 = 00000000ff96baa6
!	Mem[0000000030041400] = 44390058ff0b0000, %f28 = d05e03c5 5429086d
	ldda	[%i1+%g0]0x89,%f28	! %f28 = 44390058 ff0b0000
!	Mem[0000000010041408] = 61000000, %l5 = 000000006f4fa229
	lduha	[%i1+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101428] = 00000bff, %l5 = 0000000000000000
	lduw	[%i4+0x028],%l5		! %l5 = 0000000000000bff
!	Mem[00000000201c0001] = ffff8718, %l6 = 0000000078d63779, %asi = 80
	lduba	[%o0+0x001]%asi,%l6	! %l6 = 00000000000000ff

p0_label_65:
!	Starting 10 instruction Store Burst
!	%l0 = ffffffff, %l1 = 00000033, Mem[0000000010041410] = c5035ed0 00000000, %asi = 80
	stda	%l0,[%i1+0x010]%asi	! Mem[0000000010041410] = ffffffff 00000033
!	Mem[00000000211c0001] = ffff63a8, %l4 = 00000000ff96baa6
	ldstuba	[%o2+0x001]%asi,%l4	! %l4 = 00000000000000ff
!	%l0 = ffffffffffffffff, %l4 = 00000000000000ff, %l6 = 00000000000000ff
	addc	%l0,%l4,%l6		! %l6 = 00000000000000fe
!	%l5 = 0000000000000bff, Mem[0000000010001400] = 741dfb5e6f4f9373
	stx	%l5,[%i0+%g0]		! Mem[0000000010001400] = 0000000000000bff
!	%l7 = ffffffffffffff80, Mem[0000000030001400] = 00000000
	stwa	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffff80
!	%f30 = 0f7bb503, Mem[0000000010081408] = 36b615ff
	sta	%f30,[%i2+%o4]0x88	! Mem[0000000010081408] = 0f7bb503
!	Mem[0000000010081400] = a880bbff, %l6 = 00000000000000fe
	swapa	[%i2+%g0]0x88,%l6	! %l6 = 00000000a880bbff
!	%f7  = 40dbbffb, Mem[0000000030101410] = 00000000
	sta	%f7 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 40dbbffb
!	%f27 = 5e20db3a, Mem[0000000010041410] = ffffffff
	sta	%f27,[%i1+%o5]0x88	! Mem[0000000010041410] = 5e20db3a
!	%l4 = 00000000000000ff, Mem[0000000010181410] = ff1e2effff2e1ed6
	stxa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000000000ff

p0_label_66:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c143b] = 1a1e1fca, %l1 = 0000000000000033
	ldsb	[%i3+0x03b],%l1		! %l1 = ffffffffffffffca
!	Mem[0000000010141408] = 00000000, %l1 = ffffffffffffffca
	lduwa	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l5 = 0000000000000bff
	lduwa	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1410] = 000078ff, %l0 = ffffffffffffffff
	lduba	[%i3+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030041400] = ff0b0000, %l7 = ffffffffffffff80
	ldswa	[%i1+%g0]0x89,%l7	! %l7 = ffffffffff0b0000
!	Mem[0000000010041410] = 330000005e20db3a, %f2  = 58003944 f86100ff
	ldda	[%i1+%o5]0x88,%f2 	! %f2  = 33000000 5e20db3a
!	Mem[0000000010081418] = 7f1a1501, %l7 = ffffffffff0b0000, %asi = 80
	ldsha	[%i2+0x018]%asi,%l7	! %l7 = 0000000000007f1a
!	Mem[000000001008142a] = 4100f58e, %l3 = 0000000058003944, %asi = 80
	ldsba	[%i2+0x02a]%asi,%l3	! %l3 = fffffffffffffff5
!	Mem[0000000030081400] = 0000003e, %l6 = 00000000a880bbff
	ldsha	[%i2+%g0]0x89,%l6	! %l6 = 000000000000003e
!	Mem[0000000010181400] = ff22749f, %l2 = 0000000000000042
	ldsha	[%i6+%g0]0x80,%l2	! %l2 = ffffffffffffff22

p0_label_67:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = fe000000, %l2 = 00000000ffffff22
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 00000000fe000000
!	%l7 = 0000000000007f1a, Mem[0000000010141408] = 00000000
	stba	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000001a
!	%l2 = 00000000fe000000, Mem[0000000010081409] = 03b57b0f
	stb	%l2,[%i2+0x009]		! Mem[0000000010081408] = 03007b0f
!	%l7 = 0000000000007f1a, Mem[000000001018142c] = 65106710
	sth	%l7,[%i6+0x02c]		! Mem[000000001018142c] = 7f1a6710
!	%f30 = 0f7bb503 00000000, Mem[0000000010141408] = 0000001a 64420954
	stda	%f30,[%i5+%o4]0x88	! Mem[0000000010141408] = 0f7bb503 00000000
!	Mem[000000001018140c] = 6411b662, %l7 = 00007f1a, %l1 = 00000000
	add	%i6,0x0c,%g1
	casa	[%g1]0x80,%l7,%l1	! %l1 = 000000006411b662
!	Mem[0000000030001400] = 80ffffff, %l2 = 00000000fe000000
	ldstuba	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000080
!	%f11 = 2b1a41d7, Mem[0000000010041400] = 00000058
	sta	%f11,[%i1+%g0]0x88	! Mem[0000000010041400] = 2b1a41d7
!	%l3 = fffffffffffffff5, Mem[0000000021800180] = 340384f8, %asi = 80
	stba	%l3,[%o3+0x180]%asi	! Mem[0000000021800180] = f50384f8
!	Mem[0000000030101408] = ff71666c, %l3 = fffffffffffffff5
	ldstuba	[%i4+%o4]0x81,%l3	! %l3 = 00000000000000ff

p0_label_68:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = d7411a2b, %l1 = 000000006411b662
	ldswa	[%i0+%o4]0x81,%l1	! %l1 = ffffffffd7411a2b
!	Mem[0000000030141400] = 7937d678 8886780c, %l6 = 0000003e, %l7 = 00007f1a
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 000000007937d678 000000008886780c
!	Mem[0000000010101410] = 1315b636, %l4 = 00000000000000ff
	ldsba	[%i4+%o5]0x88,%l4	! %l4 = 0000000000000036
!	Mem[0000000010101400] = 1a1e1fca 5835ba73, %l4 = 00000036, %l5 = 00000000
	ldd	[%i4+%g0],%l4		! %l4 = 000000001a1e1fca 000000005835ba73
!	Code Fragment 4, seed = 996636
p0_fragment_7:
!	%l0 = 00000000000000ff
	setx	0xadf0469daec9ab46,%g7,%l0 ! %l0 = adf0469daec9ab46
!	%l1 = ffffffffd7411a2b
	setx	0x457818ed766ff571,%g7,%l1 ! %l1 = 457818ed766ff571
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = adf0469daec9ab46
	setx	0xc0a16b8862afc3ac,%g7,%l0 ! %l0 = c0a16b8862afc3ac
!	%l1 = 457818ed766ff571
	setx	0x8bf286d471af18f7,%g7,%l1 ! %l1 = 8bf286d471af18f7
p0_fragment_7_end:
!	Mem[0000000030181400] = efbb80a8, %l6 = 000000007937d678
	ldswa	[%i6+%g0]0x89,%l6	! %l6 = ffffffffefbb80a8
!	Mem[00000000300c1400] = 0000000003b57b0f, %f12 = 6a4b282c 6c1efc0d
	ldda	[%i3+%g0]0x81,%f12	! %f12 = 00000000 03b57b0f
!	Mem[0000000030081400] = 3e000000 77560000 6977fa78 29a24f6f
!	Mem[0000000030081410] = 0c780000 29a24f6f 6ed5d5b2 5eb7c7bb
!	Mem[0000000030081420] = 32379800 6dbbb811 4a24993e 4e81d597
!	Mem[0000000030081430] = 042514ec 23d63dcd 5864428a 0c8e9a33
	ldda	[%i2+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030081400
!	Mem[0000000010001410] = 00000042, %l1 = 8bf286d471af18f7
	ldsba	[%i0+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141418] = 58bb80a8 f861ccff, %l2 = 00000080, %l3 = 000000ff
	ldd	[%i5+0x018],%l2		! %l2 = 0000000058bb80a8 00000000f861ccff

p0_label_69:
!	Starting 10 instruction Store Burst
!	%f3  = 29a24f6f, %f25 = 00000000
	fsqrts	%f3 ,%f25		! %f25 = 34902349
!	%l6 = ffffffffefbb80a8, Mem[0000000010081438] = 00000fda70c80000, %asi = 80
	stxa	%l6,[%i2+0x038]%asi	! Mem[0000000010081438] = ffffffffefbb80a8
!	Mem[00000000100c142e] = 2b1a41d7, %l4 = 000000001a1e1fca
	ldstub	[%i3+0x02e],%l4		! %l4 = 0000000000000041
	membar	#Sync			! Added by membar checker (15)
!	%l5 = 000000005835ba73, Mem[0000000030081400] = 0000003e
	stha	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000ba73
!	%l7 = 000000008886780c, Mem[0000000010101404] = 5835ba73
	stw	%l7,[%i4+0x004]		! Mem[0000000010101404] = 8886780c
!	%l5 = 000000005835ba73, Mem[000000001010142c] = 1b447267, %asi = 80
	stwa	%l5,[%i4+0x02c]%asi	! Mem[000000001010142c] = 5835ba73
!	Mem[0000000010101410] = 1315b636, %l0 = 0000000062afc3ac
	swapa	[%i4+%o5]0x88,%l0	! %l0 = 000000001315b636
!	%l6 = ffffffffefbb80a8, Mem[0000000030001410] = 00000044
	stwa	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = efbb80a8
!	%f30 = 0f7bb503 00000000, %l3 = 00000000f861ccff
!	Mem[0000000030141428] = 37db61765efb1d74
	add	%i5,0x028,%g1
	stda	%f30,[%g1+%l3]ASI_PST32_S ! Mem[0000000030141428] = 0f7bb50300000000
!	Mem[0000000030181400] = a880bbef, %l4 = 0000000000000041
	ldstuba	[%i6+%g0]0x81,%l4	! %l4 = 00000000000000a8

p0_label_70:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 69000000, %l0 = 000000001315b636
	ldswa	[%i6+%o4]0x88,%l0	! %l0 = 0000000069000000
!	Mem[0000000010141400] = 00000000ff96baa6, %l3 = 00000000f861ccff
	ldxa	[%i5+%g0]0x88,%l3	! %l3 = 00000000ff96baa6
!	Mem[0000000010041408] = 61000000, %l3 = 00000000ff96baa6
	ldsha	[%i1+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800000] = ffff7f48, %l7 = 000000008886780c, %asi = 80
	ldsha	[%o1+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030041408] = 0000ff22, %l1 = 0000000000000000
	lduwa	[%i1+%o4]0x81,%l1	! %l1 = 000000000000ff22
!	%l2 = 0000000058bb80a8, imm = 0000000000000641, %l3 = 0000000000000000
	xor	%l2,0x641,%l3		! %l3 = 0000000058bb86e9
!	Mem[0000000030081410] = 0c78000029a24f6f, %f2  = 6977fa78 29a24f6f
	ldda	[%i2+%o5]0x81,%f2 	! %f2  = 0c780000 29a24f6f
!	Mem[0000000030081400] = 73ba000077560000, %f12 = 042514ec 23d63dcd
	ldda	[%i2+%g0]0x81,%f12	! %f12 = 73ba0000 77560000
!	Mem[00000000218001c0] = 45535528, %l1 = 000000000000ff22
	ldsh	[%o3+0x1c0],%l1		! %l1 = 0000000000004553
!	%l0 = 0000000069000000, %l7 = ffffffffffffffff, %l2 = 0000000058bb80a8
	sub	%l0,%l7,%l2		! %l2 = 0000000069000001

p0_label_71:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000a8, Mem[0000000030081400] = 0000ba73
	stwa	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000a8
!	Mem[0000000030081410] = 0000780c, %l1 = 0000000000004553
	ldstuba	[%i2+%o5]0x89,%l1	! %l1 = 000000000000000c
!	%l2 = 69000001, %l3 = 58bb86e9, Mem[0000000010001410] = 42000000 e55c8628
	stda	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 69000001 58bb86e9
!	%l4 = 00000000000000a8, Mem[0000000030041410] = 82c6fb0658003944
	stxa	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000000000a8
!	%f29 = ff0b0000, Mem[00000000100c1408] = 58003944
	sta	%f29,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff0b0000
!	Mem[0000000010041438] = 7b330b525e20db3a, %l6 = ffffffffefbb80a8, %l3 = 0000000058bb86e9
	add	%i1,0x38,%g1
	casxa	[%g1]0x80,%l6,%l3	! %l3 = 7b330b525e20db3a
!	Mem[0000000030001410] = efbb80a8, %l4 = 00000000000000a8
	lduba	[%i0+%o5]0x81,%l4	! %l4 = 00000000000000ef
!	%f20 = ff96baa6, Mem[0000000010141408] = 00000000
	sta	%f20,[%i5+%o4]0x88	! Mem[0000000010141408] = ff96baa6
!	Mem[00000000100c1410] = 00000044, %l0 = 0000000069000000
	ldstuba	[%i3+%o5]0x80,%l0	! %l0 = 0000000000000000
!	%l1 = 000000000000000c, Mem[0000000010041410] = 3adb205e
	stwa	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000c

p0_label_72:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000bff58003944, %f30 = 0f7bb503 00000000
	ldda	[%i1+%g0]0x81,%f30	! %f30 = 00000bff 58003944
!	Mem[0000000010101408] = 6f4fa229 0000675a, %l6 = efbb80a8, %l7 = ffffffff
	ldda	[%i4+%o4]0x88,%l6	! %l6 = 000000000000675a 000000006f4fa229
!	Mem[0000000030041400] = 44390058 ff0b0000, %l6 = 0000675a, %l7 = 6f4fa229
	ldda	[%i1+%g0]0x89,%l6	! %l6 = 00000000ff0b0000 0000000044390058
!	Mem[00000000300c1410] = ff780000, %l1 = 000000000000000c
	ldswa	[%i3+%o5]0x81,%l1	! %l1 = ffffffffff780000
!	Mem[0000000010181408] = 00000069, %l5 = 000000005835ba73
	ldsha	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101408] = 5a67000029a24f6f, %l5 = 0000000000000000
	ldxa	[%i4+%o4]0x80,%l5	! %l5 = 5a67000029a24f6f
!	Mem[0000000030041408] = 22ff0000, %l3 = 7b330b525e20db3a
	ldswa	[%i1+%o4]0x89,%l3	! %l3 = 0000000022ff0000
!	Mem[0000000030141410] = ff96baa600000000, %l2 = 0000000069000001
	ldxa	[%i5+%o5]0x89,%l2	! %l2 = ff96baa600000000
!	Mem[0000000030081408] = 6f4fa22978fa7769, %f0  = 3e000000 77560000
	ldda	[%i2+%o4]0x89,%f0 	! %f0  = 6f4fa229 78fa7769
!	Mem[0000000030101400] = 0f7bb503, %l0 = 0000000000000000
	ldsba	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000003

p0_label_73:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 6f4fa229, %l0 = 0000000000000003
	swapa	[%i3+%o4]0x89,%l0	! %l0 = 000000006f4fa229
!	%l6 = 00000000ff0b0000, Mem[00000000100c1410] = ff00004403b57b0f
	stx	%l6,[%i3+%o5]		! Mem[00000000100c1410] = 00000000ff0b0000
!	Mem[0000000010181400] = 9f7422ff, %l2 = ff96baa600000000
	ldstuba	[%i6+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%l5 = 5a67000029a24f6f, Mem[0000000010041410] = 0c000000
	stwa	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = 29a24f6f
!	%f2  = 0c780000 29a24f6f, Mem[0000000010081420] = 0000ffff 16fd10a1, %asi = 80
	stda	%f2 ,[%i2+0x020]%asi	! Mem[0000000010081420] = 0c780000 29a24f6f
!	Mem[0000000010141400] = ff96baa6, %l6 = 00000000ff0b0000
	swapa	[%i5+%g0]0x88,%l6	! %l6 = 00000000ff96baa6
!	%l5 = 5a67000029a24f6f, Mem[0000000010181408] = 69000000
	stha	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = 69004f6f
!	%f14 = 5864428a 0c8e9a33, %l2 = 00000000000000ff
!	Mem[0000000030041408] = 0000ff224a8b7ebf
	add	%i1,0x008,%g1
	stda	%f14,[%g1+%l2]ASI_PST32_SL ! Mem[0000000030041408] = 339a8e0c8a426458
!	%f7  = 5eb7c7bb, %f25 = 34902349, %f26 = 0000ff22
	fsubs	%f7 ,%f25,%f26		! %f26 = 5eb7c7bb
!	%l0 = 6f4fa229, %l1 = ff780000, Mem[0000000010001408] = 30a368c0 78fa77ef
	stda	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 6f4fa229 ff780000

p0_label_74:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 03007b0f 714f03af, %l2 = 000000ff, %l3 = 22ff0000
	ldda	[%i2+%o4]0x80,%l2	! %l2 = 0000000003007b0f 00000000714f03af
!	Mem[0000000030041408] = 0c8e9a33, %l7 = 0000000044390058
	lduha	[%i1+%o4]0x89,%l7	! %l7 = 0000000000009a33
!	Mem[0000000030041400] = ff0b0000, %l6 = 00000000ff96baa6
	ldsba	[%i1+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101410] = fbbfdb40, %l5 = 5a67000029a24f6f
	lduba	[%i4+%o5]0x81,%l5	! %l5 = 00000000000000fb
!	Mem[0000000030041408] = 5864428a 0c8e9a33, %l6 = 00000000, %l7 = 00009a33
	ldda	[%i1+%o4]0x89,%l6	! %l6 = 000000000c8e9a33 000000005864428a
!	Mem[0000000010141400] = 00000bff, %l4 = 00000000000000ef
	ldsha	[%i5+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l1 = ffffffffff780000
	ldswa	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000000
!	%l7 = 000000005864428a, %l6 = 000000000c8e9a33, %l4 = 0000000000000000
	subc	%l7,%l6,%l4		! %l4 = 000000004bd5a857
!	Mem[00000000300c1410] = 000078ff, %l5 = 00000000000000fb
	ldsha	[%i3+%o5]0x89,%l5	! %l5 = 00000000000078ff
!	Mem[0000000010041428] = 00000000000080ff, %f8  = 32379800 6dbbb811, %asi = 80
	ldda	[%i1+0x028]%asi,%f8 	! %f8  = 00000000 000080ff

p0_label_75:
!	Starting 10 instruction Store Burst
!	%l2 = 03007b0f, %l3 = 714f03af, Mem[0000000010181410] = 00000000 000000ff, %asi = 80
	stda	%l2,[%i6+0x010]%asi	! Mem[0000000010181410] = 03007b0f 714f03af
!	Mem[000000001004140c] = 00000000, %l3 = 714f03af, %l3 = 714f03af
	add	%i1,0x0c,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000030101408] = 6c6671ff
	stwa	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	%f28 = 44390058 ff0b0000, Mem[00000000100c1410] = 00000000 ff0b0000
	stda	%f28,[%i3+%o5]0x80	! Mem[00000000100c1410] = 44390058 ff0b0000
!	%l1 = 0000000000000000, Mem[00000000100c1430] = 6a4b282c6c1efc0d
	stx	%l1,[%i3+0x030]		! Mem[00000000100c1430] = 0000000000000000
!	%f22 = ffcc61f8 00000013, Mem[00000000100c1438] = 1a1e1fca 5835ba73, %asi = 80
	stda	%f22,[%i3+0x038]%asi	! Mem[00000000100c1438] = ffcc61f8 00000013
!	%l5 = 00000000000078ff, Mem[0000000010181400] = ff22749f
	stba	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = ff22749f
!	Mem[0000000030081408] = 78fa7769, %l7 = 000000005864428a
	ldstuba	[%i2+%o4]0x89,%l7	! %l7 = 0000000000000069
!	%f10 = 4a24993e, Mem[0000000010101430] = 11fcfc7c
	sta	%f10,[%i4+0x030]%asi	! Mem[0000000010101430] = 4a24993e
!	%f16 = 6f4fa229 29a24f4f, Mem[0000000010081428] = 4100f58e 1969cea7
	std	%f16,[%i2+0x028]	! Mem[0000000010081428] = 6f4fa229 29a24f4f

p0_label_76:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = acc3af62, %f6  = 6ed5d5b2
	lda	[%i4+0x010]%asi,%f6 	! %f6 = acc3af62
!	Mem[0000000030001400] = ffffffff, %l5 = 00000000000078ff
	lduba	[%i0+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101410] = fbbfdb40, %l3 = 0000000000000000
	ldsba	[%i4+%o5]0x81,%l3	! %l3 = fffffffffffffffb
!	%l2 = 0000000003007b0f, %l5 = 00000000000000ff, %l2 = 0000000003007b0f
	and	%l2,%l5,%l2		! %l2 = 000000000000000f
!	Mem[0000000030181408] = 00000000, %l4 = 000000004bd5a857
	lduwa	[%i6+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081408] = 03007b0f, %f22 = ffcc61f8
	lda	[%i2+%o4]0x80,%f22	! %f22 = 03007b0f
!	%l4 = 0000000000000000, imm = 0000000000000260, %l6 = 000000000c8e9a33
	xor	%l4,0x260,%l6		! %l6 = 0000000000000260
!	%f15 = 0c8e9a33, %f20 = ff96baa6, %f28 = 44390058 ff0b0000
	fsmuld	%f15,%f20,%f28		! %f28 = fffad754 c0000000
!	Mem[0000000030181400] = efbb80ff, %l3 = fffffffffffffffb
	ldsha	[%i6+%g0]0x89,%l3	! %l3 = ffffffffffff80ff
!	Mem[0000000030141410] = 00000000a6ba96ff, %f8  = 00000000 000080ff
	ldda	[%i5+%o5]0x81,%f8 	! %f8  = 00000000 a6ba96ff

p0_label_77:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = ff80bbef 00000021 00000000 58003944
!	%f16 = 6f4fa229 29a24f4f 00000000 54094264
!	%f20 = ff96baa6 00000000 03007b0f 00000013
!	%f24 = a6ba96ff 34902349 5eb7c7bb 5e20db3a
!	%f28 = fffad754 c0000000 00000bff 58003944
	stda	%f16,[%i6+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030181400
!	Mem[0000000010101410] = 62afc3ac, %l1 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l1	! %l1 = 00000000000000ac
!	Mem[0000000010041410] = 29a24f6f, %l2 = 000000000000000f
	ldstuba	[%i1+%o5]0x88,%l2	! %l2 = 000000000000006f
!	%l0 = 000000006f4fa229, Mem[00000000100c1400] = 0000675a7661db37
	stx	%l0,[%i3+%g0]		! Mem[00000000100c1400] = 000000006f4fa229
!	%f9  = a6ba96ff, Mem[0000000010081408] = 03007b0f
	sta	%f9 ,[%i2+%o4]0x80	! Mem[0000000010081408] = a6ba96ff
!	%l4 = 0000000000000000, Mem[00000000211c0000] = ffff63a8
	sth	%l4,[%o2+%g0]		! Mem[00000000211c0000] = 000063a8
!	Mem[0000000021800041] = 52a03808, %l4 = 0000000000000000
	ldstub	[%o3+0x041],%l4		! %l4 = 00000000000000a0
!	Mem[00000000300c1410] = ff780000, %l5 = 00000000000000ff
	swapa	[%i3+%o5]0x81,%l5	! %l5 = 00000000ff780000
!	%l0 = 000000006f4fa229, Mem[0000000010181430] = 1537793c, %asi = 80
	stwa	%l0,[%i6+0x030]%asi	! Mem[0000000010181430] = 6f4fa229
!	%l6 = 0000000000000260, Mem[0000000030181408] = 54094264
	stha	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 54090260

p0_label_78:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000030041400] = 00000bff 58003944 339a8e0c 8a426458
!	Mem[0000000030041410] = a8000000 00000000 002ee852 09306bdb
!	Mem[0000000030041420] = 212897a0 16147531 211161f8 1cd5bb58
!	Mem[0000000030041430] = 3c89a68c 3b7104ed 75bcf92a 60f1d253
	ldda	[%i1+%g0]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030041400
!	Mem[0000000010101408] = 6f4fa229 0000675a, %l4 = 000000a0, %l5 = ff780000
	ldda	[%i4+%o4]0x88,%l4	! %l4 = 000000000000675a 000000006f4fa229
!	Mem[0000000030041410] = 000000a8, %f1  = 78fa7769
	lda	[%i1+%o5]0x89,%f1 	! %f1 = 000000a8
!	Mem[00000000300c1400] = 00000000, %l0 = 000000006f4fa229
	lduha	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001400] = 00000000ffffffff, %l0 = 0000000000000000
	ldxa	[%i0+%g0]0x89,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000010141434] = 6c667169, %l2 = 000000000000006f, %asi = 80
	ldswa	[%i5+0x034]%asi,%l2	! %l2 = 000000006c667169
!	Mem[0000000030141408] = 54094264, %l6 = 0000000000000260
	ldswa	[%i5+%o4]0x89,%l6	! %l6 = 0000000054094264
!	Mem[00000000100c1404] = 6f4fa229, %l6 = 0000000054094264
	lduw	[%i3+0x004],%l6		! %l6 = 000000006f4fa229
!	Mem[0000000010101410] = ffc3af62, %l2 = 000000006c667169
	ldswa	[%i4+%o5]0x80,%l2	! %l2 = ffffffffffc3af62
!	Mem[0000000030101400] = 0f7bb503, %l6 = 000000006f4fa229
	lduba	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000003

p0_label_79:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = ff0b0000, %l5 = 000000006f4fa229
	swapa	[%i5+%g0]0x88,%l5	! %l5 = 00000000ff0b0000
!	Mem[00000000100c1400] = 00000000, %l1 = 00000000000000ac
	ldstuba	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081410] = 6922749f, %l7 = 0000000000000069
	swapa	[%i2+%o5]0x88,%l7	! %l7 = 000000006922749f
!	%f12 = 73ba0000 77560000, Mem[0000000030181408] = 54090260 00000000
	stda	%f12,[%i6+%o4]0x89	! Mem[0000000030181408] = 73ba0000 77560000
!	%f12 = 73ba0000 77560000, %l2 = ffffffffffc3af62
!	Mem[0000000010181410] = 03007b0f714f03af
	add	%i6,0x010,%g1
	stda	%f12,[%g1+%l2]ASI_PST16_PL ! Mem[0000000010181410] = 03005677714f03af
!	Mem[0000000021800081] = ff061c38, %l4 = 000000000000675a
	ldstuba	[%o3+0x081]%asi,%l4	! %l4 = 0000000000000006
!	%l1 = 0000000000000000, Mem[00000000300c1410] = ff000000
	stwa	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	%f26 = 58bbd51c, Mem[0000000010001400] = 00000000
	sta	%f26,[%i0+%g0]0x80	! Mem[0000000010001400] = 58bbd51c
!	%l5 = 00000000ff0b0000, Mem[0000000030101408] = 00000000
	stwa	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = ff0b0000
!	Mem[0000000010101410] = ffc3af62, %l1 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l1	! %l1 = 00000000000000ff

p0_label_80:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = fbbfdb40, %l1 = 00000000000000ff
	lduwa	[%i4+%o5]0x81,%l1	! %l1 = 00000000fbbfdb40
!	Mem[0000000010081410] = 69000000, %l7 = 000000006922749f
	lduba	[%i2+%o5]0x80,%l7	! %l7 = 0000000000000069
!	Mem[0000000010081410] = 69000000, %f1  = 000000a8
	lda	[%i2+%o5]0x80,%f1 	! %f1 = 69000000
!	Mem[0000000010101408] = 0000675a, %f14 = 5864428a
	lda	[%i4+%o4]0x88,%f14	! %f14 = 0000675a
!	Mem[0000000010001410] = 01000069, %l2 = ffffffffffc3af62
	lduwa	[%i0+%o5]0x80,%l2	! %l2 = 0000000001000069
!	Mem[0000000010001400] = 1cd5bb58, %f14 = 0000675a
	lda	[%i0+%g0]0x88,%f14	! %f14 = 1cd5bb58
!	Mem[00000000211c0000] = 000063a8, %l6 = 0000000000000003
	ldub	[%o2+%g0],%l6		! %l6 = 0000000000000000
!	Mem[0000000010081410] = 00000069, %l6 = 0000000000000000
	lduba	[%i2+%o5]0x88,%l6	! %l6 = 0000000000000069
!	Mem[0000000030181408] = 77560000, %l4 = 0000000000000006
	lduwa	[%i6+%o4]0x89,%l4	! %l4 = 0000000077560000
!	Mem[0000000030181408] = 000056770000ba73, %f14 = 1cd5bb58 0c8e9a33
	ldda	[%i6+%o4]0x81,%f14	! %f14 = 00005677 0000ba73

p0_label_81:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 29a24fff, %l5 = 00000000ff0b0000
	swapa	[%i1+%o5]0x88,%l5	! %l5 = 0000000029a24fff
!	Mem[0000000030101400] = 03b57b0f 231ab099 00000bff a880bb80
!	%f0  = 6f4fa229 69000000 0c780000 29a24f6f
!	%f4  = 0c780000 29a24f6f acc3af62 5eb7c7bb
!	%f8  = 00000000 a6ba96ff 4a24993e 4e81d597
!	%f12 = 73ba0000 77560000 00005677 0000ba73
	stda	%f0 ,[%i4+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030101400
!	%l7 = 0000000000000069, Mem[0000000010001410] = 01000069, %asi = 80
	stwa	%l7,[%i0+0x010]%asi	! Mem[0000000010001410] = 00000069
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000010101410] = ffc3af62, %l6 = 0000000000000069
	swapa	[%i4+%o5]0x80,%l6	! %l6 = 00000000ffc3af62
!	%l0 = 00000000ffffffff, imm = fffffffffffff109, %l0 = 00000000ffffffff
	add	%l0,-0xef7,%l0		! %l0 = 00000000fffff108
!	Mem[00000000201c0001] = ffff8718, %l5 = 0000000029a24fff
	ldstub	[%o0+0x001],%l5		! %l5 = 00000000000000ff
!	%l6 = 00000000ffc3af62, Mem[0000000010101408] = 0000675a
	stha	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000af62
!	%f8  = 00000000, Mem[0000000030181408] = 00005677
	sta	%f8 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	Mem[00000000100c1410] = 58003944, %l0 = 00000000fffff108
	swapa	[%i3+%o5]0x88,%l0	! %l0 = 0000000058003944
!	%l4 = 0000000077560000, Mem[000000001008143f] = efbb80a8
	stb	%l4,[%i2+0x03f]		! Mem[000000001008143c] = efbb8000

p0_label_82:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00005677 000000a8, %l4 = 77560000, %l5 = 000000ff
	ldda	[%i2+%g0]0x89,%l4	! %l4 = 00000000000000a8 0000000000005677
!	Mem[0000000010181410] = af034f7177560003, %f6  = acc3af62 5eb7c7bb
	ldda	[%i6+%o5]0x88,%f6 	! %f6  = af034f71 77560003
!	Code Fragment 4, seed = 776236
p0_fragment_8:
!	%l0 = 0000000058003944
	setx	0x41c514de7a44a2c6,%g7,%l0 ! %l0 = 41c514de7a44a2c6
!	%l1 = 00000000fbbfdb40
	setx	0xcc013bd63def54f1,%g7,%l1 ! %l1 = cc013bd63def54f1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 41c514de7a44a2c6
	setx	0x11c9df4c0d270b2c,%g7,%l0 ! %l0 = 11c9df4c0d270b2c
!	%l1 = cc013bd63def54f1
	setx	0x948eb872d9b9c877,%g7,%l1 ! %l1 = 948eb872d9b9c877
p0_fragment_8_end:
!	Mem[0000000010141400] = 000000006f4fa229, %f14 = 00005677 0000ba73
	ldda	[%i5+%g0]0x88,%f14	! %f14 = 00000000 6f4fa229
!	Mem[00000000300c1400] = 00000000, %f19 = 0c8e9a33
	lda	[%i3+%g0]0x81,%f19	! %f19 = 00000000
!	Mem[0000000010101438] = 5ad3829a, %l6 = 00000000ffc3af62
	lduh	[%i4+0x038],%l6		! %l6 = 0000000000005ad3
!	Mem[00000000100c1408] = 00000bff, %l0 = 11c9df4c0d270b2c
	lduha	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000bff
!	%f6  = af034f71, %f13 = 77560000, %f7  = 77560003
	fdivs	%f6 ,%f13,%f7 		! tt=0x22, %l0 = 0000000000000c21
	membar	#Sync			! Added by membar checker (18)
!	Mem[00000000100c1400] = ff000000 6f4fa229 ff0b0000 f86100ff
!	Mem[00000000100c1410] = 08f1ffff ff0b0000 190a6af2 40dbbffb
!	Mem[00000000100c1420] = 61138740 5e896251 704c327e 2b1affd7
!	Mem[00000000100c1430] = 00000000 00000000 ffcc61f8 00000013
	ldda	[%i3+%g0]ASI_BLK_P,%f16	! Block Load from 00000000100c1400
!	Mem[0000000010101434] = 66008d1d, %f15 = 6f4fa229
	lda	[%i4+0x034]%asi,%f15	! %f15 = 66008d1d

p0_label_83:
!	Starting 10 instruction Store Burst
!	%f4  = 0c780000 29a24f6f, %l6 = 0000000000005ad3
!	Mem[0000000030101438] = 73ba000077560000
	add	%i4,0x038,%g1
	stda	%f4,[%g1+%l6]ASI_PST32_S ! Mem[0000000030101438] = 0c78000029a24f6f
!	%f5  = 29a24f6f, Mem[0000000010041408] = 61000000
	sta	%f5 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 29a24f6f
!	Mem[0000000010081400] = 22ffffff, %l1 = 948eb872d9b9c877
	ldstuba	[%i2+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181410] = 00000000, %l2 = 0000000001000069
	swapa	[%i6+%o5]0x89,%l2	! %l2 = 0000000000000000
!	%f6  = af034f71, %f3  = 29a24f6f
	fstoi	%f6 ,%f3 		! %f3  = 00000000
!	%l2 = 00000000, %l3 = ffff80ff, Mem[0000000010041408] = 6f4fa229 00000000
	stda	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000 ffff80ff
!	Mem[0000000030181408] = 00000000, %l7 = 0000000000000069
	swapa	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000000
!	%l6 = 00005ad3, %l7 = 00000000, Mem[0000000030101400] = 69000000 6f4fa229
	stda	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = 00005ad3 00000000
!	%l1 = 00000000000000ff, Mem[0000000010041408] = 00000000
	stha	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = 00ff0000
!	%l7 = 0000000000000000, Mem[0000000010041410] = 00000bff
	stwa	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000

p0_label_84:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = a8000000 77560000 ff77fa78 29a24f6f
!	Mem[0000000030081410] = ff780000 29a24f6f 6ed5d5b2 5eb7c7bb
!	Mem[0000000030081420] = 32379800 6dbbb811 4a24993e 4e81d597
!	Mem[0000000030081430] = 042514ec 23d63dcd 5864428a 0c8e9a33
	ldda	[%i2+%g0]ASI_BLK_SL,%f0 	! Block Load from 0000000030081400
!	Mem[0000000030101408] = 29a24f6f, %f23 = 40dbbffb
	lda	[%i4+%o4]0x89,%f23	! %f23 = 29a24f6f
!	Mem[0000000010141408] = a6ba96ff, %l5 = 0000000000005677
	lduh	[%i5+%o4],%l5		! %l5 = 000000000000a6ba
!	Mem[0000000030081408] = 6f4fa229 78fa77ff, %l2 = 00000000, %l3 = ffff80ff
	ldda	[%i2+%o4]0x89,%l2	! %l2 = 0000000078fa77ff 000000006f4fa229
!	Mem[0000000030101408] = 6f4fa229, %l7 = 0000000000000000
	lduha	[%i4+%o4]0x81,%l7	! %l7 = 0000000000006f4f
!	%l7 = 0000000000006f4f, imm = fffffffffffff6d3, %l6 = 0000000000005ad3
	sub	%l7,-0x92d,%l6		! %l6 = 000000000000787c
!	%f2  = 6f4fa229, %f8  = 11b8bb6d
	fcmpes	%fcc2,%f2 ,%f8 		! %fcc2 = 2
!	Mem[0000000010081410] = 69000000, %f23 = 29a24f6f
	lda	[%i2+%o5]0x80,%f23	! %f23 = 69000000
!	Mem[0000000030001408] = d7411a2b, %l5 = 000000000000a6ba
	ldsba	[%i0+%o4]0x81,%l5	! %l5 = ffffffffffffffd7
!	Mem[0000000010081410] = 00000069, %l3 = 000000006f4fa229
	ldsha	[%i2+%o5]0x88,%l3	! %l3 = 0000000000000069

p0_label_85:
!	Starting 10 instruction Store Burst
!	%f12 = cd3dd623 ec142504, Mem[0000000030001410] = a880bbef 0f7bb503
	stda	%f12,[%i0+%o5]0x89	! Mem[0000000030001410] = cd3dd623 ec142504
!	%l0 = 0000000000000c21, Mem[0000000010101408] = 0000af62
	stwa	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000c21
!	%l6 = 0000787c, %l7 = 00006f4f, Mem[0000000010081400] = ffffff22 00000000
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000787c 00006f4f
!	%l5 = ffffffffffffffd7, Mem[00000000201c0000] = ffff8718, %asi = 80
	stba	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = d7ff8718
!	%l7 = 0000000000006f4f, Mem[00000000300c1410] = 00000000
	stwa	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00006f4f
!	%l4 = 00000000000000a8, Mem[0000000010181404] = 00000000, %asi = 80
	stwa	%l4,[%i6+0x004]%asi	! Mem[0000000010181404] = 000000a8
!	%l5 = ffffffffffffffd7, Mem[0000000010081410] = 00000069
	stba	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000d7
!	%l0 = 00000c21, %l1 = 000000ff, Mem[0000000010001400] = 58bbd51c 00000bff
	stda	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000c21 000000ff
!	%l3 = 0000000000000069, Mem[0000000030001400] = ffffffff
	stba	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 69ffffff
!	Mem[0000000030081410] = 000078ff, %l4 = 00000000000000a8
	ldstuba	[%i2+%o5]0x89,%l4	! %l4 = 00000000000000ff

p0_label_86:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 29a24f4f, %l4 = 00000000000000ff
	ldswa	[%i6+%g0]0x89,%l4	! %l4 = 0000000029a24f4f
!	Mem[0000000010181410] = 77560003, %l7 = 0000000000006f4f
	ldsha	[%i6+%o5]0x88,%l7	! %l7 = 0000000000000003
!	Mem[0000000010001410] = 00000069, %l7 = 0000000000000003
	lduwa	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000069
!	Mem[0000000010181436] = 53fc1edd, %l0 = 0000000000000c21
	ldub	[%i6+0x036],%l0		! %l0 = 000000000000001e
!	Mem[00000000100c1410] = 00000bfffffff108, %l4 = 0000000029a24f4f
	ldxa	[%i3+%o5]0x88,%l4	! %l4 = 00000bfffffff108
!	Mem[0000000010141408] = 0f7bb503 ff96baa6, %l0 = 0000001e, %l1 = 000000ff
	ldda	[%i5+%o4]0x88,%l0	! %l0 = 00000000ff96baa6 000000000f7bb503
!	Mem[0000000020800000] = ffff7f48, %l1 = 000000000f7bb503, %asi = 80
	lduha	[%o1+0x000]%asi,%l1	! %l1 = 000000000000ffff
!	Mem[000000001004142c] = 000080ff, %f31 = 00000013
	ld	[%i1+0x02c],%f31	! %f31 = 000080ff
!	Mem[0000000030101408] = 6f4fa229, %l5 = ffffffffffffffd7
	lduwa	[%i4+%o4]0x81,%l5	! %l5 = 000000006f4fa229
!	Mem[0000000030141400] = 78d63779, %f20 = 08f1ffff
	lda	[%i5+%g0]0x89,%f20	! %f20 = 78d63779

p0_label_87:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 69000000, %l5 = 000000006f4fa229
	swapa	[%i4+%o5]0x88,%l5	! %l5 = 0000000069000000
!	Mem[0000000010041408] = 0000ff00, %l0 = 00000000ff96baa6
	ldstuba	[%i1+%o4]0x88,%l0	! %l0 = 0000000000000000
!	%l2 = 0000000078fa77ff, Mem[00000000300c1408] = 00000003
	stba	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff
!	%f12 = cd3dd623 ec142504, %l5 = 0000000069000000
!	Mem[0000000010141430] = 80bb80a86c667169
	add	%i5,0x030,%g1
	stda	%f12,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010141430] = 80bb80a86c667169
!	Mem[0000000010081400] = 7c780000, %l3 = 0000000000000069
	ldstuba	[%i2+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081408] = 78fa77ff, %l3 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l3	! %l3 = 00000000000000ff
	membar	#Sync			! Added by membar checker (19)
!	%f9  = 00983732, Mem[00000000100c1424] = 5e896251
	st	%f9 ,[%i3+0x024]	! Mem[00000000100c1424] = 00983732
!	Mem[0000000030041400] = ff0b0000, %l5 = 0000000069000000
	swapa	[%i1+%g0]0x89,%l5	! %l5 = 00000000ff0b0000
!	%l7 = 0000000000000069, Mem[0000000030141410] = 00000000
	stba	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000069
!	%l1 = 000000000000ffff, Mem[00000000100c1400] = 29a24f6f000000ff
	stxa	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000000000ffff

p0_label_88:
!	Starting 10 instruction Load Burst
!	%f27 = 2b1affd7, %f30 = ffcc61f8
	fstoi	%f27,%f30		! %f30 = 00000000
!	Mem[0000000030041408] = 339a8e0c, %l0 = 0000000000000000
	ldswa	[%i1+%o4]0x81,%l0	! %l0 = 00000000339a8e0c
!	Mem[0000000010081400] = ff00787c, %l5 = 00000000ff0b0000
	lduba	[%i2+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[000000001008140c] = 714f03af, %f29 = 00000000
	lda	[%i2+0x00c]%asi,%f29	! %f29 = 714f03af
!	Mem[000000001018140a] = 6f4f0069, %l4 = 00000bfffffff108, %asi = 80
	ldsha	[%i6+0x00a]%asi,%l4	! %l4 = 0000000000000069
!	Mem[0000000010101400] = ca1f1e1a, %l6 = 000000000000787c
	lduha	[%i4+%g0]0x88,%l6	! %l6 = 0000000000001e1a
!	Mem[000000001018140c] = 6411b662, %l0 = 00000000339a8e0c
	ldub	[%i6+0x00c],%l0		! %l0 = 0000000000000064
!	Mem[0000000010001408] = 29a24f6f, %l5 = 00000000000000ff
	lduwa	[%i0+%o4]0x88,%l5	! %l5 = 0000000029a24f6f
!	%l2 = 0000000078fa77ff, %l1 = 000000000000ffff, %l6 = 0000000000001e1a
	or	%l2,%l1,%l6		! %l6 = 0000000078faffff
!	Mem[0000000030041408] = 0c8e9a33, %l3 = 00000000000000ff
	lduwa	[%i1+%o4]0x89,%l3	! %l3 = 000000000c8e9a33

p0_label_89:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000069, Mem[0000000010001410] = 00000069
	stha	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 00690069
!	Mem[00000000100c1408] = 00000bff, %l5 = 0000000029a24f6f
	ldstuba	[%i3+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	%l1 = 000000000000ffff, imm = 0000000000000ea4, %l3 = 000000000c8e9a33
	sub	%l1,0xea4,%l3		! %l3 = 000000000000f15b
!	%l1 = 000000000000ffff, Mem[0000000030181408] = 00000069
	stba	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ff
!	Mem[0000000010181400] = ff22749f, %l0 = 0000000000000064
	ldstuba	[%i6+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	%l1 = 000000000000ffff, immd = fffffffffffff078, %l108 = 0000000000000000
	sdivx	%l1,-0xf88,%l0		! %l0 = fffffffffffffff0
!	Mem[00000000100c143c] = 00000013, %l0 = fffffff0, %l0 = fffffff0
	add	%i3,0x3c,%g1
	casa	[%g1]0x80,%l0,%l0	! %l0 = 0000000000000013
!	Mem[00000000100c1417] = ff0b0000, %l0 = 0000000000000013
	ldstub	[%i3+0x017],%l0		! %l0 = 0000000000000000
!	Mem[0000000020800000] = ffff7f48, %l7 = 0000000000000069
	ldstuba	[%o1+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101408] = 6f4fa229, %l3 = 000000000000f15b
	ldstuba	[%i4+%o4]0x81,%l3	! %l3 = 000000000000006f

p0_label_90:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00006f4f, %l3 = 000000000000006f
	ldsba	[%i3+%o5]0x89,%l3	! %l3 = 000000000000004f
!	Mem[0000000010181438] = 675aa9c6ff8c61f8, %f28 = 00000000 714f03af, %asi = 80
	ldda	[%i6+0x038]%asi,%f28	! %f28 = 675aa9c6 ff8c61f8
!	Mem[0000000010141414] = ffffbaa6, %f30 = 00000000
	lda	[%i5+0x014]%asi,%f30	! %f30 = ffffbaa6
!	Mem[0000000010181410] = 03005677, %l7 = 00000000000000ff
	lduha	[%i6+%o5]0x80,%l7	! %l7 = 0000000000000300
!	Mem[0000000021800181] = f50384f8, %l4 = 0000000000000069
	ldsb	[%o3+0x181],%l4		! %l4 = 0000000000000003
!	Mem[0000000010041418] = 2eff80a8 f861ccff, %l2 = 78fa77ff, %l3 = 0000004f
	ldd	[%i1+0x018],%l2		! %l2 = 000000002eff80a8 00000000f861ccff
!	Mem[0000000030181400] = 4f4fa229, %l0 = 0000000000000000
	ldsba	[%i6+%g0]0x81,%l0	! %l0 = 000000000000004f
!	Mem[0000000030001408] = 2b1a41d7, %l7 = 0000000000000300
	lduba	[%i0+%o4]0x89,%l7	! %l7 = 00000000000000d7
!	Mem[00000000100c1418] = 190a6af2, %l6 = 0000000078faffff
	ldsb	[%i3+0x018],%l6		! %l6 = 0000000000000019
!	Mem[0000000010141408] = a6ba96ff, %l3 = 00000000f861ccff
	ldsha	[%i5+%o4]0x80,%l3	! %l3 = ffffffffffffa6ba

p0_label_91:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 78d63779, %l7 = 00000000000000d7
	swapa	[%i5+%g0]0x89,%l7	! %l7 = 0000000078d63779
!	%l4 = 0000000000000003, Mem[00000000300c1408] = ff000000
	stwa	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000003
!	Mem[0000000020800040] = 7dff7378, %l2 = 000000002eff80a8
	ldstub	[%o1+0x040],%l2		! %l2 = 000000000000007d
!	%l5 = 00000000000000ff, Mem[0000000010101434] = 66008d1d
	sth	%l5,[%i4+0x034]		! Mem[0000000010101434] = 00ff8d1d
!	%l6 = 0000000000000019, Mem[0000000010141400] = 6f4fa229
	stba	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 6f4fa219
!	%l2 = 000000000000007d, Mem[00000000100c1415] = ff0b00ff, %asi = 80
	stba	%l2,[%i3+0x015]%asi	! Mem[00000000100c1414] = ff7d00ff
!	%l3 = ffffffffffffa6ba, Mem[0000000010081430] = 2ea63fbc
	sth	%l3,[%i2+0x030]		! Mem[0000000010081430] = a6ba3fbc
!	%f18 = ff0b0000, %f22 = 190a6af2
	fsqrts	%f18,%f22		! %f22 = 7fffffff
!	%f15 = 8a426458, %f14 = 339a8e0c
	fcmpes	%fcc2,%f15,%f14		! %fcc2 = 1
!	Mem[0000000010181400] = ff22749f, %l1 = 000000000000ffff
	ldswa	[%i6+%g0]0x80,%l1	! %l1 = ffffffffff22749f

p0_label_92:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = a8000000, %f31 = 000080ff
	lda	[%i1+%o5]0x81,%f31	! %f31 = a8000000
!	Mem[0000000010181408] = 62b6116469004f6f, %f26 = 704c327e 2b1affd7
	ldda	[%i6+%o4]0x88,%f26	! %f26 = 62b61164 69004f6f
!	Mem[0000000010181408] = 62b61164 69004f6f, %l4 = 00000003, %l5 = 000000ff
	ldda	[%i6+%o4]0x88,%l4	! %l4 = 0000000069004f6f 0000000062b61164
!	Mem[0000000010181410] = 03005677, %l0 = 000000000000004f
	lduw	[%i6+%o5],%l0		! %l0 = 0000000003005677
!	Code Fragment 4, seed = 37123
p0_fragment_9:
!	%l0 = 0000000003005677
	setx	0xc87f90f02802630e,%g7,%l0 ! %l0 = c87f90f02802630e
!	%l1 = ffffffffff22749f
	setx	0x04719f19a27cc2b9,%g7,%l1 ! %l1 = 04719f19a27cc2b9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c87f90f02802630e
	setx	0xf180ae776b22ae74,%g7,%l0 ! %l0 = f180ae776b22ae74
!	%l1 = 04719f19a27cc2b9
	setx	0xca1c49943a1ba93f,%g7,%l1 ! %l1 = ca1c49943a1ba93f
p0_fragment_9_end:
!	Mem[0000000010041400] = d7411a2b, %l5 = 0000000062b61164
	ldsha	[%i1+%g0]0x80,%l5	! %l5 = ffffffffffffd741
!	Mem[0000000010101400] = ca1f1e1a, %f6  = bbc7b75e
	lda	[%i4+%g0]0x88,%f6 	! %f6 = ca1f1e1a
!	Mem[0000000030041400] = 00000069, %l5 = ffffffffffffd741
	ldswa	[%i1+%g0]0x81,%l5	! %l5 = 0000000000000069
!	Mem[0000000010141410] = 13000000, %l6 = 0000000000000019
	lduwa	[%i5+%o5]0x88,%l6	! %l6 = 0000000013000000
!	%l3 = ffffffffffffa6ba, immd = 00000ed3, %y  = 35672e74
	smul	%l3,0xed3,%l1		! %l1 = fffffffffad4974e, %y = ffffffff

p0_label_93:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 00690069, %l1 = 00000000fad4974e
	swapa	[%i0+%o5]0x80,%l1	! %l1 = 0000000000690069
!	%l6 = 0000000013000000, Mem[0000000010101408] = 00000c21
	stba	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000c00
!	%f16 = ff000000 6f4fa229, %l3 = ffffffffffffa6ba
!	Mem[00000000100c1418] = 190a6af240dbbffb
	add	%i3,0x018,%g1
	stda	%f16,[%g1+%l3]ASI_PST16_PL ! Mem[00000000100c1418] = 190a4f6f40db00ff
!	Mem[0000000030141408] = 54094264, %l4 = 0000000069004f6f
	swapa	[%i5+%o4]0x89,%l4	! %l4 = 0000000054094264
!	Mem[0000000030041410] = 000000a8, %l2 = 000000000000007d
	swapa	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000a8
!	Mem[0000000030081400] = a8000000 77560000 ff77fa78 29a24f6f
!	%f0  = 00005677 000000a8 6f4fa229 78fa77ff
!	%f4  = 6f4fa229 000078ff ca1f1e1a b2d5d56e
!	%f8  = 11b8bb6d 00983732 97d5814e 3e99244a
!	%f12 = cd3dd623 ec142504 339a8e0c 8a426458
	stda	%f0 ,[%i2+%g0]ASI_BLK_SL	! Block Store to 0000000030081400
!	%l3 = ffffffffffffa6ba, Mem[00000000100c1408] = ff0b0000f86100ff, %asi = 80
	stxa	%l3,[%i3+0x008]%asi	! Mem[00000000100c1408] = ffffffffffffa6ba
!	%l4 = 54094264, %l5 = 00000069, Mem[0000000010181400] = 9f7422ff a8000000
	stda	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 54094264 00000069
!	%f6  = ca1f1e1a b2d5d56e, Mem[0000000030041400] = 69000000 44390058
	stda	%f6 ,[%i1+%g0]0x89	! Mem[0000000030041400] = ca1f1e1a b2d5d56e
!	%f6  = ca1f1e1a b2d5d56e, %l3 = ffffffffffffa6ba
!	Mem[0000000010141438] = 0e230b525e20db3a
	add	%i5,0x038,%g1
	stda	%f6,[%g1+%l3]ASI_PST32_P ! Mem[0000000010141438] = ca1f1e1a5e20db3a

p0_label_94:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 08f1ffff, %l5 = 0000000000000069
	ldsba	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000008
!	Mem[0000000010041400] = 2b1a41d7, %f20 = 78d63779
	lda	[%i1+%g0]0x88,%f20	! %f20 = 2b1a41d7
!	%l5 = 0000000000000008, imm = 0000000000000dd9, %l3 = ffffffffffffa6ba
	and	%l5,0xdd9,%l3		! %l3 = 0000000000000008
!	%f24 = 61138740, %f4  = 6f4fa229, %f16 = ff000000
	fsubs	%f24,%f4 ,%f16		! %f16 = ef4fa229
!	%l0 = f180ae776b22ae74, immd = fffffffffffff604, %l108 = 0000000000000007
	udivx	%l0,-0x9fc,%l7		! %l7 = 0000000000000000
!	Mem[00000000201c0000] = d7ff8718, %l2 = 00000000000000a8
	ldsb	[%o0+%g0],%l2		! %l2 = ffffffffffffffd7
!	Mem[0000000030001400] = ffffff69, %l6 = 0000000013000000
	lduha	[%i0+%g0]0x89,%l6	! %l6 = 000000000000ff69
!	Mem[0000000010181408] = 6f4f0069, %l4 = 0000000054094264
	ldswa	[%i6+%o4]0x80,%l4	! %l4 = 000000006f4f0069
!	Mem[00000000211c0001] = 000063a8, %l1 = 0000000000690069
	ldsb	[%o2+0x001],%l1		! %l1 = 0000000000000000
!	Mem[0000000010001410] = 4e97d4fa, %l3 = 0000000000000008
	lduwa	[%i0+%o5]0x88,%l3	! %l3 = 000000004e97d4fa

p0_label_95:
!	Starting 10 instruction Store Burst
!	%l4 = 000000006f4f0069, Mem[00000000100c1438] = ffcc61f800000013
	stx	%l4,[%i3+0x038]		! Mem[00000000100c1438] = 000000006f4f0069
!	%l3 = 000000004e97d4fa, Mem[0000000010101410] = 651067106f4fa229
	stxa	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000004e97d4fa
!	%l5 = 0000000000000008, Mem[00000000100c1428] = 704c327e2b1affd7, %asi = 80
	stxa	%l5,[%i3+0x028]%asi	! Mem[00000000100c1428] = 0000000000000008
!	%f16 = ef4fa229, Mem[0000000010041410] = 00000000
	sta	%f16,[%i1+%o5]0x80	! Mem[0000000010041410] = ef4fa229
!	Mem[0000000030081400] = a8000000 77560000 ff77fa78 29a24f6f
	membar	#Sync			! Added by membar checker (20)
!	%f0  = 00005677 000000a8 6f4fa229 78fa77ff
!	%f4  = 6f4fa229 000078ff ca1f1e1a b2d5d56e
!	%f8  = 11b8bb6d 00983732 97d5814e 3e99244a
!	%f12 = cd3dd623 ec142504 339a8e0c 8a426458
	stda	%f0 ,[%i2+%g0]ASI_BLK_S	! Block Store to 0000000030081400
!	Mem[0000000010041400] = d7411a2b 00000000 ffff0000 ffff80ff
!	%f0  = 00005677 000000a8 6f4fa229 78fa77ff
!	%f4  = 6f4fa229 000078ff ca1f1e1a b2d5d56e
!	%f8  = 11b8bb6d 00983732 97d5814e 3e99244a
!	%f12 = cd3dd623 ec142504 339a8e0c 8a426458
	stda	%f0 ,[%i1+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010041400
	membar	#Sync			! Added by membar checker (21)
!	Mem[000000001004141c] = 1a1e1fca, %l3 = 000000004e97d4fa, %asi = 80
	swapa	[%i1+0x01c]%asi,%l3	! %l3 = 000000001a1e1fca
!	Mem[0000000010141400] = 6f4fa219, %l7 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l7	! %l7 = 000000006f4fa219
!	Mem[0000000030041408] = 0c8e9a33, %l4 = 000000006f4f0069
	ldstuba	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000033
!	%l1 = 0000000000000000, Mem[000000001004141c] = 4e97d4fa, %asi = 80
	stwa	%l1,[%i1+0x01c]%asi	! Mem[000000001004141c] = 00000000

p0_label_96:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 000000d7, %l0 = f180ae776b22ae74
	lduwa	[%i2+%o5]0x88,%l0	! %l0 = 00000000000000d7
!	%l2 = ffffffffffffffd7, %l7 = 000000006f4fa219, %y  = ffffffff
	smul	%l2,%l7,%l4		! %l4 = ffffffee2c3f09ff, %y = ffffffee
!	Mem[0000000010181408] = 69004f6f, %l4 = ffffffee2c3f09ff
	ldsba	[%i6+%o4]0x88,%l4	! %l4 = 000000000000006f
!	Mem[0000000030181400] = 29a24f4f, %l3 = 000000001a1e1fca
	lduwa	[%i6+%g0]0x89,%l3	! %l3 = 0000000029a24f4f
!	Mem[0000000010081430] = a6ba3fbc3701bb5d, %l0 = 00000000000000d7
	ldx	[%i2+0x030],%l0		! %l0 = a6ba3fbc3701bb5d
!	Mem[0000000010041400] = a800000077560000, %f26 = 62b61164 69004f6f
	ldd	[%i1+%g0],%f26		! %f26 = a8000000 77560000
!	Mem[0000000030141400] = 0c788688000000d7, %f0  = 00005677 000000a8
	ldda	[%i5+%g0]0x89,%f0 	! %f0  = 0c788688 000000d7
!	Mem[0000000010001408] = 6f4fa229, %l2 = ffffffffffffffd7
	ldsha	[%i0+%o4]0x80,%l2	! %l2 = 0000000000006f4f
!	Mem[0000000010101400] = ca1f1e1a, %l0 = a6ba3fbc3701bb5d
	ldsha	[%i4+%g0]0x88,%l0	! %l0 = 0000000000001e1a
!	Mem[00000000218001c1] = 45535528, %l4 = 000000000000006f
	ldub	[%o3+0x1c1],%l4		! %l4 = 0000000000000053

p0_label_97:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 29a24f6f, %l1 = 0000000000000000
	swapa	[%i2+%o4]0x89,%l1	! %l1 = 0000000029a24f6f
!	Mem[0000000010101400] = 1a1e1fca, %l1 = 0000000029a24f6f
	ldstuba	[%i4+%g0]0x80,%l1	! %l1 = 000000000000001a
!	%f6  = ca1f1e1a, Mem[00000000100c1408] = ffffffff
	sta	%f6 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = ca1f1e1a
!	Mem[0000000010141410] = 00000013, %l7 = 000000006f4fa219
	ldstuba	[%i5+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1438] = 00000000, %l4 = 00000053, %l6 = 0000ff69
	add	%i3,0x38,%g1
	casa	[%g1]0x80,%l4,%l6	! %l6 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010181438] = 675aa9c6
	stw	%l7,[%i6+0x038]		! Mem[0000000010181438] = 00000000
!	%l0 = 0000000000001e1a, Mem[00000000100c1428] = 00000000, %asi = 80
	stha	%l0,[%i3+0x028]%asi	! Mem[00000000100c1428] = 1e1a0000
!	%l2 = 0000000000006f4f, Mem[0000000021800100] = 25ffd898
	sth	%l2,[%o3+0x100]		! Mem[0000000021800100] = 6f4fd898
!	Mem[0000000010001410] = fad4974e, %l7 = 0000000000000000
	swapa	[%i0+%o5]0x80,%l7	! %l7 = 00000000fad4974e
!	%f4  = 6f4fa229 000078ff, Mem[0000000030181410] = 69000001 a6ba96ff
	stda	%f4 ,[%i6+%o5]0x81	! Mem[0000000030181410] = 6f4fa229 000078ff

p0_label_98:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 000063a8, %l5 = 0000000000000008, %asi = 80
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c142c] = 00000008, %l0 = 0000000000001e1a, %asi = 80
	lduha	[%i3+0x02c]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081410] = d7000000, %l3 = 0000000029a24f4f, %asi = 80
	lduha	[%i2+0x010]%asi,%l3	! %l3 = 000000000000d700
!	Mem[0000000010141410] = ff000013, %l6 = 0000000000000000
	ldswa	[%i5+%o5]0x80,%l6	! %l6 = ffffffffff000013
!	Mem[0000000020800041] = ffff7378, %l3 = 000000000000d700
	ldsb	[%o1+0x041],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010001408] = 29a24f6f, %l6 = ffffffffff000013
	ldsba	[%i0+%o4]0x88,%l6	! %l6 = 000000000000006f
!	Mem[0000000030001408] = 2b1a41d7, %l2 = 0000000000006f4f
	ldsha	[%i0+%o4]0x89,%l2	! %l2 = 00000000000041d7
!	Mem[0000000010041420] = 32379800, %l3 = ffffffffffffffff, %asi = 80
	ldsha	[%i1+0x020]%asi,%l3	! %l3 = 0000000000003237
!	Mem[0000000030081408] = 00000000, %f1  = 000000d7
	lda	[%i2+%o4]0x81,%f1 	! %f1 = 00000000
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000030181400] = 4f4fa229 29a24f6f ff000000 0000ba73
!	Mem[0000000030181410] = 6f4fa229 000078ff 13000000 0f7b0003
!	Mem[0000000030181420] = 49239034 ff96baa6 3adb205e bbc7b75e
!	Mem[0000000030181430] = 000000c0 54d7faff 44390058 ff0b0000
	ldda	[%i6+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030181400

p0_label_99:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (23)
!	%l0 = 0000000000000000, Mem[0000000030181400] = 4f4fa22929a24f6f
	stxa	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000000000000
!	%l4 = 00000053, %l5 = 00000000, Mem[0000000030081410] = 6f4fa229 000078ff
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000053 00000000
!	Mem[00000000100c1400] = ffff0000 00000000 ca1f1e1a ffffa6ba
!	%f16 = ef4fa229 6f4fa229 ff0b0000 f86100ff
!	%f20 = 2b1a41d7 ff0b0000 7fffffff 69000000
!	%f24 = 61138740 5e896251 a8000000 77560000
!	%f28 = 675aa9c6 ff8c61f8 ffffbaa6 a8000000
	stda	%f16,[%i3+%g0]ASI_BLK_P	! Block Store to 00000000100c1400
!	Mem[0000000010141410] = ff000013, %l1 = 000000000000001a
	ldstuba	[%i5+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%f30 = ffffbaa6 a8000000, Mem[0000000030181400] = 00000000 00000000
	stda	%f30,[%i6+%g0]0x81	! Mem[0000000030181400] = ffffbaa6 a8000000
!	%l2 = 000041d7, %l3 = 00003237, Mem[0000000010101408] = 000c0000 29a24f6f, %asi = 80
	stda	%l2,[%i4+0x008]%asi	! Mem[0000000010101408] = 000041d7 00003237
!	Mem[00000000211c0001] = 000063a8, %l1 = 00000000000000ff
	ldstub	[%o2+0x001],%l1		! %l1 = 0000000000000000
!	%l4 = 0000000000000053, %l4 = 0000000000000053, %l7 = 00000000fad4974e
	sub	%l4,%l4,%l7		! %l7 = 0000000000000000
!	%l3 = 0000000000003237, Mem[0000000030041408] = 0c8e9aff
	stba	%l3,[%i1+%o4]0x89	! Mem[0000000030041408] = 0c8e9a37
!	Mem[00000000300c1400] = 00000000, %l4 = 0000000000000053
	ldstuba	[%i3+%g0]0x89,%l4	! %l4 = 0000000000000000

p0_label_100:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00006f4f, %l7 = 0000000000000000
	lduwa	[%i3+%o5]0x89,%l7	! %l7 = 0000000000006f4f
!	Mem[0000000010041400] = a8000000 77560000, %l0 = 00000000, %l1 = 00000000
	ldd	[%i1+%g0],%l0		! %l0 = 00000000a8000000 0000000077560000
!	Mem[0000000030141408] = 6f4f0069, %l7 = 0000000000006f4f
	ldsha	[%i5+%o4]0x81,%l7	! %l7 = 0000000000006f4f
!	Mem[0000000010041400] = 000000a8, %l4 = 0000000000000000
	ldsba	[%i1+%g0]0x88,%l4	! %l4 = ffffffffffffffa8
	membar	#Sync			! Added by membar checker (24)
!	Mem[00000000100c1414] = ff0b0000, %l6 = 000000000000006f
	lduw	[%i3+0x014],%l6		! %l6 = 00000000ff0b0000
!	Mem[0000000030181408] = 000000ff, %f1  = 29a24f6f
	lda	[%i6+%o4]0x89,%f1 	! %f1 = 000000ff
!	%f2  = ff000000, %f21 = ff0b0000, %f2  = ff000000
	fadds	%f2 ,%f21,%f2 		! %f2  = ff800000
!	Mem[0000000010181438] = 00000000ff8c61f8, %l4 = ffffffffffffffa8
	ldx	[%i6+0x038],%l4		! %l4 = 00000000ff8c61f8
!	Mem[0000000030101400] = d35a0000 00000000, %l4 = ff8c61f8, %l5 = 00000000
	ldda	[%i4+%g0]0x81,%l4	! %l4 = 00000000d35a0000 0000000000000000
!	Mem[00000000201c0000] = d7ff8718, %l6 = 00000000ff0b0000
	ldsb	[%o0+%g0],%l6		! %l6 = ffffffffffffffd7

p0_label_101:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 7d000000, %l0 = 00000000a8000000
	swapa	[%i1+%o5]0x81,%l0	! %l0 = 000000007d000000
!	%l5 = 0000000000000000, Mem[00000000100c1424] = 5e896251
	stb	%l5,[%i3+0x024]		! Mem[00000000100c1424] = 00896251
!	%l3 = 0000000000003237, Mem[0000000010141400] = 00000000
	stwa	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 00003237
!	%l7 = 0000000000006f4f, Mem[0000000030181400] = a6baffff
	stba	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = a6baff4f
!	Mem[0000000030081400] = 00005677, %l6 = 00000000ffffffd7
	swapa	[%i2+%g0]0x81,%l6	! %l6 = 0000000000005677
!	%f12 = 000000c0 54d7faff, Mem[0000000010181400] = 54094264 00000069
	stda	%f12,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000c0 54d7faff
!	%l1 = 0000000077560000, imm = 0000000000000881, %l2 = 00000000000041d7
	andn	%l1,0x881,%l2		! %l2 = 0000000077560000
!	%l3 = 0000000000003237, Mem[0000000030081408] = 00000000
	stba	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = 37000000
!	%l7 = 0000000000006f4f, Mem[00000000100c1439] = ffffbaa6
	stb	%l7,[%i3+0x039]		! Mem[00000000100c1438] = ff4fbaa6
!	%f1  = 000000ff, Mem[0000000010001408] = 29a24f6f
	sta	%f1 ,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff

p0_label_102:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 37320000, %f0  = 4f4fa229
	lda	[%i5+%g0]0x88,%f0 	! %f0 = 37320000
!	Mem[0000000030001400] = 69ffffff, %l7 = 0000000000006f4f
	ldswa	[%i0+%g0]0x81,%l7	! %l7 = 0000000069ffffff
!	Mem[0000000010041408] = ff77fa78, %f30 = ffffbaa6
	lda	[%i1+%o4]0x80,%f30	! %f30 = ff77fa78
!	Mem[0000000010041410] = 000078ff, %l1 = 0000000077560000
	lduba	[%i1+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1410] = 00000bffd7411a2b, %l7 = 0000000069ffffff
	ldxa	[%i3+%o5]0x88,%l7	! %l7 = 00000bffd7411a2b
!	Mem[0000000030101408] = ff4fa2290000780c, %l0 = 000000007d000000
	ldxa	[%i4+%o4]0x81,%l0	! %l0 = ff4fa2290000780c
!	Mem[0000000010081410] = 000000d7, %l7 = 00000bffd7411a2b
	ldsba	[%i2+%o5]0x88,%l7	! %l7 = ffffffffffffffd7
!	Mem[00000000300c1400] = ff00000003b57b0f, %l2 = 0000000077560000
	ldxa	[%i3+%g0]0x81,%l2	! %l2 = ff00000003b57b0f
!	Mem[0000000030001410] = ec142504, %l0 = ff4fa2290000780c
	ldswa	[%i0+%o5]0x89,%l0	! %l0 = ffffffffec142504
!	Mem[0000000010141400] = 37320000, %l0 = ffffffffec142504
	lduha	[%i5+%g0]0x88,%l0	! %l0 = 0000000000000000

p0_label_103:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 53000000, %l7 = ffffffffffffffd7
	ldstuba	[%i2+%o5]0x89,%l7	! %l7 = 0000000000000000
!	%f20 = 2b1a41d7, %f31 = a8000000, %f0  = 37320000
	fadds	%f20,%f31,%f0 		! %f0  = 2b1841d7
!	Mem[0000000030001400] = 69ffffff, %l7 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l7	! %l7 = 0000000069ffffff
!	Mem[00000000218000c1] = 5677fc68, %l1 = 00000000000000ff
	ldstuba	[%o3+0x0c1]%asi,%l1	! %l1 = 0000000000000077
!	%l4 = d35a0000, %l5 = 00000000, Mem[0000000030181408] = ff000000 0000ba73
	stda	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = d35a0000 00000000
!	Mem[0000000010101400] = ff1e1fca8886780c, %l4 = 00000000d35a0000, %l6 = 0000000000005677
	casxa	[%i4]0x80,%l4,%l6	! %l6 = ff1e1fca8886780c
!	%l6 = ff1e1fca8886780c, Mem[0000000030101408] = ff4fa2290000780c
	stxa	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = ff1e1fca8886780c
!	Mem[0000000010141408] = a6ba96ff, %l5 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l5	! %l5 = 00000000a6ba96ff
!	Mem[0000000030181408] = 00005ad3, %l5 = 00000000a6ba96ff
	ldstuba	[%i6+%o4]0x89,%l5	! %l5 = 00000000000000d3
!	%l1 = 0000000000000077, Mem[0000000021800041] = 52ff3808, %asi = 80
	stba	%l1,[%o3+0x041]%asi	! Mem[0000000021800040] = 52773808

p0_label_104:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000010181400] = fffad754 c0000000 6f4f0069 6411b662
!	Mem[0000000010181410] = 03005677 714f03af 00000000 00000000
!	Mem[0000000010181420] = 30a368c0 0b879c21 00000000 7f1a6710
!	Mem[0000000010181430] = 6f4fa229 53fc1edd 00000000 ff8c61f8
	ldda	[%i6+%g0]ASI_BLK_AIUP,%f16	! Block Load from 0000000010181400
!	Mem[0000000010001408] = 000000ff, %l3 = 0000000000003237
	lduba	[%i0+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[000000001014141c] = f861ccff, %l2 = ff00000003b57b0f, %asi = 80
	ldsha	[%i5+0x01c]%asi,%l2	! %l2 = fffffffffffff861
!	Mem[000000001008141e] = 00001315, %l3 = 00000000000000ff, %asi = 80
	ldsha	[%i2+0x01e]%asi,%l3	! %l3 = 0000000000001315
!	Mem[0000000010081428] = 6f4fa229, %f9  = ff96baa6
	ld	[%i2+0x028],%f9 	! %f9 = 6f4fa229
!	Mem[0000000010181410] = 03005677, %l0 = 0000000000000000
	ldsha	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000300
!	Mem[0000000010081410] = d7000000, %l7 = 0000000069ffffff, %asi = 80
	ldswa	[%i2+0x010]%asi,%l7	! %l7 = ffffffffd7000000
!	Mem[00000000300c1400] = ff00000003b57b0f, %f4  = 6f4fa229 000078ff
	ldda	[%i3+%g0]0x81,%f4 	! %f4  = ff000000 03b57b0f
!	Mem[0000000010001408] = ff000000, %l2 = fffffffffffff861
	ldsba	[%i0+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	%l5 = 00000000000000d3, immd = fffffffffffff877, %l108 = 0000000000000007
	sdivx	%l5,-0x789,%l7		! %l7 = 0000000000000000

p0_label_105:
!	Starting 10 instruction Store Burst
!	%f20 = 03005677, Mem[00000000300c1400] = 000000ff
	sta	%f20,[%i3+%g0]0x89	! Mem[00000000300c1400] = 03005677
!	%l2 = ffffffffffffffff, Mem[0000000010001400] = 210c0000
	stwa	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffffff
!	%l7 = 0000000000000000, Mem[0000000010141410] = a6baffff130000ff
	stxa	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000000000
!	Mem[0000000010181410] = 77560003, %l6 = ff1e1fca8886780c
	ldstuba	[%i6+%o5]0x88,%l6	! %l6 = 0000000000000003
!	Mem[0000000010001400] = ffffffff, %l5 = 00000000000000d3
	ldstuba	[%i0+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081432] = a6ba3fbc, %l2 = ffffffffffffffff
	ldstuba	[%i2+0x032]%asi,%l2	! %l2 = 000000000000003f
!	%l0 = 0000000000000300, Mem[00000000100c1408] = ff0b0000
	stha	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 03000000
!	Mem[0000000010101400] = ca1f1eff, %l6 = 0000000000000003
	ldstuba	[%i4+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	%l4 = 00000000d35a0000, Mem[00000000300c1410] = f56f0f4700006f4f
	stxa	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000d35a0000
!	Mem[0000000010001408] = 000000ff, %l4 = 00000000d35a0000
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 00000000000000ff

p0_label_106:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081418] = 7f1a1501, %l7 = 0000000000000000
	lduw	[%i2+0x018],%l7		! %l7 = 000000007f1a1501
!	Mem[0000000010181408] = 69004f6f, %l0 = 0000000000000300
	lduwa	[%i6+%o4]0x88,%l0	! %l0 = 0000000069004f6f
!	%l1 = 0000000000000077, %l7 = 000000007f1a1501, %l4 = 00000000000000ff
	addc	%l1,%l7,%l4		! %l4 = 000000007f1a1578
!	Mem[0000000030141400] = d7000000, %l5 = 00000000000000ff
	ldsha	[%i5+%g0]0x81,%l5	! %l5 = ffffffffffffd700
!	Mem[0000000010001400] = ffffffff, %l4 = 000000007f1a1578
	ldsba	[%i0+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030141410] = 69000000a6ba96ff, %l6 = 00000000000000ff
	ldxa	[%i5+%o5]0x81,%l6	! %l6 = 69000000a6ba96ff
!	Mem[00000000211c0000] = 00ff63a8, %l5 = ffffffffffffd700
	lduh	[%o2+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030001408] = d7411a2bf86100ff, %f10 = 3adb205e bbc7b75e
	ldda	[%i0+%o4]0x81,%f10	! %f10 = d7411a2b f86100ff
!	Mem[0000000010101408] = 000041d7, %l5 = 00000000000000ff
	lduba	[%i4+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = 000000ff, %l5 = 0000000000000000
	lduba	[%i0+%o4]0x88,%l5	! %l5 = 00000000000000ff

p0_label_107:
!	Starting 10 instruction Store Burst
!	%f30 = 00000000 ff8c61f8, Mem[0000000010081400] = 7c7800ff 4f6f0000
	stda	%f30,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000 ff8c61f8
!	%l2 = 000000000000003f, %l5 = 00000000000000ff, %y  = ffffffee
	sdiv	%l2,%l5,%l1		! %l1 = ffffffffedededef
	mov	%l0,%y			! %y = 69004f6f
!	%l6 = a6ba96ff, %l7 = 7f1a1501, Mem[0000000010001418] = 3adb205e 520b230e, %asi = 80
	stda	%l6,[%i0+0x018]%asi	! Mem[0000000010001418] = a6ba96ff 7f1a1501
!	%l7 = 000000007f1a1501, Mem[0000000010101400] = ff1e1fca
	stwa	%l7,[%i4+%g0]0x80	! Mem[0000000010101400] = 7f1a1501
!	%l4 = ffffffff, %l5 = 000000ff, Mem[0000000010101408] = 000041d7 00003237
	stda	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = ffffffff 000000ff
!	%f18 = 6f4f0069 6411b662, Mem[0000000010081418] = 7f1a1501 00001315
	std	%f18,[%i2+0x018]	! Mem[0000000010081418] = 6f4f0069 6411b662
!	%l6 = 69000000a6ba96ff, immd = 000003d1, %y  = 69004f6f
	sdiv	%l6,0x3d1,%l7		! %l7 = 000000007fffffff
	mov	%l0,%y			! %y = 69004f6f
!	Mem[00000000300c1400] = 77560003, %l6 = 69000000a6ba96ff
	ldstuba	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000077
	membar	#Sync			! Added by membar checker (26)
!	%l1 = ffffffffedededef, Mem[0000000010181400] = fffad754c0000000
	stx	%l1,[%i6+%g0]		! Mem[0000000010181400] = ffffffffedededef
!	%l3 = 0000000000001315, Mem[0000000020800040] = ffff7378
	sth	%l3,[%o1+0x040]		! Mem[0000000020800040] = 13157378

p0_label_108:
!	Starting 10 instruction Load Burst
!	%l2 = 000000000000003f, imm = 00000000000000d3, %l3 = 0000000000001315
	xnor	%l2,0x0d3,%l3		! %l3 = ffffffffffffff13
!	Mem[0000000030081408] = ff77fa7800000037, %f4  = ff000000 03b57b0f
	ldda	[%i2+%o4]0x89,%f4 	! %f4  = ff77fa78 00000037
!	%l0 = 0000000069004f6f, imm = fffffffffffff8e2, %l2 = 000000000000003f
	xor	%l0,-0x71e,%l2		! %l2 = ffffffff96ffb78d
!	Mem[00000000300c1400] = 030056ff, %l6 = 0000000000000077
	ldsha	[%i3+%g0]0x89,%l6	! %l6 = 00000000000056ff
!	Mem[0000000010141400] = 37320000, %l5 = 00000000000000ff
	ldsba	[%i5+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = ffffffff, %l7 = 000000007fffffff
	lduha	[%i6+%g0]0x88,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010141408] = 0000000003b57b0f, %l2 = ffffffff96ffb78d
	ldx	[%i5+%o4],%l2		! %l2 = 0000000003b57b0f
!	Mem[0000000030081410] = ff000053, %l4 = ffffffffffffffff
	lduha	[%i2+%o5]0x81,%l4	! %l4 = 000000000000ff00
!	%f12 = 000000c0, %f24 = 30a368c0, %f26 = 00000000 7f1a6710
	fsmuld	%f12,%f24,%f26		! tt=0x22, %l0 = 0000000069004f91
!	%l7 = 000000000000ffff, %l0 = 0000000069004f91, %l6 = 00000000000056ff
	xnor	%l7,%l0,%l6		! %l6 = ffffffff96ff4f91

p0_label_109:
!	Starting 10 instruction Store Burst
!	%f8  = 49239034, Mem[0000000030141400] = d7000000
	sta	%f8 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 49239034
!	%f16 = fffad754 c0000000, %l7 = 000000000000ffff
!	Mem[0000000010181408] = 6f4f00696411b662
	add	%i6,0x008,%g1
	stda	%f16,[%g1+%l7]ASI_PST16_P ! Mem[0000000010181408] = fffad754c0000000
!	Mem[0000000010001400] = ffffffff, %l0 = 0000000069004f91
	swapa	[%i0+%g0]0x80,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000010181408] = 54d7faff, %l2 = 0000000003b57b0f
	ldstuba	[%i6+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%f6  = 13000000, Mem[0000000030041400] = b2d5d56e
	sta	%f6 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 13000000
!	%f24 = 30a368c0 0b879c21, Mem[0000000010181408] = fffad754 c0000000
	stda	%f24,[%i6+%o4]0x80	! Mem[0000000010181408] = 30a368c0 0b879c21
!	%l1 = ffffffffedededef, Mem[0000000030041410] = a8000000
	stwa	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = edededef
!	Mem[0000000010141400] = 37320000, %l5 = 0000000000000000
	ldstuba	[%i5+%g0]0x88,%l5	! %l5 = 0000000000000000
!	%l0 = 00000000ffffffff, Mem[0000000030141400] = 49239034
	stwa	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffffff
!	%l2 = 00000000000000ff, Mem[00000000300c1410] = 00005ad3
	stha	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00ff5ad3

p0_label_110:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ff003237, %f29 = 53fc1edd
	lda	[%i5+%g0]0x80,%f29	! %f29 = ff003237
!	Mem[0000000010181438] = 00000000, %l1 = ffffffffedededef
	ldub	[%i6+0x038],%l1		! %l1 = 0000000000000000
!	Mem[0000000010141408] = 00000000 03b57b0f, %l4 = 0000ff00, %l5 = 00000000
	ldda	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000 0000000003b57b0f
!	Mem[0000000030181408] = ff5a0000 00000000, %l4 = 00000000, %l5 = 03b57b0f
	ldda	[%i6+%o4]0x81,%l4	! %l4 = 00000000ff5a0000 0000000000000000
!	Mem[0000000010081400] = f8618cff00000000, %l2 = 00000000000000ff
	ldxa	[%i2+%g0]0x80,%l2	! %l2 = f8618cff00000000
!	Mem[0000000030041410] = efededed, %l6 = ffffffff96ff4f91
	lduba	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000ed
!	Mem[0000000010141400] = 00000000373200ff, %f26 = 00000000 7f1a6710
	ldda	[%i5+%g0]0x88,%f26	! %f26 = 00000000 373200ff
!	Mem[00000000201c0000] = d7ff8718, %l7 = 000000000000ffff
	ldsb	[%o0+%g0],%l7		! %l7 = ffffffffffffffd7
!	Mem[0000000010081408] = ff96baa6, %l3 = ffffffffffffff13
	lduwa	[%i2+%o4]0x88,%l3	! %l3 = 00000000ff96baa6
!	Mem[00000000100c1408] = 00000003, %l4 = 00000000ff5a0000
	ldsba	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000003

p0_label_111:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000030001410] = ec142504
	stwa	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	Mem[0000000010181430] = 6f4fa229, %l2 = f8618cff00000000
	ldstuba	[%i6+0x030]%asi,%l2	! %l2 = 000000000000006f
!	%l2 = 000000000000006f, Mem[0000000010001434] = 633fa99d
	stw	%l2,[%i0+0x034]		! Mem[0000000010001434] = 0000006f
!	%l1 = 0000000000000000, Mem[0000000030181408] = 0000000000005aff
	stxa	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000000000000000
!	%l3 = 00000000ff96baa6, Mem[00000000100c1400] = 29a24f6f29a24fef
	stxa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000ff96baa6
!	%l5 = 0000000000000000, Mem[0000000010041400] = a800000077560000
	stxa	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000000000000000
!	%l3 = 00000000ff96baa6, Mem[0000000020800000] = ffff7f48, %asi = 80
	stba	%l3,[%o1+0x000]%asi	! Mem[0000000020800000] = a6ff7f48
!	%f28 = 6f4fa229 ff003237, %l7 = ffffffffffffffd7
!	Mem[0000000010081420] = 0c78000029a24f6f
	add	%i2,0x020,%g1
	stda	%f28,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010081420] = 373200ff29a24f6f
!	%l6 = 00000000000000ed, Mem[0000000030041400] = ca1f1e1a13000000
	stxa	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000000000ed
!	%l2 = 000000000000006f, Mem[0000000021800041] = 52773808
	stb	%l2,[%o3+0x041]		! Mem[0000000021800040] = 526f3808

p0_label_112:
!	Starting 10 instruction Load Burst
!	Mem[000000001018140d] = 0b879c21, %l0 = 00000000ffffffff
	ldub	[%i6+0x00d],%l0		! %l0 = 0000000000000087
!	Mem[0000000010101400] = 7f1a1501, %l3 = 00000000ff96baa6
	ldsha	[%i4+%g0]0x80,%l3	! %l3 = 0000000000007f1a
!	Mem[0000000010001410] = 00000000e986bb58, %l4 = 0000000000000003
	ldxa	[%i0+%o5]0x80,%l4	! %l4 = 00000000e986bb58
!	Mem[00000000100c1408] = ff0061f800000003, %l6 = 00000000000000ed
	ldxa	[%i3+%o4]0x88,%l6	! %l6 = ff0061f800000003
!	%l6 = ff0061f800000003, %l3 = 0000000000007f1a, %y  = 69004f6f
	umul	%l6,%l3,%l2		! %l2 = 0000000000017d4e, %y = 00000000
!	Mem[0000000030041408] = 0c8e9a37, %l5 = 0000000000000000
	lduwa	[%i1+%o4]0x89,%l5	! %l5 = 000000000c8e9a37
!	Mem[00000000300c1400] = ff56000303b57b0f, %f14 = 44390058 ff0b0000
	ldda	[%i3+%g0]0x81,%f14	! %f14 = ff560003 03b57b0f
!	Mem[0000000030041400] = 000000ed, %l0 = 0000000000000087
	lduwa	[%i1+%g0]0x89,%l0	! %l0 = 00000000000000ed
!	Mem[0000000030181408] = 00000000, %l1 = 0000000000000000
	lduha	[%i6+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = 000078ff, %l2 = 0000000000017d4e
	ldsba	[%i1+%o5]0x88,%l2	! %l2 = ffffffffffffffff

p0_label_113:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000030181408] = 00000000
	stba	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	%f19 = 6411b662, Mem[0000000030101400] = 00005ad3
	sta	%f19,[%i4+%g0]0x89	! Mem[0000000030101400] = 6411b662
!	%l6 = ff0061f800000003, Mem[00000000300c1408] = 03000000
	stha	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 03000003
!	%f10 = d7411a2b f86100ff, Mem[0000000030181410] = 6f4fa229 000078ff
	stda	%f10,[%i6+%o5]0x81	! Mem[0000000030181410] = d7411a2b f86100ff
!	%l0 = 00000000000000ed, immd = fffffffffffff4bd, %l108 = 0000000000000004
	udivx	%l0,-0xb43,%l4		! %l4 = 0000000000000000
!	Mem[0000000010101408] = ffffffff, %l3 = 0000000000007f1a
	ldstuba	[%i4+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%l1 = 0000000000000000, imm = 0000000000000a3a, %l1 = 0000000000000000
	xor	%l1,0xa3a,%l1		! %l1 = 0000000000000a3a
!	Mem[00000000300c1400] = 030056ff, %l2 = 00000000ffffffff
	swapa	[%i3+%g0]0x89,%l2	! %l2 = 00000000030056ff
!	Mem[0000000010081400] = ff8c61f8, %l7 = ffffffffffffffd7
	ldstuba	[%i2+%g0]0x88,%l7	! %l7 = 00000000000000f8
!	Mem[0000000010081408] = a6ba96ff, %l6 = ff0061f800000003
	ldstuba	[%i2+%o4]0x80,%l6	! %l6 = 00000000000000a6

p0_label_114:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ffffffff, %l5 = 000000000c8e9a37, %asi = 80
	lduwa	[%i4+0x008]%asi,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000030041408] = 379a8e0c8a426458, %l0 = 00000000000000ed
	ldxa	[%i1+%o4]0x81,%l0	! %l0 = 379a8e0c8a426458
!	Mem[0000000010081434] = 3701bb5d, %l5 = 00000000ffffffff, %asi = 80
	ldsha	[%i2+0x034]%asi,%l5	! %l5 = 0000000000003701
!	Mem[0000000030001408] = d7411a2b, %f4  = ff77fa78
	lda	[%i0+%o4]0x81,%f4 	! %f4 = d7411a2b
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000010141400] = ff003237 00000000 00000000 03b57b0f
!	Mem[0000000010141410] = 00000000 00000000 58bb80a8 f861ccff
!	Mem[0000000010141420] = 00000000 00000000 00000000 000080ff
!	Mem[0000000010141430] = 80bb80a8 6c667169 ca1f1e1a 5e20db3a
	ldda	[%i5+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010141400
!	Mem[0000000030181400] = a6baff4f, %f2  = ff800000
	lda	[%i6+%g0]0x89,%f2 	! %f2 = a6baff4f
!	%l7 = 00000000000000f8, imm = fffffffffffff5d3, %l7 = 00000000000000f8
	andn	%l7,-0xa2d,%l7		! %l7 = 0000000000000028
!	Mem[000000001000143b] = 1f3a5d1a, %l5 = 0000000000003701, %asi = 80
	ldsba	[%i0+0x03b]%asi,%l5	! %l5 = 000000000000001a
!	Mem[00000000100c1410] = d7411a2b, %f3  = 0000ba73
	lda	[%i3+%o5]0x88,%f3 	! %f3 = d7411a2b
!	Mem[0000000010001408] = ff000000, %l2 = 00000000030056ff
	ldswa	[%i0+%o4]0x80,%l2	! %l2 = ffffffffff000000

p0_label_115:
!	Starting 10 instruction Store Burst
!	%f7  = 0f7b0003, Mem[000000001010141c] = f86100ff
	sta	%f7 ,[%i4+0x01c]%asi	! Mem[000000001010141c] = 0f7b0003
!	%f7  = 0f7b0003, %f14 = ff560003, %f15 = 03b57b0f
	fmuls	%f7 ,%f14,%f15		! %f15 = cf51d205
!	%f14 = ff560003 cf51d205, Mem[0000000030141400] = ffffffff 8886780c
	stda	%f14,[%i5+%g0]0x81	! Mem[0000000030141400] = ff560003 cf51d205
!	Mem[00000000100c1410] = d7411a2b, %l5 = 000000000000001a
	swapa	[%i3+%o5]0x88,%l5	! %l5 = 00000000d7411a2b
!	%f31 = 5e20db3a, Mem[0000000010001410] = 00000000
	sta	%f31,[%i0+%o5]0x88	! Mem[0000000010001410] = 5e20db3a
!	%l2 = ffffffffff000000, Mem[0000000010001400] = 914f0069
	stwa	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = ff000000
	membar	#Sync			! Added by membar checker (28)
!	%f12 = 000000c0 54d7faff, %l0 = 379a8e0c8a426458
!	Mem[0000000010141400] = ff00323700000000
	stda	%f12,[%i5+%l0]ASI_PST8_PL ! Mem[0000000010141400] = ff003254c0000000
!	Mem[0000000021800040] = 526f3808, %l1 = 0000000000000a3a
	ldstub	[%o3+0x040],%l1		! %l1 = 0000000000000052
!	%l5 = 00000000d7411a2b, Mem[00000000211c0000] = 00ff63a8, %asi = 80
	stba	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 2bff63a8
!	Mem[0000000030041400] = ed000000, %l3 = 00000000000000ff
	ldstuba	[%i1+%g0]0x81,%l3	! %l3 = 00000000000000ed

p0_label_116:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00ff5ad3, %f17 = 00000000
	lda	[%i3+%o5]0x81,%f17	! %f17 = 00ff5ad3
!	Mem[0000000010081400] = ff618cff, %l1 = 0000000000000052
	lduha	[%i2+%g0]0x80,%l1	! %l1 = 000000000000ff61
!	Mem[0000000030141410] = 69000000, %l5 = 00000000d7411a2b
	ldswa	[%i5+%o5]0x81,%l5	! %l5 = 0000000069000000
!	Mem[0000000030081410] = ff000053, %l4 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l4	! %l4 = 00000000ff000053
!	Mem[00000000100c142c] = 77560000, %f28 = 80bb80a8
	ld	[%i3+0x02c],%f28	! %f28 = 77560000
!	Mem[0000000010181400] = ffffffff, %l6 = 00000000000000a6
	ldswa	[%i6+%g0]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030101408] = ca1f1eff, %f18 = 00000000
	lda	[%i4+%o4]0x89,%f18	! %f18 = ca1f1eff
!	Mem[0000000010181400] = ffffffff, %l3 = 00000000000000ed
	ldsba	[%i6+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	%l4 = 00000000ff000053, imm = 000000000000020c, %l6 = ffffffffffffffff
	sub	%l4,0x20c,%l6		! %l6 = 00000000fefffe47
!	Mem[0000000030181408] = 00000000, %f15 = cf51d205
	lda	[%i6+%o4]0x81,%f15	! %f15 = 00000000

p0_label_117:
!	Starting 10 instruction Store Burst
!	Code Fragment 4, seed = 966511
p0_fragment_10:
!	%l0 = 379a8e0c8a426458
	setx	0xf6e480406fa71bae,%g7,%l0 ! %l0 = f6e480406fa71bae
!	%l1 = 000000000000ff61
	setx	0x7bf1e8cbc1e89959,%g7,%l1 ! %l1 = 7bf1e8cbc1e89959
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f6e480406fa71bae
	setx	0x0e164b94bc834314,%g7,%l0 ! %l0 = 0e164b94bc834314
!	%l1 = 7bf1e8cbc1e89959
	setx	0x28dba394c8ac9bdf,%g7,%l1 ! %l1 = 28dba394c8ac9bdf
p0_fragment_10_end:
!	%f4  = d7411a2b, %f17 = 00ff5ad3, %f5  = 00000037
	fmuls	%f4 ,%f17,%f5 		! %f5  = 98c09d93
!	%l7 = 0000000000000028, Mem[00000000211c0001] = 2bff63a8
	stb	%l7,[%o2+0x001]		! Mem[00000000211c0000] = 2b2863a8
!	%f16 = ff003237 00ff5ad3, %l2 = ffffffffff000000
!	Mem[0000000030181420] = 49239034ff96baa6
	add	%i6,0x020,%g1
	stda	%f16,[%g1+%l2]ASI_PST8_S ! Mem[0000000030181420] = 49239034ff96baa6
!	Mem[0000000010101408] = ffffffff, %l5 = 0000000069000000
	ldstuba	[%i4+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101400] = 6411b662, %l7 = 0000000000000028
	swapa	[%i4+%g0]0x89,%l7	! %l7 = 000000006411b662
!	Mem[0000000010101409] = ffffffff, %l0 = 0e164b94bc834314
	ldstub	[%i4+0x009],%l0		! %l0 = 00000000000000ff
!	%l2 = ffffffffff000000, Mem[0000000030101408] = ca1f1eff
	stba	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = ca1f1e00
!	Mem[0000000030001408] = d7411a2b, %l2 = 00000000ff000000
	swapa	[%i0+%o4]0x81,%l2	! %l2 = 00000000d7411a2b
!	Mem[00000000300c1408] = 03000003, %l2 = 00000000d7411a2b
	swapa	[%i3+%o4]0x89,%l2	! %l2 = 0000000003000003

p0_label_118:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00000000, %l2 = 0000000003000003, %asi = 80
	lduwa	[%i5+0x008]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141430] = 80bb80a8, %l2 = 0000000000000000
	ldub	[%i5+0x030],%l2		! %l2 = 0000000000000080
!	Mem[0000000010181400] = ffffffff, %f9  = 6f4fa229
	lda	[%i6+%g0]0x88,%f9 	! %f9 = ffffffff
!	Mem[0000000030041400] = 000000ff, %l2 = 0000000000000080
	ldsba	[%i1+%g0]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1400] = a6ba96ff, %l7 = 000000006411b662
	ldsha	[%i3+%g0]0x80,%l7	! %l7 = ffffffffffffa6ba
!	%l1 = 28dba394c8ac9bdf, immd = fffffffffffffa7f, %l108 = 0000000000000000
	sdivx	%l1,-0x581,%l0		! %l0 = fff89398e06ce418
!	Mem[0000000010041410] = ff780000, %l2 = ffffffffffffffff
	lduh	[%i1+%o5],%l2		! %l2 = 000000000000ff78
!	Mem[00000000100c1406] = 00000000, %l3 = ffffffffffffffff
	lduh	[%i3+0x006],%l3		! %l3 = 0000000000000000
!	Mem[0000000030101400] = 28000000, %l3 = 0000000000000000
	lduba	[%i4+%g0]0x81,%l3	! %l3 = 0000000000000028
!	Mem[0000000010181410] = af034f71775600ff, %l4 = 00000000ff000053
	ldxa	[%i6+%o5]0x88,%l4	! %l4 = af034f71775600ff

p0_label_119:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000028, Mem[0000000030181400] = a6baff4f
	stba	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = a6baff28
!	Mem[0000000010181400] = ffffffff, %l1 = 28dba394c8ac9bdf
	ldstuba	[%i6+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %l1 = 00000000000000ff
	ldstuba	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081400] = ffffffd7 000000a8 37000000 78fa77ff
!	%f0  = 2b1841d7 000000ff a6baff4f d7411a2b
!	%f4  = d7411a2b 98c09d93 13000000 0f7b0003
!	%f8  = 49239034 ffffffff d7411a2b f86100ff
!	%f12 = 000000c0 54d7faff ff560003 00000000
	stda	%f0 ,[%i2+%g0]ASI_COMMIT_S	! Block Store to 0000000030081400
!	%f5  = 98c09d93, Mem[0000000030001400] = 00000000
	sta	%f5 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 98c09d93
!	%f6  = 13000000 0f7b0003, %l1 = 0000000000000000
!	Mem[0000000010181430] = ff4fa22953fc1edd
	add	%i6,0x030,%g1
	stda	%f6,[%g1+%l1]ASI_PST8_P ! Mem[0000000010181430] = ff4fa22953fc1edd
!	Mem[0000000030001410] = 00000000, %l1 = 0000000000000000
	swapa	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%f26 = 00000000 000080ff, Mem[0000000010101410] = 4e97d4fa 00000000
	stda	%f26,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000 000080ff
!	%f12 = 000000c0 54d7faff, Mem[0000000010101418] = e6cb95ff 0f7b0003
	std	%f12,[%i4+0x018]	! Mem[0000000010101418] = 000000c0 54d7faff
!	%l0 = fff89398e06ce418, Mem[0000000030101410] = 29a24f6f
	stha	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 29a2e418

p0_label_120:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 2b1a41d7, %l2 = 000000000000ff78
	lduwa	[%i6+%o5]0x89,%l2	! %l2 = 000000002b1a41d7
!	Mem[0000000030181410] = ff0061f8 2b1a41d7, %l4 = 775600ff, %l5 = 000000ff
	ldda	[%i6+%o5]0x89,%l4	! %l4 = 000000002b1a41d7 00000000ff0061f8
!	Mem[00000000201c0000] = d7ff8718, %l5 = 00000000ff0061f8, %asi = 80
	lduha	[%o0+0x000]%asi,%l5	! %l5 = 000000000000d7ff
!	Mem[0000000010141410] = 00000000, %l2 = 000000002b1a41d7
	ldsha	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000000
!	%f22 = 58bb80a8, %f17 = 00ff5ad3
	fsqrts	%f22,%f17		! %f17 = 4c1aeb9f
!	Mem[00000000100c1400] = a6ba96ff, %l3 = 0000000000000028
	ldsba	[%i3+%g0]0x80,%l3	! %l3 = ffffffffffffffa6
!	Mem[00000000100c1414] = ff0b0000, %l3 = ffffffffffffffa6
	ldsw	[%i3+0x014],%l3		! %l3 = ffffffffff0b0000
!	Mem[00000000100c1428] = a8000000, %l2 = 0000000000000000, %asi = 80
	ldswa	[%i3+0x028]%asi,%l2	! %l2 = ffffffffa8000000
!	Mem[00000000100c1400] = ff96baa6, %f31 = 5e20db3a
	lda	[%i3+%g0]0x88,%f31	! %f31 = ff96baa6
!	Mem[0000000030001400] = 939dc098, %l5 = 000000000000d7ff
	ldswa	[%i0+%g0]0x81,%l5	! %l5 = ffffffff939dc098

p0_label_121:
!	Starting 10 instruction Store Burst
!	%l0 = fff89398e06ce418, Mem[0000000030181400] = 28ffbaa6a8000000
	stxa	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = fff89398e06ce418
	membar	#Sync			! Added by membar checker (29)
!	%f27 = 000080ff, Mem[0000000030081400] = d741182b
	sta	%f27,[%i2+%g0]0x89	! Mem[0000000030081400] = 000080ff
!	Mem[00000000300c1408] = d7411a2b, %l5 = 00000000939dc098
	swapa	[%i3+%o4]0x89,%l5	! %l5 = 00000000d7411a2b
!	%l3 = ffffffffff0b0000, Mem[0000000030041400] = ff000000
	stba	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	%l6 = 00000000fefffe47, Mem[0000000010041408] = ff77fa78
	stba	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 4777fa78
!	%f4  = d7411a2b 98c09d93, Mem[0000000030101410] = 18e4a229 0000780c
	stda	%f4 ,[%i4+%o5]0x81	! Mem[0000000030101410] = d7411a2b 98c09d93
!	Mem[00000000211c0001] = 2b2863a8, %l3 = ffffffffff0b0000
	ldstuba	[%o2+0x001]%asi,%l3	! %l3 = 0000000000000028
!	Mem[00000000100c1424] = 00896251, %l0 = e06ce418, %l2 = a8000000
	add	%i3,0x24,%g1
	casa	[%g1]0x80,%l0,%l2	! %l2 = 0000000000896251
!	%l0 = fff89398e06ce418, Mem[0000000010001410] = 3adb205e
	stha	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = e418205e
!	%l1 = 0000000000000000, Mem[0000000010041410] = 6f4fa229000078ff
	stxa	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000000000000000

p0_label_122:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = af034f71 775600ff, %l6 = fefffe47, %l7 = ffffa6ba
	ldda	[%i6+%o5]0x88,%l6	! %l6 = 00000000775600ff 00000000af034f71
!	Mem[0000000030041400] = 0000000000000000, %l3 = 0000000000000028
	ldxa	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141408] = 6f4f0069, %l4 = 000000002b1a41d7
	ldswa	[%i5+%o4]0x81,%l4	! %l4 = 000000006f4f0069
!	%f30 = ca1f1e1a, %f16 = ff003237
	fcmpes	%fcc2,%f30,%f16		! %fcc2 = 2
!	Mem[0000000030081400] = ff800000000000ff, %f22 = 58bb80a8 f861ccff
	ldda	[%i2+%g0]0x81,%f22	! %f22 = ff800000 000000ff
!	Mem[00000000211c0000] = 2bff63a8, %l6 = 00000000775600ff, %asi = 80
	ldsha	[%o2+0x000]%asi,%l6	! %l6 = 0000000000002bff
!	Mem[0000000010001408] = 000000ff, %l4 = 000000006f4f0069
	ldsba	[%i0+%o4]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030181410] = 2b1a41d7, %l0 = fff89398e06ce418
	ldsba	[%i6+%o5]0x89,%l0	! %l0 = ffffffffffffffd7
!	Mem[0000000010181408] = 30a368c00b879c21, %l7 = 00000000af034f71
	ldx	[%i6+%o4],%l7		! %l7 = 30a368c00b879c21
!	Mem[0000000030041400] = 00000000, %l6 = 0000000000002bff
	lduha	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000000

p0_label_123:
!	Starting 10 instruction Store Burst
!	%f12 = 000000c0, Mem[0000000010041408] = 4777fa78
	sta	%f12,[%i1+%o4]0x80	! Mem[0000000010041408] = 000000c0
!	%l1 = 0000000000000000, Mem[0000000010101400] = 01151a7f
	stwa	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000
!	Mem[0000000030081400] = 000080ff, %l2 = 0000000000896251
	swapa	[%i2+%g0]0x89,%l2	! %l2 = 00000000000080ff
!	Mem[0000000030101410] = 2b1a41d7, %l4 = 00000000ffffffff
	swapa	[%i4+%o5]0x89,%l4	! %l4 = 000000002b1a41d7
!	%f20 = 00000000, %f12 = 000000c0, %f10 = d7411a2b
	fsubs	%f20,%f12,%f10		! tt=0x22, %l0 = fffffffffffffff9
!	%l0 = fffffff9, %l1 = 00000000, Mem[0000000030041400] = 00000000 00000000
	stda	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = fffffff9 00000000
!	%l2 = 00000000000080ff, immd = fffffffffffff38c, %l108 = 0000000000000005
	udivx	%l2,-0xc74,%l5		! %l5 = 0000000000000000
!	%l6 = 0000000000000000, Mem[00000000100c1400] = ff96baa6
	stha	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = ff960000
!	Mem[0000000030081400] = 51628900, %l4 = 000000002b1a41d7
	swapa	[%i2+%g0]0x81,%l4	! %l4 = 0000000051628900
!	%l3 = 0000000000000000, Mem[0000000010141400] = ff003254
	stba	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 00003254

p0_label_124:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 775600ff, %l6 = 0000000000000000
	ldswa	[%i6+%o5]0x88,%l6	! %l6 = 00000000775600ff
!	Mem[0000000030081400] = 2b1a41d7, %l7 = 30a368c00b879c21
	lduba	[%i2+%g0]0x81,%l7	! %l7 = 000000000000002b
!	Mem[0000000030101410] = 939dc098ffffffff, %f20 = 00000000 00000000
	ldda	[%i4+%o5]0x89,%f20	! %f20 = 939dc098 ffffffff
!	Mem[0000000010041435] = 23d63dcd, %l2 = 00000000000080ff, %asi = 80
	ldsba	[%i1+0x035]%asi,%l2	! %l2 = ffffffffffffffd6
!	Mem[0000000030101408] = ca1f1e00, %l4 = 0000000051628900
	ldsha	[%i4+%o4]0x89,%l4	! %l4 = 0000000000001e00
!	Mem[0000000010181400] = ffffffff edededef, %l6 = 775600ff, %l7 = 0000002b
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 00000000ffffffff 00000000edededef
!	Mem[0000000010001400] = ff000000, %l3 = 0000000000000000
	ldsba	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141410] = 00000069, %l2 = ffffffffffffffd6
	lduba	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000069
!	%l3 = 0000000000000000, %l1 = 0000000000000000, %l1  = 0000000000000000
	mulx	%l3,%l1,%l1		! %l1 = 0000000000000000
!	Mem[0000000010041434] = 23d63dcd, %l4 = 0000000000001e00
	lduh	[%i1+0x034],%l4		! %l4 = 00000000000023d6

p0_label_125:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = ffffffff 03b57b0f 98c09d93 00000013
!	%f16 = ff003237 4c1aeb9f ca1f1eff 03b57b0f
!	%f20 = 939dc098 ffffffff ff800000 000000ff
!	%f24 = 00000000 00000000 00000000 000080ff
!	%f28 = 77560000 6c667169 ca1f1e1a ff96baa6
	stda	%f16,[%i3+%g0]ASI_COMMIT_S	! Block Store to 00000000300c1400
!	Mem[0000000030081400] = 2b1a41d7 000000ff a6baff4f d7411a2b
!	%f16 = ff003237 4c1aeb9f ca1f1eff 03b57b0f
!	%f20 = 939dc098 ffffffff ff800000 000000ff
!	%f24 = 00000000 00000000 00000000 000080ff
!	%f28 = 77560000 6c667169 ca1f1e1a ff96baa6
	stda	%f16,[%i2+%g0]ASI_BLK_S	! Block Store to 0000000030081400
!	Mem[0000000030101410] = ffffffff, %l2 = 0000000000000069
	swapa	[%i4+%o5]0x81,%l2	! %l2 = 00000000ffffffff
!	%l3 = 0000000000000000, Mem[00000000211c0000] = 2bff63a8
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 000063a8
!	Mem[0000000010141400] = 00003254, %l1 = 0000000000000000
	ldstuba	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%l5 = 0000000000000000, %l1 = 0000000000000000, %l6 = 00000000ffffffff
	addc	%l5,%l1,%l6		! %l6 = 0000000000000000
!	%f24 = 00000000 00000000, Mem[0000000010041430] = 042514ec 23d63dcd
	std	%f24,[%i1+0x030]	! Mem[0000000010041430] = 00000000 00000000
!	Mem[0000000030141410] = 00000069, %l2 = 00000000ffffffff
	ldstuba	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000069
!	%l6 = 00000000, %l7 = edededef, Mem[0000000010181400] = ffffffff edededef
	std	%l6,[%i6+%g0]		! Mem[0000000010181400] = 00000000 edededef
!	Mem[0000000010001408] = ff000000, %l1 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l1	! %l1 = 00000000ff000000

p0_label_126:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 001e1fca, %l1 = 00000000ff000000
	ldswa	[%i4+%o4]0x81,%l1	! %l1 = 00000000001e1fca
!	Mem[0000000030141410] = ff000000a6ba96ff, %l0 = fffffffffffffff9
	ldxa	[%i5+%o5]0x81,%l0	! %l0 = ff000000a6ba96ff
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000030081400] = ff003237, %l1 = 00000000001e1fca
	ldswa	[%i2+%g0]0x81,%l1	! %l1 = ffffffffff003237
!	Mem[0000000010181400] = 00000000, %l5 = 0000000000000000, %asi = 80
	lduwa	[%i6+0x000]%asi,%l5	! %l5 = 0000000000000000
!	%l5 = 0000000000000000, immd = fffff7a8, %y  = 00000000
	sdiv	%l5,-0x858,%l4		! %l4 = 0000000000000000
	mov	%l0,%y			! %y = a6ba96ff
!	Mem[0000000010181410] = 775600ff, %l5 = 0000000000000000
	ldsha	[%i6+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001410] = 00000000, %l7 = 00000000edededef
	ldsha	[%i0+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Code Fragment 4, seed = 655001
p0_fragment_11:
!	%l0 = ff000000a6ba96ff
	setx	0x217fded001c66c5e,%g7,%l0 ! %l0 = 217fded001c66c5e
!	%l1 = ffffffffff003237
	setx	0x4dfde748a8b8cb09,%g7,%l1 ! %l1 = 4dfde748a8b8cb09
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 217fded001c66c5e
	setx	0x312170a1538285c4,%g7,%l0 ! %l0 = 312170a1538285c4
!	%l1 = 4dfde748a8b8cb09
	setx	0x18ac280912c21f8f,%g7,%l1 ! %l1 = 18ac280912c21f8f
p0_fragment_11_end:
!	Mem[00000000300c1408] = ca1f1eff, %l4 = 0000000000000000
	lduwa	[%i3+%o4]0x81,%l4	! %l4 = 00000000ca1f1eff
!	Mem[0000000010081400] = ff618cff, %l7 = 0000000000000000
	lduwa	[%i2+%g0]0x80,%l7	! %l7 = 00000000ff618cff

p0_label_127:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000069, Mem[00000000300c1400] = ff003237
	stha	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00693237
!	%l3 = 0000000000000000, Mem[0000000030181400] = 9893f8ff
	stha	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 98930000
!	%f30 = ca1f1e1a ff96baa6, Mem[00000000300c1400] = 37326900 9feb1a4c
	stda	%f30,[%i3+%g0]0x89	! Mem[00000000300c1400] = ca1f1e1a ff96baa6
!	%l7 = 00000000ff618cff, Mem[0000000030041400] = fffffff9
	stwa	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = ff618cff
!	%f30 = ca1f1e1a ff96baa6, Mem[0000000010181400] = 00000000 edededef
	stda	%f30,[%i6+%g0]0x80	! Mem[0000000010181400] = ca1f1e1a ff96baa6
!	Mem[0000000010141408] = ff000000, %l0 = 00000000538285c4
	swapa	[%i5+%o4]0x80,%l0	! %l0 = 00000000ff000000
!	%l6 = 0000000000000000, Mem[0000000010181418] = 00000000
	sth	%l6,[%i6+0x018]		! Mem[0000000010181418] = 00000000
!	Mem[0000000030001408] = 000000ff, %l5 = 00000000000000ff
	swapa	[%i0+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%l2 = 0000000000000069, %l5 = 00000000000000ff, %l3 = 0000000000000000
	xor	%l2,%l5,%l3		! %l3 = 0000000000000096
!	%l2 = 0000000000000069, Mem[0000000020800000] = a6ff7f48
	sth	%l2,[%o1+%g0]		! Mem[0000000020800000] = 00697f48

p0_label_128:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 0000006998c09d93, %f4  = d7411a2b 98c09d93
	ldda	[%i4+%o5]0x81,%f4 	! %f4  = 00000069 98c09d93
!	Mem[0000000030001408] = 000000ff, %f24 = 00000000
	lda	[%i0+%o4]0x89,%f24	! %f24 = 000000ff
!	Mem[0000000010181400] = 1a1e1fca, %l7 = 00000000ff618cff
	lduha	[%i6+%g0]0x88,%l7	! %l7 = 0000000000001fca
!	Mem[0000000030181400] = 98930000, %l7 = 0000000000001fca
	ldsba	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001400] = 000000ff000000ff, %f28 = 77560000 6c667169
	ldda	[%i0+%g0]0x80,%f28	! %f28 = 000000ff 000000ff
!	Mem[0000000010141400] = ff003254c0000000, %f4  = 00000069 98c09d93
	ldda	[%i5+%g0]0x80,%f4 	! %f4  = ff003254 c0000000
!	Mem[00000000100c1408] = 03000000, %l4 = 00000000ca1f1eff
	ldsb	[%i3+%o4],%l4		! %l4 = 0000000000000003
!	Mem[0000000030101408] = 001e1fca 8886780c, %l2 = 00000069, %l3 = 00000096
	ldda	[%i4+%o4]0x81,%l2	! %l2 = 00000000001e1fca 000000008886780c
!	Mem[0000000030101410] = 00000069 98c09d93, %l0 = ff000000, %l1 = 12c21f8f
	ldda	[%i4+%o5]0x81,%l0	! %l0 = 0000000000000069 0000000098c09d93
!	Mem[00000000100c1410] = 1a000000, %l1 = 0000000098c09d93
	lduha	[%i3+%o5]0x80,%l1	! %l1 = 0000000000001a00

p0_label_129:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000003, Mem[00000000100c1408] = 00000003
	stha	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000003
!	%f7  = 0f7b0003, Mem[0000000010001400] = ff000000
	sta	%f7 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 0f7b0003
!	Mem[0000000030081400] = ff003237, %l7 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l7	! %l7 = 00000000ff003237
!	%f12 = 000000c0 54d7faff, Mem[00000000100c1410] = 0000001a 00000bff
	stda	%f12,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000c0 54d7faff
!	%l4 = 00000003, %l5 = 000000ff, Mem[0000000010041408] = 000000c0 29a24f6f
	stda	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000003 000000ff
!	Mem[0000000030041400] = ff618cff, %l1 = 0000000000001a00
	ldstuba	[%i1+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%l4 = 00000003, %l5 = 000000ff, Mem[0000000010141410] = 00000000 00000000
	stda	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000003 000000ff
!	%f0  = 2b1841d7 000000ff, %l0 = 0000000000000069
!	Mem[00000000100c1400] = 000096ff00000000
	stda	%f0,[%i3+%l0]ASI_PST16_P ! Mem[00000000100c1400] = 2b1896ff000000ff
!	%f17 = 4c1aeb9f, Mem[0000000010141408] = c4858253
	sta	%f17,[%i5+%o4]0x88	! Mem[0000000010141408] = 4c1aeb9f
!	%l6 = 0000000000000000, Mem[0000000030001408] = 000000ff
	stha	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000

p0_label_130:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000000, %l4 = 0000000000000003
	lduwa	[%i2+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041410] = edededef, %l4 = 0000000000000000
	ldsba	[%i1+%o5]0x81,%l4	! %l4 = ffffffffffffffed
!	Mem[0000000030181410] = ff0061f8 2b1a41d7, %l2 = 001e1fca, %l3 = 8886780c
	ldda	[%i6+%o5]0x89,%l2	! %l2 = 000000002b1a41d7 00000000ff0061f8
!	Mem[0000000030001410] = 00000000, %f17 = 4c1aeb9f
	lda	[%i0+%o5]0x89,%f17	! %f17 = 00000000
!	Mem[0000000010181400] = ca1f1e1aff96baa6, %f2  = a6baff4f d7411a2b, %asi = 80
	ldda	[%i6+0x000]%asi,%f2 	! %f2  = ca1f1e1a ff96baa6
!	Code Fragment 3, seed = 667980
p0_fragment_12:
!	%l0 = 0000000000000069
	setx	0xf9fce5752194f9c6,%g7,%l0 ! %l0 = f9fce5752194f9c6
!	%l1 = 00000000000000ff
	setx	0x476ceb3acc5bfbf1,%g7,%l1 ! %l1 = 476ceb3acc5bfbf1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f9fce5752194f9c6
	setx	0xdea5b77d4a3f022c,%g7,%l0 ! %l0 = dea5b77d4a3f022c
!	%l1 = 476ceb3acc5bfbf1
	setx	0xd9abe07763dc0f77,%g7,%l1 ! %l1 = d9abe07763dc0f77
p0_fragment_12_end:
!	Mem[0000000010001400] = 03007b0f000000ff, %l3 = 00000000ff0061f8
	ldxa	[%i0+%g0]0x80,%l3	! %l3 = 03007b0f000000ff
!	Mem[0000000010101410] = ff800000, %l3 = 03007b0f000000ff
	lduwa	[%i4+%o5]0x80,%l3	! %l3 = 00000000ff800000
!	Mem[0000000010041408] = 00000003, %l2 = 000000002b1a41d7
	swap	[%i1+%o4],%l2		! %l2 = 0000000000000003
!	Mem[0000000010001400] = 03007b0f, %l2 = 0000000000000003
	ldsha	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000300

p0_label_131:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141430] = 80bb80a86c667169, %l0 = dea5b77d4a3f022c, %l1 = d9abe07763dc0f77
	add	%i5,0x30,%g1
	casxa	[%g1]0x80,%l0,%l1	! %l1 = 80bb80a86c667169
!	%f24 = 000000ff 00000000, Mem[0000000030081400] = 00000000 4c1aeb9f
	stda	%f24,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000ff 00000000
!	Mem[0000000010141418] = 58bb80a8, %l4 = ffffffed, %l0 = 4a3f022c
	add	%i5,0x18,%g1
	casa	[%g1]0x80,%l4,%l0	! %l0 = 0000000058bb80a8
!	Mem[0000000010181420] = 30a368c0, %l2 = 0000000000000300
	swap	[%i6+0x020],%l2		! %l2 = 0000000030a368c0
!	Mem[0000000030081408] = ff1e1fca, %l7 = 00000000ff003237
	ldstuba	[%i2+%o4]0x89,%l7	! %l7 = 00000000000000ca
!	%f0  = 2b1841d7 000000ff, Mem[0000000010041400] = 00000000 00000000
	stda	%f0 ,[%i1+%g0]0x88	! Mem[0000000010041400] = 2b1841d7 000000ff
!	%l4 = ffffffffffffffed, Mem[0000000010041410] = 00000000
	stha	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = ffed0000
!	%f3  = ff96baa6, Mem[0000000030081400] = 000000ff
	sta	%f3 ,[%i2+%g0]0x81	! Mem[0000000030081400] = ff96baa6
!	%l4 = ffffffffffffffed, Mem[0000000030001400] = 0000000098c09d93
	stxa	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffffffffffffed
!	%f18 = ca1f1eff, Mem[0000000030041400] = ff8c61ff
	sta	%f18,[%i1+%g0]0x81	! Mem[0000000030041400] = ca1f1eff

p0_label_132:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000, %l0 = 0000000058bb80a8
	lduba	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = 2b1a41d7, %l1 = 80bb80a86c667169
	ldswa	[%i6+%o5]0x89,%l1	! %l1 = 000000002b1a41d7
!	Mem[0000000010141400] = ff003254 c0000000, %l6 = 00000000, %l7 = 000000ca
	ldda	[%i5+%g0]0x80,%l6	! %l6 = 00000000ff003254 00000000c0000000
!	Mem[0000000030101408] = 001e1fca, %l6 = 00000000ff003254
	ldsha	[%i4+%o4]0x81,%l6	! %l6 = 000000000000001e
!	Mem[00000000211c0001] = 000063a8, %l7 = 00000000c0000000, %asi = 80
	lduba	[%o2+0x001]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %f27 = 000080ff
	lda	[%i6+%o4]0x89,%f27	! %f27 = 00000000
!	Mem[000000001018143a] = 00000000, %l4 = ffffffffffffffed, %asi = 80
	lduba	[%i6+0x03a]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001410] = e418205e, %l0 = 0000000000000000
	lduba	[%i0+%o5]0x80,%l0	! %l0 = 00000000000000e4
!	%l3 = 00000000ff800000, imm = 000000000000089b, %l6 = 000000000000001e
	and	%l3,0x89b,%l6		! %l6 = 0000000000000000
!	Mem[00000000100c1400] = ff96182b, %l7 = 0000000000000000
	ldswa	[%i3+%g0]0x88,%l7	! %l7 = ffffffffff96182b

p0_label_133:
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffff96182b, Mem[0000000021800000] = 469b4fd8, %asi = 80
	stba	%l7,[%o3+0x000]%asi	! Mem[0000000021800000] = 2b9b4fd8
!	%l2 = 30a368c0, %l3 = ff800000, Mem[0000000030001408] = 00000000 f86100ff
	stda	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 30a368c0 ff800000
!	Mem[00000000100c1400] = ff000000 ff96182b, %l6 = 00000000, %l7 = ff96182b
	ldda	[%i3+%g0]0x88,%l6	! %l6 = 00000000ff96182b 00000000ff000000
!	Mem[00000000201c0001] = d7ff8718, %l6 = 00000000ff96182b
	ldstub	[%o0+0x001],%l6		! %l6 = 00000000000000ff
!	%l1 = 000000002b1a41d7, Mem[00000000100c143c] = a8000000
	stb	%l1,[%i3+0x03c]		! Mem[00000000100c143c] = d7000000
!	Mem[0000000010081400] = ff618cff, %l0 = 00000000000000e4
	swapa	[%i2+%g0]0x80,%l0	! %l0 = 00000000ff618cff
!	Mem[0000000030101408] = 001e1fca, %l4 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%l6 = 00000000000000ff, Mem[0000000010141400] = 543200ff
	stba	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 543200ff
!	%l5 = 00000000000000ff, Mem[0000000010001410] = 5e2018e4
	stwa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000ff
!	%f0  = 2b1841d7 000000ff, Mem[0000000030041410] = edededef 00000000
	stda	%f0 ,[%i1+%o5]0x81	! Mem[0000000030041410] = 2b1841d7 000000ff

p0_label_134:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 775600ff, %l4 = 0000000000000000
	lduwa	[%i6+%o5]0x88,%l4	! %l4 = 00000000775600ff
!	%l2 = 0000000030a368c0, imm = fffffffffffff0cb, %l7 = 00000000ff000000
	sub	%l2,-0xf35,%l7		! %l7 = 0000000030a377f5
!	Mem[0000000010181408] = 219c870bc068a330, %l7 = 0000000030a377f5
	ldxa	[%i6+%o4]0x88,%l7	! %l7 = 219c870bc068a330
!	Mem[00000000100c1410] = 54d7faff, %l5 = 00000000000000ff
	ldsha	[%i3+%o5]0x88,%l5	! %l5 = fffffffffffffaff
!	%f14 = ff560003, %f5  = c0000000, %f1  = 000000ff
	fdivs	%f14,%f5 ,%f1 		! %f1  = 7ed60003
!	Mem[0000000010101408] = ffffffff, %f1  = 7ed60003
	lda	[%i4+%o4]0x80,%f1 	! %f1 = ffffffff
!	Mem[00000000100c1414] = c0000000, %l7 = 219c870bc068a330
	lduw	[%i3+0x014],%l7		! %l7 = 00000000c0000000
!	Mem[00000000100c1420] = 61138740 00896251, %l2 = 30a368c0, %l3 = ff800000
	ldd	[%i3+0x020],%l2		! %l2 = 0000000061138740 0000000000896251
!	Mem[0000000030101410] = 0000006998c09d93, %l1 = 000000002b1a41d7
	ldxa	[%i4+%o5]0x81,%l1	! %l1 = 0000006998c09d93
!	Mem[0000000030101408] = ff1e1fca, %l2 = 0000000061138740
	ldsba	[%i4+%o4]0x81,%l2	! %l2 = ffffffffffffffff

p0_label_135:
!	Starting 10 instruction Store Burst
!	%f4  = ff003254 c0000000, Mem[0000000030081410] = 98c09d93 ffffffff
	stda	%f4 ,[%i2+%o5]0x89	! Mem[0000000030081410] = ff003254 c0000000
!	%f16 = ff003237 00000000, Mem[00000000300c1408] = ca1f1eff 03b57b0f
	stda	%f16,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff003237 00000000
!	Mem[0000000010101411] = ff800000, %l3 = 0000000000896251
	ldstub	[%i4+0x011],%l3		! %l3 = 0000000000000080
!	%f18 = ca1f1eff 03b57b0f, Mem[0000000010141410] = 03000000 ff000000
	stda	%f18,[%i5+%o5]0x88	! Mem[0000000010141410] = ca1f1eff 03b57b0f
!	%l6 = 000000ff, %l7 = c0000000, Mem[00000000100c1438] = ff4fbaa6 d7000000, %asi = 80
	stda	%l6,[%i3+0x038]%asi	! Mem[00000000100c1438] = 000000ff c0000000
!	%l5 = fffffffffffffaff, Mem[0000000010141408] = 9feb1a4c03b57b0f
	stxa	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = fffffffffffffaff
!	Mem[0000000010141410] = 03b57b0f, %l4 = 00000000775600ff
	swapa	[%i5+%o5]0x88,%l4	! %l4 = 0000000003b57b0f
!	Mem[0000000030001408] = c068a330, %l3 = 0000000000000080
	ldstuba	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000030
!	Mem[0000000010181400] = 1a1e1fca, %l0 = 00000000ff618cff
	ldstuba	[%i6+%g0]0x88,%l0	! %l0 = 00000000000000ca
!	%l2 = ffffffffffffffff, Mem[0000000010081424] = 29a24f6f, %asi = 80
	stwa	%l2,[%i2+0x024]%asi	! Mem[0000000010081424] = ffffffff

p0_label_136:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ffed0000, %l3 = 0000000000000030
	ldsha	[%i1+%o5]0x80,%l3	! %l3 = ffffffffffffffed
!	Mem[0000000010181410] = 775600ff, %l6 = 00000000000000ff
	lduha	[%i6+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081400] = 000000e4, %l2 = ffffffffffffffff
	ldsba	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101400] = 0c78868800000000, %f6  = 13000000 0f7b0003
	ldda	[%i4+%g0]0x88,%f6 	! %f6  = 0c788688 00000000
!	Mem[0000000030001408] = ffa368c0ff800000, %f20 = 939dc098 ffffffff
	ldda	[%i0+%o4]0x81,%f20	! %f20 = ffa368c0 ff800000
!	Mem[0000000030001408] = ffa368c0, %l3 = ffffffffffffffed
	lduba	[%i0+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101400] = 00000000, %l4 = 0000000003b57b0f
	lduba	[%i4+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081408] = ffba96ff, %l5 = fffffffffffffaff
	ldsba	[%i2+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	%l3 = 00000000000000ff, Mem[0000000010041408] = d7411a2b
	stwa	%l3,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff
!	Mem[0000000010101400] = 00000000, %l5 = ffffffffffffffff
	ldsha	[%i4+%g0]0x88,%l5	! %l5 = 0000000000000000

p0_label_137:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000c0000000, Mem[0000000030001400] = edffffff
	stha	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000ffff
!	%l6 = 00000000000000ff, Mem[00000000100c1400] = 2b1896ff
	stw	%l6,[%i3+%g0]		! Mem[00000000100c1400] = 000000ff
!	%l2 = 0000000000000000, Mem[0000000010041430] = 00000000, %asi = 80
	stwa	%l2,[%i1+0x030]%asi	! Mem[0000000010041430] = 00000000
!	Mem[00000000211c0000] = 000063a8, %l7 = 00000000c0000000
	ldstub	[%o2+%g0],%l7		! %l7 = 0000000000000000
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000010141400] = ff003254 c0000000
	std	%l6,[%i5+%g0]		! Mem[0000000010141400] = 000000ff 00000000
!	Mem[0000000030001400] = 0000ffff, %l0 = 00000000000000ca
	ldstuba	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181400] = 00009398, %l4 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l4	! %l4 = 0000000000009398
!	Mem[0000000010101408] = ffffffff, %l5 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010101418] = 000000c0, %l7 = 0000000000000000
	ldstub	[%i4+0x018],%l7		! %l7 = 0000000000000000
!	%f11 = f86100ff, %f9  = ffffffff, %f20 = ffa368c0 ff800000
	fsmuld	%f11,%f9 ,%f20		! %f20 = ffffffff e0000000

p0_label_138:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ff000000, %l0 = 0000000000000000
	lduha	[%i5+%o5]0x81,%l0	! %l0 = 000000000000ff00
!	Mem[0000000030141410] = ff000000a6ba96ff, %f14 = ff560003 00000000
	ldda	[%i5+%o5]0x81,%f14	! %f14 = ff000000 a6ba96ff
!	Mem[0000000010041420] = 32379800 6dbbb811, %l6 = 000000ff, %l7 = 00000000, %asi = 80
	ldda	[%i1+0x020]%asi,%l6	! %l6 = 0000000032379800 000000006dbbb811
!	Mem[0000000010041410] = 0000edff, %l1 = 0000006998c09d93
	lduwa	[%i1+%o5]0x88,%l1	! %l1 = 000000000000edff
!	Mem[0000000010141400] = 000000ff, %l1 = 000000000000edff
	lduba	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = 03007b0f, %l0 = 000000000000ff00
	lduwa	[%i0+%g0]0x80,%l0	! %l0 = 0000000003007b0f
!	Mem[0000000010001400] = 03007b0f, %l1 = 0000000000000000
	lduba	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000003
!	Mem[00000000218001c0] = 45535528, %l2 = 0000000000000000
	ldub	[%o3+0x1c0],%l2		! %l2 = 0000000000000045
!	%l7 = 000000006dbbb811, %l6 = 0000000032379800, %l6 = 0000000032379800
	add	%l7,%l6,%l6		! %l6 = 000000009ff35011
!	Mem[0000000010041424] = 6dbbb811, %f16 = ff003237
	ld	[%i1+0x024],%f16	! %f16 = 6dbbb811

p0_label_139:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 00000000, %l3 = 00000000000000ff
	swapa	[%i4+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l0 = 0000000003007b0f
	ldstuba	[%i0+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000021800181] = f50384f8, %l3 = 0000000000000000
	ldstub	[%o3+0x181],%l3		! %l3 = 0000000000000003
!	Mem[0000000010041408] = ff000000, %l6 = 000000009ff35011, %asi = 80
	swapa	[%i1+0x008]%asi,%l6	! %l6 = 00000000ff000000
!	%l0 = 0000000000000000, Mem[0000000010141410] = ca1f1eff775600ff
	stxa	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000000000
!	%l5 = 00000000ffffffff, Mem[0000000010101403] = 00000000
	stb	%l5,[%i4+0x003]		! Mem[0000000010101400] = 000000ff
!	Mem[000000001010143c] = 56c19003, %l6 = 00000000ff000000
	swap	[%i4+0x03c],%l6		! %l6 = 0000000056c19003
!	%f26 = 00000000 00000000, %l3 = 0000000000000003
!	Mem[0000000010081430] = a6baffbc3701bb5d
	add	%i2,0x030,%g1
	stda	%f26,[%g1+%l3]ASI_PST16_P ! Mem[0000000010081430] = a6baffbc00000000
!	%l3 = 0000000000000003, Mem[00000000300c1410] = ffffffff98c09d93
	stxa	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000000000000003
!	%l1 = 0000000000000003, Mem[0000000030081408] = ff1f1eff03b57b0f
	stxa	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000000000003

p0_label_140:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101402] = 000000ff, %l6 = 0000000056c19003
	lduh	[%i4+0x002],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010081408] = ff96baff, %l5 = 00000000ffffffff
	lduwa	[%i2+%o4]0x88,%l5	! %l5 = 00000000ff96baff
!	Mem[0000000030041400] = ff1e1fca, %l6 = 00000000000000ff
	ldsha	[%i1+%g0]0x89,%l6	! %l6 = 0000000000001fca
!	Mem[00000000201c0000] = d7ff8718, %l1 = 0000000000000003
	ldsb	[%o0+%g0],%l1		! %l1 = ffffffffffffffd7
!	Mem[0000000030181400] = 18e46ce000000000, %f10 = d7411a2b f86100ff
	ldda	[%i6+%g0]0x89,%f10	! %f10 = 18e46ce0 00000000
!	Mem[00000000100c1410] = fffad754 c0000000, %l4 = 00009398, %l5 = ff96baff
	ldda	[%i3+%o5]0x80,%l4	! %l4 = 00000000fffad754 00000000c0000000
!	Mem[0000000030141410] = 000000ff, %l6 = 0000000000001fca
	lduwa	[%i5+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041410] = 2b1841d7, %l4 = 00000000fffad754
	ldswa	[%i1+%o5]0x81,%l4	! %l4 = 000000002b1841d7
!	Mem[0000000010001410] = 000000ff, %l6 = 00000000000000ff
	ldsha	[%i0+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	%l3 = 0000000000000003, %l5 = 00000000c0000000, %l1 = ffffffffffffffd7
	add	%l3,%l5,%l1		! %l1 = 00000000c0000003

p0_label_141:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 0000edff, %l7 = 000000006dbbb811
	ldstuba	[%i1+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081400] = 000000e4, %l6 = 00000000000000ff
	swapa	[%i2+%g0]0x80,%l6	! %l6 = 00000000000000e4
!	%f30 = ca1f1e1a ff96baa6, Mem[0000000010101408] = 000000ff 000000ff
	stda	%f30,[%i4+%o4]0x80	! Mem[0000000010101408] = ca1f1e1a ff96baa6
!	%f26 = 00000000, Mem[0000000010081400] = 000000ff
	sta	%f26,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	Mem[00000000100c1400] = 000000ff, %l4 = 000000002b1841d7
	swapa	[%i3+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[00000000211c0001] = ff0063a8, %l7 = 00000000000000ff
	ldstuba	[%o2+0x001]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l4 = 00000000000000ff
	ldstub	[%i5+%o5],%l4		! %l4 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010041415] = 00000000, %asi = 80
	stba	%l7,[%i1+0x015]%asi	! Mem[0000000010041414] = 00000000
!	%l2 = 00000045, %l3 = 00000003, Mem[0000000010081430] = a6baffbc 00000000
	std	%l2,[%i2+0x030]		! Mem[0000000010081430] = 00000045 00000003
!	Mem[0000000030101410] = 00000069, %l0 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l0	! %l0 = 0000000000000000

p0_label_142:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 6f4f0069, %l4 = 0000000000000000
	lduwa	[%i5+%o4]0x81,%l4	! %l4 = 000000006f4f0069
!	%l2 = 0000000000000045, immd = fffff2ee, %y  = a6ba96ff
	udiv	%l2,-0xd12,%l2		! %l2 = 00000000a6ba9f82
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000030041400] = ff1e1fca, %l5 = 00000000c0000000
	ldsha	[%i1+%g0]0x89,%l5	! %l5 = 0000000000001fca
	membar	#Sync			! Added by membar checker (31)
!	Mem[00000000100c1400] = 2b1841d7 000000ff 03000000 f86100ff
!	Mem[00000000100c1410] = fffad754 c0000000 7fffffff 69000000
!	Mem[00000000100c1420] = 61138740 00896251 a8000000 77560000
!	Mem[00000000100c1430] = 675aa9c6 ff8c61f8 000000ff c0000000
	ldda	[%i3+%g0]ASI_BLK_PL,%f0 	! Block Load from 00000000100c1400
!	Mem[0000000030081410] = 000000c0, %l0 = 0000000000000000
	ldswa	[%i2+%o5]0x81,%l0	! %l0 = 00000000000000c0
!	Mem[0000000010101408] = a6ba96ff1a1e1fca, %l0 = 00000000000000c0
	ldxa	[%i4+%o4]0x88,%l0	! %l0 = a6ba96ff1a1e1fca
!	Mem[0000000010001410] = 000000ff, %l1 = 00000000c0000003
	lduba	[%i0+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1408] = 373200ff, %l1 = 00000000000000ff
	lduba	[%i3+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181410] = 775600ff, %l7 = 0000000000000000
	lduba	[%i6+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041400] = ca1f1eff, %l2 = 00000000a6ba9f82
	ldswa	[%i1+%g0]0x81,%l2	! %l2 = ffffffffca1f1eff

p0_label_143:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081420] = 373200ff, %l4 = 000000006f4f0069
	swap	[%i2+0x020],%l4		! %l4 = 00000000373200ff
!	%f26 = 00000000 00000000, %l5 = 0000000000001fca
!	Mem[0000000010001408] = ff000000ff780000
	add	%i0,0x008,%g1
	stda	%f26,[%g1+%l5]ASI_PST32_P ! Mem[0000000010001408] = 00000000ff780000
!	%f5  = 54d7faff, Mem[000000001018142c] = 7f1a6710
	st	%f5 ,[%i6+0x02c]	! Mem[000000001018142c] = 54d7faff
!	%l6 = 00000000000000e4, Mem[0000000010101410] = ffff0000
	stba	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = e4ff0000
!	Mem[00000000100c142c] = 77560000, %l6 = 00000000000000e4, %asi = 80
	swapa	[%i3+0x02c]%asi,%l6	! %l6 = 0000000077560000
!	Mem[0000000010001410] = 000000ff, %l5 = 0000000000001fca
	swapa	[%i0+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081408] = ffba96ff, %l5 = 00000000000000ff
	ldstuba	[%i2+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%l4 = 373200ff, %l5 = 000000ff, Mem[0000000010181400] = ff1f1e1a ff96baa6, %asi = 80
	stda	%l4,[%i6+0x000]%asi	! Mem[0000000010181400] = 373200ff 000000ff
!	%l1 = 00000000000000ff, Mem[0000000010141410] = 000000ff
	stha	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff
!	%l4 = 00000000373200ff, Mem[0000000010081408] = ffba96ff714f03af
	stx	%l4,[%i2+%o4]		! Mem[0000000010081408] = 00000000373200ff

p0_label_144:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ff003237, %l5 = 00000000000000ff
	ldsba	[%i3+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030001410] = 00000000, %l3 = 0000000000000003
	ldswa	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041408] = 0c8e9a37, %f23 = 000000ff
	lda	[%i1+%o4]0x89,%f23	! %f23 = 0c8e9a37
!	%l2 = ffffffffca1f1eff, imm = 0000000000000187, %l4 = 00000000373200ff
	xnor	%l2,0x187,%l4		! %l4 = 0000000035e0e087
!	Mem[0000000010001400] = 0f7b0003, %l1 = 00000000000000ff
	ldsba	[%i0+%g0]0x88,%l1	! %l1 = 0000000000000003
!	Mem[0000000030081408] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i2+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001410] = ca1f0000, %l2 = ffffffffca1f1eff
	ldswa	[%i0+%o5]0x80,%l2	! %l2 = ffffffffca1f0000
!	Mem[0000000030041408] = 5864428a0c8e9a37, %f22 = ff800000 0c8e9a37
	ldda	[%i1+%o4]0x89,%f22	! %f22 = 5864428a 0c8e9a37
!	Mem[0000000010101408] = ca1f1e1aff96baa6, %l1 = 0000000000000003
	ldx	[%i4+%o4],%l1		! %l1 = ca1f1e1aff96baa6
!	Mem[0000000010181400] = ff000000ff003237, %l4 = 0000000035e0e087
	ldxa	[%i6+%g0]0x88,%l4	! %l4 = ff000000ff003237

p0_label_145:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081409] = 00000000, %l2 = ffffffffca1f0000
	ldstuba	[%i2+0x009]%asi,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[00000000211c0001] = ffff63a8
	stb	%l2,[%o2+0x001]		! Mem[00000000211c0000] = ff0063a8
!	%l0 = a6ba96ff1a1e1fca, Mem[0000000030001410] = cd3dd62300000000
	stxa	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = a6ba96ff1a1e1fca
!	Mem[0000000010081431] = 00000045, %l6 = 0000000077560000
	ldstub	[%i2+0x031],%l6		! %l6 = 0000000000000000
!	%l5 = ffffffffffffffff, Mem[00000000201c0000] = d7ff8718, %asi = 80
	stba	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = ffff8718
!	%l1 = ca1f1e1aff96baa6, Mem[0000000030001408] = ffa368c0
	stwa	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = ff96baa6
!	Mem[00000000100c1410] = fffad754, %l0 = 000000001a1e1fca
	swapa	[%i3+%o5]0x80,%l0	! %l0 = 00000000fffad754
!	Mem[0000000010041410] = 0000edff, %l4 = ff000000ff003237
	ldstuba	[%i1+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%f21 = e0000000, Mem[0000000010081410] = 000000d7
	sta	%f21,[%i2+%o5]0x88	! Mem[0000000010081410] = e0000000
!	Mem[00000000100c1400] = 2b1841d7, %l3 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 000000002b1841d7

p0_label_146:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 05d251cf 030056ff, %l4 = 000000ff, %l5 = ffffffff
	ldda	[%i5+%g0]0x89,%l4	! %l4 = 00000000030056ff 0000000005d251cf
!	Mem[0000000030181400] = 18e46ce000000000, %f2  = ff0061f8 00000003
	ldda	[%i6+%g0]0x89,%f2 	! %f2  = 18e46ce0 00000000
!	Mem[0000000010101430] = 4a24993e, %l6 = 0000000000000000
	lduw	[%i4+0x030],%l6		! %l6 = 000000004a24993e
!	Mem[0000000030041410] = 2b1841d7, %l4 = 00000000030056ff
	ldswa	[%i1+%o5]0x81,%l4	! %l4 = 000000002b1841d7
!	Mem[0000000030141400] = ff560003, %f26 = 00000000
	lda	[%i5+%g0]0x81,%f26	! %f26 = ff560003
!	Mem[0000000010101408] = 1a1e1fca, %l0 = 00000000fffad754
	lduwa	[%i4+%o4]0x88,%l0	! %l0 = 000000001a1e1fca
!	Mem[0000000030141400] = ff560003, %l4 = 000000002b1841d7
	lduha	[%i5+%g0]0x81,%l4	! %l4 = 000000000000ff56
!	Mem[0000000030141410] = ff000000, %l4 = 000000000000ff56
	lduba	[%i5+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041400] = ca1f1eff, %f0  = ff000000
	lda	[%i1+%g0]0x81,%f0 	! %f0 = ca1f1eff
!	Mem[0000000010141400] = 000000ff, %l1 = ca1f1e1aff96baa6
	ldsha	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000

p0_label_147:
!	Starting 10 instruction Store Burst
!	%l0 = 000000001a1e1fca, Mem[0000000010101438] = 5ad3829a
	stw	%l0,[%i4+0x038]		! Mem[0000000010101438] = 1a1e1fca
	membar	#Sync			! Added by membar checker (32)
!	%f28 = 000000ff 000000ff, Mem[00000000100c1408] = 03000000 f86100ff
	stda	%f28,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ff 000000ff
!	%f10 = 00005677 000000a8, Mem[00000000100c1410] = ca1f1e1a 000000c0
	stda	%f10,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00005677 000000a8
!	%l5 = 0000000005d251cf, Mem[0000000010141400] = ff000000
	stwa	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 05d251cf
!	%l5 = 0000000005d251cf, Mem[00000000100c1408] = ff000000
	stwa	%l5,[%i3+%o4]0x88	! Mem[00000000100c1408] = 05d251cf
!	%l6 = 000000004a24993e, Mem[0000000010101410] = e4ff0000
	stwa	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 4a24993e
!	%f28 = 000000ff, Mem[0000000010041408] = 1150f39f
	sta	%f28,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff
!	%l6 = 000000004a24993e, Mem[0000000010001408] = 00000000ff780000
	stxa	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000004a24993e
!	%f14 = 000000c0 ff000000, Mem[0000000010141400] = cf51d205 00000000
	stda	%f14,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000c0 ff000000
!	%l7 = 0000000000000000, Mem[0000000010001420] = 6e032e743728eae1, %asi = 80
	stxa	%l7,[%i0+0x020]%asi	! Mem[0000000010001420] = 0000000000000000

p0_label_148:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ff003237, %l3 = 000000002b1841d7
	lduwa	[%i3+%o4]0x81,%l3	! %l3 = 00000000ff003237
!	Mem[00000000211c0000] = ff0063a8, %l4 = 00000000000000ff, %asi = 80
	ldsba	[%o2+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[000000001008143c] = efbb8000, %l3 = 00000000ff003237
	lduh	[%i2+0x03c],%l3		! %l3 = 000000000000efbb
!	Mem[0000000030141410] = 000000ff, %l4 = ffffffffffffffff
	lduha	[%i5+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001410] = ca1f1e1a, %l2 = 0000000000000000
	ldswa	[%i0+%o5]0x81,%l2	! %l2 = ffffffffca1f1e1a
!	Mem[0000000010081410] = 000000e0, %f8  = 51628900
	lda	[%i2+%o5]0x80,%f8 	! %f8 = 000000e0
!	%f15 = ff000000, %f8  = 000000e0, %f6  = 00000069
	fdivs	%f15,%f8 ,%f6 		! %f6  = ff800000
!	%l4 = 00000000000000ff, %l1 = 0000000000000000, %l5 = 0000000005d251cf
	add	%l4,%l1,%l5		! %l5 = 00000000000000ff
!	Mem[00000000211c0000] = ff0063a8, %l1 = 0000000000000000, %asi = 80
	lduha	[%o2+0x000]%asi,%l1	! %l1 = 000000000000ff00
!	Mem[00000000100c1436] = ff8c61f8, %l6 = 000000004a24993e, %asi = 80
	lduha	[%i3+0x036]%asi,%l6	! %l6 = 00000000000061f8

p0_label_149:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = ca1f1e1a, %l1 = 000000000000ff00
	swapa	[%i0+%o5]0x81,%l1	! %l1 = 00000000ca1f1e1a
!	Mem[00000000100c141b] = 7fffffff, %l3 = 000000000000efbb
	ldstuba	[%i3+0x01b]%asi,%l3	! %l3 = 00000000000000ff
!	%f30 = ca1f1e1a ff96baa6, %l7 = 0000000000000000
!	Mem[0000000010081408] = 00ff0000373200ff
	add	%i2,0x008,%g1
	stda	%f30,[%g1+%l7]ASI_PST8_P ! Mem[0000000010081408] = 00ff0000373200ff
!	%f6  = ff800000 ffffff7f, Mem[0000000010101418] = ff0000c0 54d7faff, %asi = 80
	stda	%f6 ,[%i4+0x018]%asi	! Mem[0000000010101418] = ff800000 ffffff7f
!	%f28 = 000000ff, Mem[0000000010101400] = ff000000
	sta	%f28,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff
!	%l6 = 00000000000061f8, Mem[0000000030081410] = 000000c0
	stwa	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 000061f8
!	Mem[0000000030141408] = 6f4f0069, %l7 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l7	! %l7 = 000000000000006f
!	%f14 = 000000c0, Mem[0000000010181400] = ff003237
	sta	%f14,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000c0
!	%f23 = 0c8e9a37, Mem[0000000010041410] = ffed0000
	sta	%f23,[%i1+%o5]0x80	! Mem[0000000010041410] = 0c8e9a37
!	%l5 = 00000000000000ff, Mem[00000000100c1410] = a8000000, %asi = 80
	stba	%l5,[%i3+0x010]%asi	! Mem[00000000100c1410] = ff000000

p0_label_150:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 2b1841d7, %l3 = 00000000000000ff
	ldsha	[%i1+%o5]0x81,%l3	! %l3 = 0000000000002b18
!	Mem[0000000030041408] = 379a8e0c, %l3 = 0000000000002b18
	lduba	[%i1+%o4]0x81,%l3	! %l3 = 0000000000000037
!	Mem[00000000100c1400] = 00000000, %l4 = 00000000000000ff
	lduwa	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %f14 = 000000c0
	lda	[%i6+%g0]0x89,%f14	! %f14 = 00000000
!	Mem[0000000010101432] = 4a24993e, %l0 = 000000001a1e1fca, %asi = 80
	ldsha	[%i4+0x032]%asi,%l0	! %l0 = ffffffffffff993e
!	Mem[0000000030001408] = a6ba96ff, %f14 = 00000000
	lda	[%i0+%o4]0x89,%f14	! %f14 = a6ba96ff
!	Mem[00000000100c1430] = 675aa9c6 ff8c61f8, %l4 = 00000000, %l5 = 000000ff
	ldd	[%i3+0x030],%l4		! %l4 = 00000000675aa9c6 00000000ff8c61f8
!	Mem[0000000030001410] = 0000ff00, %l4 = 00000000675aa9c6
	lduba	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1400] = 00000000 000000ff, %l2 = ca1f1e1a, %l3 = 00000037
	ldd	[%i3+%g0],%l2		! %l2 = 0000000000000000 00000000000000ff
!	Mem[0000000010041400] = ff000000, %l0 = ffffffffffff993e
	ldswa	[%i1+%g0]0x80,%l0	! %l0 = ffffffffff000000

!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be ffffffffff000000
	bne	%xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 00000000ca1f1e1a
	bne	%xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000000
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
	cmp	%l5,%g2			! %l5 should be 00000000ff8c61f8
	bne	%xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 00000000000061f8
	bne	%xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 000000000000006f
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
	cmp	%l0,%l1			! %f0  should be ca1f1eff d741182b
	bne	%xcc,p0_freg_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 18e46ce0 00000000
	bne	%xcc,p0_freg_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 000000c0 54d7faff
	bne	%xcc,p0_freg_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be ff800000 ffffff7f
	bne	%xcc,p0_freg_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 000000e0 40871361
	bne	%xcc,p0_freg_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00005677 000000a8
	bne	%xcc,p0_freg_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be f8618cff c6a95a67
	bne	%xcc,p0_freg_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be a6ba96ff ff000000
	bne	%xcc,p0_freg_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 6dbbb811 00000000
	bne	%xcc,p0_freg_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be ca1f1eff 03b57b0f
	bne	%xcc,p0_freg_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be ffffffff e0000000
	bne	%xcc,p0_freg_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 5864428a 0c8e9a37
	bne	%xcc,p0_freg_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 000000ff 00000000
	bne	%xcc,p0_freg_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be ff560003 00000000
	bne	%xcc,p0_freg_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 000000ff 000000ff
	bne	%xcc,p0_freg_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be ca1f1e1a ff96baa6
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
	ldx	[%g1+0x000],%l0		! %l0 = 53339e05e121a9c6
	ldx	[%g1+0x008],%l1		! %l1 = abbe1d8ff809abf1
	ldx	[%g1+0x010],%l2		! %l2 = 4fdee1f67c3db22c
	ldx	[%g1+0x018],%l3		! %l3 = dcc95f10df5bbf77
	ldx	[%g1+0x020],%l4		! %l4 = 05452b32bb1e66d2
	ldx	[%g1+0x028],%l5		! %l5 = 4a0347aafdf7cb3d
	ldx	[%g1+0x030],%l6		! %l6 = e1fa520bd0bc9fb8
	ldx	[%g1+0x038],%l7		! %l7 = 8cdb7d1f285f2743

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
	umul	%l3,%l4,%l5
	jmpl	%o7,%g0
	umul	%l3,%l7,%l2
p0_near_0_he:
	std	%f30,[%i6+0x030]	! Mem[0000000010181430]
	fmuls	%f19,%f31,%f29
	addc	%l7,0x464,%l6
	fstod	%f17,%f22
	xnor	%l1,-0x5c3,%l0
	jmpl	%o7,%g0
	fsubs	%f18,%f27,%f21
p0_near_0_lo:
	umul	%l3,%l4,%l5
	jmpl	%o7,%g0
	umul	%l3,%l7,%l2
p0_near_0_ho:
	std	%f30,[%o6+0x030]	! Mem[0000000010181430]
	fmuls	%f19,%f31,%f29
	addc	%l7,0x464,%l6
	fstod	%f17,%f22
	xnor	%l1,-0x5c3,%l0
	jmpl	%o7,%g0
	fsubs	%f18,%f27,%f21
near0_b2b_h:
	sdivx	%l7,%l1,%l4
	fmuls	%f20,%f24,%f27
	fstoi	%f29,%f26
	subc	%l3,0x569,%l2
	fdivs	%f17,%f21,%f28
	fitod	%f24,%f26
	or	%l6,%l7,%l5
	jmpl	%o7,%g0
	xor	%l0,%l6,%l3
near0_b2b_l:
	fdivs	%f4 ,%f9 ,%f15
	or	%l5,0x3bc,%l6
	sdivx	%l3,0x2f7,%l1
	mulx	%l0,-0x361,%l0
	or	%l0,%l5,%l2
	orn	%l0,%l6,%l5
	add	%l6,-0xced,%l0
	jmpl	%o7,%g0
	add	%l2,%l4,%l1
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
	jmpl	%o7,%g0
	addc	%l2,%l0,%l7
	jmpl	%o7,%g0
	nop
p0_near_1_he:
	fdivs	%f25,%f31,%f20
	fcmps	%fcc0,%f18,%f26
	jmpl	%o7,%g0
	ldstub	[%i3+0x01a],%l2		! Mem[00000000100c141a]
p0_near_1_lo:
	jmpl	%o7,%g0
	addc	%l2,%l0,%l7
	jmpl	%o7,%g0
	nop
p0_near_1_ho:
	fdivs	%f25,%f31,%f20
	fcmps	%fcc0,%f18,%f26
	jmpl	%o7,%g0
	ldstub	[%o3+0x01a],%l2		! Mem[00000000100c141a]
near1_b2b_h:
	umul	%l7,0x9bd,%l5
	add	%l2,%l3,%l1
	andn	%l1,0x196,%l5
	mulx	%l2,0x97a,%l4
	smul	%l3,%l7,%l4
	add	%l2,0xb3e,%l6
	fstoi	%f20,%f28
	jmpl	%o7,%g0
	fdivs	%f23,%f27,%f25
near1_b2b_l:
	sub	%l3,0x05b,%l2
	udivx	%l1,%l6,%l6
	fmuls	%f5 ,%f1 ,%f11
	sdivx	%l5,%l4,%l0
	add	%l3,%l3,%l5
	subc	%l0,0x3c8,%l6
	fcmps	%fcc3,%f2 ,%f6 
	jmpl	%o7,%g0
	subc	%l4,%l2,%l7
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
	ldub	[%o0+0x001],%l2		! Mem[00000000201c0001]
	mulx	%l2,-0x0bc,%l0
	andn	%l3,-0xe0d,%l5
	orn	%l1,0x9f2,%l1
	andn	%l2,0xe0c,%l7
	fmuls	%f6 ,%f13,%f9 
	orn	%l2,-0x985,%l6
	jmpl	%o7,%g0
	mulx	%l5,0x408,%l1
p0_near_2_he:
	fsubs	%f18,%f26,%f17
	fdivs	%f18,%f30,%f23
	sdivx	%l3,0x7aa,%l2
	add	%l2,%l0,%l4
	and	%l6,%l0,%l6
	jmpl	%o7,%g0
	orn	%l3,0x6c0,%l3
p0_near_2_lo:
	ldub	[%i0+0x001],%l2		! Mem[00000000201c0001]
	mulx	%l2,-0x0bc,%l0
	andn	%l3,-0xe0d,%l5
	orn	%l1,0x9f2,%l1
	andn	%l2,0xe0c,%l7
	fmuls	%f6 ,%f13,%f9 
	orn	%l2,-0x985,%l6
	jmpl	%o7,%g0
	mulx	%l5,0x408,%l1
p0_near_2_ho:
	fsubs	%f18,%f26,%f17
	fdivs	%f18,%f30,%f23
	sdivx	%l3,0x7aa,%l2
	add	%l2,%l0,%l4
	and	%l6,%l0,%l6
	jmpl	%o7,%g0
	orn	%l3,0x6c0,%l3
near2_b2b_h:
	mulx	%l5,0x271,%l0
	xnor	%l2,-0x643,%l6
	mulx	%l0,-0xd99,%l0
	fdtos	%f30,%f20
	fdivs	%f31,%f19,%f18
	sdivx	%l2,0xe8a,%l2
	jmpl	%o7,%g0
	fadds	%f26,%f20,%f26
near2_b2b_l:
	fsqrts	%f12,%f5 
	and	%l6,0x757,%l7
	fsqrts	%f13,%f10
	or	%l0,-0x67e,%l1
	mulx	%l4,0x0a8,%l0
	addc	%l2,-0x938,%l6
	jmpl	%o7,%g0
	fsqrts	%f10,%f14
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
	sdivx	%l3,%l3,%l6
	addc	%l6,-0xe4d,%l1
	fmuls	%f3 ,%f11,%f15
	jmpl	%o7,%g0
	fsubs	%f12,%f9 ,%f14
p0_near_3_he:
	umul	%l4,%l6,%l6
	addc	%l4,-0x558,%l2
	jmpl	%o7,%g0
	sdivx	%l0,%l7,%l5
p0_near_3_lo:
	sdivx	%l3,%l3,%l6
	addc	%l6,-0xe4d,%l1
	fmuls	%f3 ,%f11,%f15
	jmpl	%o7,%g0
	fsubs	%f12,%f9 ,%f14
p0_near_3_ho:
	umul	%l4,%l6,%l6
	addc	%l4,-0x558,%l2
	jmpl	%o7,%g0
	sdivx	%l0,%l7,%l5
near3_b2b_h:
	udivx	%l1,0x4bf,%l4
	fadds	%f20,%f29,%f28
	jmpl	%o7,%g0
	and	%l6,%l0,%l3
near3_b2b_l:
	fcmps	%fcc2,%f13,%f7 
	udivx	%l0,%l0,%l1
	jmpl	%o7,%g0
	xor	%l6,-0x761,%l7
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
	ldub	[%o3+0x041],%l5		! Mem[0000000021800041]
	xnor	%l1,-0x5f1,%l2
	fsubs	%f5 ,%f8 ,%f12
	xor	%l6,%l4,%l0
	addc	%l2,%l6,%l1
	ldd	[%i1+0x010],%l4		! Mem[0000000010041410]
	and	%l1,%l1,%l5
	jmpl	%o7,%g0
	sub	%l5,0x1c5,%l3
p0_far_0_he:
	and	%l2,0xfc1,%l2
	jmpl	%o7,%g0
	orn	%l4,%l0,%l6
p0_far_0_lo:
	ldub	[%i3+0x041],%l5		! Mem[0000000021800041]
	xnor	%l1,-0x5f1,%l2
	fsubs	%f5 ,%f8 ,%f12
	xor	%l6,%l4,%l0
	addc	%l2,%l6,%l1
	ldd	[%o1+0x010],%l4		! Mem[0000000010041410]
	and	%l1,%l1,%l5
	jmpl	%o7,%g0
	sub	%l5,0x1c5,%l3
p0_far_0_ho:
	and	%l2,0xfc1,%l2
	jmpl	%o7,%g0
	orn	%l4,%l0,%l6
far0_b2b_h:
	and	%l7,-0x0b3,%l3
	udivx	%l2,%l1,%l6
	xor	%l7,-0xe90,%l6
	sub	%l4,-0xac0,%l3
	fmuls	%f21,%f19,%f20
	smul	%l3,%l6,%l5
	jmpl	%o7,%g0
	mulx	%l0,-0x3fc,%l7
far0_b2b_l:
	xnor	%l7,0xd87,%l3
	fcmps	%fcc3,%f13,%f11
	and	%l1,%l4,%l0
	smul	%l3,%l1,%l0
	sub	%l7,%l1,%l0
	fcmps	%fcc1,%f7 ,%f9 
	jmpl	%o7,%g0
	fcmps	%fcc0,%f2 ,%f2 
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
	udivx	%l1,0x818,%l1
	sdivx	%l7,%l5,%l1
	jmpl	%o7,%g0
	umul	%l7,-0xb3b,%l2
p0_far_1_he:
	xnor	%l4,%l4,%l4
	fmuls	%f23,%f29,%f30
	fadds	%f22,%f27,%f24
	jmpl	%o7,%g0
	fsubs	%f19,%f30,%f29
p0_far_1_lo:
	udivx	%l1,0x818,%l1
	sdivx	%l7,%l5,%l1
	jmpl	%o7,%g0
	umul	%l7,-0xb3b,%l2
p0_far_1_ho:
	xnor	%l4,%l4,%l4
	fmuls	%f23,%f29,%f30
	fadds	%f22,%f27,%f24
	jmpl	%o7,%g0
	fsubs	%f19,%f30,%f29
far1_b2b_h:
	fdivs	%f31,%f29,%f22
	jmpl	%o7,%g0
	umul	%l3,0xef4,%l4
far1_b2b_l:
	umul	%l6,-0x6f0,%l0
	jmpl	%o7,%g0
	fmuls	%f2 ,%f4 ,%f15
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
	and	%l2,-0x61c,%l5
	jmpl	%o7,%g0
	fadds	%f5 ,%f11,%f11
p0_far_2_he:
	fsubs	%f18,%f30,%f22
	nop
	fadds	%f16,%f20,%f28
	jmpl	%o7,%g0
	smul	%l1,-0x146,%l3
p0_far_2_lo:
	and	%l2,-0x61c,%l5
	jmpl	%o7,%g0
	fadds	%f5 ,%f11,%f11
p0_far_2_ho:
	fsubs	%f18,%f30,%f22
	nop
	fadds	%f16,%f20,%f28
	jmpl	%o7,%g0
	smul	%l1,-0x146,%l3
far2_b2b_h:
	orn	%l1,%l7,%l1
	fadds	%f31,%f23,%f30
	addc	%l5,-0x74f,%l7
	fitod	%f21,%f16
	add	%l1,-0x706,%l2
	jmpl	%o7,%g0
	andn	%l7,-0x060,%l1
far2_b2b_l:
	xnor	%l4,%l5,%l6
	orn	%l5,-0x524,%l6
	xnor	%l2,%l5,%l6
	fsqrts	%f3 ,%f13
	add	%l0,0x96b,%l1
	jmpl	%o7,%g0
	xnor	%l1,-0x8d9,%l4
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
	addc	%l2,%l0,%l2
	or	%l1,-0x2cb,%l7
	fsqrts	%f9 ,%f11
	jmpl	%o7,%g0
	and	%l4,-0x50b,%l5
p0_far_3_he:
	xor	%l3,%l0,%l7
	sub	%l1,%l5,%l4
	xor	%l6,0xd85,%l6
	jmpl	%o7,%g0
	subc	%l2,-0x7d7,%l5
p0_far_3_lo:
	addc	%l2,%l0,%l2
	or	%l1,-0x2cb,%l7
	fsqrts	%f9 ,%f11
	jmpl	%o7,%g0
	and	%l4,-0x50b,%l5
p0_far_3_ho:
	xor	%l3,%l0,%l7
	sub	%l1,%l5,%l4
	xor	%l6,0xd85,%l6
	jmpl	%o7,%g0
	subc	%l2,-0x7d7,%l5
far3_b2b_h:
	fsubs	%f26,%f18,%f20
	jmpl	%o7,%g0
	andn	%l1,-0x3c0,%l6
far3_b2b_l:
	sdivx	%l1,0x583,%l4
	jmpl	%o7,%g0
	xor	%l7,%l5,%l2
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	.skip	16
p0_jmpl_0_le:
	or	%l7,%l3,%l0
	jmpl	%g6+8,%g0
	ld	[%i6+0x010],%f10	! Mem[0000000010181410]
p0_call_0_le:
	fdivs	%f4 ,%f15,%f7 
	fmuls	%f3 ,%f1 ,%f0 
	fsubs	%f6 ,%f14,%f3 
	ldsh	[%i3+0x00c],%l4		! Mem[00000000100c140c]
	smul	%l3,%l0,%l5
	fdivs	%f12,%f12,%f3 
	add	%l3,%l7,%l1
	retl
	stw	%l1,[%i1+0x01c]		! Mem[000000001004141c]
p0_jmpl_0_lo:
	or	%l7,%l3,%l0
	jmpl	%g6+8,%g0
	ld	[%o6+0x010],%f10	! Mem[0000000010181410]
p0_call_0_lo:
	fdivs	%f4 ,%f15,%f7 
	fmuls	%f3 ,%f1 ,%f0 
	fsubs	%f6 ,%f14,%f3 
	ldsh	[%o3+0x00c],%l4		! Mem[00000000100c140c]
	smul	%l3,%l0,%l5
	fdivs	%f12,%f12,%f3 
	add	%l3,%l7,%l1
	retl
	stw	%l1,[%o1+0x01c]		! Mem[000000001004141c]
p0_jmpl_0_he:
	fdivs	%f29,%f20,%f24
	fcmps	%fcc1,%f18,%f27
	sdivx	%l6,%l6,%l7
	jmpl	%g6+8,%g0
	fcmps	%fcc2,%f26,%f17
p0_call_0_he:
	fsubs	%f17,%f28,%f26
	umul	%l3,0x66d,%l1
	retl
	fmuls	%f17,%f30,%f25
p0_jmpl_0_ho:
	fdivs	%f29,%f20,%f24
	fcmps	%fcc1,%f18,%f27
	sdivx	%l6,%l6,%l7
	jmpl	%g6+8,%g0
	fcmps	%fcc2,%f26,%f17
p0_call_0_ho:
	fsubs	%f17,%f28,%f26
	umul	%l3,0x66d,%l1
	retl
	fmuls	%f17,%f30,%f25
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	.skip	32
p0_jmpl_1_le:
	xor	%l5,-0x4be,%l2
	fmuls	%f2 ,%f1 ,%f2 
	fsqrts	%f8 ,%f15
	addc	%l5,%l6,%l2
	smul	%l0,-0x9b5,%l7
	fdtos	%f8 ,%f0 
	smul	%l5,-0x2f7,%l5
	jmpl	%g6+8,%g0
	sub	%l7,0xd1a,%l4
p0_call_1_le:
	fsubs	%f14,%f12,%f10
	add	%l6,0xc9b,%l4
	sdivx	%l4,0xa26,%l4
	add	%l5,-0xc89,%l2
	fsqrts	%f6 ,%f2 
	mulx	%l2,-0xee7,%l0
	mulx	%l7,0x03f,%l7
	retl
	xnor	%l5,%l7,%l3
p0_jmpl_1_lo:
	xor	%l5,-0x4be,%l2
	fmuls	%f2 ,%f1 ,%f2 
	fsqrts	%f8 ,%f15
	addc	%l5,%l6,%l2
	smul	%l0,-0x9b5,%l7
	fdtos	%f8 ,%f0 
	smul	%l5,-0x2f7,%l5
	jmpl	%g6+8,%g0
	sub	%l7,0xd1a,%l4
p0_call_1_lo:
	fsubs	%f14,%f12,%f10
	add	%l6,0xc9b,%l4
	sdivx	%l4,0xa26,%l4
	add	%l5,-0xc89,%l2
	fsqrts	%f6 ,%f2 
	mulx	%l2,-0xee7,%l0
	mulx	%l7,0x03f,%l7
	retl
	xnor	%l5,%l7,%l3
p0_jmpl_1_he:
	mulx	%l0,0xc5a,%l3
	lduh	[%o3+0x140],%l2		! Mem[0000000021800140]
	ldsh	[%o3+0x080],%l2		! Mem[0000000021800080]
	xor	%l4,%l4,%l7
	andn	%l6,%l7,%l4
	jmpl	%g6+8,%g0
	xnor	%l5,0x04a,%l7
p0_call_1_he:
	orn	%l1,%l6,%l7
	andn	%l3,%l2,%l2
	xor	%l1,-0x407,%l1
	xor	%l2,%l2,%l4
	retl
	fsubs	%f24,%f28,%f27
p0_jmpl_1_ho:
	mulx	%l0,0xc5a,%l3
	lduh	[%i3+0x140],%l2		! Mem[0000000021800140]
	ldsh	[%i3+0x080],%l2		! Mem[0000000021800080]
	xor	%l4,%l4,%l7
	andn	%l6,%l7,%l4
	jmpl	%g6+8,%g0
	xnor	%l5,0x04a,%l7
p0_call_1_ho:
	orn	%l1,%l6,%l7
	andn	%l3,%l2,%l2
	xor	%l1,-0x407,%l1
	xor	%l2,%l2,%l4
	retl
	fsubs	%f24,%f28,%f27
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	.skip	48
p0_jmpl_2_le:
	stw	%l4,[%i4+0x038]		! Mem[0000000010101438]
	fmuls	%f6 ,%f11,%f1 
	and	%l7,0x702,%l3
	jmpl	%g6+8,%g0
	fadds	%f11,%f0 ,%f14
p0_call_2_le:
	andn	%l5,%l1,%l0
	fadds	%f12,%f5 ,%f10
	fsubs	%f0 ,%f6 ,%f12
	xor	%l6,%l4,%l6
	addc	%l6,%l7,%l6
	fsubs	%f0 ,%f0 ,%f12
	retl
	sdivx	%l2,0x833,%l1
p0_jmpl_2_lo:
	stw	%l4,[%o4+0x038]		! Mem[0000000010101438]
	fmuls	%f6 ,%f11,%f1 
	and	%l7,0x702,%l3
	jmpl	%g6+8,%g0
	fadds	%f11,%f0 ,%f14
p0_call_2_lo:
	andn	%l5,%l1,%l0
	fadds	%f12,%f5 ,%f10
	fsubs	%f0 ,%f6 ,%f12
	xor	%l6,%l4,%l6
	addc	%l6,%l7,%l6
	fsubs	%f0 ,%f0 ,%f12
	retl
	sdivx	%l2,0x833,%l1
p0_jmpl_2_he:
	mulx	%l6,0x61b,%l7
	and	%l0,%l7,%l0
	xnor	%l5,-0x781,%l7
	fmuls	%f25,%f26,%f19
	andn	%l0,%l6,%l2
	andn	%l6,%l4,%l2
	jmpl	%g6+8,%g0
	smul	%l2,-0x432,%l2
p0_call_2_he:
	andn	%l3,-0x796,%l4
	and	%l0,0x45e,%l3
	fcmps	%fcc1,%f30,%f30
	retl
	add	%l5,%l5,%l4
p0_jmpl_2_ho:
	mulx	%l6,0x61b,%l7
	and	%l0,%l7,%l0
	xnor	%l5,-0x781,%l7
	fmuls	%f25,%f26,%f19
	andn	%l0,%l6,%l2
	andn	%l6,%l4,%l2
	jmpl	%g6+8,%g0
	smul	%l2,-0x432,%l2
p0_call_2_ho:
	andn	%l3,-0x796,%l4
	and	%l0,0x45e,%l3
	fcmps	%fcc1,%f30,%f30
	retl
	add	%l5,%l5,%l4
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	.skip	64
p0_jmpl_3_le:
	fsubs	%f7 ,%f1 ,%f12
	sub	%l2,%l7,%l5
	sdivx	%l6,%l2,%l2
	and	%l6,%l2,%l4
	jmpl	%g6+8,%g0
	sdivx	%l3,0x7d0,%l7
p0_call_3_le:
	fsubs	%f10,%f10,%f12
	fsubs	%f1 ,%f1 ,%f1 
	sub	%l3,%l3,%l5
	stx	%l1,[%i4+0x038]		! Mem[0000000010101438]
	retl
	fsqrts	%f8 ,%f8 
p0_jmpl_3_lo:
	fsubs	%f7 ,%f1 ,%f12
	sub	%l2,%l7,%l5
	sdivx	%l6,%l2,%l2
	and	%l6,%l2,%l4
	jmpl	%g6+8,%g0
	sdivx	%l3,0x7d0,%l7
p0_call_3_lo:
	fsubs	%f10,%f10,%f12
	fsubs	%f1 ,%f1 ,%f1 
	sub	%l3,%l3,%l5
	stx	%l1,[%o4+0x038]		! Mem[0000000010101438]
	retl
	fsqrts	%f8 ,%f8 
p0_jmpl_3_he:
	udivx	%l4,%l2,%l5
	sdivx	%l4,0xece,%l5
	fdivs	%f20,%f28,%f30
	mulx	%l3,%l0,%l6
	andn	%l7,%l1,%l4
	jmpl	%g6+8,%g0
	fmuls	%f17,%f19,%f20
p0_call_3_he:
	smul	%l2,0xbf9,%l0
	fcmps	%fcc2,%f17,%f20
	subc	%l5,-0x234,%l0
	smul	%l3,%l3,%l7
	sub	%l2,%l4,%l7
	subc	%l5,%l0,%l6
	retl
	xor	%l7,%l1,%l7
p0_jmpl_3_ho:
	udivx	%l4,%l2,%l5
	sdivx	%l4,0xece,%l5
	fdivs	%f20,%f28,%f30
	mulx	%l3,%l0,%l6
	andn	%l7,%l1,%l4
	jmpl	%g6+8,%g0
	fmuls	%f17,%f19,%f20
p0_call_3_ho:
	smul	%l2,0xbf9,%l0
	fcmps	%fcc2,%f17,%f20
	subc	%l5,-0x234,%l0
	smul	%l3,%l3,%l7
	sub	%l2,%l4,%l7
	subc	%l5,%l0,%l6
	retl
	xor	%l7,%l1,%l7
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
	.word	0x53339e05,0xe121a9c6		! Init value for %l0
	.word	0xabbe1d8f,0xf809abf1		! Init value for %l1
	.word	0x4fdee1f6,0x7c3db22c		! Init value for %l2
	.word	0xdcc95f10,0xdf5bbf77		! Init value for %l3
	.word	0x05452b32,0xbb1e66d2		! Init value for %l4
	.word	0x4a0347aa,0xfdf7cb3d		! Init value for %l5
	.word	0xe1fa520b,0xd0bc9fb8		! Init value for %l6
	.word	0x8cdb7d1f,0x285f2743		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x4f9067b8,0x4fc815e9		! Init value for %f0 
	.word	0x1f96f8b6,0x72e4ac2f		! Init value for %f2 
	.word	0x66919224,0x4d3d2325		! Init value for %f4 
	.word	0x414c5b82,0x2e6e544b		! Init value for %f6 
	.word	0x45dad850,0x33f58521		! Init value for %f8 
	.word	0x2f7bc80e,0x7598c727		! Init value for %f10
	.word	0x2ca4063c,0x46fa57dd		! Init value for %f12
	.word	0x36a86a5a,0x4cef00c3		! Init value for %f14
	.word	0x383ea7e8,0x73ef7759		! Init value for %f16
	.word	0x23cd2e66,0x69bcbd1f		! Init value for %f18
	.word	0x64420954,0x470f7f95		! Init value for %f20
	.word	0x3ae8c032,0x46ea783b		! Init value for %f22
	.word	0x12773680,0x6fe7cc91		! Init value for %f24
	.word	0x03498bbe,0x20996e17		! Init value for %f26
	.word	0x2684fb6c,0x32d47a4d		! Init value for %f28
	.word	0x5599bd0a,0x127f9ab3		! Init value for %f30
	.word	0x015be418,0x633c64c9		! Init value for %f32
	.word	0x57ab4016,0x5503ba0f		! Init value for %f34
	.word	0x68623c84,0x428d2805		! Init value for %f36
	.word	0x5203c0e2,0x5519482b		! Init value for %f38
	.word	0x246010b0,0x5ff72001		! Init value for %f40
	.word	0x0b28ab6e,0x22dc8107		! Init value for %f42
	.word	0x642b2c9c,0x54e968bd		! Init value for %f44
	.word	0x14ab2bba,0x72ee60a3		! Init value for %f46
	.word	0x2f131c48,0x7a4dde39
	.word	0x35f42dc6,0x2e90a2ff
	.word	0x730d2bb4,0x72851c75
	.word	0x60d05d92,0x4e81c41b
	.word	0x7aa066e0,0x24227f71
	.word	0x5bbc271e,0x7c98fff7
	.word	0x569199cc,0x0168232d
	.word	0x0defb66a,0x38225293
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
	.word	0xffffffff,0xff000000		! %l0
	.word	0x00000000,0xca1f1e1a		! %l1
	.word	0x00000000,0x00000000		! %l2
	.word	0x00000000,0x000000ff		! %l3
	.word	0x00000000,0x00000000		! %l4
	.word	0x00000000,0xff8c61f8		! %l5
	.word	0x00000000,0x000061f8		! %l6
	.word	0x00000000,0x0000006f		! %l7
p0_expected_fp_regs:
	.word	0xca1f1eff,0xd741182b		! %f0
	.word	0x18e46ce0,0x00000000		! %f2
	.word	0x000000c0,0x54d7faff		! %f4
	.word	0xff800000,0xffffff7f		! %f6
	.word	0x000000e0,0x40871361		! %f8
	.word	0x00005677,0x000000a8		! %f10
	.word	0xf8618cff,0xc6a95a67		! %f12
	.word	0xa6ba96ff,0xff000000		! %f14
	.word	0x6dbbb811,0x00000000		! %f16
	.word	0xca1f1eff,0x03b57b0f		! %f18
	.word	0xffffffff,0xe0000000		! %f20
	.word	0x5864428a,0x0c8e9a37		! %f22
	.word	0x000000ff,0x00000000		! %f24
	.word	0xff560003,0x00000000		! %f26
	.word	0x000000ff,0x000000ff		! %f28
	.word	0xca1f1e1a,0xff96baa6		! %f30
	.word	0x00000008,0x00000729		! %fsr
p0_local0_expect:
	.word	0x03007b0f,0x000000ff,0x00000000,0x4a24993e ! PA = 0000000010001400
	.word	0xca1f0000,0xe986bb58,0xa6ba96ff,0x7f1a1501 ! PA = 0000000010001410
	.word	0x00000000,0x00000000,0x4166fece,0x2ec5eae7 ! PA = 0000000010001420
	.word	0x747342fc,0x0000006f,0x1f3a5d1a,0x08697083 ! PA = 0000000010001430
p0_local0_sec_expect:
	.word	0xff00ffff,0xffffffff,0xff96baa6,0xff800000 ! PA = 0000000030001400
	.word	0x0000ff00,0xff96baa6,0x190a6af2,0x40dbbffb ! PA = 0000000030001410
	.word	0x61138740,0x5e896251,0x704c327e,0x2b1a41d7 ! PA = 0000000030001420
	.word	0x6a4b282c,0x6c1efc0d,0x1a1e1fca,0x5835ba73 ! PA = 0000000030001430
!	Scratch Area for Non-Transactional Memory Stores
	.word	0x059686b6,0x412e66f7,0x3280f61a,0xd0a712a3
	.word	0xe383219e,0x2aa03eaf,0x8fb73242,0x50fdc61b
	.word	0x58ccd906,0x01271be7,0xb1678eea,0xf3fa0b13
	.word	0x647ed4ee,0x4d83769f,0x9a507412,0x282e198b
p0_local1_expect:
	.word	0xff000000,0xd741182b,0xff000000,0x000000ff ! PA = 0000000010041400
	.word	0x0c8e9a37,0x00000000,0x6ed5d5b2,0x00000000 ! PA = 0000000010041410
	.word	0x32379800,0x6dbbb811,0x4a24993e,0x4e81d597 ! PA = 0000000010041420
	.word	0x00000000,0x00000000,0x5864428a,0x0c8e9a33 ! PA = 0000000010041430
p0_local1_sec_expect:
	.word	0xca1f1eff,0x00000000,0x379a8e0c,0x8a426458 ! PA = 0000000030041400
	.word	0x2b1841d7,0x000000ff,0x002ee852,0x09306bdb ! PA = 0000000030041410
	.word	0x212897a0,0x16147531,0x211161f8,0x1cd5bb58 ! PA = 0000000030041420
	.word	0x3c89a68c,0x3b7104ed,0x75bcf92a,0x60f1d253 ! PA = 0000000030041430
p0_local2_expect:
	.word	0x00000000,0x00000000,0x00ff0000,0x373200ff ! PA = 0000000010081400
	.word	0x000000e0,0xe6cb95ff,0x6f4f0069,0x6411b662 ! PA = 0000000010081410
	.word	0x6f4f0069,0xffffffff,0x6f4fa229,0x29a24f4f ! PA = 0000000010081420
	.word	0x00ff0045,0x00000003,0xffffffff,0xefbb8000 ! PA = 0000000010081430
p0_local2_sec_expect:
	.word	0xff96baa6,0x00000000,0x00000000,0x00000003 ! PA = 0000000030081400
	.word	0x000061f8,0x543200ff,0xff800000,0x000000ff ! PA = 0000000030081410
	.word	0x00000000,0x00000000,0x00000000,0x000080ff ! PA = 0000000030081420
	.word	0x77560000,0x6c667169,0xca1f1e1a,0xff96baa6 ! PA = 0000000030081430
p0_local3_expect:
	.word	0x00000000,0x000000ff,0xcf51d205,0x000000ff ! PA = 00000000100c1400
	.word	0xff000000,0x77560000,0x7fffffff,0x69000000 ! PA = 00000000100c1410
	.word	0x61138740,0x00896251,0xa8000000,0x000000e4 ! PA = 00000000100c1420
	.word	0x675aa9c6,0xff8c61f8,0x000000ff,0xc0000000 ! PA = 00000000100c1430
p0_local3_sec_expect:
	.word	0xa6ba96ff,0x1a1e1fca,0xff003237,0x00000000 ! PA = 00000000300c1400
	.word	0x03000000,0x00000000,0xff800000,0x000000ff ! PA = 00000000300c1410
	.word	0x00000000,0x00000000,0x00000000,0x000080ff ! PA = 00000000300c1420
	.word	0x77560000,0x6c667169,0xca1f1e1a,0xff96baa6 ! PA = 00000000300c1430
p0_local4_expect:
	.word	0xff000000,0x8886780c,0xca1f1e1a,0xff96baa6 ! PA = 0000000010101400
	.word	0x4a24993e,0x00000000,0xff800000,0xffffff7f ! PA = 0000000010101410
	.word	0x729b3a90,0x6b31f661,0x00000bff,0x5835ba73 ! PA = 0000000010101420
	.word	0x4a24993e,0x00ff8d1d,0x1a1e1fca,0xff000000 ! PA = 0000000010101430
p0_local4_sec_expect:
	.word	0x28000000,0x00000000,0xff1e1fca,0x8886780c ! PA = 0000000030101400
	.word	0xff000069,0x98c09d93,0xbbc7b75e,0x62afc3ac ! PA = 0000000030101410
	.word	0xff96baa6,0x00000000,0x97d5814e,0x3e99244a ! PA = 0000000030101420
	.word	0x00005677,0x0000ba73,0x0c780000,0x29a24f6f ! PA = 0000000030101430
p0_local5_expect:
	.word	0x000000c0,0xff000000,0xffffffff,0xfffffaff ! PA = 0000000010141400
	.word	0xff000000,0x00000000,0x58bb80a8,0xf861ccff ! PA = 0000000010141410
	.word	0x00000000,0x00000000,0x00000000,0x000080ff ! PA = 0000000010141420
	.word	0x80bb80a8,0x6c667169,0xca1f1e1a,0x5e20db3a ! PA = 0000000010141430
p0_local5_sec_expect:
	.word	0xff560003,0xcf51d205,0xff4f0069,0xa75cf95c ! PA = 0000000030141400
	.word	0xff000000,0xa6ba96ff,0xff95cbe6,0x6922749f ! PA = 0000000030141410
	.word	0xb1a00a27,0x2039b018,0x0f7bb503,0x00000000 ! PA = 0000000030141420
	.word	0x6d082954,0x0c009523,0x7937d678,0x8886780c ! PA = 0000000030141430
p0_local6_expect:
	.word	0xc0000000,0x000000ff,0x30a368c0,0x0b879c21 ! PA = 0000000010181400
	.word	0xff005677,0x714f03af,0x00000000,0x00000000 ! PA = 0000000010181410
	.word	0x00000300,0x0b879c21,0x00000000,0x54d7faff ! PA = 0000000010181420
	.word	0xff4fa229,0x53fc1edd,0x00000000,0xff8c61f8 ! PA = 0000000010181430
p0_local6_sec_expect:
	.word	0x00000000,0xe06ce418,0x00000000,0x00000000 ! PA = 0000000030181400
	.word	0xd7411a2b,0xf86100ff,0x13000000,0x0f7b0003 ! PA = 0000000030181410
	.word	0x49239034,0xff96baa6,0x3adb205e,0xbbc7b75e ! PA = 0000000030181420
	.word	0x000000c0,0x54d7faff,0x44390058,0xff0b0000 ! PA = 0000000030181430
share0_expect:
	.word	0xffff8718,0x5dcd9bc9,0x37493b16,0x58b0e90f ! PA = 00000000201c0000
	.word	0x46d14f84,0x60380f05,0x6486abe2,0x2441a72b ! PA = 00000000201c0010
	.word	0x519f93b0,0x4c2ab701,0x5ce3866e,0x48a71007 ! PA = 00000000201c0020
	.word	0x1a661f9c,0x0a44afbd,0x0660f6ba,0x77321fa3 ! PA = 00000000201c0030
share1_expect:
	.word	0x00697f48,0x299fd539,0x67d7e8c6,0x74d491ff ! PA = 0000000020800000
	.word	0x5c7ffeb4,0x19ccc375,0x0d850892,0x24fce31b ! PA = 0000000020800010
	.word	0x3f2fa9e0,0x558ed671,0x2354c21e,0x5b324ef7 ! PA = 0000000020800020
	.word	0x72284ccc,0x5a582a2d,0x30ef416a,0x2f70d193 ! PA = 0000000020800030
	.word	0x13157378,0x08859aa9,0x23847276,0x514526ef ! PA = 0000000020800040
	.word	0x124469e4,0x485ac3e5,0x11580142,0x15a8cb0b ! PA = 0000000020800050
	.word	0x04923c10,0x0fbe01e1,0x630d59ce,0x3b9df9e7 ! PA = 0000000020800060
	.word	0x6f15b5fc,0x24b4709d,0x4eb3a81a,0x238baf83 ! PA = 0000000020800070
share2_expect:
	.word	0xff0063a8,0x389dec19,0x5091d826,0x7559a7df ! PA = 00000000211c0000
	.word	0x4fb99114,0x38311055,0x0db295f2,0x714c5efb ! PA = 00000000211c0010
	.word	0x20524a40,0x6c373951,0x4c304d7e,0x67a110d7 ! PA = 00000000211c0020
	.word	0x19a95b2c,0x4708830d,0x6d412aca,0x12e9b973 ! PA = 00000000211c0030
share3_expect:
	.word	0x2b9b4fd8,0x7ac7c989,0x150319d6,0x512914cf ! PA = 0000000021800000
	.word	0x4a3a7444,0x345ea8c5,0x6c07c6a2,0x77ae9eeb ! PA = 0000000021800010
	.word	0x4abad470,0x17397cc1,0x26a09d2e,0x3db293c7 ! PA = 0000000021800020
	.word	0x601e3c5c,0x55c3617d,0x3deac97a,0x79b1ef63 ! PA = 0000000021800030
	.word	0xff6f3808,0x02a232f9,0x069b3786,0x2d8a6dbf ! PA = 0000000021800040
	.word	0x34e21374,0x76b28d35,0x118a9352,0x1d568adb ! PA = 0000000021800050
	.word	0x25d6daa0,0x67c3cc31,0x020148de,0x6d0982b7 ! PA = 0000000021800060
	.word	0x466f598c,0x0c140bed,0x45c3842a,0x00cb5153 ! PA = 0000000021800070
	.word	0xffff1c38,0x668c2869,0x5add3136,0x1c14b2af ! PA = 0000000021800080
	.word	0x708b6ea4,0x17bbbda5,0x0f2dfc02,0x7b8b22cb ! PA = 0000000021800090
	.word	0x6d715cd0,0x4f9527a1,0x65b5508e,0x659cdda7 ! PA = 00000000218000a0
	.word	0x1657b2bc,0x3be9825d,0x0d9e5ada,0x6ddcdf43 ! PA = 00000000218000b0
	.word	0x56fffc68,0x0fa4a9d9,0x170c06e6,0x671ee39f ! PA = 00000000218000c0
	.word	0x3bd185d4,0x7ec93a15,0x51a500b2,0x405366bb ! PA = 00000000218000d0
	.word	0x27155b00,0x4b2c8f11,0x00dfb43e,0x4823a497 ! PA = 00000000218000e0
	.word	0x0f5247ec,0x3df2c4cd,0x520e4d8a,0x134d9933 ! PA = 00000000218000f0
	.word	0x6f4fd898,0x29cab749,0x402ab896,0x01c0008f ! PA = 0000000021800100
	.word	0x630f5904,0x51ea0285,0x5162a162,0x1e7656ab ! PA = 0000000021800110
	.word	0x520dd530,0x51c90281,0x5a6373ee,0x5614d787 ! PA = 0000000021800120
	.word	0x169a191c,0x619ed33d,0x33665c3a,0x40447f23 ! PA = 0000000021800130
	.word	0x09ebb0c8,0x139d50b9,0x0afc4646,0x77cf097f ! PA = 0000000021800140
	.word	0x705fe834,0x65ed16f5,0x4299de12,0x3d7af29b ! PA = 0000000021800150
	.word	0x1765cb60,0x456981f1,0x00e38f9e,0x61a77677 ! PA = 0000000021800160
	.word	0x672a264c,0x5d1cadad,0x65b986ea,0x30a89113 ! PA = 0000000021800170
	.word	0xf5ff84f8,0x4e7b7629,0x0c03aff6,0x5de2fe6f ! PA = 0000000021800180
	.word	0x5b9e3364,0x2e617765,0x453db6c2,0x29a83a8b ! PA = 0000000021800190
	.word	0x79e83d90,0x62cd0d61,0x3ac3074e,0x3dd28167 ! PA = 00000000218001a0
	.word	0x41bd6f7c,0x3d5b541d,0x60dacd9a,0x7d20cf03 ! PA = 00000000218001b0
	.word	0x45535528,0x6e842799,0x6783f5a6,0x4152df5f ! PA = 00000000218001c0
	.word	0x3a653a94,0x2d9623d5,0x15012b72,0x44052e7b ! PA = 00000000218001d0
	.word	0x06202bc0,0x3172a4d1,0x3624dafe,0x2e4cf857 ! PA = 00000000218001e0
	.word	0x1ccef4ac,0x5609c68d,0x105d304a,0x0b1438f3 ! PA = 00000000218001f0
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
	.word	0x074f5078,0x3882e3a9,0x192af776,0x78fa77ef	! PA = 0000000010001400
	.word	0x721dd6e4,0x28865ce5,0x2d419642,0x0d6aec0b	! PA = 0000000010001410
	.word	0x6e033910,0x3728eae1,0x4166fece,0x2ec5eae7	! PA = 0000000010001420
	.word	0x747342fc,0x633fa99d,0x1f3a5d1a,0x08c27083	! PA = 0000000010001430
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
	.word	0x41bb80a8,0x2ffa7519,0x6b929d26,0x2f9838df	! PA = 0000000030001400
	.word	0x712f3e14,0x44dfe955,0x190a6af2,0x40dbbffb	! PA = 0000000030001410
	.word	0x61138740,0x5e896251,0x704c327e,0x2b1a41d7	! PA = 0000000030001420
	.word	0x6a4b282c,0x6c1efc0d,0x1a1e1fca,0x5835ba73	! PA = 0000000030001430
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
	.word	0x37c2acd8,0x75939289,0x572e1ed6,0x3680e5cf	! PA = 0000000010041400
	.word	0x499c6144,0x26a0c1c5,0x519ddba2,0x5c9b3feb	! PA = 0000000010041410
	.word	0x701c5170,0x1a82e5c1,0x344ec22e,0x440d04c7	! PA = 0000000010041420
	.word	0x4a54495c,0x44751a7d,0x73edfe7a,0x56a33063	! PA = 0000000010041430
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
	.word	0x148fd508,0x10ed3bf9,0x75c07c86,0x4a8b7ebf	! PA = 0000000030041400
	.word	0x52804074,0x1b97e635,0x002ee852,0x09306bdb	! PA = 0000000030041410
	.word	0x212897a0,0x16147531,0x2111adde,0x1cd533b7	! PA = 0000000030041420
	.word	0x3c89a68c,0x3b7104ed,0x75bcf92a,0x60f1d253	! PA = 0000000030041430
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
	.word	0x050df938,0x6c667169,0x00ccb636,0x714f03af	! PA = 0000000010081400
	.word	0x10b5dba4,0x505456a5,0x79b09102,0x13e243cb	! PA = 0000000010081410
	.word	0x140359d0,0x16fd10a1,0x41f7f58e,0x1969cea7	! PA = 0000000010081420
	.word	0x2ea63fbc,0x3701bb5d,0x6c5e0fda,0x70c8a043	! PA = 0000000010081430
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
	.word	0x67e81968,0x451e32d9,0x0195cbe6,0x6922749f	! PA = 0000000030081400
	.word	0x66d832d4,0x40251315,0x6ed5d5b2,0x5eb7c7bb	! PA = 0000000030081410
	.word	0x32379800,0x6dbbb811,0x4a24993e,0x4e81d597	! PA = 0000000030081420
	.word	0x042514ec,0x23d63dcd,0x5864428a,0x0c8e9a33	! PA = 0000000030081430
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
	.word	0x7d893598,0x1af38049,0x011ebd96,0x191cd18f	! PA = 00000000100c1400
	.word	0x45424604,0x25191b85,0x1c11b662,0x5077f7ab	! PA = 00000000100c1410
	.word	0x5f105230,0x658f6b81,0x447a98ee,0x71944887	! PA = 00000000100c1420
	.word	0x4641261c,0x655d8c3d,0x1e22913a,0x376ac023	! PA = 00000000100c1430
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
	.word	0x181c4dc8,0x208559b9,0x382a8b46,0x01151a7f	! PA = 00000000300c1400
	.word	0x5a0f1534,0x67ff6ff5,0x79973312,0x44a9d39b	! PA = 00000000300c1410
	.word	0x27988860,0x34772af1,0x439cf49e,0x48d82777	! PA = 00000000300c1420
	.word	0x53f5734c,0x45c6a6ad,0x35abfbea,0x61441213	! PA = 00000000300c1430
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
	.word	0x4b8c61f8,0x2b32bf29,0x3f3c34f6,0x29a24f6f	! PA = 0000000010101400
	.word	0x4119a064,0x10671065,0x6b594bc2,0x7b945b8b	! PA = 0000000010101410
	.word	0x729b3a90,0x6b31f661,0x11eeac4e,0x1b447267	! PA = 0000000010101420
	.word	0x11fcfc7c,0x66008d1d,0x5ad3829a,0x56c19003	! PA = 0000000010101430
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
	.word	0x1d847228,0x231ab099,0x3e96baa6,0x141b705f	! PA = 0000000030101400
	.word	0x33fce794,0x349efcd5,0x710b0072,0x0a3e8f7b	! PA = 0000000030101410
	.word	0x30a368c0,0x653ecdd1,0x6192bffe,0x20902957	! PA = 0000000030101420
	.word	0x1ad2c1ac,0x2dba3f8d,0x3d2c254a,0x314a39f3	! PA = 0000000030101430
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
	.word	0x356f7e58,0x731c2e09,0x1e3d1c56,0x2a977d4f	! PA = 0000000010141400
	.word	0x3a13eac4,0x69b63545,0x561f5122,0x4a6f6f6b	! PA = 0000000010141410
	.word	0x0bfc12f0,0x38dcb141,0x7c6c2fae,0x71324c47	! PA = 0000000010141420
	.word	0x6eb1c2dc,0x3b62bdfd,0x3008e3fa,0x47050fe3	! PA = 0000000010141430
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
	.word	0x0c788688,0x78d63779,0x35f25a06,0x2fed763f	! PA = 0000000030141400
	.word	0x5879a9f4,0x337bb9b5,0x61c93dd2,0x4aadfb5b	! PA = 0000000030141410
	.word	0x18b03920,0x270aa0b1,0x741dfb5e,0x7661db37	! PA = 0000000030141420
	.word	0x2395000c,0x5429086d,0x5a7cbeaa,0x1ad911d3	! PA = 0000000030141430
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
	.word	0x1d8a8ab8,0x74a7cce9,0x7d3973b6,0x2fb45b2f	! PA = 0000000010181400
	.word	0x42092524,0x747e8a25,0x06fbc682,0x3e41334b	! PA = 0000000010181410
	.word	0x048adb50,0x0b879c21,0x520b230e,0x5a15d627	! PA = 0000000010181420
	.word	0x1537793c,0x53fc1edd,0x675ab55a,0x4c6d3fc3	! PA = 0000000010181430
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
	.word	0x15508ae8,0x79afee59,0x3b556966,0x6e432c1f	! PA = 0000000030181400
	.word	0x075d5c54,0x5e0da695,0x1469eb32,0x6d30173b	! PA = 0000000030181410
	.word	0x4716f980,0x4cd2a391,0x4756a6be,0x77053d17	! PA = 0000000030181420
	.word	0x15142e6c,0x1d8b014d,0x3535c80a,0x082899b3	! PA = 0000000030181430
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
	.word	0x02358718,0x5dcd9bc9,0x37493b16,0x58b0e90f	! PA = 00000000201c0000
	.word	0x46d14f84,0x60380f05,0x6486abe2,0x2441a72b	! PA = 00000000201c0010
	.word	0x519f93b0,0x4c2ab701,0x5ce3866e,0x48a71007	! PA = 00000000201c0020
	.word	0x1a661f9c,0x0a44afbd,0x0660f6ba,0x77321fa3	! PA = 00000000201c0030
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
	.word	0x04647f48,0x299fd539,0x67d7e8c6,0x74d491ff	! PA = 0000000020800000
	.word	0x5c7ffeb4,0x19ccc375,0x0d850892,0x24fce31b	! PA = 0000000020800010
	.word	0x3f2fa9e0,0x558ed671,0x2354c21e,0x5b324ef7	! PA = 0000000020800020
	.word	0x72284ccc,0x5a582a2d,0x30ef416a,0x2f70d193	! PA = 0000000020800030
	.word	0x7dc87378,0x08859aa9,0x23847276,0x514526ef	! PA = 0000000020800040
	.word	0x124469e4,0x485ac3e5,0x11580142,0x15a8cb0b	! PA = 0000000020800050
	.word	0x04923c10,0x0fbe01e1,0x630d59ce,0x3b9df9e7	! PA = 0000000020800060
	.word	0x6f15b5fc,0x24b4709d,0x4eb3a81a,0x238baf83	! PA = 0000000020800070
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
	.word	0x420c63a8,0x389dec19,0x5091d826,0x7559a7df	! PA = 00000000211c0000
	.word	0x4fb99114,0x38311055,0x0db295f2,0x714c5efb	! PA = 00000000211c0010
	.word	0x20524a40,0x6c373951,0x4c304d7e,0x67a110d7	! PA = 00000000211c0020
	.word	0x19a95b2c,0x4708830d,0x6d412aca,0x12e9b973	! PA = 00000000211c0030
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
	.word	0x469b4fd8,0x7ac7c989,0x150319d6,0x512914cf	! PA = 0000000021800000
	.word	0x4a3a7444,0x345ea8c5,0x6c07c6a2,0x77ae9eeb	! PA = 0000000021800010
	.word	0x4abad470,0x17397cc1,0x26a09d2e,0x3db293c7	! PA = 0000000021800020
	.word	0x601e3c5c,0x55c3617d,0x3deac97a,0x79b1ef63	! PA = 0000000021800030
	.word	0x52a03808,0x02a232f9,0x069b3786,0x2d8a6dbf	! PA = 0000000021800040
	.word	0x34e21374,0x76b28d35,0x118a9352,0x1d568adb	! PA = 0000000021800050
	.word	0x25d6daa0,0x67c3cc31,0x020148de,0x6d0982b7	! PA = 0000000021800060
	.word	0x466f598c,0x0c140bed,0x45c3842a,0x00cb5153	! PA = 0000000021800070
	.word	0x2f061c38,0x668c2869,0x5add3136,0x1c14b2af	! PA = 0000000021800080
	.word	0x708b6ea4,0x17bbbda5,0x0f2dfc02,0x7b8b22cb	! PA = 0000000021800090
	.word	0x6d715cd0,0x4f9527a1,0x65b5508e,0x659cdda7	! PA = 00000000218000a0
	.word	0x1657b2bc,0x3be9825d,0x0d9e5ada,0x6ddcdf43	! PA = 00000000218000b0
	.word	0x5677fc68,0x0fa4a9d9,0x170c06e6,0x671ee39f	! PA = 00000000218000c0
	.word	0x3bd185d4,0x7ec93a15,0x51a500b2,0x405366bb	! PA = 00000000218000d0
	.word	0x27155b00,0x4b2c8f11,0x00dfb43e,0x4823a497	! PA = 00000000218000e0
	.word	0x0f5247ec,0x3df2c4cd,0x520e4d8a,0x134d9933	! PA = 00000000218000f0
	.word	0x2560d898,0x29cab749,0x402ab896,0x01c0008f	! PA = 0000000021800100
	.word	0x630f5904,0x51ea0285,0x5162a162,0x1e7656ab	! PA = 0000000021800110
	.word	0x520dd530,0x51c90281,0x5a6373ee,0x5614d787	! PA = 0000000021800120
	.word	0x169a191c,0x619ed33d,0x33665c3a,0x40447f23	! PA = 0000000021800130
	.word	0x09ebb0c8,0x139d50b9,0x0afc4646,0x77cf097f	! PA = 0000000021800140
	.word	0x705fe834,0x65ed16f5,0x4299de12,0x3d7af29b	! PA = 0000000021800150
	.word	0x1765cb60,0x456981f1,0x00e38f9e,0x61a77677	! PA = 0000000021800160
	.word	0x672a264c,0x5d1cadad,0x65b986ea,0x30a89113	! PA = 0000000021800170
	.word	0x340384f8,0x4e7b7629,0x0c03aff6,0x5de2fe6f	! PA = 0000000021800180
	.word	0x5b9e3364,0x2e617765,0x453db6c2,0x29a83a8b	! PA = 0000000021800190
	.word	0x79e83d90,0x62cd0d61,0x3ac3074e,0x3dd28167	! PA = 00000000218001a0
	.word	0x41bd6f7c,0x3d5b541d,0x60dacd9a,0x7d20cf03	! PA = 00000000218001b0
	.word	0x45535528,0x6e842799,0x6783f5a6,0x4152df5f	! PA = 00000000218001c0
	.word	0x3a653a94,0x2d9623d5,0x15012b72,0x44052e7b	! PA = 00000000218001d0
	.word	0x06202bc0,0x3172a4d1,0x3624dafe,0x2e4cf857	! PA = 00000000218001e0
	.word	0x1ccef4ac,0x5609c68d,0x105d304a,0x0b1438f3	! PA = 00000000218001f0
share3_end:
