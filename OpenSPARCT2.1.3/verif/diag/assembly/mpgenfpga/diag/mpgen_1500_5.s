/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_1500_5.s
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
!	Seed = 327144519
!	Riesling can be on
!	1 Thread, 1500 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_1500_5.s created on Mar 27, 2009 (14:45:19)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_1500_5 -p 1 -l 1500

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
!	%f0  = bf4868b0 443541f1 06cf234f 50e1d112
!	%f4  = 34410bb8 da8f2695 a3561e6a 4ead84b8
!	%f8  = 64a1d6cb 339398c5 7daf2ca7 a924ff12
!	%f12 = c59c80f6 e6a17139 fa8abe3f c94fafea
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 29186169 1bd4c82c ba212420 6b16c86c
!	%f20 = 6db09672 2fbd32dd 2dd82dec 33bfe483
!	%f24 = 3f88b412 24321178 ef64c2d6 d7196b5b
!	%f28 = a31cfa78 deb657c2 80a46a35 5ec2e987
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = b9e15608 ff1970b7 7b3ab952 86e03180
!	%f36 = 217b42c4 336e8dc1 66475fd3 106f3dc7
!	%f40 = 5ef8a92d e44d5fdf b694d08a cba7a90f
!	%f44 = b8c2f12e f777abfa fd26ac1e b6021b82
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x24f112ff00000047,%g7,%g1 ! GSR scale =  8, align = 7
	wr	%g1,%g0,%gsr		! GSR = 24f112ff00000047
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000010041410] = 7ce2d3f3, %l4 = 7057814c5bfc17a8
	lduba	[%i1+%o5]0x88,%l4	! %l4 = 00000000000000f3
!	%l1 = 5ceea6608810975e, Mem[0000000030081408] = 0d029672
	stha	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 0d02975e
!	%l3 = accf2f0e37d4e922, Mem[0000000010101410] = 32a6ce4f24c4c4ab
	stxa	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = accf2f0e37d4e922
!	%l0 = 6b8d32d89cf86588, Mem[0000000030081400] = 704ef0c5
	stha	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 6588f0c5
!	%f0  = bf4868b0 443541f1 06cf234f 50e1d112
!	%f4  = 34410bb8 da8f2695 a3561e6a 4ead84b8
!	%f8  = 64a1d6cb 339398c5 7daf2ca7 a924ff12
!	%f12 = c59c80f6 e6a17139 fa8abe3f c94fafea
	stda	%f0,[%i5]ASI_BLK_AIUS	! Block Store to 0000000030141400
!	Mem[0000000010081400] = bb40e2f3 223ebaf9 ba5bf46f 77e7dc0f
!	Mem[0000000010081410] = 0c0433f0 22fb4faa e31a7693 5e40dc05
!	Mem[0000000010081420] = fdddfdde c2eb338a 55d9868e 73f99e3d
!	Mem[0000000010081430] = 7816c52b 458e4d03 3825e7ae 71368f33
	ldda	[%i2]ASI_BLK_P,%f0	! Block Load from 0000000010081400
!	%f28 = a31cfa78, %f23 = 33bfe483
	fcmpes	%fcc2,%f28,%f23		! %fcc2 = 1
!	Mem[000000001008140c] = 77e7dc0f, %l1 = 5ceea6608810975e
	lduh	[%i2+0x00e],%l1		! %l1 = 000000000000dc0f
!	Mem[00000000100c1400] = 4e00100cea23f0d1, %f24 = 3f88b412 24321178
	ldd	[%i3+%g0],%f24		! %f24 = 4e00100c ea23f0d1
!	Starting 10 instruction Store Burst
!	%f16 = 29186169 1bd4c82c, Mem[0000000030141408] = 4f23cf06 12d1e150
	stda	%f16,[%i5+%o4]0x89	! Mem[0000000030141408] = 29186169 1bd4c82c

p0_label_2:
!	%l0 = 6b8d32d89cf86588, Mem[00000000211c0000] = bec496d7, %asi = 80
	stha	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = 658896d7
	membar	#Sync			! Added by membar checker (1)
!	%l6 = 98add263, %l7 = 193e10b4, Mem[0000000010081408] = 6ff45bba 0fdce777
	stda	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 98add263 193e10b4
!	%l7 = b18d5eb2193e10b4, Mem[0000000010181439] = f6c29455, %asi = 80
	stba	%l7,[%i6+0x039]%asi	! Mem[0000000010181438] = f6b49455
!	%f6  = e31a7693 5e40dc05, Mem[0000000010181410] = 14d1e089 33331480
	stda	%f6 ,[%i6+%o5]0x80	! Mem[0000000010181410] = e31a7693 5e40dc05
!	Mem[0000000030041408] = c3fc41c0, %l1 = 000000000000dc0f
	swapa	[%i1+%o4]0x81,%l1	! %l1 = 00000000c3fc41c0
!	%f18 = ba212420 6b16c86c, Mem[00000000100c1410] = 3ae6f0ee 24f085dd
	stda	%f18,[%i3+%o5]0x88	! Mem[00000000100c1410] = ba212420 6b16c86c
!	Mem[0000000010141418] = 8118aef9, %l0 = 6b8d32d89cf86588, %asi = 80
	swapa	[%i5+0x018]%asi,%l0	! %l0 = 000000008118aef9
!	%f8  = fdddfdde c2eb338a, %l4 = 00000000000000f3
!	Mem[0000000030041430] = b17c5f23536be766
	add	%i1,0x030,%g1
	stda	%f8,[%g1+%l4]ASI_PST16_SL ! Mem[0000000030041430] = 8a33ebc2536be766
!	%f26 = ef64c2d6 d7196b5b, %l4 = 00000000000000f3
!	Mem[0000000030001418] = 724d8943d6012d37
	add	%i0,0x018,%g1
	stda	%f26,[%g1+%l4]ASI_PST8_S ! Mem[0000000030001418] = ef64c2d6d6016b5b
!	Starting 10 instruction Load Burst
!	Mem[00000000100c143c] = e8603558, %l0 = 000000008118aef9
	ldswa	[%i3+0x03c]%asi,%l0	! %l0 = ffffffffe8603558

p0_label_3:
!	Mem[0000000030081400] = 6588f0c5, %l3 = accf2f0e37d4e922
	ldswa	[%i2+%g0]0x81,%l3	! %l3 = 000000006588f0c5
!	Mem[0000000030041400] = 01f0cd6b, %l6 = e3fa840198add263
	ldsha	[%i1+%g0]0x81,%l6	! %l6 = 00000000000001f0
!	Mem[0000000010141408] = e13ef95b, %l3 = 000000006588f0c5
	lduha	[%i5+%o4]0x80,%l3	! %l3 = 000000000000e13e
!	Mem[0000000030081408] = 5e97020d, %l5 = 05e75992a700f72d
	lduba	[%i2+%o4]0x81,%l5	! %l5 = 000000000000005e
!	Mem[0000000010041400] = d6c8bdac b711b964 bfad4125 e3de4ecd
!	Mem[0000000010041410] = f3d3e27c 66d69c89 ca3c4fc2 c88d05cb
!	Mem[0000000010041420] = f3b38633 f83b6076 09b7bb66 d564900b
!	Mem[0000000010041430] = d7e9d98f eb283c98 72fc3a4e 439b4544
	ldda	[%i1]ASI_BLK_PL,%f16	! Block Load from 0000000010041400
!	Mem[0000000010041400] = 64b911b7acbdc8d6, %f8  = fdddfdde c2eb338a
	ldda	[%i1+%g0]0x88,%f8 	! %f8  = 64b911b7 acbdc8d6
!	Mem[0000000010101414] = 0e2fcfac, %l0 = ffffffffe8603558
	ldsw	[%i4+0x014],%l0		! %l0 = 000000000e2fcfac
!	Mem[0000000010081410] = f033040c, %l4 = 00000000000000f3
	lduba	[%i2+%o5]0x88,%l4	! %l4 = 000000000000000c
!	Mem[0000000010001410] = c2cd0b17, %l5 = 000000000000005e
	lduba	[%i0+%o5]0x80,%l5	! %l5 = 00000000000000c2
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000000c, imm = fffffffffffffbdb, %l2 = ad5307e7e42d9b9c
	or	%l4,-0x425,%l2		! %l2 = fffffffffffffbdf

p0_label_4:
!	%l3 = 000000000000e13e, %l0 = 000000000e2fcfac, %l5 = 00000000000000c2
	udivx	%l3,%l0,%l5		! %l5 = 0000000000000000
!	%f8  = 64b911b7 acbdc8d6, Mem[0000000030081410] = 6ea4756f 48f5209e
	stda	%f8 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 64b911b7 acbdc8d6
!	%l6 = 000001f0, %l7 = 193e10b4, Mem[0000000030181408] = e6cec3f4 a4c82809
	stda	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 000001f0 193e10b4
	membar	#Sync			! Added by membar checker (2)
!	%l6 = 00000000000001f0, Mem[0000000010041434] = eb283c98
	stw	%l6,[%i1+0x034]		! Mem[0000000010041434] = 000001f0
!	Mem[0000000030081400] = 6588f0c5, %l0 = 000000000e2fcfac
	ldstuba	[%i2+%g0]0x81,%l0	! %l0 = 00000065000000ff
!	%l3 = 000000000000e13e, Mem[0000000010001408] = 0a628eec
	stba	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 3e628eec
!	%l3 = 000000000000e13e, Mem[0000000030141400] = bf4868b0
	stwa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000e13e
!	%l1 = 00000000c3fc41c0, Mem[00000000211c0000] = 658896d7, %asi = 80
	stba	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = c08896d7
!	%l0 = 00000065, %l1 = c3fc41c0, Mem[0000000010041400] = acbdc8d6 64b911b7
	stda	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000065 c3fc41c0
!	Starting 10 instruction Load Burst
!	Mem[00000000218001c0] = b9985fa0, %l2 = fffffffffffffbdf
	lduba	[%o3+0x1c0]%asi,%l2	! %l2 = 00000000000000b9

p0_label_5:
!	Mem[0000000010181408] = bbbdc0cb, %l1 = 00000000c3fc41c0
	ldsha	[%i6+%o4]0x88,%l1	! %l1 = ffffffffffffc0cb
!	Mem[00000000100c1410] = 6cc8166b 202421ba, %l2 = 000000b9, %l3 = 0000e13e
	ldda	[%i3+%o5]0x80,%l2	! %l2 = 000000006cc8166b 00000000202421ba
!	Mem[0000000030101410] = 181936c0, %l4 = 000000000000000c
	lduba	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000018
!	Mem[0000000010181400] = 75009013, %l6 = 00000000000001f0
	ldsha	[%i6+%g0]0x80,%l6	! %l6 = 0000000000007500
!	Mem[0000000010181400] = 13900075, %l4 = 0000000000000018
	lduha	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000075
!	Mem[0000000010181420] = 5174c38e9d7676ae, %l6 = 0000000000007500
	ldxa	[%i6+0x020]%asi,%l6	! %l6 = 5174c38e9d7676ae
!	Mem[0000000010181400] = 75009013, %l4 = 0000000000000075
	ldswa	[%i6+%g0]0x80,%l4	! %l4 = 0000000075009013
!	Mem[0000000030181408] = f0010000b4103e19, %l4 = 0000000075009013
	ldxa	[%i6+%o4]0x81,%l4	! %l4 = f0010000b4103e19
!	Mem[0000000010081418] = e31a7693 5e40dc05, %l2 = 6cc8166b, %l3 = 202421ba
	ldd	[%i2+0x018],%l2		! %l2 = 00000000e31a7693 000000005e40dc05
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 74ff3b63, %l5 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l5	! %l5 = 00000063000000ff

p0_label_6:
!	%l4 = f0010000b4103e19, Mem[0000000030141408] = 2cc8d41b69611829
	stxa	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = f0010000b4103e19
!	%f12 = 7816c52b 458e4d03, Mem[0000000010141408] = 5bf93ee1 0f648831
	stda	%f12,[%i5+%o4]0x88	! Mem[0000000010141408] = 7816c52b 458e4d03
!	%l7 = b18d5eb2193e10b4, Mem[0000000010081430] = 7816c52b
	stw	%l7,[%i2+0x030]		! Mem[0000000010081430] = 193e10b4
!	%f28 = 983c28eb, Mem[00000000300c1410] = 9f27106e
	sta	%f28,[%i3+%o5]0x89	! Mem[00000000300c1410] = 983c28eb
!	%f18 = cd4edee3 2541adbf, Mem[0000000010041400] = 65000000 c041fcc3
	stda	%f18,[%i1+%g0]0x80	! Mem[0000000010041400] = cd4edee3 2541adbf
!	%l5 = 0000000000000063, Mem[0000000010041410] = f3d3e27c
	stwa	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000063
!	%f31 = 4e3afc72, Mem[0000000010101400] = 47763c44
	sta	%f31,[%i4+%g0]0x80	! Mem[0000000010101400] = 4e3afc72
!	%l1 = ffffffffffffc0cb, Mem[00000000100c1400] = 0c10004e
	stba	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0c1000cb
!	%f6  = e31a7693 5e40dc05, %l6 = 5174c38e9d7676ae
!	Mem[0000000030081430] = 3cc90faa969a60ac
	add	%i2,0x030,%g1
	stda	%f6,[%g1+%l6]ASI_PST16_S ! Mem[0000000030081430] = e31a76935e4060ac
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 5e97020d, %l4 = f0010000b4103e19
	lduba	[%i2+%o4]0x81,%l4	! %l4 = 000000000000005e

p0_label_7:
!	Mem[00000000300c1408] = d6805e2a3c9d31ce, %l5 = 0000000000000063
	ldxa	[%i3+%o4]0x81,%l5	! %l5 = d6805e2a3c9d31ce
!	Mem[0000000030141410] = 34410bb8, %f21 = 7ce2d3f3
	lda	[%i5+%o5]0x81,%f21	! %f21 = 34410bb8
!	Mem[0000000010001410] = 170bcdc2, %l6 = 5174c38e9d7676ae
	lduwa	[%i0+%o5]0x88,%l6	! %l6 = 00000000170bcdc2
!	Mem[00000000201c0000] = aa3a4531, %l7 = b18d5eb2193e10b4
	lduha	[%o0+0x000]%asi,%l7	! %l7 = 000000000000aa3a
!	Mem[0000000010141400] = 260a82b4, %l5 = d6805e2a3c9d31ce
	lduwa	[%i5+%g0]0x80,%l5	! %l5 = 00000000260a82b4
!	Mem[0000000030141410] = b80b4134, %l2 = 00000000e31a7693
	ldswa	[%i5+%o5]0x89,%l2	! %l2 = ffffffffb80b4134
!	Mem[0000000030101410] = c0361918, %l0 = 0000000000000065
	lduba	[%i4+%o5]0x89,%l0	! %l0 = 0000000000000018
!	Mem[0000000030041400] = 6bcdf001, %l0 = 0000000000000018
	lduba	[%i1+%g0]0x89,%l0	! %l0 = 0000000000000001
!	Mem[0000000010001408] = ec8e623e, %l6 = 00000000170bcdc2
	ldswa	[%i0+%o4]0x88,%l6	! %l6 = ffffffffec8e623e
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000aa3a, Mem[0000000010081400] = bb40e2f3223ebaf9, %asi = 80
	stxa	%l7,[%i2+0x000]%asi	! Mem[0000000010081400] = 000000000000aa3a

p0_label_8:
!	%l6 = ec8e623e, %l7 = 0000aa3a, Mem[0000000010141438] = 960b7cea 7680f324
	stda	%l6,[%i5+0x038]%asi	! Mem[0000000010141438] = ec8e623e 0000aa3a
!	%l2 = b80b4134, %l3 = 5e40dc05, Mem[0000000010001410] = 170bcdc2 128e36b3
	stda	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = b80b4134 5e40dc05
!	%l7 = 000000000000aa3a, Mem[0000000030041408] = 0000dc0f
	stwa	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000aa3a
!	%l4 = 000000000000005e, Mem[0000000010001428] = bf46c498ad1b2cef
	stx	%l4,[%i0+0x028]		! Mem[0000000010001428] = 000000000000005e
!	Mem[0000000010081420] = fdddfdde, %l7 = 0000aa3a, %l7 = 0000aa3a
	add	%i2,0x20,%g1
	casa	[%g1]0x80,%l7,%l7	! %l7 = 00000000fdddfdde
!	Mem[0000000030001410] = 71e7c199, %l7 = 00000000fdddfdde
	swapa	[%i0+%o5]0x89,%l7	! %l7 = 0000000071e7c199
!	%l0 = 00000001, %l1 = ffffc0cb, Mem[0000000030181408] = f0010000 b4103e19
	stda	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000001 ffffc0cb
!	Mem[0000000030181410] = 58df3feb, %l5 = 00000000260a82b4
	ldstuba	[%i6+%o5]0x89,%l5	! %l5 = 000000eb000000ff
!	Mem[00000000300c1410] = eb283c98, %l5 = 00000000000000eb
	ldstuba	[%i3+%o5]0x81,%l5	! %l5 = 000000eb000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = b14ef5345475cac2, %f8  = 64b911b7 acbdc8d6
	ldda	[%i0+%g0]0x88,%f8 	! %f8  = b14ef534 5475cac2

p0_label_9:
!	Mem[0000000030041408] = 0000aa3aca19aa26, %l3 = 000000005e40dc05
	ldxa	[%i1+%o4]0x81,%l3	! %l3 = 0000aa3aca19aa26
!	Mem[00000000100c1410] = ba212420 6b16c86c, %l4 = 0000005e, %l5 = 000000eb
	ldda	[%i3+%o5]0x88,%l4	! %l4 = 000000006b16c86c 00000000ba212420
!	Mem[0000000010081400] = 000000000000aa3a, %l0 = 0000000000000001
	ldxa	[%i2+%g0]0x80,%l0	! %l0 = 000000000000aa3a
!	%l7 = 0000000071e7c199, %l1 = ffffffffffffc0cb, %l5 = 00000000ba212420
	andn	%l7,%l1,%l5		! %l5 = 0000000000000110
!	Mem[0000000030081408] = 5e97020d, %l4 = 000000006b16c86c
	lduha	[%i2+%o4]0x81,%l4	! %l4 = 0000000000005e97
!	Mem[0000000030001408] = c5fe9d6b, %l1 = ffffffffffffc0cb
	lduha	[%i0+%o4]0x89,%l1	! %l1 = 0000000000009d6b
!	%f15 = 71368f33, %f7  = 5e40dc05
	fcmps	%fcc2,%f15,%f7 		! %fcc2 = 2
!	Mem[0000000010081410] = 0c0433f0, %l1 = 0000000000009d6b
	ldsba	[%i2+%o5]0x80,%l1	! %l1 = 000000000000000c
!	Mem[0000000010081408] = 63d2ad98b4103e19, %f10 = 55d9868e 73f99e3d
	ldda	[%i2+%o4]0x80,%f10	! %f10 = 63d2ad98 b4103e19
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000110, Mem[0000000010181400] = 75009013
	stha	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 01109013

p0_label_10:
!	%l7 = 0000000071e7c199, Mem[0000000030041410] = f30c4bcc
	stha	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = c1994bcc
!	%l1 = 000000000000000c, Mem[0000000030141400] = 0000e13e443541f1
	stxa	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000000000000c
!	Mem[0000000010141409] = 034d8e45, %l6 = ffffffffec8e623e
	ldstuba	[%i5+0x009]%asi,%l6	! %l6 = 0000004d000000ff
!	%l3 = 0000aa3aca19aa26, Mem[0000000010041410] = 00000063
	stba	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 26000063
!	Mem[00000000201c0001] = aa3a4531, %l3 = 0000aa3aca19aa26
	ldstub	[%o0+0x001],%l3		! %l3 = 0000003a000000ff
!	Mem[0000000010141410] = 7e40eab1, %l0 = 000000000000aa3a
	swapa	[%i5+%o5]0x88,%l0	! %l0 = 000000007e40eab1
!	Mem[00000000100c1408] = 4a697d72, %l6 = 000000000000004d
	swapa	[%i3+%o4]0x80,%l6	! %l6 = 000000004a697d72
!	Mem[0000000010181438] = f6b494553e2a2212, %l1 = 000000000000000c, %l1 = 000000000000000c
	add	%i6,0x38,%g1
	casxa	[%g1]0x80,%l1,%l1	! %l1 = f6b494553e2a2212
!	Mem[0000000010101420] = e8c8f610, %l4 = 0000000000005e97, %asi = 80
	swapa	[%i4+0x020]%asi,%l4	! %l4 = 00000000e8c8f610
!	Starting 10 instruction Load Burst
!	Mem[00000000100c143c] = e8603558, %l1 = f6b494553e2a2212
	ldub	[%i3+0x03d],%l1		! %l1 = 0000000000000060

p0_label_11:
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000030141400] = 00000000 0000000c f0010000 b4103e19
!	Mem[0000000030141410] = 34410bb8 da8f2695 a3561e6a 4ead84b8
!	Mem[0000000030141420] = 64a1d6cb 339398c5 7daf2ca7 a924ff12
!	Mem[0000000030141430] = c59c80f6 e6a17139 fa8abe3f c94fafea
	ldda	[%i5]ASI_BLK_AIUS,%f16	! Block Load from 0000000030141400
!	Mem[0000000030101410] = b857bea6c0361918, %f6  = e31a7693 5e40dc05
	ldda	[%i4+%o5]0x89,%f6 	! %f6  = b857bea6 c0361918
!	Mem[0000000030001408] = c5fe9d6b, %l2 = ffffffffb80b4134
	lduba	[%i0+%o4]0x89,%l2	! %l2 = 000000000000006b
!	Mem[000000001018140c] = 35b6ccf7, %l0 = 000000007e40eab1
	lduh	[%i6+0x00c],%l0		! %l0 = 00000000000035b6
!	Mem[0000000010001408] = 3e628eec, %l4 = 00000000e8c8f610
	lduha	[%i0+%o4]0x80,%l4	! %l4 = 0000000000003e62
!	Mem[0000000010141408] = 458eff03, %l4 = 0000000000003e62
	lduha	[%i5+%o4]0x88,%l4	! %l4 = 000000000000ff03
!	Mem[0000000010101400] = 72fc3a4e, %f14 = 3825e7ae
	lda	[%i4+%g0]0x88,%f14	! %f14 = 72fc3a4e
!	Mem[0000000010041410] = 26000063, %l3 = 000000000000003a
	ldswa	[%i1+0x010]%asi,%l3	! %l3 = 0000000026000063
!	Mem[0000000010001418] = 5a9b2861 6acc6a68, %l2 = 0000006b, %l3 = 26000063
	ldda	[%i0+0x018]%asi,%l2	! %l2 = 000000005a9b2861 000000006acc6a68
!	Starting 10 instruction Store Burst
!	%f10 = 63d2ad98, Mem[0000000030001408] = c5fe9d6b
	sta	%f10,[%i0+%o4]0x89	! Mem[0000000030001408] = 63d2ad98

p0_label_12:
!	%l1 = 0000000000000060, Mem[0000000030181408] = 00000001
	stba	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 60000001
!	%l3 = 000000006acc6a68, Mem[0000000010141410] = 3aaa0000
	stw	%l3,[%i5+%o5]		! Mem[0000000010141410] = 6acc6a68
!	%f9  = 5475cac2, Mem[0000000010081408] = 63d2ad98
	sta	%f9 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 5475cac2
!	Mem[0000000010101408] = dbf5e032, %l5 = 0000000000000110
	ldstuba	[%i4+%o4]0x88,%l5	! %l5 = 00000032000000ff
!	%f6  = b857bea6 c0361918, Mem[0000000030081410] = b711b964 d6c8bdac
	stda	%f6 ,[%i2+%o5]0x89	! Mem[0000000030081410] = b857bea6 c0361918
!	%l2 = 000000005a9b2861, Mem[0000000020800040] = 81040070
	sth	%l2,[%o1+0x040]		! Mem[0000000020800040] = 28610070
!	%l0 = 00000000000035b6, Mem[0000000030181410] = ff3fdf58e3d8937b
	stxa	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000000035b6
!	Mem[0000000010041400] = cd4edee3, %l2 = 000000005a9b2861
	swap	[%i1+%g0],%l2		! %l2 = 00000000cd4edee3
	membar	#Sync			! Added by membar checker (4)
!	%l2 = 00000000cd4edee3, Mem[0000000030141410] = 34410bb8
	stba	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = e3410bb8
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = cc4b99c1, %l5 = 0000000000000032
	lduwa	[%i1+%o5]0x89,%l5	! %l5 = 00000000cc4b99c1

p0_label_13:
!	Mem[0000000010181408] = bbbdc0cb, %l3 = 000000006acc6a68
	ldsha	[%i6+%o4]0x88,%l3	! %l3 = ffffffffffffc0cb
!	Mem[0000000030001400] = ff3bff74, %l0 = 00000000000035b6
	lduba	[%i0+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081410] = c0361918, %l5 = 00000000cc4b99c1
	lduwa	[%i2+%o5]0x89,%l5	! %l5 = 00000000c0361918
!	Mem[0000000020800040] = 28610070, %l3 = ffffffffffffc0cb
	lduh	[%o1+0x040],%l3		! %l3 = 0000000000002861
!	Mem[0000000010101400] = 72fc3a4e, %l2 = 00000000cd4edee3
	lduwa	[%i4+%g0]0x88,%l2	! %l2 = 0000000072fc3a4e
!	Mem[0000000010001400] = c2ca7554, %l1 = 0000000000000060
	lduha	[%i0+%g0]0x80,%l1	! %l1 = 000000000000c2ca
!	Mem[0000000030081408] = 5e97020d, %l7 = 0000000071e7c199
	ldsba	[%i2+%o4]0x81,%l7	! %l7 = 000000000000005e
!	Mem[0000000010041410] = 26000063, %l1 = 000000000000c2ca
	ldsba	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000026
!	Mem[00000000201c0000] = aaff4531, %l5 = 00000000c0361918
	lduh	[%o0+%g0],%l5		! %l5 = 000000000000aaff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = c2ca7554, %l0 = 00000000000000ff
	swapa	[%i0+%g0]0x80,%l0	! %l0 = 00000000c2ca7554

p0_label_14:
!	%f22 = a3561e6a 4ead84b8, %l5 = 000000000000aaff
!	Mem[0000000030001408] = 98add263f64a72b3
	add	%i0,0x008,%g1
	stda	%f22,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030001408] = b884ad4e6a1e56a3
!	Mem[0000000030141408] = f0010000, %l0 = 00000000c2ca7554
	swapa	[%i5+%o4]0x81,%l0	! %l0 = 00000000f0010000
!	Mem[0000000030081408] = 0d02975e, %l0 = 00000000f0010000
	ldstuba	[%i2+%o4]0x89,%l0	! %l0 = 0000005e000000ff
!	%l4 = 000000000000ff03, Mem[00000000100c1400] = cb00100c
	stwa	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000ff03
!	Code Fragment 3
p0_fragment_1:
!	%l0 = 000000000000005e
	setx	0x444c2c67a1c0f0aa,%g7,%l0 ! %l0 = 444c2c67a1c0f0aa
!	%l1 = 0000000000000026
	setx	0xd5a52167d0ba12e3,%g7,%l1 ! %l1 = d5a52167d0ba12e3
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 444c2c67a1c0f0aa
	setx	0x3b221790740f11fa,%g7,%l0 ! %l0 = 3b221790740f11fa
!	%l1 = d5a52167d0ba12e3
	setx	0xf6000580207924c3,%g7,%l1 ! %l1 = f6000580207924c3
!	%f2  = ba5bf46f 77e7dc0f, %l0 = 3b221790740f11fa
!	Mem[0000000010001418] = 5a9b28616acc6a68
	add	%i0,0x018,%g1
	stda	%f2,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010001418] = 5adc28776ff45bba
!	Mem[0000000010081410] = f033040c, %l1 = f6000580207924c3
	swapa	[%i2+%o5]0x88,%l1	! %l1 = 00000000f033040c
!	%l1 = 00000000f033040c, Mem[0000000030101410] = c0361918
	stba	%l1,[%i4+%o5]0x89	! Mem[0000000030101410] = c036190c
!	%l6 = 4a697d72, %l7 = 0000005e, Mem[00000000300c1408] = d6805e2a 3c9d31ce
	stda	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 4a697d72 0000005e
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 4e3afc72, %l4 = 000000000000ff03
	lduh	[%i4+0x002],%l4		! %l4 = 000000000000fc72

p0_label_15:
!	Mem[00000000100c1408] = 0000004d, %l3 = 0000000000002861
	lduha	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081408] = ff97020d7119b5cf, %f0  = bb40e2f3 223ebaf9
	ldda	[%i2+%o4]0x81,%f0 	! %f0  = ff97020d 7119b5cf
!	Mem[00000000300c1400] = 1abcca59, %l4 = 000000000000fc72
	lduba	[%i3+%g0]0x81,%l4	! %l4 = 000000000000001a
!	Mem[0000000010181408] = f7ccb635bbbdc0cb, %f10 = 63d2ad98 b4103e19
	ldda	[%i6+%o4]0x88,%f10	! %f10 = f7ccb635 bbbdc0cb
!	Mem[0000000010001408] = ec8e623e, %l5 = 000000000000aaff
	lduwa	[%i0+%o4]0x88,%l5	! %l5 = 00000000ec8e623e
!	Mem[0000000010181408] = cbc0bdbb, %f21 = da8f2695
	lda	[%i6+%o4]0x80,%f21	! %f21 = cbc0bdbb
!	Mem[0000000021800140] = 19ea9645, %l6 = 000000004a697d72
	lduha	[%o3+0x140]%asi,%l6	! %l6 = 00000000000019ea
!	Mem[0000000030081408] = ff97020d7119b5cf, %f26 = 7daf2ca7 a924ff12
	ldda	[%i2+%o4]0x81,%f26	! %f26 = ff97020d 7119b5cf
!	%f17 = 0000000c, %f1  = 7119b5cf
	fcmpes	%fcc3,%f17,%f1 		! %fcc3 = 1
!	Starting 10 instruction Store Burst
!	%f0  = ff97020d 7119b5cf ba5bf46f 77e7dc0f
!	%f4  = 0c0433f0 22fb4faa b857bea6 c0361918
!	%f8  = b14ef534 5475cac2 f7ccb635 bbbdc0cb
!	%f12 = 7816c52b 458e4d03 72fc3a4e 71368f33
	stda	%f0,[%i0]ASI_BLK_P	! Block Store to 0000000010001400

p0_label_16:
!	Mem[00000000300c1410] = 983c28ff, %l0 = 3b221790740f11fa
	ldstuba	[%i3+%o5]0x89,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030181400] = 47075c3a, %l0 = 00000000000000ff
	ldstuba	[%i6+%g0]0x89,%l0	! %l0 = 0000003a000000ff
!	%l0 = 0000003a, %l1 = f033040c, Mem[0000000010001410] = f033040c aa4ffb22
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000003a f033040c
!	Mem[0000000010101420] = 00005e97, %l5 = 00000000ec8e623e
	swap	[%i4+0x020],%l5		! %l5 = 0000000000005e97
!	%l7 = 000000000000005e, Mem[0000000020800000] = 23268841, %asi = 80
	stha	%l7,[%o1+0x000]%asi	! Mem[0000000020800000] = 005e8841
!	%l4 = 000000000000001a, imm = 00000000000007e3, %l3 = 0000000000000000
	xnor	%l4,0x7e3,%l3		! %l3 = fffffffffffff806
!	%l1 = 00000000f033040c, Mem[0000000010101408] = dbf5e0ff
	stwa	%l1,[%i4+%o4]0x88	! Mem[0000000010101408] = f033040c
!	%f16 = 00000000 0000000c, Mem[0000000030181410] = 00000000 b6350000
	stda	%f16,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000 0000000c
!	%l6 = 000019ea, %l7 = 0000005e, Mem[0000000010141400] = 260a82b4 05979da6
	stda	%l6,[%i5+0x000]%asi	! Mem[0000000010141400] = 000019ea 0000005e
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 4a697d72, %l5 = 0000000000005e97
	ldswa	[%i3+%o4]0x81,%l5	! %l5 = 000000004a697d72

p0_label_17:
!	Mem[00000000100c1408] = 0000004d, %l0 = 000000000000003a
	ldswa	[%i3+%o4]0x80,%l0	! %l0 = 000000000000004d
!	Mem[00000000100c1410] = 6cc8166b, %f26 = ff97020d
	lda	[%i3+%o5]0x80,%f26	! %f26 = 6cc8166b
!	Mem[00000000300c1408] = 727d694a, %l2 = 0000000072fc3a4e
	lduha	[%i3+%o4]0x89,%l2	! %l2 = 000000000000694a
!	Mem[00000000100c141c] = 89310ee0, %l2 = 000000000000694a
	ldsba	[%i3+0x01e]%asi,%l2	! %l2 = 000000000000000e
!	Mem[0000000030081408] = 0d0297ff, %l7 = 000000000000005e
	lduwa	[%i2+%o4]0x89,%l7	! %l7 = 000000000d0297ff
!	%f31 = c94fafea, %f30 = fa8abe3f
	fcmps	%fcc3,%f31,%f30		! %fcc3 = 2
!	Mem[0000000030181400] = 1e6a5f1547075cff, %f18 = f0010000 b4103e19
	ldda	[%i6+%g0]0x89,%f18	! %f18 = 1e6a5f15 47075cff
!	Mem[0000000010101410] = 22e9d437, %l7 = 000000000d0297ff
	lduha	[%i4+%o5]0x80,%l7	! %l7 = 00000000000022e9
!	Mem[0000000010081408] = 5475cac2, %l2 = 000000000000000e
	ldsha	[%i2+%o4]0x80,%l2	! %l2 = 0000000000005475
!	Starting 10 instruction Store Burst
!	%f18 = 1e6a5f15 47075cff, %l0 = 000000000000004d
!	Mem[0000000030081430] = e31a76935e4060ac
	add	%i2,0x030,%g1
	stda	%f18,[%g1+%l0]ASI_PST8_S ! Mem[0000000030081430] = e36a7693470760ff

p0_label_18:
!	%f26 = 6cc8166b, Mem[0000000030141410] = b80b41e3
	sta	%f26,[%i5+%o5]0x89	! Mem[0000000030141410] = 6cc8166b
!	%l0 = 000000000000004d, Mem[0000000010101438] = 439f6a16, %asi = 80
	stwa	%l0,[%i4+0x038]%asi	! Mem[0000000010101438] = 0000004d
!	%l2 = 0000000000005475, Mem[0000000010181400] = 011090137dd18c90
	stx	%l2,[%i6+%g0]		! Mem[0000000010181400] = 0000000000005475
!	Mem[0000000010101420] = ec8e623e, %l1 = f033040c, %l4 = 0000001a
	add	%i4,0x20,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 00000000ec8e623e
!	Mem[00000000211c0000] = c08896d7, %l4 = 00000000ec8e623e
	ldstub	[%o2+%g0],%l4		! %l4 = 000000c0000000ff
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010001430] = 7816c52b, %l4 = 00000000000000c0, %asi = 80
	swapa	[%i0+0x030]%asi,%l4	! %l4 = 000000007816c52b
!	%l4 = 000000007816c52b, Mem[00000000300c1410] = ff283c98
	stba	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 2b283c98
!	Mem[0000000010181410] = e31a7693, %l5 = 000000004a697d72
	ldstuba	[%i6+%o5]0x80,%l5	! %l5 = 000000e3000000ff
!	Mem[0000000010081400] = 00000000, %l1 = 00000000f033040c
	ldstuba	[%i2+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 181936c0a6be57b8, %f18 = 1e6a5f15 47075cff
	ldda	[%i2+%o5]0x81,%f18	! %f18 = 181936c0 a6be57b8

p0_label_19:
!	Mem[0000000010101410] = 22e9d437, %l3 = fffffffffffff806
	lduba	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000022
!	Mem[0000000030001408] = b884ad4e, %f15 = 71368f33
	lda	[%i0+%o4]0x81,%f15	! %f15 = b884ad4e
!	Mem[0000000010001408] = ba5bf46f, %l6 = 00000000000019ea
	ldsba	[%i0+%o4]0x80,%l6	! %l6 = ffffffffffffffba
!	Mem[00000000201c0000] = aaff4531, %l5 = 00000000000000e3
	ldub	[%o0+0x001],%l5		! %l5 = 00000000000000ff
!	Mem[00000000300c1408] = 4a697d720000005e, %l7 = 00000000000022e9
	ldxa	[%i3+%o4]0x81,%l7	! %l7 = 4a697d720000005e
!	Mem[00000000300c1400] = 59cabc1a, %l3 = 0000000000000022
	lduwa	[%i3+%g0]0x89,%l3	! %l3 = 0000000059cabc1a
!	Mem[0000000030041400] = 01f0cd6b, %l7 = 4a697d720000005e
	lduwa	[%i1+%g0]0x81,%l7	! %l7 = 0000000001f0cd6b
!	Mem[000000001000142c] = bbbdc0cb, %l2 = 0000000000005475
	ldsw	[%i0+0x02c],%l2		! %l2 = ffffffffbbbdc0cb
!	%l2 = ffffffffbbbdc0cb, %l6 = ffffffffffffffba, %l1 = 0000000000000000
	orn	%l2,%l6,%l1		! %l1 = ffffffffbbbdc0cf
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffbbbdc0cf, Mem[0000000010081400] = ff0000000000aa3a
	stx	%l1,[%i2+%g0]		! Mem[0000000010081400] = ffffffffbbbdc0cf

p0_label_20:
!	Mem[0000000010081400] = ffffffff, %l6 = ffffffffffffffba
	swapa	[%i2+%g0]0x88,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000010141428] = f8ffa1e2, %l5 = 00000000000000ff
	swap	[%i5+0x028],%l5		! %l5 = 00000000f8ffa1e2
!	%f30 = fa8abe3f, Mem[0000000010041408] = 2541adbf
	sta	%f30,[%i1+%o4]0x88	! Mem[0000000010041408] = fa8abe3f
!	Mem[0000000010181408] = cbc0bdbb, %l4 = 000000007816c52b
	swapa	[%i6+%o4]0x80,%l4	! %l4 = 00000000cbc0bdbb
!	%l0 = 0000004d, %l1 = bbbdc0cf, Mem[0000000030181408] = 60000001 ffffc0cb
	stda	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000004d bbbdc0cf
!	Mem[0000000030181408] = 4d000000, %l2 = ffffffffbbbdc0cb
	ldstuba	[%i6+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001400] = 74ff3bff, %l3 = 0000000059cabc1a
	ldstuba	[%i0+%g0]0x89,%l3	! %l3 = 000000ff000000ff
!	%l1 = ffffffffbbbdc0cf, Mem[00000000100c143e] = e8603558, %asi = 80
	stha	%l1,[%i3+0x03e]%asi	! Mem[00000000100c143c] = e860c0cf
!	Mem[0000000030181410] = 0000000c, %l3 = 00000000000000ff
	swapa	[%i6+%o5]0x89,%l3	! %l3 = 000000000000000c
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 6b16c86c, %l7 = 0000000001f0cd6b
	lduba	[%i5+%o5]0x81,%l7	! %l7 = 000000000000006b

p0_label_21:
!	Mem[0000000030181408] = ff00004d, %l5 = 00000000f8ffa1e2
	lduba	[%i6+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1418] = d1d6f9f7, %l3 = 000000000000000c
	lduw	[%i3+0x018],%l3		! %l3 = 00000000d1d6f9f7
!	Mem[0000000030141400] = 000000000000000c, %f30 = fa8abe3f c94fafea
	ldda	[%i5+%g0]0x81,%f30	! %f30 = 00000000 0000000c
!	Mem[00000000100c1420] = f51e45aa, %l3 = 00000000d1d6f9f7
	lduwa	[%i3+0x020]%asi,%l3	! %l3 = 00000000f51e45aa
!	Mem[0000000010101410] = 22e9d437, %f12 = 7816c52b
	lda	[%i4+%o5]0x80,%f12	! %f12 = 22e9d437
!	Mem[0000000010001400] = ff97020d, %l2 = 0000000000000000
	ldsha	[%i0+%g0]0x80,%l2	! %l2 = ffffffffffffff97
!	Mem[00000000100c1400] = 0000ff03, %l4 = 00000000cbc0bdbb
	lduba	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041408] = 0000aa3a, %l7 = 000000000000006b
	lduba	[%i1+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041400] = 5a9b2861, %l2 = ffffffffffffff97
	ldsha	[%i1+%g0]0x80,%l2	! %l2 = 0000000000005a9b
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 0c1936c0, %l4 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l4	! %l4 = 0000000c000000ff

p0_label_22:
!	%l3 = 00000000f51e45aa, Mem[0000000010041410] = 26000063
	stba	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = aa000063
!	%f24 = 64a1d6cb 339398c5, Mem[0000000030141408] = c2ca7554 b4103e19
	stda	%f24,[%i5+%o4]0x81	! Mem[0000000030141408] = 64a1d6cb 339398c5
!	Mem[0000000021800080] = a0424727, %l0 = 000000000000004d
	ldstuba	[%o3+0x080]%asi,%l0	! %l0 = 000000a0000000ff
!	%f4  = 0c0433f0 22fb4faa, Mem[0000000010101400] = 4e3afc72 8e227543
	stda	%f4 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 0c0433f0 22fb4faa
!	%l4 = 000000000000000c, immd = 0000000000000bd3, %l2  = 0000000000005a9b
	mulx	%l4,0xbd3,%l2		! %l2 = 0000000000008de4
!	Mem[0000000021800080] = ff424727, %l2 = 0000000000008de4
	ldstub	[%o3+0x080],%l2		! %l2 = 000000ff000000ff
!	%l3 = 00000000f51e45aa, imm = fffffffffffff638, %l7 = 0000000000000000
	sub	%l3,-0x9c8,%l7		! %l7 = 00000000f51e4f72
!	%f10 = f7ccb635 bbbdc0cb, Mem[0000000010181408] = 2bc51678 f7ccb635
	stda	%f10,[%i6+%o4]0x88	! Mem[0000000010181408] = f7ccb635 bbbdc0cb
!	%f6  = b857bea6 c0361918, Mem[0000000010081410] = c3247920 22fb4faa
	stda	%f6 ,[%i2+%o5]0x80	! Mem[0000000010081410] = b857bea6 c0361918
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = cc4b99c1, %l1 = ffffffffbbbdc0cf
	lduha	[%i1+%o5]0x89,%l1	! %l1 = 00000000000099c1

p0_label_23:
!	Mem[0000000010041400] = 61289b5a, %f12 = 22e9d437
	lda	[%i1+%g0]0x88,%f12	! %f12 = 61289b5a
!	Mem[0000000010041410] = 630000aa, %f29 = e6a17139
	lda	[%i1+%o5]0x88,%f29	! %f29 = 630000aa
!	Mem[0000000030101400] = 5c3db8e0, %l0 = 00000000000000a0
	lduwa	[%i4+%g0]0x89,%l0	! %l0 = 000000005c3db8e0
!	Mem[0000000030081410] = b857bea6c0361918, %f24 = 64a1d6cb 339398c5
	ldda	[%i2+%o5]0x89,%f24	! %f24 = b857bea6 c0361918
!	Mem[0000000010001410] = 3a0000000c0433f0, %l0 = 000000005c3db8e0
	ldxa	[%i0+%o5]0x80,%l0	! %l0 = 3a0000000c0433f0
!	Mem[00000000300c1410] = 2b283c98, %l0 = 3a0000000c0433f0
	ldsha	[%i3+%o5]0x81,%l0	! %l0 = 0000000000002b28
!	Mem[00000000100c1408] = 4d000000, %f19 = a6be57b8
	lda	[%i3+%o4]0x88,%f19	! %f19 = 4d000000
!	Mem[0000000010141400] = 000019ea0000005e, %l6 = 00000000ffffffff
	ldxa	[%i5+%g0]0x80,%l6	! %l6 = 000019ea0000005e
!	Mem[0000000010001434] = 458e4d03, %f27 = 7119b5cf
	lda	[%i0+0x034]%asi,%f27	! %f27 = 458e4d03
!	Starting 10 instruction Store Burst
!	%f14 = 72fc3a4e b884ad4e, Mem[0000000010101408] = 0c0433f0 1b661252
	stda	%f14,[%i4+%o4]0x80	! Mem[0000000010101408] = 72fc3a4e b884ad4e

p0_label_24:
!	Mem[0000000030141410] = 6b16c86c, %l4 = 000000000000000c
	swapa	[%i5+%o5]0x81,%l4	! %l4 = 000000006b16c86c
!	%l0 = 0000000000002b28, imm = 0000000000000812, %l6 = 000019ea0000005e
	or	%l0,0x812,%l6		! %l6 = 0000000000002b3a
!	%f22 = a3561e6a 4ead84b8, %l5 = 00000000000000ff
!	Mem[0000000010141420] = 634cbe627403a049
	add	%i5,0x020,%g1
	stda	%f22,[%g1+%l5]ASI_PST8_P ! Mem[0000000010141420] = a3561e6a4ead84b8
!	%l7 = 00000000f51e4f72, Mem[0000000010001410] = 3a000000
	stba	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = 72000000
!	%f14 = 72fc3a4e, %f15 = b884ad4e
	fcmpes	%fcc2,%f14,%f15		! %fcc2 = 2
!	%f4  = 0c0433f0, Mem[0000000010181408] = bbbdc0cb
	sta	%f4 ,[%i6+%o4]0x88	! Mem[0000000010181408] = 0c0433f0
!	Mem[0000000030081410] = c0361918, %l1 = 00000000000099c1
	swapa	[%i2+%o5]0x89,%l1	! %l1 = 00000000c0361918
!	%l6 = 00002b3a, %l7 = f51e4f72, Mem[0000000010181408] = f033040c 35b6ccf7
	stda	%l6,[%i6+0x008]%asi	! Mem[0000000010181408] = 00002b3a f51e4f72
!	%f13 = 458e4d03, Mem[0000000030181408] = 4d0000ff
	sta	%f13,[%i6+%o4]0x89	! Mem[0000000030181408] = 458e4d03
!	Starting 10 instruction Load Burst
!	%l6 = 0000000000002b3a, imm = 0000000000000025, %l4 = 000000006b16c86c
	xnor	%l6,0x025,%l4		! %l4 = ffffffffffffd4e0

p0_label_25:
!	Mem[00000000211c0000] = ff8896d7, %l3 = 00000000f51e45aa
	ldsh	[%o2+%g0],%l3		! %l3 = ffffffffffffff88
!	Mem[0000000020800040] = 28610070, %l2 = 00000000000000ff
	ldsha	[%o1+0x040]%asi,%l2	! %l2 = 0000000000002861
!	Mem[0000000030081400] = c5f088ff, %l7 = 00000000f51e4f72
	lduwa	[%i2+%g0]0x89,%l7	! %l7 = 00000000c5f088ff
!	Mem[0000000010081400] = cfc0bdbb ffffffba, %l0 = 00002b28, %l1 = c0361918
	ldda	[%i2+%g0]0x88,%l0	! %l0 = 00000000ffffffba 00000000cfc0bdbb
!	Mem[0000000010041400] = 5a9b2861, %l1 = 00000000cfc0bdbb
	lduha	[%i1+%g0]0x80,%l1	! %l1 = 0000000000005a9b
!	Mem[0000000030181400] = ff5c0747, %f18 = 181936c0
	lda	[%i6+%g0]0x81,%f18	! %f18 = ff5c0747
!	Mem[0000000030081408] = cfb51971 0d0297ff, %l4 = ffffd4e0, %l5 = 000000ff
	ldda	[%i2+%o4]0x89,%l4	! %l4 = 000000000d0297ff 00000000cfb51971
!	Mem[0000000010101410] = 22e9d437, %l0 = 00000000ffffffba
	lduha	[%i4+%o5]0x80,%l0	! %l0 = 00000000000022e9
!	Mem[0000000030101408] = 136299233b7d6197, %f30 = 00000000 0000000c
	ldda	[%i4+%o4]0x89,%f30	! %f30 = 13629923 3b7d6197
!	Starting 10 instruction Store Burst
!	%l4 = 000000000d0297ff, Mem[0000000010181430] = c9805a01, %asi = 80
	stba	%l4,[%i6+0x030]%asi	! Mem[0000000010181430] = ff805a01

p0_label_26:
!	%f25 = c0361918, Mem[00000000100c1408] = 0000004d
	sta	%f25,[%i3+%o4]0x80	! Mem[00000000100c1408] = c0361918
!	Mem[0000000010101400] = 0c0433f0, %l2 = 0000000000002861
	swapa	[%i4+%g0]0x80,%l2	! %l2 = 000000000c0433f0
!	Mem[0000000010101410] = 22e9d437, %l6 = 0000000000002b3a
	swapa	[%i4+%o5]0x80,%l6	! %l6 = 0000000022e9d437
!	%f26 = 6cc8166b 458e4d03, Mem[0000000010141410] = 6acc6a68 c3ea8252
	stda	%f26,[%i5+0x010]%asi	! Mem[0000000010141410] = 6cc8166b 458e4d03
!	%f11 = bbbdc0cb, Mem[0000000010041410] = 630000aa
	sta	%f11,[%i1+%o5]0x88	! Mem[0000000010041410] = bbbdc0cb
!	%l3 = ffffffffffffff88, %l4 = 000000000d0297ff, %l0 = 00000000000022e9
	andn	%l3,%l4,%l0		! %l0 = fffffffff2fd6800
!	Mem[00000000100c1400] = 03ff0000, %l1 = 0000000000005a9b
	swapa	[%i3+%g0]0x88,%l1	! %l1 = 0000000003ff0000
!	%l4 = 000000000d0297ff, Mem[0000000010081400] = ffffffba
	stha	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = ffff97ff
!	%f28 = c59c80f6 630000aa, Mem[00000000100c1400] = 9b5a0000 ea23f0d1
	stda	%f28,[%i3+%g0]0x80	! Mem[00000000100c1400] = c59c80f6 630000aa
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 6cc8166b, %l2 = 000000000c0433f0
	ldsha	[%i3+%o5]0x80,%l2	! %l2 = 0000000000006cc8

p0_label_27:
!	Mem[0000000010001438] = 72fc3a4e, %l7 = 00000000c5f088ff
	ldsba	[%i0+0x039]%asi,%l7	! %l7 = fffffffffffffffc
!	Mem[0000000010001410] = 00000072, %f0  = ff97020d
	lda	[%i0+%o5]0x88,%f0 	! %f0 = 00000072
!	Mem[000000001008140c] = b4103e19, %l4 = 000000000d0297ff
	ldswa	[%i2+0x00c]%asi,%l4	! %l4 = ffffffffb4103e19
!	Mem[0000000010141400] = 000019ea, %l6 = 0000000022e9d437
	ldsba	[%i5+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181414] = 5e40dc05, %l3 = ffffffffffffff88
	lduh	[%i6+0x016],%l3		! %l3 = 000000000000dc05
!	Mem[0000000010081408] = 5475cac2, %l3 = 000000000000dc05
	lduba	[%i2+%o4]0x80,%l3	! %l3 = 0000000000000054
!	Mem[0000000030101400] = 5c3db8e0, %l7 = fffffffffffffffc
	ldswa	[%i4+%g0]0x89,%l7	! %l7 = 000000005c3db8e0
!	Mem[0000000030041400] = 6bcdf001, %l3 = 0000000000000054
	ldswa	[%i1+%g0]0x89,%l3	! %l3 = 000000006bcdf001
!	Mem[0000000010181400] = 00000000, %l5 = 00000000cfb51971
	ldsha	[%i6+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 4ead84b8, %l6 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l6	! %l6 = 000000b8000000ff

p0_label_28:
!	%f12 = 61289b5a 458e4d03, %l5 = 0000000000000000
!	Mem[0000000030041410] = c1994bccdeb30a5c
	add	%i1,0x010,%g1
	stda	%f12,[%g1+%l5]ASI_PST8_S ! Mem[0000000030041410] = c1994bccdeb30a5c
!	Mem[00000000300c1410] = 2b283c98, %l1 = 0000000003ff0000
	swapa	[%i3+%o5]0x81,%l1	! %l1 = 000000002b283c98
!	Mem[0000000010001408] = ba5bf46f, %l2 = 0000000000006cc8
	ldstuba	[%i0+%o4]0x80,%l2	! %l2 = 000000ba000000ff
!	%l0 = fffffffff2fd6800, Mem[0000000010101438] = 0000004d, %asi = 80
	stha	%l0,[%i4+0x038]%asi	! Mem[0000000010101438] = 6800004d
!	%l7 = 000000005c3db8e0, immd = fffffffffffff288, %l2 = 00000000000000ba
	udivx	%l7,-0xd78,%l2		! %l2 = 0000000000000000
!	%l6 = 000000b8, %l7 = 5c3db8e0, Mem[0000000010081400] = ffff97ff cfc0bdbb
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000b8 5c3db8e0
!	%l4 = ffffffffb4103e19, Mem[00000000100c140b] = c0361918, %asi = 80
	stba	%l4,[%i3+0x00b]%asi	! Mem[00000000100c1408] = c0361919
!	Mem[0000000010041424] = f83b6076, %l5 = 0000000000000000
	swap	[%i1+0x024],%l5		! %l5 = 00000000f83b6076
!	%l7 = 000000005c3db8e0, Mem[00000000100c1430] = 49aa13e3, %asi = 80
	stba	%l7,[%i3+0x030]%asi	! Mem[00000000100c1430] = e0aa13e3
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff8896d7, %l2 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 000000000000ff88

p0_label_29:
!	Mem[0000000030141410] = 0000000c, %f21 = cbc0bdbb
	lda	[%i5+%o5]0x81,%f21	! %f21 = 0000000c
!	Mem[0000000010041408] = fa8abe3f, %l2 = 000000000000ff88
	ldsha	[%i1+%o4]0x88,%l2	! %l2 = ffffffffffffbe3f
!	Mem[00000000300c1408] = 727d694a, %l5 = 00000000f83b6076
	lduha	[%i3+%o4]0x89,%l5	! %l5 = 000000000000694a
!	Mem[0000000010101400] = aa4ffb2261280000, %l0 = fffffffff2fd6800
	ldxa	[%i4+%g0]0x88,%l0	! %l0 = aa4ffb2261280000
!	Mem[00000000300c1410] = 121d93880000ff03, %l5 = 000000000000694a
	ldxa	[%i3+%o5]0x89,%l5	! %l5 = 121d93880000ff03
!	Mem[00000000300c1410] = 03ff0000, %l1 = 000000002b283c98
	ldsba	[%i3+%o5]0x81,%l1	! %l1 = 0000000000000003
!	Mem[0000000010041414] = 66d69c89, %l0 = aa4ffb2261280000
	lduha	[%i1+0x016]%asi,%l0	! %l0 = 0000000000009c89
!	Mem[0000000010001400] = 0d0297ff, %l3 = 000000006bcdf001
	ldswa	[%i0+%g0]0x88,%l3	! %l3 = 000000000d0297ff
!	Mem[000000001004142c] = d564900b, %l3 = 000000000d0297ff
	lduba	[%i1+0x02e]%asi,%l3	! %l3 = 0000000000000090
!	Starting 10 instruction Store Burst
!	%f31 = 3b7d6197, Mem[00000000300c1400] = 1abcca59
	sta	%f31,[%i3+%g0]0x81	! Mem[00000000300c1400] = 3b7d6197

p0_label_30:
!	Mem[0000000010101400] = 61280000, %l1 = 0000000000000003
	swapa	[%i4+%g0]0x88,%l1	! %l1 = 0000000061280000
!	%f0  = 00000072 7119b5cf, Mem[0000000030181410] = 000000ff 00000000
	stda	%f0 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000072 7119b5cf
!	%f2  = ba5bf46f 77e7dc0f, %l6 = 00000000000000b8
!	Mem[0000000010101428] = d68ff21c56712eba
	add	%i4,0x028,%g1
	stda	%f2,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010101428] = d68ff21c56712eba
!	Mem[00000000211c0000] = ff8896d7, %l4 = ffffffffb4103e19
	ldstub	[%o2+%g0],%l4		! %l4 = 000000ff000000ff
!	Mem[00000000100c1400] = f6809cc5, %l7 = 000000005c3db8e0
	swapa	[%i3+%g0]0x88,%l7	! %l7 = 00000000f6809cc5
!	Mem[0000000010141430] = 7c79eee4, %l1 = 0000000061280000, %asi = 80
	swapa	[%i5+0x030]%asi,%l1	! %l1 = 000000007c79eee4
!	%l4 = 00000000000000ff, immed = 000009f6, %y  = 00000000
	smul	%l4,0x9f6,%l5		! %l5 = 000000000009ec0a, %y = 00000000
!	%l6 = 00000000000000b8, Mem[0000000030141400] = 00000000
	stba	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = b8000000
!	%f11 = bbbdc0cb, Mem[0000000030081408] = 0d0297ff
	sta	%f11,[%i2+%o4]0x89	! Mem[0000000030081408] = bbbdc0cb
!	Starting 10 instruction Load Burst
!	Mem[0000000010101404] = 22fb4faa, %l2 = ffffffffffffbe3f
	lduwa	[%i4+0x004]%asi,%l2	! %l2 = 0000000022fb4faa

p0_label_31:
!	Mem[0000000010141408] = 03ff8e45, %l1 = 000000007c79eee4
	ldsha	[%i5+%o4]0x80,%l1	! %l1 = 00000000000003ff
!	%l1 = 00000000000003ff, imm = fffffffffffffd49, %l7 = 00000000f6809cc5
	andn	%l1,-0x2b7,%l7		! %l7 = 00000000000002b6
!	Mem[0000000030141410] = 0000000c, %l1 = 00000000000003ff
	ldsha	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = ff97020d, %f24 = b857bea6
	lda	[%i0+%g0]0x80,%f24	! %f24 = ff97020d
!	%f15 = b884ad4e, %f30 = 13629923
	fsqrts	%f15,%f30		! %f30 = 7fffffff
!	%l1 = 0000000000000000, imm = fffffffffffffaca, %l5 = 000000000009ec0a
	andn	%l1,-0x536,%l5		! %l5 = 0000000000000000
!	Mem[0000000030081410] = b857bea6 000099c1, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 00000000000099c1 00000000b857bea6
!	Mem[00000000211c0000] = ff8896d7, %l0 = 0000000000009c89
	lduha	[%o2+0x000]%asi,%l0	! %l0 = 000000000000ff88
!	%f10 = f7ccb635, %f3  = 77e7dc0f
	fcmpes	%fcc1,%f10,%f3 		! %fcc1 = 1
!	Starting 10 instruction Store Burst
!	Mem[000000001014142b] = 000000ff, %l6 = 00000000000000b8
	ldstuba	[%i5+0x02b]%asi,%l6	! %l6 = 000000ff000000ff

p0_label_32:
!	Mem[0000000030141400] = b8000000, %l5 = 00000000b857bea6
	ldstuba	[%i5+%g0]0x81,%l5	! %l5 = 000000b8000000ff
!	Mem[0000000030141400] = ff000000, %l7 = 00000000000002b6
	ldstuba	[%i5+%g0]0x81,%l7	! %l7 = 000000ff000000ff
!	%l5 = 00000000000000b8, Mem[0000000030101408] = 97617d3b23996213
	stxa	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000000000b8
!	%l6 = 00000000000000ff, Mem[0000000010101424] = 2898f93c, %asi = 80
	stwa	%l6,[%i4+0x024]%asi	! Mem[0000000010101424] = 000000ff
!	%f30 = 7fffffff 3b7d6197, Mem[0000000010001430] = 000000c0 458e4d03
	stda	%f30,[%i0+0x030]%asi	! Mem[0000000010001430] = 7fffffff 3b7d6197
!	%l4 = 000099c1, %l5 = 000000b8, Mem[0000000010141410] = 6b16c86c 034d8e45
	stda	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 000099c1 000000b8
!	%l6 = 00000000000000ff, Mem[0000000010081400] = 000000b8
	stwa	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff
!	%f28 = c59c80f6 630000aa, Mem[0000000010181400] = 00000000 00005475
	stda	%f28,[%i6+0x000]%asi	! Mem[0000000010181400] = c59c80f6 630000aa
!	%l5 = 00000000000000b8, Mem[00000000300c1410] = 03ff000088931d12
	stxa	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000000000b8
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = cfb51971, %f24 = ff97020d
	lda	[%i6+%o5]0x81,%f24	! %f24 = cfb51971

p0_label_33:
!	Mem[0000000010041408] = 3fbe8afa, %l0 = 000000000000ff88
	lduba	[%i1+%o4]0x80,%l0	! %l0 = 000000000000003f
!	Mem[0000000010001420] = b14ef534, %l7 = 00000000000000ff
	ldub	[%i0+0x021],%l7		! %l7 = 000000000000004e
!	Mem[0000000010141400] = ea190000, %l5 = 00000000000000b8
	lduba	[%i5+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101430] = b6bfb931, %l7 = 000000000000004e
	lduw	[%i4+0x030],%l7		! %l7 = 00000000b6bfb931
!	Mem[0000000030101400] = e0b83d5c, %l3 = 0000000000000090
	ldswa	[%i4+%g0]0x81,%l3	! %l3 = ffffffffe0b83d5c
!	Mem[0000000010001410] = 00000072, %l4 = 00000000000099c1
	ldsba	[%i0+%o5]0x88,%l4	! %l4 = 0000000000000072
!	Mem[0000000021800000] = d9df9cd4, %l6 = 00000000000000ff
	lduha	[%o3+0x000]%asi,%l6	! %l6 = 000000000000d9df
!	Mem[0000000010181408] = 724f1ef53a2b0000, %l1 = 0000000000000000
	ldxa	[%i6+%o4]0x88,%l1	! %l1 = 724f1ef53a2b0000
!	Mem[0000000020800040] = 28610070, %l4 = 0000000000000072
	ldub	[%o1+0x041],%l4		! %l4 = 0000000000000061
!	Starting 10 instruction Store Burst
!	%f28 = c59c80f6 630000aa, Mem[0000000030081400] = ff88f0c5 580a6ff4
	stda	%f28,[%i2+%g0]0x81	! Mem[0000000030081400] = c59c80f6 630000aa

p0_label_34:
!	%f17 = 0000000c, Mem[00000000300c1410] = 00000000
	sta	%f17,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000000c
!	Mem[00000000300c1410] = 0000000c, %l4 = 0000000000000061
	ldstuba	[%i3+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%l0 = 000000000000003f, Mem[0000000010141400] = ea190000
	stha	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = ea19003f
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010181408] = 00002b3a f51e4f72
	stda	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 00000000
!	%f20 = 34410bb8 0000000c, %l4 = 0000000000000000
!	Mem[0000000030141410] = 0000000cda8f2695
	add	%i5,0x010,%g1
	stda	%f20,[%g1+%l4]ASI_PST32_S ! Mem[0000000030141410] = 0000000cda8f2695
!	Mem[0000000030081400] = c59c80f6, %l4 = 0000000000000000
	ldstuba	[%i2+%g0]0x81,%l4	! %l4 = 000000c5000000ff
!	%f18 = ff5c0747 4d000000, Mem[0000000010101400] = 03000000 22fb4faa
	stda	%f18,[%i4+%g0]0x80	! Mem[0000000010101400] = ff5c0747 4d000000
!	%l6 = 000000000000d9df, Mem[0000000010181400] = c59c80f6630000aa
	stxa	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000000000d9df
!	Mem[0000000030041400] = 6bcdf001, %l5 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l5	! %l5 = 00000001000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = aa000063f6809cff, %l4 = 00000000000000c5
	ldxa	[%i2+%g0]0x89,%l4	! %l4 = aa000063f6809cff

p0_label_35:
!	Mem[00000000300c1410] = b8000000 0c0000ff, %l4 = f6809cff, %l5 = 00000001
	ldda	[%i3+%o5]0x89,%l4	! %l4 = 000000000c0000ff 00000000b8000000
!	Mem[00000000211c0000] = ff8896d7, %l3 = ffffffffe0b83d5c
	lduha	[%o2+0x000]%asi,%l3	! %l3 = 000000000000ff88
!	Mem[0000000030001408] = ff84ad4e, %l0 = 000000000000003f
	lduwa	[%i0+%o4]0x81,%l0	! %l0 = 00000000ff84ad4e
!	%l6 = 000000000000d9df, %l7 = 00000000b6bfb931, %l1 = 724f1ef53a2b0000
	or	%l6,%l7,%l1		! %l1 = 00000000b6bff9ff
!	Mem[0000000030181408] = 034d8e45, %l5 = 00000000b8000000
	lduba	[%i6+%o4]0x81,%l5	! %l5 = 0000000000000003
!	Mem[0000000010101410] = 00002b3a, %f2  = ba5bf46f
	lda	[%i4+%o5]0x80,%f2 	! %f2 = 00002b3a
!	Mem[000000001000141c] = c0361918, %l4 = 000000000c0000ff
	ldsh	[%i0+0x01e],%l4		! %l4 = 0000000000001918
!	Mem[00000000211c0000] = ff8896d7, %l0 = 00000000ff84ad4e
	lduh	[%o2+%g0],%l0		! %l0 = 000000000000ff88
!	Mem[0000000030181410] = 000000727119b5cf, %l0 = 000000000000ff88
	ldxa	[%i6+%o5]0x89,%l0	! %l0 = 000000727119b5cf
!	Starting 10 instruction Store Burst
!	%f1  = 7119b5cf, Mem[00000000100c1404] = 630000aa
	sta	%f1 ,[%i3+0x004]%asi	! Mem[00000000100c1404] = 7119b5cf

p0_label_36:
!	%l1 = 00000000b6bff9ff, Mem[0000000030141408] = cbd6a164
	stba	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = cbd6a1ff
!	Mem[0000000030101408] = 00000000, %l6 = 000000000000d9df
	ldstuba	[%i4+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041408] = 3fbe8afa, %l7 = 00000000b6bfb931
	ldstuba	[%i1+%o4]0x80,%l7	! %l7 = 0000003f000000ff
!	Mem[00000000100c141a] = d1d6f9f7, %l3 = 000000000000ff88
	ldstuba	[%i3+0x01a]%asi,%l3	! %l3 = 000000f9000000ff
!	Mem[0000000030081410] = 000099c1, %l7 = 000000000000003f
	swapa	[%i2+%o5]0x89,%l7	! %l7 = 00000000000099c1
!	Mem[0000000030141408] = ffa1d6cb, %l5 = 0000000000000003
	swapa	[%i5+%o4]0x81,%l5	! %l5 = 00000000ffa1d6cb
!	Mem[0000000010181408] = 00000000, %l2 = 0000000022fb4faa
	ldstuba	[%i6+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%l0 = 000000727119b5cf, Mem[0000000010141400] = 3f0019ea
	stha	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = b5cf19ea
!	%l2 = 0000000000000000, immed = 00000a36, %y  = 00000000
	umul	%l2,0xa36,%l7		! %l7 = 0000000000000000, %y = 00000000
!	Starting 10 instruction Load Burst
!	%l7 = 0000000000000000, imm = fffffffffffffa24, %l1 = 00000000b6bff9ff
	xor	%l7,-0x5dc,%l1		! %l1 = fffffffffffffa24

p0_label_37:
!	Mem[00000000100c1410] = 6cc8166b, %f31 = 3b7d6197
	lda	[%i3+%o5]0x80,%f31	! %f31 = 6cc8166b
!	Mem[0000000010101400] = ff5c0747, %l1 = fffffffffffffa24
	ldsba	[%i4+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000211c0000] = ff8896d7, %l7 = 0000000000000000
	ldsh	[%o2+%g0],%l7		! %l7 = ffffffffffffff88
!	Mem[0000000010181418] = 56f58c35d214d6f1, %l7 = ffffffffffffff88
	ldx	[%i6+0x018],%l7		! %l7 = 56f58c35d214d6f1
!	Mem[0000000010141408] = 03ff8e45, %l6 = 0000000000000000
	lduba	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000003
!	Mem[0000000010141410] = 000000b8000099c1, %l7 = 56f58c35d214d6f1
	ldxa	[%i5+%o5]0x88,%l7	! %l7 = 000000b8000099c1
!	Mem[0000000030081410] = b857bea60000003f, %f0  = 00000072 7119b5cf
	ldda	[%i2+%o5]0x89,%f0 	! %f0  = b857bea6 0000003f
!	%l5 = 00000000ffa1d6cb, %l5 = 00000000ffa1d6cb, %y  = 00000000
	smul	%l5,%l5,%l4		! %l4 = 000022a2498e04f9, %y = 000022a2
!	Mem[0000000030081408] = cbc0bdbb, %f29 = 630000aa
	lda	[%i2+%o4]0x81,%f29	! %f29 = cbc0bdbb
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000003, Mem[0000000010081410] = b857bea6
	stha	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 0003bea6

p0_label_38:
!	Mem[0000000030141408] = 03000000, %l1 = ffffffffffffffff
	swapa	[%i5+%o4]0x89,%l1	! %l1 = 0000000003000000
!	Mem[0000000010101414] = 0e2fcfac, %l6 = 0000000000000003, %asi = 80
	swapa	[%i4+0x014]%asi,%l6	! %l6 = 000000000e2fcfac
!	%l2 = 0000000000000000, Mem[00000000100c1410] = 6b16c86c
	stba	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 6b16c800
!	%l4 = 000022a2498e04f9, Mem[0000000030181410] = 7119b5cf
	stwa	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 498e04f9
!	Mem[000000001000143c] = 71368f33, %f15 = b884ad4e
	ld	[%i0+0x03c],%f15	! %f15 = 71368f33
!	%l7 = 000000b8000099c1, Mem[0000000030041408] = 26aa19ca3aaa0000
	stxa	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000b8000099c1
!	Mem[0000000010041408] = fa8abeff, %l4 = 000022a2498e04f9
	swapa	[%i1+%o4]0x88,%l4	! %l4 = 00000000fa8abeff
!	Mem[0000000010141410] = c1990000, %l6 = 000000000e2fcfac
	swapa	[%i5+%o5]0x80,%l6	! %l6 = 00000000c1990000
!	%l4 = fa8abeff, %l5 = ffa1d6cb, Mem[0000000010081400] = ff000000 e0b83d5c
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = fa8abeff ffa1d6cb
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 74ff3bff, %f19 = 4d000000
	lda	[%i0+%g0]0x89,%f19	! %f19 = 74ff3bff

p0_label_39:
!	Mem[0000000010041400] = 5a9b2861, %l1 = 0000000003000000
	lduha	[%i1+%g0]0x80,%l1	! %l1 = 0000000000005a9b
!	Mem[0000000030181400] = ff5c0747, %l5 = 00000000ffa1d6cb
	ldswa	[%i6+%g0]0x81,%l5	! %l5 = ffffffffff5c0747
!	Mem[0000000030081408] = cbc0bdbb, %l0 = 000000727119b5cf
	lduwa	[%i2+%o4]0x81,%l0	! %l0 = 00000000cbc0bdbb
!	Mem[0000000030001410] = defdddfd21a97586, %l5 = ffffffffff5c0747
	ldxa	[%i0+%o5]0x81,%l5	! %l5 = defdddfd21a97586
!	Mem[0000000010081408] = c2ca7554, %l2 = 0000000000000000
	lduwa	[%i2+%o4]0x88,%l2	! %l2 = 00000000c2ca7554
!	Mem[0000000010001410] = 72000000, %l5 = defdddfd21a97586
	lduwa	[%i0+%o5]0x80,%l5	! %l5 = 0000000072000000
!	Mem[0000000010101428] = d68ff21c56712eba, %f10 = f7ccb635 bbbdc0cb
	ldd	[%i4+0x028],%f10	! %f10 = d68ff21c 56712eba
!	Mem[0000000010101400] = 0000004d47075cff, %f16 = 00000000 0000000c
	ldda	[%i4+%g0]0x88,%f16	! %f16 = 0000004d 47075cff
!	Mem[0000000010081408] = c2ca7554, %l7 = 000000b8000099c1
	lduba	[%i2+%o4]0x88,%l7	! %l7 = 0000000000000054
!	Starting 10 instruction Store Burst
!	%f6  = b857bea6 c0361918, %l3 = 00000000000000f9
!	Mem[0000000030081400] = ff9c80f6630000aa
	stda	%f6,[%i2+%l3]ASI_PST16_S ! Mem[0000000030081400] = b85780f663001918

p0_label_40:
!	Mem[0000000030181408] = 458e4d03, %l6 = 00000000c1990000
	swapa	[%i6+%o4]0x89,%l6	! %l6 = 00000000458e4d03
!	%f8  = b14ef534 5475cac2, Mem[0000000010141400] = ea19cfb5 5e000000
	stda	%f8 ,[%i5+%g0]0x88	! Mem[0000000010141400] = b14ef534 5475cac2
!	Mem[0000000010041400] = 5a9b2861, %l5 = 0000000072000000
	ldstuba	[%i1+%g0]0x80,%l5	! %l5 = 0000005a000000ff
!	Mem[0000000010041402] = ff9b2861, %l3 = 00000000000000f9
	ldstuba	[%i1+0x002]%asi,%l3	! %l3 = 00000028000000ff
!	%l4 = fa8abeff, %l5 = 0000005a, Mem[00000000300c1400] = 97617d3b b49d2cbd
	stda	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = fa8abeff 0000005a
!	Mem[0000000010141410] = 0e2fcfac, %l5 = 000000000000005a
	swapa	[%i5+%o5]0x80,%l5	! %l5 = 000000000e2fcfac
!	%l3 = 0000000000000028, Mem[0000000030181410] = f9048e49
	stba	%l3,[%i6+%o5]0x81	! Mem[0000000030181410] = 28048e49
!	%l0 = cbc0bdbb, %l1 = 00005a9b, Mem[0000000010181420] = 5174c38e 9d7676ae
	std	%l0,[%i6+0x020]		! Mem[0000000010181420] = cbc0bdbb 00005a9b
!	%l1 = 0000000000005a9b, Mem[00000000300c1408] = 727d694a
	stwa	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00005a9b
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 000099c1, %l5 = 000000000e2fcfac
	ldswa	[%i1+%o4]0x89,%l5	! %l5 = 00000000000099c1

p0_label_41:
!	Mem[0000000030041400] = 6bcdf0ff, %f23 = 4ead84b8
	lda	[%i1+%g0]0x89,%f23	! %f23 = 6bcdf0ff
!	Mem[00000000100c1408] = c0361919, %f6  = b857bea6
	lda	[%i3+%o4]0x80,%f6 	! %f6 = c0361919
!	Mem[0000000030181408] = cfc0bdbb c1990000, %l6 = 458e4d03, %l7 = 00000054
	ldda	[%i6+%o4]0x89,%l6	! %l6 = 00000000c1990000 00000000cfc0bdbb
!	Mem[0000000030101408] = ff000000, %l7 = 00000000cfc0bdbb
	ldsba	[%i4+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010141410] = 5a000000, %l7 = ffffffffffffffff
	ldswa	[%i5+%o5]0x88,%l7	! %l7 = 000000005a000000
!	Mem[00000000300c1400] = ffbe8afa, %l4 = 00000000fa8abeff
	lduwa	[%i3+%g0]0x81,%l4	! %l4 = 00000000ffbe8afa
!	Mem[0000000030001410] = defdddfd, %f0  = b857bea6
	lda	[%i0+%o5]0x81,%f0 	! %f0 = defdddfd
!	Mem[0000000030141400] = ff000000 0000000c, %l0 = cbc0bdbb, %l1 = 00005a9b
	ldda	[%i5+%g0]0x81,%l0	! %l0 = 00000000ff000000 000000000000000c
!	%f1  = 0000003f, %f9  = 5475cac2, %f5  = 22fb4faa
	fdivs	%f1 ,%f9 ,%f5 		! %f5  = 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = ff3bff74, %l1 = 000000000000000c
	ldstuba	[%i0+%g0]0x81,%l1	! %l1 = 000000ff000000ff

p0_label_42:
!	Mem[0000000030041408] = 000099c1, %l4 = 00000000ffbe8afa
	ldstuba	[%i1+%o4]0x89,%l4	! %l4 = 000000c1000000ff
!	Mem[0000000010101408] = 4e3afc72, %l2 = 00000000c2ca7554
	swapa	[%i4+%o4]0x88,%l2	! %l2 = 000000004e3afc72
!	%l0 = 00000000ff000000, Mem[0000000030141410] = 0000000cda8f2695
	stxa	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000ff000000
!	%l7 = 000000005a000000, Mem[0000000010081409] = 5475cac2
	stb	%l7,[%i2+0x009]		! Mem[0000000010081408] = 5400cac2
!	Mem[000000001000140b] = ff5bf46f, %l0 = 00000000ff000000
	ldstub	[%i0+0x00b],%l0		! %l0 = 0000006f000000ff
!	Mem[00000000300c1408] = 00005a9b, %l1 = 00000000000000ff
	swapa	[%i3+%o4]0x89,%l1	! %l1 = 0000000000005a9b
!	%l3 = 0000000000000028, Mem[00000000218000c0] = 65f45589, %asi = 80
	stha	%l3,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 00285589
!	Mem[00000000300c1400] = fa8abeff, %l1 = 0000000000005a9b
	swapa	[%i3+%g0]0x89,%l1	! %l1 = 00000000fa8abeff
!	%l0 = 000000000000006f, Mem[00000000300c1410] = ff00000c
	stwa	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000006f
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = fff0cd6b, %l2 = 000000004e3afc72
	ldswa	[%i1+%g0]0x81,%l2	! %l2 = fffffffffff0cd6b

p0_label_43:
!	Mem[0000000030181410] = 28048e49 72000000, %l6 = c1990000, %l7 = 5a000000
	ldda	[%i6+%o5]0x81,%l6	! %l6 = 0000000028048e49 0000000072000000
!	Mem[0000000030041408] = ff990000, %l0 = 000000000000006f
	ldsha	[%i1+%o4]0x81,%l0	! %l0 = ffffffffffffff99
!	Mem[0000000010081410] = 181936c0 a6be0300, %l2 = fff0cd6b, %l3 = 00000028
	ldda	[%i2+%o5]0x88,%l2	! %l2 = 00000000a6be0300 00000000181936c0
!	Mem[0000000030101410] = c03619ff, %l3 = 00000000181936c0
	ldsha	[%i4+%o5]0x89,%l3	! %l3 = 00000000000019ff
!	Mem[0000000010041408] = 498e04f9, %l5 = 00000000000099c1
	lduwa	[%i1+%o4]0x88,%l5	! %l5 = 00000000498e04f9
!	Mem[00000000300c1408] = ff0000000000005e, %l1 = 00000000fa8abeff
	ldxa	[%i3+%o4]0x81,%l1	! %l1 = ff0000000000005e
!	Mem[0000000030001400] = 74ff3bff, %l5 = 00000000498e04f9
	lduba	[%i0+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1400] = e0b83d5c, %l4 = 00000000000000c1
	lduwa	[%i3+%g0]0x80,%l4	! %l4 = 00000000e0b83d5c
!	Mem[00000000300c1410] = 0000006f000000b8, %f14 = 72fc3a4e 71368f33
	ldda	[%i3+%o5]0x81,%f14	! %f14 = 0000006f 000000b8
!	Starting 10 instruction Store Burst
!	Mem[0000000010081428] = 55d9868e, %l2 = 00000000a6be0300, %asi = 80
	swapa	[%i2+0x028]%asi,%l2	! %l2 = 0000000055d9868e

p0_label_44:
!	%l7 = 0000000072000000, Mem[0000000010001410] = f033040c00000072
	stxa	%l7,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000072000000
!	Mem[0000000010041400] = ff9bff61, %l6 = 0000000028048e49
	ldstuba	[%i1+%g0]0x80,%l6	! %l6 = 000000ff000000ff
!	%f22 = a3561e6a, Mem[0000000010141408] = 03ff8e45
	sta	%f22,[%i5+%o4]0x80	! Mem[0000000010141408] = a3561e6a
!	%f25 = c0361918, Mem[0000000010101408] = c2ca7554
	sta	%f25,[%i4+%o4]0x88	! Mem[0000000010101408] = c0361918
!	%f20 = 34410bb8, Mem[0000000010001400] = 0d0297ff
	sta	%f20,[%i0+%g0]0x88	! Mem[0000000010001400] = 34410bb8
!	%f0  = defdddfd 0000003f 00002b3a 77e7dc0f
!	%f4  = 0c0433f0 00000000 c0361919 c0361918
!	%f8  = b14ef534 5475cac2 d68ff21c 56712eba
!	%f12 = 61289b5a 458e4d03 0000006f 000000b8
	stda	%f0,[%i2]ASI_BLK_AIUPL	! Block Store to 0000000010081400
!	%f30 = 7fffffff, Mem[0000000010101410] = 00002b3a
	sta	%f30,[%i4+%o5]0x80	! Mem[0000000010101410] = 7fffffff
!	%f20 = 34410bb8 0000000c, Mem[0000000010081410] = 00000000 0c0433f0
	stda	%f20,[%i2+%o5]0x88	! Mem[0000000010081410] = 34410bb8 0000000c
!	Mem[0000000030001410] = fdddfdde, %l7 = 0000000072000000
	ldswa	[%i0+%o5]0x89,%l7	! %l7 = fffffffffdddfdde
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 6f000000, %l6 = 00000000000000ff
	ldswa	[%i3+%o5]0x89,%l6	! %l6 = 000000006f000000

p0_label_45:
!	Mem[0000000010101410] = 7fffffff, %l0 = ffffffffffffff99
	ldsha	[%i4+%o5]0x80,%l0	! %l0 = 0000000000007fff
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000010081400] = 3f000000 fdddfdde 0fdce777 3a2b0000
!	Mem[0000000010081410] = 0c000000 b80b4134 181936c0 191936c0
!	Mem[0000000010081420] = c2ca7554 34f54eb1 ba2e7156 1cf28fd6
!	Mem[0000000010081430] = 034d8e45 5a9b2861 b8000000 6f000000
	ldda	[%i2]ASI_BLK_PL,%f0	! Block Load from 0000000010081400
!	Mem[00000000100c1400] = e0b83d5c, %l0 = 0000000000007fff
	lduwa	[%i3+%g0]0x80,%l0	! %l0 = 00000000e0b83d5c
!	Mem[0000000030181408] = c1990000, %l7 = fffffffffdddfdde
	ldsba	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1418] = d1d6fff7, %l4 = 00000000e0b83d5c
	ldsha	[%i3+0x018]%asi,%l4	! %l4 = ffffffffffffd1d6
!	%l2 = 0000000055d9868e, %l5 = 00000000000000ff, %l2 = 0000000055d9868e
	subc	%l2,%l5,%l2		! %l2 = 0000000055d9858f
!	Code Fragment 4
p0_fragment_2:
!	%l0 = 00000000e0b83d5c
	setx	0x496fc1b039ce807c,%g7,%l0 ! %l0 = 496fc1b039ce807c
!	%l1 = ff0000000000005e
	setx	0xfdbea39866a28867,%g7,%l1 ! %l1 = fdbea39866a28867
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 496fc1b039ce807c
	setx	0xc13d2b7fc37d1bb3,%g7,%l0 ! %l0 = c13d2b7fc37d1bb3
!	%l1 = fdbea39866a28867
	setx	0xe900a060585224a3,%g7,%l1 ! %l1 = e900a060585224a3
!	Mem[0000000030141408] = ffffffff, %f26 = 6cc8166b
	lda	[%i5+%o4]0x81,%f26	! %f26 = ffffffff
!	Mem[0000000010041408] = cd4edee3498e04f9, %l0 = c13d2b7fc37d1bb3
	ldxa	[%i1+%o4]0x88,%l0	! %l0 = cd4edee3498e04f9
!	Starting 10 instruction Store Burst
!	%f26 = ffffffff 458e4d03, Mem[0000000030101410] = ff1936c0 a6be57b8
	stda	%f26,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffffff 458e4d03

p0_label_46:
!	Mem[0000000010041400] = 61ff9bff, %l7 = 0000000000000000
	lduwa	[%i1+%g0]0x88,%l7	! %l7 = 0000000061ff9bff
!	%l1 = e900a060585224a3, Mem[0000000030181408] = 000099c1
	stha	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 24a399c1
!	%f28 = c59c80f6 cbc0bdbb, Mem[0000000010141410] = 0000005a b8000000
	stda	%f28,[%i5+0x010]%asi	! Mem[0000000010141410] = c59c80f6 cbc0bdbb
!	%l7 = 0000000061ff9bff, imm = 0000000000000198, %l6 = 000000006f000000
	sub	%l7,0x198,%l6		! %l6 = 0000000061ff9a67
!	%l6 = 0000000061ff9a67, Mem[0000000010101408] = 181936c0, %asi = 80
	stwa	%l6,[%i4+0x008]%asi	! Mem[0000000010101408] = 61ff9a67
!	%f30 = 7fffffff 6cc8166b, Mem[0000000030081400] = f68057b8 18190063
	stda	%f30,[%i2+%g0]0x89	! Mem[0000000030081400] = 7fffffff 6cc8166b
!	%l0 = cd4edee3498e04f9, %l3 = 00000000000019ff, %l3 = 00000000000019ff
	add	%l0,%l3,%l3		! %l3 = cd4edee3498e1ef8
!	Mem[00000000100c1438] = c159f3ce, %l4 = ffffffffffffd1d6
	swap	[%i3+0x038],%l4		! %l4 = 00000000c159f3ce
!	%f27 = 458e4d03, Mem[0000000010041410] = cbc0bdbb
	sta	%f27,[%i1+%o5]0x80	! Mem[0000000010041410] = 458e4d03
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010101400] = ff5c0747 4d000000 61ff9a67 b884ad4e
!	Mem[0000000010101410] = 7fffffff 00000003 f2ef7a97 31ccb6b8
!	Mem[0000000010101420] = ec8e623e 000000ff d68ff21c 56712eba
!	Mem[0000000010101430] = b6bfb931 72adcdd0 6800004d 0518ba86
	ldda	[%i4]ASI_BLK_P,%f0	! Block Load from 0000000010101400

p0_label_47:
!	Mem[0000000010001410] = 00000072, %l5 = 00000000000000ff
	lduwa	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000072
!	Mem[0000000010041400] = ff9bff61, %l1 = e900a060585224a3
	lduba	[%i1+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181408] = 000000ff, %l2 = 0000000055d9858f
	ldsba	[%i6+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Code Fragment 3
p0_fragment_3:
!	%l0 = cd4edee3498e04f9
	setx	0xe314766f9bb748a8,%g7,%l0 ! %l0 = e314766f9bb748a8
!	%l1 = 00000000000000ff
	setx	0x0bf06fa86b187de9,%g7,%l1 ! %l1 = 0bf06fa86b187de9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e314766f9bb748a8
	setx	0x42c69d7fdf390fb8,%g7,%l0 ! %l0 = 42c69d7fdf390fb8
!	%l1 = 0bf06fa86b187de9
	setx	0xb7ed319801c90143,%g7,%l1 ! %l1 = b7ed319801c90143
!	Mem[0000000010141400] = 5475cac2, %l5 = 0000000000000072
	lduwa	[%i5+%g0]0x88,%l5	! %l5 = 000000005475cac2
!	Mem[00000000100c1400] = 5c3db8e0, %l5 = 000000005475cac2
	lduha	[%i3+%g0]0x88,%l5	! %l5 = 000000000000b8e0
!	Mem[0000000010141438] = ec8e623e0000aa3a, %l0 = 42c69d7fdf390fb8
	ldx	[%i5+0x038],%l0		! %l0 = ec8e623e0000aa3a
!	Mem[0000000010141408] = a3561e6a 2bc51678, %l6 = 61ff9a67, %l7 = 61ff9bff
	ldda	[%i5+%o4]0x80,%l6	! %l6 = 00000000a3561e6a 000000002bc51678
!	Mem[0000000030081410] = 3f000000a6be57b8, %f24 = cfb51971 c0361918
	ldda	[%i2+%o5]0x81,%f24	! %f24 = 3f000000 a6be57b8
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 61ff9a67, %l0 = ec8e623e0000aa3a, %asi = 80
	swapa	[%i4+0x008]%asi,%l0	! %l0 = 0000000061ff9a67

p0_label_48:
!	%l3 = cd4edee3498e1ef8, Mem[00000000211c0000] = ff8896d7
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 1ef896d7
	membar	#Sync			! Added by membar checker (8)
!	%l6 = 00000000a3561e6a, Mem[0000000010101419] = f2ef7a97
	stb	%l6,[%i4+0x019]		! Mem[0000000010101418] = f26a7a97
!	%l0 = 61ff9a67, %l1 = 01c90143, Mem[0000000010141438] = ec8e623e 0000aa3a
	std	%l0,[%i5+0x038]		! Mem[0000000010141438] = 61ff9a67 01c90143
!	%l1 = b7ed319801c90143, Mem[0000000030141410] = 000000ff00000000
	stxa	%l1,[%i5+%o5]0x89	! Mem[0000000030141410] = b7ed319801c90143
!	%l1 = b7ed319801c90143, Mem[0000000010081410] = 0000000c
	stba	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000043
!	%f16 = 0000004d, Mem[0000000010081414] = b80b4134
	st	%f16,[%i2+0x014]	! Mem[0000000010081414] = 0000004d
!	%l3 = cd4edee3498e1ef8, Mem[0000000010101400] = ff5c07474d000000
	stx	%l3,[%i4+%g0]		! Mem[0000000010101400] = cd4edee3498e1ef8
!	%l4 = 00000000c159f3ce, Mem[0000000010141400] = 5475cac2
	stwa	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = c159f3ce
!	%l5 = 000000000000b8e0, Mem[0000000010081414] = 0000004d
	sth	%l5,[%i2+0x014]		! Mem[0000000010081414] = b8e0004d
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000072, %l3 = cd4edee3498e1ef8
	ldsba	[%i0+%o5]0x80,%l3	! %l3 = 0000000000000000

p0_label_49:
!	Mem[0000000010081408] = 00002b3a77e7dc0f, %f20 = 34410bb8 0000000c
	ldda	[%i2+%o4]0x88,%f20	! %f20 = 00002b3a 77e7dc0f
!	Mem[0000000030181410] = 28048e49, %l2 = ffffffffffffffff
	ldsba	[%i6+%o5]0x81,%l2	! %l2 = 0000000000000028
!	Mem[0000000030101400] = 5c3db8e0, %l4 = 00000000c159f3ce
	lduba	[%i4+%g0]0x89,%l4	! %l4 = 00000000000000e0
!	Mem[0000000030081408] = cfb51971 bbbdc0cb, %l6 = a3561e6a, %l7 = 2bc51678
	ldda	[%i2+%o4]0x89,%l6	! %l6 = 00000000bbbdc0cb 00000000cfb51971
!	Mem[0000000021800000] = d9df9cd4, %l5 = 000000000000b8e0
	ldsh	[%o3+%g0],%l5		! %l5 = ffffffffffffd9df
!	Mem[0000000030081408] = cbc0bdbb, %l6 = 00000000bbbdc0cb
	lduwa	[%i2+%o4]0x81,%l6	! %l6 = 00000000cbc0bdbb
!	Mem[0000000030001408] = a3561e6a 4ead84ff, %l4 = 000000e0, %l5 = ffffd9df
	ldda	[%i0+%o4]0x89,%l4	! %l4 = 000000004ead84ff 00000000a3561e6a
!	Mem[000000001008141c] = 191936c0, %l5 = 00000000a3561e6a
	lduha	[%i2+0x01c]%asi,%l5	! %l5 = 0000000000001919
!	Mem[0000000030101408] = ff000000, %l6 = 00000000cbc0bdbb
	lduba	[%i4+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1424] = 3cdf5e93, %l4 = 4ead84ff, %l5 = 00001919
	add	%i3,0x24,%g1
	casa	[%g1]0x80,%l4,%l5	! %l5 = 000000003cdf5e93

p0_label_50:
!	%f8  = ec8e623e 000000ff, Mem[0000000010101408] = 3aaa0000 4ead84b8
	stda	%f8 ,[%i4+%o4]0x88	! Mem[0000000010101408] = ec8e623e 000000ff
!	%l1 = b7ed319801c90143, Mem[00000000100c1410] = 6b16c800
	stwa	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = 01c90143
!	%f0  = ff5c0747 4d000000, Mem[0000000030001400] = 74ff3bff 00090c76
	stda	%f0 ,[%i0+%g0]0x89	! Mem[0000000030001400] = ff5c0747 4d000000
!	%l6 = 00000000000000ff, Mem[0000000010101410] = 7fffffff00000003
	stxa	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000000000ff
!	%l5 = 000000003cdf5e93, imm = 00000000000002da, %l1 = b7ed319801c90143
	orn	%l5,0x2da,%l1		! %l1 = ffffffffffffffb7
!	%l3 = 0000000000000000, Mem[00000000100c1424] = 3cdf5e93
	sth	%l3,[%i3+0x024]		! Mem[00000000100c1424] = 00005e93
!	Mem[00000000211c0000] = 1ef896d7, %l4 = 000000004ead84ff
	ldstub	[%o2+%g0],%l4		! %l4 = 0000001e000000ff
!	%f8  = ec8e623e 000000ff, %l1 = ffffffffffffffb7
!	Mem[0000000010041430] = d7e9d98f000001f0
	add	%i1,0x030,%g1
	stda	%f8,[%g1+%l1]ASI_PST16_P ! Mem[0000000010041430] = d7e9623e000000ff
!	%l3 = 0000000000000000, Mem[0000000030001410] = fdddfdde
	stha	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = fddd0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ffffffff, %l1 = ffffffffffffffb7
	ldsba	[%i5+%o4]0x81,%l1	! %l1 = ffffffffffffffff

p0_label_51:
!	Mem[0000000030141410] = 4301c9019831edb7, %f4  = 7fffffff 00000003
	ldda	[%i5+%o5]0x81,%f4 	! %f4  = 4301c901 9831edb7
!	Mem[0000000010041400] = ff9bff61 2541adbf, %l6 = 000000ff, %l7 = cfb51971
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 00000000ff9bff61 000000002541adbf
!	Mem[0000000030081408] = bbbdc0cb, %l6 = 00000000ff9bff61
	ldsha	[%i2+%o4]0x89,%l6	! %l6 = ffffffffffffc0cb
!	Mem[0000000030181408] = c199a324, %l5 = 000000003cdf5e93
	lduba	[%i6+%o4]0x89,%l5	! %l5 = 0000000000000024
!	Mem[0000000030181410] = 28048e49, %l5 = 0000000000000024
	ldsba	[%i6+%o5]0x81,%l5	! %l5 = 0000000000000028
!	%l3 = 0000000000000000, immd = 0000000000000fed, %l6  = ffffffffffffc0cb
	mulx	%l3,0xfed,%l6		! %l6 = 0000000000000000
!	Mem[0000000010001408] = fff45bff, %l2 = 0000000000000028
	lduwa	[%i0+%o4]0x88,%l2	! %l2 = 00000000fff45bff
!	%f29 = cbc0bdbb, %f29 = cbc0bdbb
	fcmpes	%fcc2,%f29,%f29		! %fcc2 = 0
!	Mem[00000000201c0000] = aaff4531, %l2 = 00000000fff45bff
	ldsba	[%o0+0x001]%asi,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = f9048e49, %l0 = 0000000061ff9a67
	swapa	[%i1+%o4]0x80,%l0	! %l0 = 00000000f9048e49

p0_label_52:
!	Mem[00000000211c0000] = fff896d7, %l5 = 0000000000000028
	ldstub	[%o2+%g0],%l5		! %l5 = 000000ff000000ff
!	Mem[0000000030001400] = 0000004d, %l2 = ffffffffffffffff
	swapa	[%i0+%g0]0x81,%l2	! %l2 = 000000000000004d
!	%l1 = ffffffffffffffff, %l2 = 000000000000004d, %l4  = 000000000000001e
	mulx	%l1,%l2,%l4		! %l4 = ffffffffffffffb3
!	%l0 = 00000000f9048e49, Mem[0000000010041400] = ff9bff61
	stba	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 499bff61
!	Mem[0000000010081400] = 0000003f, %l0 = 00000000f9048e49
	ldstuba	[%i2+%g0]0x88,%l0	! %l0 = 0000003f000000ff
!	%l7 = 000000002541adbf, Mem[00000000211c0000] = fff896d7
	sth	%l7,[%o2+%g0]		! Mem[00000000211c0000] = adbf96d7
!	Mem[0000000010041414] = 66d69c89, %l3 = 00000000, %l3 = 00000000
	add	%i1,0x14,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 0000000066d69c89
!	%f20 = 00002b3a 77e7dc0f, Mem[0000000010181410] = ff1a7693 5e40dc05
	stda	%f20,[%i6+%o5]0x80	! Mem[0000000010181410] = 00002b3a 77e7dc0f
!	%f25 = a6be57b8, Mem[0000000010141404] = 34f54eb1
	sta	%f25,[%i5+0x004]%asi	! Mem[0000000010141404] = a6be57b8
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ffffffff, %l5 = 00000000000000ff
	lduha	[%i0+%g0]0x89,%l5	! %l5 = 000000000000ffff

p0_label_53:
!	Mem[0000000010181424] = 00005a9b, %l4 = ffffffffffffffb3
	lduwa	[%i6+0x024]%asi,%l4	! %l4 = 0000000000005a9b
!	Mem[0000000010001408] = ff5bf4ff, %l2 = 000000000000004d
	lduha	[%i0+%o4]0x80,%l2	! %l2 = 000000000000ff5b
!	Mem[0000000010141410] = c59c80f6, %l3 = 0000000066d69c89
	ldsha	[%i5+%o5]0x80,%l3	! %l3 = ffffffffffffc59c
!	Mem[00000000300c1408] = 000000ff, %l5 = 000000000000ffff
	ldsba	[%i3+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010001400] = b80b4134, %l6 = 0000000000000000
	lduba	[%i0+%g0]0x80,%l6	! %l6 = 00000000000000b8
!	Mem[0000000010081438] = b8000000, %l1 = ffffffffffffffff
	lduw	[%i2+0x038],%l1		! %l1 = 00000000b8000000
!	Mem[0000000010141408] = a3561e6a 2bc51678, %l2 = 0000ff5b, %l3 = ffffc59c
	ldd	[%i5+%o4],%l2		! %l2 = 00000000a3561e6a 000000002bc51678
!	Mem[0000000030181408] = 24a399c1, %l3 = 000000002bc51678
	lduha	[%i6+%o4]0x81,%l3	! %l3 = 00000000000024a3
!	Mem[0000000010141424] = 4ead84b8, %l6 = 00000000000000b8
	lduh	[%i5+0x026],%l6		! %l6 = 00000000000084b8
!	Starting 10 instruction Store Burst
!	%l2 = 00000000a3561e6a, Mem[0000000030101408] = ff000000
	stha	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 1e6a0000

p0_label_54:
!	Mem[0000000030141410] = 01c90143, %l6 = 00000000000084b8
	ldstuba	[%i5+%o5]0x89,%l6	! %l6 = 00000043000000ff
!	Mem[0000000030101400] = 5c3db8e0, %l4 = 0000000000005a9b
	swapa	[%i4+%g0]0x89,%l4	! %l4 = 000000005c3db8e0
!	Mem[0000000010141405] = a6be57b8, %l3 = 00000000000024a3
	ldstub	[%i5+0x005],%l3		! %l3 = 000000be000000ff
!	Mem[0000000010081414] = b8e0004d, %f21 = 77e7dc0f
	lda	[%i2+0x014]%asi,%f21	! %f21 = b8e0004d
!	Mem[0000000010081408] = 0fdce777, %l5 = ffffffffffffffff
	ldstuba	[%i2+%o4]0x80,%l5	! %l5 = 0000000f000000ff
!	%l7 = 000000002541adbf, Mem[0000000030081408] = cbc0bdbb
	stha	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = adbfbdbb
!	%l1 = 00000000b8000000, Mem[00000000100c1418] = d1d6fff7, %asi = 80
	stwa	%l1,[%i3+0x018]%asi	! Mem[00000000100c1418] = b8000000
!	Code Fragment 3
p0_fragment_4:
!	%l0 = 000000000000003f
	setx	0x940d3e67920bceee,%g7,%l0 ! %l0 = 940d3e67920bceee
!	%l1 = 00000000b8000000
	setx	0xaa20283ff6b0d811,%g7,%l1 ! %l1 = aa20283ff6b0d811
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 940d3e67920bceee
	setx	0xc6714eefcf9c03c8,%g7,%l0 ! %l0 = c6714eefcf9c03c8
!	%l1 = aa20283ff6b0d811
	setx	0x7b306a3fbf1e61fe,%g7,%l1 ! %l1 = 7b306a3fbf1e61fe
!	%f24 = 3f000000 a6be57b8, Mem[0000000030001408] = 4ead84ff a3561e6a
	stda	%f24,[%i0+%o4]0x89	! Mem[0000000030001408] = 3f000000 a6be57b8
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = b7ed3198 01c901ff, %l0 = cf9c03c8, %l1 = bf1e61fe
	ldda	[%i5+%o5]0x89,%l0	! %l0 = 0000000001c901ff 00000000b7ed3198

p0_label_55:
!	%l0 = 0000000001c901ff, Mem[0000000010101410] = 00000000000000ff
	stxa	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000001c901ff
!	Mem[0000000010081400] = ff000000, %l5 = 000000000000000f
	ldsba	[%i2+%g0]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030081400] = 6cc8166b, %l6 = 0000000000000043
	ldsba	[%i2+%g0]0x89,%l6	! %l6 = 000000000000006b
!	Mem[0000000010041400] = 499bff61, %l4 = 000000005c3db8e0
	ldub	[%i1+0x003],%l4		! %l4 = 0000000000000061
!	Mem[00000000100c1410] = 4301c901202421ba, %f24 = 3f000000 a6be57b8
	ldda	[%i3+%o5]0x80,%f24	! %f24 = 4301c901 202421ba
!	Mem[0000000030081400] = 6b16c86c, %l0 = 0000000001c901ff
	ldswa	[%i2+%g0]0x81,%l0	! %l0 = 000000006b16c86c
!	Mem[0000000030081410] = 0000003f, %l5 = ffffffffffffffff
	ldsba	[%i2+%o5]0x89,%l5	! %l5 = 000000000000003f
!	Mem[0000000010181400] = 00000000, %l7 = 000000002541adbf
	lduba	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081410] = 3f000000a6be57b8, %f8  = ec8e623e 000000ff
	ldda	[%i2+%o5]0x81,%f8 	! %f8  = 3f000000 a6be57b8
!	Starting 10 instruction Store Burst
!	Mem[0000000010041420] = f3b38633, %l5 = 000000000000003f, %asi = 80
	swapa	[%i1+0x020]%asi,%l5	! %l5 = 00000000f3b38633

p0_label_56:
!	%l3 = 00000000000000be, Mem[0000000010041400] = 499bff612541adbf, %asi = 80
	stxa	%l3,[%i1+0x000]%asi	! Mem[0000000010041400] = 00000000000000be
!	Mem[0000000030141410] = ff01c901, %l5 = 00000000f3b38633
	ldstuba	[%i5+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	%l6 = 0000006b, %l7 = 00000000, Mem[0000000010041410] = 034d8e45 899cd666
	stda	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000006b 00000000
!	Mem[0000000010041418] = ca3c4fc2, %l4 = 0000000000000061
	swap	[%i1+0x018],%l4		! %l4 = 00000000ca3c4fc2
!	%l4 = 00000000ca3c4fc2, Mem[0000000010101438] = 6800004d
	stw	%l4,[%i4+0x038]		! Mem[0000000010101438] = ca3c4fc2
!	%f16 = 0000004d 47075cff ff5c0747 74ff3bff
!	%f20 = 00002b3a b8e0004d a3561e6a 6bcdf0ff
!	%f24 = 4301c901 202421ba ffffffff 458e4d03
!	%f28 = c59c80f6 cbc0bdbb 7fffffff 6cc8166b
	stda	%f16,[%i6]ASI_BLK_AIUSL	! Block Store to 0000000030181400
!	%l6 = 000000000000006b, imm = fffffffffffff7c5, %l2 = 00000000a3561e6a
	subc	%l6,-0x83b,%l2		! %l2 = 00000000000008a6
!	%l0 = 000000006b16c86c, Mem[0000000010081400] = ff000000
	stha	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = c86c0000
!	Code Fragment 3
p0_fragment_5:
!	%l0 = 000000006b16c86c
	setx	0xa9f23ef7c100bc81,%g7,%l0 ! %l0 = a9f23ef7c100bc81
!	%l1 = 00000000b7ed3198
	setx	0xd3def9687c5e2ff4,%g7,%l1 ! %l1 = d3def9687c5e2ff4
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a9f23ef7c100bc81
	setx	0x6b2c6a5f855a46b8,%g7,%l0 ! %l0 = 6b2c6a5f855a46b8
!	%l1 = d3def9687c5e2ff4
	setx	0xada6bc0006716c45,%g7,%l1 ! %l1 = ada6bc0006716c45
!	Starting 10 instruction Load Burst
!	Mem[0000000010001428] = f7ccb635 bbbdc0cb, %l6 = 0000006b, %l7 = 00000000
	ldda	[%i0+0x028]%asi,%l6	! %l6 = 00000000f7ccb635 00000000bbbdc0cb

p0_label_57:
!	Mem[0000000030141400] = ff000000, %l0 = 6b2c6a5f855a46b8
	lduha	[%i5+%g0]0x81,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010081408] = ffdce777 3a2b0000, %l0 = 0000ff00, %l1 = 06716c45
	ldda	[%i2+%o4]0x80,%l0	! %l0 = 00000000ffdce777 000000003a2b0000
!	Mem[0000000010001410] = 00000072, %l6 = 00000000f7ccb635
	ldsha	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141410] = c59c80f6, %l3 = 00000000000000be
	ldsba	[%i5+%o5]0x80,%l3	! %l3 = ffffffffffffffc5
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000010181438] = f6b494553e2a2212, %f6  = f2ef7a97 31ccb6b8
	ldda	[%i6+0x038]%asi,%f6 	! %f6  = f6b49455 3e2a2212
!	Mem[00000000100c1400] = 5c3db8e0, %l4 = 00000000ca3c4fc2
	lduwa	[%i3+%g0]0x88,%l4	! %l4 = 000000005c3db8e0
!	Mem[0000000030041408] = ff990000, %l5 = 00000000000000ff
	ldsba	[%i1+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	%l5 = ffffffffffffffff, immed = 00000431, %y  = 000022a2
	smul	%l5,0x431,%l3		! %l3 = fffffffffffffbcf, %y = ffffffff
!	Mem[0000000030101410] = ffffffff, %l4 = 000000005c3db8e0
	ldsba	[%i4+%o5]0x81,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l3 = fffffffffffffbcf, Mem[00000000100c1410] = 4301c901202421ba
	stx	%l3,[%i3+%o5]		! Mem[00000000100c1410] = fffffffffffffbcf

p0_label_58:
!	%l4 = ffffffff, %l5 = ffffffff, Mem[0000000010041410] = 0000006b 00000000
	stda	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffff ffffffff
!	%l3 = fffffffffffffbcf, Mem[0000000030141410] = ff01c901
	stwa	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = fffffbcf
!	Mem[00000000300c1410] = 6f000000, %l6 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%l7 = 00000000bbbdc0cb, Mem[0000000030101400] = 00005a9b
	stba	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = 00005acb
!	%l7 = 00000000bbbdc0cb, Mem[0000000030101400] = 00005acb
	stwa	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = bbbdc0cb
!	%l2 = 000008a6, %l3 = fffffbcf, Mem[0000000030081400] = 6cc8166b 7fffffff
	stda	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 000008a6 fffffbcf
!	%l0 = 00000000ffdce777, Mem[0000000010141408] = a3561e6a2bc51678
	stxa	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000ffdce777
!	%l7 = 00000000bbbdc0cb, Mem[00000000100c1400] = e0b83d5c
	stha	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = c0cb3d5c
!	%f6  = f6b49455, Mem[0000000030101400] = bbbdc0cb
	sta	%f6 ,[%i4+%g0]0x89	! Mem[0000000030101400] = f6b49455
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 0000ddfd 21a97586, %l2 = 000008a6, %l3 = fffffbcf
	ldda	[%i0+%o5]0x81,%l2	! %l2 = 000000000000ddfd 0000000021a97586

p0_label_59:
!	Mem[00000000100c1410] = fffffffffffffbcf, %l4 = ffffffffffffffff
	ldxa	[%i3+%o5]0x80,%l4	! %l4 = fffffffffffffbcf
!	Mem[0000000020800040] = 28610070, %l1 = 000000003a2b0000
	ldsha	[%o1+0x040]%asi,%l1	! %l1 = 0000000000002861
!	Mem[0000000030041400] = cb3f38b56bcdf0ff, %f18 = ff5c0747 74ff3bff
	ldda	[%i1+%g0]0x89,%f18	! %f18 = cb3f38b5 6bcdf0ff
!	Mem[0000000010101410] = 00000000, %l5 = ffffffffffffffff
	ldsba	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = defdddfd 00006cc8, %l2 = 0000ddfd, %l3 = 21a97586
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 0000000000006cc8 00000000defdddfd
!	Mem[0000000030081410] = 3f000000, %l7 = 00000000bbbdc0cb
	lduwa	[%i2+%o5]0x81,%l7	! %l7 = 000000003f000000
!	Mem[00000000100c1408] = c0361919, %f22 = a3561e6a
	lda	[%i3+%o4]0x80,%f22	! %f22 = c0361919
!	Mem[0000000030001408] = b857bea6, %l7 = 000000003f000000
	lduwa	[%i0+%o4]0x81,%l7	! %l7 = 00000000b857bea6
!	Mem[00000000100c1408] = c0361919, %l5 = 0000000000000000
	lduha	[%i3+0x008]%asi,%l5	! %l5 = 000000000000c036
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ffdce777, %l6 = 0000000000000000, %l4 = fffffffffffffbcf
	udivx	%l0,%l6,%l4		! Div by zero, %l0 = 00000000ffdce7c7

p0_label_60:
!	%l3 = 00000000defdddfd, Mem[0000000010081400] = 00006cc8
	stha	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000ddfd
!	%f8  = 3f000000 a6be57b8, %l2 = 0000000000006cc8
!	Mem[00000000100c1410] = fffffffffffffbcf
	add	%i3,0x010,%g1
	stda	%f8,[%g1+%l2]ASI_PST16_P ! Mem[00000000100c1410] = 3f00fffffffffbcf
!	Mem[0000000010001408] = ff5bf4ff, %l1 = 0000000000002861
	swapa	[%i0+%o4]0x80,%l1	! %l1 = 00000000ff5bf4ff
!	%f20 = 00002b3a b8e0004d, Mem[0000000010001408] = 61280000 0fdce777
	stda	%f20,[%i0+%o4]0x88	! Mem[0000000010001408] = 00002b3a b8e0004d
!	%l4 = fffffffffffffbcf, Mem[000000001014143b] = 61ff9a67
	stb	%l4,[%i5+0x03b]		! Mem[0000000010141438] = 61ff9acf
!	Mem[0000000030001408] = a6be57b8, %l5 = 000000000000c036
	ldstuba	[%i0+%o4]0x89,%l5	! %l5 = 000000b8000000ff
!	%l3 = 00000000defdddfd, Mem[0000000030181410] = 00002b3ab8e0004d
	stxa	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000defdddfd
!	Mem[0000000010081400] = 0000ddfd, %l7 = 00000000b857bea6
	swapa	[%i2+%g0]0x88,%l7	! %l7 = 000000000000ddfd
!	Mem[00000000100c1400] = c0cb3d5c, %l5 = 00000000000000b8
	ldstuba	[%i3+%g0]0x80,%l5	! %l5 = 000000c0000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001420] = b14ef534, %l1 = 00000000ff5bf4ff
	lduwa	[%i0+0x020]%asi,%l1	! %l1 = 00000000b14ef534

p0_label_61:
!	Mem[000000001008142c] = 1cf28fd6, %f0  = ff5c0747
	lda	[%i2+0x02c]%asi,%f0 	! %f0 = 1cf28fd6
!	Mem[0000000010181400] = 00000000, %l4 = fffffffffffffbcf
	ldsba	[%i6+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081408] = 77e7dcff, %l0 = 00000000ffdce79f
	lduba	[%i2+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101430] = b6bfb93172adcdd0, %l3 = 00000000defdddfd
	ldxa	[%i4+0x030]%asi,%l3	! %l3 = b6bfb93172adcdd0
!	Mem[0000000030041400] = fff0cd6b, %l6 = 0000000000000000
	lduha	[%i1+%g0]0x81,%l6	! %l6 = 000000000000fff0
!	Mem[0000000010181408] = ff000000, %l1 = 00000000b14ef534
	ldsba	[%i6+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010081400] = a6be57b8, %f14 = 6800004d
	lda	[%i2+%g0]0x80,%f14	! %f14 = a6be57b8
!	Mem[0000000010001400] = 34410bb8, %l1 = ffffffffffffffff
	ldsba	[%i0+%g0]0x88,%l1	! %l1 = ffffffffffffffb8
!	Mem[0000000010181414] = 77e7dc0f, %l3 = b6bfb93172adcdd0
	lduha	[%i6+0x016]%asi,%l3	! %l3 = 000000000000dc0f
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = fffffbcf, %l2 = 0000000000006cc8
	ldstuba	[%i5+%o5]0x81,%l2	! %l2 = 000000ff000000ff

p0_label_62:
!	Mem[00000000201c0001] = aaff4531, %l7 = 000000000000ddfd
	ldstuba	[%o0+0x001]%asi,%l7	! %l7 = 000000ff000000ff
!	%l6 = 000000000000fff0, Mem[0000000030181408] = 74ff3bff
	stwa	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000fff0
!	%l6 = 000000000000fff0, Mem[0000000030101410] = ffffffff
	stwa	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000fff0
!	Code Fragment 3
p0_fragment_6:
!	%l0 = 00000000000000ff
	setx	0x87e1fe802fd8ea90,%g7,%l0 ! %l0 = 87e1fe802fd8ea90
!	%l1 = ffffffffffffffb8
	setx	0x7bae77d7cbc5f697,%g7,%l1 ! %l1 = 7bae77d7cbc5f697
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 87e1fe802fd8ea90
	setx	0xea41764819594795,%g7,%l0 ! %l0 = ea41764819594795
!	%l1 = 7bae77d7cbc5f697
	setx	0x8844933077c26d49,%g7,%l1 ! %l1 = 8844933077c26d49
!	%l3 = 000000000000dc0f, Mem[0000000030181408] = ff5c07470000fff0
	stxa	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000000000dc0f
!	%l6 = 000000000000fff0, Mem[00000000201c0000] = aaff4531
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = fff04531
!	%l2 = 000000ff, %l3 = 0000dc0f, Mem[0000000010101408] = ff000000 3e628eec
	stda	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff 0000dc0f
!	Mem[0000000010001408] = 4d00e0b8, %l1 = 8844933077c26d49
	ldstuba	[%i0+%o4]0x80,%l1	! %l1 = 0000004d000000ff
!	%l6 = 000000000000fff0, Mem[0000000030181408] = 0fdc0000
	stwa	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000fff0
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = 005e8841, %l1 = 000000000000004d
	lduh	[%o1+%g0],%l1		! %l1 = 000000000000005e

p0_label_63:
!	Mem[0000000030041410] = c1994bcc, %l1 = 000000000000005e
	lduwa	[%i1+%o5]0x81,%l1	! %l1 = 00000000c1994bcc
!	Mem[0000000030001410] = 0000ddfd21a97586, %l4 = 0000000000000000
	ldxa	[%i0+%o5]0x81,%l4	! %l4 = 0000ddfd21a97586
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000030101400] = 5594b4f6 ad2001a8 1e6a0000 000000b8
!	Mem[0000000030101410] = 0000fff0 458e4d03 efe9154c e4bd066a
!	Mem[0000000030101420] = 4541d62a 48aa72b0 76c606c4 7321c655
!	Mem[0000000030101430] = 0a2ea426 6a540284 f4810af1 c6e5f457
	ldda	[%i4]ASI_BLK_SL,%f0	! Block Load from 0000000030101400
!	%f28 = c59c80f6, %f29 = cbc0bdbb, %f21 = b8e0004d
	fmuls	%f28,%f29,%f21		! %f21 = 51eba96c
!	Mem[0000000030041400] = 6bcdf0ff, %l5 = 00000000000000c0
	lduwa	[%i1+%g0]0x89,%l5	! %l5 = 000000006bcdf0ff
!	Mem[0000000030001400] = ffffffff 47075cff, %l0 = 19594795, %l1 = c1994bcc
	ldda	[%i0+%g0]0x81,%l0	! %l0 = 00000000ffffffff 0000000047075cff
!	Mem[0000000010181400] = dfd9000000000000, %f24 = 4301c901 202421ba
	ldda	[%i6+%g0]0x88,%f24	! %f24 = dfd90000 00000000
!	Mem[0000000030041400] = fff0cd6b, %l3 = 000000000000dc0f
	ldsha	[%i1+%g0]0x81,%l3	! %l3 = fffffffffffffff0
!	Mem[0000000030141410] = cffbffff, %l4 = 0000ddfd21a97586
	lduwa	[%i5+%o5]0x89,%l4	! %l4 = 00000000cffbffff
!	Starting 10 instruction Store Burst
!	%l3 = fffffffffffffff0, Mem[0000000010081430] = 034d8e455a9b2861, %asi = 80
	stxa	%l3,[%i2+0x030]%asi	! Mem[0000000010081430] = fffffffffffffff0

p0_label_64:
!	Mem[0000000030181408] = 0000fff0, %l5 = 000000006bcdf0ff
	ldstuba	[%i6+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	%f28 = c59c80f6 cbc0bdbb, %l0 = 00000000ffffffff
!	Mem[0000000030081428] = 4b0a28364cb8c126
	add	%i2,0x028,%g1
	stda	%f28,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030081428] = bbbdc0cbf6809cc5
!	%f30 = 7fffffff 6cc8166b, %l3 = fffffffffffffff0
!	Mem[0000000010101408] = 000000ff0000dc0f
	add	%i4,0x008,%g1
	stda	%f30,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010101408] = 000000ff0000dc0f
!	%f24 = dfd90000 00000000, Mem[0000000030141410] = fffffbcf 9831edb7
	stda	%f24,[%i5+%o5]0x81	! Mem[0000000030141410] = dfd90000 00000000
!	%f26 = ffffffff 458e4d03, Mem[0000000010081430] = ffffffff fffffff0
	std	%f26,[%i2+0x030]	! Mem[0000000010081430] = ffffffff 458e4d03
!	%f28 = c59c80f6, Mem[0000000030001410] = 0000ddfd
	sta	%f28,[%i0+%o5]0x81	! Mem[0000000030001410] = c59c80f6
	membar	#Sync			! Added by membar checker (11)
!	%l0 = ffffffff, %l1 = 47075cff, Mem[0000000030101410] = f0ff0000 034d8e45
	stda	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = ffffffff 47075cff
!	%f1  = f6b49455, Mem[0000000010041428] = 09b7bb66
	st	%f1 ,[%i1+0x028]	! Mem[0000000010041428] = f6b49455
!	Mem[0000000010081400] = b857bea6, %l0 = 00000000ffffffff
	ldstuba	[%i2+%g0]0x88,%l0	! %l0 = 000000a6000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 679aff61, %l7 = 00000000000000ff
	lduha	[%i1+%o4]0x88,%l7	! %l7 = 000000000000ff61

p0_label_65:
!	Mem[0000000010001410] = 00000072, %l5 = 0000000000000000
	lduwa	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000072
!	Mem[0000000010081400] = b857beff, %l6 = 000000000000fff0
	lduwa	[%i2+%g0]0x88,%l6	! %l6 = 00000000b857beff
!	Mem[00000000100c1420] = f51e45aa, %l1 = 0000000047075cff
	lduba	[%i3+0x023]%asi,%l1	! %l1 = 00000000000000aa
!	Mem[0000000010181408] = 000000ff, %l3 = fffffffffffffff0
	lduba	[%i6+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1410] = ff00006f, %l3 = 00000000000000ff
	ldsba	[%i3+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030041410] = c1994bccdeb30a5c, %l0 = 00000000000000a6
	ldxa	[%i1+%o5]0x81,%l0	! %l0 = c1994bccdeb30a5c
!	Mem[0000000010041400] = 00000000, %l3 = ffffffffffffffff
	ldub	[%i1+%g0],%l3		! %l3 = 0000000000000000
!	Mem[0000000030181400] = 47075cff, %l2 = 00000000000000ff
	lduba	[%i6+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001408] = ff57bea6, %l7 = 000000000000ff61
	ldswa	[%i0+%o4]0x81,%l7	! %l7 = ffffffffff57bea6
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 00000043, %l6 = 00000000b857beff
	swapa	[%i2+%o5]0x88,%l6	! %l6 = 0000000000000043

p0_label_66:
!	%l4 = cffbffff, %l5 = 00000072, Mem[0000000010001410] = 00000072 00000000
	stda	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = cffbffff 00000072
!	%f12 = 8402546a, %f5  = f0ff0000, %f22 = c0361919
	fdivs	%f12,%f5 ,%f22		! %f22 = 00000000
!	Mem[0000000030001400] = ffffffff, %l0 = c1994bccdeb30a5c
	swapa	[%i0+%g0]0x89,%l0	! %l0 = 00000000ffffffff
!	%f22 = 00000000 6bcdf0ff, Mem[0000000030001400] = deb30a5c ff5c0747
	stda	%f22,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 6bcdf0ff
!	%l1 = 00000000000000aa, Mem[0000000030101408] = 00006a1e
	stba	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = 00006aaa
!	%l1 = 00000000000000aa, Mem[00000000211c0001] = adbf96d7, %asi = 80
	stba	%l1,[%o2+0x001]%asi	! Mem[00000000211c0000] = adaa96d7
!	%f15 = f10a81f4, Mem[0000000010001408] = ff00e0b8
	sta	%f15,[%i0+%o4]0x80	! Mem[0000000010001408] = f10a81f4
!	%l2 = 00000000000000ff, Mem[0000000010181408] = ff000000
	stba	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = ff000000
!	%f11 = c406c676, Mem[00000000100c1400] = ffcb3d5c
	sta	%f11,[%i3+%g0]0x80	! Mem[00000000100c1400] = c406c676
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff00006f, %l0 = 00000000ffffffff
	ldsha	[%i3+%o5]0x81,%l0	! %l0 = ffffffffffffff00

p0_label_67:
!	Mem[0000000010001408] = f10a81f4 3a2b0000, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i0+%o4]0x80,%l2	! %l2 = 00000000f10a81f4 000000003a2b0000
!	Mem[0000000010081410] = ffbe57b8, %l3 = 000000003a2b0000
	ldsha	[%i2+%o5]0x80,%l3	! %l3 = ffffffffffffffbe
!	Mem[0000000010101410] = 0000000001c901ff, %l5 = 0000000000000072
	ldxa	[%i4+0x010]%asi,%l5	! %l5 = 0000000001c901ff
!	Mem[0000000030181408] = ff00fff0, %l3 = ffffffffffffffbe
	lduba	[%i6+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%l5 = 0000000001c901ff, imm = fffffffffffff8d9, %l5 = 0000000001c901ff
	xnor	%l5,-0x727,%l5		! %l5 = 0000000001c906d9
!	%f16 = 0000004d, %f18 = cb3f38b5
	fcmpes	%fcc2,%f16,%f18		! %fcc2 = 2
!	Mem[0000000030181400] = ff5c07474d000000, %f12 = 8402546a 26a42e0a
	ldda	[%i6+%g0]0x81,%f12	! %f12 = ff5c0747 4d000000
!	Mem[0000000030001400] = fff0cd6b, %l2 = 00000000f10a81f4
	ldswa	[%i0+%g0]0x81,%l2	! %l2 = fffffffffff0cd6b
!	Mem[0000000030101410] = ffffffff, %l7 = ffffffffff57bea6
	ldswa	[%i4+%o5]0x81,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l2 = fffffffffff0cd6b, Mem[0000000030041408] = ff990000
	stba	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 6b990000

p0_label_68:
!	%f23 = 6bcdf0ff, Mem[0000000010101434] = 72adcdd0
	st	%f23,[%i4+0x034]	! Mem[0000000010101434] = 6bcdf0ff
!	%l1 = 00000000000000aa, Mem[0000000010001408] = f4810af1
	stha	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = f48100aa
!	Mem[0000000030001408] = ff57bea6, %l3 = 00000000000000ff
	swapa	[%i0+%o4]0x81,%l3	! %l3 = 00000000ff57bea6
!	%l6 = 0000000000000043, Mem[0000000030101408] = 00006aaa
	stwa	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000043
!	%l4 = 00000000cffbffff, Mem[00000000100c1408] = c03619191b21c956
	stxa	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000cffbffff
!	Mem[0000000010141410] = c59c80f6, %l6 = 0000000000000043
	swapa	[%i5+%o5]0x80,%l6	! %l6 = 00000000c59c80f6
!	Mem[0000000030001408] = ff000000, %l3 = 00000000ff57bea6
	ldstuba	[%i0+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	%l4 = 00000000cffbffff, Mem[0000000010101410] = 00000000
	stwa	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = cffbffff
!	%l5 = 0000000001c906d9, Mem[00000000300c1410] = ff00006f
	stwa	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 01c906d9
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000030041400] = fff0cd6b b5383fcb 6b990000 b8000000
!	Mem[0000000030041410] = c1994bcc deb30a5c d3ecdbd1 1ba00b2f
!	Mem[0000000030041420] = 353ee4a8 d675efff 4ef21338 464d0964
!	Mem[0000000030041430] = 8a33ebc2 536be766 478242fe 4453a10b
	ldda	[%i1]ASI_BLK_AIUS,%f0	! Block Load from 0000000030041400

p0_label_69:
!	Mem[0000000030181400] = ff5c0747, %l7 = ffffffffffffffff
	ldsha	[%i6+%g0]0x81,%l7	! %l7 = ffffffffffffff5c
!	Mem[00000000201c0000] = fff04531, %l7 = ffffffffffffff5c
	lduha	[%o0+0x000]%asi,%l7	! %l7 = 000000000000fff0
!	%l7 = 000000000000fff0, %l7 = 000000000000fff0, %y  = ffffffff
	sdiv	%l7,%l7,%l5		! %l5 = fffffffffffefff1
	mov	%l0,%y			! %y = ffffff00
!	Mem[00000000100c1410] = ffff003f, %l2 = fffffffffff0cd6b
	ldsba	[%i3+%o5]0x88,%l2	! %l2 = 000000000000003f
!	Mem[0000000010041428] = f6b49455, %l0 = ffffffffffffff00
	ldsba	[%i1+0x028]%asi,%l0	! %l0 = fffffffffffffff6
!	Mem[00000000100c143c] = e860c0cf, %l5 = fffffffffffefff1
	lduw	[%i3+0x03c],%l5		! %l5 = 00000000e860c0cf
!	Mem[0000000010001434] = 3b7d6197, %l0 = fffffffffffffff6
	ldsw	[%i0+0x034],%l0		! %l0 = 000000003b7d6197
!	Mem[00000000100c1404] = 7119b5cf, %l7 = 000000000000fff0
	lduh	[%i3+0x006],%l7		! %l7 = 000000000000b5cf
!	Mem[0000000010141410] = 43000000, %l4 = 00000000cffbffff
	lduha	[%i5+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 77e7dcff, %l7 = 000000000000b5cf
	ldstuba	[%i2+%o4]0x88,%l7	! %l7 = 000000ff000000ff

p0_label_70:
	membar	#Sync			! Added by membar checker (13)
!	%f26 = ffffffff 458e4d03, Mem[0000000030041408] = 0000996b 000000b8
	stda	%f26,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffffff 458e4d03
!	%l1 = 00000000000000aa, Mem[0000000030001400] = fff0cd6b00000000
	stxa	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000000000aa
!	%l6 = 00000000c59c80f6, Mem[0000000010141418] = 9cf86588badc3547, %asi = 80
	stxa	%l6,[%i5+0x018]%asi	! Mem[0000000010141418] = 00000000c59c80f6
!	Mem[0000000030181410] = defdddfd, %l2 = 000000000000003f
	ldstuba	[%i6+%o5]0x89,%l2	! %l2 = 000000fd000000ff
!	Mem[0000000030181408] = f0ff00ff, %l0 = 000000003b7d6197
	ldstuba	[%i6+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010001408] = aa0081f4, %l1 = 00000000000000aa
	swapa	[%i0+%o4]0x80,%l1	! %l1 = 00000000aa0081f4
!	%l0 = 00000000000000ff, Mem[0000000010041408] = 61ff9a67
	stba	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = ffff9a67
!	Mem[0000000010181408] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l4	! %l4 = 000000ff000000ff
!	%l6 = c59c80f6, %l7 = 000000ff, Mem[0000000010001408] = aa000000 00002b3a
	stda	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = c59c80f6 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ffffffff339398c5, %f28 = c59c80f6 cbc0bdbb
	ldda	[%i5+%o4]0x81,%f28	! %f28 = ffffffff 339398c5

p0_label_71:
!	Mem[0000000030181400] = 0000004d 47075cff, %l4 = 000000ff, %l5 = e860c0cf
	ldda	[%i6+%g0]0x89,%l4	! %l4 = 0000000047075cff 000000000000004d
!	Mem[0000000010141400] = cef359c1a6ff57b8, %l6 = 00000000c59c80f6
	ldxa	[%i5+%g0]0x80,%l6	! %l6 = cef359c1a6ff57b8
!	Mem[0000000010181410] = 0fdce777 3a2b0000, %l6 = a6ff57b8, %l7 = 000000ff
	ldda	[%i6+%o5]0x88,%l6	! %l6 = 000000003a2b0000 000000000fdce777
!	Mem[0000000010001400] = b80b4134, %l1 = 00000000aa0081f4
	lduba	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000b8
!	Mem[00000000100c1400] = c406c676 7119b5cf 00000000 cffbffff
!	Mem[00000000100c1410] = 3f00ffff fffffbcf b8000000 89310ee0
!	Mem[00000000100c1420] = f51e45aa 00005e93 370418ce 9303f1e3
!	Mem[00000000100c1430] = e0aa13e3 fdd14e51 ffffd1d6 e860c0cf
	ldda	[%i3]ASI_BLK_PL,%f0	! Block Load from 00000000100c1400
!	Mem[0000000030041410] = 5c0ab3decc4b99c1, %l5 = 000000000000004d
	ldxa	[%i1+%o5]0x89,%l5	! %l5 = 5c0ab3decc4b99c1
!	Mem[0000000010181410] = 0fdce7773a2b0000, %f26 = ffffffff 458e4d03
	ldda	[%i6+%o5]0x88,%f26	! %f26 = 0fdce777 3a2b0000
!	Mem[00000000100c1410] = ffff003f, %f27 = 3a2b0000
	lda	[%i3+%o5]0x88,%f27	! %f27 = ffff003f
!	%f31 = 6cc8166b, %f19 = 6bcdf0ff, %f24 = dfd90000
	fsubs	%f31,%f19,%f24		! %f24 = 6c949a2b
!	Starting 10 instruction Store Burst
!	%f21 = 51eba96c, Mem[0000000010101408] = ff000000
	sta	%f21,[%i4+%o4]0x88	! Mem[0000000010101408] = 51eba96c

p0_label_72:
!	%f18 = cb3f38b5 6bcdf0ff, %l4 = 0000000047075cff
!	Mem[0000000030141430] = c59c80f6e6a17139
	add	%i5,0x030,%g1
	stda	%f18,[%g1+%l4]ASI_PST16_SL ! Mem[0000000030141430] = fff0cd6bb5383fcb
!	%l6 = 3a2b0000, %l7 = 0fdce777, Mem[0000000010081400] = b857beff defdddfd
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 3a2b0000 0fdce777
!	Mem[0000000030141400] = ff000000, %l2 = 00000000000000fd
	ldstuba	[%i5+%g0]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010001408] = f6809cc5, %l1 = 00000000000000b8
	swapa	[%i0+%o4]0x80,%l1	! %l1 = 00000000f6809cc5
!	%l4 = 0000000047075cff, Mem[0000000010101400] = e3de4ecd
	stba	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = e3de4eff
!	%l0 = 00000000000000ff, Mem[0000000010081400] = 3a2b0000
	stba	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 3a2b00ff
!	%f0  = cfb51971 76c606c4 fffffbcf 00000000
!	%f4  = cffbffff ffff003f e00e3189 000000b8
!	%f8  = 935e0000 aa451ef5 e3f10393 ce180437
!	%f12 = 514ed1fd e313aae0 cfc060e8 d6d1ffff
	stda	%f0,[%i0]ASI_COMMIT_S	! Block Store to 0000000030001400
!	%f27 = ffff003f, Mem[0000000030101410] = ffffffff
	sta	%f27,[%i4+%o5]0x81	! Mem[0000000030101410] = ffff003f
!	%f23 = 6bcdf0ff, Mem[0000000030081410] = 3f000000
	sta	%f23,[%i2+%o5]0x81	! Mem[0000000030081410] = 6bcdf0ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ffffffff, %l5 = 5c0ab3decc4b99c1
	ldswa	[%i1+%o5]0x88,%l5	! %l5 = ffffffffffffffff

p0_label_73:
!	Mem[00000000201c0000] = fff04531, %l1 = 00000000f6809cc5
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 000000000000fff0
!	Mem[0000000030041410] = c1994bcc, %l4 = 0000000047075cff
	lduha	[%i1+%o5]0x81,%l4	! %l4 = 000000000000c199
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000010001400] = b80b4134 7119b5cf 000000b8 ff000000
!	Mem[0000000010001410] = cffbffff 00000072 b857bea6 c0361918
!	Mem[0000000010001420] = b14ef534 5475cac2 f7ccb635 bbbdc0cb
!	Mem[0000000010001430] = 7fffffff 3b7d6197 72fc3a4e 71368f33
	ldda	[%i0]ASI_BLK_P,%f0	! Block Load from 0000000010001400
!	Mem[00000000300c1400] = 9b5a0000, %l0 = 00000000000000ff
	ldsha	[%i3+%g0]0x81,%l0	! %l0 = ffffffffffff9b5a
!	Mem[00000000300c1400] = 9b5a0000, %l6 = 000000003a2b0000
	lduha	[%i3+%g0]0x81,%l6	! %l6 = 0000000000009b5a
!	Mem[0000000010041400] = 00000000, %l7 = 000000000fdce777
	lduba	[%i1+%g0]0x88,%l7	! %l7 = 0000000000000000
!	%f16 = 0000004d 47075cff cb3f38b5 6bcdf0ff
!	%f20 = 00002b3a 51eba96c 00000000 6bcdf0ff
!	%f24 = 6c949a2b 00000000 0fdce777 ffff003f
!	%f28 = ffffffff 339398c5 7fffffff 6cc8166b
	stda	%f16,[%i3]ASI_BLK_PL	! Block Store to 00000000100c1400
!	Mem[0000000030181410] = ffddfdde, %l5 = ffffffffffffffff
	ldsba	[%i6+%o5]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010101400] = e3de4eff, %l1 = 000000000000fff0
	ldsha	[%i4+%g0]0x88,%l1	! %l1 = 0000000000004eff
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffff9b5a, Mem[0000000010041438] = 72fc3a4e
	stw	%l0,[%i1+0x038]		! Mem[0000000010041438] = ffff9b5a

p0_label_74:
!	Mem[0000000010041408] = 679affff, %l4 = 000000000000c199
	swapa	[%i1+%o4]0x88,%l4	! %l4 = 00000000679affff
!	Mem[0000000010141410] = 43000000, %l6 = 0000000000009b5a
	ldstuba	[%i5+%o5]0x88,%l6	! %l6 = 00000000000000ff
	membar	#Sync			! Added by membar checker (15)
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010001408] = 000000b8 ff000000
	stda	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000 00000000
!	Mem[0000000010101400] = ff4edee3, %l7 = 0000000000000000
	swap	[%i4+%g0],%l7		! %l7 = 00000000ff4edee3
!	%f6  = b857bea6 c0361918, %l6 = 0000000000000000
!	Mem[00000000100c1410] = 6ca9eb513a2b0000
	add	%i3,0x010,%g1
	stda	%f6,[%g1+%l6]ASI_PST32_P ! Mem[00000000100c1410] = 6ca9eb513a2b0000
!	%l4 = 00000000679affff, Mem[0000000021800040] = 81b6ea86, %asi = 80
	stha	%l4,[%o3+0x040]%asi	! Mem[0000000021800040] = ffffea86
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010001400] = b80b4134 7119b5cf
	stda	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000ff 00000000
!	Mem[0000000010101430] = b6bfb931, %l5 = ffffffffffffffff
	swap	[%i4+0x030],%l5		! %l5 = 00000000b6bfb931
!	%f12 = 7fffffff, Mem[0000000010041400] = 00000000
	sta	%f12,[%i1+%g0]0x88	! Mem[0000000010041400] = 7fffffff
!	Starting 10 instruction Load Burst
!	%l6 = 0000000000000000, immed = 0000091a, %y  = ffffff00
	smul	%l6,0x91a,%l1		! %l1 = 0000000000000000, %y = 00000000

p0_label_75:
!	Mem[0000000010081408] = 77e7dcff, %l6 = 0000000000000000
	ldsha	[%i2+%o4]0x88,%l6	! %l6 = ffffffffffffdcff
!	Mem[00000000100c1424] = 2b9a946c, %l5 = 00000000b6bfb931
	lduha	[%i3+0x024]%asi,%l5	! %l5 = 0000000000002b9a
!	Mem[0000000010081408] = ffdce777, %l5 = 0000000000002b9a
	ldsba	[%i2+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030041410] = c1994bcc, %l0 = ffffffffffff9b5a
	lduwa	[%i1+%o5]0x81,%l0	! %l0 = 00000000c1994bcc
!	Mem[00000000100c1404] = 4d000000, %l3 = 0000000000000000
	ldsh	[%i3+0x006],%l3		! %l3 = 0000000000000000
!	Mem[0000000020800040] = 28610070, %l1 = 0000000000000000
	lduba	[%o1+0x041]%asi,%l1	! %l1 = 0000000000000061
!	Mem[0000000010141400] = cef359c1 a6ff57b8, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i5+%g0]0x80,%l2	! %l2 = 00000000cef359c1 00000000a6ff57b8
!	Mem[0000000030001408] = fffffbcf, %l5 = ffffffffffffffff
	ldsba	[%i0+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000100c1410] = 51eba96c, %l5 = ffffffffffffffff
	lduba	[%i3+%o5]0x88,%l5	! %l5 = 000000000000006c
!	Starting 10 instruction Store Burst
!	Mem[0000000010181416] = 77e7dc0f, %l0 = 00000000c1994bcc
	ldstuba	[%i6+0x016]%asi,%l0	! %l0 = 000000dc000000ff

p0_label_76:
!	Mem[0000000030101400] = f6b49455, %l7 = 00000000ff4edee3
	swapa	[%i4+%g0]0x89,%l7	! %l7 = 00000000f6b49455
!	Mem[00000000201c0000] = fff04531, %l2 = 00000000cef359c1
	ldstub	[%o0+%g0],%l2		! %l2 = 000000ff000000ff
!	%l4 = 679affff, %l5 = 0000006c, Mem[0000000030001400] = 7119b5cf c406c676
	stda	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 679affff 0000006c
!	Mem[0000000030001408] = cffbffff, %l7 = 00000000f6b49455
	ldstuba	[%i0+%o4]0x89,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030081408] = bbbdbfad, %l7 = 00000000000000ff
	ldstuba	[%i2+%o4]0x89,%l7	! %l7 = 000000ad000000ff
!	Mem[0000000010101410] = cffbffff, %l7 = 00000000000000ad
	swapa	[%i4+%o5]0x88,%l7	! %l7 = 00000000cffbffff
!	Mem[00000000100c141c] = 00000000, %l3 = 00000000a6ff57b8
	swap	[%i3+0x01c],%l3		! %l3 = 0000000000000000
!	%f14 = 72fc3a4e 71368f33, %l5 = 000000000000006c
!	Mem[0000000030101400] = e3de4effad2001a8
	stda	%f14,[%i4+%l5]ASI_PST32_S ! Mem[0000000030101400] = e3de4effad2001a8
!	%f20 = 00002b3a 51eba96c, %l1 = 0000000000000061
!	Mem[0000000010081400] = ff002b3a77e7dc0f
	stda	%f20,[%i2+%l1]ASI_PST8_PL ! Mem[0000000010081400] = 6c002b3a772b000f
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00005a9b, %f9  = 5475cac2
	lda	[%i3+%g0]0x89,%f9 	! %f9 = 00005a9b

p0_label_77:
!	Mem[0000000010101410] = ad000000, %l2 = 00000000000000ff
	lduba	[%i4+%o5]0x80,%l2	! %l2 = 00000000000000ad
!	Mem[0000000030081408] = bbbdbfff, %l4 = 00000000679affff
	ldswa	[%i2+%o4]0x89,%l4	! %l4 = ffffffffbbbdbfff
!	Mem[0000000010181418] = 56f58c35 d214d6f1, %l2 = 000000ad, %l3 = 00000000
	ldd	[%i6+0x018],%l2		! %l2 = 0000000056f58c35 00000000d214d6f1
!	%f11 = bbbdc0cb, Mem[0000000030181410] = defdddff
	sta	%f11,[%i6+%o5]0x89	! Mem[0000000030181410] = bbbdc0cb
!	Mem[0000000010181408] = ff000000, %l2 = 0000000056f58c35
	ldsba	[%i6+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010081400] = 6c002b3a, %l3 = 00000000d214d6f1
	ldub	[%i2+%g0],%l3		! %l3 = 000000000000006c
!	Mem[0000000010081410] = ffbe57b8, %f18 = cb3f38b5
	lda	[%i2+0x010]%asi,%f18	! %f18 = ffbe57b8
!	Mem[0000000010041410] = ffffffff, %l5 = 000000000000006c
	lduha	[%i1+%o5]0x88,%l5	! %l5 = 000000000000ffff
!	Mem[00000000100c1410] = 6ca9eb51, %l4 = ffffffffbbbdbfff
	lduwa	[%i3+%o5]0x80,%l4	! %l4 = 000000006ca9eb51
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 00000000, %l6 = ffffffffffffdcff
	ldstuba	[%i6+%g0]0x88,%l6	! %l6 = 00000000000000ff

p0_label_78:
!	%l6 = 00000000, %l7 = cffbffff, Mem[0000000010041400] = 7fffffff be000000
	stda	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000 cffbffff
!	%f22 = 00000000 6bcdf0ff, Mem[00000000300c1408] = ff000000 0000005e
	stda	%f22,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000 6bcdf0ff
!	%f16 = 0000004d 47075cff, Mem[0000000030101400] = ff4edee3 a80120ad
	stda	%f16,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000004d 47075cff
!	%l2 = ffffffffffffffff, Mem[0000000010181408] = 000000ff
	stha	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000ffff
!	Mem[0000000010181408] = 0000ffff, %l4 = 000000006ca9eb51
	ldstuba	[%i6+%o4]0x88,%l4	! %l4 = 000000ff000000ff
!	%l2 = ffffffffffffffff, Mem[0000000010181403] = ff000000, %asi = 80
	stba	%l2,[%i6+0x003]%asi	! Mem[0000000010181400] = ff0000ff
!	Mem[0000000010101400] = 00000000, %l6 = 0000000000000000
	swapa	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000000
!	%f16 = 0000004d 47075cff, %l6 = 0000000000000000
!	Mem[0000000010041418] = 00000061c88d05cb
	add	%i1,0x018,%g1
	stda	%f16,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010041418] = 00000061c88d05cb
!	%l5 = 000000000000ffff, Mem[0000000010001400] = ff000000
	stba	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = ff0000ff
!	Starting 10 instruction Load Burst
!	%f7  = c0361918, %f3  = ff000000, %f30 = 7fffffff 6cc8166b
	fsmuld	%f7 ,%f3 ,%f30		! %f30 = 47f6c323 00000000

p0_label_79:
!	%l2 = ffffffffffffffff, %l3 = 000000000000006c, %l3 = 000000000000006c
	xor	%l2,%l3,%l3		! %l3 = ffffffffffffff93
!	Mem[0000000010101404] = 498e1ef8, %l4 = 00000000000000ff
	ldsb	[%i4+0x007],%l4		! %l4 = fffffffffffffff8
!	Mem[0000000021800100] = 9e82458c, %l6 = 0000000000000000
	ldub	[%o3+0x101],%l6		! %l6 = 0000000000000082
!	Mem[0000000010181400] = ff0000ff, %l2 = ffffffffffffffff
	ldswa	[%i6+%g0]0x88,%l2	! %l2 = ffffffffff0000ff
!	Mem[0000000030081410] = fff0cd6b, %l5 = 000000000000ffff
	lduba	[%i2+%o5]0x89,%l5	! %l5 = 000000000000006b
!	Mem[0000000021800100] = 9e82458c, %l2 = ffffffffff0000ff
	ldsh	[%o3+0x100],%l2		! %l2 = ffffffffffff9e82
!	Mem[0000000021800140] = 19ea9645, %l7 = 00000000cffbffff
	lduha	[%o3+0x140]%asi,%l7	! %l7 = 00000000000019ea
!	Mem[0000000010101408] = 6ca9eb51, %l4 = fffffffffffffff8
	ldsba	[%i4+%o4]0x80,%l4	! %l4 = 000000000000006c
!	Mem[0000000030181408] = ff00fff0, %l2 = ffffffffffff9e82
	ldswa	[%i6+%o4]0x81,%l2	! %l2 = ffffffffff00fff0
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffff93, Mem[0000000030001400] = 679affff
	stha	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 679aff93

p0_label_80:
!	%l4 = 0000006c, %l5 = 0000006b, Mem[0000000010001408] = 00000000 00000000
	stda	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000006c 0000006b
!	%f6  = b857bea6, Mem[0000000030181410] = cbc0bdbb
	sta	%f6 ,[%i6+%o5]0x81	! Mem[0000000030181410] = b857bea6
!	Mem[0000000010001425] = 5475cac2, %l0 = 00000000000000dc
	ldstuba	[%i0+0x025]%asi,%l0	! %l0 = 00000075000000ff
!	%l2 = ffffffffff00fff0, Mem[0000000030041408] = 034d8e45ffffffff
	stxa	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffffff00fff0
!	Code Fragment 3
p0_fragment_7:
!	%l0 = 0000000000000075
	setx	0x768ad4605a853a02,%g7,%l0 ! %l0 = 768ad4605a853a02
!	%l1 = 0000000000000061
	setx	0x125d6ec78bfc68bd,%g7,%l1 ! %l1 = 125d6ec78bfc68bd
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 768ad4605a853a02
	setx	0x8c1befe8130e0ed3,%g7,%l0 ! %l0 = 8c1befe8130e0ed3
!	%l1 = 125d6ec78bfc68bd
	setx	0x048ae98faf9d65b0,%g7,%l1 ! %l1 = 048ae98faf9d65b0
!	%l6 = 0000000000000082, Mem[0000000010001400] = ff0000ff
	stwa	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000082
!	%l5 = 000000000000006b, Mem[00000000201c0000] = fff04531
	stb	%l5,[%o0+%g0]		! Mem[00000000201c0000] = 6bf04531
!	%l6 = 00000082, %l7 = 000019ea, Mem[0000000010181408] = 0000ffff 00000000
	stda	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000082 000019ea
!	%l0 = 8c1befe8130e0ed3, Mem[0000000021800001] = d9df9cd4
	stb	%l0,[%o3+0x001]		! Mem[0000000021800000] = d9d39cd4
!	Starting 10 instruction Load Burst
!	%f13 = 3b7d6197, %f1  = 7119b5cf, %f8  = b14ef534
	fadds	%f13,%f1 ,%f8 		! %f8  = 7119b5cf

p0_label_81:
!	Mem[000000001018142c] = d3be5ea7, %l0 = 8c1befe8130e0ed3
	lduw	[%i6+0x02c],%l0		! %l0 = 00000000d3be5ea7
!	Mem[0000000010101410] = 000000ad, %l4 = 000000000000006c
	ldswa	[%i4+%o5]0x88,%l4	! %l4 = 00000000000000ad
!	Mem[00000000100c1408] = fff0cd6b, %f20 = 00002b3a
	lda	[%i3+%o4]0x80,%f20	! %f20 = fff0cd6b
!	Mem[0000000010081408] = 00002b3a77e7dcff, %f24 = 6c949a2b 00000000
	ldda	[%i2+%o4]0x88,%f24	! %f24 = 00002b3a 77e7dcff
!	Mem[0000000030101408] = 00000043, %l1 = 048ae98faf9d65b0
	ldsba	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000043
!	Mem[0000000010081410] = ffbe57b8b8e0004d, %l6 = 0000000000000082
	ldx	[%i2+%o5],%l6		! %l6 = ffbe57b8b8e0004d
!	Mem[00000000100c1400] = ff5c0747, %f31 = 00000000
	lda	[%i3+%g0]0x80,%f31	! %f31 = ff5c0747
!	Mem[0000000030141410] = dfd9000000000000, %l0 = 00000000d3be5ea7
	ldxa	[%i5+%o5]0x81,%l0	! %l0 = dfd9000000000000
!	Mem[000000001010142c] = 56712eba, %l7 = 00000000000019ea
	ldsh	[%i4+0x02c],%l7		! %l7 = 0000000000005671
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000005671, Mem[0000000010081434] = 458e4d03, %asi = 80
	stha	%l7,[%i2+0x034]%asi	! Mem[0000000010081434] = 56714d03

p0_label_82:
!	%f7  = c0361918, Mem[0000000010001410] = fffffbcf
	sta	%f7 ,[%i0+%o5]0x88	! Mem[0000000010001410] = c0361918
!	Mem[0000000030101400] = ff5c0747, %l6 = ffbe57b8b8e0004d
	swapa	[%i4+%g0]0x81,%l6	! %l6 = 00000000ff5c0747
!	Mem[00000000100c1410] = 6ca9eb51, %l5 = 000000000000006b
	swap	[%i3+%o5],%l5		! %l5 = 000000006ca9eb51
!	%l6 = 00000000ff5c0747, Mem[0000000010041408] = 99c10000, %asi = 80
	stwa	%l6,[%i1+0x008]%asi	! Mem[0000000010041408] = ff5c0747
!	%f30 = 47f6c323 ff5c0747, Mem[0000000010081400] = 6c002b3a 772b000f
	stda	%f30,[%i2+%g0]0x80	! Mem[0000000010081400] = 47f6c323 ff5c0747
!	Mem[0000000010141410] = 430000ff, %l2 = ffffffffff00fff0
	lduwa	[%i5+%o5]0x88,%l2	! %l2 = 00000000430000ff
!	Mem[0000000010041400] = 00000000, %l4 = 00000000000000ad
	ldstuba	[%i1+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	%f18 = ffbe57b8 6bcdf0ff, Mem[0000000030101408] = 00000043 b8000000
	stda	%f18,[%i4+%o4]0x89	! Mem[0000000030101408] = ffbe57b8 6bcdf0ff
!	%l4 = 0000000000000000, Mem[0000000010141408] = 00000000
	stha	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 6c000000, %l3 = ffffffffffffff93
	ldsba	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000000

p0_label_83:
!	Mem[0000000010141424] = 4ead84b8, %l2 = 00000000430000ff
	ldub	[%i5+0x027],%l2		! %l2 = 00000000000000b8
!	Mem[0000000010101410] = 000000ad, %l6 = 00000000ff5c0747
	ldswa	[%i4+%o5]0x88,%l6	! %l6 = 00000000000000ad
!	Mem[0000000010001410] = 181936c0, %l1 = 0000000000000043
	lduha	[%i0+0x010]%asi,%l1	! %l1 = 0000000000001819
!	Mem[0000000030101410] = 3f00ffff, %f31 = ff5c0747
	lda	[%i4+%o5]0x89,%f31	! %f31 = 3f00ffff
!	Mem[0000000030081408] = bbbdbfff, %l7 = 0000000000005671
	lduwa	[%i2+%o4]0x89,%l7	! %l7 = 00000000bbbdbfff
!	Mem[0000000030141410] = 000000000000d9df, %f26 = 0fdce777 ffff003f
	ldda	[%i5+%o5]0x89,%f26	! %f26 = 00000000 0000d9df
!	Mem[0000000010101408] = 6ca9eb51, %l4 = 0000000000000000
	lduw	[%i4+%o4],%l4		! %l4 = 000000006ca9eb51
!	Mem[000000001004143c] = 439b4544, %l7 = 00000000bbbdbfff
	lduh	[%i1+0x03e],%l7		! %l7 = 0000000000004544
!	Mem[0000000030181410] = a6be57b8, %l6 = 00000000000000ad
	ldsba	[%i6+%o5]0x89,%l6	! %l6 = ffffffffffffffb8
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000b8, Mem[0000000010101428] = d68ff21c56712eba, %asi = 80
	stxa	%l2,[%i4+0x028]%asi	! Mem[0000000010101428] = 00000000000000b8

p0_label_84:
!	Mem[0000000010041401] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i1+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1418] = fff0cd6ba6ff57b8, %l2 = 00000000000000b8, %l6 = ffffffffffffffb8
	add	%i3,0x18,%g1
	casxa	[%g1]0x80,%l2,%l6	! %l6 = fff0cd6ba6ff57b8
!	%l4 = 000000006ca9eb51, Mem[0000000030001408] = 00000000cffbffff
	stxa	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000006ca9eb51
!	Mem[000000001010142b] = 00000000, %l2 = 00000000000000b8
	ldstub	[%i4+0x02b],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010081410] = ffbe57b8, %l0 = dfd9000000000000
	swapa	[%i2+%o5]0x80,%l0	! %l0 = 00000000ffbe57b8
!	%f9  = 00005a9b, Mem[0000000010081400] = 23c3f647
	sta	%f9 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 00005a9b
!	Mem[0000000021800001] = d9d39cd4, %l0 = 00000000ffbe57b8
	ldstuba	[%o3+0x001]%asi,%l0	! %l0 = 000000d3000000ff
!	Mem[0000000010041410] = ffffffff, %l0 = 00000000000000d3
	swapa	[%i1+%o5]0x80,%l0	! %l0 = 00000000ffffffff
!	%l3 = 0000000000000000, Mem[0000000010001408] = 6c000000
	stha	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 6c000000
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 28610070, %l3 = 0000000000000000
	lduba	[%o1+0x041]%asi,%l3	! %l3 = 0000000000000061

p0_label_85:
!	Mem[0000000010181408] = 00000082, %l6 = fff0cd6ba6ff57b8
	swapa	[%i6+%o4]0x88,%l6	! %l6 = 0000000000000082
!	Mem[0000000010141410] = 430000ff, %l2 = 0000000000000000
	ldsha	[%i5+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1408] = 6bcdf0ff, %l2 = 00000000000000ff
	lduba	[%i3+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041400] = ffff0000, %l2 = 00000000000000ff
	ldsba	[%i1+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141424] = 4ead84b8, %l1 = 0000000000001819
	lduwa	[%i5+0x024]%asi,%l1	! %l1 = 000000004ead84b8
!	Mem[0000000010001408] = 0000006c, %l3 = 0000000000000061
	ldswa	[%i0+%o4]0x80,%l3	! %l3 = 000000000000006c
!	Mem[0000000010081408] = ffdce777, %f24 = 00002b3a
	lda	[%i2+%o4]0x80,%f24	! %f24 = ffdce777
!	Mem[00000000300c1410] = 01c906d9, %l5 = 000000006ca9eb51
	ldswa	[%i3+%o5]0x81,%l5	! %l5 = 0000000001c906d9
!	Mem[0000000020800000] = 005e8841, %l0 = 00000000ffffffff
	lduba	[%o1+0x001]%asi,%l0	! %l0 = 000000000000005e
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = a6ff57b8, %l6 = 0000000000000082
	ldstuba	[%i6+%o4]0x88,%l6	! %l6 = 000000b8000000ff

p0_label_86:
!	%f4  = cffbffff 00000072, Mem[0000000010101418] = f26a7a97 31ccb6b8
	std	%f4 ,[%i4+0x018]	! Mem[0000000010101418] = cffbffff 00000072
!	Mem[000000001018143a] = f6b49455, %l7 = 0000000000004544
	ldstub	[%i6+0x03a],%l7		! %l7 = 00000094000000ff
!	Mem[00000000100c1400] = ff5c0747, %l6 = 000000b8, %l6 = 000000b8
	casa	[%i3]0x80,%l6,%l6	! %l6 = 00000000ff5c0747
!	Mem[0000000010041418] = 00000061, %l1 = 000000004ead84b8
	swap	[%i1+0x018],%l1		! %l1 = 0000000000000061
!	Mem[0000000010001408] = 6c000000, %l4 = 000000006ca9eb51
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%l7 = 0000000000000094, %l0 = 000000000000005e, %y  = 00000000
	smul	%l7,%l0,%l4		! %l4 = 0000000000003658, %y = 00000000
!	%l6 = 00000000ff5c0747, Mem[0000000021800040] = ffffea86, %asi = 80
	stba	%l6,[%o3+0x040]%asi	! Mem[0000000021800040] = 47ffea86
!	Mem[0000000010181410] = 00002b3a, %l2 = ffffffffffffffff, %asi = 80
	swapa	[%i6+0x010]%asi,%l2	! %l2 = 0000000000002b3a
!	Mem[00000000100c143c] = ffffff7f, %l3 = 000000000000006c
	swap	[%i3+0x03c],%l3		! %l3 = 00000000ffffff7f
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00002b3a6b000000, %f12 = 7fffffff 3b7d6197
	ldda	[%i3+%o5]0x88,%f12	! %f12 = 00002b3a 6b000000

p0_label_87:
!	Mem[0000000010141404] = a6ff57b8, %l7 = 0000000000000094
	lduw	[%i5+0x004],%l7		! %l7 = 00000000a6ff57b8
!	Mem[0000000030181410] = b857bea6, %l6 = 00000000ff5c0747
	lduha	[%i6+%o5]0x81,%l6	! %l6 = 000000000000b857
!	Mem[00000000201c0000] = 6bf04531, %l5 = 0000000001c906d9
	ldub	[%o0+0x001],%l5		! %l5 = 00000000000000f0
!	Mem[0000000010181410] = ffffffff, %l7 = 00000000a6ff57b8
	ldswa	[%i6+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010001410] = 181936c0, %l1 = 0000000000000061
	ldsha	[%i0+0x012]%asi,%l1	! %l1 = 00000000000036c0
!	Mem[00000000218000c0] = 00285589, %l1 = 00000000000036c0
	lduba	[%o3+0x0c0]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101428] = 000000ff, %f10 = f7ccb635
	lda	[%i4+0x028]%asi,%f10	! %f10 = 000000ff
!	Mem[0000000030101408] = 6bcdf0ff, %l0 = 000000000000005e
	ldsba	[%i4+%o4]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030001410] = cffbffff, %l3 = 00000000ffffff7f
	lduha	[%i0+%o5]0x81,%l3	! %l3 = 000000000000cffb
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = ff5c07474d000000, %l4 = 0000000000003658, %l1 = 0000000000000000
	casxa	[%i3]0x80,%l4,%l1	! %l1 = ff5c07474d000000

p0_label_88:
!	Mem[0000000010141410] = ff000043, %l6 = 000000000000b857
	swapa	[%i5+%o5]0x80,%l6	! %l6 = 00000000ff000043
!	Mem[0000000030081410] = fff0cd6b, %l1 = ff5c07474d000000
	ldstuba	[%i2+%o5]0x89,%l1	! %l1 = 0000006b000000ff
!	Mem[0000000010081408] = 77e7dcff, %l2 = 0000000000002b3a
	ldstuba	[%i2+%o4]0x88,%l2	! %l2 = 000000ff000000ff
!	%l6 = 00000000ff000043, Mem[0000000030041408] = ffffffff
	stha	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = ffff0043
!	%f14 = 72fc3a4e, Mem[00000000300c1408] = 00000000
	sta	%f14,[%i3+%o4]0x81	! Mem[00000000300c1408] = 72fc3a4e
!	%f16 = 0000004d 47075cff ffbe57b8 6bcdf0ff
!	%f20 = fff0cd6b 51eba96c 00000000 6bcdf0ff
!	%f24 = ffdce777 77e7dcff 00000000 0000d9df
!	%f28 = ffffffff 339398c5 47f6c323 3f00ffff
	stda	%f16,[%i4]ASI_BLK_P	! Block Store to 0000000010101400
!	%l0 = ffffffffffffffff, Mem[0000000021800141] = 19ea9645, %asi = 80
	stba	%l0,[%o3+0x141]%asi	! Mem[0000000021800140] = 19ff9645
!	%f8  = 7119b5cf 00005a9b, Mem[0000000010001410] = 181936c0 00000072
	stda	%f8 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 7119b5cf 00005a9b
!	%l4 = 00003658, %l5 = 000000f0, Mem[0000000010101410] = fff0cd6b 51eba96c
	stda	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 00003658 000000f0
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 9b5a0000 5a000000, %l4 = 00003658, %l5 = 000000f0
	ldda	[%i3+%g0]0x81,%l4	! %l4 = 000000009b5a0000 000000005a000000

p0_label_89:
!	Mem[000000001004143c] = 439b4544, %l5 = 000000005a000000
	ldsw	[%i1+0x03c],%l5		! %l5 = 00000000439b4544
!	Mem[00000000201c0000] = 6bf04531, %l4 = 000000009b5a0000
	lduba	[%o0+0x000]%asi,%l4	! %l4 = 000000000000006b
!	Mem[0000000010001400] = 82000000, %l2 = 00000000000000ff
	lduba	[%i0+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141410] = dfd90000, %l2 = 0000000000000000
	ldsba	[%i5+%o5]0x81,%l2	! %l2 = ffffffffffffffdf
!	Mem[0000000010041410] = 000000d3 ffffffff, %l2 = ffffffdf, %l3 = 0000cffb
	ldda	[%i1+%o5]0x80,%l2	! %l2 = 00000000000000d3 00000000ffffffff
!	Mem[0000000030181408] = ff00fff0, %l2 = 00000000000000d3
	lduha	[%i6+%o4]0x81,%l2	! %l2 = 000000000000ff00
!	%l6 = 00000000ff000043, Mem[00000000100c142c] = 77e7dc0f, %asi = 80
	stha	%l6,[%i3+0x02c]%asi	! Mem[00000000100c142c] = 0043dc0f
!	Mem[0000000030041410] = c1994bcc, %l0 = ffffffffffffffff
	ldsha	[%i1+%o5]0x81,%l0	! %l0 = ffffffffffffc199
!	%l2 = 000000000000ff00, %l0 = ffffffffffffc199, %l3 = 00000000ffffffff
	xnor	%l2,%l0,%l3		! %l3 = 000000000000c166
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000010101410] = 00003658, %l5 = 00000000439b4544
	ldstuba	[%i4+%o5]0x80,%l5	! %l5 = 00000000000000ff

p0_label_90:
!	%l4 = 000000000000006b, Mem[0000000030141400] = 000000ff
	stwa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000006b
!	Mem[00000000100c1410] = 0000006b, %l5 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%f16 = 0000004d 47075cff ffbe57b8 6bcdf0ff
!	%f20 = fff0cd6b 51eba96c 00000000 6bcdf0ff
!	%f24 = ffdce777 77e7dcff 00000000 0000d9df
!	%f28 = ffffffff 339398c5 47f6c323 3f00ffff
	stda	%f16,[%i4]ASI_BLK_S	! Block Store to 0000000030101400
!	Mem[0000000030141400] = 0000006b, %l1 = 000000000000006b
	ldstuba	[%i5+%g0]0x89,%l1	! %l1 = 0000006b000000ff
!	%l1 = 000000000000006b, %l1 = 000000000000006b, %y  = 00000000
	udiv	%l1,%l1,%l3		! %l3 = 0000000000000001
	mov	%l0,%y			! %y = ffffc199
!	%l0 = ffffffffffffc199, Mem[0000000030141408] = ffffffff
	stwa	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffc199
!	%l5 = 0000000000000000, Mem[0000000010181410] = 0fffe777ffffffff
	stxa	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000000000000000
!	%f0  = b80b4134 7119b5cf, Mem[0000000030001410] = fffffbcf 3f00ffff
	stda	%f0 ,[%i0+%o5]0x89	! Mem[0000000030001410] = b80b4134 7119b5cf
!	%f12 = 00002b3a, %f9  = 00005a9b
	fcmpes	%fcc1,%f12,%f9 		! %fcc1 = 1
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_8:
!	%l0 = ffffffffffffc199
	setx	0x74781ca057e8c8d8,%g7,%l0 ! %l0 = 74781ca057e8c8d8
!	%l1 = 000000000000006b
	setx	0xa2fcb597e6536699,%g7,%l1 ! %l1 = a2fcb597e6536699
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 74781ca057e8c8d8
	setx	0xde1b3cc7e804a680,%g7,%l0 ! %l0 = de1b3cc7e804a680
!	%l1 = a2fcb597e6536699
	setx	0xcf04f5f05c05b042,%g7,%l1 ! %l1 = cf04f5f05c05b042

p0_label_91:
!	%l2 = 000000000000ff00, %l7 = ffffffffffffffff, %y  = ffffc199
	smul	%l2,%l7,%l3		! %l3 = ffffffffffff0100, %y = ffffffff
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000030101408] = b857beff, %l4 = 000000000000006b
	ldsha	[%i4+%o4]0x89,%l4	! %l4 = ffffffffffffbeff
!	%l0 = e804a680, %l1 = 5c05b042, Mem[0000000030041410] = cc4b99c1 5c0ab3de
	stda	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = e804a680 5c05b042
!	Mem[0000000010101410] = ff003658, %l0 = de1b3cc7e804a680
	lduba	[%i4+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081430] = ffffffff, %l3 = ffffffffffff0100
	lduba	[%i2+0x032]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101410] = ff003658, %l7 = ffffffffffffffff
	ldswa	[%i4+%o5]0x80,%l7	! %l7 = ffffffffff003658
!	Mem[0000000020800040] = 28610070, %l1 = cf04f5f05c05b042
	ldsba	[%o1+0x041]%asi,%l1	! %l1 = 0000000000000061
!	Mem[0000000010001400] = 82000000, %f10 = 000000ff
	lda	[%i0+%g0]0x88,%f10	! %f10 = 82000000
!	Mem[0000000010041400] = ffff0000, %l7 = ffffffffff003658
	ldsha	[%i1+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l5	! %l5 = 00000000000000ff

p0_label_92:
!	%l5 = 0000000000000000, Mem[0000000010101408] = b857beff
	stwa	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	Mem[0000000010041418] = 4ead84b8c88d05cb, %l2 = 000000000000ff00, %l7 = ffffffffffffffff
	add	%i1,0x18,%g1
	casxa	[%g1]0x80,%l2,%l7	! %l7 = 4ead84b8c88d05cb
!	Mem[0000000030181400] = ff5c0747, %l7 = 4ead84b8c88d05cb
	swapa	[%i6+%g0]0x81,%l7	! %l7 = 00000000ff5c0747
!	Mem[0000000010041410] = 000000d3, %l4 = ffffffffffffbeff
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 00000000000000d3
!	%l0 = 000000ff, %l1 = 00000061, Mem[0000000030101408] = ffbe57b8 6bcdf0ff
	stda	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ff 00000061
!	%l7 = 00000000ff5c0747, Mem[0000000030081410] = ffcdf0ff
	stba	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 47cdf0ff
!	%l2 = 000000000000ff00, Mem[0000000030181400] = cb058dc8
	stwa	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000ff00
!	%l6 = ff000043, %l7 = ff5c0747, Mem[0000000030001410] = 7119b5cf b80b4134
	stda	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = ff000043 ff5c0747
!	Mem[0000000020800000] = 005e8841, %l1 = 0000000000000061
	ldstub	[%o1+%g0],%l1		! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = b8000000d906c901, %l1 = 0000000000000000
	ldxa	[%i3+%o5]0x89,%l1	! %l1 = b8000000d906c901

p0_label_93:
!	Mem[0000000010081410] = 00000000, %l7 = 00000000ff5c0747
	ldswa	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101408] = 00000000 6bcdf0ff, %l6 = ff000043, %l7 = 00000000
	ldda	[%i4+0x008]%asi,%l6	! %l6 = 0000000000000000 000000006bcdf0ff
!	Mem[0000000030181410] = b857bea6, %l1 = b8000000d906c901
	ldswa	[%i6+%o5]0x81,%l1	! %l1 = ffffffffb857bea6
!	Mem[0000000010181420] = cbc0bdbb00005a9b, %f26 = 00000000 0000d9df
	ldd	[%i6+0x020],%f26	! %f26 = cbc0bdbb 00005a9b
!	Mem[0000000010081410] = 00000000, %l7 = 000000006bcdf0ff
	lduha	[%i2+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = ff5c0747, %l0 = 00000000000000ff
	lduba	[%i3+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001400] = 82000000, %l2 = 000000000000ff00
	lduha	[%i0+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1408] = 6bcdf0ff, %l2 = 0000000000000000
	ldsba	[%i3+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030181408] = ff00fff0, %l0 = 00000000000000ff
	lduba	[%i6+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f14 = 72fc3a4e 71368f33, %l6 = 0000000000000000
!	Mem[00000000300c1410] = 01c906d9000000b8
	add	%i3,0x010,%g1
	stda	%f14,[%g1+%l6]ASI_PST16_SL ! Mem[00000000300c1410] = 01c906d9000000b8

p0_label_94:
!	Mem[0000000010141409] = ff000000, %l6 = 0000000000000000
	ldstuba	[%i5+0x009]%asi,%l6	! %l6 = 00000000000000ff
!	%f0  = b80b4134, %f23 = 6bcdf0ff
	fcmps	%fcc3,%f0 ,%f23		! %fcc3 = 1
!	%l3 = 00000000000000ff, immed = fffffc92, %y  = ffffffff
	sdiv	%l3,-0x36e,%l6		! %l6 = 00000000004aa472
	mov	%l0,%y			! %y = 000000ff
!	%l0 = 000000ff, %l1 = b857bea6, Mem[0000000030041408] = 4300ffff ff00fff0
	stda	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000ff b857bea6
!	%l3 = 00000000000000ff, Mem[0000000010101410] = ff003658
	stwa	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000ff
!	Mem[0000000010181400] = ff0000ff, %l2 = ffffffffffffffff
	swapa	[%i6+%g0]0x80,%l2	! %l2 = 00000000ff0000ff
!	%l3 = 00000000000000ff, immed = 00000849, %y  = 000000ff
	smul	%l3,0x849,%l3		! %l3 = 00000000000840b7, %y = 00000000
!	%l2 = ff0000ff, %l3 = 000840b7, Mem[0000000030141400] = 000000ff 0c000000
	stda	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = ff0000ff 000840b7
!	%l7 = 0000000000000000, imm = fffffffffffff4d4, %l3 = 00000000000840b7
	subc	%l7,-0xb2c,%l3		! %l3 = 0000000000000b2c
!	Starting 10 instruction Load Burst
!	%l5 = 0000000000000000, imm = fffffffffffff64c, %l5 = 0000000000000000
	subc	%l5,-0x9b4,%l5		! %l5 = 00000000000009b4

p0_label_95:
!	Mem[0000000010101408] = 000000006bcdf0ff, %f8  = 7119b5cf 00005a9b
	ldda	[%i4+0x008]%asi,%f8 	! %f8  = 00000000 6bcdf0ff
!	Mem[00000000300c1400] = 9b5a0000, %l1 = ffffffffb857bea6
	ldsba	[%i3+%g0]0x81,%l1	! %l1 = ffffffffffffff9b
!	Mem[0000000030041408] = 000000ff, %l2 = 00000000ff0000ff
	lduha	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101408] = 00000000 6bcdf0ff, %l0 = 000000ff, %l1 = ffffff9b
	ldda	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000 000000006bcdf0ff
!	%f8  = 00000000 6bcdf0ff, Mem[0000000010081400] = 9b5a0000 ff5c0747
	stda	%f8 ,[%i2+0x000]%asi	! Mem[0000000010081400] = 00000000 6bcdf0ff
!	Mem[0000000030041410] = 80a604e8, %l5 = 00000000000009b4
	lduba	[%i1+%o5]0x81,%l5	! %l5 = 0000000000000080
!	Mem[0000000010101400] = 4d000000, %l0 = 0000000000000000
	ldsha	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181400] = dfd90000 ffffffff, %l0 = 00000000, %l1 = 6bcdf0ff
	ldda	[%i6+%g0]0x88,%l0	! %l0 = 00000000ffffffff 00000000dfd90000
!	Mem[00000000100c1424] = 2b9a946c, %l7 = 0000000000000000
	lduwa	[%i3+0x024]%asi,%l7	! %l7 = 000000002b9a946c
!	Starting 10 instruction Store Burst
!	%f0  = b80b4134 7119b5cf 000000b8 ff000000
!	%f4  = cffbffff 00000072 b857bea6 c0361918
!	%f8  = 00000000 6bcdf0ff 82000000 bbbdc0cb
!	%f12 = 00002b3a 6b000000 72fc3a4e 71368f33
	stda	%f0,[%i5]ASI_BLK_AIUPL	! Block Store to 0000000010141400

p0_label_96:
!	%l3 = 0000000000000b2c, Mem[00000000218000c0] = 00285589
	stb	%l3,[%o3+0x0c0]		! Mem[00000000218000c0] = 2c285589
!	Mem[0000000010081410] = 00000000, %l4 = 00000000000000d3, %asi = 80
	swapa	[%i2+0x010]%asi,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = 6b0000ff, %l0 = 00000000ffffffff
	ldstuba	[%i3+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030181410] = b857bea6, %l3 = 0000000000000b2c
	ldstuba	[%i6+%o5]0x81,%l3	! %l3 = 000000b8000000ff
!	Mem[0000000010041410] = ffffbeff, %l4 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 00000000ffffbeff
!	Mem[0000000030101408] = 000000ff, %l0 = 00000000000000ff
	ldstuba	[%i4+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	%l0 = 0000000000000000, %l7 = 000000002b9a946c, %l3 = 00000000000000b8
	andn	%l0,%l7,%l3		! %l3 = 0000000000000000
!	%f22 = 00000000 6bcdf0ff, Mem[0000000010181400] = ffffffff 0000d9df
	stda	%f22,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 6bcdf0ff
!	%l3 = 0000000000000000, Mem[0000000010001408] = 6c0000ff
	stwa	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ff0000ff, %l6 = 00000000004aa472
	lduha	[%i5+%g0]0x89,%l6	! %l6 = 00000000000000ff

p0_label_97:
!	Mem[0000000030141400] = 000840b7ff0000ff, %l2 = 0000000000000000
	ldxa	[%i5+%g0]0x89,%l2	! %l2 = 000840b7ff0000ff
!	Mem[000000001008141c] = 191936c0, %l1 = 00000000dfd90000
	ldswa	[%i2+0x01c]%asi,%l1	! %l1 = 00000000191936c0
!	%l1 = 00000000191936c0, imm = fffffffffffffae3, %l1 = 00000000191936c0
	and	%l1,-0x51d,%l1		! %l1 = 00000000191932c0
!	Mem[00000000100c1418] = fff0cd6b a6ff57b8, %l2 = ff0000ff, %l3 = 00000000
	ldda	[%i3+0x018]%asi,%l2	! %l2 = 00000000fff0cd6b 00000000a6ff57b8
!	%l2 = 00000000fff0cd6b, imm = 00000000000000fb, %l3 = 00000000a6ff57b8
	sub	%l2,0x0fb,%l3		! %l3 = 00000000fff0cc70
!	Mem[00000000100c1430] = c5989333, %l7 = 000000002b9a946c
	lduw	[%i3+0x030],%l7		! %l7 = 00000000c5989333
!	Mem[0000000020800040] = 28610070, %l5 = 0000000000000080
	ldub	[%o1+0x040],%l5		! %l5 = 0000000000000028
!	Mem[0000000010041400] = 0000ffff, %l3 = 00000000fff0cc70
	lduba	[%i1+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001400] = 93ff9a67, %l4 = 00000000ffffbeff
	lduwa	[%i0+%g0]0x81,%l4	! %l4 = 0000000093ff9a67
!	Starting 10 instruction Store Burst
!	%l2 = 00000000fff0cd6b, Mem[00000000100c1408] = 6bcdf0ff
	stwa	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = fff0cd6b

p0_label_98:
!	%f28 = ffffffff, Mem[0000000030081408] = bbbdbfff
	sta	%f28,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffffff
!	Mem[0000000010081410] = d3000000, %l5 = 0000000000000028
	ldstuba	[%i2+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	%f25 = 77e7dcff, %f27 = 00005a9b, %f22 = 00000000 6bcdf0ff
	fsmuld	%f25,%f27,%f22		! %l0 = 0000000000000022, Unfinished, %fsr = 1900000000
!	Mem[0000000030101400] = 0000004d, %l3 = 00000000000000ff
	ldstuba	[%i4+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001410] = 430000ff, %l4 = 0000000093ff9a67
	swapa	[%i0+%o5]0x81,%l4	! %l4 = 00000000430000ff
!	Mem[0000000010001410] = 7119b5cf, %l5 = 0000000000000000
	swapa	[%i0+%o5]0x80,%l5	! %l5 = 000000007119b5cf
!	Mem[0000000010181408] = a6ff57ff, %l0 = 0000000000000022
	ldstuba	[%i6+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	%l2 = 00000000fff0cd6b, %l5 = 000000007119b5cf, %y  = 00000000
	udiv	%l2,%l5,%l7		! %l7 = 0000000000000002
	mov	%l0,%y			! %y = 000000ff
!	Mem[0000000010181408] = ff57ffa6, %l5 = 000000007119b5cf
	ldstuba	[%i6+%o4]0x80,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	%l6 = 00000000000000ff, %l5 = 00000000000000ff, %l3 = 0000000000000000
	andn	%l6,%l5,%l3		! %l3 = 0000000000000000

p0_label_99:
!	%f29 = 339398c5, %f28 = ffffffff, %f28 = ffffffff 339398c5
	fsmuld	%f29,%f28,%f28		! %f28 = ffffffff e0000000
!	Mem[0000000010041408] = 47075cff, %l6 = 00000000000000ff
	lduwa	[%i1+%o4]0x88,%l6	! %l6 = 0000000047075cff
!	Mem[00000000100c1408] = 6bcdf0ffb5383fcb, %f0  = b80b4134 7119b5cf
	ldda	[%i3+%o4]0x80,%f0 	! %f0  = 6bcdf0ff b5383fcb
!	Mem[00000000300c1410] = d906c901, %l5 = 00000000000000ff
	ldsha	[%i3+%o5]0x89,%l5	! %l5 = ffffffffffffc901
!	Mem[0000000030101410] = 6bcdf0ff, %l4 = 00000000430000ff
	lduha	[%i4+%o5]0x89,%l4	! %l4 = 000000000000f0ff
!	Mem[0000000030041408] = 000000ff, %l6 = 0000000047075cff
	lduha	[%i1+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041420] = 0000003f00000000, %f26 = cbc0bdbb 00005a9b
	ldd	[%i1+0x020],%f26	! %f26 = 0000003f 00000000
!	%f9  = 6bcdf0ff, %f5  = 00000072
	fcmpes	%fcc0,%f9 ,%f5 		! %fcc0 = 2
!	Mem[0000000010181428] = af0372a3d3be5ea7, %l3 = 0000000000000000
	ldx	[%i6+0x028],%l3		! %l3 = af0372a3d3be5ea7
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000002, Mem[0000000020800041] = 28610070, %asi = 80
	stba	%l7,[%o1+0x041]%asi	! Mem[0000000020800040] = 28020070

p0_label_100:
!	%f18 = ffbe57b8 6bcdf0ff, %l2 = 00000000fff0cd6b
!	Mem[0000000030001400] = 93ff9a676c000000
	stda	%f18,[%i0+%l2]ASI_PST8_SL ! Mem[0000000030001400] = fff09a6b6c57be00
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010141420] = fff0cd6b00000000, %l5 = ffffffffffffc901, %l5 = ffffffffffffc901
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l5,%l5	! %l5 = fff0cd6b00000000
!	%f20 = fff0cd6b, Mem[0000000010101400] = 0000004d
	sta	%f20,[%i4+%g0]0x80	! Mem[0000000010101400] = fff0cd6b
!	%l0 = 000000ff, %l1 = 191932c0, Mem[0000000010181408] = ff57ffa6 ea190000
	stda	%l0,[%i6+0x008]%asi	! Mem[0000000010181408] = 000000ff 191932c0
!	Mem[0000000010001438] = 72fc3a4e, %l5 = 00000000, %l0 = 000000ff
	add	%i0,0x38,%g1
	casa	[%g1]0x80,%l5,%l0	! %l0 = 0000000072fc3a4e
!	%l7 = 0000000000000002, Mem[0000000020800040] = 28020070
	sth	%l7,[%o1+0x040]		! Mem[0000000020800040] = 00020070
!	%l2 = 00000000fff0cd6b, Mem[00000000100c1400] = 47075cff
	stba	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 47075c6b
!	Mem[0000000030181408] = ff00fff0, %l6 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l6	! %l6 = 00000000ff00fff0
!	%l0 = 0000000072fc3a4e, Mem[00000000300c1410] = d906c901
	stba	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = d906c94e
!	Starting 10 instruction Load Burst
!	%f16 = 0000004d, %f30 = 47f6c323 3f00ffff
	fstox	%f16,%f30		! %l0 = 0000000072fc3a70, Unfinished, %fsr = 1900000800

p0_label_101:
!	Mem[0000000030001408] = 000000006ca9eb51, %f8  = 00000000 6bcdf0ff
	ldda	[%i0+%o4]0x89,%f8 	! %f8  = 00000000 6ca9eb51
!	Mem[0000000010181400] = 00000000 6bcdf0ff, %l6 = ff00fff0, %l7 = 00000002
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000 000000006bcdf0ff
!	Mem[0000000030101400] = 4d0000ff, %l3 = af0372a3d3be5ea7
	ldsha	[%i4+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%f31 = 3f00ffff, %f7  = c0361918, %f9  = 6ca9eb51
	fdivs	%f31,%f7 ,%f9 		! %f9  = be355a55
!	%l1 = 00000000191932c0, %l5 = fff0cd6b00000000, %l1 = 00000000191932c0
	add	%l1,%l5,%l1		! %l1 = fff0cd6b191932c0
!	Mem[0000000030181400] = 00ff0000, %l1 = fff0cd6b191932c0
	lduwa	[%i6+%g0]0x81,%l1	! %l1 = 0000000000ff0000
!	Mem[0000000010041400] = ffff0000 fffffbcf, %l4 = 0000f0ff, %l5 = 00000000
	ldda	[%i1+%g0]0x80,%l4	! %l4 = 00000000ffff0000 00000000fffffbcf
!	Mem[00000000300c1400] = 0000005a00005a9b, %f18 = ffbe57b8 6bcdf0ff
	ldda	[%i3+%g0]0x89,%f18	! %f18 = 0000005a 00005a9b
!	Mem[0000000020800040] = 00020070, %l2 = 00000000fff0cd6b
	lduh	[%o1+0x040],%l2		! %l2 = 0000000000000002
!	Starting 10 instruction Store Burst
!	%f28 = ffffffff e0000000, %l6 = 0000000000000000
!	Mem[0000000010001418] = b857bea6c0361918
	add	%i0,0x018,%g1
	stda	%f28,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010001418] = b857bea6c0361918

p0_label_102:
!	%f31 = 3f00ffff, Mem[0000000030081410] = fff0cd47
	sta	%f31,[%i2+%o5]0x89	! Mem[0000000030081410] = 3f00ffff
!	Mem[0000000010001400] = 82000000, %l1 = 0000000000ff0000
	ldstuba	[%i0+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030041408] = ff000000, %l2 = 0000000000000002
	swapa	[%i1+%o4]0x89,%l2	! %l2 = 00000000ff000000
!	%l1 = 0000000000000000, Mem[0000000010001400] = 00000000820000ff
	stxa	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000000
!	%l4 = 00000000ffff0000, Mem[0000000010041410] = 00000000
	stba	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	Mem[0000000010141410] = 72000000, %l6 = 0000000000000000
	ldstuba	[%i5+%o5]0x80,%l6	! %l6 = 00000072000000ff
!	%l0 = 72fc3a70, %l1 = 00000000, Mem[0000000010081428] = ba2e7156 1cf28fd6
	std	%l0,[%i2+0x028]		! Mem[0000000010081428] = 72fc3a70 00000000
!	Mem[0000000030001410] = 679aff93, %l7 = 000000006bcdf0ff
	swapa	[%i0+%o5]0x89,%l7	! %l7 = 00000000679aff93
!	Mem[0000000010041408] = ff5c0747, %l3 = 00000000000000ff
	swap	[%i1+%o4],%l3		! %l3 = 00000000ff5c0747
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ff57bea600000000, %l2 = 00000000ff000000
	ldxa	[%i6+%o5]0x81,%l2	! %l2 = ff57bea600000000

p0_label_103:
!	Mem[0000000010041400] = ffff0000 fffffbcf, %l6 = 00000072, %l7 = 679aff93
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 00000000ffff0000 00000000fffffbcf
!	Mem[0000000030181410] = a6be57ff, %f20 = fff0cd6b
	lda	[%i6+%o5]0x89,%f20	! %f20 = a6be57ff
!	Mem[0000000030101408] = ff0000ff, %l6 = 00000000ffff0000
	lduba	[%i4+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000020800040] = 00020070, %l5 = 00000000fffffbcf
	lduh	[%o1+0x040],%l5		! %l5 = 0000000000000002
!	Mem[00000000100c141c] = a6ff57b8, %l7 = 00000000fffffbcf
	lduh	[%i3+0x01c],%l7		! %l7 = 000000000000a6ff
!	Mem[00000000100c1410] = 6b0000ff, %l1 = 0000000000000000
	ldsha	[%i3+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%l1 = 00000000000000ff, %l4 = 00000000ffff0000, %l0 = 0000000072fc3a70
	xor	%l1,%l4,%l0		! %l0 = 00000000ffff00ff
!	Mem[0000000010041408] = 000000ff, %l1 = 00000000000000ff
	ldsha	[%i1+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181400] = 00ff0000 4d000000, %l2 = 00000000, %l3 = ff5c0747
	ldda	[%i6+%g0]0x81,%l2	! %l2 = 0000000000ff0000 000000004d000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 00000000, %l6 = 00000000000000ff
	ldstuba	[%i2+%g0]0x80,%l6	! %l6 = 00000000000000ff

p0_label_104:
!	%l0 = 00000000ffff00ff, Mem[0000000030081410] = 3f00ffff
	stha	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 3f0000ff
!	Mem[0000000010041408] = ff000000, %l7 = 000000000000a6ff
	swapa	[%i1+%o4]0x88,%l7	! %l7 = 00000000ff000000
!	%f0  = 6bcdf0ff b5383fcb 000000b8 ff000000
!	%f4  = cffbffff 00000072 b857bea6 c0361918
!	%f8  = 00000000 be355a55 82000000 bbbdc0cb
!	%f12 = 00002b3a 6b000000 72fc3a4e 71368f33
	stda	%f0,[%i4]ASI_BLK_AIUPL	! Block Store to 0000000010101400
!	%l6 = 0000000000000000, Mem[0000000030181400] = 00ff0000
	stba	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 00ff0000
!	%l4 = 00000000ffff0000, Mem[0000000010101400] = b5383fcb
	stha	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = b5380000
!	%f30 = 47f6c323, Mem[0000000030101410] = fff0cd6b
	sta	%f30,[%i4+%o5]0x81	! Mem[0000000030101410] = 47f6c323
!	Mem[0000000010041430] = d7e9623e, %l7 = 00000000ff000000
	swap	[%i1+0x030],%l7		! %l7 = 00000000d7e9623e
!	%l4 = 00000000ffff0000, Mem[00000000100c1408] = 6bcdf0ff
	stha	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000f0ff
!	%l6 = 00000000, %l7 = d7e9623e, Mem[0000000010001400] = 00000000 00000000
	stda	%l6,[%i0+0x000]%asi	! Mem[0000000010001400] = 00000000 d7e9623e
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 9b5a000000000000, %f20 = a6be57ff 51eba96c
	ldda	[%i0+%o5]0x88,%f20	! %f20 = 9b5a0000 00000000

p0_label_105:
!	Mem[0000000010181410] = 00000000, %l4 = 00000000ffff0000
	lduwa	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081420] = c2ca7554 34f54eb1, %l4 = 00000000, %l5 = 00000002
	ldda	[%i2+0x020]%asi,%l4	! %l4 = 00000000c2ca7554 0000000034f54eb1
!	Mem[0000000030001410] = 6bcdf0ff, %l5 = 0000000034f54eb1
	lduwa	[%i0+%o5]0x89,%l5	! %l5 = 000000006bcdf0ff
!	%l1 = 0000000000000000, %l5 = 000000006bcdf0ff, %l5 = 000000006bcdf0ff
	orn	%l1,%l5,%l5		! %l5 = ffffffff94320f00
!	Mem[0000000010001410] = 9b5a000000000000, %l1 = 0000000000000000
	ldxa	[%i0+%o5]0x88,%l1	! %l1 = 9b5a000000000000
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000010101408] = ff000000, %l5 = ffffffff94320f00
	ldsha	[%i4+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l5 = 0000000000000000
	ldsba	[%i0+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = fff0cd6b00000000, %f22 = 00000000 6bcdf0ff
	ldda	[%i6+%g0]0x88,%f22	! %f22 = fff0cd6b 00000000
!	Mem[0000000030081400] = a6080000, %l4 = 00000000c2ca7554
	lduwa	[%i2+%g0]0x81,%l4	! %l4 = 00000000a6080000
!	Starting 10 instruction Store Burst
!	%f2  = 000000b8, Mem[0000000010081408] = ffdce777
	sta	%f2 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000b8

p0_label_106:
!	Mem[0000000030001410] = 6bcdf0ff, %l4 = 00000000a6080000
	swapa	[%i0+%o5]0x89,%l4	! %l4 = 000000006bcdf0ff
!	Mem[0000000030001410] = a6080000, %l6 = 0000000000000000
	swapa	[%i0+%o5]0x89,%l6	! %l6 = 00000000a6080000
!	Mem[0000000010101430] = 0000006b, %l2 = 00ff0000, %l3 = 4d000000
	add	%i4,0x30,%g1
	casa	[%g1]0x80,%l2,%l3	! %l3 = 000000000000006b
!	Mem[00000000201c0000] = 6bf04531, %l3 = 000000000000006b
	ldstub	[%o0+%g0],%l3		! %l3 = 0000006b000000ff
!	%f18 = 0000005a 00005a9b, Mem[0000000030001408] = 6ca9eb51 00000000
	stda	%f18,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000005a 00005a9b
!	%l2 = 0000000000ff0000, Mem[0000000010181410] = 00000000
	stha	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	%f13 = 6b000000, %f27 = 00000000, %f5  = 00000072
	fdivs	%f13,%f27,%f5 		! %f5  = 7f800000
!	Mem[0000000030141410] = 0000d9df, %l5 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l5	! %l5 = 000000000000d9df
!	%l6 = a6080000, %l7 = d7e9623e, Mem[00000000300c1408] = 72fc3a4e 6bcdf0ff
	stda	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = a6080000 d7e9623e
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = fff00000, %l6 = 00000000a6080000
	lduwa	[%i3+%o4]0x88,%l6	! %l6 = 00000000fff00000

p0_label_107:
!	%l1 = 9b5a000000000000, imm = 0000000000000a00, %l6 = 00000000fff00000
	xor	%l1,0xa00,%l6		! %l6 = 9b5a000000000a00
!	Mem[0000000010101400] = 6bcdf0ffb5380000, %f4  = cffbffff 7f800000
	ldda	[%i4+%g0]0x88,%f4 	! %f4  = 6bcdf0ff b5380000
!	Mem[00000000201c0000] = fff04531, %l5 = 000000000000d9df
	ldsh	[%o0+%g0],%l5		! %l5 = fffffffffffffff0
!	Mem[0000000010001410] = 00000000, %l4 = 000000006bcdf0ff
	ldswa	[%i0+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = ff000000, %l4 = 0000000000000000
	lduha	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = 000000ff, %l4 = 0000000000000000
	ldswa	[%i6+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141410] = 00000000, %f20 = 9b5a0000
	lda	[%i5+%o5]0x81,%f20	! %f20 = 00000000
!	Mem[00000000201c0000] = fff04531, %l0 = 00000000ffff00ff
	ldsb	[%o0+0x001],%l0		! %l0 = fffffffffffffff0
!	Mem[00000000211c0000] = adaa96d7, %l6 = 9b5a000000000a00
	ldsb	[%o2+%g0],%l6		! %l6 = ffffffffffffffad
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 3f0000ff, %l7 = 00000000d7e9623e
	swapa	[%i2+%o5]0x89,%l7	! %l7 = 000000003f0000ff

p0_label_108:
!	Mem[0000000030001400] = fff09a6b, %l4 = 00000000000000ff
	ldstuba	[%i0+%g0]0x81,%l4	! %l4 = 000000ff000000ff
!	%f30 = 47f6c323, Mem[0000000030101400] = ff00004d
	sta	%f30,[%i4+%g0]0x81	! Mem[0000000030101400] = 47f6c323
!	%l2 = 0000000000ff0000, Mem[0000000030081408] = ffffffff
	stwa	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 00ff0000
!	Mem[0000000030081400] = 000008a6, %l3 = 000000000000006b
	ldstuba	[%i2+%g0]0x89,%l3	! %l3 = 000000a6000000ff
!	%f16 = 0000004d 47075cff, %l2 = 0000000000ff0000
!	Mem[0000000030141420] = 64a1d6cb339398c5
	add	%i5,0x020,%g1
	stda	%f16,[%g1+%l2]ASI_PST32_SL ! Mem[0000000030141420] = 64a1d6cb339398c5
!	Mem[0000000010141405] = 34410bb8, %l4 = 00000000000000ff
	ldstuba	[%i5+0x005]%asi,%l4	! %l4 = 00000041000000ff
!	%l4 = 0000000000000041, Mem[0000000010081410] = 4d00e0b8d30000ff
	stxa	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000000000000041
!	%l7 = 000000003f0000ff, Mem[0000000010041408] = 0000a6ff
	stha	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff
!	%l6 = ffffffffffffffad, Mem[0000000010081408] = 00002b3ab8000000
	stxa	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffffffffffffad
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 000038b5, %l5 = fffffffffffffff0
	ldsha	[%i4+%g0]0x80,%l5	! %l5 = 0000000000000000

p0_label_109:
!	Mem[0000000010101408] = 000000b8ff000000, %l2 = 0000000000ff0000
	ldxa	[%i4+%o4]0x88,%l2	! %l2 = 000000b8ff000000
!	Mem[0000000010101430] = 0000006b 3a2b0000, %l2 = ff000000, %l3 = 000000a6
	ldd	[%i4+0x030],%l2		! %l2 = 000000000000006b 000000003a2b0000
!	%f25 = 77e7dcff, %f30 = 47f6c323, %f12 = 00002b3a 6b000000
	fsmuld	%f25,%f30,%f12		! %f12 = 480befe3 426e7ba0
!	Mem[0000000030041410] = 80a604e8, %l2 = 000000000000006b
	lduha	[%i1+%o5]0x81,%l2	! %l2 = 00000000000080a6
!	Mem[0000000010081408] = ffffffad, %l7 = 000000003f0000ff
	ldswa	[%i2+%o4]0x88,%l7	! %l7 = ffffffffffffffad
!	Mem[0000000010001420] = b14ef534, %l5 = 0000000000000000
	ldswa	[%i0+0x020]%asi,%l5	! %l5 = ffffffffb14ef534
!	Mem[00000000201c0000] = fff04531, %l3 = 000000003a2b0000
	lduba	[%o0+0x001]%asi,%l3	! %l3 = 00000000000000f0
!	Mem[0000000030001410] = 00000000, %l4 = 0000000000000041
	lduha	[%i0+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141408] = 000000b8ff000000, %f16 = 0000004d 47075cff
	ldda	[%i5+%o4]0x88,%f16	! %f16 = 000000b8 ff000000
!	Starting 10 instruction Store Burst
!	Mem[000000001000142b] = f7ccb635, %l1 = 9b5a000000000000
	ldstub	[%i0+0x02b],%l1		! %l1 = 00000035000000ff

p0_label_110:
!	Mem[0000000030101410] = 47f6c323, %l6 = ffffffffffffffad
	ldstuba	[%i4+%o5]0x81,%l6	! %l6 = 00000047000000ff
!	%l5 = ffffffffb14ef534, Mem[00000000100c1408] = fff00000
	stba	%l5,[%i3+%o4]0x88	! Mem[00000000100c1408] = fff00034
!	%l0 = fffffff0, %l1 = 00000035, Mem[0000000030041408] = 00000002 a6be57b8
	stda	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = fffffff0 00000035
!	Mem[0000000021800081] = ff424727, %l0 = fffffffffffffff0
	ldstuba	[%o3+0x081]%asi,%l0	! %l0 = 00000042000000ff
!	Mem[00000000300c1400] = 00005a9b, %l5 = ffffffffb14ef534
	ldstuba	[%i3+%g0]0x89,%l5	! %l5 = 0000009b000000ff
!	Mem[0000000010041400] = 0000ffff, %l6 = 0000000000000047
	ldstuba	[%i1+%g0]0x88,%l6	! %l6 = 000000ff000000ff
!	Mem[00000000211c0001] = adaa96d7, %l5 = 000000000000009b
	ldstuba	[%o2+0x001]%asi,%l5	! %l5 = 000000aa000000ff
!	%l5 = 00000000000000aa, Mem[0000000010001408] = 00000000
	stwa	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000aa
!	Mem[0000000030041410] = e804a680, %l4 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l4	! %l4 = 00000080000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000, %l7 = ffffffffffffffad
	ldsha	[%i6+%o5]0x80,%l7	! %l7 = 0000000000000000

p0_label_111:
!	Mem[0000000010141410] = ff000000, %l4 = 0000000000000080
	swapa	[%i5+%o5]0x80,%l4	! %l4 = 00000000ff000000
!	Mem[0000000010181400] = 00000000, %l6 = 00000000000000ff
	lduba	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l5 = 00000000000000aa
	lduba	[%i1+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181400] = 0000ff00, %f0  = 6bcdf0ff
	lda	[%i6+%g0]0x89,%f0 	! %f0 = 0000ff00
!	Mem[00000000100c1410] = ff00006b, %l2 = 00000000000080a6
	lduba	[%i3+0x013]%asi,%l2	! %l2 = 000000000000006b
!	Mem[00000000100c1400] = 6b5c07474d000000, %l6 = 0000000000000000
	ldxa	[%i3+0x000]%asi,%l6	! %l6 = 6b5c07474d000000
!	Mem[0000000010081434] = 56714d03, %l6 = 6b5c07474d000000
	ldsw	[%i2+0x034],%l6		! %l6 = 0000000056714d03
!	%l2 = 000000000000006b, Mem[0000000030041408] = f0ffffff35000000
	stxa	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000000000006b
!	Mem[0000000030041400] = 6bcdf0ff, %l3 = 00000000000000f0
	lduha	[%i1+%g0]0x89,%l3	! %l3 = 000000000000f0ff
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000030041408] = 00000000
	stwa	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000

p0_label_112:
!	Mem[0000000030001400] = fff09a6b, %l3 = 000000000000f0ff
	swapa	[%i0+%g0]0x81,%l3	! %l3 = 00000000fff09a6b
!	%l5 = 0000000000000000, Mem[0000000010041410] = 00000000
	sth	%l5,[%i1+%o5]		! Mem[0000000010041410] = 00000000
!	Mem[0000000010141400] = cfb51971 34ff0bb8, %l4 = ff000000, %l5 = 00000000
	ldda	[%i5+%g0]0x80,%l4	! %l4 = 00000000cfb51971 0000000034ff0bb8
!	%f28 = ffffffff e0000000, Mem[0000000010081410] = 41000000 00000000
	stda	%f28,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffffff e0000000
!	%l4 = cfb51971, %l5 = 34ff0bb8, Mem[0000000010001400] = 00000000 3e62e9d7
	stda	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = cfb51971 34ff0bb8
!	%l7 = 0000000000000000, Mem[0000000010041410] = ffffffff00000000
	stxa	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000000000000000
!	Mem[00000000100c1400] = 6b5c0747, %l6 = 0000000056714d03
	ldstuba	[%i3+%g0]0x80,%l6	! %l6 = 0000006b000000ff
!	%l3 = 00000000fff09a6b, Mem[0000000030101408] = ff0000ff
	stha	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = 9a6b00ff
!	Mem[00000000300c1400] = 00005aff, %l6 = 000000000000006b
	ldstuba	[%i3+%g0]0x89,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 23c3f6ff, %f14 = 72fc3a4e
	lda	[%i4+%o5]0x89,%f14	! %f14 = 23c3f6ff

p0_label_113:
!	Mem[0000000030081400] = fffffbcf 000008ff, %l0 = 00000042, %l1 = 00000035
	ldda	[%i2+%g0]0x89,%l0	! %l0 = 00000000000008ff 00000000fffffbcf
!	Mem[0000000030101408] = ff006b9a, %l7 = 0000000000000000
	ldsba	[%i4+%o4]0x89,%l7	! %l7 = ffffffffffffff9a
!	Mem[0000000030081410] = b857bea6 d7e9623e, %l2 = 0000006b, %l3 = fff09a6b
	ldda	[%i2+%o5]0x89,%l2	! %l2 = 00000000d7e9623e 00000000b857bea6
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000030141400] = ff0000ff b7400800 99c1ffff 339398c5
!	Mem[0000000030141410] = 00000000 00000000 a3561e6a 4ead84b8
!	Mem[0000000030141420] = 64a1d6cb 339398c5 7daf2ca7 a924ff12
!	Mem[0000000030141430] = fff0cd6b b5383fcb fa8abe3f c94fafea
	ldda	[%i5]ASI_BLK_S,%f0	! Block Load from 0000000030141400
!	Mem[0000000030001400] = fff00000, %f18 = 0000005a
	lda	[%i0+%g0]0x89,%f18	! %f18 = fff00000
!	Mem[00000000201c0000] = fff04531, %l6 = 00000000000000ff
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 000000000000fff0
!	Mem[0000000010001400] = 7119b5cfb80bff34, %f28 = ffffffff e0000000
	ldda	[%i0+%g0]0x80,%f28	! %f28 = 7119b5cf b80bff34
!	Mem[0000000030181400] = 00ff0000 4d000000 00000000 00000000
!	Mem[0000000030181410] = ff57bea6 00000000 fff0cd6b 6a1e56a3
!	Mem[0000000030181420] = ba212420 01c90143 034d8e45 ffffffff
!	Mem[0000000030181430] = bbbdc0cb f6809cc5 6b16c86c ffffff7f
	ldda	[%i6]ASI_BLK_AIUS,%f0	! Block Load from 0000000030181400
!	Mem[0000000030141408] = 99c1ffff, %l1 = 00000000fffffbcf
	ldsha	[%i5+%o4]0x81,%l1	! %l1 = ffffffffffff99c1
!	Starting 10 instruction Store Burst
!	%f16 = 000000b8 ff000000 fff00000 00005a9b
!	%f20 = 00000000 00000000 fff0cd6b 00000000
!	%f24 = ffdce777 77e7dcff 0000003f 00000000
!	%f28 = 7119b5cf b80bff34 47f6c323 3f00ffff
	stda	%f16,[%i6]ASI_BLK_AIUP	! Block Store to 0000000010181400

p0_label_114:
!	%f6  = fff0cd6b 6a1e56a3, %l6 = 000000000000fff0
!	Mem[0000000010081418] = 181936c0191936c0
	add	%i2,0x018,%g1
	stda	%f6,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010081418] = 181936c0191936c0
!	Mem[000000001010140c] = b8000000, %l2 = d7e9623e, %l4 = cfb51971
	add	%i4,0x0c,%g1
	casa	[%g1]0x80,%l2,%l4	! %l4 = 00000000b8000000
!	%l2 = d7e9623e, %l3 = b857bea6, Mem[0000000010081410] = ffffffff e0000000
	stda	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = d7e9623e b857bea6
!	%f14 = 6b16c86c ffffff7f, Mem[0000000010081430] = ffffffff 56714d03
	std	%f14,[%i2+0x030]	! Mem[0000000010081430] = 6b16c86c ffffff7f
!	%f0  = 00ff0000, Mem[0000000010141408] = 000000ff
	sta	%f0 ,[%i5+%o4]0x80	! Mem[0000000010141408] = 00ff0000
!	Mem[0000000010141404] = 34ff0bb8, %l2 = d7e9623e, %l6 = 0000fff0
	add	%i5,0x04,%g1
	casa	[%g1]0x80,%l2,%l6	! %l6 = 0000000034ff0bb8
!	%l3 = 00000000b857bea6, imm = 0000000000000dc8, %l1 = ffffffffffff99c1
	sub	%l3,0xdc8,%l1		! %l1 = 00000000b857b0de
!	%l5 = 0000000034ff0bb8, Mem[0000000030101408] = ff006b9a
	stwa	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 34ff0bb8
!	%l4 = 00000000b8000000, Mem[0000000010001404] = b80bff34, %asi = 80
	stwa	%l4,[%i0+0x004]%asi	! Mem[0000000010001404] = b8000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = cffbffff 80000000, %l6 = 34ff0bb8, %l7 = ffffff9a
	ldda	[%i5+%o5]0x88,%l6	! %l6 = 0000000080000000 00000000cffbffff

p0_label_115:
!	Mem[0000000010141430] = 0000006b3a2b0000, %l4 = 00000000b8000000
	ldxa	[%i5+0x030]%asi,%l4	! %l4 = 0000006b3a2b0000
!	Mem[0000000010041400] = cffbffff0000ffff, %l0 = 00000000000008ff
	ldxa	[%i1+%g0]0x88,%l0	! %l0 = cffbffff0000ffff
!	Mem[0000000010101400] = 000038b5, %l7 = 00000000cffbffff
	lduba	[%i4+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %f15 = ffffff7f
	lda	[%i1+%o5]0x88,%f15	! %f15 = 00000000
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000010181408] = 0000f0ff, %l1 = 00000000b857b0de
	lduba	[%i6+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1400] = ff5a0000, %l1 = 00000000000000ff
	lduwa	[%i3+%g0]0x81,%l1	! %l1 = 00000000ff5a0000
!	Mem[0000000010181400] = 000000b8 ff000000, %l6 = 80000000, %l7 = 00000000
	ldd	[%i6+%g0],%l6		! %l6 = 00000000000000b8 00000000ff000000
!	Mem[00000000211c0000] = adff96d7, %l0 = cffbffff0000ffff
	lduba	[%o2+0x000]%asi,%l0	! %l0 = 00000000000000ad
!	Mem[0000000010041410] = 00000000, %l6 = 00000000000000b8
	ldsha	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 000000b8, %l0 = 00000000000000ad
	swapa	[%i6+%g0]0x80,%l0	! %l0 = 00000000000000b8

p0_label_116:
!	Mem[0000000030181400] = 00ff0000, %l3 = 00000000b857bea6
	swapa	[%i6+%g0]0x81,%l3	! %l3 = 0000000000ff0000
!	Mem[000000001014140c] = b8000000, %l4 = 0000006b3a2b0000
	swap	[%i5+0x00c],%l4		! %l4 = 00000000b8000000
!	%f6  = fff0cd6b 6a1e56a3, Mem[0000000010101400] = b5380000 6bcdf0ff
	stda	%f6 ,[%i4+%g0]0x88	! Mem[0000000010101400] = fff0cd6b 6a1e56a3
!	%l3 = 0000000000ff0000, Mem[0000000010141410] = 00000080
	stwa	%l3,[%i5+%o5]0x80	! Mem[0000000010141410] = 00ff0000
!	Mem[0000000030101408] = b80bff34, %l6 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l6	! %l6 = 00000000b80bff34
!	%f22 = fff0cd6b 00000000, Mem[0000000010101408] = ff000000 000000b8
	stda	%f22,[%i4+%o4]0x88	! Mem[0000000010101408] = fff0cd6b 00000000
!	%l6 = 00000000b80bff34, Mem[00000000100c1400] = ff5c07474d000000
	stxa	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000b80bff34
!	%l5 = 0000000034ff0bb8, Mem[0000000030001410] = 00000000
	stha	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000bb8
!	%l6 = b80bff34, %l7 = ff000000, Mem[0000000010001400] = 7119b5cf b8000000
	stda	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = b80bff34 ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ff5e8841, %l6 = 00000000b80bff34
	ldsha	[%o1+0x000]%asi,%l6	! %l6 = ffffffffffffff5e

p0_label_117:
!	Mem[00000000300c1408] = 000008a6, %l0 = 00000000000000b8
	lduba	[%i3+%o4]0x89,%l0	! %l0 = 00000000000000a6
!	Mem[0000000030141410] = 0000000000000000, %l0 = 00000000000000a6
	ldxa	[%i5+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1408] = a6080000d7e9623e, %f28 = 7119b5cf b80bff34
	ldda	[%i3+%o4]0x81,%f28	! %f28 = a6080000 d7e9623e
!	Mem[0000000020800000] = ff5e8841, %l1 = 00000000ff5a0000
	lduh	[%o1+%g0],%l1		! %l1 = 000000000000ff5e
!	Mem[0000000010041414] = 00000000, %l2 = 00000000d7e9623e
	lduwa	[%i1+0x014]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = 7119b5cf, %l4 = 00000000b8000000
	lduwa	[%i5+%g0]0x88,%l4	! %l4 = 000000007119b5cf
!	Mem[00000000300c1400] = 0000005a00005aff, %l2 = 0000000000000000
	ldxa	[%i3+%g0]0x89,%l2	! %l2 = 0000005a00005aff
!	Mem[0000000030181400] = 0000004da6be57b8, %f26 = 0000003f 00000000
	ldda	[%i6+%g0]0x89,%f26	! %f26 = 0000004d a6be57b8
!	Mem[000000001010141c] = a6be57b8, %l3 = 0000000000ff0000
	ldsba	[%i4+0x01f]%asi,%l3	! %l3 = ffffffffffffffb8
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = a3561e6a, %l4 = 000000007119b5cf
	ldstuba	[%i4+%g0]0x80,%l4	! %l4 = 000000a3000000ff

p0_label_118:
!	%l6 = ffffffffffffff5e, Mem[0000000010081410] = d7e9623eb857bea6
	stxa	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffffffffffff5e
!	%f18 = fff00000 00005a9b, %l2 = 0000005a00005aff
!	Mem[0000000010181420] = ffdce77777e7dcff
	add	%i6,0x020,%g1
	stda	%f18,[%g1+%l2]ASI_PST16_P ! Mem[0000000010181420] = fff0000000005a9b
!	Mem[0000000010101408] = 00000000, %l6 = ffffffffffffff5e
	swapa	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000000
!	%f0  = 00ff0000 4d000000 00000000 00000000
!	%f4  = ff57bea6 00000000 fff0cd6b 6a1e56a3
!	%f8  = ba212420 01c90143 034d8e45 ffffffff
!	%f12 = bbbdc0cb f6809cc5 6b16c86c 00000000
	stda	%f0,[%i6]ASI_BLK_AIUP	! Block Store to 0000000010181400
!	%l2 = 0000005a00005aff, Mem[00000000100c1400] = 00000000
	stba	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff
!	%l1 = 000000000000ff5e, Mem[0000000030141400] = ff0000ff
	stba	%l1,[%i5+%g0]0x89	! Mem[0000000030141400] = ff00005e
!	Mem[0000000010141418] = 181936c0, %l1 = 000000000000ff5e
	swap	[%i5+0x018],%l1		! %l1 = 00000000181936c0
!	Mem[0000000010141400] = cfb51971, %l5 = 0000000034ff0bb8
	ldstuba	[%i5+%g0]0x80,%l5	! %l5 = 000000cf000000ff
!	Mem[0000000030181410] = a6be57ff, %l4 = 00000000000000a3
	ldstuba	[%i6+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff5c074700000bb8, %l4 = 00000000000000ff
	ldxa	[%i0+%o5]0x89,%l4	! %l4 = ff5c074700000bb8

p0_label_119:
!	Mem[0000000010041400] = ffff0000, %l4 = ff5c074700000bb8
	lduha	[%i1+%g0]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[00000000100c1420] = 00000000, %l4 = 000000000000ffff
	ldsh	[%i3+0x020],%l4		! %l4 = 0000000000000000
!	Mem[0000000030001400] = fff00000, %l0 = 0000000000000000
	lduba	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = 6a1e56ff, %l4 = 0000000000000000
	ldsba	[%i4+%g0]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030181410] = ff57bea6, %l4 = ffffffffffffffff
	lduha	[%i6+%o5]0x81,%l4	! %l4 = 000000000000ff57
!	Mem[0000000010041400] = ffff0000fffffbcf, %l7 = 00000000ff000000
	ldx	[%i1+%g0],%l7		! %l7 = ffff0000fffffbcf
!	Mem[0000000010081408] = adffffff, %l0 = 0000000000000000
	lduba	[%i2+%o4]0x80,%l0	! %l0 = 00000000000000ad
!	Mem[0000000010101410] = 00000072, %l3 = ffffffffffffffb8
	ldsha	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000072
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000010181410] = 00000000 a6be57ff, %l6 = 00000000, %l7 = fffffbcf
	ldda	[%i6+%o5]0x88,%l6	! %l6 = 00000000a6be57ff 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = fff6c323, %l6 = 00000000a6be57ff
	swapa	[%i4+%o5]0x81,%l6	! %l6 = 00000000fff6c323

p0_label_120:
!	%l4 = 0000ff57, %l5 = 000000cf, Mem[0000000010101418] = 181936c0 a6be57b8
	stda	%l4,[%i4+0x018]%asi	! Mem[0000000010101418] = 0000ff57 000000cf
!	Mem[0000000010041410] = 00000000, %l5 = 00000000000000cf
	ldstuba	[%i1+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1400] = 000000ff, %l2 = 0000005a00005aff
	swapa	[%i3+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181408] = 00000000, %l3 = 0000000000000072
	ldstuba	[%i6+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%f14 = 6b16c86c, Mem[0000000030001400] = fff00000
	sta	%f14,[%i0+%g0]0x89	! Mem[0000000030001400] = 6b16c86c
!	%l1 = 00000000181936c0, Mem[00000000211c0000] = adff96d7
	stb	%l1,[%o2+%g0]		! Mem[00000000211c0000] = c0ff96d7
!	%l3 = 0000000000000000, Mem[0000000010041408] = cd4edee3000000ff
	stxa	%l3,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000000000
!	Mem[0000000030081410] = d7e9623e, %l4 = 000000000000ff57
	swapa	[%i2+%o5]0x89,%l4	! %l4 = 00000000d7e9623e
!	%l0 = 000000ad, %l1 = 181936c0, Mem[0000000030081400] = ff080000 cffbffff
	stda	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000ad 181936c0
!	Starting 10 instruction Load Burst
!	Mem[000000001018142c] = ffffffff, %l1 = 00000000181936c0
	lduwa	[%i6+0x02c]%asi,%l1	! %l1 = 00000000ffffffff

p0_label_121:
!	Mem[0000000030141410] = 00000000, %l1 = 00000000ffffffff
	ldsba	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001408] = 9b5a0000 5a000000, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i0+%o4]0x81,%l2	! %l2 = 000000009b5a0000 000000005a000000
!	Mem[0000000010081418] = 181936c0191936c0, %l5 = 0000000000000000
	ldx	[%i2+0x018],%l5		! %l5 = 181936c0191936c0
!	%f7  = 6a1e56a3, %f11 = ffffffff, %f14 = 6b16c86c 00000000
	fsmuld	%f7 ,%f11,%f14		! %f14 = ffffffff e0000000
!	Mem[00000000100c143c] = 0000006c, %l2 = 000000009b5a0000
	ldsb	[%i3+0x03c],%l2		! %l2 = 0000000000000000
!	Mem[0000000030001410] = b80b0000, %f27 = a6be57b8
	lda	[%i0+%o5]0x81,%f27	! %f27 = b80b0000
!	%l1 = 0000000000000000, %l7 = 0000000000000000, %y  = 000000ff
	sdiv	%l1,%l7,%l6		! Div by zero, %l0 = 00000000000000fd
	mov	%l0,%y			! %y = 000000d5
!	Mem[0000000010141408] = 00ff00003a2b0000, %l7 = 0000000000000000
	ldxa	[%i5+%o4]0x80,%l7	! %l7 = 00ff00003a2b0000
!	Mem[0000000010141410] = 0000ff00, %l3 = 000000005a000000
	lduwa	[%i5+%o5]0x88,%l3	! %l3 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000030181408] = ff000000
	stha	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000

p0_label_122:
!	%l1 = 0000000000000000, %l1 = 0000000000000000, %y  = 000000d5
	udiv	%l1,%l1,%l0		! Div by zero, %l0 = 0000000000000125
	mov	%l0,%y			! %y = 000000fd
!	Mem[00000000300c1408] = a6080000, %l4 = 00000000d7e9623e
	ldstuba	[%i3+%o4]0x81,%l4	! %l4 = 000000a6000000ff
!	Mem[0000000030041410] = ffa604e8, %l1 = 0000000000000000
	ldsba	[%i1+%o5]0x81,%l1	! %l1 = ffffffffffffffff
!	%l4 = 00000000000000a6, Mem[00000000201c0000] = fff04531, %asi = 80
	stba	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = a6f04531
!	%l5 = 181936c0191936c0, Mem[0000000010141400] = 7119b5ff
	stha	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 711936c0
!	%f10 = 034d8e45 ffffffff, Mem[0000000030141408] = ffffc199 c5989333
	stda	%f10,[%i5+%o4]0x89	! Mem[0000000030141408] = 034d8e45 ffffffff
!	%f22 = fff0cd6b, Mem[0000000030141410] = 00000000
	sta	%f22,[%i5+%o5]0x89	! Mem[0000000030141410] = fff0cd6b
!	%l0 = 00000000000000fd, Mem[00000000300c1410] = d906c94e
	stba	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = d906c9fd
!	Mem[0000000010001408] = aa000000, %l0 = 00000000000000fd
	swapa	[%i0+%o4]0x88,%l0	! %l0 = 00000000aa000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff000000 6bcdf0ff, %l4 = 000000a6, %l5 = 191936c0
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 00000000ff000000 000000006bcdf0ff

p0_label_123:
!	Mem[0000000030181400] = 0000004d a6be57b8, %l4 = ff000000, %l5 = 6bcdf0ff
	ldda	[%i6+%g0]0x89,%l4	! %l4 = 00000000a6be57b8 000000000000004d
!	%f20 = 00000000, %f16 = 000000b8, %f26 = 0000004d
	fdivs	%f20,%f16,%f26		! %f26 = 00000000
!	Mem[0000000030001410] = b80b000047075cff, %f24 = ffdce777 77e7dcff
	ldda	[%i0+%o5]0x81,%f24	! %f24 = b80b0000 47075cff
!	Mem[0000000030001400] = 00be576c 6b16c86c, %l0 = aa000000, %l1 = ffffffff
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 000000006b16c86c 0000000000be576c
!	Mem[0000000030181400] = 0000004d a6be57b8, %l2 = 00000000, %l3 = 0000ff00
	ldda	[%i6+%g0]0x89,%l2	! %l2 = 00000000a6be57b8 000000000000004d
!	Mem[0000000030041410] = e804a6ff, %l0 = 000000006b16c86c
	lduwa	[%i1+%o5]0x89,%l0	! %l0 = 00000000e804a6ff
!	Mem[0000000020800040] = 00020070, %l2 = 00000000a6be57b8
	ldsha	[%o1+0x040]%asi,%l2	! %l2 = 0000000000000002
!	Mem[00000000201c0000] = a6f04531, %l0 = 00000000e804a6ff
	ldsh	[%o0+%g0],%l0		! %l0 = ffffffffffffa6f0
!	Mem[00000000100c1420] = 00000000, %l7 = 00ff00003a2b0000
	lduwa	[%i3+0x020]%asi,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f14 = ffffffff, %f4  = ff57bea6
	fcmpes	%fcc1,%f14,%f4 		! %fcc1 = 3

p0_label_124:
!	%f30 = 47f6c323 3f00ffff, Mem[0000000010081410] = ffffffff 5effffff
	stda	%f30,[%i2+%o5]0x88	! Mem[0000000010081410] = 47f6c323 3f00ffff
!	%f11 = ffffffff, Mem[0000000030141410] = fff0cd6b
	sta	%f11,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffffff
!	%l3 = 000000000000004d, Mem[0000000030101400] = 47f6c32347075cff
	stxa	%l3,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000000000004d
!	%l0 = ffffa6f0, %l1 = 00be576c, Mem[0000000030001400] = 6b16c86c 00be576c
	stda	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffa6f0 00be576c
!	%l6 = 00000000fff6c323, Mem[0000000030181400] = b857bea6
	stwa	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = fff6c323
!	%f22 = fff0cd6b, Mem[0000000030001400] = ffffa6f0
	sta	%f22,[%i0+%g0]0x89	! Mem[0000000030001400] = fff0cd6b
!	%f16 = 000000b8 ff000000, Mem[0000000030081400] = 000000ad 181936c0
	stda	%f16,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000b8 ff000000
!	%l0 = ffffffffffffa6f0, Mem[0000000010001408] = 000000fd
	stba	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000f0
!	%l7 = 0000000000000000, Mem[00000000300c1408] = ff080000d7e9623e
	stxa	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041420] = 0000003f 00000000, %l2 = 00000002, %l3 = 0000004d
	ldd	[%i1+0x020],%l2		! %l2 = 000000000000003f 0000000000000000

p0_label_125:
!	Mem[0000000010081400] = ff000000, %l3 = 0000000000000000
	ldsha	[%i2+%g0]0x80,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000030141408] = 034d8e45ffffffff, %f18 = fff00000 00005a9b
	ldda	[%i5+%o4]0x89,%f18	! %f18 = 034d8e45 ffffffff
!	Mem[0000000010181434] = f6809cc5, %l1 = 0000000000be576c
	ldub	[%i6+0x036],%l1		! %l1 = 000000000000009c
!	Mem[00000000100c1410] = 6b0000ff, %l1 = 000000000000009c
	ldstuba	[%i3+%o5]0x88,%l1	! %l1 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000030001400] = 6bcdf0ff 6c57be00 9b5a0000 5a000000
!	Mem[0000000030001410] = b80b0000 47075cff e00e3189 000000b8
!	Mem[0000000030001420] = 935e0000 aa451ef5 e3f10393 ce180437
!	Mem[0000000030001430] = 514ed1fd e313aae0 cfc060e8 d6d1ffff
	ldda	[%i0]ASI_BLK_AIUS,%f16	! Block Load from 0000000030001400
!	Mem[0000000010101408] = ffffff5e, %f13 = f6809cc5
	lda	[%i4+%o4]0x88,%f13	! %f13 = ffffff5e
!	Mem[0000000030081400] = b8000000, %l1 = 00000000000000ff
	ldswa	[%i2+%g0]0x89,%l1	! %l1 = ffffffffb8000000
!	Mem[0000000010141400] = c0361971, %l1 = ffffffffb8000000
	ldsba	[%i5+%g0]0x80,%l1	! %l1 = ffffffffffffffc0
!	Mem[0000000010041408] = 0000000000000000, %f2  = 00000000 00000000
	ldda	[%i1+%o4]0x80,%f2 	! %f2  = 00000000 00000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010181400] = 00ff00004d000000, %asi = 80
	stxa	%l7,[%i6+0x000]%asi	! Mem[0000000010181400] = 0000000000000000

p0_label_126:
!	%f4  = ff57bea6 00000000, %f12 = bbbdc0cb ffffff5e
	fdtox	%f4 ,%f12		! %f12 = 80000000 00000000
!	%l1 = ffffffffffffffc0, Mem[0000000010041415] = 00000000, %asi = 80
	stba	%l1,[%i1+0x015]%asi	! Mem[0000000010041414] = 00c00000
!	Mem[0000000030001408] = 00005a9b, %l3 = ffffffffffffff00
	ldstuba	[%i0+%o4]0x89,%l3	! %l3 = 0000009b000000ff
	membar	#Sync			! Added by membar checker (24)
!	%l0 = ffffffffffffa6f0, Mem[0000000030001408] = ff5a00005a000000
	stxa	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffffffffffa6f0
!	Mem[0000000010001400] = b80bff34, %l6 = 00000000fff6c323
	ldstuba	[%i0+%g0]0x80,%l6	! %l6 = 000000b8000000ff
!	%l6 = 00000000000000b8, Mem[0000000010081408] = ffffffffffffffad
	stxa	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000000000b8
!	%f24 = 935e0000 aa451ef5, Mem[0000000030041400] = fff0cd6b b5383fcb
	stda	%f24,[%i1+%g0]0x81	! Mem[0000000030041400] = 935e0000 aa451ef5
!	Mem[0000000010081410] = 3f00ffff, %l7 = 0000000000000000
	ldstuba	[%i2+%o5]0x88,%l7	! %l7 = 000000ff000000ff
!	%f8  = ba212420 01c90143, Mem[00000000100c1418] = fff0cd6b a6ff57b8
	stda	%f8 ,[%i3+0x018]%asi	! Mem[00000000100c1418] = ba212420 01c90143
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000, %l2 = 000000000000003f
	lduha	[%i0+%o5]0x80,%l2	! %l2 = 0000000000000000

p0_label_127:
!	%f30 = cfc060e8, %f4  = ff57bea6, %f30 = cfc060e8
	fdivs	%f30,%f4 ,%f30		! %f30 = 0fe44624
!	Mem[0000000030141400] = 000840b7 ff00005e, %l0 = ffffa6f0, %l1 = ffffffc0
	ldda	[%i5+%g0]0x89,%l0	! %l0 = 00000000ff00005e 00000000000840b7
!	Mem[0000000030041408] = 00000000, %l0 = 00000000ff00005e
	lduwa	[%i1+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = 000000ff b8000000, %l2 = 00000000, %l3 = 0000009b
	ldda	[%i2+%g0]0x89,%l2	! %l2 = 00000000b8000000 00000000000000ff
!	Mem[0000000010181400] = 00000000 00000000, %l2 = b8000000, %l3 = 000000ff
	ldda	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[00000000100c1408] = cb3f38b5fff00034, %l4 = 00000000a6be57b8
	ldxa	[%i3+%o4]0x88,%l4	! %l4 = cb3f38b5fff00034
!	Mem[0000000010101408] = ffffff5e, %l5 = 000000000000004d
	ldsba	[%i4+%o4]0x88,%l5	! %l5 = 000000000000005e
!	Mem[000000001004140c] = 00000000, %l2 = 0000000000000000
	ldsba	[%i1+0x00e]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1418] = ba212420, %l0 = 0000000000000000
	ldsw	[%i3+0x018],%l0		! %l0 = ffffffffba212420
!	Starting 10 instruction Store Burst
!	%l4 = fff00034, %l5 = 0000005e, Mem[0000000030141410] = ffffffff 00000000
	stda	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = fff00034 0000005e

p0_label_128:
!	Mem[0000000010041418] = 4ead84b8, %l3 = 0000000000000000, %asi = 80
	swapa	[%i1+0x018]%asi,%l3	! %l3 = 000000004ead84b8
!	Mem[0000000010181408] = 00000000, %l5 = 000000000000005e
	lduwa	[%i6+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000021800000] = d9ff9cd4, %l6 = 00000000000000b8
	ldstub	[%o3+%g0],%l6		! %l6 = 000000d9000000ff
!	Mem[0000000030001408] = ffffffff, %l5 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010001410] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i0+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%f18 = 9b5a0000 5a000000, %l7 = 00000000000000ff
!	Mem[0000000030141430] = fff0cd6bb5383fcb
	add	%i5,0x030,%g1
	stda	%f18,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030141430] = 0000005a00005a9b
!	%l7 = 00000000000000ff, Mem[0000000030041408] = 00000000
	stba	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000ff
!	Mem[00000000100c1408] = fff00034, %l6 = 00000000000000d9
	swapa	[%i3+%o4]0x88,%l6	! %l6 = 00000000fff00034
!	Mem[00000000300c1410] = fdc906d9, %l6 = 00000000fff00034
	ldstuba	[%i3+%o5]0x81,%l6	! %l6 = 000000fd000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800080] = ffff4727, %l0 = ffffffffba212420
	ldub	[%o3+0x080],%l0		! %l0 = 00000000000000ff

p0_label_129:
!	Mem[00000000100c1408] = d9000000, %l7 = 00000000000000ff
	ldsba	[%i3+%o4]0x80,%l7	! %l7 = ffffffffffffffd9
!	Mem[0000000010001408] = 6b000000000000f0, %f20 = b80b0000 47075cff
	ldda	[%i0+%o4]0x88,%f20	! %f20 = 6b000000 000000f0
!	Mem[0000000010141408] = 0000ff00, %l5 = 00000000000000ff
	lduha	[%i5+%o4]0x88,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030181408] = 00000000, %l0 = 00000000000000ff
	ldsba	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001408] = ffffffff, %l3 = 000000004ead84b8
	ldsba	[%i0+%o4]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030181408] = 00000000 00000000, %l0 = 00000000, %l1 = 000840b7
	ldda	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010141408] = 00ff0000, %l6 = 00000000000000fd
	ldswa	[%i5+%o4]0x80,%l6	! %l6 = 0000000000ff0000
!	Mem[0000000030081400] = b8000000, %l0 = 0000000000000000
	ldsha	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[000000001010140c] = 6bcdf0ff, %l7 = ffffffffffffffd9
	lduha	[%i4+0x00e]%asi,%l7	! %l7 = 000000000000f0ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1411] = ff00006b, %l5 = 000000000000ff00
	ldstub	[%i3+0x011],%l5		! %l5 = 00000000000000ff

p0_label_130:
!	%l3 = ffffffffffffffff, Mem[0000000010001408] = f0000000
	stha	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = ffff0000
!	Mem[00000000300c1410] = ffc906d9, %l0 = 0000000000000000
	ldstuba	[%i3+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030001410] = 00000bb8, %l7 = 000000000000f0ff
	ldstuba	[%i0+%o5]0x89,%l7	! %l7 = 000000b8000000ff
!	%f27 = ce180437, Mem[0000000030081400] = b8000000
	sta	%f27,[%i2+%g0]0x89	! Mem[0000000030081400] = ce180437
!	%l2 = 0000000000000000, Mem[00000000100c1410] = ffff006b3a2b0000
	stxa	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000000000000000
!	Mem[0000000010081414] = 23c3f647, %l7 = 00000000000000b8
	ldstub	[%i2+0x014],%l7		! %l7 = 00000023000000ff
!	%l5 = 0000000000000000, Mem[0000000010041408] = 0000000000000000
	stxa	%l5,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000000000000000
!	Mem[00000000218000c1] = 2c285589, %l3 = ffffffffffffffff
	ldstub	[%o3+0x0c1],%l3		! %l3 = 00000028000000ff
!	Mem[00000000100c1420] = 00000000, %l7 = 0000000000000023
	swap	[%i3+0x020],%l7		! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00ff0000, %l2 = 0000000000000000
	lduw	[%i5+%o5],%l2		! %l2 = 0000000000ff0000

p0_label_131:
!	Mem[0000000030001410] = ff0b0000, %l1 = 0000000000000000
	lduha	[%i0+%o5]0x81,%l1	! %l1 = 000000000000ff0b
!	Mem[0000000010101408] = 5effffff, %l4 = cb3f38b5fff00034
	lduha	[%i4+%o4]0x80,%l4	! %l4 = 0000000000005eff
!	Code Fragment 4
p0_fragment_9:
!	%l0 = 00000000000000ff
	setx	0x31fe063025a2c017,%g7,%l0 ! %l0 = 31fe063025a2c017
!	%l1 = 000000000000ff0b
	setx	0xaad81e47ab84d7b2,%g7,%l1 ! %l1 = aad81e47ab84d7b2
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 31fe063025a2c017
	setx	0x55e020d7e4e3e5be,%g7,%l0 ! %l0 = 55e020d7e4e3e5be
!	%l1 = aad81e47ab84d7b2
	setx	0xd9e679084f005801,%g7,%l1 ! %l1 = d9e679084f005801
!	Mem[00000000211c0000] = c0ff96d7, %l2 = 0000000000ff0000
	ldsh	[%o2+%g0],%l2		! %l2 = ffffffffffffc0ff
!	Mem[0000000030101400] = 00000000, %l3 = 0000000000000028
	lduwa	[%i4+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = ff000000 6bcdf0ff, %l0 = e4e3e5be, %l1 = 4f005801
	ldda	[%i2+0x000]%asi,%l0	! %l0 = 00000000ff000000 000000006bcdf0ff
!	Mem[00000000100c1400] = ff5a0000, %f7  = 6a1e56a3
	lda	[%i3+%g0]0x80,%f7 	! %f7 = ff5a0000
!	Mem[0000000010141400] = c0361971, %l4 = 0000000000005eff
	ldswa	[%i5+%g0]0x80,%l4	! %l4 = ffffffffc0361971
!	Mem[00000000300c1408] = 00000000, %l0 = 00000000ff000000
	lduha	[%i3+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030041408] = 000000ff
	stha	%l3,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000

p0_label_132:
!	%l2 = ffffffffffffc0ff, Mem[0000000010001400] = 34ff0bff
	stba	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 34ff0bff
!	Mem[0000000030141400] = ff00005e, %l0 = 0000000000000000
	swapa	[%i5+%g0]0x89,%l0	! %l0 = 00000000ff00005e
!	%f31 = d6d1ffff, Mem[0000000030141410] = fff00034
	sta	%f31,[%i5+%o5]0x81	! Mem[0000000030141410] = d6d1ffff
!	%l6 = 0000000000ff0000, Mem[0000000010041410] = ff00000000c00000
	stxa	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000ff0000
!	%l1 = 000000006bcdf0ff, Mem[0000000010001400] = ff0bff34
	stba	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = ff0bff34
!	%l0 = 00000000ff00005e, Mem[0000000010181408] = 0000000000000000
	stxa	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000ff00005e
!	Mem[0000000010101428] = cbc0bdbb00000082, %l1 = 000000006bcdf0ff, %l2 = ffffffffffffc0ff
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l1,%l2	! %l2 = cbc0bdbb00000082
!	%f21 = 000000f0, Mem[00000000100c1400] = ff5a0000
	sta	%f21,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000f0
!	%l6 = 0000000000ff0000, Mem[0000000010081414] = ffc3f647
	stb	%l6,[%i2+0x014]		! Mem[0000000010081414] = 00c3f647
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 0000005a00005aff, %f2  = 00000000 00000000
	ldda	[%i3+%g0]0x89,%f2 	! %f2  = 0000005a 00005aff

p0_label_133:
!	Mem[0000000030041400] = 935e0000aa451ef5, %l1 = 000000006bcdf0ff
	ldxa	[%i1+%g0]0x81,%l1	! %l1 = 935e0000aa451ef5
!	Mem[00000000100c1408] = 000000d9, %l5 = 0000000000000000
	lduba	[%i3+%o4]0x88,%l5	! %l5 = 00000000000000d9
!	Mem[0000000010181408] = 00000000, %l6 = 0000000000ff0000
	lduba	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081408] = b8000000, %l6 = 0000000000000000
	ldsha	[%i2+%o4]0x80,%l6	! %l6 = ffffffffffffb800
!	Mem[0000000010101408] = 5effffff, %l1 = 935e0000aa451ef5
	ldsw	[%i4+%o4],%l1		! %l1 = 000000005effffff
!	Mem[0000000010041418] = 00000000, %f31 = d6d1ffff
	lda	[%i1+0x018]%asi,%f31	! %f31 = 00000000
!	Mem[0000000010081438] = b8000000, %l4 = ffffffffc0361971
	lduwa	[%i2+0x038]%asi,%l4	! %l4 = 00000000b8000000
!	Mem[0000000010001400] = 34ff0bff, %l7 = 0000000000000000
	lduwa	[%i0+%g0]0x88,%l7	! %l7 = 0000000034ff0bff
!	Mem[0000000010041400] = cffbffff0000ffff, %f28 = 514ed1fd e313aae0
	ldda	[%i1+%g0]0x88,%f28	! %f28 = cffbffff 0000ffff
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffffb800, Mem[0000000030141410] = d6d1ffff
	stha	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = b800ffff

p0_label_134:
!	%l4 = 00000000b8000000, Mem[00000000100c1400] = 000000f0
	stwa	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = b8000000
!	%l5 = 00000000000000d9, Mem[0000000010141408] = 00ff0000
	stha	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 00d90000
!	%l3 = 0000000000000000, Mem[0000000010181410] = a6be57ff
	stwa	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	%l7 = 0000000034ff0bff, imm = 0000000000000c94, %l0 = 00000000ff00005e
	and	%l7,0xc94,%l0		! %l0 = 0000000000000894
!	Mem[0000000010081424] = 34f54eb1, %l6 = ffffb800, %l4 = b8000000
	add	%i2,0x24,%g1
	casa	[%g1]0x80,%l6,%l4	! %l4 = 0000000034f54eb1
!	%l5 = 00000000000000d9, Mem[0000000010041410] = 00000000
	stwa	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000d9
!	%l0 = 0000000000000894, Mem[0000000010181410] = 00000000
	stba	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000094
!	%l1 = 000000005effffff, Mem[0000000010001410] = ff000000
	stba	%l1,[%i0+%o5]0x80	! Mem[0000000010001410] = ff000000
!	Mem[0000000010181410] = 00000094, %l1 = 000000005effffff
	swapa	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000094
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 0000005a00005aff, %f30 = 0fe44624 00000000
	ldda	[%i3+%g0]0x89,%f30	! %f30 = 0000005a 00005aff

p0_label_135:
!	Mem[0000000010041410] = d9000000, %l2 = cbc0bdbb00000082
	ldsba	[%i1+%o5]0x80,%l2	! %l2 = ffffffffffffffd9
!	Mem[0000000030041400] = 00005e93, %l7 = 0000000034ff0bff
	lduwa	[%i1+%g0]0x89,%l7	! %l7 = 0000000000005e93
!	Mem[0000000010081408] = 00000000 000000b8, %l0 = 00000894, %l1 = 00000094
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 00000000000000b8 0000000000000000
!	Mem[0000000010141408] = 00d90000, %l5 = 00000000000000d9
	lduwa	[%i5+%o4]0x80,%l5	! %l5 = 0000000000d90000
!	Mem[0000000010001410] = 000000ff, %l6 = ffffffffffffb800
	ldsha	[%i0+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %l6 = 00000000000000ff
	ldsba	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041430] = ff000000, %l6 = 0000000000000000
	ldswa	[%i1+0x030]%asi,%l6	! %l6 = ffffffffff000000
!	Mem[0000000030101410] = a6be57ff, %l2 = ffffffffffffffd9
	ldswa	[%i4+%o5]0x81,%l2	! %l2 = ffffffffa6be57ff
!	Mem[0000000010141420] = fff0cd6b, %l6 = ffffffffff000000
	ldsw	[%i5+0x020],%l6		! %l6 = fffffffffff0cd6b
!	Starting 10 instruction Store Burst
!	%f11 = ffffffff, Mem[0000000030041408] = 00000000
	sta	%f11,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffffff

p0_label_136:
!	%f24 = 935e0000 aa451ef5, Mem[0000000010181420] = ba212420 01c90143
	std	%f24,[%i6+0x020]	! Mem[0000000010181420] = 935e0000 aa451ef5
!	Mem[0000000010081400] = ff000000, %l7 = 0000000000005e93
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 00000000ff000000
!	%f0  = 00ff0000 4d000000 0000005a 00005aff
!	%f4  = ff57bea6 00000000 fff0cd6b ff5a0000
!	%f8  = ba212420 01c90143 034d8e45 ffffffff
!	%f12 = 80000000 00000000 ffffffff e0000000
	stda	%f0,[%i6]ASI_BLK_AIUSL	! Block Store to 0000000030181400
!	Mem[0000000010101408] = 5effffff, %l0 = 00000000000000b8
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 000000005effffff
!	Mem[0000000010041400] = 0000ffff, %l1 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l1	! %l1 = 000000000000ffff
!	%l4 = 0000000034f54eb1, Mem[0000000010141410] = 0000ff00
	stba	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000ffb1
!	Mem[0000000030001400] = fff0cd6b, %l0 = 000000005effffff
	swapa	[%i0+%g0]0x89,%l0	! %l0 = 00000000fff0cd6b
!	%l2 = ffffffffa6be57ff, Mem[0000000030001410] = ff0b0000
	stba	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = ff0b0000
!	%l2 = ffffffffa6be57ff, Mem[00000000211c0001] = c0ff96d7, %asi = 80
	stba	%l2,[%o2+0x001]%asi	! Mem[00000000211c0000] = c0ff96d7
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = b8000000b80bff34, %f28 = cffbffff 0000ffff
	ldda	[%i3+%g0]0x80,%f28	! %f28 = b8000000 b80bff34

p0_label_137:
!	Mem[0000000030041408] = ffffffff, %l2 = ffffffffa6be57ff
	lduha	[%i1+%o4]0x89,%l2	! %l2 = 000000000000ffff
!	Mem[0000000020800040] = 00020070, %l7 = 00000000ff000000
	lduha	[%o1+0x040]%asi,%l7	! %l7 = 0000000000000002
!	%l6 = fffffffffff0cd6b, %l1 = 000000000000ffff, %l6 = fffffffffff0cd6b
	or	%l6,%l1,%l6		! %l6 = fffffffffff0ffff
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000030181410] = ff57bea600000000, %l0 = 00000000fff0cd6b
	ldxa	[%i6+%o5]0x89,%l0	! %l0 = ff57bea600000000
!	Mem[0000000010141408] = 00d900003a2b0000, %l3 = 0000000000000000
	ldxa	[%i5+0x008]%asi,%l3	! %l3 = 00d900003a2b0000
!	Mem[0000000030001410] = ff5c074700000bff, %l1 = 000000000000ffff
	ldxa	[%i0+%o5]0x89,%l1	! %l1 = ff5c074700000bff
!	Mem[0000000010141410] = b1ff0000, %f26 = e3f10393
	lda	[%i5+%o5]0x80,%f26	! %f26 = b1ff0000
!	%f26 = b1ff0000, %f14 = ffffffff, %f29 = b80bff34
	fadds	%f26,%f14,%f29		! %f29 = ffffffff
!	%f27 = ce180437, %f31 = 00005aff, %f10 = 034d8e45
	fmuls	%f27,%f31,%f10		! %l0 = ff57bea600000022, Unfinished, %fsr = 1b00000800
!	Starting 10 instruction Store Burst
!	%l2 = 0000ffff, %l3 = 3a2b0000, Mem[0000000010101418] = 0000ff57 000000cf
	stda	%l2,[%i4+0x018]%asi	! Mem[0000000010101418] = 0000ffff 3a2b0000

p0_label_138:
!	Mem[0000000030081408] = 00ff0000, %l3 = 00d900003a2b0000
	swapa	[%i2+%o4]0x81,%l3	! %l3 = 0000000000ff0000
!	%l6 = fffffffffff0ffff, Mem[0000000010081410] = 3f00ffff
	stha	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 3f00ffff
!	%l7 = 0000000000000002, Mem[0000000010081400] = 00005e936bcdf0ff
	stxa	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000000002
!	%l3 = 0000000000ff0000, Mem[0000000030141410] = ffff00b8
	stha	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = ffff0000
!	Mem[0000000010001410] = 000000ff, %l1 = ff5c074700000bff
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%f16 = 6bcdf0ff 6c57be00, Mem[0000000010041408] = 00000000 00000000
	stda	%f16,[%i1+%o4]0x80	! Mem[0000000010041408] = 6bcdf0ff 6c57be00
!	%l2 = 000000000000ffff, Mem[0000000010041420] = 0000003f00000000, %asi = 80
	stxa	%l2,[%i1+0x020]%asi	! Mem[0000000010041420] = 000000000000ffff
!	Mem[0000000010001400] = ff0bff34, %l6 = fffffffffff0ffff
	swapa	[%i0+%g0]0x80,%l6	! %l6 = 00000000ff0bff34
!	%f0  = 00ff0000 4d000000, %l7 = 0000000000000002
!	Mem[0000000030081410] = 57ff0000a6be57b8
	add	%i2,0x010,%g1
	stda	%f0,[%g1+%l7]ASI_PST16_S ! Mem[0000000030081410] = 57ff00004d0057b8
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00000000, %l0 = ff57bea600000022
	ldsba	[%i3+%o4]0x89,%l0	! %l0 = 0000000000000000

p0_label_139:
!	Mem[0000000010081418] = 181936c0 191936c0, %l2 = 0000ffff, %l3 = 00ff0000
	ldda	[%i2+0x018]%asi,%l2	! %l2 = 00000000181936c0 00000000191936c0
!	Mem[0000000030041400] = 935e0000, %l5 = 0000000000d90000
	ldsha	[%i1+%g0]0x81,%l5	! %l5 = ffffffffffff935e
!	%l0 = 0000000000000000, %l1 = 00000000000000ff, %l1 = 00000000000000ff
	xnor	%l0,%l1,%l1		! %l1 = ffffffffffffff00
!	Mem[0000000010001408] = 0000ffff, %f25 = aa451ef5
	lda	[%i0+%o4]0x88,%f25	! %f25 = 0000ffff
!	Mem[0000000010181400] = 00000000, %l5 = ffffffffffff935e
	lduha	[%i6+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081408] = b8000000, %l5 = 0000000000000000
	ldsba	[%i2+%o4]0x80,%l5	! %l5 = ffffffffffffffb8
!	Mem[0000000030001400] = ffffff5e6c57be00, %l2 = 00000000181936c0
	ldxa	[%i0+%g0]0x81,%l2	! %l2 = ffffff5e6c57be00
!	Mem[0000000020800000] = ff5e8841, %l6 = 00000000ff0bff34
	ldsha	[%o1+0x000]%asi,%l6	! %l6 = ffffffffffffff5e
!	Mem[00000000100c1400] = 000000b8, %l3 = 00000000191936c0
	ldswa	[%i3+%g0]0x88,%l3	! %l3 = 00000000000000b8
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = ffffffff, %l7 = 0000000000000002
	ldstuba	[%i5+%o4]0x81,%l7	! %l7 = 000000ff000000ff

p0_label_140:
!	%f14 = ffffffff e0000000, %l4 = 0000000034f54eb1
!	Mem[0000000030001430] = 514ed1fde313aae0
	add	%i0,0x030,%g1
	stda	%f14,[%g1+%l4]ASI_PST32_S ! Mem[0000000030001430] = 514ed1fde0000000
!	Mem[000000001014143b] = 338f3671, %l3 = 00000000000000b8
	ldstub	[%i5+0x03b],%l3		! %l3 = 00000071000000ff
!	Mem[0000000010141438] = 338f36ff, %l5 = ffffffffffffffb8
	swap	[%i5+0x038],%l5		! %l5 = 00000000338f36ff
!	%l6 = ffffff5e, %l7 = 000000ff, Mem[0000000010101408] = b8000000 fff0cd6b
	stda	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffff5e 000000ff
!	%l2 = 6c57be00, %l3 = 00000071, Mem[0000000030101400] = 00000000 0000004d
	stda	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 6c57be00 00000071
!	Mem[0000000010141408] = 00d90000, %l2 = ffffff5e6c57be00
	ldstuba	[%i5+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000010101430] = 0000006b3a2b0000, %asi = 80
	stxa	%l7,[%i4+0x030]%asi	! Mem[0000000010101430] = 00000000000000ff
!	Mem[0000000010181410] = ffffff5e, %l3 = 0000000000000071
	swapa	[%i6+%o5]0x80,%l3	! %l3 = 00000000ffffff5e
!	Mem[0000000030181410] = 00000000, %l0 = 0000000000000000
	swapa	[%i6+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = b8000000 00000000, %l0 = 00000000, %l1 = ffffff00
	ldda	[%i2+%o4]0x80,%l0	! %l0 = 00000000b8000000 0000000000000000

p0_label_141:
!	Mem[0000000010181408] = 00000000 ff00005e, %l4 = 34f54eb1, %l5 = 338f36ff
	ldda	[%i6+0x008]%asi,%l4	! %l4 = 0000000000000000 00000000ff00005e
!	%l0 = 00000000b8000000, %l0 = 00000000b8000000, %y  = 000000fd
	udiv	%l0,%l0,%l7		! %l7 = 0000000000000161
	mov	%l0,%y			! %y = b8000000
!	Mem[0000000010001410] = ff0b000000005a9b, %f16 = 6bcdf0ff 6c57be00
	ldda	[%i0+%o5]0x80,%f16	! %f16 = ff0b0000 00005a9b
!	Mem[0000000030141410] = 0000ffff, %l5 = 00000000ff00005e
	ldsba	[%i5+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141408] = ffffffff, %l7 = 0000000000000161
	ldsba	[%i5+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041400] = 00000000fffffbcf, %l3 = 00000000ffffff5e
	ldxa	[%i1+0x000]%asi,%l3	! %l3 = 00000000fffffbcf
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000010101400] = ff561e6a 6bcdf0ff 5effffff ff000000
!	Mem[0000000010101410] = 72000000 fffffbcf 0000ffff 3a2b0000
!	Mem[0000000010101420] = 555a35be 00000000 cbc0bdbb 00000082
!	Mem[0000000010101430] = 00000000 000000ff 338f3671 4e3afc72
	ldda	[%i4]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010101400
!	Mem[0000000010181410] = 71000000, %l7 = ffffffffffffffff
	ldsba	[%i6+%o5]0x88,%l7	! %l7 = 0000000000000000
!	%l4 = 0000000000000000, imm = fffffffffffff5b7, %l7 = 0000000000000000
	and	%l4,-0xa49,%l7		! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000b8000000, imm = 0000000000000ee0, %l0 = 00000000b8000000
	sub	%l0,0xee0,%l0		! %l0 = 00000000b7fff120

p0_label_142:
!	%l6 = ffffff5e, %l7 = 00000000, Mem[0000000030081400] = 370418ce ff000000
	stda	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffff5e 00000000
!	%f10 = 034d8e45 ffffffff, %f2  = 0000005a
	fxtos	%f10,%f2 		! %f2  = 5c536391
	membar	#Sync			! Added by membar checker (27)
!	%l5 = 0000000000000000, Mem[0000000010101410] = 00000072
	stha	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	%f26 = 82000000 bbbdc0cb, Mem[0000000010181408] = 00000000 5e0000ff
	stda	%f26,[%i6+%o4]0x88	! Mem[0000000010181408] = 82000000 bbbdc0cb
!	%f18 = 000000ff ffffff5e, Mem[0000000010101408] = ffffff5e 000000ff
	stda	%f18,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000ff ffffff5e
!	%f2  = 5c536391 00005aff, %l0 = 00000000b7fff120
!	Mem[0000000030041430] = 8a33ebc2536be766
	add	%i1,0x030,%g1
	stda	%f2,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030041430] = 8a33ebc25363e766
!	Mem[0000000010001408] = 0000ffff, %l2 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010141400] = c0361971, %l1 = 0000000000000000
	swapa	[%i5+%g0]0x80,%l1	! %l1 = 00000000c0361971
!	%f28 = ff000000, %f9  = 01c90143, %f6  = fff0cd6b
	fadds	%f28,%f9 ,%f6 		! %f6  = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 5e000000ffff0000, %f0  = 00ff0000 4d000000
	ldda	[%i5+%o5]0x89,%f0 	! %f0  = 5e000000 ffff0000

p0_label_143:
!	%l7 = 0000000000000000, %l7 = 0000000000000000, %l1 = 00000000c0361971
	orn	%l7,%l7,%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010001404] = ff000000, %l5 = 0000000000000000
	ldsb	[%i0+0x007],%l5		! %l5 = 0000000000000000
!	Mem[0000000030141410] = ffff0000, %f15 = e0000000
	lda	[%i5+%o5]0x89,%f15	! %f15 = ffff0000
!	Mem[0000000010141408] = 0000d9ff, %l3 = 00000000fffffbcf
	lduha	[%i5+%o4]0x88,%l3	! %l3 = 000000000000d9ff
!	Mem[0000000010041400] = 00000000, %l2 = 000000000000ffff
	lduwa	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000020800000] = ff5e8841, %l4 = 0000000000000000
	lduh	[%o1+%g0],%l4		! %l4 = 000000000000ff5e
!	Mem[0000000010141400] = 00000000, %f1  = ffff0000
	lda	[%i5+%g0]0x80,%f1 	! %f1 = 00000000
!	Mem[0000000030001410] = ff0b000047075cff, %f18 = 000000ff ffffff5e
	ldda	[%i0+%o5]0x81,%f18	! %f18 = ff0b0000 47075cff
!	Mem[00000000300c1400] = ff5a0000, %l3 = 000000000000d9ff
	lduba	[%i3+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f22 = 00002b3a ffff0000, Mem[0000000010081410] = 3f00ffff 47f6c300
	stda	%f22,[%i2+%o5]0x88	! Mem[0000000010081410] = 00002b3a ffff0000

p0_label_144:
!	Mem[0000000010041410] = d9000000, %l3 = 00000000000000ff
	swapa	[%i1+%o5]0x80,%l3	! %l3 = 00000000d9000000
!	Mem[0000000030001410] = 00000bff, %l6 = ffffffffffffff5e
	swapa	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000bff
!	Code Fragment 3
p0_fragment_10:
!	%l0 = 00000000b7fff120
	setx	0xaec564978a475b8b,%g7,%l0 ! %l0 = aec564978a475b8b
!	%l1 = ffffffffffffffff
	setx	0x71e9a29f86af6da6,%g7,%l1 ! %l1 = 71e9a29f86af6da6
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = aec564978a475b8b
	setx	0xdb2793f7fd3501c3,%g7,%l0 ! %l0 = db2793f7fd3501c3
!	%l1 = 71e9a29f86af6da6
	setx	0x893bccb06ec236dd,%g7,%l1 ! %l1 = 893bccb06ec236dd
!	Mem[0000000030141410] = 0000ffff, %l3 = 00000000d9000000
	ldstuba	[%i5+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	%l1 = 893bccb06ec236dd, Mem[00000000300c1400] = ff5a0000
	stha	%l1,[%i3+%g0]0x81	! Mem[00000000300c1400] = 36dd0000
!	%f22 = 00002b3a ffff0000, Mem[0000000010181400] = 00000000 00000000
	stda	%f22,[%i6+%g0]0x88	! Mem[0000000010181400] = 00002b3a ffff0000
!	%l4 = 000000000000ff5e, Mem[0000000030101408] = 00000000
	stba	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 5e000000
!	%l3 = 0000000000000000, Mem[0000000030081410] = 57ff0000
	stha	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	Mem[00000000300c1400] = 0000dd36, %l2 = 0000000000000000
	lduwa	[%i3+%g0]0x89,%l2	! %l2 = 000000000000dd36
!	Starting 10 instruction Load Burst
!	Mem[0000000010101420] = 555a35be 00000000, %l2 = 0000dd36, %l3 = 00000000
	ldda	[%i4+0x020]%asi,%l2	! %l2 = 00000000555a35be 0000000000000000

p0_label_145:
!	Mem[0000000010141408] = ffd900003a2b0000, %l5 = 0000000000000000
	ldxa	[%i5+%o4]0x80,%l5	! %l5 = ffd900003a2b0000
!	Mem[0000000010041410] = 000000ff00ff0000, %f10 = 034d8e45 ffffffff
	ldda	[%i1+%o5]0x80,%f10	! %f10 = 000000ff 00ff0000
!	Mem[0000000010181410] = 00000071, %l3 = 0000000000000000
	ldub	[%i6+%o5],%l3		! %l3 = 0000000000000000
!	Mem[0000000010141420] = fff0cd6b, %l3 = 0000000000000000
	ldsb	[%i5+0x020],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010101400] = fff0cd6b6a1e56ff, %f22 = 00002b3a ffff0000
	ldda	[%i4+%g0]0x88,%f22	! %f22 = fff0cd6b 6a1e56ff
!	Mem[0000000030101410] = a6be57ff51eba96c, %l0 = db2793f7fd3501c3
	ldxa	[%i4+%o5]0x81,%l0	! %l0 = a6be57ff51eba96c
!	Mem[0000000030101400] = 6c57be00 00000071, %l0 = 51eba96c, %l1 = 6ec236dd
	ldda	[%i4+%g0]0x81,%l0	! %l0 = 000000006c57be00 0000000000000071
!	Mem[0000000010141410] = b1ff0000, %l2 = 00000000555a35be
	ldswa	[%i5+%o5]0x80,%l2	! %l2 = ffffffffb1ff0000
!	Mem[0000000010141400] = 00000000, %f6  = ff000000
	lda	[%i5+%g0]0x88,%f6 	! %f6 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = e804a6ff, %l6 = 0000000000000bff
	ldstuba	[%i1+%o5]0x89,%l6	! %l6 = 000000ff000000ff

p0_label_146:
!	Mem[0000000010141407] = 34ff0bb8, %l3 = ffffffffffffffff
	ldstub	[%i5+0x007],%l3		! %l3 = 000000b8000000ff
!	Mem[0000000030141408] = ffffffff, %l1 = 0000000000000071
	ldstuba	[%i5+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	%l7 = 0000000000000000, Mem[0000000030081410] = 00000000
	stwa	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	%l6 = 00000000000000ff, Mem[0000000030141410] = ffff00ff
	stwa	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000ff
!	%l1 = 00000000000000ff, Mem[0000000010081400] = 00000000
	stba	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff
!	%l6 = 00000000000000ff, Mem[0000000030141410] = ff000000
	stwa	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000ff
!	%l2 = ffffffffb1ff0000, %l4 = 000000000000ff5e, %l7 = 0000000000000000
	andn	%l2,%l4,%l7		! %l7 = ffffffffb1ff0000
!	Mem[0000000010101410] = 00000000, %l7 = ffffffffb1ff0000
	ldstuba	[%i4+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%l0 = 000000006c57be00, imm = fffffffffffff1c6, %l3 = 00000000000000b8
	or	%l0,-0xe3a,%l3		! %l3 = ffffffffffffffc6
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 5effffff, %f23 = 6a1e56ff
	lda	[%i0+%g0]0x89,%f23	! %f23 = 5effffff

p0_label_147:
!	Mem[0000000030081408] = 00002b3a, %l3 = ffffffffffffffc6
	lduwa	[%i2+%o4]0x89,%l3	! %l3 = 0000000000002b3a
!	Mem[000000001010142c] = 00000082, %l0 = 000000006c57be00
	ldsba	[%i4+0x02e]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041408] = 6bcdf0ff, %l6 = 00000000000000ff
	ldsba	[%i1+%o4]0x80,%l6	! %l6 = 000000000000006b
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000010001400] = fff0ffff ff000000 00000000 0000006b
!	Mem[0000000010001410] = ff0b0000 00005a9b b857bea6 c0361918
!	Mem[0000000010001420] = b14ef534 54ffcac2 f7ccb6ff bbbdc0cb
!	Mem[0000000010001430] = 7fffffff 3b7d6197 72fc3a4e 71368f33
	ldda	[%i0]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010001400
!	Mem[0000000030001408] = ffffffff, %l3 = 0000000000002b3a
	lduha	[%i0+%o4]0x81,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010001410] = 9b5a000000000bff, %l6 = 000000000000006b
	ldxa	[%i0+%o5]0x88,%l6	! %l6 = 9b5a000000000bff
!	%l7 = 0000000000000000, %l6 = 9b5a000000000bff, %l3 = 000000000000ffff
	udivx	%l7,%l6,%l3		! %l3 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l6 = 9b5a000000000bff
	lduwa	[%i5+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041430] = ff000000, %f27 = bbbdc0cb
	lda	[%i1+0x030]%asi,%f27	! %f27 = ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 00be576c, %l4 = 000000000000ff5e
	ldstuba	[%i4+%g0]0x89,%l4	! %l4 = 0000006c000000ff

p0_label_148:
!	%f30 = 72fc3a4e 71368f33, Mem[0000000010101400] = ff561e6a 6bcdf0ff
	stda	%f30,[%i4+%g0]0x80	! Mem[0000000010101400] = 72fc3a4e 71368f33
!	Mem[0000000030001400] = ffffff5e, %l4 = 000000000000006c
	lduha	[%i0+%g0]0x81,%l4	! %l4 = 000000000000ffff
!	%l2 = ffffffffb1ff0000, Mem[0000000010041400] = 00000000fffffbcf
	stx	%l2,[%i1+%g0]		! Mem[0000000010041400] = ffffffffb1ff0000
!	%l7 = 0000000000000000, Mem[0000000030081400] = 5effffff
	stwa	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010041410] = 000000ff
	stha	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000ff
!	%f28 = ff000000 00000000, %l0 = 0000000000000000
!	Mem[0000000010181400] = 0000ffff3a2b0000
	stda	%f28,[%i6+%l0]ASI_PST32_P ! Mem[0000000010181400] = 0000ffff3a2b0000
!	Mem[00000000201c0001] = a6f04531, %l5 = ffd900003a2b0000
	ldstub	[%o0+0x001],%l5		! %l5 = 000000f0000000ff
!	%l1 = 00000000000000ff, Mem[0000000010141430] = 0000006b3a2b0000
	stx	%l1,[%i5+0x030]		! Mem[0000000010141430] = 00000000000000ff
!	%l6 = 00000000, %l7 = 00000000, Mem[00000000300c1400] = 0000dd36 0000005a
	stda	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 5effffff, %l3 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l3	! %l3 = 000000005effffff

p0_label_149:
!	Mem[0000000010101408] = 00000000, %l5 = 00000000000000f0
	ldswa	[%i4+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081438] = b8000000, %l4 = 000000000000ffff
	lduw	[%i2+0x038],%l4		! %l4 = 00000000b8000000
!	Mem[0000000010101410] = 000000ff, %l5 = 0000000000000000
	lduwa	[%i4+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181410] = 00000071, %l4 = 00000000b8000000
	lduwa	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000071
!	Mem[0000000030041400] = 00005e93, %l0 = 0000000000000000
	ldswa	[%i1+%g0]0x89,%l0	! %l0 = 0000000000005e93
!	Mem[0000000010101410] = ff000000, %l5 = 00000000000000ff
	lduwa	[%i4+%o5]0x80,%l5	! %l5 = 00000000ff000000
!	%l4 = 0000000000000071, immed = 00000e62, %y  = b8000000
	sdiv	%l4,0xe62,%l2		! %l2 = ffffffff80000000
	mov	%l0,%y			! %y = 00005e93
!	Mem[00000000100c1400] = b8000000, %l3 = 000000005effffff
	ldsw	[%i3+%g0],%l3		! %l3 = ffffffffb8000000
!	Mem[0000000010041408] = fff0cd6b, %l0 = 0000000000005e93
	ldswa	[%i1+%o4]0x88,%l0	! %l0 = fffffffffff0cd6b
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffb8000000, Mem[0000000010081400] = ff000000
	stw	%l3,[%i2+%g0]		! Mem[0000000010081400] = b8000000

p0_label_150:
!	Mem[00000000300c1408] = 00000000, %l6 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	%l3 = ffffffffb8000000, Mem[0000000021800180] = 175f4833
	stb	%l3,[%o3+0x180]		! Mem[0000000021800180] = 005f4833
	membar	#Sync			! Added by membar checker (29)
!	%l5 = 00000000ff000000, Mem[0000000010001410] = 00000bff
	stha	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	%f22 = fff0cd6b, %f30 = 72fc3a4e
	fcmps	%fcc1,%f22,%f30		! %fcc1 = 3
!	Mem[0000000010101428] = cbc0bdbb00000082, %l4 = 0000000000000071, %l1 = 00000000000000ff
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l4,%l1	! %l1 = cbc0bdbb00000082
!	Mem[00000000300c1400] = 00000000, %l6 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%l2 = ffffffff80000000, Mem[0000000010041410] = 000000ff00ff0000
	stxa	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffffff80000000
!	%f2  = 6b000000, Mem[0000000010041400] = ffffffff
	sta	%f2 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 6b000000
!	%l4 = 00000071, %l5 = ff000000, Mem[0000000010041410] = ffffffff 00000080
	stda	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000071 ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00000000, %l2 = ffffffff80000000
	ldsba	[%i5+%g0]0x88,%l2	! %l2 = 0000000000000000

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	smul	%l1,%l5,%l2
	stha	%l0,[%i3+0x00c]%asi
	nop
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be fffffffffff0cd6b
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be cbc0bdbb00000082
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be ffffffffb8000000
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000000071
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000ff000000
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x00005e93,%g2
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
	cmp	%l0,%l1			! %f0  should be 000000ff fffff0ff
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 6b000000 00000000
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 9b5a0000 00000bff
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 181936c0 a6be57b8
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be c2caff54 34f54eb1
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be cbc0bdbb ffb6ccf7
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 97617d3b ffffff7f
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 338f3671 4e3afc72
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be fff0cd6b 6a1e56ff
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be ff0b0000 47075cff
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be cffbffff 00000072
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be fff0cd6b 5effffff
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 00000000 be355a55
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 82000000 ff000000
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be ff000000 00000000
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 72fc3a4e 71368f33
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
	andn	%l1,%l4,%l6
	done

p0_trap1o:
	andn	%l1,%l4,%l6
	done


p0_trap2e:
	ldxa	[%i6+%o4]ASI_AS_IF_USER_PRIMARY,%l6	! Mem[0000000010181408]
	done

p0_trap2o:
	ldxa	[%o6+%i4]ASI_AS_IF_USER_PRIMARY,%l6	! Mem[0000000010181408]
	done


p0_trap3e:
	andn	%l7,0x869,%l0
	xor	%l4,%l4,%l4
	done

p0_trap3o:
	andn	%l7,0x869,%l0
	xor	%l4,%l4,%l4
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
	ldx	[%g1+0x000],%l0		! %l0 = 6b8d32d89cf86588
	ldx	[%g1+0x008],%l1		! %l1 = 5ceea6608810975e
	ldx	[%g1+0x010],%l2		! %l2 = ad5307e7e42d9b9c
	ldx	[%g1+0x018],%l3		! %l3 = accf2f0e37d4e922
	ldx	[%g1+0x020],%l4		! %l4 = 7057814c5bfc17a8
	ldx	[%g1+0x028],%l5		! %l5 = 05e75992a700f72d
	ldx	[%g1+0x030],%l6		! %l6 = e3fa840198add263
	ldx	[%g1+0x038],%l7		! %l7 = b18d5eb2193e10b4

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
	andn	%l1,%l4,%l6
	and	%l7,0x922,%l4
	smul	%l0,%l2,%l1
	sdivx	%l1,0xf59,%l3
	jmpl	%o7,%g0
	st	%f15,[%i4+0x024]	! Mem[0000000010101424]
p0_near_0_he:
	jmpl	%o7,%g0
	subc	%l3,0xfb6,%l2
	jmpl	%o7,%g0
	nop
near0_b2b_h:
	fdivs	%f17,%f22,%f25
	fsqrts	%f26,%f26
	jmpl	%o7,%g0
	or	%l0,%l7,%l2
near0_b2b_l:
	or	%l5,%l3,%l5
	add	%l4,0xf6b,%l0
	jmpl	%o7,%g0
	umul	%l7,-0x4e4,%l5
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	add	%l7,%l5,%l2
	fsubs	%f11,%f7 ,%f15
	udivx	%l3,%l0,%l7
	udivx	%l2,%l1,%l7
	xnor	%l6,0x177,%l0
	addc	%l6,%l2,%l0
	and	%l7,0x8ad,%l6
	jmpl	%o7,%g0
	subc	%l4,-0x36f,%l5
p0_near_1_he:
	jmpl	%o7,%g0
	xnor	%l4,0x488,%l5
	jmpl	%o7,%g0
	nop
near1_b2b_h:
	fsubs	%f28,%f17,%f29
	xor	%l4,-0x4e9,%l5
	sub	%l4,0xef7,%l0
	jmpl	%o7,%g0
	mulx	%l7,-0x105,%l7
near1_b2b_l:
	and	%l4,%l2,%l4
	fdivs	%f14,%f7 ,%f15
	sub	%l6,-0x07d,%l1
	jmpl	%o7,%g0
	fsubs	%f9 ,%f3 ,%f5 
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	jmpl	%o7,%g0
	fadds	%f12,%f1 ,%f15
	jmpl	%o7,%g0
	nop
p0_near_2_he:
	addc	%l0,0xe41,%l2
	and	%l1,-0x1a6,%l0
	fmuls	%f29,%f16,%f30
	smul	%l3,%l6,%l2
	jmpl	%o7,%g0
	fsqrts	%f29,%f19
near2_b2b_h:
	jmpl	%o7,%g0
	andn	%l3,%l7,%l0
	jmpl	%o7,%g0
	nop
near2_b2b_l:
	jmpl	%o7,%g0
	umul	%l7,%l0,%l3
	jmpl	%o7,%g0
	nop
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	jmpl	%o7,%g0
	xor	%l2,-0xd21,%l6
	jmpl	%o7,%g0
	nop
p0_near_3_he:
	xnor	%l0,-0x735,%l6
	ldx	[%i2+0x008],%l0		! Mem[0000000010081408]
	jmpl	%o7,%g0
	andn	%l5,0xff7,%l5
near3_b2b_h:
	fcmps	%fcc1,%f25,%f30
	or	%l1,-0x887,%l5
	jmpl	%o7,%g0
	fadds	%f18,%f17,%f18
near3_b2b_l:
	fdivs	%f15,%f11,%f11
	andn	%l1,-0x233,%l5
	jmpl	%o7,%g0
	fmuls	%f13,%f12,%f15
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	sub	%l3,%l5,%l5
	umul	%l5,-0x2c5,%l7
	mulx	%l4,%l1,%l4
	jmpl	%o7,%g0
	andn	%l5,-0x98a,%l0
p0_far_0_lem:
	sub	%l3,%l5,%l5
	umul	%l5,-0x2c5,%l7
	mulx	%l4,%l1,%l4
	jmpl	%o7,%g0
	andn	%l5,-0x98a,%l0
p0_far_0_he:
	jmpl	%o7,%g0
	xor	%l6,-0xbad,%l3
	jmpl	%o7,%g0
	nop
p0_far_0_hem:
	jmpl	%o7,%g0
	xor	%l6,-0xbad,%l3
	jmpl	%o7,%g0
	nop
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	and	%l3,%l0,%l2
	jmpl	%o7,%g0
	xor	%l2,-0x8bf,%l3
far0_b2b_l:
	xnor	%l4,0xf7f,%l1
	jmpl	%o7,%g0
	andn	%l5,-0xdc6,%l6
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	and	%l5,%l0,%l3
	xor	%l3,%l3,%l4
	subc	%l6,%l7,%l5
	sub	%l3,%l2,%l5
	orn	%l0,-0x81e,%l7
	sdivx	%l1,%l3,%l2
	fmuls	%f8 ,%f0 ,%f13
	jmpl	%o7,%g0
	xnor	%l0,0xa1d,%l5
p0_far_1_lem:
	and	%l5,%l0,%l3
	xor	%l3,%l3,%l4
	subc	%l6,%l7,%l5
	sub	%l3,%l2,%l5
	orn	%l0,-0x81e,%l7
	sdivx	%l1,%l3,%l2
	fmuls	%f8 ,%f0 ,%f13
	jmpl	%o7,%g0
	xnor	%l0,0xa1d,%l5
p0_far_1_he:
	fcmps	%fcc3,%f19,%f31
	sub	%l6,0x872,%l4
	fsqrts	%f25,%f29
	jmpl	%o7,%g0
	fdivs	%f22,%f31,%f25
p0_far_1_hem:
	fcmps	%fcc3,%f19,%f31
	sub	%l6,0x872,%l4
	fsqrts	%f25,%f29
	jmpl	%o7,%g0
	fdivs	%f22,%f31,%f25
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	mulx	%l3,0xde0,%l2
	subc	%l6,%l5,%l4
	andn	%l2,-0x94d,%l1
	jmpl	%o7,%g0
	andn	%l5,0x131,%l5
far1_b2b_l:
	xnor	%l2,%l0,%l1
	smul	%l7,-0x068,%l0
	fsubs	%f3 ,%f3 ,%f15
	jmpl	%o7,%g0
	add	%l0,%l0,%l7
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	fadds	%f0 ,%f9 ,%f8 
	udivx	%l1,%l3,%l6
	smul	%l3,%l7,%l0
	jmpl	%o7,%g0
	add	%l0,%l4,%l3
p0_far_2_lem:
	fadds	%f0 ,%f9 ,%f8 
	udivx	%l1,%l3,%l6
	smul	%l3,%l7,%l0
	jmpl	%o7,%g0
	add	%l0,%l4,%l3
p0_far_2_he:
	sdivx	%l0,-0x44c,%l1
	fcmps	%fcc2,%f30,%f17
	jmpl	%o7,%g0
	xnor	%l6,0xc3e,%l2
p0_far_2_hem:
	sdivx	%l0,-0x44c,%l1
	fcmps	%fcc2,%f30,%f17
	jmpl	%o7,%g0
	xnor	%l6,0xc3e,%l2
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	jmpl	%o7,%g0
	andn	%l7,%l6,%l2
	jmpl	%o7,%g0
	nop
far2_b2b_l:
	jmpl	%o7,%g0
	subc	%l7,%l1,%l3
	jmpl	%o7,%g0
	nop
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	fcmps	%fcc0,%f15,%f11
	jmpl	%o7,%g0
	subc	%l1,0x269,%l7
p0_far_3_lem:
	fcmps	%fcc0,%f15,%f11
	jmpl	%o7,%g0
	subc	%l1,0x269,%l7
p0_far_3_he:
	ldd	[%i5+0x030],%f16	! Mem[0000000010141430]
	mulx	%l7,%l7,%l5
	jmpl	%o7,%g0
	udivx	%l0,%l3,%l0
p0_far_3_hem:
	membar	#Sync
	ldd	[%i5+0x030],%f16	! Mem[0000000010141430]
	mulx	%l7,%l7,%l5
	jmpl	%o7,%g0
	udivx	%l0,%l3,%l0
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	fsubs	%f28,%f28,%f28
	fdivs	%f29,%f16,%f24
	fmuls	%f20,%f31,%f23
	jmpl	%o7,%g0
	fadds	%f16,%f26,%f23
far3_b2b_l:
	fcmps	%fcc3,%f14,%f4 
	sdivx	%l7,0x893,%l0
	udivx	%l4,%l0,%l2
	jmpl	%o7,%g0
	umul	%l3,%l6,%l3
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	fdivs	%f0 ,%f1 ,%f14
	fitos	%f3 ,%f9 
	fsubs	%f4 ,%f9 ,%f7 
	umul	%l5,%l3,%l7
	jmpl	%g6+8,%g0
	sub	%l5,%l7,%l4
p0_call_0_le:
	or	%l3,0x2e2,%l2
	orn	%l2,-0xd70,%l5
	fcmps	%fcc2,%f8 ,%f1 
	retl
	addc	%l0,%l1,%l0
p0_jmpl_0_lo:
	fdivs	%f0 ,%f1 ,%f14
	fitos	%f3 ,%f9 
	fsubs	%f4 ,%f9 ,%f7 
	umul	%l5,%l3,%l7
	jmpl	%g6+8,%g0
	sub	%l5,%l7,%l4
p0_call_0_lo:
	or	%l3,0x2e2,%l2
	orn	%l2,-0xd70,%l5
	fcmps	%fcc2,%f8 ,%f1 
	retl
	addc	%l0,%l1,%l0
p0_jmpl_0_he:
	and	%l2,-0x0c8,%l3
	udivx	%l5,0xa4a,%l2
	fcmps	%fcc1,%f27,%f28
	sub	%l5,0x6b1,%l2
	and	%l2,%l7,%l1
	jmpl	%g6+8,%g0
	fdivs	%f26,%f16,%f24
p0_call_0_he:
	retl
	sdivx	%l5,%l0,%l0
p0_jmpl_0_ho:
	and	%l2,-0x0c8,%l3
	udivx	%l5,0xa4a,%l2
	fcmps	%fcc1,%f27,%f28
	sub	%l5,0x6b1,%l2
	and	%l2,%l7,%l1
	jmpl	%g6+8,%g0
	fdivs	%f26,%f16,%f24
p0_call_0_ho:
	retl
	sdivx	%l5,%l0,%l0
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	add	%l2,%l5,%l4
	andn	%l4,0x4cc,%l5
	subc	%l5,%l1,%l3
	xnor	%l2,%l6,%l0
	jmpl	%g6+8,%g0
	stb	%l2,[%i6+0x022]		! Mem[0000000010181422]
p0_call_1_le:
	fcmps	%fcc0,%f11,%f10
	xnor	%l1,-0xadb,%l1
	retl
	fcmps	%fcc0,%f10,%f7 
p0_jmpl_1_lo:
	add	%l2,%l5,%l4
	andn	%l4,0x4cc,%l5
	subc	%l5,%l1,%l3
	xnor	%l2,%l6,%l0
	jmpl	%g6+8,%g0
	stb	%l2,[%o6+0x022]		! Mem[0000000010181422]
p0_call_1_lo:
	fcmps	%fcc0,%f11,%f10
	xnor	%l1,-0xadb,%l1
	retl
	fcmps	%fcc0,%f10,%f7 
p0_jmpl_1_he:
	orn	%l5,0xbbe,%l5
	smul	%l1,%l6,%l5
	addc	%l0,0x919,%l1
	mulx	%l3,-0xa19,%l7
	xor	%l6,%l0,%l6
	fmuls	%f22,%f26,%f17
	jmpl	%g6+8,%g0
	fdivs	%f22,%f28,%f31
p0_call_1_he:
	retl
	fdivs	%f22,%f31,%f24
p0_jmpl_1_ho:
	orn	%l5,0xbbe,%l5
	smul	%l1,%l6,%l5
	addc	%l0,0x919,%l1
	mulx	%l3,-0xa19,%l7
	xor	%l6,%l0,%l6
	fmuls	%f22,%f26,%f17
	jmpl	%g6+8,%g0
	fdivs	%f22,%f28,%f31
p0_call_1_ho:
	retl
	fdivs	%f22,%f31,%f24
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	fmuls	%f11,%f9 ,%f14
	smul	%l0,%l5,%l1
	jmpl	%g6+8,%g0
	smul	%l1,0xcc8,%l4
p0_call_2_le:
	fsqrts	%f10,%f11
	subc	%l1,%l0,%l7
	fsqrts	%f1 ,%f4 
	retl
	sdivx	%l4,%l3,%l3
p0_jmpl_2_lo:
	fmuls	%f11,%f9 ,%f14
	smul	%l0,%l5,%l1
	jmpl	%g6+8,%g0
	smul	%l1,0xcc8,%l4
p0_call_2_lo:
	fsqrts	%f10,%f11
	subc	%l1,%l0,%l7
	fsqrts	%f1 ,%f4 
	retl
	sdivx	%l4,%l3,%l3
p0_jmpl_2_he:
	orn	%l1,%l3,%l7
	swap	[%i3+0x038],%l1		! Mem[00000000100c1438]
	fdivs	%f28,%f31,%f31
	fadds	%f19,%f19,%f16
	xnor	%l7,%l0,%l7
	orn	%l4,-0x187,%l1
	jmpl	%g6+8,%g0
	add	%l0,-0x8bc,%l4
p0_call_2_he:
	addc	%l1,%l4,%l3
	retl
	addc	%l5,%l3,%l7
p0_jmpl_2_ho:
	orn	%l1,%l3,%l7
	swap	[%o3+0x038],%l1		! Mem[00000000100c1438]
	fdivs	%f28,%f31,%f31
	fadds	%f19,%f19,%f16
	xnor	%l7,%l0,%l7
	orn	%l4,-0x187,%l1
	jmpl	%g6+8,%g0
	add	%l0,-0x8bc,%l4
p0_call_2_ho:
	addc	%l1,%l4,%l3
	retl
	addc	%l5,%l3,%l7
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	subc	%l3,-0x86e,%l0
	addc	%l7,%l6,%l0
	fadds	%f5 ,%f6 ,%f12
	subc	%l1,%l4,%l1
	mulx	%l3,%l6,%l2
	orn	%l0,-0x733,%l2
	jmpl	%g6+8,%g0
	ldd	[%i6+0x038],%l0		! Mem[0000000010181438]
p0_call_3_le:
	orn	%l3,%l0,%l6
	smul	%l7,-0xfad,%l6
	orn	%l7,%l6,%l6
	fcmps	%fcc2,%f13,%f9 
	orn	%l4,%l6,%l3
	retl
	mulx	%l5,%l6,%l4
p0_jmpl_3_lo:
	subc	%l3,-0x86e,%l0
	addc	%l7,%l6,%l0
	fadds	%f5 ,%f6 ,%f12
	subc	%l1,%l4,%l1
	mulx	%l3,%l6,%l2
	orn	%l0,-0x733,%l2
	jmpl	%g6+8,%g0
	ldd	[%o6+0x038],%l0		! Mem[0000000010181438]
p0_call_3_lo:
	orn	%l3,%l0,%l6
	smul	%l7,-0xfad,%l6
	orn	%l7,%l6,%l6
	fcmps	%fcc2,%f13,%f9 
	orn	%l4,%l6,%l3
	retl
	mulx	%l5,%l6,%l4
p0_jmpl_3_he:
	fcmps	%fcc3,%f18,%f17
	fcmps	%fcc2,%f24,%f22
	fadds	%f31,%f23,%f20
	jmpl	%g6+8,%g0
	xor	%l0,%l2,%l2
p0_call_3_he:
	andn	%l0,0x45e,%l6
	umul	%l4,-0x0b0,%l1
	sdivx	%l5,%l0,%l3
	xor	%l7,0x4cc,%l1
	ldd	[%i6+0x000],%l6		! Mem[0000000010181400]
	sub	%l1,0x145,%l7
	udivx	%l3,%l2,%l5
	retl
	sub	%l3,0x09d,%l1
p0_jmpl_3_ho:
	fcmps	%fcc3,%f18,%f17
	fcmps	%fcc2,%f24,%f22
	fadds	%f31,%f23,%f20
	jmpl	%g6+8,%g0
	xor	%l0,%l2,%l2
p0_call_3_ho:
	andn	%l0,0x45e,%l6
	umul	%l4,-0x0b0,%l1
	sdivx	%l5,%l0,%l3
	xor	%l7,0x4cc,%l1
	ldd	[%o6+0x000],%l6		! Mem[0000000010181400]
	sub	%l1,0x145,%l7
	udivx	%l3,%l2,%l5
	retl
	sub	%l3,0x09d,%l1
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
	.word	0x6b8d32d8,0x9cf86588		! Init value for %l0
	.word	0x5ceea660,0x8810975e		! Init value for %l1
	.word	0xad5307e7,0xe42d9b9c		! Init value for %l2
	.word	0xaccf2f0e,0x37d4e922		! Init value for %l3
	.word	0x7057814c,0x5bfc17a8		! Init value for %l4
	.word	0x05e75992,0xa700f72d		! Init value for %l5
	.word	0xe3fa8401,0x98add263		! Init value for %l6
	.word	0xb18d5eb2,0x193e10b4		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xbf4868b0,0x443541f1		! Init value for %f0 
	.word	0x06cf234f,0x50e1d112		! Init value for %f2 
	.word	0x34410bb8,0xda8f2695		! Init value for %f4 
	.word	0xa3561e6a,0x4ead84b8		! Init value for %f6 
	.word	0x64a1d6cb,0x339398c5		! Init value for %f8 
	.word	0x7daf2ca7,0xa924ff12		! Init value for %f10
	.word	0xc59c80f6,0xe6a17139		! Init value for %f12
	.word	0xfa8abe3f,0xc94fafea		! Init value for %f14
	.word	0x29186169,0x1bd4c82c		! Init value for %f16
	.word	0xba212420,0x6b16c86c		! Init value for %f18
	.word	0x6db09672,0x2fbd32dd		! Init value for %f20
	.word	0x2dd82dec,0x33bfe483		! Init value for %f22
	.word	0x3f88b412,0x24321178		! Init value for %f24
	.word	0xef64c2d6,0xd7196b5b		! Init value for %f26
	.word	0xa31cfa78,0xdeb657c2		! Init value for %f28
	.word	0x80a46a35,0x5ec2e987		! Init value for %f30
	.word	0xb9e15608,0xff1970b7		! Init value for %f32
	.word	0x7b3ab952,0x86e03180		! Init value for %f34
	.word	0x217b42c4,0x336e8dc1		! Init value for %f36
	.word	0x66475fd3,0x106f3dc7		! Init value for %f38
	.word	0x5ef8a92d,0xe44d5fdf		! Init value for %f40
	.word	0xb694d08a,0xcba7a90f		! Init value for %f42
	.word	0xb8c2f12e,0xf777abfa		! Init value for %f44
	.word	0xfd26ac1e,0xb6021b82		! Init value for %f46
	.word	0x45628594,0x8d42246f
	.word	0x2bc7543c,0xe3b83d8b
	.word	0x2f4b122e,0x70f83a71
	.word	0x169c3d90,0xddc11387
	.word	0x9d20dd58,0x8bf84e00
	.word	0x24e6ef00,0xf50f0125
	.word	0x21f75961,0xabb63112
	.word	0x65a9bb40,0xdd7c4106
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
	.word	0xffffffff,0xfff0cd6b
	.word	0xcbc0bdbb,0x00000082
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xb8000000
	.word	0x00000000,0x00000071
	.word	0x00000000,0xff000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
p0_expected_fp_regs:
	.word	0x000000ff,0xfffff0ff
	.word	0x6b000000,0x00000000
	.word	0x9b5a0000,0x00000bff
	.word	0x181936c0,0xa6be57b8
	.word	0xc2caff54,0x34f54eb1
	.word	0xcbc0bdbb,0xffb6ccf7
	.word	0x97617d3b,0xffffff7f
	.word	0x338f3671,0x4e3afc72
	.word	0xfff0cd6b,0x6a1e56ff
	.word	0xff0b0000,0x47075cff
	.word	0xcffbffff,0x00000072
	.word	0xfff0cd6b,0x5effffff
	.word	0x00000000,0xbe355a55
	.word	0x82000000,0xff000000
	.word	0xff000000,0x00000000
	.word	0x72fc3a4e,0x71368f33
	.word	0x0000001b,0x00000800		! %fsr = 0000001b00000800
p0_local0_expect:
	.word	0xfff0ffff,0xff000000
	.word	0x00000000,0x0000006b
	.word	0x00000000,0x00005a9b
	.word	0xb857bea6,0xc0361918
	.word	0xb14ef534,0x54ffcac2
	.word	0xf7ccb6ff,0xbbbdc0cb
	.word	0x7fffffff,0x3b7d6197
	.word	0x72fc3a4e,0x71368f33
p0_local0_sec_expect:
	.word	0xffffff5e,0x6c57be00
	.word	0xffffffff,0xffffa6f0
	.word	0x5effffff,0x47075cff
	.word	0xe00e3189,0x000000b8
	.word	0x935e0000,0xaa451ef5
	.word	0xe3f10393,0xce180437
	.word	0x514ed1fd,0xe0000000
	.word	0xcfc060e8,0xd6d1ffff
p0_local1_expect:
	.word	0x6b000000,0xb1ff0000
	.word	0x6bcdf0ff,0x6c57be00
	.word	0x71000000,0x000000ff
	.word	0x00000000,0xc88d05cb
	.word	0x00000000,0x0000ffff
	.word	0xf6b49455,0xd564900b
	.word	0xff000000,0x000000ff
	.word	0xffff9b5a,0x439b4544
p0_local1_sec_expect:
	.word	0x935e0000,0xaa451ef5
	.word	0xffffffff,0x0000006b
	.word	0xffa604e8,0x42b0055c
	.word	0xd3ecdbd1,0x1ba00b2f
	.word	0x353ee4a8,0xd675efff
	.word	0x4ef21338,0x464d0964
	.word	0x8a33ebc2,0x5363e766
	.word	0x478242fe,0x4453a10b
p0_local2_expect:
	.word	0xb8000000,0x00000002
	.word	0xb8000000,0x00000000
	.word	0x0000ffff,0x3a2b0000
	.word	0x181936c0,0x191936c0
	.word	0xc2ca7554,0x34f54eb1
	.word	0x72fc3a70,0x00000000
	.word	0x6b16c86c,0xffffff7f
	.word	0xb8000000,0x6f000000
p0_local2_sec_expect:
	.word	0x00000000,0x00000000
	.word	0x3a2b0000,0x7119b5cf
	.word	0x00000000,0x4d0057b8
	.word	0x7b3272f3,0x838b7c3e
	.word	0x3d0983c7,0x4c634a28
	.word	0xbbbdc0cb,0xf6809cc5
	.word	0xe36a7693,0x470760ff
	.word	0x0081ee38,0xfad17a7a
p0_local3_expect:
	.word	0xb8000000,0xb80bff34
	.word	0xd9000000,0xb5383fcb
	.word	0x00000000,0x00000000
	.word	0xba212420,0x01c90143
	.word	0x00000023,0x2b9a946c
	.word	0x3f00ffff,0x0043dc0f
	.word	0xc5989333,0xffffffff
	.word	0x6b16c86c,0x0000006c
p0_local3_sec_expect:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xffc906d9,0x000000b8
	.word	0x271f3cb5,0x5bf37755
	.word	0xba33ec5b,0x846f58e0
	.word	0x2f6eab03,0x071325e2
	.word	0xb7bbf852,0xe9d22342
	.word	0x6ec31e5e,0x801f66dc
p0_local4_expect:
	.word	0x72fc3a4e,0x71368f33
	.word	0x00000000,0xff000000
	.word	0xff000000,0xfffffbcf
	.word	0x0000ffff,0x3a2b0000
	.word	0x555a35be,0x00000000
	.word	0xcbc0bdbb,0x00000082
	.word	0x00000000,0x000000ff
	.word	0x338f3671,0x4e3afc72
p0_local4_sec_expect:
	.word	0xff57be00,0x00000071
	.word	0x5e000000,0x00000061
	.word	0xa6be57ff,0x51eba96c
	.word	0x00000000,0x6bcdf0ff
	.word	0xffdce777,0x77e7dcff
	.word	0x00000000,0x0000d9df
	.word	0xffffffff,0x339398c5
	.word	0x47f6c323,0x3f00ffff
p0_local5_expect:
	.word	0x00000000,0x34ff0bff
	.word	0xffd90000,0x3a2b0000
	.word	0xb1ff0000,0xfffffbcf
	.word	0x0000ff5e,0xa6be57b8
	.word	0xfff0cd6b,0x00000000
	.word	0xcbc0bdbb,0x00000082
	.word	0x00000000,0x000000ff
	.word	0xffffffb8,0x4e3afc72
p0_local5_sec_expect:
	.word	0x00000000,0xb7400800
	.word	0xffffffff,0x458e4d03
	.word	0x000000ff,0x0000005e
	.word	0xa3561e6a,0x4ead84b8
	.word	0x64a1d6cb,0x339398c5
	.word	0x7daf2ca7,0xa924ff12
	.word	0x0000005a,0x00005a9b
	.word	0xfa8abe3f,0xc94fafea
p0_local6_expect:
	.word	0x0000ffff,0x3a2b0000
	.word	0xcbc0bdbb,0x00000082
	.word	0x00000071,0x00000000
	.word	0xfff0cd6b,0x6a1e56a3
	.word	0x935e0000,0xaa451ef5
	.word	0x034d8e45,0xffffffff
	.word	0xbbbdc0cb,0xf6809cc5
	.word	0x6b16c86c,0x00000000
p0_local6_sec_expect:
	.word	0x0000004d,0x0000ff00
	.word	0xff5a0000,0x5a000000
	.word	0x00000000,0xa6be57ff
	.word	0x00005aff,0x6bcdf0ff
	.word	0x4301c901,0x202421ba
	.word	0xffffffff,0x458e4d03
	.word	0x00000000,0x00000080
	.word	0x000000e0,0xffffffff
share0_expect:
	.word	0xa6ff4531,0x6ebe4a44
	.word	0xa9c301f3,0x3374e207
	.word	0x8780db2c,0x6f4e1e79
	.word	0xa111c3cf,0xc9f8fc88
	.word	0x86167903,0xdaac78e4
	.word	0x34c9fa4b,0x3b6e7be5
	.word	0x3d6a176c,0x93747e03
	.word	0x872ad270,0xe293e048
share1_expect:
	.word	0xff5e8841,0x247f7af9
	.word	0x829827b4,0x90b944e0
	.word	0x226e3183,0x76fd8c34
	.word	0x84ca28e0,0x7c061bca
	.word	0x3d65ffd2,0x0eeadb86
	.word	0x1e430e89,0xf3f9c50a
	.word	0xb6a6806d,0x50999ddc
	.word	0x91d4d1d0,0x82b0e9bf
	.word	0x00020070,0x1453c2a6
	.word	0x1ed6dfb9,0x8295f7c4
	.word	0xb8046aff,0x561620ee
	.word	0x9241a675,0x426273c2
	.word	0xb07ae247,0x102f2a25
	.word	0xdc1737d4,0xa3fb8a06
	.word	0x07d4163c,0x9c32be5e
	.word	0x666ca0a6,0x4650053e
share2_expect:
	.word	0xc0ff96d7,0xa23d825a
	.word	0x771ac4ea,0x228627cd
	.word	0x7583fad7,0xa7f707e8
	.word	0xfefc69b4,0x9a6a0793
	.word	0xa2242333,0x207a9dab
	.word	0xe98d2567,0xa388c4e8
	.word	0x50531273,0x17b3f8f1
	.word	0xd4a28764,0x9638f2af
share3_expect:
	.word	0xffff9cd4,0xe4c95a8c
	.word	0x501dabc8,0x8bbd8428
	.word	0x88c34454,0x9d57ff8b
	.word	0xb9c425db,0x6f30bd03
	.word	0xb9b21397,0x219b3ab5
	.word	0x7ccb03c0,0x3dc43822
	.word	0xadfa2983,0xbc6e808d
	.word	0xb6905be3,0x201fa403
	.word	0x47ffea86,0x7c6ff8d5
	.word	0xd87032c8,0x9211a7cd
	.word	0x42e1386e,0xa2f631a5
	.word	0xb524ff77,0x948334f7
	.word	0x39f38b18,0x32421d0c
	.word	0x5a340449,0x63bc742c
	.word	0xa6f9da42,0xc4c6d2d4
	.word	0xb990ae57,0xf10ab63c
	.word	0xffff4727,0x49892d8c
	.word	0xdcc4d4af,0x2b7fe16d
	.word	0x6118fd92,0xe2c24166
	.word	0xb82e2b7b,0x0ff12297
	.word	0x6eff0c49,0x3ce8486c
	.word	0xc7698792,0xd50f64bf
	.word	0x56e5e032,0x2f482e5a
	.word	0xaab17fab,0xc091ae07
	.word	0x2cff5589,0x2f4bf0c3
	.word	0xc3b53bec,0xf1256b16
	.word	0xa50aa222,0xb61bb027
	.word	0xcffdcafa,0xec524eb1
	.word	0xdc9f06c2,0x37b92f76
	.word	0xf5d725d6,0x98ea40a9
	.word	0x0a0b38e8,0xe96803f2
	.word	0x2874653b,0xb4b3c4a7
	.word	0x9e82458c,0x7e09c77c
	.word	0x87ebbc1a,0xf540df57
	.word	0xf69d540f,0x9f2456fa
	.word	0x807df8bd,0x959c45ac
	.word	0xf4f3dbc9,0x482940f3
	.word	0xe0059e77,0x39be52c8
	.word	0x985a7901,0xbe8d50b4
	.word	0x6b6e0ab3,0xd3bef700
	.word	0x19ff9645,0x1628bbb7
	.word	0x2772060f,0x40adb07b
	.word	0x629225cd,0xa83d2887
	.word	0xc23304e2,0xa609f989
	.word	0x403cae16,0xef0bc6cb
	.word	0x1a176af9,0x8e3fd6ed
	.word	0x8e8120cd,0x7e97d936
	.word	0xe2547ffc,0x56df383f
	.word	0x005f4833,0x7e5368a0
	.word	0xe178dcc5,0xb17a6800
	.word	0xdc665152,0xe5372adc
	.word	0x4f147eba,0x4d1086df
	.word	0xeaf714c1,0x5f0871fe
	.word	0xa7b6b11d,0x1b1b2b15
	.word	0x7299148d,0xf402174a
	.word	0x43639422,0x39a74e4b
	.word	0xb9985fa0,0x044d0e77
	.word	0xfba31d47,0x39bd12f7
	.word	0x02751b7e,0xb199efcd
	.word	0xd2650f58,0x28f0e9e9
	.word	0xcdf018d7,0xc23e0db4
	.word	0x5c5930f3,0x0f37693f
	.word	0x37587f56,0x6eb478a9
	.word	0x38f97e13,0xa952fbee
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
	.word	0xeeb06f67,0xf0218885
	.word	0x00000000,0x00000002
	.word	0xa4e3496f,0xa4efcfd8
	.word	0x00000000,0x00000003
	.word	0x5b67a6f7,0x8078b4c9
	.word	0x00000000,0x00000004
	.word	0x51191c28,0x0816c4eb
	.word	0x00000000,0x00000005
	.word	0xd73928df,0xda826899
	.word	0x00000000,0x00000006
	.word	0xed7d6680,0x03d00423
	.word	0x00000000,0x00000007
	.word	0x6b8f6cb0,0x596ba2ed
	.word	0x00000000,0x00000008
	.word	0xe90e4127,0xd27008f7
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
	.word	0xc2ca7554,0x34f54eb1,0x0a628eec,0x253f105b
	.word	0xc2cd0b17,0xb3368e12,0x5a9b2861,0x6acc6a68
	.word	0x95a26e69,0x1e41c7da,0xbf46c498,0xad1b2cef
	.word	0x46bfee48,0x4866ac9f,0xd5cc1c12,0x0653aaa6
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
	.word	0x633bff74,0x760c0900,0x6b9dfec5,0xf64a72b3
	.word	0x99c1e771,0x21a97586,0x724d8943,0xd6012d37
	.word	0x9bf3d6bd,0xf39849b5,0xfbfa5e08,0x07845edd
	.word	0xbddd11f0,0x0293180e,0x4b654f70,0x61b243c9
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
	.word	0xd6c8bdac,0xb711b964,0xbfad4125,0xe3de4ecd
	.word	0xf3d3e27c,0x66d69c89,0xca3c4fc2,0xc88d05cb
	.word	0xf3b38633,0xf83b6076,0x09b7bb66,0xd564900b
	.word	0xd7e9d98f,0xeb283c98,0x72fc3a4e,0x439b4544
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
	.word	0x01f0cd6b,0xb5383fcb,0xc3fc41c0,0xca19aa26
	.word	0xf30c4bcc,0xdeb30a5c,0xd3ecdbd1,0x1ba00b2f
	.word	0x353ee4a8,0xd675efff,0x4ef21338,0x464d0964
	.word	0xb17c5f23,0x536be766,0x478242fe,0x4453a10b
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
	.word	0xbb40e2f3,0x223ebaf9,0xba5bf46f,0x77e7dc0f
	.word	0x0c0433f0,0x22fb4faa,0xe31a7693,0x5e40dc05
	.word	0xfdddfdde,0xc2eb338a,0x55d9868e,0x73f99e3d
	.word	0x7816c52b,0x458e4d03,0x3825e7ae,0x71368f33
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
	.word	0x704ef0c5,0x580a6ff4,0x7296020d,0x7119b5cf
	.word	0x6ea4756f,0x48f5209e,0x7b3272f3,0x838b7c3e
	.word	0x3d0983c7,0x4c634a28,0x4b0a2836,0x4cb8c126
	.word	0x3cc90faa,0x969a60ac,0x0081ee38,0xfad17a7a
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
	.word	0x4e00100c,0xea23f0d1,0x4a697d72,0x1b21c956
	.word	0xeef0e63a,0xdd85f024,0xd1d6f9f7,0x89310ee0
	.word	0xf51e45aa,0x3cdf5e93,0x370418ce,0x9303f1e3
	.word	0x49aa13e3,0xfdd14e51,0xc159f3ce,0xe8603558
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
	.word	0x1abcca59,0xbd2c9db4,0xd6805e2a,0x3c9d31ce
	.word	0x6e10279f,0x88931d12,0x271f3cb5,0x5bf37755
	.word	0xba33ec5b,0x846f58e0,0x2f6eab03,0x071325e2
	.word	0xb7bbf852,0xe9d22342,0x6ec31e5e,0x801f66dc
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
	.word	0x47763c44,0x8e227543,0x32e0f5db,0x1b661252
	.word	0xabc4c424,0x4fcea632,0xf2ef7a97,0x31ccb6b8
	.word	0xe8c8f610,0x2898f93c,0xd68ff21c,0x56712eba
	.word	0xb6bfb931,0x72adcdd0,0x439f6a16,0x0518ba86
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
	.word	0xe0b83d5c,0xad2001a8,0x97617d3b,0x23996213
	.word	0x181936c0,0xa6be57b8,0xefe9154c,0xe4bd066a
	.word	0x4541d62a,0x48aa72b0,0x76c606c4,0x7321c655
	.word	0x0a2ea426,0x6a540284,0xf4810af1,0xc6e5f457
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
	.word	0x260a82b4,0x05979da6,0xe13ef95b,0x3188640f
	.word	0xb1ea407e,0xc3ea8252,0x8118aef9,0xbadc3547
	.word	0x634cbe62,0x7403a049,0xf8ffa1e2,0xa79b713b
	.word	0x7c79eee4,0x50f8bdc6,0x960b7cea,0x7680f324
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
	.word	0x49023efd,0xbdfb320e,0xfd038a43,0x0f0a0ad3
	.word	0x6754d0e6,0xe10e0beb,0x3c8c0be2,0x680c4ba2
	.word	0xfc3d938b,0xc47dd76b,0x636036ca,0x5a6a8f16
	.word	0xbd937c06,0x7e92ffc5,0x6b2c2b5a,0xb999dc8f
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
	.word	0x75009013,0x7dd18c90,0xcbc0bdbb,0x35b6ccf7
	.word	0x14d1e089,0x33331480,0x56f58c35,0xd214d6f1
	.word	0x5174c38e,0x9d7676ae,0xaf0372a3,0xd3be5ea7
	.word	0xc9805a01,0x62def21a,0xf6c29455,0x3e2a2212
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
	.word	0x3a5c0747,0x155f6a1e,0xf4c3cee6,0x0928c8a4
	.word	0xeb3fdf58,0xe3d8937b,0x4bca68e7,0xd24968ce
	.word	0x8054d5c9,0x8b722c4d,0xb60c3220,0xc5ae7a36
	.word	0xcb0fc841,0x2e48955c,0xf2a97b9a,0xe09db05f
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
	.word	0xaa3a4531,0x6ebe4a44,0xa9c301f3,0x3374e207
	.word	0x8780db2c,0x6f4e1e79,0xa111c3cf,0xc9f8fc88
	.word	0x86167903,0xdaac78e4,0x34c9fa4b,0x3b6e7be5
	.word	0x3d6a176c,0x93747e03,0x872ad270,0xe293e048
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
	.word	0x23268841,0x247f7af9,0x829827b4,0x90b944e0
	.word	0x226e3183,0x76fd8c34,0x84ca28e0,0x7c061bca
	.word	0x3d65ffd2,0x0eeadb86,0x1e430e89,0xf3f9c50a
	.word	0xb6a6806d,0x50999ddc,0x91d4d1d0,0x82b0e9bf
	.word	0x81040070,0x1453c2a6,0x1ed6dfb9,0x8295f7c4
	.word	0xb8046aff,0x561620ee,0x9241a675,0x426273c2
	.word	0xb07ae247,0x102f2a25,0xdc1737d4,0xa3fb8a06
	.word	0x07d4163c,0x9c32be5e,0x666ca0a6,0x4650053e
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
	.word	0xbec496d7,0xa23d825a,0x771ac4ea,0x228627cd
	.word	0x7583fad7,0xa7f707e8,0xfefc69b4,0x9a6a0793
	.word	0xa2242333,0x207a9dab,0xe98d2567,0xa388c4e8
	.word	0x50531273,0x17b3f8f1,0xd4a28764,0x9638f2af
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
	.word	0xd9df9cd4,0xe4c95a8c,0x501dabc8,0x8bbd8428
	.word	0x88c34454,0x9d57ff8b,0xb9c425db,0x6f30bd03
	.word	0xb9b21397,0x219b3ab5,0x7ccb03c0,0x3dc43822
	.word	0xadfa2983,0xbc6e808d,0xb6905be3,0x201fa403
	.word	0x81b6ea86,0x7c6ff8d5,0xd87032c8,0x9211a7cd
	.word	0x42e1386e,0xa2f631a5,0xb524ff77,0x948334f7
	.word	0x39f38b18,0x32421d0c,0x5a340449,0x63bc742c
	.word	0xa6f9da42,0xc4c6d2d4,0xb990ae57,0xf10ab63c
	.word	0xa0424727,0x49892d8c,0xdcc4d4af,0x2b7fe16d
	.word	0x6118fd92,0xe2c24166,0xb82e2b7b,0x0ff12297
	.word	0x6eff0c49,0x3ce8486c,0xc7698792,0xd50f64bf
	.word	0x56e5e032,0x2f482e5a,0xaab17fab,0xc091ae07
	.word	0x65f45589,0x2f4bf0c3,0xc3b53bec,0xf1256b16
	.word	0xa50aa222,0xb61bb027,0xcffdcafa,0xec524eb1
	.word	0xdc9f06c2,0x37b92f76,0xf5d725d6,0x98ea40a9
	.word	0x0a0b38e8,0xe96803f2,0x2874653b,0xb4b3c4a7
	.word	0x9e82458c,0x7e09c77c,0x87ebbc1a,0xf540df57
	.word	0xf69d540f,0x9f2456fa,0x807df8bd,0x959c45ac
	.word	0xf4f3dbc9,0x482940f3,0xe0059e77,0x39be52c8
	.word	0x985a7901,0xbe8d50b4,0x6b6e0ab3,0xd3bef700
	.word	0x19ea9645,0x1628bbb7,0x2772060f,0x40adb07b
	.word	0x629225cd,0xa83d2887,0xc23304e2,0xa609f989
	.word	0x403cae16,0xef0bc6cb,0x1a176af9,0x8e3fd6ed
	.word	0x8e8120cd,0x7e97d936,0xe2547ffc,0x56df383f
	.word	0x175f4833,0x7e5368a0,0xe178dcc5,0xb17a6800
	.word	0xdc665152,0xe5372adc,0x4f147eba,0x4d1086df
	.word	0xeaf714c1,0x5f0871fe,0xa7b6b11d,0x1b1b2b15
	.word	0x7299148d,0xf402174a,0x43639422,0x39a74e4b
	.word	0xb9985fa0,0x044d0e77,0xfba31d47,0x39bd12f7
	.word	0x02751b7e,0xb199efcd,0xd2650f58,0x28f0e9e9
	.word	0xcdf018d7,0xc23e0db4,0x5c5930f3,0x0f37693f
	.word	0x37587f56,0x6eb478a9,0x38f97e13,0xa952fbee
share3_end:
