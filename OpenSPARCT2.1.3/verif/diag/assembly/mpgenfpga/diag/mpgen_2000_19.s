/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_2000_19.s
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
!	Seed = 327144540
!	Riesling can be on
!	1 Thread, 2000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_2000_19.s created on Mar 27, 2009 (14:45:40)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_2000_19 -p 1 -l 2000

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
!	%f0  = e4177f3f 838536a2 6fab807d c6b962bf
!	%f4  = 0c705a4b 1c70bfc7 b536917a a67862fd
!	%f8  = e60e76e4 86539cf3 970eab3c b0156902
!	%f12 = 9dfb2b7a ada8585e 7b685ebe 65eb6ba0
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = cfff8fdd 0c7262e4 ef976459 e3b62637
!	%f20 = 9f6c3279 b473827d 3a4ab61d b0ede7b7
!	%f24 = 6de9520c ba4da1cf c7358fbb 3cbfd576
!	%f28 = 5147f3fe 90006e8d 02ac47ba a0ab81db
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = c479c131 035ea6f1 997a20e2 0b3856ee
!	%f36 = 5a55d1a6 9a849c8e aaab38e5 31f822e5
!	%f40 = 8d954c90 cce5153a 1c7bcbe6 72a140e1
!	%f44 = d95678e5 757d4881 9cc4d1dd 07818736
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x29f0e01700000046,%g7,%g1 ! GSR scale =  8, align = 6
	wr	%g1,%g0,%gsr		! GSR = 29f0e01700000046
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000030001408] = 73450ac9, %l4 = 17d9d00e8fb7db1f
	lduwa	[%i0+%o4]0x81,%l4	! %l4 = 0000000073450ac9
!	%f19 = e3b62637, Mem[00000000100c1400] = 5a221419
	sta	%f19,[%i3+%g0]0x88	! Mem[00000000100c1400] = e3b62637
!	%l6 = 43e4e0e0af28d251, Mem[0000000010101410] = d29820e9
	stba	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = d2982051
!	Mem[00000000100c1410] = 758891c0, %l6 = 43e4e0e0af28d251
	lduha	[%i3+%o5]0x88,%l6	! %l6 = 00000000000091c0
!	%l4 = 0000000073450ac9, Mem[0000000010101400] = 69017fba
	stba	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = c9017fba
!	Mem[0000000010081400] = c2c600e85ad5ba19, %f18 = ef976459 e3b62637
	ldda	[%i2+%g0]0x88,%f18	! %f18 = c2c600e8 5ad5ba19
!	%f26 = c7358fbb 3cbfd576, Mem[00000000100c1420] = 3e93679b faa60a6c
	stda	%f26,[%i3+0x020]%asi	! Mem[00000000100c1420] = c7358fbb 3cbfd576
!	Mem[0000000010001408] = 848428ce, %l1 = 2d6b213e4775f9fb
	ldsba	[%i0+%o4]0x88,%l1	! %l1 = ffffffffffffffce
!	Mem[00000000218000c0] = d723265e, %l2 = 734e1fba93b38c5a
	ldstub	[%o3+0x0c0],%l2		! %l2 = 000000d7000000ff
!	Starting 10 instruction Store Burst
!	%f13 = ada8585e, %f17 = 0c7262e4, %f31 = a0ab81db
	fsubs	%f13,%f17,%f31		! %f31 = ada8585e

p0_label_2:
!	%l4 = 0000000073450ac9, Mem[0000000010141410] = 020e0517
	stwa	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 73450ac9
!	%l0 = 4927f6424c7c5536, Mem[0000000030081410] = 8c011eab
	stba	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 8c011e36
!	Mem[0000000030081410] = 361e018c, %l1 = ffffffffffffffce
	swapa	[%i2+%o5]0x81,%l1	! %l1 = 00000000361e018c
!	%l3 = d56aa3cc96b3ebd2, Mem[0000000010041408] = 865bd0df
	stba	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = d25bd0df
!	Mem[00000000300c1410] = 7faebc45, %l2 = 00000000000000d7
	ldstuba	[%i3+%o5]0x89,%l2	! %l2 = 00000045000000ff
!	%f2  = 6fab807d, Mem[0000000030181400] = a32f9f40
	sta	%f2 ,[%i6+%g0]0x81	! Mem[0000000030181400] = 6fab807d
!	%f3  = c6b962bf, Mem[0000000010181408] = 6ea84ae7
	st	%f3 ,[%i6+%o4]		! Mem[0000000010181408] = c6b962bf
!	%l6 = 00000000000091c0, Mem[00000000100c1408] = 798544978e38a587, %asi = 80
	stxa	%l6,[%i3+0x008]%asi	! Mem[00000000100c1408] = 00000000000091c0
!	Mem[00000000218001c0] = 338b4083, %l0 = 4927f6424c7c5536
	ldstuba	[%o3+0x1c0]%asi,%l0	! %l0 = 00000033000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 5b0d5c3d, %l0 = 0000000000000033
	lduha	[%i1+0x012]%asi,%l0	! %l0 = 0000000000005c3d

p0_label_3:
!	Mem[0000000010081410] = 58b8807a, %l6 = 00000000000091c0
	ldsba	[%i2+%o5]0x80,%l6	! %l6 = 0000000000000058
!	Mem[00000000100c1400] = 3726b6e3, %l6 = 0000000000000058
	lduwa	[%i3+%g0]0x80,%l6	! %l6 = 000000003726b6e3
!	Mem[0000000010001408] = 848428ce, %l4 = 0000000073450ac9
	ldswa	[%i0+%o4]0x88,%l4	! %l4 = ffffffff848428ce
!	Mem[0000000030081408] = 09deefe5, %l2 = 0000000000000045
	lduba	[%i2+%o4]0x89,%l2	! %l2 = 00000000000000e5
!	Mem[0000000010081408] = 9ef72440, %l5 = 6d6e8968f04f6e1f
	lduwa	[%i2+%o4]0x88,%l5	! %l5 = 000000009ef72440
!	Mem[0000000030081410] = ffffffce, %l2 = 00000000000000e5
	lduwa	[%i2+%o5]0x81,%l2	! %l2 = 00000000ffffffce
!	Mem[0000000010081408] = 4024f79e42e7da7a, %f18 = c2c600e8 5ad5ba19
	ldda	[%i2+%o4]0x80,%f18	! %f18 = 4024f79e 42e7da7a
!	Mem[0000000030081408] = e5efde09b8900102, %f30 = 02ac47ba ada8585e
	ldda	[%i2+%o4]0x81,%f30	! %f30 = e5efde09 b8900102
!	Mem[0000000030181410] = 640b0441, %l4 = ffffffff848428ce
	lduha	[%i6+%o5]0x81,%l4	! %l4 = 000000000000640b
!	Starting 10 instruction Store Burst
!	%l5 = 000000009ef72440, Mem[00000000100c1420] = c7358fbb, %asi = 80
	stwa	%l5,[%i3+0x020]%asi	! Mem[00000000100c1420] = 9ef72440

p0_label_4:
!	%l0 = 0000000000005c3d, Mem[0000000021800080] = 9ac6341e, %asi = 80
	stha	%l0,[%o3+0x080]%asi	! Mem[0000000021800080] = 5c3d341e
!	%f23 = b0ede7b7, Mem[0000000030001408] = 73450ac9
	sta	%f23,[%i0+%o4]0x81	! Mem[0000000030001408] = b0ede7b7
!	Mem[00000000100c142c] = d2077973, %l0 = 00005c3d, %l7 = f85517ec
	add	%i3,0x2c,%g1
	casa	[%g1]0x80,%l0,%l7	! %l7 = 00000000d2077973
!	Mem[00000000300c1400] = 620188ba, %l0 = 0000000000005c3d
	swapa	[%i3+%g0]0x81,%l0	! %l0 = 00000000620188ba
!	Mem[0000000010181420] = abcc1f9a820dbce1, %l1 = 00000000361e018c, %l6 = 000000003726b6e3
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l1,%l6	! %l6 = abcc1f9a820dbce1
!	Mem[0000000010101420] = aca1a5305f45a09f, %l2 = 00000000ffffffce, %l4 = 000000000000640b
	add	%i4,0x20,%g1
	casxa	[%g1]0x80,%l2,%l4	! %l4 = aca1a5305f45a09f
!	Mem[0000000010001408] = ce288484, %l1 = 00000000361e018c
	ldstuba	[%i0+%o4]0x80,%l1	! %l1 = 000000ce000000ff
!	%l7 = 00000000d2077973, Mem[0000000010101408] = a5904d67b9a19d9a
	stx	%l7,[%i4+%o4]		! Mem[0000000010101408] = 00000000d2077973
!	Mem[0000000010181408] = c6b962bf, %l5 = 000000009ef72440
	ldstuba	[%i6+%o4]0x80,%l5	! %l5 = 000000c6000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 2137e0b3943a0fb4, %f4  = 0c705a4b 1c70bfc7
	ldda	[%i5+%g0]0x88,%f4 	! %f4  = 2137e0b3 943a0fb4

p0_label_5:
!	%l0 = 00000000620188ba, %l7 = 00000000d2077973, %l5 = 00000000000000c6
	addc	%l0,%l7,%l5		! %l5 = 000000013409022d
!	Mem[0000000030181400] = 7d80ab6f, %l5 = 000000013409022d
	ldsba	[%i6+%g0]0x89,%l5	! %l5 = 000000000000006f
!	Mem[00000000300c1410] = ffbcae7f, %l4 = aca1a5305f45a09f
	ldsha	[%i3+%o5]0x81,%l4	! %l4 = ffffffffffffffbc
!	Mem[0000000030081400] = 4daed7ce, %l4 = ffffffffffffffbc
	ldsha	[%i2+%g0]0x89,%l4	! %l4 = ffffffffffffd7ce
!	Mem[0000000010081410] = 7a80b858, %l7 = 00000000d2077973
	ldswa	[%i2+%o5]0x88,%l7	! %l7 = 000000007a80b858
!	Mem[0000000010181400] = ffbe6af713992882, %l5 = 000000000000006f
	ldxa	[%i6+%g0]0x80,%l5	! %l5 = ffbe6af713992882
!	Mem[0000000030141408] = fc80b5d3, %l0 = 00000000620188ba
	ldsha	[%i5+%o4]0x81,%l0	! %l0 = fffffffffffffc80
!	Mem[0000000030181408] = 67068aa3, %l6 = abcc1f9a820dbce1
	ldsha	[%i6+%o4]0x81,%l6	! %l6 = 0000000000006706
!	Mem[0000000030081410] = ceffffff, %l4 = ffffffffffffd7ce
	ldsha	[%i2+%o5]0x89,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l2 = ffffffce, %l3 = 96b3ebd2, Mem[0000000030041408] = dff8e741 16be4b3e
	stda	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffce 96b3ebd2

p0_label_6:
!	Mem[0000000010081403] = 19bad55a, %l6 = 0000000000006706
	ldstub	[%i2+0x003],%l6		! %l6 = 0000005a000000ff
!	%l5 = ffbe6af713992882, Mem[0000000010041410] = 5b0d5c3d
	stha	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = 28825c3d
!	Mem[00000000211c0000] = f0197241, %l7 = 000000007a80b858
	ldstuba	[%o2+0x000]%asi,%l7	! %l7 = 000000f0000000ff
!	%f23 = b0ede7b7, Mem[0000000010101408] = 00000000
	sta	%f23,[%i4+%o4]0x80	! Mem[0000000010101408] = b0ede7b7
!	%l6 = 000000000000005a, Mem[000000001008143e] = 259ce085, %asi = 80
	stha	%l6,[%i2+0x03e]%asi	! Mem[000000001008143c] = 259c005a
!	%l2 = 00000000ffffffce, Mem[0000000010181428] = 23025c56
	sth	%l2,[%i6+0x028]		! Mem[0000000010181428] = ffce5c56
!	Mem[0000000030101410] = 2b2600da, %l3 = d56aa3cc96b3ebd2
	ldstuba	[%i4+%o5]0x89,%l3	! %l3 = 000000da000000ff
!	%l6 = 000000000000005a, Mem[0000000010041400] = 3a1cd926
	stha	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 005ad926
!	%f30 = e5efde09 b8900102, Mem[00000000300c1408] = 61bf5655 927837f5
	stda	%f30,[%i3+%o4]0x81	! Mem[00000000300c1408] = e5efde09 b8900102
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 3726b6e3b10554ae, %l1 = 00000000000000ce
	ldxa	[%i3+%g0]0x80,%l1	! %l1 = 3726b6e3b10554ae

p0_label_7:
!	Mem[00000000100c1408] = 00000000, %l7 = 00000000000000f0
	ldswa	[%i3+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041400] = 7fde5004, %l6 = 000000000000005a
	ldsba	[%i1+%g0]0x89,%l6	! %l6 = 0000000000000004
!	Mem[0000000010041420] = 38f8ca5c, %l6 = 0000000000000004
	ldub	[%i1+0x021],%l6		! %l6 = 00000000000000f8
!	Mem[0000000010041418] = 2aeb61d1, %l1 = 3726b6e3b10554ae
	ldsb	[%i1+0x019],%l1		! %l1 = ffffffffffffffeb
!	Mem[00000000100c1400] = e3b62637, %l5 = ffbe6af713992882
	lduwa	[%i3+%g0]0x88,%l5	! %l5 = 00000000e3b62637
!	Mem[00000000300c1410] = ffbcae7f, %l0 = fffffffffffffc80
	ldswa	[%i3+%o5]0x81,%l0	! %l0 = ffffffffffbcae7f
!	Mem[0000000030181408] = a38a0667, %l1 = ffffffffffffffeb
	ldswa	[%i6+%o4]0x89,%l1	! %l1 = ffffffffa38a0667
!	Mem[00000000300c1408] = 09deefe5, %f0  = e4177f3f
	lda	[%i3+%o4]0x89,%f0 	! %f0 = 09deefe5
!	Mem[0000000010081434] = b6a6bb80, %l0 = ffffffffffbcae7f
	lduwa	[%i2+0x034]%asi,%l0	! %l0 = 00000000b6a6bb80
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffffff, immed = fffff2d5, %y  = 00000000
	umul	%l4,-0xd2b,%l2		! %l2 = fffff2d400000d2b, %y = fffff2d4

p0_label_8:
!	Mem[00000000300c1408] = 09deefe5, %l1 = ffffffffa38a0667
	swapa	[%i3+%o4]0x89,%l1	! %l1 = 0000000009deefe5
!	Mem[0000000010101438] = 9a393680, %l1 = 0000000009deefe5
	swap	[%i4+0x038],%l1		! %l1 = 000000009a393680
!	Mem[0000000030181400] = 7d80ab6f, %l7 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 0000006f000000ff
!	%l7 = 000000000000006f, Mem[0000000010101436] = 214d8b0d
	sth	%l7,[%i4+0x036]		! Mem[0000000010101434] = 214d006f
!	%l4 = ffffffffffffffff, Mem[0000000010081430] = ed76e51e, %asi = 80
	stwa	%l4,[%i2+0x030]%asi	! Mem[0000000010081430] = ffffffff
!	Mem[0000000010181423] = abcc1f9a, %l7 = 000000000000006f
	ldstub	[%i6+0x023],%l7		! %l7 = 0000009a000000ff
!	%l5 = 00000000e3b62637, Mem[0000000010081408] = 7adae7429ef72440
	stxa	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000e3b62637
!	%f12 = 9dfb2b7a ada8585e, Mem[0000000030101410] = ff00262b abd5f314
	stda	%f12,[%i4+%o5]0x81	! Mem[0000000030101410] = 9dfb2b7a ada8585e
!	%l2 = fffff2d400000d2b, Mem[0000000030041408] = d2ebb396ceffffff
	stxa	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = fffff2d400000d2b
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 19867ab4, %l5 = 00000000e3b62637
	ldswa	[%i1+%o5]0x89,%l5	! %l5 = 0000000019867ab4

p0_label_9:
!	Mem[0000000010001408] = ff288484, %l3 = 00000000000000da
	ldsha	[%i0+%o4]0x80,%l3	! %l3 = ffffffffffffff28
!	Mem[0000000030181400] = ffab807d02281002, %l5 = 0000000019867ab4
	ldxa	[%i6+%g0]0x81,%l5	! %l5 = ffab807d02281002
!	Mem[0000000010041410] = 28825c3db384d5fb, %l7 = 000000000000009a
	ldxa	[%i1+%o5]0x80,%l7	! %l7 = 28825c3db384d5fb
!	Mem[00000000211c0000] = ff197241, %l0 = 00000000b6a6bb80
	ldub	[%o2+0x001],%l0		! %l0 = 0000000000000019
!	Mem[00000000100c1400] = 3726b6e3, %l5 = ffab807d02281002
	lduba	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000037
!	Mem[0000000030181408] = 379e65c8a38a0667, %f18 = 4024f79e 42e7da7a
	ldda	[%i6+%o4]0x89,%f18	! %f18 = 379e65c8 a38a0667
!	Mem[0000000030081400] = 4daed7ce, %l7 = 28825c3db384d5fb
	ldswa	[%i2+%g0]0x89,%l7	! %l7 = 000000004daed7ce
!	Mem[0000000020800000] = 635ed75b, %l0 = 0000000000000019
	lduha	[%o1+0x000]%asi,%l0	! %l0 = 000000000000635e
!	Mem[0000000010001410] = 3c51ef3f 8423010e, %l0 = 0000635e, %l1 = 9a393680
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 000000003c51ef3f 000000008423010e
!	Starting 10 instruction Store Burst
!	%l2 = fffff2d400000d2b, Mem[0000000030001400] = 6d1fb2f0
	stba	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 6d1fb22b

p0_label_10:
!	%l7 = 000000004daed7ce, Mem[0000000010041410] = 28825c3d
	stha	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = d7ce5c3d
!	Mem[0000000030101400] = 9ade07a8, %l3 = ffffffffffffff28
	swapa	[%i4+%g0]0x89,%l3	! %l3 = 000000009ade07a8
!	%f12 = 9dfb2b7a ada8585e, Mem[0000000030001400] = 6d1fb22b 7aabf23c
	stda	%f12,[%i0+%g0]0x89	! Mem[0000000030001400] = 9dfb2b7a ada8585e
!	%f6  = b536917a a67862fd, %l2 = fffff2d400000d2b
!	Mem[0000000010101418] = b1cc2b7c4927e079
	add	%i4,0x018,%g1
	stda	%f6,[%g1+%l2]ASI_PST16_P ! Mem[0000000010101418] = b5362b7ca67862fd
!	%l0 = 000000003c51ef3f, Mem[0000000010081400] = 19bad5ff
	stba	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 3fbad5ff
!	%f22 = 3a4ab61d b0ede7b7, Mem[0000000010041408] = d25bd0df 59f94df8
	stda	%f22,[%i1+%o4]0x80	! Mem[0000000010041408] = 3a4ab61d b0ede7b7
!	%f22 = 3a4ab61d b0ede7b7, Mem[0000000030141400] = c709ad77 df3e68ed
	stda	%f22,[%i5+%g0]0x89	! Mem[0000000030141400] = 3a4ab61d b0ede7b7
!	%l6 = 00000000000000f8, Mem[0000000010141408] = 5b2e54b3426194e2
	stxa	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000000000f8
!	%f15 = 65eb6ba0, Mem[00000000300c1400] = 00005c3d
	sta	%f15,[%i3+%g0]0x81	! Mem[00000000300c1400] = 65eb6ba0
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 758891c0, %l3 = 000000009ade07a8
	ldsha	[%i3+%o5]0x88,%l3	! %l3 = ffffffffffff91c0

p0_label_11:
!	Mem[0000000030141410] = f6ad9eca 29543d28, %l4 = ffffffff, %l5 = 00000037
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 0000000029543d28 00000000f6ad9eca
!	Mem[0000000010041400] = 26d95a00, %l4 = 0000000029543d28
	lduwa	[%i1+%g0]0x88,%l4	! %l4 = 0000000026d95a00
!	Mem[0000000030101410] = 7a2bfb9d, %l2 = fffff2d400000d2b
	lduwa	[%i4+%o5]0x89,%l2	! %l2 = 000000007a2bfb9d
!	Mem[0000000010041410] = fbd584b3 3d5cced7, %l0 = 3c51ef3f, %l1 = 8423010e
	ldda	[%i1+%o5]0x88,%l0	! %l0 = 000000003d5cced7 00000000fbd584b3
!	Mem[0000000030181408] = 379e65c8a38a0667, %l7 = 000000004daed7ce
	ldxa	[%i6+%o4]0x89,%l7	! %l7 = 379e65c8a38a0667
!	Mem[0000000030181408] = a38a0667, %l7 = 379e65c8a38a0667
	lduwa	[%i6+%o4]0x89,%l7	! %l7 = 00000000a38a0667
!	Mem[0000000010001408] = 848428ff, %f7  = a67862fd
	lda	[%i0+%o4]0x88,%f7 	! %f7 = 848428ff
!	Mem[0000000030141400] = b7e7edb0, %l1 = 00000000fbd584b3
	lduba	[%i5+%g0]0x81,%l1	! %l1 = 00000000000000b7
!	Mem[0000000030141408] = fc80b5d3b9c22738, %f18 = 379e65c8 a38a0667
	ldda	[%i5+%o4]0x81,%f18	! %f18 = fc80b5d3 b9c22738
!	Starting 10 instruction Store Burst
!	%f20 = 9f6c3279, Mem[0000000010001408] = 848428ff
	sta	%f20,[%i0+%o4]0x88	! Mem[0000000010001408] = 9f6c3279

p0_label_12:
!	%f20 = 9f6c3279 b473827d, Mem[0000000010101400] = c9017fba 37e67f33
	stda	%f20,[%i4+0x000]%asi	! Mem[0000000010101400] = 9f6c3279 b473827d
!	%l5 = 00000000f6ad9eca, Mem[0000000030001408] = b7e7edb0
	stwa	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = f6ad9eca
!	%l3 = ffffffffffff91c0, Mem[00000000211c0000] = ff197241
	stb	%l3,[%o2+%g0]		! Mem[00000000211c0000] = c0197241
!	%l6 = 00000000000000f8, Mem[00000000100c1408] = c091000000000000
	stxa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000000000f8
!	Mem[0000000010181427] = 820dbce1, %l0 = 000000003d5cced7
	ldstuba	[%i6+0x027]%asi,%l0	! %l0 = 000000e1000000ff
!	%l0 = 00000000000000e1, Mem[0000000010081430] = ffffffff, %asi = 80
	stwa	%l0,[%i2+0x030]%asi	! Mem[0000000010081430] = 000000e1
!	Code Fragment 4
p0_fragment_1:
!	%l0 = 00000000000000e1
	setx	0x9f07b66fc0de6f76,%g7,%l0 ! %l0 = 9f07b66fc0de6f76
!	%l1 = 00000000000000b7
	setx	0x391d7c6865bd56ea,%g7,%l1 ! %l1 = 391d7c6865bd56ea
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9f07b66fc0de6f76
	setx	0xfa5ee5506f22ca95,%g7,%l0 ! %l0 = fa5ee5506f22ca95
!	%l1 = 391d7c6865bd56ea
	setx	0xe87ed3efcd145188,%g7,%l1 ! %l1 = e87ed3efcd145188
!	Mem[0000000030101400] = ffffff28, %l1 = e87ed3efcd145188
	ldstuba	[%i4+%g0]0x89,%l1	! %l1 = 00000028000000ff
!	%l6 = 00000000000000f8, Mem[0000000020800040] = 210ca3d2
	sth	%l6,[%o1+0x040]		! Mem[0000000020800040] = 00f8a3d2
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = e5efde09, %l4 = 0000000026d95a00
	ldsba	[%i2+%o4]0x81,%l4	! %l4 = ffffffffffffffe5

p0_label_13:
!	%l7 = 00000000a38a0667, Mem[0000000010081400] = ffd5ba3f
	stwa	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = a38a0667
!	Mem[0000000010101410] = 512098d242ad2f47, %f2  = 6fab807d c6b962bf
	ldda	[%i4+%o5]0x80,%f2 	! %f2  = 512098d2 42ad2f47
!	Mem[0000000030101400] = ffffffff, %l1 = 0000000000000028
	lduba	[%i4+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101410] = 5e58a8ad 7a2bfb9d, %l2 = 7a2bfb9d, %l3 = ffff91c0
	ldda	[%i4+%o5]0x89,%l2	! %l2 = 000000007a2bfb9d 000000005e58a8ad
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010041400] = 005ad926 fc7c94ea 3a4ab61d b0ede7b7
!	Mem[0000000010041410] = d7ce5c3d b384d5fb 2aeb61d1 c76395e5
!	Mem[0000000010041420] = 38f8ca5c 111980a4 bbe96d59 ac77cded
!	Mem[0000000010041430] = a1a4d897 287a77a0 86aa285f 52c6a55a
	ldda	[%i1]ASI_BLK_P,%f0	! Block Load from 0000000010041400
!	Mem[00000000300c1408] = 67068aa3, %l5 = 00000000f6ad9eca
	ldswa	[%i3+%o4]0x81,%l5	! %l5 = 0000000067068aa3
!	Mem[0000000030041400] = 0450de7f408fe455, %l7 = 00000000a38a0667
	ldxa	[%i1+%g0]0x81,%l7	! %l7 = 0450de7f408fe455
!	Mem[0000000010141438] = bb48fd0c, %l5 = 0000000067068aa3
	ldsba	[%i5+0x038]%asi,%l5	! %l5 = ffffffffffffffbb
!	Mem[0000000010081408] = 00000000e3b62637, %f30 = e5efde09 b8900102
	ldda	[%i2+%o4]0x88,%f30	! %f30 = 00000000 e3b62637
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 73450ac9, %l7 = 0450de7f408fe455
	ldstuba	[%i5+%o5]0x80,%l7	! %l7 = 00000073000000ff

p0_label_14:
!	%l2 = 000000007a2bfb9d, Mem[0000000010181410] = 87d49668
	stba	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 9dd49668
!	%l3 = 000000005e58a8ad, Mem[000000001008140d] = 00000000
	stb	%l3,[%i2+0x00d]		! Mem[000000001008140c] = 00ad0000
!	Mem[0000000030141408] = d3b580fc, %l1 = 00000000000000ff
	swapa	[%i5+%o4]0x89,%l1	! %l1 = 00000000d3b580fc
!	Mem[0000000030141400] = b0ede7b7, %l3 = 000000005e58a8ad
	ldstuba	[%i5+%g0]0x89,%l3	! %l3 = 000000b7000000ff
!	%f24 = 6de9520c ba4da1cf, %l6 = 00000000000000f8
!	Mem[0000000010081438] = 154b1ac0259c005a
	add	%i2,0x038,%g1
	stda	%f24,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010081438] = 154b1ac0259c005a
!	%l1 = 00000000d3b580fc, Mem[00000000300c1410] = ffbcae7f2604eced
	stxa	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000d3b580fc
!	%f18 = fc80b5d3 b9c22738, Mem[0000000010181428] = ffce5c56 d62e5acf
	std	%f18,[%i6+0x028]	! Mem[0000000010181428] = fc80b5d3 b9c22738
!	%f18 = fc80b5d3 b9c22738, Mem[0000000030181400] = 7d80abff 02102802
	stda	%f18,[%i6+%g0]0x89	! Mem[0000000030181400] = fc80b5d3 b9c22738
!	%f19 = b9c22738, Mem[0000000010001438] = 64ea4425
	st	%f19,[%i0+0x038]	! Mem[0000000010001438] = b9c22738
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 79326c9f, %l2 = 000000007a2bfb9d
	lduwa	[%i4+%g0]0x88,%l2	! %l2 = 0000000079326c9f

p0_label_15:
!	Mem[0000000010001410] = 3c51ef3f, %f23 = b0ede7b7
	lda	[%i0+%o5]0x80,%f23	! %f23 = 3c51ef3f
!	Mem[00000000300c1400] = 65eb6ba0, %l7 = 0000000000000073
	ldsba	[%i3+%g0]0x81,%l7	! %l7 = 0000000000000065
!	Mem[0000000010101408] = b7e7edb0, %l1 = 00000000d3b580fc
	lduha	[%i4+%o4]0x88,%l1	! %l1 = 000000000000edb0
!	%f28 = 5147f3fe, %f28 = 5147f3fe, %f28 = 5147f3fe 90006e8d
	fsmuld	%f28,%f28,%f28		! %f28 = 446385a7 ae060080
!	Mem[0000000010101400] = 7d8273b4 79326c9f, %l6 = 000000f8, %l7 = 00000065
	ldda	[%i4+%g0]0x88,%l6	! %l6 = 0000000079326c9f 000000007d8273b4
!	Mem[0000000010141404] = b3e03721, %l6 = 0000000079326c9f
	lduw	[%i5+0x004],%l6		! %l6 = 00000000b3e03721
!	Mem[0000000010181410] = 6896d49d, %l2 = 0000000079326c9f
	ldswa	[%i6+%o5]0x88,%l2	! %l2 = 000000006896d49d
!	Mem[0000000020800000] = 635ed75b, %l1 = 000000000000edb0
	ldsba	[%o1+0x000]%asi,%l1	! %l1 = 0000000000000063
!	Mem[0000000010101400] = 9f6c3279, %f18 = fc80b5d3
	lda	[%i4+%g0]0x80,%f18	! %f18 = 9f6c3279
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000b7, Mem[0000000030141408] = 000000ff
	stba	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000b7

p0_label_16:
!	Mem[0000000030101410] = 7a2bfb9d, %l1 = 0000000000000063
	ldstuba	[%i4+%o5]0x89,%l1	! %l1 = 0000009d000000ff
!	%f24 = 6de9520c ba4da1cf, Mem[0000000010001430] = e39959bb 4f15a5f1
	std	%f24,[%i0+0x030]	! Mem[0000000010001430] = 6de9520c ba4da1cf
!	Mem[0000000030041410] = 19867ab4, %l4 = ffffffffffffffe5
	swapa	[%i1+%o5]0x89,%l4	! %l4 = 0000000019867ab4
!	Mem[00000000211c0001] = c0197241, %l0 = fa5ee5506f22ca95
	ldstub	[%o2+0x001],%l0		! %l0 = 00000019000000ff
!	%l3 = 00000000000000b7, Mem[00000000100c1408] = f800000000000000, %asi = 80
	stxa	%l3,[%i3+0x008]%asi	! Mem[00000000100c1408] = 00000000000000b7
!	Mem[0000000030181410] = 640b0441, %l5 = ffffffffffffffbb
	ldstuba	[%i6+%o5]0x81,%l5	! %l5 = 00000064000000ff
	membar	#Sync			! Added by membar checker (2)
!	%l0 = 0000000000000019, Mem[000000001004140a] = 3a4ab61d
	sth	%l0,[%i1+0x00a]		! Mem[0000000010041408] = 3a4a0019
!	%f24 = 6de9520c ba4da1cf, %l0 = 0000000000000019
!	Mem[0000000030001430] = 47b58f7039d2cc57
	add	%i0,0x030,%g1
	stda	%f24,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030001430] = cfa18f7039d2e96d
!	%f14 = 86aa285f 52c6a55a, Mem[0000000010081410] = 7a80b858 a159b482
	stda	%f14,[%i2+%o5]0x88	! Mem[0000000010081410] = 86aa285f 52c6a55a
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = 635ed75b, %l5 = 0000000000000064
	ldsba	[%o1+0x000]%asi,%l5	! %l5 = 0000000000000063

p0_label_17:
!	Mem[00000000201c0000] = fe2c2cc7, %l0 = 0000000000000019
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = fffffffffffffe2c
!	Mem[00000000100c1420] = 9ef72440, %l2 = 000000006896d49d
	ldsba	[%i3+0x020]%asi,%l2	! %l2 = ffffffffffffff9e
!	%f9  = 111980a4, %f10 = bbe96d59, %f29 = ae060080
	fsubs	%f9 ,%f10,%f29		! %f29 = 3be96d59
!	Mem[0000000010101410] = d2982051, %l0 = fffffffffffffe2c
	ldsha	[%i4+%o5]0x88,%l0	! %l0 = 0000000000002051
!	Mem[0000000010041410] = d7ce5c3d, %l5 = 0000000000000063
	ldsha	[%i1+%o5]0x80,%l5	! %l5 = ffffffffffffd7ce
!	Mem[0000000030181408] = 67068aa3, %l7 = 000000007d8273b4
	ldsha	[%i6+%o4]0x81,%l7	! %l7 = 0000000000006706
!	Mem[0000000010141400] = 943a0fb4, %l6 = 00000000b3e03721
	lduwa	[%i5+%g0]0x88,%l6	! %l6 = 00000000943a0fb4
!	Mem[0000000030081400] = ced7ae4d, %l2 = ffffffffffffff9e
	ldswa	[%i2+%g0]0x81,%l2	! %l2 = ffffffffced7ae4d
!	Mem[0000000010101424] = 5f45a09f, %l7 = 0000000000006706
	lduba	[%i4+0x026]%asi,%l7	! %l7 = 00000000000000a0
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffd7ce, Mem[0000000030181410] = 41040bff
	stba	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = 41040bce

p0_label_18:
!	%l4 = 19867ab4, %l5 = ffffd7ce, Mem[00000000100c1408] = 00000000 b7000000
	stda	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 19867ab4 ffffd7ce
!	%l7 = 00000000000000a0, Mem[0000000030081410] = ffffffce
	stba	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = a0ffffce
!	Mem[00000000100c1408] = 19867ab4, %l7 = 00000000000000a0
	swapa	[%i3+%o4]0x88,%l7	! %l7 = 0000000019867ab4
!	Mem[0000000010081408] = e3b62637, %l1 = 000000000000009d
	ldstuba	[%i2+%o4]0x88,%l1	! %l1 = 00000037000000ff
!	%l1 = 0000000000000037, Mem[00000000100c1400] = 3726b6e3b10554ae
	stxa	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000000000000037
!	%l4 = 19867ab4, %l5 = ffffd7ce, Mem[0000000030181408] = a38a0667 379e65c8
	stda	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 19867ab4 ffffd7ce
!	%l6 = 00000000943a0fb4, Mem[0000000010181420] = abcc1fff, %asi = 80
	stha	%l6,[%i6+0x020]%asi	! Mem[0000000010181420] = 0fb41fff
!	Mem[00000000100c1400] = 00000000, %l2 = ffffffffced7ae4d
	swapa	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%l0 = 0000000000002051, Mem[00000000100c1400] = 4daed7ce
	stba	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 4daed751
!	Starting 10 instruction Load Burst
!	Mem[00000000218000c0] = ff23265e, %l6 = 00000000943a0fb4
	lduha	[%o3+0x0c0]%asi,%l6	! %l6 = 000000000000ff23

p0_label_19:
!	Mem[0000000030141400] = ffe7edb0, %f29 = 3be96d59
	lda	[%i5+%g0]0x81,%f29	! %f29 = ffe7edb0
!	Mem[0000000010041408] = b7e7edb019004a3a, %l7 = 0000000019867ab4
	ldxa	[%i1+%o4]0x88,%l7	! %l7 = b7e7edb019004a3a
!	Mem[0000000010041400] = 005ad926, %l3 = 00000000000000b7
	ldswa	[%i1+%g0]0x80,%l3	! %l3 = 00000000005ad926
!	Mem[0000000020800040] = 00f8a3d2, %l2 = 0000000000000000
	ldsha	[%o1+0x040]%asi,%l2	! %l2 = 00000000000000f8
!	Mem[00000000201c0000] = fe2c2cc7, %l2 = 00000000000000f8
	ldsh	[%o0+%g0],%l2		! %l2 = fffffffffffffe2c
!	Mem[0000000010141410] = ff450ac97860bbb6, %l0 = 0000000000002051
	ldxa	[%i5+%o5]0x80,%l0	! %l0 = ff450ac97860bbb6
!	Mem[0000000030141410] = 283d5429ca9eadf6, %l1 = 0000000000000037
	ldxa	[%i5+%o5]0x81,%l1	! %l1 = 283d5429ca9eadf6
!	Mem[0000000030101410] = 5e58a8ad7a2bfbff, %l6 = 000000000000ff23
	ldxa	[%i4+%o5]0x89,%l6	! %l6 = 5e58a8ad7a2bfbff
!	Mem[00000000100c1434] = 4940b0a1, %l6 = 5e58a8ad7a2bfbff
	ldub	[%i3+0x035],%l6		! %l6 = 0000000000000040
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000040, %l6 = 0000000000000040, %y  = fffff2d4
	udiv	%l6,%l6,%l7		! %l7 = 00000000ffffffff
	mov	%l0,%y			! %y = 7860bbb6

p0_label_20:
!	%f13 = 287a77a0, Mem[0000000030101400] = ffffffff
	sta	%f13,[%i4+%g0]0x81	! Mem[0000000030101400] = 287a77a0
!	%l4 = 0000000019867ab4, Mem[0000000010101400] = 9f6c3279
	stha	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 7ab43279
!	%f30 = 00000000 e3b62637, Mem[0000000030101400] = 287a77a0 9946ee8a
	stda	%f30,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000 e3b62637
!	Mem[00000000211c0000] = c0ff7241, %l5 = ffffffffffffd7ce
	ldstub	[%o2+%g0],%l5		! %l5 = 000000c0000000ff
!	%f8  = 38f8ca5c 111980a4, %l5 = 00000000000000c0
!	Mem[00000000100c1428] = 54707eb1d2077973
	add	%i3,0x028,%g1
	stda	%f8,[%g1+%l5]ASI_PST16_P ! Mem[00000000100c1428] = 54707eb1d2077973
!	%f5  = b384d5fb, %f30 = 00000000, %f21 = b473827d
	fadds	%f5 ,%f30,%f21		! %f21 = b384d5fb
!	%l2 = fffffffffffffe2c, Mem[0000000030001408] = ca9eadf6
	stwa	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = fffffe2c
!	%l1 = 283d5429ca9eadf6, Mem[0000000010101410] = d2982051
	stba	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = d29820f6
!	%l4 = 19867ab4, %l5 = 000000c0, Mem[0000000030141408] = b7000000 b9c22738
	stda	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = 19867ab4 000000c0
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = f62098d242ad2f47, %l5 = 00000000000000c0
	ldxa	[%i4+%o5]0x80,%l5	! %l5 = f62098d242ad2f47

p0_label_21:
!	Mem[0000000030041400] = 0450de7f, %l3 = 00000000005ad926
	ldsha	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000450
!	Mem[000000001004143c] = 52c6a55a, %l6 = 0000000000000040
	ldsba	[%i1+0x03c]%asi,%l6	! %l6 = 0000000000000052
!	Mem[00000000201c0000] = fe2c2cc7, %l5 = f62098d242ad2f47
	ldub	[%o0+%g0],%l5		! %l5 = 00000000000000fe
!	Mem[00000000100c1408] = a0000000 ced7ffff, %l4 = 19867ab4, %l5 = 000000fe
	ldda	[%i3+%o4]0x80,%l4	! %l4 = 00000000a0000000 00000000ced7ffff
!	Mem[0000000030041408] = fffff2d400000d2b, %f24 = 6de9520c ba4da1cf
	ldda	[%i1+%o4]0x89,%f24	! %f24 = fffff2d4 00000d2b
!	Mem[0000000030181410] = 41040bce, %f23 = 3c51ef3f
	lda	[%i6+%o5]0x89,%f23	! %f23 = 41040bce
!	Mem[0000000010181408] = bf62b9ff, %l7 = 00000000ffffffff
	ldsba	[%i6+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101400] = 7932b47a, %l0 = ff450ac97860bbb6
	ldsba	[%i4+%g0]0x88,%l0	! %l0 = 000000000000007a
!	Mem[00000000100c1410] = b567de9b758891c0, %f28 = 446385a7 ffe7edb0
	ldda	[%i3+%o5]0x88,%f28	! %f28 = b567de9b 758891c0
!	Starting 10 instruction Store Burst
!	%l1 = 283d5429ca9eadf6, Mem[0000000030101400] = 00000000
	stba	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000f6

p0_label_22:
!	Mem[00000000300c1408] = 67068aa3, %l2 = fffffffffffffe2c
	ldstuba	[%i3+%o4]0x81,%l2	! %l2 = 00000067000000ff
!	%f2  = 3a4ab61d b0ede7b7, Mem[0000000010001410] = 3c51ef3f 8423010e
	stda	%f2 ,[%i0+0x010]%asi	! Mem[0000000010001410] = 3a4ab61d b0ede7b7
!	Mem[0000000030081408] = e5efde09, %l3 = 0000000000000450
	ldstuba	[%i2+%o4]0x81,%l3	! %l3 = 000000e5000000ff
!	%f26 = c7358fbb 3cbfd576, Mem[0000000010101400] = 7ab43279 b473827d
	stda	%f26,[%i4+%g0]0x80	! Mem[0000000010101400] = c7358fbb 3cbfd576
!	Mem[0000000010001410] = 1db64a3a, %l2 = 0000000000000067
	swapa	[%i0+%o5]0x88,%l2	! %l2 = 000000001db64a3a
!	Mem[0000000030041410] = ffffffe5, %l2 = 000000001db64a3a
	swapa	[%i1+%o5]0x89,%l2	! %l2 = 00000000ffffffe5
!	%l0 = 000000000000007a, Mem[00000000100c1410] = c0918875
	stwa	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000007a
!	%l0 = 000000000000007a, Mem[0000000030181400] = 3827c2b9
	stwa	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000007a
!	Mem[0000000030141400] = b0ede7ff, %l0 = 000000000000007a
	ldstuba	[%i5+%g0]0x89,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ced7ae4db5ecac95, %l6 = 0000000000000052
	ldxa	[%i2+%g0]0x81,%l6	! %l6 = ced7ae4db5ecac95

p0_label_23:
!	Mem[0000000010141410] = ff450ac9, %l6 = ced7ae4db5ecac95
	ldswa	[%i5+%o5]0x80,%l6	! %l6 = ffffffffff450ac9
!	Mem[00000000100c143c] = 19142c96, %l6 = ffffffffff450ac9
	lduba	[%i3+0x03d]%asi,%l6	! %l6 = 0000000000000014
!	Mem[0000000010041410] = 3d5cced7, %f31 = e3b62637
	lda	[%i1+%o5]0x88,%f31	! %f31 = 3d5cced7
!	Mem[0000000010181418] = d8aa91f0, %l1 = 283d5429ca9eadf6
	lduba	[%i6+0x01a]%asi,%l1	! %l1 = 0000000000000091
!	Mem[0000000030041408] = 00000d2b, %f30 = 00000000
	lda	[%i1+%o4]0x89,%f30	! %f30 = 00000d2b
!	Mem[0000000010081400] = a38a0667, %l6 = 0000000000000014
	lduba	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000067
!	Mem[0000000030101410] = fffb2b7aada8585e, %l3 = 00000000000000e5
	ldxa	[%i4+%o5]0x81,%l3	! %l3 = fffb2b7aada8585e
!	Mem[00000000100c1400] = 4daed751, %l0 = 00000000000000ff
	lduha	[%i3+%g0]0x88,%l0	! %l0 = 000000000000d751
!	%l1 = 0000000000000091, %l6 = 0000000000000067, %l2 = 00000000ffffffe5
	andn	%l1,%l6,%l2		! %l2 = 0000000000000090
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = c2c600e8a38a0667, %l6 = 0000000000000067
	ldxa	[%i2+%g0]0x88,%l6	! %l6 = c2c600e8a38a0667

p0_label_24:
!	Mem[000000001010142c] = 6385872b, %l7 = ffffffffffffffff
	swap	[%i4+0x02c],%l7		! %l7 = 000000006385872b
!	%l6 = a38a0667, %l7 = 6385872b, Mem[0000000010141400] = b40f3a94 b3e03721
	stda	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = a38a0667 6385872b
!	%l4 = 00000000a0000000, Mem[0000000030041408] = 2b0d0000
	stwa	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = a0000000
!	Mem[0000000030101400] = 000000f6, %l3 = fffb2b7aada8585e
	ldstuba	[%i4+%g0]0x89,%l3	! %l3 = 000000f6000000ff
!	Mem[0000000010041424] = 111980a4, %l3 = 00000000000000f6, %asi = 80
	swapa	[%i1+0x024]%asi,%l3	! %l3 = 00000000111980a4
!	Mem[0000000010081410] = 5aa5c652, %l0 = 000000000000d751
	swapa	[%i2+%o5]0x80,%l0	! %l0 = 000000005aa5c652
!	Mem[0000000010001400] = c70eed57, %l2 = 0000000000000090
	swapa	[%i0+%g0]0x80,%l2	! %l2 = 00000000c70eed57
!	%l0 = 000000005aa5c652, Mem[0000000010041428] = bbe96d59, %asi = 80
	stwa	%l0,[%i1+0x028]%asi	! Mem[0000000010041428] = 5aa5c652
!	%l0 = 000000005aa5c652, Mem[00000000100c1400] = 51d7ae4d00000037
	stx	%l0,[%i3+%g0]		! Mem[00000000100c1400] = 000000005aa5c652
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ea947cfc26d95a00, %f4  = d7ce5c3d b384d5fb
	ldda	[%i1+%g0]0x88,%f4 	! %f4  = ea947cfc 26d95a00

p0_label_25:
!	Mem[00000000100c1410] = 7a000000, %l6 = c2c600e8a38a0667
	lduha	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = fbd584b3 3d5cced7, %l0 = 5aa5c652, %l1 = 00000091
	ldda	[%i1+%o5]0x88,%l0	! %l0 = 000000003d5cced7 00000000fbd584b3
!	Mem[0000000010081400] = 67068aa3, %l7 = 000000006385872b
	lduha	[%i2+%g0]0x80,%l7	! %l7 = 0000000000006706
!	Mem[00000000100c1410] = 0000007a9bde67b5, %l3 = 00000000111980a4
	ldxa	[%i3+%o5]0x80,%l3	! %l3 = 0000007a9bde67b5
!	Mem[0000000030081410] = a0ffffce, %l5 = 00000000ced7ffff
	lduba	[%i2+%o5]0x81,%l5	! %l5 = 00000000000000a0
!	Mem[0000000010181408] = bf62b9ff, %l7 = 0000000000006706
	lduha	[%i6+%o4]0x88,%l7	! %l7 = 000000000000b9ff
!	Mem[0000000030101408] = abc2ce4a, %l0 = 000000003d5cced7
	lduba	[%i4+%o4]0x81,%l0	! %l0 = 00000000000000ab
!	Mem[0000000010041400] = 005ad926fc7c94ea, %f30 = 00000d2b 3d5cced7
	ldd	[%i1+%g0],%f30		! %f30 = 005ad926 fc7c94ea
!	Mem[0000000010041410] = d7ce5c3d, %f1  = fc7c94ea
	lda	[%i1+%o5]0x80,%f1 	! %f1 = d7ce5c3d
!	Starting 10 instruction Store Burst
!	%f18 = 9f6c3279 b9c22738, Mem[0000000030141410] = 29543d28 f6ad9eca
	stda	%f18,[%i5+%o5]0x89	! Mem[0000000030141410] = 9f6c3279 b9c22738

p0_label_26:
!	%l6 = 0000000000000000, Mem[0000000030041400] = 7fde5004
	stba	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 7fde5000
!	Mem[0000000030001408] = 2cfeffff, %l7 = 000000000000b9ff
	ldstuba	[%i0+%o4]0x89,%l7	! %l7 = 000000ff000000ff
!	%l0 = 000000ab, %l1 = fbd584b3, Mem[0000000030041400] = 7fde5000 55e48f40
	stda	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ab fbd584b3
!	%l7 = 00000000000000ff, Mem[0000000030041400] = ab000000
	stha	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = 00ff0000
!	%l1 = 00000000fbd584b3, Mem[0000000030181410] = 41040bce
	stba	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = 41040bb3
!	%f12 = a1a4d897 287a77a0, Mem[0000000030101408] = abc2ce4a 19628ea7
	stda	%f12,[%i4+%o4]0x81	! Mem[0000000030101408] = a1a4d897 287a77a0
!	%l4 = 00000000a0000000, Mem[0000000030041408] = a0000000
	stha	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	%l3 = 0000007a9bde67b5, Mem[0000000030101408] = 97d8a4a1
	stwa	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 9bde67b5
!	Mem[0000000010001400] = 00000090, %l5 = 00000000000000a0
	swapa	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000090
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000, %l0 = 00000000000000ab
	lduha	[%i1+%o4]0x81,%l0	! %l0 = 0000000000000000

p0_label_27:
!	Mem[0000000010181438] = 8a83b1212896c9e6, %l5 = 0000000000000090
	ldx	[%i6+0x038],%l5		! %l5 = 8a83b1212896c9e6
!	Mem[0000000030001400] = ada8585e, %l1 = 00000000fbd584b3
	ldsha	[%i0+%g0]0x89,%l1	! %l1 = 000000000000585e
!	Mem[0000000021800180] = 29bea69f, %l6 = 0000000000000000
	ldsba	[%o3+0x180]%asi,%l6	! %l6 = 0000000000000029
!	Mem[0000000010081410] = 51d70000, %f12 = a1a4d897
	lda	[%i2+%o5]0x88,%f12	! %f12 = 51d70000
!	Mem[0000000030081410] = a0ffffce, %l3 = 0000007a9bde67b5
	lduba	[%i2+%o5]0x81,%l3	! %l3 = 00000000000000a0
!	Mem[0000000010001410] = 00000067, %f19 = b9c22738
	lda	[%i0+%o5]0x88,%f19	! %f19 = 00000067
!	Mem[0000000010041408] = 3a4a0019, %f4  = ea947cfc
	lda	[%i1+%o4]0x80,%f4 	! %f4 = 3a4a0019
!	Mem[0000000030181400] = fc80b5d37a000000, %l0 = 0000000000000000
	ldxa	[%i6+%g0]0x89,%l0	! %l0 = fc80b5d37a000000
!	%f0  = 005ad926, %f1  = d7ce5c3d, %f3  = b0ede7b7
	fsubs	%f0 ,%f1 ,%f3 		! %l0 = fc80b5d37a000022, Unfinished, %fsr = 0000000000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000029, Mem[0000000010001428] = 443048b971258294
	stx	%l6,[%i0+0x028]		! Mem[0000000010001428] = 0000000000000029

p0_label_28:
!	%f13 = 287a77a0, Mem[0000000030001410] = 1f1dfc40
	sta	%f13,[%i0+%o5]0x81	! Mem[0000000030001410] = 287a77a0
!	%l4 = 00000000a0000000, Mem[0000000030181408] = 19867ab4
	stha	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 19860000
!	%l3 = 00000000000000a0, Mem[0000000010041410] = d7ce5c3d
	stba	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = a0ce5c3d
!	%f30 = 005ad926, Mem[0000000030001400] = 5e58a8ad
	sta	%f30,[%i0+%g0]0x81	! Mem[0000000030001400] = 005ad926
!	Mem[0000000020800041] = 00f8a3d2, %l1 = 000000000000585e
	ldstub	[%o1+0x041],%l1		! %l1 = 000000f8000000ff
!	Mem[000000001014141a] = 5590109d, %l7 = 00000000000000ff
	ldstub	[%i5+0x01a],%l7		! %l7 = 00000010000000ff
!	%f14 = 86aa285f, Mem[0000000010101400] = c7358fbb
	sta	%f14,[%i4+%g0]0x80	! Mem[0000000010101400] = 86aa285f
!	%l2 = 00000000c70eed57, Mem[0000000010001400] = 000000a0
	stwa	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = c70eed57
!	Mem[00000000100c1400] = 52c6a55a00000000, %l5 = 8a83b1212896c9e6
	ldxa	[%i3+%g0]0x88,%l5	! %l5 = 52c6a55a00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ff450ac9, %l5 = 52c6a55a00000000
	ldsha	[%i5+%o5]0x80,%l5	! %l5 = ffffffffffffff45

p0_label_29:
!	Mem[0000000010101438] = 09deefe5 91710aaf, %l4 = a0000000, %l5 = ffffff45
	ldd	[%i4+0x038],%l4		! %l4 = 0000000009deefe5 0000000091710aaf
!	Mem[0000000030041408] = 00000000, %l5 = 0000000091710aaf
	lduwa	[%i1+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = ffbe6af713992882, %f24 = fffff2d4 00000d2b
	ldda	[%i6+%g0]0x80,%f24	! %f24 = ffbe6af7 13992882
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000030041400] = 00ff0000 b384d5fb 00000000 d4f2ffff
!	Mem[0000000030041410] = 3a4ab61d 5f1cf883 f6088aa2 ea6af128
!	Mem[0000000030041420] = 3001e26e 06af2205 9618c101 828e0a91
!	Mem[0000000030041430] = 3bc49137 b608739a fe060b24 6b8faa3c
	ldda	[%i1]ASI_BLK_S,%f16	! Block Load from 0000000030041400
!	Mem[0000000030181400] = 0000007a, %l4 = 0000000009deefe5
	ldsba	[%i6+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%l1 = 00000000000000f8, immed = 00000619, %y  = 7860bbb6
	sdiv	%l1,0x619,%l0		! %l0 = 000000007fffffff
	mov	%l0,%y			! %y = 7fffffff
!	Mem[0000000030141410] = 3827c2b9, %l1 = 00000000000000f8
	lduba	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000038
!	Mem[0000000030001410] = f4ff9dbca0777a28, %l1 = 0000000000000038
	ldxa	[%i0+%o5]0x89,%l1	! %l1 = f4ff9dbca0777a28
!	Mem[0000000030001400] = 26d95a00, %f3  = b0ede7b7
	lda	[%i0+%g0]0x89,%f3 	! %f3 = 26d95a00
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000021800080] = 5c3d341e, %asi = 80
	stba	%l5,[%o3+0x080]%asi	! Mem[0000000021800080] = 003d341e

p0_label_30:
!	%l6 = 00000029, %l7 = 00000010, Mem[00000000300c1410] = 00000000 d3b580fc
	stda	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000029 00000010
!	%l5 = 0000000000000000, Mem[0000000010001408] = 9f6c3279
	stba	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 9f6c3200
!	%l4 = 0000000000000000, imm = 000000000000034c, %l2 = 00000000c70eed57
	sub	%l4,0x34c,%l2		! %l2 = fffffffffffffcb4
!	%l1 = f4ff9dbca0777a28, Mem[00000000211c0001] = ffff7241
	stb	%l1,[%o2+0x001]		! Mem[00000000211c0000] = ff287241
!	%l3 = 00000000000000a0, Mem[0000000010141408] = 000000f8
	stba	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000a0
!	Mem[0000000030001400] = 005ad926, %l4 = 0000000000000000
	ldstuba	[%i0+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001400] = 26d95aff, %l1 = f4ff9dbca0777a28
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 000000ff000000ff
!	%l0 = 000000007fffffff, Mem[0000000010181400] = ffbe6af7
	stwa	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 7fffffff
!	%f1  = d7ce5c3d, Mem[00000000300c1408] = a38a06ff
	sta	%f1 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = d7ce5c3d
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 737907d2b7e7edb0, %f12 = 51d70000 287a77a0
	ldda	[%i4+%o4]0x88,%f12	! %f12 = 737907d2 b7e7edb0

p0_label_31:
!	Mem[00000000211c0000] = ff287241, %l4 = 0000000000000000
	lduh	[%o2+%g0],%l4		! %l4 = 000000000000ff28
!	Mem[0000000010081400] = c2c600e8 a38a0667, %l2 = fffffcb4, %l3 = 000000a0
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 00000000a38a0667 00000000c2c600e8
!	Mem[000000001014142c] = 2302b6d6, %l7 = 0000000000000010
	ldub	[%i5+0x02e],%l7		! %l7 = 00000000000000b6
!	Mem[0000000030041400] = 0000ff00, %l4 = 000000000000ff28
	lduha	[%i1+%g0]0x89,%l4	! %l4 = 000000000000ff00
!	Mem[00000000100c1408] = 000000a0, %l2 = 00000000a38a0667
	ldsba	[%i3+%o4]0x88,%l2	! %l2 = ffffffffffffffa0
!	Mem[0000000010141418] = 5590ff9d, %l4 = 000000000000ff00
	lduw	[%i5+0x018],%l4		! %l4 = 000000005590ff9d
!	Mem[00000000100c1400] = 52c6a55a00000000, %l0 = 000000007fffffff
	ldxa	[%i3+%g0]0x88,%l0	! %l0 = 52c6a55a00000000
!	Mem[00000000211c0000] = ff287241, %l1 = 00000000000000ff
	ldub	[%o2+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030041408] = fffff2d4 00000000, %l6 = 00000029, %l7 = 000000b6
	ldda	[%i1+%o4]0x89,%l6	! %l6 = 0000000000000000 00000000fffff2d4
!	Starting 10 instruction Store Burst
!	Mem[0000000010101418] = b5362b7ca67862fd, %l3 = 00000000c2c600e8, %l0 = 52c6a55a00000000
	add	%i4,0x18,%g1
	casxa	[%g1]0x80,%l3,%l0	! %l0 = b5362b7ca67862fd

p0_label_32:
!	%l5 = 0000000000000000, Mem[00000000100c1404] = 5aa5c652, %asi = 80
	stwa	%l5,[%i3+0x004]%asi	! Mem[00000000100c1404] = 00000000
!	%l5 = 0000000000000000, Mem[00000000100c1428] = 54707eb1d2077973, %asi = 80
	stxa	%l5,[%i3+0x028]%asi	! Mem[00000000100c1428] = 0000000000000000
!	%l2 = ffffffffffffffa0, Mem[0000000010001400] = 57ed0ec7
	stwa	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffffa0
!	Mem[0000000010141427] = 381bdd3c, %l5 = 0000000000000000
	ldstuba	[%i5+0x027]%asi,%l5	! %l5 = 0000003c000000ff
!	%l0 = b5362b7ca67862fd, Mem[0000000010001426] = b0491466, %asi = 80
	stha	%l0,[%i0+0x026]%asi	! Mem[0000000010001424] = b04962fd
!	%l2 = ffffffffffffffa0, Mem[00000000100c1418] = 0dfeb8c2, %asi = 80
	stwa	%l2,[%i3+0x018]%asi	! Mem[00000000100c1418] = ffffffa0
!	%f10 = bbe96d59 ac77cded, Mem[0000000030081400] = ced7ae4d b5ecac95
	stda	%f10,[%i2+%g0]0x81	! Mem[0000000030081400] = bbe96d59 ac77cded
!	%l2 = ffffffffffffffa0, imm = fffffffffffffa44, %l7 = 00000000fffff2d4
	xnor	%l2,-0x5bc,%l7		! %l7 = fffffffffffffa1b
!	Mem[0000000010181410] = 9dd49668, %l7 = fffffffffffffa1b
	ldstuba	[%i6+%o5]0x80,%l7	! %l7 = 0000009d000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = d29820f6, %l3 = 00000000c2c600e8
	lduba	[%i4+%o5]0x88,%l3	! %l3 = 00000000000000f6

p0_label_33:
!	Mem[00000000100c1438] = 77d869f319142c96, %f8  = 38f8ca5c 111980a4
	ldd	[%i3+0x038],%f8 	! %f8  = 77d869f3 19142c96
!	Mem[00000000300c1400] = 65eb6ba005df1bf1, %f16 = 00ff0000 b384d5fb
	ldda	[%i3+%g0]0x81,%f16	! %f16 = 65eb6ba0 05df1bf1
!	Mem[0000000030141400] = ffe7edb0, %l5 = 000000000000003c
	lduwa	[%i5+%g0]0x81,%l5	! %l5 = 00000000ffe7edb0
!	Mem[0000000010101400] = 5f28aa86, %l2 = ffffffffffffffa0
	lduha	[%i4+%g0]0x88,%l2	! %l2 = 000000000000aa86
!	%f28 = 3bc49137, %f6  = 2aeb61d1
	fsqrts	%f28,%f6 		! %f6  = 3d9e9ef7
!	Mem[0000000010101414] = 42ad2f47, %f22 = f6088aa2
	lda	[%i4+0x014]%asi,%f22	! %f22 = 42ad2f47
!	Mem[0000000010081400] = c2c600e8 a38a0667, %l6 = 00000000, %l7 = 0000009d
	ldda	[%i2+%g0]0x88,%l6	! %l6 = 00000000a38a0667 00000000c2c600e8
!	Mem[0000000010181400] = ffffff7f, %l6 = 00000000a38a0667
	lduwa	[%i6+%g0]0x88,%l6	! %l6 = 00000000ffffff7f
!	Mem[0000000010001430] = 6de9520c, %l6 = 00000000ffffff7f
	ldsh	[%i0+0x030],%l6		! %l6 = 0000000000006de9
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 0000d751, %l4 = 000000005590ff9d
	swapa	[%i2+%o5]0x80,%l4	! %l4 = 000000000000d751

p0_label_34:
!	Mem[0000000010181400] = 7fffffff, %l2 = 000000000000aa86
	ldstuba	[%i6+%g0]0x80,%l2	! %l2 = 0000007f000000ff
!	%f24 = 3001e26e 06af2205, %l0 = b5362b7ca67862fd
!	Mem[0000000010081428] = 87955d536cb69670
	add	%i2,0x028,%g1
	stda	%f24,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010081428] = 0522af066cb69670
!	%l6 = 0000000000006de9, Mem[0000000010181408] = bf62b9ff
	stba	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = bf62b9e9
!	%f12 = 737907d2 b7e7edb0, %l6 = 0000000000006de9
!	Mem[0000000030141420] = 14fa21585265d032
	add	%i5,0x020,%g1
	stda	%f12,[%g1+%l6]ASI_PST32_S ! Mem[0000000030141420] = 14fa2158b7e7edb0
!	%l3 = 00000000000000f6, Mem[0000000030001400] = 9dfb2b7a26d95aff
	stxa	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000000000f6
!	Mem[0000000010041410] = 3d5ccea0, %l0 = b5362b7ca67862fd
	swapa	[%i1+%o5]0x88,%l0	! %l0 = 000000003d5ccea0
!	Mem[0000000010101410] = f62098d2, %l1 = 00000000000000ff
	ldstuba	[%i4+%o5]0x80,%l1	! %l1 = 000000f6000000ff
!	%f20 = 3a4ab61d 5f1cf883, Mem[0000000010101400] = 86aa285f 3cbfd576
	stda	%f20,[%i4+%g0]0x80	! Mem[0000000010101400] = 3a4ab61d 5f1cf883
!	%l4 = 0000d751, %l5 = ffe7edb0, Mem[0000000010081410] = 9dff9055 86aa285f
	stda	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000d751 ffe7edb0
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = bbe96d59ac77cded, %l3 = 00000000000000f6
	ldxa	[%i2+%g0]0x81,%l3	! %l3 = bbe96d59ac77cded

p0_label_35:
!	Mem[0000000010101400] = 3a4ab61d, %l7 = 00000000c2c600e8
	lduba	[%i4+%g0]0x80,%l7	! %l7 = 000000000000003a
!	Mem[0000000010041408] = 19004a3a, %l6 = 0000000000006de9
	ldsba	[%i1+%o4]0x88,%l6	! %l6 = 000000000000003a
!	Mem[0000000010081408] = ff26b6e300ad0000, %l1 = 00000000000000f6
	ldxa	[%i2+%o4]0x80,%l1	! %l1 = ff26b6e300ad0000
!	Mem[00000000300c1410] = 00000029, %l7 = 000000000000003a
	lduba	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081400] = edcd77ac596de9bb, %l0 = 000000003d5ccea0
	ldxa	[%i2+%g0]0x89,%l0	! %l0 = edcd77ac596de9bb
!	Mem[0000000010041408] = 19004a3a, %l4 = 000000000000d751
	lduwa	[%i1+%o4]0x88,%l4	! %l4 = 0000000019004a3a
!	Mem[0000000030181410] = 41040bb3, %f19 = d4f2ffff
	lda	[%i6+%o5]0x89,%f19	! %f19 = 41040bb3
!	Mem[0000000010101410] = ff2098d2, %l3 = bbe96d59ac77cded
	lduwa	[%i4+%o5]0x80,%l3	! %l3 = 00000000ff2098d2
!	Mem[00000000218001c0] = ff8b4083, %l4 = 0000000019004a3a
	lduha	[%o3+0x1c0]%asi,%l4	! %l4 = 000000000000ff8b
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (4)
!	%l6 = 000000000000003a, Mem[0000000030041410] = 3a4ab61d5f1cf883
	stxa	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000000000003a

p0_label_36:
!	Mem[00000000100c1408] = a0000000, %l4 = 000000000000ff8b
	swapa	[%i3+%o4]0x80,%l4	! %l4 = 00000000a0000000
!	%l2 = 0000007f, %l3 = ff2098d2, Mem[0000000030141410] = b9c22738 9f6c3279
	stda	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000007f ff2098d2
!	%f0  = 005ad926 d7ce5c3d 3a4ab61d 26d95a00
!	%f4  = 3a4a0019 26d95a00 3d9e9ef7 c76395e5
!	%f8  = 77d869f3 19142c96 bbe96d59 ac77cded
!	%f12 = 737907d2 b7e7edb0 86aa285f 52c6a55a
	stda	%f0,[%i6]ASI_BLK_PL	! Block Store to 0000000010181400
!	Mem[0000000010081410] = 51d70000, %l1 = ff26b6e300ad0000
	ldstuba	[%i2+%o5]0x80,%l1	! %l1 = 00000051000000ff
!	%l3 = 00000000ff2098d2, Mem[0000000030081410] = a0ffffce
	stwa	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = ff2098d2
!	Mem[0000000010001410] = 67000000, %l3 = 00000000ff2098d2
	swapa	[%i0+%o5]0x80,%l3	! %l3 = 0000000067000000
!	Mem[0000000010101410] = d29820ff, %l7 = 0000000000000000
	swapa	[%i4+%o5]0x88,%l7	! %l7 = 00000000d29820ff
!	%l5 = 00000000ffe7edb0, Mem[0000000010141400] = 67068aa3
	stba	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 67068ab0
!	%l1 = 0000000000000051, Mem[00000000100c1408] = 0000ff8b
	stwa	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000051
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = f4ff9dbca0777a28, %f20 = 3a4ab61d 5f1cf883
	ldda	[%i0+%o5]0x89,%f20	! %f20 = f4ff9dbc a0777a28

p0_label_37:
!	Mem[0000000030141410] = 0000007f, %l5 = 00000000ffe7edb0
	lduwa	[%i5+%o5]0x89,%l5	! %l5 = 000000000000007f
!	%f31 = 6b8faa3c, %f20 = f4ff9dbc, %f22 = 42ad2f47
	fsubs	%f31,%f20,%f22		! %f22 = 74ff9de0
!	Mem[0000000030081400] = bbe96d59, %f22 = 74ff9de0
	lda	[%i2+%g0]0x81,%f22	! %f22 = bbe96d59
!	Mem[0000000030141410] = 7f000000 d29820ff, %l6 = 0000003a, %l7 = d29820ff
	ldda	[%i5+%o5]0x81,%l6	! %l6 = 000000007f000000 00000000d29820ff
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010181428] = edcd77ac, %l6 = 000000007f000000
	ldsb	[%i6+0x029],%l6		! %l6 = ffffffffffffffcd
!	Mem[00000000100c1410] = 0000007a, %l7 = 00000000d29820ff
	lduba	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141408] = a000000000000000, %l5 = 000000000000007f
	ldxa	[%i5+%o4]0x80,%l5	! %l5 = a000000000000000
!	Mem[0000000010101400] = 3a4ab61d 5f1cf883 b0ede7b7 d2077973
!	Mem[0000000010101410] = 00000000 42ad2f47 b5362b7c a67862fd
!	Mem[0000000010101420] = aca1a530 5f45a09f 4bcd767f ffffffff
!	Mem[0000000010101430] = bb5790c6 214d006f 09deefe5 91710aaf
	ldda	[%i4]ASI_BLK_P,%f0	! Block Load from 0000000010101400
!	Mem[0000000030001408] = fffffe2c, %l6 = ffffffffffffffcd
	lduha	[%i0+%o4]0x81,%l6	! %l6 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 7a000000, %l1 = 0000000000000051
	swapa	[%i6+%g0]0x89,%l1	! %l1 = 000000007a000000

p0_label_38:
	membar	#Sync			! Added by membar checker (6)
!	%l6 = 000000000000ffff, Mem[0000000010101400] = 3a4ab61d5f1cf883
	stxa	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000000000ffff
!	%l4 = 00000000a0000000, Mem[00000000100c1400] = 00000000
	stha	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	%l3 = 0000000067000000, Mem[0000000010001400] = a0ffffff, %asi = 80
	stha	%l3,[%i0+0x000]%asi	! Mem[0000000010001400] = 0000ffff
!	Mem[0000000010041400] = 26d95a00, %l3 = 0000000067000000
	swapa	[%i1+%g0]0x88,%l3	! %l3 = 0000000026d95a00
!	%l5 = a000000000000000, Mem[0000000010081410] = ffe7edb00000d7ff
	stxa	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = a000000000000000
!	%l6 = 0000ffff, %l7 = 00000000, Mem[0000000030181410] = b30b0441 a913c8f5
	stda	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000ffff 00000000
!	%l0 = 596de9bb, %l1 = 7a000000, Mem[0000000030041400] = 0000ff00 fbd584b3
	stda	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 596de9bb 7a000000
!	%l6 = 000000000000ffff, Mem[0000000010141410] = ff450ac9
	stb	%l6,[%i5+%o5]		! Mem[0000000010141410] = ff450ac9
!	Mem[0000000010041438] = 86aa285f, %l3 = 0000000026d95a00, %asi = 80
	swapa	[%i1+0x038]%asi,%l3	! %l3 = 0000000086aa285f
!	Starting 10 instruction Load Burst
!	Mem[0000000010001420] = 064b1039 b04962fd, %l4 = a0000000, %l5 = 00000000
	ldda	[%i0+0x020]%asi,%l4	! %l4 = 00000000064b1039 00000000b04962fd

p0_label_39:
!	Mem[0000000010081408] = ff26b6e3, %l0 = edcd77ac596de9bb
	lduw	[%i2+%o4],%l0		! %l0 = 00000000ff26b6e3
!	Mem[0000000030041410] = 3a000000 00000000, %l6 = 0000ffff, %l7 = 00000000
	ldda	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000000 000000003a000000
!	Mem[0000000030081408] = ffefde09b8900102, %f0  = 3a4ab61d 5f1cf883
	ldda	[%i2+%o4]0x81,%f0 	! %f0  = ffefde09 b8900102
!	Mem[0000000010041410] = a67862fd, %l3 = 0000000086aa285f
	lduba	[%i1+%o5]0x88,%l3	! %l3 = 00000000000000fd
!	Mem[0000000030001410] = 287a77a0, %l3 = 00000000000000fd
	lduwa	[%i0+%o5]0x81,%l3	! %l3 = 00000000287a77a0
!	Mem[0000000010101400] = 00000000, %l1 = 000000007a000000
	lduba	[%i4+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = b0ede7ff, %l3 = 00000000287a77a0
	lduha	[%i5+%g0]0x89,%l3	! %l3 = 000000000000e7ff
!	%l4 = 00000000064b1039, Mem[0000000030001410] = 287a77a0
	stha	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 103977a0
!	Mem[0000000030001400] = f600000000000000, %f20 = f4ff9dbc a0777a28
	ldda	[%i0+%g0]0x81,%f20	! %f20 = f6000000 00000000
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000e7ff, Mem[0000000010081410] = 00000000
	stwa	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000e7ff

p0_label_40:
!	%l2 = 000000000000007f, Mem[0000000030101410] = 7a2bfbff
	stha	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 7a2b007f
!	%f10 = 4bcd767f ffffffff, Mem[0000000010081408] = e3b626ff 0000ad00
	stda	%f10,[%i2+%o4]0x88	! Mem[0000000010081408] = 4bcd767f ffffffff
!	%l6 = 0000000000000000, Mem[0000000030101410] = 7a2b007f
	stha	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 7a2b0000
!	%l2 = 000000000000007f, Mem[0000000010081414] = 000000a0, %asi = 80
	stwa	%l2,[%i2+0x014]%asi	! Mem[0000000010081414] = 0000007f
!	%f16 = 65eb6ba0 05df1bf1, Mem[0000000010001408] = 9f6c3200 f85d9f76
	stda	%f16,[%i0+%o4]0x88	! Mem[0000000010001408] = 65eb6ba0 05df1bf1
!	Mem[00000000100c1400] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141400] = ffe7edb0, %l4 = 00000000064b1039
	swapa	[%i5+%g0]0x81,%l4	! %l4 = 00000000ffe7edb0
!	%l0 = ff26b6e3, %l1 = 00000000, Mem[0000000030181410] = 0000ffff 00000000
	stda	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = ff26b6e3 00000000
!	%f13 = 214d006f, %f14 = 09deefe5
	fcmps	%fcc1,%f13,%f14		! %fcc1 = 2
!	Starting 10 instruction Load Burst
!	Mem[000000001000143c] = 0968dd83, %l6 = 0000000000000000
	ldub	[%i0+0x03d],%l6		! %l6 = 0000000000000068

p0_label_41:
!	Mem[00000000100c1400] = ff00000000000000, %f20 = f6000000 00000000
	ldda	[%i3+%g0]0x80,%f20	! %f20 = ff000000 00000000
!	Mem[0000000030141400] = 3a4ab61d 39104b06, %l6 = 00000068, %l7 = 3a000000
	ldda	[%i5+%g0]0x89,%l6	! %l6 = 0000000039104b06 000000003a4ab61d
!	Mem[0000000010001410] = d29820ff, %l5 = 00000000b04962fd
	ldsba	[%i0+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030101400] = 000000ff, %l3 = 000000000000e7ff
	ldswa	[%i4+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1408] = 51000000, %l6 = 0000000039104b06
	ldsba	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181410] = 005ad926, %l1 = 0000000000000000
	lduha	[%i6+%o5]0x80,%l1	! %l1 = 000000000000005a
!	Mem[0000000030101400] = ff000000e3b62637, %f8  = aca1a530 5f45a09f
	ldda	[%i4+%g0]0x81,%f8 	! %f8  = ff000000 e3b62637
!	Mem[0000000010081408] = ffffffff, %l2 = 000000000000007f
	ldswa	[%i2+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010081408] = ffffffff 7f76cd4b, %l6 = 00000000, %l7 = 3a4ab61d
	ldda	[%i2+%o4]0x80,%l6	! %l6 = 00000000ffffffff 000000007f76cd4b
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ffe7edb0, Mem[0000000030181408] = 00008619ced7ffff
	stxa	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000ffe7edb0

p0_label_42:
!	Mem[0000000010001400] = 0000ffff, %l6 = 00000000ffffffff
	ldstuba	[%i0+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	%f16 = 65eb6ba0 05df1bf1, Mem[00000000100c1400] = ff000000 00000000
	std	%f16,[%i3+%g0]	! Mem[00000000100c1400] = 65eb6ba0 05df1bf1
!	Mem[0000000010001404] = 02116447, %l0 = ff26b6e3, %l2 = ffffffff
	add	%i0,0x04,%g1
	casa	[%g1]0x80,%l0,%l2	! %l2 = 0000000002116447
!	%l0 = 00000000ff26b6e3, Mem[0000000010101408] = b7e7edb0
	stwa	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = ff26b6e3
!	%f2  = b0ede7b7, Mem[0000000030041408] = 00000000
	sta	%f2 ,[%i1+%o4]0x81	! Mem[0000000030041408] = b0ede7b7
!	Mem[000000001004143c] = 52c6a55a, %l0 = 00000000ff26b6e3, %asi = 80
	swapa	[%i1+0x03c]%asi,%l0	! %l0 = 0000000052c6a55a
!	%f28 = 3bc49137 b608739a, Mem[00000000100c1408] = 51000000 ffffd7ce
	stda	%f28,[%i3+%o4]0x88	! Mem[00000000100c1408] = 3bc49137 b608739a
!	%f2  = b0ede7b7, %f14 = 09deefe5, %f25 = 06af2205
	fmuls	%f2 ,%f14,%f25		! %l0 = 0000000052c6a57c, Unfinished, %fsr = 0200000000
!	Mem[0000000010001410] = d29820ff, %l3 = 00000000000000ff
	ldstuba	[%i0+%o5]0x88,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = e3b626ff, %l0 = 0000000052c6a57c
	lduba	[%i4+%o4]0x80,%l0	! %l0 = 00000000000000e3

p0_label_43:
!	Mem[0000000030101408] = 9bde67b5, %l4 = 00000000ffe7edb0
	lduha	[%i4+%o4]0x89,%l4	! %l4 = 00000000000067b5
!	Mem[0000000030041410] = 00000000, %f27 = 828e0a91
	lda	[%i1+%o5]0x89,%f27	! %f27 = 00000000
!	Mem[0000000030041408] = fffff2d4 b7e7edb0, %l4 = 000067b5, %l5 = ffffffff
	ldda	[%i1+%o4]0x89,%l4	! %l4 = 00000000b7e7edb0 00000000fffff2d4
!	Mem[0000000030081408] = 09deefff, %f15 = 91710aaf
	lda	[%i2+%o4]0x89,%f15	! %f15 = 09deefff
!	%l0 = 00000000000000e3, Mem[0000000010181408] = 005ad926
	stw	%l0,[%i6+%o4]		! Mem[0000000010181408] = 000000e3
!	Mem[0000000010141400] = b08a0667, %l1 = 000000000000005a
	lduba	[%i5+%g0]0x80,%l1	! %l1 = 00000000000000b0
!	Mem[0000000030081408] = 09deefff, %l4 = 00000000b7e7edb0
	ldswa	[%i2+%o4]0x89,%l4	! %l4 = 0000000009deefff
!	Mem[0000000010101400] = 00000000, %l3 = 00000000000000ff
	lduwa	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = ff287241, %l1 = 00000000000000b0
	ldsb	[%o2+0x001],%l1		! %l1 = 0000000000000028
!	Starting 10 instruction Store Burst
!	%f16 = 65eb6ba0 05df1bf1, Mem[0000000010181400] = d7ce5c3d 005ad926
	stda	%f16,[%i6+%g0]0x88	! Mem[0000000010181400] = 65eb6ba0 05df1bf1

p0_label_44:
!	%l3 = 0000000000000000, Mem[0000000010141404] = 6385872b, %asi = 80
	stba	%l3,[%i5+0x004]%asi	! Mem[0000000010141404] = 0085872b
!	%l2 = 0000000002116447, Mem[0000000010001408] = 65eb6ba005df1bf1
	stxa	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000000002116447
!	%f20 = ff000000 00000000, Mem[0000000010181400] = 05df1bf1 65eb6ba0
	stda	%f20,[%i6+%g0]0x88	! Mem[0000000010181400] = ff000000 00000000
!	Mem[00000000100c1410] = 0000007a, %l1 = 0000000000000028
	ldstuba	[%i3+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%l0 = 00000000000000e3, Mem[0000000010181430] = b0ede7b7, %asi = 80
	stwa	%l0,[%i6+0x030]%asi	! Mem[0000000010181430] = 000000e3
!	Mem[0000000020800000] = 635ed75b, %l4 = 0000000009deefff
	ldstuba	[%o1+0x000]%asi,%l4	! %l4 = 00000063000000ff
!	%l0 = 00000000000000e3, Mem[0000000030041408] = b7e7edb0
	stha	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = b7e700e3
!	%l3 = 0000000000000000, Mem[00000000211c0000] = ff287241
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 00007241
!	%f16 = 65eb6ba0, Mem[0000000010101430] = bb5790c6
	st	%f16,[%i4+0x030]	! Mem[0000000010101430] = 65eb6ba0
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = a38a0667, %l1 = 0000000000000000
	lduha	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000667

p0_label_45:
!	Mem[0000000010081408] = ffffffff, %f12 = bb5790c6
	lda	[%i2+%o4]0x88,%f12	! %f12 = ffffffff
!	%f4  = 00000000, %f10 = 4bcd767f, %f13 = 214d006f
	fmuls	%f4 ,%f10,%f13		! %f13 = 00000000
!	Mem[00000000218000c0] = ff23265e, %l6 = 0000000000000000
	ldsb	[%o3+0x0c1],%l6		! %l6 = 0000000000000023
!	Mem[0000000010041410] = fd6278a6, %l4 = 0000000000000063
	lduwa	[%i1+%o5]0x80,%l4	! %l4 = 00000000fd6278a6
!	Mem[00000000100c1400] = a06beb65, %l2 = 0000000002116447
	lduwa	[%i3+%g0]0x88,%l2	! %l2 = 00000000a06beb65
!	Mem[0000000010141434] = ee1c5974, %l2 = 00000000a06beb65
	lduha	[%i5+0x034]%asi,%l2	! %l2 = 000000000000ee1c
!	Mem[0000000030081400] = bbe96d59, %l6 = 0000000000000023
	lduha	[%i2+%g0]0x81,%l6	! %l6 = 000000000000bbe9
!	Mem[0000000010081438] = 154b1ac0, %l2 = 000000000000ee1c
	lduba	[%i2+0x03b]%asi,%l2	! %l2 = 00000000000000c0
!	Mem[0000000010141428] = e09cba41, %l3 = 0000000000000000
	lduw	[%i5+0x028],%l3		! %l3 = 00000000e09cba41
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 0000e7ff, %l6 = 0000bbe9, %l2 = 000000c0
	add	%i2,0x10,%g1
	casa	[%g1]0x80,%l6,%l2	! %l2 = 000000000000e7ff

p0_label_46:
!	Mem[00000000218001c1] = ff8b4083, %l4 = 00000000fd6278a6
	ldstub	[%o3+0x1c1],%l4		! %l4 = 0000008b000000ff
!	%l3 = 00000000e09cba41, Mem[0000000030081408] = 09deefff
	stwa	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = e09cba41
!	Mem[0000000010081424] = ce4ec79b, %l1 = 00000667, %l7 = 7f76cd4b
	add	%i2,0x24,%g1
	casa	[%g1]0x80,%l1,%l7	! %l7 = 00000000ce4ec79b
!	Mem[0000000010001414] = b0ede7b7, %l3 = 00000000e09cba41
	swap	[%i0+0x014],%l3		! %l3 = 00000000b0ede7b7
!	%l2 = 0000e7ff, %l3 = b0ede7b7, Mem[0000000030001410] = a0773910 f4ff9dbc
	stda	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000e7ff b0ede7b7
!	Mem[0000000010181410] = 005ad926, %l2 = 000000000000e7ff
	ldstuba	[%i6+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%f30 = fe060b24 6b8faa3c, Mem[0000000010101400] = 00000000 ffff0000
	stda	%f30,[%i4+%g0]0x88	! Mem[0000000010101400] = fe060b24 6b8faa3c
!	Mem[0000000030141408] = 19867ab4, %l0 = 00000000000000e3
	ldstuba	[%i5+%o4]0x81,%l0	! %l0 = 00000019000000ff
!	%l4 = 000000000000008b, Mem[0000000010181400] = 00000000
	stba	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 8b000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ff2098d2, %l1 = 0000000000000667
	ldsba	[%i2+%o5]0x81,%l1	! %l1 = ffffffffffffffff

p0_label_47:
!	Mem[0000000030041400] = bbe96d59, %l5 = 00000000fffff2d4
	ldsba	[%i1+%g0]0x81,%l5	! %l5 = ffffffffffffffbb
!	Mem[00000000100c1408] = b608739a, %l1 = ffffffffffffffff
	ldsba	[%i3+%o4]0x88,%l1	! %l1 = ffffffffffffff9a
!	Mem[0000000010181414] = 19004a3a, %l2 = 0000000000000000
	ldsw	[%i6+0x014],%l2		! %l2 = 0000000019004a3a
!	Mem[00000000300c1408] = d7ce5c3d, %l7 = 00000000ce4ec79b
	ldswa	[%i3+%o4]0x89,%l7	! %l7 = ffffffffd7ce5c3d
!	Mem[0000000010181408] = 000000e3, %l3 = 00000000b0ede7b7
	ldswa	[%i6+%o4]0x80,%l3	! %l3 = 00000000000000e3
!	Mem[0000000030141408] = ff867ab4, %f31 = 6b8faa3c
	lda	[%i5+%o4]0x81,%f31	! %f31 = ff867ab4
!	Mem[0000000010081408] = ffffffff, %l4 = 000000000000008b
	ldswa	[%i2+%o4]0x80,%l4	! %l4 = ffffffffffffffff
!	Code Fragment 4
p0_fragment_2:
!	%l0 = 0000000000000019
	setx	0xdc2422d00b994c56,%g7,%l0 ! %l0 = dc2422d00b994c56
!	%l1 = ffffffffffffff9a
	setx	0x51638ef7c8d9692e,%g7,%l1 ! %l1 = 51638ef7c8d9692e
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = dc2422d00b994c56
	setx	0x252f5dd7ab858797,%g7,%l0 ! %l0 = 252f5dd7ab858797
!	%l1 = 51638ef7c8d9692e
	setx	0x5ad94f380ce80f64,%g7,%l1 ! %l1 = 5ad94f380ce80f64
!	Mem[0000000030081400] = bbe96d59, %l5 = ffffffffffffffbb
	lduwa	[%i2+%g0]0x81,%l5	! %l5 = 00000000bbe96d59
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffffff, Mem[0000000010001410] = 41ba9ce0d29820ff
	stxa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffffffffffff

p0_label_48:
!	%l6 = 0000bbe9, %l7 = d7ce5c3d, Mem[0000000030101400] = ff000000 e3b62637
	stda	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000bbe9 d7ce5c3d
!	%l0 = 252f5dd7ab858797, Mem[0000000010141414] = 7860bbb6
	sth	%l0,[%i5+0x014]		! Mem[0000000010141414] = 8797bbb6
!	Mem[0000000030181408] = 00000000, %l0 = 252f5dd7ab858797
	ldstuba	[%i6+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	%f9  = e3b62637, Mem[0000000010081400] = a38a0667
	sta	%f9 ,[%i2+%g0]0x88	! Mem[0000000010081400] = e3b62637
!	Mem[0000000010181420] = 962c1419f369d877, %l1 = 5ad94f380ce80f64, %l1 = 5ad94f380ce80f64
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l1,%l1	! %l1 = 962c1419f369d877
!	%f0  = ffefde09 b8900102, %l1 = 962c1419f369d877
!	Mem[0000000030081428] = d4aae56d34fe5778
	add	%i2,0x028,%g1
	stda	%f0,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030081428] = 020190b809de5778
!	%l0 = 00000000, %l1 = f369d877, Mem[0000000010041408] = 3a4a0019 b0ede7b7
	stda	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000 f369d877
!	Code Fragment 4
p0_fragment_3:
!	%l0 = 0000000000000000
	setx	0x10663f3fb86f1fb5,%g7,%l0 ! %l0 = 10663f3fb86f1fb5
!	%l1 = 962c1419f369d877
	setx	0x7ffd8e7055ee32be,%g7,%l1 ! %l1 = 7ffd8e7055ee32be
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 10663f3fb86f1fb5
	setx	0x170d63a83c724ed2,%g7,%l0 ! %l0 = 170d63a83c724ed2
!	%l1 = 7ffd8e7055ee32be
	setx	0x0c043cd079c291c3,%g7,%l1 ! %l1 = 0c043cd079c291c3
!	Mem[0000000030141408] = ff867ab4, %l7 = ffffffffd7ce5c3d
	ldstuba	[%i5+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800040] = 34d10896, %l2 = 0000000019004a3a
	lduha	[%o3+0x040]%asi,%l2	! %l2 = 00000000000034d1

p0_label_49:
!	Mem[0000000010101408] = ff26b6e3, %l2 = 00000000000034d1
	lduwa	[%i4+%o4]0x88,%l2	! %l2 = 00000000ff26b6e3
!	Mem[0000000030001410] = b0ede7b7 0000e7ff, %l0 = 3c724ed2, %l1 = 79c291c3
	ldda	[%i0+%o5]0x89,%l0	! %l0 = 000000000000e7ff 00000000b0ede7b7
!	Mem[00000000100c1410] = ff00007a, %l6 = 000000000000bbe9
	lduwa	[%i3+%o5]0x80,%l6	! %l6 = 00000000ff00007a
!	Mem[00000000100c1400] = 65eb6ba0, %l1 = 00000000b0ede7b7
	lduha	[%i3+%g0]0x80,%l1	! %l1 = 00000000000065eb
!	Mem[000000001014142c] = 2302b6d6, %l6 = 00000000ff00007a
	ldswa	[%i5+0x02c]%asi,%l6	! %l6 = 000000002302b6d6
!	Mem[0000000010141410] = c90a45ff, %l6 = 000000002302b6d6
	lduwa	[%i5+%o5]0x88,%l6	! %l6 = 00000000c90a45ff
!	Mem[0000000010041400] = 67000000, %l7 = 00000000000000ff
	lduha	[%i1+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = 67068ab0, %l0 = 000000000000e7ff
	lduba	[%i5+%g0]0x88,%l0	! %l0 = 00000000000000b0
!	Mem[0000000010141408] = a000000000000000, %l0 = 00000000000000b0
	ldx	[%i5+%o4],%l0		! %l0 = a000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010141410] = ff450ac9
	stwa	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000

p0_label_50:
!	%l5 = 00000000bbe96d59, Mem[000000001004141a] = 2aeb61d1, %asi = 80
	stha	%l5,[%i1+0x01a]%asi	! Mem[0000000010041418] = 2aeb6d59
!	%l6 = 00000000c90a45ff, Mem[0000000010181428] = edcd77ac596de9bb, %asi = 80
	stxa	%l6,[%i6+0x028]%asi	! Mem[0000000010181428] = 00000000c90a45ff
!	Mem[0000000030041408] = e300e7b7, %l7 = 0000000000000000
	swapa	[%i1+%o4]0x81,%l7	! %l7 = 00000000e300e7b7
!	%l4 = ffffffffffffffff, Mem[0000000010181410] = ff5ad926
	stwa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffffff
!	%l3 = 00000000000000e3, Mem[0000000030101410] = 7a2b0000
	stha	%l3,[%i4+%o5]0x89	! Mem[0000000030101410] = 7a2b00e3
!	%l2 = 00000000ff26b6e3, Mem[0000000030001400] = 00000000000000f6
	stxa	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000ff26b6e3
!	Mem[0000000010181408] = e3000000, %l0 = a000000000000000
	ldstuba	[%i6+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	%f0  = ffefde09 b8900102, %l1 = 00000000000065eb
!	Mem[0000000030101400] = 0000bbe9d7ce5c3d
	stda	%f0,[%i4+%l1]ASI_PST16_S ! Mem[0000000030101400] = ffefbbe9b8900102
!	%l0 = 0000000000000000, Mem[0000000010141400] = b08a06670085872b
	stx	%l0,[%i5+%g0]		! Mem[0000000010141400] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00000000, %f12 = ffffffff
	lda	[%i5+%o5]0x80,%f12	! %f12 = 00000000

p0_label_51:
!	Mem[0000000010081410] = ffe70000, %l4 = ffffffffffffffff
	ldsha	[%i2+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041418] = 2aeb6d59c76395e5, %f8  = ff000000 e3b62637
	ldda	[%i1+0x018]%asi,%f8 	! %f8  = 2aeb6d59 c76395e5
!	Mem[0000000010101424] = 5f45a09f, %l5 = 00000000bbe96d59
	lduh	[%i4+0x024],%l5		! %l5 = 0000000000005f45
!	Mem[00000000100c142c] = 00000000, %l0 = 0000000000000000
	lduh	[%i3+0x02e],%l0		! %l0 = 0000000000000000
!	%l0 = 0000000000000000, %l7 = 00000000e300e7b7, %l4 = 0000000000000000
	subc	%l0,%l7,%l4		! %l4 = ffffffff1cff1849
!	%f19 = 41040bb3, %f27 = 00000000, %f22 = bbe96d59
	fdivs	%f19,%f27,%f22		! %f22 = 7f800000
!	Mem[00000000100c1424] = 3cbfd576, %l1 = 00000000000065eb
	ldsb	[%i3+0x025],%l1		! %l1 = ffffffffffffffbf
!	%f23 = ea6af128, %f17 = 05df1bf1
	fcmpes	%fcc0,%f23,%f17		! %fcc0 = 1
!	Mem[0000000010081410] = 7f000000ffe70000, %l6 = 00000000c90a45ff
	ldxa	[%i2+%o5]0x88,%l6	! %l6 = 7f000000ffe70000
!	Starting 10 instruction Store Burst
!	%f12 = 00000000 00000000, Mem[0000000030081410] = d29820ff 001885b8
	stda	%f12,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000 00000000

p0_label_52:
!	Mem[0000000010041404] = fc7c94ea, %l4 = ffffffff1cff1849
	swap	[%i1+0x004],%l4		! %l4 = 00000000fc7c94ea
!	%l5 = 0000000000005f45, Mem[0000000010001407] = 02116447
	stb	%l5,[%i0+0x007]		! Mem[0000000010001404] = 02116445
!	%f30 = fe060b24 ff867ab4, Mem[0000000010001410] = ffffffff ffffffff
	std	%f30,[%i0+%o5]	! Mem[0000000010001410] = fe060b24 ff867ab4
!	%l4 = 00000000fc7c94ea, Mem[0000000021800080] = 003d341e
	stb	%l4,[%o3+0x080]		! Mem[0000000021800080] = ea3d341e
!	%f6  = b5362b7c a67862fd, Mem[0000000030001410] = 0000e7ff b0ede7b7
	stda	%f6 ,[%i0+%o5]0x89	! Mem[0000000030001410] = b5362b7c a67862fd
!	%l0 = 0000000000000000, Mem[0000000030081410] = 00000000
	stba	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	%f2  = b0ede7b7, Mem[0000000030001400] = ff26b6e3
	sta	%f2 ,[%i0+%g0]0x89	! Mem[0000000030001400] = b0ede7b7
!	%l3 = 00000000000000e3, %l5 = 0000000000005f45, %y  = 7fffffff
	smul	%l3,%l5,%l0		! %l0 = 0000000000547a2f, %y = 00000000
!	Mem[0000000010101410] = 00000000, %l5 = 0000000000005f45
	swapa	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 9bde67b5, %l6 = 7f000000ffe70000
	ldsha	[%i4+%o4]0x89,%l6	! %l6 = 00000000000067b5

p0_label_53:
!	Mem[0000000010101428] = 4bcd767f, %l5 = 0000000000000000
	lduw	[%i4+0x028],%l5		! %l5 = 000000004bcd767f
!	Mem[0000000030081410] = 00000000, %l4 = 00000000fc7c94ea
	ldswa	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081430] = 000000e1b6a6bb80, %l5 = 000000004bcd767f
	ldxa	[%i2+0x030]%asi,%l5	! %l5 = 000000e1b6a6bb80
!	Mem[0000000030181410] = e3b626ff, %f2  = b0ede7b7
	lda	[%i6+%o5]0x89,%f2 	! %f2 = e3b626ff
!	Mem[0000000030181408] = ff000000ffe7edb0, %l5 = 000000e1b6a6bb80
	ldxa	[%i6+%o4]0x81,%l5	! %l5 = ff000000ffe7edb0
!	Mem[0000000021800080] = ea3d341e, %l4 = 0000000000000000
	ldsha	[%o3+0x080]%asi,%l4	! %l4 = ffffffffffffea3d
!	Mem[0000000030001400] = b7e7edb0, %l4 = ffffffffffffea3d
	ldsba	[%i0+%g0]0x81,%l4	! %l4 = ffffffffffffffb7
!	Mem[0000000030101400] = ffefbbe9 b8900102, %l2 = ff26b6e3, %l3 = 000000e3
	ldda	[%i4+%g0]0x81,%l2	! %l2 = 00000000ffefbbe9 00000000b8900102
!	Mem[0000000010041400] = 4918ff1c67000000, %f4  = 00000000 42ad2f47
	ldda	[%i1+%g0]0x88,%f4 	! %f4  = 4918ff1c 67000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000067b5, Mem[0000000010141408] = a000000000000000
	stxa	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000000067b5

p0_label_54:
!	%l4 = ffffffb7, %l5 = ffe7edb0, Mem[0000000010101408] = ff26b6e3 737907d2
	stda	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffffb7 ffe7edb0
!	%f3  = d2077973, %f25 = 06af2205
	fcmps	%fcc0,%f3 ,%f25		! %fcc0 = 1
!	%l3 = 00000000b8900102, Mem[0000000010101410] = 472fad42455f0000
	stxa	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000b8900102
!	%f19 = 41040bb3, Mem[0000000030101400] = e9bbefff
	sta	%f19,[%i4+%g0]0x89	! Mem[0000000030101400] = 41040bb3
!	%f27 = 00000000, Mem[00000000300c1400] = 65eb6ba0
	sta	%f27,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	%f24 = 3001e26e 06af2205, Mem[0000000030041410] = 00000000 3a000000
	stda	%f24,[%i1+%o5]0x89	! Mem[0000000030041410] = 3001e26e 06af2205
!	%l0 = 00547a2f, %l1 = ffffffbf, Mem[00000000100c1438] = 77d869f3 19142c96
	stda	%l0,[%i3+0x038]%asi	! Mem[00000000100c1438] = 00547a2f ffffffbf
!	%l5 = ff000000ffe7edb0, Mem[00000000211c0000] = 00007241
	sth	%l5,[%o2+%g0]		! Mem[00000000211c0000] = edb07241
!	%f8  = 2aeb6d59 c76395e5, Mem[0000000030041408] = 00000000 d4f2ffff
	stda	%f8 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 2aeb6d59 c76395e5
!	Starting 10 instruction Load Burst
!	Mem[0000000010181434] = d2077973, %l1 = ffffffffffffffbf
	ldsha	[%i6+0x034]%asi,%l1	! %l1 = ffffffffffffd207

p0_label_55:
!	Mem[0000000010181410] = ffffffff 19004a3a, %l0 = 00547a2f, %l1 = ffffd207
	ldda	[%i6+%o5]0x80,%l0	! %l0 = 00000000ffffffff 0000000019004a3a
!	Mem[0000000010141410] = b6bb9787 00000000, %l2 = ffefbbe9, %l3 = b8900102
	ldda	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000000 00000000b6bb9787
!	Mem[0000000030001408] = 2cfeffff, %l7 = 00000000e300e7b7
	lduwa	[%i0+%o4]0x89,%l7	! %l7 = 000000002cfeffff
!	Mem[0000000030001410] = b5362b7ca67862fd, %l0 = 00000000ffffffff
	ldxa	[%i0+%o5]0x89,%l0	! %l0 = b5362b7ca67862fd
!	Mem[0000000030081410] = 00000000, %l1 = 0000000019004a3a
	ldsba	[%i2+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001438] = b9c22738, %l7 = 000000002cfeffff
	ldsha	[%i0+0x038]%asi,%l7	! %l7 = ffffffffffffb9c2
!	Mem[0000000010081408] = ffffffff 7f76cd4b, %l0 = a67862fd, %l1 = 00000000
	ldda	[%i2+%o4]0x80,%l0	! %l0 = 00000000ffffffff 000000007f76cd4b
!	Mem[00000000300c1400] = 00000000, %l6 = 00000000000067b5
	ldsha	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081408] = 41ba9ce0, %l0 = 00000000ffffffff
	ldswa	[%i2+%o4]0x81,%l0	! %l0 = 0000000041ba9ce0
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 4764110200000000, %l2 = 0000000000000000, %l3 = 00000000b6bb9787
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l2,%l3	! %l3 = 4764110200000000

p0_label_56:
!	%l4 = ffffffffffffffb7, Mem[0000000010041420] = 38f8ca5c
	stw	%l4,[%i1+0x020]		! Mem[0000000010041420] = ffffffb7
!	%l2 = 0000000000000000, Mem[00000000300c1400] = 00000000
	stha	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	%l1 = 000000007f76cd4b, immed = fffffd45, %y  = 00000000
	udiv	%l1,-0x2bb,%l0		! %l0 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	%f8  = 2aeb6d59 c76395e5, Mem[00000000100c1418] = ffffffa0 646a0fe7
	std	%f8 ,[%i3+0x018]	! Mem[00000000100c1418] = 2aeb6d59 c76395e5
!	%l5 = ff000000ffe7edb0, immed = 0000004a, %y  = 00000000
	smul	%l5,0x04a,%l1		! %l1 = fffffffff90ab4e0, %y = ffffffff
!	%l4 = ffffffffffffffb7, %l2 = 0000000000000000, %y  = ffffffff
	umul	%l4,%l2,%l0		! %l0 = 0000000000000000, %y = 00000000
!	%l6 = 0000000000000000, Mem[00000000211c0000] = edb07241, %asi = 80
	stha	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00007241
!	%f8  = 2aeb6d59 c76395e5, %l0 = 0000000000000000
!	Mem[00000000300c1410] = 0000002900000010
	add	%i3,0x010,%g1
	stda	%f8,[%g1+%l0]ASI_PST16_S ! Mem[00000000300c1410] = 0000002900000010
!	Mem[0000000030001408] = fffffe2c, %l3 = 4764110200000000
	swapa	[%i0+%o4]0x81,%l3	! %l3 = 00000000fffffe2c
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010101400] = 3caa8f6b 240b06fe b7ffffff b0ede7ff
!	Mem[0000000010101410] = 020190b8 00000000 b5362b7c a67862fd
!	Mem[0000000010101420] = aca1a530 5f45a09f 4bcd767f ffffffff
!	Mem[0000000010101430] = 65eb6ba0 214d006f 09deefe5 91710aaf
	ldda	[%i4]ASI_BLK_PL,%f0	! Block Load from 0000000010101400

p0_label_57:
!	Mem[00000000300c1408] = d7ce5c3d, %l6 = 0000000000000000
	lduwa	[%i3+%o4]0x89,%l6	! %l6 = 00000000d7ce5c3d
!	Mem[0000000030041410] = 0522af06, %l3 = 00000000fffffe2c
	lduwa	[%i1+%o5]0x81,%l3	! %l3 = 000000000522af06
!	Mem[0000000030101408] = b567de9b, %l2 = 0000000000000000
	ldsha	[%i4+%o4]0x81,%l2	! %l2 = ffffffffffffb567
!	Mem[0000000030041410] = 0522af06, %l5 = ff000000ffe7edb0
	ldsha	[%i1+%o5]0x81,%l5	! %l5 = 0000000000000522
!	Mem[0000000030141400] = 064b1039, %l1 = fffffffff90ab4e0
	lduba	[%i5+%g0]0x81,%l1	! %l1 = 0000000000000006
!	Mem[0000000020800040] = 00ffa3d2, %l3 = 000000000522af06
	ldsh	[%o1+0x040],%l3		! %l3 = 00000000000000ff
!	Mem[00000000100c1408] = 3bc49137b608739a, %f18 = 00000000 41040bb3
	ldda	[%i3+%o4]0x88,%f18	! %f18 = 3bc49137 b608739a
!	Mem[0000000010101410] = 020190b8 00000000, %l0 = 00000000, %l1 = 00000006
	ldda	[%i4+%o5]0x80,%l0	! %l0 = 00000000020190b8 0000000000000000
!	Mem[00000000100c1428] = 00000000, %l7 = ffffffffffffb9c2
	ldsh	[%i3+0x02a],%l7		! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = bbe96d59, %l7 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l7	! %l7 = 00000000bbe96d59

p0_label_58:
!	%l2 = ffffffffffffb567, Mem[0000000010181410] = ffffffff
	stwa	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffb567
!	Mem[0000000030141410] = 7f000000, %l4 = ffffffffffffffb7
	ldstuba	[%i5+%o5]0x81,%l4	! %l4 = 0000007f000000ff
!	%l7 = 00000000bbe96d59, Mem[0000000030141408] = ff867ab4000000c0
	stxa	%l7,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000bbe96d59
!	%f16 = 65eb6ba0, %f24 = 3001e26e, %f17 = 05df1bf1
	fadds	%f16,%f24,%f17		! %f17 = 65eb6ba0
!	%f26 = 9618c101 00000000, %l3 = 00000000000000ff
!	Mem[0000000010041400] = 000000671cff1849
	stda	%f26,[%i1+%l3]ASI_PST32_P ! Mem[0000000010041400] = 9618c10100000000
!	Mem[00000000100c141c] = c76395e5, %l3 = 00000000000000ff
	swap	[%i3+0x01c],%l3		! %l3 = 00000000c76395e5
!	Mem[00000000201c0000] = fe2c2cc7, %l4 = 000000000000007f
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 000000fe000000ff
!	Mem[0000000010081400] = 3726b6e3, %l1 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l1	! %l1 = 000000003726b6e3
!	Mem[00000000100c1428] = 0000000000000000, %l3 = 00000000c76395e5, %l1 = 000000003726b6e3
	add	%i3,0x28,%g1
	casxa	[%g1]0x80,%l3,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 0000e7ff, %l0 = 00000000020190b8
	ldsha	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000

p0_label_59:
!	Mem[0000000030041408] = 596deb2a, %l6 = 00000000d7ce5c3d
	ldswa	[%i1+%o4]0x89,%l6	! %l6 = 00000000596deb2a
!	Mem[00000000211c0000] = 00007241, %l7 = 00000000bbe96d59
	ldub	[%o2+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000010001408] = 47641102, %f28 = 3bc49137
	lda	[%i0+%o4]0x80,%f28	! %f28 = 47641102
!	Mem[0000000010001410] = b47a86ff 240b06fe, %l2 = ffffb567, %l3 = c76395e5
	ldda	[%i0+%o5]0x88,%l2	! %l2 = 00000000240b06fe 00000000b47a86ff
!	Mem[0000000010001410] = fe060b24, %l6 = 00000000596deb2a
	lduwa	[%i0+%o5]0x80,%l6	! %l6 = 00000000fe060b24
!	Mem[0000000030101410] = 7a2b00e3, %l6 = 00000000fe060b24
	ldsha	[%i4+%o5]0x89,%l6	! %l6 = 00000000000000e3
!	Mem[0000000010101410] = b8900102, %l5 = 0000000000000522
	ldsba	[%i4+%o5]0x88,%l5	! %l5 = 0000000000000002
!	Mem[0000000021800180] = 29bea69f, %l4 = 00000000000000fe
	lduba	[%o3+0x180]%asi,%l4	! %l4 = 0000000000000029
!	Mem[0000000030081400] = 00000000 ac77cded, %l0 = 00000000, %l1 = 00000000
	ldda	[%i2+%g0]0x81,%l0	! %l0 = 0000000000000000 00000000ac77cded
!	Starting 10 instruction Store Burst
!	%l2 = 00000000240b06fe, Mem[0000000010041408] = 00000000f369d877
	stxa	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000240b06fe

p0_label_60:
!	%f18 = 3bc49137, %f30 = fe060b24
	fcmps	%fcc1,%f18,%f30		! %fcc1 = 2
!	%l0 = 0000000000000000, Mem[0000000030001408] = b2bc8e3700000000
	stxa	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000000000000000
!	%l6 = 00000000000000e3, Mem[0000000030041410] = 0522af06
	stba	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = e322af06
!	Mem[00000000211c0000] = 00007241, %l4 = 0000000000000029
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[00000000300c1408] = d7ce5c3d
	stba	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = d7ce5c00
!	%l5 = 0000000000000002, Mem[0000000010001410] = fe060b24
	stwa	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000002
!	%f18 = 3bc49137 b608739a, Mem[0000000010001408] = 02116447 00000000
	stda	%f18,[%i0+%o4]0x88	! Mem[0000000010001408] = 3bc49137 b608739a
!	%l6 = 00000000000000e3, Mem[0000000010141410] = 000000008797bbb6
	stxa	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000000000e3
!	%l0 = 0000000000000000, Mem[00000000201c0001] = ff2c2cc7
	stb	%l0,[%o0+0x001]		! Mem[00000000201c0000] = ff002cc7
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00000000, %l2 = 00000000240b06fe
	lduba	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000000

p0_label_61:
!	Mem[0000000030041408] = e59563c7596deb2a, %f10 = ffffffff 7f76cd4b
	ldda	[%i1+%o4]0x89,%f10	! %f10 = e59563c7 596deb2a
!	%l3 = 00000000b47a86ff, %l7 = 0000000000000000, %l3 = 00000000b47a86ff
	xnor	%l3,%l7,%l3		! %l3 = ffffffff4b857900
!	Mem[0000000030101400] = 020190b841040bb3, %f10 = e59563c7 596deb2a
	ldda	[%i4+%g0]0x89,%f10	! %f10 = 020190b8 41040bb3
!	Mem[00000000300c1408] = d7ce5c00, %l6 = 00000000000000e3
	ldswa	[%i3+%o4]0x89,%l6	! %l6 = ffffffffd7ce5c00
!	Mem[0000000030081410] = 00000000, %l3 = ffffffff4b857900
	lduha	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041408] = 596deb2a, %l6 = ffffffffd7ce5c00
	lduwa	[%i1+%o4]0x89,%l6	! %l6 = 00000000596deb2a
!	Mem[0000000030181410] = ff26b6e300000000, %f20 = ff000000 00000000
	ldda	[%i6+%o5]0x81,%f20	! %f20 = ff26b6e3 00000000
!	Mem[00000000211c0000] = ff007241, %l4 = 0000000000000000
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000030001400] = b0ede7b7, %l6 = 00000000596deb2a
	ldsha	[%i0+%g0]0x89,%l6	! %l6 = ffffffffffffe7b7
!	Starting 10 instruction Store Burst
!	%f30 = fe060b24, %f6  = fd6278a6, %f26 = 9618c101
	fsubs	%f30,%f6 ,%f26		! %f26 = fd9ad9f5

p0_label_62:
!	Code Fragment 3
p0_fragment_4:
!	%l0 = 0000000000000000
	setx	0x7bcc90f01c3d9742,%g7,%l0 ! %l0 = 7bcc90f01c3d9742
!	%l1 = 00000000ac77cded
	setx	0xd0be65684260c818,%g7,%l1 ! %l1 = d0be65684260c818
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7bcc90f01c3d9742
	setx	0x0baae9905657fbe6,%g7,%l0 ! %l0 = 0baae9905657fbe6
!	%l1 = d0be65684260c818
	setx	0xa7c11a4f82377bbb,%g7,%l1 ! %l1 = a7c11a4f82377bbb
!	%l0 = 5657fbe6, %l1 = 82377bbb, Mem[0000000030081408] = e09cba41 020190b8
	stda	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 5657fbe6 82377bbb
!	%f5  = b8900102, Mem[0000000010081410] = ffe70000
	sta	%f5 ,[%i2+%o5]0x88	! Mem[0000000010081410] = b8900102
!	%l1 = a7c11a4f82377bbb, Mem[0000000030101400] = 41040bb3
	stha	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = 41047bbb
!	%l7 = 0000000000000000, Mem[00000000100c1410] = ff00007a9bde67b5, %asi = 80
	stxa	%l7,[%i3+0x010]%asi	! Mem[00000000100c1410] = 0000000000000000
!	Mem[00000000300c1408] = 005cced7, %l5 = 0000000000000002
	swapa	[%i3+%o4]0x81,%l5	! %l5 = 00000000005cced7
!	%l6 = ffffffffffffe7b7, Mem[0000000030001400] = 00000000b0ede7b7
	stxa	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffffffffffe7b7
!	%f26 = fd9ad9f5, %f2  = ffe7edb0
	fcmpes	%fcc0,%f26,%f2 		! %fcc0 = 3
	membar	#Sync			! Added by membar checker (8)
!	%f28 = 47641102 b608739a, Mem[0000000010101400] = 6b8faa3c fe060b24
	stda	%f28,[%i4+%g0]0x88	! Mem[0000000010101400] = 47641102 b608739a
!	Starting 10 instruction Load Burst
!	%f11 = 41040bb3, %f9  = 30a5a1ac
	fsqrts	%f11,%f9 		! %f9  = 4037db9a

p0_label_63:
!	Mem[0000000030041400] = 596de9bb, %l7 = 0000000000000000
	lduba	[%i1+%g0]0x89,%l7	! %l7 = 00000000000000bb
!	Mem[0000000010181400] = 0000008b, %l0 = 0baae9905657fbe6
	lduba	[%i6+%g0]0x88,%l0	! %l0 = 000000000000008b
!	Mem[0000000030081408] = 82377bbb5657fbe6, %f2  = ffe7edb0 ffffffb7
	ldda	[%i2+%o4]0x89,%f2 	! %f2  = 82377bbb 5657fbe6
!	Mem[00000000100c1410] = 00000000, %l7 = 00000000000000bb
	lduwa	[%i3+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181410] = ffffb567, %l3 = 0000000000000000
	lduha	[%i6+%o5]0x80,%l3	! %l3 = 000000000000ffff
!	Mem[00000000100c1428] = 0000000000000000, %l4 = ffffffffffffff00
	ldx	[%i3+0x028],%l4		! %l4 = 0000000000000000
!	Mem[0000000030141408] = 00000000, %f3  = 5657fbe6
	lda	[%i5+%o4]0x81,%f3 	! %f3 = 00000000
!	Mem[0000000010141400] = 00000000, %l1 = a7c11a4f82377bbb
	lduwa	[%i5+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081430] = 000000e1, %l0 = 000000000000008b
	ldsba	[%i2+0x032]%asi,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Code Fragment 4
p0_fragment_5:
!	%l0 = 0000000000000000
	setx	0xaf06a087f8f3e46e,%g7,%l0 ! %l0 = af06a087f8f3e46e
!	%l1 = 0000000000000000
	setx	0xb8078bc7c82ef981,%g7,%l1 ! %l1 = b8078bc7c82ef981
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = af06a087f8f3e46e
	setx	0x393ab71825a8dcab,%g7,%l0 ! %l0 = 393ab71825a8dcab
!	%l1 = b8078bc7c82ef981
	setx	0x476bae97e986e9b4,%g7,%l1 ! %l1 = 476bae97e986e9b4

p0_label_64:
!	Mem[0000000010081400] = 00000000, %l0 = 393ab71825a8dcab
	ldstuba	[%i2+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030181408] = ff000000, %l3 = 000000000000ffff
	swapa	[%i6+%o4]0x81,%l3	! %l3 = 00000000ff000000
!	%f0  = fe060b24 6b8faa3c, %l3 = 00000000ff000000
!	Mem[00000000300c1400] = 0000000005df1bf1
	stda	%f0,[%i3+%l3]ASI_PST8_SL ! Mem[00000000300c1400] = 0000000005df1bf1
!	%l0 = 0000000000000000, Mem[0000000030081408] = 5657fbe6
	stha	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 56570000
!	%l2 = 00000000, %l3 = ff000000, Mem[0000000030041408] = 596deb2a e59563c7
	stda	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000 ff000000
!	%l5 = 00000000005cced7, Mem[0000000020800040] = 00ffa3d2
	sth	%l5,[%o1+0x040]		! Mem[0000000020800040] = ced7a3d2
!	%l2 = 0000000000000000, Mem[0000000030001400] = ffffe7b7
	stba	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffe700
!	Mem[000000001018140c] = 1db64a3a, %l5 = 00000000005cced7, %asi = 80
	swapa	[%i6+0x00c]%asi,%l5	! %l5 = 000000001db64a3a
!	%l4 = 0000000000000000, Mem[00000000100c1410] = 00000000
	stba	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001420] = 064b1039, %l5 = 000000001db64a3a
	ldsh	[%i0+0x020],%l5		! %l5 = 000000000000064b

p0_label_65:
!	Mem[0000000020800000] = ff5ed75b, %l1 = 476bae97e986e9b4
	ldsb	[%o1+0x001],%l1		! %l1 = 000000000000005e
!	Mem[0000000010041410] = fbd584b3 a67862fd, %l4 = 00000000, %l5 = 0000064b
	ldda	[%i1+%o5]0x88,%l4	! %l4 = 00000000a67862fd 00000000fbd584b3
!	Mem[0000000030081400] = edcd77ac00000000, %l7 = 0000000000000000
	ldxa	[%i2+%g0]0x89,%l7	! %l7 = edcd77ac00000000
!	Mem[0000000030141408] = 00000000, %f28 = 47641102
	lda	[%i5+%o4]0x89,%f28	! %f28 = 00000000
!	Mem[0000000010041438] = 26d95a00 ff26b6e3, %l2 = 00000000, %l3 = ff000000
	ldd	[%i1+0x038],%l2		! %l2 = 0000000026d95a00 00000000ff26b6e3
!	Mem[0000000010001430] = 6de9520c, %l2 = 0000000026d95a00
	ldsh	[%i0+0x030],%l2		! %l2 = 0000000000006de9
!	Mem[0000000010101438] = 09deefe5 91710aaf, %l2 = 00006de9, %l3 = ff26b6e3
	ldd	[%i4+0x038],%l2		! %l2 = 0000000009deefe5 0000000091710aaf
!	Mem[00000000201c0000] = ff002cc7, %l1 = 000000000000005e
	ldsb	[%o0+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000030001408] = 00000000, %l3 = 0000000091710aaf
	lduha	[%i0+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000a67862fd, Mem[0000000010101410] = b8900102
	stha	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = b89062fd

p0_label_66:
!	%f13 = a06beb65, Mem[0000000010041438] = 26d95a00
	sta	%f13,[%i1+0x038]%asi	! Mem[0000000010041438] = a06beb65
!	Mem[0000000010041419] = 2aeb6d59, %l6 = ffffffffffffe7b7
	ldstuba	[%i1+0x019]%asi,%l6	! %l6 = 000000eb000000ff
!	%l3 = 0000000000000000, Mem[0000000010181400] = 0000008b
	stha	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	Mem[00000000201c0001] = ff002cc7, %l0 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	%l0 = 00000000, %l1 = ffffffff, Mem[00000000300c1400] = 00000000 05df1bf1
	stda	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000 ffffffff
!	%l7 = edcd77ac00000000, Mem[0000000030041408] = ff00000000000000
	stxa	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = edcd77ac00000000
!	Mem[00000000100c1408] = b608739a, %l3 = 0000000000000000
	ldstuba	[%i3+%o4]0x88,%l3	! %l3 = 0000009a000000ff
!	Mem[0000000030001410] = fd6278a6, %l0 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l0	! %l0 = 000000fd000000ff
!	%f8  = 9fa0455f 4037db9a, Mem[0000000010141400] = 00000000 00000000
	stda	%f8 ,[%i5+%g0]0x80	! Mem[0000000010141400] = 9fa0455f 4037db9a
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00000051, %l7 = edcd77ac00000000
	lduba	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000051

p0_label_67:
!	%l1 = ffffffffffffffff, imm = 000000000000007d, %l5 = 00000000fbd584b3
	sub	%l1,0x07d,%l5		! %l5 = ffffffffffffff82
!	Mem[0000000030081410] = 00000000, %l3 = 000000000000009a
	ldsha	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001400] = ffffe700, %l1 = ffffffffffffffff
	lduha	[%i0+%g0]0x89,%l1	! %l1 = 000000000000e700
!	Mem[00000000100c1400] = 65eb6ba0, %l3 = 0000000000000000
	ldsha	[%i3+%g0]0x80,%l3	! %l3 = 00000000000065eb
!	Mem[0000000010001408] = 3bc49137 b608739a, %l0 = 000000fd, %l1 = 0000e700
	ldda	[%i0+%o4]0x88,%l0	! %l0 = 00000000b608739a 000000003bc49137
!	Mem[0000000010141400] = 9fa0455f, %l7 = 0000000000000051
	ldswa	[%i5+%g0]0x80,%l7	! %l7 = ffffffff9fa0455f
!	Mem[0000000021800140] = 84b45a3c, %l6 = 00000000000000eb
	lduba	[%o3+0x140]%asi,%l6	! %l6 = 0000000000000084
!	Mem[00000000100c1400] = 65eb6ba0, %l7 = ffffffff9fa0455f
	ldsha	[%i3+%g0]0x80,%l7	! %l7 = 00000000000065eb
!	Mem[00000000300c1400] = 00000000, %l4 = 00000000a67862fd
	lduha	[%i3+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 00000002, %l1 = 000000003bc49137
	ldsha	[%i0+%o5]0x80,%l1	! %l1 = 0000000000000000

p0_label_68:
!	%l3 = 00000000000065eb, Mem[0000000030141400] = 064b1039
	stba	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = eb4b1039
!	Mem[0000000010141430] = bbb4aac3ee1c5974, %l5 = ffffffffffffff82, %l4 = 0000000000000000
	add	%i5,0x30,%g1
	casxa	[%g1]0x80,%l5,%l4	! %l4 = bbb4aac3ee1c5974
!	%f4  = 00000000 b8900102, Mem[0000000030101408] = 9bde67b5 a0777a28
	stda	%f4 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 b8900102
!	%l5 = ffffffffffffff82, Mem[0000000010181410] = ffffb567
	stha	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = ff82b567
!	%l6 = 0000000000000084, Mem[0000000010081410] = 020190b8
	stha	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 008490b8
!	%l4 = ee1c5974, %l5 = ffffff82, Mem[0000000010041418] = 2aff6d59 c76395e5
	stda	%l4,[%i1+0x018]%asi	! Mem[0000000010041418] = ee1c5974 ffffff82
!	Mem[0000000030001410] = b5362b7ca67862ff, %l4 = bbb4aac3ee1c5974
	ldxa	[%i0+%o5]0x89,%l4	! %l4 = b5362b7ca67862ff
!	Mem[00000000201c0001] = ffff2cc7, %l1 = 0000000000000000
	ldstub	[%o0+0x001],%l1		! %l1 = 000000ff000000ff
!	%l2 = 0000000009deefe5, Mem[00000000300c1410] = 29000000
	stba	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 290000e5
!	Starting 10 instruction Load Burst
!	Mem[000000001008143c] = 259c005a, %l1 = 00000000000000ff
	ldsb	[%i2+0x03e],%l1		! %l1 = 0000000000000000

p0_label_69:
!	Mem[00000000100c1400] = 65eb6ba0, %l5 = ffffffffffffff82
	lduwa	[%i3+%g0]0x80,%l5	! %l5 = 0000000065eb6ba0
!	Code Fragment 4
p0_fragment_6:
!	%l0 = 00000000b608739a
	setx	0x5dac7d6fb0153233,%g7,%l0 ! %l0 = 5dac7d6fb0153233
!	%l1 = 0000000000000000
	setx	0xef92933fcf68e409,%g7,%l1 ! %l1 = ef92933fcf68e409
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5dac7d6fb0153233
	setx	0xa1d6fc3f835aeb2c,%g7,%l0 ! %l0 = a1d6fc3f835aeb2c
!	%l1 = ef92933fcf68e409
	setx	0xf7334e2fcddfc3cd,%g7,%l1 ! %l1 = f7334e2fcddfc3cd
!	Mem[0000000010001408] = b608739a, %l6 = 0000000000000084
	lduha	[%i0+%o4]0x88,%l6	! %l6 = 000000000000739a
!	Mem[00000000300c1408] = 020190b8 02000000, %l2 = 09deefe5, %l3 = 000065eb
	ldda	[%i3+%o4]0x89,%l2	! %l2 = 0000000002000000 00000000020190b8
!	Mem[0000000030101400] = bb7b0441, %l7 = 00000000000065eb
	ldsha	[%i4+%g0]0x81,%l7	! %l7 = ffffffffffffbb7b
!	Mem[0000000030001408] = 00000000, %l5 = 0000000065eb6ba0
	lduwa	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141400] = 39104beb, %l7 = ffffffffffffbb7b
	ldsba	[%i5+%g0]0x89,%l7	! %l7 = ffffffffffffffeb
!	Mem[00000000300c1400] = 00000000, %l4 = b5362b7ca67862ff
	lduwa	[%i3+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041420] = ffffffb7000000f6, %f6  = fd6278a6 7c2b36b5
	ldd	[%i1+0x020],%f6 	! %f6  = ffffffb7 000000f6
!	Starting 10 instruction Store Burst
!	%f2  = 82377bbb, Mem[0000000030101408] = 020190b8
	sta	%f2 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 82377bbb

p0_label_70:
!	Mem[00000000300c1410] = e5000029, %l0 = a1d6fc3f835aeb2c
	swapa	[%i3+%o5]0x81,%l0	! %l0 = 00000000e5000029
!	%l0 = e5000029, %l1 = cddfc3cd, Mem[00000000100c1428] = 00000000 00000000
	stda	%l0,[%i3+0x028]%asi	! Mem[00000000100c1428] = e5000029 cddfc3cd
!	Mem[0000000010181410] = 67b582ff, %l4 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[00000000100c1410] = 00000000
	stwa	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	%l6 = 000000000000739a, Mem[00000000100c1408] = 3bc49137b60873ff
	stxa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000000000739a
!	Mem[0000000030101400] = 41047bbb, %l4 = 00000000000000ff
	ldstuba	[%i4+%g0]0x89,%l4	! %l4 = 000000bb000000ff
!	Mem[0000000030181408] = ffff0000, %l2 = 0000000002000000
	ldstuba	[%i6+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101430] = 65eb6ba0, %l2 = 0000000000000000, %asi = 80
	swapa	[%i4+0x030]%asi,%l2	! %l2 = 0000000065eb6ba0
!	Mem[0000000030041400] = bbe96d59, %l0 = 00000000e5000029
	ldstuba	[%i1+%g0]0x81,%l0	! %l0 = 000000bb000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000002ff867ab4, %l5 = 0000000000000000
	ldxa	[%i0+%o5]0x80,%l5	! %l5 = 00000002ff867ab4

p0_label_71:
!	Mem[00000000100c142c] = cddfc3cd, %l4 = 00000000000000bb
	lduba	[%i3+0x02d]%asi,%l4	! %l4 = 00000000000000df
!	%l5 = 00000002ff867ab4, %l7 = ffffffffffffffeb, %l4 = 00000000000000df
	andn	%l5,%l7,%l4		! %l4 = 0000000000000014
!	Mem[0000000010101400] = 9a7308b6, %l6 = 000000000000739a
	lduha	[%i4+%g0]0x80,%l6	! %l6 = 0000000000009a73
!	Mem[00000000100c1408] = 0000739a, %l4 = 0000000000000014
	lduha	[%i3+%o4]0x88,%l4	! %l4 = 000000000000739a
!	Mem[00000000100c1408] = 0000739a, %l1 = f7334e2fcddfc3cd
	lduha	[%i3+%o4]0x88,%l1	! %l1 = 000000000000739a
!	Mem[0000000010141408] = 00000000 000067b5, %l4 = 0000739a, %l5 = ff867ab4
	ldda	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000 00000000000067b5
!	%l3 = 00000000020190b8, imm = ffffffffffffffbb, %l4 = 0000000000000000
	xor	%l3,-0x045,%l4		! %l4 = fffffffffdfe6f03
!	Mem[0000000010041408] = 00000000, %l0 = 00000000000000bb
	lduha	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081408] = 56570000, %f14 = af0a7191
	lda	[%i2+%o4]0x89,%f14	! %f14 = 56570000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = b608739a, %l6 = 0000000000009a73
	ldstuba	[%i0+%o4]0x88,%l6	! %l6 = 0000009a000000ff

p0_label_72:
!	%l4 = fffffffffdfe6f03, Mem[00000000300c1408] = 020190b802000000
	stxa	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = fffffffffdfe6f03
!	Mem[0000000030081408] = 00005756, %l2 = 0000000065eb6ba0
	ldstuba	[%i2+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000021800101] = 3b19d236, %l3 = 00000000020190b8
	ldstub	[%o3+0x101],%l3		! %l3 = 00000019000000ff
!	%l0 = 0000000000000000, Mem[000000001014141a] = 5590ff9d
	stb	%l0,[%i5+0x01a]		! Mem[0000000010141418] = 5590009d
!	%f22 = 7f800000, Mem[00000000100c1408] = 9a730000
	sta	%f22,[%i3+%o4]0x80	! Mem[00000000100c1408] = 7f800000
!	%f10 = 020190b8, Mem[0000000010001408] = b60873ff
	sta	%f10,[%i0+%o4]0x88	! Mem[0000000010001408] = 020190b8
!	%l3 = 0000000000000019, %l7 = ffffffffffffffeb, %l7 = ffffffffffffffeb
	subc	%l3,%l7,%l7		! %l7 = 000000000000002e
!	Mem[0000000010041410] = a67862fd, %l6 = 000000000000009a
	ldstuba	[%i1+%o5]0x88,%l6	! %l6 = 000000fd000000ff
!	Mem[0000000030041400] = ffe96d59, %l7 = 000000000000002e
	swapa	[%i1+%g0]0x81,%l7	! %l7 = 00000000ffe96d59
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000000, %l4 = fffffffffdfe6f03
	lduha	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000000

p0_label_73:
!	%l4 = 0000000000000000, %l5 = 00000000000067b5, %l6 = 00000000000000fd
	udivx	%l4,%l5,%l6		! %l6 = 0000000000000000
!	Mem[00000000201c0000] = ffff2cc7, %l1 = 000000000000739a
	ldsha	[%o0+0x000]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000100c1408] = 7f800000, %l3 = 0000000000000019
	ldswa	[%i3+%o4]0x80,%l3	! %l3 = 000000007f800000
!	Mem[0000000010041418] = ee1c5974 ffffff82, %l4 = 00000000, %l5 = 000067b5
	ldda	[%i1+0x018]%asi,%l4	! %l4 = 00000000ee1c5974 00000000ffffff82
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000010181400] = 00000000 000000ff ff0000e3 005cced7
!	Mem[0000000010181410] = ff82b567 19004a3a e59563c7 f79e9e3d
!	Mem[0000000010181420] = 962c1419 f369d877 00000000 c90a45ff
!	Mem[0000000010181430] = 000000e3 d2077973 5aa5c652 5f28aa86
	ldda	[%i6]ASI_BLK_P,%f0	! Block Load from 0000000010181400
!	Mem[0000000020800040] = ced7a3d2, %l5 = 00000000ffffff82
	ldsb	[%o1+0x041],%l5		! %l5 = ffffffffffffffd7
!	Mem[00000000300c1408] = 036ffefd, %l5 = ffffffffffffffd7
	ldsha	[%i3+%o4]0x81,%l5	! %l5 = 000000000000036f
!	Mem[0000000010141430] = bbb4aac3ee1c5974, %f28 = 00000000 b608739a
	ldd	[%i5+0x030],%f28	! %f28 = bbb4aac3 ee1c5974
!	Mem[0000000010081410] = b8908400, %l6 = 0000000000000000
	lduha	[%i2+%o5]0x88,%l6	! %l6 = 0000000000008400
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000036f, Mem[0000000010101400] = 47641102b608739a
	stxa	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000000000036f

p0_label_74:
!	Mem[0000000010141424] = 381bddff, %l0 = 0000000000000000, %asi = 80
	swapa	[%i5+0x024]%asi,%l0	! %l0 = 00000000381bddff
!	%f28 = bbb4aac3 ee1c5974, Mem[0000000010081408] = ffffffff 7f76cd4b
	stda	%f28,[%i2+%o4]0x80	! Mem[0000000010081408] = bbb4aac3 ee1c5974
!	%l2 = 0000000000000000, Mem[0000000020800040] = ced7a3d2, %asi = 80
	stba	%l2,[%o1+0x040]%asi	! Mem[0000000020800040] = 00d7a3d2
!	Mem[00000000300c1400] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041410] = 06af22e3, %l1 = ffffffffffffffff
	swapa	[%i1+%o5]0x89,%l1	! %l1 = 0000000006af22e3
!	Mem[0000000010141410] = 00000000, %l3 = 000000007f800000
	ldstuba	[%i5+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101408] = bb7b3782, %l3 = 0000000000000000
	swapa	[%i4+%o4]0x89,%l3	! %l3 = 00000000bb7b3782
!	%l0 = 00000000381bddff, %l7 = 00000000ffe96d59, %l7 = 00000000ffe96d59
	orn	%l0,%l7,%l7		! %l7 = ffffffff381fdfff
	membar	#Sync			! Added by membar checker (10)
!	%f20 = ff26b6e3 00000000, Mem[0000000010181408] = e30000ff d7ce5c00
	stda	%f20,[%i6+%o4]0x88	! Mem[0000000010181408] = ff26b6e3 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = fd6290b8, %l4 = 00000000ee1c5974
	lduwa	[%i4+%o5]0x80,%l4	! %l4 = 00000000fd6290b8

p0_label_75:
!	Mem[0000000030181410] = ff26b6e3, %l2 = 0000000000000000
	ldsha	[%i6+%o5]0x81,%l2	! %l2 = ffffffffffffff26
!	Mem[0000000030141408] = 00000000, %l4 = 00000000fd6290b8
	lduha	[%i5+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = 5f45a09f, %l0 = 00000000381bddff
	ldsha	[%i5+%g0]0x88,%l0	! %l0 = ffffffffffffa09f
!	Mem[0000000010101420] = aca1a5305f45a09f, %f16 = 65eb6ba0 65eb6ba0
	ldda	[%i4+0x020]%asi,%f16	! %f16 = aca1a530 5f45a09f
!	Mem[0000000010141400] = 5f45a09f, %f30 = fe060b24
	lda	[%i5+%g0]0x88,%f30	! %f30 = 5f45a09f
!	Mem[000000001000141c] = 3649d611, %l7 = ffffffff381fdfff
	lduw	[%i0+0x01c],%l7		! %l7 = 000000003649d611
!	Mem[0000000030141408] = 00000000, %l4 = 0000000000000000
	lduwa	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l5 = 000000000000036f
	lduwa	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081410] = 008490b8, %l6 = 0000000000008400
	lduha	[%i2+%o5]0x80,%l6	! %l6 = 0000000000000084
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010101400] = 0000036f 00000000
	stda	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000 00000000

p0_label_76:
!	%l3 = 00000000bb7b3782, Mem[0000000010001400] = ff00ffff02116445
	stxa	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000bb7b3782
!	Mem[00000000100c141b] = 2aeb6d59, %l4 = 0000000000000000
	ldstuba	[%i3+0x01b]%asi,%l4	! %l4 = 00000059000000ff
!	Mem[000000001008141c] = 77e0cabb, %l3 = 00000000bb7b3782
	swap	[%i2+0x01c],%l3		! %l3 = 0000000077e0cabb
!	%l5 = 0000000000000000, Mem[0000000010101400] = 0000000000000000
	stxa	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000000000000000
!	%f15 = 5f28aa86, %f28 = bbb4aac3
	fcmpes	%fcc3,%f15,%f28		! %fcc3 = 2
!	Mem[0000000030181410] = e3b626ff, %l2 = ffffffffffffff26
	swapa	[%i6+%o5]0x89,%l2	! %l2 = 00000000e3b626ff
!	%f4  = ff82b567 19004a3a, Mem[0000000010041400] = 9618c101 00000000
	stda	%f4 ,[%i1+%g0]0x80	! Mem[0000000010041400] = ff82b567 19004a3a
!	%l0 = ffffffffffffa09f, %l7 = 000000003649d611, %l1 = 0000000006af22e3
	sdivx	%l0,%l7,%l1		! %l1 = 0000000000000000
!	%f28 = bbb4aac3, Mem[0000000010041410] = ff6278a6
	sta	%f28,[%i1+%o5]0x80	! Mem[0000000010041410] = bbb4aac3
!	Starting 10 instruction Load Burst
!	%f5  = 19004a3a, %f22 = 7f800000
	fcmps	%fcc1,%f5 ,%f22		! %fcc1 = 1

p0_label_77:
!	Mem[00000000100c1410] = 00000000, %l6 = 0000000000000084
	ldsba	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001408] = 020190b8, %f15 = 5f28aa86
	lda	[%i0+%o4]0x88,%f15	! %f15 = 020190b8
!	Mem[0000000010041408] = 00000000, %f26 = fd9ad9f5
	lda	[%i1+0x008]%asi,%f26	! %f26 = 00000000
!	%l4 = 0000000000000059, Mem[0000000030141410] = ff2098d2000000ff
	stxa	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000000000059
!	Mem[0000000010001410] = b47a86ff02000000, %f20 = ff26b6e3 00000000
	ldda	[%i0+%o5]0x88,%f20	! %f20 = b47a86ff 02000000
!	Mem[0000000010141400] = 9fa0455f, %l0 = ffffffffffffa09f
	ldsha	[%i5+%g0]0x80,%l0	! %l0 = ffffffffffff9fa0
!	Mem[0000000010001400] = 00000000, %f27 = 00000000
	lda	[%i0+%g0]0x80,%f27	! %f27 = 00000000
!	Mem[0000000030141400] = 3a4ab61d39104beb, %l1 = 0000000000000000
	ldxa	[%i5+%g0]0x89,%l1	! %l1 = 3a4ab61d39104beb
!	Mem[0000000010141408] = 00000000, %l7 = 000000003649d611
	lduwa	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffff9fa0, Mem[0000000030041410] = ffffffff6ee20130
	stxa	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = ffffffffffff9fa0

p0_label_78:
!	Mem[0000000010001408] = 020190b8, %l0 = ffffffffffff9fa0
	swapa	[%i0+%o4]0x88,%l0	! %l0 = 00000000020190b8
!	%l2 = 00000000e3b626ff, Mem[0000000030181400] = fc80b5d300000051
	stxa	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000e3b626ff
!	%l3 = 0000000077e0cabb, Mem[0000000030001400] = ffffe700
	stha	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffcabb
!	Mem[0000000030041410] = ffffffff, %l5 = 0000000000000000
	swapa	[%i1+%o5]0x81,%l5	! %l5 = 00000000ffffffff
!	%l7 = 0000000000000000, Mem[0000000030001408] = 00000000
	stba	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	%l0 = 00000000020190b8, Mem[0000000010001410] = b47a86ff02000000
	stxa	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000020190b8
!	%l1 = 3a4ab61d39104beb, Mem[0000000010001420] = 064b1039b04962fd, %asi = 80
	stxa	%l1,[%i0+0x020]%asi	! Mem[0000000010001420] = 3a4ab61d39104beb
!	%l0 = 020190b8, %l1 = 39104beb, Mem[0000000010041410] = c3aab4bb fbd584b3
	stda	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 020190b8 39104beb
!	%l2 = 00000000e3b626ff, Mem[000000001004142f] = ac77cded
	stb	%l2,[%i1+0x02f]		! Mem[000000001004142c] = ac77cdff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = a09fffff 3791c43b, %l6 = 00000000, %l7 = 00000000
	ldda	[%i0+%o4]0x80,%l6	! %l6 = 00000000a09fffff 000000003791c43b

p0_label_79:
!	Mem[00000000100c1410] = 00000000, %l1 = 3a4ab61d39104beb
	lduwa	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101408] = b7ffffff, %l0 = 00000000020190b8
	lduwa	[%i4+%o4]0x80,%l0	! %l0 = 00000000b7ffffff
!	Mem[0000000030041400] = 2e000000, %l5 = 00000000ffffffff
	lduha	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141400] = 5f45a09f, %l7 = 000000003791c43b
	ldsha	[%i5+%g0]0x88,%l7	! %l7 = ffffffffffffa09f
!	Mem[0000000030081408] = 82377bbb 565700ff, %l2 = e3b626ff, %l3 = 77e0cabb
	ldda	[%i2+%o4]0x89,%l2	! %l2 = 00000000565700ff 0000000082377bbb
!	Mem[0000000030081408] = 565700ff, %l7 = ffffffffffffa09f
	ldsba	[%i2+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181400] = 00000000, %l0 = 00000000b7ffffff
	ldsha	[%i6+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%l0 = 0000000000000000, %l5 = 0000000000000000, %l5 = 0000000000000000
	sub	%l0,%l5,%l5		! %l5 = 0000000000000000
!	Mem[000000001010140c] = b0ede7ff, %l3 = 0000000082377bbb
	lduh	[%i4+0x00e],%l3		! %l3 = 000000000000e7ff
!	Starting 10 instruction Store Burst
!	Mem[0000000020800000] = ff5ed75b, %l1 = 0000000000000000
	ldstuba	[%o1+0x000]%asi,%l1	! %l1 = 000000ff000000ff

p0_label_80:
!	%l2 = 565700ff, %l3 = 0000e7ff, Mem[0000000030041408] = 00000000 ac77cded
	stda	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 565700ff 0000e7ff
!	%l0 = 0000000000000000, Mem[0000000010181408] = 00000000e3b626ff
	stxa	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000000000000
!	%f17 = 5f45a09f, %f6  = e59563c7, %f29 = ee1c5974
	fadds	%f17,%f6 ,%f29		! %f29 = e5955d9a
!	Mem[0000000010041434] = 287a77a0, %l3 = 000000000000e7ff
	swap	[%i1+0x034],%l3		! %l3 = 00000000287a77a0
!	Mem[0000000010081404] = e800c6c2, %l7 = ffffffffffffffff, %asi = 80
	swapa	[%i2+0x004]%asi,%l7	! %l7 = 00000000e800c6c2
!	%l4 = 00000059, %l5 = 00000000, Mem[0000000010001428] = 00000000 00000029
	std	%l4,[%i0+0x028]		! Mem[0000000010001428] = 00000059 00000000
!	Mem[0000000010001410] = 020190b8, %l1 = 00000000000000ff
	ldstuba	[%i0+%o5]0x88,%l1	! %l1 = 000000b8000000ff
!	Mem[0000000010141400] = 5f45a09f, %l5 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l5	! %l5 = 000000005f45a09f
!	Mem[0000000010081400] = ff000000, %l4 = 0000000000000059
	ldstuba	[%i2+%g0]0x80,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 0000002e, %l1 = 00000000000000b8
	ldsha	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000000

p0_label_81:
!	Mem[0000000010081430] = 000000e1, %f1  = 000000ff
	lda	[%i2+0x030]%asi,%f1 	! %f1 = 000000e1
!	Mem[0000000030101400] = 020190b841047bff, %f8  = 962c1419 f369d877
	ldda	[%i4+%g0]0x89,%f8 	! %f8  = 020190b8 41047bff
!	Mem[0000000010081408] = bbb4aac3ee1c5974, %f14 = 5aa5c652 020190b8
	ldda	[%i2+%o4]0x80,%f14	! %f14 = bbb4aac3 ee1c5974
!	Mem[0000000030041400] = 0000002e0000007a, %l6 = 00000000a09fffff
	ldxa	[%i1+%g0]0x81,%l6	! %l6 = 0000002e0000007a
!	Mem[0000000010001418] = d3110ddb, %l0 = 0000000000000000
	lduha	[%i0+0x01a]%asi,%l0	! %l0 = 0000000000000ddb
!	Mem[0000000010141408] = 00000000, %l0 = 0000000000000ddb
	ldsba	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[000000001000141c] = 3649d611, %l2 = 00000000565700ff
	ldswa	[%i0+0x01c]%asi,%l2	! %l2 = 000000003649d611
!	Mem[0000000010181408] = 00000000, %l1 = 0000000000000000
	lduwa	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101418] = b5362b7c, %l6 = 0000002e0000007a
	lduw	[%i4+0x018],%l6		! %l6 = 00000000b5362b7c
!	Starting 10 instruction Store Burst
!	%l5 = 000000005f45a09f, Mem[00000000201c0001] = ffff2cc7
	stb	%l5,[%o0+0x001]		! Mem[00000000201c0000] = ff9f2cc7

p0_label_82:
!	%l0 = 00000000, %l1 = 00000000, Mem[00000000100c1408] = 7f800000 00000000
	std	%l0,[%i3+%o4]		! Mem[00000000100c1408] = 00000000 00000000
!	%l4 = 00000000000000ff, Mem[0000000030041400] = 0000002e0000007a
	stxa	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000000000ff
!	%l6 = b5362b7c, %l7 = e800c6c2, Mem[0000000030101410] = e3002b7a ada8585e
	stda	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = b5362b7c e800c6c2
!	%l1 = 0000000000000000, Mem[0000000010041438] = a06beb65
	stw	%l1,[%i1+0x038]		! Mem[0000000010041438] = 00000000
!	%l4 = 00000000000000ff, Mem[0000000030041410] = 00000000
	stba	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff
!	%f13 = d2077973, Mem[0000000010181400] = 00000000
	sta	%f13,[%i6+%g0]0x80	! Mem[0000000010181400] = d2077973
!	%l4 = 00000000000000ff, Mem[00000000300c1400] = ff000000ffffffff
	stxa	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000010081410] = 008490b80000007f
	stx	%l0,[%i2+%o5]		! Mem[0000000010081410] = 0000000000000000
!	Mem[00000000100c1400] = a06beb65, %l7 = 00000000e800c6c2
	ldsha	[%i3+%g0]0x88,%l7	! %l7 = ffffffffffffeb65
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ff9f2cc7, %l2 = 000000003649d611
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = ffffffffffffff9f

p0_label_83:
!	Mem[0000000030181408] = ffff00ff, %f3  = 005cced7
	lda	[%i6+%o4]0x89,%f3 	! %f3 = ffff00ff
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010001400] = 00000000 bb7b3782 a09fffff 3791c43b
!	Mem[0000000010001410] = ff900102 00000000 d3110ddb 3649d611
!	Mem[0000000010001420] = 3a4ab61d 39104beb 00000059 00000000
!	Mem[0000000010001430] = 6de9520c ba4da1cf b9c22738 0968dd83
	ldda	[%i0]ASI_BLK_PL,%f16	! Block Load from 0000000010001400
!	Mem[0000000030101400] = 41047bff, %l1 = 0000000000000000
	lduha	[%i4+%g0]0x89,%l1	! %l1 = 0000000000007bff
!	Mem[0000000010001408] = ffff9fa0, %l7 = ffffffffffffeb65
	lduba	[%i0+%o4]0x88,%l7	! %l7 = 00000000000000a0
!	Mem[0000000030081410] = 00000000, %l0 = 0000000000000000
	ldsba	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000
!	%f4  = ff82b567, %f4  = ff82b567, %f8  = 020190b8
	fadds	%f4 ,%f4 ,%f8 		! %f8  = ffc2b567
!	Mem[0000000030001400] = ffffcabb, %l6 = 00000000b5362b7c
	lduha	[%i0+%g0]0x89,%l6	! %l6 = 000000000000cabb
!	Mem[0000000010001408] = a09fffff, %f15 = ee1c5974
	lda	[%i0+%o4]0x80,%f15	! %f15 = a09fffff
!	Mem[0000000030141410] = 00000059, %l0 = 0000000000000000
	lduwa	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000059
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000a0, Mem[0000000010141405] = 4037db9a
	stb	%l7,[%i5+0x005]		! Mem[0000000010141404] = 40a0db9a

p0_label_84:
!	Mem[0000000030081410] = 00000000, %l1 = 0000000000007bff
	ldstuba	[%i2+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%l5 = 000000005f45a09f, Mem[0000000010101408] = ffffffb7
	stwa	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = 5f45a09f
!	%l7 = 00000000000000a0, Mem[000000001010141c] = a67862fd, %asi = 80
	stwa	%l7,[%i4+0x01c]%asi	! Mem[000000001010141c] = 000000a0
!	Mem[00000000300c1410] = 835aeb2c, %l3 = 00000000287a77a0
	swapa	[%i3+%o5]0x81,%l3	! %l3 = 00000000835aeb2c
!	Mem[0000000010101413] = fd6290b8, %l1 = 0000000000000000
	ldstuba	[%i4+0x013]%asi,%l1	! %l1 = 000000b8000000ff
!	%l3 = 00000000835aeb2c, Mem[00000000100c1410] = 00000000
	stwa	%l3,[%i3+%o5]0x80	! Mem[00000000100c1410] = 835aeb2c
!	Mem[00000000300c1408] = 036ffefd, %l0 = 0000000000000059
	swapa	[%i3+%o4]0x81,%l0	! %l0 = 00000000036ffefd
!	Mem[0000000010001408] = a09fffff, %l2 = ffffffffffffff9f
	ldstuba	[%i0+0x008]%asi,%l2	! %l2 = 000000a0000000ff
!	%l6 = 000000000000cabb, Mem[0000000010181400] = 737907d2
	stha	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 7379cabb
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00000000 00000000, %l6 = 0000cabb, %l7 = 000000a0
	ldda	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000 0000000000000000

p0_label_85:
!	Mem[0000000010141410] = ff000000, %l5 = 000000005f45a09f
	lduha	[%i5+%o5]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030001400] = ffffcabb, %l4 = 00000000000000ff
	lduha	[%i0+%g0]0x89,%l4	! %l4 = 000000000000cabb
!	Mem[0000000010101408] = 9fa0455f, %l6 = 0000000000000000
	ldsba	[%i4+%o4]0x80,%l6	! %l6 = ffffffffffffff9f
!	Mem[0000000010101410] = 00000000ff9062fd, %f12 = 000000e3 d2077973
	ldda	[%i4+%o5]0x88,%f12	! %f12 = 00000000 ff9062fd
!	%l3 = 00000000835aeb2c, %l7 = 0000000000000000, %l4 = 000000000000cabb
	udivx	%l3,%l7,%l4		! Div by zero, %l0 = 00000000036fff4d
!	Mem[0000000030041400] = 00000000, %l4 = 000000000000cabb
	lduwa	[%i1+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181410] = ff82b567, %l0 = 00000000036fff25
	lduha	[%i6+%o5]0x80,%l0	! %l0 = 000000000000ff82
!	Mem[0000000030181410] = 26ffffff, %l7 = 0000000000000000
	ldswa	[%i6+%o5]0x81,%l7	! %l7 = 0000000026ffffff
!	Mem[0000000030001410] = a67862ff, %f12 = 00000000
	lda	[%i0+%o5]0x89,%f12	! %f12 = a67862ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101428] = 4bcd767f, %l2 = 00000000000000a0
	swap	[%i4+0x028],%l2		! %l2 = 000000004bcd767f

p0_label_86:
!	%l5 = 000000000000ff00, Mem[0000000010101408] = ffe7edb05f45a09f
	stxa	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000000000ff00
!	Mem[0000000010081428] = 0522af06, %l5 = 000000000000ff00, %asi = 80
	swapa	[%i2+0x028]%asi,%l5	! %l5 = 000000000522af06
!	%l2 = 000000004bcd767f, Mem[00000000300c1410] = 287a77a000000010
	stxa	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000004bcd767f
!	Mem[0000000030081400] = 00000000, %l6 = ffffffffffffff9f
	swapa	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000000
	membar	#Sync			! Added by membar checker (12)
!	%l3 = 00000000835aeb2c, Mem[0000000010001408] = ff9fffff
	stha	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = eb2cffff
!	%l5 = 000000000522af06, Mem[0000000030101410] = 7c2b36b5
	stba	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 7c2b3606
!	%l6 = 00000000, %l7 = 26ffffff, Mem[0000000010101410] = fd6290ff 00000000
	std	%l6,[%i4+%o5]		! Mem[0000000010101410] = 00000000 26ffffff
!	Mem[00000000300c1400] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%f20 = 00000000 020190ff, Mem[0000000030141400] = eb4b1039 1db64a3a
	stda	%f20,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000 020190ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800180] = 29bea69f, %l0 = 000000000000ff82
	ldsh	[%o3+0x180],%l0		! %l0 = 00000000000029be

p0_label_87:
!	Mem[00000000300c1408] = 59000000, %l3 = 00000000835aeb2c
	lduha	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001410] = ff6278a67c2b36b5, %l3 = 0000000000000000
	ldxa	[%i0+%o5]0x81,%l3	! %l3 = ff6278a67c2b36b5
!	Mem[00000000218001c0] = ffff4083, %l4 = 0000000000000000
	lduh	[%o3+0x1c0],%l4		! %l4 = 000000000000ffff
!	Mem[00000000100c141c] = 000000ff, %f10 = 00000000
	lda	[%i3+0x01c]%asi,%f10	! %f10 = 000000ff
!	Mem[0000000030081410] = 000000ff, %l4 = 000000000000ffff
	lduwa	[%i2+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181400] = 7379cabb, %f0  = 00000000
	lda	[%i6+%g0]0x88,%f0 	! %f0 = 7379cabb
!	Mem[0000000010181408] = 00000000, %l7 = 0000000026ffffff
	lduha	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = 00000000 40a0db9a 00000000 000067b5
!	Mem[0000000010141410] = ff000000 000000e3 5590009d 20e4862f
!	Mem[0000000010141420] = ab88e890 00000000 e09cba41 2302b6d6
!	Mem[0000000010141430] = bbb4aac3 ee1c5974 bb48fd0c 7b3de588
	ldda	[%i5]ASI_BLK_P,%f16	! Block Load from 0000000010141400
!	Mem[0000000030141400] = 00000000, %f10 = 000000ff
	lda	[%i5+%g0]0x89,%f10	! %f10 = 00000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (13)
!	%f8  = ffc2b567 41047bff, %l1 = 00000000000000b8
!	Mem[0000000010141420] = ab88e89000000000
	add	%i5,0x020,%g1
	stda	%f8,[%g1+%l1]ASI_PST16_P ! Mem[0000000010141420] = ffc2e89000000000

p0_label_88:
!	%l4 = 000000ff, %l5 = 0522af06, Mem[0000000010181400] = 7379cabb ff000000
	stda	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff 0522af06
!	%f24 = ab88e890, Mem[0000000010041418] = ee1c5974
	st	%f24,[%i1+0x018]	! Mem[0000000010041418] = ab88e890
!	%f4  = ff82b567 19004a3a, %l0 = 00000000000029be
!	Mem[0000000010041408] = 00000000240b06fe
	add	%i1,0x008,%g1
	stda	%f4,[%g1+%l0]ASI_PST32_P ! Mem[0000000010041408] = ff82b567240b06fe
!	Mem[0000000030101410] = 7c2b3606, %l4 = 00000000000000ff
	ldstuba	[%i4+%o5]0x89,%l4	! %l4 = 00000006000000ff
!	%l6 = 0000000000000000, Mem[0000000010081410] = 0000000000000000
	stxa	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000000000000000
!	Mem[00000000100c1400] = a06beb65, %l5 = 000000000522af06
	ldstuba	[%i3+%g0]0x88,%l5	! %l5 = 00000065000000ff
!	Mem[0000000030081400] = ffffff9f, %l5 = 0000000000000065
	ldstuba	[%i2+%g0]0x89,%l5	! %l5 = 0000009f000000ff
!	Mem[0000000010101408] = 0000ff00, %l0 = 00000000000029be
	ldstuba	[%i4+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1408] = 00000000, %l6 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000, %l7 = 0000000000000000
	ldsha	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000000

p0_label_89:
!	Mem[0000000030141408] = 596de9bb00000000, %f26 = e09cba41 2302b6d6
	ldda	[%i5+%o4]0x89,%f26	! %f26 = 596de9bb 00000000
!	Mem[0000000030101410] = 7c2b36ff, %l5 = 000000000000009f
	ldsha	[%i4+%o5]0x89,%l5	! %l5 = 00000000000036ff
!	%f29 = ee1c5974, %f15 = a09fffff, %f24 = ab88e890
	fadds	%f29,%f15,%f24		! %f24 = ee1c5974
!	Mem[0000000030141400] = 00000000020190ff, %f18 = 00000000 000067b5
	ldda	[%i5+%g0]0x81,%f18	! %f18 = 00000000 020190ff
!	Mem[00000000300c1408] = ffffffff59000000, %l0 = 0000000000000000
	ldxa	[%i3+%o4]0x89,%l0	! %l0 = ffffffff59000000
!	Mem[00000000100c1408] = 00000000 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010001400] = 00000000 bb7b3782, %l4 = 00000006, %l5 = 000036ff
	ldda	[%i0+0x000]%asi,%l4	! %l4 = 0000000000000000 00000000bb7b3782
!	Mem[0000000030081410] = ff000000 00000000, %l2 = 4bcd767f, %l3 = 7c2b36b5
	ldda	[%i2+%o5]0x81,%l2	! %l2 = 00000000ff000000 0000000000000000
!	Mem[0000000030101408] = 00000000, %f20 = ff000000
	lda	[%i4+%o4]0x89,%f20	! %f20 = 00000000
!	Starting 10 instruction Store Burst
!	%l0 = ffffffff59000000, Mem[0000000010141400] = 00000000
	stba	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000

p0_label_90:
!	%f26 = 596de9bb, %f20 = 00000000, %f3  = ffff00ff
	fadds	%f26,%f20,%f3 		! %f3  = 596de9bb
!	%f6  = e59563c7, Mem[0000000030141400] = 00000000
	sta	%f6 ,[%i5+%g0]0x81	! Mem[0000000030141400] = e59563c7
!	%f8  = ffc2b567, Mem[00000000300c1408] = 00000059
	sta	%f8 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffc2b567
!	Mem[0000000030101408] = 00000000, %l5 = 00000000bb7b3782
	swapa	[%i4+%o4]0x81,%l5	! %l5 = 0000000000000000
!	%f1  = 000000e1, %f26 = 596de9bb, %f8  = ffc2b567 41047bff
	fsmuld	%f1 ,%f26,%f8 		! %l0 = ffffffff59000022, Unfinished, %fsr = 2100000c00
!	Mem[0000000010041410] = b8900102, %l1 = 00000000000000b8
	ldstuba	[%i1+%o5]0x80,%l1	! %l1 = 000000b8000000ff
!	%l7 = 0000000000000000, Mem[0000000010101420] = aca1a5305f45a09f
	stx	%l7,[%i4+0x020]		! Mem[0000000010101420] = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l0 = ffffffff59000022
	swapa	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010081420] = 636e4c36 ce4ec79b
	stda	%l4,[%i2+0x020]%asi	! Mem[0000000010081420] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = bbb4aac3, %l6 = 0000000000000000
	ldsha	[%i2+%o4]0x80,%l6	! %l6 = ffffffffffffbbb4

p0_label_91:
!	Mem[0000000010001408] = 3bc49137ffff2ceb, %f12 = a67862ff ff9062fd
	ldda	[%i0+%o4]0x88,%f12	! %f12 = 3bc49137 ffff2ceb
!	Mem[0000000010001400] = 82377bbb22000059, %l3 = 0000000000000000
	ldxa	[%i0+%g0]0x88,%l3	! %l3 = 82377bbb22000059
!	Mem[0000000010081408] = 74591cee c3aab4bb, %l0 = 00000000, %l1 = 000000b8
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 00000000c3aab4bb 0000000074591cee
!	Mem[0000000030101408] = bb7b3782, %l4 = 0000000000000000
	lduwa	[%i4+%o4]0x81,%l4	! %l4 = 00000000bb7b3782
!	Mem[0000000010181410] = ff82b567, %l0 = 00000000c3aab4bb
	ldsha	[%i6+%o5]0x80,%l0	! %l0 = ffffffffffffff82
!	Mem[00000000100c1438] = 00547a2f, %l1 = 0000000074591cee
	ldub	[%i3+0x03a],%l1		! %l1 = 000000000000007a
!	%l6 = ffffffffffffbbb4, Mem[00000000100c143a] = 00547a2f
	sth	%l6,[%i3+0x03a]		! Mem[00000000100c1438] = 0054bbb4
!	%f28 = bbb4aac3, %f26 = 596de9bb
	fsqrts	%f28,%f26		! %f26 = 7fffffff
!	Mem[0000000010081410] = 00000000, %l3 = 82377bbb22000059
	ldsha	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffffbbb4, Mem[0000000010081408] = c3aab4bb
	stwa	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffbbb4

p0_label_92:
!	%l0 = ffffff82, %l1 = 0000007a, Mem[0000000010081408] = b4bbffff ee1c5974
	stda	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffff82 0000007a
!	Mem[0000000010101410] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%f20 = 00000000, Mem[00000000300c1400] = ff000000
	sta	%f20,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	%l4 = 00000000bb7b3782, Mem[0000000010101400] = 00000000
	stba	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 82000000
!	Mem[000000001010140b] = ffff0000, %l3 = 0000000000000000
	ldstub	[%i4+0x00b],%l3		! %l3 = 00000000000000ff
!	%f29 = ee1c5974, %f24 = ee1c5974 00000000
	fstod	%f29,%f24		! %f24 = c5c38b2e 80000000
!	%l3 = 0000000000000000, immd = fffffffffffff0f7, %l5 = 0000000000000000
	sdivx	%l3,-0xf09,%l5		! %l5 = 0000000000000000
!	Mem[0000000010041434] = 0000e7ff, %l0 = ffffffffffffff82
	swap	[%i1+0x034],%l0		! %l0 = 000000000000e7ff
!	%f16 = 00000000 40a0db9a 00000000 020190ff
!	%f20 = 00000000 000000e3 5590009d 20e4862f
!	%f24 = c5c38b2e 80000000 7fffffff 00000000
!	%f28 = bbb4aac3 ee1c5974 bb48fd0c 7b3de588
	stda	%f16,[%i4]ASI_BLK_SL	! Block Store to 0000000030101400
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00000000e3b626ff, %l5 = 0000000000000000
	ldxa	[%i6+%g0]0x89,%l5	! %l5 = 00000000e3b626ff

p0_label_93:
!	Mem[00000000100c1408] = 00000000, %l7 = 0000000000000000
	lduwa	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = ff005756, %l7 = 0000000000000000
	ldswa	[%i2+%o4]0x81,%l7	! %l7 = ffffffffff005756
!	Mem[0000000030001400] = bbcaffff ffffffff, %l4 = bb7b3782, %l5 = e3b626ff
	ldda	[%i0+%g0]0x81,%l4	! %l4 = 00000000bbcaffff 00000000ffffffff
!	Mem[0000000030081410] = 000000ff, %l7 = ffffffffff005756
	ldsba	[%i2+%o5]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030081408] = ff005756 bb7b3782, %l2 = ff000000, %l3 = 00000000
	ldda	[%i2+%o4]0x81,%l2	! %l2 = 00000000ff005756 00000000bb7b3782
!	Mem[0000000010181408] = 00000000, %l2 = 00000000ff005756
	lduwa	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = ff82b567, %l5 = 00000000ffffffff
	ldsba	[%i1+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000020800040] = 00d7a3d2, %l3 = 00000000bb7b3782
	lduba	[%o1+0x041]%asi,%l3	! %l3 = 00000000000000d7
!	Mem[0000000030041400] = 00000000, %l5 = ffffffffffffffff
	lduwa	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000e7ff, Mem[0000000030101410] = e3000000
	stba	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = ff000000

p0_label_94:
!	Code Fragment 4
p0_fragment_7:
!	%l0 = 000000000000e7ff
	setx	0x9142d2e00128309c,%g7,%l0 ! %l0 = 9142d2e00128309c
!	%l1 = 000000000000007a
	setx	0x36705df85d6d1768,%g7,%l1 ! %l1 = 36705df85d6d1768
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9142d2e00128309c
	setx	0x8101d617fb323093,%g7,%l0 ! %l0 = 8101d617fb323093
!	%l1 = 36705df85d6d1768
	setx	0xb130c25048a008aa,%g7,%l1 ! %l1 = b130c25048a008aa
!	%f1  = 000000e1, Mem[0000000010041410] = ff900102
	sta	%f1 ,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000e1
!	Mem[0000000030081400] = ffffffff, %f4  = ff82b567
	lda	[%i2+%g0]0x81,%f4 	! %f4 = ffffffff
!	%l0 = 8101d617fb323093, Mem[0000000030141400] = e59563c7
	stba	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 939563c7
!	Mem[0000000030001400] = bbcaffff, %l6 = ffffffffffffbbb4
	ldstuba	[%i0+%g0]0x81,%l6	! %l6 = 000000bb000000ff
!	%l2 = 0000000000000000, Mem[00000000201c0000] = ff9f2cc7
	stb	%l2,[%o0+%g0]		! Mem[00000000201c0000] = 009f2cc7
!	%l4 = 00000000bbcaffff, Mem[0000000010181418] = e59563c7f79e9e3d
	stx	%l4,[%i6+0x018]		! Mem[0000000010181418] = 00000000bbcaffff
!	%l3 = 00000000000000d7, Mem[0000000030001400] = ffcaffffffffffff
	stxa	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000000000d7
!	%l3 = 00000000000000d7, Mem[0000000020800040] = 00d7a3d2
	sth	%l3,[%o1+0x040]		! Mem[0000000020800040] = 00d7a3d2
!	Starting 10 instruction Load Burst
!	Mem[0000000010181430] = 000000e3d2077973, %f6  = e59563c7 f79e9e3d
	ldda	[%i6+0x030]%asi,%f6 	! %f6  = 000000e3 d2077973

p0_label_95:
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000010101438] = 09deefe5, %l2 = 0000000000000000
	ldsb	[%i4+0x03a],%l2		! %l2 = ffffffffffffffef
!	Mem[0000000010141428] = e09cba41, %l1 = b130c25048a008aa
	ldsw	[%i5+0x028],%l1		! %l1 = ffffffffe09cba41
!	Mem[0000000030141410] = 00000000 00000059, %l4 = bbcaffff, %l5 = 00000000
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000059 0000000000000000
!	Mem[0000000030101408] = ff900102, %l3 = 00000000000000d7
	lduba	[%i4+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000020800000] = ff5ed75b, %l5 = 0000000000000000
	ldsba	[%o1+0x000]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[000000001018141c] = bbcaffff, %l7 = ffffffffffffffff
	lduha	[%i6+0x01e]%asi,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010141410] = ff000000, %l6 = 00000000000000bb
	lduwa	[%i5+%o5]0x80,%l6	! %l6 = 00000000ff000000
!	Mem[0000000010041410] = 000000e1, %f8  = ffc2b567
	lda	[%i1+%o5]0x80,%f8 	! %f8 = 000000e1
!	Mem[0000000010001408] = eb2cffff, %l0 = 8101d617fb323093
	ldsha	[%i0+%o4]0x80,%l0	! %l0 = ffffffffffffeb2c
!	Starting 10 instruction Store Burst
!	%f23 = 20e4862f, %f12 = 3bc49137, %f8  = 000000e1 41047bff
	fsmuld	%f23,%f12,%f8 		! %f8  = 3ba5ef0b a2ae6320

p0_label_96:
!	%l4 = 0000000000000059, Mem[0000000010041410] = e1000000
	stwa	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000059
!	Mem[0000000010101408] = ffff00ff00000000, %l1 = ffffffffe09cba41, %l0 = ffffffffffffeb2c
	add	%i4,0x08,%g1
	casxa	[%g1]0x80,%l1,%l0	! %l0 = ffff00ff00000000
!	Mem[000000001014143f] = 7b3de588, %l6 = 00000000ff000000
	ldstuba	[%i5+0x03f]%asi,%l6	! %l6 = 00000088000000ff
!	%f20 = 00000000, Mem[0000000030001400] = 00000000
	sta	%f20,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	Mem[0000000030101408] = 020190ff, %l4 = 0000000000000059
	swapa	[%i4+%o4]0x89,%l4	! %l4 = 00000000020190ff
!	Mem[00000000300c1400] = 00000000, %l6 = 0000000000000088
	swapa	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010041408] = 67b582ff
	stwa	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	%f21 = 000000e3, Mem[0000000030141408] = 00000000
	sta	%f21,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000e3
!	%f3  = 596de9bb, Mem[00000000100c1400] = ffeb6ba0
	st	%f3 ,[%i3+%g0]		! Mem[00000000100c1400] = 596de9bb
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ff000000, %f12 = 3bc49137
	lda	[%i2+%o5]0x81,%f12	! %f12 = ff000000

p0_label_97:
!	Mem[0000000020800040] = 00d7a3d2, %l7 = 000000000000ffff
	lduh	[%o1+0x040],%l7		! %l7 = 00000000000000d7
!	Mem[0000000030101400] = 0000000040a0db9a, %f4  = ffffffff 19004a3a
	ldda	[%i4+%g0]0x89,%f4 	! %f4  = 00000000 40a0db9a
!	Mem[0000000010141418] = 5590009d 20e4862f, %l6 = 00000000, %l7 = 000000d7
	ldda	[%i5+0x018]%asi,%l6	! %l6 = 000000005590009d 0000000020e4862f
!	Mem[00000000211c0001] = ff007241, %l6 = 000000005590009d
	ldstub	[%o2+0x001],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010041420] = ffffffb7000000f6, %f26 = 7fffffff 00000000
	ldda	[%i1+0x020]%asi,%f26	! %f26 = ffffffb7 000000f6
!	Mem[0000000010001428] = 00000059, %l0 = ffff00ff00000000
	lduh	[%i0+0x02a],%l0		! %l0 = 0000000000000059
!	Mem[0000000030001408] = 00000000, %l4 = 00000000020190ff
	ldsba	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101408] = ffff00ff00000000, %f10 = 00000000 c90a45ff
	ldd	[%i4+%o4],%f10		! %f10 = ffff00ff 00000000
!	Mem[0000000030081408] = 565700ff, %l6 = 0000000000000000
	ldswa	[%i2+%o4]0x89,%l6	! %l6 = 00000000565700ff
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010141404] = 40a0db9a
	stw	%l4,[%i5+0x004]		! Mem[0000000010141404] = 00000000

p0_label_98:
!	%f14 = bbb4aac3 a09fffff, Mem[0000000030001410] = ff6278a6 7c2b36b5
	stda	%f14,[%i0+%o5]0x81	! Mem[0000000030001410] = bbb4aac3 a09fffff
!	%l4 = 0000000000000000, Mem[00000000100c1400] = bbe96d59
	stha	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = bbe90000
!	Mem[0000000021800180] = 29bea69f, %l0 = 0000000000000059
	ldstub	[%o3+0x180],%l0		! %l0 = 00000029000000ff
!	Mem[0000000010101408] = ffff00ff, %l5 = ffffffffffffffff
	ldstuba	[%i4+%o4]0x80,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010181410] = ff82b567, %l6 = 00000000565700ff
	swapa	[%i6+%o5]0x80,%l6	! %l6 = 00000000ff82b567
!	%f11 = 00000000, %f0  = 7379cabb, %f25 = 80000000
	fmuls	%f11,%f0 ,%f25		! %f25 = 00000000
!	%f0  = 7379cabb 000000e1, %l5 = 00000000000000ff
!	Mem[0000000010081410] = 0000000000000000
	add	%i2,0x010,%g1
	stda	%f0,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010081410] = e1000000bbca7973
!	Mem[00000000100c1410] = 835aeb2c, %l7 = 0000000020e4862f
	swapa	[%i3+%o5]0x80,%l7	! %l7 = 00000000835aeb2c
!	%l0 = 0000000000000029, Mem[0000000010081408] = ffffff820000007a
	stxa	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000029
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 82377bbb 565700ff, %l0 = 00000029, %l1 = e09cba41
	ldda	[%i2+%o4]0x89,%l0	! %l0 = 00000000565700ff 0000000082377bbb

p0_label_99:
!	Mem[0000000010181400] = ff000000, %l5 = 00000000000000ff
	ldsha	[%i6+%g0]0x80,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000010081400] = ffffffff 000000ff, %l6 = ff82b567, %l7 = 835aeb2c
	ldda	[%i2+%g0]0x88,%l6	! %l6 = 00000000000000ff 00000000ffffffff
!	Mem[0000000030041408] = ffe70000ff005756, %f30 = bb48fd0c 7b3de588
	ldda	[%i1+%o4]0x89,%f30	! %f30 = ffe70000 ff005756
!	Mem[0000000010181400] = ff00000006af2205, %l0 = 00000000565700ff
	ldx	[%i6+%g0],%l0		! %l0 = ff00000006af2205
!	Mem[00000000300c1408] = ffc2b567 ffffffff, %l2 = ffffffef, %l3 = 000000ff
	ldda	[%i3+%o4]0x81,%l2	! %l2 = 00000000ffc2b567 00000000ffffffff
!	Mem[0000000010041408] = 00000000, %l6 = 00000000000000ff
	ldsba	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000020800040] = 00d7a3d2, %l7 = 00000000ffffffff
	ldub	[%o1+0x041],%l7		! %l7 = 00000000000000d7
!	Mem[0000000010181400] = 000000ff, %l6 = 0000000000000000
	ldsba	[%i6+%g0]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081430] = 000000e1 b6a6bb80, %l0 = 06af2205, %l1 = 82377bbb
	ldd	[%i2+0x030],%l0		! %l0 = 00000000000000e1 00000000b6a6bb80
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 00000000, %l2 = 00000000ffc2b567
	ldstuba	[%i5+%o4]0x80,%l2	! %l2 = 00000000000000ff

p0_label_100:
!	Mem[0000000010101408] = ffff00ff, %l2 = 0000000000000000
	ldstuba	[%i4+%o4]0x80,%l2	! %l2 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[0000000010181410] = 565700ff
	stba	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = ff5700ff
!	%f3  = 596de9bb, %f8  = 3ba5ef0b, %f30 = ffe70000
	fadds	%f3 ,%f8 ,%f30		! %f30 = 596de9bb
!	%l6 = ffffffff, %l7 = 000000d7, Mem[0000000030101400] = 40a0db9a 00000000
	stda	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffffff 000000d7
!	Mem[0000000010101400] = 82000000, %l3 = 00000000ffffffff
	swapa	[%i4+%g0]0x80,%l3	! %l3 = 0000000082000000
!	%l0 = 00000000000000e1, Mem[00000000300c1410] = 00000000
	stwa	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000e1
!	Mem[0000000010041423] = ffffffb7, %l0 = 00000000000000e1
	ldstuba	[%i1+0x023]%asi,%l0	! %l0 = 000000b7000000ff
!	%l0 = 00000000000000b7, Mem[0000000010181410] = ff5700ff19004a3a
	stxa	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000000000b7
!	%l5 = ffffffffffffff00, Mem[0000000030181410] = 26ffffff
	stwa	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffff00
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ffffffff, %l6 = ffffffffffffffff
	ldsha	[%i4+%g0]0x88,%l6	! %l6 = ffffffffffffffff

p0_label_101:
!	Mem[0000000010001430] = 6de9520cba4da1cf, %l6 = ffffffffffffffff
	ldx	[%i0+0x030],%l6		! %l6 = 6de9520cba4da1cf
!	Mem[0000000030101408] = 0000000000000059, %f10 = ffff00ff 00000000
	ldda	[%i4+%o4]0x89,%f10	! %f10 = 00000000 00000059
!	Mem[0000000030181408] = ffff00ff, %l5 = ffffffffffffff00
	ldsha	[%i6+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101400] = ffffffff, %l1 = 00000000b6a6bb80
	ldswa	[%i4+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000300c1410] = 000000e1, %l1 = ffffffffffffffff
	lduwa	[%i3+%o5]0x81,%l1	! %l1 = 00000000000000e1
!	%l6 = 6de9520cba4da1cf, immed = 00000b4d, %y  = 00000000
	udiv	%l6,0xb4d,%l1		! %l1 = 0000000000107c62
	mov	%l0,%y			! %y = 000000b7
!	Mem[0000000030181400] = 00000000e3b626ff, %f24 = c5c38b2e 00000000
	ldda	[%i6+%g0]0x89,%f24	! %f24 = 00000000 e3b626ff
!	Mem[0000000020800000] = ff5ed75b, %l0 = 00000000000000b7
	ldsb	[%o1+0x001],%l0		! %l0 = 000000000000005e
!	Mem[0000000030101408] = 00000059, %l4 = 0000000000000000
	ldsha	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000059
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000059, Mem[00000000211c0001] = ffff7241, %asi = 80
	stba	%l4,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff597241

p0_label_102:
!	Mem[0000000010101408] = ff00ffff, %l1 = 0000000000107c62
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 00000000ff00ffff
!	%l1 = 00000000ff00ffff, Mem[0000000010041408] = 00000000
	stha	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000ffff
!	%f14 = bbb4aac3, %f2  = ff0000e3, %f15 = a09fffff
	fmuls	%f14,%f2 ,%f15		! %f15 = 7b34ac03
!	Code Fragment 3
p0_fragment_8:
!	%l0 = 000000000000005e
	setx	0x14c445e87f264ac4,%g7,%l0 ! %l0 = 14c445e87f264ac4
!	%l1 = 00000000ff00ffff
	setx	0xc4bf4e2fd29d1722,%g7,%l1 ! %l1 = c4bf4e2fd29d1722
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 14c445e87f264ac4
	setx	0xc9b154583c18fb62,%g7,%l0 ! %l0 = c9b154583c18fb62
!	%l1 = c4bf4e2fd29d1722
	setx	0x4705ed3829757dfa,%g7,%l1 ! %l1 = 4705ed3829757dfa
!	Mem[0000000010101414] = 26ffffff, %l0 = c9b154583c18fb62, %asi = 80
	swapa	[%i4+0x014]%asi,%l0	! %l0 = 0000000026ffffff
!	%f0  = 7379cabb 000000e1, Mem[0000000010101410] = ff000000 3c18fb62
	stda	%f0 ,[%i4+%o5]0x80	! Mem[0000000010101410] = 7379cabb 000000e1
!	%f18 = 00000000, Mem[0000000010181410] = 00000000
	sta	%f18,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	%l4 = 0000000000000059, Mem[0000000020800040] = 00d7a3d2, %asi = 80
	stha	%l4,[%o1+0x040]%asi	! Mem[0000000020800040] = 0059a3d2
!	%l2 = 00000000000000ff, Mem[0000000010041410] = 00000059
	stha	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ff26b6e3, %l5 = 00000000000000ff
	ldsha	[%i6+%g0]0x81,%l5	! %l5 = ffffffffffffff26

p0_label_103:
!	Mem[0000000021800040] = 34d10896, %l5 = ffffffffffffff26
	lduh	[%o3+0x040],%l5		! %l5 = 00000000000034d1
!	Mem[0000000030101400] = ffffffff, %l1 = 4705ed3829757dfa
	lduba	[%i4+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181410] = 00000000000000b7, %f0  = 7379cabb 000000e1
	ldda	[%i6+%o5]0x80,%f0 	! %f0  = 00000000 000000b7
!	Mem[0000000030001408] = 00000000 00000000, %l2 = 000000ff, %l3 = 82000000
	ldda	[%i0+%o4]0x81,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010141410] = ff000000000000e3, %l1 = 00000000000000ff
	ldxa	[%i5+%o5]0x80,%l1	! %l1 = ff000000000000e3
!	Mem[00000000300c1408] = ffc2b567, %l3 = 0000000000000000
	ldsha	[%i3+%o4]0x81,%l3	! %l3 = ffffffffffffffc2
!	Mem[0000000010141418] = 5590009d, %l1 = ff000000000000e3
	ldsh	[%i5+0x018],%l1		! %l1 = 0000000000005590
!	Mem[000000001000140c] = 3791c43b, %l3 = ffffffffffffffc2
	lduwa	[%i0+0x00c]%asi,%l3	! %l3 = 000000003791c43b
!	Mem[0000000030041408] = ffe70000 ff005756, %l6 = ba4da1cf, %l7 = 000000d7
	ldda	[%i1+%o4]0x89,%l6	! %l6 = 00000000ff005756 00000000ffe70000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = ff900102, %l1 = 00005590, %l4 = 00000059
	add	%i0,0x10,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 00000000ff900102

p0_label_104:
!	Mem[0000000010001420] = 3a4ab61d, %l0 = 0000000026ffffff, %asi = 80
	swapa	[%i0+0x020]%asi,%l0	! %l0 = 000000003a4ab61d
!	Mem[00000000300c1408] = 67b5c2ff, %l6 = 00000000ff005756
	swapa	[%i3+%o4]0x89,%l6	! %l6 = 0000000067b5c2ff
!	%l3 = 000000003791c43b, Mem[00000000300c1400] = 88000000
	stwa	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 3791c43b
!	Mem[0000000030081410] = ff000000, %l1 = 0000000000005590
	ldstuba	[%i2+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010181410] = 00000000, %l1 = 00000000000000ff
	swapa	[%i6+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%f2  = ff0000e3 596de9bb, Mem[0000000010181410] = ff000000 b7000000
	stda	%f2 ,[%i6+%o5]0x88	! Mem[0000000010181410] = ff0000e3 596de9bb
!	Mem[0000000010181400] = ff000000, %l4 = 00000000ff900102
	lduha	[%i6+%g0]0x80,%l4	! %l4 = 000000000000ff00
!	%f21 = 000000e3, Mem[000000001000143c] = 0968dd83
	st	%f21,[%i0+0x03c]	! Mem[000000001000143c] = 000000e3
!	Mem[0000000030101410] = ff000000, %l7 = 00000000ffe70000
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 000000ff, %l2 = 0000000000000000
	lduha	[%i5+%o4]0x88,%l2	! %l2 = 00000000000000ff

p0_label_105:
!	Mem[0000000030101400] = ffffffff, %l0 = 000000003a4ab61d
	lduba	[%i4+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041400] = 67b582ff, %l3 = 000000003791c43b
	ldsba	[%i1+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000020800040] = 0059a3d2, %l2 = 00000000000000ff
	ldsh	[%o1+0x040],%l2		! %l2 = 0000000000000059
!	Mem[0000000030041410] = a09fffff 000000ff, %l6 = 67b5c2ff, %l7 = ff000000
	ldda	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000ff 00000000a09fffff
!	Mem[0000000030101400] = ffffffff, %l5 = 00000000000034d1
	lduwa	[%i4+%g0]0x89,%l5	! %l5 = 00000000ffffffff
!	Mem[00000000300c1408] = 565700ff, %l6 = 00000000000000ff
	lduba	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000056
!	Mem[00000000201c0000] = 009f2cc7, %l4 = 000000000000ff00
	ldsba	[%o0+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041410] = ff000000, %l5 = 00000000ffffffff
	lduha	[%i1+%o5]0x81,%l5	! %l5 = 000000000000ff00
!	Mem[0000000010101410] = bbca7973, %l0 = 00000000000000ff
	ldsba	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000073
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = ffffffff, %l4 = 0000000000000000
	swapa	[%i4+%g0]0x88,%l4	! %l4 = 00000000ffffffff

p0_label_106:
!	Mem[0000000030041410] = ff000000, %l3 = ffffffffffffffff
	ldstuba	[%i1+%o5]0x81,%l3	! %l3 = 000000ff000000ff
!	%l6 = 0000000000000056, Mem[0000000030001400] = d700000000000000
	stxa	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000000000000056
!	%f0  = 00000000 000000b7 ff0000e3 596de9bb
!	%f4  = 00000000 40a0db9a 000000e3 d2077973
!	%f8  = 3ba5ef0b a2ae6320 00000000 00000059
!	%f12 = ff000000 ffff2ceb bbb4aac3 7b34ac03
	stda	%f0,[%i1]ASI_BLK_S	! Block Store to 0000000030041400
!	Mem[0000000030101400] = ffffffff, %l2 = 0000000000000059
	swapa	[%i4+%g0]0x81,%l2	! %l2 = 00000000ffffffff
!	%l5 = 000000000000ff00, %l3 = 00000000000000ff, %y  = 000000b7
	smul	%l5,%l3,%l3		! %l3 = 0000000000fe0100, %y = 00000000
!	Mem[0000000030001400] = 00000056, %l1 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 00000056000000ff
!	%l0 = 0000000000000073, Mem[00000000300c1408] = ff005756
	stba	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff005773
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000030041400] = 00000000, %l4 = 00000000ffffffff
	ldstuba	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%f16 = 00000000 40a0db9a, Mem[0000000030181400] = ff26b6e3 00000000
	stda	%f16,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000 40a0db9a
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ff000000, %l5 = 000000000000ff00
	ldsh	[%i6+%g0],%l5		! %l5 = ffffffffffffff00

p0_label_107:
!	Mem[0000000030181408] = b0ede7ff ffff00ff, %l2 = ffffffff, %l3 = 00fe0100
	ldda	[%i6+%o4]0x89,%l2	! %l2 = 00000000ffff00ff 00000000b0ede7ff
!	Mem[0000000010181400] = ff000000, %l7 = 00000000a09fffff
	lduha	[%i6+%g0]0x80,%l7	! %l7 = 000000000000ff00
!	Mem[0000000010081400] = ffffffff000000ff, %f20 = 00000000 000000e3
	ldda	[%i2+%g0]0x88,%f20	! %f20 = ffffffff 000000ff
!	Mem[0000000010101410] = 7379cabb, %l2 = 00000000ffff00ff
	lduha	[%i4+%o5]0x80,%l2	! %l2 = 0000000000007379
!	Mem[0000000030001400] = ff000000, %l1 = 0000000000000056
	lduha	[%i0+%g0]0x81,%l1	! %l1 = 000000000000ff00
!	%l2 = 0000000000007379, imm = 00000000000004b5, %l6 = 0000000000000056
	addc	%l2,0x4b5,%l6		! %l6 = 000000000000782e
!	Mem[00000000100c1400] = f11bdf05 bbe90000, %l6 = 0000782e, %l7 = 0000ff00
	ldda	[%i3+%g0]0x88,%l6	! %l6 = 00000000bbe90000 00000000f11bdf05
!	Mem[0000000030141400] = 939563c7, %l7 = 00000000f11bdf05
	ldsba	[%i5+%g0]0x81,%l7	! %l7 = ffffffffffffff93
!	Mem[0000000010081400] = ffffffff000000ff, %l6 = 00000000bbe90000
	ldxa	[%i2+%g0]0x88,%l6	! %l6 = ffffffff000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041414] = eb4b1039, %l5 = ffffffffffffff00
	ldstuba	[%i1+0x014]%asi,%l5	! %l5 = 000000eb000000ff

p0_label_108:
!	Mem[0000000030081410] = ff000000, %l1 = 000000000000ff00
	swapa	[%i2+%o5]0x81,%l1	! %l1 = 00000000ff000000
!	%f16 = 00000000 40a0db9a 00000000 020190ff
!	%f20 = ffffffff 000000ff 5590009d 20e4862f
!	%f24 = 00000000 e3b626ff ffffffb7 000000f6
!	%f28 = bbb4aac3 ee1c5974 596de9bb ff005756
	stda	%f16,[%i6]ASI_BLK_AIUSL	! Block Store to 0000000030181400
!	Mem[0000000030141408] = e3000000, %l7 = ffffffffffffff93
	ldstuba	[%i5+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1410] = 2f86e420, %l1 = 00000000ff000000
	ldstuba	[%i3+%o5]0x88,%l1	! %l1 = 00000020000000ff
!	%l2 = 0000000000007379, Mem[0000000010181400] = 000000ff
	stba	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000079
!	Mem[0000000030101400] = 59000000, %l0 = 0000000000000073
	swapa	[%i4+%g0]0x89,%l0	! %l0 = 0000000059000000
!	%f8  = 3ba5ef0b a2ae6320, %l1 = 0000000000000020
!	Mem[0000000010101418] = b5362b7c000000a0
	add	%i4,0x018,%g1
	stda	%f8,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010101418] = b5362b7c000000a0
!	Mem[00000000100c1434] = 4940b0a1, %l6 = ffffffff000000ff
	ldstub	[%i3+0x034],%l6		! %l6 = 00000049000000ff
!	%l2 = 00007379, %l3 = b0ede7ff, Mem[0000000010141420] = ffc2e890 00000000
	std	%l2,[%i5+0x020]		! Mem[0000000010141420] = 00007379 b0ede7ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ffff0000, %l2 = 0000000000007379
	ldswa	[%i1+0x008]%asi,%l2	! %l2 = ffffffffffff0000

p0_label_109:
!	Mem[0000000010101410] = 7379cabb000000e1, %l7 = 0000000000000000
	ldxa	[%i4+%o5]0x80,%l7	! %l7 = 7379cabb000000e1
!	Mem[0000000010001408] = ffff2ceb, %l5 = 00000000000000eb
	ldswa	[%i0+%o4]0x88,%l5	! %l5 = ffffffffffff2ceb
!	Mem[000000001014140c] = 000067b5, %l0 = 0000000059000000
	ldsha	[%i5+0x00c]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101408] = 59000000 00000000, %l2 = ffff0000, %l3 = b0ede7ff
	ldda	[%i4+%o4]0x81,%l2	! %l2 = 0000000059000000 0000000000000000
!	%l0 = 0000000000000000, %l2 = 0000000059000000, %l4 = 0000000000000000
	udivx	%l0,%l2,%l4		! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000030181410] = ff000000 ffffffff, %l4 = 00000000, %l5 = ffff2ceb
	ldda	[%i6+%o5]0x81,%l4	! %l4 = 00000000ff000000 00000000ffffffff
!	Mem[0000000010181408] = 00000000, %l0 = 0000000000000000
	lduba	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l3 = 0000000000000000
	lduba	[%i2+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101410] = ffe70000, %l0 = 0000000000000000
	lduha	[%i4+%o5]0x81,%l0	! %l0 = 000000000000ffe7
!	Starting 10 instruction Store Burst
!	%l2 = 0000000059000000, Mem[0000000010001408] = ffff2ceb
	stwa	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 59000000

p0_label_110:
!	%l1 = 0000000000000020, Mem[0000000030181410] = ff000000
	stba	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = 20000000
!	Mem[0000000010141406] = 00000000, %l7 = 7379cabb000000e1
	ldstuba	[%i5+0x006]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001400] = 59000022, %l0 = 000000000000ffe7
	ldstuba	[%i0+%g0]0x80,%l0	! %l0 = 00000059000000ff
!	%f24 = 00000000 e3b626ff, %l0 = 0000000000000059
!	Mem[0000000010001430] = 6de9520cba4da1cf
	add	%i0,0x030,%g1
	stda	%f24,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010001430] = ff26b6e3ba4da1cf
!	Mem[00000000100c1400] = 0000e9bb05df1bf1, %l5 = 00000000ffffffff, %l2 = 0000000059000000
	casxa	[%i3]0x80,%l5,%l2	! %l2 = 0000e9bb05df1bf1
!	%l3 = 0000000000000000, Mem[0000000010001410] = 020190ff
	stwa	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	Mem[000000001004142d] = ac77cdff, %l4 = 00000000ff000000
	ldstub	[%i1+0x02d],%l4		! %l4 = 00000077000000ff
!	%l6 = 0000000000000049, Mem[0000000030141408] = e30000ff
	stha	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = e3000049
!	Mem[0000000030001410] = c3aab4bb, %l5 = 00000000ffffffff
	swapa	[%i0+%o5]0x89,%l5	! %l5 = 00000000c3aab4bb
!	Starting 10 instruction Load Burst
!	Mem[000000001000141c] = 3649d611, %l0 = 0000000000000059
	lduw	[%i0+0x01c],%l0		! %l0 = 000000003649d611

p0_label_111:
!	Mem[0000000010101410] = 7379cabb, %l3 = 0000000000000000
	lduha	[%i4+%o5]0x80,%l3	! %l3 = 0000000000007379
!	%f10 = 00000000 00000059, Mem[0000000010041400] = ff82b567 19004a3a
	std	%f10,[%i1+%g0]	! Mem[0000000010041400] = 00000000 00000059
!	Mem[0000000010101428] = 000000a0, %l0 = 000000003649d611
	lduwa	[%i4+0x028]%asi,%l0	! %l0 = 00000000000000a0
!	Mem[0000000030041408] = ff0000e3, %l3 = 0000000000007379
	ldswa	[%i1+%o4]0x81,%l3	! %l3 = ffffffffff0000e3
!	Mem[0000000010181430] = 000000e3, %l0 = 00000000000000a0
	lduh	[%i6+0x032],%l0		! %l0 = 00000000000000e3
!	Mem[0000000030081410] = 00ff0000, %l3 = ffffffffff0000e3
	ldsha	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1410] = ffe4862f, %l4 = 0000000000000077
	ldsba	[%i3+0x012]%asi,%l4	! %l4 = ffffffffffffff86
!	Mem[0000000010141400] = 00000000, %l2 = 0000e9bb05df1bf1
	ldswa	[%i5+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141400] = c7639593, %l6 = 0000000000000049
	lduba	[%i5+%g0]0x89,%l6	! %l6 = 0000000000000093
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010041400] = 00000000
	stba	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000

p0_label_112:
!	Mem[000000001014143c] = 7b3de5ff, %l0 = 00000000000000e3
	swap	[%i5+0x03c],%l0		! %l0 = 000000007b3de5ff
!	%l2 = 00000000, %l3 = 00000000, Mem[00000000300c1410] = e1000000 7f76cd4b
	stda	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000 00000000
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010181408] = 00000000 00000000
	stda	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000 00000000
!	Mem[000000001014140c] = 000067b5, %l0 = 000000007b3de5ff, %asi = 80
	swapa	[%i5+0x00c]%asi,%l0	! %l0 = 00000000000067b5
!	%f10 = 00000000 00000059, %l1 = 0000000000000020
!	Mem[0000000010181418] = 00000000bbcaffff
	add	%i6,0x018,%g1
	stda	%f10,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010181418] = 00000000bbcaffff
!	%f18 = 00000000, Mem[0000000010101410] = 7379cabb
	sta	%f18,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	Mem[0000000030181410] = 00000020, %l4 = ffffffffffffff86
	ldstuba	[%i6+%o5]0x89,%l4	! %l4 = 00000020000000ff
!	Mem[0000000010041428] = 5aa5c652acffcdff, %l3 = 0000000000000000, %l0 = 00000000000067b5
	add	%i1,0x28,%g1
	casxa	[%g1]0x80,%l3,%l0	! %l0 = 5aa5c652acffcdff
!	%l5 = 00000000c3aab4bb, Mem[0000000010001410] = 00000000
	stwa	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = c3aab4bb
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 000000000000e7ff, %f4  = 00000000 40a0db9a
	ldda	[%i4+%o5]0x89,%f4 	! %f4  = 00000000 0000e7ff

p0_label_113:
!	Mem[0000000010101400] = 0000000000000000, %f4  = 00000000 0000e7ff
	ldda	[%i4+%g0]0x88,%f4 	! %f4  = 00000000 00000000
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000030001400] = ff000000 00000000 00000000 00000000
!	Mem[0000000030001410] = ffffffff a09fffff 89263027 c6f0c4ed
!	Mem[0000000030001420] = 2691738c 045782c0 3b6aecaa e2ac9731
!	Mem[0000000030001430] = cfa18f70 39d2e96d 4138c2eb ddf5adb2
	ldda	[%i0]ASI_BLK_S,%f0	! Block Load from 0000000030001400
!	Mem[00000000100c1408] = 00000000, %l7 = 0000000000000000
	lduwa	[%i3+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081410] = 0000ff00, %l6 = 0000000000000093
	lduba	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = ff597241, %l3 = 0000000000000000
	lduh	[%o2+%g0],%l3		! %l3 = 000000000000ff59
!	Mem[00000000300c1408] = 735700ff, %l4 = 0000000000000020
	ldsba	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000073
!	Mem[0000000030041408] = ff0000e3, %l6 = 0000000000000000
	ldsha	[%i1+%o4]0x81,%l6	! %l6 = ffffffffffffff00
!	Mem[00000000300c1408] = ff005773, %l0 = 5aa5c652acffcdff
	ldsha	[%i3+%o4]0x89,%l0	! %l0 = 0000000000005773
!	Mem[0000000010081410] = e1000000 bbca7973, %l6 = ffffff00, %l7 = 00000000
	ldd	[%i2+%o5],%l6		! %l6 = 00000000e1000000 00000000bbca7973
!	Starting 10 instruction Store Burst
!	%l4 = 00000073, %l5 = c3aab4bb, Mem[0000000030181400] = 40a0db9a 00000000
	stda	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000073 c3aab4bb

p0_label_114:
!	%l7 = 00000000bbca7973, Mem[0000000010001400] = 220000ff
	stwa	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = bbca7973
!	%l1 = 0000000000000020, Mem[000000001014142f] = 2302b6d6
	stb	%l1,[%i5+0x02f]		! Mem[000000001014142c] = 2302b620
!	%f30 = 596de9bb ff005756, Mem[0000000010181408] = 00000000 00000000
	stda	%f30,[%i6+%o4]0x80	! Mem[0000000010181408] = 596de9bb ff005756
!	%l2 = 0000000000000000, %l6 = 00000000e1000000, %l1 = 0000000000000020
	addc	%l2,%l6,%l1		! %l1 = 00000000e1000000
!	%l2 = 0000000000000000, Mem[0000000030081408] = ff005756
	stha	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 00005756
!	%l4 = 0000000000000073, Mem[0000000030181408] = ff90010200000000
	stxa	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000000000000073
!	%l2 = 0000000000000000, Mem[0000000030081408] = 82377bbb56570000
	stxa	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000000000000000
!	Mem[0000000010001410] = c3aab4bb, %l6 = 00000000e1000000
	ldstuba	[%i0+%o5]0x80,%l6	! %l6 = 000000c3000000ff
!	Mem[0000000010141400] = 00000000, %l3 = 000000000000ff59
	ldstuba	[%i5+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00000000, %l5 = 00000000c3aab4bb
	ldsba	[%i6+%o4]0x89,%l5	! %l5 = 0000000000000000

p0_label_115:
!	Mem[0000000030001400] = 000000ff, %l6 = 00000000000000c3
	ldsha	[%i0+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[000000001004142c] = acffcdff, %l5 = 0000000000000000
	ldsw	[%i1+0x02c],%l5		! %l5 = ffffffffacffcdff
!	Mem[0000000010041400] = 00000000 00000059, %l0 = 00005773, %l1 = e1000000
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000 0000000000000059
!	Mem[00000000201c0000] = 009f2cc7, %l5 = ffffffffacffcdff
	lduh	[%o0+%g0],%l5		! %l5 = 000000000000009f
!	Mem[0000000010001408] = 00000059, %l5 = 000000000000009f
	lduha	[%i0+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001410] = bbb4aaff, %l6 = 00000000000000ff
	ldsba	[%i0+%o5]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000300c1408] = ff005773, %l3 = 0000000000000000
	lduba	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000073
!	Mem[00000000300c1408] = 735700ff ffffffff, %l4 = 00000073, %l5 = 00000000
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 00000000735700ff 00000000ffffffff
!	Mem[0000000030141408] = 490000e3bbe96d59, %l6 = ffffffffffffffff
	ldxa	[%i5+%o4]0x81,%l6	! %l6 = 490000e3bbe96d59
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000073, Mem[0000000021800040] = 34d10896
	stb	%l3,[%o3+0x040]		! Mem[0000000021800040] = 73d10896

p0_label_116:
!	%f20 = ffffffff, %f17 = 40a0db9a
	fcmpes	%fcc3,%f20,%f17		! %fcc3 = 3
	membar	#Sync			! Added by membar checker (18)
!	%l6 = bbe96d59, %l7 = bbca7973, Mem[0000000030001400] = ff000000 00000000
	stda	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = bbe96d59 bbca7973
!	%l3 = 0000000000000073, Mem[0000000030181408] = 00000000
	stwa	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000073
!	%l5 = 00000000ffffffff, Mem[0000000030101400] = 00000073
	stwa	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffffff
!	%l4 = 00000000735700ff, Mem[0000000020800040] = 0059a3d2
	sth	%l4,[%o1+0x040]		! Mem[0000000020800040] = 00ffa3d2
!	%l4 = 00000000735700ff, Mem[00000000300c1408] = 735700ffffffffff
	stxa	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000735700ff
!	Mem[0000000010001400] = bbca7973, %l5 = 00000000ffffffff
	swapa	[%i0+%g0]0x88,%l5	! %l5 = 00000000bbca7973
!	%l1 = 0000000000000059, Mem[0000000010041438] = 00000000
	sth	%l1,[%i1+0x038]		! Mem[0000000010041438] = 00590000
!	%f7  = c6f0c4ed, Mem[0000000010041400] = 00000000
	sta	%f7 ,[%i1+%g0]0x80	! Mem[0000000010041400] = c6f0c4ed
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff597241, %l1 = 0000000000000059
	lduha	[%o2+0x000]%asi,%l1	! %l1 = 000000000000ff59

p0_label_117:
!	Mem[00000000100c1400] = 0000e9bb, %l1 = 000000000000ff59
	lduwa	[%i3+%g0]0x80,%l1	! %l1 = 000000000000e9bb
!	Mem[0000000010101424] = 00000000, %f18 = 00000000
	lda	[%i4+0x024]%asi,%f18	! %f18 = 00000000
!	Mem[0000000010001424] = 39104beb, %l2 = 0000000000000000
	ldsba	[%i0+0x024]%asi,%l2	! %l2 = 0000000000000039
!	Mem[0000000030041410] = 00000000, %l1 = 000000000000e9bb
	lduba	[%i1+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181410] = 000000ff, %l7 = 00000000bbca7973
	ldsba	[%i6+%o5]0x89,%l7	! %l7 = ffffffffffffffff
!	%l1 = 0000000000000000, %l6 = 490000e3bbe96d59, %y  = 00000000
	sdiv	%l1,%l6,%l1		! %l1 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000010101410] = 00000000, %l5 = 00000000bbca7973
	lduha	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001410] = ffff9fa0 ffffffff, %l6 = bbe96d59, %l7 = ffffffff
	ldda	[%i0+%o5]0x89,%l6	! %l6 = 00000000ffffffff 00000000ffff9fa0
!	Code Fragment 4
p0_fragment_9:
!	%l0 = 0000000000000000
	setx	0x2133069f984c0fdf,%g7,%l0 ! %l0 = 2133069f984c0fdf
!	%l1 = 0000000000000000
	setx	0x5d1b78e85c6c9e94,%g7,%l1 ! %l1 = 5d1b78e85c6c9e94
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2133069f984c0fdf
	setx	0xbba6dde858bfe34c,%g7,%l0 ! %l0 = bba6dde858bfe34c
!	%l1 = 5d1b78e85c6c9e94
	setx	0x396dc05f8f75e884,%g7,%l1 ! %l1 = 396dc05f8f75e884
!	Starting 10 instruction Store Burst
!	%f20 = ffffffff, Mem[00000000300c1400] = 3bc49137
	sta	%f20,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffffff

p0_label_118:
!	Mem[00000000100c1408] = 00000000, %l3 = 0000000000000073
	ldstuba	[%i3+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141400] = ff000000, %l0 = 58bfe34c, %l0 = 58bfe34c
	casa	[%i5]0x80,%l0,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030081408] = 00000000, %l1 = 396dc05f8f75e884
	ldstuba	[%i2+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000010181400] = 00000079
	stha	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	Mem[000000001000141d] = 3649d611, %l6 = 00000000ffffffff
	ldstuba	[%i0+0x01d]%asi,%l6	! %l6 = 00000049000000ff
!	Mem[0000000030101410] = ffe70000, %l5 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000300c1410] = 00000000, %l4 = 00000000735700ff
	swapa	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = ffffffff, %l6 = 0000000000000049
	swapa	[%i2+%g0]0x89,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000010001410] = ffaab4bb, %l1 = 0000000000000000
	swapa	[%i0+%o5]0x80,%l1	! %l1 = 00000000ffaab4bb
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00000073, %l3 = 0000000000000000
	lduwa	[%i6+%g0]0x89,%l3	! %l3 = 0000000000000073

p0_label_119:
!	Mem[0000000010081410] = e1000000, %l7 = 00000000ffff9fa0
	ldswa	[%i2+%o5]0x80,%l7	! %l7 = ffffffffe1000000
!	Mem[0000000030101410] = ffe7000000000000, %l2 = 0000000000000039
	ldxa	[%i4+%o5]0x81,%l2	! %l2 = ffe7000000000000
!	Mem[0000000010141438] = bb48fd0c, %l2 = ffe7000000000000
	ldsh	[%i5+0x03a],%l2		! %l2 = fffffffffffffd0c
!	Mem[0000000010081408] = 00000000, %l3 = 0000000000000073
	ldswa	[%i2+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001404] = bb7b3782, %l2 = fffffffffffffd0c
	ldswa	[%i0+0x004]%asi,%l2	! %l2 = ffffffffbb7b3782
!	Mem[0000000020800040] = 00ffa3d2, %l3 = 0000000000000000
	ldsha	[%o1+0x040]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041410] = 000000ff, %l0 = 00000000ff000000
	ldsha	[%i1+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141408] = e3000049, %l1 = 00000000ffaab4bb
	lduwa	[%i5+%o4]0x89,%l1	! %l1 = 00000000e3000049
!	Mem[000000001018140c] = ff005756, %l4 = 0000000000000000
	ldsw	[%i6+0x00c],%l4		! %l4 = ffffffffff005756
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 00000000, %l4 = ffffffffff005756
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000000

p0_label_120:
!	Mem[00000000201c0000] = 009f2cc7, %l4 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141408] = 000000ff, %l5 = 00000000000000ff
	swapa	[%i5+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041400] = c6f0c4ed, %l0 = 00000000000000ff
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 000000c6000000ff
!	%l1 = 00000000e3000049, Mem[0000000030101400] = 000000d7ffffffff
	stxa	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000e3000049
!	Mem[0000000010041410] = ff000000, %l7 = ffffffffe1000000
	ldstuba	[%i1+%o5]0x80,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000300c1400] = ffffffff, %l6 = 00000000ffffffff
	ldstuba	[%i3+%g0]0x81,%l6	! %l6 = 000000ff000000ff
!	%f15 = ddf5adb2, Mem[0000000010001408] = 59000000
	sta	%f15,[%i0+%o4]0x88	! Mem[0000000010001408] = ddf5adb2
!	%l7 = 00000000000000ff, Mem[0000000030041400] = 000000ff
	stba	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ff
!	%l2 = ffffffffbb7b3782, Mem[0000000010101408] = 00107c62
	stha	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 00103782
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00ff0000, %l2 = ffffffffbb7b3782
	ldswa	[%i2+%o5]0x89,%l2	! %l2 = 0000000000ff0000

p0_label_121:
!	Mem[00000000300c1408] = 00000000, %l0 = 00000000000000c6
	ldsba	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101408] = 59000000, %f17 = 40a0db9a
	lda	[%i4+%o4]0x81,%f17	! %f17 = 59000000
!	Mem[0000000030101410] = ffe70000, %l5 = 00000000000000ff
	ldswa	[%i4+%o5]0x81,%l5	! %l5 = ffffffffffe70000
!	Mem[0000000030081400] = 00000049, %l3 = 00000000000000ff
	lduwa	[%i2+%g0]0x89,%l3	! %l3 = 0000000000000049
!	Mem[0000000010101410] = 00000000, %l5 = ffffffffffe70000
	lduha	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101408] = 00103782, %l6 = 00000000000000ff
	lduwa	[%i4+%o4]0x88,%l6	! %l6 = 0000000000103782
!	Mem[00000000100c1400] = 0000e9bb, %l2 = 0000000000ff0000
	ldsba	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041420] = ffffffff000000f6, %f0  = ff000000 00000000
	ldd	[%i1+0x020],%f0 	! %f0  = ffffffff 000000f6
!	%f18 = 00000000, %f31 = ff005756, %f13 = 39d2e96d
	fadds	%f18,%f31,%f13		! %f13 = ff005756
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 00000049, %l0 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000049

p0_label_122:
!	Mem[00000000211c0001] = ff597241, %l6 = 0000000000103782
	ldstub	[%o2+0x001],%l6		! %l6 = 00000059000000ff
!	%l3 = 0000000000000049, Mem[0000000030081408] = ff000000
	stwa	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000049
!	%f20 = ffffffff 000000ff, Mem[00000000300c1408] = 00000000 735700ff
	stda	%f20,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffffffff 000000ff
!	Mem[0000000030081408] = 00000049, %l1 = 00000000e3000049
	swapa	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000049
!	%l4 = 0000000000000000, Mem[0000000030081408] = e3000049
	stba	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000049
!	Code Fragment 4
p0_fragment_10:
!	%l0 = 0000000000000049
	setx	0x0a643627c8ccc23f,%g7,%l0 ! %l0 = 0a643627c8ccc23f
!	%l1 = 0000000000000049
	setx	0x6de00c1006ec356f,%g7,%l1 ! %l1 = 6de00c1006ec356f
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0a643627c8ccc23f
	setx	0x5219652874763c7f,%g7,%l0 ! %l0 = 5219652874763c7f
!	%l1 = 6de00c1006ec356f
	setx	0x460b36106ff449ba,%g7,%l1 ! %l1 = 460b36106ff449ba
!	%l5 = 0000000000000000, Mem[0000000010181408] = 596de9bb
	stwa	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000
!	%f1  = 000000f6, Mem[00000000300c1400] = ffffffff
	sta	%f1 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000f6
!	Mem[0000000021800140] = 84b45a3c, %l2 = 0000000000000000
	ldstub	[%o3+0x140],%l2		! %l2 = 00000084000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00000000000000ff, %f10 = 3b6aecaa e2ac9731
	ldda	[%i3+%o4]0x88,%f10	! %f10 = 00000000 000000ff

p0_label_123:
!	Mem[0000000010141410] = ff000000, %l6 = 0000000000000059
	ldswa	[%i5+%o5]0x80,%l6	! %l6 = ffffffffff000000
!	Mem[0000000010181410] = 596de9bb, %l3 = 0000000000000049
	ldsba	[%i6+%o5]0x88,%l3	! %l3 = ffffffffffffffbb
!	Mem[0000000010041400] = fff0c4ed00000059, %l5 = 0000000000000000
	ldxa	[%i1+%g0]0x80,%l5	! %l5 = fff0c4ed00000059
!	Mem[0000000030081410] = 00ff0000, %l4 = 0000000000000000
	ldswa	[%i2+%o5]0x89,%l4	! %l4 = 0000000000ff0000
!	Mem[0000000010101400] = 00000000 00000000, %l2 = 00000084, %l3 = ffffffbb
	ldda	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000020800040] = 00ffa3d2, %l2 = 0000000000000000
	lduh	[%o1+0x040],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010041400] = edc4f0ff, %l2 = 00000000000000ff
	lduha	[%i1+%g0]0x88,%l2	! %l2 = 000000000000f0ff
!	Mem[0000000020800040] = 00ffa3d2, %l7 = 00000000000000ff
	ldsh	[%o1+0x040],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010141408] = ff000000, %l1 = 460b36106ff449ba
	lduba	[%i5+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, imm = fffffffffffff803, %l6 = ffffffffff000000
	xnor	%l7,-0x7fd,%l6		! %l6 = 0000000000000703

p0_label_124:
!	%l7 = 00000000000000ff, Mem[0000000030141400] = 939563c7
	stwa	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000ff
!	%l5 = fff0c4ed00000059, Mem[0000000030101410] = 0000e7ff
	stwa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000059
!	%l7 = 00000000000000ff, %l2 = 000000000000f0ff, %l2 = 000000000000f0ff
	sdivx	%l7,%l2,%l2		! Div by zero, %l0 = 5219652874763ca7
!	%f4  = ffffffff a09fffff, %l2 = 0000000000000000
!	Mem[0000000030181420] = ff26b6e300000000
	add	%i6,0x020,%g1
	stda	%f4,[%g1+%l2]ASI_PST16_S ! Mem[0000000030181420] = ff26b6e300000000
!	Mem[0000000010101428] = 000000a0, %l7 = 00000000000000ff
	swap	[%i4+0x028],%l7		! %l7 = 00000000000000a0
!	%l0 = 74763c7f, %l1 = 000000ff, Mem[00000000100c1410] = 2f86e4ff 00000000
	stda	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 74763c7f 000000ff
!	%l4 = 0000000000ff0000, Mem[000000001018143a] = 5aa5c652
	sth	%l4,[%i6+0x03a]		! Mem[0000000010181438] = 5aa50000
!	%l0 = 74763c7f, %l1 = 000000ff, Mem[0000000030081400] = 00000000 ac77cded
	stda	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 74763c7f 000000ff
!	%l3 = 0000000000000000, Mem[0000000030041400] = ff000000
	stwa	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1418] = 2aeb6dff, %l3 = 0000000000000000
	ldsha	[%i3+0x018]%asi,%l3	! %l3 = 0000000000002aeb

p0_label_125:
!	Mem[0000000010141430] = bbb4aac3ee1c5974, %l1 = 00000000000000ff
	ldxa	[%i5+0x030]%asi,%l1	! %l1 = bbb4aac3ee1c5974
!	Mem[0000000030141410] = 00000059, %l5 = fff0c4ed00000059
	lduha	[%i5+%o5]0x89,%l5	! %l5 = 0000000000000059
	membar	#Sync			! Added by membar checker (19)
!	Mem[00000000300c1400] = f6000000 000000ff ffffffff 000000ff
!	Mem[00000000300c1410] = ff005773 00000000 754a7465 3857c2de
!	Mem[00000000300c1420] = 147fa279 6ad67029 7914086f 5aaa4153
!	Mem[00000000300c1430] = ae3ded1d f87c67df a2e1f9a7 58caeb5e
	ldda	[%i3]ASI_BLK_SL,%f0	! Block Load from 00000000300c1400
!	Mem[00000000211c0000] = ffff7241, %l2 = 0000000000000000
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010101438] = 09deefe5, %l3 = 0000000000002aeb
	lduw	[%i4+0x038],%l3		! %l3 = 0000000009deefe5
!	Mem[0000000010141430] = bbb4aac3, %l3 = 0000000009deefe5
	lduw	[%i5+0x030],%l3		! %l3 = 00000000bbb4aac3
!	Mem[0000000010101410] = 00000000000000e1, %f22 = 5590009d 20e4862f
	ldda	[%i4+%o5]0x80,%f22	! %f22 = 00000000 000000e1
!	Mem[000000001010140c] = 00000000, %l3 = 00000000bbb4aac3
	ldsw	[%i4+0x00c],%l3		! %l3 = 0000000000000000
!	Mem[0000000030101408] = 0000000000000059, %f20 = ffffffff 000000ff
	ldda	[%i4+%o4]0x89,%f20	! %f20 = 00000000 00000059
!	Starting 10 instruction Store Burst
!	Mem[0000000010101438] = 09deefe591710aaf, %l6 = 0000000000000703, %l1 = bbb4aac3ee1c5974
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l6,%l1	! %l1 = 09deefe591710aaf

p0_label_126:
!	%l1 = 09deefe591710aaf, Mem[0000000010041400] = edc4f0ff
	stwa	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 91710aaf
!	%l0 = 74763c7f, %l1 = 91710aaf, Mem[0000000010081410] = 000000e1 7379cabb
	stda	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = 74763c7f 91710aaf
!	%l0 = 5219652874763c7f, Mem[0000000030141408] = e3000049
	stwa	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 74763c7f
!	%l7 = 00000000000000a0, Mem[0000000010181410] = 596de9bb
	stha	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 596d00a0
!	Mem[0000000010041400] = 91710aaf, %l1 = 09deefe591710aaf
	swapa	[%i1+%g0]0x88,%l1	! %l1 = 0000000091710aaf
!	%f22 = 00000000, Mem[0000000010181408] = 00000000
	sta	%f22,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	%f20 = 00000000 00000059, %l6 = 0000000000000703
!	Mem[0000000010081430] = 000000e1b6a6bb80
	add	%i2,0x030,%g1
	stda	%f20,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010081430] = 59000000b6a6bb80
!	Mem[0000000010081428] = 0000ff006cb69670, %l1 = 0000000091710aaf, %l2 = ffffffffffffffff
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l1,%l2	! %l2 = 0000ff006cb69670
!	%l2 = 0000ff006cb69670, Mem[0000000010001420] = 26ffffff39104beb, %asi = 80
	stxa	%l2,[%i0+0x020]%asi	! Mem[0000000010001420] = 0000ff006cb69670
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000000, %l0 = 5219652874763c7f
	ldsha	[%i1+%g0]0x81,%l0	! %l0 = 0000000000000000

p0_label_127:
!	Mem[0000000010101408] = 8237100000000000, %f20 = 00000000 00000059
	ldda	[%i4+%o4]0x80,%f20	! %f20 = 82371000 00000000
!	%f21 = 00000000, %f16 = 00000000
	fcmpes	%fcc3,%f21,%f16		! %fcc3 = 0
!	Mem[0000000010041400] = af0a7191, %l0 = 0000000000000000
	ldsha	[%i1+%g0]0x80,%l0	! %l0 = ffffffffffffaf0a
!	%l0 = ffffffffffffaf0a, imm = fffffffffffffa34, %l5 = 0000000000000059
	subc	%l0,-0x5cc,%l5		! %l5 = ffffffffffffb4d6
!	Mem[0000000010081408] = 00000000, %l5 = ffffffffffffb4d6
	ldsha	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = ddf5adb2, %l1 = 0000000091710aaf
	ldsha	[%i0+%o4]0x88,%l1	! %l1 = ffffffffffffadb2
!	Mem[000000001010143c] = 91710aaf, %f16 = 00000000
	lda	[%i4+0x03c]%asi,%f16	! %f16 = 91710aaf
!	Mem[0000000010001400] = ffffffff, %f31 = ff005756
	lda	[%i0+%g0]0x80,%f31	! %f31 = ffffffff
!	Mem[0000000030001400] = bbe96d59, %l5 = 0000000000000000
	ldsba	[%i0+%g0]0x81,%l5	! %l5 = ffffffffffffffbb
!	Starting 10 instruction Store Burst
!	%f24 = 00000000 e3b626ff, Mem[00000000100c1408] = ff000000 00000000
	stda	%f24,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 e3b626ff

p0_label_128:
!	%l5 = ffffffffffffffbb, immd = ffffffffffffffb6, %l6 = 0000000000000703
	udivx	%l5,-0x04a,%l6		! %l6 = 0000000000000001
!	Mem[0000000030081400] = 7f3c7674, %l5 = ffffffffffffffbb
	swapa	[%i2+%g0]0x89,%l5	! %l5 = 000000007f3c7674
!	%l4 = 00ff0000, %l5 = 7f3c7674, Mem[0000000010001418] = d3110ddb 36ffd611
	std	%l4,[%i0+0x018]		! Mem[0000000010001418] = 00ff0000 7f3c7674
!	Mem[0000000010001408] = ddf5adb2, %l0 = ffffffffffffaf0a
	swapa	[%i0+%o4]0x88,%l0	! %l0 = 00000000ddf5adb2
	membar	#Sync			! Added by membar checker (20)
!	%l2 = 0000ff006cb69670, Mem[00000000300c1408] = ffffffff000000ff
	stxa	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000ff006cb69670
!	%l1 = ffffffffffffadb2, Mem[0000000030101400] = e3000049
	stba	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = e30000b2
!	Mem[0000000030001400] = 596de9bb, %l7 = 00000000000000a0
	swapa	[%i0+%g0]0x89,%l7	! %l7 = 00000000596de9bb
!	%l1 = ffffffffffffadb2, Mem[0000000021800181] = ffbea69f, %asi = 80
	stba	%l1,[%o3+0x181]%asi	! Mem[0000000021800180] = ffb2a69f
!	%f14 = 5eebca58 a7f9e1a2, Mem[0000000010001430] = ff26b6e3 ba4da1cf
	std	%f14,[%i0+0x030]	! Mem[0000000010001430] = 5eebca58 a7f9e1a2
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ff000000, %l5 = 000000007f3c7674
	lduha	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000000

p0_label_129:
!	Mem[0000000030141400] = 000000ff 020190ff, %l2 = 6cb69670, %l3 = 00000000
	ldda	[%i5+%g0]0x81,%l2	! %l2 = 00000000000000ff 00000000020190ff
!	Mem[0000000010001400] = ffffffffbb7b3782, %f24 = 00000000 e3b626ff
	ldda	[%i0+%g0]0x80,%f24	! %f24 = ffffffff bb7b3782
!	Mem[0000000030001408] = 00000000, %l2 = 00000000000000ff
	ldsba	[%i0+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101414] = 000000e1, %l2 = 0000000000000000
	lduw	[%i4+0x014],%l2		! %l2 = 00000000000000e1
!	Mem[0000000010141428] = e09cba41, %l3 = 00000000020190ff
	lduba	[%i5+0x02a]%asi,%l3	! %l3 = 00000000000000ba
!	Mem[0000000030001408] = 00000000, %l7 = 00000000596de9bb
	lduha	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101400] = 00000000e30000b2, %l4 = 0000000000ff0000
	ldxa	[%i4+%g0]0x89,%l4	! %l4 = 00000000e30000b2
!	Mem[0000000030041410] = 00000000, %f30 = 596de9bb
	lda	[%i1+%o5]0x81,%f30	! %f30 = 00000000
!	%f28 = bbb4aac3, %f31 = ffffffff
	fcmpes	%fcc2,%f28,%f31		! %fcc2 = 3
!	Starting 10 instruction Store Burst
!	%l0 = ddf5adb2, %l1 = ffffadb2, Mem[0000000010001400] = ffffffff 82377bbb
	stda	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = ddf5adb2 ffffadb2

p0_label_130:
!	%l5 = 0000000000000000, Mem[0000000010101410] = 00000000
	stba	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	%l4 = e30000b2, %l5 = 00000000, Mem[0000000010081410] = 7f3c7674 af0a7191
	stda	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = e30000b2 00000000
!	%f17 = 59000000, Mem[0000000030001400] = 000000a0
	sta	%f17,[%i0+%g0]0x89	! Mem[0000000030001400] = 59000000
!	%f18 = 00000000, Mem[0000000010101408] = 00103782
	sta	%f18,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	%l2 = 00000000000000e1, Mem[0000000030001400] = 00000059
	stha	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 00e10059
!	Mem[00000000201c0001] = ff9f2cc7, %l1 = ffffffffffffadb2
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 0000009f000000ff
!	%l0 = ddf5adb2, %l1 = 0000009f, Mem[0000000030001410] = ffffffff a09fffff
	stda	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = ddf5adb2 0000009f
!	%l3 = 00000000000000ba, Mem[0000000030081410] = 00ff0000
	stba	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = 00ff00ba
!	Mem[0000000010181408] = 00000000, %l2 = 00000000000000e1
	ldstuba	[%i6+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = f6000000 000000ff, %l2 = 00000000, %l3 = 000000ba
	ldda	[%i3+%g0]0x81,%l2	! %l2 = 00000000f6000000 00000000000000ff

p0_label_131:
!	Mem[0000000010141400] = ff000000 0000ff00, %l0 = ddf5adb2, %l1 = 0000009f
	ldda	[%i5+%g0]0x80,%l0	! %l0 = 00000000ff000000 000000000000ff00
!	Mem[0000000030041400] = 00000000, %f21 = 00000000
	lda	[%i1+%g0]0x89,%f21	! %f21 = 00000000
!	Mem[0000000030141410] = 5900000000000000, %l3 = 00000000000000ff
	ldxa	[%i5+%o5]0x81,%l3	! %l3 = 5900000000000000
!	Mem[00000000300c1400] = f6000000, %l1 = 000000000000ff00
	lduwa	[%i3+%g0]0x81,%l1	! %l1 = 00000000f6000000
!	Mem[0000000030081408] = 00000049 00000000, %l4 = e30000b2, %l5 = 00000000
	ldda	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000049 0000000000000000
!	Mem[0000000010001408] = 0aafffff3791c43b, %f0  = ff000000 000000f6
	ldda	[%i0+%o4]0x80,%f0 	! %f0  = 0aafffff 3791c43b
!	%f7  = 65744a75, %f26 = ffffffb7 000000f6
	fitod	%f7 ,%f26		! %f26 = 41d95d12 9d400000
!	Mem[0000000010141400] = ff000000, %f1  = 3791c43b
	lda	[%i5+%g0]0x80,%f1 	! %f1 = ff000000
!	Mem[0000000010181410] = ff0000e3596d00a0, %f26 = 41d95d12 9d400000
	ldda	[%i6+%o5]0x88,%f26	! %f26 = ff0000e3 596d00a0
!	Starting 10 instruction Store Burst
!	%f10 = 5341aa5a, Mem[00000000100c1408] = 00000000
	sta	%f10,[%i3+%o4]0x80	! Mem[00000000100c1408] = 5341aa5a

p0_label_132:
!	%l0 = 00000000ff000000, Mem[0000000010041410] = ff000000ff4b1039
	stxa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000ff000000
!	%l3 = 5900000000000000, Mem[0000000030081410] = 00ff00ba
	stwa	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	Mem[0000000030081400] = bbffffff, %l4 = 0000000000000049
	swapa	[%i2+%g0]0x81,%l4	! %l4 = 00000000bbffffff
!	%l0 = 00000000ff000000, Mem[0000000030041408] = e30000ff
	stha	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = e3000000
!	%f20 = 82371000 00000000, Mem[0000000030001410] = ddf5adb2 0000009f
	stda	%f20,[%i0+%o5]0x81	! Mem[0000000030001410] = 82371000 00000000
!	%f9  = 79a27f14, %f10 = 5341aa5a
	fcmps	%fcc1,%f9 ,%f10		! %fcc1 = 2
!	Mem[00000000218000c1] = ff23265e, %l7 = 0000000000000000
	ldstuba	[%o3+0x0c1]%asi,%l7	! %l7 = 00000023000000ff
!	%f6  = dec25738 65744a75, Mem[0000000010041430] = a1a4d897 ffffff82
	stda	%f6 ,[%i1+0x030]%asi	! Mem[0000000010041430] = dec25738 65744a75
!	Mem[0000000030181408] = 73000000, %l4 = 00000000bbffffff
	swapa	[%i6+%o4]0x81,%l4	! %l4 = 0000000073000000
!	Starting 10 instruction Load Burst
!	Mem[0000000021800080] = ea3d341e, %l1 = 00000000f6000000
	ldsh	[%o3+0x080],%l1		! %l1 = ffffffffffffea3d

p0_label_133:
!	Mem[000000001010142c] = ffffffff, %l2 = 00000000f6000000
	ldub	[%i4+0x02e],%l2		! %l2 = 00000000000000ff
!	%f20 = 82371000 00000000, Mem[0000000030181410] = ff000000 ffffffff
	stda	%f20,[%i6+%o5]0x81	! Mem[0000000030181410] = 82371000 00000000
!	Mem[0000000030001400] = 7379cabb 5900e100, %l6 = 00000001, %l7 = 00000023
	ldda	[%i0+%g0]0x89,%l6	! %l6 = 000000005900e100 000000007379cabb
!	Mem[0000000030141400] = 000000ff, %l4 = 0000000073000000
	lduba	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l3 = 5900000000000000
	lduba	[%i1+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081408] = 00000049, %l6 = 000000005900e100
	lduwa	[%i2+%o4]0x81,%l6	! %l6 = 0000000000000049
!	Mem[00000000100c1410] = 74763c7f, %l5 = 0000000000000000
	ldsba	[%i3+%o5]0x88,%l5	! %l5 = 000000000000007f
!	Mem[0000000010181400] = 565700ff, %l1 = ffffffffffffea3d
	lduba	[%i6+%g0]0x80,%l1	! %l1 = 0000000000000056
!	Mem[0000000010081410] = b20000e3, %f25 = bb7b3782
	lda	[%i2+%o5]0x88,%f25	! %f25 = b20000e3
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000007f, Mem[00000000300c1400] = f6000000
	stha	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = 007f0000

p0_label_134:
!	%f25 = b20000e3, Mem[0000000010141408] = ff000000
	sta	%f25,[%i5+%o4]0x80	! Mem[0000000010141408] = b20000e3
!	%f30 = 00000000 ffffffff, Mem[00000000300c1408] = 0000ff00 6cb69670
	stda	%f30,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000 ffffffff
!	%l3 = 0000000000000000, Mem[0000000010101400] = 0000000000000000
	stxa	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000000000000000
!	Mem[0000000010101408] = 00000000, %l7 = 000000007379cabb
	ldstuba	[%i4+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000010181404] = 06af2205
	sth	%l2,[%i6+0x004]		! Mem[0000000010181404] = 00ff2205
!	Mem[0000000030141410] = 00000059, %l1 = 0000000000000056
	lduwa	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000059
!	Mem[0000000010001400] = b2adf5dd, %l2 = 00000000000000ff
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 000000b2000000ff
!	%f1  = ff000000, Mem[00000000300c1408] = 00000000
	sta	%f1 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff000000
!	%l4 = 0000000000000000, Mem[0000000030001400] = 7379cabb5900e100
	stxa	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ff5ed75b, %l3 = 0000000000000000
	ldsh	[%o1+%g0],%l3		! %l3 = ffffffffffffff5e

p0_label_135:
!	Mem[00000000100c1408] = 5aaa4153, %l7 = 0000000000000000
	ldstuba	[%i3+%o4]0x88,%l7	! %l7 = 00000053000000ff
!	%f17 = 59000000, %f0  = 0aafffff
	fcmpes	%fcc0,%f17,%f0 		! %fcc0 = 2
!	Mem[0000000010141410] = ff000000, %l3 = ffffffffffffff5e
	lduwa	[%i5+%o5]0x80,%l3	! %l3 = 00000000ff000000
!	%l4 = 0000000000000000, immed = 000000e5, %y  = 00000000
	smul	%l4,0x0e5,%l4		! %l4 = 0000000000000000, %y = 00000000
!	Mem[0000000010001410] = 0000000000000000, %l6 = 0000000000000049
	ldxa	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1410] = 7f3c7674, %l5 = 000000000000007f
	ldsw	[%i3+%o5],%l5		! %l5 = 000000007f3c7674
!	Mem[0000000030181400] = 73000000bbb4aac3, %f26 = ff0000e3 596d00a0
	ldda	[%i6+%g0]0x81,%f26	! %f26 = 73000000 bbb4aac3
!	%l4 = 0000000000000000, immed = ffffff48, %y  = 00000000
	udiv	%l4,-0x0b8,%l5		! %l5 = 0000000000000000
	mov	%l0,%y			! %y = ff000000
!	Mem[0000000010041400] = af0a7191, %l1 = 0000000000000059
	lduha	[%i1+%g0]0x80,%l1	! %l1 = 000000000000af0a
!	Starting 10 instruction Store Burst
!	%f23 = 000000e1, Mem[0000000010081400] = ff000000
	sta	%f23,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000e1

p0_label_136:
!	%f25 = b20000e3, Mem[0000000010081408] = 00000000
	sta	%f25,[%i2+%o4]0x88	! Mem[0000000010081408] = b20000e3
!	%l1 = 000000000000af0a, Mem[0000000010081420] = 0000000000000000
	stx	%l1,[%i2+0x020]		! Mem[0000000010081420] = 000000000000af0a
!	%f3  = ffffffff, Mem[0000000030001400] = 00000000
	sta	%f3 ,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffffff
!	%f4  = 00000000 735700ff, Mem[0000000030041400] = 00000000 b7000000
	stda	%f4 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000 735700ff
!	%l0 = 00000000ff000000, Mem[0000000030041400] = ff005773
	stha	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 00005773
!	%l4 = 0000000000000000, Mem[0000000010101408] = ff000000
	stba	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	Mem[0000000010041410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i1+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	%l7 = 0000000000000053, Mem[0000000030001410] = 00103782
	stha	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = 00100053
!	%l6 = 0000000000000000, Mem[0000000010141410] = ff000000000000e3
	stxa	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181438] = 5aa50000, %l2 = 00000000000000b2
	lduw	[%i6+0x038],%l2		! %l2 = 000000005aa50000

p0_label_137:
!	Mem[0000000010181400] = 565700ff, %l4 = 0000000000000000
	lduba	[%i6+%g0]0x80,%l4	! %l4 = 0000000000000056
!	Mem[0000000010101408] = 0000000000000000, %f22 = 00000000 000000e1
	ldda	[%i4+%o4]0x88,%f22	! %f22 = 00000000 00000000
!	Mem[0000000030101410] = 59000000, %l0 = 00000000ff000000
	ldswa	[%i4+%o5]0x81,%l0	! %l0 = 0000000059000000
!	Mem[0000000010181408] = ff000000, %l2 = 000000005aa50000
	lduwa	[%i6+%o4]0x80,%l2	! %l2 = 00000000ff000000
!	Mem[0000000010141408] = b20000e3, %f31 = ffffffff
	lda	[%i5+%o4]0x80,%f31	! %f31 = b20000e3
!	Mem[0000000030181410] = 00103782, %l2 = 00000000ff000000
	ldsba	[%i6+%o5]0x89,%l2	! %l2 = ffffffffffffff82
!	Mem[00000000201c0000] = ffff2cc7, %l2 = ffffffffffffff82
	lduha	[%o0+0x000]%asi,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010141434] = ee1c5974, %l1 = 000000000000af0a
	lduha	[%i5+0x034]%asi,%l1	! %l1 = 000000000000ee1c
!	Mem[0000000010141428] = e09cba412302b620, %f8  = 2970d66a 79a27f14
	ldda	[%i5+0x028]%asi,%f8 	! %f8  = e09cba41 2302b620
!	Starting 10 instruction Store Burst
!	%f0  = 0aafffff ff000000 ff000000 ffffffff
!	%f4  = 00000000 735700ff dec25738 65744a75
!	%f8  = e09cba41 2302b620 5341aa5a 6f081479
!	%f12 = df677cf8 1ded3dae 5eebca58 a7f9e1a2
	stda	%f0,[%i0]ASI_COMMIT_S	! Block Store to 0000000030001400

p0_label_138:
!	Mem[0000000030041400] = 73570000, %l5 = 0000000000000000
	swapa	[%i1+%g0]0x89,%l5	! %l5 = 0000000073570000
!	Mem[0000000010081430] = 59000000, %l4 = 0000000000000056
	swap	[%i2+0x030],%l4		! %l4 = 0000000059000000
!	%l1 = 000000000000ee1c, Mem[0000000010101430] = 00000000, %asi = 80
	stwa	%l1,[%i4+0x030]%asi	! Mem[0000000010101430] = 0000ee1c
!	%l5 = 0000000073570000, Mem[00000000218000c0] = ffff265e
	stb	%l5,[%o3+0x0c0]		! Mem[00000000218000c0] = 00ff265e
!	Mem[0000000010141408] = b20000e3, %l5 = 0000000073570000
	ldstuba	[%i5+%o4]0x80,%l5	! %l5 = 000000b2000000ff
!	%l3 = 00000000ff000000, Mem[0000000010181408] = ff000000
	stba	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000
!	Mem[0000000030181410] = 82371000, %l6 = 0000000000000000
	ldsha	[%i6+%o5]0x81,%l6	! %l6 = ffffffffffff8237
!	%l1 = 000000000000ee1c, immed = 00000c0c, %y  = ff000000
	sdiv	%l1,0xc0c,%l4		! %l4 = ffffffff80000000
	mov	%l0,%y			! %y = 59000000
!	%l6 = ffffffffffff8237, Mem[0000000010081410] = b20000e3
	stha	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = b2008237
!	Starting 10 instruction Load Burst
!	Mem[0000000021800100] = 3bffd236, %l3 = 00000000ff000000
	ldsha	[%o3+0x100]%asi,%l3	! %l3 = 0000000000003bff

p0_label_139:
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000010001400] = ffadf5dd, %f26 = 73000000
	lda	[%i0+%g0]0x80,%f26	! %f26 = ffadf5dd
!	Mem[0000000010041428] = 5aa5c652, %l1 = 000000000000ee1c
	ldsha	[%i1+0x028]%asi,%l1	! %l1 = 0000000000005aa5
!	Mem[0000000010101408] = 00000000, %l5 = 00000000000000b2
	lduba	[%i4+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = ff005756, %l7 = 0000000000000053
	lduha	[%i6+%g0]0x88,%l7	! %l7 = 0000000000005756
!	Mem[0000000010001408] = 3bc49137 ffffaf0a, %l6 = ffff8237, %l7 = 00005756
	ldda	[%i0+%o4]0x88,%l6	! %l6 = 00000000ffffaf0a 000000003bc49137
!	Mem[0000000010041400] = af0a7191, %l2 = 000000000000ffff
	ldswa	[%i1+%g0]0x80,%l2	! %l2 = ffffffffaf0a7191
!	Mem[0000000010041408] = ffff0000240b06fe, %l0 = 0000000059000000
	ldxa	[%i1+%o4]0x80,%l0	! %l0 = ffff0000240b06fe
!	Mem[00000000100c1408] = ff26b6e3 5aaa41ff, %l2 = af0a7191, %l3 = 00003bff
	ldda	[%i3+%o4]0x88,%l2	! %l2 = 000000005aaa41ff 00000000ff26b6e3
!	Mem[0000000010181410] = a0006d59, %l1 = 0000000000005aa5
	ldsba	[%i6+%o5]0x80,%l1	! %l1 = ffffffffffffffa0
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = ffff0000, %l0 = ffff0000240b06fe
	ldstuba	[%i1+%o4]0x80,%l0	! %l0 = 000000ff000000ff

p0_label_140:
!	Mem[0000000010101408] = 00000000, %l1 = ffffffffffffffa0
	ldstuba	[%i4+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%f1  = ff000000, Mem[000000001018141c] = bbcaffff
	st	%f1 ,[%i6+0x01c]	! Mem[000000001018141c] = ff000000
!	%l1 = 0000000000000000, immed = 00000e8c, %y  = 59000000
	udiv	%l1,0xe8c,%l0		! %l0 = 00000000ffffffff
	mov	%l0,%y			! %y = ffffffff
!	%l0 = 00000000ffffffff, Mem[0000000020800001] = ff5ed75b
	stb	%l0,[%o1+0x001]		! Mem[0000000020800000] = ffffd75b
!	%l0 = 00000000ffffffff, Mem[0000000010181404] = 00ff2205, %asi = 80
	stha	%l0,[%i6+0x004]%asi	! Mem[0000000010181404] = ffff2205
!	%l6 = 00000000ffffaf0a, Mem[0000000030141410] = 00000059
	stha	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000af0a
!	Mem[0000000030101408] = 59000000, %l5 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l5	! %l5 = 0000000059000000
!	%l2 = 000000005aaa41ff, Mem[00000000201c0000] = ffff2cc7, %asi = 80
	stba	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = ffff2cc7
!	Mem[000000001010141b] = b5362b7c, %l6 = 00000000ffffaf0a
	ldstub	[%i4+0x01b],%l6		! %l6 = 0000007c000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 000000ffffffffff, %l6 = 000000000000007c
	ldxa	[%i3+%o4]0x81,%l6	! %l6 = 000000ffffffffff

p0_label_141:
!	Mem[0000000010081428] = 0000ff00, %l1 = 0000000000000000
	lduha	[%i2+0x028]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181410] = 00103782, %l7 = 000000003bc49137
	lduba	[%i6+%o5]0x89,%l7	! %l7 = 0000000000000082
!	Mem[0000000010041400] = af0a7191, %l5 = 0000000059000000
	lduha	[%i1+%g0]0x80,%l5	! %l5 = 000000000000af0a
!	Mem[0000000030181408] = 73000000ffffffbb, %f6  = dec25738 65744a75
	ldda	[%i6+%o4]0x89,%f6 	! %f6  = 73000000 ffffffbb
!	Mem[0000000010101438] = 09deefe5, %f27 = bbb4aac3
	ld	[%i4+0x038],%f27	! %f27 = 09deefe5
!	Mem[0000000030181408] = bbffffff, %l1 = 0000000000000000
	lduba	[%i6+%o4]0x81,%l1	! %l1 = 00000000000000bb
!	Mem[0000000030101408] = 0000000000000000, %l3 = 00000000ff26b6e3
	ldxa	[%i4+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041410] = ff000000, %l2 = 000000005aaa41ff
	lduba	[%i1+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181408] = 00000000, %l1 = 00000000000000bb
	lduba	[%i6+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000082, Mem[0000000010081408] = b20000e3
	stha	%l7,[%i2+%o4]0x88	! Mem[0000000010081408] = b2000082

p0_label_142:
!	Mem[0000000010041400] = af0a7191, %l7 = 0000000000000082
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 00000000af0a7191
!	Mem[0000000010001408] = ffffaf0a, %l4 = ffffffff80000000
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 0000000a000000ff
!	%l3 = 0000000000000000, Mem[0000000010001410] = 00000000
	stwa	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	%l0 = 00000000ffffffff, Mem[0000000030181400] = 00000073
	stha	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000ffff
!	%f7  = ffffffbb, Mem[00000000100c1408] = ff41aa5a
	sta	%f7 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffffffbb
!	%f18 = 00000000 020190ff, %l7 = 00000000af0a7191
!	Mem[0000000010141410] = 0000000000000000
	add	%i5,0x010,%g1
	stda	%f18,[%g1+%l7]ASI_PST16_P ! Mem[0000000010141410] = 00000000000090ff
!	Mem[0000000010001400] = ffadf5dd, %l7 = af0a7191, %l1 = 00000000
	casa	[%i0]0x80,%l7,%l1	! %l1 = 00000000ffadf5dd
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010001430] = 5eebca58 a7f9e1a2
	stda	%l2,[%i0+0x030]%asi	! Mem[0000000010001430] = 000000ff 00000000
!	%f28 = bbb4aac3, %f19 = 020190ff
	fcmpes	%fcc0,%f28,%f19		! %fcc0 = 1
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00000000, %l1 = 00000000ffadf5dd
	lduba	[%i5+%o5]0x80,%l1	! %l1 = 0000000000000000

p0_label_143:
!	Mem[00000000100c1430] = 2c7cf65d ff40b0a1, %l4 = 0000000a, %l5 = 0000af0a
	ldda	[%i3+0x030]%asi,%l4	! %l4 = 000000002c7cf65d 00000000ff40b0a1
!	Mem[0000000010141400] = 000000ff, %l2 = 00000000000000ff
	lduha	[%i5+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081400] = 49000000, %f11 = 6f081479
	lda	[%i2+%g0]0x89,%f11	! %f11 = 49000000
!	Mem[0000000020800040] = 00ffa3d2, %l0 = 00000000ffffffff
	ldub	[%o1+0x041],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010001408] = ffffafff, %l0 = 00000000000000ff
	lduwa	[%i0+%o4]0x88,%l0	! %l0 = 00000000ffffafff
!	Mem[0000000010141400] = 000000ff, %f19 = 020190ff
	lda	[%i5+%g0]0x88,%f19	! %f19 = 000000ff
!	Mem[00000000300c1400] = 007f0000 000000ff 000000ff ffffffff
!	Mem[00000000300c1410] = ff005773 00000000 754a7465 3857c2de
!	Mem[00000000300c1420] = 147fa279 6ad67029 7914086f 5aaa4153
!	Mem[00000000300c1430] = ae3ded1d f87c67df a2e1f9a7 58caeb5e
	ldda	[%i3]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010001408] = ffffafff, %l6 = 000000ffffffffff
	ldsha	[%i0+%o4]0x88,%l6	! %l6 = ffffffffffffafff
!	Mem[0000000020800040] = 00ffa3d2, %l1 = 0000000000000000
	ldsb	[%o1+0x041],%l1		! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f2  = ff000000 ffffffff, Mem[0000000010081408] = 820000b2 00000029
	stda	%f2 ,[%i2+%o4]0x80	! Mem[0000000010081408] = ff000000 ffffffff

p0_label_144:
!	%f11 = 49000000, %f9  = 2302b620, %f13 = 1ded3dae
	fadds	%f11,%f9 ,%f13		! %f13 = 49000000
	membar	#Sync			! Added by membar checker (22)
!	%f6  = 73000000 ffffffbb, Mem[00000000300c1408] = 000000ff ffffffff
	stda	%f6 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = 73000000 ffffffbb
!	%f6  = 73000000 ffffffbb, %l3 = 0000000000000000
!	Mem[0000000030141418] = 42f8eae1f2122ff3
	add	%i5,0x018,%g1
	stda	%f6,[%g1+%l3]ASI_PST32_SL ! Mem[0000000030141418] = 42f8eae1f2122ff3
!	%f4  = 00000000 735700ff, %l1 = ffffffffffffffff
!	Mem[00000000100c1438] = 0054bbb4ffffffbf
	add	%i3,0x038,%g1
	stda	%f4,[%g1+%l1]ASI_PST16_PL ! Mem[00000000100c1438] = ff00577300000000
!	%f19 = ffffffff, Mem[00000000100c1400] = 0000e9bb
	sta	%f19,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffffffff
!	%f7  = ffffffbb, Mem[0000000010141410] = 00000000
	sta	%f7 ,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffffbb
!	Mem[00000000100c1408] = ffffffbb, %l2 = 000000ff, %l4 = 2c7cf65d
	add	%i3,0x08,%g1
	casa	[%g1]0x80,%l2,%l4	! %l4 = 00000000ffffffbb
!	%f18 = 000000ff, Mem[000000001004141c] = ffffff82
	sta	%f18,[%i1+0x01c]%asi	! Mem[000000001004141c] = 000000ff
!	%l4 = 00000000ffffffbb, Mem[0000000010081420] = 00000000, %asi = 80
	stha	%l4,[%i2+0x020]%asi	! Mem[0000000010081420] = ffbb0000
!	Starting 10 instruction Load Burst
!	%f17 = 000000ff, %f28 = ae3ded1d
	fsqrts	%f17,%f28		! %l0 = 00000000ffffb021, Unfinished, %fsr = 0e00000400

p0_label_145:
!	Mem[0000000030101400] = b20000e3, %l5 = 00000000ff40b0a1
	lduha	[%i4+%g0]0x81,%l5	! %l5 = 000000000000b200
!	Mem[0000000030101400] = b20000e3, %f1  = ff000000
	lda	[%i4+%g0]0x81,%f1 	! %f1 = b20000e3
!	Mem[0000000030041410] = 00000000, %l4 = 00000000ffffffbb
	lduba	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141400] = ff000000, %l7 = 00000000af0a7191
	ldsba	[%i5+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081400] = 000000e1, %l1 = ffffffffffffffff
	ldswa	[%i2+%g0]0x80,%l1	! %l1 = 00000000000000e1
!	Mem[0000000010181410] = 596d00a0, %l3 = 0000000000000000
	ldsha	[%i6+%o5]0x88,%l3	! %l3 = 00000000000000a0
!	Mem[0000000010041410] = ff000000, %l7 = 0000000000000000
	ldsw	[%i1+%o5],%l7		! %l7 = ffffffffff000000
!	Mem[0000000030081408] = 0000000049000000, %f12 = df677cf8 49000000
	ldda	[%i2+%o4]0x89,%f12	! %f12 = 00000000 49000000
!	Mem[00000000100c1438] = ff005773, %l3 = 00000000000000a0
	ldsh	[%i3+0x03a],%l3		! %l3 = 0000000000005773
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 0000ffff, %l7 = ffffffffff000000
	ldstuba	[%i1+%o4]0x88,%l7	! %l7 = 000000ff000000ff

p0_label_146:
!	Mem[0000000010101410] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i4+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1400] = ffffffff, %l2 = 00000000000000ff, %asi = 80
	swapa	[%i3+0x000]%asi,%l2	! %l2 = 00000000ffffffff
!	%l5 = 000000000000b200, Mem[0000000030041400] = 00000000
	stwa	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000b200
!	Mem[0000000010181410] = a0006d59, %l6 = ffffffffffffafff, %asi = 80
	swapa	[%i6+0x010]%asi,%l6	! %l6 = 00000000a0006d59
!	%f6  = 73000000, %f7  = ffffffbb, %f15 = a7f9e1a2
	fadds	%f6 ,%f7 ,%f15		! %f15 = ffffffbb
!	%l2 = 00000000ffffffff, Mem[00000000100c1400] = 000000ff
	stba	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = ff0000ff
!	%l4 = 0000000000000000, Mem[0000000010041420] = ffffffff000000f6, %asi = 80
	stxa	%l4,[%i1+0x020]%asi	! Mem[0000000010041420] = 0000000000000000
!	%f2  = ff000000, %f9  = 2302b620, %f19 = ffffffff
	fmuls	%f2 ,%f9 ,%f19		! %f19 = e282b620
!	%l2 = 00000000ffffffff, Mem[0000000010141434] = ee1c5974, %asi = 80
	stwa	%l2,[%i5+0x034]%asi	! Mem[0000000010141434] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181428] = 00000000c90a45ff, %f22 = 754a7465 3857c2de
	ldda	[%i6+0x028]%asi,%f22	! %f22 = 00000000 c90a45ff

p0_label_147:
!	Mem[0000000030081408] = 49000000, %l0 = 00000000ffffb021
	ldswa	[%i2+%o4]0x89,%l0	! %l0 = 0000000049000000
!	Mem[0000000030101408] = 0000000000000000, %l0 = 0000000049000000
	ldxa	[%i4+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = 000000ff, %l5 = 000000000000b200
	ldswa	[%i5+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1400] = 007f0000000000ff, %f20 = ff005773 00000000
	ldda	[%i3+%g0]0x81,%f20	! %f20 = 007f0000 000000ff
!	Mem[0000000010001410] = 0000000000000000, %f20 = 007f0000 000000ff
	ldda	[%i0+%o5]0x88,%f20	! %f20 = 00000000 00000000
!	Mem[00000000211c0000] = ffff7241, %l1 = 00000000000000e1
	ldsb	[%o2+0x001],%l1		! %l1 = ffffffffffffffff
!	%l2 = 00000000ffffffff, immd = fffffffffffff7f6, %l2  = 00000000ffffffff
	mulx	%l2,-0x80a,%l2		! %l2 = fffff7f60000080a
!	Mem[0000000010041408] = ffff0000240b06fe, %l1 = ffffffffffffffff
	ldxa	[%i1+%o4]0x80,%l1	! %l1 = ffff0000240b06fe
!	Mem[0000000010101400] = 0000000000000000, %l3 = 0000000000005773
	ldxa	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = ff900102ff000000, %f14 = 5eebca58 ffffffbb
	ldda	[%i5+%g0]0x89,%f14	! %f14 = ff900102 ff000000

p0_label_148:
!	%l2 = fffff7f60000080a, Mem[00000000100c1408] = bbffffff
	stba	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = bbffff0a
!	Mem[0000000010101434] = 214d006f, %l2 = fffff7f60000080a, %asi = 80
	swapa	[%i4+0x034]%asi,%l2	! %l2 = 00000000214d006f
!	Mem[0000000010081410] = b2008237, %l2 = 00000000214d006f
	swapa	[%i2+%o5]0x88,%l2	! %l2 = 00000000b2008237
!	%f3  = ffffffff, Mem[0000000010041400] = 00000082
	sta	%f3 ,[%i1+%g0]0x80	! Mem[0000000010041400] = ffffffff
!	%l5 = 00000000000000ff, Mem[0000000010181408] = 00000000
	stha	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 00ff0000
!	%l6 = 00000000a0006d59, Mem[0000000010001400] = ffffadb2ddf5adff
	stxa	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000a0006d59
!	Mem[000000001018141c] = ff000000, %l2 = 00000000b2008237, %asi = 80
	swapa	[%i6+0x01c]%asi,%l2	! %l2 = 00000000ff000000
!	Mem[0000000010041434] = 65744a75, %l2 = 00000000ff000000, %asi = 80
	swapa	[%i1+0x034]%asi,%l2	! %l2 = 0000000065744a75
!	%l2 = 0000000065744a75, Mem[00000000300c1408] = 73000000
	stba	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 75000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 000000e1 ffffffff, %l6 = a0006d59, %l7 = 00000000
	ldd	[%i2+%g0],%l6		! %l6 = 00000000000000e1 00000000ffffffff

p0_label_149:
!	Mem[0000000010081410] = 6f004d21, %l6 = 00000000000000e1
	lduba	[%i2+%o5]0x80,%l6	! %l6 = 000000000000006f
!	Mem[00000000300c1410] = ff005773, %l6 = 000000000000006f
	ldswa	[%i3+%o5]0x81,%l6	! %l6 = ffffffffff005773
!	%l4 = 0000000000000000, immed = fffff03f, %y  = ffffffff
	smul	%l4,-0xfc1,%l5		! %l5 = 0000000000000000, %y = 00000000
!	Mem[0000000010101400] = 00000000 00000000, %l2 = 65744a75, %l3 = 00000000
	ldda	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000030001408] = ff000000ffffffff, %l6 = ffffffffff005773
	ldxa	[%i0+%o4]0x81,%l6	! %l6 = ff000000ffffffff
!	Mem[0000000010141408] = e30000ff, %l4 = 0000000000000000
	ldsba	[%i5+%o4]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010101428] = 000000ff, %f2  = ff000000
	lda	[%i4+0x028]%asi,%f2 	! %f2 = 000000ff
!	Mem[000000001008141c] = bb7b3782, %l3 = 0000000000000000
	lduba	[%i2+0x01d]%asi,%l3	! %l3 = 000000000000007b
!	Mem[0000000030141400] = 000000ff, %l2 = 0000000000000000
	ldsha	[%i5+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f16 = 007f0000 000000ff 000000ff e282b620
!	%f20 = 00000000 00000000 00000000 c90a45ff
!	%f24 = 147fa279 6ad67029 7914086f 5aaa4153
!	%f28 = ae3ded1d f87c67df a2e1f9a7 58caeb5e
	stda	%f16,[%i2]ASI_BLK_SL	! Block Store to 0000000030081400

p0_label_150:
!	Mem[000000001018143d] = 5f28aa86, %l5 = 0000000000000000
	ldstuba	[%i6+0x03d]%asi,%l5	! %l5 = 00000028000000ff
!	%f10 = 5341aa5a 49000000, Mem[00000000300c1408] = 00000075 bbffffff
	stda	%f10,[%i3+%o4]0x89	! Mem[00000000300c1408] = 5341aa5a 49000000
!	Mem[0000000030041400] = 00b20000, %l1 = ffff0000240b06fe
	swapa	[%i1+%g0]0x81,%l1	! %l1 = 0000000000b20000
!	%l6 = ff000000ffffffff, Mem[000000001000141f] = 7f3c7674, %asi = 80
	stba	%l6,[%i0+0x01f]%asi	! Mem[000000001000141c] = 7f3c76ff
!	%l2 = 00000000, %l3 = 0000007b, Mem[0000000010181408] = 00ff0000 ff005756
	stda	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 0000007b
!	%f6  = 73000000 ffffffbb, Mem[00000000100c1438] = ff005773 00000000
	stda	%f6 ,[%i3+0x038]%asi	! Mem[00000000100c1438] = 73000000 ffffffbb
!	%l5 = 0000000000000028, Mem[0000000030041400] = 240b06fe
	stha	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = 002806fe
!	%l2 = 0000000000000000, Mem[0000000030081410] = 0000000000000000
	stxa	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010181400] = 565700ff
	stba	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 005700ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 49000000, %l5 = 0000000000000028
	lduwa	[%i3+%o4]0x89,%l5	! %l5 = 0000000049000000

p0_label_151:
!	Mem[0000000010041400] = ffffffff, %l4 = ffffffffffffffff
	lduba	[%i1+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141410] = ffffffbb, %l6 = ff000000ffffffff
	ldswa	[%i5+%o5]0x80,%l6	! %l6 = ffffffffffffffbb
!	Mem[00000000100c1408] = bbffff0a, %l2 = 0000000000000000
	ldswa	[%i3+%o4]0x88,%l2	! %l2 = ffffffffbbffff0a
!	Mem[0000000010141410] = bbffffff, %l7 = 00000000ffffffff
	ldswa	[%i5+%o5]0x88,%l7	! %l7 = ffffffffbbffffff
!	Code Fragment 3
p0_fragment_11:
!	%l0 = 0000000000000000
	setx	0x01b322e7b24990b2,%g7,%l0 ! %l0 = 01b322e7b24990b2
!	%l1 = 0000000000b20000
	setx	0x84d32be04306f12d,%g7,%l1 ! %l1 = 84d32be04306f12d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 01b322e7b24990b2
	setx	0xa6c13ea836222f29,%g7,%l0 ! %l0 = a6c13ea836222f29
!	%l1 = 84d32be04306f12d
	setx	0xc23db7105109219c,%g7,%l1 ! %l1 = c23db7105109219c
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000030081410] = 00000000, %l6 = ffffffffffffffbb
	lduwa	[%i2+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101428] = 000000ff, %l2 = ffffffffbbffff0a
	lduh	[%i4+0x02a],%l2		! %l2 = 00000000000000ff
!	%l6 = 0000000000000000, %l4 = 00000000000000ff, %l2 = 00000000000000ff
	add	%l6,%l4,%l2		! %l2 = 00000000000000ff
!	Mem[00000000211c0000] = ffff7241, %l6 = 0000000000000000
	ldsha	[%o2+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f20 = 00000000, Mem[00000000300c1408] = 49000000
	sta	%f20,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000

p0_label_152:
!	Mem[0000000030081410] = 00000000, %l6 = ffffffffffffffff
	swapa	[%i2+%o5]0x89,%l6	! %l6 = 0000000000000000
!	%f12 = 00000000 49000000, Mem[0000000010041408] = ffff0000 240b06fe
	std	%f12,[%i1+%o4]	! Mem[0000000010041408] = 00000000 49000000
!	%l1 = c23db7105109219c, Mem[0000000030101408] = 0000000000000000
	stxa	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = c23db7105109219c
!	%f4  = 00000000 735700ff, Mem[0000000030081400] = 000000ff 007f0000
	stda	%f4 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000 735700ff
!	Mem[0000000010001410] = 00000000, %l7 = ffffffffbbffffff
	swapa	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181410] = 82371000, %l6 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l6	! %l6 = 00000082000000ff
!	Mem[0000000030141400] = ff000000, %l1 = c23db7105109219c
	ldstuba	[%i5+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%l2 = 000000ff, %l3 = 0000007b, Mem[00000000100c1430] = 2c7cf65d ff40b0a1
	std	%l2,[%i3+0x030]		! Mem[00000000100c1430] = 000000ff 0000007b
!	%l4 = 00000000000000ff, Mem[0000000030141400] = ff900102ff0000ff
	stxa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff005773, %l0 = a6c13ea836222f29
	lduwa	[%i3+%o5]0x81,%l0	! %l0 = 00000000ff005773

p0_label_153:
!	Mem[0000000010101408] = ff000000, %l7 = 0000000000000000
	ldswa	[%i4+%o4]0x80,%l7	! %l7 = ffffffffff000000
!	Mem[0000000010101408] = 000000ff, %l3 = 000000000000007b
	ldsba	[%i4+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000300c1400] = 00007f00, %l0 = 00000000ff005773
	lduwa	[%i3+%g0]0x89,%l0	! %l0 = 0000000000007f00
!	Mem[00000000100c1410] = 7f3c7674ff000000, %f12 = 00000000 49000000
	ldda	[%i3+0x010]%asi,%f12	! %f12 = 7f3c7674 ff000000
!	Mem[0000000010001400] = 596d00a0, %l6 = 0000000000000082
	lduwa	[%i0+%g0]0x80,%l6	! %l6 = 00000000596d00a0
!	Mem[0000000010081408] = ff000000, %l2 = 00000000000000ff
	ldsba	[%i2+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[000000001000143c] = 000000e3, %l4 = 00000000000000ff
	lduw	[%i0+0x03c],%l4		! %l4 = 00000000000000e3
!	Mem[0000000010041408] = 00000000, %l4 = 00000000000000e3
	ldsba	[%i1+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041408] = 00000000 49000000, %l2 = ffffffff, %l3 = ffffffff
	ldda	[%i1+%o4]0x80,%l2	! %l2 = 0000000000000000 0000000049000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 49000000, Mem[00000000100c1410] = 7f3c7674 ff000000
	stda	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000 49000000

p0_label_154:
!	%f24 = 147fa279, Mem[0000000010081408] = ff000000
	sta	%f24,[%i2+%o4]0x80	! Mem[0000000010081408] = 147fa279
!	%l3 = 0000000049000000, Mem[000000001014143c] = 000000e3
	stw	%l3,[%i5+0x03c]		! Mem[000000001014143c] = 49000000
!	Mem[0000000010141410] = bbffffff, %l5 = 0000000049000000
	swapa	[%i5+%o5]0x88,%l5	! %l5 = 00000000bbffffff
!	%l4 = 0000000000000000, Mem[0000000010081408] = 79a27f14
	stba	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 79a27f00
!	%f5  = 735700ff, Mem[0000000010081400] = e1000000
	sta	%f5 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 735700ff
!	%f24 = 147fa279 6ad67029, %l2 = 0000000000000000
!	Mem[0000000030101438] = 88e53d7b0cfd48bb
	add	%i4,0x038,%g1
	stda	%f24,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030101438] = 88e53d7b0cfd48bb
!	Mem[00000000100c1400] = ff0000ff, %l1 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l1	! %l1 = 00000000ff0000ff
!	%l0 = 00007f00, %l1 = ff0000ff, Mem[0000000030181410] = 001037ff 00000000
	stda	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 00007f00 ff0000ff
!	%l2 = 00000000, %l3 = 49000000, Mem[0000000030181410] = 007f0000 ff0000ff
	stda	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000 49000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 005700ff ffff2205, %l4 = 00000000, %l5 = bbffffff
	ldda	[%i6+%g0]0x80,%l4	! %l4 = 00000000005700ff 00000000ffff2205

p0_label_155:
!	Mem[0000000010081428] = 0000ff006cb69670, %l7 = ffffffffff000000
	ldx	[%i2+0x028],%l7		! %l7 = 0000ff006cb69670
!	Mem[0000000010081400] = ff005773, %l1 = 00000000ff0000ff
	ldsha	[%i2+%g0]0x80,%l1	! %l1 = ffffffffffffff00
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000030101400] = b20000e3 00000000 c23db710 5109219c
!	Mem[0000000030101410] = 59000000 00000000 2f86e420 9d009055
!	Mem[0000000030101420] = 00000080 2e8bc3c5 00000000 ffffff7f
!	Mem[0000000030101430] = 74591cee c3aab4bb 88e53d7b 0cfd48bb
	ldda	[%i4]ASI_BLK_AIUS,%f16	! Block Load from 0000000030101400
!	Mem[0000000010001400] = a0006d59, %l4 = 00000000005700ff
	lduba	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000059
!	Mem[0000000010081418] = e5592105, %l2 = 0000000000000000
	ldsba	[%i2+0x01b]%asi,%l2	! %l2 = 0000000000000005
!	%l2 = 0000000000000005, %l3 = 0000000049000000, %y  = 00000000
	umul	%l2,%l3,%l0		! %l0 = 000000016d000000, %y = 00000001
!	Mem[0000000010141410] = 00000049, %l1 = ffffffffffffff00
	lduba	[%i5+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001410] = 00000000735700ff, %l3 = 0000000049000000
	ldxa	[%i0+%o5]0x81,%l3	! %l3 = 00000000735700ff
!	Mem[0000000010081408] = 007fa279, %l2 = 0000000000000005
	lduwa	[%i2+0x008]%asi,%l2	! %l2 = 00000000007fa279
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 00000000, %l2 = 00000000007fa279
	ldstuba	[%i1+%o4]0x88,%l2	! %l2 = 00000000000000ff

p0_label_156:
!	Mem[0000000010001428] = 00000059, %l1 = 0000000000000000, %asi = 80
	swapa	[%i0+0x028]%asi,%l1	! %l1 = 0000000000000059
!	%l6 = 00000000596d00a0, Mem[0000000010041408] = 000000ff
	stwa	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 596d00a0
!	%f12 = 7f3c7674 ff000000, %l3 = 00000000735700ff
!	Mem[00000000300c1428] = 7914086f5aaa4153
	add	%i3,0x028,%g1
	stda	%f12,[%g1+%l3]ASI_PST8_SL ! Mem[00000000300c1428] = 000000ff74763c7f
!	%f5  = 735700ff, %f12 = 7f3c7674, %f0  = 0aafffff
	fsubs	%f5 ,%f12,%f0 		! %f0  = ff3c7673
!	%l4 = 0000000000000059, Mem[0000000010181408] = 00000000
	stha	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000059
!	%l2 = 0000000000000000, Mem[0000000030001410] = 00000000
	stha	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	Mem[0000000030001410] = 00000000, %l4 = 0000000000000059
	ldstuba	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000030141408] = 74763c7f
	stha	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 74760000
!	%f4  = 00000000 735700ff, Mem[0000000010141410] = 00000049 000090ff
	stda	%f4 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 735700ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ffffffff, %l6 = 00000000596d00a0
	lduha	[%i1+%g0]0x80,%l6	! %l6 = 000000000000ffff

p0_label_157:
!	Mem[0000000030001400] = 0aafffff, %l5 = 00000000ffff2205
	ldswa	[%i0+%g0]0x81,%l5	! %l5 = 000000000aafffff
!	Mem[0000000010181420] = 962c1419, %l4 = 0000000000000000
	ldsh	[%i6+0x020],%l4		! %l4 = ffffffffffff962c
!	Mem[0000000010181438] = 5aa50000, %l5 = 000000000aafffff
	lduw	[%i6+0x038],%l5		! %l5 = 000000005aa50000
!	Mem[0000000030101408] = c23db710, %l3 = 00000000735700ff
	lduwa	[%i4+%o4]0x81,%l3	! %l3 = 00000000c23db710
!	Mem[0000000030181410] = 0000004900000000, %l0 = 000000016d000000
	ldxa	[%i6+%o5]0x89,%l0	! %l0 = 0000004900000000
!	Mem[0000000030101408] = 9c21095110b73dc2, %f10 = 5341aa5a 49000000
	ldda	[%i4+%o4]0x89,%f10	! %f10 = 9c210951 10b73dc2
!	Mem[0000000010001400] = 596d00a0, %l7 = 0000ff006cb69670
	ldsha	[%i0+%g0]0x80,%l7	! %l7 = 000000000000596d
!	Mem[0000000010101408] = 000000ff, %l2 = 0000000000000000
	lduha	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041410] = 00000000, %f12 = 7f3c7674
	lda	[%i1+%o5]0x89,%f12	! %f12 = 00000000
!	Starting 10 instruction Store Burst
!	%f14 = ff900102 ff000000, Mem[0000000010181410] = ffafffff ff0000e3
	stda	%f14,[%i6+%o5]0x88	! Mem[0000000010181410] = ff900102 ff000000

p0_label_158:
!	%f12 = 00000000 ff000000, Mem[0000000010181400] = 005700ff ffff2205
	std	%f12,[%i6+%g0]	! Mem[0000000010181400] = 00000000 ff000000
!	Mem[0000000030001400] = ffffaf0a, %l6 = 000000000000ffff
	ldstuba	[%i0+%g0]0x89,%l6	! %l6 = 0000000a000000ff
!	Mem[0000000010181410] = ff000000, %l7 = 000000000000596d
	ldstuba	[%i6+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%f16 = b20000e3 00000000 c23db710 5109219c
!	%f20 = 59000000 00000000 2f86e420 9d009055
!	%f24 = 00000080 2e8bc3c5 00000000 ffffff7f
!	%f28 = 74591cee c3aab4bb 88e53d7b 0cfd48bb
	stda	%f16,[%i4]ASI_COMMIT_P	! Block Store to 0000000010101400
!	Mem[0000000030181410] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i6+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[00000000201c0000] = ffff2cc7
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 00002cc7
	membar	#Sync			! Added by membar checker (25)
!	%l4 = ffffffffffff962c, Mem[0000000030101408] = c23db710
	stwa	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = ffff962c
!	%l0 = 0000004900000000, Mem[0000000030041410] = 0000000040a0db9a
	stxa	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000004900000000
!	%l0 = 0000004900000000, %l6 = 000000000000000a, %y  = 00000001
	sdiv	%l0,%l6,%l6		! %l6 = 0000000019999999
	mov	%l0,%y			! %y = 00000000
!	Starting 10 instruction Load Burst
!	Mem[000000001004142c] = acffcdff, %l0 = 0000004900000000
	lduh	[%i1+0x02c],%l0		! %l0 = 000000000000acff

p0_label_159:
!	Mem[0000000030041408] = 000000e3596de9bb, %l4 = ffffffffffff962c
	ldxa	[%i1+%o4]0x81,%l4	! %l4 = 000000e3596de9bb
!	Mem[0000000030081400] = ff005773, %f20 = 59000000
	lda	[%i2+%g0]0x81,%f20	! %f20 = ff005773
!	Mem[0000000010101408] = c23db710, %f15 = ff000000
	lda	[%i4+%o4]0x80,%f15	! %f15 = c23db710
!	Mem[00000000100c1408] = bbffff0a, %l0 = 000000000000acff
	lduba	[%i3+%o4]0x88,%l0	! %l0 = 000000000000000a
!	Mem[0000000030001410] = ff000000, %l5 = 000000005aa50000
	lduba	[%i0+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001408] = ff000000, %f3  = ffffffff
	lda	[%i0+%o4]0x81,%f3 	! %f3 = ff000000
!	Mem[0000000030081408] = e282b620, %l4 = 000000e3596de9bb
	lduwa	[%i2+%o4]0x89,%l4	! %l4 = 00000000e282b620
!	Mem[0000000010081408] = 007fa279, %l7 = 0000000000000000
	ldswa	[%i2+%o4]0x80,%l7	! %l7 = 00000000007fa279
!	%l3 = 00000000c23db710, %l5 = 00000000000000ff, %l6 = 0000000019999999
	andn	%l3,%l5,%l6		! %l6 = 00000000c23db700
!	Starting 10 instruction Store Burst
!	%f16 = b20000e3, Mem[0000000030081410] = ffffffff
	sta	%f16,[%i2+%o5]0x81	! Mem[0000000030081410] = b20000e3

p0_label_160:
!	%l2 = 0000000000000000, Mem[00000000100c1408] = 0affffbb
	stba	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00ffffbb
!	Mem[0000000010101408] = 10b73dc2, %l6 = 00000000c23db700
	ldstuba	[%i4+%o4]0x88,%l6	! %l6 = 000000c2000000ff
!	Mem[0000000010001400] = a0006d59, %l5 = 00000000000000ff
	ldstuba	[%i0+%g0]0x88,%l5	! %l5 = 00000059000000ff
!	%l5 = 0000000000000059, Mem[00000000100c1400] = 0000000005df1bf1
	stx	%l5,[%i3+%g0]		! Mem[00000000100c1400] = 0000000000000059
!	Mem[00000000100c1400] = 00000000, %l7 = 00000000007fa279
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	%f23 = 9d009055, Mem[0000000010041408] = a0006d59
	sta	%f23,[%i1+0x008]%asi	! Mem[0000000010041408] = 9d009055
!	%f16 = b20000e3 00000000, %l1 = 0000000000000059
!	Mem[0000000010041410] = ff000000ff000000
	add	%i1,0x010,%g1
	stda	%f16,[%g1+%l1]ASI_PST16_P ! Mem[0000000010041410] = b2000000ff000000
!	Mem[00000000201c0001] = 00002cc7, %l7 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101400] = e30000b2, %l5 = 0000000000000059
	ldstuba	[%i4+%g0]0x89,%l5	! %l5 = 000000b2000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff0000ff, %l5 = 00000000000000b2
	lduwa	[%i6+%o5]0x80,%l5	! %l5 = 00000000ff0000ff

p0_label_161:
!	Mem[0000000010181424] = f369d877, %l4 = 00000000e282b620
	ldsw	[%i6+0x024],%l4		! %l4 = fffffffff369d877
!	Mem[0000000030041408] = 000000e3, %l0 = 000000000000000a
	ldsba	[%i1+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1410] = 735700ff, %l6 = 00000000000000c2
	lduba	[%i3+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081408] = ffffffff 79a27f00, %l2 = 00000000, %l3 = c23db710
	ldda	[%i2+%o4]0x88,%l2	! %l2 = 0000000079a27f00 00000000ffffffff
!	Mem[0000000030181400] = ffff0000 bbb4aac3, %l0 = 00000000, %l1 = 00000059
	ldda	[%i6+%g0]0x81,%l0	! %l0 = 00000000ffff0000 00000000bbb4aac3
!	Mem[0000000030101408] = 2c96ffff, %l5 = 00000000ff0000ff
	lduba	[%i4+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101410] = 0000000000000059, %f6  = 73000000 ffffffbb
	ldda	[%i4+%o5]0x88,%f6 	! %f6  = 00000000 00000059
!	Mem[00000000300c1410] = 735700ff, %l0 = 00000000ffff0000
	lduha	[%i3+%o5]0x89,%l0	! %l0 = 00000000000000ff
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000030101400] = ff0000e3 00000000 ffff962c 5109219c
!	Mem[0000000030101410] = 59000000 00000000 2f86e420 9d009055
!	Mem[0000000030101420] = 00000080 2e8bc3c5 00000000 ffffff7f
!	Mem[0000000030101430] = 74591cee c3aab4bb 88e53d7b 0cfd48bb
	ldda	[%i4]ASI_BLK_S,%f0	! Block Load from 0000000030101400
!	Starting 10 instruction Store Burst
!	%f18 = c23db710 5109219c, Mem[00000000300c1408] = 00000000 5aaa4153
	stda	%f18,[%i3+%o4]0x81	! Mem[00000000300c1408] = c23db710 5109219c

p0_label_162:
!	%l6 = 00000000000000ff, Mem[000000001000142c] = 00000000
	stw	%l6,[%i0+0x02c]		! Mem[000000001000142c] = 000000ff
	membar	#Sync			! Added by membar checker (27)
!	%l0 = 00000000000000ff, Mem[0000000030101408] = 9c2109512c96ffff
	stxa	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000000000ff
!	Mem[0000000010101400] = b20000e3, %l4 = fffffffff369d877
	swapa	[%i4+%g0]0x80,%l4	! %l4 = 00000000b20000e3
!	%l3 = 00000000ffffffff, Mem[0000000010001400] = a0006dff
	stha	%l3,[%i0+%g0]0x88	! Mem[0000000010001400] = a000ffff
!	%f15 = 0cfd48bb, Mem[0000000030141410] = 0000af0a
	sta	%f15,[%i5+%o5]0x89	! Mem[0000000030141410] = 0cfd48bb
!	%l7 = 0000000000000000, Mem[0000000010101408] = 10b73dff
	stba	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = 10b73d00
!	%f0  = ff0000e3 00000000, %l2 = 0000000079a27f00
!	Mem[0000000010181410] = ff0000ff020190ff
	add	%i6,0x010,%g1
	stda	%f0,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010181410] = ff0000ff020190ff
!	Mem[000000001008141c] = bb7b3782, %l4 = b20000e3, %l3 = ffffffff
	add	%i2,0x1c,%g1
	casa	[%g1]0x80,%l4,%l3	! %l3 = 00000000bb7b3782
!	Mem[0000000030081408] = e282b620, %l1 = 00000000bbb4aac3
	ldstuba	[%i2+%o4]0x89,%l1	! %l1 = 00000020000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = b20000e3, %l0 = 00000000000000ff
	lduba	[%i2+%o5]0x81,%l0	! %l0 = 00000000000000b2

p0_label_163:
!	Mem[0000000010041410] = 000000b2, %l7 = 0000000000000000
	ldswa	[%i1+%o5]0x88,%l7	! %l7 = 00000000000000b2
!	%l3 = 00000000bb7b3782, immed = 00000903, %y  = 00000000
	udiv	%l3,0x903,%l2		! %l2 = 000000000014cddd
	mov	%l0,%y			! %y = 000000b2
!	Mem[0000000030001410] = ff000000, %f14 = 88e53d7b
	lda	[%i0+%o5]0x81,%f14	! %f14 = ff000000
!	Mem[00000000300c1410] = 735700ff, %l2 = 000000000014cddd
	ldsha	[%i3+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181410] = ff0000ff, %l3 = 00000000bb7b3782
	ldswa	[%i6+%o5]0x80,%l3	! %l3 = ffffffffff0000ff
!	Mem[0000000021800000] = 3fccbf49, %l0 = 00000000000000b2
	lduha	[%o3+0x000]%asi,%l0	! %l0 = 0000000000003fcc
!	Mem[0000000010041410] = 000000ff 000000b2, %l6 = 000000ff, %l7 = 000000b2
	ldda	[%i1+%o5]0x88,%l6	! %l6 = 00000000000000b2 00000000000000ff
!	Mem[0000000010081408] = 007fa279ffffffff, %f26 = 00000000 ffffff7f
	ldda	[%i2+%o4]0x80,%f26	! %f26 = 007fa279 ffffffff
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000010101400] = f369d877 00000000 003db710 5109219c
!	Mem[0000000010101410] = 59000000 00000000 2f86e420 9d009055
!	Mem[0000000010101420] = 00000080 2e8bc3c5 00000000 ffffff7f
!	Mem[0000000010101430] = 74591cee c3aab4bb 88e53d7b 0cfd48bb
	ldda	[%i4]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010101400
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1437] = 0000007b, %l1 = 0000000000000020
	ldstub	[%i3+0x037],%l1		! %l1 = 0000007b000000ff

p0_label_164:
!	%l0 = 0000000000003fcc, %l0 = 0000000000003fcc, %l2  = 00000000000000ff
	mulx	%l0,%l0,%l2		! %l2 = 000000000fe60a90
!	Mem[00000000300c1400] = 00007f00, %l5 = 00000000000000ff
	swapa	[%i3+%g0]0x89,%l5	! %l5 = 0000000000007f00
!	%f12 = 74591cee c3aab4bb, %l7 = 00000000000000ff
!	Mem[00000000300c1400] = ff000000000000ff
	stda	%f12,[%i3+%l7]ASI_PST8_SL ! Mem[00000000300c1400] = bbb4aac3ee1c5974
!	%f12 = 74591cee c3aab4bb, %l2 = 000000000fe60a90
!	Mem[0000000010181408] = 590000000000007b
	add	%i6,0x008,%g1
	stda	%f12,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010181408] = 590000000000007b
!	%f0  = ff0000e3 00000000, Mem[0000000010001410] = ffffffbb 00000000
	stda	%f0 ,[%i0+%o5]0x88	! Mem[0000000010001410] = ff0000e3 00000000
!	%f0  = ff0000e3, Mem[0000000030081400] = ff005773
	sta	%f0 ,[%i2+%g0]0x81	! Mem[0000000030081400] = ff0000e3
!	Mem[0000000010101400] = f369d877, %l6 = 00000000000000b2
	ldstuba	[%i4+%g0]0x80,%l6	! %l6 = 000000f3000000ff
!	%l5 = 0000000000007f00, Mem[0000000010001400] = a000ffff
	stwa	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 00007f00
!	%l3 = ffffffffff0000ff, Mem[0000000010041405] = 00000059, %asi = 80
	stba	%l3,[%i1+0x005]%asi	! Mem[0000000010041404] = 00ff0059
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 9c21095110b73d00, %l3 = ffffffffff0000ff
	ldxa	[%i4+%o4]0x88,%l3	! %l3 = 9c21095110b73d00

p0_label_165:
!	Mem[0000000030101410] = 00000059, %l3 = 9c21095110b73d00
	ldsba	[%i4+%o5]0x89,%l3	! %l3 = 0000000000000059
!	Mem[0000000010101400] = ff69d877, %l6 = 00000000000000f3
	ldsba	[%i4+%g0]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181400] = 00000000, %l4 = 00000000b20000e3
	lduba	[%i6+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = 00000059, %l3 = 0000000000000059
	lduwa	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000059
!	Mem[0000000010101408] = 003db710, %l1 = 000000000000007b
	ldswa	[%i4+%o4]0x80,%l1	! %l1 = 00000000003db710
!	Mem[0000000030081408] = e282b6ff, %l4 = 0000000000000000
	lduwa	[%i2+%o4]0x89,%l4	! %l4 = 00000000e282b6ff
!	Mem[0000000010001410] = 00000000, %l2 = 000000000fe60a90
	ldsha	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081400] = 00000000e30000ff, %f12 = 74591cee c3aab4bb
	ldda	[%i2+%g0]0x89,%f12	! %f12 = 00000000 e30000ff
!	Mem[0000000010001410] = ff0000e3 00000000, %l6 = ffffffff, %l7 = 000000ff
	ldda	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000 00000000ff0000e3
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000003fcc, Mem[00000000300c1410] = ff005773
	stwa	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00003fcc

p0_label_166:
!	Mem[0000000030101410] = 59000000, %l0 = 0000000000003fcc
	swapa	[%i4+%o5]0x81,%l0	! %l0 = 0000000059000000
!	%f0  = ff0000e3, Mem[0000000030141400] = ff000000
	sta	%f0 ,[%i5+%g0]0x81	! Mem[0000000030141400] = ff0000e3
!	%f2  = ffff962c 5109219c, Mem[0000000010001408] = ffafffff 3791c43b
	stda	%f2 ,[%i0+%o4]0x80	! Mem[0000000010001408] = ffff962c 5109219c
!	Mem[0000000010141410] = 00000000, %l5 = 0000000000007f00
	swap	[%i5+%o5],%l5		! %l5 = 0000000000000000
!	%f3  = 5109219c, Mem[000000001008143c] = 259c005a
	sta	%f3 ,[%i2+0x03c]%asi	! Mem[000000001008143c] = 5109219c
!	%l5 = 0000000000000000, Mem[0000000030041408] = e3000000
	stwa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	%l0 = 0000000059000000, Mem[00000000100c1400] = 000000ff
	stwa	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 59000000
!	%f10 = 00000000, Mem[0000000030141410] = 0cfd48bb
	sta	%f10,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	Mem[0000000030081400] = ff0000e3, %l0 = 0000000059000000
	swapa	[%i2+%g0]0x81,%l0	! %l0 = 00000000ff0000e3
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ff000000, %l1 = 00000000003db710
	ldswa	[%i5+%g0]0x80,%l1	! %l1 = ffffffffff000000

p0_label_167:
!	Mem[0000000010081408] = 007fa279, %l4 = 00000000e282b6ff
	lduba	[%i2+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141408] = 596de9bb 74760000, %l0 = ff0000e3, %l1 = ff000000
	ldda	[%i5+%o4]0x89,%l0	! %l0 = 0000000074760000 00000000596de9bb
!	Mem[0000000010141410] = 00007f00735700ff, %f2  = ffff962c 5109219c
	ldda	[%i5+0x010]%asi,%f2 	! %f2  = 00007f00 735700ff
!	Mem[0000000030001400] = 000000ff ffffafff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i0+%g0]0x89,%l4	! %l4 = 00000000ffffafff 00000000000000ff
!	Mem[0000000010101420] = 000000802e8bc3c5, %f4  = 59000000 00000000
	ldd	[%i4+0x020],%f4 	! %f4  = 00000080 2e8bc3c5
!	Mem[0000000010041400] = ffffffff00ff0059, %l0 = 0000000074760000
	ldxa	[%i1+%g0]0x80,%l0	! %l0 = ffffffff00ff0059
!	Mem[0000000010081400] = ff005773, %l3 = 0000000000000059
	ldsh	[%i2+%g0],%l3		! %l3 = ffffffffffffff00
!	Mem[00000000300c1408] = c23db710, %f14 = ff000000
	lda	[%i3+%o4]0x81,%f14	! %f14 = c23db710
!	Mem[00000000100c1410] = 00000000, %f25 = 80000000
	lda	[%i3+%o5]0x88,%f25	! %f25 = 00000000
!	Starting 10 instruction Store Burst
!	%f10 = 00000000, Mem[0000000030141410] = 00000000
	sta	%f10,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000

p0_label_168:
!	Mem[0000000010081410] = 214d006f, %l6 = 0000000000000000
	swapa	[%i2+%o5]0x88,%l6	! %l6 = 00000000214d006f
!	Mem[00000000100c1410] = 00000000, %l7 = 00000000ff0000e3
	ldstuba	[%i3+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141410] = 00000000, %l7 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i5+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1410] = 00003fcc, %l2 = 0000000000000000
	swapa	[%i3+%o5]0x81,%l2	! %l2 = 0000000000003fcc
!	%f18 = 9c210951 10b73d00, %l0 = ffffffff00ff0059
!	Mem[0000000010141418] = 5590009d20e4862f
	add	%i5,0x018,%g1
	stda	%f18,[%g1+%l0]ASI_PST32_P ! Mem[0000000010141418] = 5590009d10b73d00
!	%l0 = ffffffff00ff0059, Mem[00000000100c1410] = ff00000049000000
	stxa	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffffffff00ff0059
!	%f12 = 00000000 e30000ff, %l6 = 00000000214d006f
!	Mem[0000000030181430] = 74591ceec3aab4bb
	add	%i6,0x030,%g1
	stda	%f12,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030181430] = ff0000e300000000
!	%f2  = 00007f00 735700ff, %l3 = ffffffffffffff00
!	Mem[0000000030081420] = 2970d66a79a27f14
	add	%i2,0x020,%g1
	stda	%f2,[%g1+%l3]ASI_PST8_S ! Mem[0000000030081420] = 2970d66a79a27f14
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ffff962c, %l2 = 0000000000003fcc
	ldswa	[%i0+%o4]0x80,%l2	! %l2 = ffffffffffff962c

p0_label_169:
!	Mem[0000000010081408] = 79a27f00, %f15 = 0cfd48bb
	lda	[%i2+%o4]0x88,%f15	! %f15 = 79a27f00
!	Mem[00000000100c1400] = 00000059 00000059, %l6 = 214d006f, %l7 = 00000000
	ldda	[%i3+%g0]0x80,%l6	! %l6 = 0000000000000059 0000000000000059
!	%f28 = bbb4aac3, %f22 = 5590009d
	fcmps	%fcc3,%f28,%f22		! %fcc3 = 1
!	Mem[0000000010041408] = 5590009d, %l2 = ffffffffffff962c
	lduwa	[%i1+%o4]0x88,%l2	! %l2 = 000000005590009d
!	Mem[0000000010181410] = ff0000ff020190ff, %l1 = 00000000596de9bb
	ldxa	[%i6+%o5]0x80,%l1	! %l1 = ff0000ff020190ff
!	Mem[0000000010141410] = 00007f00, %l1 = ff0000ff020190ff
	lduba	[%i5+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101400] = 00000000e30000ff, %f20 = 00000000 00000059
	ldda	[%i4+%g0]0x89,%f20	! %f20 = 00000000 e30000ff
!	%f22 = 5590009d, %f16 = 00000000, %f31 = 7b3de588
	fdivs	%f22,%f16,%f31		! %f31 = 7f800000
!	Code Fragment 3
p0_fragment_12:
!	%l0 = ffffffff00ff0059
	setx	0xdd56c63f9ac31b4a,%g7,%l0 ! %l0 = dd56c63f9ac31b4a
!	%l1 = 0000000000000000
	setx	0x80cca05ffa631d40,%g7,%l1 ! %l1 = 80cca05ffa631d40
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = dd56c63f9ac31b4a
	setx	0xc9a14177aa5b16eb,%g7,%l0 ! %l0 = c9a14177aa5b16eb
!	%l1 = 80cca05ffa631d40
	setx	0x41ad7297d110ed88,%g7,%l1 ! %l1 = 41ad7297d110ed88
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 000000ff, %l5 = 00000000000000ff
	ldstuba	[%i6+%o5]0x89,%l5	! %l5 = 000000ff000000ff

p0_label_170:
!	Mem[0000000020800040] = 00ffa3d2, %l3 = ffffffffffffff00
	ldstuba	[%o1+0x040]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041408] = 9d009055, %l6 = 0000000000000059
	ldstuba	[%i1+%o4]0x80,%l6	! %l6 = 0000009d000000ff
	membar	#Sync			! Added by membar checker (29)
!	%f24 = c5c38b2e 00000000, Mem[0000000010101400] = ff69d877 00000000
	stda	%f24,[%i4+%g0]0x80	! Mem[0000000010101400] = c5c38b2e 00000000
!	%f0  = ff0000e3 00000000 00007f00 735700ff
!	%f4  = 00000080 2e8bc3c5 2f86e420 9d009055
!	%f8  = 00000080 2e8bc3c5 00000000 ffffff7f
!	%f12 = 00000000 e30000ff c23db710 79a27f00
	stda	%f0,[%i6]ASI_BLK_P	! Block Store to 0000000010181400
!	Mem[0000000010041410] = 000000b2, %l5 = 00000000000000ff
	swapa	[%i1+%o5]0x88,%l5	! %l5 = 00000000000000b2
!	Mem[0000000030041408] = 00000000, %l2 = 000000005590009d
	ldstuba	[%i1+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	%l4 = 00000000ffffafff, Mem[00000000201c0000] = 00ff2cc7
	stb	%l4,[%o0+%g0]		! Mem[00000000201c0000] = ffff2cc7
!	%l3 = 0000000000000000, Mem[0000000010101410] = 5900000000000000
	stxa	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000000000000
!	%l4 = ffffafff, %l5 = 000000b2, Mem[0000000030141400] = e30000ff 00000000
	stda	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffafff 000000b2
!	Starting 10 instruction Load Burst
!	%l0 = c9a14177aa5b16eb, %l5 = 00000000000000b2, %l3 = 0000000000000000
	xnor	%l0,%l5,%l3		! %l3 = 365ebe8855a4e9a6

p0_label_171:
!	Mem[00000000201c0000] = ffff2cc7, %l7 = 0000000000000059
	ldsba	[%o0+0x001]%asi,%l7	! %l7 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000010181410] = 000000802e8bc3c5, %f30 = bb48fd0c 7f800000
	ldda	[%i6+%o5]0x80,%f30	! %f30 = 00000080 2e8bc3c5
!	Mem[0000000010181410] = 000000802e8bc3c5, %l4 = 00000000ffffafff
	ldx	[%i6+%o5],%l4		! %l4 = 000000802e8bc3c5
!	Mem[0000000030181408] = bbffffff, %l7 = ffffffffffffffff
	lduwa	[%i6+%o4]0x81,%l7	! %l7 = 00000000bbffffff
!	Mem[0000000010181400] = ff0000e3, %f22 = 5590009d
	lda	[%i6+%g0]0x80,%f22	! %f22 = ff0000e3
!	Mem[0000000030041410] = 0000000049000000, %l4 = 000000802e8bc3c5
	ldxa	[%i1+%o5]0x89,%l4	! %l4 = 0000000049000000
!	Mem[0000000030041408] = ff000000 596de9bb, %l4 = 49000000, %l5 = 000000b2
	ldda	[%i1+%o4]0x81,%l4	! %l4 = 00000000ff000000 00000000596de9bb
!	Mem[0000000010181408] = ff005773 007f0000, %l0 = aa5b16eb, %l1 = d110ed88
	ldda	[%i6+%o4]0x88,%l0	! %l0 = 00000000007f0000 00000000ff005773
!	Mem[0000000030141408] = 00007674 bbe96d59, %l6 = 0000009d, %l7 = bbffffff
	ldda	[%i5+%o4]0x81,%l6	! %l6 = 0000000000007674 00000000bbe96d59
!	Starting 10 instruction Store Burst
!	Code Fragment 3
p0_fragment_13:
!	%l0 = 00000000007f0000
	setx	0xd40b90c06d5c9da0,%g7,%l0 ! %l0 = d40b90c06d5c9da0
!	%l1 = 00000000ff005773
	setx	0xf0e28a881d163d56,%g7,%l1 ! %l1 = f0e28a881d163d56
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d40b90c06d5c9da0
	setx	0xa6a1b18fe288fd62,%g7,%l0 ! %l0 = a6a1b18fe288fd62
!	%l1 = f0e28a881d163d56
	setx	0x677a32bf830ac5dc,%g7,%l1 ! %l1 = 677a32bf830ac5dc

p0_label_172:
!	Mem[0000000010041408] = 559000ff, %l2 = 0000000000000000
	swapa	[%i1+%o4]0x88,%l2	! %l2 = 00000000559000ff
!	%f4  = 00000080, Mem[0000000010001414] = e30000ff
	st	%f4 ,[%i0+0x014]	! Mem[0000000010001414] = 00000080
!	%l5 = 00000000596de9bb, Mem[0000000010001416] = 00000080, %asi = 80
	stba	%l5,[%i0+0x016]%asi	! Mem[0000000010001414] = 0000bb80
!	%f24 = c5c38b2e 00000000, Mem[0000000010001410] = 00000000 80bb0000
	stda	%f24,[%i0+%o5]0x88	! Mem[0000000010001410] = c5c38b2e 00000000
!	Mem[0000000030081400] = 00000059, %l6 = 0000000000007674
	swapa	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000059
!	%l0 = e288fd62, %l1 = 830ac5dc, Mem[0000000010041428] = 5aa5c652 acffcdff
	stda	%l0,[%i1+0x028]%asi	! Mem[0000000010041428] = e288fd62 830ac5dc
!	%l4 = ff000000, %l5 = 596de9bb, Mem[0000000010181408] = 007f0000 ff005773
	stda	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = ff000000 596de9bb
!	Mem[0000000030141408] = 74760000, %l6 = 0000000000000059
	swapa	[%i5+%o4]0x89,%l6	! %l6 = 0000000074760000
!	%l4 = 00000000ff000000, imm = 00000000000005a6, %l2 = 00000000559000ff
	addc	%l4,0x5a6,%l2		! %l2 = 00000000ff0005a6
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = fe062800, %l4 = 00000000ff000000
	lduwa	[%i1+%g0]0x89,%l4	! %l4 = 00000000fe062800

p0_label_173:
!	Mem[000000001000143c] = 000000e3, %l5 = 00000000596de9bb
	ldub	[%i0+0x03d],%l5		! %l5 = 0000000000000000
!	Mem[0000000030101410] = cc3f0000, %l1 = 677a32bf830ac5dc
	lduwa	[%i4+%o5]0x89,%l1	! %l1 = 00000000cc3f0000
!	Mem[0000000010101408] = 003db710, %l5 = 0000000000000000
	ldsha	[%i4+%o4]0x80,%l5	! %l5 = 000000000000003d
!	Mem[00000000100c1408] = 00ffffbbe3b626ff, %f4  = 00000080 2e8bc3c5
	ldda	[%i3+%o4]0x80,%f4 	! %f4  = 00ffffbb e3b626ff
!	Mem[00000000100c1410] = 5900ff00 ffffffff, %l2 = ff0005a6, %l3 = 55a4e9a6
	ldda	[%i3+%o5]0x88,%l2	! %l2 = 00000000ffffffff 000000005900ff00
!	Mem[0000000030041400] = fe062800, %f9  = 2e8bc3c5
	lda	[%i1+%g0]0x89,%f9 	! %f9 = fe062800
!	Mem[00000000218000c0] = 00ff265e, %l4 = 00000000fe062800
	ldub	[%o3+0x0c1],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030181410] = 00000049 000000ff, %l2 = ffffffff, %l3 = 5900ff00
	ldda	[%i6+%o5]0x89,%l2	! %l2 = 00000000000000ff 0000000000000049
!	Mem[0000000030181400] = ffff0000, %l6 = 0000000074760000
	ldsha	[%i6+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000049, Mem[0000000030001408] = ff000000
	stwa	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000049

p0_label_174:
!	%l1 = 00000000cc3f0000, Mem[0000000010101408] = 003db710
	stwa	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = cc3f0000
!	Mem[00000000201c0000] = ffff2cc7, %l5 = 000000000000003d
	ldstub	[%o0+%g0],%l5		! %l5 = 000000ff000000ff
!	%f28 = bbb4aac3, %f17 = 77d869f3, %f30 = 00000080
	fadds	%f28,%f17,%f30		! %f30 = 77d869f3
!	Mem[00000000100c1410] = ffffffff, %l3 = 0000000000000049
	swapa	[%i3+%o5]0x80,%l3	! %l3 = 00000000ffffffff
!	%l5 = 00000000000000ff, Mem[0000000030041410] = 49000000
	stwa	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff
!	%f12 = 00000000, %f28 = bbb4aac3 ee1c5974
	fstox	%f12,%f28		! %f28 = 00000000 00000000
!	Mem[0000000010081410] = 00000000, %l4 = 00000000000000ff
	swapa	[%i2+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141410] = 007f0000, %l7 = 00000000bbe96d59
	ldstuba	[%i5+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%l6 = ffffffffffffffff, Mem[00000000100c1400] = 5900000059000000
	stxa	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffffffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ffffffff, %l3 = 00000000ffffffff
	lduha	[%i3+%g0]0x88,%l3	! %l3 = 000000000000ffff

p0_label_175:
!	Mem[0000000010001400] = 00007f00, %l7 = 0000000000000000
	ldsha	[%i0+%g0]0x88,%l7	! %l7 = 0000000000007f00
!	Mem[0000000030141400] = ffafffff, %l1 = 00000000cc3f0000
	ldswa	[%i5+%g0]0x81,%l1	! %l1 = ffffffffffafffff
!	Mem[0000000010181410] = 00000080, %f10 = 00000000
	ld	[%i6+%o5],%f10	! %f10 = 00000080
!	Mem[0000000030181410] = 000000ff, %l7 = 0000000000007f00
	lduwa	[%i6+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000218000c0] = 00ff265e, %l3 = 000000000000ffff
	ldsh	[%o3+0x0c0],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010181428] = 00000000ffffff7f, %l3 = 00000000000000ff
	ldxa	[%i6+0x028]%asi,%l3	! %l3 = 00000000ffffff7f
!	Mem[0000000010181428] = 00000000, %l6 = ffffffffffffffff
	lduha	[%i6+0x028]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = ff000000, %l4 = 0000000000000000
	lduba	[%i1+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101400] = 000000002e8bc3c5, %l0 = a6a1b18fe288fd62
	ldxa	[%i4+%g0]0x88,%l0	! %l0 = 000000002e8bc3c5
!	Starting 10 instruction Store Burst
!	%f0  = ff0000e3, Mem[0000000010101414] = 00000000
	sta	%f0 ,[%i4+0x014]%asi	! Mem[0000000010101414] = ff0000e3

p0_label_176:
!	%l0 = 000000002e8bc3c5, Mem[00000000201c0000] = ffff2cc7
	sth	%l0,[%o0+%g0]		! Mem[00000000201c0000] = c3c52cc7
!	Mem[00000000100c1410] = 49000000, %l5 = 00000000000000ff
	ldstuba	[%i3+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	%f21 = e30000ff, Mem[0000000010101410] = 00000000
	sta	%f21,[%i4+%o5]0x88	! Mem[0000000010101410] = e30000ff
!	%l7 = 00000000000000ff, Mem[0000000030101400] = ff0000e3
	stwa	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff
!	Mem[0000000030081408] = ffb682e2, %l3 = 00000000ffffff7f
	ldstuba	[%i2+%o4]0x81,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030001400] = ffafffff, %l0 = 000000002e8bc3c5
	ldstuba	[%i0+%g0]0x81,%l0	! %l0 = 000000ff000000ff
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000030001408] = 49000000 ffffffff
	stda	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000 000000ff
!	%l2 = 00000000000000ff, Mem[0000000010041408] = 0000004900000000
	stxa	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000000000ff
!	Mem[0000000010141418] = 5590009d, %l3 = 000000ff, %l1 = ffafffff
	add	%i5,0x18,%g1
	casa	[%g1]0x80,%l3,%l1	! %l1 = 000000005590009d
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 2e8bc3c5, %l1 = 000000005590009d
	lduba	[%i4+%g0]0x88,%l1	! %l1 = 00000000000000c5

p0_label_177:
!	Mem[0000000010101408] = 9c210951 00003fcc, %l2 = 000000ff, %l3 = 000000ff
	ldda	[%i4+%o4]0x88,%l2	! %l2 = 0000000000003fcc 000000009c210951
!	Mem[0000000010041438] = 00590000ff26b6e3, %l7 = 00000000000000ff
	ldxa	[%i1+0x038]%asi,%l7	! %l7 = 00590000ff26b6e3
!	Mem[0000000030101400] = 000000ff, %l7 = 00590000ff26b6e3
	lduba	[%i4+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = e282b6ff, %l7 = 0000000000000000
	ldswa	[%i2+%o4]0x89,%l7	! %l7 = ffffffffe282b6ff
!	Mem[0000000030041408] = 000000ff, %l2 = 0000000000003fcc
	lduba	[%i1+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1408] = 9c210951 10b73dc2, %l2 = 000000ff, %l3 = 9c210951
	ldda	[%i3+%o4]0x89,%l2	! %l2 = 0000000010b73dc2 000000009c210951
	membar	#Sync			! Added by membar checker (31)
!	Mem[0000000010081400] = ff005773 ffffffff 007fa279 ffffffff
!	Mem[0000000010081410] = 000000ff 00000000 e5592105 bb7b3782
!	Mem[0000000010081420] = ffbb0000 0000af0a 0000ff00 6cb69670
!	Mem[0000000010081430] = 00000056 b6a6bb80 154b1ac0 5109219c
	ldda	[%i2]ASI_BLK_PL,%f16	! Block Load from 0000000010081400
!	Mem[0000000030081408] = e282b6ff, %l7 = ffffffffe282b6ff
	lduha	[%i2+%o4]0x89,%l7	! %l7 = 000000000000b6ff
!	Mem[00000000201c0000] = c3c52cc7, %l1 = 00000000000000c5
	lduba	[%o0+0x001]%asi,%l1	! %l1 = 00000000000000c5
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[0000000010101434] = c3aab4bb
	stb	%l4,[%i4+0x034]		! Mem[0000000010101434] = ffaab4bb

p0_label_178:
!	Mem[0000000010081400] = 735700ff, %l4 = 00000000000000ff
	swapa	[%i2+%g0]0x88,%l4	! %l4 = 00000000735700ff
!	Mem[0000000030041408] = ff000000, %l7 = 000000000000b6ff
	swapa	[%i1+%o4]0x81,%l7	! %l7 = 00000000ff000000
!	Mem[0000000010001418] = 00ff00007f3c76ff, %l3 = 000000009c210951, %l3 = 000000009c210951
	add	%i0,0x18,%g1
	casxa	[%g1]0x80,%l3,%l3	! %l3 = 00ff00007f3c76ff
!	%l6 = 00000000, %l7 = ff000000, Mem[0000000010001410] = 00000000 c5c38b2e
	stda	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 ff000000
!	Mem[0000000030041400] = fe062800, %l7 = 00000000ff000000
	ldstuba	[%i1+%g0]0x89,%l7	! %l7 = 00000000000000ff
	membar	#Sync			! Added by membar checker (32)
!	%l0 = 00000000000000ff, Mem[0000000010081408] = 007fa279
	stba	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = ff7fa279
!	%l3 = 00ff00007f3c76ff, Mem[0000000010041400] = 5900ff00ffffffff
	stxa	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = 00ff00007f3c76ff
!	Mem[0000000010001400] = 00007f00, %l5 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%f12 = 00000000 e30000ff, Mem[0000000030081410] = b20000e3 00000000
	stda	%f12,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000 e30000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = bbb4aac3 ee1c5974 c23db710 5109219c
!	Mem[00000000300c1410] = 00000000 00000000 754a7465 3857c2de
!	Mem[00000000300c1420] = 147fa279 6ad67029 000000ff 74763c7f
!	Mem[00000000300c1430] = ae3ded1d f87c67df a2e1f9a7 58caeb5e
	ldda	[%i3]ASI_BLK_S,%f16	! Block Load from 00000000300c1400

p0_label_179:
!	Mem[00000000211c0000] = ffff7241, %l0 = 00000000000000ff
	lduh	[%o2+%g0],%l0		! %l0 = 000000000000ffff
!	Mem[00000000300c1410] = 00000000, %l3 = 00ff00007f3c76ff
	ldsha	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001410] = ff000000, %l4 = 00000000735700ff
	lduha	[%i0+%o5]0x81,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010081400] = ff000000ffffffff, %l2 = 0000000010b73dc2
	ldx	[%i2+%g0],%l2		! %l2 = ff000000ffffffff
!	Mem[0000000030041400] = ff2806fe, %f8  = 00000080
	lda	[%i1+%g0]0x81,%f8 	! %f8 = ff2806fe
!	Mem[00000000300c1410] = 0000000000000000, %l5 = 0000000000000000
	ldxa	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181410] = 00000049000000ff, %f10 = 00000080 ffffff7f
	ldda	[%i6+%o5]0x89,%f10	! %f10 = 00000049 000000ff
!	Mem[0000000010141410] = ff007f00735700ff, %f2  = 00007f00 735700ff
	ldda	[%i5+%o5]0x80,%f2 	! %f2  = ff007f00 735700ff
!	Mem[0000000030141408] = 00000059, %l6 = 0000000000000000
	ldsba	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000059
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000c5, Mem[0000000010181400] = ff0000e3, %asi = 80
	stba	%l1,[%i6+0x000]%asi	! Mem[0000000010181400] = c50000e3

p0_label_180:
!	%f12 = 00000000 e30000ff, %l4 = 000000000000ff00
!	Mem[0000000030181418] = 2f86e4209d009055
	add	%i6,0x018,%g1
	stda	%f12,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030181418] = 2f86e4209d009055
	membar	#Sync			! Added by membar checker (33)
!	%f0  = ff0000e3 00000000, %l6 = 0000000000000059
!	Mem[00000000300c1428] = 000000ff74763c7f
	add	%i3,0x028,%g1
	stda	%f0,[%g1+%l6]ASI_PST32_S ! Mem[00000000300c1428] = 000000ff00000000
!	Mem[0000000030081400] = 74760000, %l6 = 0000000000000059
	ldstuba	[%i2+%g0]0x81,%l6	! %l6 = 00000074000000ff
!	%l3 = 0000000000000000, Mem[0000000030181408] = 73000000ffffffbb
	stxa	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000000000000000
!	%l6 = 00000074, %l7 = 00000000, Mem[0000000010181408] = 000000ff bbe96d59
	stda	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000074 00000000
!	%l7 = 0000000000000000, Mem[0000000030041400] = ff2806fe00000000
	stxa	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000000000000000
!	Mem[0000000010081410] = ff000000, %l4 = 000000000000ff00
	swapa	[%i2+%o5]0x88,%l4	! %l4 = 00000000ff000000
!	%f16 = bbb4aac3 ee1c5974, Mem[0000000010181410] = 80000000 c5c38b2e
	stda	%f16,[%i6+%o5]0x88	! Mem[0000000010181410] = bbb4aac3 ee1c5974
!	%l2 = ffffffff, %l3 = 00000000, Mem[00000000300c1408] = 10b73dc2 9c210951
	stda	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffffff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = c5c38b2e00000000, %l4 = 00000000ff000000
	ldxa	[%i4+%g0]0x80,%l4	! %l4 = c5c38b2e00000000

p0_label_181:
!	Mem[0000000030041408] = 0000b6ff596de9bb, %f4  = 00ffffbb e3b626ff
	ldda	[%i1+%o4]0x81,%f4 	! %f4  = 0000b6ff 596de9bb
!	Mem[0000000010041400] = 00ff00007f3c76ff, %l2 = ff000000ffffffff
	ldxa	[%i1+%g0]0x88,%l2	! %l2 = 00ff00007f3c76ff
!	Mem[0000000010001408] = 2c96ffff, %l6 = 0000000000000074
	lduba	[%i0+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[00000000211c0000] = ffff7241, %l2 = 00ff00007f3c76ff
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1430] = 000000ff000000ff, %l0 = 000000000000ffff
	ldx	[%i3+0x030],%l0		! %l0 = 000000ff000000ff
!	Mem[0000000030001410] = 000000ff, %l2 = ffffffffffffffff
	lduba	[%i0+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1400] = ffffffff, %f1  = 00000000
	lda	[%i3+%g0]0x88,%f1 	! %f1 = ffffffff
!	Mem[0000000010141410] = ff005773007f00ff, %f2  = ff007f00 735700ff
	ldda	[%i5+%o5]0x88,%f2 	! %f2  = ff005773 007f00ff
!	Mem[0000000010041438] = 00590000, %l7 = 0000000000000000
	ldsha	[%i1+0x038]%asi,%l7	! %l7 = 0000000000000059
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000030001408] = 00000000
	stba	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = ff000000

p0_label_182:
!	%l1 = 00000000000000c5, Mem[0000000010141418] = 5590009d10b73d00, %asi = 80
	stxa	%l1,[%i5+0x018]%asi	! Mem[0000000010141418] = 00000000000000c5
!	%l0 = 000000ff000000ff, Mem[0000000010141400] = ff0000000000ff00, %asi = 80
	stxa	%l0,[%i5+0x000]%asi	! Mem[0000000010141400] = 000000ff000000ff
!	Mem[0000000030001408] = 000000ff, %l6 = 00000000000000ff
	swapa	[%i0+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[00000000201c0000] = c3c52cc7
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 00ff2cc7
!	%l3 = 0000000000000000, Mem[0000000030141410] = ff000000
	stwa	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	%f0  = ff0000e3 ffffffff, Mem[0000000010141400] = 000000ff 000000ff
	stda	%f0 ,[%i5+%g0]0x80	! Mem[0000000010141400] = ff0000e3 ffffffff
!	%f16 = bbb4aac3 ee1c5974 c23db710 5109219c
!	%f20 = 00000000 00000000 754a7465 3857c2de
!	%f24 = 147fa279 6ad67029 000000ff 74763c7f
!	%f28 = ae3ded1d f87c67df a2e1f9a7 58caeb5e
	stda	%f16,[%i1]ASI_BLK_SL	! Block Store to 0000000030041400
!	%f11 = 000000ff, Mem[0000000010181408] = 00000074
	sta	%f11,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000ff
!	%l3 = 0000000000000000, Mem[0000000030041400] = 74591cee
	stba	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = 00591cee
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff0000e3, %l2 = 00000000000000ff
	lduwa	[%i5+%o4]0x80,%l2	! %l2 = 00000000ff0000e3

p0_label_183:
!	Mem[00000000300c1400] = bbb4aac3, %f9  = fe062800
	lda	[%i3+%g0]0x81,%f9 	! %f9 = bbb4aac3
!	Mem[0000000030001408] = 000000ff000000ff, %f2  = ff005773 007f00ff
	ldda	[%i0+%o4]0x89,%f2 	! %f2  = 000000ff 000000ff
!	%f9  = bbb4aac3, %f10 = 00000049
	fcmps	%fcc1,%f9 ,%f10		! %fcc1 = 1
!	%l2 = 00000000ff0000e3, Mem[0000000010101410] = e30000ff
	stha	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = e30000e3
!	Code Fragment 3
p0_fragment_14:
!	%l0 = 000000ff000000ff
	setx	0xbd4fee679b3576d9,%g7,%l0 ! %l0 = bd4fee679b3576d9
!	%l1 = 00000000000000c5
	setx	0xe129bca79f5bde0b,%g7,%l1 ! %l1 = e129bca79f5bde0b
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = bd4fee679b3576d9
	setx	0xecf319a05a999428,%g7,%l0 ! %l0 = ecf319a05a999428
!	%l1 = e129bca79f5bde0b
	setx	0x919da0c7ae04049e,%g7,%l1 ! %l1 = 919da0c7ae04049e
!	%f14 = c23db710, %f10 = 00000049, %f11 = 000000ff
	fmuls	%f14,%f10,%f11		! %l0 = ecf319a05a99944a, Unfinished, %fsr = 1d00000400
!	Mem[0000000030081408] = ffb682e2, %l6 = 00000000000000ff
	lduba	[%i2+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181400] = ffff0000, %f5  = 596de9bb
	lda	[%i6+%g0]0x81,%f5 	! %f5 = ffff0000
!	Mem[0000000030001400] = ffafffff, %f9  = bbb4aac3
	lda	[%i0+%g0]0x81,%f9 	! %f9 = ffafffff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ff0000e3, Mem[0000000020800040] = ffffa3d2, %asi = 80
	stha	%l2,[%o1+0x040]%asi	! Mem[0000000020800040] = 00e3a3d2

p0_label_184:
!	%l0 = ecf319a05a99944a, Mem[0000000030181410] = ff000000
	stwa	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 5a99944a
!	%l4 = c5c38b2e00000000, Mem[00000000100c1400] = ffffffff
	stwa	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	Mem[0000000010181407] = 00000000, %l2 = 00000000ff0000e3
	ldstub	[%i6+0x007],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010081410] = 00ff0000, %l6 = 00000000000000ff
	ldstuba	[%i2+%o5]0x80,%l6	! %l6 = 00000000000000ff
	membar	#Sync			! Added by membar checker (34)
!	Mem[0000000010041408] = 000000ff, %l1 = 919da0c7ae04049e
	ldstuba	[%i1+%o4]0x88,%l1	! %l1 = 000000ff000000ff
!	%f26 = 000000ff 74763c7f, Mem[0000000030181410] = 5a99944a 49000000
	stda	%f26,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000ff 74763c7f
!	Mem[0000000010181410] = 74591cee, %l6 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l6	! %l6 = 00000074000000ff
!	%l2 = 0000000000000000, Mem[0000000010041408] = 000000ff
	stba	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	Mem[0000000010041400] = ff763c7f, %l1 = 00000000000000ff
	swapa	[%i1+%g0]0x80,%l1	! %l1 = 00000000ff763c7f
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 5109219c, %l2 = 0000000000000000
	ldsba	[%i1+%o4]0x89,%l2	! %l2 = ffffffffffffff9c

p0_label_185:
!	Mem[0000000010041410] = ff000000ff000000, %l0 = ecf319a05a99944a
	ldxa	[%i1+%o5]0x80,%l0	! %l0 = ff000000ff000000
!	Mem[0000000010081410] = ffff0000, %f22 = 754a7465
	lda	[%i2+%o5]0x80,%f22	! %f22 = ffff0000
!	Mem[0000000010001400] = ff7f000000000000, %f22 = ffff0000 3857c2de
	ldd	[%i0+%g0],%f22		! %f22 = ff7f0000 00000000
!	Mem[0000000010101400] = c5c38b2e00000000, %f16 = bbb4aac3 ee1c5974
	ldda	[%i4+%g0]0x80,%f16	! %f16 = c5c38b2e 00000000
!	Mem[0000000030101400] = 000000ff, %l7 = 0000000000000059
	ldsba	[%i4+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000211c0000] = ffff7241, %l3 = 0000000000000000
	ldub	[%o2+%g0],%l3		! %l3 = 00000000000000ff
!	Mem[00000000300c1410] = 00000000, %l2 = ffffffffffffff9c
	ldswa	[%i3+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = ff0000e3 ffffffff ff0000e3 7b3de5ff
!	Mem[0000000010141410] = ff007f00 735700ff 00000000 000000c5
!	Mem[0000000010141420] = 00007379 b0ede7ff e09cba41 2302b620
!	Mem[0000000010141430] = bbb4aac3 ffffffff bb48fd0c 49000000
	ldda	[%i5]ASI_BLK_P,%f0	! Block Load from 0000000010141400
!	Mem[0000000010181400] = e30000c5, %l2 = 0000000000000000
	lduba	[%i6+%g0]0x88,%l2	! %l2 = 00000000000000c5
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = cc3f0000, %l5 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l5	! %l5 = 00000000cc3f0000

p0_label_186:
!	%l7 = 0000000000000000, Mem[0000000010181400] = c50000e3
	stha	%l7,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000e3
	membar	#Sync			! Added by membar checker (35)
!	%l4 = c5c38b2e00000000, Mem[000000001014140f] = 7b3de5ff
	stb	%l4,[%i5+0x00f]		! Mem[000000001014140c] = 7b3de500
!	Mem[0000000030041400] = ee1c5900, %l7 = 0000000000000000
	swapa	[%i1+%g0]0x89,%l7	! %l7 = 00000000ee1c5900
!	%l7 = 00000000ee1c5900, Mem[00000000201c0000] = 00ff2cc7, %asi = 80
	stha	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = 59002cc7
!	Mem[0000000010181408] = ff000000, %l6 = 0000000000000074
	ldstuba	[%i6+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	%l1 = 00000000ff763c7f, Mem[0000000010081408] = 79a27fff
	stwa	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = ff763c7f
!	%f28 = ae3ded1d f87c67df, %l1 = 00000000ff763c7f
!	Mem[0000000030041418] = dec2573865744a75
	add	%i1,0x018,%g1
	stda	%f28,[%g1+%l1]ASI_PST32_S ! Mem[0000000030041418] = ae3ded1df87c67df
!	%l6 = 00000000, %l7 = ee1c5900, Mem[00000000100c1400] = 00000000 ffffffff
	stda	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 ee1c5900
!	%l0 = ff000000ff000000, Mem[0000000010141410] = ff007f00
	stha	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 00007f00
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ffafffff, %l0 = ff000000ff000000
	lduha	[%i0+%g0]0x81,%l0	! %l0 = 000000000000ffaf

p0_label_187:
!	Mem[00000000201c0000] = 59002cc7, %l0 = 000000000000ffaf
	lduh	[%o0+%g0],%l0		! %l0 = 0000000000005900
!	Mem[0000000030181408] = 00000000, %l1 = 00000000ff763c7f
	lduba	[%i6+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l1 = 0000000000000000
	ldsha	[%i0+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001410] = 000000ff, %l0 = 0000000000005900
	ldsba	[%i0+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001408] = 9c2109512c96ffff, %f14 = bb48fd0c 49000000
	ldda	[%i0+%o4]0x88,%f14	! %f14 = 9c210951 2c96ffff
!	Mem[000000001000142c] = 000000ff, %f12 = bbb4aac3
	ld	[%i0+0x02c],%f12	! %f12 = 000000ff
!	Mem[0000000010141410] = 007f0000, %l3 = 00000000000000ff
	ldsha	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Code Fragment 4
p0_fragment_15:
!	%l0 = ffffffffffffffff
	setx	0x4ac71a204f5441c6,%g7,%l0 ! %l0 = 4ac71a204f5441c6
!	%l1 = 0000000000000000
	setx	0xf6b989e874ed0453,%g7,%l1 ! %l1 = f6b989e874ed0453
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4ac71a204f5441c6
	setx	0x3e70164fca36fb6b,%g7,%l0 ! %l0 = 3e70164fca36fb6b
!	%l1 = f6b989e874ed0453
	setx	0x5f764ec022fdb5c4,%g7,%l1 ! %l1 = 5f764ec022fdb5c4
!	Mem[0000000010101418] = 2f86e420, %l5 = 00000000cc3f0000
	ldub	[%i4+0x019],%l5		! %l5 = 0000000000000086
!	Starting 10 instruction Store Burst
!	%f2  = ff0000e3, Mem[0000000030181400] = ffff0000
	sta	%f2 ,[%i6+%g0]0x81	! Mem[0000000030181400] = ff0000e3

p0_label_188:
!	%l0 = ca36fb6b, %l1 = 22fdb5c4, Mem[0000000010041430] = dec25738 ff000000
	std	%l0,[%i1+0x030]		! Mem[0000000010041430] = ca36fb6b 22fdb5c4
!	%f28 = ae3ded1d f87c67df, Mem[0000000030181408] = 00000000 00000000
	stda	%f28,[%i6+%o4]0x81	! Mem[0000000030181408] = ae3ded1d f87c67df
!	%l2 = 00000000000000c5, Mem[00000000300c1400] = 74591ceec3aab4bb
	stxa	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000000000c5
!	%l4 = c5c38b2e00000000, Mem[0000000010041400] = 000000ff
	stha	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff
!	%l4 = 00000000, %l5 = 00000086, Mem[0000000010141400] = e30000ff ffffffff
	stda	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000 00000086
!	%l3 = 0000000000000000, Mem[0000000030141410] = 0000000000000000
	stxa	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000000000000
!	%f0  = ff0000e3 ffffffff ff0000e3 7b3de5ff
!	%f4  = ff007f00 735700ff 00000000 000000c5
!	%f8  = 00007379 b0ede7ff e09cba41 2302b620
!	%f12 = 000000ff ffffffff 9c210951 2c96ffff
	stda	%f0,[%i1]ASI_BLK_S	! Block Store to 0000000030041400
!	%l6 = 0000000000000000, Mem[0000000010101400] = 2e8bc3c5
	stba	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 2e8bc300
!	%l1 = 5f764ec022fdb5c4, Mem[0000000010101430] = 74591ceeffaab4bb
	stx	%l1,[%i4+0x030]		! Mem[0000000010101430] = 5f764ec022fdb5c4
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000 000000ff, %l0 = ca36fb6b, %l1 = 22fdb5c4
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000000 00000000000000ff

p0_label_189:
!	Mem[0000000030001410] = ff005773000000ff, %l7 = 00000000ee1c5900
	ldxa	[%i0+%o5]0x89,%l7	! %l7 = ff005773000000ff
!	Mem[00000000100c1400] = ee1c590000000000, %f22 = ff7f0000 00000000
	ldda	[%i3+%g0]0x88,%f22	! %f22 = ee1c5900 00000000
!	Mem[0000000010101410] = e30000ff e30000e3, %l4 = 00000000, %l5 = 00000086
	ldda	[%i4+%o5]0x88,%l4	! %l4 = 00000000e30000e3 00000000e30000ff
!	Mem[0000000030101410] = cc3f0000, %l4 = 00000000e30000e3
	ldswa	[%i4+%o5]0x89,%l4	! %l4 = ffffffffcc3f0000
!	%l3 = 0000000000000000, imm = 0000000000000914, %l4 = ffffffffcc3f0000
	addc	%l3,0x914,%l4		! %l4 = 0000000000000914
!	Mem[0000000010141430] = bbb4aac3, %l4 = 0000000000000914
	lduw	[%i5+0x030],%l4		! %l4 = 00000000bbb4aac3
!	Mem[00000000201c0000] = 59002cc7, %l3 = 0000000000000000
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 0000000000005900
!	Mem[0000000010181400] = 000000e3, %l3 = 0000000000005900
	ldub	[%i6+%g0],%l3		! %l3 = 0000000000000000
!	Mem[0000000030181410] = 000000ff, %f23 = 00000000
	lda	[%i6+%o5]0x81,%f23	! %f23 = 000000ff
!	Starting 10 instruction Store Burst
!	%f28 = ae3ded1d f87c67df, Mem[0000000010001400] = 00007fff 00000000
	stda	%f28,[%i0+%g0]0x88	! Mem[0000000010001400] = ae3ded1d f87c67df

p0_label_190:
!	Mem[0000000030141400] = ffffafff, %l4 = 00000000bbb4aac3
	swapa	[%i5+%g0]0x89,%l4	! %l4 = 00000000ffffafff
!	%l6 = 0000000000000000, Mem[0000000030181408] = 1ded3dae
	stba	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 1ded3d00
!	%f23 = 000000ff, Mem[0000000030141400] = c3aab4bb
	sta	%f23,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000ff
!	%l1 = 00000000000000ff, Mem[0000000010041410] = ff000000
	stha	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 00ff0000
!	%l6 = 0000000000000000, Mem[0000000030181410] = ff000000
	stwa	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	Mem[0000000010081417] = 00000000, %l1 = 00000000000000ff
	ldstub	[%i2+0x017],%l1		! %l1 = 00000000000000ff
!	Mem[0000000020800000] = ffffd75b, %l0 = 0000000000000000
	ldstub	[%o1+%g0],%l0		! %l0 = 000000ff000000ff
!	%l2 = 00000000000000c5, Mem[00000000100c1410] = 490000ff
	stwa	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000c5
!	Mem[0000000030141410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i5+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (36)
!	Mem[0000000010041410] = 00ff0000, %l4 = 00000000ffffafff
	ldsha	[%i1+%o5]0x80,%l4	! %l4 = 00000000000000ff

p0_label_191:
!	Mem[0000000010041418] = ab88e890000000ff, %f26 = 000000ff 74763c7f
	ldda	[%i1+0x018]%asi,%f26	! %f26 = ab88e890 000000ff
!	Mem[0000000010041408] = 00000000, %l3 = 0000000000000000
	lduwa	[%i1+%o4]0x88,%l3	! %l3 = 0000000000000000
!	%l3 = 0000000000000000, imm = fffffffffffff639, %l5 = 00000000e30000ff
	andn	%l3,-0x9c7,%l5		! %l5 = 0000000000000000
!	Mem[000000001004141c] = 000000ff, %f5  = 735700ff
	ld	[%i1+0x01c],%f5 	! %f5 = 000000ff
!	Mem[0000000030001400] = ffafffff, %f24 = 147fa279
	lda	[%i0+%g0]0x81,%f24	! %f24 = ffafffff
!	Mem[0000000030081410] = 00000000, %f14 = 9c210951
	lda	[%i2+%o5]0x81,%f14	! %f14 = 00000000
!	Mem[0000000010141410] = 00007f00735700ff, %l5 = 0000000000000000
	ldxa	[%i5+%o5]0x80,%l5	! %l5 = 00007f00735700ff
!	Mem[000000001008142c] = 6cb69670, %f14 = 00000000
	ld	[%i2+0x02c],%f14	! %f14 = 6cb69670
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000010101410] = e30000e3 ff0000e3
	stda	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000ff 00000000
!	Starting 10 instruction Store Burst
!	%f27 = 000000ff, Mem[0000000010181410] = ee1c59ff
	sta	%f27,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff

p0_label_192:
!	Mem[0000000030081408] = e282b6ff, %l5 = 00007f00735700ff
	ldstuba	[%i2+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000010001400] = df677cf8 1ded3dae
	stda	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000ff 000000ff
!	Mem[000000001000142b] = 00000000, %l4 = 00000000000000ff
	ldstuba	[%i0+0x02b]%asi,%l4	! %l4 = 00000000000000ff
!	%f20 = 00000000 00000000, Mem[0000000030001410] = ff000000 735700ff
	stda	%f20,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000 00000000
!	%f12 = 000000ff, Mem[0000000030001410] = 00000000
	sta	%f12,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff
!	Mem[0000000030001408] = 000000ff, %l2 = 00000000000000c5
	swapa	[%i0+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181408] = ff0000ff, %l0 = 00000000000000ff
	ldstuba	[%i6+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[00000000100c1408] = 00ffffbb, %l6 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000010181408] = 00000000ff0000ff
	stxa	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 0000000000591cee, %f20 = 00000000 00000000
	ldd	[%i3+%g0],%f20		! %f20 = 00000000 00591cee

p0_label_193:
!	Mem[0000000030141400] = 000000ff, %l3 = 0000000000000000
	lduba	[%i5+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l0 = 00000000000000ff
	lduba	[%i1+0x00b]%asi,%l0	! %l0 = 0000000000000000
!	%f24 = ffafffff, %f26 = ab88e890
	fcmpes	%fcc0,%f24,%f26		! %fcc0 = 3
!	Mem[0000000030101408] = 00000000 000000ff, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i4+%o4]0x89,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Code Fragment 3
p0_fragment_16:
!	%l0 = 0000000000000000
	setx	0x6fd34e17df75c0ed,%g7,%l0 ! %l0 = 6fd34e17df75c0ed
!	%l1 = 0000000000000000
	setx	0x57e9de9fc993e7b3,%g7,%l1 ! %l1 = 57e9de9fc993e7b3
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 6fd34e17df75c0ed
	setx	0xdac1ebbfc36ed8d5,%g7,%l0 ! %l0 = dac1ebbfc36ed8d5
!	%l1 = 57e9de9fc993e7b3
	setx	0x753d2a6fa14fd90f,%g7,%l1 ! %l1 = 753d2a6fa14fd90f
!	Mem[0000000030041408] = ff0000e3, %l5 = 00000000000000ff
	ldswa	[%i1+%o4]0x81,%l5	! %l5 = ffffffffff0000e3
!	Mem[0000000030081408] = ffb682e2, %l2 = 00000000000000ff
	ldswa	[%i2+%o4]0x81,%l2	! %l2 = ffffffffffb682e2
!	Mem[0000000010041408] = 00000000, %l2 = ffffffffffb682e2
	lduba	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l2 = 0000000000000000
	ldsba	[%i3+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 753d2a6fa14fd90f, Mem[0000000010081408] = 7f3c76ff
	stha	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = d90f76ff

p0_label_194:
!	%f29 = f87c67df, Mem[0000000010181428] = 00000000
	sta	%f29,[%i6+0x028]%asi	! Mem[0000000010181428] = f87c67df
!	%f16 = c5c38b2e 00000000 c23db710 5109219c
!	%f20 = 00000000 00591cee ee1c5900 000000ff
!	%f24 = ffafffff 6ad67029 ab88e890 000000ff
!	%f28 = ae3ded1d f87c67df a2e1f9a7 58caeb5e
	stda	%f16,[%i3]ASI_BLK_PL	! Block Store to 00000000100c1400
!	%l4 = 0000000000000000, imm = fffffffffffff5f8, %l4 = 0000000000000000
	xnor	%l4,-0xa08,%l4		! %l4 = 0000000000000a07
!	Mem[0000000010141400] = 00000000, %l5 = ffffffffff0000e3
	ldstuba	[%i5+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181410] = ff000000, %l0 = dac1ebbfc36ed8d5
	ldstuba	[%i6+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010181410] = ff000000, %l2 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l2	! %l2 = 00000000ff000000
!	%l2 = 00000000ff000000, Mem[0000000030001408] = c5000000ff000000
	stxa	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000ff000000
!	%f4  = ff007f00 000000ff, Mem[0000000030041408] = e30000ff ffe53d7b
	stda	%f4 ,[%i1+%o4]0x89	! Mem[0000000030041408] = ff007f00 000000ff
!	%l3 = 0000000000000000, Mem[0000000010001408] = ffff962c, %asi = 80
	stha	%l3,[%i0+0x008]%asi	! Mem[0000000010001408] = 0000962c
!	Starting 10 instruction Load Burst
!	%l3 = 0000000000000000, immd = fffffffffffffe9a, %l1  = 753d2a6fa14fd90f
	mulx	%l3,-0x166,%l1		! %l1 = 0000000000000000

p0_label_195:
!	Mem[0000000010101400] = 00c38b2e, %l2 = 00000000ff000000
	ldsb	[%i4+%g0],%l2		! %l2 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %l0 = 00000000000000ff
	lduba	[%i6+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181408] = 003ded1d, %l6 = 00000000000000ff
	ldswa	[%i6+%o4]0x81,%l6	! %l6 = 00000000003ded1d
!	Mem[0000000030141400] = ff000000, %l1 = 0000000000000000
	lduha	[%i5+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101408] = ff000000, %l3 = 0000000000000000
	lduba	[%i4+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181408] = 1ded3d00, %l5 = 0000000000000000
	lduwa	[%i6+%o4]0x89,%l5	! %l5 = 000000001ded3d00
	membar	#Sync			! Added by membar checker (37)
!	Mem[00000000100c1408] = c23db7105109219c, %f12 = 000000ff ffffffff
	ldda	[%i3+%o4]0x88,%f12	! %f12 = c23db710 5109219c
!	%l3 = 00000000000000ff, %l3 = 00000000000000ff, %l3 = 00000000000000ff
	sub	%l3,%l3,%l3		! %l3 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l0 = 0000000000000000
	ldsb	[%i0+0x012],%l0		! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = e30000ff, %l5 = 000000001ded3d00
	swapa	[%i5+%o4]0x88,%l5	! %l5 = 00000000e30000ff

p0_label_196:
!	%f0  = ff0000e3 ffffffff, %l2 = 0000000000000000
!	Mem[0000000030001418] = dec2573865744a75
	add	%i0,0x018,%g1
	stda	%f0,[%g1+%l2]ASI_PST16_S ! Mem[0000000030001418] = dec2573865744a75
!	%f6  = 00000000, Mem[0000000010101408] = 00000000
	sta	%f6 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	Mem[0000000010001408] = 0000962c, %l2 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l2	! %l2 = 000000000000962c
!	%l2 = 0000962c, %l3 = 00000000, Mem[0000000030141400] = ff000000 000000b2
	stda	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000962c 00000000
!	Mem[0000000010081400] = ff000000, %l1 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030101410] = 00003fcc, %l5 = 00000000e30000ff
	swapa	[%i4+%o5]0x81,%l5	! %l5 = 0000000000003fcc
!	Mem[00000000100c1410] = 00591cee, %l0 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l0	! %l0 = 0000000000591cee
!	Mem[00000000100c1400] = 00000000, %l2 = 000000000000962c
	swapa	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (38)
!	Mem[0000000010101400] = 00c38b2e 00000000 00000000 5109219c
!	Mem[0000000010101410] = 000000ff 00000000 2f86e420 9d009055
!	Mem[0000000010101420] = 00000080 2e8bc3c5 00000000 ffffff7f
!	Mem[0000000010101430] = 5f764ec0 22fdb5c4 88e53d7b 0cfd48bb
	ldda	[%i4]ASI_BLK_P,%f0	! Block Load from 0000000010101400
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff7241, %l0 = 0000000000591cee
	ldsh	[%o2+%g0],%l0		! %l0 = ffffffffffffffff

p0_label_197:
!	Mem[0000000030141410] = 00000000000000ff, %f28 = ae3ded1d f87c67df
	ldda	[%i5+%o5]0x89,%f28	! %f28 = 00000000 000000ff
!	Mem[0000000010041408] = 00000000, %l4 = 0000000000000a07
	ldswa	[%i1+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041400] = 000000ff, %l3 = 0000000000000000
	lduba	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = ff000000ffffffff, %l5 = 0000000000003fcc
	ldxa	[%i2+%g0]0x80,%l5	! %l5 = ff000000ffffffff
!	Mem[0000000030081408] = ffb682e2, %l1 = 00000000000000ff
	ldsba	[%i2+%o4]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030041400] = ff0000e3, %l6 = 00000000003ded1d
	ldsba	[%i1+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030141400] = 2c960000, %l6 = ffffffffffffffff
	ldsba	[%i5+%g0]0x81,%l6	! %l6 = 000000000000002c
!	Mem[00000000300c1408] = ffffffff00000000, %f18 = c23db710 5109219c
	ldda	[%i3+%o4]0x81,%f18	! %f18 = ffffffff 00000000
!	Mem[00000000100c1410] = 00000000, %l1 = ffffffffffffffff
	ldsba	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 000000ff, %l2 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l2	! %l2 = 00000000000000ff

p0_label_198:
!	%l5 = ff000000ffffffff, Mem[0000000021800081] = ea3d341e
	stb	%l5,[%o3+0x081]		! Mem[0000000021800080] = eaff341e
!	%l5 = ff000000ffffffff, Mem[0000000030001410] = ff00000000000000
	stxa	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = ff000000ffffffff
!	%l5 = ff000000ffffffff, Mem[0000000030181410] = 00000000
	stwa	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffffff
!	Mem[0000000010101436] = 22fdb5c4, %l5 = ff000000ffffffff
	ldstub	[%i4+0x036],%l5		! %l5 = 000000b5000000ff
!	Mem[0000000030141408] = 59000000, %l6 = 000000000000002c
	ldstuba	[%i5+%o4]0x81,%l6	! %l6 = 00000059000000ff
!	%l3 = 0000000000000000, Mem[0000000010041400] = 00ff0000ff000000
	stxa	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000000000000000
!	%l6 = 0000000000000059, Mem[0000000020800041] = 00e3a3d2
	stb	%l6,[%o1+0x041]		! Mem[0000000020800040] = 0059a3d2
!	%l7 = 0000000000000000, Mem[00000000211c0000] = ffff7241, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00007241
!	%f26 = ab88e890, Mem[0000000030181400] = e30000ff
	sta	%f26,[%i6+%g0]0x89	! Mem[0000000030181400] = ab88e890
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 000000ff, %l3 = 0000000000000000
	ldsba	[%i0+%o5]0x89,%l3	! %l3 = ffffffffffffffff

p0_label_199:
!	Mem[0000000010041410] = 000000ff0000ff00, %l3 = ffffffffffffffff
	ldxa	[%i1+%o5]0x88,%l3	! %l3 = 000000ff0000ff00
!	Mem[0000000010001410] = ff00000000000000, %f20 = 00000000 00591cee
	ldda	[%i0+%o5]0x88,%f20	! %f20 = ff000000 00000000
!	Mem[0000000030001408] = 00000000, %l0 = ffffffffffffffff
	ldswa	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101410] = 00000000ff000000, %f30 = a2e1f9a7 58caeb5e
	ldda	[%i4+%o5]0x88,%f30	! %f30 = 00000000 ff000000
!	Mem[0000000010041400] = 0000000000000000, %l0 = 0000000000000000
	ldx	[%i1+%g0],%l0		! %l0 = 0000000000000000
!	Code Fragment 3
p0_fragment_17:
!	%l0 = 0000000000000000
	setx	0x8195ea282d19ddf3,%g7,%l0 ! %l0 = 8195ea282d19ddf3
!	%l1 = 0000000000000000
	setx	0xf1cc21783dfdc996,%g7,%l1 ! %l1 = f1cc21783dfdc996
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8195ea282d19ddf3
	setx	0xfc6259e034955d46,%g7,%l0 ! %l0 = fc6259e034955d46
!	%l1 = f1cc21783dfdc996
	setx	0xe59097f0163873b3,%g7,%l1 ! %l1 = e59097f0163873b3
!	Mem[0000000010101410] = 000000ff00000000, %l7 = 0000000000000000
	ldxa	[%i4+%o5]0x80,%l7	! %l7 = 000000ff00000000
!	Mem[00000000211c0000] = 00007241, %l7 = 000000ff00000000
	ldsba	[%o2+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = 000000ff, %f16 = c5c38b2e
	lda	[%i6+%o4]0x88,%f16	! %f16 = 000000ff
!	Starting 10 instruction Store Burst
!	%l3 = 000000ff0000ff00, Mem[0000000010081408] = d90f76ffffffffff
	stx	%l3,[%i2+%o4]		! Mem[0000000010081408] = 000000ff0000ff00

p0_label_200:
!	%l1 = e59097f0163873b3, Mem[0000000010181410] = 00000000
	stwa	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = 163873b3
!	Mem[0000000030041408] = ff000000, %l1 = e59097f0163873b3
	ldstuba	[%i1+%o4]0x81,%l1	! %l1 = 000000ff000000ff
!	%l4 = 0000000000000000, Mem[00000000218000c0] = 00ff265e
	sth	%l4,[%o3+0x0c0]		! Mem[00000000218000c0] = 0000265e
!	%f28 = 00000000 000000ff, %l5 = 00000000000000b5
!	Mem[0000000010181408] = ff00000000000000
	add	%i6,0x008,%g1
	stda	%f28,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010181408] = ff00000000000000
!	Mem[0000000030181408] = 1ded3d00, %l0 = fc6259e034955d46
	swapa	[%i6+%o4]0x89,%l0	! %l0 = 000000001ded3d00
!	%l4 = 0000000000000000, Mem[0000000010181410] = 163873b3
	stha	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 000073b3
!	%f16 = 000000ff, Mem[00000000100c1410] = 00000000
	sta	%f16,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000ff
!	%l4 = 0000000000000000, Mem[00000000300c1410] = 00000000
	stha	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	%l0 = 1ded3d00, %l1 = 000000ff, Mem[0000000010001410] = 00000000 ff000000
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 1ded3d00 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000 00000000, %l2 = 000000ff, %l3 = 0000ff00
	ldda	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000 0000000000000000

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	mulx	%l0,%l4,%l2
	addc	%l7,%l4,%l5
	sub	%l6,%l1,%l7
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0

1:	membar	#Sync			! Force all stores to complete


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 000000001ded3d00
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 00000000000000ff
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
	cmp	%l5,%g2			! %l5 should be 00000000000000b5
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000059
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x000000b2,%g2
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
	cmp	%l0,%l1			! %f0  should be 00c38b2e 00000000
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00000000 5109219c
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 000000ff 00000000
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 2f86e420 9d009055
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000080 2e8bc3c5
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000000 ffffff7f
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 5f764ec0 22fdb5c4
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 88e53d7b 0cfd48bb
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 000000ff 00000000
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be ffffffff 00000000
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be ff000000 00000000
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be ee1c5900 000000ff
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be ffafffff 6ad67029
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be ab88e890 000000ff
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 00000000 000000ff
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 00000000 ff000000
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
	andn	%l0,0xfdd,%l3
	add	%l6,0xbd2,%l3
	smul	%l7,%l7,%l4
	done

p0_trap1o:
	andn	%l0,0xfdd,%l3
	add	%l6,0xbd2,%l3
	smul	%l7,%l7,%l4
	done


p0_trap2e:
	fadds	%f13,%f3 ,%f12
	fdivs	%f9 ,%f8 ,%f5 
	add	%l4,-0xf8d,%l7
	udivx	%l1,0x3eb,%l1
	andn	%l3,%l4,%l6
	done

p0_trap2o:
	fadds	%f13,%f3 ,%f12
	fdivs	%f9 ,%f8 ,%f5 
	add	%l4,-0xf8d,%l7
	udivx	%l1,0x3eb,%l1
	andn	%l3,%l4,%l6
	done


p0_trap3e:
	sub	%l6,0xc92,%l4
	xnor	%l6,%l1,%l1
	done

p0_trap3o:
	sub	%l6,0xc92,%l4
	xnor	%l6,%l1,%l1
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
	ldx	[%g1+0x000],%l0		! %l0 = 4927f6424c7c5536
	ldx	[%g1+0x008],%l1		! %l1 = 2d6b213e4775f9fb
	ldx	[%g1+0x010],%l2		! %l2 = 734e1fba93b38c5a
	ldx	[%g1+0x018],%l3		! %l3 = d56aa3cc96b3ebd2
	ldx	[%g1+0x020],%l4		! %l4 = 17d9d00e8fb7db1f
	ldx	[%g1+0x028],%l5		! %l5 = 6d6e8968f04f6e1f
	ldx	[%g1+0x030],%l6		! %l6 = 43e4e0e0af28d251
	ldx	[%g1+0x038],%l7		! %l7 = d421ec19f85517ec

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
	andn	%l0,0xfdd,%l3
	jmpl	%o7,%g0
	add	%l6,0xbd2,%l3
p0_near_0_he:
	swap	[%i2+0x030],%l1		! Mem[0000000010081430]
	sdivx	%l4,-0x127,%l1
	or	%l2,%l2,%l0
	fdivs	%f18,%f24,%f19
	orn	%l7,-0x19c,%l6
	xnor	%l6,0xf7f,%l0
	ldstub	[%o2+0x000],%l1		! Mem[00000000211c0000]
	jmpl	%o7,%g0
	xor	%l4,%l0,%l5
near0_b2b_h:
	jmpl	%o7,%g0
	fcmps	%fcc3,%f21,%f26
	jmpl	%o7,%g0
	nop
near0_b2b_l:
	jmpl	%o7,%g0
	or	%l5,0x232,%l3
	jmpl	%o7,%g0
	nop
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	fcmps	%fcc0,%f7 ,%f13
	addc	%l5,%l3,%l6
	fadds	%f12,%f13,%f0 
	jmpl	%o7,%g0
	xnor	%l6,-0xd35,%l5
p0_near_1_he:
	udivx	%l6,0x33a,%l2
	fdivs	%f23,%f31,%f23
	fdivs	%f21,%f19,%f31
	jmpl	%o7,%g0
	add	%l3,-0x78d,%l0
near1_b2b_h:
	fitod	%f19,%f18
	orn	%l3,%l2,%l0
	jmpl	%o7,%g0
	orn	%l1,0x3a3,%l6
near1_b2b_l:
	subc	%l6,%l7,%l7
	fsubs	%f15,%f5 ,%f8 
	jmpl	%o7,%g0
	sub	%l3,0x61d,%l4
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	sth	%l6,[%i1+0x036]		! Mem[0000000010041436]
	jmpl	%o7,%g0
	st	%f0 ,[%i5+0x024]	! Mem[0000000010141424]
p0_near_2_he:
	fmuls	%f24,%f26,%f24
	swap	[%i2+0x018],%l4		! Mem[0000000010081418]
	jmpl	%o7,%g0
	fdivs	%f26,%f29,%f31
near2_b2b_h:
	jmpl	%o7,%g0
	fcmps	%fcc1,%f28,%f29
	jmpl	%o7,%g0
	nop
near2_b2b_l:
	jmpl	%o7,%g0
	xnor	%l5,%l4,%l7
	jmpl	%o7,%g0
	nop
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	or	%l3,%l0,%l6
	std	%l6,[%i1+0x030]		! Mem[0000000010041430]
	fadds	%f2 ,%f3 ,%f15
	or	%l5,0x976,%l0
	udivx	%l7,-0xa56,%l3
	jmpl	%o7,%g0
	fitod	%f1 ,%f6 
p0_near_3_he:
	xnor	%l2,%l1,%l2
	mulx	%l0,%l2,%l7
	fsqrts	%f17,%f23
	fsqrts	%f24,%f29
	fmuls	%f20,%f19,%f17
	xor	%l6,-0x6a5,%l5
	or	%l2,0x4c4,%l2
	jmpl	%o7,%g0
	fcmps	%fcc2,%f29,%f26
near3_b2b_h:
	xor	%l3,%l7,%l0
	fstod	%f22,%f16
	orn	%l1,-0x405,%l2
	jmpl	%o7,%g0
	mulx	%l4,-0xc9b,%l1
near3_b2b_l:
	xnor	%l7,%l6,%l3
	udivx	%l6,0xbd5,%l6
	and	%l3,%l4,%l2
	jmpl	%o7,%g0
	add	%l6,0xea3,%l5
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	fadds	%f10,%f11,%f7 
	fcmps	%fcc1,%f5 ,%f12
	fmuls	%f1 ,%f14,%f4 
	fdivs	%f11,%f9 ,%f10
	fdivs	%f9 ,%f5 ,%f8 
	mulx	%l7,%l0,%l6
	addc	%l3,%l4,%l2
	jmpl	%o7,%g0
	fadds	%f8 ,%f2 ,%f2 
p0_far_0_lem:
	fadds	%f10,%f11,%f7 
	fcmps	%fcc1,%f5 ,%f12
	fmuls	%f1 ,%f14,%f4 
	fdivs	%f11,%f9 ,%f10
	fdivs	%f9 ,%f5 ,%f8 
	mulx	%l7,%l0,%l6
	addc	%l3,%l4,%l2
	jmpl	%o7,%g0
	fadds	%f8 ,%f2 ,%f2 
p0_far_0_he:
	andn	%l6,%l3,%l2
	addc	%l2,0xc71,%l3
	jmpl	%o7,%g0
	udivx	%l0,%l7,%l6
p0_far_0_hem:
	andn	%l6,%l3,%l2
	addc	%l2,0xc71,%l3
	jmpl	%o7,%g0
	udivx	%l0,%l7,%l6
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	fadds	%f29,%f26,%f26
	sub	%l3,%l3,%l1
	subc	%l3,%l1,%l5
	jmpl	%o7,%g0
	xnor	%l5,%l6,%l6
far0_b2b_l:
	orn	%l0,0xe6a,%l1
	umul	%l5,0xa86,%l0
	fmuls	%f12,%f4 ,%f8 
	jmpl	%o7,%g0
	orn	%l0,%l0,%l0
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	mulx	%l0,%l0,%l2
	fadds	%f14,%f5 ,%f3 
	add	%l5,0x216,%l3
	jmpl	%o7,%g0
	fcmps	%fcc3,%f14,%f5 
p0_far_1_lem:
	mulx	%l0,%l0,%l2
	fadds	%f14,%f5 ,%f3 
	add	%l5,0x216,%l3
	jmpl	%o7,%g0
	fcmps	%fcc3,%f14,%f5 
p0_far_1_he:
	smul	%l2,%l2,%l0
	smul	%l4,-0x1000,%l2
	add	%l5,%l1,%l0
	jmpl	%o7,%g0
	and	%l2,-0xd57,%l4
p0_far_1_hem:
	smul	%l2,%l2,%l0
	smul	%l4,-0x1000,%l2
	add	%l5,%l1,%l0
	jmpl	%o7,%g0
	and	%l2,-0xd57,%l4
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	sub	%l7,-0x7bd,%l5
	sdivx	%l2,0x6d6,%l6
	mulx	%l0,0x2e0,%l0
	orn	%l4,-0xe53,%l0
	fdivs	%f23,%f25,%f30
	jmpl	%o7,%g0
	sub	%l0,-0x7a5,%l4
far1_b2b_l:
	udivx	%l1,-0x34c,%l0
	orn	%l3,%l5,%l2
	fdtoi	%f2 ,%f7 
	subc	%l7,%l0,%l3
	fdivs	%f7 ,%f9 ,%f8 
	jmpl	%o7,%g0
	fmuls	%f0 ,%f0 ,%f1 
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	lduw	[%i3+0x030],%l2		! Mem[00000000100c1430]
	xor	%l3,-0x179,%l4
	jmpl	%o7,%g0
	mulx	%l0,0xc61,%l7
p0_far_2_lem:
	membar	#Sync
	lduw	[%i3+0x030],%l2		! Mem[00000000100c1430]
	xor	%l3,-0x179,%l4
	jmpl	%o7,%g0
	mulx	%l0,0xc61,%l7
p0_far_2_he:
	lduh	[%i2+0x024],%l7		! Mem[0000000010081424]
	lduh	[%i5+0x03e],%l2		! Mem[000000001014143e]
	smul	%l4,%l7,%l7
	fcmps	%fcc2,%f24,%f18
	jmpl	%o7,%g0
	umul	%l6,%l6,%l2
p0_far_2_hem:
	membar	#Sync
	lduh	[%i2+0x024],%l7		! Mem[0000000010081424]
	lduh	[%i5+0x03e],%l2		! Mem[000000001014143e]
	smul	%l4,%l7,%l7
	fcmps	%fcc2,%f24,%f18
	jmpl	%o7,%g0
	umul	%l6,%l6,%l2
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	fmuls	%f17,%f21,%f16
	and	%l5,-0x2ab,%l0
	sub	%l2,-0xa85,%l3
	jmpl	%o7,%g0
	xnor	%l2,%l1,%l7
far2_b2b_l:
	xnor	%l5,0x9e7,%l7
	mulx	%l2,0xd0b,%l5
	fcmps	%fcc2,%f12,%f15
	jmpl	%o7,%g0
	smul	%l1,%l7,%l0
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	addc	%l2,%l5,%l1
	xnor	%l3,-0xfce,%l5
	fdivs	%f5 ,%f5 ,%f1 
	smul	%l6,0xa79,%l7
	sub	%l1,-0x5e6,%l6
	xnor	%l0,%l5,%l0
	jmpl	%o7,%g0
	xnor	%l3,0x144,%l3
p0_far_3_lem:
	addc	%l2,%l5,%l1
	xnor	%l3,-0xfce,%l5
	fdivs	%f5 ,%f5 ,%f1 
	smul	%l6,0xa79,%l7
	sub	%l1,-0x5e6,%l6
	xnor	%l0,%l5,%l0
	jmpl	%o7,%g0
	xnor	%l3,0x144,%l3
p0_far_3_he:
	add	%l6,%l6,%l3
	jmpl	%o7,%g0
	sub	%l4,%l5,%l7
p0_far_3_hem:
	add	%l6,%l6,%l3
	jmpl	%o7,%g0
	sub	%l4,%l5,%l7
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	fsubs	%f31,%f23,%f20
	umul	%l3,-0x302,%l3
	mulx	%l0,%l2,%l6
	sub	%l0,%l3,%l6
	and	%l0,%l6,%l3
	fsubs	%f19,%f27,%f20
	jmpl	%o7,%g0
	andn	%l7,0xbd6,%l4
far3_b2b_l:
	mulx	%l6,0xcf4,%l1
	orn	%l2,-0x8ce,%l6
	add	%l5,-0xfdb,%l7
	umul	%l0,%l5,%l4
	mulx	%l5,0x3a1,%l0
	umul	%l6,0x959,%l6
	jmpl	%o7,%g0
	andn	%l2,-0xe95,%l5
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	mulx	%l7,0x92b,%l0
	jmpl	%g6+8,%g0
	fsqrts	%f8 ,%f3 
p0_call_0_le:
	and	%l1,-0x7b6,%l6
	smul	%l6,%l4,%l6
	retl
	xnor	%l7,%l7,%l3
p0_jmpl_0_lo:
	mulx	%l7,0x92b,%l0
	jmpl	%g6+8,%g0
	fsqrts	%f8 ,%f3 
p0_call_0_lo:
	and	%l1,-0x7b6,%l6
	smul	%l6,%l4,%l6
	retl
	xnor	%l7,%l7,%l3
p0_jmpl_0_he:
	udivx	%l4,-0x321,%l5
	fdivs	%f22,%f28,%f30
	add	%l5,%l1,%l5
	ldsh	[%i1+0x006],%l0		! Mem[0000000010041406]
	swap	[%i5+0x02c],%l4		! Mem[000000001014142c]
	jmpl	%g6+8,%g0
	orn	%l3,0x562,%l4
p0_call_0_he:
	addc	%l2,0x25c,%l6
	fadds	%f20,%f24,%f23
	sub	%l1,%l6,%l5
	fdivs	%f28,%f26,%f23
	retl
	ldstub	[%o2+0x001],%l5		! Mem[00000000211c0001]
p0_jmpl_0_ho:
	udivx	%l4,-0x321,%l5
	fdivs	%f22,%f28,%f30
	add	%l5,%l1,%l5
	ldsh	[%o1+0x006],%l0		! Mem[0000000010041406]
	swap	[%o5+0x02c],%l4		! Mem[000000001014142c]
	jmpl	%g6+8,%g0
	orn	%l3,0x562,%l4
p0_call_0_ho:
	addc	%l2,0x25c,%l6
	fadds	%f20,%f24,%f23
	sub	%l1,%l6,%l5
	fdivs	%f28,%f26,%f23
	retl
	ldstub	[%i2+0x001],%l5		! Mem[00000000211c0001]
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	andn	%l4,%l4,%l6
	fsubs	%f9 ,%f13,%f9 
	andn	%l0,-0x187,%l0
	mulx	%l3,0x75f,%l3
	sub	%l3,-0xd40,%l6
	jmpl	%g6+8,%g0
	xor	%l3,-0xf8b,%l6
p0_call_1_le:
	fadds	%f13,%f2 ,%f4 
	retl
	subc	%l4,%l6,%l7
p0_jmpl_1_lo:
	andn	%l4,%l4,%l6
	fsubs	%f9 ,%f13,%f9 
	andn	%l0,-0x187,%l0
	mulx	%l3,0x75f,%l3
	sub	%l3,-0xd40,%l6
	jmpl	%g6+8,%g0
	xor	%l3,-0xf8b,%l6
p0_call_1_lo:
	fadds	%f13,%f2 ,%f4 
	retl
	subc	%l4,%l6,%l7
p0_jmpl_1_he:
	fadds	%f26,%f28,%f18
	ldstub	[%o2+0x000],%l1		! Mem[00000000211c0000]
	sub	%l2,%l7,%l7
	subc	%l7,%l5,%l5
	jmpl	%g6+8,%g0
	umul	%l2,0xc9d,%l3
p0_call_1_he:
	sub	%l3,%l3,%l1
	xnor	%l7,-0x6c3,%l1
	addc	%l4,0x719,%l5
	retl
	subc	%l2,0xa70,%l4
p0_jmpl_1_ho:
	fadds	%f26,%f28,%f18
	ldstub	[%i2+0x000],%l1		! Mem[00000000211c0000]
	sub	%l2,%l7,%l7
	subc	%l7,%l5,%l5
	jmpl	%g6+8,%g0
	umul	%l2,0xc9d,%l3
p0_call_1_ho:
	sub	%l3,%l3,%l1
	xnor	%l7,-0x6c3,%l1
	addc	%l4,0x719,%l5
	retl
	subc	%l2,0xa70,%l4
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	and	%l5,%l1,%l2
	xor	%l4,%l6,%l0
	jmpl	%g6+8,%g0
	std	%l2,[%i5+0x028]		! Mem[0000000010141428]
p0_call_2_le:
	fadds	%f4 ,%f8 ,%f4 
	fcmps	%fcc2,%f11,%f8 
	umul	%l4,%l4,%l4
	retl
	fmuls	%f8 ,%f10,%f8 
p0_jmpl_2_lo:
	and	%l5,%l1,%l2
	xor	%l4,%l6,%l0
	jmpl	%g6+8,%g0
	std	%l2,[%o5+0x028]		! Mem[0000000010141428]
p0_call_2_lo:
	fadds	%f4 ,%f8 ,%f4 
	fcmps	%fcc2,%f11,%f8 
	umul	%l4,%l4,%l4
	retl
	fmuls	%f8 ,%f10,%f8 
p0_jmpl_2_he:
	fmuls	%f16,%f23,%f17
	or	%l1,%l5,%l3
	addc	%l4,0x880,%l2
	mulx	%l2,0x7e8,%l4
	jmpl	%g6+8,%g0
	or	%l0,%l6,%l4
p0_call_2_he:
	xor	%l7,-0xc3e,%l2
	and	%l0,%l3,%l1
	retl
	xnor	%l1,0x424,%l2
p0_jmpl_2_ho:
	fmuls	%f16,%f23,%f17
	or	%l1,%l5,%l3
	addc	%l4,0x880,%l2
	mulx	%l2,0x7e8,%l4
	jmpl	%g6+8,%g0
	or	%l0,%l6,%l4
p0_call_2_ho:
	xor	%l7,-0xc3e,%l2
	and	%l0,%l3,%l1
	retl
	xnor	%l1,0x424,%l2
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	xnor	%l0,0x4ea,%l6
	sub	%l1,%l1,%l5
	jmpl	%g6+8,%g0
	smul	%l0,%l5,%l2
p0_call_3_le:
	xnor	%l3,%l6,%l6
	fsubs	%f14,%f2 ,%f5 
	or	%l4,-0xf3d,%l5
	udivx	%l5,%l0,%l1
	xor	%l2,%l4,%l4
	fadds	%f9 ,%f11,%f4 
	retl
	addc	%l3,%l2,%l5
p0_jmpl_3_lo:
	xnor	%l0,0x4ea,%l6
	sub	%l1,%l1,%l5
	jmpl	%g6+8,%g0
	smul	%l0,%l5,%l2
p0_call_3_lo:
	xnor	%l3,%l6,%l6
	fsubs	%f14,%f2 ,%f5 
	or	%l4,-0xf3d,%l5
	udivx	%l5,%l0,%l1
	xor	%l2,%l4,%l4
	fadds	%f9 ,%f11,%f4 
	retl
	addc	%l3,%l2,%l5
p0_jmpl_3_he:
	and	%l7,%l5,%l4
	mulx	%l3,%l1,%l2
	fdivs	%f19,%f22,%f24
	fdivs	%f22,%f26,%f26
	sub	%l6,-0xf66,%l4
	jmpl	%g6+8,%g0
	xor	%l3,%l0,%l7
p0_call_3_he:
	mulx	%l2,%l4,%l2
	fmuls	%f26,%f25,%f25
	fsqrts	%f22,%f20
	ldsh	[%i1+0x024],%l5		! Mem[0000000010041424]
	retl
	umul	%l5,%l1,%l0
p0_jmpl_3_ho:
	and	%l7,%l5,%l4
	mulx	%l3,%l1,%l2
	fdivs	%f19,%f22,%f24
	fdivs	%f22,%f26,%f26
	sub	%l6,-0xf66,%l4
	jmpl	%g6+8,%g0
	xor	%l3,%l0,%l7
p0_call_3_ho:
	mulx	%l2,%l4,%l2
	fmuls	%f26,%f25,%f25
	fsqrts	%f22,%f20
	ldsh	[%o1+0x024],%l5		! Mem[0000000010041424]
	retl
	umul	%l5,%l1,%l0
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
	.word	0x4927f642,0x4c7c5536		! Init value for %l0
	.word	0x2d6b213e,0x4775f9fb		! Init value for %l1
	.word	0x734e1fba,0x93b38c5a		! Init value for %l2
	.word	0xd56aa3cc,0x96b3ebd2		! Init value for %l3
	.word	0x17d9d00e,0x8fb7db1f		! Init value for %l4
	.word	0x6d6e8968,0xf04f6e1f		! Init value for %l5
	.word	0x43e4e0e0,0xaf28d251		! Init value for %l6
	.word	0xd421ec19,0xf85517ec		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xe4177f3f,0x838536a2		! Init value for %f0 
	.word	0x6fab807d,0xc6b962bf		! Init value for %f2 
	.word	0x0c705a4b,0x1c70bfc7		! Init value for %f4 
	.word	0xb536917a,0xa67862fd		! Init value for %f6 
	.word	0xe60e76e4,0x86539cf3		! Init value for %f8 
	.word	0x970eab3c,0xb0156902		! Init value for %f10
	.word	0x9dfb2b7a,0xada8585e		! Init value for %f12
	.word	0x7b685ebe,0x65eb6ba0		! Init value for %f14
	.word	0xcfff8fdd,0x0c7262e4		! Init value for %f16
	.word	0xef976459,0xe3b62637		! Init value for %f18
	.word	0x9f6c3279,0xb473827d		! Init value for %f20
	.word	0x3a4ab61d,0xb0ede7b7		! Init value for %f22
	.word	0x6de9520c,0xba4da1cf		! Init value for %f24
	.word	0xc7358fbb,0x3cbfd576		! Init value for %f26
	.word	0x5147f3fe,0x90006e8d		! Init value for %f28
	.word	0x02ac47ba,0xa0ab81db		! Init value for %f30
	.word	0xc479c131,0x035ea6f1		! Init value for %f32
	.word	0x997a20e2,0x0b3856ee		! Init value for %f34
	.word	0x5a55d1a6,0x9a849c8e		! Init value for %f36
	.word	0xaaab38e5,0x31f822e5		! Init value for %f38
	.word	0x8d954c90,0xcce5153a		! Init value for %f40
	.word	0x1c7bcbe6,0x72a140e1		! Init value for %f42
	.word	0xd95678e5,0x757d4881		! Init value for %f44
	.word	0x9cc4d1dd,0x07818736		! Init value for %f46
	.word	0x3e0029db,0xfa2bd418
	.word	0xa0c2ee8f,0xdb286a98
	.word	0xa0293031,0x269373d9
	.word	0xc1c565ec,0x0a098e28
	.word	0x49ca6bd3,0xb6e2f308
	.word	0x2ba2bf92,0x810d3fbd
	.word	0xa4207238,0x09e52677
	.word	0x5a5cdfdb,0xbf309c43
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
	.word	0x00000000,0x1ded3d00
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000b5
	.word	0x00000000,0x00000059
	.word	0x00000000,0x00000000
p0_expected_fp_regs:
	.word	0x00c38b2e,0x00000000
	.word	0x00000000,0x5109219c
	.word	0x000000ff,0x00000000
	.word	0x2f86e420,0x9d009055
	.word	0x00000080,0x2e8bc3c5
	.word	0x00000000,0xffffff7f
	.word	0x5f764ec0,0x22fdb5c4
	.word	0x88e53d7b,0x0cfd48bb
	.word	0x000000ff,0x00000000
	.word	0xffffffff,0x00000000
	.word	0xff000000,0x00000000
	.word	0xee1c5900,0x000000ff
	.word	0xffafffff,0x6ad67029
	.word	0xab88e890,0x000000ff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0xff000000
	.word	0x0000001d,0x00000c00		! %fsr = 0000001d00000c00
p0_local0_expect:
	.word	0x000000ff,0x000000ff
	.word	0x00000000,0x5109219c
	.word	0x003ded1d,0xff000000
	.word	0x00ff0000,0x7f3c76ff
	.word	0x0000ff00,0x6cb69670
	.word	0x000000ff,0x000000ff
	.word	0x000000ff,0x00000000
	.word	0xb9c22738,0x000000e3
p0_local0_sec_expect:
	.word	0xffafffff,0xff000000
	.word	0x00000000,0xff000000
	.word	0xff000000,0xffffffff
	.word	0xdec25738,0x65744a75
	.word	0xe09cba41,0x2302b620
	.word	0x5341aa5a,0x6f081479
	.word	0xdf677cf8,0x1ded3dae
	.word	0x5eebca58,0xa7f9e1a2
p0_local1_expect:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00ff0000,0xff000000
	.word	0xab88e890,0x000000ff
	.word	0x00000000,0x00000000
	.word	0xe288fd62,0x830ac5dc
	.word	0xca36fb6b,0x22fdb5c4
	.word	0x00590000,0xff26b6e3
p0_local1_sec_expect:
	.word	0xff0000e3,0xffffffff
	.word	0xff000000,0x007f00ff
	.word	0xff007f00,0x735700ff
	.word	0x00000000,0x000000c5
	.word	0x00007379,0xb0ede7ff
	.word	0xe09cba41,0x2302b620
	.word	0x000000ff,0xffffffff
	.word	0x9c210951,0x2c96ffff
p0_local2_expect:
	.word	0xff000000,0xffffffff
	.word	0x000000ff,0x0000ff00
	.word	0xffff0000,0x000000ff
	.word	0xe5592105,0xbb7b3782
	.word	0xffbb0000,0x0000af0a
	.word	0x0000ff00,0x6cb69670
	.word	0x00000056,0xb6a6bb80
	.word	0x154b1ac0,0x5109219c
p0_local2_sec_expect:
	.word	0xff760000,0x00000000
	.word	0xffb682e2,0xff000000
	.word	0x00000000,0xe30000ff
	.word	0xff450ac9,0x00000000
	.word	0x2970d66a,0x79a27f14
	.word	0x5341aa5a,0x6f081479
	.word	0xdf677cf8,0x1ded3dae
	.word	0x5eebca58,0xa7f9e1a2
p0_local3_expect:
	.word	0x0000962c,0x2e8bc3c5
	.word	0x9c210951,0x10b73dc2
	.word	0x000000ff,0x00000000
	.word	0xff000000,0x00591cee
	.word	0x2970d66a,0xffffafff
	.word	0xff000000,0x90e888ab
	.word	0xdf677cf8,0x1ded3dae
	.word	0x5eebca58,0xa7f9e1a2
p0_local3_sec_expect:
	.word	0xc5000000,0x00000000
	.word	0xffffffff,0x00000000
	.word	0x00000000,0x00000000
	.word	0x754a7465,0x3857c2de
	.word	0x147fa279,0x6ad67029
	.word	0x000000ff,0x00000000
	.word	0xae3ded1d,0xf87c67df
	.word	0xa2e1f9a7,0x58caeb5e
p0_local4_expect:
	.word	0x00c38b2e,0x00000000
	.word	0x00000000,0x5109219c
	.word	0x000000ff,0x00000000
	.word	0x2f86e420,0x9d009055
	.word	0x00000080,0x2e8bc3c5
	.word	0x00000000,0xffffff7f
	.word	0x5f764ec0,0x22fdffc4
	.word	0x88e53d7b,0x0cfd48bb
p0_local4_sec_expect:
	.word	0x000000ff,0x00000000
	.word	0xff000000,0x00000000
	.word	0xe30000ff,0x00000000
	.word	0x2f86e420,0x9d009055
	.word	0x00000080,0x2e8bc3c5
	.word	0x00000000,0xffffff7f
	.word	0x74591cee,0xc3aab4bb
	.word	0x88e53d7b,0x0cfd48bb
p0_local5_expect:
	.word	0xff000000,0x86000000
	.word	0x003ded1d,0x7b3de500
	.word	0x00007f00,0x735700ff
	.word	0x00000000,0x000000c5
	.word	0x00007379,0xb0ede7ff
	.word	0xe09cba41,0x2302b620
	.word	0xbbb4aac3,0xffffffff
	.word	0xbb48fd0c,0x49000000
p0_local5_sec_expect:
	.word	0x2c960000,0x00000000
	.word	0xff000000,0xbbe96d59
	.word	0x00000000,0x00000000
	.word	0x42f8eae1,0xf2122ff3
	.word	0x14fa2158,0xb7e7edb0
	.word	0x8f336739,0x63f36313
	.word	0x1e4a61c1,0x2345b6c4
	.word	0xcce0b6b1,0xb4b4214e
p0_local6_expect:
	.word	0x000000e3,0x000000ff
	.word	0xff000000,0x00000000
	.word	0x000073b3,0xc3aab4bb
	.word	0x2f86e420,0x9d009055
	.word	0x00000080,0x2e8bc3c5
	.word	0xf87c67df,0xffffff7f
	.word	0x00000000,0xe30000ff
	.word	0xc23db710,0x79a27f00
p0_local6_sec_expect:
	.word	0x90e888ab,0xbbb4aac3
	.word	0x465d9534,0xf87c67df
	.word	0xffffffff,0x74763c7f
	.word	0x2f86e420,0x9d009055
	.word	0xff26b6e3,0x00000000
	.word	0xf6000000,0xb7ffffff
	.word	0xff0000e3,0x00000000
	.word	0x565700ff,0xbbe96d59
share0_expect:
	.word	0x59002cc7,0xa4f564cc
	.word	0xeb6dba9c,0xf694f135
	.word	0xee440d72,0xa9ee03ae
	.word	0x22a4fcfc,0xa778573e
	.word	0x26ad5ca1,0x915172b1
	.word	0x11a48cdc,0x1568d15a
	.word	0x16beacb0,0xe952d5f2
	.word	0x989a6431,0x80fc5f9a
share1_expect:
	.word	0xffffd75b,0xfa335562
	.word	0x077165ea,0xcf96e634
	.word	0x92c9ba03,0xe92579a7
	.word	0xc46f1f89,0x5fd82f7b
	.word	0x40b8cd6b,0x3450ed39
	.word	0x7149392b,0xd12b330d
	.word	0xa741ed87,0x44104111
	.word	0x8c537d95,0x01934e11
	.word	0x0059a3d2,0x29e74947
	.word	0x698677ab,0x4e5e5dd8
	.word	0x1bd6019d,0x2c96ff2e
	.word	0x734dbea5,0xbfbb6d70
	.word	0xe0b38896,0x6488d6d7
	.word	0x6261c85d,0xb1ef1e1e
	.word	0xa1ac4224,0x9e993b5d
	.word	0x383cc29b,0x8424a5e9
share2_expect:
	.word	0x00007241,0x9d2eae6a
	.word	0x22b8760b,0x7163b93b
	.word	0x16b66ac2,0xf7f4adee
	.word	0x708f0a33,0x6ca4d777
	.word	0x02e50727,0xa7990c0b
	.word	0xb5dd2693,0xe0acd169
	.word	0x8ad94319,0x5f283ed0
	.word	0x8de24bd4,0x6d82e462
share3_expect:
	.word	0x3fccbf49,0xadf6c523
	.word	0x4397a450,0x685adafc
	.word	0x24850a48,0xd5f841fa
	.word	0xbee7f048,0xa41dfe64
	.word	0xb82e13c0,0xb24e0154
	.word	0x1763b819,0x54bbf2ea
	.word	0x180b88e4,0x74f02b67
	.word	0x79385653,0x317769ef
	.word	0x73d10896,0xdba85270
	.word	0xf3e4fff0,0x173465f9
	.word	0x6910c476,0x95a7e473
	.word	0x6563ed64,0x33c868cd
	.word	0xd168e4e8,0x21c86957
	.word	0x74d35ae0,0x2d7df374
	.word	0x5ed8c1fb,0x71c0be3d
	.word	0xf09dab24,0x9b84a06a
	.word	0xeaff341e,0xbeb864a1
	.word	0xcd7e6266,0xfdb9e2a7
	.word	0x8188660d,0xc21756fa
	.word	0xebc7b813,0x2315c1f6
	.word	0xf17ee3ea,0x51b9285c
	.word	0xbefae10f,0xfde456ae
	.word	0xbc34150b,0x6373cd39
	.word	0xd38f9a38,0xe34c25cb
	.word	0x0000265e,0x6839efe6
	.word	0x65b80127,0xf529eae1
	.word	0xfff102c8,0x488820c6
	.word	0xe8ce0924,0x36c45ef6
	.word	0x9aa6fb8b,0x890f9478
	.word	0x38af34a3,0xbe09f8a5
	.word	0xfcbb2532,0x103a947f
	.word	0x2a28bea3,0xf5b40582
	.word	0x3bffd236,0xcab71dc6
	.word	0x2f47e4d5,0xc4168fb2
	.word	0xf3729f24,0xba632959
	.word	0xda149735,0x922c27f6
	.word	0x92e1a2a3,0x1c3b3edb
	.word	0xe3517e14,0x89495ed5
	.word	0x21ebf87f,0x11ddb632
	.word	0x8aa6031e,0x1c413264
	.word	0xffb45a3c,0x832ea852
	.word	0xc288f392,0xc4307b4f
	.word	0xc2f4a77d,0xd533589e
	.word	0xeb167799,0x075d0af3
	.word	0x28fc0442,0x74bc26c2
	.word	0x833949ee,0x86e92d3e
	.word	0x911b198c,0x5b2b8a10
	.word	0x6602d504,0x31c0d3a0
	.word	0xffb2a69f,0x5ad46751
	.word	0xb51b1fd7,0xa7dfcec8
	.word	0x8cec498a,0x46dee766
	.word	0x0c047c3b,0x4fdb867f
	.word	0x68662807,0x806d2a94
	.word	0x2f8634f9,0x992ff024
	.word	0x1f729b22,0xaa6a04b1
	.word	0x72cdbba9,0xc547eb66
	.word	0xffff4083,0x2ab5f959
	.word	0x758ea879,0x48648b0e
	.word	0x7348bd88,0xaa539586
	.word	0xd83dce8e,0x3d6452c0
	.word	0x5a11e226,0x86a15bec
	.word	0x1307c207,0xcc0997a6
	.word	0x44b99764,0x9b6ca4d0
	.word	0xa3937288,0xc75ff975
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
	.word	0xfba62558,0x1305c9ef
	.word	0x00000000,0x00000002
	.word	0x4e367aaf,0xb19bdec2
	.word	0x00000000,0x00000003
	.word	0xd9f1b3d7,0x9a5cc7f3
	.word	0x00000000,0x00000004
	.word	0xa1cd8a18,0x1298fc49
	.word	0x00000000,0x00000005
	.word	0xfafe4faf,0xf231fef7
	.word	0x00000000,0x00000006
	.word	0x46c17a37,0xc072cdb5
	.word	0x00000000,0x00000007
	.word	0x9c88cc7f,0xf5b9c223
	.word	0x00000000,0x00000008
	.word	0x35312420,0x556ccd19
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
	.word	0xc70eed57,0x02116447,0xce288484,0x769f5df8
	.word	0x3c51ef3f,0x8423010e,0xd3110ddb,0x3649d611
	.word	0x064b1039,0xb0491466,0x443048b9,0x71258294
	.word	0xe39959bb,0x4f15a5f1,0x64ea4425,0x0968dd83
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
	.word	0xf0b21f6d,0x3cf2ab7a,0x73450ac9,0x378ebcb2
	.word	0x1f1dfc40,0xbc9dfff4,0x89263027,0xc6f0c4ed
	.word	0x2691738c,0x045782c0,0x3b6aecaa,0xe2ac9731
	.word	0x47b58f70,0x39d2cc57,0x4138c2eb,0xddf5adb2
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
	.word	0x3a1cd926,0xfc7c94ea,0x865bd0df,0x59f94df8
	.word	0x5b0d5c3d,0xb384d5fb,0x2aeb61d1,0xc76395e5
	.word	0x38f8ca5c,0x111980a4,0xbbe96d59,0xac77cded
	.word	0xa1a4d897,0x287a77a0,0x86aa285f,0x52c6a55a
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
	.word	0x0450de7f,0x408fe455,0xdff8e741,0x16be4b3e
	.word	0xb47a8619,0x5f1cf883,0xf6088aa2,0xea6af128
	.word	0x3001e26e,0x06af2205,0x9618c101,0x828e0a91
	.word	0x3bc49137,0xb608739a,0xfe060b24,0x6b8faa3c
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
	.word	0x19bad55a,0xe800c6c2,0x4024f79e,0x42e7da7a
	.word	0x58b8807a,0x82b459a1,0xe5592105,0x77e0cabb
	.word	0x636e4c36,0xce4ec79b,0x87955d53,0x6cb69670
	.word	0xed76e51e,0xb6a6bb80,0x154b1ac0,0x259ce085
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
	.word	0xced7ae4d,0xb5ecac95,0xe5efde09,0xb8900102
	.word	0xab1e018c,0xb8851800,0x4def274e,0xfa51e3c5
	.word	0xeb57677b,0x1a10e39c,0xd4aae56d,0x34fe5778
	.word	0xbd1c9058,0x6455606d,0x4b400235,0x32fae932
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
	.word	0x1914225a,0xb10554ae,0x79854497,0x8e38a587
	.word	0xc0918875,0x9bde67b5,0x0dfeb8c2,0x646a0fe7
	.word	0x3e93679b,0xfaa60a6c,0x54707eb1,0xd2077973
	.word	0x2c7cf65d,0x4940b0a1,0x77d869f3,0x19142c96
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
	.word	0x620188ba,0x05df1bf1,0x61bf5655,0x927837f5
	.word	0x45bcae7f,0x2604eced,0x754a7465,0x3857c2de
	.word	0x147fa279,0x6ad67029,0x7914086f,0x5aaa4153
	.word	0xae3ded1d,0xf87c67df,0xa2e1f9a7,0x58caeb5e
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
	.word	0x69017fba,0x37e67f33,0xa5904d67,0xb9a19d9a
	.word	0xe92098d2,0x42ad2f47,0xb1cc2b7c,0x4927e079
	.word	0xaca1a530,0x5f45a09f,0x4bcd767f,0x6385872b
	.word	0xbb5790c6,0x214d8b0d,0x9a393680,0x91710aaf
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
	.word	0xa807de9a,0x9946ee8a,0xabc2ce4a,0x19628ea7
	.word	0xda00262b,0xabd5f314,0x4f0670f4,0x280b295d
	.word	0x93630170,0xafcd45e3,0xed6e284f,0x8976980c
	.word	0xdc3c2cb9,0x1f9d0f63,0x632747e5,0xe988da14
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
	.word	0xb40f3a94,0xb3e03721,0xe2946142,0xb3542e5b
	.word	0x020e0517,0x7860bbb6,0x5590109d,0x20e4862f
	.word	0xab88e890,0x381bdd3c,0xe09cba41,0x2302b6d6
	.word	0xbbb4aac3,0xee1c5974,0xbb48fd0c,0x7b3de588
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
	.word	0x77ad09c7,0xed683edf,0xfc80b5d3,0xb9c22738
	.word	0x283d5429,0xca9eadf6,0x42f8eae1,0xf2122ff3
	.word	0x14fa2158,0x5265d032,0x8f336739,0x63f36313
	.word	0x1e4a61c1,0x2345b6c4,0xcce0b6b1,0xb4b4214e
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
	.word	0xffbe6af7,0x13992882,0x6ea84ae7,0x0c60d8b4
	.word	0x87d49668,0x5fa65d37,0xd8aa91f0,0xd95c2c9c
	.word	0xabcc1f9a,0x820dbce1,0x23025c56,0xd62e5acf
	.word	0x28bced7c,0x2aa66445,0x8a83b121,0x2896c9e6
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
	.word	0xa32f9f40,0x02281002,0x67068aa3,0xc8659e37
	.word	0x640b0441,0xa913c8f5,0x718c4b19,0x41b47fb9
	.word	0xf638617f,0x1455ddc7,0x2a68174e,0x19bedb0d
	.word	0x71ac8f8a,0xcee09678,0x09b61125,0xdf160e23
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
	.word	0xfe2c2cc7,0xa4f564cc,0xeb6dba9c,0xf694f135
	.word	0xee440d72,0xa9ee03ae,0x22a4fcfc,0xa778573e
	.word	0x26ad5ca1,0x915172b1,0x11a48cdc,0x1568d15a
	.word	0x16beacb0,0xe952d5f2,0x989a6431,0x80fc5f9a
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
	.word	0x635ed75b,0xfa335562,0x077165ea,0xcf96e634
	.word	0x92c9ba03,0xe92579a7,0xc46f1f89,0x5fd82f7b
	.word	0x40b8cd6b,0x3450ed39,0x7149392b,0xd12b330d
	.word	0xa741ed87,0x44104111,0x8c537d95,0x01934e11
	.word	0x210ca3d2,0x29e74947,0x698677ab,0x4e5e5dd8
	.word	0x1bd6019d,0x2c96ff2e,0x734dbea5,0xbfbb6d70
	.word	0xe0b38896,0x6488d6d7,0x6261c85d,0xb1ef1e1e
	.word	0xa1ac4224,0x9e993b5d,0x383cc29b,0x8424a5e9
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
	.word	0xf0197241,0x9d2eae6a,0x22b8760b,0x7163b93b
	.word	0x16b66ac2,0xf7f4adee,0x708f0a33,0x6ca4d777
	.word	0x02e50727,0xa7990c0b,0xb5dd2693,0xe0acd169
	.word	0x8ad94319,0x5f283ed0,0x8de24bd4,0x6d82e462
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
	.word	0x3fccbf49,0xadf6c523,0x4397a450,0x685adafc
	.word	0x24850a48,0xd5f841fa,0xbee7f048,0xa41dfe64
	.word	0xb82e13c0,0xb24e0154,0x1763b819,0x54bbf2ea
	.word	0x180b88e4,0x74f02b67,0x79385653,0x317769ef
	.word	0x34d10896,0xdba85270,0xf3e4fff0,0x173465f9
	.word	0x6910c476,0x95a7e473,0x6563ed64,0x33c868cd
	.word	0xd168e4e8,0x21c86957,0x74d35ae0,0x2d7df374
	.word	0x5ed8c1fb,0x71c0be3d,0xf09dab24,0x9b84a06a
	.word	0x9ac6341e,0xbeb864a1,0xcd7e6266,0xfdb9e2a7
	.word	0x8188660d,0xc21756fa,0xebc7b813,0x2315c1f6
	.word	0xf17ee3ea,0x51b9285c,0xbefae10f,0xfde456ae
	.word	0xbc34150b,0x6373cd39,0xd38f9a38,0xe34c25cb
	.word	0xd723265e,0x6839efe6,0x65b80127,0xf529eae1
	.word	0xfff102c8,0x488820c6,0xe8ce0924,0x36c45ef6
	.word	0x9aa6fb8b,0x890f9478,0x38af34a3,0xbe09f8a5
	.word	0xfcbb2532,0x103a947f,0x2a28bea3,0xf5b40582
	.word	0x3b19d236,0xcab71dc6,0x2f47e4d5,0xc4168fb2
	.word	0xf3729f24,0xba632959,0xda149735,0x922c27f6
	.word	0x92e1a2a3,0x1c3b3edb,0xe3517e14,0x89495ed5
	.word	0x21ebf87f,0x11ddb632,0x8aa6031e,0x1c413264
	.word	0x84b45a3c,0x832ea852,0xc288f392,0xc4307b4f
	.word	0xc2f4a77d,0xd533589e,0xeb167799,0x075d0af3
	.word	0x28fc0442,0x74bc26c2,0x833949ee,0x86e92d3e
	.word	0x911b198c,0x5b2b8a10,0x6602d504,0x31c0d3a0
	.word	0x29bea69f,0x5ad46751,0xb51b1fd7,0xa7dfcec8
	.word	0x8cec498a,0x46dee766,0x0c047c3b,0x4fdb867f
	.word	0x68662807,0x806d2a94,0x2f8634f9,0x992ff024
	.word	0x1f729b22,0xaa6a04b1,0x72cdbba9,0xc547eb66
	.word	0x338b4083,0x2ab5f959,0x758ea879,0x48648b0e
	.word	0x7348bd88,0xaa539586,0xd83dce8e,0x3d6452c0
	.word	0x5a11e226,0x86a15bec,0x1307c207,0xcc0997a6
	.word	0x44b99764,0x9b6ca4d0,0xa3937288,0xc75ff975
share3_end:
