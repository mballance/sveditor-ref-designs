/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_400_0.s
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
!	Seed = 327141848
!	Riesling can be on
!	1 Thread, 400 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_400_0.s created on Mar 27, 2009 (14:18:48)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_400_0 -p 1 -l 400

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
!	%f0  = 5e95f273 3e9932b4 885d0e5f f971111b
!	%f4  = e2cbd3af 54e8e9d9 17c59600 695517ff
!	%f8  = 454ed156 8b956c61 9daf7bb8 f0cebf02
!	%f12 = c46ab030 e12ec29a a96627f8 e9f41e28
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = ab2bb08d 34c1707e a2a038c5 d5d86efb
!	%f20 = 1f37c707 ff7667f7 dc5abdef 7e804d61
!	%f24 = d42deb44 2b030f63 fc8eaa3d bb6a2640
!	%f28 = e8597646 4e3731d1 35ff1570 010bf2cb
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = fc2e46d7 81f4bde9 71ac22e2 3548e2d0
!	%f36 = f8aad1b8 9ab8f230 004ae93d 655e7b0d
!	%f40 = f237c7f4 0f0696fe ca879df6 f5650c3f
!	%f44 = b15ce6f9 aea6805b 4df27ccb 7048f766
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x848443670000003a,%g7,%g1 ! GSR scale =  7, align = 2
	wr	%g1,%g0,%gsr		! GSR = 848443670000003a
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	%l5 = 7dbcde7014743fbd, Mem[0000000010141408] = 13017226
	stha	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 13013fbd
!	Mem[0000000030181408] = e079aee1, %l7 = b40810fa66e57a8c
	ldstuba	[%i6+%o4]0x81,%l7	! %l7 = 000000e0000000ff
!	Mem[000000001004142c] = 5316b51c, %f26 = fc8eaa3d
	ld	[%i1+0x02c],%f26	! %f26 = 5316b51c
!	Mem[00000000100c1400] = 1174e847, %l1 = f83a8ea6272b431d
	lduwa	[%i3+%g0]0x88,%l1	! %l1 = 000000001174e847
!	Mem[0000000010041408] = a52c67f5, %l7 = 00000000000000e0
	lduha	[%i1+%o4]0x80,%l7	! %l7 = 000000000000a52c
!	%f27 = bb6a2640, Mem[00000000300c1408] = af82ba76
	sta	%f27,[%i3+%o4]0x89	! Mem[00000000300c1408] = bb6a2640
!	Mem[0000000010041408] = f5672ca5, %l6 = 3040a8d4c6b785bf
	swapa	[%i1+%o4]0x88,%l6	! %l6 = 00000000f5672ca5
!	%l3 = b0b73a40542b2558, Mem[00000000300c1408] = bb6a2640
	stba	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = bb6a2658
!	Mem[0000000010101410] = 946299bcc608cd2d, %f16 = ab2bb08d 34c1707e
	ldda	[%i4+%o5]0x80,%f16	! %f16 = 946299bc c608cd2d
!	Starting 10 instruction Store Burst
!	%f28 = e8597646, Mem[0000000010141400] = 004b4a74
	sta	%f28,[%i5+%g0]0x80	! Mem[0000000010141400] = e8597646

p0_label_2:
!	%l0 = 519065ae56cce318, immed = fffffcb3, %y  = 00000000
	umul	%l0,-0x34d,%l1		! %l1 = 56cce1f97db669c8, %y = 56cce1f9
!	Mem[0000000010101410] = bc996294, %l4 = 5b5ca8b264ef4f79
	swapa	[%i4+%o5]0x88,%l4	! %l4 = 00000000bc996294
!	%l7 = 000000000000a52c, Mem[0000000010041400] = 373756fb
	stha	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = a52c56fb
!	%f8  = 454ed156 8b956c61, Mem[0000000010041400] = fb562ca5 8eb8a6c2
	stda	%f8 ,[%i1+%g0]0x88	! Mem[0000000010041400] = 454ed156 8b956c61
!	Mem[0000000010001438] = c529f13d3fb695ea, %l4 = 00000000bc996294, %l0 = 519065ae56cce318
	add	%i0,0x38,%g1
	casxa	[%g1]0x80,%l4,%l0	! %l0 = c529f13d3fb695ea
!	%l0 = c529f13d3fb695ea, Mem[00000000100c1400] = 47e87411
	stwa	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 3fb695ea
!	Mem[0000000030101410] = 74a20de9, %l2 = 500c4a9296eacefc
	swapa	[%i4+%o5]0x89,%l2	! %l2 = 0000000074a20de9
!	%l6 = 00000000f5672ca5, %l7 = 000000000000a52c, %l6  = 00000000f5672ca5
	mulx	%l6,%l7,%l6		! %l6 = 00009e55ad82055c
!	%f4  = e2cbd3af, %f25 = 2b030f63
	fcmpes	%fcc2,%f4 ,%f25		! %fcc2 = 1
!	Starting 10 instruction Load Burst
!	%l2 = 0000000074a20de9, %l1 = 56cce1f97db669c8, %y  = 56cce1f9
	udiv	%l2,%l1,%l3		! %l3 = 00000000b0c26bf5
	mov	%l0,%y			! %y = 3fb695ea

p0_label_3:
!	Mem[00000000300c1408] = 58266abb ceb866c9, %l2 = 74a20de9, %l3 = b0c26bf5
	ldda	[%i3+%o4]0x81,%l2	! %l2 = 0000000058266abb 00000000ceb866c9
!	Mem[0000000010101400] = a1ae909b, %l0 = c529f13d3fb695ea
	ldsba	[%i4+%g0]0x88,%l0	! %l0 = ffffffffffffff9b
!	Mem[0000000010081410] = 1dcf26625fdb32f2, %f4  = e2cbd3af 54e8e9d9
	ldda	[%i2+%o5]0x88,%f4 	! %f4  = 1dcf2662 5fdb32f2
!	Mem[0000000010101410] = 794fef64 c608cd2d, %l2 = 58266abb, %l3 = ceb866c9
	ldda	[%i4+0x010]%asi,%l2	! %l2 = 00000000794fef64 00000000c608cd2d
!	Mem[0000000030101410] = fcceea966b3bbdfd, %l1 = 56cce1f97db669c8
	ldxa	[%i4+%o5]0x81,%l1	! %l1 = fcceea966b3bbdfd
!	Mem[0000000010041400] = 616c958b, %l5 = 7dbcde7014743fbd
	ldsh	[%i1+%g0],%l5		! %l5 = 000000000000616c
!	Mem[0000000010101400] = ac928a9da1ae909b, %f28 = e8597646 4e3731d1
	ldda	[%i4+%g0]0x88,%f28	! %f28 = ac928a9d a1ae909b
!	Mem[0000000010001408] = 3b9ffb0774dc7f7e, %f22 = dc5abdef 7e804d61
	ldda	[%i0+%o4]0x80,%f22	! %f22 = 3b9ffb07 74dc7f7e
!	Mem[0000000010101410] = 794fef64c608cd2d, %f6  = 17c59600 695517ff
	ldda	[%i4+%o5]0x80,%f6 	! %f6  = 794fef64 c608cd2d
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = f232db5f, %l5 = 000000000000616c
	swapa	[%i2+%o5]0x80,%l5	! %l5 = 00000000f232db5f

p0_label_4:
!	%l6 = 00009e55ad82055c, Mem[0000000010001408] = 7e7fdc7407fb9f3b
	stxa	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 00009e55ad82055c
!	%f22 = 3b9ffb07, Mem[0000000010141410] = 445c269b
	st	%f22,[%i5+%o5]		! Mem[0000000010141410] = 3b9ffb07
!	%l1 = fcceea966b3bbdfd, Mem[0000000010141400] = 467659e8
	stha	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 4676bdfd
!	%l0 = ffffffffffffff9b, Mem[0000000010001400] = 1c6c81a8
	stba	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 9b6c81a8
!	%f13 = e12ec29a, Mem[0000000010101410] = 794fef64
	sta	%f13,[%i4+%o5]0x80	! Mem[0000000010101410] = e12ec29a
!	Mem[00000000100c1430] = 8452c41f7b85c036, %l6 = 00009e55ad82055c, %l4 = 00000000bc996294
	add	%i3,0x30,%g1
	casxa	[%g1]0x80,%l6,%l4	! %l4 = 8452c41f7b85c036
!	%l2 = 00000000794fef64, Mem[0000000010141410] = 07fb9f3b
	stwa	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = 794fef64
!	%f14 = a96627f8 e9f41e28, Mem[0000000010041400] = 8b956c61 454ed156
	stda	%f14,[%i1+%g0]0x88	! Mem[0000000010041400] = a96627f8 e9f41e28
!	Mem[0000000030081410] = a808955c, %l5 = 00000000f232db5f
	swapa	[%i2+%o5]0x89,%l5	! %l5 = 00000000a808955c
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 96eacefc, %l3 = 00000000c608cd2d
	ldsha	[%i4+%o5]0x89,%l3	! %l3 = ffffffffffffcefc

p0_label_5:
!	Mem[0000000010181410] = 0687a9cb, %l1 = fcceea966b3bbdfd
	ldsha	[%i6+%o5]0x88,%l1	! %l1 = ffffffffffffa9cb
!	Mem[0000000010101410] = 9ac22ee1, %l4 = 8452c41f7b85c036
	lduba	[%i4+%o5]0x88,%l4	! %l4 = 00000000000000e1
!	Mem[0000000010081430] = bbb86424 6879e6cd, %l2 = 794fef64, %l3 = ffffcefc
	ldd	[%i2+0x030],%l2		! %l2 = 00000000bbb86424 000000006879e6cd
!	Mem[0000000010081408] = ca024271, %l4 = 00000000000000e1
	lduha	[%i2+%o4]0x88,%l4	! %l4 = 0000000000004271
!	Mem[00000000300c1408] = 58266abb ceb866c9, %l4 = 00004271, %l5 = a808955c
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 0000000058266abb 00000000ceb866c9
!	Mem[00000000201c0000] = 4903f578, %l4 = 0000000058266abb
	ldub	[%o0+%g0],%l4		! %l4 = 0000000000000049
!	Mem[0000000030081400] = 4b03bf43, %l1 = ffffffffffffa9cb
	ldsba	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000043
!	Mem[0000000010001410] = 2aab8c3fc66d9f69, %f8  = 454ed156 8b956c61
	ldda	[%i0+%o5]0x80,%f8 	! %f8  = 2aab8c3f c66d9f69
!	Mem[00000000100c1410] = 80d3deac, %f7  = c608cd2d
	lda	[%i3+%o5]0x80,%f7 	! %f7 = 80d3deac
!	Starting 10 instruction Store Burst
!	%f26 = 5316b51c, %f28 = ac928a9d
	fcmpes	%fcc1,%f26,%f28		! %fcc1 = 2

p0_label_6:
!	Mem[0000000030101410] = fcceea96, %f19 = d5d86efb
	lda	[%i4+%o5]0x81,%f19	! %f19 = fcceea96
!	%f12 = c46ab030 e12ec29a, %l5 = 00000000ceb866c9
!	Mem[0000000030101438] = 6283dbe267314095
	add	%i4,0x038,%g1
	stda	%f12,[%g1+%l5]ASI_PST16_S ! Mem[0000000030101438] = c46adbe26731c29a
!	%l2 = 00000000bbb86424, Mem[0000000030181408] = ff79aee13c351b95
	stxa	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000bbb86424
!	%l2 = 00000000bbb86424, Mem[0000000030101408] = f7db383d
	stha	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 6424383d
!	Mem[0000000010081410] = 0000616c, %l2 = 00000000bbb86424
	ldstuba	[%i2+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%l6 = 00009e55ad82055c, Mem[0000000030181408] = 00000000
	stwa	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = ad82055c
!	%f22 = 3b9ffb07 74dc7f7e, Mem[0000000030041400] = c780e672 f8b24e60
	stda	%f22,[%i1+%g0]0x89	! Mem[0000000030041400] = 3b9ffb07 74dc7f7e
!	%l6 = 00009e55ad82055c, immd = 0000000000000c9e, %l2 = 0000000000000000
	sdivx	%l6,0xc9e,%l2		! %l2 = 0000000c8c938997
!	%l4 = 00000049, %l5 = ceb866c9, Mem[0000000030041408] = dfc8b2e4 33b13b7d
	stda	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000049 ceb866c9
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 281ef4e9, %l1 = 0000000000000043
	lduwa	[%i1+%g0]0x80,%l1	! %l1 = 00000000281ef4e9

p0_label_7:
!	Mem[00000000100c1400] = 9ba20037ea95b63f, %l4 = 0000000000000049
	ldxa	[%i3+%g0]0x88,%l4	! %l4 = 9ba20037ea95b63f
!	Mem[00000000300c1408] = 58266abb, %f3  = f971111b
	lda	[%i3+%o4]0x81,%f3 	! %f3 = 58266abb
!	Mem[0000000010141408] = 13013fbd, %l3 = 000000006879e6cd
	ldsba	[%i5+%o4]0x88,%l3	! %l3 = ffffffffffffffbd
!	Mem[0000000030181400] = 6959dce93393ce62, %f26 = 5316b51c bb6a2640
	ldda	[%i6+%g0]0x89,%f26	! %f26 = 6959dce9 3393ce62
!	Mem[0000000021800080] = 5f882fea, %l0 = ffffffffffffff9b
	ldub	[%o3+0x081],%l0		! %l0 = 0000000000000088
!	Mem[00000000300c1408] = bb6a2658, %l7 = 000000000000a52c
	lduwa	[%i3+%o4]0x89,%l7	! %l7 = 00000000bb6a2658
!	Mem[0000000030101400] = 492b3608 2c66de34, %l2 = 8c938997, %l3 = ffffffbd
	ldda	[%i4+%g0]0x89,%l2	! %l2 = 000000002c66de34 00000000492b3608
!	Mem[0000000030101408] = 6424383d, %l3 = 00000000492b3608
	lduwa	[%i4+%o4]0x81,%l3	! %l3 = 000000006424383d
!	Mem[0000000030081408] = cec696b6, %l1 = 00000000281ef4e9
	ldswa	[%i2+%o4]0x89,%l1	! %l1 = ffffffffcec696b6
!	Starting 10 instruction Store Burst
!	%l2 = 000000002c66de34, Mem[0000000030041410] = 9a7c2880
	stba	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 9a7c2834

p0_label_8:
!	%l3 = 000000006424383d, imm = 00000000000006f6, %l3 = 000000006424383d
	andn	%l3,0x6f6,%l3		! %l3 = 0000000064243809
!	%l3 = 0000000064243809, %l7 = 00000000bb6a2658, %l7 = 00000000bb6a2658
	xnor	%l3,%l7,%l7		! %l7 = ffffffff20b1e1ae
!	Mem[00000000211c0001] = 53c4019f, %l5 = 00000000ceb866c9
	ldstub	[%o2+0x001],%l5		! %l5 = 000000c4000000ff
!	%l2 = 000000002c66de34, Mem[00000000211c0000] = 53ff019f, %asi = 80
	stba	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 34ff019f
!	%f22 = 3b9ffb07 74dc7f7e, %l2 = 000000002c66de34
!	Mem[00000000300c1430] = 99810731999001e8
	add	%i3,0x030,%g1
	stda	%f22,[%g1+%l2]ASI_PST32_S ! Mem[00000000300c1430] = 99810731999001e8
!	%l0 = 0000000000000088, Mem[0000000030081410] = f9c56b8ff232db5f
	stxa	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000000000000088
!	%l4 = 9ba20037ea95b63f, Mem[00000000218001c0] = adae5345, %asi = 80
	stba	%l4,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 3fae5345
!	%f10 = 9daf7bb8 f0cebf02, Mem[0000000030181408] = 5c0582ad bbb86424
	stda	%f10,[%i6+%o4]0x81	! Mem[0000000030181408] = 9daf7bb8 f0cebf02
!	Mem[0000000010141400] = fdbd7646, %l1 = ffffffffcec696b6
	swapa	[%i5+%g0]0x80,%l1	! %l1 = 00000000fdbd7646
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = cba98706, %f25 = 2b030f63
	lda	[%i6+0x010]%asi,%f25	! %f25 = cba98706

p0_label_9:
!	Mem[0000000010001408] = 5c0582ad 559e0000, %l2 = 2c66de34, %l3 = 64243809
	ldd	[%i0+%o4],%l2		! %l2 = 000000005c0582ad 00000000559e0000
!	Mem[0000000030041410] = 989c55a99a7c2834, %l7 = ffffffff20b1e1ae
	ldxa	[%i1+%o5]0x89,%l7	! %l7 = 989c55a99a7c2834
!	%l0 = 0000000000000088, Mem[0000000010141408] = bd3f0113, %asi = 80
	stha	%l0,[%i5+0x008]%asi	! Mem[0000000010141408] = 00880113
!	Mem[00000000300c1408] = 58266abb ceb866c9, %l6 = ad82055c, %l7 = 9a7c2834
	ldda	[%i3+%o4]0x81,%l6	! %l6 = 0000000058266abb 00000000ceb866c9
!	Mem[0000000030181408] = 9daf7bb8, %l6 = 0000000058266abb
	lduba	[%i6+%o4]0x81,%l6	! %l6 = 000000000000009d
!	Mem[0000000010101420] = eb9193eb, %f23 = 74dc7f7e
	ld	[%i4+0x020],%f23	! %f23 = eb9193eb
!	Mem[0000000010001410] = 2aab8c3f, %l0 = 0000000000000088
	lduha	[%i0+%o5]0x80,%l0	! %l0 = 0000000000002aab
!	Mem[00000000100c142c] = aa8582f7, %l0 = 0000000000002aab
	ldub	[%i3+0x02f],%l0		! %l0 = 00000000000000f7
!	Mem[0000000010081408] = 714202ca, %l4 = 9ba20037ea95b63f
	ldswa	[%i2+0x008]%asi,%l4	! %l4 = 00000000714202ca
!	Starting 10 instruction Store Burst
!	%l4 = 714202ca, %l5 = 000000c4, Mem[0000000010181410] = 0687a9cb d217539b
	stda	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 714202ca 000000c4

p0_label_10:
!	%l3 = 00000000559e0000, Mem[0000000021800081] = 5f882fea, %asi = 80
	stba	%l3,[%o3+0x081]%asi	! Mem[0000000021800080] = 5f002fea
!	%f30 = 35ff1570 010bf2cb, %l2 = 000000005c0582ad
!	Mem[0000000030101438] = c46adbe26731c29a
	add	%i4,0x038,%g1
	stda	%f30,[%g1+%l2]ASI_PST32_S ! Mem[0000000030101438] = c46adbe2010bf2cb
!	%l7 = 00000000ceb866c9, Mem[0000000010141411] = 64ef4f79, %asi = 80
	stba	%l7,[%i5+0x011]%asi	! Mem[0000000010141410] = 64c94f79
!	%l0 = 00000000000000f7, Mem[0000000030041400] = 74dc7f7e
	stwa	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000f7
!	%f18 = a2a038c5 fcceea96, Mem[0000000030081408] = cec696b6 dac94b3d
	stda	%f18,[%i2+%o4]0x89	! Mem[0000000030081408] = a2a038c5 fcceea96
!	Mem[00000000300c1400] = 68cf0edb, %l6 = 000000000000009d
	ldstuba	[%i3+%g0]0x81,%l6	! %l6 = 00000068000000ff
!	%f10 = 9daf7bb8, %f20 = 1f37c707, %f22 = 3b9ffb07
	fmuls	%f10,%f20,%f22		! %l0 = 0000000000000119, Unfinished, %fsr = 0600000000
!	%l6 = 0000000000000068, Mem[00000000100c1409] = 033fd1b3
	stb	%l6,[%i3+0x009]		! Mem[00000000100c1408] = 0368d1b3
!	Mem[00000000100c1410] = acded380, %l2 = 000000005c0582ad
	swapa	[%i3+%o5]0x88,%l2	! %l2 = 00000000acded380
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ffcf0edb, %l4 = 00000000714202ca
	lduwa	[%i3+%g0]0x81,%l4	! %l4 = 00000000ffcf0edb

p0_label_11:
!	Mem[00000000211c0000] = 34ff019f, %l1 = 00000000fdbd7646
	ldsba	[%o2+0x000]%asi,%l1	! %l1 = 0000000000000034
!	Mem[000000001010140c] = 1734b30b, %f7  = 80d3deac
	ld	[%i4+0x00c],%f7 	! %f7 = 1734b30b
!	Mem[0000000030101408] = 3d382464, %f24 = d42deb44
	lda	[%i4+%o4]0x89,%f24	! %f24 = 3d382464
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010001400] = 9b6c81a8 e0bdb078 5c0582ad 559e0000
!	Mem[0000000010001410] = 2aab8c3f c66d9f69 d2a73ecb 750adf40
!	Mem[0000000010001420] = 6eabfb8d 9f4130bc e17b1955 3bd79577
!	Mem[0000000010001430] = 7e94da2b b38c5ac9 c529f13d 3fb695ea
	ldda	[%i0]ASI_BLK_AIUP,%f16	! Block Load from 0000000010001400
!	%l0 = 0000000000000119, %l0 = 0000000000000119, %l0 = 0000000000000119
	udivx	%l0,%l0,%l0		! %l0 = 0000000000000001
!	%l7 = 00000000ceb866c9, %l0 = 0000000000000001, %l5 = 00000000000000c4
	udivx	%l7,%l0,%l5		! %l5 = 00000000ceb866c9
!	Mem[0000000010101410] = 2dcd08c69ac22ee1, %l6 = 0000000000000068
	ldxa	[%i4+%o5]0x88,%l6	! %l6 = 2dcd08c69ac22ee1
!	Mem[0000000030001408] = a6f4685e, %l2 = 00000000acded380
	ldsha	[%i0+%o4]0x81,%l2	! %l2 = ffffffffffffa6f4
!	Mem[0000000010101400] = ac928a9da1ae909b, %l7 = 00000000ceb866c9
	ldxa	[%i4+%g0]0x88,%l7	! %l7 = ac928a9da1ae909b
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 399b0559, %l5 = 00000000ceb866c9
	swapa	[%i5+%g0]0x81,%l5	! %l5 = 00000000399b0559

p0_label_12:
!	Mem[0000000010041400] = e9f41e28, %l7 = ac928a9da1ae909b
	ldstuba	[%i1+%g0]0x88,%l7	! %l7 = 00000028000000ff
!	Code Fragment 3
p0_fragment_1:
!	%l0 = 0000000000000001
	setx	0x5d627907d7b5d78a,%g7,%l0 ! %l0 = 5d627907d7b5d78a
!	%l1 = 0000000000000034
	setx	0xc6c2d50f84d84607,%g7,%l1 ! %l1 = c6c2d50f84d84607
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5d627907d7b5d78a
	setx	0xf1748f306b283cb7,%g7,%l0 ! %l0 = f1748f306b283cb7
!	%l1 = c6c2d50f84d84607
	setx	0x465ba9d78d726325,%g7,%l1 ! %l1 = 465ba9d78d726325
!	%f6  = 794fef64, %f12 = c46ab030
	fcmpes	%fcc2,%f6 ,%f12		! %fcc2 = 2
!	%l6 = 2dcd08c69ac22ee1, Mem[00000000300c1400] = ffcf0edb2770e16f
	stxa	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 2dcd08c69ac22ee1
!	%f2  = 885d0e5f 58266abb, Mem[0000000030181400] = 3393ce62 6959dce9
	stda	%f2 ,[%i6+%g0]0x89	! Mem[0000000030181400] = 885d0e5f 58266abb
!	%l3 = 00000000559e0000, Mem[0000000030001408] = e219355c5e68f4a6
	stxa	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000559e0000
!	%f4  = 1dcf2662, Mem[0000000010181430] = 5c4ac865
	st	%f4 ,[%i6+0x030]	! Mem[0000000010181430] = 1dcf2662
	membar	#Sync			! Added by membar checker (2)
!	%f14 = a96627f8 e9f41e28, Mem[0000000010001400] = a8816c9b 78b0bde0
	stda	%f14,[%i0+%g0]0x88	! Mem[0000000010001400] = a96627f8 e9f41e28
!	Mem[0000000010141408] = 13018800, %l5 = 00000000399b0559
	ldstuba	[%i5+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	%l0 = f1748f306b283cb7, %l3 = 00000000559e0000, %l5 = 0000000000000000
	xor	%l0,%l3,%l5		! %l5 = f1748f303eb63cb7

p0_label_13:
!	Mem[00000000211c0000] = 34ff019f, %l5 = f1748f303eb63cb7
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = 00000000000034ff
!	Mem[00000000201c0000] = 4903f578, %l6 = 2dcd08c69ac22ee1
	ldsh	[%o0+%g0],%l6		! %l6 = 0000000000004903
!	Mem[0000000010181408] = 6e4ddae6 84436c23, %l4 = ffcf0edb, %l5 = 000034ff
	ldda	[%i6+%o4]0x80,%l4	! %l4 = 000000006e4ddae6 0000000084436c23
!	%l2 = ffffffffffffa6f4, imm = fffffffffffff8f8, %l5 = 0000000084436c23
	subc	%l2,-0x708,%l5		! %l5 = ffffffffffffadfc
!	Mem[0000000010101410] = e12ec29a, %l1 = 465ba9d78d726325
	ldswa	[%i4+%o5]0x80,%l1	! %l1 = ffffffffe12ec29a
!	Mem[0000000010181400] = f950bcf4, %l6 = 0000000000004903
	lduwa	[%i6+%g0]0x88,%l6	! %l6 = 00000000f950bcf4
!	Mem[0000000010101410] = e12ec29a, %l6 = 00000000f950bcf4
	lduba	[%i4+%o5]0x80,%l6	! %l6 = 00000000000000e1
!	Mem[0000000030081410] = 00000088, %l2 = ffffffffffffa6f4
	ldsha	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000088
!	Mem[00000000300c1410] = ff4e1f43, %l1 = ffffffffe12ec29a
	ldsha	[%i3+%o5]0x81,%l1	! %l1 = ffffffffffffff4e
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffff4e, %l5 = ffffffffffffadfc, %y  = 3fb695ea
	sdiv	%l1,%l5,%l5		! %l5 = ffffffff80000000
	mov	%l0,%y			! %y = 6b283cb7

p0_label_14:
!	Mem[0000000010081410] = ff00616c, %l7 = 0000000000000028
	ldstuba	[%i2+%o5]0x80,%l7	! %l7 = 000000ff000000ff
!	%l6 = 00000000000000e1, Mem[0000000010101418] = ca2fe264
	stw	%l6,[%i4+0x018]		! Mem[0000000010101418] = 000000e1
!	%l6 = 00000000000000e1, Mem[00000000100c1410] = ad82055c
	stwa	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000e1
!	Mem[0000000030041408] = 00000049, %l5 = ffffffff80000000
	swapa	[%i1+%o4]0x89,%l5	! %l5 = 0000000000000049
!	%l4 = 000000006e4ddae6, Mem[0000000010141410] = 64c94f79
	stha	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = dae64f79
!	%l5 = 0000000000000049, Mem[00000000211c0000] = 34ff019f, %asi = 80
	stba	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 49ff019f
!	%l0 = f1748f306b283cb7, Mem[0000000010041406] = f82766a9
	stb	%l0,[%i1+0x006]		! Mem[0000000010041404] = f827b7a9
!	Mem[0000000030101408] = 6424383d, %l5 = 0000000000000049
	swapa	[%i4+%o4]0x81,%l5	! %l5 = 000000006424383d
!	Mem[0000000010101438] = 48bb1b184bd08d1c, %l4 = 000000006e4ddae6, %l3 = 00000000559e0000
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l4,%l3	! %l3 = 48bb1b184bd08d1c
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 3e189957db2c30b0, %l1 = ffffffffffffff4e
	ldxa	[%i0+%g0]0x81,%l1	! %l1 = 3e189957db2c30b0

p0_label_15:
!	Mem[0000000010001400] = 281ef4e9, %l4 = 000000006e4ddae6
	lduba	[%i0+%g0]0x80,%l4	! %l4 = 0000000000000028
!	Code Fragment 3
p0_fragment_2:
!	%l0 = f1748f306b283cb7
	setx	0xa8f5665ffcd331c2,%g7,%l0 ! %l0 = a8f5665ffcd331c2
!	%l1 = 3e189957db2c30b0
	setx	0x08241aaf96ca1100,%g7,%l1 ! %l1 = 08241aaf96ca1100
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a8f5665ffcd331c2
	setx	0x66ee47683c5f1cf8,%g7,%l0 ! %l0 = 66ee47683c5f1cf8
!	%l1 = 08241aaf96ca1100
	setx	0x0252fad07f71eb63,%g7,%l1 ! %l1 = 0252fad07f71eb63
!	Mem[0000000010101400] = 9b90aea1, %l5 = 000000006424383d
	ldsb	[%i4+0x001],%l5		! %l5 = ffffffffffffff90
!	Mem[00000000211c0000] = 49ff019f, %l5 = ffffffffffffff90
	ldsh	[%o2+%g0],%l5		! %l5 = 00000000000049ff
!	Mem[0000000010181408] = 6e4ddae6 84436c23, %l0 = 3c5f1cf8, %l1 = 7f71eb63
	ldda	[%i6+%o4]0x80,%l0	! %l0 = 000000006e4ddae6 0000000084436c23
!	Mem[00000000300c1408] = 58266abb, %l3 = 48bb1b184bd08d1c
	ldswa	[%i3+%o4]0x81,%l3	! %l3 = 0000000058266abb
!	Mem[0000000030141410] = 9be10275, %l1 = 0000000084436c23
	ldsba	[%i5+%o5]0x81,%l1	! %l1 = ffffffffffffff9b
!	Mem[0000000010081420] = c8b0f249, %l6 = 00000000000000e1
	ldub	[%i2+0x020],%l6		! %l6 = 00000000000000c8
!	Mem[0000000030141400] = ceb866c9, %l5 = 00000000000049ff
	ldsha	[%i5+%g0]0x81,%l5	! %l5 = ffffffffffffceb8
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000088, Mem[0000000030101410] = 96eacefc
	stwa	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000088

p0_label_16:
!	%f2  = 885d0e5f 58266abb, Mem[0000000010001408] = 5c0582ad 559e0000
	stda	%f2 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 885d0e5f 58266abb
!	Mem[0000000030101400] = 2c66de34, %l3 = 0000000058266abb
	ldstuba	[%i4+%g0]0x89,%l3	! %l3 = 00000034000000ff
!	%l4 = 0000000000000028, %l3 = 0000000000000034, %l0 = 000000006e4ddae6
	sdivx	%l4,%l3,%l0		! %l0 = 0000000000000000
!	Mem[0000000030181400] = 58266abb, %l1 = ffffffffffffff9b
	swapa	[%i6+%g0]0x89,%l1	! %l1 = 0000000058266abb
!	%l0 = 0000000000000000, immed = fffff8b7, %y  = 6b283cb7
	sdiv	%l0,-0x749,%l6		! %l6 = ffffffff80000000
	mov	%l0,%y			! %y = 00000000
!	%f23 = 750adf40, %f3  = 58266abb, %f19 = 559e0000
	fdivs	%f23,%f3 ,%f19		! %f19 = 5c55a0ac
!	%l1 = 0000000058266abb, Mem[0000000010141410] = dae64f79
	stba	%l1,[%i5+%o5]0x80	! Mem[0000000010141410] = bbe64f79
!	Mem[000000001004141f] = eebb22ee, %l1 = 0000000058266abb
	ldstub	[%i1+0x01f],%l1		! %l1 = 000000ee000000ff
!	Mem[0000000030001410] = a1e399dd, %l4 = 0000000000000028
	swapa	[%i0+%o5]0x89,%l4	! %l4 = 00000000a1e399dd
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ceb866c9 d60d71c0 3e033d17 d415edf4
!	Mem[0000000030141410] = 9be10275 8f65764f bb593bea 7134be8e
!	Mem[0000000030141420] = 50ebb56d 5f460589 5fda0c6f 9e7c013a
!	Mem[0000000030141430] = d235fb33 10226962 aafa6ed9 1216cbda
	ldda	[%i5]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030141400

p0_label_17:
!	Mem[0000000010101408] = f4002c2a, %l2 = 0000000000000088
	ldsba	[%i4+%o4]0x80,%l2	! %l2 = fffffffffffffff4
!	Mem[0000000030141400] = ceb866c9, %l5 = ffffffffffffceb8
	ldswa	[%i5+%g0]0x81,%l5	! %l5 = ffffffffceb866c9
!	Mem[000000001014143c] = 56f91289, %l2 = fffffffffffffff4
	lduw	[%i5+0x03c],%l2		! %l2 = 0000000056f91289
!	Mem[0000000010041408] = bf85b7c6 b49c08b7, %l2 = 56f91289, %l3 = 00000034
	ldda	[%i1+%o4]0x80,%l2	! %l2 = 00000000bf85b7c6 00000000b49c08b7
!	Mem[00000000100c1410] = 000000e1, %f13 = e12ec29a
	lda	[%i3+%o5]0x80,%f13	! %f13 = 000000e1
!	Mem[00000000211c0000] = 49ff019f, %l0 = 0000000000000000
	ldub	[%o2+%g0],%l0		! %l0 = 0000000000000049
!	Mem[0000000030141400] = ceb866c9, %l0 = 0000000000000049
	ldsba	[%i5+%g0]0x81,%l0	! %l0 = ffffffffffffffce
!	Mem[0000000030041408] = 00000080c966b8ce, %l0 = ffffffffffffffce
	ldxa	[%i1+%o4]0x81,%l0	! %l0 = 00000080c966b8ce
!	Mem[0000000010041400] = ff1ef4e9, %f12 = c46ab030
	lda	[%i1+%g0]0x80,%f12	! %f12 = ff1ef4e9
!	Starting 10 instruction Store Burst
!	%f12 = ff1ef4e9 000000e1, Mem[0000000010141410] = 794fe6bb 9f9eafd1
	stda	%f12,[%i5+%o5]0x88	! Mem[0000000010141410] = ff1ef4e9 000000e1

p0_label_18:
!	%f12 = ff1ef4e9 000000e1, Mem[0000000010001408] = 885d0e5f 58266abb
	stda	%f12,[%i0+%o4]0x80	! Mem[0000000010001408] = ff1ef4e9 000000e1
!	%f14 = a96627f8 e9f41e28, Mem[0000000030101408] = 00000049 3e95a704
	stda	%f14,[%i4+%o4]0x81	! Mem[0000000030101408] = a96627f8 e9f41e28
!	Mem[0000000010041400] = e9f41eff, %l1 = 00000000000000ee
	swapa	[%i1+%g0]0x88,%l1	! %l1 = 00000000e9f41eff
!	Mem[0000000010001410] = 3f8cab2a, %l4 = 00000000a1e399dd
	swapa	[%i0+%o5]0x88,%l4	! %l4 = 000000003f8cab2a
!	%l2 = 00000000bf85b7c6, imm = fffffffffffff29c, %l1 = 00000000e9f41eff
	add	%l2,-0xd64,%l1		! %l1 = 00000000bf85aa62
!	Mem[0000000010141410] = e1000000, %l3 = 00000000b49c08b7
	ldsba	[%i5+%o5]0x80,%l3	! %l3 = ffffffffffffffe1
!	%f12 = ff1ef4e9 000000e1, Mem[00000000300c1410] = 431f4eff 74e79c41
	stda	%f12,[%i3+%o5]0x89	! Mem[00000000300c1410] = ff1ef4e9 000000e1
!	%l0 = 00000080c966b8ce, Mem[0000000010041400] = 000000ee
	stba	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000ce
!	Mem[0000000010181408] = 6e4ddae6, %l6 = 80000000, %l5 = ceb866c9
	add	%i6,0x08,%g1
	casa	[%g1]0x80,%l6,%l5	! %l5 = 000000006e4ddae6
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00009e55, %l1 = 00000000bf85aa62
	ldsha	[%i0+%o4]0x81,%l1	! %l1 = 0000000000000000

p0_label_19:
!	Mem[0000000030101408] = a96627f8, %l5 = 000000006e4ddae6
	ldswa	[%i4+%o4]0x81,%l5	! %l5 = ffffffffa96627f8
!	Mem[0000000010101410] = 9ac22ee1, %l2 = 00000000bf85b7c6
	ldsha	[%i4+%o5]0x88,%l2	! %l2 = 0000000000002ee1
!	Mem[0000000010181410] = 714202ca, %l4 = 000000003f8cab2a
	ldsba	[%i6+%o5]0x88,%l4	! %l4 = ffffffffffffffca
!	Mem[00000000218000c0] = 66371e83, %l2 = 0000000000002ee1
	lduba	[%o3+0x0c1]%asi,%l2	! %l2 = 0000000000000037
!	Mem[00000000100c1408] = b3d16803, %l5 = ffffffffa96627f8
	ldsba	[%i3+%o4]0x88,%l5	! %l5 = 0000000000000003
!	Mem[0000000030041408] = ceb866c980000000, %l1 = 0000000000000000
	ldxa	[%i1+%o4]0x89,%l1	! %l1 = ceb866c980000000
!	Mem[0000000010081400] = 48231f22, %l7 = 00000000000000ff
	ldswa	[%i2+%g0]0x80,%l7	! %l7 = 0000000048231f22
!	Mem[0000000010181410] = ca024271, %l6 = ffffffff80000000
	ldswa	[%i6+%o5]0x80,%l6	! %l6 = ffffffffca024271
!	Mem[0000000030081408] = fcceea96, %l2 = 0000000000000037
	lduba	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000096
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = e9f41eff, %l6 = ffffffffca024271
	ldstuba	[%i0+%o4]0x88,%l6	! %l6 = 000000ff000000ff

p0_label_20:
!	%l6 = 00000000000000ff, imm = fffffffffffffac1, %l0 = 00000080c966b8ce
	orn	%l6,-0x53f,%l0		! %l0 = 00000000000005ff
!	%l4 = ffffffca, %l5 = 00000003, Mem[0000000010181408] = e6da4d6e 236c4384
	stda	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffffca 00000003
!	Mem[00000000100c1434] = 7b85c036, %l3 = ffffffffffffffe1, %asi = 80
	swapa	[%i3+0x034]%asi,%l3	! %l3 = 000000007b85c036
!	%l2 = 00000096, %l3 = 7b85c036, Mem[0000000010141410] = e1000000 e9f41eff
	stda	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000096 7b85c036
!	Mem[0000000030141400] = c966b8ce, %l5 = 0000000000000003
	swapa	[%i5+%g0]0x89,%l5	! %l5 = 00000000c966b8ce
!	%l0 = 000005ff, %l1 = 80000000, Mem[00000000100c1420] = 05a84e8f 220f7cf7
	stda	%l0,[%i3+0x020]%asi	! Mem[00000000100c1420] = 000005ff 80000000
!	%l0 = 00000000000005ff, Mem[0000000010041408] = b7089cb4c6b785bf
	stxa	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000000005ff
!	Mem[0000000030041410] = 34287c9a, %l7 = 0000000048231f22
	swapa	[%i1+%o5]0x81,%l7	! %l7 = 0000000034287c9a
!	%f0  = 5e95f273 3e9932b4, Mem[0000000030101410] = 88000000 6b3bbdfd
	stda	%f0 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 5e95f273 3e9932b4
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = e12ec29a, %l6 = 00000000000000ff
	lduha	[%i4+%o5]0x80,%l6	! %l6 = 000000000000e12e

p0_label_21:
!	Mem[0000000010001408] = e1000000e9f41eff, %l5 = 00000000c966b8ce
	ldxa	[%i0+%o4]0x88,%l5	! %l5 = e1000000e9f41eff
!	Mem[00000000211c0000] = 49ff019f, %l0 = 00000000000005ff
	ldsb	[%o2+%g0],%l0		! %l0 = 0000000000000049
!	Mem[0000000010101400] = 9b90aea19d8a92ac, %f28 = 62692210 33fb35d2
	ldd	[%i4+%g0],%f28		! %f28 = 9b90aea1 9d8a92ac
!	Mem[0000000010181408] = caffffff 03000000, %l4 = ffffffca, %l5 = e9f41eff
	ldda	[%i6+0x008]%asi,%l4	! %l4 = 00000000caffffff 0000000003000000
!	Mem[0000000010081410] = ff00616c, %l2 = 0000000000000096
	ldsba	[%i2+%o5]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030141400] = 03000000, %f12 = ff1ef4e9
	lda	[%i5+%g0]0x81,%f12	! %f12 = 03000000
!	Mem[00000000300c1408] = 58266abb ceb866c9, %l2 = ffffffff, %l3 = 7b85c036
	ldda	[%i3+%o4]0x81,%l2	! %l2 = 0000000058266abb 00000000ceb866c9
!	Mem[00000000201c0000] = 4903f578, %l0 = 0000000000000049
	ldub	[%o0+%g0],%l0		! %l0 = 0000000000000049
!	%l0 = 0000000000000049, immed = fffffc4b, %y  = 00000000
	smul	%l0,-0x3b5,%l4		! %l4 = fffffffffffef163, %y = ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 88000000, %l5 = 0000000003000000
	swapa	[%i2+%o5]0x81,%l5	! %l5 = 0000000088000000

p0_label_22:
!	Mem[0000000010101408] = f4002c2a, %l6 = 000000000000e12e
	ldstuba	[%i4+%o4]0x80,%l6	! %l6 = 000000f4000000ff
!	Mem[00000000201c0000] = 4903f578, %l4 = fffffffffffef163
	ldub	[%o0+0x001],%l4		! %l4 = 0000000000000003
	membar	#Sync			! Added by membar checker (3)
!	%l0 = 00000049, %l1 = 80000000, Mem[0000000030141400] = 03000000 d60d71c0
	stda	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000049 80000000
!	%f8  = 2aab8c3f c66d9f69, %l7 = 0000000034287c9a
!	Mem[0000000010181410] = ca024271c4000000
	add	%i6,0x010,%g1
	stda	%f8,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010181410] = ca0242713f8cab2a
!	Mem[0000000030141408] = 173d033e, %l6 = 00000000000000f4
	swapa	[%i5+%o4]0x89,%l6	! %l6 = 00000000173d033e
!	Mem[0000000010041408] = 000005ff, %l3 = 00000000ceb866c9
	ldstuba	[%i1+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000021800100] = 07e800bb, %l1 = ceb866c980000000
	ldstub	[%o3+0x100],%l1		! %l1 = 00000007000000ff
!	%f21 = 7502e19b, Mem[0000000030101410] = 73f2955e
	sta	%f21,[%i4+%o5]0x89	! Mem[0000000030101410] = 7502e19b
!	Mem[0000000010041410] = bc3deb5b, %l3 = 00000000000000ff
	ldstuba	[%i1+%o5]0x80,%l3	! %l3 = 000000bc000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00000028, %l4 = 0000000000000003
	lduha	[%i0+%o5]0x89,%l4	! %l4 = 0000000000000028

p0_label_23:
!	Mem[0000000030041408] = 00000080, %l7 = 0000000034287c9a
	lduba	[%i1+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181400] = 9bffffff, %l1 = 0000000000000007
	lduba	[%i6+%g0]0x81,%l1	! %l1 = 000000000000009b
!	Mem[0000000010041400] = ce000000, %l3 = 00000000000000bc
	ldsw	[%i1+%g0],%l3		! %l3 = ffffffffce000000
!	Mem[000000001014143c] = 56f91289, %l2 = 0000000058266abb
	ldub	[%i5+0x03f],%l2		! %l2 = 0000000000000089
!	Mem[00000000201c0000] = 4903f578, %l0 = 0000000000000049
	ldsb	[%o0+%g0],%l0		! %l0 = 0000000000000049
!	Mem[0000000010041438] = 9418e3633a539281, %l3 = ffffffffce000000
	ldxa	[%i1+0x038]%asi,%l3	! %l3 = 9418e3633a539281
!	Mem[00000000100c1410] = e1000000, %l2 = 0000000000000089
	ldsha	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001400] = e9f41e28, %f16 = c0710dd6
	lda	[%i0+%g0]0x88,%f16	! %f16 = e9f41e28
!	Mem[00000000211c0000] = 49ff019f, %l3 = 9418e3633a539281
	ldsba	[%o2+0x000]%asi,%l3	! %l3 = 0000000000000049
!	Starting 10 instruction Store Burst
!	%f20 = 4f76658f, %f5  = 5fdb32f2, %f31 = d96efaaa
	fadds	%f20,%f5 ,%f31		! %f31 = 5fdb32f2

p0_label_24:
!	%l7 = 0000000000000000, Mem[0000000010181410] = ca024271
	stwa	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	Mem[0000000010081408] = 714202ca, %l3 = 0000000000000049
	swapa	[%i2+%o4]0x80,%l3	! %l3 = 00000000714202ca
!	Mem[0000000010181408] = ffffffca, %l7 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l7	! %l7 = 000000ca000000ff
!	%f0  = 5e95f273 3e9932b4, Mem[0000000030101400] = ffde662c 08362b49
	stda	%f0 ,[%i4+%g0]0x81	! Mem[0000000030101400] = 5e95f273 3e9932b4
!	Mem[0000000030101410] = 7502e19b, %l6 = 00000000173d033e
	ldstuba	[%i4+%o5]0x89,%l6	! %l6 = 0000009b000000ff
!	Mem[0000000010101400] = 9b90aea1, %l0 = 0000000000000049, %asi = 80
	swapa	[%i4+0x000]%asi,%l0	! %l0 = 000000009b90aea1
!	%f27 = 6f0cda5f, Mem[0000000010041408] = ff050000
	st	%f27,[%i1+%o4]		! Mem[0000000010041408] = 6f0cda5f
!	Mem[0000000010001408] = e9f41eff, %l0 = 000000009b90aea1
	swapa	[%i0+%o4]0x88,%l0	! %l0 = 00000000e9f41eff
!	%l0 = e9f41eff, %l1 = 0000009b, Mem[0000000010081400] = 221f2348 369628a0
	stda	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = e9f41eff 0000009b
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 000000e1, %l2 = 0000000000000000
	lduha	[%i3+%o5]0x89,%l2	! %l2 = 00000000000000e1

p0_label_25:
!	Mem[0000000030081400] = 43bf034b, %l7 = 00000000000000ca
	lduwa	[%i2+%g0]0x81,%l7	! %l7 = 0000000043bf034b
!	Mem[0000000030001410] = 00000028, %f17 = c966b8ce
	lda	[%i0+%o5]0x89,%f17	! %f17 = 00000028
!	%f28 = 9b90aea1, %f22 = 8ebe3471, %f10 = 9daf7bb8
	fadds	%f28,%f22,%f10		! %f10 = 9b90aea1
!	Mem[0000000010041418] = b0c6c93eeebb22ff, %f24 = 8905465f 6db5eb50
	ldd	[%i1+0x018],%f24	! %f24 = b0c6c93e eebb22ff
!	Mem[0000000030041400] = f7000000 07fb9f3b, %l0 = e9f41eff, %l1 = 0000009b
	ldda	[%i1+%g0]0x81,%l0	! %l0 = 00000000f7000000 0000000007fb9f3b
!	Mem[0000000010141438] = a0ec86d956f91289, %f18 = f4ed15d4 173d033e
	ldda	[%i5+0x038]%asi,%f18	! %f18 = a0ec86d9 56f91289
!	Mem[00000000300c1410] = 000000e1, %l1 = 0000000007fb9f3b
	lduba	[%i3+%o5]0x89,%l1	! %l1 = 00000000000000e1
!	Mem[0000000030101410] = 7502e1ff, %f20 = 4f76658f
	lda	[%i4+%o5]0x89,%f20	! %f20 = 7502e1ff
!	Mem[0000000010181400] = f4bc50f9, %l1 = 00000000000000e1
	ldsba	[%i6+%g0]0x80,%l1	! %l1 = fffffffffffffff4
!	Starting 10 instruction Store Burst
!	%l7 = 0000000043bf034b, Mem[00000000100c1410] = e1000000
	stwa	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = 43bf034b

p0_label_26:
!	%l5 = 0000000088000000, Mem[0000000020800040] = 92f57cb9, %asi = 80
	stha	%l5,[%o1+0x040]%asi	! Mem[0000000020800040] = 00007cb9
!	Mem[00000000211c0000] = 49ff019f, %l4 = 0000000000000028
	ldstub	[%o2+%g0],%l4		! %l4 = 00000049000000ff
!	%f1  = 3e9932b4, Mem[0000000030181410] = 25cff97f
	sta	%f1 ,[%i6+%o5]0x81	! Mem[0000000030181410] = 3e9932b4
!	%f24 = b0c6c93e eebb22ff, %l7 = 0000000043bf034b
!	Mem[0000000030081428] = 534f76e2cef546fd
	add	%i2,0x028,%g1
	stda	%f24,[%g1+%l7]ASI_PST16_S ! Mem[0000000030081428] = b0c676e2eebb22ff
!	%l1 = fffffffffffffff4, Mem[0000000020800000] = 82b9ff62, %asi = 80
	stba	%l1,[%o1+0x000]%asi	! Mem[0000000020800000] = f4b9ff62
!	Mem[00000000300c1410] = e1000000, %l0 = 00000000f7000000
	swapa	[%i3+%o5]0x81,%l0	! %l0 = 00000000e1000000
!	Mem[0000000030041400] = 000000f7, %l4 = 0000000000000049
	swapa	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000f7
!	%f16 = e9f41e28 00000028 a0ec86d9 56f91289
!	%f20 = 7502e1ff 7502e19b 8ebe3471 ea3b59bb
!	%f24 = b0c6c93e eebb22ff 3a017c9e 6f0cda5f
!	%f28 = 9b90aea1 9d8a92ac dacb1612 5fdb32f2
	stda	%f16,[%i3]ASI_BLK_AIUS	! Block Store to 00000000300c1400
!	%l6 = 000000000000009b, %l0 = 00000000e1000000, %l6 = 000000000000009b
	or	%l6,%l0,%l6		! %l6 = 00000000e100009b
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 5e95f273 3e9932b4, %l6 = e100009b, %l7 = 43bf034b
	ldda	[%i4+%g0]0x81,%l6	! %l6 = 000000005e95f273 000000003e9932b4

p0_label_27:
!	%l7 = 000000003e9932b4, imm = 00000000000000e3, %l4 = 00000000000000f7
	and	%l7,0x0e3,%l4		! %l4 = 00000000000000a0
!	Mem[00000000201c0000] = 4903f578, %l7 = 000000003e9932b4
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = 0000000000004903
	membar	#Sync			! Added by membar checker (4)
!	Mem[00000000100c1408] = 0368d1b3f39e0fcd, %l7 = 0000000000004903
	ldxa	[%i3+%o4]0x80,%l7	! %l7 = 0368d1b3f39e0fcd
!	Mem[00000000300c1400] = e9f41e28, %l2 = 00000000000000e1
	lduwa	[%i3+%g0]0x81,%l2	! %l2 = 00000000e9f41e28
!	Mem[0000000010101410] = e12ec29a, %l4 = 00000000000000a0
	ldsha	[%i4+%o5]0x80,%l4	! %l4 = ffffffffffffe12e
!	Mem[0000000030181410] = 3e9932b4 187c5b17, %l6 = 5e95f273, %l7 = f39e0fcd
	ldda	[%i6+%o5]0x81,%l6	! %l6 = 000000003e9932b4 00000000187c5b17
!	Mem[0000000030181400] = 9bffffff5f0e5d88, %f2  = 885d0e5f 58266abb
	ldda	[%i6+%g0]0x81,%f2 	! %f2  = 9bffffff 5f0e5d88
!	Mem[0000000010141400] = cec696b6, %l4 = ffffffffffffe12e
	lduha	[%i5+%g0]0x80,%l4	! %l4 = 000000000000cec6
!	Mem[0000000030001408] = 00000000 559e0000, %l0 = e1000000, %l1 = fffffff4
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 00000000559e0000 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 5e95f273, %l3 = 00000000714202ca
	ldstuba	[%i4+%g0]0x81,%l3	! %l3 = 0000005e000000ff

p0_label_28:
!	Mem[0000000010001408] = 9b90aea1, %l2 = 00000000e9f41e28
	ldstuba	[%i0+%o4]0x88,%l2	! %l2 = 000000a1000000ff
!	%l2 = 000000a1, %l3 = 0000005e, Mem[00000000300c1410] = ffe10275 9be10275
	stda	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000a1 0000005e
!	%f2  = 9bffffff 5f0e5d88, Mem[0000000010181408] = ffffffff 00000003
	stda	%f2 ,[%i6+%o4]0x88	! Mem[0000000010181408] = 9bffffff 5f0e5d88
!	%f11 = f0cebf02, Mem[0000000010101410] = 9ac22ee1
	sta	%f11,[%i4+%o5]0x88	! Mem[0000000010101410] = f0cebf02
!	%l1 = 0000000000000000, Mem[0000000030081408] = a2a038c5fcceea96
	stxa	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000000000000000
!	%l6 = 000000003e9932b4, Mem[00000000100c1436] = ffffffe1
	sth	%l6,[%i3+0x036]		! Mem[00000000100c1434] = ffff32b4
!	Mem[0000000010181410] = 00000000, %l0 = 00000000559e0000
	swapa	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041400] = ce000000, %l4 = 000000000000cec6
	ldstuba	[%i1+%g0]0x80,%l4	! %l4 = 000000ce000000ff
!	%l6 = 3e9932b4, %l7 = 187c5b17, Mem[0000000010041408] = 6f0cda5f 00000000
	stda	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 3e9932b4 187c5b17
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 281ef4e9, %l1 = 0000000000000000
	ldsba	[%i3+%g0]0x89,%l1	! %l1 = ffffffffffffffe9

p0_label_29:
!	Mem[0000000010101424] = a6141aa7, %l3 = 000000000000005e
	ldsba	[%i4+0x027]%asi,%l3	! %l3 = ffffffffffffffa7
!	Code Fragment 3
p0_fragment_3:
!	%l0 = 0000000000000000
	setx	0x69354c306217c0fa,%g7,%l0 ! %l0 = 69354c306217c0fa
!	%l1 = ffffffffffffffe9
	setx	0x201b126fbd535add,%g7,%l1 ! %l1 = 201b126fbd535add
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 69354c306217c0fa
	setx	0x5acc2f30447887a5,%g7,%l0 ! %l0 = 5acc2f30447887a5
!	%l1 = 201b126fbd535add
	setx	0xdd20bc97fd611aec,%g7,%l1 ! %l1 = dd20bc97fd611aec
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010181400] = f4bc50f9 8eb6249e 885d0e5f ffffff9b
!	Mem[0000000010181410] = 559e0000 3f8cab2a 4c2e988c 2d9aa3af
!	Mem[0000000010181420] = d4532c5c 5605a52b e46bdc3e f1e94f13
!	Mem[0000000010181430] = 1dcf2662 59cd3c3e ba7e6560 7b2a0a90
	ldda	[%i6]ASI_BLK_AIUP,%f16	! Block Load from 0000000010181400
!	Mem[0000000010101400] = 49000000, %l0 = 5acc2f30447887a5
	lduwa	[%i4+%g0]0x88,%l0	! %l0 = 0000000049000000
!	Mem[0000000030041410] = 48231f22a9559c98, %f12 = 03000000 000000e1
	ldda	[%i1+%o5]0x81,%f12	! %f12 = 48231f22 a9559c98
!	%l7 = 00000000187c5b17, %l5 = 0000000088000000, %l5 = 0000000088000000
	xor	%l7,%l5,%l5		! %l5 = 00000000907c5b17
!	Mem[0000000030001400] = 3e189957, %l5 = 00000000907c5b17
	ldsba	[%i0+%g0]0x81,%l5	! %l5 = 000000000000003e
!	Mem[0000000010081410] = ff00616c6226cf1d, %f10 = 9b90aea1 f0cebf02
	ldda	[%i2+%o5]0x80,%f10	! %f10 = ff00616c 6226cf1d
!	Mem[0000000030001400] = 3e189957, %f11 = 6226cf1d
	lda	[%i0+%g0]0x81,%f11	! %f11 = 3e189957
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffa7, Mem[0000000020800040] = 00007cb9
	sth	%l3,[%o1+0x040]		! Mem[0000000020800040] = ffa77cb9

p0_label_30:
!	Mem[0000000020800040] = ffa77cb9, %l2 = 00000000000000a1
	ldstub	[%o1+0x040],%l2		! %l2 = 000000ff000000ff
!	%l1 = dd20bc97fd611aec, Mem[0000000030081408] = 00000000
	stha	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 1aec0000
!	%l5 = 000000000000003e, Mem[0000000010101410] = f0cebf02
	stba	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = f0cebf3e
!	%l0 = 0000000049000000, Mem[0000000020800001] = f4b9ff62, %asi = 80
	stba	%l0,[%o1+0x001]%asi	! Mem[0000000020800000] = f400ff62
!	%l2 = 00000000000000ff, Mem[0000000030001408] = 559e0000
	stha	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 559e00ff
!	%f0  = 5e95f273 3e9932b4, %l6 = 000000003e9932b4
!	Mem[0000000030001428] = 16ac9226574c847b
	add	%i0,0x028,%g1
	stda	%f0,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030001428] = 16ac922673f2847b
!	%l6 = 3e9932b4, %l7 = 187c5b17, Mem[0000000030181400] = 9bffffff 5f0e5d88
	stda	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 3e9932b4 187c5b17
!	%l5 = 000000000000003e, Mem[0000000010101410] = f0cebf3e
	stha	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = f0ce003e
!	Mem[0000000030141410] = 7502e19b, %l3 = ffffffffffffffa7
	ldstuba	[%i5+%o5]0x89,%l3	! %l3 = 0000009b000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = a0ec86d9, %l5 = 000000000000003e
	ldsha	[%i3+%o4]0x81,%l5	! %l5 = ffffffffffffa0ec

p0_label_31:
!	Mem[0000000020800040] = ffa77cb9, %l2 = 00000000000000ff
	ldsha	[%o1+0x040]%asi,%l2	! %l2 = ffffffffffffffa7
!	Mem[0000000030081400] = 43bf034b, %f12 = 48231f22
	lda	[%i2+%g0]0x81,%f12	! %f12 = 43bf034b
!	Mem[00000000300c1408] = d986eca0, %l1 = dd20bc97fd611aec
	ldswa	[%i3+%o4]0x89,%l1	! %l1 = ffffffffd986eca0
!	Mem[0000000010001410] = 699f6dc6 a1e399dd, %l0 = 49000000, %l1 = d986eca0
	ldda	[%i0+%o5]0x88,%l0	! %l0 = 00000000a1e399dd 00000000699f6dc6
!	Mem[0000000010181400] = f950bcf4, %l5 = ffffffffffffa0ec
	ldsha	[%i6+%g0]0x88,%l5	! %l5 = ffffffffffffbcf4
!	Mem[0000000030081400] = 43bf034b, %f2  = 9bffffff
	lda	[%i2+%g0]0x81,%f2 	! %f2 = 43bf034b
!	Mem[0000000030001408] = 00000000559e00ff, %f6  = 794fef64 1734b30b
	ldda	[%i0+%o4]0x89,%f6 	! %f6  = 00000000 559e00ff
!	Mem[0000000010101400] = 00000049, %l6 = 000000003e9932b4
	ldsha	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1418] = ec83937b ce330d30, %l4 = 000000ce, %l5 = ffffbcf4
	ldd	[%i3+0x018],%l4		! %l4 = 00000000ec83937b 00000000ce330d30
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 00000049, %l7 = 00000000187c5b17
	swapa	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000049

p0_label_32:
!	Mem[0000000030001400] = 3e189957, %l7 = 0000000000000049
	swapa	[%i0+%g0]0x81,%l7	! %l7 = 000000003e189957
!	Mem[0000000010101408] = ff002c2a, %l2 = ffffffffffffffa7
	swapa	[%i4+%o4]0x80,%l2	! %l2 = 00000000ff002c2a
!	Mem[0000000010141408] = ff880113, %l0 = 00000000a1e399dd
	swapa	[%i5+%o4]0x80,%l0	! %l0 = 00000000ff880113
!	%l2 = ff002c2a, %l3 = 0000009b, Mem[0000000010041420] = 1edf6f23 9a0dd359
	std	%l2,[%i1+0x020]		! Mem[0000000010041420] = ff002c2a 0000009b
!	%l0 = 00000000ff880113, Mem[0000000030041408] = 00000080c966b8ce
	stxa	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000ff880113
!	Mem[0000000010181400] = f950bcf4, %l7 = 000000003e189957
	ldstuba	[%i6+%g0]0x88,%l7	! %l7 = 000000f4000000ff
!	%f16 = f4bc50f9 8eb6249e, Mem[0000000010101408] = a7ffffff 0bb33417
	stda	%f16,[%i4+%o4]0x88	! Mem[0000000010101408] = f4bc50f9 8eb6249e
!	Mem[0000000030041408] = 00000000, %l3 = 000000000000009b
	ldstuba	[%i1+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081400] = ff1ef4e9, %l0 = 00000000ff880113
	swapa	[%i2+%g0]0x80,%l0	! %l0 = 00000000ff1ef4e9
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1428] = b6e2c28d, %l6 = 0000000000000000
	ldswa	[%i3+0x028]%asi,%l6	! %l6 = ffffffffb6e2c28d

p0_label_33:
!	Mem[0000000010101408] = 9e24b68ef950bcf4, %l5 = 00000000ce330d30
	ldxa	[%i4+%o4]0x80,%l5	! %l5 = 9e24b68ef950bcf4
!	Mem[0000000010081430] = bbb86424, %l4 = 00000000ec83937b
	ldsb	[%i2+0x030],%l4		! %l4 = ffffffffffffffbb
!	Mem[0000000010001400] = e9f41e28, %l5 = 9e24b68ef950bcf4
	lduha	[%i0+%g0]0x88,%l5	! %l5 = 0000000000001e28
!	Mem[00000000201c0000] = 4903f578, %l3 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = 0000000000004903
!	Mem[000000001008140c] = 374bd17b, %l4 = ffffffffffffffbb
	ldswa	[%i2+0x00c]%asi,%l4	! %l4 = 00000000374bd17b
!	Mem[0000000030041400] = 00000049, %l3 = 0000000000004903
	lduwa	[%i1+%g0]0x89,%l3	! %l3 = 0000000000000049
!	Mem[0000000030181408] = b87baf9d, %l3 = 0000000000000049
	ldsha	[%i6+%o4]0x89,%l3	! %l3 = ffffffffffffaf9d
!	Mem[0000000010001428] = e17b19553bd79577, %f8  = 2aab8c3f c66d9f69
	ldd	[%i0+0x028],%f8 	! %f8  = e17b1955 3bd79577
!	Mem[0000000030101408] = a96627f8 e9f41e28, %l6 = b6e2c28d, %l7 = 000000f4
	ldda	[%i4+%o4]0x81,%l6	! %l6 = 00000000a96627f8 00000000e9f41e28
!	Starting 10 instruction Store Burst
!	%f2  = 43bf034b, Mem[0000000030001410] = 28000000
	sta	%f2 ,[%i0+%o5]0x81	! Mem[0000000030001410] = 43bf034b

p0_label_34:
!	Mem[00000000100c1410] = 4b03bf43, %l1 = 00000000699f6dc6
	ldstuba	[%i3+%o5]0x80,%l1	! %l1 = 0000004b000000ff
!	Mem[0000000010081410] = ff00616c6226cf1d, %l0 = 00000000ff1ef4e9, %l4 = 00000000374bd17b
	add	%i2,0x10,%g1
	casxa	[%g1]0x80,%l0,%l4	! %l4 = ff00616c6226cf1d
!	%l3 = ffffffffffffaf9d, Mem[0000000010041400] = 000000ff
	stha	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000af9d
!	%f0  = 5e95f273 3e9932b4 43bf034b 5f0e5d88
!	%f4  = 1dcf2662 5fdb32f2 00000000 559e00ff
!	%f8  = e17b1955 3bd79577 ff00616c 3e189957
!	%f12 = 43bf034b a9559c98 a96627f8 e9f41e28
	stda	%f0,[%i1]ASI_BLK_AIUSL	! Block Store to 0000000030041400
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000010041434] = c3ae91ca, %l1 = 0000004b, %l3 = ffffaf9d
	add	%i1,0x34,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 00000000c3ae91ca
!	%l2 = 00000000ff002c2a, Mem[0000000030041400] = 3e9932b4
	stba	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 3e99322a
!	%l4 = 6226cf1d, %l5 = 00001e28, Mem[00000000300c1410] = a1000000 5e000000
	stda	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 6226cf1d 00001e28
!	%l2 = 00000000ff002c2a, Mem[0000000010041410] = a37ddb375beb3dff
	stxa	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000ff002c2a
!	Mem[0000000021800100] = ffe800bb, %l7 = 00000000e9f41e28
	ldstuba	[%o3+0x100]%asi,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 1aec0000, %l7 = 00000000000000ff
	ldswa	[%i2+%o4]0x81,%l7	! %l7 = 000000001aec0000

p0_label_35:
!	Mem[0000000030181400] = b432993e, %l5 = 0000000000001e28
	lduha	[%i6+%g0]0x89,%l5	! %l5 = 000000000000993e
!	Mem[0000000010181430] = 1dcf266259cd3c3e, %f26 = e46bdc3e f1e94f13
	ldda	[%i6+0x030]%asi,%f26	! %f26 = 1dcf2662 59cd3c3e
!	Mem[00000000300c1400] = e9f41e2800000028, %f10 = ff00616c 3e189957
	ldda	[%i3+%g0]0x81,%f10	! %f10 = e9f41e28 00000028
!	Mem[0000000030081410] = 03000000, %l4 = ff00616c6226cf1d
	lduba	[%i2+%o5]0x81,%l4	! %l4 = 0000000000000003
!	%l4 = 0000000000000003, %l7 = 000000001aec0000, %l4 = 0000000000000003
	xor	%l4,%l7,%l4		! %l4 = 000000001aec0003
!	Mem[00000000300c1410] = 1dcf2662, %l4 = 000000001aec0003
	lduwa	[%i3+%o5]0x89,%l4	! %l4 = 000000001dcf2662
!	%l5 = 000000000000993e, immd = 0000000000000147, %l5  = 000000000000993e
	mulx	%l5,0x147,%l5		! %l5 = 0000000000c3be32
!	Mem[0000000010001410] = a1e399dd, %f14 = a96627f8
	lda	[%i0+%o5]0x88,%f14	! %f14 = a1e399dd
!	Mem[0000000010141438] = a0ec86d9, %l1 = 000000000000004b
	lduw	[%i5+0x038],%l1		! %l1 = 00000000a0ec86d9
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = ffe10275, %l4 = 000000001dcf2662
	ldstuba	[%i4+%o5]0x81,%l4	! %l4 = 000000ff000000ff

p0_label_36:
!	%l0 = ff1ef4e9, %l1 = a0ec86d9, Mem[0000000010101408] = 8eb6249e f4bc50f9
	stda	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = ff1ef4e9 a0ec86d9
!	Mem[00000000201c0001] = 4903f578, %l3 = 00000000c3ae91ca
	ldstuba	[%o0+0x001]%asi,%l3	! %l3 = 00000003000000ff
!	Mem[0000000030081410] = 03000000, %l1 = 00000000a0ec86d9
	swapa	[%i2+%o5]0x81,%l1	! %l1 = 0000000003000000
!	%l6 = 00000000a96627f8, Mem[0000000030101410] = 7502e1ff
	stha	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 750227f8
!	%l6 = a96627f8, %l7 = 1aec0000, Mem[0000000010001410] = dd99e3a1 c66d9f69
	stda	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = a96627f8 1aec0000
!	%l7 = 000000001aec0000, %l5 = 0000000000c3be32, %l0 = 00000000ff1ef4e9
	andn	%l7,%l5,%l0		! %l0 = 000000001a2c0000
!	Mem[00000000300c1400] = e9f41e28, %l0 = 000000001a2c0000
	swapa	[%i3+%g0]0x81,%l0	! %l0 = 00000000e9f41e28
!	%l6 = 00000000a96627f8, Mem[0000000010181410] = 559e0000
	stw	%l6,[%i6+%o5]		! Mem[0000000010181410] = a96627f8
!	%f20 = 559e0000, Mem[0000000010141400] = cec696b6
	st	%f20,[%i5+%g0]		! Mem[0000000010141400] = 559e0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = f0ce003e, %l3 = 0000000000000003
	lduba	[%i4+%o5]0x88,%l3	! %l3 = 000000000000003e

p0_label_37:
!	Mem[0000000030081408] = 1aec0000, %l6 = 00000000a96627f8
	ldsha	[%i2+%o4]0x81,%l6	! %l6 = 0000000000001aec
!	Mem[0000000030141408] = f4ed15d4000000f4, %l2 = 00000000ff002c2a
	ldxa	[%i5+%o4]0x89,%l2	! %l2 = f4ed15d4000000f4
!	Mem[0000000010041408] = 3e9932b4, %f28 = 1dcf2662
	lda	[%i1+%o4]0x80,%f28	! %f28 = 3e9932b4
!	%l5 = 0000000000c3be32, immd = 0000000000000de4, %l5 = 0000000000c3be32
	sdivx	%l5,0xde4,%l5		! %l5 = 0000000000000e17
!	Mem[0000000010041414] = 00000000, %l4 = 00000000000000ff
	ldub	[%i1+0x016],%l4		! %l4 = 0000000000000000
!	Mem[0000000030101400] = ff95f273, %f24 = d4532c5c
	lda	[%i4+%g0]0x81,%f24	! %f24 = ff95f273
!	Mem[0000000020800000] = f400ff62, %l3 = 000000000000003e
	lduh	[%o1+%g0],%l3		! %l3 = 000000000000f400
!	Mem[0000000030081410] = d986eca0, %l4 = 0000000000000000
	lduba	[%i2+%o5]0x89,%l4	! %l4 = 00000000000000a0
!	Mem[0000000030001408] = 559e00ff, %l7 = 000000001aec0000
	ldsha	[%i0+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = b432993e, %l4 = 00000000000000a0
	swapa	[%i6+%o5]0x89,%l4	! %l4 = 00000000b432993e

p0_label_38:
!	%l7 = 00000000000000ff, Mem[0000000010001430] = 7e94da2bb38c5ac9, %asi = 80
	stxa	%l7,[%i0+0x030]%asi	! Mem[0000000010001430] = 00000000000000ff
!	%l6 = 00001aec, %l7 = 000000ff, Mem[0000000010041430] = c803e019 c3ae91ca
	std	%l6,[%i1+0x030]		! Mem[0000000010041430] = 00001aec 000000ff
!	%f10 = e9f41e28 00000028, %l6 = 0000000000001aec
!	Mem[0000000010141430] = 87f242f88ad67584
	add	%i5,0x030,%g1
	stda	%f10,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010141430] = 87f242f8281ef4e9
!	%f30 = ba7e6560 7b2a0a90, Mem[0000000030101400] = 73f295ff b432993e
	stda	%f30,[%i4+%g0]0x89	! Mem[0000000030101400] = ba7e6560 7b2a0a90
!	Mem[0000000010141400] = 559e0000, %l3 = 000000000000f400
	swapa	[%i5+%g0]0x80,%l3	! %l3 = 00000000559e0000
!	%l1 = 0000000003000000, %l6 = 0000000000001aec, %y  = ffffffff
	sdiv	%l1,%l6,%l5		! %l5 = fffffffffff69a3a
	mov	%l0,%y			! %y = e9f41e28
!	%l1 = 0000000003000000, Mem[0000000010001432] = 00000000, %asi = 80
	stba	%l1,[%i0+0x032]%asi	! Mem[0000000010001430] = 00000000
!	Mem[00000000100c1408] = 0368d1b3, %l7 = 00000000000000ff
	ldstuba	[%i3+%o4]0x80,%l7	! %l7 = 00000003000000ff
!	%l2 = f4ed15d4000000f4, Mem[0000000030101410] = f8270275
	stwa	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000f4
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 49000000, %l2 = f4ed15d4000000f4
	ldswa	[%i2+%o4]0x88,%l2	! %l2 = 0000000049000000

p0_label_39:
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010041400] = 9daf0000 f827b7a9 3e9932b4 187c5b17
!	Mem[0000000010041410] = 2a2c00ff 00000000 b0c6c93e eebb22ff
!	Mem[0000000010041420] = ff002c2a 0000009b 11469aa7 5316b51c
!	Mem[0000000010041430] = 00001aec 000000ff 9418e363 3a539281
	ldda	[%i1]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010041400
!	%l0 = 00000000e9f41e28, immd = 0000000000000e19, %l0 = 00000000e9f41e28
	udivx	%l0,0xe19,%l0		! %l0 = 000000000010985f
!	%l0 = 000000000010985f, %l6 = 0000000000001aec, %y  = e9f41e28
	smul	%l0,%l6,%l1		! %l1 = 00000001bec61d94, %y = 00000001
!	Mem[0000000030041410] = f232db5f 6226cf1d, %l2 = 49000000, %l3 = 559e0000
	ldda	[%i1+%o5]0x81,%l2	! %l2 = 00000000f232db5f 000000006226cf1d
!	Mem[00000000100c1400] = 3fb695ea, %l0 = 000000000010985f
	ldswa	[%i3+%g0]0x80,%l0	! %l0 = 000000003fb695ea
!	Mem[0000000030081408] = 0000ec1a, %l2 = 00000000f232db5f
	lduba	[%i2+%o4]0x89,%l2	! %l2 = 000000000000001a
!	Mem[0000000030141408] = f4ed15d4000000f4, %f10 = e9f41e28 00000028
	ldda	[%i5+%o4]0x89,%f10	! %f10 = f4ed15d4 000000f4
!	Mem[00000000300c1400] = 1a2c0000, %l1 = 00000001bec61d94
	ldsha	[%i3+%g0]0x81,%l1	! %l1 = 0000000000001a2c
!	Mem[0000000030141410] = 7502e1ff, %f14 = a1e399dd
	lda	[%i5+%o5]0x89,%f14	! %f14 = 7502e1ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = e9f41eff, %l3 = 000000006226cf1d
	swapa	[%i4+%o4]0x80,%l3	! %l3 = 00000000e9f41eff

p0_label_40:
!	Mem[0000000010081408] = 00000049, %l5 = fffffffffff69a3a
	swapa	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000049
!	Mem[0000000010141408] = dd99e3a1, %l7 = 0000000000000003
	ldstuba	[%i5+%o4]0x88,%l7	! %l7 = 000000a1000000ff
	membar	#Sync			! Added by membar checker (8)
!	%l7 = 00000000000000a1, Mem[000000001004143c] = 3a539281
	sth	%l7,[%i1+0x03c]		! Mem[000000001004143c] = 00a19281
!	%l4 = 00000000b432993e, Mem[000000001010143a] = 48bb1b18
	stb	%l4,[%i4+0x03a]		! Mem[0000000010101438] = 48bb3e18
!	Mem[0000000010001410] = f82766a9, %l6 = 0000000000001aec
	swapa	[%i0+%o5]0x88,%l6	! %l6 = 00000000f82766a9
!	%l3 = 00000000e9f41eff, Mem[0000000010041408] = 3e9932b4
	stba	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = ff9932b4
!	Mem[0000000010081422] = c8b0f249, %l3 = 00000000e9f41eff
	ldstuba	[%i2+0x022]%asi,%l3	! %l3 = 000000f2000000ff
!	%l1 = 0000000000001a2c, Mem[0000000010101408] = 6226cf1d
	stba	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = 2c26cf1d
!	Mem[0000000030041400] = 2a32993e, %l3 = 00000000000000f2
	swapa	[%i1+%g0]0x81,%l3	! %l3 = 000000002a32993e
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff8801139b000000, %l7 = 00000000000000a1
	ldxa	[%i2+0x000]%asi,%l7	! %l7 = ff8801139b000000

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	addc	%l0,0x1d4,%l6
	ldxa	[%i4+0x020]%asi,%l0
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 000000003fb695ea
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000000001a2c
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 000000000000001a
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 000000002a32993e
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000b432993e
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000000000049
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 00000000f82766a9
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be ff8801139b000000
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x00000001,%g2
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
	cmp	%l0,%l1			! %f0  should be 5e95f273 3e9932b4
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 43bf034b 5f0e5d88
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 1dcf2662 5fdb32f2
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 00000000 559e00ff
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be e17b1955 3bd79577
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be f4ed15d4 000000f4
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 43bf034b a9559c98
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 7502e1ff e9f41e28
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be a9b727f8 0000af9d
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 175b7c18 b432993e
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00000000 ff002c2a
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be ff22bbee 3ec9c6b0
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 9b000000 2a2c00ff
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 1cb51653 a79a4611
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be ff000000 ec1a0000
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 8192533a 63e31894
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
	xnor	%l3,0x31d,%l4
	fdivs	%f0 ,%f5 ,%f8 
	done

p0_trap1o:
	xnor	%l3,0x31d,%l4
	fdivs	%f0 ,%f5 ,%f8 
	done


p0_trap2e:
	sub	%l0,-0x043,%l5
	smul	%l7,-0xb79,%l5
	fmuls	%f1 ,%f14,%f12
	nop
	umul	%l4,0x1f2,%l5
	addc	%l7,-0x378,%l5
	fadds	%f7 ,%f1 ,%f10
	done

p0_trap2o:
	sub	%l0,-0x043,%l5
	smul	%l7,-0xb79,%l5
	fmuls	%f1 ,%f14,%f12
	nop
	umul	%l4,0x1f2,%l5
	addc	%l7,-0x378,%l5
	fadds	%f7 ,%f1 ,%f10
	done


p0_trap3e:
	and	%l1,-0xff3,%l1
	done

p0_trap3o:
	and	%l1,-0xff3,%l1
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
	ldx	[%g1+0x000],%l0		! %l0 = 519065ae56cce318
	ldx	[%g1+0x008],%l1		! %l1 = f83a8ea6272b431d
	ldx	[%g1+0x010],%l2		! %l2 = 500c4a9296eacefc
	ldx	[%g1+0x018],%l3		! %l3 = b0b73a40542b2558
	ldx	[%g1+0x020],%l4		! %l4 = 5b5ca8b264ef4f79
	ldx	[%g1+0x028],%l5		! %l5 = 7dbcde7014743fbd
	ldx	[%g1+0x030],%l6		! %l6 = 3040a8d4c6b785bf
	ldx	[%g1+0x038],%l7		! %l7 = b40810fa66e57a8c

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
	xnor	%l3,0x31d,%l4
	fdivs	%f0 ,%f5 ,%f8 
	andn	%l1,%l5,%l0
	fmuls	%f10,%f15,%f13
	fdivs	%f0 ,%f11,%f15
	smul	%l6,%l0,%l4
	fadds	%f0 ,%f1 ,%f5 
	jmpl	%o7,%g0
	xnor	%l7,-0x3c3,%l4
p0_near_0_he:
	addc	%l7,-0x378,%l5
	fadds	%f23,%f17,%f26
	jmpl	%o7,%g0
	sdivx	%l1,-0x31e,%l3
near0_b2b_h:
	umul	%l0,0x527,%l6
	udivx	%l7,0xabf,%l7
	jmpl	%o7,%g0
	xor	%l3,%l3,%l2
near0_b2b_l:
	xnor	%l1,-0x0f0,%l7
	and	%l5,%l3,%l6
	jmpl	%o7,%g0
	sdivx	%l2,-0x27f,%l2
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	jmpl	%o7,%g0
	sdivx	%l3,%l5,%l1
	jmpl	%o7,%g0
	nop
p0_near_1_he:
	std	%l4,[%i0+0x018]		! Mem[0000000010001418]
	sub	%l0,0xcaf,%l1
	jmpl	%o7,%g0
	umul	%l1,0x73d,%l3
near1_b2b_h:
	umul	%l7,%l7,%l6
	jmpl	%o7,%g0
	xnor	%l6,-0xada,%l0
near1_b2b_l:
	fsubs	%f0 ,%f7 ,%f3 
	jmpl	%o7,%g0
	sdivx	%l5,%l5,%l3
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	addc	%l2,-0x52d,%l5
	ldx	[%i5+0x010],%l2		! Mem[0000000010141410]
	addc	%l0,%l4,%l3
	subc	%l7,0x89e,%l4
	fsubs	%f9 ,%f8 ,%f12
	and	%l6,%l4,%l5
	jmpl	%o7,%g0
	addc	%l7,%l6,%l5
p0_near_2_he:
	xnor	%l6,%l3,%l0
	addc	%l7,%l2,%l4
	addc	%l2,-0xffa,%l4
	mulx	%l3,-0xbba,%l2
	fdivs	%f26,%f26,%f23
	jmpl	%o7,%g0
	fdivs	%f17,%f31,%f26
near2_b2b_h:
	jmpl	%o7,%g0
	fmuls	%f24,%f16,%f22
	jmpl	%o7,%g0
	nop
near2_b2b_l:
	jmpl	%o7,%g0
	umul	%l6,%l1,%l0
	jmpl	%o7,%g0
	nop
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	and	%l2,%l5,%l7
	fmuls	%f12,%f14,%f10
	xnor	%l5,-0xfd6,%l3
	add	%l5,-0x1e3,%l1
	fmuls	%f11,%f11,%f12
	jmpl	%o7,%g0
	orn	%l5,-0xf23,%l3
p0_near_3_he:
	mulx	%l7,-0xa5a,%l1
	andn	%l7,%l3,%l1
	jmpl	%o7,%g0
	xnor	%l7,-0xd43,%l7
near3_b2b_h:
	jmpl	%o7,%g0
	smul	%l4,%l3,%l0
	jmpl	%o7,%g0
	nop
near3_b2b_l:
	jmpl	%o7,%g0
	umul	%l2,%l1,%l7
	jmpl	%o7,%g0
	nop
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	udivx	%l7,0xa73,%l6
	orn	%l0,-0x901,%l7
	and	%l6,%l1,%l0
	add	%l6,-0xadc,%l3
	fsubs	%f10,%f13,%f1 
	jmpl	%o7,%g0
	subc	%l0,%l3,%l6
p0_far_0_lem:
	udivx	%l7,0xa73,%l6
	orn	%l0,-0x901,%l7
	and	%l6,%l1,%l0
	add	%l6,-0xadc,%l3
	fsubs	%f10,%f13,%f1 
	jmpl	%o7,%g0
	subc	%l0,%l3,%l6
p0_far_0_he:
	subc	%l2,-0x351,%l7
	and	%l6,0xcc6,%l7
	fcmps	%fcc1,%f19,%f25
	jmpl	%o7,%g0
	xnor	%l7,0xce6,%l4
p0_far_0_hem:
	subc	%l2,-0x351,%l7
	and	%l6,0xcc6,%l7
	fcmps	%fcc1,%f19,%f25
	jmpl	%o7,%g0
	xnor	%l7,0xce6,%l4
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	andn	%l3,%l0,%l3
	fadds	%f21,%f31,%f16
	udivx	%l7,-0xa26,%l1
	xnor	%l5,0xde0,%l2
	jmpl	%o7,%g0
	addc	%l2,-0x8f5,%l7
far0_b2b_l:
	fmuls	%f2 ,%f5 ,%f0 
	fsqrts	%f5 ,%f2 
	fcmps	%fcc1,%f1 ,%f15
	orn	%l4,-0x806,%l4
	jmpl	%o7,%g0
	addc	%l1,%l5,%l2
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	smul	%l4,-0xbb1,%l5
	fdivs	%f13,%f4 ,%f7 
	fcmps	%fcc0,%f2 ,%f6 
	jmpl	%o7,%g0
	fstod	%f12,%f2 
p0_far_1_lem:
	smul	%l4,-0xbb1,%l5
	fdivs	%f13,%f4 ,%f7 
	fcmps	%fcc0,%f2 ,%f6 
	jmpl	%o7,%g0
	fstod	%f12,%f2 
p0_far_1_he:
	sdivx	%l3,%l2,%l0
	xnor	%l4,%l5,%l6
	sdivx	%l4,-0xa12,%l1
	fsubs	%f31,%f18,%f17
	fsqrts	%f18,%f18
	fitos	%f27,%f25
	and	%l3,%l1,%l6
	jmpl	%o7,%g0
	sub	%l1,0xa69,%l4
p0_far_1_hem:
	sdivx	%l3,%l2,%l0
	xnor	%l4,%l5,%l6
	sdivx	%l4,-0xa12,%l1
	fsubs	%f31,%f18,%f17
	fsqrts	%f18,%f18
	fitos	%f27,%f25
	and	%l3,%l1,%l6
	jmpl	%o7,%g0
	sub	%l1,0xa69,%l4
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	add	%l5,%l3,%l4
	sdivx	%l6,-0xbea,%l4
	fsqrts	%f27,%f24
	fsqrts	%f25,%f16
	fadds	%f25,%f16,%f19
	xnor	%l6,0x373,%l5
	xor	%l2,%l5,%l0
	jmpl	%o7,%g0
	addc	%l0,%l3,%l4
far1_b2b_l:
	xor	%l4,-0xcfa,%l0
	fcmps	%fcc2,%f9 ,%f6 
	umul	%l6,%l3,%l1
	smul	%l3,%l0,%l7
	subc	%l7,-0xcc4,%l7
	fcmps	%fcc2,%f4 ,%f11
	and	%l6,0x13c,%l1
	jmpl	%o7,%g0
	andn	%l2,-0x47c,%l7
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	fsubs	%f9 ,%f6 ,%f1 
	umul	%l5,-0xe05,%l1
	fmuls	%f13,%f11,%f7 
	jmpl	%o7,%g0
	and	%l0,%l5,%l0
p0_far_2_lem:
	fsubs	%f9 ,%f6 ,%f1 
	umul	%l5,-0xe05,%l1
	fmuls	%f13,%f11,%f7 
	jmpl	%o7,%g0
	and	%l0,%l5,%l0
p0_far_2_he:
	fdtoi	%f22,%f23
	mulx	%l5,%l1,%l2
	smul	%l0,%l2,%l5
	fdivs	%f17,%f16,%f30
	jmpl	%o7,%g0
	fdivs	%f18,%f17,%f21
p0_far_2_hem:
	fdtoi	%f22,%f23
	mulx	%l5,%l1,%l2
	smul	%l0,%l2,%l5
	fdivs	%f17,%f16,%f30
	jmpl	%o7,%g0
	fdivs	%f18,%f17,%f21
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	orn	%l6,%l5,%l7
	xor	%l4,0x018,%l3
	jmpl	%o7,%g0
	xnor	%l4,%l1,%l7
far2_b2b_l:
	sdivx	%l2,%l7,%l7
	xor	%l0,0x153,%l4
	jmpl	%o7,%g0
	umul	%l3,0x491,%l2
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	xnor	%l4,0x7a9,%l0
	fmuls	%f15,%f4 ,%f15
	orn	%l0,%l4,%l0
	smul	%l6,%l2,%l4
	xor	%l7,%l6,%l0
	jmpl	%o7,%g0
	addc	%l3,%l1,%l7
p0_far_3_lem:
	xnor	%l4,0x7a9,%l0
	fmuls	%f15,%f4 ,%f15
	orn	%l0,%l4,%l0
	smul	%l6,%l2,%l4
	xor	%l7,%l6,%l0
	jmpl	%o7,%g0
	addc	%l3,%l1,%l7
p0_far_3_he:
	fmuls	%f26,%f31,%f18
	fadds	%f22,%f25,%f27
	jmpl	%o7,%g0
	subc	%l7,-0xecf,%l1
p0_far_3_hem:
	fmuls	%f26,%f31,%f18
	fadds	%f22,%f25,%f27
	jmpl	%o7,%g0
	subc	%l7,-0xecf,%l1
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	smul	%l2,%l4,%l4
	xor	%l0,%l7,%l7
	addc	%l7,-0x966,%l4
	fcmps	%fcc2,%f22,%f16
	and	%l7,%l0,%l0
	sdivx	%l6,%l2,%l2
	jmpl	%o7,%g0
	sdivx	%l5,-0xdb0,%l6
far3_b2b_l:
	xnor	%l4,%l7,%l2
	smul	%l3,-0x527,%l2
	sub	%l2,%l0,%l6
	or	%l1,%l5,%l6
	and	%l7,-0x894,%l7
	and	%l1,%l1,%l2
	jmpl	%o7,%g0
	or	%l1,-0x281,%l7
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	fsqrts	%f3 ,%f4 
	mulx	%l6,%l4,%l7
	fadds	%f11,%f9 ,%f11
	andn	%l2,-0x7d1,%l7
	and	%l3,%l2,%l6
	fmuls	%f3 ,%f2 ,%f12
	fmuls	%f0 ,%f1 ,%f2 
	jmpl	%g6+8,%g0
	ldd	[%i5+0x030],%f12	! Mem[0000000010141430]
p0_call_0_le:
	fsubs	%f2 ,%f6 ,%f10
	subc	%l7,-0x34e,%l1
	addc	%l5,%l6,%l7
	retl
	sdivx	%l5,%l0,%l4
p0_jmpl_0_lo:
	fsqrts	%f3 ,%f4 
	mulx	%l6,%l4,%l7
	fadds	%f11,%f9 ,%f11
	andn	%l2,-0x7d1,%l7
	and	%l3,%l2,%l6
	fmuls	%f3 ,%f2 ,%f12
	fmuls	%f0 ,%f1 ,%f2 
	jmpl	%g6+8,%g0
	ldd	[%o5+0x030],%f12	! Mem[0000000010141430]
p0_call_0_lo:
	fsubs	%f2 ,%f6 ,%f10
	subc	%l7,-0x34e,%l1
	addc	%l5,%l6,%l7
	retl
	sdivx	%l5,%l0,%l4
p0_jmpl_0_he:
	fcmps	%fcc1,%f19,%f23
	jmpl	%g6+8,%g0
	mulx	%l1,%l4,%l3
p0_call_0_he:
	xnor	%l5,%l0,%l4
	umul	%l6,-0x02e,%l3
	retl
	mulx	%l7,-0x5e8,%l5
p0_jmpl_0_ho:
	fcmps	%fcc1,%f19,%f23
	jmpl	%g6+8,%g0
	mulx	%l1,%l4,%l3
p0_call_0_ho:
	xnor	%l5,%l0,%l4
	umul	%l6,-0x02e,%l3
	retl
	mulx	%l7,-0x5e8,%l5
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	jmpl	%g6+8,%g0
	fsubs	%f4 ,%f12,%f1 
p0_call_1_le:
	fsubs	%f13,%f1 ,%f9 
	fsqrts	%f15,%f8 
	orn	%l3,%l6,%l7
	sdivx	%l7,-0x7e5,%l6
	orn	%l0,%l4,%l1
	retl
	mulx	%l1,%l0,%l5
p0_jmpl_1_lo:
	jmpl	%g6+8,%g0
	fsubs	%f4 ,%f12,%f1 
p0_call_1_lo:
	fsubs	%f13,%f1 ,%f9 
	fsqrts	%f15,%f8 
	orn	%l3,%l6,%l7
	sdivx	%l7,-0x7e5,%l6
	orn	%l0,%l4,%l1
	retl
	mulx	%l1,%l0,%l5
p0_jmpl_1_he:
	lduh	[%i0+0x004],%l1		! Mem[0000000010001404]
	addc	%l0,-0x8bf,%l7
	jmpl	%g6+8,%g0
	sth	%l6,[%i0+0x002]		! Mem[0000000010001402]
p0_call_1_he:
	fmuls	%f18,%f19,%f31
	retl
	xnor	%l6,-0x7d3,%l2
p0_jmpl_1_ho:
	lduh	[%o0+0x004],%l1		! Mem[0000000010001404]
	addc	%l0,-0x8bf,%l7
	jmpl	%g6+8,%g0
	sth	%l6,[%o0+0x002]		! Mem[0000000010001402]
p0_call_1_ho:
	fmuls	%f18,%f19,%f31
	retl
	xnor	%l6,-0x7d3,%l2
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	add	%l2,%l0,%l6
	fsqrts	%f0 ,%f1 
	mulx	%l5,%l6,%l4
	smul	%l3,%l4,%l0
	st	%f8 ,[%i0+0x01c]	! Mem[000000001000141c]
	andn	%l4,%l7,%l4
	jmpl	%g6+8,%g0
	subc	%l3,%l7,%l4
p0_call_2_le:
	udivx	%l7,0x5e5,%l4
	retl
	stw	%l4,[%i1+0x02c]		! Mem[000000001004142c]
p0_jmpl_2_lo:
	add	%l2,%l0,%l6
	fsqrts	%f0 ,%f1 
	mulx	%l5,%l6,%l4
	smul	%l3,%l4,%l0
	st	%f8 ,[%o0+0x01c]	! Mem[000000001000141c]
	andn	%l4,%l7,%l4
	jmpl	%g6+8,%g0
	subc	%l3,%l7,%l4
p0_call_2_lo:
	udivx	%l7,0x5e5,%l4
	retl
	stw	%l4,[%o1+0x02c]		! Mem[000000001004142c]
p0_jmpl_2_he:
	jmpl	%g6+8,%g0
	addc	%l5,0x83e,%l0
p0_call_2_he:
	fmuls	%f20,%f22,%f20
	fsqrts	%f29,%f24
	retl
	or	%l0,%l1,%l2
p0_jmpl_2_ho:
	jmpl	%g6+8,%g0
	addc	%l5,0x83e,%l0
p0_call_2_ho:
	fmuls	%f20,%f22,%f20
	fsqrts	%f29,%f24
	retl
	or	%l0,%l1,%l2
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	sdivx	%l7,-0x46a,%l0
	smul	%l5,%l6,%l3
	subc	%l0,0xa9d,%l0
	xor	%l2,0x419,%l3
	sdivx	%l3,0x448,%l5
	jmpl	%g6+8,%g0
	and	%l5,%l1,%l5
p0_call_3_le:
	xor	%l2,%l1,%l2
	addc	%l7,%l1,%l2
	retl
	mulx	%l3,-0x9bf,%l0
p0_jmpl_3_lo:
	sdivx	%l7,-0x46a,%l0
	smul	%l5,%l6,%l3
	subc	%l0,0xa9d,%l0
	xor	%l2,0x419,%l3
	sdivx	%l3,0x448,%l5
	jmpl	%g6+8,%g0
	and	%l5,%l1,%l5
p0_call_3_lo:
	xor	%l2,%l1,%l2
	addc	%l7,%l1,%l2
	retl
	mulx	%l3,-0x9bf,%l0
p0_jmpl_3_he:
	udivx	%l5,%l6,%l6
	xnor	%l3,%l2,%l4
	addc	%l2,0xdc4,%l6
	jmpl	%g6+8,%g0
	or	%l0,%l5,%l4
p0_call_3_he:
	fdivs	%f28,%f30,%f16
	subc	%l4,-0x5a9,%l0
	retl
	xor	%l4,%l6,%l7
p0_jmpl_3_ho:
	udivx	%l5,%l6,%l6
	xnor	%l3,%l2,%l4
	addc	%l2,0xdc4,%l6
	jmpl	%g6+8,%g0
	or	%l0,%l5,%l4
p0_call_3_ho:
	fdivs	%f28,%f30,%f16
	subc	%l4,-0x5a9,%l0
	retl
	xor	%l4,%l6,%l7
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
	.word	0x519065ae,0x56cce318		! Init value for %l0
	.word	0xf83a8ea6,0x272b431d		! Init value for %l1
	.word	0x500c4a92,0x96eacefc		! Init value for %l2
	.word	0xb0b73a40,0x542b2558		! Init value for %l3
	.word	0x5b5ca8b2,0x64ef4f79		! Init value for %l4
	.word	0x7dbcde70,0x14743fbd		! Init value for %l5
	.word	0x3040a8d4,0xc6b785bf		! Init value for %l6
	.word	0xb40810fa,0x66e57a8c		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x5e95f273,0x3e9932b4		! Init value for %f0 
	.word	0x885d0e5f,0xf971111b		! Init value for %f2 
	.word	0xe2cbd3af,0x54e8e9d9		! Init value for %f4 
	.word	0x17c59600,0x695517ff		! Init value for %f6 
	.word	0x454ed156,0x8b956c61		! Init value for %f8 
	.word	0x9daf7bb8,0xf0cebf02		! Init value for %f10
	.word	0xc46ab030,0xe12ec29a		! Init value for %f12
	.word	0xa96627f8,0xe9f41e28		! Init value for %f14
	.word	0xab2bb08d,0x34c1707e		! Init value for %f16
	.word	0xa2a038c5,0xd5d86efb		! Init value for %f18
	.word	0x1f37c707,0xff7667f7		! Init value for %f20
	.word	0xdc5abdef,0x7e804d61		! Init value for %f22
	.word	0xd42deb44,0x2b030f63		! Init value for %f24
	.word	0xfc8eaa3d,0xbb6a2640		! Init value for %f26
	.word	0xe8597646,0x4e3731d1		! Init value for %f28
	.word	0x35ff1570,0x010bf2cb		! Init value for %f30
	.word	0xfc2e46d7,0x81f4bde9		! Init value for %f32
	.word	0x71ac22e2,0x3548e2d0		! Init value for %f34
	.word	0xf8aad1b8,0x9ab8f230		! Init value for %f36
	.word	0x004ae93d,0x655e7b0d		! Init value for %f38
	.word	0xf237c7f4,0x0f0696fe		! Init value for %f40
	.word	0xca879df6,0xf5650c3f		! Init value for %f42
	.word	0xb15ce6f9,0xaea6805b		! Init value for %f44
	.word	0x4df27ccb,0x7048f766		! Init value for %f46
	.word	0xbbfe552f,0xc3160bfe
	.word	0x7839f133,0x8f07547a
	.word	0xc77d3955,0x57701433
	.word	0x15293cbc,0x0b64f374
	.word	0x2e9d48d1,0xbbc13e22
	.word	0xefb7e0b0,0x5e48a223
	.word	0xf7bc1a52,0x9ee5ca33
	.word	0x5e08ef25,0x1f2dfb1f
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
	.word	0x00000000,0x3fb695ea
	.word	0x00000000,0x00001a2c
	.word	0x00000000,0x0000001a
	.word	0x00000000,0x2a32993e
	.word	0x00000000,0xb432993e
	.word	0x00000000,0x00000049
	.word	0x00000000,0xf82766a9
	.word	0xff880113,0x9b000000
p0_expected_fp_regs:
	.word	0x5e95f273,0x3e9932b4
	.word	0x43bf034b,0x5f0e5d88
	.word	0x1dcf2662,0x5fdb32f2
	.word	0x00000000,0x559e00ff
	.word	0xe17b1955,0x3bd79577
	.word	0xf4ed15d4,0x000000f4
	.word	0x43bf034b,0xa9559c98
	.word	0x7502e1ff,0xe9f41e28
	.word	0xa9b727f8,0x0000af9d
	.word	0x175b7c18,0xb432993e
	.word	0x00000000,0xff002c2a
	.word	0xff22bbee,0x3ec9c6b0
	.word	0x9b000000,0x2a2c00ff
	.word	0x1cb51653,0xa79a4611
	.word	0xff000000,0xec1a0000
	.word	0x8192533a,0x63e31894
	.word	0x0000000a,0x00000000		! %fsr = 0000000a00000000
p0_local0_expect:
	.word	0x281ef4e9,0xf82766a9
	.word	0xffae909b,0x000000e1
	.word	0xec1a0000,0x1aec0000
	.word	0xd2a73ecb,0x750adf40
	.word	0x6eabfb8d,0x9f4130bc
	.word	0xe17b1955,0x3bd79577
	.word	0x00000000,0x000000ff
	.word	0xc529f13d,0x3fb695ea
p0_local0_sec_expect:
	.word	0x00000049,0xdb2c30b0
	.word	0xff009e55,0x00000000
	.word	0x43bf034b,0xb962c233
	.word	0x8e108e62,0x30a762d2
	.word	0x53874222,0xee4e7751
	.word	0x16ac9226,0x73f2847b
	.word	0x8858beb3,0xbd4863ae
	.word	0xf27474d8,0x7a6801f6
p0_local1_expect:
	.word	0x9daf0000,0xf827b7a9
	.word	0xff9932b4,0x187c5b17
	.word	0x2a2c00ff,0x00000000
	.word	0xb0c6c93e,0xeebb22ff
	.word	0xff002c2a,0x0000009b
	.word	0x11469aa7,0x5316b51c
	.word	0x00001aec,0x000000ff
	.word	0x9418e363,0x00a19281
p0_local1_sec_expect:
	.word	0x000000f2,0x73f2955e
	.word	0x885d0e5f,0x4b03bf43
	.word	0xf232db5f,0x6226cf1d
	.word	0xff009e55,0x00000000
	.word	0x7795d73b,0x55197be1
	.word	0x5799183e,0x6c6100ff
	.word	0x989c55a9,0x4b03bf43
	.word	0x281ef4e9,0xf82766a9
p0_local2_expect:
	.word	0xff880113,0x9b000000
	.word	0xfff69a3a,0x374bd17b
	.word	0xff00616c,0x6226cf1d
	.word	0xb142343a,0xf3a9fe7b
	.word	0xc8b0ff49,0xd570cacc
	.word	0xe3ce8a8a,0xe25c7110
	.word	0xbbb86424,0x6879e6cd
	.word	0x5a567c35,0xba2672ef
p0_local2_sec_expect:
	.word	0x43bf034b,0xf2da66f8
	.word	0x1aec0000,0x00000000
	.word	0xa0ec86d9,0x00000000
	.word	0x8b35c0cd,0xa4b0a722
	.word	0xf294f069,0xc9c54fe6
	.word	0xb0c676e2,0xeebb22ff
	.word	0xac089399,0x1033243c
	.word	0x8da0eeda,0xf0814c26
p0_local3_expect:
	.word	0x3fb695ea,0x3700a29b
	.word	0xff68d1b3,0xf39e0fcd
	.word	0xff03bf43,0x0768f29d
	.word	0xec83937b,0xce330d30
	.word	0x000005ff,0x80000000
	.word	0xb6e2c28d,0xaa8582f7
	.word	0x8452c41f,0xffff32b4
	.word	0x8d3a0b7e,0xc0ff829f
p0_local3_sec_expect:
	.word	0x1a2c0000,0x00000028
	.word	0xa0ec86d9,0x56f91289
	.word	0x6226cf1d,0x00001e28
	.word	0x8ebe3471,0xea3b59bb
	.word	0xb0c6c93e,0xeebb22ff
	.word	0x3a017c9e,0x6f0cda5f
	.word	0x9b90aea1,0x9d8a92ac
	.word	0xdacb1612,0x5fdb32f2
p0_local4_expect:
	.word	0x00000049,0x9d8a92ac
	.word	0x2c26cf1d,0xd986eca0
	.word	0x3e00cef0,0xc608cd2d
	.word	0x000000e1,0x6368a459
	.word	0xeb9193eb,0xa6141aa7
	.word	0x6fa5fcbe,0x38e6bbc9
	.word	0xade7f7bc,0xf033143f
	.word	0x48bb3e18,0x4bd08d1c
p0_local4_sec_expect:
	.word	0x900a2a7b,0x60657eba
	.word	0xa96627f8,0xe9f41e28
	.word	0x000000f4,0x3e9932b4
	.word	0xfcf8a5a2,0x38838bd7
	.word	0x36a76cb7,0x49cab108
	.word	0xe71fd1f5,0x83a42185
	.word	0x71957c23,0x5bd22210
	.word	0xc46adbe2,0x010bf2cb
p0_local5_expect:
	.word	0x0000f400,0x8bf47345
	.word	0xffe399dd,0x90d5b30c
	.word	0x00000096,0x7b85c036
	.word	0x42e6f7e0,0xd63e790a
	.word	0x069eebd5,0xd21b942e
	.word	0xe57d4fc5,0xe600cffc
	.word	0x87f242f8,0x281ef4e9
	.word	0xa0ec86d9,0x56f91289
p0_local5_sec_expect:
	.word	0x187c5b17,0x80000000
	.word	0xf4000000,0xd415edf4
	.word	0xffe10275,0x8f65764f
	.word	0xbb593bea,0x7134be8e
	.word	0x50ebb56d,0x5f460589
	.word	0x5fda0c6f,0x9e7c013a
	.word	0xd235fb33,0x10226962
	.word	0xaafa6ed9,0x1216cbda
p0_local6_expect:
	.word	0xffbc50f9,0x8eb6249e
	.word	0x885d0e5f,0xffffff9b
	.word	0xa96627f8,0x3f8cab2a
	.word	0x4c2e988c,0x2d9aa3af
	.word	0xd4532c5c,0x5605a52b
	.word	0xe46bdc3e,0xf1e94f13
	.word	0x1dcf2662,0x59cd3c3e
	.word	0xba7e6560,0x7b2a0a90
p0_local6_sec_expect:
	.word	0x3e9932b4,0x187c5b17
	.word	0x9daf7bb8,0xf0cebf02
	.word	0xa0000000,0x187c5b17
	.word	0x745c4267,0xc53a6d85
	.word	0x5dfd853e,0x02ccfa2f
	.word	0xe775e436,0x9b5867ae
	.word	0xbb3ced37,0xfb5e02f9
	.word	0x39e28905,0xbf459370
share0_expect:
	.word	0x49fff578,0x4cf767d1
	.word	0xe05d8526,0x50f97260
	.word	0xecac060e,0x29025d30
	.word	0x6707f4dd,0xb1bab299
	.word	0x0e96b7e6,0x8d1f5b38
	.word	0x998b07ea,0xe3ff6918
	.word	0x2983c493,0x5784a998
	.word	0xfc57e57b,0x34f24590
share1_expect:
	.word	0xf400ff62,0x6bbd8d6c
	.word	0xa8469189,0xe18ae32d
	.word	0xef0874c3,0x7e75534d
	.word	0xce465f93,0xda594f5b
	.word	0x64e1d2af,0x761f82b5
	.word	0xd373bf5b,0xf8f8f51b
	.word	0x7b7d725f,0xa1965fe7
	.word	0x74b5b13c,0x6cf15ded
	.word	0xffa77cb9,0x1113b1a6
	.word	0xa90fefa5,0x4316c15a
	.word	0xab07b6b1,0xde18d2a8
	.word	0x90a759ce,0xda6dbf3d
	.word	0x89be5837,0xc29faa98
	.word	0x0e2ea780,0xc8199281
	.word	0x08cae9e7,0xb0333a79
	.word	0xf226d8bf,0x658c58c2
share2_expect:
	.word	0xffff019f,0x320e8e9b
	.word	0xbb25df3c,0x0f6ab60c
	.word	0x761826bd,0x1b920c31
	.word	0x2cdf8d97,0xa6073e89
	.word	0x10991041,0x18de0d21
	.word	0x22328d95,0xa9f1f880
	.word	0x69c3ebaa,0x82175f60
	.word	0x326703ff,0xc53b4843
share3_expect:
	.word	0x5615b10c,0x015a17e2
	.word	0xee0c37d4,0x3955b436
	.word	0xee212de2,0xdad8babc
	.word	0x1dd24596,0xe540ad68
	.word	0xc9d08f27,0xc7f646f8
	.word	0xd35b230c,0xaf540439
	.word	0x01a40651,0x753b2201
	.word	0x5245adbc,0x727e0c6e
	.word	0xcd037c22,0xfd8baf11
	.word	0x67a79b1e,0x372d2507
	.word	0x88a28fae,0x48ba86d9
	.word	0x3578ed6a,0x41ddeefb
	.word	0x0ab7bc8c,0x25c7414e
	.word	0x67c33deb,0x0ba9330f
	.word	0x81480e60,0xa7f6290c
	.word	0x1a7869f4,0xe6d2db65
	.word	0x5f002fea,0x4dbe3dad
	.word	0x385db13d,0x9db78a28
	.word	0xb271a819,0x04c06a10
	.word	0x1c862684,0xb150beb4
	.word	0xc45d957f,0xdba2f488
	.word	0x881105a9,0xfd517907
	.word	0x06ab5088,0x68ddaac7
	.word	0xeec92aae,0x89d6ea14
	.word	0x66371e83,0x972cf121
	.word	0x4414d856,0x04dcc08c
	.word	0x0950dd8c,0x9654b2d2
	.word	0xcb29a729,0x5976cc00
	.word	0x4eee6a09,0x6d164213
	.word	0xa68d3000,0x4795ad1d
	.word	0x811adb0f,0xc1dfe8c6
	.word	0xa205a490,0xa8010a16
	.word	0xffe800bb,0x6d7321b4
	.word	0xd9f755a2,0x6246a921
	.word	0x625d8d5d,0x2f5c191e
	.word	0x935e83fb,0x4f63c9af
	.word	0x08557ea6,0x82afb257
	.word	0xf436b27d,0xcec34230
	.word	0xe93cbed8,0xff9d96ca
	.word	0xcd2249f0,0x0acea75c
	.word	0xafb78ed8,0x295bf0dd
	.word	0x6ed6a1d1,0xa9d63c08
	.word	0x9b6bb353,0x3ef15835
	.word	0x44a88dc4,0x94c62092
	.word	0x63dee986,0x328d2ff2
	.word	0x57fd2e3e,0x4826bc10
	.word	0x9b547eb8,0x66f87be0
	.word	0x79ea74bb,0x69207753
	.word	0x78605c6d,0x337a0b2e
	.word	0x177e3470,0xe297850c
	.word	0x1f4a981d,0xdba68831
	.word	0xd6f8a405,0x22576acc
	.word	0xd4818bcd,0x248d1b50
	.word	0x8a693540,0x18341323
	.word	0xef5d7a3b,0xdacf5e20
	.word	0xb339257f,0x434f1ae9
	.word	0x3fae5345,0xa93d1c8a
	.word	0xc30378ce,0xbe5b5658
	.word	0x9e634f98,0x4632924c
	.word	0x50b29f2c,0x3c88eb0a
	.word	0x50f1b437,0xf5c1a706
	.word	0xd698de9a,0x581dd470
	.word	0xe050658c,0x8b0eafeb
	.word	0x6f9dd3c5,0xa6a3ee18
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
	.word	0x968c34af,0xb81cdb22
	.word	0x00000000,0x00000002
	.word	0xd9c289a8,0x540810c4
	.word	0x00000000,0x00000003
	.word	0xf12a3de7,0xca92be8e
	.word	0x00000000,0x00000004
	.word	0x31a32abf,0x90d6a568
	.word	0x00000000,0x00000005
	.word	0x7b6e77c7,0xdac9b0d9
	.word	0x00000000,0x00000006
	.word	0x51a47117,0xa03d7a3c
	.word	0x00000000,0x00000007
	.word	0xd572368f,0xcb6a4abc
	.word	0x00000000,0x00000008
	.word	0x59c878b8,0x5b6c8fd4
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
	.word	0x1c6c81a8,0xe0bdb078,0x3b9ffb07,0x74dc7f7e
	.word	0x2aab8c3f,0xc66d9f69,0xd2a73ecb,0x750adf40
	.word	0x6eabfb8d,0x9f4130bc,0xe17b1955,0x3bd79577
	.word	0x7e94da2b,0xb38c5ac9,0xc529f13d,0x3fb695ea
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
	.word	0x3e189957,0xdb2c30b0,0xa6f4685e,0x5c3519e2
	.word	0xdd99e3a1,0xb962c233,0x8e108e62,0x30a762d2
	.word	0x53874222,0xee4e7751,0x16ac9226,0x574c847b
	.word	0x8858beb3,0xbd4863ae,0xf27474d8,0x7a6801f6
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
	.word	0x373756fb,0xc2a6b88e,0xa52c67f5,0xb49c08b7
	.word	0xbc3deb5b,0x37db7da3,0xb0c6c93e,0xeebb22ee
	.word	0x1edf6f23,0x9a0dd359,0x11469aa7,0x5316b51c
	.word	0xc803e019,0xc3ae91ca,0x9418e363,0x3a539281
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
	.word	0x72e680c7,0x604eb2f8,0xe4b2c8df,0x7d3bb133
	.word	0x80287c9a,0xa9559c98,0xced4a5ec,0x72479139
	.word	0x3a98bc65,0xd182e059,0x5f125167,0xc4e524e6
	.word	0xebacec60,0x311aac52,0xfaf9da52,0x85472862
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
	.word	0x48231f22,0xa0289636,0x714202ca,0x374bd17b
	.word	0xf232db5f,0x6226cf1d,0xb142343a,0xf3a9fe7b
	.word	0xc8b0f249,0xd570cacc,0xe3ce8a8a,0xe25c7110
	.word	0xbbb86424,0x6879e6cd,0x5a567c35,0xba2672ef
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
	.word	0x43bf034b,0xf2da66f8,0xb696c6ce,0x3d4bc9da
	.word	0x5c9508a8,0x8f6bc5f9,0x8b35c0cd,0xa4b0a722
	.word	0xf294f069,0xc9c54fe6,0x534f76e2,0xcef546fd
	.word	0xac089399,0x1033243c,0x8da0eeda,0xf0814c26
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
	.word	0x47e87411,0x3700a29b,0x033fd1b3,0xf39e0fcd
	.word	0x80d3deac,0x0768f29d,0xec83937b,0xce330d30
	.word	0x05a84e8f,0x220f7cf7,0xb6e2c28d,0xaa8582f7
	.word	0x8452c41f,0x7b85c036,0x8d3a0b7e,0xc0ff829f
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
	.word	0x68cf0edb,0x2770e16f,0x76ba82af,0xceb866c9
	.word	0xff4e1f43,0x419ce774,0x0cc8b807,0xa2dc8b03
	.word	0xaddd9d3b,0xd3ad13e7,0x25f7250f,0x2bf96b6f
	.word	0x99810731,0x999001e8,0x27239b42,0x4f8de4bf
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
	.word	0x9b90aea1,0x9d8a92ac,0xf4002c2a,0x1734b30b
	.word	0x946299bc,0xc608cd2d,0xca2fe264,0x6368a459
	.word	0xeb9193eb,0xa6141aa7,0x6fa5fcbe,0x38e6bbc9
	.word	0xade7f7bc,0xf033143f,0x48bb1b18,0x4bd08d1c
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
	.word	0x34de662c,0x08362b49,0xf7db383d,0x3e95a704
	.word	0xe90da274,0x6b3bbdfd,0xfcf8a5a2,0x38838bd7
	.word	0x36a76cb7,0x49cab108,0xe71fd1f5,0x83a42185
	.word	0x71957c23,0x5bd22210,0x6283dbe2,0x67314095
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
	.word	0x004b4a74,0x8bf47345,0x26720113,0x90d5b30c
	.word	0x445c269b,0xd1af9e9f,0x42e6f7e0,0xd63e790a
	.word	0x069eebd5,0xd21b942e,0xe57d4fc5,0xe600cffc
	.word	0x87f242f8,0x8ad67584,0xa0ec86d9,0x56f91289
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
	.word	0x399b0559,0xd60d71c0,0x3e033d17,0xd415edf4
	.word	0x9be10275,0x8f65764f,0xbb593bea,0x7134be8e
	.word	0x50ebb56d,0x5f460589,0x5fda0c6f,0x9e7c013a
	.word	0xd235fb33,0x10226962,0xaafa6ed9,0x1216cbda
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
	.word	0xf4bc50f9,0x8eb6249e,0x6e4ddae6,0x84436c23
	.word	0xcba98706,0x9b5317d2,0x4c2e988c,0x2d9aa3af
	.word	0xd4532c5c,0x5605a52b,0xe46bdc3e,0xf1e94f13
	.word	0x5c4ac865,0x59cd3c3e,0xba7e6560,0x7b2a0a90
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
	.word	0x62ce9333,0xe9dc5969,0xe079aee1,0x3c351b95
	.word	0x25cff97f,0x187c5b17,0x745c4267,0xc53a6d85
	.word	0x5dfd853e,0x02ccfa2f,0xe775e436,0x9b5867ae
	.word	0xbb3ced37,0xfb5e02f9,0x39e28905,0xbf459370
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
	.word	0x4903f578,0x4cf767d1,0xe05d8526,0x50f97260
	.word	0xecac060e,0x29025d30,0x6707f4dd,0xb1bab299
	.word	0x0e96b7e6,0x8d1f5b38,0x998b07ea,0xe3ff6918
	.word	0x2983c493,0x5784a998,0xfc57e57b,0x34f24590
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
	.word	0x82b9ff62,0x6bbd8d6c,0xa8469189,0xe18ae32d
	.word	0xef0874c3,0x7e75534d,0xce465f93,0xda594f5b
	.word	0x64e1d2af,0x761f82b5,0xd373bf5b,0xf8f8f51b
	.word	0x7b7d725f,0xa1965fe7,0x74b5b13c,0x6cf15ded
	.word	0x92f57cb9,0x1113b1a6,0xa90fefa5,0x4316c15a
	.word	0xab07b6b1,0xde18d2a8,0x90a759ce,0xda6dbf3d
	.word	0x89be5837,0xc29faa98,0x0e2ea780,0xc8199281
	.word	0x08cae9e7,0xb0333a79,0xf226d8bf,0x658c58c2
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
	.word	0x53c4019f,0x320e8e9b,0xbb25df3c,0x0f6ab60c
	.word	0x761826bd,0x1b920c31,0x2cdf8d97,0xa6073e89
	.word	0x10991041,0x18de0d21,0x22328d95,0xa9f1f880
	.word	0x69c3ebaa,0x82175f60,0x326703ff,0xc53b4843
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
	.word	0x5615b10c,0x015a17e2,0xee0c37d4,0x3955b436
	.word	0xee212de2,0xdad8babc,0x1dd24596,0xe540ad68
	.word	0xc9d08f27,0xc7f646f8,0xd35b230c,0xaf540439
	.word	0x01a40651,0x753b2201,0x5245adbc,0x727e0c6e
	.word	0xcd037c22,0xfd8baf11,0x67a79b1e,0x372d2507
	.word	0x88a28fae,0x48ba86d9,0x3578ed6a,0x41ddeefb
	.word	0x0ab7bc8c,0x25c7414e,0x67c33deb,0x0ba9330f
	.word	0x81480e60,0xa7f6290c,0x1a7869f4,0xe6d2db65
	.word	0x5f882fea,0x4dbe3dad,0x385db13d,0x9db78a28
	.word	0xb271a819,0x04c06a10,0x1c862684,0xb150beb4
	.word	0xc45d957f,0xdba2f488,0x881105a9,0xfd517907
	.word	0x06ab5088,0x68ddaac7,0xeec92aae,0x89d6ea14
	.word	0x66371e83,0x972cf121,0x4414d856,0x04dcc08c
	.word	0x0950dd8c,0x9654b2d2,0xcb29a729,0x5976cc00
	.word	0x4eee6a09,0x6d164213,0xa68d3000,0x4795ad1d
	.word	0x811adb0f,0xc1dfe8c6,0xa205a490,0xa8010a16
	.word	0x07e800bb,0x6d7321b4,0xd9f755a2,0x6246a921
	.word	0x625d8d5d,0x2f5c191e,0x935e83fb,0x4f63c9af
	.word	0x08557ea6,0x82afb257,0xf436b27d,0xcec34230
	.word	0xe93cbed8,0xff9d96ca,0xcd2249f0,0x0acea75c
	.word	0xafb78ed8,0x295bf0dd,0x6ed6a1d1,0xa9d63c08
	.word	0x9b6bb353,0x3ef15835,0x44a88dc4,0x94c62092
	.word	0x63dee986,0x328d2ff2,0x57fd2e3e,0x4826bc10
	.word	0x9b547eb8,0x66f87be0,0x79ea74bb,0x69207753
	.word	0x78605c6d,0x337a0b2e,0x177e3470,0xe297850c
	.word	0x1f4a981d,0xdba68831,0xd6f8a405,0x22576acc
	.word	0xd4818bcd,0x248d1b50,0x8a693540,0x18341323
	.word	0xef5d7a3b,0xdacf5e20,0xb339257f,0x434f1ae9
	.word	0xadae5345,0xa93d1c8a,0xc30378ce,0xbe5b5658
	.word	0x9e634f98,0x4632924c,0x50b29f2c,0x3c88eb0a
	.word	0x50f1b437,0xf5c1a706,0xd698de9a,0x581dd470
	.word	0xe050658c,0x8b0eafeb,0x6f9dd3c5,0xa6a3ee18
share3_end:
