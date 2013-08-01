/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_5000_13.s
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
!	Seed = 327144532
!	Riesling can be on
!	1 Thread, 5000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_5000_13.s created on Mar 27, 2009 (14:45:32)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_5000_13 -p 1 -l 5000

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
!	%f0  = f39cc6a7 48be2c46 fc85f6c1 b6dc03f7
!	%f4  = 1d640593 a043c46b 51c08f46 a5d58f41
!	%f8  = 1d9baa08 5cf0920f 526dbf34 9b6c8902
!	%f12 = 28a23c66 21448ed6 cf7c6fb2 d13860b0
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 320dd6bd 35125a58 4730ebb1 7033a5bf
!	%f20 = a6559a15 80cf29f1 0cdd5841 8827ff8b
!	%f24 = d5c1bffc 143c9bf7 15134c3f 84fc0eca
!	%f28 = 7f9c730e ea39e015 6c21f9a6 db7bb23b
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 5bfa5bfd 159710e1 54bf3ce2 49e9e232
!	%f36 = 138ca10a 417d0552 ec757c55 8e9bb5b5
!	%f40 = 831e9dd8 223f3cc2 5b6c53c6 728d3a1d
!	%f44 = c9768f0d 4830f175 f42cde79 e1df1896
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0xdee4c2b70000002e,%g7,%g1 ! GSR scale =  5, align = 6
	wr	%g1,%g0,%gsr		! GSR = dee4c2b70000002e
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	%l0 = e50d1e7a, %l1 = ec4329bf, Mem[0000000010101408] = 5815682f 9398c70e
	stda	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = e50d1e7a ec4329bf
!	Mem[0000000010101434] = cbfa3a6b, %l5 = 153b09787f1003db, %asi = 80
	swapa	[%i4+0x034]%asi,%l5	! %l5 = 00000000cbfa3a6b
!	Mem[0000000010141408] = f75236f00cbeddd8, %l2 = 27e2476aa012cf1e
	ldxa	[%i5+%o4]0x80,%l2	! %l2 = f75236f00cbeddd8
!	%l4 = 75ea3b53, %l5 = cbfa3a6b, Mem[0000000010181410] = 08adeaa2 062b6287
	stda	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 75ea3b53 cbfa3a6b
!	Mem[0000000030141408] = fc4379c9, %f6  = 51c08f46
	lda	[%i5+%o4]0x89,%f6 	! %f6 = fc4379c9
!	Mem[0000000010041400] = e17edee865280f71, %l1 = 3f84da0eec4329bf
	ldxa	[%i1+%g0]0x88,%l1	! %l1 = e17edee865280f71
!	Mem[0000000030181410] = 2b9ea6eeecbfc551, %l0 = f4bc3e19e50d1e7a
	ldxa	[%i6+%o5]0x81,%l0	! %l0 = 2b9ea6eeecbfc551
!	Mem[0000000010081428] = 26ea8c9d 3f44c0c9, %l2 = 0cbeddd8, %l3 = 78a50f5e
	ldda	[%i2+0x028]%asi,%l2	! %l2 = 0000000026ea8c9d 000000003f44c0c9
!	Mem[0000000010001410] = 61b70fed, %f4  = 1d640593
	lda	[%i0+%o5]0x88,%f4 	! %f4 = 61b70fed
!	Starting 10 instruction Store Burst
!	%l4 = 212e445675ea3b53, Mem[0000000030001408] = 4f747b78
	stba	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 53747b78

p0_label_2:
!	Mem[0000000010141400] = 19959934, %l7 = 287b9dda6c7d152c
	ldstuba	[%i5+%g0]0x88,%l7	! %l7 = 00000034000000ff
!	%f30 = 6c21f9a6 db7bb23b, %l1 = e17edee865280f71
!	Mem[0000000030101430] = ae22a1a65b4b93ef
	add	%i4,0x030,%g1
	stda	%f30,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030101430] = 3b22a1a6a6f921ef
!	Mem[0000000010041408] = b81e0a20, %l1 = e17edee865280f71
	ldstuba	[%i1+%o4]0x80,%l1	! %l1 = 000000b8000000ff
!	%f22 = 0cdd5841 8827ff8b, Mem[0000000010101410] = e7a9f897 16e5f923
	stda	%f22,[%i4+0x010]%asi	! Mem[0000000010101410] = 0cdd5841 8827ff8b
!	%f7  = a5d58f41, Mem[0000000030041410] = c9966ded
	sta	%f7 ,[%i1+%o5]0x89	! Mem[0000000030041410] = a5d58f41
!	%l0 = 2b9ea6eeecbfc551, Mem[0000000010081400] = 39f13ad6
	stwa	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = ecbfc551
!	%f21 = 80cf29f1, Mem[0000000010001430] = fdbaf665
	st	%f21,[%i0+0x030]	! Mem[0000000010001430] = 80cf29f1
!	Mem[0000000010081408] = fde3373e, %l5 = 00000000cbfa3a6b
	swapa	[%i2+%o4]0x80,%l5	! %l5 = 00000000fde3373e
!	%l5 = 00000000fde3373e, imm = fffffffffffff3f6, %l4 = 212e445675ea3b53
	and	%l5,-0xc0a,%l4		! %l4 = 00000000fde33336
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = edbe58a5, %l6 = 06f94fc7d14627ad
	ldsba	[%i3+%o5]0x88,%l6	! %l6 = ffffffffffffffa5

p0_label_3:
!	Mem[0000000010041400] = 710f2865 e8de7ee1, %l6 = ffffffa5, %l7 = 00000034
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 00000000710f2865 00000000e8de7ee1
!	Mem[00000000211c0000] = f2ae3487, %l1 = 00000000000000b8
	ldsha	[%o2+0x000]%asi,%l1	! %l1 = fffffffffffff2ae
!	Mem[0000000030041400] = dc4d9892, %l5 = 00000000fde3373e
	ldsha	[%i1+%g0]0x81,%l5	! %l5 = ffffffffffffdc4d
!	Mem[00000000100c1400] = 16603cfe, %l1 = fffffffffffff2ae
	lduba	[%i3+%g0]0x88,%l1	! %l1 = 00000000000000fe
!	Mem[0000000030081400] = 4a8af402, %l7 = 00000000e8de7ee1
	lduwa	[%i2+%g0]0x81,%l7	! %l7 = 000000004a8af402
!	Mem[0000000010081408] = 6b3afacb, %l4 = 00000000fde33336
	lduha	[%i2+%o4]0x88,%l4	! %l4 = 000000000000facb
!	Mem[00000000300c1400] = 2148e616, %l0 = 2b9ea6eeecbfc551
	lduwa	[%i3+%g0]0x89,%l0	! %l0 = 000000002148e616
!	Mem[0000000010181400] = 2173b11c, %l3 = 000000003f44c0c9
	ldswa	[%i6+%g0]0x80,%l3	! %l3 = 000000002173b11c
!	%f13 = 21448ed6, %f23 = 8827ff8b, %f24 = d5c1bffc
	fadds	%f13,%f23,%f24		! %f24 = 21448ed6
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 54c150b9, %l3 = 000000002173b11c
	ldstuba	[%i4+%o4]0x89,%l3	! %l3 = 000000b9000000ff

p0_label_4:
!	Mem[0000000010181408] = 4e65fcfe, %l1 = 00000000000000fe
	ldstuba	[%i6+%o4]0x80,%l1	! %l1 = 0000004e000000ff
!	%l2 = 0000000026ea8c9d, Mem[0000000030041408] = ea6c8af0
	stba	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = ea6c8a9d
!	%f2  = fc85f6c1 b6dc03f7, %l2 = 0000000026ea8c9d
!	Mem[0000000030041428] = 4050e94a123ff582
	add	%i1,0x028,%g1
	stda	%f2,[%g1+%l2]ASI_PST16_S ! Mem[0000000030041428] = fc85f6c1123f03f7
!	%l0 = 000000002148e616, Mem[0000000010101410] = 0cdd5841
	stha	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = e6165841
!	%f0  = f39cc6a7 48be2c46 fc85f6c1 b6dc03f7
!	%f4  = 61b70fed a043c46b fc4379c9 a5d58f41
!	%f8  = 1d9baa08 5cf0920f 526dbf34 9b6c8902
!	%f12 = 28a23c66 21448ed6 cf7c6fb2 d13860b0
	stda	%f0,[%i4]ASI_BLK_AIUPL	! Block Store to 0000000010101400
!	%f26 = 15134c3f, Mem[0000000030041400] = 92984ddc
	sta	%f26,[%i1+%g0]0x89	! Mem[0000000030041400] = 15134c3f
!	%l2 = 26ea8c9d, %l3 = 000000b9, Mem[0000000010101410] = 6bc443a0 ed0fb761
	stda	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = 26ea8c9d 000000b9
!	%f30 = 6c21f9a6 db7bb23b, %l0 = 000000002148e616
!	Mem[0000000010101410] = 26ea8c9d000000b9
	add	%i4,0x010,%g1
	stda	%f30,[%g1+%l0]ASI_PST8_P ! Mem[0000000010101410] = 26ea8ca6007bb2b9
!	%l2 = 26ea8c9d, %l3 = 000000b9, Mem[0000000010181400] = 2173b11c 71170288
	std	%l2,[%i6+%g0]		! Mem[0000000010181400] = 26ea8c9d 000000b9
!	Starting 10 instruction Load Burst
!	%l2 = 0000000026ea8c9d, %l5 = ffffffffffffdc4d, %l3 = 00000000000000b9
	or	%l2,%l5,%l3		! %l3 = ffffffffffffdcdd

p0_label_5:
!	Mem[0000000010141410] = 69881b8b, %l7 = 000000004a8af402
	ldsba	[%i5+%o5]0x88,%l7	! %l7 = ffffffffffffff8b
!	Mem[0000000030001400] = f9f8d44f dbc71980, %l6 = 710f2865, %l7 = ffffff8b
	ldda	[%i0+%g0]0x89,%l6	! %l6 = 00000000dbc71980 00000000f9f8d44f
!	Mem[0000000010081410] = c5c917bf, %l5 = ffffffffffffdc4d
	ldsb	[%i2+%o5],%l5		! %l5 = ffffffffffffffc5
!	Mem[0000000010041408] = b8181461200a1eff, %f22 = 0cdd5841 8827ff8b
	ldda	[%i1+%o4]0x88,%f22	! %f22 = b8181461 200a1eff
!	Mem[00000000218000c0] = f3df5cf4, %l2 = 0000000026ea8c9d
	ldsh	[%o3+0x0c0],%l2		! %l2 = fffffffffffff3df
!	Mem[0000000010181414] = cbfa3a6b, %l5 = ffffffffffffffc5
	ldsw	[%i6+0x014],%l5		! %l5 = ffffffffcbfa3a6b
!	Mem[0000000030081400] = 4a8af4022b6b46ed, %f22 = b8181461 200a1eff
	ldda	[%i2+%g0]0x81,%f22	! %f22 = 4a8af402 2b6b46ed
!	Mem[00000000100c1400] = 16603cfe, %l1 = 000000000000004e
	ldsba	[%i3+%g0]0x88,%l1	! %l1 = fffffffffffffffe
!	Mem[0000000030081410] = 65367a38, %l7 = 00000000f9f8d44f
	ldswa	[%i2+%o5]0x89,%l7	! %l7 = 0000000065367a38
!	Starting 10 instruction Store Burst
!	%l6 = 00000000dbc71980, Mem[0000000030081410] = 65367a38
	stha	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 65361980

p0_label_6:
!	%f20 = a6559a15 80cf29f1, Mem[0000000010101408] = f703dcb6 c1f685fc
	stda	%f20,[%i4+%o4]0x80	! Mem[0000000010101408] = a6559a15 80cf29f1
!	%f16 = 320dd6bd 35125a58, Mem[0000000010141408] = f75236f0 0cbeddd8
	stda	%f16,[%i5+%o4]0x80	! Mem[0000000010141408] = 320dd6bd 35125a58
!	Mem[0000000021800081] = 5724899f, %l5 = ffffffffcbfa3a6b
	ldstuba	[%o3+0x081]%asi,%l5	! %l5 = 00000024000000ff
!	%l0 = 000000002148e616, Mem[0000000030041400] = 08543e1b15134c3f
	stxa	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000002148e616
!	%l6 = 00000000dbc71980, Mem[0000000030001410] = 83bc2e9a
	stwa	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = dbc71980
!	%l1 = fffffffffffffffe, Mem[0000000030001410] = 8019c7db
	stwa	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = fffffffe
!	%f22 = 4a8af402 2b6b46ed, Mem[0000000010101408] = 159a55a6 f129cf80
	stda	%f22,[%i4+%o4]0x88	! Mem[0000000010101408] = 4a8af402 2b6b46ed
!	%l1 = fffffffffffffffe, Mem[0000000010041400] = 65280f71
	stwa	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = fffffffe
!	Mem[0000000010001400] = 63481de6, %l3 = ffffffffffffdcdd
	ldstuba	[%i0+%g0]0x88,%l3	! %l3 = 000000e6000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010101408] = 2b6b46ed, %l0 = 000000002148e616
	ldswa	[%i4+%o4]0x88,%l0	! %l0 = 000000002b6b46ed

p0_label_7:
!	Mem[00000000100c1408] = dbb62854, %l3 = 00000000000000e6
	ldsba	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000054
!	Mem[0000000010101420] = 0f92f05c, %l7 = 0000000065367a38
	ldswa	[%i4+0x020]%asi,%l7	! %l7 = 000000000f92f05c
!	Mem[0000000010141400] = ff999519, %l5 = 0000000000000024
	ldsha	[%i5+%g0]0x80,%l5	! %l5 = ffffffffffffff99
!	Mem[0000000030141400] = 1ced8689, %l3 = 0000000000000054
	lduwa	[%i5+%g0]0x81,%l3	! %l3 = 000000001ced8689
!	Mem[0000000010181408] = fefc65ff, %l1 = fffffffffffffffe
	lduwa	[%i6+%o4]0x88,%l1	! %l1 = 00000000fefc65ff
!	Mem[0000000030181410] = 2b9ea6ee, %f31 = db7bb23b
	lda	[%i6+%o5]0x81,%f31	! %f31 = 2b9ea6ee
!	Mem[0000000030141408] = fc4379c9, %f29 = ea39e015
	lda	[%i5+%o4]0x89,%f29	! %f29 = fc4379c9
!	Mem[0000000030081400] = ed466b2b02f48a4a, %f6  = fc4379c9 a5d58f41
	ldda	[%i2+%g0]0x89,%f6 	! %f6  = ed466b2b 02f48a4a
!	Mem[0000000010001408] = 5df46410, %l0 = 000000002b6b46ed
	lduba	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000010
!	Starting 10 instruction Store Burst
!	%f8  = 1d9baa08 5cf0920f, Mem[00000000100c1438] = a6fb99df db4a3c25
	std	%f8 ,[%i3+0x038]	! Mem[00000000100c1438] = 1d9baa08 5cf0920f

p0_label_8:
!	Mem[0000000030101408] = 54c150ff, %l0 = 0000000000000010
	ldstuba	[%i4+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030141400] = 8986ed1c, %l5 = ffffffffffffff99
	ldstuba	[%i5+%g0]0x89,%l5	! %l5 = 0000001c000000ff
!	%l5 = 000000000000001c, Mem[0000000010141408] = 320dd6bd
	stba	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 1c0dd6bd
!	Mem[0000000010081422] = bada2108, %l4 = 000000000000facb
	ldstub	[%i2+0x022],%l4		! %l4 = 00000021000000ff
!	%l6 = 00000000dbc71980, Mem[0000000010141410] = 69881b8b
	stwa	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = dbc71980
!	Mem[0000000030001410] = feffffff, %l5 = 000000000000001c
	swapa	[%i0+%o5]0x81,%l5	! %l5 = 00000000feffffff
!	%f30 = 6c21f9a6 2b9ea6ee, Mem[0000000030081400] = 02f48a4a ed466b2b
	stda	%f30,[%i2+%g0]0x89	! Mem[0000000030081400] = 6c21f9a6 2b9ea6ee
!	Mem[0000000030141410] = 27b7eca1, %l1 = 00000000fefc65ff
	swapa	[%i5+%o5]0x81,%l1	! %l1 = 0000000027b7eca1
!	Mem[0000000010001408] = 1064f45d2add9ada, %l1 = 0000000027b7eca1, %l3 = 000000001ced8689
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l1,%l3	! %l3 = 1064f45d2add9ada
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ed466b2b, %l2 = fffffffffffff3df
	ldsha	[%i4+%o4]0x80,%l2	! %l2 = ffffffffffffed46

p0_label_9:
!	%l3 = 1064f45d2add9ada, imm = fffffffffffffdd0, %l6 = 00000000dbc71980
	sub	%l3,-0x230,%l6		! %l6 = 1064f45d2add9d0a
!	Mem[00000000100c1400] = 16603cfe, %l3 = 1064f45d2add9ada
	lduwa	[%i3+%g0]0x88,%l3	! %l3 = 0000000016603cfe
!	Mem[0000000010081400] = 7f77882cecbfc551, %f10 = 526dbf34 9b6c8902
	ldda	[%i2+%g0]0x88,%f10	! %f10 = 7f77882c ecbfc551
!	Mem[0000000030141410] = fefc65ff, %l2 = ffffffffffffed46
	ldsha	[%i5+%o5]0x81,%l2	! %l2 = fffffffffffffefc
!	Mem[0000000010181400] = 26ea8c9d, %l2 = fffffffffffffefc
	ldsha	[%i6+%g0]0x80,%l2	! %l2 = 00000000000026ea
!	Mem[0000000010101400] = 48be2c46, %f6  = ed466b2b
	lda	[%i4+%g0]0x88,%f6 	! %f6 = 48be2c46
!	Mem[0000000010041408] = ff1e0a20, %l3 = 0000000016603cfe
	ldswa	[%i1+%o4]0x80,%l3	! %l3 = ffffffffff1e0a20
!	Mem[0000000010041408] = b8181461 200a1eff, %l6 = 2add9d0a, %l7 = 0f92f05c
	ldda	[%i1+%o4]0x88,%l6	! %l6 = 00000000200a1eff 00000000b8181461
!	Mem[0000000010101410] = 26ea8ca6, %l0 = 00000000000000ff
	lduba	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000026
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000026ea, Mem[0000000010081410] = c5c917bf, %asi = 80
	stwa	%l2,[%i2+0x010]%asi	! Mem[0000000010081410] = 000026ea

p0_label_10:
!	%f15 = d13860b0, %f28 = 7f9c730e, %f20 = a6559a15 80cf29f1
	fsmuld	%f15,%f28,%f20		! %f20 = 7ffb8e61 c0000000
!	%f24 = 21448ed6 143c9bf7, Mem[0000000010081418] = 4a9f9776 f4826b60
	std	%f24,[%i2+0x018]	! Mem[0000000010081418] = 21448ed6 143c9bf7
!	%l4 = 00000021, %l5 = feffffff, Mem[0000000010041410] = 43f784ad 11540e05
	stda	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000021 feffffff
!	Mem[0000000010101410] = a68cea26, %l5 = 00000000feffffff
	swapa	[%i4+%o5]0x88,%l5	! %l5 = 00000000a68cea26
!	Mem[0000000010081410] = 000026ea, %l1 = 0000000027b7eca1
	ldstuba	[%i2+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%f14 = cf7c6fb2, Mem[00000000300c1400] = 16e64821
	sta	%f14,[%i3+%g0]0x81	! Mem[00000000300c1400] = cf7c6fb2
!	%l5 = 00000000a68cea26, Mem[0000000010081408] = cbfa3a6b
	stha	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = ea263a6b
!	Mem[0000000010181410] = 75ea3b53, %l3 = ffffffffff1e0a20
	swapa	[%i6+%o5]0x80,%l3	! %l3 = 0000000075ea3b53
!	Mem[00000000100c1408] = 5428b6dba8089df4, %l0 = 0000000000000026, %l4 = 0000000000000021
	add	%i3,0x08,%g1
	casxa	[%g1]0x80,%l0,%l4	! %l4 = 5428b6dba8089df4
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 200a1eff, %l7 = 00000000b8181461
	ldsha	[%i1+%o4]0x88,%l7	! %l7 = 0000000000001eff

p0_label_11:
!	Mem[0000000010181408] = ff65fcfe, %l3 = 0000000075ea3b53
	ldswa	[%i6+%o4]0x80,%l3	! %l3 = ffffffffff65fcfe
!	Mem[0000000030041410] = a5d58f41, %f24 = 21448ed6
	lda	[%i1+%o5]0x89,%f24	! %f24 = a5d58f41
!	Mem[0000000010081408] = ea263a6b50157c5b, %f24 = a5d58f41 143c9bf7
	ldda	[%i2+%o4]0x80,%f24	! %f24 = ea263a6b 50157c5b
!	Mem[0000000030141408] = c97943fc, %l1 = 0000000000000000
	lduha	[%i5+%o4]0x81,%l1	! %l1 = 000000000000c979
!	Mem[0000000010181400] = 9d8cea26, %l3 = ffffffffff65fcfe
	lduwa	[%i6+%g0]0x88,%l3	! %l3 = 000000009d8cea26
!	Mem[0000000010081410] = ea2600ff, %l4 = 5428b6dba8089df4
	ldswa	[%i2+%o5]0x88,%l4	! %l4 = ffffffffea2600ff
!	Mem[0000000030101410] = 1fffc6b5, %l6 = 00000000200a1eff
	lduba	[%i4+%o5]0x89,%l6	! %l6 = 00000000000000b5
!	Mem[0000000030041410] = a5d58f41, %l4 = ffffffffea2600ff
	lduba	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000041
!	Mem[0000000030141400] = ffed8689, %l3 = 000000009d8cea26
	lduba	[%i5+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ff, Mem[0000000010101408] = ed466b2b02f48a4a
	stxa	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000000000ff

p0_label_12:
!	%l3 = 00000000000000ff, Mem[0000000030041408] = ea6c8a9d
	stha	%l3,[%i1+%o4]0x89	! Mem[0000000030041408] = ea6c00ff
!	Mem[0000000010181408] = ff65fcfe, %l1 = 000000000000c979
	ldstuba	[%i6+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000020800000] = 8b9f4ebd, %l5 = 00000000a68cea26
	ldstuba	[%o1+0x000]%asi,%l5	! %l5 = 0000008b000000ff
!	%l6 = 00000000000000b5, Mem[0000000030101408] = 54c150ff
	stha	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 54c100b5
!	Mem[0000000010001401] = ff1d4863, %l5 = 000000000000008b
	ldstuba	[%i0+0x001]%asi,%l5	! %l5 = 0000001d000000ff
!	%f28 = 7f9c730e fc4379c9, Mem[0000000010141410] = 8019c7db 02c7b506
	stda	%f28,[%i5+0x010]%asi	! Mem[0000000010141410] = 7f9c730e fc4379c9
!	Mem[0000000010001403] = ffff4863, %l2 = 00000000000026ea
	ldstuba	[%i0+0x003]%asi,%l2	! %l2 = 00000063000000ff
!	%l3 = 00000000000000ff, Mem[0000000010041400] = e17edee8fffffffe
	stxa	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000000000ff
!	Mem[0000000010001400] = ff48ffff, %l3 = 00000000000000ff
	ldstuba	[%i0+%g0]0x88,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = cf7c6fb2, %l2 = 0000000000000063
	lduba	[%i3+%g0]0x81,%l2	! %l2 = 00000000000000cf

p0_label_13:
!	Mem[0000000030041408] = ea6c00ff, %l1 = 00000000000000ff
	lduha	[%i1+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181408] = 9d1fe08f 830600c3, %l2 = 000000cf, %l3 = 000000ff
	ldda	[%i6+%o4]0x81,%l2	! %l2 = 000000009d1fe08f 00000000830600c3
!	Mem[0000000010101408] = 00000000, %l1 = 00000000000000ff
	lduha	[%i4+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101400] = f49d17c9, %f23 = 2b6b46ed
	lda	[%i4+%g0]0x89,%f23	! %f23 = f49d17c9
!	Mem[0000000030101410] = b5c6ff1f 24b25d04, %l6 = 000000b5, %l7 = 00001eff
	ldda	[%i4+%o5]0x81,%l6	! %l6 = 00000000b5c6ff1f 0000000024b25d04
!	Code Fragment 4
p0_fragment_1:
!	%l0 = 0000000000000026
	setx	0xaf0d032faed5d09a,%g7,%l0 ! %l0 = af0d032faed5d09a
!	%l1 = 0000000000000000
	setx	0x56df64a0557be9fc,%g7,%l1 ! %l1 = 56df64a0557be9fc
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = af0d032faed5d09a
	setx	0x6c397dafb9c5da40,%g7,%l0 ! %l0 = 6c397dafb9c5da40
!	%l1 = 56df64a0557be9fc
	setx	0x26ff47a79a637595,%g7,%l1 ! %l1 = 26ff47a79a637595
!	Mem[00000000201c0000] = 4b868ea0, %l1 = 26ff47a79a637595
	ldsha	[%o0+0x000]%asi,%l1	! %l1 = 0000000000004b86
!	Mem[0000000010141424] = cae1d280, %l6 = 00000000b5c6ff1f
	ldsh	[%i5+0x024],%l6		! %l6 = ffffffffffffcae1
!	Mem[0000000010041408] = ff1e0a20, %l1 = 0000000000004b86
	ldsha	[%i1+%o4]0x80,%l1	! %l1 = ffffffffffffff1e
!	Starting 10 instruction Store Burst
!	%l6 = ffffcae1, %l7 = 24b25d04, Mem[0000000030141410] = fefc65ff c010e87f
	stda	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffcae1 24b25d04

p0_label_14:
!	%l5 = 000000000000001d, Mem[0000000010041408] = 200a1eff
	stwa	%l5,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000001d
!	%l7 = 0000000024b25d04, Mem[0000000010181400] = 26ea8c9d000000b9
	stxa	%l7,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000000024b25d04
!	%f16 = 320dd6bd 35125a58, Mem[0000000030101400] = f49d17c9 1d043ac1
	stda	%f16,[%i4+%g0]0x89	! Mem[0000000030101400] = 320dd6bd 35125a58
!	Mem[0000000010041410] = 00000021, %l2 = 9d1fe08f, %l4 = 00000041
	add	%i1,0x10,%g1
	casa	[%g1]0x80,%l2,%l4	! %l4 = 0000000000000021
!	Mem[0000000010001400] = ffff48ff, %l0 = 6c397dafb9c5da40
	swapa	[%i0+%g0]0x80,%l0	! %l0 = 00000000ffff48ff
!	%l0 = 00000000ffff48ff, imm = 0000000000000f03, %l1 = ffffffffffffff1e
	or	%l0,0xf03,%l1		! %l1 = 00000000ffff4fff
!	%f20 = 7ffb8e61 c0000000, Mem[0000000010041408] = 1d000000 611418b8
	stda	%f20,[%i1+0x008]%asi	! Mem[0000000010041408] = 7ffb8e61 c0000000
!	%l7 = 0000000024b25d04, Mem[0000000010041406] = 00000000, %asi = 80
	stha	%l7,[%i1+0x006]%asi	! Mem[0000000010041404] = 00005d04
!	%f24 = ea263a6b, %f20 = 7ffb8e61, %f10 = 7f77882c
	fsubs	%f24,%f20,%f10		! %f10 = 7ffb8e61
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 16603cfe, %l6 = ffffffffffffcae1
	ldsha	[%i3+%g0]0x88,%l6	! %l6 = 0000000000003cfe

p0_label_15:
!	Mem[0000000010101410] = fffffffe007bb2b9, %l3 = 00000000830600c3
	ldx	[%i4+%o5],%l3		! %l3 = fffffffe007bb2b9
!	Mem[0000000030181400] = 07726d25 5fb15375, %l2 = 9d1fe08f, %l3 = 007bb2b9
	ldda	[%i6+%g0]0x81,%l2	! %l2 = 0000000007726d25 000000005fb15375
!	Mem[0000000010081430] = befd4d0d8b21c72e, %l6 = 0000000000003cfe
	ldxa	[%i2+0x030]%asi,%l6	! %l6 = befd4d0d8b21c72e
!	Mem[0000000030001410] = 0000001c, %l5 = 000000000000001d
	lduba	[%i0+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = 51c5bfec, %f26 = 15134c3f
	lda	[%i2+%g0]0x80,%f26	! %f26 = 51c5bfec
!	Mem[0000000010041400] = 045d0000000000ff, %f12 = 28a23c66 21448ed6
	ldda	[%i1+%g0]0x88,%f12	! %f12 = 045d0000 000000ff
!	Mem[0000000030041408] = 6db70ae3ea6c00ff, %l5 = 0000000000000000
	ldxa	[%i1+%o4]0x89,%l5	! %l5 = 6db70ae3ea6c00ff
!	Mem[00000000201c0000] = 4b868ea0, %l1 = 00000000ffff4fff
	ldsh	[%o0+%g0],%l1		! %l1 = 0000000000004b86
!	Mem[0000000010081428] = 26ea8c9d 3f44c0c9, %l0 = ffff48ff, %l1 = 00004b86
	ldd	[%i2+0x028],%l0		! %l0 = 0000000026ea8c9d 000000003f44c0c9
!	Starting 10 instruction Store Burst
!	Mem[0000000021800140] = ad23cf8d, %l1 = 000000003f44c0c9
	ldstub	[%o3+0x140],%l1		! %l1 = 000000ad000000ff

p0_label_16:
!	%l6 = 8b21c72e, %l7 = 24b25d04, Mem[0000000010081430] = befd4d0d 8b21c72e
	std	%l6,[%i2+0x030]		! Mem[0000000010081430] = 8b21c72e 24b25d04
!	Mem[00000000300c1408] = 55dc5cc4, %l0 = 0000000026ea8c9d
	swapa	[%i3+%o4]0x89,%l0	! %l0 = 0000000055dc5cc4
!	%l6 = befd4d0d8b21c72e, Mem[0000000010141410] = 0e739c7f
	stwa	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 8b21c72e
!	%l6 = 8b21c72e, %l7 = 24b25d04, Mem[0000000010081410] = ff0026ea ba7de628
	stda	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 8b21c72e 24b25d04
!	%l4 = 00000021, %l5 = ea6c00ff, Mem[0000000010001410] = 61b70fed 6470cfa3
	stda	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000021 ea6c00ff
!	%l4 = 00000021, %l5 = ea6c00ff, Mem[00000000300c1410] = 1bb1f387 6813263b
	stda	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000021 ea6c00ff
!	%l2 = 0000000007726d25, Mem[0000000020800040] = c385c0bd
	sth	%l2,[%o1+0x040]		! Mem[0000000020800040] = 6d25c0bd
!	%l6 = befd4d0d8b21c72e, Mem[00000000100c1408] = 5428b6db
	stha	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = c72eb6db
!	Mem[0000000010141408] = 1c0dd6bd, %l2 = 0000000007726d25
	swapa	[%i5+%o4]0x80,%l2	! %l2 = 000000001c0dd6bd
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000010141400] = ff999519 9f18e0cf 07726d25 35125a58
!	Mem[0000000010141410] = 2ec7218b fc4379c9 15ac4e47 9913b744
!	Mem[0000000010141420] = 600125e4 cae1d280 905f0c6b b8be5233
!	Mem[0000000010141430] = 70d3875f 13e2f1c8 24943b85 b7730672
	ldda	[%i5]ASI_BLK_P,%f16	! Block Load from 0000000010141400

p0_label_17:
!	Mem[0000000030141408] = c97943fc 25dcf2ea, %l0 = 55dc5cc4, %l1 = 000000ad
	ldda	[%i5+%o4]0x81,%l0	! %l0 = 00000000c97943fc 0000000025dcf2ea
!	Mem[0000000030081408] = fcc2a29f, %l2 = 000000001c0dd6bd
	ldsba	[%i2+%o4]0x81,%l2	! %l2 = fffffffffffffffc
!	Mem[0000000030081400] = eea69e2b, %f2  = fc85f6c1
	lda	[%i2+%g0]0x81,%f2 	! %f2 = eea69e2b
!	Mem[00000000100c1410] = edbe58a5, %l5 = 6db70ae3ea6c00ff
	ldsba	[%i3+%o5]0x88,%l5	! %l5 = ffffffffffffffa5
!	Mem[0000000010141410] = 8b21c72e, %l3 = 000000005fb15375
	lduwa	[%i5+%o5]0x88,%l3	! %l3 = 000000008b21c72e
!	Mem[0000000010101434] = 663ca228, %l1 = 0000000025dcf2ea
	ldsw	[%i4+0x034],%l1		! %l1 = 00000000663ca228
!	%l0 = 00000000c97943fc, %l1 = 00000000663ca228, %l1 = 00000000663ca228
	andn	%l0,%l1,%l1		! %l1 = 00000000894141d4
!	Mem[0000000030101410] = b5c6ff1f, %l5 = ffffffffffffffa5
	lduha	[%i4+%o5]0x81,%l5	! %l5 = 000000000000b5c6
!	Mem[0000000010141430] = 70d3875f13e2f1c8, %l6 = befd4d0d8b21c72e
	ldxa	[%i5+0x030]%asi,%l6	! %l6 = 70d3875f13e2f1c8
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 7b68038dedbe58a5, %f4  = 61b70fed a043c46b
	ldda	[%i3+%o5]0x88,%f4 	! %f4  = 7b68038d edbe58a5

p0_label_18:
	membar	#Sync			! Added by membar checker (3)
!	%f0  = f39cc6a7, Mem[0000000010141408] = 256d7207
	sta	%f0 ,[%i5+%o4]0x88	! Mem[0000000010141408] = f39cc6a7
!	Mem[0000000010181434] = 12d66d1b, %l1 = 00000000894141d4
	swap	[%i6+0x034],%l1		! %l1 = 0000000012d66d1b
!	Mem[0000000010041408] = 7ffb8e61, %l3 = 000000008b21c72e
	swapa	[%i1+%o4]0x80,%l3	! %l3 = 000000007ffb8e61
!	%l6 = 13e2f1c8, %l7 = 24b25d04, Mem[0000000010101410] = fffffffe 007bb2b9
	stda	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 13e2f1c8 24b25d04
!	Mem[0000000021800100] = 06900b85, %l4 = 0000000000000021
	ldstuba	[%o3+0x100]%asi,%l4	! %l4 = 00000006000000ff
!	Mem[00000000300c1410] = 00000021, %l5 = 000000000000b5c6
	ldstuba	[%i3+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1408] = c72eb6db, %l6 = 70d3875f13e2f1c8
	ldstuba	[%i3+%o4]0x80,%l6	! %l6 = 000000c7000000ff
!	%f20 = 2ec7218b, Mem[0000000030101410] = 1fffc6b5
	sta	%f20,[%i4+%o5]0x89	! Mem[0000000030101410] = 2ec7218b
!	%l5 = 0000000000000000, Mem[0000000010041428] = 60e825070113c6ed
	stx	%l5,[%i1+0x028]		! Mem[0000000010041428] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = a7c69cf3, %l0 = 00000000c97943fc
	ldsha	[%i5+%o4]0x80,%l0	! %l0 = ffffffffffffa7c6

p0_label_19:
!	Mem[0000000010041408] = 2ec7218b, %l4 = 0000000000000006
	lduwa	[%i1+%o4]0x88,%l4	! %l4 = 000000002ec7218b
!	Mem[0000000030041400] = 16e64821 00000000, %l0 = ffffa7c6, %l1 = 12d66d1b
	ldda	[%i1+%g0]0x81,%l0	! %l0 = 0000000016e64821 0000000000000000
!	Mem[0000000030181408] = 9d1fe08f830600c3, %f12 = 045d0000 000000ff
	ldda	[%i6+%o4]0x81,%f12	! %f12 = 9d1fe08f 830600c3
!	Mem[0000000020800040] = 6d25c0bd, %l2 = fffffffffffffffc
	ldsha	[%o1+0x040]%asi,%l2	! %l2 = 0000000000006d25
!	Mem[0000000010081430] = 8b21c72e24b25d04, %f16 = ff999519 9f18e0cf
	ldda	[%i2+0x030]%asi,%f16	! %f16 = 8b21c72e 24b25d04
!	Mem[0000000030141408] = fc4379c9, %l4 = 000000002ec7218b
	ldsha	[%i5+%o4]0x89,%l4	! %l4 = 00000000000079c9
!	Mem[0000000030181408] = c30006838fe01f9d, %l1 = 0000000000000000
	ldxa	[%i6+%o4]0x89,%l1	! %l1 = c30006838fe01f9d
!	Mem[0000000030001400] = f9f8d44f dbc71980, %l4 = 000079c9, %l5 = 00000000
	ldda	[%i0+%g0]0x89,%l4	! %l4 = 00000000dbc71980 00000000f9f8d44f
!	Mem[0000000030041400] = 2148e616, %l3 = 000000007ffb8e61
	ldsha	[%i1+%g0]0x89,%l3	! %l3 = ffffffffffffe616
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1428] = 0d329602, %l4 = 00000000dbc71980
	swap	[%i3+0x028],%l4		! %l4 = 000000000d329602

p0_label_20:
!	%l2 = 0000000000006d25, Mem[0000000010081410] = 8b21c72e
	stba	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 2521c72e
!	%l7 = 0000000024b25d04, Mem[0000000030081410] = 9441f8c965361980
	stxa	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000000024b25d04
!	%f2  = eea69e2b b6dc03f7, Mem[0000000030101408] = 54c100b5 0b79b70c
	stda	%f2 ,[%i4+%o4]0x89	! Mem[0000000030101408] = eea69e2b b6dc03f7
!	%l0 = 16e64821, %l1 = 8fe01f9d, Mem[0000000030101410] = 2ec7218b 045db224
	stda	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 16e64821 8fe01f9d
!	%l7 = 0000000024b25d04, Mem[0000000030101410] = 16e64821
	stwa	%l7,[%i4+%o5]0x89	! Mem[0000000030101410] = 24b25d04
!	Mem[0000000010181400] = 00000000, %l6 = 00000000000000c7
	swapa	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030001410] = 0000001c
	stwa	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	%f24 = 600125e4, Mem[0000000010081410] = 2521c72e
	sta	%f24,[%i2+%o5]0x80	! Mem[0000000010081410] = 600125e4
!	Mem[0000000010101400] = 48be2c46, %l2 = 0000000000006d25
	swapa	[%i4+%g0]0x88,%l2	! %l2 = 0000000048be2c46
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 000000ff, %l5 = 00000000f9f8d44f
	lduba	[%i1+%g0]0x88,%l5	! %l5 = 00000000000000ff

p0_label_21:
!	Mem[0000000010181408] = fefc65ff, %l3 = ffffffffffffe616
	ldsha	[%i6+%o4]0x88,%l3	! %l3 = 00000000000065ff
!	Mem[0000000030041408] = 6db70ae3ea6c00ff, %l7 = 0000000024b25d04
	ldxa	[%i1+%o4]0x89,%l7	! %l7 = 6db70ae3ea6c00ff
!	Mem[0000000030141408] = fc4379c9, %f3  = b6dc03f7
	lda	[%i5+%o4]0x89,%f3 	! %f3 = fc4379c9
!	Mem[0000000030001410] = 00000000e5842e71, %f22 = 15ac4e47 9913b744
	ldda	[%i0+%o5]0x81,%f22	! %f22 = 00000000 e5842e71
!	Mem[0000000010041408] = 8b21c72e, %l5 = 00000000000000ff
	lduha	[%i1+%o4]0x80,%l5	! %l5 = 0000000000008b21
!	%l7 = 6db70ae3ea6c00ff, %l3 = 00000000000065ff, %y  = 00000000
	umul	%l7,%l3,%l3		! %l3 = 00005d661df99901, %y = 00005d66
!	Mem[0000000010001408] = da9add2a5df46410, %f12 = 9d1fe08f 830600c3
	ldda	[%i0+%o4]0x88,%f12	! %f12 = da9add2a 5df46410
!	%l3 = 00005d661df99901, imm = fffffffffffff467, %l0 = 0000000016e64821
	sub	%l3,-0xb99,%l0		! %l0 = 00005d661df9a49a
!	Mem[0000000030141408] = c97943fc, %l3 = 00005d661df99901
	ldsha	[%i5+%o4]0x81,%l3	! %l3 = ffffffffffffc979
!	Starting 10 instruction Store Burst
!	%l1 = c30006838fe01f9d, Mem[00000000100c1428] = dbc71980, %asi = 80
	stha	%l1,[%i3+0x028]%asi	! Mem[00000000100c1428] = 1f9d1980

p0_label_22:
!	%l4 = 000000000d329602, %l2 = 0000000048be2c46, %l2 = 0000000048be2c46
	or	%l4,%l2,%l2		! %l2 = 000000004dbebe46
!	Mem[0000000010041434] = 29d07932, %l2 = 000000004dbebe46
	ldstuba	[%i1+0x034]%asi,%l2	! %l2 = 00000029000000ff
!	%f20 = 2ec7218b fc4379c9, Mem[0000000030101408] = f703dcb6 2b9ea6ee
	stda	%f20,[%i4+%o4]0x81	! Mem[0000000030101408] = 2ec7218b fc4379c9
!	%f30 = 24943b85, Mem[0000000010081400] = 51c5bfec
	sta	%f30,[%i2+%g0]0x80	! Mem[0000000010081400] = 24943b85
!	%l1 = c30006838fe01f9d, Mem[0000000010181410] = 6b3afacb200a1eff
	stxa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = c30006838fe01f9d
!	Mem[0000000020800000] = ff9f4ebd, %l1 = c30006838fe01f9d
	ldstub	[%o1+%g0],%l1		! %l1 = 000000ff000000ff
!	%f24 = 600125e4 cae1d280, %l4 = 000000000d329602
!	Mem[0000000030001418] = d980725c8fb2181f
	add	%i0,0x018,%g1
	stda	%f24,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030001418] = d9d2725c8fb2181f
!	Mem[0000000010001410] = 21000000, %l1 = 00000000000000ff
	swapa	[%i0+%o5]0x80,%l1	! %l1 = 0000000021000000
!	%l0 = 1df9a49a, %l1 = 21000000, Mem[0000000010181408] = ff65fcfe 1aba6efd
	stda	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 1df9a49a 21000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ff2eb6db, %l3 = ffffffffffffc979
	ldsha	[%i3+%o4]0x80,%l3	! %l3 = ffffffffffffff2e

p0_label_23:
!	Mem[0000000030101410] = 045db2249d1fe08f, %l0 = 00005d661df9a49a
	ldxa	[%i4+%o5]0x81,%l0	! %l0 = 045db2249d1fe08f
!	Mem[0000000010101430] = d68e4421, %l5 = 0000000000008b21
	lduw	[%i4+0x030],%l5		! %l5 = 00000000d68e4421
!	Mem[0000000030181400] = 256d7207, %l0 = 045db2249d1fe08f
	ldsba	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000007
!	Mem[0000000030001410] = 00000000, %l3 = ffffffffffffff2e
	ldsha	[%i0+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101408] = 8b21c72e, %l1 = 0000000021000000
	lduba	[%i4+%o4]0x89,%l1	! %l1 = 000000000000002e
!	Mem[0000000030001410] = 00000000, %l6 = 0000000000000000
	ldsba	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1410] = ff006cea210000ff, %l5 = 00000000d68e4421
	ldxa	[%i3+%o5]0x89,%l5	! %l5 = ff006cea210000ff
!	Mem[0000000010081410] = e4250160, %f28 = 70d3875f
	lda	[%i2+%o5]0x88,%f28	! %f28 = e4250160
!	%f14 = cf7c6fb2, %f6  = 48be2c46, %f12 = da9add2a 5df46410
	fsmuld	%f14,%f6 ,%f12		! %f12 = c31770d1 caa45580
!	Starting 10 instruction Store Burst
!	%l2 = 00000029, %l3 = 00000000, Mem[0000000010001410] = 000000ff ff006cea
	std	%l2,[%i0+%o5]		! Mem[0000000010001410] = 00000029 00000000

p0_label_24:
!	Mem[00000000300c1408] = 9d8cea26, %l3 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l3	! %l3 = 000000009d8cea26
!	Mem[0000000020800000] = ff9f4ebd, %l3 = 000000009d8cea26
	ldstub	[%o1+%g0],%l3		! %l3 = 000000ff000000ff
!	%l7 = 6db70ae3ea6c00ff, Mem[0000000010001408] = 1064f45d2add9ada, %asi = 80
	stxa	%l7,[%i0+0x008]%asi	! Mem[0000000010001408] = 6db70ae3ea6c00ff
!	Mem[00000000300c1410] = ff000021, %l5 = ff006cea210000ff
	ldstuba	[%i3+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	%l1 = 000000000000002e, imm = fffffffffffff262, %l7 = 6db70ae3ea6c00ff
	and	%l1,-0xd9e,%l7		! %l7 = 0000000000000022
!	%l3 = 00000000000000ff, Mem[0000000010041410] = 21000000
	stba	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 210000ff
!	Mem[0000000010001410] = 00000029, %l2 = 0000000000000029
	ldstuba	[%i0+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101408] = 2ec7218b, %l5 = 00000000000000ff
	ldstuba	[%i4+%o4]0x81,%l5	! %l5 = 0000002e000000ff
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000030041408] = ea6c00ff 6db70ae3
	stda	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 8019c7db 4fd4f8f9, %l4 = 0d329602, %l5 = 0000002e
	ldda	[%i0+%g0]0x81,%l4	! %l4 = 000000008019c7db 000000004fd4f8f9

p0_label_25:
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 0000000000000007
	setx	0xad73a6e7c4b5033c,%g7,%l0 ! %l0 = ad73a6e7c4b5033c
!	%l1 = 000000000000002e
	setx	0xeb573080574d8c0d,%g7,%l1 ! %l1 = eb573080574d8c0d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ad73a6e7c4b5033c
	setx	0x99eef207cba92581,%g7,%l0 ! %l0 = 99eef207cba92581
!	%l1 = eb573080574d8c0d
	setx	0x8af19407e4654171,%g7,%l1 ! %l1 = 8af19407e4654171
!	Mem[0000000010181420] = fbe685a9, %l1 = 8af19407e4654171
	ldsba	[%i6+0x023]%asi,%l1	! %l1 = ffffffffffffffa9
!	Mem[0000000030181408] = 8fe01f9d, %l5 = 000000004fd4f8f9
	lduha	[%i6+%o4]0x89,%l5	! %l5 = 0000000000001f9d
!	Mem[000000001004142c] = 00000000, %l2 = 0000000000000000
	lduha	[%i1+0x02e]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141400] = 8986edff, %l3 = 00000000000000ff
	lduba	[%i5+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000201c0000] = 4b868ea0, %l6 = 0000000000000000
	lduba	[%o0+0x000]%asi,%l6	! %l6 = 000000000000004b
!	Mem[0000000010041408] = 8b21c72e, %l0 = 99eef207cba92581
	lduba	[%i1+%o4]0x80,%l0	! %l0 = 000000000000008b
!	Mem[0000000030101400] = 35125a58, %l7 = 0000000000000022
	lduwa	[%i4+%g0]0x89,%l7	! %l7 = 0000000035125a58
!	Mem[0000000010181400] = c7000000, %l0 = 000000000000008b
	lduha	[%i6+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = 4b868ea0, %l7 = 0000000035125a58
	ldstub	[%o0+0x001],%l7		! %l7 = 00000086000000ff

p0_label_26:
!	Mem[0000000010141410] = 8b21c72e, %l4 = 000000008019c7db
	ldstuba	[%i5+%o5]0x88,%l4	! %l4 = 0000002e000000ff
!	%f21 = fc4379c9, Mem[00000000300c1408] = 00000000
	sta	%f21,[%i3+%o4]0x81	! Mem[00000000300c1408] = fc4379c9
!	%f8  = 1d9baa08 5cf0920f, %l2 = 0000000000000000
!	Mem[0000000030141408] = c97943fc25dcf2ea
	add	%i5,0x008,%g1
	stda	%f8,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030141408] = c97943fc25dcf2ea
!	%l0 = 0000000000000000, Mem[0000000010101410] = 13e2f1c8
	stha	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000f1c8
!	Mem[00000000100c1424] = 139f6fd6, %l7 = 0000000000000086
	ldstuba	[%i3+0x024]%asi,%l7	! %l7 = 00000013000000ff
!	%f0  = f39cc6a7 48be2c46, Mem[0000000030101400] = 35125a58 320dd6bd
	stda	%f0 ,[%i4+%g0]0x89	! Mem[0000000030101400] = f39cc6a7 48be2c46
!	Mem[0000000010141400] = ff9995199f18e0cf, %l2 = 0000000000000000, %l6 = 000000000000004b
	casxa	[%i5]0x80,%l2,%l6	! %l6 = ff9995199f18e0cf
!	Mem[0000000010141408] = a7c69cf335125a58, %l6 = ff9995199f18e0cf, %l0 = 0000000000000000
	add	%i5,0x08,%g1
	casxa	[%g1]0x80,%l6,%l0	! %l0 = a7c69cf335125a58
!	Mem[0000000010001400] = b9c5da40, %l2 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 000000b9000000ff
!	Starting 10 instruction Load Burst
!	%l2 = 00000000000000b9, imm = 0000000000000bb0, %l2 = 00000000000000b9
	and	%l2,0xbb0,%l2		! %l2 = 00000000000000b0

p0_label_27:
!	Mem[0000000010141400] = ff9995199f18e0cf, %f30 = 24943b85 b7730672
	ldda	[%i5+%g0]0x80,%f30	! %f30 = ff999519 9f18e0cf
!	Mem[0000000030041400] = 16e64821, %l6 = ff9995199f18e0cf
	ldsha	[%i1+%g0]0x81,%l6	! %l6 = 00000000000016e6
!	Mem[00000000300c1408] = c97943fc, %l0 = a7c69cf335125a58
	lduha	[%i3+%o4]0x89,%l0	! %l0 = 00000000000043fc
!	Mem[0000000010101400] = 256d0000a7c69cf3, %f8  = 1d9baa08 5cf0920f
	ldda	[%i4+0x000]%asi,%f8 	! %f8  = 256d0000 a7c69cf3
!	Mem[0000000010181400] = c7000000, %l7 = 0000000000000013
	ldswa	[%i6+%g0]0x88,%l7	! %l7 = ffffffffc7000000
!	Mem[00000000100c1420] = 9c18380bff9f6fd6, %f18 = 07726d25 35125a58
	ldd	[%i3+0x020],%f18	! %f18 = 9c18380b ff9f6fd6
!	Mem[0000000010081400] = 24943b85, %l6 = 00000000000016e6
	ldswa	[%i2+%g0]0x80,%l6	! %l6 = 0000000024943b85
!	Mem[0000000030001408] = 787b7453, %l0 = 00000000000043fc
	lduha	[%i0+%o4]0x89,%l0	! %l0 = 0000000000007453
!	Mem[00000000100c1408] = ff2eb6dba8089df4, %l3 = 00000000000000ff
	ldxa	[%i3+%o4]0x80,%l3	! %l3 = ff2eb6dba8089df4
!	Starting 10 instruction Store Burst
!	%f20 = 2ec7218b, Mem[0000000030141408] = fc4379c9
	sta	%f20,[%i5+%o4]0x89	! Mem[0000000030141408] = 2ec7218b

p0_label_28:
!	%l1 = ffffffffffffffa9, Mem[000000001008142b] = 26ea8c9d
	stb	%l1,[%i2+0x02b]		! Mem[0000000010081428] = 26ea8ca9
!	Mem[0000000010141402] = ff999519, %l3 = ff2eb6dba8089df4
	ldstub	[%i5+0x002],%l3		! %l3 = 00000095000000ff
!	Mem[0000000021800181] = 28046a7f, %l4 = 000000000000002e
	ldstub	[%o3+0x181],%l4		! %l4 = 00000004000000ff
!	Mem[0000000010141400] = 19ff99ff, %l6 = 0000000024943b85
	swapa	[%i5+%g0]0x88,%l6	! %l6 = 0000000019ff99ff
!	%f22 = 00000000, Mem[000000001004140c] = c0000000
	st	%f22,[%i1+0x00c]	! Mem[000000001004140c] = 00000000
!	%l6 = 0000000019ff99ff, Mem[0000000010181400] = 000000c7
	stha	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = 99ff00c7
!	%l7 = ffffffffc7000000, Mem[0000000010041400] = 000000ff
	stba	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	%f10 = 7ffb8e61 ecbfc551, %l6 = 0000000019ff99ff
!	Mem[0000000030181408] = 9d1fe08f830600c3
	add	%i6,0x008,%g1
	stda	%f10,[%g1+%l6]ASI_PST16_S ! Mem[0000000030181408] = 7ffb8e61ecbfc551
!	Mem[0000000010181408] = 1df9a49a, %l0 = 0000000000007453
	ldstuba	[%i6+%o4]0x80,%l0	! %l0 = 0000001d000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 8986edff, %l0 = 000000000000001d
	ldsha	[%i5+%g0]0x89,%l0	! %l0 = ffffffffffffedff

p0_label_29:
!	Mem[0000000010101410] = 0000f1c8, %l3 = 0000000000000095
	lduwa	[%i4+%o5]0x80,%l3	! %l3 = 000000000000f1c8
!	Mem[00000000300c1408] = fc4379c956b9e2dd, %f6  = 48be2c46 02f48a4a
	ldda	[%i3+%o4]0x81,%f6 	! %f6  = fc4379c9 56b9e2dd
!	Mem[0000000010101420] = 0f92f05c, %l7 = ffffffffc7000000
	ldsba	[%i4+0x022]%asi,%l7	! %l7 = fffffffffffffff0
!	Mem[0000000010101410] = 0000f1c8 24b25d04, %l6 = 19ff99ff, %l7 = fffffff0
	ldda	[%i4+0x010]%asi,%l6	! %l6 = 000000000000f1c8 0000000024b25d04
!	Mem[0000000030041408] = 00000000, %l2 = 00000000000000b0
	ldsha	[%i1+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = ffc7218b, %f8  = 256d0000
	lda	[%i5+0x010]%asi,%f8 	! %f8 = ffc7218b
!	Mem[0000000010101400] = 00006d25, %l7 = 0000000024b25d04
	ldsha	[%i4+%g0]0x88,%l7	! %l7 = 0000000000006d25
!	Mem[00000000300c1410] = ff000021, %l2 = 0000000000000000
	ldsba	[%i3+%o5]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030181408] = 618efb7f, %l2 = ffffffffffffffff
	ldsba	[%i6+%o4]0x89,%l2	! %l2 = 000000000000007f
!	Starting 10 instruction Store Burst
!	%l6 = 000000000000f1c8, Mem[0000000030041410] = 418fd5a5
	stha	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = f1c8d5a5

p0_label_30:
!	Mem[0000000010101410] = 0000f1c8, %l2 = 0000007f, %l2 = 0000007f
	add	%i4,0x10,%g1
	casa	[%g1]0x80,%l2,%l2	! %l2 = 000000000000f1c8
!	%f17 = 24b25d04, Mem[00000000100c1400] = fe3c6016
	sta	%f17,[%i3+%g0]0x80	! Mem[00000000100c1400] = 24b25d04
!	%f28 = e4250160 13e2f1c8, %l6 = 000000000000f1c8
!	Mem[0000000030001430] = e5fd8817f7f898a4
	add	%i0,0x030,%g1
	stda	%f28,[%g1+%l6]ASI_PST16_S ! Mem[0000000030001430] = e4258817f7f898a4
!	%l5 = 0000000000001f9d, Mem[0000000010041400] = 00000000
	stwa	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = 00001f9d
!	Mem[00000000100c143c] = 5cf0920f, %l4 = 0000000000000004
	swap	[%i3+0x03c],%l4		! %l4 = 000000005cf0920f
!	%f0  = f39cc6a7 48be2c46, Mem[0000000030001400] = dbc71980 f9f8d44f
	stda	%f0 ,[%i0+%g0]0x89	! Mem[0000000030001400] = f39cc6a7 48be2c46
!	Mem[00000000218000c0] = f3df5cf4, %l1 = ffffffffffffffa9
	ldstuba	[%o3+0x0c0]%asi,%l1	! %l1 = 000000f3000000ff
!	Mem[0000000010001410] = ff000029, %l7 = 00006d25, %l7 = 00006d25
	add	%i0,0x10,%g1
	casa	[%g1]0x80,%l7,%l7	! %l7 = 00000000ff000029
!	%l6 = 0000f1c8, %l7 = ff000029, Mem[0000000010081408] = 6b3a26ea 5b7c1550
	stda	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000f1c8 ff000029
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 853b9424, %l0 = ffffffffffffedff
	lduba	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000085

p0_label_31:
!	Mem[0000000010101434] = 663ca228, %l3 = 000000000000f1c8
	lduba	[%i4+0x035]%asi,%l3	! %l3 = 000000000000003c
!	Mem[0000000030001408] = 64338202 787b7453, %l0 = 00000085, %l1 = 000000f3
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 00000000787b7453 0000000064338202
!	%l6 = 000000000000f1c8, imm = 000000000000003b, %l0 = 00000000787b7453
	addc	%l6,0x03b,%l0		! %l0 = 000000000000f203
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000030001400] = 462cbe48 a7c69cf3 53747b78 02823364
!	Mem[0000000030001410] = 00000000 e5842e71 d9d2725c 8fb2181f
!	Mem[0000000030001420] = 7fe4967b b3a3d9aa 268d7c0a 096cf5c2
!	Mem[0000000030001430] = e4258817 f7f898a4 987eb9ad 0850b773
	ldda	[%i0]ASI_BLK_S,%f16	! Block Load from 0000000030001400
!	Mem[0000000010141410] = 8b21c7ff, %l7 = 00000000ff000029
	ldsba	[%i5+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041400] = 00001f9d, %l4 = 000000005cf0920f
	lduba	[%i1+%g0]0x88,%l4	! %l4 = 000000000000009d
!	Mem[0000000010001408] = e30ab76d, %l4 = 000000000000009d
	lduba	[%i0+%o4]0x88,%l4	! %l4 = 000000000000006d
!	Mem[0000000010001434] = 2344132e, %l3 = 000000000000003c
	lduwa	[%i0+0x034]%asi,%l3	! %l3 = 000000002344132e
!	Mem[00000000201c0000] = 4bff8ea0, %l1 = 0000000064338202
	ldsb	[%o0+%g0],%l1		! %l1 = 000000000000004b
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000006d, Mem[0000000030141410] = ffffcae124b25d04
	stxa	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000000000006d

p0_label_32:
!	%l5 = 0000000000001f9d, Mem[0000000030101410] = 24b25d04
	stwa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 00001f9d
!	Mem[0000000010101408] = 00000000, %l6 = 000000000000f1c8
	swapa	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = 9aa4f9ff, %l1 = 000000000000004b
	swapa	[%i6+%o4]0x88,%l1	! %l1 = 000000009aa4f9ff
!	Mem[0000000010041408] = 8b21c72e, %l3 = 000000002344132e
	ldstuba	[%i1+%o4]0x80,%l3	! %l3 = 0000008b000000ff
!	%f4  = 7b68038d, %f12 = c31770d1, %f11 = ecbfc551
	fsubs	%f4 ,%f12,%f11		! %f11 = 7b68038d
!	%l7 = ffffffffffffffff, Mem[0000000010141400] = 853b94249f18e0cf
	stxa	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = ffffffffffffffff
!	Mem[000000001008140c] = 290000ff, %l7 = ffffffffffffffff
	swap	[%i2+0x00c],%l7		! %l7 = 00000000290000ff
!	Mem[0000000030041400] = 2148e616, %l3 = 000000000000008b
	ldstuba	[%i1+%g0]0x89,%l3	! %l3 = 00000016000000ff
!	%l0 = 000000000000f203, Mem[0000000010181408] = 4b000000
	stwa	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000f203
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ff21c72e00000000, %f14 = cf7c6fb2 d13860b0
	ldda	[%i1+%o4]0x80,%f14	! %f14 = ff21c72e 00000000

p0_label_33:
!	%l4 = 000000000000006d, imm = fffffffffffffc07, %l2 = 000000000000f1c8
	subc	%l4,-0x3f9,%l2		! %l2 = 0000000000000466
!	Mem[0000000030081410] = 24b25d04, %l3 = 0000000000000016
	lduwa	[%i2+%o5]0x89,%l3	! %l3 = 0000000024b25d04
!	Mem[0000000030141410] = 000000000000006d, %f8  = ffc7218b a7c69cf3
	ldda	[%i5+%o5]0x81,%f8 	! %f8  = 00000000 0000006d
!	%f3  = fc4379c9, %f2  = eea69e2b
	fsqrts	%f3 ,%f2 		! %f2  = 7fffffff
!	Mem[00000000300c1408] = fc4379c9, %l4 = 000000000000006d
	lduwa	[%i3+%o4]0x81,%l4	! %l4 = 00000000fc4379c9
!	Mem[0000000030041408] = 00000000, %l4 = 00000000fc4379c9
	ldsba	[%i1+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101400] = 256d0000, %l5 = 0000000000001f9d
	ldswa	[%i4+%g0]0x80,%l5	! %l5 = 00000000256d0000
!	Mem[0000000010081430] = 8b21c72e 24b25d04, %l6 = 00000000, %l7 = 290000ff
	ldd	[%i2+0x030],%l6		! %l6 = 000000008b21c72e 0000000024b25d04
!	%l4 = 0000000000000000, %l6 = 000000008b21c72e, %l1 = 000000009aa4f9ff
	xnor	%l4,%l6,%l1		! %l1 = ffffffff74de38d1
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000466, Mem[0000000010101408] = ff0000000000f1c8
	stxa	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000000000000466

p0_label_34:
!	%l0 = 0000f203, %l1 = 74de38d1, Mem[00000000100c1410] = edbe58a5 7b68038d
	stda	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000f203 74de38d1
!	%l0 = 000000000000f203, Mem[0000000010101434] = 663ca228, %asi = 80
	stwa	%l0,[%i4+0x034]%asi	! Mem[0000000010101434] = 0000f203
!	Mem[00000000211c0000] = f2ae3487, %l7 = 0000000024b25d04
	ldstuba	[%o2+0x000]%asi,%l7	! %l7 = 000000f2000000ff
!	%l0 = 000000000000f203, Mem[0000000030181410] = 2b9ea6eeecbfc551
	stxa	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000000000f203
!	%l6 = 8b21c72e, %l7 = 000000f2, Mem[0000000010101410] = 0000f1c8 24b25d04
	stda	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 8b21c72e 000000f2
	membar	#Sync			! Added by membar checker (5)
!	%f5  = edbe58a5, Mem[0000000030001410] = 00000000
	sta	%f5 ,[%i0+%o5]0x89	! Mem[0000000030001410] = edbe58a5
!	Mem[0000000030101400] = 48be2c46, %l6 = 000000008b21c72e
	ldstuba	[%i4+%g0]0x89,%l6	! %l6 = 00000046000000ff
!	Mem[000000001014141c] = 9913b744, %l5 = 00000000256d0000
	swap	[%i5+0x01c],%l5		! %l5 = 000000009913b744
!	%l7 = 00000000000000f2, Mem[0000000010181420] = fbe685a9662e6156
	stx	%l7,[%i6+0x020]		! Mem[0000000010181420] = 00000000000000f2
!	Starting 10 instruction Load Burst
!	Mem[0000000010041414] = feffffff, %l4 = 0000000000000000
	ldsba	[%i1+0x016]%asi,%l4	! %l4 = ffffffffffffffff

p0_label_35:
!	Mem[0000000010141400] = ffffffff, %l0 = 000000000000f203
	ldsba	[%i5+%g0]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141400] = ffffffff, %l5 = 000000009913b744
	lduha	[%i5+%g0]0x80,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010181410] = 8fe01f9d, %l1 = ffffffff74de38d1
	lduha	[%i6+%o5]0x88,%l1	! %l1 = 0000000000001f9d
!	Mem[0000000030081400] = eea69e2b, %l0 = ffffffffffffffff
	ldsba	[%i2+%g0]0x81,%l0	! %l0 = ffffffffffffffee
!	Mem[0000000020800040] = 6d25c0bd, %l2 = 0000000000000466
	lduh	[%o1+0x040],%l2		! %l2 = 0000000000006d25
!	Mem[00000000100c1400] = 24b25d04, %l1 = 0000000000001f9d
	lduh	[%i3+0x002],%l1		! %l1 = 0000000000005d04
!	%l1 = 0000000000005d04, %l5 = 000000000000ffff, %y  = 00005d66
	smul	%l1,%l5,%l0		! %l0 = 000000005d03a2fc, %y = 00000000
!	Mem[0000000010001408] = 6db70ae3, %l0 = 000000005d03a2fc
	ldsba	[%i0+%o4]0x80,%l0	! %l0 = 000000000000006d
!	Mem[0000000010081434] = 24b25d04, %l4 = ffffffffffffffff
	ldswa	[%i2+0x034]%asi,%l4	! %l4 = 0000000024b25d04
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = f1c8d5a5, %l4 = 0000000024b25d04
	ldstuba	[%i1+%o5]0x81,%l4	! %l4 = 000000f1000000ff

p0_label_36:
!	Mem[0000000030001408] = 787b7453, %l3 = 0000000024b25d04
	ldstuba	[%i0+%o4]0x89,%l3	! %l3 = 00000053000000ff
!	Mem[0000000030081410] = 045db224, %l7 = 00000000000000f2
	ldstuba	[%i2+%o5]0x81,%l7	! %l7 = 00000004000000ff
!	Mem[0000000030141408] = 2ec7218b, %l4 = 00000000000000f1
	swapa	[%i5+%o4]0x89,%l4	! %l4 = 000000002ec7218b
!	%l0 = 0000006d, %l1 = 00005d04, Mem[0000000030101410] = 00001f9d 8fe01f9d
	stda	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000006d 00005d04
!	%l5 = 000000000000ffff, Mem[00000000300c1408] = c97943fc
	stwa	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000ffff
!	%f20 = 00000000 e5842e71, %l0 = 000000000000006d
!	Mem[00000000100c1418] = f92b3efd99b049cd
	add	%i3,0x018,%g1
	stda	%f20,[%g1+%l0]ASI_PST16_PL ! Mem[00000000100c1418] = 712e3efd00000000
!	%f22 = d9d2725c 8fb2181f, Mem[0000000010141408] = f39cc6a7 585a1235
	stda	%f22,[%i5+%o4]0x88	! Mem[0000000010141408] = d9d2725c 8fb2181f
!	Mem[000000001018142c] = dc17859e, %l5 = 000000000000ffff, %asi = 80
	swapa	[%i6+0x02c]%asi,%l5	! %l5 = 00000000dc17859e
!	%l1 = 0000000000005d04, Mem[0000000010041430] = f5d2b1cdffd07932, %asi = 80
	stxa	%l1,[%i1+0x030]%asi	! Mem[0000000010041430] = 0000000000005d04
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ffe64821 00000000, %l2 = 00006d25, %l3 = 00000053
	ldda	[%i1+%g0]0x81,%l2	! %l2 = 00000000ffe64821 0000000000000000

p0_label_37:
!	Mem[000000001004143c] = 8c8b1aa3, %l6 = 0000000000000046
	lduh	[%i1+0x03e],%l6		! %l6 = 0000000000001aa3
!	Mem[0000000010081410] = 045db224e4250160, %l3 = 0000000000000000
	ldxa	[%i2+%o5]0x88,%l3	! %l3 = 045db224e4250160
!	Mem[0000000030101400] = 48be2cff, %l7 = 0000000000000004
	lduha	[%i4+%g0]0x89,%l7	! %l7 = 0000000000002cff
!	Mem[0000000030181408] = 618efb7f, %f16 = 462cbe48
	lda	[%i6+%o4]0x89,%f16	! %f16 = 618efb7f
!	Mem[0000000010041404] = 00005d04, %l2 = 00000000ffe64821
	ldswa	[%i1+0x004]%asi,%l2	! %l2 = 0000000000005d04
!	Mem[0000000030181410] = 00000000, %l7 = 0000000000002cff
	lduba	[%i6+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141408] = 8fb2181f, %l7 = 0000000000000000
	lduba	[%i5+%o4]0x88,%l7	! %l7 = 000000000000001f
!	Mem[0000000030081400] = 6c21f9a62b9ea6ee, %f12 = c31770d1 caa45580
	ldda	[%i2+%g0]0x89,%f12	! %f12 = 6c21f9a6 2b9ea6ee
!	Mem[0000000010101410] = 8b21c72e, %l5 = 00000000dc17859e
	ldsba	[%i4+%o5]0x80,%l5	! %l5 = ffffffffffffff8b
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 0000f203, %l5 = ffffffffffffff8b
	swapa	[%i3+%o5]0x88,%l5	! %l5 = 000000000000f203

p0_label_38:
!	Mem[00000000300c1400] = b26f7ccf, %l3 = 045db224e4250160
	swapa	[%i3+%g0]0x89,%l3	! %l3 = 00000000b26f7ccf
!	Mem[0000000010181410] = 9d1fe08f830600c3, %l4 = 000000002ec7218b, %l6 = 0000000000001aa3
	add	%i6,0x10,%g1
	casxa	[%g1]0x80,%l4,%l6	! %l6 = 9d1fe08f830600c3
!	%l0 = 000000000000006d, Mem[0000000030141400] = ffed8689
	stha	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 006d8689
!	%l3 = 00000000b26f7ccf, Mem[00000000100c1408] = ff2eb6db
	stha	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = 7ccfb6db
!	Code Fragment 4
p0_fragment_3:
!	%l0 = 000000000000006d
	setx	0x5eff04280439b0d7,%g7,%l0 ! %l0 = 5eff04280439b0d7
!	%l1 = 0000000000005d04
	setx	0x5dbf4620637fc1f6,%g7,%l1 ! %l1 = 5dbf4620637fc1f6
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5eff04280439b0d7
	setx	0x92bd07b025d14699,%g7,%l0 ! %l0 = 92bd07b025d14699
!	%l1 = 5dbf4620637fc1f6
	setx	0x367e9ff781c99839,%g7,%l1 ! %l1 = 367e9ff781c99839
!	%f2  = 7fffffff fc4379c9, Mem[00000000100c1428] = 1f9d1980 4fd833cd
	stda	%f2 ,[%i3+0x028]%asi	! Mem[00000000100c1428] = 7fffffff fc4379c9
!	Mem[0000000010141424] = cae1d280, %l7 = 0000001f, %l4 = 2ec7218b
	add	%i5,0x24,%g1
	casa	[%g1]0x80,%l7,%l4	! %l4 = 00000000cae1d280
!	%l6 = 9d1fe08f830600c3, Mem[0000000030001410] = edbe58a5
	stha	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = edbe00c3
!	%l7 = 000000000000001f, Mem[0000000010001400] = ffc5da40
	stha	%l7,[%i0+%g0]0x80	! Mem[0000000010001400] = 001fda40
!	Starting 10 instruction Load Burst
!	%l0 = 92bd07b025d14699, immd = fffffffffffff289, %l1 = 367e9ff781c99839
	sdivx	%l0,-0xd77,%l1		! %l1 = 00081d555b4385cf

p0_label_39:
!	Mem[0000000010041400] = 9d1f0000, %l0 = 92bd07b025d14699
	ldsha	[%i1+%g0]0x80,%l0	! %l0 = ffffffffffff9d1f
!	Mem[00000000300c1410] = ff000021, %l3 = 00000000b26f7ccf
	ldswa	[%i3+%o5]0x81,%l3	! %l3 = ffffffffff000021
!	Mem[0000000010001410] = 00000000290000ff, %f28 = e4258817 f7f898a4
	ldda	[%i0+%o5]0x88,%f28	! %f28 = 00000000 290000ff
!	Mem[0000000010101410] = 2ec7218b, %l3 = ffffffffff000021
	lduwa	[%i4+%o5]0x88,%l3	! %l3 = 000000002ec7218b
!	Mem[0000000030141408] = f1000000, %l3 = 000000002ec7218b
	ldsba	[%i5+%o4]0x81,%l3	! %l3 = fffffffffffffff1
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000010181400] = 99ff00c7 24b25d04 0000f203 21000000
!	Mem[0000000010181410] = 9d1fe08f 830600c3 83cf7f40 2e8ea061
!	Mem[0000000010181420] = 00000000 000000f2 2e824d80 0000ffff
!	Mem[0000000010181430] = eec27c83 894141d4 f9137281 026c93b5
	ldda	[%i6]ASI_BLK_AIUP,%f16	! Block Load from 0000000010181400
!	Mem[0000000010101430] = d68e44210000f203, %f0  = f39cc6a7 48be2c46
	ldda	[%i4+0x030]%asi,%f0 	! %f0  = d68e4421 0000f203
!	Mem[0000000010041400] = 00001f9d, %f0  = d68e4421
	lda	[%i1+%g0]0x88,%f0 	! %f0 = 00001f9d
!	Mem[0000000010101408] = 66040000, %l7 = 000000000000001f
	lduwa	[%i4+%o4]0x80,%l7	! %l7 = 0000000066040000
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = ffe64821, %l2 = 0000000000005d04
	ldstuba	[%i1+%g0]0x81,%l2	! %l2 = 000000ff000000ff

p0_label_40:
!	%l3 = fffffffffffffff1, Mem[0000000010001430] = 80cf29f12344132e
	stx	%l3,[%i0+0x030]		! Mem[0000000010001430] = fffffffffffffff1
!	Mem[0000000030101408] = ffc7218b, %l7 = 0000000066040000
	ldstuba	[%i4+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	%l6 = 9d1fe08f830600c3, Mem[000000001014142c] = b8be5233, %asi = 80
	stwa	%l6,[%i5+0x02c]%asi	! Mem[000000001014142c] = 830600c3
!	Code Fragment 4
p0_fragment_4:
!	%l0 = ffffffffffff9d1f
	setx	0x74e91f106842f1b1,%g7,%l0 ! %l0 = 74e91f106842f1b1
!	%l1 = 00081d555b4385cf
	setx	0x7c419f67d5090328,%g7,%l1 ! %l1 = 7c419f67d5090328
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 74e91f106842f1b1
	setx	0xf0971b8851e12d76,%g7,%l0 ! %l0 = f0971b8851e12d76
!	%l1 = 7c419f67d5090328
	setx	0x026d6187dbe7303b,%g7,%l1 ! %l1 = 026d6187dbe7303b
!	%f14 = ff21c72e 00000000, %l3 = fffffffffffffff1
!	Mem[00000000300c1400] = 600125e40a8f6c0a
	stda	%f14,[%i3+%l3]ASI_PST8_SL ! Mem[00000000300c1400] = 000125e42ec721ff
!	%f12 = 6c21f9a6 2b9ea6ee, Mem[0000000010041408] = ff21c72e 00000000
	stda	%f12,[%i1+%o4]0x80	! Mem[0000000010041408] = 6c21f9a6 2b9ea6ee
!	%l3 = fffffffffffffff1, Mem[0000000030141400] = 89866d00
	stha	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 8986fff1
!	%l0 = 51e12d76, %l1 = dbe7303b, Mem[00000000300c1410] = 210000ff ff006cea
	stda	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 51e12d76 dbe7303b
!	%l5 = 000000000000f203, Mem[0000000010081400] = 24943b852c88777f
	stxa	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000000000f203
!	Starting 10 instruction Load Burst
!	%f4  = 7b68038d edbe58a5, %f8  = 00000000
	fxtos	%f4 ,%f8 		! %f8  = 5ef6d007

p0_label_41:
!	Mem[0000000010001410] = ff000029, %l5 = 000000000000f203
	lduha	[%i0+%o5]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030141408] = 000000f1, %l5 = 000000000000ff00
	lduha	[%i5+%o4]0x89,%l5	! %l5 = 00000000000000f1
!	Code Fragment 4
p0_fragment_5:
!	%l0 = f0971b8851e12d76
	setx	0xbcb81a3fa68f8432,%g7,%l0 ! %l0 = bcb81a3fa68f8432
!	%l1 = 026d6187dbe7303b
	setx	0x17ec23dfbacb87ab,%g7,%l1 ! %l1 = 17ec23dfbacb87ab
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = bcb81a3fa68f8432
	setx	0xf0790b17a7f0131f,%g7,%l0 ! %l0 = f0790b17a7f0131f
!	%l1 = 17ec23dfbacb87ab
	setx	0xa2b48697e740f44b,%g7,%l1 ! %l1 = a2b48697e740f44b
!	Mem[0000000010181408] = 0000f203, %l2 = 00000000000000ff
	lduha	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181400] = 99ff00c724b25d04, %l6 = 9d1fe08f830600c3
	ldxa	[%i6+0x000]%asi,%l6	! %l6 = 99ff00c724b25d04
!	Mem[0000000010041430] = 00000000 00005d04, %l6 = 24b25d04, %l7 = 000000ff
	ldd	[%i1+0x030],%l6		! %l6 = 0000000000000000 0000000000005d04
!	Mem[0000000010081410] = 045db224 e4250160, %l2 = 00000000, %l3 = fffffff1
	ldda	[%i2+%o5]0x88,%l2	! %l2 = 00000000e4250160 00000000045db224
!	Mem[0000000010141408] = d9d2725c8fb2181f, %f2  = 7fffffff fc4379c9
	ldda	[%i5+%o4]0x88,%f2 	! %f2  = d9d2725c 8fb2181f
!	Mem[000000001010140c] = 00000000, %l1 = a2b48697e740f44b
	lduba	[%i4+0x00f]%asi,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 1f18b28f, %l2 = 00000000e4250160
	ldstuba	[%i5+%o4]0x80,%l2	! %l2 = 0000001f000000ff

p0_label_42:
!	%f10 = 7ffb8e61 7b68038d, Mem[0000000030081400] = eea69e2b a6f9216c
	stda	%f10,[%i2+%g0]0x81	! Mem[0000000030081400] = 7ffb8e61 7b68038d
!	Mem[00000000201c0001] = 4bff8ea0, %l1 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 000000ff000000ff
!	%f22 = 83cf7f40, %f7  = 56b9e2dd
	fcmps	%fcc0,%f22,%f7 		! %fcc0 = 1
!	Mem[00000000201c0000] = 4bff8ea0, %l6 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l6	! %l6 = 0000004b000000ff
!	%l0 = a7f0131f, %l1 = 000000ff, Mem[00000000100c1438] = 1d9baa08 00000004
	std	%l0,[%i3+0x038]		! Mem[00000000100c1438] = a7f0131f 000000ff
!	%l3 = 00000000045db224, %l1 = 00000000000000ff, %l2 = 000000000000001f
	udivx	%l3,%l1,%l2		! %l2 = 0000000000046214
!	%l0 = f0790b17a7f0131f, Mem[0000000030141400] = 8986fff1
	stwa	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = a7f0131f
!	%l7 = 0000000000005d04, Mem[0000000030141400] = 1f13f0a7
	stba	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = 0413f0a7
!	%l0 = f0790b17a7f0131f, Mem[00000000300c1400] = 000125e42ec721ff
	stxa	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = f0790b17a7f0131f
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ffffff8b, %l1 = 00000000000000ff
	lduha	[%i3+%o5]0x88,%l1	! %l1 = 000000000000ff8b

p0_label_43:
!	Mem[0000000030041400] = 00000000 2148e6ff, %l6 = 0000004b, %l7 = 00005d04
	ldda	[%i1+%g0]0x89,%l6	! %l6 = 000000002148e6ff 0000000000000000
!	Mem[00000000300c1400] = 1f13f0a7170b79f0, %f6  = fc4379c9 56b9e2dd
	ldda	[%i3+%g0]0x89,%f6 	! %f6  = 1f13f0a7 170b79f0
!	Mem[0000000030041400] = ffe6482100000000, %f18 = 0000f203 21000000
	ldda	[%i1+%g0]0x81,%f18	! %f18 = ffe64821 00000000
!	Mem[0000000010041408] = a6f9216c, %l0 = f0790b17a7f0131f
	lduba	[%i1+%o4]0x88,%l0	! %l0 = 000000000000006c
!	Mem[0000000010081408] = 0000f1c8, %f30 = f9137281
	lda	[%i2+%o4]0x88,%f30	! %f30 = 0000f1c8
!	Mem[0000000030101408] = ffc7218b fc4379c9, %l4 = cae1d280, %l5 = 000000f1
	ldda	[%i4+%o4]0x81,%l4	! %l4 = 00000000ffc7218b 00000000fc4379c9
!	Mem[00000000100c1430] = 2a763b2107001d69, %f24 = 00000000 000000f2
	ldda	[%i3+0x030]%asi,%f24	! %f24 = 2a763b21 07001d69
!	Mem[0000000030041400] = ffe6482100000000, %f8  = 5ef6d007 0000006d
	ldda	[%i1+%g0]0x81,%f8 	! %f8  = ffe64821 00000000
!	Mem[0000000010041400] = 00001f9d, %l5 = 00000000fc4379c9
	ldsba	[%i1+%g0]0x88,%l5	! %l5 = ffffffffffffff9d
!	Starting 10 instruction Store Burst
!	%f30 = 0000f1c8 026c93b5, %l5 = ffffffffffffff9d
!	Mem[0000000030181420] = d23ee88932e1f2cf
	add	%i6,0x020,%g1
	stda	%f30,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030181420] = b53e6c02c8e1f200

p0_label_44:
!	%f16 = 99ff00c7 24b25d04, Mem[0000000010101400] = 256d0000 a7c69cf3
	std	%f16,[%i4+%g0]	! Mem[0000000010101400] = 99ff00c7 24b25d04
	membar	#Sync			! Added by membar checker (7)
!	%l0 = 000000000000006c, Mem[0000000010181408] = 0000f20321000000
	stxa	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000000000006c
!	%l4 = 00000000ffc7218b, Mem[0000000010041408] = a6f9216c
	stwa	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = ffc7218b
!	%f6  = 1f13f0a7 170b79f0, Mem[00000000300c1410] = 762de151 3b30e7db
	stda	%f6 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 1f13f0a7 170b79f0
!	%l7 = 0000000000000000, Mem[0000000030081410] = ff5db22400000000
	stxa	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000000000000000
!	Mem[0000000030181410] = 00000000, %l0 = 000000000000006c
	swapa	[%i6+%o5]0x89,%l0	! %l0 = 0000000000000000
!	%f30 = 0000f1c8 026c93b5, Mem[0000000010181428] = 2e824d80 0000ffff
	std	%f30,[%i6+0x028]	! Mem[0000000010181428] = 0000f1c8 026c93b5
!	%l2 = 00046214, %l3 = 045db224, Mem[0000000010041430] = 00000000 00005d04
	std	%l2,[%i1+0x030]		! Mem[0000000010041430] = 00046214 045db224
!	Mem[00000000300c1408] = 0000ffff, %l3 = 00000000045db224
	ldstuba	[%i3+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 045d000000001f9d, %l0 = 0000000000000000
	ldxa	[%i1+%g0]0x88,%l0	! %l0 = 045d000000001f9d

p0_label_45:
!	Mem[0000000021800100] = ff900b85, %l2 = 0000000000046214
	ldsb	[%o3+0x100],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000030141410] = 00000000, %l5 = ffffffffffffff9d
	lduba	[%i5+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081418] = 21448ed6, %l1 = 000000000000ff8b
	ldub	[%i2+0x018],%l1		! %l1 = 0000000000000021
!	Mem[0000000010181430] = eec27c83894141d4, %f16 = 99ff00c7 24b25d04
	ldda	[%i6+0x030]%asi,%f16	! %f16 = eec27c83 894141d4
!	Mem[0000000030101400] = 48be2cff, %l4 = 00000000ffc7218b
	ldsba	[%i4+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030181408] = 7ffb8e61, %l5 = 0000000000000000
	lduha	[%i6+%o4]0x81,%l5	! %l5 = 0000000000007ffb
!	Mem[00000000300c1408] = 0000ffff, %l0 = 045d000000001f9d
	ldswa	[%i3+%o4]0x89,%l0	! %l0 = 000000000000ffff
!	Mem[0000000030101400] = ff2cbe48 a7c69cf3, %l2 = ffffffff, %l3 = 000000ff
	ldda	[%i4+%g0]0x81,%l2	! %l2 = 00000000ff2cbe48 00000000a7c69cf3
!	Mem[00000000100c1400] = 24b25d04, %l4 = ffffffffffffffff
	ldsba	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000024
!	Starting 10 instruction Store Burst
!	%f16 = eec27c83, Mem[0000000010141418] = 15ac4e47
	sta	%f16,[%i5+0x018]%asi	! Mem[0000000010141418] = eec27c83

p0_label_46:
!	%l1 = 0000000000000021, Mem[0000000010181433] = eec27c83, %asi = 80
	stba	%l1,[%i6+0x033]%asi	! Mem[0000000010181430] = eec27c21
!	%l1 = 0000000000000021, Mem[0000000010141430] = 70d3875f13e2f1c8, %asi = 80
	stxa	%l1,[%i5+0x030]%asi	! Mem[0000000010141430] = 0000000000000021
!	%l4 = 0000000000000024, Mem[0000000010001400] = c1c650cf40da1f00
	stxa	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000024
!	Mem[0000000010081400] = 00000000, %l1 = 0000000000000021
	swapa	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = 99ff00c7, %l4 = 0000000000000024
	swapa	[%i4+%g0]0x80,%l4	! %l4 = 0000000099ff00c7
!	Mem[0000000010001408] = e30ab76d, %l7 = 0000000000000000
	ldstuba	[%i0+%o4]0x88,%l7	! %l7 = 0000006d000000ff
!	%l7 = 000000000000006d, Mem[0000000010081408] = c8f10000
	stba	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = 6df10000
!	Mem[0000000030101400] = 48be2cff, %l4 = 0000000099ff00c7
	ldstuba	[%i4+%g0]0x89,%l4	! %l4 = 000000ff000000ff
!	%f17 = 894141d4, Mem[0000000030041400] = ffe64821
	sta	%f17,[%i1+%g0]0x81	! Mem[0000000030041400] = 894141d4
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 07726d25, %l1 = 0000000000000000
	lduba	[%i6+%g0]0x81,%l1	! %l1 = 0000000000000007

p0_label_47:
!	Mem[0000000030141400] = 2b32fccc a7f01304, %l2 = ff2cbe48, %l3 = a7c69cf3
	ldda	[%i5+%g0]0x89,%l2	! %l2 = 00000000a7f01304 000000002b32fccc
!	Mem[0000000010081408] = 6df10000, %l6 = 000000002148e6ff
	lduba	[%i2+%o4]0x80,%l6	! %l6 = 000000000000006d
!	Mem[0000000010101410] = 8b21c72e000000f2, %f6  = 1f13f0a7 170b79f0
	ldda	[%i4+%o5]0x80,%f6 	! %f6  = 8b21c72e 000000f2
!	Mem[0000000030001400] = 48be2c46, %l3 = 000000002b32fccc
	ldsba	[%i0+%g0]0x89,%l3	! %l3 = 0000000000000046
!	Mem[0000000030081400] = 618efb7f, %l1 = 0000000000000007
	lduha	[%i2+%g0]0x89,%l1	! %l1 = 000000000000fb7f
!	Mem[0000000010081400] = 03f2000021000000, %f28 = eec27c83 894141d4
	ldda	[%i2+%g0]0x88,%f28	! %f28 = 03f20000 21000000
!	Mem[0000000010181400] = 99ff00c724b25d04, %l2 = 00000000a7f01304
	ldxa	[%i6+%g0]0x80,%l2	! %l2 = 99ff00c724b25d04
!	Mem[0000000010081400] = 21000000, %l4 = 00000000000000ff
	lduba	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Code Fragment 4
p0_fragment_6:
!	%l0 = 000000000000ffff
	setx	0x46ec3f67d79d200e,%g7,%l0 ! %l0 = 46ec3f67d79d200e
!	%l1 = 000000000000fb7f
	setx	0x5c2879800289dcdd,%g7,%l1 ! %l1 = 5c2879800289dcdd
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 46ec3f67d79d200e
	setx	0x8d43f20fc701c413,%g7,%l0 ! %l0 = 8d43f20fc701c413
!	%l1 = 5c2879800289dcdd
	setx	0x87662e800dd8025e,%g7,%l1 ! %l1 = 87662e800dd8025e
!	Starting 10 instruction Store Burst
!	Code Fragment 4
p0_fragment_7:
!	%l0 = 8d43f20fc701c413
	setx	0x5513a6bfb9d5e077,%g7,%l0 ! %l0 = 5513a6bfb9d5e077
!	%l1 = 87662e800dd8025e
	setx	0xb8585e678ca64b30,%g7,%l1 ! %l1 = b8585e678ca64b30
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5513a6bfb9d5e077
	setx	0x4c18fc300bb32629,%g7,%l0 ! %l0 = 4c18fc300bb32629
!	%l1 = b8585e678ca64b30
	setx	0xc04e80583a7aef18,%g7,%l1 ! %l1 = c04e80583a7aef18

p0_label_48:
!	Mem[00000000100c1404] = 9079fa93, %l1 = c04e80583a7aef18
	swap	[%i3+0x004],%l1		! %l1 = 000000009079fa93
!	Mem[0000000010001408] = ffb70ae3, %l5 = 0000000000007ffb
	ldstuba	[%i0+%o4]0x80,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010181408] = 00000000, %l1 = 000000009079fa93
	ldstuba	[%i6+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041426] = 9cce4dba, %l3 = 0000000000000046
	ldstuba	[%i1+0x026]%asi,%l3	! %l3 = 0000004d000000ff
!	Mem[00000000300c1410] = a7f0131f, %l4 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l4	! %l4 = 0000001f000000ff
!	Mem[0000000030041400] = 894141d4, %l6 = 000000000000006d
	swapa	[%i1+%g0]0x81,%l6	! %l6 = 00000000894141d4
!	%l5 = 00000000000000ff, Mem[0000000010081400] = 21000000
	stha	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 210000ff
!	%l0 = 0bb32629, %l1 = 00000000, Mem[0000000010081408] = 6df10000 ffffffff
	std	%l0,[%i2+%o4]		! Mem[0000000010081408] = 0bb32629 00000000
!	Mem[0000000030081410] = 00000000, %l4 = 000000000000001f
	swapa	[%i2+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 000000000000006d, %l1 = 0000000000000000
	ldxa	[%i5+%o5]0x81,%l1	! %l1 = 000000000000006d

p0_label_49:
!	Mem[0000000010081408] = 0bb32629 00000000, %l0 = 0bb32629, %l1 = 0000006d
	ldda	[%i2+%o4]0x80,%l0	! %l0 = 000000000bb32629 0000000000000000
!	Mem[0000000010001410] = ff00002900000000, %l6 = 00000000894141d4
	ldxa	[%i0+%o5]0x80,%l6	! %l6 = ff00002900000000
!	Mem[0000000030141400] = 0413f0a7 ccfc322b, %l0 = 0bb32629, %l1 = 00000000
	ldda	[%i5+%g0]0x81,%l0	! %l0 = 000000000413f0a7 00000000ccfc322b
!	Mem[0000000030181410] = 0000006c, %l1 = 00000000ccfc322b
	lduba	[%i6+%o5]0x89,%l1	! %l1 = 000000000000006c
!	Mem[0000000010001400] = 24000000, %l2 = 99ff00c724b25d04
	lduha	[%i0+%g0]0x80,%l2	! %l2 = 0000000000002400
!	Mem[0000000010141408] = ff18b28f, %f23 = 2e8ea061
	lda	[%i5+%o4]0x80,%f23	! %f23 = ff18b28f
!	Mem[00000000201c0000] = ffff8ea0, %l1 = 000000000000006c
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030101400] = ff2cbe48, %f20 = 9d1fe08f
	lda	[%i4+%g0]0x81,%f20	! %f20 = ff2cbe48
!	Mem[0000000030181410] = 0000006c, %l4 = 0000000000000000
	ldsba	[%i6+%o5]0x89,%l4	! %l4 = 000000000000006c
!	Starting 10 instruction Store Burst
!	%f0  = 00001f9d 0000f203, Mem[0000000010181408] = ff000000 0000006c
	stda	%f0 ,[%i6+%o4]0x80	! Mem[0000000010181408] = 00001f9d 0000f203

p0_label_50:
!	%l7 = 000000000000006d, Mem[0000000010081420] = badaff08
	stb	%l7,[%i2+0x020]		! Mem[0000000010081420] = 6ddaff08
!	%f12 = 6c21f9a6 2b9ea6ee, %l1 = 000000000000ffff
!	Mem[0000000010081400] = ff0000210000f203
	stda	%f12,[%i2+%l1]ASI_PST32_P ! Mem[0000000010081400] = 6c21f9a62b9ea6ee
!	%f24 = 2a763b21 07001d69, %l7 = 000000000000006d
!	Mem[00000000300c1438] = 38233502425adacf
	add	%i3,0x038,%g1
	stda	%f24,[%g1+%l7]ASI_PST8_S ! Mem[00000000300c1438] = 38763b020700da69
!	%l2 = 0000000000002400, Mem[0000000030181410] = 6c000000
	stha	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = 24000000
!	%l6 = 00000000, %l7 = 0000006d, Mem[0000000010141438] = 24943b85 b7730672
	std	%l6,[%i5+0x038]		! Mem[0000000010141438] = 00000000 0000006d
!	Mem[0000000030101408] = ffc7218b, %l3 = 000000000000004d
	swapa	[%i4+%o4]0x81,%l3	! %l3 = 00000000ffc7218b
!	%f26 = 2e824d80 0000ffff, %l0 = 000000000413f0a7
!	Mem[0000000010041408] = 8b21c7ff2b9ea6ee
	add	%i1,0x008,%g1
	stda	%f26,[%g1+%l0]ASI_PST32_P ! Mem[0000000010041408] = 2e824d800000ffff
!	%l0 = 000000000413f0a7, Mem[00000000201c0000] = ffff8ea0
	sth	%l0,[%o0+%g0]		! Mem[00000000201c0000] = f0a78ea0
!	Mem[00000000300c1410] = a7f013ff, %l2 = 0000000000002400
	swapa	[%i3+%o5]0x89,%l2	! %l2 = 00000000a7f013ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ffffffff ffffffff, %l4 = 0000006c, %l5 = 000000ff
	ldda	[%i5+%g0]0x80,%l4	! %l4 = 00000000ffffffff 00000000ffffffff

p0_label_51:
!	Mem[0000000010081408] = 0bb32629, %l5 = 00000000ffffffff
	lduba	[%i2+%o4]0x80,%l5	! %l5 = 000000000000000b
!	Mem[0000000010181408] = 00001f9d, %l7 = 000000000000006d
	lduba	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000000
!	%f29 = 21000000, %f3  = 8fb2181f, %f12 = 6c21f9a6
	fsubs	%f29,%f3 ,%f12		! %f12 = 21000000
!	Mem[0000000021800100] = ff900b85, %l4 = 00000000ffffffff
	ldsb	[%o3+0x100],%l4		! %l4 = ffffffffffffffff
!	Mem[00000000300c1400] = f0790b17a7f0131f, %l1 = 000000000000ffff
	ldxa	[%i3+%g0]0x81,%l1	! %l1 = f0790b17a7f0131f
!	Mem[00000000201c0000] = f0a78ea0, %l5 = 000000000000000b
	lduh	[%o0+%g0],%l5		! %l5 = 000000000000f0a7
!	Mem[0000000020800040] = 6d25c0bd, %l2 = 00000000a7f013ff
	lduba	[%o1+0x041]%asi,%l2	! %l2 = 0000000000000025
!	%l3 = 00000000ffc7218b, Mem[00000000100c1410] = 8bffffff
	stha	%l3,[%i3+%o5]0x80	! Mem[00000000100c1410] = 218bffff
!	Mem[0000000010181438] = f9137281, %l0 = 000000000413f0a7
	lduba	[%i6+0x038]%asi,%l0	! %l0 = 00000000000000f9
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000025, Mem[0000000030041400] = 6d000000
	stba	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 6d000025

p0_label_52:
!	%l4 = ffffffff, %l5 = 0000f0a7, Mem[0000000030141410] = 00000000 6d000000
	stda	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffffff 0000f0a7
!	Mem[0000000030141410] = ffffffff, %l5 = 000000000000f0a7
	ldstuba	[%i5+%o5]0x89,%l5	! %l5 = 000000ff000000ff
!	%l0 = 00000000000000f9, Mem[00000000300c1408] = ffff0000
	stwa	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000f9
!	%l0 = 00000000000000f9, Mem[0000000030041408] = 00000000
	stha	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000f9
!	%l1 = f0790b17a7f0131f, Mem[0000000010001428] = 3c66070d91164b9a
	stx	%l1,[%i0+0x028]		! Mem[0000000010001428] = f0790b17a7f0131f
!	%l3 = 00000000ffc7218b, Mem[0000000010001408] = e30ab7ff
	stwa	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = ffc7218b
!	%l4 = ffffffffffffffff, Mem[0000000030081400] = 618efb7f
	stwa	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffff
!	%l3 = 00000000ffc7218b, Mem[0000000010001400] = 24000000
	stba	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = 8b000000
!	%l0 = 00000000000000f9, Mem[00000000100c142c] = fc4379c9, %asi = 80
	stha	%l0,[%i3+0x02c]%asi	! Mem[00000000100c142c] = 00f979c9
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffae3487, %l2 = 0000000000000025
	ldsba	[%o2+0x000]%asi,%l2	! %l2 = ffffffffffffffff

p0_label_53:
!	Mem[0000000010141420] = 600125e4, %l5 = 00000000000000ff
	ldsb	[%i5+0x021],%l5		! %l5 = 0000000000000001
!	Mem[0000000010041400] = 9d1f000000005d04, %f4  = 7b68038d edbe58a5
	ldda	[%i1+%g0]0x80,%f4 	! %f4  = 9d1f0000 00005d04
!	Mem[0000000030081410] = 0000001f, %l1 = f0790b17a7f0131f
	ldswa	[%i2+%o5]0x81,%l1	! %l1 = 000000000000001f
!	Mem[00000000300c1410] = 00002400, %l1 = 000000000000001f
	ldswa	[%i3+%o5]0x89,%l1	! %l1 = 0000000000002400
!	%l1 = 0000000000002400, immd = fffffffffffff98d, %l2 = ffffffffffffffff
	sdivx	%l1,-0x673,%l2		! %l2 = fffffffffffffffb
!	Mem[00000000300c1410] = 00240000170b79f0, %l7 = 0000000000000000
	ldxa	[%i3+%o5]0x81,%l7	! %l7 = 00240000170b79f0
!	Mem[0000000030081410] = 0000001f00000000, %l7 = 00240000170b79f0
	ldxa	[%i2+%o5]0x81,%l7	! %l7 = 0000001f00000000
!	Mem[00000000300c1410] = 00240000, %l5 = 0000000000000001
	ldsha	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000024
!	Mem[0000000021800000] = 46b9133c, %l6 = ff00002900000000
	ldub	[%o3+%g0],%l6		! %l6 = 0000000000000046
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000f9, immd = ffffffffffffff6b, %l4 = ffffffffffffffff
	udivx	%l0,-0x095,%l4		! %l4 = 0000000000000000

p0_label_54:
!	%l4 = 0000000000000000, Mem[0000000010001408] = 8b21c7ff
	stwa	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	Mem[0000000010041434] = 045db224, %l5 = 0000000000000024
	ldstuba	[%i1+0x034]%asi,%l5	! %l5 = 00000004000000ff
!	%l2 = fffffffffffffffb, Mem[0000000030101410] = 0000006d
	stha	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000fffb
!	%l0 = 00000000000000f9, Mem[0000000030041410] = ffc8d5a5533cf321
	stxa	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000000000f9
!	%l2 = fffffffffffffffb, Mem[0000000030041408] = f9000000
	stba	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = fb000000
!	Mem[0000000010001408] = 00000000, %l2 = fffffffffffffffb
	ldstuba	[%i0+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%f2  = d9d2725c, Mem[0000000030041408] = 000000fb
	sta	%f2 ,[%i1+%o4]0x89	! Mem[0000000030041408] = d9d2725c
!	%l5 = 0000000000000004, Mem[0000000010001410] = 290000ff
	stha	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 29000004
!	Mem[0000000010101408] = 66040000, %l7 = 0000001f00000000
	ldstuba	[%i4+%o4]0x80,%l7	! %l7 = 00000066000000ff
!	Starting 10 instruction Load Burst
!	%l1 = 0000000000002400, %l2 = 0000000000000000, %l4 = 0000000000000000
	andn	%l1,%l2,%l4		! %l4 = 0000000000002400

p0_label_55:
!	Mem[0000000010101434] = 0000f203, %l0 = 00000000000000f9
	ldub	[%i4+0x037],%l0		! %l0 = 0000000000000003
!	Mem[0000000030001410] = edbe00c3, %f31 = 026c93b5
	lda	[%i0+%o5]0x89,%f31	! %f31 = edbe00c3
!	Mem[0000000030181400] = 256d7207, %l3 = 00000000ffc7218b
	lduwa	[%i6+%g0]0x89,%l3	! %l3 = 00000000256d7207
!	Mem[0000000010181414] = 830600c3, %l2 = 0000000000000000
	ldsba	[%i6+0x015]%asi,%l2	! %l2 = 0000000000000006
!	Mem[0000000010001400] = 8b00000000000000, %f20 = ff2cbe48 830600c3
	ldda	[%i0+%g0]0x80,%f20	! %f20 = 8b000000 00000000
!	Mem[0000000021800180] = 28ff6a7f, %l0 = 0000000000000003
	ldub	[%o3+0x181],%l0		! %l0 = 00000000000000ff
!	Mem[00000000100c1400] = 24b25d04, %l2 = 0000000000000006
	lduha	[%i3+%g0]0x80,%l2	! %l2 = 00000000000024b2
!	%l3 = 00000000256d7207, immd = 0000000000000fab, %l5 = 0000000000000004
	udivx	%l3,0xfab,%l5		! %l5 = 0000000000026387
!	Mem[0000000010001400] = 00000000 0000008b, %l0 = 000000ff, %l1 = 00002400
	ldda	[%i0+%g0]0x88,%l0	! %l0 = 000000000000008b 0000000000000000
!	Starting 10 instruction Store Burst
!	%f8  = ffe64821 00000000, Mem[0000000030141408] = 000000f1 eaf2dc25
	stda	%f8 ,[%i5+%o4]0x89	! Mem[0000000030141408] = ffe64821 00000000

p0_label_56:
!	%l7 = 0000000000000066, Mem[00000000201c0000] = f0a78ea0, %asi = 80
	stba	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = 66a78ea0
!	Mem[0000000030041400] = 2500006d, %l1 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l1	! %l1 = 000000002500006d
!	Mem[0000000010141408] = 8fb218ff, %l0 = 000000000000008b
	ldstuba	[%i5+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010041408] = 804d822e, %l7 = 0000000000000066
	ldstuba	[%i1+%o4]0x88,%l7	! %l7 = 0000002e000000ff
!	%l4 = 00002400, %l5 = 00026387, Mem[0000000010041410] = 210000ff fffffffe
	stda	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 00002400 00026387
!	%f16 = eec27c83 894141d4 ffe64821 00000000
!	%f20 = 8b000000 00000000 83cf7f40 ff18b28f
!	%f24 = 2a763b21 07001d69 2e824d80 0000ffff
!	%f28 = 03f20000 21000000 0000f1c8 edbe00c3
	stda	%f16,[%i6]ASI_BLK_AIUS	! Block Store to 0000000030181400
!	Mem[00000000100c1400] = 045db224, %l1 = 000000002500006d
	swapa	[%i3+%g0]0x88,%l1	! %l1 = 00000000045db224
!	%l4 = 00002400, %l5 = 00026387, Mem[0000000030081410] = 1f000000 00000000
	stda	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 00002400 00026387
!	%f5  = 00005d04, Mem[0000000030141400] = a7f01304
	sta	%f5 ,[%i5+%g0]0x89	! Mem[0000000030141400] = 00005d04
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 000000f9, %l5 = 0000000000026387
	lduwa	[%i3+%o4]0x81,%l5	! %l5 = 00000000000000f9

p0_label_57:
!	Mem[0000000030141410] = ffffffffa7f00000, %l4 = 0000000000002400
	ldxa	[%i5+%o5]0x81,%l4	! %l4 = ffffffffa7f00000
!	Mem[0000000030001408] = 787b74ff, %f14 = ff21c72e
	lda	[%i0+%o4]0x89,%f14	! %f14 = 787b74ff
!	Mem[00000000100c1400] = 6d000025, %l5 = 00000000000000f9
	lduha	[%i3+%g0]0x80,%l5	! %l5 = 0000000000006d00
!	Mem[0000000030081400] = ffffffff, %f13 = 2b9ea6ee
	lda	[%i2+%g0]0x89,%f13	! %f13 = ffffffff
!	Mem[0000000030041410] = f9000000 00000000, %l2 = 000024b2, %l3 = 256d7207
	ldda	[%i1+%o5]0x89,%l2	! %l2 = 0000000000000000 00000000f9000000
!	Code Fragment 4
p0_fragment_8:
!	%l0 = 00000000000000ff
	setx	0x6862a110472ee26a,%g7,%l0 ! %l0 = 6862a110472ee26a
!	%l1 = 00000000045db224
	setx	0x9412f2a03454f2bc,%g7,%l1 ! %l1 = 9412f2a03454f2bc
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 6862a110472ee26a
	setx	0x13fcea8787229ead,%g7,%l0 ! %l0 = 13fcea8787229ead
!	%l1 = 9412f2a03454f2bc
	setx	0x71d169efcacf9d3f,%g7,%l1 ! %l1 = 71d169efcacf9d3f
!	Mem[0000000010081410] = e4250160, %l3 = 00000000f9000000
	ldsha	[%i2+%o5]0x88,%l3	! %l3 = 0000000000000160
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000010181424] = 000000f2, %f1  = 0000f203
	lda	[%i6+0x024]%asi,%f1 	! %f1 = 000000f2
!	Mem[0000000010101410] = 2ec7218b, %f21 = 00000000
	lda	[%i4+%o5]0x88,%f21	! %f21 = 2ec7218b
!	Starting 10 instruction Store Burst
!	%f28 = 03f20000 21000000, Mem[0000000010101410] = 8b21c72e 000000f2
	stda	%f28,[%i4+%o5]0x80	! Mem[0000000010101410] = 03f20000 21000000

p0_label_58:
!	%l2 = 0000000000000000, Mem[0000000010001400] = 0000008b
	stha	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	%l5 = 0000000000006d00, immed = fffff519, %y  = 00000000
	sdiv	%l5,-0xae7,%l3		! %l3 = fffffffffffffff7
	mov	%l0,%y			! %y = 87229ead
!	%f27 = 0000ffff, Mem[0000000030041408] = 5c72d2d9
	sta	%f27,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000ffff
!	%l1 = 71d169efcacf9d3f, Mem[0000000030081400] = ffffffff
	stha	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 9d3fffff
!	Mem[0000000030101408] = 0000004d, %l7 = 000000000000002e
	ldstuba	[%i4+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[000000001000143e] = fefb7d50
	stb	%l2,[%i0+0x03e]		! Mem[000000001000143c] = fefb0050
!	%l2 = 0000000000000000, Mem[0000000010101410] = 03f2000021000000
	stxa	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000000000000
!	%l6 = 0000000000000046, Mem[0000000030181408] = ffe64821
	stba	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 46e64821
!	%f14 = 787b74ff 00000000, Mem[0000000030041410] = 00000000 f9000000
	stda	%f14,[%i1+%o5]0x89	! Mem[0000000030041410] = 787b74ff 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffae3487, %l7 = 0000000000000000
	lduba	[%o2+0x001]%asi,%l7	! %l7 = 00000000000000ae

p0_label_59:
!	Mem[0000000030141408] = 00000000, %l3 = fffffffffffffff7
	ldsba	[%i5+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101400] = 24000000, %f18 = ffe64821
	lda	[%i4+%g0]0x88,%f18	! %f18 = 24000000
!	Mem[0000000010001408] = ff000000, %l6 = 0000000000000046
	ldswa	[%i0+%o4]0x80,%l6	! %l6 = ffffffffff000000
!	Mem[0000000030001408] = 787b74ff, %l3 = 0000000000000000
	lduha	[%i0+%o4]0x89,%l3	! %l3 = 00000000000074ff
!	Mem[000000001000140c] = ea6c00ff, %l6 = ffffffffff000000
	lduha	[%i0+0x00e]%asi,%l6	! %l6 = 00000000000000ff
!	%l7 = 00000000000000ae, immed = fffffa74, %y  = 87229ead
	umul	%l7,-0x58c,%l6		! %l6 = 000000adfffc3ad8, %y = 000000ad
!	Mem[00000000100c1400] = 6d000025, %l4 = ffffffffa7f00000
	ldsha	[%i3+%g0]0x80,%l4	! %l4 = 0000000000006d00
!	Mem[0000000030141400] = 045d0000, %l2 = 0000000000000000
	lduwa	[%i5+%g0]0x81,%l2	! %l2 = 00000000045d0000
!	Mem[0000000010001400] = 00000000, %l1 = 71d169efcacf9d3f
	lduha	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f14 = 787b74ff 00000000, Mem[0000000030041408] = 0000ffff ff000000
	stda	%f14,[%i1+%o4]0x81	! Mem[0000000030041408] = 787b74ff 00000000

p0_label_60:
!	Mem[0000000030041400] = 00000000, %l5 = 0000000000006d00
	swapa	[%i1+%g0]0x81,%l5	! %l5 = 0000000000000000
!	%f22 = 83cf7f40 ff18b28f, Mem[00000000300c1400] = f0790b17 a7f0131f
	stda	%f22,[%i3+%g0]0x81	! Mem[00000000300c1400] = 83cf7f40 ff18b28f
!	%l4 = 0000000000006d00, Mem[0000000030181408] = 46e64821
	stba	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 00e64821
!	%l7 = 00000000000000ae, Mem[000000001008142e] = 3f44c0c9, %asi = 80
	stha	%l7,[%i2+0x02e]%asi	! Mem[000000001008142c] = 3f4400ae
!	Mem[0000000030141410] = ffffffff, %l1 = 0000000000000000
	lduba	[%i5+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	%l2 = 045d0000, %l3 = 000074ff, Mem[0000000010141410] = ffc7218b fc4379c9
	stda	%l2,[%i5+0x010]%asi	! Mem[0000000010141410] = 045d0000 000074ff
!	Mem[00000000100c1400] = 2500006d, %l2 = 00000000045d0000
	ldstuba	[%i3+%g0]0x88,%l2	! %l2 = 0000006d000000ff
!	%l6 = fffc3ad8, %l7 = 000000ae, Mem[0000000010141400] = ffffffff ffffffff
	stda	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = fffc3ad8 000000ae
!	%l3 = 00000000000074ff, Mem[0000000010081408] = 000000002926b30b
	stxa	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000000074ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 0000000000000000, %l0 = 13fcea8787229ead
	ldxa	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000

p0_label_61:
!	Mem[00000000300c1400] = 407fcf83, %l6 = 000000adfffc3ad8
	ldsha	[%i3+%g0]0x89,%l6	! %l6 = ffffffffffffcf83
!	Mem[00000000100c1408] = 7ccfb6dba8089df4, %l4 = 0000000000006d00
	ldxa	[%i3+%o4]0x80,%l4	! %l4 = 7ccfb6dba8089df4
!	Mem[0000000010101408] = ff040000, %l1 = 00000000000000ff
	lduba	[%i4+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	%f10 = 7ffb8e61, %f10 = 7ffb8e61
	fsqrts	%f10,%f10		! %f10 = 7ffb8e61
!	Mem[0000000010141418] = eec27c83, %l4 = 7ccfb6dba8089df4
	ldswa	[%i5+0x018]%asi,%l4	! %l4 = ffffffffeec27c83
!	Mem[00000000100c1408] = 7ccfb6db, %f1  = 000000f2
	lda	[%i3+%o4]0x80,%f1 	! %f1 = 7ccfb6db
!	Mem[0000000010001400] = 0000000000000000, %f24 = 2a763b21 07001d69
	ldda	[%i0+%g0]0x80,%f24	! %f24 = 00000000 00000000
!	Mem[0000000010181408] = 03f200009d1f0000, %l7 = 00000000000000ae
	ldxa	[%i6+%o4]0x88,%l7	! %l7 = 03f200009d1f0000
!	Mem[0000000030081408] = fcc2a29f 57b22d28, %l4 = eec27c83, %l5 = 00000000
	ldda	[%i2+%o4]0x81,%l4	! %l4 = 00000000fcc2a29f 0000000057b22d28
!	Starting 10 instruction Store Burst
!	%l4 = 00000000fcc2a29f, Mem[00000000100c1400] = 250000ff
	stba	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 2500009f

p0_label_62:
!	%f20 = 8b000000 2ec7218b, %l7 = 03f200009d1f0000
!	Mem[0000000010141428] = 905f0c6b830600c3
	add	%i5,0x028,%g1
	stda	%f20,[%g1+%l7]ASI_PST32_P ! Mem[0000000010141428] = 905f0c6b830600c3
!	%f12 = 21000000 ffffffff, %l1 = 00000000000000ff
!	Mem[0000000010181400] = 99ff00c724b25d04
	stda	%f12,[%i6+%l1]ASI_PST32_PL ! Mem[0000000010181400] = ffffffff00000021
!	Mem[0000000010001400] = 00000000, %l3 = 00000000000074ff
	swapa	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000
!	%l7 = 03f200009d1f0000, %l4 = 00000000fcc2a29f, %l0 = 0000000000000000
	xor	%l7,%l4,%l0		! %l0 = 03f2000061dda29f
!	%l1 = 00000000000000ff, Mem[0000000010041408] = ff824d80
	stwa	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = 000000ff
!	Mem[0000000010001410] = 29000004, %l3 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l3	! %l3 = 0000000029000004
!	Mem[0000000030041410] = 00000000, %l0 = 03f2000061dda29f
	ldstuba	[%i1+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[0000000030181410] = 8b000000
	stba	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = ff000000
!	%f3  = 8fb2181f, Mem[0000000010041410] = 00240000
	st	%f3 ,[%i1+%o5]		! Mem[0000000010041410] = 8fb2181f
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 000000ff, %l1 = 00000000000000ff
	lduwa	[%i1+%o4]0x80,%l1	! %l1 = 00000000000000ff

p0_label_63:
!	Mem[0000000010181408] = 00001f9d, %f24 = 00000000
	lda	[%i6+%o4]0x80,%f24	! %f24 = 00001f9d
!	Mem[0000000010141408] = d9d2725c8fb218ff, %l3 = 0000000029000004
	ldxa	[%i5+%o4]0x88,%l3	! %l3 = d9d2725c8fb218ff
!	Mem[00000000100c1408] = 7ccfb6dba8089df4, %l6 = ffffffffffffcf83
	ldxa	[%i3+%o4]0x80,%l6	! %l6 = 7ccfb6dba8089df4
!	Mem[0000000010181408] = 03f200009d1f0000, %f8  = ffe64821 00000000
	ldda	[%i6+%o4]0x88,%f8 	! %f8  = 03f20000 9d1f0000
!	Mem[00000000211c0000] = ffae3487, %l7 = 03f200009d1f0000
	ldsba	[%o2+0x001]%asi,%l7	! %l7 = ffffffffffffffae
!	Mem[0000000030101410] = fbff0000 045d0000, %l6 = a8089df4, %l7 = ffffffae
	ldda	[%i4+%o5]0x81,%l6	! %l6 = 00000000fbff0000 00000000045d0000
!	Mem[0000000020800000] = ff9f4ebd, %l6 = 00000000fbff0000
	lduba	[%o1+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	%l6 = 00000000000000ff, immd = fffffffffffffb6b, %l3 = d9d2725c8fb218ff
	sdivx	%l6,-0x495,%l3		! %l3 = 0000000000000000
!	Mem[0000000010141400] = d83afcff, %l2 = 000000000000006d
	ldswa	[%i5+%g0]0x88,%l2	! %l2 = ffffffffd83afcff
!	Starting 10 instruction Store Burst
!	%l6 = 000000ff, %l7 = 045d0000, Mem[00000000100c1400] = 2500009f 18ef7a3a
	stda	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff 045d0000

p0_label_64:
!	%l7 = 00000000045d0000, imm = 00000000000004cb, %l0 = 0000000000000000
	andn	%l7,0x4cb,%l0		! %l0 = 00000000045d0000
!	%l1 = 00000000000000ff, Mem[00000000100c1408] = f49d08a8dbb6cf7c
	stxa	%l1,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000000000ff
!	Mem[0000000030001410] = edbe00c3, %l5 = 0000000057b22d28
	ldstuba	[%i0+%o5]0x89,%l5	! %l5 = 000000c3000000ff
!	%l7 = 00000000045d0000, Mem[0000000030041410] = ff000000
	stha	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	%f20 = 8b000000, Mem[0000000030081400] = 9d3fffff
	sta	%f20,[%i2+%g0]0x81	! Mem[0000000030081400] = 8b000000
!	Mem[0000000010141410] = 045d0000, %l7 = 00000000045d0000
	ldstuba	[%i5+%o5]0x80,%l7	! %l7 = 00000004000000ff
!	Mem[00000000100c1408] = ff000000, %l1 = 00000000000000ff
	ldstuba	[%i3+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	%l0 = 00000000045d0000, Mem[00000000300c1400] = 407fcf83
	stwa	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 045d0000
!	%l6 = 000000ff, %l7 = 00000004, Mem[0000000030141400] = 00005d04 2b32fccc
	stda	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff 00000004
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 66a78ea0, %l5 = 00000000000000c3
	lduha	[%o0+0x000]%asi,%l5	! %l5 = 00000000000066a7

p0_label_65:
!	%l3 = 0000000000000000, %l0 = 00000000045d0000, %l5 = 00000000000066a7
	sub	%l3,%l0,%l5		! %l5 = fffffffffba30000
!	Mem[0000000010001408] = ff000000ea6c00ff, %f4  = 9d1f0000 00005d04
	ldda	[%i0+0x008]%asi,%f4 	! %f4  = ff000000 ea6c00ff
!	Mem[0000000010101408] = ff040000, %f25 = 00000000
	lda	[%i4+%o4]0x80,%f25	! %f25 = ff040000
!	Mem[0000000030101408] = ff00004d, %l6 = 00000000000000ff
	lduha	[%i4+%o4]0x81,%l6	! %l6 = 000000000000ff00
!	%l7 = 0000000000000004, %l3 = 0000000000000000, %l0 = 00000000045d0000
	andn	%l7,%l3,%l0		! %l0 = 0000000000000004
!	Mem[0000000030081400] = 8b000000, %l6 = 000000000000ff00
	ldswa	[%i2+%g0]0x81,%l6	! %l6 = ffffffff8b000000
!	Mem[0000000010101400] = 24000000, %l6 = ffffffff8b000000
	ldsba	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = fffc3ad8000000ae, %f22 = 83cf7f40 ff18b28f
	ldda	[%i5+%g0]0x80,%f22	! %f22 = fffc3ad8 000000ae
!	Mem[00000000100c1434] = 07001d69, %l1 = 00000000000000ff
	ldsh	[%i3+0x034],%l1		! %l1 = 0000000000000700
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[00000000100c143c] = 000000ff
	sth	%l6,[%i3+0x03c]		! Mem[00000000100c143c] = 000000ff

p0_label_66:
!	%l3 = 0000000000000000, Mem[00000000218000c1] = ffdf5cf4
	stb	%l3,[%o3+0x0c1]		! Mem[00000000218000c0] = ff005cf4
!	%l5 = fffffffffba30000, Mem[0000000010001410] = 00000000
	stba	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	Mem[0000000010001414] = 00000000, %l1 = 0000000000000700
	swap	[%i0+0x014],%l1		! %l1 = 0000000000000000
!	%f14 = 787b74ff 00000000, %l7 = 0000000000000004
!	Mem[0000000030181438] = 0000f1c8edbe00c3
	add	%i6,0x038,%g1
	stda	%f14,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030181438] = 000000c8edbe00c3
!	%f16 = eec27c83 894141d4 24000000 00000000
!	%f20 = 8b000000 2ec7218b fffc3ad8 000000ae
!	%f24 = 00001f9d ff040000 2e824d80 0000ffff
!	%f28 = 03f20000 21000000 0000f1c8 edbe00c3
	stda	%f16,[%i5]ASI_BLK_S	! Block Store to 0000000030141400
!	%f2  = d9d2725c, Mem[00000000100c140c] = 00000000
	st	%f2 ,[%i3+0x00c]	! Mem[00000000100c140c] = d9d2725c
!	%l0 = 0000000000000004, Mem[0000000010141400] = ae000000d83afcff
	stxa	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000000000000004
!	Mem[00000000201c0000] = 66a78ea0, %l5 = fffffffffba30000
	ldstuba	[%o0+0x000]%asi,%l5	! %l5 = 00000066000000ff
!	%l7 = 0000000000000004, %l3 = 0000000000000000, %l1 = 0000000000000000
	xor	%l7,%l3,%l1		! %l1 = 0000000000000004
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000030141400] = eec27c83, %l5 = 0000000000000066
	ldswa	[%i5+%g0]0x81,%l5	! %l5 = ffffffffeec27c83

p0_label_67:
!	Mem[0000000010101408] = ff040000, %l7 = 0000000000000004
	ldswa	[%i4+%o4]0x80,%l7	! %l7 = ffffffffff040000
!	Mem[0000000030101400] = 48be2cff, %f15 = 00000000
	lda	[%i4+%g0]0x89,%f15	! %f15 = 48be2cff
!	%l0 = 0000000000000004, imm = fffffffffffffc13, %l1 = 0000000000000004
	add	%l0,-0x3ed,%l1		! %l1 = fffffffffffffc17
!	Mem[0000000030101400] = f39cc6a748be2cff, %l1 = fffffffffffffc17
	ldxa	[%i4+%g0]0x89,%l1	! %l1 = f39cc6a748be2cff
!	Mem[0000000030081410] = 00002400, %l1 = f39cc6a748be2cff
	lduha	[%i2+%o5]0x89,%l1	! %l1 = 0000000000002400
!	Mem[0000000010141408] = 8fb218ff, %l3 = 0000000000000000
	lduba	[%i5+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181410] = 9d1fe08f, %l4 = 00000000fcc2a29f
	ldub	[%i6+0x011],%l4		! %l4 = 000000000000001f
!	Code Fragment 4
p0_fragment_9:
!	%l0 = 0000000000000004
	setx	0xc0147707b5db3f2f,%g7,%l0 ! %l0 = c0147707b5db3f2f
!	%l1 = 0000000000002400
	setx	0x5e1f56c064bee498,%g7,%l1 ! %l1 = 5e1f56c064bee498
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c0147707b5db3f2f
	setx	0xbb67375877db7f6e,%g7,%l0 ! %l0 = bb67375877db7f6e
!	%l1 = 5e1f56c064bee498
	setx	0xb3f97c5044d8dfc8,%g7,%l1 ! %l1 = b3f97c5044d8dfc8
!	Mem[00000000218001c0] = 890808e2, %l7 = ffffffffff040000
	ldub	[%o3+0x1c1],%l7		! %l7 = 0000000000000008
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 6c21f9a6, %l2 = d83afcff, %l4 = 0000001f
	casa	[%i2]0x80,%l2,%l4	! %l4 = 000000006c21f9a6

p0_label_68:
!	%f27 = 0000ffff, %f22 = fffc3ad8, %f21 = 2ec7218b
	fsubs	%f27,%f22,%f21		! %f21 = fffc3ad8
!	%l4 = 000000006c21f9a6, Mem[00000000100c142c] = 00f979c9
	stw	%l4,[%i3+0x02c]		! Mem[00000000100c142c] = 6c21f9a6
!	Mem[0000000030041400] = 006d0000, %l5 = ffffffffeec27c83
	swapa	[%i1+%g0]0x89,%l5	! %l5 = 00000000006d0000
!	Mem[0000000030001410] = ff00beed, %l7 = 0000000000000008
	swapa	[%i0+%o5]0x81,%l7	! %l7 = 00000000ff00beed
!	Mem[0000000010181410] = 8fe01f9d, %l3 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l3	! %l3 = 0000009d000000ff
!	Mem[000000001000143c] = fefb0050, %l3 = 000000000000009d
	swap	[%i0+0x03c],%l3		! %l3 = 00000000fefb0050
!	Mem[0000000010101410] = 00000000, %l5 = 00000000006d0000
	swapa	[%i4+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081408] = 000074ff, %l1 = b3f97c5044d8dfc8
	swapa	[%i2+%o4]0x88,%l1	! %l1 = 00000000000074ff
!	%f6  = 8b21c72e 000000f2, Mem[0000000010101420] = 0f92f05c 08aa9b1d
	std	%f6 ,[%i4+0x020]	! Mem[0000000010101420] = 8b21c72e 000000f2
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00002400, %l2 = ffffffffd83afcff
	lduba	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000000

p0_label_69:
!	Mem[0000000010101400] = 24000000, %f15 = 48be2cff
	lda	[%i4+%g0]0x88,%f15	! %f15 = 24000000
!	Mem[0000000030081410] = 00002400, %l7 = 00000000ff00beed
	lduha	[%i2+%o5]0x89,%l7	! %l7 = 0000000000002400
!	Mem[0000000010001408] = ff000000, %l4 = 000000006c21f9a6
	ldsba	[%i0+0x00b]%asi,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0000] = ffa78ea0, %l2 = 0000000000000000
	lduba	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1408] = 000000ff, %l7 = 0000000000002400
	lduba	[%i3+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141410] = 8b21c72e0000008b, %l6 = 0000000000000000
	ldxa	[%i5+%o5]0x89,%l6	! %l6 = 8b21c72e0000008b
!	Mem[0000000010041410] = 1f18b28f, %l1 = 00000000000074ff
	lduwa	[%i1+%o5]0x88,%l1	! %l1 = 000000001f18b28f
!	Mem[0000000010101418] = 418fd5a5, %l3 = 00000000fefb0050
	lduh	[%i4+0x01a],%l3		! %l3 = 000000000000d5a5
!	Mem[0000000030101408] = 4d0000ff, %l7 = 00000000000000ff
	lduha	[%i4+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 8fb2181f, %l0 = bb67375877db7f6e
	ldstuba	[%i1+%o5]0x80,%l0	! %l0 = 0000008f000000ff

p0_label_70:
!	%l2 = 00000000000000ff, Mem[0000000010101413] = 00006d00
	stb	%l2,[%i4+0x013]		! Mem[0000000010101410] = 00006dff
!	%f30 = 0000f1c8, Mem[000000001004141c] = 5cff8198
	st	%f30,[%i1+0x01c]	! Mem[000000001004141c] = 0000f1c8
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010181400] = ffffffff 21000000
	stda	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000 00000000
!	%l5 = 0000000000000000, Mem[00000000211c0000] = ffae3487
	sth	%l5,[%o2+%g0]		! Mem[00000000211c0000] = 00003487
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010081400] = 6c21f9a6 2b9ea6ee
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000 00000000
!	%l5 = 0000000000000000, Mem[0000000030081408] = fcc2a29f
	stba	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = 00c2a29f
!	Mem[0000000030101408] = 4d0000ff, %l1 = 000000001f18b28f
	ldstuba	[%i4+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	Code Fragment 4
p0_fragment_10:
!	%l0 = 000000000000008f
	setx	0xc7a6cb9070254f72,%g7,%l0 ! %l0 = c7a6cb9070254f72
!	%l1 = 00000000000000ff
	setx	0x83e5813045f77b18,%g7,%l1 ! %l1 = 83e5813045f77b18
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c7a6cb9070254f72
	setx	0x332f06ef8cc58260,%g7,%l0 ! %l0 = 332f06ef8cc58260
!	%l1 = 83e5813045f77b18
	setx	0xa6988bf7a344312a,%g7,%l1 ! %l1 = a6988bf7a344312a
!	%f3  = 8fb2181f, Mem[000000001018142c] = 026c93b5
	sta	%f3 ,[%i6+0x02c]%asi	! Mem[000000001018142c] = 8fb2181f
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00002400, %l7 = 00000000000000ff
	lduwa	[%i3+%o5]0x89,%l7	! %l7 = 0000000000002400

p0_label_71:
!	Mem[0000000030041400] = 837cc2ee, %l4 = 0000000000000000
	lduwa	[%i1+%g0]0x81,%l4	! %l4 = 00000000837cc2ee
!	Mem[0000000010041400] = 045d000000001f9d, %f2  = d9d2725c 8fb2181f
	ldda	[%i1+%g0]0x88,%f2 	! %f2  = 045d0000 00001f9d
!	Mem[00000000211c0000] = 00003487, %l3 = 000000000000d5a5
	ldsb	[%o2+0x001],%l3		! %l3 = 0000000000000000
!	%l5 = 0000000000000000, %l1 = a6988bf7a344312a, %l0 = 332f06ef8cc58260
	xnor	%l5,%l1,%l0		! %l0 = 596774085cbbced5
!	Mem[00000000201c0000] = ffa78ea0, %l0 = 596774085cbbced5
	lduba	[%o0+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101410] = 0000fffb, %l2 = 00000000000000ff
	ldsba	[%i4+%o5]0x89,%l2	! %l2 = fffffffffffffffb
!	Mem[0000000030081410] = 00240000 87630200, %l4 = 837cc2ee, %l5 = 00000000
	ldda	[%i2+%o5]0x81,%l4	! %l4 = 0000000000240000 0000000087630200
!	%f7  = 000000f2, %f6  = 8b21c72e
	fcmps	%fcc3,%f7 ,%f6 		! %fcc3 = 2
!	Mem[0000000010081408] = 44d8dfc8, %l0 = 00000000000000ff
	ldsba	[%i2+%o4]0x88,%l0	! %l0 = ffffffffffffffc8
!	Starting 10 instruction Store Burst
!	%l5 = 0000000087630200, Mem[0000000010141408] = ff18b28f5c72d2d9
	stxa	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000000087630200

p0_label_72:
!	%l6 = 8b21c72e0000008b, Mem[0000000030041410] = 00000000
	stha	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 008b0000
!	Mem[0000000030081408] = 00c2a29f, %l2 = fffffffffffffffb
	swapa	[%i2+%o4]0x81,%l2	! %l2 = 0000000000c2a29f
!	%l0 = ffffffffffffffc8, Mem[0000000030101400] = ff2cbe48
	stwa	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = ffffffc8
!	Mem[0000000010041410] = 1f18b2ff, %l3 = 0000000000000000
	ldstuba	[%i1+%o5]0x88,%l3	! %l3 = 000000ff000000ff
!	%l4 = 0000000000240000, Mem[0000000020800040] = 6d25c0bd, %asi = 80
	stha	%l4,[%o1+0x040]%asi	! Mem[0000000020800040] = 0000c0bd
!	Mem[00000000201c0001] = ffa78ea0, %l7 = 0000000000002400
	ldstuba	[%o0+0x001]%asi,%l7	! %l7 = 000000a7000000ff
!	%l7 = 00000000000000a7, Mem[0000000030081400] = 8b000000
	stba	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = a7000000
!	%f25 = ff040000, Mem[0000000010181410] = 8fe01fff
	sta	%f25,[%i6+%o5]0x88	! Mem[0000000010181410] = ff040000
!	%l5 = 0000000087630200, Mem[0000000010101420] = 8b21c72e, %asi = 80
	stwa	%l5,[%i4+0x020]%asi	! Mem[0000000010101420] = 87630200
!	Starting 10 instruction Load Burst
!	Mem[000000001010143c] = b26f7ccf, %l7 = 00000000000000a7
	ldsh	[%i4+0x03c],%l7		! %l7 = ffffffffffffb26f

p0_label_73:
!	Mem[0000000030001400] = f39cc6a748be2c46, %l0 = ffffffffffffffc8
	ldxa	[%i0+%g0]0x89,%l0	! %l0 = f39cc6a748be2c46
!	Mem[0000000010141410] = 00005dff, %l1 = a6988bf7a344312a
	ldswa	[%i5+%o5]0x88,%l1	! %l1 = 0000000000005dff
!	Mem[0000000010001408] = 000000ff, %l7 = ffffffffffffb26f
	lduha	[%i0+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000211c0000] = 00003487, %l2 = 0000000000c2a29f
	ldub	[%o2+0x001],%l2		! %l2 = 0000000000000000
!	Mem[0000000010141410] = ff5d0000, %l1 = 0000000000005dff
	ldswa	[%i5+%o5]0x80,%l1	! %l1 = ffffffffff5d0000
!	Mem[0000000030181408] = 000000002148e600, %l6 = 8b21c72e0000008b
	ldxa	[%i6+%o4]0x89,%l6	! %l6 = 000000002148e600
!	Mem[00000000100c1408] = 5c72d2d9 000000ff, %l4 = 00240000, %l5 = 87630200
	ldda	[%i3+%o4]0x88,%l4	! %l4 = 00000000000000ff 000000005c72d2d9
!	Mem[0000000010101410] = 00006dff00000000, %f4  = ff000000 ea6c00ff
	ldda	[%i4+%o5]0x80,%f4 	! %f4  = 00006dff 00000000
!	Mem[0000000010181400] = 00000000, %l3 = 00000000000000ff
	lduwa	[%i6+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 000000ff, %l2 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l2	! %l2 = 00000000000000ff

p0_label_74:
!	%l5 = 000000005c72d2d9, Mem[0000000021800041] = 217dd078, %asi = 80
	stba	%l5,[%o3+0x041]%asi	! Mem[0000000021800040] = 21d9d078
!	%f4  = 00006dff 00000000, %f7  = 000000f2
	fdtoi	%f4 ,%f7 		! %l0 = f39cc6a748be2c68, Unfinished, %fsr = 2000000400
!	Mem[00000000100c1408] = 00000000, %l0 = f39cc6a748be2c68
	swapa	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000000
!	%l4 = 00000000000000ff, Mem[0000000020800000] = ff9f4ebd
	sth	%l4,[%o1+%g0]		! Mem[0000000020800000] = 00ff4ebd
!	%l5 = 000000005c72d2d9, Mem[0000000030081400] = a7000000
	stba	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = d9000000
!	Mem[0000000010081400] = 0000000000000000, %l2 = 00000000000000ff, %l3 = 0000000000000000
	casxa	[%i2]0x80,%l2,%l3	! %l3 = 0000000000000000
!	%f10 = 7ffb8e61 7b68038d, %l3 = 0000000000000000
!	Mem[00000000300c1400] = 00005d04ff18b28f
	stda	%f10,[%i3+%l3]ASI_PST32_SL ! Mem[00000000300c1400] = 00005d04ff18b28f
!	Mem[0000000010181408] = 9d1f0000, %l5 = 000000005c72d2d9
	ldstuba	[%i6+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000020800000] = 00ff4ebd, %l7 = 00000000000000ff
	ldstub	[%o1+%g0],%l7		! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00000024, %l2 = 00000000000000ff
	swapa	[%i5+%o4]0x89,%l2	! %l2 = 0000000000000024

p0_label_75:
!	Mem[0000000030181410] = ff000000, %f15 = 24000000
	lda	[%i6+%o5]0x81,%f15	! %f15 = ff000000
!	Mem[0000000010001410] = 00000000, %l7 = 0000000000000000
	lduha	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[000000001014141c] = 256d0000, %l0 = 0000000000000000
	ldsw	[%i5+0x01c],%l0		! %l0 = 00000000256d0000
!	%f31 = edbe00c3, %f11 = 7b68038d
	fcmpes	%fcc3,%f31,%f11		! %fcc3 = 1
!	Mem[0000000010181418] = 83cf7f402e8ea061, %l5 = 0000000000000000
	ldx	[%i6+0x018],%l5		! %l5 = 83cf7f402e8ea061
!	Mem[0000000010141400] = 0000000000000004, %f4  = 00006dff 00000000
	ldda	[%i5+%g0]0x88,%f4 	! %f4  = 00000000 00000004
!	Mem[0000000010041408] = ff000000, %l3 = 0000000000000000
	ldsha	[%i1+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = ff5d0000, %f19 = 00000000
	lda	[%i5+%o5]0x80,%f19	! %f19 = ff5d0000
!	Mem[00000000100c1418] = 712e3efd, %l7 = 0000000000000000
	lduwa	[%i3+0x018]%asi,%l7	! %l7 = 00000000712e3efd
!	Starting 10 instruction Store Burst
!	%f15 = ff000000, %f7  = 000000f2, %f14 = 787b74ff
	fdivs	%f15,%f7 ,%f14		! %f14 = ff800000

p0_label_76:
!	%l5 = 83cf7f402e8ea061, Mem[00000000211c0000] = 00003487, %asi = 80
	stha	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = a0613487
!	Mem[0000000010001438] = 1c00aafc, %l0 = 00000000256d0000
	swap	[%i0+0x038],%l0		! %l0 = 000000001c00aafc
!	%f0  = 00001f9d 7ccfb6db 045d0000 00001f9d
!	%f4  = 00000000 00000004 8b21c72e 000000f2
!	%f8  = 03f20000 9d1f0000 7ffb8e61 7b68038d
!	%f12 = 21000000 ffffffff ff800000 ff000000
	stda	%f0,[%i0]ASI_BLK_PL	! Block Store to 0000000010001400
!	%f0  = 00001f9d 7ccfb6db 045d0000 00001f9d
!	%f4  = 00000000 00000004 8b21c72e 000000f2
!	%f8  = 03f20000 9d1f0000 7ffb8e61 7b68038d
!	%f12 = 21000000 ffffffff ff800000 ff000000
	stda	%f0,[%i1]ASI_BLK_AIUS	! Block Store to 0000000030041400
!	Mem[0000000010141408] = 00000000, %l6 = 000000002148e600
	ldstuba	[%i5+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081400] = 000000d9, %l5 = 83cf7f402e8ea061
	swapa	[%i2+%g0]0x89,%l5	! %l5 = 00000000000000d9
!	Mem[0000000010081410] = e4250160, %l4 = 00000000000000ff
	swapa	[%i2+%o5]0x88,%l4	! %l4 = 00000000e4250160
!	%f0  = 00001f9d 7ccfb6db 045d0000 00001f9d
!	%f4  = 00000000 00000004 8b21c72e 000000f2
!	%f8  = 03f20000 9d1f0000 7ffb8e61 7b68038d
!	%f12 = 21000000 ffffffff ff800000 ff000000
	stda	%f0,[%i4]ASI_BLK_PL	! Block Store to 0000000010101400
!	%f24 = 00001f9d, Mem[0000000010141408] = ff000000
	sta	%f24,[%i5+%o4]0x80	! Mem[0000000010141408] = 00001f9d
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000010101400] = dbb6cf7c9d1f0000, %f24 = 00001f9d ff040000
	ldda	[%i4+%g0]0x80,%f24	! %f24 = dbb6cf7c 9d1f0000

p0_label_77:
!	Mem[0000000030141410] = 8b21c72e 0000008b, %l4 = e4250160, %l5 = 000000d9
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 000000000000008b 000000008b21c72e
!	Code Fragment 3
p0_fragment_11:
!	%l0 = 000000001c00aafc
	setx	0x9a2cb3efca72d4f9,%g7,%l0 ! %l0 = 9a2cb3efca72d4f9
!	%l1 = ffffffffff5d0000
	setx	0x3a3cfc1fa4e04b26,%g7,%l1 ! %l1 = 3a3cfc1fa4e04b26
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9a2cb3efca72d4f9
	setx	0xa6c64fb01fafa7ee,%g7,%l0 ! %l0 = a6c64fb01fafa7ee
!	%l1 = 3a3cfc1fa4e04b26
	setx	0x1ff59b987bdefe83,%g7,%l1 ! %l1 = 1ff59b987bdefe83
!	Mem[0000000030181400] = eec27c83, %l3 = 0000000000000000
	lduha	[%i6+%g0]0x81,%l3	! %l3 = 000000000000eec2
!	Mem[0000000010001424] = 0000f203, %l0 = a6c64fb01fafa7ee
	ldsha	[%i0+0x024]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181408] = ff001f9d, %l7 = 00000000712e3efd
	lduwa	[%i6+%o4]0x80,%l7	! %l7 = 00000000ff001f9d
!	Mem[0000000010041410] = ffb2181f, %l4 = 000000000000008b
	ldsba	[%i1+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001408] = 00001f9d, %l6 = 0000000000000000
	lduwa	[%i0+%o4]0x88,%l6	! %l6 = 0000000000001f9d
!	%f17 = 894141d4, %f23 = 000000ae, %f12 = 21000000 ffffffff
	fsmuld	%f17,%f23,%f12		! %l0 = 0000000000000022, Unfinished, %fsr = 1000000400
!	Mem[0000000030181408] = 00e64821 00000000, %l0 = 00000022, %l1 = 7bdefe83
	ldda	[%i6+%o4]0x81,%l0	! %l0 = 0000000000e64821 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = ff000000, %l6 = 0000000000001f9d
	ldstuba	[%i2+%o5]0x80,%l6	! %l6 = 000000ff000000ff

p0_label_78:
!	%l6 = 00000000000000ff, immd = 00000000000008a2, %l7 = 00000000ff001f9d
	sdivx	%l6,0x8a2,%l7		! %l7 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010001400] = dbb6cf7c
	stwa	%l7,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	Mem[0000000010101438] = 000000ff000080ff, %l3 = 000000000000eec2, %l0 = 0000000000e64821
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l3,%l0	! %l0 = 000000ff000080ff
!	Mem[00000000211c0001] = a0613487, %l7 = 0000000000000000
	ldstuba	[%o2+0x001]%asi,%l7	! %l7 = 00000061000000ff
!	Mem[0000000030101400] = c8ffffff, %l7 = 0000000000000061
	swapa	[%i4+%g0]0x89,%l7	! %l7 = 00000000c8ffffff
!	Mem[0000000010041420] = 387dd8539cceffba, %l3 = 000000000000eec2, %l3 = 000000000000eec2
	add	%i1,0x20,%g1
	casxa	[%g1]0x80,%l3,%l3	! %l3 = 387dd8539cceffba
!	%f10 = 7ffb8e61 7b68038d, Mem[0000000010181408] = ff001f9d 0000f203
	stda	%f10,[%i6+%o4]0x80	! Mem[0000000010181408] = 7ffb8e61 7b68038d
!	%l4 = ffffffff, %l5 = 8b21c72e, Mem[0000000010141428] = 905f0c6b 830600c3
	std	%l4,[%i5+0x028]		! Mem[0000000010141428] = ffffffff 8b21c72e
!	Mem[0000000010101408] = 9d1f000000005d04, %l4 = ffffffffffffffff, %l7 = 00000000c8ffffff
	add	%i4,0x08,%g1
	casxa	[%g1]0x80,%l4,%l7	! %l7 = 9d1f000000005d04
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 045d000000001f9d, %f8  = 03f20000 9d1f0000
	ldda	[%i0+%o4]0x88,%f8 	! %f8  = 045d0000 00001f9d

p0_label_79:
!	Mem[00000000100c1410] = 218bffff, %l5 = 000000008b21c72e
	ldsha	[%i3+%o5]0x80,%l5	! %l5 = 000000000000218b
!	Mem[0000000010081400] = 00000000, %l1 = 0000000000000000
	ldswa	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = d4414189837cc2ee, %l3 = 387dd8539cceffba
	ldxa	[%i5+%g0]0x89,%l3	! %l3 = d4414189837cc2ee
!	%l0 = 000000ff000080ff, %l7 = 9d1f000000005d04, %l4 = ffffffffffffffff
	andn	%l0,%l7,%l4		! %l4 = 000000ff000080fb
!	Mem[0000000030101400] = 00000061, %l7 = 9d1f000000005d04
	lduwa	[%i4+%g0]0x89,%l7	! %l7 = 0000000000000061
!	Mem[00000000100c1408] = 682cbe48, %f7  = 000000f2
	lda	[%i3+%o4]0x88,%f7 	! %f7 = 682cbe48
!	Mem[0000000030001400] = f39cc6a7 48be2c46, %l2 = 00000024, %l3 = 837cc2ee
	ldda	[%i0+%g0]0x89,%l2	! %l2 = 0000000048be2c46 00000000f39cc6a7
!	Mem[0000000030101400] = 00000061, %l0 = 000000ff000080ff
	lduwa	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000061
!	Mem[0000000030001408] = ff747b7802823364, %f20 = 8b000000 fffc3ad8
	ldda	[%i0+%o4]0x81,%f20	! %f20 = ff747b78 02823364
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000218b, Mem[0000000010041400] = 00001f9d
	stwa	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000218b

p0_label_80:
!	%f24 = dbb6cf7c 9d1f0000, Mem[0000000030181400] = eec27c83 894141d4
	stda	%f24,[%i6+%g0]0x81	! Mem[0000000030181400] = dbb6cf7c 9d1f0000
!	Mem[000000001014140b] = 00001f9d, %l2 = 0000000048be2c46
	ldstuba	[%i5+0x00b]%asi,%l2	! %l2 = 0000009d000000ff
!	%l1 = 0000000000000000, Mem[0000000010101418] = f20000002ec7218b
	stx	%l1,[%i4+0x018]		! Mem[0000000010101418] = 0000000000000000
!	%l2 = 000000000000009d, Mem[0000000030181400] = dbb6cf7c9d1f0000
	stxa	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000000000009d
!	Mem[0000000010141414] = 000074ff, %l2 = 000000000000009d
	swap	[%i5+0x014],%l2		! %l2 = 00000000000074ff
!	Mem[0000000010081410] = 000000ff, %l5 = 000000000000218b
	swapa	[%i2+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	%f7  = 682cbe48, Mem[0000000010181400] = 00000000
	sta	%f7 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 682cbe48
!	%f24 = dbb6cf7c, Mem[0000000030041400] = 00001f9d
	sta	%f24,[%i1+%g0]0x81	! Mem[0000000030041400] = dbb6cf7c
!	%l6 = 00000000000000ff, Mem[0000000030141410] = 0000008b
	stwa	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 0400000000000000, %l5 = 00000000000000ff
	ldxa	[%i5+%g0]0x80,%l5	! %l5 = 0400000000000000

p0_label_81:
!	Mem[0000000010181410] = 000004ff, %l6 = 00000000000000ff
	lduha	[%i6+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = 61000000, %l5 = 0400000000000000
	lduwa	[%i4+%g0]0x81,%l5	! %l5 = 0000000061000000
!	Mem[0000000030181410] = ff000000, %l4 = 000000ff000080fb
	lduha	[%i6+%o5]0x81,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010101400] = dbb6cf7c9d1f0000, %f12 = 21000000 ffffffff
	ldda	[%i4+%g0]0x80,%f12	! %f12 = dbb6cf7c 9d1f0000
!	%f22 = fffc3ad8, %f23 = 000000ae, %f30 = 0000f1c8
	fadds	%f22,%f23,%f30		! %f30 = fffc3ad8
!	Mem[0000000010141438] = 00000000, %l6 = 0000000000000000
	ldsb	[%i5+0x039],%l6		! %l6 = 0000000000000000
!	%l5 = 0000000061000000, immd = 0000000000000b4e, %l7 = 0000000000000061
	udivx	%l5,0xb4e,%l7		! %l7 = 000000000008949c
!	Mem[0000000030041410] = 0000000000000004, %f18 = 24000000 ff5d0000
	ldda	[%i1+%o5]0x81,%f18	! %f18 = 00000000 00000004
!	Mem[0000000010081420] = 6ddaff08 c791c515, %l0 = 00000061, %l1 = 00000000
	ldda	[%i2+0x020]%asi,%l0	! %l0 = 000000006ddaff08 00000000c791c515
!	Starting 10 instruction Store Burst
!	%l0 = 000000006ddaff08, Mem[00000000100c1428] = 7fffffff
	stw	%l0,[%i3+0x028]		! Mem[00000000100c1428] = 6ddaff08

p0_label_82:
!	Mem[0000000010141407] = 00000000, %l5 = 0000000061000000
	ldstub	[%i5+0x007],%l5		! %l5 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000010101408] = 9d1f000000005d04
	stxa	%l5,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000000000000000
!	%f16 = eec27c83 894141d4, Mem[0000000010001410] = 04000000 00000000
	stda	%f16,[%i0+%o5]0x80	! Mem[0000000010001410] = eec27c83 894141d4
!	%l3 = 00000000f39cc6a7, Mem[0000000010041424] = 9cceffba
	sth	%l3,[%i1+0x024]		! Mem[0000000010041424] = c6a7ffba
!	%l0 = 6ddaff08, %l1 = c791c515, Mem[00000000100c1408] = 682cbe48 5c72d2d9
	stda	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 6ddaff08 c791c515
!	Mem[0000000030101410] = fbff0000, %l4 = 000000000000ff00
	swapa	[%i4+%o5]0x81,%l4	! %l4 = 00000000fbff0000
!	%l2 = 000074ff, %l3 = f39cc6a7, Mem[0000000010081408] = 44d8dfc8 00000000
	stda	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 000074ff f39cc6a7
!	Mem[0000000010001418] = f2000000, %l1 = 00000000c791c515, %asi = 80
	swapa	[%i0+0x018]%asi,%l1	! %l1 = 00000000f2000000
!	%f10 = 7ffb8e61, %f1  = 7ccfb6db
	fcmps	%fcc1,%f10,%f1 		! %fcc1 = 3
!	Starting 10 instruction Load Burst
!	Mem[0000000010141420] = 600125e4cae1d280, %l3 = 00000000f39cc6a7
	ldx	[%i5+0x020],%l3		! %l3 = 600125e4cae1d280

p0_label_83:
!	Mem[0000000030101410] = 00ff0000, %l4 = 00000000fbff0000
	lduha	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0000] = ffff8ea0, %l3 = 600125e4cae1d280
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000030041400] = dbb6cf7c 7ccfb6db 045d0000 00001f9d
!	Mem[0000000030041410] = 00000000 00000004 8b21c72e 000000f2
!	Mem[0000000030041420] = 03f20000 9d1f0000 7ffb8e61 7b68038d
!	Mem[0000000030041430] = 21000000 ffffffff ff800000 ff000000
	ldda	[%i1]ASI_BLK_S,%f16	! Block Load from 0000000030041400
!	Mem[0000000010081410] = 8b21000024b25d04, %f0  = 00001f9d 7ccfb6db
	ldda	[%i2+0x010]%asi,%f0 	! %f0  = 8b210000 24b25d04
!	Mem[0000000030001410] = 00000008, %f3  = 00001f9d
	lda	[%i0+%o5]0x81,%f3 	! %f3 = 00000008
!	Mem[0000000010081408] = ff740000a7c69cf3, %f2  = 045d0000 00000008
	ldda	[%i2+0x008]%asi,%f2 	! %f2  = ff740000 a7c69cf3
!	%l3 = ffffffffffffffff, %l1 = 00000000f2000000, %l1 = 00000000f2000000
	or	%l3,%l1,%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010181408] = 7ffb8e61, %l6 = 0000000000000000
	lduba	[%i6+%o4]0x80,%l6	! %l6 = 000000000000007f
!	Mem[00000000218001c0] = 890808e2, %l5 = 0000000000000000
	lduh	[%o3+0x1c0],%l5		! %l5 = 0000000000008908
!	Starting 10 instruction Store Burst
!	%l6 = 0000007f, %l7 = 0008949c, Mem[0000000010101408] = 00000000 00000000
	stda	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000007f 0008949c

p0_label_84:
!	%l6 = 0000007f, %l7 = 0008949c, Mem[0000000010101400] = dbb6cf7c 9d1f0000
	std	%l6,[%i4+%g0]		! Mem[0000000010101400] = 0000007f 0008949c
!	%f11 = 7b68038d, Mem[0000000030181408] = 2148e600
	sta	%f11,[%i6+%o4]0x89	! Mem[0000000030181408] = 7b68038d
!	%l7 = 000000000008949c, Mem[0000000010181430] = eec27c21, %asi = 80
	stha	%l7,[%i6+0x030]%asi	! Mem[0000000010181430] = 949c7c21
!	%f7  = 682cbe48, %f9  = 00001f9d
	fsqrts	%f7 ,%f9 		! %f9  = 53d24a7b
!	%l3 = ffffffffffffffff, Mem[00000000100c1400] = ff000000
	stwa	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffffffff
!	%l1 = ffffffffffffffff, Mem[0000000010141400] = 00000004
	stwa	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffffff
!	Mem[0000000010041410] = ffb2181f, %l4 = 0000000000000000
	ldstuba	[%i1+%o5]0x80,%l4	! %l4 = 000000ff000000ff
!	%f14 = ff800000 ff000000, Mem[0000000030181410] = 000000ff 00000000
	stda	%f14,[%i6+%o5]0x89	! Mem[0000000030181410] = ff800000 ff000000
!	Mem[0000000010041422] = 387dd853, %l6 = 000000000000007f
	ldstuba	[%i1+0x022]%asi,%l6	! %l6 = 000000d8000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ff000000, %l7 = 000000000008949c
	ldswa	[%i6+%o5]0x89,%l7	! %l7 = ffffffffff000000

p0_label_85:
!	Mem[0000000010101408] = 9c9408007f000000, %l3 = ffffffffffffffff
	ldxa	[%i4+%o4]0x88,%l3	! %l3 = 9c9408007f000000
!	Mem[0000000010001408] = 9d1f000000005d04, %l1 = ffffffffffffffff
	ldxa	[%i0+%o4]0x80,%l1	! %l1 = 9d1f000000005d04
!	Mem[0000000030041410] = 00000000, %l4 = 00000000000000ff
	lduha	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	%f12 = dbb6cf7c, %f15 = ff000000, %f7  = 682cbe48
	fmuls	%f12,%f15,%f7 		! %f7  = 7f800000
!	Mem[0000000010101400] = 0000007f, %l2 = 00000000000074ff
	lduha	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1400] = 045d0000, %f3  = a7c69cf3
	lda	[%i3+%g0]0x89,%f3 	! %f3 = 045d0000
!	Mem[0000000030041400] = dbb6cf7c7ccfb6db, %l1 = 9d1f000000005d04
	ldxa	[%i1+%g0]0x81,%l1	! %l1 = dbb6cf7c7ccfb6db
!	Code Fragment 4
p0_fragment_12:
!	%l0 = 000000006ddaff08
	setx	0x02db393037c01ec1,%g7,%l0 ! %l0 = 02db393037c01ec1
!	%l1 = dbb6cf7c7ccfb6db
	setx	0x2b75c7101cf67639,%g7,%l1 ! %l1 = 2b75c7101cf67639
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 02db393037c01ec1
	setx	0xd176fab05fb27b5a,%g7,%l0 ! %l0 = d176fab05fb27b5a
!	%l1 = 2b75c7101cf67639
	setx	0xc054a210649a4c4a,%g7,%l1 ! %l1 = c054a210649a4c4a
!	Mem[0000000010041410] = 1f18b2ff, %l1 = c054a210649a4c4a
	lduha	[%i1+%o5]0x88,%l1	! %l1 = 000000000000b2ff
!	Starting 10 instruction Store Burst
!	%l0 = 5fb27b5a, %l1 = 0000b2ff, Mem[0000000030141408] = 000000ff 00000000
	stda	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 5fb27b5a 0000b2ff

p0_label_86:
	membar	#Sync			! Added by membar checker (12)
!	%l2 = 0000000000000000, Mem[0000000030041400] = 7ccfb6db
	stwa	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
!	%l5 = 0000000000008908, Mem[00000000300c1410] = 00240000
	stwa	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00008908
!	Mem[0000000030081410] = 00002400, %l1 = 000000000000b2ff
	ldstuba	[%i2+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%l0 = d176fab05fb27b5a, Mem[0000000010181410] = 000004ff
	stwa	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 5fb27b5a
!	Mem[00000000300c1400] = 045d0000, %l5 = 0000000000008908
	ldstuba	[%i3+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%l7 = ffffffffff000000, Mem[0000000010181400] = 682cbe4800000000
	stx	%l7,[%i6+%g0]		! Mem[0000000010181400] = ffffffffff000000
!	%l7 = ffffffffff000000, Mem[0000000030081408] = fbffffff
	stha	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = fbff0000
!	Mem[0000000010101400] = 7f000000, %l1 = 0000000000000000
	swapa	[%i4+%g0]0x88,%l1	! %l1 = 000000007f000000
!	Mem[0000000030141410] = 000000ff, %l6 = 00000000000000d8
	ldstuba	[%i5+%o5]0x89,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 000000ff, %f8  = 045d0000
	lda	[%i6+%o5]0x81,%f8 	! %f8 = 000000ff

p0_label_87:
!	Mem[0000000010181424] = 000000f2, %l0 = d176fab05fb27b5a
	ldsb	[%i6+0x025],%l0		! %l0 = 0000000000000000
!	Mem[00000000100c1408] = 08ffda6d 15c591c7, %l2 = 00000000, %l3 = 7f000000
	ldda	[%i3+%o4]0x80,%l2	! %l2 = 0000000008ffda6d 0000000015c591c7
!	Mem[0000000021800000] = 46b9133c, %l6 = 00000000000000ff
	ldsh	[%o3+%g0],%l6		! %l6 = 00000000000046b9
!	Mem[0000000010141408] = ff1f0000, %l3 = 0000000015c591c7
	ldsba	[%i5+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081410] = 8b210000, %l5 = 0000000000000000
	lduwa	[%i2+%o5]0x80,%l5	! %l5 = 000000008b210000
!	Mem[00000000100c1438] = a7f0131f, %l4 = 0000000000000000, %asi = 80
	swapa	[%i3+0x038]%asi,%l4	! %l4 = 00000000a7f0131f
!	Mem[0000000030141400] = d4414189837cc2ee, %f20 = 00000000 00000004
	ldda	[%i5+%g0]0x89,%f20	! %f20 = d4414189 837cc2ee
!	Mem[0000000010041400] = 8b21000000005d04, %l7 = ffffffffff000000
	ldxa	[%i1+%g0]0x80,%l7	! %l7 = 8b21000000005d04
!	Mem[0000000010101408] = 7f000000, %l3 = 0000000000000000
	ldsha	[%i4+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, immed = 00000a8d, %y  = 000000ad
	sdiv	%l3,0xa8d,%l6		! %l6 = 0000000010659a95
	mov	%l0,%y			! %y = 00000000

p0_label_88:
!	Mem[0000000010141428] = ffffffff8b21c72e, %l4 = 00000000a7f0131f, %l0 = 0000000000000000
	add	%i5,0x28,%g1
	casxa	[%g1]0x80,%l4,%l0	! %l0 = ffffffff8b21c72e
!	%f0  = 8b210000 24b25d04 ff740000 045d0000
!	%f4  = 00000000 00000004 8b21c72e 7f800000
!	%f8  = 000000ff 53d24a7b 7ffb8e61 7b68038d
!	%f12 = dbb6cf7c 9d1f0000 ff800000 ff000000
	stda	%f0,[%i5]ASI_COMMIT_P	! Block Store to 0000000010141400
!	%l7 = 8b21000000005d04, Mem[00000000300c1410] = 00008908
	stba	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 04008908
	membar	#Sync			! Added by membar checker (13)
!	%f28 = 21000000 ffffffff, %l0 = ffffffff8b21c72e
!	Mem[0000000010141400] = 8b21000024b25d04
	stda	%f28,[%i5+%l0]ASI_PST8_PL ! Mem[0000000010141400] = 8bffffff24005d04
!	Mem[0000000010041434] = ff5db224, %l3 = 00000000, %l0 = 8b21c72e
	add	%i1,0x34,%g1
	casa	[%g1]0x80,%l3,%l0	! %l0 = 00000000ff5db224
!	Mem[00000000211c0000] = a0ff3487, %l3 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 000000a0000000ff
!	%f0  = 8b210000, Mem[0000000030081408] = 0000fffb
	sta	%f0 ,[%i2+%o4]0x81	! Mem[0000000030081408] = 8b210000
!	%f1  = 24b25d04, Mem[00000000100c1400] = ffffffff
	sta	%f1 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 24b25d04
!	Mem[0000000030081408] = 0000218b, %l5 = 000000008b210000
	ldstuba	[%i2+%o4]0x89,%l5	! %l5 = 0000008b000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 48be2c46, %f9  = 53d24a7b
	lda	[%i0+%g0]0x89,%f9 	! %f9 = 48be2c46

p0_label_89:
!	Mem[0000000010081410] = 0000218b, %l3 = 00000000000000a0
	lduha	[%i2+%o5]0x88,%l3	! %l3 = 000000000000218b
!	Mem[0000000010041410] = ffb2181f 87630200, %l4 = a7f0131f, %l5 = 0000008b
	ldda	[%i1+%o5]0x80,%l4	! %l4 = 00000000ffb2181f 0000000087630200
!	Mem[00000000100c1410] = 218bffff d138de74, %l2 = 08ffda6d, %l3 = 0000218b
	ldd	[%i3+%o5],%l2		! %l2 = 00000000218bffff 00000000d138de74
!	Mem[0000000010041400] = 045d00000000218b, %f0  = 8b210000 24b25d04
	ldda	[%i1+%g0]0x88,%f0 	! %f0  = 045d0000 0000218b
!	Mem[0000000010181400] = ffffffff, %l2 = 00000000218bffff
	lduwa	[%i6+%g0]0x88,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000010081408] = ff740000, %f14 = ff800000
	lda	[%i2+%o4]0x80,%f14	! %f14 = ff740000
!	Mem[0000000030141410] = ff000000, %l3 = 00000000d138de74
	ldswa	[%i5+%o5]0x81,%l3	! %l3 = ffffffffff000000
!	Mem[0000000030101408] = 4d0000ff, %f5  = 00000004
	lda	[%i4+%o4]0x89,%f5 	! %f5 = 4d0000ff
!	Mem[00000000100c1400] = 24b25d04, %l7 = 8b21000000005d04
	ldswa	[%i3+%g0]0x88,%l7	! %l7 = 0000000024b25d04
!	Starting 10 instruction Store Burst
!	%f12 = dbb6cf7c 9d1f0000, %l4 = 00000000ffb2181f
!	Mem[00000000300c1408] = 000000f956b9e2dd
	add	%i3,0x008,%g1
	stda	%f12,[%g1+%l4]ASI_PST32_SL ! Mem[00000000300c1408] = 00001f9d7ccfb6db

p0_label_90:
!	Mem[0000000030101400] = 00000061, %l4 = 00000000ffb2181f
	swapa	[%i4+%g0]0x89,%l4	! %l4 = 0000000000000061
!	%l2 = 00000000ffffffff, Mem[0000000010141400] = 045d0024ffffff8b
	stxa	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000ffffffff
!	%f20 = d4414189 837cc2ee, Mem[0000000030081408] = ff210000 57b22d28
	stda	%f20,[%i2+%o4]0x81	! Mem[0000000030081408] = d4414189 837cc2ee
!	%f10 = 7ffb8e61 7b68038d, Mem[0000000010041408] = ff000000 ffff0000
	stda	%f10,[%i1+%o4]0x88	! Mem[0000000010041408] = 7ffb8e61 7b68038d
!	Mem[0000000030181400] = 00000000, %l2 = 00000000ffffffff
	swapa	[%i6+%g0]0x81,%l2	! %l2 = 0000000000000000
!	%f20 = d4414189 837cc2ee, %l3 = ffffffffff000000
!	Mem[0000000010001430] = ffffffff00000021
	add	%i0,0x030,%g1
	stda	%f20,[%g1+%l3]ASI_PST8_P ! Mem[0000000010001430] = ffffffff00000021
!	%l6 = 0000000010659a95, Mem[0000000010181430] = 949c7c21
	stw	%l6,[%i6+0x030]		! Mem[0000000010181430] = 10659a95
!	%l0 = ff5db224, %l1 = 7f000000, Mem[0000000010101420] = 00001f9d 0000f203
	stda	%l0,[%i4+0x020]%asi	! Mem[0000000010101420] = ff5db224 7f000000
!	%l1 = 000000007f000000, Mem[0000000030181410] = ff000000
	stba	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 218bffff, %l1 = 000000007f000000
	lduba	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000021

p0_label_91:
!	Mem[00000000100c1438] = 00000000 000000ff, %l2 = 00000000, %l3 = ff000000
	ldd	[%i3+0x038],%l2		! %l2 = 0000000000000000 00000000000000ff
!	Mem[0000000030181410] = 000000ff, %l7 = 0000000024b25d04
	ldsha	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001410] = d4414189 837cc2ee, %l0 = ff5db224, %l1 = 00000021
	ldda	[%i0+%o5]0x88,%l0	! %l0 = 00000000837cc2ee 00000000d4414189
!	Mem[00000000100c1408] = 6ddaff08, %l1 = 00000000d4414189
	lduha	[%i3+%o4]0x88,%l1	! %l1 = 000000000000ff08
!	Mem[00000000201c0000] = ffff8ea0, %l0 = 00000000837cc2ee
	lduh	[%o0+%g0],%l0		! %l0 = 000000000000ffff
!	Mem[00000000211c0000] = ffff3487, %l3 = 00000000000000ff
	lduh	[%o2+%g0],%l3		! %l3 = 000000000000ffff
!	Mem[0000000010181408] = 618efb7f, %f1  = 0000218b
	lda	[%i6+%o4]0x88,%f1 	! %f1 = 618efb7f
!	Mem[0000000030001410] = 08000000, %l5 = 0000000087630200
	ldsba	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l0 = 000000000000ffff
	ldsba	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000010659a95, Mem[0000000030041410] = 00000000
	stba	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000095

p0_label_92:
!	%l4 = 0000000000000061, Mem[0000000030141400] = d4414189837cc2ee
	stxa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000061
!	Mem[00000000100c1410] = 218bffff, %l1 = 000000000000ff08
	swapa	[%i3+%o5]0x80,%l1	! %l1 = 00000000218bffff
!	Mem[00000000100c1410] = 0000ff08, %l5 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[00000000100c1400] = 045db22400005d04
	stxa	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l1 = 00000000218bffff
	ldstuba	[%i3+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041430] = 00046214, %l0 = 0000000000000000
	swap	[%i1+0x030],%l0		! %l0 = 0000000000046214
!	Mem[0000000020800001] = ffff4ebd, %l1 = 0000000000000000
	ldstuba	[%o1+0x001]%asi,%l1	! %l1 = 000000ff000000ff
!	%l6 = 10659a95, %l7 = 00000000, Mem[0000000010041408] = 8d03687b 618efb7f
	stda	%l6,[%i1+0x008]%asi	! Mem[0000000010041408] = 10659a95 00000000
!	%l6 = 0000000010659a95, Mem[000000001004143c] = 8c8b1aa3, %asi = 80
	stwa	%l6,[%i1+0x03c]%asi	! Mem[000000001004143c] = 10659a95
!	Starting 10 instruction Load Burst
!	%l2 = 0000000000000000, %l7 = 0000000000000000, %l2 = 0000000000000000
	xor	%l2,%l7,%l2		! %l2 = 0000000000000000

p0_label_93:
!	Mem[0000000030001408] = ff747b78, %l6 = 0000000010659a95
	ldsba	[%i0+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030101400] = f39cc6a7ffb2181f, %l7 = 0000000000000000
	ldxa	[%i4+%g0]0x89,%l7	! %l7 = f39cc6a7ffb2181f
!	Mem[0000000030181408] = 8d03687b 00000000, %l0 = 00046214, %l1 = 000000ff
	ldda	[%i6+%o4]0x81,%l0	! %l0 = 000000008d03687b 0000000000000000
!	Mem[0000000030081400] = 61a08e2e, %f11 = 7b68038d
	lda	[%i2+%g0]0x81,%f11	! %f11 = 61a08e2e
!	Mem[0000000010041400] = 0000218b, %l4 = 0000000000000061
	lduwa	[%i1+%g0]0x88,%l4	! %l4 = 000000000000218b
!	Mem[00000000211c0000] = ffff3487, %l0 = 000000008d03687b
	lduh	[%o2+%g0],%l0		! %l0 = 000000000000ffff
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000030101400] = 1f18b2ff a7c69cf3 ff00004d fc4379c9
!	Mem[0000000030101410] = 0000ff00 045d0000 04ab8e31 1d4201a7
!	Mem[0000000030101420] = afe103e1 2bb9970c b02b9bb0 2edfd309
!	Mem[0000000030101430] = 3b22a1a6 a6f921ef fc3f840f 990336e2
	ldda	[%i4]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030101400
!	Mem[0000000030181408] = 8d03687b00000000, %l1 = 0000000000000000
	ldxa	[%i6+%o4]0x81,%l1	! %l1 = 8d03687b00000000
!	Mem[00000000201c0000] = ffff8ea0, %l7 = f39cc6a7ffb2181f
	lduh	[%o0+%g0],%l7		! %l7 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, imm = 0000000000000f4f, %l1 = 8d03687b00000000
	subc	%l2,0xf4f,%l1		! %l1 = fffffffffffff0b1

p0_label_94:
!	%l5 = 0000000000000000, Mem[00000000300c1400] = ff005d04
	stba	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00005d04
!	%l5 = 0000000000000000, Mem[0000000030141400] = 00000061
	stha	%l5,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	%l0 = 000000000000ffff, Mem[0000000030141410] = ff000000
	stba	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = ff000000
	membar	#Sync			! Added by membar checker (15)
!	%l4 = 0000218b, %l5 = 00000000, Mem[0000000030101400] = 1f18b2ff a7c69cf3
	stda	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000218b 00000000
!	%f2  = c97943fc 4d0000ff, Mem[00000000300c1400] = 00005d04 ff18b28f
	stda	%f2 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = c97943fc 4d0000ff
!	%f28 = 21000000, Mem[0000000030181408] = 8d03687b
	sta	%f28,[%i6+%o4]0x81	! Mem[0000000030181408] = 21000000
!	%l4 = 000000000000218b, %l5 = 0000000000000000, %l6 = ffffffffffffffff
	addc	%l4,%l5,%l6		! %l6 = 000000000000218b
!	%l7 = 000000000000ffff, %l6 = 000000000000218b, %l5 = 0000000000000000
	xnor	%l7,%l6,%l5		! %l5 = ffffffffffff218b
!	%f16 = dbb6cf7c 7ccfb6db 045d0000 00001f9d
!	%f20 = d4414189 837cc2ee 8b21c72e 000000f2
!	%f24 = 03f20000 9d1f0000 7ffb8e61 7b68038d
!	%f28 = 21000000 ffffffff ff800000 ff000000
	stda	%f16,[%i0]ASI_BLK_AIUPL	! Block Store to 0000000010001400
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (16)
!	Mem[00000000300c1400] = c97943fc 4d0000ff 00001f9d 7ccfb6db
!	Mem[00000000300c1410] = 04008908 170b79f0 3ef0d581 a668d2ff
!	Mem[00000000300c1420] = 7099543b 968f5ab2 fddf580a dc69950b
!	Mem[00000000300c1430] = 518be99b 51f5d93e 38763b02 0700da69
	ldda	[%i3]ASI_BLK_AIUS,%f0	! Block Load from 00000000300c1400

p0_label_95:
!	Mem[0000000030001408] = 787b74ff, %l5 = ffffffffffff218b
	lduba	[%i0+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081438] = 0097d890, %l6 = 000000000000218b
	ldsha	[%i2+0x03a]%asi,%l6	! %l6 = ffffffffffffd890
!	Mem[000000001014140c] = 045d0000, %l0 = 000000000000ffff
	ldub	[%i5+0x00f],%l0		! %l0 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l2 = 0000000000000000
	ldsba	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1430] = 2a763b21, %l4 = 000000000000218b
	lduwa	[%i3+0x030]%asi,%l4	! %l4 = 000000002a763b21
!	Mem[0000000010041408] = 10659a95, %f25 = 9d1f0000
	lda	[%i1+%o4]0x80,%f25	! %f25 = 10659a95
!	Mem[0000000030041410] = 00000095, %l1 = fffffffffffff0b1
	lduwa	[%i1+%o5]0x89,%l1	! %l1 = 0000000000000095
!	Mem[0000000010181408] = 8d03687b 618efb7f, %l0 = 00000000, %l1 = 00000095
	ldda	[%i6+%o4]0x88,%l0	! %l0 = 00000000618efb7f 000000008d03687b
!	Mem[0000000010141410] = 00000000, %l5 = 00000000000000ff
	ldsba	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 000024ff, %l4 = 000000002a763b21
	ldstuba	[%i2+%o5]0x89,%l4	! %l4 = 000000ff000000ff

p0_label_96:
!	%l3 = 000000000000ffff, Mem[0000000030141400] = 00000000
	stwa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000ffff
!	Mem[0000000030001400] = 48be2c46, %l1 = 000000008d03687b
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 00000046000000ff
!	%f24 = 03f20000 10659a95, Mem[0000000030081400] = 61a08e2e 7b68038d
	stda	%f24,[%i2+%g0]0x81	! Mem[0000000030081400] = 03f20000 10659a95
	membar	#Sync			! Added by membar checker (17)
!	%l7 = 000000000000ffff, Mem[00000000300c1400] = fc4379c9
	stba	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = fc4379ff
!	%l3 = 000000000000ffff, Mem[0000000010001410] = eec27c83
	stba	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = ffc27c83
!	Mem[0000000030081400] = 0000f203, %l0 = 00000000618efb7f
	swapa	[%i2+%g0]0x89,%l0	! %l0 = 000000000000f203
!	Mem[0000000010041418] = 9d6528b7, %l7 = 000000000000ffff
	swap	[%i1+0x018],%l7		! %l7 = 000000009d6528b7
!	%l4 = 00000000000000ff, Mem[0000000030101410] = 0000ff00
	stba	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = ff00ff00
!	%l0 = 0000f203, %l1 = 00000046, Mem[0000000010181410] = 5a7bb25f c3000683
	stda	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000f203 00000046
!	Starting 10 instruction Load Burst
!	%l0 = 000000000000f203, imm = fffffffffffff9d4, %l7 = 000000009d6528b7
	orn	%l0,-0x62c,%l7		! %l7 = 000000000000f62b

p0_label_97:
!	Mem[0000000030141408] = 5fb27b5a, %f29 = ffffffff
	lda	[%i5+%o4]0x89,%f29	! %f29 = 5fb27b5a
!	Mem[0000000030181410] = 000000ff000080ff, %l7 = 000000000000f62b
	ldxa	[%i6+%o5]0x81,%l7	! %l7 = 000000ff000080ff
!	Mem[0000000010081400] = 00000000, %l3 = 000000000000ffff
	ldsba	[%i2+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1410] = 04008908 170b79f0, %l0 = 0000f203, %l1 = 00000046
	ldda	[%i3+%o5]0x81,%l0	! %l0 = 0000000004008908 00000000170b79f0
!	Mem[000000001014140c] = 045d0000, %l4 = 00000000000000ff
	lduba	[%i5+0x00f]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001400] = dbb6cf7c, %f4  = 04008908
	lda	[%i0+0x000]%asi,%f4 	! %f4 = dbb6cf7c
!	Mem[00000000100c1438] = 00000000000000ff, %f0  = c97943fc 4d0000ff
	ldda	[%i3+0x038]%asi,%f0 	! %f0  = 00000000 000000ff
!	Mem[0000000030001400] = ff2cbe48 a7c69cf3, %l0 = 04008908, %l1 = 170b79f0
	ldda	[%i0+%g0]0x81,%l0	! %l0 = 00000000ff2cbe48 00000000a7c69cf3
!	Mem[0000000030141410] = 000000ff, %l5 = 0000000000000000
	ldsba	[%i5+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ff2cbe48, Mem[0000000020800001] = ffff4ebd
	stb	%l0,[%o1+0x001]		! Mem[0000000020800000] = ff484ebd

p0_label_98:
!	%f16 = dbb6cf7c 7ccfb6db 045d0000 00001f9d
!	%f20 = d4414189 837cc2ee 8b21c72e 000000f2
!	%f24 = 03f20000 10659a95 7ffb8e61 7b68038d
!	%f28 = 21000000 5fb27b5a ff800000 ff000000
	stda	%f16,[%i2]ASI_BLK_S	! Block Store to 0000000030081400
!	%l1 = 00000000a7c69cf3, Mem[000000001000142a] = 8d03687b
	sth	%l1,[%i0+0x02a]		! Mem[0000000010001428] = 8d039cf3
!	Mem[0000000030041410] = 00000095, %l3 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l3	! %l3 = 00000095000000ff
!	%l2 = 0000000000000000, Mem[0000000030141408] = 5a7bb25f
	stba	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 007bb25f
!	%l5 = ffffffffffffffff, Mem[0000000010141410] = 00000000
	stba	%l5,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff
!	Mem[00000000100c1414] = d138de74, %l4 = 0000000000000000
	swap	[%i3+0x014],%l4		! %l4 = 00000000d138de74
!	%l4 = 00000000d138de74, Mem[0000000010081430] = 8b21c72e24b25d04
	stx	%l4,[%i2+0x030]		! Mem[0000000010081430] = 00000000d138de74
!	Mem[0000000020800040] = 0000c0bd, %l5 = ffffffffffffffff
	ldstuba	[%o1+0x040]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1400] = ff000000, %l6 = ffffffffffffd890
	ldstuba	[%i3+%g0]0x80,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001010141c] = 00000000, %l2 = 0000000000000000
	ldsw	[%i4+0x01c],%l2		! %l2 = 0000000000000000

p0_label_99:
!	%l4 = 00000000d138de74, imm = 0000000000000a4c, %l6 = 00000000000000ff
	subc	%l4,0xa4c,%l6		! %l6 = 00000000d138d428
!	Mem[0000000010101428] = 8d03687b, %l3 = 0000000000000095
	ldswa	[%i4+0x028]%asi,%l3	! %l3 = ffffffff8d03687b
!	Mem[0000000010001400] = dbb6cf7c7ccfb6db, %f14 = 38763b02 0700da69
	ldda	[%i0+0x000]%asi,%f14	! %f14 = dbb6cf7c 7ccfb6db
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010081410] = 8b210000, %l5 = 0000000000000000
	lduha	[%i2+%o5]0x80,%l5	! %l5 = 0000000000008b21
!	Mem[00000000100c1410] = ff00ff08, %l5 = 0000000000008b21
	ldsba	[%i3+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030141410] = ff000000, %l4 = 00000000d138de74
	ldswa	[%i5+%o5]0x81,%l4	! %l4 = ffffffffff000000
!	Mem[0000000030101408] = ff00004d, %l6 = 00000000d138d428
	lduha	[%i4+%o4]0x81,%l6	! %l6 = 000000000000ff00
!	Mem[0000000010041400] = 0000218b, %l0 = 00000000ff2cbe48
	lduha	[%i1+%g0]0x88,%l0	! %l0 = 000000000000218b
!	Mem[0000000010041428] = 00000000, %l2 = 0000000000000000
	ldsha	[%i1+0x028]%asi,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041420] = 387dff53c6a7ffba, %l0 = 000000000000218b, %l1 = 00000000a7c69cf3
	add	%i1,0x20,%g1
	casxa	[%g1]0x80,%l0,%l1	! %l1 = 387dff53c6a7ffba

p0_label_100:
!	%l5 = ffffffffffffffff, Mem[0000000010181408] = 7ffb8e61
	stw	%l5,[%i6+%o4]		! Mem[0000000010181408] = ffffffff
!	Mem[000000001010143c] = 000080ff, %l1 = 387dff53c6a7ffba
	ldstuba	[%i4+0x03c]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041410] = 1f18b2ff, %l5 = ffffffffffffffff
	ldstuba	[%i1+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	%f29 = 5fb27b5a, Mem[0000000010081400] = 00000000
	sta	%f29,[%i2+%g0]0x80	! Mem[0000000010081400] = 5fb27b5a
!	%f26 = 7ffb8e61 7b68038d, Mem[00000000100c1410] = ff00ff08 00000000
	stda	%f26,[%i3+%o5]0x80	! Mem[00000000100c1410] = 7ffb8e61 7b68038d
!	%l1 = 0000000000000000, Mem[0000000010081408] = 000074ff
	stba	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = 00007400
!	Mem[0000000010081422] = 6ddaff08, %l7 = 000000ff000080ff
	ldstuba	[%i2+0x022]%asi,%l7	! %l7 = 000000ff000000ff
!	%l3 = ffffffff8d03687b, Mem[0000000010081400] = 5a7bb25f
	stwa	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = 8d03687b
!	%l6 = 000000000000ff00, Mem[0000000030081400] = dbb6cf7c
	stha	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = ff00cf7c
!	Starting 10 instruction Load Burst
!	Mem[0000000010141418] = 8b21c72e7f800000, %f4  = dbb6cf7c 170b79f0
	ldd	[%i5+0x018],%f4 	! %f4  = 8b21c72e 7f800000

p0_label_101:
!	Code Fragment 4
p0_fragment_13:
!	%l0 = 000000000000218b
	setx	0xb24e87481f3a029f,%g7,%l0 ! %l0 = b24e87481f3a029f
!	%l1 = 0000000000000000
	setx	0x893470f067a57c58,%g7,%l1 ! %l1 = 893470f067a57c58
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b24e87481f3a029f
	setx	0xf78489482a50fb5a,%g7,%l0 ! %l0 = f78489482a50fb5a
!	%l1 = 893470f067a57c58
	setx	0xb456a45854c07ea1,%g7,%l1 ! %l1 = b456a45854c07ea1
!	Mem[0000000010181410] = 03f20000, %l5 = 00000000000000ff
	ldswa	[%i6+%o5]0x80,%l5	! %l5 = 0000000003f20000
!	Mem[0000000010181400] = ffffffff ff000000, %l0 = 2a50fb5a, %l1 = 54c07ea1
	ldda	[%i6+0x000]%asi,%l0	! %l0 = 00000000ffffffff 00000000ff000000
!	Mem[0000000010101408] = 0000007f, %l7 = 00000000000000ff
	lduha	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000000
!	%l5 = 0000000003f20000, imm = 000000000000063e, %l0 = 00000000ffffffff
	and	%l5,0x63e,%l0		! %l0 = 0000000000000000
!	Mem[0000000010001400] = dbb6cf7c 7ccfb6db 9d1f0000 00005d04
!	Mem[0000000010001410] = ffc27c83 894141d4 f2000000 2ec7218b
!	Mem[0000000010001420] = 00001f9d 0000f203 8d039cf3 618efb7f
!	Mem[0000000010001430] = ffffffff 00000021 000000ff 000080ff
	ldda	[%i0]ASI_BLK_P,%f0	! Block Load from 0000000010001400
!	Code Fragment 4
p0_fragment_14:
!	%l0 = 0000000000000000
	setx	0xfa0256f82b89737c,%g7,%l0 ! %l0 = fa0256f82b89737c
!	%l1 = 00000000ff000000
	setx	0x4f9ef418231f4dd1,%g7,%l1 ! %l1 = 4f9ef418231f4dd1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = fa0256f82b89737c
	setx	0xf12ee217ca5714f9,%g7,%l0 ! %l0 = f12ee217ca5714f9
!	%l1 = 4f9ef418231f4dd1
	setx	0x4754d80fab88eb82,%g7,%l1 ! %l1 = 4754d80fab88eb82
!	Mem[0000000030101410] = 00005d04 00ff00ff, %l4 = ff000000, %l5 = 03f20000
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 0000000000ff00ff 0000000000005d04
!	%l1 = 4754d80fab88eb82, imm = 000000000000063b, %l4 = 0000000000ff00ff
	xor	%l1,0x63b,%l4		! %l4 = 4754d80fab88edb9
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = ff00000000000000, %f16 = dbb6cf7c 7ccfb6db
	ldda	[%i3+%g0]0x80,%f16	! %f16 = ff000000 00000000

p0_label_102:
!	%l3 = ffffffff8d03687b, Mem[0000000010101408] = 0000007f
	stwa	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = 8d03687b
!	Mem[0000000010041408] = 959a6510, %l6 = 000000000000ff00
	ldstuba	[%i1+%o4]0x88,%l6	! %l6 = 00000010000000ff
!	%l3 = ffffffff8d03687b, Mem[00000000300c1408] = 9d1f0000
	stha	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = 9d1f687b
	membar	#Sync			! Added by membar checker (19)
!	%l6 = 0000000000000010, Mem[0000000010001408] = 00001f9d
	stwa	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000010
!	%l5 = 0000000000005d04, Mem[0000000030041408] = 045d0000
	stha	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 5d040000
!	%f26 = 7ffb8e61 7b68038d, Mem[0000000030001408] = 787b74ff 64338202
	stda	%f26,[%i0+%o4]0x89	! Mem[0000000030001408] = 7ffb8e61 7b68038d
!	%f8  = 00001f9d 0000f203, Mem[0000000030081410] = 894141d4 eec27c83
	stda	%f8 ,[%i2+%o5]0x89	! Mem[0000000030081410] = 00001f9d 0000f203
!	%f29 = 5fb27b5a, Mem[0000000030081408] = 00005d04
	sta	%f29,[%i2+%o4]0x89	! Mem[0000000030081408] = 5fb27b5a
!	Mem[000000001008142c] = 3f4400ae, %l4 = 4754d80fab88edb9
	swap	[%i2+0x02c],%l4		! %l4 = 000000003f4400ae
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1420] = 9c18380b, %l1 = 4754d80fab88eb82
	ldub	[%i3+0x020],%l1		! %l1 = 000000000000009c

p0_label_103:
!	Mem[0000000030181410] = 000000ff, %l0 = f12ee217ca5714f9
	ldswa	[%i6+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141410] = ff00000000000004, %f22 = 8b21c72e 000000f2
	ldda	[%i5+0x010]%asi,%f22	! %f22 = ff000000 00000004
!	%l7 = 0000000000000000, immed = 00000eb6, %y  = 00000000
	sdiv	%l7,0xeb6,%l5		! %l5 = 0000000000000000
	mov	%l0,%y			! %y = 000000ff
!	Mem[00000000218001c0] = 890808e2, %l5 = 0000000000000000
	ldsh	[%o3+0x1c0],%l5		! %l5 = ffffffffffff8908
!	Mem[0000000020800000] = ff484ebd, %l3 = ffffffff8d03687b
	ldsha	[%o1+0x000]%asi,%l3	! %l3 = ffffffffffffff48
!	Mem[0000000030001408] = 8d03687b, %l6 = 0000000000000010
	lduha	[%i0+%o4]0x81,%l6	! %l6 = 0000000000008d03
!	Mem[0000000010181400] = ffffffff, %l2 = 0000000000000000
	lduha	[%i6+%g0]0x88,%l2	! %l2 = 000000000000ffff
!	%f16 = ff000000, %f28 = 21000000, %f9  = 0000f203
	fsubs	%f16,%f28,%f9 		! %f9  = ff000000
!	Mem[0000000010101408] = 7b68038d, %l4 = 000000003f4400ae
	lduba	[%i4+%o4]0x88,%l4	! %l4 = 000000000000008d
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 5fb27b00, %l6 = 0000000000008d03
	ldstuba	[%i5+%o4]0x89,%l6	! %l6 = 00000000000000ff

p0_label_104:
!	%l3 = ffffffffffffff48, Mem[00000000100c1408] = 08ffda6d
	stha	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff48da6d
!	%f29 = 5fb27b5a, Mem[0000000010001408] = 10000000
	sta	%f29,[%i0+0x008]%asi	! Mem[0000000010001408] = 5fb27b5a
!	%l1 = 000000000000009c, Mem[0000000030101400] = 0000218b
	stwa	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000009c
!	%l0 = 000000ff, %l1 = 0000009c, Mem[0000000010141400] = ffffffff 00000000
	stda	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff 0000009c
!	%l0 = 000000ff, %l1 = 0000009c, Mem[00000000100c1410] = 618efb7f 8d03687b
	stda	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ff 0000009c
!	Mem[00000000201c0000] = ffff8ea0, %l3 = ffffffffffffff48
	ldstub	[%o0+%g0],%l3		! %l3 = 000000ff000000ff
!	%f30 = ff800000 ff000000, Mem[0000000030041410] = ff000000 00000004
	stda	%f30,[%i1+%o5]0x81	! Mem[0000000030041410] = ff800000 ff000000
!	%f26 = 7ffb8e61 7b68038d, Mem[0000000010101408] = 8d03687b 0008949c
	stda	%f26,[%i4+%o4]0x80	! Mem[0000000010101408] = 7ffb8e61 7b68038d
!	%l0 = 00000000000000ff, Mem[0000000010001416] = 894141d4
	sth	%l0,[%i0+0x016]		! Mem[0000000010001414] = 894100ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 03f20000, %l1 = 000000000000009c
	lduwa	[%i6+%o5]0x80,%l1	! %l1 = 0000000003f20000

p0_label_105:
!	Mem[0000000010041400] = 8b21000000005d04, %l1 = 0000000003f20000
	ldx	[%i1+%g0],%l1		! %l1 = 8b21000000005d04
!	Mem[0000000030081408] = 5a7bb25f, %l4 = 000000000000008d
	lduba	[%i2+%o4]0x81,%l4	! %l4 = 000000000000005a
!	Mem[0000000010141410] = ff000000, %f12 = ffffffff
	lda	[%i5+%o5]0x80,%f12	! %f12 = ff000000
!	Mem[0000000010081400] = 7b68038d, %l2 = 000000000000ffff
	ldsha	[%i2+%g0]0x80,%l2	! %l2 = 0000000000007b68
!	Mem[0000000010181400] = 000000ffffffffff, %l1 = 8b21000000005d04
	ldxa	[%i6+%g0]0x88,%l1	! %l1 = 000000ffffffffff
!	Mem[000000001014141c] = 7f800000, %l2 = 0000000000007b68
	lduh	[%i5+0x01e],%l2		! %l2 = 0000000000000000
!	Mem[0000000010001404] = 7ccfb6db, %l5 = ffffffffffff8908
	lduba	[%i0+0x006]%asi,%l5	! %l5 = 00000000000000b6
!	Mem[00000000100c1400] = ff000000, %l3 = 00000000000000ff
	lduba	[%i3+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041418] = 0000ffff, %l1 = 000000ffffffffff
	lduha	[%i1+0x01a]%asi,%l1	! %l1 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%f16 = ff000000 00000000 045d0000 00001f9d
!	%f20 = d4414189 837cc2ee ff000000 00000004
!	%f24 = 03f20000 10659a95 7ffb8e61 7b68038d
!	%f28 = 21000000 5fb27b5a ff800000 ff000000
	stda	%f16,[%i5]ASI_COMMIT_P	! Block Store to 0000000010141400

p0_label_106:
!	Mem[0000000030141410] = 000000ff, %l3 = 00000000000000ff
	ldstuba	[%i5+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	%f12 = ff000000 00000021, Mem[00000000300c1408] = 7b681f9d 7ccfb6db
	stda	%f12,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff000000 00000021
!	%f2  = 9d1f0000 00005d04, %l7 = 0000000000000000
!	Mem[00000000100c1410] = ff0000009c000000
	add	%i3,0x010,%g1
	stda	%f2,[%g1+%l7]ASI_PST8_PL ! Mem[00000000100c1410] = ff0000009c000000
!	%l3 = 00000000000000ff, Mem[0000000010101400] = 00000000
	stha	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff
!	%f12 = ff000000 00000021, Mem[00000000300c1408] = ff000000 00000021
	stda	%f12,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff000000 00000021
!	%l7 = 0000000000000000, Mem[0000000010101400] = 000000ff
	stha	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000
!	%l2 = 0000000000000000, Mem[00000000300c1408] = ff000000
	stwa	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	Mem[000000001004143d] = 10659a95, %l7 = 0000000000000000
	ldstub	[%i1+0x03d],%l7		! %l7 = 00000065000000ff
!	%l2 = 0000000000000000, Mem[0000000010041400] = 8b21000000005d04
	stxa	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 21000000 00000000, %l6 = 00000000, %l7 = 00000065
	ldda	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000 0000000021000000

p0_label_107:
!	Mem[0000000030101410] = ff00ff00, %l2 = 0000000000000000
	ldsba	[%i4+%o5]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010081400] = 7b68038d, %l1 = 000000000000ffff
	lduh	[%i2+%g0],%l1		! %l1 = 0000000000007b68
!	Mem[00000000100c1408] = ff48da6d, %l6 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030081408] = 9d1f0000 5fb27b5a, %l4 = 0000005a, %l5 = 000000b6
	ldda	[%i2+%o4]0x89,%l4	! %l4 = 000000005fb27b5a 000000009d1f0000
!	Mem[0000000010101408] = 7ffb8e61, %l2 = ffffffffffffffff
	lduha	[%i4+%o4]0x80,%l2	! %l2 = 0000000000007ffb
!	%l1 = 0000000000007b68, imm = 000000000000073b, %l5 = 000000009d1f0000
	subc	%l1,0x73b,%l5		! %l5 = 000000000000742d
!	Mem[0000000030081410] = 00001f9d 0000f203, %l4 = 5fb27b5a, %l5 = 0000742d
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 000000000000f203 0000000000001f9d
!	Mem[0000000030101410] = ff00ff00045d0000, %l7 = 0000000021000000
	ldxa	[%i4+%o5]0x81,%l7	! %l7 = ff00ff00045d0000
!	Mem[0000000030001400] = ff2cbe48, %l7 = ff00ff00045d0000
	lduwa	[%i0+%g0]0x81,%l7	! %l7 = 00000000ff2cbe48
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = ff7bb25f, %l2 = 0000000000007ffb
	ldstuba	[%i5+%o4]0x81,%l2	! %l2 = 000000ff000000ff

p0_label_108:
	membar	#Sync			! Added by membar checker (20)
!	%l4 = 000000000000f203, Mem[0000000010141408] = 9d1f000000005d04
	stxa	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000000000f203
!	%l2 = 00000000000000ff, Mem[0000000010001400] = dbb6cf7c7ccfb6db
	stxa	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000010101410] = 04000000
	stba	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = ff000000
!	%l1 = 0000000000007b68, Mem[00000000100c1410] = ff000000
	stwa	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00007b68
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000010141400] = 000000ff 00000000
	stda	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff 000000ff
!	%f2  = 9d1f0000 00005d04, Mem[0000000010101418] = 00000000 00000000
	std	%f2 ,[%i4+0x018]	! Mem[0000000010101418] = 9d1f0000 00005d04
!	%f24 = 03f20000, Mem[0000000010181400] = ffffffff
	sta	%f24,[%i6+%g0]0x80	! Mem[0000000010181400] = 03f20000
!	Mem[0000000010101400] = 00000000, %l5 = 0000000000001f9d
	swapa	[%i4+%g0]0x80,%l5	! %l5 = 0000000000000000
!	%l7 = 00000000ff2cbe48, Mem[00000000300c1410] = 04008908170b79f0
	stxa	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000ff2cbe48
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00005d0400ff00ff, %l4 = 000000000000f203
	ldxa	[%i4+%o5]0x89,%l4	! %l4 = 00005d0400ff00ff

p0_label_109:
!	Mem[0000000030001400] = ff2cbe48, %l1 = 0000000000007b68
	ldswa	[%i0+%g0]0x81,%l1	! %l1 = ffffffffff2cbe48
!	Mem[0000000010001408] = 5a7bb25f, %f6  = f2000000
	lda	[%i0+%o4]0x88,%f6 	! %f6 = 5a7bb25f
!	Mem[0000000030141408] = ff7bb25f, %l0 = 00000000000000ff
	lduwa	[%i5+%o4]0x81,%l0	! %l0 = 00000000ff7bb25f
!	Mem[0000000010081400] = 7b68038d, %l6 = 00000000000000ff
	ldsha	[%i2+%g0]0x80,%l6	! %l6 = 0000000000007b68
!	Mem[0000000030081408] = 5a7bb25f, %l5 = 0000000000000000
	ldswa	[%i2+%o4]0x81,%l5	! %l5 = 000000005a7bb25f
!	%l6 = 0000000000007b68, imm = fffffffffffff8ce, %l5 = 000000005a7bb25f
	orn	%l6,-0x732,%l5		! %l5 = 0000000000007f79
!	Mem[00000000201c0000] = ffff8ea0, %l5 = 0000000000007f79
	lduha	[%o0+0x000]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010181408] = ffffffff, %f27 = 7b68038d
	lda	[%i6+%o4]0x88,%f27	! %f27 = ffffffff
!	Mem[000000001018143c] = 026c93b5, %l3 = 00000000000000ff
	ldswa	[%i6+0x03c]%asi,%l3	! %l3 = 00000000026c93b5
!	Starting 10 instruction Store Burst
!	%f14 = 000000ff 000080ff, Mem[0000000030101400] = 0000009c 00000000
	stda	%f14,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff 000080ff

p0_label_110:
!	Mem[0000000010181414] = 46000000, %l0 = ff7bb25f, %l1 = ff2cbe48
	add	%i6,0x14,%g1
	casa	[%g1]0x80,%l0,%l1	! %l1 = 0000000046000000
!	%f22 = ff000000, %f7  = 2ec7218b, %f5  = 894141d4
	fdivs	%f22,%f7 ,%f5 		! %f5  = ff800000
!	Mem[0000000010181410] = 0000f203, %l3 = 00000000026c93b5
	swapa	[%i6+%o5]0x88,%l3	! %l3 = 000000000000f203
!	Mem[0000000030141408] = 5fb27bff, %l3 = 000000000000f203
	swapa	[%i5+%o4]0x89,%l3	! %l3 = 000000005fb27bff
!	%l5 = 000000000000ffff, Mem[0000000030101400] = ff000000
	stwa	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000ffff
!	%l0 = 00000000ff7bb25f, Mem[0000000020800000] = ff484ebd
	sth	%l0,[%o1+%g0]		! Mem[0000000020800000] = b25f4ebd
!	%f27 = ffffffff, Mem[0000000010101408] = 618efb7f
	sta	%f27,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffffff
!	%l1 = 0000000046000000, %l1 = 0000000046000000, %y  = 000000ff
	udiv	%l1,%l1,%l5		! %l5 = 00000000000003a5
	mov	%l0,%y			! %y = ff7bb25f
!	%l5 = 00000000000003a5, Mem[0000000010101410] = ff000000
	stwa	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 000003a5
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 9d1f0000 0000045d, %l4 = 00ff00ff, %l5 = 000003a5
	ldda	[%i1+%o4]0x89,%l4	! %l4 = 000000000000045d 000000009d1f0000

p0_label_111:
!	%l6 = 0000000000007b68, %l6 = 0000000000007b68, %l7  = 00000000ff2cbe48
	mulx	%l6,%l6,%l7		! %l7 = 000000003b7d1a40
!	Mem[0000000010041420] = 387dff53, %l5 = 000000009d1f0000
	ldsh	[%i1+0x020],%l5		! %l5 = 000000000000387d
!	Mem[0000000010101410] = a5030000, %l3 = 000000005fb27bff
	ldsba	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101408] = 4d0000ff, %l3 = 0000000000000000
	ldsha	[%i4+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1408] = 00000000, %l6 = 0000000000007b68
	ldsha	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081400] = dbb6cf7c 7ccf00ff, %l4 = 0000045d, %l5 = 0000387d
	ldda	[%i2+%g0]0x89,%l4	! %l4 = 000000007ccf00ff 00000000dbb6cf7c
!	Mem[0000000010001408] = 5a7bb25f, %l7 = 000000003b7d1a40
	ldsha	[%i0+%o4]0x88,%l7	! %l7 = ffffffffffffb25f
!	Mem[0000000030041400] = 00000000, %l7 = ffffffffffffb25f
	ldsba	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081410] = 0000f203, %l7 = 0000000000000000
	lduha	[%i2+%o5]0x89,%l7	! %l7 = 000000000000f203
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 8d03687b, %l4 = 000000007ccf00ff
	swapa	[%i0+%o4]0x81,%l4	! %l4 = 000000008d03687b

p0_label_112:
!	%f10 = 8d039cf3 618efb7f, Mem[0000000010181418] = 83cf7f40 2e8ea061
	std	%f10,[%i6+0x018]	! Mem[0000000010181418] = 8d039cf3 618efb7f
!	Mem[0000000030081408] = 5fb27b5a, %l4 = 000000008d03687b
	ldstuba	[%i2+%o4]0x89,%l4	! %l4 = 0000005a000000ff
!	%l0 = 00000000ff7bb25f, imm = fffffffffffff740, %l2 = 00000000000000ff
	xnor	%l0,-0x8c0,%l2		! %l2 = 00000000ff7bbae0
!	Mem[00000000300c1400] = ff7943fc, %l7 = 000000000000f203
	ldstuba	[%i3+%g0]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010041418] = 0000ffff0000f1c8, %l5 = 00000000dbb6cf7c, %l5 = 00000000dbb6cf7c
	add	%i1,0x18,%g1
	casxa	[%g1]0x80,%l5,%l5	! %l5 = 0000ffff0000f1c8
!	%l6 = 0000000000000000, Mem[0000000010101408] = ffffffff7b68038d
	stxa	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000000000000000
!	Mem[0000000010001408] = 5fb27b5a, %l4 = 000000000000005a
	ldstuba	[%i0+0x008]%asi,%l4	! %l4 = 0000005f000000ff
!	%l3 = 00000000000000ff, %l0 = 00000000ff7bb25f, %l1 = 0000000046000000
	sdivx	%l3,%l0,%l1		! %l1 = 0000000000000000
!	Mem[0000000010081436] = d138de74, %l2 = 00000000ff7bbae0
	ldstuba	[%i2+0x036]%asi,%l2	! %l2 = 000000de000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00740000, %l5 = 0000ffff0000f1c8
	lduwa	[%i2+%o4]0x80,%l5	! %l5 = 0000000000740000

p0_label_113:
!	Mem[0000000020800040] = ff00c0bd, %l2 = 00000000000000de
	lduh	[%o1+0x040],%l2		! %l2 = 000000000000ff00
!	Mem[00000000100c1424] = ff9f6fd6, %l7 = 00000000000000ff
	ldsb	[%i3+0x027],%l7		! %l7 = ffffffffffffffd6
!	%l6 = 0000000000000000, %l4 = 000000000000005f, %l0 = 00000000ff7bb25f
	udivx	%l6,%l4,%l0		! %l0 = 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l4 = 000000000000005f
	ldsha	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101430] = ffffffff 00000021, %l2 = 0000ff00, %l3 = 000000ff
	ldda	[%i4+0x030]%asi,%l2	! %l2 = 00000000ffffffff 0000000000000021
!	%f2  = 9d1f0000, %f23 = 00000004, %f18 = 045d0000 00001f9d
	fsmuld	%f2 ,%f23,%f18		! %l0 = 0000000000000022, Unfinished, %fsr = 1300000400
!	%f24 = 03f20000, %f14 = 000000ff, %f11 = 618efb7f
	fsubs	%f24,%f14,%f11		! %l0 = 0000000000000044, Unfinished, %fsr = 1300000400
!	Mem[00000000201c0000] = ffff8ea0, %l0 = 0000000000000044
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010041410] = 1f18b2ff, %l2 = 00000000ffffffff
	swapa	[%i1+%o5]0x88,%l2	! %l2 = 000000001f18b2ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 0000218b, %l1 = 0000000000000000
	swapa	[%i2+%o5]0x88,%l1	! %l1 = 000000000000218b

p0_label_114:
!	%l4 = 0000000000000000, Mem[00000000100c1410] = 687b0000
	stba	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 687b0000
!	%l2 = 000000001f18b2ff, imm = 0000000000000632, %l7 = ffffffffffffffd6
	sub	%l2,0x632,%l7		! %l7 = 000000001f18accd
!	%f0  = dbb6cf7c 7ccfb6db 9d1f0000 00005d04
!	%f4  = ffc27c83 ff800000 5a7bb25f 2ec7218b
!	%f8  = 00001f9d ff000000 8d039cf3 618efb7f
!	%f12 = ff000000 00000021 000000ff 000080ff
	stda	%f0,[%i3]ASI_COMMIT_P	! Block Store to 00000000100c1400
!	%l6 = 0000000000000000, Mem[0000000030001400] = ff2cbe48
	stha	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000be48
!	Mem[00000000300c1408] = 00000000, %l0 = ffffffffffffffff
	swapa	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000
!	%l7 = 000000001f18accd, Mem[0000000030041408] = 5d040000
	stha	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = accd0000
!	Mem[0000000010181408] = ffffffff, %l4 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l4	! %l4 = 00000000ffffffff
!	Mem[00000000300c1410] = 00000000, %l2 = 000000001f18b2ff
	swapa	[%i3+%o5]0x81,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (21)
!	%f19 = 00001f9d, Mem[00000000100c1418] = 5a7bb25f
	st	%f19,[%i3+0x018]	! Mem[00000000100c1418] = 00001f9d
!	Starting 10 instruction Load Burst
!	%f11 = 618efb7f, %f9  = ff000000, %f17 = 00000000
	fadds	%f11,%f9 ,%f17		! %f17 = ff000000

p0_label_115:
!	Mem[0000000030141408] = 03f20000, %f31 = ff000000
	lda	[%i5+%o4]0x81,%f31	! %f31 = 03f20000
!	Mem[0000000010181408] = 00000000, %l2 = 0000000000000000
	ldswa	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = ffb27b5a, %l5 = 0000000000740000
	ldsw	[%i0+%o4],%l5		! %l5 = ffffffffffb27b5a
!	Code Fragment 3
p0_fragment_15:
!	%l0 = 0000000000000000
	setx	0x0a47e197a495ba67,%g7,%l0 ! %l0 = 0a47e197a495ba67
!	%l1 = 000000000000218b
	setx	0x081c45bfa7a6b8a4,%g7,%l1 ! %l1 = 081c45bfa7a6b8a4
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0a47e197a495ba67
	setx	0x026bccd8519bbe07,%g7,%l0 ! %l0 = 026bccd8519bbe07
!	%l1 = 081c45bfa7a6b8a4
	setx	0x26b6043050d33a18,%g7,%l1 ! %l1 = 26b6043050d33a18
!	Mem[000000001018141c] = 618efb7f, %l0 = 026bccd8519bbe07
	lduha	[%i6+0x01e]%asi,%l0	! %l0 = 000000000000fb7f
!	Mem[0000000010141410] = d4414189, %f10 = 8d039cf3
	lda	[%i5+%o5]0x80,%f10	! %f10 = d4414189
!	Mem[0000000030041410] = 000080ff, %l6 = 0000000000000000
	lduwa	[%i1+%o5]0x89,%l6	! %l6 = 00000000000080ff
!	Mem[0000000010101408] = 00000000, %l2 = 0000000000000000
	lduwa	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001400] = 0000be48 a7c69cf3, %l2 = 00000000, %l3 = 00000021
	ldda	[%i0+%g0]0x81,%l2	! %l2 = 000000000000be48 00000000a7c69cf3
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000080ff, Mem[0000000030101400] = ffff0000
	stba	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = ffff0000

p0_label_116:
!	Mem[0000000010081418] = 21448ed6, %l1 = 50d33a18, %l3 = a7c69cf3
	add	%i2,0x18,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 0000000021448ed6
!	Mem[0000000030041400] = 00000000, %l1 = 26b6043050d33a18
	swapa	[%i1+%g0]0x89,%l1	! %l1 = 0000000000000000
!	%l7 = 000000001f18accd, Mem[00000000100c1410] = 837cc2ff
	stwa	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = 1f18accd
!	%f18 = 045d0000, Mem[0000000030041410] = ff800000
	sta	%f18,[%i1+%o5]0x81	! Mem[0000000030041410] = 045d0000
!	%f13 = 00000021, %f5  = ff800000, %f9  = ff000000
	fdivs	%f13,%f5 ,%f9 		! %f9  = 80000000
!	%l7 = 000000001f18accd, Mem[0000000010001400] = ff000000
	stwa	%l7,[%i0+%g0]0x80	! Mem[0000000010001400] = 1f18accd
!	%f4  = ffc27c83 ff800000, %l2 = 000000000000be48
!	Mem[0000000030141418] = fffc3ad8000000ae
	add	%i5,0x018,%g1
	stda	%f4,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030141418] = fffc3ad80000c2ff
!	%l4 = ffffffff, %l5 = ffb27b5a, Mem[0000000010141438] = ff800000 ff000000
	stda	%l4,[%i5+0x038]%asi	! Mem[0000000010141438] = ffffffff ffb27b5a
!	%l5 = ffffffffffb27b5a, Mem[0000000010101410] = 000003a500000000
	stxa	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffffffffb27b5a
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 8d03687b, %l1 = 0000000000000000
	ldsba	[%i2+%g0]0x88,%l1	! %l1 = 000000000000007b

p0_label_117:
!	Mem[0000000030081400] = ff00cf7c, %l1 = 000000000000007b
	ldsba	[%i2+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	%l3 = 0000000021448ed6, %l1 = ffffffffffffffff, %l2 = 000000000000be48
	and	%l3,%l1,%l2		! %l2 = 0000000021448ed6
!	Mem[00000000300c1408] = ffffffff, %l3 = 0000000021448ed6
	lduba	[%i3+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000020800000] = b25f4ebd, %l2 = 0000000021448ed6
	ldsh	[%o1+%g0],%l2		! %l2 = ffffffffffffb25f
!	Mem[0000000030141408] = 03f20000ffb20000, %l5 = ffffffffffb27b5a
	ldxa	[%i5+%o4]0x81,%l5	! %l5 = 03f20000ffb20000
!	Mem[0000000010081408] = 00740000, %l6 = 00000000000080ff
	ldswa	[%i2+%o4]0x80,%l6	! %l6 = 0000000000740000
!	Mem[0000000010041400] = 00000000 00000000, %l4 = ffffffff, %l5 = ffb20000
	ldda	[%i1+%g0]0x88,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010001400] = 1f18accd, %f31 = 03f20000
	lda	[%i0+%g0]0x80,%f31	! %f31 = 1f18accd
!	Mem[0000000020800040] = ff00c0bd, %l1 = ffffffffffffffff
	lduba	[%o1+0x041]%asi,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[000000001000141c] = 2ec7218b, %l6 = 00740000, %l7 = 1f18accd
	add	%i0,0x1c,%g1
	casa	[%g1]0x80,%l6,%l7	! %l7 = 000000002ec7218b

p0_label_118:
!	Mem[0000000010141422] = 03f20000, %l2 = ffffffffffffb25f
	ldstuba	[%i5+0x022]%asi,%l2	! %l2 = 00000000000000ff
!	%f26 = 7ffb8e61 ffffffff, %l1 = 0000000000000000
!	Mem[0000000010041410] = ffffffff87630200
	add	%i1,0x010,%g1
	stda	%f26,[%g1+%l1]ASI_PST16_P ! Mem[0000000010041410] = ffffffff87630200
!	Mem[0000000010181410] = 026c93b5, %l6 = 0000000000740000
	swapa	[%i6+%o5]0x88,%l6	! %l6 = 00000000026c93b5
!	%l2 = 0000000000000000, Mem[0000000030141410] = ff000000
	stha	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	%f16 = ff000000, Mem[00000000100c1404] = 7ccfb6db
	st	%f16,[%i3+0x004]	! Mem[00000000100c1404] = ff000000
!	%l3 = 00000000000000ff, Mem[0000000010141408] = 03f2000000000000
	stx	%l3,[%i5+%o4]		! Mem[0000000010141408] = 00000000000000ff
!	Mem[00000000100c1410] = cdac181f, %l2 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l2	! %l2 = 00000000cdac181f
!	Mem[0000000030181400] = ffffffff, %l4 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l4	! %l4 = 000000ff000000ff
!	%f6  = 5a7bb25f 2ec7218b, Mem[0000000010081400] = 8d03687b 00000000
	stda	%f6 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 5a7bb25f 2ec7218b
!	Starting 10 instruction Load Burst
!	%f12 = ff000000, %f24 = 03f20000, %f10 = d4414189
	fadds	%f12,%f24,%f10		! %f10 = ff000000

p0_label_119:
!	Mem[00000000201c0000] = ffff8ea0, %l6 = 00000000026c93b5
	ldub	[%o0+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030081400] = 7ccf00ff, %l0 = 000000000000fb7f
	lduwa	[%i2+%g0]0x89,%l0	! %l0 = 000000007ccf00ff
!	Mem[0000000030101400] = ffff0000, %l7 = 000000002ec7218b
	ldsba	[%i4+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000218001c0] = 890808e2, %l6 = 00000000000000ff
	lduh	[%o3+0x1c0],%l6		! %l6 = 0000000000008908
!	Mem[0000000010181400] = 03f20000, %l7 = ffffffffffffffff
	lduh	[%i6+%g0],%l7		! %l7 = 00000000000003f2
!	Mem[0000000020800000] = b25f4ebd, %l0 = 000000007ccf00ff
	lduba	[%o1+0x001]%asi,%l0	! %l0 = 000000000000005f
!	Mem[0000000010141410] = 894141d4, %l4 = 00000000000000ff
	ldswa	[%i5+%o5]0x88,%l4	! %l4 = ffffffff894141d4
!	Mem[0000000010001410] = ffc27c83, %l6 = 0000000000008908
	ldsha	[%i0+%o5]0x80,%l6	! %l6 = ffffffffffffffc2
!	Mem[00000000300c1400] = fc4379ff, %l1 = 0000000000000000
	ldsba	[%i3+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000003f2, Mem[00000000300c1410] = ffb2181f
	stba	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffb218f2

p0_label_120:
!	%l5 = 0000000000000000, Mem[0000000030041410] = 00005d04
	stwa	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	%l7 = 00000000000003f2, Mem[0000000010041408] = 00000000959a65ff
	stxa	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000000003f2
!	%f31 = 1f18accd, Mem[0000000010041410] = ffffffff
	sta	%f31,[%i1+0x010]%asi	! Mem[0000000010041410] = 1f18accd
!	%l0 = 000000000000005f, Mem[00000000100c1408] = 9d1f000000005d04
	stxa	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000000000005f
!	%f0  = dbb6cf7c 7ccfb6db 9d1f0000 00005d04
!	%f4  = ffc27c83 ff800000 5a7bb25f 2ec7218b
!	%f8  = 00001f9d 80000000 ff000000 618efb7f
!	%f12 = ff000000 00000021 000000ff 000080ff
	stda	%f0,[%i0]ASI_BLK_PL	! Block Store to 0000000010001400
!	%l4 = ffffffff894141d4, imm = fffffffffffff953, %l3 = 00000000000000ff
	add	%l4,-0x6ad,%l3		! %l3 = ffffffff89413b27
!	Mem[00000000201c0000] = ffff8ea0, %l2 = 00000000cdac181f
	ldstub	[%o0+%g0],%l2		! %l2 = 000000ff000000ff
!	Mem[0000000030141410] = 00000000, %l0 = 000000000000005f
	ldstuba	[%i5+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030181400] = ffffffff, %l7 = 00000000000003f2
	swapa	[%i6+%g0]0x81,%l7	! %l7 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00000000, %f26 = 7ffb8e61
	lda	[%i5+%o4]0x80,%f26	! %f26 = 00000000

p0_label_121:
!	Mem[0000000010141410] = d4414189, %l7 = 00000000ffffffff
	ldsha	[%i5+%o5]0x80,%l7	! %l7 = ffffffffffffd441
!	%l2 = 00000000000000ff, %l1 = ffffffffffffffff, %l6 = ffffffffffffffc2
	sub	%l2,%l1,%l6		! %l6 = 0000000000000100
!	Mem[00000000300c1408] = ffffffff, %f22 = ff000000
	lda	[%i3+%o4]0x89,%f22	! %f22 = ffffffff
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000010001400] = 7ccfb6db, %l2 = 00000000000000ff
	lduha	[%i0+%g0]0x88,%l2	! %l2 = 000000000000b6db
!	Mem[0000000010041418] = 0000ffff0000f1c8, %l4 = ffffffff894141d4
	ldxa	[%i1+0x018]%asi,%l4	! %l4 = 0000ffff0000f1c8
!	Mem[0000000030101410] = ff00ff00, %f2  = 9d1f0000
	lda	[%i4+%o5]0x81,%f2 	! %f2 = ff00ff00
!	Mem[0000000030081408] = 5fb27bff, %f22 = ffffffff
	lda	[%i2+%o4]0x89,%f22	! %f22 = 5fb27bff
!	Mem[0000000010101400] = 00001f9d, %l0 = 0000000000000000
	ldsba	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %f20 = d4414189
	lda	[%i5+%o4]0x88,%f20	! %f20 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141414] = 837cc2ee, %l2 = 0000b6db, %l2 = 0000b6db
	add	%i5,0x14,%g1
	casa	[%g1]0x80,%l2,%l2	! %l2 = 00000000837cc2ee

p0_label_122:
!	%l3 = ffffffff89413b27, Mem[0000000010101402] = 00001f9d
	stb	%l3,[%i4+0x002]		! Mem[0000000010101400] = 0000279d
!	Mem[00000000300c1410] = f218b2ff, %l1 = ffffffffffffffff
	ldstuba	[%i3+%o5]0x81,%l1	! %l1 = 000000f2000000ff
!	Mem[000000001004142a] = 00000000, %l3 = ffffffff89413b27
	ldstub	[%i1+0x02a],%l3		! %l3 = 00000000000000ff
!	Mem[0000000021800001] = 46b9133c, %l6 = 0000000000000100
	ldstuba	[%o3+0x001]%asi,%l6	! %l6 = 000000b9000000ff
!	%f4  = ffc27c83 ff800000, %l0 = 0000000000000000
!	Mem[0000000010101408] = 0000000000000000
	add	%i4,0x008,%g1
	stda	%f4,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010101408] = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010001408] = 00005d04
	stwa	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
!	%l4 = 0000ffff0000f1c8, Mem[0000000030081408] = 5fb27bff
	stba	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 5fb27bc8
!	Mem[0000000010101400] = 0000279d, %l5 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l5	! %l5 = 000000000000279d
!	Mem[00000000211c0001] = ffff3487, %l5 = 000000000000279d
	ldstub	[%o2+0x001],%l5		! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ff800000, %l4 = 0000ffff0000f1c8
	lduba	[%i0+%o5]0x88,%l4	! %l4 = 0000000000000000

p0_label_123:
!	Mem[00000000201c0000] = ffff8ea0, %l1 = 00000000000000f2
	ldsba	[%o0+0x001]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030101410] = 00ff00ff, %l1 = ffffffffffffffff
	lduwa	[%i4+%o5]0x89,%l1	! %l1 = 0000000000ff00ff
!	Mem[0000000010181408] = 8d03687b00000000, %l0 = 0000000000000000
	ldxa	[%i6+%o4]0x88,%l0	! %l0 = 8d03687b00000000
!	%l7 = ffffffffffffd441, Mem[00000000100c1408] = 00000000
	stha	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000d441
!	Mem[0000000030101408] = 4d0000ff, %l2 = 00000000837cc2ee
	lduha	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181400] = 000003f2, %l3 = 0000000000000000
	lduha	[%i6+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = 03f20000 ff000000 00000000 7b68038d
!	Mem[0000000010181410] = 00007400 46000000 8d039cf3 618efb7f
!	Mem[0000000010181420] = 00000000 000000f2 0000f1c8 8fb2181f
!	Mem[0000000010181430] = 10659a95 894141d4 f9137281 026c93b5
	ldda	[%i6]ASI_BLK_PL,%f0	! Block Load from 0000000010181400
!	Mem[0000000030141400] = 0000ffff00000000, %l4 = 0000000000000000
	ldxa	[%i5+%g0]0x81,%l4	! %l4 = 0000ffff00000000
!	Mem[0000000010041400] = 00000000, %l6 = 00000000000000b9
	ldswa	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000010101400] = 00000000
	stha	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000

p0_label_124:
!	Mem[0000000010041410] = 1f18accd, %l0 = 8d03687b00000000, %asi = 80
	swapa	[%i1+0x010]%asi,%l0	! %l0 = 000000001f18accd
!	%l6 = 00000000, %l7 = ffffd441, Mem[0000000030101400] = ffff0000 000080ff
	stda	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000 ffffd441
!	%l7 = ffffffffffffd441, Mem[00000000100c1400] = 7ccfb6db
	stwa	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffd441
!	Mem[0000000010001410] = ff800000, %l6 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l6	! %l6 = 00000000ff800000
!	Mem[0000000010041408] = f2030000, %l2 = 00000000000000ff, %asi = 80
	swapa	[%i1+0x008]%asi,%l2	! %l2 = 00000000f2030000
!	%l2 = 00000000f2030000, Mem[0000000010081410] = 00000000
	stwa	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = f2030000
!	%f30 = ff800000 1f18accd, %l4 = 0000ffff00000000
!	Mem[00000000300c1438] = 38763b020700da69
	add	%i3,0x038,%g1
	stda	%f30,[%g1+%l4]ASI_PST32_SL ! Mem[00000000300c1438] = 38763b020700da69
!	%f16 = ff000000 ff000000, Mem[0000000030181408] = 00000021 00000000
	stda	%f16,[%i6+%o4]0x89	! Mem[0000000030181408] = ff000000 ff000000
!	Mem[0000000030101408] = ff00004d, %l7 = ffffffffffffd441
	ldstuba	[%i4+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081420] = 6ddaff08, %f21 = 837cc2ee
	lda	[%i2+0x020]%asi,%f21	! %f21 = 6ddaff08

p0_label_125:
!	Mem[0000000030141410] = 8b21c72e 000000ff, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 00000000000000ff 000000008b21c72e
!	Mem[0000000030181400] = 000003f20000009d, %l5 = 000000008b21c72e
	ldxa	[%i6+%g0]0x81,%l5	! %l5 = 000003f20000009d
!	Mem[0000000010101408] = 00000000, %l0 = 000000001f18accd
	ldsba	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101408] = 4d0000ff, %l1 = 0000000000ff00ff
	ldsba	[%i4+%o4]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030001410] = 08000000, %l3 = 0000000000000000
	lduba	[%i0+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181408] = ff000000, %l4 = 00000000000000ff
	lduwa	[%i6+%o4]0x89,%l4	! %l4 = 00000000ff000000
!	Mem[0000000010101410] = ffffffff, %l0 = 0000000000000000
	ldsha	[%i4+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1400] = ffffd441, %l0 = ffffffffffffffff
	lduwa	[%i3+%g0]0x88,%l0	! %l0 = 00000000ffffd441
!	Mem[0000000010081408] = 00740000a7c69cf3, %f16 = ff000000 ff000000
	ldda	[%i2+%o4]0x80,%f16	! %f16 = 00740000 a7c69cf3
!	Starting 10 instruction Store Burst
!	Mem[0000000020800000] = b25f4ebd, %l1 = ffffffffffffffff
	ldstub	[%o1+%g0],%l1		! %l1 = 000000b2000000ff

p0_label_126:
!	%l0 = 00000000ffffd441, Mem[0000000030181410] = 000000ff000080ff
	stxa	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000ffffd441
!	%l3 = 0000000000000000, Mem[0000000010001400] = dbb6cf7c7ccfb6db
	stxa	%l3,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000000
!	%l4 = 00000000ff000000, Mem[0000000030141400] = 0000ffff
	stba	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000ffff
	membar	#Sync			! Added by membar checker (23)
!	%l1 = 00000000000000b2, Mem[0000000010181410] = 00007400
	sth	%l1,[%i6+%o5]		! Mem[0000000010181410] = 00b27400
!	Mem[00000000211c0000] = ffff3487, %l0 = 00000000ffffd441
	ldstub	[%o2+%g0],%l0		! %l0 = 000000ff000000ff
!	Mem[0000000030041400] = 183ad350, %l0 = 00000000000000ff
	ldstuba	[%i1+%g0]0x81,%l0	! %l0 = 00000018000000ff
!	%f8  = f2000000 00000000, %l7 = 00000000000000ff
!	Mem[00000000100c1420] = 00001f9dff000000
	add	%i3,0x020,%g1
	stda	%f8,[%g1+%l7]ASI_PST8_P ! Mem[00000000100c1420] = f200000000000000
!	%f0  = 000000ff 0000f203, Mem[0000000030041400] = ff3ad350 7ccfb6db
	stda	%f0 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff 0000f203
!	Mem[00000000100c140e] = 0000005f, %l6 = 00000000ff800000
	ldstub	[%i3+0x00e],%l6		! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1420] = f2000000 00000000, %l2 = f2030000, %l3 = 00000000
	ldd	[%i3+0x020],%l2		! %l2 = 00000000f2000000 0000000000000000

p0_label_127:
!	Mem[0000000010141418] = ff00000000000004, %f20 = 00000000 6ddaff08
	ldda	[%i5+0x018]%asi,%f20	! %f20 = ff000000 00000004
!	Mem[0000000010141400] = ff000000ff000000, %l0 = 0000000000000018
	ldxa	[%i5+%g0]0x80,%l0	! %l0 = ff000000ff000000
!	Mem[0000000010101410] = ffffffff, %l0 = ff000000ff000000
	ldswa	[%i4+%o5]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010081438] = 0097d890, %l1 = 00000000000000b2
	lduba	[%i2+0x03b]%asi,%l1	! %l1 = 0000000000000090
!	Mem[0000000010081408] = 00007400, %l0 = ffffffffffffffff
	lduwa	[%i2+%o4]0x88,%l0	! %l0 = 0000000000007400
!	Mem[0000000010001400] = 00000000 00000000, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i0+%g0]0x80,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010081410] = f2030000, %l4 = 00000000ff000000
	lduba	[%i2+%o5]0x80,%l4	! %l4 = 00000000000000f2
!	Mem[00000000100c1400] = 41d4ffff, %l3 = 0000000000000000
	ldswa	[%i3+%g0]0x80,%l3	! %l3 = 0000000041d4ffff
!	Mem[0000000010101410] = ffffffff, %l0 = 0000000000007400
	lduba	[%i4+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1438] = 000000ff000080ff, %l5 = 000003f20000009d, %l4 = 00000000000000f2
	add	%i3,0x38,%g1
	casxa	[%g1]0x80,%l5,%l4	! %l4 = 000000ff000080ff

p0_label_128:
!	%f0  = 000000ff 0000f203, %l1 = 0000000000000090
!	Mem[0000000030141410] = ff0000002ec7218b
	add	%i5,0x010,%g1
	stda	%f0,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030141410] = ff0000002ec7218b
!	%f12 = d4414189 959a6510, %l5 = 000003f20000009d
!	Mem[00000000100c1400] = 41d4ffffff000000
	stda	%f12,[%i3+%l5]ASI_PST32_P ! Mem[00000000100c1400] = 41d4ffff959a6510
!	%f2  = 8d03687b 00000000, %l0 = 00000000000000ff
!	Mem[0000000010101428] = 8d03687b618efb7f
	add	%i4,0x028,%g1
	stda	%f2,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010101428] = 000000007b68038d
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010081400] = 8b21c72e 5fb27b5a
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000 00000000
!	%f19 = 00001f9d, Mem[0000000010081400] = 00000000
	sta	%f19,[%i2+%g0]0x88	! Mem[0000000010081400] = 00001f9d
!	%l6 = 00000000, %l7 = 00000000, Mem[00000000100c1400] = ffffd441 10659a95
	stda	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 00000000
!	Mem[0000000030001410] = 00000008, %l1 = 0000000000000090
	swapa	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000008
!	%l2 = f2000000, %l3 = 41d4ffff, Mem[00000000100c1410] = 00000000 ff800000
	stda	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = f2000000 41d4ffff
!	%l0 = 00000000000000ff, Mem[0000000010101400] = 9c94080000000000
	stxa	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %l7 = 0000000000000000
	ldsba	[%i0+%o4]0x80,%l7	! %l7 = 0000000000000000

p0_label_129:
!	Mem[00000000100c1404] = 00000000, %l7 = 0000000000000000
	lduba	[%i3+0x005]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141400] = ffff0000, %l4 = 000000ff000080ff
	lduba	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141408] = 0000f203, %l7 = 0000000000000000
	lduba	[%i5+%o4]0x89,%l7	! %l7 = 0000000000000003
!	Mem[0000000010141420] = 03f2ff00, %l7 = 0000000000000003
	lduba	[%i5+0x020]%asi,%l7	! %l7 = 0000000000000003
!	Mem[0000000030081400] = 7ccf00ff, %l1 = 0000000000000008
	ldsha	[%i2+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181400] = 9d000000f2030000, %f4  = 00000046 00740000
	ldda	[%i6+%g0]0x89,%f4 	! %f4  = 9d000000 f2030000
!	Mem[0000000010041400] = 00000000, %l5 = 000003f20000009d
	lduwa	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c140c] = 0000ff5f, %l2 = 00000000f2000000
	lduwa	[%i3+0x00c]%asi,%l2	! %l2 = 000000000000ff5f
!	Mem[0000000030081410] = 0000f203, %l2 = 000000000000ff5f
	lduha	[%i2+%o5]0x89,%l2	! %l2 = 000000000000f203
!	Starting 10 instruction Store Burst
!	%f17 = a7c69cf3, Mem[0000000010001400] = 00000000
	sta	%f17,[%i0+%g0]0x80	! Mem[0000000010001400] = a7c69cf3

p0_label_130:
!	%f18 = 045d0000 00001f9d, %l5 = 0000000000000000
!	Mem[0000000010081420] = 6ddaff08c791c515
	add	%i2,0x020,%g1
	stda	%f18,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010081420] = 6ddaff08c791c515
!	%l2 = 000000000000f203, imm = fffffffffffff3ad, %l4 = 0000000000000000
	andn	%l2,-0xc53,%l4		! %l4 = 0000000000000002
!	%l1 = 00000000000000ff, Mem[00000000100c1408] = 0000d441
	stba	%l1,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000d4ff
!	%l0 = 00000000000000ff, Mem[0000000030001400] = 0000be48
	stha	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 00ffbe48
!	Mem[0000000020800000] = ff5f4ebd, %l7 = 0000000000000003
	ldstuba	[%o1+0x000]%asi,%l7	! %l7 = 000000ff000000ff
!	%l2 = 0000f203, %l3 = 41d4ffff, Mem[00000000300c1410] = ffb218ff 48be2cff
	stda	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000f203 41d4ffff
!	%f8  = f2000000 00000000, Mem[0000000010141410] = d4414189 837cc2ee
	stda	%f8 ,[%i5+%o5]0x80	! Mem[0000000010141410] = f2000000 00000000
!	%l2 = 000000000000f203, Mem[00000000211c0001] = ffff3487, %asi = 80
	stba	%l2,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff033487
!	%f29 = 5fb27b5a, %f2  = 8d03687b
	fcmps	%fcc0,%f29,%f2 		! %fcc0 = 2
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = accd0000, %l1 = 00000000000000ff
	lduha	[%i1+%o4]0x81,%l1	! %l1 = 000000000000accd

p0_label_131:
!	Mem[0000000030181408] = 000000ff, %l2 = 000000000000f203
	ldswa	[%i6+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041418] = 0000ffff, %l6 = 0000000000000000
	lduba	[%i1+0x01a]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041414] = 87630200, %l5 = 0000000000000000
	lduh	[%i1+0x016],%l5		! %l5 = 0000000000000200
!	Mem[0000000030001410] = 712e84e590000000, %f2  = 8d03687b 00000000
	ldda	[%i0+%o5]0x89,%f2 	! %f2  = 712e84e5 90000000
!	%l7 = 00000000000000ff, %l6 = 00000000000000ff, %l4 = 0000000000000002
	xnor	%l7,%l6,%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010141408] = 00000000, %l2 = 00000000000000ff
	lduba	[%i5+%o4]0x80,%l2	! %l2 = 0000000000000000
!	%f14 = b5936c02, %f16 = 00740000, %f15 = 817213f9
	fsubs	%f14,%f16,%f15		! %l0 = 0000000000000121, Unfinished, %fsr = 1300000800
!	Mem[0000000030101408] = c97943fc4d0000ff, %f28 = 21000000 5fb27b5a
	ldda	[%i4+%o4]0x89,%f28	! %f28 = c97943fc 4d0000ff
!	Mem[00000000218000c0] = ff005cf4, %l3 = 0000000041d4ffff
	ldsba	[%o3+0x0c1]%asi,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i0+%o4]0x80,%l2	! %l2 = 00000000000000ff

p0_label_132:
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030001408] = ff00cf7c 7ffb8e61
	stda	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000 00000000
!	Mem[00000000100c140c] = 0000ff5f, %l4 = ffffffff, %l7 = 000000ff
	add	%i3,0x0c,%g1
	casa	[%g1]0x80,%l4,%l7	! %l7 = 000000000000ff5f
!	%l3 = 0000000000000000, Mem[00000000100c1400] = 00000000
	stwa	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	%l3 = 0000000000000000, Mem[00000000211c0000] = ff033487
	stb	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 00033487
!	%l4 = ffffffffffffffff, Mem[00000000100c141c] = 2ec7218b
	stb	%l4,[%i3+0x01c]		! Mem[00000000100c141c] = ffc7218b
!	%l5 = 0000000000000200, Mem[0000000030141400] = 0000ffff
	stba	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000ffff
!	%l1 = 000000000000accd, Mem[0000000010141424] = 10659a95, %asi = 80
	stba	%l1,[%i5+0x024]%asi	! Mem[0000000010141424] = cd659a95
!	Mem[0000000010001410] = 00000000, %l3 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000030041408] = accd0000
	stba	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 00cd0000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff7943fc4d0000ff, %l7 = 000000000000ff5f
	ldxa	[%i3+%g0]0x81,%l7	! %l7 = ff7943fc4d0000ff

p0_label_133:
!	Mem[0000000030181400] = 000003f20000009d, %l0 = 0000000000000121
	ldxa	[%i6+%g0]0x81,%l0	! %l0 = 000003f20000009d
!	Mem[0000000010001438] = ff800000, %l5 = 0000000000000200
	ldsb	[%i0+0x038],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000030081410] = 03f20000, %l6 = 00000000000000ff
	ldsha	[%i2+%o5]0x81,%l6	! %l6 = 00000000000003f2
!	Mem[0000000010101410] = ffffffff, %l4 = ffffffffffffffff
	ldswa	[%i4+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010181400] = 0000f203, %l7 = ff7943fc4d0000ff
	lduwa	[%i6+%g0]0x88,%l7	! %l7 = 000000000000f203
!	Mem[0000000030181408] = ff000000, %l1 = 000000000000accd
	ldsba	[%i6+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l2 = 0000000000000000
	ldsb	[%i0+0x012],%l2		! %l2 = 0000000000000000
!	Mem[0000000030181400] = 000003f2, %l0 = 000003f20000009d
	lduwa	[%i6+%g0]0x81,%l0	! %l0 = 00000000000003f2
!	Mem[0000000010101400] = 000000ff, %l3 = 0000000000000000
	ldsba	[%i4+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f4  = 9d000000 f2030000, Mem[0000000030101410] = ff00ff00 045d0000
	stda	%f4 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 9d000000 f2030000

p0_label_134:
!	%l3 = ffffffffffffffff, Mem[0000000010001410] = 00000000
	stba	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000ff
!	Mem[0000000010101410] = ffffffff, %l5 = ffffffffffffffff
	swapa	[%i4+%o5]0x88,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010081410] = 000003f2, %l5 = 00000000ffffffff
	ldstuba	[%i2+%o5]0x88,%l5	! %l5 = 000000f2000000ff
!	Mem[00000000100c1410] = 000000f2, %l7 = 000000000000f203
	ldstuba	[%i3+%o5]0x88,%l7	! %l7 = 000000f2000000ff
!	Mem[0000000020800040] = ff00c0bd, %l2 = 0000000000000000
	ldub	[%o1+0x041],%l2		! %l2 = 0000000000000000
!	%l7 = 00000000000000f2, Mem[0000000030041400] = 000000ff0000f203
	stxa	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000000000f2
!	%l6 = 00000000000003f2, Mem[00000000211c0000] = 00033487, %asi = 80
	stba	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = f2033487
!	Mem[0000000030181410] = 00000000, %l5 = 00000000000000f2
	swapa	[%i6+%o5]0x81,%l5	! %l5 = 0000000000000000
!	%f1  = 0000f203, %f26 = 00000000, %f15 = 817213f9
	fdivs	%f1 ,%f26,%f15		! %f15 = 7f800000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000030181400] = 000003f2 0000009d 000000ff 000000ff
!	Mem[0000000030181410] = 000000f2 ffffd441 83cf7f40 ff18b28f
!	Mem[0000000030181420] = 2a763b21 07001d69 2e824d80 0000ffff
!	Mem[0000000030181430] = 03f20000 21000000 000000c8 edbe00c3
	ldda	[%i6]ASI_BLK_S,%f0	! Block Load from 0000000030181400

p0_label_135:
!	Mem[00000000100c1400] = 00000000 00000000, %l0 = 000003f2, %l1 = 00000000
	ldda	[%i3+0x000]%asi,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010041408] = 00000000 ff000000, %l6 = 000003f2, %l7 = 000000f2
	ldda	[%i1+%o4]0x88,%l6	! %l6 = 00000000ff000000 0000000000000000
!	%l5 = 0000000000000000, immed = 00000434, %y  = ff7bb25f
	smul	%l5,0x434,%l3		! %l3 = 0000000000000000, %y = 00000000
!	Mem[0000000020800040] = ff00c0bd, %l5 = 0000000000000000
	ldsba	[%o1+0x041]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141400] = ff000000 ff000000, %l4 = ffffffff, %l5 = 00000000
	ldda	[%i5+%g0]0x80,%l4	! %l4 = 00000000ff000000 00000000ff000000
!	Mem[0000000030001410] = 90000000, %l7 = 0000000000000000
	lduwa	[%i0+%o5]0x89,%l7	! %l7 = 0000000090000000
!	Mem[0000000030141408] = 0000f203, %f24 = 03f20000
	lda	[%i5+%o4]0x89,%f24	! %f24 = 0000f203
!	Mem[0000000010041408] = 000000ff, %l7 = 0000000090000000
	ldub	[%i1+0x009],%l7		! %l7 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %l0 = 0000000000000000
	ldsba	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030041400] = 00000000 f2000000
	stda	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000 00000000

p0_label_136:
!	%f20 = ff000000 00000004, Mem[0000000010181400] = 0000f203 000000ff
	stda	%f20,[%i6+%g0]0x88	! Mem[0000000010181400] = ff000000 00000004
!	%f16 = 00740000 a7c69cf3, Mem[00000000100c1408] = 0000d4ff 5fff0000
	stda	%f16,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00740000 a7c69cf3
!	%f16 = 00740000 a7c69cf3, Mem[0000000030041400] = 00000000 00000000
	stda	%f16,[%i1+%g0]0x81	! Mem[0000000030041400] = 00740000 a7c69cf3
!	Mem[0000000030181400] = 000003f2, %l2 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000020800040] = ff00c0bd, %asi = 80
	stba	%l2,[%o1+0x040]%asi	! Mem[0000000020800040] = 0000c0bd
!	%l1 = 0000000000000000, Mem[0000000010001415] = 837cc2ff, %asi = 80
	stba	%l1,[%i0+0x015]%asi	! Mem[0000000010001414] = 8300c2ff
!	Mem[0000000030181408] = 000000ff, %l6 = 00000000ff000000
	swapa	[%i6+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000010141408] = 00000000
	stba	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%l2 = 0000000000000000, Mem[00000000201c0001] = ffff8ea0, %asi = 80
	stba	%l2,[%o0+0x001]%asi	! Mem[00000000201c0000] = ff008ea0
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000ff000000, %f22 = 5fb27bff 00000004
	ldda	[%i1+%o5]0x81,%f22	! %f22 = 00000000 ff000000

p0_label_137:
!	Mem[0000000010181410] = 00b27400, %l0 = 0000000000000000
	ldsba	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = ff000000, %l5 = 00000000ff000000
	ldsha	[%i4+0x002]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041400] = f39cc6a7 00007400, %l4 = ff000000, %l5 = 00000000
	ldda	[%i1+%g0]0x89,%l4	! %l4 = 0000000000007400 00000000f39cc6a7
!	Mem[0000000010081408] = 00007400, %l7 = 0000000000000000
	lduwa	[%i2+%o4]0x88,%l7	! %l7 = 0000000000007400
!	Mem[000000001018143c] = 026c93b5, %l7 = 0000000000007400
	ldsw	[%i6+0x03c],%l7		! %l7 = 00000000026c93b5
!	Mem[0000000010101408] = 00000000, %l4 = 0000000000007400
	lduha	[%i4+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181410] = 41d4fffff2000000, %f18 = 045d0000 00001f9d
	ldda	[%i6+%o5]0x89,%f18	! %f18 = 41d4ffff f2000000
!	Mem[0000000030141410] = 000000ff, %l6 = 00000000000000ff
	ldsba	[%i5+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081400] = 00001f9d, %l0 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l0	! %l0 = 000000000000009d
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = ff030000, %l4 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l4	! %l4 = 000000ff000000ff

p0_label_138:
!	%l4 = 00000000000000ff, Mem[0000000010041418] = 0000ffff, %asi = 80
	stwa	%l4,[%i1+0x018]%asi	! Mem[0000000010041418] = 000000ff
!	Mem[0000000010101420] = ff5db2247f000000, %l3 = 0000000000000000, %l2 = 0000000000000000
	add	%i4,0x20,%g1
	casxa	[%g1]0x80,%l3,%l2	! %l2 = ff5db2247f000000
!	Mem[000000001000140b] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i0+0x00b]%asi,%l3	! %l3 = 00000000000000ff
!	%l2 = ff5db2247f000000, Mem[0000000030081410] = 03f20000
	stba	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 00f20000
!	%l0 = 000000000000009d, Mem[00000000100c1400] = 00000000
	stwa	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000009d
!	%f4  = 000000f2, Mem[0000000010041400] = 00000000
	sta	%f4 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000f2
!	%l1 = 0000000000000000, Mem[0000000010001428] = 7ffb8e61
	sth	%l1,[%i0+0x028]		! Mem[0000000010001428] = 00008e61
!	%f2  = 000000ff 000000ff, Mem[0000000030101408] = ff00004d fc4379c9
	stda	%f2 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ff 000000ff
!	Mem[0000000010181438] = f9137281, %l6 = ffffffffffffffff, %asi = 80
	swapa	[%i6+0x038]%asi,%l6	! %l6 = 00000000f9137281
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_16:
!	%l0 = 000000000000009d
	setx	0x1c6d23af97fd9efe,%g7,%l0 ! %l0 = 1c6d23af97fd9efe
!	%l1 = 0000000000000000
	setx	0xcfa5468816b3f61e,%g7,%l1 ! %l1 = cfa5468816b3f61e
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1c6d23af97fd9efe
	setx	0x1273a60032e7811c,%g7,%l0 ! %l0 = 1273a60032e7811c
!	%l1 = cfa5468816b3f61e
	setx	0x141dda2fd4844b0b,%g7,%l1 ! %l1 = 141dda2fd4844b0b

p0_label_139:
!	Mem[0000000010001400] = 00000000 f39cc6a7, %l0 = 32e7811c, %l1 = d4844b0b
	ldda	[%i0+%g0]0x88,%l0	! %l0 = 00000000f39cc6a7 0000000000000000
!	%l0 = 00000000f39cc6a7, imm = 0000000000000e1e, %l1 = 0000000000000000
	subc	%l0,0xe1e,%l1		! %l1 = 00000000f39cb889
!	Mem[0000000030101408] = ff000000ff000000, %f28 = c97943fc 4d0000ff
	ldda	[%i4+%o4]0x89,%f28	! %f28 = ff000000 ff000000
!	Mem[0000000010001408] = 9d1f0000 ff0000ff, %l6 = f9137281, %l7 = 026c93b5
	ldda	[%i0+%o4]0x88,%l6	! %l6 = 00000000ff0000ff 000000009d1f0000
!	Mem[0000000010141428] = 7ffb8e61, %l2 = ff5db2247f000000
	ldswa	[%i5+0x028]%asi,%l2	! %l2 = 000000007ffb8e61
!	Mem[0000000010181410] = 00b2740046000000, %f26 = 00000000 ffffffff
	ldd	[%i6+%o5],%f26		! %f26 = 00b27400 46000000
!	Mem[0000000030081410] = 0000f200, %l1 = 00000000f39cb889
	ldsba	[%i2+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041438] = dd54aa25, %l6 = 00000000ff0000ff
	lduba	[%i1+0x038]%asi,%l6	! %l6 = 00000000000000dd
!	Mem[0000000010181408] = 00000000, %l0 = 00000000f39cc6a7
	lduha	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f28 = ff000000 ff000000, Mem[0000000010001410] = 000000ff ffc20083
	stda	%f28,[%i0+%o5]0x88	! Mem[0000000010001410] = ff000000 ff000000

p0_label_140:
!	Mem[0000000010101438] = 000000ff, %l6 = 000000dd, %l1 = 00000000
	add	%i4,0x38,%g1
	casa	[%g1]0x80,%l6,%l1	! %l1 = 00000000000000ff
!	%f16 = 00740000 a7c69cf3, %l4 = 00000000000000ff
!	Mem[0000000030101438] = fc3f840f990336e2
	add	%i4,0x038,%g1
	stda	%f16,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030101438] = f39cc6a700007400
!	%f20 = ff000000 00000004, Mem[0000000030001400] = 48beff00 f39cc6a7
	stda	%f20,[%i0+%g0]0x89	! Mem[0000000030001400] = ff000000 00000004
!	%l6 = 00000000000000dd, Mem[00000000201c0000] = ff008ea0
	stb	%l6,[%o0+%g0]		! Mem[00000000201c0000] = dd008ea0
!	%l7 = 000000009d1f0000, Mem[0000000010041408] = 000000ff00000000, %asi = 80
	stxa	%l7,[%i1+0x008]%asi	! Mem[0000000010041408] = 000000009d1f0000
!	Mem[0000000020800000] = ff5f4ebd, %l2 = 000000007ffb8e61
	ldstub	[%o1+%g0],%l2		! %l2 = 000000ff000000ff
!	Mem[0000000010001408] = ff0000ff00001f9d, %l6 = 00000000000000dd, %l5 = 00000000f39cc6a7
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l6,%l5	! %l5 = ff0000ff00001f9d
!	%l5 = ff0000ff00001f9d, Mem[0000000010101410] = 5a7bb2ffffffffff
	stxa	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = ff0000ff00001f9d
!	%f20 = ff000000, Mem[0000000010081410] = 000003ff
	sta	%f20,[%i2+%o5]0x88	! Mem[0000000010081410] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00000000, %l0 = 0000000000000000
	lduba	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000000

p0_label_141:
!	Mem[0000000010041408] = 000000009d1f0000, %f6  = 83cf7f40 ff18b28f
	ldda	[%i1+%o4]0x80,%f6 	! %f6  = 00000000 9d1f0000
!	Mem[0000000010041428] = 0000ff00, %f23 = ff000000
	lda	[%i1+0x028]%asi,%f23	! %f23 = 0000ff00
!	Mem[0000000030141400] = 0000ffff, %l6 = 00000000000000dd
	ldsba	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l4 = 00000000000000ff
	lduba	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = ff000000, %f8  = 2a763b21
	lda	[%i5+%g0]0x80,%f8 	! %f8 = ff000000
!	Mem[0000000010041418] = 000000ff, %f11 = 0000ffff
	ld	[%i1+0x018],%f11	! %f11 = 000000ff
!	Mem[0000000010101400] = 000000ff, %f8  = ff000000
	lda	[%i4+%g0]0x88,%f8 	! %f8 = 000000ff
!	Mem[0000000010041400] = 000000f2 00000000, %l6 = 00000000, %l7 = 9d1f0000
	ldd	[%i1+%g0],%l6		! %l6 = 00000000000000f2 0000000000000000
!	Mem[0000000010041410] = 0002638700000000, %f0  = 000003f2 0000009d
	ldda	[%i1+%o5]0x88,%f0 	! %f0  = 00026387 00000000
!	Starting 10 instruction Store Burst
!	Mem[000000001018141d] = 618efb7f, %l6 = 00000000000000f2
	ldstub	[%i6+0x01d],%l6		! %l6 = 0000008e000000ff

p0_label_142:
!	%f30 = ff800000 1f18accd, Mem[0000000010081400] = 9d1f0000 00000000
	stda	%f30,[%i2+%g0]0x80	! Mem[0000000010081400] = ff800000 1f18accd
!	%l6 = 0000008e, %l7 = 00000000, Mem[0000000010181408] = 00000000 7b68038d
	stda	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000008e 00000000
!	%l2 = 00000000000000ff, Mem[00000000300c1400] = ff7943fc
	stha	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00ff43fc
!	Mem[00000000300c1410] = 0000f203, %l4 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l4	! %l4 = 00000003000000ff
!	%l7 = 0000000000000000, Mem[0000000010041428] = 0000ff0000000000
	stx	%l7,[%i1+0x028]		! Mem[0000000010041428] = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010141410] = f2000000
	stha	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	%l4 = 00000003, %l5 = 00001f9d, Mem[0000000010141410] = 00000000 00000000
	stda	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000003 00001f9d
!	Mem[000000001008141c] = 143c9bf7, %l3 = 0000000000000000
	swap	[%i2+0x01c],%l3		! %l3 = 00000000143c9bf7
!	%l3 = 00000000143c9bf7, Mem[0000000030081410] = 00f20000
	stha	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 9bf70000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 00000000ffff0000, %l6 = 000000000000008e
	ldxa	[%i5+%g0]0x89,%l6	! %l6 = 00000000ffff0000

p0_label_143:
!	Mem[0000000030081408] = 5fb27bc8, %l1 = 00000000000000ff
	lduha	[%i2+%o4]0x89,%l1	! %l1 = 0000000000007bc8
!	Mem[0000000010181438] = ffffffff, %l5 = ff0000ff00001f9d
	ldsh	[%i6+0x038],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000030101408] = ff000000, %f4  = 000000f2
	lda	[%i4+%o4]0x89,%f4 	! %f4 = ff000000
!	Mem[0000000010081408] = 00007400, %l5 = ffffffffffffffff
	lduba	[%i2+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081400] = 7ccf00ff, %l0 = 0000000000000000
	ldsba	[%i2+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010081408] = 00740000a7c69cf3, %l7 = 0000000000000000
	ldxa	[%i2+%o4]0x80,%l7	! %l7 = 00740000a7c69cf3
!	Mem[0000000010041400] = 000000f2 00000000, %l2 = 000000ff, %l3 = 143c9bf7
	ldda	[%i1+%g0]0x80,%l2	! %l2 = 00000000000000f2 0000000000000000
!	Mem[0000000010041418] = 000000ff, %l7 = 00740000a7c69cf3
	lduha	[%i1+0x018]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101410] = 9d1f0000, %l4 = 0000000000000003
	lduba	[%i4+%o5]0x80,%l4	! %l4 = 000000000000009d
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000009d, Mem[0000000021800040] = 21d9d078, %asi = 80
	stha	%l4,[%o3+0x040]%asi	! Mem[0000000021800040] = 009dd078

p0_label_144:
!	Mem[000000001014141c] = 00000004, %l5 = 0000000000000000
	ldstub	[%i5+0x01c],%l5		! %l5 = 00000000000000ff
!	%f0  = 00026387 00000000, %l4 = 000000000000009d
!	Mem[0000000030081430] = 210000005fb27b5a
	add	%i2,0x030,%g1
	stda	%f0,[%g1+%l4]ASI_PST32_S ! Mem[0000000030081430] = 2100000000000000
!	Mem[0000000030041410] = 00000000, %l1 = 0000000000007bc8
	ldstuba	[%i1+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000010101408] = 00000000
	stba	%l1,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	Mem[0000000010181408] = 8e000000, %l5 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001400] = f39cc6a7, %l0 = ffffffffffffffff
	ldstuba	[%i0+%g0]0x88,%l0	! %l0 = 000000a7000000ff
!	%l7 = 0000000000000000, Mem[0000000010181410] = 00b27400
	stwa	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	%l6 = 00000000ffff0000, Mem[0000000030081410] = 9bf70000
	stwa	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = ffff0000
!	%f7  = 9d1f0000, Mem[0000000030001410] = 00000090
	sta	%f7 ,[%i0+%o5]0x81	! Mem[0000000030001410] = 9d1f0000
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = dd008ea0, %l5 = 0000000000000000
	ldsb	[%o0+%g0],%l5		! %l5 = ffffffffffffffdd

p0_label_145:
!	Mem[0000000010181410] = 00000000, %l7 = 0000000000000000
	ldsha	[%i6+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l5 = ffffffffffffffdd
	ldswa	[%i4+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081408] = c87bb25f 00001f9d, %l6 = ffff0000, %l7 = 00000000
	ldda	[%i2+%o4]0x81,%l6	! %l6 = 00000000c87bb25f 0000000000001f9d
!	Mem[0000000030181400] = f20300ff, %l1 = 0000000000000000
	ldsba	[%i6+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030081410] = ffff00009d1f0000, %f18 = 41d4ffff f2000000
	ldda	[%i2+%o5]0x81,%f18	! %f18 = ffff0000 9d1f0000
!	Mem[0000000010181410] = 00000000, %l0 = 00000000000000a7
	ldswa	[%i6+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[000000001000143c] = ff000000, %l5 = 0000000000000000
	ldsb	[%i0+0x03e],%l5		! %l5 = 0000000000000000
!	Mem[0000000030181400] = f20300ff, %l0 = 0000000000000000
	ldsha	[%i6+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1400] = 9d000000, %l7 = 0000000000001f9d
	ldsha	[%i3+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = ffffffff, %l7 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l7	! %l7 = 000000ff000000ff

p0_label_146:
!	Mem[00000000100c1400] = 0000009d, %l0 = 00000000000000ff
	swapa	[%i3+%g0]0x80,%l0	! %l0 = 000000000000009d
!	Mem[0000000030181410] = f2000000, %l2 = 00000000000000f2
	swapa	[%i6+%o5]0x89,%l2	! %l2 = 00000000f2000000
!	%l4 = 000000000000009d, Mem[0000000030041400] = 00740000
	stwa	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000009d
!	%f2  = 000000ff 000000ff, %l4 = 000000000000009d
!	Mem[00000000300c1408] = ffffffff00000021
	add	%i3,0x008,%g1
	stda	%f2,[%g1+%l4]ASI_PST8_S ! Mem[00000000300c1408] = 00ffffff000000ff
!	%l3 = 0000000000000000, Mem[0000000010181400] = 04000000
	stba	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	%l4 = 000000000000009d, %l2 = 00000000f2000000, %l5 = 0000000000000000
	xor	%l4,%l2,%l5		! %l5 = 00000000f200009d
!	%l2 = 00000000f2000000, Mem[0000000030101400] = 00000000
	stba	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	%l0 = 000000000000009d, %l7 = 00000000000000ff, %l3 = 0000000000000000
	xor	%l0,%l7,%l3		! %l3 = 0000000000000062
!	Mem[00000000100c1438] = 000000ff, %l7 = 00000000000000ff
	swap	[%i3+0x038],%l7		! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00000000, %l4 = 000000000000009d
	lduwa	[%i4+%o4]0x80,%l4	! %l4 = 0000000000000000

p0_label_147:
!	Mem[0000000010141400] = 000000ff, %l5 = 00000000f200009d
	lduba	[%i5+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081408] = 00740000, %l2 = 00000000f2000000
	lduba	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = 9d000000, %l5 = 00000000000000ff
	lduha	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141410] = 00000003, %l7 = 00000000000000ff
	lduha	[%i5+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l2 = 0000000000000000
	ldsba	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000211c0000] = f2033487, %l0 = 000000000000009d
	ldub	[%o2+%g0],%l0		! %l0 = 00000000000000f2
!	Mem[0000000010041400] = 000000f200000000, %l1 = ffffffffffffffff
	ldxa	[%i1+%g0]0x80,%l1	! %l1 = 000000f200000000
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000010181400] = 00000000 000000ff ff00008e 00000000
!	Mem[0000000010181410] = 00000000 46000000 8d039cf3 61fffb7f
!	Mem[0000000010181420] = 00000000 000000f2 0000f1c8 8fb2181f
!	Mem[0000000010181430] = 10659a95 894141d4 ffffffff 026c93b5
	ldda	[%i6]ASI_BLK_AIUP,%f0	! Block Load from 0000000010181400
!	Mem[0000000010041410] = 00026387 00000000, %l6 = c87bb25f, %l7 = 00000000
	ldda	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000000 0000000000026387
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000062, Mem[0000000030081400] = ff00cf7c
	stwa	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000062

p0_label_148:
!	%f29 = ff000000, Mem[0000000010081410] = 000000ff
	sta	%f29,[%i2+%o5]0x80	! Mem[0000000010081410] = ff000000
!	%l4 = 0000000000000000, Mem[0000000021800180] = 28ff6a7f
	stb	%l4,[%o3+0x180]		! Mem[0000000021800180] = 00ff6a7f
!	Mem[0000000030101400] = 00000000, %l3 = 0000000000000062
	ldstuba	[%i4+%g0]0x81,%l3	! %l3 = 00000000000000ff
	membar	#Sync			! Added by membar checker (26)
!	%f22 = 00000000, Mem[000000001018141c] = 61fffb7f
	sta	%f22,[%i6+0x01c]%asi	! Mem[000000001018141c] = 00000000
!	%l3 = 0000000000000000, Mem[00000000201c0000] = dd008ea0
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 00008ea0
!	Mem[0000000010041410] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i1+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%l7 = 0000000000026387, Mem[0000000010181400] = ff00000000000000
	stxa	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000000000026387
!	Mem[0000000010001408] = ff0000ff, %l2 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l2	! %l2 = 00000000ff0000ff
!	Mem[0000000010101408] = 00000000, %l2 = 00000000ff0000ff, %asi = 80
	swapa	[%i4+0x008]%asi,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 8e0000ff, %f1  = 000000ff
	lda	[%i6+%o4]0x88,%f1 	! %f1 = 8e0000ff

p0_label_149:
!	Mem[000000001018141c] = 00000000, %l0 = 00000000000000f2
	lduba	[%i6+0x01e]%asi,%l0	! %l0 = 0000000000000000
!	Mem[000000001008142c] = ab88edb9, %f23 = 0000ff00
	lda	[%i2+0x02c]%asi,%f23	! %f23 = ab88edb9
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000010101400] = ff000000 00000000 ff0000ff 00000000
!	Mem[0000000010101410] = 9d1f0000 ff0000ff 9d1f0000 00005d04
!	Mem[0000000010101420] = ff5db224 7f000000 00000000 7b68038d
!	Mem[0000000010101430] = ffffffff 00000021 000000ff ff0080ff
	ldda	[%i4]ASI_BLK_AIUP,%f0	! Block Load from 0000000010101400
!	Mem[0000000010101410] = 9d1f0000, %l0 = 0000000000000000
	ldub	[%i4+0x011],%l0		! %l0 = 000000000000001f
!	Mem[0000000010181400] = 8763020000000000, %l5 = 0000000000000000
	ldxa	[%i6+%g0]0x80,%l5	! %l5 = 8763020000000000
!	%l5 = 8763020000000000, %l3 = 0000000000000000, %l1 = 000000f200000000
	addc	%l5,%l3,%l1		! %l1 = 8763020000000000
!	Mem[0000000010081400] = 000080ff, %l5 = 8763020000000000
	lduba	[%i2+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141400] = ff000000 ff000000 00000000 000000ff
!	Mem[0000000010141410] = 00000003 00001f9d ff000000 ff000004
!	Mem[0000000010141420] = 03f2ff00 cd659a95 7ffb8e61 7b68038d
!	Mem[0000000010141430] = 21000000 5fb27b5a ffffffff ffb27b5a
	ldda	[%i5]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010141400
!	Mem[00000000100c1408] = a7c69cf3, %l7 = 0000000000026387
	ldsha	[%i3+%o4]0x88,%l7	! %l7 = ffffffffffff9cf3
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = f2000000, %l1 = 8763020000000000
	ldstuba	[%i6+%o5]0x81,%l1	! %l1 = 000000f2000000ff

p0_label_150:
!	%f0  = ff000000 00000000, %l5 = 00000000000000ff
!	Mem[0000000030181430] = 03f2000021000000
	add	%i6,0x030,%g1
	stda	%f0,[%g1+%l5]ASI_PST16_SL ! Mem[0000000030181430] = 00000000000000ff
!	Mem[00000000100c140d] = 00007400, %l5 = 00000000000000ff
	ldstuba	[%i3+0x00d]%asi,%l5	! %l5 = 00000000000000ff
!	%f0  = ff000000, Mem[0000000010041404] = 00000000
	sta	%f0 ,[%i1+0x004]%asi	! Mem[0000000010041404] = ff000000
!	%f16 = 000000ff 000000ff ff000000 00000000
!	%f20 = 9d1f0000 03000000 040000ff 000000ff
!	%f24 = 959a65cd 00fff203 8d03687b 618efb7f
!	%f28 = 5a7bb25f 00000021 5a7bb2ff ffffffff
	stda	%f16,[%i5]ASI_BLK_AIUSL	! Block Store to 0000000030141400
	membar	#Sync			! Added by membar checker (28)
!	%l1 = 00000000000000f2, Mem[0000000010141408] = 00000000
	stba	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000f2
!	%l5 = 0000000000000000, Mem[0000000010141424] = cd659a95, %asi = 80
	stwa	%l5,[%i5+0x024]%asi	! Mem[0000000010141424] = 00000000
!	Mem[00000000300c1410] = fff20000, %l2 = 0000000000000000
	ldstuba	[%i3+%o5]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000100c1410] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l4	! %l4 = 000000ff000000ff
!	%f9  = 7f000000, Mem[0000000030041400] = 9d000000
	sta	%f9 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 7f000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041438] = dd54aa2510ff9a95, %f30 = 5a7bb2ff ffffffff
	ldd	[%i1+0x038],%f30	! %f30 = dd54aa25 10ff9a95

p0_label_151:
!	Mem[0000000030081408] = 5fb27bc8, %l5 = 0000000000000000
	lduba	[%i2+%o4]0x89,%l5	! %l5 = 00000000000000c8
!	Mem[0000000010141400] = ff000000, %l3 = 0000000000000000
	lduba	[%i5+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041408] = 9d1f0000 0000cd00, %l0 = 0000001f, %l1 = 000000f2
	ldda	[%i1+%o4]0x89,%l0	! %l0 = 000000000000cd00 000000009d1f0000
!	Mem[000000001000140c] = 00001f9d, %l6 = 0000000000000000
	ldsb	[%i0+0x00d],%l6		! %l6 = 0000000000000000
!	Mem[0000000010141418] = ff000000 ff000004, %l0 = 0000cd00, %l1 = 9d1f0000
	ldd	[%i5+0x018],%l0		! %l0 = 00000000ff000000 00000000ff000004
!	Mem[0000000010081408] = 00740000, %l2 = 00000000000000ff
	lduba	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181408] = 000000008e0000ff, %f26 = 8d03687b 618efb7f
	ldda	[%i6+%o4]0x88,%f26	! %f26 = 00000000 8e0000ff
!	Mem[0000000010001400] = ffc69cf3, %l6 = 0000000000000000
	ldsha	[%i0+%g0]0x80,%l6	! %l6 = ffffffffffffffc6
!	Mem[0000000030181400] = f20300ff, %l7 = ffffffffffff9cf3
	lduwa	[%i6+%g0]0x89,%l7	! %l7 = 00000000f20300ff
!	Starting 10 instruction Store Burst
!	%f0  = ff000000 00000000 ff0000ff 00000000
!	%f4  = 9d1f0000 ff0000ff 9d1f0000 00005d04
!	%f8  = ff5db224 7f000000 00000000 7b68038d
!	%f12 = ffffffff 00000021 000000ff ff0080ff
	stda	%f0,[%i2]ASI_BLK_AIUSL	! Block Store to 0000000030081400

p0_label_152:
!	%l6 = ffffffffffffffc6, Mem[00000000300c1408] = 00ffffff
	stwa	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffffffc6
!	%l5 = 00000000000000c8, Mem[0000000010141410] = 00000003
	stha	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = 00c80003
!	%l7 = 00000000f20300ff, Mem[00000000300c1400] = fc43ff00
	stwa	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = f20300ff
!	Mem[0000000030181400] = ff0003f2, %l4 = 00000000000000ff
	ldstuba	[%i6+%g0]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030101408] = ff000000, %l0 = 00000000ff000000
	ldstuba	[%i4+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000010001400] = ffc69cf3
	stwa	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000ff
!	%l7 = 00000000f20300ff, Mem[0000000010101400] = 00000000000000ff
	stxa	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000f20300ff
!	Mem[0000000010101410] = 9d1f0000, %l3 = 00000000000000ff
	ldstuba	[%i4+%o5]0x80,%l3	! %l3 = 0000009d000000ff
!	%f22 = 040000ff 000000ff, %l4 = 00000000000000ff
!	Mem[00000000100c1428] = 8d039cf3618efb7f
	add	%i3,0x028,%g1
	stda	%f22,[%g1+%l4]ASI_PST8_PL ! Mem[00000000100c1428] = ff000000ff000004
!	Starting 10 instruction Load Burst
!	%l0 = 0000000000000000, %l5 = 00000000000000c8, %y  = 00000000
	umul	%l0,%l5,%l5		! %l5 = 0000000000000000, %y = 00000000

p0_label_153:
!	Mem[0000000030101410] = 0000009d, %l2 = 0000000000000000
	ldsba	[%i4+%o5]0x89,%l2	! %l2 = ffffffffffffff9d
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000030101400] = ff000000 ffffd441 ff0000ff 000000ff
!	Mem[0000000030101410] = 9d000000 f2030000 04ab8e31 1d4201a7
!	Mem[0000000030101420] = afe103e1 2bb9970c b02b9bb0 2edfd309
!	Mem[0000000030101430] = 3b22a1a6 a6f921ef f39cc6a7 00007400
	ldda	[%i4]ASI_BLK_AIUS,%f0	! Block Load from 0000000030101400
!	Mem[00000000100c1408] = f39cc6a7, %l3 = 000000000000009d
	ldsba	[%i3+%o4]0x80,%l3	! %l3 = fffffffffffffff3
!	Mem[0000000030001410] = 9d1f0000, %l6 = ffffffffffffffc6
	lduha	[%i0+%o5]0x81,%l6	! %l6 = 0000000000009d1f
!	Mem[0000000021800040] = 009dd078, %l2 = ffffffffffffff9d
	ldsh	[%o3+0x040],%l2		! %l2 = 000000000000009d
!	Mem[0000000010141400] = ff000000, %f25 = 00fff203
	lda	[%i5+%g0]0x80,%f25	! %f25 = ff000000
!	Mem[00000000100c1414] = 41d4ffff, %l6 = 0000000000009d1f
	lduwa	[%i3+0x014]%asi,%l6	! %l6 = 0000000041d4ffff
!	Mem[0000000010081410] = ff00000024b25d04, %l2 = 000000000000009d
	ldxa	[%i2+%o5]0x80,%l2	! %l2 = ff00000024b25d04
!	Mem[0000000010101430] = ffffffff, %l5 = 0000000000000000
	ldsb	[%i4+0x031],%l5		! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (30)
!	%l1 = 00000000ff000004, Mem[0000000030101400] = ff000000
	stwa	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = ff000004

p0_label_154:
!	%f4  = 9d000000, Mem[0000000010081400] = ff800000
	sta	%f4 ,[%i2+%g0]0x80	! Mem[0000000010081400] = 9d000000
!	%f8  = afe103e1 2bb9970c, Mem[0000000010101408] = ff0000ff 00000000
	stda	%f8 ,[%i4+%o4]0x88	! Mem[0000000010101408] = afe103e1 2bb9970c
!	%l0 = 0000000000000000, %l1 = 00000000ff000004, %l3 = fffffffffffffff3
	udivx	%l0,%l1,%l3		! %l3 = 0000000000000000
!	%l5 = ffffffffffffffff, imm = 0000000000000179, %l3 = 0000000000000000
	sub	%l5,0x179,%l3		! %l3 = fffffffffffffe86
!	Mem[000000001000141d] = 5fb27b5a, %l0 = 0000000000000000
	ldstub	[%i0+0x01d],%l0		! %l0 = 000000b2000000ff
!	%f24 = 959a65cd ff000000, Mem[0000000010181408] = 8e0000ff 00000000
	stda	%f24,[%i6+%o4]0x88	! Mem[0000000010181408] = 959a65cd ff000000
!	%l2 = ff00000024b25d04, Mem[0000000030081410] = ff0000ff
	stba	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 040000ff
!	%f23 = 000000ff, Mem[0000000010141418] = ff000000
	st	%f23,[%i5+0x018]	! Mem[0000000010141418] = 000000ff
!	Mem[0000000030181408] = 000000ff, %l0 = 00000000000000b2
	swapa	[%i6+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff000000000000f2, %f12 = 3b22a1a6 a6f921ef
	ldda	[%i5+%o4]0x88,%f12	! %f12 = ff000000 000000f2

p0_label_155:
!	Mem[0000000010041408] = 00000000, %l7 = 00000000f20300ff
	ldsha	[%i1+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101400] = 41d4ffff040000ff, %f16 = 000000ff 000000ff
	ldda	[%i4+%g0]0x89,%f16	! %f16 = 41d4ffff 040000ff
!	Mem[0000000010041400] = 000000ff f2000000, %l6 = 41d4ffff, %l7 = 00000000
	ldda	[%i1+%g0]0x88,%l6	! %l6 = 00000000f2000000 00000000000000ff
!	Mem[0000000030141410] = 0000000300001f9d, %f4  = 9d000000 f2030000
	ldda	[%i5+%o5]0x81,%f4 	! %f4  = 00000003 00001f9d
!	Mem[00000000211c0000] = f2033487, %l1 = 00000000ff000004
	lduh	[%o2+%g0],%l1		! %l1 = 000000000000f203
!	Mem[0000000030141400] = ff000000ff000000, %l2 = ff00000024b25d04
	ldxa	[%i5+%g0]0x81,%l2	! %l2 = ff000000ff000000
!	Mem[0000000030141410] = 9d1f000003000000, %l1 = 000000000000f203
	ldxa	[%i5+%o5]0x89,%l1	! %l1 = 9d1f000003000000
!	Mem[0000000010081408] = 00740000, %l0 = 00000000000000ff
	ldsha	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000074
!	Mem[0000000030101400] = ff000004ffffd441, %l5 = ffffffffffffffff
	ldxa	[%i4+%g0]0x81,%l5	! %l5 = ff000004ffffd441
!	Starting 10 instruction Store Burst
!	%f30 = dd54aa25 10ff9a95, Mem[0000000010001408] = 00000000 9d1f0000
	stda	%f30,[%i0+%o4]0x88	! Mem[0000000010001408] = dd54aa25 10ff9a95

p0_label_156:
!	%l5 = ff000004ffffd441, Mem[0000000030001410] = 9d1f0000e5842e71
	stxa	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = ff000004ffffd441
!	Mem[0000000030101408] = ff0000ff, %l5 = ff000004ffffd441
	ldstuba	[%i4+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010101408] = 0c97b92be103e1af, %l5 = 00000000000000ff, %l0 = 0000000000000074
	add	%i4,0x08,%g1
	casxa	[%g1]0x80,%l5,%l0	! %l0 = 0c97b92be103e1af
!	Mem[00000000100c1410] = ff000000, %l1 = 9d1f000003000000
	ldstuba	[%i3+%o5]0x80,%l1	! %l1 = 000000ff000000ff
!	%l6 = 00000000f2000000, %l5 = 00000000000000ff, %l2 = ff000000ff000000
	add	%l6,%l5,%l2		! %l2 = 00000000f20000ff
!	Mem[000000001014143e] = ffb27b5a, %l7 = 00000000000000ff
	ldstub	[%i5+0x03e],%l7		! %l7 = 0000007b000000ff
!	%l5 = 00000000000000ff, Mem[0000000030181400] = f20300ff
	stwa	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff
!	%l2 = 00000000f20000ff, Mem[0000000010101408] = 0c97b92b
	stba	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = ff97b92b
!	Mem[0000000030041400] = 7f000000, %l7 = 000000000000007b
	ldstuba	[%i1+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000000, %l6 = 00000000f2000000
	lduha	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000000

p0_label_157:
!	Mem[0000000010081410] = 000000ff, %l5 = 00000000000000ff
	ldsba	[%i2+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010181410] = 00000000, %l6 = 0000000000000000
	lduba	[%i6+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101408] = ff97b92b, %l0 = 0c97b92be103e1af
	ldsha	[%i4+%o4]0x80,%l0	! %l0 = ffffffffffffff97
!	Mem[0000000010181410] = 0000004600000000, %f2  = ff0000ff 000000ff
	ldda	[%i6+%o5]0x88,%f2 	! %f2  = 00000046 00000000
!	Mem[0000000010141408] = 000000f2, %l4 = 00000000000000ff
	ldswa	[%i5+%o4]0x88,%l4	! %l4 = 00000000000000f2
!	Mem[0000000030101400] = ff000004, %l0 = ffffffffffffff97
	ldsba	[%i4+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010041418] = 000000ff, %l4 = 00000000000000f2
	ldub	[%i1+0x01b],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010181414] = 46000000, %l6 = 0000000000000000
	lduha	[%i6+0x016]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = ffffffc6 000000ff, %l4 = 000000ff, %l5 = ffffffff
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 00000000ffffffc6 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 0000cd00, %l3 = fffffffffffffe86
	swapa	[%i1+%o4]0x89,%l3	! %l3 = 000000000000cd00

p0_label_158:
!	%f28 = 5a7bb25f 00000021, Mem[0000000010101408] = ff97b92b e103e1af
	std	%f28,[%i4+%o4]	! Mem[0000000010101408] = 5a7bb25f 00000021
!	Mem[00000000201c0000] = 00008ea0, %l7 = 0000000000000000
	ldstub	[%o0+%g0],%l7		! %l7 = 00000000000000ff
!	%f26 = 00000000 8e0000ff, %l4 = 00000000ffffffc6
!	Mem[0000000030141418] = ff000000ff000004
	add	%i5,0x018,%g1
	stda	%f26,[%g1+%l4]ASI_PST32_S ! Mem[0000000030141418] = 00000000ff000004
!	%f12 = ff000000 000000f2, Mem[0000000030041400] = ff00007f a7c69cf3
	stda	%f12,[%i1+%g0]0x81	! Mem[0000000030041400] = ff000000 000000f2
!	%l0 = ffffffffffffffff, Mem[0000000030041408] = 86feffff
	stwa	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffff
!	Mem[000000001014141c] = ff000004, %l1 = 000000ff, %l4 = ffffffc6
	add	%i5,0x1c,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 00000000ff000004
!	Mem[000000001018140c] = cd659a95, %l6 = 00000000, %l5 = 000000ff
	add	%i6,0x0c,%g1
	casa	[%g1]0x80,%l6,%l5	! %l5 = 00000000cd659a95
!	%f24 = 959a65cd ff000000, Mem[0000000010141400] = 000000ff 000000ff
	stda	%f24,[%i5+%g0]0x88	! Mem[0000000010141400] = 959a65cd ff000000
!	%f0  = ff000000, Mem[00000000100c1424] = 00000000
	st	%f0 ,[%i3+0x024]	! Mem[00000000100c1424] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 000000ff, %l2 = 00000000f20000ff
	lduwa	[%i1+%o5]0x88,%l2	! %l2 = 00000000000000ff

p0_label_159:
!	Mem[0000000010141410] = 9d1f0000 0300c800, %l4 = ff000004, %l5 = cd659a95
	ldda	[%i5+%o5]0x88,%l4	! %l4 = 000000000300c800 000000009d1f0000
!	Mem[0000000010081400] = 9d000000, %l7 = 0000000000000000
	ldswa	[%i2+%g0]0x80,%l7	! %l7 = ffffffff9d000000
!	Mem[0000000021800000] = 46ff133c, %l0 = ffffffffffffffff
	lduba	[%o3+0x000]%asi,%l0	! %l0 = 0000000000000046
!	Mem[000000001008143c] = 13288134, %l6 = 0000000000000000
	ldsh	[%i2+0x03c],%l6		! %l6 = 0000000000001328
!	Mem[0000000030001408] = 00000000 00000000, %l2 = 000000ff, %l3 = 0000cd00
	ldda	[%i0+%o4]0x89,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000030101400] = ff000004, %f2  = 00000046
	lda	[%i4+%g0]0x81,%f2 	! %f2 = ff000004
!	Mem[0000000030141410] = 00000003, %l6 = 0000000000001328
	ldswa	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000003
!	Mem[0000000020800040] = 0000c0bd, %l1 = 00000000000000ff
	ldsha	[%o1+0x040]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181400] = 00026387, %l7 = ffffffff9d000000
	swapa	[%i6+%g0]0x88,%l7	! %l7 = 0000000000026387
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l3	! %l3 = 00000000000000ff

p0_label_160:
!	%l3 = 0000000000000000, Mem[00000000100c1410] = ffffd441000000ff
	stxa	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000000000000000
!	%l0 = 0000000000000046, Mem[0000000030101400] = ff000004
	stwa	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000046
!	Mem[0000000030041408] = ffffffff, %l5 = 000000009d1f0000
	ldstuba	[%i1+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	%f18 = ff000000 00000000, %l1 = 0000000000000000
!	Mem[00000000300c1438] = 38763b020700da69
	add	%i3,0x038,%g1
	stda	%f18,[%g1+%l1]ASI_PST8_S ! Mem[00000000300c1438] = 38763b020700da69
!	%l2 = 0000000000000000, Mem[0000000030081410] = 040000ff00001f9d
	stxa	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000000000000000
!	%l7 = 0000000000026387, Mem[0000000010141410] = 0300c800
	stba	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 0300c887
!	%f10 = b02b9bb0 2edfd309, %l1 = 0000000000000000
!	Mem[0000000010181430] = 10659a95894141d4
	add	%i6,0x030,%g1
	stda	%f10,[%g1+%l1]ASI_PST8_P ! Mem[0000000010181430] = 10659a95894141d4
!	%f2  = ff000004, %f25 = ff000000, %f16 = 41d4ffff
	fadds	%f2 ,%f25,%f16		! %f16 = ff800000
!	%f16 = ff800000 040000ff ff000000 00000000
!	%f20 = 9d1f0000 03000000 040000ff 000000ff
!	%f24 = 959a65cd ff000000 00000000 8e0000ff
!	%f28 = 5a7bb25f 00000021 dd54aa25 10ff9a95
	stda	%f16,[%i4]ASI_BLK_AIUSL	! Block Store to 0000000030101400
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (31)
!	Mem[0000000030101408] = 00000000, %l3 = 0000000000000000
	ldswa	[%i4+%o4]0x89,%l3	! %l3 = 0000000000000000

p0_label_161:
!	Mem[0000000030141408] = 00000000, %l1 = 0000000000000000
	ldswa	[%i5+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1408] = ff000000c6ffffff, %l6 = 0000000000000003
	ldxa	[%i3+%o4]0x89,%l6	! %l6 = ff000000c6ffffff
!	Mem[000000001004141c] = 0000f1c8, %l0 = 0000000000000046
	lduwa	[%i1+0x01c]%asi,%l0	! %l0 = 000000000000f1c8
!	Mem[00000000300c1400] = ff0003f2, %f29 = 00000021
	lda	[%i3+%g0]0x81,%f29	! %f29 = ff0003f2
!	%f16 = ff800000, %f12 = ff000000
	fcmps	%fcc2,%f16,%f12		! %fcc2 = 1
!	Mem[00000000300c1408] = c6ffffff, %f8  = afe103e1
	lda	[%i3+%o4]0x89,%f8 	! %f8 = c6ffffff
!	Mem[0000000010041400] = f2000000, %f16 = ff800000
	lda	[%i1+%g0]0x88,%f16	! %f16 = f2000000
!	Mem[0000000010081408] = 00007400, %f19 = 00000000
	lda	[%i2+%o4]0x88,%f19	! %f19 = 00007400
!	Mem[0000000010081410] = 000000ff, %l5 = 00000000000000ff
	lduwa	[%i2+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l6 = ff000000c6ffffff, Mem[0000000030081408] = ff0000ff00000000
	stxa	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = ff000000c6ffffff

p0_label_162:
!	%l0 = 000000000000f1c8, imm = fffffffffffffc13, %l0 = 000000000000f1c8
	xor	%l0,-0x3ed,%l0		! %l0 = ffffffffffff0ddb
!	%l0 = ffff0ddb, %l1 = 00000000, Mem[0000000010081400] = 9d000000 1f18accd
	stda	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = ffff0ddb 00000000
!	%l1 = 0000000000000000, Mem[00000000211c0000] = f2033487
	sth	%l1,[%o2+%g0]		! Mem[00000000211c0000] = 00003487
!	Mem[0000000010141400] = 000000ffcd659a95, %l7 = 0000000000026387, %l0 = ffffffffffff0ddb
	casxa	[%i5]0x80,%l7,%l0	! %l0 = 000000ffcd659a95
!	%l4 = 0300c800, %l5 = 000000ff, Mem[0000000030041408] = ffffffff 00001f9d
	stda	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 0300c800 000000ff
!	Mem[0000000010141410] = 87c80003, %l4 = 000000000300c800
	swapa	[%i5+%o5]0x80,%l4	! %l4 = 0000000087c80003
!	%f28 = 5a7bb25f, Mem[0000000030181408] = 000000b2
	sta	%f28,[%i6+%o4]0x89	! Mem[0000000030181408] = 5a7bb25f
!	Mem[00000000100c1410] = 00000000, %l4 = 0000000087c80003
	ldstuba	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%f9  = 2bb9970c, Mem[0000000030101400] = 040000ff
	sta	%f9 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 2bb9970c
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 000000f2, %f30 = dd54aa25
	lda	[%i1+%g0]0x80,%f30	! %f30 = 000000f2

p0_label_163:
!	Mem[0000000010141408] = ff000000 000000f2, %l6 = c6ffffff, %l7 = 00026387
	ldda	[%i5+%o4]0x88,%l6	! %l6 = 00000000000000f2 00000000ff000000
!	%l0 = 000000ffcd659a95, %l7 = 00000000ff000000, %l1 = 0000000000000000
	or	%l0,%l7,%l1		! %l1 = 000000ffff659a95
!	Mem[0000000010181424] = 000000f2, %l2 = 0000000000000000
	ldsha	[%i6+0x026]%asi,%l2	! %l2 = 00000000000000f2
!	Mem[0000000030001400] = 04000000, %l7 = 00000000ff000000
	lduha	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000400
!	Mem[0000000010081400] = 00000000db0dffff, %l1 = 000000ffff659a95
	ldxa	[%i2+%g0]0x88,%l1	! %l1 = 00000000db0dffff
!	Mem[0000000010181408] = 000000ff, %f2  = ff000004
	lda	[%i6+%o4]0x80,%f2 	! %f2 = 000000ff
!	Mem[0000000030141410] = 9d1f000003000000, %l0 = 000000ffcd659a95
	ldxa	[%i5+%o5]0x89,%l0	! %l0 = 9d1f000003000000
!	Mem[0000000010001400] = ff0000ff, %l5 = 00000000000000ff
	ldsba	[%i0+%g0]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010001418] = 8b21c72e, %l6 = 00000000000000f2
	lduha	[%i0+0x01a]%asi,%l6	! %l6 = 000000000000c72e
!	Starting 10 instruction Store Burst
!	%f20 = 9d1f0000 03000000, %l4 = 0000000000000000
!	Mem[0000000030041410] = ff000000ff000000
	add	%i1,0x010,%g1
	stda	%f20,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030041410] = ff000000ff000000

p0_label_164:
!	Mem[0000000010081408] = 00007400, %l7 = 0000000000000400
	ldstuba	[%i2+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%l2 = 00000000000000f2, Mem[0000000010041408] = 000000009d1f0000
	stxa	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000000000f2
!	%l5 = ffffffffffffffff, Mem[0000000010101400] = ff0003f2
	stba	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = ff0003f2
!	%f0  = ff000000, Mem[00000000100c1408] = f39cc6a7
	sta	%f0 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff000000
!	Mem[0000000010081408] = ff740000, %l0 = 9d1f000003000000
	ldstuba	[%i2+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010101408] = 5fb27b5a, %l6 = 000000000000c72e
	ldstuba	[%i4+%o4]0x88,%l6	! %l6 = 0000005a000000ff
!	Mem[0000000010081438] = 0097d89013288134, %l0 = 00000000000000ff, %l0 = 00000000000000ff
	add	%i2,0x38,%g1
	casxa	[%g1]0x80,%l0,%l0	! %l0 = 0097d89013288134
!	Mem[0000000010141400] = 000000ff, %l1 = 00000000db0dffff, %asi = 80
	swapa	[%i5+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	%l0 = 0097d89013288134, Mem[0000000010181410] = 00000000
	stba	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 34000000
!	Starting 10 instruction Load Burst
!	%f0  = ff000000 ffffd441 000000ff 00000000
!	%f4  = 00000003 00001f9d 04ab8e31 1d4201a7
!	%f8  = c6ffffff 2bb9970c b02b9bb0 2edfd309
!	%f12 = ff000000 000000f2 f39cc6a7 00007400
	stda	%f0,[%i1]ASI_COMMIT_S	! Block Store to 0000000030041400

p0_label_165:
!	Mem[0000000010141428] = 7ffb8e61, %l7 = 0000000000000000
	ldsh	[%i5+0x028],%l7		! %l7 = 0000000000007ffb
!	Mem[0000000030141400] = ff000000 ff000000, %l2 = 000000f2, %l3 = 00000000
	ldda	[%i5+%g0]0x81,%l2	! %l2 = 00000000ff000000 00000000ff000000
!	Mem[0000000021800100] = ff900b85, %l3 = 00000000ff000000
	lduha	[%o3+0x100]%asi,%l3	! %l3 = 000000000000ff90
!	Mem[0000000010181400] = 0000009d, %l5 = ffffffffffffffff
	ldswa	[%i6+%g0]0x80,%l5	! %l5 = 000000000000009d
!	Mem[0000000010101430] = ffffffff, %l5 = 000000000000009d
	ldub	[%i4+0x032],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030141400] = ff000000 ff000000 00000000 000000ff
!	Mem[0000000030141410] = 00000003 00001f9d 00000000 ff000004
!	Mem[0000000030141420] = 03f2ff00 cd659a95 7ffb8e61 7b68038d
!	Mem[0000000030141430] = 21000000 5fb27b5a ffffffff ffb27b5a
	ldda	[%i5]ASI_BLK_S,%f16	! Block Load from 0000000030141400
!	Mem[0000000030081408] = ffffffc6, %l3 = 000000000000ff90
	ldsha	[%i2+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010001418] = 8b21c72e5fff7b5a, %l3 = ffffffffffffffff
	ldx	[%i0+0x018],%l3		! %l3 = 8b21c72e5fff7b5a
!	Mem[0000000010181408] = 000000ff, %f12 = ff000000
	ld	[%i6+%o4],%f12	! %f12 = 000000ff
!	Starting 10 instruction Store Burst
!	%l2 = ff000000, %l3 = 5fff7b5a, Mem[0000000010001410] = 000000ff 000000ff
	stda	%l2,[%i0+0x010]%asi	! Mem[0000000010001410] = ff000000 5fff7b5a

p0_label_166:
!	%f12 = 000000ff, Mem[0000000010081408] = ff740000
	sta	%f12,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000ff
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000010041410] = ff000000, %l2 = 00000000ff000000
	swapa	[%i1+%o5]0x80,%l2	! %l2 = 00000000ff000000
!	%l2 = 00000000ff000000, Mem[0000000010141410] = 0300c80000001f9d
	stx	%l2,[%i5+%o5]		! Mem[0000000010141410] = 00000000ff000000
!	%l4 = 0000000000000000, Mem[0000000010041436] = ff5db224, %asi = 80
	stba	%l4,[%i1+0x036]%asi	! Mem[0000000010041434] = ff5d0024
!	%f4  = 00000003 00001f9d, %l5 = 00000000000000ff
!	Mem[00000000100c1410] = ff00000000000000
	add	%i3,0x010,%g1
	stda	%f4,[%g1+%l5]ASI_PST8_P ! Mem[00000000100c1410] = 0000000300001f9d
!	%l2 = 00000000ff000000, Mem[0000000010141408] = 000000f2
	stba	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%l2 = ff000000, %l3 = 5fff7b5a, Mem[0000000010001408] = 10ff9a95 dd54aa25
	stda	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = ff000000 5fff7b5a
!	Mem[0000000010101408] = 5fb27bff, %l3 = 8b21c72e5fff7b5a
	swapa	[%i4+%o4]0x88,%l3	! %l3 = 000000005fb27bff
!	%l0 = 13288134, %l1 = 000000ff, Mem[0000000010101400] = ff0003f2 00000000
	stda	%l0,[%i4+0x000]%asi	! Mem[0000000010101400] = 13288134 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ffffffc6000000ff, %l6 = 000000000000005a
	ldxa	[%i3+%o4]0x81,%l6	! %l6 = ffffffc6000000ff

p0_label_167:
!	Mem[00000000100c1428] = ff000000, %l7 = 0000000000007ffb
	ldsh	[%i3+0x02a],%l7		! %l7 = 0000000000000000
!	Mem[0000000030041400] = 41d4ffff000000ff, %f22 = 00000000 ff000004
	ldda	[%i1+%g0]0x89,%f22	! %f22 = 41d4ffff 000000ff
!	Mem[0000000010081424] = c791c515, %l1 = 00000000000000ff
	ldsb	[%i2+0x027],%l1		! %l1 = 0000000000000015
!	Mem[0000000010041400] = 000000f2, %l0 = 0097d89013288134
	lduba	[%i1+0x001]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %f14 = f39cc6a7
	lda	[%i2+%o5]0x81,%f14	! %f14 = 00000000
!	Mem[0000000030081400] = 00000000000000ff, %l3 = 000000005fb27bff
	ldxa	[%i2+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[000000001014140c] = 000000ff, %f9  = 2bb9970c
	lda	[%i5+0x00c]%asi,%f9 	! %f9 = 000000ff
!	Mem[0000000010041400] = f2000000, %l2 = 00000000ff000000
	lduwa	[%i1+%g0]0x88,%l2	! %l2 = 00000000f2000000
!	%l5 = 00000000000000ff, %l2 = 00000000f2000000, %l7 = 0000000000000000
	andn	%l5,%l2,%l7		! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181404] = 00000000, %l3 = 00000000000000ff
	lduh	[%i6+0x006],%l3		! %l3 = 0000000000000000

p0_label_168:
!	Mem[00000000100c142e] = ff000004, %l6 = ffffffc6000000ff
	ldstub	[%i3+0x02e],%l6		! %l6 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000030081400] = ff00000000000000
	stxa	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l2 = 00000000f2000000
	ldstuba	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%f18 = 00000000, Mem[0000000010101400] = 13288134
	sta	%f18,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	%l4 = 0000000000000000, Mem[000000001018140e] = cd659a95, %asi = 80
	stha	%l4,[%i6+0x00e]%asi	! Mem[000000001018140c] = cd650000
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010101410] = 00001fff ff0000ff
	stda	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000 000000ff
!	%l1 = 0000000000000015, Mem[0000000030181410] = ff000000
	stba	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = 15000000
!	%l0 = 0000000000000000, Mem[00000000100c1408] = 0074ff00000000ff
	stxa	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000000000000000
!	%l5 = 00000000000000ff, Mem[0000000030101400] = 0c97b92b000080ff
	stxa	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ff00000000000004, %f16 = ff000000 ff000000
	ldda	[%i0+%g0]0x89,%f16	! %f16 = ff000000 00000004

p0_label_169:
!	Mem[0000000010081408] = 000000ffa7c69cf3, %f28 = 21000000 5fb27b5a
	ldda	[%i2+%o4]0x80,%f28	! %f28 = 000000ff a7c69cf3
!	Mem[0000000010141410] = 00000000, %l5 = 00000000000000ff
	ldswa	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181410] = 34000000, %l4 = 0000000000000000
	ldsw	[%i6+%o5],%l4		! %l4 = 0000000034000000
!	Mem[0000000010101408] = 5a7bff5f00000021, %l5 = 0000000000000000
	ldxa	[%i4+0x008]%asi,%l5	! %l5 = 5a7bff5f00000021
!	Mem[0000000010001418] = 8b21c72e5fff7b5a, %l1 = 0000000000000015
	ldxa	[%i0+0x018]%asi,%l1	! %l1 = 8b21c72e5fff7b5a
!	Mem[000000001004140c] = 000000f2, %l7 = 00000000000000ff
	ldsh	[%i1+0x00e],%l7		! %l7 = 00000000000000f2
!	Mem[00000000100c1420] = f2000000, %l1 = 8b21c72e5fff7b5a
	ldsw	[%i3+0x020],%l1		! %l1 = fffffffff2000000
!	Mem[0000000030081410] = 00000000, %l6 = 0000000000000000
	lduha	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181400] = 000000ff, %f5  = 00001f9d
	lda	[%i6+%g0]0x89,%f5 	! %f5 = 000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000f2, Mem[0000000030081408] = ffffffc6000000ff
	stxa	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000000000f2

p0_label_170:
!	Mem[0000000010101410] = 00000000, %l5 = 5a7bff5f00000021
	ldstuba	[%i4+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	%f8  = c6ffffff 000000ff, %l3 = 0000000000000000
!	Mem[0000000030101430] = 210000005fb27b5a
	add	%i4,0x030,%g1
	stda	%f8,[%g1+%l3]ASI_PST8_SL ! Mem[0000000030101430] = 210000005fb27b5a
!	Mem[0000000020800001] = ff5f4ebd, %l3 = 0000000000000000
	ldstuba	[%o1+0x001]%asi,%l3	! %l3 = 0000005f000000ff
!	Mem[0000000010081424] = c791c515, %l5 = 00000000, %l6 = 00000000
	add	%i2,0x24,%g1
	casa	[%g1]0x80,%l5,%l6	! %l6 = 00000000c791c515
!	%l7 = 00000000000000f2, Mem[0000000030101408] = 000000ff
	stba	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000f2
!	%l3 = 000000000000005f, imm = 0000000000000587, %l1 = fffffffff2000000
	and	%l3,0x587,%l1		! %l1 = 0000000000000007
!	Mem[0000000010181400] = 0000009d, %l3 = 000000000000005f
	swapa	[%i6+%g0]0x80,%l3	! %l3 = 000000000000009d
!	Mem[0000000010001418] = 8b21c72e5fff7b5a, %l0 = 0000000000000000, %l2 = 0000000000000000
	add	%i0,0x18,%g1
	casxa	[%g1]0x80,%l0,%l2	! %l2 = 8b21c72e5fff7b5a
!	Mem[0000000030141408] = 00000000, %l7 = 00000000000000f2
	ldstuba	[%i5+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 34000000, %f17 = 00000004
	lda	[%i6+0x010]%asi,%f17	! %f17 = 34000000

p0_label_171:
!	Mem[0000000010141408] = ff00000000000000, %f0  = ff000000 ffffd441
	ldda	[%i5+%o4]0x88,%f0 	! %f0  = ff000000 00000000
!	%l7 = 0000000000000000, immed = fffff66b, %y  = 00000000
	sdiv	%l7,-0x995,%l3		! %l3 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000030141400] = ff000000ff000000, %f28 = 000000ff a7c69cf3
	ldda	[%i5+%g0]0x81,%f28	! %f28 = ff000000 ff000000
!	Mem[0000000030081410] = 00000000, %l2 = 8b21c72e5fff7b5a
	lduha	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001408] = 0000000000000000, %f12 = 000000ff 000000f2
	ldda	[%i0+%o4]0x89,%f12	! %f12 = 00000000 00000000
!	Mem[0000000030101408] = 000000f2, %l6 = 00000000c791c515
	ldsha	[%i4+%o4]0x89,%l6	! %l6 = 00000000000000f2
!	Mem[0000000010101400] = 00000000, %l5 = 0000000000000000
	ldsha	[%i4+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081400] = 0000000000000000, %f28 = ff000000 ff000000
	ldda	[%i2+%g0]0x81,%f28	! %f28 = 00000000 00000000
!	Mem[0000000010001400] = ff0000ff, %l2 = 0000000000000000
	ldsba	[%i0+%g0]0x88,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000007, Mem[000000001008140e] = a7c69cf3
	sth	%l1,[%i2+0x00e]		! Mem[000000001008140c] = a7c60007

p0_label_172:
!	%f4  = 00000003 000000ff, Mem[0000000010081438] = 0097d890 13288134
	stda	%f4 ,[%i2+0x038]%asi	! Mem[0000000010081438] = 00000003 000000ff
!	Mem[00000000201c0001] = ff008ea0, %l0 = 0000000000000000
	ldstub	[%o0+0x001],%l0		! %l0 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000030141408] = ff000000000000ff
	stxa	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000000000000000
!	Mem[0000000030101410] = 03000000, %l3 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	%l1 = 0000000000000007, immed = 0000064a, %y  = 00000000
	udiv	%l1,0x64a,%l6		! %l6 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000030081400] = 00000000, %l2 = ffffffffffffffff
	ldstuba	[%i2+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%f9  = 000000ff, Mem[0000000010181408] = ff000000
	sta	%f9 ,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff
!	Mem[0000000010141408] = 00000000, %l1 = 0000000000000007
	swapa	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = ff000000, %l2 = 0000000000000000
	lduha	[%i2+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff000000, %l2 = 0000000000000000
	lduba	[%i4+%o5]0x80,%l2	! %l2 = 00000000000000ff

p0_label_173:
!	Mem[0000000030181408] = 5fb27b5a, %l5 = 0000000000000000
	ldswa	[%i6+%o4]0x81,%l5	! %l5 = 000000005fb27b5a
!	Mem[0000000010081400] = ffff0ddb00000000, %f22 = 41d4ffff 000000ff
	ldda	[%i2+%g0]0x80,%f22	! %f22 = ffff0ddb 00000000
!	Mem[0000000030141400] = 000000ff000000ff, %f18 = 00000000 000000ff
	ldda	[%i5+%g0]0x89,%f18	! %f18 = 000000ff 000000ff
!	Mem[00000000100c1430] = ff000000, %f10 = b02b9bb0
	lda	[%i3+0x030]%asi,%f10	! %f10 = ff000000
!	%f3  = 00000000, %f29 = 00000000
	fsqrts	%f3 ,%f29		! %f29 = 00000000
!	Mem[0000000030181410] = 15000000, %l7 = 0000000000000000
	lduba	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000015
!	Mem[0000000010041410] = ff000000, %l1 = 0000000000000000
	lduha	[%i1+%o5]0x80,%l1	! %l1 = 000000000000ff00
!	Mem[00000000100c141c] = ffc7218b, %l0 = 0000000000000000
	lduh	[%i3+0x01c],%l0		! %l0 = 000000000000ffc7
!	Mem[0000000010001400] = ff0000ff, %l6 = 0000000000000000
	ldswa	[%i0+%g0]0x88,%l6	! %l6 = ffffffffff0000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = ff000000, %l1 = 000000000000ff00, %asi = 80
	swapa	[%i6+0x008]%asi,%l1	! %l1 = 00000000ff000000

p0_label_174:
!	%l0 = 000000000000ffc7, Mem[0000000030141408] = 00000000
	stha	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = ffc70000
!	%f5  = 000000ff, Mem[0000000010081408] = ff000000
	sta	%f5 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000ff
!	Mem[0000000030101410] = ff000003, %l4 = 0000000034000000
	ldstuba	[%i4+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[00000000300c1410] = 0000f2ff, %l0 = 000000000000ffc7
	swapa	[%i3+%o5]0x89,%l0	! %l0 = 000000000000f2ff
!	Mem[0000000010081400] = db0dffff, %l4 = 00000000000000ff
	ldstuba	[%i2+%g0]0x88,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010101400] = 00000000, %l5 = 000000005fb27b5a
	ldstuba	[%i4+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%l1 = 00000000ff000000, Mem[0000000010081418] = 21448ed6, %asi = 80
	stha	%l1,[%i2+0x018]%asi	! Mem[0000000010081418] = 00008ed6
!	%l0 = 000000000000f2ff, Mem[0000000010041416] = 87630200
	sth	%l0,[%i1+0x016]		! Mem[0000000010041414] = 8763f2ff
!	Mem[0000000020800000] = ffff4ebd, %l2 = 00000000000000ff
	ldstub	[%o1+%g0],%l2		! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff0000ff 00000000, %l6 = ff0000ff, %l7 = 00000015
	ldda	[%i0+0x000]%asi,%l6	! %l6 = 00000000ff0000ff 0000000000000000

p0_label_175:
!	Mem[0000000010081400] = 00000000 db0dffff, %l0 = 0000f2ff, %l1 = ff000000
	ldda	[%i2+%g0]0x88,%l0	! %l0 = 00000000db0dffff 0000000000000000
!	Mem[00000000100c142c] = ff00ff04, %l6 = 00000000ff0000ff
	ldub	[%i3+0x02e],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030001408] = 00000000, %l5 = 0000000000000000
	ldsha	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141410] = 03000000, %l3 = 0000000000000000
	lduba	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001400] = 04000000, %l5 = 0000000000000000
	ldsha	[%i0+%g0]0x81,%l5	! %l5 = 0000000000000400
!	Mem[0000000030081410] = 00000000 00000000, %l4 = 000000ff, %l5 = 00000400
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010081410] = ff000000, %l0 = 00000000db0dffff
	lduha	[%i2+%o5]0x80,%l0	! %l0 = 000000000000ff00
!	Mem[000000001004143c] = 10ff9a95, %l1 = 0000000000000000
	ldub	[%i1+0x03e],%l1		! %l1 = 000000000000009a
!	Mem[0000000010101410] = 000000ff, %l5 = 0000000000000000
	ldsha	[%i4+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 00000000, %l6 = 00000000000000ff
	swapa	[%i2+%o4]0x81,%l6	! %l6 = 0000000000000000

p0_label_176:
!	%l2 = 00000000000000ff, Mem[0000000030001408] = 00000000
	stwa	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000ff
!	Mem[00000000100c1410] = 03000000, %l2 = 00000000000000ff
	ldstuba	[%i3+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%f4  = 00000003, Mem[0000000010001418] = 8b21c72e
	st	%f4 ,[%i0+0x018]	! Mem[0000000010001418] = 00000003
!	%l2 = 0000000000000000, imm = fffffffffffffeb9, %l1 = 000000000000009a
	subc	%l2,-0x147,%l1		! %l1 = 0000000000000147
!	%l6 = 0000000000000000, Mem[0000000010141408] = 07000000
	stba	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 07000000
!	Mem[0000000030141408] = 0000c7ff, %l1 = 0000000000000147
	swapa	[%i5+%o4]0x89,%l1	! %l1 = 000000000000c7ff
!	Mem[00000000100c1410] = ff000003, %l1 = 000000000000c7ff
	ldstuba	[%i3+%o5]0x80,%l1	! %l1 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000010041408] = 00000000000000f2, %asi = 80
	stxa	%l3,[%i1+0x008]%asi	! Mem[0000000010041408] = 0000000000000000
!	Mem[000000001018142a] = 0000f1c8, %l6 = 0000000000000000
	ldstub	[%i6+0x02a],%l6		! %l6 = 000000f1000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 0700c6a7 000000ff, %l0 = 0000ff00, %l1 = 000000ff
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 00000000000000ff 000000000700c6a7

p0_label_177:
!	Mem[0000000030001408] = ff000000, %l3 = 0000000000000000
	lduba	[%i0+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101400] = ff000000, %l6 = 00000000000000f1
	ldsha	[%i4+%g0]0x80,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000030141408] = 00000000 00000147, %l6 = ffffff00, %l7 = 00000000
	ldda	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000147 0000000000000000
!	Mem[0000000030101408] = 000000f2, %l3 = 00000000000000ff
	ldsba	[%i4+%o4]0x89,%l3	! %l3 = fffffffffffffff2
!	Mem[0000000010181408] = 00ff0000, %l7 = 0000000000000000
	ldsba	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081410] = 045db224000000ff, %f20 = 00000003 00001f9d
	ldda	[%i2+%o5]0x88,%f20	! %f20 = 045db224 000000ff
	membar	#Sync			! Added by membar checker (33)
!	Mem[00000000100c1400] = 000000ff 00000000 00000000 00000000
!	Mem[00000000100c1410] = ff000003 00001f9d 00001f9d ffc7218b
!	Mem[00000000100c1420] = f2000000 ff000000 ff000000 ff00ff04
!	Mem[00000000100c1430] = ff000000 00000021 000000ff 000080ff
	ldda	[%i3]ASI_BLK_P,%f0	! Block Load from 00000000100c1400
!	Mem[0000000030001408] = 00000000 000000ff, %l6 = 00000147, %l7 = 00000000
	ldda	[%i0+%o4]0x89,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Mem[0000000030001400] = 00000004, %l2 = 0000000000000000
	ldsha	[%i0+%g0]0x89,%l2	! %l2 = 0000000000000004
!	Starting 10 instruction Store Burst
!	%f16 = ff000000, Mem[000000001008140c] = a7c60007
	sta	%f16,[%i2+0x00c]%asi	! Mem[000000001008140c] = ff000000

p0_label_178:
!	%l2 = 0000000000000004, Mem[0000000010101408] = 210000005fff7b5a
	stxa	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000000000000004
	membar	#Sync			! Added by membar checker (34)
!	%f22 = ffff0ddb 00000000, Mem[00000000100c1400] = 000000ff 00000000
	stda	%f22,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffff0ddb 00000000
!	%f8  = f2000000 ff000000, Mem[0000000010141400] = db0dffff cd659a95
	std	%f8 ,[%i5+%g0]	! Mem[0000000010141400] = f2000000 ff000000
!	Mem[00000000100c1400] = ffff0ddb, %l4 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l4	! %l4 = 00000000ffff0ddb
!	%l3 = fffffffffffffff2, Mem[0000000030041408] = 000000ff
	stha	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = fff200ff
!	%l6 = 00000000000000ff, Mem[0000000030101400] = 00000000
	stha	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 00ff0000
!	%f2  = 00000000, Mem[0000000030181408] = 5a7bb25f
	sta	%f2 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	Mem[00000000100c1410] = 030000ff, %l2 = 0000000000000004
	swapa	[%i3+%o5]0x88,%l2	! %l2 = 00000000030000ff
!	%l3 = fffffffffffffff2, Mem[0000000030081408] = 000000ff
	stwa	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = fffffff2
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 045db224000000ff, %l0 = 00000000000000ff
	ldxa	[%i2+%o5]0x88,%l0	! %l0 = 045db224000000ff

p0_label_179:
!	Mem[0000000010081400] = db0dffff, %l3 = fffffffffffffff2
	lduha	[%i2+%g0]0x88,%l3	! %l3 = 000000000000ffff
!	Mem[000000001010141c] = 00005d04, %l6 = 00000000000000ff
	lduh	[%i4+0x01e],%l6		! %l6 = 0000000000005d04
!	Mem[0000000030101408] = 000000f2, %f16 = ff000000
	lda	[%i4+%o4]0x89,%f16	! %f16 = 000000f2
!	Mem[00000000300c1400] = f20300ff, %f0  = 000000ff
	lda	[%i3+%g0]0x89,%f0 	! %f0 = f20300ff
!	Mem[0000000030081410] = 00000000, %l0 = 045db224000000ff
	ldswa	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = ff000000, %l2 = 00000000030000ff
	ldsba	[%i4+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030081408] = fffffff2, %l1 = 000000000700c6a7
	lduwa	[%i2+%o4]0x81,%l1	! %l1 = 00000000fffffff2
!	Mem[0000000010181400] = 5f000000, %l5 = 00000000000000ff
	lduba	[%i6+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000021800000] = 46ff133c, %l3 = 000000000000ffff
	ldsba	[%o3+0x000]%asi,%l3	! %l3 = 0000000000000046
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000005d04, Mem[0000000030041410] = 00000003
	stwa	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 00005d04

p0_label_180:
!	Mem[0000000010181410] = 00000034, %l0 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l0	! %l0 = 00000034000000ff
!	Mem[0000000010101438] = 000000ff, %l0 = 0000000000000034
	ldstub	[%i4+0x038],%l0		! %l0 = 00000000000000ff
!	Mem[00000000100c1422] = f2000000, %l5 = 0000000000000000
	ldstub	[%i3+0x022],%l5		! %l5 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010041410] = ff000000
	stba	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	Mem[0000000010081408] = ff000000, %l3 = 0000000000000046
	ldstuba	[%i2+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030141410] = 03000000, %l1 = 00000000fffffff2
	swapa	[%i5+%o5]0x89,%l1	! %l1 = 0000000003000000
!	%f6  = 00001f9d ffc7218b, Mem[00000000300c1400] = ff0003f2 4d0000ff
	stda	%f6 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00001f9d ffc7218b
!	Mem[00000000300c1408] = c6ffffff, %l1 = 0000000003000000
	ldstuba	[%i3+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000100c142b] = ff000000, %l1 = 00000000000000ff
	ldstub	[%i3+0x02b],%l1		! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff000000, %l7 = 0000000000000000
	ldswa	[%i2+%o4]0x80,%l7	! %l7 = ffffffffff000000

p0_label_181:
!	Mem[0000000010081410] = 000000ff, %l7 = ffffffffff000000
	ldsba	[%i2+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030181408] = 00000000, %l5 = 0000000000000000
	ldsha	[%i6+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000211c0000] = 00003487, %l1 = 0000000000000000
	ldsh	[%o2+%g0],%l1		! %l1 = 0000000000000000
!	Mem[0000000010001400] = 00000000 ff0000ff, %l4 = ffff0ddb, %l5 = 00000000
	ldda	[%i0+%g0]0x88,%l4	! %l4 = 00000000ff0000ff 0000000000000000
!	Mem[0000000030181408] = 00000000 000000ff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000 00000000000000ff
!	Mem[00000000300c1410] = 0000ffc7, %l7 = ffffffffffffffff
	lduba	[%i3+%o5]0x89,%l7	! %l7 = 00000000000000c7
!	Mem[00000000100c1410] = 00000004, %l2 = ffffffffffffffff
	ldsba	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000004
!	Mem[0000000010181410] = 000000ff, %l2 = 0000000000000004
	ldswa	[%i6+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141408] = 47010000, %f7  = ffc7218b
	lda	[%i5+%o4]0x81,%f7 	! %f7 = 47010000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000030081410] = 0000000000000000
	stxa	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000000000ff

p0_label_182:
!	Mem[0000000030181400] = 000000ff, %l6 = 0000000000005d04
	ldstuba	[%i6+%g0]0x89,%l6	! %l6 = 000000ff000000ff
!	%f4  = ff000003, Mem[0000000030141408] = 47010000
	sta	%f4 ,[%i5+%o4]0x81	! Mem[0000000030141408] = ff000003
!	%l6 = 00000000000000ff, Mem[0000000030181400] = 000000ff
	stwa	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff
!	%l1 = 00000000000000ff, Mem[0000000030101408] = 000000f2
	stwa	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000ff
!	%l1 = 00000000000000ff, Mem[0000000030081410] = 00000000
	stba	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff
!	%l5 = 0000000000000000, Mem[0000000021800140] = ff23cf8d, %asi = 80
	stha	%l5,[%o3+0x140]%asi	! Mem[0000000021800140] = 0000cf8d
!	%l5 = 0000000000000000, Mem[0000000010041408] = 00000000
	stba	%l5,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	%l4 = 00000000ff0000ff, Mem[00000000300c1410] = 41d4ffff0000ffc7
	stxa	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000ff0000ff
!	%l6 = 00000000000000ff, Mem[00000000100c1408] = 00000000
	stba	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff000000
!	Starting 10 instruction Load Burst
!	%f0  = f20300ff, %f4  = ff000003, %f17 = 34000000
	fmuls	%f0 ,%f4 ,%f17		! %f17 = 7f800000

p0_label_183:
!	Mem[00000000100c1400] = 00000000, %l5 = 0000000000000000
	lduha	[%i3+%g0]0x88,%l5	! %l5 = 0000000000000000
!	%l5 = 0000000000000000, %l6 = 00000000000000ff, %l0 = 0000000000000000
	andn	%l5,%l6,%l0		! %l0 = 0000000000000000
!	Mem[0000000021800180] = 00ff6a7f, %l4 = 00000000ff0000ff
	ldub	[%o3+0x181],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030101410] = ff000003, %l6 = 00000000000000ff
	ldswa	[%i4+%o5]0x81,%l6	! %l6 = ffffffffff000003
!	Mem[0000000010001410] = 000000ff, %l2 = 00000000000000ff
	ldswa	[%i0+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1410] = ff0000ff, %f30 = ffffffff
	lda	[%i3+%o5]0x81,%f30	! %f30 = ff0000ff
!	Mem[000000001018142c] = 8fb2181f, %l1 = 00000000000000ff
	lduw	[%i6+0x02c],%l1		! %l1 = 000000008fb2181f
!	Mem[0000000010081404] = 00000000, %l4 = 00000000000000ff
	lduwa	[%i2+0x004]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000021800100] = ff900b85, %l0 = 0000000000000000
	lduha	[%o3+0x100]%asi,%l0	! %l0 = 000000000000ff90
!	Starting 10 instruction Store Burst
!	%f0  = f20300ff 00000000, Mem[0000000010101408] = 04000000 00000000
	stda	%f0 ,[%i4+0x008]%asi	! Mem[0000000010101408] = f20300ff 00000000

p0_label_184:
!	%f0  = f20300ff 00000000, Mem[0000000030081408] = f2ffffff f2000000
	stda	%f0 ,[%i2+%o4]0x89	! Mem[0000000030081408] = f20300ff 00000000
!	Mem[0000000030141410] = fffffff2, %l4 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l4	! %l4 = 00000000fffffff2
!	Mem[0000000030041408] = ff00f2ff, %l2 = 00000000000000ff
	swapa	[%i1+%o4]0x89,%l2	! %l2 = 00000000ff00f2ff
!	Mem[0000000010081400] = ffff0ddb, %l6 = ffffffffff000003
	ldstuba	[%i2+%g0]0x80,%l6	! %l6 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000010181430] = 10659a95
	stw	%l3,[%i6+0x030]		! Mem[0000000010181430] = 000000ff
!	%l7 = 00000000000000c7, Mem[0000000010001430] = 21000000
	stw	%l7,[%i0+0x030]		! Mem[0000000010001430] = 000000c7
!	%f16 = 000000f2 7f800000 000000ff 000000ff
!	%f20 = 045db224 000000ff ffff0ddb 00000000
!	%f24 = 03f2ff00 cd659a95 7ffb8e61 7b68038d
!	%f28 = 00000000 00000000 ff0000ff ffb27b5a
	stda	%f16,[%i4]ASI_BLK_S	! Block Store to 0000000030101400
!	Mem[0000000010041404] = ff000000, %l2 = 00000000ff00f2ff
	swap	[%i1+0x004],%l2		! %l2 = 00000000ff000000
!	Mem[0000000030181400] = ff000000, %l6 = 00000000000000ff
	swapa	[%i6+%g0]0x81,%l6	! %l6 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ff000000 ff000000, %l0 = 0000ff90, %l1 = 8fb2181f
	ldda	[%i5+%g0]0x81,%l0	! %l0 = 00000000ff000000 00000000ff000000

p0_label_185:
	membar	#Sync			! Added by membar checker (35)
!	Mem[0000000010101408] = ff0003f2, %l5 = 0000000000000000
	lduwa	[%i4+%o4]0x88,%l5	! %l5 = 00000000ff0003f2
!	Code Fragment 3
p0_fragment_17:
!	%l0 = 00000000ff000000
	setx	0x6583c85f8dd025a6,%g7,%l0 ! %l0 = 6583c85f8dd025a6
!	%l1 = 00000000ff000000
	setx	0x915a4350585086a3,%g7,%l1 ! %l1 = 915a4350585086a3
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 6583c85f8dd025a6
	setx	0xf0d4ac2825d2de4b,%g7,%l0 ! %l0 = f0d4ac2825d2de4b
!	%l1 = 915a4350585086a3
	setx	0x39b86c6fae46747d,%g7,%l1 ! %l1 = 39b86c6fae46747d
!	Mem[0000000010181408] = 000065cd00ff0000, %l2 = 00000000ff000000
	ldxa	[%i6+%o4]0x88,%l2	! %l2 = 000065cd00ff0000
!	Mem[0000000030181400] = 000000ff, %l2 = 000065cd00ff0000
	lduwa	[%i6+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101400] = 000000ff, %l2 = 00000000000000ff
	ldsba	[%i4+%g0]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000300c1410] = ff0000ff, %l0 = f0d4ac2825d2de4b
	lduha	[%i3+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081408] = 000000ff, %l4 = 00000000fffffff2
	lduwa	[%i2+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081430] = 00000000 d138ff74, %l4 = 000000ff, %l5 = ff0003f2
	ldd	[%i2+0x030],%l4		! %l4 = 0000000000000000 00000000d138ff74
!	Mem[0000000030041408] = ff000000, %l3 = 00000000000000ff
	ldswa	[%i1+%o4]0x81,%l3	! %l3 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	%f30 = ff0000ff ffb27b5a, Mem[0000000030081400] = 000000ff 00000000
	stda	%f30,[%i2+%g0]0x89	! Mem[0000000030081400] = ff0000ff ffb27b5a

p0_label_186:
!	%f22 = ffff0ddb 00000000, %l5 = 00000000d138ff74
!	Mem[0000000030141410] = 0000000000001f9d
	add	%i5,0x010,%g1
	stda	%f22,[%g1+%l5]ASI_PST16_SL ! Mem[0000000030141410] = 00000000db0d1f9d
!	Mem[0000000010041408] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i1+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000030041408] = 000000ff
	stba	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	%l6 = 00000000ff000000, Mem[0000000030141408] = 030000ff
	stba	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 03000000
!	%l6 = 00000000ff000000, Mem[0000000010141408] = 07000000
	stha	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 07000000
!	%l2 = ffffffffffffffff, Mem[0000000010081430] = 00000000d138ff74
	stx	%l2,[%i2+0x030]		! Mem[0000000010081430] = ffffffffffffffff
!	Mem[0000000010001418] = 00000003, %l1 = 39b86c6fae46747d, %asi = 80
	swapa	[%i0+0x018]%asi,%l1	! %l1 = 0000000000000003
!	Mem[0000000010181400] = 0000005f, %l3 = ffffffffff000000
	ldstuba	[%i6+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	%l1 = 0000000000000003, %l5 = 00000000d138ff74, %l2 = ffffffffffffffff
	addc	%l1,%l5,%l2		! %l2 = 00000000d138ff77
!	Starting 10 instruction Load Burst
!	Mem[0000000010181428] = 0000ffc88fb2181f, %f22 = ffff0ddb 00000000
	ldda	[%i6+0x028]%asi,%f22	! %f22 = 0000ffc8 8fb2181f

p0_label_187:
!	Mem[0000000030001400] = 04000000 000000ff, %l0 = 000000ff, %l1 = 00000003
	ldda	[%i0+%g0]0x81,%l0	! %l0 = 0000000004000000 00000000000000ff
!	Mem[00000000100c1408] = 00000000000000ff, %l2 = 00000000d138ff77
	ldxa	[%i3+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041410] = 00005d04, %l1 = 00000000000000ff
	lduwa	[%i1+%o5]0x81,%l1	! %l1 = 0000000000005d04
!	Mem[0000000030041408] = 00000000, %l3 = 0000000000000000
	ldsha	[%i1+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141408] = 00000003, %l6 = 00000000ff000000
	lduba	[%i5+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l7 = 00000000000000c7
	ldswa	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101408] = f20300ff 00000000, %l0 = 04000000, %l1 = 00005d04
	ldda	[%i4+%o4]0x80,%l0	! %l0 = 00000000f20300ff 0000000000000000
!	Mem[0000000030141408] = 03000000, %l2 = 00000000000000ff
	ldsba	[%i5+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081400] = 00000000 db0dffff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 00000000db0dffff 0000000000000000
!	Starting 10 instruction Store Burst
!	%f28 = 00000000, Mem[0000000030101400] = 000000f2
	sta	%f28,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000

p0_label_188:
!	Mem[0000000010101408] = f20300ff, %l1 = 0000000000000000
	ldstuba	[%i4+%o4]0x80,%l1	! %l1 = 000000f2000000ff
!	%l2 = db0dffff, %l3 = 00000000, Mem[0000000010101400] = ff000000 000000ff
	stda	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = db0dffff 00000000
!	Mem[0000000030081400] = ffb27b5a, %l7 = 0000000000000000
	ldstuba	[%i2+%g0]0x89,%l7	! %l7 = 0000005a000000ff
!	%l0 = 00000000f20300ff, Mem[0000000010101400] = db0dffff
	stba	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = ff0dffff
!	%l4 = 00000000, %l5 = d138ff74, Mem[0000000010081408] = ff000000 ff000000
	stda	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000 d138ff74
!	Mem[0000000010001414] = 5fff7b5a, %l6 = 0000000000000000, %asi = 80
	swapa	[%i0+0x014]%asi,%l6	! %l6 = 000000005fff7b5a
!	Mem[0000000030081410] = 000000ff, %l0 = 00000000f20300ff
	swapa	[%i2+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%l5 = 00000000d138ff74, Mem[00000000300c1410] = ff0000ff
	stba	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 740000ff
!	Mem[0000000030081408] = 00000000, %l2 = 00000000db0dffff
	swapa	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000021800040] = 009dd078, %l7 = 000000000000005a
	ldsb	[%o3+0x040],%l7		! %l7 = 0000000000000000

p0_label_189:
!	Mem[0000000030041400] = 000000ff, %l5 = 00000000d138ff74
	ldsba	[%i1+%g0]0x89,%l5	! %l5 = ffffffffffffffff
!	%l7 = 0000000000000000, imm = 000000000000003c, %l6 = 000000005fff7b5a
	addc	%l7,0x03c,%l6		! %l6 = 000000000000003c
!	Mem[0000000030101400] = 00000000, %l3 = 0000000000000000
	lduwa	[%i4+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081430] = ffffffffffffffff, %f2  = 00000000 00000000
	ldd	[%i2+0x030],%f2 	! %f2  = ffffffff ffffffff
!	Mem[00000000100c1408] = ff00000000000000, %f4  = ff000003 00001f9d
	ldda	[%i3+%o4]0x80,%f4 	! %f4  = ff000000 00000000
!	Mem[00000000300c1408] = ff000000 c6ffffff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i3+%o4]0x89,%l2	! %l2 = 00000000c6ffffff 00000000ff000000
!	Mem[0000000030041400] = ff000000, %l6 = 000000000000003c
	lduha	[%i1+%g0]0x81,%l6	! %l6 = 000000000000ff00
!	%l2 = 00000000c6ffffff, %l7 = 0000000000000000, %l2 = 00000000c6ffffff
	andn	%l2,%l7,%l2		! %l2 = 00000000c6ffffff
!	Mem[0000000010001400] = ff0000ff, %l5 = ffffffffffffffff
	lduwa	[%i0+%g0]0x80,%l5	! %l5 = 00000000ff0000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 000000ff, %l0 = 00000000000000ff
	swapa	[%i4+%o4]0x81,%l0	! %l0 = 00000000000000ff

p0_label_190:
!	%f10 = ff000000 ff00ff04, Mem[0000000010141400] = 000000f2 000000ff
	stda	%f10,[%i5+%g0]0x88	! Mem[0000000010141400] = ff000000 ff00ff04
!	%f26 = 7ffb8e61 7b68038d, Mem[0000000010001410] = ff000000 00000000
	stda	%f26,[%i0+0x010]%asi	! Mem[0000000010001410] = 7ffb8e61 7b68038d
!	%f26 = 7ffb8e61, Mem[0000000010041410] = 00000000
	sta	%f26,[%i1+%o5]0x88	! Mem[0000000010041410] = 7ffb8e61
!	Mem[0000000030041408] = 00000000, %l1 = 00000000000000f2
	swapa	[%i1+%o4]0x81,%l1	! %l1 = 0000000000000000
!	%f18 = 000000ff 000000ff, %l1 = 0000000000000000
!	Mem[0000000030181430] = 00000000000000ff
	add	%i6,0x030,%g1
	stda	%f18,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030181430] = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010081410] = ff000000
	stwa	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	%l7 = 0000000000000000, Mem[0000000010141414] = ff000000
	stw	%l7,[%i5+0x014]		! Mem[0000000010141414] = 00000000
!	%f11 = ff00ff04, %f12 = ff000000, %f18 = 000000ff
	fmuls	%f11,%f12,%f18		! %f18 = 7f800000
!	%f14 = 000000ff, Mem[00000000100c1408] = 000000ff
	sta	%f14,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001424] = 9d1f0000, %l0 = 00000000000000ff
	lduba	[%i0+0x024]%asi,%l0	! %l0 = 000000000000009d

p0_label_191:
!	Mem[0000000030001410] = 040000ff, %l6 = 000000000000ff00
	ldsha	[%i0+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001438] = ff800000 ff000000, %l4 = 00000000, %l5 = ff0000ff
	ldd	[%i0+0x038],%l4		! %l4 = 00000000ff800000 00000000ff000000
!	Mem[0000000030001410] = 040000ff, %f20 = 045db224
	lda	[%i0+%o5]0x89,%f20	! %f20 = 040000ff
!	Mem[0000000010101408] = 00000000ff0003ff, %f10 = ff000000 ff00ff04
	ldda	[%i4+%o4]0x88,%f10	! %f10 = 00000000 ff0003ff
!	Mem[00000000218000c0] = ff005cf4, %l6 = 00000000000000ff
	ldub	[%o3+0x0c1],%l6		! %l6 = 0000000000000000
!	Mem[00000000100c1408] = ff000000 00000000, %l0 = 0000009d, %l1 = 00000000
	ldda	[%i3+0x008]%asi,%l0	! %l0 = 00000000ff000000 0000000000000000
!	Mem[0000000030141410] = 00000000db0d1f9d, %f24 = 03f2ff00 cd659a95
	ldda	[%i5+%o5]0x81,%f24	! %f24 = 00000000 db0d1f9d
!	Mem[0000000010081408] = 00000000, %l0 = 00000000ff000000
	lduba	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041420] = 387dff53, %l5 = 00000000ff000000
	lduw	[%i1+0x020],%l5		! %l5 = 00000000387dff53
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = ff0dffff, %l5 = 00000000387dff53
	swapa	[%i4+%g0]0x80,%l5	! %l5 = 00000000ff0dffff

p0_label_192:
!	%f29 = 00000000, %f0  = f20300ff, %f24 = 00000000 db0d1f9d
	fsmuld	%f29,%f0 ,%f24		! %f24 = 80000000 00000000
!	Mem[0000000030141408] = 00000003, %l5 = 00000000ff0dffff
	swapa	[%i5+%o4]0x81,%l5	! %l5 = 0000000000000003
!	%f10 = 00000000 ff0003ff, Mem[0000000030001400] = 00000004 ff000000
	stda	%f10,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 ff0003ff
!	Mem[00000000100c1408] = ff000000, %l7 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l7	! %l7 = 00000000ff000000
!	%l0 = 0000000000000000, Mem[0000000030141410] = 00000000
	stba	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	%f10 = 00000000 ff0003ff, %l7 = 00000000ff000000
!	Mem[0000000030181418] = 83cf7f40ff18b28f
	add	%i6,0x018,%g1
	stda	%f10,[%g1+%l7]ASI_PST32_S ! Mem[0000000030181418] = 83cf7f40ff18b28f
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010041420] = 387dff53 c6a7ffba
	std	%l0,[%i1+0x020]		! Mem[0000000010041420] = 00000000 00000000
!	%l0 = 0000000000000000, Mem[0000000010141410] = 0000000000000000
	stxa	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000000000
!	Mem[0000000030141400] = 000000ff, %l5 = 0000000000000003
	swapa	[%i5+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001424] = 9d1f0000, %l4 = 00000000ff800000
	lduwa	[%i0+0x024]%asi,%l4	! %l4 = 000000009d1f0000

p0_label_193:
!	Mem[0000000010081408] = 00000000, %l6 = 0000000000000000
	lduwa	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = 7ffb8e61, %l0 = 0000000000000000
	ldswa	[%i0+%o5]0x80,%l0	! %l0 = 000000007ffb8e61
!	Mem[00000000300c1408] = ffffffc6 000000ff, %l0 = 7ffb8e61, %l1 = 00000000
	ldda	[%i3+%o4]0x81,%l0	! %l0 = 00000000ffffffc6 00000000000000ff
!	Mem[0000000020800040] = 0000c0bd, %l4 = 000000009d1f0000
	ldsba	[%o1+0x041]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141428] = 7ffb8e61 7b68038d, %l0 = ffffffc6, %l1 = 000000ff
	ldd	[%i5+0x028],%l0		! %l0 = 000000007ffb8e61 000000007b68038d
!	Mem[0000000010001410] = 618efb7f, %l6 = 0000000000000000
	lduba	[%i0+%o5]0x88,%l6	! %l6 = 000000000000007f
!	Mem[0000000030141408] = ffff0dff, %l1 = 000000007b68038d
	ldsba	[%i5+%o4]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[000000001004141c] = 0000f1c8, %l2 = 00000000c6ffffff
	lduwa	[%i1+0x01c]%asi,%l2	! %l2 = 000000000000f1c8
!	Mem[00000000218000c0] = ff005cf4, %l6 = 000000000000007f
	ldsh	[%o3+0x0c0],%l6		! %l6 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = ff000000, %l3 = 00000000ff000000
	lduwa	[%i4+%o5]0x80,%l3	! %l3 = 00000000ff000000

p0_label_194:
!	Mem[00000000100c1410] = 00000004, %l5 = 00000000000000ff
	ldstuba	[%i3+%o5]0x88,%l5	! %l5 = 00000004000000ff
!	%f20 = 040000ff, %f24 = 80000000
	fcmps	%fcc3,%f20,%f24		! %fcc3 = 2
!	%l0 = 000000007ffb8e61, Mem[00000000201c0000] = ffff8ea0, %asi = 80
	stba	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = 61ff8ea0
!	%f6  = 00001f9d 47010000, Mem[0000000030181400] = ff000000 9d000000
	stda	%f6 ,[%i6+%g0]0x89	! Mem[0000000030181400] = 00001f9d 47010000
!	Mem[0000000010081408] = 00000000, %l1 = ffffffffffffffff
	ldstuba	[%i2+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	%l0 = 000000007ffb8e61, Mem[0000000030181410] = 15000000
	stha	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 8e610000
!	%l1 = 0000000000000000, Mem[00000000211c0001] = 00003487
	stb	%l1,[%o2+0x001]		! Mem[00000000211c0000] = 00003487
!	%f18 = 7f800000, Mem[0000000010141408] = 07000000
	sta	%f18,[%i5+%o4]0x88	! Mem[0000000010141408] = 7f800000
!	%l2 = 0000f1c8, %l3 = ff000000, Mem[0000000010181408] = 00ff0000 000065cd
	stda	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000f1c8 ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ff000000, %f3  = ffffffff
	lda	[%i3+%o5]0x80,%f3 	! %f3 = ff000000

p0_label_195:
!	Mem[0000000010041418] = 000000ff 0000f1c8, %l2 = 0000f1c8, %l3 = ff000000
	ldd	[%i1+0x018],%l2		! %l2 = 00000000000000ff 000000000000f1c8
!	Mem[000000001008143c] = 000000ff, %l2 = 00000000000000ff
	ldsb	[%i2+0x03e],%l2		! %l2 = 0000000000000000
!	Mem[0000000010001408] = 000000ff, %l2 = 0000000000000000
	lduba	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001430] = 000000c7000000ff, %f22 = 0000ffc8 8fb2181f
	ldda	[%i0+0x030]%asi,%f22	! %f22 = 000000c7 000000ff
!	Mem[0000000010081400] = ffff0ddb 00000000, %l4 = 00000000, %l5 = 00000004
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 00000000ffff0ddb 0000000000000000
!	%l7 = 00000000ff000000, %l6 = ffffffffffffff00, %y  = 00000000
	smul	%l7,%l6,%l0		! %l0 = 0000000100000000, %y = 00000001
!	Mem[0000000030181400] = 000001479d1f0000, %l6 = ffffffffffffff00
	ldxa	[%i6+%g0]0x81,%l6	! %l6 = 000001479d1f0000
!	Mem[0000000010181438] = ffffffff, %l3 = 000000000000f1c8
	ldswa	[%i6+0x038]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030181408] = 00000000, %l7 = 00000000ff000000
	ldsba	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l2	! %l2 = 000000ff000000ff

p0_label_196:
!	Mem[0000000030181408] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[00000000201c0001] = 61ff8ea0, %l2 = 00000000000000ff
	ldstub	[%o0+0x001],%l2		! %l2 = 000000ff000000ff
!	Mem[0000000030041408] = 000000f2, %l0 = 0000000100000000
	ldstuba	[%i1+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	%l3 = ffffffffffffffff, Mem[0000000030081400] = ff7bb2ff
	stha	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffb2ff
!	%l2 = 000000ff, %l3 = ffffffff, Mem[0000000010041430] = 00000000 ff5d0024
	std	%l2,[%i1+0x030]		! Mem[0000000010041430] = 000000ff ffffffff
!	Mem[0000000010001410] = 7ffb8e61, %l6 = 000001479d1f0000
	swapa	[%i0+%o5]0x80,%l6	! %l6 = 000000007ffb8e61
!	%f26 = 7ffb8e61 7b68038d, Mem[0000000010101400] = 53ff7d38 00000000
	stda	%f26,[%i4+%g0]0x88	! Mem[0000000010101400] = 7ffb8e61 7b68038d
!	%l3 = ffffffffffffffff, imm = 00000000000005d5, %l3 = ffffffffffffffff
	orn	%l3,0x5d5,%l3		! %l3 = ffffffffffffffff
!	%l1 = 0000000000000000, Mem[00000000211c0000] = 00003487
	stb	%l1,[%o2+%g0]		! Mem[00000000211c0000] = 00003487
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ff000000 0000f1c8, %l4 = ffff0ddb, %l5 = 00000000
	ldda	[%i6+%o4]0x88,%l4	! %l4 = 000000000000f1c8 00000000ff000000

p0_label_197:
!	Mem[0000000010101410] = ff000000, %l2 = 00000000000000ff
	lduha	[%i4+%o5]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010181418] = 8d039cf3, %l7 = 0000000000000000
	lduwa	[%i6+0x018]%asi,%l7	! %l7 = 000000008d039cf3
!	Mem[0000000030141400] = 03000000, %l0 = 0000000000000000
	lduha	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000300
!	Mem[0000000030041410] = 045d0000, %l3 = ffffffffffffffff
	lduwa	[%i1+%o5]0x89,%l3	! %l3 = 00000000045d0000
!	Mem[00000000300c1408] = c6ffffff, %l7 = 000000008d039cf3
	ldswa	[%i3+%o4]0x89,%l7	! %l7 = ffffffffc6ffffff
!	Mem[0000000030181400] = 47010000, %l1 = 0000000000000000
	lduwa	[%i6+%g0]0x89,%l1	! %l1 = 0000000047010000
!	Mem[0000000030081400] = ff0000ffffb2ffff, %f28 = 00000000 00000000
	ldda	[%i2+%g0]0x89,%f28	! %f28 = ff0000ff ffb2ffff
!	Mem[0000000030041400] = 41d4ffff 000000ff, %l4 = 0000f1c8, %l5 = ff000000
	ldda	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff 0000000041d4ffff
!	Mem[0000000010101400] = 7b68038d, %f7  = 47010000
	lda	[%i4+%g0]0x88,%f7 	! %f7 = 7b68038d
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 04ff00ff, %l5 = 0000000041d4ffff
	swapa	[%i5+%g0]0x80,%l5	! %l5 = 0000000004ff00ff

p0_label_198:
!	%f31 = ffb27b5a, Mem[0000000030001410] = 040000ff
	sta	%f31,[%i0+%o5]0x89	! Mem[0000000030001410] = ffb27b5a
!	%l7 = ffffffffc6ffffff, Mem[0000000010001410] = 00001f9d
	stwa	%l7,[%i0+%o5]0x88	! Mem[0000000010001410] = c6ffffff
!	%l0 = 0000000000000300, Mem[0000000010041408] = 000000ff
	stba	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	Mem[00000000300c1408] = c6ffffff, %l3 = 00000000045d0000
	ldstuba	[%i3+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000030081400] = ffffb2ff
	stwa	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000ff
!	%l2 = 000000000000ff00, Mem[0000000010081411] = 00000000
	stb	%l2,[%i2+0x011]		! Mem[0000000010081410] = 00000000
!	%l0 = 00000300, %l1 = 47010000, Mem[0000000010101400] = 8d03687b 618efb7f
	stda	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000300 47010000
!	%l1 = 0000000047010000, Mem[0000000010001420] = 000000809d1f0000, %asi = 80
	stxa	%l1,[%i0+0x020]%asi	! Mem[0000000010001420] = 0000000047010000
!	%l5 = 0000000004ff00ff, Mem[0000000010081435] = ffffffff
	stb	%l5,[%i2+0x035]		! Mem[0000000010081434] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = db0dffff, %l2 = 000000000000ff00
	lduwa	[%i2+%g0]0x88,%l2	! %l2 = 00000000db0dffff

p0_label_199:
!	Mem[00000000100c1408] = 00000000, %l2 = 00000000db0dffff
	lduwa	[%i3+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1434] = 00000021, %l1 = 0000000047010000
	ldub	[%i3+0x036],%l1		! %l1 = 0000000000000000
!	Mem[0000000030041408] = f20000ff, %l7 = ffffffffc6ffffff
	lduha	[%i1+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141408] = ffff0dff, %l6 = 000000007ffb8e61
	lduwa	[%i5+%o4]0x89,%l6	! %l6 = 00000000ffff0dff
!	Mem[00000000211c0000] = 00003487, %l5 = 0000000004ff00ff
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101408] = ff0300ff, %l4 = 00000000000000ff
	ldsha	[%i4+%o4]0x80,%l4	! %l4 = ffffffffffffff03
!	Mem[0000000021800140] = 0000cf8d, %l1 = 0000000000000000
	lduh	[%o3+0x140],%l1		! %l1 = 0000000000000000
!	Mem[00000000211c0000] = 00003487, %l1 = 0000000000000000
	ldub	[%o2+%g0],%l1		! %l1 = 0000000000000000
!	Mem[0000000010041410] = 618efb7f 8763f2ff, %l4 = ffffff03, %l5 = 00000000
	ldda	[%i1+%o5]0x80,%l4	! %l4 = 00000000618efb7f 000000008763f2ff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000030181408] = 000000ff ff000000
	stda	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 000000ff

p0_label_200:
!	%l4 = 00000000618efb7f, Mem[00000000100c1434] = 00000021
	sth	%l4,[%i3+0x034]		! Mem[00000000100c1434] = fb7f0021
!	%l1 = 0000000000000000, Mem[0000000010141408] = 7f800000
	stba	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 7f800000
!	Mem[0000000030081408] = db0dffff, %l5 = 000000008763f2ff
	swapa	[%i2+%o4]0x89,%l5	! %l5 = 00000000db0dffff
!	Mem[0000000010001410] = c6ffffff, %l3 = 00000000000000ff
	swapa	[%i0+%o5]0x88,%l3	! %l3 = 00000000c6ffffff
!	%l4 = 618efb7f, %l5 = db0dffff, Mem[0000000010101410] = ff000000 ff000000
	std	%l4,[%i4+%o5]		! Mem[0000000010101410] = 618efb7f db0dffff
!	%f23 = 000000ff, Mem[0000000030041408] = ff0000f2
	sta	%f23,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000ff
!	%l4 = 00000000618efb7f, Mem[0000000010001408] = 000000ff
	stwa	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 618efb7f
!	Mem[0000000030081400] = 000000ff, %l0 = 0000000000000300
	swapa	[%i2+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	%f29 = ffb2ffff, Mem[0000000010181400] = 5f0000ff
	sta	%f29,[%i6+%g0]0x88	! Mem[0000000010181400] = ffb2ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000300, %l3 = 00000000c6ffffff
	lduba	[%i2+%g0]0x81,%l3	! %l3 = 0000000000000000

p0_label_201:
	membar	#Sync			! Added by membar checker (36)
!	Mem[0000000010141400] = 41d4ffff 000000ff 0000807f 000000ff
!	Mem[0000000010141410] = 00000000 00000000 000000ff ff000004
!	Mem[0000000010141420] = 03f2ff00 00000000 7ffb8e61 7b68038d
!	Mem[0000000010141430] = 21000000 5fb27b5a ffffffff ffb2ff5a
	ldda	[%i5]ASI_BLK_P,%f16	! Block Load from 0000000010141400
!	%l6 = 00000000ffff0dff, immd = 0000000000000506, %l7  = 00000000000000ff
	mulx	%l6,0x506,%l7		! %l7 = 00000505fb404efa
!	Mem[00000000211c0000] = 00003487, %l1 = 0000000000000000
	ldub	[%o2+0x001],%l1		! %l1 = 0000000000000000
!	Mem[0000000010101408] = ff0300ff00000000, %l3 = 0000000000000000
	ldxa	[%i4+0x008]%asi,%l3	! %l3 = ff0300ff00000000
!	Mem[0000000020800000] = ffff4ebd, %l6 = 00000000ffff0dff
	ldsha	[%o1+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010141438] = ffffffff, %l1 = 0000000000000000
	ldsba	[%i5+0x039]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000020800000] = ffff4ebd, %l2 = 0000000000000000
	ldsh	[%o1+%g0],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010101410] = 618efb7fdb0dffff, %f0  = f20300ff 00000000
	ldd	[%i4+%o5],%f0 		! %f0  = 618efb7f db0dffff
!	Mem[0000000030181408] = 00000000, %l0 = 00000000000000ff
	ldsha	[%i6+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = 000000f2, %l3 = 00000000, %l4 = 618efb7f
	casa	[%i1]0x80,%l3,%l4	! %l4 = 00000000000000f2

p0_label_202:
!	%l6 = ffffffffffffffff, Mem[0000000010041408] = 0000000000000000
	stxa	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffffffffffffff
!	%f15 = 000080ff, Mem[0000000010181408] = c8f10000
	sta	%f15,[%i6+0x008]%asi	! Mem[0000000010181408] = 000080ff
!	%l6 = ffffffff, %l7 = fb404efa, Mem[0000000030001400] = ff0003ff 00000000
	stda	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffffff fb404efa
!	%f8  = f2000000, %f0  = 618efb7f, %f8  = f2000000
	fmuls	%f8 ,%f0 ,%f8 		! %f8  = ff800000
!	%l5 = 00000000db0dffff, Mem[0000000010081408] = 000000ff
	stwa	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = db0dffff
	membar	#Sync			! Added by membar checker (37)
!	%l4 = 00000000000000f2, Mem[0000000010141408] = 7f800000
	stha	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 7f8000f2
!	%l3 = ff0300ff00000000, Mem[0000000010041400] = 000000f2
	stha	%l3,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000f2
!	%l2 = ffffffffffffffff, immed = 00000bc7, %y  = 00000001
	smul	%l2,0xbc7,%l2		! %l2 = fffffffffffff439, %y = ffffffff
!	%f20 = 00000000, Mem[0000000030041408] = ff000000
	sta	%f20,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 8e610000ffffd441, %l6 = ffffffffffffffff
	ldxa	[%i6+%o5]0x81,%l6	! %l6 = 8e610000ffffd441

p0_label_203:
!	Mem[00000000300c1400] = 00001f9d, %l6 = 8e610000ffffd441
	lduha	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001414] = 7b68038d, %l4 = 00000000000000f2
	lduha	[%i0+0x014]%asi,%l4	! %l4 = 0000000000007b68
!	Mem[0000000010001408] = 618efb7f, %l7 = 00000505fb404efa
	lduha	[%i0+%o4]0x80,%l7	! %l7 = 000000000000618e
!	Mem[0000000021800000] = 46ff133c, %l1 = ffffffffffffffff
	ldsha	[%o3+0x000]%asi,%l1	! %l1 = 00000000000046ff
!	Mem[0000000010181400] = ffffb2ff, %l0 = 0000000000000000
	ldswa	[%i6+%g0]0x80,%l0	! %l0 = ffffffffffffb2ff
!	Mem[00000000100c1410] = 9d1f0000 000000ff, %l6 = 00000000, %l7 = 0000618e
	ldda	[%i3+%o5]0x88,%l6	! %l6 = 00000000000000ff 000000009d1f0000
!	Mem[0000000010101408] = ff0300ff, %f13 = 00000021
	ld	[%i4+%o4],%f13	! %f13 = ff0300ff
!	Mem[0000000010081400] = db0dffff, %l4 = 0000000000007b68
	lduba	[%i2+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141400] = 03000000, %l4 = 00000000000000ff
	ldsba	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000003
!	Starting 10 instruction Store Burst
!	%l3 = ff0300ff00000000, Mem[000000001018141a] = 8d039cf3, %asi = 80
	stha	%l3,[%i6+0x01a]%asi	! Mem[0000000010181418] = 8d030000

p0_label_204:
!	%l0 = ffffffffffffb2ff, Mem[0000000030041400] = 000000ff
	stwa	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffb2ff
!	%f24 = 03f2ff00, Mem[00000000100c1410] = 000000ff
	sta	%f24,[%i3+%o5]0x88	! Mem[00000000100c1410] = 03f2ff00
!	Mem[0000000010081430] = ffffffffffffffff, %l7 = 000000009d1f0000, %l2 = fffffffffffff439
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l7,%l2	! %l2 = ffffffffffffffff
!	%l4 = 0000000000000003, Mem[0000000030141400] = 03000000
	stba	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 03000000
!	%l4 = 0000000000000003, Mem[00000000100c1400] = 0000000000000000
	stxa	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000000000000003
!	%l4 = 0000000000000003, Mem[0000000030001408] = ff000000
	stha	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 00030000
!	%l6 = 00000000000000ff, Mem[0000000010181410] = ff000000
	stb	%l6,[%i6+%o5]		! Mem[0000000010181410] = ff000000
!	%f6  = 00001f9d 7b68038d, %l7 = 000000009d1f0000
!	Mem[00000000100c1428] = ff0000ffff00ff04
	add	%i3,0x028,%g1
	stda	%f6,[%g1+%l7]ASI_PST32_PL ! Mem[00000000100c1428] = ff0000ffff00ff04
!	Mem[0000000010181410] = ff000000, %l5 = 00000000db0dffff
	swapa	[%i6+%o5]0x80,%l5	! %l5 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff0300ff, %l7 = 000000009d1f0000
	ldswa	[%i4+%o4]0x80,%l7	! %l7 = ffffffffff0300ff

p0_label_205:
!	Mem[0000000010041400] = 000000f2, %l1 = 00000000000046ff
	lduwa	[%i1+%g0]0x80,%l1	! %l1 = 00000000000000f2
!	Mem[00000000100c1408] = 0000000000000000, %l3 = ff0300ff00000000
	ldxa	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = ffffffff, %l0 = ffffffffffffb2ff
	ldsba	[%i1+0x00a]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030101400] = 00000000, %l7 = ffffffffff0300ff
	lduba	[%i4+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000211c0000] = 00003487, %l0 = ffffffffffffffff
	ldsh	[%o2+%g0],%l0		! %l0 = 0000000000000000
!	Mem[0000000030001408] = 00000300, %l5 = 00000000ff000000
	lduha	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000300
!	Mem[0000000010001408] = 618efb7f5a7bff5f, %l0 = 0000000000000000
	ldxa	[%i0+%o4]0x80,%l0	! %l0 = 618efb7f5a7bff5f
!	Mem[0000000010181408] = 000080ff, %l6 = 00000000000000ff
	ldsha	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000000
!	%l3 = 0000000000000000, %l0 = 618efb7f5a7bff5f, %l1  = 00000000000000f2
	mulx	%l3,%l0,%l1		! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 00000147, %l7 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l7	! %l7 = 0000000000000147

p0_label_206:
!	%l7 = 0000000000000147, Mem[000000001008142b] = 26ea8ca9
	stb	%l7,[%i2+0x02b]		! Mem[0000000010081428] = 26ea8c47
!	%l7 = 0000000000000147, Mem[00000000300c1410] = ff000074
	stba	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = ff000047
!	Mem[0000000010181436] = 894141d4, %l7 = 0000000000000147
	ldstub	[%i6+0x036],%l7		! %l7 = 00000041000000ff
!	%l7 = 0000000000000041, immed = 00000aad, %y  = ffffffff
	umul	%l7,0xaad,%l5		! %l5 = 000000000002b5ed, %y = 00000000
!	%l4 = 00000003, %l5 = 0002b5ed, Mem[0000000010101408] = ff0300ff 00000000
	stda	%l4,[%i4+0x008]%asi	! Mem[0000000010101408] = 00000003 0002b5ed
!	Mem[0000000010181430] = 000000ff, %l1 = 0000000000000000
	ldstuba	[%i6+0x030]%asi,%l1	! %l1 = 00000000000000ff
!	%l0 = 618efb7f5a7bff5f, Mem[0000000010141410] = 00000000
	stba	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 5f000000
!	Mem[0000000010081408] = db0dffff, %l2 = ffffffffffffffff
	swapa	[%i2+%o4]0x88,%l2	! %l2 = 00000000db0dffff
!	%l2 = 00000000db0dffff, Mem[00000000211c0000] = 00003487
	sth	%l2,[%o2+%g0]		! Mem[00000000211c0000] = ffff3487
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = 0000cf8d, %l3 = 0000000000000000
	ldsb	[%o3+0x141],%l3		! %l3 = 0000000000000000

p0_label_207:
!	Mem[0000000030081408] = 8763f2ff, %l7 = 0000000000000041
	ldsba	[%i2+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030101408] = ff000000ff000000, %l4 = 0000000000000003
	ldxa	[%i4+%o4]0x89,%l4	! %l4 = ff000000ff000000
!	Mem[0000000010001410] = ff0000007b68038d, %l3 = 0000000000000000
	ldxa	[%i0+%o5]0x80,%l3	! %l3 = ff0000007b68038d
!	Mem[00000000100c1410] = 00fff20300001f9d, %f22 = 000000ff ff000004
	ldda	[%i3+%o5]0x80,%f22	! %f22 = 00fff203 00001f9d
!	Mem[0000000030041410] = 00005d0400001f9d, %l2 = 00000000db0dffff
	ldxa	[%i1+%o5]0x81,%l2	! %l2 = 00005d0400001f9d
!	Mem[0000000030081400] = 00000300, %l6 = 0000000000000000
	ldsha	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141400] = 00000003, %l4 = ff000000ff000000
	lduha	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000003
!	Mem[0000000010001408] = 618efb7f, %l1 = 0000000000000000
	ldswa	[%i0+%o4]0x80,%l1	! %l1 = 00000000618efb7f
!	Mem[0000000010101434] = 00000021, %l1 = 00000000618efb7f
	lduba	[%i4+0x034]%asi,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f20 = 00000000, Mem[0000000030101400] = 00000000
	sta	%f20,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000

p0_label_208:
!	%l1 = 0000000000000000, %l4 = 0000000000000003, %l2 = 00005d0400001f9d
	udivx	%l1,%l4,%l2		! %l2 = 0000000000000000
!	%l4 = 0000000000000003, Mem[0000000010041410] = 618efb7f
	stha	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 0003fb7f
!	Mem[0000000010081408] = ffffffff, %l6 = 0000000000000000
	ldstuba	[%i2+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	%f24 = 03f2ff00, Mem[00000000100c1424] = ff000000
	sta	%f24,[%i3+0x024]%asi	! Mem[00000000100c1424] = 03f2ff00
!	%l2 = 0000000000000000, Mem[0000000030041400] = ffb2ffff
	stba	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 00b2ffff
!	%l1 = 0000000000000000, Mem[0000000010141400] = ffffd441
	stwa	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	%l1 = 0000000000000000, Mem[0000000021800001] = 46ff133c
	stb	%l1,[%o3+0x001]		! Mem[0000000021800000] = 4600133c
!	%f8  = ff800000 ff000000, %l0 = 618efb7f5a7bff5f
!	Mem[0000000010081430] = ffffffffffffffff
	add	%i2,0x030,%g1
	stda	%f8,[%g1+%l0]ASI_PST8_P ! Mem[0000000010081430] = ff80ff00ff000000
!	%l4 = 0000000000000003, immed = 00000801, %y  = 00000000
	sdiv	%l4,0x801,%l2		! %l2 = 0000000000000000
	mov	%l0,%y			! %y = 5a7bff5f
!	Starting 10 instruction Load Burst
!	Mem[0000000010041418] = 000000ff, %l5 = 000000000002b5ed
	ldsh	[%i1+0x018],%l5		! %l5 = 0000000000000000

p0_label_209:
!	Mem[0000000030141408] = ffff0dff, %l0 = 618efb7f5a7bff5f
	ldsha	[%i5+%o4]0x89,%l0	! %l0 = 0000000000000dff
!	Mem[0000000010041408] = ffffffff, %l1 = 0000000000000000
	ldsba	[%i1+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010181408] = ff000000 ff800000, %l0 = 00000dff, %l1 = ffffffff
	ldda	[%i6+%o4]0x88,%l0	! %l0 = 00000000ff800000 00000000ff000000
!	Mem[0000000010181400] = 00000000ffb2ffff, %l3 = ff0000007b68038d
	ldxa	[%i6+%g0]0x88,%l3	! %l3 = 00000000ffb2ffff
!	Mem[0000000010001410] = ff0000007b68038d, %l1 = 00000000ff000000
	ldxa	[%i0+%o5]0x80,%l1	! %l1 = ff0000007b68038d
!	Mem[00000000300c1410] = ff000047, %l5 = 0000000000000000
	lduba	[%i3+%o5]0x89,%l5	! %l5 = 0000000000000047
!	Mem[0000000030081400] = 00000300ff0000ff, %l0 = 00000000ff800000
	ldxa	[%i2+%g0]0x81,%l0	! %l0 = 00000300ff0000ff
!	Mem[0000000030081400] = 00000300, %l7 = ffffffffffffffff
	lduba	[%i2+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181410] = 8e610000ffffd441, %f22 = 00fff203 00001f9d
	ldda	[%i6+%o5]0x81,%f22	! %f22 = 8e610000 ffffd441
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000003, Mem[0000000010141410] = 5f000000
	stwa	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000003

p0_label_210:
!	%l0 = ff0000ff, %l1 = 7b68038d, Mem[0000000030041400] = 00b2ffff ffffd441
	stda	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = ff0000ff 7b68038d
!	%f2  = ffffffff ff000000, Mem[0000000030081408] = fff26387 ff0003f2
	stda	%f2 ,[%i2+%o4]0x81	! Mem[0000000030081408] = ffffffff ff000000
!	%l6 = 00000000000000ff, Mem[0000000010101408] = 03000000
	stba	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 030000ff
!	%f12 = ff000000 ff0300ff, %l5 = 0000000000000047
!	Mem[0000000010081428] = 26ea8c47ab88edb9
	add	%i2,0x028,%g1
	stda	%f12,[%g1+%l5]ASI_PST8_P ! Mem[0000000010081428] = 26008c47ab0300ff
!	%f1  = db0dffff, Mem[0000000030141408] = ff0dffff
	sta	%f1 ,[%i5+%o4]0x81	! Mem[0000000030141408] = db0dffff
!	Mem[0000000010101408] = 030000ff, %l1 = ff0000007b68038d
	ldstuba	[%i4+%o4]0x88,%l1	! %l1 = 000000ff000000ff
!	%f5  = 00000000, Mem[0000000030001400] = ffffffff
	sta	%f5 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	%f16 = 41d4ffff 000000ff, Mem[0000000030081400] = 00030000 ff0000ff
	stda	%f16,[%i2+%g0]0x89	! Mem[0000000030081400] = 41d4ffff 000000ff
!	Mem[0000000021800041] = 009dd078, %l3 = 00000000ffb2ffff
	ldstuba	[%o3+0x041]%asi,%l3	! %l3 = 0000009d000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 045d0000, %l6 = 00000000000000ff
	lduba	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000000

p0_label_211:
!	%f10 = 00000000, Mem[0000000010081410] = 00000000
	sta	%f10,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	Mem[00000000100c1410] = 00fff203, %l1 = 00000000000000ff
	lduba	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = 03000000ff000000, %f18 = 0000807f 000000ff
	ldda	[%i5+%g0]0x81,%f18	! %f18 = 03000000 ff000000
!	Mem[0000000030101400] = 00000000, %f13 = ff0300ff
	lda	[%i4+%g0]0x81,%f13	! %f13 = 00000000
!	%l3 = 000000000000009d, Mem[0000000010181410] = db0dffff
	stba	%l3,[%i6+%o5]0x80	! Mem[0000000010181410] = 9d0dffff
!	Mem[00000000211c0000] = ffff3487, %l2 = 0000000000000000
	ldsb	[%o2+%g0],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010141438] = ffffffff ffb2ff5a, %l0 = ff0000ff, %l1 = 00000000
	ldd	[%i5+0x038],%l0		! %l0 = 00000000ffffffff 00000000ffb2ff5a
!	Mem[00000000100c140c] = 00000000, %l5 = 0000000000000047
	lduh	[%i3+0x00e],%l5		! %l5 = 0000000000000000
!	Mem[00000000300c1400] = 00001f9d, %l2 = ffffffffffffffff
	ldsha	[%i3+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 00000000, %l7 = 0000000000000000
	swapa	[%i1+%o4]0x89,%l7	! %l7 = 0000000000000000

p0_label_212:
!	%f20 = 00000000 00000000, %l2 = 0000000000000000
!	Mem[0000000030101408] = 000000ff000000ff
	add	%i4,0x008,%g1
	stda	%f20,[%g1+%l2]ASI_PST32_SL ! Mem[0000000030101408] = 000000ff000000ff
!	%l0 = 00000000ffffffff, Mem[0000000010081410] = 00000000
	stha	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = ffff0000
!	%l5 = 0000000000000000, Mem[000000001004140b] = ffffffff, %asi = 80
	stba	%l5,[%i1+0x00b]%asi	! Mem[0000000010041408] = ffffff00
!	%l7 = 0000000000000000, Mem[0000000010001408] = 618efb7f
	stha	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000fb7f
!	%f14 = 000000ff 000080ff, Mem[00000000300c1400] = 00001f9d ffc7218b
	stda	%f14,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000ff 000080ff
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010141428] = 7ffb8e61 7b68038d
	stda	%l6,[%i5+0x028]%asi	! Mem[0000000010141428] = 00000000 00000000
!	%l3 = 000000000000009d, Mem[0000000010141410] = 00000003
	stwa	%l3,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000009d
!	%l2 = 0000000000000000, Mem[0000000030001400] = 00000000fa4e40fb
	stxa	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000000000000000
!	%l4 = 0000000000000003, %l7 = 0000000000000000, %l7 = 0000000000000000
	orn	%l4,%l7,%l7		! %l7 = ffffffffffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 9d000000, %f31 = ffb2ff5a
	lda	[%i5+%o5]0x88,%f31	! %f31 = 9d000000

p0_label_213:
!	Mem[0000000030081410] = ff0003f2, %l7 = ffffffffffffffff
	lduha	[%i2+%o5]0x81,%l7	! %l7 = 000000000000ff00
!	Mem[000000001014143c] = ffb2ff5a, %l4 = 0000000000000003
	ldswa	[%i5+0x03c]%asi,%l4	! %l4 = ffffffffffb2ff5a
!	Mem[0000000020800000] = ffff4ebd, %l6 = 0000000000000000
	lduha	[%o1+0x000]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010081408] = ffffffff, %l5 = 0000000000000000
	lduba	[%i2+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1400] = 000000ff, %l1 = 00000000ffb2ff5a
	lduha	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %f25 = 00000000
	lda	[%i6+%o4]0x81,%f25	! %f25 = 00000000
!	Mem[0000000010181408] = 000080ff, %f10 = 00000000
	ld	[%i6+%o4],%f10	! %f10 = 000080ff
!	Mem[00000000300c1408] = c6ffffff, %l0 = 00000000ffffffff
	ldswa	[%i3+%o4]0x89,%l0	! %l0 = ffffffffc6ffffff
!	Mem[00000000100c1408] = 00000000, %l7 = 000000000000ff00
	lduha	[%i3+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = ffff3487, %l2 = 0000000000000000
	ldstub	[%o2+%g0],%l2		! %l2 = 000000ff000000ff

p0_label_214:
!	%l2 = 00000000000000ff, Mem[0000000010041400] = 000000f2
	stwa	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff
!	%l2 = 00000000000000ff, Mem[0000000010001400] = 00000000ff0000ff
	stxa	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000000000ff
!	%f16 = 41d4ffff 000000ff 03000000 ff000000
!	%f20 = 00000000 00000000 8e610000 ffffd441
!	%f24 = 03f2ff00 00000000 7ffb8e61 7b68038d
!	%f28 = 21000000 5fb27b5a ffffffff 9d000000
	stda	%f16,[%i1]ASI_BLK_AIUP	! Block Store to 0000000010041400
!	%f0  = 618efb7f db0dffff, Mem[0000000030141408] = db0dffff 00000000
	stda	%f0 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 618efb7f db0dffff
!	%f10 = 000080ff ff0003ff, Mem[0000000010101438] = ff0000ff ff0080ff
	stda	%f10,[%i4+0x038]%asi	! Mem[0000000010101438] = 000080ff ff0003ff
	membar	#Sync			! Added by membar checker (38)
!	Mem[0000000010041437] = 5fb27b5a, %l0 = ffffffffc6ffffff
	ldstuba	[%i1+0x037]%asi,%l0	! %l0 = 0000005a000000ff
!	Mem[0000000010041400] = 41d4ffff, %l0 = 000000000000005a
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 00000041000000ff
!	%l5 = 00000000000000ff, Mem[000000001008141e] = 00000000, %asi = 80
	stha	%l5,[%i2+0x01e]%asi	! Mem[000000001008141c] = 000000ff
!	Mem[00000000100c141c] = ffc7218b, %l7 = 0000000000000000
	ldstub	[%i3+0x01c],%l7		! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 000000ff 000000ff, %l4 = ffb2ff5a, %l5 = 000000ff
	ldda	[%i4+%o4]0x81,%l4	! %l4 = 00000000000000ff 00000000000000ff

p0_label_215:
!	Mem[00000000218001c0] = 890808e2, %l3 = 000000000000009d
	lduh	[%o3+0x1c0],%l3		! %l3 = 0000000000008908
!	Mem[0000000030041400] = ff0000ff 7b68038d 00000000 00000000
!	Mem[0000000030041410] = 00005d04 00001f9d 04ab8e31 1d4201a7
!	Mem[0000000030041420] = c6ffffff 2bb9970c b02b9bb0 2edfd309
!	Mem[0000000030041430] = ff000000 000000f2 f39cc6a7 00007400
	ldda	[%i1]ASI_BLK_S,%f16	! Block Load from 0000000030041400
!	Mem[00000000100c1400] = 0300000000000000, %f6  = 00001f9d 7b68038d
	ldda	[%i3+%g0]0x88,%f6 	! %f6  = 03000000 00000000
!	Mem[0000000010041400] = ffd4ffff, %l4 = 00000000000000ff
	lduba	[%i1+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141408] = 7f8000f2, %l6 = 000000000000ffff
	ldswa	[%i5+%o4]0x88,%l6	! %l6 = 000000007f8000f2
!	Mem[0000000030181408] = 00000000, %l0 = 0000000000000041
	lduwa	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[000000001018141c] = 00000000, %l7 = 00000000000000ff
	ldub	[%i6+0x01c],%l7		! %l7 = 0000000000000000
!	Mem[0000000030181410] = 0000618e, %l1 = 0000000000000000
	ldswa	[%i6+%o5]0x89,%l1	! %l1 = 000000000000618e
!	Mem[0000000010141418] = 000000ff, %f11 = ff0003ff
	lda	[%i5+0x018]%asi,%f11	! %f11 = 000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000020800000] = ffff4ebd, %asi = 80
	stha	%l7,[%o1+0x000]%asi	! Mem[0000000020800000] = 00004ebd

p0_label_216:
!	%l3 = 0000000000008908, Mem[0000000030001410] = 5a7bb2ffffffd441
	stxa	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000000008908
!	Mem[0000000030181400] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	%l3 = 0000000000008908, Mem[0000000010181400] = ffffb2ff
	stha	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 8908b2ff
!	%l0 = 0000000000000000, Mem[0000000010041420] = 03f2ff0000000000, %asi = 80
	stxa	%l0,[%i1+0x020]%asi	! Mem[0000000010041420] = 0000000000000000
!	Mem[0000000010181408] = 000080ff, %l1 = 000000000000618e
	ldstuba	[%i6+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[00000000300c1410] = ff000047
	stha	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = ff0000ff
!	%l7 = 0000000000000000, Mem[0000000010081400] = 00000000db0dffff
	stxa	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000000000000000
!	Mem[00000000300c1400] = ff000000, %l0 = 0000000000000000
	swapa	[%i3+%g0]0x89,%l0	! %l0 = 00000000ff000000
!	%l4 = 00000000000000ff, Mem[0000000021800181] = 00ff6a7f, %asi = 80
	stba	%l4,[%o3+0x181]%asi	! Mem[0000000021800180] = 00ff6a7f
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ff0000ff7b68038d, %l6 = 000000007f8000f2
	ldxa	[%i1+%g0]0x81,%l6	! %l6 = ff0000ff7b68038d

p0_label_217:
!	Mem[00000000100c1410] = 03f2ff00, %l1 = 0000000000000000
	ldsha	[%i3+%o5]0x88,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000010101400] = 00030000, %l3 = 0000000000008908
	ldswa	[%i4+%g0]0x88,%l3	! %l3 = 0000000000030000
!	Mem[0000000010181400] = 8908b2ff, %l3 = 0000000000030000
	lduwa	[%i6+0x000]%asi,%l3	! %l3 = 000000008908b2ff
!	Mem[00000000100c1410] = 03f2ff00, %l0 = 00000000ff000000
	lduwa	[%i3+%o5]0x88,%l0	! %l0 = 0000000003f2ff00
!	Mem[0000000010101408] = ff000003, %l6 = ff0000ff7b68038d
	lduha	[%i4+0x008]%asi,%l6	! %l6 = 000000000000ff00
!	Mem[0000000010001400] = ff000000 00000000, %l2 = 000000ff, %l3 = 8908b2ff
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 00000000ff000000 0000000000000000
!	Mem[0000000030081400] = ff000000, %l4 = 00000000000000ff
	lduha	[%i2+%g0]0x81,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030181408] = 00000000, %l7 = 0000000000000000
	lduwa	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l2 = 00000000ff000000
	ldsba	[%i3+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030181410] = 0000618e 41d4ffff
	stda	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000 00000000

p0_label_218:
!	Mem[0000000010001410] = 000000ff, %l5 = 00000000000000ff
	ldstuba	[%i0+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030081408] = ffffffff, %l1 = ffffffffffffff00
	ldstuba	[%i2+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	%l0 = 03f2ff00, %l1 = 000000ff, Mem[0000000010181400] = ffb20889 00000000
	stda	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 03f2ff00 000000ff
!	%l6 = 0000ff00, %l7 = 00000000, Mem[0000000030181410] = 00000000 00000000
	stda	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000ff00 00000000
!	Mem[0000000010081400] = 00000000, %l1 = 00000000000000ff
	swapa	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	%l0 = 03f2ff00, %l1 = 00000000, Mem[0000000030081408] = ffffffff 000000ff
	stda	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 03f2ff00 00000000
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030001410] = 00000000 00008908
	stda	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000 00000000
!	%f16 = ff0000ff 7b68038d, %l6 = 000000000000ff00
!	Mem[0000000030081428] = 8d03687b00000000
	add	%i2,0x028,%g1
	stda	%f16,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030081428] = 8d03687b00000000
!	%l5 = 00000000000000ff, Mem[0000000010141410] = 9d000000
	stwa	%l5,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141404] = 000000ff, %l5 = 00000000000000ff
	lduh	[%i5+0x004],%l5		! %l5 = 0000000000000000

p0_label_219:
!	Mem[00000000300c1410] = ff0000ff, %l7 = 0000000000000000
	lduwa	[%i3+%o5]0x81,%l7	! %l7 = 00000000ff0000ff
!	Mem[0000000010101410] = 618efb7f, %l4 = 000000000000ff00
	lduba	[%i4+%o5]0x80,%l4	! %l4 = 0000000000000061
!	%l6 = 000000000000ff00, imm = 00000000000002d8, %l2 = 0000000000000000
	subc	%l6,0x2d8,%l2		! %l2 = 000000000000fc28
!	Mem[0000000010001408] = 7ffb0000, %l2 = 000000000000fc28
	lduba	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101410] = 045db224, %l5 = 0000000000000000
	ldswa	[%i4+%o5]0x81,%l5	! %l5 = 00000000045db224
!	Mem[0000000010101408] = 030000ff, %l7 = 00000000ff0000ff
	lduwa	[%i4+%o4]0x88,%l7	! %l7 = 00000000030000ff
!	Mem[0000000010101400] = 00000300 47010000 ff000003 0002b5ed
!	Mem[0000000010101410] = 618efb7f db0dffff 9d1f0000 00005d04
!	Mem[0000000010101420] = ff5db224 7f000000 00000000 7b68038d
!	Mem[0000000010101430] = ffffffff 00000021 000080ff ff0003ff
	ldda	[%i4]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010101400
!	Mem[0000000010041400] = ffffd4ff, %f18 = 00000000
	lda	[%i1+%g0]0x88,%f18	! %f18 = ffffd4ff
!	Mem[0000000010101414] = db0dffff, %l4 = 0000000000000061
	ldsha	[%i4+0x014]%asi,%l4	! %l4 = ffffffffffffdb0d
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffdb0d, Mem[0000000030101410] = 045db224000000ff
	stxa	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffffffffffdb0d

p0_label_220:
!	Mem[0000000030181400] = 000000ff, %l6 = 000000000000ff00
	ldstuba	[%i6+%g0]0x89,%l6	! %l6 = 000000ff000000ff
!	Mem[00000000300c1408] = c6ffffff, %l0 = 0000000003f2ff00
	swapa	[%i3+%o4]0x89,%l0	! %l0 = 00000000c6ffffff
!	%l6 = 00000000000000ff, Mem[00000000100c1408] = 00000000
	stwa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff
!	%f20 = 00005d04 00001f9d, Mem[00000000100c1408] = ff000000 00000000
	stda	%f20,[%i3+0x008]%asi	! Mem[00000000100c1408] = 00005d04 00001f9d
!	%f28 = ff000000 000000f2, %l2 = 0000000000000000
!	Mem[0000000030001428] = 268d7c0a096cf5c2
	add	%i0,0x028,%g1
	stda	%f28,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030001428] = 268d7c0a096cf5c2
!	%l4 = ffffdb0d, %l5 = 045db224, Mem[0000000010181438] = ffffffff 026c93b5
	stda	%l4,[%i6+0x038]%asi	! Mem[0000000010181438] = ffffdb0d 045db224
	membar	#Sync			! Added by membar checker (39)
!	%f16 = ff0000ff 7b68038d, Mem[0000000010101408] = 030000ff edb50200
	stda	%f16,[%i4+%o4]0x88	! Mem[0000000010101408] = ff0000ff 7b68038d
!	%l7 = 00000000030000ff, imm = 0000000000000c38, %l6 = 00000000000000ff
	add	%l7,0xc38,%l6		! %l6 = 0000000003000d37
!	Mem[0000000030081410] = f20300ff, %l2 = 0000000000000000
	swapa	[%i2+%o5]0x89,%l2	! %l2 = 00000000f20300ff
!	Starting 10 instruction Load Burst
!	%f22 = 04ab8e31, %f12 = 21000000, %f28 = ff000000
	fdivs	%f22,%f12,%f28		! %f28 = 232b8e31

p0_label_221:
!	Mem[0000000010041410] = 0000000000000000, %l6 = 0000000003000d37
	ldxa	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l6 = 0000000000000000
	lduwa	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101410] = ffffffff ffffdb0d, %l2 = f20300ff, %l3 = 00000000
	ldda	[%i4+%o5]0x81,%l2	! %l2 = 00000000ffffffff 00000000ffffdb0d
!	Mem[00000000100c1410] = 00fff203, %l6 = 0000000000000000
	ldswa	[%i3+%o5]0x80,%l6	! %l6 = 0000000000fff203
!	Mem[0000000010001408] = 0000fb7f, %l3 = 00000000ffffdb0d
	lduwa	[%i0+%o4]0x80,%l3	! %l3 = 000000000000fb7f
!	Mem[0000000030101410] = ffffffff, %l6 = 0000000000fff203
	ldswa	[%i4+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030141410] = 9d1f0ddb00000000, %l7 = 00000000030000ff
	ldxa	[%i5+%o5]0x89,%l7	! %l7 = 9d1f0ddb00000000
!	Mem[00000000100c1400] = 00000000, %l3 = 000000000000fb7f
	ldsha	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = 000000ff, %l1 = 0000000000000000
	ldswa	[%i0+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f6  = 045d0000 00001f9d, %l7 = 9d1f0ddb00000000
!	Mem[00000000100c1420] = f200ff0003f2ff00
	add	%i3,0x020,%g1
	stda	%f6,[%g1+%l7]ASI_PST16_P ! Mem[00000000100c1420] = f200ff0003f2ff00

p0_label_222:
!	Mem[0000000010081408] = ffffffff, %l1 = 00000000000000ff
	swapa	[%i2+%o4]0x80,%l1	! %l1 = 00000000ffffffff
!	%f19 = 00000000, Mem[0000000010081400] = 000000ff
	sta	%f19,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	%l6 = ffffffffffffffff, Mem[00000000100c1410] = 03f2ff00
	stba	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 03f2ffff
!	%l6 = ffffffffffffffff, Mem[00000000100c143c] = 000080ff
	stw	%l6,[%i3+0x03c]		! Mem[00000000100c143c] = ffffffff
!	%l5 = 00000000045db224, Mem[0000000030181408] = 00000000
	stha	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000b224
!	Mem[0000000030041410] = 045d0000, %l7 = 9d1f0ddb00000000
	swapa	[%i1+%o5]0x89,%l7	! %l7 = 00000000045d0000
!	Mem[0000000010101400] = 00000300, %l5 = 00000000045db224
	swapa	[%i4+%g0]0x80,%l5	! %l5 = 0000000000000300
!	%f4  = ffff0ddb 7ffb8e61, Mem[0000000030101400] = 00000000 0000807f
	stda	%f4 ,[%i4+%g0]0x89	! Mem[0000000030101400] = ffff0ddb 7ffb8e61
!	%l4 = ffffffffffffdb0d, Mem[0000000010001408] = 0000fb7f
	stha	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = db0dfb7f
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00030000, %l4 = ffffffffffffdb0d
	lduba	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000

p0_label_223:
!	Mem[0000000010041410] = 0000000000000000, %f2  = edb50200 030000ff
	ldda	[%i1+%o5]0x88,%f2 	! %f2  = 00000000 00000000
!	Mem[0000000030081410] = 00000000, %l0 = 00000000c6ffffff
	lduba	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141408] = f200807f000000ff, %l5 = 0000000000000300
	ldxa	[%i5+%o4]0x80,%l5	! %l5 = f200807f000000ff
!	Mem[0000000010081408] = 000000ff, %l6 = ffffffffffffffff
	lduwa	[%i2+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141400] = 00000003, %l4 = 0000000000000000
	ldsba	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000003
!	Mem[0000000010101400] = 24b25d04, %f25 = 2bb9970c
	lda	[%i4+%g0]0x88,%f25	! %f25 = 24b25d04
!	Mem[0000000010081408] = 000000ffd138ff74, %l6 = 00000000000000ff
	ldxa	[%i2+%o4]0x80,%l6	! %l6 = 000000ffd138ff74
!	Mem[0000000010001400] = ff000000, %l7 = 00000000045d0000
	ldswa	[%i0+%g0]0x80,%l7	! %l7 = ffffffffff000000
!	%l1 = 00000000ffffffff, imm = fffffffffffffdad, %l5 = f200807f000000ff
	subc	%l1,-0x253,%l5		! %l5 = 0000000100000252
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ffffffff, Mem[00000000218000c0] = ff005cf4
	sth	%l1,[%o3+0x0c0]		! Mem[00000000218000c0] = ffff5cf4

p0_label_224:
!	Mem[0000000010081400] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i2+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000010181410] = 9d0dffff
	stha	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000ffff
!	Mem[0000000030001410] = 00000000, %l4 = 0000000000000003
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%l1 = 00000000ffffffff, Mem[0000000030101410] = ffffffff
	stha	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffffff
!	Mem[0000000010001400] = 000000ff, %l5 = 0000000100000252
	ldsha	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%l2 = 00000000ffffffff, Mem[0000000010041400] = ffd4ffff
	stba	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = ffd4ffff
!	%f24 = c6ffffff 24b25d04, %l2 = 00000000ffffffff
!	Mem[0000000030181420] = 2a763b2107001d69
	add	%i6,0x020,%g1
	stda	%f24,[%g1+%l2]ASI_PST32_S ! Mem[0000000030181420] = c6ffffff24b25d04
!	Mem[0000000030101400] = 618efb7f, %l5 = 00000000000000ff
	swapa	[%i4+%g0]0x81,%l5	! %l5 = 00000000618efb7f
!	%l1 = 00000000ffffffff, Mem[0000000030181410] = 0000ff00
	stwa	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000, %l4 = 0000000000000000
	ldsba	[%i3+%g0]0x81,%l4	! %l4 = 0000000000000000

p0_label_225:
!	Mem[0000000010141410] = ff00000000000000, %f14 = ff0300ff ff800000
	ldda	[%i5+%o5]0x80,%f14	! %f14 = ff000000 00000000
!	Mem[0000000030141400] = 03000000, %l7 = ffffffffff000000
	lduha	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000300
!	Mem[0000000010141408] = f200807f, %f23 = 1d4201a7
	lda	[%i5+%o4]0x80,%f23	! %f23 = f200807f
!	Mem[0000000010081410] = 0000ffff, %l6 = 000000ffd138ff74
	ldsba	[%i2+%o5]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030081410] = 00000000, %l5 = 00000000618efb7f
	lduwa	[%i2+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[000000001004141c] = ffffd441, %l4 = 0000000000000000
	lduha	[%i1+0x01c]%asi,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030041408] = 0000000000000000, %f8  = 0000007f 24b25dff
	ldda	[%i1+%o4]0x89,%f8 	! %f8  = 00000000 00000000
!	Mem[0000000030181408] = 0000b224, %f30 = f39cc6a7
	lda	[%i6+%o4]0x89,%f30	! %f30 = 0000b224
!	Mem[0000000030041400] = ff0000ff, %l3 = 0000000000000000
	lduha	[%i1+%g0]0x81,%l3	! %l3 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%f9  = 00000000, Mem[0000000030101408] = ff000000
	sta	%f9 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000

p0_label_226:
!	Code Fragment 3
p0_fragment_18:
!	%l0 = 0000000000000000
	setx	0xecb6d6cfd6a14a5a,%g7,%l0 ! %l0 = ecb6d6cfd6a14a5a
!	%l1 = 00000000ffffffff
	setx	0x6daa4da001fd4436,%g7,%l1 ! %l1 = 6daa4da001fd4436
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ecb6d6cfd6a14a5a
	setx	0x18fe2aa7985b4569,%g7,%l0 ! %l0 = 18fe2aa7985b4569
!	%l1 = 6daa4da001fd4436
	setx	0x3662a9cf83db21f6,%g7,%l1 ! %l1 = 3662a9cf83db21f6
!	%f14 = ff000000 00000000, Mem[0000000010181410] = ffff0000 00000046
	stda	%f14,[%i6+%o5]0x88	! Mem[0000000010181410] = ff000000 00000000
!	%l5 = 0000000000000000, Mem[0000000030041408] = 00000000
	stwa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	%l7 = 0000000000000300, Mem[0000000010141400] = 00000000
	stba	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	%l5 = 0000000000000000, Mem[0000000010181422] = 00000000, %asi = 80
	stba	%l5,[%i6+0x022]%asi	! Mem[0000000010181420] = 00000000
!	%l1 = 3662a9cf83db21f6, Mem[0000000010101408] = ff0000ff7b68038d
	stxa	%l1,[%i4+%o4]0x88	! Mem[0000000010101408] = 3662a9cf83db21f6
!	Mem[00000000211c0000] = ffff3487, %l7 = 0000000000000300
	ldstuba	[%o2+0x000]%asi,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010081410] = 0000ffff, %l6 = ffffffffffffffff
	ldstuba	[%i2+%o5]0x88,%l6	! %l6 = 000000ff000000ff
!	%l2 = ffffffff, %l3 = 0000ff00, Mem[0000000030141410] = 00000000 db0d1f9d
	stda	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffffff 0000ff00
!	Starting 10 instruction Load Burst
!	%f3  = 00000000, %f31 = 00007400
	fcmps	%fcc1,%f3 ,%f31		! %fcc1 = 1

p0_label_227:
!	Mem[0000000010041410] = 0000000000000000, %l3 = 000000000000ff00
	ldxa	[%i1+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101408] = 00000000000000ff, %l0 = 18fe2aa7985b4569
	ldxa	[%i4+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001410] = ff00000000000000, %l5 = 0000000000000000
	ldxa	[%i0+%o5]0x81,%l5	! %l5 = ff00000000000000
!	Mem[00000000300c1400] = ff80000000000000, %l0 = 00000000000000ff
	ldxa	[%i3+%g0]0x89,%l0	! %l0 = ff80000000000000
!	%l1 = 3662a9cf83db21f6, %l6 = 00000000000000ff, %l6 = 00000000000000ff
	or	%l1,%l6,%l6		! %l6 = 3662a9cf83db21ff
!	Mem[0000000030141400] = 03000000, %l6 = 3662a9cf83db21ff
	ldsba	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000003
!	Mem[00000000100c1408] = 00005d04, %l7 = 00000000000000ff
	ldsha	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %f26 = b02b9bb0
	lda	[%i3+%g0]0x89,%f26	! %f26 = 00000000
!	%l7 = 0000000000000000, %l0 = ff80000000000000, %l3 = 0000000000000000
	andn	%l7,%l0,%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010141410] = ff00000000000000
	stxa	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000000000000

p0_label_228:
!	%l6 = 00000003, %l7 = 00000000, Mem[0000000030081408] = 00fff203 00000000
	stda	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000003 00000000
!	Mem[0000000030101400] = 000000ff, %l0 = ff80000000000000
	ldstuba	[%i4+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	%l5 = ff00000000000000, imm = fffffffffffff439, %l0 = 0000000000000000
	xnor	%l5,-0xbc7,%l0		! %l0 = ff00000000000bc6
!	%f10 = 8d03687b 00000000, Mem[0000000010181408] = ff0080ff 000000ff
	stda	%f10,[%i6+0x008]%asi	! Mem[0000000010181408] = 8d03687b 00000000
!	%f7  = 00001f9d, %f26 = 00000000, %f4  = ffff0ddb
	fsubs	%f7 ,%f26,%f4 		! %l0 = ff00000000000be8, Unfinished, %fsr = 2500000800
!	Mem[0000000030141410] = ffffffff, %l5 = ff00000000000000
	swapa	[%i5+%o5]0x81,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010001410] = 000000ff, %l3 = 0000000000000000
	ldstuba	[%i0+%o5]0x88,%l3	! %l3 = 000000ff000000ff
!	%l4 = 000000000000ffff, Mem[00000000300c1408] = 03f2ff00
	stha	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 03f2ffff
!	%l2 = ffffffff, %l3 = 000000ff, Mem[0000000010041400] = ffffd4ff ff000000
	stda	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = ffffffff 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = f200807f000000ff, %l2 = 00000000ffffffff
	ldxa	[%i5+%o4]0x80,%l2	! %l2 = f200807f000000ff

p0_label_229:
!	Mem[0000000030101408] = 00000000000000ff, %f0  = 00000147 00030000
	ldda	[%i4+%o4]0x81,%f0 	! %f0  = 00000000 000000ff
!	Mem[0000000010141438] = ffffffff ffb2ff5a, %l6 = 00000003, %l7 = 00000000
	ldda	[%i5+0x038]%asi,%l6	! %l6 = 00000000ffffffff 00000000ffb2ff5a
!	Mem[0000000030181410] = 00000000ffffffff, %l7 = 00000000ffb2ff5a
	ldxa	[%i6+%o5]0x89,%l7	! %l7 = 00000000ffffffff
!	Randomly selected nop
	nop
!	Mem[00000000100c1400] = 0000000000000003, %f6  = 045d0000 00001f9d
	ldda	[%i3+%g0]0x80,%f6 	! %f6  = 00000000 00000003
!	Mem[00000000211c0000] = ffff3487, %l4 = 000000000000ffff
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081438] = 00000003, %f16 = ff0000ff
	ld	[%i2+0x038],%f16	! %f16 = 00000003
!	%l1 = 3662a9cf83db21f6, %l2 = f200807f000000ff, %y  = 5a7bff5f
	umul	%l1,%l2,%l3		! %l3 = 000000835746d40a, %y = 00000083
!	Mem[0000000020800000] = 00004ebd, %l0 = ff00000000000be8
	lduba	[%o1+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 000000ff, %l3 = 5746d40a, Mem[0000000010101430] = ffffffff 00000021
	std	%l2,[%i4+0x030]		! Mem[0000000010101430] = 000000ff 5746d40a

p0_label_230:
!	Mem[00000000100c1430] = ff000000fb7f0021, %l0 = 0000000000000000, %l4 = ffffffffffffffff
	add	%i3,0x30,%g1
	casxa	[%g1]0x80,%l0,%l4	! %l4 = ff000000fb7f0021
!	%l6 = ffffffff, %l7 = ffffffff, Mem[0000000030041400] = ff0000ff 8d03687b
	stda	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffffff ffffffff
!	%l4 = fb7f0021, %l5 = ffffffff, Mem[0000000010181400] = 00fff203 ff000000
	stda	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = fb7f0021 ffffffff
!	%f12 = 21000000, Mem[0000000010041410] = 00000000
	sta	%f12,[%i1+%o5]0x80	! Mem[0000000010041410] = 21000000
!	%f25 = 24b25d04, Mem[0000000010081428] = 26008c47
	st	%f25,[%i2+0x028]	! Mem[0000000010081428] = 24b25d04
!	Mem[0000000010001433] = 000000c7, %l3 = 000000835746d40a
	ldstuba	[%i0+0x033]%asi,%l3	! %l3 = 000000c7000000ff
!	Mem[0000000010181408] = 8d03687b, %l4 = ff000000fb7f0021
	ldstuba	[%i6+%o4]0x80,%l4	! %l4 = 0000008d000000ff
!	%l1 = 3662a9cf83db21f6, Mem[0000000021800181] = 00ff6a7f, %asi = 80
	stba	%l1,[%o3+0x181]%asi	! Mem[0000000021800180] = 00f66a7f
!	Code Fragment 4
p0_fragment_19:
!	%l0 = 0000000000000000
	setx	0x03cbdb004729c371,%g7,%l0 ! %l0 = 03cbdb004729c371
!	%l1 = 3662a9cf83db21f6
	setx	0xc197535819da98d1,%g7,%l1 ! %l1 = c197535819da98d1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 03cbdb004729c371
	setx	0xbcfb19305a4e1321,%g7,%l0 ! %l0 = bcfb19305a4e1321
!	%l1 = c197535819da98d1
	setx	0xe15a8c3072289394,%g7,%l1 ! %l1 = e15a8c3072289394
!	Starting 10 instruction Load Burst
!	%l3 = 00000000000000c7, immed = 00000d29, %y  = 00000083
	udiv	%l3,0xd29,%l4		! %l4 = 0000000009f44c4a
	mov	%l0,%y			! %y = 5a4e1321

p0_label_231:
!	Mem[0000000030001408] = 0003000000000000, %l3 = 00000000000000c7
	ldxa	[%i0+%o4]0x81,%l3	! %l3 = 0003000000000000
!	Mem[0000000010101408] = 83db21f6, %f31 = 00007400
	lda	[%i4+%o4]0x88,%f31	! %f31 = 83db21f6
!	Mem[00000000300c1400] = 00000000, %l7 = 00000000ffffffff
	lduwa	[%i3+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = 0000000003000000, %f26 = 00000000 2edfd309
	ldda	[%i2+%o4]0x89,%f26	! %f26 = 00000000 03000000
!	Mem[0000000030081410] = ff00000000000000, %l2 = f200807f000000ff
	ldxa	[%i2+%o5]0x89,%l2	! %l2 = ff00000000000000
!	Mem[0000000010001428] = 00008e61000000ff, %l6 = 00000000ffffffff
	ldx	[%i0+0x028],%l6		! %l6 = 00008e61000000ff
!	Mem[0000000020800040] = 0000c0bd, %l5 = 00000000ffffffff
	ldsh	[%o1+0x040],%l5		! %l5 = 0000000000000000
!	Mem[0000000021800000] = 4600133c, %l1 = e15a8c3072289394
	ldsba	[%o3+0x000]%asi,%l1	! %l1 = 0000000000000046
!	Mem[0000000030041400] = ffffffff, %l4 = 0000000009f44c4a
	ldsha	[%i1+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f24 = c6ffffff 24b25d04, Mem[00000000100c1408] = 045d0000 9d1f0000
	stda	%f24,[%i3+%o4]0x88	! Mem[00000000100c1408] = c6ffffff 24b25d04

p0_label_232:
!	%l7 = 0000000000000000, Mem[0000000030101408] = ff00000000000000
	stxa	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000000
!	%l0 = bcfb19305a4e1321, Mem[00000000100c1408] = 045db224ffffffc6
	stxa	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = bcfb19305a4e1321
!	%f31 = 83db21f6, Mem[0000000010141414] = 00000000
	st	%f31,[%i5+0x014]	! Mem[0000000010141414] = 83db21f6
!	Mem[0000000010081410] = 0000ffff, %l1 = 0000000000000046
	swapa	[%i2+%o5]0x88,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030081410] = 00000000, %l3 = 0003000000000000
	ldstuba	[%i2+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	%l5 = 0000000000000000, %l7 = 0000000000000000, %l1 = 000000000000ffff
	udivx	%l5,%l7,%l1		! Div by zero, %l0 = bcfb19305a4e1371
!	%l0 = 5a4e1349, %l1 = 0000ffff, Mem[00000000100c1400] = 00000000 00000003
	stda	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 5a4e1349 0000ffff
!	%f16 = 00000003 7b68038d, Mem[0000000030181410] = ffffffff 00000000
	stda	%f16,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000003 7b68038d
!	%f20 = 00005d04 00001f9d, Mem[00000000100c1410] = fffff203 00001f9d
	stda	%f20,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00005d04 00001f9d
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1418] = 00001f9dffc7218b, %l5 = 0000000000000000
	ldxa	[%i3+0x018]%asi,%l5	! %l5 = 00001f9dffc7218b

p0_label_233:
!	Mem[0000000010101400] = 24b25d04, %f12 = 21000000
	lda	[%i4+%g0]0x88,%f12	! %f12 = 24b25d04
!	Mem[0000000030181408] = 24b20000, %f27 = 03000000
	lda	[%i6+%o4]0x81,%f27	! %f27 = 24b20000
!	Mem[00000000300c1400] = 00000000, %l7 = 0000000000000000
	lduba	[%i3+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101400] = 0000014724b25d04, %f4  = ffff0ddb 7ffb8e61
	ldda	[%i4+%g0]0x88,%f4 	! %f4  = 00000147 24b25d04
!	Mem[0000000030181400] = ff0000009d1f0000, %l6 = 00008e61000000ff
	ldxa	[%i6+%g0]0x81,%l6	! %l6 = ff0000009d1f0000
!	%l3 = 0000000000000000, %l2 = ff00000000000000, %l6 = ff0000009d1f0000
	udivx	%l3,%l2,%l6		! %l6 = 0000000000000000
!	Mem[000000001014141c] = ff000004, %f31 = 83db21f6
	lda	[%i5+0x01c]%asi,%f31	! %f31 = ff000004
!	Mem[0000000010181408] = 7b6803ff, %l7 = 0000000000000000
	lduha	[%i6+%o4]0x88,%l7	! %l7 = 00000000000003ff
!	Mem[0000000010001400] = 000000ff, %l0 = bcfb19305a4e1349
	ldsba	[%i0+%g0]0x88,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f12 = 24b25d04 ffffffff, %l5 = 00001f9dffc7218b
!	Mem[00000000300c1430] = 518be99b51f5d93e
	add	%i3,0x030,%g1
	stda	%f12,[%g1+%l5]ASI_PST32_S ! Mem[00000000300c1430] = 24b25d04ffffffff

p0_label_234:
!	%l0 = ffffffff, %l1 = 0000ffff, Mem[0000000010141410] = 00000000 83db21f6
	stda	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffffff 0000ffff
!	%l6 = 0000000000000000, Mem[0000000010041428] = 7ffb8e61
	sth	%l6,[%i1+0x028]		! Mem[0000000010041428] = 00008e61
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030081408] = 03000000 00000000
	stda	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000 00000000
!	%l0 = ffffffffffffffff, Mem[0000000010001408] = db0dfb7f
	stwa	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = ffffffff
!	%f28 = 232b8e31, Mem[0000000030001408] = 00030000
	sta	%f28,[%i0+%o4]0x81	! Mem[0000000030001408] = 232b8e31
!	%l5 = 00001f9dffc7218b, immed = 000005f8, %y  = 5a4e1321
	sdiv	%l5,0x5f8,%l7		! %l7 = 000000007fffffff
	mov	%l0,%y			! %y = ffffffff
!	Mem[0000000030001410] = 000000ff, %l0 = ffffffffffffffff
	swapa	[%i0+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%f4  = 00000147 24b25d04, %l5 = 00001f9dffc7218b
!	Mem[0000000030041410] = 0000000000001f9d
	add	%i1,0x010,%g1
	stda	%f4,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030041410] = 045db22447010000
!	%l3 = 0000000000000000, Mem[0000000010081410] = 46000000
	stba	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ff03687b, %l7 = 000000007fffffff
	lduwa	[%i6+%o4]0x80,%l7	! %l7 = 00000000ff03687b

p0_label_235:
!	Mem[0000000010181400] = ffffffff 21007ffb, %l4 = ffffffff, %l5 = ffc7218b
	ldda	[%i6+%g0]0x88,%l4	! %l4 = 0000000021007ffb 00000000ffffffff
!	Mem[0000000030101408] = 0000000000000000, %l3 = 0000000000000000
	ldxa	[%i4+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l4 = 0000000021007ffb
	ldswa	[%i2+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001430] = 000000ff, %l0 = 00000000000000ff
	lduba	[%i0+0x033]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1418] = 00001f9d ffc7218b, %l4 = 00000000, %l5 = ffffffff
	ldda	[%i3+0x018]%asi,%l4	! %l4 = 0000000000001f9d 00000000ffc7218b
!	Mem[0000000030181408] = 24b20000, %l3 = 0000000000000000
	ldswa	[%i6+%o4]0x81,%l3	! %l3 = 0000000024b20000
!	Mem[0000000010081408] = 74ff38d1ff000000, %f28 = 232b8e31 000000f2
	ldda	[%i2+%o4]0x88,%f28	! %f28 = 74ff38d1 ff000000
!	Code Fragment 3
p0_fragment_20:
!	%l0 = 00000000000000ff
	setx	0x3043411fecda61ef,%g7,%l0 ! %l0 = 3043411fecda61ef
!	%l1 = 000000000000ffff
	setx	0xb1651008198f9c03,%g7,%l1 ! %l1 = b1651008198f9c03
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3043411fecda61ef
	setx	0xa0aba8486bce63b4,%g7,%l0 ! %l0 = a0aba8486bce63b4
!	%l1 = b1651008198f9c03
	setx	0xb93871e83776843c,%g7,%l1 ! %l1 = b93871e83776843c
!	Mem[0000000010181400] = fb7f0021, %l5 = 00000000ffc7218b
	lduha	[%i6+%g0]0x80,%l5	! %l5 = 000000000000fb7f
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 000000ff, %l7 = 00000000ff03687b
	ldstuba	[%i0+%o5]0x88,%l7	! %l7 = 000000ff000000ff

p0_label_236:
!	%l6 = 00000000, %l7 = 000000ff, Mem[00000000100c1408] = bcfb1930 5a4e1321
	std	%l6,[%i3+%o4]		! Mem[00000000100c1408] = 00000000 000000ff
!	Mem[0000000010181410] = 00000000, %l4 = 0000000000001f9d
	swapa	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000021800001] = 4600133c, %l0 = a0aba8486bce63b4
	ldstuba	[%o3+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1400] = 49134e5a, %l5 = 000000000000fb7f
	ldstuba	[%i3+%g0]0x88,%l5	! %l5 = 0000005a000000ff
!	Mem[0000000010181408] = ff03687b, %l6 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l6	! %l6 = 00000000ff03687b
!	%l5 = 000000000000005a, Mem[0000000021800181] = 00f66a7f
	stb	%l5,[%o3+0x181]		! Mem[0000000021800180] = 005a6a7f
!	%f10 = 8d03687b 00000000, Mem[00000000300c1410] = ff0000ff 00000000
	stda	%f10,[%i3+%o5]0x81	! Mem[00000000300c1410] = 8d03687b 00000000
!	%f30 = 0000b224 ff000004, %l3 = 0000000024b20000
!	Mem[0000000010181420] = 00000000000000f2
	add	%i6,0x020,%g1
	stda	%f30,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010181420] = 00000000000000f2
!	Mem[0000000010001408] = ffffffff, %l7 = 00000000000000ff
	ldstuba	[%i0+%o4]0x80,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 0000000000000000, %f10 = 8d03687b 00000000
	ldda	[%i2+%o4]0x81,%f10	! %f10 = 00000000 00000000

p0_label_237:
!	Mem[00000000300c1410] = 7b68038d, %l2 = ff00000000000000
	lduwa	[%i3+%o5]0x89,%l2	! %l2 = 000000007b68038d
!	Mem[0000000010001400] = 000000ff, %l7 = 00000000000000ff
	lduha	[%i0+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[000000001014140c] = 000000ff, %l0 = 0000000000000000
	ldsh	[%i5+0x00e],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010181410] = ff000000 9d1f0000, %l2 = 7b68038d, %l3 = 24b20000
	ldda	[%i6+%o5]0x88,%l2	! %l2 = 000000009d1f0000 00000000ff000000
!	Mem[0000000010141400] = 00000000, %l6 = 00000000ff03687b
	lduba	[%i5+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181418] = 8d030000 00000000, %l2 = 9d1f0000, %l3 = ff000000
	ldda	[%i6+0x018]%asi,%l2	! %l2 = 000000008d030000 0000000000000000
!	Mem[0000000030041408] = 00000000, %l1 = b93871e83776843c
	ldsba	[%i1+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141400] = ff000000 00000000, %l2 = 8d030000, %l3 = 00000000
	ldda	[%i5+%g0]0x88,%l2	! %l2 = 0000000000000000 00000000ff000000
!	Mem[0000000030181400] = ff000000, %l6 = 0000000000000000
	ldsba	[%i6+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000005a, Mem[0000000010001410] = ff000000
	stba	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = 5a000000

p0_label_238:
!	%l7 = 00000000000000ff, Mem[0000000030181410] = 7b68038d
	stha	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 7b6800ff
!	%f16 = 00000003 7b68038d ffffd4ff 00000000
!	%f20 = 00005d04 00001f9d 04ab8e31 f200807f
!	%f24 = c6ffffff 24b25d04 00000000 24b20000
!	%f28 = 74ff38d1 ff000000 0000b224 ff000004
	stda	%f16,[%i2]ASI_BLK_S	! Block Store to 0000000030081400
!	%l4 = 0000000000000000, Mem[0000000030041408] = 00000000
	stha	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	%l7 = 00000000000000ff, Mem[0000000030001408] = 232b8e3100000000
	stxa	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000000000ff
!	Mem[000000001014141c] = ff000004, %l3 = 00000000ff000000, %asi = 80
	swapa	[%i5+0x01c]%asi,%l3	! %l3 = 00000000ff000004
!	Mem[0000000030141400] = 03000000, %l2 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l2	! %l2 = 00000003000000ff
!	%l5 = 000000000000005a, Mem[0000000010001410] = 8d03687b0000005a
	stxa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000000000005a
!	%f6  = 00000000 00000003, %l6 = ffffffffffffffff
!	Mem[0000000030001410] = ffffffff00000000
	add	%i0,0x010,%g1
	stda	%f6,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030001410] = 0300000000000000
!	%l6 = ffffffffffffffff, Mem[0000000030041410] = 0000014724b25d04
	stxa	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = ffffffffffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 7b68038d, %l5 = 000000000000005a
	lduwa	[%i3+%o5]0x89,%l5	! %l5 = 000000007b68038d

p0_label_239:
!	%l5 = 000000007b68038d, %l5 = 000000007b68038d, %l5 = 000000007b68038d
	add	%l5,%l5,%l5		! %l5 = 00000000f6d0071a
!	Mem[0000000010101408] = f621db83, %l5 = 00000000f6d0071a
	swapa	[%i4+%o4]0x80,%l5	! %l5 = 00000000f621db83
!	Mem[0000000030101408] = 00000000, %l5 = 00000000f621db83
	ldswa	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (40)
!	Mem[0000000030081400] = 8d03687b03000000, %f6  = 00000000 00000003
	ldda	[%i2+%g0]0x89,%f6 	! %f6  = 8d03687b 03000000
!	%l2 = 0000000000000003, %l1 = 0000000000000000, %l4 = 0000000000000000
	xor	%l2,%l1,%l4		! %l4 = 0000000000000003
!	Mem[0000000030101400] = ffff0ddbff0000ff, %l1 = 0000000000000000
	ldxa	[%i4+%g0]0x89,%l1	! %l1 = ffff0ddbff0000ff
!	Mem[00000000201c0000] = 61ff8ea0, %l4 = 0000000000000003
	ldsb	[%o0+0x001],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010081410] = 00000000, %l5 = 0000000000000000
	ldswa	[%i2+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = 5fff7b5a ffffffff, %l4 = ffffffff, %l5 = 00000000
	ldda	[%i0+%o4]0x88,%l4	! %l4 = 00000000ffffffff 000000005fff7b5a
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = ff00687b, %l2 = 0000000000000003
	ldstuba	[%i6+%o5]0x81,%l2	! %l2 = 000000ff000000ff

p0_label_240:
!	Mem[0000000030101410] = ffffffff, %l2 = 00000000000000ff
	ldstuba	[%i4+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	%l6 = ffffffffffffffff, Mem[0000000030001400] = 00000000
	stwa	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = ffffffff
!	Mem[0000000030081410] = 00005d04, %l3 = 00000000ff000004
	ldstuba	[%i2+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	%f11 = 00000000, Mem[0000000010041400] = ffffffff
	sta	%f11,[%i1+0x000]%asi	! Mem[0000000010041400] = 00000000
!	%l3 = 0000000000000000, Mem[0000000030081410] = ff005d04
	stha	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 00005d04
!	Mem[00000000100c1408] = 00000000, %l7 = 00000000000000ff
	swapa	[%i3+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = fffff203, %l6 = ffffffffffffffff
	swapa	[%i3+%o4]0x81,%l6	! %l6 = 00000000fffff203
!	Mem[0000000010001400] = 000000ff, %l0 = 00000000000000ff
	ldstuba	[%i0+%g0]0x88,%l0	! %l0 = 000000ff000000ff
!	%f2  = 00000000 00000000, Mem[0000000010101408] = 1a07d0f6 3662a9cf
	stda	%f2 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00000000, %l0 = 00000000000000ff
	ldswa	[%i4+0x008]%asi,%l0	! %l0 = 0000000000000000

p0_label_241:
!	Mem[0000000010081400] = 00000000 000000ff, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 00000000000000ff 0000000000000000
!	Mem[0000000021800080] = 57ff899f, %l1 = ffff0ddbff0000ff
	ldsb	[%o3+0x080],%l1		! %l1 = 0000000000000057
!	Mem[0000000030101410] = 0ddbffff ffffffff, %l6 = fffff203, %l7 = 00000000
	ldda	[%i4+%o5]0x89,%l6	! %l6 = 00000000ffffffff 000000000ddbffff
!	Mem[0000000010101410] = 618efb7f, %f27 = 24b20000
	lda	[%i4+%o5]0x80,%f27	! %f27 = 618efb7f
!	Mem[0000000021800080] = 57ff899f, %l7 = 000000000ddbffff
	lduba	[%o3+0x080]%asi,%l7	! %l7 = 0000000000000057
!	Mem[0000000010001408] = ffffffff, %l7 = 0000000000000057
	ldswa	[%i0+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101408] = 0000000000000000, %f14 = ff000000 00000000
	ldda	[%i4+%o4]0x88,%f14	! %f14 = 00000000 00000000
!	Mem[00000000300c1408] = ffffffff, %l7 = ffffffffffffffff
	lduha	[%i3+%o4]0x81,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010141408] = ff000000 7f8000f2, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i5+%o4]0x88,%l2	! %l2 = 000000007f8000f2 00000000ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 00000000, %l0 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000

p0_label_242:
!	%l5 = 000000005fff7b5a, Mem[0000000010081410] = 00000000
	stha	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 00007b5a
!	%l4 = ffffffff, %l5 = 5fff7b5a, Mem[0000000030001400] = ffffffff 00000000
	stda	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffffff 5fff7b5a
!	%l7 = 000000000000ffff, %l5 = 000000005fff7b5a, %y  = ffffffff
	sdiv	%l7,%l5,%l0		! %l0 = fffffffffffffffe
	mov	%l0,%y			! %y = fffffffe
!	%l4 = ffffffff, %l5 = 5fff7b5a, Mem[0000000010141420] = 03f2ff00 00000000
	std	%l4,[%i5+0x020]		! Mem[0000000010141420] = ffffffff 5fff7b5a
!	Mem[0000000010081400] = ff00000000000000, %l0 = fffffffffffffffe, %l5 = 000000005fff7b5a
	casxa	[%i2]0x80,%l0,%l5	! %l5 = ff00000000000000
!	%l2 = 7f8000f2, %l3 = ff000000, Mem[00000000300c1410] = 8d03687b 00000000
	stda	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = 7f8000f2 ff000000
!	%l2 = 000000007f8000f2, Mem[0000000030041400] = ffffffff
	stba	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = f2ffffff
!	Mem[0000000030041410] = ffffffff, %l6 = 00000000ffffffff
	ldstuba	[%i1+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030001400] = ffffffff, %l1 = 0000000000000057
	swapa	[%i0+%g0]0x81,%l1	! %l1 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141424] = 5fff7b5a, %l2 = 000000007f8000f2
	ldsha	[%i5+0x024]%asi,%l2	! %l2 = 0000000000005fff

p0_label_243:
!	%l2 = 0000000000005fff, immd = 000000000000007c, %l6  = 00000000000000ff
	mulx	%l2,0x07c,%l6		! %l6 = 00000000002e7f84
!	%l5 = ff00000000000000, %l5 = ff00000000000000, %l0 = fffffffffffffffe
	udivx	%l5,%l5,%l0		! %l0 = 0000000000000001
!	Mem[0000000010141400] = 00000000000000ff, %f30 = 0000b224 ff000004
	ldda	[%i5+%g0]0x80,%f30	! %f30 = 00000000 000000ff
!	Mem[0000000010141408] = f200807f, %f15 = 00000000
	lda	[%i5+%o4]0x80,%f15	! %f15 = f200807f
!	Mem[0000000030101410] = ffffffff, %l2 = 0000000000005fff
	lduwa	[%i4+%o5]0x89,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000030141410] = 00000000, %f14 = 00000000
	lda	[%i5+%o5]0x81,%f14	! %f14 = 00000000
!	Mem[00000000300c1410] = 000000ff f200807f, %l2 = ffffffff, %l3 = ff000000
	ldda	[%i3+%o5]0x89,%l2	! %l2 = 00000000f200807f 00000000000000ff
!	Mem[0000000010041408] = 000000ff 00000003, %l2 = f200807f, %l3 = 000000ff
	ldda	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000003 00000000000000ff
!	Mem[0000000010141400] = 00000000000000ff, %f20 = 00005d04 00001f9d
	ldda	[%i5+%g0]0x80,%f20	! %f20 = 00000000 000000ff
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ff, Mem[0000000030081410] = 00005d04
	stba	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = ff005d04

p0_label_244:
!	%l7 = 000000000000ffff, Mem[0000000010141408] = f200807f000000ff
	stxa	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000000000ffff
!	Mem[0000000010181408] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i6+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101400] = 045db224, %l7 = 000000000000ffff
	swapa	[%i4+%g0]0x80,%l7	! %l7 = 00000000045db224
!	%l6 = 002e7f84, %l7 = 045db224, Mem[0000000010041400] = 00000000 000000ff
	stda	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 002e7f84 045db224
!	%l1 = 00000000ffffffff, Mem[0000000030181400] = 000000ff
	stha	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000ffff
!	%l5 = ff00000000000000, Mem[0000000030101410] = ffffffff
	stwa	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	%f7  = 03000000, Mem[00000000300c1408] = ffffffff
	sta	%f7 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 03000000
!	%l7 = 00000000045db224, Mem[00000000300c1400] = 00000000000080ff
	stxa	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000045db224
!	%l4 = 00000000ffffffff, %l2 = 0000000000000003, %l0 = 0000000000000001
	addc	%l4,%l2,%l0		! %l0 = 0000000100000002
!	Starting 10 instruction Load Burst
!	%l1 = 00000000ffffffff, %l5 = ff00000000000000, %l1 = 00000000ffffffff
	xor	%l1,%l5,%l1		! %l1 = ff000000ffffffff

p0_label_245:
!	Mem[0000000030181400] = 0000ffff, %l0 = 0000000100000002
	ldsha	[%i6+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030001410] = 00000003, %l3 = 0000000000000000
	ldsha	[%i0+%o5]0x89,%l3	! %l3 = 0000000000000003
!	Mem[0000000010141408] = 00000000, %l1 = ff000000ffffffff
	lduwa	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081438] = 00000003, %l5 = ff00000000000000
	lduwa	[%i2+0x038]%asi,%l5	! %l5 = 0000000000000003
!	Mem[0000000010101408] = 00000000, %l6 = 00000000002e7f84
	ldsha	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000000
!	%f19 = 00000000, %f20 = 00000000, %f20 = 00000000 000000ff
	fsmuld	%f19,%f20,%f20		! %f20 = 00000000 00000000
!	Mem[0000000010081408] = ff000000, %l5 = 0000000000000003
	ldswa	[%i2+%o4]0x88,%l5	! %l5 = ffffffffff000000
!	Mem[0000000030141410] = 00000000 0000ff00, %l0 = ffffffff, %l1 = 00000000
	ldda	[%i5+%o5]0x81,%l0	! %l0 = 0000000000000000 000000000000ff00
!	Mem[0000000010001410] = 0000005a, %l2 = 0000000000000003
	lduba	[%i0+%o5]0x88,%l2	! %l2 = 000000000000005a
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ffffffff, Mem[0000000010101438] = 000080ff
	stw	%l4,[%i4+0x038]		! Mem[0000000010101438] = ffffffff

p0_label_246:
!	%l3 = 0000000000000003, %l5 = ffffffffff000000, %l2 = 000000000000005a
	orn	%l3,%l5,%l2		! %l2 = 0000000000ffffff
!	%l7 = 00000000045db224, Mem[0000000010001410] = 0000005a
	stha	%l7,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000b224
!	Mem[0000000020800041] = 0000c0bd, %l3 = 0000000000000003
	ldstub	[%o1+0x041],%l3		! %l3 = 00000000000000ff
!	%f8  = 00000000, Mem[000000001000143c] = ff000000
	st	%f8 ,[%i0+0x03c]	! Mem[000000001000143c] = 00000000
!	Mem[0000000010081408] = ff000000, %l5 = ffffffffff000000
	swapa	[%i2+%o4]0x88,%l5	! %l5 = 00000000ff000000
!	%l0 = 00000000, %l1 = 0000ff00, Mem[0000000030101408] = 00000000 00000000
	stda	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 0000ff00
!	%l4 = ffffffff, %l5 = ff000000, Mem[0000000030041400] = f2ffffff ffffffff
	stda	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffffff ff000000
!	%l4 = 00000000ffffffff, Mem[0000000010101400] = 0000ffff
	stba	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = ff00ffff
!	%l5 = 00000000ff000000, Mem[00000000211c0001] = ffff3487
	stb	%l5,[%o2+0x001]		! Mem[00000000211c0000] = ff003487
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = fb7f0021 ffffffff, %l6 = 00000000, %l7 = 045db224
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 00000000fb7f0021 00000000ffffffff

p0_label_247:
!	Mem[0000000010101400] = 00000147ffff00ff, %l1 = 000000000000ff00
	ldxa	[%i4+%g0]0x88,%l1	! %l1 = 00000147ffff00ff
!	Mem[0000000010101410] = ffff0ddb7ffb8e61, %f30 = 00000000 000000ff
	ldda	[%i4+%o5]0x88,%f30	! %f30 = ffff0ddb 7ffb8e61
!	Mem[0000000010141410] = ffff0000ffffffff, %l5 = 00000000ff000000
	ldxa	[%i5+%o5]0x88,%l5	! %l5 = ffff0000ffffffff
!	Mem[00000000100c1400] = ff4e1349, %l2 = 0000000000ffffff
	lduba	[%i3+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[00000000201c0000] = 61ff8ea0, %l7 = 00000000ffffffff
	ldsh	[%o0+%g0],%l7		! %l7 = 00000000000061ff
!	Mem[0000000030001408] = 00000000 000000ff, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i0+%o4]0x81,%l2	! %l2 = 0000000000000000 00000000000000ff
!	Mem[0000000030181410] = 7b6800ff, %f20 = 00000000
	lda	[%i6+%o5]0x89,%f20	! %f20 = 7b6800ff
!	%l7 = 00000000000061ff, Mem[0000000010181400] = 21007ffb
	stha	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = 210061ff
!	Mem[0000000010001408] = ffffffff, %l2 = 0000000000000000
	lduha	[%i0+%o4]0x80,%l2	! %l2 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000020800040] = 00ffc0bd, %l6 = 00000000fb7f0021
	ldstuba	[%o1+0x040]%asi,%l6	! %l6 = 00000000000000ff

p0_label_248:
!	Mem[0000000010101438] = ffffffff, %l4 = 00000000ffffffff
	lduba	[%i4+0x039]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041408] = 00000003, %l5 = ffff0000ffffffff
	swapa	[%i1+%o4]0x88,%l5	! %l5 = 0000000000000003
!	%f10 = 00000000 00000000, Mem[0000000030181400] = ffff0000 9d1f0000
	stda	%f10,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000 00000000
!	%l3 = 00000000000000ff, Mem[00000000300c1400] = 24b25d0400000000
	stxa	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[00000000100c1430] = ff000000
	stb	%l3,[%i3+0x030]		! Mem[00000000100c1430] = ff000000
!	%f10 = 00000000 00000000, %l4 = 00000000000000ff
!	Mem[0000000030081400] = 000000037b68038d
	stda	%f10,[%i2+%l4]ASI_PST8_SL ! Mem[0000000030081400] = 0000000000000000
!	%l5 = 0000000000000003, %l0 = 0000000000000000, %l5  = 0000000000000003
	mulx	%l5,%l0,%l5		! %l5 = 0000000000000000
!	Mem[0000000030041410] = ffffffff, %l5 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000030001408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 000000ff, %l5 = 00000000ffffffff
	lduba	[%i5+%g0]0x89,%l5	! %l5 = 00000000000000ff

p0_label_249:
!	Mem[0000000030141400] = ff000000 ff000000, %l2 = 0000ffff, %l3 = 000000ff
	ldda	[%i5+%g0]0x81,%l2	! %l2 = 00000000ff000000 00000000ff000000
!	Mem[000000001000143c] = 00000000, %l0 = 0000000000000000
	ldub	[%i0+0x03c],%l0		! %l0 = 0000000000000000
!	Mem[0000000010141410] = ffffffff, %l4 = 00000000000000ff
	lduha	[%i5+%o5]0x88,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030001408] = ff000000, %l4 = 000000000000ffff
	lduwa	[%i0+%o4]0x81,%l4	! %l4 = 00000000ff000000
!	Mem[0000000030081408] = ffd4ffff, %l1 = 00000147ffff00ff
	lduha	[%i2+%o4]0x89,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010181400] = ff610021 ffffffff, %l2 = ff000000, %l3 = ff000000
	ldda	[%i6+%g0]0x80,%l2	! %l2 = 00000000ff610021 00000000ffffffff
!	Mem[0000000010141430] = 210000005fb27b5a, %f2  = 00000000 00000000
	ldd	[%i5+0x030],%f2 	! %f2  = 21000000 5fb27b5a
!	Mem[0000000010101408] = 00000000, %l2 = 00000000ff610021
	ldswa	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181400] = ff610021ffffffff, %f0  = 00000000 000000ff
	ldda	[%i6+%g0]0x80,%f0 	! %f0  = ff610021 ffffffff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = ffffffff, Mem[0000000010141400] = 00000000 000000ff
	std	%l2,[%i5+%g0]		! Mem[0000000010141400] = 00000000 ffffffff

p0_label_250:
!	%f28 = 74ff38d1, %f8  = 00000000, %f28 = 74ff38d1
	fsubs	%f28,%f8 ,%f28		! %f28 = 74ff38d1
!	%f26 = 00000000 618efb7f, %l7 = 00000000000061ff
!	Mem[0000000010141428] = 0000000000000000
	add	%i5,0x028,%g1
	stda	%f26,[%g1+%l7]ASI_PST16_P ! Mem[0000000010141428] = 00000000618efb7f
!	%l3 = 00000000ffffffff, Mem[0000000010001428] = 00008e61, %asi = 80
	stwa	%l3,[%i0+0x028]%asi	! Mem[0000000010001428] = ffffffff
!	%l5 = 00000000000000ff, Mem[00000000100c141c] = ffc7218b, %asi = 80
	stwa	%l5,[%i3+0x01c]%asi	! Mem[00000000100c141c] = 000000ff
!	%f22 = 04ab8e31, Mem[0000000010141400] = 00000000
	sta	%f22,[%i5+%g0]0x88	! Mem[0000000010141400] = 04ab8e31
!	%f26 = 00000000 618efb7f, %l7 = 00000000000061ff
!	Mem[0000000030041410] = 00000000ffffffff
	add	%i1,0x010,%g1
	stda	%f26,[%g1+%l7]ASI_PST16_S ! Mem[0000000030041410] = 00000000618efb7f
!	Mem[0000000030041410] = 00000000, %l3 = 00000000ffffffff
	swapa	[%i1+%o5]0x89,%l3	! %l3 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030001408] = ff000000000000ff
	stxa	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000000000000000
!	%l2 = 0000000000000000, %l7 = 00000000000061ff, %y  = fffffffe
	smul	%l2,%l7,%l3		! %l3 = 0000000000000000, %y = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ff000000, %l7 = 00000000000061ff
	lduba	[%i3+%o4]0x80,%l7	! %l7 = 00000000000000ff

p0_label_251:
!	Mem[0000000010001408] = ffffffff, %l7 = 00000000000000ff
	lduha	[%i0+%o4]0x88,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010101428] = 00000000 7b68038d, %l4 = ff000000, %l5 = 000000ff
	ldda	[%i4+0x028]%asi,%l4	! %l4 = 0000000000000000 000000007b68038d
!	Mem[0000000010101400] = ff00ffff47010000, %l6 = 0000000000000000
	ldxa	[%i4+%g0]0x80,%l6	! %l6 = ff00ffff47010000
!	Mem[0000000010001408] = ffffffff, %f29 = ff000000
	lda	[%i0+%o4]0x88,%f29	! %f29 = ffffffff
!	Mem[0000000030101400] = ff0000ff, %l7 = 000000000000ffff
	ldsha	[%i4+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000021800000] = 46ff133c, %l2 = 0000000000000000
	ldsba	[%o3+0x000]%asi,%l2	! %l2 = 0000000000000046
!	Mem[0000000030041408] = 00000000, %l1 = 000000000000ffff
	lduha	[%i1+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041408] = 0000000000000000, %l3 = 0000000000000000
	ldxa	[%i1+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1408] = ff00000003000000, %f12 = 24b25d04 ffffffff
	ldda	[%i3+%o4]0x89,%f12	! %f12 = ff000000 03000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000021800000] = 46ff133c
	stb	%l0,[%o3+%g0]		! Mem[0000000021800000] = 00ff133c

p0_label_252:
!	Mem[00000000300c1408] = 00000003, %l6 = ff00ffff47010000
	swapa	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000003
!	Mem[0000000010141408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%l2 = 00000046, %l3 = 00000000, Mem[0000000010001400] = ff000000 00000000
	stda	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000046 00000000
!	Mem[0000000010181408] = 000000ff, %l3 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	%l6 = 0000000000000003, %l2 = 0000000000000046, %l6 = 0000000000000003
	sub	%l6,%l2,%l6		! %l6 = ffffffffffffffbd
!	%f11 = 00000000, %f28 = 74ff38d1, %f9  = 00000000
	fdivs	%f11,%f28,%f9 		! %f9  = 00000000
!	%f16 = 00000003 7b68038d, Mem[0000000030001400] = 00000057 5a7bff5f
	stda	%f16,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000003 7b68038d
!	%l3 = 00000000000000ff, Mem[0000000030041400] = ffffffff
	stwa	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff
!	Mem[0000000010101408] = 00000000, %l3 = 00000000000000ff
	swapa	[%i4+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Load Burst
!	%l6 = ffffffffffffffbd, Mem[0000000030181410] = ff00687b03000000
	stxa	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffffffffffffbd

p0_label_253:
!	Mem[0000000010141408] = ff000000, %l0 = 0000000000000000
	lduba	[%i5+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181408] = 000000ff, %f22 = 04ab8e31
	lda	[%i6+%o4]0x88,%f22	! %f22 = 000000ff
!	Mem[00000000300c1410] = 000000ff f200807f, %l6 = ffffffbd, %l7 = 000000ff
	ldda	[%i3+%o5]0x89,%l6	! %l6 = 00000000f200807f 00000000000000ff
!	Mem[0000000010041400] = 847f2e00, %l5 = 000000007b68038d
	lduba	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000084
!	Mem[0000000030081400] = 00000000, %l6 = 00000000f200807f
	lduha	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = 000000ff, %l6 = 0000000000000000
	ldsha	[%i2+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101410] = 00000000, %f9  = 00000000
	lda	[%i4+%o5]0x81,%f9 	! %f9 = 00000000
!	Mem[0000000010141400] = 318eab04, %l7 = 00000000000000ff
	ldsba	[%i5+%g0]0x80,%l7	! %l7 = 0000000000000031
!	Mem[00000000211c0000] = ff003487, %l3 = 0000000000000000
	ldsb	[%o2+0x001],%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081434] = ff000000, %l7 = 00000031, %l6 = 000000ff
	add	%i2,0x34,%g1
	casa	[%g1]0x80,%l7,%l6	! %l6 = 00000000ff000000

p0_label_254:
!	Code Fragment 4
p0_fragment_21:
!	%l0 = 00000000000000ff
	setx	0xc54cd4ffca85b8c8,%g7,%l0 ! %l0 = c54cd4ffca85b8c8
!	%l1 = 0000000000000000
	setx	0x8a1d7ecf9f2d99c0,%g7,%l1 ! %l1 = 8a1d7ecf9f2d99c0
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c54cd4ffca85b8c8
	setx	0x90b6ef4ffa61c507,%g7,%l0 ! %l0 = 90b6ef4ffa61c507
!	%l1 = 8a1d7ecf9f2d99c0
	setx	0xc27d709fa9951886,%g7,%l1 ! %l1 = c27d709fa9951886
!	%l2 = 0000000000000046, Mem[00000000211c0000] = ff003487
	sth	%l2,[%o2+%g0]		! Mem[00000000211c0000] = 00463487
!	%l0 = 90b6ef4ffa61c507, Mem[0000000030141410] = 00000000
	stwa	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = fa61c507
!	%l1 = c27d709fa9951886, Mem[0000000010141410] = ffff0000ffffffff
	stxa	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = c27d709fa9951886
!	Mem[0000000010101417] = db0dffff, %l2 = 0000000000000046
	ldstuba	[%i4+0x017]%asi,%l2	! %l2 = 000000ff000000ff
!	%l4 = 0000000000000000, Mem[00000000100c1400] = ff4e1349
	stwa	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	Mem[0000000010181408] = 000000ff, %l5 = 0000000000000084
	ldstuba	[%i6+%o4]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000100c1430] = ff000000, %l4 = 0000000000000000, %asi = 80
	swapa	[%i3+0x030]%asi,%l4	! %l4 = 00000000ff000000
!	Mem[0000000010101408] = ff000000, %l2 = 00000000000000ff
	ldstuba	[%i4+%o4]0x80,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1430] = 00000000fb7f0021, %l1 = c27d709fa9951886
	ldx	[%i3+0x030],%l1		! %l1 = 00000000fb7f0021

p0_label_255:
!	Mem[0000000030101410] = 00000000ffffdb0d, %l1 = 00000000fb7f0021
	ldxa	[%i4+%o5]0x81,%l1	! %l1 = 00000000ffffdb0d
!	Mem[0000000030141400] = 000000ff000000ff, %l3 = 0000000000000000
	ldxa	[%i5+%g0]0x89,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010141420] = ffffffff 5fff7b5a, %l6 = ff000000, %l7 = 00000031
	ldda	[%i5+0x020]%asi,%l6	! %l6 = 00000000ffffffff 000000005fff7b5a
!	Mem[0000000010041438] = ffffffff 9d000000, %l2 = 000000ff, %l3 = 000000ff
	ldda	[%i1+0x038]%asi,%l2	! %l2 = 00000000ffffffff 000000009d000000
!	%l5 = 00000000000000ff, Mem[00000000201c0001] = 61ff8ea0
	stb	%l5,[%o0+0x001]		! Mem[00000000201c0000] = 61ff8ea0
!	Mem[00000000211c0000] = 00463487, %l1 = 00000000ffffdb0d
	ldsba	[%o2+0x001]%asi,%l1	! %l1 = 0000000000000046
!	Mem[0000000010181424] = 000000f2, %f27 = 618efb7f
	ld	[%i6+0x024],%f27	! %f27 = 000000f2
!	Mem[0000000010101438] = ffffffffff0003ff, %l2 = 00000000ffffffff
	ldx	[%i4+0x038],%l2		! %l2 = ffffffffff0003ff
!	Mem[0000000010041410] = 2100000000000000, %f8  = 00000000 00000000
	ldda	[%i1+%o5]0x80,%f8 	! %f8  = 21000000 00000000
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000030041400] = 000000ff
	stwa	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff

p0_label_256:
!	Mem[0000000010001400] = 46000000, %l3 = 000000009d000000
	ldstuba	[%i0+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001408] = ffffffff, %l6 = 00000000ffffffff
	ldstuba	[%i0+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010081410] = 5a7b0000, %l0 = 90b6ef4ffa61c507
	swapa	[%i2+%o5]0x80,%l0	! %l0 = 000000005a7b0000
!	%l6 = 00000000000000ff, Mem[0000000010101408] = ff000000
	stw	%l6,[%i4+%o4]		! Mem[0000000010101408] = 000000ff
!	Mem[000000001000141c] = 5fff7b5a, %l1 = 0000000000000046, %asi = 80
	swapa	[%i0+0x01c]%asi,%l1	! %l1 = 000000005fff7b5a
!	Mem[0000000010141410] = 861895a9, %l3 = 0000000000000000
	ldstuba	[%i5+%o5]0x80,%l3	! %l3 = 00000086000000ff
!	%f16 = 00000003, Mem[0000000030081408] = ffffd4ff
	sta	%f16,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000003
!	Mem[00000000300c1400] = ff000000, %l2 = ffffffffff0003ff
	swapa	[%i3+%g0]0x81,%l2	! %l2 = 00000000ff000000
!	%l3 = 0000000000000086, Mem[0000000010001414] = 00000000
	stw	%l3,[%i0+0x014]		! Mem[0000000010001414] = 00000086
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000, %l7 = 000000005fff7b5a
	lduha	[%i1+%o4]0x89,%l7	! %l7 = 0000000000000000

p0_label_257:
!	Mem[0000000010181400] = 210061ff, %f3  = 5fb27b5a
	lda	[%i6+%g0]0x88,%f3 	! %f3 = 210061ff
!	Mem[00000000100c1428] = ff0000ff, %l5 = 00000000000000ff
	ldsha	[%i3+0x02a]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101400] = ffff0ddbff0000ff, %f26 = 00000000 000000f2
	ldda	[%i4+%g0]0x89,%f26	! %f26 = ffff0ddb ff0000ff
!	Mem[0000000030081410] = 045d00ff, %l4 = 00000000ff000000
	lduwa	[%i2+%o5]0x89,%l4	! %l4 = 00000000045d00ff
!	Mem[0000000030001400] = 03000000, %l6 = 00000000000000ff
	ldsha	[%i0+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081434] = ff000000, %l3 = 0000000000000086
	ldsba	[%i2+0x035]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181424] = 000000f2, %l7 = 0000000000000000
	lduw	[%i6+0x024],%l7		! %l7 = 00000000000000f2
!	Mem[0000000010181408] = 000000ff, %l0 = 000000005a7b0000
	lduwa	[%i6+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001408] = ffffffff, %f26 = ffff0ddb
	lda	[%i0+%o4]0x80,%f26	! %f26 = ffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = 00463487, %l3 = 0000000000000000
	ldstub	[%o2+0x001],%l3		! %l3 = 00000046000000ff

p0_label_258:
!	%l2 = ff000000, %l3 = 00000046, Mem[0000000010141418] = 000000ff ff000000
	stda	%l2,[%i5+0x018]%asi	! Mem[0000000010141418] = ff000000 00000046
!	%f30 = ffff0ddb, %f30 = ffff0ddb, %f18 = ffffd4ff
	fdivs	%f30,%f30,%f18		! %f18 = ffff0ddb
!	Mem[00000000211c0001] = 00ff3487, %l6 = 0000000000000000
	ldstub	[%o2+0x001],%l6		! %l6 = 000000ff000000ff
!	Mem[0000000030081400] = 00000000, %l0 = 00000000000000ff
	swapa	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081414] = 24b25d04, %l4 = 00000000045d00ff
	swap	[%i2+0x014],%l4		! %l4 = 0000000024b25d04
!	%f28 = 74ff38d1 ffffffff, Mem[00000000300c1400] = ff0300ff 00000000
	stda	%f28,[%i3+%g0]0x89	! Mem[00000000300c1400] = 74ff38d1 ffffffff
!	Mem[0000000010001408] = ffffffff, %l4 = 0000000024b25d04
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 000000ff000000ff
!	%f20 = 7b6800ff, Mem[0000000010181400] = 210061ff
	sta	%f20,[%i6+%g0]0x88	! Mem[0000000010181400] = 7b6800ff
!	%f16 = 00000003, %f1  = ffffffff, %f22 = 000000ff
	fdivs	%f16,%f1 ,%f22		! %f22 = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 24b20000, %l7 = 00000000000000f2
	ldsba	[%i6+%o4]0x81,%l7	! %l7 = 0000000000000024

p0_label_259:
!	Mem[0000000010141438] = ffffffff, %l0 = 0000000000000000
	lduw	[%i5+0x038],%l0		! %l0 = 00000000ffffffff
!	Mem[0000000010181410] = ff000000 9d1f0000, %l2 = ff000000, %l3 = 00000046
	ldda	[%i6+%o5]0x88,%l2	! %l2 = 000000009d1f0000 00000000ff000000
!	Mem[00000000300c1408] = 47010000, %l7 = 0000000000000024
	lduha	[%i3+%o4]0x81,%l7	! %l7 = 0000000000004701
!	Mem[00000000100c1408] = ff000000, %l4 = 00000000000000ff
	ldsba	[%i3+0x009]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141430] = 210000005fb27b5a, %l7 = 0000000000004701
	ldxa	[%i5+0x030]%asi,%l7	! %l7 = 210000005fb27b5a
!	Mem[0000000010101400] = 00000147ffff00ff, %l4 = 0000000000000000
	ldxa	[%i4+%g0]0x88,%l4	! %l4 = 00000147ffff00ff
!	Mem[0000000010181400] = ff00687b, %l1 = 000000005fff7b5a
	ldswa	[%i6+%g0]0x80,%l1	! %l1 = ffffffffff00687b
!	Mem[0000000030041400] = ff000000, %l4 = 00000147ffff00ff
	ldswa	[%i1+%g0]0x89,%l4	! %l4 = ffffffffff000000
!	Mem[00000000100c1410] = 00005d04, %l4 = ffffffffff000000
	ldsba	[%i3+0x010]%asi,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 000000ff, %l2 = 000000009d1f0000
	swapa	[%i6+%o4]0x88,%l2	! %l2 = 00000000000000ff

p0_label_260:
!	Mem[0000000010181410] = 9d1f0000, %l7 = 210000005fb27b5a
	swapa	[%i6+%o5]0x88,%l7	! %l7 = 000000009d1f0000
!	Mem[0000000030181408] = 0000b224, %l0 = 00000000ffffffff
	ldstuba	[%i6+%o4]0x89,%l0	! %l0 = 00000024000000ff
!	%l2 = 00000000000000ff, Mem[0000000030141408] = 7ffb8e61
	stha	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 7ffb00ff
!	Mem[0000000010041418] = 8e610000ffffd441, %l5 = 00000000000000ff, %l2 = 00000000000000ff
	add	%i1,0x18,%g1
	casxa	[%g1]0x80,%l5,%l2	! %l2 = 8e610000ffffd441
!	%l7 = 000000009d1f0000, Mem[0000000010101418] = 9d1f0000
	stw	%l7,[%i4+0x018]		! Mem[0000000010101418] = 9d1f0000
!	Mem[0000000030181410] = ffffffff, %l1 = ffffffffff00687b
	swapa	[%i6+%o5]0x81,%l1	! %l1 = 00000000ffffffff
!	%l4 = 0000000000000000, Mem[000000001000143a] = ff800000
	sth	%l4,[%i0+0x03a]		! Mem[0000000010001438] = ff800000
!	%f28 = 74ff38d1 ffffffff, Mem[0000000010001408] = ffffffff 5a7bff5f
	stda	%f28,[%i0+%o4]0x80	! Mem[0000000010001408] = 74ff38d1 ffffffff
!	Mem[0000000010101408] = 000000ff, %l6 = 00000000000000ff
	ldsha	[%i4+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ff0000ffdb0dffff, %f18 = ffff0ddb 00000000
	ldda	[%i4+%g0]0x81,%f18	! %f18 = ff0000ff db0dffff

p0_label_261:
!	Mem[0000000010041410] = 00000021, %l5 = 00000000000000ff
	ldswa	[%i1+%o5]0x88,%l5	! %l5 = 0000000000000021
!	Mem[0000000020800040] = ffffc0bd, %l4 = 0000000000000000
	lduha	[%o1+0x040]%asi,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030181408] = ffb20000, %l1 = 00000000ffffffff
	lduba	[%i6+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[000000001014142c] = 618efb7f, %l7 = 000000009d1f0000
	ldsb	[%i5+0x02c],%l7		! %l7 = 0000000000000061
!	Mem[00000000211c0000] = 00ff3487, %l5 = 0000000000000021
	ldsb	[%o2+0x001],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010181410] = 5a7bb25f, %l6 = 0000000000000000
	lduwa	[%i6+%o5]0x80,%l6	! %l6 = 000000005a7bb25f
!	Mem[0000000030081410] = ff005d04, %f5  = 24b25d04
	lda	[%i2+%o5]0x81,%f5 	! %f5 = ff005d04
!	Mem[0000000010141408] = 000000ff, %l7 = 0000000000000061
	lduha	[%i5+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101408] = 00000000 00ff0000, %l4 = 0000ffff, %l5 = ffffffff
	ldda	[%i4+%o4]0x81,%l4	! %l4 = 0000000000000000 0000000000ff0000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 00000000, %l3 = 00000000ff000000
	ldstuba	[%i0+%o4]0x89,%l3	! %l3 = 00000000000000ff

p0_label_262:
!	Mem[00000000211c0000] = 00ff3487, %l5 = 0000000000ff0000
	ldstuba	[%o2+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	%f6  = 8d03687b 03000000, %l1 = 00000000000000ff
!	Mem[0000000030181420] = c6ffffff24b25d04
	add	%i6,0x020,%g1
	stda	%f6,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030181420] = 000000037b68038d
!	%l4 = 0000000000000000, Mem[0000000030141400] = 000000ff
	stha	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	%l7 = 00000000000000ff, Mem[0000000010141408] = ff000000
	stba	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = ff000000
!	Mem[0000000030141400] = 00000000, %l4 = 0000000000000000
	swapa	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010141408] = ffff0000000000ff
	stxa	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030181400] = 00000000 00000000
	stda	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000 00000000
!	Mem[0000000010181408] = 9d1f0000, %l3 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000030181410] = bdffffff7b6800ff
	stxa	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = fa61c507, %l3 = 0000000000000000
	lduba	[%i2+%o5]0x80,%l3	! %l3 = 00000000000000fa

p0_label_263:
!	Mem[00000000100c1400] = 00000000, %l7 = 00000000000000ff
	ldswa	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101400] = 00000147 ffff00ff, %l2 = ffffd441, %l3 = 000000fa
	ldda	[%i4+%g0]0x88,%l2	! %l2 = 00000000ffff00ff 0000000000000147
!	Mem[0000000020800040] = ffffc0bd, %l7 = 0000000000000000
	lduba	[%o1+0x041]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141400] = 318eab04ffffffff, %f30 = ffff0ddb 7ffb8e61
	ldda	[%i5+%g0]0x80,%f30	! %f30 = 318eab04 ffffffff
!	Mem[00000000100c1400] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i3+0x002]%asi,%l7	! %l7 = 0000000000000000
!	%l7 = 0000000000000000, %l5 = 0000000000000000, %l7 = 0000000000000000
	orn	%l7,%l5,%l7		! %l7 = ffffffffffffffff
!	Mem[0000000030081400] = ff00000000000000, %l2 = 00000000ffff00ff
	ldxa	[%i2+%g0]0x81,%l2	! %l2 = ff00000000000000
!	Mem[0000000030081408] = 00000000 03000000, %l6 = 5a7bb25f, %l7 = ffffffff
	ldda	[%i2+%o4]0x89,%l6	! %l6 = 0000000003000000 0000000000000000
!	Mem[00000000211c0000] = ffff3487, %l6 = 0000000003000000
	ldsha	[%o2+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000030101400] = ff0000ffdb0dffff
	stxa	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000000000

p0_label_264:
!	%l5 = 0000000000000000, immed = 00000f02, %y  = 00000000
	sdiv	%l5,0xf02,%l6		! %l6 = 0000000000000000
	mov	%l0,%y			! %y = 00000024
!	Mem[0000000030041410] = ffffffff, %l1 = 00000000000000ff
	swapa	[%i1+%o5]0x89,%l1	! %l1 = 00000000ffffffff
!	%f14 = 00000000 f200807f, Mem[0000000010141410] = ff1895a9 9f707dc2
	stda	%f14,[%i5+0x010]%asi	! Mem[0000000010141410] = 00000000 f200807f
!	Mem[0000000010001400] = 460000ff, %l5 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l5	! %l5 = 00000000460000ff
!	%l0 = 00000024, %l1 = ffffffff, Mem[0000000010041438] = ffffffff 9d000000
	std	%l0,[%i1+0x038]		! Mem[0000000010041438] = 00000024 ffffffff
!	%l6 = 0000000000000000, Mem[00000000218001c1] = 890808e2
	stb	%l6,[%o3+0x1c1]		! Mem[00000000218001c0] = 890008e2
!	%l1 = 00000000ffffffff, Mem[0000000030141400] = 00000000
	stha	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = ffff0000
!	Mem[0000000030041408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101400] = ff00ffff, %l7 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l7	! %l7 = 00000000ff00ffff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ffffffff, %l6 = 0000000000000000
	ldswa	[%i3+%g0]0x81,%l6	! %l6 = ffffffffffffffff

p0_label_265:
!	Mem[0000000030041400] = ff000000, %l4 = 0000000000000000
	ldsba	[%i1+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0000] = 61ff8ea0, %l1 = 00000000ffffffff
	ldub	[%o0+0x001],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010101400] = 00000000, %l2 = ff00000000000000
	lduwa	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1404] = 0000ffff, %l0 = 0000000000000024
	lduw	[%i3+0x004],%l0		! %l0 = 000000000000ffff
!	Mem[0000000021800140] = 0000cf8d, %l0 = 000000000000ffff
	ldsba	[%o3+0x141]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %f12 = ff000000
	lda	[%i4+%g0]0x89,%f12	! %f12 = 00000000
!	Mem[0000000010101400] = 00000147 00000000, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000000 0000000000000147
!	Mem[0000000010041418] = 8e610000ffffd441, %l7 = 00000000ff00ffff
	ldx	[%i1+0x018],%l7		! %l7 = 8e610000ffffd441
!	Mem[0000000030041410] = 000000ff, %l0 = 0000000000000000
	ldsha	[%i1+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f0  = ff610021 ffffffff 21000000 210061ff
!	%f4  = 00000147 ff005d04 8d03687b 03000000
!	%f8  = 21000000 00000000 00000000 00000000
!	%f12 = 00000000 03000000 00000000 f200807f
	stda	%f0,[%i1]ASI_BLK_S	! Block Store to 0000000030041400

p0_label_266:
!	%l5 = 00000000460000ff, Mem[0000000030081400] = 000000ff
	stha	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff
!	%f16 = 00000003 7b68038d, Mem[0000000030041408] = 21000000 210061ff
	stda	%f16,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000003 7b68038d
!	Mem[0000000030081400] = 000000ff, %l6 = ffffffffffffffff
	ldstuba	[%i2+%g0]0x89,%l6	! %l6 = 000000ff000000ff
!	%f16 = 00000003, Mem[0000000030081400] = ff000000
	sta	%f16,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000003
!	%l6 = 00000000000000ff, Mem[0000000010181400] = 7b6800ff
	stba	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 7b6800ff
!	%l1 = 0000000000000147, Mem[0000000010101410] = 618efb7f
	stwa	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000147
!	%l6 = 00000000000000ff, Mem[0000000010081400] = 000000ff
	stha	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff
!	Mem[0000000030001408] = 000000ff, %l7 = 8e610000ffffd441
	swapa	[%i0+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001428] = ffffffff, %l3 = 0000000000000147
	ldstuba	[%i0+0x028]%asi,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 000000ff, %l0 = 00000000000000ff
	lduha	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000

p0_label_267:
!	Mem[0000000010141400] = 318eab04, %l7 = 00000000000000ff
	ldswa	[%i5+%g0]0x80,%l7	! %l7 = 00000000318eab04
!	Mem[0000000030141410] = fa61c507, %l2 = 0000000000000000
	lduha	[%i5+%o5]0x81,%l2	! %l2 = 000000000000fa61
!	Mem[0000000020800040] = ffffc0bd, %l2 = 000000000000fa61
	ldsb	[%o1+0x041],%l2		! %l2 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (41)
!	Mem[0000000010041408] = ffffffff, %l4 = 0000000000000000
	ldub	[%i1+0x009],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030181408] = 0000b2ff, %l6 = 00000000000000ff
	lduha	[%i6+%o4]0x89,%l6	! %l6 = 000000000000b2ff
!	Mem[00000000300c1408] = 00000147, %l1 = 0000000000000147
	lduba	[%i3+%o4]0x89,%l1	! %l1 = 0000000000000047
!	Mem[00000000100c1408] = ff000000, %l4 = 00000000000000ff
	ldsba	[%i3+%o4]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010101408] = ff000000, %l3 = 00000000000000ff
	ldswa	[%i4+%o4]0x88,%l3	! %l3 = ffffffffff000000
!	Mem[0000000010081410] = fa61c507, %l6 = 000000000000b2ff
	ldsh	[%i2+0x012],%l6		! %l6 = ffffffffffffc507
!	Starting 10 instruction Store Burst
!	%f30 = 318eab04 ffffffff, %l6 = ffffffffffffc507
!	Mem[00000000300c1418] = 3ef0d581a668d2ff
	add	%i3,0x018,%g1
	stda	%f30,[%g1+%l6]ASI_PST32_S ! Mem[00000000300c1418] = 318eab04ffffffff

p0_label_268:
!	%l4 = ffffffffffffffff, Mem[00000000100c1412] = 00005d04
	sth	%l4,[%i3+0x012]		! Mem[00000000100c1410] = 0000ffff
!	%l4 = ffffffffffffffff, Mem[0000000010141408] = 00000000
	stwa	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = ffffffff
!	%f6  = 8d03687b, %f25 = 24b25d04
	fcmpes	%fcc0,%f6 ,%f25		! %fcc0 = 1
!	%l1 = 0000000000000047, Mem[0000000030081408] = 00000003
	stba	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 47000003
!	Mem[00000000100c1400] = 00000000, %l5 = 00000000460000ff
	swapa	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010081408] = 000000ffd138ff74
	stxa	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000000
!	Mem[0000000010141418] = ff000000, %l2 = ffffffffffffffff
	swap	[%i5+0x018],%l2		! %l2 = 00000000ff000000
!	Mem[0000000010081410] = 07c561fa, %l6 = ffffffffffffc507
	swapa	[%i2+%o5]0x88,%l6	! %l6 = 0000000007c561fa
!	%l6 = 0000000007c561fa, Mem[00000000100c143e] = ffffffff
	stb	%l6,[%i3+0x03e]		! Mem[00000000100c143c] = fffffaff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ffff0000 ff000046, %l6 = 07c561fa, %l7 = 318eab04
	ldda	[%i3+%g0]0x88,%l6	! %l6 = 00000000ff000046 00000000ffff0000

p0_label_269:
!	Mem[00000000100c1410] = 9d1f0000 ffff0000, %l0 = 00000000, %l1 = 00000047
	ldda	[%i3+%o5]0x88,%l0	! %l0 = 00000000ffff0000 000000009d1f0000
!	%l6 = 00000000ff000046, immed = 00000208, %y  = 00000024
	sdiv	%l6,0x208,%l4		! %l4 = 000000001236a56a
	mov	%l0,%y			! %y = ffff0000
!	Mem[0000000010141418] = ffffffff, %l6 = 00000000ff000046
	ldsh	[%i5+0x01a],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000010141408] = ffffffff, %l0 = 00000000ffff0000
	ldsba	[%i5+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000021800140] = 0000cf8d, %l4 = 000000001236a56a
	lduha	[%o3+0x140]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001400] = 00000003, %l0 = ffffffffffffffff
	ldswa	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000003
!	Mem[00000000201c0000] = 61ff8ea0, %l5 = 0000000000000000
	lduh	[%o0+%g0],%l5		! %l5 = 00000000000061ff
!	Mem[0000000030041410] = 00000147, %l2 = 00000000ff000000
	lduha	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141438] = ffffffff, %l1 = 000000009d1f0000
	ldub	[%i5+0x03a],%l1		! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = ff000000, %l0 = 0000000000000003, %asi = 80
	swapa	[%i3+0x008]%asi,%l0	! %l0 = 00000000ff000000

p0_label_270:
!	%l5 = 00000000000061ff, immed = 00000797, %y  = ffff0000
	sdiv	%l5,0x797,%l5		! %l5 = ffffffff80000000
	mov	%l0,%y			! %y = ff000000
!	%f8  = 21000000 00000000, %l6 = ffffffffffffffff
!	Mem[0000000010101418] = 9d1f000000005d04
	add	%i4,0x018,%g1
	stda	%f8,[%g1+%l6]ASI_PST8_P ! Mem[0000000010101418] = 2100000000000000
!	%l7 = 00000000ffff0000, Mem[0000000010141400] = ffffffff04ab8e31
	stxa	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000ffff0000
!	%l2 = 0000000000000000, Mem[0000000030001408] = 00000000ffffd441
	stxa	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000000000000000
!	%l6 = ffffffff, %l7 = ffff0000, Mem[0000000010181438] = ffffdb0d 045db224
	stda	%l6,[%i6+0x038]%asi	! Mem[0000000010181438] = ffffffff ffff0000
!	%l1 = 00000000000000ff, Mem[00000000211c0000] = ffff3487, %asi = 80
	stha	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ff3487
!	%f29 = ffffffff, Mem[0000000030141400] = 0000ffff
	sta	%f29,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffffff
!	Mem[0000000010141410] = 00000000, %l2 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000000
!	%f0  = ff610021, Mem[0000000030181400] = 00000000
	sta	%f0 ,[%i6+%g0]0x89	! Mem[0000000030181400] = ff610021
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 0000ffff00001f9d, %l0 = 00000000ff000000
	ldxa	[%i3+%o5]0x80,%l0	! %l0 = 0000ffff00001f9d

p0_label_271:
!	Mem[0000000010041408] = ffffffff, %l1 = 00000000000000ff
	lduba	[%i1+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1400] = 460000ff, %l1 = 00000000000000ff
	lduwa	[%i3+%g0]0x80,%l1	! %l1 = 00000000460000ff
!	Mem[00000000300c1408] = 47010000 000000ff, %l0 = 00001f9d, %l1 = 460000ff
	ldda	[%i3+%o4]0x81,%l0	! %l0 = 0000000047010000 00000000000000ff
!	Mem[0000000010181400] = ff00687b, %l2 = 0000000000000000
	ldswa	[%i6+%g0]0x80,%l2	! %l2 = ffffffffff00687b
!	%l1 = 00000000000000ff, %l6 = ffffffffffffffff, %l0 = 0000000047010000
	and	%l1,%l6,%l0		! %l0 = 00000000000000ff
!	Mem[0000000021800100] = ff900b85, %l4 = 0000000000000000
	lduba	[%o3+0x101]%asi,%l4	! %l4 = 0000000000000090
!	Mem[0000000030101400] = 00000000, %l1 = 00000000000000ff
	lduba	[%i4+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081400] = ff00000000000000, %l6 = ffffffffffffffff
	ldxa	[%i2+%g0]0x80,%l6	! %l6 = ff00000000000000
!	Mem[0000000030101410] = 00000000, %f14 = 00000000
	lda	[%i4+%o5]0x81,%f14	! %f14 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = 61ff8ea0, %l6 = ff00000000000000
	ldstub	[%o0+%g0],%l6		! %l6 = 00000061000000ff

p0_label_272:
!	Mem[0000000010041400] = 847f2e00, %l7 = 00000000ffff0000
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 00000000847f2e00
!	Mem[0000000010181410] = 5fb27b5a, %l6 = 0000000000000061
	swapa	[%i6+%o5]0x88,%l6	! %l6 = 000000005fb27b5a
!	Mem[0000000010001410] = 0000b224, %l5 = ffffffff80000000
	swapa	[%i0+%o5]0x88,%l5	! %l5 = 000000000000b224
!	Mem[0000000030081410] = 9d1f0000045d00ff, %l2 = ffffffffff00687b
	ldxa	[%i2+%o5]0x89,%l2	! %l2 = 9d1f0000045d00ff
!	%l4 = 0000000000000090, Mem[0000000010181400] = 7b6800ff
	stba	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 7b680090
!	%l4 = 00000090, %l5 = 0000b224, Mem[0000000010001408] = d138ff74 ffffffff
	stda	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000090 0000b224
!	%f16 = 00000003 7b68038d ff0000ff db0dffff
!	%f20 = 7b6800ff 00000000 ffffffff f200807f
!	%f24 = c6ffffff 24b25d04 ffffffff ff0000ff
!	%f28 = 74ff38d1 ffffffff 318eab04 ffffffff
	stda	%f16,[%i3]ASI_COMMIT_P	! Block Store to 00000000100c1400
!	%l2 = 9d1f0000045d00ff, Mem[0000000030181410] = ff000000
	stwa	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = 045d00ff
!	Mem[0000000030081410] = 045d00ff, %l4 = 0000000000000090
	ldstuba	[%i2+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = 00004ebd, %l1 = 0000000000000000
	lduba	[%o1+0x001]%asi,%l1	! %l1 = 0000000000000000

p0_label_273:
!	Mem[0000000010041414] = 00000000, %f7  = 03000000
	lda	[%i1+0x014]%asi,%f7 	! %f7 = 00000000
!	Mem[0000000010101400] = 00000000, %l0 = 00000000000000ff
	lduha	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041410] = 00000147ff005d04, %l7 = 00000000847f2e00
	ldxa	[%i1+%o5]0x81,%l7	! %l7 = 00000147ff005d04
!	Mem[0000000010081400] = 000000ff, %l7 = 00000147ff005d04
	ldswa	[%i2+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[000000001010141c] = 00000000, %l3 = ffffffffff000000
	ldsha	[%i4+0x01e]%asi,%l3	! %l3 = 0000000000000000
!	Mem[000000001010140c] = 00000000, %l6 = 000000005fb27b5a
	lduba	[%i4+0x00d]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1400] = ffffffff, %l4 = 00000000000000ff
	ldsha	[%i3+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030081410] = ff005d0400001f9d, %f0  = ff610021 ffffffff
	ldda	[%i2+%o5]0x81,%f0 	! %f0  = ff005d04 00001f9d
!	Mem[0000000030101410] = 00000000, %l0 = 0000000000000000
	lduba	[%i4+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f2  = 21000000 210061ff, Mem[0000000010041408] = ffffffff ff000000
	stda	%f2 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 21000000 210061ff

p0_label_274:
!	%l3 = 0000000000000000, imm = ffffffffffffff0e, %l2 = 9d1f0000045d00ff
	add	%l3,-0x0f2,%l2		! %l2 = ffffffffffffff0e
!	%l0 = 0000000000000000, Mem[0000000030081410] = 9d1f0000045d00ff
	stxa	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000000000000000
!	Mem[0000000030141408] = 7ffb00ff, %l3 = 0000000000000000
	ldstuba	[%i5+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030001400] = 00000003, %l7 = 00000000000000ff
	swapa	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000003
	membar	#Sync			! Added by membar checker (42)
!	%f11 = 00000000, Mem[00000000100c141c] = f200807f
	st	%f11,[%i3+0x01c]	! Mem[00000000100c141c] = 00000000
!	Mem[0000000030041410] = 00000147, %l6 = 0000000000000000
	ldstuba	[%i1+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	%f24 = c6ffffff 24b25d04, Mem[0000000030001410] = 03000000 00000000
	stda	%f24,[%i0+%o5]0x81	! Mem[0000000030001410] = c6ffffff 24b25d04
!	%l6 = 0000000000000000, Mem[0000000010101408] = ff000000
	stha	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = ff000000
!	Mem[0000000010101410] = 47010000, %l2 = ffffffffffffff0e
	ldstuba	[%i4+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 470100ff, %l6 = 0000000000000000
	lduha	[%i4+%o5]0x88,%l6	! %l6 = 00000000000000ff

p0_label_275:
!	Code Fragment 3
p0_fragment_22:
!	%l0 = 0000000000000000
	setx	0x3d556b2f9ade798a,%g7,%l0 ! %l0 = 3d556b2f9ade798a
!	%l1 = 0000000000000000
	setx	0xe66dafbfb741da97,%g7,%l1 ! %l1 = e66dafbfb741da97
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3d556b2f9ade798a
	setx	0xba9db187ad68b100,%g7,%l0 ! %l0 = ba9db187ad68b100
!	%l1 = e66dafbfb741da97
	setx	0x6763f567a8b38dfa,%g7,%l1 ! %l1 = 6763f567a8b38dfa
!	Mem[0000000010081400] = 00000000000000ff, %l4 = ffffffffffffffff
	ldxa	[%i2+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141400] = ffffffff, %l3 = 00000000000000ff
	ldswa	[%i5+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030101408] = 0000000000ff0000, %l3 = ffffffffffffffff
	ldxa	[%i4+%o4]0x81,%l3	! %l3 = 0000000000ff0000
!	Mem[0000000030181400] = 00000000ff610021, %l3 = 0000000000ff0000
	ldxa	[%i6+%g0]0x89,%l3	! %l3 = 00000000ff610021
!	Mem[0000000030141400] = ffffffff, %l1 = 6763f567a8b38dfa
	ldswa	[%i5+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000300c1400] = ffffffff, %l4 = 00000000000000ff
	lduwa	[%i3+%g0]0x81,%l4	! %l4 = 00000000ffffffff
!	Mem[000000001000140c] = 24b20000, %f31 = ffffffff
	ld	[%i0+0x00c],%f31	! %f31 = 24b20000
!	Mem[000000001000140c] = 24b20000, %l0 = ba9db187ad68b100
	ldsha	[%i0+0x00c]%asi,%l0	! %l0 = 00000000000024b2
!	Starting 10 instruction Store Burst
!	Mem[0000000021800180] = 005a6a7f, %l0 = 00000000000024b2
	ldstuba	[%o3+0x180]%asi,%l0	! %l0 = 00000000000000ff

p0_label_276:
!	%f14 = 00000000 f200807f, Mem[0000000010001420] = 00000000 47010000
	stda	%f14,[%i0+0x020]%asi	! Mem[0000000010001420] = 00000000 f200807f
!	Mem[0000000010141410] = 00000000, %l1 = ffffffffffffffff
	swapa	[%i5+%o5]0x88,%l1	! %l1 = 0000000000000000
!	%f12 = 00000000 03000000, Mem[0000000010141408] = ffffffff 00000000
	std	%f12,[%i5+%o4]	! Mem[0000000010141408] = 00000000 03000000
!	Mem[0000000030101410] = 00000000, %l3 = 00000000ff610021
	ldstuba	[%i4+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	%f31 = 24b20000, Mem[0000000030041408] = 03000000
	sta	%f31,[%i1+%o4]0x89	! Mem[0000000030041408] = 24b20000
!	%f22 = ffffffff f200807f, Mem[0000000010141430] = 21000000 5fb27b5a
	std	%f22,[%i5+0x030]	! Mem[0000000010141430] = ffffffff f200807f
!	Mem[0000000010101408] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[00000000100c1410] = 00000000ff00687b
	stxa	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000000000000000
!	%l7 = 0000000000000003, Mem[0000000030181408] = ffb20000
	stba	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = 03b20000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 80000000, %f24 = c6ffffff
	lda	[%i0+%o5]0x88,%f24	! %f24 = 80000000

p0_label_277:
!	Mem[0000000030141408] = ff00fb7f, %l1 = 0000000000000000
	lduba	[%i5+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101410] = 000000ff, %l0 = 0000000000000000
	lduba	[%i4+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041434] = 5fb27bff, %l1 = 00000000000000ff
	ldsw	[%i1+0x034],%l1		! %l1 = 000000005fb27bff
!	Mem[0000000010001400] = 00000000, %l3 = 0000000000000000
	ldswa	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l6 = 00000000000000ff
	ldsha	[%i0+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%f18 = ff0000ff, %f23 = f200807f, %f4  = 00000147
	fsubs	%f18,%f23,%f4 		! %f4  = ff0000ff
!	Mem[0000000030081408] = 47000003, %l0 = 00000000000000ff
	lduha	[%i2+%o4]0x81,%l0	! %l0 = 0000000000004700
!	Mem[0000000030141408] = ff00fb7f db0dffff, %l6 = 00000000, %l7 = 00000003
	ldda	[%i5+%o4]0x81,%l6	! %l6 = 00000000ff00fb7f 00000000db0dffff
!	Mem[0000000030001410] = 045db224 ffffffc6, %l6 = ff00fb7f, %l7 = db0dffff
	ldda	[%i0+%o5]0x89,%l6	! %l6 = 00000000ffffffc6 00000000045db224
!	Starting 10 instruction Store Burst
!	%f12 = 00000000 03000000, Mem[0000000030041400] = ff610021 ffffffff
	stda	%f12,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000 03000000

p0_label_278:
!	%l2 = 0000000000000000, Mem[0000000030181400] = 210061ff
	stwa	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	%f22 = ffffffff f200807f, Mem[00000000100c1400] = 00000003 7b68038d
	stda	%f22,[%i3+0x000]%asi	! Mem[00000000100c1400] = ffffffff f200807f
!	%f2  = 21000000 210061ff, %l1 = 000000005fb27bff
!	Mem[0000000030001418] = d9d2725c8fb2181f
	add	%i0,0x018,%g1
	stda	%f2,[%g1+%l1]ASI_PST16_S ! Mem[0000000030001418] = 21000000210061ff
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010001400] = 00000000 00000000
	stda	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000 00000000
!	%l3 = 0000000000000000, Mem[0000000010001408] = 00000090
	stwa	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
!	%l1 = 000000005fb27bff, Mem[00000000100c1400] = ffffffff
	stwa	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = 5fb27bff
!	%l5 = 000000000000b224, Mem[00000000201c0000] = ffff8ea0, %asi = 80
	stha	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = b2248ea0
!	%f15 = f200807f, Mem[0000000010081418] = 00008ed6
	sta	%f15,[%i2+0x018]%asi	! Mem[0000000010081418] = f200807f
!	%l7 = 00000000045db224, Mem[0000000030081400] = 00000003
	stwa	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = 045db224
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ffffffff, %l7 = 00000000045db224
	lduha	[%i3+%g0]0x81,%l7	! %l7 = 000000000000ffff

p0_label_279:
!	Mem[0000000030101400] = 00000000, %l2 = 0000000000000000
	ldsha	[%i4+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081408] = 47000003, %l2 = 0000000000000000
	lduwa	[%i2+%o4]0x81,%l2	! %l2 = 0000000047000003
!	Mem[0000000030181410] = 045d00ff00000000, %f16 = 00000003 7b68038d
	ldda	[%i6+%o5]0x81,%f16	! %f16 = 045d00ff 00000000
!	Mem[00000000211c0000] = 00ff3487, %l2 = 0000000047000003
	ldub	[%o2+%g0],%l2		! %l2 = 0000000000000000
!	Mem[0000000010141410] = ffffffff, %l7 = 000000000000ffff
	ldsba	[%i5+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030141400] = ffffffffff000000, %f4  = ff0000ff ff005d04
	ldda	[%i5+%g0]0x81,%f4 	! %f4  = ffffffff ff000000
!	Mem[0000000010001414] = 00000086, %l5 = 000000000000b224
	ldsha	[%i0+0x016]%asi,%l5	! %l5 = 0000000000000086
!	Mem[0000000010081410] = ffffc507, %l5 = 0000000000000086
	ldsba	[%i2+%o5]0x88,%l5	! %l5 = 0000000000000007
!	Mem[0000000010081408] = 00000000, %l3 = 0000000000000000
	ldsba	[%i2+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[00000000100c142a] = ffffffff, %asi = 80
	stha	%l2,[%i3+0x02a]%asi	! Mem[00000000100c1428] = ffff0000

p0_label_280:
!	Mem[0000000010181408] = 9d1f00ff, %l0 = 0000000000004700
	ldstuba	[%i6+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	Code Fragment 4
p0_fragment_23:
!	%l0 = 00000000000000ff
	setx	0x8278a157c29409ed,%g7,%l0 ! %l0 = 8278a157c29409ed
!	%l1 = 000000005fb27bff
	setx	0xfc1c6d17edf4c474,%g7,%l1 ! %l1 = fc1c6d17edf4c474
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8278a157c29409ed
	setx	0xfed7b767b09fa4a2,%g7,%l0 ! %l0 = fed7b767b09fa4a2
!	%l1 = fc1c6d17edf4c474
	setx	0x5d1a5188157348c7,%g7,%l1 ! %l1 = 5d1a5188157348c7
!	%l4 = 00000000ffffffff, Mem[00000000201c0000] = b2248ea0
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = ffff8ea0
!	%f21 = 00000000, Mem[0000000030081408] = 47000003
	sta	%f21,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	%l0 = fed7b767b09fa4a2, Mem[0000000010181410] = 61000000000000ff, %asi = 80
	stxa	%l0,[%i6+0x010]%asi	! Mem[0000000010181410] = fed7b767b09fa4a2
!	%f6  = 8d03687b 00000000, Mem[0000000030081410] = 00000000 00000000
	stda	%f6 ,[%i2+%o5]0x89	! Mem[0000000030081410] = 8d03687b 00000000
!	Mem[0000000010041410] = 21000000, %l1 = 5d1a5188157348c7
	swapa	[%i1+%o5]0x80,%l1	! %l1 = 0000000021000000
!	Mem[0000000010101424] = 7f000000, %l7 = ffffffffffffffff, %asi = 80
	swapa	[%i4+0x024]%asi,%l7	! %l7 = 000000007f000000
!	%f8  = 21000000 00000000, %l7 = 000000007f000000
!	Mem[00000000300c1418] = 318eab04ffffffff
	add	%i3,0x018,%g1
	stda	%f8,[%g1+%l7]ASI_PST32_S ! Mem[00000000300c1418] = 318eab04ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000000, %l2 = 0000000000000000
	ldsba	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000

p0_label_281:
!	Mem[00000000211c0000] = 00ff3487, %l6 = 00000000ffffffc6
	ldub	[%o2+0x001],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010041430] = 21000000, %l7 = 000000007f000000
	lduh	[%i1+0x030],%l7		! %l7 = 0000000000002100
!	Mem[0000000030041410] = ff000147ff005d04, %l3 = 0000000000000000
	ldxa	[%i1+%o5]0x81,%l3	! %l3 = ff000147ff005d04
!	Mem[0000000030081408] = 00000000, %l3 = ff000147ff005d04
	ldswa	[%i2+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181408] = ff001f9d, %l5 = 0000000000000007
	lduba	[%i6+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030041408] = 0000b224 7b68038d, %l6 = 000000ff, %l7 = 00002100
	ldda	[%i1+%o4]0x81,%l6	! %l6 = 000000000000b224 000000007b68038d
!	Mem[0000000010041408] = ff61002100000021, %f6  = 8d03687b 00000000
	ldda	[%i1+%o4]0x88,%f6 	! %f6  = ff610021 00000021
!	Mem[0000000010101434] = 5746d40a, %l0 = fed7b767b09fa4a2
	ldsw	[%i4+0x034],%l0		! %l0 = 000000005746d40a
!	Mem[00000000201c0000] = ffff8ea0, %l0 = 000000005746d40a
	ldsb	[%o0+0x001],%l0		! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = c7487315, %l1 = 0000000021000000
	swapa	[%i1+%o5]0x88,%l1	! %l1 = 00000000c7487315

p0_label_282:
!	%l6 = 000000000000b224, Mem[0000000010001408] = 00000000
	stwa	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000b224
!	%f26 = ffffffff ff0000ff, Mem[0000000010001410] = 80000000 86000000
	stda	%f26,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffff ff0000ff
!	%l5 = 00000000000000ff, Mem[0000000010001400] = 0000000000000000
	stxa	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000000000ff
!	Mem[00000000100c140c] = db0dffff, %l7 = 000000007b68038d
	swap	[%i3+0x00c],%l7		! %l7 = 00000000db0dffff
!	%l7 = 00000000db0dffff, immed = fffffc3f, %y  = ff000000
	smul	%l7,-0x3c1,%l5		! %l5 = 0000008ab07203c1, %y = 0000008a
!	Mem[0000000010001410] = ff0000ff, %l4 = 00000000ffffffff
	ldstuba	[%i0+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	Mem[000000001010140f] = 00000000, %l0 = ffffffffffffffff
	ldstuba	[%i4+0x00f]%asi,%l0	! %l0 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000030041408] = 24b20000
	stha	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 24b20000
!	Mem[0000000010041410] = 00000021, %l3 = 0000000000000000
	lduha	[%i1+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00000000 03000000, %l4 = 000000ff, %l5 = b07203c1
	ldda	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000 0000000003000000

p0_label_283:
!	%f30 = 318eab04, Mem[0000000010001408] = 0000b224
	sta	%f30,[%i0+%o4]0x80	! Mem[0000000010001408] = 318eab04
!	Mem[0000000030181408] = 03b20000 ff000000, %l4 = 00000000, %l5 = 03000000
	ldda	[%i6+%o4]0x81,%l4	! %l4 = 0000000003b20000 00000000ff000000
!	Mem[0000000010181408] = ff001f9d, %l3 = 0000000000000000
	lduwa	[%i6+%o4]0x80,%l3	! %l3 = 00000000ff001f9d
!	Mem[0000000030181408] = 03b20000, %l5 = 00000000ff000000
	ldsha	[%i6+%o4]0x81,%l5	! %l5 = 00000000000003b2
!	Mem[0000000010141410] = ffffffff, %l7 = 00000000db0dffff
	ldswa	[%i5+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000100c1438] = 318eab04, %l4 = 0000000003b20000
	ldsba	[%i3+0x039]%asi,%l4	! %l4 = ffffffffffffff8e
!	Mem[00000000211c0000] = 00ff3487, %l3 = 00000000ff001f9d
	ldsh	[%o2+%g0],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010081408] = 00000000, %l2 = 0000000000000000
	lduba	[%i2+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000201c0000] = ffff8ea0, %l1 = 00000000c7487315
	ldsha	[%o0+0x000]%asi,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 00000000, %l6 = 000000000000b224
	ldstuba	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000ff

p0_label_284:
!	%f6  = ff610021, Mem[0000000030081400] = 24b25d04
	sta	%f6 ,[%i2+%g0]0x89	! Mem[0000000030081400] = ff610021
!	%l6 = 0000000000000000, Mem[00000000100c1400] = 5fb27bff
	stwa	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	%f16 = 045d00ff 00000000 ff0000ff db0dffff
!	%f20 = 7b6800ff 00000000 ffffffff f200807f
!	%f24 = 80000000 24b25d04 ffffffff ff0000ff
!	%f28 = 74ff38d1 ffffffff 318eab04 24b20000
	stda	%f16,[%i5]ASI_BLK_AIUSL	! Block Store to 0000000030141400
!	%l2 = 0000000000000000, Mem[0000000030001410] = 045db224ffffffc6
	stxa	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000000000000000
!	%f2  = 21000000, Mem[0000000030181408] = 0000b203
	sta	%f2 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 21000000
!	%f7  = 00000021, %f12 = 00000000, %f13 = 03000000
	fsubs	%f7 ,%f12,%f13		! %l0 = 0000000000000022, Unfinished, %fsr = 2500000400
!	Mem[0000000010041408] = 21000000, %l0 = 0000000000000022
	ldstuba	[%i1+%o4]0x80,%l0	! %l0 = 00000021000000ff
!	Mem[0000000030081408] = 00000000, %l0 = 0000000000000021
	swapa	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000
!	%l5 = 00000000000003b2, Mem[0000000010181408] = ff001f9d
	stha	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 03b21f9d
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l2 = 0000000000000000
	lduha	[%i3+%o5]0x80,%l2	! %l2 = 0000000000000000

p0_label_285:
!	Mem[0000000010081408] = 00000000 00000000, %l6 = 00000000, %l7 = ffffffff
	ldda	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030081410] = 8d03687b 00000000, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000000 000000008d03687b
!	Mem[0000000030041410] = ff000147 ff005d04, %l6 = 00000000, %l7 = 00000000
	ldda	[%i1+%o5]0x81,%l6	! %l6 = 00000000ff000147 00000000ff005d04
!	Mem[0000000010041408] = ff000000 210061ff, %l4 = ffffff8e, %l5 = 000003b2
	ldda	[%i1+0x008]%asi,%l4	! %l4 = 00000000ff000000 00000000210061ff
!	Mem[0000000010101400] = 00000000, %l3 = 000000008d03687b
	lduha	[%i4+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041400] = 0000ffff, %l2 = 0000000000000000
	lduwa	[%i1+%g0]0x88,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030101400] = 0000000000000000, %l0 = 0000000000000000
	ldxa	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l2 = 000000000000ffff
	lduwa	[%i4+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081408] = 21000000, %l2 = 0000000000000000
	lduwa	[%i2+%o4]0x81,%l2	! %l2 = 0000000021000000
!	Starting 10 instruction Store Burst
!	%f8  = 21000000 00000000, Mem[0000000030181408] = 21000000 000000ff
	stda	%f8 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 21000000 00000000

p0_label_286:
!	%l0 = 0000000000000000, Mem[00000000201c0000] = ffff8ea0
	stb	%l0,[%o0+%g0]		! Mem[00000000201c0000] = 00ff8ea0
!	Mem[0000000010101424] = ffffffff, %l7 = 00000000ff005d04, %asi = 80
	swapa	[%i4+0x024]%asi,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000010041408] = ff610021 000000ff, %l2 = 21000000, %l3 = 00000000
	ldda	[%i1+%o4]0x88,%l2	! %l2 = 00000000000000ff 00000000ff610021
!	%l1 = ffffffffffffffff, Mem[0000000010181400] = 9000687b
	stha	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = ffff687b
!	%l4 = ff000000, %l5 = 210061ff, Mem[0000000030101400] = 00000000 00000000
	stda	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = ff000000 210061ff
!	%l5 = 00000000210061ff, Mem[0000000030001400] = 000000ff
	stha	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 61ff00ff
!	%l3 = 00000000ff610021, %l0 = 0000000000000000, %l0 = 0000000000000000
	addc	%l3,%l0,%l0		! %l0 = 00000000ff610021
!	%l1 = ffffffffffffffff, Mem[0000000010081410] = ffffc507
	stha	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = ffffffff
!	%l1 = ffffffffffffffff, Mem[0000000030081410] = 00000000
	stha	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 0000000000000000, %f10 = 00000000 00000000
	ldda	[%i3+%o5]0x88,%f10	! %f10 = 00000000 00000000

p0_label_287:
	membar	#Sync			! Added by membar checker (43)
!	Mem[0000000010141400] = 00000000ffff0000, %l1 = ffffffffffffffff
	ldxa	[%i5+%g0]0x88,%l1	! %l1 = 00000000ffff0000
!	Mem[0000000010001408] = 04ab8e31, %l7 = 00000000ffffffff
	ldswa	[%i0+%o4]0x88,%l7	! %l7 = 0000000004ab8e31
!	Mem[0000000030141408] = db0dffff, %l3 = 00000000ff610021
	lduha	[%i5+%o4]0x89,%l3	! %l3 = 000000000000ffff
!	Mem[00000000211c0000] = 00ff3487, %l7 = 0000000004ab8e31
	lduha	[%o2+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000020800000] = 00004ebd, %l2 = 00000000000000ff
	lduba	[%o1+0x000]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1400] = ffffffff, %l5 = 00000000210061ff
	ldsha	[%i3+%g0]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010101410] = 470100ff, %l6 = 00000000ff000147
	ldsha	[%i4+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041410] = 00000021, %l1 = 00000000ffff0000
	ldsba	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l2 = 0000000000000000
	lduha	[%i5+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 00000000, %l0 = 00000000ff610021
	swapa	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000000

p0_label_288:
!	%f6  = ff610021 00000021, %l2 = 0000000000000000
!	Mem[0000000030041438] = 00000000f200807f
	add	%i1,0x038,%g1
	stda	%f6,[%g1+%l2]ASI_PST16_S ! Mem[0000000030041438] = 00000000f200807f
!	%f30 = 318eab04 24b20000, Mem[00000000300c1410] = f200807f 000000ff
	stda	%f30,[%i3+%o5]0x89	! Mem[00000000300c1410] = 318eab04 24b20000
!	Mem[0000000010081407] = 00000000, %l4 = 00000000ff000000
	ldstuba	[%i2+0x007]%asi,%l4	! %l4 = 00000000000000ff
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000010001420] = 00000000 f200807f
	std	%l6,[%i0+0x020]		! Mem[0000000010001420] = 000000ff 000000ff
!	%l3 = 000000000000ffff, Mem[0000000010101418] = 21000000, %asi = 80
	stha	%l3,[%i4+0x018]%asi	! Mem[0000000010101418] = ffff0000
!	%f8  = 21000000 00000000, %l7 = 00000000000000ff
!	Mem[0000000030041428] = 0000000000000000
	add	%i1,0x028,%g1
	stda	%f8,[%g1+%l7]ASI_PST32_SL ! Mem[0000000030041428] = 0000000000000021
!	%l6 = 00000000000000ff, Mem[0000000030181400] = 000000ff
	stha	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff
!	%l7 = 00000000000000ff, Mem[0000000010101408] = ff0000ff
	stwa	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000ff
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000010141430] = ffffffff f200807f
	stda	%l6,[%i5+0x030]%asi	! Mem[0000000010141430] = 000000ff 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00000000, %l7 = 00000000000000ff
	ldsba	[%i4+%o4]0x81,%l7	! %l7 = 0000000000000000

p0_label_289:
!	Mem[0000000030101400] = ff000000, %f6  = ff610021
	lda	[%i4+%g0]0x81,%f6 	! %f6 = ff000000
!	Mem[0000000030081400] = 00000000ff610021, %l1 = 0000000000000000
	ldxa	[%i2+%g0]0x89,%l1	! %l1 = 00000000ff610021
!	Mem[0000000030041400] = 0000000003000000, %l3 = 000000000000ffff
	ldxa	[%i1+%g0]0x81,%l3	! %l3 = 0000000003000000
!	Mem[00000000100c1408] = ff0000ff, %l2 = 0000000000000000
	lduwa	[%i3+%o4]0x80,%l2	! %l2 = 00000000ff0000ff
!	Mem[0000000010101414] = db0dffff, %l5 = ffffffffffffffff
	lduwa	[%i4+0x014]%asi,%l5	! %l5 = 00000000db0dffff
!	Mem[0000000021800040] = 00ffd078, %l3 = 0000000003000000
	ldsha	[%o3+0x040]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101410] = 000000ff, %f27 = ff0000ff
	lda	[%i4+%o5]0x89,%f27	! %f27 = 000000ff
!	Mem[0000000010141424] = 5fff7b5a, %l3 = 00000000000000ff
	lduba	[%i5+0x025]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181410] = ff005d04, %l6 = 00000000000000ff
	lduba	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000004
!	Starting 10 instruction Store Burst
!	%f28 = 74ff38d1 ffffffff, Mem[0000000010101400] = 00000000 00000147
	stda	%f28,[%i4+%g0]0x88	! Mem[0000000010101400] = 74ff38d1 ffffffff

p0_label_290:
!	%f9  = 00000000, %f31 = 24b20000, %f10 = 00000000 00000000
	fsmuld	%f9 ,%f31,%f10		! %f10 = 00000000 00000000
!	%l3 = 00000000000000ff, Mem[0000000030041408] = 24b20000
	stwa	%l3,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000ff
!	Mem[0000000010101408] = ff000000, %l0 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030041410] = 470100ff, %l5 = 00000000db0dffff
	ldstuba	[%i1+%o5]0x89,%l5	! %l5 = 000000ff000000ff
!	%l7 = 0000000000000000, %l4 = 0000000000000000, %l5  = 00000000000000ff
	mulx	%l7,%l4,%l5		! %l5 = 0000000000000000
!	%l6 = 00000004, %l7 = 00000000, Mem[0000000010001430] = 000000ff 000000ff
	std	%l6,[%i0+0x030]		! Mem[0000000010001430] = 00000004 00000000
!	Mem[000000001008141c] = 000000ff, %l3 = 00000000000000ff
	swap	[%i2+0x01c],%l3		! %l3 = 00000000000000ff
!	%l0 = 00000000ff000000, Mem[0000000010141408] = 00000000
	stha	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%l4 = 0000000000000000, Mem[0000000010081410] = ffffffff
	stwa	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101414] = db0dffff, %l6 = 0000000000000004
	ldsba	[%i4+0x014]%asi,%l6	! %l6 = ffffffffffffffdb

p0_label_291:
!	Mem[00000000100c1410] = 0000000000000000, %l4 = 0000000000000000
	ldxa	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041400] = 045db2240000ffff, %l4 = 0000000000000000
	ldxa	[%i1+%g0]0x88,%l4	! %l4 = 045db2240000ffff
!	Mem[0000000010101400] = ffffffff, %f0  = ff005d04
	lda	[%i4+%g0]0x88,%f0 	! %f0 = ffffffff
!	Mem[0000000010101408] = 00000000, %l5 = 0000000000000000
	lduha	[%i4+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0000] = 00ff8ea0, %l3 = 00000000000000ff
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081400] = ff000000, %l1 = 00000000ff610021
	ldsha	[%i2+%g0]0x80,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000010141400] = 0000ffff, %l3 = 00000000000000ff
	ldsha	[%i5+0x002]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000211c0000] = 00ff3487, %l2 = 00000000ff0000ff
	ldsba	[%o2+0x000]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141404] = 00000000, %l2 = 0000000000000000
	lduha	[%i5+0x004]%asi,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 00000000, %l1 = ffffffffffffff00
	swapa	[%i5+%g0]0x89,%l1	! %l1 = 0000000000000000

p0_label_292:
!	Mem[0000000010181410] = fed7b767, %l7 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l7	! %l7 = 00000000fed7b767
!	%l7 = 00000000fed7b767, %l1 = 0000000000000000, %l2 = 0000000000000000
	subc	%l7,%l1,%l2		! %l2 = 00000000fed7b767
!	%l6 = ffffffffffffffdb, Mem[0000000030041408] = 000000ff
	stha	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000ffdb
!	Mem[0000000010141408] = 0000000300000000, %f2  = 21000000 210061ff
	ldda	[%i5+%o4]0x88,%f2 	! %f2  = 00000003 00000000
!	%l7 = 00000000fed7b767, Mem[0000000010001400] = ff000000
	stha	%l7,[%i0+%g0]0x80	! Mem[0000000010001400] = b7670000
!	Mem[0000000010041403] = ffff0000, %l6 = ffffffffffffffdb
	ldstub	[%i1+0x003],%l6		! %l6 = 00000000000000ff
!	%l6 = 00000000, %l7 = fed7b767, Mem[0000000030081400] = 210061ff 00000000
	stda	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000 fed7b767
!	%l2 = fed7b767, %l3 = ffffffff, Mem[0000000030181408] = 00000000 21000000
	stda	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = fed7b767 ffffffff
!	Mem[00000000100c1428] = ffff0000, %l3 = ffffffffffffffff, %asi = 80
	swapa	[%i3+0x028]%asi,%l3	! %l3 = 00000000ffff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ffff687b, %f15 = f200807f
	lda	[%i6+0x000]%asi,%f15	! %f15 = ffff687b

p0_label_293:
!	Mem[0000000010041430] = 210000005fb27bff, %f0  = ffffffff 00001f9d
	ldda	[%i1+0x030]%asi,%f0 	! %f0  = 21000000 5fb27bff
!	Mem[0000000010181410] = 00000000, %l5 = 0000000000000000
	lduha	[%i6+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = 000000ff, %l5 = 0000000000000000
	lduha	[%i2+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101400] = ffffffff, %l3 = 00000000ffff0000
	lduba	[%i4+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181400] = ffff687b, %l4 = 045db2240000ffff
	lduba	[%i6+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Code Fragment 4
p0_fragment_24:
!	%l0 = 00000000ff000000
	setx	0x311c2677ff39f156,%g7,%l0 ! %l0 = 311c2677ff39f156
!	%l1 = 0000000000000000
	setx	0x8abd10eff1573acd,%g7,%l1 ! %l1 = 8abd10eff1573acd
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 311c2677ff39f156
	setx	0xfd305a678468f4c6,%g7,%l0 ! %l0 = fd305a678468f4c6
!	%l1 = 8abd10eff1573acd
	setx	0x1da87b587c985fc3,%g7,%l1 ! %l1 = 1da87b587c985fc3
!	Mem[0000000030001408] = 00000000 00000000, %l6 = 00000000, %l7 = fed7b767
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030001408] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i0+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	%f7  = 00000021, %f12 = 00000000, %f6  = ff000000
	fmuls	%f7 ,%f12,%f6 		! %f6  = 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 470100ff, %l1 = 1da87b587c985fc3
	swapa	[%i1+%o5]0x89,%l1	! %l1 = 00000000470100ff

p0_label_294:
!	%l3 = 00000000000000ff, Mem[0000000030141410] = 00000000
	stba	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000ff
!	Mem[0000000030141408] = db0dffff, %l7 = 0000000000000000
	swapa	[%i5+%o4]0x89,%l7	! %l7 = 00000000db0dffff
!	%l0 = fd305a678468f4c6, Mem[0000000010081408] = 0000000000000000
	stxa	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = fd305a678468f4c6
!	%f22 = ffffffff f200807f, Mem[00000000300c1400] = ffffffff d138ff74
	stda	%f22,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffff f200807f
!	Mem[0000000010141410] = ffffffff, %l4 = 00000000000000ff
	ldstuba	[%i5+%o5]0x80,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030081408] = 21000000, %l0 = fd305a678468f4c6
	ldstuba	[%i2+%o4]0x81,%l0	! %l0 = 00000021000000ff
!	Mem[00000000100c1400] = 00000000, %l4 = 00000000000000ff
	swapa	[%i3+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181400] = 7b68ffff, %l7 = 00000000db0dffff
	swapa	[%i6+%g0]0x88,%l7	! %l7 = 000000007b68ffff
!	%l6 = 0000000000000000, Mem[0000000010141418] = ffffffff, %asi = 80
	stha	%l6,[%i5+0x018]%asi	! Mem[0000000010141418] = 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181404] = ffffffff, %f18 = ff0000ff
	ld	[%i6+0x004],%f18	! %f18 = ffffffff

p0_label_295:
!	Mem[00000000100c1410] = 00000000 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i3+%o5]0x88,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010181410] = a2a49fb000000000, %l2 = 00000000fed7b767
	ldxa	[%i6+%o5]0x88,%l2	! %l2 = a2a49fb000000000
!	Mem[0000000020800000] = 00004ebd, %l2 = a2a49fb000000000
	lduh	[%o1+%g0],%l2		! %l2 = 0000000000000000
!	Mem[0000000030041410] = c35f987c, %l1 = 00000000470100ff
	lduha	[%i1+%o5]0x81,%l1	! %l1 = 000000000000c35f
!	Mem[0000000030181410] = 045d00ff, %l7 = 000000007b68ffff
	ldsba	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000004
!	Mem[0000000010041408] = ff000000, %l7 = 0000000000000004
	ldswa	[%i1+%o4]0x80,%l7	! %l7 = ffffffffff000000
!	Mem[0000000030081408] = ff000000, %l1 = 000000000000c35f
	ldsha	[%i2+%o4]0x81,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000010101428] = 00000000, %l5 = 0000000000000000
	ldswa	[%i4+0x028]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0000] = 00ff8ea0, %l2 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 00000021, %l1 = ffffff00, Mem[0000000030001400] = 61ff00ff 7b68038d
	stda	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000021 ffffff00

p0_label_296:
!	%l3 = 00000000000000ff, Mem[0000000030081400] = 00000000
	stha	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = 00ff0000
!	%f18 = ffffffff, Mem[0000000030081400] = 0000ff00
	sta	%f18,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffff
!	Mem[0000000030081408] = ff000000, %l7 = ffffffffff000000
	ldstuba	[%i2+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030001400] = 00000021, %l4 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000021
!	Mem[0000000030001400] = 00000000, %l4 = 0000000000000021
	swapa	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%l3 = 00000000000000ff, Mem[0000000030041408] = dbff0000
	stha	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 00ff0000
!	%f28 = 74ff38d1 ffffffff, %l0 = 0000000000000021
!	Mem[0000000030001418] = 21000000210061ff
	add	%i0,0x018,%g1
	stda	%f28,[%g1+%l0]ASI_PST8_S ! Mem[0000000030001418] = 21003800210061ff
!	Mem[0000000010101400] = ffffffff, %l4 = 0000000000000000
	ldstuba	[%i4+%g0]0x80,%l4	! %l4 = 000000ff000000ff
!	%f12 = 00000000 03000000, Mem[0000000010141408] = 00000000 00000003
	stda	%f12,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 03000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00000000, %l5 = 0000000000000000
	lduba	[%i5+%o4]0x81,%l5	! %l5 = 0000000000000000

p0_label_297:
!	Mem[0000000030081408] = 000000ff, %f19 = db0dffff
	lda	[%i2+%o4]0x89,%f19	! %f19 = 000000ff
!	Mem[0000000030081408] = 000000ff, %l2 = 00000000000000ff
	lduba	[%i2+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%l0 = 0000000000000021, %l7 = 00000000000000ff, %l6 = 0000000000000000
	and	%l0,%l7,%l6		! %l6 = 0000000000000021
!	Mem[00000000300c1410] = 24b20000, %l0 = 0000000000000021
	ldsba	[%i3+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = ffffffff, %l7 = 00000000000000ff
	ldsha	[%i4+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	%l7 = ffffffffffffffff, %l5 = 0000000000000000, %l1 = ffffffffffffff00
	xnor	%l7,%l5,%l1		! %l1 = 0000000000000000
!	Mem[00000000201c0000] = 00ff8ea0, %l6 = 0000000000000021
	ldsba	[%o0+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181400] = ffffffff db0dffff, %l2 = 000000ff, %l3 = 000000ff
	ldda	[%i6+%g0]0x88,%l2	! %l2 = 00000000db0dffff 00000000ffffffff
!	Mem[0000000030041408] = 0000ff00, %f2  = 00000003
	lda	[%i1+%o4]0x89,%f2 	! %f2 = 0000ff00
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = fd305a67, %l7 = ffffffffffffffff
	ldstuba	[%i2+%o4]0x80,%l7	! %l7 = 000000fd000000ff

p0_label_298:
!	%l1 = 0000000000000000, Mem[0000000010101410] = 470100ff
	stwa	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	Mem[0000000030101408] = 00000000, %l3 = 00000000ffffffff
	ldstuba	[%i4+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000010081410] = 00000000
	stba	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	Mem[0000000010181408] = 03b21f9d00000000, %l6 = 0000000000000000, %l6 = 0000000000000000
	add	%i6,0x08,%g1
	casxa	[%g1]0x80,%l6,%l6	! %l6 = 03b21f9d00000000
!	%l7 = 00000000000000fd, Mem[0000000010141428] = 00000000, %asi = 80
	stwa	%l7,[%i5+0x028]%asi	! Mem[0000000010141428] = 000000fd
!	Mem[0000000010101408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081410] = ffff0000, %l0 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l0	! %l0 = 00000000ffff0000
!	%l5 = 0000000000000000, Mem[00000000100c1408] = ff0000ff
	stba	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ff
!	%l3 = 0000000000000000, Mem[0000000030181408] = fed7b767
	stha	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = fed70000
!	Starting 10 instruction Load Burst
!	%f9  = 00000000, %f4  = ffffffff
	fcmps	%fcc1,%f9 ,%f4 		! %fcc1 = 3

p0_label_299:
!	Mem[0000000010001400] = b7670000 00000000, %l0 = ffff0000, %l1 = 00000000
	ldda	[%i0+%g0]0x80,%l0	! %l0 = 00000000b7670000 0000000000000000
!	Mem[0000000030181408] = 0000d7fe ffffffff, %l6 = 00000000, %l7 = 000000fd
	ldda	[%i6+%o4]0x81,%l6	! %l6 = 000000000000d7fe 00000000ffffffff
!	Mem[00000000100c141c] = 00000000, %l4 = 00000000000000ff
	lduwa	[%i3+0x01c]%asi,%l4	! %l4 = 0000000000000000
!	Code Fragment 3
p0_fragment_25:
!	%l0 = 00000000b7670000
	setx	0x7deff4706b8b0262,%g7,%l0 ! %l0 = 7deff4706b8b0262
!	%l1 = 0000000000000000
	setx	0x67330178303adfa6,%g7,%l1 ! %l1 = 67330178303adfa6
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7deff4706b8b0262
	setx	0x76d633503f43f4c3,%g7,%l0 ! %l0 = 76d633503f43f4c3
!	%l1 = 67330178303adfa6
	setx	0xae9775387bc675ef,%g7,%l1 ! %l1 = ae9775387bc675ef
!	Mem[0000000020800040] = ffffc0bd, %l3 = 0000000000000000
	lduba	[%o1+0x040]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141408] = 00000000, %l6 = 000000000000d7fe
	lduwa	[%i5+%o4]0x81,%l6	! %l6 = 0000000000000000
!	%f15 = ffff687b, %f14 = 00000000
	fcmpes	%fcc0,%f15,%f14		! %fcc0 = 3
!	Mem[0000000030101400] = ff000000, %l0 = 76d633503f43f4c3
	ldswa	[%i4+%g0]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[0000000030101400] = ff610021000000ff, %f8  = 21000000 00000000
	ldda	[%i4+%g0]0x89,%f8 	! %f8  = ff610021 000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 000000ff, %l7 = 00000000ffffffff
	swapa	[%i6+%g0]0x89,%l7	! %l7 = 00000000000000ff

p0_label_300:
!	Mem[00000000100c1408] = ff000000, %l3 = 00000000000000ff
	ldstuba	[%i3+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010081400] = ff000000000000ff, %asi = 80
	stxa	%l4,[%i2+0x000]%asi	! Mem[0000000010081400] = 0000000000000000
!	Mem[0000000030181400] = ffffffff, %l0 = ffffffffff000000
	swapa	[%i6+%g0]0x89,%l0	! %l0 = 00000000ffffffff
!	%l4 = 0000000000000000, immed = 00000870, %y  = 0000008a
	umul	%l4,0x870,%l4		! %l4 = 0000000000000000, %y = 00000000
!	%l6 = 0000000000000000, Mem[0000000030181400] = ff000000
	stwa	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	%l4 = 0000000000000000, %l0 = 00000000ffffffff, %l0 = 00000000ffffffff
	or	%l4,%l0,%l0		! %l0 = 00000000ffffffff
!	Mem[00000000100c1400] = 000000ff, %l3 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030101408] = ff000000, %l3 = 00000000000000ff
	swapa	[%i4+%o4]0x81,%l3	! %l3 = 00000000ff000000
!	%l6 = 0000000000000000, Mem[0000000010001425] = 000000ff, %asi = 80
	stba	%l6,[%i0+0x025]%asi	! Mem[0000000010001424] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 0000ffff, %f6  = 00000000
	lda	[%i5+%g0]0x80,%f6 	! %f6 = 0000ffff

p0_label_301:
!	Mem[00000000201c0000] = 00ff8ea0, %l3 = 00000000ff000000
	lduba	[%o0+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101428] = 000000007b68038d, %f30 = 318eab04 24b20000
	ldd	[%i4+0x028],%f30	! %f30 = 00000000 7b68038d
!	Mem[0000000010141408] = 00000003 00000000, %l0 = ffffffff, %l1 = 7bc675ef
	ldda	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000003 0000000000000000
!	Mem[0000000010081400] = 0000000000000000, %f12 = 00000000 03000000
	ldda	[%i2+%g0]0x80,%f12	! %f12 = 00000000 00000000
!	Mem[0000000010041408] = 000000ff, %l5 = 0000000000000000
	ldsba	[%i1+%o4]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010081408] = 675a30ff, %l0 = 0000000000000003
	ldsba	[%i2+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010041408] = ff000000, %f16 = 045d00ff
	lda	[%i1+%o4]0x80,%f16	! %f16 = ff000000
!	Mem[0000000010001408] = 318eab04, %l6 = 0000000000000000
	lduba	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000031
!	Mem[00000000300c1408] = 00000147, %f26 = ffffffff
	lda	[%i3+%o4]0x89,%f26	! %f26 = 00000147
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffffff, Mem[0000000030181408] = 0000d7fe
	stwa	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffffff

p0_label_302:
!	%l0 = ffffffffffffffff, Mem[00000000218000c1] = ffff5cf4
	stb	%l0,[%o3+0x0c1]		! Mem[00000000218000c0] = ffff5cf4
!	Mem[00000000300c1400] = ffffffff, %l7 = 00000000000000ff
	swapa	[%i3+%g0]0x81,%l7	! %l7 = 00000000ffffffff
!	%l2 = 00000000db0dffff, Mem[0000000010041410] = 0000002100000000
	stxa	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000db0dffff
!	Code Fragment 4
p0_fragment_26:
!	%l0 = ffffffffffffffff
	setx	0x3d290b703d1357f4,%g7,%l0 ! %l0 = 3d290b703d1357f4
!	%l1 = 0000000000000000
	setx	0x120ef2d7b0e0ae9f,%g7,%l1 ! %l1 = 120ef2d7b0e0ae9f
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3d290b703d1357f4
	setx	0xc4c5947fdde359a9,%g7,%l0 ! %l0 = c4c5947fdde359a9
!	%l1 = 120ef2d7b0e0ae9f
	setx	0x4ca5985feff20a02,%g7,%l1 ! %l1 = 4ca5985feff20a02
!	Mem[0000000010101408] = 000000ff, %l5 = ffffffffffffffff
	swapa	[%i4+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001400] = 00000021, %l0 = c4c5947fdde359a9
	ldstuba	[%i0+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	%l0 = 00000000, %l1 = eff20a02, Mem[0000000030081408] = ff000000 00000000
	stda	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000 eff20a02
!	%l2 = 00000000db0dffff, Mem[00000000100c1400] = ff000000
	stha	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffff0000
!	%f26 = 00000147 000000ff, Mem[0000000030001410] = ff610021 00000000
	stda	%f26,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000147 000000ff
!	Starting 10 instruction Load Burst
!	%f4  = ffffffff, %f20 = 7b6800ff, %f1  = 5fb27bff
	fsubs	%f4 ,%f20,%f1 		! %f1  = ffffffff

p0_label_303:
!	%l2 = 00000000db0dffff, Mem[0000000030081400] = ffffffff
	stba	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffffff
!	Mem[00000000201c0000] = 00ff8ea0, %l0 = 0000000000000000
	ldsba	[%o0+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l7 = 00000000ffffffff
	lduha	[%i1+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = 00000147, %l3 = 00000000000000ff
	ldswa	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000147
!	Mem[0000000030181408] = ffffffff, %l4 = 0000000000000000
	ldswa	[%i6+%o4]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041414] = db0dffff, %l7 = 0000000000000000
	ldsb	[%i1+0x016],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000030081410] = 8d03687b 00000000, %l4 = ffffffff, %l5 = 000000ff
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000 000000008d03687b
!	Mem[0000000010101410] = 00000000, %l7 = ffffffffffffffff
	lduha	[%i4+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101408] = ffffffff000000ff, %l4 = 0000000000000000
	ldxa	[%i4+0x008]%asi,%l4	! %l4 = ffffffff000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[00000000300c1408] = 47010000000000ff
	stxa	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000000000000

p0_label_304:
!	%f0  = 21000000, Mem[0000000030181408] = ffffffff
	sta	%f0 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 21000000
!	%f4  = ffffffff ff000000, Mem[0000000030101410] = ff000000 ffffdb0d
	stda	%f4 ,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffffff ff000000
!	%l2 = db0dffff, %l3 = 00000147, Mem[0000000010081428] = 24b25d04 ab0300ff
	stda	%l2,[%i2+0x028]%asi	! Mem[0000000010081428] = db0dffff 00000147
!	Mem[0000000030041400] = 00000000, %l3 = 0000000000000147
	swapa	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010141408] = 00000003
	stba	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000003
!	%l5 = 000000008d03687b, Mem[0000000030181408] = 00000021
	stba	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000007b
!	%l2 = db0dffff, %l3 = 00000000, Mem[0000000030181408] = 0000007b ffffffff
	stda	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = db0dffff 00000000
!	%l0 = 0000000000000000, Mem[0000000010081400] = 00000000, %asi = 80
	stwa	%l0,[%i2+0x000]%asi	! Mem[0000000010081400] = 00000000
!	%l4 = ffffffff000000ff, %l6 = 0000000000000031, %y  = 00000000
	smul	%l4,%l6,%l7		! %l7 = 00000000000030cf, %y = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 045d00ff7c985fc3, %l4 = ffffffff000000ff
	ldxa	[%i1+%o5]0x89,%l4	! %l4 = 045d00ff7c985fc3

p0_label_305:
!	%l3 = 0000000000000000, immed = fffff258, %y  = 00000000
	smul	%l3,-0xda8,%l6		! %l6 = 0000000000000000, %y = 00000000
!	Mem[0000000030041408] = 00ff0000, %f9  = 000000ff
	lda	[%i1+%o4]0x81,%f9 	! %f9 = 00ff0000
!	Mem[0000000010181400] = ffff0ddb, %l6 = 0000000000000000
	ldsha	[%i6+%g0]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081408] = ff305a67, %l5 = 000000008d03687b
	ldsba	[%i2+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010041428] = 00008e617b68038d, %f20 = 7b6800ff 00000000
	ldd	[%i1+0x028],%f20	! %f20 = 00008e61 7b68038d
!	Mem[0000000010041410] = 00000000, %l6 = ffffffffffffffff
	ldswa	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000000
!	%f22 = ffffffff, %f24 = 80000000, %f17 = 00000000
	fsubs	%f22,%f24,%f17		! %f17 = ffffffff
!	Mem[0000000010101400] = ffffffff, %l1 = 4ca5985feff20a02
	ldswa	[%i4+%g0]0x88,%l1	! %l1 = ffffffffffffffff
!	%l5 = ffffffffffffffff, imm = 0000000000000289, %l0 = 0000000000000000
	or	%l5,0x289,%l0		! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010041410] = 00000000
	stwa	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000

p0_label_306:
!	%l1 = ffffffffffffffff, Mem[0000000010141410] = ffffffff
	stwa	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = ffffffff
!	%l7 = 00000000000030cf, Mem[0000000010181410] = 00000000
	stwa	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = 000030cf
!	Mem[0000000030041410] = 7c985fc3, %l1 = ffffffffffffffff
	swapa	[%i1+%o5]0x89,%l1	! %l1 = 000000007c985fc3
!	Mem[0000000010141410] = ffffffff, %l0 = ffffffffffffffff
	ldstuba	[%i5+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	%l0 = 000000ff, %l1 = 7c985fc3, Mem[0000000010181410] = 000030cf b09fa4a2
	stda	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000ff 7c985fc3
!	Mem[0000000030041400] = 00000147, %l2 = 00000000db0dffff
	swapa	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000147
!	%l2 = 0000000000000147, Mem[00000000100c1400] = ffff0000
	stha	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 01470000
!	%l2 = 0000000000000147, Mem[000000001018140e] = 00000000, %asi = 80
	stha	%l2,[%i6+0x00e]%asi	! Mem[000000001018140c] = 00000147
!	Mem[0000000010041400] = ffff00ff, %l6 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l6	! %l6 = 00000000ffff00ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff305a67, %l1 = 000000007c985fc3
	lduba	[%i2+%o4]0x80,%l1	! %l1 = 00000000000000ff

p0_label_307:
!	Mem[00000000218000c0] = ffff5cf4, %l2 = 0000000000000147
	ldsha	[%o3+0x0c0]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010041400] = 00000000 24b25d04, %l2 = ffffffff, %l3 = 00000000
	ldda	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000 0000000024b25d04
!	Mem[0000000010041434] = 5fb27bff, %l7 = 00000000000030cf
	ldsha	[%i1+0x034]%asi,%l7	! %l7 = 0000000000005fb2
!	Mem[0000000010081410] = 00000000045d00ff, %f20 = 00008e61 7b68038d
	ldda	[%i2+%o5]0x80,%f20	! %f20 = 00000000 045d00ff
!	Mem[00000000211c0000] = 00ff3487, %l5 = ffffffffffffffff
	ldub	[%o2+0x001],%l5		! %l5 = 00000000000000ff
!	Mem[00000000300c1410] = 318eab0424b20000, %l1 = 00000000000000ff
	ldxa	[%i3+%o5]0x89,%l1	! %l1 = 318eab0424b20000
!	Mem[0000000030041410] = 045d00ffffffffff, %f2  = 0000ff00 00000000
	ldda	[%i1+%o5]0x89,%f2 	! %f2  = 045d00ff ffffffff
!	Mem[0000000030041400] = ffff0ddb, %l5 = 00000000000000ff
	ldsha	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000ddb
!	Mem[0000000010101408] = ffffffff000000ff, %l0 = 00000000000000ff
	ldxa	[%i4+%o4]0x80,%l0	! %l0 = ffffffff000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 000000ff, %l0 = ffffffff000000ff
	swapa	[%i1+%o4]0x88,%l0	! %l0 = 00000000000000ff

p0_label_308:
!	%f16 = ff000000, Mem[0000000030181410] = 045d00ff
	sta	%f16,[%i6+%o5]0x81	! Mem[0000000030181410] = ff000000
!	%f19 = 000000ff, %f13 = 00000000, %f13 = 00000000
	fsubs	%f19,%f13,%f13		! %l0 = 0000000000000121, Unfinished, %fsr = 2700000c00
!	%l0 = 0000000000000121, Mem[00000000300c1410] = 24b20000
	stba	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 24b20021
!	%f28 = 74ff38d1 ffffffff, Mem[0000000010001400] = b7670000 00000000
	stda	%f28,[%i0+%g0]0x80	! Mem[0000000010001400] = 74ff38d1 ffffffff
!	Mem[0000000021800181] = ff5a6a7f, %l7 = 0000000000005fb2
	ldstuba	[%o3+0x181]%asi,%l7	! %l7 = 0000005a000000ff
!	%f31 = 7b68038d, Mem[0000000030181410] = ff000000
	sta	%f31,[%i6+%o5]0x81	! Mem[0000000030181410] = 7b68038d
!	Mem[00000000100c143c] = ffffffff, %l1 = 24b20000, %l5 = 00000ddb
	add	%i3,0x3c,%g1
	casa	[%g1]0x80,%l1,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010041414] = db0dffff, %l1 = 318eab0424b20000
	swap	[%i1+0x014],%l1		! %l1 = 00000000db0dffff
!	%l5 = 00000000ffffffff, Mem[0000000020800000] = 00004ebd, %asi = 80
	stha	%l5,[%o1+0x000]%asi	! Mem[0000000020800000] = ffff4ebd
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 0000b224 04ab8e31, %l0 = 00000121, %l1 = db0dffff
	ldda	[%i0+%o4]0x88,%l0	! %l0 = 0000000004ab8e31 000000000000b224

p0_label_309:
!	Mem[0000000010001404] = ffffffff, %l0 = 0000000004ab8e31
	ldsh	[%i0+0x004],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000030081408] = 00000000, %l6 = 00000000ffff00ff
	lduba	[%i2+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001408] = 318eab04, %l6 = 0000000000000000
	ldswa	[%i0+%o4]0x80,%l6	! %l6 = 00000000318eab04
!	%f15 = ffff687b, %f5  = ff000000
	fcmpes	%fcc2,%f15,%f5 		! %fcc2 = 3
!	Mem[00000000100c1410] = 0000000000000000, %f8  = ff610021 00ff0000
	ldda	[%i3+%o5]0x80,%f8 	! %f8  = 00000000 00000000
!	Mem[00000000218001c0] = 890008e2, %l6 = 00000000318eab04
	ldsb	[%o3+0x1c0],%l6		! %l6 = ffffffffffffff89
!	Mem[0000000010101400] = ffffffff, %l6 = ffffffffffffff89
	ldswa	[%i4+%g0]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030181400] = 00000000, %l0 = ffffffffffffffff
	ldsha	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %f21 = 045d00ff
	lda	[%i2+%o5]0x89,%f21	! %f21 = 00000000
!	Starting 10 instruction Store Burst
!	%f0  = 21000000 ffffffff 045d00ff ffffffff
!	%f4  = ffffffff ff000000 0000ffff 00000021
!	%f8  = 00000000 00000000 00000000 00000000
!	%f12 = 00000000 00000000 00000000 ffff687b
	stda	%f0,[%i1]ASI_BLK_AIUS	! Block Store to 0000000030041400

p0_label_310:
!	%l6 = ffffffff, %l7 = 0000005a, Mem[0000000010041408] = 000000ff ff610021
	stda	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffffff 0000005a
!	%f30 = 00000000 7b68038d, Mem[0000000010181410] = ff000000 c35f987c
	stda	%f30,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000 7b68038d
!	Mem[0000000030141410] = 000000ff, %l3 = 0000000024b25d04
	swapa	[%i5+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	%l1 = 000000000000b224, Mem[0000000010181408] = 9d1fb203
	stwa	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000b224
!	%l3 = 00000000000000ff, Mem[0000000010141400] = 0000ffff00000000
	stxa	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000000000ff
!	%l1 = 000000000000b224, Mem[0000000030101410] = ffffffff
	stwa	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000b224
!	Mem[0000000010181408] = 0000b224, %l3 = 00000000000000ff
	ldstuba	[%i6+%o4]0x88,%l3	! %l3 = 00000024000000ff
!	%l6 = ffffffff, %l7 = 0000005a, Mem[00000000300c1410] = 2100b224 04ab8e31
	stda	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffffff 0000005a
!	%f20 = 00000000 00000000, %l7 = 000000000000005a
!	Mem[0000000010001408] = 318eab0424b20000
	add	%i0,0x008,%g1
	stda	%f20,[%g1+%l7]ASI_PST8_P ! Mem[0000000010001408] = 3100ab0000b20000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00000000, %l0 = 0000000000000000
	ldsha	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000000

p0_label_311:
!	Mem[0000000010101400] = ffffffff d138ff74, %l4 = 7c985fc3, %l5 = ffffffff
	ldda	[%i4+%g0]0x80,%l4	! %l4 = 00000000ffffffff 00000000d138ff74
!	Mem[0000000010101400] = 74ff38d1ffffffff, %f24 = 80000000 24b25d04
	ldda	[%i4+%g0]0x88,%f24	! %f24 = 74ff38d1 ffffffff
!	Mem[0000000020800040] = ffffc0bd, %l5 = 00000000d138ff74
	ldsba	[%o1+0x040]%asi,%l5	! %l5 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (44)
!	Mem[0000000010041400] = 00000000, %l0 = 0000000000000000
	lduha	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041410] = 0000000024b20000, %f12 = 00000000 00000000
	ldda	[%i1+%o5]0x80,%f12	! %f12 = 00000000 24b20000
!	Mem[00000000100c1410] = 00000000, %l1 = 000000000000b224
	ldsha	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000218000c0] = ffff5cf4, %l6 = ffffffffffffffff
	lduha	[%o3+0x0c0]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[00000000100c1400] = 00004701, %l2 = 0000000000000000
	ldsba	[%i3+%g0]0x88,%l2	! %l2 = 0000000000000001
!	Mem[00000000201c0000] = 00ff8ea0, %l3 = 0000000000000024
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f14 = 00000000 ffff687b, Mem[0000000010141408] = 00000003 00000000
	stda	%f14,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000 ffff687b

p0_label_312:
!	%f24 = 74ff38d1 ffffffff, Mem[0000000030041410] = ffffffff 000000ff
	stda	%f24,[%i1+%o5]0x89	! Mem[0000000030041410] = 74ff38d1 ffffffff
!	%l4 = 00000000ffffffff, Mem[0000000010141410] = ffffffff
	stba	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = ffffffff
!	%f16 = ff000000 ffffffff, %l1 = 0000000000000000
!	Mem[0000000010081408] = ff305a678468f4c6
	add	%i2,0x008,%g1
	stda	%f16,[%g1+%l1]ASI_PST32_P ! Mem[0000000010081408] = ff305a678468f4c6
!	%f18 = ffffffff 000000ff, %l4 = 00000000ffffffff
!	Mem[0000000010141408] = 00000000ffff687b
	add	%i5,0x008,%g1
	stda	%f18,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010141408] = ff000000ffffffff
!	Mem[0000000010141408] = ff000000, %l3 = 00000000000000ff
	swapa	[%i5+%o4]0x80,%l3	! %l3 = 00000000ff000000
!	%f16 = ff000000 ffffffff ffffffff 000000ff
!	%f20 = 00000000 00000000 ffffffff f200807f
!	%f24 = 74ff38d1 ffffffff 00000147 000000ff
!	%f28 = 74ff38d1 ffffffff 00000000 7b68038d
	stda	%f16,[%i5]ASI_COMMIT_S	! Block Store to 0000000030141400
!	%l7 = 000000000000005a, Mem[0000000010041400] = 00000000
	stba	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000005a
!	%l3 = 00000000ff000000, Mem[0000000010041408] = ffffffff5a000000
	stxa	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000ff000000
!	Mem[000000001000142a] = ffffffff, %l3 = 00000000ff000000
	ldstuba	[%i0+0x02a]%asi,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000000 00000000, %l0 = 00000000, %l1 = 00000000
	ldd	[%i2+%g0],%l0		! %l0 = 0000000000000000 0000000000000000

p0_label_313:
	membar	#Sync			! Added by membar checker (45)
!	Mem[0000000030141408] = ffffffff, %l7 = 000000000000005a
	ldsha	[%i5+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000100c1408] = ff0000ff, %l3 = 00000000000000ff
	ldsba	[%i3+%o4]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030001408] = 000000ff, %l7 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x89,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030101408] = ff000000, %l0 = 0000000000000000
	ldsha	[%i4+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181400] = 00000000 00000000, %l2 = 00000001, %l3 = ffffffff
	ldda	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010041410] = 00000000, %f31 = 7b68038d
	lda	[%i1+%o5]0x80,%f31	! %f31 = 00000000
!	Mem[0000000010081410] = 00000000, %l5 = ffffffffffffffff
	lduha	[%i2+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041408] = 00000000 ff000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i1+%o4]0x80,%l2	! %l2 = 0000000000000000 00000000ff000000
!	Mem[0000000030181400] = 00000000 00000000 ffff0ddb 00000000
!	Mem[0000000030181410] = 7b68038d 00000000 83cf7f40 ff18b28f
!	Mem[0000000030181420] = 00000003 7b68038d 2e824d80 0000ffff
!	Mem[0000000030181430] = 00000000 000000ff 000000c8 edbe00c3
	ldda	[%i6]ASI_BLK_S,%f16	! Block Load from 0000000030181400
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = db0dffff, %l4 = 00000000ffffffff
	swapa	[%i6+%o4]0x89,%l4	! %l4 = 00000000db0dffff

p0_label_314:
!	Mem[0000000030141410] = 00000000, %l6 = 000000000000ffff
	ldstuba	[%i5+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101408] = 000000ff, %l7 = 00000000000000ff
	swapa	[%i4+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[00000000201c0000] = 00ff8ea0, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00008ea0
!	%f16 = 00000000 00000000 ffff0ddb 00000000
!	%f20 = 7b68038d 00000000 83cf7f40 ff18b28f
!	%f24 = 00000003 7b68038d 2e824d80 0000ffff
!	%f28 = 00000000 000000ff 000000c8 edbe00c3
	stda	%f16,[%i2]ASI_BLK_AIUSL	! Block Store to 0000000030081400
!	%f14 = 00000000 ffff687b, %l5 = 0000000000000000
!	Mem[0000000030081430] = ff00000000000000
	add	%i2,0x030,%g1
	stda	%f14,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030081430] = ff00000000000000
!	%f14 = 00000000 ffff687b, %l1 = 0000000000000000
!	Mem[0000000030141408] = ffffffff000000ff
	add	%i5,0x008,%g1
	stda	%f14,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030141408] = ffffffff000000ff
!	Mem[0000000010001400] = d138ff74, %l2 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l2	! %l2 = 00000000d138ff74
!	%l3 = 00000000ff000000, imm = fffffffffffff904, %l6 = 0000000000000000
	sub	%l3,-0x6fc,%l6		! %l6 = 00000000ff0006fc
!	%l4 = 00000000db0dffff, Mem[00000000100c1408] = ff0000ff
	stba	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff0000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (46)
!	Mem[0000000010081410] = 00000000045d00ff, %l5 = 0000000000000000
	ldxa	[%i2+%o5]0x80,%l5	! %l5 = 00000000045d00ff

p0_label_315:
!	Mem[00000000300c1410] = 5a000000 ffffffff, %l6 = ff0006fc, %l7 = 000000ff
	ldda	[%i3+%o5]0x89,%l6	! %l6 = 00000000ffffffff 000000005a000000
!	Mem[0000000030101400] = ff000000210061ff, %f8  = 00000000 00000000
	ldda	[%i4+%g0]0x81,%f8 	! %f8  = ff000000 210061ff
!	Mem[000000001010143c] = ff0003ff, %l2 = 00000000d138ff74
	lduba	[%i4+0x03d]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000211c0000] = 00ff3487, %l5 = 00000000045d00ff
	ldsb	[%o2+%g0],%l5		! %l5 = 0000000000000000
!	Mem[0000000021800100] = ff900b85, %l3 = 00000000ff000000
	lduba	[%o3+0x100]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[00000000211c0000] = 00ff3487, %l0 = 0000000000000000
	ldsb	[%o2+0x001],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010101408] = ffffffff, %l6 = 00000000ffffffff
	lduba	[%i4+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081410] = 00000000, %l6 = 00000000000000ff
	lduba	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041410] = 74ff38d1ffffffff, %f8  = ff000000 210061ff
	ldda	[%i1+%o5]0x89,%f8 	! %f8  = 74ff38d1 ffffffff
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000020800000] = ffff4ebd, %asi = 80
	stha	%l2,[%o1+0x000]%asi	! Mem[0000000020800000] = 00004ebd

p0_label_316:
!	Mem[000000001008140c] = 8468f4c6, %l4 = db0dffff, %l1 = 00000000
	add	%i2,0x0c,%g1
	casa	[%g1]0x80,%l4,%l1	! %l1 = 000000008468f4c6
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000030081410] = 00000000 7b68038d
	stda	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000 000000ff
!	%l2 = 0000000000000000, Mem[0000000010181420] = 00000000, %asi = 80
	stwa	%l2,[%i6+0x020]%asi	! Mem[0000000010181420] = 00000000
!	%l5 = 0000000000000000, Mem[0000000010081400] = 00000000
	stwa	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	%l3 = 00000000000000ff, Mem[0000000010181410] = 8d03687b
	stwa	%l3,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000ff
!	%l1 = 000000008468f4c6, Mem[0000000010041434] = 5fb27bff, %asi = 80
	stwa	%l1,[%i1+0x034]%asi	! Mem[0000000010041434] = 8468f4c6
!	Mem[00000000100c1414] = 00000000, %l5 = 0000000000000000
	swap	[%i3+0x014],%l5		! %l5 = 0000000000000000
!	Mem[00000000300c1410] = ffffffff, %l6 = 0000000000000000
	ldstuba	[%i3+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010181410] = ff000000, %l1 = 000000008468f4c6
	ldstuba	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000000 00000000, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000000 0000000000000000

p0_label_317:
!	Mem[0000000010001410] = ff0000ff, %f23 = ff18b28f
	lda	[%i0+%o5]0x88,%f23	! %f23 = ff0000ff
!	Mem[00000000201c0000] = 00008ea0, %l5 = 0000000000000000
	ldsb	[%o0+%g0],%l5		! %l5 = 0000000000000000
!	Mem[0000000010101418] = ffff0000, %l3 = 0000000000000000
	ldsh	[%i4+0x018],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030041400] = ffffffff00000021, %f20 = 7b68038d 00000000
	ldda	[%i1+%g0]0x89,%f20	! %f20 = ffffffff 00000021
!	Mem[0000000010041408] = 000000ff00000000, %l5 = 0000000000000000
	ldxa	[%i1+%o4]0x88,%l5	! %l5 = 000000ff00000000
!	Mem[000000001004143c] = ffffffff, %l0 = ffffffffffffffff
	lduba	[%i1+0x03e]%asi,%l0	! %l0 = 00000000000000ff
	membar	#Sync			! Added by membar checker (47)
!	Mem[0000000010181400] = ffff0ddb ffffffff ffb20000 00000147
!	Mem[0000000010181410] = ff0000ff 00000000 8d030000 00000000
!	Mem[0000000010181420] = 00000000 000000f2 0000ffc8 8fb2181f
!	Mem[0000000010181430] = ff0000ff 8941ffd4 ffffffff ffff0000
	ldda	[%i6]ASI_BLK_P,%f16	! Block Load from 0000000010181400
!	Mem[00000000201c0000] = 00008ea0, %l4 = 00000000db0dffff
	ldub	[%o0+0x001],%l4		! %l4 = 0000000000000000
!	Mem[0000000030181400] = 0000000000000000, %l7 = 000000005a000000
	ldxa	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 00000000, %l6 = 00000000000000ff
	ldstuba	[%i0+%g0]0x80,%l6	! %l6 = 00000000000000ff

p0_label_318:
!	%l3 = ffffffffffffffff, %l2 = 0000000000000000, %y  = 00000000
	smul	%l3,%l2,%l7		! %l7 = 0000000000000000, %y = 00000000
!	Mem[0000000030101410] = 0000b224, %l7 = 0000000000000000
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 000000000000b224
!	%l4 = 0000000000000000, Mem[00000000100c1400] = 01470000, %asi = 80
	stwa	%l4,[%i3+0x000]%asi	! Mem[00000000100c1400] = 00000000
!	%l1 = 0000000000000000, Mem[00000000211c0000] = 00ff3487, %asi = 80
	stha	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00003487
!	Mem[0000000010101410] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i4+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[00000000218000c0] = ffff5cf4, %asi = 80
	stba	%l0,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 00ff5cf4
	membar	#Sync			! Added by membar checker (48)
!	%l6 = 0000000000000000, Mem[0000000010181408] = 0000b2ff
	stba	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000b200
!	%l4 = 0000000000000000, Mem[0000000030041408] = 045d00ffffffffff
	stxa	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000000000000000
!	Mem[0000000030001400] = 210000ff, %f22 = 8d030000
	lda	[%i0+%g0]0x89,%f22	! %f22 = 210000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00b2000000000147, %l1 = 0000000000000000
	ldx	[%i6+%o4],%l1		! %l1 = 00b2000000000147

p0_label_319:
!	%f12 = 00000000, %f31 = ffff0000
	fcmpes	%fcc0,%f12,%f31		! %fcc0 = 3
!	Mem[0000000010181408] = 00b2000000000147, %f4  = ffffffff ff000000
	ldda	[%i6+0x008]%asi,%f4 	! %f4  = 00b20000 00000147
!	Mem[0000000010041400] = 045db224 0000005a, %l0 = 00000000, %l1 = 00000147
	ldda	[%i1+%g0]0x88,%l0	! %l0 = 000000000000005a 00000000045db224
!	Mem[0000000010041408] = 00000000, %l5 = 000000ff00000000
	lduba	[%i1+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181410] = 00000000 ff0000ff, %l0 = 0000005a, %l1 = 045db224
	ldda	[%i6+%o5]0x88,%l0	! %l0 = 00000000ff0000ff 0000000000000000
!	Mem[0000000030001410] = 47010000, %l3 = ffffffffffffffff
	ldsha	[%i0+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = db0dffff, %l5 = 0000000000000000
	lduba	[%i6+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101414] = db0dffff, %l5 = 00000000000000ff
	lduh	[%i4+0x016],%l5		! %l5 = 000000000000ffff
!	Mem[0000000030101408] = 000000ff, %l0 = 00000000ff0000ff
	ldsha	[%i4+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f31 = ffff0000, %f0  = 21000000
	fcmpes	%fcc3,%f31,%f0 		! %fcc3 = 3

p0_label_320:
!	%f28 = ff0000ff 8941ffd4, %l5 = 000000000000ffff
!	Mem[0000000030181420] = 000000037b68038d
	add	%i6,0x020,%g1
	stda	%f28,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030181420] = d4ff4189ff0000ff
!	%f6  = 0000ffff 00000021, %l1 = 0000000000000000
!	Mem[0000000030181430] = 00000000000000ff
	add	%i6,0x030,%g1
	stda	%f6,[%g1+%l1]ASI_PST16_S ! Mem[0000000030181430] = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000010081430] = ff80ff00
	stw	%l2,[%i2+0x030]		! Mem[0000000010081430] = 00000000
!	Mem[0000000010001438] = ff800000, %l4 = 00000000, %l2 = 00000000
	add	%i0,0x38,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 00000000ff800000
!	%f12 = 00000000 24b20000, Mem[0000000030001408] = 000000ff 00000000
	stda	%f12,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000 24b20000
!	Mem[00000000100c1408] = ff0000ff, %l7 = 000000000000b224
	swapa	[%i3+%o4]0x80,%l7	! %l7 = 00000000ff0000ff
!	%l6 = 0000000000000000, Mem[0000000010081408] = ff305a67
	stwa	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	Mem[0000000010141400] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i5+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	%l4 = 00000000, %l5 = 0000ffff, Mem[0000000030141400] = 000000ff ffffffff
	stda	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 000000ff, %l3 = 0000000000000000
	lduha	[%i4+%o5]0x88,%l3	! %l3 = 00000000000000ff

p0_label_321:
!	Mem[0000000010181410] = ff0000ff 00000000, %l6 = 00000000, %l7 = ff0000ff
	ldda	[%i6+0x010]%asi,%l6	! %l6 = 00000000ff0000ff 0000000000000000
!	Mem[0000000020800040] = ffffc0bd, %l4 = 0000000000000000
	ldsh	[%o1+0x040],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030001408] = 0000000024b20000, %f20 = ff0000ff 00000000
	ldda	[%i0+%o4]0x89,%f20	! %f20 = 00000000 24b20000
!	Mem[0000000010101420] = ff5db224, %l7 = 0000000000000000
	ldsb	[%i4+0x022],%l7		! %l7 = ffffffffffffffb2
!	%f4  = 00b20000 00000147, %l6 = 00000000ff0000ff
!	Mem[0000000030101400] = ff000000210061ff
	stda	%f4,[%i4+%l6]ASI_PST32_SL ! Mem[0000000030101400] = 470100000000b200
!	Mem[0000000030141410] = 00000000 000000ff, %l6 = ff0000ff, %l7 = ffffffb2
	ldda	[%i5+%o5]0x89,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Mem[0000000030101408] = 000000ff, %l7 = 0000000000000000
	ldsba	[%i4+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = ffffffff, %f14 = 00000000
	lda	[%i5+%o5]0x88,%f14	! %f14 = ffffffff
!	Mem[0000000030001408] = 24b20000, %l2 = 00000000ff800000
	lduha	[%i0+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f24 = 00000000 000000f2, Mem[0000000010081410] = 00000000 ff005d04
	stda	%f24,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000 000000f2

p0_label_322:
!	%l7 = 0000000000000000, Mem[0000000030001400] = ff000021
	stba	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000021
!	%l3 = 00000000000000ff, Mem[0000000020800000] = 00004ebd, %asi = 80
	stha	%l3,[%o1+0x000]%asi	! Mem[0000000020800000] = 00ff4ebd
!	%f1  = ffffffff, Mem[0000000030141410] = ff000000
	sta	%f1 ,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffffff
!	%l6 = 00000000000000ff, Mem[0000000020800000] = 00ff4ebd
	stb	%l6,[%o1+%g0]		! Mem[0000000020800000] = ffff4ebd
!	%l5 = 000000000000ffff, Mem[0000000010081408] = 00000000
	stha	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000ffff
!	%l2 = 0000000000000000, Mem[0000000010101400] = 74ff38d1ffffffff
	stxa	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000000000000000
!	%f28 = ff0000ff, Mem[00000000100c140c] = 7b68038d
	st	%f28,[%i3+0x00c]	! Mem[00000000100c140c] = ff0000ff
!	%l0 = 0000000000000000, Mem[0000000030081400] = 00000000
	stwa	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	%l2 = 0000000000000000, Mem[0000000030081400] = 00000000
	stwa	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l0 = 0000000000000000
	ldsha	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000000

p0_label_323:
!	Mem[00000000100c1410] = 00000000, %l5 = 000000000000ffff
	ldsha	[%i3+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = db0dffff, %l1 = 0000000000000000
	ldswa	[%i6+%g0]0x88,%l1	! %l1 = ffffffffdb0dffff
!	Mem[0000000030101408] = ff000000, %l4 = ffffffffffffffff
	lduha	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081418] = f200807f 000000ff, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i2+0x018]%asi,%l2	! %l2 = 00000000f200807f 00000000000000ff
!	Mem[0000000010081410] = 000000f2, %l3 = 00000000000000ff
	ldswa	[%i2+%o5]0x88,%l3	! %l3 = 00000000000000f2
!	Mem[00000000100c1410] = 00000000, %l1 = ffffffffdb0dffff
	ldswa	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081410] = f200000000000000, %l3 = 00000000000000f2
	ldxa	[%i2+%o5]0x80,%l3	! %l3 = f200000000000000
!	Mem[0000000010001408] = 0000b20000ab0031, %f18 = ffb20000 00000147
	ldda	[%i0+%o4]0x88,%f18	! %f18 = 0000b200 00ab0031
!	Mem[0000000010041428] = 00008e61, %l2 = 00000000f200807f
	ldub	[%i1+0x028],%l2		! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010041400] = 0000005a
	stha	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000

p0_label_324:
!	%f21 = 24b20000, Mem[0000000030041400] = 00000021
	sta	%f21,[%i1+%g0]0x89	! Mem[0000000030041400] = 24b20000
!	Mem[0000000010101410] = ff000000, %l0 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010101408] = ffffffff000000ff, %l3 = f200000000000000, %l0 = 00000000000000ff
	add	%i4,0x08,%g1
	casxa	[%g1]0x80,%l3,%l0	! %l0 = ffffffff000000ff
!	%l4 = 0000000000000000, imm = 0000000000000676, %l5 = 0000000000000000
	orn	%l4,0x676,%l5		! %l5 = fffffffffffff989
!	Mem[0000000030081400] = 00000000, %l5 = fffffffffffff989
	swapa	[%i2+%g0]0x81,%l5	! %l5 = 0000000000000000
!	%l0 = ffffffff000000ff, Mem[0000000030081400] = 89f9ffff
	stwa	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff
!	%f20 = 00000000 24b20000, %l6 = 00000000000000ff
!	Mem[0000000010101438] = ffffffffff0003ff
	add	%i4,0x038,%g1
	stda	%f20,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010101438] = 0000b22400000000
!	%l1 = 0000000000000000, Mem[0000000030141408] = ff000000ffffffff
	stxa	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000030181408] = ffffffff00000000
	stxa	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00000000, %f12 = 00000000
	lda	[%i6+%o4]0x81,%f12	! %f12 = 00000000

p0_label_325:
!	Mem[0000000030041408] = 0000000000000000, %l5 = 0000000000000000
	ldxa	[%i1+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141400] = 0000ffff00000000, %f16 = ffff0ddb ffffffff
	ldda	[%i5+%g0]0x89,%f16	! %f16 = 0000ffff 00000000
!	Mem[0000000010081410] = 00000000000000f2, %l6 = 00000000000000ff
	ldxa	[%i2+%o5]0x88,%l6	! %l6 = 00000000000000f2
!	Mem[0000000010001410] = ff0000ff, %l4 = 0000000000000000
	ldsha	[%i0+%o5]0x80,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000030041400] = 0000b224, %l1 = 0000000000000000
	ldswa	[%i1+%g0]0x81,%l1	! %l1 = 000000000000b224
!	Mem[00000000100c1410] = 00000000, %l0 = ffffffff000000ff
	lduha	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %f27 = 8fb2181f
	lda	[%i3+%g0]0x80,%f27	! %f27 = 00000000
!	Mem[0000000010001408] = 3100ab00, %l5 = 0000000000000000
	lduha	[%i0+%o4]0x80,%l5	! %l5 = 0000000000003100
!	Mem[000000001014140c] = ffffffff, %l6 = 00000000000000f2
	lduha	[%i5+0x00e]%asi,%l6	! %l6 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l2	! %l2 = 00000000000000ff

p0_label_326:
!	%f6  = 0000ffff 00000021, %l7 = 0000000000000000
!	Mem[0000000010001438] = ff80000000000000
	add	%i0,0x038,%g1
	stda	%f6,[%g1+%l7]ASI_PST16_P ! Mem[0000000010001438] = ff80000000000000
!	%l0 = 0000000000000000, Mem[0000000010181408] = 0000b200
	stha	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	Mem[000000001010140b] = ffffffff, %l1 = 000000000000b224
	ldstub	[%i4+0x00b],%l1		! %l1 = 000000ff000000ff
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010141400] = ff000000 000000ff
	std	%l2,[%i5+%g0]		! Mem[0000000010141400] = 00000000 00000000
!	Mem[0000000010141410] = ffffffff, %l0 = 0000000000000000
	swapa	[%i5+%o5]0x80,%l0	! %l0 = 00000000ffffffff
!	%l2 = 0000000000000000, Mem[0000000010181420] = 00000000
	stw	%l2,[%i6+0x020]		! Mem[0000000010181420] = 00000000
!	Mem[0000000030041410] = ffffffff, %l3 = f200000000000000
	swapa	[%i1+%o5]0x89,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000020800041] = ffffc0bd, %l1 = 00000000000000ff
	ldstub	[%o1+0x041],%l1		! %l1 = 000000ff000000ff
!	%f28 = ff0000ff 8941ffd4, Mem[0000000030081400] = 000000ff 00000000
	stda	%f28,[%i2+%g0]0x89	! Mem[0000000030081400] = ff0000ff 8941ffd4
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00000000, %l5 = 0000000000003100
	ldswa	[%i5+%g0]0x80,%l5	! %l5 = 0000000000000000

p0_label_327:
!	Mem[00000000100c1408] = ff0000ff 24b20000, %l6 = 0000ffff, %l7 = 00000000
	ldda	[%i3+%o4]0x88,%l6	! %l6 = 0000000024b20000 00000000ff0000ff
!	Mem[0000000030141408] = 00000000, %l2 = 0000000000000000
	ldsba	[%i5+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141434] = 000000ff, %l2 = 0000000000000000
	lduwa	[%i5+0x034]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041400] = ff000000, %l5 = 0000000000000000
	lduba	[%i1+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1410] = 00000000, %f19 = 00ab0031
	lda	[%i3+%o5]0x80,%f19	! %f19 = 00000000
!	Mem[0000000010081400] = 0000000000000000, %l5 = 00000000000000ff
	ldxa	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 00000000 00000000, %l0 = ffffffff, %l1 = 000000ff
	ldda	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000021800140] = 0000cf8d, %l6 = 0000000024b20000
	lduha	[%o3+0x140]%asi,%l6	! %l6 = 0000000000000000
!	%l5 = 0000000000000000, %l3 = 00000000ffffffff, %l5 = 0000000000000000
	and	%l5,%l3,%l5		! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[000000001008143f] = 000000ff, %l3 = 00000000ffffffff
	ldstub	[%i2+0x03f],%l3		! %l3 = 000000ff000000ff

p0_label_328:
!	Mem[000000001014143a] = ffffffff, %l5 = 0000000000000000
	ldstub	[%i5+0x03a],%l5		! %l5 = 000000ff000000ff
!	Mem[0000000030141410] = ffffffff, %l1 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000030181408] = 00000000, %l7 = 00000000ff0000ff
	swapa	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000000
!	%f4  = 00b20000, %f29 = 8941ffd4
	fcmps	%fcc1,%f4 ,%f29		! %fcc1 = 2
!	%f31 = ffff0000, %f17 = 00000000
	fcmps	%fcc2,%f31,%f17		! %fcc2 = 3
!	%f26 = 0000ffc8 00000000, Mem[00000000300c1400] = ff000000 7f8000f2
	stda	%f26,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000ffc8 00000000
!	Mem[00000000100c1410] = 00000000, %l4 = ffffffffffffff00
	ldstuba	[%i3+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%f20 = 00000000, Mem[00000000100c141c] = 00000000
	sta	%f20,[%i3+0x01c]%asi	! Mem[00000000100c141c] = 00000000
!	Mem[0000000030081410] = 00000000, %l1 = 00000000ffffffff
	swapa	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081414] = 00000000, %l2 = 00000000000000ff
	lduh	[%i2+0x014],%l2		! %l2 = 0000000000000000

p0_label_329:
!	Mem[0000000010081428] = db0dffff, %l0 = 0000000000000000
	ldsw	[%i2+0x028],%l0		! %l0 = ffffffffdb0dffff
!	Mem[0000000030141410] = 00000000, %l2 = 0000000000000000
	ldsba	[%i5+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l0 = ffffffffdb0dffff
	lduba	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0000] = 00008ea0, %l5 = 00000000000000ff
	lduh	[%o0+%g0],%l5		! %l5 = 0000000000000000
!	Mem[0000000010081410] = f2000000, %l2 = 0000000000000000
	lduha	[%i2+%o5]0x80,%l2	! %l2 = 000000000000f200
!	Mem[0000000010041408] = 00000000, %l7 = 0000000000000000
	ldswa	[%i1+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101420] = ff5db224, %l6 = 0000000000000000
	lduw	[%i4+0x020],%l6		! %l6 = 00000000ff5db224
!	Mem[0000000010141408] = ffffffff ff000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i5+%o4]0x88,%l0	! %l0 = 00000000ff000000 00000000ffffffff
!	Mem[000000001008143c] = 000000ff, %l6 = 00000000ff5db224
	ldsba	[%i2+0x03d]%asi,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f16 = 0000ffff 00000000, Mem[00000000100c1400] = 00000000 f200807f
	std	%f16,[%i3+%g0]	! Mem[00000000100c1400] = 0000ffff 00000000

p0_label_330:
!	%f18 = 0000b200, Mem[0000000010001408] = 3100ab00
	sta	%f18,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000b200
!	%f19 = 00000000, Mem[000000001004143c] = ffffffff
	sta	%f19,[%i1+0x03c]%asi	! Mem[000000001004143c] = 00000000
!	%l4 = 00000000, %l5 = 00000000, Mem[00000000300c1408] = 00000000 00000000
	stda	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000 00000000
!	%f8  = 74ff38d1 ffffffff, Mem[0000000010001430] = 00000004 00000000
	std	%f8 ,[%i0+0x030]	! Mem[0000000010001430] = 74ff38d1 ffffffff
!	%l1 = 00000000ffffffff, Mem[0000000030081410] = ffffffff
	stha	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffffff
!	Mem[0000000010141408] = ff000000, %l3 = 00000000000000ff
	ldstuba	[%i5+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%f18 = 0000b200 00000000, Mem[00000000300c1408] = 00000000 00000000
	stda	%f18,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000b200 00000000
!	%l7 = 0000000000000000, Mem[0000000010081408] = ffff00008468f4c6
	stxa	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000000
!	%f11 = 00000000, Mem[0000000030081408] = 00000000
	sta	%f11,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 00ffffff21000000, %l4 = 0000000000000000
	ldxa	[%i0+%g0]0x89,%l4	! %l4 = 00ffffff21000000

p0_label_331:
!	Mem[0000000010041408] = 00000000, %l1 = 00000000ffffffff
	ldsba	[%i1+0x00a]%asi,%l1	! %l1 = 0000000000000000
!	Mem[00000000201c0000] = 00008ea0, %l7 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181410] = ff0000ff, %l7 = 0000000000000000
	lduha	[%i6+%o5]0x80,%l7	! %l7 = 000000000000ff00
!	Mem[0000000010001408] = 0000b20000b20000, %f2  = 045d00ff ffffffff
	ldda	[%i0+%o4]0x80,%f2 	! %f2  = 0000b200 00b20000
!	Mem[0000000030181410] = 7b68038d, %l2 = 000000000000f200
	ldsha	[%i6+%o5]0x81,%l2	! %l2 = 0000000000007b68
!	Mem[00000000300c1408] = 00b20000, %f24 = 00000000
	lda	[%i3+%o4]0x89,%f24	! %f24 = 00b20000
!	Mem[0000000010081430] = 00000000, %l5 = 0000000000000000
	lduba	[%i2+0x033]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081408] = 00000000db0dffff, %f0  = 21000000 ffffffff
	ldda	[%i2+%o4]0x81,%f0 	! %f0  = 00000000 db0dffff
!	Mem[00000000100c1410] = ff000000, %l2 = 0000000000007b68
	ldswa	[%i3+%o5]0x80,%l2	! %l2 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	%l0 = ff000000, %l1 = 00000000, Mem[0000000010001400] = 000000ff ffffffff
	stda	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = ff000000 00000000

p0_label_332:
!	%l5 = 0000000000000000, Mem[0000000030141400] = 00000000
	stwa	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	%l0 = 00000000ff000000, Mem[0000000010041400] = 000000ff
	stwa	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = ff000000
!	Mem[0000000010181408] = 00000000, %l0 = 00000000ff000000
	swapa	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001400] = 000000ff, %l1 = 0000000000000000
	swap	[%i0+%g0],%l1		! %l1 = 00000000000000ff
!	%l2 = ffffffffff000000, Mem[00000000100c143a] = 318eab04
	sth	%l2,[%i3+0x03a]		! Mem[00000000100c1438] = 318e0000
!	%l6 = 0000000000000000, Mem[0000000010181410] = ff0000ff00000000, %asi = 80
	stxa	%l6,[%i6+0x010]%asi	! Mem[0000000010181410] = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010101410] = ffff0ddb000000ff
	stxa	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000000000000
!	%l4 = 00ffffff21000000, Mem[0000000030101400] = 47010000
	stwa	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 21000000
!	%l6 = 0000000000000000, Mem[0000000030101400] = 21000000
	stha	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00000147, %l4 = 00ffffff21000000
	lduwa	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000147

p0_label_333:
!	Mem[0000000010041400] = 045db224ff000000, %l2 = ffffffffff000000
	ldxa	[%i1+%g0]0x88,%l2	! %l2 = 045db224ff000000
!	Mem[0000000030081408] = 00000000, %l2 = 045db224ff000000
	lduba	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = ff000000, %l7 = 000000000000ff00
	ldsha	[%i4+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1410] = 5a000000 ffffffff, %l4 = 00000147, %l5 = 00000000
	ldda	[%i3+%o5]0x89,%l4	! %l4 = 00000000ffffffff 000000005a000000
!	Mem[0000000010181410] = 00000000, %l3 = 0000000000000000
	lduba	[%i6+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l2 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081410] = 000000f2, %l4 = 00000000ffffffff
	lduba	[%i2+%o5]0x88,%l4	! %l4 = 00000000000000f2
!	Mem[0000000030081400] = d4ff4189ff0000ff, %f28 = ff0000ff 8941ffd4
	ldda	[%i2+%g0]0x81,%f28	! %f28 = d4ff4189 ff0000ff
!	Mem[0000000030081400] = ff0000ff 8941ffd4, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i2+%g0]0x89,%l0	! %l0 = 000000008941ffd4 00000000ff0000ff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[00000000300c1408] = 0000b200
	stba	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000b200

p0_label_334:
!	%f22 = 210000ff 00000000, %f2  = 0000b200
	fdtos	%f22,%f2 		! %f2  = 00000000
!	%f2  = 00000000 00b20000, Mem[0000000010001400] = 00000000 00000000
	stda	%f2 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000 00b20000
!	Mem[0000000010041408] = 00000000, %l5 = 000000005a000000
	swapa	[%i1+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141438] = ffffffffffb2ff5a, %l3 = 0000000000000000, %l0 = 000000008941ffd4
	add	%i5,0x38,%g1
	casxa	[%g1]0x80,%l3,%l0	! %l0 = ffffffffffb2ff5a
!	Mem[0000000010141400] = 00000000, %l0 = ffb2ff5a, %l3 = 00000000
	casa	[%i5]0x80,%l0,%l3	! %l3 = 0000000000000000
!	%f8  = 74ff38d1 ffffffff, Mem[0000000010001400] = 0000b200 00000000
	stda	%f8 ,[%i0+0x000]%asi	! Mem[0000000010001400] = 74ff38d1 ffffffff
!	%l6 = 0000000000000000, imm = fffffffffffff211, %l0 = ffffffffffb2ff5a
	orn	%l6,-0xdef,%l0		! %l0 = 0000000000000dee
!	Mem[0000000030141408] = 00000000, %l5 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[000000001018143c] = ffff0000, %l5 = 0000000000000000
	swap	[%i6+0x03c],%l5		! %l5 = 00000000ffff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff00000047010000, %f14 = ffffffff ffff687b
	ldda	[%i0+%o5]0x89,%f14	! %f14 = ff000000 47010000

p0_label_335:
!	Mem[00000000100c1408] = 0000b224ff0000ff, %f2  = 00000000 00b20000
	ldda	[%i3+%o4]0x80,%f2 	! %f2  = 0000b224 ff0000ff
!	Mem[0000000010141400] = 00000000, %l4 = 00000000000000f2
	lduwa	[%i5+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181400] = ffff0ddbffffffff, %f30 = ffffffff ffff0000
	ldd	[%i6+%g0],%f30		! %f30 = ffff0ddb ffffffff
!	Mem[0000000010001414] = ffffffff, %f17 = 00000000
	lda	[%i0+0x014]%asi,%f17	! %f17 = ffffffff
!	Mem[0000000030181408] = ff0000ff, %l6 = 0000000000000000
	lduwa	[%i6+%o4]0x81,%l6	! %l6 = 00000000ff0000ff
!	Mem[0000000010101418] = ffff0000, %l2 = 0000000000000000
	lduw	[%i4+0x018],%l2		! %l2 = 00000000ffff0000
!	Mem[000000001014140c] = ffffffff, %l4 = 0000000000000000
	ldsw	[%i5+0x00c],%l4		! %l4 = ffffffffffffffff
!	Mem[00000000100c1408] = 0000b224, %l3 = 0000000000000000
	ldsha	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141400] = 0000ffff00000000, %f24 = 00b20000 000000f2
	ldda	[%i5+%g0]0x89,%f24	! %f24 = 0000ffff 00000000
!	Starting 10 instruction Store Burst
!	%f28 = d4ff4189, Mem[0000000010141410] = 00000000
	sta	%f28,[%i5+%o5]0x80	! Mem[0000000010141410] = d4ff4189

p0_label_336:
!	%l1 = 00000000ff0000ff, %l4 = ffffffffffffffff, %l4  = ffffffffffffffff
	mulx	%l1,%l4,%l4		! %l4 = ffffffff00ffff01
!	%f12 = 00000000 24b20000, Mem[00000000300c1400] = 00000000 c8ff0000
	stda	%f12,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000 24b20000
!	%l2 = 00000000ffff0000, Mem[0000000030081408] = 00000000
	stwa	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = ffff0000
!	%l0 = 0000000000000dee, Mem[0000000010041400] = 000000ff24b25d04
	stxa	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000000000000dee
!	Mem[0000000030081408] = ffff0000, %l5 = 00000000ffff0000
	swapa	[%i2+%o4]0x89,%l5	! %l5 = 00000000ffff0000
!	Mem[0000000010001410] = ff0000ff, %l1 = 00000000ff0000ff
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 00000000ff0000ff
!	Code Fragment 4
p0_fragment_27:
!	%l0 = 0000000000000dee
	setx	0x910022905b0181bb,%g7,%l0 ! %l0 = 910022905b0181bb
!	%l1 = 00000000ff0000ff
	setx	0xaece44784ab28fc7,%g7,%l1 ! %l1 = aece44784ab28fc7
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 910022905b0181bb
	setx	0x5bde66605ac9182f,%g7,%l0 ! %l0 = 5bde66605ac9182f
!	%l1 = aece44784ab28fc7
	setx	0xe00d5ba01ad771a5,%g7,%l1 ! %l1 = e00d5ba01ad771a5
!	Mem[0000000020800041] = ffffc0bd, %l7 = 0000000000000000
	ldstuba	[%o1+0x041]%asi,%l7	! %l7 = 000000ff000000ff
!	%f12 = 00000000 24b20000, Mem[0000000030001400] = 00000021 ffffff00
	stda	%f12,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 24b20000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 0000b20000b20000, %f14 = ff000000 47010000
	ldda	[%i0+0x008]%asi,%f14	! %f14 = 0000b200 00b20000

p0_label_337:
!	%l3 = 0000000000000000, imm = fffffffffffffc48, %l2 = 00000000ffff0000
	xnor	%l3,-0x3b8,%l2		! %l2 = 00000000000003b7
!	Mem[0000000010001410] = ff0000ff, %l1 = e00d5ba01ad771a5
	lduwa	[%i0+%o5]0x80,%l1	! %l1 = 00000000ff0000ff
!	Mem[0000000010001410] = ff0000ff, %l2 = 00000000000003b7
	lduwa	[%i0+%o5]0x88,%l2	! %l2 = 00000000ff0000ff
!	Mem[0000000030041408] = 0000000000000000, %l4 = ffffffff00ffff01
	ldxa	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000021800000] = 00ff133c, %l7 = 00000000000000ff
	ldsha	[%o3+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181400] = 00000000, %l0 = 5bde66605ac9182f
	ldsba	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1408] = 00b20000, %l6 = 00000000ff0000ff
	ldsba	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1410] = 000000ff, %l0 = 0000000000000000
	lduha	[%i3+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181400] = db0dffff, %f26 = 0000ffc8
	lda	[%i6+%g0]0x88,%f26	! %f26 = db0dffff
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ffff0000, Mem[0000000030001400] = 00000000
	stha	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000

p0_label_338:
!	Mem[0000000010141400] = 00000000, %l6 = 0000000000000000
	swapa	[%i5+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%l0 = 000000ff, %l1 = ff0000ff, Mem[0000000010181410] = 00000000 00000000
	stda	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff ff0000ff
!	%f0  = 00000000 db0dffff 0000b224 ff0000ff
!	%f4  = 00b20000 00000147 0000ffff 00000021
!	%f8  = 74ff38d1 ffffffff 00000000 00000000
!	%f12 = 00000000 24b20000 0000b200 00b20000
	stda	%f0,[%i1]ASI_COMMIT_S	! Block Store to 0000000030041400
!	%l5 = 00000000ffff0000, Mem[00000000100c1410] = ff000000
	sth	%l5,[%i3+%o5]		! Mem[00000000100c1410] = 00000000
	membar	#Sync			! Added by membar checker (49)
!	Mem[0000000010041408] = 5a000000, %l1 = 00000000ff0000ff
	swapa	[%i1+%o4]0x88,%l1	! %l1 = 000000005a000000
!	%l2 = 00000000ff0000ff, Mem[0000000030181410] = 7b68038d
	stwa	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = ff0000ff
!	%l7 = 00000000000000ff, Mem[0000000010181404] = ffffffff
	stw	%l7,[%i6+0x004]		! Mem[0000000010181404] = 000000ff
!	%l4 = 0000000000000000, Mem[0000000010041410] = 00000000
	stba	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	%l1 = 000000005a000000, Mem[0000000030041408] = 24b20000
	stba	%l1,[%i1+%o4]0x89	! Mem[0000000030041408] = 24b20000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 0000ffff, %f6  = 0000ffff
	lda	[%i2+%o4]0x81,%f6 	! %f6 = 0000ffff

p0_label_339:
!	Mem[0000000030001408] = 00000000 24b20000, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i0+%o4]0x89,%l6	! %l6 = 0000000024b20000 0000000000000000
!	Mem[0000000010001400] = 74ff38d1, %l1 = 000000005a000000
	ldub	[%i0+0x003],%l1		! %l1 = 00000000000000d1
!	Mem[0000000010141408] = ffffffffff0000ff, %l0 = 00000000000000ff
	ldxa	[%i5+%o4]0x88,%l0	! %l0 = ffffffffff0000ff
!	Mem[0000000010181410] = ff000000ff0000ff, %f8  = 74ff38d1 ffffffff
	ldda	[%i6+%o5]0x80,%f8 	! %f8  = ff000000 ff0000ff
!	%l0 = ffffffffff0000ff, Mem[0000000010101418] = ffff000000000000
	stx	%l0,[%i4+0x018]		! Mem[0000000010101418] = ffffffffff0000ff
!	Mem[0000000010001414] = ffffffff, %l7 = 0000000000000000
	ldsw	[%i0+0x014],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010141400] = 00000000, %f15 = 00b20000
	lda	[%i5+%g0]0x80,%f15	! %f15 = 00000000
!	Mem[0000000010141434] = 000000ff, %l0 = ffffffffff0000ff
	lduh	[%i5+0x036],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010041408] = ff0000ff ff000000, %l2 = ff0000ff, %l3 = 00000000
	ldda	[%i1+%o4]0x80,%l2	! %l2 = 00000000ff0000ff 00000000ff000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, immed = fffffca9, %y  = 00000000
	smul	%l4,-0x357,%l1		! %l1 = 0000000000000000, %y = 00000000

p0_label_340:
!	Mem[0000000010141438] = ffffffff, %l1 = 00000000, %l4 = 00000000
	add	%i5,0x38,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 00000000ffffffff
!	%l4 = 00000000ffffffff, Mem[0000000021800140] = 0000cf8d, %asi = 80
	stha	%l4,[%o3+0x140]%asi	! Mem[0000000021800140] = ffffcf8d
!	%l5 = 00000000ffff0000, Mem[0000000010001410] = ff0000ff
	stwa	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = ffff0000
!	%l5 = 00000000ffff0000, Mem[0000000010001400] = d138ff74
	stba	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = d138ff00
!	Mem[0000000010081418] = f200807f000000ff, %l7 = ffffffffffffffff, %l7 = ffffffffffffffff
	add	%i2,0x18,%g1
	casxa	[%g1]0x80,%l7,%l7	! %l7 = f200807f000000ff
!	%l5 = 00000000ffff0000, Mem[0000000030181410] = ff0000ff
	stba	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000ff
!	%l4 = ffffffff, %l5 = ffff0000, Mem[0000000030081400] = d4ff4189 ff0000ff
	stda	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffffff ffff0000
!	Mem[0000000010041410] = 00000000, %l1 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000010081410] = 000000f2
	stba	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 47010000, %l6 = 0000000024b20000
	lduwa	[%i0+%o5]0x89,%l6	! %l6 = 0000000047010000

p0_label_341:
!	Mem[0000000010101408] = ff000000ffffffff, %f18 = 0000b200 00000000
	ldda	[%i4+%o4]0x88,%f18	! %f18 = ff000000 ffffffff
!	Code Fragment 4
p0_fragment_28:
!	%l0 = 00000000000000ff
	setx	0xd0315640580e385b,%g7,%l0 ! %l0 = d0315640580e385b
!	%l1 = 0000000000000000
	setx	0xbfbe75e7981b7724,%g7,%l1 ! %l1 = bfbe75e7981b7724
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = d0315640580e385b
	setx	0x72166d3fb33b73cf,%g7,%l0 ! %l0 = 72166d3fb33b73cf
!	%l1 = bfbe75e7981b7724
	setx	0x8379a2a7c74d4654,%g7,%l1 ! %l1 = 8379a2a7c74d4654
!	%l0 = 72166d3fb33b73cf, %l0 = 72166d3fb33b73cf, %l5 = 00000000ffff0000
	addc	%l0,%l0,%l5		! %l5 = e42cda7f6676e79e
!	Mem[00000000100c1408] = 24b20000, %l5 = e42cda7f6676e79e
	lduha	[%i3+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181438] = ffffffff, %f1  = db0dffff
	lda	[%i6+0x038]%asi,%f1 	! %f1 = ffffffff
!	Mem[0000000010101410] = 00000000, %l3 = 00000000ff000000
	ldsha	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = 00ff38d1 ffffffff, %l2 = ff0000ff, %l3 = 00000000
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 0000000000ff38d1 00000000ffffffff
!	Mem[0000000010081430] = 00000000, %l4 = 00000000ffffffff
	ldub	[%i2+0x033],%l4		! %l4 = 0000000000000000
!	Mem[0000000030001410] = 47010000, %l0 = 72166d3fb33b73cf
	ldsba	[%i0+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 8941ffd4, %l5 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l5	! %l5 = 000000008941ffd4

p0_label_342:
!	%f6  = 0000ffff, Mem[00000000100c141c] = 00000000
	st	%f6 ,[%i3+0x01c]	! Mem[00000000100c141c] = 0000ffff
!	%f16 = 0000ffff ffffffff ff000000 ffffffff
!	%f20 = 00000000 24b20000 210000ff 00000000
!	%f24 = 0000ffff 00000000 db0dffff 00000000
!	%f28 = d4ff4189 ff0000ff ffff0ddb ffffffff
	stda	%f16,[%i4]ASI_BLK_P	! Block Store to 0000000010101400
!	Mem[0000000010041423] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i1+0x023]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1400] = 00000000, %l7 = f200807f000000ff
	ldstuba	[%i3+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1408] = 00b20000, %l3 = 00000000ffffffff
	swapa	[%i3+%o4]0x89,%l3	! %l3 = 0000000000b20000
!	Mem[0000000010141400] = 00000000, %l2 = 0000000000ff38d1
	swapa	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000218000c0] = 00ff5cf4, %l7 = 0000000000000000
	ldstub	[%o3+0x0c0],%l7		! %l7 = 00000000000000ff
!	%f10 = 00000000, Mem[0000000030081400] = ffffffff
	sta	%f10,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	Mem[0000000010141408] = ff0000ff, %l7 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l7	! %l7 = 00000000ff0000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (50)
!	Mem[0000000010101400] = 0000ffff, %l4 = 0000000000000000
	lduh	[%i4+%g0],%l4		! %l4 = 0000000000000000

p0_label_343:
!	Mem[0000000030101400] = 00000000 0000b200 000000ff 00ff0000
!	Mem[0000000030101410] = 00000000 ff000000 ffff0ddb 00000000
!	Mem[0000000030101420] = 03f2ff00 cd659a95 7ffb8e61 7b68038d
!	Mem[0000000030101430] = 00000000 00000000 ff0000ff ffb27b5a
	ldda	[%i4]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030101400
!	Mem[0000000030041408] = 0000b224, %l4 = 0000000000000000
	lduba	[%i1+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = 00000000ffff0000, %f30 = ffff0ddb ffffffff
	ldda	[%i2+%g0]0x81,%f30	! %f30 = 00000000 ffff0000
!	Mem[0000000010001428] = ffffffff 000000ff, %l6 = 47010000, %l7 = ff0000ff
	ldda	[%i0+0x028]%asi,%l6	! %l6 = 00000000ffffffff 00000000000000ff
!	Mem[0000000010101410] = 00000000, %l6 = 00000000ffffffff
	ldswa	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141408] = 00000000, %l3 = 0000000000b20000
	lduha	[%i5+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1418] = ffffffff 0000ffff, %l0 = 00000000, %l1 = c74d4654
	ldd	[%i3+0x018],%l0		! %l0 = 00000000ffffffff 000000000000ffff
!	Mem[0000000010081408] = 00000000, %l7 = 00000000000000ff
	lduwa	[%i2+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101438] = ffff0ddb, %l5 = 000000008941ffd4
	ldsba	[%i4+0x039]%asi,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181407] = 000000ff, %l3 = 0000000000000000
	ldstuba	[%i6+0x007]%asi,%l3	! %l3 = 000000ff000000ff

p0_label_344:
!	%f20 = 00000000 24b20000, %l1 = 000000000000ffff
!	Mem[0000000030141418] = fffffffff200807f
	add	%i5,0x018,%g1
	stda	%f20,[%g1+%l1]ASI_PST32_S ! Mem[0000000030141418] = 0000000024b20000
!	Mem[0000000010141408] = 00000000, %l2 = 0000000000000000
	swapa	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010081410] = 00000000
	stha	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000
!	Mem[0000000021800081] = 57ff899f, %l4 = 0000000000000000
	ldstuba	[%o3+0x081]%asi,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010001400] = 00ff38d1, %l2 = 0000000000000000
	swap	[%i0+%g0],%l2		! %l2 = 0000000000ff38d1
!	Mem[00000000211c0000] = 00003487, %l7 = 0000000000000000
	ldstub	[%o2+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[00000000218001c0] = 890008e2, %l0 = 00000000ffffffff
	ldstuba	[%o3+0x1c0]%asi,%l0	! %l0 = 00000089000000ff
!	%l4 = 00000000000000ff, Mem[0000000010001400] = ffffffff00000000
	stxa	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000000000ff
!	%f30 = 00000000 ffff0000, Mem[0000000030041410] = 00b20000 00000147
	stda	%f30,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 ffff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff000000ffffffff, %l3 = 00000000000000ff
	ldxa	[%i4+%o4]0x80,%l3	! %l3 = ff000000ffffffff

p0_label_345:
!	Mem[00000000300c1408] = ffffffff, %l0 = 0000000000000089
	ldsba	[%i3+%o4]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000020800040] = ffffc0bd, %l2 = 0000000000ff38d1
	ldub	[%o1+0x041],%l2		! %l2 = 00000000000000ff
!	Mem[00000000100c1410] = 00000000, %l3 = ff000000ffffffff
	ldswa	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101400] = 00b2000000000000, %f22 = 210000ff 00000000
	ldda	[%i4+%g0]0x89,%f22	! %f22 = 00b20000 00000000
!	Mem[0000000010041418] = 8e610000, %l0 = ffffffffffffffff
	ldsw	[%i1+0x018],%l0		! %l0 = ffffffff8e610000
!	Mem[0000000010101400] = 0000ffffffffffff, %f24 = 0000ffff 00000000
	ldda	[%i4+%g0]0x80,%f24	! %f24 = 0000ffff ffffffff
!	Mem[0000000010001410] = ffff0000, %l4 = 00000000000000ff
	ldswa	[%i0+%o5]0x80,%l4	! %l4 = ffffffffffff0000
!	Mem[0000000030141410] = 00000000, %l2 = 00000000000000ff
	ldsha	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = ff0000ff, %l5 = ffffffffffffffff
	lduba	[%i1+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f19 = ffffffff, Mem[0000000030081410] = ffffffff
	sta	%f19,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffffff

p0_label_346:
!	Mem[0000000030001410] = 00000147, %l3 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	%l1 = 000000000000ffff, Mem[0000000010181438] = ffffffff00000000, %asi = 80
	stxa	%l1,[%i6+0x038]%asi	! Mem[0000000010181438] = 000000000000ffff
!	%l0 = ffffffff8e610000, Mem[0000000030001410] = 470100ff
	stwa	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 8e610000
!	%f20 = 00000000, Mem[0000000030001400] = 00000000
	sta	%f20,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	Mem[000000001008141e] = 000000ff, %l4 = ffffffffffff0000
	ldstuba	[%i2+0x01e]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041400] = 00000000, %l7 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000030141400] = 00000000
	stwa	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	%f16 = 0000ffff ffffffff ff000000 ffffffff
!	%f20 = 00000000 24b20000 00b20000 00000000
!	%f24 = 0000ffff ffffffff db0dffff 00000000
!	%f28 = d4ff4189 ff0000ff 00000000 ffff0000
	stda	%f16,[%i1]ASI_BLK_PL	! Block Store to 0000000010041400
!	%l5 = 00000000000000ff, Mem[0000000010141400] = 00000000d138ff00
	stxa	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181420] = 00000000000000f2, %f8  = 959a65cd 00fff203
	ldd	[%i6+0x020],%f8 	! %f8  = 00000000 000000f2

p0_label_347:
!	Mem[0000000030181400] = 00000000 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i6+%g0]0x81,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010181418] = 8d030000, %l4 = 0000000000000000
	lduha	[%i6+0x01a]%asi,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = 0000000000000000, %f4  = 000000ff 00000000
	ldda	[%i3+%o5]0x80,%f4 	! %f4  = 00000000 00000000
!	Mem[0000000010081428] = db0dffff 00000147, %l6 = 00000000, %l7 = 00000000
	ldd	[%i2+0x028],%l6		! %l6 = 00000000db0dffff 0000000000000147
!	Mem[0000000010181420] = 00000000, %l6 = 00000000db0dffff
	lduh	[%i6+0x020],%l6		! %l6 = 0000000000000000
!	Mem[0000000030101408] = ff000000, %l5 = 00000000000000ff
	lduba	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Code Fragment 4
p0_fragment_29:
!	%l0 = ffffffff8e610000
	setx	0x15ffacf7c19d962d,%g7,%l0 ! %l0 = 15ffacf7c19d962d
!	%l1 = 000000000000ffff
	setx	0xba0103e057fbd4b9,%g7,%l1 ! %l1 = ba0103e057fbd4b9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 15ffacf7c19d962d
	setx	0x337dbd578614a8a2,%g7,%l0 ! %l0 = 337dbd578614a8a2
!	%l1 = ba0103e057fbd4b9
	setx	0x5091eb4020a522ca,%g7,%l1 ! %l1 = 5091eb4020a522ca
!	Mem[0000000010001400] = ff000000, %l1 = 5091eb4020a522ca
	ldsw	[%i0+%g0],%l1		! %l1 = ffffffffff000000
!	Mem[0000000030041400] = 00000000db0dffff, %l3 = 0000000000000000
	ldxa	[%i1+%g0]0x81,%l3	! %l3 = 00000000db0dffff
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (51)
!	Mem[0000000010041410] = 0000b224, %l4 = 0000000000000000
	ldstuba	[%i1+%o5]0x80,%l4	! %l4 = 00000000000000ff

p0_label_348:
!	Mem[0000000030101400] = 00000000, %l1 = ffffffffff000000
	ldstuba	[%i4+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	%l3 = 00000000db0dffff, Mem[0000000030041410] = 00000000
	stha	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000ffff
!	%l2 = 00000000, %l3 = db0dffff, Mem[0000000030141408] = 00000000 00000000
	stda	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000 db0dffff
!	%l1 = 0000000000000000, Mem[000000001000140e] = 00b20000
	sth	%l1,[%i0+0x00e]		! Mem[000000001000140c] = 00b20000
!	%f22 = 00b20000 00000000, Mem[0000000010001410] = 0000ffff ffffffff
	stda	%f22,[%i0+%o5]0x88	! Mem[0000000010001410] = 00b20000 00000000
!	%l2 = 00000000, %l3 = db0dffff, Mem[0000000030041410] = 0000ffff 0000ffff
	stda	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000 db0dffff
!	%f14 = 5a7bb2ff ff0000ff, Mem[0000000010181410] = ff000000 ff0000ff
	stda	%f14,[%i6+0x010]%asi	! Mem[0000000010181410] = 5a7bb2ff ff0000ff
!	%l6 = 0000000000000000, Mem[0000000021800001] = 00ff133c, %asi = 80
	stba	%l6,[%o3+0x001]%asi	! Mem[0000000021800000] = 0000133c
!	%l1 = 0000000000000000, Mem[000000001018142c] = 8fb2181f
	stb	%l1,[%i6+0x02c]		! Mem[000000001018142c] = 00b2181f
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00008ea0, %l0 = 337dbd578614a8a2
	lduba	[%o0+0x000]%asi,%l0	! %l0 = 0000000000000000

p0_label_349:
!	Mem[00000000300c1400] = 0000b224000000ff, %l5 = 0000000000000000
	ldxa	[%i3+%g0]0x89,%l5	! %l5 = 0000b224000000ff
!	Mem[0000000030001400] = 00000000, %f31 = ffff0000
	lda	[%i0+%g0]0x81,%f31	! %f31 = 00000000
!	Mem[00000000211c0000] = ff003487, %l4 = 0000000000000000
	lduh	[%o2+%g0],%l4		! %l4 = 000000000000ff00
!	Mem[00000000100c1438] = 318e0000ffffffff, %l1 = 0000000000000000
	ldx	[%i3+0x038],%l1		! %l1 = 318e0000ffffffff
!	Mem[0000000030001410] = 0000618e000000ff, %l4 = 000000000000ff00
	ldxa	[%i0+%o5]0x81,%l4	! %l4 = 0000618e000000ff
!	Mem[0000000030141400] = 0000ffff 00000000, %l4 = 000000ff, %l5 = 000000ff
	ldda	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000000 000000000000ffff
!	Mem[00000000100c1400] = ffff0000, %f22 = 00b20000
	lda	[%i3+%g0]0x88,%f22	! %f22 = ffff0000
!	Mem[0000000010001418] = ae46747d00000046, %f26 = db0dffff 00000000
	ldda	[%i0+0x018]%asi,%f26	! %f26 = ae46747d 00000046
!	Mem[0000000030041408] = ff0000ff 24b20000, %l4 = 00000000, %l5 = 0000ffff
	ldda	[%i1+%o4]0x89,%l4	! %l4 = 0000000024b20000 00000000ff0000ff
!	Starting 10 instruction Store Burst
!	%f6  = 00000000 db0dffff, Mem[0000000010181410] = 5a7bb2ff ff0000ff
	stda	%f6 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000 db0dffff

p0_label_350:
!	Mem[00000000211c0001] = ff003487, %l7 = 0000000000000147
	ldstuba	[%o2+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	%f2  = 0000ff00 ff000000, Mem[0000000030181410] = 000000ff 00000000
	stda	%f2 ,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000ff00 ff000000
!	Mem[0000000010141400] = ff000000, %l0 = 0000000000000000
	swapa	[%i5+%g0]0x80,%l0	! %l0 = 00000000ff000000
!	%f24 = 0000ffff ffffffff, Mem[0000000030081408] = 0000ffff db0dffff
	stda	%f24,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000ffff ffffffff
!	Mem[00000000100c1410] = 00000000, %l3 = 00000000db0dffff
	ldsh	[%i3+%o5],%l3		! %l3 = 0000000000000000
!	%l0 = 00000000ff000000, Mem[00000000100c1410] = 00000000
	stha	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	Mem[00000000300c1400] = 000000ff, %l4 = 0000000024b20000
	ldstuba	[%i3+%g0]0x89,%l4	! %l4 = 000000ff000000ff
!	%f6  = 00000000 db0dffff, Mem[00000000100c1428] = ffffffff ff0000ff
	std	%f6 ,[%i3+0x028]	! Mem[00000000100c1428] = 00000000 db0dffff
!	%f23 = 00000000, Mem[0000000030101408] = 000000ff
	sta	%f23,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 000000ff, %f24 = 0000ffff
	lda	[%i3+%g0]0x89,%f24	! %f24 = 000000ff

p0_label_351:
!	Mem[0000000030141400] = 00000000, %f0  = 00b20000
	lda	[%i5+%g0]0x89,%f0 	! %f0 = 00000000
!	Mem[00000000300c1400] = ff00000024b20000, %f24 = 000000ff ffffffff
	ldda	[%i3+%g0]0x81,%f24	! %f24 = ff000000 24b20000
!	Mem[0000000030081408] = 0000ffff, %l2 = 0000000000000000
	ldsba	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181408] = ff000000, %l7 = 0000000000000000
	ldsha	[%i6+%o4]0x80,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000030081410] = ffffffff, %l3 = 0000000000000000
	ldsba	[%i2+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000300c1408] = ffffffff, %l0 = 00000000ff000000
	lduba	[%i3+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Code Fragment 3
p0_fragment_30:
!	%l0 = 00000000000000ff
	setx	0x9c01c1a031ba5041,%g7,%l0 ! %l0 = 9c01c1a031ba5041
!	%l1 = 318e0000ffffffff
	setx	0xdddb58980e13f65b,%g7,%l1 ! %l1 = dddb58980e13f65b
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9c01c1a031ba5041
	setx	0x6fc4b19879608af8,%g7,%l0 ! %l0 = 6fc4b19879608af8
!	%l1 = dddb58980e13f65b
	setx	0xda4ee117f4e5a856,%g7,%l1 ! %l1 = da4ee117f4e5a856
!	Mem[0000000010101408] = ff000000, %l4 = 00000000000000ff
	ldsha	[%i4+%o4]0x80,%l4	! %l4 = ffffffffffffff00
	membar	#Sync			! Added by membar checker (52)
!	Mem[00000000300c1400] = ff000000 24b20000 ffffffff 00000000
!	Mem[00000000300c1410] = ffffffff 0000005a 318eab04 ffffffff
!	Mem[00000000300c1420] = 7099543b 968f5ab2 fddf580a dc69950b
!	Mem[00000000300c1430] = 24b25d04 ffffffff 38763b02 0700da69
	ldda	[%i3]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffff00, Mem[0000000010081420] = 6ddaff08c791c515, %asi = 80
	stxa	%l7,[%i2+0x020]%asi	! Mem[0000000010081420] = ffffffffffffff00

p0_label_352:
!	Code Fragment 4
p0_fragment_31:
!	%l0 = 6fc4b19879608af8
	setx	0x1f83beb7cb7f223b,%g7,%l0 ! %l0 = 1f83beb7cb7f223b
!	%l1 = da4ee117f4e5a856
	setx	0xafbf0d1fadffad33,%g7,%l1 ! %l1 = afbf0d1fadffad33
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1f83beb7cb7f223b
	setx	0x8a0dee2fa0055589,%g7,%l0 ! %l0 = 8a0dee2fa0055589
!	%l1 = afbf0d1fadffad33
	setx	0xeb0905b7f1a88ee9,%g7,%l1 ! %l1 = eb0905b7f1a88ee9
!	%f9  = 000000f2, Mem[000000001000143c] = 00000000
	sta	%f9 ,[%i0+0x03c]%asi	! Mem[000000001000143c] = 000000f2
!	%l6 = 0000000000000000, Mem[0000000010101410] = 0000000024b20000
	stx	%l6,[%i4+%o5]		! Mem[0000000010101410] = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010081408] = 00000000
	stha	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	Mem[0000000010041410] = ff00b224, %l5 = 00000000ff0000ff
	swapa	[%i1+%o5]0x80,%l5	! %l5 = 00000000ff00b224
!	%l0 = 8a0dee2fa0055589, Mem[00000000211c0001] = ffff3487
	stb	%l0,[%o2+0x001]		! Mem[00000000211c0000] = ff893487
!	%l2 = 0000000000000000, Mem[0000000010001400] = ff000000
	stba	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010081400] = 0000000000000000
	stxa	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000000000000000
!	Mem[0000000010141418] = 0000ffff00000046, %l4 = ffffffffffffff00, %l0 = 8a0dee2fa0055589
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l4,%l0	! %l0 = 0000ffff00000046
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff0000ff, %l3 = ffffffffffffffff
	lduha	[%i1+%o5]0x80,%l3	! %l3 = 000000000000ff00

p0_label_353:
!	%l5 = 00000000ff00b224, immed = 000005c1, %y  = 00000000
	umul	%l5,0x5c1,%l4		! %l4 = 000005bb43010124, %y = 000005bb
!	Mem[0000000030101410] = 000000ff 00000000, %l0 = 00000046, %l1 = f1a88ee9
	ldda	[%i4+%o5]0x89,%l0	! %l0 = 0000000000000000 00000000000000ff
!	Mem[0000000010001400] = 00000000, %l7 = ffffffffffffff00
	ldsha	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = 0000ffff 00000000, %l2 = 00000000, %l3 = 0000ff00
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 000000000000ffff 0000000000000000
!	Mem[0000000030101400] = ff000000, %l1 = 00000000000000ff
	ldswa	[%i4+%g0]0x81,%l1	! %l1 = ffffffffff000000
!	Mem[0000000030101400] = ff000000 0000b200 00000000 00ff0000
!	Mem[0000000030101410] = 00000000 ff000000 ffff0ddb 00000000
!	Mem[0000000030101420] = 03f2ff00 cd659a95 7ffb8e61 7b68038d
!	Mem[0000000030101430] = 00000000 00000000 ff0000ff ffb27b5a
	ldda	[%i4]ASI_BLK_S,%f0	! Block Load from 0000000030101400
!	Mem[0000000030041400] = 00000000, %l3 = 0000000000000000
	ldsba	[%i1+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1410] = ffffffff 0000005a, %l2 = 0000ffff, %l3 = 00000000
	ldda	[%i3+%o5]0x81,%l2	! %l2 = 00000000ffffffff 000000000000005a
!	Mem[0000000030041400] = 00000000db0dffff, %f26 = fddf580a dc69950b
	ldda	[%i1+%g0]0x81,%f26	! %f26 = 00000000 db0dffff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000030041408] = 24b20000
	stha	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = 24b20000

p0_label_354:
!	Mem[0000000010081408] = 00000000, %l0 = 0000000000000000
	swapa	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000000
!	%l4 = 43010124, %l5 = ff00b224, Mem[0000000030041410] = 00000000 db0dffff
	stda	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 43010124 ff00b224
!	%f18 = ffffffff 00000000, %l6 = 0000000000000000
!	Mem[0000000030181430] = 00000000000000ff
	add	%i6,0x030,%g1
	stda	%f18,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030181430] = 00000000000000ff
!	Mem[0000000030181400] = 00000000, %l7 = 0000000000000000
	swapa	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000000
!	%l3 = 000000000000005a, Mem[0000000030081408] = ffff0000
	stwa	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000005a
!	%f27 = db0dffff, Mem[0000000010101400] = 0000ffff
	sta	%f27,[%i4+%g0]0x80	! Mem[0000000010101400] = db0dffff
!	%l5 = 00000000ff00b224, Mem[0000000010101410] = 00000000
	stba	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 24000000
!	%l6 = 0000000000000000, Mem[0000000020800040] = ffffc0bd, %asi = 80
	stba	%l6,[%o1+0x040]%asi	! Mem[0000000020800040] = 00ffc0bd
!	Mem[0000000010041410] = ff0000ff, %l1 = ffffffffff000000
	ldstuba	[%i1+%o5]0x88,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041424] = ffff0000, %l1 = 00000000000000ff
	ldsba	[%i1+0x026]%asi,%l1	! %l1 = 0000000000000000

p0_label_355:
!	Mem[0000000010041408] = ffffffff, %l0 = 0000000000000000
	ldswa	[%i1+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010181408] = ff000000, %f25 = 968f5ab2
	lda	[%i6+%o4]0x80,%f25	! %f25 = ff000000
!	Mem[0000000010001408] = 00b20000, %l3 = 000000000000005a
	ldsha	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081408] = 5a000000, %l4 = 000005bb43010124
	ldsha	[%i2+%o4]0x81,%l4	! %l4 = 0000000000005a00
!	Mem[0000000030141400] = 0000ffff00000000, %l1 = 0000000000000000
	ldxa	[%i5+%g0]0x89,%l1	! %l1 = 0000ffff00000000
!	Mem[0000000010081410] = 00000000, %l1 = 0000ffff00000000
	ldsba	[%i2+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041410] = 24010143 24b200ff, %l6 = 00000000, %l7 = 00000000
	ldda	[%i1+%o5]0x81,%l6	! %l6 = 0000000024010143 0000000024b200ff
!	Mem[0000000010081410] = 00000000, %l3 = 0000000000000000
	lduba	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141400] = 0000000000000000, %f22 = 318eab04 ffffffff
	ldda	[%i5+%g0]0x88,%f22	! %f22 = 00000000 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 00000000, %l2 = 00000000ffffffff
	ldstuba	[%i5+%o4]0x81,%l2	! %l2 = 00000000000000ff

p0_label_356:
!	%f26 = 00000000 db0dffff, %l5 = 00000000ff00b224
!	Mem[0000000030181430] = 00000000000000ff
	add	%i6,0x030,%g1
	stda	%f26,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030181430] = 00000d00000000ff
!	%l1 = 0000000000000000, Mem[0000000010181400] = db0dffff
	stba	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = db0dff00
!	%l6 = 0000000024010143, Mem[0000000030001408] = 24b20000
	stba	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = 24b20043
!	%f20 = ffffffff 0000005a, Mem[0000000030181400] = 00000000 00000000
	stda	%f20,[%i6+%g0]0x89	! Mem[0000000030181400] = ffffffff 0000005a
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010081420] = ffffffff ffffff00
	stda	%l2,[%i2+0x020]%asi	! Mem[0000000010081420] = 00000000 00000000
!	%l7 = 0000000024b200ff, Mem[0000000010181416] = db0dffff, %asi = 80
	stha	%l7,[%i6+0x016]%asi	! Mem[0000000010181414] = db0d00ff
!	Code Fragment 3
p0_fragment_32:
!	%l0 = ffffffffffffffff
	setx	0x3d8fe6dfc531c17a,%g7,%l0 ! %l0 = 3d8fe6dfc531c17a
!	%l1 = 0000000000000000
	setx	0x0c1fb037e19da579,%g7,%l1 ! %l1 = 0c1fb037e19da579
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3d8fe6dfc531c17a
	setx	0x101453d8259a95ce,%g7,%l0 ! %l0 = 101453d8259a95ce
!	%l1 = 0c1fb037e19da579
	setx	0xd9da51c810ee7430,%g7,%l1 ! %l1 = d9da51c810ee7430
!	Mem[0000000010041408] = ffffffff000000ff, %l2 = 0000000000000000
	ldxa	[%i1+%o4]0x80,%l2	! %l2 = ffffffff000000ff
	membar	#Sync			! Added by membar checker (53)
!	%f8  = 03f2ff00 cd659a95, Mem[00000000300c1408] = ffffffff 00000000
	stda	%f8 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 03f2ff00 cd659a95
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000, %l7 = 0000000024b200ff
	lduha	[%i6+%o5]0x88,%l7	! %l7 = 0000000000000000

p0_label_357:
!	Mem[0000000010101400] = db0dffffffffffff, %l1 = d9da51c810ee7430
	ldx	[%i4+%g0],%l1		! %l1 = db0dffffffffffff
!	Mem[0000000010181410] = 00000000, %l3 = 0000000000000000
	ldsha	[%i6+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101400] = ffffffffffff0ddb, %l6 = 0000000024010143
	ldxa	[%i4+%g0]0x88,%l6	! %l6 = ffffffffffff0ddb
!	Mem[0000000030101408] = 0000ff0000000000, %f6  = ffff0ddb 00000000
	ldda	[%i4+%o4]0x89,%f6 	! %f6  = 0000ff00 00000000
!	Mem[0000000030081400] = 00000000, %l0 = 101453d8259a95ce
	ldsha	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181400] = 00ff0ddb, %l3 = 0000000000000000
	ldswa	[%i6+%g0]0x80,%l3	! %l3 = 0000000000ff0ddb
!	Mem[0000000030181408] = ff0000ff, %l2 = ffffffff000000ff
	lduha	[%i6+%o4]0x81,%l2	! %l2 = 000000000000ff00
!	%l1 = db0dffffffffffff, Mem[0000000030181400] = 0000005a
	stba	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff
!	Mem[00000000300c1408] = 03f2ff00 cd659a95, %l2 = 0000ff00, %l3 = 00ff0ddb
	ldda	[%i3+%o4]0x89,%l2	! %l2 = 00000000cd659a95 0000000003f2ff00
!	Starting 10 instruction Store Burst
!	%f30 = 38763b02 0700da69, Mem[0000000030101400] = 000000ff 00b20000
	stda	%f30,[%i4+%g0]0x89	! Mem[0000000030101400] = 38763b02 0700da69

p0_label_358:
!	%l0 = 0000000000000000, Mem[0000000010041410] = 00000000ff0000ff
	stxa	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000000000000000
!	%l6 = ffff0ddb, %l7 = 00000000, Mem[0000000010101408] = ff000000 ffffffff
	stda	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = ffff0ddb 00000000
!	%f31 = 0700da69, Mem[0000000010041410] = 00000000
	sta	%f31,[%i1+%o5]0x80	! Mem[0000000010041410] = 0700da69
!	Mem[0000000030141408] = ff000000, %l0 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l0	! %l0 = 00000000ff000000
!	Mem[00000000300c1408] = 959a65cd, %l1 = db0dffffffffffff
	swapa	[%i3+%o4]0x81,%l1	! %l1 = 00000000959a65cd
!	%l4 = 0000000000005a00, Mem[0000000010101410] = 00000024
	stba	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	Mem[0000000010041410] = 0700da69, %l0 = 00000000ff000000
	ldstuba	[%i1+%o5]0x80,%l0	! %l0 = 00000007000000ff
!	Mem[0000000010081410] = 00000000, %l2 = 00000000cd659a95
	ldstuba	[%i2+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%f5  = ff000000, Mem[0000000010141438] = ffffffff
	st	%f5 ,[%i5+0x038]	! Mem[0000000010141438] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00b20000, %l7 = 0000000000000000
	ldsha	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000000

p0_label_359:
!	Mem[0000000010041410] = 69da00ff, %f17 = 24b20000
	lda	[%i1+%o5]0x88,%f17	! %f17 = 69da00ff
!	Mem[0000000010141400] = 00000000, %l1 = 00000000959a65cd
	lduba	[%i5+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = db0dffff, %l2 = 0000000000000000
	ldsha	[%i4+%g0]0x80,%l2	! %l2 = ffffffffffffdb0d
!	Mem[00000000100c1400] = ffff0000, %f1  = 0000b200
	lda	[%i3+%g0]0x88,%f1 	! %f1 = ffff0000
!	Mem[00000000100c1400] = ffff0000, %l1 = 0000000000000000
	ldswa	[%i3+%g0]0x88,%l1	! %l1 = ffffffffffff0000
!	Mem[00000000218000c0] = ffff5cf4, %l0 = 0000000000000007
	ldsha	[%o3+0x0c0]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141400] = 00000000, %l0 = ffffffffffffffff
	lduba	[%i5+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181408] = ff0000ff, %f29 = ffffffff
	lda	[%i6+%o4]0x81,%f29	! %f29 = ff0000ff
!	Mem[0000000030181408] = ff0000ff, %f25 = ff000000
	lda	[%i6+%o4]0x81,%f25	! %f25 = ff0000ff
!	Starting 10 instruction Store Burst
!	%f15 = ffb27b5a, Mem[0000000030101400] = 0700da69
	sta	%f15,[%i4+%g0]0x89	! Mem[0000000030101400] = ffb27b5a

p0_label_360:
!	Mem[0000000010141400] = 00000000, %l3 = 0000000003f2ff00
	swapa	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000000
!	%l5 = 00000000ff00b224, Mem[0000000010141410] = 00000000
	stwa	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = ff00b224
!	%l4 = 0000000000005a00, %l6 = ffffffffffff0ddb, %l6 = ffffffffffff0ddb
	addc	%l4,%l6,%l6		! %l6 = ffffffffffff67db
!	%f24 = 7099543b ff0000ff, %l0 = 0000000000000000
!	Mem[0000000030181410] = 0000ff00ff000000
	add	%i6,0x010,%g1
	stda	%f24,[%g1+%l0]ASI_PST16_S ! Mem[0000000030181410] = 0000ff00ff000000
!	Mem[0000000010041414] = 00000000, %l4 = 0000000000005a00, %asi = 80
	swapa	[%i1+0x014]%asi,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1410] = ffffffff, %l1 = ffffffffffff0000
	ldstuba	[%i3+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	%l5 = 00000000ff00b224, Mem[0000000030141400] = 00000000
	stha	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = b2240000
!	%l3 = 0000000000000000, Mem[0000000010001400] = 0000000000000000
	stxa	%l3,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000000
!	%l6 = ffffffffffff67db, Mem[0000000010101408] = db0dffff
	stwa	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = ffff67db
!	Starting 10 instruction Load Burst
!	Mem[0000000010041414] = 00005a00, %l5 = 00000000ff00b224
	ldsw	[%i1+0x014],%l5		! %l5 = 0000000000005a00

p0_label_361:
!	Mem[000000001014143c] = ffb2ff5a, %l7 = 0000000000000000
	lduh	[%i5+0x03c],%l7		! %l7 = 000000000000ffb2
!	Mem[0000000030181408] = ff0000ff, %l6 = ffffffffffff67db
	ldsha	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000211c0000] = ff893487, %l5 = 0000000000005a00
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 000000000000ff89
!	Mem[00000000300c1400] = 000000ff, %f11 = 7b68038d
	lda	[%i3+%g0]0x89,%f11	! %f11 = 000000ff
!	Mem[0000000030141408] = 00000000, %f13 = 00000000
	lda	[%i5+%o4]0x81,%f13	! %f13 = 00000000
!	Mem[0000000030081408] = 5a000000, %l3 = 0000000000000000
	lduwa	[%i2+%o4]0x81,%l3	! %l3 = 000000005a000000
!	Mem[0000000020800000] = ffff4ebd, %l1 = 00000000000000ff
	ldsh	[%o1+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[00000000100c1418] = ffffffff0000ffff, %f4  = 00000000 ff000000
	ldda	[%i3+0x018]%asi,%f4 	! %f4  = ffffffff 0000ffff
!	Mem[0000000021800140] = ffffcf8d, %l1 = ffffffffffffffff
	lduh	[%o3+0x140],%l1		! %l1 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000020800041] = 00ffc0bd, %l3 = 000000005a000000
	ldstuba	[%o1+0x041]%asi,%l3	! %l3 = 000000ff000000ff

p0_label_362:
!	Mem[00000000100c1410] = 00000000, %l3 = 00000000000000ff
	swapa	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%f4  = ffffffff 0000ffff, Mem[0000000030001408] = 4300b224 00000000
	stda	%f4 ,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffffff 0000ffff
!	%f14 = ff0000ff, %f8  = 03f2ff00, %f14 = ff0000ff
	fsubs	%f14,%f8 ,%f14		! %f14 = ff0000ff
!	%l4 = 00000000, %l5 = 0000ff89, Mem[0000000010041400] = ffffffff 0000ffff
	stda	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000 0000ff89
!	%l3 = 0000000000000000, Mem[0000000010101400] = ffff0ddb
	stba	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = ffff0d00
!	%l2 = ffffffffffffdb0d, Mem[000000001018140e] = 00000147, %asi = 80
	stha	%l2,[%i6+0x00e]%asi	! Mem[000000001018140c] = 0000db0d
!	%f15 = ffb27b5a, %f30 = 38763b02
	fcmps	%fcc1,%f15,%f30		! %fcc1 = 3
!	%f0  = ff000000 ffff0000 00000000 00ff0000
!	%f4  = ffffffff 0000ffff 0000ff00 00000000
!	%f8  = 03f2ff00 cd659a95 7ffb8e61 000000ff
!	%f12 = 00000000 00000000 ff0000ff ffb27b5a
	stda	%f0,[%i1]ASI_BLK_SL	! Block Store to 0000000030041400
!	%l5 = 000000000000ff89, Mem[0000000030001410] = 0000618e000000ff
	stxa	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000000000ff89
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (54)
!	Mem[0000000030041408] = 0000ff00, %f20 = ffffffff
	lda	[%i1+%o4]0x81,%f20	! %f20 = 0000ff00

p0_label_363:
!	Mem[0000000010101408] = ffff67db, %l5 = 000000000000ff89
	ldsha	[%i4+%o4]0x88,%l5	! %l5 = 00000000000067db
!	Mem[0000000020800040] = 00ffc0bd, %l0 = 0000000000000000
	ldub	[%o1+0x040],%l0		! %l0 = 0000000000000000
!	Mem[0000000030081408] = 0000005a, %l7 = 000000000000ffb2
	lduha	[%i2+%o4]0x89,%l7	! %l7 = 000000000000005a
!	Mem[0000000010101408] = db67ffff, %l3 = 0000000000000000
	lduha	[%i4+%o4]0x80,%l3	! %l3 = 000000000000db67
!	Mem[0000000030001408] = ffffffff, %f15 = ffb27b5a
	lda	[%i0+%o4]0x89,%f15	! %f15 = ffffffff
!	Mem[0000000030141400] = b2240000, %f7  = 00000000
	lda	[%i5+%g0]0x81,%f7 	! %f7 = b2240000
!	Mem[000000001000141c] = 00000046, %l5 = 00000000000067db
	ldsw	[%i0+0x01c],%l5		! %l5 = 0000000000000046
!	Mem[0000000010041434] = 8941ffd4, %l5 = 0000000000000046
	ldsw	[%i1+0x034],%l5		! %l5 = ffffffff8941ffd4
!	Mem[00000000300c1410] = ffffffff0000005a, %l0 = 0000000000000000
	ldxa	[%i3+%o5]0x81,%l0	! %l0 = ffffffff0000005a
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = ff0000ff, %l5 = ffffffff8941ffd4
	ldstuba	[%i6+%o4]0x81,%l5	! %l5 = 000000ff000000ff

p0_label_364:
!	%f8  = 03f2ff00, Mem[00000000100c1400] = ffff0000
	sta	%f8 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 03f2ff00
!	%l1 = 000000000000ffff, %l3 = 000000000000db67, %y  = 000005bb
	udiv	%l1,%l3,%l7		! %l7 = 0000000006afb461
	mov	%l0,%y			! %y = 0000005a
!	%l3 = 000000000000db67, Mem[00000000218001c0] = ff0008e2, %asi = 80
	stha	%l3,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = db6708e2
!	Mem[0000000030081408] = 0000005a, %l7 = 0000000006afb461
	swapa	[%i2+%o4]0x89,%l7	! %l7 = 000000000000005a
!	%f29 = ff0000ff, Mem[0000000010001408] = 00b20000
	sta	%f29,[%i0+%o4]0x88	! Mem[0000000010001408] = ff0000ff
!	%l0 = ffffffff0000005a, Mem[0000000030101410] = 00000000
	stha	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000005a
!	Mem[0000000010101408] = db67ffff, %l4 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l4	! %l4 = 00000000db67ffff
!	Mem[00000000211c0001] = ff893487, %l0 = ffffffff0000005a
	ldstub	[%o2+0x001],%l0		! %l0 = 00000089000000ff
!	%l3 = 000000000000db67, Mem[0000000010181408] = ff0000000000db0d, %asi = 80
	stxa	%l3,[%i6+0x008]%asi	! Mem[0000000010181408] = 000000000000db67
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000, %l6 = 00000000000000ff
	lduwa	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000000

p0_label_365:
!	Mem[0000000010041420] = ffffffff, %l0 = 0000000000000089
	lduha	[%i1+0x020]%asi,%l0	! %l0 = 000000000000ffff
!	Mem[0000000030101410] = 0000005a, %f14 = ff0000ff
	lda	[%i4+%o5]0x89,%f14	! %f14 = 0000005a
!	Mem[0000000010081400] = 00000000, %l7 = 000000000000005a
	lduha	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l6 = 0000000000000000
	ldsba	[%i4+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041408] = ffffffff, %l7 = 0000000000000000
	lduba	[%i1+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %l6 = 0000000000000000
	lduba	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081420] = 00000000, %l7 = 00000000000000ff
	lduha	[%i2+0x020]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041408] = ffffffff, %l6 = 0000000000000000
	lduw	[%i1+%o4],%l6		! %l6 = 00000000ffffffff
!	Mem[0000000010081400] = 00000000, %l2 = ffffffffffffdb0d
	lduha	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f18 = ffffffff 00000000, Mem[0000000030041410] = ffff0000 ffffffff
	stda	%f18,[%i1+%o5]0x81	! Mem[0000000030041410] = ffffffff 00000000

p0_label_366:
!	Mem[0000000010141400] = 00fff203, %l1 = 000000000000ffff
	swapa	[%i5+%g0]0x80,%l1	! %l1 = 0000000000fff203
!	%l0 = 000000000000ffff, Mem[0000000030141408] = 00000000
	stwa	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000ffff
!	Mem[00000000100c1433] = 74ff38d1, %l0 = 000000000000ffff
	ldstub	[%i3+0x033],%l0		! %l0 = 000000d1000000ff
!	Mem[0000000030101410] = 0000005a, %l3 = 000000000000db67
	ldstuba	[%i4+%o5]0x89,%l3	! %l3 = 0000005a000000ff
!	%l0 = 000000d1, %l1 = 00fff203, Mem[0000000030041410] = ffffffff 00000000
	stda	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000d1 00fff203
!	%f24 = 7099543b ff0000ff, Mem[0000000010001400] = 00000000 00000000
	stda	%f24,[%i0+%g0]0x80	! Mem[0000000010001400] = 7099543b ff0000ff
!	Mem[0000000010041408] = ffffffff, %l7 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010141410] = ff00b224, %l1 = 0000000000fff203
	swapa	[%i5+%o5]0x80,%l1	! %l1 = 00000000ff00b224
!	%l7 = 00000000000000ff, Mem[0000000030081400] = 00000000ffff0000
	stxa	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (55)
!	Mem[0000000010001400] = 7099543b ff0000ff ff0000ff 00b20000
!	Mem[0000000010001410] = 00000000 0000b200 ae46747d 00000046
!	Mem[0000000010001420] = 000000ff 000000ff ffffffff 000000ff
!	Mem[0000000010001430] = 74ff38d1 ffffffff ff800000 000000f2
	ldda	[%i0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010001400

p0_label_367:
!	Mem[0000000030141408] = ffff0000, %l5 = 00000000000000ff
	lduwa	[%i5+%o4]0x89,%l5	! %l5 = 00000000ffff0000
!	Mem[0000000030001400] = 00000000, %l6 = 00000000ffffffff
	ldswa	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = 67db000000000000, %f10 = 7ffb8e61 000000ff
	ldda	[%i6+%o4]0x88,%f10	! %f10 = 67db0000 00000000
!	Mem[00000000300c1400] = 0000b224000000ff, %f2  = 00000000 00ff0000
	ldda	[%i3+%g0]0x89,%f2 	! %f2  = 0000b224 000000ff
!	Mem[0000000030101408] = 00000000, %l4 = 00000000db67ffff
	lduwa	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = 000000ff, %l4 = 0000000000000000
	ldsha	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081428] = db0dffff, %l2 = 0000000000000000
	ldsba	[%i2+0x028]%asi,%l2	! %l2 = ffffffffffffffdb
!	Mem[0000000010101410] = 00000000, %l5 = 00000000ffff0000
	ldswa	[%i4+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1400] = 00fff203, %l3 = 000000000000005a
	lduwa	[%i3+%g0]0x80,%l3	! %l3 = 0000000000fff203
!	Starting 10 instruction Store Burst
!	Mem[0000000020800000] = ffff4ebd, %l4 = 00000000000000ff
	ldstub	[%o1+%g0],%l4		! %l4 = 000000ff000000ff

p0_label_368:
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000030001400] = 00000000 24b20000
	stda	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 000000ff
!	%l5 = 0000000000000000, Mem[0000000010101410] = 00000000
	stba	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	%l7 = 00000000000000ff, Mem[0000000030101410] = ff000000
	stwa	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000ff
!	Mem[00000000100c1408] = 0000b224, %l3 = 0000000000fff203, %asi = 80
	swapa	[%i3+0x008]%asi,%l3	! %l3 = 000000000000b224
!	Mem[0000000030081408] = 06afb461, %l0 = 00000000000000d1
	swapa	[%i2+%o4]0x89,%l0	! %l0 = 0000000006afb461
!	Mem[00000000300c1410] = ffffffff, %l0 = 0000000006afb461
	swapa	[%i3+%o5]0x89,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000010041407] = 89ff0000, %l2 = ffffffffffffffdb
	ldstuba	[%i1+0x007]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081404] = 00000000, %l4 = 00000000000000ff
	swap	[%i2+0x004],%l4		! %l4 = 0000000000000000
!	%l7 = 00000000000000ff, Mem[0000000010181400] = db0dff00
	stba	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = db0dffff
!	Starting 10 instruction Load Burst
!	%l0 = 00000000ffffffff, %l2 = 0000000000000000, %l0 = 00000000ffffffff
	xnor	%l0,%l2,%l0		! %l0 = ffffffff00000000

p0_label_369:
!	Mem[0000000010141400] = 0000ffff, %l5 = 0000000000000000
	lduwa	[%i5+%g0]0x80,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030001400] = ff00000000000000, %l3 = 000000000000b224
	ldxa	[%i0+%g0]0x89,%l3	! %l3 = ff00000000000000
!	Mem[0000000030001400] = 00000000000000ff, %l1 = 00000000ff00b224
	ldxa	[%i0+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041400] = 00000000, %l5 = 000000000000ffff
	ldsha	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181400] = ffffffff 000000ff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i6+%g0]0x89,%l4	! %l4 = 00000000000000ff 00000000ffffffff
!	Mem[0000000010001410] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000211c0000] = ffff3487, %l0 = ffffffff00000000
	ldub	[%o2+0x001],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010101408] = 00000000, %l2 = 0000000000000000
	lduwa	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %f3  = 000000ff
	lda	[%i1+%g0]0x88,%f3 	! %f3 = 00000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030001410] = 00000000 0000ff89
	stda	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000 00000000

p0_label_370:
!	Mem[0000000030141410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i5+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	%l1 = 00000000000000ff, %l5 = 00000000ffffffff, %l1 = 00000000000000ff
	xnor	%l1,%l5,%l1		! %l1 = ffffffff000000ff
!	Mem[0000000010141400] = ffff0000, %l6 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l6	! %l6 = 00000000ffff0000
!	%l0 = 00000000000000ff, %l6 = 00000000ffff0000, %y  = 0000005a
	umul	%l0,%l6,%l3		! %l3 = 000000feff010000, %y = 000000fe
!	%f14 = 0000005a ffffffff, Mem[0000000030041400] = 0000ffff 000000ff
	stda	%f14,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000005a ffffffff
!	Mem[0000000010041418] = 00000000, %l1 = ffffffff000000ff, %asi = 80
	swapa	[%i1+0x018]%asi,%l1	! %l1 = 0000000000000000
!	%f2  = 0000b224 00000000, Mem[0000000030081400] = 00000000 ff000000
	stda	%f2 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000b224 00000000
!	%f2  = 0000b224 00000000, Mem[0000000010141430] = 000000ff 000000ff
	stda	%f2 ,[%i5+0x030]%asi	! Mem[0000000010141430] = 0000b224 00000000
!	Mem[0000000010081408] = 00000000, %l7 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ffffffff 5a000000, %l6 = ffff0000, %l7 = 00000000
	ldda	[%i1+%g0]0x89,%l6	! %l6 = 000000005a000000 00000000ffffffff

p0_label_371:
!	Mem[00000000201c0000] = 00008ea0, %l6 = 000000005a000000
	ldsh	[%o0+%g0],%l6		! %l6 = 0000000000000000
!	Mem[0000000030181410] = 000000ff00ff0000, %l4 = 00000000000000ff
	ldxa	[%i6+%o5]0x89,%l4	! %l4 = 000000ff00ff0000
!	Mem[0000000030181400] = ffffffff 000000ff, %l6 = 00000000, %l7 = ffffffff
	ldda	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000ff 00000000ffffffff
!	Mem[0000000030181400] = ff000000, %l7 = 00000000ffffffff
	lduha	[%i6+%g0]0x81,%l7	! %l7 = 000000000000ff00
!	Mem[0000000010101408] = 00000000 00000000, %l4 = 00ff0000, %l5 = ffffffff
	ldda	[%i4+0x008]%asi,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010081410] = ff000000, %l3 = 000000feff010000
	lduha	[%i2+%o5]0x80,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010081400] = 00000000, %l1 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001408] = ffffffff, %l6 = 00000000000000ff
	ldswa	[%i0+%o4]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030041400] = 5a000000, %l6 = ffffffffffffffff
	ldswa	[%i1+%g0]0x89,%l6	! %l6 = 000000005a000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = ffb27b5a, %l2 = 0000000000000000
	swapa	[%i4+%g0]0x89,%l2	! %l2 = 00000000ffb27b5a

p0_label_372:
!	%l0 = 000000ff, %l1 = 00000000, Mem[00000000300c1408] = ffffffff 03f2ff00
	stda	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff 00000000
!	Mem[00000000100c1417] = 00000000, %l7 = 000000000000ff00
	ldstuba	[%i3+0x017]%asi,%l7	! %l7 = 00000000000000ff
!	%f20 = 00b20000 00000000, Mem[0000000030101400] = 00000000 023b7638
	stda	%f20,[%i4+%g0]0x81	! Mem[0000000030101400] = 00b20000 00000000
!	%f13 = 00000000, Mem[0000000010041408] = ffffffff
	sta	%f13,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	Mem[0000000030081410] = ffffffff, %l6 = 000000005a000000
	swapa	[%i2+%o5]0x81,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000010041404] = 89ff00ff, %l1 = 0000000000000000
	swap	[%i1+0x004],%l1		! %l1 = 0000000089ff00ff
!	%f12 = 00000000 00000000, Mem[0000000010081410] = ff000000 00000000
	std	%f12,[%i2+%o5]	! Mem[0000000010081410] = 00000000 00000000
!	%l6 = ffffffff, %l7 = 00000000, Mem[00000000300c1400] = ff000000 24b20000
	stda	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffff 00000000
!	%f28 = ffffffff d138ff74, Mem[0000000030081410] = 5a000000 ff000000
	stda	%f28,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffffff d138ff74
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 000000ff, %f3  = 00000000
	lda	[%i6+%g0]0x89,%f3 	! %f3 = 000000ff

p0_label_373:
!	Mem[00000000211c0000] = ffff3487, %l2 = 00000000ffb27b5a
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 000000000000ffff
!	Mem[00000000100c1410] = ff000000000000ff, %l4 = 0000000000000000
	ldxa	[%i3+%o5]0x88,%l4	! %l4 = ff000000000000ff
!	Mem[0000000030001410] = 00000000, %l0 = 00000000000000ff
	ldswa	[%i0+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l3 = 000000000000ff00
	ldsba	[%i2+0x001]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041428] = 00000000, %l1 = 0000000089ff00ff
	ldsb	[%i1+0x028],%l1		! %l1 = 0000000000000000
!	Mem[00000000300c1400] = ffffffff, %l0 = 0000000000000000
	lduba	[%i3+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081410] = 74ff38d1ffffffff, %f0  = ff000000 ffff0000
	ldda	[%i2+%o5]0x89,%f0 	! %f0  = 74ff38d1 ffffffff
!	Mem[00000000201c0000] = 00008ea0, %l2 = 000000000000ffff
	lduba	[%o0+0x001]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = 0000005a ffffffff, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i1+%g0]0x81,%l4	! %l4 = 000000000000005a 00000000ffffffff
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (56)
!	%l6 = 00000000ffffffff, Mem[000000001000141c] = 00000046
	stb	%l6,[%i0+0x01c]		! Mem[000000001000141c] = ff000046

p0_label_374:
!	%l5 = 00000000ffffffff, Mem[0000000030101410] = 000000ff
	stba	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = ff0000ff
!	%l7 = 0000000000000000, Mem[0000000030041400] = 0000005a
	stwa	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	Mem[0000000010081400] = 00000000, %l2 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101400] = 00b20000, %l1 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	%l4 = 0000005a, %l5 = ffffffff, Mem[0000000010141428] = 000000fd 618efb7f
	stda	%l4,[%i5+0x028]%asi	! Mem[0000000010141428] = 0000005a ffffffff
!	Mem[00000000211c0000] = ffff3487, %l3 = 0000000000000000
	ldstub	[%o2+%g0],%l3		! %l3 = 000000ff000000ff
!	Mem[0000000010001408] = ff0000ff, %l4 = 000000000000005a
	swap	[%i0+%o4],%l4		! %l4 = 00000000ff0000ff
!	%l1 = 0000000000000000, Mem[0000000010001400] = 7099543b
	stba	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = 0099543b
!	Mem[000000001004142d] = ffff0ddb, %l1 = 0000000000000000
	ldstuba	[%i1+0x02d]%asi,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = ffffcf8d, %l7 = 0000000000000000
	ldsh	[%o3+0x140],%l7		! %l7 = ffffffffffffffff

p0_label_375:
!	Mem[0000000030001400] = 00000000, %l4 = 00000000ff0000ff
	ldsba	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = ffffffff, %l2 = 0000000000000000
	lduha	[%i2+%o5]0x81,%l2	! %l2 = 000000000000ffff
!	Mem[00000000100c1400] = 00fff20300000000, %l1 = 00000000000000ff
	ldxa	[%i3+%g0]0x80,%l1	! %l1 = 00fff20300000000
!	%f15 = ffffffff, %f6  = 0000ff00, %f7  = b2240000
	fdivs	%f15,%f6 ,%f7 		! %f7  = ffffffff
!	Mem[00000000100c1410] = ff000000000000ff, %f28 = ffffffff d138ff74
	ldda	[%i3+0x010]%asi,%f28	! %f28 = ff000000 000000ff
!	Mem[0000000030141400] = b2240000 ffff0000 0000ffff ffff0ddb
!	Mem[0000000030141410] = ff000000 00000000 00000000 24b20000
!	Mem[0000000030141420] = 74ff38d1 ffffffff 00000147 000000ff
!	Mem[0000000030141430] = 74ff38d1 ffffffff 00000000 7b68038d
	ldda	[%i5]ASI_BLK_S,%f0	! Block Load from 0000000030141400
!	Mem[0000000010081404] = 000000ff, %l1 = 00fff20300000000
	lduw	[%i2+0x004],%l1		! %l1 = 00000000000000ff
!	Mem[000000001008143c] = 000000ff, %f28 = ff000000
	lda	[%i2+0x03c]%asi,%f28	! %f28 = 000000ff
!	Mem[0000000010101410] = 0000000000000000, %f22 = 46000000 7d7446ae
	ldd	[%i4+%o5],%f22		! %f22 = 00000000 00000000
!	Starting 10 instruction Store Burst
!	%f25 = ff000000, Mem[00000000100c1408] = 00fff203
	sta	%f25,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff000000

p0_label_376:
!	Mem[0000000030141400] = b2240000, %l0 = 00000000000000ff
	ldstuba	[%i5+%g0]0x81,%l0	! %l0 = 000000b2000000ff
!	Mem[0000000010101408] = 00000000, %l2 = 000000000000ffff
	ldstuba	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%f18 = 0000b200 ff0000ff, Mem[0000000030041400] = 00000000 ffffffff
	stda	%f18,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000b200 ff0000ff
!	%f20 = 00b20000 00000000, %l6 = 00000000ffffffff
!	Mem[00000000300c1410] = 61b4af060000005a
	add	%i3,0x010,%g1
	stda	%f20,[%g1+%l6]ASI_PST8_S ! Mem[00000000300c1410] = 00b2000000000000
!	%l7 = ffffffffffffffff, Mem[0000000010101408] = 000000ff
	stwa	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffffff
!	Mem[00000000201c0000] = 00008ea0, %l1 = 00000000000000ff
	ldstub	[%o0+%g0],%l1		! %l1 = 00000000000000ff
!	%l0 = 00000000000000b2, Mem[00000000100c1430] = 74ff38ffffffffff, %asi = 80
	stxa	%l0,[%i3+0x030]%asi	! Mem[00000000100c1430] = 00000000000000b2
!	Mem[0000000010041410] = ff00da69, %l0 = 00000000000000b2
	swapa	[%i1+%o5]0x80,%l0	! %l0 = 00000000ff00da69
!	Mem[0000000030081400] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i2+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00000000000000ff, %f18 = 0000b200 ff0000ff
	ldd	[%i1+%o4],%f18		! %f18 = 00000000 000000ff

p0_label_377:
!	Mem[0000000030141400] = ff240000ffff0000, %l5 = 00000000ffffffff
	ldxa	[%i5+%g0]0x81,%l5	! %l5 = ff240000ffff0000
!	Mem[0000000010001438] = ff800000, %l1 = 0000000000000000
	lduba	[%i0+0x03b]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181410] = 00ff0000, %l5 = ff240000ffff0000
	lduha	[%i6+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = 03f2ff00d1000000, %l5 = 0000000000000000
	ldxa	[%i1+%o5]0x89,%l5	! %l5 = 03f2ff00d1000000
!	Mem[000000001004143c] = 00000000, %f22 = 00000000
	lda	[%i1+0x03c]%asi,%f22	! %f22 = 00000000
!	Mem[00000000100c1420] = c6ffffff24b25d04, %l4 = 0000000000000000
	ldxa	[%i3+0x020]%asi,%l4	! %l4 = c6ffffff24b25d04
!	Mem[0000000030141400] = 0000ffff000024ff, %l5 = 03f2ff00d1000000
	ldxa	[%i5+%g0]0x89,%l5	! %l5 = 0000ffff000024ff
!	Mem[000000001018143c] = 0000ffff, %l5 = 0000ffff000024ff
	ldswa	[%i6+0x03c]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[00000000300c1408] = 00000000 000000ff, %l6 = ffffffff, %l7 = ffffffff
	ldda	[%i3+%o4]0x89,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Starting 10 instruction Store Burst
!	%f24 = ff000000 ff000000, Mem[00000000300c1400] = ffffffff 00000000
	stda	%f24,[%i3+%g0]0x89	! Mem[00000000300c1400] = ff000000 ff000000

p0_label_378:
!	Mem[0000000030181408] = ff0000ff, %l7 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l7	! %l7 = 00000000ff0000ff
!	Mem[0000000030181408] = 00000000, %l7 = 00000000ff0000ff
	swapa	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000201c0000] = ff008ea0, %l6 = 00000000000000ff
	ldstuba	[%o0+0x000]%asi,%l6	! %l6 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000030181408] = 00000000ff0000ff
	stxa	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000000000ff
!	%l4 = c6ffffff24b25d04, Mem[0000000030101408] = 0000ff0000000000
	stxa	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = c6ffffff24b25d04
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010101420] = 0000ffff 00000000
	stda	%l2,[%i4+0x020]%asi	! Mem[0000000010101420] = 00000000 000000ff
!	%l0 = 00000000ff00da69, Mem[0000000030081410] = ffffffff
	stha	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = da69ffff
!	%l1 = 0000000000000000, Mem[0000000030001400] = 00000000
	stha	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	%l1 = 0000000000000000, Mem[00000000300c1410] = 000000000000b200
	stxa	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ffffffffffff0d00, %f28 = 000000ff 000000ff
	ldda	[%i4+%g0]0x88,%f28	! %f28 = ffffffff ffff0d00

p0_label_379:
!	Mem[00000000100c1400] = 03f2ff00, %l6 = 00000000000000ff
	ldsha	[%i3+%g0]0x88,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000010041410] = b2000000, %l5 = 000000000000ffff
	ldswa	[%i1+%o5]0x88,%l5	! %l5 = ffffffffb2000000
!	Mem[0000000010041400] = 00000000, %l5 = ffffffffb2000000
	lduba	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = 000000ff 000000ff, %l4 = 24b25d04, %l5 = 00000000
	ldda	[%i3+%g0]0x81,%l4	! %l4 = 00000000000000ff 00000000000000ff
!	Mem[00000000100c1410] = 000000ff, %l1 = 0000000000000000
	lduha	[%i3+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000020800000] = ffff4ebd, %l6 = ffffffffffffff00
	ldsb	[%o1+%g0],%l6		! %l6 = ffffffffffffffff
!	%l7 = 0000000000000000, Mem[0000000010141410] = 03f2ff00
	stha	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 03f20000
!	Mem[0000000030081410] = da69ffff, %l4 = 00000000000000ff
	ldswa	[%i2+%o5]0x81,%l4	! %l4 = ffffffffda69ffff
!	Mem[00000000300c1410] = 00000000 00000000, %l4 = da69ffff, %l5 = 000000ff
	ldda	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%f16 = ff0000ff 3b549970, Mem[0000000010081410] = 00000000 00000000
	stda	%f16,[%i2+%o5]0x88	! Mem[0000000010081410] = ff0000ff 3b549970

p0_label_380:
!	%l2 = 0000000000000000, Mem[0000000010181400] = ffff0ddb
	stba	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 00ff0ddb
!	Mem[0000000030041400] = 00b20000, %l2 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000010081428] = db0dffff00000147
	stx	%l5,[%i2+0x028]		! Mem[0000000010081428] = 0000000000000000
!	%l1 = 00000000000000ff, Mem[0000000030081400] = ff00000024b20000
	stxa	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000000000ff
!	Mem[0000000010181400] = 00ff0ddb, %l5 = 0000000000000000
	ldstuba	[%i6+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[00000000100c1410] = ff000000000000ff
	stxa	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000000000ff
!	Mem[000000001004141c] = 0000b200, %l4 = 00000000, %l2 = 00000000
	add	%i1,0x1c,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 000000000000b200
!	Mem[0000000010041430] = ff0000ff, %l4 = 0000000000000000, %asi = 80
	swapa	[%i1+0x030]%asi,%l4	! %l4 = 00000000ff0000ff
!	%f17 = 3b549970, Mem[0000000030101408] = 045db224
	sta	%f17,[%i4+%o4]0x81	! Mem[0000000030101408] = 3b549970
!	Starting 10 instruction Load Burst
!	Mem[0000000010081438] = 00000003000000ff, %f2  = 0000ffff ffff0ddb
	ldd	[%i2+0x038],%f2 	! %f2  = 00000003 000000ff

p0_label_381:
!	Mem[0000000010001400] = 0099543bff0000ff, %f22 = 00000000 00000000
	ldda	[%i0+%g0]0x80,%f22	! %f22 = 0099543b ff0000ff
!	Mem[0000000010081400] = 00000000000000ff, %l0 = 00000000ff00da69
	ldxa	[%i2+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181408] = 00000000, %l7 = 0000000000000000
	lduba	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l2 = 000000000000b200
	lduwa	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[000000001004142c] = ffff0ddb, %l2 = 0000000000000000
	ldsb	[%i1+0x02d],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010141410] = 0000f203, %l0 = 00000000000000ff
	ldsba	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = 000dffff, %l1 = 00000000000000ff
	ldsba	[%i4+0x002]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041434] = 8941ffd4, %l6 = ffffffffffffffff
	lduwa	[%i1+0x034]%asi,%l6	! %l6 = 000000008941ffd4
!	Mem[0000000030001410] = 00000000, %l5 = 0000000000000000
	ldsba	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = d1000000, %l7 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l7	! %l7 = 000000d1000000ff

p0_label_382:
!	Mem[0000000010041409] = 00000000, %l7 = 00000000000000d1
	ldstuba	[%i1+0x009]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041418] = 000000ff, %l7 = 0000000000000000, %asi = 80
	swapa	[%i1+0x018]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041410] = 000000d1, %l1 = ffffffffffffffff
	swapa	[%i1+%o5]0x81,%l1	! %l1 = 00000000000000d1
!	%l5 = 0000000000000000, Mem[0000000030181410] = 0000ff00
	stwa	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	Mem[0000000010181438] = 000000000000ffff, %l2 = ffffffffffffffff, %l6 = 000000008941ffd4
	add	%i6,0x38,%g1
	casxa	[%g1]0x80,%l2,%l6	! %l6 = 000000000000ffff
!	%l3 = 00000000000000ff, Mem[0000000010001400] = 0099543b
	stha	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = 00ff543b
	membar	#Sync			! Added by membar checker (57)
!	%l4 = 00000000ff0000ff, Mem[0000000030141410] = ff000000
	stwa	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = ff0000ff
!	%l3 = 00000000000000ff, Mem[0000000030181408] = ff000000
	stba	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = ff000000
!	%f10 = 00000147 000000ff, %l1 = 00000000000000d1
!	Mem[0000000010181420] = 00000000000000f2
	add	%i6,0x020,%g1
	stda	%f10,[%g1+%l1]ASI_PST32_P ! Mem[0000000010181420] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ff000000, %l4 = 00000000ff0000ff
	lduha	[%i3+%o4]0x80,%l4	! %l4 = 000000000000ff00

p0_label_383:
!	Mem[0000000030041408] = 00ff0000, %l2 = ffffffffffffffff
	ldsha	[%i1+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %l4 = 000000000000ff00
	ldsha	[%i6+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101428] = db0dffff 00000000, %l4 = 00000000, %l5 = 00000000
	ldd	[%i4+0x028],%l4		! %l4 = 00000000db0dffff 0000000000000000
!	Mem[00000000300c1408] = 000000ff, %l5 = 0000000000000000
	lduwa	[%i3+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001420] = 000000ff000000ff, %l2 = 0000000000000000
	ldxa	[%i0+0x020]%asi,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010041410] = 005a0000b2000000, %l4 = 00000000db0dffff
	ldxa	[%i1+%o5]0x88,%l4	! %l4 = 005a0000b2000000
!	%l2 = 000000ff000000ff, imm = 0000000000000be5, %l2 = 000000ff000000ff
	or	%l2,0xbe5,%l2		! %l2 = 000000ff00000bff
!	%l5 = 00000000000000ff, immed = fffff708, %y  = 000000fe
	udiv	%l5,-0x8f8,%l3		! %l3 = 00000000000000fe
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000010141430] = 0000b224, %l5 = 00000000000000ff
	lduh	[%i5+0x030],%l5		! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = b2000000, %l5 = 00000000, Mem[0000000030181410] = 00000000 000000ff
	stda	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = b2000000 00000000

p0_label_384:
!	Mem[0000000010181408] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i6+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	%l2 = 000000ff00000bff, imm = 000000000000006f, %l3 = 00000000000000fe
	orn	%l2,0x06f,%l3		! %l3 = ffffffffffffffff
!	%l0 = 0000000000000000, imm = fffffffffffff21e, %l1 = 00000000000000d1
	xnor	%l0,-0xde2,%l1		! %l1 = 0000000000000de1
!	%l0 = 00000000, %l1 = 00000de1, Mem[0000000010101400] = 000dffff ffffffff
	stda	%l0,[%i4+0x000]%asi	! Mem[0000000010101400] = 00000000 00000de1
!	%l2 = 000000ff00000bff, immd = fffffffffffff2d8, %l7 = 00000000000000ff
	sdivx	%l2,-0xd28,%l7		! %l7 = ffffffffec9e198a
!	Mem[0000000010081410] = 7099543bff0000ff, %l2 = 000000ff00000bff, %l5 = 0000000000000000
	add	%i2,0x10,%g1
	casxa	[%g1]0x80,%l2,%l5	! %l5 = 7099543bff0000ff
!	%l7 = ffffffffec9e198a, Mem[0000000010041410] = b2000000
	stha	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = b200198a
!	%f28 = ffffffff ffff0d00, Mem[0000000010001410] = 00000000 00b20000
	stda	%f28,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffff ffff0d00
!	Mem[00000000300c1408] = ff000000, %l0 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001434] = ffffffff, %l0 = 00000000000000ff
	ldsb	[%i0+0x035],%l0		! %l0 = ffffffffffffffff

p0_label_385:
!	Mem[0000000010101410] = 00000000, %l2 = 000000ff00000bff
	lduwa	[%i4+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001410] = 000dffff, %l6 = 000000000000ffff
	ldsba	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181420] = 00000000, %f4  = ff000000
	lda	[%i6+0x020]%asi,%f4 	! %f4 = 00000000
!	Mem[0000000030001408] = ffffffff0000ffff, %l6 = 0000000000000000
	ldxa	[%i0+%o4]0x81,%l6	! %l6 = ffffffff0000ffff
!	Mem[0000000021800000] = 0000133c, %l7 = ffffffffec9e198a
	lduha	[%o3+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041408] = 0000ff00, %l2 = 0000000000000000
	lduwa	[%i1+%o4]0x81,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030101400] = 000000000000b2ff, %f20 = 00b20000 00000000
	ldda	[%i4+%g0]0x89,%f20	! %f20 = 00000000 0000b2ff
!	Mem[0000000030081410] = da69ffff, %l0 = ffffffffffffffff
	lduha	[%i2+%o5]0x81,%l0	! %l0 = 000000000000da69
!	Mem[0000000010001410] = ffff0d00, %l0 = 000000000000da69
	ldsha	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000d00
!	Starting 10 instruction Store Burst
!	%l2 = 0000ff00, %l3 = ffffffff, Mem[0000000010181400] = db0dffff ff000000
	stda	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000ff00 ffffffff

p0_label_386:
!	Mem[0000000030041408] = 0000ff00, %l3 = ffffffffffffffff
	ldstuba	[%i1+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%l2 = 000000000000ff00, Mem[0000000030181408] = ff000000
	stha	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = ff000000
!	%l0 = 0000000000000d00, Mem[0000000010181410] = 00000000db0d00ff
	stxa	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000000000d00
!	Mem[0000000030101410] = ff0000ff, %l0 = 0000000000000d00
	swapa	[%i4+%o5]0x81,%l0	! %l0 = 00000000ff0000ff
!	Mem[0000000030101408] = 3b549970, %l0 = 00000000ff0000ff
	swapa	[%i4+%o4]0x81,%l0	! %l0 = 000000003b549970
!	%l6 = 0000ffff, %l7 = 00000000, Mem[00000000300c1400] = 000000ff 000000ff
	stda	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000ffff 00000000
!	%f27 = ffffffff, Mem[0000000030081410] = ffff69da
	sta	%f27,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffffff
!	%l3 = 0000000000000000, Mem[00000000201c0000] = ff008ea0
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 00008ea0
!	Mem[0000000010041408] = 0000ff00, %l3 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	%l2 = 000000000000ff00, Mem[00000000211c0001] = ffff3487, %asi = 80
	stba	%l2,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff003487

p0_label_387:
!	Mem[0000000010141408] = 00000000, %l6 = ffffffff0000ffff
	ldsha	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001408] = 0000005a, %l6 = 0000000000000000
	lduha	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141410] = ff0000ff, %f21 = 0000b2ff
	lda	[%i5+%o5]0x81,%f21	! %f21 = ff0000ff
!	Mem[00000000201c0000] = 00008ea0, %l5 = 7099543bff0000ff
	ldsba	[%o0+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1408] = ff00000000000000, %l4 = 005a0000b2000000
	ldxa	[%i3+%o4]0x81,%l4	! %l4 = ff00000000000000
!	Mem[0000000030141410] = ff0000ff, %l4 = ff00000000000000
	lduba	[%i5+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1414] = 00000000, %f26 = ff000000
	ld	[%i3+0x014],%f26	! %f26 = 00000000
!	Mem[00000000100c1400] = 00fff203, %l5 = 0000000000000000
	lduh	[%i3+%g0],%l5		! %l5 = 00000000000000ff
!	%l3 = 0000000000000000, %l2 = 000000000000ff00, %l4 = 00000000000000ff
	and	%l3,%l2,%l4		! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081414] = ff0000ff, %l3 = 0000000000000000
	swap	[%i2+0x014],%l3		! %l3 = 00000000ff0000ff

p0_label_388:
!	%l6 = 0000000000000000, Mem[0000000010081400] = 00000000
	stwa	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010041400] = 00000000
	stwa	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	Mem[0000000010181410] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[00000000201c0000] = 00008ea0, %l0 = 000000003b549970
	ldstub	[%o0+%g0],%l0		! %l0 = 00000000000000ff
!	%l3 = 00000000ff0000ff, Mem[0000000030141410] = 00000000ff0000ff
	stxa	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000ff0000ff
!	Mem[0000000010101410] = 00000000, %l6 = 0000000000000000
	swapa	[%i4+%o5]0x80,%l6	! %l6 = 0000000000000000
!	%f11 = 000000ff, Mem[0000000010181410] = 000000ff
	sta	%f11,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010001410] = ffff0d00 ffffffff
	stda	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 00000000
!	%l2 = 000000000000ff00, Mem[0000000030101400] = 0000b2ff
	stba	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000b200
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ff008ea0, %l7 = 0000000000000000
	lduba	[%o0+0x000]%asi,%l7	! %l7 = 00000000000000ff

p0_label_389:
!	Mem[0000000010001408] = 5a000000, %l3 = 00000000ff0000ff
	ldsba	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l1 = 0000000000000de1
	lduwa	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000000
!	%l3 = 0000000000000000, %l1 = 0000000000000000, %l3 = 0000000000000000
	addc	%l3,%l1,%l3		! %l3 = 0000000000000000
!	Mem[0000000030081408] = 000000ff, %l3 = 0000000000000000
	lduba	[%i2+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041400] = ff00b200, %l3 = 00000000000000ff
	ldsha	[%i1+%g0]0x81,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000030101400] = 0000b200, %l3 = ffffffffffffff00
	lduwa	[%i4+%g0]0x89,%l3	! %l3 = 000000000000b200
!	Mem[0000000010001408] = 5a000000, %l1 = 0000000000000000
	ldsba	[%i0+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l7 = 00000000000000ff
	lduwa	[%i5+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181410] = 00000000b2000000, %l0 = 0000000000000000
	ldxa	[%i6+%o5]0x89,%l0	! %l0 = 00000000b2000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1434] = 000000b2, %l0 = 00000000b2000000
	swap	[%i3+0x034],%l0		! %l0 = 00000000000000b2

p0_label_390:
!	Mem[0000000030001408] = ffffffff, %l4 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l4	! %l4 = 000000ff000000ff
!	%l1 = 0000000000000000, Mem[0000000010141408] = 00000000
	stha	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	Mem[00000000100c1408] = ff000000, %l2 = 000000000000ff00
	swapa	[%i3+%o4]0x80,%l2	! %l2 = 00000000ff000000
!	%l4 = 00000000000000ff, Mem[0000000010001410] = 00000000
	stwa	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000ff
!	%l5 = 0000000000000000, Mem[0000000030101410] = 000d0000
	stwa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	%l1 = 0000000000000000, Mem[0000000030141408] = 0000ffff
	stha	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000ffff
!	%l2 = 00000000ff000000, Mem[00000000100c1400] = 03f2ff00
	stha	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 03f20000
!	Code Fragment 4
p0_fragment_33:
!	%l0 = 00000000000000b2
	setx	0xf9c4b29854947d94,%g7,%l0 ! %l0 = f9c4b29854947d94
!	%l1 = 0000000000000000
	setx	0xf63a70481afdb539,%g7,%l1 ! %l1 = f63a70481afdb539
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f9c4b29854947d94
	setx	0xb2c12ea7ae15d7e4,%g7,%l0 ! %l0 = b2c12ea7ae15d7e4
!	%l1 = f63a70481afdb539
	setx	0x4cfd8bdf8cf0be2e,%g7,%l1 ! %l1 = 4cfd8bdf8cf0be2e
!	%l0 = ae15d7e4, %l1 = 8cf0be2e, Mem[0000000030141410] = ff0000ff 00000000
	stda	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = ae15d7e4 8cf0be2e
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 000000ff, %l2 = 00000000ff000000
	lduba	[%i6+%o4]0x89,%l2	! %l2 = 00000000000000ff

p0_label_391:
!	Mem[0000000010101408] = ffffffff, %l0 = b2c12ea7ae15d7e4
	ldswa	[%i4+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000201c0000] = ff008ea0, %l4 = 00000000000000ff
	lduha	[%o0+0x000]%asi,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030181410] = 00000000b2000000, %f18 = 00000000 000000ff
	ldda	[%i6+%o5]0x89,%f18	! %f18 = 00000000 b2000000
!	Mem[0000000030181400] = 000000ff, %l7 = 0000000000000000
	lduha	[%i6+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181410] = 000000b2, %l1 = 4cfd8bdf8cf0be2e
	lduha	[%i6+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%l4 = 000000000000ff00, imm = fffffffffffff618, %l3 = 000000000000b200
	sub	%l4,-0x9e8,%l3		! %l3 = 00000000000108e8
!	Mem[0000000010141400] = 00000000, %l1 = 0000000000000000
	ldsba	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%f12 = 74ff38d1, %f27 = ffffffff, %f27 = ffffffff
	fdivs	%f12,%f27,%f27		! %f27 = ffffffff
!	Mem[00000000300c1400] = 0000ffff, %f17 = 3b549970
	lda	[%i3+%g0]0x81,%f17	! %f17 = 0000ffff
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000010101400] = 00000000
	stwa	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff

p0_label_392:
!	Mem[0000000030001410] = 00000000, %l1 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%f2  = 00000003 000000ff, Mem[00000000100c1408] = 0000ff00 ff0000ff
	stda	%f2 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000003 000000ff
!	Mem[0000000010181405] = ffffffff, %l2 = 00000000000000ff
	ldstuba	[%i6+0x005]%asi,%l2	! %l2 = 000000ff000000ff
!	%f14 = 00000000 7b68038d, Mem[0000000010181410] = ff000000 00000d00
	std	%f14,[%i6+%o5]	! Mem[0000000010181410] = 00000000 7b68038d
!	%l4 = 0000ff00, %l5 = 00000000, Mem[00000000100c1410] = 000000ff 00000000
	stda	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000ff00 00000000
!	%f13 = ffffffff, Mem[0000000010041408] = 0000ffff
	sta	%f13,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffffff
!	Mem[0000000020800000] = ffff4ebd, %l2 = 00000000000000ff
	ldstub	[%o1+%g0],%l2		! %l2 = 000000ff000000ff
!	%l2 = 000000ff, %l3 = 000108e8, Mem[0000000030081410] = ffffffff 74ff38d1
	stda	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff 000108e8
!	%f16 = ff0000ff 0000ffff, %l3 = 00000000000108e8
!	Mem[0000000030041420] = 959a65cd00fff203
	add	%i1,0x020,%g1
	stda	%f16,[%g1+%l3]ASI_PST32_SL ! Mem[0000000030041420] = 959a65cd00fff203
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 0000ff00, %l3 = 00000000000108e8
	ldsha	[%i3+%o5]0x88,%l3	! %l3 = ffffffffffffff00

p0_label_393:
!	Mem[0000000010181410] = 00000000, %l1 = 0000000000000000
	ldsba	[%i6+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181434] = 8941ffd4, %l0 = ffffffffffffffff
	lduh	[%i6+0x034],%l0		! %l0 = 0000000000008941
!	Mem[00000000100c1414] = 00000000, %l2 = 00000000000000ff
	ldsw	[%i3+0x014],%l2		! %l2 = 0000000000000000
!	Mem[00000000300c1408] = ff000000, %f12 = 74ff38d1
	lda	[%i3+%o4]0x81,%f12	! %f12 = ff000000
!	Mem[00000000100c1408] = 03000000, %l1 = 0000000000000000
	lduwa	[%i3+%o4]0x88,%l1	! %l1 = 0000000003000000
!	Mem[0000000030181410] = b2000000, %f0  = b2240000
	lda	[%i6+%o5]0x89,%f0 	! %f0 = b2000000
!	Mem[0000000010181400] = 0000ff00, %l0 = 0000000000008941
	ldsba	[%i6+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001400] = 00ff543b, %l1 = 0000000003000000
	lduwa	[%i0+0x000]%asi,%l1	! %l1 = 0000000000ff543b
!	Mem[0000000010081400] = ff000000 00000000, %l2 = 00000000, %l3 = ffffff00
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000000 00000000ff000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000ff543b, Mem[0000000030181410] = 000000b200000000
	stxa	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000000000ff543b

p0_label_394:
!	%f8  = 74ff38d1, Mem[0000000010101400] = 000000ff
	sta	%f8 ,[%i4+%g0]0x88	! Mem[0000000010101400] = 74ff38d1
!	%f10 = 00000147 000000ff, %l6 = 0000000000000000
!	Mem[0000000030001410] = 0000000000000000
	add	%i0,0x010,%g1
	stda	%f10,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030001410] = 0000000000000000
!	%f0  = b2000000 ffff0000, Mem[0000000030041408] = ff00ff00 00000000
	stda	%f0 ,[%i1+%o4]0x81	! Mem[0000000030041408] = b2000000 ffff0000
!	Mem[0000000030081408] = ff000000, %l7 = 00000000000000ff
	swapa	[%i2+%o4]0x81,%l7	! %l7 = 00000000ff000000
!	%l2 = 0000000000000000, Mem[0000000030181400] = ffffffff000000ff
	stxa	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010041408] = ff000000ffffffff
	stxa	%l5,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l4 = 000000000000ff00
	swapa	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010041420] = ffffffffffff0000, %asi = 80
	stxa	%l4,[%i1+0x020]%asi	! Mem[0000000010041420] = 0000000000000000
!	Mem[0000000010001408] = 0000005a 00b20000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i0+%o4]0x80,%l4	! %l4 = 000000000000005a 0000000000b20000
!	Starting 10 instruction Load Burst
!	%f13 = ffffffff, %f16 = ff0000ff, %f10 = 00000147
	fsubs	%f13,%f16,%f10		! %f10 = ffffffff

p0_label_395:
!	Mem[0000000010101408] = ffffffff, %f10 = ffffffff
	lda	[%i4+%o4]0x88,%f10	! %f10 = ffffffff
!	Mem[0000000030141408] = ffff0000, %l3 = 00000000ff000000
	lduba	[%i5+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1410] = 00ff0000 00000000, %l6 = 00000000, %l7 = ff000000
	ldda	[%i3+%o5]0x80,%l6	! %l6 = 0000000000ff0000 0000000000000000
!	Mem[0000000010001400] = 00ff543b, %l7 = 0000000000000000
	lduwa	[%i0+%g0]0x80,%l7	! %l7 = 0000000000ff543b
!	Mem[0000000030041410] = ffffffff00fff203, %l1 = 0000000000ff543b
	ldxa	[%i1+%o5]0x81,%l1	! %l1 = ffffffff00fff203
!	Mem[0000000010081418] = f200807f, %l1 = ffffffff00fff203
	ldsha	[%i2+0x01a]%asi,%l1	! %l1 = ffffffffffff807f
!	Mem[0000000010041408] = 00000000, %l6 = 0000000000ff0000
	ldsha	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101428] = db0dffff 00000000, %l4 = 0000005a, %l5 = 00b20000
	ldda	[%i4+0x028]%asi,%l4	! %l4 = 00000000db0dffff 0000000000000000
!	Mem[0000000010001408] = 5a000000, %f3  = 000000ff
	lda	[%i0+%o4]0x88,%f3 	! %f3 = 5a000000
!	Starting 10 instruction Store Burst
!	%f12 = ff000000 ffffffff, %l0 = 0000000000000000
!	Mem[0000000010141438] = ff000000ffb2ff5a
	add	%i5,0x038,%g1
	stda	%f12,[%g1+%l0]ASI_PST8_P ! Mem[0000000010141438] = ff000000ffb2ff5a

p0_label_396:
!	Mem[0000000010041410] = b200198a, %l7 = 0000000000ff543b
	ldstuba	[%i1+%o5]0x88,%l7	! %l7 = 0000008a000000ff
!	%f12 = ff000000 ffffffff, Mem[00000000100c1408] = 00000003 000000ff
	std	%f12,[%i3+%o4]	! Mem[00000000100c1408] = ff000000 ffffffff
!	%l0 = 0000000000000000, Mem[00000000218000c0] = ffff5cf4, %asi = 80
	stha	%l0,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 00005cf4
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010141400] = 00000000 00000000
	stda	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000 00000000
!	Mem[0000000010141400] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i5+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	%l6 = 00000000, %l7 = 0000008a, Mem[0000000010001408] = 5a000000 0000b200
	stda	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000 0000008a
!	Mem[0000000010001431] = 74ff38d1, %l0 = 0000000000000000
	ldstub	[%i0+0x031],%l0		! %l0 = 000000ff000000ff
!	%l4 = 00000000db0dffff, Mem[00000000100c1408] = ff000000
	stha	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffff0000
!	Mem[0000000030141400] = 000024ff, %l5 = 0000000000000000
	swapa	[%i5+%g0]0x89,%l5	! %l5 = 00000000000024ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 03f20000, %l0 = 00000000000000ff
	ldswa	[%i5+%o5]0x88,%l0	! %l0 = 0000000003f20000

p0_label_397:
!	Mem[0000000030001408] = ffffffff, %l4 = 00000000db0dffff
	ldsha	[%i0+%o4]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c1400] = 0000f20300000000, %l1 = ffffffffffff807f
	ldxa	[%i3+%g0]0x80,%l1	! %l1 = 0000f20300000000
!	Mem[0000000030101410] = 00000000, %l6 = 0000000000000000
	lduba	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l1 = 0000f20300000000
	ldsha	[%i0+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l3 = 0000000000000000
	lduba	[%i2+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = 0000ffff, %f17 = 0000ffff
	lda	[%i3+%g0]0x81,%f17	! %f17 = 0000ffff
!	Mem[0000000010181410] = 000000007b68038d, %f10 = ffffffff 000000ff
	ldda	[%i6+%o5]0x80,%f10	! %f10 = 00000000 7b68038d
!	Mem[0000000010081408] = 00000000, %l4 = ffffffffffffffff
	ldsha	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101408] = ff0000ffffffffc6, %f30 = f2000000 000080ff
	ldda	[%i4+%o4]0x81,%f30	! %f30 = ff0000ff ffffffc6
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010141410] = 03f20000 7f8000f2
	stda	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000 00000000

p0_label_398:
!	%l5 = 00000000000024ff, Mem[0000000030181400] = 00000000
	stba	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff
!	%l0 = 0000000003f20000, Mem[00000000300c1410] = 00000000
	stha	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	%l6 = 0000000000000000, Mem[0000000030001400] = 00000000
	stwa	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	%f16 = ff0000ff, Mem[000000001014141c] = 00000046
	sta	%f16,[%i5+0x01c]%asi	! Mem[000000001014141c] = ff0000ff
!	Mem[0000000030041410] = ffffffff, %l4 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	Mem[00000000100c1410] = 00ff0000, %l0 = 0000000003f20000
	swapa	[%i3+%o5]0x80,%l0	! %l0 = 0000000000ff0000
!	Mem[0000000010181408] = ff000000, %l6 = 0000000000000000
	ldstuba	[%i6+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	%l6 = 00000000000000ff, Mem[0000000010081410] = 7099543b
	stba	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = ff99543b
!	Mem[0000000010041400] = 00000000, %l4 = 00000000000000ff
	ldstuba	[%i1+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101438] = ffff0ddb, %l3 = 0000000000000000
	ldsh	[%i4+0x038],%l3		! %l3 = ffffffffffffffff

p0_label_399:
!	Mem[0000000030141408] = 0000ffff, %l2 = 0000000000000000
	lduwa	[%i5+%o4]0x81,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030041400] = ff00b200, %l2 = 000000000000ffff
	ldsha	[%i1+%g0]0x81,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000030001400] = 00000000, %l6 = 00000000000000ff
	lduha	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = 000000ff, %l5 = 00000000000024ff
	ldsba	[%i6+%o4]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030001400] = 00000000, %l1 = 0000000000000000
	ldsba	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = ff1900b200005a00, %f0  = b2000000 ffff0000
	ldda	[%i1+%o5]0x80,%f0 	! %f0  = ff1900b2 00005a00
!	Mem[0000000010101408] = ffffffff, %l7 = 000000000000008a
	lduwa	[%i4+%o4]0x88,%l7	! %l7 = 00000000ffffffff
	membar	#Sync			! Added by membar checker (58)
!	Mem[0000000010081400] = 00000000 000000ff 00000000 00000000
!	Mem[0000000010081410] = ff99543b 00000000 f200807f 0000ffff
!	Mem[0000000010081420] = 00000000 00000000 00000000 00000000
!	Mem[0000000010081430] = 00000000 ff000000 00000003 000000ff
	ldda	[%i2]ASI_BLK_AIUP,%f0	! Block Load from 0000000010081400
!	Mem[0000000030101400] = 0000b200, %l3 = ffffffffffffffff
	lduha	[%i4+%g0]0x89,%l3	! %l3 = 000000000000b200
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010041408] = 00000000
	stba	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000

p0_label_400:
!	%l7 = 00000000ffffffff, Mem[0000000030001400] = 00000000
	stba	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff
!	%l2 = ffffffffffffff00, Mem[0000000010041410] = b20019ff
	stwa	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffff00
!	%l4 = 0000000000000000, Mem[0000000010141400] = 000000ff
	stwa	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
	membar	#Sync			! Added by membar checker (59)
!	%f16 = ff0000ff, Mem[0000000010081400] = 00000000
	sta	%f16,[%i2+%g0]0x80	! Mem[0000000010081400] = ff0000ff
!	Mem[0000000021800081] = 57ff899f, %l4 = 0000000000000000
	ldstub	[%o3+0x081],%l4		! %l4 = 000000ff000000ff
!	%l6 = 0000000000000000, Mem[000000001018140c] = 0000db67
	stb	%l6,[%i6+0x00c]		! Mem[000000001018140c] = 0000db67
!	%l6 = 0000000000000000, Mem[00000000300c1410] = 0000000000000000
	stxa	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000000000000000
!	Mem[00000000100c1424] = 24b25d04, %l0 = 0000000000ff0000
	swap	[%i3+0x024],%l0		! %l0 = 0000000024b25d04
!	%f6  = f200807f 0000ffff, Mem[0000000030141410] = ae15d7e4 8cf0be2e
	stda	%f6 ,[%i5+%o5]0x89	! Mem[0000000030141410] = f200807f 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %l2 = ffffffffffffff00
	ldswa	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000

p0_label_401:
!	Mem[0000000030041408] = b2000000, %l4 = 00000000000000ff
	ldsha	[%i1+%o4]0x81,%l4	! %l4 = ffffffffffffb200
!	Mem[0000000010081408] = 0000000000000000, %l4 = ffffffffffffb200
	ldxa	[%i2+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181400] = ff000000, %f14 = 00000003
	lda	[%i6+%g0]0x81,%f14	! %f14 = ff000000
!	Mem[0000000010141420] = ffffffff 5fff7b5a, %l2 = 00000000, %l3 = 0000b200
	ldd	[%i5+0x020],%l2		! %l2 = 00000000ffffffff 000000005fff7b5a
!	Mem[0000000030041400] = ff0000ff 00b200ff, %l2 = ffffffff, %l3 = 5fff7b5a
	ldda	[%i1+%g0]0x89,%l2	! %l2 = 0000000000b200ff 00000000ff0000ff
!	Mem[00000000300c1408] = ff000000, %l3 = 00000000ff0000ff
	lduwa	[%i3+%o4]0x81,%l3	! %l3 = 00000000ff000000
!	%l4 = 0000000000000000, imm = fffffffffffff90b, %l5 = ffffffffffffffff
	addc	%l4,-0x6f5,%l5		! %l5 = fffffffffffff90b
!	%f27 = ffffffff, %f12 = 00000000, %f6  = f200807f
	fdivs	%f27,%f12,%f6 		! %f6  = ffffffff
!	Mem[000000001010141c] = 00000000, %l0 = 0000000024b25d04
	ldsba	[%i4+0x01f]%asi,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f16 = ff0000ff 0000ffff, %l5 = fffffffffffff90b
!	Mem[0000000030081428] = ffff0000804d822e
	add	%i2,0x028,%g1
	stda	%f16,[%g1+%l5]ASI_PST32_S ! Mem[0000000030081428] = ff0000ff0000ffff

p0_label_402:
!	%l4 = 0000000000000000, Mem[0000000010081400] = ff0000ff000000ff, %asi = 80
	stxa	%l4,[%i2+0x000]%asi	! Mem[0000000010081400] = 0000000000000000
!	Mem[0000000030101400] = 0000b200, %l4 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%f16 = ff0000ff 0000ffff, %l6 = 0000000000000000
!	Mem[0000000010181438] = 000000000000ffff
	add	%i6,0x038,%g1
	stda	%f16,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010181438] = 000000000000ffff
!	%l4 = 00000000, %l5 = fffff90b, Mem[0000000010181400] = 0000ff00 ffffffff
	stda	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000 fffff90b
!	%l3 = 00000000ff000000, Mem[0000000010041410] = ffffff00
	stha	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = ffff0000
!	%f11 = 00000000, Mem[0000000010141410] = 00000000
	sta	%f11,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	%f0  = 00000000 000000ff, %l6 = 0000000000000000
!	Mem[0000000030141428] = 00000147000000ff
	add	%i5,0x028,%g1
	stda	%f0,[%g1+%l6]ASI_PST32_S ! Mem[0000000030141428] = 00000147000000ff
!	Mem[0000000010181410] = 00000000, %l5 = fffffffffffff90b
	swapa	[%i6+%o5]0x80,%l5	! %l5 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000030001408] = ffffffff
	stba	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 00ffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 000000ff, %l1 = 0000000000000000
	ldswa	[%i1+%g0]0x88,%l1	! %l1 = 00000000000000ff

p0_label_403:
!	%f10 = 00000000, %f29 = ffff0d00, %f21 = ff0000ff
	fdivs	%f10,%f29,%f21		! %f21 = ffff0d00
!	Mem[0000000010141408] = 00ff0000, %l4 = 0000000000000000
	ldsh	[%i5+%o4],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010041400] = 00000000000000ff, %l2 = 0000000000b200ff
	ldxa	[%i1+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041400] = ff00b200 ff0000ff b2000000 ffff0000
!	Mem[0000000030041410] = ffffffff 00fff203 00000000 00ff0000
!	Mem[0000000030041420] = 959a65cd 00fff203 ff000000 618efb7f
!	Mem[0000000030041430] = 00000000 00000000 5a7bb2ff ff0000ff
	ldda	[%i1]ASI_BLK_AIUS,%f0	! Block Load from 0000000030041400
!	Mem[0000000010141408] = 00ff0000, %l0 = 0000000000000000
	ldsha	[%i5+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030181408] = ff000000, %l4 = 00000000000000ff
	lduha	[%i6+%o4]0x81,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030041410] = ffffffff, %l0 = 00000000000000ff
	ldsha	[%i1+%o5]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001400] = 00ff543b, %l1 = 00000000000000ff
	ldsba	[%i0+0x001]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010181408] = 000000ff, %f31 = ffffffc6
	lda	[%i6+%o4]0x88,%f31	! %f31 = 000000ff
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffffffff, Mem[0000000030001408] = ffffff00
	stwa	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffff

p0_label_404:
!	Mem[0000000030141400] = 00000000, %l3 = 00000000ff000000
	ldstuba	[%i5+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000030141410] = ffff0000
	stba	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = ffff0000
!	%l7 = 00000000ffffffff, Mem[0000000010081400] = 0000000000000000
	stxa	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000ffffffff
!	%f20 = 00000000, Mem[0000000030181410] = 00000000
	sta	%f20,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	Mem[000000001010140c] = 00000000, %l5 = 0000000000000000, %asi = 80
	swapa	[%i4+0x00c]%asi,%l5	! %l5 = 0000000000000000
!	%l2 = 00000000000000ff, Mem[0000000010001408] = 00000000
	stba	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff
!	%f0  = ff00b200 ff0000ff b2000000 ffff0000
!	%f4  = ffffffff 00fff203 00000000 00ff0000
!	%f8  = 959a65cd 00fff203 ff000000 618efb7f
!	%f12 = 00000000 00000000 5a7bb2ff ff0000ff
	stda	%f0,[%i6]ASI_COMMIT_P	! Block Store to 0000000010181400
!	%l4 = 000000000000ff00, Mem[0000000010001419] = ae46747d
	stb	%l4,[%i0+0x019]		! Mem[0000000010001418] = ae00747d
!	Mem[0000000030001408] = ffffffff, %l3 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081430] = 00000000, %l2 = 00000000000000ff
	lduha	[%i2+0x030]%asi,%l2	! %l2 = 0000000000000000

p0_label_405:
!	Mem[0000000030181410] = 00000000, %l4 = 000000000000ff00
	lduba	[%i6+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l5 = 0000000000000000
	lduwa	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (60)
!	Mem[0000000030181400] = ff000000 00000000 ff000000 00000000
!	Mem[0000000030181410] = 00000000 00ff543b 83cf7f40 ff18b28f
!	Mem[0000000030181420] = d4ff4189 ff0000ff 2e824d80 0000ffff
!	Mem[0000000030181430] = 00000d00 000000ff 000000c8 edbe00c3
	ldda	[%i6]ASI_BLK_S,%f0	! Block Load from 0000000030181400
!	Mem[0000000030101410] = 00000000, %l7 = 00000000ffffffff
	ldswa	[%i4+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = ff0000ff00b200ff, %f18 = 00000000 b2000000
	ldda	[%i6+%g0]0x88,%f18	! %f18 = ff0000ff 00b200ff
!	Mem[0000000030141408] = ffff0000, %l5 = 0000000000000000
	lduwa	[%i5+%o4]0x89,%l5	! %l5 = 00000000ffff0000
!	Mem[0000000010001408] = 000000ff, %l7 = 0000000000000000
	lduwa	[%i0+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041410] = 0000ffff, %l5 = 00000000ffff0000
	ldsha	[%i1+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181418] = 0000000000ff0000, %f22 = 0099543b ff0000ff
	ldda	[%i6+0x018]%asi,%f22	! %f22 = 00000000 00ff0000
!	Starting 10 instruction Store Burst
!	%f30 = ff0000ff, Mem[0000000010141408] = 00ff0000
	sta	%f30,[%i5+%o4]0x80	! Mem[0000000010141408] = ff0000ff

p0_label_406:
!	Mem[0000000010181408] = b2000000, %l0 = ffffffffffffffff
	ldstuba	[%i6+%o4]0x80,%l0	! %l0 = 000000b2000000ff
!	%f28 = ffffffff ffff0d00, Mem[0000000010181410] = ffffffff 00fff203
	stda	%f28,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffffff ffff0d00
!	%l7 = 00000000000000ff, Mem[0000000010181408] = 000000ff
	stwa	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff
!	%f29 = ffff0d00, Mem[0000000010001408] = 000000ff
	sta	%f29,[%i0+%o4]0x88	! Mem[0000000010001408] = ffff0d00
!	%l4 = 0000000000000000, Mem[0000000030141408] = 0000ffff
	stwa	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	Mem[0000000030141408] = 00000000, %l1 = ffffffffffffffff
	swapa	[%i5+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000021800100] = ff900b85, %l3 = 00000000000000ff
	ldstub	[%o3+0x100],%l3		! %l3 = 000000ff000000ff
!	Mem[00000000100c1410] = 03f20000, %l4 = 00000000, %l1 = 00000000
	add	%i3,0x10,%g1
	casa	[%g1]0x80,%l4,%l1	! %l1 = 0000000003f20000
!	Mem[000000001008143c] = 000000ff, %l0 = 000000b2, %l5 = 00000000
	add	%i2,0x3c,%g1
	casa	[%g1]0x80,%l0,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = b2000000, %f31 = 000000ff
	lda	[%i1+%o4]0x81,%f31	! %f31 = b2000000

p0_label_407:
!	Mem[00000000201c0000] = ff008ea0, %l4 = 0000000000000000
	lduha	[%o0+0x000]%asi,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010101408] = ffffffff, %l6 = 0000000000000000
	ldswa	[%i4+%o4]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010001410] = 000000ff, %l0 = 00000000000000b2
	ldswa	[%i0+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041408] = 00000000, %f16 = ff0000ff
	lda	[%i1+%o4]0x88,%f16	! %f16 = 00000000
!	Mem[0000000030081400] = 00000000, %l0 = 00000000000000ff
	ldswa	[%i2+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0000] = ff008ea0, %l7 = 00000000000000ff
	ldub	[%o0+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010001408] = 000dffff, %l3 = 00000000000000ff
	ldsw	[%i0+%o4],%l3		! %l3 = 00000000000dffff
!	Mem[00000000300c1410] = 00000000, %l3 = 00000000000dffff
	ldswa	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101410] = 0000000000000000, %l4 = 000000000000ff00
	ldxa	[%i4+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (61)
!	%l4 = 0000000000000000, Mem[0000000030181410] = 00000000
	stba	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000

p0_label_408:
!	%l0 = 00000000, %l1 = 03f20000, Mem[0000000010081400] = 00000000 ffffffff
	stda	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000 03f20000
!	Mem[0000000010101408] = ffffffff, %l7 = 00000000000000ff
	ldstuba	[%i4+%o4]0x88,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000211c0000] = ff003487, %l1 = 0000000003f20000
	ldstub	[%o2+%g0],%l1		! %l1 = 000000ff000000ff
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030101408] = ff0000ff ffffffc6
	stda	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 00000000
!	Mem[0000000010001408] = 000dffff, %l1 = 00000000000000ff
	ldstuba	[%i0+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030041400] = ff00b200, %l4 = 0000000000000000
	ldstuba	[%i1+%g0]0x81,%l4	! %l4 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000010041410] = 0000ffff
	stha	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = 00ffffff
!	%f19 = 00b200ff, Mem[000000001000141c] = ff000046
	st	%f19,[%i0+0x01c]	! Mem[000000001000141c] = 00b200ff
!	%l3 = 0000000000000000, Mem[0000000010041424] = 00000000, %asi = 80
	stha	%l3,[%i1+0x024]%asi	! Mem[0000000010041424] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181404] = ff0000ff, %l5 = 00000000000000ff
	ldsh	[%i6+0x004],%l5		! %l5 = ffffffffffffff00

p0_label_409:
!	Mem[0000000010181408] = 000000ff, %l5 = ffffffffffffff00
	ldsha	[%i6+%o4]0x88,%l5	! %l5 = 00000000000000ff
	membar	#Sync			! Added by membar checker (62)
!	Mem[0000000010001400] = 00ff543b ff0000ff ff0dffff 8a000000
!	Mem[0000000010001410] = 000000ff 00000000 ae00747d 00b200ff
!	Mem[0000000010001420] = 000000ff 000000ff ffffffff 000000ff
!	Mem[0000000010001430] = 74ff38d1 ffffffff ff800000 000000f2
	ldda	[%i0]ASI_BLK_P,%f0	! Block Load from 0000000010001400
!	Mem[0000000030141408] = ffffffff ffff0ddb, %l4 = 000000ff, %l5 = 000000ff
	ldda	[%i5+%o4]0x81,%l4	! %l4 = 00000000ffffffff 00000000ffff0ddb
!	%f24 = ff000000, %f28 = ffffffff ffff0d00
	fitod	%f24,%f28		! %f28 = c1700000 00000000
!	%f28 = c1700000, %f29 = 00000000
	fcmpes	%fcc1,%f28,%f29		! %fcc1 = 1
!	Mem[0000000010141400] = 00000000, %l6 = ffffffffffffffff
	lduba	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000000
!	%f19 = 00b200ff, %f30 = ff0000ff, %f28 = c1700000
	fadds	%f19,%f30,%f28		! %f28 = ff0000ff
!	Mem[0000000010041410] = 00ffffff, %l6 = 0000000000000000
	ldsba	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l0 = 0000000000000000
	ldsba	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f26 = 00000000, Mem[0000000030041408] = 000000b2
	sta	%f26,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000

p0_label_410:
!	Mem[0000000010141428] = 0000005affffffff, %l0 = 0000000000000000, %l0 = 0000000000000000
	add	%i5,0x28,%g1
	casxa	[%g1]0x80,%l0,%l0	! %l0 = 0000005affffffff
!	%f28 = ff0000ff 00000000, %l6 = 0000000000000000
!	Mem[0000000010101420] = 00000000000000ff
	add	%i4,0x020,%g1
	stda	%f28,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010101420] = 00000000000000ff
!	Mem[0000000010041412] = 00ffffff, %l7 = 00000000000000ff
	ldstuba	[%i1+0x012]%asi,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010101400] = 74ff38d1, %l0 = 0000005affffffff
	ldstuba	[%i4+%g0]0x88,%l0	! %l0 = 000000d1000000ff
!	%l0 = 000000d1, %l1 = 00000000, Mem[00000000300c1400] = 0000ffff 00000000
	stda	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000d1 00000000
!	Mem[0000000010141408] = ff0000ff, %l0 = 00000000000000d1
	ldstuba	[%i5+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[0000000030181400] = 000000ff
	stwa	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff
!	Mem[00000000201c0001] = ff008ea0, %l7 = 00000000000000ff
	ldstub	[%o0+0x001],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030101408] = 00000000, %l1 = 0000000000000000
	swapa	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00000000, %l6 = 0000000000000000
	lduwa	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000

p0_label_411:
!	Mem[0000000030081410] = ff000000, %l0 = 00000000000000ff
	lduwa	[%i2+%o5]0x81,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030081400] = 00000000, %l4 = 00000000ffffffff
	ldswa	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101414] = 00000000, %l3 = 0000000000000000
	lduha	[%i4+0x016]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141408] = ffffffff, %l4 = 0000000000000000
	ldswa	[%i5+%o4]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030141408] = ffffffff, %l5 = 00000000ffff0ddb
	ldsha	[%i5+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030181410] = 00000000, %l7 = 0000000000000000
	lduha	[%i6+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = ff000000, %l0 = 00000000ff000000
	ldsha	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %l0 = 0000000000000000
	ldsba	[%i4+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141408] = ff0000ff, %l1 = 0000000000000000
	lduba	[%i5+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 00000000, %l4 = ffffffffffffffff
	ldstuba	[%i1+%o4]0x81,%l4	! %l4 = 00000000000000ff

p0_label_412:
!	Mem[00000000300c1400] = 000000d1, %l7 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l7	! %l7 = 00000000000000d1
!	%l4 = 00000000, %l5 = ffffffff, Mem[0000000010081418] = f200807f 0000ffff
	std	%l4,[%i2+0x018]		! Mem[0000000010081418] = 00000000 ffffffff
!	%l1 = 00000000000000ff, Mem[0000000020800000] = ffff4ebd
	sth	%l1,[%o1+%g0]		! Mem[0000000020800000] = 00ff4ebd
!	%l1 = 00000000000000ff, Mem[0000000010141408] = ff0000ff
	stha	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = ff0000ff
!	Mem[0000000010181408] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i6+%o4]0x80,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030001408] = ffffffff, %l1 = 00000000000000ff
	ldstuba	[%i0+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[00000000300c1408] = ff00000000000000
	stxa	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000000000000
!	%l6 = 00000000, %l7 = 000000d1, Mem[00000000100c1410] = 0000f203 00000000
	stda	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000 000000d1
!	Mem[0000000010001408] = ffff0dff, %l2 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l2	! %l2 = 00000000ffff0dff
!	Starting 10 instruction Load Burst
!	%l0 = 0000000000000000, imm = 0000000000000f57, %l2 = 00000000ffff0dff
	xor	%l0,0xf57,%l2		! %l2 = 0000000000000f57

p0_label_413:
!	Mem[0000000030001408] = ffff0000 ffffffff, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 00000000ffffffff 00000000ffff0000
!	Mem[0000000010001400] = 3b54ff00, %l6 = 0000000000000000
	ldswa	[%i0+%g0]0x88,%l6	! %l6 = 000000003b54ff00
!	Mem[0000000030181400] = 000000ff, %l7 = 00000000000000d1
	lduba	[%i6+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181408] = ff000000, %l1 = 00000000ffff0000
	ldsba	[%i6+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010141410] = 0000000000000000, %l5 = ffffffffffffffff
	ldx	[%i5+%o5],%l5		! %l5 = 0000000000000000
!	Mem[0000000030181408] = ff000000, %l4 = 00000000000000ff
	swapa	[%i6+%o4]0x81,%l4	! %l4 = 00000000ff000000
!	Mem[00000000100c1400] = 0000f203, %l6 = 000000003b54ff00
	lduba	[%i3+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = ff38ff74, %l4 = 00000000ff000000
	ldsba	[%i4+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c1408] = ffff0000, %f4  = 000000ff
	lda	[%i3+%o4]0x80,%f4 	! %f4 = ffff0000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 00000000, %l2 = 0000000000000f57
	ldstuba	[%i3+%g0]0x81,%l2	! %l2 = 00000000000000ff

p0_label_414:
!	Mem[0000000010141407] = 00000000, %l0 = 00000000ffffffff
	ldstuba	[%i5+0x007]%asi,%l0	! %l0 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000020800000] = 00ff4ebd, %asi = 80
	stha	%l2,[%o1+0x000]%asi	! Mem[0000000020800000] = 00004ebd
!	%f12 = 74ff38d1 ffffffff, %l7 = 00000000000000ff
!	Mem[0000000030081400] = 00000000000000ff
	stda	%f12,[%i2+%l7]ASI_PST32_S ! Mem[0000000030081400] = 74ff38d1ffffffff
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030181410] = 00000000 00ff543b
	stda	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000 00000000
!	%l7 = 00000000000000ff, immed = 000002fa, %y  = 00000000
	smul	%l7,0x2fa,%l1		! %l1 = 000000000002f706, %y = 00000000
!	%f24 = ff000000 ff000000, Mem[0000000010181408] = ff000000 ffff0000
	stda	%f24,[%i6+%o4]0x80	! Mem[0000000010181408] = ff000000 ff000000
!	Mem[00000000100c1400] = 0000f20300000000, %l7 = 00000000000000ff, %l0 = 0000000000000000
	casxa	[%i3]0x80,%l7,%l0	! %l0 = 0000f20300000000
!	Mem[0000000010081410] = ff99543b, %l6 = 0000000000000000
	swapa	[%i2+%o5]0x80,%l6	! %l6 = 00000000ff99543b
!	Mem[0000000030041400] = 00b200ff, %l7 = 00000000000000ff
	swapa	[%i1+%g0]0x89,%l7	! %l7 = 0000000000b200ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141424] = 5fff7b5a, %l1 = 000000000002f706
	ldswa	[%i5+0x024]%asi,%l1	! %l1 = 000000005fff7b5a

p0_label_415:
!	Mem[0000000010081410] = 00000000, %l0 = 0000f20300000000
	lduha	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101408] = ffffffff, %l7 = 0000000000b200ff
	lduha	[%i4+%o4]0x88,%l7	! %l7 = 000000000000ffff
!	Code Fragment 3
p0_fragment_34:
!	%l0 = 0000000000000000
	setx	0x4004e11fe5c146f6,%g7,%l0 ! %l0 = 4004e11fe5c146f6
!	%l1 = 000000005fff7b5a
	setx	0x0bcbdb27dcbfef2b,%g7,%l1 ! %l1 = 0bcbdb27dcbfef2b
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4004e11fe5c146f6
	setx	0x5a8daa4fab3806fb,%g7,%l0 ! %l0 = 5a8daa4fab3806fb
!	%l1 = 0bcbdb27dcbfef2b
	setx	0x184056103cd21444,%g7,%l1 ! %l1 = 184056103cd21444
!	Mem[00000000201c0000] = ffff8ea0, %l4 = ffffffffffffffff
	lduh	[%o0+%g0],%l4		! %l4 = 000000000000ffff
!	Mem[0000000030101408] = 00000000, %l2 = 0000000000000000
	ldswa	[%i4+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181430] = 00000000, %l2 = 0000000000000000
	lduba	[%i6+0x033]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181410] = 0000000000000000, %f0  = 00ff543b ff0000ff
	ldda	[%i6+%o5]0x81,%f0 	! %f0  = 00000000 00000000
!	Mem[0000000010101418] = 210000ff00000000, %l0 = 5a8daa4fab3806fb
	ldx	[%i4+0x018],%l0		! %l0 = 210000ff00000000
!	Mem[0000000010101410] = 00000000, %l3 = 0000000000000000
	ldswa	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ff99543b, Mem[0000000030181400] = 00000000000000ff
	stxa	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000ff99543b

p0_label_416:
!	Mem[0000000030081408] = 000000ff, %l1 = 184056103cd21444
	swapa	[%i2+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1400] = 000000ff, %l7 = 000000000000ffff
	ldstuba	[%i3+%g0]0x89,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000100c140f] = ffffffff, %l2 = 0000000000000000
	ldstuba	[%i3+0x00f]%asi,%l2	! %l2 = 000000ff000000ff
!	%f28 = ff0000ff, Mem[0000000010101408] = ffffffff
	sta	%f28,[%i4+%o4]0x80	! Mem[0000000010101408] = ff0000ff
!	Mem[0000000030141400] = 000000ff, %l7 = 00000000000000ff
	swapa	[%i5+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	%f5  = 00000000, Mem[000000001014141c] = ff0000ff
	st	%f5 ,[%i5+0x01c]	! Mem[000000001014141c] = 00000000
!	Mem[00000000100c1400] = 03f20000, %l7 = 00000000000000ff
	swapa	[%i3+%g0]0x88,%l7	! %l7 = 0000000003f20000
!	%f0  = 00000000 00000000 ff0dffff 8a000000
!	%f4  = ffff0000 00000000 ae00747d 00b200ff
!	%f8  = 000000ff 000000ff ffffffff 000000ff
!	%f12 = 74ff38d1 ffffffff ff800000 000000f2
	stda	%f0,[%i2]ASI_BLK_SL	! Block Store to 0000000030081400
!	Mem[0000000010041430] = 00000000, %l6 = 00000000ff99543b
	swap	[%i1+0x030],%l6		! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (63)
!	Mem[0000000030081400] = 00000000, %l5 = 0000000000000000
	lduba	[%i2+%g0]0x81,%l5	! %l5 = 0000000000000000

p0_label_417:
!	Mem[00000000100c1420] = c6ffffff 00ff0000, %l4 = 0000ffff, %l5 = 00000000
	ldda	[%i3+0x020]%asi,%l4	! %l4 = 00000000c6ffffff 0000000000ff0000
!	Mem[0000000010001438] = ff800000, %f1  = 00000000
	lda	[%i0+0x038]%asi,%f1 	! %f1 = ff800000
!	Mem[00000000100c1410] = 00000000, %l3 = 0000000000000000
	lduba	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%l5 = 0000000000ff0000, %l6 = 0000000000000000, %y  = 00000000
	smul	%l5,%l6,%l6		! %l6 = 0000000000000000, %y = 00000000
!	Mem[00000000100c140c] = ffffffff, %l0 = 210000ff00000000
	ldsha	[%i3+0x00e]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000201c0000] = ffff8ea0, %l1 = 00000000000000ff
	lduba	[%o0+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030041408] = 000000ff, %l0 = ffffffffffffffff
	lduba	[%i1+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101400] = 74ff38ff, %l2 = 00000000000000ff
	lduwa	[%i4+%g0]0x88,%l2	! %l2 = 0000000074ff38ff
!	Mem[0000000010001410] = 000000ff, %l4 = 00000000c6ffffff
	ldsb	[%i0+0x011],%l4		! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000003f20000, imm = 00000000000003a6, %l0 = 00000000000000ff
	subc	%l7,0x3a6,%l0		! %l0 = 0000000003f1fc5a

p0_label_418:
!	%l1 = 00000000000000ff, Mem[000000001000143c] = 000000f2, %asi = 80
	stha	%l1,[%i0+0x03c]%asi	! Mem[000000001000143c] = 00ff00f2
!	%f21 = ffff0d00, Mem[0000000010081410] = 00000000
	sta	%f21,[%i2+%o5]0x80	! Mem[0000000010081410] = ffff0d00
!	%l5 = 0000000000ff0000, Mem[0000000010081408] = 00000000
	stba	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	%l5 = 0000000000ff0000, Mem[00000000201c0000] = ffff8ea0
	stb	%l5,[%o0+%g0]		! Mem[00000000201c0000] = 00ff8ea0
!	%l1 = 00000000000000ff, Mem[0000000030101400] = ffb20000
	stwa	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff
!	%f22 = 00000000 00ff0000, Mem[0000000010181410] = ffffffff 000dffff
	stda	%f22,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000 00ff0000
!	%l4 = 00000000, %l5 = 00ff0000, Mem[0000000030041408] = ff000000 ffff0000
	stda	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000 00ff0000
!	Mem[0000000010181427] = 00fff203, %l2 = 0000000074ff38ff
	ldstuba	[%i6+0x027]%asi,%l2	! %l2 = 00000003000000ff
!	Mem[0000000030141400] = 000000ff, %l3 = 0000000000000000
	swapa	[%i5+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800080] = 57ff899f, %l5 = 0000000000ff0000
	ldsh	[%o3+0x080],%l5		! %l5 = 00000000000057ff

p0_label_419:
!	Mem[0000000020800000] = 00004ebd, %l3 = 00000000000000ff
	lduh	[%o1+%g0],%l3		! %l3 = 0000000000000000
!	Mem[0000000010001400] = ff0000ff3b54ff00, %l5 = 00000000000057ff
	ldxa	[%i0+%g0]0x88,%l5	! %l5 = ff0000ff3b54ff00
!	%f12 = 74ff38d1, %f12 = 74ff38d1
	fcmpes	%fcc3,%f12,%f12		! %fcc3 = 0
!	Mem[0000000030001408] = ffffffff, %l4 = 0000000000000000
	ldsba	[%i0+%o4]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081408] = 00000000, %l6 = 0000000000000000
	lduha	[%i2+0x008]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l0 = 0000000003f1fc5a
	lduba	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000211c0000] = ff003487, %l2 = 0000000000000003
	ldsb	[%o2+0x001],%l2		! %l2 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %f5  = 00000000
	lda	[%i3+%o4]0x81,%f5 	! %f5 = 00000000
!	Mem[0000000030041400] = 000000ff, %l4 = ffffffffffffffff
	lduwa	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010001410] = 000000ff00000000
	stxa	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000000

p0_label_420:
!	%f2  = ff0dffff 8a000000, Mem[0000000030181408] = 000000ff 00000000
	stda	%f2 ,[%i6+%o4]0x81	! Mem[0000000030181408] = ff0dffff 8a000000
!	Mem[00000000201c0001] = 00ff8ea0, %l6 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010181408] = ff000000, %l0 = 00000000, %l5 = 3b54ff00
	add	%i6,0x08,%g1
	casa	[%g1]0x80,%l0,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030041410] = ffffffff, %l0 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000010181400] = ff00b200, %l7 = 0000000003f20000
	swapa	[%i6+%g0]0x80,%l7	! %l7 = 00000000ff00b200
!	Code Fragment 4
p0_fragment_35:
!	%l0 = 00000000ffffffff
	setx	0xde87665848857ef0,%g7,%l0 ! %l0 = de87665848857ef0
!	%l1 = 00000000000000ff
	setx	0x0df726880288c285,%g7,%l1 ! %l1 = 0df726880288c285
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = de87665848857ef0
	setx	0x1444962f90559c47,%g7,%l0 ! %l0 = 1444962f90559c47
!	%l1 = 0df726880288c285
	setx	0xf04c31c017879005,%g7,%l1 ! %l1 = f04c31c017879005
!	%l4 = 00000000000000ff, Mem[0000000010041400] = 000000ff
	stba	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000ff
!	Mem[0000000010081410] = ffff0d00, %l3 = 0000000000000000, %asi = 80
	swapa	[%i2+0x010]%asi,%l3	! %l3 = 00000000ffff0d00
!	%l2 = 0000000000000000, Mem[0000000010181410] = 00ff0000
	stha	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 00ff0000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 0000000000000000, %l6 = 00000000000000ff
	ldxa	[%i3+%o5]0x81,%l6	! %l6 = 0000000000000000

p0_label_421:
!	Mem[00000000100c1400] = 000000ff, %l0 = 1444962f90559c47
	ldswa	[%i3+%g0]0x88,%l0	! %l0 = 00000000000000ff
	membar	#Sync			! Added by membar checker (64)
!	Mem[0000000010081400] = 00000000 03f20000 00000000 00000000
!	Mem[0000000010081410] = 00000000 00000000 00000000 ffffffff
!	Mem[0000000010081420] = 00000000 00000000 00000000 00000000
!	Mem[0000000010081430] = 00000000 ff000000 00000003 000000ff
	ldda	[%i2]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010081400
!	Mem[0000000030101408] = 00000000, %l5 = 00000000ff000000
	ldsba	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %f6  = ae00747d
	lda	[%i1+%o4]0x80,%f6 	! %f6 = 00000000
!	Mem[0000000010141428] = 0000005affffffff, %l0 = 00000000000000ff
	ldxa	[%i5+0x028]%asi,%l0	! %l0 = 0000005affffffff
!	Mem[0000000010181410] = 00000000 00ff0000, %l2 = 00000000, %l3 = ffff0d00
	ldda	[%i6+%o5]0x88,%l2	! %l2 = 0000000000ff0000 0000000000000000
!	Mem[0000000030041400] = ff000000ff0000ff, %l1 = f04c31c017879005
	ldxa	[%i1+%g0]0x81,%l1	! %l1 = ff000000ff0000ff
!	Mem[000000001000140c] = 8a000000, %f10 = ffffffff
	ld	[%i0+0x00c],%f10	! %f10 = 8a000000
!	Mem[0000000010081400] = 0000f20300000000, %f8  = 000000ff 000000ff
	ldda	[%i2+%g0]0x88,%f8 	! %f8  = 0000f203 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 00000000, %l6 = 0000000000000000
	swapa	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000000

p0_label_422:
!	%l2 = 00ff0000, %l3 = 00000000, Mem[0000000030181400] = ff99543b 00000000
	stda	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 00ff0000 00000000
!	Mem[00000000300c1408] = 00000000, %l4 = 00000000000000ff
	ldstuba	[%i3+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1400] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i3+%g0]0x89,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010101408] = ff0000ff, %l6 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l6	! %l6 = 00000000ff0000ff
!	%l7 = 00000000ff00b200, Mem[0000000030141410] = 0000ffff
	stba	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000ff00
!	%l7 = 00000000ff00b200, Mem[0000000010181412] = 0000ff00, %asi = 80
	stha	%l7,[%i6+0x012]%asi	! Mem[0000000010181410] = 0000b200
!	%f5  = 00000000, Mem[0000000030181400] = 0000ff00
	sta	%f5 ,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	Mem[0000000030081410] = 00000000, %l3 = 0000000000000000
	swapa	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000000
!	%l4 = 00000000000000ff, Mem[00000000100c1410] = 00000000
	stha	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 8a000000, %l1 = ff000000ff0000ff
	lduba	[%i2+%o4]0x89,%l1	! %l1 = 0000000000000000

p0_label_423:
!	Mem[0000000010041430] = ff99543b, %l0 = 0000005affffffff
	lduw	[%i1+0x030],%l0		! %l0 = 00000000ff99543b
!	Mem[0000000010001410] = 00000000 00000000, %l2 = 00ff0000, %l3 = 00000000
	ldda	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010081408] = 0000000000000000, %l5 = 0000000000000000
	ldxa	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101410] = 0000000000000000, %l6 = 00000000ff0000ff
	ldxa	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = ff003487, %l5 = 0000000000000000
	ldsb	[%o2+%g0],%l5		! %l5 = ffffffffffffffff
!	%l7 = 00000000ff00b200, Mem[00000000100c1400] = ff000000
	stha	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = b2000000
!	Mem[0000000030001410] = 00000000, %l1 = 0000000000000000
	lduwa	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181404] = ff0000ff, %f11 = 000000ff
	ld	[%i6+0x004],%f11	! %f11 = ff0000ff
!	Mem[0000000010141408] = ff0000ff, %l6 = 0000000000000000
	ldswa	[%i5+%o4]0x88,%l6	! %l6 = ffffffffff0000ff
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[00000000300c1408] = ff000000
	stba	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000

p0_label_424:
!	%f6  = 00000000 00b200ff, %l5 = ffffffffffffffff
!	Mem[0000000010181410] = 0000b20000000000
	add	%i6,0x010,%g1
	stda	%f6,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010181410] = ff00b20000000000
!	Mem[0000000030141410] = 0000ff00, %l6 = ffffffffff0000ff
	ldstuba	[%i5+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041400] = 000000ff, %l4 = 00000000000000ff
	swapa	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%l4 = 00000000000000ff, immed = 00000012, %y  = 00000000
	udiv	%l4,0x012,%l5		! %l5 = 000000000000000e
	mov	%l0,%y			! %y = ff99543b
!	Mem[0000000010041408] = 00000000, %l5 = 000000000000000e
	swapa	[%i1+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l7 = 00000000ff00b200
	swapa	[%i1+%o5]0x81,%l7	! %l7 = 0000000000000000
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010141410] = 00000000 00000000
	stda	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 00000000
!	Mem[0000000030001410] = 00000000, %l2 = 0000000000000000
	swapa	[%i0+%o5]0x89,%l2	! %l2 = 0000000000000000
!	%f20 = 00000000 00000000, Mem[0000000030101408] = 00000000 00000000
	stda	%f20,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ffffffff, %l7 = 0000000000000000
	lduba	[%i0+%o4]0x81,%l7	! %l7 = 00000000000000ff

p0_label_425:
!	Mem[0000000010181430] = 00000000, %l2 = 0000000000000000
	ldsha	[%i6+0x030]%asi,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (65)
!	Mem[0000000030001400] = ff000000 000000ff ffffffff 0000ffff
!	Mem[0000000030001410] = 00000000 00000000 21003800 210061ff
!	Mem[0000000030001420] = 7fe4967b b3a3d9aa 268d7c0a 096cf5c2
!	Mem[0000000030001430] = e4258817 f7f898a4 987eb9ad 0850b773
	ldda	[%i0]ASI_BLK_SL,%f0	! Block Load from 0000000030001400
!	Mem[00000000100c1400] = b2000000, %l5 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l5	! %l5 = 00000000000000b2
!	Mem[0000000010041438] = 0000ffff, %l3 = 0000000000000000
	ldsw	[%i1+0x038],%l3		! %l3 = 000000000000ffff
!	Mem[0000000010141410] = 00000000, %l0 = 00000000ff99543b
	lduha	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101410] = 00000000ff000000, %l4 = 00000000000000ff
	ldxa	[%i4+%o5]0x81,%l4	! %l4 = 00000000ff000000
!	Mem[0000000030041408] = 00000000, %l3 = 000000000000ffff
	lduha	[%i1+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181400] = 0000000000000000, %l6 = 0000000000000000
	ldxa	[%i6+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041410] = 03f2ff00 00b200ff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i1+%o5]0x89,%l2	! %l2 = 0000000000b200ff 0000000003f2ff00
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000030041410] = ff00b200 00fff203
	stda	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 000000ff

p0_label_426:
!	Mem[0000000010001410] = 00000000, %l3 = 0000000003f2ff00
	swap	[%i0+%o5],%l3		! %l3 = 0000000000000000
!	%l6 = 0000000000000000, Mem[00000000218001c0] = db6708e2, %asi = 80
	stba	%l6,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 006708e2
!	Mem[0000000010041408] = 0000000e, %l7 = 00000000000000ff
	ldstuba	[%i1+%o4]0x88,%l7	! %l7 = 0000000e000000ff
!	%l6 = 0000000000000000, Mem[0000000010181400] = 0000f203
	stwa	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	Mem[000000001018143c] = ff0000ff, %l7 = 000000000000000e, %asi = 80
	swapa	[%i6+0x03c]%asi,%l7	! %l7 = 00000000ff0000ff
!	%f23 = 00000000, Mem[0000000010001428] = ffffffff
	st	%f23,[%i0+0x028]	! Mem[0000000010001428] = 00000000
!	%l0 = 0000000000000000, Mem[0000000030181408] = ffff0dff
	stba	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = ffff0d00
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000030081410] = 00000000 ffff0000
	stda	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000 00000000
!	Mem[0000000010141400] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i5+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000000, %l6 = 0000000000000000
	lduwa	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000

p0_label_427:
!	%l3 = 0000000000000000, immed = fffff6de, %y  = ff99543b
	sdiv	%l3,-0x922,%l3		! %l3 = 000000007fffffff
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000010041408] = 00000000000000ff, %f20 = 00000000 00000000
	ldda	[%i1+%o4]0x88,%f20	! %f20 = 00000000 000000ff
!	Mem[00000000300c1400] = ff00000000000000, %l7 = 00000000ff0000ff
	ldxa	[%i3+%g0]0x81,%l7	! %l7 = ff00000000000000
!	Mem[0000000030101410] = 00000000, %l7 = ff00000000000000
	ldswa	[%i4+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001400] = ff0000ff3b54ff00, %l3 = 000000007fffffff
	ldxa	[%i0+%g0]0x88,%l3	! %l3 = ff0000ff3b54ff00
!	Mem[0000000030081410] = 00000000, %f24 = 00000000
	lda	[%i2+%o5]0x81,%f24	! %f24 = 00000000
!	%l4 = 00000000ff000000, imm = 0000000000000900, %l2 = 0000000000b200ff
	subc	%l4,0x900,%l2		! %l2 = 00000000fefff700
!	Mem[00000000100c1400] = b2000000, %l0 = 0000000000000000
	lduwa	[%i3+%g0]0x80,%l0	! %l0 = 00000000b2000000
!	Mem[0000000030041400] = 000000ff, %l2 = 00000000fefff700
	lduwa	[%i1+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000030141408] = ffffffff
	stba	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = 00ffffff

p0_label_428:
!	Mem[00000000100c1410] = ff000000, %l5 = 00000000000000b2
	swapa	[%i3+%o5]0x80,%l5	! %l5 = 00000000ff000000
!	%f26 = 00000000 00000000, %l2 = 00000000000000ff
!	Mem[0000000030101418] = ffff0ddb00000000
	add	%i4,0x018,%g1
	stda	%f26,[%g1+%l2]ASI_PST8_S ! Mem[0000000030101418] = 0000000000000000
!	%l3 = ff0000ff3b54ff00, Mem[0000000010041408] = ff000000
	stha	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = ff000000
	membar	#Sync			! Added by membar checker (66)
!	%l2 = 00000000000000ff, Mem[0000000030001408] = ffffffff0000ffff
	stxa	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[00000000201c0000] = 00ff8ea0, %asi = 80
	stba	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = ffff8ea0
!	%l5 = 00000000ff000000, Mem[0000000010101418] = 210000ff00000000
	stx	%l5,[%i4+0x018]		! Mem[0000000010101418] = 00000000ff000000
!	%l4 = ff000000, %l5 = ff000000, Mem[0000000010181410] = ff00b200 00000000
	stda	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = ff000000 ff000000
!	%l2 = 00000000000000ff, Mem[00000000300c1408] = 0000000000000000
	stxa	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000000000ff
!	%l0 = 00000000b2000000, Mem[0000000030081408] = 0000008a
	stha	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000008a
!	Starting 10 instruction Load Burst
!	%f14 = 73b75008, %f27 = 00000000
	fcmpes	%fcc0,%f14,%f27		! %fcc0 = 2

p0_label_429:
!	Mem[0000000010141408] = ff0000ffffffffff, %l0 = 00000000b2000000
	ldxa	[%i5+%o4]0x80,%l0	! %l0 = ff0000ffffffffff
!	Mem[0000000010141408] = ff0000ff, %l1 = 0000000000000000
	ldswa	[%i5+%o4]0x88,%l1	! %l1 = ffffffffff0000ff
!	Mem[0000000010081420] = 00000000, %f10 = c2f56c09
	ld	[%i2+0x020],%f10	! %f10 = 00000000
!	Code Fragment 3
p0_fragment_36:
!	%l0 = ff0000ffffffffff
	setx	0x9ab55dd861898a5c,%g7,%l0 ! %l0 = 9ab55dd861898a5c
!	%l1 = ffffffffff0000ff
	setx	0x1f012c0056a525ff,%g7,%l1 ! %l1 = 1f012c0056a525ff
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9ab55dd861898a5c
	setx	0xffc951f7da16900b,%g7,%l0 ! %l0 = ffc951f7da16900b
!	%l1 = 1f012c0056a525ff
	setx	0xcb97c7c7cc6ebd36,%g7,%l1 ! %l1 = cb97c7c7cc6ebd36
!	Mem[0000000030181400] = 0000000000000000, %f18 = 00000000 00000000
	ldda	[%i6+%g0]0x89,%f18	! %f18 = 00000000 00000000
!	Mem[0000000030041410] = ff000000 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000000 00000000ff000000
!	Mem[0000000010001408] = 000000008a000000, %f8  = aad9a3b3 7b96e47f
	ldda	[%i0+%o4]0x80,%f8 	! %f8  = 00000000 8a000000
!	Mem[00000000300c1408] = ff000000, %l2 = 00000000000000ff
	lduha	[%i3+%o4]0x81,%l2	! %l2 = 000000000000ff00
!	%l7 = 00000000ff000000, %l0 = ffc951f7da16900b, %y  = 00000000
	smul	%l7,%l0,%l6		! %l6 = 0025e96ff5000000, %y = 0025e96f
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ff000000, Mem[00000000211c0000] = ff003487
	sth	%l5,[%o2+%g0]		! Mem[00000000211c0000] = 00003487

p0_label_430:
!	Mem[0000000030101410] = 00000000, %l6 = 0025e96ff5000000
	swapa	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = ff000000, %l1 = cb97c7c7cc6ebd36
	swapa	[%i3+%o4]0x81,%l1	! %l1 = 00000000ff000000
!	%l7 = 00000000ff000000, Mem[0000000020800040] = 00ffc0bd
	sth	%l7,[%o1+0x040]		! Mem[0000000020800040] = 0000c0bd
!	Mem[0000000010101424] = 000000ff, %l3 = 3b54ff00, %l7 = ff000000
	add	%i4,0x24,%g1
	casa	[%g1]0x80,%l3,%l7	! %l7 = 00000000000000ff
!	%f26 = 00000000 00000000, %l0 = ffc951f7da16900b
!	Mem[0000000010001400] = 00ff543bff0000ff
	stda	%f26,[%i0+%l0]ASI_PST32_PL ! Mem[0000000010001400] = 0000000000000000
!	Mem[0000000021800101] = ff900b85, %l4 = 00000000ff000000
	ldstuba	[%o3+0x101]%asi,%l4	! %l4 = 00000090000000ff
!	Mem[00000000100c1410] = b2000000, %l4 = 0000000000000090
	ldstuba	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081408] = 0000000000000000, %l0 = ffc951f7da16900b, %l2 = 000000000000ff00
	add	%i2,0x08,%g1
	casxa	[%g1]0x80,%l0,%l2	! %l2 = 0000000000000000
!	%f11 = 0a7c8d26, Mem[0000000030041400] = 000000ff
	sta	%f11,[%i1+%g0]0x89	! Mem[0000000030041400] = 0a7c8d26
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000000, %l7 = 00000000000000ff
	lduba	[%i0+%g0]0x88,%l7	! %l7 = 0000000000000000

p0_label_431:
!	Mem[00000000300c1410] = 00000000, %l0 = ffc951f7da16900b
	lduha	[%i3+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Code Fragment 3
p0_fragment_37:
!	%l0 = 0000000000000000
	setx	0x14038b2fc28cdccb,%g7,%l0 ! %l0 = 14038b2fc28cdccb
!	%l1 = 00000000ff000000
	setx	0xaacd62680f5cbae6,%g7,%l1 ! %l1 = aacd62680f5cbae6
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 14038b2fc28cdccb
	setx	0x6124a0e7a223c134,%g7,%l0 ! %l0 = 6124a0e7a223c134
!	%l1 = aacd62680f5cbae6
	setx	0x1e140290003f709e,%g7,%l1 ! %l1 = 1e140290003f709e
!	Mem[0000000030041410] = 00000000, %l2 = 0000000000000000
	ldswa	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000211c0000] = 00003487, %l3 = ff0000ff3b54ff00
	lduh	[%o2+%g0],%l3		! %l3 = 0000000000000000
!	%f24 = 00000000, %f29 = 00000000, %f19 = 00000000
	fadds	%f24,%f29,%f19		! %f19 = 00000000
!	Mem[0000000030141400] = 00000000ffff0000, %f16 = 0000f203 00000000
	ldda	[%i5+%g0]0x81,%f16	! %f16 = 00000000 ffff0000
!	Mem[000000001014143c] = ffb2ff5a, %l0 = 6124a0e7a223c134
	ldsba	[%i5+0x03f]%asi,%l0	! %l0 = 000000000000005a
!	Mem[0000000030001408] = 00000000, %l3 = 0000000000000000
	ldsba	[%i0+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l2 = 0000000000000000
	ldswa	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f0  = ff000000, Mem[0000000030081410] = 00000000
	sta	%f0 ,[%i2+%o5]0x89	! Mem[0000000030081410] = ff000000

p0_label_432:
!	Mem[0000000030181410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i6+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041400] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l3	! %l3 = 000000ff000000ff
!	%f7  = 00380021, Mem[00000000100c1400] = b2000000
	sta	%f7 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00380021
!	Mem[0000000030101408] = 00000000, %l5 = 00000000ff000000
	swapa	[%i4+%o4]0x81,%l5	! %l5 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030001400] = ff000000
	stba	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	Mem[0000000010181400] = 00000000, %l3 = 00000000000000ff
	swap	[%i6+%g0],%l3		! %l3 = 0000000000000000
!	Mem[0000000010141408] = ff0000ff, %l6 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	Mem[00000000300c1400] = ff000000, %l7 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l7	! %l7 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000010041418] = 000000000000b200
	stx	%l3,[%i1+0x018]		! Mem[0000000010041418] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 00000000, %l0 = 000000000000005a
	lduba	[%i5+%g0]0x89,%l0	! %l0 = 0000000000000000

p0_label_433:
!	Mem[0000000010081400] = 00000000 03f20000 00000000 00000000
!	Mem[0000000010081410] = 00000000 00000000 00000000 ffffffff
!	Mem[0000000010081420] = 00000000 00000000 00000000 00000000
!	Mem[0000000010081430] = 00000000 ff000000 00000003 000000ff
	ldda	[%i2]ASI_BLK_P,%f16	! Block Load from 0000000010081400
!	%l5 = 0000000000000000, %l3 = 0000000000000000, %l3 = 0000000000000000
	xnor	%l5,%l3,%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030181408] = ffff0d00, %l6 = 00000000000000ff
	ldswa	[%i6+%o4]0x89,%l6	! %l6 = ffffffffffff0d00
!	Mem[00000000201c0000] = ffff8ea0, %l4 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001430] = 74ff38d1, %l6 = ffffffffffff0d00
	lduwa	[%i0+0x030]%asi,%l6	! %l6 = 0000000074ff38d1
!	Mem[00000000100c1430] = 00000000, %l4 = ffffffffffffffff
	ldsba	[%i3+0x031]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l6 = 0000000074ff38d1
	lduha	[%i6+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = 000000ff, %l5 = 0000000000000000
	ldsha	[%i5+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001400] = ff00000000000000, %l7 = 00000000000000ff
	ldxa	[%i0+%g0]0x89,%l7	! %l7 = ff00000000000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (67)
!	%f11 = 0a7c8d26, Mem[0000000010081408] = 00000000
	sta	%f11,[%i2+%o4]0x88	! Mem[0000000010081408] = 0a7c8d26

p0_label_434:
!	%f4  = 00000000, Mem[00000000100c1400] = 00380021
	sta	%f4 ,[%i3+0x000]%asi	! Mem[00000000100c1400] = 00000000
!	%l4 = 0000000000000000, Mem[0000000010001438] = ff80000000ff00f2, %asi = 80
	stxa	%l4,[%i0+0x038]%asi	! Mem[0000000010001438] = 0000000000000000
!	%f30 = 00000003 000000ff, %l4 = 0000000000000000
!	Mem[0000000010081400] = 0000000003f20000
	stda	%f30,[%i2+%l4]ASI_PST32_P ! Mem[0000000010081400] = 0000000003f20000
!	%l5 = 00000000000000ff, Mem[0000000030181400] = 00000000
	stba	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = ff000000
!	Mem[0000000010181400] = ff000000, %l3 = ffffffffffffffff
	swapa	[%i6+%g0]0x88,%l3	! %l3 = 00000000ff000000
!	Mem[0000000030041400] = 268d7c0a, %l6 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l6	! %l6 = 00000000268d7c0a
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000030041400] = 00000000 ff0000ff
	stda	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000 000000ff
!	Mem[0000000010041400] = ff000000, %l2 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l2	! %l2 = 00000000ff000000
!	Mem[0000000010181428] = ff000000, %l3 = 00000000ff000000
	ldstuba	[%i6+0x028]%asi,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	%f18 = 00000000, %f5  = 00000000, %f4  = 00000000 00000000
	fsmuld	%f18,%f5 ,%f4 		! %f4  = 00000000 00000000

p0_label_435:
!	Mem[00000000100c1408] = ffff0000, %l0 = 0000000000000000
	lduba	[%i3+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1408] = ffff0000ffffffff, %l4 = 0000000000000000
	ldxa	[%i3+%o4]0x80,%l4	! %l4 = ffff0000ffffffff
!	Mem[00000000300c1400] = ff000000, %l2 = 00000000ff000000
	lduba	[%i3+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101400] = 00000000ff000000, %l1 = 1e140290003f709e
	ldxa	[%i4+%g0]0x89,%l1	! %l1 = 00000000ff000000
!	Mem[000000001000143c] = 00000000, %l5 = 00000000000000ff
	ldsha	[%i0+0x03c]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141410] = 0000ffff, %l7 = ff00000000000000
	lduha	[%i5+%o5]0x89,%l7	! %l7 = 000000000000ffff
!	%l5 = 0000000000000000, %l1 = 00000000ff000000, %l3 = 00000000000000ff
	sdivx	%l5,%l1,%l3		! %l3 = 0000000000000000
!	Mem[0000000010181410] = 000000ff, %l7 = 000000000000ffff
	lduha	[%i6+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181410] = 000000ff, %l0 = 00000000000000ff
	lduba	[%i6+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f10 = 00000000 0a7c8d26, %l5 = 0000000000000000
!	Mem[0000000010001400] = 0000000000000000
	stda	%f10,[%i0+%l5]ASI_PST8_PL ! Mem[0000000010001400] = 0000000000000000

p0_label_436:
!	%l2 = 00000000000000ff, Mem[0000000030141408] = 00ffffff
	stha	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 00ffffff
!	%l7 = 00000000000000ff, Mem[000000001010142a] = db0dffff
	sth	%l7,[%i4+0x02a]		! Mem[0000000010101428] = db0d00ff
!	%f10 = 00000000 0a7c8d26, Mem[0000000010101410] = 00000000 00000000
	stda	%f10,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000 0a7c8d26
!	%l2 = 00000000000000ff, Mem[0000000010141410] = 00000000
	stba	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = ff000000
!	Mem[0000000010101400] = ff38ff74, %l6 = 00000000268d7c0a
	ldstuba	[%i4+%g0]0x80,%l6	! %l6 = 000000ff000000ff
!	%f6  = ff610021, %f2  = ffff0000
	fcmps	%fcc0,%f6 ,%f2 		! %fcc0 = 3
!	%l5 = 0000000000000000, Mem[0000000010001408] = 00000000
	stha	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
!	Mem[0000000010101404] = 00000de1, %l1 = 00000000ff000000
	ldstuba	[%i4+0x004]%asi,%l1	! %l1 = 00000000000000ff
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000010181410] = 000000ff 000000ff
	stda	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ffffffff, %l2 = 00000000000000ff
	ldswa	[%i6+%g0]0x80,%l2	! %l2 = ffffffffffffffff

p0_label_437:
!	Mem[0000000010001400] = 00000000, %l5 = 0000000000000000
	ldsha	[%i0+%g0]0x88,%l5	! %l5 = 0000000000000000
!	%l0 = 00000000000000ff, %l4 = ffff0000ffffffff, %y  = 0025e96f
	smul	%l0,%l4,%l5		! %l5 = ffffffffffffff01, %y = ffffffff
!	Mem[0000000030181410] = ff000000, %l0 = 00000000000000ff
	ldswa	[%i6+%o5]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[0000000030181410] = 00000000000000ff, %f30 = 00000003 000000ff
	ldda	[%i6+%o5]0x89,%f30	! %f30 = 00000000 000000ff
!	Mem[0000000010041410] = 00ffffff 00005a00, %l4 = ffffffff, %l5 = ffffff01
	ldda	[%i1+%o5]0x80,%l4	! %l4 = 0000000000ffffff 0000000000005a00
!	Mem[0000000030101410] = f5000000, %l2 = ffffffffffffffff
	lduwa	[%i4+%o5]0x89,%l2	! %l2 = 00000000f5000000
!	Mem[00000000100c1408] = 0000ffff, %l1 = 0000000000000000
	ldswa	[%i3+%o4]0x88,%l1	! %l1 = 000000000000ffff
!	Mem[00000000201c0000] = ffff8ea0, %l6 = 00000000000000ff
	ldub	[%o0+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[00000000211c0000] = 00003487, %l0 = ffffffffff000000
	ldsba	[%o2+0x001]%asi,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f30 = 00000000 000000ff, Mem[00000000100c1400] = 00000000 00000000
	stda	%f30,[%i3+0x000]%asi	! Mem[00000000100c1400] = 00000000 000000ff

p0_label_438:
!	%l6 = 00000000000000ff, Mem[0000000030141408] = 00ffffff
	stha	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 00ffffff
!	%l0 = 0000000000000000, Mem[0000000010081408] = 000000000a7c8d26
	stxa	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000000000000000
!	%f6  = ff610021 00380021, Mem[0000000010101410] = 0a7c8d26 00000000
	stda	%f6 ,[%i4+%o5]0x88	! Mem[0000000010101410] = ff610021 00380021
!	%l5 = 0000000000005a00, Mem[0000000010001408] = 00000000
	stba	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
!	Mem[0000000010001400] = 00000000, %l2 = 00000000f5000000
	swapa	[%i0+%g0]0x88,%l2	! %l2 = 0000000000000000
!	%l7 = 00000000000000ff, Mem[0000000030101408] = ff000000
	stha	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = 00ff0000
!	%l2 = 0000000000000000, Mem[00000000100c1430] = 00000000b2000000, %asi = 80
	stxa	%l2,[%i3+0x030]%asi	! Mem[00000000100c1430] = 0000000000000000
!	%l3 = 0000000000000000, Mem[00000000201c0000] = ffff8ea0, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00008ea0
!	%f24 = 00000000 00000000, Mem[0000000010081400] = 00000000 0000f203
	stda	%f24,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %l3 = 0000000000000000
	ldsha	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000000

p0_label_439:
!	Mem[0000000010081408] = 00000000, %l0 = 0000000000000000
	lduba	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181400] = ffffffffff0000ff, %f18 = 00000000 00000000
	ldda	[%i6+%g0]0x80,%f18	! %f18 = ffffffff ff0000ff
!	Mem[0000000030101410] = f5000000, %l2 = 0000000000000000
	lduha	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = ff000000, %l5 = 0000000000005a00
	lduwa	[%i5+%o5]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030041410] = 00000000, %l1 = 000000000000ffff
	lduha	[%i1+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%l0 = 0000000000000000, imm = 0000000000000cde, %l2 = 0000000000000000
	addc	%l0,0xcde,%l2		! %l2 = 0000000000000cde
!	Mem[0000000030081400] = 00000000, %l6 = 00000000000000ff
	lduba	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l3 = 0000000000000000
	lduwa	[%i0+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %l2 = 0000000000000cde
	ldsha	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00ffffff, %l5 = ff000000, Mem[00000000300c1400] = ff000000 00000000
	stda	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00ffffff ff000000

p0_label_440:
!	%l2 = 0000000000000000, Mem[0000000010081408] = 00000000
	stba	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	%f26 = 00000000 00000000, Mem[0000000010181410] = 000000ff 00000000
	stda	%f26,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000 00000000
!	Mem[00000000100c1408] = 0000ffff, %l4 = 0000000000ffffff
	swapa	[%i3+%o4]0x88,%l4	! %l4 = 000000000000ffff
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010141408] = ff0000ff ffffffff
	stda	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000 00000000
!	%l4 = 0000ffff, %l5 = ff000000, Mem[0000000030141400] = 00000000 ffff0000
	stda	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000ffff ff000000
!	Mem[0000000030081410] = 000000ff, %l3 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[000000001018140c] = ff000000, %l2 = 0000000000000000
	swap	[%i6+0x00c],%l2		! %l2 = 00000000ff000000
!	%l5 = 00000000ff000000, Mem[0000000030001400] = 00000000
	stwa	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = ff000000
!	Mem[00000000201c0000] = 00008ea0, %l6 = 0000000000000000
	ldstub	[%o0+%g0],%l6		! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 21003800 210061ff, %l6 = 00000000, %l7 = 000000ff
	ldd	[%i4+%o5],%l6		! %l6 = 0000000021003800 00000000210061ff

p0_label_441:
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010001420] = 000000ff 000000ff
	std	%l0,[%i0+0x020]		! Mem[0000000010001420] = 00000000 00000000
!	Mem[0000000010081410] = 00000000, %l7 = 00000000210061ff
	ldswa	[%i2+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l6 = 0000000021003800
	ldsha	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l7 = 0000000000000000
	ldsha	[%i2+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = ff000000000000ff, %f24 = 00000000 00000000
	ldda	[%i5+%g0]0x88,%f24	! %f24 = ff000000 000000ff
!	Mem[0000000030041410] = 00000000, %l4 = 000000000000ffff
	ldsha	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141410] = ffff0000, %l2 = 00000000ff000000
	lduha	[%i5+%o5]0x81,%l2	! %l2 = 000000000000ffff
!	Code Fragment 3
p0_fragment_38:
!	%l0 = 0000000000000000
	setx	0x008e997fa147ca5f,%g7,%l0 ! %l0 = 008e997fa147ca5f
!	%l1 = 0000000000000000
	setx	0xb50f0c3f93b93d9a,%g7,%l1 ! %l1 = b50f0c3f93b93d9a
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 008e997fa147ca5f
	setx	0xa5278ad0104b7f63,%g7,%l0 ! %l0 = a5278ad0104b7f63
!	%l1 = b50f0c3f93b93d9a
	setx	0xd89bcadf822ee1af,%g7,%l1 ! %l1 = d89bcadf822ee1af
!	Mem[0000000030041408] = 00000000, %l3 = 0000000000000000
	lduha	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = a5278ad0104b7f63, Mem[00000000100c1418] = ffffffff
	stw	%l0,[%i3+0x018]		! Mem[00000000100c1418] = 104b7f63

p0_label_442:
!	%f25 = 000000ff, Mem[0000000010101414] = 210061ff
	st	%f25,[%i4+0x014]	! Mem[0000000010101414] = 000000ff
!	%l7 = 0000000000000000, Mem[0000000010041428] = 00000000
	sth	%l7,[%i1+0x028]		! Mem[0000000010041428] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010101408] = 00000000
	stba	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	%f6  = ff610021, %f12 = a498f8f7, %f1  = 000000ff
	fsubs	%f6 ,%f12,%f1 		! %f1  = ff610021
!	%f10 = 00000000 0a7c8d26, %l4 = 0000000000000000
!	Mem[0000000030181420] = d4ff4189ff0000ff
	add	%i6,0x020,%g1
	stda	%f10,[%g1+%l4]ASI_PST16_S ! Mem[0000000030181420] = d4ff4189ff0000ff
!	Mem[0000000021800180] = ffff6a7f, %l3 = 0000000000000000
	ldstuba	[%o3+0x180]%asi,%l3	! %l3 = 000000ff000000ff
!	%l0 = 104b7f63, %l1 = 822ee1af, Mem[0000000010101438] = ffff0ddb ffffffff
	stda	%l0,[%i4+0x038]%asi	! Mem[0000000010101438] = 104b7f63 822ee1af
!	%f1  = ff610021, Mem[0000000030001408] = 00000000
	sta	%f1 ,[%i0+%o4]0x81	! Mem[0000000030001408] = ff610021
!	Mem[0000000010001425] = 00000000, %l2 = 000000000000ffff
	ldstub	[%i0+0x025],%l2		! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ffffffff00ffffff, %l5 = 00000000ff000000
	ldxa	[%i3+%o4]0x88,%l5	! %l5 = ffffffff00ffffff

p0_label_443:
!	Code Fragment 3
p0_fragment_39:
!	%l0 = a5278ad0104b7f63
	setx	0x226c59e868203de6,%g7,%l0 ! %l0 = 226c59e868203de6
!	%l1 = d89bcadf822ee1af
	setx	0xc29acfafd3a81d05,%g7,%l1 ! %l1 = c29acfafd3a81d05
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 226c59e868203de6
	setx	0x253c09601cf22a49,%g7,%l0 ! %l0 = 253c09601cf22a49
!	%l1 = c29acfafd3a81d05
	setx	0x9cd92c70241b2680,%g7,%l1 ! %l1 = 9cd92c70241b2680
!	Mem[0000000010181408] = ff00000000000000, %l4 = 0000000000000000
	ldxa	[%i6+%o4]0x80,%l4	! %l4 = ff00000000000000
!	Mem[0000000030181408] = 000dffff, %f9  = 8a000000
	lda	[%i6+%o4]0x81,%f9 	! %f9 = 000dffff
!	Mem[0000000010081410] = 00000000, %l3 = 00000000000000ff
	lduba	[%i2+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001410] = 0000000000000000, %l6 = 0000000000000000
	ldxa	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1400] = ffffff00, %l6 = 0000000000000000
	lduba	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1438] = 318e0000, %f7  = 00380021
	lda	[%i3+0x038]%asi,%f7 	! %f7 = 318e0000
!	%f10 = 00000000 0a7c8d26, %f14 = 73b75008 adb97e98
	fdtox	%f10,%f14		! %l0 = 253c09601cf22a6b, Unfinished, %fsr = 0d00000c00
!	Mem[0000000010041408] = 000000ff, %l3 = 0000000000000000
	ldsha	[%i1+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, imm = fffffffffffffec5, %l1 = 9cd92c70241b2680
	xor	%l7,-0x13b,%l1		! %l1 = fffffffffffffec5

p0_label_444:
!	Mem[0000000030181400] = 000000ff, %l2 = 0000000000000000
	swapa	[%i6+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001410] = 03f2ff00, %l1 = fffffffffffffec5
	ldsba	[%i0+%o5]0x80,%l1	! %l1 = 0000000000000003
!	%l6 = 0000000000000000, Mem[0000000030041410] = 00000000
	stwa	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	%f19 = ff0000ff, Mem[00000000300c1410] = 00000000
	sta	%f19,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff0000ff
!	%l7 = 0000000000000000, %l5 = ffffffff00ffffff, %l6 = 0000000000000000
	andn	%l7,%l5,%l6		! %l6 = 0000000000000000
!	Mem[0000000030101400] = 000000ff, %l5 = ffffffff00ffffff
	ldstuba	[%i4+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	%l1 = 0000000000000003, Mem[0000000010141400] = 000000ff
	stwa	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000003
!	%l7 = 0000000000000000, Mem[0000000010101410] = 00380021
	stwa	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	%f8  = 00000000 000dffff, Mem[0000000030001400] = 000000ff ff000000
	stda	%f8 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 000dffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141430] = 0000b224, %l5 = 0000000000000000
	lduwa	[%i5+0x030]%asi,%l5	! %l5 = 000000000000b224

p0_label_445:
!	Mem[0000000030181400] = 00000000, %l2 = 00000000000000ff
	ldsba	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l1 = 0000000000000003
	lduba	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l0 = 253c09601cf22a6b
	swapa	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l4 = ff00000000000000
	ldswa	[%i1+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1410] = ff0000ff, %l1 = 0000000000000000
	lduba	[%i3+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181410] = ff000000, %l7 = 0000000000000000
	ldsba	[%i6+%o5]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041400] = 00000000, %l4 = 0000000000000000
	ldswa	[%i1+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101410] = 000000f5ff000000, %f16 = 00000000 03f20000
	ldda	[%i4+%o5]0x81,%f16	! %f16 = 000000f5 ff000000
!	Mem[00000000100c1428] = 00000000, %l2 = 0000000000000000
	ldsba	[%i3+0x028]%asi,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f20 = 00000000, Mem[00000000300c1400] = 00ffffff
	sta	%f20,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000

p0_label_446:
!	%f5  = 00000000, Mem[0000000010181410] = 6b2af21c
	sta	%f5 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	Mem[00000000300c1400] = 00000000, %l2 = 0000000000000000
	swapa	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000030041408] = 00000000
	stwa	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	Mem[0000000030181410] = 000000ff, %l1 = 00000000000000ff
	ldstuba	[%i6+%o5]0x89,%l1	! %l1 = 000000ff000000ff
!	%f30 = 00000000 000000ff, Mem[00000000100c1408] = ffffff00 ffffffff
	stda	%f30,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 000000ff
!	%f16 = 000000f5, %f2  = ffff0000
	fcmps	%fcc1,%f16,%f2 		! %fcc1 = 3
!	%l5 = 000000000000b224, Mem[0000000030041400] = 00000000
	stha	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000b224
!	%l7 = ffffffffffffffff, Mem[0000000030041400] = 0000b224
	stha	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %l3 = 00000000000000ff
	ldsha	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000000

p0_label_447:
!	Mem[0000000030141408] = 00ffffff, %l1 = 00000000000000ff
	lduha	[%i5+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101408] = 00000000, %l5 = 000000000000b224
	lduha	[%i4+0x00a]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001410] = 00000000, %l1 = 00000000000000ff
	ldswa	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141428] = 0000005a, %l1 = 0000000000000000
	ldsb	[%i5+0x02b],%l1		! %l1 = 000000000000005a
!	Mem[0000000010101400] = ff38ff74, %l5 = 0000000000000000
	ldswa	[%i4+%g0]0x80,%l5	! %l5 = ffffffffff38ff74
!	Mem[0000000010101438] = 104b7f63, %l5 = ffffffffff38ff74
	ldsb	[%i4+0x039],%l5		! %l5 = 000000000000004b
!	Mem[0000000010001420] = 00000000, %l7 = ffffffffffffffff
	ldub	[%i0+0x023],%l7		! %l7 = 0000000000000000
!	Mem[0000000010181410] = 000000ff, %l4 = 0000000000000000
	ldsba	[%i6+%o5]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030081410] = ff0000ff00000000, %l3 = 0000000000000000
	ldxa	[%i2+%o5]0x81,%l3	! %l3 = ff0000ff00000000
!	Starting 10 instruction Store Burst
!	%f25 = 000000ff, Mem[0000000030181408] = 000dffff
	sta	%f25,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000ff

p0_label_448:
!	Mem[0000000010181400] = ffffffff, %l4 = ffffffffffffffff
	ldstuba	[%i6+%g0]0x88,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030101410] = f5000000, %l6 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%f18 = ffffffff ff0000ff, Mem[0000000010001408] = 00000000 0000008a
	stda	%f18,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffffff ff0000ff
!	%f27 = 00000000, %f15 = adb97e98
	fcmpes	%fcc2,%f27,%f15		! %fcc2 = 2
!	Mem[0000000030081400] = 00000000, %l1 = 000000000000005a
	swapa	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030101410] = ff0000f5
	stwa	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	Mem[00000000300c1400] = 00000000, %l0 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001400] = 000000f5, %l4 = 00000000000000ff
	ldstuba	[%i0+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	%l5 = 000000000000004b, Mem[0000000010001400] = ff0000f5
	stha	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 004b00f5
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00ffffff, %l4 = 0000000000000000
	ldsba	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000

p0_label_449:
!	Mem[0000000010101410] = 00000000, %l1 = 0000000000000000
	lduwa	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %f2  = ffff0000
	lda	[%i1+%o5]0x89,%f2 	! %f2 = 00000000
!	Mem[0000000010001410] = 00fff203, %l7 = 0000000000000000
	lduba	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000003
!	Mem[00000000300c1410] = ff0000ff, %l3 = ff0000ff00000000
	lduha	[%i3+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1400] = 000000ff00000000, %f18 = ffffffff ff0000ff
	ldda	[%i3+%g0]0x89,%f18	! %f18 = 000000ff 00000000
!	Mem[0000000010101420] = 00000000, %l5 = 000000000000004b
	ldswa	[%i4+0x020]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = ffffffff, %l0 = 0000000000000000
	lduha	[%i6+%g0]0x80,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010141418] = 0000ffff, %l5 = 0000000000000000
	ldsb	[%i5+0x01b],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010181438] = 5a7bb2ff0000000e, %l1 = 0000000000000000
	ldx	[%i6+0x038],%l1		! %l1 = 5a7bb2ff0000000e
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ff, Mem[0000000030001410] = 00000000
	stha	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 00ff0000

p0_label_450:
!	%f6  = ff610021 318e0000, Mem[0000000010041420] = 00000000 00000000
	std	%f6 ,[%i1+0x020]	! Mem[0000000010041420] = ff610021 318e0000
!	Mem[0000000010001421] = 00000000, %l7 = 0000000000000003
	ldstub	[%i0+0x021],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030001400] = ffff0d00, %l5 = ffffffffffffffff
	swapa	[%i0+%g0]0x81,%l5	! %l5 = 00000000ffff0d00
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000030041408] = 00000000 0000ff00
	stda	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000 000000ff
!	%l0 = 0000ffff, %l1 = 0000000e, Mem[0000000030101400] = ff0000ff 00000000
	stda	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000ffff 0000000e
!	Mem[0000000030101410] = 00000000, %l5 = 00000000ffff0d00
	ldstuba	[%i4+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000010141400] = 03000000
	stwa	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010101410] = 00000000 ff000000
	stda	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000 00000000
!	%f16 = 000000f5 ff000000 000000ff 00000000
!	%f20 = 00000000 00000000 00000000 ffffffff
!	%f24 = ff000000 000000ff 00000000 00000000
!	%f28 = 00000000 ff000000 00000000 000000ff
	stda	%f16,[%i1]ASI_BLK_AIUS	! Block Store to 0000000030041400
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 0000000000000000, %l6 = 0000000000000000
	ldxa	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000000

p0_label_451:
!	Mem[0000000010101410] = 00000000, %l5 = 0000000000000000
	ldswa	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181410] = 000000ff, %l3 = 00000000000000ff
	lduha	[%i6+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141418] = 0000ffff, %l2 = 0000000000000000
	ldsw	[%i5+0x018],%l2		! %l2 = 000000000000ffff
!	Mem[0000000010101410] = 00000000, %l3 = 00000000000000ff
	ldsba	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001400] = ffffffff 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i0+%g0]0x81,%l4	! %l4 = 00000000ffffffff 0000000000000000
	membar	#Sync			! Added by membar checker (68)
!	Mem[0000000010141400] = 00000000 000000ff 00000000 00000000
!	Mem[0000000010141410] = ff000000 00000000 0000ffff 00000000
!	Mem[0000000010141420] = ffffffff 5fff7b5a 0000005a ffffffff
!	Mem[0000000010141430] = 0000b224 00000000 ff000000 ffb2ff5a
	ldda	[%i5]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010141400
!	Mem[00000000218000c0] = 00005cf4, %l5 = 0000000000000000
	ldsba	[%o3+0x0c1]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041408] = ff00000000000000, %l7 = 0000000000000000
	ldxa	[%i1+0x008]%asi,%l7	! %l7 = ff00000000000000
!	Mem[0000000010001400] = 004b00f500000000, %l0 = 000000000000ffff
	ldxa	[%i0+%g0]0x80,%l0	! %l0 = 004b00f500000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 5a000000, %l6 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l6	! %l6 = 000000005a000000

p0_label_452:
!	%l6 = 000000005a000000, Mem[00000000100c1408] = 00000000
	stwa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 5a000000
!	%f28 = 00000000 ff000000, Mem[00000000300c1400] = 00000000 000000ff
	stda	%f28,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 ff000000
!	%f16 = 000000f5 ff000000, Mem[0000000010041410] = 00ffffff 00005a00
	stda	%f16,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000f5 ff000000
!	%l5 = 0000000000000000, Mem[000000001004140c] = 00000000, %asi = 80
	stha	%l5,[%i1+0x00c]%asi	! Mem[000000001004140c] = 00000000
!	%l7 = ff00000000000000, Mem[0000000010081400] = 0000000000000000
	stxa	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = ff00000000000000
!	Mem[0000000030001410] = 00ff0000, %l1 = 5a7bb2ff0000000e
	ldstuba	[%i0+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041422] = ff610021, %l0 = 004b00f500000000
	ldstub	[%i1+0x022],%l0		! %l0 = 00000000000000ff
!	%f16 = 000000f5 ff000000, %l7 = ff00000000000000
!	Mem[0000000030041428] = 0000000000000000
	add	%i1,0x028,%g1
	stda	%f16,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030041428] = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000030081400] = 00000000
	stba	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1418] = 104b7f63, %l2 = 000000000000ffff
	ldsb	[%i3+0x019],%l2		! %l2 = 000000000000004b

p0_label_453:
!	Mem[0000000030041400] = 000000f5, %l5 = 0000000000000000
	ldswa	[%i1+%g0]0x81,%l5	! %l5 = 00000000000000f5
!	Mem[0000000030001400] = 00000000ffffffff, %l1 = 0000000000000000
	ldxa	[%i0+%g0]0x89,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000010041400] = 00000000, %l3 = 0000000000000000
	ldswa	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = ff000000, %f28 = 00000000
	lda	[%i3+%g0]0x89,%f28	! %f28 = ff000000
!	Mem[0000000030101410] = 000000ff, %l5 = 00000000000000f5
	ldsha	[%i4+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030041408] = 000000ff, %l6 = 000000005a000000
	ldswa	[%i1+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041438] = 0000ffff, %l0 = 0000000000000000
	lduha	[%i1+0x038]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101408] = 00ff000000000000, %f30 = 00000000 000000ff
	ldda	[%i4+%o4]0x81,%f30	! %f30 = 00ff0000 00000000
!	Mem[00000000300c1400] = 000000ff, %l3 = 0000000000000000
	ldsha	[%i3+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 00ffffff, %l2 = 000000000000004b
	swapa	[%i5+%o4]0x81,%l2	! %l2 = 0000000000ffffff

p0_label_454:
!	Mem[0000000010181434] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i6+0x034]%asi,%l5	! %l5 = 00000000000000ff
!	%f0  = ff000000 00000000 00000000 00000000
!	%f4  = 00000000 000000ff 00000000 ffff0000
!	%f8  = 5a7bff5f ffffffff ffffffff 5a000000
!	%f12 = 00000000 24b20000 5affb2ff 000000ff
	stda	%f0,[%i0]ASI_BLK_AIUSL	! Block Store to 0000000030001400
!	Mem[0000000010081400] = 00000000, %l6 = 00000000000000ff
	swapa	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Code Fragment 3
p0_fragment_40:
!	%l0 = 0000000000000000
	setx	0xf7ecdee80647b1bd,%g7,%l0 ! %l0 = f7ecdee80647b1bd
!	%l1 = 00000000ffffffff
	setx	0xb07a3d20288c79a6,%g7,%l1 ! %l1 = b07a3d20288c79a6
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f7ecdee80647b1bd
	setx	0x7dc9cfc81ebdde88,%g7,%l0 ! %l0 = 7dc9cfc81ebdde88
!	%l1 = b07a3d20288c79a6
	setx	0xc7fb5e87b3f16752,%g7,%l1 ! %l1 = c7fb5e87b3f16752
!	%l3 = 0000000000000000, Mem[0000000030181408] = ff000000
	stba	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = ff000000
!	%l7 = ff00000000000000, immd = 00000000000007d4, %l2 = 0000000000ffffff
	udivx	%l7,0x7d4,%l2		! %l2 = 0020932963a40621
	membar	#Sync			! Added by membar checker (69)
!	Mem[0000000010001428] = 00000000, %l1 = b3f16752, %l7 = 00000000
	add	%i0,0x28,%g1
	casa	[%g1]0x80,%l1,%l7	! %l7 = 0000000000000000
!	%f10 = ffffffff 5a000000, Mem[0000000010001428] = 00000000 000000ff
	stda	%f10,[%i0+0x028]%asi	! Mem[0000000010001428] = ffffffff 5a000000
!	%l6 = 0000000000000000, Mem[0000000020800041] = 0000c0bd
	stb	%l6,[%o1+0x041]		! Mem[0000000020800040] = 0000c0bd
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 000000ff, %l7 = 0000000000000000
	lduha	[%i1+%o4]0x81,%l7	! %l7 = 0000000000000000

p0_label_455:
!	Mem[0000000010101400] = ff38ff74, %l4 = 00000000ffffffff
	lduwa	[%i4+%g0]0x80,%l4	! %l4 = 00000000ff38ff74
!	Mem[0000000030001400] = 00000000, %l0 = 7dc9cfc81ebdde88
	ldsba	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1410] = ff0000ff00000000, %l2 = 0020932963a40621
	ldxa	[%i3+%o5]0x81,%l2	! %l2 = ff0000ff00000000
!	Mem[0000000010101408] = 00000000, %l4 = 00000000ff38ff74
	lduwa	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1400] = ff000000, %l3 = 0000000000000000
	ldswa	[%i3+%g0]0x89,%l3	! %l3 = ffffffffff000000
!	Mem[0000000010001408] = ff0000ff, %l1 = c7fb5e87b3f16752
	ldsba	[%i0+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000100c142c] = db0dffff, %l6 = 0000000000000000
	ldsba	[%i3+0x02e]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181408] = ff000000, %l4 = 0000000000000000
	ldswa	[%i6+0x008]%asi,%l4	! %l4 = ffffffffff000000
!	Mem[000000001000142c] = 5a000000, %l6 = ffffffffffffffff
	ldub	[%i0+0x02c],%l6		! %l6 = 000000000000005a
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = ff00000000000000, %f8  = 5a7bff5f ffffffff
	ldda	[%i6+%o5]0x80,%f8 	! %f8  = ff000000 00000000

p0_label_456:
!	%f10 = ffffffff 5a000000, %l1 = ffffffffffffffff
!	Mem[0000000010081430] = 00000000ff000000
	add	%i2,0x030,%g1
	stda	%f10,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010081430] = 0000005affffffff
!	%l2 = ff0000ff00000000, Mem[000000001008141c] = ffffffff, %asi = 80
	stha	%l2,[%i2+0x01c]%asi	! Mem[000000001008141c] = 0000ffff
!	Mem[0000000010181408] = 000000ff, %l6 = 000000000000005a
	ldstuba	[%i6+%o4]0x88,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010081424] = 00000000, %l5 = 0000000000000000, %asi = 80
	swapa	[%i2+0x024]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081408] = 8a000000, %l7 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%l3 = ffffffffff000000, Mem[0000000030181410] = 00000000000000ff
	stxa	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = ffffffffff000000
!	Mem[0000000010181400] = ffffffff, %l5 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010141410] = ff000000, %l4 = ffffffffff000000
	ldstuba	[%i5+%o5]0x80,%l4	! %l4 = 000000ff000000ff
!	%f11 = 5a000000, Mem[0000000010081410] = 00000000
	sta	%f11,[%i2+%o5]0x80	! Mem[0000000010081410] = 5a000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff0000ff, %l7 = 0000000000000000
	ldsba	[%i0+%o4]0x88,%l7	! %l7 = ffffffffffffffff

p0_label_457:
!	Mem[0000000010141408] = 0000000000000000, %l6 = 00000000000000ff
	ldxa	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181410] = 000000ff, %l2 = ff0000ff00000000
	lduwa	[%i6+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101400] = 0000ffff, %l4 = 00000000000000ff
	ldsha	[%i4+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030141408] = 0000004b ffff0ddb, %l2 = 000000ff, %l3 = ff000000
	ldda	[%i5+%o4]0x81,%l2	! %l2 = 000000000000004b 00000000ffff0ddb
!	Mem[0000000010141414] = 00000000, %l6 = 0000000000000000
	lduwa	[%i5+0x014]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141400] = 0000ffff, %l4 = ffffffffffffffff
	lduha	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1408] = 0000005a, %l0 = 0000000000000000
	ldswa	[%i3+%o4]0x80,%l0	! %l0 = 000000000000005a
!	Mem[0000000030041400] = 000000f5ff000000, %l2 = 000000000000004b
	ldxa	[%i1+%g0]0x81,%l2	! %l2 = 000000f5ff000000
!	Mem[0000000030181410] = 000000ff, %l7 = ffffffffffffffff
	ldswa	[%i6+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 0000ff00, %l3 = 00000000ffff0ddb
	ldstuba	[%i4+%o4]0x89,%l3	! %l3 = 00000000000000ff

p0_label_458:
!	%l5 = 00000000ffffffff, Mem[0000000010181400] = 00000000ff0000ff
	stxa	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000ffffffff
!	%f24 = ff000000 000000ff, %l7 = 00000000000000ff
!	Mem[0000000030101438] = ff0000ffffb27b5a
	add	%i4,0x038,%g1
	stda	%f24,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030101438] = ff000000000000ff
!	%l4 = 0000000000000000, Mem[0000000021800181] = ffff6a7f
	stb	%l4,[%o3+0x181]		! Mem[0000000021800180] = ff006a7f
!	Mem[00000000211c0001] = 00003487, %l4 = 0000000000000000
	ldstuba	[%o2+0x001]%asi,%l4	! %l4 = 00000000000000ff
!	%l4 = 00000000, %l5 = ffffffff, Mem[0000000030101400] = 0000ffff 0000000e
	stda	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000 ffffffff
!	Mem[00000000300c1408] = 36bd6ecc, %l3 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l3	! %l3 = 0000000036bd6ecc
!	Mem[0000000010001400] = 004b00f5, %l7 = 00000000000000ff
	ldstuba	[%i0+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	%l5 = 00000000ffffffff, Mem[0000000010101400] = 74ff38ff
	stwa	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffffff
!	%l5 = 00000000ffffffff, Mem[0000000030081408] = 8a0000ff
	stwa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081430] = 0000005affffffff, %l5 = 00000000ffffffff
	ldxa	[%i2+0x030]%asi,%l5	! %l5 = 0000005affffffff

p0_label_459:
!	Mem[0000000030041410] = 00000000 00000000, %l4 = 00000000, %l5 = ffffffff
	ldda	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000030041410] = 00000000, %l0 = 000000000000005a
	lduwa	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l3 = 0000000036bd6ecc
	ldswa	[%i4+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1404] = 000000ff, %l3 = 0000000000000000
	ldsb	[%i3+0x006],%l3		! %l3 = 0000000000000000
!	Mem[0000000030101408] = 0000ffff, %l2 = 000000f5ff000000
	ldswa	[%i4+%o4]0x89,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010041400] = 00000000 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010001418] = ae00747d, %f22 = 00000000
	lda	[%i0+0x018]%asi,%f22	! %f22 = ae00747d
!	Mem[0000000030101408] = ffff0000 00000000, %l0 = 00000000, %l1 = ffffffff
	ldda	[%i4+%o4]0x81,%l0	! %l0 = 00000000ffff0000 0000000000000000
!	Mem[00000000100c1428] = 00000000, %l0 = 00000000ffff0000
	ldsb	[%i3+0x02a],%l0		! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010041420] = ff61ff21 318e0000
	stda	%l6,[%i1+0x020]%asi	! Mem[0000000010041420] = 00000000 00000000

p0_label_460:
!	Mem[0000000030041400] = 000000f5, %l7 = 0000000000000000
	ldstuba	[%i1+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	%f27 = 00000000, Mem[00000000100c1400] = 00000000
	sta	%f27,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	Mem[0000000010141410] = ff000000, %l0 = 0000000000000000
	ldstuba	[%i5+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	%l6 = 00000000, %l7 = 00000000, Mem[00000000100c1408] = 0000005a 000000ff
	stda	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 00000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030101410] = ff000000 ff000000
	stda	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000 00000000
!	%l7 = 0000000000000000, Mem[0000000010181432] = 00000000
	sth	%l7,[%i6+0x032]		! Mem[0000000010181430] = 00000000
!	%f20 = 00000000 00000000, %l2 = 000000000000ffff
!	Mem[00000000100c1400] = 00000000000000ff
	stda	%f20,[%i3+%l2]ASI_PST8_PL ! Mem[00000000100c1400] = 0000000000000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010181410] = ff000000 00000000
	stda	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000 00000000
!	%l2 = 000000000000ffff, Mem[00000000100c140e] = 00000000
	stb	%l2,[%i3+0x00e]		! Mem[00000000100c140c] = 0000ff00
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 0000000000000000, %f2  = 00000000 00000000
	ldda	[%i1+%g0]0x80,%f2 	! %f2  = 00000000 00000000

p0_label_461:
!	Mem[0000000010081410] = 5a000000 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i2+0x010]%asi,%l6	! %l6 = 000000005a000000 0000000000000000
!	Mem[0000000030141400] = 0000ffff, %l6 = 000000005a000000
	lduha	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = ff000000ff000000, %l5 = 0000000000000000
	ldxa	[%i2+%g0]0x88,%l5	! %l5 = ff000000ff000000
!	Mem[00000000300c1400] = ff000000, %l0 = 00000000000000ff
	ldswa	[%i3+%g0]0x89,%l0	! %l0 = ffffffffff000000
!	Mem[0000000020800040] = 0000c0bd, %l1 = 0000000000000000
	lduh	[%o1+0x040],%l1		! %l1 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l7 = 0000000000000000
	ldswa	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081410] = ff0000ff, %l7 = 0000000000000000
	lduha	[%i2+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141408] = 00000000 00000000, %l0 = ff000000, %l1 = 00000000
	ldda	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010181408] = ff00000000000000, %f12 = 00000000 24b20000
	ldda	[%i6+%o4]0x80,%f12	! %f12 = ff000000 00000000
!	Starting 10 instruction Store Burst
!	Mem[000000001008142c] = 00000000, %l2 = 000000000000ffff, %asi = 80
	swapa	[%i2+0x02c]%asi,%l2	! %l2 = 0000000000000000

p0_label_462:
!	%l3 = 0000000000000000, Mem[00000000211c0000] = 00ff3487, %asi = 80
	stba	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ff3487
!	%f4  = 00000000, Mem[0000000010101400] = ffffffff
	sta	%f4 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	Mem[00000000100c1438] = 318e0000, %l1 = 0000000000000000
	ldstub	[%i3+0x038],%l1		! %l1 = 00000031000000ff
!	%f8  = ff000000, %f1  = 00000000
	fsqrts	%f8 ,%f1 		! %f1  = 7fffffff
!	Mem[0000000010001408] = ff0000ff, %l5 = ff000000ff000000
	ldstuba	[%i0+%o4]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000201c0000] = ff008ea0, %l0 = 0000000000000000
	ldub	[%o0+%g0],%l0		! %l0 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000010181400] = 00000000
	stwa	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	%l5 = 00000000000000ff, Mem[0000000021800181] = ff006a7f
	stb	%l5,[%o3+0x181]		! Mem[0000000021800180] = ffff6a7f
!	Mem[00000000100c1410] = b20000ff, %l0 = 00000000000000ff
	ldstuba	[%i3+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800000] = 0000133c, %l6 = 0000000000000000
	ldsba	[%o3+0x000]%asi,%l6	! %l6 = 0000000000000000

p0_label_463:
!	Mem[0000000010081408] = 0000000000000000, %f12 = ff000000 00000000
	ldda	[%i2+%o4]0x88,%f12	! %f12 = 00000000 00000000
!	Mem[0000000010141400] = 00000000, %f28 = ff000000
	lda	[%i5+%g0]0x88,%f28	! %f28 = 00000000
!	Mem[0000000020800000] = 00004ebd, %l4 = 0000000000000000
	lduh	[%o1+%g0],%l4		! %l4 = 0000000000000000
!	Mem[0000000010041410] = f5000000, %l4 = 0000000000000000
	lduha	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181408] = 0000008aff000000, %f26 = 00000000 00000000
	ldda	[%i6+%o4]0x89,%f26	! %f26 = 0000008a ff000000
!	Mem[0000000010041428] = 00000000ffff0ddb, %f18 = 000000ff 00000000
	ldda	[%i1+0x028]%asi,%f18	! %f18 = 00000000 ffff0ddb
!	Mem[0000000020800000] = 00004ebd, %l6 = 0000000000000000
	ldsb	[%o1+0x001],%l6		! %l6 = 0000000000000000
!	Mem[0000000030041408] = ff000000, %l2 = 0000000000000000
	lduba	[%i1+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1400] = 000000ff 00000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i3+%g0]0x81,%l2	! %l2 = 00000000000000ff 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000030041408] = 000000ff00000000
	stxa	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000000000ff

p0_label_464:
!	%f8  = ff000000, Mem[0000000030101408] = 0000ffff
	sta	%f8 ,[%i4+%o4]0x89	! Mem[0000000030101408] = ff000000
!	%l7 = 00000000000000ff, Mem[0000000030181408] = ff000000
	stba	%l7,[%i6+%o4]0x89	! Mem[0000000030181408] = ff0000ff
!	%l2 = 00000000000000ff, Mem[0000000030001400] = 00000000000000ff
	stxa	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000000000ff
!	%f28 = 00000000 ff000000, %l2 = 00000000000000ff
!	Mem[00000000100c1420] = c6ffffff00ff0000
	add	%i3,0x020,%g1
	stda	%f28,[%g1+%l2]ASI_PST8_PL ! Mem[00000000100c1420] = 000000ff00000000
!	%l7 = 00000000000000ff, Mem[00000000300c1410] = 00000000ff0000ff
	stxa	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000000000ff
!	%l6 = 0000000000000000, %l3 = 0000000000000000, %y  = ffffffff
	udiv	%l6,%l3,%l4		! Div by zero, %l0 = 000000000000014f
	mov	%l0,%y			! %y = 00000127
!	%l2 = 00000000000000ff, Mem[0000000030081410] = ff0000ff
	stwa	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff
!	%f11 = 5a000000, Mem[0000000010101410] = 00000000
	sta	%f11,[%i4+%o5]0x80	! Mem[0000000010101410] = 5a000000
!	Mem[0000000010101408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i4+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000, %f1  = 7fffffff
	lda	[%i0+%o4]0x89,%f1 	! %f1 = 00000000

p0_label_465:
!	Mem[00000000100c1410] = b20000ff, %f9  = 00000000
	lda	[%i3+%o5]0x88,%f9 	! %f9 = b20000ff
!	Mem[0000000010081410] = 0000005a, %l1 = 0000000000000031
	ldsba	[%i2+%o5]0x88,%l1	! %l1 = 000000000000005a
!	Mem[0000000030081408] = ffffffff, %l5 = 00000000000000ff
	ldswa	[%i2+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030101400] = 00000000, %l3 = 0000000000000000
	ldsha	[%i4+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l2 = 00000000000000ff
	ldswa	[%i2+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i4+%g0]0x81,%l7	! %l7 = 0000000000000000
!	%f11 = 5a000000, %f0  = ff000000, %f25 = 000000ff
	fmuls	%f11,%f0 ,%f25		! %f25 = ff800000
!	Mem[00000000300c1400] = 000000ff, %f6  = 00000000
	lda	[%i3+%g0]0x81,%f6 	! %f6 = 000000ff
!	Mem[000000001010143c] = 822ee1af, %l7 = 0000000000000000
	ldsha	[%i4+0x03c]%asi,%l7	! %l7 = ffffffffffff822e
!	Starting 10 instruction Store Burst
!	%f20 = 00000000 00000000, Mem[0000000010141408] = 00000000 00000000
	stda	%f20,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000 00000000

p0_label_466:
!	Mem[0000000010041410] = 000000f5, %l1 = 000000000000005a
	swapa	[%i1+%o5]0x80,%l1	! %l1 = 00000000000000f5
!	%l7 = ffffffffffff822e, Mem[0000000030141410] = ffff00007f8000f2
	stxa	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffffffffff822e
!	%f8  = ff000000, Mem[0000000030081408] = ffffffff
	sta	%f8 ,[%i2+%o4]0x81	! Mem[0000000030081408] = ff000000
!	Mem[0000000030101408] = ff000000, %l2 = 0000000000000000
	swapa	[%i4+%o4]0x89,%l2	! %l2 = 00000000ff000000
!	Mem[0000000010181428] = ff000000618efb7f, %l3 = 0000000000000000, %l0 = 0000000000000127
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l3,%l0	! %l0 = ff000000618efb7f
!	%f26 = 0000008a ff000000, Mem[0000000010141400] = 00000000 ff000000
	stda	%f26,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000008a ff000000
!	%f16 = 000000f5 ff000000 00000000 ffff0ddb
!	%f20 = 00000000 00000000 ae00747d ffffffff
!	%f24 = ff000000 ff800000 0000008a ff000000
!	%f28 = 00000000 ff000000 00ff0000 00000000
	stda	%f16,[%i3]ASI_BLK_SL	! Block Store to 00000000300c1400
!	%f12 = 00000000 00000000, Mem[0000000030081400] = 00000000 00000000
	stda	%f12,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000 00000000
!	%l6 = 0000000000000000, Mem[0000000030081408] = ff000000ffff0dff
	stxa	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 5a000000, %l7 = ffffffffffff822e
	lduba	[%i2+%o5]0x80,%l7	! %l7 = 000000000000005a

p0_label_467:
!	Mem[0000000010001410] = 00fff203, %f9  = b20000ff
	lda	[%i0+%o5]0x88,%f9 	! %f9 = 00fff203
!	Mem[0000000010081420] = 00000000, %l2 = 00000000ff000000
	ldsw	[%i2+0x020],%l2		! %l2 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l4 = 0000000000000000
	lduha	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (70)
!	Mem[00000000300c1408] = db0dffff, %f6  = 000000ff
	lda	[%i3+%o4]0x81,%f6 	! %f6 = db0dffff
!	Mem[0000000010081400] = ff000000, %l4 = 0000000000000000
	ldsba	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %f11 = 5a000000
	lda	[%i1+%g0]0x80,%f11	! %f11 = 00000000
!	Mem[000000001014143c] = ffb2ff5a, %f3  = 00000000
	lda	[%i5+0x03c]%asi,%f3 	! %f3 = ffb2ff5a
!	Mem[0000000020800040] = 0000c0bd, %l3 = 0000000000000000
	ldsh	[%o1+0x040],%l3		! %l3 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l6 = 0000000000000000
	lduwa	[%i0+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = ff000000, %l2 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l2	! %l2 = 00000000ff000000

p0_label_468:
!	%f8  = ff000000, Mem[0000000010181420] = 959a65cd
	st	%f8 ,[%i6+0x020]	! Mem[0000000010181420] = ff000000
!	Mem[00000000100c143c] = ffffffff, %l2 = ff000000, %l6 = 00000000
	add	%i3,0x3c,%g1
	casa	[%g1]0x80,%l2,%l6	! %l6 = 00000000ffffffff
!	%l3 = 0000000000000000, Mem[00000000100c1400] = 0000000000000000
	stxa	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000000000000000
!	Mem[0000000030001410] = 000000ff, %l0 = ff000000618efb7f
	ldstuba	[%i0+%o5]0x89,%l0	! %l0 = 000000ff000000ff
!	Mem[00000000201c0001] = ff008ea0, %l6 = 00000000ffffffff
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000030101400] = ffffffff00000000
	stxa	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000000000000000
!	%f30 = 00ff0000, Mem[0000000030101400] = 00000000
	sta	%f30,[%i4+%g0]0x81	! Mem[0000000030101400] = 00ff0000
!	%l0 = 00000000000000ff, Mem[0000000010101408] = 000000ff
	stha	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000ff
!	%f14 = 5affb2ff, Mem[0000000010081408] = 00000000
	sta	%f14,[%i2+%o4]0x80	! Mem[0000000010081408] = 5affb2ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ff000000, %l1 = 00000000000000f5
	ldsba	[%i2+%o5]0x81,%l1	! %l1 = ffffffffffffffff

p0_label_469:
!	Mem[0000000010041410] = 0000005a, %l3 = 0000000000000000
	lduw	[%i1+%o5],%l3		! %l3 = 000000000000005a
!	Mem[0000000010041410] = 0000005a, %l2 = 00000000ff000000
	ldsba	[%i1+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101408] = ff000000, %l2 = 0000000000000000
	ldsba	[%i4+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000020800000] = 00004ebd, %l0 = 00000000000000ff
	lduha	[%o1+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101410] = 5a00000000000000, %f30 = 00ff0000 00000000
	ldda	[%i4+0x010]%asi,%f30	! %f30 = 5a000000 00000000
!	Mem[0000000030001400] = 00000000, %f19 = ffff0ddb
	lda	[%i0+%g0]0x89,%f19	! %f19 = 00000000
!	Mem[0000000030001400] = 00000000, %l5 = ffffffffffffffff
	lduha	[%i0+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000020800000] = 00004ebd, %l3 = 000000000000005a
	ldsha	[%o1+0x000]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141410] = ffffffffffff822e, %f16 = 000000f5 ff000000
	ldda	[%i5+%o5]0x81,%f16	! %f16 = ffffffff ffff822e
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 0000005a, Mem[0000000030141408] = 0000004b ffff0ddb
	stda	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000 0000005a

p0_label_470:
!	%f24 = ff000000 ff800000, %l2 = ffffffffffffffff
!	Mem[0000000010181430] = 00000000ff000000
	add	%i6,0x030,%g1
	stda	%f24,[%g1+%l2]ASI_PST16_PL ! Mem[0000000010181430] = 000080ff000000ff
!	%f6  = db0dffff ffff0000, Mem[0000000010041420] = 00000000 00000000
	stda	%f6 ,[%i1+0x020]%asi	! Mem[0000000010041420] = db0dffff ffff0000
!	%l5 = 0000000000000000, Mem[0000000030001400] = 00000000000000ff
	stxa	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000000000000000
!	%f24 = ff000000 ff800000, Mem[0000000010001428] = ffffffff 5a000000
	stda	%f24,[%i0+0x028]%asi	! Mem[0000000010001428] = ff000000 ff800000
!	%l6 = 00000000, %l7 = 0000005a, Mem[0000000010141400] = 00000000 0000008a
	stda	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000 0000005a
!	%l5 = 0000000000000000, Mem[0000000010001408] = ff0000ff
	stba	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000ff
!	%l6 = 00000000, %l7 = 0000005a, Mem[0000000010081410] = 5a000000 00000000
	std	%l6,[%i2+%o5]		! Mem[0000000010081410] = 00000000 0000005a
!	Mem[0000000030001410] = 000000ff, %l0 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l0	! %l0 = 000000ff000000ff
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030081408] = 00000000 00000000
	stda	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000, %l6 = 0000000000000000
	ldsha	[%i1+%o4]0x89,%l6	! %l6 = 0000000000000000

p0_label_471:
!	Mem[0000000010001400] = ff4b00f5, %f14 = 5affb2ff
	lda	[%i0+0x000]%asi,%f14	! %f14 = ff4b00f5
!	Mem[0000000010081408] = 5affb2ff 00000000, %l2 = ffffffff, %l3 = 00000000
	ldda	[%i2+%o4]0x80,%l2	! %l2 = 000000005affb2ff 0000000000000000
!	Mem[0000000030081400] = 00000000 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010141410] = 000000ff, %l4 = 0000000000000000
	lduba	[%i5+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000211c0000] = 00ff3487, %l2 = 000000005affb2ff
	lduba	[%o2+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[000000001000140c] = ffffffff, %l3 = 0000000000000000
	ldsb	[%i0+0x00d],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010041400] = 00000000, %l4 = 00000000000000ff
	lduwa	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1408] = 000000000000ff00, %f30 = 5a000000 00000000
	ldda	[%i3+%o4]0x80,%f30	! %f30 = 00000000 0000ff00
!	Mem[0000000010041434] = 8941ffd4, %l1 = ffffffffffffffff
	ldswa	[%i1+0x034]%asi,%l1	! %l1 = ffffffff8941ffd4
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010081400] = 000000ff
	stba	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff

p0_label_472:
!	Mem[0000000021800100] = ffff0b85, %l4 = 0000000000000000
	ldstub	[%o3+0x100],%l4		! %l4 = 000000ff000000ff
!	Mem[00000000201c0000] = ffff8ea0, %l4 = 00000000000000ff
	ldstub	[%o0+%g0],%l4		! %l4 = 000000ff000000ff
!	Mem[00000000211c0001] = 00ff3487, %l3 = ffffffffffffffff
	ldstuba	[%o2+0x001]%asi,%l3	! %l3 = 000000ff000000ff
!	%l0 = 00000000000000ff, immed = fffff5fc, %y  = 00000127
	udiv	%l0,-0xa04,%l6		! %l6 = 0000000000000127
	mov	%l0,%y			! %y = 000000ff
!	Mem[0000000010081408] = ffb2ff5a, %l5 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l5	! %l5 = 00000000ffb2ff5a
!	%f31 = 0000ff00, %f14 = ff4b00f5 000000ff
	fstod	%f31,%f14		! %l0 = 0000000000000121, Unfinished, %fsr = 0b00000c00
!	%f0  = ff000000 00000000, %l2 = 00000000000000ff
!	Mem[00000000300c1430] = 000000ff00000000
	add	%i3,0x030,%g1
	stda	%f0,[%g1+%l2]ASI_PST16_SL ! Mem[00000000300c1430] = 00000000000000ff
!	Mem[000000001004140b] = ff000000, %l1 = ffffffff8941ffd4
	ldstuba	[%i1+0x00b]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141400] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i5+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 00000000, %l0 = 0000000000000121
	lduwa	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000000

p0_label_473:
	membar	#Sync			! Added by membar checker (71)
!	Mem[0000000030001400] = 00000000 00000000 00000000 00000000
!	Mem[0000000030001410] = ff000000 00000000 0000ffff 00000000
!	Mem[0000000030001420] = ffffffff 5fff7b5a 0000005a ffffffff
!	Mem[0000000030001430] = 0000b224 00000000 ff000000 ffb2ff5a
	ldda	[%i0]ASI_BLK_S,%f0	! Block Load from 0000000030001400
!	Mem[0000000010001408] = 000000ff, %l3 = 00000000000000ff
	lduha	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l0 = 0000000000000000
	ldsha	[%i3+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141410] = ffffffff, %f29 = ff000000
	lda	[%i5+%o5]0x89,%f29	! %f29 = ffffffff
!	Mem[0000000030101410] = 00000000, %f24 = ff000000
	lda	[%i4+%o5]0x81,%f24	! %f24 = 00000000
!	Mem[00000000300c1410] = 00000000, %l4 = 00000000000000ff
	ldsba	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141420] = ffffffff 5fff7b5a, %l4 = 00000000, %l5 = ffb2ff5a
	ldda	[%i5+0x020]%asi,%l4	! %l4 = 00000000ffffffff 000000005fff7b5a
!	Mem[00000000100c1408] = 00000000, %l7 = 000000000000005a
	ldswa	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = 00000000000000ff, %f30 = 00000000 0000ff00
	ldda	[%i6+%o4]0x88,%f30	! %f30 = 00000000 000000ff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010181400] = ffffffff00000000
	stxa	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000000000000000

p0_label_474:
!	Mem[0000000010181410] = 00000000, %l6 = 0000000000000127
	swapa	[%i6+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181408] = ff0000ff, %l6 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l6	! %l6 = 000000ff000000ff
!	%l5 = 000000005fff7b5a, Mem[0000000010141410] = ff000000
	stwa	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = 5fff7b5a
!	Mem[0000000030101400] = 00ff0000, %l4 = 00000000ffffffff
	ldstuba	[%i4+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%f22 = ae00747d ffffffff, %l2 = 00000000000000ff
!	Mem[0000000030041408] = 00000000000000ff
	add	%i1,0x008,%g1
	stda	%f22,[%g1+%l2]ASI_PST8_S ! Mem[0000000030041408] = ae00747dffffffff
!	%l5 = 000000005fff7b5a, Mem[0000000010081410] = 00000000
	stha	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 00007b5a
!	%f22 = ae00747d, Mem[0000000010141420] = ffffffff
	st	%f22,[%i5+0x020]	! Mem[0000000010141420] = ae00747d
!	%l7 = 0000000000000000, Mem[0000000010101400] = 00000000
	stwa	%l7,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	%l2 = 00000000000000ff, Mem[0000000030081400] = 00000000
	stwa	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 0000000000000000, %f18 = 00000000 00000000
	ldda	[%i3+%g0]0x88,%f18	! %f18 = 00000000 00000000

p0_label_475:
!	Mem[0000000021800100] = ffff0b85, %l1 = 0000000000000000
	lduha	[%o3+0x100]%asi,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010181420] = ff00000000fff2ff, %f30 = 00000000 000000ff
	ldda	[%i6+0x020]%asi,%f30	! %f30 = ff000000 00fff2ff
!	Mem[0000000010041418] = 00000000, %l7 = 0000000000000000
	lduh	[%i1+0x01a],%l7		! %l7 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l0 = 0000000000000000
	ldswa	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101420] = 00000000000000ff, %f20 = 00000000 00000000
	ldda	[%i4+0x020]%asi,%f20	! %f20 = 00000000 000000ff
!	Mem[0000000010141408] = 00000000, %l2 = 00000000000000ff
	ldsba	[%i5+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081400] = ff000000, %l7 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = 000000ff, %l2 = 0000000000000000
	ldswa	[%i6+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1400] = 00000000, %l7 = 0000000000000000
	ldswa	[%i3+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030041408] = ae00747d
	stwa	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000

p0_label_476:
!	Mem[0000000030141410] = ffffffff, %l2 = 00000000000000ff
	swapa	[%i5+%o5]0x81,%l2	! %l2 = 00000000ffffffff
!	%l5 = 000000005fff7b5a, Mem[0000000020800000] = 00004ebd, %asi = 80
	stha	%l5,[%o1+0x000]%asi	! Mem[0000000020800000] = 7b5a4ebd
!	%f30 = ff000000 00fff2ff, Mem[0000000030101408] = 00000000 00000000
	stda	%f30,[%i4+%o4]0x89	! Mem[0000000030101408] = ff000000 00fff2ff
!	%f0  = 00000000 00000000, Mem[0000000030041408] = 00000000 ffffffff
	stda	%f0 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000 00000000
!	%l1 = 000000000000ffff, Mem[00000000211c0001] = 00ff3487, %asi = 80
	stba	%l1,[%o2+0x001]%asi	! Mem[00000000211c0000] = 00ff3487
!	%l3 = 0000000000000000, Mem[000000001000142c] = ff800000
	stb	%l3,[%i0+0x02c]		! Mem[000000001000142c] = 00800000
!	%f21 = 000000ff, Mem[0000000010081400] = ff000000
	sta	%f21,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff
!	%l2 = ffffffff, %l3 = 00000000, Mem[0000000010101408] = 000000ff 00000000
	stda	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffffff 00000000
!	%f30 = ff000000, Mem[0000000010101400] = 00000000
	sta	%f30,[%i4+%g0]0x88	! Mem[0000000010101400] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ff000000, %l1 = 000000000000ffff
	ldswa	[%i5+%g0]0x80,%l1	! %l1 = ffffffffff000000

p0_label_477:
!	Mem[0000000030001400] = 00000000, %l4 = 0000000000000000
	lduwa	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000000
!	%l1 = ffffffffff000000, imm = 00000000000005b5, %l4 = 0000000000000000
	sub	%l1,0x5b5,%l4		! %l4 = fffffffffefffa4b
!	Mem[00000000100c1408] = 00000000, %l3 = 0000000000000000
	lduha	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (72)
!	Mem[0000000010141400] = ff000000 5a000000 00000000 00000000
!	Mem[0000000010141410] = 5fff7b5a 00000000 0000ffff 00000000
!	Mem[0000000010141420] = ae00747d 5fff7b5a 0000005a ffffffff
!	Mem[0000000010141430] = 0000b224 00000000 ff000000 ffb2ff5a
	ldda	[%i5]ASI_BLK_P,%f16	! Block Load from 0000000010141400
!	Mem[0000000010141408] = 00000000, %f6  = 0000ffff
	lda	[%i5+%o4]0x88,%f6 	! %f6 = 00000000
!	Mem[0000000030101410] = 00000000 00000000, %l0 = 00000000, %l1 = ff000000
	ldda	[%i4+%o5]0x89,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l2 = 00000000ffffffff
	ldsba	[%i3+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l3 = 0000000000000000
	ldsha	[%i1+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141400] = 0000ffff, %l4 = fffffffffefffa4b
	ldsha	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000010001410] = 03f2ff00
	stw	%l2,[%i0+%o5]		! Mem[0000000010001410] = 00000000

p0_label_478:
!	%l6 = 00000000000000ff, Mem[0000000030001408] = 00000000
	stba	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000ff
!	Mem[0000000010081400] = 000000ff, %l2 = 0000000000000000
	swapa	[%i2+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041424] = ffff0000, %l2 = 000000ff, %l2 = 000000ff
	add	%i1,0x24,%g1
	casa	[%g1]0x80,%l2,%l2	! %l2 = 00000000ffff0000
!	Mem[0000000010101410] = 0000005a, %l2 = 00000000ffff0000
	ldstuba	[%i4+%o5]0x88,%l2	! %l2 = 0000005a000000ff
!	Mem[0000000030001408] = 000000ff, %l0 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	%f4  = ff000000, Mem[00000000100c1410] = b20000ff
	sta	%f4 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff000000
!	Mem[0000000010181400] = 00000000, %l6 = 00000000000000ff
	ldstuba	[%i6+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	%l2 = 000000000000005a, Mem[00000000300c1400] = 000000fff5000000
	stxa	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000000000005a
!	%l5 = 000000005fff7b5a, Mem[0000000030101400] = 000000000000ffff
	stxa	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000005fff7b5a
!	Starting 10 instruction Load Burst
!	Mem[000000001010140c] = 00000000, %l5 = 000000005fff7b5a
	ldsba	[%i4+0x00c]%asi,%l5	! %l5 = 0000000000000000

p0_label_479:
!	Mem[0000000030001400] = 00000000, %l7 = 0000000000000000
	lduwa	[%i0+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041410] = 0000005a, %l2 = 000000000000005a
	lduwa	[%i1+%o5]0x80,%l2	! %l2 = 000000000000005a
!	Mem[00000000100c1408] = 00000000, %l7 = 0000000000000000
	lduwa	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101400] = 5a7bff5f, %f5  = 00000000
	lda	[%i4+%g0]0x81,%f5 	! %f5 = 5a7bff5f
!	Mem[0000000030181410] = 000000ffffffffff, %f4  = ff000000 5a7bff5f
	ldda	[%i6+%o5]0x81,%f4 	! %f4  = 000000ff ffffffff
!	%l6 = 0000000000000000, immed = 00000b62, %y  = 000000ff
	umul	%l6,0xb62,%l4		! %l4 = 0000000000000000, %y = 00000000
!	Mem[0000000030101410] = 00000000, %f9  = 5fff7b5a
	lda	[%i4+%o5]0x81,%f9 	! %f9 = 00000000
!	Mem[0000000030141400] = 0000ffffff000000, %f10 = 0000005a ffffffff
	ldda	[%i5+%g0]0x81,%f10	! %f10 = 0000ffff ff000000
!	%l1 = 0000000000000000, Mem[0000000030081400] = ff00000000000000
	stxa	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000000000000000
!	Starting 10 instruction Store Burst
!	Code Fragment 3
p0_fragment_41:
!	%l0 = 00000000000000ff
	setx	0x5cf513f06e3c998c,%g7,%l0 ! %l0 = 5cf513f06e3c998c
!	%l1 = 0000000000000000
	setx	0x56b1bff789b8e597,%g7,%l1 ! %l1 = 56b1bff789b8e597
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5cf513f06e3c998c
	setx	0xe4d727c026c2f009,%g7,%l0 ! %l0 = e4d727c026c2f009
!	%l1 = 56b1bff789b8e597
	setx	0x134a6c18391deda8,%g7,%l1 ! %l1 = 134a6c18391deda8

p0_label_480:
!	Mem[00000000201c0001] = ffff8ea0, %l3 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l3	! %l3 = 000000ff000000ff
!	%f6  = 00000000 00000000, Mem[0000000030041400] = f50000ff 000000ff
	stda	%f6 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000 00000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010101410] = 000000ff 00000000
	stda	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000 00000000
!	%l6 = 0000000000000000, Mem[0000000030041408] = 00000000
	stha	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	%l1 = 134a6c18391deda8, Mem[0000000010101400] = 000000ff
	stwa	%l1,[%i4+%g0]0x80	! Mem[0000000010101400] = 391deda8
!	%f9  = 00000000, Mem[0000000030081410] = ff000000
	sta	%f9 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	%l5 = 0000000000000000, Mem[0000000010001410] = 0000000000000000
	stxa	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000000
!	%l0 = e4d727c026c2f009, Mem[00000000201c0000] = ffff8ea0
	sth	%l0,[%o0+%g0]		! Mem[00000000201c0000] = f0098ea0
!	%l3 = 00000000000000ff, Mem[0000000030001410] = ff00000000000000
	stxa	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181424] = 00fff2ff, %l5 = 0000000000000000
	ldsh	[%i6+0x026],%l5		! %l5 = fffffffffffff2ff

p0_label_481:
!	Code Fragment 3
p0_fragment_42:
!	%l0 = e4d727c026c2f009
	setx	0x7518cdc0661893bb,%g7,%l0 ! %l0 = 7518cdc0661893bb
!	%l1 = 134a6c18391deda8
	setx	0x43bb913feb6448ac,%g7,%l1 ! %l1 = 43bb913feb6448ac
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7518cdc0661893bb
	setx	0xc20d0ed01ee21687,%g7,%l0 ! %l0 = c20d0ed01ee21687
!	%l1 = 43bb913feb6448ac
	setx	0xc08277483c5fa0c4,%g7,%l1 ! %l1 = c08277483c5fa0c4
!	Mem[0000000030141400] = 0000ffffff000000, %f18 = 00000000 00000000
	ldda	[%i5+%g0]0x81,%f18	! %f18 = 0000ffff ff000000
!	Mem[0000000010041420] = db0dffffffff0000, %f12 = 0000b224 00000000
	ldd	[%i1+0x020],%f12	! %f12 = db0dffff ffff0000
!	Mem[0000000010001400] = f5004bff, %l1 = c08277483c5fa0c4
	ldswa	[%i0+%g0]0x88,%l1	! %l1 = fffffffff5004bff
!	Mem[0000000030001410] = 00000000, %l5 = fffffffffffff2ff
	ldsha	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041408] = ff0000ff, %l3 = 00000000000000ff
	lduh	[%i1+0x00a],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010041410] = 0000005a, %l0 = c20d0ed01ee21687
	ldsba	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141430] = 0000b22400000000, %l1 = fffffffff5004bff
	ldx	[%i5+0x030],%l1		! %l1 = 0000b22400000000
!	Mem[0000000010001410] = 00000000, %l3 = 00000000000000ff
	ldsha	[%i0+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (73)
!	%l2 = 000000000000005a, Mem[0000000010141410] = 5a7bff5f
	stwa	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000005a

p0_label_482:
!	%l1 = 0000b22400000000, Mem[0000000010141408] = 00000000
	stha	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%l7 = 0000000000000000, Mem[0000000030181400] = 00000000
	stba	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030041408] = 00000000 00000000
	stda	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000 00000000
!	Mem[0000000010141410] = 0000005a, %l1 = 0000b22400000000
	ldstuba	[%i5+%o5]0x88,%l1	! %l1 = 0000005a000000ff
!	%f14 = ff000000 ffb2ff5a, %l7 = 0000000000000000
!	Mem[00000000300c1420] = 000080ff000000ff
	add	%i3,0x020,%g1
	stda	%f14,[%g1+%l7]ASI_PST32_SL ! Mem[00000000300c1420] = 000080ff000000ff
!	Mem[00000000300c1410] = 00000000, %l1 = 000000000000005a
	swapa	[%i3+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000030101408] = ff00000000fff2ff
	stxa	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000000
!	%l2 = 000000000000005a, Mem[0000000010101400] = 391deda8
	stba	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 5a1deda8
!	%f19 = ff000000, Mem[0000000010141408] = 00000000
	sta	%f19,[%i5+%o4]0x88	! Mem[0000000010141408] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 5a1deda8ff000de1, %f8  = ffffffff 00000000
	ldda	[%i4+%g0]0x80,%f8 	! %f8  = 5a1deda8 ff000de1

p0_label_483:
!	Mem[0000000010041408] = ff0000ff 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i1+0x008]%asi,%l6	! %l6 = 00000000ff0000ff 0000000000000000
!	Mem[0000000010001430] = 74ff38d1, %l0 = 0000000000000000
	lduw	[%i0+0x030],%l0		! %l0 = 0000000074ff38d1
!	Mem[0000000010001408] = ffffffffff000000, %l5 = 0000000000000000
	ldxa	[%i0+%o4]0x88,%l5	! %l5 = ffffffffff000000
!	Mem[00000000300c1410] = 5a000000, %l1 = 0000000000000000
	lduha	[%i3+%o5]0x81,%l1	! %l1 = 0000000000005a00
!	Mem[0000000010041408] = ff0000ff, %l4 = 0000000000000000
	ldsha	[%i1+%o4]0x80,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000010081400] = 00000000, %l0 = 0000000074ff38d1
	lduha	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0000] = f0098ea0, %l5 = ffffffffff000000
	ldsba	[%o0+0x000]%asi,%l5	! %l5 = fffffffffffffff0
!	Mem[0000000030181400] = 00000000, %l1 = 0000000000005a00
	lduwa	[%i6+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1408] = db0dffff, %f23 = 00000000
	lda	[%i3+%o4]0x81,%f23	! %f23 = db0dffff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010141400] = 000000ff
	stha	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000

p0_label_484:
!	%f30 = ff000000, Mem[0000000010181408] = ff000000
	sta	%f30,[%i6+%o4]0x80	! Mem[0000000010181408] = ff000000
!	%l7 = 0000000000000000, Mem[0000000030141408] = 00000000
	stha	%l7,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	Mem[00000000100c140f] = 0000ff00, %l2 = 000000000000005a
	ldstuba	[%i3+0x00f]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041418] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i1+0x018]%asi,%l0	! %l0 = 00000000000000ff
!	%l6 = 00000000ff0000ff, Mem[0000000010141400] = 00000000
	stba	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = ff000000
!	%f16 = ff000000 5a000000, Mem[0000000010041400] = 00000000 00000000
	stda	%f16,[%i1+%g0]0x88	! Mem[0000000010041400] = ff000000 5a000000
!	%l1 = 0000000000000000, Mem[0000000010081408] = 00000000
	stwa	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	%l7 = 0000000000000000, Mem[0000000030141408] = 00000000
	stwa	%l7,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	%l2 = 0000000000000000, Mem[0000000010081408] = 00000000
	stwa	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	Starting 10 instruction Load Burst
!	%f0  = 00000000, %f26 = 0000005a
	fcmpes	%fcc2,%f0 ,%f26		! %fcc2 = 1

p0_label_485:
!	Mem[0000000010001410] = 00000000, %l5 = fffffffffffffff0
	ldsba	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081408] = 0000000000000000, %f12 = db0dffff ffff0000
	ldda	[%i2+%o4]0x88,%f12	! %f12 = 00000000 00000000
!	Mem[0000000030181410] = ff000000, %l3 = 0000000000000000
	lduwa	[%i6+%o5]0x89,%l3	! %l3 = 00000000ff000000
!	Mem[00000000100c1410] = ff000000, %l3 = 00000000ff000000
	ldswa	[%i3+%o5]0x88,%l3	! %l3 = ffffffffff000000
!	Mem[0000000010081408] = 00000000, %l1 = 0000000000000000
	lduba	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l4 = ffffffffffffff00
	lduwa	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181400] = ff000000, %l3 = ffffffffff000000
	ldsh	[%i6+0x002],%l3		! %l3 = 0000000000000000
!	Mem[0000000010041400] = 0000005a000000ff, %f20 = 5fff7b5a 00000000
	ldda	[%i1+%g0]0x80,%f20	! %f20 = 0000005a 000000ff
!	Mem[00000000100c1408] = 00000000, %f25 = 5fff7b5a
	lda	[%i3+%o4]0x88,%f25	! %f25 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[000000001010143c] = 822ee1af, %l4 = 00000000, %l2 = 00000000
	add	%i4,0x3c,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 00000000822ee1af

p0_label_486:
!	Mem[0000000030081408] = 00000000, %l6 = 00000000ff0000ff
	swapa	[%i2+%o4]0x89,%l6	! %l6 = 0000000000000000
!	%f12 = 00000000 00000000, Mem[0000000030001408] = 00000000 00000000
	stda	%f12,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000 00000000
!	%l7 = 0000000000000000, Mem[0000000021800000] = 0000133c, %asi = 80
	stha	%l7,[%o3+0x000]%asi	! Mem[0000000021800000] = 0000133c
!	%f10 = 0000ffff ff000000, Mem[0000000010041410] = 5a000000 000000ff
	stda	%f10,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000ffff ff000000
!	Mem[0000000010041408] = ff0000ff, %l3 = 0000000000000000
	ldstuba	[%i1+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010001408] = 000000ff ffffffff
	std	%l0,[%i0+%o4]		! Mem[0000000010001408] = 00000000 00000000
!	%l7 = 0000000000000000, Mem[00000000300c1408] = db0dffff
	stha	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000ffff
!	Mem[0000000010181400] = ff000000, %l3 = 00000000000000ff
	ldstuba	[%i6+%g0]0x80,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010141410] = ff000000, %l2 = 00000000822ee1af
	ldstuba	[%i5+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ff0000ff, %l7 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l7	! %l7 = 000000ff000000ff

p0_label_487:
!	%l3 = 00000000000000ff, Mem[00000000201c0001] = f0098ea0, %asi = 80
	stba	%l3,[%o0+0x001]%asi	! Mem[00000000201c0000] = f0ff8ea0
!	Mem[0000000010101400] = 5a1deda8, %l1 = 0000000000000000
	ldsba	[%i4+%g0]0x80,%l1	! %l1 = 000000000000005a
!	%f13 = 00000000, %f16 = ff000000 5a000000
	fitod	%f13,%f16		! %f16 = 00000000 00000000
!	Mem[0000000010001410] = 00000000, %l7 = 00000000000000ff
	lduwa	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000
!	%l7 = 0000000000000000, immed = fffffef7, %y  = 00000000
	sdiv	%l7,-0x109,%l2		! %l2 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000030141408] = 00000000, %l6 = 0000000000000000
	ldsba	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = 000000ff, %l4 = 0000000000000000
	ldswa	[%i6+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081400] = 00000000 000000ff, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000 00000000000000ff
!	Mem[000000001000143c] = 00000000, %l7 = 0000000000000000
	ldsw	[%i0+0x03c],%l7		! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f0  = 00000000 00000000 00000000 00000000
!	%f4  = 000000ff ffffffff 00000000 00000000
!	%f8  = 5a1deda8 ff000de1 0000ffff ff000000
!	%f12 = 00000000 00000000 ff000000 ffb2ff5a
	stda	%f0,[%i0]ASI_BLK_AIUSL	! Block Store to 0000000030001400

p0_label_488:
!	Mem[0000000010141430] = 0000b22400000000, %l4 = 0000000000000000, %l7 = 0000000000000000
	add	%i5,0x30,%g1
	casxa	[%g1]0x80,%l4,%l7	! %l7 = 0000b22400000000
!	Mem[0000000030101410] = 00000000, %l3 = 00000000000000ff
	swapa	[%i4+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i2+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%l7 = 0000b22400000000, Mem[00000000300c1408] = ffff0000
	stwa	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%l3 = 0000000000000000, Mem[00000000100c1408] = 00000000
	stha	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	%l7 = 0000b22400000000, Mem[00000000100c1400] = 0000000000000000
	stxa	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000b22400000000
!	Mem[0000000010141404] = 5a000000, %l4 = 0000000000000000
	swap	[%i5+0x004],%l4		! %l4 = 000000005a000000
!	Mem[0000000010141410] = ff000000, %l2 = 0000000000000000
	swapa	[%i5+%o5]0x80,%l2	! %l2 = 00000000ff000000
!	Mem[0000000010181410] = 27010000, %l1 = 000000000000005a
	ldstuba	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ffffffff, %l3 = 0000000000000000
	lduha	[%i4+%o4]0x80,%l3	! %l3 = 000000000000ffff

p0_label_489:
!	Mem[0000000010101408] = 00000000ffffffff, %l7 = 0000b22400000000
	ldxa	[%i4+%o4]0x88,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000010041410] = 000000ffffff0000, %l7 = 00000000ffffffff
	ldxa	[%i1+%o5]0x80,%l7	! %l7 = 000000ffffff0000
	membar	#Sync			! Added by membar checker (74)
!	Mem[0000000010001434] = ffffffff, %l6 = 0000000000000000
	lduwa	[%i0+0x034]%asi,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000010081400] = 00000000, %l6 = 00000000ffffffff
	ldsha	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041408] = 00000000ff0000ff, %l2 = 00000000ff000000
	ldxa	[%i1+%o4]0x88,%l2	! %l2 = 00000000ff0000ff
!	Mem[00000000300c1408] = 00000000 00000000, %l4 = 5a000000, %l5 = 000000ff
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010141400] = 000000ff, %l7 = 000000ffffff0000
	lduba	[%i5+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081434] = ffffffff, %l2 = 00000000ff0000ff
	ldsb	[%i2+0x036],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010101408] = ffffffff, %l0 = 0000000000000000
	ldsba	[%i4+0x008]%asi,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f26 = 0000005a, Mem[0000000010001400] = f5004bff
	sta	%f26,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000005a

p0_label_490:
!	%l0 = ffffffffffffffff, Mem[0000000010141400] = 000000ff
	stha	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000ffff
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010041410] = 000000ff ffff0000
	stda	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000 000000ff
!	%f16 = 00000000 00000000 0000ffff ff000000
!	%f20 = 0000005a 000000ff 0000ffff db0dffff
!	%f24 = ae00747d 00000000 0000005a ffffffff
!	%f28 = 0000b224 00000000 ff000000 ffb2ff5a
	stda	%f16,[%i6]ASI_BLK_AIUS	! Block Store to 0000000030181400
!	%l2 = ffffffffffffffff, Mem[0000000010081408] = 0000000000000000
	stxa	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffffffffffffff
!	%f6  = 00000000 00000000, Mem[00000000100c1408] = 00000000 0000ffff
	stda	%f6 ,[%i3+0x008]%asi	! Mem[00000000100c1408] = 00000000 00000000
!	%f8  = 5a1deda8 ff000de1, %l4 = 0000000000000000
!	Mem[0000000010081430] = 0000005affffffff
	add	%i2,0x030,%g1
	stda	%f8,[%g1+%l4]ASI_PST32_P ! Mem[0000000010081430] = 0000005affffffff
!	Mem[0000000010041410] = 00000000, %l4 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000
!	%f1  = 00000000, Mem[0000000030181400] = 00000000
	sta	%f1 ,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	%l6 = 0000000000000000, Mem[0000000030181408] = 0000ffff
	stwa	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 5a7bff5f00000000, %l4 = 0000000000000000
	ldxa	[%i4+%g0]0x81,%l4	! %l4 = 5a7bff5f00000000

p0_label_491:
!	Mem[00000000211c0000] = 00ff3487, %l1 = 0000000000000000
	ldsb	[%o2+%g0],%l1		! %l1 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l1 = 0000000000000000
	lduha	[%i1+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041408] = ff0000ff, %l3 = 000000000000ffff
	lduwa	[%i1+%o4]0x88,%l3	! %l3 = 00000000ff0000ff
!	Mem[0000000030001408] = 00000000, %l2 = ffffffffffffffff
	ldsha	[%i0+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l3 = 00000000ff0000ff
	ldsba	[%i0+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101410] = 00000000ff000000, %f8  = 5a1deda8 ff000de1
	ldda	[%i4+%o5]0x89,%f8 	! %f8  = 00000000 ff000000
	membar	#Sync			! Added by membar checker (75)
!	Mem[0000000010181408] = ff000000, %l2 = 0000000000000000
	lduba	[%i6+0x00a]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1430] = 0000000000000000, %l0 = ffffffffffffffff
	ldx	[%i3+0x030],%l0		! %l0 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l7 = 00000000000000ff
	ldub	[%i5+0x013],%l7		! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f30 = ff000000, Mem[0000000030081408] = ff0000ff
	sta	%f30,[%i2+%o4]0x81	! Mem[0000000030081408] = ff000000

p0_label_492:
!	%f28 = 0000b224 00000000, Mem[00000000100c1418] = 104b7f63 0000ffff
	std	%f28,[%i3+0x018]	! Mem[00000000100c1418] = 0000b224 00000000
!	%l2 = 0000000000000000, Mem[0000000010141412] = 00000000
	sth	%l2,[%i5+0x012]		! Mem[0000000010141410] = 00000000
!	%l2 = 0000000000000000, Mem[0000000030041400] = 0000000000000000
	stxa	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000000000000000
!	%f12 = 00000000, Mem[0000000010041408] = ff0000ff
	sta	%f12,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	%l5 = 0000000000000000, immd = 0000000000000371, %l2  = 0000000000000000
	mulx	%l5,0x371,%l2		! %l2 = 0000000000000000
!	Mem[0000000030001410] = ffffffff, %l1 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000030001408] = 00000000
	stha	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	%l4 = 5a7bff5f00000000, Mem[0000000030181400] = 00000000
	stba	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010141408] = ff000000 00000000
	stda	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %l3 = 0000000000000000
	ldsba	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000000

p0_label_493:
!	Mem[0000000010101420] = 00000000, %f11 = ff000000
	lda	[%i4+0x020]%asi,%f11	! %f11 = 00000000
!	Mem[0000000010081428] = 00000000 0000ffff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i2+0x028]%asi,%l4	! %l4 = 0000000000000000 000000000000ffff
!	Mem[00000000300c1400] = 000000000000005a, %f2  = 00000000 00000000
	ldda	[%i3+%g0]0x81,%f2 	! %f2  = 00000000 0000005a
!	Mem[0000000010101418] = 00000000 ff000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i4+0x018]%asi,%l2	! %l2 = 0000000000000000 00000000ff000000
!	Mem[0000000010141408] = 00000000, %l5 = 000000000000ffff
	ldswa	[%i5+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000021800080] = 57ff899f, %l4 = 0000000000000000
	ldsb	[%o3+0x081],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000020800000] = 7b5a4ebd, %l3 = 00000000ff000000
	ldub	[%o1+%g0],%l3		! %l3 = 000000000000007b
!	Mem[0000000030141408] = 00000000, %l6 = 0000000000000000
	ldswa	[%i5+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = 5a1deda8ff000de1, %l7 = 0000000000000000
	ldxa	[%i4+%g0]0x80,%l7	! %l7 = 5a1deda8ff000de1
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000007b, Mem[0000000010141408] = 0000000000000000
	stxa	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000000000007b

p0_label_494:
!	%l4 = ffffffffffffffff, Mem[0000000030101400] = 5a7bff5f
	stha	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = ffffff5f
!	%f8  = 00000000 ff000000, %l5 = 0000000000000000
!	Mem[0000000010081410] = 5a7b00000000005a
	add	%i2,0x010,%g1
	stda	%f8,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010081410] = 5a7b00000000005a
!	%f24 = ae00747d 00000000, %l7 = 5a1deda8ff000de1
!	Mem[0000000030141430] = 74ff38d1ffffffff
	add	%i5,0x030,%g1
	stda	%f24,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030141430] = 000038d1ffffffff
!	%l2 = 0000000000000000, Mem[0000000010101410] = 00000000
	stba	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	%f26 = 0000005a ffffffff, Mem[0000000030141410] = 000000ff ffff822e
	stda	%f26,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000005a ffffffff
!	%l6 = 0000000000000000, Mem[00000000201c0000] = f0ff8ea0, %asi = 80
	stba	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ff8ea0
!	Mem[00000000201c0001] = 00ff8ea0, %l6 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 000000ff000000ff
!	%f25 = 00000000, Mem[0000000030101408] = 00000000
	sta	%f25,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	Mem[0000000030181410] = 0000005a, %l4 = ffffffffffffffff
	ldstuba	[%i6+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1420] = 000000ff 00000000, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i3+0x020]%asi,%l0	! %l0 = 00000000000000ff 0000000000000000

p0_label_495:
!	Mem[0000000010181438] = 5a7bb2ff, %l3 = 000000000000007b
	lduha	[%i6+0x03a]%asi,%l3	! %l3 = 000000000000b2ff
!	Mem[00000000201c0000] = 00ff8ea0, %l4 = 0000000000000000
	ldsba	[%o0+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081408] = ff000000, %l0 = 00000000000000ff
	lduba	[%i2+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081400] = 00000000, %l1 = 0000000000000000
	ldsha	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l5 = 0000000000000000
	ldsha	[%i3+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l5 = 0000000000000000
	ldsha	[%i6+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l5 = 0000000000000000
	lduwa	[%i2+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l2 = 0000000000000000
	lduba	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %f2  = 00000000
	lda	[%i3+%o4]0x89,%f2 	! %f2 = 00000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010081418] = 000000000000ffff
	stx	%l1,[%i2+0x018]		! Mem[0000000010081418] = 0000000000000000

p0_label_496:
!	%l0 = 00000000000000ff, Mem[0000000010141410] = 00000000
	stba	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff
!	Mem[0000000010181438] = 5a7bb2ff, %l1 = 00000000, %l4 = 00000000
	add	%i6,0x38,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 000000005a7bb2ff
!	%f14 = ff000000 ffb2ff5a, Mem[0000000030081408] = 000000ff 00000000
	stda	%f14,[%i2+%o4]0x89	! Mem[0000000030081408] = ff000000 ffb2ff5a
!	%l7 = 5a1deda8ff000de1, Mem[00000000300c1410] = 5a000000
	stha	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0de10000
!	%f20 = 0000005a 000000ff, Mem[0000000010001408] = 00000000 00000000
	stda	%f20,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000005a 000000ff
!	%l7 = 5a1deda8ff000de1, Mem[0000000010001438] = 0000000000000000, %asi = 80
	stxa	%l7,[%i0+0x038]%asi	! Mem[0000000010001438] = 5a1deda8ff000de1
!	%f12 = 00000000 00000000, Mem[0000000010181400] = ff000000 00000000
	stda	%f12,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 00000000
!	%l1 = 0000000000000000, Mem[0000000010101428] = db0d00ff
	stw	%l1,[%i4+0x028]		! Mem[0000000010101428] = 00000000
!	%l3 = 000000000000b2ff, Mem[0000000030041410] = 0000000000000000
	stxa	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000000000b2ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 0de10000, %l4 = 000000005a7bb2ff
	lduha	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000de1

p0_label_497:
!	Mem[00000000201c0000] = 00ff8ea0, %l7 = 5a1deda8ff000de1
	ldsba	[%o0+0x000]%asi,%l7	! %l7 = 0000000000000000
!	%l2 = 0000000000000000, imm = ffffffffffffffd7, %l2 = 0000000000000000
	sub	%l2,-0x029,%l2		! %l2 = 0000000000000029
	membar	#Sync			! Added by membar checker (76)
!	Mem[0000000010181400] = 00000000 00000000 ff000000 00000000
!	Mem[0000000010181410] = ff000127 00000000 00000000 00ff0000
!	Mem[0000000010181420] = ff000000 00fff2ff ff000000 618efb7f
!	Mem[0000000010181430] = 000080ff 000000ff 5a7bb2ff 0000000e
	ldda	[%i6]ASI_BLK_AIUP,%f16	! Block Load from 0000000010181400
!	Mem[0000000010101410] = 00000000 00000000, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010081400] = 00000000, %f5  = ffffffff
	lda	[%i2+%g0]0x88,%f5 	! %f5 = 00000000
!	Mem[0000000030101400] = ffffff5f, %l3 = 000000000000b2ff
	lduwa	[%i4+%g0]0x81,%l3	! %l3 = 00000000ffffff5f
!	Mem[0000000010041400] = 5a000000, %l5 = 0000000000000000
	ldsba	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081408] = ff000000 ffb2ff5a, %l4 = 00000de1, %l5 = 00000000
	ldda	[%i2+%o4]0x89,%l4	! %l4 = 00000000ffb2ff5a 00000000ff000000
!	Mem[0000000030141410] = 5a000000, %l4 = 00000000ffb2ff5a
	lduba	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f4  = 000000ff 00000000, Mem[0000000010101410] = 00000000 00000000
	stda	%f4 ,[%i4+0x010]%asi	! Mem[0000000010101410] = 000000ff 00000000

p0_label_498:
!	%l3 = 00000000ffffff5f, Mem[0000000030181400] = 00000000
	stha	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000ff5f
!	%l3 = 00000000ffffff5f, %l0 = 0000000000000000, %l1 = 0000000000000000
	xor	%l3,%l0,%l1		! %l1 = 00000000ffffff5f
	membar	#Sync			! Added by membar checker (77)
!	%l4 = 0000000000000000, Mem[0000000010181408] = 000000ff
	stwa	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	%f2  = 00000000 0000005a, Mem[0000000010141438] = ff000000 ffb2ff5a
	stda	%f2 ,[%i5+0x038]%asi	! Mem[0000000010141438] = 00000000 0000005a
!	Mem[00000000100c1438] = ff8e0000, %l0 = 00000000, %l3 = ffffff5f
	add	%i3,0x38,%g1
	casa	[%g1]0x80,%l0,%l3	! %l3 = 00000000ff8e0000
!	Mem[00000000100c1408] = 00000000, %l7 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181400] = 5fff0000, %l1 = 00000000ffffff5f
	ldstuba	[%i6+%g0]0x81,%l1	! %l1 = 0000005f000000ff
!	Mem[0000000010141408] = 00000000, %l1 = 000000000000005f
	swapa	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000000
!	%f10 = 0000ffff 00000000, %l7 = 0000000000000000
!	Mem[0000000010001418] = ae00747d00b200ff
	add	%i0,0x018,%g1
	stda	%f10,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010001418] = ae00747d00b200ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000, %l4 = 0000000000000000
	ldsha	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000000

p0_label_499:
!	Mem[0000000010081400] = 00000000, %l6 = 00000000000000ff
	lduba	[%i2+0x001]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000020800040] = 0000c0bd, %l4 = 0000000000000000
	ldsb	[%o1+0x040],%l4		! %l4 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %f14 = ff000000
	lda	[%i2+%g0]0x80,%f14	! %f14 = 00000000
!	Mem[0000000010181410] = ff000127, %l4 = 0000000000000000
	lduha	[%i6+%o5]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[00000000201c0000] = 00ff8ea0, %l4 = 000000000000ff00
	lduba	[%o0+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101400] = ffffff5f 00000000 00000000 00000000
!	Mem[0000000030101410] = 000000ff 00000000 00000000 00000000
!	Mem[0000000030101420] = 03f2ff00 cd659a95 7ffb8e61 7b68038d
!	Mem[0000000030101430] = 00000000 00000000 ff000000 000000ff
	ldda	[%i4]ASI_BLK_S,%f0	! Block Load from 0000000030101400
!	Mem[0000000010041424] = ffff0000, %l3 = 00000000ff8e0000
	ldswa	[%i1+0x024]%asi,%l3	! %l3 = ffffffffffff0000
!	Mem[0000000010081404] = 000000ff, %l6 = 0000000000000000
	lduh	[%i2+0x006],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030141410] = 0000005affffffff, %f28 = 000080ff 000000ff
	ldda	[%i5+%o5]0x81,%f28	! %f28 = 0000005a ffffffff
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffff0000, Mem[0000000010141400] = ffff000000000000
	stx	%l3,[%i5+%g0]		! Mem[0000000010141400] = ffffffffffff0000

p0_label_500:
!	%l2 = 00000029, %l3 = ffff0000, Mem[0000000010001408] = 000000ff 0000005a
	stda	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000029 ffff0000
!	Mem[0000000010181408] = 00000000, %l6 = 00000000000000ff
	swapa	[%i6+%o4]0x88,%l6	! %l6 = 0000000000000000
	membar	#Sync			! Added by membar checker (78)
!	%f22 = 00000000 00ff0000, %l0 = 0000000000000000
!	Mem[0000000030101420] = 03f2ff00cd659a95
	add	%i4,0x020,%g1
	stda	%f22,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030101420] = 03f2ff00cd659a95
!	Mem[0000000030081408] = 5affb2ff, %l7 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l7	! %l7 = 0000005a000000ff
!	%f12 = 00000000, Mem[000000001004143c] = 00000000
	st	%f12,[%i1+0x03c]	! Mem[000000001004143c] = 00000000
!	%l2 = 0000000000000029, %l6 = 0000000000000000, %l3 = ffffffffffff0000
	andn	%l2,%l6,%l3		! %l3 = 0000000000000029
!	Mem[0000000030141408] = 00000000, %l5 = 00000000ff000000
	ldstuba	[%i5+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%f30 = 5a7bb2ff 0000000e, %l5 = 0000000000000000
!	Mem[0000000030081420] = ff000000ff000000
	add	%i2,0x020,%g1
	stda	%f30,[%g1+%l5]ASI_PST32_S ! Mem[0000000030081420] = ff000000ff000000
!	%f21 = 00000000, Mem[000000001000142c] = 00800000
	sta	%f21,[%i0+0x02c]%asi	! Mem[000000001000142c] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00000000 00000000, %l2 = 00000029, %l3 = 00000029
	ldda	[%i4+%o4]0x81,%l2	! %l2 = 0000000000000000 0000000000000000

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	nop
	fmuls	%f19,%f23,%f19
	fadds	%f29,%f23,%f7
	ldsha	[%i0+0x016]%asi,%l0
	sub	%l2,0x54b,%l0
	sub	%l4,%l3,%l5
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
	cmp	%l1,%g2			! %l1 should be 0000000000000000
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
	cmp	%l6,%g2			! %l6 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 000000000000005a
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check Floating Point Registers

p0_check_fp_registers:
	set	p0_expected_fp_regs,%g3
	std	%f0,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x00],%l0
	cmp	%l0,%l1			! %f0  should be ffffff5f 00000000
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00000000 00000000
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 000000ff 00000000
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 00000000 00000000
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 03f2ff00 cd659a95
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 7ffb8e61 7b68038d
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 00000000 00000000
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be ff000000 000000ff
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00000000 00000000
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be ff000000 00000000
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be ff000127 00000000
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 00000000 00ff0000
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be ff000000 00fff2ff
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be ff000000 618efb7f
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 0000005a ffffffff
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 5a7bb2ff 0000000e
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
	sub	%l7,%l7,%l0
	fadds	%f10,%f15,%f14
	subc	%l3,0x5e3,%l4
	xor	%l5,%l3,%l5
	xor	%l3,0x8ec,%l5
	udivx	%l2,%l3,%l2
	addc	%l4,-0x949,%l3
	done

p0_trap1o:
	sub	%l7,%l7,%l0
	fadds	%f10,%f15,%f14
	subc	%l3,0x5e3,%l4
	xor	%l5,%l3,%l5
	xor	%l3,0x8ec,%l5
	udivx	%l2,%l3,%l2
	addc	%l4,-0x949,%l3
	done


p0_trap2e:
	stwa	%l5,[%i6+%o4]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010181408]
	fmuls	%f0 ,%f15,%f14
	and	%l3,0xda8,%l4
	xnor	%l3,0x37f,%l1
	udivx	%l6,-0x552,%l0
	done

p0_trap2o:
	stwa	%l5,[%o6+%i4]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010181408]
	fmuls	%f0 ,%f15,%f14
	and	%l3,0xda8,%l4
	xnor	%l3,0x37f,%l1
	udivx	%l6,-0x552,%l0
	done


p0_trap3e:
	xor	%l6,0x771,%l5
	xnor	%l7,0x013,%l7
	addc	%l5,%l6,%l7
	orn	%l3,%l3,%l6
	andn	%l6,%l7,%l2
	done

p0_trap3o:
	xor	%l6,0x771,%l5
	xnor	%l7,0x013,%l7
	addc	%l5,%l6,%l7
	orn	%l3,%l3,%l6
	andn	%l6,%l7,%l2
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
	ldx	[%g1+0x000],%l0		! %l0 = f4bc3e19e50d1e7a
	ldx	[%g1+0x008],%l1		! %l1 = 3f84da0eec4329bf
	ldx	[%g1+0x010],%l2		! %l2 = 27e2476aa012cf1e
	ldx	[%g1+0x018],%l3		! %l3 = 27788fb478a50f5e
	ldx	[%g1+0x020],%l4		! %l4 = 212e445675ea3b53
	ldx	[%g1+0x028],%l5		! %l5 = 153b09787f1003db
	ldx	[%g1+0x030],%l6		! %l6 = 06f94fc7d14627ad
	ldx	[%g1+0x038],%l7		! %l7 = 287b9dda6c7d152c

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
	sub	%l7,%l7,%l0
	fadds	%f10,%f15,%f14
	subc	%l3,0x5e3,%l4
	xor	%l5,%l3,%l5
	xor	%l3,0x8ec,%l5
	jmpl	%o7,%g0
	udivx	%l2,%l3,%l2
p0_near_0_he:
	stx	%l0,[%i0+0x010]		! Mem[0000000010001410]
	mulx	%l5,%l1,%l6
	subc	%l5,%l7,%l7
	xnor	%l1,%l2,%l6
	jmpl	%o7,%g0
	mulx	%l1,%l3,%l2
near0_b2b_h:
	and	%l5,0x5a3,%l1
	umul	%l2,%l4,%l2
	sub	%l0,-0x1e5,%l6
	andn	%l6,%l4,%l4
	subc	%l4,%l7,%l0
	xor	%l4,%l0,%l7
	fcmps	%fcc3,%f18,%f26
	jmpl	%o7,%g0
	xnor	%l3,0x1ce,%l2
near0_b2b_l:
	xnor	%l0,%l2,%l3
	andn	%l1,%l3,%l6
	subc	%l1,-0x9f2,%l4
	fdivs	%f15,%f14,%f0 
	subc	%l7,%l2,%l0
	mulx	%l5,-0x764,%l2
	fmuls	%f14,%f7 ,%f5 
	jmpl	%o7,%g0
	andn	%l0,%l3,%l1
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	fdivs	%f14,%f9 ,%f12
	sub	%l2,0x709,%l3
	jmpl	%o7,%g0
	fcmps	%fcc2,%f13,%f6 
p0_near_1_he:
	smul	%l2,-0x980,%l6
	subc	%l2,%l2,%l3
	sdivx	%l4,-0x3ca,%l2
	orn	%l6,%l0,%l4
	andn	%l6,-0x10e,%l4
	sdivx	%l2,%l1,%l2
	jmpl	%o7,%g0
	fsubs	%f19,%f18,%f20
near1_b2b_h:
	smul	%l1,%l3,%l7
	orn	%l0,%l3,%l3
	fcmps	%fcc3,%f20,%f22
	xor	%l5,-0x9a4,%l3
	jmpl	%o7,%g0
	fsubs	%f16,%f31,%f16
near1_b2b_l:
	xor	%l0,0x7c7,%l5
	fmuls	%f3 ,%f4 ,%f5 
	xor	%l0,%l5,%l7
	mulx	%l1,%l3,%l6
	jmpl	%o7,%g0
	mulx	%l5,%l2,%l4
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	fcmps	%fcc3,%f4 ,%f4 
	ld	[%i1+0x030],%f1 	! Mem[0000000010041430]
	subc	%l1,%l0,%l1
	jmpl	%o7,%g0
	orn	%l0,%l7,%l4
p0_near_2_he:
	and	%l3,-0xd99,%l5
	jmpl	%o7,%g0
	ldsw	[%i3+0x008],%l2		! Mem[00000000100c1408]
near2_b2b_h:
	add	%l2,-0x571,%l0
	umul	%l6,%l5,%l1
	xnor	%l1,0x5e6,%l7
	addc	%l2,-0x031,%l1
	fmuls	%f28,%f24,%f27
	jmpl	%o7,%g0
	sdivx	%l1,-0x844,%l3
near2_b2b_l:
	addc	%l1,0xc72,%l6
	sub	%l1,-0xc06,%l5
	andn	%l0,%l3,%l6
	addc	%l0,%l3,%l0
	addc	%l4,%l0,%l2
	jmpl	%o7,%g0
	xor	%l0,%l2,%l2
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	or	%l7,-0x771,%l0
	and	%l6,-0x9e2,%l5
	smul	%l5,%l7,%l3
	jmpl	%o7,%g0
	ld	[%i3+0x010],%f7 	! Mem[00000000100c1410]
p0_near_3_he:
	fadds	%f20,%f19,%f27
	fadds	%f26,%f27,%f20
	andn	%l2,%l5,%l3
	fcmps	%fcc3,%f25,%f21
	xnor	%l2,%l4,%l3
	sth	%l0,[%i3+0x00c]		! Mem[00000000100c140c]
	jmpl	%o7,%g0
	fsubs	%f28,%f29,%f29
near3_b2b_h:
	jmpl	%o7,%g0
	fdtos	%f28,%f17
	jmpl	%o7,%g0
	nop
near3_b2b_l:
	jmpl	%o7,%g0
	umul	%l3,-0x4a2,%l4
	jmpl	%o7,%g0
	nop
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	fsqrts	%f2 ,%f3 
	fmuls	%f15,%f9 ,%f0 
	fdivs	%f11,%f4 ,%f1 
	jmpl	%o7,%g0
	xnor	%l6,%l3,%l4
p0_far_0_lem:
	fsqrts	%f2 ,%f3 
	fmuls	%f15,%f9 ,%f0 
	fdivs	%f11,%f4 ,%f1 
	jmpl	%o7,%g0
	xnor	%l6,%l3,%l4
p0_far_0_he:
	subc	%l2,%l2,%l7
	jmpl	%o7,%g0
	fcmps	%fcc2,%f26,%f26
p0_far_0_hem:
	subc	%l2,%l2,%l7
	jmpl	%o7,%g0
	fcmps	%fcc2,%f26,%f26
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	fcmps	%fcc1,%f20,%f19
	fsubs	%f30,%f21,%f31
	fadds	%f22,%f29,%f31
	and	%l6,-0x760,%l2
	andn	%l2,0xa6a,%l0
	mulx	%l7,%l0,%l3
	jmpl	%o7,%g0
	umul	%l7,%l7,%l7
far0_b2b_l:
	xnor	%l0,%l4,%l2
	andn	%l1,0x40e,%l3
	udivx	%l0,%l0,%l2
	fsqrts	%f4 ,%f8 
	add	%l4,-0xb6c,%l6
	andn	%l0,%l3,%l6
	jmpl	%o7,%g0
	xnor	%l5,-0x196,%l0
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	std	%f2 ,[%i5+0x030]	! Mem[0000000010141430]
	add	%l6,0x8b2,%l3
	umul	%l4,0x271,%l3
	udivx	%l1,%l0,%l3
	sub	%l0,0xf4e,%l6
	jmpl	%o7,%g0
	subc	%l7,0xe4c,%l1
p0_far_1_lem:
	membar	#Sync
	std	%f2 ,[%i5+0x030]	! Mem[0000000010141430]
	add	%l6,0x8b2,%l3
	umul	%l4,0x271,%l3
	udivx	%l1,%l0,%l3
	sub	%l0,0xf4e,%l6
	jmpl	%o7,%g0
	subc	%l7,0xe4c,%l1
p0_far_1_he:
	smul	%l6,%l1,%l1
	sdivx	%l1,0xea8,%l1
	jmpl	%o7,%g0
	and	%l7,%l0,%l1
p0_far_1_hem:
	smul	%l6,%l1,%l1
	sdivx	%l1,0xea8,%l1
	jmpl	%o7,%g0
	and	%l7,%l0,%l1
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	sdivx	%l1,-0xca8,%l1
	jmpl	%o7,%g0
	fadds	%f19,%f29,%f20
far1_b2b_l:
	fmuls	%f13,%f15,%f3 
	jmpl	%o7,%g0
	fmuls	%f6 ,%f2 ,%f7 
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	std	%f10,[%i2+0x010]	! Mem[0000000010081410]
	orn	%l3,%l5,%l5
	jmpl	%o7,%g0
	smul	%l2,%l0,%l3
p0_far_2_lem:
	membar	#Sync
	std	%f10,[%i2+0x010]	! Mem[0000000010081410]
	orn	%l3,%l5,%l5
	jmpl	%o7,%g0
	smul	%l2,%l0,%l3
p0_far_2_he:
	xnor	%l0,-0xf0f,%l1
	stb	%l0,[%i2+0x005]		! Mem[0000000010081405]
	andn	%l1,-0xa56,%l1
	fsubs	%f20,%f20,%f22
	fsqrts	%f22,%f25
	jmpl	%o7,%g0
	and	%l1,0x8ed,%l1
p0_far_2_hem:
	xnor	%l0,-0xf0f,%l1
	membar	#Sync
	stb	%l0,[%i2+0x005]		! Mem[0000000010081405]
	andn	%l1,-0xa56,%l1
	fsubs	%f20,%f20,%f22
	fsqrts	%f22,%f25
	jmpl	%o7,%g0
	and	%l1,0x8ed,%l1
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	mulx	%l0,%l1,%l6
	jmpl	%o7,%g0
	and	%l0,0xeb2,%l0
far2_b2b_l:
	mulx	%l1,0xe94,%l6
	jmpl	%o7,%g0
	smul	%l0,-0x250,%l7
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	fsubs	%f8 ,%f2 ,%f7 
	mulx	%l4,-0x671,%l6
	jmpl	%o7,%g0
	and	%l2,0x82e,%l0
p0_far_3_lem:
	fsubs	%f8 ,%f2 ,%f7 
	mulx	%l4,-0x671,%l6
	jmpl	%o7,%g0
	and	%l2,0x82e,%l0
p0_far_3_he:
	fdivs	%f25,%f18,%f18
	jmpl	%o7,%g0
	fmuls	%f31,%f19,%f28
p0_far_3_hem:
	fdivs	%f25,%f18,%f18
	jmpl	%o7,%g0
	fmuls	%f31,%f19,%f28
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	sub	%l1,%l0,%l2
	fadds	%f27,%f18,%f28
	jmpl	%o7,%g0
	fcmps	%fcc3,%f27,%f22
far3_b2b_l:
	or	%l0,%l1,%l0
	sdivx	%l6,-0xe0c,%l5
	jmpl	%o7,%g0
	fcmps	%fcc0,%f9 ,%f4 
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	sdivx	%l7,%l7,%l0
	smul	%l6,0xcdf,%l2
	add	%l5,0x1f3,%l5
	sub	%l7,%l0,%l6
	fsubs	%f3 ,%f8 ,%f15
	jmpl	%g6+8,%g0
	mulx	%l1,-0x179,%l7
p0_call_0_le:
	fcmps	%fcc0,%f14,%f8 
	andn	%l2,%l5,%l6
	fsubs	%f11,%f8 ,%f9 
	subc	%l6,%l7,%l7
	fdtos	%f6 ,%f6 
	retl
	xor	%l6,%l0,%l3
p0_jmpl_0_lo:
	sdivx	%l7,%l7,%l0
	smul	%l6,0xcdf,%l2
	add	%l5,0x1f3,%l5
	sub	%l7,%l0,%l6
	fsubs	%f3 ,%f8 ,%f15
	jmpl	%g6+8,%g0
	mulx	%l1,-0x179,%l7
p0_call_0_lo:
	fcmps	%fcc0,%f14,%f8 
	andn	%l2,%l5,%l6
	fsubs	%f11,%f8 ,%f9 
	subc	%l6,%l7,%l7
	fdtos	%f6 ,%f6 
	retl
	xor	%l6,%l0,%l3
p0_jmpl_0_he:
	sub	%l6,0x287,%l2
	umul	%l2,0x401,%l1
	fdivs	%f29,%f30,%f17
	subc	%l6,%l1,%l6
	xor	%l1,0x366,%l3
	fsubs	%f22,%f23,%f17
	fsubs	%f25,%f31,%f29
	jmpl	%g6+8,%g0
	fsqrts	%f18,%f26
p0_call_0_he:
	xor	%l7,%l5,%l2
	andn	%l0,%l5,%l6
	xnor	%l4,-0x950,%l5
	or	%l4,%l6,%l3
	fstod	%f19,%f18
	fcmps	%fcc1,%f26,%f27
	retl
	smul	%l3,%l5,%l4
p0_jmpl_0_ho:
	sub	%l6,0x287,%l2
	umul	%l2,0x401,%l1
	fdivs	%f29,%f30,%f17
	subc	%l6,%l1,%l6
	xor	%l1,0x366,%l3
	fsubs	%f22,%f23,%f17
	fsubs	%f25,%f31,%f29
	jmpl	%g6+8,%g0
	fsqrts	%f18,%f26
p0_call_0_ho:
	xor	%l7,%l5,%l2
	andn	%l0,%l5,%l6
	xnor	%l4,-0x950,%l5
	or	%l4,%l6,%l3
	fstod	%f19,%f18
	fcmps	%fcc1,%f26,%f27
	retl
	smul	%l3,%l5,%l4
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	fadds	%f1 ,%f7 ,%f13
	mulx	%l3,%l0,%l2
	sdivx	%l3,%l6,%l0
	jmpl	%g6+8,%g0
	andn	%l1,0x63a,%l4
p0_call_1_le:
	orn	%l5,%l5,%l5
	or	%l6,-0x27b,%l7
	smul	%l5,%l1,%l0
	add	%l7,%l2,%l1
	addc	%l6,%l0,%l6
	smul	%l4,-0x645,%l0
	retl
	sub	%l7,0x9f5,%l6
p0_jmpl_1_lo:
	fadds	%f1 ,%f7 ,%f13
	mulx	%l3,%l0,%l2
	sdivx	%l3,%l6,%l0
	jmpl	%g6+8,%g0
	andn	%l1,0x63a,%l4
p0_call_1_lo:
	orn	%l5,%l5,%l5
	or	%l6,-0x27b,%l7
	smul	%l5,%l1,%l0
	add	%l7,%l2,%l1
	addc	%l6,%l0,%l6
	smul	%l4,-0x645,%l0
	retl
	sub	%l7,0x9f5,%l6
p0_jmpl_1_he:
	andn	%l2,0xf35,%l3
	fsqrts	%f29,%f25
	orn	%l0,%l2,%l1
	jmpl	%g6+8,%g0
	sdivx	%l0,%l4,%l0
p0_call_1_he:
	or	%l5,%l1,%l1
	mulx	%l5,-0x9d0,%l0
	fdivs	%f25,%f19,%f23
	ldstub	[%o0+0x001],%l5		! Mem[00000000201c0001]
	ldd	[%i0+0x008],%l6		! Mem[0000000010001408]
	addc	%l1,-0x488,%l2
	retl
	udivx	%l2,%l6,%l3
p0_jmpl_1_ho:
	andn	%l2,0xf35,%l3
	fsqrts	%f29,%f25
	orn	%l0,%l2,%l1
	jmpl	%g6+8,%g0
	sdivx	%l0,%l4,%l0
p0_call_1_ho:
	or	%l5,%l1,%l1
	mulx	%l5,-0x9d0,%l0
	fdivs	%f25,%f19,%f23
	ldstub	[%i0+0x001],%l5		! Mem[00000000201c0001]
	ldd	[%o0+0x008],%l6		! Mem[0000000010001408]
	addc	%l1,-0x488,%l2
	retl
	udivx	%l2,%l6,%l3
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	jmpl	%g6+8,%g0
	add	%l2,%l2,%l7
p0_call_2_le:
	fadds	%f12,%f11,%f9 
	smul	%l0,%l7,%l2
	sub	%l6,-0x0ff,%l0
	umul	%l7,%l3,%l1
	retl
	sub	%l2,0x3f7,%l2
p0_jmpl_2_lo:
	jmpl	%g6+8,%g0
	add	%l2,%l2,%l7
p0_call_2_lo:
	fadds	%f12,%f11,%f9 
	smul	%l0,%l7,%l2
	sub	%l6,-0x0ff,%l0
	umul	%l7,%l3,%l1
	retl
	sub	%l2,0x3f7,%l2
p0_jmpl_2_he:
	nop
	fmuls	%f24,%f18,%f24
	sub	%l7,%l2,%l5
	subc	%l2,-0x56b,%l2
	smul	%l0,%l4,%l4
	jmpl	%g6+8,%g0
	fdivs	%f19,%f25,%f26
p0_call_2_he:
	fsubs	%f28,%f25,%f27
	and	%l2,%l6,%l1
	xnor	%l4,%l3,%l4
	xnor	%l6,-0x5c2,%l2
	mulx	%l6,%l4,%l2
	retl
	subc	%l1,%l4,%l3
p0_jmpl_2_ho:
	nop
	fmuls	%f24,%f18,%f24
	sub	%l7,%l2,%l5
	subc	%l2,-0x56b,%l2
	smul	%l0,%l4,%l4
	jmpl	%g6+8,%g0
	fdivs	%f19,%f25,%f26
p0_call_2_ho:
	fsubs	%f28,%f25,%f27
	and	%l2,%l6,%l1
	xnor	%l4,%l3,%l4
	xnor	%l6,-0x5c2,%l2
	mulx	%l6,%l4,%l2
	retl
	subc	%l1,%l4,%l3
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	and	%l1,-0x21c,%l4
	udivx	%l3,0x60f,%l7
	fadds	%f13,%f7 ,%f11
	subc	%l4,-0x846,%l2
	xor	%l7,%l5,%l6
	jmpl	%g6+8,%g0
	smul	%l2,%l7,%l3
p0_call_3_le:
	retl
	mulx	%l1,0xf1c,%l7
p0_jmpl_3_lo:
	and	%l1,-0x21c,%l4
	udivx	%l3,0x60f,%l7
	fadds	%f13,%f7 ,%f11
	subc	%l4,-0x846,%l2
	xor	%l7,%l5,%l6
	jmpl	%g6+8,%g0
	smul	%l2,%l7,%l3
p0_call_3_lo:
	retl
	mulx	%l1,0xf1c,%l7
p0_jmpl_3_he:
	smul	%l7,-0x436,%l4
	addc	%l3,%l5,%l5
	fcmps	%fcc3,%f30,%f29
	jmpl	%g6+8,%g0
	smul	%l1,%l0,%l5
p0_call_3_he:
	udivx	%l5,%l7,%l0
	nop
	mulx	%l5,%l7,%l4
	or	%l4,%l7,%l5
	fadds	%f18,%f25,%f17
	udivx	%l7,%l3,%l3
	retl
	subc	%l6,%l4,%l0
p0_jmpl_3_ho:
	smul	%l7,-0x436,%l4
	addc	%l3,%l5,%l5
	fcmps	%fcc3,%f30,%f29
	jmpl	%g6+8,%g0
	smul	%l1,%l0,%l5
p0_call_3_ho:
	udivx	%l5,%l7,%l0
	nop
	mulx	%l5,%l7,%l4
	or	%l4,%l7,%l5
	fadds	%f18,%f25,%f17
	udivx	%l7,%l3,%l3
	retl
	subc	%l6,%l4,%l0
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
	.word	0xf4bc3e19,0xe50d1e7a		! Init value for %l0
	.word	0x3f84da0e,0xec4329bf		! Init value for %l1
	.word	0x27e2476a,0xa012cf1e		! Init value for %l2
	.word	0x27788fb4,0x78a50f5e		! Init value for %l3
	.word	0x212e4456,0x75ea3b53		! Init value for %l4
	.word	0x153b0978,0x7f1003db		! Init value for %l5
	.word	0x06f94fc7,0xd14627ad		! Init value for %l6
	.word	0x287b9dda,0x6c7d152c		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xf39cc6a7,0x48be2c46		! Init value for %f0 
	.word	0xfc85f6c1,0xb6dc03f7		! Init value for %f2 
	.word	0x1d640593,0xa043c46b		! Init value for %f4 
	.word	0x51c08f46,0xa5d58f41		! Init value for %f6 
	.word	0x1d9baa08,0x5cf0920f		! Init value for %f8 
	.word	0x526dbf34,0x9b6c8902		! Init value for %f10
	.word	0x28a23c66,0x21448ed6		! Init value for %f12
	.word	0xcf7c6fb2,0xd13860b0		! Init value for %f14
	.word	0x320dd6bd,0x35125a58		! Init value for %f16
	.word	0x4730ebb1,0x7033a5bf		! Init value for %f18
	.word	0xa6559a15,0x80cf29f1		! Init value for %f20
	.word	0x0cdd5841,0x8827ff8b		! Init value for %f22
	.word	0xd5c1bffc,0x143c9bf7		! Init value for %f24
	.word	0x15134c3f,0x84fc0eca		! Init value for %f26
	.word	0x7f9c730e,0xea39e015		! Init value for %f28
	.word	0x6c21f9a6,0xdb7bb23b		! Init value for %f30
	.word	0x5bfa5bfd,0x159710e1		! Init value for %f32
	.word	0x54bf3ce2,0x49e9e232		! Init value for %f34
	.word	0x138ca10a,0x417d0552		! Init value for %f36
	.word	0xec757c55,0x8e9bb5b5		! Init value for %f38
	.word	0x831e9dd8,0x223f3cc2		! Init value for %f40
	.word	0x5b6c53c6,0x728d3a1d		! Init value for %f42
	.word	0xc9768f0d,0x4830f175		! Init value for %f44
	.word	0xf42cde79,0xe1df1896		! Init value for %f46
	.word	0xb616c703,0xbaef6524
	.word	0x0aabf357,0xcdafb45c
	.word	0xbd4130f9,0xb87caf0d
	.word	0xc6fab30c,0xe965c640
	.word	0xbb81774f,0x3c8348bc
	.word	0xe6c4e8ce,0xea74aac9
	.word	0x5cd0f3ec,0x8cb748ef
	.word	0xec1c9baf,0x01c384fb
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
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x0000005a
p0_expected_fp_regs:
	.word	0xffffff5f,0x00000000
	.word	0x00000000,0x00000000
	.word	0x000000ff,0x00000000
	.word	0x00000000,0x00000000
	.word	0x03f2ff00,0xcd659a95
	.word	0x7ffb8e61,0x7b68038d
	.word	0x00000000,0x00000000
	.word	0xff000000,0x000000ff
	.word	0x00000000,0x00000000
	.word	0xff000000,0x00000000
	.word	0xff000127,0x00000000
	.word	0x00000000,0x00ff0000
	.word	0xff000000,0x00fff2ff
	.word	0xff000000,0x618efb7f
	.word	0x0000005a,0xffffffff
	.word	0x5a7bb2ff,0x0000000e
	.word	0x00000007,0x00000c00		! %fsr = 0000000700000c00
p0_local0_expect:
	.word	0x5a000000,0x00000000
	.word	0x29000000,0x0000ffff
	.word	0x00000000,0x00000000
	.word	0xae00747d,0x00b200ff
	.word	0x00ff0000,0x00ff0000
	.word	0xff000000,0x00000000
	.word	0x74ff38d1,0xffffffff
	.word	0x5a1deda8,0xff000de1
p0_local0_sec_expect:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xff000000
	.word	0x00000000,0x00000000
	.word	0xe10d00ff,0xa8ed1d5a
	.word	0x000000ff,0xffff0000
	.word	0x00000000,0x00000000
	.word	0x5affb2ff,0x000000ff
p0_local1_expect:
	.word	0x0000005a,0x000000ff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0xff000000,0x00000000
	.word	0xdb0dffff,0xffff0000
	.word	0x00000000,0xffff0ddb
	.word	0xff99543b,0x8941ffd4
	.word	0x0000ffff,0x00000000
p0_local1_sec_expect:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xffb20000,0x00000000
	.word	0x00000000,0xffffffff
	.word	0xff000000,0x000000ff
	.word	0x00000000,0x00000000
	.word	0x00000000,0xff000000
	.word	0x00000000,0x000000ff
p0_local2_expect:
	.word	0x00000000,0x000000ff
	.word	0xffffffff,0xffffffff
	.word	0x5a7b0000,0x0000005a
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x0000ffff
	.word	0x0000005a,0xffffffff
	.word	0x00000003,0x000000ff
p0_local2_sec_expect:
	.word	0xff000000,0x00000000
	.word	0xffffb2ff,0x000000ff
	.word	0x00000000,0x00000000
	.word	0xff00b200,0x7d7400ae
	.word	0xff000000,0xff000000
	.word	0xff000000,0xffffffff
	.word	0xffffffff,0xd138ff74
	.word	0xf2000000,0x000080ff
p0_local3_expect:
	.word	0x00000000,0x24b20000
	.word	0x00000000,0x00000000
	.word	0x000000ff,0xd1000000
	.word	0x0000b224,0x00000000
	.word	0x000000ff,0x00000000
	.word	0x00000000,0xdb0dffff
	.word	0x00000000,0x00000000
	.word	0xff8e0000,0xffffffff
p0_local3_sec_expect:
	.word	0x00000000,0x0000005a
	.word	0x00000000,0x00000000
	.word	0x0de10000,0x00000000
	.word	0xffffffff,0x7d7400ae
	.word	0x000080ff,0x000000ff
	.word	0x000000ff,0x8a000000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x0000ff00
p0_local4_expect:
	.word	0x5a1deda8,0xff000de1
	.word	0xffffffff,0x00000000
	.word	0x000000ff,0x00000000
	.word	0x00000000,0xff000000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x00000000
	.word	0xd4ff4189,0xff0000ff
	.word	0x104b7f63,0x822ee1af
p0_local4_sec_expect:
	.word	0xffffff5f,0x00000000
	.word	0x00000000,0x00000000
	.word	0x000000ff,0x00000000
	.word	0x00000000,0x00000000
	.word	0x03f2ff00,0xcd659a95
	.word	0x7ffb8e61,0x7b68038d
	.word	0x00000000,0x00000000
	.word	0xff000000,0x000000ff
p0_local5_expect:
	.word	0xffffffff,0xffff0000
	.word	0x0000005f,0x0000007b
	.word	0xff000000,0x00000000
	.word	0x0000ffff,0x00000000
	.word	0xae00747d,0x5fff7b5a
	.word	0x0000005a,0xffffffff
	.word	0x0000b224,0x00000000
	.word	0x00000000,0x0000005a
p0_local5_sec_expect:
	.word	0x0000ffff,0xff000000
	.word	0xff000000,0x0000005a
	.word	0x0000005a,0xffffffff
	.word	0x00000000,0x24b20000
	.word	0x74ff38d1,0xffffffff
	.word	0x00000147,0x000000ff
	.word	0x000038d1,0xffffffff
	.word	0x00000000,0x7b68038d
p0_local6_expect:
	.word	0x00000000,0x00000000
	.word	0xff000000,0x00000000
	.word	0xff000127,0x00000000
	.word	0x00000000,0x00ff0000
	.word	0xff000000,0x00fff2ff
	.word	0xff000000,0x618efb7f
	.word	0x000080ff,0x000000ff
	.word	0x5a7bb2ff,0x0000000e
p0_local6_sec_expect:
	.word	0xffff0000,0x00000000
	.word	0x00000000,0xff000000
	.word	0xff00005a,0x000000ff
	.word	0x0000ffff,0xdb0dffff
	.word	0xae00747d,0x00000000
	.word	0x0000005a,0xffffffff
	.word	0x0000b224,0x00000000
	.word	0xff000000,0xffb2ff5a
share0_expect:
	.word	0x00ff8ea0,0xc1b535a2
	.word	0x86c62819,0x580aa8c1
	.word	0x448853b0,0x53b67a16
	.word	0x09985da4,0x1df4ebbe
	.word	0x7e199df5,0x437a3516
	.word	0x73f8fb9b,0xb0fcc8be
	.word	0xa3581d1a,0xb71edaa4
	.word	0xe255968f,0x33400933
share1_expect:
	.word	0x7b5a4ebd,0xb5d635df
	.word	0xb3187e3b,0x318fd87d
	.word	0x763ee133,0x0330665d
	.word	0x8a808a2f,0x3f415d65
	.word	0xad0a74a9,0xcfa5343d
	.word	0x1261a226,0x03d33813
	.word	0xc6ba2547,0x29b15e34
	.word	0xda6ccbad,0xddff9246
	.word	0x0000c0bd,0xbb92dae0
	.word	0x61735d06,0x67fc58e3
	.word	0xacd21011,0x7a89a692
	.word	0x7c4841dc,0x1daf88e5
	.word	0xe1272ff3,0x42c32e89
	.word	0x7c12283d,0x6487ea1a
	.word	0x4a99f873,0x7ea727fb
	.word	0x066c5336,0x90a3932a
share2_expect:
	.word	0x00ff3487,0x9415896b
	.word	0x11507647,0x4efa1287
	.word	0x76b4c0af,0x64fd1499
	.word	0xa6188311,0x50fa38b0
	.word	0xf24d7f00,0x1a91809e
	.word	0x763793b5,0x7c99ece3
	.word	0xb46406c8,0x0574d448
	.word	0x5d82f960,0xc2299272
share3_expect:
	.word	0x0000133c,0x01cec5d4
	.word	0x04fdf3ac,0xc45ae17c
	.word	0x736184f5,0xb2f97a06
	.word	0xb76010b4,0xce7abd0b
	.word	0x0dee9ccf,0xb12807d3
	.word	0x40df2462,0xb07e0aec
	.word	0xcbb265d4,0x713b0529
	.word	0x190e20c6,0x0c692bdb
	.word	0x00ffd078,0x2d281fe5
	.word	0x49906c6c,0x253ecf1f
	.word	0x805047b8,0xbcdbfe28
	.word	0x1e4e3ddb,0xec248a61
	.word	0x72b8609c,0xf296932e
	.word	0x9f5c224a,0xe5666029
	.word	0xbe6a326e,0x99ad1f33
	.word	0xcf48786d,0xa2e76016
	.word	0x57ff899f,0x070fccaa
	.word	0x3002b9de,0xd766678c
	.word	0x2dd6806f,0xa1c35ae2
	.word	0xac1486c7,0x86546955
	.word	0xde2657d8,0x07f8a4c3
	.word	0x4a377d3e,0xc81b36c2
	.word	0x74eda31f,0x0bbf9861
	.word	0x0d383b64,0x91f00fd2
	.word	0x00005cf4,0x35d0a92e
	.word	0x379b70c7,0x10b126c8
	.word	0xa34f186f,0xcde1ed01
	.word	0x9ae9648e,0x141a053b
	.word	0x2a61fd7b,0xfa5f710a
	.word	0x358d14ea,0x93653466
	.word	0xf6a627e1,0xac88d936
	.word	0x26e10da0,0xfacaa0e9
	.word	0xffff0b85,0xf2665c46
	.word	0xefde1453,0xc604e903
	.word	0xf0074eb8,0x51e7ea59
	.word	0xcd261ffb,0x98f3f5ae
	.word	0x099c3812,0xd459a4b0
	.word	0x8cc51fa4,0x398ff7e6
	.word	0xac42ce9e,0x6e8363eb
	.word	0x601d05a5,0x3b479732
	.word	0xffffcf8d,0x165a21f7
	.word	0xb3bb05c6,0xf95fda62
	.word	0x4512475e,0xa68181a6
	.word	0xbe8a71f0,0x7f1ad610
	.word	0xe178872c,0x125abc20
	.word	0xf92943d7,0xc6eceed5
	.word	0x0b958803,0x5dd1df94
	.word	0x69cc79d6,0xfe0484b2
	.word	0xffff6a7f,0xfe556963
	.word	0x7def6b83,0xa5d50c04
	.word	0x6d2d5521,0xffe932fc
	.word	0x18e5425e,0xd9f5e415
	.word	0x49aaedcd,0x62c94c1a
	.word	0xe2cf567b,0x8c38f079
	.word	0x8612fc91,0x98c56306
	.word	0x84cae394,0x9e7fc0ea
	.word	0x006708e2,0x492534d8
	.word	0x5068edb2,0xd3c0fa28
	.word	0x67d5ae67,0x7f549e66
	.word	0x4b69ad50,0x7669a310
	.word	0x68fa0590,0xe104dde1
	.word	0xd437c29b,0xbf79d9aa
	.word	0x0fa4f4a8,0x81017173
	.word	0xf2ab9309,0x642d6d8f
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
	.word	0x3562279f,0xfa9d3fa8
	.word	0x00000000,0x00000002
	.word	0x8a4f1540,0x12863295
	.word	0x00000000,0x00000003
	.word	0x457d7348,0x50a86e44
	.word	0x00000000,0x00000004
	.word	0x7f05e35f,0xe918b14e
	.word	0x00000000,0x00000005
	.word	0x57222667,0xb780cfa4
	.word	0x00000000,0x00000006
	.word	0xdb714d1f,0xb90c9dae
	.word	0x00000000,0x00000007
	.word	0x1e17d500,0x47b4d7a3
	.word	0x00000000,0x00000008
	.word	0xd5e19580,0x172750b6
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
	.word	0xe61d4863,0xcf50c6c1,0x1064f45d,0x2add9ada
	.word	0xed0fb761,0xa3cf7064,0x27f3d76f,0xcb41d47d
	.word	0xfee5a1b1,0x799cea8f,0x3c66070d,0x91164b9a
	.word	0xfdbaf665,0x2344132e,0x1c00aafc,0xfefb7d50
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
	.word	0x8019c7db,0x4fd4f8f9,0x4f747b78,0x02823364
	.word	0x83bc2e9a,0xe5842e71,0xd980725c,0x8fb2181f
	.word	0x7fe4967b,0xb3a3d9aa,0x268d7c0a,0x096cf5c2
	.word	0xe5fd8817,0xf7f898a4,0x987eb9ad,0x0850b773
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
	.word	0x710f2865,0xe8de7ee1,0xb81e0a20,0x611418b8
	.word	0x43f784ad,0x11540e05,0x9d6528b7,0x5cff8198
	.word	0x387dd853,0x9cce4dba,0x60e82507,0x0113c6ed
	.word	0xf5d2b1cd,0x29d07932,0xdd54aa25,0x8c8b1aa3
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
	.word	0xdc4d9892,0x1b3e5408,0xf08a6cea,0xe30ab76d
	.word	0xed6d96c9,0x533cf321,0xf817b397,0xad28d8f2
	.word	0x181f6e9c,0xb969f168,0x4050e94a,0x123ff582
	.word	0x03a88ce6,0xa3f233f2,0xdfef325a,0xa44bd095
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
	.word	0xd63af139,0x2c88777f,0xfde3373e,0x50157c5b
	.word	0xc5c917bf,0xba7de628,0x4a9f9776,0xf4826b60
	.word	0xbada2108,0xc791c515,0x26ea8c9d,0x3f44c0c9
	.word	0xbefd4d0d,0x8b21c72e,0x0097d890,0x13288134
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
	.word	0x4a8af402,0x2b6b46ed,0xfcc2a29f,0x57b22d28
	.word	0x387a3665,0xc9f84194,0x9a00902c,0xe3d1c24d
	.word	0xd8dc1efd,0x281cfb46,0x87f1cf5a,0x70e7e1de
	.word	0xfeecab0b,0x75eab7ef,0xaed73071,0x52db89e5
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
	.word	0xfe3c6016,0x9079fa93,0x5428b6db,0xa8089df4
	.word	0xa558beed,0x8d03687b,0xf92b3efd,0x99b049cd
	.word	0x9c18380b,0x139f6fd6,0x0d329602,0x4fd833cd
	.word	0x2a763b21,0x07001d69,0xa6fb99df,0xdb4a3c25
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
	.word	0x16e64821,0x0a8f6c0a,0xc45cdc55,0x56b9e2dd
	.word	0x1bb1f387,0x6813263b,0x3ef0d581,0xa668d2ff
	.word	0x7099543b,0x968f5ab2,0xfddf580a,0xdc69950b
	.word	0x518be99b,0x51f5d93e,0x38233502,0x425adacf
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
	.word	0xb05098fc,0x890974e1,0x2f681558,0x0ec79893
	.word	0xe7a9f897,0x16e5f923,0x36897d76,0xa6e1c885
	.word	0xbb36e8b8,0x1959968f,0x86497216,0xcc7f972e
	.word	0xa8899f0e,0xcbfa3a6b,0x5d9e1bcf,0x5a7f9f74
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
	.word	0xc9179df4,0xc13a041d,0xb950c154,0x0cb7790b
	.word	0xb5c6ff1f,0x24b25d04,0x04ab8e31,0x1d4201a7
	.word	0xafe103e1,0x2bb9970c,0xb02b9bb0,0x2edfd309
	.word	0xae22a1a6,0x5b4b93ef,0xfc3f840f,0x990336e2
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
	.word	0x34999519,0x9f18e0cf,0xf75236f0,0x0cbeddd8
	.word	0x8b1b8869,0x02c7b506,0x15ac4e47,0x9913b744
	.word	0x600125e4,0xcae1d280,0x905f0c6b,0xb8be5233
	.word	0x70d3875f,0x13e2f1c8,0x24943b85,0xb7730672
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
	.word	0x1ced8689,0xccfc322b,0xc97943fc,0x25dcf2ea
	.word	0x27b7eca1,0xc010e87f,0xa273f99d,0xe26de830
	.word	0x988f2635,0xf25ad536,0x4ea0423b,0x7acaff72
	.word	0x0866580b,0xce1b4408,0x368035e4,0x2226720f
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
	.word	0x2173b11c,0x71170288,0x4e65fcfe,0x1aba6efd
	.word	0x08adeaa2,0x062b6287,0x83cf7f40,0x2e8ea061
	.word	0xfbe685a9,0x662e6156,0x2e824d80,0xdc17859e
	.word	0xeec27c83,0x12d66d1b,0xf9137281,0x026c93b5
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
	.word	0x07726d25,0x5fb15375,0x9d1fe08f,0x830600c3
	.word	0x2b9ea6ee,0xecbfc551,0x69792ca2,0xaf6f6e64
	.word	0xd23ee889,0x32e1f2cf,0xa63a50c3,0xea9c1a94
	.word	0xc0362ad4,0xb81aa06d,0x9ba34e9a,0x95e36bd2
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
	.word	0x4b868ea0,0xc1b535a2,0x86c62819,0x580aa8c1
	.word	0x448853b0,0x53b67a16,0x09985da4,0x1df4ebbe
	.word	0x7e199df5,0x437a3516,0x73f8fb9b,0xb0fcc8be
	.word	0xa3581d1a,0xb71edaa4,0xe255968f,0x33400933
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
	.word	0x8b9f4ebd,0xb5d635df,0xb3187e3b,0x318fd87d
	.word	0x763ee133,0x0330665d,0x8a808a2f,0x3f415d65
	.word	0xad0a74a9,0xcfa5343d,0x1261a226,0x03d33813
	.word	0xc6ba2547,0x29b15e34,0xda6ccbad,0xddff9246
	.word	0xc385c0bd,0xbb92dae0,0x61735d06,0x67fc58e3
	.word	0xacd21011,0x7a89a692,0x7c4841dc,0x1daf88e5
	.word	0xe1272ff3,0x42c32e89,0x7c12283d,0x6487ea1a
	.word	0x4a99f873,0x7ea727fb,0x066c5336,0x90a3932a
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
	.word	0xf2ae3487,0x9415896b,0x11507647,0x4efa1287
	.word	0x76b4c0af,0x64fd1499,0xa6188311,0x50fa38b0
	.word	0xf24d7f00,0x1a91809e,0x763793b5,0x7c99ece3
	.word	0xb46406c8,0x0574d448,0x5d82f960,0xc2299272
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
	.word	0x46b9133c,0x01cec5d4,0x04fdf3ac,0xc45ae17c
	.word	0x736184f5,0xb2f97a06,0xb76010b4,0xce7abd0b
	.word	0x0dee9ccf,0xb12807d3,0x40df2462,0xb07e0aec
	.word	0xcbb265d4,0x713b0529,0x190e20c6,0x0c692bdb
	.word	0x217dd078,0x2d281fe5,0x49906c6c,0x253ecf1f
	.word	0x805047b8,0xbcdbfe28,0x1e4e3ddb,0xec248a61
	.word	0x72b8609c,0xf296932e,0x9f5c224a,0xe5666029
	.word	0xbe6a326e,0x99ad1f33,0xcf48786d,0xa2e76016
	.word	0x5724899f,0x070fccaa,0x3002b9de,0xd766678c
	.word	0x2dd6806f,0xa1c35ae2,0xac1486c7,0x86546955
	.word	0xde2657d8,0x07f8a4c3,0x4a377d3e,0xc81b36c2
	.word	0x74eda31f,0x0bbf9861,0x0d383b64,0x91f00fd2
	.word	0xf3df5cf4,0x35d0a92e,0x379b70c7,0x10b126c8
	.word	0xa34f186f,0xcde1ed01,0x9ae9648e,0x141a053b
	.word	0x2a61fd7b,0xfa5f710a,0x358d14ea,0x93653466
	.word	0xf6a627e1,0xac88d936,0x26e10da0,0xfacaa0e9
	.word	0x06900b85,0xf2665c46,0xefde1453,0xc604e903
	.word	0xf0074eb8,0x51e7ea59,0xcd261ffb,0x98f3f5ae
	.word	0x099c3812,0xd459a4b0,0x8cc51fa4,0x398ff7e6
	.word	0xac42ce9e,0x6e8363eb,0x601d05a5,0x3b479732
	.word	0xad23cf8d,0x165a21f7,0xb3bb05c6,0xf95fda62
	.word	0x4512475e,0xa68181a6,0xbe8a71f0,0x7f1ad610
	.word	0xe178872c,0x125abc20,0xf92943d7,0xc6eceed5
	.word	0x0b958803,0x5dd1df94,0x69cc79d6,0xfe0484b2
	.word	0x28046a7f,0xfe556963,0x7def6b83,0xa5d50c04
	.word	0x6d2d5521,0xffe932fc,0x18e5425e,0xd9f5e415
	.word	0x49aaedcd,0x62c94c1a,0xe2cf567b,0x8c38f079
	.word	0x8612fc91,0x98c56306,0x84cae394,0x9e7fc0ea
	.word	0x890808e2,0x492534d8,0x5068edb2,0xd3c0fa28
	.word	0x67d5ae67,0x7f549e66,0x4b69ad50,0x7669a310
	.word	0x68fa0590,0xe104dde1,0xd437c29b,0xbf79d9aa
	.word	0x0fa4f4a8,0x81017173,0xf2ab9309,0x642d6d8f
share3_end:
