/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_1500_17.s
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
!	Seed = 626121616
!	Riesling can be on
!	1 Thread, 1500 lines
!	mpgen   created on May 4, 2009 (15:17:56), Version 2.81
!	mpgen_1500_17.s created on Jun 26, 2009 (12:16:16)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.090504 -rc random.rc -o mpgen_1500_17 -p 1 -l 1500

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
!	%f0  = 469bd418 42c694c9 14eeb016 34536a0f
!	%f4  = 4ce52c84 5e6e5805 37e230e2 1db7f82b
!	%f8  = 2f9600b0 3bdf5001 00921b6e 09fa3107
!	%f12 = 78841c9c 038898bd 738f9bba 74bb10a3
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 79ff0c48 4d540e39 3b439dc6 3e3c52ff
!	%f20 = 5cfc1bb4 2aa24c75 1c7acd92 063c741b
!	%f24 = 170256e0 2106af71 20b1971e 4d92aff7
!	%f28 = 53d689cc 71c3532d 6220266a 1a8b0293
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 1ee74078 4a0513a9 25866776 1c0227ef
!	%f36 = 5878c6e4 37df8ce5 2db80642 07419c0b
!	%f40 = 42912910 00091ae1 74e86ece 2c9b9ae7
!	%f44 = 31a432fc 3056d99d 37b6cd1a 7ec72083
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x8bd5293700000059,%g7,%g1 ! %gsr scale = 11, align = 1
	wr	%g1,%g0,%gsr		! %gsr = 8bd5293700000059

	wr	%g0,%y			! Clear %y register
	xorcc	%g0,%g0,%g3		! %g3 = 0, %ccr = 44
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Starting 10 instruction Store Burst
!	%l7 = 6bb56df630efff23, Mem[0000000010001410] = 0dcf5144
	stba	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = 23cf5144
!	%f30 = 6220266a 1a8b0293, Mem[0000000010001420] = 2a024170 7c5b15c1, %asi = 80
	stda	%f30,[%i0+0x020]%asi	! Mem[0000000010001420] = 6220266a 1a8b0293
!	%f3  = 34536a0f, Mem[0000000030001408] = 86ec3f11
	sta	%f3 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 34536a0f
!	%l0 = be6f187431e92ba6, %l3 = cb849291d2916f57, %y  = 00000000
	umul	%l0,%l3,%l2		! %l2 = 290da094f530cf6a, %y = 290da094
!	%l6 = 47a649840e1c5d98, Mem[0000000030181408] = 65e758c6
	stwa	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 0e1c5d98
!	Mem[0000000030141400] = 0ea47ae8, %l2 = 290da094f530cf6a
	ldstuba	[%i5+%g0]0x81,%l2	! %l2 = 000000000000000e
!	%l3 = cb849291d2916f57, imm = fffffffffffff27b, %l4 = bdc0d049be0a90b2
	orn	%l3,-0xd85,%l4		! %l4 = cb849291d2916fd7
!	%f10 = 00921b6e 09fa3107, Mem[0000000030001400] = 3c2bc508 1fe36bf9
	stda	%f10,[%i0+%g0]0x81	! Mem[0000000030001400] = 00921b6e 09fa3107
!	%l1 = 7383e792a5c707d1, Mem[0000000010041400] = 1555e938
	stwa	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = a5c707d1
!	%f22 = 1c7acd92 063c741b, Mem[0000000010181438] = 420566ba 6abecfa3
	std	%f22,[%i6+0x038]	! Mem[0000000010181438] = 1c7acd92 063c741b

p0_label_2:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081424] = 7d579b81, %f25 = 2106af71
	lda	[%i2+0x024]%asi,%f25	! %f25 = 7d579b81
!	Code Fragment 4, seed = 921716
p0_fragment_1:
!	%l0 = be6f187431e92ba6
	setx	0x4697112d5245a886,%g7,%l0 ! %l0 = 4697112d5245a886
!	%l1 = 7383e792a5c707d1
	setx	0x9d23d1ce6ee46eb1,%g7,%l1 ! %l1 = 9d23d1ce6ee46eb1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4697112d5245a886
	setx	0xbd9a1c586563f8ec,%g7,%l0 ! %l0 = bd9a1c586563f8ec
!	%l1 = 9d23d1ce6ee46eb1
	setx	0xe9f8a0e232464a37,%g7,%l1 ! %l1 = e9f8a0e232464a37
p0_fragment_1_end:
!	Mem[0000000030181410] = b4ee2e55, %l4 = cb849291d2916fd7
	ldsba	[%i6+%o5]0x89,%l4	! %l4 = 0000000000000055
!	Mem[00000000100c1418] = 2e2fbbc2 324b0b8b, %l4 = 00000055, %l5 = 1fd94f1d
	ldd	[%i3+0x018],%l4		! %l4 = 000000002e2fbbc2 00000000324b0b8b
!	Code Fragment 4, seed = 480379
p0_fragment_2:
!	%l0 = bd9a1c586563f8ec
	setx	0xf29d235b9c413f4e,%g7,%l0 ! %l0 = f29d235b9c413f4e
!	%l1 = e9f8a0e232464a37
	setx	0x915ba1eef0e9eaf9,%g7,%l1 ! %l1 = 915ba1eef0e9eaf9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f29d235b9c413f4e
	setx	0xb4a3de3dd35c62b4,%g7,%l0 ! %l0 = b4a3de3dd35c62b4
!	%l1 = 915ba1eef0e9eaf9
	setx	0x4768bcddf66c297f,%g7,%l1 ! %l1 = 4768bcddf66c297f
p0_fragment_2_end:
!	Mem[00000000100c1400] = 448451f83c94ef29, %f22 = 1c7acd92 063c741b
	ldda	[%i3+%g0]0x80,%f22	! %f22 = 448451f8 3c94ef29
!	Mem[0000000010001408] = d68ea12e, %l0 = b4a3de3dd35c62b4
	ldsha	[%i0+%o4]0x88,%l0	! %l0 = ffffffffffffa12e
!	Mem[0000000030101408] = 3f26e92d 06cad14d, %l6 = 0e1c5d98, %l7 = 30efff23
	ldda	[%i4+%o4]0x89,%l6	! %l6 = 0000000006cad14d 000000003f26e92d
!	Mem[0000000010001410] = 23cf5144, %l3 = cb849291d2916f57
	ldsha	[%i0+%o5]0x80,%l3	! %l3 = 00000000000023cf
!	%l6 = 0000000006cad14d, imm = fffffffffffffd34, %l5 = 00000000324b0b8b
	and	%l6,-0x2cc,%l5		! %l5 = 0000000006cad104

p0_label_3:
!	Starting 10 instruction Store Burst
!	%l7 = 000000003f26e92d, Mem[0000000030081410] = 34055e2b
	stba	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 34055e2d
!	%l5 = 0000000006cad104, Mem[0000000030001410] = 781f3074
	stba	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = 041f3074
!	Mem[000000001018143c] = 063c741b, %l4 = 000000002e2fbbc2
	ldstuba	[%i6+0x03c]%asi,%l4	! %l4 = 0000000000000006
!	%l3 = 00000000000023cf, Mem[0000000030041408] = 222d3be679f6249f
	stxa	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000000023cf
!	%f22 = 448451f8 3c94ef29, Mem[0000000010141400] = b87a326f e9fcf94d
	stda	%f22,[%i5+%g0]0x88	! Mem[0000000010141400] = 448451f8 3c94ef29
!	%f14 = 738f9bba, Mem[0000000010001408] = 2ea18ed6
	st	%f14,[%i0+%o4]		! Mem[0000000010001408] = 738f9bba
!	%l5 = 0000000006cad104, Mem[0000000030141410] = 544c344c
	stba	%l5,[%i5+%o5]0x89	! Mem[0000000030141410] = 544c3404
!	%l6 = 0000000006cad14d, immd = 0000000000000216, %l2  = 000000000000000e
	mulx	%l6,0x216,%l2		! %l2 = 0000000e2b10969e
!	Mem[0000000010081410] = 59253604, %l2 = 0000000e2b10969e
	ldstuba	[%i2+0x010]%asi,%l2	! %l2 = 0000000000000059
!	Mem[0000000010101418] = 5f8dc122, %l5 = 0000000006cad104
	swap	[%i4+0x018],%l5		! %l5 = 000000005f8dc122

p0_label_4:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 738f9bba294095cf, %l3 = 00000000000023cf
	ldx	[%i0+%o4],%l3		! %l3 = 738f9bba294095cf
!	Mem[0000000030081410] = 2d5e0534, %l1 = 4768bcddf66c297f
	lduba	[%i2+%o5]0x81,%l1	! %l1 = 000000000000002d
!	Mem[00000000100c1410] = 46d49064, %l0 = ffffffffffffa12e
	lduwa	[%i3+%o5]0x80,%l0	! %l0 = 0000000046d49064
!	Mem[0000000010141410] = 3f741524, %l1 = 000000000000002d
	ldsha	[%i5+%o5]0x80,%l1	! %l1 = 0000000000003f74
!	Mem[0000000030001400] = 6e1b9200, %l0 = 0000000046d49064
	ldswa	[%i0+%g0]0x89,%l0	! %l0 = 000000006e1b9200
!	Mem[0000000030141408] = 484cd966 7df6dc1f, %l6 = 06cad14d, %l7 = 3f26e92d
	ldda	[%i5+%o4]0x81,%l6	! %l6 = 00000000484cd966 000000007df6dc1f
!	%f25 = 7d579b81, %f27 = 4d92aff7
	fsqrts	%f25,%f27		! %f27 = 5e6aefef
!	Mem[0000000030181408] = 985d1c0e, %l0 = 000000006e1b9200
	lduwa	[%i6+%o4]0x89,%l0	! %l0 = 00000000985d1c0e
!	%o2 = deadbeefdeadbeef
	set	share2_start,%o2	! set %o2[0] to VA
!	Mem[00000000211c0000] = 4cfc2808, %l0 = 00000000985d1c0e
	lduh	[%o2+%g0],%l0		! %l0 = 0000000000004cfc
!	Mem[0000000010101428] = 2a659fae149ffc47, %f10 = 00921b6e 09fa3107
	ldd	[%i4+0x028],%f10	! %f10 = 2a659fae 149ffc47

p0_label_5:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 6e1b9200, %l7 = 000000007df6dc1f
	swapa	[%i0+%g0]0x89,%l7	! %l7 = 000000006e1b9200
!	%f12 = 78841c9c 038898bd, %l4 = 0000000000000006
!	Mem[0000000030141400] = ffa47ae8207e1e59
	stda	%f12,[%i5+%l4]ASI_PST32_S ! Mem[0000000030141400] = 78841c9c207e1e59
!	%f4  = 4ce52c84 5e6e5805, Mem[0000000030101400] = 8876743d 7967ac0f
	stda	%f4 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 4ce52c84 5e6e5805
!	Mem[0000000010181400] = 1877356a, %l0 = 0000000000004cfc
	swapa	[%i6+%g0]0x88,%l0	! %l0 = 000000001877356a
!	%l7 = 000000006e1b9200, Mem[00000000100c1438] = 31aff29a15a64003
	stx	%l7,[%i3+0x038]		! Mem[00000000100c1438] = 000000006e1b9200
!	Mem[00000000100c1410] = 46d49064, %l7 = 000000006e1b9200
	swapa	[%i3+%o5]0x80,%l7	! %l7 = 0000000046d49064
!	%l5 = 000000005f8dc122, Mem[0000000030141400] = 78841c9c
	stha	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = c1221c9c
!	%l1 = 0000000000003f74, Mem[0000000030041400] = 6809dc67
	stha	%l1,[%i1+%g0]0x89	! Mem[0000000030041400] = 68093f74
!	%l4 = 00000006, %l5 = 5f8dc122, Mem[00000000300c1408] = a62a5e5d 5f205f0c
	stda	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000006 5f8dc122
!	%l3 = 738f9bba294095cf, %l4 = 0000000000000006, %l0 = 000000001877356a
	udivx	%l3,%l4,%l0		! %l0 = 134299f45c356e4d

p0_label_6:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff253604, %l7 = 0000000046d49064
	ldsba	[%i2+%o5]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030141408] = 484cd966, %l7 = ffffffffffffffff
	lduba	[%i5+%o4]0x81,%l7	! %l7 = 0000000000000048
!	Mem[0000000010181434] = 7ca3dfbd, %l4 = 0000000000000006, %asi = 80
	lduwa	[%i6+0x034]%asi,%l4	! %l4 = 000000007ca3dfbd
!	Code Fragment 3, seed = 791255
p0_fragment_3:
!	%l0 = 134299f45c356e4d
	setx	0xd83846ea1174686e,%g7,%l0 ! %l0 = d83846ea1174686e
!	%l1 = 0000000000003f74
	setx	0xfd7f6941bdc34a19,%g7,%l1 ! %l1 = fd7f6941bdc34a19
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d83846ea1174686e
	setx	0x088d96bb0bbe17d4,%g7,%l0 ! %l0 = 088d96bb0bbe17d4
!	%l1 = fd7f6941bdc34a19
	setx	0xe3ecbf86ab1e549f,%g7,%l1 ! %l1 = e3ecbf86ab1e549f
p0_fragment_3_end:
!	Mem[0000000030181400] = 62106f48, %l0 = 088d96bb0bbe17d4
	lduwa	[%i6+%g0]0x81,%l0	! %l0 = 0000000062106f48
!	Mem[00000000100c1422] = 04892a90, %l4 = 000000007ca3dfbd
	lduh	[%i3+0x022],%l4		! %l4 = 0000000000002a90
!	Mem[0000000030141408] = 484cd966, %l4 = 0000000000002a90
	ldsha	[%i5+%o4]0x81,%l4	! %l4 = 000000000000484c
!	Mem[0000000030081410] = f59ffc4d34055e2d, %f18 = 3b439dc6 3e3c52ff
	ldda	[%i2+%o5]0x89,%f18	! %f18 = f59ffc4d 34055e2d
!	Mem[0000000010041400] = a5c707d1, %l7 = 0000000000000048
	ldsba	[%i1+%g0]0x80,%l7	! %l7 = ffffffffffffffa5
!	Mem[0000000010141408] = 1024e3b6, %l3 = 738f9bba294095cf
	ldswa	[%i5+%o4]0x80,%l3	! %l3 = 000000001024e3b6

p0_label_7:
!	Starting 10 instruction Store Burst
!	%l3 = 000000001024e3b6, Mem[0000000010181408] = 7d4cab16
	stba	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = b64cab16
!	%f26 = 20b1971e 5e6aefef, Mem[0000000010141400] = 29ef943c f8518444
	stda	%f26,[%i5+%g0]0x80	! Mem[0000000010141400] = 20b1971e 5e6aefef
!	%l2 = 0000000000000059, %l5 = 000000005f8dc122, %l3 = 000000001024e3b6
	xnor	%l2,%l5,%l3		! %l3 = ffffffffa0723e84
!	%l5 = 000000005f8dc122, Mem[0000000010041428] = 65a9658e68af7ea7, %asi = 80
	stxa	%l5,[%i1+0x028]%asi	! Mem[0000000010041428] = 000000005f8dc122
!	%l3 = ffffffffa0723e84, immd = fffffd96, %y  = 290da094
	smul	%l3,-0x26a,%l4		! %l4 = 000000e6ac351558, %y = 000000e6
!	Mem[0000000030181400] = 62106f48, %l2 = 0000000000000059
	lduwa	[%i6+%g0]0x81,%l2	! %l2 = 0000000062106f48
!	Mem[0000000010181410] = 843f144a, %l7 = ffffffffffffffa5
	ldstuba	[%i6+%o5]0x88,%l7	! %l7 = 000000000000004a
!	Mem[0000000030001408] = 0f6a5334, %l6 = 00000000484cd966
	ldstuba	[%i0+%o4]0x81,%l6	! %l6 = 000000000000000f
!	%l4 = 000000e6ac351558, Mem[00000000100c1408] = 5ff7a4f6
	stha	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 1558a4f6
!	%l2 = 62106f48, %l3 = a0723e84, Mem[0000000010181408] = 16ab4cb6 0f99c025
	stda	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 62106f48 a0723e84

p0_label_8:
!	Starting 10 instruction Load Burst
!	%f10 = 2a659fae, %f5  = 5e6e5805, %f4  = 4ce52c84 5e6e5805
	fsmuld	%f10,%f5 ,%f4 		! %f4  = 412ab92c e47dccc0
!	Mem[0000000010181400] = fc4c0000, %f23 = 3c94ef29
	lda	[%i6+%g0]0x80,%f23	! %f23 = fc4c0000
!	Mem[00000000100c1410] = 00921b6e, %l4 = 000000e6ac351558
	ldsha	[%i3+%o5]0x88,%l4	! %l4 = 0000000000001b6e
!	Mem[0000000030101400] = 05586e5e 842ce54c, %l4 = 00001b6e, %l5 = 5f8dc122
	ldda	[%i4+%g0]0x81,%l4	! %l4 = 0000000005586e5e 00000000842ce54c
!	Mem[0000000010141410] = 25baa7142415743f, %l4 = 0000000005586e5e
	ldxa	[%i5+%o5]0x88,%l4	! %l4 = 25baa7142415743f
!	Mem[0000000010001400] = 3db29cd8, %l3 = ffffffffa0723e84
	lduba	[%i0+%g0]0x80,%l3	! %l3 = 000000000000003d
!	Mem[0000000010081410] = 043625ff, %l2 = 0000000062106f48
	ldsba	[%i2+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030101410] = f4997845, %l0 = 0000000062106f48
	ldswa	[%i4+%o5]0x89,%l0	! %l0 = fffffffff4997845
!	%l3 = 000000000000003d, %l5 = 00000000842ce54c, %l7 = 000000000000004a
	sdivx	%l3,%l5,%l7		! %l7 = 0000000000000000
!	Mem[0000000010001410] = c5f17115 4451cf23, %l2 = ffffffff, %l3 = 0000003d
	ldda	[%i0+%o5]0x88,%l2	! %l2 = 000000004451cf23 00000000c5f17115

p0_label_9:
!	Starting 10 instruction Store Burst
!	%f19 = 34055e2d, %f4  = 412ab92c e47dccc0
	fstox	%f19,%f4 		! %f4  = 00000000 00000000
!	%f24 = 170256e0 7d579b81, Mem[0000000030181408] = 0e1c5d98 224041ff
	stda	%f24,[%i6+%o4]0x81	! Mem[0000000030181408] = 170256e0 7d579b81
!	%f6  = 37e230e2 1db7f82b, Mem[0000000030101410] = f4997845 b5e96838
	stda	%f6 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 37e230e2 1db7f82b
!	Mem[00000000300c1400] = 28622822, %l1 = e3ecbf86ab1e549f
	ldstuba	[%i3+%g0]0x89,%l1	! %l1 = 0000000000000022
!	Mem[0000000030101408] = 4dd1ca06, %l7 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l7	! %l7 = 000000004dd1ca06
!	%f6  = 37e230e2 1db7f82b, %l4 = 25baa7142415743f
!	Mem[0000000010081400] = 342925984a5db049
	stda	%f6,[%i2+%l4]ASI_PST16_PL ! Mem[0000000010081400] = 2bf8b71de230e237
!	%l6 = 000000000000000f, Mem[00000000211c0000] = 4cfc2808, %asi = 80
	stha	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = 000f2808
!	%f10 = 2a659fae 149ffc47, Mem[0000000010101420] = 734202f0 3694e141, %asi = 80
	stda	%f10,[%i4+0x020]%asi	! Mem[0000000010101420] = 2a659fae 149ffc47
!	%l7 = 000000004dd1ca06, Mem[0000000010081408] = 62c22d96
	stha	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = ca062d96
!	Mem[00000000100c1410] = 00921b6e, %l1 = 0000000000000022
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 0000000000921b6e

p0_label_10:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 06000000, %l3 = 00000000c5f17115
	lduha	[%i3+%o4]0x81,%l3	! %l3 = 0000000000000600
!	Mem[0000000010041420] = 4f4149d0 3dcd40a1, %l4 = 2415743f, %l5 = 842ce54c, %asi = 80
	ldda	[%i1+0x020]%asi,%l4	! %l4 = 000000004f4149d0 000000003dcd40a1
!	Mem[0000000010101400] = 586ebf0c, %l2 = 000000004451cf23
	ldsba	[%i4+%g0]0x88,%l2	! %l2 = 000000000000000c
!	Mem[0000000030081410] = f59ffc4d34055e2d, %f0  = 469bd418 42c694c9
	ldda	[%i2+%o5]0x89,%f0 	! %f0  = f59ffc4d 34055e2d
!	Mem[0000000030041410] = d4224f74, %f8  = 2f9600b0
	lda	[%i1+%o5]0x89,%f8 	! %f8 = d4224f74
!	Mem[00000000300c1400] = 99e0f855286228ff, %f0  = f59ffc4d 34055e2d
	ldda	[%i3+%g0]0x89,%f0 	! %f0  = 99e0f855 286228ff
!	Mem[00000000300c1410] = d52c147494d72325, %l4 = 000000004f4149d0
	ldxa	[%i3+%o5]0x89,%l4	! %l4 = d52c147494d72325
!	Mem[0000000030181410] = 552eeeb4, %l2 = 000000000000000c
	ldsba	[%i6+%o5]0x81,%l2	! %l2 = 0000000000000055
!	Mem[0000000030101410] = 1db7f82b, %l2 = 0000000000000055
	lduba	[%i4+%o5]0x89,%l2	! %l2 = 000000000000002b
!	Mem[0000000030081408] = 46fbd959, %l4 = d52c147494d72325
	lduha	[%i2+%o4]0x89,%l4	! %l4 = 000000000000d959

p0_label_11:
!	Starting 10 instruction Store Burst
!	%o1 = deadbeefdeadbeef
	set	share1_start,%o1	! set %o1[0] to VA
!	Mem[0000000020800041] = 2f4b3fd8, %l0 = fffffffff4997845
	ldstub	[%o1+0x041],%l0		! %l0 = 000000000000004b
!	%l1 = 0000000000921b6e, Mem[0000000010141408] = 1024e3b6
	stha	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = 1b6ee3b6
!	Mem[0000000010081404] = e230e237, %l4 = 0000d959, %l1 = 00921b6e
	add	%i2,0x04,%g1
	casa	[%g1]0x80,%l4,%l1	! %l1 = 00000000e230e237
!	%o0 = deadbeefdeadbeef
	set	share0_start,%o0	! set %o0[0] to VA
!	%l6 = 000000000000000f, Mem[00000000201c0000] = 18206378
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 000f6378
!	Mem[0000000010101434] = 74d1edfd, %l5 = 000000003dcd40a1, %asi = 80
	swapa	[%i4+0x034]%asi,%l5	! %l5 = 0000000074d1edfd
!	%l6 = 000000000000000f, Mem[0000000010101408] = 4f2d3754568c107a
	stxa	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000000000000f
!	%l2 = 000000000000002b, Mem[0000000010041408] = 1f582636
	stba	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 2b582636
!	%l6 = 000000000000000f, Mem[0000000010101408] = 0f000000
	stba	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 0f000000
!	%f2  = 14eeb016, %f26 = 20b1971e, %f26 = 20b1971e 5e6aefef
	fsmuld	%f2 ,%f26,%f26		! %f26 = 36c4b294 a1739280
!	%l7 = 000000004dd1ca06, Mem[0000000030181408] = 170256e0
	stha	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = ca0656e0

p0_label_12:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = a4cbc00e, %l0 = 000000000000004b
	lduha	[%i1+%o5]0x88,%l0	! %l0 = 000000000000c00e
!	Mem[0000000010141408] = b6e36e1b, %l1 = 00000000e230e237
	lduha	[%i5+%o4]0x88,%l1	! %l1 = 0000000000006e1b
!	%l1 = 0000000000006e1b, %l2 = 000000000000002b, %l3 = 0000000000000600
	xor	%l1,%l2,%l3		! %l3 = 0000000000006e30
!	Mem[0000000030141408] = 484cd966, %f29 = 71c3532d
	lda	[%i5+%o4]0x81,%f29	! %f29 = 484cd966
!	Mem[0000000010081410] = ff253604, %l7 = 000000004dd1ca06
	ldswa	[%i2+%o5]0x80,%l7	! %l7 = ffffffffff253604
!	Mem[0000000030181408] = e05606ca, %l5 = 0000000074d1edfd
	lduwa	[%i6+%o4]0x89,%l5	! %l5 = 00000000e05606ca
!	Mem[00000000300c1400] = ff28622855f8e099, %l4 = 000000000000d959
	ldxa	[%i3+%g0]0x81,%l4	! %l4 = ff28622855f8e099
!	Mem[00000000100c1400] = 448451f8, %f24 = 170256e0
	lda	[%i3+%g0]0x80,%f24	! %f24 = 448451f8
!	Mem[0000000010181408] = 486f1062, %l2 = 000000000000002b
	lduba	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000048
!	Mem[00000000100c1410] = 00000022, %l4 = ff28622855f8e099
	ldsba	[%i3+%o5]0x88,%l4	! %l4 = 0000000000000022

p0_label_13:
!	Starting 10 instruction Store Burst
!	%f4  = 00000000, Mem[0000000010041404] = 65d8a169
	st	%f4 ,[%i1+0x004]	! Mem[0000000010041404] = 00000000
!	%l3 = 0000000000006e30, Mem[0000000010081408] = 962d06ca
	stba	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 962d0630
!	Mem[0000000030081410] = 2d5e0534, %l7 = 00000000ff253604
	swapa	[%i2+%o5]0x81,%l7	! %l7 = 000000002d5e0534
!	%f14 = 738f9bba 74bb10a3, Mem[00000000100c1408] = 1558a4f6 5389ff6f
	stda	%f14,[%i3+%o4]0x80	! Mem[00000000100c1408] = 738f9bba 74bb10a3
!	%l3 = 0000000000006e30, Mem[0000000010141400] = 1e97b120
	stwa	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = 00006e30
!	%l6 = 000000000000000f, imm = 0000000000000748, %l5 = 00000000e05606ca
	xnor	%l6,0x748,%l5		! %l5 = fffffffffffff8b8
!	%l0 = 000000000000c00e, Mem[0000000030041410] = 744f22d4
	stha	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = c00e22d4
!	Mem[0000000030001408] = 34536aff, %l4 = 0000000000000022
	ldstuba	[%i0+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%l3 = 0000000000006e30, Mem[0000000010081400] = 2bf8b71de230e237, %asi = 80
	stxa	%l3,[%i2+0x000]%asi	! Mem[0000000010081400] = 0000000000006e30
!	%f11 = 149ffc47, Mem[0000000030101408] = 00000000
	sta	%f11,[%i4+%o4]0x81	! Mem[0000000030101408] = 149ffc47

p0_label_14:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 000f6378, %l5 = fffffffffffff8b8, %asi = 80
	lduha	[%o0+0x000]%asi,%l5	! %l5 = 000000000000000f
!	Mem[0000000010041436] = 0508eb5d, %l0 = 000000000000c00e
	ldsh	[%i1+0x036],%l0		! %l0 = ffffffffffffeb5d
!	Mem[0000000030101408] = 149ffc47, %l4 = 00000000000000ff
	lduha	[%i4+%o4]0x81,%l4	! %l4 = 000000000000149f
!	Mem[0000000030041410] = d4220ec0, %l4 = 000000000000149f
	ldsha	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000ec0
!	Mem[0000000010181410] = 843f14ff, %f0  = 99e0f855
	lda	[%i6+%o5]0x88,%f0 	! %f0 = 843f14ff
!	Mem[0000000010001410] = 23cf5144, %f8  = d4224f74
	lda	[%i0+%o5]0x80,%f8 	! %f8 = 23cf5144
!	Mem[0000000010101408] = 0f000000 00000000, %l0 = ffffeb5d, %l1 = 00006e1b
	ldda	[%i4+%o4]0x80,%l0	! %l0 = 000000000f000000 0000000000000000
!	Mem[00000000100c1416] = 25a04065, %l6 = 000000000000000f
	ldsh	[%i3+0x016],%l6		! %l6 = 0000000000004065
!	Mem[000000001000140e] = 294095cf, %l0 = 000000000f000000
	ldsh	[%i0+0x00e],%l0		! %l0 = ffffffffffff95cf
!	Mem[0000000030081408] = 7fcaa07f46fbd959, %f16 = 79ff0c48 4d540e39
	ldda	[%i2+%o4]0x89,%f16	! %f16 = 7fcaa07f 46fbd959

p0_label_15:
!	Starting 10 instruction Store Burst
!	%f6  = 37e230e2, Mem[0000000010041418] = 63570102
	st	%f6 ,[%i1+0x018]	! Mem[0000000010041418] = 37e230e2
!	%l5 = 000000000000000f, Mem[0000000030041408] = 00000000000023cf
	stxa	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000000000000f
!	%f0  = 843f14ff 286228ff, %l3 = 0000000000006e30
!	Mem[0000000030041430] = 59f204ec15996dcd
	add	%i1,0x030,%g1
	stda	%f0,[%g1+%l3]ASI_PST8_S ! Mem[0000000030041430] = 59f214ff15996dcd
!	%l3 = 0000000000006e30, Mem[0000000010041408] = 2b582636
	stha	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = 6e302636
!	%l6 = 0000000000004065, Mem[0000000010001420] = 6220266a, %asi = 80
	stba	%l6,[%i0+0x020]%asi	! Mem[0000000010001420] = 6520266a
!	%l1 = 0000000000000000, Mem[0000000010141410] = 2415743f
	stha	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 24150000
!	%l7 = 000000002d5e0534, Mem[0000000010081400] = 306e000000000000
	stxa	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000002d5e0534
!	Mem[00000000100c1400] = f8518444, %l1 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000044
!	Mem[000000001004143f] = 333d5043, %l2 = 0000000000000048
	ldstub	[%i1+0x03f],%l2		! %l2 = 0000000000000043
!	Mem[0000000030101410] = 1db7f82b, %l2 = 0000000000000043
	swapa	[%i4+%o5]0x89,%l2	! %l2 = 000000001db7f82b

p0_label_16:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101407] = 12765e09, %l3 = 0000000000006e30
	ldub	[%i4+0x007],%l3		! %l3 = 0000000000000009
!	Mem[0000000030041410] = d4220ec0, %l4 = 0000000000000ec0
	ldsha	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000ec0
!	Mem[0000000030001400] = 7df6dc1f, %l4 = 0000000000000ec0
	ldswa	[%i0+%g0]0x89,%l4	! %l4 = 000000007df6dc1f
!	Mem[0000000010181408] = 62106f48, %l5 = 000000000000000f
	lduba	[%i6+%o4]0x88,%l5	! %l5 = 0000000000000048
!	%o3 = deadbeefdeadbeef
	set	share3_start,%o3	! set %o3[0] to VA
!	Mem[00000000218000c0] = 10f7a0c8, %l5 = 0000000000000048, %asi = 80
	lduha	[%o3+0x0c0]%asi,%l5	! %l5 = 00000000000010f7
	membar	#Sync			! Added by membar checker (1)
!	Mem[00000000100c1400] = ff8451f8 3c94ef29 738f9bba 74bb10a3
!	Mem[00000000100c1410] = 22000000 25a04065 2e2fbbc2 324b0b8b
!	Mem[00000000100c1420] = 04892a90 1ff22661 15d01c4e 6bfa2267
!	Mem[00000000100c1430] = 0a8dec7c 64f7bd1d 00000000 6e1b9200
	ldda	[%i3+%g0]ASI_BLK_PL,%f0 	! Block Load from 00000000100c1400
!	Mem[0000000030001400] = 7df6dc1f, %l5 = 00000000000010f7
	lduwa	[%i0+%g0]0x89,%l5	! %l5 = 000000007df6dc1f
!	Mem[00000000211c0001] = 000f2808, %l6 = 0000000000004065, %asi = 80
	ldsba	[%o2+0x001]%asi,%l6	! %l6 = 000000000000000f
!	Mem[00000000201c0000] = 000f6378, %l6 = 000000000000000f, %asi = 80
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 000000000000000f
!	Mem[0000000010041408] = 6e3026363fc6b3af, %l0 = ffffffffffff95cf, %asi = 80
	ldxa	[%i1+0x008]%asi,%l0	! %l0 = 6e3026363fc6b3af

p0_label_17:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000044, Mem[0000000010041408] = 6e302636
	stha	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = 00442636
!	%f1  = f85184ff, Mem[0000000010141408] = b6e36e1b
	sta	%f1 ,[%i5+%o4]0x88	! Mem[0000000010141408] = f85184ff
!	Mem[00000000100c1408] = 738f9bba74bb10a3, %l2 = 000000001db7f82b, %l1 = 0000000000000044
	add	%i3,0x08,%g1
	casxa	[%g1]0x80,%l2,%l1	! %l1 = 738f9bba74bb10a3
!	%l5 = 000000007df6dc1f, Mem[0000000030181410] = 552eeeb46da9f375
	stxa	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000007df6dc1f
!	%l3 = 0000000000000009, Mem[0000000010101400] = 586ebf0c
	stba	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 586ebf09
!	%l0 = 6e3026363fc6b3af, Mem[0000000030101400] = 05586e5e842ce54c
	stxa	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 6e3026363fc6b3af
!	%l7 = 000000002d5e0534, Mem[00000000211c0001] = 000f2808
	stb	%l7,[%o2+0x001]		! Mem[00000000211c0000] = 00342808
!	Mem[00000000211c0001] = 00342808, %l2 = 000000001db7f82b
	ldstuba	[%o2+0x001]%asi,%l2	! %l2 = 0000000000000034
!	%l2 = 00000034, %l3 = 00000009, Mem[0000000010041410] = 0ec0cba4 0a9d86a5
	stda	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000034 00000009
!	Mem[0000000030181400] = 62106f48, %l5 = 000000007df6dc1f
	ldstuba	[%i6+%g0]0x81,%l5	! %l5 = 0000000000000062

p0_label_18:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff286228, %l6 = 000000000000000f
	lduha	[%i3+%g0]0x81,%l6	! %l6 = 000000000000ff28
!	Mem[0000000030081400] = c83d680c, %l5 = 0000000000000062
	lduha	[%i2+%g0]0x89,%l5	! %l5 = 000000000000680c
!	Mem[0000000010001400] = 3db29cd8, %l4 = 000000007df6dc1f
	ldsha	[%i0+%g0]0x80,%l4	! %l4 = 0000000000003db2
!	Mem[0000000020800000] = 201053a8, %l7 = 000000002d5e0534, %asi = 80
	lduha	[%o1+0x000]%asi,%l7	! %l7 = 0000000000002010
!	Mem[0000000010101400] = 586ebf09, %f18 = f59ffc4d
	lda	[%i4+%g0]0x88,%f18	! %f18 = 586ebf09
!	Mem[0000000030081408] = 59d9fb46, %l1 = 738f9bba74bb10a3
	ldsha	[%i2+%o4]0x81,%l1	! %l1 = 00000000000059d9
!	Mem[0000000010181414] = 67d93f05, %l3 = 0000000000000009
	ldsw	[%i6+0x014],%l3		! %l3 = 0000000067d93f05
!	Mem[0000000030101408] = 47fc9f14, %l3 = 0000000067d93f05
	lduha	[%i4+%o4]0x89,%l3	! %l3 = 0000000000009f14
!	Mem[0000000010041410] = 34000000, %l3 = 0000000000009f14
	lduwa	[%i1+%o5]0x88,%l3	! %l3 = 0000000034000000
!	Mem[0000000030081410] = ff2536044dfc9ff5, %l5 = 000000000000680c
	ldxa	[%i2+%o5]0x81,%l5	! %l5 = ff2536044dfc9ff5

p0_label_19:
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = 00ff2808, %l7 = 0000000000002010
	ldstub	[%o2+%g0],%l7		! %l7 = 0000000000000000
!	%f13 = 7cec8d0a, %f27 = a1739280, %f16 = 7fcaa07f 46fbd959
	fsmuld	%f13,%f27,%f16		! %f16 = c3dc2227 e6872000
!	%l1 = 00000000000059d9, Mem[0000000020800040] = 2fff3fd8
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040] = 59d93fd8
!	Mem[0000000030141410] = 04344c54, %l6 = 000000000000ff28
	ldstuba	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000004
!	%f10 = 6722fa6b 4e1cd015, Mem[0000000010181400] = 00004cfc c9cb171d
	stda	%f10,[%i6+%g0]0x88	! Mem[0000000010181400] = 6722fa6b 4e1cd015
!	%l5 = ff2536044dfc9ff5, immd = fffff8c8, %y  = 000000e6
	smul	%l5,-0x738,%l7		! %l7 = fffffdcd085d4f68, %y = fffffdcd
!	%l5 = ff2536044dfc9ff5, Mem[000000001018140a] = 486f1062, %asi = 80
	stba	%l5,[%i6+0x00a]%asi	! Mem[0000000010181408] = 486ff562
!	Mem[0000000010181400] = 4e1cd015, %l2 = 0000000000000034
	ldstuba	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000015
!	%l5 = ff2536044dfc9ff5, Mem[0000000010001408] = ba9b8f73
	stba	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = ba9b8ff5
!	Mem[0000000020800041] = 59d93fd8, %l1 = 00000000000059d9
	ldstuba	[%o1+0x041]%asi,%l1	! %l1 = 00000000000000d9

p0_label_20:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 041f307412a51635, %l2 = 0000000000000015
	ldxa	[%i0+%o5]0x81,%l2	! %l2 = 041f307412a51635
!	Mem[0000000010141438] = 4567255a37c1efc3, %f24 = 448451f8 7d579b81
	ldd	[%i5+0x038],%f24	! %f24 = 4567255a 37c1efc3
!	Mem[0000000010041420] = 4f4149d03dcd40a1, %f28 = 53d689cc 484cd966, %asi = 80
	ldda	[%i1+0x020]%asi,%f28	! %f28 = 4f4149d0 3dcd40a1
!	%f25 = 37c1efc3, %f28 = 4f4149d0, %f5  = 00000022
	fdivs	%f25,%f28,%f5 		! %f5  = 28006de5
!	Mem[0000000030001408] = ff6a5334, %l3 = 0000000034000000
	ldsba	[%i0+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030141408] = 66d94c48, %l1 = 00000000000000d9
	lduba	[%i5+%o4]0x89,%l1	! %l1 = 0000000000000048
!	%l3 = ffffffffffffffff, %l2 = 041f307412a51635, %l3 = ffffffffffffffff
	addc	%l3,%l2,%l3		! %l3 = 041f307412a51634
!	Mem[0000000010041410] = 34000000, %l5 = ff2536044dfc9ff5
	lduwa	[%i1+%o5]0x88,%l5	! %l5 = 0000000034000000
!	Mem[0000000030001410] = 74301f04, %l1 = 0000000000000048
	ldsha	[%i0+%o5]0x89,%l1	! %l1 = 0000000000001f04
!	Mem[0000000010081400] = 34055e2d, %l6 = 0000000000000004
	lduba	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000034

p0_label_21:
!	Starting 10 instruction Store Burst
!	%f19 = 34055e2d, Mem[0000000010141410] = 00001524
	sta	%f19,[%i5+%o5]0x80	! Mem[0000000010141410] = 34055e2d
!	%l5 = 0000000034000000, Mem[0000000010181400] = 4e1cd0ff
	stha	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 4e1c0000
!	%l4 = 0000000000003db2, Mem[0000000010101404] = 12765e09
	stb	%l4,[%i4+0x004]		! Mem[0000000010101404] = b2765e09
!	%l0 = 6e3026363fc6b3af, Mem[0000000010141422] = 5d28cb50
	stb	%l0,[%i5+0x022]		! Mem[0000000010141420] = 5d28af50
	membar	#Sync			! Added by membar checker (2)
!	%l4 = 0000000000003db2, Mem[00000000100c1400] = f85184ff
	stba	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = f85184b2
!	%f28 = 4f4149d0, Mem[0000000010081408] = 962d0630
	sta	%f28,[%i2+%o4]0x88	! Mem[0000000010081408] = 4f4149d0
!	Mem[0000000010041413] = 00000034, %l7 = fffffdcd085d4f68
	ldstub	[%i1+0x013],%l7		! %l7 = 0000000000000034
!	%f18 = 586ebf09, Mem[0000000030041400] = 68093f74
	sta	%f18,[%i1+%g0]0x89	! Mem[0000000030041400] = 586ebf09
!	Mem[000000001010140c] = 00000000, %l3 = 0000000012a51634
	swap	[%i4+0x00c],%l3		! %l3 = 0000000000000000
!	Mem[0000000010081410] = ff253604, %l2 = 041f307412a51635
	ldstuba	[%i2+%o5]0x80,%l2	! %l2 = 00000000000000ff

p0_label_22:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800180] = 3b561158, %l1 = 0000000000001f04
	ldsb	[%o3+0x180],%l1		! %l1 = 000000000000003b
!	Mem[0000000030001400] = 1fdcf67d09fa3107, %f20 = 5cfc1bb4 2aa24c75
	ldda	[%i0+%g0]0x81,%f20	! %f20 = 1fdcf67d 09fa3107
!	Mem[0000000030141410] = 544c34ff, %f30 = 6220266a
	lda	[%i5+%o5]0x89,%f30	! %f30 = 544c34ff
!	Mem[0000000010181414] = 67d93f05, %l7 = 0000000000000034
	lduw	[%i6+0x014],%l7		! %l7 = 0000000067d93f05
!	%l2 = 00000000000000ff, imm = fffffffffffffb59, %l1 = 000000000000003b
	xnor	%l2,-0x4a7,%l1		! %l1 = 0000000000000459
!	Mem[0000000010141410] = 25baa7142d5e0534, %l5 = 0000000034000000
	ldxa	[%i5+%o5]0x88,%l5	! %l5 = 25baa7142d5e0534
!	Mem[0000000030041410] = c00e22d4, %l3 = 0000000000000000
	lduba	[%i1+%o5]0x81,%l3	! %l3 = 00000000000000c0
!	Mem[0000000010041408] = 00442636, %l4 = 0000000000003db2
	lduwa	[%i1+%o4]0x80,%l4	! %l4 = 0000000000442636
!	Mem[0000000010081428] = 1a4408ee7b91f887, %l2 = 00000000000000ff
	ldx	[%i2+0x028],%l2		! %l2 = 1a4408ee7b91f887
!	Mem[0000000010141408] = ff8451f8, %l4 = 0000000000442636
	ldswa	[%i5+%o4]0x80,%l4	! %l4 = ffffffffff8451f8

p0_label_23:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 0c683dc8, %l1 = 0000000000000459
	swapa	[%i2+%g0]0x81,%l1	! %l1 = 000000000c683dc8
!	%l5 = 25baa7142d5e0534, immd = 0000059f, %y  = fffffdcd
	smul	%l5,0x59f,%l0		! %l0 = 000000ff037f3f4c, %y = 000000ff
!	Mem[0000000010081408] = d049414f, %l0 = 00000000037f3f4c, %asi = 80
	swapa	[%i2+0x008]%asi,%l0	! %l0 = 00000000d049414f
!	%f10 = 6722fa6b 4e1cd015, Mem[0000000030001410] = 041f3074 12a51635
	stda	%f10,[%i0+%o5]0x81	! Mem[0000000030001410] = 6722fa6b 4e1cd015
!	%l0 = 00000000d049414f, Mem[0000000030141408] = 484cd9667df6dc1f
	stxa	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000d049414f
!	%f26 = 36c4b294 a1739280, Mem[0000000030001410] = 6bfa2267 15d01c4e
	stda	%f26,[%i0+%o5]0x89	! Mem[0000000030001410] = 36c4b294 a1739280
!	Mem[0000000030001400] = 1fdcf67d, %l7 = 0000000067d93f05
	swapa	[%i0+%g0]0x81,%l7	! %l7 = 000000001fdcf67d
!	Mem[0000000010181400] = 4e1c0000, %l0 = 00000000d049414f
	swapa	[%i6+%g0]0x88,%l0	! %l0 = 000000004e1c0000
!	Mem[0000000021800101] = 2fbb74f8, %l4 = ffffffffff8451f8
	ldstuba	[%o3+0x101]%asi,%l4	! %l4 = 00000000000000bb
!	%l3 = 00000000000000c0, Mem[0000000010041408] = 00442636
	stba	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = c0442636

p0_label_24:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 000f6378, %l6 = 0000000000000034
	ldsh	[%o0+%g0],%l6		! %l6 = 000000000000000f
!	Mem[0000000010181408] = 486ff562, %l2 = 1a4408ee7b91f887
	ldsba	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000048
!	Mem[0000000010181434] = 7ca3dfbd, %l0 = 000000004e1c0000, %asi = 80
	ldsha	[%i6+0x034]%asi,%l0	! %l0 = 0000000000007ca3
!	Mem[0000000010181410] = ff143f8467d93f05, %l6 = 000000000000000f
	ldxa	[%i6+%o5]0x80,%l6	! %l6 = ff143f8467d93f05
!	Mem[0000000030181400] = 486f10ff, %l4 = 00000000000000bb
	lduba	[%i6+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181408] = 486ff562, %l6 = ff143f8467d93f05
	lduba	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000048
!	Mem[0000000010141400] = 306e0000 5e6aefef, %l0 = 00007ca3, %l1 = 0c683dc8
	ldda	[%i5+%g0]0x80,%l0	! %l0 = 00000000306e0000 000000005e6aefef
!	Mem[00000000100c141d] = 324b0b8b, %l5 = 25baa7142d5e0534, %asi = 80
	ldsba	[%i3+0x01d]%asi,%l5	! %l5 = 000000000000004b
!	Mem[0000000030001400] = 0731fa09053fd967, %f20 = 1fdcf67d 09fa3107
	ldda	[%i0+%g0]0x89,%f20	! %f20 = 0731fa09 053fd967
!	Mem[00000000100c1410] = 6540a025 00000022, %l0 = 306e0000, %l1 = 5e6aefef
	ldda	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000022 000000006540a025

p0_label_25:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 09bf6e58, %l7 = 000000001fdcf67d
	ldstuba	[%i4+%g0]0x80,%l7	! %l7 = 0000000000000009
!	%f10 = 6722fa6b 4e1cd015, Mem[00000000100c1408] = ba9b8f73 a310bb74
	stda	%f10,[%i3+%o4]0x88	! Mem[00000000100c1408] = 6722fa6b 4e1cd015
!	Mem[0000000020800040] = 59ff3fd8, %l7 = 0000000000000009
	ldstub	[%o1+0x040],%l7		! %l7 = 0000000000000059
!	Mem[0000000010001438] = 02026e7a0cdfe063, %l5 = 000000000000004b, %l3 = 00000000000000c0
	add	%i0,0x38,%g1
	casxa	[%g1]0x80,%l5,%l3	! %l3 = 02026e7a0cdfe063
!	%l6 = 0000000000000048, Mem[0000000030041408] = 00000000
	stwa	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000048
!	Mem[0000000020800040] = ffff3fd8, %l6 = 0000000000000048
	ldstuba	[%o1+0x040]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081410] = ff253604, %l0 = 0000000000000022
	ldstuba	[%i2+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001424] = 1a8b0293, %l7 = 0000000000000059
	swap	[%i0+0x024],%l7		! %l7 = 000000001a8b0293
!	%f20 = 0731fa09, %f23 = fc4c0000
	fsqrts	%f20,%f23		! %f23 = 235573e1
!	Mem[0000000030001410] = 809273a1, %l1 = 000000006540a025
	ldstuba	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000080

p0_label_26:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = a5c707d100000000, %l0 = 00000000000000ff
	ldxa	[%i1+%g0]0x80,%l0	! %l0 = a5c707d100000000
!	Mem[0000000010041400] = d107c7a5, %l3 = 02026e7a0cdfe063
	ldsha	[%i1+%g0]0x88,%l3	! %l3 = ffffffffffffc7a5
!	Mem[0000000030001400] = 0731fa09 053fd967, %l4 = 000000ff, %l5 = 0000004b
	ldda	[%i0+%g0]0x89,%l4	! %l4 = 00000000053fd967 000000000731fa09
!	Mem[0000000010001400] = d89cb23d, %l3 = ffffffffffffc7a5
	ldsba	[%i0+%g0]0x88,%l3	! %l3 = 000000000000003d
!	%l1 = 0000000000000080, %l1 = 0000000000000080, %l5 = 000000000731fa09
	andn	%l1,%l1,%l5		! %l5 = 0000000000000000
!	Mem[0000000030141400] = c1221c9c, %l0 = a5c707d100000000
	lduwa	[%i5+%g0]0x81,%l0	! %l0 = 00000000c1221c9c
!	Mem[0000000030181400] = 486f10ff, %l7 = 000000001a8b0293
	lduwa	[%i6+%g0]0x89,%l7	! %l7 = 00000000486f10ff
!	Mem[0000000010181434] = 7ca3dfbd, %l6 = 00000000000000ff
	ldsh	[%i6+0x034],%l6		! %l6 = 0000000000007ca3
!	%l1 = 0000000000000080, immd = fffffffffffff1c1, %l108 = 0000000000000000
	sdivx	%l1,-0xe3f,%l0		! %l0 = 0000000000000000
!	Code Fragment 4, seed = 292043
p0_fragment_4:
!	%l0 = 0000000000000000
	setx	0x06e9a76a9af98cce,%g7,%l0 ! %l0 = 06e9a76a9af98cce
!	%l1 = 0000000000000080
	setx	0xd15d53be525ec079,%g7,%l1 ! %l1 = d15d53be525ec079
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 06e9a76a9af98cce
	setx	0x5c36a3a43b874034,%g7,%l0 ! %l0 = 5c36a3a43b874034
!	%l1 = d15d53be525ec079
	setx	0xe5f953bb660e8eff,%g7,%l1 ! %l1 = e5f953bb660e8eff
p0_fragment_4_end:

p0_label_27:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 544c34ff, %l0 = 5c36a3a43b874034
	ldstuba	[%i5+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000010001410] = 4451cf23
	stwa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	Mem[0000000010101400] = ffbf6e58, %l5 = 0000000000000000
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%l7 = 00000000486f10ff, Mem[0000000010141410] = 34055e2d
	stwa	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 486f10ff
!	Mem[00000000300c1410] = 2523d794, %l3 = 000000000000003d
	swapa	[%i3+%o5]0x81,%l3	! %l3 = 000000002523d794
!	%l1 = e5f953bb660e8eff, %l5 = 00000000000000ff, %y  = 000000ff
	udiv	%l1,%l5,%l3		! %l3 = 00000000ffffffff
	mov	%l0,%y			! %y = 000000ff
!	Mem[0000000010141408] = ff8451f8, %l2 = 0000000000000048
	swapa	[%i5+%o4]0x80,%l2	! %l2 = 00000000ff8451f8
!	Mem[0000000010181408] = 486ff562, %l6 = 0000000000007ca3
	swapa	[%i6+%o4]0x80,%l6	! %l6 = 00000000486ff562
!	%f8  = 6126f21f 902a8904, %l2 = 00000000ff8451f8
!	Mem[0000000010181430] = 057f0f9c7ca3dfbd
	add	%i6,0x030,%g1
	stda	%f8,[%g1+%l2]ASI_PST16_PL ! Mem[0000000010181430] = 057f0f9c7ca32661
!	%f6  = 8b0b4b32, Mem[0000000030001408] = ff6a5334
	sta	%f6 ,[%i0+%o4]0x81	! Mem[0000000030001408] = 8b0b4b32

p0_label_28:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 43000000, %l6 = 00000000486ff562
	ldsba	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000043
!	Mem[0000000030181410] = 00000000, %l7 = 00000000486f10ff
	lduha	[%i6+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001410] = a17392ff, %f26 = 36c4b294
	lda	[%i0+%o5]0x89,%f26	! %f26 = a17392ff
!	Mem[0000000010041400] = d107c7a5, %l1 = e5f953bb660e8eff
	ldsba	[%i1+%g0]0x88,%l1	! %l1 = ffffffffffffffa5
!	Mem[000000001014140c] = 650c0b2f, %l6 = 0000000000000043, %asi = 80
	lduba	[%i5+0x00c]%asi,%l6	! %l6 = 0000000000000065
!	Mem[0000000030081410] = 043625ff, %l1 = ffffffffffffffa5
	ldswa	[%i2+%o5]0x89,%l1	! %l1 = 00000000043625ff
!	%l4 = 00000000053fd967, Mem[00000000201c0000] = 000f6378
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = d9676378
!	%f31 = 1a8b0293, %f29 = 3dcd40a1
	fcmps	%fcc3,%f31,%f29		! %fcc3 = 1
!	Mem[0000000010041434] = 0508eb5d, %f0  = 29ef943c
	ld	[%i1+0x034],%f0 	! %f0 = 0508eb5d
!	Mem[0000000030181408] = ca0656e0, %l6 = 0000000000000065
	lduwa	[%i6+%o4]0x81,%l6	! %l6 = 00000000ca0656e0

p0_label_29:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 00000043, %l1 = 00000000043625ff
	ldstuba	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000043
!	%f29 = 3dcd40a1, Mem[00000000100c1400] = f85184b2
	sta	%f29,[%i3+%g0]0x88	! Mem[00000000100c1400] = 3dcd40a1
!	%l7 = 0000000000000000, Mem[00000000100c1400] = a140cd3d
	stwa	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	Mem[000000001014142c] = 5c3b8627, %l6 = 00000000ca0656e0, %asi = 80
	swapa	[%i5+0x02c]%asi,%l6	! %l6 = 000000005c3b8627
!	Code Fragment 4, seed = 235480
p0_fragment_5:
!	%l0 = 00000000000000ff
	setx	0xc0793b730f321166,%g7,%l0 ! %l0 = c0793b730f321166
!	%l1 = 0000000000000043
	setx	0x3c6fa99b5efe0191,%g7,%l1 ! %l1 = 3c6fa99b5efe0191
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c0793b730f321166
	setx	0x09d4216787ea95cc,%g7,%l0 ! %l0 = 09d4216787ea95cc
!	%l1 = 3c6fa99b5efe0191
	setx	0x8d44215f47f3d117,%g7,%l1 ! %l1 = 8d44215f47f3d117
p0_fragment_5_end:
!	%f20 = 0731fa09 053fd967, %l5 = 00000000000000ff
!	Mem[0000000010101438] = 6c7d53fa7621bfe3
	add	%i4,0x038,%g1
	stda	%f20,[%g1+%l5]ASI_PST32_P ! Mem[0000000010101438] = 0731fa09053fd967
!	Mem[0000000010001410] = 00000000, %l4 = 00000000053fd967, %asi = 80
	swapa	[%i0+0x010]%asi,%l4	! %l4 = 0000000000000000
!	%l0 = 09d4216787ea95cc, Mem[0000000010101412] = 0da6dac4
	stb	%l0,[%i4+0x012]		! Mem[0000000010101410] = 0da6ccc4
!	%l2 = ff8451f8, %l3 = ffffffff, Mem[00000000100c1410] = 00000022 6540a025
	stda	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff8451f8 ffffffff
!	%l3 = 00000000ffffffff, Mem[0000000010041410] = 000000ff
	stha	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = ffff00ff

p0_label_30:
!	Starting 10 instruction Load Burst
!	%l0 = 09d4216787ea95cc, imm = 0000000000000e5f, %l0 = 09d4216787ea95cc
	subc	%l0,0xe5f,%l0		! %l0 = 09d4216787ea876d
!	Mem[00000000218000c0] = 10f7a0c8, %l7 = 0000000000000000, %asi = 80
	ldsha	[%o3+0x0c0]%asi,%l7	! %l7 = 00000000000010f7
!	Mem[0000000010041437] = 0508eb5d, %l2 = 00000000ff8451f8, %asi = 80
	ldsba	[%i1+0x037]%asi,%l2	! %l2 = 000000000000005d
!	Mem[0000000030001400] = 67d93f05, %l4 = 0000000000000000
	ldsba	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000067
!	Mem[0000000030101410] = 37e230e2 000000ff, %l4 = 00000067, %l5 = 000000ff
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 00000000000000ff 0000000037e230e2
!	Mem[0000000030041408] = 0f00000048000000, %f16 = c3dc2227 e6872000
	ldda	[%i1+%o4]0x89,%f16	! %f16 = 0f000000 48000000
!	Mem[0000000010041408] = afb3c63f362644c0, %f4  = 6540a025 28006de5
	ldda	[%i1+%o4]0x88,%f4 	! %f4  = afb3c63f 362644c0
!	Mem[0000000010141400] = 00006e30, %l4 = 00000000000000ff
	lduba	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000030
!	Mem[0000000030101400] = 3626306e, %l6 = 000000005c3b8627
	lduba	[%i4+%g0]0x89,%l6	! %l6 = 000000000000006e
!	Mem[0000000010141400] = efef6a5e00006e30, %l7 = 00000000000010f7
	ldxa	[%i5+%g0]0x88,%l7	! %l7 = efef6a5e00006e30

p0_label_31:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 15d01c4e, %l1 = 8d44215f47f3d117
	ldstuba	[%i3+%o4]0x80,%l1	! %l1 = 0000000000000015
!	%l7 = efef6a5e00006e30, Mem[00000000300c1408] = 06000000
	stwa	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00006e30
!	%l0 = 09d4216787ea876d, Mem[0000000010181410] = 053fd967843f14ff
	stxa	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 09d4216787ea876d
!	%l1 = 0000000000000015, Mem[00000000201c0000] = d9676378, %asi = 80
	stha	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00156378
!	%l1 = 0000000000000015, Mem[0000000030081408] = 46fbd959
	stha	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 46fb0015
!	%f27 = a1739280, Mem[0000000030081408] = 1500fb46
	sta	%f27,[%i2+%o4]0x81	! Mem[0000000030081408] = a1739280
!	Mem[000000001014142c] = ca0656e0, %l0 = 09d4216787ea876d
	ldstuba	[%i5+0x02c]%asi,%l0	! %l0 = 00000000000000ca
!	%f24 = 4567255a, Mem[0000000030181408] = e05606ca
	sta	%f24,[%i6+%o4]0x89	! Mem[0000000030181408] = 4567255a
!	Mem[0000000010081410] = 043625ff, %l5 = 0000000037e230e2
	swapa	[%i2+%o5]0x88,%l5	! %l5 = 00000000043625ff
!	Mem[0000000030101410] = 000000ff, %l2 = 000000000000005d
	ldsha	[%i4+%o5]0x89,%l2	! %l2 = 00000000000000ff

p0_label_32:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = a5c707d1, %l5 = 00000000043625ff
	ldsha	[%i1+%g0]0x80,%l5	! %l5 = ffffffffffffa5c7
!	Mem[0000000030001400] = 0731fa09 053fd967, %l4 = 00000030, %l5 = ffffa5c7
	ldda	[%i0+%g0]0x89,%l4	! %l4 = 00000000053fd967 000000000731fa09
!	Mem[0000000030141410] = 544c34ff, %l5 = 000000000731fa09
	lduwa	[%i5+%o5]0x89,%l5	! %l5 = 00000000544c34ff
!	Mem[0000000030081400] = 00000459, %l4 = 00000000053fd967
	ldsba	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181410] = 87ea876d, %l5 = 00000000544c34ff
	ldswa	[%i6+%o5]0x88,%l5	! %l5 = ffffffff87ea876d
!	Mem[0000000030101408] = 149ffc47, %l5 = ffffffff87ea876d
	ldsba	[%i4+%o4]0x81,%l5	! %l5 = 0000000000000014
!	Mem[0000000030081410] = ff253604 4dfc9ff5, %l2 = 000000ff, %l3 = ffffffff
	ldda	[%i2+%o5]0x81,%l2	! %l2 = 00000000ff253604 000000004dfc9ff5
!	Mem[000000001008143c] = 52177023, %l6 = 000000000000006e, %asi = 80
	lduwa	[%i2+0x03c]%asi,%l6	! %l6 = 0000000052177023
!	Mem[0000000010041410] = ffff00ff, %l5 = 0000000000000014
	ldsha	[%i1+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000201c0000] = 00156378, %l1 = 0000000000000015, %asi = 80
	ldsha	[%o0+0x000]%asi,%l1	! %l1 = 0000000000000015

p0_label_33:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 00000459, %l2 = 00000000ff253604
	ldstuba	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000
!	%l1 = 0000000000000015, Mem[00000000100c1410] = f85184ff
	stba	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = 155184ff
!	%l2 = 00000000, %l3 = 4dfc9ff5, Mem[0000000010081408] = 4c3f7f03 8f814c4f
	stda	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000 4dfc9ff5
!	%l2 = 00000000, %l3 = 4dfc9ff5, Mem[0000000010041400] = d107c7a5 00000000
	stda	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000 4dfc9ff5
!	%l0 = 00000000000000ca, Mem[0000000030041408] = 000000480000000f
	stxa	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000000000ca
!	%l4 = 0000000000000000, Mem[0000000030141400] = 591e7e209c1c22c1
	stxa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000000
!	%f11 = 4e1cd015, Mem[0000000010001410] = 053fd967
	sta	%f11,[%i0+%o5]0x80	! Mem[0000000010001410] = 4e1cd015
!	Mem[0000000030081400] = ff000459, %l4 = 0000000000000000
	ldstuba	[%i2+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1400] = 00000000, %l1 = 0000000000000015
	swapa	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%l0 = 00000000000000ca, Mem[00000000300c1408] = 5f8dc122306e0000
	stxa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000000000ca

p0_label_34:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (3)
!	Mem[00000000100c1400] = 00000015 3c94ef29 ffd01c4e 6bfa2267
!	Mem[00000000100c1410] = 155184ff ffffffff 2e2fbbc2 324b0b8b
!	Mem[00000000100c1420] = 04892a90 1ff22661 15d01c4e 6bfa2267
!	Mem[00000000100c1430] = 0a8dec7c 64f7bd1d 00000000 6e1b9200
	ldda	[%i3+%g0]ASI_BLK_P,%f0 	! Block Load from 00000000100c1400
!	Mem[0000000030101408] = 149ffc47, %l3 = 000000004dfc9ff5
	lduba	[%i4+%o4]0x81,%l3	! %l3 = 0000000000000014
!	%l5 = ffffffffffffffff, imm = 0000000000000d8d, %l0 = 00000000000000ca
	addc	%l5,0xd8d,%l0		! %l0 = 0000000000000d8c
!	Mem[0000000010181408] = 00007ca3 843e72a0, %l2 = 00000000, %l3 = 00000014
	ldda	[%i6+%o4]0x80,%l2	! %l2 = 0000000000007ca3 00000000843e72a0
!	Mem[0000000010081410] = 37e230e2, %l2 = 0000000000007ca3
	lduba	[%i2+%o5]0x88,%l2	! %l2 = 00000000000000e2
!	Mem[0000000030141400] = 00000000, %l7 = efef6a5e00006e30
	ldsha	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l6 = 0000000052177023
	ldswa	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141438] = 4567255a, %f23 = 235573e1
	lda	[%i5+0x038]%asi,%f23	! %f23 = 4567255a
!	Mem[0000000010181408] = 00007ca3, %l2 = 00000000000000e2, %asi = 80
	lduba	[%i6+0x008]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = 47fc9f14, %l6 = 0000000000000000
	ldsba	[%i4+%o4]0x89,%l6	! %l6 = 0000000000000014

p0_label_35:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 590400ff, %l1 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l1	! %l1 = 00000000590400ff
!	Mem[0000000010081400] = 34055e2d 00000000 00000000 f59ffc4d
!	%f16 = 0f000000 48000000 586ebf09 34055e2d
!	%f20 = 0731fa09 053fd967 448451f8 4567255a
!	%f24 = 4567255a 37c1efc3 a17392ff a1739280
!	%f28 = 4f4149d0 3dcd40a1 544c34ff 1a8b0293
	stda	%f16,[%i2+%g0]ASI_BLK_PL	! Block Store to 0000000010081400
!	%l0 = 0000000000000d8c, Mem[0000000010081410] = 67d93f05
	stha	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 0d8c3f05
!	%f26 = a17392ff a1739280, %l0 = 0000000000000d8c
!	Mem[0000000010101408] = 0f00000012a51634
	add	%i4,0x008,%g1
	stda	%f26,[%g1+%l0]ASI_PST32_P ! Mem[0000000010101408] = 0f00000012a51634
!	%l4 = 00000000000000ff, Mem[0000000010141430] = 5378693c
	stb	%l4,[%i5+0x030]		! Mem[0000000010141430] = ff78693c
!	%l6 = 00000014, %l7 = 00000000, Mem[0000000010181408] = a37c0000 a0723e84
	stda	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000014 00000000
!	%l0 = 0000000000000d8c, Mem[0000000030041400] = 09bf6e58
	stwa	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000d8c
!	Mem[0000000010101408] = 0f000000, %l3 = 00000000843e72a0
	swapa	[%i4+%o4]0x80,%l3	! %l3 = 000000000f000000
!	%l5 = ffffffffffffffff, Mem[0000000010181410] = 6d87ea876721d409
	stxa	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffffffffffffff
!	%l0 = 00000d8c, %l1 = 590400ff, Mem[0000000010081408] = 2d5e0534 09bf6e58
	stda	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000d8c 590400ff

p0_label_36:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ff106f48, %l4 = 00000000000000ff
	lduba	[%i6+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1410] = 3d000000, %l1 = 00000000590400ff
	lduwa	[%i3+%o5]0x89,%l1	! %l1 = 000000003d000000
!	Mem[0000000030141400] = 00000000, %l3 = 000000000f000000
	lduba	[%i5+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = 3db29cd8, %l1 = 000000003d000000
	ldsba	[%i0+%g0]0x80,%l1	! %l1 = 000000000000003d
!	Mem[0000000030001408] = 324b0b8b, %f14 = 00000000
	lda	[%i0+%o4]0x89,%f14	! %f14 = 324b0b8b
!	Mem[0000000010001400] = 3db29cd8 650dc289, %l4 = 000000ff, %l5 = ffffffff
	ldda	[%i0+%g0]0x80,%l4	! %l4 = 000000003db29cd8 00000000650dc289
!	Mem[0000000030101400] = 3626306e, %l7 = 0000000000000000
	ldswa	[%i4+%g0]0x89,%l7	! %l7 = 000000003626306e
!	Mem[0000000020800000] = 201053a8, %l4 = 000000003db29cd8
	lduh	[%o1+%g0],%l4		! %l4 = 0000000000002010
!	Mem[0000000010101410] = 0da6ccc4, %l7 = 000000003626306e
	ldsha	[%i4+%o5]0x80,%l7	! %l7 = 0000000000000da6
!	Mem[00000000100c1410] = ff845115, %l0 = 0000000000000d8c
	lduba	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000015

p0_label_37:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000010001408] = f58f9bba
	stwa	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	%l5 = 00000000650dc289, Mem[0000000010081410] = 0731fa09053f8c0d
	stxa	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000650dc289
!	%f3  = 6bfa2267, Mem[0000000010001410] = 4e1cd015
	sta	%f3 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 6bfa2267
!	%f10 = 15d01c4e 6bfa2267, Mem[0000000010181400] = d049414f 6722fa6b
	stda	%f10,[%i6+%g0]0x88	! Mem[0000000010181400] = 15d01c4e 6bfa2267
!	%l3 = 0000000000000000, Mem[0000000030081408] = 809273a1
	stha	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = 80920000
!	%l4 = 0000000000002010, Mem[0000000010181408] = 14000000
	stba	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 10000000
!	Mem[0000000010141408] = 00000048, %l2 = 0000000000000000
	swap	[%i5+%o4],%l2		! %l2 = 0000000000000048
!	%l1 = 000000000000003d, Mem[0000000030101410] = ff000000
	stha	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = 003d0000
!	%f14 = 324b0b8b 6e1b9200, %l0 = 0000000000000015
!	Mem[0000000030181430] = 362d3ccc3e735a2d
	add	%i6,0x030,%g1
	stda	%f14,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030181430] = 00923ccc8b0b5a2d
!	%f8  = 04892a90 1ff22661, Mem[0000000010041400] = 00000000 4dfc9ff5
	stda	%f8 ,[%i1+%g0]0x88	! Mem[0000000010041400] = 04892a90 1ff22661

p0_label_38:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 486f10ff, %l1 = 000000000000003d
	lduwa	[%i5+%o5]0x80,%l1	! %l1 = 00000000486f10ff
!	Mem[0000000030181410] = 00000000, %l5 = 00000000650dc289
	lduwa	[%i6+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181400] = ff106f480c660539, %l0 = 0000000000000015
	ldxa	[%i6+%g0]0x81,%l0	! %l0 = ff106f480c660539
!	Mem[0000000010101408] = a0723e84, %l6 = 0000000000000014
	lduha	[%i4+%o4]0x88,%l6	! %l6 = 0000000000003e84
!	Mem[0000000010181424] = 5fd2e701, %l3 = 0000000000000000
	lduw	[%i6+0x024],%l3		! %l3 = 000000005fd2e701
!	Code Fragment 3, seed = 345291
p0_fragment_6:
!	%l0 = ff106f480c660539
	setx	0xf2ccb54e84c30cce,%g7,%l0 ! %l0 = f2ccb54e84c30cce
!	%l1 = 00000000486f10ff
	setx	0xff53b9f8eff04079,%g7,%l1 ! %l1 = ff53b9f8eff04079
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f2ccb54e84c30cce
	setx	0x3508bf58e260c034,%g7,%l0 ! %l0 = 3508bf58e260c034
!	%l1 = ff53b9f8eff04079
	setx	0x65223b7b73b00eff,%g7,%l1 ! %l1 = 65223b7b73b00eff
p0_fragment_6_end:
!	Mem[0000000030141408] = 00000000d049414f, %l7 = 0000000000000da6
	ldxa	[%i5+%o4]0x81,%l7	! %l7 = 00000000d049414f
!	Mem[0000000030141410] = 544c34ff, %l1 = 65223b7b73b00eff
	lduwa	[%i5+%o5]0x89,%l1	! %l1 = 00000000544c34ff
!	Mem[0000000010041408] = afb3c63f 362644c0, %l4 = 00002010, %l5 = 00000000
	ldda	[%i1+%o4]0x88,%l4	! %l4 = 00000000362644c0 00000000afb3c63f
!	Mem[0000000030101400] = 3626306e, %l0 = 3508bf58e260c034
	ldsha	[%i4+%g0]0x89,%l0	! %l0 = 000000000000306e

p0_label_39:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000362644c0, Mem[0000000010081410] = 89c20d65
	stba	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = c0c20d65
!	%l7 = 00000000d049414f, Mem[0000000010001428] = 21e8322e
	stw	%l7,[%i0+0x028]		! Mem[0000000010001428] = d049414f
!	%f4  = 155184ff ffffffff, %l0 = 000000000000306e
!	Mem[0000000010101428] = 2a659fae149ffc47
	add	%i4,0x028,%g1
	stda	%f4,[%g1+%l0]ASI_PST16_P ! Mem[0000000010101428] = 155184fffffffc47
!	Mem[0000000030041400] = 00000d8c 340c62d9 00000000 000000ca
!	%f16 = 0f000000 48000000 586ebf09 34055e2d
!	%f20 = 0731fa09 053fd967 448451f8 4567255a
!	%f24 = 4567255a 37c1efc3 a17392ff a1739280
!	%f28 = 4f4149d0 3dcd40a1 544c34ff 1a8b0293
	stda	%f16,[%i1+%g0]ASI_COMMIT_S	! Block Store to 0000000030041400
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000010041400] = 6126f21f, %l0 = 000000000000306e
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000061
!	%f16 = 0f000000 48000000, %l3 = 000000005fd2e701
!	Mem[0000000030141428] = 5cf416be4d06ed17
	add	%i5,0x028,%g1
	stda	%f16,[%g1+%l3]ASI_PST32_SL ! Mem[0000000030141428] = 000000484d06ed17
!	Mem[0000000010001400] = d89cb23d, %l3 = 000000005fd2e701
	ldstuba	[%i0+%g0]0x88,%l3	! %l3 = 000000000000003d
!	%l1 = 00000000544c34ff, Mem[00000000211c0001] = ffff2808
	stb	%l1,[%o2+0x001]		! Mem[00000000211c0000] = ffff2808
!	%l2 = 0000000000000048, Mem[0000000030181408] = 819b577d4567255a
	stxa	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000000000000048
!	Mem[00000000300c1410] = 0000003d, %l1 = 00000000544c34ff
	swapa	[%i3+%o5]0x81,%l1	! %l1 = 000000000000003d

p0_label_40:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 650dc2c0, %l6 = 0000000000003e84
	lduba	[%i2+%o5]0x88,%l6	! %l6 = 00000000000000c0
!	Mem[0000000030141410] = 95d67214544c34ff, %l4 = 00000000362644c0
	ldxa	[%i5+%o5]0x89,%l4	! %l4 = 95d67214544c34ff
!	%f14 = 324b0b8b, %f26 = a17392ff
	fsqrts	%f14,%f26		! %f26 = 38e3fd7f
!	Mem[0000000010001400] = d89cb2ff, %l4 = 95d67214544c34ff
	ldsha	[%i0+%g0]0x88,%l4	! %l4 = ffffffffffffb2ff
!	Mem[0000000010141428] = 261c930eff0656e0, %f16 = 0f000000 48000000
	ldd	[%i5+0x028],%f16	! %f16 = 261c930e ff0656e0
!	Mem[0000000010001408] = cf95402900000000, %f6  = 2e2fbbc2 324b0b8b
	ldda	[%i0+%o4]0x88,%f6 	! %f6  = cf954029 00000000
!	Mem[0000000030081410] = 043625ff, %l3 = 000000000000003d
	ldsha	[%i2+%o5]0x89,%l3	! %l3 = 00000000000025ff
!	Mem[0000000010101410] = 0da6ccc4, %l3 = 00000000000025ff
	lduha	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000da6
!	Mem[0000000010181400] = 6722fa6b, %l1 = 000000000000003d
	ldswa	[%i6+%g0]0x80,%l1	! %l1 = 000000006722fa6b
!	Mem[0000000030101410] = 00003d00, %l0 = 0000000000000061
	lduwa	[%i4+%o5]0x89,%l0	! %l0 = 0000000000003d00

p0_label_41:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000c0, Mem[000000001000140c] = 294095cf, %asi = 80
	stba	%l6,[%i0+0x00c]%asi	! Mem[000000001000140c] = c04095cf
!	%f4  = 155184ff ffffffff, %f0  = 00000015 3c94ef29
	fxtod	%f4 ,%f0 		! %f0  = 43b55185 00000000
!	%l2 = 00000048, %l3 = 00000da6, Mem[0000000010141410] = 486f10ff 14a7ba25
	stda	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000048 00000da6
!	%f20 = 0731fa09 053fd967, %l0 = 0000000000003d00
!	Mem[0000000030001430] = 437e968c40bc34ed
	add	%i0,0x030,%g1
	stda	%f20,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030001430] = 437e968c40bc34ed
!	%f22 = 448451f8, Mem[0000000030141408] = 00000000
	sta	%f22,[%i5+%o4]0x89	! Mem[0000000030141408] = 448451f8
!	Mem[000000001004143c] = 333d50ff, %l3 = 0000000000000da6
	swap	[%i1+0x03c],%l3		! %l3 = 00000000333d50ff
!	Mem[0000000030141400] = 00000000, %l6 = 00000000000000c0
	ldstuba	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041400] = 0000000f, %l4 = ffffffffffffb2ff
	ldstuba	[%i1+%g0]0x89,%l4	! %l4 = 000000000000000f
!	Mem[0000000010141410] = 00000048, %l6 = 0000000000000000
	ldstuba	[%i5+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = d89cb2ff, %l6 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l6	! %l6 = 00000000000000ff

p0_label_42:
!	Starting 10 instruction Load Burst
!	Mem[000000001010142c] = fffffc47, %l7 = 00000000d049414f, %asi = 80
	ldswa	[%i4+0x02c]%asi,%l7	! %l7 = fffffffffffffc47
!	Mem[0000000010041400] = 04892a901ff226ff, %l1 = 000000006722fa6b
	ldxa	[%i1+%g0]0x88,%l1	! %l1 = 04892a901ff226ff
!	Mem[0000000030041408] = 2d5e053409bf6e58, %l4 = 000000000000000f
	ldxa	[%i1+%o4]0x89,%l4	! %l4 = 2d5e053409bf6e58
!	Mem[0000000010141424] = 7e37cc21, %l4 = 2d5e053409bf6e58
	ldsw	[%i5+0x024],%l4		! %l4 = 000000007e37cc21
!	Mem[0000000030081400] = 00000000, %f23 = 4567255a
	lda	[%i2+%g0]0x89,%f23	! %f23 = 00000000
!	Mem[0000000010001408] = 00000000c04095cf, %l0 = 0000000000003d00
	ldxa	[%i0+%o4]0x80,%l0	! %l0 = 00000000c04095cf
!	Mem[0000000030141408] = f8518444, %l0 = 00000000c04095cf
	ldstuba	[%i5+%o4]0x81,%l0	! %l0 = 00000000000000f8
!	Mem[0000000010041400] = 04892a901ff226ff, %l4 = 000000007e37cc21
	ldxa	[%i1+%g0]0x88,%l4	! %l4 = 04892a901ff226ff
!	Mem[0000000030001408] = 324b0b8b, %l1 = 04892a901ff226ff
	lduwa	[%i0+%o4]0x89,%l1	! %l1 = 00000000324b0b8b
!	Mem[0000000010081410] = 00000000650dc2c0, %f22 = 448451f8 00000000
	ldda	[%i2+%o5]0x88,%f22	! %f22 = 00000000 650dc2c0

p0_label_43:
!	Starting 10 instruction Store Burst
!	%f2  = ffd01c4e 6bfa2267, %l3 = 00000000333d50ff
!	Mem[0000000010081418] = 5a256745f8518444
	add	%i2,0x018,%g1
	stda	%f2,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010081418] = 6722fa6b4e1cd0ff
!	%l2 = 00000048, %l3 = 333d50ff, Mem[0000000010001410] = 6bfa2267 1571f1c5
	stda	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000048 333d50ff
!	Mem[0000000030141410] = 544c34ff, %l2 = 0000000000000048
	swapa	[%i5+%o5]0x89,%l2	! %l2 = 00000000544c34ff
!	%l4 = 04892a901ff226ff, Mem[0000000021800001] = 020e0c38
	stb	%l4,[%o3+0x001]		! Mem[0000000021800000] = 02ff0c38
!	%l4 = 1ff226ff, %l5 = afb3c63f, Mem[0000000010101410] = c4cca60d 4565670e
	stda	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 1ff226ff afb3c63f
!	Mem[00000000100c1410] = ff845115, %l1 = 00000000324b0b8b
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 00000000ff845115
!	%l3 = 00000000333d50ff, Mem[0000000010081410] = c0c20d6500000000
	stx	%l3,[%i2+%o5]		! Mem[0000000010081410] = 00000000333d50ff
!	%f10 = 15d01c4e 6bfa2267, Mem[0000000010041438] = 2c0a7fda 00000da6
	std	%f10,[%i1+0x038]	! Mem[0000000010041438] = 15d01c4e 6bfa2267
!	Mem[0000000010181420] = 379583b05fd2e701, %l7 = fffffffffffffc47, %l0 = 00000000000000f8
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l7,%l0	! %l0 = 379583b05fd2e701
!	Mem[00000000211c0001] = ffff2808, %l2 = 00000000544c34ff
	ldstuba	[%o2+0x001]%asi,%l2	! %l2 = 00000000000000ff

p0_label_44:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff286228, %l0 = 379583b05fd2e701
	lduha	[%i3+%g0]0x81,%l0	! %l0 = 000000000000ff28
!	Mem[000000001008143a] = 93028b1a, %l0 = 000000000000ff28
	ldub	[%i2+0x03a],%l0		! %l0 = 000000000000008b
	membar	#Sync			! Added by membar checker (5)
!	Mem[00000000300c1400] = ff286228 55f8e099 ca000000 00000000
!	Mem[00000000300c1410] = 544c34ff 74142cd5 1fad7072 2e113f7b
!	Mem[00000000300c1420] = 19bd58c0 28fafdd1 2b002ffe 3921d957
!	Mem[00000000300c1430] = 224fb1ac 3c6d6f8d 5f54954a 0ecae9f3
	ldda	[%i3+%g0]ASI_BLK_AIUSL,%f16	! Block Load from 00000000300c1400
!	%f31 = 4a95545f, %f13 = 64f7bd1d
	fcmpes	%fcc2,%f31,%f13		! %fcc2 = 1
!	Mem[0000000010101400] = ffbf6e58, %l0 = 000000000000008b
	ldswa	[%i4+%g0]0x80,%l0	! %l0 = ffffffffffbf6e58
!	Mem[0000000010141430] = ff78693c 33e34edd, %l0 = ffbf6e58, %l1 = ff845115, %asi = 80
	ldda	[%i5+0x030]%asi,%l0	! %l0 = 00000000ff78693c 0000000033e34edd
!	Mem[0000000030081410] = ff253604, %l7 = fffffffffffffc47
	lduwa	[%i2+%o5]0x81,%l7	! %l7 = 00000000ff253604
!	Mem[0000000030081408] = 00009280, %l4 = 04892a901ff226ff
	ldsba	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041400] = 1ff226ff, %l3 = 00000000333d50ff
	ldsba	[%i1+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030101408] = 149ffc47, %l3 = ffffffffffffffff
	ldsha	[%i4+%o4]0x81,%l3	! %l3 = 000000000000149f

p0_label_45:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = ff286228 55f8e099 ca000000 00000000
!	%f16 = 99e0f855 286228ff 00000000 000000ca
!	%f20 = d52c1474 ff344c54 7b3f112e 7270ad1f
!	%f24 = d1fdfa28 c058bd19 57d92139 fe2f002b
!	%f28 = 8d6f6d3c acb14f22 f3e9ca0e 4a95545f
	stda	%f16,[%i3+%g0]ASI_BLK_S	! Block Store to 00000000300c1400
!	%l7 = 00000000ff253604, Mem[0000000010081410] = 00000000333d50ff
	stxa	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000ff253604
!	Mem[0000000030141408] = ff518444, %l4 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1400] = 99e0f855 286228ff 00000000 000000ca
	membar	#Sync			! Added by membar checker (6)
!	%f16 = 99e0f855 286228ff 00000000 000000ca
!	%f20 = d52c1474 ff344c54 7b3f112e 7270ad1f
!	%f24 = d1fdfa28 c058bd19 57d92139 fe2f002b
!	%f28 = 8d6f6d3c acb14f22 f3e9ca0e 4a95545f
	stda	%f16,[%i3+%g0]ASI_BLK_SL	! Block Store to 00000000300c1400
!	%l6 = 00000000000000ff, Mem[0000000010081400] = 48000000
	stwa	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff
	membar	#Sync			! Added by membar checker (7)
!	Mem[00000000300c1410] = ff344c54, %l6 = 00000000000000ff
	swapa	[%i3+%o5]0x89,%l6	! %l6 = 00000000ff344c54
!	Mem[0000000030101410] = 003d0000, %l3 = 000000000000149f
	swapa	[%i4+%o5]0x81,%l3	! %l3 = 00000000003d0000
!	Mem[0000000010041410] = ffff00ff, %l4 = 00000000000000ff
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 00000000ffff00ff
!	%f6  = cf954029 00000000, Mem[00000000100c1410] = 324b0b8b ffffffff
	stda	%f6 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = cf954029 00000000
!	Mem[0000000030041400] = ff000000, %l5 = 00000000afb3c63f
	ldstuba	[%i1+%g0]0x81,%l5	! %l5 = 00000000000000ff

p0_label_46:
!	Starting 10 instruction Load Burst
!	Mem[000000001010141a] = 06cad104, %l7 = 00000000ff253604, %asi = 80
	lduha	[%i4+0x01a]%asi,%l7	! %l7 = 000000000000d104
!	%f20 = d52c1474, %f15 = 6e1b9200
	fstoi	%f20,%f15		! %f15 = 80000000
!	Mem[0000000010181400] = 6722fa6b, %l4 = 00000000ffff00ff, %asi = 80
	lduwa	[%i6+0x000]%asi,%l4	! %l4 = 000000006722fa6b
!	Mem[0000000010101428] = 155184fffffffc47, %f24 = d1fdfa28 c058bd19, %asi = 80
	ldda	[%i4+0x028]%asi,%f24	! %f24 = 155184ff fffffc47
!	Mem[00000000300c1400] = 99e0f855 286228ff, %l0 = ff78693c, %l1 = 33e34edd
	ldda	[%i3+%g0]0x89,%l0	! %l0 = 00000000286228ff 0000000099e0f855
!	Mem[0000000030081400] = 00000000 1b6b89b9 00009280 7fa0ca7f
!	Mem[0000000030081410] = ff253604 4dfc9ff5 7fa1a312 2144839b
!	Mem[0000000030081420] = 495a7860 453b5af1 60f2649e 54b1d777
!	Mem[0000000030081430] = 549a634c 1001d6ad 503c6bea 748cc213
	ldda	[%i2+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030081400
!	Mem[00000000300c1408] = ca000000, %l6 = 00000000ff344c54
	ldsba	[%i3+%o4]0x81,%l6	! %l6 = ffffffffffffffca
!	Mem[0000000010141410] = ff00004800000da6, %f0  = 43b55185 00000000
	ldda	[%i5+%o5]0x80,%f0 	! %f0  = ff000048 00000da6
!	Mem[0000000030041400] = 000000ff, %l2 = 00000000000000ff
	ldswa	[%i1+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041408] = c0442636 3fc6b3af, %l6 = ffffffca, %l7 = 0000d104
	ldda	[%i1+%o4]0x80,%l6	! %l6 = 00000000c0442636 000000003fc6b3af

p0_label_47:
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = ffff2808, %l7 = 000000003fc6b3af
	ldstub	[%o2+%g0],%l7		! %l7 = 00000000000000ff
!	%f28 = 549a634c 1001d6ad, Mem[0000000010041408] = 362644c0 afb3c63f
	stda	%f28,[%i1+%o4]0x88	! Mem[0000000010041408] = 549a634c 1001d6ad
	membar	#Sync			! Added by membar checker (8)
!	%l6 = 00000000c0442636, Mem[0000000030081410] = ff253604
	stba	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 36253604
!	Mem[0000000030181410] = 00000000, %l1 = 0000000099e0f855
	ldstuba	[%i6+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%f0  = ff000048, Mem[0000000010001410] = 48000000
	sta	%f0 ,[%i0+%o5]0x88	! Mem[0000000010001410] = ff000048
!	Mem[0000000010041400] = 1ff226ff, %l0 = 00000000286228ff
	swapa	[%i1+%g0]0x88,%l0	! %l0 = 000000001ff226ff
!	%f0  = ff000048, Mem[0000000010181418] = 2f251be2
	sta	%f0 ,[%i6+0x018]%asi	! Mem[0000000010181418] = ff000048
!	%l7 = 00000000000000ff, Mem[0000000010041410] = ff000000
	stwa	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff
!	%l4 = 000000006722fa6b, Mem[0000000030041400] = 00000048000000ff
	stxa	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000006722fa6b
!	%l4 = 6722fa6b, %l5 = 000000ff, Mem[0000000010141420] = 5d28af50 7e37cc21, %asi = 80
	stda	%l4,[%i5+0x020]%asi	! Mem[0000000010141420] = 6722fa6b 000000ff

p0_label_48:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 1001d6ad, %l4 = 000000006722fa6b
	lduwa	[%i1+%o4]0x88,%l4	! %l4 = 000000001001d6ad
!	Mem[0000000010101410] = ff26f21f 3fc6b3af, %l2 = 000000ff, %l3 = 003d0000
	ldda	[%i4+%o5]0x80,%l2	! %l2 = 00000000ff26f21f 000000003fc6b3af
!	Mem[000000001018142f] = 3584c007, %l1 = 0000000000000000, %asi = 80
	lduba	[%i6+0x02f]%asi,%l1	! %l1 = 0000000000000007
!	Mem[0000000030041400] = 6bfa2267, %l7 = 00000000000000ff
	lduwa	[%i1+%g0]0x81,%l7	! %l7 = 000000006bfa2267
!	Mem[0000000010041410] = 09000000 000000ff, %l2 = ff26f21f, %l3 = 3fc6b3af
	ldda	[%i1+%o5]0x88,%l2	! %l2 = 00000000000000ff 0000000009000000
!	Mem[0000000030081408] = 80920000, %f10 = 15d01c4e
	lda	[%i2+%o4]0x89,%f10	! %f10 = 80920000
!	Mem[0000000010101420] = 2a659fae, %l2 = 00000000000000ff
	ldsw	[%i4+0x020],%l2		! %l2 = 000000002a659fae
!	Mem[00000000300c1408] = 000000ca, %f3  = 6bfa2267
	lda	[%i3+%o4]0x89,%f3 	! %f3 = 000000ca
!	%l0 = 000000001ff226ff, imm = fffffffffffffdcf, %l3 = 0000000009000000
	sub	%l0,-0x231,%l3		! %l3 = 000000001ff22930
!	Mem[00000000300c1410] = d52c1474000000ff, %f10 = 80920000 6bfa2267
	ldda	[%i3+%o5]0x89,%f10	! %f10 = d52c1474 000000ff

p0_label_49:
!	Starting 10 instruction Store Burst
!	%f8  = 04892a90, Mem[0000000010101424] = 149ffc47
	st	%f8 ,[%i4+0x024]	! Mem[0000000010101424] = 04892a90
!	%l2 = 000000002a659fae, Mem[0000000030101410] = 0000149fe230e237
	stxa	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000002a659fae
!	%l4 = 000000001001d6ad, Mem[0000000010141410] = ff00004800000da6
	stx	%l4,[%i5+%o5]		! Mem[0000000010141410] = 000000001001d6ad
!	%l4 = 1001d6ad, %l5 = 000000ff, Mem[0000000010041410] = ff000000 00000009
	stda	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 1001d6ad 000000ff
!	Mem[0000000010181400] = 6bfa2267, %l7 = 000000006bfa2267
	ldstuba	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000067
!	%l2 = 2a659fae, %l3 = 1ff22930, Mem[00000000300c1408] = 000000ca 00000000
	stda	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 2a659fae 1ff22930
!	Mem[0000000010101420] = 2a659fae, %l1 = 0000000000000007
	swap	[%i4+0x020],%l1		! %l1 = 000000002a659fae
!	%l6 = 00000000c0442636, Mem[00000000201c0000] = 00156378
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 26366378
!	Code Fragment 3, seed = 80802
p0_fragment_7:
!	%l0 = 000000001ff226ff
	setx	0x51faf27153e4dd16,%g7,%l0 ! %l0 = 51faf27153e4dd16
!	%l1 = 000000002a659fae
	setx	0x81ce412a95e4be41,%g7,%l1 ! %l1 = 81ce412a95e4be41
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 51faf27153e4dd16
	setx	0xa671bd481e56737c,%g7,%l0 ! %l0 = a671bd481e56737c
!	%l1 = 81ce412a95e4be41
	setx	0x0c84f3ed662effc7,%g7,%l1 ! %l1 = 0c84f3ed662effc7
p0_fragment_7_end:
!	%l1 = 0c84f3ed662effc7, Mem[0000000010101400] = 586ebfff
	stwa	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = 662effc7

p0_label_50:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 10000000, %l4 = 000000001001d6ad
	ldsba	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000010
!	Mem[0000000010041410] = 1001d6ad, %l1 = 0c84f3ed662effc7
	ldswa	[%i1+%o5]0x80,%l1	! %l1 = 000000001001d6ad
!	Mem[0000000030181408] = 4800000000000000, %l4 = 0000000000000010
	ldxa	[%i6+%o4]0x81,%l4	! %l4 = 4800000000000000
!	Mem[0000000010041410] = 1001d6ad, %l3 = 000000001ff22930
	ldsba	[%i1+%o5]0x80,%l3	! %l3 = 0000000000000010
!	Mem[00000000300c1400] = 286228ff, %l6 = 00000000c0442636
	lduha	[%i3+%g0]0x89,%l6	! %l6 = 00000000000028ff
!	Mem[0000000010081408] = 00000d8c, %l1 = 000000001001d6ad
	ldsba	[%i2+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l4 = 4800000000000000
	lduha	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181400] = 3905660c486f10ff, %f10 = d52c1474 000000ff
	ldda	[%i6+%g0]0x89,%f10	! %f10 = 3905660c 486f10ff
!	Mem[0000000010181400] = ff22fa6b 4e1cd015, %l6 = 000028ff, %l7 = 00000067
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 00000000ff22fa6b 000000004e1cd015
!	Mem[0000000010041410] = 1001d6ad, %l2 = 000000002a659fae
	lduha	[%i1+%o5]0x80,%l2	! %l2 = 0000000000001001

p0_label_51:
!	Starting 10 instruction Store Burst
!	%l2 = 00001001, %l3 = 00000010, Mem[0000000010101400] = c7ff2e66 b2765e09
	stda	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 00001001 00000010
!	Mem[0000000010101400] = 00001001, %l6 = 00000000ff22fa6b
	swapa	[%i4+%g0]0x80,%l6	! %l6 = 0000000000001001
!	Code Fragment 3, seed = 762849
p0_fragment_8:
!	%l0 = a671bd481e56737c
	setx	0xc69c075d75c90a1e,%g7,%l0 ! %l0 = c69c075d75c90a1e
!	%l1 = 0000000000000000
	setx	0x39f6ce6e07dbfcc9,%g7,%l1 ! %l1 = 39f6ce6e07dbfcc9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = c69c075d75c90a1e
	setx	0x7b30a191ae720b84,%g7,%l0 ! %l0 = 7b30a191ae720b84
!	%l1 = 39f6ce6e07dbfcc9
	setx	0xda1b9158d55db94f,%g7,%l1 ! %l1 = da1b9158d55db94f
p0_fragment_8_end:
!	%l0 = ae720b84, %l1 = d55db94f, Mem[0000000010041408] = 1001d6ad 549a634c
	stda	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = ae720b84 d55db94f
!	Mem[0000000030081410] = 04362536, %l2 = 0000000000001001
	ldstuba	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000036
!	%l7 = 000000004e1cd015, Mem[0000000010101408] = 843e72a0
	stha	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = d01572a0
!	%f14 = 324b0b8b 80000000, Mem[0000000010001400] = d89cb2ff 89c20d65
	stda	%f14,[%i0+%g0]0x88	! Mem[0000000010001400] = 324b0b8b 80000000
!	%f26 = 60f2649e 54b1d777, Mem[0000000010101428] = 155184ff fffffc47, %asi = 80
	stda	%f26,[%i4+0x028]%asi	! Mem[0000000010101428] = 60f2649e 54b1d777
!	Mem[0000000010141408] = 00000000, %l1 = 00000000d55db94f
	swap	[%i5+%o4],%l1		! %l1 = 0000000000000000
!	%l5 = 00000000000000ff, Mem[0000000030181410] = ff000000
	stha	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = 00ff0000

p0_label_52:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff22fa6b00000010, %f26 = 60f2649e 54b1d777
	ldda	[%i4+%g0]0x80,%f26	! %f26 = ff22fa6b 00000010
!	Mem[0000000010141408] = 4fb95dd5, %l2 = 0000000000000036
	lduba	[%i5+%o4]0x88,%l2	! %l2 = 00000000000000d5
!	Mem[00000000300c1410] = 000000ff, %l1 = 0000000000000000
	ldswa	[%i3+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1410] = 000000ff, %l2 = 00000000000000d5
	lduba	[%i3+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041410] = 67d93f05 09fa3107, %l0 = ae720b84, %l1 = 000000ff
	ldda	[%i1+%o5]0x89,%l0	! %l0 = 0000000009fa3107 0000000067d93f05
!	Mem[0000000010001400] = 324b0b8b 80000000, %l0 = 09fa3107, %l1 = 67d93f05
	ldda	[%i0+%g0]0x88,%l0	! %l0 = 0000000080000000 00000000324b0b8b
!	Mem[00000000211c0000] = ffff2808, %l4 = 0000000000000000
	ldsh	[%o2+%g0],%l4		! %l4 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000030081400] = 00000000 1b6b89b9 00009280 7fa0ca7f
!	Mem[0000000030081410] = ff253604 4dfc9ff5 7fa1a312 2144839b
!	Mem[0000000030081420] = 495a7860 453b5af1 60f2649e 54b1d777
!	Mem[0000000030081430] = 549a634c 1001d6ad 503c6bea 748cc213
	ldda	[%i2+%g0]ASI_BLK_SL,%f16	! Block Load from 0000000030081400
!	Mem[0000000010041408] = 840b72ae, %l3 = 0000000000000010
	lduba	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000084
!	Mem[0000000030101408] = 47fc9f14, %f2  = ffd01c4e
	lda	[%i4+%o4]0x89,%f2 	! %f2 = 47fc9f14

p0_label_53:
!	Starting 10 instruction Store Burst
!	%l7 = 000000004e1cd015, Mem[00000000211c0001] = ffff2808
	stb	%l7,[%o2+0x001]		! Mem[00000000211c0000] = ff152808
!	%l7 = 000000004e1cd015, Mem[00000000300c1410] = d52c1474000000ff
	stxa	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000004e1cd015
!	Mem[0000000010001400] = 000000808b0b4b32, %l4 = ffffffffffffffff, %l3 = 0000000000000084
	casxa	[%i0]0x80,%l4,%l3	! %l3 = 000000808b0b4b32
!	%f20 = f59ffc4d 043625ff, %l7 = 000000004e1cd015
!	Mem[0000000030141408] = ff518444d049414f
	add	%i5,0x008,%g1
	stda	%f20,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030141408] = ff5136444d49414f
!	%l5 = 00000000000000ff, Mem[000000001008140e] = 590400ff
	sth	%l5,[%i2+0x00e]		! Mem[000000001008140c] = 590400ff
!	Mem[0000000030001410] = ff9273a1, %l1 = 00000000324b0b8b
	ldstuba	[%i0+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1438] = 000000006e1b9200, %l6 = 0000000000001001, %l0 = 0000000080000000
	add	%i3,0x38,%g1
	casxa	[%g1]0x80,%l6,%l0	! %l0 = 000000006e1b9200
!	Mem[000000001010141d] = 2e5e1f6b, %l1 = 00000000000000ff
	ldstub	[%i4+0x01d],%l1		! %l1 = 000000000000005e
!	%f7  = 00000000, Mem[0000000030181410] = 00ff0000
	sta	%f7 ,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	%l1 = 000000000000005e, %l1 = 000000000000005e, %l1 = 000000000000005e
	addc	%l1,%l1,%l1		! %l1 = 00000000000000bc

p0_label_54:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000d8c, %l0 = 000000006e1b9200
	lduha	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081408] = 00009280, %f14 = 324b0b8b
	lda	[%i2+%o4]0x81,%f14	! %f14 = 00009280
!	Mem[0000000010081410] = 00000000, %f10 = 3905660c
	lda	[%i2+%o5]0x88,%f10	! %f10 = 00000000
!	Mem[0000000030101410] = 00000000, %l6 = 0000000000001001
	lduwa	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = ff503d33 ff000048, %l4 = ffffffff, %l5 = 000000ff
	ldda	[%i0+%o5]0x88,%l4	! %l4 = 00000000ff000048 00000000ff503d33
!	Mem[0000000030081410] = 043625ff, %l0 = 0000000000000000
	lduha	[%i2+%o5]0x89,%l0	! %l0 = 00000000000025ff
!	Mem[00000000211c0000] = ff152808, %l6 = 0000000000000000
	ldsh	[%o2+%g0],%l6		! %l6 = ffffffffffffff15
!	%f14 = 00009280, %f2  = 47fc9f14, %f0  = ff000048
	fsubs	%f14,%f2 ,%f0 		! tt=0x22, %l0 = 0000000000002621
!	Mem[0000000030181408] = 48000000, %l4 = 00000000ff000048
	lduba	[%i6+%o4]0x81,%l4	! %l4 = 0000000000000048
!	Mem[000000001008143c] = ff344c54, %l2 = 00000000000000ff
	lduw	[%i2+0x03c],%l2		! %l2 = 00000000ff344c54

p0_label_55:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = ff26f21f, %l2 = 00000000ff344c54
	ldstuba	[%i4+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%l2 = 000000ff, %l3 = 8b0b4b32, Mem[0000000030181408] = 00000048 00000000
	stda	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ff 8b0b4b32
!	Mem[0000000020800041] = ffff3fd8, %l0 = 0000000000002621
	ldstub	[%o1+0x041],%l0		! %l0 = 00000000000000ff
!	Mem[00000000100c1438] = 00000000, %l2 = 00000000000000ff, %asi = 80
	swapa	[%i3+0x038]%asi,%l2	! %l2 = 0000000000000000
!	%l6 = ffffff15, %l7 = 4e1cd015, Mem[0000000010041428] = 00000000 5f8dc122, %asi = 80
	stda	%l6,[%i1+0x028]%asi	! Mem[0000000010041428] = ffffff15 4e1cd015
	membar	#Sync			! Added by membar checker (10)
!	%f25 = 60785a49, Mem[0000000030081408] = 80920000
	sta	%f25,[%i2+%o4]0x89	! Mem[0000000030081408] = 60785a49
!	%l3 = 000000808b0b4b32, Mem[0000000010081410] = 00000000
	stba	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = 32000000
!	%f6  = cf954029 00000000, %l2 = 0000000000000000
!	Mem[0000000030081410] = ff2536044dfc9ff5
	add	%i2,0x010,%g1
	stda	%f6,[%g1+%l2]ASI_PST32_SL ! Mem[0000000030081410] = ff2536044dfc9ff5
!	Mem[0000000010101400] = ff22fa6b, %l2 = 0000000000000000
	ldstuba	[%i4+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1412] = 00000000, %l6 = ffffffffffffff15
	ldstuba	[%i3+0x012]%asi,%l6	! %l6 = 0000000000000000

p0_label_56:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ffffffff, %l4 = 0000000000000048
	ldsha	[%i6+%o5]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[000000001018142a] = 530cf66e, %l3 = 000000808b0b4b32, %asi = 80
	ldsha	[%i6+0x02a]%asi,%l3	! %l3 = fffffffffffff66e
!	Mem[0000000010041400] = 04892a90286228ff, %f0  = ff000048 00000da6
	ldda	[%i1+%g0]0x88,%f0 	! %f0  = 04892a90 286228ff
!	Mem[0000000010041408] = ae720b84, %l1 = 00000000000000bc
	lduwa	[%i1+%o4]0x88,%l1	! %l1 = 00000000ae720b84
!	Mem[0000000010141434] = 33e34edd, %l6 = 0000000000000000
	ldstub	[%i5+0x034],%l6		! %l6 = 0000000000000033
!	Mem[0000000010141410] = 00000000, %f11 = 486f10ff
	lda	[%i5+%o5]0x80,%f11	! %f11 = 00000000
!	Mem[0000000021800080] = 7ec0c898, %l2 = 00000000000000ff
	ldsb	[%o3+0x080],%l2		! %l2 = 000000000000007e
!	Mem[0000000010041420] = 4f4149d0, %f11 = 00000000
	ld	[%i1+0x020],%f11	! %f11 = 4f4149d0
!	Mem[0000000010181416] = ffffffff, %l6 = 0000000000000033, %asi = 80
	lduha	[%i6+0x016]%asi,%l6	! %l6 = 000000000000ffff
!	%l4 = ffffffffffffffff, %l7 = 000000004e1cd015, %y  = 000000ff
	smul	%l4,%l7,%l3		! %l3 = ffffffffb1e32feb, %y = ffffffff

p0_label_57:
!	Starting 10 instruction Store Burst
!	%l7 = 000000004e1cd015, Mem[0000000010101408] = 3416a512a07215d0
	stxa	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000004e1cd015
!	Mem[0000000010101408] = 15d01c4e, %l0 = 00000000000000ff
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 0000000015d01c4e
!	%f28 = add60110 4c639a54, Mem[0000000010181410] = ffffffff ffffffff, %asi = 80
	stda	%f28,[%i6+0x010]%asi	! Mem[0000000010181410] = add60110 4c639a54
!	%l6 = 000000000000ffff, Mem[0000000010141408] = d55db94f
	stba	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = ff5db94f
!	%l4 = ffffffffffffffff, Mem[0000000010101410] = 1ff226ff
	stba	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 1ff226ff
!	Mem[0000000010181410] = add601104c639a54, %l5 = 00000000ff503d33, %l2 = 000000000000007e
	add	%i6,0x10,%g1
	casxa	[%g1]0x80,%l5,%l2	! %l2 = add601104c639a54
!	%l7 = 000000004e1cd015, Mem[0000000010141410] = 00000000
	stba	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 15000000
!	Mem[0000000030141408] = ff513644, %l4 = 00000000ffffffff
	swapa	[%i5+%o4]0x81,%l4	! %l4 = 00000000ff513644
!	%f18 = 7fcaa07f, Mem[0000000030001400] = 67d93f05
	sta	%f18,[%i0+%g0]0x81	! Mem[0000000030001400] = 7fcaa07f
!	%l3 = ffffffffb1e32feb, Mem[00000000211c0001] = ff152808
	stb	%l3,[%o2+0x001]		! Mem[00000000211c0000] = ffeb2808

p0_label_58:
!	Starting 10 instruction Load Burst
!	%l5 = 00000000ff503d33, %l4 = 00000000ff513644, %y  = ffffffff
	sdiv	%l5,%l4,%l4		! %l4 = 0000000000000001
	mov	%l0,%y			! %y = 15d01c4e
!	%l2 = add601104c639a54, %l0 = 0000000015d01c4e, %l5 = 00000000ff503d33
	or	%l2,%l0,%l5		! %l5 = add601105df39e5e
!	Mem[0000000010081418] = 6722fa6b, %l3 = ffffffffb1e32feb
	ldsw	[%i2+0x018],%l3		! %l3 = 000000006722fa6b
!	Mem[0000000030041400] = 6bfa226700000000, %l0 = 0000000015d01c4e
	ldxa	[%i1+%g0]0x81,%l0	! %l0 = 6bfa226700000000
!	Mem[0000000010001410] = ff503d33 ff000048, %l0 = 00000000, %l1 = ae720b84
	ldda	[%i0+%o5]0x88,%l0	! %l0 = 00000000ff000048 00000000ff503d33
!	Mem[0000000010181410] = add60110, %l2 = add601104c639a54
	lduba	[%i6+%o5]0x80,%l2	! %l2 = 00000000000000ad
!	Mem[0000000010101400] = 6bfa22ff, %l7 = 000000004e1cd015
	lduha	[%i4+%g0]0x88,%l7	! %l7 = 00000000000022ff
!	Mem[0000000010041430] = 51872fbc, %l2 = 00000000000000ad
	lduw	[%i1+0x030],%l2		! %l2 = 0000000051872fbc
!	Mem[0000000010001400] = 00000080 8b0b4b32, %l6 = 0000ffff, %l7 = 000022ff
	ldda	[%i0+%g0]0x80,%l6	! %l6 = 0000000000000080 000000008b0b4b32
!	Mem[0000000030081400] = 00000000, %l1 = 00000000ff503d33
	ldsba	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000000

p0_label_59:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 0000ff00, %l7 = 000000008b0b4b32
	ldstuba	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181400] = ff106f48, %l3 = 000000006722fa6b
	ldstuba	[%i6+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[000000001000143e] = 0cdfe063, %l6 = 0000000000000080
	ldstub	[%i0+0x03e],%l6		! %l6 = 00000000000000e0
!	%l2 = 0000000051872fbc, Mem[0000000030041408] = 586ebf0934055e2d
	stxa	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000000051872fbc
!	%l4 = 0000000000000001, Mem[00000000100c1410] = ff00ff00294095cf
	stx	%l4,[%i3+%o5]		! Mem[00000000100c1410] = 0000000000000001
!	%l3 = 00000000000000ff, Mem[0000000010101400] = ff22fa6b00000010
	stxa	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000000000ff
!	Mem[0000000010001408] = 00000000, %l6 = 00000000000000e0
	ldstuba	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1410] = 4e1cd015, %l2 = 0000000051872fbc
	swapa	[%i3+%o5]0x89,%l2	! %l2 = 000000004e1cd015
!	%f5  = ffffffff, Mem[0000000010001400] = 00000080
	sta	%f5 ,[%i0+%g0]0x80	! Mem[0000000010001400] = ffffffff
!	%f10 = 00000000, Mem[0000000030141410] = 48000000
	sta	%f10,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000

p0_label_60:
!	Starting 10 instruction Load Burst
!	%f0  = 04892a90, %f11 = 4f4149d0
	fcmpes	%fcc0,%f0 ,%f11		! %fcc0 = 1
!	Mem[00000000300c1400] = 286228ff, %l7 = 0000000000000000
	ldsha	[%i3+%g0]0x89,%l7	! %l7 = 00000000000028ff
!	%l3 = 00000000000000ff, immd = fffffffffffff8d1, %l108 = 0000000000000002
	udivx	%l3,-0x72f,%l2		! %l2 = 0000000000000000
!	Mem[0000000030081410] = f59ffc4d043625ff, %l5 = add601105df39e5e
	ldxa	[%i2+%o5]0x89,%l5	! %l5 = f59ffc4d043625ff
!	Mem[0000000010041410] = add60110, %l2 = 0000000000000000
	lduwa	[%i1+%o5]0x88,%l2	! %l2 = 00000000add60110
!	Mem[00000000100c1434] = 64f7bd1d, %l6 = 0000000000000000, %asi = 80
	ldsha	[%i3+0x034]%asi,%l6	! %l6 = 00000000000064f7
!	Mem[0000000030081410] = ff2536044dfc9ff5, %l1 = 0000000000000000
	ldxa	[%i2+%o5]0x81,%l1	! %l1 = ff2536044dfc9ff5
!	Mem[0000000030081408] = 7fcaa07f 60785a49, %l4 = 00000001, %l5 = 043625ff
	ldda	[%i2+%o4]0x89,%l4	! %l4 = 0000000060785a49 000000007fcaa07f
!	Mem[0000000010001410] = ff503d33ff000048, %l6 = 00000000000064f7
	ldxa	[%i0+%o5]0x88,%l6	! %l6 = ff503d33ff000048
!	Mem[0000000010081400] = 000000ff, %l2 = 00000000add60110
	lduba	[%i2+%g0]0x88,%l2	! %l2 = 00000000000000ff

p0_label_61:
!	Starting 10 instruction Store Burst
!	%l4 = 60785a49, %l5 = 7fcaa07f, Mem[0000000030101400] = 3626306e afb3c63f
	stda	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 60785a49 7fcaa07f
!	Mem[0000000010101408] = 000000ff, %l0 = 00000000ff000048
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	%f16 = b9896b1b, Mem[0000000030001408] = 8b0b4b32
	sta	%f16,[%i0+%o4]0x81	! Mem[0000000030001408] = b9896b1b
!	%f2  = 47fc9f14 000000ca, Mem[0000000010101410] = ff26f21f 3fc6b3af
	std	%f2 ,[%i4+%o5]		! Mem[0000000010101410] = 47fc9f14 000000ca
!	Mem[0000000030081400] = 00000000, %l5 = 000000007fcaa07f
	swapa	[%i2+%g0]0x81,%l5	! %l5 = 0000000000000000
!	%f20 = f59ffc4d 043625ff, %l1 = ff2536044dfc9ff5
!	Mem[0000000030141408] = ffffffff4d49414f
	add	%i5,0x008,%g1
	stda	%f20,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030141408] = ff25ffff4dfc414f
!	%l5 = 0000000000000000, Mem[00000000211c0001] = ffeb2808, %asi = 80
	stba	%l5,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff002808
!	%l4 = 0000000060785a49, Mem[0000000030141400] = 00000000000000ff
	stxa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000060785a49
!	Mem[0000000010181400] = ff22fa6b 4e1cd015 10000000 00000000
!	%f16 = b9896b1b 00000000 7fcaa07f 80920000
!	%f20 = f59ffc4d 043625ff 9b834421 12a3a17f
!	%f24 = f15a3b45 60785a49 77d7b154 9e64f260
!	%f28 = add60110 4c639a54 13c28c74 ea6b3c50
	stda	%f16,[%i6+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010181400
!	Mem[0000000030041400] = 6722fa6b, %l4 = 0000000060785a49
	swapa	[%i1+%g0]0x89,%l4	! %l4 = 000000006722fa6b

p0_label_62:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010181400] = 00000000, %l2 = 00000000000000ff
	lduwa	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000020800001] = 201053a8, %l5 = 0000000000000000
	ldsb	[%o1+0x001],%l5		! %l5 = 0000000000000010
!	Mem[0000000010001400] = 324b0b8bffffffff, %l0 = 0000000000000000
	ldxa	[%i0+%g0]0x88,%l0	! %l0 = 324b0b8bffffffff
!	Mem[0000000010101410] = ca000000 149ffc47, %l6 = ff000048, %l7 = 000028ff
	ldda	[%i4+%o5]0x88,%l6	! %l6 = 00000000149ffc47 00000000ca000000
!	Mem[0000000030181400] = ff106f48 0c660539 ff000000 324b0b8b
!	Mem[0000000030181410] = 00000000 7df6dc1f 1def7892 6677931b
!	Mem[0000000030181420] = 265199e0 3a330671 590a321e 61ebfef7
!	Mem[0000000030181430] = 00923ccc 8b0b5a2d 51dfb16a 33998193
	ldda	[%i6+%g0]ASI_BLK_AIUSL,%f0 	! Block Load from 0000000030181400
!	Mem[000000001014140c] = 650c0b2f, %f22 = 9b834421
	lda	[%i5+0x00c]%asi,%f22	! %f22 = 650c0b2f
!	Mem[00000000300c1400] = ff286228, %l1 = ff2536044dfc9ff5
	lduba	[%i3+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	%f18 = 7fcaa07f, %f10 = f7feeb61, %f31 = ea6b3c50
	fadds	%f18,%f10,%f31		! %f31 = 7fcaa07f
!	Mem[0000000010141400] = 306e00005e6aefef, %l1 = 00000000000000ff
	ldxa	[%i5+%g0]0x80,%l1	! %l1 = 306e00005e6aefef
!	Mem[0000000030001400] = 7fa0ca7f, %l7 = 00000000ca000000
	ldswa	[%i0+%g0]0x89,%l7	! %l7 = 000000007fa0ca7f

p0_label_63:
!	Starting 10 instruction Store Burst
!	%f21 = 043625ff, Mem[00000000100c1408] = ffd01c4e
	sta	%f21,[%i3+%o4]0x80	! Mem[00000000100c1408] = 043625ff
!	%l4 = 000000006722fa6b, Mem[00000000100c1400] = 15000000
	stba	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 1500006b
!	Mem[00000000300c1400] = ff286228 55f8e099 ae9f652a 3029f21f
!	%f16 = b9896b1b 00000000 7fcaa07f 80920000
!	%f20 = f59ffc4d 043625ff 650c0b2f 12a3a17f
!	%f24 = f15a3b45 60785a49 77d7b154 9e64f260
!	%f28 = add60110 4c639a54 13c28c74 7fcaa07f
	stda	%f16,[%i3+%g0]ASI_BLK_S	! Block Store to 00000000300c1400
!	Mem[0000000030181410] = 00000000, %l1 = 306e00005e6aefef
	ldstuba	[%i6+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%l0 = 324b0b8bffffffff, Mem[0000000010041410] = 1001d6ad
	stha	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffd6ad
!	%f6  = 1b937766 9278ef1d, Mem[0000000010101438] = 0731fa09 053fd967
	std	%f6 ,[%i4+0x038]	! Mem[0000000010101438] = 1b937766 9278ef1d
!	Mem[0000000010181408] = 80920000, %l3 = 00000000000000ff
	swapa	[%i6+%o4]0x88,%l3	! %l3 = 0000000080920000
!	%l0 = 324b0b8bffffffff, Mem[0000000010101400] = 00000000
	stwa	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffffff
!	%l1 = 0000000000000000, Mem[0000000010181400] = 00000000
	stha	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	%l6 = 149ffc47, %l7 = 7fa0ca7f, Mem[0000000010041410] = ffffd6ad 000000ff, %asi = 80
	stda	%l6,[%i1+0x010]%asi	! Mem[0000000010041410] = 149ffc47 7fa0ca7f

p0_label_64:
!	Starting 10 instruction Load Burst
!	Mem[00000000218000c1] = 10f7a0c8, %l6 = 00000000149ffc47
	ldsb	[%o3+0x0c1],%l6		! %l6 = fffffffffffffff7
!	Mem[0000000030181408] = ff000000, %l1 = 0000000000000000
	ldsha	[%i6+%o4]0x81,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000010081400] = 000000ff, %l2 = 0000000000000000
	ldsha	[%i2+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041408] = 840b72ae 4fb95dd5, %l4 = 6722fa6b, %l5 = 00000010
	ldda	[%i1+%o4]0x80,%l4	! %l4 = 00000000840b72ae 000000004fb95dd5
!	Code Fragment 3, seed = 942064
p0_fragment_9:
!	%l0 = 324b0b8bffffffff
	setx	0x29434215099768a6,%g7,%l0 ! %l0 = 29434215099768a6
!	%l1 = ffffffffffffff00
	setx	0x989911f838a4b4d1,%g7,%l1 ! %l1 = 989911f838a4b4d1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 29434215099768a6
	setx	0xf82dff6b3d43e50c,%g7,%l0 ! %l0 = f82dff6b3d43e50c
!	%l1 = 989911f838a4b4d1
	setx	0x9852b242f3acfc57,%g7,%l1 ! %l1 = 9852b242f3acfc57
p0_fragment_9_end:
!	Mem[0000000010141410] = 15000000, %l0 = f82dff6b3d43e50c, %asi = 80
	ldswa	[%i5+0x010]%asi,%l0	! %l0 = 0000000015000000
	membar	#Sync			! Added by membar checker (12)
!	Mem[00000000300c1408] = 7fcaa07f, %l3 = 0000000080920000
	lduwa	[%i3+%o4]0x81,%l3	! %l3 = 000000007fcaa07f
!	Mem[0000000030001410] = a17392ff, %l4 = 00000000840b72ae
	ldswa	[%i0+%o5]0x89,%l4	! %l4 = ffffffffa17392ff
!	Mem[0000000030081408] = 495a7860, %l1 = 9852b242f3acfc57
	ldsha	[%i2+%o4]0x81,%l1	! %l1 = 000000000000495a
!	Mem[00000000100c141e] = 324b0b8b, %l1 = 000000000000495a, %asi = 80
	lduha	[%i3+0x01e]%asi,%l1	! %l1 = 0000000000000b8b

p0_label_65:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = ffffffff 8b0b4b32 ff000000 c04095cf
!	%f16 = b9896b1b 00000000 7fcaa07f 80920000
!	%f20 = f59ffc4d 043625ff 650c0b2f 12a3a17f
!	%f24 = f15a3b45 60785a49 77d7b154 9e64f260
!	%f28 = add60110 4c639a54 13c28c74 7fcaa07f
	stda	%f16,[%i0+%g0]ASI_COMMIT_P	! Block Store to 0000000010001400
!	%l1 = 0000000000000b8b, Mem[0000000030041410] = 09fa3107
	stba	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = 09fa318b
!	Mem[0000000030001408] = b9896b1b, %l3 = 000000007fcaa07f
	swapa	[%i0+%o4]0x81,%l3	! %l3 = 00000000b9896b1b
!	Mem[0000000030101408] = 149ffc47, %l7 = 000000007fa0ca7f
	swapa	[%i4+%o4]0x81,%l7	! %l7 = 00000000149ffc47
!	%l0 = 15000000, %l1 = 00000b8b, Mem[00000000100c1400] = 1500006b 29ef943c
	stda	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 15000000 00000b8b
!	%l7 = 00000000149ffc47, Mem[00000000201c0000] = 26366378, %asi = 80
	stba	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = 47366378
!	Mem[0000000030101400] = 495a7860 7fa0ca7f 7fa0ca7f 2de9263f
!	%f16 = b9896b1b 00000000 7fcaa07f 80920000
!	%f20 = f59ffc4d 043625ff 650c0b2f 12a3a17f
!	%f24 = f15a3b45 60785a49 77d7b154 9e64f260
!	%f28 = add60110 4c639a54 13c28c74 7fcaa07f
	stda	%f16,[%i4+%g0]ASI_COMMIT_S	! Block Store to 0000000030101400
!	%l2 = 00000000000000ff, Mem[0000000010141408] = 2f0b0c654fb95dff
	stxa	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000000000ff
	membar	#Sync			! Added by membar checker (13)
!	Mem[0000000010101410] = 149ffc47, %l3 = 00000000b9896b1b
	ldstuba	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000047
!	%l2 = 00000000000000ff, Mem[0000000010141422] = 6722fa6b
	sth	%l2,[%i5+0x022]		! Mem[0000000010141420] = 672200ff

p0_label_66:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff002808, %l4 = ffffffffa17392ff, %asi = 80
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = ffffffffffffff00
!	%f22 = 650c0b2f, %f9  = e0995126, %f20 = f59ffc4d
	fadds	%f22,%f9 ,%f20		! %f20 = 650bbe86
!	Mem[0000000010181410] = 043625ff, %l5 = 000000004fb95dd5
	lduba	[%i6+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101400] = ffffffff, %l2 = 00000000000000ff
	lduba	[%i4+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101410] = f59ffc4d, %f10 = f7feeb61
	lda	[%i4+%o5]0x81,%f10	! %f10 = f59ffc4d
!	Mem[0000000030041400] = 495a7860, %l4 = ffffffffffffff00
	lduha	[%i1+%g0]0x81,%l4	! %l4 = 000000000000495a
!	Mem[0000000010041400] = ff286228 902a8904 840b72ae 4fb95dd5
!	Mem[0000000010041410] = 149ffc47 7fa0ca7f 37e230e2 5428f3cb
!	Mem[0000000010041420] = 4f4149d0 3dcd40a1 ffffff15 4e1cd015
!	Mem[0000000010041430] = 51872fbc 0508eb5d 15d01c4e 6bfa2267
	ldda	[%i1+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	Mem[0000000030081400] = 7fcaa07f 1b6b89b9 495a7860 7fa0ca7f
!	Mem[0000000030081410] = ff253604 4dfc9ff5 7fa1a312 2144839b
!	Mem[0000000030081420] = 495a7860 453b5af1 60f2649e 54b1d777
!	Mem[0000000030081430] = 549a634c 1001d6ad 503c6bea 748cc213
	ldda	[%i2+%g0]ASI_BLK_SL,%f16	! Block Load from 0000000030081400
!	Mem[0000000030081400] = 7fcaa07f, %l1 = 0000000000000b8b
	ldswa	[%i2+%g0]0x81,%l1	! %l1 = 000000007fcaa07f
!	Mem[0000000010101408] = ff0000ff, %l0 = 0000000015000000
	lduwa	[%i4+%o4]0x88,%l0	! %l0 = 00000000ff0000ff

p0_label_67:
!	Starting 10 instruction Store Burst
!	%f26 = 77d7b154 9e64f260, %l3 = 0000000000000047
!	Mem[0000000030141438] = 1a8e380a5e1949b3
	add	%i5,0x038,%g1
	stda	%f26,[%g1+%l3]ASI_PST16_SL ! Mem[0000000030141438] = 60f2649e54b149b3
!	Mem[0000000010081408] = 00000d8c, %l4 = 000000000000495a
	ldstuba	[%i2+%o4]0x80,%l4	! %l4 = 0000000000000000
!	%f22 = 9b834421 12a3a17f, %l5 = 00000000000000ff
!	Mem[0000000030181420] = 265199e03a330671
	add	%i6,0x020,%g1
	stda	%f22,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030181420] = 7fa1a3122144839b
!	%f30 = 13c28c74, Mem[0000000030001410] = ff9273a1
	sta	%f30,[%i0+%o5]0x81	! Mem[0000000030001410] = 13c28c74
!	Mem[00000000100c1408] = ff253604, %l4 = 0000000000000000
	ldstuba	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000004
!	%l2 = 00000000000000ff, Mem[0000000030141400] = 60785a49
	stha	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 607800ff
!	Mem[0000000010001428] = 77d7b1549e64f260, %l3 = 0000000000000047, %l2 = 00000000000000ff
	add	%i0,0x28,%g1
	casxa	[%g1]0x80,%l3,%l2	! %l2 = 77d7b1549e64f260
!	Mem[0000000030181400] = ff106f48 0c660539 ff000000 324b0b8b
!	%f0  = 3905660c 486f10ff 8b0b4b32 000000ff
!	%f4  = 1fdcf67d 00000000 1b937766 9278ef1d
!	%f8  = 7106333a e0995126 f59ffc4d 1e320a59
!	%f12 = 2d5a0b8b cc3c9200 93819933 6ab1df51
	stda	%f0 ,[%i6+%g0]ASI_BLK_S	! Block Store to 0000000030181400
!	%l2 = 77d7b1549e64f260, Mem[0000000020800041] = ffff3fd8
	stb	%l2,[%o1+0x041]		! Mem[0000000020800040] = ff603fd8
!	%l4 = 0000000000000004, Mem[0000000030041400] = 495a7860
	stha	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 00047860

p0_label_68:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff000000 ffffffff, %l4 = 00000004, %l5 = 000000ff
	ldda	[%i4+%g0]0x88,%l4	! %l4 = 00000000ffffffff 00000000ff000000
!	Mem[0000000010101410] = fffc9f14, %l2 = 77d7b1549e64f260
	lduha	[%i4+%o5]0x80,%l2	! %l2 = 000000000000fffc
!	Mem[0000000010001400] = 00000000 1b6b89b9, %l0 = ff0000ff, %l1 = 7fcaa07f
	ldda	[%i0+%g0]0x88,%l0	! %l0 = 000000001b6b89b9 0000000000000000
!	Mem[00000000100c1418] = 2e2fbbc2 324b0b8b, %l0 = 1b6b89b9, %l1 = 00000000, %asi = 80
	ldda	[%i3+0x018]%asi,%l0	! %l0 = 000000002e2fbbc2 00000000324b0b8b
!	%l0 = 000000002e2fbbc2, immd = fffffffffffffcf7, %l108 = 0000000000000007
	sdivx	%l0,-0x309,%l7		! %l7 = fffffffffff0c869
!	Mem[00000000100c1408] = ff3625ff 6bfa2267, %l4 = ffffffff, %l5 = ff000000
	ldda	[%i3+%o4]0x80,%l4	! %l4 = 00000000ff3625ff 000000006bfa2267
!	Mem[0000000010081408] = ff000d8c, %l0 = 000000002e2fbbc2
	lduwa	[%i2+%o4]0x80,%l0	! %l0 = 00000000ff000d8c
!	Mem[0000000010001408] = 7fcaa07f, %f27 = 9e64f260
	lda	[%i0+%o4]0x80,%f27	! %f27 = 7fcaa07f
!	Mem[000000001014140c] = 00000000, %l2 = 000000000000fffc
	lduh	[%i5+0x00c],%l2		! %l2 = 0000000000000000
!	%l6 = fffffffffffffff7, immd = 00000b5e, %y  = 15d01c4e
	smul	%l6,0xb5e,%l2		! %l2 = ffffffffffff99b2, %y = ffffffff

p0_label_69:
!	Starting 10 instruction Store Burst
!	%f28 = add60110, Mem[0000000030181400] = 3905660c
	sta	%f28,[%i6+%g0]0x81	! Mem[0000000030181400] = add60110
!	Mem[0000000030101408] = 7fcaa07f, %l1 = 00000000324b0b8b
	ldstuba	[%i4+%o4]0x81,%l1	! %l1 = 000000000000007f
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000010181408] = ff000000, %l5 = 000000006bfa2267
	swapa	[%i6+%o4]0x80,%l5	! %l5 = 00000000ff000000
!	%l7 = fffffffffff0c869, Mem[0000000010041408] = d55db94fae720b84
	stxa	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = fffffffffff0c869
!	%f10 = f59ffc4d, Mem[0000000010041410] = 47fc9f14
	sta	%f10,[%i1+%o5]0x88	! Mem[0000000010041410] = f59ffc4d
!	%l5 = 00000000ff000000, Mem[0000000030081410] = f59ffc4d043625ff
	stxa	%l5,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000ff000000
!	%l4 = 00000000ff3625ff, Mem[0000000010101400] = ffffffff
	stba	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffffff
!	Mem[0000000010041428] = ffffff15, %l5 = 00000000ff000000
	swap	[%i1+0x028],%l5		! %l5 = 00000000ffffff15
!	%l2 = ffffffffffff99b2, Mem[0000000010041400] = 286228ff
	stwa	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = ffff99b2
!	%l7 = fffffffffff0c869, Mem[0000000010181408] = 6bfa2267
	stha	%l7,[%i6+%o4]0x80	! Mem[0000000010181408] = c8692267

p0_label_70:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101428] = 60f2649e, %l2 = ffffffffffff99b2, %asi = 80
	lduba	[%i4+0x028]%asi,%l2	! %l2 = 0000000000000060
!	Mem[0000000030081410] = ff000000, %f1  = 486f10ff
	lda	[%i2+%o5]0x89,%f1 	! %f1 = ff000000
!	Mem[0000000030001410] = 36c4b294748cc213, %l7 = fffffffffff0c869
	ldxa	[%i0+%o5]0x89,%l7	! %l7 = 36c4b294748cc213
!	Mem[0000000030041410] = 8b31fa09053fd967, %f16 = b9896b1b 7fa0ca7f
	ldda	[%i1+%o5]0x81,%f16	! %f16 = 8b31fa09 053fd967
!	Mem[00000000100c1400] = 000000158b0b0000, %f2  = 8b0b4b32 000000ff
	ldda	[%i3+%g0]0x80,%f2 	! %f2  = 00000015 8b0b0000
!	Mem[0000000010081424] = 5a256745, %l1 = 000000000000007f
	ldsw	[%i2+0x024],%l1		! %l1 = 000000005a256745
!	%f9  = e0995126, %f0  = 3905660c, %f23 = 12a3a17f
	fdivs	%f9 ,%f0 ,%f23		! %f23 = e7131cbe
!	Mem[0000000010041408] = 69c8f0ff, %l6 = fffffffffffffff7
	ldswa	[%i1+%o4]0x80,%l6	! %l6 = 0000000069c8f0ff
!	Mem[0000000010181408] = 672269c8, %l3 = 0000000000000047
	lduha	[%i6+%o4]0x88,%l3	! %l3 = 00000000000069c8
!	Mem[00000000201c0000] = 47366378, %l3 = 00000000000069c8
	lduh	[%o0+%g0],%l3		! %l3 = 0000000000004736

p0_label_71:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ffffff15, Mem[0000000030101410] = 4dfc9ff5
	stba	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 4dfc9f15
!	Mem[0000000010081410] = 32000000, %l5 = 00000000ffffff15
	swapa	[%i2+%o5]0x80,%l5	! %l5 = 0000000032000000
!	Mem[0000000030101410] = 4dfc9f15, %l1 = 000000005a256745
	swapa	[%i4+%o5]0x89,%l1	! %l1 = 000000004dfc9f15
!	%f24 = f15a3b45, Mem[000000001018143c] = 748cc213
	sta	%f24,[%i6+0x03c]%asi	! Mem[000000001018143c] = f15a3b45
!	Mem[00000000100c1410] = 00000000, %l2 = 0000000000000060
	swapa	[%i3+%o5]0x80,%l2	! %l2 = 0000000000000000
!	%l7 = 36c4b294748cc213, immd = fffff92f, %y  = ffffffff
	smul	%l7,-0x6d1,%l0		! %l0 = fffffce58c891c7d, %y = fffffce5
!	%f30 = 13c28c74 ea6b3c50, Mem[0000000010141410] = 15000000 1001d6ad, %asi = 80
	stda	%f30,[%i5+0x010]%asi	! Mem[0000000010141410] = 13c28c74 ea6b3c50
!	%l1 = 000000004dfc9f15, Mem[0000000010181410] = ff253604
	stwa	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = 4dfc9f15
!	%f4  = 1fdcf67d 00000000, Mem[0000000010141410] = 13c28c74 ea6b3c50
	stda	%f4 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 1fdcf67d 00000000
!	%l2 = 0000000000000000, Mem[0000000030001400] = 7fa0ca7f
	stha	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 7fa00000

p0_label_72:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 4dfc9f15, %l0 = fffffce58c891c7d
	lduba	[%i6+%o5]0x80,%l0	! %l0 = 000000000000004d
!	%f27 = 7fcaa07f, %f8  = 7106333a, %f18 = 7fcaa07f 60785a49
	fsmuld	%f27,%f8 ,%f18		! %f18 = 7ff9540f e0000000
!	Mem[0000000030141410] = 00000000, %l2 = 0000000000000000
	lduha	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081400] = 7fa0ca7f, %l1 = 000000004dfc9f15
	ldswa	[%i2+%g0]0x89,%l1	! %l1 = 000000007fa0ca7f
!	Code Fragment 3, seed = 282863
p0_fragment_10:
!	%l0 = 000000000000004d
	setx	0x28441a0c01c40fae,%g7,%l0 ! %l0 = 28441a0c01c40fae
!	%l1 = 000000007fa0ca7f
	setx	0x1a9aedc2b3834d59,%g7,%l1 ! %l1 = 1a9aedc2b3834d59
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 28441a0c01c40fae
	setx	0x648cbeed182fb714,%g7,%l0 ! %l0 = 648cbeed182fb714
!	%l1 = 1a9aedc2b3834d59
	setx	0xcd0ce36924becfdf,%g7,%l1 ! %l1 = cd0ce36924becfdf
p0_fragment_10_end:
!	Mem[00000000300c1400] = b9896b1b 00000000, %l4 = ff3625ff, %l5 = 32000000
	ldda	[%i3+%g0]0x81,%l4	! %l4 = 00000000b9896b1b 0000000000000000
!	Mem[0000000030081408] = 60785a49, %l1 = cd0ce36924becfdf
	ldswa	[%i2+%o4]0x89,%l1	! %l1 = 0000000060785a49
!	Mem[0000000010081400] = 000000ff, %l3 = 0000000000004736
	lduha	[%i2+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001418] = 650c0b2f, %f28 = add60110
	ld	[%i0+0x018],%f28	! %f28 = 650c0b2f
!	Mem[0000000010141400] = 306e0000 5e6aefef, %l6 = 69c8f0ff, %l7 = 748cc213
	ldda	[%i5+%g0]0x80,%l6	! %l6 = 00000000306e0000 000000005e6aefef

p0_label_73:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000060785a49, Mem[0000000010141410] = 1fdcf67d
	stba	%l1,[%i5+%o5]0x80	! Mem[0000000010141410] = 49dcf67d
!	%l6 = 00000000306e0000, Mem[0000000010101418] = 06cad104
	stw	%l6,[%i4+0x018]		! Mem[0000000010101418] = 306e0000
!	%f30 = 13c28c74 ea6b3c50, Mem[0000000030081400] = 7fa0ca7f b9896b1b
	stda	%f30,[%i2+%g0]0x89	! Mem[0000000030081400] = 13c28c74 ea6b3c50
!	Mem[0000000030081410] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0000] = 47366378, %l7 = 000000005e6aefef
	ldstub	[%o0+%g0],%l7		! %l7 = 0000000000000047
!	%f21 = 043625ff, Mem[0000000030101408] = ffcaa07f
	sta	%f21,[%i4+%o4]0x81	! Mem[0000000030101408] = 043625ff
!	Mem[000000001018140c] = 7fa0ca7f, %l6 = 00000000306e0000, %asi = 80
	swapa	[%i6+0x00c]%asi,%l6	! %l6 = 000000007fa0ca7f
!	%f10 = f59ffc4d 1e320a59, Mem[0000000010081408] = 8c0d00ff ff000459
	stda	%f10,[%i2+%o4]0x88	! Mem[0000000010081408] = f59ffc4d 1e320a59
!	%f6  = 1b937766 9278ef1d, Mem[00000000100c1418] = 2e2fbbc2 324b0b8b
	std	%f6 ,[%i3+0x018]	! Mem[00000000100c1418] = 1b937766 9278ef1d
!	Mem[0000000010101438] = 1b937766, %l5 = 00000000, %l2 = 00000000
	add	%i4,0x38,%g1
	casa	[%g1]0x80,%l5,%l2	! %l2 = 000000001b937766

p0_label_74:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff000000ffffffff, %f16 = 8b31fa09 053fd967
	ldda	[%i4+%g0]0x88,%f16	! %f16 = ff000000 ffffffff
!	Mem[0000000010081408] = 590a321e 4dfc9ff5, %l4 = b9896b1b, %l5 = 00000000
	ldda	[%i2+%o4]0x80,%l4	! %l4 = 00000000590a321e 000000004dfc9ff5
!	Mem[0000000010041408] = fff0c869, %l6 = 000000007fa0ca7f
	ldsha	[%i1+%o4]0x88,%l6	! %l6 = ffffffffffffc869
!	Mem[00000000201c0000] = ff366378, %l5 = 000000004dfc9ff5
	ldsh	[%o0+%g0],%l5		! %l5 = ffffffffffffff36
!	Mem[0000000030081410] = 00000000ff0000ff, %f14 = 93819933 6ab1df51
	ldda	[%i2+%o5]0x89,%f14	! %f14 = 00000000 ff0000ff
!	%f18 = 7ff9540f, %f18 = 7ff9540f, %f3  = 8b0b0000
	fdivs	%f18,%f18,%f3 		! %f3  = 7ff9540f
!	Mem[00000000100c1400] = 15000000, %l2 = 000000001b937766
	ldswa	[%i3+%g0]0x88,%l2	! %l2 = 0000000015000000
!	Mem[0000000030141400] = ff007860, %l3 = 00000000000000ff
	lduba	[%i5+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081408] = 60785a49, %l1 = 0000000060785a49
	ldsba	[%i2+%o4]0x89,%l1	! %l1 = 0000000000000049
!	Mem[0000000010001400] = b9896b1b, %l6 = ffffffffffffc869
	lduwa	[%i0+%g0]0x80,%l6	! %l6 = 00000000b9896b1b

p0_label_75:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = fffc9f14, %l1 = 0000000000000049
	ldstuba	[%i4+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%l4 = 590a321e, %l5 = ffffff36, Mem[0000000030141410] = 00000000 95d67214
	stda	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 590a321e ffffff36
!	%f4  = 1fdcf67d 00000000, Mem[0000000030101410] = 5a256745 ff253604
	stda	%f4 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 1fdcf67d 00000000
!	%l4 = 00000000590a321e, Mem[0000000010101410] = fffc9f14000000ca
	stxa	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000590a321e
!	%l7 = 0000000000000047, Mem[0000000010001410] = f59ffc4d
	stha	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = 0047fc4d
!	%l6 = b9896b1b, %l7 = 00000047, Mem[0000000010101400] = ffffffff 000000ff
	stda	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = b9896b1b 00000047
!	%l4 = 590a321e, %l5 = ffffff36, Mem[00000000100c1418] = 1b937766 9278ef1d, %asi = 80
	stda	%l4,[%i3+0x018]%asi	! Mem[00000000100c1418] = 590a321e ffffff36
!	%l3 = 00000000000000ff, Mem[0000000030081410] = ff0000ff
	stwa	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff
!	%l6 = b9896b1b, %l7 = 00000047, Mem[00000000100c1400] = 00000015 8b0b0000
	stda	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = b9896b1b 00000047
!	%l4 = 00000000590a321e, Mem[0000000010141408] = ff000000
	stha	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 321e0000

p0_label_76:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 000000001b6b89b9, %l6 = 00000000b9896b1b
	ldxa	[%i3+%g0]0x89,%l6	! %l6 = 000000001b6b89b9
!	Mem[0000000030141410] = ffffff36 590a321e, %l4 = 590a321e, %l5 = ffffff36
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 00000000590a321e 00000000ffffff36
!	Mem[0000000010141410] = 7df6dc49, %f10 = f59ffc4d
	lda	[%i5+%o5]0x88,%f10	! %f10 = 7df6dc49
!	Mem[0000000010081400] = 000000ff, %f31 = ea6b3c50
	lda	[%i2+%g0]0x88,%f31	! %f31 = 000000ff
!	Mem[00000000300c1400] = b9896b1b 00000000, %l2 = 15000000, %l3 = 000000ff
	ldda	[%i3+%g0]0x81,%l2	! %l2 = 00000000b9896b1b 0000000000000000
!	Mem[00000000100c1408] = ff2536ff, %f7  = 9278ef1d
	lda	[%i3+%o4]0x88,%f7 	! %f7 = ff2536ff
!	Mem[0000000030001400] = 7fa00000, %l0 = 648cbeed182fb714
	lduba	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000010041400] = b299ffff 902a8904 69c8f0ff ffffffff
!	Mem[0000000010041410] = 4dfc9ff5 7fa0ca7f 37e230e2 5428f3cb
!	Mem[0000000010041420] = 4f4149d0 3dcd40a1 ff000000 4e1cd015
!	Mem[0000000010041430] = 51872fbc 0508eb5d 15d01c4e 6bfa2267
	ldda	[%i1+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	Mem[0000000010181408] = c8692267306e0000, %f0  = 3905660c ff000000
	ldda	[%i6+%o4]0x80,%f0 	! %f0  = c8692267 306e0000
!	Mem[0000000030181410] = 7df6dc1f, %l4 = 00000000590a321e
	lduha	[%i6+%o5]0x89,%l4	! %l4 = 000000000000dc1f

p0_label_77:
!	Starting 10 instruction Store Burst
!	%l6 = 000000001b6b89b9, Mem[0000000020800040] = ff603fd8
	stb	%l6,[%o1+0x040]		! Mem[0000000020800040] = b9603fd8
!	%f8  = 7106333a, %f3  = 7ff9540f
	fcmps	%fcc1,%f8 ,%f3 		! %fcc1 = 3
!	%l2 = b9896b1b, %l3 = 00000000, Mem[00000000100c1400] = 1b6b89b9 47000000
	stda	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = b9896b1b 00000000
!	%l0 = 0000000000000000, Mem[0000000010081410] = 043625ff15ffffff
	stxa	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000000000000000
!	Mem[0000000010041408] = fff0c869, %l4 = 000000000000dc1f
	swapa	[%i1+%o4]0x88,%l4	! %l4 = 00000000fff0c869
!	Mem[0000000030041408] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (16)
!	%l1 = 00000000000000ff, Mem[0000000010041400] = b299ffff
	stw	%l1,[%i1+%g0]		! Mem[0000000010041400] = 000000ff
!	%l2 = 00000000b9896b1b, immd = 00000365, %y  = fffffce5
	umul	%l2,0x365,%l0		! %l0 = 00000275cf7892a7, %y = 00000275
!	%l5 = 00000000ffffff36, Mem[0000000010001410] = 0047fc4d
	stha	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = ff36fc4d
!	Mem[00000000100c1434] = 64f7bd1d, %l5 = 00000000ffffff36, %asi = 80
	swapa	[%i3+0x034]%asi,%l5	! %l5 = 0000000064f7bd1d

p0_label_78:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181430] = 549a634c 1001d6ad, %l2 = b9896b1b, %l3 = 00000000
	ldd	[%i6+0x030],%l2		! %l2 = 00000000549a634c 000000001001d6ad
!	Mem[0000000030041408] = ff00000051872fbc, %l3 = 000000001001d6ad
	ldxa	[%i1+%o4]0x81,%l3	! %l3 = ff00000051872fbc
!	Mem[0000000030101408] = ff253604, %f12 = 2d5a0b8b
	lda	[%i4+%o4]0x89,%f12	! %f12 = ff253604
!	Mem[0000000010181408] = 672269c8, %l1 = 00000000000000ff
	ldsha	[%i6+%o4]0x88,%l1	! %l1 = 00000000000069c8
!	Mem[0000000010081410] = 00000000, %l0 = 00000275cf7892a7
	lduha	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = 607800ff, %l3 = ff00000051872fbc
	lduha	[%i5+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041418] = 37e230e2, %l7 = 0000000000000047
	lduw	[%i1+0x018],%l7		! %l7 = 0000000037e230e2
!	Mem[0000000010081410] = 00000000, %l0 = 0000000000000000
	ldswa	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800041] = b9603fd8, %l1 = 00000000000069c8
	ldub	[%o1+0x041],%l1		! %l1 = 0000000000000060
!	Mem[00000000300c1408] = 7fcaa07f, %l5 = 0000000064f7bd1d
	ldswa	[%i3+%o4]0x81,%l5	! %l5 = 000000007fcaa07f

p0_label_79:
!	Starting 10 instruction Store Burst
!	%l6 = 000000001b6b89b9, Mem[0000000010081409] = 590a321e
	stb	%l6,[%i2+0x009]		! Mem[0000000010081408] = 59b9321e
!	%l6 = 000000001b6b89b9, Mem[000000001014143c] = 37c1efc3, %asi = 80
	stwa	%l6,[%i5+0x03c]%asi	! Mem[000000001014143c] = 1b6b89b9
!	Mem[0000000010181400] = 00000000, %l0 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101408] = 043625ff, %l2 = 00000000549a634c
	swapa	[%i4+%o4]0x81,%l2	! %l2 = 00000000043625ff
!	%l1 = 0000000000000060, Mem[0000000010181430] = 549a634c1001d6ad
	stx	%l1,[%i6+0x030]		! Mem[0000000010181430] = 0000000000000060
!	%f0  = c8692267, Mem[0000000030001400] = 7fa00000
	sta	%f0 ,[%i0+%g0]0x89	! Mem[0000000030001400] = c8692267
!	Mem[0000000010141414] = 00000000, %l6 = 000000001b6b89b9
	ldstub	[%i5+0x014],%l6		! %l6 = 0000000000000000
!	%f6  = 1b937766 ff2536ff, %l3 = 00000000000000ff
!	Mem[0000000030081430] = 549a634c1001d6ad
	add	%i2,0x030,%g1
	stda	%f6,[%g1+%l3]ASI_PST8_SL ! Mem[0000000030081430] = ff3625ff6677931b
!	%f18 = 69c8f0ff ffffffff, Mem[0000000030181400] = 1001d6ad ff106f48
	stda	%f18,[%i6+%g0]0x89	! Mem[0000000030181400] = 69c8f0ff ffffffff
!	%l5 = 000000007fcaa07f, Mem[0000000030081410] = ff000000
	stba	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = 7f000000

p0_label_80:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 0000007f, %l4 = 00000000fff0c869
	lduha	[%i2+%o5]0x89,%l4	! %l4 = 000000000000007f
!	Mem[00000000100c1408] = ff2536ff, %f8  = 7106333a
	lda	[%i3+%o4]0x88,%f8 	! %f8 = ff2536ff
!	Mem[0000000030181410] = 1fdcf67d00000000, %f20 = 4dfc9ff5 7fa0ca7f
	ldda	[%i6+%o5]0x81,%f20	! %f20 = 1fdcf67d 00000000
!	%f12 = ff253604 cc3c9200, %l7 = 0000000037e230e2
!	Mem[0000000010141418] = 130236821b67e34b
	add	%i5,0x018,%g1
	stda	%f12,[%g1+%l7]ASI_PST8_P ! Mem[0000000010141418] = ff2536821b67924b
!	Mem[0000000010181400] = 00000000, %l6 = 0000000000000000
	ldsba	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041408] = ff000000, %l6 = 0000000000000000
	ldsba	[%i1+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181400] = 000000001b6b89b9, %f30 = 15d01c4e 6bfa2267
	ldda	[%i6+%g0]0x80,%f30	! %f30 = 00000000 1b6b89b9
!	Mem[0000000030081410] = 0000007f, %l5 = 000000007fcaa07f
	lduba	[%i2+%o5]0x89,%l5	! %l5 = 000000000000007f
!	Mem[0000000010141400] = 306e00005e6aefef, %l2 = 00000000043625ff
	ldxa	[%i5+%g0]0x80,%l2	! %l2 = 306e00005e6aefef
!	Mem[0000000010001400] = b9896b1b, %l0 = 0000000000000000
	ldsha	[%i0+%g0]0x80,%l0	! %l0 = ffffffffffffb989

p0_label_81:
!	Starting 10 instruction Store Burst
!	Mem[0000000020800000] = 201053a8, %l4 = 000000000000007f
	ldstub	[%o1+%g0],%l4		! %l4 = 0000000000000020
!	%l7 = 0000000037e230e2, Mem[0000000010181400] = 00000000
	stwa	%l7,[%i6+%g0]0x80	! Mem[0000000010181400] = 37e230e2
!	Mem[0000000010141400] = 306e0000 5e6aefef 321e0000 00000000
!	%f16 = b299ffff 902a8904 69c8f0ff ffffffff
!	%f20 = 1fdcf67d 00000000 37e230e2 5428f3cb
!	%f24 = 4f4149d0 3dcd40a1 ff000000 4e1cd015
!	%f28 = 51872fbc 0508eb5d 00000000 1b6b89b9
	stda	%f16,[%i5+%g0]ASI_BLK_P	! Block Store to 0000000010141400
!	%l4 = 0000000000000020, Mem[0000000030141408] = ff25ffff4dfc414f
	stxa	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000000000000020
!	%l0 = ffffffffffffb989, Mem[0000000010001410] = ff36fc4d043625ff, %asi = 80
	stxa	%l0,[%i0+0x010]%asi	! Mem[0000000010001410] = ffffffffffffb989
!	%l3 = 00000000000000ff, Mem[0000000010001400] = b9896b1b
	stha	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = 00ff6b1b
!	Mem[0000000010101410] = 00000000590a321e, %l0 = ffffffffffffb989, %l7 = 0000000037e230e2
	add	%i4,0x10,%g1
	casxa	[%g1]0x80,%l0,%l7	! %l7 = 00000000590a321e
!	%f24 = 4f4149d0 3dcd40a1, Mem[0000000010041400] = 000000ff 902a8904
	stda	%f24,[%i1+%g0]0x80	! Mem[0000000010041400] = 4f4149d0 3dcd40a1
!	Mem[0000000010101400] = 1b6b89b9, %l1 = 0000000000000060
	ldstuba	[%i4+%g0]0x88,%l1	! %l1 = 00000000000000b9
!	Mem[0000000010001420] = f15a3b45, %l4 = 0000000000000020, %asi = 80
	swapa	[%i0+0x020]%asi,%l4	! %l4 = 00000000f15a3b45

p0_label_82:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff896b1b, %l2 = 306e00005e6aefef
	ldsba	[%i4+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010101410] = 00000000590a321e, %f12 = ff253604 cc3c9200
	ldd	[%i4+%o5],%f12		! %f12 = 00000000 590a321e
!	Mem[0000000030001408] = 7fcaa07f79a72ebf, %f4  = 1fdcf67d 00000000
	ldda	[%i0+%o4]0x81,%f4 	! %f4  = 7fcaa07f 79a72ebf
!	Mem[00000000100c1410] = 00000060 00000001, %l0 = ffffb989, %l1 = 000000b9
	ldda	[%i3+%o5]0x80,%l0	! %l0 = 0000000000000060 0000000000000001
!	Mem[0000000030101408] = 4c639a54, %l7 = 00000000590a321e
	lduha	[%i4+%o4]0x89,%l7	! %l7 = 0000000000009a54
!	Mem[00000000300c1408] = 7fcaa07f80920000, %l4 = 00000000f15a3b45
	ldxa	[%i3+%o4]0x81,%l4	! %l4 = 7fcaa07f80920000
!	Mem[00000000300c1408] = 7fcaa07f, %l6 = ffffffffffffffff
	lduwa	[%i3+%o4]0x81,%l6	! %l6 = 000000007fcaa07f
!	Mem[0000000010081428] = 809273a1, %l5 = 000000000000007f, %asi = 80
	ldsha	[%i2+0x028]%asi,%l5	! %l5 = ffffffffffff8092
!	Mem[0000000030101400] = 1b6b89b9, %l7 = 0000000000009a54
	ldsba	[%i4+%g0]0x89,%l7	! %l7 = ffffffffffffffb9
!	Mem[0000000030001410] = 748cc213, %l2 = ffffffffffffffff
	ldswa	[%i0+%o5]0x89,%l2	! %l2 = 00000000748cc213

p0_label_83:
!	Starting 10 instruction Store Burst
!	%l4 = 80920000, %l5 = ffff8092, Mem[0000000010181408] = 672269c8 00006e30
	stda	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 80920000 ffff8092
!	%l1 = 0000000000000001, Mem[0000000010041410] = 4dfc9ff5
	stwa	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000001
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000010141410] = 7df6dc1f, %l0 = 0000000000000060
	swapa	[%i5+%o5]0x88,%l0	! %l0 = 000000007df6dc1f
!	Mem[0000000030001400] = 672269c8, %l0 = 000000007df6dc1f
	swapa	[%i0+%g0]0x81,%l0	! %l0 = 00000000672269c8
!	%l7 = ffffffffffffffb9, immd = 00000178, %y  = 00000275
	smul	%l7,0x178,%l5		! %l5 = ffffffffffff97b8, %y = ffffffff
!	%l5 = ffffffffffff97b8, Mem[0000000010181428] = 60f2649e54b1d777, %asi = 80
	stxa	%l5,[%i6+0x028]%asi	! Mem[0000000010181428] = ffffffffffff97b8
!	Mem[0000000010001410] = ffffffff, %l4 = 7fcaa07f80920000
	ldstuba	[%i0+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%l2 = 00000000748cc213, Mem[0000000030081410] = 7f000000
	stha	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = c2130000
!	%l0 = 672269c8, %l1 = 00000001, Mem[0000000010001400] = 1b6bff00 00000000
	stda	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 672269c8 00000001
!	Code Fragment 4, seed = 680196
p0_fragment_11:
!	%l0 = 00000000672269c8
	setx	0xb99a1c21e068b406,%g7,%l0 ! %l0 = b99a1c21e068b406
!	%l1 = 0000000000000001
	setx	0x25cb7052a91fa231,%g7,%l1 ! %l1 = 25cb7052a91fa231
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b99a1c21e068b406
	setx	0xb4f4f3e0915ed46c,%g7,%l0 ! %l0 = b4f4f3e0915ed46c
!	%l1 = 25cb7052a91fa231
	setx	0x7cd8a65e5b104db7,%g7,%l1 ! %l1 = 7cd8a65e5b104db7
p0_fragment_11_end:

p0_label_84:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 7fcaa07f, %l3 = 00000000000000ff
	lduba	[%i0+%o4]0x81,%l3	! %l3 = 000000000000007f
!	Mem[0000000010041408] = 1fdc0000ffffffff, %l3 = 000000000000007f
	ldxa	[%i1+%o4]0x80,%l3	! %l3 = 1fdc0000ffffffff
!	Mem[0000000010181410] = 159ffc4d, %f27 = 4e1cd015
	lda	[%i6+%o5]0x88,%f27	! %f27 = 159ffc4d
!	Mem[00000000300c1408] = 7fcaa07f80920000, %f8  = ff2536ff e0995126
	ldda	[%i3+%o4]0x81,%f8 	! %f8  = 7fcaa07f 80920000
!	Mem[0000000010101424] = 04892a90, %l7 = ffffffffffffffb9, %asi = 80
	lduha	[%i4+0x024]%asi,%l7	! %l7 = 0000000000000489
!	Mem[0000000030081410] = 000013c2, %l0 = b4f4f3e0915ed46c
	lduwa	[%i2+%o5]0x89,%l0	! %l0 = 00000000000013c2
!	Mem[0000000021800180] = 3b561158, %l7 = 0000000000000489
	ldub	[%o3+0x180],%l7		! %l7 = 000000000000003b
!	Mem[0000000010001436] = 4c639a54, %l3 = 1fdc0000ffffffff
	ldsh	[%i0+0x036],%l3		! %l3 = ffffffffffff9a54
!	Mem[0000000030101408] = 4c639a54, %l3 = ffffffffffff9a54
	lduba	[%i4+%o4]0x89,%l3	! %l3 = 0000000000000054
!	Mem[0000000030141408] = 00000000, %f10 = 7df6dc49
	lda	[%i5+%o4]0x81,%f10	! %f10 = 00000000

p0_label_85:
!	Starting 10 instruction Store Burst
!	%f14 = 00000000, Mem[0000000010081424] = 5a256745
	st	%f14,[%i2+0x024]	! Mem[0000000010081424] = 00000000
!	Mem[0000000020800041] = b9603fd8, %l4 = 00000000000000ff
	ldstuba	[%o1+0x041]%asi,%l4	! %l4 = 0000000000000060
!	%l2 = 00000000748cc213, Mem[0000000010001410] = ffffffff
	stba	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 13ffffff
!	%l1 = 7cd8a65e5b104db7, Mem[0000000010081410] = 0000000000000000
	stxa	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 7cd8a65e5b104db7
!	%l7 = 000000000000003b, imm = fffffffffffff708, %l0 = 00000000000013c2
	xnor	%l7,-0x8f8,%l0		! %l0 = 00000000000008cc
!	Mem[00000000100c1408] = ff3625ff, %l2 = 00000000748cc213
	swapa	[%i3+%o4]0x80,%l2	! %l2 = 00000000ff3625ff
!	%l4 = 0000000000000060, Mem[0000000030141408] = 00000000
	stba	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = 60000000
!	%l2 = 00000000ff3625ff, Mem[0000000010041400] = 4f4149d0
	stba	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = ff4149d0
!	Mem[0000000030041408] = 000000ff, %l1 = 7cd8a65e5b104db7
	ldstuba	[%i1+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[000000001018140c] = 9280ffff, %l7 = 000000000000003b
	ldstuba	[%i6+0x00c]%asi,%l7	! %l7 = 0000000000000092

p0_label_86:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 09fa318b, %l6 = 000000007fcaa07f
	ldsba	[%i1+%o5]0x89,%l6	! %l6 = ffffffffffffff8b
!	Mem[0000000010081410] = 7cd8a65e, %l4 = 0000000000000060
	lduba	[%i2+%o5]0x80,%l4	! %l4 = 000000000000007c
!	Mem[0000000030001410] = 13c28c74, %l2 = 00000000ff3625ff
	lduwa	[%i0+%o5]0x81,%l2	! %l2 = 0000000013c28c74
!	Mem[0000000030141400] = ff007860 00000000, %l2 = 13c28c74, %l3 = 00000054
	ldda	[%i5+%g0]0x81,%l2	! %l2 = 00000000ff007860 0000000000000000
!	Mem[00000000201c0000] = ff366378, %l0 = 00000000000008cc, %asi = 80
	ldsba	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000211c0000] = ff002808, %l5 = ffffffffffff97b8, %asi = 80
	lduba	[%o2+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101438] = 1b9377669278ef1d, %f24 = 4f4149d0 3dcd40a1
	ldd	[%i4+0x038],%f24	! %f24 = 1b937766 9278ef1d
!	Mem[0000000021800080] = 7ec0c898, %l0 = ffffffffffffffff, %asi = 80
	lduba	[%o3+0x080]%asi,%l0	! %l0 = 000000000000007e
!	Mem[000000001004142e] = 4e1cd015, %l6 = ffffffffffffff8b
	lduh	[%i1+0x02e],%l6		! %l6 = 000000000000d015
!	Mem[0000000030001400] = 7df6dc1f, %l1 = 00000000000000ff
	ldsba	[%i0+%g0]0x81,%l1	! %l1 = 000000000000007d

p0_label_87:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 7cd8a65e, %l0 = 000000000000007e
	ldstuba	[%i2+%o5]0x80,%l0	! %l0 = 000000000000007c
!	%l7 = 0000000000000092, Mem[00000000100c1406] = 00000000, %asi = 80
	stba	%l7,[%i3+0x006]%asi	! Mem[00000000100c1404] = 00009200
!	%l2 = 00000000ff007860, Mem[0000000010081410] = 5ea6d8ff
	stha	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 5ea67860
!	%f26 = ff000000 159ffc4d, Mem[0000000010101400] = 1b6b89ff 47000000
	stda	%f26,[%i4+%g0]0x88	! Mem[0000000010101400] = ff000000 159ffc4d
!	Mem[0000000030101400] = b9896b1b, %l1 = 000000000000007d
	swapa	[%i4+%g0]0x81,%l1	! %l1 = 00000000b9896b1b
!	%f20 = 1fdcf67d 00000000, Mem[0000000010141400] = ffff99b2 04892a90
	stda	%f20,[%i5+%g0]0x88	! Mem[0000000010141400] = 1fdcf67d 00000000
!	Mem[0000000010141404] = 7df6dc1f, %l1 = 00000000b9896b1b
	ldstuba	[%i5+0x004]%asi,%l1	! %l1 = 000000000000007d
!	Mem[0000000010001408] = 7fa0ca7f, %l5 = 00000000000000ff
	swapa	[%i0+%o4]0x88,%l5	! %l5 = 000000007fa0ca7f
!	%f20 = 1fdcf67d 00000000, Mem[00000000300c1400] = b9896b1b 00000000
	stda	%f20,[%i3+%g0]0x81	! Mem[00000000300c1400] = 1fdcf67d 00000000
!	%l6 = 000000000000d015, Mem[0000000010141400] = 00000000
	stba	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000015

p0_label_88:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0001] = ff002808, %l0 = 000000000000007c, %asi = 80
	ldsba	[%o2+0x001]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = 0000007d, %l6 = 000000000000d015
	lduha	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1408] = 13c28c74, %l1 = 000000000000007d
	lduwa	[%i3+%o4]0x88,%l1	! %l1 = 0000000013c28c74
!	Mem[0000000010181410] = 4dfc9f15, %l7 = 0000000000000092
	lduwa	[%i6+%o5]0x80,%l7	! %l7 = 000000004dfc9f15
!	%l2 = 00000000ff007860, %l0 = 0000000000000000, %l4 = 000000000000007c
	add	%l2,%l0,%l4		! %l4 = 00000000ff007860
!	Mem[0000000010101436] = 3dcd40a1, %l5 = 000000007fa0ca7f, %asi = 80
	lduha	[%i4+0x036]%asi,%l5	! %l5 = 00000000000040a1
!	Mem[000000001000142c] = 9e64f260, %l4 = 00000000ff007860
	lduw	[%i0+0x02c],%l4		! %l4 = 000000009e64f260
!	Mem[0000000030041408] = ff00000051872fbc, %f0  = c8692267 306e0000
	ldda	[%i1+%o4]0x81,%f0 	! %f0  = ff000000 51872fbc
!	Mem[0000000030041400] = 00047860, %l6 = 0000000000000000
	ldsha	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000004
!	Mem[000000001010140c] = 00000000, %l3 = 0000000000000000
	ldsb	[%i4+0x00c],%l3		! %l3 = 0000000000000000

p0_label_89:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 590a321e, %l1 = 0000000013c28c74
	swapa	[%i5+%o5]0x89,%l1	! %l1 = 00000000590a321e
!	Mem[0000000010081408] = 59b9321e, %l4 = 000000009e64f260
	swapa	[%i2+%o4]0x80,%l4	! %l4 = 0000000059b9321e
!	%l3 = 0000000000000000, Mem[00000000201c0000] = ff366378, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00006378
!	%l5 = 00000000000040a1, Mem[00000000300c1400] = 7df6dc1f
	stba	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = 7df6dca1
!	Mem[00000000300c1400] = 7df6dca1, %l4 = 0000000059b9321e
	swapa	[%i3+%g0]0x89,%l4	! %l4 = 000000007df6dca1
!	%l3 = 0000000000000000, Mem[0000000030101410] = 00000000
	stwa	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	Mem[0000000030141400] = 607800ff, %l7 = 000000004dfc9f15
	ldstuba	[%i5+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[00000000100c141a] = 590a321e
	sth	%l7,[%i3+0x01a]		! Mem[00000000100c1418] = 590a00ff
!	%l1 = 00000000590a321e, Mem[0000000030041400] = 00047860
	stwa	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = 590a321e
!	Mem[0000000030081400] = 503c6bea, %l4 = 000000007df6dca1
	swapa	[%i2+%g0]0x81,%l4	! %l4 = 00000000503c6bea

p0_label_90:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00006378, %l7 = 00000000000000ff
	ldsh	[%o0+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000010181400] = b9896b1be230e237, %f24 = 1b937766 9278ef1d
	ldda	[%i6+%g0]0x88,%f24	! %f24 = b9896b1b e230e237
!	Mem[0000000010141400] = 1fdcf6ff 00000015, %l4 = 503c6bea, %l5 = 000040a1
	ldda	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000015 000000001fdcf6ff
!	Mem[00000000201c0000] = 00006378, %l5 = 000000001fdcf6ff, %asi = 80
	lduha	[%o0+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = 09fa318b, %l3 = 0000000000000000
	lduwa	[%i1+%o5]0x89,%l3	! %l3 = 0000000009fa318b
!	Mem[0000000010081408] = f59ffc4d60f2649e, %f14 = 00000000 ff0000ff
	ldda	[%i2+%o4]0x88,%f14	! %f14 = f59ffc4d 60f2649e
!	Mem[0000000010141410] = 60000000, %l2 = 00000000ff007860
	ldsha	[%i5+%o5]0x80,%l2	! %l2 = 0000000000006000
!	Mem[000000001004140d] = ffffffff, %l6 = 0000000000000004
	ldub	[%i1+0x00d],%l6		! %l6 = 00000000000000ff
!	Mem[00000000300c1410] = f59ffc4d, %f30 = 00000000
	lda	[%i3+%o5]0x81,%f30	! %f30 = f59ffc4d
!	Mem[0000000030101410] = 00000000, %l5 = 0000000000000000
	lduwa	[%i4+%o5]0x81,%l5	! %l5 = 0000000000000000

p0_label_91:
!	Starting 10 instruction Store Burst
!	%f12 = 00000000 590a321e, Mem[0000000010081408] = 60f2649e f59ffc4d
	stda	%f12,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000 590a321e
!	%l1 = 00000000590a321e, Mem[0000000010041408] = 0000dc1f
	stwa	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 590a321e
!	%l4 = 0000000000000015, Mem[0000000030181408] = 8b0b4b32
	stwa	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000015
!	%l4 = 00000015, %l5 = 00000000, Mem[0000000010041410] = 01000000 7fcaa07f
	stda	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000015 00000000
!	%f8  = 7fcaa07f 80920000, Mem[0000000010041438] = 15d01c4e 6bfa2267, %asi = 80
	stda	%f8 ,[%i1+0x038]%asi	! Mem[0000000010041438] = 7fcaa07f 80920000
!	%f0  = ff000000 51872fbc, %l2 = 0000000000006000
!	Mem[0000000010181438] = 503c6beaf15a3b45
	add	%i6,0x038,%g1
	stda	%f0,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010181438] = 503c6beaf15a3b45
!	%l4 = 00000015, %l5 = 00000000, Mem[00000000300c1410] = 4dfc9ff5 ff253604
	stda	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000015 00000000
!	%l5 = 0000000000000000, Mem[00000000100c1410] = 0000006000000001
	stx	%l5,[%i3+%o5]		! Mem[00000000100c1410] = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000
!	%l4 = 0000000000000015, Mem[0000000010001400] = 00000001672269c8
	stxa	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000015

p0_label_92:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c141c] = ffffff36, %l7 = 0000000000000000
	lduh	[%i3+0x01c],%l7		! %l7 = 000000000000ffff
!	Mem[0000000030001410] = 13c28c74, %f21 = 00000000
	lda	[%i0+%o5]0x81,%f21	! %f21 = 13c28c74
!	%l3 = 0000000009fa318b, %l5 = 0000000000000000, %l0 = 0000000000000000
	xor	%l3,%l5,%l0		! %l0 = 0000000009fa318b
!	Mem[0000000010001408] = 000000ff, %l4 = 0000000000000015
	ldswa	[%i0+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001410] = ffffff13, %l0 = 0000000009fa318b
	ldsha	[%i0+%o5]0x88,%l0	! %l0 = ffffffffffffff13
!	Mem[0000000010181410] = 159ffc4d, %l4 = 00000000000000ff
	ldsha	[%i6+%o5]0x88,%l4	! %l4 = fffffffffffffc4d
!	Mem[0000000010081410] = 5ea67860, %l6 = 00000000000000ff
	lduba	[%i2+%o5]0x88,%l6	! %l6 = 0000000000000060
!	Mem[0000000010101400] = ff000000159ffc4d, %l5 = 0000000000000000
	ldxa	[%i4+%g0]0x88,%l5	! %l5 = ff000000159ffc4d
!	Mem[0000000010101400] = 159ffc4d, %l3 = 0000000009fa318b
	lduwa	[%i4+%g0]0x88,%l3	! %l3 = 00000000159ffc4d
!	%l0 = ffffffffffffff13, %l4 = fffffffffffffc4d, %l1 = 00000000590a321e
	addc	%l0,%l4,%l1		! %l1 = fffffffffffffb60

p0_label_93:
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000ffff, Mem[0000000010141408] = 69c8f0ff
	stba	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = ffc8f0ff
!	Mem[0000000030101410] = 00000000, %l1 = fffffffffffffb60
	ldstuba	[%i4+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%l3 = 00000000159ffc4d, Mem[0000000010041408] = 1e320a59
	stha	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = fc4d0a59
!	%f28 = 51872fbc 0508eb5d, %l3 = 00000000159ffc4d
!	Mem[0000000010181418] = 7fa1a3122144839b
	add	%i6,0x018,%g1
	stda	%f28,[%g1+%l3]ASI_PST32_P ! Mem[0000000010181418] = 7fa1a3120508eb5d
!	%l6 = 0000000000000060, Mem[0000000030001408] = 7fa0ca7f
	stha	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = 7fa00060
!	%l6 = 00000060, %l7 = 0000ffff, Mem[0000000030101408] = 4c639a54 00009280
	stda	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000060 0000ffff
!	Mem[0000000010101400] = 4dfc9f15, %l0 = 00000000ffffff13
	swapa	[%i4+%g0]0x80,%l0	! %l0 = 000000004dfc9f15
!	%f26 = ff000000 159ffc4d, Mem[0000000010001400] = 15000000 00000000
	stda	%f26,[%i0+%g0]0x80	! Mem[0000000010001400] = ff000000 159ffc4d
!	%l3 = 00000000159ffc4d, Mem[0000000030141410] = 13c28c74
	stwa	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = 159ffc4d
!	Mem[0000000010041410] = 15000000, %l4 = 00000000fffffc4d
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 0000000015000000

p0_label_94:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 60785a49, %l6 = 0000000000000060
	ldswa	[%i2+%o4]0x89,%l6	! %l6 = 0000000060785a49
!	Mem[0000000010081402] = ff000000, %l1 = 0000000000000000
	lduh	[%i2+0x002],%l1		! %l1 = 0000000000000000
!	Mem[0000000030141400] = ff007860 00000000, %l2 = 00006000, %l3 = 159ffc4d
	ldda	[%i5+%g0]0x81,%l2	! %l2 = 00000000ff007860 0000000000000000
!	Mem[0000000030001410] = 748cc213, %l7 = 000000000000ffff
	lduha	[%i0+%o5]0x89,%l7	! %l7 = 000000000000c213
!	Mem[0000000020800000] = ff1053a8, %l4 = 0000000015000000
	ldsb	[%o1+%g0],%l4		! %l4 = ffffffffffffffff
!	%l0 = 000000004dfc9f15, immd = fffffffffffffc1f, %l4  = ffffffffffffffff
	mulx	%l0,-0x3e1,%l4		! %l4 = fffffed17f1aef8b
!	Mem[0000000010001400] = 4dfc9f15000000ff, %f10 = 00000000 1e320a59
	ldda	[%i0+%g0]0x88,%f10	! %f10 = 4dfc9f15 000000ff
!	Mem[00000000100c1400] = 00920000b9896b1b, %f8  = 7fcaa07f 80920000
	ldda	[%i3+%g0]0x88,%f8 	! %f8  = 00920000 b9896b1b
!	Mem[0000000010141439] = 00000000, %l2 = 00000000ff007860, %asi = 80
	lduba	[%i5+0x039]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181426] = 453b5af1, %l4 = fffffed17f1aef8b, %asi = 80
	ldsha	[%i6+0x026]%asi,%l4	! %l4 = 0000000000005af1

p0_label_95:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000010001410] = ffffff13
	stha	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = ffff0000
!	%f26 = ff000000 159ffc4d, Mem[0000000010041428] = ff000000 4e1cd015, %asi = 80
	stda	%f26,[%i1+0x028]%asi	! Mem[0000000010041428] = ff000000 159ffc4d
!	Mem[0000000010181408] = 80920000, %l7 = 000000000000c213
	ldstuba	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181410] = 7df6dc1f, %l3 = 0000000000000000
	lduha	[%i6+%o5]0x89,%l3	! %l3 = 000000000000dc1f
!	%l1 = 0000000000000000, Mem[00000000211c0000] = ff002808
	sth	%l1,[%o2+%g0]		! Mem[00000000211c0000] = 00002808
!	%l2 = 0000000000000000, Mem[0000000030181400] = ffffffff
	stba	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = ffffff00
!	%l2 = 0000000000000000, Mem[0000000030041408] = ff00000051872fbc
	stxa	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000000000000000
!	%l2 = 0000000000000000, Mem[00000000300c1400] = 1e32b959
	stba	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0032b959
!	%l1 = 0000000000000000, Mem[0000000010041400] = ff4149d0
	stwa	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	Mem[0000000020800001] = ff1053a8, %l7 = 0000000000000000
	ldstuba	[%o1+0x001]%asi,%l7	! %l7 = 0000000000000010

p0_label_96:
!	Starting 10 instruction Load Burst
!	%l1 = 0000000000000000, imm = 000000000000035f, %l0 = 000000004dfc9f15
	xor	%l1,0x35f,%l0		! %l0 = 000000000000035f
!	Mem[0000000010041408] = ffffffff590a4dfc, %f26 = ff000000 159ffc4d
	ldda	[%i1+%o4]0x88,%f26	! %f26 = ffffffff 590a4dfc
!	Mem[0000000010141400] = 00000015, %l4 = 0000000000005af1
	lduha	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000015
!	Mem[0000000010101430] = 5c1ab2dc, %l7 = 0000000000000010
	ldsh	[%i4+0x030],%l7		! %l7 = 0000000000005c1a
!	Mem[0000000030141410] = 4dfc9f15, %l2 = 0000000000000000
	ldsba	[%i5+%o5]0x81,%l2	! %l2 = 000000000000004d
!	Mem[0000000010081410] = 6078a65e, %l3 = 000000000000dc1f
	lduba	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000060
!	Mem[0000000010041410] = fffffc4d00000000, %f6  = 1b937766 ff2536ff, %asi = 80
	ldda	[%i1+0x010]%asi,%f6 	! %f6  = fffffc4d 00000000
!	Mem[00000000100c1400] = 1b6b89b900009200, %f20 = 1fdcf67d 13c28c74, %asi = 80
	ldda	[%i3+0x000]%asi,%f20	! %f20 = 1b6b89b9 00009200
!	Mem[0000000030181408] = 15000000, %f0  = ff000000
	lda	[%i6+%o4]0x89,%f0 	! %f0 = 15000000
!	Mem[0000000010041410] = 4dfcffff, %l0 = 000000000000035f
	lduwa	[%i1+%o5]0x88,%l0	! %l0 = 000000004dfcffff

p0_label_97:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000005c1a, Mem[000000001008141c] = 4e1cd0ff, %asi = 80
	stha	%l7,[%i2+0x01c]%asi	! Mem[000000001008141c] = 5c1ad0ff
!	%l6 = 0000000060785a49, immd = 0000000000000d1b, %l3  = 0000000000000060
	mulx	%l6,0xd1b,%l3		! %l3 = 000004f049473ab3
!	%f24 = b9896b1b e230e237, Mem[0000000030001408] = 6000a07f 79a72ebf
	stda	%f24,[%i0+%o4]0x81	! Mem[0000000030001408] = b9896b1b e230e237
!	%f16 = b299ffff 902a8904, %l1 = 0000000000000000
!	Mem[0000000010001438] = 13c28c747fcaa07f
	add	%i0,0x038,%g1
	stda	%f16,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010001438] = 13c28c747fcaa07f
!	%l3 = 000004f049473ab3, Mem[0000000030141400] = 607800ff
	stba	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 607800b3
!	%l4 = 0000000000000015, %l6 = 0000000060785a49, %y  = ffffffff
	smul	%l4,%l6,%l5		! %l5 = 00000007e9df67fd, %y = 00000007
!	%f2  = 00000015 7ff9540f, %l1 = 0000000000000000
!	Mem[0000000030041428] = a17392ffa1739280
	add	%i1,0x028,%g1
	stda	%f2,[%g1+%l1]ASI_PST8_S ! Mem[0000000030041428] = a17392ffa1739280
!	Mem[00000000218000c1] = 10f7a0c8, %l1 = 0000000000000000
	ldstuba	[%o3+0x0c1]%asi,%l1	! %l1 = 00000000000000f7
!	%f18 = 69c8f0ff ffffffff, Mem[0000000030001410] = 13c28c74 94b2c436
	stda	%f18,[%i0+%o5]0x81	! Mem[0000000030001410] = 69c8f0ff ffffffff
!	%f18 = 69c8f0ff, Mem[000000001004141c] = 5428f3cb
	st	%f18,[%i1+0x01c]	! Mem[000000001004141c] = 69c8f0ff

p0_label_98:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 0032b95900000000, %f22 = 37e230e2 5428f3cb
	ldda	[%i3+%g0]0x81,%f22	! %f22 = 0032b959 00000000
!	Mem[0000000030001410] = 69c8f0ffffffffff, %f0  = 15000000 51872fbc
	ldda	[%i0+%o5]0x81,%f0 	! %f0  = 69c8f0ff ffffffff
!	Mem[0000000030001408] = 37e230e2 1b6b89b9, %l4 = 00000015, %l5 = e9df67fd
	ldda	[%i0+%o4]0x89,%l4	! %l4 = 000000001b6b89b9 0000000037e230e2
!	Mem[0000000010001410] = 0000ffff ffffb989, %l4 = 1b6b89b9, %l5 = 37e230e2
	ldd	[%i0+%o5],%l4		! %l4 = 000000000000ffff 00000000ffffb989
!	Mem[0000000010101408] = ff0000ff00000000, %l6 = 0000000060785a49
	ldxa	[%i4+%o4]0x80,%l6	! %l6 = ff0000ff00000000
!	Mem[0000000010041400] = 00000000, %f4  = 7fcaa07f
	lda	[%i1+%g0]0x80,%f4 	! %f4 = 00000000
!	Mem[00000000100c1410] = 00000000, %l1 = 00000000000000f7
	lduba	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001410] = 0000ffff, %l4 = 000000000000ffff
	ldsha	[%i0+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141410] = 00000060, %f30 = f59ffc4d
	lda	[%i5+%o5]0x88,%f30	! %f30 = 00000060
!	Mem[0000000030181410] = 000000007df6dc1f, %l7 = 0000000000005c1a
	ldxa	[%i6+%o5]0x89,%l7	! %l7 = 000000007df6dc1f

p0_label_99:
!	Starting 10 instruction Store Burst
!	Mem[000000001008143c] = ff344c54, %l6 = 00000000, %l7 = 7df6dc1f
	add	%i2,0x3c,%g1
	casa	[%g1]0x80,%l6,%l7	! %l7 = 00000000ff344c54
!	%l2 = 000000000000004d, Mem[0000000030141400] = b3007860
	stba	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 4d007860
!	%l3 = 000004f049473ab3, Mem[0000000010181408] = ff009280
	stba	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = b3009280
!	Mem[0000000010101400] = 13ffffff, %l5 = 00000000ffffb989
	swapa	[%i4+%g0]0x88,%l5	! %l5 = 0000000013ffffff
!	Mem[0000000010001406] = 159ffc4d, %l2 = 000000000000004d
	ldstub	[%i0+0x006],%l2		! %l2 = 00000000000000fc
!	%l5 = 0000000013ffffff, Mem[000000001000140a] = ff000000, %asi = 80
	stha	%l5,[%i0+0x00a]%asi	! Mem[0000000010001408] = ff00ffff
!	%f8  = 00920000 b9896b1b, %l0 = 000000004dfcffff
!	Mem[0000000030001418] = 690958523b5b1bdb
	add	%i0,0x018,%g1
	stda	%f8,[%g1+%l0]ASI_PST32_S ! Mem[0000000030001418] = 00920000b9896b1b
!	Mem[0000000030001408] = b9896b1b, %l4 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l4	! %l4 = 00000000000000b9
!	%f22 = 0032b959, Mem[0000000010181410] = 4dfc9f15
	sta	%f22,[%i6+%o5]0x80	! Mem[0000000010181410] = 0032b959
!	%l6 = ff0000ff00000000, Mem[0000000030001400] = 1fdcf67d
	stwa	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000

p0_label_100:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = fffffc4d, %f0  = 69c8f0ff
	lda	[%i1+%o5]0x80,%f0 	! %f0 = fffffc4d
!	Mem[0000000010001400] = ff000000, %l4 = 00000000000000b9
	lduha	[%i0+%g0]0x80,%l4	! %l4 = 000000000000ff00
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000030041400] = 590a321e 00000000 00000000 00000000
!	Mem[0000000030041410] = 8b31fa09 053fd967 448451f8 4567255a
!	Mem[0000000030041420] = 4567255a 37c1efc3 a17392ff a1739280
!	Mem[0000000030041430] = 4f4149d0 3dcd40a1 544c34ff 1a8b0293
	ldda	[%i1+%g0]ASI_BLK_SL,%f16	! Block Load from 0000000030041400
!	Mem[0000000010041404] = 3dcd40a1, %f8  = 00920000
	lda	[%i1+0x004]%asi,%f8 	! %f8 = 3dcd40a1
!	Mem[0000000030041408] = 00000000, %l7 = 00000000ff344c54
	lduha	[%i1+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081438] = 93028b1aff344c54, %l2 = 00000000000000fc
	ldx	[%i2+0x038],%l2		! %l2 = 93028b1aff344c54
!	Mem[0000000010081400] = 0f000000000000ff, %l1 = 0000000000000000
	ldxa	[%i2+%g0]0x88,%l1	! %l1 = 0f000000000000ff
!	Mem[0000000030181400] = ffffff00, %l6 = ff0000ff00000000
	lduwa	[%i6+%g0]0x89,%l6	! %l6 = 00000000ffffff00
!	Mem[00000000300c1408] = 7fcaa07f, %l1 = 0f000000000000ff
	lduha	[%i3+%o4]0x81,%l1	! %l1 = 0000000000007fca
!	Mem[0000000010081430] = a140cd3dd049414f, %l4 = 000000000000ff00, %asi = 80
	ldxa	[%i2+0x030]%asi,%l4	! %l4 = a140cd3dd049414f

p0_label_101:
!	Starting 10 instruction Store Burst
!	%f16 = 00000000 1e320a59, %l5 = 0000000013ffffff
!	Mem[0000000010141418] = 37e230e25428f3cb
	add	%i5,0x018,%g1
	stda	%f16,[%g1+%l5]ASI_PST32_P ! Mem[0000000010141418] = 000000001e320a59
!	%l6 = 00000000ffffff00, Mem[0000000010081400] = 000000ff
	stba	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	%l7 = 0000000000000000, Mem[00000000300c1410] = 15000000
	stba	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	%l2 = ff344c54, %l3 = 49473ab3, Mem[0000000030001400] = 00000000 09fa3107
	stda	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = ff344c54 49473ab3
!	Mem[0000000030181410] = 1fdcf67d, %l3 = 000004f049473ab3
	ldstuba	[%i6+%o5]0x81,%l3	! %l3 = 000000000000001f
!	%l0 = 000000004dfcffff, Mem[0000000030141410] = 4dfc9f15
	stwa	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 4dfcffff
!	%l6 = 00000000ffffff00, Mem[0000000030141408] = 6000000000000020
	stxa	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000ffffff00
!	%l3 = 000000000000001f, Mem[00000000100c1410] = 00000000
	stha	%l3,[%i3+%o5]0x80	! Mem[00000000100c1410] = 001f0000
!	Mem[0000000010081400] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i2+%g0]0x88,%l7	! %l7 = 0000000000000000
!	%l3 = 000000000000001f, Mem[0000000030181408] = 00000015
	stwa	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000001f

p0_label_102:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 5ea67860, %l0 = 000000004dfcffff
	lduba	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000060
!	Mem[0000000010001408] = ffff00ff, %l1 = 0000000000007fca
	ldsha	[%i0+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101410] = 1e320a59 000000ff, %l0 = 00000060, %l1 = 000000ff
	ldda	[%i4+%o5]0x88,%l0	! %l0 = 00000000000000ff 000000001e320a59
!	Mem[0000000030081408] = 60785a49, %f9  = b9896b1b
	lda	[%i2+%o4]0x89,%f9 	! %f9 = 60785a49
!	Mem[00000000300c1400] = 0032b959, %l3 = 000000000000001f
	lduwa	[%i3+%g0]0x81,%l3	! %l3 = 000000000032b959
!	Mem[0000000030181408] = 0000001f, %l0 = 00000000000000ff
	lduwa	[%i6+%o4]0x81,%l0	! %l0 = 000000000000001f
!	Mem[0000000010001434] = 4c639a54, %l7 = 0000000000000000
	ldub	[%i0+0x034],%l7		! %l7 = 000000000000004c
!	Mem[0000000010001400] = ff000000, %l7 = 000000000000004c
	ldsha	[%i0+%g0]0x80,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000010001410] = 89b9ffffffff0000, %l5 = 0000000013ffffff
	ldxa	[%i0+%o5]0x88,%l5	! %l5 = 89b9ffffffff0000
!	Mem[0000000010081408] = 1e320a59, %l5 = 89b9ffffffff0000
	ldsha	[%i2+%o4]0x80,%l5	! %l5 = 0000000000001e32

p0_label_103:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 590a4dfc, %l5 = 0000000000001e32
	swapa	[%i1+%o4]0x88,%l5	! %l5 = 00000000590a4dfc
!	%l1 = 000000001e320a59, Mem[00000000300c1408] = 000092807fa0ca7f
	stxa	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000001e320a59
!	%l1 = 000000001e320a59, Mem[0000000010041404] = 3dcd40a1
	sth	%l1,[%i1+0x004]		! Mem[0000000010041404] = 0a5940a1
!	Mem[0000000020800001] = ffff53a8, %l3 = 000000000032b959
	ldstuba	[%o1+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	%f7  = 00000000, Mem[0000000010001410] = 0000ffff
	sta	%f7 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	%f10 = 4dfc9f15 000000ff, Mem[0000000030081408] = 60785a49 7fcaa07f
	stda	%f10,[%i2+%o4]0x89	! Mem[0000000030081408] = 4dfc9f15 000000ff
!	Mem[0000000030041400] = 590a321e, %l7 = 00000000ffffff00
	swapa	[%i1+%g0]0x81,%l7	! %l7 = 00000000590a321e
!	%f2  = 00000015, Mem[0000000030181408] = 1f000000
	sta	%f2 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000015
!	%f21 = 09fa318b, Mem[0000000030181408] = 00000015
	sta	%f21,[%i6+%o4]0x89	! Mem[0000000030181408] = 09fa318b
!	%f24 = c3efc137 5a256745, Mem[0000000010001410] = 00000000 89b9ffff
	stda	%f24,[%i0+%o5]0x88	! Mem[0000000010001410] = c3efc137 5a256745

p0_label_104:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 37e230e21b6b89b9, %f10 = 4dfc9f15 000000ff
	ldd	[%i6+%g0],%f10		! %f10 = 37e230e2 1b6b89b9
!	Mem[0000000010101438] = 1b937766 9278ef1d, %l0 = 0000001f, %l1 = 1e320a59
	ldd	[%i4+0x038],%l0		! %l0 = 000000001b937766 000000009278ef1d
!	Mem[0000000020800000] = ffff53a8, %l5 = 00000000590a4dfc, %asi = 80
	ldsha	[%o1+0x000]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030041400] = ffffff00, %l5 = ffffffffffffffff
	ldsba	[%i1+%g0]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000300c1400] = 0032b959, %l0 = 000000001b937766
	ldsba	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101419] = 306e0000, %l0 = 0000000000000000, %asi = 80
	ldsba	[%i4+0x019]%asi,%l0	! %l0 = 000000000000006e
!	Mem[0000000030081400] = 7df6dca1, %f18 = 00000000
	lda	[%i2+%g0]0x81,%f18	! %f18 = 7df6dca1
!	Mem[0000000030101400] = 00000000 7d000000, %l4 = d049414f, %l5 = ffffffff
	ldda	[%i4+%g0]0x89,%l4	! %l4 = 000000007d000000 0000000000000000
!	Mem[0000000030041400] = ffffff00, %l0 = 000000000000006e
	ldsha	[%i1+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001413] = 4567255a, %l0 = ffffffffffffffff
	ldub	[%i0+0x013],%l0		! %l0 = 000000000000005a

p0_label_105:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010081428] = 809273a1
	stb	%l5,[%i2+0x028]		! Mem[0000000010081428] = 009273a1
!	%l2 = 93028b1aff344c54, Mem[0000000010001434] = 4c639a54, %asi = 80
	stwa	%l2,[%i0+0x034]%asi	! Mem[0000000010001434] = ff344c54
!	%l1 = 000000009278ef1d, Mem[0000000030001400] = b33a4749544c34ff
	stxa	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000009278ef1d
!	%f30 = 93028b1a ff344c54, %l4 = 000000007d000000
!	Mem[00000000100c1418] = 590a00ffffffff36
	add	%i3,0x018,%g1
	stda	%f30,[%g1+%l4]ASI_PST32_PL ! Mem[00000000100c1418] = 590a00ffffffff36
!	Mem[0000000020800040] = b9ff3fd8, %l7 = 00000000590a321e
	ldstuba	[%o1+0x040]%asi,%l7	! %l7 = 00000000000000b9
!	%f12 = 00000000, Mem[0000000010081410] = 5ea67860
	sta	%f12,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000
!	%f15 = 60f2649e, Mem[00000000100c1408] = 748cc213
	sta	%f15,[%i3+%o4]0x80	! Mem[00000000100c1408] = 60f2649e
!	Mem[0000000010001400] = 000000ff, %l5 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%l1 = 000000009278ef1d, Mem[0000000030001410] = fff0c869
	stwa	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = 9278ef1d
!	%l4 = 7d000000, %l5 = 000000ff, Mem[0000000010181410] = 0032b959 4dfc9ff5
	stda	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 7d000000 000000ff

p0_label_106:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 37e230e2, %l4 = 000000007d000000
	ldsha	[%i6+%g0]0x80,%l4	! %l4 = 00000000000037e2
!	Mem[00000000100c1408] = 60f2649e, %l2 = 93028b1aff344c54
	lduha	[%i3+%o4]0x80,%l2	! %l2 = 00000000000060f2
!	Mem[0000000030101408] = 60000000ffff0000, %l1 = 000000009278ef1d
	ldxa	[%i4+%o4]0x81,%l1	! %l1 = 60000000ffff0000
!	Mem[0000000010081410] = 00000000, %l3 = 00000000000000ff
	ldsha	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101400] = ffffb989, %l0 = 000000000000005a
	lduba	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000089
!	%l4 = 00000000000037e2, imm = fffffffffffffde0, %l0 = 0000000000000089
	add	%l4,-0x220,%l0		! %l0 = 00000000000035c2
!	Mem[0000000021800180] = 3b561158, %l6 = 00000000ffffff00
	lduh	[%o3+0x180],%l6		! %l6 = 0000000000003b56
!	Mem[0000000010081428] = 009273a1, %l0 = 00000000000035c2
	ldsw	[%i2+0x028],%l0		! %l0 = 00000000009273a1
!	Mem[0000000030001410] = 9278ef1d, %l1 = 60000000ffff0000
	lduba	[%i0+%o5]0x89,%l1	! %l1 = 000000000000001d
!	Mem[0000000010001424] = 60785a49, %l7 = 00000000000000b9, %asi = 80
	lduba	[%i0+0x024]%asi,%l7	! %l7 = 0000000000000060

p0_label_107:
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = 00002808, %l5 = 00000000000000ff
	ldstuba	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000
!	%l1 = 000000000000001d, %l2 = 00000000000060f2, %l1 = 000000000000001d
	addc	%l1,%l2,%l1		! %l1 = 000000000000610f
!	%l1 = 000000000000610f, Mem[000000001000143b] = 13c28c74, %asi = 80
	stba	%l1,[%i0+0x03b]%asi	! Mem[0000000010001438] = 13c28c0f
!	Mem[0000000030041408] = 00000000, %l4 = 00000000000037e2
	swapa	[%i1+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000030001408] = 1b6b89ff
	stba	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 1b6b8900
!	Mem[00000000211c0000] = ff002808, %l3 = 0000000000000000
	ldstub	[%o2+%g0],%l3		! %l3 = 00000000000000ff
!	%l5 = 0000000000000000, %l0 = 00000000009273a1, %y  = 00000007
	umul	%l5,%l0,%l5		! %l5 = 0000000000000000, %y = 00000000
!	%f5  = 79a72ebf, Mem[0000000010181414] = 000000ff
	st	%f5 ,[%i6+0x014]	! Mem[0000000010181414] = 79a72ebf
!	Mem[0000000010041408] = 00001e32, %l5 = 0000000000000000
	swapa	[%i1+%o4]0x88,%l5	! %l5 = 0000000000001e32
!	Mem[0000000030041408] = 000037e2, %l0 = 00000000009273a1
	swapa	[%i1+%o4]0x81,%l0	! %l0 = 00000000000037e2

p0_label_108:
!	Starting 10 instruction Load Burst
!	%f21 = 09fa318b, %f20 = 67d93f05
	fsqrts	%f21,%f20		! %f20 = 24b2f465
!	Mem[0000000030101408] = 00000060, %l2 = 00000000000060f2
	lduba	[%i4+%o4]0x89,%l2	! %l2 = 0000000000000060
!	Mem[00000000300c1400] = 0032b95900000000, %l1 = 000000000000610f
	ldxa	[%i3+%g0]0x81,%l1	! %l1 = 0032b95900000000
!	Mem[0000000010041410] = fffffc4d, %l6 = 0000000000003b56
	lduha	[%i1+%o5]0x80,%l6	! %l6 = 000000000000ffff
!	Mem[00000000300c1400] = 59b93200, %l7 = 0000000000000060
	lduwa	[%i3+%g0]0x89,%l7	! %l7 = 0000000059b93200
!	Mem[0000000010041400] = 00000000, %l5 = 0000000000001e32
	ldsha	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181418] = 7fa1a312, %l7 = 0000000059b93200, %asi = 80
	ldswa	[%i6+0x018]%asi,%l7	! %l7 = 000000007fa1a312
!	Mem[0000000030141408] = 00000000, %l4 = 0000000000000000
	lduwa	[%i5+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l7 = 000000007fa1a312
	lduwa	[%i3+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 60f2649e6bfa2267, %f24 = c3efc137 5a256745
	ldda	[%i3+%o4]0x80,%f24	! %f24 = 60f2649e 6bfa2267

p0_label_109:
!	Starting 10 instruction Store Burst
!	%l1 = 0032b95900000000, Mem[00000000100c140c] = 6bfa2267
	sth	%l1,[%i3+0x00c]		! Mem[00000000100c140c] = 00002267
!	Mem[0000000010101410] = 000000ff, %l6 = 000000000000ffff
	ldstuba	[%i4+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001400] = 1def7892, %l6 = 00000000000000ff
	swapa	[%i0+%g0]0x81,%l6	! %l6 = 000000001def7892
!	%f22 = 5a256745, Mem[0000000030101410] = ff000000
	sta	%f22,[%i4+%o5]0x81	! Mem[0000000030101410] = 5a256745
!	%l2 = 00000060, %l3 = 000000ff, Mem[0000000010081410] = 00000000 b74d105b
	stda	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000060 000000ff
!	%l2 = 0000000000000060, Mem[0000000030181410] = 000000007df6dcff
	stxa	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000000000000060
	membar	#Sync			! Added by membar checker (19)
!	%f28 = a140cd3d d049414f, Mem[0000000030041410] = 09fa318b 67d93f05
	stda	%f28,[%i1+%o5]0x89	! Mem[0000000030041410] = a140cd3d d049414f
!	%f24 = 60f2649e 6bfa2267, %l7 = 0000000000000000
!	Mem[00000000300c1400] = 0032b95900000000
	stda	%f24,[%i3+%l7]ASI_PST32_S ! Mem[00000000300c1400] = 0032b95900000000
!	Mem[0000000010081400] = ff000000 0000000f 1e320a59 00000000
!	%f0  = fffffc4d ffffffff 00000015 7ff9540f
!	%f4  = 00000000 79a72ebf fffffc4d 00000000
!	%f8  = 3dcd40a1 60785a49 37e230e2 1b6b89b9
!	%f12 = 00000000 590a321e f59ffc4d 60f2649e
	stda	%f0 ,[%i2+%g0]ASI_BLK_PL	! Block Store to 0000000010081400
!	Mem[0000000030081410] = 000013c2, %l5 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l5	! %l5 = 00000000000000c2

p0_label_110:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00ffffff, %l6 = 000000001def7892
	lduha	[%i6+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1410] = 00001f00, %l5 = 00000000000000c2
	ldswa	[%i3+%o5]0x88,%l5	! %l5 = 0000000000001f00
!	Mem[0000000010101418] = 306e00002eff1f6b, %f24 = 60f2649e 6bfa2267, %asi = 80
	ldda	[%i4+0x018]%asi,%f24	! %f24 = 306e0000 2eff1f6b
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000010081400] = ffffffff, %l4 = 0000000000000000
	lduwa	[%i2+%g0]0x88,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000030001410] = 9278ef1d, %l4 = 00000000ffffffff
	ldsba	[%i0+%o5]0x89,%l4	! %l4 = 000000000000001d
!	Mem[0000000030081400] = 7df6dca1, %l6 = 00000000000000ff
	lduha	[%i2+%g0]0x81,%l6	! %l6 = 0000000000007df6
!	Mem[0000000010041400] = 00000000, %l3 = 00000000000000ff
	ldswa	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101408] = 60000000, %l0 = 00000000000037e2
	lduwa	[%i4+%o4]0x81,%l0	! %l0 = 0000000060000000
!	Mem[0000000010101408] = ff0000ff, %l6 = 0000000000007df6
	ldsba	[%i4+%o4]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030081400] = 7df6dca1 748cc213 ff000000 159ffc4d
!	Mem[0000000030081410] = ff130000 00000000 7fa1a312 2144839b
!	Mem[0000000030081420] = 495a7860 453b5af1 60f2649e 54b1d777
!	Mem[0000000030081430] = ff3625ff 6677931b 503c6bea 748cc213
	ldda	[%i2+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030081400

p0_label_111:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = ff0000ff, %l4 = 000000000000001d
	swapa	[%i4+%o4]0x88,%l4	! %l4 = 00000000ff0000ff
!	Mem[0000000010181428] = ffffffff, %l5 = 0000000000001f00
	swap	[%i6+0x028],%l5		! %l5 = 00000000ffffffff
!	%f4  = 00000000 79a72ebf, %l3 = 0000000000000000
!	Mem[00000000300c1430] = add601104c639a54
	add	%i3,0x030,%g1
	stda	%f4,[%g1+%l3]ASI_PST8_S ! Mem[00000000300c1430] = add601104c639a54
	membar	#Sync			! Added by membar checker (21)
!	%l5 = 00000000ffffffff, Mem[0000000030081400] = a1dcf67d
	stwa	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffff
!	Mem[00000000300c1410] = 00000000, %l2 = 0000000000000060
	ldstuba	[%i3+%o5]0x89,%l2	! %l2 = 0000000000000000
!	%f6  = fffffc4d 00000000, Mem[0000000010141410] = 60000000 00000000
	stda	%f6 ,[%i5+%o5]0x80	! Mem[0000000010141410] = fffffc4d 00000000
!	Mem[0000000010141400] = 15000000, %l0 = 0000000060000000
	ldstuba	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000015
!	%l5 = 00000000ffffffff, Mem[0000000030001408] = 00896b1b
	stha	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = ffff6b1b
!	%l6 = ffffffff, %l7 = 00000000, Mem[0000000030141408] = 00000000 ffffff00
	stda	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffffff 00000000
!	Mem[00000000100c1410] = 00001f00, %l7 = 0000000000000000
	ldstuba	[%i3+%o5]0x88,%l7	! %l7 = 0000000000000000

p0_label_112:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00ffffff, %l2 = 0000000000000000
	ldsha	[%i1+%g0]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141408] = ffc8f0ff, %l5 = 00000000ffffffff
	lduba	[%i5+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000021800080] = 7ec0c898, %l4 = 00000000ff0000ff
	lduh	[%o3+0x080],%l4		! %l4 = 0000000000007ec0
!	Mem[0000000030041408] = a1739200, %l3 = 0000000000000000
	ldswa	[%i1+%o4]0x89,%l3	! %l3 = ffffffffa1739200
!	Mem[0000000030141408] = ffffffff, %l5 = 00000000000000ff
	lduba	[%i5+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181410] = 60000000 00000000, %l2 = ffffffff, %l3 = a1739200
	ldda	[%i6+%o5]0x81,%l2	! %l2 = 0000000060000000 0000000000000000
!	Mem[0000000030081400] = ffffffff, %l6 = ffffffffffffffff
	ldswa	[%i2+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101428] = 60f2649e, %l5 = 00000000000000ff
	ldsh	[%i4+0x028],%l5		! %l5 = 00000000000060f2
!	%l5 = 00000000000060f2, imm = 0000000000000073, %l3 = 0000000000000000
	sub	%l5,0x073,%l3		! %l3 = 000000000000607f
!	Mem[0000000010041408] = 00000000, %f3  = 7ff9540f
	lda	[%i1+%o4]0x80,%f3 	! %f3 = 00000000

p0_label_113:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000060000000, Mem[00000000300c1408] = 1e320a59
	stha	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 1e320000
!	Mem[000000001018142f] = ffff97b8, %l5 = 00000000000060f2
	ldstub	[%i6+0x02f],%l5		! %l5 = 00000000000000b8
!	Mem[00000000100c1408] = 9e64f260, %l5 = 00000000000000b8
	ldstuba	[%i3+%o4]0x88,%l5	! %l5 = 0000000000000060
!	%f26 = 60f2649e 54b1d777, Mem[0000000030101410] = 4567255a 1fdcf67d
	stda	%f26,[%i4+%o5]0x89	! Mem[0000000030101410] = 60f2649e 54b1d777
!	%f23 = 2144839b, Mem[0000000010041430] = 51872fbc
	st	%f23,[%i1+0x030]	! Mem[0000000010041430] = 2144839b
!	%l2 = 60000000, %l3 = 0000607f, Mem[0000000030081408] = 000000ff 4dfc9f15
	stda	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 60000000 0000607f
!	%l7 = 0000000000000000, Mem[0000000030081408] = 60000000
	stha	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = 60000000
!	%l2 = 0000000060000000, Mem[0000000010081408] = 7ff9540f
	stha	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 7ff90000
!	%l5 = 0000000000000060, Mem[000000001014143c] = 1b6b89b9, %asi = 80
	stwa	%l5,[%i5+0x03c]%asi	! Mem[000000001014143c] = 00000060
!	%l6 = ffffffffffffffff, Mem[0000000010041430] = 2144839b, %asi = 80
	stwa	%l6,[%i1+0x030]%asi	! Mem[0000000010041430] = ffffffff

p0_label_114:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ff000000fff6dc1f, %f16 = 7df6dca1 748cc213
	ldda	[%i5+%g0]0x80,%f16	! %f16 = ff000000 fff6dc1f
!	Mem[00000000100c1410] = ff1f0000 00000000, %l4 = 00007ec0, %l5 = 00000060
	ldda	[%i3+%o5]0x80,%l4	! %l4 = 00000000ff1f0000 0000000000000000
!	Mem[0000000030181408] = 8b31fa09, %l2 = 0000000060000000
	ldsha	[%i6+%o4]0x81,%l2	! %l2 = ffffffffffff8b31
!	Mem[0000000010101408] = 0000001d, %l3 = 000000000000607f
	ldsba	[%i4+%o4]0x88,%l3	! %l3 = 000000000000001d
!	Mem[000000001010141f] = 2eff1f6b, %l3 = 000000000000001d, %asi = 80
	ldsba	[%i4+0x01f]%asi,%l3	! %l3 = 000000000000006b
!	Mem[0000000010181407] = 1b6b89b9, %l1 = 0032b95900000000
	ldub	[%i6+0x007],%l1		! %l1 = 00000000000000b9
!	Mem[0000000010141410] = 4dfcffff, %l7 = 0000000000000000
	lduba	[%i5+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041400] = ffffff00 00000000 009273a1 00000000
!	%f0  = fffffc4d ffffffff 00000015 00000000
!	%f4  = 00000000 79a72ebf fffffc4d 00000000
!	%f8  = 3dcd40a1 60785a49 37e230e2 1b6b89b9
!	%f12 = 00000000 590a321e f59ffc4d 60f2649e
	stda	%f0 ,[%i1+%g0]ASI_COMMIT_S	! Block Store to 0000000030041400
!	Mem[0000000010141408] = ffc8f0ff, %l2 = ffffffffffff8b31
	lduwa	[%i5+%o4]0x80,%l2	! %l2 = 00000000ffc8f0ff
!	Mem[00000000100c1410] = ff1f0000 00000000, %l6 = ffffffff, %l7 = 000000ff
	ldda	[%i3+%o5]0x80,%l6	! %l6 = 00000000ff1f0000 0000000000000000

p0_label_115:
!	Starting 10 instruction Store Burst
!	%f12 = 00000000 590a321e, Mem[0000000010141408] = fff0c8ff ffffffff
	stda	%f12,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 590a321e
!	Mem[0000000010141410] = 4dfcffff, %l0 = 0000000000000015
	ldstuba	[%i5+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101411] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i4+0x011]%asi,%l5	! %l5 = 0000000000000000
!	%l3 = 000000000000006b, Mem[0000000010081410] = bf2ea779
	stba	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = 6b2ea779
!	Mem[0000000010101430] = 5c1ab2dc, %l7 = 00000000, %l7 = 00000000
	add	%i4,0x30,%g1
	casa	[%g1]0x80,%l7,%l7	! %l7 = 000000005c1ab2dc
!	%l0 = 00000000000000ff, Mem[00000000300c1410] = ff000000
	stwa	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000ff
!	%l2 = ffc8f0ff, %l3 = 0000006b, Mem[0000000030141408] = ffffffff 00000000
	stda	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = ffc8f0ff 0000006b
!	Mem[0000000030141410] = fffffc4d, %l6 = 00000000ff1f0000
	swapa	[%i5+%o5]0x89,%l6	! %l6 = 00000000fffffc4d
!	Mem[00000000300c1408] = 0000321e, %l0 = 00000000000000ff
	ldstuba	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000
!	%f6  = fffffc4d, Mem[0000000010081400] = ffffffff
	sta	%f6 ,[%i2+%g0]0x80	! Mem[0000000010081400] = fffffc4d

p0_label_116:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff000000, %l3 = 000000000000006b
	lduwa	[%i3+%o5]0x89,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010181400] = 37e230e2, %l2 = 00000000ffc8f0ff
	ldsba	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000037
!	Mem[0000000030181410] = 00000060, %l4 = 00000000ff1f0000
	lduha	[%i6+%o5]0x89,%l4	! %l4 = 0000000000000060
!	Mem[00000000100c143a] = 000000ff, %l5 = 0000000000000000
	lduh	[%i3+0x03a],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030181400] = 00fffffffff0c869, %l2 = 0000000000000037
	ldxa	[%i6+%g0]0x81,%l2	! %l2 = 00fffffffff0c869
!	Mem[0000000010001400] = 00000000, %l5 = 00000000000000ff
	lduha	[%i0+%g0]0x88,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000030041400] = fffffc4d, %f31 = 748cc213
	lda	[%i1+%g0]0x81,%f31	! %f31 = fffffc4d
!	Mem[0000000030081400] = ffffffff, %f21 = 00000000
	lda	[%i2+%g0]0x89,%f21	! %f21 = ffffffff
!	Mem[0000000010181400] = b9896b1b e230e237, %l0 = 00000000, %l1 = 000000b9
	ldda	[%i6+%g0]0x88,%l0	! %l0 = 00000000e230e237 00000000b9896b1b
!	Mem[0000000030041408] = 00000015, %l1 = 00000000b9896b1b
	ldswa	[%i1+%o4]0x81,%l1	! %l1 = 0000000000000015

p0_label_117:
!	Starting 10 instruction Store Burst
!	%f26 = 60f2649e, %f24 = 495a7860, %f29 = 6677931b
	fsubs	%f26,%f24,%f29		! %f29 = 60f2649e
!	%f6  = fffffc4d, Mem[0000000010001400] = 00000000
	sta	%f6 ,[%i0+%g0]0x88	! Mem[0000000010001400] = fffffc4d
!	%l2 = fff0c869, %l3 = ff000000, Mem[0000000010001400] = 4dfcffff 159fff4d, %asi = 80
	stda	%l2,[%i0+0x000]%asi	! Mem[0000000010001400] = fff0c869 ff000000
!	Mem[0000000010141428] = ff000000, %l7 = 5c1ab2dc, %l4 = 00000060
	add	%i5,0x28,%g1
	casa	[%g1]0x80,%l7,%l4	! %l4 = 00000000ff000000
!	%l3 = 00000000ff000000, Mem[0000000010141400] = 1fdcf6ff000000ff
	stxa	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000ff000000
!	%f4  = 00000000 79a72ebf, %l2 = 00fffffffff0c869
!	Mem[0000000030181408] = 8b31fa09000000ff
	add	%i6,0x008,%g1
	stda	%f4,[%g1+%l2]ASI_PST16_S ! Mem[0000000030181408] = 0000fa0900002ebf
!	%l4 = 00000000ff000000, Mem[0000000010081410] = 6b2ea779
	stba	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 002ea779
!	%l1 = 0000000000000015, Mem[0000000030101410] = 77d7b154
	stha	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = 0015b154
!	%f28 = ff3625ff 60f2649e, %l5 = 0000000000000000
!	Mem[0000000030041430] = 00000000590a321e
	add	%i1,0x030,%g1
	stda	%f28,[%g1+%l5]ASI_PST16_S ! Mem[0000000030041430] = 00000000590a321e
!	%l5 = 0000000000000000, Mem[00000000100c1400] = 1b6b89b900009200
	stx	%l5,[%i3+%g0]		! Mem[00000000100c1400] = 0000000000000000

p0_label_118:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 69c8f0ff ffffff00, %l6 = fffffc4d, %l7 = 5c1ab2dc
	ldda	[%i6+%g0]0x89,%l6	! %l6 = 00000000ffffff00 0000000069c8f0ff
!	Mem[0000000030181400] = 00ffffff, %l4 = 00000000ff000000
	lduwa	[%i6+%g0]0x81,%l4	! %l4 = 0000000000ffffff
!	Mem[0000000030101408] = 00000060, %f10 = 37e230e2
	lda	[%i4+%o4]0x89,%f10	! %f10 = 00000060
!	Mem[0000000010081408] = 7ff90000, %l5 = 0000000000000000
	ldswa	[%i2+%o4]0x88,%l5	! %l5 = 000000007ff90000
!	Mem[0000000030181400] = ffffff00, %l7 = 0000000069c8f0ff
	ldswa	[%i6+%g0]0x89,%l7	! %l7 = ffffffffffffff00
!	%l3 = 00000000ff000000, immd = fffffffffffff7d0, %l108 = 0000000000000003
	sdivx	%l3,-0x830,%l3		! %l3 = ffffffffffe0dadf
!	Mem[0000000030141410] = ff1f0000, %f4  = 00000000
	lda	[%i5+%o5]0x89,%f4 	! %f4 = ff1f0000
!	Mem[0000000010001400] = 69c8f0ff, %l0 = 00000000e230e237
	lduha	[%i0+%g0]0x88,%l0	! %l0 = 000000000000f0ff
!	Mem[00000000300c1400] = 0032b95900000000, %l6 = 00000000ffffff00
	ldxa	[%i3+%g0]0x81,%l6	! %l6 = 0032b95900000000
!	Mem[00000000300c1408] = 000000001e3200ff, %l3 = ffffffffffe0dadf
	ldxa	[%i3+%o4]0x89,%l3	! %l3 = 000000001e3200ff

p0_label_119:
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000f0ff, Mem[0000000021800180] = 3b561158, %asi = 80
	stha	%l0,[%o3+0x180]%asi	! Mem[0000000021800180] = f0ff1158
!	%f7  = 00000000, Mem[0000000010141408] = 1e320a59
	sta	%f7 ,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	Mem[0000000010081404] = 4dfcffff, %l6 = 0032b95900000000, %asi = 80
	ldswa	[%i2+0x004]%asi,%l6	! %l6 = 000000004dfcffff
!	%f8  = 3dcd40a1 60785a49, %l6 = 000000004dfcffff
!	Mem[0000000010141430] = 51872fbc0508eb5d
	add	%i5,0x030,%g1
	stda	%f8,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010141430] = 495a7860a140cd3d
!	%l2 = fff0c869, %l3 = 1e3200ff, Mem[0000000010081400] = fffffc4d 4dfcffff, %asi = 80
	stda	%l2,[%i2+0x000]%asi	! Mem[0000000010081400] = fff0c869 1e3200ff
!	%f10 = 00000060 1b6b89b9, Mem[0000000010001428] = 77d7b154 9e64f260, %asi = 80
	stda	%f10,[%i0+0x028]%asi	! Mem[0000000010001428] = 00000060 1b6b89b9
!	%l6 = 000000004dfcffff, Mem[00000000300c1408] = 1e3200ff
	stwa	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 4dfcffff
!	Mem[0000000030141408] = ffc8f0ff, %l0 = 000000000000f0ff
	ldstuba	[%i5+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	%f26 = 60f2649e, Mem[00000000100c1410] = 00001fff
	sta	%f26,[%i3+%o5]0x88	! Mem[00000000100c1410] = 60f2649e
!	%l1 = 0000000000000015, Mem[00000000100c1408] = fff2649e
	stha	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0015649e

p0_label_120:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = fffffc4d, %l7 = ffffffffffffff00
	lduba	[%i1+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041410] = 00000000 79a72ebf, %l2 = fff0c869, %l3 = 1e3200ff
	ldda	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000 0000000079a72ebf
!	Mem[000000001004142a] = ff000000, %l1 = 0000000000000015
	ldsb	[%i1+0x02a],%l1		! %l1 = 0000000000000000
!	Mem[0000000010141410] = 4dfcffff, %f4  = ff1f0000
	lda	[%i5+%o5]0x88,%f4 	! %f4 = 4dfcffff
!	Mem[0000000010001410] = 4567255a, %l3 = 0000000079a72ebf
	lduwa	[%i0+%o5]0x80,%l3	! %l3 = 000000004567255a
!	Mem[0000000030181400] = 69c8f0ff ffffff00, %l2 = 00000000, %l3 = 4567255a
	ldda	[%i6+%g0]0x89,%l2	! %l2 = 00000000ffffff00 0000000069c8f0ff
!	Mem[0000000010001410] = 5a256745, %l4 = 0000000000ffffff
	ldsba	[%i0+%o5]0x88,%l4	! %l4 = 0000000000000045
!	Mem[0000000010041400] = 00000000, %l0 = 00000000000000ff
	lduba	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041410] = fffffc4d 00000000, %l2 = ffffff00, %l3 = 69c8f0ff
	ldda	[%i1+%o5]0x80,%l2	! %l2 = 00000000fffffc4d 0000000000000000
!	Mem[00000000100c1400] = 00000000 00000000, %l6 = 4dfcffff, %l7 = 000000ff
	ldda	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000000 0000000000000000

p0_label_121:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010081408] = 0000f97f15000000, %asi = 80
	stxa	%l0,[%i2+0x008]%asi	! Mem[0000000010081408] = 0000000000000000
!	%f30 = 503c6bea, %f23 = 2144839b
	fsqrts	%f30,%f23		! %f23 = 47dba073
!	%l5 = 000000007ff90000, Mem[0000000030041400] = 4dfcffff
	stba	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = 4dfcff00
!	Mem[00000000100c1408] = 0015649e, %l5 = 000000007ff90000
	lduha	[%i3+%o4]0x80,%l5	! %l5 = 0000000000000015
!	%f22 = 7fa1a312 47dba073, Mem[0000000030081408] = 60000000 0000607f
	stda	%f22,[%i2+%o4]0x89	! Mem[0000000030081408] = 7fa1a312 47dba073
!	%l0 = 0000000000000000, Mem[0000000030141408] = ffc8f0ff
	stha	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000f0ff
!	%l6 = 0000000000000000, Mem[00000000300c1410] = 00000000ff000000
	stxa	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000000000000000
!	%f0  = fffffc4d, Mem[0000000010141414] = 00000000
	st	%f0 ,[%i5+0x014]	! Mem[0000000010141414] = fffffc4d
!	%l2 = 00000000fffffc4d, immd = fffffffffffff971, %l108 = 0000000000000005
	udivx	%l2,-0x68f,%l5		! %l5 = 0000000000000000
!	Mem[0000000010141410] = fffffc4d, %l3 = 0000000000000000
	swapa	[%i5+%o5]0x80,%l3	! %l3 = 00000000fffffc4d

p0_label_122:
!	Starting 10 instruction Load Burst
!	%l2 = 00000000fffffc4d, %l0 = 0000000000000000, %l0 = 0000000000000000
	xor	%l2,%l0,%l0		! %l0 = 00000000fffffc4d
!	Mem[0000000030101410] = 0015b1549e64f260, %f8  = 3dcd40a1 60785a49
	ldda	[%i4+%o5]0x81,%f8 	! %f8  = 0015b154 9e64f260
!	Mem[00000000300c1400] = 0032b959, %f15 = 60f2649e
	lda	[%i3+%g0]0x81,%f15	! %f15 = 0032b959
!	Mem[0000000030001400] = 00000000 ff000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i0+%g0]0x89,%l6	! %l6 = 00000000ff000000 0000000000000000
!	Mem[000000001010143d] = 9278ef1d, %l3 = 00000000fffffc4d, %asi = 80
	lduba	[%i4+0x03d]%asi,%l3	! %l3 = 0000000000000078
!	Mem[0000000010181410] = 7d000000 79a72ebf, %l6 = ff000000, %l7 = 00000000
	ldda	[%i6+%o5]0x80,%l6	! %l6 = 000000007d000000 0000000079a72ebf
!	Mem[0000000030141408] = fff00000, %l0 = 00000000fffffc4d
	ldsba	[%i5+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081410] = ff130000, %l3 = 0000000000000078
	ldsba	[%i2+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010081410] = 79a72e00, %l1 = 0000000000000000
	ldswa	[%i2+%o5]0x88,%l1	! %l1 = 0000000079a72e00
!	%l2 = 00000000fffffc4d, %l6 = 000000007d000000, %l4 = 0000000000000045
	and	%l2,%l6,%l4		! %l4 = 000000007d000000

p0_label_123:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000079a72ebf, Mem[0000000010041408] = 00000000
	stwa	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = 79a72ebf
!	%l0 = 0000000000000000, %l4 = 000000007d000000, %l6 = 000000007d000000
	xnor	%l0,%l4,%l6		! %l6 = ffffffff82ffffff
!	%l4 = 000000007d000000, Mem[00000000211c0000] = ff002808
	sth	%l4,[%o2+%g0]		! Mem[00000000211c0000] = 00002808
!	Mem[0000000010081400] = 69c8f0ff, %l6 = 0000000082ffffff
	swapa	[%i2+%g0]0x88,%l6	! %l6 = 0000000069c8f0ff
!	%f8  = 0015b154 9e64f260, Mem[0000000010181428] = 00001f00 ffff97ff
	std	%f8 ,[%i6+0x028]	! Mem[0000000010181428] = 0015b154 9e64f260
!	Mem[0000000030041408] = 00000015, %l5 = 0000000000000000
	swapa	[%i1+%o4]0x81,%l5	! %l5 = 0000000000000015
!	Mem[0000000030001408] = ffff6b1b, %l2 = 00000000fffffc4d
	swapa	[%i0+%o4]0x81,%l2	! %l2 = 00000000ffff6b1b
!	%f23 = 47dba073, Mem[0000000030101408] = 60000000
	sta	%f23,[%i4+%o4]0x81	! Mem[0000000030101408] = 47dba073
!	%l7 = 0000000079a72ebf, Mem[0000000030101408] = 73a0db47
	stha	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 73a02ebf
!	%l3 = ffffffffffffffff, Mem[0000000010141410] = 00000000
	stha	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000ffff

p0_label_124:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041430] = ffffffff0508eb5d, %f12 = 00000000 590a321e
	ldd	[%i1+0x030],%f12	! %f12 = ffffffff 0508eb5d
!	Mem[0000000030181400] = 69c8f0ffffffff00, %f28 = ff3625ff 60f2649e
	ldda	[%i6+%g0]0x89,%f28	! %f28 = 69c8f0ff ffffff00
!	Mem[0000000030181410] = 00000060, %l1 = 0000000079a72e00
	ldswa	[%i6+%o5]0x89,%l1	! %l1 = 0000000000000060
!	Mem[0000000010041400] = 00000000, %l2 = 00000000ffff6b1b
	ldsba	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001400] = fff0c869ff000000, %l2 = 0000000000000000
	ldxa	[%i0+%g0]0x80,%l2	! %l2 = fff0c869ff000000
!	Mem[0000000030001400] = ff000000, %l5 = 0000000000000015
	lduwa	[%i0+%g0]0x89,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010001400] = 69c8f0ff, %l5 = 00000000ff000000
	lduwa	[%i0+%g0]0x88,%l5	! %l5 = 0000000069c8f0ff
!	Mem[0000000010101410] = ffff0000 590a321e, %l2 = ff000000, %l3 = ffffffff
	ldda	[%i4+%o5]0x80,%l2	! %l2 = 00000000ffff0000 00000000590a321e
!	Mem[0000000030181410] = 60000000, %l0 = 0000000000000000
	ldsba	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000060
!	Mem[0000000010041400] = 00000000, %l6 = 0000000069c8f0ff
	ldswa	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000

p0_label_125:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041430] = ffffffff, %l6 = 0000000000000000, %asi = 80
	swapa	[%i1+0x030]%asi,%l6	! %l6 = 00000000ffffffff
!	%l5 = 0000000069c8f0ff, Mem[0000000010181410] = 7d00000079a72ebf
	stxa	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000069c8f0ff
!	Mem[000000001000141b] = 650c0b2f, %l7 = 0000000079a72ebf
	ldstuba	[%i0+0x01b]%asi,%l7	! %l7 = 000000000000002f
!	Mem[0000000010041422] = 4f4149d0, %l0 = 0000000000000060
	ldstuba	[%i1+0x022]%asi,%l0	! %l0 = 0000000000000049
!	Mem[0000000030141400] = 6078004d, %l0 = 0000000000000049
	ldstuba	[%i5+%g0]0x89,%l0	! %l0 = 000000000000004d
!	Mem[0000000030001410] = 1def7892, %l2 = 00000000ffff0000
	swapa	[%i0+%o5]0x81,%l2	! %l2 = 000000001def7892
!	Mem[0000000010181408] = 809200b3, %l3 = 00000000590a321e
	ldstuba	[%i6+%o4]0x88,%l3	! %l3 = 00000000000000b3
!	Mem[0000000010141400] = 000000ff 00000000 00000000 00000000
!	%f0  = fffffc4d ffffffff 00000015 00000000
!	%f4  = 4dfcffff 79a72ebf fffffc4d 00000000
!	%f8  = 0015b154 9e64f260 00000060 1b6b89b9
!	%f12 = ffffffff 0508eb5d f59ffc4d 0032b959
	stda	%f0 ,[%i5+%g0]ASI_BLK_AIUP	! Block Store to 0000000010141400
!	Mem[00000000100c1400] = 00000000, %l4 = 000000007d000000
	swapa	[%i3+%g0]0x88,%l4	! %l4 = 0000000000000000
!	%l3 = 00000000000000b3, Mem[0000000030041410] = 00000000
	stha	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000b3

p0_label_126:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00000000000013ff, %l4 = 0000000000000000
	ldxa	[%i2+%o5]0x89,%l4	! %l4 = 00000000000013ff
!	Mem[0000000030041400] = 4dfcff00, %f22 = 7fa1a312
	lda	[%i1+%g0]0x89,%f22	! %f22 = 4dfcff00
!	Mem[0000000010041410] = fffffc4d00000000, %f16 = ff000000 fff6dc1f
	ldda	[%i1+%o5]0x80,%f16	! %f16 = fffffc4d 00000000
!	Mem[00000000211c0001] = 00002808, %l7 = 000000000000002f
	ldub	[%o2+0x001],%l7		! %l7 = 0000000000000000
!	Mem[00000000300c1400] = 0032b95900000000, %f28 = 69c8f0ff ffffff00
	ldda	[%i3+%g0]0x81,%f28	! %f28 = 0032b959 00000000
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000010141400] = 4dfcffff, %l1 = 0000000000000060
	lduha	[%i5+%g0]0x88,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030081410] = 000013ff, %f17 = 00000000
	lda	[%i2+%o5]0x89,%f17	! %f17 = 000013ff
!	Mem[0000000030041400] = 00fffc4d, %l2 = 000000001def7892
	ldswa	[%i1+%g0]0x81,%l2	! %l2 = 0000000000fffc4d
!	Mem[0000000030081408] = 47dba073, %l0 = 000000000000004d
	ldsha	[%i2+%o4]0x89,%l0	! %l0 = ffffffffffffa073
!	Mem[0000000030101408] = bf2ea073, %l5 = 0000000069c8f0ff
	ldswa	[%i4+%o4]0x81,%l5	! %l5 = ffffffffbf2ea073

p0_label_127:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = bf2ea073, %l3 = 00000000000000b3
	ldsha	[%i4+%o4]0x81,%l3	! %l3 = ffffffffffffbf2e
!	%l4 = 00000000000013ff, Mem[0000000030081410] = 00000000000013ff
	stxa	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000000013ff
!	%l0 = ffffffffffffa073, Mem[0000000010101408] = 1d000000
	stwa	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = ffffa073
!	%f26 = 60f2649e 54b1d777, Mem[0000000010141400] = 4dfcffff ffffffff
	stda	%f26,[%i5+%g0]0x88	! Mem[0000000010141400] = 60f2649e 54b1d777
!	%f18 = ff000000 159ffc4d, %l2 = 0000000000fffc4d
!	Mem[0000000010181418] = 7fa1a3120508eb5d
	add	%i6,0x018,%g1
	stda	%f18,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010181418] = 4da19f150508005d
!	%l6 = 00000000ffffffff, Mem[00000000300c1408] = 4dfcffff
	stha	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 4dfcffff
!	Mem[0000000010081420] = 495a7860a140cd3d, %l3 = ffffffffffffbf2e, %l2 = 0000000000fffc4d
	add	%i2,0x20,%g1
	casxa	[%g1]0x80,%l3,%l2	! %l2 = 495a7860a140cd3d
!	%l7 = 0000000000000000, Mem[0000000010001400] = 69c8f0ff
	stba	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 69c8f000
!	Mem[0000000020800001] = ffff53a8, %l5 = ffffffffbf2ea073
	ldstuba	[%o1+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	%f13 = 0508eb5d, Mem[00000000300c1408] = 4dfcffff
	sta	%f13,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0508eb5d

p0_label_128:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800001] = ffff53a8, %l4 = 00000000000013ff
	ldub	[%o1+0x001],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010141408] = 0000000015000000, %l4 = 00000000000000ff
	ldxa	[%i5+%o4]0x88,%l4	! %l4 = 0000000015000000
!	Mem[0000000030101408] = 0000ffff73a02ebf, %l7 = 0000000000000000
	ldxa	[%i4+%o4]0x89,%l7	! %l7 = 0000ffff73a02ebf
!	%l0 = ffffffffffffa073, %l1 = 000000000000ffff, %y  = 00000000
	sdiv	%l0,%l1,%l7		! %l7 = 0000000000010000
	mov	%l0,%y			! %y = ffffa073
!	Mem[0000000010101410] = 0000ffff, %l7 = 0000000000010000
	ldsba	[%i4+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000300c1408] = 5deb0805, %l1 = 000000000000ffff
	ldswa	[%i3+%o4]0x81,%l1	! %l1 = 000000005deb0805
!	Mem[0000000030181400] = 69c8f0ffffffff00, %l6 = 00000000ffffffff
	ldxa	[%i6+%g0]0x89,%l6	! %l6 = 69c8f0ffffffff00
!	Mem[0000000030081408] = 7fa1a312 47dba073, %l0 = ffffa073, %l1 = 5deb0805
	ldda	[%i2+%o4]0x89,%l0	! %l0 = 0000000047dba073 000000007fa1a312
!	Mem[0000000010001414] = 37c1efc3, %f4  = 4dfcffff
	ld	[%i0+0x014],%f4 	! %f4 = 37c1efc3
!	Mem[0000000030141410] = 00001fff, %f8  = 0015b154
	lda	[%i5+%o5]0x81,%f8 	! %f8 = 00001fff

p0_label_129:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 73a02ebf, %l6 = 69c8f0ffffffff00
	ldstuba	[%i4+%o4]0x89,%l6	! %l6 = 00000000000000bf
!	%l4 = 15000000, %l5 = 000000ff, Mem[00000000300c1410] = 00000000 00000000
	stda	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 15000000 000000ff
!	%l5 = 00000000000000ff, Mem[0000000030141400] = ff007860
	stha	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 00ff7860
!	%f18 = ff000000 159ffc4d, %l0 = 0000000047dba073
!	Mem[0000000030001430] = 437e968c40bc34ed
	add	%i0,0x030,%g1
	stda	%f18,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030001430] = 4dfc9f1540bc34ed
!	Mem[0000000010001410] = 5a256745, %l6 = 00000000000000bf
	swapa	[%i0+%o5]0x88,%l6	! %l6 = 000000005a256745
!	%l3 = ffffffffffffbf2e, Mem[0000000030141400] = 00ff7860
	stba	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 2eff7860
!	Mem[0000000010141400] = 77d7b154, %l0 = 0000000047dba073
	swapa	[%i5+%g0]0x80,%l0	! %l0 = 0000000077d7b154
!	%l5 = 00000000000000ff, Mem[0000000010141408] = 00000015
	stha	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 00ff0015
!	%l1 = 000000007fa1a312, Mem[0000000010101410] = 0000ffff
	stwa	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = 7fa1a312
!	%l6 = 000000005a256745, Mem[0000000030041400] = 4dfcff00
	stba	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 4dfcff45

p0_label_130:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 0000007d, %l7 = ffffffffffffffff
	lduha	[%i4+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181402] = 37e230e2, %l4 = 0000000015000000
	lduh	[%i6+0x002],%l4		! %l4 = 00000000000030e2
!	Mem[0000000030181400] = 69c8f0ff ffffff00, %l0 = 77d7b154, %l1 = 7fa1a312
	ldda	[%i6+%g0]0x89,%l0	! %l0 = 00000000ffffff00 0000000069c8f0ff
!	Mem[0000000010141408] = 00ff0015, %l5 = 00000000000000ff
	ldsba	[%i5+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1410] = 15000000, %l7 = 0000000000000000
	ldswa	[%i3+%o5]0x81,%l7	! %l7 = 0000000015000000
!	Mem[0000000010101410] = 12a3a17f590a321e, %f24 = 495a7860 453b5af1, %asi = 80
	ldda	[%i4+0x010]%asi,%f24	! %f24 = 12a3a17f 590a321e
!	Mem[0000000010181408] = 809200ff, %f14 = f59ffc4d
	lda	[%i6+%o4]0x88,%f14	! %f14 = 809200ff
!	Mem[0000000030001410] = ffff0000, %l1 = 0000000069c8f0ff
	ldsha	[%i0+%o5]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010141410] = 4dfcffff 79a72ebf, %l6 = 5a256745, %l7 = 15000000
	ldda	[%i5+%o5]0x80,%l6	! %l6 = 000000004dfcffff 0000000079a72ebf
!	Mem[0000000030101400] = 0000007d00000000, %l4 = 00000000000030e2
	ldxa	[%i4+%g0]0x81,%l4	! %l4 = 0000007d00000000

p0_label_131:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ffffff00, Mem[0000000030001410] = ffffffff0000ffff
	stxa	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000ffffff00
!	Mem[0000000020800000] = ffff53a8, %l6 = 000000004dfcffff
	ldstub	[%o1+%g0],%l6		! %l6 = 00000000000000ff
!	%f23 = 47dba073, Mem[0000000010141438] = f59ffc4d
	st	%f23,[%i5+0x038]	! Mem[0000000010141438] = 47dba073
!	%f10 = 00000060, %f29 = 00000000, %f24 = 12a3a17f
	fmuls	%f10,%f29,%f24		! %f24 = 00000000
!	Mem[0000000010101438] = 1b937766, %l4 = 00000000, %l0 = ffffff00
	add	%i4,0x38,%g1
	casa	[%g1]0x80,%l4,%l0	! %l0 = 000000001b937766
!	%l5 = 0000000000000000, Mem[0000000010101400] = 89b9ffff000000ff
	stxa	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000000000000000
!	Mem[00000000300c1408] = 5deb0805, %l0 = 000000001b937766
	swapa	[%i3+%o4]0x81,%l0	! %l0 = 000000005deb0805
!	Mem[0000000030001408] = 4dfcffff, %l3 = 00000000ffffbf2e
	swapa	[%i0+%o4]0x89,%l3	! %l3 = 000000004dfcffff
!	Mem[00000000100c1410] = 9e64f260, %l6 = 00000000000000ff
	swapa	[%i3+%o5]0x80,%l6	! %l6 = 000000009e64f260
!	Mem[0000000010001410] = bf000000, %l4 = 0000000000000000
	swapa	[%i0+%o5]0x80,%l4	! %l4 = 00000000bf000000

p0_label_132:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 000000b3, %l1 = ffffffffffffffff
	ldswa	[%i1+%o5]0x89,%l1	! %l1 = 00000000000000b3
!	Mem[0000000010101400] = 00000000, %l7 = 0000000079a72ebf
	ldsha	[%i4+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041400] = 00000000 0a5940a1, %l6 = 9e64f260, %l7 = 00000000
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000 000000000a5940a1
!	Mem[0000000010181408] = ff009280ff80ffff, %l5 = 0000000000000000, %asi = 80
	ldxa	[%i6+0x008]%asi,%l5	! %l5 = ff009280ff80ffff
!	Mem[00000000100c1410] = ff000000, %l4 = 00000000bf000000
	lduba	[%i3+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001438] = 13c28c0f7fcaa07f, %f18 = ff000000 159ffc4d, %asi = 80
	ldda	[%i0+0x038]%asi,%f18	! %f18 = 13c28c0f 7fcaa07f
!	Mem[0000000030181408] = 0000fa09, %l0 = 000000005deb0805
	ldsba	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0000] = 00006378, %l6 = 0000000000000000, %asi = 80
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101410] = 12a3a17f, %l7 = 000000000a5940a1
	ldsba	[%i4+%o5]0x80,%l7	! %l7 = 0000000000000012
!	Mem[0000000010081400] = 82ffffff, %l3 = 000000004dfcffff
	lduha	[%i2+%g0]0x88,%l3	! %l3 = 000000000000ffff

p0_label_133:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[00000000300c1408] = 6677931b
	stba	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 66779300
!	Mem[0000000010101408] = 73a0ffff, %l2 = 495a7860a140cd3d
	lduwa	[%i4+%o4]0x88,%l2	! %l2 = 0000000073a0ffff
!	%f8  = 00001fff, %f26 = 60f2649e, %f21 = ffffffff
	fsubs	%f8 ,%f26,%f21		! tt=0x22, %l0 = 0000000000000022
!	Mem[0000000030101408] = 73a02eff, %l1 = 00000000000000b3
	swapa	[%i4+%o4]0x89,%l1	! %l1 = 0000000073a02eff
!	%l6 = 0000000000000000, Mem[00000000300c1410] = 00000015
	stha	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	Mem[0000000030141408] = fff00000, %l3 = 000000000000ffff
	swapa	[%i5+%o4]0x89,%l3	! %l3 = 00000000fff00000
!	%l7 = 0000000000000012, Mem[00000000201c0001] = 00006378
	stb	%l7,[%o0+0x001]		! Mem[00000000201c0000] = 00126378
!	Mem[0000000010101400] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = ffffff82 1e3200ff 00000000 00000000
!	%f16 = fffffc4d 000013ff 13c28c0f 7fcaa07f
!	%f20 = ff130000 ffffffff 4dfcff00 47dba073
!	%f24 = 00000000 590a321e 60f2649e 54b1d777
!	%f28 = 0032b959 00000000 503c6bea fffffc4d
	stda	%f16,[%i2+%g0]ASI_COMMIT_P	! Block Store to 0000000010081400
!	%l7 = 0000000000000012, Mem[000000001014143c] = 0032b959, %asi = 80
	stwa	%l7,[%i5+0x03c]%asi	! Mem[000000001014143c] = 00000012

p0_label_134:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000 69c8f0ff, %l0 = 00000022, %l1 = 73a02eff
	ldda	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000 0000000069c8f0ff
!	Mem[00000000100c1408] = 9e641500, %l3 = 00000000fff00000
	lduba	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041400] = a140590a00000000, %f0  = fffffc4d ffffffff
	ldda	[%i1+%g0]0x88,%f0 	! %f0  = a140590a 00000000
!	%l6 = 0000000000000000, %l0 = 0000000000000000, %l2 = 0000000073a0ffff
	or	%l6,%l0,%l2		! %l2 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l5 = ff009280ff80ffff
	lduha	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000010081410] = 000013ff, %l7 = 0000000000000012
	ldstuba	[%i2+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181410] = 6000000000000000, %f20 = ff130000 ffffffff
	ldda	[%i6+%o5]0x81,%f20	! %f20 = 60000000 00000000
!	Mem[0000000010141428] = 00000060 1b6b89b9, %l2 = 00000000, %l3 = 00000000
	ldd	[%i5+0x028],%l2		! %l2 = 0000000000000060 000000001b6b89b9
!	Mem[0000000010181400] = 37e230e2, %l2 = 0000000000000060
	lduba	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000037
!	Mem[0000000030001408] = 2ebfffffe230e237, %f8  = 00001fff 9e64f260
	ldda	[%i0+%o4]0x81,%f8 	! %f8  = 2ebfffff e230e237

p0_label_135:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000037, Mem[0000000030101408] = 000000b3
	stwa	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000037
!	Mem[00000000300c1410] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l0	! %l0 = 0000000000000000
!	%l4 = 0000000000000000, %l2 = 0000000000000037, %l1 = 0000000069c8f0ff
	udivx	%l4,%l2,%l1		! %l1 = 0000000000000000
!	Mem[0000000030181400] = ffffff00, %l0 = 0000000000000000
	swapa	[%i6+%g0]0x89,%l0	! %l0 = 00000000ffffff00
!	%l0 = ffffff00, %l1 = 00000000, Mem[0000000010141400] = 73a0db47 60f2649e
	stda	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffff00 00000000
!	Mem[00000000201c0001] = 00126378, %l5 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l5	! %l5 = 0000000000000012
!	%l4 = 0000000000000000, Mem[0000000030101400] = 0000007d
	stha	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000007d
!	%l4 = 0000000000000000, %l2 = 0000000000000037, %l7 = 00000000000000ff
	orn	%l4,%l2,%l7		! %l7 = ffffffffffffffc8
!	Mem[0000000010141400] = 00ffffff, %l2 = 0000000000000037
	swapa	[%i5+%g0]0x80,%l2	! %l2 = 0000000000ffffff
!	%l1 = 0000000000000000, Mem[0000000010081400] = 4dfcffff
	stba	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = 4dfcff00

p0_label_136:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ffffffff, %l3 = 000000001b6b89b9
	lduha	[%i2+%g0]0x81,%l3	! %l3 = 000000000000ffff
!	Mem[0000000030141408] = ffff0000, %l6 = 0000000000000000
	lduha	[%i5+%o4]0x81,%l6	! %l6 = 000000000000ffff
!	Mem[000000001004140c] = ffffffff, %l3 = 000000000000ffff, %asi = 80
	lduwa	[%i1+0x00c]%asi,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000010001410] = 00000000, %l1 = 0000000000000000
	ldsba	[%i0+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141424] = 9e64f260, %l7 = ffffffffffffffc8, %asi = 80
	ldswa	[%i5+0x024]%asi,%l7	! %l7 = ffffffff9e64f260
!	Mem[0000000030081400] = ffffffff, %l1 = 0000000000000000
	lduba	[%i2+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141410] = ffffff36ff1f0000, %l7 = ffffffff9e64f260
	ldxa	[%i5+%o5]0x89,%l7	! %l7 = ffffff36ff1f0000
!	Mem[0000000010141408] = 00ff0015, %l6 = 000000000000ffff
	lduba	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = 4dfcffff, %l3 = 00000000ffffffff
	ldsba	[%i1+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000100c1430] = 0a8dec7c, %l4 = 0000000000000000
	ldsw	[%i3+0x030],%l4		! %l4 = 000000000a8dec7c

p0_label_137:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 45fffc4d, %l6 = 0000000000000000
	ldstuba	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000045
!	%f6  = fffffc4d, Mem[0000000010081410] = 000013ff
	sta	%f6 ,[%i2+%o5]0x88	! Mem[0000000010081410] = fffffc4d
!	%l4 = 0a8dec7c, %l5 = 00000012, Mem[0000000010101400] = ff000000 00000000
	stda	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 0a8dec7c 00000012
!	%l7 = ffffff36ff1f0000, Mem[0000000030141410] = ffffff36ff1f0000
	stxa	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffff36ff1f0000
!	%f26 = 60f2649e, Mem[0000000030101410] = 0015b154
	sta	%f26,[%i4+%o5]0x81	! Mem[0000000030101410] = 60f2649e
!	Mem[0000000030081408] = 73a0db47, %l4 = 000000000a8dec7c
	ldstuba	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000073
!	%l6 = 0000000000000045, Mem[00000000201c0000] = 00ff6378, %asi = 80
	stha	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00456378
!	Mem[0000000010081430] = 0032b95900000000, %l7 = ffffff36ff1f0000, %l0 = 00000000ffffff00
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l7,%l0	! %l0 = 0032b95900000000
!	%l0 = 0032b95900000000, Mem[00000000100c1408] = 9e641500
	stha	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 9e640000
!	Mem[0000000010141408] = 00ff0015, %l4 = 0000000000000073
	swapa	[%i5+%o4]0x80,%l4	! %l4 = 0000000000ff0015

p0_label_138:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001438] = 13c28c0f7fcaa07f, %l0 = 0032b95900000000
	ldx	[%i0+0x038],%l0		! %l0 = 13c28c0f7fcaa07f
!	Mem[0000000010141424] = 9e64f260, %l3 = ffffffffffffffff, %asi = 80
	ldsha	[%i5+0x024]%asi,%l3	! %l3 = ffffffffffff9e64
!	Mem[0000000030001410] = 00000000ffffff00, %f2  = 00000015 00000000
	ldda	[%i0+%o5]0x89,%f2 	! %f2  = 00000000 ffffff00
!	Mem[0000000010081408] = 13c28c0f7fcaa07f, %f8  = 2ebfffff e230e237
	ldda	[%i2+%o4]0x80,%f8 	! %f8  = 13c28c0f 7fcaa07f
!	Mem[0000000010141400] = 37000000, %f9  = 7fcaa07f
	lda	[%i5+%g0]0x88,%f9 	! %f9 = 37000000
!	Mem[0000000010001414] = 37c1efc3, %l3 = ffffffffffff9e64
	lduw	[%i0+0x014],%l3		! %l3 = 0000000037c1efc3
!	Mem[0000000030141410] = ff1f0000, %l2 = 0000000000ffffff
	lduwa	[%i5+%o5]0x89,%l2	! %l2 = 00000000ff1f0000
!	Mem[0000000010041400] = 00000000, %l5 = 0000000000000012
	lduba	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000010081400] = 00fffc4d 000013ff 13c28c0f 7fcaa07f
!	Mem[0000000010081410] = 4dfcffff ffffffff 4dfcff00 47dba073
!	Mem[0000000010081420] = 00000000 590a321e 60f2649e 54b1d777
!	Mem[0000000010081430] = 0032b959 00000000 503c6bea fffffc4d
	ldda	[%i2+%g0]ASI_BLK_AIUP,%f0 	! Block Load from 0000000010081400
!	Mem[0000000010001408] = ffff00ff, %l5 = 0000000000000000
	ldsha	[%i0+%o4]0x88,%l5	! %l5 = 00000000000000ff

p0_label_139:
!	Starting 10 instruction Store Burst
!	%f30 = 503c6bea fffffc4d, Mem[0000000030041410] = 000000b3 bf2ea779
	stda	%f30,[%i1+%o5]0x89	! Mem[0000000030041410] = 503c6bea fffffc4d
!	%l0 = 13c28c0f7fcaa07f, Mem[00000000100c1408] = 672200009e640000
	stxa	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 13c28c0f7fcaa07f
!	%l1 = 00000000000000ff, Mem[0000000010101426] = 04892a90, %asi = 80
	stba	%l1,[%i4+0x026]%asi	! Mem[0000000010101424] = 0489ff90
!	%l0 = 7fcaa07f, %l1 = 000000ff, Mem[0000000030081400] = ffffffff 748cc213
	stda	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 7fcaa07f 000000ff
!	Mem[000000001014141d] = 00000000, %l0 = 13c28c0f7fcaa07f
	ldstub	[%i5+0x01d],%l0		! %l0 = 0000000000000000
!	%l3 = 0000000037c1efc3, Mem[00000000300c1400] = 0032b959
	stha	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = efc3b959
!	%l0 = 0000000000000000, Mem[0000000030001410] = ffffff00
	stha	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = ffff0000
!	%l4 = 00ff0015, %l5 = 000000ff, Mem[0000000010001400] = 69c8f000 000000ff
	stda	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 00ff0015 000000ff
!	%l2 = 00000000ff1f0000, Mem[0000000030181400] = 00000000
	stha	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	%l4 = 0000000000ff0015, Mem[0000000020800000] = ffff53a8
	sth	%l4,[%o1+%g0]		! Mem[0000000020800000] = 001553a8

p0_label_140:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000, %l5 = 00000000000000ff
	ldsba	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c143c] = 6e1b9200, %f25 = 590a321e
	lda	[%i3+0x03c]%asi,%f25	! %f25 = 6e1b9200
!	Mem[0000000010101400] = 7cec8d0a, %l4 = 0000000000ff0015
	lduba	[%i4+%g0]0x88,%l4	! %l4 = 000000000000000a
!	Mem[0000000030141410] = ff1f0000, %l0 = 0000000000000000
	lduba	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000218000c0] = 10ffa0c8, %l6 = 0000000000000045, %asi = 80
	lduha	[%o3+0x0c0]%asi,%l6	! %l6 = 00000000000010ff
!	Mem[0000000030181408] = 0000fa09, %l6 = 00000000000010ff
	ldsba	[%i6+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = c3efc137 00000000, %l2 = ff1f0000, %l3 = 37c1efc3
	ldda	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000000 00000000c3efc137
!	Mem[0000000020800000] = 001553a8, %l1 = 00000000000000ff
	ldsh	[%o1+%g0],%l1		! %l1 = 0000000000000015
!	Mem[0000000010181430] = 00000000, %f17 = 000013ff
	ld	[%i6+0x030],%f17	! %f17 = 00000000
!	Mem[0000000010001418] = 650c0bff12a3a17f, %f30 = 503c6bea fffffc4d, %asi = 80
	ldda	[%i0+0x018]%asi,%f30	! %f30 = 650c0bff 12a3a17f

p0_label_141:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (26)
!	%f18 = 13c28c0f, Mem[0000000010081418] = 4dfcff00
	sta	%f18,[%i2+0x018]%asi	! Mem[0000000010081418] = 13c28c0f
!	%f30 = 650c0bff 12a3a17f, Mem[0000000010081400] = 00fffc4d 000013ff
	stda	%f30,[%i2+%g0]0x80	! Mem[0000000010081400] = 650c0bff 12a3a17f
!	%l6 = 00000000, %l7 = ff1f0000, Mem[0000000030101400] = 0000007d 00000000
	stda	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000 ff1f0000
!	%f18 = 13c28c0f, Mem[0000000030001410] = 0000ffff
	sta	%f18,[%i0+%o5]0x81	! Mem[0000000030001410] = 13c28c0f
!	Mem[0000000010081408] = 13c28c0f, %l3 = 00000000c3efc137
	swapa	[%i2+%o4]0x80,%l3	! %l3 = 0000000013c28c0f
!	%l3 = 0000000013c28c0f, Mem[0000000010001434] = ff344c54, %asi = 80
	stha	%l3,[%i0+0x034]%asi	! Mem[0000000010001434] = 8c0f4c54
!	%f10 = 60f2649e, %f23 = 47dba073, %f21 = 00000000
	fmuls	%f10,%f23,%f21		! %f21 = 694ff3ff
!	%f13 = 00000000, %f28 = 0032b959, %f23 = 47dba073
	fdivs	%f13,%f28,%f23		! %f23 = 00000000
!	%l7 = ffffff36ff1f0000, Mem[0000000010041400] = 00000000
	stha	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	Mem[0000000030001410] = 13c28c0f, %l6 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000013

p0_label_142:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 7fa0ca7f, %f11 = 54b1d777
	lda	[%i2+%g0]0x89,%f11	! %f11 = 7fa0ca7f
!	Mem[00000000100c1408] = 7fa0ca7f, %l6 = 0000000000000013
	lduha	[%i3+%o4]0x80,%l6	! %l6 = 0000000000007fa0
!	Mem[0000000010181400] = 37e230e2, %l3 = 0000000013c28c0f
	ldsha	[%i6+%g0]0x80,%l3	! %l3 = 00000000000037e2
!	Mem[0000000030141408] = ffff0000, %l3 = 00000000000037e2
	lduba	[%i5+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1400] = 59b9c3ef, %l3 = 00000000000000ff
	ldsha	[%i3+%g0]0x89,%l3	! %l3 = ffffffffffffc3ef
!	Mem[0000000010181400] = b9896b1b e230e237, %l2 = 00000000, %l3 = ffffc3ef
	ldda	[%i6+%g0]0x88,%l2	! %l2 = 00000000e230e237 00000000b9896b1b
!	Mem[0000000010041430] = 000000000508eb5d, %l4 = 000000000000000a
	ldx	[%i1+0x030],%l4		! %l4 = 000000000508eb5d
!	Mem[00000000100c1408] = 13c28c0f7fcaa07f, %f10 = 60f2649e 7fa0ca7f
	ldda	[%i3+%o4]0x88,%f10	! %f10 = 13c28c0f 7fcaa07f
!	Mem[0000000030001408] = ffffbf2e, %l2 = 00000000e230e237
	ldsha	[%i0+%o4]0x89,%l2	! %l2 = ffffffffffffbf2e
!	Mem[0000000030081410] = 00000000000013ff, %f6  = 4dfcff00 47dba073
	ldda	[%i2+%o5]0x89,%f6 	! %f6  = 00000000 000013ff

p0_label_143:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 00000037, %l2 = 00000000ffffbf2e
	swapa	[%i4+%o4]0x89,%l2	! %l2 = 0000000000000037
!	%l1 = 0000000000000015, Mem[00000000300c1408] = 00937766
	stha	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00157766
!	Code Fragment 3, seed = 212855
p0_fragment_12:
!	%l0 = 0000000000000000
	setx	0xf5134b90bba9a36e,%g7,%l0 ! %l0 = f5134b90bba9a36e
!	%l1 = 0000000000000015
	setx	0xe345521c66cf9519,%g7,%l1 ! %l1 = e345521c66cf9519
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f5134b90bba9a36e
	setx	0xe8443c93953472d4,%g7,%l0 ! %l0 = e8443c93953472d4
!	%l1 = e345521c66cf9519
	setx	0xf739cfcefe21bf9f,%g7,%l1 ! %l1 = f739cfcefe21bf9f
p0_fragment_12_end:
!	Mem[0000000020800000] = 001553a8, %l0 = e8443c93953472d4
	ldstub	[%o1+%g0],%l0		! %l0 = 0000000000000000
!	Mem[00000000100c1408] = 7fcaa07f, %l5 = 0000000000000000
	ldstuba	[%i3+%o4]0x88,%l5	! %l5 = 000000000000007f
!	%l7 = ffffff36ff1f0000, Mem[0000000010101400] = 7cec8d0a
	stwa	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = ff1f0000
!	%f6  = 00000000 000013ff, Mem[0000000030181410] = 00000060 00000000
	stda	%f6 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000 000013ff
!	%l7 = ffffff36ff1f0000, %l6 = 0000000000007fa0, %y  = ffffa073
	sdiv	%l7,%l6,%l5		! %l5 = ffffffff80000000
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000030101408] = 2ebfffff, %l1 = f739cfcefe21bf9f
	ldstuba	[%i4+%o4]0x81,%l1	! %l1 = 000000000000002e
!	Mem[0000000010181426] = 453b5af1, %l3 = 00000000b9896b1b
	ldstuba	[%i6+0x026]%asi,%l3	! %l3 = 000000000000005a

p0_label_144:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 000000ff, %l1 = 000000000000002e
	lduba	[%i0+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041400] = 4dfcffff, %f30 = 650c0bff
	lda	[%i1+%g0]0x89,%f30	! %f30 = 4dfcffff
!	Mem[0000000010181404] = 1b6b89b9, %l2 = 0000000000000037, %asi = 80
	ldswa	[%i6+0x004]%asi,%l2	! %l2 = 000000001b6b89b9
!	%l5 = ffffffff80000000, %l5 = ffffffff80000000, %l6 = 0000000000007fa0
	andn	%l5,%l5,%l6		! %l6 = 0000000000000000
!	Mem[000000001008141d] = 47dba073, %l5 = ffffffff80000000
	ldub	[%i2+0x01d],%l5		! %l5 = 00000000000000db
!	Mem[0000000010141410] = 4dfcffff, %l1 = 0000000000000000
	ldsha	[%i5+%o5]0x80,%l1	! %l1 = 0000000000004dfc
!	Mem[0000000010101410] = 1e320a597fa1a312, %l6 = 0000000000000000
	ldxa	[%i4+%o5]0x88,%l6	! %l6 = 1e320a597fa1a312
!	%l2 = 000000001b6b89b9, %l0 = 0000000000000000, %y  = 00000000
	smul	%l2,%l0,%l1		! %l1 = 0000000000000000, %y = 00000000
!	Mem[0000000030101400] = 00001fff 00000000, %l6 = 7fa1a312, %l7 = ff1f0000
	ldda	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000 0000000000001fff
!	Mem[0000000030001408] = ffffbf2e, %l3 = 000000000000005a
	ldsba	[%i0+%o4]0x89,%l3	! %l3 = 000000000000002e

p0_label_145:
!	Starting 10 instruction Store Burst
!	Mem[0000000020800001] = ff1553a8, %l0 = 0000000000000000
	ldstub	[%o1+0x001],%l0		! %l0 = 0000000000000015
!	%f16 = fffffc4d 00000000, %l2 = 000000001b6b89b9
!	Mem[0000000010141410] = 4dfcffff79a72ebf
	add	%i5,0x010,%g1
	stda	%f16,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010141410] = 0000000079a72ebf
!	%l3 = 000000000000002e, %l6 = 0000000000000000, %l7 = 0000000000001fff
	and	%l3,%l6,%l7		! %l7 = 0000000000000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010181408] = 809200ff ffff80ff
	stda	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000 00000000
!	%l1 = 0000000000000000, Mem[0000000010101400] = 00001fff
	stha	%l1,[%i4+%g0]0x80	! Mem[0000000010101400] = 00001fff
!	%f30 = 4dfcffff, %f9  = 590a321e, %f15 = fffffc4d
	fmuls	%f30,%f9 ,%f15		! %f15 = 67889387
!	%f26 = 60f2649e, Mem[0000000030181408] = 09fa0000
	sta	%f26,[%i6+%o4]0x89	! Mem[0000000030181408] = 60f2649e
!	Mem[00000000211c0000] = 00002808, %l2 = 000000001b6b89b9
	ldstuba	[%o2+0x000]%asi,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010181438] = 503c6bea
	sth	%l2,[%i6+0x038]		! Mem[0000000010181438] = 00006bea
!	%f18 = 13c28c0f 7fcaa07f, Mem[00000000100c1408] = 7fcaa0ff 13c28c0f
	stda	%f18,[%i3+%o4]0x88	! Mem[00000000100c1408] = 13c28c0f 7fcaa07f

p0_label_146:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00456378, %l0 = 0000000000000015
	ldub	[%o0+%g0],%l0		! %l0 = 0000000000000000
!	Mem[0000000010041408] = 79a72ebfffffffff, %l3 = 000000000000002e, %asi = 80
	ldxa	[%i1+0x008]%asi,%l3	! %l3 = 79a72ebfffffffff
!	Mem[0000000030181410] = 000013ff, %l5 = 00000000000000db
	ldswa	[%i6+%o5]0x89,%l5	! %l5 = 00000000000013ff
!	Mem[0000000010041409] = 79a72ebf, %l7 = 0000000000000000, %asi = 80
	lduba	[%i1+0x009]%asi,%l7	! %l7 = 00000000000000a7
!	Mem[0000000030081400] = 7fa0ca7f, %l6 = 0000000000000000
	ldsba	[%i2+%g0]0x89,%l6	! %l6 = 000000000000007f
!	Mem[0000000010181410] = fff0c869 00000000, %l4 = 0508eb5d, %l5 = 000013ff
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 0000000000000000 00000000fff0c869
!	Mem[00000000300c1400] = efc3b959, %l1 = 0000000000000000
	lduwa	[%i3+%g0]0x81,%l1	! %l1 = 00000000efc3b959
!	Mem[0000000030181410] = ff130000, %l2 = 0000000000000000
	ldswa	[%i6+%o5]0x81,%l2	! %l2 = ffffffffff130000
!	Mem[0000000010181420] = 495a7860 453bfff1, %l6 = 0000007f, %l7 = 000000a7
	ldd	[%i6+0x020],%l6		! %l6 = 00000000495a7860 00000000453bfff1
!	Mem[0000000030081408] = 47dba0ff, %l0 = 0000000000000000
	lduba	[%i2+%o4]0x89,%l0	! %l0 = 00000000000000ff

p0_label_147:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000fff0c869, Mem[00000000211c0000] = ff002808, %asi = 80
	stba	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 69002808
!	%l0 = 000000ff, %l1 = efc3b959, Mem[0000000030141400] = 6078ff2e 00000000
	stda	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff efc3b959
!	Mem[00000000300c1410] = 000000ff, %l7 = 00000000453bfff1
	swapa	[%i3+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	%l1 = 00000000efc3b959, Mem[0000000010081424] = 590a321e, %asi = 80
	stha	%l1,[%i2+0x024]%asi	! Mem[0000000010081424] = b959321e
!	%f24 = 00000000, Mem[00000000100c1410] = ff000000
	sta	%f24,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	%l4 = 0000000000000000, Mem[00000000100c1410] = 0000000000000000
	stxa	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000000000000000
!	%l4 = 0000000000000000, Mem[000000001010141e] = 2eff1f6b, %asi = 80
	stba	%l4,[%i4+0x01e]%asi	! Mem[000000001010141c] = 2eff006b
!	%f15 = 67889387, Mem[0000000030041400] = 4dfcffff
	sta	%f15,[%i1+%g0]0x89	! Mem[0000000030041400] = 67889387
!	%l7 = 00000000000000ff, Mem[0000000021800001] = 02ff0c38
	stb	%l7,[%o3+0x001]		! Mem[0000000021800000] = 02ff0c38
!	Mem[0000000010101408] = 73a0ffff, %l2 = ffffffffff130000
	ldstuba	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff

p0_label_148:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = fffffc4d, %l2 = 00000000000000ff
	ldsba	[%i1+%o5]0x89,%l2	! %l2 = 000000000000004d
!	Mem[0000000010101400] = 00001fff, %l5 = 00000000fff0c869
	lduwa	[%i4+%g0]0x80,%l5	! %l5 = 0000000000001fff
!	Mem[00000000211c0000] = 69002808, %l5 = 0000000000001fff, %asi = 80
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 0000000000006900
!	Mem[00000000201c0001] = 00456378, %l0 = 00000000000000ff, %asi = 80
	ldsba	[%o0+0x001]%asi,%l0	! %l0 = 0000000000000045
!	Mem[0000000030181410] = ff130000, %l2 = 000000000000004d
	ldsba	[%i6+%o5]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[000000001018140e] = 00000000, %l4 = 0000000000000000, %asi = 80
	ldsba	[%i6+0x00e]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141410] = 0000000079a72ebf, %l2 = ffffffffffffffff
	ldxa	[%i5+%o5]0x80,%l2	! %l2 = 0000000079a72ebf
!	Mem[0000000030181400] = 00000000, %l7 = 00000000000000ff
	lduwa	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000000
!	%l3 = 79a72ebfffffffff, %l4 = 0000000000000000, %l1 = 00000000efc3b959
	orn	%l3,%l4,%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010141408] = 73000000, %l0 = 0000000000000045
	ldswa	[%i5+%o4]0x88,%l0	! %l0 = 0000000073000000

p0_label_149:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000073000000, immd = 0000000000000833, %l2  = 0000000079a72ebf
	mulx	%l0,0x833,%l2		! %l2 = 000003aee9000000
!	%l6 = 00000000495a7860, Mem[0000000030001400] = ff000000
	stwa	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 495a7860
!	%f22 = 4dfcff00 00000000, Mem[0000000010101400] = 00001fff 00000012
	stda	%f22,[%i4+%g0]0x80	! Mem[0000000010101400] = 4dfcff00 00000000
!	Mem[0000000010001410] = 00000000, %l6 = 00000000495a7860
	ldstuba	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000
!	%f22 = 4dfcff00 00000000, %l2 = 000003aee9000000
!	Mem[0000000030041430] = 00000000590a321e
	add	%i1,0x030,%g1
	stda	%f22,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030041430] = 00000000590a321e
!	%f1  = 000013ff, %f18 = 13c28c0f
	fsqrts	%f1 ,%f18		! tt=0x22, %l0 = 0000000073000022
!	%f19 = 7fcaa07f, Mem[0000000030141400] = 000000ff
	sta	%f19,[%i5+%g0]0x89	! Mem[0000000030141400] = 7fcaa07f
!	Mem[0000000010101430] = 5c1ab2dc, %l5 = 00006900, %l5 = 00006900
	add	%i4,0x30,%g1
	casa	[%g1]0x80,%l5,%l5	! %l5 = 000000005c1ab2dc
!	%l0 = 0000000073000022, Mem[0000000010141408] = 0000000073000000
	stxa	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000073000022
!	%l2 = 000003aee9000000, Mem[00000000300c1400] = efc3b95900000000
	stxa	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000003aee9000000

p0_label_150:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00000000, %l2 = 000003aee9000000
	ldsha	[%i4+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000201c0000] = 00456378, %l1 = ffffffffffffffff
	ldsh	[%o0+%g0],%l1		! %l1 = 0000000000000045
!	Mem[0000000030001410] = 0f8cc2ff, %l5 = 000000005c1ab2dc
	ldsha	[%i0+%o5]0x89,%l5	! %l5 = ffffffffffffc2ff
!	Mem[0000000010081410] = 4dfcffff, %l4 = 0000000000000000
	lduwa	[%i2+%o5]0x80,%l4	! %l4 = 000000004dfcffff
!	Mem[00000000100c1408] = 7fa0ca7f, %l1 = 0000000000000045
	ldsha	[%i3+%o4]0x80,%l1	! %l1 = 0000000000007fa0
!	Mem[0000000030101400] = 00000000, %l7 = 0000000000000000
	ldsba	[%i4+%g0]0x81,%l7	! %l7 = 0000000000000000
!	%l4 = 000000004dfcffff, imm = fffffffffffff3ad, %l4 = 000000004dfcffff
	xnor	%l4,-0xc53,%l4		! %l4 = 000000004dfcf3ad
!	Mem[0000000030001408] = 2ebfffff, %f14 = 503c6bea
	lda	[%i0+%o4]0x81,%f14	! %f14 = 2ebfffff
!	Mem[00000000300c1400] = 000003ae, %l6 = 0000000000000000
	lduwa	[%i3+%g0]0x81,%l6	! %l6 = 00000000000003ae
!	Mem[0000000030181410] = 000013ff, %l2 = 0000000000000000
	ldsba	[%i6+%o5]0x89,%l2	! %l2 = ffffffffffffffff

!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 0000000073000022
	bne	%xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000000007fa0
	bne	%xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be ffffffffffffffff
	bne	%xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 79a72ebfffffffff
	bne	%xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 000000004dfcf3ad
	bne	%xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be ffffffffffffc2ff
	bne	%xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 00000000000003ae
	bne	%xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000000000
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
	cmp	%l0,%l1			! %f0  should be 00fffc4d 000013ff
	bne	%xcc,p0_freg_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 13c28c0f 7fcaa07f
	bne	%xcc,p0_freg_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 4dfcffff ffffffff
	bne	%xcc,p0_freg_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 00000000 000013ff
	bne	%xcc,p0_freg_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000000 590a321e
	bne	%xcc,p0_freg_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 13c28c0f 7fcaa07f
	bne	%xcc,p0_freg_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 0032b959 00000000
	bne	%xcc,p0_freg_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 2ebfffff 67889387
	bne	%xcc,p0_freg_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be fffffc4d 00000000
	bne	%xcc,p0_freg_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 13c28c0f 7fcaa07f
	bne	%xcc,p0_freg_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 60000000 694ff3ff
	bne	%xcc,p0_freg_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 4dfcff00 00000000
	bne	%xcc,p0_freg_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 00000000 6e1b9200
	bne	%xcc,p0_freg_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 60f2649e 54b1d777
	bne	%xcc,p0_freg_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 0032b959 00000000
	bne	%xcc,p0_freg_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 4dfcffff 12a3a17f
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
	ldx	[%g1+0x000],%l0		! %l0 = be6f187431e92ba6
	ldx	[%g1+0x008],%l1		! %l1 = 7383e792a5c707d1
	ldx	[%g1+0x010],%l2		! %l2 = 5804c45a8d91c80c
	ldx	[%g1+0x018],%l3		! %l3 = cb849291d2916f57
	ldx	[%g1+0x020],%l4		! %l4 = bdc0d049be0a90b2
	ldx	[%g1+0x028],%l5		! %l5 = fe64ef7e1fd94f1d
	ldx	[%g1+0x030],%l6		! %l6 = 47a649840e1c5d98
	ldx	[%g1+0x038],%l7		! %l7 = 6bb56df630efff23

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
	fdivs	%f11,%f5 ,%f13
	fdivs	%f15,%f13,%f9 
	sdivx	%l0,%l5,%l6
	jmpl	%o7,%g0
	sdivx	%l4,0xc95,%l1
p0_near_0_he:
	fdivs	%f26,%f22,%f26
	orn	%l3,-0x8e2,%l6
	orn	%l3,-0x136,%l7
	fadds	%f28,%f24,%f29
	fdivs	%f19,%f28,%f17
	or	%l3,%l1,%l5
	fcmps	%fcc2,%f17,%f17
	jmpl	%o7,%g0
	or	%l3,0xfdd,%l1
p0_near_0_lo:
	fdivs	%f11,%f5 ,%f13
	fdivs	%f15,%f13,%f9 
	sdivx	%l0,%l5,%l6
	jmpl	%o7,%g0
	sdivx	%l4,0xc95,%l1
p0_near_0_ho:
	fdivs	%f26,%f22,%f26
	orn	%l3,-0x8e2,%l6
	orn	%l3,-0x136,%l7
	fadds	%f28,%f24,%f29
	fdivs	%f19,%f28,%f17
	or	%l3,%l1,%l5
	fcmps	%fcc2,%f17,%f17
	jmpl	%o7,%g0
	or	%l3,0xfdd,%l1
near0_b2b_h:
	orn	%l1,0xf2f,%l0
	fmuls	%f21,%f26,%f29
	xnor	%l1,%l6,%l2
	xnor	%l2,%l7,%l5
	sdivx	%l3,0x991,%l5
	jmpl	%o7,%g0
	fsubs	%f27,%f26,%f19
near0_b2b_l:
	fmuls	%f5 ,%f6 ,%f3 
	subc	%l1,-0x058,%l2
	or	%l2,0x657,%l6
	orn	%l1,-0x41c,%l3
	mulx	%l5,0xa3a,%l6
	jmpl	%o7,%g0
	udivx	%l0,0x9f7,%l5
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
	smul	%l2,0xe09,%l1
	addc	%l1,-0xb21,%l3
	smul	%l6,0x8f7,%l1
	sub	%l7,-0x915,%l3
	fsqrts	%f1 ,%f14
	jmpl	%o7,%g0
	fstod	%f5 ,%f14
p0_near_1_he:
	andn	%l0,%l3,%l3
	orn	%l5,%l4,%l4
	add	%l3,%l2,%l7
	sub	%l6,%l5,%l1
	umul	%l0,0x6be,%l2
	jmpl	%o7,%g0
	orn	%l5,%l0,%l0
p0_near_1_lo:
	smul	%l2,0xe09,%l1
	addc	%l1,-0xb21,%l3
	smul	%l6,0x8f7,%l1
	sub	%l7,-0x915,%l3
	fsqrts	%f1 ,%f14
	jmpl	%o7,%g0
	fstod	%f5 ,%f14
p0_near_1_ho:
	andn	%l0,%l3,%l3
	orn	%l5,%l4,%l4
	add	%l3,%l2,%l7
	sub	%l6,%l5,%l1
	umul	%l0,0x6be,%l2
	jmpl	%o7,%g0
	orn	%l5,%l0,%l0
near1_b2b_h:
	jmpl	%o7,%g0
	mulx	%l2,0x12c,%l5
	jmpl	%o7,%g0
	nop
near1_b2b_l:
	jmpl	%o7,%g0
	fdivs	%f9 ,%f8 ,%f2 
	jmpl	%o7,%g0
	nop
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
	jmpl	%o7,%g0
	addc	%l1,0x4d3,%l2
	jmpl	%o7,%g0
	nop
p0_near_2_he:
	sdivx	%l5,%l0,%l2
	udivx	%l4,%l2,%l5
	smul	%l5,%l0,%l3
	jmpl	%o7,%g0
	or	%l6,%l4,%l2
p0_near_2_lo:
	jmpl	%o7,%g0
	addc	%l1,0x4d3,%l2
	jmpl	%o7,%g0
	nop
p0_near_2_ho:
	sdivx	%l5,%l0,%l2
	udivx	%l4,%l2,%l5
	smul	%l5,%l0,%l3
	jmpl	%o7,%g0
	or	%l6,%l4,%l2
near2_b2b_h:
	xor	%l1,%l3,%l1
	fsqrts	%f30,%f22
	fcmps	%fcc0,%f18,%f21
	jmpl	%o7,%g0
	xnor	%l2,-0xfbd,%l5
near2_b2b_l:
	fsubs	%f13,%f6 ,%f5 
	xor	%l0,-0x3bb,%l5
	orn	%l6,0x13f,%l0
	jmpl	%o7,%g0
	xor	%l6,-0xf60,%l0
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
	smul	%l0,0x7c9,%l6
	jmpl	%o7,%g0
	fcmps	%fcc0,%f13,%f14
p0_near_3_he:
	udivx	%l2,0xe09,%l7
	addc	%l1,%l6,%l7
	add	%l7,%l5,%l2
	jmpl	%o7,%g0
	sdivx	%l1,%l7,%l0
p0_near_3_lo:
	smul	%l0,0x7c9,%l6
	jmpl	%o7,%g0
	fcmps	%fcc0,%f13,%f14
p0_near_3_ho:
	udivx	%l2,0xe09,%l7
	addc	%l1,%l6,%l7
	add	%l7,%l5,%l2
	jmpl	%o7,%g0
	sdivx	%l1,%l7,%l0
near3_b2b_h:
	fdivs	%f18,%f21,%f21
	jmpl	%o7,%g0
	umul	%l4,%l2,%l1
near3_b2b_l:
	xnor	%l1,%l3,%l1
	jmpl	%o7,%g0
	add	%l3,0x51a,%l7
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
	xnor	%l3,0xd4a,%l3
	jmpl	%o7,%g0
	add	%l7,%l4,%l6
p0_far_0_he:
	udivx	%l2,%l7,%l4
	andn	%l2,%l0,%l2
	jmpl	%o7,%g0
	xor	%l3,-0xa38,%l4
p0_far_0_lo:
	xnor	%l3,0xd4a,%l3
	jmpl	%o7,%g0
	add	%l7,%l4,%l6
p0_far_0_ho:
	udivx	%l2,%l7,%l4
	andn	%l2,%l0,%l2
	jmpl	%o7,%g0
	xor	%l3,-0xa38,%l4
far0_b2b_h:
	jmpl	%o7,%g0
	mulx	%l2,%l6,%l0
	jmpl	%o7,%g0
	nop
far0_b2b_l:
	jmpl	%o7,%g0
	umul	%l4,0xc44,%l2
	jmpl	%o7,%g0
	nop
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
	ldsw	[%i4+0x014],%l5		! Mem[0000000010101414]
	fdivs	%f7 ,%f11,%f10
	jmpl	%o7,%g0
	umul	%l1,%l5,%l5
p0_far_1_he:
	fsubs	%f24,%f24,%f23
	xnor	%l4,%l7,%l0
	sub	%l4,-0xcec,%l7
	smul	%l7,0xd05,%l0
	fadds	%f18,%f31,%f17
	smul	%l5,-0x207,%l6
	jmpl	%o7,%g0
	ldstub	[%i4+0x032],%l3		! Mem[0000000010101432]
p0_far_1_lo:
	ldsw	[%o4+0x014],%l5		! Mem[0000000010101414]
	fdivs	%f7 ,%f11,%f10
	jmpl	%o7,%g0
	umul	%l1,%l5,%l5
p0_far_1_ho:
	fsubs	%f24,%f24,%f23
	xnor	%l4,%l7,%l0
	sub	%l4,-0xcec,%l7
	smul	%l7,0xd05,%l0
	fadds	%f18,%f31,%f17
	smul	%l5,-0x207,%l6
	jmpl	%o7,%g0
	ldstub	[%o4+0x032],%l3		! Mem[0000000010101432]
far1_b2b_h:
	udivx	%l1,%l3,%l3
	or	%l7,%l0,%l7
	udivx	%l0,%l4,%l0
	xnor	%l3,%l7,%l6
	fadds	%f27,%f17,%f16
	fsubs	%f19,%f29,%f22
	fsubs	%f20,%f30,%f23
	jmpl	%o7,%g0
	fadds	%f31,%f24,%f28
far1_b2b_l:
	fadds	%f9 ,%f11,%f5 
	subc	%l4,%l6,%l1
	and	%l6,0x3e6,%l3
	add	%l6,%l3,%l5
	fdivs	%f3 ,%f6 ,%f11
	orn	%l4,0x6a3,%l6
	umul	%l3,%l0,%l1
	jmpl	%o7,%g0
	xnor	%l3,-0xed5,%l5
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
	jmpl	%o7,%g0
	xnor	%l2,%l7,%l4
	jmpl	%o7,%g0
	nop
p0_far_2_he:
	add	%l5,%l6,%l3
	mulx	%l7,0x004,%l4
	xnor	%l2,0xdd8,%l0
	and	%l7,-0xae2,%l6
	std	%l6,[%i6+0x030]		! Mem[0000000010181430]
	jmpl	%o7,%g0
	sub	%l5,%l7,%l0
p0_far_2_lo:
	jmpl	%o7,%g0
	xnor	%l2,%l7,%l4
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
p0_far_2_ho:
	add	%l5,%l6,%l3
	mulx	%l7,0x004,%l4
	xnor	%l2,0xdd8,%l0
	and	%l7,-0xae2,%l6
	std	%l6,[%o6+0x030]		! Mem[0000000010181430]
	jmpl	%o7,%g0
	sub	%l5,%l7,%l0
far2_b2b_h:
	xor	%l6,0xda1,%l0
	orn	%l6,0xad8,%l2
	jmpl	%o7,%g0
	fsubs	%f22,%f19,%f27
far2_b2b_l:
	xnor	%l1,0x07e,%l5
	fdivs	%f2 ,%f9 ,%f14
	jmpl	%o7,%g0
	sub	%l4,%l3,%l5
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
	xnor	%l6,0x4a8,%l3
	xor	%l6,%l0,%l2
	smul	%l6,0xf54,%l2
	fdtos	%f0 ,%f6 
	orn	%l4,0xfc5,%l0
	ldd	[%i3+0x008],%f2 	! Mem[00000000100c1408]
	fsubs	%f14,%f3 ,%f6 
	jmpl	%o7,%g0
	lduw	[%i4+0x024],%l6		! Mem[0000000010101424]
p0_far_3_he:
	jmpl	%o7,%g0
	and	%l0,-0xb14,%l3
	jmpl	%o7,%g0
	nop
p0_far_3_lo:
	xnor	%l6,0x4a8,%l3
	xor	%l6,%l0,%l2
	smul	%l6,0xf54,%l2
	fdtos	%f0 ,%f6 
	orn	%l4,0xfc5,%l0
	ldd	[%o3+0x008],%f2 	! Mem[00000000100c1408]
	fsubs	%f14,%f3 ,%f6 
	jmpl	%o7,%g0
	lduw	[%o4+0x024],%l6		! Mem[0000000010101424]
p0_far_3_ho:
	jmpl	%o7,%g0
	and	%l0,-0xb14,%l3
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
far3_b2b_h:
	fmuls	%f18,%f29,%f30
	fdivs	%f29,%f30,%f31
	jmpl	%o7,%g0
	fdivs	%f31,%f17,%f17
far3_b2b_l:
	sub	%l3,%l1,%l3
	subc	%l4,%l1,%l6
	jmpl	%o7,%g0
	andn	%l2,%l4,%l4
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	.skip	16
p0_jmpl_0_le:
	fmuls	%f11,%f12,%f1 
	xor	%l0,0x399,%l4
	fsubs	%f9 ,%f13,%f0 
	jmpl	%g6+8,%g0
	fmuls	%f14,%f6 ,%f11
p0_call_0_le:
	xor	%l0,0x1cb,%l3
	fdivs	%f12,%f1 ,%f3 
	fadds	%f12,%f15,%f4 
	fcmps	%fcc1,%f9 ,%f13
	smul	%l6,0xaf6,%l5
	retl
	add	%l4,%l5,%l1
p0_jmpl_0_lo:
	fmuls	%f11,%f12,%f1 
	xor	%l0,0x399,%l4
	fsubs	%f9 ,%f13,%f0 
	jmpl	%g6+8,%g0
	fmuls	%f14,%f6 ,%f11
p0_call_0_lo:
	xor	%l0,0x1cb,%l3
	fdivs	%f12,%f1 ,%f3 
	fadds	%f12,%f15,%f4 
	fcmps	%fcc1,%f9 ,%f13
	smul	%l6,0xaf6,%l5
	retl
	add	%l4,%l5,%l1
p0_jmpl_0_he:
	mulx	%l2,%l2,%l6
	umul	%l2,0xb7b,%l1
	xor	%l3,-0x196,%l7
	fcmps	%fcc1,%f28,%f24
	umul	%l4,0xa3f,%l1
	xnor	%l2,%l1,%l7
	orn	%l6,%l3,%l6
	jmpl	%g6+8,%g0
	xnor	%l6,%l5,%l0
p0_call_0_he:
	xor	%l0,%l7,%l3
	sdivx	%l5,%l3,%l5
	and	%l3,0xb32,%l0
	retl
	and	%l5,-0x205,%l0
p0_jmpl_0_ho:
	mulx	%l2,%l2,%l6
	umul	%l2,0xb7b,%l1
	xor	%l3,-0x196,%l7
	fcmps	%fcc1,%f28,%f24
	umul	%l4,0xa3f,%l1
	xnor	%l2,%l1,%l7
	orn	%l6,%l3,%l6
	jmpl	%g6+8,%g0
	xnor	%l6,%l5,%l0
p0_call_0_ho:
	xor	%l0,%l7,%l3
	sdivx	%l5,%l3,%l5
	and	%l3,0xb32,%l0
	retl
	and	%l5,-0x205,%l0
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	.skip	32
p0_jmpl_1_le:
	subc	%l6,%l6,%l1
	jmpl	%g6+8,%g0
	fmuls	%f15,%f13,%f12
p0_call_1_le:
	retl
	mulx	%l3,%l4,%l1
p0_jmpl_1_lo:
	subc	%l6,%l6,%l1
	jmpl	%g6+8,%g0
	fmuls	%f15,%f13,%f12
p0_call_1_lo:
	retl
	mulx	%l3,%l4,%l1
p0_jmpl_1_he:
	andn	%l4,%l0,%l7
	udivx	%l6,%l7,%l4
	subc	%l5,0x208,%l0
	fdivs	%f20,%f19,%f20
	sub	%l6,-0x734,%l4
	jmpl	%g6+8,%g0
	smul	%l3,0x49b,%l4
p0_call_1_he:
	and	%l3,%l0,%l6
	sdivx	%l1,%l2,%l0
	fcmps	%fcc1,%f30,%f26
	fsqrts	%f19,%f31
	stw	%l5,[%i4+0x004]		! Mem[0000000010101404]
	retl
	or	%l5,%l0,%l5
p0_jmpl_1_ho:
	andn	%l4,%l0,%l7
	udivx	%l6,%l7,%l4
	subc	%l5,0x208,%l0
	fdivs	%f20,%f19,%f20
	sub	%l6,-0x734,%l4
	jmpl	%g6+8,%g0
	smul	%l3,0x49b,%l4
p0_call_1_ho:
	and	%l3,%l0,%l6
	sdivx	%l1,%l2,%l0
	fcmps	%fcc1,%f30,%f26
	fsqrts	%f19,%f31
	stw	%l5,[%o4+0x004]		! Mem[0000000010101404]
	retl
	or	%l5,%l0,%l5
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	.skip	48
p0_jmpl_2_le:
	fsubs	%f2 ,%f5 ,%f5 
	fdivs	%f9 ,%f12,%f3 
	subc	%l3,-0x584,%l6
	subc	%l1,%l7,%l1
	mulx	%l3,-0x50d,%l7
	mulx	%l1,%l3,%l1
	jmpl	%g6+8,%g0
	xnor	%l2,%l6,%l0
p0_call_2_le:
	and	%l0,%l2,%l5
	retl
	xnor	%l6,%l4,%l2
p0_jmpl_2_lo:
	fsubs	%f2 ,%f5 ,%f5 
	fdivs	%f9 ,%f12,%f3 
	subc	%l3,-0x584,%l6
	subc	%l1,%l7,%l1
	mulx	%l3,-0x50d,%l7
	mulx	%l1,%l3,%l1
	jmpl	%g6+8,%g0
	xnor	%l2,%l6,%l0
p0_call_2_lo:
	and	%l0,%l2,%l5
	retl
	xnor	%l6,%l4,%l2
p0_jmpl_2_he:
	sub	%l6,%l5,%l5
	andn	%l1,0x27f,%l6
	jmpl	%g6+8,%g0
	fadds	%f27,%f23,%f24
p0_call_2_he:
	fsubs	%f29,%f31,%f29
	fdivs	%f24,%f17,%f30
	retl
	stb	%l3,[%o0+0x000]		! Mem[00000000201c0000]
p0_jmpl_2_ho:
	sub	%l6,%l5,%l5
	andn	%l1,0x27f,%l6
	jmpl	%g6+8,%g0
	fadds	%f27,%f23,%f24
p0_call_2_ho:
	fsubs	%f29,%f31,%f29
	fdivs	%f24,%f17,%f30
	retl
	stb	%l3,[%i0+0x000]		! Mem[00000000201c0000]
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	.skip	64
p0_jmpl_3_le:
	add	%l7,%l1,%l6
	addc	%l5,0x13e,%l1
	mulx	%l7,-0xe1f,%l3
	ld	[%i6+0x018],%f13	! Mem[0000000010181418]
	smul	%l5,%l7,%l5
	udivx	%l5,%l3,%l4
	smul	%l6,%l0,%l4
	jmpl	%g6+8,%g0
	smul	%l4,%l5,%l7
p0_call_3_le:
	retl
	add	%l5,%l1,%l5
p0_jmpl_3_lo:
	add	%l7,%l1,%l6
	addc	%l5,0x13e,%l1
	mulx	%l7,-0xe1f,%l3
	ld	[%o6+0x018],%f13	! Mem[0000000010181418]
	smul	%l5,%l7,%l5
	udivx	%l5,%l3,%l4
	smul	%l6,%l0,%l4
	jmpl	%g6+8,%g0
	smul	%l4,%l5,%l7
p0_call_3_lo:
	retl
	add	%l5,%l1,%l5
p0_jmpl_3_he:
	subc	%l4,%l1,%l3
	andn	%l4,-0xe98,%l7
	jmpl	%g6+8,%g0
	sdivx	%l7,0x840,%l1
p0_call_3_he:
	xnor	%l6,%l6,%l7
	sub	%l5,0x636,%l7
	retl
	smul	%l6,0x2aa,%l5
p0_jmpl_3_ho:
	subc	%l4,%l1,%l3
	andn	%l4,-0xe98,%l7
	jmpl	%g6+8,%g0
	sdivx	%l7,0x840,%l1
p0_call_3_ho:
	xnor	%l6,%l6,%l7
	sub	%l5,0x636,%l7
	retl
	smul	%l6,0x2aa,%l5
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
	.word	0xbe6f1874,0x31e92ba6		! Init value for %l0
	.word	0x7383e792,0xa5c707d1		! Init value for %l1
	.word	0x5804c45a,0x8d91c80c		! Init value for %l2
	.word	0xcb849291,0xd2916f57		! Init value for %l3
	.word	0xbdc0d049,0xbe0a90b2		! Init value for %l4
	.word	0xfe64ef7e,0x1fd94f1d		! Init value for %l5
	.word	0x47a64984,0x0e1c5d98		! Init value for %l6
	.word	0x6bb56df6,0x30efff23		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x469bd418,0x42c694c9		! Init value for %f0 
	.word	0x14eeb016,0x34536a0f		! Init value for %f2 
	.word	0x4ce52c84,0x5e6e5805		! Init value for %f4 
	.word	0x37e230e2,0x1db7f82b		! Init value for %f6 
	.word	0x2f9600b0,0x3bdf5001		! Init value for %f8 
	.word	0x00921b6e,0x09fa3107		! Init value for %f10
	.word	0x78841c9c,0x038898bd		! Init value for %f12
	.word	0x738f9bba,0x74bb10a3		! Init value for %f14
	.word	0x79ff0c48,0x4d540e39		! Init value for %f16
	.word	0x3b439dc6,0x3e3c52ff		! Init value for %f18
	.word	0x5cfc1bb4,0x2aa24c75		! Init value for %f20
	.word	0x1c7acd92,0x063c741b		! Init value for %f22
	.word	0x170256e0,0x2106af71		! Init value for %f24
	.word	0x20b1971e,0x4d92aff7		! Init value for %f26
	.word	0x53d689cc,0x71c3532d		! Init value for %f28
	.word	0x6220266a,0x1a8b0293		! Init value for %f30
	.word	0x1ee74078,0x4a0513a9		! Init value for %f32
	.word	0x25866776,0x1c0227ef		! Init value for %f34
	.word	0x5878c6e4,0x37df8ce5		! Init value for %f36
	.word	0x2db80642,0x07419c0b		! Init value for %f38
	.word	0x42912910,0x00091ae1		! Init value for %f40
	.word	0x74e86ece,0x2c9b9ae7		! Init value for %f42
	.word	0x31a432fc,0x3056d99d		! Init value for %f44
	.word	0x37b6cd1a,0x7ec72083		! Init value for %f46
	.word	0x2cff70a8,0x0af8a519
	.word	0x7dfa0d26,0x08fbe8df
	.word	0x0af62e14,0x26751955
	.word	0x0d4cdaf2,0x0fce6ffb
	.word	0x54cd7740,0x5e659251
	.word	0x7159a27e,0x58cbf1d7
	.word	0x7e68182c,0x70f22c0d
	.word	0x05e68fca,0x54d66a73
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
	.word	0x00000000,0x73000022		! %l0
	.word	0x00000000,0x00007fa0		! %l1
	.word	0xffffffff,0xffffffff		! %l2
	.word	0x79a72ebf,0xffffffff		! %l3
	.word	0x00000000,0x4dfcf3ad		! %l4
	.word	0xffffffff,0xffffc2ff		! %l5
	.word	0x00000000,0x000003ae		! %l6
	.word	0x00000000,0x00000000		! %l7
p0_expected_fp_regs:
	.word	0x00fffc4d,0x000013ff		! %f0
	.word	0x13c28c0f,0x7fcaa07f		! %f2
	.word	0x4dfcffff,0xffffffff		! %f4
	.word	0x00000000,0x000013ff		! %f6
	.word	0x00000000,0x590a321e		! %f8
	.word	0x13c28c0f,0x7fcaa07f		! %f10
	.word	0x0032b959,0x00000000		! %f12
	.word	0x2ebfffff,0x67889387		! %f14
	.word	0xfffffc4d,0x00000000		! %f16
	.word	0x13c28c0f,0x7fcaa07f		! %f18
	.word	0x60000000,0x694ff3ff		! %f20
	.word	0x4dfcff00,0x00000000		! %f22
	.word	0x00000000,0x6e1b9200		! %f24
	.word	0x60f2649e,0x54b1d777		! %f26
	.word	0x0032b959,0x00000000		! %f28
	.word	0x4dfcffff,0x12a3a17f		! %f30
	.word	0x00000017,0x00000621		! %fsr
p0_local0_expect:
	.word	0x1500ff00,0xff000000,0xff00ffff,0x80920000 ! PA = 0000000010001400
	.word	0xff000000,0x37c1efc3,0x650c0bff,0x12a3a17f ! PA = 0000000010001410
	.word	0x00000020,0x60785a49,0x00000060,0x1b6b89b9 ! PA = 0000000010001420
	.word	0xadd60110,0x8c0f4c54,0x13c28c0f,0x7fcaa07f ! PA = 0000000010001430
p0_local0_sec_expect:
	.word	0x60785a49,0x00000000,0x2ebfffff,0xe230e237 ! PA = 0000000030001400
	.word	0xffc28c0f,0x00000000,0x00920000,0xb9896b1b ! PA = 0000000030001410
	.word	0x083a87a0,0x44e8a531,0x5a371dde,0x333ee3b7 ! PA = 0000000030001420
	.word	0x4dfc9f15,0x40bc34ed,0x351d692a,0x43ca8253 ! PA = 0000000030001430
!	Scratch Area for Non-Transactional Memory Stores
	.word	0x4c485256,0x1df7e5d7,0xc3ec46ba,0x6add0083
	.word	0x92275f3e,0x1e77d38f,0xdcf904e2,0x20d3f9fb
	.word	0xe1f028a6,0x362ea6c7,0x46d9838a,0xfbd964f3
	.word	0xd1efd68e,0x9862d77f,0xfa1e2ab2,0x06b5796b
p0_local1_expect:
	.word	0x00000000,0x0a5940a1,0x79a72ebf,0xffffffff ! PA = 0000000010041400
	.word	0xfffffc4d,0x00000000,0x37e230e2,0x69c8f0ff ! PA = 0000000010041410
	.word	0x4f41ffd0,0x3dcd40a1,0xff000000,0x159ffc4d ! PA = 0000000010041420
	.word	0x00000000,0x0508eb5d,0x7fcaa07f,0x80920000 ! PA = 0000000010041430
p0_local1_sec_expect:
	.word	0x87938867,0xffffffff,0x00000000,0x00000000 ! PA = 0000000030041400
	.word	0x4dfcffff,0xea6b3c50,0xfffffc4d,0x00000000 ! PA = 0000000030041410
	.word	0x3dcd40a1,0x60785a49,0x37e230e2,0x1b6b89b9 ! PA = 0000000030041420
	.word	0x00000000,0x590a321e,0xf59ffc4d,0x60f2649e ! PA = 0000000030041430
p0_local2_expect:
	.word	0x650c0bff,0x12a3a17f,0xc3efc137,0x7fcaa07f ! PA = 0000000010081400
	.word	0x4dfcffff,0xffffffff,0x13c28c0f,0x47dba073 ! PA = 0000000010081410
	.word	0x00000000,0xb959321e,0x60f2649e,0x54b1d777 ! PA = 0000000010081420
	.word	0x0032b959,0x00000000,0x503c6bea,0xfffffc4d ! PA = 0000000010081430
p0_local2_sec_expect:
	.word	0x7fcaa07f,0x000000ff,0xffa0db47,0x12a3a17f ! PA = 0000000030081400
	.word	0xff130000,0x00000000,0x7fa1a312,0x2144839b ! PA = 0000000030081410
	.word	0x495a7860,0x453b5af1,0x60f2649e,0x54b1d777 ! PA = 0000000030081420
	.word	0xff3625ff,0x6677931b,0x503c6bea,0x748cc213 ! PA = 0000000030081430
p0_local3_expect:
	.word	0x0000007d,0x00000000,0x7fa0ca7f,0x0f8cc213 ! PA = 00000000100c1400
	.word	0x00000000,0x00000000,0x590a00ff,0xffffff36 ! PA = 00000000100c1410
	.word	0x04892a90,0x1ff22661,0x15d01c4e,0x6bfa2267 ! PA = 00000000100c1420
	.word	0x0a8dec7c,0xffffff36,0x000000ff,0x6e1b9200 ! PA = 00000000100c1430
p0_local3_sec_expect:
	.word	0x000003ae,0xe9000000,0x00157766,0x00000000 ! PA = 00000000300c1400
	.word	0xf1ff3b45,0x000000ff,0x650c0b2f,0x12a3a17f ! PA = 00000000300c1410
	.word	0xf15a3b45,0x60785a49,0x77d7b154,0x9e64f260 ! PA = 00000000300c1420
	.word	0xadd60110,0x4c639a54,0x13c28c74,0x7fcaa07f ! PA = 00000000300c1430
p0_local4_expect:
	.word	0x4dfcff00,0x00000000,0xffffa073,0x00000000 ! PA = 0000000010101400
	.word	0x12a3a17f,0x590a321e,0x306e0000,0x2eff006b ! PA = 0000000010101410
	.word	0x00000007,0x0489ff90,0x60f2649e,0x54b1d777 ! PA = 0000000010101420
	.word	0x5c1ab2dc,0x3dcd40a1,0x1b937766,0x9278ef1d ! PA = 0000000010101430
p0_local4_sec_expect:
	.word	0x00000000,0xff1f0000,0xffbfffff,0xffff0000 ! PA = 0000000030101400
	.word	0x60f2649e,0x9e64f260,0x650c0b2f,0x12a3a17f ! PA = 0000000030101410
	.word	0xf15a3b45,0x60785a49,0x77d7b154,0x9e64f260 ! PA = 0000000030101420
	.word	0xadd60110,0x4c639a54,0x13c28c74,0x7fcaa07f ! PA = 0000000030101430
p0_local5_expect:
	.word	0x00000037,0x00000000,0x22000073,0x00000000 ! PA = 0000000010141400
	.word	0x00000000,0x79a72ebf,0xfffffc4d,0x00ff0000 ! PA = 0000000010141410
	.word	0x0015b154,0x9e64f260,0x00000060,0x1b6b89b9 ! PA = 0000000010141420
	.word	0xffffffff,0x0508eb5d,0x47dba073,0x00000012 ! PA = 0000000010141430
p0_local5_sec_expect:
	.word	0x7fa0ca7f,0x59b9c3ef,0xffff0000,0x0000006b ! PA = 0000000030141400
	.word	0x00001fff,0x36ffffff,0x483c5b32,0x0372c73b ! PA = 0000000030141410
	.word	0x12e0e980,0x7a7ed391,0x00000048,0x4d06ed17 ! PA = 0000000030141420
	.word	0x3e411e6c,0x792e314d,0x60f2649e,0x54b149b3 ! PA = 0000000030141430
p0_local6_expect:
	.word	0x37e230e2,0x1b6b89b9,0x00000000,0x00000000 ! PA = 0000000010181400
	.word	0x00000000,0x69c8f0ff,0x4da19f15,0x0508005d ! PA = 0000000010181410
	.word	0x495a7860,0x453bfff1,0x0015b154,0x9e64f260 ! PA = 0000000010181420
	.word	0x00000000,0x00000060,0x00006bea,0xf15a3b45 ! PA = 0000000010181430
p0_local6_sec_expect:
	.word	0x00000000,0xfff0c869,0x9e64f260,0x00002ebf ! PA = 0000000030181400
	.word	0xff130000,0x00000000,0x1b937766,0x9278ef1d ! PA = 0000000030181410
	.word	0x7106333a,0xe0995126,0xf59ffc4d,0x1e320a59 ! PA = 0000000030181420
	.word	0x2d5a0b8b,0xcc3c9200,0x93819933,0x6ab1df51 ! PA = 0000000030181430
share0_expect:
	.word	0x00456378,0x59c7caa9,0x189fe276,0x420cd6ef ! PA = 00000000201c0000
	.word	0x775f59e4,0x2373f3e5,0x568e7142,0x493f7b0b ! PA = 00000000201c0010
	.word	0x13e02c10,0x705e31e1,0x774ec9ce,0x1f33a9e7 ! PA = 00000000201c0020
	.word	0x6306a5fc,0x158ba09d,0x23f0181a,0x6b505f83 ! PA = 00000000201c0030
share1_expect:
	.word	0xffff53a8,0x035c1c19,0x3bb94826,0x4c7d57df ! PA = 0000000020800000
	.word	0x58408114,0x15864055,0x36b505f2,0x29ff0efb ! PA = 0000000020800010
	.word	0x3ecc3a40,0x33d36951,0x1dfdbd7e,0x2b12c0d7 ! PA = 0000000020800020
	.word	0x54864b2c,0x1f9bb30d,0x05c99aca,0x114a6973 ! PA = 0000000020800030
	.word	0xffff3fd8,0x0a01f989,0x353689d6,0x71a8c4cf ! PA = 0000000020800040
	.word	0x6d2d6444,0x4eefd8c5,0x67d636a2,0x087d4eeb ! PA = 0000000020800050
	.word	0x1f60c470,0x70d1acc1,0x54fa0d2e,0x240043c7 ! PA = 0000000020800060
	.word	0x38e72c5c,0x3112917d,0x68bf397a,0x61ae9f63 ! PA = 0000000020800070
share2_expect:
	.word	0x69002808,0x615862f9,0x5adaa786,0x3a661dbf ! PA = 00000000211c0000
	.word	0x29410374,0x497fbd35,0x0f250352,0x19413adb ! PA = 00000000211c0010
	.word	0x17a8caa0,0x3e57fc31,0x6be6b8de,0x793332b7 ! PA = 00000000211c0020
	.word	0x5424498c,0x451f3bed,0x11e3f42a,0x45640153 ! PA = 00000000211c0030
share3_expect:
	.word	0x02ff0c38,0x5fbe5869,0x2228a136,0x784c62af ! PA = 0000000021800000
	.word	0x2d565ea4,0x5dc4eda5,0x7d946c02,0x3591d2cb ! PA = 0000000021800010
	.word	0x236f4cd0,0x4e2557a1,0x2a26c08e,0x5aa28da7 ! PA = 0000000021800020
	.word	0x2ff8a2bc,0x6db0b25d,0x4a0acada,0x42118f43 ! PA = 0000000021800030
	.word	0x092bec68,0x2e52d9d9,0x506376e6,0x35b2939f ! PA = 0000000021800040
	.word	0x780875d4,0x330e6a15,0x5fd770b2,0x4b7616bb ! PA = 0000000021800050
	.word	0x083f4b00,0x5cb8bf11,0x7edd243e,0x29055497 ! PA = 0000000021800060
	.word	0x4bdf37ec,0x4375f4cd,0x0dc6bd8a,0x6a1e4933 ! PA = 0000000021800070
	.word	0x7ec0c898,0x38f4e749,0x2a8e2896,0x25afb08f ! PA = 0000000021800080
	.word	0x15b24904,0x2f6b3285,0x6e611162,0x4db506ab ! PA = 0000000021800090
	.word	0x0563c530,0x21513281,0x30ece3ee,0x65d28787 ! PA = 00000000218000a0
	.word	0x4d13091c,0x55de033d,0x3d6acc3a,0x4cb12f23 ! PA = 00000000218000b0
	.word	0x10ffa0c8,0x1e4380b9,0x256bb646,0x141ab97f ! PA = 00000000218000c0
	.word	0x506ed834,0x67aa46f5,0x1d644e12,0x23d5a29b ! PA = 00000000218000d0
	.word	0x03e7bb60,0x3dedb1f1,0x0ef8ff9e,0x23412677 ! PA = 00000000218000e0
	.word	0x2e8f164c,0x1b17ddad,0x4d09f6ea,0x65b14113 ! PA = 00000000218000f0
	.word	0x2fff74f8,0x1f9da629,0x157f1ff6,0x558aae6f ! PA = 0000000021800100
	.word	0x60192364,0x0f5aa765,0x4cd426c2,0x1a1eea8b ! PA = 0000000021800110
	.word	0x46962d90,0x2f4d3d61,0x1f64774e,0x74483167 ! PA = 0000000021800120
	.word	0x710e5f7c,0x6012841d,0x74773d9a,0x0dc57f03 ! PA = 0000000021800130
	.word	0x3cb74528,0x11225799,0x5f0b65a6,0x37568f5f ! PA = 0000000021800140
	.word	0x1a4c2a94,0x68cb53d5,0x78639b72,0x5197de7b ! PA = 0000000021800150
	.word	0x19fa1bc0,0x3ceed4d1,0x50524afe,0x5c9ea857 ! PA = 0000000021800160
	.word	0x4b0be4ac,0x387cf68d,0x5f45a04a,0x6a54e8f3 ! PA = 0000000021800170
	.word	0xf0ff1158,0x49b09509,0x26138756,0x6f955c4f ! PA = 0000000021800180
	.word	0x2262edc4,0x350b4c45,0x6785ac22,0x30077e6b ! PA = 0000000021800190
	.word	0x045e85f0,0x69117841,0x27a57aae,0x40bb8b47 ! PA = 00000000218001a0
	.word	0x58c2a5dc,0x6ec634fd,0x5cc81efa,0x5d867ee3 ! PA = 00000000218001b0
	.word	0x00c2d988,0x12e75e79,0x7e5a8506,0x0d1e153f ! PA = 00000000218001c0
	.word	0x19786cf4,0x23e990b5,0x5d6d58d2,0x4ff4ca5b ! PA = 00000000218001d0
	.word	0x75ce6c20,0x60b427b1,0x7301065e,0x55d5da37 ! PA = 00000000218001e0
	.word	0x4c2da30c,0x741d3f6d,0x1011b9aa,0x764140d3 ! PA = 00000000218001f0
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
	.word	0x3db29cd8,0x650dc289,0x2ea18ed6,0x294095cf	! PA = 0000000010001400
	.word	0x0dcf5144,0x1571f1c5,0x28ac4ba2,0x53a9efeb	! PA = 0000000010001410
	.word	0x2a024170,0x7c5b15c1,0x21e8322e,0x649ab4c7	! PA = 0000000010001420
	.word	0x0c5d395c,0x1c044a7d,0x02026e7a,0x0cdfe063	! PA = 0000000010001430
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
	.word	0x3c2bc508,0x1fe36bf9,0x113fec86,0x79a72ebf	! PA = 0000000030001400
	.word	0x781f3074,0x12a51635,0x69095852,0x3b5b1bdb	! PA = 0000000030001410
	.word	0x083a87a0,0x44e8a531,0x5a371dde,0x333ee3b7	! PA = 0000000030001420
	.word	0x437e968c,0x40bc34ed,0x351d692a,0x43ca8253	! PA = 0000000030001430
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
	.word	0x1555e938,0x65d8a169,0x1f582636,0x3fc6b3af	! PA = 0000000010041400
	.word	0x0ec0cba4,0x0a9d86a5,0x63570102,0x5428f3cb	! PA = 0000000010041410
	.word	0x4f4149d0,0x3dcd40a1,0x65a9658e,0x68af7ea7	! PA = 0000000010041420
	.word	0x51872fbc,0x0508eb5d,0x2c0a7fda,0x333d5043	! PA = 0000000010041430
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
	.word	0x67dc0968,0x340c62d9,0x222d3be6,0x79f6249f	! PA = 0000000030041400
	.word	0x744f22d4,0x38aa4315,0x084845b2,0x401a77bb	! PA = 0000000030041410
	.word	0x28a18800,0x7787e811,0x3762093e,0x59a38597	! PA = 0000000030041420
	.word	0x59f204ec,0x15996dcd,0x275cb28a,0x219f4a33	! PA = 0000000030041430
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
	.word	0x34292598,0x4a5db049,0x62c22d96,0x4f4c818f	! PA = 0000000010081400
	.word	0x59253604,0x16da4b85,0x54502662,0x25f6a7ab	! PA = 0000000010081410
	.word	0x37a64230,0x7d579b81,0x1a4408ee,0x7b91f887	! PA = 0000000010081420
	.word	0x25fa161c,0x15dcbc3d,0x4b67013a,0x52177023	! PA = 0000000010081430
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
	.word	0x0c683dc8,0x1b6b89b9,0x59d9fb46,0x7fa0ca7f	! PA = 0000000030081400
	.word	0x2b5e0534,0x4dfc9ff5,0x7fa1a312,0x2144839b	! PA = 0000000030081410
	.word	0x495a7860,0x453b5af1,0x60f2649e,0x54b1d777	! PA = 0000000030081420
	.word	0x549a634c,0x1001d6ad,0x503c6bea,0x748cc213	! PA = 0000000030081430
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
	.word	0x448451f8,0x3c94ef29,0x5ff7a4f6,0x5389ff6f	! PA = 00000000100c1400
	.word	0x46d49064,0x25a04065,0x2e2fbbc2,0x324b0b8b	! PA = 00000000100c1410
	.word	0x04892a90,0x1ff22661,0x15d01c4e,0x6bfa2267	! PA = 00000000100c1420
	.word	0x0a8dec7c,0x64f7bd1d,0x31aff29a,0x15a64003	! PA = 00000000100c1430
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
	.word	0x22286228,0x55f8e099,0x5d5e2aa6,0x0c5f205f	! PA = 00000000300c1400
	.word	0x2523d794,0x74142cd5,0x1fad7072,0x2e113f7b	! PA = 00000000300c1410
	.word	0x19bd58c0,0x28fafdd1,0x2b002ffe,0x3921d957	! PA = 00000000300c1420
	.word	0x224fb1ac,0x3c6d6f8d,0x5f54954a,0x0ecae9f3	! PA = 00000000300c1430
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
	.word	0x0cbf6e58,0x12765e09,0x7a108c56,0x54372d4f	! PA = 0000000010101400
	.word	0x0da6dac4,0x0e676545,0x5f8dc122,0x2e5e1f6b	! PA = 0000000010101410
	.word	0x734202f0,0x3694e141,0x2a659fae,0x149ffc47	! PA = 0000000010101420
	.word	0x5c1ab2dc,0x74d1edfd,0x6c7d53fa,0x7621bfe3	! PA = 0000000010101430
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
	.word	0x3d747688,0x0fac6779,0x4dd1ca06,0x2de9263f	! PA = 0000000030101400
	.word	0x457899f4,0x3868e9b5,0x7503add2,0x01b8ab5b	! PA = 0000000030101410
	.word	0x65222920,0x49bed0b1,0x65a36b5e,0x27ab8b37	! PA = 0000000030101420
	.word	0x0de9f00c,0x1354386d,0x403d2eaa,0x0e91c1d3	! PA = 0000000030101430
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
	.word	0x6f327ab8,0x4df9fce9,0x1024e3b6,0x650c0b2f	! PA = 0000000010141400
	.word	0x3f741524,0x14a7ba25,0x13023682,0x1b67e34b	! PA = 0000000010141410
	.word	0x5d28cb50,0x7e37cc21,0x261c930e,0x5c3b8627	! PA = 0000000010141420
	.word	0x5378693c,0x33e34edd,0x4567255a,0x37c1efc3	! PA = 0000000010141430
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
	.word	0x0ea47ae8,0x207e1e59,0x484cd966,0x7df6dc1f	! PA = 0000000030141400
	.word	0x4c344c54,0x1472d695,0x483c5b32,0x0372c73b	! PA = 0000000030141410
	.word	0x12e0e980,0x7a7ed391,0x5cf416be,0x4d06ed17	! PA = 0000000030141420
	.word	0x3e411e6c,0x792e314d,0x1a8e380a,0x5e1949b3	! PA = 0000000030141430
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
	.word	0x6a357718,0x1d17cbc9,0x7d4cab16,0x25c0990f	! PA = 0000000010181400
	.word	0x4a143f84,0x67d93f05,0x2f251be2,0x46a0572b	! PA = 0000000010181410
	.word	0x379583b0,0x5fd2e701,0x530cf66e,0x3584c007	! PA = 0000000010181420
	.word	0x057f0f9c,0x7ca3dfbd,0x420566ba,0x6abecfa3	! PA = 0000000010181430
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
	.word	0x62106f48,0x0c660539,0x65e758c6,0x224041ff	! PA = 0000000030181400
	.word	0x552eeeb4,0x6da9f375,0x1def7892,0x6677931b	! PA = 0000000030181410
	.word	0x265199e0,0x3a330671,0x590a321e,0x61ebfef7	! PA = 0000000030181420
	.word	0x362d3ccc,0x3e735a2d,0x51dfb16a,0x33998193	! PA = 0000000030181430
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
	.word	0x18206378,0x59c7caa9,0x189fe276,0x420cd6ef	! PA = 00000000201c0000
	.word	0x775f59e4,0x2373f3e5,0x568e7142,0x493f7b0b	! PA = 00000000201c0010
	.word	0x13e02c10,0x705e31e1,0x774ec9ce,0x1f33a9e7	! PA = 00000000201c0020
	.word	0x6306a5fc,0x158ba09d,0x23f0181a,0x6b505f83	! PA = 00000000201c0030
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
	.word	0x201053a8,0x035c1c19,0x3bb94826,0x4c7d57df	! PA = 0000000020800000
	.word	0x58408114,0x15864055,0x36b505f2,0x29ff0efb	! PA = 0000000020800010
	.word	0x3ecc3a40,0x33d36951,0x1dfdbd7e,0x2b12c0d7	! PA = 0000000020800020
	.word	0x54864b2c,0x1f9bb30d,0x05c99aca,0x114a6973	! PA = 0000000020800030
	.word	0x2f4b3fd8,0x0a01f989,0x353689d6,0x71a8c4cf	! PA = 0000000020800040
	.word	0x6d2d6444,0x4eefd8c5,0x67d636a2,0x087d4eeb	! PA = 0000000020800050
	.word	0x1f60c470,0x70d1acc1,0x54fa0d2e,0x240043c7	! PA = 0000000020800060
	.word	0x38e72c5c,0x3112917d,0x68bf397a,0x61ae9f63	! PA = 0000000020800070
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
	.word	0x4cfc2808,0x615862f9,0x5adaa786,0x3a661dbf	! PA = 00000000211c0000
	.word	0x29410374,0x497fbd35,0x0f250352,0x19413adb	! PA = 00000000211c0010
	.word	0x17a8caa0,0x3e57fc31,0x6be6b8de,0x793332b7	! PA = 00000000211c0020
	.word	0x5424498c,0x451f3bed,0x11e3f42a,0x45640153	! PA = 00000000211c0030
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
	.word	0x020e0c38,0x5fbe5869,0x2228a136,0x784c62af	! PA = 0000000021800000
	.word	0x2d565ea4,0x5dc4eda5,0x7d946c02,0x3591d2cb	! PA = 0000000021800010
	.word	0x236f4cd0,0x4e2557a1,0x2a26c08e,0x5aa28da7	! PA = 0000000021800020
	.word	0x2ff8a2bc,0x6db0b25d,0x4a0acada,0x42118f43	! PA = 0000000021800030
	.word	0x092bec68,0x2e52d9d9,0x506376e6,0x35b2939f	! PA = 0000000021800040
	.word	0x780875d4,0x330e6a15,0x5fd770b2,0x4b7616bb	! PA = 0000000021800050
	.word	0x083f4b00,0x5cb8bf11,0x7edd243e,0x29055497	! PA = 0000000021800060
	.word	0x4bdf37ec,0x4375f4cd,0x0dc6bd8a,0x6a1e4933	! PA = 0000000021800070
	.word	0x7ec0c898,0x38f4e749,0x2a8e2896,0x25afb08f	! PA = 0000000021800080
	.word	0x15b24904,0x2f6b3285,0x6e611162,0x4db506ab	! PA = 0000000021800090
	.word	0x0563c530,0x21513281,0x30ece3ee,0x65d28787	! PA = 00000000218000a0
	.word	0x4d13091c,0x55de033d,0x3d6acc3a,0x4cb12f23	! PA = 00000000218000b0
	.word	0x10f7a0c8,0x1e4380b9,0x256bb646,0x141ab97f	! PA = 00000000218000c0
	.word	0x506ed834,0x67aa46f5,0x1d644e12,0x23d5a29b	! PA = 00000000218000d0
	.word	0x03e7bb60,0x3dedb1f1,0x0ef8ff9e,0x23412677	! PA = 00000000218000e0
	.word	0x2e8f164c,0x1b17ddad,0x4d09f6ea,0x65b14113	! PA = 00000000218000f0
	.word	0x2fbb74f8,0x1f9da629,0x157f1ff6,0x558aae6f	! PA = 0000000021800100
	.word	0x60192364,0x0f5aa765,0x4cd426c2,0x1a1eea8b	! PA = 0000000021800110
	.word	0x46962d90,0x2f4d3d61,0x1f64774e,0x74483167	! PA = 0000000021800120
	.word	0x710e5f7c,0x6012841d,0x74773d9a,0x0dc57f03	! PA = 0000000021800130
	.word	0x3cb74528,0x11225799,0x5f0b65a6,0x37568f5f	! PA = 0000000021800140
	.word	0x1a4c2a94,0x68cb53d5,0x78639b72,0x5197de7b	! PA = 0000000021800150
	.word	0x19fa1bc0,0x3ceed4d1,0x50524afe,0x5c9ea857	! PA = 0000000021800160
	.word	0x4b0be4ac,0x387cf68d,0x5f45a04a,0x6a54e8f3	! PA = 0000000021800170
	.word	0x3b561158,0x49b09509,0x26138756,0x6f955c4f	! PA = 0000000021800180
	.word	0x2262edc4,0x350b4c45,0x6785ac22,0x30077e6b	! PA = 0000000021800190
	.word	0x045e85f0,0x69117841,0x27a57aae,0x40bb8b47	! PA = 00000000218001a0
	.word	0x58c2a5dc,0x6ec634fd,0x5cc81efa,0x5d867ee3	! PA = 00000000218001b0
	.word	0x00c2d988,0x12e75e79,0x7e5a8506,0x0d1e153f	! PA = 00000000218001c0
	.word	0x19786cf4,0x23e990b5,0x5d6d58d2,0x4ff4ca5b	! PA = 00000000218001d0
	.word	0x75ce6c20,0x60b427b1,0x7301065e,0x55d5da37	! PA = 00000000218001e0
	.word	0x4c2da30c,0x741d3f6d,0x1011b9aa,0x764140d3	! PA = 00000000218001f0
share3_end:
