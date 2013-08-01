/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_5000_15.s
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
!	Seed = 626172909
!	Riesling can be on
!	1 Thread, 5000 lines
!	mpgen   created on May 4, 2009 (15:17:56), Version 2.81
!	mpgen_5000l_16.s created on Jun 26, 2009 (17:29:09)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.090504 -rc random.rc -o mpgen_5000l_16 -p 1 -l 5000

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
!	%f0  = 655ee850 5b9f5521 4c1c580e 0a1d1727
!	%f4  = 7825163c 488d27dd 7fedfa5a 306450c3
!	%f8  = 0c4cb7e8 1fbb4759 36c7be66 5af30d1f
!	%f12 = 026d1954 1e644f95 01a85032 7db1c83b
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 314f4680 75159c91 44de1bbe 1dc1be17
!	%f20 = 019a0b6c 392b4a4d 46134d0a 6fd8eab3
!	%f24 = 693df418 5f0c34c9 2819d016 155e0a0f
!	%f28 = 52a14c84 1925f805 407750e2 3444982b
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 3b8c20b0 37a8f001 72b13b6e 65a8d107
!	%f36 = 17d43c9c 650438bd 7d58bbba 372bb0a3
!	%f40 = 43c92c48 5b21ae39 64d6bdc6 3b0ef2ff
!	%f44 = 12603bb4 6d61ec75 67f7ed92 6311141b
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x4a4690420000007e,%g7,%g1 ! %gsr scale = 15, align = 6
	wr	%g1,%g0,%gsr		! %gsr = 4a4690420000007e

	wr	%g0,%y			! Clear %y register
	xorcc	%g0,%g0,%g3		! %g3 = 0, %ccr = 44
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 9e84b96d, %l0 = 0e3fd1b4c94ad5be
	ldstuba	[%i3+%o4]0x89,%l0	! %l0 = 000000000000006d
!	%l3 = 3af1e2bacfeb6eef, immd = fffffffffffff64b, %l1  = 93e0da4c80547669
	mulx	%l3,-0x9b5,%l1		! %l1 = d202209bb7a42a05
!	Mem[0000000010101418] = 5c89129a, %l4 = 00000000c3ee5cca, %asi = 80
	swapa	[%i4+0x018]%asi,%l4	! %l4 = 000000005c89129a
!	%f26 = 2819d016 155e0a0f, Mem[0000000010141408] = aebf6479 479cae4d
	stda	%f26,[%i5+%o4]0x88	! Mem[0000000010141408] = 2819d016 155e0a0f
!	%f8  = 0c4cb7e8 1fbb4759, Mem[0000000010001418] = 6b4fed1a 61c7c083
	std	%f8 ,[%i0+0x018]	! Mem[0000000010001418] = 0c4cb7e8 1fbb4759
!	%f4  = 7825163c 488d27dd, Mem[0000000030101410] = 6ed7d1ac 73410f8d
	stda	%f4 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 7825163c 488d27dd
!	Mem[0000000030181408] = be362b60, %l0 = 000000000000006d
	swapa	[%i6+%o4]0x89,%l0	! %l0 = 00000000be362b60
!	%l4 = 000000005c89129a, Mem[0000000010101400] = 3c0f4a901f0bc661
	stxa	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000005c89129a
!	%l2 = 82d122ea8239d324, Mem[0000000010181400] = 514eeb50
	stba	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 244eeb50
!	%l1 = d202209bb7a42a05, Mem[000000001008143a] = 4f3565b2
	sth	%l1,[%i2+0x03a]		! Mem[0000000010081438] = 4f352a05

p0_label_2:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 68f8a7a0, %l2 = 82d122ea8239d324
	ldswa	[%i1+%g0]0x81,%l2	! %l2 = 0000000068f8a7a0
!	Mem[0000000010001410] = 9d79e215fc524434, %f10 = 36c7be66 5af30d1f
	ldda	[%i0+%o5]0x88,%f10	! %f10 = 9d79e215 fc524434
!	Mem[0000000010081410] = bc4fc772, %l0 = 00000000be362b60
	lduba	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000072
!	Mem[0000000030101408] = 5779685bfe4f972c, %f28 = 52a14c84 1925f805
	ldda	[%i4+%o4]0x89,%f28	! %f28 = 5779685b fe4f972c
!	Mem[0000000030001400] = 40973b37, %l4 = 000000005c89129a
	ldsha	[%i0+%g0]0x89,%l4	! %l4 = 0000000000003b37
!	Mem[000000001000142e] = 4b5e88df, %l4 = 0000000000003b37
	ldub	[%i0+0x02e],%l4		! %l4 = 0000000000000088
!	Mem[0000000010101400] = 000000005c89129a, %l4 = 0000000000000088
	ldx	[%i4+%g0],%l4		! %l4 = 000000005c89129a
!	Mem[00000000100c1400] = 3cdc6230, %l5 = 9c5f5956e5773fb5
	ldsha	[%i3+%g0]0x80,%l5	! %l5 = 0000000000003cdc
!	Mem[000000001018143c] = 4237673b, %f20 = 019a0b6c
	ld	[%i6+0x03c],%f20	! %f20 = 4237673b
!	Mem[0000000030001410] = 5db0382c3785cc0d, %f28 = 5779685b fe4f972c
	ldda	[%i0+%o5]0x81,%f28	! %f28 = 5db0382c 3785cc0d

p0_label_3:
!	Starting 10 instruction Store Burst
!	%f18 = 44de1bbe, %f26 = 2819d016, %f15 = 7db1c83b
	fdivs	%f18,%f26,%f15		! %f15 = 5c38d58e
!	Mem[0000000010181435] = 01a27695, %l2 = 0000000068f8a7a0
	ldstuba	[%i6+0x035]%asi,%l2	! %l2 = 00000000000000a2
!	Mem[0000000010141410] = 074ad2dc, %l5 = 0000000000003cdc
	ldstuba	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000007
!	%l6 = ac954ab0, %l7 = aa6d40bb, Mem[0000000010141410] = dcd24aff fd8dad46
	stda	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = ac954ab0 aa6d40bb
!	Mem[0000000030001400] = 373b9740, %l7 = 00000000aa6d40bb
	swapa	[%i0+%g0]0x81,%l7	! %l7 = 00000000373b9740
!	%l3 = 3af1e2bacfeb6eef, Mem[0000000010101428] = 35014aa67501c05f, %asi = 80
	stxa	%l3,[%i4+0x028]%asi	! Mem[0000000010101428] = 3af1e2bacfeb6eef
!	%o1 = deadbeefdeadbeef
	set	share1_start,%o1	! set %o1[0] to VA
!	%l2 = 00000000000000a2, Mem[0000000020800041] = 64a64c10
	stb	%l2,[%o1+0x041]		! Mem[0000000020800040] = 64a24c10
!	%l1 = d202209bb7a42a05, Mem[0000000030101400] = 256b78c0
	stwa	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = b7a42a05
!	%f0  = 655ee850 5b9f5521, %l2 = 00000000000000a2
!	Mem[0000000030001438] = 48e16ba25f568feb
	add	%i0,0x038,%g1
	stda	%f0,[%g1+%l2]ASI_PST32_S ! Mem[0000000030001438] = 655ee8505f568feb
!	Mem[0000000030101410] = 3c162578, %l2 = 00000000000000a2
	swapa	[%i4+%o5]0x89,%l2	! %l2 = 000000003c162578

p0_label_4:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = aa6d40bb ac954ab0, %l4 = 5c89129a, %l5 = 00000007
	ldda	[%i5+%o5]0x88,%l4	! %l4 = 00000000ac954ab0 00000000aa6d40bb
!	Mem[00000000300c1408] = 9e84b9ff, %l6 = e43c0fa8ac954ab0
	ldsba	[%i3+%o4]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010001408] = ce8ed777, %l2 = 000000003c162578
	ldsha	[%i0+%o4]0x88,%l2	! %l2 = ffffffffffffd777
!	Mem[0000000010141411] = b04a95ac, %l3 = 3af1e2bacfeb6eef, %asi = 80
	lduba	[%i5+0x011]%asi,%l3	! %l3 = 000000000000004a
!	Mem[00000000100c1410] = 028a361c77985c3d, %f4  = 7825163c 488d27dd
	ldda	[%i3+%o5]0x80,%f4 	! %f4  = 028a361c 77985c3d
!	Mem[0000000010141408] = 155e0a0f, %l6 = ffffffffffffffff
	ldswa	[%i5+%o4]0x88,%l6	! %l6 = 00000000155e0a0f
!	Mem[0000000030101400] = d19d9c72052aa4b7, %f22 = 46134d0a 6fd8eab3
	ldda	[%i4+%g0]0x89,%f22	! %f22 = d19d9c72 052aa4b7
!	Mem[0000000010041408] = c754693f2e52a73d, %l2 = ffffffffffffd777
	ldxa	[%i1+%o4]0x88,%l2	! %l2 = c754693f2e52a73d
!	%o2 = deadbeefdeadbeef
	set	share2_start,%o2	! set %o2[0] to VA
!	Mem[00000000211c0000] = 73ba5a40, %l2 = c754693f2e52a73d
	ldsh	[%o2+%g0],%l2		! %l2 = 00000000000073ba
!	Mem[00000000100c1430] = 66022534, %l3 = 000000000000004a, %asi = 80
	lduba	[%i3+0x030]%asi,%l3	! %l3 = 0000000000000066

p0_label_5:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000066, Mem[0000000030141410] = 09c2100c
	stha	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = 0066100c
!	%l5 = 00000000aa6d40bb, Mem[0000000010141410] = aa6d40bbac954ab0
	stxa	%l5,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000aa6d40bb
!	%l4 = 00000000ac954ab0, Mem[0000000010101410] = 7c0c6e6a
	stha	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 7c0c4ab0
!	%f26 = 2819d016 155e0a0f, %l6 = 00000000155e0a0f
!	Mem[0000000010001410] = 344452fc15e2799d
	add	%i0,0x010,%g1
	stda	%f26,[%g1+%l6]ASI_PST16_P ! Mem[0000000010001410] = 2819d016155e0a0f
!	%f4  = 028a361c, Mem[0000000010081408] = 8e853822
	sta	%f4 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 028a361c
!	%l7 = 00000000373b9740, Mem[0000000010081408] = 1c368a02
	stwa	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = 373b9740
!	%f21 = 392b4a4d, Mem[0000000010081400] = 6a2769d0
	sta	%f21,[%i2+%g0]0x80	! Mem[0000000010081400] = 392b4a4d
!	%l2 = 00000000000073ba, Mem[0000000010181410] = 3c89f811
	stha	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 3c8973ba
!	%f4  = 028a361c 77985c3d, Mem[0000000030101400] = 052aa4b7 d19d9c72
	stda	%f4 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 028a361c 77985c3d
!	%l1 = d202209bb7a42a05, Mem[0000000030181400] = 232f0980
	stha	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 2a050980

p0_label_6:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 4fafa800, %l2 = 00000000000073ba
	ldsba	[%i2+%g0]0x81,%l2	! %l2 = 000000000000004f
!	%o3 = deadbeefdeadbeef
	set	share3_start,%o3	! set %o3[0] to VA
!	Mem[0000000021800181] = 309c4d90, %l6 = 00000000155e0a0f
	ldsb	[%o3+0x181],%l6		! %l6 = ffffffffffffff9c
!	Mem[0000000010081408] = a71e0e1f40973b37, %l3 = 0000000000000066
	ldxa	[%i2+%o4]0x88,%l3	! %l3 = a71e0e1f40973b37
!	Mem[0000000010181408] = 35ebb30e10da2627, %l3 = a71e0e1f40973b37
	ldxa	[%i6+%o4]0x80,%l3	! %l3 = 35ebb30e10da2627
!	%f28 = 5db0382c, %f30 = 407750e2, %f21 = 392b4a4d
	fadds	%f28,%f30,%f21		! %f21 = 5db0382c
!	Mem[0000000010041400] = 70619822, %l6 = ffffffffffffff9c
	lduwa	[%i1+%g0]0x88,%l6	! %l6 = 0000000070619822
!	Mem[0000000030001408] = 7ec2b04f, %l2 = 000000000000004f
	lduha	[%i0+%o4]0x89,%l2	! %l2 = 000000000000b04f
!	Mem[0000000030101410] = a2000000, %l2 = 000000000000b04f
	lduha	[%i4+%o5]0x81,%l2	! %l2 = 000000000000a200
!	Mem[0000000030181408] = 6d000000 666d8d17, %l6 = 70619822, %l7 = 373b9740
	ldda	[%i6+%o4]0x81,%l6	! %l6 = 000000006d000000 00000000666d8d17
!	Mem[0000000010041400] = c1b5444e70619822, %l4 = 00000000ac954ab0
	ldxa	[%i1+%g0]0x88,%l4	! %l4 = c1b5444e70619822

p0_label_7:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 00000000, %l2 = 000000000000a200
	swapa	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%l5 = 00000000aa6d40bb, Mem[0000000030181410] = 31693e6c
	stha	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = 40bb3e6c
!	%l5 = 00000000aa6d40bb, %l7 = 00000000666d8d17, %l7 = 00000000666d8d17
	add	%l5,%l7,%l7		! %l7 = 0000000110dacdd2
!	%l2 = 00000000, %l3 = 10da2627, Mem[00000000100c1408] = ee28a37f 87988075
	stda	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 10da2627
!	%l1 = d202209bb7a42a05, imm = fffffffffffff2e0, %l2 = 0000000000000000
	and	%l1,-0xd20,%l2		! %l2 = d202209bb7a42200
!	%l3 = 35ebb30e10da2627, immd = 00000ab1, %y  = 00000000
	smul	%l3,0xab1,%l6		! %l6 = 000000b42c51e6f7, %y = 000000b4
!	%o0 = deadbeefdeadbeef
	set	share0_start,%o0	! set %o0[0] to VA
!	%l5 = 00000000aa6d40bb, Mem[00000000201c0000] = 360ba3b0, %asi = 80
	stha	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = 40bba3b0
!	Mem[0000000010141400] = f0221825, %l4 = c1b5444e70619822
	ldstuba	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000025
!	%l3 = 35ebb30e10da2627, Mem[00000000100c1408] = 000000002726da10
	stxa	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = 35ebb30e10da2627
!	Mem[000000001008142f] = 7f78c49f, %l0 = 0000000000000072
	ldstuba	[%i2+0x02f]%asi,%l0	! %l0 = 000000000000009f

p0_label_8:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 35ebb30e 10da2627, %l0 = 0000009f, %l1 = b7a42a05
	ldda	[%i3+%o4]0x80,%l0	! %l0 = 0000000035ebb30e 0000000010da2627
!	Mem[0000000030041410] = 3216b68c, %l7 = 0000000110dacdd2
	ldsha	[%i1+%o5]0x81,%l7	! %l7 = 0000000000003216
!	Mem[00000000300c1400] = 6098b87e, %l0 = 0000000035ebb30e
	lduba	[%i3+%g0]0x89,%l0	! %l0 = 000000000000007e
!	Mem[0000000010081410] = 72c74fbc, %l6 = 000000b42c51e6f7
	ldsba	[%i2+%o5]0x80,%l6	! %l6 = 0000000000000072
!	Mem[0000000010181410] = ba73893c79ceeedd, %l1 = 0000000010da2627
	ldxa	[%i6+%o5]0x80,%l1	! %l1 = ba73893c79ceeedd
!	Mem[0000000030181410] = 4dd121186c3ebb40, %l4 = 0000000000000025
	ldxa	[%i6+%o5]0x89,%l4	! %l4 = 4dd121186c3ebb40
!	Mem[0000000010001410] = 2819d016, %l3 = 35ebb30e10da2627
	ldub	[%i0+%o5],%l3		! %l3 = 0000000000000028
!	Mem[00000000300c1408] = 9e84b9ff, %l0 = 000000000000007e
	lduba	[%i3+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001400] = 5132c76bbb406daa, %f20 = 4237673b 5db0382c
	ldda	[%i0+%g0]0x89,%f20	! %f20 = 5132c76b bb406daa
!	Mem[0000000030101400] = 77985c3d, %l6 = 0000000000000072
	lduba	[%i4+%g0]0x89,%l6	! %l6 = 000000000000003d

p0_label_9:
!	Starting 10 instruction Store Burst
!	%l6 = 0000003d, %l7 = 00003216, Mem[0000000010001418] = 0c4cb7e8 1fbb4759, %asi = 80
	stda	%l6,[%i0+0x018]%asi	! Mem[0000000010001418] = 0000003d 00003216
!	%l2 = d202209bb7a42200, Mem[0000000010101410] = 7c0c4ab0
	stha	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 7c0c2200
!	%l3 = 0000000000000028, Mem[0000000010001400] = 1049d760
	stwa	%l3,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000028
!	Mem[0000000020800040] = 64a24c10, %l4 = 4dd121186c3ebb40
	ldstuba	[%o1+0x040]%asi,%l4	! %l4 = 0000000000000064
!	%l7 = 0000000000003216, %l0 = 00000000000000ff, %l4 = 0000000000000064
	sub	%l7,%l0,%l4		! %l4 = 0000000000003117
!	%f28 = 5db0382c, Mem[0000000010101438] = 363a9072
	sta	%f28,[%i4+0x038]%asi	! Mem[0000000010101438] = 5db0382c
!	Mem[0000000010101400] = 0000a200, %l0 = 00000000000000ff
	swapa	[%i4+%g0]0x80,%l0	! %l0 = 000000000000a200
!	Mem[0000000030141408] = 640a8b5e, %l5 = 00000000aa6d40bb
	swapa	[%i5+%o4]0x81,%l5	! %l5 = 00000000640a8b5e
!	%l4 = 0000000000003117, Mem[00000000100c1408] = 35ebb30e10da2627, %asi = 80
	stxa	%l4,[%i3+0x008]%asi	! Mem[00000000100c1408] = 0000000000003117
!	Mem[0000000010181400] = 50eb4e24, %l0 = 000000000000a200
	ldstuba	[%i6+%g0]0x88,%l0	! %l0 = 0000000000000024

p0_label_10:
!	Starting 10 instruction Load Burst
!	%l0 = 0000000000000024, imm = 0000000000000487, %l4 = 0000000000003117
	addc	%l0,0x487,%l4		! %l4 = 00000000000004ab
!	Mem[0000000030101410] = a2000000, %l0 = 0000000000000024
	lduwa	[%i4+%o5]0x81,%l0	! %l0 = 00000000a2000000
!	Mem[0000000030041410] = 3216b68c, %f28 = 5db0382c
	lda	[%i1+%o5]0x81,%f28	! %f28 = 3216b68c
!	Mem[0000000010181418] = 1be0455a66228fc3, %f10 = 9d79e215 fc524434, %asi = 80
	ldda	[%i6+0x018]%asi,%f10	! %f10 = 1be0455a 66228fc3
!	Mem[00000000300c1400] = f1facc436098b87e, %f8  = 0c4cb7e8 1fbb4759
	ldda	[%i3+%g0]0x89,%f8 	! %f8  = f1facc43 6098b87e
!	Mem[00000000100c1410] = 028a361c77985c3d, %f18 = 44de1bbe 1dc1be17, %asi = 80
	ldda	[%i3+0x010]%asi,%f18	! %f18 = 028a361c 77985c3d
!	Mem[0000000030041408] = 155e3dde6ed583b7, %l5 = 00000000640a8b5e
	ldxa	[%i1+%o4]0x81,%l5	! %l5 = 155e3dde6ed583b7
!	Mem[0000000010001408] = 77d78ece, %l7 = 0000000000003216
	ldsba	[%i0+%o4]0x80,%l7	! %l7 = 0000000000000077
!	Mem[0000000030081408] = 3e295957, %l3 = 0000000000000028
	lduba	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000057
!	Mem[0000000010041437] = 1984b635, %l0 = 00000000a2000000
	ldub	[%i1+0x037],%l0		! %l0 = 0000000000000035

p0_label_11:
!	Starting 10 instruction Store Burst
!	%l2 = d202209bb7a42200, Mem[00000000100c1414] = 77985c3d, %asi = 80
	stwa	%l2,[%i3+0x014]%asi	! Mem[00000000100c1414] = b7a42200
!	Mem[0000000010101410] = 00220c7c, %l7 = 0000000000000077
	ldstuba	[%i4+%o5]0x80,%l7	! %l7 = 0000000000000000
!	%l3 = 0000000000000057, Mem[0000000030001400] = bb406daa
	stha	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = bb400057
!	Mem[0000000030041410] = 8cb61632, %l3 = 0000000000000057
	swapa	[%i1+%o5]0x89,%l3	! %l3 = 000000008cb61632
!	%f26 = 2819d016 155e0a0f, Mem[0000000010101408] = 4e3cff2b 67c27811
	stda	%f26,[%i4+%o4]0x88	! Mem[0000000010101408] = 2819d016 155e0a0f
!	%l3 = 000000008cb61632, Mem[0000000010041410] = 3a4d595c2d9fea7d
	stxa	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000008cb61632
!	Mem[0000000010081410] = bc4fc772, %l2 = 00000000b7a42200
	swapa	[%i2+%o5]0x88,%l2	! %l2 = 00000000bc4fc772
!	%l3 = 000000008cb61632, Mem[000000001010141c] = 0ae6e003, %asi = 80
	stba	%l3,[%i4+0x01c]%asi	! Mem[000000001010141c] = 32e6e003
!	%l0 = 0000000000000035, Mem[0000000030041400] = a0a7f868
	stba	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = a0a7f835
!	Mem[0000000030141410] = 0c106600, %l3 = 000000008cb61632
	swapa	[%i5+%o5]0x89,%l3	! %l3 = 000000000c106600

p0_label_12:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 5db0382c, %f27 = 155e0a0f
	lda	[%i0+%o5]0x81,%f27	! %f27 = 5db0382c
!	Mem[0000000030001410] = 5db0382c3785cc0d, %f8  = f1facc43 6098b87e
	ldda	[%i0+%o5]0x81,%f8 	! %f8  = 5db0382c 3785cc0d
!	Mem[00000000218000c0] = 01cd6b00, %l3 = 000000000c106600
	ldub	[%o3+0x0c0],%l3		! %l3 = 0000000000000001
!	Mem[0000000030101410] = a2000000 488d27dd, %l2 = bc4fc772, %l3 = 00000001
	ldda	[%i4+%o5]0x81,%l2	! %l2 = 00000000a2000000 00000000488d27dd
!	Mem[0000000030101408] = 5779685b fe4f972c, %l0 = 00000035, %l1 = 79ceeedd
	ldda	[%i4+%o4]0x89,%l0	! %l0 = 00000000fe4f972c 000000005779685b
!	Mem[0000000010081410] = 0022a4b7 6ab48b5d, %l2 = a2000000, %l3 = 488d27dd
	ldda	[%i2+%o5]0x80,%l2	! %l2 = 000000000022a4b7 000000006ab48b5d
!	Mem[0000000010001408] = 77d78ece, %l3 = 000000006ab48b5d
	ldsba	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000077
!	Mem[0000000010101418] = c3ee5cca 32e6e003, %l6 = 0000003d, %l7 = 00000000, %asi = 80
	ldda	[%i4+0x018]%asi,%l6	! %l6 = 00000000c3ee5cca 0000000032e6e003
!	Mem[0000000010041408] = c754693f2e52a73d, %l6 = 00000000c3ee5cca
	ldxa	[%i1+%o4]0x88,%l6	! %l6 = c754693f2e52a73d
!	Mem[0000000030081400] = 00a8af4f, %f25 = 5f0c34c9
	lda	[%i2+%g0]0x89,%f25	! %f25 = 00a8af4f

p0_label_13:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 2e52a73d, %l2 = 000000000022a4b7
	swapa	[%i1+%o4]0x88,%l2	! %l2 = 000000002e52a73d
!	Mem[0000000030181410] = 40bb3e6c, %l2 = 000000002e52a73d
	ldstuba	[%i6+%o5]0x81,%l2	! %l2 = 0000000000000040
!	%l5 = 155e3dde6ed583b7, Mem[0000000010181410] = ba73893c
	stha	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = 83b7893c
!	%l4 = 00000000000004ab, Mem[0000000010001410] = 16d01928
	stba	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 16d019ab
!	%f11 = 66228fc3, Mem[0000000030001408] = 4fb0c27e
	sta	%f11,[%i0+%o4]0x81	! Mem[0000000030001408] = 66228fc3
!	%l0 = 00000000fe4f972c, Mem[0000000010041410] = 00000000
	stba	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000002c
!	Mem[0000000030041400] = 35f8a7a0, %l6 = c754693f2e52a73d
	ldstuba	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000035
!	Mem[0000000010041408] = b7a42200, %l3 = 0000000000000077
	ldstuba	[%i1+%o4]0x80,%l3	! %l3 = 00000000000000b7
!	%l2 = 0000000000000040, imm = 0000000000000b35, %l6 = 0000000000000035
	orn	%l2,0xb35,%l6		! %l6 = fffffffffffff4ca
!	Mem[0000000010181400] = ff4eeb5063716c21, %l3 = 00000000000000b7, %l5 = 155e3dde6ed583b7
	casxa	[%i6]0x80,%l3,%l5	! %l5 = ff4eeb5063716c21

p0_label_14:
!	Starting 10 instruction Load Burst
!	Code Fragment 3, seed = 825047
p0_fragment_1:
!	%l0 = 00000000fe4f972c
	setx	0x236545f50d34486e,%g7,%l0 ! %l0 = 236545f50d34486e
!	%l1 = 000000005779685b
	setx	0xa45152d6d2fd2a19,%g7,%l1 ! %l1 = a45152d6d2fd2a19
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 236545f50d34486e
	setx	0xcc2ac1d80951f7d4,%g7,%l0 ! %l0 = cc2ac1d80951f7d4
!	%l1 = a45152d6d2fd2a19
	setx	0x7cb60211a9ec349f,%g7,%l1 ! %l1 = 7cb60211a9ec349f
p0_fragment_1_end:
!	Mem[0000000010141408] = 155e0a0f, %f23 = 052aa4b7
	lda	[%i5+%o4]0x88,%f23	! %f23 = 155e0a0f
!	Mem[0000000030001408] = 66228fc3, %f24 = 693df418
	lda	[%i0+%o4]0x81,%f24	! %f24 = 66228fc3
!	Mem[0000000010001420] = 7b1990a8, %f9  = 3785cc0d
	lda	[%i0+0x020]%asi,%f9 	! %f9 = 7b1990a8
!	Mem[0000000030081408] = 3e295957, %l5 = ff4eeb5063716c21
	ldsba	[%i2+%o4]0x89,%l5	! %l5 = 0000000000000057
!	Mem[0000000010101400] = 000000ff5c89129a, %l4 = 00000000000004ab
	ldxa	[%i4+%g0]0x80,%l4	! %l4 = 000000ff5c89129a
!	Mem[000000001018141c] = 66228fc3, %l0 = cc2ac1d80951f7d4
	ldsw	[%i6+0x01c],%l0		! %l0 = 0000000066228fc3
!	Code Fragment 3, seed = 578218
p0_fragment_2:
!	%l0 = 0000000066228fc3
	setx	0xed58ce45b115acd6,%g7,%l0 ! %l0 = ed58ce45b115acd6
!	%l1 = 7cb60211a9ec349f
	setx	0xf8d131fcd8478201,%g7,%l1 ! %l1 = f8d131fcd8478201
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ed58ce45b115acd6
	setx	0xdd6ff4809d58eb3c,%g7,%l0 ! %l0 = dd6ff4809d58eb3c
!	%l1 = f8d131fcd8478201
	setx	0x18e84eebc0d2eb87,%g7,%l1 ! %l1 = 18e84eebc0d2eb87
p0_fragment_2_end:
!	Mem[0000000010141410] = 00000000aa6d40bb, %l7 = 0000000032e6e003
	ldxa	[%i5+%o5]0x88,%l7	! %l7 = 00000000aa6d40bb
!	Mem[0000000010101410] = 7c0c22ff, %l2 = 0000000000000040
	ldstuba	[%i4+%o5]0x88,%l2	! %l2 = 00000000000000ff

p0_label_15:
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = 73ba5a40, %l7 = 00000000aa6d40bb
	ldstuba	[%o2+0x001]%asi,%l7	! %l7 = 00000000000000ba
!	%l1 = 18e84eebc0d2eb87, Mem[0000000021800100] = 7d19e530
	stb	%l1,[%o3+0x100]		! Mem[0000000021800100] = 8719e530
!	%l7 = 00000000000000ba, imm = 00000000000009ae, %l2 = 00000000000000ff
	xor	%l7,0x9ae,%l2		! %l2 = 0000000000000914
!	%f14 = 01a85032 5c38d58e, Mem[0000000010101408] = 0f0a5e15 16d01928
	std	%f14,[%i4+%o4]		! Mem[0000000010101408] = 01a85032 5c38d58e
!	%l0 = dd6ff4809d58eb3c, immd = fffffffffffffa18, %l108 = 0000000000000006
	udivx	%l0,-0x5e8,%l6		! %l6 = 0000000000000000
!	%l0 = 9d58eb3c, %l1 = c0d2eb87, Mem[0000000010001438] = 2499faf2 67330ffb
	std	%l0,[%i0+0x038]		! Mem[0000000010001438] = 9d58eb3c c0d2eb87
!	Mem[0000000010001408] = ce8ed777, %l7 = 00000000000000ba
	ldstuba	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000077
!	%l1 = 18e84eebc0d2eb87, Mem[0000000030101408] = 2c974ffe
	stwa	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = c0d2eb87
!	%l7 = 0000000000000077, Mem[00000000100c1410] = 028a361cb7a42200
	stxa	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000000000000077
!	Mem[0000000030101408] = 87ebd2c0, %l7 = 0000000000000077
	swapa	[%i4+%o4]0x89,%l7	! %l7 = 0000000087ebd2c0

p0_label_16:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 000000ff5c89129a, %f0  = 655ee850 5b9f5521
	ldd	[%i4+%g0],%f0 		! %f0  = 000000ff 5c89129a
!	Mem[0000000010181410] = 3c89b783, %l3 = 00000000000000b7
	ldsha	[%i6+%o5]0x88,%l3	! %l3 = ffffffffffffb783
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010081400] = 392b4a4d 76c6e0a1 373b9740 1f0e1ea7
!	Mem[0000000010081410] = 0022a4b7 6ab48b5d 4b439fda 0f5df043
!	Mem[0000000010081420] = 16962968 3d0a02d9 1c305be6 7f78c4ff
!	Mem[0000000010081430] = 61a342d4 1d99e315 4f352a05 449f17bb
	ldda	[%i2+%g0]ASI_BLK_PL,%f0 	! Block Load from 0000000010081400
!	Mem[0000000010041430] = 60235074, %l1 = 18e84eebc0d2eb87
	ldsw	[%i1+0x030],%l1		! %l1 = 0000000060235074
!	Mem[00000000100c1410] = 00000000, %f19 = 77985c3d
	lda	[%i3+%o5]0x88,%f19	! %f19 = 00000000
!	Mem[0000000010001418] = 0000003d, %f21 = bb406daa
	ld	[%i0+0x018],%f21	! %f21 = 0000003d
!	Mem[0000000010101400] = 000000ff, %l3 = ffffffffffffb783
	ldswa	[%i4+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001430] = 35aa4e14, %l1 = 0000000060235074
	ldsh	[%i0+0x030],%l1		! %l1 = 00000000000035aa
!	Mem[0000000010001400] = e1bae21200000028, %l2 = 0000000000000914
	ldxa	[%i0+%g0]0x88,%l2	! %l2 = e1bae21200000028
!	Mem[0000000010101408] = 01a85032, %l5 = 0000000000000057
	lduwa	[%i4+%o4]0x80,%l5	! %l5 = 0000000001a85032

p0_label_17:
!	Starting 10 instruction Store Burst
!	%f28 = 3216b68c 3785cc0d, Mem[00000000300c1408] = ffb9849e 17687777
	stda	%f28,[%i3+%o4]0x81	! Mem[00000000300c1408] = 3216b68c 3785cc0d
!	Mem[0000000030181408] = 0000006d, %l1 = 00000000000035aa
	ldstuba	[%i6+%o4]0x89,%l1	! %l1 = 000000000000006d
!	%l3 = 00000000000000ff, immd = fffff095, %y  = 000000b4
	sdiv	%l3,-0xf6b,%l1		! %l1 = fffffffff453478b
	mov	%l0,%y			! %y = 9d58eb3c
!	%f3  = 40973b37, Mem[0000000010101400] = ff000000
	sta	%f3 ,[%i4+%g0]0x88	! Mem[0000000010101400] = 40973b37
!	%f5  = b7a42200, Mem[0000000030181408] = ff000000
	sta	%f5 ,[%i6+%o4]0x81	! Mem[0000000030181408] = b7a42200
!	Mem[0000000010141400] = f02218ff, %l4 = 000000005c89129a
	swapa	[%i5+%g0]0x88,%l4	! %l4 = 00000000f02218ff
!	%f25 = 00a8af4f, %f3  = 40973b37, %f31 = 3444982b
	fdivs	%f25,%f3 ,%f31		! tt=0x22, %l0 = dd6ff4809d58eb5e
!	%l0 = dd6ff4809d58eb5e, Mem[0000000030041400] = a0a7f8ff
	stha	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = a0a7eb5e
!	Mem[0000000030041410] = 00000057, %l6 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000057
!	Mem[0000000010041410] = 0000002c, %l4 = 00000000f02218ff
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 000000000000002c

p0_label_18:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 8cb61632, %l2 = e1bae21200000028
	lduha	[%i5+%o5]0x89,%l2	! %l2 = 0000000000001632
!	Mem[0000000010041434] = 1984b635, %l5 = 0000000001a85032, %asi = 80
	lduwa	[%i1+0x034]%asi,%l5	! %l5 = 000000001984b635
!	Mem[0000000010081420] = 169629683d0a02d9, %f30 = 407750e2 3444982b, %asi = 80
	ldda	[%i2+0x020]%asi,%f30	! %f30 = 16962968 3d0a02d9
!	Mem[0000000030181400] = 2a05098052407391, %f22 = d19d9c72 155e0a0f
	ldda	[%i6+%g0]0x81,%f22	! %f22 = 2a050980 52407391
!	Mem[0000000010001410] = ab19d016155e0a0f, %l3 = 00000000000000ff
	ldxa	[%i0+%o5]0x80,%l3	! %l3 = ab19d016155e0a0f
!	Code Fragment 3, seed = 995110
p0_fragment_3:
!	%l0 = dd6ff4809d58eb5e
	setx	0x2c11d80decd404f6,%g7,%l0 ! %l0 = 2c11d80decd404f6
!	%l1 = fffffffff453478b
	setx	0x3655e2c9e8b0e021,%g7,%l1 ! %l1 = 3655e2c9e8b0e021
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2c11d80decd404f6
	setx	0x863f9d5803766f5c,%g7,%l0 ! %l0 = 863f9d5803766f5c
!	%l1 = 3655e2c9e8b0e021
	setx	0x607a00b6bde3b5a7,%g7,%l1 ! %l1 = 607a00b6bde3b5a7
p0_fragment_3_end:
!	Mem[0000000030001400] = bb400057, %l7 = 0000000087ebd2c0
	ldswa	[%i0+%g0]0x89,%l7	! %l7 = ffffffffbb400057
!	Mem[000000001008141a] = 4b439fda, %l7 = ffffffffbb400057
	lduh	[%i2+0x01a],%l7		! %l7 = 0000000000009fda
!	Mem[0000000030001410] = 2c38b05d, %l2 = 0000000000001632
	ldswa	[%i0+%o5]0x89,%l2	! %l2 = 000000002c38b05d
!	%l3 = ab19d016155e0a0f, %l7 = 0000000000009fda, %l5 = 000000001984b635
	and	%l3,%l7,%l5		! %l5 = 0000000000000a0a

p0_label_19:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 83b7893c, %l4 = 000000000000002c
	ldstuba	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000083
!	Mem[0000000010181400] = ff4eeb50, %l6 = 0000000000000057
	ldstuba	[%i6+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081428] = 1c305be6, %l5 = 0000000000000a0a
	swap	[%i2+0x028],%l5		! %l5 = 000000001c305be6
!	Mem[0000000030181400] = 2a050980, %l6 = 00000000000000ff
	swapa	[%i6+%g0]0x81,%l6	! %l6 = 000000002a050980
!	%l5 = 000000001c305be6, %l2 = 000000002c38b05d, %l3 = ab19d016155e0a0f
	subc	%l5,%l2,%l3		! %l3 = ffffffffeff7ab89
!	%l3 = ffffffffeff7ab89, Mem[0000000030141400] = 2049200f
	stba	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 20492089
!	Mem[0000000010101423] = 51828228, %l5 = 000000001c305be6
	ldstub	[%i4+0x023],%l5		! %l5 = 0000000000000028
!	%l7 = 0000000000009fda, Mem[00000000211c0001] = 73ff5a40, %asi = 80
	stba	%l7,[%o2+0x001]%asi	! Mem[00000000211c0000] = 73da5a40
!	%f8  = d9020a3d, Mem[0000000010001410] = ab19d016
	sta	%f8 ,[%i0+%o5]0x80	! Mem[0000000010001410] = d9020a3d
!	%f29 = 3785cc0d, Mem[0000000030181410] = 6c3ebbff
	sta	%f29,[%i6+%o5]0x89	! Mem[0000000030181410] = 3785cc0d

p0_label_20:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081418] = 4b439fda 0f5df043, %l0 = 03766f5c, %l1 = bde3b5a7, %asi = 80
	ldda	[%i2+0x018]%asi,%l0	! %l0 = 000000004b439fda 000000000f5df043
!	Mem[00000000100c1410] = 0000000000000077, %f0  = a1e0c676 4d4a2b39
	ldda	[%i3+%o5]0x80,%f0 	! %f0  = 00000000 00000077
!	Mem[0000000010081408] = 373b9740, %f23 = 52407391
	lda	[%i2+0x008]%asi,%f23	! %f23 = 373b9740
!	Mem[00000000211c0001] = 73da5a40, %l1 = 000000000f5df043
	ldsb	[%o2+0x001],%l1		! %l1 = ffffffffffffffda
!	Mem[0000000010041410] = f02218ff, %l2 = 000000002c38b05d
	ldswa	[%i1+%o5]0x88,%l2	! %l2 = fffffffff02218ff
!	%l2 = fffffffff02218ff, imm = 00000000000008b1, %l0 = 000000004b439fda
	xor	%l2,0x8b1,%l0		! %l0 = fffffffff022104e
!	Mem[0000000010081410] = 5d8bb46ab7a42200, %l5 = 0000000000000028
	ldxa	[%i2+%o5]0x88,%l5	! %l5 = 5d8bb46ab7a42200
!	Mem[0000000030101408] = 00000077, %l2 = fffffffff02218ff
	ldswa	[%i4+%o4]0x89,%l2	! %l2 = 0000000000000077
!	Code Fragment 3, seed = 141440
p0_fragment_4:
!	%l0 = fffffffff022104e
	setx	0xbf9509cf80f6b426,%g7,%l0 ! %l0 = bf9509cf80f6b426
!	%l1 = ffffffffffffffda
	setx	0x17a6b783fc682851,%g7,%l1 ! %l1 = 17a6b783fc682851
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = bf9509cf80f6b426
	setx	0x96e26d499153008c,%g7,%l0 ! %l0 = 96e26d499153008c
!	%l1 = 17a6b783fc682851
	setx	0x63d7d76d8d573fd7,%g7,%l1 ! %l1 = 63d7d76d8d573fd7
p0_fragment_4_end:
!	Mem[00000000100c1420] = 17725dc81d7929b9, %l2 = 0000000000000077
	ldx	[%i3+0x020],%l2		! %l2 = 17725dc81d7929b9

p0_label_21:
!	Starting 10 instruction Store Burst
!	%l2 = 17725dc81d7929b9, Mem[0000000010101400] = 373b9740
	stba	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = b93b9740
!	%f1  = 00000077, Mem[00000000100c1410] = 00000000
	sta	%f1 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000077
!	Mem[0000000010141400] = 9a12895c, %l7 = 0000000000009fda
	ldstuba	[%i5+%g0]0x80,%l7	! %l7 = 000000000000009a
!	%f4  = 5d8bb46a b7a42200, %l3 = ffffffffeff7ab89
!	Mem[0000000010041438] = 54267852754fbbdb
	add	%i1,0x038,%g1
	stda	%f4,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010041438] = 00227852754f8b5d
!	%f18 = 028a361c, Mem[0000000030081400] = 00a8af4f
	sta	%f18,[%i2+%g0]0x89	! Mem[0000000030081400] = 028a361c
!	Mem[0000000030141400] = 89204920 067070b1 aa6d40bb 11822b37
!	%f16 = 314f4680 75159c91 028a361c 00000000
!	%f20 = 5132c76b 0000003d 2a050980 373b9740
!	%f24 = 66228fc3 00a8af4f 2819d016 5db0382c
!	%f28 = 3216b68c 3785cc0d 16962968 3d0a02d9
	stda	%f16,[%i5+%g0]ASI_BLK_AIUS	! Block Store to 0000000030141400
!	%l2 = 1d7929b9, %l3 = eff7ab89, Mem[0000000010181428] = 1d8ff966 69b97c1f
	std	%l2,[%i6+0x028]		! Mem[0000000010181428] = 1d7929b9 eff7ab89
!	%l6 = 000000002a050980, Mem[0000000030101410] = a2000000
	stba	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 80000000
!	%l1 = 63d7d76d8d573fd7, Mem[0000000010181408] = 35ebb30e10da2627
	stxa	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = 63d7d76d8d573fd7
!	Mem[0000000030001408] = 66228fc3, %l2 = 000000001d7929b9
	swapa	[%i0+%o4]0x81,%l2	! %l2 = 0000000066228fc3

p0_label_22:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 80000000488d27dd, %f2  = a71e0e1f 40973b37
	ldda	[%i4+%o5]0x81,%f2 	! %f2  = 80000000 488d27dd
!	Mem[0000000030101400] = 3d5c98771c368a02, %f12 = 15e3991d d442a361
	ldda	[%i4+%g0]0x81,%f12	! %f12 = 3d5c9877 1c368a02
!	Mem[00000000300c1400] = 6098b87e, %l3 = ffffffffeff7ab89
	lduwa	[%i3+%g0]0x89,%l3	! %l3 = 000000006098b87e
!	Mem[0000000030181408] = b7a42200, %l4 = 0000000000000083
	lduba	[%i6+%o4]0x81,%l4	! %l4 = 00000000000000b7
!	Mem[00000000100c1410] = 00000077, %l2 = 0000000066228fc3
	ldswa	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000077
!	Mem[00000000211c0000] = 73da5a40, %l2 = 0000000000000077
	ldsh	[%o2+%g0],%l2		! %l2 = 00000000000073da
!	Mem[00000000300c1408] = 3216b68c 3785cc0d, %l6 = 2a050980, %l7 = 0000009a
	ldda	[%i3+%o4]0x81,%l6	! %l6 = 000000003216b68c 000000003785cc0d
!	Mem[0000000030181410] = 0dcc8537, %l0 = 96e26d499153008c
	lduha	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000dcc
!	Mem[00000000211c0000] = 73da5a40, %l0 = 0000000000000dcc
	lduh	[%o2+%g0],%l0		! %l0 = 00000000000073da
!	Mem[00000000211c0000] = 73da5a40, %l1 = 63d7d76d8d573fd7, %asi = 80
	ldsha	[%o2+0x000]%asi,%l1	! %l1 = 00000000000073da

p0_label_23:
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = 40bba3b0, %l6 = 000000003216b68c
	ldstub	[%o0+0x001],%l6		! %l6 = 00000000000000bb
!	Mem[00000000300c1410] = 39d2834c, %l1 = 00000000000073da
	ldstuba	[%i3+%o5]0x81,%l1	! %l1 = 0000000000000039
!	%l7 = 000000003785cc0d, Mem[00000000100c1410] = 00000077
	stha	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000cc0d
!	Mem[0000000030041408] = 155e3dde 6ed583b7, %l0 = 000073da, %l1 = 00000039
	ldda	[%i1+%o4]0x81,%l0	! %l0 = 00000000155e3dde 000000006ed583b7
!	Mem[0000000010101408] = 3250a801, %l2 = 00000000000073da
	swapa	[%i4+%o4]0x88,%l2	! %l2 = 000000003250a801
!	Mem[0000000030041400] = a0a7eb5e, %l1 = 000000006ed583b7
	ldstuba	[%i1+%g0]0x89,%l1	! %l1 = 000000000000005e
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000030141410] = 6bc73251, %l6 = 00000000000000bb
	swapa	[%i5+%o5]0x89,%l6	! %l6 = 000000006bc73251
!	%l6 = 000000006bc73251, Mem[00000000300c1410] = ffd2834c
	stba	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 51d2834c
!	Mem[0000000030001400] = bb400057, %l6 = 000000006bc73251
	ldstuba	[%i0+%g0]0x89,%l6	! %l6 = 0000000000000057
!	%l2 = 3250a801, %l3 = 6098b87e, Mem[0000000010081410] = b7a42200 5d8bb46a
	stda	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 3250a801 6098b87e

p0_label_24:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ffb7893c, %l4 = 00000000000000b7, %asi = 80
	lduba	[%i6+0x010]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1408] = 0dcc85378cb61632, %f30 = 16962968 3d0a02d9
	ldda	[%i3+%o4]0x89,%f30	! %f30 = 0dcc8537 8cb61632
!	%f0  = 00000000, %f7  = da9f434b, %f30 = 0dcc8537 8cb61632
	fsmuld	%f0 ,%f7 ,%f30		! %f30 = 80000000 00000000
!	Mem[0000000030181400] = 000000ff 52407391, %l0 = 155e3dde, %l1 = 0000005e
	ldda	[%i6+%g0]0x81,%l0	! %l0 = 00000000000000ff 0000000052407391
!	Mem[000000001004141c] = 78708063, %l3 = 000000006098b87e
	lduh	[%i1+0x01c],%l3		! %l3 = 0000000000007870
!	Mem[0000000020800000] = 64efb9e0, %l5 = 5d8bb46ab7a42200, %asi = 80
	lduba	[%o1+0x000]%asi,%l5	! %l5 = 0000000000000064
!	Mem[0000000010101420] = 518282ff, %l6 = 0000000000000057, %asi = 80
	ldsba	[%i4+0x020]%asi,%l6	! %l6 = 0000000000000051
!	Mem[0000000010101408] = da730000, %l0 = 00000000000000ff
	ldswa	[%i4+%o4]0x80,%l0	! %l0 = ffffffffda730000
!	Mem[0000000030101410] = 80000000, %l1 = 0000000052407391
	ldsba	[%i4+%o5]0x81,%l1	! %l1 = ffffffffffffff80
!	%f19 = 00000000, %f26 = 2819d016, %f14 = bb179f44 052a354f
	fsmuld	%f19,%f26,%f14		! %f14 = 00000000 00000000

p0_label_25:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000064, Mem[000000001014143c] = 55ed4b5b, %asi = 80
	stwa	%l5,[%i5+0x03c]%asi	! Mem[000000001014143c] = 00000064
!	Mem[0000000030101410] = 00000080, %l5 = 0000000000000064
	ldstuba	[%i4+%o5]0x89,%l5	! %l5 = 0000000000000080
!	%f1  = 00000077, %f4  = 5d8bb46a
	fcmpes	%fcc0,%f1 ,%f4 		! %fcc0 = 1
!	Mem[0000000010141400] = ff12895c 14be8141 0f0a5e15 16d01928
!	%f16 = 314f4680 75159c91 028a361c 00000000
!	%f20 = 5132c76b 0000003d 2a050980 373b9740
!	%f24 = 66228fc3 00a8af4f 2819d016 5db0382c
!	%f28 = 3216b68c 3785cc0d 80000000 00000000
	stda	%f16,[%i5+%g0]ASI_BLK_P	! Block Store to 0000000010141400
!	Mem[0000000010181410] = ffb7893c, %l5 = 0000000000000080
	swapa	[%i6+%o5]0x80,%l5	! %l5 = 00000000ffb7893c
!	%f1  = 00000077, Mem[0000000010141410] = 5132c76b
	sta	%f1 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000077
!	%l5 = 00000000ffb7893c, Mem[00000000100c1408] = 00000000
	stwa	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffb7893c
!	%l4 = 00000000000000ff, Mem[0000000030181410] = 0dcc8537
	stha	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 00ff8537
!	%l7 = 000000003785cc0d, Mem[0000000010041418] = 676b8e7a, %asi = 80
	stha	%l7,[%i1+0x018]%asi	! Mem[0000000010041418] = cc0d8e7a
!	%l4 = 00000000000000ff, Mem[0000000030101408] = 77000000
	stba	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = ff000000

p0_label_26:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 70619822, %l4 = 00000000000000ff
	ldsha	[%i1+%g0]0x88,%l4	! %l4 = ffffffffffff9822
!	Mem[0000000010181408] = 63d7d76d, %l6 = 0000000000000051
	ldsba	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000063
!	Mem[0000000030041408] = de3d5e15, %l3 = 0000000000007870
	lduba	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000015
!	Mem[0000000010081400] = 392b4a4d 76c6e0a1, %l4 = ffff9822, %l5 = ffb7893c
	ldd	[%i2+%g0],%l4		! %l4 = 00000000392b4a4d 0000000076c6e0a1
!	Mem[0000000010041410] = f02218ff, %l5 = 0000000076c6e0a1
	lduwa	[%i1+%o5]0x88,%l5	! %l5 = 00000000f02218ff
!	Mem[0000000030081408] = 9725ca243e295957, %f8  = d9020a3d 68299616
	ldda	[%i2+%o4]0x89,%f8 	! %f8  = 9725ca24 3e295957
!	%f25 = 00a8af4f, %f24 = 66228fc3, %f2  = 80000000 488d27dd
	fsmuld	%f25,%f24,%f2 		! %f2  = 3ceac76a 9a2a8b40
!	Mem[0000000010081410] = 3250a801, %l4 = 00000000392b4a4d
	ldswa	[%i2+%o5]0x88,%l4	! %l4 = 000000003250a801
!	Mem[0000000010101434] = 0d23ccd5, %l5 = 00000000f02218ff
	ldsw	[%i4+0x034],%l5		! %l5 = 000000000d23ccd5
!	Mem[0000000010081424] = 3d0a02d9, %l3 = 0000000000000015, %asi = 80
	swapa	[%i2+0x024]%asi,%l3	! %l3 = 000000003d0a02d9

p0_label_27:
!	Starting 10 instruction Store Burst
!	%l5 = 000000000d23ccd5, Mem[00000000211c0001] = 73da5a40
	stb	%l5,[%o2+0x001]		! Mem[00000000211c0000] = 73d55a40
!	Code Fragment 4, seed = 423045
p0_fragment_5:
!	%l0 = ffffffffda730000
	setx	0x01ea4d83005868fe,%g7,%l0 ! %l0 = 01ea4d83005868fe
!	%l1 = ffffffffffffff80
	setx	0x6609525c47dea5a9,%g7,%l1 ! %l1 = 6609525c47dea5a9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 01ea4d83005868fe
	setx	0x3ffd2f2e22cdde64,%g7,%l0 ! %l0 = 3ffd2f2e22cdde64
!	%l1 = 6609525c47dea5a9
	setx	0xea883ca72592962f,%g7,%l1 ! %l1 = ea883ca72592962f
p0_fragment_5_end:
!	%f28 = 3216b68c, Mem[0000000030101410] = 000000ff
	sta	%f28,[%i4+%o5]0x89	! Mem[0000000030101410] = 3216b68c
!	%l1 = ea883ca72592962f, Mem[0000000020800041] = ffa24c10
	stb	%l1,[%o1+0x041]		! Mem[0000000020800040] = ff2f4c10
!	Mem[0000000010001400] = 00000028, %l7 = 000000003785cc0d
	ldstuba	[%i0+%g0]0x88,%l7	! %l7 = 0000000000000028
!	%l4 = 000000003250a801, Mem[0000000010101408] = da730000
	stha	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = a8010000
!	%l4 = 3250a801, %l5 = 0d23ccd5, Mem[0000000010081428] = 00000a0a 7f78c4ff
	std	%l4,[%i2+0x028]		! Mem[0000000010081428] = 3250a801 0d23ccd5
!	%l4 = 000000003250a801, Mem[00000000201c0000] = 40ffa3b0, %asi = 80
	stha	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = a801a3b0
!	%l7 = 0000000000000028, Mem[0000000010041410] = ff1822f0
	stha	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = 002822f0
!	Mem[0000000010001410] = d9020a3d, %l0 = 0000000022cdde64
	swap	[%i0+%o5],%l0		! %l0 = 00000000d9020a3d

p0_label_28:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 51d2834c, %f11 = e65b301c
	lda	[%i3+%o5]0x81,%f11	! %f11 = 51d2834c
!	Mem[0000000010041408] = ffa422003f6954c7, %l0 = 00000000d9020a3d
	ldxa	[%i1+%o4]0x80,%l0	! %l0 = ffa422003f6954c7
!	Mem[0000000030101408] = ff000000, %l4 = 000000003250a801
	lduba	[%i4+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081400] = 392b4a4d, %l3 = 000000003d0a02d9
	lduha	[%i2+%g0]0x80,%l3	! %l3 = 000000000000392b
!	Mem[00000000100c1434] = 38fc3ff5, %l2 = 000000003250a801, %asi = 80
	lduha	[%i3+0x034]%asi,%l2	! %l2 = 00000000000038fc
!	Mem[0000000010041408] = c754693f0022a4ff, %f0  = 00000000 00000077
	ldda	[%i1+%o4]0x88,%f0 	! %f0  = c754693f 0022a4ff
!	Mem[00000000211c0000] = 73d55a40, %l1 = ea883ca72592962f, %asi = 80
	ldsha	[%o2+0x000]%asi,%l1	! %l1 = 00000000000073d5
!	Mem[0000000020800040] = ff2f4c10, %l6 = 0000000000000063
	ldsb	[%o1+0x040],%l6		! %l6 = ffffffffffffffff
!	Mem[00000000211c0000] = 73d55a40, %l1 = 00000000000073d5, %asi = 80
	ldsha	[%o2+0x000]%asi,%l1	! %l1 = 00000000000073d5
!	Mem[00000000100c1416] = 00000077, %l5 = 000000000d23ccd5, %asi = 80
	lduha	[%i3+0x016]%asi,%l5	! %l5 = 0000000000000077

p0_label_29:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1428] = 7ead1b46, %l6 = ffffffff, %l7 = 00000028
	add	%i3,0x28,%g1
	casa	[%g1]0x80,%l6,%l7	! %l7 = 000000007ead1b46
!	Mem[00000000100c140f] = 00003117, %l3 = 000000000000392b
	ldstuba	[%i3+0x00f]%asi,%l3	! %l3 = 0000000000000017
!	%f6  = 43f05d0f da9f434b, Mem[0000000010081410] = 01a85032 7eb89860
	stda	%f6 ,[%i2+%o5]0x80	! Mem[0000000010081410] = 43f05d0f da9f434b
!	%l4 = 00000000000000ff, Mem[0000000030041408] = de3d5e15
	stba	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = de3d5eff
!	Mem[0000000030181410] = 3785ff00, %l7 = 000000007ead1b46
	swapa	[%i6+%o5]0x89,%l7	! %l7 = 000000003785ff00
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010141408] = 1c368a02, %l5 = 0000000000000077
	ldstuba	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000002
!	Mem[0000000030081400] = 1c368a02 53098811 5759293e 24ca2597
!	%f0  = c754693f 0022a4ff 3ceac76a 9a2a8b40
!	%f4  = 5d8bb46a b7a42200 43f05d0f da9f434b
!	%f8  = 9725ca24 3e295957 ffc4787f 51d2834c
!	%f12 = 3d5c9877 1c368a02 00000000 00000000
	stda	%f0 ,[%i2+%g0]ASI_BLK_AIUS	! Block Store to 0000000030081400
!	%l0 = ffa422003f6954c7, imm = fffffffffffff6a0, %l0 = ffa422003f6954c7
	xnor	%l0,-0x960,%l0		! %l0 = ffa422003f695d98
!	%f28 = 3216b68c 3785cc0d, Mem[00000000300c1408] = 8cb61632 0dcc8537
	stda	%f28,[%i3+%o4]0x89	! Mem[00000000300c1408] = 3216b68c 3785cc0d
!	%l1 = 00000000000073d5, Mem[0000000010041428] = 68730c866999cebf
	stx	%l1,[%i1+0x028]		! Mem[0000000010041428] = 00000000000073d5

p0_label_30:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ff000000, %l6 = ffffffffffffffff
	lduwa	[%i6+%g0]0x89,%l6	! %l6 = 00000000ff000000
!	%l7 = 000000003785ff00, imm = fffffffffffffb02, %l5 = 0000000000000002
	andn	%l7,-0x4fe,%l5		! %l5 = 0000000000000400
!	Mem[0000000010181410] = ddeece7980000000, %f26 = 2819d016 5db0382c
	ldda	[%i6+%o5]0x88,%f26	! %f26 = ddeece79 80000000
!	Mem[0000000010041400] = 22986170, %l1 = 00000000000073d5
	lduwa	[%i1+%g0]0x80,%l1	! %l1 = 0000000022986170
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000030081400] = ffa42200 3f6954c7, %l2 = 000038fc, %l3 = 00000017
	ldda	[%i2+%g0]0x89,%l2	! %l2 = 000000003f6954c7 00000000ffa42200
!	Mem[0000000010141400] = 919c1575 80464f31, %l6 = ff000000, %l7 = 3785ff00
	ldda	[%i5+%g0]0x88,%l6	! %l6 = 0000000080464f31 00000000919c1575
!	Mem[0000000010141410] = 00000077, %l2 = 000000003f6954c7
	lduba	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = ffd78ece 13da3ae7, %l2 = 00000000, %l3 = ffa42200, %asi = 80
	ldda	[%i0+0x008]%asi,%l2	! %l2 = 00000000ffd78ece 0000000013da3ae7
!	Mem[0000000010141410] = 77000000, %l2 = 00000000ffd78ece
	lduha	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081400] = 392b4a4d, %l2 = 0000000000000000
	lduwa	[%i2+%g0]0x80,%l2	! %l2 = 00000000392b4a4d

p0_label_31:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = ffeba7a0 255a4531 ff5e3dde 6ed583b7
!	%f0  = c754693f 0022a4ff 3ceac76a 9a2a8b40
!	%f4  = 5d8bb46a b7a42200 43f05d0f da9f434b
!	%f8  = 9725ca24 3e295957 ffc4787f 51d2834c
!	%f12 = 3d5c9877 1c368a02 00000000 00000000
	stda	%f0 ,[%i1+%g0]ASI_BLK_S	! Block Store to 0000000030041400
!	%l2 = 00000000392b4a4d, Mem[0000000010001423] = 7b1990a8, %asi = 80
	stba	%l2,[%i0+0x023]%asi	! Mem[0000000010001420] = 7b19904d
!	Mem[0000000010141410] = 77000000, %l2 = 00000000392b4a4d
	ldstuba	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1408] = 0dcc8537, %l4 = 00000000000000ff
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 000000000dcc8537
!	%f14 = 00000000 00000000, Mem[0000000030141410] = bb000000 0000003d
	stda	%f14,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 00000000
!	%l4 = 0dcc8537, %l5 = 00000400, Mem[0000000010081408] = 373b9740 1f0e1ea7, %asi = 80
	stda	%l4,[%i2+0x008]%asi	! Mem[0000000010081408] = 0dcc8537 00000400
!	%l0 = ffa422003f695d98, Mem[0000000010001400] = 000000ff
	stha	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 00005d98
!	%f30 = 80000000 00000000, Mem[0000000010141400] = 80464f31 919c1575
	stda	%f30,[%i5+%g0]0x88	! Mem[0000000010141400] = 80000000 00000000
!	Mem[0000000010181400] = 50eb4eff, %l0 = 000000003f695d98
	swapa	[%i6+%g0]0x88,%l0	! %l0 = 0000000050eb4eff
!	%l7 = 00000000919c1575, Mem[0000000010001410] = 0f0a5e1564decd22
	stxa	%l7,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000919c1575

p0_label_32:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 314f4680, %l4 = 000000000dcc8537
	lduha	[%i5+%g0]0x81,%l4	! %l4 = 000000000000314f
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000030041410] = 5d8bb46ab7a42200, %l2 = 0000000000000000
	ldxa	[%i1+%o5]0x81,%l2	! %l2 = 5d8bb46ab7a42200
!	Mem[0000000010181400] = 985d693f, %f16 = 314f4680
	lda	[%i6+%g0]0x80,%f16	! %f16 = 985d693f
!	Mem[0000000010081410] = 0f5df043, %l3 = 0000000013da3ae7
	lduba	[%i2+%o5]0x88,%l3	! %l3 = 0000000000000043
!	Mem[00000000300c1400] = 7eb8986043ccfaf1, %l3 = 0000000000000043
	ldxa	[%i3+%g0]0x81,%l3	! %l3 = 7eb8986043ccfaf1
!	Mem[00000000300c1408] = ff000000, %l2 = 5d8bb46ab7a42200
	ldsba	[%i3+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1408] = ffb7893c, %l0 = 0000000050eb4eff
	ldswa	[%i3+%o4]0x80,%l0	! %l0 = ffffffffffb7893c
!	Mem[0000000010081408] = 000400003785cc0d, %f14 = 00000000 00000000
	ldda	[%i2+%o4]0x88,%f14	! %f14 = 00040000 3785cc0d
!	Mem[0000000010181400] = 216c7163 3f695d98, %l2 = 00000000, %l3 = 43ccfaf1
	ldda	[%i6+%g0]0x88,%l2	! %l2 = 000000003f695d98 00000000216c7163
!	%l0 = ffffffffffb7893c, imm = 0000000000000d08, %l2 = 000000003f695d98
	add	%l0,0xd08,%l2		! %l2 = ffffffffffb79644

p0_label_33:
!	Starting 10 instruction Store Burst
!	%f8  = 9725ca24, Mem[0000000010181408] = 63d7d76d
	sta	%f8 ,[%i6+%o4]0x80	! Mem[0000000010181408] = 9725ca24
!	Mem[00000000211c0000] = 73d55a40, %l5 = 0000000000000400
	ldstuba	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000073
!	Mem[0000000030101400] = 77985c3d, %l3 = 00000000216c7163
	ldstuba	[%i4+%g0]0x89,%l3	! %l3 = 000000000000003d
!	Mem[00000000211c0001] = ffd55a40, %l3 = 000000000000003d
	ldstub	[%o2+0x001],%l3		! %l3 = 00000000000000d5
!	%l1 = 0000000022986170, Mem[0000000030101410] = 8cb61632
	stba	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = 70b61632
!	%l4 = 000000000000314f, Mem[0000000010101410] = 1d5dc36a7c0c22ff
	stxa	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000000000314f
!	Mem[0000000010041400] = 70619822, %l6 = 0000000080464f31
	ldstuba	[%i1+%g0]0x88,%l6	! %l6 = 0000000000000022
!	Mem[0000000010001400] = 985d0000 12e2bae1 ffd78ece 13da3ae7
!	%f16 = 985d693f 75159c91 028a361c 00000000
!	%f20 = 5132c76b 0000003d 2a050980 373b9740
!	%f24 = 66228fc3 00a8af4f ddeece79 80000000
!	%f28 = 3216b68c 3785cc0d 80000000 00000000
	stda	%f16,[%i0+%g0]ASI_BLK_PL	! Block Store to 0000000010001400
!	%l0 = ffb7893c, %l1 = 22986170, Mem[0000000030181400] = ff000000 91734052
	stda	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = ffb7893c 22986170
!	%l6 = 0000000000000022, Mem[0000000010181410] = ddeece7980000000
	stxa	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000000000000022

p0_label_34:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 5132c76b bb4000ff, %l0 = ffb7893c, %l1 = 22986170
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 00000000bb4000ff 000000005132c76b
!	Mem[0000000030041408] = 6ac7ea3c, %l4 = 000000000000314f
	lduha	[%i1+%o4]0x89,%l4	! %l4 = 000000000000ea3c
!	Mem[0000000030141400] = 80464f31, %l6 = 0000000000000022
	lduha	[%i5+%g0]0x89,%l6	! %l6 = 0000000000004f31
!	Mem[0000000030081410] = 0022a4b76ab48b5d, %l0 = 00000000bb4000ff
	ldxa	[%i2+%o5]0x89,%l0	! %l0 = 0022a4b76ab48b5d
!	Mem[0000000030181410] = 7ead1b46, %l1 = 000000005132c76b
	lduha	[%i6+%o5]0x89,%l1	! %l1 = 0000000000001b46
!	Mem[0000000010081400] = 392b4a4d, %l0 = 0022a4b76ab48b5d
	lduha	[%i2+%g0]0x80,%l0	! %l0 = 000000000000392b
!	Mem[0000000010101400] = b93b9740, %l4 = 000000000000ea3c
	ldswa	[%i4+%g0]0x80,%l4	! %l4 = ffffffffb93b9740
	membar	#Sync			! Added by membar checker (6)
!	Mem[000000001000140c] = 1c368a02, %f3  = 9a2a8b40
	ld	[%i0+0x00c],%f3 	! %f3 = 1c368a02
!	Mem[0000000030081400] = 3f6954c7, %l5 = 0000000000000073
	ldsba	[%i2+%g0]0x89,%l5	! %l5 = ffffffffffffffc7
!	Mem[0000000010101408] = a8010000, %l1 = 0000000000001b46
	ldsba	[%i4+%o4]0x80,%l1	! %l1 = ffffffffffffffa8

p0_label_35:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 75159c91, %l0 = 000000000000392b
	swapa	[%i0+%g0]0x88,%l0	! %l0 = 0000000075159c91
!	Mem[0000000010001400] = 2b3900003f695d98, %l6 = 0000000000004f31, %l5 = ffffffffffffffc7
	casxa	[%i0]0x80,%l6,%l5	! %l5 = 2b3900003f695d98
!	Mem[0000000030101410] = 3216b670, %l6 = 0000000000004f31
	swapa	[%i4+%o5]0x89,%l6	! %l6 = 000000003216b670
!	%l5 = 2b3900003f695d98, Mem[0000000030101408] = 5779685b000000ff
	stxa	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 2b3900003f695d98
!	%l3 = 00000000000000d5, Mem[00000000100c1408] = ffb7893c
	stwa	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000d5
!	Mem[0000000010141421] = 66228fc3, %l2 = ffffffffffb79644
	ldstuba	[%i5+0x021]%asi,%l2	! %l2 = 0000000000000022
!	Mem[00000000100c1408] = d5000000, %l3 = 00000000000000d5
	swapa	[%i3+%o4]0x88,%l3	! %l3 = 00000000d5000000
!	%l7 = 00000000919c1575, Mem[0000000010001408] = 00000000
	stwa	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = 919c1575
!	%f26 = ddeece79, Mem[0000000010141410] = 770000ff
	sta	%f26,[%i5+%o5]0x88	! Mem[0000000010141410] = ddeece79
!	%l4 = b93b9740, %l5 = 3f695d98, Mem[0000000010041400] = 706198ff c1b5444e
	stda	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = b93b9740 3f695d98

p0_label_36:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 314f4680 75159c91 028a361c 00000000
!	Mem[0000000030141410] = 00000000 00000000 2a050980 373b9740
!	Mem[0000000030141420] = 66228fc3 00a8af4f 2819d016 5db0382c
!	Mem[0000000030141430] = 3216b68c 3785cc0d 16962968 3d0a02d9
	ldda	[%i5+%g0]ASI_BLK_SL,%f16	! Block Load from 0000000030141400
!	%l3 = 00000000d5000000, imm = fffffffffffff6fc, %l4 = ffffffffb93b9740
	and	%l3,-0x904,%l4		! %l4 = 00000000d5000000
!	Mem[0000000030081410] = 6ab48b5d, %l0 = 0000000075159c91
	lduha	[%i2+%o5]0x89,%l0	! %l0 = 0000000000008b5d
!	Mem[0000000010181408] = 9725ca24, %l4 = 00000000d5000000
	ldsba	[%i6+%o4]0x80,%l4	! %l4 = ffffffffffffff97
!	Mem[0000000030101400] = 77985cff, %l7 = 00000000919c1575
	lduba	[%i4+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1400] = 3cdc6230, %l0 = 0000000000008b5d
	lduha	[%i3+%g0]0x80,%l0	! %l0 = 0000000000003cdc
!	Mem[0000000030181408] = b7a42200, %l6 = 000000003216b670
	lduwa	[%i6+%o4]0x81,%l6	! %l6 = 00000000b7a42200
!	Mem[0000000010001408] = 919c1575, %l1 = ffffffffffffffa8
	ldsba	[%i0+%o4]0x80,%l1	! %l1 = ffffffffffffff91
!	Mem[0000000030141408] = 028a361c00000000, %f2  = 3ceac76a 1c368a02
	ldda	[%i5+%o4]0x81,%f2 	! %f2  = 028a361c 00000000
!	Mem[0000000030181410] = 7ead1b46, %l5 = 2b3900003f695d98
	lduba	[%i6+%o5]0x89,%l5	! %l5 = 0000000000000046

p0_label_37:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000046, Mem[00000000100c1408] = d5000000000031ff
	stxa	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000000046
!	%l4 = ffffffffffffff97, Mem[0000000010141400] = 00000000
	stwa	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = ffffff97
!	%f6  = 43f05d0f, %f1  = 0022a4ff, %f13 = 1c368a02
	fadds	%f6 ,%f1 ,%f13		! tt=0x22, %l0 = 0000000000003cfe
!	Mem[0000000010101410] = 0000314f, %l3 = 00000000d5000000
	swapa	[%i4+%o5]0x88,%l3	! %l3 = 000000000000314f
!	%l0 = 0000000000003cfe, Mem[0000000010081408] = 0dcc8537
	stha	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 3cfe8537
!	Mem[0000000030101410] = 00004f31, %l5 = 0000000000000046
	swapa	[%i4+%o5]0x89,%l5	! %l5 = 0000000000004f31
!	Mem[0000000010081408] = 3cfe8537, %l0 = 0000000000003cfe
	swapa	[%i2+%o4]0x80,%l0	! %l0 = 000000003cfe8537
!	%f5  = b7a42200, Mem[0000000030041410] = 6ab48b5d
	sta	%f5 ,[%i1+%o5]0x89	! Mem[0000000030041410] = b7a42200
!	%l3 = 000000000000314f, Mem[0000000010001400] = 0000392b
	stwa	%l3,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000314f
!	%l5 = 0000000000004f31, Mem[0000000010141408] = 000000001c368aff
	stxa	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000004f31

p0_label_38:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 770000000000cc0d, %f12 = 3d5c9877 1c368a02
	ldda	[%i3+%o5]0x88,%f12	! %f12 = 77000000 0000cc0d
!	Mem[0000000030081408] = 3ceac76a, %l2 = 0000000000000022
	lduha	[%i2+%o4]0x81,%l2	! %l2 = 0000000000003cea
!	Mem[000000001004141c] = 78708063, %l6 = 00000000b7a42200, %asi = 80
	ldsba	[%i1+0x01c]%asi,%l6	! %l6 = 0000000000000078
!	Mem[0000000030181408] = 178d6d66 0022a4b7, %l2 = 00003cea, %l3 = 0000314f
	ldda	[%i6+%o4]0x89,%l2	! %l2 = 000000000022a4b7 00000000178d6d66
!	Mem[0000000010181420] = 5e9e9ae87dbbbe59, %f4  = 5d8bb46a b7a42200, %asi = 80
	ldda	[%i6+0x020]%asi,%f4 	! %f4  = 5e9e9ae8 7dbbbe59
!	Mem[0000000010041400] = 40973bb9, %l5 = 0000000000004f31
	lduwa	[%i1+%g0]0x80,%l5	! %l5 = 0000000040973bb9
!	Mem[0000000010001400] = 985d693f 0000314f, %l6 = 00000078, %l7 = 000000ff
	ldda	[%i0+%g0]0x88,%l6	! %l6 = 000000000000314f 00000000985d693f
!	Mem[00000000300c1410] = 4c83d251, %f10 = ffc4787f
	lda	[%i3+%o5]0x89,%f10	! %f10 = 4c83d251
!	Mem[0000000021800181] = 309c4d90, %l0 = 000000003cfe8537, %asi = 80
	lduba	[%o3+0x181]%asi,%l0	! %l0 = 000000000000009c
!	Mem[0000000010141408] = 314f000000000000, %f4  = 5e9e9ae8 7dbbbe59
	ldda	[%i5+%o4]0x80,%f4 	! %f4  = 314f0000 00000000

p0_label_39:
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000009c, Mem[0000000010041410] = f0222800
	stha	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = f022009c
!	Mem[0000000010101410] = 000000d5, %l5 = 0000000040973bb9
	swapa	[%i4+%o5]0x80,%l5	! %l5 = 00000000000000d5
!	%l4 = ffffffffffffff97, Mem[0000000020800041] = ff2f4c10
	stb	%l4,[%o1+0x041]		! Mem[0000000020800040] = ff974c10
!	%l4 = ffffffffffffff97, Mem[00000000211c0000] = ffff5a40, %asi = 80
	stba	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 97ff5a40
!	%l3 = 00000000178d6d66, Mem[0000000010081400] = 392b4a4d
	stw	%l3,[%i2+%g0]		! Mem[0000000010081400] = 178d6d66
!	%l3 = 00000000178d6d66, Mem[0000000010181420] = 5e9e9ae8, %asi = 80
	stha	%l3,[%i6+0x020]%asi	! Mem[0000000010181420] = 6d669ae8
!	Mem[0000000030041408] = 3ceac76a, %l1 = ffffffffffffff91
	ldstuba	[%i1+%o4]0x81,%l1	! %l1 = 000000000000003c
!	Mem[0000000030181400] = 3c89b7ff, %l2 = 000000000022a4b7
	ldstuba	[%i6+%g0]0x81,%l2	! %l2 = 000000000000003c
!	%l0 = 000000000000009c, Mem[0000000010041400] = b93b9740
	stwa	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000009c
!	Mem[0000000020800000] = 64efb9e0, %l0 = 000000000000009c
	ldstuba	[%o1+0x000]%asi,%l0	! %l0 = 0000000000000064

p0_label_40:
!	Starting 10 instruction Load Burst
!	%l2 = 000000000000003c, Mem[0000000010001400] = 0000314f
	stwa	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000003c
!	Mem[0000000010181400] = 3f695d98, %l1 = 000000000000003c
	lduwa	[%i6+%g0]0x88,%l1	! %l1 = 000000003f695d98
!	Mem[0000000010081430] = 61a342d4, %l5 = 00000000000000d5, %asi = 80
	ldswa	[%i2+0x030]%asi,%l5	! %l5 = 0000000061a342d4
!	Mem[0000000010141418] = 2a050980373b9740, %l0 = 0000000000000064, %asi = 80
	ldxa	[%i5+0x018]%asi,%l0	! %l0 = 2a050980373b9740
!	Mem[000000001018140c] = 8d573fd7, %l7 = 00000000985d693f
	ldsw	[%i6+0x00c],%l7		! %l7 = ffffffff8d573fd7
!	Mem[0000000010101408] = a8010000 5c38d58e, %l0 = 373b9740, %l1 = 3f695d98
	ldd	[%i4+%o4],%l0		! %l0 = 00000000a8010000 000000005c38d58e
!	Mem[0000000010001408] = 919c1575, %l6 = 000000000000314f
	ldsba	[%i0+%o4]0x80,%l6	! %l6 = ffffffffffffff91
!	Mem[0000000010181400] = 985d693f63716c21, %f26 = 2c38b05d 16d01928
	ldda	[%i6+%g0]0x80,%f26	! %f26 = 985d693f 63716c21
!	Mem[0000000030101408] = 3f695d98, %l3 = 00000000178d6d66
	ldsba	[%i4+%o4]0x89,%l3	! %l3 = ffffffffffffff98
!	Code Fragment 4, seed = 883091
p0_fragment_6:
!	%l0 = 00000000a8010000
	setx	0xb060df67a1b8ae8e,%g7,%l0 ! %l0 = b060df67a1b8ae8e
!	%l1 = 000000005c38d58e
	setx	0xfb8c94c2e4e73639,%g7,%l1 ! %l1 = fb8c94c2e4e73639
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b060df67a1b8ae8e
	setx	0x9119dedd4928c9f4,%g7,%l0 ! %l0 = 9119dedd4928c9f4
!	%l1 = fb8c94c2e4e73639
	setx	0x3282e8f0c80cecbf,%g7,%l1 ! %l1 = 3282e8f0c80cecbf
p0_fragment_6_end:

p0_label_41:
!	Starting 10 instruction Store Burst
!	%l1 = 3282e8f0c80cecbf, Mem[0000000010101408] = 000001a8
	stwa	%l1,[%i4+%o4]0x88	! Mem[0000000010101408] = c80cecbf
!	Mem[0000000010101410] = b93b9740, %l7 = ffffffff8d573fd7
	ldstuba	[%i4+%o5]0x88,%l7	! %l7 = 0000000000000040
!	Mem[00000000201c0000] = a801a3b0, %l5 = 0000000061a342d4
	ldstuba	[%o0+0x000]%asi,%l5	! %l5 = 00000000000000a8
!	Mem[0000000030081408] = 3ceac76a, %l7 = 0000000000000040
	swapa	[%i2+%o4]0x81,%l7	! %l7 = 000000003ceac76a
!	%l5 = 00000000000000a8, %l3 = ffffffffffffff98, %l4 = ffffffffffffff97
	udivx	%l5,%l3,%l4		! %l4 = 0000000000000000
!	%l6 = ffffff91, %l7 = 3ceac76a, Mem[00000000300c1410] = 4c83d251 ad76c54e
	stda	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffffff91 3ceac76a
!	%l1 = 3282e8f0c80cecbf, Mem[0000000030101408] = 985d693f
	stba	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = bf5d693f
!	%l3 = ffffffffffffff98, Mem[00000000100c1419] = 2c70213a, %asi = 80
	stba	%l3,[%i3+0x019]%asi	! Mem[00000000100c1418] = 2c98213a
!	Mem[0000000010181410] = 00000022, %l5 = 00000000000000a8
	ldstuba	[%i6+%o5]0x88,%l5	! %l5 = 0000000000000022
!	%l0 = 4928c9f4, %l1 = c80cecbf, Mem[0000000010141410] = ddeece79 3d000000
	stda	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 4928c9f4 c80cecbf

p0_label_42:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 985d693f63716c21, %l5 = 0000000000000022
	ldx	[%i6+%g0],%l5		! %l5 = 985d693f63716c21
!	Mem[0000000010041410] = 9c0022f0 8cb61632, %l6 = ffffff91, %l7 = 3ceac76a
	ldda	[%i1+%o5]0x80,%l6	! %l6 = 000000009c0022f0 000000008cb61632
!	Mem[0000000030181408] = b7a42200, %f18 = 00000000
	lda	[%i6+%o4]0x81,%f18	! %f18 = b7a42200
!	Mem[0000000010141400] = 97ffffff, %l7 = 000000008cb61632
	ldsba	[%i5+%g0]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010001410] = 3d000000 6bc73251, %l0 = 4928c9f4, %l1 = c80cecbf
	ldd	[%i0+%o5],%l0		! %l0 = 000000003d000000 000000006bc73251
!	Mem[00000000100c1400] = 3cdc6230, %l0 = 000000003d000000
	ldsha	[%i3+%g0]0x80,%l0	! %l0 = 0000000000003cdc
!	Mem[0000000010181428] = 1d7929b9, %l7 = ffffffffffffffff, %asi = 80
	lduha	[%i6+0x028]%asi,%l7	! %l7 = 0000000000001d79
!	Mem[0000000010041400] = 0000009c, %l7 = 0000000000001d79
	lduwa	[%i1+%g0]0x88,%l7	! %l7 = 000000000000009c
!	Mem[0000000010181400] = 985d693f63716c21, %f24 = 4fafa800 c38f2266, %asi = 80
	ldda	[%i6+0x000]%asi,%f24	! %f24 = 985d693f 63716c21
!	Mem[00000000300c1410] = ffffff91, %l3 = ffffffffffffff98
	ldsha	[%i3+%o5]0x89,%l3	! %l3 = ffffffffffffff91

p0_label_43:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 00003cfe, %l0 = 0000000000003cdc
	swapa	[%i2+%o4]0x80,%l0	! %l0 = 0000000000003cfe
!	%f8  = 9725ca24, %f26 = 985d693f, %f9  = 3e295957
	fmuls	%f8 ,%f26,%f9 		! %f9  = 00000000
!	%l6 = 9c0022f0, %l7 = 0000009c, Mem[0000000010101408] = bfec0cc8 5c38d58e
	std	%l6,[%i4+%o4]		! Mem[0000000010101408] = 9c0022f0 0000009c
!	Code Fragment 4, seed = 633075
p0_fragment_7:
!	%l0 = 0000000000003cfe
	setx	0xc49dc75a9604938e,%g7,%l0 ! %l0 = c49dc75a9604938e
!	%l1 = 000000006bc73251
	setx	0x4b4a2c9281120b39,%g7,%l1 ! %l1 = 4b4a2c9281120b39
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c49dc75a9604938e
	setx	0xd61bdaeda5bf8ef4,%g7,%l0 ! %l0 = d61bdaeda5bf8ef4
!	%l1 = 4b4a2c9281120b39
	setx	0x0ca1b4bf5c0ca1bf,%g7,%l1 ! %l1 = 0ca1b4bf5c0ca1bf
p0_fragment_7_end:
!	Mem[0000000010081408] = dc3c0000, %l6 = 000000009c0022f0
	ldstuba	[%i2+%o4]0x88,%l6	! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010001410] = 3d0000006bc73251
	stxa	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000000
!	Mem[0000000010141410] = f4c92849, %l5 = 985d693f63716c21
	ldstuba	[%i5+%o5]0x80,%l5	! %l5 = 00000000000000f4
!	%l2 = 000000000000003c, Mem[0000000010081418] = 4b439fda
	stw	%l2,[%i2+0x018]		! Mem[0000000010081418] = 0000003c
!	%l0 = d61bdaeda5bf8ef4, Mem[0000000030041400] = c754693f
	stwa	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = a5bf8ef4
!	%l2 = 000000000000003c, Mem[0000000030041408] = 6ac7eaff
	stwa	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000003c

p0_label_44:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141418] = 2a050980, %l7 = 000000000000009c, %asi = 80
	lduha	[%i5+0x018]%asi,%l7	! %l7 = 0000000000002a05
!	Code Fragment 3, seed = 214445
p0_fragment_8:
!	%l0 = d61bdaeda5bf8ef4
	setx	0x214db1abf6d387be,%g7,%l0 ! %l0 = 214db1abf6d387be
!	%l1 = 0ca1b4bf5c0ca1bf
	setx	0xb7016a516ae68869,%g7,%l1 ! %l1 = b7016a516ae68869
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 214db1abf6d387be
	setx	0x3350c61c5f174524,%g7,%l0 ! %l0 = 3350c61c5f174524
!	%l1 = b7016a516ae68869
	setx	0xb6856a2d78b640ef,%g7,%l1 ! %l1 = b6856a2d78b640ef
p0_fragment_8_end:
!	Mem[0000000010041410] = 9c0022f0, %l3 = ffffffffffffff91
	ldsha	[%i1+%o5]0x80,%l3	! %l3 = ffffffffffff9c00
!	Mem[0000000030101410] = 00000046, %f20 = 00000000
	lda	[%i4+%o5]0x89,%f20	! %f20 = 00000046
!	Mem[0000000010041408] = ffa422003f6954c7, %f8  = 9725ca24 00000000
	ldda	[%i1+%o4]0x80,%f8 	! %f8  = ffa42200 3f6954c7
!	Mem[00000000100c1408] = 0000000000000046, %l6 = 0000000000000000
	ldxa	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000046
!	Mem[0000000010041408] = c754693f0022a4ff, %f6  = 43f05d0f da9f434b
	ldda	[%i1+%o4]0x88,%f6 	! %f6  = c754693f 0022a4ff
!	Mem[0000000021800000] = 0a76e470, %l7 = 0000000000002a05
	ldsh	[%o3+%g0],%l7		! %l7 = 0000000000000a76
!	Mem[0000000010041400] = 3f695d980000009c, %l7 = 0000000000000a76
	ldxa	[%i1+%g0]0x88,%l7	! %l7 = 3f695d980000009c
!	Mem[00000000300c1408] = 000000ff, %l7 = 3f695d980000009c
	lduha	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000000

p0_label_45:
!	Starting 10 instruction Store Burst
!	%l2 = 000000000000003c, Mem[0000000010081400] = 178d6d66
	stba	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 3c8d6d66
!	Mem[0000000030041400] = f48ebfa5, %l6 = 0000000000000046
	swapa	[%i1+%g0]0x89,%l6	! %l6 = 00000000f48ebfa5
!	Mem[0000000010041400] = 9c000000, %l5 = 00000000000000f4
	ldstuba	[%i1+%g0]0x80,%l5	! %l5 = 000000000000009c
!	%l5 = 000000000000009c, Mem[0000000010081410] = 43f05d0fda9f434b
	stxa	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000000000009c
!	%l7 = 0000000000000000, Mem[0000000030101408] = 3f695dbf
	stwa	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	Mem[0000000030101410] = 00000046, %l1 = b6856a2d78b640ef
	ldstuba	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000046
!	Mem[00000000100c1400] = 3cdc6230, %l2 = 000000000000003c
	ldstuba	[%i3+%g0]0x80,%l2	! %l2 = 000000000000003c
!	%f18 = b7a42200, Mem[00000000100c1414] = 00000077
	st	%f18,[%i3+0x014]	! Mem[00000000100c1414] = b7a42200
!	%l1 = 0000000000000046, Mem[0000000030081410] = 6ab48b5d
	stba	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = 6ab48b46
!	%l7 = 0000000000000000, Mem[00000000211c0000] = 97ff5a40, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00005a40

p0_label_46:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = dd278d48000000ff, %f12 = 77000000 0000cc0d
	ldda	[%i4+%o5]0x89,%f12	! %f12 = dd278d48 000000ff
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000030041400] = 46000000 0022a4ff 3c000000 9a2a8b40
!	Mem[0000000030041410] = 0022a4b7 b7a42200 43f05d0f da9f434b
!	Mem[0000000030041420] = 9725ca24 3e295957 ffc4787f 51d2834c
!	Mem[0000000030041430] = 3d5c9877 1c368a02 00000000 00000000
	ldda	[%i1+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030041400
!	Mem[0000000030141408] = 00000000 1c368a02, %l0 = 5f174524, %l1 = 00000046
	ldda	[%i5+%o4]0x89,%l0	! %l0 = 000000001c368a02 0000000000000000
!	Mem[0000000030001408] = 1d7929b9, %f17 = 80464f31
	lda	[%i0+%o4]0x81,%f17	! %f17 = 1d7929b9
!	Mem[0000000010001408] = 028a361c75159c91, %f16 = 919c1575 1d7929b9
	ldda	[%i0+%o4]0x88,%f16	! %f16 = 028a361c 75159c91
!	Mem[0000000030041408] = 0000003c, %f26 = 985d693f
	lda	[%i1+%o4]0x89,%f26	! %f26 = 0000003c
!	Mem[0000000030181410] = 4dd12118 7ead1b46, %l2 = 0000003c, %l3 = ffff9c00
	ldda	[%i6+%o5]0x89,%l2	! %l2 = 000000007ead1b46 000000004dd12118
!	Mem[0000000010141410] = ffc92849, %l1 = 0000000000000000
	lduba	[%i5+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1410] = 91ffffff, %l7 = 0000000000000000
	lduba	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000091
!	Mem[0000000010181438] = 4e697b324237673b, %f18 = b7a42200 1c368a02
	ldd	[%i6+0x038],%f18	! %f18 = 4e697b32 4237673b

p0_label_47:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 468bb46a, %l0 = 000000001c368a02
	swapa	[%i2+%o5]0x81,%l0	! %l0 = 00000000468bb46a
!	%f18 = 4e697b32 4237673b, Mem[00000000300c1408] = ff000000 3216b68c
	stda	%f18,[%i3+%o4]0x89	! Mem[00000000300c1408] = 4e697b32 4237673b
!	%f6  = 43f05d0f da9f434b, Mem[0000000030001400] = ff0040bb 6bc73251
	stda	%f6 ,[%i0+%g0]0x81	! Mem[0000000030001400] = 43f05d0f da9f434b
!	%f8  = 9725ca24 3e295957, Mem[0000000010081410] = 00000000 9c000000
	stda	%f8 ,[%i2+%o5]0x88	! Mem[0000000010081410] = 9725ca24 3e295957
!	%l7 = 0000000000000091, Mem[0000000030181400] = ffb789ff
	stha	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = ffb70091
!	Mem[0000000010081410] = 3e295957, %l7 = 0000000000000091
	ldstuba	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000057
!	Mem[0000000010141408] = 00004f31, %l2 = 000000007ead1b46
	ldstuba	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000031
!	Mem[0000000030101410] = 000000ff, %l7 = 0000000000000057
	ldstuba	[%i4+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	%f4  = 0022a4b7, %f22 = 40973b37
	fsqrts	%f4 ,%f22		! tt=0x22, %l0 = 00000000468bb48c
!	Mem[0000000010041410] = 9c0022f0, %l7 = 00000000000000ff
	swapa	[%i1+%o5]0x80,%l7	! %l7 = 000000009c0022f0

p0_label_48:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181435] = 01ff7695, %l7 = 000000009c0022f0
	ldsb	[%i6+0x035],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000020800000] = ffefb9e0, %l7 = ffffffffffffffff
	ldsh	[%o1+%g0],%l7		! %l7 = ffffffffffffffef
!	Mem[0000000010001410] = 00000000, %l5 = 000000000000009c
	lduha	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141400] = 80464f31, %l6 = 00000000f48ebfa5
	lduba	[%i5+%g0]0x89,%l6	! %l6 = 0000000000000031
!	Mem[0000000010181408] = 24ca2597, %l2 = 0000000000000031
	lduba	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000097
!	Mem[0000000010081434] = 1d99e315, %l5 = 0000000000000000
	ldsw	[%i2+0x034],%l5		! %l5 = 000000001d99e315
!	Mem[0000000030141408] = 028a361c, %l0 = 00000000468bb48c
	lduwa	[%i5+%o4]0x81,%l0	! %l0 = 00000000028a361c
!	%l1 = 00000000000000ff, imm = fffffffffffffa66, %l4 = 0000000000000000
	add	%l1,-0x59a,%l4		! %l4 = fffffffffffffb65
!	Mem[00000000100c1408] = 00000000 00000046, %l6 = 00000031, %l7 = ffffffef
	ldda	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000 0000000000000046
!	Mem[0000000010181408] = 24ca2597, %l1 = 00000000000000ff
	lduwa	[%i6+%o4]0x88,%l1	! %l1 = 0000000024ca2597

p0_label_49:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000030141400] = 314f4680
	stba	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 004f4680
!	Mem[00000000300c1400] = 7eb89860, %l1 = 0000000024ca2597
	swapa	[%i3+%g0]0x81,%l1	! %l1 = 000000007eb89860
!	Mem[0000000010081400] = 3c8d6d66 76c6e0a1 ff003cdc 00000400
!	%f0  = 46000000 0022a4ff 3c000000 9a2a8b40
!	%f4  = 0022a4b7 b7a42200 43f05d0f da9f434b
!	%f8  = 9725ca24 3e295957 ffc4787f 51d2834c
!	%f12 = 3d5c9877 1c368a02 00000000 00000000
	stda	%f0 ,[%i2+%g0]ASI_COMMIT_P	! Block Store to 0000000010081400
!	Mem[0000000010181400] = 3f695d98, %l0 = 00000000028a361c
	swapa	[%i6+%g0]0x88,%l0	! %l0 = 000000003f695d98
!	Mem[0000000020800041] = ff974c10, %l7 = 0000000000000046
	ldstub	[%o1+0x041],%l7		! %l7 = 0000000000000097
!	%f31 = 68299616, %f15 = 00000000, %f26 = 0000003c 63716c21
	fsmuld	%f31,%f15,%f26		! %f26 = 00000000 00000000
!	Mem[000000001000141c] = 8009052a, %l2 = 0000000000000097, %asi = 80
	swapa	[%i0+0x01c]%asi,%l2	! %l2 = 000000008009052a
!	Mem[0000000010181404] = 63716c21, %l1 = 000000007eb89860
	swap	[%i6+0x004],%l1		! %l1 = 0000000063716c21
!	Mem[0000000030041408] = 3c000000, %l7 = 0000000000000097
	swapa	[%i1+%o4]0x81,%l7	! %l7 = 000000003c000000
!	Mem[00000000100c1408] = 00000000, %l3 = 000000004dd12118
	swap	[%i3+%o4],%l3		! %l3 = 0000000000000000

p0_label_50:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ff000000, %l1 = 0000000063716c21
	ldsha	[%i4+%o5]0x81,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000030101400] = ff5c9877, %l4 = fffffffffffffb65
	lduba	[%i4+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001410] = 00000000, %l4 = 00000000000000ff
	ldsba	[%i0+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101410] = dd278d48000000ff, %f26 = 00000000 00000000
	ldda	[%i4+%o5]0x89,%f26	! %f26 = dd278d48 000000ff
!	Mem[00000000211c0000] = 00005a40, %l3 = 0000000000000000
	lduh	[%o2+%g0],%l3		! %l3 = 0000000000000000
!	Mem[0000000030141400] = 80464f00, %l3 = 0000000000000000
	lduwa	[%i5+%g0]0x89,%l3	! %l3 = 0000000080464f00
!	Mem[0000000010181400] = 028a361c, %l7 = 000000003c000000
	ldsha	[%i6+%g0]0x88,%l7	! %l7 = 000000000000361c
!	Mem[0000000030081410] = 1c368a02, %f23 = 8009052a
	lda	[%i2+%o5]0x81,%f23	! %f23 = 1c368a02
!	Mem[0000000021800180] = 309c4d90, %l0 = 000000003f695d98
	lduh	[%o3+0x180],%l0		! %l0 = 000000000000309c
!	Mem[00000000211c0000] = 00005a40, %l5 = 000000001d99e315, %asi = 80
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000

p0_label_51:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010041410] = ff000000
	stwa	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
	membar	#Sync			! Added by membar checker (8)
!	%l7 = 000000000000361c, Mem[0000000010081424] = 3e295957
	stw	%l7,[%i2+0x024]		! Mem[0000000010081424] = 0000361c
!	Mem[0000000010101400] = b93b9740, %l6 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l6	! %l6 = 00000000b93b9740
!	Mem[0000000021800000] = 0a76e470, %l2 = 000000008009052a
	ldstuba	[%o3+0x000]%asi,%l2	! %l2 = 000000000000000a
!	Mem[00000000100c1410] = 0000cc0d, %l0 = 000000000000309c
	ldstuba	[%i3+%o5]0x88,%l0	! %l0 = 000000000000000d
!	Mem[0000000020800001] = ffefb9e0, %l1 = ffffffffffffff00
	ldstub	[%o1+0x001],%l1		! %l1 = 00000000000000ef
!	Mem[0000000030181410] = 461bad7e, %l2 = 000000000000000a
	ldstuba	[%i6+%o5]0x81,%l2	! %l2 = 0000000000000046
!	%f24 = 985d693f, %f3  = 9a2a8b40
	fcmps	%fcc2,%f24,%f3 		! %fcc2 = 2
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030141400] = 004f4680 75159c91
	stda	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000 00000000
!	%l6 = 00000000b93b9740, Mem[000000001004142c] = 000073d5
	sth	%l6,[%i1+0x02c]		! Mem[000000001004142c] = 974073d5

p0_label_52:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101418] = c3ee5cca, %l2 = 0000000000000046, %asi = 80
	ldswa	[%i4+0x018]%asi,%l2	! %l2 = ffffffffc3ee5cca
!	Mem[00000000300c1408] = 3b673742, %l5 = 0000000000000000
	ldswa	[%i3+%o4]0x81,%l5	! %l5 = 000000003b673742
!	Mem[0000000010101408] = 9c0022f0 0000009c, %l6 = b93b9740, %l7 = 0000361c
	ldda	[%i4+%o4]0x80,%l6	! %l6 = 000000009c0022f0 000000000000009c
!	Mem[0000000030001410] = 2c38b05d, %l4 = 0000000000000000
	ldswa	[%i0+%o5]0x89,%l4	! %l4 = 000000002c38b05d
!	Mem[0000000010141429] = 2819d016, %l1 = 00000000000000ef, %asi = 80
	ldsba	[%i5+0x029]%asi,%l1	! %l1 = 0000000000000019
!	Mem[0000000030001408] = b929791d, %l7 = 000000000000009c
	ldsba	[%i0+%o4]0x89,%l7	! %l7 = 000000000000001d
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000030141400] = 00000000 00000000 028a361c 00000000
!	Mem[0000000030141410] = 00000000 00000000 2a050980 373b9740
!	Mem[0000000030141420] = 66228fc3 00a8af4f 2819d016 5db0382c
!	Mem[0000000030141430] = 3216b68c 3785cc0d 16962968 3d0a02d9
	ldda	[%i5+%g0]ASI_BLK_SL,%f16	! Block Load from 0000000030141400
!	Mem[00000000300c1410] = 91ffffff, %l0 = 000000000000000d
	lduha	[%i3+%o5]0x81,%l0	! %l0 = 00000000000091ff
!	Mem[0000000010101408] = 9c0022f0, %l5 = 000000003b673742
	lduha	[%i4+%o4]0x80,%l5	! %l5 = 0000000000009c00
!	Mem[00000000201c0001] = ff01a3b0, %l3 = 0000000080464f00
	ldsb	[%o0+0x001],%l3		! %l3 = 0000000000000001

p0_label_53:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = ff000000, %l2 = ffffffffc3ee5cca
	ldstuba	[%i4+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	%l0 = 00000000000091ff, Mem[0000000030181400] = ffb70091
	stwa	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 000091ff
!	%l0 = 000091ff, %l1 = 00000019, Mem[0000000010041400] = ff000000 985d693f
	stda	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 000091ff 00000019
!	%l0 = 00000000000091ff, Mem[0000000030101400] = ff5c9877
	stha	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 91ff9877
!	%f18 = 00000000 1c368a02, Mem[0000000010101410] = ff973bb9 00000000
	stda	%f18,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000 1c368a02
!	Mem[00000000100c1408] = 1821d14d, %l4 = 000000002c38b05d
	swapa	[%i3+%o4]0x88,%l4	! %l4 = 000000001821d14d
!	%l6 = 000000009c0022f0, Mem[0000000021800181] = 309c4d90
	stb	%l6,[%o3+0x181]		! Mem[0000000021800180] = 30f04d90
!	%f24 = 4fafa800 c38f2266, Mem[0000000030001400] = 0f5df043 4b439fda
	stda	%f24,[%i0+%g0]0x89	! Mem[0000000030001400] = 4fafa800 c38f2266
!	Mem[0000000010101408] = f022009c, %l4 = 000000001821d14d
	swapa	[%i4+%o4]0x88,%l4	! %l4 = 00000000f022009c
!	%l2 = 000000ff, %l3 = 00000001, Mem[0000000010141408] = ff4f0000 00000000
	stda	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000ff 00000001

p0_label_54:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 3c000000, %f4  = 0022a4b7
	lda	[%i0+%g0]0x80,%f4 	! %f4 = 3c000000
!	Mem[0000000030181400] = 000091ff, %l1 = 0000000000000019
	ldswa	[%i6+%g0]0x89,%l1	! %l1 = 00000000000091ff
!	Mem[0000000030101410] = ff000000, %l3 = 0000000000000001
	lduwa	[%i4+%o5]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[00000000300c1400] = 9725ca24, %l5 = 0000000000009c00
	lduba	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000024
!	Mem[0000000030041410] = b7a42200, %l1 = 00000000000091ff
	lduwa	[%i1+%o5]0x89,%l1	! %l1 = 00000000b7a42200
!	Mem[00000000300c1410] = 3ceac76affffff91, %l4 = 00000000f022009c
	ldxa	[%i3+%o5]0x89,%l4	! %l4 = 3ceac76affffff91
!	Mem[0000000010101410] = 00000000, %l0 = 00000000000091ff
	lduwa	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001420] = 4fafa800c38f2266, %l5 = 0000000000000024
	ldx	[%i0+0x020],%l5		! %l5 = 4fafa800c38f2266
!	Mem[0000000030101408] = 00000000, %f10 = ffc4787f
	lda	[%i4+%o4]0x89,%f10	! %f10 = 00000000
!	Mem[0000000010141410] = ffc92849, %l4 = 3ceac76affffff91
	ldswa	[%i5+%o5]0x80,%l4	! %l4 = ffffffffffc92849

p0_label_55:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001404] = 3f695d98, %l2 = 00000000000000ff
	swap	[%i0+0x004],%l2		! %l2 = 000000003f695d98
!	%l3 = 00000000ff000000, Mem[0000000010081400] = 46000000
	stba	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	%f0  = 46000000 0022a4ff, Mem[0000000010101428] = 3af1e2ba cfeb6eef, %asi = 80
	stda	%f0 ,[%i4+0x028]%asi	! Mem[0000000010101428] = 46000000 0022a4ff
!	Mem[0000000030001408] = b929791d, %l0 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l0	! %l0 = 000000000000001d
!	Mem[00000000100c1410] = ffcc0000, %l6 = 000000009c0022f0
	ldstuba	[%i3+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041410] = 00000000, %l3 = 00000000ff000000
	swapa	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141434] = 3785cc0d, %l5 = 4fafa800c38f2266
	ldstub	[%i5+0x034],%l5		! %l5 = 0000000000000037
!	Mem[0000000030001408] = ff7929b9, %l7 = 000000000000001d
	ldstuba	[%i0+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000010181430] = 1ec86c5401ff7695
	stx	%l7,[%i6+0x030]		! Mem[0000000010181430] = 00000000000000ff
!	%f0  = 46000000 0022a4ff, Mem[0000000010141400] = 97ffffff 80000000
	stda	%f0 ,[%i5+%g0]0x88	! Mem[0000000010141400] = 46000000 0022a4ff

p0_label_56:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff000000, %f11 = 51d2834c
	lda	[%i1+%o5]0x88,%f11	! %f11 = ff000000
!	Mem[000000001010142f] = 0022a4ff, %l2 = 000000003f695d98
	ldsb	[%i4+0x02f],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000030181410] = ff1bad7e 1821d14d, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i6+%o5]0x81,%l6	! %l6 = 00000000ff1bad7e 000000001821d14d
!	Mem[0000000010181400] = 028a361c, %l0 = 000000000000001d
	ldsha	[%i6+%g0]0x88,%l0	! %l0 = 000000000000361c
!	Mem[0000000030001400] = 66228fc3, %l4 = ffffffffffc92849
	lduwa	[%i0+%g0]0x81,%l4	! %l4 = 0000000066228fc3
!	Mem[0000000030001410] = 0dcc85372c38b05d, %f6  = 43f05d0f da9f434b
	ldda	[%i0+%o5]0x89,%f6 	! %f6  = 0dcc8537 2c38b05d
!	%l6 = 00000000ff1bad7e, imm = fffffffffffffb31, %l3 = 0000000000000000
	xnor	%l6,-0x4cf,%l3		! %l3 = 00000000ff1ba9b0
!	Mem[0000000030081408] = 408b2a9a40000000, %l2 = ffffffffffffffff
	ldxa	[%i2+%o4]0x89,%l2	! %l2 = 408b2a9a40000000
!	Mem[0000000030141400] = 0000000000000000, %l3 = 00000000ff1ba9b0
	ldxa	[%i5+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101410] = 000000001c368a02, %l0 = 000000000000361c
	ldxa	[%i4+%o5]0x80,%l0	! %l0 = 000000001c368a02

p0_label_57:
!	Starting 10 instruction Store Burst
!	%f12 = 3d5c9877 1c368a02, Mem[0000000030041408] = 97000000 408b2a9a
	stda	%f12,[%i1+%o4]0x89	! Mem[0000000030041408] = 3d5c9877 1c368a02
!	Mem[000000001010143c] = 7fb5df7b, %l0 = 000000001c368a02, %asi = 80
	swapa	[%i4+0x03c]%asi,%l0	! %l0 = 000000007fb5df7b
!	Code Fragment 4, seed = 284265
p0_fragment_9:
!	%l0 = 000000007fb5df7b
	setx	0xd5cee1eba8e47dde,%g7,%l0 ! %l0 = d5cee1eba8e47dde
!	%l1 = 00000000b7a42200
	setx	0x3fb065f88bf82489,%g7,%l1 ! %l1 = 3fb065f88bf82489
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = d5cee1eba8e47dde
	setx	0x4535587c48c0a744,%g7,%l0 ! %l0 = 4535587c48c0a744
!	%l1 = 3fb065f88bf82489
	setx	0x6c7cdc097764890f,%g7,%l1 ! %l1 = 6c7cdc097764890f
p0_fragment_9_end:
!	%l6 = ff1bad7e, %l7 = 1821d14d, Mem[0000000010101408] = 1821d14d 9c000000
	stda	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = ff1bad7e 1821d14d
!	%l5 = 0000000000000037, Mem[000000001018142e] = eff7ab89
	sth	%l5,[%i6+0x02e]		! Mem[000000001018142c] = eff70037
!	Mem[0000000030141410] = 00000000, %l7 = 000000001821d14d
	swapa	[%i5+%o5]0x89,%l7	! %l7 = 0000000000000000
!	%l0 = 4535587c48c0a744, Mem[0000000030001400] = c38f2266
	stwa	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 48c0a744
!	%l6 = 00000000ff1bad7e, Mem[0000000030181408] = b7a42200
	stha	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = ad7e2200
!	%l2 = 408b2a9a40000000, Mem[00000000100c1410] = ffcc0000
	stha	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	%f24 = 4fafa800, Mem[0000000010041410] = 000000ff
	sta	%f24,[%i1+%o5]0x80	! Mem[0000000010041410] = 4fafa800

p0_label_58:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 9a12895c00000000, %l5 = 0000000000000037
	ldxa	[%i4+%g0]0x88,%l5	! %l5 = 9a12895c00000000
!	Mem[0000000030001410] = 2c38b05d, %l0 = 4535587c48c0a744
	ldswa	[%i0+%o5]0x89,%l0	! %l0 = 000000002c38b05d
!	Mem[00000000300c1400] = 9725ca24, %l4 = 0000000066228fc3
	lduwa	[%i3+%g0]0x89,%l4	! %l4 = 000000009725ca24
!	Mem[0000000021800081] = 70d56cd0, %l2 = 408b2a9a40000000
	ldub	[%o3+0x081],%l2		! %l2 = 00000000000000d5
!	Mem[0000000030041408] = 3d5c9877 1c368a02, %l6 = ff1bad7e, %l7 = 00000000
	ldda	[%i1+%o4]0x89,%l6	! %l6 = 000000001c368a02 000000003d5c9877
!	Mem[00000000300c1408] = 4e697b32 4237673b, %l4 = 9725ca24, %l5 = 00000000
	ldda	[%i3+%o4]0x89,%l4	! %l4 = 000000004237673b 000000004e697b32
!	%l0 = 000000002c38b05d, imm = fffffffffffffc89, %l0 = 000000002c38b05d
	andn	%l0,-0x377,%l0		! %l0 = 0000000000000054
!	Mem[0000000010041408] = ffa422003f6954c7, %f14 = 00000000 00000000
	ldda	[%i1+%o4]0x80,%f14	! %f14 = ffa42200 3f6954c7
!	Mem[0000000010001410] = 00000000, %l1 = 6c7cdc097764890f
	lduwa	[%i0+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181410] = 000000ff, %l0 = 0000000000000054
	lduba	[%i6+%o5]0x88,%l0	! %l0 = 00000000000000ff

p0_label_59:
!	Starting 10 instruction Store Burst
!	%l4 = 4237673b, %l5 = 4e697b32, Mem[0000000030081410] = 028a361c 0022a4b7
	stda	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 4237673b 4e697b32
!	Mem[0000000021800101] = 8719e530, %l6 = 000000001c368a02
	ldstuba	[%o3+0x101]%asi,%l6	! %l6 = 0000000000000019
!	Mem[0000000030041410] = b7a42200, %l0 = 00000000000000ff
	swapa	[%i1+%o5]0x89,%l0	! %l0 = 00000000b7a42200
!	%l2 = 00000000000000d5, Mem[0000000030101408] = 00000000
	stha	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000d5
!	Mem[0000000030141408] = 028a361c, %l0 = 00000000b7a42200
	swapa	[%i5+%o4]0x81,%l0	! %l0 = 00000000028a361c
!	%l4 = 000000004237673b, Mem[0000000010001404] = 000000ff
	stw	%l4,[%i0+0x004]		! Mem[0000000010001404] = 4237673b
!	%l1 = 0000000000000000, Mem[0000000030041410] = ff000000
	stwa	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	%l6 = 00000019, %l7 = 3d5c9877, Mem[0000000010101408] = 7ead1bff 4dd12118
	stda	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000019 3d5c9877
!	Mem[0000000020800000] = ffffb9e0, %l3 = 0000000000000000
	ldstuba	[%o1+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	%l0 = 028a361c, %l1 = 00000000, Mem[00000000100c1408] = 2c38b05d 46000000
	stda	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 028a361c 00000000

p0_label_60:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00a8af4f, %l3 = 00000000000000ff
	ldswa	[%i1+%o5]0x88,%l3	! %l3 = 0000000000a8af4f
!	Mem[0000000010141428] = 2819d016, %l0 = 00000000028a361c
	ldsw	[%i5+0x028],%l0		! %l0 = 000000002819d016
!	Mem[0000000010081410] = b7a42200, %l1 = 0000000000000000
	ldsba	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[000000001018140c] = 8d573fd7, %f20 = 00000000
	lda	[%i6+0x00c]%asi,%f20	! %f20 = 8d573fd7
!	Mem[0000000010041420] = 5695e508, %l1 = 0000000000000000, %asi = 80
	lduwa	[%i1+0x020]%asi,%l1	! %l1 = 000000005695e508
!	Mem[0000000030141410] = 00000000 1821d14d, %l4 = 4237673b, %l5 = 4e697b32
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 000000001821d14d 0000000000000000
!	Mem[000000001008141c] = da9f434b, %l5 = 0000000000000000
	ldsw	[%i2+0x01c],%l5		! %l5 = ffffffffda9f434b
!	Mem[00000000300c1408] = 4e697b324237673b, %f8  = 9725ca24 3e295957
	ldda	[%i3+%o4]0x89,%f8 	! %f8  = 4e697b32 4237673b
!	Mem[0000000010101400] = 00000000 5c89129a, %l0 = 2819d016, %l1 = 5695e508
	ldda	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000 000000005c89129a
!	Mem[00000000211c0000] = 00005a40, %l0 = 0000000000000000, %asi = 80
	ldsba	[%o2+0x000]%asi,%l0	! %l0 = 0000000000000000

p0_label_61:
!	Starting 10 instruction Store Burst
!	%f8  = 4e697b32 4237673b, Mem[0000000010041410] = 00a8af4f 3216b68c
	stda	%f8 ,[%i1+%o5]0x88	! Mem[0000000010041410] = 4e697b32 4237673b
!	%f10 = 00000000 ff000000, Mem[0000000030101400] = 91ff9877 1c368a02
	stda	%f10,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000 ff000000
!	%f4  = 3c000000 b7a42200, %l1 = 000000005c89129a
!	Mem[0000000030001410] = 5db0382c3785cc0d
	add	%i0,0x010,%g1
	stda	%f4,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030001410] = 5db0382c0000003c
!	Mem[0000000010041408] = 0022a4ff, %l7 = 000000003d5c9877
	swapa	[%i1+%o4]0x88,%l7	! %l7 = 000000000022a4ff
!	Mem[0000000010181408] = 24ca2597, %l7 = 000000000022a4ff
	swapa	[%i6+%o4]0x88,%l7	! %l7 = 0000000024ca2597
!	%l5 = ffffffffda9f434b, Mem[0000000010001428] = 00000080
	stw	%l5,[%i0+0x028]		! Mem[0000000010001428] = da9f434b
!	%l1 = 000000005c89129a, Mem[0000000010081400] = 000000000022a4ff
	stxa	%l1,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000005c89129a
!	Mem[0000000030181410] = ff1bad7e, %l5 = 00000000da9f434b
	swapa	[%i6+%o5]0x81,%l5	! %l5 = 00000000ff1bad7e
!	%l5 = 00000000ff1bad7e, Mem[0000000010141408] = 000000ff00000001
	stxa	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000ff1bad7e
!	%f12 = 3d5c9877 1c368a02, Mem[0000000010141400] = ffa42200 00000046
	stda	%f12,[%i5+%g0]0x80	! Mem[0000000010141400] = 3d5c9877 1c368a02

p0_label_62:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800000] = ff76e470, %l7 = 0000000024ca2597, %asi = 80
	ldsba	[%o3+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030101400] = 00000000, %l4 = 000000001821d14d
	ldsba	[%i4+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000020800041] = ffff4c10, %l0 = 0000000000000000
	ldsb	[%o1+0x041],%l0		! %l0 = ffffffffffffffff
!	Mem[00000000100c1400] = ffdc6230 45613b81, %l6 = 00000019, %l7 = ffffffff, %asi = 80
	ldda	[%i3+0x000]%asi,%l6	! %l6 = 00000000ffdc6230 0000000045613b81
!	Mem[0000000010081410] = 0022a4b7, %l3 = 0000000000a8af4f, %asi = 80
	ldswa	[%i2+0x010]%asi,%l3	! %l3 = 000000000022a4b7
!	Mem[0000000010001408] = 919c1575, %l7 = 0000000045613b81
	ldsba	[%i0+%o4]0x80,%l7	! %l7 = ffffffffffffff91
!	Mem[0000000010181408] = 0022a4ff, %l7 = ffffffffffffff91
	lduwa	[%i6+%o4]0x88,%l7	! %l7 = 000000000022a4ff
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000030181400] = ff910000 70619822 ad7e2200 666d8d17
!	Mem[0000000030181410] = da9f434b 1821d14d 20ef580a 6bc1e9b3
!	Mem[0000000030181420] = 6f579718 01dd6bc9 66f7cb16 734b390f
!	Mem[0000000030181430] = 3a505f84 5310df05 563a3be2 71acf72b
	ldda	[%i6+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030181400
!	Mem[0000000010181400] = 1c368a02, %l3 = 000000000022a4b7
	lduwa	[%i6+%g0]0x80,%l3	! %l3 = 000000001c368a02
!	Mem[0000000010141400] = 3d5c9877, %l5 = 00000000ff1bad7e
	ldsba	[%i5+%g0]0x80,%l5	! %l5 = 000000000000003d

p0_label_63:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 3b673742, %l1 = 000000005c89129a
	ldstuba	[%i3+%o4]0x81,%l1	! %l1 = 000000000000003b
!	Mem[0000000030181410] = 4b439fda, %l0 = ffffffffffffffff
	ldstuba	[%i6+%o5]0x89,%l0	! %l0 = 00000000000000da
!	Mem[0000000010101430] = 7517f7940d23ccd5, %l4 = 0000000000000000, %l5 = 000000000000003d
	add	%i4,0x30,%g1
	casxa	[%g1]0x80,%l4,%l5	! %l5 = 7517f7940d23ccd5
!	%f30 = 563a3be2, Mem[0000000030141408] = b7a42200
	sta	%f30,[%i5+%o4]0x81	! Mem[0000000030141408] = 563a3be2
!	%f14 = ffa42200 3f6954c7, Mem[0000000010141438] = 80000000 00000000
	std	%f14,[%i5+0x038]	! Mem[0000000010141438] = ffa42200 3f6954c7
!	%l0 = 00000000000000da, Mem[0000000030141410] = 4dd1211800000000
	stxa	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000000000da
!	%l7 = 000000000022a4ff, Mem[00000000201c0000] = ff01a3b0
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = a4ffa3b0
	membar	#Sync			! Added by membar checker (11)
!	%f15 = 3f6954c7, Mem[0000000030181400] = ff910000
	sta	%f15,[%i6+%g0]0x81	! Mem[0000000030181400] = 3f6954c7
!	%f11 = ff000000, Mem[0000000010181400] = 028a361c
	sta	%f11,[%i6+%g0]0x88	! Mem[0000000010181400] = ff000000
!	Mem[0000000030041408] = 028a361c, %l6 = 00000000ffdc6230
	ldstuba	[%i1+%o4]0x81,%l6	! %l6 = 0000000000000002

p0_label_64:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 3c000000, %l6 = 0000000000000002
	lduha	[%i2+%o4]0x80,%l6	! %l6 = 0000000000003c00
!	%l1 = 000000000000003b, %l0 = 00000000000000da, %l4 = 0000000000000000
	addc	%l1,%l0,%l4		! %l4 = 0000000000000115
!	Mem[0000000030001410] = 5db0382c, %l2 = 00000000000000d5
	lduwa	[%i0+%o5]0x81,%l2	! %l2 = 000000005db0382c
!	%l7 = 000000000022a4ff, %l1 = 000000000000003b, %l6 = 0000000000003c00
	sdivx	%l7,%l1,%l6		! %l6 = 0000000000009652
!	Mem[0000000030101408] = 000000d5, %l5 = 7517f7940d23ccd5
	ldswa	[%i4+%o4]0x89,%l5	! %l5 = 00000000000000d5
!	%l4 = 0000000000000115, imm = fffffffffffffb50, %l7 = 000000000022a4ff
	orn	%l4,-0x4b0,%l7		! %l7 = 00000000000005bf
!	Mem[000000001000142d] = 79ceeedd, %l5 = 00000000000000d5, %asi = 80
	lduba	[%i0+0x02d]%asi,%l5	! %l5 = 00000000000000ce
!	%l7 = 00000000000005bf, %l1 = 000000000000003b, %l1 = 000000000000003b
	sdivx	%l7,%l1,%l1		! %l1 = 0000000000000018
!	Mem[0000000030081408] = 00000040, %f18 = ad7e2200
	lda	[%i2+%o4]0x81,%f18	! %f18 = 00000040
!	Mem[00000000211c0000] = 00005a40, %l7 = 00000000000005bf
	ldub	[%o2+%g0],%l7		! %l7 = 0000000000000000

p0_label_65:
!	Starting 10 instruction Store Burst
!	Code Fragment 4, seed = 186293
p0_fragment_10:
!	%l0 = 00000000000000da
	setx	0x413c30a7542f7f7e,%g7,%l0 ! %l0 = 413c30a7542f7f7e
!	%l1 = 0000000000000018
	setx	0x54cfe1be72abf429,%g7,%l1 ! %l1 = 54cfe1be72abf429
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 413c30a7542f7f7e
	setx	0x62bbec6a591be4e4,%g7,%l0 ! %l0 = 62bbec6a591be4e4
!	%l1 = 54cfe1be72abf429
	setx	0x85c0522627e3d4af,%g7,%l1 ! %l1 = 85c0522627e3d4af
p0_fragment_10_end:
!	%f18 = 00000040 666d8d17, %l3 = 000000001c368a02
!	Mem[0000000010001428] = da9f434b79ceeedd
	add	%i0,0x028,%g1
	stda	%f18,[%g1+%l3]ASI_PST8_P ! Mem[0000000010001428] = da9f434b79ce8ddd
!	Mem[000000001004141c] = 78708063, %l4 = 00000115, %l2 = 5db0382c
	add	%i1,0x1c,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 0000000078708063
!	%l0 = 591be4e4, %l1 = 27e3d4af, Mem[0000000030101408] = d5000000 0000392b
	stda	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 591be4e4 27e3d4af
!	%l3 = 000000001c368a02, Mem[00000000218001c0] = 78283bc0
	sth	%l3,[%o3+0x1c0]		! Mem[00000000218001c0] = 8a023bc0
!	%l1 = 85c0522627e3d4af, Mem[0000000010041400] = 19000000ff910000
	stxa	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 85c0522627e3d4af
!	%l4 = 0000000000000115, Mem[0000000010101400] = 00000000
	stba	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 15000000
!	%f12 = 3d5c9877 1c368a02, Mem[0000000010181400] = ff000000 6098b87e
	stda	%f12,[%i6+%g0]0x88	! Mem[0000000010181400] = 3d5c9877 1c368a02
!	%f14 = ffa42200 3f6954c7, %l7 = 0000000000000000
!	Mem[0000000010081438] = 0000000000000000
	add	%i2,0x038,%g1
	stda	%f14,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010081438] = 0000000000000000
!	%f2  = 3c000000 9a2a8b40, %l1 = 85c0522627e3d4af
!	Mem[0000000030001438] = 655ee8505f568feb
	add	%i0,0x038,%g1
	stda	%f2,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030001438] = 408b2a9a0000003c

p0_label_66:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000b7a42200, %l7 = 0000000000000000
	ldxa	[%i1+%o5]0x81,%l7	! %l7 = 00000000b7a42200
!	Mem[0000000030101408] = afd4e327 e4e41b59, %l4 = 00000115, %l5 = 000000ce
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 00000000e4e41b59 00000000afd4e327
!	Mem[0000000010001400] = 3c000000 4237673b, %l6 = 00009652, %l7 = b7a42200
	ldda	[%i0+%g0]0x80,%l6	! %l6 = 000000003c000000 000000004237673b
!	Mem[0000000010001400] = 3c000000 4237673b, %l4 = e4e41b59, %l5 = afd4e327
	ldda	[%i0+%g0]0x80,%l4	! %l4 = 000000003c000000 000000004237673b
!	Mem[0000000030101408] = e4e41b59, %l7 = 000000004237673b
	lduba	[%i4+%o4]0x89,%l7	! %l7 = 0000000000000059
!	Mem[00000000201c0001] = a4ffa3b0, %l1 = 85c0522627e3d4af, %asi = 80
	lduba	[%o0+0x001]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041410] = 3b673742, %l0 = 62bbec6a591be4e4
	lduba	[%i1+%o5]0x80,%l0	! %l0 = 000000000000003b
!	Mem[0000000030001400] = 44a7c048 00a8af4f, %l6 = 3c000000, %l7 = 00000059
	ldda	[%i0+%g0]0x81,%l6	! %l6 = 0000000044a7c048 0000000000a8af4f
!	%f22 = 20ef580a, %f25 = 01dd6bc9, %f29 = 5310df05
	fsubs	%f22,%f25,%f29		! %f29 = 20ef580a
!	Mem[0000000030141410] = 00000000000000da, %l0 = 000000000000003b
	ldxa	[%i5+%o5]0x81,%l0	! %l0 = 00000000000000da

p0_label_67:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000da, Mem[0000000010101400] = 15000000
	stha	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 00da0000
!	%f30 = 563a3be2 71acf72b, %l5 = 000000004237673b
!	Mem[0000000030181418] = 20ef580a6bc1e9b3
	add	%i6,0x018,%g1
	stda	%f30,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030181418] = 2bf75871e23be9b3
!	Mem[0000000030041410] = 0022a4b7 00000000, %l2 = 78708063, %l3 = 1c368a02
	ldda	[%i1+%o5]0x89,%l2	! %l2 = 0000000000000000 000000000022a4b7
!	%f19 = 666d8d17, %f0  = 46000000, %f12 = 3d5c9877
	fsubs	%f19,%f0 ,%f12		! %f12 = 666d8d17
!	Mem[0000000010041400] = afd4e3272652c085, %f14 = ffa42200 3f6954c7
	ldda	[%i1+%g0]0x80,%f14	! %f14 = afd4e327 2652c085
!	%l0 = 00000000000000da, Mem[0000000010041400] = afd4e327
	stwa	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000da
!	Mem[0000000030101400] = 00000000, %l1 = 00000000000000ff
	swapa	[%i4+%g0]0x89,%l1	! %l1 = 0000000000000000
!	%l4 = 000000003c000000, Mem[00000000100c1420] = 17725dc81d7929b9, %asi = 80
	stxa	%l4,[%i3+0x020]%asi	! Mem[00000000100c1420] = 000000003c000000
!	Mem[0000000030181408] = 00227ead, %l7 = 0000000000a8af4f
	swapa	[%i6+%o4]0x89,%l7	! %l7 = 0000000000227ead
!	%f29 = 20ef580a, Mem[0000000030001400] = 48c0a744
	sta	%f29,[%i0+%g0]0x89	! Mem[0000000030001400] = 20ef580a

p0_label_68:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 91ffffff, %l0 = 00000000000000da
	lduwa	[%i3+%o5]0x81,%l0	! %l0 = 0000000091ffffff
!	Mem[0000000030101410] = dd278d48 000000ff, %l2 = 00000000, %l3 = 0022a4b7
	ldda	[%i4+%o5]0x89,%l2	! %l2 = 00000000000000ff 00000000dd278d48
!	Mem[00000000300c1400] = 24ca2597, %l0 = 0000000091ffffff
	lduwa	[%i3+%g0]0x81,%l0	! %l0 = 0000000024ca2597
!	Mem[0000000030081410] = 3b673742327b694e, %l3 = 00000000dd278d48
	ldxa	[%i2+%o5]0x81,%l3	! %l3 = 3b673742327b694e
!	Mem[0000000030081408] = 40000000, %l7 = 0000000000227ead
	lduba	[%i2+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041400] = 000000da, %l3 = 3b673742327b694e, %asi = 80
	lduwa	[%i1+0x000]%asi,%l3	! %l3 = 00000000000000da
!	Mem[0000000030041400] = 46000000, %l6 = 0000000044a7c048
	ldswa	[%i1+%g0]0x81,%l6	! %l6 = 0000000046000000
!	Mem[0000000030001400] = 4fafa80020ef580a, %f20 = da9f434b 1821d14d
	ldda	[%i0+%g0]0x89,%f20	! %f20 = 4fafa800 20ef580a
!	Mem[0000000030101408] = 591be4e4, %l6 = 0000000046000000
	ldsha	[%i4+%o4]0x81,%l6	! %l6 = 000000000000591b
!	Mem[0000000030001400] = 0a58ef20, %l5 = 000000004237673b
	lduha	[%i0+%g0]0x81,%l5	! %l5 = 0000000000000a58

p0_label_69:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = ffc92849, %l6 = 000000000000591b
	swapa	[%i5+%o5]0x80,%l6	! %l6 = 00000000ffc92849
!	Mem[00000000300c1400] = 9725ca24, %l6 = 00000000ffc92849
	ldstuba	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000024
!	%l4 = 000000003c000000, Mem[0000000010141410] = 1b590000
	stba	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 1b590000
!	Mem[0000000030081400] = c754693f, %l5 = 0000000000000a58
	ldstuba	[%i2+%g0]0x81,%l5	! %l5 = 00000000000000c7
!	%l7 = 0000000000000000, Mem[0000000010041408] = 3d5c9877
	stwa	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	%f25 = 01dd6bc9, Mem[0000000030001400] = 20ef580a
	sta	%f25,[%i0+%g0]0x89	! Mem[0000000030001400] = 01dd6bc9
!	Mem[0000000010101410] = 00000000, %l1 = 0000000000000000
	swapa	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%l5 = 00000000000000c7, Mem[0000000030101400] = 000000ff000000ff
	stxa	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000000000c7
!	%l2 = 000000ff, %l3 = 000000da, Mem[0000000010001400] = 3c000000 4237673b
	std	%l2,[%i0+%g0]		! Mem[0000000010001400] = 000000ff 000000da
!	%l6 = 00000024, %l7 = 00000000, Mem[0000000010001418] = 40973b37 00000097, %asi = 80
	stda	%l6,[%i0+0x018]%asi	! Mem[0000000010001418] = 00000024 00000000

p0_label_70:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 423767ff, %l0 = 0000000024ca2597
	lduwa	[%i3+%o4]0x89,%l0	! %l0 = 00000000423767ff
!	Mem[00000000100c1416] = b7a42200, %l0 = 00000000423767ff, %asi = 80
	ldsha	[%i3+0x016]%asi,%l0	! %l0 = 0000000000002200
!	Mem[0000000010001408] = 028a361c 75159c91, %l0 = 00002200, %l1 = 00000000
	ldda	[%i0+%o4]0x88,%l0	! %l0 = 0000000075159c91 00000000028a361c
!	Mem[00000000100c1400] = ffdc6230, %l4 = 000000003c000000
	ldsba	[%i3+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	%f19 = 666d8d17, %f4  = 3c000000
	fcmps	%fcc2,%f19,%f4 		! %fcc2 = 2
!	Mem[0000000020800000] = ffffb9e0, %l4 = ffffffffffffffff, %asi = 80
	ldsha	[%o1+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141418] = 2a050980, %l6 = 0000000000000024, %asi = 80
	ldswa	[%i5+0x018]%asi,%l6	! %l6 = 000000002a050980
!	Mem[0000000010141410] = 0000591b, %l7 = 0000000000000000
	ldsha	[%i5+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800040] = ffff4c10, %l1 = 00000000028a361c, %asi = 80
	lduha	[%o1+0x040]%asi,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010101418] = c3ee5cca32e6e003, %l3 = 00000000000000da
	ldx	[%i4+0x018],%l3		! %l3 = c3ee5cca32e6e003

p0_label_71:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000c7, %l0 = 0000000075159c91, %l2 = 00000000000000ff
	add	%l5,%l0,%l2		! %l2 = 0000000075159d58
!	%f11 = ff000000, Mem[0000000030141400] = 00000000
	sta	%f11,[%i5+%g0]0x81	! Mem[0000000030141400] = ff000000
!	Mem[0000000010081410] = 0022a4b7, %l0 = 0000000075159c91
	ldstuba	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	%l6 = 000000002a050980, Mem[0000000010141408] = 00000000
	stha	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000980
!	%l5 = 00000000000000c7, Mem[00000000100c1400] = ffdc6230
	stha	%l5,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00c76230
!	Mem[00000000300c1410] = 91ffffff, %l2 = 0000000075159d58
	ldstuba	[%i3+%o5]0x81,%l2	! %l2 = 0000000000000091
!	Mem[0000000010101400] = 00da0000, %l5 = 00000000000000c7
	swapa	[%i4+%g0]0x80,%l5	! %l5 = 0000000000da0000
!	%l5 = 0000000000da0000, Mem[0000000030101410] = 000000ff
	stwa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 00da0000
!	Mem[00000000100c1414] = b7a42200, %l1 = 0000ffff, %l0 = 00000000
	add	%i3,0x14,%g1
	casa	[%g1]0x80,%l1,%l0	! %l0 = 00000000b7a42200
!	%l6 = 000000002a050980, Mem[00000000218001c1] = 8a023bc0
	stb	%l6,[%o3+0x1c1]		! Mem[00000000218001c0] = 8a803bc0

p0_label_72:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ff000000, %l4 = ffffffffffffffff
	ldsba	[%i5+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030141410] = 00000000, %f30 = 563a3be2
	lda	[%i5+%o5]0x89,%f30	! %f30 = 00000000
!	Mem[0000000010081408] = 3c000000 9a2a8b40, %l6 = 2a050980, %l7 = 00000000
	ldda	[%i2+%o4]0x80,%l6	! %l6 = 000000003c000000 000000009a2a8b40
!	Mem[00000000300c1410] = ffffffff, %l1 = 000000000000ffff
	ldsha	[%i3+%o5]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041400] = 000000da, %l1 = ffffffffffffffff
	lduha	[%i1+%g0]0x80,%l1	! %l1 = 0000000000000000
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000030141400] = ff000000 00000000 563a3be2 00000000
!	Mem[0000000030141410] = 00000000 000000da 2a050980 373b9740
!	Mem[0000000030141420] = 66228fc3 00a8af4f 2819d016 5db0382c
!	Mem[0000000030141430] = 3216b68c 3785cc0d 16962968 3d0a02d9
	ldda	[%i5+%g0]ASI_BLK_AIUS,%f0 	! Block Load from 0000000030141400
!	Mem[0000000030081400] = 3f6954ff, %l6 = 000000003c000000
	lduha	[%i2+%g0]0x89,%l6	! %l6 = 00000000000054ff
!	Mem[0000000030141408] = e23b3a56, %l1 = 0000000000000000
	ldswa	[%i5+%o4]0x89,%l1	! %l1 = ffffffffe23b3a56
!	Mem[0000000030001408] = ff7929b9, %l2 = 0000000000000091
	lduba	[%i0+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141410] = 0000591b, %l5 = 0000000000da0000
	ldsha	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000

p0_label_73:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 00000000, %l4 = ffffffffffffffff
	ldstuba	[%i3+%o5]0x88,%l4	! %l4 = 0000000000000000
!	%l1 = ffffffffe23b3a56, Mem[00000000100c1404] = 45613b81, %asi = 80
	stwa	%l1,[%i3+0x004]%asi	! Mem[00000000100c1404] = e23b3a56
!	%l7 = 000000009a2a8b40, Mem[0000000010101400] = 000000c7
	stba	%l7,[%i4+%g0]0x80	! Mem[0000000010101400] = 400000c7
!	%l2 = 00000000000000ff, Mem[0000000010141400] = 77985c3d
	stba	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 77985cff
!	%l1 = ffffffffe23b3a56, Mem[0000000030181400] = 3f6954c770619822
	stxa	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = ffffffffe23b3a56
!	Mem[00000000201c0000] = a4ffa3b0, %l3 = c3ee5cca32e6e003
	ldstub	[%o0+%g0],%l3		! %l3 = 00000000000000a4
!	%l2 = 000000ff, %l3 = 000000a4, Mem[00000000100c1430] = 66022534 38fc3ff5, %asi = 80
	stda	%l2,[%i3+0x030]%asi	! Mem[00000000100c1430] = 000000ff 000000a4
!	%f0  = ff000000, Mem[0000000010101424] = 79168099
	st	%f0 ,[%i4+0x024]	! Mem[0000000010101424] = ff000000
!	%l4 = 0000000000000000, Mem[00000000100c1410] = ff000000b7a42200
	stxa	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000000000000000
!	%f22 = 20ef580a 6bc1e9b3, Mem[0000000010181408] = 0022a4ff d73f578d
	stda	%f22,[%i6+%o4]0x88	! Mem[0000000010181408] = 20ef580a 6bc1e9b3

p0_label_74:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ff7929b9, %l1 = ffffffffe23b3a56
	ldsha	[%i0+%o4]0x81,%l1	! %l1 = ffffffffffffff79
!	Mem[0000000010101428] = 46000000 0022a4ff, %l6 = 000054ff, %l7 = 9a2a8b40
	ldd	[%i4+0x028],%l6		! %l6 = 0000000046000000 000000000022a4ff
!	Mem[0000000010181408] = b3e9c16b, %l7 = 000000000022a4ff
	lduba	[%i6+%o4]0x80,%l7	! %l7 = 00000000000000b3
!	Mem[0000000030141400] = 000000ff, %l7 = 00000000000000b3
	ldsha	[%i5+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041410] = 4237673b, %l4 = 0000000000000000
	lduba	[%i1+%o5]0x88,%l4	! %l4 = 000000000000003b
!	Mem[0000000010101408] = 000000193d5c9877, %l2 = 00000000000000ff
	ldx	[%i4+%o4],%l2		! %l2 = 000000193d5c9877
!	Mem[0000000010041408] = 00000000, %l5 = 0000000000000000
	lduba	[%i1+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = 00000000 b7a42200, %l4 = 0000003b, %l5 = 00000000
	ldda	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000 00000000b7a42200
!	Mem[0000000010081410] = ff22a4b7, %l1 = ffffffffffffff79
	ldsba	[%i2+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030081408] = 40000000, %l1 = ffffffffffffffff
	lduwa	[%i2+%o4]0x89,%l1	! %l1 = 0000000040000000

p0_label_75:
!	Starting 10 instruction Store Burst
!	%l2 = 000000193d5c9877, Mem[0000000030041400] = 46000000
	stwa	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 3d5c9877
!	%f0  = ff000000 00000000, %l7 = 00000000000000ff
!	Mem[0000000010181438] = 4e697b324237673b
	add	%i6,0x038,%g1
	stda	%f0,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010181438] = 00000000000000ff
!	%f15 = 3d0a02d9, Mem[0000000010101430] = 7517f794
	sta	%f15,[%i4+0x030]%asi	! Mem[0000000010101430] = 3d0a02d9
!	Mem[0000000010181400] = 028a361c, %l6 = 0000000046000000
	swapa	[%i6+%g0]0x80,%l6	! %l6 = 00000000028a361c
!	%l4 = 00000000, %l5 = b7a42200, Mem[0000000010181400] = 00000046 3d5c9877
	stda	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000 b7a42200
!	Mem[0000000030081408] = 00000040, %l0 = 00000000b7a42200
	ldstuba	[%i2+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181408] = 4fafa800, %l7 = 00000000000000ff
	ldstuba	[%i6+%o4]0x81,%l7	! %l7 = 000000000000004f
!	%f13 = 3785cc0d, Mem[0000000030081400] = ff54693f
	sta	%f13,[%i2+%g0]0x81	! Mem[0000000030081400] = 3785cc0d
!	Mem[0000000010141414] = bfec0cc8, %l5 = 00000000b7a42200, %asi = 80
	swapa	[%i5+0x014]%asi,%l5	! %l5 = 00000000bfec0cc8
!	%l7 = 000000000000004f, imm = 0000000000000fe5, %l6 = 00000000028a361c
	addc	%l7,0xfe5,%l6		! %l6 = 0000000000001034

p0_label_76:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 4b439fff, %l4 = 0000000000000000
	lduha	[%i6+%o5]0x89,%l4	! %l4 = 0000000000009fff
!	Mem[0000000010001400] = 000000ff, %l1 = 0000000040000000
	lduwa	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[000000001004142e] = 974073d5, %l0 = 0000000000000000
	ldsh	[%i1+0x02e],%l0		! %l0 = 00000000000073d5
!	Mem[0000000010041410] = 3b673742327b694e, %f8  = 66228fc3 00a8af4f
	ldda	[%i1+%o5]0x80,%f8 	! %f8  = 3b673742 327b694e
!	Mem[00000000300c1410] = ffffffff, %l4 = 0000000000009fff
	lduwa	[%i3+%o5]0x81,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000030141408] = 563a3be2, %l2 = 000000193d5c9877
	lduba	[%i5+%o4]0x81,%l2	! %l2 = 0000000000000056
!	Mem[0000000010181428] = 1d7929b9eff70037, %f8  = 3b673742 327b694e
	ldd	[%i6+0x028],%f8 	! %f8  = 1d7929b9 eff70037
!	Mem[0000000010081410] = 0022a4b7b7a422ff, %f26 = 66f7cb16 734b390f
	ldda	[%i2+%o5]0x88,%f26	! %f26 = 0022a4b7 b7a422ff
!	Mem[00000000100c1410] = 00000000, %l2 = 0000000000000056
	ldswa	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l2 = 0000000000000000
	lduba	[%i1+%o5]0x89,%l2	! %l2 = 0000000000000000

p0_label_77:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 423767ff, %l4 = 00000000ffffffff
	ldstuba	[%i3+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001408] = b92979ff, %l0 = 00000000000073d5
	ldstuba	[%i0+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	%l3 = 00000000000000a4, Mem[00000000300c1408] = ff673742327b694e
	stxa	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000000000a4
!	%l0 = 00000000000000ff, Mem[0000000030041410] = 00000000
	stha	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 00ff0000
!	%l5 = 00000000bfec0cc8, Mem[0000000030181400] = ffffffff
	stba	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = ffffffc8
!	%l1 = 00000000000000ff, Mem[0000000030181400] = c8ffffff
	stwa	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000ff
!	%l5 = 00000000bfec0cc8, Mem[0000000010081408] = 3c000000
	stba	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = c8000000
!	Mem[0000000030081400] = 0dcc8537, %l3 = 00000000000000a4
	ldstuba	[%i2+%g0]0x89,%l3	! %l3 = 0000000000000037
!	%l5 = 00000000bfec0cc8, Mem[0000000010041410] = 3b673742
	stwa	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = bfec0cc8
!	%l5 = 00000000bfec0cc8, imm = 0000000000000222, %l6 = 0000000000001034
	orn	%l5,0x222,%l6		! %l6 = fffffffffffffddd

p0_label_78:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = b7a422ff, %l1 = 00000000000000ff
	ldswa	[%i2+%o5]0x88,%l1	! %l1 = ffffffffb7a422ff
!	Mem[0000000030001400] = c96bdd01, %f25 = 01dd6bc9
	lda	[%i0+%g0]0x81,%f25	! %f25 = c96bdd01
!	Mem[0000000010001400] = 000000ff, %l2 = 0000000000000000
	lduwa	[%i0+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141408] = 80090000, %l0 = 00000000000000ff
	ldsh	[%i5+%o4],%l0		! %l0 = ffffffffffff8009
!	Mem[0000000010101410] = 028a361c00000000, %l4 = 00000000000000ff
	ldxa	[%i4+%o5]0x88,%l4	! %l4 = 028a361c00000000
!	Mem[0000000010181400] = 00000000, %l7 = 000000000000004f
	ldsba	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041410] = 0000ff00, %l3 = 0000000000000037
	lduba	[%i1+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181408] = b3e9c16b, %f27 = b7a422ff
	lda	[%i6+%o4]0x80,%f27	! %f27 = b3e9c16b
!	Mem[0000000010041400] = 000000da, %f17 = 70619822
	lda	[%i1+%g0]0x80,%f17	! %f17 = 000000da
!	Mem[0000000010101420] = 518282ff, %l2 = 00000000000000ff, %asi = 80
	ldsha	[%i4+0x020]%asi,%l2	! %l2 = 0000000000005182

p0_label_79:
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffb7a422ff, Mem[0000000010101400] = c7000040
	stba	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = c70000ff
!	Code Fragment 4, seed = 229803
p0_fragment_11:
!	%l0 = ffffffffffff8009
	setx	0x0b2f7902ac0405ce,%g7,%l0 ! %l0 = 0b2f7902ac0405ce
!	%l1 = ffffffffb7a422ff
	setx	0x744c5ff64193e979,%g7,%l1 ! %l1 = 744c5ff64193e979
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0b2f7902ac0405ce
	setx	0x82164c710aa81934,%g7,%l0 ! %l0 = 82164c710aa81934
!	%l1 = 744c5ff64193e979
	setx	0x5d923e763f0c17ff,%g7,%l1 ! %l1 = 5d923e763f0c17ff
p0_fragment_11_end:
!	%l2 = 0000000000005182, Mem[0000000030081410] = 4237673b
	stha	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 42375182
!	%l7 = 0000000000000000, Mem[00000000300c1400] = ffca2597
	stha	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00002597
!	Mem[0000000010101414] = 1c368a02, %l4 = 028a361c00000000
	ldstuba	[%i4+0x014]%asi,%l4	! %l4 = 000000000000001c
!	Mem[0000000010181408] = b3e9c16b, %l0 = 82164c710aa81934
	ldstuba	[%i6+%o4]0x80,%l0	! %l0 = 00000000000000b3
!	Mem[0000000010041410] = bfec0cc8, %l6 = 00000000fffffddd
	swapa	[%i1+%o5]0x80,%l6	! %l6 = 00000000bfec0cc8
!	%l3 = 0000000000000000, Mem[0000000020800000] = ffffb9e0, %asi = 80
	stba	%l3,[%o1+0x000]%asi	! Mem[0000000020800000] = 00ffb9e0
!	Mem[0000000030081408] = 400000ff, %l4 = 000000000000001c
	swapa	[%i2+%o4]0x89,%l4	! %l4 = 00000000400000ff
!	Mem[0000000010001428] = da9f434b79ce8ddd, %l6 = 00000000bfec0cc8, %l7 = 0000000000000000
	add	%i0,0x28,%g1
	casxa	[%g1]0x80,%l6,%l7	! %l7 = da9f434b79ce8ddd

p0_label_80:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ff5c9877, %l4 = 00000000400000ff
	swapa	[%i5+%g0]0x80,%l4	! %l4 = 00000000ff5c9877
	membar	#Sync			! Added by membar checker (13)
!	Mem[0000000030181400] = 000000ff e23b3a56 ffafa800 666d8d17
!	Mem[0000000030181410] = ff9f434b 1821d14d 2bf75871 e23be9b3
!	Mem[0000000030181420] = 6f579718 01dd6bc9 66f7cb16 734b390f
!	Mem[0000000030181430] = 3a505f84 5310df05 563a3be2 71acf72b
	ldda	[%i6+%g0]ASI_BLK_AIUS,%f0 	! Block Load from 0000000030181400
!	Mem[0000000010081410] = b7a422ff, %l7 = da9f434b79ce8ddd
	lduba	[%i2+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101410] = 0000da00, %l4 = 00000000ff5c9877
	lduha	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001410] = 5db0382c, %f23 = 6bc1e9b3
	lda	[%i0+%o5]0x81,%f23	! %f23 = 5db0382c
!	Mem[0000000010101400] = ff0000c7 5c89129a 00000019 3d5c9877
!	Mem[0000000010101410] = 00000000 ff368a02 c3ee5cca 32e6e003
!	Mem[0000000010101420] = 518282ff ff000000 46000000 0022a4ff
!	Mem[0000000010101430] = 3d0a02d9 0d23ccd5 5db0382c 1c368a02
	ldda	[%i4+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010101400
!	Mem[0000000030181408] = ffafa800, %l7 = 00000000000000ff
	ldsha	[%i6+%o4]0x81,%l7	! %l7 = ffffffffffffffaf
!	Mem[0000000030101400] = c700000000000000, %l3 = 0000000000000000
	ldxa	[%i4+%g0]0x81,%l3	! %l3 = c700000000000000
!	Mem[00000000100c1408] = 028a361c, %l1 = 5d923e763f0c17ff
	lduba	[%i3+%o4]0x88,%l1	! %l1 = 000000000000001c
!	Mem[0000000030141408] = 00000000e23b3a56, %l5 = 00000000bfec0cc8
	ldxa	[%i5+%o4]0x89,%l5	! %l5 = 00000000e23b3a56

p0_label_81:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181424] = 7dbbbe59, %l5 = 00000000e23b3a56, %asi = 80
	swapa	[%i6+0x024]%asi,%l5	! %l5 = 000000007dbbbe59
!	%f19 = 3d5c9877, Mem[0000000030041410] = 0000ff00
	sta	%f19,[%i1+%o5]0x89	! Mem[0000000030041410] = 3d5c9877
!	%f17 = 5c89129a, Mem[0000000030001410] = 2c38b05d
	sta	%f17,[%i0+%o5]0x89	! Mem[0000000030001410] = 5c89129a
!	Mem[0000000030101400] = 000000c7, %l2 = 0000000000005182
	swapa	[%i4+%g0]0x89,%l2	! %l2 = 00000000000000c7
!	Mem[0000000010001400] = ff000000, %l5 = 000000007dbbbe59
	swapa	[%i0+%g0]0x88,%l5	! %l5 = 00000000ff000000
	membar	#Sync			! Added by membar checker (14)
!	%f20 = 00000000, Mem[0000000030181410] = 4b439fff
	sta	%f20,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	%l0 = 00000000000000b3, Mem[0000000030101410] = dd278d4800da0000
	stxa	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000000000b3
!	%f20 = 00000000, Mem[00000000100c1408] = 028a361c
	sta	%f20,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	%f12 = 3a505f84 5310df05, Mem[00000000100c1400] = 3062c700 563a3be2
	stda	%f12,[%i3+%g0]0x88	! Mem[00000000100c1400] = 3a505f84 5310df05
!	%f2  = ffafa800, %f16 = ff0000c7, %f3  = 666d8d17
	fadds	%f2 ,%f16,%f3 		! %f3  = ffefa800

p0_label_82:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff00000000000000, %f28 = 3d0a02d9 0d23ccd5
	ldda	[%i6+%o5]0x80,%f28	! %f28 = ff000000 00000000
!	Mem[0000000021800100] = 87ffe530, %l6 = 00000000bfec0cc8, %asi = 80
	lduba	[%o3+0x100]%asi,%l6	! %l6 = 0000000000000087
!	Mem[0000000010181410] = ff000000 00000000, %l4 = 00000000, %l5 = ff000000
	ldda	[%i6+%o5]0x80,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Mem[0000000010101410] = 028a36ff00000000, %f26 = 46000000 0022a4ff
	ldda	[%i4+%o5]0x88,%f26	! %f26 = 028a36ff 00000000
!	Mem[0000000030081408] = 408b2a9a0000001c, %l0 = 00000000000000b3
	ldxa	[%i2+%o4]0x89,%l0	! %l0 = 408b2a9a0000001c
!	Mem[0000000030001400] = c96bdd0100a8af4f, %f0  = 000000ff e23b3a56
	ldda	[%i0+%g0]0x81,%f0 	! %f0  = c96bdd01 00a8af4f
!	Mem[0000000010081400] = 000000005c89129a, %f30 = 5db0382c 1c368a02
	ldda	[%i2+%g0]0x80,%f30	! %f30 = 00000000 5c89129a
!	Mem[0000000010181400] = 00000000, %l4 = 00000000ff000000
	ldsha	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1408] = 00000000000000a4, %f22 = c3ee5cca 32e6e003
	ldda	[%i3+%o4]0x81,%f22	! %f22 = 00000000 000000a4
!	Mem[0000000030081400] = ff85cc0d, %l0 = 408b2a9a0000001c
	ldswa	[%i2+%g0]0x81,%l0	! %l0 = ffffffffff85cc0d

p0_label_83:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, %l1 = 000000000000001c, %l6 = 0000000000000087
	udivx	%l4,%l1,%l6		! %l6 = 0000000000000000
!	%l3 = c700000000000000, Mem[0000000030141400] = ff000000
	stba	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	%l0 = ffffffffff85cc0d, imm = fffffffffffff812, %l1 = 000000000000001c
	xnor	%l0,-0x7ee,%l1		! %l1 = ffffffffff85cbe0
!	%l2 = 00000000000000c7, Mem[0000000010041410] = fffffddd
	stwa	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000c7
!	%l0 = ff85cc0d, %l1 = ff85cbe0, Mem[0000000010001408] = 75159c91 028a361c
	stda	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = ff85cc0d ff85cbe0
!	%l4 = 0000000000000000, Mem[00000000218000c0] = 01cd6b00, %asi = 80
	stba	%l4,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 00cd6b00
!	%l4 = 0000000000000000, Mem[0000000030041400] = 3d5c9877
	stba	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 005c9877
!	Mem[00000000211c0000] = 00005a40, %l2 = 00000000000000c7
	ldstuba	[%o2+0x000]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000201c0001] = ffffa3b0, %l2 = 0000000000000000
	ldstub	[%o0+0x001],%l2		! %l2 = 00000000000000ff
!	%f4  = ff9f434b 1821d14d, %l6 = 0000000000000000
!	Mem[0000000030181408] = ffafa800666d8d17
	add	%i6,0x008,%g1
	stda	%f4,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030181408] = ffafa800666d8d17

p0_label_84:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 005c9877, %f27 = 00000000
	lda	[%i1+%g0]0x81,%f27	! %f27 = 005c9877
!	Mem[0000000010101408] = 00000019 3d5c9877, %l2 = 000000ff, %l3 = 00000000
	ldd	[%i4+%o4],%l2		! %l2 = 0000000000000019 000000003d5c9877
!	%l0 = ffffffffff85cc0d, immd = ffffffffffffff8a, %l108 = 0000000000000007
	udivx	%l0,-0x076,%l7		! %l7 = 0000000000000000
!	Mem[0000000010181400] = 00000000 0022a4b7 ffe9c16b 0a58ef20
!	Mem[0000000010181410] = ff000000 00000000 1be0455a 66228fc3
!	Mem[0000000010181420] = 6d669ae8 e23b3a56 1d7929b9 eff70037
!	Mem[0000000010181430] = 00000000 000000ff 00000000 000000ff
	ldda	[%i6+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010181400
!	Mem[0000000021800040] = 0ae6eaa0, %l3 = 000000003d5c9877, %asi = 80
	lduha	[%o3+0x040]%asi,%l3	! %l3 = 0000000000000ae6
!	Mem[0000000010081424] = 0000361c, %f1  = 00a8af4f
	ld	[%i2+0x024],%f1 	! %f1 = 0000361c
!	Mem[0000000030141408] = 563a3be2, %l6 = 0000000000000000
	lduba	[%i5+%o4]0x81,%l6	! %l6 = 0000000000000056
!	Mem[0000000010181438] = 00000000000000ff, %f8  = 6f579718 01dd6bc9
	ldd	[%i6+0x038],%f8 	! %f8  = 00000000 000000ff
!	Mem[0000000010181410] = ff000000 00000000, %l4 = 00000000, %l5 = 00000000
	ldd	[%i6+%o5],%l4		! %l4 = 00000000ff000000 0000000000000000
!	Code Fragment 3, seed = 189432
p0_fragment_12:
!	%l0 = ffffffffff85cc0d
	setx	0xcf1e700ce8ddd066,%g7,%l0 ! %l0 = cf1e700ce8ddd066
!	%l1 = ffffffffff85cbe0
	setx	0xd99e235043099091,%g7,%l1 ! %l1 = d99e235043099091
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = cf1e700ce8ddd066
	setx	0x9c8339e0c08cf4cc,%g7,%l0 ! %l0 = 9c8339e0c08cf4cc
!	%l1 = d99e235043099091
	setx	0xa10c337995b40017,%g7,%l1 ! %l1 = a10c337995b40017
p0_fragment_12_end:

p0_label_85:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010041400] = 000000da
	stba	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000da
	membar	#Sync			! Added by membar checker (15)
!	%f16 = 00000000 0022a4b7, Mem[0000000010181438] = 00000000 000000ff
	std	%f16,[%i6+0x038]	! Mem[0000000010181438] = 00000000 0022a4b7
!	Mem[0000000010081410] = ff22a4b7b7a42200, %l4 = 00000000ff000000, %l6 = 0000000000000056
	add	%i2,0x10,%g1
	casxa	[%g1]0x80,%l4,%l6	! %l6 = ff22a4b7b7a42200
!	%f6  = 2bf75871, Mem[00000000100c1410] = 00000000
	sta	%f6 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = 2bf75871
!	Mem[0000000030101408] = e4e41b59, %l1 = a10c337995b40017
	ldstuba	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000059
!	%l0 = c08cf4cc, %l1 = 00000059, Mem[0000000030181408] = 00a8afff 178d6d66
	stda	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = c08cf4cc 00000059
!	%l2 = 00000019, %l3 = 00000ae6, Mem[00000000100c1410] = 7158f72b 00000000
	stda	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000019 00000ae6
!	%f6  = 2bf75871, Mem[0000000010001438] = 00000000
	sta	%f6 ,[%i0+0x038]%asi	! Mem[0000000010001438] = 2bf75871
!	%f22 = 1be0455a 66228fc3, Mem[0000000010181400] = 00000000 0022a4b7, %asi = 80
	stda	%f22,[%i6+0x000]%asi	! Mem[0000000010181400] = 1be0455a 66228fc3
!	%l0 = 9c8339e0c08cf4cc, Mem[00000000211c0000] = ff005a40, %asi = 80
	stha	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = f4cc5a40

p0_label_86:
!	Starting 10 instruction Load Burst
!	Code Fragment 4, seed = 568120
p0_fragment_13:
!	%l0 = 9c8339e0c08cf4cc
	setx	0x0072943a555ad666,%g7,%l0 ! %l0 = 0072943a555ad666
!	%l1 = 0000000000000059
	setx	0xf8aeadd98fefb691,%g7,%l1 ! %l1 = f8aeadd98fefb691
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0072943a555ad666
	setx	0x416771d710123acc,%g7,%l0 ! %l0 = 416771d710123acc
!	%l1 = f8aeadd98fefb691
	setx	0x2f12e3792c2e6617,%g7,%l1 ! %l1 = 2f12e3792c2e6617
p0_fragment_13_end:
!	Mem[0000000010041410] = 4e697b32 c7000000, %l4 = ff000000, %l5 = 00000000
	ldda	[%i1+%o5]0x88,%l4	! %l4 = 00000000c7000000 000000004e697b32
!	Mem[0000000010181408] = ffe9c16b, %f10 = 66f7cb16
	ld	[%i6+%o4],%f10		! %f10 = ffe9c16b
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000030101400] = 82510000 00000000 ff1be4e4 27e3d4af
!	Mem[0000000030101410] = b3000000 00000000 3215b54a 7b5389f3
!	Mem[0000000030101420] = 29418e58 151bfe09 5e1bac56 36a1cd4f
!	Mem[0000000030101430] = 3342fac4 7d7f0545 0f02e122 044abf6b
	ldda	[%i4+%g0]ASI_BLK_AIUS,%f16	! Block Load from 0000000030101400
!	Mem[00000000218000c0] = 00cd6b00, %l7 = 0000000000000000, %asi = 80
	lduha	[%o3+0x0c0]%asi,%l7	! %l7 = 00000000000000cd
!	Mem[00000000100c1408] = 00000000, %f14 = 563a3be2
	lda	[%i3+%o4]0x80,%f14	! %f14 = 00000000
!	Mem[0000000010001408] = ff85cc0d, %l0 = 416771d710123acc
	ldswa	[%i0+%o4]0x88,%l0	! %l0 = ffffffffff85cc0d
!	Mem[0000000010041410] = 000000c7327b694e, %f2  = ffafa800 ffefa800
	ldda	[%i1+%o5]0x80,%f2 	! %f2  = 000000c7 327b694e
!	Mem[0000000010141408] = 7ead1bff00000980, %l7 = 00000000000000cd
	ldxa	[%i5+%o4]0x88,%l7	! %l7 = 7ead1bff00000980
!	Mem[0000000021800080] = 70d56cd0, %l4 = 00000000c7000000, %asi = 80
	ldsba	[%o3+0x080]%asi,%l4	! %l4 = 0000000000000070

p0_label_87:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = b7a422ff, %l5 = 000000004e697b32
	swapa	[%i2+%o5]0x88,%l5	! %l5 = 00000000b7a422ff
!	Mem[0000000010041438] = 00227852, %l2 = 00000019, %l1 = 2c2e6617
	add	%i1,0x38,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 0000000000227852
!	Mem[0000000010081408] = 000000c8, %l6 = ff22a4b7b7a42200
	ldstuba	[%i2+%o4]0x88,%l6	! %l6 = 00000000000000c8
!	%l7 = 7ead1bff00000980, Mem[0000000010041438] = 00227852, %asi = 80
	stha	%l7,[%i1+0x038]%asi	! Mem[0000000010041438] = 09807852
!	Mem[0000000010101400] = c70000ff, %l2 = 0000000000000019
	swapa	[%i4+%g0]0x88,%l2	! %l2 = 00000000c70000ff
!	%f31 = 044abf6b, Mem[0000000010001400] = 59bebb7d
	sta	%f31,[%i0+%g0]0x80	! Mem[0000000010001400] = 044abf6b
	membar	#Sync			! Added by membar checker (17)
!	%l5 = 00000000b7a422ff, Mem[0000000030101410] = 000000b3
	stwa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = b7a422ff
!	Mem[0000000010001410] = 00000000, %l7 = 0000000000000980
	swapa	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[000000001008142c] = 51d2834c, %l5 = 00000000b7a422ff, %asi = 80
	swapa	[%i2+0x02c]%asi,%l5	! %l5 = 0000000051d2834c
!	Mem[0000000010041400] = da000000, %l5 = 0000000051d2834c
	swapa	[%i1+%g0]0x88,%l5	! %l5 = 00000000da000000

p0_label_88:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00000019, %l0 = ffffffffff85cc0d, %asi = 80
	lduwa	[%i4+0x008]%asi,%l0	! %l0 = 0000000000000019
!	Mem[0000000030141400] = 00000000 00000000 563a3be2 00000000
!	Mem[0000000030141410] = 00000000 000000da 2a050980 373b9740
!	Mem[0000000030141420] = 66228fc3 00a8af4f 2819d016 5db0382c
!	Mem[0000000030141430] = 3216b68c 3785cc0d 16962968 3d0a02d9
	ldda	[%i5+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030141400
!	Mem[00000000211c0000] = f4cc5a40, %l6 = 00000000000000c8
	lduh	[%o2+%g0],%l6		! %l6 = 000000000000f4cc
!	Mem[00000000211c0000] = f4cc5a40, %l2 = 00000000c70000ff
	lduh	[%o2+%g0],%l2		! %l2 = 000000000000f4cc
!	Mem[0000000010041400] = 4c83d251, %l1 = 0000000000227852
	ldsha	[%i1+%g0]0x80,%l1	! %l1 = 0000000000004c83
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010001400] = 044abf6b 000000da 0dcc85ff e0cb85ff
!	Mem[0000000010001410] = 00000980 00000000 00000024 00000000
!	Mem[0000000010001420] = 4fafa800 c38f2266 da9f434b 79ce8ddd
!	Mem[0000000010001430] = 0dcc8537 8cb61632 2bf75871 00000080
	ldda	[%i0+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010001400
!	Mem[0000000030041410] = 77985c3db7a42200, %f14 = 16962968 3d0a02d9
	ldda	[%i1+%o5]0x81,%f14	! %f14 = 77985c3d b7a42200
!	Mem[0000000010041400] = 51d2834c, %l0 = 0000000000000019
	lduwa	[%i1+%g0]0x88,%l0	! %l0 = 0000000051d2834c
!	Mem[0000000030001400] = c96bdd01, %l5 = 00000000da000000
	ldswa	[%i0+%g0]0x81,%l5	! %l5 = ffffffffc96bdd01
!	Mem[00000000201c0001] = ffffa3b0, %l5 = ffffffffc96bdd01
	ldsb	[%o0+0x001],%l5		! %l5 = ffffffffffffffff

p0_label_89:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = 0000001c, %l7 = 0000000000000000
	swapa	[%i2+%o4]0x89,%l7	! %l7 = 000000000000001c
!	%l0 = 0000000051d2834c, Mem[0000000010041410] = 000000c7327b694e
	stx	%l0,[%i1+%o5]		! Mem[0000000010041410] = 0000000051d2834c
!	%l4 = 0000000000000070, Mem[0000000021800180] = 30f04d90
	sth	%l4,[%o3+0x180]		! Mem[0000000021800180] = 00704d90
!	%l2 = 000000000000f4cc, immd = 0000000000000e7d, %l108 = 0000000000000006
	sdivx	%l2,0xe7d,%l6		! %l6 = 0000000000000010
!	%f0  = 00000000 00000000, Mem[0000000030181408] = c08cf4cc 00000059
	stda	%f0 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 00000000
!	%f6  = 2a050980, Mem[0000000030101408] = e4e41bff
	sta	%f6 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 2a050980
!	Mem[0000000030101408] = 2a050980, %l7 = 000000000000001c
	swapa	[%i4+%o4]0x89,%l7	! %l7 = 000000002a050980
!	%f6  = 2a050980 373b9740, Mem[0000000030181410] = 00000000 1821d14d
	stda	%f6 ,[%i6+%o5]0x81	! Mem[0000000030181410] = 2a050980 373b9740
!	%l0 = 51d2834c, %l1 = 00004c83, Mem[0000000030141408] = 563a3be2 00000000
	stda	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 51d2834c 00004c83

p0_label_90:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ffff4c10, %l0 = 0000000051d2834c, %asi = 80
	ldsha	[%o1+0x040]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030001410] = 5c89129a, %l1 = 0000000000004c83
	lduba	[%i0+%o5]0x89,%l1	! %l1 = 000000000000009a
!	Mem[0000000010041410] = 0000000051d2834c, %l6 = 0000000000000010
	ldx	[%i1+%o5],%l6		! %l6 = 0000000051d2834c
!	Mem[0000000010141400] = 028a361cff000040, %f10 = 2819d016 5db0382c
	ldda	[%i5+%g0]0x88,%f10	! %f10 = 028a361c ff000040
!	Mem[0000000030101400] = 00005182, %l3 = 0000000000000ae6
	lduha	[%i4+%g0]0x89,%l3	! %l3 = 0000000000005182
!	Mem[000000001018142d] = eff70037, %l5 = ffffffffffffffff, %asi = 80
	lduba	[%i6+0x02d]%asi,%l5	! %l5 = 00000000000000f7
!	Mem[00000000300c1400] = 97250000, %l0 = ffffffffffffffff
	lduha	[%i3+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141408] = 00000980, %l5 = 00000000000000f7
	ldswa	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000980
!	Mem[0000000010041400] = 85c05226 51d2834c, %l0 = 00000000, %l1 = 0000009a
	ldda	[%i1+%g0]0x88,%l0	! %l0 = 0000000051d2834c 0000000085c05226
!	Mem[0000000030101408] = 1c000000, %l3 = 0000000000005182
	lduwa	[%i4+%o4]0x81,%l3	! %l3 = 000000001c000000

p0_label_91:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 00000000, %l5 = 0000000000000980
	ldstuba	[%i4+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[000000001014141a] = 2a050980, %l4 = 0000000000000070
	ldstub	[%i5+0x01a],%l4		! %l4 = 0000000000000009
!	Mem[0000000010081410] = 4e697b32, %l3 = 000000001c000000
	ldstuba	[%i2+%o5]0x88,%l3	! %l3 = 0000000000000032
!	Mem[0000000010041408] = 00000000, %l2 = 000000000000f4cc
	ldstuba	[%i1+%o4]0x80,%l2	! %l2 = 0000000000000000
!	%l0 = 0000000051d2834c, Mem[0000000010181400] = 5a45e01b
	stha	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 5a45834c
!	%l3 = 0000000000000032, Mem[0000000010041408] = ff000000
	stha	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = 00320000
!	%f14 = 77985c3d b7a42200, Mem[0000000030181400] = 000000ff e23b3a56
	stda	%f14,[%i6+%g0]0x81	! Mem[0000000030181400] = 77985c3d b7a42200
!	%l3 = 0000000000000032, Mem[0000000010041410] = 4c83d25100000000
	stxa	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000000000000032
!	%f18 = ff85cbe0 ff85cc0d, Mem[00000000300c1410] = ffffffff 6ac7ea3c
	stda	%f18,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff85cbe0 ff85cc0d
!	Mem[0000000010041410] = 00000032, %l3 = 0000000000000032
	ldstuba	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000032

p0_label_92:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ffe9c16b0a58ef20, %f6  = 2a050980 373b9740, %asi = 80
	ldda	[%i6+0x008]%asi,%f6 	! %f6  = ffe9c16b 0a58ef20
!	Mem[0000000010181410] = ff000000 00000000, %l2 = 00000000, %l3 = 00000032
	ldd	[%i6+%o5],%l2		! %l2 = 00000000ff000000 0000000000000000
!	Mem[0000000010101400] = 19000000 5c89129a, %l6 = 51d2834c, %l7 = 2a050980
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 0000000019000000 000000005c89129a
!	Mem[0000000010181410] = 000000ff, %l6 = 0000000019000000
	ldsba	[%i6+%o5]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010141417] = b7a42200, %l5 = 0000000000000000, %asi = 80
	ldsba	[%i5+0x017]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041400] = 4c83d251, %l7 = 000000005c89129a
	lduba	[%i1+%g0]0x80,%l7	! %l7 = 000000000000004c
!	Mem[00000000100c1400] = 5310df05, %l1 = 0000000085c05226
	ldsha	[%i3+%g0]0x88,%l1	! %l1 = ffffffffffffdf05
!	Mem[0000000010141438] = ffa42200, %l6 = ffffffffffffffff, %asi = 80
	ldswa	[%i5+0x038]%asi,%l6	! %l6 = ffffffffffa42200
!	Mem[0000000010141410] = 1b590000, %l1 = ffffffffffffdf05
	lduba	[%i5+%o5]0x88,%l1	! %l1 = 0000000000000000
!	%l4 = 0000000000000009, %l3 = 0000000000000000, %y  = 9d58eb3c
	udiv	%l4,%l3,%l5		! Div by zero, %l0 = 0000000051d28374

p0_label_93:
!	Starting 10 instruction Store Burst
!	%l6 = ffa42200, %l7 = 0000004c, Mem[00000000100c1408] = 00000000 00000000
	stda	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffa42200 0000004c
!	%l6 = ffa42200, %l7 = 0000004c, Mem[0000000030141400] = 00000000 00000000
	stda	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = ffa42200 0000004c
!	%f4  = 00000000 000000da, %l5 = 0000000000000000
!	Mem[0000000010141408] = 80090000ff1bad7e
	add	%i5,0x008,%g1
	stda	%f4,[%g1+%l5]ASI_PST32_P ! Mem[0000000010141408] = 80090000ff1bad7e
!	Mem[0000000010081408] = ff000000, %l4 = 0000000000000009
	swapa	[%i2+%o4]0x80,%l4	! %l4 = 00000000ff000000
!	%l3 = 0000000000000000, Mem[0000000020800041] = ffff4c10
	stb	%l3,[%o1+0x041]		! Mem[0000000020800040] = ff004c10
!	Mem[0000000010141410] = 0000591b, %l0 = 0000000051d28374
	swapa	[%i5+%o5]0x80,%l0	! %l0 = 000000000000591b
!	%l4 = 00000000ff000000, Mem[000000001018141a] = 1be0455a
	stb	%l4,[%i6+0x01a]		! Mem[0000000010181418] = 1be0005a
!	Mem[0000000010041400] = 51d2834c, %l0 = 000000000000591b
	swapa	[%i1+%g0]0x88,%l0	! %l0 = 0000000051d2834c
!	Mem[0000000030101410] = ff22a4b7, %l4 = 00000000ff000000
	swapa	[%i4+%o5]0x81,%l4	! %l4 = 00000000ff22a4b7
!	%l6 = ffffffffffa42200, Mem[000000001010141e] = 32e6e003
	sth	%l6,[%i4+0x01e]		! Mem[000000001010141c] = 32e62200

p0_label_94:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041430] = 60235074, %l7 = 000000000000004c
	ldsh	[%i1+0x030],%l7		! %l7 = 0000000000006023
!	Mem[0000000010141412] = 51d28374, %l2 = 00000000ff000000, %asi = 80
	ldsha	[%i5+0x012]%asi,%l2	! %l2 = ffffffffffff8374
!	%l4 = 00000000ff22a4b7, imm = 0000000000000785, %l3 = 0000000000000000
	xor	%l4,0x785,%l3		! %l3 = 00000000ff22a332
!	Mem[0000000010041410] = ff000000, %l1 = 0000000000000000
	lduha	[%i1+%o5]0x80,%l1	! %l1 = 000000000000ff00
!	Mem[00000000100c1400] = 3a505f845310df05, %l2 = ffffffffffff8374
	ldxa	[%i3+%g0]0x88,%l2	! %l2 = 3a505f845310df05
!	Mem[00000000300c1400] = 00002597, %l4 = 00000000ff22a4b7
	lduba	[%i3+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = ffa422000dcc85ff, %l5 = 0000000000000000
	ldxa	[%i2+%g0]0x89,%l5	! %l5 = ffa422000dcc85ff
!	Mem[0000000030181408] = 0000000000000000, %f30 = 80000000 7158f72b
	ldda	[%i6+%o4]0x81,%f30	! %f30 = 00000000 00000000
!	Mem[00000000300c1408] = a4000000 000000ff, %l6 = ffa42200, %l7 = 00006023
	ldda	[%i3+%o4]0x89,%l6	! %l6 = 00000000000000ff 00000000a4000000
!	Mem[0000000030101408] = 1c000000 27e3d4af, %l4 = 00000000, %l5 = 0dcc85ff
	ldda	[%i4+%o4]0x81,%l4	! %l4 = 000000001c000000 0000000027e3d4af

p0_label_95:
!	Starting 10 instruction Store Burst
!	%f2  = 563a3be2 00000000, %l6 = 00000000000000ff
!	Mem[0000000010081410] = ff7b694eb7a42200
	add	%i2,0x010,%g1
	stda	%f2,[%g1+%l6]ASI_PST8_P ! Mem[0000000010081410] = 563a3be200000000
!	Mem[0000000010001408] = 0dcc85ff, %l7 = 00000000a4000000
	ldstub	[%i0+%o4],%l7		! %l7 = 000000000000000d
!	%f9  = 00a8af4f, Mem[0000000030081410] = 82513742
	sta	%f9 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 00a8af4f
!	%f24 = 66228fc3, %f22 = 00000000
	fsqrts	%f24,%f22		! %f22 = 52cbffda
!	%l7 = 000000000000000d, Mem[0000000010101410] = ff000000
	stba	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 0d000000
!	%l6 = 000000ff, %l7 = 0000000d, Mem[00000000100c1420] = 00000000 3c000000
	std	%l6,[%i3+0x020]		! Mem[00000000100c1420] = 000000ff 0000000d
!	%l4 = 000000001c000000, Mem[00000000300c1410] = e0cb85ff
	stba	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = e0cb8500
!	Mem[0000000010101430] = 3d0a02d9, %l4 = 1c000000, %l4 = 1c000000
	add	%i4,0x30,%g1
	casa	[%g1]0x80,%l4,%l4	! %l4 = 000000003d0a02d9
!	%l7 = 000000000000000d, Mem[0000000010101418] = c3ee5cca32e62200, %asi = 80
	stxa	%l7,[%i4+0x018]%asi	! Mem[0000000010101418] = 000000000000000d
!	Mem[0000000010001400] = 6bbf4a04, %l4 = 000000003d0a02d9
	swapa	[%i0+%g0]0x88,%l4	! %l4 = 000000006bbf4a04

p0_label_96:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00000000, %l7 = 000000000000000d
	lduwa	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1410] = 00000ae600000019, %l3 = 00000000ff22a332
	ldxa	[%i3+%o5]0x88,%l3	! %l3 = 00000ae600000019
!	Mem[0000000010181400] = 4c83455a, %l2 = 3a505f845310df05
	ldsba	[%i6+%g0]0x80,%l2	! %l2 = 000000000000004c
!	Mem[0000000010081410] = e23b3a56, %l6 = 00000000000000ff
	lduwa	[%i2+%o5]0x88,%l6	! %l6 = 00000000e23b3a56
!	Mem[0000000010081408] = 000000099a2a8b40, %f16 = da000000 6bbf4a04
	ldda	[%i2+%o4]0x80,%f16	! %f16 = 00000009 9a2a8b40
!	Mem[0000000010081400] = 00000000, %l3 = 00000ae600000019
	lduba	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000000
!	%f7  = 0a58ef20, Mem[0000000010141438] = ffa42200
	sta	%f7 ,[%i5+0x038]%asi	! Mem[0000000010141438] = 0a58ef20
!	Mem[0000000010101408] = 77985c3d 19000000, %l0 = 51d2834c, %l1 = 0000ff00
	ldda	[%i4+%o4]0x88,%l0	! %l0 = 0000000019000000 0000000077985c3d
!	Mem[0000000030001400] = c96bdd0100a8af4f, %f14 = 77985c3d b7a42200
	ldda	[%i0+%g0]0x81,%f14	! %f14 = c96bdd01 00a8af4f
!	Mem[0000000010001408] = ffcc85ff, %l1 = 0000000077985c3d
	lduwa	[%i0+%o4]0x80,%l1	! %l1 = 00000000ffcc85ff

p0_label_97:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001430] = 0dcc8537, %l1 = 00000000ffcc85ff, %asi = 80
	swapa	[%i0+0x030]%asi,%l1	! %l1 = 000000000dcc8537
!	Mem[00000000300c1408] = ff000000, %l4 = 000000006bbf4a04
	ldstuba	[%i3+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	%l4 = 000000ff, %l5 = 27e3d4af, Mem[0000000010181400] = 5a45834c c38f2266
	stda	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff 27e3d4af
!	%l0 = 0000000019000000, Mem[0000000030081400] = ff85cc0d
	stwa	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 19000000
!	%l1 = 000000000dcc8537, Mem[0000000010081400] = 00000000
	stba	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000037
!	Mem[00000000300c1400] = 00002597, %l1 = 000000000dcc8537
	swapa	[%i3+%g0]0x81,%l1	! %l1 = 0000000000002597
!	%l3 = 0000000000000000, Mem[0000000010041408] = 00003200
	stwa	%l3,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	Mem[0000000030001410] = 5c89129a, %l1 = 0000000000002597
	swapa	[%i0+%o5]0x89,%l1	! %l1 = 000000005c89129a
!	Mem[0000000020800001] = 00ffb9e0, %l2 = 000000000000004c
	ldstub	[%o1+0x001],%l2		! %l2 = 00000000000000ff
!	%f8  = 66228fc3 00a8af4f, %l5 = 0000000027e3d4af
!	Mem[00000000300c1428] = 4d32c4f61c649f6f
	add	%i3,0x028,%g1
	stda	%f8,[%g1+%l5]ASI_PST16_SL ! Mem[00000000300c1428] = 4fafa800c38f2266

p0_label_98:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 80090000, %f6  = ffe9c16b
	lda	[%i0+%o5]0x88,%f6 	! %f6 = 80090000
!	Mem[0000000010001400] = d9020a3d, %l5 = 0000000027e3d4af
	ldswa	[%i0+%g0]0x80,%l5	! %l5 = ffffffffd9020a3d
!	Mem[00000000201c0001] = ffffa3b0, %l3 = 0000000000000000, %asi = 80
	ldsba	[%o0+0x001]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030141400] = ffa42200, %l1 = 000000005c89129a
	ldswa	[%i5+%g0]0x81,%l1	! %l1 = ffffffffffa42200
!	Mem[000000001010143c] = 1c368a02, %l1 = ffffffffffa42200, %asi = 80
	ldswa	[%i4+0x03c]%asi,%l1	! %l1 = 000000001c368a02
!	Mem[0000000010041400] = 0000591b, %l2 = 00000000000000ff
	lduwa	[%i1+%g0]0x88,%l2	! %l2 = 000000000000591b
!	Mem[0000000010041400] = 85c052260000591b, %l2 = 000000000000591b
	ldxa	[%i1+%g0]0x88,%l2	! %l2 = 85c052260000591b
!	Mem[0000000010001410] = 80090000, %l3 = ffffffffffffffff
	lduwa	[%i0+%o5]0x88,%l3	! %l3 = 0000000080090000
!	Mem[0000000010001400] = 3d0a02d9, %l6 = 00000000e23b3a56
	lduha	[%i0+%g0]0x88,%l6	! %l6 = 00000000000002d9
!	Mem[0000000010001400] = 3d0a02d9, %l0 = 0000000019000000
	lduha	[%i0+%g0]0x88,%l0	! %l0 = 00000000000002d9

p0_label_99:
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = ffffa3b0, %l1 = 000000001c368a02
	ldstub	[%o0+%g0],%l1		! %l1 = 00000000000000ff
!	%f4  = 00000000, Mem[0000000030081410] = 00a8af4f
	sta	%f4 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	%f24 = 66228fc3 00a8af4f, Mem[0000000030081400] = 19000000 0022a4ff
	stda	%f24,[%i2+%g0]0x81	! Mem[0000000030081400] = 66228fc3 00a8af4f
!	Mem[000000001008142d] = b7a422ff, %l3 = 0000000080090000
	ldstub	[%i2+0x02d],%l3		! %l3 = 00000000000000a4
!	%f2  = 563a3be2, %f30 = 00000000, %f14 = c96bdd01
	fsubs	%f2 ,%f30,%f14		! %f14 = 563a3be2
!	%l3 = 00000000000000a4, Mem[00000000100c1400] = 5310df05
	stba	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 5310dfa4
!	%f22 = 52cbffda 24000000, Mem[0000000030081410] = 00000000 4e697b32
	stda	%f22,[%i2+%o5]0x89	! Mem[0000000030081410] = 52cbffda 24000000
!	Mem[0000000010181428] = 1d7929b9eff70037, %f20 = 00000000 80090000
	ldd	[%i6+0x028],%f20	! %f20 = 1d7929b9 eff70037
!	Mem[0000000030081408] = 00000000, %l0 = 00000000000002d9
	ldstuba	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000
!	%f2  = 563a3be2 00000000, Mem[0000000010101410] = 0d000000 ff368a02
	stda	%f2 ,[%i4+%o5]0x80	! Mem[0000000010101410] = 563a3be2 00000000

p0_label_100:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff00000000000000, %l3 = 00000000000000a4
	ldxa	[%i1+%o5]0x80,%l3	! %l3 = ff00000000000000
!	Mem[0000000030001410] = 00002597, %l3 = ff00000000000000
	lduwa	[%i0+%o5]0x89,%l3	! %l3 = 0000000000002597
!	Mem[0000000010181408] = ffe9c16b, %l5 = ffffffffd9020a3d
	lduha	[%i6+%o4]0x80,%l5	! %l5 = 000000000000ffe9
!	Mem[0000000010181414] = 00000000, %l7 = 0000000000000000, %asi = 80
	ldsha	[%i6+0x014]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001410] = 00002597, %l7 = 0000000000000000
	lduba	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000097
!	Mem[0000000010141400] = 028a361c ff000040, %l6 = 000002d9, %l7 = 00000097
	ldda	[%i5+%g0]0x88,%l6	! %l6 = 00000000ff000040 00000000028a361c
!	Mem[0000000030001410] = 00002597, %f31 = 00000000
	lda	[%i0+%o5]0x89,%f31	! %f31 = 00002597
!	Mem[00000000300c1400] = 3785cc0d, %l3 = 0000000000002597
	lduba	[%i3+%g0]0x89,%l3	! %l3 = 000000000000000d
!	Mem[0000000010001400] = d9020a3d, %l2 = 85c052260000591b
	ldsha	[%i0+%g0]0x80,%l2	! %l2 = ffffffffffffd902
!	Mem[0000000030181410] = 8009052a, %f10 = 028a361c
	lda	[%i6+%o5]0x89,%f10	! %f10 = 8009052a

p0_label_101:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 00000000, %l3 = 000000000000000d
	swapa	[%i5+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = 00000980, %l3 = 0000000000000000
	ldstuba	[%i0+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%l4 = 00000000000000ff, Mem[00000000211c0001] = f4cc5a40, %asi = 80
	stba	%l4,[%o2+0x001]%asi	! Mem[00000000211c0000] = f4ff5a40
!	%l6 = 00000000ff000040, Mem[000000001004141c] = 78708063, %asi = 80
	stba	%l6,[%i1+0x01c]%asi	! Mem[000000001004141c] = 40708063
!	%f14 = 563a3be2, %f19 = ff85cc0d
	fsqrts	%f14,%f19		! %f19 = 4ada591c
!	Mem[0000000010001400] = d9020a3d 000000da ffcc85ff e0cb85ff
!	%f16 = 00000009 9a2a8b40 ff85cbe0 4ada591c
!	%f20 = 1d7929b9 eff70037 52cbffda 24000000
!	%f24 = 66228fc3 00a8af4f dd8dce79 4b439fda
!	%f28 = 3216b68c 3785cc0d 00000000 00002597
	stda	%f16,[%i0+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010001400
!	%l4 = 00000000000000ff, Mem[0000000010101410] = 563a3be2
	stb	%l4,[%i4+%o5]		! Mem[0000000010101410] = ff3a3be2
!	Mem[0000000010101410] = e23b3aff, %l7 = 00000000028a361c
	ldstuba	[%i4+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000211c0000] = f4ff5a40, %l4 = 00000000000000ff
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 00000000000000f4
!	%f16 = 00000009 9a2a8b40, %l5 = 000000000000ffe9
!	Mem[0000000010101430] = 3d0a02d90d23ccd5
	add	%i4,0x030,%g1
	stda	%f16,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010101430] = 408b02d90d230000

p0_label_102:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800000] = ff76e470, %l4 = 00000000000000f4, %asi = 80
	ldsha	[%o3+0x000]%asi,%l4	! %l4 = ffffffffffffff76
!	Mem[0000000030081400] = 66228fc3, %l6 = 00000000ff000040
	ldswa	[%i2+%g0]0x81,%l6	! %l6 = 0000000066228fc3
!	Mem[0000000010181408] = ffe9c16b, %l6 = 0000000066228fc3
	lduha	[%i6+%o4]0x80,%l6	! %l6 = 000000000000ffe9
!	Mem[0000000010141411] = 51d28374, %l6 = 000000000000ffe9, %asi = 80
	ldsba	[%i5+0x011]%asi,%l6	! %l6 = ffffffffffffffd2
!	Mem[0000000010141400] = ff000040, %l5 = 000000000000ffe9
	lduwa	[%i5+%g0]0x88,%l5	! %l5 = 00000000ff000040
!	Mem[0000000010081400] = 37000000 5c89129a, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i2+%g0]0x80,%l0	! %l0 = 0000000037000000 000000005c89129a
!	Mem[00000000100c1408] = ffa42200, %l3 = 0000000000000000
	lduha	[%i3+%o4]0x88,%l3	! %l3 = 0000000000002200
!	Mem[00000000100c1410] = 19000000, %l7 = 00000000000000ff
	lduha	[%i3+%o5]0x80,%l7	! %l7 = 0000000000001900
!	Mem[000000001008143a] = 00000000, %l0 = 0000000037000000, %asi = 80
	ldsha	[%i2+0x03a]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041400] = 1b5900002652c085, %l3 = 0000000000002200
	ldxa	[%i1+%g0]0x80,%l3	! %l3 = 1b5900002652c085

p0_label_103:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (19)
!	%l4 = ffffffffffffff76, Mem[0000000010001400] = 9a2a8b40
	stba	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 9a2a8b76
!	Mem[0000000030001400] = c96bdd01, %l3 = 1b5900002652c085
	ldstuba	[%i0+%g0]0x81,%l3	! %l3 = 00000000000000c9
!	%f13 = 3785cc0d, %f0  = 00000000, %f20 = 1d7929b9
	fsubs	%f13,%f0 ,%f20		! %f20 = 3785cc0d
!	%l6 = ffffffffffffffd2, Mem[0000000030041400] = 005c9877
	stwa	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffffd2
!	%l1 = 000000005c89129a, Mem[0000000010041408] = 00000000
	stba	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = 9a000000
!	Mem[00000000300c1408] = 000000ff, %l5 = 00000000ff000040
	swapa	[%i3+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%f24 = 66228fc3 00a8af4f, %l4 = ffffffffffffff76
!	Mem[0000000010101438] = 5db0382c1c368a02
	add	%i4,0x038,%g1
	stda	%f24,[%g1+%l4]ASI_PST8_P ! Mem[0000000010101438] = 5d228fc31ca8af02
!	%l2 = ffffffffffffd902, Mem[0000000030141410] = 0000000d
	stha	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = d902000d
!	%f22 = 52cbffda 24000000, %l6 = ffffffffffffffd2
!	Mem[0000000030101418] = 3215b54a7b5389f3
	add	%i4,0x018,%g1
	stda	%f22,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030101418] = 3200b54ada53cb52
!	Mem[0000000010181410] = ff000000, %l6 = 00000000ffffffd2
	swapa	[%i6+%o5]0x80,%l6	! %l6 = 00000000ff000000

p0_label_104:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 563a3be2, %l1 = 000000005c89129a
	lduha	[%i2+%o5]0x80,%l1	! %l1 = 000000000000563a
!	Mem[00000000201c0001] = ffffa3b0, %l4 = ffffffffffffff76
	ldub	[%o0+0x001],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010001400] = 768b2a9a09000000, %l6 = 00000000ff000000
	ldxa	[%i0+%g0]0x80,%l6	! %l6 = 768b2a9a09000000
!	%l5 = 00000000000000ff, %l1 = 000000000000563a, %y  = 9d58eb3c
	udiv	%l5,%l1,%l5		! %l5 = 00000000ffffffff
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000010001410] = 3700f7ef, %l4 = 00000000000000ff
	lduwa	[%i0+%o5]0x80,%l4	! %l4 = 000000003700f7ef
!	Mem[0000000030081410] = 52cbffda24000000, %f2  = 563a3be2 00000000
	ldda	[%i2+%o5]0x89,%f2 	! %f2  = 52cbffda 24000000
!	Mem[0000000030001400] = ff6bdd01, %l7 = 0000000000001900
	lduba	[%i0+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001420] = 4fafa800, %l0 = 0000000000000000, %asi = 80
	ldswa	[%i0+0x020]%asi,%l0	! %l0 = 000000004fafa800
!	Mem[00000000100c142e] = 02b36a7f, %l6 = 768b2a9a09000000, %asi = 80
	lduba	[%i3+0x02e]%asi,%l6	! %l6 = 000000000000006a
!	Mem[0000000030141400] = ffa422000000004c, %l1 = 000000000000563a
	ldxa	[%i5+%g0]0x81,%l1	! %l1 = ffa422000000004c

p0_label_105:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 82510000, %l3 = 00000000000000c9
	ldstuba	[%i4+%g0]0x81,%l3	! %l3 = 0000000000000082
!	Mem[00000000300c1410] = e0cb8500, %l3 = 0000000000000082
	ldstuba	[%i3+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181400] = 3d5c9877, %l5 = 00000000ffffffff
	swapa	[%i6+%g0]0x89,%l5	! %l5 = 000000003d5c9877
!	%f6  = 80090000, Mem[0000000010141400] = 400000ff
	sta	%f6 ,[%i5+%g0]0x80	! Mem[0000000010141400] = 80090000
!	Mem[0000000010041408] = 9a000000, %l5 = 000000003d5c9877, %asi = 80
	swapa	[%i1+0x008]%asi,%l5	! %l5 = 000000009a000000
!	%l0 = 000000004fafa800, Mem[0000000030081400] = c38f2266
	stha	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = c38fa800
!	%f16 = 00000009 9a2a8b40, Mem[0000000010101400] = 00000019 9a12895c
	stda	%f16,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000009 9a2a8b40
!	Mem[00000000300c1400] = 0dcc8537, %l1 = ffa422000000004c
	ldstuba	[%i3+%g0]0x81,%l1	! %l1 = 000000000000000d
!	Mem[0000000010041400] = 1b590000, %l1 = 000000000000000d
	swapa	[%i1+%g0]0x80,%l1	! %l1 = 000000001b590000
!	%f26 = dd8dce79 4b439fda, %l5 = 000000009a000000
!	Mem[0000000030181410] = 2a050980373b9740
	add	%i6,0x010,%g1
	stda	%f26,[%g1+%l5]ASI_PST16_SL ! Mem[0000000030181410] = 2a050980373b9740

p0_label_106:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 51d2834c, %f22 = 52cbffda
	lda	[%i5+%o4]0x81,%f22	! %f22 = 51d2834c
	membar	#Sync			! Added by membar checker (20)
!	Mem[00000000300c1400] = ffcc8537 43ccfaf1 400000ff 000000a4
!	Mem[00000000300c1410] = ff85cbe0 ff85cc0d 552d8bea 2c856213
!	Mem[00000000300c1420] = 18b671f8 0a2a8f29 4fafa800 c38f2266
!	Mem[00000000300c1430] = 7320b064 12a7e065 6dd4dbc2 79a7ab8b
	ldda	[%i3+%g0]ASI_BLK_AIUSL,%f16	! Block Load from 00000000300c1400
!	Mem[0000000030181410] = 8009052a, %l5 = 000000009a000000
	ldswa	[%i6+%o5]0x89,%l5	! %l5 = ffffffff8009052a
!	Mem[0000000021800100] = 87ffe530, %l0 = 000000004fafa800, %asi = 80
	lduha	[%o3+0x100]%asi,%l0	! %l0 = 00000000000087ff
!	Mem[00000000300c1408] = 400000ff, %l6 = 000000000000006a
	ldsha	[%i3+%o4]0x81,%l6	! %l6 = 0000000000004000
!	Mem[0000000010001400] = 9a2a8b76, %f1  = 00000000
	lda	[%i0+%g0]0x88,%f1 	! %f1 = 9a2a8b76
!	Mem[0000000030001410] = 97250000, %f4  = 00000000
	lda	[%i0+%o5]0x81,%f4 	! %f4 = 97250000
!	Mem[0000000010141400] = 80090000, %l5 = ffffffff8009052a
	ldswa	[%i5+%g0]0x80,%l5	! %l5 = ffffffff80090000
!	Mem[0000000030001410] = 3c000000 00002597, %l6 = 00004000, %l7 = 000000ff
	ldda	[%i0+%o5]0x89,%l6	! %l6 = 0000000000002597 000000003c000000
!	Mem[0000000010101410] = ff3a3be2, %l5 = ffffffff80090000
	lduha	[%i4+%o5]0x80,%l5	! %l5 = 000000000000ff3a

p0_label_107:
!	Starting 10 instruction Store Burst
!	%l2 = ffffd902, %l3 = 00000000, Mem[0000000010001400] = 9a2a8b76 00000009
	stda	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffd902 00000000
!	%l3 = 0000000000000000, %l7 = 000000003c000000, %l4 = 000000003700f7ef
	sdivx	%l3,%l7,%l4		! %l4 = 0000000000000000
!	Mem[0000000010001414] = b929791d, %l2 = ffffd902, %l1 = 1b590000
	add	%i0,0x14,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 00000000b929791d
!	%f20 = 0dcc85ff e0cb85ff, %l6 = 0000000000002597
!	Mem[0000000010081408] = 000000099a2a8b40
	add	%i2,0x008,%g1
	stda	%f20,[%g1+%l6]ASI_PST8_P ! Mem[0000000010081408] = 0d0000ff9acb85ff
!	%l6 = 0000000000002597, Mem[0000000030181408] = 0000000000000000
	stxa	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000000000002597
!	%l3 = 0000000000000000, Mem[0000000030001410] = 3c00000000002597
	stxa	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000000000000000
!	%f15 = 00a8af4f, Mem[0000000030101408] = 1c000000
	sta	%f15,[%i4+%o4]0x81	! Mem[0000000030101408] = 00a8af4f
!	%l2 = ffffffffffffd902, Mem[0000000030101408] = 4fafa800
	stba	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 4fafa802
!	Mem[0000000010001400] = ffffd902, %l0 = 00000000000087ff
	swapa	[%i0+%g0]0x88,%l0	! %l0 = 00000000ffffd902
!	%f28 = 65e0a712 64b02073, Mem[0000000010101410] = ff3a3be2 00000000
	std	%f28,[%i4+%o5]		! Mem[0000000010101410] = 65e0a712 64b02073

p0_label_108:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = e0cb85ff, %l0 = 00000000ffffd902
	ldsha	[%i3+%o5]0x89,%l0	! %l0 = ffffffffffff85ff
!	Mem[00000000100c1408] = ffa42200, %l0 = ffffffffffff85ff
	ldsba	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141430] = 3216b68cff85cc0d, %l7 = 000000003c000000, %asi = 80
	ldxa	[%i5+0x030]%asi,%l7	! %l7 = 3216b68cff85cc0d
!	Mem[0000000010001400] = ff870000, %l7 = 3216b68cff85cc0d
	lduha	[%i0+%g0]0x80,%l7	! %l7 = 000000000000ff87
!	Mem[0000000010141408] = 7ead1bff 00000980, %l0 = 00000000, %l1 = b929791d
	ldda	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000980 000000007ead1bff
!	Mem[0000000010081428] = ffc4787f b7ff22ff, %l2 = ffffd902, %l3 = 00000000
	ldd	[%i2+0x028],%l2		! %l2 = 00000000ffc4787f 00000000b7ff22ff
!	Mem[000000001010140f] = 3d5c9877, %l6 = 0000000000002597
	ldsb	[%i4+0x00f],%l6		! %l6 = 0000000000000077
!	Mem[0000000030081408] = ff0000009a2a8b40, %l1 = 000000007ead1bff
	ldxa	[%i2+%o4]0x81,%l1	! %l1 = ff0000009a2a8b40
!	Mem[0000000010141410] = 51d28374, %l5 = 000000000000ff3a
	ldsba	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000051
!	Mem[0000000030001410] = 00000000, %l6 = 0000000000000077
	lduha	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000000

p0_label_109:
!	Starting 10 instruction Store Burst
!	%f4  = 97250000 000000da, Mem[0000000030001400] = 01dd6bff 4fafa800
	stda	%f4 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 97250000 000000da
!	%l7 = 000000000000ff87, Mem[0000000010101408] = 00000019
	stwa	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000ff87
!	Mem[0000000030001400] = da000000, %l2 = 00000000ffc4787f
	swapa	[%i0+%g0]0x81,%l2	! %l2 = 00000000da000000
!	%f22 = 1362852c, Mem[0000000030041410] = 3d5c9877
	sta	%f22,[%i1+%o5]0x89	! Mem[0000000030041410] = 1362852c
!	Mem[0000000030141408] = 51d2834c, %l6 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l6	! %l6 = 0000000000000051
!	Mem[0000000030141408] = 4c83d2ff, %l6 = 0000000000000051
	ldstuba	[%i5+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%l6 = 00000000000000ff, immd = 0000000000000dc0, %l5  = 0000000000000051
	mulx	%l6,0xdc0,%l5		! %l5 = 00000000000db240
!	%l7 = 000000000000ff87, Mem[0000000030181408] = 00002597
	stha	%l7,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000ff87
!	%l4 = 0000000000000000, imm = 0000000000000da2, %l6 = 00000000000000ff
	orn	%l4,0xda2,%l6		! %l6 = fffffffffffff25d
!	Mem[0000000030141400] = ffa42200, %l3 = 00000000b7ff22ff
	ldstuba	[%i5+%g0]0x81,%l3	! %l3 = 00000000000000ff

p0_label_110:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000ae600000019, %f10 = 8009052a ff000040
	ldda	[%i3+%o5]0x88,%f10	! %f10 = 00000ae6 00000019
!	Mem[0000000010181408] = ffe9c16b0a58ef20, %f30 = 8baba779 c2dbd46d
	ldd	[%i6+%o4],%f30		! %f30 = ffe9c16b 0a58ef20
!	Mem[0000000010001408] = 1c59da4a, %l5 = 00000000000db240
	ldsba	[%i0+%o4]0x80,%l5	! %l5 = 000000000000001c
!	Mem[0000000030181408] = 0000ff87, %l1 = ff0000009a2a8b40
	ldswa	[%i6+%o4]0x89,%l1	! %l1 = 000000000000ff87
!	Mem[0000000010141408] = 00000980, %l6 = fffffffffffff25d
	lduba	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000080
!	Mem[0000000010141418] = 2a05ff80, %l1 = 000000000000ff87, %asi = 80
	lduwa	[%i5+0x018]%asi,%l1	! %l1 = 000000002a05ff80
!	Mem[0000000010101408] = 0000ff873d5c9877, %f18 = a4000000 ff000040
	ldda	[%i4+%o4]0x80,%f18	! %f18 = 0000ff87 3d5c9877
!	Mem[0000000010041400] = 0000000d2652c085, %l4 = 0000000000000000
	ldxa	[%i1+%g0]0x80,%l4	! %l4 = 0000000d2652c085
!	Mem[0000000030041408] = 1c368aff, %l7 = 000000000000ff87
	lduba	[%i1+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181408] = 87ff0000, %l1 = 000000002a05ff80
	lduba	[%i6+%o4]0x81,%l1	! %l1 = 0000000000000087

p0_label_111:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 6bc1e9ff, %l0 = 0000000000000980
	swapa	[%i6+%o4]0x88,%l0	! %l0 = 000000006bc1e9ff
!	Mem[0000000030181408] = 87ff0000, %l0 = 000000006bc1e9ff
	ldstuba	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000087
!	%l4 = 0000000d2652c085, Mem[0000000030101408] = 02a8af4f27e3d4af
	stxa	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000000d2652c085
!	%l5 = 000000000000001c, Mem[0000000010181400] = ff000000afd4e327, %asi = 80
	stxa	%l5,[%i6+0x000]%asi	! Mem[0000000010181400] = 000000000000001c
!	Mem[0000000030001400] = 7f78c4ff, %l1 = 0000000000000087
	swapa	[%i0+%g0]0x89,%l1	! %l1 = 000000007f78c4ff
!	%f16 = f1facc43 3785ccff, Mem[0000000030101400] = ff510000 00000000
	stda	%f16,[%i4+%g0]0x81	! Mem[0000000030101400] = f1facc43 3785ccff
!	Mem[0000000010181430] = 00000000, %l7 = 000000ff, %l2 = da000000
	add	%i6,0x30,%g1
	casa	[%g1]0x80,%l7,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = 1c59da4ae0cb85ff, %l0 = 0000000000000087, %l1 = 000000007f78c4ff
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l0,%l1	! %l1 = 1c59da4ae0cb85ff
!	%l3 = 00000000000000ff, Mem[0000000010181410] = d2ffffff
	stwa	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff
!	%l7 = 00000000000000ff, Mem[0000000010141408] = 00000980
	stha	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff

p0_label_112:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff85cb9a ff00000d, %l6 = 00000080, %l7 = 000000ff
	ldda	[%i2+%o4]0x88,%l6	! %l6 = 00000000ff00000d 00000000ff85cb9a
!	Mem[0000000030101410] = ff00000000000000, %l0 = 0000000000000087
	ldxa	[%i4+%o5]0x81,%l0	! %l0 = ff00000000000000
!	%l7 = 00000000ff85cb9a, imm = fffffffffffff0dc, %l4 = 0000000d2652c085
	add	%l7,-0xf24,%l4		! %l4 = 00000000ff85bc76
!	Mem[0000000020800040] = ff004c10, %l7 = 00000000ff85cb9a, %asi = 80
	lduha	[%o1+0x040]%asi,%l7	! %l7 = 000000000000ff00
!	Mem[0000000010101428] = 46000000 0022a4ff, %l2 = 00000000, %l3 = 000000ff
	ldd	[%i4+0x028],%l2		! %l2 = 0000000046000000 000000000022a4ff
!	Mem[0000000010001420] = 4fafa800c38f2266, %f26 = 66228fc3 00a8af4f
	ldd	[%i0+0x020],%f26	! %f26 = 4fafa800 c38f2266
!	Mem[0000000010041400] = 0000000d 2652c085, %l6 = ff00000d, %l7 = 0000ff00, %asi = 80
	ldda	[%i1+0x000]%asi,%l6	! %l6 = 000000000000000d 000000002652c085
!	Mem[0000000010101410] = 65e0a71264b02073, %l7 = 000000002652c085
	ldxa	[%i4+%o5]0x80,%l7	! %l7 = 65e0a71264b02073
!	Mem[0000000010041408] = 77985c3d, %l4 = 00000000ff85bc76
	lduba	[%i1+%o4]0x88,%l4	! %l4 = 000000000000003d
!	Mem[00000000100c1418] = 2c98213a 06c81023, %l6 = 0000000d, %l7 = 64b02073, %asi = 80
	ldda	[%i3+0x018]%asi,%l6	! %l6 = 000000002c98213a 0000000006c81023

p0_label_113:
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000001c, Mem[0000000030081410] = 00000024
	stwa	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000001c
!	%f24 = 298f2a0a f871b618, Mem[0000000030041400] = d2ffffff ffa42200
	stda	%f24,[%i1+%g0]0x89	! Mem[0000000030041400] = 298f2a0a f871b618
!	%l6 = 000000002c98213a, imm = 000000000000035e, %l6 = 000000002c98213a
	andn	%l6,0x35e,%l6		! %l6 = 000000002c982020
!	%f16 = f1facc43, Mem[0000000010001420] = 4fafa800
	sta	%f16,[%i0+0x020]%asi	! Mem[0000000010001420] = f1facc43
!	%l7 = 0000000006c81023, Mem[0000000030101410] = ff000000
	stwa	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 06c81023
!	%l0 = ff00000000000000, Mem[0000000010141400] = 00000980
	stha	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	%f20 = 0dcc85ff e0cb85ff, Mem[0000000010081408] = ff00000d ff85cb9a
	stda	%f20,[%i2+%o4]0x88	! Mem[0000000010081408] = 0dcc85ff e0cb85ff
!	%l4 = 000000000000003d, Mem[0000000010001410] = 3700f7efb929791d
	stxa	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000000000003d
!	Mem[0000000010141400] = 00000000 1c368a02 ff000000 ff1bad7e
!	%f0  = 00000000 9a2a8b76 52cbffda 24000000
!	%f4  = 97250000 000000da 80090000 0a58ef20
!	%f8  = 66228fc3 00a8af4f 00000ae6 00000019
!	%f12 = 3216b68c 3785cc0d 563a3be2 00a8af4f
	stda	%f0 ,[%i5+%g0]ASI_BLK_PL	! Block Store to 0000000010141400
!	%l7 = 0000000006c81023, Mem[0000000030081408] = 000000ff
	stba	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000023

p0_label_114:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 43ccfaf1, %l2 = 0000000046000000
	ldsba	[%i4+%g0]0x89,%l2	! %l2 = fffffffffffffff1
!	Mem[00000000300c1408] = 400000ff, %l7 = 0000000006c81023
	lduwa	[%i3+%o4]0x81,%l7	! %l7 = 00000000400000ff
!	Mem[00000000300c1408] = ff000040, %l5 = 000000000000001c
	ldswa	[%i3+%o4]0x89,%l5	! %l5 = ffffffffff000040
!	Mem[0000000030041400] = f871b618, %l5 = ffffffffff000040
	lduha	[%i1+%g0]0x89,%l5	! %l5 = 000000000000b618
!	Mem[00000000100c143e] = 5859239b, %l0 = ff00000000000000, %asi = 80
	ldsha	[%i3+0x03e]%asi,%l0	! %l0 = 000000000000239b
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000010141408] = 24000000, %l3 = 000000000022a4ff
	lduha	[%i5+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101428] = 460000000022a4ff, %f26 = 4fafa800 c38f2266, %asi = 80
	ldda	[%i4+0x028]%asi,%f26	! %f26 = 46000000 0022a4ff
!	Mem[0000000030081400] = 00a88fc3, %f27 = 0022a4ff
	lda	[%i2+%g0]0x81,%f27	! %f27 = 00a88fc3
!	%l0 = 000000000000239b, immd = fffffea8, %y  = 00000000
	umul	%l0,-0x158,%l6		! %l6 = 0000239affd027b8, %y = 0000239a
!	Mem[000000001014143e] = e23b3a56, %l3 = 0000000000000000
	ldsb	[%i5+0x03e],%l3		! %l3 = 000000000000003a

p0_label_115:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 87ff0000, %l6 = 0000239affd027b8
	ldstuba	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000000
!	%f11 = 00000019, Mem[0000000030081400] = c38fa800
	sta	%f11,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000019
!	Mem[0000000030141408] = ffd2834c, %l4 = 000000000000003d
	swapa	[%i5+%o4]0x81,%l4	! %l4 = 00000000ffd2834c
!	%l1 = 1c59da4ae0cb85ff, Mem[0000000010041410] = ff000000
	stba	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = ff000000
!	Mem[0000000010181400] = 00000000, %l3 = 000000000000003a
	ldstuba	[%i6+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081410] = e23b3a56, %l6 = 0000000000000000
	swapa	[%i2+%o5]0x88,%l6	! %l6 = 00000000e23b3a56
!	Code Fragment 3, seed = 251895
p0_fragment_14:
!	%l0 = 000000000000239b
	setx	0xdb5626f88a255f6e,%g7,%l0 ! %l0 = db5626f88a255f6e
!	%l1 = 1c59da4ae0cb85ff
	setx	0x53c347f9642e9119,%g7,%l1 ! %l1 = 53c347f9642e9119
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = db5626f88a255f6e
	setx	0xbffb4db2bd12aed4,%g7,%l0 ! %l0 = bffb4db2bd12aed4
!	%l1 = 53c347f9642e9119
	setx	0xdb71e3c9a95b3b9f,%g7,%l1 ! %l1 = db71e3c9a95b3b9f
p0_fragment_14_end:
!	Mem[0000000030141400] = 0022a4ff, %l7 = 00000000400000ff
	ldstuba	[%i5+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	%f10 = 00000ae6 00000019, Mem[0000000010181400] = ff000000 0000001c, %asi = 80
	stda	%f10,[%i6+0x000]%asi	! Mem[0000000010181400] = 00000ae6 00000019
!	%l6 = 00000000e23b3a56, Mem[00000000100c1416] = e60a0000, %asi = 80
	stha	%l6,[%i3+0x016]%asi	! Mem[00000000100c1414] = e60a3a56

p0_label_116:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 0d0002d9, %l6 = 00000000e23b3a56
	lduba	[%i5+%o5]0x89,%l6	! %l6 = 00000000000000d9
!	Mem[0000000010001400] = ff87000000000000, %f30 = ffe9c16b 0a58ef20
	ldd	[%i0+%g0],%f30		! %f30 = ff870000 00000000
!	Mem[0000000020800000] = 00ffb9e0, %l1 = db71e3c9a95b3b9f
	ldsh	[%o1+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010001410] = 00000000, %l0 = bffb4db2bd12aed4
	lduwa	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081410] = 1c000000, %l0 = 0000000000000000
	lduwa	[%i2+%o5]0x89,%l0	! %l0 = 000000001c000000
!	Mem[0000000010101408] = 87ff00ff, %f17 = 3785ccff
	lda	[%i4+%o4]0x88,%f17	! %f17 = 87ff00ff
!	Mem[00000000201c0000] = ffffa3b0, %l6 = 00000000000000d9, %asi = 80
	ldsha	[%o0+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030081400] = 00000019, %l6 = ffffffffffffffff
	ldsba	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000019
!	Mem[0000000030181400] = ffffffff, %f28 = 65e0a712
	lda	[%i6+%g0]0x81,%f28	! %f28 = ffffffff
!	Mem[0000000030101410] = 000000002310c806, %f14 = 563a3be2 00a8af4f
	ldda	[%i4+%o5]0x89,%f14	! %f14 = 00000000 2310c806

p0_label_117:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[00000000300c1408] = ff000040
	stwa	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%l3 = 0000000000000000, Mem[00000000300c1410] = e0cb85ff
	stha	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = e0cb0000
!	Mem[0000000030181410] = 8009052a, %l3 = 0000000000000000
	swapa	[%i6+%o5]0x89,%l3	! %l3 = 000000008009052a
!	Mem[000000001000140e] = e0cb85ff, %l7 = 00000000000000ff
	ldstub	[%i0+0x00e],%l7		! %l7 = 0000000000000085
!	%l6 = 0000000000000019, Mem[000000001000142c] = 79ce8ddd
	stw	%l6,[%i0+0x02c]		! Mem[000000001000142c] = 00000019
!	%l1 = 00000000000000ff, Mem[0000000030141410] = 0d0002d9
	stha	%l1,[%i5+%o5]0x89	! Mem[0000000030141410] = 0d0000ff
!	%f4  = 97250000 000000da, %l3 = 000000008009052a
!	Mem[0000000010081400] = 370000005c89129a
	stda	%f4,[%i2+%l3]ASI_PST8_P ! Mem[0000000010081400] = 370000000089009a
!	%l4 = 00000000ffd2834c, Mem[000000001018141c] = 66228fc3
	stb	%l4,[%i6+0x01c]		! Mem[000000001018141c] = 4c228fc3
!	%f22 = 1362852c ea8b2d55, Mem[0000000010041400] = 0000000d 2652c085
	stda	%f22,[%i1+%g0]0x80	! Mem[0000000010041400] = 1362852c ea8b2d55
!	Mem[00000000211c0001] = ffff5a40, %l2 = fffffffffffffff1
	ldstuba	[%o2+0x001]%asi,%l2	! %l2 = 00000000000000ff

p0_label_118:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 0d000000, %f13 = 3785cc0d
	lda	[%i4+%o4]0x89,%f13	! %f13 = 0d000000
!	Mem[0000000030181400] = 0022a4b7 ffffffff, %l2 = 000000ff, %l3 = 8009052a
	ldda	[%i6+%g0]0x89,%l2	! %l2 = 00000000ffffffff 000000000022a4b7
!	Mem[000000001004141d] = 40708063, %l2 = 00000000ffffffff, %asi = 80
	lduba	[%i1+0x01d]%asi,%l2	! %l2 = 0000000000000070
!	Mem[0000000030081408] = 23000000, %l4 = 00000000ffd2834c
	lduha	[%i2+%o4]0x81,%l4	! %l4 = 0000000000002300
!	Mem[0000000030101408] = 0d000000, %l3 = 000000000022a4b7
	lduwa	[%i4+%o4]0x89,%l3	! %l3 = 000000000d000000
!	%l4 = 0000000000002300, %l4 = 0000000000002300, %l1 = 00000000000000ff
	xnor	%l4,%l4,%l1		! %l1 = ffffffffffffffff
!	Mem[00000000201c0000] = ffffa3b0, %l4 = 0000000000002300, %asi = 80
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000300c1400] = 3785ccff, %l2 = 0000000000000070
	ldswa	[%i3+%g0]0x89,%l2	! %l2 = 000000003785ccff
!	Mem[0000000010141408] = 00000024, %l1 = ffffffffffffffff
	lduba	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l1 = 0000000000000000
	ldsba	[%i0+%o5]0x88,%l1	! %l1 = 0000000000000000

p0_label_119:
!	Starting 10 instruction Store Burst
!	%l2 = 3785ccff, %l3 = 0d000000, Mem[0000000010081408] = ff85cbe0 ff85cc0d
	stda	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 3785ccff 0d000000
!	%l0 = 000000001c000000, Mem[0000000030081400] = 1900000000a8af4f
	stxa	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000001c000000
!	Mem[0000000030141410] = ff00000d, %l7 = 0000000000000085
	swapa	[%i5+%o5]0x81,%l7	! %l7 = 00000000ff00000d
!	%f26 = 46000000, Mem[00000000300c1400] = ffcc8537
	sta	%f26,[%i3+%g0]0x81	! Mem[00000000300c1400] = 46000000
!	Mem[0000000010101400] = 408b2a9a 09000000 ff00ff87 3d5c9877
!	%f16 = f1facc43 87ff00ff 0000ff87 3d5c9877
!	%f20 = 0dcc85ff e0cb85ff 1362852c ea8b2d55
!	%f24 = 298f2a0a f871b618 46000000 00a88fc3
!	%f28 = ffffffff 64b02073 ff870000 00000000
	stda	%f16,[%i4+%g0]ASI_BLK_PL	! Block Store to 0000000010101400
!	%f0  = 00000000, %f9  = 00a8af4f
	fcmps	%fcc3,%f0 ,%f9 		! %fcc3 = 1
!	%l1 = 0000000000000000, Mem[0000000010001408] = 1c59da4a
	stwa	%l1,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	%l2 = 000000003785ccff, Mem[00000000211c0000] = ffff5a40
	stb	%l2,[%o2+%g0]		! Mem[00000000211c0000] = ffff5a40
!	%l7 = 00000000ff00000d, Mem[00000000201c0000] = ffffa3b0, %asi = 80
	stha	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = 000da3b0
!	%l4 = ffffffffffffffff, Mem[000000001018141e] = 4c228fc3
	sth	%l4,[%i6+0x01e]		! Mem[000000001018141c] = 4c22ffff

p0_label_120:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000037, %l5 = 000000000000b618
	lduha	[%i2+%g0]0x88,%l5	! %l5 = 0000000000000037
!	Mem[00000000100c1418] = 2c98213a06c81023, %l0 = 000000001c000000
	ldx	[%i3+0x018],%l0		! %l0 = 2c98213a06c81023
!	Mem[0000000010081408] = 3785ccff0d000000, %l7 = 00000000ff00000d
	ldx	[%i2+%o4],%l7		! %l7 = 3785ccff0d000000
!	Mem[0000000030001410] = 0000000000000000, %l7 = 3785ccff0d000000
	ldxa	[%i0+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101400] = 43ccfaf1, %l6 = 0000000000000019
	lduba	[%i4+%g0]0x89,%l6	! %l6 = 00000000000000f1
!	Mem[0000000030141400] = 0022a4ff, %l0 = 2c98213a06c81023
	lduba	[%i5+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1400] = 3a505f845310dfa4, %l2 = 000000003785ccff
	ldxa	[%i3+%g0]0x88,%l2	! %l2 = 3a505f845310dfa4
!	Mem[0000000010181410] = ff000000, %l5 = 0000000000000037
	lduha	[%i6+%o5]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[0000000010081410] = 00000000, %l2 = 3a505f845310dfa4
	ldsha	[%i2+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %l0 = 00000000000000ff
	ldswa	[%i6+%o5]0x89,%l0	! %l0 = 0000000000000000

p0_label_121:
!	Starting 10 instruction Store Burst
!	Mem[0000000021800181] = 00704d90, %l3 = 000000000d000000
	ldstub	[%o3+0x181],%l3		! %l3 = 0000000000000070
!	%l3 = 0000000000000070, Mem[00000000100c1400] = a4df1053845f503a
	stxa	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000000000000070
!	Mem[00000000300c1408] = 00000000, %l6 = 00000000000000f1
	ldstuba	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000000
!	%l2 = 00000000, %l3 = 00000070, Mem[0000000010041400] = 1362852c ea8b2d55
	stda	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000 00000070
!	%f19 = 3d5c9877, Mem[0000000030101408] = 0d000000
	sta	%f19,[%i4+%o4]0x89	! Mem[0000000030101408] = 3d5c9877
!	Mem[0000000030101408] = 3d5c9877, %l3 = 0000000000000070
	swapa	[%i4+%o4]0x89,%l3	! %l3 = 000000003d5c9877
!	%l7 = 0000000000000000, Mem[0000000010101410] = e0cb85ff
	stba	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = e0cb8500
!	Mem[0000000010141408] = 24000000, %l7 = 0000000000000000
	swapa	[%i5+%o4]0x88,%l7	! %l7 = 0000000024000000
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000010101414] = ff85cc0d, %l0 = 0000000000000000, %asi = 80
	swapa	[%i4+0x014]%asi,%l0	! %l0 = 00000000ff85cc0d
!	Mem[0000000010001410] = 00000000, %l7 = 0000000024000000
	ldstuba	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000

p0_label_122:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 52cbffda 00000000, %l2 = 00000000, %l3 = 3d5c9877
	ldda	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000 0000000052cbffda
!	Mem[00000000100c1400] = 00000000, %l1 = 0000000000000000
	ldswa	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l6 = 0000000000000000
	lduwa	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000201c0001] = 000da3b0, %l2 = 0000000000000000, %asi = 80
	lduba	[%o0+0x001]%asi,%l2	! %l2 = 000000000000000d
!	Mem[0000000010141410] = da000000, %f17 = 87ff00ff
	lda	[%i5+%o5]0x80,%f17	! %f17 = da000000
!	Mem[0000000021800141] = 4bc5db60, %l5 = 000000000000ff00
	ldsb	[%o3+0x141],%l5		! %l5 = ffffffffffffffc5
!	Mem[0000000010141408] = 00000000, %l0 = 00000000ff85cc0d
	ldsha	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181400] = ffffffff, %f5  = 000000da
	lda	[%i6+%g0]0x81,%f5 	! %f5 = ffffffff
!	Mem[00000000100c1430] = 000000ff, %l1 = 0000000000000000
	lduh	[%i3+0x030],%l1		! %l1 = 0000000000000000
!	Mem[00000000300c1400] = 46000000 43ccfaf1 ff000000 000000a4
!	Mem[00000000300c1410] = 0000cbe0 ff85cc0d 552d8bea 2c856213
!	Mem[00000000300c1420] = 18b671f8 0a2a8f29 4fafa800 c38f2266
!	Mem[00000000300c1430] = 7320b064 12a7e065 6dd4dbc2 79a7ab8b
	ldda	[%i3+%g0]ASI_BLK_AIUS,%f0 	! Block Load from 00000000300c1400

p0_label_123:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 3785ccff, %l2 = 000000000000000d
	ldstuba	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000037
!	%f22 = 1362852c ea8b2d55, %l2 = 0000000000000037
!	Mem[0000000010181420] = 6d669ae8e23b3a56
	add	%i6,0x020,%g1
	stda	%f22,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010181420] = 552d8bea2c856213
!	Code Fragment 3, seed = 400975
p0_fragment_15:
!	%l0 = 0000000000000000
	setx	0xdd6c448643e104ae,%g7,%l0 ! %l0 = dd6c448643e104ae
!	%l1 = 0000000000000000
	setx	0x0a784de955f23259,%g7,%l1 ! %l1 = 0a784de955f23259
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = dd6c448643e104ae
	setx	0xa18c24d6050d8c14,%g7,%l0 ! %l0 = a18c24d6050d8c14
!	%l1 = 0a784de955f23259
	setx	0xfa5449262f9894df,%g7,%l1 ! %l1 = fa5449262f9894df
p0_fragment_15_end:
!	%l2 = 0000000000000037, Mem[0000000020800040] = ff004c10
	stb	%l2,[%o1+0x040]		! Mem[0000000020800040] = 37004c10
!	Mem[0000000030001410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101421] = 18b671f8, %l5 = ffffffffffffffc5
	ldstub	[%i4+0x021],%l5		! %l5 = 00000000000000b6
!	Mem[0000000010141418] = 20ef580a00000980, %l1 = fa5449262f9894df, %l3 = 0000000052cbffda
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l1,%l3	! %l3 = 20ef580a00000980
!	Mem[0000000010001410] = 000000ff, %l6 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	%l0 = 050d8c14, %l1 = 2f9894df, Mem[0000000010041400] = 00000000 00000070
	stda	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 050d8c14 2f9894df
!	%f14 = 6dd4dbc2 79a7ab8b, Mem[0000000030181410] = 00000000 40973b37
	stda	%f14,[%i6+%o5]0x89	! Mem[0000000030181410] = 6dd4dbc2 79a7ab8b

p0_label_124:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff5a40, %l5 = 00000000000000b6
	ldsh	[%o2+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010141420] = 4fafa800 c38f2266, %l0 = 050d8c14, %l1 = 2f9894df, %asi = 80
	ldda	[%i5+0x020]%asi,%l0	! %l0 = 000000004fafa800 00000000c38f2266
!	Mem[0000000010141408] = 00000000, %l5 = ffffffffffffffff
	lduha	[%i5+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141410] = da000000, %l3 = 20ef580a00000980
	ldswa	[%i5+%o5]0x80,%l3	! %l3 = ffffffffda000000
!	Mem[0000000030101410] = 00000000 2310c806, %l0 = 4fafa800, %l1 = c38f2266
	ldda	[%i4+%o5]0x89,%l0	! %l0 = 000000002310c806 0000000000000000
!	Mem[0000000010101410] = 0085cbe000000000, %f24 = 298f2a0a f871b618
	ldda	[%i4+%o5]0x80,%f24	! %f24 = 0085cbe0 00000000
!	Mem[000000001008141c] = da9f434b, %f27 = 00a88fc3
	ld	[%i2+0x01c],%f27	! %f27 = da9f434b
!	Mem[0000000030101408] = 70000000, %l2 = 0000000000000037
	lduha	[%i4+%o4]0x81,%l2	! %l2 = 0000000000007000
!	Mem[0000000010041422] = 5695e508, %l6 = 00000000000000ff
	lduh	[%i1+0x022],%l6		! %l6 = 000000000000e508
!	Mem[00000000300c1400] = 46000000, %l0 = 000000002310c806
	lduba	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000046

p0_label_125:
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffda000000, Mem[0000000010041438] = 09807852754f8b5d, %asi = 80
	stxa	%l3,[%i1+0x038]%asi	! Mem[0000000010041438] = ffffffffda000000
!	%l4 = ffffffff, %l5 = 00000000, Mem[0000000030181408] = ffff0000 00000000
	stda	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffffff 00000000
!	%l7 = 0000000000000000, Mem[00000000100c1418] = 2c98213a
	stw	%l7,[%i3+0x018]		! Mem[00000000100c1418] = 00000000
!	Mem[0000000030181410] = 8baba779, %l3 = ffffffffda000000
	ldstuba	[%i6+%o5]0x81,%l3	! %l3 = 000000000000008b
!	%f30 = ff870000 00000000, Mem[0000000010001410] = 00000000 3d000000
	stda	%f30,[%i0+%o5]0x88	! Mem[0000000010001410] = ff870000 00000000
!	Mem[0000000010181408] = 00000980, %l2 = 0000000000007000
	swapa	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000980
!	Mem[0000000010181424] = 2c856213, %l6 = 0000e508, %l6 = 0000e508
	add	%i6,0x24,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 000000002c856213
!	Mem[0000000010101408] = 77985c3d, %l4 = ffffffffffffffff
	ldstuba	[%i4+%o4]0x80,%l4	! %l4 = 0000000000000077
	membar	#Sync			! Added by membar checker (23)
!	%l0 = 00000046, %l1 = 00000000, Mem[00000000300c1410] = e0cb0000 0dcc85ff
	stda	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000046 00000000
!	%l0 = 00000046, %l1 = 00000000, Mem[0000000010101430] = 7320b064 ffffffff
	std	%l0,[%i4+0x030]		! Mem[0000000010101430] = 00000046 00000000

p0_label_126:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff5a40, %l3 = 000000000000008b
	ldsh	[%o2+%g0],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010081400] = 370000000089009a, %f28 = ffffffff 64b02073
	ldda	[%i2+%g0]0x80,%f28	! %f28 = 37000000 0089009a
!	Mem[0000000010081408] = 0000000dffcc85ff, %l6 = 000000002c856213
	ldxa	[%i2+%o4]0x88,%l6	! %l6 = 0000000dffcc85ff
!	Mem[0000000030141408] = 0000003d, %l4 = 0000000000000077
	lduha	[%i5+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101410] = 2310c806, %l3 = ffffffffffffffff
	lduwa	[%i4+%o5]0x89,%l3	! %l3 = 000000002310c806
!	Mem[0000000030041410] = 0022a4b7 1362852c, %l0 = 00000046, %l1 = 00000000
	ldda	[%i1+%o5]0x89,%l0	! %l0 = 000000001362852c 000000000022a4b7
!	Mem[0000000030081408] = 00000023, %l5 = 0000000000000000
	ldsha	[%i2+%o4]0x89,%l5	! %l5 = 0000000000000023
!	Mem[0000000030041408] = ff8a361c, %f28 = 37000000
	lda	[%i1+%o4]0x81,%f28	! %f28 = ff8a361c
!	Mem[0000000010181408] = 00700000, %l3 = 000000002310c806
	lduha	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000070
!	Mem[000000001010140c] = 87ff0000, %l5 = 0000000000000023
	lduh	[%i4+0x00c],%l5		! %l5 = 00000000000087ff

p0_label_127:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 00000046, %l1 = 000000000022a4b7
	swapa	[%i3+%o5]0x89,%l1	! %l1 = 0000000000000046
!	%f13 = 12a7e065, Mem[0000000010101408] = ff985c3d
	sta	%f13,[%i4+%o4]0x80	! Mem[0000000010101408] = 12a7e065
!	Mem[0000000030181408] = ffffffff, %l7 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l7	! %l7 = 00000000ffffffff
!	%f0  = 46000000 43ccfaf1, Mem[0000000030041400] = 18b671f8 0a2a8f29
	stda	%f0 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 46000000 43ccfaf1
!	Mem[0000000010101404] = 43ccfaf1, %l3 = 00000070, %l0 = 1362852c
	add	%i4,0x04,%g1
	casa	[%g1]0x80,%l3,%l0	! %l0 = 0000000043ccfaf1
!	Mem[00000000100c141e] = 06c81023, %l1 = 0000000000000046
	ldstub	[%i3+0x01e],%l1		! %l1 = 0000000000000010
!	%f0  = 46000000 43ccfaf1, Mem[0000000030041400] = 00000046 f1facc43
	stda	%f0 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 46000000 43ccfaf1
!	%f20 = 0dcc85ff, %f17 = da000000, %f25 = 00000000
	fadds	%f20,%f17,%f25		! %f25 = da000000
!	%l5 = 00000000000087ff, immd = 0000000000000075, %l108 = 0000000000000007
	sdivx	%l5,0x075,%l7		! %l7 = 0000000000000129
!	%l2 = 00000980, %l3 = 00000070, Mem[0000000030081410] = 0000001c daffcb52
	stda	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000980 00000070

p0_label_128:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141402] = 768b2a9a, %l0 = 0000000043ccfaf1, %asi = 80
	lduba	[%i5+0x002]%asi,%l0	! %l0 = 000000000000002a
!	Mem[00000000300c1400] = 00000046, %l3 = 0000000000000070
	ldswa	[%i3+%g0]0x89,%l3	! %l3 = 0000000000000046
!	Mem[0000000030041400] = 43ccfaf1, %l1 = 0000000000000010
	lduba	[%i1+%g0]0x89,%l1	! %l1 = 00000000000000f1
!	Mem[0000000030181400] = ffffffff, %l2 = 0000000000000980
	lduwa	[%i6+%g0]0x89,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000030081400] = 00000000, %f14 = 6dd4dbc2
	lda	[%i2+%g0]0x81,%f14	! %f14 = 00000000
!	Mem[0000000030001408] = ff7929b9, %l2 = 00000000ffffffff
	lduba	[%i0+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001410] = 00000000000000ff, %f30 = ff870000 00000000
	ldda	[%i0+%o5]0x89,%f30	! %f30 = 00000000 000000ff
!	Mem[0000000030001410] = ff000000, %l6 = 0000000dffcc85ff
	lduwa	[%i0+%o5]0x81,%l6	! %l6 = 00000000ff000000
!	Mem[0000000030041408] = ff8a361c77985c3d, %l1 = 00000000000000f1
	ldxa	[%i1+%o4]0x81,%l1	! %l1 = ff8a361c77985c3d
!	Mem[00000000300c1410] = b7a42200, %l6 = 00000000ff000000
	ldsba	[%i3+%o5]0x81,%l6	! %l6 = ffffffffffffffb7

p0_label_129:
!	Starting 10 instruction Store Burst
!	%f1  = 43ccfaf1, Mem[000000001000140c] = e0cbffff
	sta	%f1 ,[%i0+0x00c]%asi	! Mem[000000001000140c] = 43ccfaf1
!	Mem[0000000010101400] = ff00ff87 43ccfaf1, %l4 = 00000000, %l5 = 000087ff
	ldda	[%i4+%g0]0x80,%l4	! %l4 = 00000000ff00ff87 0000000043ccfaf1
!	%l6 = ffffffffffffffb7, Mem[0000000030081400] = 00000000
	stha	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = ffb70000
!	%f4  = 0000cbe0, Mem[0000000030101400] = f1facc43
	sta	%f4 ,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000cbe0
!	%l3 = 0000000000000046, Mem[0000000030181408] = 00000000
	stha	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000046
!	%l0 = 000000000000002a, Mem[0000000010141400] = 768b2a9a
	stwa	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000002a
!	Mem[0000000010141410] = da000000, %l7 = 0000000000000129
	swapa	[%i5+%o5]0x80,%l7	! %l7 = 00000000da000000
!	Mem[0000000010181400] = e60a0000, %l0 = 000000000000002a
	ldstuba	[%i6+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010101408] = 12a7e065
	stba	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 00a7e065
!	%l2 = 00000000000000ff, Mem[00000000100c1408] = ffa42200
	stba	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffa422ff

p0_label_130:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ffa42200 0000004c, %l6 = ffffffb7, %l7 = da000000
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 00000000ffa42200 000000000000004c
!	Mem[0000000010001412] = 00000000, %l7 = 000000000000004c
	ldub	[%i0+0x012],%l7		! %l7 = 0000000000000000
!	Mem[0000000010101424] = 0a2a8f29, %l0 = 0000000000000000
	ldsw	[%i4+0x024],%l0		! %l0 = 000000000a2a8f29
!	Mem[0000000030181400] = ffffffff, %l2 = 00000000000000ff
	ldsba	[%i6+%g0]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010001410] = 00000000, %f23 = ea8b2d55
	lda	[%i0+%o5]0x88,%f23	! %f23 = 00000000
!	Mem[0000000030181410] = 6dd4dbc2 79a7abff, %l6 = ffa42200, %l7 = 00000000
	ldda	[%i6+%o5]0x89,%l6	! %l6 = 0000000079a7abff 000000006dd4dbc2
!	Mem[00000000100c1418] = 0000000006c8ff23, %l0 = 000000000a2a8f29, %asi = 80
	ldxa	[%i3+0x018]%asi,%l0	! %l0 = 0000000006c8ff23
!	Mem[00000000300c1408] = ff000000, %l5 = 0000000043ccfaf1
	ldswa	[%i3+%o4]0x81,%l5	! %l5 = ffffffffff000000
!	Code Fragment 3, seed = 103367
p0_fragment_16:
!	%l0 = 0000000006c8ff23
	setx	0x438801ce05cc50ee,%g7,%l0 ! %l0 = 438801ce05cc50ee
!	%l1 = ff8a361c77985c3d
	setx	0x8e86f53c4f20ca99,%g7,%l1 ! %l1 = 8e86f53c4f20ca99
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 438801ce05cc50ee
	setx	0x0aeae2124d0db054,%g7,%l0 ! %l0 = 0aeae2124d0db054
!	%l1 = 8e86f53c4f20ca99
	setx	0x9a2c6d5015a4851f,%g7,%l1 ! %l1 = 9a2c6d5015a4851f
p0_fragment_16_end:
!	Mem[0000000010081400] = 00000037, %l2 = ffffffffffffffff
	ldswa	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000037

p0_label_131:
!	Starting 10 instruction Store Burst
!	%f24 = 0085cbe0, Mem[00000000100c1410] = 19000000
	sta	%f24,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0085cbe0
!	%l4 = ff00ff87, %l5 = ff000000, Mem[0000000010001410] = 00000000 ff870000
	stda	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = ff00ff87 ff000000
!	%f24 = 0085cbe0, %f9  = 0a2a8f29, %f18 = 0000ff87
	fmuls	%f24,%f9 ,%f18		! %f18 = 00000000
!	%l4 = ff00ff87, %l5 = ff000000, Mem[0000000010101410] = e0cb8500 00000000
	stda	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = ff00ff87 ff000000
!	Mem[0000000010001400] = ff870000, %f10 = 4fafa800
	lda	[%i0+%g0]0x80,%f10	! %f10 = ff870000
!	%l6 = 0000000079a7abff, Mem[0000000010081408] = ff85ccff0d000000
	stxa	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000079a7abff
!	Mem[0000000010181410] = 000000ff, %l2 = 0000000000000037
	swapa	[%i6+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%f1  = 43ccfaf1, %f25 = da000000
	fcmpes	%fcc0,%f1 ,%f25		! %fcc0 = 2
!	%l7 = 000000006dd4dbc2, imm = 0000000000000df8, %l4 = 00000000ff00ff87
	xor	%l7,0xdf8,%l4		! %l4 = 000000006dd4d63a
!	%l0 = 0aeae2124d0db054, Mem[0000000010141408] = 00000000
	stwa	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 4d0db054

p0_label_132:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 0000002a, %l5 = ffffffffff000000
	lduwa	[%i5+%g0]0x80,%l5	! %l5 = 000000000000002a
!	Mem[00000000300c1400] = 46000000, %l5 = 000000000000002a
	ldsha	[%i3+%g0]0x81,%l5	! %l5 = 0000000000004600
!	Mem[00000000300c1410] = 00000000 0022a4b7, %l2 = 000000ff, %l3 = 00000046
	ldda	[%i3+%o5]0x89,%l2	! %l2 = 000000000022a4b7 0000000000000000
!	Mem[0000000030101400] = e0cb0000, %l6 = 0000000079a7abff
	ldsba	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001400] = 00000087, %l3 = 0000000000000000
	ldsba	[%i0+%g0]0x89,%l3	! %l3 = ffffffffffffff87
!	Mem[0000000030041400] = 43ccfaf1, %l1 = 9a2c6d5015a4851f
	lduha	[%i1+%g0]0x89,%l1	! %l1 = 000000000000faf1
!	Mem[0000000010081408] = 00000000, %l3 = ffffffffffffff87
	ldswa	[%i2+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000218000c0] = 00cd6b00, %l6 = 0000000000000000, %asi = 80
	ldsba	[%o3+0x0c0]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1410] = b7a42200, %f12 = 7320b064
	lda	[%i3+%o5]0x81,%f12	! %f12 = b7a42200
!	Mem[0000000010001410] = 87ff00ff, %f12 = b7a42200
	lda	[%i0+%o5]0x80,%f12	! %f12 = 87ff00ff

p0_label_133:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 87ff00ff, %l3 = 0000000000000000
	swapa	[%i0+%o5]0x80,%l3	! %l3 = 0000000087ff00ff
!	%l6 = 00000000, %l7 = 6dd4dbc2, Mem[0000000010081400] = 37000000 0089009a
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000 6dd4dbc2
!	Mem[0000000030181410] = 79a7abff, %l3 = 0000000087ff00ff
	swapa	[%i6+%o5]0x89,%l3	! %l3 = 0000000079a7abff
!	%l5 = 0000000000004600, Mem[0000000030041408] = 1c368aff
	stwa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 00004600
!	%l0 = 0aeae2124d0db054, Mem[0000000030141400] = ffa42200
	stha	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = b0542200
!	%l5 = 0000000000004600, imm = 0000000000000a58, %l1 = 000000000000faf1
	xor	%l5,0xa58,%l1		! %l1 = 0000000000004c58
!	Mem[0000000010101400] = 87ff00ff, %l5 = 0000000000004600
	swapa	[%i4+%g0]0x88,%l5	! %l5 = 0000000087ff00ff
!	%l4 = 000000006dd4d63a, Mem[0000000030181400] = 0022a4b7ffffffff
	stxa	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000006dd4d63a
!	%l2 = 000000000022a4b7, Mem[0000000010101410] = 87ff00ff
	stba	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = b7ff00ff
!	%l2 = 000000000022a4b7, Mem[0000000010181400] = ff000ae6
	stba	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = b7000ae6

p0_label_134:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %l6 = 0000000000000000
	lduwa	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000000
!	%l0 = 4d0db054, %l1 = 00004c58, Mem[0000000010001410] = 00000000 ff000000
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 4d0db054 00004c58
!	Mem[0000000010101408] = 00a7e06587ff0000, %l3 = 0000000079a7abff, %asi = 80
	ldxa	[%i4+0x008]%asi,%l3	! %l3 = 00a7e06587ff0000
!	Mem[0000000010141408] = 54b00d4d, %l6 = 0000000000000000
	lduba	[%i5+%o4]0x88,%l6	! %l6 = 000000000000004d
!	Mem[00000000100c143c] = 5859239b, %l6 = 000000000000004d, %asi = 80
	lduha	[%i3+0x03c]%asi,%l6	! %l6 = 0000000000005859
!	Mem[0000000030181400] = 3ad6d46d00000000, %f6  = 552d8bea 2c856213
	ldda	[%i6+%g0]0x81,%f6 	! %f6  = 3ad6d46d 00000000
!	%l6 = 0000000000005859, imm = fffffffffffff197, %l1 = 0000000000004c58
	addc	%l6,-0xe69,%l1		! %l1 = 00000000000049f0
!	Mem[0000000010081408] = 00000000, %l3 = 00a7e06587ff0000
	lduha	[%i2+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041410] = 00000000000000ff, %f28 = ff8a361c 0089009a
	ldda	[%i1+%o5]0x88,%f28	! %f28 = 00000000 000000ff
!	Mem[0000000010101400] = 0046000043ccfaf1, %l1 = 00000000000049f0
	ldxa	[%i4+%g0]0x80,%l1	! %l1 = 0046000043ccfaf1

p0_label_135:
!	Starting 10 instruction Store Burst
!	%f12 = 87ff00ff 12a7e065, Mem[0000000030001410] = ff000000 00000000
	stda	%f12,[%i0+%o5]0x81	! Mem[0000000030001410] = 87ff00ff 12a7e065
!	Mem[00000000100c1400] = 00000000, %l5 = 0000000087ff00ff
	ldstuba	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000000
!	%l6 = 0000000000005859, Mem[00000000100c1410] = e0cb8500
	stha	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = e0cb5859
!	Mem[0000000010181410] = 37000000, %l1 = 0046000043ccfaf1
	ldstuba	[%i6+%o5]0x80,%l1	! %l1 = 0000000000000037
!	Mem[0000000010041424] = 57d10bf9, %l7 = 000000006dd4dbc2, %asi = 80
	swapa	[%i1+0x024]%asi,%l7	! %l7 = 0000000057d10bf9
!	%l3 = 0000000000000000, Mem[0000000010041418] = cc0d8e7a, %asi = 80
	stba	%l3,[%i1+0x018]%asi	! Mem[0000000010041418] = 000d8e7a
!	%l2 = 0022a4b7, %l3 = 00000000, Mem[0000000030101408] = 00000070 85c05226
	stda	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 0022a4b7 00000000
!	%l6 = 00005859, %l7 = 57d10bf9, Mem[0000000010101430] = 00000046 00000000, %asi = 80
	stda	%l6,[%i4+0x030]%asi	! Mem[0000000010101430] = 00005859 57d10bf9
!	%l2 = 0022a4b7, %l3 = 00000000, Mem[0000000030141400] = b0542200 0000004c
	stda	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 0022a4b7 00000000
!	Mem[0000000010101401] = 00460000, %l6 = 0000000000005859
	ldstuba	[%i4+0x001]%asi,%l6	! %l6 = 0000000000000046

p0_label_136:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = b92979ff, %l3 = 0000000000000000
	lduwa	[%i0+%o4]0x89,%l3	! %l3 = 00000000b92979ff
!	Mem[0000000030141400] = 0022a4b700000000, %l7 = 0000000057d10bf9
	ldxa	[%i5+%g0]0x81,%l7	! %l7 = 0022a4b700000000
!	Mem[0000000010001400] = 000087ff, %l5 = 0000000000000000
	lduwa	[%i0+%g0]0x88,%l5	! %l5 = 00000000000087ff
!	Mem[0000000010081408] = 00000000, %l4 = 000000006dd4d63a
	ldsha	[%i2+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101400] = 00ff0000, %l1 = 0000000000000037
	ldsha	[%i4+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001408] = ff7929b96cd291d7, %l5 = 00000000000087ff
	ldxa	[%i0+%o4]0x81,%l5	! %l5 = ff7929b96cd291d7
!	Mem[0000000010001403] = ff870000, %l6 = 0000000000000046
	ldsb	[%i0+0x003],%l6		! %l6 = 0000000000000000
!	Mem[0000000010181418] = 1be0005a, %l3 = 00000000b92979ff
	ldsw	[%i6+0x018],%l3		! %l3 = 000000001be0005a
!	Mem[0000000010081408] = ffaba779 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i2+%o4]0x88,%l6	! %l6 = 0000000000000000 00000000ffaba779
!	Mem[0000000010101408] = 65e0a700, %l5 = ff7929b96cd291d7
	ldswa	[%i4+%o4]0x88,%l5	! %l5 = 0000000065e0a700

p0_label_137:
!	Starting 10 instruction Store Burst
!	%f25 = da000000, Mem[0000000010101410] = ff00ffb7
	sta	%f25,[%i4+%o5]0x88	! Mem[0000000010101410] = da000000
!	%l6 = 0000000000000000, Mem[0000000030181410] = ff00ff87
	stwa	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	%l6 = 00000000, %l7 = ffaba779, Mem[0000000010101408] = 00a7e065 87ff0000
	stda	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000 ffaba779
!	%l4 = 0000000000000000, Mem[0000000030001408] = ff7929b9
	stwa	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	%f20 = 0dcc85ff e0cb85ff, %l1 = 00000000000000ff
!	Mem[0000000010041418] = 000d8e7a40708063
	add	%i1,0x018,%g1
	stda	%f20,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010041418] = ff85cbe0ff85cc0d
!	Code Fragment 3, seed = 39759
p0_fragment_17:
!	%l0 = 0aeae2124d0db054
	setx	0xf7f0300d181a1cae,%g7,%l0 ! %l0 = f7f0300d181a1cae
!	%l1 = 00000000000000ff
	setx	0x5cc40a773cbfca59,%g7,%l1 ! %l1 = 5cc40a773cbfca59
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f7f0300d181a1cae
	setx	0x1a30bf217447a414,%g7,%l0 ! %l0 = 1a30bf217447a414
!	%l1 = 5cc40a773cbfca59
	setx	0x619c49b295972cdf,%g7,%l1 ! %l1 = 619c49b295972cdf
p0_fragment_17_end:
!	%f30 = 00000000 000000ff, Mem[0000000030181408] = 00000046 00000000
	stda	%f30,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 000000ff
!	%l1 = 619c49b295972cdf, Mem[0000000010181400] = b7000ae600000019
	stxa	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = 619c49b295972cdf
!	Mem[0000000030001410] = ff00ff87, %l1 = 0000000095972cdf
	swapa	[%i0+%o5]0x89,%l1	! %l1 = 00000000ff00ff87
!	%l2 = 000000000022a4b7, Mem[00000000100c1410] = 5958cbe0
	stwa	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0022a4b7

p0_label_138:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = b7a42200, %l6 = 0000000000000000
	lduwa	[%i4+%o4]0x81,%l6	! %l6 = 00000000b7a42200
!	%f20 = 0dcc85ff e0cb85ff, %f0  = 46000000 43ccfaf1
	fxtod	%f20,%f0 		! %f0  = 43ab990b ffc1970c
!	Mem[0000000030001410] = df2c9795, %l0 = 1a30bf217447a414
	ldsha	[%i0+%o5]0x81,%l0	! %l0 = ffffffffffffdf2c
	membar	#Sync			! Added by membar checker (24)
!	Mem[00000000300c1400] = 46000000 43ccfaf1 ff000000 000000a4
!	Mem[00000000300c1410] = b7a42200 00000000 552d8bea 2c856213
!	Mem[00000000300c1420] = 18b671f8 0a2a8f29 4fafa800 c38f2266
!	Mem[00000000300c1430] = 7320b064 12a7e065 6dd4dbc2 79a7ab8b
	ldda	[%i3+%g0]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010181410] = ff00000000000000, %f10 = ff870000 c38f2266
	ldda	[%i6+%o5]0x80,%f10	! %f10 = ff000000 00000000
!	Mem[00000000211c0000] = ffff5a40, %l3 = 000000001be0005a, %asi = 80
	ldsba	[%o2+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030101408] = 0022a4b7, %l6 = 00000000b7a42200
	ldsba	[%i4+%o4]0x89,%l6	! %l6 = ffffffffffffffb7
!	Mem[0000000010181400] = 619c49b2, %l7 = 00000000ffaba779
	ldsba	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000061
!	Mem[00000000300c1410] = b7a42200, %l6 = ffffffffffffffb7
	ldsba	[%i3+%o5]0x81,%l6	! %l6 = ffffffffffffffb7
!	Mem[0000000010141410] = 00000129, %l5 = 0000000065e0a700
	lduba	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000

p0_label_139:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (25)
!	%f20 = b7a42200, Mem[00000000300c1400] = 00000046
	sta	%f20,[%i3+%g0]0x89	! Mem[00000000300c1400] = b7a42200
!	Mem[0000000010041408] = 3d5c9877, %l0 = 00000000ffffdf2c
	swapa	[%i1+%o4]0x80,%l0	! %l0 = 000000003d5c9877
!	%f22 = 552d8bea 2c856213, Mem[0000000010181430] = 00000000 000000ff
	std	%f22,[%i6+0x030]	! Mem[0000000010181430] = 552d8bea 2c856213
!	%l4 = 0000000000000000, Mem[0000000030101410] = 2310c806
	stba	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 2310c800
!	%l1 = 00000000ff00ff87, %l4 = 0000000000000000, %l5 = 0000000000000000
	subc	%l1,%l4,%l5		! %l5 = 00000000ff00ff87
!	Mem[0000000010001408] = 00000000, %l2 = 000000000022a4b7
	ldstuba	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000
!	%l0 = 3d5c9877, %l1 = ff00ff87, Mem[0000000010181408] = 00700000 0a58ef20
	stda	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 3d5c9877 ff00ff87
!	Mem[00000000100c1400] = ff000000, %l0 = 000000003d5c9877
	swapa	[%i3+%g0]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[0000000010041400] = 148c0d05, %l0 = 00000000ff000000
	swapa	[%i1+%g0]0x88,%l0	! %l0 = 00000000148c0d05
!	%f26 = 4fafa800 c38f2266, %l4 = 0000000000000000
!	Mem[0000000010081438] = 0000000000000000
	add	%i2,0x038,%g1
	stda	%f26,[%g1+%l4]ASI_PST16_P ! Mem[0000000010081438] = 0000000000000000

p0_label_140:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ff000000, %l1 = 00000000ff00ff87
	lduba	[%i1+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181424] = 2c856213, %l2 = 0000000000000000, %asi = 80
	ldswa	[%i6+0x024]%asi,%l2	! %l2 = 000000002c856213
!	Mem[0000000010141400] = 2a000000, %l5 = 00000000ff00ff87
	lduwa	[%i5+%g0]0x88,%l5	! %l5 = 000000002a000000
!	Mem[00000000100c1438] = 2a5ec312, %l2 = 000000002c856213
	ldsb	[%i3+0x038],%l2		! %l2 = 000000000000002a
!	Mem[0000000010101410] = ff000000da000000, %l0 = 00000000148c0d05
	ldxa	[%i4+%o5]0x88,%l0	! %l0 = ff000000da000000
!	Mem[00000000300c1400] = 0022a4b7, %l2 = 000000000000002a
	ldsba	[%i3+%g0]0x81,%l2	! %l2 = 0000000000000000
!	%f23 = 2c856213, Mem[0000000030141400] = 0022a4b7
	sta	%f23,[%i5+%g0]0x81	! Mem[0000000030141400] = 2c856213
!	Mem[0000000030141408] = 3d000000, %l4 = 0000000000000000
	ldswa	[%i5+%o4]0x89,%l4	! %l4 = 000000003d000000
!	Mem[000000001014142c] = e60a0000, %l2 = 0000000000000000
	ldsb	[%i5+0x02c],%l2		! %l2 = ffffffffffffffe6
!	Mem[00000000100c142e] = 02b36a7f, %l3 = ffffffffffffffff
	lduh	[%i3+0x02e],%l3		! %l3 = 0000000000006a7f

p0_label_141:
!	Starting 10 instruction Store Burst
!	%l6 = ffffffb7, %l7 = 00000061, Mem[0000000010081408] = 00000000 ffaba779
	stda	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffffb7 00000061
!	Mem[00000000100c1406] = 00000070, %l5 = 000000002a000000
	ldstuba	[%i3+0x006]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l4 = 000000003d000000
	swapa	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000
!	%l2 = ffffffe6, %l3 = 00006a7f, Mem[0000000010181420] = 552d8bea 2c856213
	std	%l2,[%i6+0x020]		! Mem[0000000010181420] = ffffffe6 00006a7f
!	Mem[00000000300c1400] = 0022a4b7 43ccfaf1 ff000000 000000a4
!	%f16 = 46000000 43ccfaf1 ff000000 000000a4
!	%f20 = b7a42200 00000000 552d8bea 2c856213
!	%f24 = 18b671f8 0a2a8f29 4fafa800 c38f2266
!	%f28 = 7320b064 12a7e065 6dd4dbc2 79a7ab8b
	stda	%f16,[%i3+%g0]ASI_BLK_S	! Block Store to 00000000300c1400
!	%l2 = ffffffffffffffe6, Mem[0000000010001410] = 54b00d4d
	stba	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = e6b00d4d
!	Mem[0000000010101418] = 552d8bea, %l0 = 00000000da000000
	swap	[%i4+0x018],%l0		! %l0 = 00000000552d8bea
!	%l3 = 0000000000006a7f, Mem[0000000030001410] = 95972cdf
	stba	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = 95972c7f
!	Mem[0000000030141408] = 0000003d, %l7 = 0000000000000061
	swapa	[%i5+%o4]0x81,%l7	! %l7 = 000000000000003d
	membar	#Sync			! Added by membar checker (26)
!	Mem[00000000100c1408] = ffa422ff, %l5 = 0000000000000000
	ldstuba	[%i3+%o4]0x88,%l5	! %l5 = 00000000000000ff

p0_label_142:
!	Starting 10 instruction Load Burst
!	%f28 = 7320b064, %f9  = 0a2a8f29
	fcmps	%fcc3,%f28,%f9 		! %fcc3 = 2
!	Mem[0000000030041410] = 1362852c, %l1 = 0000000000000000
	lduwa	[%i1+%o5]0x89,%l1	! %l1 = 000000001362852c
!	Mem[0000000030001400] = 00000087, %l4 = 0000000000000000
	lduha	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000087
!	Mem[0000000030181410] = 00000000, %l3 = 0000000000006a7f
	lduha	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141400] = 2a000000, %l1 = 000000001362852c
	lduha	[%i5+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001408] = f1facc43 000000ff, %l4 = 00000087, %l5 = 000000ff
	ldda	[%i0+%o4]0x88,%l4	! %l4 = 00000000000000ff 00000000f1facc43
!	Mem[0000000030141408] = 00000061 00004c83, %l6 = ffffffb7, %l7 = 0000003d
	ldda	[%i5+%o4]0x81,%l6	! %l6 = 0000000000000061 0000000000004c83
!	Mem[0000000030101410] = 00c81023, %l3 = 0000000000000000
	lduwa	[%i4+%o5]0x81,%l3	! %l3 = 0000000000c81023
!	Mem[0000000010101400] = 00ff0000 43ccfaf1, %l2 = ffffffe6, %l3 = 00c81023
	ldda	[%i4+%g0]0x80,%l2	! %l2 = 0000000000ff0000 0000000043ccfaf1
!	Mem[0000000030141400] = 2c85621300000000, %f0  = 43ab990b ffc1970c
	ldda	[%i5+%g0]0x81,%f0 	! %f0  = 2c856213 00000000

p0_label_143:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 85000000, %l2 = 0000000000ff0000
	ldstuba	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = 2cdfffff, %l6 = 0000000000000061
	ldstuba	[%i1+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	%f20 = b7a42200 00000000, Mem[0000000010181410] = 000000ff 00000000
	stda	%f20,[%i6+%o5]0x88	! Mem[0000000010181410] = b7a42200 00000000
!	Code Fragment 4, seed = 874230
p0_fragment_18:
!	%l0 = 00000000552d8bea
	setx	0x31e19c7cf0a39676,%g7,%l0 ! %l0 = 31e19c7cf0a39676
!	%l1 = 0000000000000000
	setx	0x61c66b3187e9b9a1,%g7,%l1 ! %l1 = 61c66b3187e9b9a1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 31e19c7cf0a39676
	setx	0x07bf8908917610dc,%g7,%l0 ! %l0 = 07bf8908917610dc
!	%l1 = 61c66b3187e9b9a1
	setx	0x192453199d8f9f27,%g7,%l1 ! %l1 = 192453199d8f9f27
p0_fragment_18_end:
!	%l2 = 0000000000000000, Mem[0000000010001410] = 00004c584d0db0e6
	stxa	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000000000
!	Mem[0000000030101410] = 00c81023, %l7 = 0000000000004c83
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 0000000000c81023
!	%l3 = 0000000043ccfaf1, Mem[0000000010081420] = 9725ca24, %asi = 80
	stwa	%l3,[%i2+0x020]%asi	! Mem[0000000010081420] = 43ccfaf1
!	%l0 = 917610dc, %l1 = 9d8f9f27, Mem[0000000030101400] = e0cb0000 ffcc8537
	stda	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = 917610dc 9d8f9f27
!	Mem[00000000100c1408] = ffa422ff, %l2 = 0000000000000000
	ldstuba	[%i3+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041418] = ff85cbe0, %l6 = 00000000000000ff
	swap	[%i1+0x018],%l6		! %l6 = 00000000ff85cbe0

p0_label_144:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0001] = 000da3b0, %l7 = 0000000000c81023, %asi = 80
	lduba	[%o0+0x001]%asi,%l7	! %l7 = 000000000000000d
!	%f13 = 12a7e065, %f27 = c38f2266, %f3  = 000000a4
	fadds	%f13,%f27,%f3 		! %f3  = c38f2266
!	Mem[0000000010081408] = ffffffb7, %l1 = 192453199d8f9f27
	lduwa	[%i2+%o4]0x88,%l1	! %l1 = 00000000ffffffb7
!	Mem[0000000010081400] = c2dbd46d 0000003d, %l6 = ff85cbe0, %l7 = 0000000d
	ldda	[%i2+%g0]0x88,%l6	! %l6 = 000000000000003d 00000000c2dbd46d
!	Mem[000000001010142e] = 00000046, %l2 = 00000000000000ff, %asi = 80
	lduba	[%i4+0x02e]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1400] = 4600000043ccfaf1, %l4 = 00000000000000ff
	ldxa	[%i3+%g0]0x81,%l4	! %l4 = 4600000043ccfaf1
!	Mem[00000000100c143c] = 5859239b, %l0 = 07bf8908917610dc, %asi = 80
	lduwa	[%i3+0x03c]%asi,%l0	! %l0 = 000000005859239b
!	Mem[0000000030081410] = 00000980, %l1 = 00000000ffffffb7
	lduha	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001410] = 7f2c979512a7e065, %l2 = 0000000000000000
	ldxa	[%i0+%o5]0x81,%l2	! %l2 = 7f2c979512a7e065
!	Mem[0000000010001410] = 00000000 00000000, %l6 = 0000003d, %l7 = c2dbd46d
	ldda	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000 0000000000000000

p0_label_145:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010181410] = 000000000022a4b7
	stx	%l6,[%i6+%o5]		! Mem[0000000010181410] = 0000000000000000
!	%l5 = 00000000f1facc43, Mem[0000000030101410] = 00004c8300000000
	stxa	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000f1facc43
!	%l7 = 0000000000000000, Mem[0000000010041410] = 000000ff
	stba	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%l4 = 4600000043ccfaf1, Mem[00000000218000c0] = 00cd6b00
	sth	%l4,[%o3+0x0c0]		! Mem[00000000218000c0] = faf16b00
!	%l0 = 000000005859239b, Mem[00000000300c1410] = b7a42200
	stba	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 9ba42200
!	Mem[0000000030081410] = 00000980, %l1 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000980
!	Mem[0000000010141408] = 54b00d4d, %l3 = 0000000043ccfaf1
	swapa	[%i5+%o4]0x88,%l3	! %l3 = 0000000054b00d4d
!	Mem[0000000010001408] = 000000ff, %l0 = 000000005859239b
	swapa	[%i0+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000020800000] = 00ffb9e0, %asi = 80
	stha	%l7,[%o1+0x000]%asi	! Mem[0000000020800000] = 0000b9e0
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010101418] = da000000 2c856213
	std	%l6,[%i4+0x018]		! Mem[0000000010101418] = 00000000 00000000

p0_label_146:
!	Starting 10 instruction Load Burst
!	%f11 = 00000000, %f4  = 0000cbe0
	fcmps	%fcc1,%f11,%f4 		! %fcc1 = 1
!	Mem[0000000010181400] = df2c9795b2499c61, %f4  = 0000cbe0 ff85cc0d
	ldda	[%i6+%g0]0x88,%f4 	! %f4  = df2c9795 b2499c61
!	Mem[0000000010081434] = 1c368a02, %f10 = ff000000
	lda	[%i2+0x034]%asi,%f10	! %f10 = 1c368a02
!	Mem[0000000030001400] = 00000087, %f14 = 00000000
	lda	[%i0+%g0]0x89,%f14	! %f14 = 00000087
!	%l0 = 00000000000000ff, imm = 00000000000003a0, %l0 = 00000000000000ff
	xnor	%l0,0x3a0,%l0		! %l0 = fffffffffffffca0
!	%f25 = 0a2a8f29, %f15 = 79a7ab8b, %f2  = ff000000
	fdivs	%f25,%f15,%f2 		! %f2  = 00000000
!	Mem[0000000030141410] = ff000085, %f18 = ff000000
	lda	[%i5+%o5]0x81,%f18	! %f18 = ff000085
!	Mem[0000000010101410] = da000000, %l1 = 0000000000000980
	lduba	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181400] = 3ad6d46d, %l1 = 0000000000000000
	ldsha	[%i6+%g0]0x81,%l1	! %l1 = 0000000000003ad6
!	Mem[0000000010001400] = 000087ff, %l2 = 7f2c979512a7e065
	ldswa	[%i0+%g0]0x88,%l2	! %l2 = 00000000000087ff

p0_label_147:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000054b00d4d, Mem[0000000010101408] = 00000000
	stba	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000004d
!	%l2 = 00000000000087ff, Mem[0000000010101410] = ff000000da000000
	stxa	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000000087ff
!	%l4 = 4600000043ccfaf1, Mem[0000000010081408] = ffffffb7
	stba	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = fffffff1
!	%l1 = 0000000000003ad6, Mem[00000000300c1400] = f1facc4300000046
	stxa	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000000003ad6
!	%l3 = 0000000054b00d4d, Mem[00000000100c1410] = 0022a4b7e60a3a56
	stx	%l3,[%i3+%o5]		! Mem[00000000100c1410] = 0000000054b00d4d
!	%l5 = 00000000f1facc43, %l7 = 0000000000000000, %l2 = 00000000000087ff
	sdivx	%l5,%l7,%l2		! Div by zero, %l0 = fffffffffffffcc8
!	%l0 = fffffcc8, %l1 = 00003ad6, Mem[0000000030141410] = ff000085 000000da
	stda	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = fffffcc8 00003ad6
!	%l6 = 0000000000000000, imm = 00000000000008c1, %l7 = 0000000000000000
	xnor	%l6,0x8c1,%l7		! %l7 = fffffffffffff73e
!	%l4 = 43ccfaf1, %l5 = f1facc43, Mem[0000000010101408] = 0000004d 79a7abff
	stda	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 43ccfaf1 f1facc43
!	Mem[0000000010001408] = 9b235958, %l1 = 0000000000003ad6
	ldstuba	[%i0+%o4]0x80,%l1	! %l1 = 000000000000009b

p0_label_148:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 3ad6d46d 00000000 ff000000 00000000
!	Mem[0000000030181410] = 00000000 c2dbd46d 2bf75871 e23be9b3
!	Mem[0000000030181420] = 6f579718 01dd6bc9 66f7cb16 734b390f
!	Mem[0000000030181430] = 3a505f84 5310df05 563a3be2 71acf72b
	ldda	[%i6+%g0]ASI_BLK_SL,%f0 	! Block Load from 0000000030181400
!	Mem[0000000010001408] = ff235958, %f22 = 552d8bea
	lda	[%i0+%o4]0x80,%f22	! %f22 = ff235958
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000010141400] = 0000002a 00000000 f1facc43 daffcb52
!	Mem[0000000010141410] = 00000129 00002597 20ef580a 00000980
!	Mem[0000000010141420] = 4fafa800 c38f2266 19000000 e60a0000
!	Mem[0000000010141430] = 0dcc8537 8cb61632 4fafa800 e23b3a56
	ldda	[%i5+%g0]ASI_BLK_PL,%f16	! Block Load from 0000000010141400
!	Mem[0000000030041400] = 43ccfaf1, %l3 = 0000000054b00d4d
	lduha	[%i1+%g0]0x89,%l3	! %l3 = 000000000000faf1
!	Mem[0000000030001408] = 00000000, %l0 = fffffffffffffcc8
	lduha	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081408] = f1ffffff, %f15 = e23b3a56
	lda	[%i2+%o4]0x80,%f15	! %f15 = f1ffffff
!	Mem[0000000010181408] = 77985c3d, %l3 = 000000000000faf1
	lduba	[%i6+%o4]0x88,%l3	! %l3 = 000000000000003d
!	Mem[00000000300c1408] = 000000ff, %l6 = 0000000000000000
	lduha	[%i3+%o4]0x89,%l6	! %l6 = 00000000000000ff
	membar	#Sync			! Added by membar checker (28)
!	%l5 = 00000000f1facc43, Mem[0000000010141400] = 2a000000
	stwa	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = f1facc43
!	Mem[0000000030041400] = f1facc43 00000046, %l6 = 000000ff, %l7 = fffff73e
	ldda	[%i1+%g0]0x81,%l6	! %l6 = 00000000f1facc43 0000000000000046

p0_label_149:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[00000000300c1408] = ff000000
	stwa	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	%f11 = 16cbf766, Mem[0000000010081400] = 3d000000
	sta	%f11,[%i2+%g0]0x80	! Mem[0000000010081400] = 16cbf766
!	%l6 = 00000000f1facc43, Mem[0000000030001410] = 95972c7f
	stwa	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = f1facc43
!	%l1 = 000000000000009b, Mem[00000000300c1400] = 00003ad6
	stha	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000009b
!	%l0 = 00000000, %l1 = 0000009b, Mem[0000000010101408] = f1facc43 43ccfaf1
	stda	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000 0000009b
!	%f18 = 52cbffda 43ccfaf1, %l5 = 00000000f1facc43
!	Mem[0000000010101420] = 18ff71f80a2a8f29
	add	%i4,0x020,%g1
	stda	%f18,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010101420] = f1facc430a2a8f29
!	Mem[00000000300c1408] = 00000000, %l6 = 00000000f1facc43
	swapa	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000021800080] = 70d56cd0, %l6 = 0000000000000000
	ldstub	[%o3+0x080],%l6		! %l6 = 0000000000000070
!	Mem[0000000010101400] = 0000ff00, %l5 = 00000000f1facc43
	ldstuba	[%i4+%g0]0x88,%l5	! %l5 = 0000000000000000
!	%l3 = 000000000000003d, Mem[0000000030001400] = 00000087
	stba	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000003d

p0_label_150:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ffb700001c000000, %l5 = 0000000000000000
	ldxa	[%i2+%g0]0x81,%l5	! %l5 = ffb700001c000000
!	Mem[0000000030041408] = 00460000, %l4 = 4600000043ccfaf1
	ldsba	[%i1+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %f18 = 52cbffda
	lda	[%i0+%o4]0x81,%f18	! %f18 = 00000000
!	%l0 = 0000000000000000, imm = 00000000000006af, %l0 = 0000000000000000
	orn	%l0,0x6af,%l0		! %l0 = fffffffffffff950
!	Mem[00000000201c0001] = 000da3b0, %l5 = ffb700001c000000
	ldsb	[%o0+0x001],%l5		! %l5 = 000000000000000d
!	Mem[0000000010041400] = ff000000, %l0 = fffffffffffff950
	ldsba	[%i1+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141408] = 43ccfaf1, %l1 = 000000000000009b
	lduwa	[%i5+%o4]0x88,%l1	! %l1 = 0000000043ccfaf1
!	Mem[0000000030181408] = ff00000000000000, %l3 = 000000000000003d
	ldxa	[%i6+%o4]0x81,%l3	! %l3 = ff00000000000000
!	Mem[0000000010001424] = c38f2266, %f24 = 66228fc3
	lda	[%i0+0x024]%asi,%f24	! %f24 = c38f2266
!	Mem[0000000030141400] = 2c856213, %l0 = 0000000000000000
	ldswa	[%i5+%g0]0x81,%l0	! %l0 = 000000002c856213

p0_label_151:
!	Starting 10 instruction Store Burst
!	%f31 = 00a8af4f, Mem[0000000010001410] = 00000000
	sta	%f31,[%i0+%o5]0x88	! Mem[0000000010001410] = 00a8af4f
!	%l5 = 000000000000000d, Mem[00000000100c1438] = 2a5ec3125859239b, %asi = 80
	stxa	%l5,[%i3+0x038]%asi	! Mem[00000000100c1438] = 000000000000000d
!	%f4  = 6dd4dbc2 00000000, Mem[0000000030181410] = 00000000 6dd4dbc2
	stda	%f4 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 6dd4dbc2 00000000
!	%l2 = 000087ff, %l3 = 00000000, Mem[0000000010081400] = 66f7cb16 c2dbd46d
	stda	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 000087ff 00000000
!	Mem[0000000010141433] = 0dcc8537, %l7 = 0000000000000046
	ldstub	[%i5+0x033],%l7		! %l7 = 0000000000000037
!	%l0 = 000000002c856213, Mem[0000000010181438] = 000000000022a4b7
	stx	%l0,[%i6+0x038]		! Mem[0000000010181438] = 000000002c856213
!	%l0 = 000000002c856213, Mem[0000000030141408] = 834c000061000000
	stxa	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000002c856213
!	%l2 = 00000000000087ff, Mem[0000000010041408] = c754693f2cdfffff
	stxa	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000000087ff
!	%f18 = 00000000 43ccfaf1, Mem[0000000010081410] = 00000000 00000000, %asi = 80
	stda	%f18,[%i2+0x010]%asi	! Mem[0000000010081410] = 00000000 43ccfaf1
!	%l5 = 000000000000000d, Mem[0000000010041408] = ff870000
	stwa	%l5,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000000d

p0_label_152:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000 00000000, %l0 = 2c856213, %l1 = 43ccfaf1
	ldda	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010001408] = 585923ff, %l2 = 00000000000087ff
	ldsha	[%i0+%o4]0x88,%l2	! %l2 = 00000000000023ff
!	Mem[0000000030041410] = 0022a4b7 1362852c, %l4 = 00000000, %l5 = 0000000d
	ldda	[%i1+%o5]0x89,%l4	! %l4 = 000000001362852c 000000000022a4b7
!	Mem[0000000010101400] = ffff0000, %l4 = 000000001362852c
	ldswa	[%i4+%g0]0x80,%l4	! %l4 = ffffffffffff0000
!	%l4 = ffffffffffff0000, %l2 = 00000000000023ff, %l5 = 000000000022a4b7
	sdivx	%l4,%l2,%l5		! %l5 = fffffffffffffff9
!	Mem[0000000010141411] = 00000129, %l0 = 0000000000000000, %asi = 80
	lduba	[%i5+0x011]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0000] = 000da3b0, %l5 = fffffffffffffff9, %asi = 80
	lduha	[%o0+0x000]%asi,%l5	! %l5 = 000000000000000d
!	Mem[000000001014142f] = e60a0000, %l4 = ffffffffffff0000, %asi = 80
	ldsba	[%i5+0x02f]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %l1 = 0000000000000000
	lduba	[%i4+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081428] = ffc4787f, %l6 = 0000000000000070, %asi = 80
	ldswa	[%i2+0x028]%asi,%l6	! %l6 = ffffffffffc4787f

p0_label_153:
!	Starting 10 instruction Store Burst
!	%l2 = 000023ff, %l3 = 00000000, Mem[0000000010101418] = 00000000 00000000, %asi = 80
	stda	%l2,[%i4+0x018]%asi	! Mem[0000000010101418] = 000023ff 00000000
!	%l6 = ffffffffffc4787f, imm = fffffffffffff14f, %l0 = 0000000000000000
	orn	%l6,-0xeb1,%l0		! %l0 = ffffffffffc47eff
!	%l6 = ffffffffffc4787f, Mem[0000000010041430] = 60235074, %asi = 80
	stwa	%l6,[%i1+0x030]%asi	! Mem[0000000010041430] = ffc4787f
!	%f0  = 00000000 6dd4d63a, %l5 = 000000000000000d
!	Mem[0000000010041410] = 0000000000000000
	add	%i1,0x010,%g1
	stda	%f0,[%g1+%l5]ASI_PST8_P ! Mem[0000000010041410] = 000000006dd4003a
!	Mem[00000000100c1400] = 3d5c9877 0000ff70 ff22a4ff 4c000000
!	%f16 = 00000000 2a000000 00000000 43ccfaf1
!	%f20 = 97250000 29010000 80090000 0a58ef20
!	%f24 = c38f2266 00a8af4f 00000ae6 00000019
!	%f28 = 3216b68c 3785cc0d 563a3be2 00a8af4f
	stda	%f16,[%i3+%g0]ASI_BLK_P	! Block Store to 00000000100c1400
!	%l0 = ffffffffffc47eff, immd = fffff6c1, %y  = 0000239a
	udiv	%l0,-0x93f,%l3		! %l3 = 000000000000239b
	mov	%l0,%y			! %y = ffc47eff
!	%l2 = 00000000000023ff, Mem[0000000030181400] = 3ad6d46d
	stba	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = ffd6d46d
!	%l3 = 000000000000239b, Mem[0000000010181416] = 00000000
	sth	%l3,[%i6+0x016]		! Mem[0000000010181414] = 0000239b
!	Mem[0000000010001408] = ff235958, %l3 = 000000000000239b
	swapa	[%i0+%o4]0x80,%l3	! %l3 = 00000000ff235958
!	Mem[0000000030041410] = 1362852c, %l3 = 00000000ff235958
	swapa	[%i1+%o5]0x89,%l3	! %l3 = 000000001362852c

p0_label_154:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = f1facc43, %l2 = 00000000000023ff
	lduha	[%i1+%g0]0x81,%l2	! %l2 = 000000000000f1fa
!	Mem[0000000010101408] = 00000000, %f4  = 6dd4dbc2
	lda	[%i4+%o4]0x80,%f4 	! %f4 = 00000000
!	Mem[0000000030141400] = 2c856213, %l6 = ffffffffffc4787f
	lduha	[%i5+%g0]0x81,%l6	! %l6 = 0000000000002c85
!	Mem[0000000030101400] = dc107691, %l0 = ffffffffffc47eff
	ldswa	[%i4+%g0]0x81,%l0	! %l0 = ffffffffdc107691
!	Mem[0000000030041400] = 43ccfaf1, %l4 = 0000000000000000
	ldsba	[%i1+%g0]0x89,%l4	! %l4 = fffffffffffffff1
!	Mem[0000000030001410] = f1facc43, %l0 = ffffffffdc107691
	lduwa	[%i0+%o5]0x89,%l0	! %l0 = 00000000f1facc43
!	Mem[0000000010181400] = b2499c61, %l2 = 000000000000f1fa
	ldsha	[%i6+%g0]0x88,%l2	! %l2 = ffffffffffff9c61
!	Mem[0000000030041408] = 0046000077985c3d, %f14 = 2bf7ac71 f1ffffff
	ldda	[%i1+%o4]0x81,%f14	! %f14 = 00460000 77985c3d
!	Mem[0000000030041400] = f1facc43 00000046, %l0 = f1facc43, %l1 = 00000000
	ldda	[%i1+%g0]0x81,%l0	! %l0 = 00000000f1facc43 0000000000000046
!	Mem[0000000030141410] = fffffcc8, %l2 = ffffffffffff9c61
	lduba	[%i5+%o5]0x81,%l2	! %l2 = 00000000000000ff

p0_label_155:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 000087ff, %l2 = 00000000000000ff
	ldstuba	[%i2+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%l4 = fffffffffffffff1, Mem[0000000010141408] = 52cbffda43ccfaf1
	stxa	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = fffffffffffffff1
!	%l4 = fffffff1, %l5 = 0000000d, Mem[0000000010041400] = 000000ff 2f9894df
	stda	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = fffffff1 0000000d
!	%f9  = 1897576f, %f8  = c96bdd01
	fcmps	%fcc2,%f9 ,%f8 		! %fcc2 = 2
!	%f18 = 00000000, %f29 = 3785cc0d
	fcmps	%fcc3,%f18,%f29		! %fcc3 = 1
!	%l2 = 00000000000000ff, Mem[0000000010141410] = 9725000029010000
	stxa	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000000000ff
!	%l0 = f1facc43, %l1 = 00000046, Mem[0000000010041408] = 0000000d 00000000
	stda	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = f1facc43 00000046
!	Mem[0000000010181400] = 619c49b2, %l3 = 000000001362852c
	swapa	[%i6+%g0]0x80,%l3	! %l3 = 00000000619c49b2
!	Mem[0000000010081428] = ffc4787fb7ff22ff, %l7 = 0000000000000037, %l5 = 000000000000000d
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l7,%l5	! %l5 = ffc4787fb7ff22ff
!	%f10 = 0f394b73 16cbf766, %l2 = 00000000000000ff
!	Mem[0000000010141430] = 0dcc85ff8cb61632
	add	%i5,0x030,%g1
	stda	%f10,[%g1+%l2]ASI_PST8_P ! Mem[0000000010141430] = 0f394b7316cbf766

p0_label_156:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 408b2a9a 00000023, %l0 = f1facc43, %l1 = 00000046
	ldda	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000023 00000000408b2a9a
!	Mem[0000000030141410] = fffffcc8, %l2 = 00000000000000ff
	lduha	[%i5+%o5]0x81,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030141408] = 1362852c, %l1 = 00000000408b2a9a
	ldsha	[%i5+%o4]0x81,%l1	! %l1 = 0000000000001362
!	Mem[0000000010081410] = 00000000 43ccfaf1, %l0 = 00000023, %l1 = 00001362
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000 0000000043ccfaf1
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000010001400] = ff870000 00000000 0000239b 43ccfaf1
!	Mem[0000000010001410] = 4fafa800 00000000 00000024 daffcb52
!	Mem[0000000010001420] = f1facc43 c38f2266 da9f434b 00000019
!	Mem[0000000010001430] = 0dcc8537 8cb61632 97250000 00000000
	ldda	[%i0+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010001400
!	%l1 = 0000000043ccfaf1, immd = fffffd35, %y  = ffc47eff
	umul	%l1,-0x2cb,%l0		! %l0 = 43ccfa33a27f20e5, %y = 43ccfa33
!	Mem[0000000030041400] = f1facc43 00000046, %l2 = 0000ffff, %l3 = 619c49b2
	ldda	[%i1+%g0]0x81,%l2	! %l2 = 00000000f1facc43 0000000000000046
!	Mem[0000000021800140] = 4bc5db60, %l0 = 43ccfa33a27f20e5, %asi = 80
	ldsha	[%o3+0x140]%asi,%l0	! %l0 = 0000000000004bc5
!	Mem[00000000300c1400] = 9b000000, %l1 = 0000000043ccfaf1
	lduha	[%i3+%g0]0x81,%l1	! %l1 = 0000000000009b00
!	Mem[00000000201c0000] = 000da3b0, %l5 = ffc4787fb7ff22ff, %asi = 80
	ldsha	[%o0+0x000]%asi,%l5	! %l5 = 000000000000000d

p0_label_157:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 000087ff, %l4 = 00000000fffffff1
	swapa	[%i0+%g0]0x88,%l4	! %l4 = 00000000000087ff
!	%l2 = 00000000f1facc43, Mem[0000000010081400] = ff87000000000000
	stxa	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000f1facc43
!	%l6 = 00002c85, %l7 = 00000037, Mem[0000000010101420] = f1facc43 0a2a8f29
	std	%l6,[%i4+0x020]		! Mem[0000000010101420] = 00002c85 00000037
!	Mem[00000000201c0000] = 000da3b0, %l3 = 0000000000000046
	ldstub	[%o0+%g0],%l3		! %l3 = 0000000000000000
!	Mem[0000000010041400] = fffffff1 0000000d f1facc43 00000046
!	%f16 = 00000000 000087ff f1facc43 9b230000
!	%f20 = 00000000 00a8af4f 52cbffda 24000000
!	%f24 = 66228fc3 43ccfaf1 19000000 4b439fda
!	%f28 = 3216b68c 3785cc0d 00000000 00002597
	stda	%f16,[%i1+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010041400
!	Mem[000000001008140c] = 61000000, %l3 = 00000000, %l3 = 00000000
	add	%i2,0x0c,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 0000000061000000
!	%l0 = 0000000000004bc5, Mem[0000000030141400] = 1362852c
	stha	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 13624bc5
!	%l4 = 00000000000087ff, Mem[0000000030141408] = 2c856213
	stba	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 2c8562ff
!	%l3 = 0000000061000000, Mem[0000000010101418] = 000023ff00000000, %asi = 80
	stxa	%l3,[%i4+0x018]%asi	! Mem[0000000010101418] = 0000000061000000
!	%l0 = 0000000000004bc5, Mem[0000000010141409] = f1ffffff, %asi = 80
	stba	%l0,[%i5+0x009]%asi	! Mem[0000000010141408] = f1c5ffff

p0_label_158:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00460000, %f3  = 000000ff
	lda	[%i1+%o4]0x81,%f3 	! %f3 = 00460000
!	Mem[0000000010181400] = 1362852c, %l5 = 000000000000000d
	ldsha	[%i6+%g0]0x80,%l5	! %l5 = 0000000000001362
!	Mem[0000000010141430] = 0f394b7316cbf766, %l5 = 0000000000001362
	ldx	[%i5+0x030],%l5		! %l5 = 0f394b7316cbf766
!	Mem[0000000010101438] = 00000000, %f0  = 00000000
	ld	[%i4+0x038],%f0 	! %f0 = 00000000
!	Mem[0000000010181410] = 9b23000000000000, %l3 = 0000000061000000
	ldxa	[%i6+%o5]0x88,%l3	! %l3 = 9b23000000000000
!	Mem[00000000300c1410] = 0022a49b, %l0 = 0000000000004bc5
	ldsba	[%i3+%o5]0x89,%l0	! %l0 = ffffffffffffff9b
!	Mem[0000000030041408] = 00460000 77985c3d, %l6 = 00002c85, %l7 = 00000037
	ldda	[%i1+%o4]0x81,%l6	! %l6 = 0000000000460000 0000000077985c3d
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000010041410] = 00a8af4f, %l7 = 0000000077985c3d
	lduwa	[%i1+%o5]0x88,%l7	! %l7 = 0000000000a8af4f
!	Mem[0000000030001400] = 3d000000, %l1 = 0000000000009b00
	ldsba	[%i0+%g0]0x81,%l1	! %l1 = 000000000000003d
!	Mem[00000000100c1408] = 00000000, %l0 = ffffffffffffff9b
	lduha	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000000

p0_label_159:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = f1ffffff, %l7 = 0000000000a8af4f
	swapa	[%i2+%o4]0x80,%l7	! %l7 = 00000000f1ffffff
!	Mem[0000000010101438] = 00000000000087ff, %l5 = 0f394b7316cbf766, %l4 = 00000000000087ff
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l5,%l4	! %l4 = 00000000000087ff
!	%f0  = 00000000, Mem[0000000010041400] = 000087ff
	sta	%f0 ,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	%l5 = 0f394b7316cbf766, Mem[00000000300c1410] = 9ba42200
	stwa	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 16cbf766
!	%l7 = 00000000f1ffffff, Mem[0000000010001408] = 0000239b43ccfaf1
	stxa	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000f1ffffff
!	%f0  = 00000000 6dd4d63a, %l1 = 000000000000003d
!	Mem[0000000030001428] = 676caed6156b35cf
	add	%i0,0x028,%g1
	stda	%f0,[%g1+%l1]ASI_PST16_S ! Mem[0000000030001428] = 00000000156bd63a
!	%l4 = 00000000000087ff, Mem[0000000010141410] = 000000ff
	stba	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff
!	%f7  = 7158f72b, Mem[0000000030041408] = 00004600
	sta	%f7 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 7158f72b
!	Mem[0000000030101410] = 00000000, %l6 = 0000000000460000
	swapa	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l3 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000000

p0_label_160:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00a8af4f, %l0 = 0000000000000000
	lduha	[%i2+%o4]0x80,%l0	! %l0 = 00000000000000a8
!	Mem[0000000030141410] = d63a0000c8fcffff, %f24 = 66228fc3 43ccfaf1
	ldda	[%i5+%o5]0x89,%f24	! %f24 = d63a0000 c8fcffff
!	Mem[0000000030141400] = 13624bc5, %l1 = 000000000000003d
	lduha	[%i5+%g0]0x89,%l1	! %l1 = 0000000000004bc5
!	Mem[0000000030181410] = 00000000c2dbd46d, %l6 = 0000000000000000
	ldxa	[%i6+%o5]0x81,%l6	! %l6 = 00000000c2dbd46d
!	Mem[0000000010001408] = 00000000, %l4 = 00000000000087ff
	lduw	[%i0+%o4],%l4		! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (31)
!	Mem[0000000030001400] = 3d000000 00002597 00000000 6cd291d7
!	Mem[0000000030001410] = 43ccfaf1 12a7e065 5167afca 5f1f0a73
!	Mem[0000000030001420] = 68f4bcd8 03736289 00000000 156bd63a
!	Mem[0000000030001430] = 7e2b7144 6c4991c5 408b2a9a 0000003c
	ldda	[%i0+%g0]ASI_BLK_AIUSL,%f0 	! Block Load from 0000000030001400
!	Mem[0000000010041410] = 00a8af4f, %l1 = 0000000000004bc5
	ldswa	[%i1+%o5]0x88,%l1	! %l1 = 0000000000a8af4f
!	Mem[0000000010001400] = f1ffffff00000000, %l7 = 00000000f1ffffff
	ldxa	[%i0+%g0]0x80,%l7	! %l7 = f1ffffff00000000
!	Mem[00000000100c1410] = 9725000029010000, %f28 = 3216b68c 3785cc0d, %asi = 80
	ldda	[%i3+0x010]%asi,%f28	! %f28 = 97250000 29010000
!	Mem[0000000010141400] = 43ccfaf100000000, %l1 = 0000000000a8af4f
	ldxa	[%i5+%g0]0x80,%l1	! %l1 = 43ccfaf100000000

p0_label_161:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 00460000, %l7 = f1ffffff00000000
	ldstuba	[%i4+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101401] = ffff0000, %l0 = 00000000000000a8
	ldstub	[%i4+0x001],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010181410] = 000000000000239b, %l1 = 43ccfaf100000000, %l3 = 0000000000000000
	add	%i6,0x10,%g1
	casxa	[%g1]0x80,%l1,%l3	! %l3 = 000000000000239b
!	%l4 = 0000000000000000, Mem[0000000030081410] = 00000000
	stba	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	%f22 = 52cbffda 24000000, %l5 = 0f394b7316cbf766
!	Mem[0000000030081408] = 230000009a2a8b40
	add	%i2,0x008,%g1
	stda	%f22,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030081408] = 230000009affcb40
!	%l5 = 0f394b7316cbf766, Mem[0000000030101410] = 43ccfaf1004600ff
	stxa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 0f394b7316cbf766
	membar	#Sync			! Added by membar checker (32)
!	%l4 = 00000000, %l5 = 16cbf766, Mem[0000000030001400] = 0000003d 97250000
	stda	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 16cbf766
!	Mem[0000000010181420] = ffffffe600006a7f, %l3 = 000000000000239b, %l0 = 00000000000000ff
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l3,%l0	! %l0 = ffffffe600006a7f
!	%f16 = 00000000 000087ff, Mem[0000000030001400] = 00000000 16cbf766
	stda	%f16,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 000087ff
!	%l0 = 00006a7f, %l1 = 00000000, Mem[00000000100c1400] = 00000000 2a000000
	stda	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00006a7f 00000000

p0_label_162:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101434] = 57d10bf9, %l5 = 0f394b7316cbf766
	ldsw	[%i4+0x034],%l5		! %l5 = 0000000057d10bf9
!	%l2 = 00000000f1facc43, imm = fffffffffffff2d2, %l4 = 0000000000000000
	xnor	%l2,-0xd2e,%l4		! %l4 = 00000000f1fac16e
!	%l6 = 00000000c2dbd46d, imm = fffffffffffff034, %l0 = ffffffe600006a7f
	orn	%l6,-0xfcc,%l0		! %l0 = 00000000c2dbdfef
!	Mem[0000000010081410] = 00000000, %l5 = 0000000057d10bf9
	lduha	[%i2+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1400] = 7f6a0000, %l4 = 00000000f1fac16e
	ldsha	[%i3+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l7 = 0000000000000000
	lduwa	[%i2+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = 00006a7f 00000000, %l2 = f1facc43, %l3 = 0000239b
	ldd	[%i3+%g0],%l2		! %l2 = 0000000000006a7f 0000000000000000
!	Mem[0000000030081408] = 40cbff9a00000023, %f22 = 52cbffda 24000000
	ldda	[%i2+%o4]0x89,%f22	! %f22 = 40cbff9a 00000023
!	Mem[0000000010141438] = 4fafa800, %f2  = d791d26c
	ld	[%i5+0x038],%f2 	! %f2 = 4fafa800
!	Mem[0000000010001400] = fffffff1, %l7 = 0000000000000000
	ldsha	[%i0+%g0]0x88,%l7	! %l7 = fffffffffffffff1

p0_label_163:
!	Starting 10 instruction Store Burst
!	%l0 = c2dbdfef, %l1 = 00000000, Mem[0000000030101410] = 66f7cb16 734b390f
	stda	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = c2dbdfef 00000000
!	%f30 = 00000000 00002597, Mem[0000000010081400] = 00000000 43ccfaf1
	stda	%f30,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000 00002597
!	%l6 = 00000000c2dbd46d, Mem[0000000010001400] = f1ffffff
	stw	%l6,[%i0+%g0]		! Mem[0000000010001400] = c2dbd46d
!	%l2 = 00006a7f, %l3 = 00000000, Mem[0000000010101400] = ffff0000 43ccfaf1
	stda	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 00006a7f 00000000
!	%l5 = 0000000000000000, Mem[0000000010101410] = ff870000
	stha	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	%l5 = 0000000000000000, Mem[0000000010141400] = 43ccfaf100000000
	stxa	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000030001408] = 00000000
	stba	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	%l4 = 0000000000000000, imm = fffffffffffff03e, %l0 = 00000000c2dbdfef
	xor	%l4,-0xfc2,%l0		! %l0 = fffffffffffff03e
!	%l3 = 0000000000000000, Mem[0000000010081410] = 00000000
	stba	%l3,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000
!	%f26 = 19000000 4b439fda, Mem[00000000300c1400] = 0000009b 00000000
	stda	%f26,[%i3+%g0]0x89	! Mem[00000000300c1400] = 19000000 4b439fda

p0_label_164:
!	Starting 10 instruction Load Burst
!	Mem[000000001018140a] = 3d5c9877, %l5 = 0000000000000000, %asi = 80
	lduba	[%i6+0x00a]%asi,%l5	! %l5 = 0000000000000098
!	Mem[0000000030001410] = 65e0a712f1facc43, %l7 = fffffffffffffff1
	ldxa	[%i0+%o5]0x89,%l7	! %l7 = 65e0a712f1facc43
!	Mem[00000000100c1408] = 00000000, %f16 = 00000000
	lda	[%i3+0x008]%asi,%f16	! %f16 = 00000000
!	Mem[00000000201c0000] = ff0da3b0, %l1 = 43ccfaf100000000
	ldsb	[%o0+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000030081410] = 7000000000000000, %l2 = 0000000000006a7f
	ldxa	[%i2+%o5]0x89,%l2	! %l2 = 7000000000000000
!	%l5 = 0000000000000098, immd = 0000000000000572, %l108 = 0000000000000000
	udivx	%l5,0x572,%l0		! %l0 = 0000000000000000
!	Mem[0000000010181418] = 1be0005a, %l0 = 0000000000000000, %asi = 80
	ldswa	[%i6+0x018]%asi,%l0	! %l0 = 000000001be0005a
!	Code Fragment 4, seed = 687296
p0_fragment_19:
!	%l0 = 000000001be0005a
	setx	0xf3b8e86b967c5226,%g7,%l0 ! %l0 = f3b8e86b967c5226
!	%l1 = ffffffffffffffff
	setx	0xc6dd9536c1d36651,%g7,%l1 ! %l1 = c6dd9536c1d36651
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f3b8e86b967c5226
	setx	0x8ffae7fe2a31de8c,%g7,%l0 ! %l0 = 8ffae7fe2a31de8c
!	%l1 = c6dd9536c1d36651
	setx	0x5724e2975fd7bdd7,%g7,%l1 ! %l1 = 5724e2975fd7bdd7
p0_fragment_19_end:
!	Mem[0000000010141400] = 00000000 00000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i5+%g0]0x88,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010181410] = 00000000, %f9  = d8bcf468
	lda	[%i6+%o5]0x88,%f9 	! %f9 = 00000000

p0_label_165:
!	Starting 10 instruction Store Burst
!	%l0 = 8ffae7fe2a31de8c, Mem[00000000100c141c] = 0a58ef20
	stw	%l0,[%i3+0x01c]		! Mem[00000000100c141c] = 2a31de8c
!	%l3 = 0000000000000000, Mem[0000000010001408] = 00000000
	stba	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	Mem[0000000030041400] = 43ccfaf1, %l7 = 65e0a712f1facc43
	ldstuba	[%i1+%g0]0x89,%l7	! %l7 = 00000000000000f1
!	%f2  = 4fafa800 00000000, %l3 = 0000000000000000
!	Mem[0000000010081400] = 9725000000000000
	stda	%f2,[%i2+%l3]ASI_PST16_PL ! Mem[0000000010081400] = 9725000000000000
!	Mem[0000000010001400] = 6dd4dbc2, %l6 = 00000000c2dbd46d
	swapa	[%i0+%g0]0x88,%l6	! %l6 = 000000006dd4dbc2
!	%l0 = 2a31de8c, %l1 = 5fd7bdd7, Mem[00000000100c1408] = 00000000 43ccfaf1
	stda	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 2a31de8c 5fd7bdd7
!	Mem[0000000010081434] = 1c368a02, %l2 = 00000000, %l5 = 00000098
	add	%i2,0x34,%g1
	casa	[%g1]0x80,%l2,%l5	! %l5 = 000000001c368a02
!	Mem[0000000030081400] = ffb70000, %l2 = 0000000000000000
	ldstuba	[%i2+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141400] = 13624bc5, %l5 = 000000001c368a02
	swapa	[%i5+%g0]0x89,%l5	! %l5 = 0000000013624bc5
!	%l3 = 0000000000000000, Mem[0000000020800040] = 37004c10, %asi = 80
	stba	%l3,[%o1+0x040]%asi	! Mem[0000000020800040] = 00004c10

p0_label_166:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 7000000000000000, %l1 = 5724e2975fd7bdd7
	ldxa	[%i2+%o5]0x89,%l1	! %l1 = 7000000000000000
!	Mem[0000000010001408] = 00000000, %l6 = 000000006dd4dbc2
	ldswa	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000020800001] = 0000b9e0, %l2 = 00000000000000ff
	ldsb	[%o1+0x001],%l2		! %l2 = 0000000000000000
!	%f22 = 40cbff9a, %f12 = c591496c
	fcmpes	%fcc2,%f22,%f12		! %fcc2 = 2
!	Mem[0000000010081418] = 43f05d0f, %l3 = 0000000000000000, %asi = 80
	ldswa	[%i2+0x018]%asi,%l3	! %l3 = 0000000043f05d0f
!	Mem[00000000300c1410] = 16cbf766, %l1 = 7000000000000000
	ldsba	[%i3+%o5]0x81,%l1	! %l1 = 0000000000000016
!	%l3 = 0000000043f05d0f, imm = fffffffffffffb09, %l7 = 00000000000000f1
	orn	%l3,-0x4f7,%l7		! %l7 = 0000000043f05dff
!	Mem[0000000010181400] = 2c856213, %f20 = 00000000
	lda	[%i6+%g0]0x88,%f20	! %f20 = 2c856213
!	Mem[0000000010141410] = 00000000000000ff, %f22 = 40cbff9a 00000023
	ldda	[%i5+%o5]0x88,%f22	! %f22 = 00000000 000000ff
!	Mem[0000000010041407] = 00000000, %l2 = 0000000000000000, %asi = 80
	ldsba	[%i1+0x007]%asi,%l2	! %l2 = 0000000000000000

p0_label_167:
!	Starting 10 instruction Store Burst
!	Mem[0000000020800041] = 00004c10, %l3 = 0000000043f05d0f
	ldstuba	[%o1+0x041]%asi,%l3	! %l3 = 0000000000000000
!	%l7 = 0000000043f05dff, Mem[0000000010081438] = 0000000000000000, %asi = 80
	stxa	%l7,[%i2+0x038]%asi	! Mem[0000000010081438] = 0000000043f05dff
!	%f26 = 19000000 4b439fda, %l6 = 0000000000000000
!	Mem[0000000010141420] = 4fafa800c38f2266
	add	%i5,0x020,%g1
	stda	%f26,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010141420] = 4fafa800c38f2266
!	%l3 = 0000000000000000, Mem[0000000030041400] = 43ccfaff
	stha	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = 43cc0000
!	Mem[0000000010081400] = 97250000, %l0 = 000000002a31de8c
	swapa	[%i2+%g0]0x80,%l0	! %l0 = 0000000097250000
!	Mem[0000000010081420] = 43ccfaf10000361c, %l6 = 0000000000000000, %l5 = 0000000013624bc5
	add	%i2,0x20,%g1
	casxa	[%g1]0x80,%l6,%l5	! %l5 = 43ccfaf10000361c
!	Mem[0000000010001408] = 00000000, %l7 = 0000000043f05dff
	swapa	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l0 = 0000000097250000
	ldstuba	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	%f6  = 730a1f5f caaf6751, %l2 = 0000000000000000
!	Mem[0000000010141420] = 4fafa800c38f2266
	add	%i5,0x020,%g1
	stda	%f6,[%g1+%l2]ASI_PST32_P ! Mem[0000000010141420] = 4fafa800c38f2266
!	%f8  = 89627303 00000000, Mem[0000000010101418] = 00000000 61000000
	std	%f8 ,[%i4+0x018]	! Mem[0000000010101418] = 89627303 00000000

p0_label_168:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 6dd4d6ff, %l3 = 0000000000000000
	lduba	[%i6+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181410] = 000000000000239b, %f16 = 00000000 000087ff
	ldda	[%i6+%o5]0x80,%f16	! %f16 = 00000000 0000239b
!	Mem[0000000010181400] = 1362852c95972cdf, %l6 = 0000000000000000
	ldxa	[%i6+%g0]0x80,%l6	! %l6 = 1362852c95972cdf
!	Mem[0000000010041400] = 00000000, %l6 = 0000000095972cdf
	swapa	[%i1+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141408] = f1c5ffff, %l1 = 0000000000000016
	ldsba	[%i5+%o4]0x80,%l1	! %l1 = fffffffffffffff1
!	Mem[000000001014143c] = e23b3a56, %l5 = 43ccfaf10000361c
	ldsw	[%i5+0x03c],%l5		! %l5 = ffffffffe23b3a56
!	Mem[0000000030041410] = 585923ff b7a42200, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i1+%o5]0x81,%l2	! %l2 = 00000000585923ff 00000000b7a42200
!	Mem[0000000030141408] = ff62852c, %l2 = 00000000585923ff
	lduwa	[%i5+%o4]0x81,%l2	! %l2 = 00000000ff62852c
!	Mem[0000000020800000] = 0000b9e0, %l6 = 0000000000000000, %asi = 80
	ldsba	[%o1+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = 6dd4dbc2, %l6 = 0000000000000000
	ldsba	[%i0+%g0]0x80,%l6	! %l6 = 000000000000006d

p0_label_169:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (33)
!	Mem[0000000010041400] = df2c9795 00000000 0000239b 43ccfaf1
!	Mem[0000000010041410] = 4fafa800 00000000 00000024 daffcb52
!	Mem[0000000010041420] = f1facc43 c38f2266 da9f434b 00000019
!	Mem[0000000010041430] = 0dcc8537 8cb61632 97250000 00000000
	ldda	[%i1+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010041400
!	Mem[0000000010001418] = 00000024daffcb52, %l6 = 000000000000006d, %l3 = 00000000b7a42200
	add	%i0,0x18,%g1
	casxa	[%g1]0x80,%l6,%l3	! %l3 = 00000024daffcb52
!	%l4 = 0000000000000000, Mem[0000000030101400] = 917610dc
	stba	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 91761000
!	%l0 = 0000000000000000, Mem[0000000010101410] = 0000000000000000
	stxa	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000000000000
!	%l4 = 00000000, %l5 = e23b3a56, Mem[0000000030141408] = 2c8562ff 00000000
	stda	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000 e23b3a56
!	%f7  = daffcb52, %f5  = 00000000, %f26 = 19000000
	fadds	%f7 ,%f5 ,%f26		! %f26 = daffcb52
!	%l7 = 0000000000000000, Mem[00000000100c1410] = 97250000
	stba	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00250000
!	%l1 = fffffffffffffff1, Mem[0000000030001408] = 00000000
	stba	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000f1
!	Mem[0000000030041410] = ff235958, %l7 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l7	! %l7 = 0000000000000058
!	%l7 = 0000000000000058, Mem[00000000300c1400] = da9f434b
	stwa	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000058

p0_label_170:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101433] = 00005859, %l1 = fffffffffffffff1, %asi = 80
	ldsba	[%i4+0x033]%asi,%l1	! %l1 = 0000000000000059
!	Mem[0000000030001408] = f10000006cd291d7, %f24 = d63a0000 c8fcffff
	ldda	[%i0+%o4]0x81,%f24	! %f24 = f1000000 6cd291d7
!	Mem[00000000300c1408] = 43ccfaf1000000a4, %f16 = 00000000 0000239b
	ldda	[%i3+%o4]0x81,%f16	! %f16 = 43ccfaf1 000000a4
!	Mem[00000000100c1400] = 7f6a0000, %f26 = daffcb52
	lda	[%i3+%g0]0x88,%f26	! %f26 = 7f6a0000
!	Mem[0000000010181410] = 00000000, %f25 = 6cd291d7
	lda	[%i6+%o5]0x80,%f25	! %f25 = 00000000
	membar	#Sync			! Added by membar checker (34)
!	Mem[00000000300c1400] = 00000058 00000019 43ccfaf1 000000a4
!	Mem[00000000300c1410] = 16cbf766 00000000 552d8bea 2c856213
!	Mem[00000000300c1420] = 18b671f8 0a2a8f29 4fafa800 c38f2266
!	Mem[00000000300c1430] = 7320b064 12a7e065 6dd4dbc2 79a7ab8b
	ldda	[%i3+%g0]ASI_BLK_SL,%f0 	! Block Load from 00000000300c1400
!	Mem[0000000010081400] = 00000000 8cde312a, %l6 = 0000006d, %l7 = 00000058
	ldda	[%i2+%g0]0x88,%l6	! %l6 = 000000008cde312a 0000000000000000
!	Mem[0000000010141400] = 00000000, %l2 = 00000000ff62852c
	ldswa	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = 00a8af4f 61000000, %l6 = 8cde312a, %l7 = 00000000
	ldda	[%i2+%o4]0x80,%l6	! %l6 = 0000000000a8af4f 0000000061000000
!	Mem[0000000010001410] = 00a8af4f, %l3 = 00000024daffcb52
	lduha	[%i0+%o5]0x88,%l3	! %l3 = 000000000000af4f

p0_label_171:
!	Starting 10 instruction Store Burst
!	Mem[000000001000142d] = 00000019, %l6 = 0000000000a8af4f
	ldstuba	[%i0+0x02d]%asi,%l6	! %l6 = 0000000000000000
!	%f10 = 66228fc3 00a8af4f, %l4 = 0000000000000000
!	Mem[0000000030081420] = 9725ca243e295957
	add	%i2,0x020,%g1
	stda	%f10,[%g1+%l4]ASI_PST16_S ! Mem[0000000030081420] = 9725ca243e295957
!	%f2  = a4000000, Mem[0000000010081410] = 000000ff
	sta	%f2 ,[%i2+%o5]0x88	! Mem[0000000010081410] = a4000000
!	Mem[0000000010181400] = 1362852c, %l5 = 00000000e23b3a56
	swapa	[%i6+%g0]0x80,%l5	! %l5 = 000000001362852c
!	%l0 = 0000000000000000, Mem[00000000100c1410] = 00002500
	stba	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00002500
!	Mem[00000000211c0001] = ffff5a40, %l4 = 0000000000000000
	ldstuba	[%o2+0x001]%asi,%l4	! %l4 = 00000000000000ff
!	%f4  = 00000000 66f7cb16, Mem[00000000100c1410] = 00250000 29010000
	std	%f4 ,[%i3+%o5]		! Mem[00000000100c1410] = 00000000 66f7cb16
!	%l1 = 0000000000000059, Mem[0000000030181408] = ff000000
	stwa	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000059
!	%l3 = 000000000000af4f, Mem[0000000030101400] = 00107691279f8f9d
	stxa	%l3,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000000000af4f
!	%l4 = 000000ff, %l5 = 1362852c, Mem[00000000100c1408] = 2a31de8c 5fd7bdd7
	stda	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ff 1362852c

p0_label_172:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l1 = 0000000000000059
	ldsha	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000211c0000] = ffff5a40, %l5 = 000000001362852c, %asi = 80
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010041407] = 00000000, %l0 = 0000000000000000, %asi = 80
	ldsba	[%i1+0x007]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1408] = 43ccfaf1000000a4, %l0 = 0000000000000000
	ldxa	[%i3+%o4]0x81,%l0	! %l0 = 43ccfaf1000000a4
!	Mem[0000000010181400] = df2c9795563a3be2, %l0 = 43ccfaf1000000a4
	ldxa	[%i6+%g0]0x88,%l0	! %l0 = df2c9795563a3be2
!	Mem[0000000030181410] = 00000000, %l6 = 0000000000000000
	ldsba	[%i6+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = 3d5c9877ff00ff87, %l2 = 0000000000000000
	ldxa	[%i6+%o4]0x80,%l2	! %l2 = 3d5c9877ff00ff87
!	%l4 = 00000000000000ff, %l3 = 000000000000af4f, %l2 = 3d5c9877ff00ff87
	orn	%l4,%l3,%l2		! %l2 = ffffffffffff50ff
!	Mem[0000000010081400] = 000000008cde312a, %l2 = ffffffffffff50ff
	ldxa	[%i2+%g0]0x88,%l2	! %l2 = 000000008cde312a
!	Mem[0000000010101428] = c38fa80000000046, %f22 = 00000000 000000ff
	ldd	[%i4+0x028],%f22	! %f22 = c38fa800 00000046

p0_label_173:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 00000000, %l0 = df2c9795563a3be2
	ldstuba	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%f8  = 298f2a0a, Mem[00000000100c1400] = 00006a7f
	sta	%f8 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = 298f2a0a
!	%f2  = a4000000 f1facc43, Mem[0000000030141410] = fffffcc8 00003ad6
	stda	%f2 ,[%i5+%o5]0x81	! Mem[0000000030141410] = a4000000 f1facc43
	membar	#Sync			! Added by membar checker (35)
!	%f20 = 2c856213 00a8af4f, Mem[00000000300c1400] = 58000000 19000000
	stda	%f20,[%i3+%g0]0x89	! Mem[00000000300c1400] = 2c856213 00a8af4f
!	Mem[0000000010181410] = 00000000, %l1 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%l5 = ffffffffffffffff, Mem[0000000010101410] = 00000000
	stha	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = ffff0000
!	%l4 = 00000000000000ff, Mem[0000000030041400] = 0000cc43
	stwa	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff
!	Mem[0000000030081400] = ffb70000, %l5 = 00000000ffffffff
	swapa	[%i2+%g0]0x81,%l5	! %l5 = 00000000ffb70000
!	Mem[0000000030101410] = efdfdbc2, %l7 = 0000000061000000
	swapa	[%i4+%o5]0x89,%l7	! %l7 = 00000000efdfdbc2
!	%l5 = 00000000ffb70000, Mem[0000000010101414] = 00000000
	sth	%l5,[%i4+0x014]		! Mem[0000000010101414] = 00000000

p0_label_174:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = f1000000, %l0 = 0000000000000000
	ldsha	[%i0+%o4]0x81,%l0	! %l0 = fffffffffffff100
!	Mem[0000000030101400] = 00000000, %l7 = 00000000efdfdbc2
	ldswa	[%i4+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1410] = 16cbf766, %l0 = fffffffffffff100
	lduba	[%i3+%o5]0x81,%l0	! %l0 = 0000000000000016
!	Mem[00000000211c0001] = ffff5a40, %l4 = 00000000000000ff, %asi = 80
	ldsba	[%o2+0x001]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141400] = ff000000 00000000, %l6 = 00000000, %l7 = 00000000
	ldd	[%i5+%g0],%l6		! %l6 = 00000000ff000000 0000000000000000
!	Mem[0000000010101400] = 7f6a0000, %l6 = 00000000ff000000
	lduha	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041400] = 000000ff, %f11 = 00a8af4f
	lda	[%i1+%g0]0x81,%f11	! %f11 = 000000ff
!	Code Fragment 4, seed = 480577
p0_fragment_20:
!	%l0 = 0000000000000016
	setx	0xbb0fb5a1cb3adf1e,%g7,%l0 ! %l0 = bb0fb5a1cb3adf1e
!	%l1 = 0000000000000000
	setx	0xd06bc044a709c1c9,%g7,%l1 ! %l1 = d06bc044a709c1c9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = bb0fb5a1cb3adf1e
	setx	0x1fd8a7780d58c084,%g7,%l0 ! %l0 = 1fd8a7780d58c084
!	%l1 = d06bc044a709c1c9
	setx	0x832779080d6a5e4f,%g7,%l1 ! %l1 = 832779080d6a5e4f
p0_fragment_20_end:
!	%f14 = 8baba779, %f27 = 4b439fda, %f22 = c38fa800
	fmuls	%f14,%f27,%f22		! %f22 = 97832bc0
!	Mem[0000000010181400] = 563a3be2, %l5 = 00000000ffb70000
	ldswa	[%i6+%g0]0x88,%l5	! %l5 = 00000000563a3be2

p0_label_175:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 000000ff, %l1 = 832779080d6a5e4f
	ldstuba	[%i5+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1408] = 000000ff, %l7 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%l4 = ffffffffffffffff, Mem[0000000010141410] = 000000ff
	stba	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff
!	%l3 = 000000000000af4f, Mem[0000000010001400] = 6dd4dbc200000000, %asi = 80
	stxa	%l3,[%i0+0x000]%asi	! Mem[0000000010001400] = 000000000000af4f
!	%f6  = 1362852c ea8b2d55, Mem[0000000010041408] = 0000239b 43ccfaf1
	stda	%f6 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 1362852c ea8b2d55
!	Mem[0000000030041410] = ff5923ff, %l3 = 000000000000af4f
	swapa	[%i1+%o5]0x81,%l3	! %l3 = 00000000ff5923ff
!	Mem[00000000300c1410] = 16cbf766, %l7 = 00000000000000ff
	ldstuba	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000016
!	%l1 = 00000000000000ff, Mem[0000000010001438] = 97250000, %asi = 80
	stha	%l1,[%i0+0x038]%asi	! Mem[0000000010001438] = 00ff0000
!	%f26 = 7f6a0000 4b439fda, %l2 = 000000008cde312a
!	Mem[0000000030101418] = 3200b54ada53cb52
	add	%i4,0x018,%g1
	stda	%f26,[%g1+%l2]ASI_PST32_SL ! Mem[0000000030101418] = 3200b54a00006a7f
!	%f19 = 9b230000, Mem[0000000010041410] = 4fafa800
	sta	%f19,[%i1+%o5]0x80	! Mem[0000000010041410] = 9b230000

p0_label_176:
!	Starting 10 instruction Load Burst
!	Mem[000000001004140a] = 1362852c, %l1 = 00000000000000ff
	lduh	[%i1+0x00a],%l1		! %l1 = 000000000000852c
!	Mem[0000000010181406] = 95972cdf, %l2 = 000000008cde312a
	ldsh	[%i6+0x006],%l2		! %l2 = 0000000000002cdf
!	Mem[0000000010001410] = 4fafa80000000000, %l7 = 0000000000000016, %asi = 80
	ldxa	[%i0+0x010]%asi,%l7	! %l7 = 4fafa80000000000
!	Mem[0000000010001400] = 00000000, %l5 = 00000000563a3be2
	lduba	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000000
!	%l3 = 00000000ff5923ff, %l5 = 0000000000000000, %l4 = ffffffffffffffff
	subc	%l3,%l5,%l4		! %l4 = 00000000ff5923ff
!	Mem[000000001014142e] = e60a0000, %l0 = 1fd8a7780d58c084, %asi = 80
	lduha	[%i5+0x02e]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1422] = c38f2266, %l2 = 0000000000002cdf, %asi = 80
	ldsha	[%i3+0x022]%asi,%l2	! %l2 = 0000000000002266
!	Mem[0000000010181410] = 00000000, %l1 = 000000000000852c
	lduwa	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001410] = 4fafa800, %l1 = 0000000000000000
	ldsha	[%i0+%o5]0x80,%l1	! %l1 = 0000000000004faf
!	Mem[00000000100c1408] = 2c85621300000000, %f4  = 00000000 66f7cb16
	ldda	[%i3+%o4]0x88,%f4 	! %f4  = 2c856213 00000000

p0_label_177:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[00000000300c1410] = ffcbf76600000000
	stxa	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000000000000000
!	%l0 = 00000000, %l1 = 00004faf, Mem[0000000010081408] = 00a8af4f 61000000, %asi = 80
	stda	%l0,[%i2+0x008]%asi	! Mem[0000000010081408] = 00000000 00004faf
!	Mem[0000000010101408] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l1 = 0000000000004faf
	ldstuba	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%f12 = 65e0a712 64b02073, Mem[0000000010181410] = 00000000 0000239b
	stda	%f12,[%i6+%o5]0x80	! Mem[0000000010181410] = 65e0a712 64b02073
!	%l2 = 0000000000002266, Mem[0000000010141408] = f1c5ffff
	stwa	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 00002266
!	%f24 = f1000000 00000000, Mem[0000000030101400] = 00000000 4faf0000
	stda	%f24,[%i4+%g0]0x89	! Mem[0000000030101400] = f1000000 00000000
!	Mem[000000001018140c] = ff00ff87, %l5 = 0000000000000000
	swap	[%i6+0x00c],%l5		! %l5 = 00000000ff00ff87
!	%f28 = 97250000 29010000, Mem[0000000010101410] = ffff0000 00000000
	stda	%f28,[%i4+%o5]0x80	! Mem[0000000010101410] = 97250000 29010000
!	Mem[0000000010141400] = 000000ff, %l4 = 00000000ff5923ff
	swapa	[%i5+%g0]0x88,%l4	! %l4 = 00000000000000ff

p0_label_178:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 4fafa800, %l0 = 0000000000000000
	ldswa	[%i3+%g0]0x81,%l0	! %l0 = 000000004fafa800
!	Mem[0000000030041408] = 7158f72b, %l4 = 00000000000000ff
	ldsha	[%i1+%o4]0x89,%l4	! %l4 = fffffffffffff72b
!	Mem[0000000010001400] = 00000000, %f9  = f871b618
	lda	[%i0+%g0]0x88,%f9 	! %f9 = 00000000
!	Mem[00000000300c1408] = f1facc43, %l3 = 00000000ff5923ff
	lduwa	[%i3+%o4]0x89,%l3	! %l3 = 00000000f1facc43
!	%l5 = 00000000ff00ff87, %l0 = 000000004fafa800, %l3 = 00000000f1facc43
	xnor	%l5,%l0,%l3		! %l3 = ffffffff4f50a878
!	Mem[00000000100c1408] = 2c856213 00000000, %l0 = 4fafa800, %l1 = 00000000
	ldda	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000000 000000002c856213
!	Mem[0000000010081408] = af4f0000 00000000, %l2 = 00002266, %l3 = 4f50a878
	ldda	[%i2+%o4]0x88,%l2	! %l2 = 0000000000000000 00000000af4f0000
!	Mem[0000000030181408] = 0000000059000000, %f30 = 00000000 00002597
	ldda	[%i6+%o4]0x89,%f30	! %f30 = 00000000 59000000
!	%f26 = 7f6a0000, %f20 = 2c856213, %f6  = 1362852c ea8b2d55
	fsmuld	%f26,%f20,%f6 		! %f6  = 458e7ae9 57800000
!	Mem[0000000030101408] = b7a42200, %l4 = fffffffffffff72b
	ldsha	[%i4+%o4]0x81,%l4	! %l4 = ffffffffffffb7a4

p0_label_179:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, immd = ffffff19, %y  = 43ccfa33
	umul	%l0,-0x0e7,%l3		! %l3 = 0000000000000000, %y = 00000000
!	%l0 = 0000000000000000, Mem[0000000030041408] = 3d5c98777158f72b
	stxa	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000000000000
!	%l5 = 00000000ff00ff87, Mem[0000000010081410] = 000000a4
	stwa	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = ff00ff87
!	Mem[0000000030041408] = 00000000, %l0 = 0000000000000000
	swapa	[%i1+%o4]0x81,%l0	! %l0 = 0000000000000000
!	%l0 = 00000000, %l1 = 2c856213, Mem[0000000010181408] = 77985c3d 00000000
	stda	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000 2c856213
!	%l7 = 4fafa80000000000, Mem[0000000010041408] = 552d8bea2c856213
	stxa	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = 4fafa80000000000
!	Mem[0000000010181408] = 00000000, %l7 = 4fafa80000000000
	ldstuba	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = 000000ff, %l1 = 000000002c856213
	ldstuba	[%i5+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%f10 = 66228fc3 000000ff, %l2 = 0000000000000000
!	Mem[0000000010181410] = 65e0a71264b02073
	add	%i6,0x010,%g1
	stda	%f10,[%g1+%l2]ASI_PST16_P ! Mem[0000000010181410] = 65e0a71264b02073
!	Mem[000000001004141c] = daffcb52, %l6 = 0000000000000000
	swap	[%i1+0x01c],%l6		! %l6 = 00000000daffcb52

p0_label_180:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ff00000000000070, %f0  = 19000000 58000000
	ldda	[%i2+%o5]0x81,%f0 	! %f0  = ff000000 00000070
!	Mem[0000000010181410] = 65e0a712, %l5 = 00000000ff00ff87, %asi = 80
	lduwa	[%i6+0x010]%asi,%l5	! %l5 = 0000000065e0a712
!	Mem[00000000100c1408] = 00000000 1362852c, %l6 = daffcb52, %l7 = 00000000
	ldda	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000 000000001362852c
!	Mem[0000000030181408] = 00000000 59000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i6+%o4]0x89,%l2	! %l2 = 0000000059000000 0000000000000000
!	Mem[0000000020800000] = 0000b9e0, %l3 = 0000000000000000
	ldsh	[%o1+%g0],%l3		! %l3 = 0000000000000000
!	Mem[0000000010101400] = 00006a7f, %l4 = ffffffffffffb7a4
	lduba	[%i4+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = ffffffff, %l1 = 00000000000000ff
	lduha	[%i2+%g0]0x81,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010101408] = 000000ff, %l4 = 0000000000000000
	lduha	[%i4+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141408] = 66220000, %l7 = 000000001362852c
	lduba	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101410] = 00000129 00002597, %l6 = 00000000, %l7 = 00000000
	ldda	[%i4+%o5]0x88,%l6	! %l6 = 0000000000002597 0000000000000129

p0_label_181:
!	Starting 10 instruction Store Burst
!	%f16 = 43ccfaf1 000000a4, Mem[0000000030041410] = 4faf0000 0022a4b7
	stda	%f16,[%i1+%o5]0x89	! Mem[0000000030041410] = 43ccfaf1 000000a4
!	%f22 = 97832bc0, %f2  = a4000000
	fcmps	%fcc3,%f22,%f2 		! %fcc3 = 2
!	%l6 = 0000000000002597, Mem[00000000100c1400] = 298f2a0a
	stha	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 25972a0a
!	%l6 = 0000000000002597, %l3 = 0000000000000000, %l6 = 0000000000002597
	addc	%l6,%l3,%l6		! %l6 = 0000000000002597
!	%f30 = 00000000 59000000, Mem[0000000030181408] = 00000059 00000000
	stda	%f30,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000 59000000
!	%l1 = 000000000000ffff, Mem[00000000100c1410] = 0000000066f7cb16
	stx	%l1,[%i3+%o5]		! Mem[00000000100c1410] = 000000000000ffff
!	%l7 = 0000000000000129, Mem[0000000030081400] = ffffffff
	stwa	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000129
!	Mem[0000000010141408] = 00002266, %l0 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000
!	%l3 = 0000000000000000, Mem[00000000300c1408] = f1facc43
	stha	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = f1fa0000
!	Mem[0000000010081408] = 00000000, %l5 = 65e0a712, %l1 = 0000ffff
	add	%i2,0x08,%g1
	casa	[%g1]0x80,%l5,%l1	! %l1 = 0000000000000000

p0_label_182:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 9725000029010000, %l5 = 0000000065e0a712, %asi = 80
	ldxa	[%i4+0x010]%asi,%l5	! %l5 = 9725000029010000
!	Mem[0000000010001408] = ff5df043f1ffffff, %f20 = 2c856213 00a8af4f
	ldda	[%i0+%o4]0x80,%f20	! %f20 = ff5df043 f1ffffff
!	Mem[0000000010181410] = 7320b06412a7e065, %l2 = 0000000059000000
	ldxa	[%i6+%o5]0x88,%l2	! %l2 = 7320b06412a7e065
!	Mem[0000000010001400] = 00000000, %f20 = ff5df043
	lda	[%i0+%g0]0x88,%f20	! %f20 = 00000000
!	Mem[000000001004141b] = 00000024, %l0 = 0000000000000000
	ldub	[%i1+0x01b],%l0		! %l0 = 0000000000000024
!	Mem[0000000030081408] = 00000023, %l3 = 0000000000000000
	ldsha	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000023
!	Mem[000000001014142c] = e60a0000, %l4 = 00000000000000ff
	ldsh	[%i5+0x02c],%l4		! %l4 = ffffffffffffe60a
!	Mem[0000000030141408] = e23b3a56 00000000, %l4 = ffffe60a, %l5 = 29010000
	ldda	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000000 00000000e23b3a56
!	Mem[0000000010001408] = ff5df043, %l2 = 7320b06412a7e065
	lduwa	[%i0+%o4]0x80,%l2	! %l2 = 00000000ff5df043
!	Mem[0000000030081410] = ff000000, %l5 = 00000000e23b3a56
	ldsha	[%i2+%o5]0x81,%l5	! %l5 = ffffffffffffff00

p0_label_183:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 00006a7f, %l0 = 0000000000000024
	ldstuba	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%l7 = 0000000000000129, Mem[0000000030101400] = 00000000
	stba	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = 29000000
!	%l2 = 00000000ff5df043, Mem[0000000030001410] = 43ccfaf112a7e065
	stxa	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000ff5df043
!	%l4 = 0000000000000000, Mem[0000000010181410] = 65e0a712
	stwa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	Mem[00000000100c1408] = 00000000, %l1 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = a4000000, %l2 = 00000000ff5df043
	ldstuba	[%i5+%o5]0x81,%l2	! %l2 = 00000000000000a4
!	Mem[0000000010001408] = ff5df043, %l3 = 0000000000000023, %asi = 80
	swapa	[%i0+0x008]%asi,%l3	! %l3 = 00000000ff5df043
!	%l4 = 0000000000000000, Mem[0000000010181410] = 00000000
	stha	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	%f8  = 298f2a0a, Mem[00000000300c1400] = 00a8af4f
	sta	%f8 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 298f2a0a
!	%l0 = 0000000000000000, Mem[0000000030081408] = 40cbff9a00000023
	stxa	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000000000000000

p0_label_184:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 662200ff, %l6 = 0000000000002597
	lduha	[%i5+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101410] = 61000000, %l7 = 0000000000000129
	lduwa	[%i4+%o5]0x89,%l7	! %l7 = 0000000061000000
!	%f14 = 8baba779, %f16 = 43ccfaf1, %f0  = ff000000 00000070
	fsmuld	%f14,%f16,%f0 		! %f0  = ba012e36 f21a5d20
!	Mem[0000000010181408] = 000000ff, %f23 = 00000046
	lda	[%i6+%o4]0x88,%f23	! %f23 = 000000ff
!	Mem[00000000300c1408] = 0000faf1, %l7 = 0000000061000000
	lduba	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l1 = 0000000000000000
	lduha	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041430] = 0dcc85378cb61632, %l5 = ffffffffffffff00
	ldx	[%i1+0x030],%l5		! %l5 = 0dcc85378cb61632
!	Mem[0000000030081408] = 00000000, %l7 = 0000000000000000
	lduba	[%i2+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181410] = 00000000 64b02073, %l4 = 00000000, %l5 = 8cb61632
	ldda	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000000 0000000064b02073
!	Mem[0000000030001408] = f1000000, %l2 = 00000000000000a4
	lduha	[%i0+%o4]0x81,%l2	! %l2 = 000000000000f100

p0_label_185:
!	Starting 10 instruction Store Burst
!	%f22 = 97832bc0 000000ff, %l5 = 0000000064b02073
!	Mem[0000000030141400] = 028a361c00000000
	stda	%f22,[%i5+%l5]ASI_PST16_SL ! Mem[0000000030141400] = ff00000000000000
!	Mem[0000000030141408] = 00000000, %l2 = 000000000000f100
	ldstuba	[%i5+%o4]0x89,%l2	! %l2 = 0000000000000000
!	%f10 = 66228fc3, %f1  = f21a5d20
	fitos	%f10,%f1 		! %f1  = 4ecc4520
!	%l0 = 0000000000000000, Mem[000000001010142b] = c38fa800, %asi = 80
	stba	%l0,[%i4+0x02b]%asi	! Mem[0000000010101428] = c38fa800
!	%f23 = 000000ff, Mem[0000000030001400] = ff870000
	sta	%f23,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000ff
!	Mem[0000000030101408] = b7a42200, %l0 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l0	! %l0 = 00000000b7a42200
!	%l1 = 0000000000000000, Mem[0000000030141400] = 000000ff
	stba	%l1,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	%f30 = 00000000, Mem[0000000030041410] = a4000000
	sta	%f30,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	%f3  = f1facc43, Mem[0000000030101410] = 00000061
	sta	%f3 ,[%i4+%o5]0x81	! Mem[0000000030101410] = f1facc43
!	%l2 = 0000000000000000, Mem[0000000030081400] = 0000001c00000129
	stxa	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000000000000000

p0_label_186:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 43ccfaf100000000, %f0  = ba012e36 4ecc4520
	ldda	[%i1+%o5]0x89,%f0 	! %f0  = 43ccfaf1 00000000
!	Mem[0000000030001400] = 000000ff, %l7 = 0000000000000000
	lduha	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = 0a2a9725, %l1 = 0000000000000000
	ldsha	[%i3+%g0]0x88,%l1	! %l1 = ffffffffffff9725
!	Mem[00000000100c1408] = 00000000, %l5 = 0000000064b02073
	lduba	[%i3+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041408] = 4fafa800 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i1+%o4]0x88,%l4	! %l4 = 0000000000000000 000000004fafa800
!	Mem[0000000030041400] = 000000ff, %l6 = 00000000000000ff
	lduwa	[%i1+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001438] = 00ff0000, %l1 = ffffffffffff9725
	ldsw	[%i0+0x038],%l1		! %l1 = 0000000000ff0000
!	Mem[00000000100c1400] = 000000000a2a9725, %f12 = 65e0a712 64b02073
	ldda	[%i3+%g0]0x88,%f12	! %f12 = 00000000 0a2a9725
!	Mem[00000000211c0000] = ffff5a40, %l7 = 0000000000000000
	ldsb	[%o2+%g0],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010181424] = 00006a7f, %f31 = 59000000
	ld	[%i6+0x024],%f31	! %f31 = 00006a7f

p0_label_187:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 00000000, %l7 = ffffffffffffffff
	ldstuba	[%i1+%o4]0x89,%l7	! %l7 = 0000000000000000
!	%l3 = 00000000ff5df043, Mem[0000000030001400] = 00000000ff000000
	stxa	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000ff5df043
!	Mem[00000000100c1408] = 00000000, %l7 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	%f8  = 298f2a0a, Mem[0000000010001410] = 4fafa800
	sta	%f8 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 298f2a0a
!	%f0  = 43ccfaf1 00000000, %l3 = 00000000ff5df043
!	Mem[0000000030141400] = 0000000000000000
	stda	%f0,[%i5+%l3]ASI_PST32_SL ! Mem[0000000030141400] = 00000000f1facc43
!	Mem[0000000030081410] = 000000ff, %l0 = 00000000b7a42200
	ldstuba	[%i2+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%l0 = 00000000000000ff, imm = fffffffffffff211, %l4 = 0000000000000000
	subc	%l0,-0xdef,%l4		! %l4 = 0000000000000eee
!	%l2 = 00000000, %l3 = ff5df043, Mem[0000000010081410] = ff00ff87 43ccfaf1
	stda	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000 ff5df043
!	Mem[0000000030081400] = 00000000, %l3 = 00000000ff5df043
	swapa	[%i2+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041408] = ff000000, %l4 = 0000000000000eee
	swapa	[%i1+%o4]0x81,%l4	! %l4 = 00000000ff000000

p0_label_188:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 2a31de8c, %l0 = 00000000000000ff
	ldsha	[%i2+%g0]0x80,%l0	! %l0 = 0000000000002a31
!	Mem[00000000300c1408] = f1fa0000, %l7 = 0000000000000000
	ldsba	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181418] = 1be0005a4c22ffff, %f2  = a4000000 f1facc43
	ldd	[%i6+0x018],%f2 	! %f2  = 1be0005a 4c22ffff
!	%l0 = 0000000000002a31, imm = 0000000000000094, %l3 = 0000000000000000
	subc	%l0,0x094,%l3		! %l3 = 000000000000299d
!	Mem[0000000010101400] = 7f6a00ff, %l3 = 000000000000299d
	lduba	[%i4+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101400] = 29000000, %l7 = 0000000000000000
	lduha	[%i4+%g0]0x81,%l7	! %l7 = 0000000000002900
!	Mem[00000000300c1408] = 0000faf1, %l1 = 0000000000ff0000
	lduha	[%i3+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101408] = ff000000, %l0 = 0000000000002a31
	ldsha	[%i4+%o4]0x80,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000030141410] = ff000000, %l5 = 000000004fafa800
	ldsha	[%i5+%o5]0x81,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000030041410] = 00000000, %l4 = 00000000ff000000
	ldswa	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000

p0_label_189:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = ff5923ff, %l2 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l2	! %l2 = 00000000ff5923ff
!	%f30 = 00000000 00006a7f, %l3 = 00000000000000ff
!	Mem[0000000030141408] = ff000000563a3be2
	add	%i5,0x008,%g1
	stda	%f30,[%g1+%l3]ASI_PST16_S ! Mem[0000000030141408] = 0000000000006a7f
!	%l3 = 00000000000000ff, Mem[0000000030041400] = ff000000
	stha	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = ff0000ff
!	Mem[00000000201c0000] = ff0da3b0, %l3 = 00000000000000ff
	ldstuba	[%o0+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141436] = 16cbf766, %l3 = 00000000000000ff
	ldstub	[%i5+0x036],%l3		! %l3 = 00000000000000f7
!	Mem[0000000010181410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081428] = ffc4787f, %l0 = 00000000ffffff00, %asi = 80
	swapa	[%i2+0x028]%asi,%l0	! %l0 = 00000000ffc4787f
!	%f3  = 4c22ffff, Mem[0000000010141410] = ff000000
	sta	%f3 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 4c22ffff
!	%l3 = 00000000000000f7, Mem[0000000010081408] = 00000000
	stba	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000f7
!	Mem[0000000010141400] = 00000000, %l2 = 00000000ff5923ff
	ldstuba	[%i5+0x000]%asi,%l2	! %l2 = 0000000000000000

p0_label_190:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff006a7f 00000000, %l4 = 00000000, %l5 = ffffff00
	ldda	[%i4+%g0]0x80,%l4	! %l4 = 00000000ff006a7f 0000000000000000
!	Mem[0000000010081400] = 8cde312a, %f2  = 1be0005a
	lda	[%i2+%g0]0x88,%f2 	! %f2 = 8cde312a
!	Mem[0000000010081400] = 000000008cde312a, %l2 = 0000000000000000
	ldxa	[%i2+%g0]0x88,%l2	! %l2 = 000000008cde312a
!	Mem[0000000030001408] = f1000000, %f13 = 0a2a9725
	lda	[%i0+%o4]0x81,%f13	! %f13 = f1000000
!	Mem[0000000030181408] = 00000000, %l5 = 0000000000000000
	lduha	[%i6+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = 563a3be2, %l0 = 00000000ffc4787f
	lduwa	[%i6+%g0]0x88,%l0	! %l0 = 00000000563a3be2
!	Mem[0000000010001420] = f1facc43, %l7 = 0000000000002900, %asi = 80
	ldswa	[%i0+0x020]%asi,%l7	! %l7 = fffffffff1facc43
!	%f28 = 97250000, %f12 = 00000000
	fcmps	%fcc1,%f28,%f12		! %fcc1 = 1
!	Mem[0000000010181420] = ffffffe6, %l3 = 00000000000000f7, %asi = 80
	lduwa	[%i6+0x020]%asi,%l3	! %l3 = 00000000ffffffe6
!	Mem[0000000010081429] = ffffff00, %l4 = 00000000ff006a7f
	ldub	[%i2+0x029],%l4		! %l4 = 00000000000000ff

p0_label_191:
!	Starting 10 instruction Store Burst
!	%f31 = 00006a7f, Mem[00000000100c1400] = 25972a0a
	sta	%f31,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00006a7f
!	Mem[0000000010081408] = 000000f7, %l1 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l1	! %l1 = 00000000000000f7
!	%l6 = 000000ff, %l7 = f1facc43, Mem[0000000010141400] = 000000ff 00000000
	stda	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff f1facc43
!	%l7 = fffffffff1facc43, Mem[0000000020800040] = 00ff4c10
	sth	%l7,[%o1+0x040]		! Mem[0000000020800040] = cc434c10
!	%l3 = 00000000ffffffe6, Mem[00000000100c142a] = 00000ae6, %asi = 80
	stha	%l3,[%i3+0x02a]%asi	! Mem[00000000100c1428] = 0000ffe6
!	%l1 = 00000000000000f7, Mem[0000000010101408] = 9b000000000000ff
	stxa	%l1,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000000000f7
!	%l2 = 8cde312a, %l3 = ffffffe6, Mem[0000000010081410] = 00000000 ff5df043
	stda	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 8cde312a ffffffe6
!	Mem[0000000020800000] = 0000b9e0, %l1 = 00000000000000f7
	ldstub	[%o1+%g0],%l1		! %l1 = 0000000000000000
!	Mem[0000000030001410] = 00000000, %l2 = 000000008cde312a
	ldstuba	[%i0+%o5]0x81,%l2	! %l2 = 0000000000000000
!	%l0 = 00000000563a3be2, Mem[0000000010101410] = 97250000
	stwa	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 563a3be2

p0_label_192:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141420] = 4fafa800, %l7 = fffffffff1facc43
	ldsw	[%i5+0x020],%l7		! %l7 = 000000004fafa800
!	Mem[0000000010081410] = 8cde312a, %l3 = 00000000ffffffe6
	ldswa	[%i2+%o5]0x80,%l3	! %l3 = ffffffff8cde312a
!	Mem[0000000030081410] = ff000000, %l5 = 0000000000000000
	ldsha	[%i2+%o5]0x81,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000010101430] = 00005859 57d10bf9, %l0 = 563a3be2, %l1 = 00000000, %asi = 80
	ldda	[%i4+0x030]%asi,%l0	! %l0 = 0000000000005859 0000000057d10bf9
!	Mem[000000001008143e] = 43f05dff, %l2 = 0000000000000000
	ldsb	[%i2+0x03e],%l2		! %l2 = 000000000000005d
!	Mem[00000000211c0000] = ffff5a40, %l6 = 00000000000000ff
	lduh	[%o2+%g0],%l6		! %l6 = 000000000000ffff
!	Mem[0000000010181410] = ff000000, %l1 = 0000000057d10bf9
	lduwa	[%i6+%o5]0x80,%l1	! %l1 = 00000000ff000000
!	Mem[0000000030001408] = 000000f1, %l2 = 000000000000005d
	ldsba	[%i0+%o4]0x89,%l2	! %l2 = fffffffffffffff1
!	Mem[0000000030041410] = 00000000f1facc43, %l2 = fffffffffffffff1
	ldxa	[%i1+%o5]0x81,%l2	! %l2 = 00000000f1facc43
!	Mem[00000000100c1430] = 3216b68c, %l7 = 000000004fafa800
	lduw	[%i3+0x030],%l7		! %l7 = 000000003216b68c

p0_label_193:
!	Starting 10 instruction Store Burst
!	Mem[0000000021800180] = 00ff4d90, %l7 = 000000003216b68c
	ldstub	[%o3+0x180],%l7		! %l7 = 0000000000000000
!	%l5 = ffffffffffffff00, Mem[0000000010041434] = 8cb61632
	stw	%l5,[%i1+0x034]		! Mem[0000000010041434] = ffffff00
!	Mem[0000000010101408] = f7000000, %l7 = 0000000000000000
	ldstub	[%i4+%o4],%l7		! %l7 = 00000000000000f7
!	%l1 = 00000000ff000000, Mem[0000000021800041] = 0ae6eaa0, %asi = 80
	stba	%l1,[%o3+0x041]%asi	! Mem[0000000021800040] = 0a00eaa0
!	Mem[0000000010181408] = ff000000, %l6 = 000000000000ffff
	ldstuba	[%i6+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	%l3 = ffffffff8cde312a, Mem[00000000211c0000] = ffff5a40
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 312a5a40
!	Mem[0000000030001410] = ff000000, %l6 = 00000000000000ff
	swapa	[%i0+%o5]0x81,%l6	! %l6 = 00000000ff000000
!	Mem[0000000030101408] = 00000000, %l4 = 00000000000000ff
	swapa	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, Mem[00000000211c0000] = 312a5a40, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00005a40
!	%f28 = 97250000 29010000, Mem[0000000030101400] = 29000000 000000f1
	stda	%f28,[%i4+%g0]0x81	! Mem[0000000030101400] = 97250000 29010000

p0_label_194:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800100] = 87ffe530, %l4 = 0000000000000000, %asi = 80
	lduha	[%o3+0x100]%asi,%l4	! %l4 = 00000000000087ff
!	Mem[0000000030041408] = 00000eee, %l1 = 00000000ff000000
	lduwa	[%i1+%o4]0x81,%l1	! %l1 = 0000000000000eee
!	Mem[0000000030081410] = ff000000, %l6 = 00000000ff000000
	lduba	[%i2+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1400] = 7f6a0000, %l3 = ffffffff8cde312a
	ldswa	[%i3+%g0]0x88,%l3	! %l3 = 000000007f6a0000
!	Mem[0000000030101408] = 00000000000000ff, %l1 = 0000000000000eee
	ldxa	[%i4+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030081410] = ff000000 00000070, %l2 = f1facc43, %l3 = 7f6a0000
	ldda	[%i2+%o5]0x81,%l2	! %l2 = 00000000ff000000 0000000000000070
!	Mem[0000000010001408] = 00000023f1ffffff, %f14 = 8baba779 c2dbd46d
	ldda	[%i0+%o4]0x80,%f14	! %f14 = 00000023 f1ffffff
!	Mem[0000000010001437] = 8cb61632, %l4 = 00000000000087ff
	ldsb	[%i0+0x037],%l4		! %l4 = 0000000000000032
!	Mem[0000000010001410] = 0a2a8f29, %l3 = 0000000000000070
	lduba	[%i0+%o5]0x88,%l3	! %l3 = 0000000000000029
!	Mem[0000000010041408] = 00000000, %l6 = 00000000000000ff
	ldsha	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000000

p0_label_195:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 00000000, %l2 = 00000000ff000000
	ldstuba	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l3 = 0000000000000029
	ldstuba	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030181410] = 00000000
	stwa	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	%f0  = 43ccfaf1 00000000, Mem[0000000010001410] = 0a2a8f29 00000000
	stda	%f0 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 43ccfaf1 00000000
!	Mem[0000000010181410] = 000000ff, %l1 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081408] = 00000000, %l7 = 00000000000000f7
	swapa	[%i2+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[000000001008141c] = da9f434b, %l6 = 0000000000000000
	swap	[%i2+0x01c],%l6		! %l6 = 00000000da9f434b
!	Mem[0000000020800041] = cc434c10, %l4 = 0000000000000032
	ldstub	[%o1+0x041],%l4		! %l4 = 0000000000000043
!	Mem[0000000010181410] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l3	! %l3 = 00000000000000ff

p0_label_196:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 00000000, %l0 = 0000000000005859
	ldsha	[%i6+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041408] = ff000000, %l0 = 0000000000000000
	lduwa	[%i1+%o4]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[00000000100c1410] = 00000000, %l6 = 00000000da9f434b
	lduha	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000000
!	%l7 = 0000000000000000, imm = 0000000000000b49, %l3 = 00000000000000ff
	orn	%l7,0xb49,%l3		! %l3 = fffffffffffff4b6
!	Mem[0000000030181410] = 00000000, %l7 = 0000000000000000
	ldswa	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101410] = e23b3a56, %f24 = f1000000
	lda	[%i4+%o5]0x88,%f24	! %f24 = e23b3a56
!	Mem[00000000100c1400] = 7f6a0000, %l7 = 0000000000000000
	ldswa	[%i3+%g0]0x88,%l7	! %l7 = 000000007f6a0000
!	%l1 = 00000000000000ff, imm = 0000000000000d87, %l5 = ffffffffffffff00
	add	%l1,0xd87,%l5		! %l5 = 0000000000000e86
!	Mem[0000000010181400] = 563a3be2, %l3 = fffffffffffff4b6
	lduba	[%i6+%g0]0x88,%l3	! %l3 = 00000000000000e2
!	Mem[0000000010101400] = ff006a7f00000000, %l5 = 0000000000000e86
	ldxa	[%i4+%g0]0x80,%l5	! %l5 = ff006a7f00000000

p0_label_197:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = ff0000ff, %l4 = 0000000000000043
	ldstuba	[%i1+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%f18 = f1facc43, Mem[0000000010101434] = 57d10bf9
	sta	%f18,[%i4+0x034]%asi	! Mem[0000000010101434] = f1facc43
!	%f16 = 43ccfaf1, Mem[000000001014140c] = ffffffff
	sta	%f16,[%i5+0x00c]%asi	! Mem[000000001014140c] = 43ccfaf1
!	%l5 = ff006a7f00000000, Mem[0000000030181400] = 6dd4d6ff
	stba	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = 6dd4d600
!	Mem[00000000300c1410] = 00000000, %l1 = 00000000000000ff
	ldstuba	[%i3+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%l1 = 0000000000000000, %l5 = ff006a7f00000000, %l6 = 0000000000000000
	sdivx	%l1,%l5,%l6		! %l6 = 0000000000000000
!	%f6  = 458e7ae9, Mem[0000000030101410] = 43ccfaf1
	sta	%f6 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 458e7ae9
!	Mem[0000000010101427] = 00000037, %l7 = 000000007f6a0000
	ldstub	[%i4+0x027],%l7		! %l7 = 0000000000000037
!	Mem[0000000010001408] = 00000023f1ffffff, %l2 = 0000000000000000, %l5 = ff006a7f00000000
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l2,%l5	! %l5 = 00000023f1ffffff
!	%f16 = 43ccfaf1 000000a4, Mem[0000000030041408] = 00000eee 00000000
	stda	%f16,[%i1+%o4]0x81	! Mem[0000000030041408] = 43ccfaf1 000000a4

p0_label_198:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 2a31de8c, %l1 = 0000000000000000
	lduw	[%i2+%g0],%l1		! %l1 = 000000002a31de8c
	membar	#Sync			! Added by membar checker (36)
!	Mem[0000000010081400] = 2a31de8c 00000000 000000f7 00004faf
!	Mem[0000000010081410] = 8cde312a ffffffe6 43f05d0f 00000000
!	Mem[0000000010081420] = 43ccfaf1 0000361c ffffff00 b7ff22ff
!	Mem[0000000010081430] = 3d5c9877 1c368a02 00000000 43f05dff
	ldda	[%i2+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010081400
!	Mem[0000000010181401] = e23b3a56, %l3 = 00000000000000e2
	ldsb	[%i6+0x001],%l3		! %l3 = 000000000000003b
!	Mem[00000000100c1400] = 7f6a0000, %f10 = 66228fc3
	lda	[%i3+%g0]0x88,%f10	! %f10 = 7f6a0000
!	Mem[000000001014143d] = e23b3a56, %l2 = 0000000000000000
	ldsb	[%i5+0x03d],%l2		! %l2 = 000000000000003b
!	Mem[0000000010001400] = 00000000, %l2 = 000000000000003b
	lduwa	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = 000000ff, %f13 = f1000000
	lda	[%i1+%o4]0x88,%f13	! %f13 = 000000ff
!	Mem[0000000030041400] = ff0000ff00000046, %f10 = 7f6a0000 000000ff
	ldda	[%i1+%g0]0x81,%f10	! %f10 = ff0000ff 00000046
!	Mem[000000001010143f] = 000087ff, %l0 = 00000000ff000000, %asi = 80
	ldsba	[%i4+0x03f]%asi,%l0	! %l0 = ffffffffffffffff
!	%f15 = f1ffffff, Mem[0000000010101408] = ff000000
	sta	%f15,[%i4+%o4]0x80	! Mem[0000000010101408] = f1ffffff

p0_label_199:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l2	! %l2 = 0000000000000000
!	%l5 = 00000023f1ffffff, Mem[0000000010041400] = df2c979500000000
	stx	%l5,[%i1+%g0]		! Mem[0000000010041400] = 00000023f1ffffff
	membar	#Sync			! Added by membar checker (37)
!	%l0 = ffffffff, %l1 = 2a31de8c, Mem[0000000010081410] = 8cde312a ffffffe6
	stda	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffffff 2a31de8c
!	Mem[00000000100c1410] = 000000ff, %l4 = 00000000000000ff
	swapa	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101408] = fffffff1, %l6 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l6	! %l6 = 00000000000000f1
!	Mem[0000000010001400] = 00000000, %l3 = 000000000000003b
	ldstuba	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
!	%f18 = 000000f7 00004faf, Mem[0000000030001408] = 000000f1 d791d26c
	stda	%f18,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000f7 00004faf
!	%l4 = 00000000000000ff, Mem[00000000201c0000] = ff0da3b0, %asi = 80
	stha	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ffa3b0
!	%l0 = ffffffffffffffff, Mem[0000000010101418] = 8962730300000000
	stx	%l0,[%i4+0x018]		! Mem[0000000010101418] = ffffffffffffffff
!	%f4  = 2c856213 00000000, Mem[0000000010101408] = ffffffff 00000000
	stda	%f4 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 2c856213 00000000

p0_label_200:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 000000007f6a00ff, %f16 = 2a31de8c 00000000
	ldda	[%i4+%g0]0x88,%f16	! %f16 = 00000000 7f6a00ff
!	Mem[0000000010041408] = ff00000000a8af4f, %l2 = 0000000000000000
	ldxa	[%i1+%o4]0x80,%l2	! %l2 = ff00000000a8af4f
!	Mem[0000000010101408] = 00000000, %l0 = ffffffffffffffff
	lduba	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141410] = ff000000, %l4 = 00000000000000ff
	lduwa	[%i5+%o5]0x81,%l4	! %l4 = 00000000ff000000
!	Mem[0000000010001410] = 00000000, %l0 = 0000000000000000
	ldswa	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141418] = 20ef580a, %f11 = 00000046
	lda	[%i5+0x018]%asi,%f11	! %f11 = 20ef580a
!	Mem[00000000211c0000] = 00005a40, %l4 = 00000000ff000000, %asi = 80
	ldsba	[%o2+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101400] = 0000012900002597, %f10 = ff0000ff 20ef580a
	ldda	[%i4+%g0]0x89,%f10	! %f10 = 00000129 00002597
!	Mem[0000000030081408] = 00000000, %l7 = 0000000000000037
	lduha	[%i2+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141410] = 000000ff, %l2 = ff00000000a8af4f
	ldsha	[%i5+%o5]0x89,%l2	! %l2 = 00000000000000ff

p0_label_201:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 00000000, %l6 = 00000000000000f1
	ldstuba	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181401] = e23b3a56, %l5 = 00000023f1ffffff
	ldstuba	[%i6+0x001]%asi,%l5	! %l5 = 000000000000003b
!	Mem[0000000010041400] = 23000000, %l7 = 0000000000000000
	ldstuba	[%i1+%g0]0x88,%l7	! %l7 = 0000000000000000
!	%l2 = 00000000000000ff, Mem[0000000010181400] = e2ff3a56
	stha	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 00ff3a56
!	%f3  = 4c22ffff, Mem[0000000010001400] = ff000000
	sta	%f3 ,[%i0+%g0]0x80	! Mem[0000000010001400] = 4c22ffff
!	%l7 = 0000000000000000, Mem[0000000030001400] = 43f05dff00000000
	stxa	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000000000000000
!	%f29 = 1c368a02, %f6  = 458e7ae9
	fsqrts	%f29,%f6 		! %f6  = 2dd82bd7
!	Mem[0000000010141408] = ff002266, %l1 = 000000002a31de8c
	swapa	[%i5+%o4]0x80,%l1	! %l1 = 00000000ff002266
!	%f18 = 000000f7, Mem[0000000010141410] = 4c22ffff
	st	%f18,[%i5+%o5]		! Mem[0000000010141410] = 000000f7
!	Mem[0000000030181410] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i6+%o5]0x89,%l3	! %l3 = 0000000000000000

p0_label_202:
!	Starting 10 instruction Load Burst
!	Mem[000000001018141c] = 4c22ffff, %l2 = 00000000000000ff, %asi = 80
	ldswa	[%i6+0x01c]%asi,%l2	! %l2 = 000000004c22ffff
!	Mem[00000000100c1408] = ff000000, %l3 = 0000000000000000
	ldsba	[%i3+%o4]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[000000001018140c] = 1362852c, %l5 = 000000000000003b
	lduw	[%i6+0x00c],%l5		! %l5 = 000000001362852c
!	Mem[0000000030141410] = ff000000, %l1 = 00000000ff002266
	lduha	[%i5+%o5]0x81,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010041400] = ff000023f1ffffff, %f28 = 3d5c9877 1c368a02, %asi = 80
	ldda	[%i1+0x000]%asi,%f28	! %f28 = ff000023 f1ffffff
!	Mem[0000000010181410] = 000000ff, %l5 = 000000001362852c
	lduha	[%i6+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181408] = ff000000 1362852c, %l0 = 00000000, %l1 = 0000ff00, %asi = 80
	ldda	[%i6+0x008]%asi,%l0	! %l0 = 00000000ff000000 000000001362852c
!	Mem[0000000021800180] = ffff4d90, %l2 = 000000004c22ffff
	ldsb	[%o3+0x180],%l2		! %l2 = ffffffffffffffff
!	Mem[00000000100c1410] = 000000ff, %l0 = 00000000ff000000
	ldsha	[%i3+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181410] = ff000000, %l7 = 0000000000000000
	ldsba	[%i6+%o5]0x80,%l7	! %l7 = ffffffffffffffff

p0_label_203:
!	Starting 10 instruction Store Burst
!	%f24 = 43ccfaf1 0000361c, Mem[0000000030141400] = 00000000 43ccfaf1
	stda	%f24,[%i5+%g0]0x89	! Mem[0000000030141400] = 43ccfaf1 0000361c
!	Mem[0000000010001410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l6 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041400] = ff0000ff, %l6 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l6	! %l6 = 00000000ff0000ff
!	Mem[0000000010141408] = 8cde312a, %l6 = 00000000ff0000ff
	ldstuba	[%i5+%o4]0x88,%l6	! %l6 = 000000000000002a
!	%f23 = 00000000, Mem[0000000030081410] = ff000000
	sta	%f23,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	Mem[0000000010101410] = 563a3be2, %l2 = 00000000ffffffff
	swapa	[%i4+%o5]0x80,%l2	! %l2 = 00000000563a3be2
!	%f10 = 00000129 00002597, Mem[0000000010041400] = ff000023 f1ffffff
	stda	%f10,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000129 00002597
!	%f21 = ffffffe6, Mem[0000000030081410] = 00000000
	sta	%f21,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffffe6
!	%l5 = 00000000000000ff, Mem[0000000010001408] = 00000023f1ffffff
	stxa	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000000000ff

p0_label_204:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0001] = 00ffa3b0, %l4 = 0000000000000000, %asi = 80
	ldsba	[%o0+0x001]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041410] = 0000239b, %l3 = ffffffffffffffff
	lduba	[%i1+%o5]0x88,%l3	! %l3 = 000000000000009b
!	Mem[0000000010101410] = ffffffff, %f22 = 43f05d0f
	lda	[%i4+%o5]0x88,%f22	! %f22 = ffffffff
!	Mem[0000000030041400] = 00000000, %l3 = 000000000000009b
	ldswa	[%i1+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181410] = ff000000 c2dbd46d, %l2 = 563a3be2, %l3 = 00000000
	ldda	[%i6+%o5]0x81,%l2	! %l2 = 00000000ff000000 00000000c2dbd46d
!	Mem[0000000030041400] = 00000000, %l2 = 00000000ff000000
	ldswa	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, imm = 0000000000000184, %l0 = 00000000000000ff
	xnor	%l2,0x184,%l0		! %l0 = fffffffffffffe7b
!	Mem[0000000010181400] = 00ff3a5695972cdf, %l5 = 00000000000000ff
	ldxa	[%i6+%g0]0x80,%l5	! %l5 = 00ff3a5695972cdf
!	Mem[0000000010141400] = ff00000043ccfaf1, %f8  = 298f2a0a 00000000
	ldda	[%i5+%g0]0x80,%f8 	! %f8  = ff000000 43ccfaf1
!	Mem[0000000010041426] = c38f2266, %l4 = ffffffffffffffff, %asi = 80
	lduha	[%i1+0x026]%asi,%l4	! %l4 = 0000000000002266

p0_label_205:
!	Starting 10 instruction Store Burst
!	%f30 = 00000000, Mem[0000000030101410] = e97a8e45
	sta	%f30,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	Mem[00000000300c1410] = ff000000, %l7 = 00000000ffffffff
	swapa	[%i3+%o5]0x81,%l7	! %l7 = 00000000ff000000
!	%l7 = 00000000ff000000, Mem[00000000100c1413] = ff000000, %asi = 80
	stba	%l7,[%i3+0x013]%asi	! Mem[00000000100c1410] = ff000000
!	%l4 = 00002266, %l5 = 95972cdf, Mem[0000000030081410] = e6ffffff 00000070
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 00002266 95972cdf
!	Mem[0000000010181400] = 563aff00, %l2 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l2	! %l2 = 00000000563aff00
!	Mem[0000000010101402] = ff006a7f, %l2 = 00000000563aff00
	ldstuba	[%i4+0x002]%asi,%l2	! %l2 = 000000000000006a
!	%l0 = fffffffffffffe7b, Mem[00000000300c1400] = 0a2a8f29
	stha	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = fe7b8f29
!	%f8  = ff000000 43ccfaf1, Mem[0000000030001408] = af4f0000 f7000000
	stda	%f8 ,[%i0+%o4]0x81	! Mem[0000000030001408] = ff000000 43ccfaf1
!	Mem[0000000030101400] = 00002597, %l1 = 000000001362852c
	ldstuba	[%i4+%g0]0x89,%l1	! %l1 = 0000000000000097
!	Mem[00000000218000c1] = faf16b00, %l7 = 00000000ff000000
	ldstuba	[%o3+0x0c1]%asi,%l7	! %l7 = 00000000000000f1

p0_label_206:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00000129000025ff, %l1 = 0000000000000097
	ldxa	[%i4+%g0]0x89,%l1	! %l1 = 00000129000025ff
!	Mem[0000000010181408] = 000000ff, %l4 = 0000000000002266
	lduba	[%i6+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1400] = fe7b8f29, %l1 = 00000129000025ff
	ldsba	[%i3+%g0]0x81,%l1	! %l1 = fffffffffffffffe
!	Mem[0000000030001410] = ff000000, %l0 = fffffffffffffe7b
	ldsha	[%i0+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l7 = 00000000000000f1
	ldswa	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081400] = 43f05dff, %f12 = 00000000
	lda	[%i2+%g0]0x81,%f12	! %f12 = 43f05dff
!	Mem[00000000300c1410] = ffffffff, %l2 = 000000000000006a
	ldswa	[%i3+%o5]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030041410] = ff000000, %l7 = 0000000000000000
	lduba	[%i1+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141408] = ff31de8c, %l4 = 00000000000000ff
	ldsba	[%i5+%o4]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141408] = ff31de8c, %f0  = 43ccfaf1
	lda	[%i5+%o4]0x80,%f0 	! %f0 = ff31de8c

p0_label_207:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000, %l1 = fffffffe, Mem[0000000030101410] = 00000000 00000000
	stda	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000 fffffffe
!	%f13 = 000000ff, %f17 = 7f6a00ff
	fcmps	%fcc2,%f13,%f17		! %fcc2 = 1
!	Mem[0000000030101408] = ff000000, %l5 = 0000000095972cdf
	swapa	[%i4+%o4]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030001408] = 000000ff, %l2 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%l3 = 00000000c2dbd46d, Mem[0000000010181400] = 00000000
	stba	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000006d
!	%f12 = 43f05dff 000000ff, Mem[0000000010081400] = 2a31de8c 00000000
	stda	%f12,[%i2+%g0]0x80	! Mem[0000000010081400] = 43f05dff 000000ff
!	Mem[0000000010081408] = f7000000, %l0 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l0	! %l0 = 00000000f7000000
!	Mem[0000000030041408] = f1facc43, %l2 = 00000000000000ff
	swapa	[%i1+%o4]0x89,%l2	! %l2 = 00000000f1facc43
!	Mem[0000000030101410] = 00000000, %l0 = 00000000f7000000
	swapa	[%i4+%o5]0x89,%l0	! %l0 = 0000000000000000
!	%l4 = ffffffffffffffff, immd = 00000000000005e6, %l108 = 0000000000000006
	sdivx	%l4,0x5e6,%l6		! %l6 = 0000000000000000

p0_label_208:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %f8  = ff000000
	lda	[%i0+%o4]0x80,%f8 	! %f8 = 00000000
!	Mem[0000000010001402] = 4c22ffff, %l4 = ffffffffffffffff
	lduh	[%i0+0x002],%l4		! %l4 = 000000000000ffff
!	Mem[0000000030041408] = 000000ff, %l7 = 00000000000000ff
	ldsba	[%i1+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010141400] = ff00000043ccfaf1, %f30 = 00000000 43f05dff
	ldda	[%i5+%g0]0x80,%f30	! %f30 = ff000000 43ccfaf1
!	Mem[00000000300c1410] = ffffffff, %l5 = 00000000ff000000
	lduwa	[%i3+%o5]0x89,%l5	! %l5 = 00000000ffffffff
!	Mem[00000000100c1410] = ffff0000000000ff, %f26 = ffffff00 b7ff22ff
	ldda	[%i3+%o5]0x88,%f26	! %f26 = ffff0000 000000ff
!	Mem[000000001018140c] = 1362852c, %l5 = 00000000ffffffff
	lduw	[%i6+0x00c],%l5		! %l5 = 000000001362852c
!	Mem[0000000030041400] = 00000000, %l6 = 0000000000000000
	ldswa	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181410] = 000000ff, %l7 = ffffffffffffffff
	lduha	[%i6+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001408] = f1facc43000000ff, %l4 = 000000000000ffff
	ldxa	[%i0+%o4]0x89,%l4	! %l4 = f1facc43000000ff

p0_label_209:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000f1facc43, %l0 = 0000000000000000, %l0 = 0000000000000000
	or	%l2,%l0,%l0		! %l0 = 00000000f1facc43
!	%l7 = 00000000000000ff, Mem[00000000211c0000] = 00005a40
	sth	%l7,[%o2+%g0]		! Mem[00000000211c0000] = 00ff5a40
!	%f26 = ffff0000 000000ff, Mem[0000000030141400] = 0000361c 43ccfaf1
	stda	%f26,[%i5+%g0]0x89	! Mem[0000000030141400] = ffff0000 000000ff
!	Mem[0000000010081400] = 43f05dff, %l1 = 00000000fffffffe
	swapa	[%i2+%g0]0x80,%l1	! %l1 = 0000000043f05dff
!	%f26 = ffff0000 000000ff, Mem[0000000010081408] = 00000000 00004faf, %asi = 80
	stda	%f26,[%i2+0x008]%asi	! Mem[0000000010081408] = ffff0000 000000ff
!	Mem[0000000010101408] = 00000000, %l1 = 0000000043f05dff
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000000
!	%l0 = 00000000f1facc43, Mem[0000000030101410] = f7000000
	stwa	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = f1facc43
!	%f20 = 8cde312a, Mem[0000000010101400] = 7fff00ff
	sta	%f20,[%i4+%g0]0x88	! Mem[0000000010101400] = 8cde312a
!	%f8  = 00000000 43ccfaf1, %l3 = 00000000c2dbd46d
!	Mem[00000000100c1420] = c38f226600a8af4f
	add	%i3,0x020,%g1
	stda	%f8,[%g1+%l3]ASI_PST32_PL ! Mem[00000000100c1420] = f1facc4300a8af4f
!	Mem[0000000030101408] = 95972cdf, %l4 = 00000000000000ff
	swapa	[%i4+%o4]0x81,%l4	! %l4 = 0000000095972cdf

p0_label_210:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001438] = 00ff0000, %f9  = 43ccfaf1
	lda	[%i0+0x038]%asi,%f9 	! %f9 = 00ff0000
!	Mem[0000000010181408] = 2c856213000000ff, %l1 = 0000000000000000
	ldxa	[%i6+%o4]0x88,%l1	! %l1 = 2c856213000000ff
!	Mem[000000001018143c] = 2c856213, %f5  = 00000000
	ld	[%i6+0x03c],%f5 	! %f5 = 2c856213
!	Mem[0000000010181408] = 2c856213000000ff, %l0 = 00000000f1facc43
	ldxa	[%i6+%o4]0x88,%l0	! %l0 = 2c856213000000ff
!	Mem[00000000100c1408] = ff000000, %l2 = 00000000f1facc43, %asi = 80
	ldswa	[%i3+0x008]%asi,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010101408] = 2c856213 43f05dff, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i4+%o4]0x88,%l6	! %l6 = 0000000043f05dff 000000002c856213
!	Mem[00000000218001c0] = 8a803bc0, %l6 = 0000000043f05dff, %asi = 80
	ldsha	[%o3+0x1c0]%asi,%l6	! %l6 = ffffffffffff8a80
!	Mem[0000000010081410] = ffffffff, %l4 = 0000000095972cdf
	lduba	[%i2+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101410] = 43ccfaf1fffffffe, %f8  = 00000000 00ff0000
	ldda	[%i4+%o5]0x81,%f8 	! %f8  = 43ccfaf1 fffffffe
!	Mem[0000000010101410] = ffffffff, %l7 = 000000002c856213
	lduha	[%i4+%o5]0x88,%l7	! %l7 = 000000000000ffff

p0_label_211:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = ff000000, %l5 = 000000001362852c
	ldstuba	[%i5+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	%f11 = 00002597, Mem[0000000030041408] = 000000ff
	sta	%f11,[%i1+%o4]0x89	! Mem[0000000030041408] = 00002597
!	Code Fragment 3, seed = 686853
p0_fragment_21:
!	%l0 = 2c856213000000ff
	setx	0xbf3ef7479386b4fe,%g7,%l0 ! %l0 = bf3ef7479386b4fe
!	%l1 = 2c856213000000ff
	setx	0xbfd49adecaab31a9,%g7,%l1 ! %l1 = bfd49adecaab31a9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = bf3ef7479386b4fe
	setx	0xc7f2247a8fe4aa64,%g7,%l0 ! %l0 = c7f2247a8fe4aa64
!	%l1 = bfd49adecaab31a9
	setx	0xcb8e7a9ee7dfa22f,%g7,%l1 ! %l1 = cb8e7a9ee7dfa22f
p0_fragment_21_end:
!	%f22 = ffffffff, Mem[0000000010141408] = 8cde31ff
	sta	%f22,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffffff
!	%l2 = ffffffffff000000, Mem[0000000010081431] = 3d5c9877, %asi = 80
	stba	%l2,[%i2+0x031]%asi	! Mem[0000000010081430] = 3d009877
!	%l4 = 00000000000000ff, Mem[0000000010101408] = 43f05dff
	stwa	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000ff
!	Mem[0000000010081410] = ffffffff, %l3 = 00000000c2dbd46d, %asi = 80
	swapa	[%i2+0x010]%asi,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000010181400] = 0000006d, %l3 = 00000000ffffffff
	ldstuba	[%i6+%g0]0x88,%l3	! %l3 = 000000000000006d
!	%l4 = 00000000000000ff, Mem[0000000030001410] = ff000000
	stwa	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff
!	Mem[00000000201c0000] = 00ffa3b0, %l7 = 000000000000ffff
	ldstuba	[%o0+0x000]%asi,%l7	! %l7 = 0000000000000000

p0_label_212:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 0000faf1, %f17 = 7f6a00ff
	lda	[%i3+%o4]0x81,%f17	! %f17 = 0000faf1
!	Mem[00000000211c0000] = 00ff5a40, %l5 = 00000000000000ff
	lduh	[%o2+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010001410] = ff000000 f1facc43, %l2 = ff000000, %l3 = 0000006d, %asi = 80
	ldda	[%i0+0x010]%asi,%l2	! %l2 = 00000000ff000000 00000000f1facc43
!	Mem[00000000300c1400] = 298f7bfe, %l7 = 0000000000000000
	ldswa	[%i3+%g0]0x89,%l7	! %l7 = 00000000298f7bfe
!	Mem[00000000100c1403] = 00006a7f, %l1 = cb8e7a9ee7dfa22f
	ldub	[%i3+0x003],%l1		! %l1 = 000000000000007f
!	Mem[0000000030041410] = ff000000, %l6 = ffffffffffff8a80
	lduwa	[%i1+%o5]0x81,%l6	! %l6 = 00000000ff000000
!	Mem[0000000030041410] = 000000ff, %l3 = 00000000f1facc43
	ldsha	[%i1+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141400] = ff000000, %l0 = c7f2247a8fe4aa64
	ldsha	[%i5+%g0]0x80,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000030101408] = 000000ff, %l4 = 00000000000000ff
	ldsha	[%i4+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081400] = ff000000feffffff, %f26 = ffff0000 000000ff
	ldda	[%i2+%g0]0x88,%f26	! %f26 = ff000000 feffffff

p0_label_213:
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffffff00, Mem[0000000010041410] = 0000239b
	stba	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 00002300
!	%l6 = 00000000ff000000, Mem[0000000010081400] = ff000000feffffff
	stxa	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000ff000000
!	Mem[0000000010041408] = ff000000, %l3 = 00000000000000ff
	ldstuba	[%i1+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081400] = 43f05dff, %l7 = 00000000298f7bfe
	ldstuba	[%i2+%g0]0x81,%l7	! %l7 = 0000000000000043
!	%f30 = ff000000 43ccfaf1, Mem[0000000010041408] = 000000ff 4fafa800
	stda	%f30,[%i1+%o4]0x88	! Mem[0000000010041408] = ff000000 43ccfaf1
!	%f4  = 2c856213, %f18 = 000000f7, %f18 = 000000f7
	fadds	%f4 ,%f18,%f18		! tt=0x22, %l0 = ffffffffffffff22
!	Mem[00000000300c1408] = f1fa0000, %l2 = 00000000ff000000
	swapa	[%i3+%o4]0x89,%l2	! %l2 = 00000000f1fa0000
!	Mem[0000000010081418] = 43f05d0f, %l2 = 00000000f1fa0000, %asi = 80
	swapa	[%i2+0x018]%asi,%l2	! %l2 = 0000000043f05d0f
!	Mem[0000000010181428] = 1d7929b9, %l2 = 0000000043f05d0f, %asi = 80
	swapa	[%i6+0x028]%asi,%l2	! %l2 = 000000001d7929b9
!	Mem[00000000300c1408] = 000000ff, %l0 = ffffffffffffff22
	ldstuba	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000

p0_label_214:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 000000ff, %l7 = 0000000000000043
	ldswa	[%i5+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181400] = 6dd4d600, %l7 = 00000000000000ff
	ldswa	[%i6+%g0]0x89,%l7	! %l7 = 000000006dd4d600
!	Mem[00000000201c0000] = ffffa3b0, %l5 = 00000000000000ff, %asi = 80
	ldsha	[%o0+0x000]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030141410] = ff000000f1facc43, %l2 = 000000001d7929b9
	ldxa	[%i5+%o5]0x81,%l2	! %l2 = ff000000f1facc43
!	Mem[0000000010141410] = f7000000, %l0 = 0000000000000000
	ldsba	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = 8cde312a, %l2 = ff000000f1facc43
	lduha	[%i4+%g0]0x88,%l2	! %l2 = 000000000000312a
!	Mem[0000000010141400] = 000000ff, %l2 = 000000000000312a
	ldsha	[%i5+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101408] = ff000000, %f30 = ff000000
	lda	[%i4+%o4]0x89,%f30	! %f30 = ff000000
!	Mem[0000000030101410] = f1facc43, %f0  = ff31de8c
	lda	[%i4+%o5]0x89,%f0 	! %f0 = f1facc43
!	Mem[0000000030181408] = 00000000, %l4 = 0000000000000000
	ldswa	[%i6+%o4]0x89,%l4	! %l4 = 0000000000000000

p0_label_215:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = ffffffff, %l1 = 000000000000007f
	ldstuba	[%i5+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001400] = 00000000, %l5 = ffffffffffffffff
	ldstuba	[%i0+%g0]0x81,%l5	! %l5 = 0000000000000000
!	%l4 = 0000000000000000, %l7 = 000000006dd4d600, %y  = 00000000
	smul	%l4,%l7,%l3		! %l3 = 0000000000000000, %y = 00000000
!	Mem[0000000010001410] = 000000ff, %l1 = 00000000000000ff
	ldstuba	[%i0+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000030101400] = 000025ff
	stwa	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	Mem[0000000010101410] = ffffffff, %l4 = 0000000000000000
	swapa	[%i4+%o5]0x88,%l4	! %l4 = 00000000ffffffff
!	%f24 = 43ccfaf1 0000361c, Mem[0000000030001408] = 000000ff f1facc43
	stda	%f24,[%i0+%o4]0x89	! Mem[0000000030001408] = 43ccfaf1 0000361c
!	%l2 = 00000000000000ff, imm = 00000000000005f4, %l2 = 00000000000000ff
	orn	%l2,0x5f4,%l2		! %l2 = fffffffffffffaff
!	%l2 = fffffffffffffaff, Mem[0000000010101410] = 00000000
	stwa	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = fffffaff
!	%l4 = 00000000ffffffff, immd = 0000000000000827, %l108 = 0000000000000004
	sdivx	%l4,0x827,%l4		! %l4 = 00000000001f66ea

p0_label_216:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ff000000, %l6 = 00000000ff000000
	ldsba	[%i1+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030001410] = 000000ff, %l0 = 0000000000000000
	ldsba	[%i0+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000300c1410] = ffffffff, %l0 = ffffffffffffffff
	ldswa	[%i3+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030041408] = 97250000, %l0 = ffffffffffffffff
	ldsba	[%i1+%o4]0x81,%l0	! %l0 = ffffffffffffff97
!	Mem[00000000218000c0] = faff6b00, %l2 = fffffffffffffaff, %asi = 80
	lduba	[%o3+0x0c0]%asi,%l2	! %l2 = 00000000000000fa
!	Mem[0000000010141410] = 000000f7, %l0 = ffffffffffffff97
	lduba	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000000
!	%l2 = 00000000000000fa, immd = 00000000000008cf, %l2  = 00000000000000fa
	mulx	%l2,0x8cf,%l2		! %l2 = 0000000000089a26
!	Mem[0000000010181410] = 000000ff, %l7 = 000000006dd4d600
	ldsba	[%i6+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181410] = ff00000064b02073, %l0 = 0000000000000000
	ldx	[%i6+%o5],%l0		! %l0 = ff00000064b02073
!	Mem[0000000010041410] = 00002300, %l3 = 0000000000000000
	lduwa	[%i1+%o5]0x88,%l3	! %l3 = 0000000000002300

p0_label_217:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 00d6d46d, %l3 = 0000000000002300
	swapa	[%i6+%g0]0x81,%l3	! %l3 = 0000000000d6d46d
!	Mem[0000000010181400] = ff000000 95972cdf ff000000 1362852c
!	%f0  = f1facc43 00000000 8cde312a 4c22ffff
!	%f4  = 2c856213 2c856213 2dd82bd7 57800000
!	%f8  = 43ccfaf1 fffffffe 00000129 00002597
!	%f12 = 43f05dff 000000ff 00000023 f1ffffff
	stda	%f0 ,[%i6+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010181400
!	Mem[0000000010041400] = 0000012900002597, %l0 = ff00000064b02073, %l5 = 0000000000000000
	casxa	[%i1]0x80,%l0,%l5	! %l5 = 0000012900002597
!	Mem[0000000030041410] = 000000ff, %l4 = 00000000001f66ea
	ldstuba	[%i1+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	%l3 = 0000000000d6d46d, Mem[0000000030081400] = fff05dff
	stwa	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = 00d6d46d
!	%f24 = 43ccfaf1 0000361c, Mem[0000000010141410] = f7000000 00000000
	stda	%f24,[%i5+%o5]0x88	! Mem[0000000010141410] = 43ccfaf1 0000361c
!	%l5 = 0000012900002597, Mem[0000000010001400] = 4c22ffff
	stha	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 2597ffff
!	Mem[0000000020800000] = ff00b9e0, %l4 = 00000000000000ff
	ldstub	[%o1+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[00000000300c1408] = ff0000ff, %l7 = 00000000ffffffff
	swapa	[%i3+%o4]0x81,%l7	! %l7 = 00000000ff0000ff
!	%l6 = ffffffffffffffff, Mem[0000000010081430] = 3d0098771c368a02, %asi = 80
	stxa	%l6,[%i2+0x030]%asi	! Mem[0000000010081430] = ffffffffffffffff

p0_label_218:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 000000ff, %l2 = 0000000000089a26
	ldswa	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1400] = 7f6a0000, %f22 = ffffffff
	lda	[%i3+%g0]0x88,%f22	! %f22 = 7f6a0000
!	Mem[0000000030141400] = 000000ff, %l4 = 00000000000000ff
	lduba	[%i5+%g0]0x89,%l4	! %l4 = 00000000000000ff
	membar	#Sync			! Added by membar checker (38)
!	Mem[0000000010181408] = ffff224c, %l2 = 00000000000000ff
	lduba	[%i6+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081400] = 00d6d46d00000000, %f14 = 00000023 f1ffffff
	ldda	[%i2+%g0]0x81,%f14	! %f14 = 00d6d46d 00000000
!	Mem[00000000100c1410] = 000000ff, %l5 = 0000012900002597
	ldswa	[%i3+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041410] = 00002300, %l2 = 00000000000000ff
	lduwa	[%i1+%o5]0x88,%l2	! %l2 = 0000000000002300
!	Mem[0000000010141410] = 0000361c, %l7 = 00000000ff0000ff
	ldsba	[%i5+%o5]0x88,%l7	! %l7 = 000000000000001c
!	Mem[0000000030001400] = ff000000, %l2 = 0000000000002300
	ldsba	[%i0+%g0]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000020800000] = ff00b9e0, %l1 = 00000000000000ff
	lduh	[%o1+%g0],%l1		! %l1 = 000000000000ff00

p0_label_219:
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffffffff, Mem[0000000030081408] = 00000000
	stwa	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffffff
!	Mem[0000000010101408] = 000000ff, %l0 = 0000000064b02073
	swapa	[%i4+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041400] = 00000129, %l7 = 000000000000001c
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000129
!	%f12 = 43f05dff 000000ff, Mem[0000000030101400] = 00000000 29010000
	stda	%f12,[%i4+%g0]0x81	! Mem[0000000030101400] = 43f05dff 000000ff
!	%l1 = 000000000000ff00, Mem[0000000020800001] = ff00b9e0, %asi = 80
	stba	%l1,[%o1+0x001]%asi	! Mem[0000000020800000] = ff00b9e0
!	%l0 = 000000ff, %l1 = 0000ff00, Mem[0000000010101400] = 8cde312a 00000000
	stda	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff 0000ff00
!	%l4 = 00000000000000ff, %l6 = ffffffffffffffff, %l3 = 0000000000d6d46d
	udivx	%l4,%l6,%l3		! %l3 = 0000000000000000
!	%f8  = 43ccfaf1 fffffffe, Mem[0000000010181400] = 00000000 43ccfaf1
	stda	%f8 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 43ccfaf1 fffffffe
!	Mem[0000000030041410] = ff000000, %l5 = 00000000000000ff
	swapa	[%i1+%o5]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030081410] = 66220000, %l4 = 00000000000000ff
	swapa	[%i2+%o5]0x89,%l4	! %l4 = 0000000066220000

p0_label_220:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00002597, %f27 = feffffff
	lda	[%i1+%o4]0x89,%f27	! %f27 = 00002597
!	Mem[00000000300c1408] = ffffffff, %l1 = 000000000000ff00
	lduha	[%i3+%o4]0x81,%l1	! %l1 = 000000000000ffff
!	Mem[00000000300c1410] = ffffffff00000000, %f18 = 000000f7 00004faf
	ldda	[%i3+%o5]0x81,%f18	! %f18 = ffffffff 00000000
!	Mem[0000000010141410] = 1c360000, %l2 = ffffffffffffffff, %asi = 80
	lduwa	[%i5+0x010]%asi,%l2	! %l2 = 000000001c360000
!	Mem[00000000300c1400] = fe7b8f29, %l7 = 0000000000000129
	ldswa	[%i3+%g0]0x81,%l7	! %l7 = fffffffffe7b8f29
!	Mem[0000000030101410] = f1facc43, %l0 = 00000000000000ff
	ldsba	[%i4+%o5]0x89,%l0	! %l0 = 0000000000000043
!	Mem[0000000010001430] = 0dcc85378cb61632, %f18 = ffffffff 00000000
	ldd	[%i0+0x030],%f18	! %f18 = 0dcc8537 8cb61632
!	Mem[0000000010081434] = ffffffff, %l3 = 0000000000000000
	lduw	[%i2+0x034],%l3		! %l3 = 00000000ffffffff
!	Mem[0000000010041410] = 00230000 00000000, %l6 = ffffffff, %l7 = fe7b8f29, %asi = 80
	ldda	[%i1+0x010]%asi,%l6	! %l6 = 0000000000230000 0000000000000000
!	Mem[0000000010141410] = 1c360000, %l7 = 0000000000000000
	ldsha	[%i5+%o5]0x80,%l7	! %l7 = 0000000000001c36

p0_label_221:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000001c36, Mem[0000000010141430] = 0f394b73
	stw	%l7,[%i5+0x030]		! Mem[0000000010141430] = 00001c36
!	Mem[0000000030081408] = ffffffff, %l7 = 0000000000001c36
	swapa	[%i2+%o4]0x81,%l7	! %l7 = 00000000ffffffff
!	%f24 = 43ccfaf1, Mem[00000000100c1418] = 80090000
	sta	%f24,[%i3+0x018]%asi	! Mem[00000000100c1418] = 43ccfaf1
!	%f26 = ff000000 00002597, %l2 = 000000001c360000
!	Mem[0000000030081438] = 0000000000000000
	add	%i2,0x038,%g1
	stda	%f26,[%g1+%l2]ASI_PST32_S ! Mem[0000000030081438] = 0000000000000000
!	%f28 = ff000023 f1ffffff, Mem[0000000030101400] = 43f05dff 000000ff
	stda	%f28,[%i4+%g0]0x81	! Mem[0000000030101400] = ff000023 f1ffffff
!	%l7 = 00000000ffffffff, Mem[00000000211c0001] = 00ff5a40, %asi = 80
	stba	%l7,[%o2+0x001]%asi	! Mem[00000000211c0000] = 00ff5a40
!	%l4 = 66220000, %l5 = ff000000, Mem[0000000010141428] = 19000000 e60a0000
	std	%l4,[%i5+0x028]		! Mem[0000000010141428] = 66220000 ff000000
!	%f24 = 43ccfaf1 0000361c, %l3 = 00000000ffffffff
!	Mem[0000000010001438] = 00ff000000000000
	add	%i0,0x038,%g1
	stda	%f24,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010001438] = 1c360000f1facc43
!	%l5 = 00000000ff000000, Mem[0000000010001408] = 00000000
	stha	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	%f26 = ff000000, %f16 = 00000000, %f23 = 00000000
	fdivs	%f26,%f16,%f23		! %f23 = ff800000

p0_label_222:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00230000, %l3 = 00000000ffffffff
	lduha	[%i6+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000218000c1] = faff6b00, %l1 = 000000000000ffff, %asi = 80
	lduba	[%o3+0x0c1]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081410] = c2dbd46d 2a31de8c, %l2 = 1c360000, %l3 = 00000000
	ldda	[%i2+%o5]0x80,%l2	! %l2 = 00000000c2dbd46d 000000002a31de8c
!	Mem[0000000010181408] = 4c22ffff, %l3 = 000000002a31de8c
	lduba	[%i6+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000218000c0] = faff6b00, %l0 = 0000000000000043
	ldsh	[%o3+0x0c0],%l0		! %l0 = fffffffffffffaff
!	Mem[0000000010101408] = 2c85621364b02073, %l4 = 0000000066220000
	ldxa	[%i4+%o4]0x88,%l4	! %l4 = 2c85621364b02073
!	Mem[0000000030041410] = 000000ff f1facc43, %l0 = fffffaff, %l1 = 000000ff
	ldda	[%i1+%o5]0x81,%l0	! %l0 = 00000000000000ff 00000000f1facc43
	membar	#Sync			! Added by membar checker (39)
!	Mem[0000000030081400] = 00d6d46d 00000000 00001c36 00000000
!	Mem[0000000030081410] = ff000000 95972cdf 43f05d0f da9f434b
!	Mem[0000000030081420] = 9725ca24 3e295957 ffc4787f 51d2834c
!	Mem[0000000030081430] = 3d5c9877 1c368a02 00000000 00000000
	ldda	[%i2+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030081400
!	Mem[0000000010001408] = 00000000, %l1 = 00000000f1facc43
	ldswa	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041436] = ffffff00, %l0 = 00000000000000ff, %asi = 80
	ldsha	[%i1+0x036]%asi,%l0	! %l0 = ffffffffffffff00

p0_label_223:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ff000000, Mem[0000000010041430] = 0dcc8537ffffff00
	stx	%l5,[%i1+0x030]		! Mem[0000000010041430] = 00000000ff000000
!	%l4 = 2c85621364b02073, Mem[0000000030041400] = 0000000000000046
	stxa	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 2c85621364b02073
!	%l4 = 2c85621364b02073, Mem[0000000010001410] = 000000ff
	stwa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 64b02073
!	%f24 = 9725ca24 3e295957, %l4 = 2c85621364b02073
!	Mem[0000000010081408] = ffff0000000000ff
	add	%i2,0x008,%g1
	stda	%f24,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010081408] = 5759000024ca25ff
!	Mem[0000000030101410] = 43ccfaf1, %l5 = 00000000ff000000
	ldstuba	[%i4+%o5]0x81,%l5	! %l5 = 0000000000000043
!	%l2 = 00000000c2dbd46d, Mem[0000000030141408] = 7f6a0000000000ff
	stxa	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000c2dbd46d
!	%l0 = ffffff00, %l1 = 00000000, Mem[0000000010081408] = 57590000 24ca25ff
	stda	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffff00 00000000
!	Mem[0000000030081408] = 00001c36, %l3 = 00000000000000ff
	ldstuba	[%i2+%o4]0x81,%l3	! %l3 = 0000000000000000
!	%l6 = 0000000000230000, Mem[0000000010041410] = 00002300
	stwa	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 00230000
!	%f21 = 95972cdf, Mem[00000000300c1408] = ffffffff
	sta	%f21,[%i3+%o4]0x81	! Mem[00000000300c1408] = 95972cdf

p0_label_224:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = fffffff1230000ff, %l1 = 0000000000000000
	ldxa	[%i4+%g0]0x89,%l1	! %l1 = fffffff1230000ff
!	Mem[0000000021800080] = ffd56cd0, %l2 = 00000000c2dbd46d, %asi = 80
	lduba	[%o3+0x080]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141400] = 000000ff, %l3 = 0000000000000000
	lduba	[%i5+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[000000001014143e] = e23b3a56, %l0 = ffffffffffffff00, %asi = 80
	lduha	[%i5+0x03e]%asi,%l0	! %l0 = 0000000000003a56
!	Mem[0000000010001408] = 00000000, %l6 = 0000000000230000
	ldsba	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081410] = 6dd4dbc2, %l1 = fffffff1230000ff
	ldsha	[%i2+%o5]0x88,%l1	! %l1 = ffffffffffffdbc2
!	Mem[00000000201c0000] = ffffa3b0, %l7 = 00000000ffffffff
	ldsb	[%o0+%g0],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010141400] = 000000ff, %l4 = 2c85621364b02073
	ldsha	[%i5+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001422] = f1facc43, %l2 = 00000000000000ff, %asi = 80
	lduba	[%i0+0x022]%asi,%l2	! %l2 = 00000000000000cc
!	Mem[0000000030101410] = fefffffff1faccff, %f8  = 43ccfaf1 fffffffe
	ldda	[%i4+%o5]0x89,%f8 	! %f8  = feffffff f1faccff

p0_label_225:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (40)
!	%l7 = ffffffffffffffff, Mem[0000000030081400] = 00d6d46d00000000
	stxa	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffffffffffffff
!	Mem[00000000300c1400] = 298f7bfe, %l5 = 0000000000000043
	ldstuba	[%i3+%g0]0x89,%l5	! %l5 = 00000000000000fe
!	%f0  = f1facc43 00000000, Mem[0000000010101408] = 7320b064 1362852c
	stda	%f0 ,[%i4+%o4]0x80	! Mem[0000000010101408] = f1facc43 00000000
!	%l4 = 00000000000000ff, immd = 0000000000000256, %l108 = 0000000000000002
	udivx	%l4,0x256,%l2		! %l2 = 0000000000000000
!	%l4 = 000000ff, %l5 = 000000fe, Mem[0000000010141408] = ffffffff f1facc43
	stda	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff 000000fe
!	%l2 = 0000000000000000, Mem[0000000010181410] = 2c8562132c856213
	stxa	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000000000000000
!	%f31 = 00000000, Mem[0000000030081408] = 361c00ff
	sta	%f31,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	Mem[0000000030181400] = 00002300, %l2 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101408] = 43ccfaf1, %l7 = 00000000ffffffff
	swapa	[%i4+%o4]0x88,%l7	! %l7 = 0000000043ccfaf1
!	%l4 = 00000000000000ff, Mem[0000000030141408] = 6dd4dbc2
	stba	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = ffd4dbc2

p0_label_226:
!	Starting 10 instruction Load Burst
!	%l2 = 0000000000000000, immd = fffffffffffff270, %l108 = 0000000000000007
	udivx	%l2,-0xd90,%l7		! %l7 = 0000000000000000
!	Mem[000000001018142e] = 29010000, %l3 = 00000000000000ff
	lduh	[%i6+0x02e],%l3		! %l3 = 0000000000000000
!	%l4 = 00000000000000ff, immd = 0000000000000d15, %l6  = 0000000000000000
	mulx	%l4,0xd15,%l6		! %l6 = 00000000000d07eb
!	Mem[0000000030181400] = ff002300 00000000, %l4 = 000000ff, %l5 = 000000fe
	ldda	[%i6+%g0]0x81,%l4	! %l4 = 00000000ff002300 0000000000000000
!	%f31 = 00000000, %f29 = 1c368a02, %f11 = 00002597
	fadds	%f31,%f29,%f11		! %f11 = 1c368a02
!	Mem[0000000030081408] = 00000000, %l0 = 0000000000003a56
	ldstuba	[%i2+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041408] = f1facc43000000ff, %l4 = 00000000ff002300
	ldx	[%i1+%o4],%l4		! %l4 = f1facc43000000ff
!	Mem[0000000030041410] = 43ccfaf1 ff000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i1+%o5]0x89,%l4	! %l4 = 00000000ff000000 0000000043ccfaf1
!	%l2 = 0000000000000000, immd = 00000000000008c2, %l5  = 0000000043ccfaf1
	mulx	%l2,0x8c2,%l5		! %l5 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l1 = ffffffffffffdbc2
	ldsba	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000000

p0_label_227:
!	Starting 10 instruction Store Burst
!	%f14 = 00d6d46d 00000000, Mem[0000000030001400] = ff000000 00000000
	stda	%f14,[%i0+%g0]0x81	! Mem[0000000030001400] = 00d6d46d 00000000
!	%l6 = 00000000000d07eb, Mem[0000000030181408] = 0000005900000000
	stxa	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000000d07eb
!	Mem[000000001000140c] = 000000ff, %l3 = 0000000000000000
	swap	[%i0+0x00c],%l3		! %l3 = 00000000000000ff
!	Mem[000000001010141b] = ffffffff, %l1 = 0000000000000000
	ldstuba	[%i4+0x01b]%asi,%l1	! %l1 = 00000000000000ff
!	%f3  = 4c22ffff, Mem[0000000030041408] = 97250000
	sta	%f3 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 4c22ffff
!	%l0 = 0000000000000000, Mem[00000000201c0001] = ffffa3b0, %asi = 80
	stba	%l0,[%o0+0x001]%asi	! Mem[00000000201c0000] = ff00a3b0
!	%l4 = 00000000ff000000, Mem[0000000010141408] = ff000000fe000000, %asi = 80
	stxa	%l4,[%i5+0x008]%asi	! Mem[0000000010141408] = 00000000ff000000
!	%l3 = 00000000000000ff, Mem[00000000211c0000] = 00ff5a40
	stb	%l3,[%o2+%g0]		! Mem[00000000211c0000] = ffff5a40
!	%f24 = 9725ca24, %f0  = f1facc43, %f28 = 3d5c9877
	fadds	%f24,%f0 ,%f28		! %f28 = f1facc43
!	%f16 = 00d6d46d 00000000, %l1 = 00000000000000ff
!	Mem[00000000100c1438] = 563a3be200a8af4f
	add	%i3,0x038,%g1
	stda	%f16,[%g1+%l1]ASI_PST32_P ! Mem[00000000100c1438] = 00d6d46d00000000

p0_label_228:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = f1facc43, %l2 = 0000000000000000
	lduwa	[%i6+%g0]0x88,%l2	! %l2 = 00000000f1facc43
!	Mem[0000000030101408] = ff000000, %l1 = 00000000000000ff
	lduba	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000211c0001] = ffff5a40, %l5 = 0000000000000000
	ldsb	[%o2+0x001],%l5		! %l5 = ffffffffffffffff
!	%l2 = 00000000f1facc43, %l6 = 00000000000d07eb, %y  = 00000000
	sdiv	%l2,%l6,%l1		! %l1 = 0000000000001291
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000010101438] = 00000000000087ff, %l1 = 0000000000001291
	ldx	[%i4+0x038],%l1		! %l1 = 00000000000087ff
!	Mem[0000000010101404] = 00ff0000, %l7 = 0000000000000000
	ldsb	[%i4+0x004],%l7		! %l7 = 0000000000000000
!	Mem[0000000010141418] = 20ef580a 00000980, %l6 = 000d07eb, %l7 = 00000000, %asi = 80
	ldda	[%i5+0x018]%asi,%l6	! %l6 = 0000000020ef580a 0000000000000980
!	Mem[0000000030041408] = 4c22ffff000000a4, %l2 = 00000000f1facc43
	ldxa	[%i1+%o4]0x81,%l2	! %l2 = 4c22ffff000000a4
!	Mem[0000000030181400] = ff002300, %l1 = 00000000000087ff
	lduha	[%i6+%g0]0x81,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010001410] = 64b02073, %l5 = ffffffffffffffff
	ldsha	[%i0+%o5]0x88,%l5	! %l5 = 0000000000002073

p0_label_229:
!	Starting 10 instruction Store Burst
!	%l6 = 20ef580a, %l7 = 00000980, Mem[0000000030101410] = f1faccff feffffff
	stda	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 20ef580a 00000980
!	%l6 = 0000000020ef580a, Mem[0000000030141408] = ffd4dbc2
	stha	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 580adbc2
!	%f16 = 00d6d46d 00000000, Mem[0000000030141408] = 580adbc2 00000000
	stda	%f16,[%i5+%o4]0x81	! Mem[0000000030141408] = 00d6d46d 00000000
!	%f2  = 8cde312a 4c22ffff, %l2 = 4c22ffff000000a4
!	Mem[0000000010141420] = 4fafa800c38f2266
	add	%i5,0x020,%g1
	stda	%f2,[%g1+%l2]ASI_PST8_P ! Mem[0000000010141420] = 8caf3100c3222266
!	%f14 = 00d6d46d 00000000, Mem[0000000010041430] = 00000000 ff000000
	std	%f14,[%i1+0x030]	! Mem[0000000010041430] = 00d6d46d 00000000
!	Mem[0000000010181408] = ffff224c, %l2 = 4c22ffff000000a4
	ldstuba	[%i6+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081410] = 000000ff, %l2 = 00000000000000ff
	swapa	[%i2+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%f6  = 2dd82bd7 57800000, Mem[0000000030101400] = ff000023 f1ffffff
	stda	%f6 ,[%i4+%g0]0x81	! Mem[0000000030101400] = 2dd82bd7 57800000
!	%l2 = 00000000000000ff, Mem[0000000010041410] = 00002300
	stha	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 00ff2300
!	%l2 = 00000000000000ff, Mem[0000000010101408] = 00000000ffffffff
	stxa	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000000000ff

p0_label_230:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ff0000000000ffff, %f0  = f1facc43 00000000, %asi = 80
	ldda	[%i3+0x010]%asi,%f0 	! %f0  = ff000000 0000ffff
!	Mem[0000000010141410] = 1c360000, %l1 = 000000000000ff00, %asi = 80
	lduwa	[%i5+0x010]%asi,%l1	! %l1 = 000000001c360000
!	Mem[0000000010101410] = 00000129fffaffff, %f14 = 00d6d46d 00000000
	ldda	[%i4+%o5]0x88,%f14	! %f14 = 00000129 fffaffff
!	Mem[0000000030041400] = 1362852c, %l6 = 0000000020ef580a
	ldsha	[%i1+%g0]0x89,%l6	! %l6 = ffffffffffff852c
!	Mem[00000000300c1408] = a4000000 df2c9795, %l6 = ffff852c, %l7 = 00000980
	ldda	[%i3+%o4]0x89,%l6	! %l6 = 00000000df2c9795 00000000a4000000
!	Mem[0000000010141410] = 43ccfaf1 0000361c, %l0 = 00000000, %l1 = 1c360000
	ldda	[%i5+%o5]0x88,%l0	! %l0 = 000000000000361c 0000000043ccfaf1
!	Mem[0000000030181410] = ff000000 c2dbd46d, %l0 = 0000361c, %l1 = 43ccfaf1
	ldda	[%i6+%o5]0x81,%l0	! %l0 = 00000000ff000000 00000000c2dbd46d
!	Mem[0000000010041400] = 0000001c00002597, %f0  = ff000000 0000ffff
	ldd	[%i1+%g0],%f0 		! %f0  = 0000001c 00002597
!	Mem[0000000030141410] = ff000000f1facc43, %f30 = 00000000 00000000
	ldda	[%i5+%o5]0x81,%f30	! %f30 = ff000000 f1facc43
!	Mem[0000000030081410] = ff000000, %l6 = 00000000df2c9795
	lduha	[%i2+%o5]0x81,%l6	! %l6 = 000000000000ff00

p0_label_231:
!	Starting 10 instruction Store Burst
!	%f19 = 00000000, Mem[0000000010001410] = 7320b064
	sta	%f19,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	%f8  = feffffff f1faccff, Mem[0000000030181400] = ff002300 00000000
	stda	%f8 ,[%i6+%g0]0x81	! Mem[0000000030181400] = feffffff f1faccff
!	%f26 = ffc4787f 51d2834c, %l2 = 00000000000000ff
!	Mem[0000000030181428] = 66f7cb16734b390f
	add	%i6,0x028,%g1
	stda	%f26,[%g1+%l2]ASI_PST32_S ! Mem[0000000030181428] = ffc4787f51d2834c
!	%l0 = 00000000ff000000, Mem[0000000030141400] = ff000000
	stha	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	Mem[0000000010081430] = ffffffffffffffff, %l0 = 00000000ff000000, %l4 = 00000000ff000000
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l0,%l4	! %l4 = ffffffffffffffff
!	%l3 = 00000000000000ff, Mem[0000000010081400] = 000000ff00000000
	stxa	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000000000ff
!	Mem[0000000030081410] = 000000ff, %l6 = 000000000000ff00
	swapa	[%i2+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%f26 = ffc4787f 51d2834c, Mem[0000000030141400] = 00000000 0000ffff
	stda	%f26,[%i5+%g0]0x81	! Mem[0000000030141400] = ffc4787f 51d2834c
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000010001430] = 0dcc8537 8cb61632
	std	%l2,[%i0+0x030]		! Mem[0000000010001430] = 000000ff 000000ff
!	%f2  = 8cde312a 4c22ffff, Mem[0000000030101400] = 2dd82bd7 57800000
	stda	%f2 ,[%i4+%g0]0x81	! Mem[0000000030101400] = 8cde312a 4c22ffff

p0_label_232:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = f1facc43, %f19 = 00000000
	lda	[%i6+%g0]0x88,%f19	! %f19 = f1facc43
!	Code Fragment 4, seed = 230364
p0_fragment_22:
!	%l0 = 00000000ff000000
	setx	0x3afad1100671f546,%g7,%l0 ! %l0 = 3afad1100671f546
!	%l1 = 00000000c2dbd46d
	setx	0xff2349679aee1f71,%g7,%l1 ! %l1 = ff2349679aee1f71
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3afad1100671f546
	setx	0x0e8ad921d99dcdac,%g7,%l0 ! %l0 = 0e8ad921d99dcdac
!	%l1 = ff2349679aee1f71
	setx	0xc46397b1558702f7,%g7,%l1 ! %l1 = c46397b1558702f7
p0_fragment_22_end:
!	Mem[00000000300c1400] = 298f7bff, %l1 = c46397b1558702f7
	ldswa	[%i3+%g0]0x89,%l1	! %l1 = 00000000298f7bff
!	Mem[0000000030101400] = 8cde312a, %l0 = 0e8ad921d99dcdac
	ldswa	[%i4+%g0]0x81,%l0	! %l0 = ffffffff8cde312a
!	Mem[000000001004142f] = 00000019, %l3 = 00000000000000ff
	ldub	[%i1+0x02f],%l3		! %l3 = 0000000000000019
!	Mem[00000000100c1408] = ff000000, %l2 = 00000000000000ff
	lduwa	[%i3+%o4]0x80,%l2	! %l2 = 00000000ff000000
!	Mem[0000000030081408] = ff000000, %l3 = 0000000000000019
	ldsha	[%i2+%o4]0x81,%l3	! %l3 = ffffffffffffff00
	membar	#Sync			! Added by membar checker (41)
!	Mem[0000000030101400] = 8cde312a 4c22ffff 000000ff 00000000
!	Mem[0000000030101410] = 0a58ef20 80090000 3200b54a 00006a7f
!	Mem[0000000030101420] = 29418e58 151bfe09 5e1bac56 36a1cd4f
!	Mem[0000000030101430] = 3342fac4 7d7f0545 0f02e122 044abf6b
	ldda	[%i4+%g0]ASI_BLK_AIUS,%f0 	! Block Load from 0000000030101400
!	Mem[0000000030081400] = ffffffff ffffffff ff000000 00000000
!	Mem[0000000030081410] = 00ff0000 95972cdf 43f05d0f da9f434b
!	Mem[0000000030081420] = 9725ca24 3e295957 ffc4787f 51d2834c
!	Mem[0000000030081430] = 3d5c9877 1c368a02 00000000 00000000
	ldda	[%i2+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030081400
!	Mem[000000001008142c] = b7ff22ff, %l3 = ffffffffffffff00, %asi = 80
	ldswa	[%i2+0x02c]%asi,%l3	! %l3 = ffffffffb7ff22ff

p0_label_233:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 6dd4d600, %l6 = 00000000000000ff
	swapa	[%i0+%g0]0x89,%l6	! %l6 = 000000006dd4d600
!	%f12 = 3d5c9877 1c368a02, Mem[00000000100c1410] = 000000ff ffff0000
	stda	%f12,[%i3+%o5]0x88	! Mem[00000000100c1410] = 3d5c9877 1c368a02
!	%f0  = ffffffff ffffffff, %l7 = 00000000a4000000
!	Mem[0000000010001418] = 00000024daffcb52
	add	%i0,0x018,%g1
	stda	%f0,[%g1+%l7]ASI_PST32_P ! Mem[0000000010001418] = 00000024daffcb52
!	%l5 = 0000000000002073, Mem[0000000010101410] = 00000129fffaffff
	stxa	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000000002073
!	Mem[00000000300c1408] = df2c9795, %l6 = 000000006dd4d600
	swapa	[%i3+%o4]0x89,%l6	! %l6 = 00000000df2c9795
!	%l6 = 00000000df2c9795, Mem[0000000010081408] = 0000000000ffffff
	stxa	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000df2c9795
!	%l2 = 00000000ff000000, Mem[0000000030001408] = 1c360000f1facc43
	stxa	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000ff000000
!	Mem[0000000010001408] = 00000000, %l2 = 00000000ff000000, %asi = 80
	swapa	[%i0+0x008]%asi,%l2	! %l2 = 0000000000000000
!	%l0 = ffffffff8cde312a, Mem[0000000030001410] = ff000000
	stha	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 312a0000
!	Mem[0000000010081424] = 0000361c, %l4 = 00000000ffffffff, %asi = 80
	swapa	[%i2+0x024]%asi,%l4	! %l4 = 000000000000361c

p0_label_234:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ffffffff, %l5 = 0000000000002073
	lduba	[%i2+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001400] = 2597ffff0000af4f, %l6 = 00000000df2c9795
	ldxa	[%i0+%g0]0x80,%l6	! %l6 = 2597ffff0000af4f
!	Mem[0000000010101410] = 73200000, %l6 = 2597ffff0000af4f
	lduba	[%i4+%o5]0x80,%l6	! %l6 = 0000000000000073
!	Mem[0000000010141410] = 1c360000, %l1 = 00000000298f7bff
	ldsba	[%i5+%o5]0x80,%l1	! %l1 = 000000000000001c
!	Mem[0000000010181400] = 43ccfaf1, %l4 = 000000000000361c
	lduba	[%i6+%g0]0x80,%l4	! %l4 = 0000000000000043
!	Mem[00000000100c1410] = 028a361c, %l4 = 0000000000000043
	lduwa	[%i3+%o5]0x80,%l4	! %l4 = 00000000028a361c
!	Mem[0000000030041400] = 2c85621364b02073, %f28 = f1facc43 1c368a02
	ldda	[%i1+%g0]0x81,%f28	! %f28 = 2c856213 64b02073
!	Mem[0000000010001410] = 00000000 f1facc43, %l4 = 028a361c, %l5 = 000000ff
	ldd	[%i0+%o5],%l4		! %l4 = 0000000000000000 00000000f1facc43
!	Mem[000000001008143e] = 43f05dff, %l6 = 0000000000000073
	ldsh	[%i2+0x03e],%l6		! %l6 = 0000000000005dff
!	Mem[0000000010181410] = 00000000 00000000, %l4 = 00000000, %l5 = f1facc43
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 0000000000000000 0000000000000000

p0_label_235:
!	Starting 10 instruction Store Burst
!	%f17 = 00000000, Mem[0000000010081408] = df2c9795
	sta	%f17,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	%l6 = 0000000000005dff, Mem[000000001008143e] = 43f05dff, %asi = 80
	stha	%l6,[%i2+0x03e]%asi	! Mem[000000001008143c] = 43f05dff
!	%f16 = 00d6d46d 00000000, %l4 = 0000000000000000
!	Mem[0000000010181408] = ffff224c2a31de8c
	add	%i6,0x008,%g1
	stda	%f16,[%g1+%l4]ASI_PST16_P ! Mem[0000000010181408] = ffff224c2a31de8c
!	%l6 = 00005dff, %l7 = a4000000, Mem[0000000010181410] = 00000000 00000000
	stda	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 00005dff a4000000
!	%l7 = 00000000a4000000, Mem[0000000021800040] = 0a00eaa0, %asi = 80
	stba	%l7,[%o3+0x040]%asi	! Mem[0000000021800040] = 0000eaa0
!	%l2 = 0000000000000000, Mem[0000000030001410] = 312a0000ff5df043
	stxa	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000000000000
	membar	#Sync			! Added by membar checker (42)
!	%l4 = 0000000000000000, Mem[0000000030101408] = ff000000
	stba	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = ff000000
!	%l0 = ffffffff8cde312a, Mem[0000000030181400] = feffffff
	stba	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 2affffff
!	Mem[0000000010101408] = ff000000, %l0 = ffffffff8cde312a
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[000000001000143d] = f1facc43, %l1 = 000000000000001c
	ldstuba	[%i0+0x03d]%asi,%l1	! %l1 = 00000000000000fa

p0_label_236:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000, %l0 = 00000000000000ff
	lduba	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081436] = ffffffff, %l2 = 0000000000000000, %asi = 80
	lduha	[%i2+0x036]%asi,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030041400] = 2c856213, %l2 = 000000000000ffff
	ldswa	[%i1+%g0]0x81,%l2	! %l2 = 000000002c856213
!	%l5 = 0000000000000000, imm = 0000000000000565, %l6 = 0000000000005dff
	sub	%l5,0x565,%l6		! %l6 = fffffffffffffa9b
!	Mem[0000000010041408] = f1facc43000000ff, %f10 = ffc4787f 51d2834c
	ldda	[%i1+%o4]0x80,%f10	! %f10 = f1facc43 000000ff
!	Mem[0000000010101410] = 73200000, %l2 = 000000002c856213
	ldsba	[%i4+%o5]0x80,%l2	! %l2 = 0000000000000073
!	Mem[0000000010141400] = f1facc43000000ff, %l5 = 0000000000000000
	ldxa	[%i5+%g0]0x88,%l5	! %l5 = f1facc43000000ff
!	Mem[0000000020800001] = ff00b9e0, %l0 = 0000000000000000
	ldub	[%o1+0x001],%l0		! %l0 = 0000000000000000
!	Mem[0000000010181408] = ffff224c, %l1 = 00000000000000fa
	ldswa	[%i6+%o4]0x80,%l1	! %l1 = ffffffffffff224c
!	Mem[000000001008142c] = b7ff22ff, %l5 = f1facc43000000ff, %asi = 80
	ldsba	[%i2+0x02c]%asi,%l5	! %l5 = ffffffffffffffb7

p0_label_237:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000a4000000, Mem[0000000030101400] = 8cde312a
	stwa	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = a4000000
!	Mem[00000000100c1438] = 00d6d46d, %l4 = 00000000, %l1 = ffff224c
	add	%i3,0x38,%g1
	casa	[%g1]0x80,%l4,%l1	! %l1 = 0000000000d6d46d
!	Mem[0000000010001408] = 000000ff, %l0 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	%l2 = 0000000000000073, Mem[0000000010101420] = 00002c85000000ff, %asi = 80
	stxa	%l2,[%i4+0x020]%asi	! Mem[0000000010101420] = 0000000000000073
!	%l6 = fffffffffffffa9b, Mem[0000000010181438] = fffffff123000000, %asi = 80
	stxa	%l6,[%i6+0x038]%asi	! Mem[0000000010181438] = fffffffffffffa9b
!	%l5 = ffffffffffffffb7, Mem[0000000030101410] = 20ef580a
	stba	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 20ef58b7
!	%l2 = 0000000000000073, Mem[0000000010081400] = 00000000
	stha	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000073
!	Mem[0000000010181408] = 4c22ffff, %l3 = 00000000b7ff22ff
	swapa	[%i6+%o4]0x88,%l3	! %l3 = 000000004c22ffff
!	Mem[0000000030041408] = ffff224c, %l3 = 000000004c22ffff
	ldstuba	[%i1+%o4]0x89,%l3	! %l3 = 000000000000004c
!	%f6  = 43f05d0f da9f434b, Mem[00000000100c1410] = 028a361c 77985c3d
	stda	%f6 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = 43f05d0f da9f434b

p0_label_238:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 2597ffff, %l5 = ffffffffffffffb7
	ldsba	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000025
!	Mem[0000000010141403] = ff000000, %l0 = 00000000000000ff, %asi = 80
	lduba	[%i5+0x003]%asi,%l0	! %l0 = 0000000000000000
!	%f2  = ff000000 00000000, %l4 = 0000000000000000
!	Mem[0000000010181430] = ff000000ff5df043
	add	%i6,0x030,%g1
	stda	%f2,[%g1+%l4]ASI_PST8_P ! Mem[0000000010181430] = ff000000ff5df043
!	Mem[0000000010141410] = 1c360000, %l1 = 0000000000d6d46d
	ldsba	[%i5+%o5]0x80,%l1	! %l1 = 000000000000001c
!	Mem[0000000030101408] = ff000000, %l5 = 0000000000000025
	ldswa	[%i4+%o4]0x89,%l5	! %l5 = ffffffffff000000
!	Mem[00000000100c1410] = 0f5df043, %l5 = ffffffffff000000
	lduha	[%i3+%o5]0x88,%l5	! %l5 = 000000000000f043
!	Mem[0000000010081408] = 0000000000000000, %f16 = 00d6d46d 00000000
	ldda	[%i2+%o4]0x80,%f16	! %f16 = 00000000 00000000
!	Mem[000000001004140c] = 000000ff, %f1  = ffffffff
	ld	[%i1+0x00c],%f1 	! %f1 = 000000ff
!	Mem[00000000100c1428] = 0000ffe600000019, %l1 = 000000000000001c
	ldx	[%i3+0x028],%l1		! %l1 = 0000ffe600000019
!	Mem[0000000010001428] = da9f434b, %f29 = 64b02073
	ld	[%i0+0x028],%f29	! %f29 = da9f434b

p0_label_239:
!	Starting 10 instruction Store Burst
!	%f11 = 000000ff, Mem[0000000010081400] = 00000073
	sta	%f11,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff
!	Mem[0000000030101400] = a4000000 4c22ffff 000000ff 00000000
!	%f16 = 00000000 00000000 00001c36 f1facc43
!	%f20 = ff000000 95972cdf 43f05d0f da9f434b
!	%f24 = 9725ca24 3e295957 ffc4787f 51d2834c
!	%f28 = 2c856213 da9f434b ff000000 f1facc43
	stda	%f16,[%i4+%g0]ASI_BLK_SL	! Block Store to 0000000030101400
!	Mem[0000000030181410] = 000000ff, %l4 = 0000000000000000
	swapa	[%i6+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181410] = ff5d0000, %l1 = 0000000000000019
	swapa	[%i6+%o5]0x80,%l1	! %l1 = 00000000ff5d0000
!	%l7 = 00000000a4000000, Mem[0000000010001410] = 00000000f1facc43
	stx	%l7,[%i0+%o5]		! Mem[0000000010001410] = 00000000a4000000
!	%f21 = 95972cdf, Mem[000000001008140c] = 00000000
	sta	%f21,[%i2+0x00c]%asi	! Mem[000000001008140c] = 95972cdf
	membar	#Sync			! Added by membar checker (43)
!	Mem[0000000030101400] = 00000000, %l3 = 000000000000004c
	swapa	[%i4+%g0]0x81,%l3	! %l3 = 0000000000000000
!	%f15 = 00000000, Mem[0000000030141410] = 000000ff
	sta	%f15,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	%l6 = fffffffffffffa9b, Mem[00000000211c0000] = ffff5a40, %asi = 80
	stha	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = fa9b5a40
!	Mem[0000000030001410] = 00000000, %l6 = fffffffffffffa9b
	ldstuba	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000

p0_label_240:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff7b8f29, %l5 = 000000000000f043
	ldsba	[%i3+%g0]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030001410] = ff000000, %l6 = 0000000000000000
	lduba	[%i0+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Code Fragment 3, seed = 902096
p0_fragment_23:
!	%l0 = 0000000000000000
	setx	0x3b1b9494dda629a6,%g7,%l0 ! %l0 = 3b1b9494dda629a6
!	%l1 = 00000000ff5d0000
	setx	0x2752b80c074ba5d1,%g7,%l1 ! %l1 = 2752b80c074ba5d1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3b1b9494dda629a6
	setx	0x073f30580acc060c,%g7,%l0 ! %l0 = 073f30580acc060c
!	%l1 = 2752b80c074ba5d1
	setx	0xb72129cb060f4d57,%g7,%l1 ! %l1 = b72129cb060f4d57
p0_fragment_23_end:
!	Mem[0000000010181410] = 19000000, %l6 = 00000000000000ff
	ldsba	[%i6+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181400] = fefffffff1facc43, %l0 = 073f30580acc060c
	ldxa	[%i6+%g0]0x88,%l0	! %l0 = fefffffff1facc43
!	Mem[0000000020800001] = ff00b9e0, %l0 = fefffffff1facc43, %asi = 80
	ldsba	[%o1+0x001]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = 00006a7f 00000000 ff000000 1362852c
!	Mem[00000000100c1410] = 43f05d0f da9f434b 43ccfaf1 2a31de8c
!	Mem[00000000100c1420] = f1facc43 00a8af4f 0000ffe6 00000019
!	Mem[00000000100c1430] = 3216b68c 3785cc0d 00d6d46d 00000000
	ldda	[%i3+%g0]ASI_BLK_PL,%f16	! Block Load from 00000000100c1400
!	Mem[0000000010141410] = 0000361c, %l0 = 0000000000000000
	ldsha	[%i5+%o5]0x88,%l0	! %l0 = 000000000000361c
!	Mem[00000000100c1400] = 7f6a0000, %l0 = 000000000000361c
	lduwa	[%i3+%g0]0x88,%l0	! %l0 = 000000007f6a0000
!	Mem[0000000010101410] = 00002073, %l5 = ffffffffffffffff
	lduha	[%i4+%o5]0x88,%l5	! %l5 = 0000000000002073

p0_label_241:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 00d6d46d, %l2 = 0000000000000073
	swapa	[%i5+%o4]0x81,%l2	! %l2 = 0000000000d6d46d
!	Mem[0000000021800181] = ffff4d90, %l2 = 0000000000d6d46d
	ldstub	[%o3+0x181],%l2		! %l2 = 00000000000000ff
!	%l1 = b72129cb060f4d57, Mem[0000000010181408] = ff22ffb72a31de8c
	stxa	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = b72129cb060f4d57
!	Mem[0000000010141410] = 1c360000, %l5 = 0000000000002073
	ldstuba	[%i5+%o5]0x80,%l5	! %l5 = 000000000000001c
!	Mem[00000000201c0001] = ff00a3b0, %l3 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l3	! %l3 = 0000000000000000
!	%l7 = 00000000a4000000, Mem[0000000010081408] = 00000000
	stba	%l7,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	%f28 = 0dcc8537 8cb61632, Mem[0000000030141410] = 00000000 43ccfaf1
	stda	%f28,[%i5+%o5]0x89	! Mem[0000000030141410] = 0dcc8537 8cb61632
!	%l6 = 0000000000000000, Mem[0000000030181410] = 00000000
	stba	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	%l5 = 000000000000001c, Mem[000000001000141f] = daffcb52
	stb	%l5,[%i0+0x01f]		! Mem[000000001000141c] = daffcb1c
!	%f6  = 43f05d0f, Mem[000000001008143c] = 43f05dff
	sta	%f6 ,[%i2+0x03c]%asi	! Mem[000000001008143c] = 43f05d0f

p0_label_242:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 0000004c00000000, %l1 = b72129cb060f4d57
	ldxa	[%i4+%g0]0x81,%l1	! %l1 = 0000004c00000000
!	Mem[0000000030181410] = 00000000, %l3 = 0000000000000000
	lduwa	[%i6+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141408] = 0000007300000000, %l2 = 00000000000000ff
	ldxa	[%i5+%o4]0x81,%l2	! %l2 = 0000007300000000
!	Mem[0000000010081400] = 000000ff, %l0 = 000000007f6a0000
	ldsha	[%i2+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081408] = 0000000095972cdf, %f0  = ffffffff 000000ff
	ldda	[%i2+%o4]0x80,%f0 	! %f0  = 00000000 95972cdf
!	Mem[0000000010001408] = 00000000, %l2 = 0000007300000000, %asi = 80
	lduwa	[%i0+0x008]%asi,%l2	! %l2 = 0000000000000000
!	%l1 = 0000004c00000000, %l4 = 00000000000000ff, %l7 = 00000000a4000000
	sub	%l1,%l4,%l7		! %l7 = 0000004bffffff01
!	Mem[0000000030141408] = 0000000073000000, %f14 = 00000000 00000000
	ldda	[%i5+%o4]0x89,%f14	! %f14 = 00000000 73000000
!	Mem[0000000010141408] = 00000000, %l3 = 0000000000000000
	ldswa	[%i5+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1430] = 3216b68c3785cc0d, %f10 = f1facc43 000000ff
	ldd	[%i3+0x030],%f10	! %f10 = 3216b68c 3785cc0d

p0_label_243:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = ffffff01, Mem[00000000300c1400] = 298f7bff 2c856213
	stda	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 ffffff01
	membar	#Sync			! Added by membar checker (44)
!	%f20 = 4b439fda 0f5df043, Mem[00000000100c1408] = ff000000 1362852c
	stda	%f20,[%i3+%o4]0x80	! Mem[00000000100c1408] = 4b439fda 0f5df043
!	%l3 = 0000000000000000, Mem[0000000030181408] = eb070d00
	stwa	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	%l6 = 00000000, %l7 = ffffff01, Mem[0000000030081400] = ffffffff ffffffff
	stda	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000 ffffff01
!	%l2 = 0000000000000000, Mem[0000000030041408] = ffff22ff
	stha	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = ffff0000
!	%f3  = 00000000, Mem[0000000030101408] = 43ccfaf1
	sta	%f3 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	%l5 = 000000000000001c, Mem[0000000010041420] = f1facc43c38f2266
	stx	%l5,[%i1+0x020]		! Mem[0000000010041420] = 000000000000001c
!	%l1 = 0000004c00000000, Mem[0000000030141410] = 3216b68c
	stwa	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	%l0 = 00000000000000ff, immd = 00000293, %y  = 00000000
	smul	%l0,0x293,%l1		! %l1 = 000000000002906d, %y = 00000000
!	Mem[0000000010181408] = b72129cb, %l4 = 00000000000000ff
	swapa	[%i6+%o4]0x80,%l4	! %l4 = 00000000b72129cb

p0_label_244:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000000, %l6 = 0000000000000000
	ldsba	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081408] = 000000ff, %l6 = 0000000000000000
	lduba	[%i2+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1400] = 7f6a0000, %l4 = 00000000b72129cb
	lduba	[%i3+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101400] = 0000004c00000000, %f6  = 43f05d0f da9f434b
	ldda	[%i4+%g0]0x81,%f6 	! %f6  = 0000004c 00000000
!	Mem[0000000030041410] = ff000000, %f2  = ff000000
	lda	[%i1+%o5]0x89,%f2 	! %f2 = ff000000
!	Mem[000000001014143c] = e23b3a56, %l0 = 00000000000000ff
	ldsh	[%i5+0x03c],%l0		! %l0 = ffffffffffffe23b
!	Mem[00000000100c1400] = 7f6a0000, %l3 = 0000000000000000
	ldsha	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001400] = ff000000 00000000 00000000 ff000000
!	Mem[0000000030001410] = ff000000 00000000 5167afca 5f1f0a73
!	Mem[0000000030001420] = 68f4bcd8 03736289 00000000 156bd63a
!	Mem[0000000030001430] = 7e2b7144 6c4991c5 408b2a9a 0000003c
	ldda	[%i0+%g0]ASI_BLK_AIUS,%f0 	! Block Load from 0000000030001400
!	Mem[0000000010141410] = ff360000 f1facc43, %l4 = 00000000, %l5 = 0000001c
	ldda	[%i5+%o5]0x80,%l4	! %l4 = 00000000ff360000 00000000f1facc43
!	Mem[0000000020800000] = ff00b9e0, %l6 = 00000000000000ff, %asi = 80
	lduha	[%o1+0x000]%asi,%l6	! %l6 = 000000000000ff00

p0_label_245:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = ffffffff, %l3 = 0000000000000000
	swapa	[%i3+%o5]0x81,%l3	! %l3 = 00000000ffffffff
!	%l2 = 0000000000000000, Mem[0000000030181400] = ffffff2a
	stha	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = ffff0000
	membar	#Sync			! Added by membar checker (45)
!	%l0 = ffffffffffffe23b, Mem[0000000030001410] = 000000ff
	stba	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000003b
!	Mem[00000000100c1428] = 0000ffe6, %l4 = 00000000ff360000, %asi = 80
	swapa	[%i3+0x028]%asi,%l4	! %l4 = 000000000000ffe6
!	Mem[0000000010101408] = 000000ff, %l2 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000021800000] = ff76e470, %asi = 80
	stba	%l2,[%o3+0x000]%asi	! Mem[0000000021800000] = ff76e470
!	%f28 = 0dcc8537, Mem[0000000010081408] = 00000000
	sta	%f28,[%i2+%o4]0x80	! Mem[0000000010081408] = 0dcc8537
!	Mem[00000000100c1400] = 7f6a0000, %l2 = 00000000000000ff
	swapa	[%i3+%g0]0x88,%l2	! %l2 = 000000007f6a0000
!	%l2 = 000000007f6a0000, Mem[0000000030101408] = 00000000
	stwa	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 7f6a0000
!	%f16 = 00000000 7f6a0000, Mem[00000000100c1400] = ff000000 00000000
	stda	%f16,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000 7f6a0000

p0_label_246:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 0000003b, %l2 = 000000007f6a0000
	lduwa	[%i0+%o5]0x89,%l2	! %l2 = 000000000000003b
!	Mem[0000000030041400] = 7320b0641362852c, %l1 = 000000000002906d
	ldxa	[%i1+%g0]0x89,%l1	! %l1 = 7320b0641362852c
!	Mem[0000000030101410] = df2c9795 000000ff, %l2 = 0000003b, %l3 = ffffffff
	ldda	[%i4+%o5]0x81,%l2	! %l2 = 00000000df2c9795 00000000000000ff
!	Mem[0000000020800040] = ccff4c10, %l5 = 00000000f1facc43
	ldsh	[%o1+0x040],%l5		! %l5 = ffffffffffffccff
!	Mem[0000000010141400] = f1facc43000000ff, %l4 = 000000000000ffe6
	ldxa	[%i5+%g0]0x88,%l4	! %l4 = f1facc43000000ff
!	Mem[0000000010101410] = 00002073, %l5 = ffffffffffffccff
	ldswa	[%i4+%o5]0x88,%l5	! %l5 = 0000000000002073
!	Mem[00000000100c1408] = da9f434b, %l5 = 0000000000002073
	ldswa	[%i3+%o4]0x88,%l5	! %l5 = ffffffffda9f434b
!	Mem[0000000010081410] = c2dbd46d, %l3 = 00000000000000ff
	ldsha	[%i2+%o5]0x80,%l3	! %l3 = ffffffffffffc2db
!	Mem[0000000010001410] = 00000000, %l3 = ffffffffffffc2db
	ldsha	[%i0+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l6 = 000000000000ff00
	lduha	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000

p0_label_247:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = ffffff01, Mem[0000000030001408] = 00000000 ff000000
	stda	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000 ffffff01
!	Mem[0000000010041410] = 00ff2300, %l7 = 00000000ffffff01
	swapa	[%i1+%o5]0x80,%l7	! %l7 = 0000000000ff2300
!	Mem[0000000010001424] = c38f2266, %l2 = 00000000df2c9795
	swap	[%i0+0x024],%l2		! %l2 = 00000000c38f2266
!	%l5 = ffffffffda9f434b, Mem[0000000010101410] = 0000000000002073
	stxa	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffffffda9f434b
!	Mem[0000000010041400] = 0000001c, %l6 = 0000000000000000
	ldstuba	[%i1+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181410] = 19000000, %l2 = 00000000c38f2266
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030141410] = 00000000
	stha	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	%f22 = 8cde312a, %f23 = f1facc43, %f31 = 6dd4d600
	fsubs	%f22,%f23,%f31		! %f31 = 71facc43
!	%l0 = ffffffffffffe23b, %l3 = 0000000000000000, %l2 = 0000000000000000
	subc	%l0,%l3,%l2		! %l2 = ffffffffffffe23b
!	Mem[00000000100c1408] = 4b439fda, %l3 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l3	! %l3 = 000000004b439fda

p0_label_248:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = f1facc43, %f22 = 8cde312a
	lda	[%i6+%g0]0x88,%f22	! %f22 = f1facc43
!	%l6 = 00000000, %l7 = 00ff2300, Mem[0000000010081400] = ff000000 000000ff
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000 00ff2300
!	Mem[0000000010181410] = ff000019000000a4, %f6  = 5167afca 5f1f0a73
	ldd	[%i6+%o5],%f6 		! %f6  = ff000019 000000a4
!	Mem[0000000030101408] = 7f6a0000, %f0  = ff000000
	lda	[%i4+%o4]0x81,%f0 	! %f0 = 7f6a0000
!	Mem[0000000030041400] = 1362852c, %l0 = ffffffffffffe23b
	lduwa	[%i1+%g0]0x89,%l0	! %l0 = 000000001362852c
!	Mem[0000000030001400] = ff00000000000000, %f28 = 0dcc8537 8cb61632
	ldda	[%i0+%g0]0x81,%f28	! %f28 = ff000000 00000000
!	Mem[0000000010081400] = 00000000, %l0 = 000000001362852c
	ldswa	[%i2+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%l4 = f1facc43000000ff, imm = 0000000000000058, %l5 = ffffffffda9f434b
	and	%l4,0x058,%l5		! %l5 = 0000000000000058
!	Mem[0000000020800000] = ff00b9e0, %l6 = 0000000000000000
	lduh	[%o1+%g0],%l6		! %l6 = 000000000000ff00
!	Mem[0000000030101400] = 4c000000, %f12 = 7e2b7144
	lda	[%i4+%g0]0x89,%f12	! %f12 = 4c000000

p0_label_249:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081418] = f1fa0000, %l7 = 0000000000ff2300
	swap	[%i2+0x018],%l7		! %l7 = 00000000f1fa0000
!	Mem[0000000010001408] = 00000000, %l2 = 00000000ffffe23b
	swapa	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l1 = 000000001362852c
	swapa	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000000
!	%f28 = ff000000 00000000, Mem[0000000030001410] = 0000003b 00000000
	stda	%f28,[%i0+%o5]0x89	! Mem[0000000030001410] = ff000000 00000000
!	Mem[0000000010101420] = 00000000, %l5 = 0000000000000058, %asi = 80
	swapa	[%i4+0x020]%asi,%l5	! %l5 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010141400] = ff000000
	stwa	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	Mem[000000001004141c] = 00000000, %l0 = 0000000000000000
	ldstub	[%i1+0x01c],%l0		! %l0 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l6 = 000000000000ff00
	swapa	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000000
!	%l3 = 000000004b439fda, %l1 = 0000000000000000, %y  = 00000000
	umul	%l3,%l1,%l7		! %l7 = 0000000000000000, %y = 00000000
!	Mem[0000000010041400] = ff00001c00002597, %l0 = 0000000000000000, %l5 = 0000000000000000
	casxa	[%i1]0x80,%l0,%l5	! %l5 = ff00001c00002597

p0_label_250:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 0000004c00000000, %f20 = 4b439fda 0f5df043
	ldda	[%i4+%g0]0x81,%f20	! %f20 = 0000004c 00000000
!	Mem[0000000030181410] = 00000000 c2dbd46d, %l6 = 00000000, %l7 = 00000000
	ldda	[%i6+%o5]0x81,%l6	! %l6 = 0000000000000000 00000000c2dbd46d
!	Mem[0000000030041400] = 2c856213, %l1 = 0000000000000000
	lduha	[%i1+%g0]0x81,%l1	! %l1 = 0000000000002c85
!	Mem[00000000100c1408] = 00000000, %l2 = 0000000000000000
	lduha	[%i3+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1400] = 2c856213, %l2 = 0000000000000000
	ldsha	[%i3+%g0]0x80,%l2	! %l2 = 0000000000002c85
!	Mem[00000000300c1400] = ffffff01 00000000, %l6 = 00000000, %l7 = c2dbd46d
	ldda	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000 00000000ffffff01
!	Mem[0000000020800040] = ccff4c10, %l6 = 0000000000000000, %asi = 80
	lduha	[%o1+0x040]%asi,%l6	! %l6 = 000000000000ccff
!	Mem[00000000100c1400] = 1362852c, %l7 = 00000000ffffff01
	lduwa	[%i3+%g0]0x88,%l7	! %l7 = 000000001362852c
!	%f18 = 2c856213, %f9  = 03736289, %f26 = 19000000
	fmuls	%f18,%f9 ,%f26		! %f26 = 00000000
!	Mem[0000000010141408] = 00000000 ff000000, %l2 = 00002c85, %l3 = 4b439fda, %asi = 80
	ldda	[%i5+0x008]%asi,%l2	! %l2 = 0000000000000000 00000000ff000000

p0_label_251:
!	Starting 10 instruction Store Burst
!	%f30 = 00000000 71facc43, Mem[0000000030101408] = 7f6a0000 361c0000
	stda	%f30,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 71facc43
!	Mem[0000000030001400] = ff000000 00000000 0000ff00 ffffff01
!	%f16 = 00000000 7f6a0000 2c856213 000000ff
!	%f20 = 0000004c 00000000 f1facc43 f1facc43
!	%f24 = 4fafa800 43ccfaf1 00000000 e6ff0000
!	%f28 = ff000000 00000000 00000000 71facc43
	stda	%f16,[%i0+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030001400
!	Mem[0000000010101408] = 0000000000000000, %l6 = 000000000000ccff, %l6 = 000000000000ccff
	add	%i4,0x08,%g1
	casxa	[%g1]0x80,%l6,%l6	! %l6 = 0000000000000000
!	%l4 = f1facc43000000ff, Mem[00000000100c1400] = 00006a7f1362852c
	stxa	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = f1facc43000000ff
!	%l0 = 0000000000000000, Mem[0000000030181408] = 00000000
	stwa	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	Mem[0000000030081408] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%l2 = 000000ff, %l3 = ff000000, Mem[00000000100c1408] = 00000000 0f5df043
	stda	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ff ff000000
!	Mem[00000000300c1408] = 00d6d46d, %l5 = 0000000000002597
	swapa	[%i3+%o4]0x81,%l5	! %l5 = 0000000000d6d46d
!	%l2 = 000000ff, %l3 = ff000000, Mem[0000000030041408] = ffff0000 a4000000
	stda	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000ff ff000000
!	%l2 = 000000ff, %l3 = ff000000, Mem[0000000030101400] = 0000004c 00000000
	stda	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff ff000000

p0_label_252:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = da9f434b, %l6 = 0000000000000000
	lduwa	[%i4+%o5]0x88,%l6	! %l6 = 00000000da9f434b
	membar	#Sync			! Added by membar checker (46)
!	Mem[0000000010041400] = ff00001c 00002597 f1facc43 000000ff
!	Mem[0000000010041410] = ffffff01 00000000 00000024 ff000000
!	Mem[0000000010041420] = 00000000 0000001c da9f434b 00000019
!	Mem[0000000010041430] = 00d6d46d 00000000 97250000 00000000
	ldda	[%i1+%g0]ASI_BLK_AIUP,%f0 	! Block Load from 0000000010041400
!	Mem[0000000030101410] = 95972cdf, %l5 = 0000000000d6d46d
	lduba	[%i4+%o5]0x89,%l5	! %l5 = 00000000000000df
!	Mem[0000000010101410] = 4b439fdaffffffff, %f22 = f1facc43 f1facc43
	ldda	[%i4+%o5]0x80,%f22	! %f22 = 4b439fda ffffffff
!	Mem[0000000030081400] = 00000000, %l7 = 000000001362852c
	lduha	[%i2+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001410] = 000000a400000000, %l2 = 00000000000000ff
	ldxa	[%i0+%o5]0x88,%l2	! %l2 = 000000a400000000
!	Mem[0000000030101400] = 000000ff, %l2 = 000000a400000000
	lduba	[%i4+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081410] = c2dbd46d, %l6 = 00000000da9f434b
	lduwa	[%i2+%o5]0x80,%l6	! %l6 = 00000000c2dbd46d
!	Mem[0000000030081408] = 000000ff, %l7 = 0000000000000000
	lduha	[%i2+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181408] = 0000000000000000, %l6 = 00000000c2dbd46d
	ldxa	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000000

p0_label_253:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = ff000000, Mem[0000000030081408] = ff000000 00000000
	stda	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000 ff000000
!	Code Fragment 3, seed = 130237
p0_fragment_24:
!	%l0 = 0000000000000000
	setx	0x29c07bfe4491df3e,%g7,%l0 ! %l0 = 29c07bfe4491df3e
!	%l1 = 0000000000002c85
	setx	0x64864c73eccb47e9,%g7,%l1 ! %l1 = 64864c73eccb47e9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 29c07bfe4491df3e
	setx	0x7504a248aa75eca4,%g7,%l0 ! %l0 = 7504a248aa75eca4
!	%l1 = 64864c73eccb47e9
	setx	0x3c473d12488a506f,%g7,%l1 ! %l1 = 3c473d12488a506f
p0_fragment_24_end:
!	%l6 = 0000000000000000, Mem[0000000010081408] = 0dcc8537
	stwa	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	%f9  = 0000001c, Mem[0000000010101410] = 4b439fda
	sta	%f9 ,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000001c
!	%f16 = 00000000 7f6a0000, Mem[00000000300c1410] = 00000000 00000000
	stda	%f16,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000 7f6a0000
!	Mem[0000000030141408] = 73000000, %l6 = 0000000000000000
	ldstuba	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000000
!	%f22 = 4b439fda ffffffff, Mem[0000000030041408] = ff000000 000000ff
	stda	%f22,[%i1+%o4]0x81	! Mem[0000000030041408] = 4b439fda ffffffff
!	%l4 = f1facc43000000ff, Mem[0000000030101410] = 95972cdf
	stba	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 95972cff
!	Mem[0000000030041400] = 2c856213, %l5 = 00000000000000df
	swapa	[%i1+%g0]0x81,%l5	! %l5 = 000000002c856213
!	%l4 = f1facc43000000ff, Mem[0000000030081410] = 00ff0000
	stha	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 00ff0000

p0_label_254:
!	Starting 10 instruction Load Burst
!	%f22 = 4b439fda, %f27 = e6ff0000, %f19 = 000000ff
	fadds	%f22,%f27,%f19		! %f19 = e6ff0000
!	%l4 = f1facc43000000ff, %l7 = 00000000000000ff, %l4 = f1facc43000000ff
	addc	%l4,%l7,%l4		! %l4 = f1facc43000001fe
!	Mem[0000000010081410] = 8cde312a6dd4dbc2, %l0 = 7504a248aa75eca4
	ldxa	[%i2+%o5]0x88,%l0	! %l0 = 8cde312a6dd4dbc2
!	Mem[00000000300c1400] = 00000000 01ffffff, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000 0000000001ffffff
!	Mem[0000000010001414] = a4000000, %l7 = 0000000001ffffff, %asi = 80
	ldswa	[%i0+0x014]%asi,%l7	! %l7 = ffffffffa4000000
!	Mem[0000000010041408] = 43ccfaf1, %l6 = 0000000000000000
	lduha	[%i1+%o4]0x88,%l6	! %l6 = 000000000000faf1
!	Mem[0000000030001408] = ff0000001362852c, %f28 = ff000000 00000000
	ldda	[%i0+%o4]0x81,%f28	! %f28 = ff000000 1362852c
!	Mem[0000000030001400] = 00006a7f, %f22 = 4b439fda
	lda	[%i0+%g0]0x81,%f22	! %f22 = 00006a7f
!	Mem[0000000010041408] = f1facc43, %l4 = f1facc43000001fe
	lduwa	[%i1+%o4]0x80,%l4	! %l4 = 00000000f1facc43
!	Mem[0000000021800140] = 4bc5db60, %l3 = 00000000ff000000
	ldsb	[%o3+0x140],%l3		! %l3 = 000000000000004b

p0_label_255:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = ff360000, %l2 = 0000000000000000
	swapa	[%i5+%o5]0x80,%l2	! %l2 = 00000000ff360000
!	%l3 = 000000000000004b, Mem[0000000030181408] = 00000000
	stha	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000004b
!	%l2 = 00000000ff360000, Mem[00000000211c0000] = fa9b5a40, %asi = 80
	stha	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00005a40
	membar	#Sync			! Added by membar checker (47)
!	%f26 = 00000000, Mem[0000000010041408] = f1facc43
	sta	%f26,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	%f22 = 00006a7f ffffffff, %l4 = 00000000f1facc43
!	Mem[0000000010181438] = fffffffffffffa9b
	add	%i6,0x038,%g1
	stda	%f22,[%g1+%l4]ASI_PST16_P ! Mem[0000000010181438] = ffffffffffffffff
!	%l3 = 000000000000004b, Mem[0000000030181408] = 0000004b
	stha	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000004b
!	%l4 = 00000000f1facc43, Mem[0000000030001410] = 00000000
	stha	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000cc43
!	%l6 = 000000000000faf1, Mem[00000000100c1408] = ff000000
	stba	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff0000f1
!	%l1 = 3c473d12488a506f, Mem[0000000030101410] = ff2c9795000000ff
	stxa	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = 3c473d12488a506f
!	%l3 = 000000000000004b, Mem[0000000010181408] = 000000ff060f4d57
	stxa	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000000000004b

p0_label_256:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 2597ffff 0000af4f, %l0 = 6dd4dbc2, %l1 = 488a506f
	ldda	[%i0+%g0]0x80,%l0	! %l0 = 000000002597ffff 000000000000af4f
!	Mem[0000000030001408] = 000000ff, %l3 = 000000000000004b
	lduwa	[%i0+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041400] = ff00001c, %l3 = 00000000000000ff
	ldsba	[%i1+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000100c1420] = f1facc4300a8af4f, %f24 = 4fafa800 43ccfaf1, %asi = 80
	ldda	[%i3+0x020]%asi,%f24	! %f24 = f1facc43 00a8af4f
!	Mem[0000000030141410] = 000000003785cc0d, %l1 = 000000000000af4f
	ldxa	[%i5+%o5]0x81,%l1	! %l1 = 000000003785cc0d
!	Mem[00000000100c1410] = 43f05d0fda9f434b, %l3 = ffffffffffffffff
	ldxa	[%i3+%o5]0x80,%l3	! %l3 = 43f05d0fda9f434b
!	Mem[0000000010001408] = 3be2ffff, %l2 = 00000000ff360000
	ldswa	[%i0+%o4]0x88,%l2	! %l2 = 000000003be2ffff
!	Mem[0000000010181400] = 43ccfaf1, %l3 = 43f05d0fda9f434b
	ldsba	[%i6+%g0]0x80,%l3	! %l3 = 0000000000000043
!	Mem[00000000100c1408] = ff0000f1, %l6 = 000000000000faf1
	ldswa	[%i3+%o4]0x88,%l6	! %l6 = ffffffffff0000f1
!	Mem[0000000010041400] = 972500001c0000ff, %f10 = da9f434b 00000019
	ldda	[%i1+%g0]0x88,%f10	! %f10 = 97250000 1c0000ff

p0_label_257:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 190000ff, %l4 = 00000000f1facc43
	ldstuba	[%i6+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%l2 = 3be2ffff, %l3 = 00000043, Mem[0000000030081410] = 0000ff00 df2c9795
	stda	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 3be2ffff 00000043
!	%l7 = ffffffffa4000000, Mem[0000000030141410] = 00000000
	stwa	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = a4000000
!	%l4 = 00000000000000ff, Mem[00000000201c0001] = ffffa3b0
	stb	%l4,[%o0+0x001]		! Mem[00000000201c0000] = ffffa3b0
!	Mem[0000000010141410] = 00000000, %l1 = 000000003785cc0d
	swapa	[%i5+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181410] = ff000019000000a4, %l2 = 000000003be2ffff, %l5 = 000000002c856213
	add	%i6,0x10,%g1
	casxa	[%g1]0x80,%l2,%l5	! %l5 = ff000019000000a4
!	%f15 = 00000000, Mem[0000000030081400] = 00000000
	sta	%f15,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	Mem[0000000010041438] = 97250000, %l6 = ff0000f1, %l5 = 000000a4
	add	%i1,0x38,%g1
	casa	[%g1]0x80,%l6,%l5	! %l5 = 0000000097250000
!	%l7 = ffffffffa4000000, Mem[00000000300c1400] = 00000000
	stwa	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = a4000000
!	Mem[0000000030181410] = 00000000, %l5 = 0000000097250000
	swapa	[%i6+%o5]0x89,%l5	! %l5 = 0000000000000000

p0_label_258:
!	Starting 10 instruction Load Burst
!	%l6 = ffffffffff0000f1, immd = fffff6d7, %y  = 00000000
	umul	%l6,-0x929,%l3		! %l3 = fefff7d128f76067, %y = fefff7d1
!	Mem[0000000030181408] = 000000000000004b, %f18 = 2c856213 e6ff0000
	ldda	[%i6+%o4]0x89,%f18	! %f18 = 00000000 0000004b
!	%f18 = 00000000 0000004b, Mem[0000000010081400] = 00000000 00ff2300
	stda	%f18,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000 0000004b
!	Mem[0000000030001400] = 00006a7f00000000, %f26 = 00000000 e6ff0000
	ldda	[%i0+%g0]0x81,%f26	! %f26 = 00006a7f 00000000
!	Mem[00000000218000c0] = faff6b00, %l0 = 000000002597ffff, %asi = 80
	ldsha	[%o3+0x0c0]%asi,%l0	! %l0 = fffffffffffffaff
!	Mem[0000000030181400] = ffff0000, %l0 = fffffffffffffaff
	ldswa	[%i6+%g0]0x89,%l0	! %l0 = ffffffffffff0000
!	Mem[0000000010001408] = ffffe23b00000000, %f22 = 00006a7f ffffffff, %asi = 80
	ldda	[%i0+0x008]%asi,%f22	! %f22 = ffffe23b 00000000
!	Mem[0000000030081400] = 00000000, %l1 = 0000000000000000
	ldswa	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = 0000001cffffffff, %f30 = 00000000 71facc43
	ldda	[%i4+%o5]0x80,%f30	! %f30 = 0000001c ffffffff
!	Mem[0000000010041410] = ffffff01 00000000, %l2 = 3be2ffff, %l3 = 28f76067
	ldda	[%i1+%o5]0x80,%l2	! %l2 = 00000000ffffff01 0000000000000000

p0_label_259:
!	Starting 10 instruction Store Burst
!	%f8  = 00000000 0000001c, Mem[0000000010001408] = ffffe23b 00000000
	stda	%f8 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000 0000001c
!	%l6 = ffffffffff0000f1, Mem[0000000010141420] = 8caf3100
	stb	%l6,[%i5+0x020]		! Mem[0000000010141420] = f1af3100
!	%l2 = 00000000ffffff01, Mem[0000000010101400] = ff00000000ff0000
	stxa	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000ffffff01
!	%l5 = 0000000000000000, Mem[0000000030181400] = 0000ffff
	stwa	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	Mem[00000000100c1408] = f10000ff, %l4 = 00000000000000ff
	swapa	[%i3+%o4]0x80,%l4	! %l4 = 00000000f10000ff
!	Mem[0000000010041408] = 00000000, %l1 = 0000000000000000
	swapa	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000000
!	%f28 = ff000000, Mem[0000000030181400] = 00000000
	sta	%f28,[%i6+%g0]0x81	! Mem[0000000030181400] = ff000000
!	Mem[0000000010041410] = ffffff01, %l3 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l3	! %l3 = 00000000ffffff01
!	%l2 = 00000000ffffff01, Mem[0000000010081408] = 00000000
	stwa	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffff01
!	Mem[0000000030101400] = 000000ff, %l1 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l1	! %l1 = 0000000000000000

p0_label_260:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ffff9725, %l1 = 0000000000000000
	ldsha	[%i0+%g0]0x88,%l1	! %l1 = ffffffffffff9725
!	Mem[0000000010141410] = 0dcc8537f1facc43, %f22 = ffffe23b 00000000, %asi = 80
	ldda	[%i5+0x010]%asi,%f22	! %f22 = 0dcc8537 f1facc43
!	Mem[0000000010041408] = 00000000, %f24 = f1facc43
	lda	[%i1+%o4]0x88,%f24	! %f24 = 00000000
!	Mem[0000000030041410] = ff000000, %l5 = 0000000000000000
	lduba	[%i1+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001400] = 2597ffff0000af4f, %l6 = ffffffffff0000f1
	ldxa	[%i0+%g0]0x80,%l6	! %l6 = 2597ffff0000af4f
!	Mem[0000000030101410] = 3c473d12 488a506f, %l2 = ffffff01, %l3 = ffffff01
	ldda	[%i4+%o5]0x81,%l2	! %l2 = 000000003c473d12 00000000488a506f
!	%l0 = ffffffffffff0000, immd = fffffffffffffebf, %l108 = 0000000000000005
	sdivx	%l0,-0x141,%l5		! %l5 = 00000000000000cc
!	Mem[0000000030181408] = 0000004b, %l7 = ffffffffa4000000
	ldsha	[%i6+%o4]0x89,%l7	! %l7 = 000000000000004b
!	Mem[0000000030001400] = 00006a7f, %f27 = 00000000
	lda	[%i0+%g0]0x81,%f27	! %f27 = 00006a7f
!	%l6 = 2597ffff0000af4f, %l4 = 00000000f10000ff, %l1 = ffffffffffff9725
	and	%l6,%l4,%l1		! %l1 = 000000000000004f

p0_label_261:
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = 00005a40, %l0 = ffffffffffff0000
	ldstuba	[%o2+0x001]%asi,%l0	! %l0 = 0000000000000000
!	%l2 = 000000003c473d12, %l7 = 000000000000004b, %l1 = 000000000000004f
	xnor	%l2,%l7,%l1		! %l1 = ffffffffc3b8c2a6
!	%f2  = f1facc43 000000ff, %l2 = 000000003c473d12
!	Mem[00000000300c1408] = 00002597000000a4
	add	%i3,0x008,%g1
	stda	%f2,[%g1+%l2]ASI_PST16_SL ! Mem[00000000300c1408] = 00000000000000a4
!	%l2 = 3c473d12, %l3 = 488a506f, Mem[0000000030101408] = 00000000 43ccfa71
	stda	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 3c473d12 488a506f
!	Mem[0000000010041400] = ff00001c 00002597 00000000 000000ff
!	%f16 = 00000000 7f6a0000 00000000 0000004b
!	%f20 = 0000004c 00000000 0dcc8537 f1facc43
!	%f24 = 00000000 00a8af4f 00006a7f 00006a7f
!	%f28 = ff000000 1362852c 0000001c ffffffff
	stda	%f16,[%i1+%g0]ASI_BLK_P	! Block Store to 0000000010041400
	membar	#Sync			! Added by membar checker (48)
!	Mem[0000000010041410] = 4c000000, %l3 = 00000000488a506f
	ldstuba	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%l5 = 00000000000000cc, Mem[0000000030041408] = ffffffffda9f434b
	stxa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000000000cc
!	%l5 = 00000000000000cc, Mem[0000000030181410] = 6dd4dbc297250000
	stxa	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000000000cc
!	%l0 = 0000000000000000, Mem[0000000010101400] = 00000000
	stha	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	Mem[0000000010101408] = 00000000, %l7 = 000000000000004b
	swapa	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000

p0_label_262:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffffa3b0, %l0 = 0000000000000000, %asi = 80
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010081400] = 00000000, %l6 = 2597ffff0000af4f
	lduba	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1418] = 43ccfaf12a31de8c, %l7 = 0000000000000000, %asi = 80
	ldxa	[%i3+0x018]%asi,%l7	! %l7 = 43ccfaf12a31de8c
!	Mem[0000000030181400] = ff000000f1faccff, %f4  = ffffff01 00000000
	ldda	[%i6+%g0]0x81,%f4 	! %f4  = ff000000 f1faccff
!	Mem[0000000030101410] = 6f508a48123d473c, %f26 = 00006a7f 00006a7f
	ldda	[%i4+%o5]0x89,%f26	! %f26 = 6f508a48 123d473c
!	Mem[0000000030041408] = cc000000, %f8  = 00000000
	lda	[%i1+%o4]0x81,%f8 	! %f8 = cc000000
	membar	#Sync			! Added by membar checker (49)
!	Mem[0000000030041400] = 000000df 64b02073 cc000000 00000000
!	Mem[0000000030041410] = 000000ff f1facc43 43f05d0f da9f434b
!	Mem[0000000030041420] = 9725ca24 3e295957 ffc4787f 51d2834c
!	Mem[0000000030041430] = 3d5c9877 1c368a02 00000000 00000000
	ldda	[%i1+%g0]ASI_BLK_AIUS,%f0 	! Block Load from 0000000030041400
!	Mem[0000000030141410] = 000000a4, %l7 = 43ccfaf12a31de8c
	ldsba	[%i5+%o5]0x89,%l7	! %l7 = ffffffffffffffa4
!	Mem[0000000010041400] = 00000000, %l1 = ffffffffc3b8c2a6
	lduwa	[%i1+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = 4b000000, %f29 = 1362852c
	lda	[%i6+%o4]0x81,%f29	! %f29 = 4b000000

p0_label_263:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 00000000, %l2 = 000000003c473d12
	swapa	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = df000000, %l3 = 0000000000000000
	swapa	[%i1+%g0]0x89,%l3	! %l3 = 00000000df000000
!	%l5 = 00000000000000cc, Mem[0000000010041410] = ff00004c
	stwa	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000cc
!	%f22 = 0dcc8537 f1facc43, %l7 = ffffffffffffffa4
!	Mem[0000000030081418] = 43f05d0fda9f434b
	add	%i2,0x018,%g1
	stda	%f22,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030081418] = 43f05d0f3785434b
!	Mem[0000000010101408] = 0000004b, %l7 = ffffffffffffffa4
	ldstuba	[%i4+%o4]0x88,%l7	! %l7 = 000000000000004b
!	Mem[0000000030181408] = 0000004b, %l1 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l1	! %l1 = 000000000000004b
!	%f6  = 43f05d0f da9f434b, %l4 = 00000000f10000ff
!	Mem[00000000100c1428] = ff36000000000019
	add	%i3,0x028,%g1
	stda	%f6,[%g1+%l4]ASI_PST16_PL ! Mem[00000000100c1428] = 4b439fda0f5df043
!	%l6 = 00000000, %l7 = 0000004b, Mem[0000000030181408] = 000000ff 00000000
	stda	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 0000004b
!	%l4 = 00000000f10000ff, Mem[00000000201c0000] = ffffa3b0, %asi = 80
	stha	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ffa3b0
!	Mem[00000000300c1410] = 00000000, %l3 = 00000000df000000
	swapa	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000000

p0_label_264:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 7f78c4ff, %l7 = 000000000000004b
	lduha	[%i5+%g0]0x89,%l7	! %l7 = 000000000000c4ff
!	Mem[0000000030101410] = 123d473c, %l6 = 0000000000000000
	ldsba	[%i4+%o5]0x89,%l6	! %l6 = 000000000000003c
!	Mem[0000000010001410] = 3c473d12, %l1 = 000000000000004b
	ldsba	[%i0+%o5]0x88,%l1	! %l1 = 0000000000000012
!	Mem[0000000030101410] = 3c473d12488a506f, %f18 = 00000000 0000004b
	ldda	[%i4+%o5]0x81,%f18	! %f18 = 3c473d12 488a506f
!	Mem[0000000010001400] = 2597ffff0000af4f, %f18 = 3c473d12 488a506f
	ldda	[%i0+%g0]0x80,%f18	! %f18 = 2597ffff 0000af4f
!	Mem[0000000030141408] = ff000073 00000000, %l6 = 0000003c, %l7 = 0000c4ff
	ldda	[%i5+%o4]0x81,%l6	! %l6 = 00000000ff000073 0000000000000000
!	Mem[0000000020800000] = ff00b9e0, %l0 = ffffffffffffffff, %asi = 80
	ldsha	[%o1+0x000]%asi,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010001400] = ffff9725, %f19 = 0000af4f
	lda	[%i0+%g0]0x88,%f19	! %f19 = ffff9725
!	Mem[0000000010181410] = ff000019, %l6 = 00000000ff000073
	ldswa	[%i6+%o5]0x80,%l6	! %l6 = ffffffffff000019
!	Mem[0000000010081408] = 01ffffff, %l4 = 00000000f10000ff
	lduba	[%i2+%o4]0x88,%l4	! %l4 = 00000000000000ff

p0_label_265:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000030141410] = a4000000
	stba	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	Mem[0000000010041408] = 00000000, %l4 = 00000000000000ff
	swapa	[%i1+%o4]0x88,%l4	! %l4 = 0000000000000000
!	%l5 = 00000000000000cc, Mem[0000000010041418] = 0dcc8537f1facc43
	stx	%l5,[%i1+0x018]		! Mem[0000000010041418] = 00000000000000cc
!	%f31 = ffffffff, %f27 = 123d473c, %f21 = 00000000
	fdivs	%f31,%f27,%f21		! %f21 = ffffffff
!	Mem[0000000010081408] = ffffff01, %l3 = 0000000000000000
	swap	[%i2+%o4],%l3		! %l3 = 00000000ffffff01
!	%l2 = 0000000000000000, Mem[0000000010101400] = 00000000
	stha	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	Mem[0000000010181407] = fffffffe, %l3 = 00000000ffffff01
	ldstuba	[%i6+0x007]%asi,%l3	! %l3 = 00000000000000fe
!	%l1 = 0000000000000012, Mem[000000001010140f] = 00000000
	stb	%l1,[%i4+0x00f]		! Mem[000000001010140c] = 00000012
!	Mem[00000000300c1408] = 00000000, %l6 = 00000000ff000019
	swapa	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l4 = 0000000000000000
	swapa	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000000

p0_label_266:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ff000000, %f23 = f1facc43
	lda	[%i1+%o4]0x80,%f23	! %f23 = ff000000
!	Mem[0000000030081408] = 00000000, %l2 = 0000000000000000
	lduba	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041400] = 00006a7f00000000, %l1 = 0000000000000012
	ldxa	[%i1+%g0]0x88,%l1	! %l1 = 00006a7f00000000
!	Mem[00000000100c1408] = 000000ff, %l1 = 00006a7f00000000
	ldsha	[%i3+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = 00000000cc000000, %f10 = ffc4787f 51d2834c
	ldda	[%i1+%o5]0x88,%f10	! %f10 = 00000000 cc000000
!	Mem[0000000030081400] = 00000000, %f20 = 0000004c
	lda	[%i2+%g0]0x89,%f20	! %f20 = 00000000
!	Mem[0000000010181420] = fefffffff1facc43, %l4 = 0000000000000000, %asi = 80
	ldxa	[%i6+0x020]%asi,%l4	! %l4 = fefffffff1facc43
!	Mem[0000000030181410] = cc000000, %f20 = 00000000
	lda	[%i6+%o5]0x81,%f20	! %f20 = cc000000
!	Mem[0000000030041410] = 000000ff, %l4 = fefffffff1facc43
	lduha	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1428] = 4b439fda 0f5df043, %l4 = 00000000, %l5 = 000000cc
	ldd	[%i3+0x028],%l4		! %l4 = 000000004b439fda 000000000f5df043

p0_label_267:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (50)
!	%l0 = ffffffffffffff00, Mem[0000000030041400] = 00000000
	stba	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
!	%l4 = 4b439fda, %l5 = 0f5df043, Mem[0000000010081408] = 00000000 95972cdf
	stda	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 4b439fda 0f5df043
!	%l5 = 000000000f5df043, Mem[0000000030141408] = ff000073
	stba	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = 43000073
!	%l0 = ffffffffffffff00, Mem[00000000100c1400] = 000000ff
	stba	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	Mem[0000000030101400] = ff0000ff, %l4 = 000000004b439fda
	ldstuba	[%i4+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001400] = 7f6a0000, %l3 = 00000000000000fe
	swapa	[%i0+%g0]0x89,%l3	! %l3 = 000000007f6a0000
!	Mem[00000000201c0001] = 00ffa3b0, %l0 = ffffffffffffff00
	ldstub	[%o0+0x001],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010001430] = 000000ff, %l0 = 000000ff, %l4 = 000000ff
	add	%i0,0x30,%g1
	casa	[%g1]0x80,%l0,%l4	! %l4 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000030001408] = 2c856213000000ff
	stxa	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000000000000000

p0_label_268:
!	Starting 10 instruction Load Burst
!	Mem[000000001004141c] = 000000cc, %f23 = ff000000
	lda	[%i1+0x01c]%asi,%f23	! %f23 = 000000cc
!	Mem[0000000010181418] = 00008057d72bd82d, %f14 = 00000000 00000000
	ldd	[%i6+0x018],%f14	! %f14 = 00008057 d72bd82d
!	Mem[000000001008142c] = b7ff22ff, %l4 = 00000000000000ff, %asi = 80
	ldsha	[%i2+0x02c]%asi,%l4	! %l4 = ffffffffffffb7ff
!	Mem[0000000010181400] = 43ccfaf1, %l0 = 00000000000000ff
	ldswa	[%i6+%g0]0x80,%l0	! %l0 = 0000000043ccfaf1
!	Mem[00000000300c1400] = 000000a4 01ffffff 190000ff 000000a4
!	Mem[00000000300c1410] = df000000 7f6a0000 552d8bea 2c856213
!	Mem[00000000300c1420] = 18b671f8 0a2a8f29 4fafa800 c38f2266
!	Mem[00000000300c1430] = 7320b064 12a7e065 6dd4dbc2 79a7ab8b
	ldda	[%i3+%g0]ASI_BLK_SL,%f0 	! Block Load from 00000000300c1400
!	%l4 = ffffffffffffb7ff, %l0 = 0000000043ccfaf1, %l7  = 0000000000000000
	mulx	%l4,%l0,%l7		! %l7 = ffffecee159f3d0f
!	Mem[0000000021800041] = 0000eaa0, %l2 = 0000000000000000, %asi = 80
	ldsba	[%o3+0x041]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1410] = 43f05d0f, %l7 = ffffecee159f3d0f
	lduwa	[%i3+%o5]0x80,%l7	! %l7 = 0000000043f05d0f
!	%l5 = 000000000f5df043, immd = fffff67a, %y  = fefff7d1
	udiv	%l5,-0x986,%l1		! %l1 = 00000000ff00014d
	mov	%l0,%y			! %y = 43ccfaf1
!	Mem[00000000211c0000] = 00ff5a40, %l5 = 000000000f5df043
	lduh	[%o2+%g0],%l5		! %l5 = 00000000000000ff

p0_label_269:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 00000000, %l0 = 0000000043ccfaf1
	swapa	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l1 = 00000000ff00014d
	ldsha	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%l6 = 0000000000000000, %l5 = 00000000000000ff, %l4 = ffffffffffffb7ff
	xnor	%l6,%l5,%l4		! %l4 = ffffffffffffff00
!	Mem[0000000030181408] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000030101408] = 3c473d12
	stwa	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	%f14 = 8baba779, Mem[00000000100c1410] = 0f5df043
	sta	%f14,[%i3+%o5]0x88	! Mem[00000000100c1410] = 8baba779
!	%l3 = 000000007f6a0000, Mem[0000000020800000] = ff00b9e0
	sth	%l3,[%o1+%g0]		! Mem[0000000020800000] = 0000b9e0
!	Mem[0000000010181437] = ff5df043, %l1 = 0000000000000000
	ldstuba	[%i6+0x037]%asi,%l1	! %l1 = 0000000000000043
!	%l7 = 0000000043f05d0f, Mem[0000000010181408] = 4b000000000000ff
	stxa	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000000043f05d0f
!	%f12 = 65e0a712 64b02073, %l7 = 0000000043f05d0f
!	Mem[0000000030001400] = fe00000000000000
	stda	%f12,[%i0+%l7]ASI_PST8_SL ! Mem[0000000030001400] = 7320b06400000000

p0_label_270:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = df000000, %l7 = 0000000043f05d0f
	ldsha	[%i3+%o5]0x81,%l7	! %l7 = ffffffffffffdf00
!	Mem[0000000030081410] = 00000043 3be2ffff, %l2 = 00000000, %l3 = 7f6a0000
	ldda	[%i2+%o5]0x89,%l2	! %l2 = 000000003be2ffff 0000000000000043
!	Mem[0000000010181410] = a4000000190000ff, %f16 = 00000000 7f6a0000
	ldda	[%i6+%o5]0x88,%f16	! %f16 = a4000000 190000ff
!	Mem[0000000010141410] = 43ccfaf13785cc0d, %l5 = 00000000000000ff
	ldxa	[%i5+%o5]0x88,%l5	! %l5 = 43ccfaf13785cc0d
!	Mem[0000000030101400] = ff0000ff, %l6 = 0000000000000000
	lduha	[%i4+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181408] = 0000004b000000ff, %f26 = 6f508a48 123d473c
	ldda	[%i6+%o4]0x89,%f26	! %f26 = 0000004b 000000ff
!	Mem[0000000010141418] = 20ef580a00000980, %l4 = ffffffffffffff00, %asi = 80
	ldxa	[%i5+0x018]%asi,%l4	! %l4 = 20ef580a00000980
!	Mem[0000000010041408] = ff000000, %l1 = 0000000000000043
	ldsha	[%i1+%o4]0x80,%l1	! %l1 = ffffffffffffff00
!	%f11 = 00a8af4f, %f6  = 1362852c, %f18 = 2597ffff
	fadds	%f11,%f6 ,%f18		! %f18 = 1362852c
!	Mem[0000000010181410] = ff000019, %l7 = ffffffffffffdf00
	ldswa	[%i6+%o5]0x80,%l7	! %l7 = ffffffffff000019

p0_label_271:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 000000cc, %l0 = 0000000000000000
	swapa	[%i1+%o4]0x89,%l0	! %l0 = 00000000000000cc
!	%l6 = 000000ff, %l7 = ff000019, Mem[0000000010101410] = 1c000000 ffffffff
	stda	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff ff000019
!	%l5 = 43ccfaf13785cc0d, Mem[0000000010181410] = ff000019
	stwa	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = 3785cc0d
!	Mem[0000000030081400] = 00000000, %l1 = 00000000ffffff00
	swapa	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000000
!	%f30 = 0000001c, Mem[0000000030001410] = 0000cc43
	sta	%f30,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000001c
!	%l5 = 43ccfaf13785cc0d, Mem[00000000100c1410] = 79a7ab8b
	stha	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = cc0dab8b
!	Mem[000000001010143c] = 000087ff, %l0 = 00000000000000cc, %asi = 80
	swapa	[%i4+0x03c]%asi,%l0	! %l0 = 00000000000087ff
	membar	#Sync			! Added by membar checker (51)
!	%l3 = 0000000000000043, Mem[00000000300c1410] = 000000df
	stha	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000043
!	%l7 = ffffffffff000019, Mem[0000000010041400] = 00000000
	stba	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 19000000
!	%f14 = 8baba779 c2dbd46d, Mem[00000000300c1410] = 00000043 00006a7f
	stda	%f14,[%i3+%o5]0x89	! Mem[00000000300c1410] = 8baba779 c2dbd46d

p0_label_272:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %l1 = 0000000000000000
	ldsha	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = ff000000, %l7 = ffffffffff000019
	lduha	[%i4+%o5]0x80,%l7	! %l7 = 000000000000ff00
!	Mem[0000000020800000] = 0000b9e0, %l7 = 000000000000ff00
	lduh	[%o1+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000010181410] = 0dcc8537, %l7 = 0000000000000000
	lduba	[%i6+%o5]0x88,%l7	! %l7 = 0000000000000037
!	Mem[0000000030041408] = 00000000 00000000, %l6 = 000000ff, %l7 = 00000037
	ldda	[%i1+%o4]0x89,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010141408] = 00000000, %l5 = 43ccfaf13785cc0d
	ldsba	[%i5+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081400] = ffffff01 00ffffff, %l4 = 00000980, %l5 = 00000000
	ldda	[%i2+%g0]0x89,%l4	! %l4 = 0000000000ffffff 00000000ffffff01
!	Mem[0000000030181410] = cc000000, %l0 = 00000000000087ff
	ldsba	[%i6+%o5]0x81,%l0	! %l0 = ffffffffffffffcc
!	Mem[0000000030101408] = 00000000, %l2 = 000000003be2ffff
	lduwa	[%i4+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001408] = f1facc43, %l3 = 0000000000000043
	ldsba	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000043

p0_label_273:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000010141408] = 00000000
	stwa	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	Mem[0000000010041410] = 000000cc, %l3 = 0000000000000043
	ldstuba	[%i1+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = 3785cc0d, %l6 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l6	! %l6 = 000000003785cc0d
!	%l4 = 00ffffff, %l5 = ffffff01, Mem[0000000030081410] = ffffe23b 43000000
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 00ffffff ffffff01
!	%l2 = 0000000000000000, Mem[0000000021800000] = ff76e470
	stb	%l2,[%o3+%g0]		! Mem[0000000021800000] = 0076e470
!	%l6 = 000000003785cc0d, Mem[0000000030041400] = 00000000
	stwa	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 3785cc0d
!	Mem[000000001008143c] = 43f05d0f, %l0 = ffffffcc, %l2 = 00000000
	add	%i2,0x3c,%g1
	casa	[%g1]0x80,%l0,%l2	! %l2 = 0000000043f05d0f
!	Mem[0000000010041400] = 19000000 7f6a0000 ff000000 0000004b
!	%f0  = ffffff01 a4000000 a4000000 ff000019
!	%f4  = 00006a7f 000000df 1362852c ea8b2d55
!	%f8  = 298f2a0a f871b618 66228fc3 00a8af4f
!	%f12 = 65e0a712 64b02073 8baba779 c2dbd46d
	stda	%f0 ,[%i1+%g0]ASI_BLK_P	! Block Store to 0000000010041400
!	Mem[00000000300c1400] = 000000a4, %l0 = ffffffffffffffcc
	ldstuba	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l3	! %l3 = 0000000000000000

p0_label_274:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (52)
!	Mem[0000000010041408] = a4000000, %l2 = 0000000043f05d0f
	ldsba	[%i1+%o4]0x80,%l2	! %l2 = ffffffffffffffa4
!	Mem[0000000010001408] = 00000000, %l1 = 0000000000000000
	lduha	[%i0+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = 0000004b000000ff, %l4 = 0000000000ffffff
	ldxa	[%i6+%o4]0x89,%l4	! %l4 = 0000004b000000ff
!	Mem[0000000030141410] = 00000000, %l1 = 0000000000000000
	ldswa	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l5 = 00000000ffffff01
	lduwa	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181408] = ff000000, %l1 = 0000000000000000
	lduwa	[%i6+%o4]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[0000000030041400] = 7320b0640dcc8537, %f16 = a4000000 190000ff
	ldda	[%i1+%g0]0x89,%f16	! %f16 = 7320b064 0dcc8537
!	Mem[0000000010081410] = 6dd4dbc2, %l5 = 0000000000000000
	ldsba	[%i2+%o5]0x88,%l5	! %l5 = ffffffffffffffc2
!	Mem[0000000030001408] = 43ccfaf1, %l6 = 000000003785cc0d
	lduha	[%i0+%o4]0x81,%l6	! %l6 = 00000000000043cc
!	%f6  = 1362852c, %f8  = 298f2a0a
	fcmpes	%fcc0,%f6 ,%f8 		! %fcc0 = 1

p0_label_275:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000043cc, Mem[0000000010101408] = 000000ff
	stwa	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 000043cc
!	%f14 = 8baba779 c2dbd46d, Mem[0000000010001400] = 2597ffff 0000af4f, %asi = 80
	stda	%f14,[%i0+0x000]%asi	! Mem[0000000010001400] = 8baba779 c2dbd46d
!	%f24 = 00000000 00a8af4f, %l6 = 00000000000043cc
!	Mem[0000000010041418] = 1362852cea8b2d55
	add	%i1,0x018,%g1
	stda	%f24,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010041418] = 1362a800ea8b0000
!	Mem[00000000300c1400] = a40000ff, %l5 = ffffffffffffffc2
	ldstuba	[%i3+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%l6 = 00000000000043cc, Mem[0000000010041404] = a4000000, %asi = 80
	stwa	%l6,[%i1+0x004]%asi	! Mem[0000000010041404] = 000043cc
!	%l4 = 0000004b000000ff, Mem[000000001004142d] = 00a8af4f, %asi = 80
	stba	%l4,[%i1+0x02d]%asi	! Mem[000000001004142c] = 00ffaf4f
!	Mem[0000000030141410] = 00000000, %l4 = 0000004b000000ff
	ldstuba	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000
!	%f30 = 0000001c ffffffff, Mem[0000000010141430] = 00001c36 16cbff66, %asi = 80
	stda	%f30,[%i5+0x030]%asi	! Mem[0000000010141430] = 0000001c ffffffff
!	Mem[00000000300c1400] = ff0000a4, %l3 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l3	! %l3 = 00000000ff0000a4
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000030141408] = 73000043 00000000
	stda	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000 000000ff

p0_label_276:
!	Starting 10 instruction Load Burst
!	Mem[000000001014141c] = 00000980, %l2 = ffffffffffffffa4
	ldsw	[%i5+0x01c],%l2		! %l2 = 0000000000000980
!	Mem[00000000300c1400] = 00000000, %l5 = 00000000000000ff
	ldsba	[%i3+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = ff0000ff, %f19 = ffff9725
	lda	[%i4+%g0]0x81,%f19	! %f19 = ff0000ff
!	Mem[0000000010081434] = ffffffff, %f8  = 298f2a0a
	lda	[%i2+0x034]%asi,%f8 	! %f8 = ffffffff
!	Mem[00000000300c1400] = 00000000, %l0 = 0000000000000000
	lduwa	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081410] = 00ffffffffffff01, %l3 = 00000000ff0000a4
	ldxa	[%i2+%o5]0x81,%l3	! %l3 = 00ffffffffffff01
!	Mem[0000000030141408] = 00000000, %l6 = 00000000000043cc
	lduba	[%i5+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = 3c473d12, %l6 = 0000000000000000
	lduwa	[%i0+%o5]0x88,%l6	! %l6 = 000000003c473d12
!	Mem[0000000010101410] = ff000000 190000ff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i4+%o5]0x80,%l4	! %l4 = 00000000ff000000 00000000190000ff
!	Mem[00000000100c1400] = 00000000, %f8  = ffffffff
	lda	[%i3+%g0]0x80,%f8 	! %f8 = 00000000

p0_label_277:
!	Starting 10 instruction Store Burst
!	Mem[0000000021800000] = 0076e470, %l6 = 000000003c473d12
	ldstub	[%o3+%g0],%l6		! %l6 = 0000000000000000
!	Mem[0000000010181418] = 00008057, %l6 = 0000000000000000, %asi = 80
	swapa	[%i6+0x018]%asi,%l6	! %l6 = 0000000000008057
!	Mem[0000000010081408] = da9f434b, %l2 = 0000000000000980
	ldstuba	[%i2+%o4]0x88,%l2	! %l2 = 000000000000004b
!	%l4 = ff000000, %l5 = 190000ff, Mem[0000000030141410] = 000000ff 0dcc8537
	stda	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = ff000000 190000ff
!	%f14 = 8baba779, Mem[0000000010101434] = f1facc43
	sta	%f14,[%i4+0x034]%asi	! Mem[0000000010101434] = 8baba779
!	%f27 = 000000ff, Mem[00000000100c1404] = 43ccfaf1
	st	%f27,[%i3+0x004]	! Mem[00000000100c1404] = 000000ff
!	%f24 = 00000000 00a8af4f, Mem[0000000010001408] = 00000000 1c000000
	stda	%f24,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000 00a8af4f
!	%f6  = 1362852c, Mem[0000000010041408] = a4000000
	st	%f6 ,[%i1+%o4]		! Mem[0000000010041408] = 1362852c
!	Mem[0000000010101414] = 190000ff, %l5 = 00000000190000ff
	ldstub	[%i4+0x014],%l5		! %l5 = 0000000000000019
!	%l6 = 00008057, %l7 = 00000000, Mem[0000000010101408] = 000043cc 12000000
	stda	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 00008057 00000000

p0_label_278:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 6dd4dbc2, %f6  = 1362852c
	lda	[%i3+%o5]0x81,%f6 	! %f6 = 6dd4dbc2
!	Mem[0000000010001410] = 123d473c a4000000, %l6 = 00008057, %l7 = 00000000
	ldda	[%i0+%o5]0x80,%l6	! %l6 = 00000000123d473c 00000000a4000000
!	Mem[0000000010101408] = 00008057, %l0 = 0000000000000000
	ldswa	[%i4+%o4]0x88,%l0	! %l0 = 0000000000008057
!	Mem[0000000010081408] = da9f43ff, %l3 = 00ffffffffffff01
	lduba	[%i2+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1410] = 6dd4dbc2, %l4 = 00000000ff000000
	ldswa	[%i3+%o5]0x81,%l4	! %l4 = 000000006dd4dbc2
!	Mem[0000000030081400] = ffffff0100ffffff, %l1 = 00000000ff000000
	ldxa	[%i2+%g0]0x89,%l1	! %l1 = ffffff0100ffffff
!	%l5 = 0000000000000019, imm = 00000000000006b9, %l2 = 000000000000004b
	or	%l5,0x6b9,%l2		! %l2 = 00000000000006b9
!	Mem[0000000010141410] = 43ccfaf100000000, %f24 = 00000000 00a8af4f
	ldda	[%i5+%o5]0x88,%f24	! %f24 = 43ccfaf1 00000000
!	Mem[0000000030141408] = 00000000ff000000, %f24 = 43ccfaf1 00000000
	ldda	[%i5+%o4]0x81,%f24	! %f24 = 00000000 ff000000
!	Mem[00000000211c0000] = 00ff5a40, %l4 = 000000006dd4dbc2, %asi = 80
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = 00000000000000ff

p0_label_279:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = ffffff00, %l3 = 00000000000000ff
	swapa	[%i2+%o5]0x89,%l3	! %l3 = 00000000ffffff00
!	Mem[0000000010181410] = 0dcc8537, %l6 = 00000000123d473c
	ldstuba	[%i6+%o5]0x88,%l6	! %l6 = 0000000000000037
!	%l0 = 00008057, %l1 = 00ffffff, Mem[0000000010081410] = 6dd4dbc2 8cde312a
	stda	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = 00008057 00ffffff
!	%f6  = 6dd4dbc2 ea8b2d55, Mem[0000000010181410] = ff85cc0d 000000a4
	stda	%f6 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 6dd4dbc2 ea8b2d55
!	Mem[000000001008141c] = 00000000, %l4 = 000000ff, %l4 = 000000ff
	add	%i2,0x1c,%g1
	casa	[%g1]0x80,%l4,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1400] = 00000000 01ffffff 190000ff 000000a4
!	%f0  = ffffff01 a4000000 a4000000 ff000019
!	%f4  = 00006a7f 000000df 6dd4dbc2 ea8b2d55
!	%f8  = 00000000 f871b618 66228fc3 00a8af4f
!	%f12 = 65e0a712 64b02073 8baba779 c2dbd46d
	stda	%f0 ,[%i3+%g0]ASI_BLK_SL	! Block Store to 00000000300c1400
!	%l7 = 00000000a4000000, Mem[0000000010181404] = ffffffff
	stw	%l7,[%i6+0x004]		! Mem[0000000010181404] = a4000000
!	%l6 = 0000000000000037, Mem[0000000010101422] = 00000058, %asi = 80
	stha	%l6,[%i4+0x022]%asi	! Mem[0000000010101420] = 00000037
!	%l3 = 00000000ffffff00, Mem[0000000030081400] = 00ffffff
	stwa	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffff00
!	%l5 = 0000000000000019, immd = 00000cea, %y  = 43ccfaf1
	udiv	%l5,0xcea,%l5		! %l5 = 00000000ffffffff
	mov	%l0,%y			! %y = 00008057

p0_label_280:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 3c473d12, %l1 = ffffff0100ffffff
	lduha	[%i0+%o5]0x88,%l1	! %l1 = 0000000000003d12
!	Mem[0000000030141408] = 00000000, %f18 = 1362852c
	lda	[%i5+%o4]0x89,%f18	! %f18 = 00000000
!	Mem[0000000010081438] = 0000000043f05d0f, %l4 = 0000000000000000
	ldx	[%i2+0x038],%l4		! %l4 = 0000000043f05d0f
!	Mem[0000000010041424] = f871b618, %l4 = 0000000043f05d0f
	ldsw	[%i1+0x024],%l4		! %l4 = fffffffff871b618
!	Mem[0000000010081414] = ffffff00, %l7 = 00000000a4000000
	ldsh	[%i2+0x014],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010101408] = 5780000000000000, %l7 = ffffffffffffffff
	ldx	[%i4+%o4],%l7		! %l7 = 5780000000000000
!	Mem[0000000010081438] = 00000000, %f24 = 00000000
	lda	[%i2+0x038]%asi,%f24	! %f24 = 00000000
!	Mem[0000000010081400] = 00000000, %l7 = 5780000000000000
	lduwa	[%i2+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001408] = f1facc43, %l5 = 00000000ffffffff
	ldsba	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000043
!	Mem[0000000010001400] = 8baba779, %l7 = 0000000000000000
	ldsba	[%i0+%g0]0x80,%l7	! %l7 = ffffffffffffff8b

p0_label_281:
!	Starting 10 instruction Store Burst
!	%f28 = ff000000 4b000000, Mem[0000000030101410] = 3c473d12 488a506f
	stda	%f28,[%i4+%o5]0x81	! Mem[0000000030101410] = ff000000 4b000000
!	%f0  = ffffff01, Mem[0000000030101408] = 00000000
	sta	%f0 ,[%i4+%o4]0x89	! Mem[0000000030101408] = ffffff01
!	%l0 = 0000000000008057, imm = 000000000000086b, %l1 = 0000000000003d12
	xnor	%l0,0x86b,%l1		! %l1 = ffffffffffff77c3
!	Mem[0000000030181408] = 000000ff, %l4 = 00000000f871b618
	swapa	[%i6+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%l5 = 0000000000000043, Mem[00000000300c1400] = 000000a401ffffff
	stxa	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000000000043
!	%f30 = 0000001c ffffffff, %l6 = 0000000000000037
!	Mem[0000000030141428] = 2819d0165db0382c
	add	%i5,0x028,%g1
	stda	%f30,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030141428] = ffffffff1c00382c
!	%l5 = 0000000000000043, Mem[000000001004141c] = ea8b0000
	stw	%l5,[%i1+0x01c]		! Mem[000000001004141c] = 00000043
!	Mem[0000000010081410] = 00008057, %l3 = 00000000ffffff00
	swapa	[%i2+%o5]0x88,%l3	! %l3 = 0000000000008057
!	%f28 = ff000000, Mem[0000000030101408] = ffffff01
	sta	%f28,[%i4+%o4]0x89	! Mem[0000000030101408] = ff000000
!	%l1 = ffffffffffff77c3, Mem[0000000010081408] = ff439fda
	stba	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = c3439fda

p0_label_282:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (53)
!	Mem[00000000300c1408] = ff000019, %l6 = 0000000000000037
	ldsba	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000019
!	Mem[0000000010181410] = 6dd4dbc2ea8b2d55, %l5 = 0000000000000043
	ldxa	[%i6+%o5]0x80,%l5	! %l5 = 6dd4dbc2ea8b2d55
!	Mem[0000000010001400] = 8baba779, %l1 = ffffffffffff77c3, %asi = 80
	ldswa	[%i0+0x000]%asi,%l1	! %l1 = ffffffff8baba779
!	Mem[0000000010141424] = c3222266, %l2 = 00000000000006b9, %asi = 80
	ldswa	[%i5+0x024]%asi,%l2	! %l2 = ffffffffc3222266
!	Mem[00000000201c0000] = 00ffa3b0, %l2 = ffffffffc3222266, %asi = 80
	lduha	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	%l7 = ffffffffffffff8b, Mem[0000000030181400] = ff000000
	stha	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = ff8b0000
!	Mem[00000000100c140a] = 000000ff, %l0 = 0000000000008057, %asi = 80
	lduha	[%i3+0x00a]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[000000001010141c] = ffffffff, %l4 = 00000000000000ff
	ldsh	[%i4+0x01c],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030081400] = ffffff00, %l7 = ffffffffffffff8b
	ldsba	[%i2+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041404] = 000043cc, %l7 = 0000000000000000, %asi = 80
	ldswa	[%i1+0x004]%asi,%l7	! %l7 = 00000000000043cc

p0_label_283:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000019, Mem[0000000010141408] = 00000000
	stha	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000019
!	%f28 = ff000000, Mem[000000001010143c] = 000000cc
	sta	%f28,[%i4+0x03c]%asi	! Mem[000000001010143c] = ff000000
!	%l5 = 6dd4dbc2ea8b2d55, Mem[0000000010081410] = 00ffffff
	stwa	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = ea8b2d55
!	%l5 = 6dd4dbc2ea8b2d55, Mem[00000000300c1408] = 190000ff000000a4
	stxa	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 6dd4dbc2ea8b2d55
!	%l2 = 00000000000000ff, Mem[0000000030101400] = ff0000ff
	stba	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = ff0000ff
!	%l5 = 6dd4dbc2ea8b2d55, Mem[0000000030001408] = 43ccfaf1
	stha	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = 2d55faf1
!	%l4 = ffffffff, %l5 = ea8b2d55, Mem[0000000030141408] = 00000000 ff000000
	stda	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffffff ea8b2d55
!	Mem[0000000010001410] = 123d473c, %l6 = 0000000000000019
	ldstuba	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000012
!	Mem[0000000010181408] = 43f05d0f, %l2 = 00000000000000ff
	ldstuba	[%i6+%o4]0x88,%l2	! %l2 = 000000000000000f
!	Mem[00000000100c1410] = 8bab0dcc, %l6 = 0000000000000012
	swapa	[%i3+%o5]0x88,%l6	! %l6 = 000000008bab0dcc

p0_label_284:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 8baba779, %l1 = ffffffff8baba779
	lduha	[%i0+%g0]0x80,%l1	! %l1 = 0000000000008bab
!	Mem[0000000030001400] = 64b02073, %l6 = 000000008bab0dcc
	ldswa	[%i0+%g0]0x89,%l6	! %l6 = 0000000064b02073
!	Mem[0000000030141400] = ffc4787f, %l7 = 00000000000043cc
	lduwa	[%i5+%g0]0x81,%l7	! %l7 = 00000000ffc4787f
!	%f25 = ff000000, %f11 = 00a8af4f
	fcmpes	%fcc2,%f25,%f11		! %fcc2 = 1
!	Mem[0000000010141408] = 19000000, %l4 = ffffffffffffffff
	ldsba	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000019
!	Mem[00000000100c1408] = 000000ffff000000, %l4 = 0000000000000019, %asi = 80
	ldxa	[%i3+0x008]%asi,%l4	! %l4 = 000000ffff000000
!	Mem[00000000100c1410] = 00000012, %l6 = 0000000064b02073
	lduba	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000012
!	Mem[00000000100c1438] = 00d6d46d, %l3 = 0000000000008057
	ldsw	[%i3+0x038],%l3		! %l3 = 0000000000d6d46d
!	%f7  = ea8b2d55, %f15 = c2dbd46d
	fsqrts	%f7 ,%f15		! %f15 = 7fffffff
!	Mem[0000000010081410] = ea8b2d55, %l1 = 0000000000008bab
	ldsha	[%i2+%o5]0x80,%l1	! %l1 = ffffffffffffea8b

p0_label_285:
!	Starting 10 instruction Store Burst
!	%l5 = 6dd4dbc2ea8b2d55, Mem[0000000030181410] = 000000cc
	stba	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000055
!	%f12 = 65e0a712, Mem[0000000010181418] = 00000000
	st	%f12,[%i6+0x018]	! Mem[0000000010181418] = 65e0a712
!	%f0  = ffffff01 a4000000, %l0 = 00000000000000ff
!	Mem[0000000030081400] = 00ffffff01ffffff
	stda	%f0,[%i2+%l0]ASI_PST16_SL ! Mem[0000000030081400] = 000000a401ffffff
!	Mem[000000001000143c] = f1ffcc43, %l1 = ffffea8b, %l1 = ffffea8b
	add	%i0,0x3c,%g1
	casa	[%g1]0x80,%l1,%l1	! %l1 = 00000000f1ffcc43
!	%l5 = 6dd4dbc2ea8b2d55, Mem[0000000030141400] = ffc4787f
	stba	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 55c4787f
!	Mem[0000000010101404] = ffffff01, %l6 = 0000000000000012
	ldstub	[%i4+0x004],%l6		! %l6 = 00000000000000ff
!	%f24 = 00000000 ff000000, Mem[00000000100c1430] = 3216b68c 3785cc0d, %asi = 80
	stda	%f24,[%i3+0x030]%asi	! Mem[00000000100c1430] = 00000000 ff000000
!	%l3 = 0000000000d6d46d, Mem[0000000010081400] = 00000000
	stha	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = d46d0000
!	%l1 = 00000000f1ffcc43, immd = fffff122, %y  = 00008057
	umul	%l1,-0xede,%l5		! %l5 = f1ffbe35270133e6, %y = f1ffbe35
!	%l4 = 000000ffff000000, Mem[0000000010041438] = 8baba779c2dbd46d
	stx	%l4,[%i1+0x038]		! Mem[0000000010041438] = 000000ffff000000

p0_label_286:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 57800000 00000000, %l4 = ff000000, %l5 = 270133e6
	ldd	[%i4+%o4],%l4		! %l4 = 0000000057800000 0000000000000000
!	Mem[0000000021800140] = 4bc5db60, %l3 = 0000000000d6d46d, %asi = 80
	ldsha	[%o3+0x140]%asi,%l3	! %l3 = 0000000000004bc5
!	Mem[0000000010041410] = 00006a7f, %f14 = 8baba779
	lda	[%i1+%o5]0x80,%f14	! %f14 = 00006a7f
!	Mem[00000000100c141c] = 2a31de8c, %l6 = 00000000000000ff
	ldsw	[%i3+0x01c],%l6		! %l6 = 000000002a31de8c
!	Mem[0000000010081400] = d46d0000, %l3 = 0000000000004bc5
	ldswa	[%i2+%g0]0x80,%l3	! %l3 = ffffffffd46d0000
!	Mem[0000000030141410] = 000000ffff000019, %l1 = 00000000f1ffcc43
	ldxa	[%i5+%o5]0x81,%l1	! %l1 = 000000ffff000019
!	Mem[0000000010101400] = 00000000, %l7 = 00000000ffc4787f
	lduwa	[%i4+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081410] = 552d8bea, %l3 = ffffffffd46d0000
	ldswa	[%i2+%o5]0x88,%l3	! %l3 = 00000000552d8bea
!	Mem[0000000030181400] = ffccfaf100008bff, %f28 = ff000000 4b000000
	ldda	[%i6+%g0]0x89,%f28	! %f28 = ffccfaf1 00008bff
!	Mem[000000001000143a] = 1c360000, %l1 = 000000ffff000019
	ldsh	[%i0+0x03a],%l1		! %l1 = 0000000000000000

p0_label_287:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = c2dbd46d, %l5 = 0000000000000000
	swapa	[%i6+%o5]0x88,%l5	! %l5 = 00000000c2dbd46d
!	Mem[0000000010041400] = ffffff01, %l3 = 00000000552d8bea
	swapa	[%i1+%g0]0x80,%l3	! %l3 = 00000000ffffff01
!	%l2 = 000000000000000f, Mem[0000000030141408] = ffffffff
	stha	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 000fffff
!	%l5 = 00000000c2dbd46d, Mem[0000000030181408] = 18b671f84b000000
	stxa	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000c2dbd46d
!	Mem[0000000030181410] = 55000000, %l1 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l1	! %l1 = 0000000055000000
!	%l4 = 0000000057800000, %l5 = 00000000c2dbd46d, %l7 = 0000000000000000
	andn	%l4,%l5,%l7		! %l7 = 0000000015000000
!	%l3 = 00000000ffffff01, %l2 = 000000000000000f, %l2  = 000000000000000f
	mulx	%l3,%l2,%l2		! %l2 = 0000000efffff10f
!	%f12 = 65e0a712 64b02073, %l6 = 000000002a31de8c
!	Mem[0000000030101430] = 4b439fda1362852c
	add	%i4,0x030,%g1
	stda	%f12,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030101430] = 4b439fda1362852c
!	Mem[0000000010181427] = f1facc43, %l6 = 000000002a31de8c
	ldstuba	[%i6+0x027]%asi,%l6	! %l6 = 0000000000000043
!	Mem[0000000010101400] = 00000000 ffffff01 57800000 00000000
!	%f16 = 7320b064 0dcc8537 00000000 ff0000ff
!	%f20 = cc000000 ffffffff 0dcc8537 000000cc
!	%f24 = 00000000 ff000000 0000004b 000000ff
!	%f28 = ffccfaf1 00008bff 0000001c ffffffff
	stda	%f16,[%i4+%g0]ASI_BLK_PL	! Block Store to 0000000010101400

p0_label_288:
!	Starting 10 instruction Load Burst
!	Mem[000000001014143a] = 4fafa800, %l1 = 0000000055000000, %asi = 80
	ldsba	[%i5+0x03a]%asi,%l1	! %l1 = ffffffffffffffa8
!	Mem[0000000030041400] = 3785cc0d, %l6 = 0000000000000043
	lduba	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000037
!	Mem[0000000010081410] = ea8b2d55ffffff00, %f6  = 6dd4dbc2 ea8b2d55
	ldda	[%i2+%o5]0x80,%f6 	! %f6  = ea8b2d55 ffffff00
!	Mem[0000000030141408] = 000fffff, %l7 = 0000000015000000
	lduha	[%i5+%o4]0x81,%l7	! %l7 = 000000000000000f
!	Mem[0000000010081410] = 00ffffff552d8bea, %l0 = 00000000000000ff
	ldxa	[%i2+%o5]0x88,%l0	! %l0 = 00ffffff552d8bea
!	Mem[0000000010081410] = 00ffffff 552d8bea, %l0 = 552d8bea, %l1 = ffffffa8
	ldda	[%i2+%o5]0x88,%l0	! %l0 = 00000000552d8bea 0000000000ffffff
!	Mem[00000000100c1408] = 000000ff, %l6 = 0000000000000037
	lduba	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041410] = 43ccfaf1 ff000000, %l2 = fffff10f, %l3 = ffffff01
	ldda	[%i1+%o5]0x89,%l2	! %l2 = 00000000ff000000 0000000043ccfaf1
!	Mem[0000000010181400] = f1facc43, %l0 = 00000000552d8bea
	lduwa	[%i6+%g0]0x88,%l0	! %l0 = 00000000f1facc43
!	Mem[0000000030101408] = ff000000, %l5 = 00000000c2dbd46d
	ldsha	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000

p0_label_289:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[00000000100c1438] = 00d6d46d00000000
	stx	%l5,[%i3+0x038]		! Mem[00000000100c1438] = 0000000000000000
!	%f1  = a4000000, Mem[0000000030181410] = 00000000
	sta	%f1 ,[%i6+%o5]0x81	! Mem[0000000030181410] = a4000000
	membar	#Sync			! Added by membar checker (54)
!	Mem[0000000010101407] = 64b02073, %l6 = 0000000000000000
	ldstub	[%i4+0x007],%l6		! %l6 = 0000000000000073
!	Mem[0000000030001400] = 64b02073, %l4 = 0000000057800000
	ldstuba	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000073
!	%l0 = 00000000f1facc43, Mem[0000000030001408] = f1fa552d
	stba	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = f1fa5543
!	Mem[000000001000141c] = daffcb1c, %l2 = 00000000ff000000, %asi = 80
	swapa	[%i0+0x01c]%asi,%l2	! %l2 = 00000000daffcb1c
!	%l1 = 0000000000ffffff, Mem[0000000030041410] = 43ccfaf1ff000000
	stxa	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000000000ffffff
!	%l2 = 00000000daffcb1c, Mem[0000000010141408] = 19000000ff000000, %asi = 80
	stxa	%l2,[%i5+0x008]%asi	! Mem[0000000010141408] = 00000000daffcb1c
!	Mem[0000000010181408] = ff5df043, %l6 = 0000000000000073
	swapa	[%i6+%o4]0x80,%l6	! %l6 = 00000000ff5df043
!	%f13 = 64b02073, Mem[0000000010181400] = 43ccfaf1
	sta	%f13,[%i6+%g0]0x80	! Mem[0000000010181400] = 64b02073

p0_label_290:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00000000, %l6 = 00000000ff5df043
	lduba	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = 6dd4dbc279a7ab8b, %f22 = 0dcc8537 000000cc
	ldda	[%i0+%g0]0x88,%f22	! %f22 = 6dd4dbc2 79a7ab8b
!	Mem[0000000030181400] = ff8b0000, %l0 = 00000000f1facc43
	ldsba	[%i6+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	%l6 = 0000000000000000, %l3 = 0000000043ccfaf1, %y  = f1ffbe35
	sdiv	%l6,%l3,%l0		! %l0 = ffffffffcb22a9ab
	mov	%l0,%y			! %y = cb22a9ab
!	Mem[00000000211c0000] = 00ff5a40, %l5 = 0000000000000000
	ldsh	[%o2+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030041410] = ffffff00, %l7 = 000000000000000f
	lduwa	[%i1+%o5]0x81,%l7	! %l7 = 00000000ffffff00
!	Mem[00000000201c0000] = 00ffa3b0, %l0 = ffffffffcb22a9ab
	lduh	[%o0+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030181408] = 00000000, %l7 = 00000000ffffff00
	ldsba	[%i6+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = 64b02073, %l7 = 0000000000000000
	ldsba	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000064
!	Mem[00000000201c0001] = 00ffa3b0, %l0 = 00000000000000ff, %asi = 80
	lduba	[%o0+0x001]%asi,%l0	! %l0 = 00000000000000ff

p0_label_291:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000daffcb1c, Mem[00000000201c0000] = 00ffa3b0, %asi = 80
	stba	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 1cffa3b0
!	Mem[0000000010001410] = ff3d473c, %l5 = 00000000000000ff
	swapa	[%i0+%o5]0x80,%l5	! %l5 = 00000000ff3d473c
!	Mem[0000000010001408] = 4fafa800, %l6 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l6	! %l6 = 000000004fafa800
!	Mem[0000000030041400] = 3785cc0d, %l7 = 0000000000000064
	swapa	[%i1+%g0]0x81,%l7	! %l7 = 000000003785cc0d
!	Mem[0000000030001408] = f1fa5543, %l3 = 0000000043ccfaf1
	ldstuba	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000043
!	Mem[0000000010001408] = 00000000, %l2 = 00000000daffcb1c
	ldstuba	[%i0+0x008]%asi,%l2	! %l2 = 0000000000000000
!	%f14 = 00006a7f, Mem[0000000010041410] = 7f6a0000
	sta	%f14,[%i1+%o5]0x88	! Mem[0000000010041410] = 00006a7f
!	Mem[0000000010101400] = 3785cc0d, %l7 = 000000003785cc0d
	swapa	[%i4+%g0]0x80,%l7	! %l7 = 000000003785cc0d
!	%l2 = 00000000, %l3 = 00000043, Mem[0000000010041410] = 7f6a0000 000000df
	stda	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000 00000043
!	%f26 = 0000004b 000000ff, Mem[0000000010041408] = 2c856213 190000ff
	stda	%f26,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000004b 000000ff

p0_label_292:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00000000, %l0 = 00000000000000ff
	lduwa	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0001] = 1cffa3b0, %l0 = 0000000000000000
	ldsb	[%o0+0x001],%l0		! %l0 = ffffffffffffffff
!	Mem[00000000100c1400] = 00000000, %f22 = 6dd4dbc2
	lda	[%i3+%g0]0x88,%f22	! %f22 = 00000000
!	%f3  = ff000019, %f31 = ffffffff, %f23 = 79a7ab8b
	fdivs	%f3 ,%f31,%f23		! %f23 = ffffffff
!	Mem[0000000010141400] = 00000000 43ccfaf1, %l0 = ffffffff, %l1 = 00ffffff
	ldda	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000 0000000043ccfaf1
!	Mem[00000000211c0000] = 00ff5a40, %l7 = 000000003785cc0d
	ldsh	[%o2+%g0],%l7		! %l7 = 00000000000000ff
!	%f20 = cc000000, %f20 = cc000000
	fcmpes	%fcc2,%f20,%f20		! %fcc2 = 0
!	Code Fragment 3, seed = 525912
p0_fragment_25:
!	%l0 = 0000000000000000
	setx	0x23a09d8a97451d66,%g7,%l0 ! %l0 = 23a09d8a97451d66
!	%l1 = 0000000043ccfaf1
	setx	0xd434eccc30934d91,%g7,%l1 ! %l1 = d434eccc30934d91
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 23a09d8a97451d66
	setx	0x723a6b4f486e21cc,%g7,%l0 ! %l0 = 723a6b4f486e21cc
!	%l1 = d434eccc30934d91
	setx	0x3e0c322811119d17,%g7,%l1 ! %l1 = 3e0c322811119d17
p0_fragment_25_end:
!	%l4 = 0000000000000073, %l6 = 000000004fafa800, %l6 = 000000004fafa800
	xor	%l4,%l6,%l6		! %l6 = 000000004fafa873
!	Mem[0000000030041410] = 00ffffff, %l2 = 0000000000000000
	ldsha	[%i1+%o5]0x89,%l2	! %l2 = ffffffffffffffff

p0_label_293:
!	Starting 10 instruction Store Burst
!	%f2  = a4000000, Mem[0000000010141400] = 00000000
	sta	%f2 ,[%i5+%g0]0x88	! Mem[0000000010141400] = a4000000
!	Mem[000000001004143c] = ff000000, %l1 = 0000000011119d17, %asi = 80
	swapa	[%i1+0x03c]%asi,%l1	! %l1 = 00000000ff000000
!	%f3  = ff000019, Mem[0000000010081400] = d46d0000
	sta	%f3 ,[%i2+%g0]0x80	! Mem[0000000010081400] = ff000019
!	%l3 = 0000000000000043, Mem[0000000010141400] = a4000000
	stha	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = a4000043
!	%f2  = a4000000 ff000019, Mem[0000000010181400] = 7320b064 000000a4
	stda	%f2 ,[%i6+%g0]0x88	! Mem[0000000010181400] = a4000000 ff000019
!	Mem[00000000100c1400] = 00000000, %l2 = 00000000ffffffff
	swapa	[%i3+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1418] = 43ccfaf12a31de8c, %l6 = 000000004fafa873, %l6 = 000000004fafa873
	add	%i3,0x18,%g1
	casxa	[%g1]0x80,%l6,%l6	! %l6 = 43ccfaf12a31de8c
!	%l4 = 0000000000000073, Mem[0000000010141408] = 00000000
	stba	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 73000000
!	%l5 = 00000000ff3d473c, Mem[0000000010081410] = 552d8bea
	stba	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 552d8b3c
!	%l2 = 0000000000000000, Mem[000000001008141f] = 00000000
	stb	%l2,[%i2+0x01f]		! Mem[000000001008141c] = 00000000

p0_label_294:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = a4000000, %l2 = 0000000000000000
	lduwa	[%i2+%g0]0x89,%l2	! %l2 = 00000000a4000000
!	Mem[00000000100c1408] = 000000ff, %l4 = 0000000000000073
	lduha	[%i3+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = 73000000, %l2 = 00000000a4000000
	lduwa	[%i6+%o4]0x88,%l2	! %l2 = 0000000073000000
!	Mem[0000000010041434] = 64b02073, %l5 = 00000000ff3d473c, %asi = 80
	ldsba	[%i1+0x034]%asi,%l5	! %l5 = 0000000000000064
!	Mem[0000000030101400] = ff0000ff, %l0 = 723a6b4f486e21cc
	ldsha	[%i4+%g0]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010101408] = ff0000ff, %l7 = 00000000000000ff
	lduba	[%i4+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081428] = ffffff00b7ff22ff, %f18 = 00000000 ff0000ff, %asi = 80
	ldda	[%i2+0x028]%asi,%f18	! %f18 = ffffff00 b7ff22ff
!	Mem[0000000030081400] = a4000000, %l6 = 43ccfaf12a31de8c
	lduha	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000021800040] = 0000eaa0, %l3 = 0000000000000043
	ldub	[%o3+0x040],%l3		! %l3 = 0000000000000000
!	Mem[0000000010101400] = 3785cc0d, %l4 = 0000000000000000
	lduba	[%i4+%g0]0x80,%l4	! %l4 = 0000000000000037

p0_label_295:
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffffff00, Mem[0000000020800040] = ccff4c10, %asi = 80
	stha	%l0,[%o1+0x040]%asi	! Mem[0000000020800040] = ff004c10
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000030081400] = a4000000 ffffff01
	stda	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000 000000ff
!	%l0 = ffffffffffffff00, Mem[0000000030141408] = 000fffffea8b2d55
	stxa	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffffffffffff00
!	Mem[0000000010081408] = da9f43c3, %l4 = 0000000000000037
	ldstuba	[%i2+%o4]0x88,%l4	! %l4 = 00000000000000c3
!	Mem[0000000030141400] = 55c4787f, %l0 = 00000000ffffff00
	swapa	[%i5+%g0]0x81,%l0	! %l0 = 0000000055c4787f
!	Mem[0000000030081410] = 000000ff, %l0 = 0000000055c4787f
	ldstuba	[%i2+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%f11 = 00a8af4f, Mem[0000000010001430] = 000000ff
	sta	%f11,[%i0+0x030]%asi	! Mem[0000000010001430] = 00a8af4f
!	%l6 = 0000000000000000, %l5 = 0000000000000064, %l1 = 00000000ff000000
	udivx	%l6,%l5,%l1		! %l1 = 0000000000000000
!	%f18 = ffffff00 b7ff22ff, %l5 = 0000000000000064
!	Mem[0000000030181418] = 2bf75871e23be9b3
	add	%i6,0x018,%g1
	stda	%f18,[%g1+%l5]ASI_PST16_S ! Mem[0000000030181418] = 2bf7ff00e23be9b3
!	Mem[0000000030041400] = 00000064, %l7 = 00000000000000ff
	swapa	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000064

p0_label_296:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001420] = f1facc43, %l6 = 0000000000000000, %asi = 80
	ldsha	[%i0+0x020]%asi,%l6	! %l6 = fffffffffffff1fa
!	Mem[00000000100c1430] = 00000000 ff000000, %l0 = 000000ff, %l1 = 00000000
	ldd	[%i3+0x030],%l0		! %l0 = 0000000000000000 00000000ff000000
!	Mem[0000000030141410] = 000000ff, %l5 = 0000000000000064
	lduba	[%i5+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101410] = 000000ff, %l1 = 00000000ff000000
	ldsha	[%i4+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001400] = 0000000064b020ff, %f6  = ea8b2d55 ffffff00
	ldda	[%i0+%g0]0x89,%f6 	! %f6  = 00000000 64b020ff
!	Mem[0000000010041400] = 552d8bea, %l0 = 0000000000000000
	lduba	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000055
!	Mem[0000000030101410] = 0000004b 000000ff, %l4 = 000000c3, %l5 = 00000000
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 00000000000000ff 000000000000004b
!	Mem[0000000010001408] = ff00000000000000, %f14 = 00006a7f 7fffffff
	ldd	[%i0+%o4],%f14		! %f14 = ff000000 00000000
!	Mem[0000000010001410] = 000000ff, %l6 = fffffffffffff1fa
	ldswa	[%i0+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001400] = 79a7ab8b, %l7 = 0000000000000064
	lduba	[%i0+%g0]0x88,%l7	! %l7 = 000000000000008b

p0_label_297:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = ff00000000000000, %l0 = 0000000000000055, %l3 = 0000000000000000
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l0,%l3	! %l3 = ff00000000000000
!	%l7 = 000000000000008b, Mem[00000000201c0000] = 1cffa3b0
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 008ba3b0
!	Mem[0000000010081400] = 190000ff, %l6 = 00000000000000ff
	ldstuba	[%i2+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081410] = 552d8b3c, %l4 = 00000000000000ff
	swapa	[%i2+%o5]0x88,%l4	! %l4 = 00000000552d8b3c
!	%l7 = 000000000000008b, Mem[0000000020800000] = 0000b9e0
	sth	%l7,[%o1+%g0]		! Mem[0000000020800000] = 008bb9e0
!	%l6 = 00000000000000ff, Mem[0000000010041400] = 552d8bea000043cc, %asi = 80
	stxa	%l6,[%i1+0x000]%asi	! Mem[0000000010041400] = 00000000000000ff
!	Mem[00000000100c1414] = da9f434b, %l0 = 0000000000000055
	swap	[%i3+0x014],%l0		! %l0 = 00000000da9f434b
!	Mem[00000000100c1410] = 12000000, %l6 = 00000000000000ff
	swapa	[%i3+%o5]0x80,%l6	! %l6 = 0000000012000000
!	Mem[000000001000143c] = f1ffcc43, %l0 = da9f434b, %l1 = 000000ff
	add	%i0,0x3c,%g1
	casa	[%g1]0x80,%l0,%l1	! %l1 = 00000000f1ffcc43
!	%l3 = ff00000000000000, Mem[0000000021800001] = ff76e470
	stb	%l3,[%o3+0x001]		! Mem[0000000021800000] = ff00e470

p0_label_298:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000000, %l4 = 00000000552d8b3c
	lduwa	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000218001c0] = 8a803bc0, %l1 = 00000000f1ffcc43, %asi = 80
	lduha	[%o3+0x1c0]%asi,%l1	! %l1 = 0000000000008a80
!	Mem[0000000030101410] = 0000004b000000ff, %l4 = 0000000000000000
	ldxa	[%i4+%o5]0x89,%l4	! %l4 = 0000004b000000ff
!	Mem[00000000100c1410] = 000000ff, %l6 = 0000000012000000
	ldsha	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = 6dd4dbc2ea8b2d55, %f18 = ffffff00 b7ff22ff
	ldda	[%i3+%o4]0x81,%f18	! %f18 = 6dd4dbc2 ea8b2d55
!	Mem[0000000010101408] = ff0000ff 00000000, %l6 = 00000000, %l7 = 0000008b, %asi = 80
	ldda	[%i4+0x008]%asi,%l6	! %l6 = 00000000ff0000ff 0000000000000000
!	Mem[0000000010041414] = 00000043, %f9  = f871b618
	lda	[%i1+0x014]%asi,%f9 	! %f9 = 00000043
!	Mem[0000000010041428] = 66228fc300ffaf4f, %l7 = 0000000000000000
	ldx	[%i1+0x028],%l7		! %l7 = 66228fc300ffaf4f
!	Mem[0000000010081400] = ff000019, %l0 = 00000000da9f434b
	lduwa	[%i2+%g0]0x80,%l0	! %l0 = 00000000ff000019
!	Mem[0000000030001408] = f1fa55ff, %l7 = 66228fc300ffaf4f
	ldsba	[%i0+%o4]0x89,%l7	! %l7 = ffffffffffffffff

p0_label_299:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ff0000ff, Mem[0000000010001408] = ff000000
	stw	%l6,[%i0+%o4]		! Mem[0000000010001408] = ff0000ff
!	Mem[0000000010101408] = ff0000ff, %l7 = ffffffffffffffff
	ldstuba	[%i4+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%l3 = ff00000000000000, Mem[00000000211c0000] = 00ff5a40
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 00005a40
!	Mem[0000000030081410] = ff000000, %l6 = 00000000ff0000ff
	swapa	[%i2+%o5]0x81,%l6	! %l6 = 00000000ff000000
!	%l2 = 0000000073000000, Mem[0000000030081410] = ff0000ff
	stwa	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 73000000
!	Mem[0000000010181438] = ffffffff, %l5 = 0000004b, %l2 = 73000000
	add	%i6,0x38,%g1
	casa	[%g1]0x80,%l5,%l2	! %l2 = 00000000ffffffff
!	%l0 = 00000000ff000019, Mem[0000000020800040] = ff004c10
	sth	%l0,[%o1+0x040]		! Mem[0000000020800040] = 00194c10
!	Mem[000000001000141e] = ff000000, %l6 = 00000000ff000000
	ldsh	[%i0+0x01e],%l6		! %l6 = 0000000000000000
!	%f18 = 6dd4dbc2, Mem[0000000030001410] = 0000001c
	sta	%f18,[%i0+%o5]0x89	! Mem[0000000030001410] = 6dd4dbc2
!	%f3  = ff000019, Mem[0000000010041410] = 00000000
	sta	%f3 ,[%i1+%o5]0x80	! Mem[0000000010041410] = ff000019

p0_label_300:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 190000ff, %l0 = 00000000ff000019
	lduwa	[%i6+%g0]0x80,%l0	! %l0 = 00000000190000ff
!	Mem[0000000010141400] = 430000a443ccfaf1, %l5 = 000000000000004b
	ldxa	[%i5+%g0]0x80,%l5	! %l5 = 430000a443ccfaf1
!	Mem[0000000030101400] = ff0000ff, %l2 = 00000000ffffffff
	lduba	[%i4+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181400] = 00008bff, %l7 = 00000000000000ff
	ldsha	[%i6+%g0]0x89,%l7	! %l7 = ffffffffffff8bff
!	Mem[0000000030101400] = ff0000ff, %l7 = ffffffffffff8bff
	ldswa	[%i4+%g0]0x89,%l7	! %l7 = ffffffffff0000ff
!	Mem[00000000100c1408] = 000000ffff000000, %f22 = 00000000 ffffffff
	ldda	[%i3+%o4]0x88,%f22	! %f22 = 000000ff ff000000
!	Mem[0000000010041408] = ff000000, %f31 = ffffffff
	lda	[%i1+%o4]0x80,%f31	! %f31 = ff000000
!	%f18 = 6dd4dbc2 ea8b2d55, Mem[0000000030001410] = 6dd4dbc2 0000004c
	stda	%f18,[%i0+%o5]0x89	! Mem[0000000030001410] = 6dd4dbc2 ea8b2d55
!	Mem[0000000010101438] = ffffffff, %l5 = 430000a443ccfaf1, %asi = 80
	ldswa	[%i4+0x038]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000100c1410] = ff000000, %l2 = 00000000000000ff
	ldsha	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000000

p0_label_301:
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffffff, Mem[0000000021800040] = 0000eaa0, %asi = 80
	stba	%l5,[%o3+0x040]%asi	! Mem[0000000021800040] = ff00eaa0
!	%f23 = ff000000, Mem[0000000010181410] = 00000000
	sta	%f23,[%i6+%o5]0x80	! Mem[0000000010181410] = ff000000
!	Mem[0000000010081410] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i2+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010001408] = ff0000ff 00000000
	stda	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000ff 00000000
!	Mem[0000000020800040] = 00194c10, %l0 = 00000000190000ff
	ldstub	[%o1+0x040],%l0		! %l0 = 0000000000000000
!	%f2  = a4000000 ff000019, %l1 = 0000000000008a80
!	Mem[0000000030181428] = ffc4787f51d2834c
	add	%i6,0x028,%g1
	stda	%f2,[%g1+%l1]ASI_PST16_S ! Mem[0000000030181428] = ffc4787f51d2834c
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000030141408] = ffffffff 00ffffff
	stda	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000ff 00000000
!	%l6 = 0000000000000000, %l4 = 0000004b000000ff, %l3 = ff00000000000000
	add	%l6,%l4,%l3		! %l3 = 0000004b000000ff
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000030001400] = ff20b064 00000000
	stda	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000ff 000000ff
!	%l3 = 0000004b000000ff, Mem[00000000300c1410] = df0000007f6a0000
	stxa	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000004b000000ff

p0_label_302:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00000000, %l7 = ffffffffff0000ff
	lduwa	[%i5+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000201c0001] = 008ba3b0, %l3 = 0000004b000000ff
	ldsb	[%o0+0x001],%l3		! %l3 = ffffffffffffff8b
!	Mem[0000000030041410] = ffffff00, %l2 = 00000000000000ff
	lduba	[%i1+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1400] = ffffffff 000000ff, %l2 = 000000ff, %l3 = ffffff8b
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 00000000ffffffff 00000000000000ff
!	Mem[0000000030141400] = 4c83d25100ffffff, %f18 = 6dd4dbc2 ea8b2d55
	ldda	[%i5+%g0]0x89,%f18	! %f18 = 4c83d251 00ffffff
!	Mem[0000000010041400] = 00000000, %f23 = ff000000
	lda	[%i1+%g0]0x88,%f23	! %f23 = 00000000
!	Mem[00000000100c1410] = 000000ff00000055, %l2 = 00000000ffffffff
	ldxa	[%i3+%o5]0x80,%l2	! %l2 = 000000ff00000055
!	Mem[0000000010181400] = 190000ff, %l5 = ffffffffffffffff
	lduwa	[%i6+%g0]0x80,%l5	! %l5 = 00000000190000ff
!	Mem[0000000010041400] = ff00000000000000, %l5 = 00000000190000ff
	ldxa	[%i1+%g0]0x88,%l5	! %l5 = ff00000000000000
!	Mem[0000000010041408] = ff000000, %l4 = 0000004b000000ff
	ldswa	[%i1+%o4]0x80,%l4	! %l4 = ffffffffff000000

p0_label_303:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000030181410] = 00000000000000a4
	stxa	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000000000000000
!	Mem[0000000010041430] = 65e0a712, %l4 = 00000000ff000000, %asi = 80
	swapa	[%i1+0x030]%asi,%l4	! %l4 = 0000000065e0a712
!	%f10 = 66228fc3 00a8af4f, Mem[0000000010041408] = ff000000 4b000000
	std	%f10,[%i1+%o4]		! Mem[0000000010041408] = 66228fc3 00a8af4f
!	%f20 = cc000000 ffffffff, %l2 = 000000ff00000055
!	Mem[0000000030081418] = 43f05d0f3785434b
	add	%i2,0x018,%g1
	stda	%f20,[%g1+%l2]ASI_PST32_S ! Mem[0000000030081418] = 43f05d0fffffffff
!	%l4 = 0000000065e0a712, Mem[00000000100c1408] = ff000000
	stha	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff00a712
!	Mem[00000000201c0000] = 008ba3b0, %l7 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l7	! %l7 = 0000000000000000
!	%l3 = 00000000000000ff, Mem[00000000201c0000] = ff8ba3b0, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ffa3b0
!	Mem[00000000211c0000] = 00005a40, %l5 = ff00000000000000
	ldstub	[%o2+%g0],%l5		! %l5 = 0000000000000000
!	%l3 = 00000000000000ff, Mem[0000000010001410] = 000000ffa4000000, %asi = 80
	stxa	%l3,[%i0+0x010]%asi	! Mem[0000000010001410] = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000021800140] = 4bc5db60
	sth	%l0,[%o3+0x140]		! Mem[0000000021800140] = 0000db60

p0_label_304:
!	Starting 10 instruction Load Burst
!	Mem[000000001018142c] = 29010000, %l5 = 0000000000000000, %asi = 80
	ldsha	[%i6+0x02c]%asi,%l5	! %l5 = 0000000000002901
!	Mem[0000000010001408] = ff000000, %f15 = 00000000
	lda	[%i0+%o4]0x88,%f15	! %f15 = ff000000
!	Mem[0000000010141400] = a4000043, %l3 = 00000000000000ff
	lduba	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000043
!	Mem[0000000030041408] = 0000000000000000, %l5 = 0000000000002901
	ldxa	[%i1+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1438] = 00000000, %l4 = 0000000065e0a712
	ldsw	[%i3+0x038],%l4		! %l4 = 0000000000000000
!	Mem[0000000010101408] = ff0000ff00000000, %f4  = 00006a7f 000000df
	ldda	[%i4+%o4]0x80,%f4 	! %f4  = ff0000ff 00000000
!	Mem[0000000010181420] = feffffff, %f23 = 00000000
	ld	[%i6+0x020],%f23	! %f23 = feffffff
!	Mem[0000000010081410] = 000000ff, %l0 = 0000000000000000
	ldsba	[%i2+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030181400] = ffccfaf1 00008bff, %l0 = ffffffff, %l1 = 00008a80
	ldda	[%i6+%g0]0x89,%l0	! %l0 = 0000000000008bff 00000000ffccfaf1
!	%l2 = 000000ff00000055, immd = 000000e3, %y  = cb22a9ab
	udiv	%l2,0x0e3,%l4		! %l4 = 00000000ffffffff
	mov	%l0,%y			! %y = 00008bff

p0_label_305:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010081420] = 43ccfaf1, %asi = 80
	stha	%l7,[%i2+0x020]%asi	! Mem[0000000010081420] = 0000faf1
!	%l4 = 00000000ffffffff, Mem[0000000030181410] = 00000000
	stba	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = ff000000
!	%l6 = 0000000000000000, Mem[00000000300c1408] = 6dd4dbc2
	stba	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00d4dbc2
!	%l2 = 00000055, %l3 = 00000043, Mem[0000000010101430] = ff8b0000 f1faccff, %asi = 80
	stda	%l2,[%i4+0x030]%asi	! Mem[0000000010101430] = 00000055 00000043
!	%l0 = 00008bff, %l1 = ffccfaf1, Mem[0000000030181400] = ff8b0000 f1faccff
	stda	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 00008bff ffccfaf1
!	%l5 = 0000000000000000, Mem[0000000030041410] = ffffff00
	stba	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = 00ffff00
!	%l6 = 0000000000000000, Mem[00000000300c1400] = 00000000
	stha	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	%l2 = 000000ff00000055, Mem[0000000030001410] = 552d8bea
	stha	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 00558bea
!	%l2 = 000000ff00000055, Mem[00000000300c1400] = 4300000000000000
	stxa	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ff00000055
!	%l4 = 00000000ffffffff, Mem[0000000010001404] = c2dbd46d
	stb	%l4,[%i0+0x004]		! Mem[0000000010001404] = ffdbd46d

p0_label_306:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = c38f2266, %l4 = 00000000ffffffff
	ldsba	[%i1+%o4]0x88,%l4	! %l4 = 0000000000000066
!	Code Fragment 3, seed = 704647
p0_fragment_26:
!	%l0 = 0000000000008bff
	setx	0x57be71531e0baaee,%g7,%l0 ! %l0 = 57be71531e0baaee
!	%l1 = 00000000ffccfaf1
	setx	0x814c85ca69c90499,%g7,%l1 ! %l1 = 814c85ca69c90499
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 57be71531e0baaee
	setx	0x1e713b58b748ca54,%g7,%l0 ! %l0 = 1e713b58b748ca54
!	%l1 = 814c85ca69c90499
	setx	0x98d1d3c35c7c7f1f,%g7,%l1 ! %l1 = 98d1d3c35c7c7f1f
p0_fragment_26_end:
!	Mem[0000000030041408] = 00000000, %l0 = 1e713b58b748ca54
	lduba	[%i1+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1410] = ff000000, %l1 = 98d1d3c35c7c7f1f
	ldswa	[%i3+%o5]0x88,%l1	! %l1 = ffffffffff000000
!	Mem[00000000300c1410] = 4b000000, %l5 = 0000000000000000
	lduba	[%i3+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1400] = ffffffff000000ff, %f0  = ffffff01 a4000000
	ldda	[%i3+%g0]0x80,%f0 	! %f0  = ffffffff 000000ff
!	Mem[0000000010141400] = f1facc43 a4000043, %l2 = 00000055, %l3 = 00000043
	ldda	[%i5+%g0]0x88,%l2	! %l2 = 00000000a4000043 00000000f1facc43
!	Mem[0000000010141410] = 00000000, %l6 = 0000000000000000
	lduwa	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = ff0000ff, %l3 = 00000000f1facc43
	lduwa	[%i4+%g0]0x89,%l3	! %l3 = 00000000ff0000ff
!	Mem[0000000010041400] = 00000000, %l6 = 0000000000000000
	lduwa	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000

p0_label_307:
!	Starting 10 instruction Store Burst
!	%f6  = 00000000 64b020ff, Mem[0000000030141410] = 000000ff ff000019
	stda	%f6 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 64b020ff
!	%l5 = 0000000000000000, Mem[00000000300c1410] = ff0000004b000000
	stxa	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000000000000000
!	%l4 = 0000000000000066, Mem[0000000010141408] = 73000000
	stwa	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000066
!	%l3 = 00000000ff0000ff, Mem[000000001000141a] = 00000024
	stb	%l3,[%i0+0x01a]		! Mem[0000000010001418] = 0000ff24
!	%f28 = ffccfaf1 00008bff, Mem[0000000030041408] = 00000000 00000000
	stda	%f28,[%i1+%o4]0x89	! Mem[0000000030041408] = ffccfaf1 00008bff
!	Mem[0000000010081400] = ff000019, %l4 = 0000000000000066
	swapa	[%i2+%g0]0x80,%l4	! %l4 = 00000000ff000019
!	%l4 = 00000000ff000019, Mem[0000000030081410] = 01ffffff73000000
	stxa	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000ff000019
!	%f14 = ff000000 ff000000, %l0 = 0000000000000000
!	Mem[0000000010101428] = ff0000004b000000
	add	%i4,0x028,%g1
	stda	%f14,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010101428] = ff0000004b000000
!	Mem[0000000030041410] = 00ffff00, %l3 = 00000000ff0000ff
	ldstuba	[%i1+%o5]0x89,%l3	! %l3 = 0000000000000000
!	%f3  = ff000019, Mem[0000000010181400] = 190000ff
	sta	%f3 ,[%i6+%g0]0x80	! Mem[0000000010181400] = ff000019

p0_label_308:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 4fafa800c38f2266, %l4 = 00000000ff000019
	ldxa	[%i1+%o4]0x88,%l4	! %l4 = 4fafa800c38f2266
!	Mem[00000000201c0000] = 00ffa3b0, %l4 = 4fafa800c38f2266, %asi = 80
	lduha	[%o0+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041400] = 000000ff64b02073, %f0  = ffffffff 000000ff
	ldda	[%i1+%g0]0x81,%f0 	! %f0  = 000000ff 64b02073
!	%f29 = 00008bff, %f28 = ffccfaf1, %f13 = 64b02073
	fmuls	%f29,%f28,%f13		! %f13 = ffccfaf1
!	Mem[0000000010181400] = ff000019, %l4 = 00000000000000ff
	lduha	[%i6+%g0]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030041408] = 00008bff, %l5 = 0000000000000000
	ldsha	[%i1+%o4]0x89,%l5	! %l5 = ffffffffffff8bff
!	Mem[0000000030101408] = 000000ff, %l2 = 00000000a4000043
	lduha	[%i4+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = 00558bea, %l6 = 0000000000000000
	ldsha	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000055
!	Mem[00000000100c1408] = ff00a712, %l2 = 0000000000000000
	lduwa	[%i3+%o4]0x88,%l2	! %l2 = 00000000ff00a712
!	Mem[0000000010041436] = 64b02073, %l6 = 0000000000000055
	lduh	[%i1+0x036],%l6		! %l6 = 0000000000002073

p0_label_309:
!	Starting 10 instruction Store Burst
!	%f10 = 66228fc3 00a8af4f, Mem[0000000010041410] = 190000ff 43000000
	stda	%f10,[%i1+%o5]0x88	! Mem[0000000010041410] = 66228fc3 00a8af4f
!	%f24 = 00000000 ff000000, %l5 = ffffffffffff8bff
!	Mem[0000000030001408] = ff55faf100000000
	add	%i0,0x008,%g1
	stda	%f24,[%g1+%l5]ASI_PST8_S ! Mem[0000000030001408] = 00000000ff000000
!	%l7 = 0000000000000000, Mem[0000000010181408] = 73000000
	stba	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 73000000
!	%l5 = ffffffffffff8bff, Mem[0000000010181408] = 73000000
	stba	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = 730000ff
!	Mem[0000000010081430] = ffffffff, %l4 = 000000000000ff00
	swap	[%i2+0x030],%l4		! %l4 = 00000000ffffffff
!	%f16 = 7320b064 0dcc8537, Mem[0000000030101408] = ff000000 488a506f
	stda	%f16,[%i4+%o4]0x89	! Mem[0000000030101408] = 7320b064 0dcc8537
!	%f4  = ff0000ff, Mem[00000000100c1410] = ff000000
	sta	%f4 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff0000ff
!	%l5 = ffffffffffff8bff, Mem[0000000030001408] = 00000000
	stwa	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = ffff8bff
!	%l4 = 00000000ffffffff, Mem[0000000010041410] = 4fafa800
	stwa	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffffff
!	%l7 = 0000000000000000, Mem[0000000010101410] = ffffffff
	stba	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 00ffffff

p0_label_310:
!	Starting 10 instruction Load Burst
!	%l7 = 0000000000000000, immd = fffffffffffffc43, %l108 = 0000000000000004
	udivx	%l7,-0x3bd,%l4		! %l4 = 0000000000000000
!	Mem[0000000030181400] = 00008bff, %l6 = 0000000000002073
	lduba	[%i6+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1408] = 12a700ff, %l4 = 0000000000000000
	ldsha	[%i3+%o4]0x80,%l4	! %l4 = 00000000000012a7
!	Mem[000000001008142d] = b7ff22ff, %l5 = ffffffffffff8bff, %asi = 80
	ldsba	[%i2+0x02d]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[000000001014140c] = daffcb1c, %l2 = 00000000ff00a712, %asi = 80
	ldswa	[%i5+0x00c]%asi,%l2	! %l2 = ffffffffdaffcb1c
!	Mem[00000000300c1408] = c2dbd400, %l2 = ffffffffdaffcb1c
	lduba	[%i3+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101410] = 00ffffff 000000cc, %l0 = 00000000, %l1 = ff000000, %asi = 80
	ldda	[%i4+0x010]%asi,%l0	! %l0 = 0000000000ffffff 00000000000000cc
!	Mem[000000001000142c] = 00ff0019, %l1 = 00000000000000cc
	lduw	[%i0+0x02c],%l1		! %l1 = 0000000000ff0019
!	Mem[0000000030181400] = ff8b0000, %l7 = 0000000000000000
	ldsha	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101408] = 3785cc0d64b02073, %l4 = 00000000000012a7
	ldxa	[%i4+%o4]0x81,%l4	! %l4 = 3785cc0d64b02073

p0_label_311:
!	Starting 10 instruction Store Burst
!	%f13 = ffccfaf1, Mem[0000000030181408] = 00000000
	sta	%f13,[%i6+%o4]0x89	! Mem[0000000030181408] = ffccfaf1
!	Mem[0000000030181408] = f1faccff, %l6 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l6	! %l6 = 00000000f1faccff
!	%f28 = ffccfaf1 00008bff, Mem[0000000010081408] = ff439fda 0f5df043
	stda	%f28,[%i2+%o4]0x80	! Mem[0000000010081408] = ffccfaf1 00008bff
!	%l6 = 00000000f1faccff, Mem[00000000100c1408] = ff00a712
	stwa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = f1faccff
!	Mem[0000000010101410] = 00ffffff, %l3 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1408] = 00d4dbc2, %l1 = 0000000000ff0019
	swapa	[%i3+%o4]0x81,%l1	! %l1 = 0000000000d4dbc2
!	Mem[0000000010001408] = 000000ff, %l0 = 0000000000ffffff
	swapa	[%i0+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000030141400] = 4c83d25100ffffff
	stxa	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000000000ff
!	Mem[0000000030141400] = ff000000, %l2 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[00000000100c1400] = ffffffff000000ff
	stx	%l0,[%i3+%g0]		! Mem[00000000100c1400] = 00000000000000ff

p0_label_312:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 0dcc8537, %f6  = 00000000
	lda	[%i4+%g0]0x88,%f6 	! %f6 = 0dcc8537
!	Mem[0000000010141400] = f1facc43a4000043, %l2 = 00000000000000ff
	ldxa	[%i5+%g0]0x88,%l2	! %l2 = f1facc43a4000043
!	Mem[0000000010041400] = 00000000 000000ff, %l4 = 64b02073, %l5 = ffffffff
	ldd	[%i1+%g0],%l4		! %l4 = 0000000000000000 00000000000000ff
!	Mem[0000000030101400] = ff0000ff, %l2 = f1facc43a4000043
	lduha	[%i4+%g0]0x81,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030141400] = 000000ff, %l1 = 0000000000d4dbc2
	lduwa	[%i5+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181430] = ff000000, %l4 = 0000000000000000, %asi = 80
	ldswa	[%i6+0x030]%asi,%l4	! %l4 = ffffffffff000000
!	Mem[0000000010081428] = ffffff00b7ff22ff, %f8  = 00000000 00000043
	ldd	[%i2+0x028],%f8 	! %f8  = ffffff00 b7ff22ff
!	%l5 = 00000000000000ff, Mem[0000000030101408] = 0dcc8537
	stha	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 0dcc00ff
!	Mem[000000001010141b] = cc000000, %l4 = ffffffffff000000, %asi = 80
	ldsba	[%i4+0x01b]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041408] = c38f2266, %l4 = 0000000000000000
	lduha	[%i1+%o4]0x88,%l4	! %l4 = 0000000000002266

p0_label_313:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[0000000010141420] = f1af3100c3222266
	stx	%l0,[%i5+0x020]		! Mem[0000000010141420] = 00000000000000ff
!	Mem[00000000211c0001] = ff005a40, %l7 = 0000000000000000
	ldstuba	[%o2+0x001]%asi,%l7	! %l7 = 0000000000000000
!	%l0 = 00000000000000ff, Mem[0000000030081400] = 00000000
	stha	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff
!	Mem[0000000010181410] = ff000000, %l4 = 0000000000002266
	ldstuba	[%i6+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000030081408] = 000000ff000000ff
	stxa	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000000000ff
!	%l2 = 000000000000ff00, Mem[0000000010081400] = 4b00000066000000
	stxa	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000000000ff00
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000030001400] = 000000ff 000000ff
	stda	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000ff 000000ff
!	%l2 = 000000000000ff00, Mem[0000000030181410] = ff000000
	stba	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	%f2  = a4000000, Mem[0000000030081400] = ff000000
	sta	%f2 ,[%i2+%g0]0x81	! Mem[0000000030081400] = a4000000
!	%f18 = 4c83d251, Mem[0000000010001410] = 00000000
	sta	%f18,[%i0+%o5]0x80	! Mem[0000000010001410] = 4c83d251

p0_label_314:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00558bea, %l6 = 00000000f1faccff
	ldsha	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000055
!	Mem[0000000030041410] = ffffff00, %l2 = 000000000000ff00
	ldsha	[%i1+%o5]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[000000001000140a] = 00ffffff, %l7 = 0000000000000000, %asi = 80
	lduha	[%i0+0x00a]%asi,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010141414] = f1facc43, %f14 = ff000000
	ld	[%i5+0x014],%f14	! %f14 = f1facc43
!	Mem[0000000010141418] = 20ef580a, %l5 = 00000000000000ff, %asi = 80
	lduha	[%i5+0x018]%asi,%l5	! %l5 = 00000000000020ef
!	Mem[0000000010041428] = 66228fc3, %f4  = ff0000ff
	ld	[%i1+0x028],%f4 	! %f4 = 66228fc3
!	Mem[0000000010181408] = ff000073, %l3 = 0000000000000000
	lduba	[%i6+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1400] = 00000000, %l0 = 00000000000000ff
	ldswa	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800040] = ff194c10, %l0 = 0000000000000000, %asi = 80
	ldsha	[%o1+0x040]%asi,%l0	! %l0 = ffffffffffffff19
!	Mem[0000000010001420] = f1facc43, %f15 = ff000000
	ld	[%i0+0x020],%f15	! %f15 = f1facc43

p0_label_315:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 000000ff, %l0 = ffffffffffffff19
	ldstuba	[%i2+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	%f10 = 66228fc3 00a8af4f, Mem[0000000010101420] = 000000ff 00000000, %asi = 80
	stda	%f10,[%i4+0x020]%asi	! Mem[0000000010101420] = 66228fc3 00a8af4f
!	%l6 = 0000000000000055, Mem[0000000030081400] = a4000000
	stwa	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000055
!	Mem[0000000030141408] = ff000000, %l4 = 00000000000000ff
	ldstuba	[%i5+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181400] = 190000ff, %l1 = 00000000000000ff
	swapa	[%i6+%g0]0x88,%l1	! %l1 = 00000000190000ff
!	%l3 = 00000000000000ff, Mem[0000000030041400] = ff000000
	stha	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = ff0000ff
!	Mem[0000000010041434] = 64b02073, %l1 = 190000ff, %l0 = 000000ff
	add	%i1,0x34,%g1
	casa	[%g1]0x80,%l1,%l0	! %l0 = 0000000064b02073
!	Mem[00000000201c0000] = 00ffa3b0, %l1 = 00000000190000ff
	ldstub	[%o0+%g0],%l1		! %l1 = 0000000000000000
!	Mem[0000000010181400] = ff000000, %l7 = 000000000000ffff
	ldstuba	[%i6+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	%f3  = ff000019, Mem[0000000010001400] = 79a7ab8b
	sta	%f3 ,[%i0+%g0]0x88	! Mem[0000000010001400] = ff000019

p0_label_316:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000730000ff, %l5 = 00000000000020ef
	ldxa	[%i6+%o4]0x88,%l5	! %l5 = 00000000730000ff
!	Mem[0000000030101410] = 0000004b000000ff, %f26 = 0000004b 000000ff
	ldda	[%i4+%o5]0x89,%f26	! %f26 = 0000004b 000000ff
!	Code Fragment 4, seed = 156079
p0_fragment_27:
!	%l0 = 0000000064b02073
	setx	0x47aaade2188049ae,%g7,%l0 ! %l0 = 47aaade2188049ae
!	%l1 = 0000000000000000
	setx	0x0faa8490ed926759,%g7,%l1 ! %l1 = 0faa8490ed926759
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 47aaade2188049ae
	setx	0x356b647ab69bb114,%g7,%l0 ! %l0 = 356b647ab69bb114
!	%l1 = 0faa8490ed926759
	setx	0x28c3dab5e271a9df,%g7,%l1 ! %l1 = 28c3dab5e271a9df
p0_fragment_27_end:
!	Mem[0000000030041400] = ff0000ff, %f9  = b7ff22ff
	lda	[%i1+%g0]0x89,%f9 	! %f9 = ff0000ff
!	%f14 = f1facc43 f1facc43, %f29 = 00008bff
	fxtos	%f14,%f29		! %f29 = dd60533c
!	Mem[0000000010001410] = 4c83d251 000000ff, %l6 = 00000055, %l7 = 000000ff
	ldd	[%i0+%o5],%l6		! %l6 = 000000004c83d251 00000000000000ff
!	Mem[0000000030141400] = 000000ff, %l7 = 00000000000000ff
	lduba	[%i5+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1400] = 00000000, %l7 = 00000000000000ff
	lduha	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101408] = ff0000ff 00000000, %l6 = 4c83d251, %l7 = 00000000
	ldd	[%i4+%o4],%l6		! %l6 = 00000000ff0000ff 0000000000000000
!	Mem[0000000030181408] = 00000000, %f13 = ffccfaf1
	lda	[%i6+%o4]0x89,%f13	! %f13 = 00000000

p0_label_317:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101418] = cc0000003785cc0d, %l1 = 28c3dab5e271a9df, %l0 = 356b647ab69bb114
	add	%i4,0x18,%g1
	casxa	[%g1]0x80,%l1,%l0	! %l0 = cc0000003785cc0d
!	%l1 = 28c3dab5e271a9df, Mem[00000000100c1400] = 00000000
	stha	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = a9df0000
!	Mem[0000000030141408] = 000000ff, %l3 = 00000000000000ff
	ldstuba	[%i5+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[0000000010041400] = 00000000
	stha	%l3,[%i1+%g0]0x80	! Mem[0000000010041400] = 00ff0000
!	Mem[00000000300c1410] = 00000000, %l3 = 00000000000000ff
	swapa	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000000
!	%f24 = 00000000, Mem[0000000010181400] = ff000000
	sta	%f24,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	Mem[0000000030001408] = ffff8bff, %l4 = 00000000000000ff
	swapa	[%i0+%o4]0x81,%l4	! %l4 = 00000000ffff8bff
!	%l6 = 00000000ff0000ff, Mem[0000000010001408] = 00ffffff00000000
	stxa	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000ff0000ff
!	%l5 = 00000000730000ff, Mem[0000000010101430] = 00000055
	sth	%l5,[%i4+0x030]		! Mem[0000000010101430] = 00ff0055
!	Mem[0000000030141408] = 000000ff, %l2 = 00000000ffffffff
	swapa	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000ff

p0_label_318:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001428] = da9f434b00ff0019, %l3 = 0000000000000000, %asi = 80
	ldxa	[%i0+0x028]%asi,%l3	! %l3 = da9f434b00ff0019
!	Mem[0000000010001416] = 000000ff, %l7 = 0000000000000000
	lduh	[%i0+0x016],%l7		! %l7 = 00000000000000ff
!	Mem[00000000100c1410] = ff0000ff, %l6 = 00000000ff0000ff
	lduba	[%i3+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181418] = 65e0a712d72bd82d, %f12 = 65e0a712 00000000, %asi = 80
	ldda	[%i6+0x018]%asi,%f12	! %f12 = 65e0a712 d72bd82d
!	Mem[0000000030181410] = 00000000, %f30 = 0000001c
	lda	[%i6+%o5]0x81,%f30	! %f30 = 00000000
!	Mem[0000000030181408] = 00000000c2dbd46d, %f28 = ffccfaf1 dd60533c
	ldda	[%i6+%o4]0x81,%f28	! %f28 = 00000000 c2dbd46d
!	Mem[0000000030041408] = 00008bff, %l0 = cc0000003785cc0d
	ldsba	[%i1+%o4]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030081400] = 00000055 ff000000, %l0 = ffffffff, %l1 = e271a9df
	ldda	[%i2+%g0]0x81,%l0	! %l0 = 0000000000000055 00000000ff000000
!	Mem[0000000010081400] = 00ff0000, %l2 = 00000000000000ff
	lduwa	[%i2+%g0]0x80,%l2	! %l2 = 0000000000ff0000
!	Mem[00000000300c1410] = ff000000, %l1 = 00000000ff000000
	ldsba	[%i3+%o5]0x89,%l1	! %l1 = 0000000000000000

p0_label_319:
!	Starting 10 instruction Store Burst
!	%f12 = 65e0a712 d72bd82d, Mem[00000000300c1410] = ff000000 00000000
	stda	%f12,[%i3+%o5]0x89	! Mem[00000000300c1410] = 65e0a712 d72bd82d
!	%l5 = 00000000730000ff, Mem[0000000030081400] = 00000055
	stba	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = ff000055
!	Mem[0000000010141400] = a4000043, %l0 = 0000000000000055
	swapa	[%i5+%g0]0x88,%l0	! %l0 = 00000000a4000043
!	%l7 = 00000000000000ff, Mem[0000000030001408] = ff000000
	stha	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = ff0000ff
!	Mem[0000000030101410] = 000000ff, %l1 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%f6  = 0dcc8537 64b020ff, %l7 = 00000000000000ff
!	Mem[0000000030001410] = 00558beac2dbd46d
	add	%i0,0x010,%g1
	stda	%f6,[%g1+%l7]ASI_PST8_S ! Mem[0000000030001410] = 0dcc853764b020ff
!	%l6 = 00000000000000ff, Mem[0000000030081410] = 190000ff
	stha	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 00ff00ff
!	%f0  = 000000ff 64b02073, Mem[0000000030141410] = 00000000 ff20b064
	stda	%f0 ,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000ff 64b02073
!	%f28 = 00000000 c2dbd46d, %l5 = 00000000730000ff
!	Mem[0000000010001420] = f1facc43df2c9795
	add	%i0,0x020,%g1
	stda	%f28,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010001420] = 6dd4dbc200000000
!	Mem[000000001014142c] = ff000000, %l3 = da9f434b00ff0019
	ldsw	[%i5+0x02c],%l3		! %l3 = ffffffffff000000

p0_label_320:
!	Starting 10 instruction Load Burst
!	%l3 = ffffffffff000000, %l3 = ffffffffff000000, %l4 = 00000000ffff8bff
	or	%l3,%l3,%l4		! %l4 = ffffffffff000000
!	Mem[00000000100c1400] = 0000dfa9, %l2 = 0000000000ff0000
	lduwa	[%i3+%g0]0x88,%l2	! %l2 = 000000000000dfa9
!	Mem[0000000010001400] = ff000019, %l1 = 00000000000000ff
	lduha	[%i0+%g0]0x88,%l1	! %l1 = 0000000000000019
!	Mem[00000000201c0000] = ffffa3b0, %l6 = 00000000000000ff
	ldsh	[%o0+%g0],%l6		! %l6 = ffffffffffffffff
!	Mem[00000000100c1400] = a9df0000, %l0 = 00000000a4000043
	lduha	[%i3+%g0]0x80,%l0	! %l0 = 000000000000a9df
!	Mem[00000000300c1400] = 00000055, %l4 = ffffffffff000000
	ldswa	[%i3+%g0]0x89,%l4	! %l4 = 0000000000000055
!	Mem[0000000010001410] = 51d2834c, %l7 = 00000000000000ff
	ldswa	[%i0+%o5]0x88,%l7	! %l7 = 0000000051d2834c
!	Mem[0000000010181400] = 00000000, %f20 = cc000000
	lda	[%i6+%g0]0x88,%f20	! %f20 = 00000000
!	Mem[0000000010181408] = 00000000 730000ff, %l6 = ffffffff, %l7 = 51d2834c
	ldda	[%i6+%o4]0x88,%l6	! %l6 = 00000000730000ff 0000000000000000
!	Mem[0000000010141408] = 1ccbffda66000000, %f12 = 65e0a712 d72bd82d
	ldda	[%i5+%o4]0x88,%f12	! %f12 = 1ccbffda 66000000

p0_label_321:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 000000ff, %l3 = ffffffffff000000
	ldstuba	[%i0+%g0]0x81,%l3	! %l3 = 0000000000000000
!	%f11 = 00a8af4f, Mem[0000000030081410] = ff00ff00
	sta	%f11,[%i2+%o5]0x89	! Mem[0000000030081410] = 00a8af4f
!	Mem[0000000010101400] = 3785cc0d 64b020ff ff0000ff 00000000
!	%f0  = 000000ff 64b02073 a4000000 ff000019
!	%f4  = 66228fc3 00000000 0dcc8537 64b020ff
!	%f8  = ffffff00 ff0000ff 66228fc3 00a8af4f
!	%f12 = 1ccbffda 66000000 f1facc43 f1facc43
	stda	%f0 ,[%i4+%g0]ASI_COMMIT_P	! Block Store to 0000000010101400
!	%l0 = 000000000000a9df, Mem[0000000030081400] = 550000ff
	stba	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = 550000df
!	%f6  = 0dcc8537 64b020ff, %l6 = 00000000730000ff
!	Mem[0000000010041438] = 000000ff11119d17
	add	%i1,0x038,%g1
	stda	%f6,[%g1+%l6]ASI_PST32_P ! Mem[0000000010041438] = 0dcc853764b020ff
!	%f12 = 1ccbffda, Mem[0000000010181428] = 97250000
	st	%f12,[%i6+0x028]	! Mem[0000000010181428] = 1ccbffda
!	Mem[00000000100c1410] = ff0000ff, %l0 = 000000000000a9df
	swapa	[%i3+%o5]0x80,%l0	! %l0 = 00000000ff0000ff
!	%l4 = 0000000000000055, Mem[0000000030101410] = 000000ff
	stwa	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000055
!	Mem[00000000100c141f] = 2a31de8c, %l7 = 0000000000000000
	ldstub	[%i3+0x01f],%l7		! %l7 = 000000000000008c
!	Mem[0000000030181408] = 00000000, %l6 = 00000000730000ff
	swapa	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000000

p0_label_322:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff000000, %l6 = 0000000000000000
	lduba	[%i6+%o5]0x80,%l6	! %l6 = 00000000000000ff
	membar	#Sync			! Added by membar checker (55)
!	Mem[0000000030081400] = df000055 ff000000 ff000000 00000000
!	Mem[0000000030081410] = 4fafa800 00000000 43f05d0f ffffffff
!	Mem[0000000030081420] = 9725ca24 3e295957 ffc4787f 51d2834c
!	Mem[0000000030081430] = 3d5c9877 1c368a02 00000000 00000000
	ldda	[%i2+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030081400
!	Mem[0000000010141408] = 1ccbffda66000000, %l6 = 00000000000000ff
	ldxa	[%i5+%o4]0x88,%l6	! %l6 = 1ccbffda66000000
!	Mem[0000000010101400] = ff000000, %l5 = 00000000730000ff
	ldswa	[%i4+%g0]0x88,%l5	! %l5 = ffffffffff000000
!	Mem[0000000010081408] = ffccfaf1, %l7 = 000000000000008c
	ldsba	[%i2+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030101408] = 7320b0640dcc00ff, %f22 = 000000ff feffffff
	ldda	[%i4+%o4]0x89,%f22	! %f22 = 7320b064 0dcc00ff
!	Mem[0000000030141400] = 000000ff, %l2 = 000000000000dfa9
	lduha	[%i5+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081428] = ffffff00b7ff22ff, %f20 = 00000000 ffffffff
	ldd	[%i2+0x028],%f20	! %f20 = ffffff00 b7ff22ff
!	Mem[0000000010141402] = 55000000, %l6 = 1ccbffda66000000, %asi = 80
	lduha	[%i5+0x002]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1400] = a9df0000000000ff, %l3 = 0000000000000000
	ldx	[%i3+%g0],%l3		! %l3 = a9df0000000000ff

p0_label_323:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 00000000, %l2 = 00000000000000ff
	swap	[%i5+%o5],%l2		! %l2 = 0000000000000000
!	Mem[0000000010141408] = 00000066, %l5 = 00000000ff000000
	swapa	[%i5+%o4]0x80,%l5	! %l5 = 0000000000000066
!	%l4 = 00000055, %l5 = 00000066, Mem[0000000010041410] = ffffffff c38f2266
	stda	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000055 00000066
!	Mem[0000000010141410] = 000000ff, %l4 = 0000000000000055
	swapa	[%i5+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1408] = ffccfaf1, %l5 = 0000000000000066
	ldstuba	[%i3+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%f19 = 00ffffff, Mem[0000000010001400] = ff000019
	sta	%f19,[%i0+%g0]0x88	! Mem[0000000010001400] = 00ffffff
!	%l5 = 00000000000000ff, Mem[0000000010081408] = ffccfaf1
	stba	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = ffccfaf1
!	%l3 = a9df0000000000ff, Mem[0000000010141410] = 55000000
	stwa	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff
	membar	#Sync			! Added by membar checker (56)
!	%f2  = ff000000, Mem[0000000030081408] = 000000ff
	sta	%f2 ,[%i2+%o4]0x89	! Mem[0000000030081408] = ff000000
!	Mem[0000000010081408] = ffccfaf1, %l7 = 00000000ffffffff
	swapa	[%i2+%o4]0x80,%l7	! %l7 = 00000000ffccfaf1

p0_label_324:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 55000000, %l1 = 0000000000000019
	lduha	[%i5+%g0]0x80,%l1	! %l1 = 0000000000005500
!	Mem[0000000010101408] = a4000000ff000019, %f14 = 00000000 00000000
	ldda	[%i4+%o4]0x80,%f14	! %f14 = a4000000 ff000019
!	Mem[0000000030101400] = ff0000ff, %f26 = 0000004b
	lda	[%i4+%g0]0x89,%f26	! %f26 = ff0000ff
!	Mem[0000000010141410] = 43ccfaf1 000000ff, %l6 = 00000000, %l7 = ffccfaf1
	ldda	[%i5+%o5]0x88,%l6	! %l6 = 00000000000000ff 0000000043ccfaf1
!	Mem[00000000100c1408] = ffccfaf1ff000000, %l2 = 0000000000000000
	ldxa	[%i3+%o4]0x80,%l2	! %l2 = ffccfaf1ff000000
!	Mem[00000000100c141c] = 2a31deff, %l7 = 0000000043ccfaf1
	lduw	[%i3+0x01c],%l7		! %l7 = 000000002a31deff
!	Mem[00000000211c0000] = ffff5a40, %l0 = 00000000ff0000ff, %asi = 80
	ldsha	[%o2+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1410] = 0000a9df, %f15 = ff000019
	ld	[%i3+%o5],%f15		! %f15 = 0000a9df
!	Mem[0000000030081408] = ff000000, %l4 = 00000000000000ff
	lduha	[%i2+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001410] = 51d2834c, %l0 = ffffffffffffffff
	lduha	[%i0+%o5]0x88,%l0	! %l0 = 000000000000834c

p0_label_325:
!	Starting 10 instruction Store Burst
!	%l2 = ffccfaf1ff000000, Mem[0000000010001408] = 00000000ff0000ff
	stx	%l2,[%i0+%o4]		! Mem[0000000010001408] = ffccfaf1ff000000
!	%l6 = 00000000000000ff, Mem[0000000010081408] = ffffffff
	stha	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 00ffffff
!	Mem[0000000010141420] = 00000000, %l6 = 000000ff, %l4 = 00000000
	add	%i5,0x20,%g1
	casa	[%g1]0x80,%l6,%l4	! %l4 = 0000000000000000
!	%l0 = 0000834c, %l1 = 00005500, Mem[0000000030141410] = 64b02073 000000ff
	stda	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000834c 00005500
!	Mem[0000000010101408] = a4000000, %l3 = 00000000000000ff
	swapa	[%i4+%o4]0x80,%l3	! %l3 = 00000000a4000000
!	Mem[0000000010081410] = ff000000, %l1 = 0000000000005500
	ldstuba	[%i2+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141408] = ff000000, %l1 = 00000000000000ff
	ldstuba	[%i5+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181400] = 00000000 000000a4 ff000073 00000000
!	%f16 = 7320b064 0dcc8537 4c83d251 00ffffff
!	%f20 = ffffff00 b7ff22ff 7320b064 0dcc00ff
!	%f24 = 00000000 ff000000 ff0000ff 000000ff
!	%f28 = 00000000 c2dbd46d 00000000 ff000000
	stda	%f16,[%i6+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010181400
!	%l1 = 00000000000000ff, Mem[00000000300c1400] = 55000000
	stwa	%l1,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000ff
!	%l0 = 000000000000834c, Mem[0000000010081408] = ffffff00
	stba	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffff4c

p0_label_326:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00ff0019, %l2 = ffccfaf1ff000000
	ldsba	[%i3+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = ffccfaf1, %l1 = 00000000000000ff
	lduba	[%i0+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001400] = ffffff00, %l4 = 0000000000000000
	ldswa	[%i0+%g0]0x80,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000010041410] = 0000005500000066, %l0 = 000000000000834c
	ldx	[%i1+%o5],%l0		! %l0 = 0000005500000066
!	Mem[00000000100c1400] = 0000dfa9, %f4  = 4fafa800
	lda	[%i3+%g0]0x88,%f4 	! %f4 = 0000dfa9
!	Mem[000000001000140c] = ff000000, %l2 = 0000000000000000
	lduw	[%i0+0x00c],%l2		! %l2 = 00000000ff000000
	membar	#Sync			! Added by membar checker (57)
!	Mem[0000000010181410] = ff22ffb7, %l7 = 000000002a31deff
	lduwa	[%i6+%o5]0x80,%l7	! %l7 = 00000000ff22ffb7
!	Mem[0000000010101408] = ff000000, %l4 = ffffffffffffff00
	ldswa	[%i4+%o4]0x88,%l4	! %l4 = ffffffffff000000
!	Mem[0000000010041410] = 0000005500000066, %l3 = 00000000a4000000
	ldxa	[%i1+%o5]0x80,%l3	! %l3 = 0000005500000066
!	Mem[0000000020800000] = 008bb9e0, %l0 = 0000005500000066
	ldub	[%o1+%g0],%l0		! %l0 = 0000000000000000

p0_label_327:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = dfa90000, %l4 = ffffffffff000000
	ldstuba	[%i3+%o5]0x88,%l4	! %l4 = 0000000000000000
!	%l3 = 0000005500000066, Mem[0000000010001410] = 4c83d251000000ff
	stxa	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000005500000066
!	%f0  = df000055 ff000000, Mem[0000000010101408] = ff000000 190000ff
	stda	%f0 ,[%i4+%o4]0x88	! Mem[0000000010101408] = df000055 ff000000
!	%l7 = 00000000ff22ffb7, Mem[0000000010101408] = 000000ff, %asi = 80
	stwa	%l7,[%i4+0x008]%asi	! Mem[0000000010101408] = ff22ffb7
!	Mem[00000000300c1408] = 1900ff00, %l3 = 0000000000000066
	swapa	[%i3+%o4]0x89,%l3	! %l3 = 000000001900ff00
!	Mem[000000001010140c] = 550000df, %l3 = 000000001900ff00
	ldstub	[%i4+0x00c],%l3		! %l3 = 0000000000000055
!	%f18 = 4c83d251 00ffffff, %l6 = 00000000000000ff
!	Mem[0000000010081428] = ffffff00b7ff22ff
	add	%i2,0x028,%g1
	stda	%f18,[%g1+%l6]ASI_PST32_P ! Mem[0000000010081428] = 4c83d25100ffffff
!	Mem[0000000030001410] = 3785cc0d, %l4 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l4	! %l4 = 000000000000000d
!	%f10 = ffc4787f 51d2834c, Mem[0000000030001400] = ff0000ff ff000000
	stda	%f10,[%i0+%g0]0x89	! Mem[0000000030001400] = ffc4787f 51d2834c
!	Mem[0000000030181400] = ff8b0000, %l5 = 00000000000000ff
	ldstuba	[%i6+%g0]0x89,%l5	! %l5 = 0000000000000000

p0_label_328:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = df000055 ff000000 000000ff 00000000
!	Mem[0000000030081410] = 4fafa800 00000000 43f05d0f ffffffff
!	Mem[0000000030081420] = 9725ca24 3e295957 ffc4787f 51d2834c
!	Mem[0000000030081430] = 3d5c9877 1c368a02 00000000 00000000
	ldda	[%i2+%g0]ASI_BLK_SL,%f16	! Block Load from 0000000030081400
!	Mem[0000000010141419] = 20ef580a, %l3 = 0000000000000055
	ldub	[%i5+0x019],%l3		! %l3 = 00000000000000ef
!	%f6  = 43f05d0f, %f7  = ffffffff, %f3  = 00000000
	fdivs	%f6 ,%f7 ,%f3 		! %f3  = ffffffff
!	Mem[0000000010141410] = ff000000, %l0 = 0000000000000000
	lduba	[%i5+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%f11 = 51d2834c, %f27 = 7f78c4ff, %f5  = 00000000
	fsubs	%f11,%f27,%f5 		! %f5  = ff78c4ff
!	Mem[0000000010101410] = 00000000c38f2266, %l6 = 00000000000000ff
	ldxa	[%i4+%o5]0x88,%l6	! %l6 = 00000000c38f2266
!	Mem[0000000010001400] = ffffff00, %l5 = 0000000000000000
	ldsha	[%i0+%g0]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030081400] = df000055ff000000, %l0 = 00000000000000ff
	ldxa	[%i2+%g0]0x81,%l0	! %l0 = df000055ff000000
!	Mem[0000000030101410] = 0000004b00000055, %l2 = 00000000ff000000
	ldxa	[%i4+%o5]0x89,%l2	! %l2 = 0000004b00000055
!	Mem[0000000010001400] = ffffff00, %f12 = 3d5c9877
	lda	[%i0+%g0]0x80,%f12	! %f12 = ffffff00

p0_label_329:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 00ffffff, %l4 = 000000000000000d
	ldstuba	[%i6+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%l3 = 00000000000000ef, Mem[0000000010101400] = 7320b064ff000000
	stxa	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000000000ef
!	%l2 = 0000004b00000055, Mem[00000000218000c0] = faff6b00
	sth	%l2,[%o3+0x0c0]		! Mem[00000000218000c0] = 00556b00
!	%l7 = 00000000ff22ffb7, Mem[0000000010181408] = ffffff0051d2834c
	stxa	%l7,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000ff22ffb7
!	Mem[0000000010041400] = 00ff0000 000000ff 66228fc3 00a8af4f
!	%f16 = 000000ff 550000df 00000000 ff000000
!	%f20 = 00000000 00a8af4f ffffffff 0f5df043
!	%f24 = 5759293e 24ca2597 4c83d251 7f78c4ff
!	%f28 = 028a361c 77985c3d 00000000 00000000
	stda	%f16,[%i1+%g0]ASI_BLK_PL	! Block Store to 0000000010041400
!	%l6 = 00000000c38f2266, Mem[00000000201c0000] = ffffa3b0, %asi = 80
	stha	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = 2266a3b0
!	Mem[0000000010181400] = 3785cc0d, %l0 = 00000000ff000000
	swapa	[%i6+%g0]0x80,%l0	! %l0 = 000000003785cc0d
!	Mem[0000000030181410] = 00000000, %l6 = 00000000c38f2266
	swapa	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000
!	%l7 = 00000000ff22ffb7, Mem[0000000010141400] = f1facc4300000055
	stxa	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000ff22ffb7
!	Mem[0000000030101410] = 00000055, %l5 = ffffffffffffffff
	ldstuba	[%i4+%o5]0x89,%l5	! %l5 = 0000000000000055

p0_label_330:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = b7ff22ff 00000000, %l2 = 00000055, %l3 = 000000ef
	ldd	[%i5+%g0],%l2		! %l2 = 00000000b7ff22ff 0000000000000000
!	Mem[0000000030041400] = ff0000ff, %l6 = 0000000000000000
	lduwa	[%i1+%g0]0x81,%l6	! %l6 = 00000000ff0000ff
	membar	#Sync			! Added by membar checker (58)
!	Mem[0000000010001400] = ffffff00 ffdbd46d ffccfaf1 ff000000
!	Mem[0000000010001410] = 00000055 00000066 0000ff24 ff000000
!	Mem[0000000010001420] = 6dd4dbc2 00000000 da9f434b 00ff0019
!	Mem[0000000010001430] = 00a8af4f 000000ff 1c360000 f1ffcc43
	ldda	[%i0+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010001400
!	Mem[0000000030081408] = 000000ff00000000, %l7 = 00000000ff22ffb7
	ldxa	[%i2+%o4]0x81,%l7	! %l7 = 000000ff00000000
!	Mem[00000000300c1400] = 000000ff ff000000 66000000 ea8b2d55
!	Mem[00000000300c1410] = 2dd82bd7 12a7e065 552d8bea c2dbd46d
!	Mem[00000000300c1420] = 18b671f8 00000000 4fafa800 c38f2266
!	Mem[00000000300c1430] = 7320b064 12a7e065 6dd4dbc2 79a7ab8b
	ldda	[%i3+%g0]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010041410] = 00a8af4f, %l6 = 00000000ff0000ff
	lduba	[%i1+%o5]0x88,%l6	! %l6 = 000000000000004f
!	Mem[0000000010041406] = ff000000, %l2 = 00000000b7ff22ff
	ldsh	[%i1+0x006],%l2		! %l2 = 0000000000000000
!	Mem[0000000010181410] = ffffff00b7ff22ff, %l1 = 00000000000000ff
	ldxa	[%i6+%o5]0x88,%l1	! %l1 = ffffff00b7ff22ff
!	Mem[0000000030041410] = 00ffffff, %l6 = 000000000000004f
	lduba	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081400] = 550000df, %l0 = 000000003785cc0d
	lduha	[%i2+%g0]0x89,%l0	! %l0 = 00000000000000df

p0_label_331:
!	Starting 10 instruction Store Burst
!	%l1 = ffffff00b7ff22ff, Mem[0000000030081408] = 000000ff
	stha	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 22ff00ff
!	Mem[0000000030181408] = 730000ff, %l3 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l3	! %l3 = 00000000730000ff
!	%l7 = 000000ff00000000, Mem[0000000010141410] = ff000000
	stba	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	Mem[00000000100c1432] = 00000000, %l2 = 0000000000000000
	ldstub	[%i3+0x032],%l2		! %l2 = 0000000000000000
!	%l3 = 00000000730000ff, Mem[0000000010081408] = ff8b0000ffffff4c
	stxa	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000730000ff
!	Mem[000000001008141c] = 00000000, %l3 = 00000000730000ff
	ldstub	[%i2+0x01c],%l3		! %l3 = 0000000000000000
!	Mem[0000000030041410] = 00ffffff, %l1 = 00000000b7ff22ff
	swapa	[%i1+%o5]0x89,%l1	! %l1 = 0000000000ffffff
!	Mem[0000000030041410] = b7ff22ff, %l4 = 00000000000000ff
	ldstuba	[%i1+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	%f28 = 7320b064 12a7e065, Mem[0000000010141400] = ff22ffb7 00000000
	stda	%f28,[%i5+%g0]0x88	! Mem[0000000010141400] = 7320b064 12a7e065
!	%l0 = 00000000000000df, Mem[0000000010101410] = 66228fc3
	stha	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 00df8fc3

p0_label_332:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001430] = 00a8af4f, %f15 = f1ffcc43
	lda	[%i0+0x030]%asi,%f15	! %f15 = 00a8af4f
!	Mem[0000000030001410] = 3785ccff, %l3 = 0000000000000000
	ldsba	[%i0+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	%f5  = 00000066, Mem[0000000030041408] = 00008bff
	sta	%f5 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000066
!	Mem[0000000010141418] = 20ef580a 00000980, %l4 = 000000ff, %l5 = 00000055
	ldd	[%i5+0x018],%l4		! %l4 = 0000000020ef580a 0000000000000980
!	Mem[0000000010101410] = 00df8fc3, %l0 = 00000000000000df
	ldsha	[%i4+%o5]0x80,%l0	! %l0 = 00000000000000df
!	Mem[0000000030141400] = ff000000, %l0 = 00000000000000df
	ldswa	[%i5+%g0]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010001400] = ffffff00 ffdbd46d ffccfaf1 ff000000
!	Mem[0000000010001410] = 00000055 00000066 0000ff24 ff000000
!	Mem[0000000010001420] = 6dd4dbc2 00000000 da9f434b 00ff0019
!	Mem[0000000010001430] = 00a8af4f 000000ff 1c360000 f1ffcc43
	ldda	[%i0+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010001400
!	Mem[00000000300c1400] = ff000000, %l3 = ffffffffffffffff
	lduha	[%i3+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041400] = ff0000ff, %l0 = ffffffffff000000
	ldsba	[%i1+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141424] = 000000ff, %l5 = 0000000000000980
	lduw	[%i5+0x024],%l5		! %l5 = 00000000000000ff

p0_label_333:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 000000ff ff000000 66000000 ea8b2d55
!	%f16 = 6dd4dbff 00ffffff 000000ff f1faccff
!	%f20 = 66000000 55000000 000000ff 24ff0000
!	%f24 = 00000000 c2dbd46d 1900ff00 4b439fda
!	%f28 = ff000000 4fafa800 43ccfff1 0000361c
	stda	%f16,[%i3+%g0]ASI_BLK_AIUS	! Block Store to 00000000300c1400
	membar	#Sync			! Added by membar checker (59)
!	%l1 = 0000000000ffffff, Mem[0000000010001426] = 00000000, %asi = 80
	stha	%l1,[%i0+0x026]%asi	! Mem[0000000010001424] = 0000ffff
!	%l4 = 0000000020ef580a, Mem[0000000010081400] = 0000ff00
	stwa	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = 20ef580a
!	Mem[0000000030101400] = ff0000ff, %l7 = 000000ff00000000
	ldstuba	[%i4+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101400] = ff0000ff, %l5 = 00000000000000ff
	swapa	[%i4+%g0]0x89,%l5	! %l5 = 00000000ff0000ff
!	%l2 = 0000000000000000, Mem[0000000030001400] = 51d2834c
	stwa	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	%f21 = 55000000, %f8  = 6dd4dbc2, %f17 = 00ffffff
	fmuls	%f21,%f8 ,%f17		! %f17 = 7f800000
!	%f13 = 000000ff, Mem[0000000030041400] = ff0000ff
	sta	%f13,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff
!	%l0 = ffffffff, %l1 = 00ffffff, Mem[0000000010041420] = 9725ca24 3e295957, %asi = 80
	stda	%l0,[%i1+0x020]%asi	! Mem[0000000010041420] = ffffffff 00ffffff
!	Mem[0000000010181408] = 00000000, %l2 = 0000000000000000
	swapa	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000000

p0_label_334:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ffccfaf1 ff000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i3+%o4]0x89,%l2	! %l2 = 00000000ff000000 00000000ffccfaf1
!	Mem[0000000010001410] = 00000055 00000066, %l0 = ffffffff, %l1 = 00ffffff
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000055 0000000000000066
!	Mem[00000000300c1400] = 6dd4dbff, %l4 = 0000000020ef580a
	ldsha	[%i3+%g0]0x81,%l4	! %l4 = 0000000000006dd4
!	Mem[0000000030001408] = 000000ff ff0000ff, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i0+%o4]0x89,%l6	! %l6 = 00000000ff0000ff 00000000000000ff
!	Mem[0000000010101418] = 0dcc8537, %l4 = 0000000000006dd4
	lduw	[%i4+0x018],%l4		! %l4 = 000000000dcc8537
!	%l0 = 0000000000000055, Mem[0000000010141414] = f1facc43, %asi = 80
	stha	%l0,[%i5+0x014]%asi	! Mem[0000000010141414] = 0055cc43
!	Mem[00000000300c1400] = 6dd4dbff, %l0 = 0000000000000055
	lduha	[%i3+%g0]0x81,%l0	! %l0 = 0000000000006dd4
!	Mem[00000000300c1410] = 00000066, %l2 = 00000000ff000000
	lduha	[%i3+%o5]0x89,%l2	! %l2 = 0000000000000066
!	Mem[0000000010041431] = 3d5c9877, %l4 = 000000000dcc8537, %asi = 80
	ldsba	[%i1+0x031]%asi,%l4	! %l4 = 000000000000005c
!	Mem[0000000030181410] = 66228fc3, %f20 = 66000000
	lda	[%i6+%o5]0x81,%f20	! %f20 = 66228fc3

p0_label_335:
!	Starting 10 instruction Store Burst
!	%f16 = 6dd4dbff 7f800000, %l2 = 0000000000000066
!	Mem[0000000010081418] = 00ff2300ff000000
	add	%i2,0x018,%g1
	stda	%f16,[%g1+%l2]ASI_PST16_P ! Mem[0000000010081418] = 00ffdbff7f800000
!	%f12 = 00a8af4f, Mem[0000000010141400] = 12a7e065
	sta	%f12,[%i5+%g0]0x88	! Mem[0000000010141400] = 00a8af4f
!	Mem[0000000030101400] = ff000000, %l5 = 00000000ff0000ff
	ldstuba	[%i4+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	%l3 = 00000000ffccfaf1, Mem[0000000010001408] = f1faccff
	stba	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = f1faccf1
!	%f16 = 6dd4dbff 7f800000, %l3 = 00000000ffccfaf1
!	Mem[00000000300c1410] = 6600000055000000
	add	%i3,0x010,%g1
	stda	%f16,[%g1+%l3]ASI_PST32_S ! Mem[00000000300c1410] = 660000007f800000
!	Mem[0000000030041400] = 000000ff, %l5 = 00000000000000ff
	ldstuba	[%i1+%g0]0x81,%l5	! %l5 = 0000000000000000
!	%l1 = 0000000000000066, Mem[0000000010081408] = ff000073
	stba	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 66000073
!	%l0 = 0000000000006dd4, %l5 = 0000000000000000, %y  = 00008bff
	sdiv	%l0,%l5,%l2		! Div by zero, %l0 = 0000000000006dfc
!	Mem[0000000030101400] = 000000ff, %l6 = 00000000ff0000ff
	swapa	[%i4+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001408] = ff0000ff, %l1 = 0000000000000066
	ldstuba	[%i0+%o4]0x89,%l1	! %l1 = 00000000000000ff

p0_label_336:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 66228fc3, %l3 = 00000000ffccfaf1
	lduwa	[%i6+%o5]0x81,%l3	! %l3 = 0000000066228fc3
!	Mem[0000000010001420] = 6dd4dbc2, %l2 = 0000000000000066
	ldsw	[%i0+0x020],%l2		! %l2 = 000000006dd4dbc2
!	%l3 = 0000000066228fc3, %l3 = 0000000066228fc3, %l1 = 00000000000000ff
	sub	%l3,%l3,%l1		! %l1 = 0000000000000000
!	Mem[0000000030181408] = 6dd4dbc200000000, %l5 = 0000000000000000
	ldxa	[%i6+%o4]0x89,%l5	! %l5 = 6dd4dbc200000000
!	Mem[00000000201c0000] = 2266a3b0, %l5 = 6dd4dbc200000000
	ldsb	[%o0+%g0],%l5		! %l5 = 0000000000000022
!	Mem[0000000010101418] = 0dcc8537, %l5 = 0000000000000022, %asi = 80
	ldsha	[%i4+0x018]%asi,%l5	! %l5 = 0000000000000dcc
!	Mem[0000000030001400] = 00000000 7f78c4ff, %l2 = 6dd4dbc2, %l3 = 66228fc3
	ldda	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000 000000007f78c4ff
!	Mem[0000000010101418] = 0dcc8537, %l1 = 00000000, %l3 = 7f78c4ff
	add	%i4,0x18,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 000000000dcc8537
!	Mem[0000000010141438] = 4fafa800e23b3a56, %f24 = 00000000 c2dbd46d, %asi = 80
	ldda	[%i5+0x038]%asi,%f24	! %f24 = 4fafa800 e23b3a56
!	Mem[0000000030041410] = ff22ffb7, %l2 = 0000000000000000
	ldswa	[%i1+%o5]0x81,%l2	! %l2 = ffffffffff22ffb7

p0_label_337:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000dcc, Mem[0000000010081400] = 0a58ef2000000000
	stxa	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000000dcc
!	Mem[0000000030081410] = 00a8af4f, %l0 = 0000000000006dfc
	ldstuba	[%i2+%o5]0x89,%l0	! %l0 = 000000000000004f
!	%l5 = 0000000000000dcc, Mem[0000000010141400] = 00a8af4f
	stha	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 00a80dcc
!	%f10 = da9f434b, Mem[0000000030181408] = 00000000
	sta	%f10,[%i6+%o4]0x81	! Mem[0000000030181408] = da9f434b
!	%l3 = 000000000dcc8537, Mem[00000000300c1400] = 6dd4dbff
	stba	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 37d4dbff
!	Mem[0000000010141408] = ff000000, %l7 = 00000000000000ff
	swap	[%i5+%o4],%l7		! %l7 = 00000000ff000000
!	%f12 = 00a8af4f 000000ff, %l3 = 000000000dcc8537
!	Mem[0000000030141420] = 66228fc300a8af4f
	add	%i5,0x020,%g1
	stda	%f12,[%g1+%l3]ASI_PST16_S ! Mem[0000000030141420] = 6622af4f000000ff
!	Mem[0000000030141400] = ff000000 00000000 ffffffff 00000000
!	%f0  = ffffff00 ffdbd46d ffccfaf1 ff000000
!	%f4  = 00000055 00000066 0000ff24 ff000000
!	%f8  = 6dd4dbc2 00000000 da9f434b 00ff0019
!	%f12 = 00a8af4f 000000ff 1c360000 00a8af4f
	stda	%f0 ,[%i5+%g0]ASI_COMMIT_S	! Block Store to 0000000030141400
!	Mem[00000000201c0000] = 2266a3b0, %l4 = 000000000000005c
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 0000000000000022
!	%f22 = 000000ff 24ff0000, %l6 = 00000000000000ff
!	Mem[00000000100c1438] = 0000000000000000
	add	%i3,0x038,%g1
	stda	%f22,[%g1+%l6]ASI_PST32_PL ! Mem[00000000100c1438] = 0000ff24ff000000

p0_label_338:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800001] = ff00e470, %l7 = 00000000ff000000
	ldub	[%o3+0x001],%l7		! %l7 = 0000000000000000
!	Mem[0000000010001400] = 00ffffff, %l6 = 00000000000000ff
	lduba	[%i0+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001410] = 0000005500000066, %l0 = 000000000000004f
	ldxa	[%i0+%o5]0x80,%l0	! %l0 = 0000005500000066
!	Mem[0000000020800040] = ff194c10, %l5 = 0000000000000dcc, %asi = 80
	ldsha	[%o1+0x040]%asi,%l5	! %l5 = ffffffffffffff19
!	Mem[0000000030041410] = 00000000b7ff22ff, %f18 = 000000ff f1faccff
	ldda	[%i1+%o5]0x89,%f18	! %f18 = 00000000 b7ff22ff
!	Mem[000000001000141c] = ff000000, %l2 = ffffffffff22ffb7, %asi = 80
	ldswa	[%i0+0x01c]%asi,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010081406] = 00000dcc, %l0 = 0000005500000066
	ldsh	[%i2+0x006],%l0		! %l0 = 0000000000000dcc
!	Mem[0000000010001404] = ffdbd46d, %l2 = ffffffffff000000
	ldsw	[%i0+0x004],%l2		! %l2 = ffffffffffdbd46d
!	Mem[0000000010181408] = 00000000, %l0 = 0000000000000dcc
	lduba	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1408] = 000000ff, %l4 = 0000000000000022
	lduha	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000000

p0_label_339:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = ffdbd437, %l0 = 0000000000000000
	swapa	[%i3+%g0]0x89,%l0	! %l0 = 00000000ffdbd437
!	Mem[0000000010081404] = 00000dcc, %l0 = 00000000ffdbd437, %asi = 80
	swapa	[%i2+0x004]%asi,%l0	! %l0 = 0000000000000dcc
!	%l2 = ffffffffffdbd46d, Mem[0000000030081400] = 550000df
	stha	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 5500d46d
!	%f4  = 00000055 00000066, %l4 = 0000000000000000
!	Mem[00000000100c1400] = a9df0000000000ff
	stda	%f4,[%i3+%l4]ASI_PST32_P ! Mem[00000000100c1400] = a9df0000000000ff
	membar	#Sync			! Added by membar checker (60)
!	Mem[0000000030141408] = f1faccff, %l5 = 00000000ffffff19
	swapa	[%i5+%o4]0x89,%l5	! %l5 = 00000000f1faccff
!	Mem[0000000010141418] = 20ef580a00000980, %l4 = 0000000000000000, %l5 = 00000000f1faccff
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l4,%l5	! %l5 = 20ef580a00000980
!	%f8  = 6dd4dbc2 00000000, Mem[0000000030041408] = 00000066 ffccfaf1
	stda	%f8 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 6dd4dbc2 00000000
!	%f20 = 66228fc3 55000000, Mem[0000000010081410] = 000000ff 00ffffff
	stda	%f20,[%i2+%o5]0x88	! Mem[0000000010081410] = 66228fc3 55000000
!	%l1 = 0000000000000000, Mem[000000001014141d] = 00000980, %asi = 80
	stba	%l1,[%i5+0x01d]%asi	! Mem[000000001014141c] = 00000980
!	Mem[00000000201c0001] = ff66a3b0, %l4 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l4	! %l4 = 0000000000000066

p0_label_340:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = a9df0000 000000ff ffccfaf1 ff000000
!	Mem[00000000100c1410] = ff00a9df 00000055 43ccfaf1 2a31deff
!	Mem[00000000100c1420] = f1facc43 00a8af4f 4b439fda 0f5df043
!	Mem[00000000100c1430] = 0000ff00 ff000000 0000ff24 ff000000
	ldda	[%i3+%g0]ASI_BLK_AIUP,%f16	! Block Load from 00000000100c1400
!	Mem[00000000211c0000] = ffff5a40, %l3 = 000000000dcc8537
	lduh	[%o2+%g0],%l3		! %l3 = 000000000000ffff
!	%f10 = da9f434b, %f15 = 00a8af4f, %f10 = da9f434b
	fmuls	%f10,%f15,%f10		! %f10 = 9bd1e273
!	Mem[00000000300c1400] = 00000000, %l6 = 00000000000000ff
	lduba	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0001] = ffff5a40, %l6 = 0000000000000000, %asi = 80
	ldsba	[%o2+0x001]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030001408] = ff0000ff, %l5 = 20ef580a00000980
	lduba	[%i0+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030041400] = ff0000ff, %l1 = 0000000000000000
	ldsha	[%i1+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1400] = 00000000, %l3 = 000000000000ffff
	lduba	[%i3+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1424] = 00a8af4f, %l5 = 00000000000000ff, %asi = 80
	lduha	[%i3+0x024]%asi,%l5	! %l5 = 00000000000000a8
!	Mem[0000000010001400] = ffffff00, %l3 = 0000000000000000
	ldsha	[%i0+%g0]0x80,%l3	! %l3 = ffffffffffffffff

p0_label_341:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = ff0000ff, %l6 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[0000000030181408] = da9f434b
	stwa	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000ff
!	%l1 = 00000000000000ff, Mem[0000000020800041] = ff194c10, %asi = 80
	stba	%l1,[%o1+0x041]%asi	! Mem[0000000020800040] = ffff4c10
!	Mem[0000000030001408] = ff0000ff, %l7 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	%f18 = ffccfaf1 ff000000, %l7 = 00000000000000ff
!	Mem[0000000010101420] = ffffff00ff0000ff
	add	%i4,0x020,%g1
	stda	%f18,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010101420] = 000000fff1faccff
!	%l2 = ffffffffffdbd46d, Mem[0000000010101400] = 000000ef
	stwa	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = ffdbd46d
!	%f28 = 0000ff00 ff000000, Mem[0000000010181400] = ff000000 64b02073
	stda	%f28,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000ff00 ff000000
!	%f6  = 0000ff24, Mem[0000000030001400] = 00000000
	sta	%f6 ,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000ff24
!	%f10 = 9bd1e273, %f11 = 00ff0019
	fsqrts	%f10,%f11		! %f11 = 7fffffff
!	Mem[0000000021800081] = ffd56cd0, %l4 = 0000000000000066
	ldstub	[%o3+0x081],%l4		! %l4 = 00000000000000d5

p0_label_342:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000 c38fdf00, %l0 = 00000dcc, %l1 = 000000ff
	ldda	[%i4+%o5]0x88,%l0	! %l0 = 00000000c38fdf00 0000000000000000
!	Mem[0000000030141410] = 0000005500000066, %f6  = 0000ff24 ff000000
	ldda	[%i5+%o5]0x81,%f6 	! %f6  = 00000055 00000066
!	Mem[0000000030101400] = ff0000ff, %l3 = ffffffffffffffff
	ldstuba	[%i4+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141410] = 00000000, %l6 = 00000000000000ff
	ldsha	[%i5+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101410] = 00000000 c38fdf00, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i4+%o5]0x88,%l6	! %l6 = 00000000c38fdf00 0000000000000000
!	Mem[00000000300c1408] = 000000ff, %l6 = 00000000c38fdf00
	ldsba	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = ff00cc0d64b02073, %l3 = 00000000000000ff
	ldxa	[%i4+%o4]0x81,%l3	! %l3 = ff00cc0d64b02073
!	Mem[00000000100c1400] = a9df0000, %l4 = 00000000000000d5
	lduwa	[%i3+%g0]0x80,%l4	! %l4 = 00000000a9df0000
!	Mem[0000000030041408] = 00000000c2dbd46d, %f10 = 9bd1e273 7fffffff
	ldda	[%i1+%o4]0x81,%f10	! %f10 = 00000000 c2dbd46d
	membar	#Sync			! Added by membar checker (61)
!	%l2 = ffdbd46d, %l3 = 64b02073, Mem[00000000100c1408] = ffccfaf1 ff000000
	stda	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffdbd46d 64b02073

p0_label_343:
!	Starting 10 instruction Store Burst
!	%f18 = ffccfaf1 ff000000, %l1 = 0000000000000000
!	Mem[0000000010181420] = 000000ff00000000
	add	%i6,0x020,%g1
	stda	%f18,[%g1+%l1]ASI_PST16_P ! Mem[0000000010181420] = 000000ff00000000
!	%l1 = 0000000000000000, immd = 00000f15, %y  = 00008bff
	smul	%l1,0xf15,%l6		! %l6 = 0000000000000000, %y = 00000000
!	Mem[0000000030041400] = ff0000ff, %l5 = 00000000000000a8
	swapa	[%i1+%g0]0x81,%l5	! %l5 = 00000000ff0000ff
!	Mem[00000000100c1400] = 0000dfa9, %l7 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l7	! %l7 = 000000000000dfa9
!	Mem[0000000010141410] = 00000000, %l5 = 00000000ff0000ff
	ldstuba	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000000
!	%l3 = ff00cc0d64b02073, Mem[0000000010001410] = 55000000
	stha	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 55002073
!	%f28 = 0000ff00 ff000000, %l7 = 000000000000dfa9
!	Mem[0000000010081420] = 0000faf1ffffffff
	add	%i2,0x020,%g1
	stda	%f28,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010081420] = 0000faffffffff00
!	%l2 = ffffffffffdbd46d, Mem[0000000030181410] = 66228fc3
	stha	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = d46d8fc3
!	Mem[000000001010142c] = 00a8af4f, %l0 = c38fdf00, %l7 = 0000dfa9
	add	%i4,0x2c,%g1
	casa	[%g1]0x80,%l0,%l7	! %l7 = 0000000000a8af4f
!	Mem[0000000010101408] = ff22ffb7, %l2 = ffffffffffdbd46d
	ldstuba	[%i4+%o4]0x80,%l2	! %l2 = 00000000000000ff

p0_label_344:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101430] = 1ccbffda, %l0 = 00000000c38fdf00
	ldsb	[%i4+0x030],%l0		! %l0 = 000000000000001c
!	Mem[0000000030081408] = ff00ff22, %l1 = 0000000000000000
	lduwa	[%i2+%o4]0x89,%l1	! %l1 = 00000000ff00ff22
!	Mem[0000000030141410] = 55000000, %f21 = 00000055
	lda	[%i5+%o5]0x89,%f21	! %f21 = 55000000
!	Mem[0000000010041408] = 000000ff, %l0 = 000000000000001c
	ldsba	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = 6dd4dbff 00000000, %l0 = 00000000, %l1 = ff00ff22
	ldd	[%i4+%g0],%l0		! %l0 = 000000006dd4dbff 0000000000000000
!	Mem[0000000010181408] = 00000000ff22ffb7, %l5 = 0000000000000000
	ldxa	[%i6+%o4]0x80,%l5	! %l5 = 00000000ff22ffb7
!	Mem[0000000010141410] = 000000ff, %l0 = 000000006dd4dbff
	ldsha	[%i5+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141400] = 00a80dcc, %l6 = 0000000000000000
	lduwa	[%i5+%g0]0x88,%l6	! %l6 = 0000000000a80dcc
!	Mem[00000000100c1400] = 00000000000000ff, %f12 = 00a8af4f 000000ff
	ldd	[%i3+%g0],%f12		! %f12 = 00000000 000000ff
!	Mem[0000000010081410] = 55000000, %l4 = 00000000a9df0000
	lduwa	[%i2+%o5]0x88,%l4	! %l4 = 0000000055000000

p0_label_345:
!	Starting 10 instruction Store Burst
!	%l3 = ff00cc0d64b02073, Mem[0000000030001408] = ff0000ff
	stwa	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 64b02073
!	%l3 = ff00cc0d64b02073, Mem[00000000100c1400] = ff00000000000000
	stxa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = ff00cc0d64b02073
!	%f22 = 43ccfaf1 2a31deff, %l2 = 00000000000000ff
!	Mem[0000000030081408] = 22ff00ff00000000
	add	%i2,0x008,%g1
	stda	%f22,[%g1+%l2]ASI_PST32_SL ! Mem[0000000030081408] = ffde312af1facc43
!	Mem[0000000010101438] = f1facc43, %l5 = 00000000ff22ffb7
	ldstuba	[%i4+0x038]%asi,%l5	! %l5 = 00000000000000f1
!	%l3 = ff00cc0d64b02073, imm = 0000000000000492, %l1 = 0000000000000000
	xnor	%l3,0x492,%l1		! %l1 = 00ff33f29b4fdb1e
!	Mem[0000000021800041] = ff00eaa0, %l6 = 0000000000a80dcc
	ldstub	[%o3+0x041],%l6		! %l6 = 0000000000000000
!	%l0 = 00000000000000ff, Mem[0000000030181400] = ff8b00ff
	stba	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = ff8b00ff
!	%l5 = 00000000000000f1, Mem[00000000211c0000] = ffff5a40
	sth	%l5,[%o2+%g0]		! Mem[00000000211c0000] = 00f15a40
!	%l6 = 00000000, %l7 = 00a8af4f, Mem[0000000010181418] = ff00cc0d 64b02073
	std	%l6,[%i6+0x018]		! Mem[0000000010181418] = 00000000 00a8af4f
!	Mem[0000000030001410] = 3785ccff, %l6 = 0000000000000000
	swapa	[%i0+%o5]0x89,%l6	! %l6 = 000000003785ccff

p0_label_346:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 5500d46d, %l3 = ff00cc0d64b02073
	lduwa	[%i2+%g0]0x89,%l3	! %l3 = 000000005500d46d
!	Mem[0000000010041410] = 00000000 00a8af4f, %l0 = 000000ff, %l1 = 9b4fdb1e
	ldda	[%i1+%o5]0x88,%l0	! %l0 = 0000000000a8af4f 0000000000000000
!	Mem[0000000030081400] = 6dd40055, %l5 = 00000000000000f1
	lduba	[%i2+%g0]0x81,%l5	! %l5 = 000000000000006d
!	%f24 = f1facc43, %f14 = 1c360000, %f12 = 00000000 000000ff
	fsmuld	%f24,%f14,%f12		! %f12 = c1d649a6 f4400000
!	Mem[0000000010141410] = 000000ff, %f10 = 00000000
	lda	[%i5+%o5]0x88,%f10	! %f10 = 000000ff
!	Mem[0000000010101410] = 00df8fc3, %l3 = 000000005500d46d
	ldswa	[%i4+%o5]0x80,%l3	! %l3 = 0000000000df8fc3
!	Mem[0000000030081400] = 000000ff 5500d46d, %l4 = 55000000, %l5 = 0000006d
	ldda	[%i2+%g0]0x89,%l4	! %l4 = 000000005500d46d 00000000000000ff
!	Mem[0000000010141408] = ff000000, %l2 = 00000000000000ff
	ldsha	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1400] = 0000000000ffffff, %l6 = 000000003785ccff
	ldxa	[%i3+%g0]0x81,%l6	! %l6 = 0000000000ffffff
!	Mem[0000000010081408] = 66000073, %l0 = 0000000000a8af4f
	lduwa	[%i2+%o4]0x80,%l0	! %l0 = 0000000066000073

p0_label_347:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = ff000000, %l2 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	%f30 = 0000ff24 ff000000, Mem[0000000030041410] = b7ff22ff 00000000
	stda	%f30,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000ff24 ff000000
!	Mem[0000000010141406] = 64b02073, %l2 = 00000000000000ff
	ldstub	[%i5+0x006],%l2		! %l2 = 0000000000000020
!	%l3 = 0000000000df8fc3, Mem[0000000010101410] = 00df8fc3
	stwa	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 00df8fc3
!	%f4  = 00000055 00000066, %l7 = 0000000000a8af4f
!	Mem[0000000030101438] = 43ccfaf1000000ff
	add	%i4,0x038,%g1
	stda	%f4,[%g1+%l7]ASI_PST32_SL ! Mem[0000000030101438] = 6600000055000000
!	Mem[0000000010141410] = ff000000, %l4 = 000000005500d46d
	swapa	[%i5+%o5]0x80,%l4	! %l4 = 00000000ff000000
!	%l2 = 0000000000000020, Mem[0000000010001410] = 55002073
	stwa	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000020
!	%l5 = 00000000000000ff, Mem[0000000030081400] = 000000ff5500d46d
	stxa	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000000000ff
!	%l0 = 0000000066000073, immd = fffffffffffff462, %l7  = 0000000000a8af4f
	mulx	%l0,-0xb9e,%l7		! %l7 = fffffb5f0bfac806
!	Mem[0000000030001408] = 64b02073, %l1 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l1	! %l1 = 0000000000000073

p0_label_348:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000, %l7 = fffffb5f0bfac806
	lduwa	[%i1+%o4]0x89,%l7	! %l7 = 0000000000000000
	membar	#Sync			! Added by membar checker (62)
!	Mem[0000000030041400] = 000000a8 64b02073 00000000 c2dbd46d
!	Mem[0000000030041410] = 000000ff 24ff0000 43f05d0f da9f434b
!	Mem[0000000030041420] = 9725ca24 3e295957 ffc4787f 51d2834c
!	Mem[0000000030041430] = 3d5c9877 1c368a02 00000000 00000000
	ldda	[%i1+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030041400
!	Mem[00000000300c1408] = ff000000, %l6 = 0000000000ffffff
	ldsha	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101410] = 000000ff, %l4 = 00000000ff000000
	lduha	[%i4+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181400] = 00ff0000, %l1 = 0000000000000073
	lduba	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = 00ffffff, %l1 = 0000000000000000
	lduha	[%i5+%g0]0x89,%l1	! %l1 = 000000000000ffff
!	Mem[00000000100c1400] = ff00cc0d64b02073, %l5 = 00000000000000ff
	ldxa	[%i3+%g0]0x88,%l5	! %l5 = ff00cc0d64b02073
!	Mem[0000000010101400] = 6dd4dbff, %l6 = 0000000000000000
	ldsba	[%i4+%g0]0x80,%l6	! %l6 = 000000000000006d
!	Mem[0000000030081408] = 43ccfaf12a31deff, %f18 = ffccfaf1 ff000000
	ldda	[%i2+%o4]0x89,%f18	! %f18 = 43ccfaf1 2a31deff
!	Mem[00000000300c1410] = 00000066, %l2 = 0000000000000020
	lduba	[%i3+%o5]0x89,%l2	! %l2 = 0000000000000066

p0_label_349:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010001408] = f1ccfaf1ff000000
	stxa	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000000000000000
!	%f4  = 000000ff 24ff0000, Mem[0000000010001428] = da9f434b 00ff0019, %asi = 80
	stda	%f4 ,[%i0+0x028]%asi	! Mem[0000000010001428] = 000000ff 24ff0000
!	%l5 = ff00cc0d64b02073, Mem[0000000030001410] = 00000000
	stba	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000073
!	%l6 = 000000000000006d, Mem[0000000010101400] = ffdbd46d
	stba	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = ffdbd46d
!	%f10 = ffc4787f 51d2834c, %l7 = 0000000000000000
!	Mem[0000000030141430] = 00a8af4f000000ff
	add	%i5,0x030,%g1
	stda	%f10,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030141430] = 00a8af4f000000ff
!	%f20 = ff00a9df 55000000, Mem[0000000010041400] = 550000df 000000ff
	stda	%f20,[%i1+%g0]0x88	! Mem[0000000010041400] = ff00a9df 55000000
!	Mem[0000000030141408] = ffffff19, %l3 = 0000000000df8fc3
	swapa	[%i5+%o4]0x89,%l3	! %l3 = 00000000ffffff19
!	Mem[0000000010141400] = 00a80dcc, %l7 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l7	! %l7 = 0000000000a80dcc
!	Mem[0000000010101400] = 6dd4dbff, %l3 = 00000000ffffff19
	swapa	[%i4+%g0]0x80,%l3	! %l3 = 000000006dd4dbff
!	%f22 = 43ccfaf1, %f25 = 00a8af4f, %f18 = 43ccfaf1
	fmuls	%f22,%f25,%f18		! %f18 = 0507110d

p0_label_350:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001414] = 00000066, %l6 = 000000000000006d
	ldsw	[%i0+0x014],%l6		! %l6 = 0000000000000066
!	Mem[0000000010181410] = ffffff00b7ff22ff, %l2 = 0000000000000066
	ldxa	[%i6+%o5]0x88,%l2	! %l2 = ffffff00b7ff22ff
!	Mem[0000000010081400] = 00000000, %l0 = 0000000066000073
	ldsba	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%f2  = 00000000, %f22 = 43ccfaf1, %f28 = 0000ff00
	fadds	%f2 ,%f22,%f28		! %f28 = 43ccfaf1
!	Mem[0000000010081400] = 00000000, %l2 = ffffff00b7ff22ff
	lduha	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1410] = 0000807f00000066, %l1 = 000000000000ffff
	ldxa	[%i3+%o5]0x89,%l1	! %l1 = 0000807f00000066
!	Mem[0000000030181408] = 000000ff, %l3 = 000000006dd4dbff
	ldsha	[%i6+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1408] = ff000000, %l7 = 0000000000a80dcc
	lduwa	[%i3+%o4]0x89,%l7	! %l7 = 00000000ff000000
!	Mem[0000000030041400] = a8000000, %l2 = 0000000000000000
	lduwa	[%i1+%g0]0x89,%l2	! %l2 = 00000000a8000000
!	Mem[0000000030001408] = ff20b064, %l3 = 0000000000000000
	ldsha	[%i0+%o4]0x81,%l3	! %l3 = ffffffffffffff20

p0_label_351:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000ff000000, immd = 00000bec, %y  = 00000000
	sdiv	%l7,0xbec,%l7		! %l7 = 00000000001563a6
	mov	%l0,%y			! %y = 00000000
!	%l3 = ffffffffffffff20, Mem[0000000010081410] = 00000055
	stwa	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffff20
!	Mem[00000000201c0000] = ffffa3b0, %l0 = 0000000000000000
	ldstub	[%o0+%g0],%l0		! %l0 = 00000000000000ff
!	%l6 = 0000000000000066, Mem[00000000201c0000] = ffffa3b0
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 0066a3b0
!	%l7 = 00000000001563a6, Mem[0000000030001408] = 000000ff64b020ff
	stxa	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000001563a6
!	%l2 = a8000000, %l3 = ffffff20, Mem[0000000030101410] = ff000000 4b000000
	stda	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = a8000000 ffffff20
!	%l0 = 00000000000000ff, Mem[00000000100c1410] = ff00a9df
	stha	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00ffa9df
!	Mem[0000000010001410] = 00000020, %l5 = ff00cc0d64b02073
	ldstuba	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000020
!	Mem[0000000010141410] = 5500d46d, %l2 = 00000000a8000000
	ldstuba	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000055
!	Mem[0000000030081408] = 2a31deff, %l5 = 0000000000000020
	ldstuba	[%i2+%o4]0x89,%l5	! %l5 = 00000000000000ff

p0_label_352:
!	Starting 10 instruction Load Burst
!	%l2 = 0000000000000055, immd = 0000000000000d18, %l1  = 0000807f00000066
	mulx	%l2,0xd18,%l1		! %l1 = 00000000000458f8
!	Mem[00000000300c1400] = ffffff00 00000000, %l0 = 000000ff, %l1 = 000458f8
	ldda	[%i3+%g0]0x89,%l0	! %l0 = 0000000000000000 00000000ffffff00
!	Mem[0000000010041410] = 4fafa800 00000000, %l4 = 000000ff, %l5 = 000000ff
	ldda	[%i1+%o5]0x80,%l4	! %l4 = 000000004fafa800 0000000000000000
!	%f19 = 2a31deff, %f25 = 00a8af4f
	fcmpes	%fcc3,%f19,%f25		! %fcc3 = 2
!	Mem[0000000010181410] = b7ff22ff, %l7 = 00000000001563a6
	lduha	[%i6+%o5]0x88,%l7	! %l7 = 00000000000022ff
!	Mem[0000000030101408] = 0dcc00ff, %f11 = 51d2834c
	lda	[%i4+%o4]0x89,%f11	! %f11 = 0dcc00ff
!	Mem[0000000030081400] = ff000000, %l6 = 0000000000000066
	lduba	[%i2+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	%l3 = ffffffffffffff20, %l7 = 00000000000022ff, %l3 = ffffffffffffff20
	sub	%l3,%l7,%l3		! %l3 = ffffffffffffdc21
!	Mem[0000000010041408] = 000000ff00000000, %l6 = 00000000000000ff
	ldx	[%i1+%o4],%l6		! %l6 = 000000ff00000000
!	Mem[0000000010181410] = ff22ffb7, %f10 = ffc4787f
	lda	[%i6+%o5]0x80,%f10	! %f10 = ff22ffb7

p0_label_353:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 73000000, %l0 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l0	! %l0 = 0000000073000000
!	Mem[0000000030181400] = ff8b00ff, %l7 = 00000000000022ff
	swapa	[%i6+%g0]0x89,%l7	! %l7 = 00000000ff8b00ff
!	%f20 = ff00a9df 55000000, Mem[0000000030101400] = ff0000ff ff000000
	stda	%f20,[%i4+%g0]0x81	! Mem[0000000030101400] = ff00a9df 55000000
!	Mem[0000000030081410] = 00a8afff, %l0 = 0000000073000000
	ldstuba	[%i2+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%f6  = 43f05d0f da9f434b, Mem[0000000010141410] = ff00d46d 0055cc43
	std	%f6 ,[%i5+%o5]		! Mem[0000000010141410] = 43f05d0f da9f434b
!	%l3 = ffffffffffffdc21, Mem[00000000201c0000] = 0066a3b0, %asi = 80
	stba	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 2166a3b0
!	%l3 = ffffffffffffdc21, Mem[0000000010181408] = 00000000
	stha	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = dc210000
!	%f28 = 43ccfaf1, Mem[00000000100c140c] = 64b02073
	sta	%f28,[%i3+0x00c]%asi	! Mem[00000000100c140c] = 43ccfaf1
!	%f0  = 000000a8 64b02073, %l1 = 00000000ffffff00
!	Mem[00000000100c1430] = 0000ff00ff000000
	add	%i3,0x030,%g1
	stda	%f0,[%g1+%l1]ASI_PST8_P ! Mem[00000000100c1430] = 0000ff00ff000000
!	%l0 = 000000ff, %l1 = ffffff00, Mem[0000000010001408] = 00000000 00000000
	stda	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000ff ffffff00

p0_label_354:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000055, %l7 = 00000000ff8b00ff
	lduha	[%i5+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = a8000000, %l5 = 0000000000000000
	ldsba	[%i4+%o5]0x81,%l5	! %l5 = ffffffffffffffa8
!	Mem[0000000010141408] = ff000000, %f6  = 43f05d0f
	lda	[%i5+%o4]0x88,%f6 	! %f6 = ff000000
!	Mem[0000000010101400] = 00000000 19ffffff, %l6 = 00000000, %l7 = 00000000
	ldda	[%i4+%g0]0x88,%l6	! %l6 = 0000000019ffffff 0000000000000000
!	Mem[0000000010001430] = 00a8af4f, %l1 = 00000000ffffff00
	lduw	[%i0+0x030],%l1		! %l1 = 0000000000a8af4f
!	Mem[0000000010081428] = 4c83d251, %l3 = ffffffffffffdc21
	ldsh	[%i2+0x028],%l3		! %l3 = 0000000000004c83
!	Mem[0000000010081410] = ffffff20, %l7 = 0000000000000000
	ldsba	[%i2+%o5]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000300c1408] = ff000000, %l6 = 0000000019ffffff
	ldswa	[%i3+%o4]0x89,%l6	! %l6 = ffffffffff000000
!	Mem[00000000211c0000] = 00f15a40, %l1 = 0000000000a8af4f
	ldsh	[%o2+%g0],%l1		! %l1 = 00000000000000f1
!	Mem[0000000030001408] = a6631500, %l4 = 000000004fafa800
	ldsba	[%i0+%o4]0x81,%l4	! %l4 = ffffffffffffffa6

p0_label_355:
!	Starting 10 instruction Store Burst
!	%l6 = ff000000, %l7 = ffffffff, Mem[0000000010001410] = ff000000 00000066
	stda	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = ff000000 ffffffff
!	%l6 = ffffffffff000000, Mem[0000000010141400] = 00000000
	stha	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	Mem[0000000030001408] = 001563a6, %l3 = 0000000000004c83
	ldstuba	[%i0+%o4]0x89,%l3	! %l3 = 00000000000000a6
!	Mem[0000000010041400] = 00000055, %l6 = ffffffffff000000
	ldstuba	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%f11 = 0dcc00ff, Mem[00000000300c1400] = 00000000
	sta	%f11,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0dcc00ff
!	%l5 = ffffffffffffffa8, Mem[0000000010081408] = 6600007300000000
	stxa	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffffffffffffa8
!	%f6  = ff000000 da9f434b, Mem[0000000030101408] = ff00cc0d 64b02073
	stda	%f6 ,[%i4+%o4]0x81	! Mem[0000000030101408] = ff000000 da9f434b
!	%l4 = ffffffffffffffa6, Mem[0000000030181408] = ff000000
	stba	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = ff0000a6
!	%l4 = ffffffa6, %l5 = ffffffa8, Mem[0000000030001400] = 0000ff24 7f78c4ff
	stda	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = ffffffa6 ffffffa8
!	%l7 = ffffffffffffffff, Mem[0000000010181410] = b7ff22ff
	stwa	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffffff

p0_label_356:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ffffffa6ffffffa8, %f16 = a9df0000 000000ff
	ldda	[%i0+%g0]0x81,%f16	! %f16 = ffffffa6 ffffffa8
!	Mem[0000000030081410] = 00a8afff, %l6 = 0000000000000000
	ldswa	[%i2+%o5]0x89,%l6	! %l6 = 0000000000a8afff
!	%l4 = ffffffffffffffa6, %l7 = ffffffffffffffff, %y  = 00000000
	udiv	%l4,%l7,%l2		! %l2 = 0000000000000000
	mov	%l0,%y			! %y = 000000ff
!	Mem[0000000030141408] = c38fdf00 ff000000, %l4 = ffffffa6, %l5 = ffffffa8
	ldda	[%i5+%o4]0x81,%l4	! %l4 = 00000000c38fdf00 00000000ff000000
!	Mem[0000000030041408] = 00000000, %l2 = 0000000000000000
	lduha	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1408] = ffdbd46d, %l2 = 0000000000000000
	ldsba	[%i3+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	%l3 = 00000000000000a6, %l4 = 00000000c38fdf00, %l4 = 00000000c38fdf00
	add	%l3,%l4,%l4		! %l4 = 00000000c38fdfa6
!	%f26 = 4b439fda, %f24 = f1facc43, %f13 = 1c368a02
	fdivs	%f26,%f24,%f13		! %f13 = 98c7ae9e
!	Mem[0000000010041400] = ff000055, %l7 = ffffffffffffffff
	lduha	[%i1+%g0]0x80,%l7	! %l7 = 000000000000ff00
!	Mem[0000000030001410] = ff20b06400000000, %l4 = 00000000c38fdfa6
	ldxa	[%i0+%o5]0x89,%l4	! %l4 = ff20b06400000000

p0_label_357:
!	Starting 10 instruction Store Burst
!	%l4 = ff20b06400000000, Mem[0000000010181408] = dc210000ff22ffb7
	stxa	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = ff20b06400000000
!	%f13 = 98c7ae9e, Mem[0000000030101410] = 000000a8
	sta	%f13,[%i4+%o5]0x89	! Mem[0000000030101410] = 98c7ae9e
!	Mem[00000000100c1410] = 00ffa9df, %l0 = 00000000000000ff
	swapa	[%i3+%o5]0x80,%l0	! %l0 = 0000000000ffa9df
!	Mem[0000000030181410] = c38f6dd4, %l2 = ffffffffffffffff
	ldstuba	[%i6+%o5]0x89,%l2	! %l2 = 00000000000000d4
!	%l4 = ff20b06400000000, Mem[0000000020800040] = ffff4c10
	stb	%l4,[%o1+0x040]		! Mem[0000000020800040] = 00ff4c10
!	%l6 = 0000000000a8afff, Mem[0000000030101400] = ff00a9df55000000
	stxa	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000a8afff
!	Mem[0000000010181410] = ffffffff, %l7 = 000000000000ff00
	swapa	[%i6+%o5]0x80,%l7	! %l7 = 00000000ffffffff
!	%f6  = ff000000, %f16 = ffffffa6, %f0  = 000000a8
	fdivs	%f6 ,%f16,%f0 		! %f0  = ffffffa6
!	Mem[0000000010101410] = c38fdf00, %l5 = 00000000ff000000
	ldstuba	[%i4+%o5]0x88,%l5	! %l5 = 0000000000000000
!	%l2 = 00000000000000d4, Mem[00000000100c141b] = 43ccfaf1, %asi = 80
	stba	%l2,[%i3+0x01b]%asi	! Mem[00000000100c1418] = 43ccfad4

p0_label_358:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ff00000000000000, %l4 = ff20b06400000000
	ldxa	[%i2+%g0]0x81,%l4	! %l4 = ff00000000000000
!	Mem[0000000010141410] = 43f05d0f, %l0 = 0000000000ffa9df
	lduba	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000043
!	Mem[0000000010001408] = 00ffffffff000000, %l0 = 0000000000000043
	ldxa	[%i0+%o4]0x88,%l0	! %l0 = 00ffffffff000000
!	Mem[0000000010181400] = 00ff0000, %l3 = 00000000000000a6
	lduba	[%i6+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101408] = 4b439fda 000000ff, %l0 = ff000000, %l1 = 000000f1
	ldda	[%i4+%o4]0x89,%l0	! %l0 = 00000000000000ff 000000004b439fda
!	Mem[00000000300c1400] = 0dcc00ff, %f21 = 55000000
	lda	[%i3+%g0]0x81,%f21	! %f21 = 0dcc00ff
!	Mem[0000000030081408] = 2a31deff, %f7  = da9f434b
	lda	[%i2+%o4]0x89,%f7 	! %f7 = 2a31deff
!	Mem[00000000100c1408] = ffdbd46d, %l1 = 000000004b439fda
	ldsha	[%i3+%o4]0x80,%l1	! %l1 = ffffffffffffffdb
!	Mem[0000000010041408] = ff000000, %l3 = 0000000000000000
	ldsha	[%i1+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = ffffffff000000ff, %f2  = 00000000 c2dbd46d
	ldda	[%i0+%o5]0x88,%f2 	! %f2  = ffffffff 000000ff

p0_label_359:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1420] = f1facc4300a8af4f, %l6 = 0000000000a8afff, %l4 = ff00000000000000
	add	%i3,0x20,%g1
	casxa	[%g1]0x80,%l6,%l4	! %l4 = f1facc4300a8af4f
!	Mem[0000000030101400] = 00000000, %l1 = ffffffffffffffdb
	ldstuba	[%i4+%g0]0x89,%l1	! %l1 = 0000000000000000
!	%f28 = 43ccfaf1 ff000000, Mem[00000000300c1400] = 0dcc00ff 00ffffff
	stda	%f28,[%i3+%g0]0x81	! Mem[00000000300c1400] = 43ccfaf1 ff000000
!	Mem[0000000030181410] = ff6d8fc3, %l2 = 00000000000000d4
	swapa	[%i6+%o5]0x81,%l2	! %l2 = 00000000ff6d8fc3
!	Mem[0000000030181408] = ff0000a6, %l7 = 00000000ffffffff
	ldstuba	[%i6+%o4]0x89,%l7	! %l7 = 00000000000000a6
!	Mem[00000000100c1419] = 43ccfad4, %l0 = 00000000000000ff
	ldstub	[%i3+0x019],%l0		! %l0 = 00000000000000cc
!	%f14 = 00000000, %f7  = 2a31deff, %f10 = ff22ffb7 0dcc00ff
	fsmuld	%f14,%f7 ,%f10		! %f10 = 00000000 00000000
!	%l7 = 00000000000000a6, Mem[00000000201c0000] = 2166a3b0
	stb	%l7,[%o0+%g0]		! Mem[00000000201c0000] = a666a3b0
!	%l5 = 0000000000000000, Mem[0000000010101408] = b7ff22ff
	stwa	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	%l2 = 00000000ff6d8fc3, Mem[00000000201c0001] = a666a3b0, %asi = 80
	stba	%l2,[%o0+0x001]%asi	! Mem[00000000201c0000] = a6c3a3b0

p0_label_360:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001418] = 0000ff24, %l0 = 00000000000000cc, %asi = 80
	ldswa	[%i0+0x018]%asi,%l0	! %l0 = 000000000000ff24
!	Mem[0000000030081408] = ffde312a f1facc43, %l4 = 00a8af4f, %l5 = 00000000
	ldda	[%i2+%o4]0x81,%l4	! %l4 = 00000000ffde312a 00000000f1facc43
!	Mem[000000001014140a] = 000000ff, %l0 = 000000000000ff24
	ldsh	[%i5+0x00a],%l0		! %l0 = 00000000000000ff
!	Mem[00000000211c0000] = 00f15a40, %l5 = 00000000f1facc43
	lduh	[%o2+%g0],%l5		! %l5 = 00000000000000f1
!	Mem[0000000010141428] = 66220000 ff000000, %l4 = ffde312a, %l5 = 000000f1
	ldd	[%i5+0x028],%l4		! %l4 = 0000000066220000 00000000ff000000
!	Mem[0000000010141408] = 1ccbffda ff000000, %l6 = 00a8afff, %l7 = 000000a6
	ldda	[%i5+%o4]0x88,%l6	! %l6 = 00000000ff000000 000000001ccbffda
!	Mem[00000000211c0000] = 00f15a40, %l4 = 0000000066220000
	ldsh	[%o2+%g0],%l4		! %l4 = 00000000000000f1
!	Mem[0000000020800000] = 008bb9e0, %l4 = 00000000000000f1, %asi = 80
	lduba	[%o1+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001400] = ffffff00, %l3 = 0000000000000000
	lduha	[%i0+%g0]0x80,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010181400] = 00ff0000, %l4 = 0000000000000000
	ldsha	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000000

p0_label_361:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010081410] = ffffff20c38f2266
	stx	%l4,[%i2+%o5]		! Mem[0000000010081410] = 0000000000000000
!	%l4 = 0000000000000000, Mem[00000000100c1410] = ff000000
	stba	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff000000
!	%f6  = ff000000, Mem[0000000010181430] = 6dd4dbc2
	sta	%f6 ,[%i6+0x030]%asi	! Mem[0000000010181430] = ff000000
!	%l1 = 0000000000000000, Mem[0000000010141410] = 0f5df043
	stba	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 0f5df000
!	Mem[0000000030181400] = ff220000 ffccfaf1 ff0000ff c2dbd46d
!	%f0  = ffffffa6 64b02073 ffffffff 000000ff
!	%f4  = 000000ff 24ff0000 ff000000 2a31deff
!	%f8  = 9725ca24 3e295957 00000000 00000000
!	%f12 = 3d5c9877 98c7ae9e 00000000 00000000
	stda	%f0 ,[%i6+%g0]ASI_COMMIT_S	! Block Store to 0000000030181400
	membar	#Sync			! Added by membar checker (63)
!	%f6  = ff000000 2a31deff, Mem[0000000010181410] = 00ff0000 ffffff00
	stda	%f6 ,[%i6+%o5]0x88	! Mem[0000000010181410] = ff000000 2a31deff
!	%l5 = 00000000ff000000, Mem[0000000010041408] = 00000000ff000000
	stxa	%l5,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000ff000000
!	Mem[0000000010081430] = 0000ff00ffffffff, %l7 = 000000001ccbffda, %l6 = 00000000ff000000
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l7,%l6	! %l6 = 0000ff00ffffffff
!	%f20 = ff00a9df, Mem[0000000010081410] = 00000000
	sta	%f20,[%i2+%o5]0x88	! Mem[0000000010081410] = ff00a9df
!	%l0 = 00000000000000ff, Mem[0000000010041400] = ff000055
	stwa	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff

p0_label_362:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000000000000ff, %l6 = 0000ff00ffffffff
	ldxa	[%i2+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181410] = 000000ff, %l2 = 00000000ff6d8fc3
	ldswa	[%i6+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081400] = 00000000, %l6 = 00000000000000ff
	lduba	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l7 = 000000001ccbffda
	ldswa	[%i5+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000218000c0] = 00556b00, %l1 = 0000000000000000
	lduh	[%o3+0x0c0],%l1		! %l1 = 0000000000000055
!	Mem[0000000010001410] = 000000ff, %l2 = 00000000000000ff
	lduba	[%i0+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1400] = f1facc43, %l5 = 00000000ff000000
	lduha	[%i3+%g0]0x89,%l5	! %l5 = 000000000000cc43
!	Mem[0000000010101408] = df0000ff 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000000 00000000df0000ff
!	Mem[00000000100c1410] = 55000000ff000000, %l4 = 0000000000000000
	ldxa	[%i3+%o5]0x88,%l4	! %l4 = 55000000ff000000
!	Mem[0000000010001410] = 000000ff, %f0  = ffffffa6
	lda	[%i0+%o5]0x88,%f0 	! %f0 = 000000ff

p0_label_363:
!	Starting 10 instruction Store Burst
!	Mem[000000001008143c] = 43f05d0f, %l2 = 00000000000000ff, %asi = 80
	swapa	[%i2+0x03c]%asi,%l2	! %l2 = 0000000043f05d0f
!	%l7 = 00000000df0000ff, Mem[0000000010101416] = 00000000, %asi = 80
	stba	%l7,[%i4+0x016]%asi	! Mem[0000000010101414] = 0000ff00
!	%l2 = 0000000043f05d0f, Mem[0000000030081410] = ffafa800
	stha	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 5d0fa800
!	%f10 = 00000000 00000000, Mem[0000000030001410] = 00000000 64b020ff
	stda	%f10,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000 00000000
!	%l2 = 0000000043f05d0f, Mem[0000000030181400] = 7320b064a6ffffff
	stxa	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000000043f05d0f
!	Mem[00000000300c1408] = ff000000, %l0 = 00000000000000ff
	swapa	[%i3+%o4]0x89,%l0	! %l0 = 00000000ff000000
!	%l7 = 00000000df0000ff, Mem[00000000201c0001] = a6c3a3b0
	stb	%l7,[%o0+0x001]		! Mem[00000000201c0000] = a6ffa3b0
!	%f18 = 0507110d 2a31deff, Mem[0000000030101400] = ff000000 00a8afff
	stda	%f18,[%i4+%g0]0x81	! Mem[0000000030101400] = 0507110d 2a31deff
!	%l2 = 43f05d0f, %l3 = 0000ffff, Mem[0000000010101408] = 00000000 df0000ff
	stda	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 43f05d0f 0000ffff
!	%l5 = 000000000000cc43, Mem[0000000010041400] = 000000ff
	stba	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 430000ff

p0_label_364:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ffffffff, %l5 = 000000000000cc43
	ldsba	[%i6+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030081410] = 5d0fa800 00000000, %l6 = 00000000, %l7 = df0000ff
	ldda	[%i2+%o5]0x81,%l6	! %l6 = 000000005d0fa800 0000000000000000
!	Mem[00000000300c1408] = 000000ff, %l7 = 0000000000000000
	lduwa	[%i3+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001418] = 0000ff24, %f19 = 2a31deff
	ld	[%i0+0x018],%f19	! %f19 = 0000ff24
!	Mem[0000000010041408] = ff000000, %l4 = 55000000ff000000
	ldswa	[%i1+%o4]0x88,%l4	! %l4 = ffffffffff000000
!	Mem[0000000010041420] = ffffffff 00ffffff, %l0 = ff000000, %l1 = 00000055, %asi = 80
	ldda	[%i1+0x020]%asi,%l0	! %l0 = 00000000ffffffff 0000000000ffffff
!	Mem[0000000010001408] = ff000000, %l1 = 0000000000ffffff
	ldsba	[%i0+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = ffffff00ffdbd46d, %l1 = 0000000000000000
	ldxa	[%i5+%g0]0x81,%l1	! %l1 = ffffff00ffdbd46d
!	Mem[0000000030001410] = 00000000, %f13 = 98c7ae9e
	lda	[%i0+%o5]0x89,%f13	! %f13 = 00000000
!	Mem[0000000030041408] = 00000000, %l4 = ffffffffff000000
	ldsha	[%i1+%o4]0x81,%l4	! %l4 = 0000000000000000

p0_label_365:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = ffffffff, %l0 = 00000000ffffffff
	ldstuba	[%i2+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	%l2 = 0000000043f05d0f, Mem[00000000300c1408] = ff000000
	stba	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0f000000
!	%l4 = 00000000, %l5 = ffffffff, Mem[00000000300c1408] = 0f000000 f1faccff
	stda	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000 ffffffff
!	%f24 = f1facc43, Mem[0000000030141408] = c38fdf00
	sta	%f24,[%i5+%o4]0x81	! Mem[0000000030141408] = f1facc43
!	Mem[00000000100c1404] = 0dcc00ff, %l1 = ffdbd46d, %l0 = 000000ff
	add	%i3,0x04,%g1
	casa	[%g1]0x80,%l1,%l0	! %l0 = 000000000dcc00ff
!	%l0 = 0dcc00ff, %l1 = ffdbd46d, Mem[00000000300c1410] = 00000066 0000807f
	stda	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0dcc00ff ffdbd46d
!	%l0 = 0dcc00ff, %l1 = ffdbd46d, Mem[00000000300c1410] = 0dcc00ff ffdbd46d
	stda	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0dcc00ff ffdbd46d
!	%f3  = 000000ff, Mem[0000000030001400] = a6ffffff
	sta	%f3 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff
!	Mem[0000000010101404] = 00000000, %l5 = 00000000ffffffff, %asi = 80
	swapa	[%i4+0x004]%asi,%l5	! %l5 = 0000000000000000
!	%l6 = 5d0fa800, %l7 = 000000ff, Mem[0000000010101438] = fffacc43 f1facc43
	std	%l6,[%i4+0x038]		! Mem[0000000010101438] = 5d0fa800 000000ff

p0_label_366:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 0000ff24 ff000000, %l2 = 43f05d0f, %l3 = 0000ffff
	ldda	[%i1+%o5]0x89,%l2	! %l2 = 00000000ff000000 000000000000ff24
!	Mem[0000000010041428] = ffc4787f51d2834c, %l0 = 000000000dcc00ff
	ldx	[%i1+0x028],%l0		! %l0 = ffc4787f51d2834c
!	%l3 = 000000000000ff24, imm = 000000000000013f, %l4 = 0000000000000000
	xor	%l3,0x13f,%l4		! %l4 = 000000000000fe1b
!	Mem[000000001010143d] = 000000ff, %l0 = ffc4787f51d2834c
	ldub	[%i4+0x03d],%l0		! %l0 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l5 = 0000000000000000
	ldsba	[%i3+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001400] = a8ffffff 000000ff, %l4 = 0000fe1b, %l5 = 00000000
	ldda	[%i0+%g0]0x89,%l4	! %l4 = 00000000000000ff 00000000a8ffffff
!	Mem[0000000010001410] = ffffffff000000ff, %f16 = ffffffa6 ffffffa8
	ldda	[%i0+%o5]0x88,%f16	! %f16 = ffffffff 000000ff
!	Mem[0000000010001430] = 00a8af4f, %l3 = 000000000000ff24, %asi = 80
	lduwa	[%i0+0x030]%asi,%l3	! %l3 = 0000000000a8af4f
!	Mem[0000000010181438] = 000000ff00000000, %l7 = 00000000000000ff
	ldx	[%i6+0x038],%l7		! %l7 = 000000ff00000000
!	Mem[0000000010141400] = 73ffb06400000000, %l1 = ffffff00ffdbd46d
	ldxa	[%i5+%g0]0x88,%l1	! %l1 = 73ffb06400000000

p0_label_367:
!	Starting 10 instruction Store Burst
!	Mem[0000000020800040] = 00ff4c10, %l0 = 0000000000000000
	ldstuba	[%o1+0x040]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181408] = ffffffff, %l4 = 00000000000000ff
	ldstuba	[%i6+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%f8  = 9725ca24 3e295957, %l4 = 00000000000000ff
!	Mem[0000000010101418] = 0dcc853764b020ff
	add	%i4,0x018,%g1
	stda	%f8,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010101418] = 5759293e24ca2597
!	Mem[0000000030141408] = f1facc43, %l6 = 000000005d0fa800
	ldstuba	[%i5+%o4]0x81,%l6	! %l6 = 00000000000000f1
!	Mem[00000000100c1410] = ff000000, %l7 = 000000ff00000000
	ldstuba	[%i3+%o5]0x88,%l7	! %l7 = 0000000000000000
!	%f17 = 000000ff, Mem[00000000300c1410] = 0dcc00ff
	sta	%f17,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000ff
!	%f18 = 0507110d 0000ff24, %l6 = 00000000000000f1
!	Mem[00000000100c1430] = 0000ff00ff000000
	add	%i3,0x030,%g1
	stda	%f18,[%g1+%l6]ASI_PST16_PL ! Mem[00000000100c1430] = 24ffff00ff000000
!	Mem[0000000010041400] = ff000043, %l5 = 00000000a8ffffff
	ldstuba	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000043
!	%l7 = 0000000000000000, Mem[0000000010081400] = 00000000
	stha	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	Mem[0000000030141410] = 00000055, %l0 = 0000000000000000
	ldstuba	[%i5+%o5]0x81,%l0	! %l0 = 0000000000000000

p0_label_368:
!	Starting 10 instruction Load Burst
!	%l6 = 00000000000000f1, imm = fffffffffffff8c1, %l5 = 0000000000000043
	orn	%l6,-0x73f,%l5		! %l5 = 00000000000007ff
!	Mem[0000000010041400] = ff0000ff, %l5 = 00000000000007ff
	ldswa	[%i1+%g0]0x80,%l5	! %l5 = ffffffffff0000ff
!	Mem[0000000010081410] = dfa900ff, %l4 = 00000000000000ff
	lduwa	[%i2+%o5]0x80,%l4	! %l4 = 00000000dfa900ff
!	%l7 = 0000000000000000, %l1 = 73ffb06400000000, %l7 = 0000000000000000
	addc	%l7,%l1,%l7		! %l7 = 73ffb06400000000
!	%f6  = ff000000, %f5  = 24ff0000, %f18 = 0507110d
	fmuls	%f6 ,%f5 ,%f18		! %f18 = e47f0000
!	%f31 = ff000000, %f19 = 0000ff24, %f6  = ff000000
	fdivs	%f31,%f19,%f6 		! %f6  = ff800000
	membar	#Sync			! Added by membar checker (64)
!	Mem[0000000010041400] = ff0000ff dfa900ff 000000ff 00000000
!	Mem[0000000010041410] = 4fafa800 00000000 43f05d0f ffffffff
!	Mem[0000000010041420] = ffffffff 00ffffff ffc4787f 51d2834c
!	Mem[0000000010041430] = 3d5c9877 1c368a02 00000000 00000000
	ldda	[%i1+%g0]ASI_BLK_PL,%f0 	! Block Load from 0000000010041400
!	Mem[0000000030001410] = 00000000, %l3 = 0000000000a8af4f
	ldsba	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = ffffff00 ffdbd46d 000000ff ffffff00
!	Mem[0000000010001410] = ff000000 ffffffff 0000ff24 ff000000
!	Mem[0000000010001420] = 6dd4dbc2 0000ffff 000000ff 24ff0000
!	Mem[0000000010001430] = 00a8af4f 000000ff 1c360000 f1ffcc43
	ldda	[%i0+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010001400
!	Mem[0000000010141400] = 00000000 64b0ff73 000000ff daffcb1c
!	Mem[0000000010141410] = 00f05d0f da9f434b 20ef580a 00000980
!	Mem[0000000010141420] = 00000000 000000ff 66220000 ff000000
!	Mem[0000000010141430] = 0000001c ffffffff 4fafa800 e23b3a56
	ldda	[%i5+%g0]ASI_BLK_PL,%f16	! Block Load from 0000000010141400

p0_label_369:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000f1, Mem[00000000300c1408] = 00000000
	stwa	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000f1
!	%l1 = 73ffb06400000000, Mem[0000000010081410] = dfa900ff
	stwa	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	Mem[0000000020800001] = 008bb9e0, %l1 = 73ffb06400000000
	ldstub	[%o1+0x001],%l1		! %l1 = 000000000000008b
!	Mem[0000000010041437] = 1c368a02, %l7 = 73ffb06400000000
	ldstub	[%i1+0x037],%l7		! %l7 = 0000000000000002
!	%l7 = 0000000000000002, Mem[0000000020800040] = ffff4c10, %asi = 80
	stha	%l7,[%o1+0x040]%asi	! Mem[0000000020800040] = 00024c10
!	Mem[0000000010081428] = 4c83d25100ffffff, %l6 = 00000000000000f1, %l5 = ffffffffff0000ff
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l6,%l5	! %l5 = 4c83d25100ffffff
	membar	#Sync			! Added by membar checker (65)
!	%l2 = ff000000, %l3 = 00000000, Mem[0000000010141410] = 00f05d0f da9f434b
	stda	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = ff000000 00000000
!	%l1 = 000000000000008b, Mem[0000000010101438] = 5d0fa800000000ff
	stx	%l1,[%i4+0x038]		! Mem[0000000010101438] = 000000000000008b
!	Mem[0000000010181400] = 0000ff00, %l4 = 00000000dfa900ff, %asi = 80
	swapa	[%i6+0x000]%asi,%l4	! %l4 = 000000000000ff00
!	%f18 = 1ccbffda ff000000, Mem[0000000010101418] = 5759293e 24ca2597, %asi = 80
	stda	%f18,[%i4+0x018]%asi	! Mem[0000000010101418] = 1ccbffda ff000000

p0_label_370:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00f15a40, %l5 = 4c83d25100ffffff, %asi = 80
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 00000000000000f1
!	Mem[0000000030141400] = ffffff00 ffdbd46d fffacc43 ff000000
!	Mem[0000000030141410] = ff000055 00000066 0000ff24 ff000000
!	Mem[0000000030141420] = 6dd4dbc2 00000000 da9f434b 00ff0019
!	Mem[0000000030141430] = 00a8af4f 000000ff 1c360000 00a8af4f
	ldda	[%i5+%g0]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030141400
!	Mem[0000000010041400] = ff00a9dfff0000ff, %l3 = 0000000000000000
	ldxa	[%i1+%g0]0x88,%l3	! %l3 = ff00a9dfff0000ff
!	Mem[000000001000141a] = 0000ff24, %l4 = 000000000000ff00, %asi = 80
	ldsba	[%i0+0x01a]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030001408] = ff63150000000000, %f0  = ff00a9df ff0000ff
	ldda	[%i0+%o4]0x81,%f0 	! %f0  = ff631500 00000000
!	Mem[0000000010081408] = ffffffff, %l7 = 0000000000000002
	lduwa	[%i2+%o4]0x80,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000030001400] = 000000ff, %l6 = 00000000000000f1
	ldswa	[%i0+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041410] = ff000000, %l2 = 00000000ff000000
	lduba	[%i1+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101400] = ffffff19, %l1 = 000000000000008b
	ldswa	[%i4+%g0]0x80,%l1	! %l1 = ffffffffffffff19
!	Mem[0000000010081400] = 00000000 ffdbd437, %l0 = 00000000, %l1 = ffffff19
	ldda	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000 00000000ffdbd437

p0_label_371:
!	Starting 10 instruction Store Burst
!	%l4 = ffffffff, %l5 = 000000f1, Mem[00000000100c1400] = 64b02073 ff00cc0d
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffff 000000f1
!	Mem[0000000030001408] = ff631500, %l0 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081400] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000000
!	%l6 = 00000000000000ff, Mem[0000000010081408] = ffffffff
	stha	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 00ffffff
!	%f17 = 00ffffff, Mem[0000000030101410] = 98c7ae9e
	sta	%f17,[%i4+%o5]0x89	! Mem[0000000030101410] = 00ffffff
!	%l4 = ffffffff, %l5 = 000000f1, Mem[0000000010001408] = 000000ff ffffff00
	stda	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = ffffffff 000000f1
!	Mem[0000000010101408] = 0f5df043, %l5 = 00000000000000f1
	swapa	[%i4+%o4]0x80,%l5	! %l5 = 000000000f5df043
!	Mem[0000000010001410] = 000000ff, %l7 = 00000000ffffffff
	swapa	[%i0+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[0000000030181410] = 000000ff
	stba	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = ff0000ff
!	%f28 = ff000000 4fafa800, Mem[0000000030041400] = a8000000 7320b064
	stda	%f28,[%i1+%g0]0x89	! Mem[0000000030041400] = ff000000 4fafa800

p0_label_372:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 00024c10, %l1 = 00000000ffdbd437
	lduh	[%o1+0x040],%l1		! %l1 = 0000000000000002
!	Mem[00000000100c1400] = ffffffff, %l0 = 00000000000000ff
	lduwa	[%i3+%g0]0x80,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000010181408] = 64b020ff, %l5 = 000000000f5df043
	lduba	[%i6+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041408] = 00000000ff000000, %l4 = ffffffffffffffff
	ldxa	[%i1+%o4]0x88,%l4	! %l4 = 00000000ff000000
!	Code Fragment 3, seed = 865156
p0_fragment_28:
!	%l0 = 00000000ffffffff
	setx	0xeca7c519282ca006,%g7,%l0 ! %l0 = eca7c519282ca006
!	%l1 = 0000000000000002
	setx	0x3b558f15a50fce31,%g7,%l1 ! %l1 = 3b558f15a50fce31
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = eca7c519282ca006
	setx	0x35de4fd5aec7406c,%g7,%l0 ! %l0 = 35de4fd5aec7406c
!	%l1 = 3b558f15a50fce31
	setx	0x69aa3ca3757cf9b7,%g7,%l1 ! %l1 = 69aa3ca3757cf9b7
p0_fragment_28_end:
!	Mem[0000000010081400] = ff000000, %l6 = 00000000000000ff
	ldswa	[%i2+%g0]0x80,%l6	! %l6 = ffffffffff000000
!	Mem[0000000020800000] = 00ffb9e0, %l0 = 35de4fd5aec7406c
	ldsb	[%o1+%g0],%l0		! %l0 = 0000000000000000
!	Mem[0000000010141410] = 00000000 000000ff, %l6 = ff000000, %l7 = 000000ff
	ldda	[%i5+%o5]0x88,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Mem[00000000300c1408] = f1000000, %l4 = 00000000ff000000
	ldsha	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101410] = 00ffffff, %l3 = ff00a9dfff0000ff
	lduha	[%i4+%o5]0x89,%l3	! %l3 = 000000000000ffff

p0_label_373:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000030041408] = 00000000
	stba	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = ff000000
!	Mem[00000000300c1400] = 43ccfaf1, %l3 = 000000000000ffff
	swapa	[%i3+%g0]0x81,%l3	! %l3 = 0000000043ccfaf1
!	Mem[00000000300c1400] = 0000ffff ff000000 000000f1 ffffffff
!	%f0  = ff631500 00000000 00000000 ff000000
!	%f4  = 00000000 00a8af4f ffffffff 0f5df043
!	%f8  = ffffff00 ffffffff 4c83d251 7f78c4ff
!	%f12 = 028a361c 77985c3d 00000000 00000000
	stda	%f0 ,[%i3+%g0]ASI_BLK_AIUS	! Block Store to 00000000300c1400
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000030101408] = 000000ff 4b439fda
	stda	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 000000ff
!	%f22 = 000000ff, Mem[0000000030041400] = 00a8af4f
	sta	%f22,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff
!	Mem[00000000100c1400] = ffffffff f1000000 ffdbd46d 43ccfaf1
	membar	#Sync			! Added by membar checker (66)
!	%f0  = ff631500 00000000 00000000 ff000000
!	%f4  = 00000000 00a8af4f ffffffff 0f5df043
!	%f8  = ffffff00 ffffffff 4c83d251 7f78c4ff
!	%f12 = 028a361c 77985c3d 00000000 00000000
	stda	%f0 ,[%i3+%g0]ASI_BLK_AIUP	! Block Store to 00000000100c1400
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000010181400] = dfa900ff ff000000
	stda	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 000000ff
!	%f28 = ff000000, Mem[00000000300c1400] = 001563ff
	sta	%f28,[%i3+%g0]0x89	! Mem[00000000300c1400] = ff000000
!	Mem[0000000030181408] = ffffffff, %l6 = 00000000000000ff
	ldstuba	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%l2 = 00000000, %l3 = 43ccfaf1, Mem[0000000030041408] = 000000ff 6dd4dbc2
	stda	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000 43ccfaf1

p0_label_374:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00f15a40, %l6 = 00000000000000ff, %asi = 80
	lduha	[%o2+0x000]%asi,%l6	! %l6 = 00000000000000f1
!	Mem[0000000030081408] = 2a31deff, %l2 = 0000000000000000
	ldswa	[%i2+%o4]0x89,%l2	! %l2 = 000000002a31deff
!	Mem[0000000010181408] = ff20b064, %l1 = 69aa3ca3757cf9b7
	ldsba	[%i6+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030141400] = ffffff00ffdbd46d, %f28 = ff000000 4fafa800
	ldda	[%i5+%g0]0x81,%f28	! %f28 = ffffff00 ffdbd46d
!	Mem[0000000030181410] = ff0000ff, %l4 = 0000000000000000
	lduha	[%i6+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141430] = 0000001cffffffff, %f16 = 6dd4dbff 00ffffff, %asi = 80
	ldda	[%i5+0x030]%asi,%f16	! %f16 = 0000001c ffffffff
	membar	#Sync			! Added by membar checker (67)
!	Mem[00000000100c1400] = 001563ff, %l2 = 000000002a31deff
	ldswa	[%i3+%g0]0x88,%l2	! %l2 = 00000000001563ff
!	Mem[0000000030101400] = 0d110705, %l6 = 00000000000000f1
	lduwa	[%i4+%g0]0x89,%l6	! %l6 = 000000000d110705
!	Mem[00000000300c1400] = ff000000, %l0 = 0000000000000000
	lduwa	[%i3+%g0]0x89,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030081400] = 000000ff, %l7 = 0000000000000000
	ldsha	[%i2+%g0]0x89,%l7	! %l7 = 00000000000000ff

p0_label_375:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000010041400] = ff0000ff
	stba	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = ff0000ff
!	%l0 = 00000000ff000000, Mem[0000000010141410] = 000000ff
	stba	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	Mem[0000000010041408] = 000000ff, %l0 = 00000000ff000000
	swapa	[%i1+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081408] = 2a31deff, %l1 = ffffffffffffffff
	ldstuba	[%i2+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%f13 = 77985c3d, Mem[0000000030181408] = ffffffff
	sta	%f13,[%i6+%o4]0x81	! Mem[0000000030181408] = 77985c3d
!	Mem[0000000030181410] = ff0000ff, %l7 = 00000000000000ff
	ldstuba	[%i6+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141408] = fffacc43, %l4 = 00000000000000ff
	swapa	[%i5+%o4]0x81,%l4	! %l4 = 00000000fffacc43
!	Mem[0000000010141408] = ff000000, %l1 = 00000000000000ff
	ldstuba	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000000
!	%l4 = 00000000fffacc43, Mem[0000000021800140] = 0000db60, %asi = 80
	stha	%l4,[%o3+0x140]%asi	! Mem[0000000021800140] = cc43db60
!	%l2 = 00000000001563ff, Mem[0000000010041408] = ff000000
	stha	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 63ff0000

p0_label_376:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ff000000, %l0 = 00000000000000ff
	ldsha	[%i0+%g0]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000030141410] = 550000ff, %l5 = 00000000000000ff
	ldsha	[%i5+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1410] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001408] = ff631500, %l7 = 0000000000000000
	ldsha	[%i0+%o4]0x81,%l7	! %l7 = ffffffffffffff63
!	Mem[0000000010041400] = ff0000ff, %l7 = ffffffffffffff63
	lduwa	[%i1+%g0]0x88,%l7	! %l7 = 00000000ff0000ff
!	Mem[0000000021800040] = ffffeaa0, %l5 = 00000000000000ff, %asi = 80
	lduha	[%o3+0x040]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000020800000] = 00ffb9e0, %l7 = 00000000ff0000ff
	ldsh	[%o1+%g0],%l7		! %l7 = 00000000000000ff
!	%f20 = 66000000, %f27 = 4b439fda, %f4  = 00000000
	fmuls	%f20,%f27,%f4 		! %f4  = 71c39fda
!	Mem[0000000010141408] = 1ccbffdaff0000ff, %f28 = ffffff00 ffdbd46d
	ldda	[%i5+%o4]0x88,%f28	! %f28 = 1ccbffda ff0000ff
!	Mem[0000000010141418] = 20ef580a00000980, %f10 = 4c83d251 7f78c4ff
	ldd	[%i5+0x018],%f10	! %f10 = 20ef580a 00000980

p0_label_377:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000030181408] = 77985c3d
	stba	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = ff985c3d
!	Mem[00000000100c1418] = ffffffff, %l7 = 00000000000000ff, %asi = 80
	swapa	[%i3+0x018]%asi,%l7	! %l7 = 00000000ffffffff
!	%l5 = 000000000000ffff, Mem[00000000300c1400] = ff000000
	stba	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = ff0000ff
!	%l4 = 00000000fffacc43, Mem[0000000030001408] = 001563ff
	stba	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 00156343
!	Mem[00000000100c1408] = 00000000, %l6 = 000000000d110705
	ldstuba	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000010181400] = 00000000
	stba	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	%l2 = 00000000001563ff, Mem[0000000010081408] = 00ffffffffffffa8
	stx	%l2,[%i2+%o4]		! Mem[0000000010081408] = 00000000001563ff
!	Mem[0000000010001400] = ffffff00, %l7 = 00000000ffffffff
	ldstuba	[%i0+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	%l0 = ffffffffffffff00, Mem[0000000030181410] = 0000ff24ff0000ff
	stxa	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = ffffffffffffff00
!	%f28 = 1ccbffda ff0000ff, %l7 = 00000000000000ff
!	Mem[0000000030081430] = 3d5c98771c368a02
	add	%i2,0x030,%g1
	stda	%f28,[%g1+%l7]ASI_PST32_SL ! Mem[0000000030081430] = ff0000ffdaffcb1c

p0_label_378:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ffffffff, %l2 = 00000000001563ff
	ldsha	[%i0+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010041410] = 0000000000a8af4f, %l2 = ffffffffffffffff
	ldxa	[%i1+%o5]0x88,%l2	! %l2 = 0000000000a8af4f
!	Mem[0000000010001430] = 00a8af4f000000ff, %l6 = 0000000000000000
	ldx	[%i0+0x030],%l6		! %l6 = 00a8af4f000000ff
!	Mem[0000000010141400] = 00000000, %l6 = 00a8af4f000000ff
	ldswa	[%i5+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141400] = 00ffffff, %l1 = 0000000000000000
	lduwa	[%i5+%g0]0x89,%l1	! %l1 = 0000000000ffffff
!	Mem[0000000010141410] = 00000000, %f31 = 0000361c
	lda	[%i5+%o5]0x80,%f31	! %f31 = 00000000
!	%l7 = 00000000000000ff, %l4 = 00000000fffacc43, %l5 = 000000000000ffff
	xnor	%l7,%l4,%l5		! %l5 = ffffffff00053343
!	Mem[0000000010101410] = ffdf8fc30000ff00, %l1 = 0000000000ffffff
	ldxa	[%i4+%o5]0x80,%l1	! %l1 = ffdf8fc30000ff00
!	Mem[0000000010141408] = ff0000ffdaffcb1c, %f30 = 4fafa800 00000000
	ldd	[%i5+%o4],%f30		! %f30 = ff0000ff daffcb1c
!	Mem[0000000030081408] = 2a31deff, %f23 = 24ff0000
	lda	[%i2+%o4]0x89,%f23	! %f23 = 2a31deff

p0_label_379:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000030141408] = ff000000 000000ff
	stda	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000 000000ff
!	Mem[0000000030001400] = ff000000, %l3 = 0000000043ccfaf1
	swapa	[%i0+%g0]0x81,%l3	! %l3 = 00000000ff000000
!	%f10 = 20ef580a 00000980, Mem[0000000030101408] = 00000000 ff000000
	stda	%f10,[%i4+%o4]0x81	! Mem[0000000030101408] = 20ef580a 00000980
!	%l2 = 0000000000a8af4f, Mem[0000000030081410] = 5d0fa80000000000
	stxa	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000000000a8af4f
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010181438] = 000000ff 00000000
	std	%l6,[%i6+0x038]		! Mem[0000000010181438] = 00000000 000000ff
!	Mem[0000000030041408] = 00000000, %l2 = 0000000000a8af4f
	swapa	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000
!	%f0  = ff631500 00000000, Mem[0000000010001438] = 1c360000 f1ffcc43
	std	%f0 ,[%i0+0x038]	! Mem[0000000010001438] = ff631500 00000000
!	%l2 = 0000000000000000, Mem[00000000300c1408] = 00000000ff000000
	stxa	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000000000000
!	%f22 = 000000ff, Mem[0000000010041410] = 4fafa800
	sta	%f22,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000ff
!	%f18 = 000000ff, %f22 = 000000ff, %f8  = ffffff00
	fmuls	%f18,%f22,%f8 		! %f8  = 00000000

p0_label_380:
!	Starting 10 instruction Load Burst
!	%l4 = 00000000fffacc43, imm = 0000000000000e60, %l3 = 00000000ff000000
	or	%l4,0xe60,%l3		! %l3 = 00000000ffface63
!	%l5 = ffffffff00053343, imm = fffffffffffff268, %l3 = 00000000ffface63
	add	%l5,-0xd98,%l3		! %l3 = ffffffff000525ab
!	Mem[0000000010141410] = 0000000000000000, %f8  = 00000000 ffffffff
	ldda	[%i5+%o5]0x80,%f8 	! %f8  = 00000000 00000000
!	Mem[0000000010001413] = ffffffff, %l6 = 0000000000000000
	ldub	[%i0+0x013],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030041408] = 4fafa800, %l3 = ffffffff000525ab
	lduha	[%i1+%o4]0x89,%l3	! %l3 = 000000000000a800
!	Mem[0000000010101400] = ffffff19, %l2 = 0000000000000000
	lduwa	[%i4+%g0]0x80,%l2	! %l2 = 00000000ffffff19
!	Mem[0000000030081400] = ff00000000000000, %l3 = 000000000000a800
	ldxa	[%i2+%g0]0x81,%l3	! %l3 = ff00000000000000
!	Mem[0000000010001418] = 0000ff24ff000000, %f30 = ff0000ff daffcb1c
	ldd	[%i0+0x018],%f30	! %f30 = 0000ff24 ff000000
!	Mem[0000000020800000] = 00ffb9e0, %l0 = ffffffffffffff00, %asi = 80
	lduha	[%o1+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101430] = 1ccbffda, %f13 = 77985c3d
	lda	[%i4+0x030]%asi,%f13	! %f13 = 1ccbffda

p0_label_381:
!	Starting 10 instruction Store Burst
!	%f7  = 0f5df043, Mem[0000000030081410] = 00000000
	sta	%f7 ,[%i2+%o5]0x89	! Mem[0000000030081410] = 0f5df043
!	%l4 = 00000000fffacc43, Mem[0000000030081400] = ff000000
	stha	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = cc430000
!	Mem[0000000021800181] = ffff4d90, %l2 = 00000000ffffff19
	ldstuba	[%o3+0x181]%asi,%l2	! %l2 = 00000000000000ff
!	%l0 = 000000ff, %l1 = 0000ff00, Mem[0000000010181428] = ff000000 ff0000ff, %asi = 80
	stda	%l0,[%i6+0x028]%asi	! Mem[0000000010181428] = 000000ff 0000ff00
!	Mem[00000000100c1410] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i3+%o5]0x88,%l7	! %l7 = 0000000000000000
!	%l3 = ff00000000000000, Mem[0000000010081408] = 00000000
	stba	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	%f8  = 00000000, %f7  = 0f5df043
	fcmpes	%fcc0,%f8 ,%f7 		! %fcc0 = 1
!	%l5 = ffffffff00053343, Mem[000000001004142f] = 51d2834c
	stb	%l5,[%i1+0x02f]		! Mem[000000001004142c] = 51d28343
!	Mem[0000000010181400] = 00000000, %l7 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800041] = 00024c10, %l1 = ffdf8fc30000ff00
	ldstuba	[%o1+0x041]%asi,%l1	! %l1 = 0000000000000002

p0_label_382:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 000000ff, %l1 = 0000000000000002
	ldswa	[%i3+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141400] = 00000000, %l6 = 00000000000000ff
	lduba	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181400] = 00000000000000ff, %f20 = 66000000 550000ff
	ldda	[%i6+%g0]0x80,%f20	! %f20 = 00000000 000000ff
!	Mem[00000000201c0000] = a6ffa3b0, %l4 = 00000000fffacc43, %asi = 80
	lduba	[%o0+0x000]%asi,%l4	! %l4 = 00000000000000a6
!	Mem[0000000010141404] = 64b0ff73, %l3 = ff00000000000000
	ldsw	[%i5+0x004],%l3		! %l3 = 0000000064b0ff73
!	Mem[0000000030001400] = a8ffffff f1facc43, %l4 = 000000a6, %l5 = 00053343
	ldda	[%i0+%g0]0x89,%l4	! %l4 = 00000000f1facc43 00000000a8ffffff
!	Mem[0000000010181420] = 000000ff00000000, %f2  = 00000000 ff000000
	ldd	[%i6+0x020],%f2 	! %f2  = 000000ff 00000000
!	Mem[0000000030081410] = 43f05d0f, %l7 = 0000000000000000
	lduha	[%i2+%o5]0x81,%l7	! %l7 = 00000000000043f0
!	Mem[0000000010141404] = 64b0ff73, %f10 = 20ef580a
	ld	[%i5+0x004],%f10	! %f10 = 64b0ff73
	membar	#Sync			! Added by membar checker (68)
!	Mem[0000000010041400] = ff0000ff dfa900ff 63ff0000 00000000
!	Mem[0000000010041410] = 000000ff 00000000 43f05d0f ffffffff
!	Mem[0000000010041420] = ffffffff 00ffffff ffc4787f 51d28343
!	Mem[0000000010041430] = 3d5c9877 1c368aff 00000000 00000000
	ldda	[%i1+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010041400

p0_label_383:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000064b0ff73, Mem[0000000010101408] = 000000f1
	stwa	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = 64b0ff73
!	%l0 = 000000ff, %l1 = 000000ff, Mem[0000000010181410] = 2a31deff ff000000
	stda	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff 000000ff
!	Mem[0000000030181400] = 0f5df043 00000000 ff985c3d 000000ff
!	%f0  = ff631500 00000000 000000ff 00000000
!	%f4  = 71c39fda 00a8af4f ffffffff 0f5df043
!	%f8  = 00000000 00000000 64b0ff73 00000980
!	%f12 = 028a361c 1ccbffda 00000000 00000000
	stda	%f0 ,[%i6+%g0]ASI_BLK_S	! Block Store to 0000000030181400
!	%l2 = 00000000000000ff, Mem[0000000030001400] = 43ccfaf1ffffffa8
	stxa	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000000000ff
	membar	#Sync			! Added by membar checker (69)
!	Mem[0000000030181410] = 71c39fda, %l0 = 00000000000000ff
	swapa	[%i6+%o5]0x81,%l0	! %l0 = 0000000071c39fda
!	Mem[00000000211c0001] = 00f15a40, %l6 = 0000000000000000
	ldstub	[%o2+0x001],%l6		! %l6 = 00000000000000f1
!	Mem[0000000030101410] = 00ffffff, %l2 = 00000000000000ff
	lduwa	[%i4+%o5]0x89,%l2	! %l2 = 0000000000ffffff
!	%l5 = 00000000a8ffffff, Mem[0000000010081422] = 0000faff, %asi = 80
	stha	%l5,[%i2+0x022]%asi	! Mem[0000000010081420] = 0000ffff
!	Mem[0000000010041404] = dfa900ff, %l5 = 00000000a8ffffff
	swap	[%i1+0x004],%l5		! %l5 = 00000000dfa900ff
!	%l0 = 0000000071c39fda, Mem[0000000030141400] = ffffff00
	stba	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = daffff00

p0_label_384:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00000000, %l0 = 0000000071c39fda
	ldsha	[%i6+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041408] = 00000000 0000ff63, %l2 = 00ffffff, %l3 = 64b0ff73
	ldda	[%i1+%o4]0x88,%l2	! %l2 = 000000000000ff63 0000000000000000
!	Mem[00000000100c1400] = ff631500, %l4 = 00000000f1facc43
	lduha	[%i3+%g0]0x80,%l4	! %l4 = 000000000000ff63
!	Mem[0000000010101408] = 64b0ff73, %f25 = ffffffff
	lda	[%i4+%o4]0x80,%f25	! %f25 = 64b0ff73
	membar	#Sync			! Added by membar checker (70)
!	Mem[0000000030181400] = ff631500 00000000 000000ff 00000000
!	Mem[0000000030181410] = 000000ff 00a8af4f ffffffff 0f5df043
!	Mem[0000000030181420] = 00000000 00000000 64b0ff73 00000980
!	Mem[0000000030181430] = 028a361c 1ccbffda 00000000 00000000
	ldda	[%i6+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030181400
!	Mem[0000000030181408] = 000000ff00000000, %f8  = 00000000 00000000
	ldda	[%i6+%o4]0x81,%f8 	! %f8  = 000000ff 00000000
!	%f1  = 00000000, %f14 = 00000000
	fsqrts	%f1 ,%f14		! %f14 = 00000000
!	Mem[0000000010081400] = ff000000, %l2 = 000000000000ff63
	ldswa	[%i2+%g0]0x80,%l2	! %l2 = ffffffffff000000
!	Mem[0000000030041410] = 0000ff24ff000000, %l2 = ffffffffff000000
	ldxa	[%i1+%o5]0x89,%l2	! %l2 = 0000ff24ff000000
!	Mem[0000000030181400] = ff631500 00000000 000000ff 00000000
!	Mem[0000000030181410] = 000000ff 00a8af4f ffffffff 0f5df043
!	Mem[0000000030181420] = 00000000 00000000 64b0ff73 00000980
!	Mem[0000000030181430] = 028a361c 1ccbffda 00000000 00000000
	ldda	[%i6+%g0]ASI_BLK_AIUS,%f16	! Block Load from 0000000030181400

p0_label_385:
!	Starting 10 instruction Store Burst
!	%l2 = 0000ff24ff000000, Mem[0000000030041408] = 4fafa800
	stba	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 4fafa800
!	Mem[00000000100c1410] = ff000000, %l3 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l3	! %l3 = 00000000ff000000
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000010181420] = 000000ff 00000000, %asi = 80
	stda	%l0,[%i6+0x020]%asi	! Mem[0000000010181420] = 00000000 000000ff
!	%f25 = 00000000, Mem[0000000010101408] = 73ffb064
	sta	%f25,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	Mem[00000000300c1400] = ff0000ff, %l4 = 000000000000ff63
	swapa	[%i3+%g0]0x89,%l4	! %l4 = 00000000ff0000ff
!	Mem[0000000010141420] = 00000000000000ff, %l4 = 00000000ff0000ff, %l0 = 0000000000000000
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l4,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141410] = 00000000, %l6 = 00000000000000f1
	swapa	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000
!	%f18 = 000000ff 00000000, Mem[00000000100c1410] = 00000000 00a8af4f, %asi = 80
	stda	%f18,[%i3+0x010]%asi	! Mem[00000000100c1410] = 000000ff 00000000
!	%l1 = 00000000000000ff, Mem[0000000010181400] = ff00000000000000
	stxa	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000000000ff
!	%f10 = 64b0ff73 00000980, %l1 = 00000000000000ff
!	Mem[0000000010141430] = 0000001cffffffff
	add	%i5,0x030,%g1
	stda	%f10,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010141430] = 8009000073ffb064

p0_label_386:
!	Starting 10 instruction Load Burst
!	Mem[000000001010143c] = 0000008b, %l1 = 00000000000000ff
	ldsb	[%i4+0x03c],%l1		! %l1 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l1 = 0000000000000000
	lduwa	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000000
!	%f21 = 00a8af4f, %f3  = 00000000
	fcmps	%fcc1,%f21,%f3 		! %fcc1 = 2
!	Mem[000000001018142d] = 0000ff00, %l2 = 0000ff24ff000000, %asi = 80
	ldsba	[%i6+0x02d]%asi,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (71)
!	Mem[00000000300c1400] = 63ff0000 00000000 00000000 00000000
!	Mem[00000000300c1410] = 00000000 00a8af4f ffffffff 0f5df043
!	Mem[00000000300c1420] = ffffff00 ffffffff 4c83d251 7f78c4ff
!	Mem[00000000300c1430] = 028a361c 77985c3d 00000000 00000000
	ldda	[%i3+%g0]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010081408] = ff631500 00000000, %l2 = 00000000, %l3 = ff000000
	ldda	[%i2+%o4]0x88,%l2	! %l2 = 0000000000000000 00000000ff631500
!	Mem[0000000030001410] = 00000000 00000000, %l4 = ff0000ff, %l5 = dfa900ff
	ldda	[%i0+%o5]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[00000000300c1400] = 63ff0000, %l4 = 0000000000000000
	lduba	[%i3+%g0]0x81,%l4	! %l4 = 0000000000000063
!	Mem[0000000030041410] = 000000ff, %l7 = 00000000000043f0
	lduba	[%i1+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001408] = ffffffff, %l2 = 0000000000000000
	lduwa	[%i0+%o4]0x88,%l2	! %l2 = 00000000ffffffff

p0_label_387:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041418] = 43f05d0f, %l0 = 00000000000000ff
	swap	[%i1+0x018],%l0		! %l0 = 0000000043f05d0f
!	Mem[0000000030041408] = 00a8af4f, %l1 = 0000000000000000
	swapa	[%i1+%o4]0x81,%l1	! %l1 = 0000000000a8af4f
!	%l7 = 0000000000000000, Mem[0000000010081436] = ffffffff, %asi = 80
	stba	%l7,[%i2+0x036]%asi	! Mem[0000000010081434] = ffff00ff
!	Mem[00000000100c1408] = ff000000, %l5 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030101410] = 00ffffff, %l5 = 00000000ff000000
	swapa	[%i4+%o5]0x89,%l5	! %l5 = 0000000000ffffff
!	%l0 = 0000000043f05d0f, Mem[0000000030001400] = 00000000
	stba	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000000f
	membar	#Sync			! Added by membar checker (72)
!	%l0 = 0000000043f05d0f, Mem[00000000300c1400] = 000000000000ff63
	stxa	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000043f05d0f
!	Mem[0000000030001410] = 00000000, %l3 = 00000000ff631500
	swapa	[%i0+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181410] = ff000000, %l5 = 0000000000ffffff
	ldstuba	[%i6+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041434] = 1c368aff, %l5 = 00000000, %l7 = 00000000
	add	%i1,0x34,%g1
	casa	[%g1]0x80,%l5,%l7	! %l7 = 000000001c368aff

p0_label_388:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000000, %l0 = 0000000043f05d0f
	lduba	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0000] = a6ffa3b0, %l7 = 000000001c368aff, %asi = 80
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = ffffffffffffa6ff
!	Mem[0000000010101408] = 0000ffff00000000, %f16 = 63ff0000 00000000
	ldda	[%i4+%o4]0x88,%f16	! %f16 = 0000ffff 00000000
!	Mem[0000000030041410] = 000000ff, %l7 = ffffffffffffa6ff
	ldsha	[%i1+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = ff000000, %l5 = 0000000000000000
	lduha	[%i4+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041410] = 000000ff00000000, %f12 = 028a361c 1ccbffda
	ldda	[%i1+%o5]0x80,%f12	! %f12 = 000000ff 00000000
!	Mem[00000000300c1408] = 00000000, %l1 = 0000000000a8af4f
	ldsha	[%i3+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001408] = 00000000 00156343, %l4 = 00000063, %l5 = 00000000
	ldda	[%i0+%o4]0x89,%l4	! %l4 = 0000000000156343 0000000000000000
!	Mem[00000000100c1400] = 001563ff, %l3 = 0000000000000000
	ldsba	[%i3+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041430] = 3d5c98771c368aff, %l0 = 0000000000000000, %asi = 80
	ldxa	[%i1+0x030]%asi,%l0	! %l0 = 3d5c98771c368aff

p0_label_389:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010181400] = ff000000
	stwa	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	Mem[0000000010101400] = 19ffffff, %l0 = 3d5c98771c368aff
	ldstuba	[%i4+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[00000000201c0000] = a6ffa3b0, %l1 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l1	! %l1 = 00000000000000a6
!	%l0 = 00000000000000ff, Mem[0000000030141408] = 00000000ff000000
	stxa	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000000000ff
!	Mem[0000000020800001] = 00ffb9e0, %l0 = 00000000000000ff
	ldstub	[%o1+0x001],%l0		! %l0 = 00000000000000ff
!	%f30 = 00000000, Mem[0000000010181408] = 64b020ff
	sta	%f30,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	%l5 = 0000000000000000, Mem[0000000030001408] = 0000000000156343
	stxa	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000000000000000
!	%f24 = ffffff00, Mem[0000000030101410] = ff000000
	sta	%f24,[%i4+%o5]0x89	! Mem[0000000030101410] = ffffff00
!	Mem[0000000030181408] = ff000000, %l7 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041432] = 3d5c9877, %l3 = ffffffffffffffff
	ldstuba	[%i1+0x032]%asi,%l3	! %l3 = 0000000000000098

p0_label_390:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00000000, %l6 = 0000000000000000
	ldsha	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001434] = 000000ff, %f1  = 00000000
	lda	[%i0+0x034]%asi,%f1 	! %f1 = 000000ff
!	Mem[0000000010041400] = ff0000ffa8ffffff, %f10 = 64b0ff73 00000980, %asi = 80
	ldda	[%i1+0x000]%asi,%f10	! %f10 = ff0000ff a8ffffff
!	Mem[0000000030181400] = 00000000001563ff, %f6  = ffffffff 0f5df043
	ldda	[%i6+%g0]0x89,%f6 	! %f6  = 00000000 001563ff
!	Mem[0000000010001408] = ffffffff, %l6 = 0000000000000000
	ldswa	[%i0+%o4]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010001408] = ffffffff, %l7 = 0000000000000000
	lduw	[%i0+%o4],%l7		! %l7 = 00000000ffffffff
!	Mem[0000000010181400] = 0000000000000000, %f0  = ff631500 000000ff
	ldda	[%i6+%g0]0x88,%f0 	! %f0  = 00000000 00000000
!	Mem[00000000300c1410] = 00000000, %l2 = 00000000ffffffff
	ldsha	[%i3+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = 20ef580a00000980, %l1 = 00000000000000a6
	ldxa	[%i4+%o4]0x81,%l1	! %l1 = 20ef580a00000980
!	Mem[0000000020800040] = 00ff4c10, %l4 = 0000000000156343, %asi = 80
	lduha	[%o1+0x040]%asi,%l4	! %l4 = 00000000000000ff

p0_label_391:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = ff631500, %l6 = 00000000ffffffff
	swapa	[%i3+%g0]0x80,%l6	! %l6 = 00000000ff631500
!	%f8  = 000000ff, Mem[0000000030041410] = 000000ff
	sta	%f8 ,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000ff
!	%f5  = 00a8af4f, Mem[0000000030181400] = ff631500
	sta	%f5 ,[%i6+%g0]0x81	! Mem[0000000030181400] = 00a8af4f
!	Mem[0000000010041409] = 63ff0000, %l4 = 00000000000000ff
	ldstub	[%i1+0x009],%l4		! %l4 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000030041408] = 00000000
	stwa	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000ff
!	%l6 = ff631500, %l7 = ffffffff, Mem[0000000010181408] = 00000000 00000000, %asi = 80
	stda	%l6,[%i6+0x008]%asi	! Mem[0000000010181408] = ff631500 ffffffff
!	Mem[0000000010141430] = 80090000, %l3 = 00000098, %l1 = 00000980
	add	%i5,0x30,%g1
	casa	[%g1]0x80,%l3,%l1	! %l1 = 0000000080090000
!	Mem[000000001000141c] = ff000000, %l2 = 0000000000000000
	swap	[%i0+0x01c],%l2		! %l2 = 00000000ff000000
!	%l6 = 00000000ff631500, Mem[0000000030081410] = 43f05d0f
	stha	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 15005d0f
!	%l0 = 00000000000000ff, Mem[0000000030081410] = 0f5d0015
	stha	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 0f5d00ff

p0_label_392:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ffffff19ffffffff, %f24 = ffffff00 ffffffff, %asi = 80
	ldda	[%i4+0x000]%asi,%f24	! %f24 = ffffff19 ffffffff
!	Mem[0000000030181410] = 4fafa800ff0000ff, %l3 = 0000000000000098
	ldxa	[%i6+%o5]0x89,%l3	! %l3 = 4fafa800ff0000ff
!	Mem[000000001004143a] = 00000000, %l2 = 00000000ff000000
	lduh	[%i1+0x03a],%l2		! %l2 = 0000000000000000
!	Mem[0000000010141408] = ff0000ff, %l2 = 0000000000000000
	ldswa	[%i5+%o4]0x88,%l2	! %l2 = ffffffffff0000ff
!	Mem[00000000100c1410] = ff000000, %l5 = 0000000000000000
	lduha	[%i3+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000211c0000] = 00ff5a40, %l2 = ffffffffff0000ff
	lduh	[%o2+%g0],%l2		! %l2 = 00000000000000ff
!	Mem[00000000211c0001] = 00ff5a40, %l1 = 0000000080090000
	ldub	[%o2+0x001],%l1		! %l1 = 00000000000000ff
!	Mem[00000000211c0000] = 00ff5a40, %l6 = 00000000ff631500, %asi = 80
	lduha	[%o2+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	%l5 = 0000000000000000, immd = fffffa94, %y  = 000000ff
	sdiv	%l5,-0x56c,%l7		! %l7 = ffffffffd0f7e27e
	mov	%l0,%y			! %y = 000000ff
!	Mem[00000000300c1400] = 0000000043f05d0f, %l3 = 4fafa800ff0000ff
	ldxa	[%i3+%g0]0x89,%l3	! %l3 = 0000000043f05d0f

p0_label_393:
!	Starting 10 instruction Store Burst
!	%f30 = 00000000, Mem[0000000010081420] = 0000ffff
	sta	%f30,[%i2+0x020]%asi	! Mem[0000000010081420] = 00000000
!	%l2 = 000000ff, %l3 = 43f05d0f, Mem[0000000030041410] = 000000ff 24ff0000
	stda	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000ff 43f05d0f
!	Mem[00000000100c1408] = 00000000, %l3 = 0000000043f05d0f
	ldstuba	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %l1 = 00000000000000ff
	ldstuba	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041420] = ffffffff00ffffff, %l2 = 00000000000000ff, %l7 = ffffffffd0f7e27e
	add	%i1,0x20,%g1
	casxa	[%g1]0x80,%l2,%l7	! %l7 = ffffffff00ffffff
!	Mem[0000000030141410] = 550000ff, %l3 = 0000000000000000
	ldstuba	[%i5+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	%f25 = ffffffff, Mem[000000001008143c] = 000000ff
	st	%f25,[%i2+0x03c]	! Mem[000000001008143c] = ffffffff
!	Mem[0000000030101400] = 0507110d, %l4 = 00000000000000ff
	swapa	[%i4+%g0]0x81,%l4	! %l4 = 000000000507110d
!	%l0 = 00000000000000ff, imm = 00000000000001a0, %l5 = 0000000000000000
	xnor	%l0,0x1a0,%l5		! %l5 = fffffffffffffea0
!	Mem[0000000010041408] = 0000ff63, %l7 = ffffffff00ffffff
	ldstuba	[%i1+%o4]0x88,%l7	! %l7 = 0000000000000063

p0_label_394:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000ff000000, %l6 = 00000000000000ff
	ldxa	[%i1+%o5]0x88,%l6	! %l6 = 00000000ff000000
!	Mem[00000000100c1410] = 000000ff00000000, %f0  = 00000000 00000000
	ldda	[%i3+%o5]0x80,%f0 	! %f0  = 000000ff 00000000
!	Code Fragment 3, seed = 701708
p0_fragment_29:
!	%l0 = 00000000000000ff
	setx	0x4aaf1e55a4209bc6,%g7,%l0 ! %l0 = 4aaf1e55a4209bc6
!	%l1 = 0000000000000000
	setx	0x50a3ba4f6b3dfdf1,%g7,%l1 ! %l1 = 50a3ba4f6b3dfdf1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4aaf1e55a4209bc6
	setx	0x05a06e02dd29642c,%g7,%l0 ! %l0 = 05a06e02dd29642c
!	%l1 = 50a3ba4f6b3dfdf1
	setx	0xeecf6db29be0d177,%g7,%l1 ! %l1 = eecf6db29be0d177
p0_fragment_29_end:
!	Mem[0000000010101410] = ffdf8fc3, %l5 = fffffffffffffea0
	ldsba	[%i4+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000218000c1] = 00556b00, %l1 = eecf6db29be0d177, %asi = 80
	ldsba	[%o3+0x0c1]%asi,%l1	! %l1 = 0000000000000055
!	Mem[000000001014140c] = daffcb1c, %l6 = 00000000ff000000
	lduw	[%i5+0x00c],%l6		! %l6 = 00000000daffcb1c
!	Mem[0000000010041418] = 000000ff, %l2 = 00000000000000ff
	lduh	[%i1+0x018],%l2		! %l2 = 0000000000000000
!	%l7 = 0000000000000063, Mem[0000000030081408] = 2a31deff
	stwa	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000063
!	Mem[0000000010081400] = ff000000ffdbd437, %f2  = 000000ff 00000000
	ldd	[%i2+%g0],%f2 		! %f2  = ff000000 ffdbd437
!	Mem[0000000021800100] = 87ffe530, %l6 = 00000000daffcb1c
	ldsb	[%o3+0x100],%l6		! %l6 = ffffffffffffff87

p0_label_395:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 00000000, %l2 = 00000000, %l0 = dd29642c
	casa	[%i6]0x80,%l2,%l0	! %l0 = 0000000000000000
!	%l1 = 0000000000000055, Mem[0000000010101404] = ffffffff
	stw	%l1,[%i4+0x004]		! Mem[0000000010101404] = 00000055
!	%l3 = 00000000000000ff, Mem[0000000010181410] = 000000ff
	stba	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff
!	Mem[0000000030141408] = 00000000, %l3 = 00000000000000ff
	swapa	[%i5+%o4]0x81,%l3	! %l3 = 0000000000000000
!	%l4 = 000000000507110d, Mem[00000000211c0000] = 00ff5a40, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 110d5a40
!	%l3 = 0000000000000000, Mem[0000000030001400] = 0f000000
	stwa	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	Mem[0000000030081410] = ff005d0f, %l5 = ffffffffffffffff
	ldstuba	[%i2+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	%l4 = 000000000507110d, Mem[00000000201c0000] = ffffa3b0, %asi = 80
	stba	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0dffa3b0
!	Mem[0000000010181434] = 00000000, %l4 = 000000000507110d
	swap	[%i6+0x034],%l4		! %l4 = 0000000000000000
!	Mem[0000000030181410] = ff0000ff, %l3 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l3	! %l3 = 00000000000000ff

p0_label_396:
!	Starting 10 instruction Load Burst
!	%l0 = 0000000000000000, Mem[0000000030001408] = 00000000
	stha	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	Mem[0000000030001410] = ff631500, %l6 = ffffffffffffff87
	ldsha	[%i0+%o5]0x89,%l6	! %l6 = 0000000000001500
!	Mem[0000000010081400] = ff000000 ffdbd437, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 00000000ff000000 00000000ffdbd437
!	Mem[0000000030081410] = 0f5d00ff, %l0 = 0000000000000000
	lduha	[%i2+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030041408] = 000000ff, %l0 = 00000000000000ff
	lduha	[%i1+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041410] = ff000000, %l3 = 00000000000000ff
	lduwa	[%i1+%o5]0x89,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010141400] = 00000000, %f13 = 00000000
	lda	[%i5+%g0]0x80,%f13	! %f13 = 00000000
!	Mem[0000000010041410] = 000000ff00000000, %l3 = 00000000ff000000
	ldxa	[%i1+%o5]0x80,%l3	! %l3 = 000000ff00000000
!	Mem[0000000010141410] = f1000000, %l3 = 000000ff00000000
	lduwa	[%i5+%o5]0x80,%l3	! %l3 = 00000000f1000000
!	Mem[0000000010041410] = ff000000, %f28 = 028a361c
	lda	[%i1+%o5]0x88,%f28	! %f28 = ff000000

p0_label_397:
!	Starting 10 instruction Store Burst
!	%f0  = 000000ff 00000000, %l6 = 0000000000001500
!	Mem[0000000010141408] = ff0000ffdaffcb1c
	add	%i5,0x008,%g1
	stda	%f0,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010141408] = ff0000ffdaffcb1c
!	%l0 = 0000000000000000, Mem[0000000010041408] = 0000ffff
	stba	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000ff00
!	Mem[00000000100c143c] = 00000000, %l7 = 00000063, %l2 = 00000000
	add	%i3,0x3c,%g1
	casa	[%g1]0x80,%l7,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l5 = 00000000ffdbd437
	ldstuba	[%i2+%o5]0x80,%l5	! %l5 = 0000000000000000
!	%f29 = 77985c3d, %f28 = ff000000
	fcmpes	%fcc3,%f29,%f28		! %fcc3 = 2
!	Mem[0000000030001410] = ff631500, %l3 = 00000000f1000000
	ldstuba	[%i0+%o5]0x89,%l3	! %l3 = 0000000000000000
!	%f28 = ff000000, Mem[0000000010141408] = ff0000ff
	sta	%f28,[%i5+%o4]0x88	! Mem[0000000010141408] = ff000000
!	Mem[0000000030041400] = ff000000, %l2 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l2	! %l2 = 0000000000000000
!	%l6 = 0000000000001500, Mem[000000001014143c] = e23b3a56
	stw	%l6,[%i5+0x03c]		! Mem[000000001014143c] = 00001500
!	%l5 = 0000000000000000, Mem[0000000030081400] = 000043cc
	stha	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000

p0_label_398:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081422] = 00000000, %l0 = 0000000000000000, %asi = 80
	ldsha	[%i2+0x022]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181408] = ff0000ff, %l0 = 0000000000000000
	ldsba	[%i6+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001400] = ffffff00, %l3 = 0000000000000000
	lduba	[%i0+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001410] = ffffffff ffffffff, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i0+%o5]0x88,%l2	! %l2 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000010041438] = 00000000 00000000, %l6 = 00001500, %l7 = 00000063
	ldd	[%i1+0x038],%l6		! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010001410] = ffffffffffffffff, %f6  = 00000000 001563ff
	ldda	[%i0+%o5]0x80,%f6 	! %f6  = ffffffff ffffffff
!	Mem[0000000030101408] = 20ef580a, %l2 = 00000000ffffffff
	lduha	[%i4+%o4]0x81,%l2	! %l2 = 00000000000020ef
!	Mem[0000000030081400] = 00000000, %l1 = 0000000000000055
	ldsba	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l1 = 0000000000000000
	lduba	[%i0+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041408] = 00000000 0000ff00, %l4 = ff000000, %l5 = 00000000
	ldda	[%i1+%o4]0x88,%l4	! %l4 = 000000000000ff00 0000000000000000

p0_label_399:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 63000000, %l1 = 0000000000000000
	swapa	[%i2+%o4]0x81,%l1	! %l1 = 0000000063000000
!	Mem[0000000010181400] = dd29642c, %l2 = 00000000000020ef
	swapa	[%i6+%g0]0x80,%l2	! %l2 = 00000000dd29642c
!	%l7 = 0000000000000000, Mem[0000000030081400] = 00000000
	stha	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	%l0 = ffffffffffffffff, Mem[0000000010081410] = ff000000
	stwa	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffffff
!	%l4 = 000000000000ff00, Mem[0000000030141400] = 00ffffda
	stba	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 00ffff00
!	Mem[0000000010101410] = ffdf8fc3, %l4 = 000000000000ff00
	ldstuba	[%i4+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%l0 = ffffffff, %l1 = 63000000, Mem[0000000010001408] = ffffffff 000000f1
	stda	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = ffffffff 63000000
!	Mem[00000000100c1410] = 000000ff, %l5 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000
!	%f30 = 00000000, Mem[0000000030141408] = 000000ff
	sta	%f30,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	%l7 = 0000000000000000, imm = fffffffffffff167, %l4 = 00000000000000ff
	or	%l7,-0xe99,%l4		! %l4 = fffffffffffff167

p0_label_400:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00000000, %f10 = ff0000ff
	lda	[%i5+%o4]0x89,%f10	! %f10 = 00000000
!	Mem[0000000010041408] = 000000000000ff00, %l5 = 0000000000000000
	ldxa	[%i1+%o4]0x88,%l5	! %l5 = 000000000000ff00
!	Mem[00000000300c1400] = 43f05d0f, %l6 = 0000000000000000
	ldsha	[%i3+%g0]0x89,%l6	! %l6 = 0000000000005d0f
!	Mem[0000000010141408] = 000000ff, %l7 = 0000000000000000
	lduba	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000021800100] = 87ffe530, %l4 = fffffffffffff167, %asi = 80
	ldsha	[%o3+0x100]%asi,%l4	! %l4 = ffffffffffff87ff
!	Mem[0000000030081400] = 0000000000000000, %f14 = 00000000 00000000
	ldda	[%i2+%g0]0x89,%f14	! %f14 = 00000000 00000000
!	Mem[0000000010081410] = ffffffff, %l1 = 0000000063000000
	lduha	[%i2+%o5]0x80,%l1	! %l1 = 000000000000ffff
!	Mem[00000000300c1410] = 00000000, %l7 = 0000000000000000
	ldswa	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[000000001010143c] = 0000008b, %l3 = 00000000ffffffff
	ldsw	[%i4+0x03c],%l3		! %l3 = 000000000000008b
!	Mem[0000000010181400] = 000020ef, %l2 = 00000000dd29642c
	ldsba	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000000

p0_label_401:
!	Starting 10 instruction Store Burst
!	%f0  = 000000ff 00000000, Mem[0000000010141408] = 000000ff daffcb1c
	stda	%f0 ,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000ff 00000000
!	Mem[0000000030081408] = 00000000, %l7 = 0000000000000000
	swapa	[%i2+%o4]0x81,%l7	! %l7 = 0000000000000000
!	%l0 = ffffffff, %l1 = 0000ffff, Mem[0000000010041428] = ffc4787f 51d28343
	std	%l0,[%i1+0x028]		! Mem[0000000010041428] = ffffffff 0000ffff
!	Mem[0000000010141410] = f1000000, %l2 = 0000000000000000
	swapa	[%i5+%o5]0x80,%l2	! %l2 = 00000000f1000000
!	Mem[0000000030141400] = 00ffff00 ffdbd46d 00000000 000000ff
!	%f16 = 0000ffff 00000000 00000000 00000000
!	%f20 = 00000000 00a8af4f ffffffff 0f5df043
!	%f24 = ffffff19 ffffffff 4c83d251 7f78c4ff
!	%f28 = ff000000 77985c3d 00000000 00000000
	stda	%f16,[%i5+%g0]ASI_BLK_AIUS	! Block Store to 0000000030141400
!	Mem[0000000030081410] = ff005d0f, %l0 = 00000000ffffffff
	swapa	[%i2+%o5]0x81,%l0	! %l0 = 00000000ff005d0f
!	%f20 = 00000000, %f19 = 00000000, %f3  = ffdbd437
	fsubs	%f20,%f19,%f3 		! %f3  = 00000000
!	%l0 = 00000000ff005d0f, Mem[0000000030101410] = 00ffffff
	stha	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 5d0fffff
!	%l6 = 0000000000005d0f, Mem[00000000100c1408] = ff000000, %asi = 80
	stha	%l6,[%i3+0x008]%asi	! Mem[00000000100c1408] = 5d0f0000
!	%l6 = 00005d0f, %l7 = 00000000, Mem[0000000010081410] = ffffffff 00000000
	stda	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 00005d0f 00000000

p0_label_402:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ffffff00ffdbd46d, %f8  = 000000ff 00000000
	ldda	[%i0+%g0]0x80,%f8 	! %f8  = ffffff00 ffdbd46d
!	Mem[0000000030041408] = 000000ff f1facc43, %l2 = f1000000, %l3 = 0000008b
	ldda	[%i1+%o4]0x81,%l2	! %l2 = 00000000000000ff 00000000f1facc43
!	Mem[0000000010101408] = ff000000ffff0000, %f4  = 71c39fda 00a8af4f
	ldda	[%i4+%o4]0x80,%f4 	! %f4  = ff000000 ffff0000
!	Mem[0000000010181438] = 00000000, %l1 = 000000000000ffff
	ldsw	[%i6+0x038],%l1		! %l1 = 0000000000000000
!	Mem[00000000100c1408] = 00000f5d, %l3 = 00000000f1facc43
	ldsba	[%i3+%o4]0x88,%l3	! %l3 = 000000000000005d
!	Mem[0000000010081410] = 00005d0f, %l5 = 000000000000ff00
	ldswa	[%i2+%o5]0x88,%l5	! %l5 = 0000000000005d0f
	membar	#Sync			! Added by membar checker (73)
!	Mem[0000000030141410] = 4fafa800 00000000, %l6 = 00005d0f, %l7 = 00000000
	ldda	[%i5+%o5]0x89,%l6	! %l6 = 0000000000000000 000000004fafa800
!	Mem[0000000010081408] = 00000000, %l0 = 00000000ff005d0f
	lduha	[%i2+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141418] = 20ef580a 00000980, %l4 = ffff87ff, %l5 = 00005d0f
	ldd	[%i5+0x018],%l4		! %l4 = 0000000020ef580a 0000000000000980
!	Mem[0000000010081430] = 0000ff00, %l0 = 0000000000000000, %asi = 80
	lduwa	[%i2+0x030]%asi,%l0	! %l0 = 000000000000ff00

p0_label_403:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010141410] = 00000000
	stwa	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	%f24 = ffffff19, Mem[0000000030041408] = 000000ff
	sta	%f24,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffff19
!	%f4  = ff000000 ffff0000, Mem[0000000010181410] = 000000ff 000000ff
	stda	%f4 ,[%i6+%o5]0x88	! Mem[0000000010181410] = ff000000 ffff0000
!	%l5 = 0000000000000980, %l0 = 000000000000ff00, %y  = 000000ff
	smul	%l5,%l0,%l3		! %l3 = 0000000009768000, %y = 00000000
!	%l0 = 000000000000ff00, Mem[00000000300c1400] = 43f05d0f
	stwa	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000ff00
!	%f10 = 00000000 a8ffffff, %l5 = 0000000000000980
!	Mem[0000000030041400] = ff0000ff000000ff
	stda	%f10,[%i1+%l5]ASI_PST16_S ! Mem[0000000030041400] = ff0000ff000000ff
!	Mem[00000000300c1400] = 0000ff00, %l1 = 0000000000000000
	swapa	[%i3+%g0]0x89,%l1	! %l1 = 000000000000ff00
!	Mem[00000000100c1400] = ffffffff, %l7 = 000000004fafa800
	swapa	[%i3+%g0]0x80,%l7	! %l7 = 00000000ffffffff
!	%l5 = 0000000000000980, Mem[0000000010141400] = 00000000
	stba	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 80000000
!	Mem[0000000010141403] = 80000000, %l2 = 00000000000000ff
	ldstub	[%i5+0x003],%l2		! %l2 = 0000000000000000

p0_label_404:
!	Starting 10 instruction Load Burst
!	%l0 = 000000000000ff00, %l7 = 00000000ffffffff, %l5 = 0000000000000980
	addc	%l0,%l7,%l5		! %l5 = 000000010000feff
!	Mem[0000000030181400] = 00a8af4f, %l6 = 0000000000000000
	lduha	[%i6+%g0]0x81,%l6	! %l6 = 00000000000000a8
!	Mem[0000000030141400] = 0000ffff, %f30 = 00000000
	lda	[%i5+%g0]0x81,%f30	! %f30 = 0000ffff
!	Mem[0000000030041400] = ff0000ff, %l3 = 0000000009768000
	ldsba	[%i1+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181408] = ff631500 ffffffff, %l4 = 20ef580a, %l5 = 0000feff, %asi = 80
	ldda	[%i6+0x008]%asi,%l4	! %l4 = 00000000ff631500 00000000ffffffff
!	Mem[0000000010181410] = 0000ffff, %l3 = ffffffffffffffff
	lduba	[%i6+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000201c0001] = 0dffa3b0, %l2 = 0000000000000000, %asi = 80
	lduba	[%o0+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081400] = 00000000, %l2 = 00000000000000ff
	ldsha	[%i2+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l1 = 000000000000ff00
	ldsba	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041408] = 00ff0000, %l4 = 00000000ff631500
	lduba	[%i1+%o4]0x80,%l4	! %l4 = 0000000000000000

p0_label_405:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041430] = 3d5cff77, %l4 = 0000000000000000, %asi = 80
	swapa	[%i1+0x030]%asi,%l4	! %l4 = 000000003d5cff77
!	%l0 = 000000000000ff00, Mem[0000000010141408] = ff000000
	stba	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = ff000000
!	%f10 = 00000000 a8ffffff, %l7 = 00000000ffffffff
!	Mem[0000000030081408] = 00000000f1facc43
	add	%i2,0x008,%g1
	stda	%f10,[%g1+%l7]ASI_PST32_SL ! Mem[0000000030081408] = ffffffa800000000
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030141410] = 00000000 00a8af4f
	stda	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 00000000
!	%l0 = 000000000000ff00, %l4 = 000000003d5cff77, %l5 = 00000000ffffffff
	and	%l0,%l4,%l5		! %l5 = 000000000000ff00
!	%f30 = 0000ffff, Mem[0000000030041400] = ff0000ff
	sta	%f30,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000ffff
!	Mem[000000001000142c] = 24ff0000, %l4 = 000000003d5cff77, %asi = 80
	swapa	[%i0+0x02c]%asi,%l4	! %l4 = 0000000024ff0000
!	Mem[0000000010081418] = 00ffdbff7f800000, %l2 = 0000000000000000, %l5 = 000000000000ff00
	add	%i2,0x18,%g1
	casxa	[%g1]0x80,%l2,%l5	! %l5 = 00ffdbff7f800000
!	%l5 = 00ffdbff7f800000, Mem[0000000010181404] = 00000000, %asi = 80
	stba	%l5,[%i6+0x004]%asi	! Mem[0000000010181404] = 00000000
!	%l6 = 00000000000000a8, Mem[0000000010041400] = ffffffa8ff0000ff
	stxa	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000000000a8

p0_label_406:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 000000ff, %l4 = 0000000024ff0000
	ldsha	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1408] = 5d0f0000, %f19 = 00000000
	lda	[%i3+%o4]0x80,%f19	! %f19 = 5d0f0000
!	Mem[00000000300c1408] = 00000000, %l7 = 00000000ffffffff
	ldsha	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800001] = 00ffb9e0, %l4 = 0000000000000000
	ldub	[%o1+0x001],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010041430] = 00000000, %l0 = 000000000000ff00
	ldub	[%i1+0x030],%l0		! %l0 = 0000000000000000
!	Mem[0000000010181418] = 00000000, %l3 = 0000000000000000, %asi = 80
	ldswa	[%i6+0x018]%asi,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = 110d5a40, %l7 = 0000000000000000, %asi = 80
	ldsba	[%o2+0x000]%asi,%l7	! %l7 = 0000000000000011
!	Mem[00000000211c0000] = 110d5a40, %l4 = 00000000000000ff
	ldub	[%o2+%g0],%l4		! %l4 = 0000000000000011
!	Mem[000000001010143e] = 0000008b, %l2 = 0000000000000000
	lduh	[%i4+0x03e],%l2		! %l2 = 000000000000008b
!	Mem[00000000100c1408] = 000000ff 00000f5d, %l2 = 0000008b, %l3 = 00000000
	ldda	[%i3+%o4]0x88,%l2	! %l2 = 0000000000000f5d 00000000000000ff

p0_label_407:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = ffdf8fc30000ff00, %l7 = 0000000000000011, %l7 = 0000000000000011
	add	%i4,0x10,%g1
	casxa	[%g1]0x80,%l7,%l7	! %l7 = ffdf8fc30000ff00
!	%l4 = 0000000000000011, Mem[0000000020800000] = 00ffb9e0
	sth	%l4,[%o1+%g0]		! Mem[0000000020800000] = 0011b9e0
!	Mem[0000000030041408] = 19ffffff, %l1 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000030041410] = 000000ff
	stha	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000ff
!	%f17 = 00000000, Mem[0000000030001400] = 00000000
	sta	%f17,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	%l6 = 00000000000000a8, immd = 00000000000000e8, %l4  = 0000000000000011
	mulx	%l6,0x0e8,%l4		! %l4 = 0000000000009840
!	%l2 = 00000f5d, %l3 = 000000ff, Mem[0000000030141400] = 0000ffff 00000000
	stda	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000f5d 000000ff
!	%l4 = 0000000000009840, Mem[0000000010141408] = 000000ff00000000
	stxa	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000000000009840
!	Mem[0000000030141410] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000
!	%l4 = 0000000000009840, %l4 = 0000000000009840, %l5 = 00ffdbff7f800000
	xor	%l4,%l4,%l5		! %l5 = 0000000000000000

p0_label_408:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181430] = ff000000 0507110d, %l4 = 00009840, %l5 = 00000000
	ldd	[%i6+0x030],%l4		! %l4 = 00000000ff000000 000000000507110d
!	%l2 = 0000000000000f5d, %l2 = 0000000000000f5d, %l6 = 00000000000000a8
	add	%l2,%l2,%l6		! %l6 = 0000000000001eba
!	Mem[0000000010041400] = a800000000000000, %f18 = 00000000 5d0f0000
	ldda	[%i1+%g0]0x80,%f18	! %f18 = a8000000 00000000
!	Mem[0000000010181400] = 000020ef, %f0  = 000000ff
	lda	[%i6+%g0]0x80,%f0 	! %f0 = 000020ef
!	%f14 = 00000000, %f9  = ffdbd46d
	fcmps	%fcc2,%f14,%f9 		! %fcc2 = 3
!	Mem[0000000010041400] = 000000a8, %l7 = ffdf8fc30000ff00
	ldsha	[%i1+%g0]0x88,%l7	! %l7 = 00000000000000a8
!	Mem[0000000030041400] = 0000ffff, %f15 = 00000000
	lda	[%i1+%g0]0x89,%f15	! %f15 = 0000ffff
!	Code Fragment 3, seed = 363220
p0_fragment_30:
!	%l0 = 0000000000000000
	setx	0xdd838fd63af23586,%g7,%l0 ! %l0 = dd838fd63af23586
!	%l1 = 00000000000000ff
	setx	0x594bf0d1dcaf6bb1,%g7,%l1 ! %l1 = 594bf0d1dcaf6bb1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = dd838fd63af23586
	setx	0xfaf6e2ec82c265ec,%g7,%l0 ! %l0 = faf6e2ec82c265ec
!	%l1 = 594bf0d1dcaf6bb1
	setx	0x7d2d4b8e039d2737,%g7,%l1 ! %l1 = 7d2d4b8e039d2737
p0_fragment_30_end:
!	Mem[0000000030181410] = ff0000ff, %l1 = 7d2d4b8e039d2737
	ldswa	[%i6+%o5]0x89,%l1	! %l1 = ffffffffff0000ff
!	Mem[0000000010101400] = ffffff19, %l5 = 000000000507110d
	lduba	[%i4+%g0]0x80,%l5	! %l5 = 00000000000000ff

p0_label_409:
!	Starting 10 instruction Store Burst
!	%f30 = 0000ffff 00000000, %l4 = 00000000ff000000
!	Mem[0000000010141418] = 20ef580a00000980
	add	%i5,0x018,%g1
	stda	%f30,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010141418] = 20ef580a00000980
!	Mem[0000000010181418] = 00000000, %l7 = 00000000000000a8
	ldstuba	[%i6+0x018]%asi,%l7	! %l7 = 0000000000000000
!	%f12 = 000000ff 00000000, %l4 = 00000000ff000000
!	Mem[0000000010081428] = 4c83d25100ffffff
	add	%i2,0x028,%g1
	stda	%f12,[%g1+%l4]ASI_PST16_P ! Mem[0000000010081428] = 4c83d25100ffffff
!	%l5 = 00000000000000ff, Mem[0000000010181408] = 001563ff
	stha	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = 001500ff
!	Mem[00000000100c1424] = ffffffff, %l7 = 0000000000000000
	ldstuba	[%i3+0x024]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181400] = ef200000, %l7 = 00000000000000ff
	swapa	[%i6+%g0]0x88,%l7	! %l7 = 00000000ef200000
!	Mem[0000000010081410] = 0f5d0000, %l5 = 00000000000000ff
	ldstuba	[%i2+%o5]0x80,%l5	! %l5 = 000000000000000f
!	Mem[000000001004142c] = 0000ffff, %l2 = 0000000000000f5d
	swap	[%i1+0x02c],%l2		! %l2 = 000000000000ffff
!	Mem[0000000010101410] = c38fdfff, %l3 = 0000000000000000
	swapa	[%i4+%o5]0x88,%l3	! %l3 = 00000000c38fdfff
!	%f28 = ff000000, Mem[0000000010101400] = ffffff19
	sta	%f28,[%i4+%g0]0x80	! Mem[0000000010101400] = ff000000

p0_label_410:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 0000000000009840, %l3 = 00000000c38fdfff
	ldx	[%i5+%o4],%l3		! %l3 = 0000000000009840
!	Mem[0000000010101408] = 000000ff, %f6  = ffffffff
	lda	[%i4+%o4]0x88,%f6 	! %f6 = 000000ff
!	Mem[0000000030001400] = 00000000, %l4 = 00000000ff000000
	lduba	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000000
!	%f20 = 00000000, %f0  = 000020ef, %f1  = 00000000
	fdivs	%f20,%f0 ,%f1 		! %f1  = 00000000
!	Mem[00000000100c1410] = ff0000ff, %l6 = 0000000000001eba
	ldsha	[%i3+%o5]0x80,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000030101408] = 0a58ef20, %l5 = 000000000000000f
	lduba	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000020
!	Mem[0000000010081410] = 00000000 00005dff, %l6 = ffffff00, %l7 = ef200000
	ldda	[%i2+%o5]0x88,%l6	! %l6 = 0000000000005dff 0000000000000000
!	Mem[00000000100c1430] = 028a361c, %f1  = 00000000
	ld	[%i3+0x030],%f1 	! %f1 = 028a361c
!	Mem[0000000010101410] = 00000000, %l6 = 0000000000005dff
	ldswa	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081410] = ff5d000000000000, %l2 = 000000000000ffff
	ldxa	[%i2+%o5]0x80,%l2	! %l2 = ff5d000000000000

p0_label_411:
!	Starting 10 instruction Store Burst
!	%l0 = faf6e2ec82c265ec, Mem[0000000010141437] = 73ffb064
	stb	%l0,[%i5+0x037]		! Mem[0000000010141434] = 73ffb0ec
!	%l0 = faf6e2ec82c265ec, imm = fffffffffffffebc, %l2 = ff5d000000000000
	xnor	%l0,-0x144,%l2		! %l2 = faf6e2ec82c264af
!	Mem[0000000010181408] = 001500ff, %l4 = 0000000000000000
	swapa	[%i6+%o4]0x88,%l4	! %l4 = 00000000001500ff
!	%l7 = 0000000000000000, Mem[0000000010041400] = a8000000
	stba	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	%l4 = 001500ff, %l5 = 00000020, Mem[0000000030041410] = 000000ff 43f05d0f
	stda	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 001500ff 00000020
!	%l4 = 00000000001500ff, Mem[00000000300c1408] = 00000000
	stwa	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 001500ff
!	%l1 = ffffffffff0000ff, Mem[0000000030041408] = 19ffffff
	stwa	%l1,[%i1+%o4]0x89	! Mem[0000000030041408] = ff0000ff
!	%l7 = 0000000000000000, Mem[0000000020800000] = 0011b9e0, %asi = 80
	stba	%l7,[%o1+0x000]%asi	! Mem[0000000020800000] = 0011b9e0
!	%f30 = 0000ffff 00000000, Mem[00000000100c1410] = ff0000ff 00000000
	stda	%f30,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000ffff 00000000
!	%f28 = ff000000 77985c3d, Mem[0000000010081408] = 00000000 ff631500
	stda	%f28,[%i2+%o4]0x88	! Mem[0000000010081408] = ff000000 77985c3d

p0_label_412:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 000000ff 2a31deff 20ef580a 00000980
!	Mem[0000000030101410] = 5d0fffff ffffff20 4b439fda 0f5df043
!	Mem[0000000030101420] = 5759293e 24ca2597 4c83d251 7f78c4ff
!	Mem[0000000030101430] = 4b439fda 1362852c 66000000 55000000
	ldda	[%i4+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Mem[0000000010181408] = 00000000, %l3 = 0000000000009840
	ldsba	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[000000001018140c] = ffffffff, %l1 = ffffffffff0000ff, %asi = 80
	ldsha	[%i6+0x00c]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030081410] = ffffffff, %f7  = ffffffff
	lda	[%i2+%o5]0x89,%f7 	! %f7 = ffffffff
!	Mem[00000000211c0000] = 110d5a40, %l4 = 00000000001500ff
	ldsb	[%o2+%g0],%l4		! %l4 = 0000000000000011
!	Mem[0000000010041410] = 000000ff, %l0 = faf6e2ec82c265ec
	ldsha	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101410] = 5d0fffffffffff20, %f8  = ffffff00 ffdbd46d
	ldda	[%i4+%o5]0x81,%f8 	! %f8  = 5d0fffff ffffff20
!	Mem[0000000030101400] = ff000000, %l5 = 0000000000000020
	ldsha	[%i4+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1416] = 00000000, %l7 = 0000000000000000, %asi = 80
	lduha	[%i3+0x016]%asi,%l7	! %l7 = 0000000000000000
	membar	#Sync			! Added by membar checker (74)
!	Mem[0000000030141400] = 00000f5d 000000ff 00000000 00000000
!	Mem[0000000030141410] = ff000000 00000000 ffffffff 0f5df043
!	Mem[0000000030141420] = ffffff19 ffffffff 4c83d251 7f78c4ff
!	Mem[0000000030141430] = ff000000 77985c3d 00000000 00000000
	ldda	[%i5+%g0]ASI_BLK_SL,%f0 	! Block Load from 0000000030141400

p0_label_413:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l7	! %l7 = 0000000000000000
!	%l0 = 00000000, %l1 = ffffffff, Mem[0000000010041418] = 000000ff ffffffff, %asi = 80
	stda	%l0,[%i1+0x018]%asi	! Mem[0000000010041418] = 00000000 ffffffff
!	%f30 = 66000000 55000000, Mem[00000000300c1408] = ff001500 00000000
	stda	%f30,[%i3+%o4]0x89	! Mem[00000000300c1408] = 66000000 55000000
!	Mem[0000000030041408] = ff0000ff, %l1 = ffffffffffffffff
	ldstuba	[%i1+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010081400] = ff000000ffdbd437, %asi = 80
	stxa	%l7,[%i2+0x000]%asi	! Mem[0000000010081400] = 0000000000000000
!	%f26 = 4c83d251, %f4  = 00000000, %f28 = 4b439fda
	fdivs	%f26,%f4 ,%f28		! %f28 = 7f800000
!	%f18 = 20ef580a 00000980, Mem[0000000010041408] = 00ff0000 00000000, %asi = 80
	stda	%f18,[%i1+0x008]%asi	! Mem[0000000010041408] = 20ef580a 00000980
!	Mem[0000000010081428] = 4c83d251, %l4 = 0000000000000011
	ldstub	[%i2+0x028],%l4		! %l4 = 000000000000004c
!	Mem[0000000030181408] = ff0000ff, %l1 = 00000000000000ff
	ldstuba	[%i6+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181400] = 000000ff, %l5 = 0000000000000000
	ldstuba	[%i6+%g0]0x88,%l5	! %l5 = 00000000000000ff

p0_label_414:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ffff0000, %f30 = 66000000
	lda	[%i6+%o5]0x88,%f30	! %f30 = ffff0000
!	Mem[0000000010101400] = 000000ff, %l7 = 0000000000000000
	lduba	[%i4+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181400] = 00a8af4f, %l0 = 0000000000000000
	lduwa	[%i6+%g0]0x81,%l0	! %l0 = 0000000000a8af4f
!	Mem[0000000010041400] = 00000000, %l7 = 00000000000000ff
	ldswa	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1418] = 000000ff 0f5df043, %l2 = 82c264af, %l3 = 00000000, %asi = 80
	ldda	[%i3+0x018]%asi,%l2	! %l2 = 00000000000000ff 000000000f5df043
!	Mem[0000000030181400] = 00a8af4f, %l0 = 0000000000a8af4f
	ldswa	[%i6+%g0]0x81,%l0	! %l0 = 0000000000a8af4f
!	Mem[0000000030181410] = ff0000ff00a8af4f, %f20 = 5d0fffff ffffff20
	ldda	[%i6+%o5]0x81,%f20	! %f20 = ff0000ff 00a8af4f
!	Mem[0000000030181410] = ff0000ff, %l5 = 00000000000000ff
	lduha	[%i6+%o5]0x81,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030001410] = ff1563ff, %f30 = ffff0000
	lda	[%i0+%o5]0x81,%f30	! %f30 = ff1563ff
!	Mem[0000000030081400] = 00000000 00000000, %l2 = 000000ff, %l3 = 0f5df043
	ldda	[%i2+%g0]0x89,%l2	! %l2 = 0000000000000000 0000000000000000

p0_label_415:
!	Starting 10 instruction Store Burst
!	Mem[000000001008143e] = ffffffff, %l4 = 000000000000004c
	ldstub	[%i2+0x03e],%l4		! %l4 = 00000000000000ff
!	Mem[000000001010140c] = ffff0000, %l3 = 0000000000000000
	swap	[%i4+0x00c],%l3		! %l3 = 00000000ffff0000
	membar	#Sync			! Added by membar checker (75)
!	%f26 = 4c83d251 7f78c4ff, Mem[0000000030141408] = 00000000 00000000
	stda	%f26,[%i5+%o4]0x89	! Mem[0000000030141408] = 4c83d251 7f78c4ff
!	%f11 = 51d2834c, %f28 = 7f800000, %f14 = 00000000
	fsubs	%f11,%f28,%f14		! %f14 = ff800000
!	%l5 = 000000000000ff00, Mem[00000000300c1408] = 00000055
	stwa	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000ff00
!	%l4 = 00000000000000ff, Mem[0000000010001430] = 00a8af4f
	stw	%l4,[%i0+0x030]		! Mem[0000000010001430] = 000000ff
!	Mem[0000000030181410] = ff0000ff, %l0 = 0000000000a8af4f
	ldstuba	[%i6+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%f30 = ff1563ff 55000000, %l4 = 00000000000000ff
!	Mem[0000000010081438] = 00000000ffffffff
	add	%i2,0x038,%g1
	stda	%f30,[%g1+%l4]ASI_PST8_P ! Mem[0000000010081438] = ff1563ff55000000
!	%f9  = 19ffffff, %f27 = 7f78c4ff, %f8  = ffffffff
	fsubs	%f9 ,%f27,%f8 		! %f8  = ff78c4ff
!	%l1 = 00000000000000ff, %l5 = 000000000000ff00, %l2 = 0000000000000000
	xor	%l1,%l5,%l2		! %l2 = 000000000000ffff

p0_label_416:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 0a58ef20, %l5 = 000000000000ff00
	ldsba	[%i1+%o4]0x88,%l5	! %l5 = 0000000000000020
!	Mem[0000000030081400] = 0000000000000000, %l0 = 00000000000000ff
	ldxa	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001400] = ffffff00, %l4 = 00000000000000ff
	lduha	[%i0+%g0]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[00000000201c0000] = 0dffa3b0, %l3 = 00000000ffff0000
	ldsh	[%o0+%g0],%l3		! %l3 = 0000000000000dff
!	Mem[0000000030181400] = 00a8af4f00000000, %f20 = ff0000ff 00a8af4f
	ldda	[%i6+%g0]0x81,%f20	! %f20 = 00a8af4f 00000000
!	Mem[0000000010041408] = 0a58ef20, %f12 = 3d5c9877
	lda	[%i1+%o4]0x88,%f12	! %f12 = 0a58ef20
!	Mem[0000000010081418] = 00ffdbff7f800000, %l1 = 00000000000000ff
	ldx	[%i2+0x018],%l1		! %l1 = 00ffdbff7f800000
!	%l5 = 0000000000000020, %l2 = 000000000000ffff, %l6 = 0000000000000000
	xnor	%l5,%l2,%l6		! %l6 = ffffffffffff0020
!	Mem[0000000010141410] = 00000000, %l5 = 0000000000000020
	ldswa	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141400] = ff0000005d0f0000, %l4 = 000000000000ffff
	ldxa	[%i5+%g0]0x89,%l4	! %l4 = ff0000005d0f0000

p0_label_417:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 00000000, %l3 = 0000000000000dff
	ldstuba	[%i0+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 5d0f0000, %l5 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l5	! %l5 = 000000005d0f0000
!	%f12 = 0a58ef20 000000ff, %l7 = 0000000000000000
!	Mem[0000000010001418] = 0000ff2400000000
	add	%i0,0x018,%g1
	stda	%f12,[%g1+%l7]ASI_PST32_P ! Mem[0000000010001418] = 0000ff2400000000
!	%f8  = ff78c4ff 19ffffff, Mem[0000000030141410] = ff000000 00000000
	stda	%f8 ,[%i5+%o5]0x81	! Mem[0000000030141410] = ff78c4ff 19ffffff
!	%l2 = 000000000000ffff, Mem[0000000010141410] = 00000000
	stwa	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000ffff
!	%l3 = 0000000000000000, Mem[0000000030141410] = ffc478ff
	stba	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = ffc47800
!	%f28 = 7f800000, Mem[0000000010081408] = 77985c3d
	sta	%f28,[%i2+%o4]0x88	! Mem[0000000010081408] = 7f800000
!	Mem[0000000030041408] = ff0000ff, %l2 = 000000000000ffff
	swapa	[%i1+%o4]0x81,%l2	! %l2 = 00000000ff0000ff
!	%l0 = 0000000000000000, Mem[0000000010041405] = 00000000, %asi = 80
	stba	%l0,[%i1+0x005]%asi	! Mem[0000000010041404] = 00000000

p0_label_418:
!	Starting 10 instruction Load Burst
!	%f5  = 000000ff, %f28 = 7f800000, %f4  = 00000000
	fdivs	%f5 ,%f28,%f4 		! %f4  = 00000000
!	Mem[00000000100c1438] = 0000000000000000, %l7 = 0000000000000000, %asi = 80
	ldxa	[%i3+0x038]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141410] = 0078c4ff, %l3 = 0000000000000000
	lduba	[%i5+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = 0a58ef20, %l2 = 00000000ff0000ff
	ldswa	[%i1+%o4]0x88,%l2	! %l2 = 000000000a58ef20
!	Mem[0000000010001408] = ffffffff, %l5 = 000000005d0f0000
	lduha	[%i0+%o4]0x80,%l5	! %l5 = 000000000000ffff
!	Mem[000000001018143e] = 000000ff, %l2 = 000000000a58ef20, %asi = 80
	lduha	[%i6+0x03e]%asi,%l2	! %l2 = 00000000000000ff
!	%l7 = 0000000000000000, imm = fffffffffffff5ee, %l0 = 0000000000000000
	addc	%l7,-0xa12,%l0		! %l0 = fffffffffffff5ee
!	Mem[0000000010141408] = 40980000 000000ff, %l6 = ffff0020, %l7 = 00000000
	ldda	[%i5+%o4]0x88,%l6	! %l6 = 00000000000000ff 0000000040980000
!	Mem[0000000010041418] = 00000000 ffffffff, %l4 = 5d0f0000, %l5 = 0000ffff
	ldd	[%i1+0x018],%l4		! %l4 = 0000000000000000 00000000ffffffff
!	Mem[0000000010001408] = ffffffff, %l4 = 0000000000000000
	lduba	[%i0+%o4]0x80,%l4	! %l4 = 00000000000000ff

p0_label_419:
!	Starting 10 instruction Store Burst
!	Code Fragment 3, seed = 239041
p0_fragment_31:
!	%l0 = fffffffffffff5ee
	setx	0x0b4d8cc4fb10db1e,%g7,%l0 ! %l0 = 0b4d8cc4fb10db1e
!	%l1 = 00ffdbff7f800000
	setx	0x626b119e03aefdc9,%g7,%l1 ! %l1 = 626b119e03aefdc9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0b4d8cc4fb10db1e
	setx	0x81153a4b9ea93c84,%g7,%l0 ! %l0 = 81153a4b9ea93c84
!	%l1 = 626b119e03aefdc9
	setx	0x4956c7dd84821a4f,%g7,%l1 ! %l1 = 4956c7dd84821a4f
p0_fragment_31_end:
!	%f31 = 55000000, %f21 = 00000000, %f8  = ff78c4ff
	fdivs	%f31,%f21,%f8 		! %f8  = 7f800000
!	%l5 = 00000000ffffffff, Mem[0000000030001400] = ff000000
	stba	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = ff000000
!	%l4 = 00000000000000ff, Mem[0000000010101408] = ff00000000000000
	stxa	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000000000ff
!	%f4  = 00000000 000000ff, Mem[0000000030001400] = ff000000 000000ff
	stda	%f4 ,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 000000ff
!	%l1 = 4956c7dd84821a4f, Mem[0000000030141400] = ff0000005d0f0000
	stxa	%l1,[%i5+%g0]0x89	! Mem[0000000030141400] = 4956c7dd84821a4f
!	Mem[0000000010041400] = 00000000, %l2 = 00000000000000ff
	swapa	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%f16 = 000000ff 2a31deff, Mem[0000000010081410] = ff5d0000 00000000
	stda	%f16,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff 2a31deff
!	Mem[00000000100c1400] = 4fafa800, %l0 = 81153a4b9ea93c84
	ldstuba	[%i3+%g0]0x80,%l0	! %l0 = 000000000000004f
!	%f0  = ff000000 5d0f0000, Mem[0000000010101400] = 000000ff 55000000
	stda	%f0 ,[%i4+%g0]0x88	! Mem[0000000010101400] = ff000000 5d0f0000

p0_label_420:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800141] = cc43db60, %l4 = 00000000000000ff
	ldsb	[%o3+0x141],%l4		! %l4 = 0000000000000043
!	Mem[00000000100c1408] = 00000000, %l0 = 000000000000004f
	lduwa	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041400] = ffff0000, %l6 = 00000000000000ff
	ldsha	[%i1+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081416] = 2a31deff, %l5 = 00000000ffffffff, %asi = 80
	ldsha	[%i2+0x016]%asi,%l5	! %l5 = ffffffffffffdeff
!	Mem[0000000010181420] = 00000000, %f26 = 4c83d251
	ld	[%i6+0x020],%f26	! %f26 = 00000000
!	Mem[0000000010141428] = 66220000ff000000, %l3 = 0000000000000000
	ldx	[%i5+0x028],%l3		! %l3 = 66220000ff000000
!	Mem[0000000030081400] = 0000000000000000, %l6 = ffffffffffffffff
	ldxa	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = 00ffffff, %l2 = 0000000000000000
	ldsha	[%i0+%g0]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030101408] = 20ef580a, %l5 = ffffffffffffdeff
	ldsba	[%i4+%o4]0x81,%l5	! %l5 = 0000000000000020
!	Mem[0000000010141410] = 0000ffff00000000, %f16 = 000000ff 2a31deff
	ldda	[%i5+%o5]0x80,%f16	! %f16 = 0000ffff 00000000

p0_label_421:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 00000000, %l3 = 66220000ff000000
	ldstuba	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = ff000000, %l4 = 0000000000000043
	swapa	[%i3+%g0]0x81,%l4	! %l4 = 00000000ff000000
!	%l0 = 0000000000000000, Mem[0000000010181408] = 00000000
	stwa	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000
!	%f18 = 20ef580a 00000980, Mem[0000000010041408] = 0a58ef20 80090000
	stda	%f18,[%i1+%o4]0x88	! Mem[0000000010041408] = 20ef580a 00000980
!	%f12 = 0a58ef20 000000ff, Mem[00000000100c1408] = 00000000 ff000000
	stda	%f12,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0a58ef20 000000ff
!	Mem[00000000300c1400] = 00000043, %l6 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030101410] = 20ffffffffff0f5d
	stxa	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010101410] = 00ff0000000000ff
	stxa	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000000000000
!	Mem[0000000010181410] = ffff0000, %l7 = 0000000040980000
	ldstuba	[%i6+%o5]0x88,%l7	! %l7 = 0000000000000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030181400] = 00a8af4f 00000000
	stda	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000 00000000

p0_label_422:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800100] = 87ffe530, %l5 = 0000000000000020, %asi = 80
	ldsha	[%o3+0x100]%asi,%l5	! %l5 = ffffffffffff87ff
!	Mem[0000000010001400] = ffffff00 ffdbd46d, %l4 = ff000000, %l5 = ffff87ff, %asi = 80
	ldda	[%i0+0x000]%asi,%l4	! %l4 = 00000000ffffff00 00000000ffdbd46d
!	Mem[0000000030001400] = 00000000, %l2 = ffffffffffffffff
	ldswa	[%i0+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181410] = ff0000ff, %l0 = 0000000000000000
	lduwa	[%i6+%o5]0x81,%l0	! %l0 = 00000000ff0000ff
!	Mem[0000000010101410] = 0000000000000000, %l1 = 4956c7dd84821a4f
	ldxa	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000211c0000] = 110d5a40, %l0 = 00000000ff0000ff
	lduh	[%o2+%g0],%l0		! %l0 = 000000000000110d
!	Mem[0000000010181410] = ff00ffff, %l6 = 0000000000000000
	lduba	[%i6+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081428] = ff83d251, %l7 = 0000000000000000, %asi = 80
	ldsha	[%i2+0x028]%asi,%l7	! %l7 = ffffffffffffff83
!	Mem[0000000030081400] = 00000000, %l3 = 0000000000000000
	ldsha	[%i2+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141400] = 73ffb064ff000080, %f16 = 0000ffff 00000000
	ldda	[%i5+%g0]0x88,%f16	! %f16 = 73ffb064 ff000080

p0_label_423:
!	Starting 10 instruction Store Burst
!	Mem[000000001000141c] = 00000000, %l7 = ffffff83, %l0 = 0000110d
	add	%i0,0x1c,%g1
	casa	[%g1]0x80,%l7,%l0	! %l0 = 0000000000000000
!	%f2  = 00000000, Mem[0000000010101410] = 00000000
	sta	%f2 ,[%i4+0x010]%asi	! Mem[0000000010101410] = 00000000
!	Mem[0000000030041410] = 001500ff, %l7 = ffffffffffffff83
	ldstuba	[%i1+%o5]0x81,%l7	! %l7 = 0000000000000000
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000010141400] = ff000080 73ffb064
	stda	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff 00000000
!	Mem[0000000030141408] = ffc4787f, %l7 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	%f10 = ffc4787f 51d2834c, %l7 = 00000000000000ff
!	Mem[0000000010081420] = 00000000ffffff00
	add	%i2,0x020,%g1
	stda	%f10,[%g1+%l7]ASI_PST8_P ! Mem[0000000010081420] = ffc4787f51d2834c
!	Mem[0000000030101408] = 20ef580a, %l3 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l3	! %l3 = 0000000020ef580a
!	Mem[0000000010081408] = 0000807f, %l5 = 00000000ffdbd46d
	ldstuba	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001428] = 000000ff, %l2 = 0000000000000000
	swap	[%i0+0x028],%l2		! %l2 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[0000000010101408] = 00000000
	stha	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 00ff0000

p0_label_424:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ffffff19ffc47800, %l3 = 0000000020ef580a
	ldxa	[%i5+%o5]0x89,%l3	! %l3 = ffffff19ffc47800
!	Mem[0000000030041408] = 0000ffff, %l5 = 0000000000000000
	lduba	[%i1+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %f19 = 00000980
	lda	[%i4+%o5]0x88,%f19	! %f19 = 00000000
!	Mem[0000000030001400] = 00000000000000ff, %l4 = 00000000ffffff00
	ldxa	[%i0+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041410] = 000000ff, %l1 = 0000000000000000
	ldsba	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000000
	membar	#Sync			! Added by membar checker (76)
!	Mem[0000000010141400] = ff000000 00000000 ff000000 00009840
!	Mem[0000000010141410] = 0000ffff 00000000 20ef580a 00000980
!	Mem[0000000010141420] = 00000000 000000ff 66220000 ff000000
!	Mem[0000000010141430] = 80090000 73ffb0ec 4fafa800 00001500
	ldda	[%i5+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010141400
!	Mem[0000000010101400] = 00000f5d, %l2 = 00000000000000ff
	ldswa	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000f5d
!	Mem[0000000010001412] = ffffffff, %l5 = 0000000000000000, %asi = 80
	lduha	[%i0+0x012]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030081410] = ffffffff, %l7 = 00000000000000ff
	lduha	[%i2+%o5]0x81,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010141428] = 66220000, %f12 = 0a58ef20
	lda	[%i5+0x028]%asi,%f12	! %f12 = 66220000

p0_label_425:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000030081400] = 00000000
	stwa	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	%f16 = ff000000 00000000, Mem[0000000010001420] = 6dd4dbc2 0000ffff, %asi = 80
	stda	%f16,[%i0+0x020]%asi	! Mem[0000000010001420] = ff000000 00000000
	membar	#Sync			! Added by membar checker (77)
!	%l5 = 000000000000ffff, Mem[0000000010141400] = ff000000
	stha	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = ffff0000
!	%l2 = 0000000000000f5d, Mem[0000000010081408] = 7f8000ff
	stwa	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000f5d
!	Mem[0000000030041400] = ffff0000, %l1 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l1	! %l1 = 00000000ffff0000
!	%f22 = 20ef580a 00000980, Mem[0000000010041408] = 00000980 20ef580a
	stda	%f22,[%i1+%o4]0x88	! Mem[0000000010041408] = 20ef580a 00000980
!	%l7 = 000000000000ffff, Mem[0000000030141410] = 0078c4ff
	stha	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffc4ff
!	%l2 = 00000f5d, %l3 = ffc47800, Mem[0000000010181400] = ff000000 00000000
	stda	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000f5d ffc47800
!	%l0 = 0000000000000000, Mem[0000000030081408] = ffffffa800000000
	stxa	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000000000000
!	%l5 = 000000000000ffff, imm = 000000000000001f, %l7 = 000000000000ffff
	xor	%l5,0x01f,%l7		! %l7 = 000000000000ffe0

p0_label_426:
!	Starting 10 instruction Load Burst
!	%l6 = 00000000000000ff, imm = 0000000000000822, %l7 = 000000000000ffe0
	or	%l6,0x822,%l7		! %l7 = 00000000000008ff
!	Mem[0000000010101400] = 5d0f0000, %l0 = 0000000000000000
	lduba	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181408] = ff0000ff 00000000, %l2 = 00000f5d, %l3 = ffc47800
	ldda	[%i6+%o4]0x81,%l2	! %l2 = 00000000ff0000ff 0000000000000000
!	Mem[00000000201c0000] = 0dffa3b0, %l7 = 00000000000008ff
	lduh	[%o0+%g0],%l7		! %l7 = 0000000000000dff
!	Mem[0000000030181410] = ff0000ff, %l6 = 00000000000000ff
	ldsha	[%i6+%o5]0x81,%l6	! %l6 = ffffffffffffff00
!	Mem[00000000100c1410] = 0000ffff, %f2  = 00000000
	lda	[%i3+%o5]0x80,%f2 	! %f2 = 0000ffff
!	Mem[00000000100c1400] = ffafa80000000000, %l1 = 00000000ffff0000
	ldx	[%i3+%g0],%l1		! %l1 = ffafa80000000000
!	Mem[000000001018141f] = 00a8af4f, %l0 = 0000000000000000
	ldstuba	[%i6+0x01f]%asi,%l0	! %l0 = 000000000000004f
!	Mem[0000000010041408] = 800900000a58ef20, %l3 = 0000000000000000
	ldxa	[%i1+%o4]0x80,%l3	! %l3 = 800900000a58ef20
!	%l5 = 000000000000ffff, %l4 = 00000000000000ff, %l2 = 00000000ff0000ff
	xnor	%l5,%l4,%l2		! %l2 = ffffffffffff00ff

p0_label_427:
!	Starting 10 instruction Store Burst
!	%f8  = 7f800000, Mem[0000000010081400] = 00000000
	sta	%f8 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 7f800000
!	Mem[0000000021800100] = 87ffe530, %l6 = ffffffffffffff00
	ldstuba	[%o3+0x100]%asi,%l6	! %l6 = 0000000000000087
!	%l0 = 000000000000004f, Mem[0000000010041400] = ff000000
	stwa	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000004f
!	%l1 = ffafa80000000000, Mem[00000000211c0000] = 110d5a40, %asi = 80
	stha	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00005a40
!	Mem[0000000010081430] = 0000ff00, %l0 = 000000000000004f
	swap	[%i2+0x030],%l0		! %l0 = 000000000000ff00
!	Mem[0000000030081400] = 00000000, %l3 = 800900000a58ef20
	ldstuba	[%i2+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = ffffff00, %l3 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000030141408] = 7f78c4ff
	stha	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 7f7800ff
!	%l4 = 00000000000000ff, Mem[00000000100c1418] = 000000ff0f5df043
	stx	%l4,[%i3+0x018]		! Mem[00000000100c1418] = 00000000000000ff
!	Mem[00000000300c1400] = ff000043, %l5 = 000000000000ffff
	lduwa	[%i3+%g0]0x81,%l5	! %l5 = 00000000ff000043

p0_label_428:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001430] = 000000ff, %l6 = 0000000000000087, %asi = 80
	ldsba	[%i0+0x030]%asi,%l6	! %l6 = 0000000000000000
!	%l6 = 0000000000000000, %l4 = 00000000000000ff, %l1  = ffafa80000000000
	mulx	%l6,%l4,%l1		! %l1 = 0000000000000000
!	Mem[0000000010081400] = 0000807f, %l5 = 00000000ff000043
	ldswa	[%i2+%g0]0x80,%l5	! %l5 = 000000000000807f
!	Mem[000000001000143c] = 00000000, %l2 = ffffffffffff00ff, %asi = 80
	ldswa	[%i0+0x03c]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000218001c1] = 8a803bc0, %l5 = 000000000000807f
	ldsb	[%o3+0x1c1],%l5		! %l5 = ffffffffffffff80
!	Mem[0000000030101400] = 000000ff, %l1 = 0000000000000000
	ldsha	[%i4+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = 6dd4dbff00ffffff, %f8  = 7f800000 19ffffff
	ldda	[%i0+%g0]0x88,%f8 	! %f8  = 6dd4dbff 00ffffff
!	Mem[00000000300c1410] = 00000000, %l6 = 0000000000000000
	ldswa	[%i3+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081410] = ff000000, %l7 = 0000000000000dff
	lduwa	[%i2+%o5]0x88,%l7	! %l7 = 00000000ff000000
!	Code Fragment 3, seed = 401844
p0_fragment_32:
!	%l0 = 000000000000ff00
	setx	0x3f98fbda759a5e86,%g7,%l0 ! %l0 = 3f98fbda759a5e86
!	%l1 = 0000000000000000
	setx	0xdcd91e3458d344b1,%g7,%l1 ! %l1 = dcd91e3458d344b1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3f98fbda759a5e86
	setx	0x12922193f552eeec,%g7,%l0 ! %l0 = 12922193f552eeec
!	%l1 = dcd91e3458d344b1
	setx	0x91c6f47aa2bb6037,%g7,%l1 ! %l1 = 91c6f47aa2bb6037
p0_fragment_32_end:

p0_label_429:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 5d0f0000, %l2 = 0000000000000000
	ldstuba	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010041400] = 4f00000000000000, %asi = 80
	stxa	%l2,[%i1+0x000]%asi	! Mem[0000000010041400] = 0000000000000000
!	Mem[0000000030081410] = ffffffff, %l6 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	%l4 = 00000000000000ff, %l0 = 12922193f552eeec, %l4 = 00000000000000ff
	orn	%l4,%l0,%l4		! %l4 = ed6dde6c0aad11ff
!	%f30 = 4fafa800, Mem[0000000010101424] = f1faccff
	sta	%f30,[%i4+0x024]%asi	! Mem[0000000010101424] = 4fafa800
!	%l4 = 0aad11ff, %l5 = ffffff80, Mem[0000000030081400] = 000000ff 00000000
	stda	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 0aad11ff ffffff80
!	%f23 = 00000980, Mem[0000000030141408] = ff00787f
	sta	%f23,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000980
!	%f6  = 43f05d0f ffffffff, %l7 = 00000000ff000000
!	Mem[0000000010101438] = 000000000000008b
	add	%i4,0x038,%g1
	stda	%f6,[%g1+%l7]ASI_PST8_P ! Mem[0000000010101438] = 000000000000008b
!	Mem[0000000010001410] = ffffffff, %l5 = ffffffffffffff80
	ldstuba	[%i0+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081410] = 000000ff, %l5 = 00000000000000ff
	ldstuba	[%i2+%o5]0x80,%l5	! %l5 = 0000000000000000

p0_label_430:
!	Starting 10 instruction Load Burst
!	Mem[000000001010142c] = 00a8af4f, %l6 = 00000000000000ff, %asi = 80
	ldswa	[%i4+0x02c]%asi,%l6	! %l6 = 0000000000a8af4f
!	Mem[0000000010041400] = 00000000, %l7 = 00000000ff000000
	ldsha	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1410] = 0000ffff, %l3 = 00000000000000ff
	lduha	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101400] = 000000ff, %l6 = 0000000000a8af4f
	lduwa	[%i4+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181410] = ff0000ff 00a8af4f, %l4 = 0aad11ff, %l5 = 00000000
	ldda	[%i6+%o5]0x81,%l4	! %l4 = 00000000ff0000ff 0000000000a8af4f
!	Mem[0000000030081410] = ffffffff, %l3 = 0000000000000000
	ldswa	[%i2+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030001408] = 00000000, %l1 = 91c6f47aa2bb6037
	ldsba	[%i0+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c143c] = 00000000, %l5 = 0000000000a8af4f
	ldsw	[%i3+0x03c],%l5		! %l5 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l5 = 0000000000000000
	lduba	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (78)
!	Mem[0000000010081400] = 0000807f 00000000 5d0f0000 000000ff
!	Mem[0000000010081410] = ff0000ff 2a31deff 00ffdbff 7f800000
!	Mem[0000000010081420] = ffc4787f 51d2834c ff83d251 00ffffff
!	Mem[0000000010081430] = 0000004f ffff00ff ff1563ff 55000000
	ldda	[%i2+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010081400

p0_label_431:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001418] = 0000ff2400000000, %l1 = 0000000000000000, %l0 = 12922193f552eeec
	add	%i0,0x18,%g1
	casxa	[%g1]0x80,%l1,%l0	! %l0 = 0000ff2400000000
	membar	#Sync			! Added by membar checker (79)
!	%l2 = 0000000000000000, Mem[0000000010081404] = 00000000
	sth	%l2,[%i2+0x004]		! Mem[0000000010081404] = 00000000
!	%f20 = ff0000ff 2a31deff, %l1 = 0000000000000000
!	Mem[0000000010101410] = 0000000000000000
	add	%i4,0x010,%g1
	stda	%f20,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010101410] = 0000000000000000
!	Mem[00000000201c0000] = 0dffa3b0, %l2 = 0000000000000000
	ldstub	[%o0+%g0],%l2		! %l2 = 000000000000000d
!	%l6 = 00000000000000ff, Mem[00000000211c0001] = 00005a40, %asi = 80
	stba	%l6,[%o2+0x001]%asi	! Mem[00000000211c0000] = 00ff5a40
!	Mem[0000000010181410] = ff00ffff, %l5 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030141408] = 80090000, %l2 = 000000000000000d
	swapa	[%i5+%o4]0x89,%l2	! %l2 = 0000000080090000
!	Mem[00000000100c1410] = 0000ffff, %l5 = 00000000000000ff
	swapa	[%i3+%o5]0x80,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030041408] = 0000ffff, %l1 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l1	! %l1 = 0000000000000000
!	%l7 = 0000000000000000, immd = fffffffffffffdd8, %l108 = 0000000000000000
	sdivx	%l7,-0x228,%l0		! %l0 = 0000000000000000

p0_label_432:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000, %f14 = ff800000
	lda	[%i0+%o4]0x81,%f14	! %f14 = 00000000
!	Mem[0000000030181410] = ff0000ff, %f0  = ff000000
	lda	[%i6+%o5]0x89,%f0 	! %f0 = ff0000ff
!	Mem[00000000300c1408] = 00ff0000, %l4 = 00000000ff0000ff
	ldsba	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l3 = ffffffffffffffff
	lduwa	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = 0000ffff, %l7 = 0000000000000000
	lduha	[%i5+%o5]0x80,%l7	! %l7 = 0000000000000000
	membar	#Sync			! Added by membar checker (80)
!	Mem[0000000010181400] = ff000f5d ffc47800 00000000 ffffffff
!	Mem[0000000010181410] = ff00ffff 000000ff ff000000 00a8afff
!	Mem[0000000010181420] = 00000000 000000ff 000000ff 0000ff00
!	Mem[0000000010181430] = ff000000 0507110d 00000000 000000ff
	ldda	[%i6+%g0]ASI_BLK_PL,%f16	! Block Load from 0000000010181400
!	Mem[0000000010001410] = ffffffff, %l3 = 0000000000000000
	ldswa	[%i0+%o5]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030041400] = 00000000, %l4 = 0000000000000000
	ldsha	[%i1+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1410] = 4fafa80000000000, %f8  = 6dd4dbff 00ffffff
	ldda	[%i3+%o5]0x89,%f8 	! %f8  = 4fafa800 00000000
!	Mem[0000000030101410] = 00000000, %l1 = 0000000000000000
	ldsha	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000000

p0_label_433:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 000000ff, %l6 = 00000000000000ff
	ldstuba	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010101400] = 00000f5d
	stwa	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	Mem[00000000201c0001] = ffffa3b0, %l0 = 0000000000000000
	ldstub	[%o0+0x001],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030181400] = 00000000 00000000 ff0000ff 00000000
!	%f16 = 0078c4ff 5d0f00ff ffffffff 00000000
!	%f20 = ff000000 ffff00ff ffafa800 000000ff
!	%f24 = ff000000 00000000 00ff0000 ff000000
!	%f28 = 0d110705 000000ff ff000000 00000000
	stda	%f16,[%i6+%g0]ASI_BLK_AIUS	! Block Store to 0000000030181400
!	%l7 = 0000000000000000, Mem[0000000010081438] = ff1563ff
	stw	%l7,[%i2+0x038]		! Mem[0000000010081438] = 00000000
!	%l3 = ffffffffffffffff, Mem[0000000010081410] = ff0000ff
	stba	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = ff0000ff
!	Mem[0000000010041400] = 00000000, %l5 = 000000000000ffff
	ldstuba	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010081400] = 7f800000
	stwa	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	%l0 = 00000000000000ff, Mem[0000000030181410] = 000000ff
	stha	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff
!	%l0 = 00000000000000ff, Mem[0000000010041410] = ff000000
	stha	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = ff0000ff

p0_label_434:
!	Starting 10 instruction Load Burst
!	%l4 = 0000000000000000, immd = fffff273, %y  = 00000000
	udiv	%l4,-0xd8d,%l3		! %l3 = 0000000000000000
	mov	%l0,%y			! %y = 000000ff
!	Mem[0000000010081408] = 5d0f0000, %l0 = 00000000000000ff
	lduwa	[%i2+%o4]0x80,%l0	! %l0 = 000000005d0f0000
	membar	#Sync			! Added by membar checker (81)
!	Mem[0000000010081400] = 00000000 00000000 5d0f0000 000000ff
!	Mem[0000000010081410] = ff0000ff 2a31deff 00ffdbff 7f800000
!	Mem[0000000010081420] = ffc4787f 51d2834c ff83d251 00ffffff
!	Mem[0000000010081430] = 0000004f ffff00ff 00000000 55000000
	ldda	[%i2+%g0]ASI_BLK_AIUPL,%f0 	! Block Load from 0000000010081400
!	Mem[0000000010041410] = 00000000ff0000ff, %l5 = 0000000000000000
	ldxa	[%i1+%o5]0x88,%l5	! %l5 = 00000000ff0000ff
!	Mem[0000000030001410] = ff6315ff, %l7 = 0000000000000000
	lduha	[%i0+%o5]0x89,%l7	! %l7 = 00000000000015ff
!	Mem[0000000030141408] = 0d000000, %f29 = 000000ff
	lda	[%i5+%o4]0x81,%f29	! %f29 = 0d000000
!	Mem[0000000030081400] = ff11ad0a, %l7 = 00000000000015ff
	lduwa	[%i2+%g0]0x81,%l7	! %l7 = 00000000ff11ad0a
!	Mem[00000000100c1408] = 0a58ef20000000ff, %f28 = 0d110705 0d000000
	ldda	[%i3+%o4]0x80,%f28	! %f28 = 0a58ef20 000000ff
!	Mem[0000000010101410] = 0000000000000000, %f18 = ffffffff 00000000
	ldda	[%i4+%o5]0x80,%f18	! %f18 = 00000000 00000000
!	Mem[0000000021800101] = ffffe530, %l2 = 0000000080090000
	ldub	[%o3+0x101],%l2		! %l2 = 00000000000000ff

p0_label_435:
!	Starting 10 instruction Store Burst
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010001410] = ffffffff ffffffff
	stda	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000ff 00000000
!	%f15 = 00000000, Mem[0000000030181408] = ffffffff
	sta	%f15,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	%l0 = 000000005d0f0000, Mem[0000000030181410] = ff000000
	stba	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	%l3 = 0000000000000000, Mem[00000000300c1410] = 00000000
	stba	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	%f28 = 0a58ef20 000000ff, Mem[0000000010141400] = 0000ffff 00000000
	stda	%f28,[%i5+%g0]0x88	! Mem[0000000010141400] = 0a58ef20 000000ff
	membar	#Sync			! Added by membar checker (82)
!	%l2 = 00000000000000ff, Mem[0000000010081410] = ff0000ff
	stwa	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff
!	%f20 = ff000000 ffff00ff, Mem[00000000300c1410] = 00000000 00a8af4f
	stda	%f20,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff000000 ffff00ff
!	%l1 = 0000000000000000, Mem[00000000211c0000] = 00ff5a40, %asi = 80
	stba	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ff5a40
!	Mem[0000000010181410] = ff00ffff, %l3 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101408] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l4	! %l4 = 0000000000000000

p0_label_436:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800141] = cc43db60, %l5 = 00000000ff0000ff
	ldub	[%o3+0x141],%l5		! %l5 = 0000000000000043
!	Mem[00000000300c1408] = 0000ff00, %l4 = 0000000000000000
	lduwa	[%i3+%o4]0x81,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030101408] = ff000000, %l5 = 0000000000000043
	lduba	[%i4+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030141400] = 4f1a8284 ddc75649, %l2 = 000000ff, %l3 = 000000ff
	ldda	[%i5+%g0]0x81,%l2	! %l2 = 000000004f1a8284 00000000ddc75649
!	Mem[0000000010181400] = 5d0f00ff, %l0 = 000000005d0f0000
	lduwa	[%i6+%g0]0x88,%l0	! %l0 = 000000005d0f00ff
!	Mem[0000000020800040] = 00ff4c10, %l6 = 0000000000000000, %asi = 80
	lduha	[%o1+0x040]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1400] = ff000043, %l6 = 00000000000000ff
	lduha	[%i3+%g0]0x81,%l6	! %l6 = 000000000000ff00
!	Mem[0000000010181420] = 00000000000000ff, %l3 = 00000000ddc75649
	ldx	[%i6+0x020],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010181408] = 00000000ffffffff, %l0 = 000000005d0f00ff
	ldxa	[%i6+%o4]0x80,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000010141410] = 0000ffff, %l0 = 00000000ffffffff
	ldsba	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000000

p0_label_437:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 00000000, %l5 = 00000000000000ff
	swapa	[%i0+%g0]0x89,%l5	! %l5 = 0000000000000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010041408] = 00000980 20ef580a
	stda	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000 00000000
!	%l2 = 000000004f1a8284, Mem[0000000030181410] = 00000000
	stwa	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 4f1a8284
!	%l2 = 000000004f1a8284, Mem[0000000030101400] = 000000ff
	stwa	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 4f1a8284
!	%l1 = 0000000000000000, Mem[0000000030141408] = 0000000d
	stha	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	%l0 = 0000000000000000, Mem[0000000030001400] = ff000000
	stba	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	Mem[0000000010041408] = 00000000, %l4 = 000000000000ff00
	swapa	[%i1+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[000000001014142c] = ff000000, %l5 = 0000000000000000
	ldstub	[%i5+0x02c],%l5		! %l5 = 00000000000000ff
!	%f0  = 00000000 00000000, Mem[0000000030101400] = 4f1a8284 2a31deff
	stda	%f0 ,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000 00000000
!	%f30 = ff000000 00000000, %l5 = 00000000000000ff
!	Mem[00000000100c1410] = ff0000ff00000000
	add	%i3,0x010,%g1
	stda	%f30,[%g1+%l5]ASI_PST32_PL ! Mem[00000000100c1410] = 00000000000000ff

p0_label_438:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00000000, %l2 = 000000004f1a8284
	ldsha	[%i5+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1424] = ffffffff, %l4 = 0000000000000000, %asi = 80
	lduha	[%i3+0x024]%asi,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010141410] = ffff0000, %f27 = ff000000
	lda	[%i5+%o5]0x88,%f27	! %f27 = ffff0000
!	Mem[0000000010141400] = ff000000, %f0  = 00000000
	lda	[%i5+0x000]%asi,%f0 	! %f0 = ff000000
!	%f27 = ffff0000, %f31 = 00000000
	fcmpes	%fcc3,%f27,%f31		! %fcc3 = 3
!	Mem[000000001010141c] = ff000000, %l3 = 00000000000000ff, %asi = 80
	lduwa	[%i4+0x01c]%asi,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010001420] = ff000000, %l5 = 00000000000000ff, %asi = 80
	ldswa	[%i0+0x020]%asi,%l5	! %l5 = ffffffffff000000
!	Mem[0000000010181408] = 00000000, %l4 = 000000000000ffff
	lduba	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181400] = 0078c4ff5d0f00ff, %l1 = 0000000000000000
	ldxa	[%i6+%g0]0x81,%l1	! %l1 = 0078c4ff5d0f00ff
!	Mem[00000000100c1410] = ff00000000000000, %l7 = 00000000ff11ad0a
	ldxa	[%i3+%o5]0x88,%l7	! %l7 = ff00000000000000

p0_label_439:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000, %l1 = 5d0f00ff, Mem[0000000030041400] = 00000000 000000ff
	stda	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000 5d0f00ff
!	Mem[00000000100c1400] = ffafa80000000000, %l5 = ffffffffff000000, %l4 = 0000000000000000
	casxa	[%i3]0x80,%l5,%l4	! %l4 = ffafa80000000000
!	Mem[00000000300c1400] = ff000043, %l1 = 0078c4ff5d0f00ff
	ldstuba	[%i3+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	%f8  = 4c83d251 7f78c4ff, Mem[0000000010001410] = ff000000 00000000
	stda	%f8 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 4c83d251 7f78c4ff
!	%l4 = ffafa80000000000, Mem[0000000010041430] = 000000001c368aff, %asi = 80
	stxa	%l4,[%i1+0x030]%asi	! Mem[0000000010041430] = ffafa80000000000
!	%l0 = 00000000, %l1 = 000000ff, Mem[00000000100c1408] = 0a58ef20 000000ff
	stda	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 000000ff
!	%f14 = 00000055 00000000, Mem[0000000030141410] = ffffc4ff 19ffffff
	stda	%f14,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000055 00000000
!	Mem[00000000100c1400] = ffafa800, %l2 = 00000000, %l0 = 00000000
	casa	[%i3]0x80,%l2,%l0	! %l0 = 00000000ffafa800
!	%l6 = 000000000000ff00, Mem[0000000010081408] = 00000f5d
	stwa	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000ff00
!	%l6 = 000000000000ff00, Mem[000000001004143e] = 00000000, %asi = 80
	stha	%l6,[%i1+0x03e]%asi	! Mem[000000001004143c] = 0000ff00

p0_label_440:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 000000ff, %l3 = 00000000ff000000
	lduba	[%i5+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081408] = 00ff0000, %l4 = ffafa80000000000
	lduha	[%i2+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041408] = 00ff0000, %l5 = ffffffffff000000
	lduba	[%i1+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101408] = 000000ff, %l1 = 00000000000000ff
	ldswa	[%i4+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001418] = 0000ff2400000000, %l0 = 00000000ffafa800, %asi = 80
	ldxa	[%i0+0x018]%asi,%l0	! %l0 = 0000ff2400000000
!	Mem[0000000010141400] = ff000000, %l1 = 00000000000000ff
	lduha	[%i5+%g0]0x80,%l1	! %l1 = 000000000000ff00
!	Mem[00000000100c1400] = ffafa800 00000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i3+%g0]0x80,%l4	! %l4 = 00000000ffafa800 0000000000000000
!	Mem[0000000010041400] = 000000ff, %l6 = 000000000000ff00
	lduba	[%i1+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041400] = 00000000, %l3 = 00000000000000ff
	lduha	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101408] = 000000ff, %l2 = 0000000000000000
	lduwa	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000ff

p0_label_441:
!	Starting 10 instruction Store Burst
!	%f14 = 00000055 00000000, %l6 = 00000000000000ff
!	Mem[0000000030041410] = ff1500ff00000020
	add	%i1,0x010,%g1
	stda	%f14,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030041410] = 0000000055000000
!	%f20 = ff000000 ffff00ff, Mem[0000000010001408] = ffffffff 63000000, %asi = 80
	stda	%f20,[%i0+0x008]%asi	! Mem[0000000010001408] = ff000000 ffff00ff
!	%f26 = 00ff0000, %f5  = ff0000ff, %f13 = 4f000000
	fdivs	%f26,%f5 ,%f13		! %f13 = 80000000
!	%l0 = 0000ff2400000000, Mem[0000000010141410] = ffff0000
	stha	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = ffff0000
!	%l1 = 000000000000ff00, Mem[0000000010001404] = ffdbd46d
	sth	%l1,[%i0+0x004]		! Mem[0000000010001404] = ff00d46d
!	Mem[0000000010001400] = ffffff00, %l1 = 000000000000ff00
	ldstuba	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000010181410] = ff00ffff000000ff
	stxa	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000000000ff
!	Mem[0000000010181408] = 00000000, %l7 = 00000000, %l6 = 000000ff
	add	%i6,0x08,%g1
	casa	[%g1]0x80,%l7,%l6	! %l6 = 0000000000000000
!	%l7 = ff00000000000000, Mem[0000000030001408] = 00000000
	stha	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	%f6  = 0000807f, Mem[0000000030001408] = 00000000
	sta	%f6 ,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000807f

p0_label_442:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001430] = 000000ff, %l3 = 0000000000000000, %asi = 80
	ldsha	[%i0+0x030]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = 0000000000000000, %f18 = 00000000 00000000
	ldda	[%i2+%g0]0x88,%f18	! %f18 = 00000000 00000000
!	Mem[0000000010141410] = ffff0000, %l4 = 00000000ffafa800
	ldsba	[%i5+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181410] = 84821a4f, %l7 = ff00000000000000
	lduwa	[%i6+%o5]0x81,%l7	! %l7 = 0000000084821a4f
!	Mem[0000000020800000] = 0011b9e0, %l2 = 00000000000000ff, %asi = 80
	ldsba	[%o1+0x000]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1434] = 77985c3d, %l5 = 0000000000000000
	lduw	[%i3+0x034],%l5		! %l5 = 0000000077985c3d
!	Mem[00000000100c1402] = ffafa800, %l0 = 0000ff2400000000
	lduh	[%i3+0x002],%l0		! %l0 = 000000000000a800
!	%l5 = 0000000077985c3d, Mem[0000000010141410] = 0000ffff
	stwa	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = 77985c3d
!	Mem[00000000300c1400] = ff000043, %l7 = 0000000084821a4f
	ldsha	[%i3+%g0]0x81,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000030081400] = ff11ad0a80ffffff, %f18 = 00000000 00000000
	ldda	[%i2+%g0]0x81,%f18	! %f18 = ff11ad0a 80ffffff

p0_label_443:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000030141410] = 0000000055000000
	stxa	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000000000000
!	Mem[0000000030081400] = 0aad11ff, %l3 = 0000000000000000
	ldstuba	[%i2+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%l7 = ffffffffffffff00, immd = 0000000000000f55, %l108 = 0000000000000003
	sdivx	%l7,0xf55,%l3		! %l3 = 0000000000000000
!	Mem[00000000100c143e] = 00000000, %l7 = ffffffffffffff00
	ldstuba	[%i3+0x03e]%asi,%l7	! %l7 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000030181410] = 84821a4fffff00ff
	stxa	%l3,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000000000000000
!	%l0 = 000000000000a800, Mem[000000001008143e] = 55000000, %asi = 80
	stha	%l0,[%i2+0x03e]%asi	! Mem[000000001008143c] = 5500a800
!	Mem[0000000010101410] = 00000000, %l1 = 00000000000000ff
	ldstuba	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1408] = 00ff0000, %l2 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l2	! %l2 = 0000000000ff0000
!	%f20 = ff000000 ffff00ff, Mem[00000000100c1410] = 00000000 000000ff
	stda	%f20,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff000000 ffff00ff
!	%l7 = 0000000000000000, Mem[0000000030141408] = 00000000
	stba	%l7,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000

p0_label_444:
!	Starting 10 instruction Load Burst
!	Mem[000000001000141c] = 00000000, %l0 = 000000000000a800
	lduw	[%i0+0x01c],%l0		! %l0 = 0000000000000000
!	Mem[0000000010041400] = 000000ff, %l2 = 0000000000ff0000
	ldsha	[%i1+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1400] = 430000ff, %f17 = 5d0f00ff
	lda	[%i3+%g0]0x89,%f17	! %f17 = 430000ff
!	Mem[0000000030141408] = 4c83d25100000000, %f12 = ff00ffff 80000000
	ldda	[%i5+%o4]0x89,%f12	! %f12 = 4c83d251 00000000
!	Mem[0000000010181408] = 000000ff, %l5 = 0000000077985c3d
	ldsha	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l4 = 0000000000000000
	ldsba	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %l3 = 0000000000000000
	ldswa	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000201c0000] = ffffa3b0, %l0 = 0000000000000000, %asi = 80
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 000000000000ffff
!	Mem[00000000100c1410] = ff000000, %f13 = 00000000
	lda	[%i3+%o5]0x80,%f13	! %f13 = ff000000
!	Mem[0000000030181410] = 00000000, %l0 = 000000000000ffff
	lduwa	[%i6+%o5]0x89,%l0	! %l0 = 0000000000000000

p0_label_445:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000030081410] = ffffffff
	stba	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffff00
!	%l0 = 0000000000000000, Mem[0000000010141400] = 000000ff
	stwa	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	%f18 = ff11ad0a, Mem[0000000030001400] = 00000000
	sta	%f18,[%i0+%g0]0x81	! Mem[0000000030001400] = ff11ad0a
!	Mem[0000000020800000] = 0011b9e0, %l1 = 0000000000000000
	ldstuba	[%o1+0x000]%asi,%l1	! %l1 = 0000000000000000
!	%l4 = 0000000000000000, Mem[000000001018143c] = 000000ff
	stw	%l4,[%i6+0x03c]		! Mem[000000001018143c] = 00000000
!	%l5 = 0000000000000000, Mem[0000000030181400] = 0078c4ff5d0f00ff
	stxa	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000000000000
!	%f28 = 0a58ef20, Mem[0000000030181400] = 00000000
	sta	%f28,[%i6+%g0]0x81	! Mem[0000000030181400] = 0a58ef20
!	Mem[0000000020800001] = ff11b9e0, %l7 = 0000000000000000
	ldstuba	[%o1+0x001]%asi,%l7	! %l7 = 0000000000000011
!	Mem[0000000030081408] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l2 = 00000000000000ff
	swapa	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000000

p0_label_446:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1414] = ffff00ff, %l2 = 0000000000000000, %asi = 80
	lduwa	[%i3+0x014]%asi,%l2	! %l2 = 00000000ffff00ff
!	Mem[0000000030001410] = ff1563ff, %l5 = 0000000000000000
	lduba	[%i0+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101400] = 00000000, %l5 = 00000000000000ff
	lduwa	[%i4+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041410] = ff0000ff 00000000, %l2 = ffff00ff, %l3 = 00000000
	ldda	[%i1+%o5]0x80,%l2	! %l2 = 00000000ff0000ff 0000000000000000
!	Mem[0000000010001410] = ffc4787f, %l7 = 0000000000000011
	ldsha	[%i0+%o5]0x80,%l7	! %l7 = ffffffffffffffc4
!	Mem[0000000020800000] = ffffb9e0, %l2 = 00000000ff0000ff, %asi = 80
	lduba	[%o1+0x000]%asi,%l2	! %l2 = 00000000000000ff
	membar	#Sync			! Added by membar checker (83)
!	Mem[0000000010041400] = ff000000 00000000 0000ff00 00000000
!	Mem[0000000010041410] = ff0000ff 00000000 00000000 ffffffff
!	Mem[0000000010041420] = ffffffff 00ffffff ffffffff 00000f5d
!	Mem[0000000010041430] = ffafa800 00000000 00000000 0000ff00
	ldda	[%i1+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	Mem[0000000010141434] = 73ffb0ec, %l4 = 0000000000000000, %asi = 80
	ldsha	[%i5+0x034]%asi,%l4	! %l4 = 00000000000073ff
!	Mem[0000000010101408] = 00ff0000, %l4 = 00000000000073ff
	lduba	[%i4+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l7 = ffffffffffffffc4
	ldsba	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000

p0_label_447:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = ff000000, %l3 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l3	! %l3 = 00000000ff000000
!	%l1 = 0000000000000000, Mem[00000000100c1408] = 00000000000000ff
	stxa	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000000000
!	Mem[000000001010142e] = 00a8af4f, %l7 = 0000000000000000
	ldstuba	[%i4+0x02e]%asi,%l7	! %l7 = 00000000000000af
!	%l4 = 0000000000000000, Mem[00000000201c0000] = ffffa3b0
	stb	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 00ffa3b0
!	%f30 = 00000000 0000ff00, Mem[00000000100c1400] = ffafa800 00000000, %asi = 80
	stda	%f30,[%i3+0x000]%asi	! Mem[00000000100c1400] = 00000000 0000ff00
!	Mem[0000000010101428] = 66228fc300a8ff4f, %l6 = 0000000000000000, %l1 = 0000000000000000
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l6,%l1	! %l1 = 66228fc300a8ff4f
!	%f30 = 00000000 0000ff00, Mem[0000000030141400] = 84821a4f 4956c7dd
	stda	%f30,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 0000ff00
!	%l0 = 0000000000000000, imm = fffffffffffff802, %l1 = 66228fc300a8ff4f
	and	%l0,-0x7fe,%l1		! %l1 = 0000000000000000
!	%f2  = ff000000 00000f5d, Mem[0000000010081400] = 00000000 00000000
	stda	%f2 ,[%i2+%g0]0x80	! Mem[0000000010081400] = ff000000 00000f5d
!	%l5 = 0000000000000000, Mem[0000000030041408] = ff00ffff
	stba	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000ffff

p0_label_448:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00ff0000, %l2 = 00000000000000ff
	lduha	[%i2+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081408] = 00ff0000, %l0 = 0000000000000000
	ldsba	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141408] = 00000000, %f11 = 51d283ff
	lda	[%i5+%o4]0x89,%f11	! %f11 = 00000000
!	Mem[0000000030101410] = 00000000, %l1 = 0000000000000000
	lduha	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001413] = ffc4787f, %l7 = 00000000000000af, %asi = 80
	ldsba	[%i0+0x013]%asi,%l7	! %l7 = 000000000000007f
!	%l0 = 0000000000000000, %l6 = 0000000000000000, %l7  = 000000000000007f
	mulx	%l0,%l6,%l7		! %l7 = 0000000000000000
!	Mem[00000000218000c0] = 00556b00, %l5 = 0000000000000000
	ldsb	[%o3+0x0c0],%l5		! %l5 = 0000000000000000
!	Mem[0000000010141400] = 0a58ef20 00000000, %l2 = 000000ff, %l3 = ff000000
	ldda	[%i5+%g0]0x88,%l2	! %l2 = 0000000000000000 000000000a58ef20
!	Mem[00000000300c1408] = 00000000, %l5 = 0000000000000000
	ldswa	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081408] = ff00000000000000, %f10 = ffffff00 00000000
	ldda	[%i2+%o4]0x81,%f10	! %f10 = ff000000 00000000

p0_label_449:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 430000ff, %l5 = 0000000000000000
	ldstuba	[%i3+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101418] = 1ccbffdaff000000, %l5 = 00000000000000ff, %l6 = 0000000000000000
	add	%i4,0x18,%g1
	casxa	[%g1]0x80,%l5,%l6	! %l6 = 1ccbffdaff000000
!	%f5  = ff0000ff, Mem[0000000030001400] = ff11ad0a
	sta	%f5 ,[%i0+%g0]0x81	! Mem[0000000030001400] = ff0000ff
!	Mem[000000001008141d] = 7f800000, %l0 = 0000000000000000
	ldstub	[%i2+0x01d],%l0		! %l0 = 0000000000000080
!	Mem[0000000010101420] = 000000ff, %l2 = 00000000, %l1 = 00000000
	add	%i4,0x20,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 00000000000000ff
!	%l3 = 000000000a58ef20, Mem[00000000201c0000] = 00ffa3b0, %asi = 80
	stba	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 20ffa3b0
!	%f12 = 4c83d251, Mem[0000000030141400] = 0000ff00
	sta	%f12,[%i5+%g0]0x89	! Mem[0000000030141400] = 4c83d251
!	Mem[0000000010181408] = ff000000, %l4 = 0000000000000000
	swapa	[%i6+%o4]0x88,%l4	! %l4 = 00000000ff000000
!	%l0 = 00000080, %l1 = 000000ff, Mem[0000000030101410] = 00000000 00000000
	stda	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000080 000000ff
!	%l6 = ff000000, %l7 = 00000000, Mem[0000000030101400] = 00000000 00000000
	stda	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = ff000000 00000000

p0_label_450:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ffff0000, %f15 = 00000000
	lda	[%i1+%o4]0x89,%f15	! %f15 = ffff0000
!	Mem[0000000030081410] = 4fafa800ffffff00, %f18 = 0000ff00 00000000
	ldda	[%i2+%o5]0x89,%f18	! %f18 = 4fafa800 ffffff00
!	Mem[0000000030001408] = 7f800000, %l5 = 00000000000000ff
	swapa	[%i0+%o4]0x89,%l5	! %l5 = 000000007f800000
!	Mem[0000000030001408] = ff000000 00000000, %l4 = ff000000, %l5 = 7f800000
	ldda	[%i0+%o4]0x81,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Mem[0000000030081400] = 0aad11ff, %l7 = 0000000000000000
	lduwa	[%i2+%g0]0x89,%l7	! %l7 = 000000000aad11ff
!	Mem[00000000300c1400] = 430000ff, %l5 = 0000000000000000
	lduba	[%i3+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Code Fragment 4, seed = 893198
p0_fragment_33:
!	%l0 = 0000000000000080
	setx	0x12abaa7e227eddb6,%g7,%l0 ! %l0 = 12abaa7e227eddb6
!	%l1 = 00000000000000ff
	setx	0xbc0c16b5a9e35ce1,%g7,%l1 ! %l1 = bc0c16b5a9e35ce1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 12abaa7e227eddb6
	setx	0x011ec975cd6f501c,%g7,%l0 ! %l0 = 011ec975cd6f501c
!	%l1 = bc0c16b5a9e35ce1
	setx	0xb5ba1dac80a5ba67,%g7,%l1 ! %l1 = b5ba1dac80a5ba67
p0_fragment_33_end:
!	Mem[0000000030041410] = 00000000 55000000, %l4 = ff000000, %l5 = 000000ff
	ldda	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000 0000000055000000
!	Mem[00000000300c1400] = ff000043 00000000, %l6 = ff000000, %l7 = 0aad11ff
	ldda	[%i3+%g0]0x81,%l6	! %l6 = 00000000ff000043 0000000000000000
!	Mem[0000000010141410] = 77985c3d 00000000, %l4 = 00000000, %l5 = 55000000
	ldda	[%i5+%o5]0x80,%l4	! %l4 = 0000000077985c3d 0000000000000000

p0_label_451:
!	Starting 10 instruction Store Burst
!	%f24 = ffffffff 00ffffff, Mem[0000000030181410] = 00000000 00000000
	stda	%f24,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffffff 00ffffff
!	%f12 = 4c83d251 ff000000, %l3 = 000000000a58ef20
!	Mem[00000000100c1438] = 000000000000ff00
	add	%i3,0x038,%g1
	stda	%f12,[%g1+%l3]ASI_PST8_P ! Mem[00000000100c1438] = 0000d2000000ff00
!	%l6 = 00000000ff000043, Mem[0000000010001408] = 00000000
	stha	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000043
!	Mem[0000000010001400] = 00ffffff, %l7 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l7	! %l7 = 0000000000ffffff
!	%f12 = 4c83d251 ff000000, Mem[0000000010101400] = 00000000 ff000000
	stda	%f12,[%i4+%g0]0x88	! Mem[0000000010101400] = 4c83d251 ff000000
!	%f6  = 0000807f, Mem[0000000010181408] = 00000000
	sta	%f6 ,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000807f
!	%l5 = 0000000000000000, Mem[0000000010141410] = 3d5c9877
	stwa	%l5,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	Mem[0000000010041400] = ff000000, %l7 = 0000000000ffffff
	ldstuba	[%i1+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	%l7 = 00000000000000ff, immd = fffffce9, %y  = 000000ff
	umul	%l7,-0x317,%l5		! %l5 = 000000fefffcec17, %y = 000000fe
!	%l0 = 011ec975cd6f501c, Mem[0000000010141400] = 00000000
	stha	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000501c

p0_label_452:
!	Starting 10 instruction Load Burst
!	%l0 = 011ec975cd6f501c, imm = 0000000000000dbe, %l4 = 0000000077985c3d
	andn	%l0,0xdbe,%l4		! %l4 = 011ec975cd6f5000
!	Mem[0000000010181408] = 0000807f, %l1 = b5ba1dac80a5ba67
	lduba	[%i6+%o4]0x88,%l1	! %l1 = 000000000000007f
!	%l2 = 0000000000000000, immd = 00000972, %y  = 000000fe
	sdiv	%l2,0x972,%l0		! %l0 = 000000001ae442e9
	mov	%l0,%y			! %y = 1ae442e9
!	Mem[0000000030141410] = 00000000, %l2 = 0000000000000000
	ldsha	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000
!	%l5 = 000000fefffcec17, immd = fffffffffffff127, %l108 = 0000000000000004
	udivx	%l5,-0xed9,%l4		! %l4 = 0000000000000000
!	Mem[00000000100c1426] = ffffffff, %l2 = 0000000000000000
	lduh	[%i3+0x026],%l2		! %l2 = 000000000000ffff
!	Mem[00000000300c1408] = 00000000 00000066, %l4 = 00000000, %l5 = fffcec17
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000000 0000000000000066
!	Mem[00000000100c1410] = ff000000, %l1 = 000000000000007f
	ldsha	[%i3+%o5]0x80,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000010141408] = 000000ff, %l4 = 0000000000000000
	lduha	[%i5+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081400] = ff000000 00000f5d, %l6 = ff000043, %l7 = 000000ff
	ldda	[%i2+%g0]0x80,%l6	! %l6 = 00000000ff000000 0000000000000f5d

p0_label_453:
!	Starting 10 instruction Store Burst
!	%f24 = ffffffff 00ffffff, %l6 = 00000000ff000000
!	Mem[00000000100c1420] = ffffff00ffffffff
	add	%i3,0x020,%g1
	stda	%f24,[%g1+%l6]ASI_PST8_PL ! Mem[00000000100c1420] = ffffff00ffffffff
!	Mem[0000000010101400] = 000000ff, %l5 = 0000000000000066
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 0000000000000000
!	%l2 = 000000000000ffff, %l0 = 000000001ae442e9, %l4 = 00000000000000ff
	add	%l2,%l0,%l4		! %l4 = 000000001ae542e8
!	%l6 = 00000000ff000000, Mem[0000000010101408] = 00ff0000
	stwa	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = ff000000
!	%f8  = 4c83d251, Mem[00000000100c140c] = 00000000
	st	%f8 ,[%i3+0x00c]	! Mem[00000000100c140c] = 4c83d251
!	%l6 = 00000000ff000000, Mem[0000000030141400] = 4c83d251
	stba	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 4c83d200
!	%f28 = ffafa800 00000000, Mem[0000000010181400] = 5d0f00ff 0078c4ff
	stda	%f28,[%i6+%g0]0x88	! Mem[0000000010181400] = ffafa800 00000000
!	%f20 = ff0000ff 00000000, %l7 = 0000000000000f5d
!	Mem[00000000300c1438] = 0000000000000000
	add	%i3,0x038,%g1
	stda	%f20,[%g1+%l7]ASI_PST32_SL ! Mem[00000000300c1438] = 0000000000000000
!	%l2 = 000000000000ffff, Mem[0000000010101408] = ff000000000000ff
	stxa	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000000000ffff
!	%l4 = 000000001ae542e8, Mem[0000000030001400] = ff000000ff0000ff
	stxa	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000001ae542e8

p0_label_454:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ff000000, %l6 = 00000000ff000000
	lduha	[%i0+%o4]0x81,%l6	! %l6 = 000000000000ff00
!	Mem[0000000010141400] = 0000501c, %f21 = 00000000
	lda	[%i5+%g0]0x88,%f21	! %f21 = 0000501c
!	Mem[0000000030141400] = 4c83d200, %l7 = 0000000000000f5d
	lduba	[%i5+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181400] = 0a58ef20, %f24 = ffffffff
	lda	[%i6+%g0]0x81,%f24	! %f24 = 0a58ef20
!	Mem[0000000030081410] = 00ffffff, %l2 = 000000000000ffff
	ldswa	[%i2+%o5]0x81,%l2	! %l2 = 0000000000ffffff
!	Mem[0000000010001410] = 7f78c4ff, %l3 = 000000000a58ef20
	ldswa	[%i0+%o5]0x88,%l3	! %l3 = 000000007f78c4ff
!	%l2 = 0000000000ffffff, %l4 = 000000001ae542e8, %y  = 1ae442e9
	umul	%l2,%l4,%l0		! %l0 = 001ae542cd1abd18, %y = 001ae542
!	Mem[0000000010081410] = ff000000, %l7 = 0000000000000000
	ldsha	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041420] = ffffffff00ffffff, %l5 = 0000000000000000
	ldx	[%i1+0x020],%l5		! %l5 = ffffffff00ffffff
!	Mem[0000000010101410] = ff000000, %l0 = 001ae542cd1abd18
	lduwa	[%i4+%o5]0x80,%l0	! %l0 = 00000000ff000000

p0_label_455:
!	Starting 10 instruction Store Burst
!	%l4 = 000000001ae542e8, Mem[0000000030101400] = 000000ff
	stha	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 42e800ff
!	%l7 = 0000000000000000, Mem[00000000100c1400] = 00000000
	stba	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	%l1 = ffffffffffffff00, Mem[0000000010001410] = 7f78c4ff
	stba	%l1,[%i0+%o5]0x88	! Mem[0000000010001410] = 7f78c400
!	Mem[0000000030181408] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l7	! %l7 = 0000000000000000
!	%f28 = ffafa800 00000000, %l1 = ffffffffffffff00
!	Mem[0000000030181418] = ffafa800000000ff
	add	%i6,0x018,%g1
	stda	%f28,[%g1+%l1]ASI_PST16_S ! Mem[0000000030181418] = ffafa800000000ff
!	%l5 = ffffffff00ffffff, Mem[0000000030101410] = 00000080
	stha	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000ffff
!	Mem[0000000030141410] = 00000000, %f27 = 00000f5d
	lda	[%i5+%o5]0x89,%f27	! %f27 = 00000000
!	%f28 = ffafa800 00000000, Mem[0000000010181428] = 000000ff 0000ff00
	std	%f28,[%i6+0x028]	! Mem[0000000010181428] = ffafa800 00000000
!	Mem[0000000010141400] = 1c500000, %l4 = 000000001ae542e8
	ldstuba	[%i5+%g0]0x80,%l4	! %l4 = 000000000000001c
!	%l6 = 000000000000ff00, Mem[0000000010081408] = 0000ff00
	stwa	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000ff00

p0_label_456:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 4fafa800 ffffff00, %l4 = 0000001c, %l5 = 00ffffff
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 00000000ffffff00 000000004fafa800
!	Mem[0000000030001410] = ff1563ff, %l6 = 000000000000ff00
	ldsba	[%i0+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000100c1428] = 4c83d251, %l5 = 000000004fafa800, %asi = 80
	lduba	[%i3+0x028]%asi,%l5	! %l5 = 000000000000004c
!	Mem[00000000100c140b] = 00000000, %l1 = ffffffffffffff00, %asi = 80
	lduba	[%i3+0x00b]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l4 = 00000000ffffff00
	lduha	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101410] = 0000ffff, %f7  = ffdbff00
	lda	[%i4+%o5]0x89,%f7 	! %f7 = 0000ffff
!	Mem[0000000010141437] = 73ffb0ec, %l0 = 00000000ff000000
	ldub	[%i5+0x037],%l0		! %l0 = 00000000000000ec
!	Mem[0000000010181410] = 00000000, %l0 = 00000000000000ec
	ldsha	[%i6+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l7 = 0000000000000000
	lduba	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000211c0000] = 00ff5a40, %l1 = 0000000000000000, %asi = 80
	lduha	[%o2+0x000]%asi,%l1	! %l1 = 00000000000000ff

p0_label_457:
!	Starting 10 instruction Store Burst
!	%l3 = 000000007f78c4ff, Mem[0000000010101410] = ff000000
	stwa	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 7f78c4ff
!	Mem[00000000218001c0] = 8a803bc0, %l2 = 0000000000ffffff
	ldstub	[%o3+0x1c0],%l2		! %l2 = 000000000000008a
!	%l7 = 0000000000000000, Mem[00000000100c1408] = 00000000
	stha	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	%l5 = 000000000000004c, Mem[0000000021800000] = ff00e470
	sth	%l5,[%o3+%g0]		! Mem[0000000021800000] = 004ce470
!	Mem[00000000100c1428] = 4c83d251, %l2 = 0000008a, %l0 = 00000000
	add	%i3,0x28,%g1
	casa	[%g1]0x80,%l2,%l0	! %l0 = 000000004c83d251
	membar	#Sync			! Added by membar checker (84)
!	%l0 = 000000004c83d251, Mem[0000000010041408] = 0000ff00
	stwa	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 4c83d251
!	Mem[0000000010141401] = ff500000, %l7 = 0000000000000000
	ldstub	[%i5+0x001],%l7		! %l7 = 0000000000000050
!	%l1 = 00000000000000ff, Mem[00000000100c1410] = ff000000ffff00ff
	stxa	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000000000ff
!	%l5 = 000000000000004c, Mem[0000000010041408] = 4c83d251
	stha	%l5,[%i1+%o4]0x80	! Mem[0000000010041408] = 004cd251
!	Mem[0000000010081410] = 000000ff, %l6 = 00000000ffffffff
	swapa	[%i2+%o5]0x80,%l6	! %l6 = 00000000000000ff

p0_label_458:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 4c83d251 ff0000ff, %l2 = 0000008a, %l3 = 7f78c4ff
	ldda	[%i4+%g0]0x88,%l2	! %l2 = 00000000ff0000ff 000000004c83d251
!	Mem[0000000030041400] = 000000ff, %l4 = 0000000000000000
	lduba	[%i1+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[000000001014140c] = 00009840, %l7 = 0000000000000050
	lduw	[%i5+0x00c],%l7		! %l7 = 0000000000009840
!	Mem[0000000030081408] = ff00000000000000, %f12 = 4c83d251 ff000000
	ldda	[%i2+%o4]0x81,%f12	! %f12 = ff000000 00000000
!	Mem[0000000030081410] = ffffff00, %l4 = 0000000000000000
	lduha	[%i2+%o5]0x89,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010001408] = 43000000, %l7 = 0000000000009840, %asi = 80
	ldsha	[%i0+0x008]%asi,%l7	! %l7 = 0000000000004300
!	Mem[0000000010101410] = ffc4787f, %l2 = 00000000ff0000ff
	lduha	[%i4+%o5]0x88,%l2	! %l2 = 000000000000787f
!	Mem[0000000010041410] = ff0000ff, %l2 = 000000000000787f
	lduha	[%i1+%o5]0x80,%l2	! %l2 = 000000000000ff00
!	%f24 = 0a58ef20, %f23 = ffffffff, %f19 = ffffff00
	fadds	%f24,%f23,%f19		! %f19 = ffffffff
!	Mem[00000000100c1408] = 51d2834c 00000000, %l4 = 0000ff00, %l5 = 0000004c
	ldda	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000000 0000000051d2834c

p0_label_459:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 00000000, %l7 = 0000000000004300
	ldstuba	[%i3+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800000] = ffffb9e0, %l2 = 000000000000ff00
	ldstub	[%o1+%g0],%l2		! %l2 = 00000000000000ff
!	Mem[0000000030001400] = 1ae542e8, %l3 = 000000004c83d251
	ldstuba	[%i0+%g0]0x89,%l3	! %l3 = 00000000000000e8
!	%f2  = ff000000 00000f5d, Mem[0000000010181400] = 00000000 ffafa800
	stda	%f2 ,[%i6+%g0]0x88	! Mem[0000000010181400] = ff000000 00000f5d
!	Mem[0000000010101430] = 1ccbffda, %l2 = 00000000000000ff, %asi = 80
	swapa	[%i4+0x030]%asi,%l2	! %l2 = 000000001ccbffda
!	Mem[0000000010041410] = ff0000ff, %l1 = 00000000000000ff
	swapa	[%i1+%o5]0x88,%l1	! %l1 = 00000000ff0000ff
!	Mem[0000000010081408] = 0000ff00, %l0 = 000000004c83d251
	swapa	[%i2+%o4]0x88,%l0	! %l0 = 000000000000ff00
!	%l4 = 00000000, %l5 = 51d2834c, Mem[00000000100c1408] = 00000000 4c83d251
	stda	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 51d2834c
!	%l4 = 00000000, %l5 = 51d2834c, Mem[00000000100c1400] = 00000000 00ff0000
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 51d2834c
!	%l6 = 00000000000000ff, Mem[000000001014141a] = 20ef580a, %asi = 80
	stba	%l6,[%i5+0x01a]%asi	! Mem[0000000010141418] = 20efff0a

p0_label_460:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 004cd251, %l3 = 00000000000000e8
	lduha	[%i1+%o4]0x80,%l3	! %l3 = 000000000000004c
!	Mem[00000000218001c0] = ff803bc0, %l0 = 000000000000ff00
	lduh	[%o3+0x1c0],%l0		! %l0 = 000000000000ff80
!	Mem[0000000030141400] = 00d2834c 00000000 00000000 51d2834c
!	Mem[0000000030141410] = 00000000 00000000 ffffffff 0f5df043
!	Mem[0000000030141420] = ffffff19 ffffffff 4c83d251 7f78c4ff
!	Mem[0000000030141430] = ff000000 77985c3d 00000000 00000000
	ldda	[%i5+%g0]ASI_BLK_SL,%f16	! Block Load from 0000000030141400
!	Mem[0000000010001400] = 00000000, %l7 = 0000000000000000
	lduwa	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = 7f800000, %l7 = 0000000000000000
	lduwa	[%i6+%o4]0x80,%l7	! %l7 = 000000007f800000
!	Mem[00000000100c1410] = ff000000, %f12 = ff000000
	lda	[%i3+%o5]0x80,%f12	! %f12 = ff000000
!	Mem[0000000010081410] = ffffffff, %l7 = 000000007f800000
	ldswa	[%i2+%o5]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030041408] = 43ccfaf1ffff0000, %f6  = 0000807f 0000ffff
	ldda	[%i1+%o4]0x89,%f6 	! %f6  = 43ccfaf1 ffff0000
!	Mem[0000000010141410] = 00000000, %l1 = 00000000ff0000ff
	lduha	[%i5+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = 7f78c4ff, %l1 = 0000000000000000
	ldswa	[%i4+%o5]0x80,%l1	! %l1 = 000000007f78c4ff

p0_label_461:
!	Starting 10 instruction Store Burst
!	%l2 = 1ccbffda, %l3 = 0000004c, Mem[0000000010041408] = 004cd251 00000000, %asi = 80
	stda	%l2,[%i1+0x008]%asi	! Mem[0000000010041408] = 1ccbffda 0000004c
!	%f2  = ff000000 00000f5d, Mem[0000000010101428] = 66228fc3 00a8ff4f
	std	%f2 ,[%i4+0x028]	! Mem[0000000010101428] = ff000000 00000f5d
!	%l6 = 000000ff, %l7 = ffffffff, Mem[0000000010041410] = ff000000 00000000
	stda	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000ff ffffffff
!	%f10 = ff000000 00000000, Mem[00000000100c1408] = 00000000 51d2834c
	stda	%f10,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff000000 00000000
!	Mem[0000000020800001] = ffffb9e0, %l1 = 000000007f78c4ff
	ldstuba	[%o1+0x001]%asi,%l1	! %l1 = 00000000000000ff
!	%f28 = 3d5c9877 000000ff, %l4 = 0000000000000000
!	Mem[0000000010181438] = 0000000000000000
	add	%i6,0x038,%g1
	stda	%f28,[%g1+%l4]ASI_PST32_P ! Mem[0000000010181438] = 0000000000000000
!	%l5 = 0000000051d2834c, Mem[0000000010181400] = 5d0f0000000000ff
	stx	%l5,[%i6+%g0]		! Mem[0000000010181400] = 0000000051d2834c
!	%l5 = 0000000051d2834c, Mem[0000000030081410] = 00ffffff00a8af4f
	stxa	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000000051d2834c
!	Mem[0000000010101408] = 0000ffff, %l1 = 00000000000000ff
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 000000000000ffff
!	Mem[00000000300c1408] = 00000000, %l7 = ffffffffffffffff
	ldswa	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000000

p0_label_462:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 000000ff, %l7 = 0000000000000000
	lduha	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[000000001014143e] = 00001500, %l6 = 00000000000000ff, %asi = 80
	lduba	[%i5+0x03e]%asi,%l6	! %l6 = 0000000000000015
!	Mem[0000000030141400] = 00d2834c00000000, %l0 = 000000000000ff80
	ldxa	[%i5+%g0]0x81,%l0	! %l0 = 00d2834c00000000
!	%l7 = 0000000000000000, %l0 = 00d2834c00000000, %l1  = 000000000000ffff
	mulx	%l7,%l0,%l1		! %l1 = 0000000000000000
!	Mem[0000000030001410] = ff6315ff, %l2 = 000000001ccbffda
	ldsha	[%i0+%o5]0x89,%l2	! %l2 = 00000000000015ff
!	%l4 = 0000000000000000, %l2 = 00000000000015ff, %l2 = 00000000000015ff
	and	%l4,%l2,%l2		! %l2 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l7 = 0000000000000000
	ldswa	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001408] = 43000000, %l0 = 00d2834c00000000
	ldsba	[%i0+%o4]0x80,%l0	! %l0 = 0000000000000043
!	Mem[0000000010141410] = 0000000000000000, %f0  = ff000000 00000000
	ldda	[%i5+%o5]0x88,%f0 	! %f0  = 00000000 00000000
!	Mem[0000000010101438] = 00000000, %l0 = 0000000000000043
	ldsh	[%i4+0x038],%l0		! %l0 = 0000000000000000

p0_label_463:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000051d2834c, Mem[00000000100c1408] = ff00000000000000
	stx	%l5,[%i3+%o4]		! Mem[00000000100c1408] = 0000000051d2834c
!	%l0 = 0000000000000000, immd = fffffe59, %y  = 001ae542
	sdiv	%l0,-0x1a7,%l6		! %l6 = ffffffff80000000
	mov	%l0,%y			! %y = 00000000
!	Mem[00000000300c1408] = 00000000, %l3 = 000000000000004c
	swapa	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000000
!	%l6 = ffffffff80000000, Mem[0000000010181408] = 7f800000ffffffff
	stxa	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = ffffffff80000000
!	%f6  = 43ccfaf1, Mem[0000000010041400] = ff000000
	sta	%f6 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 43ccfaf1
!	%f9  = 7f78c4ff, %f14 = 00000055, %f9  = 7f78c4ff
	fmuls	%f9 ,%f14,%f9 		! tt=0x22, %l0 = 0000000000000022
!	%f26 = ffc4787f 51d2834c, Mem[0000000030041408] = ffff0000 43ccfaf1
	stda	%f26,[%i1+%o4]0x89	! Mem[0000000030041408] = ffc4787f 51d2834c
!	Mem[0000000030141400] = 00d2834c, %l4 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%f0  = 00000000, Mem[00000000300c1400] = ff000043
	sta	%f0 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	Mem[00000000300c1410] = 000000ff, %l5 = 0000000051d2834c
	swapa	[%i3+%o5]0x89,%l5	! %l5 = 00000000000000ff

p0_label_464:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00000000, %l0 = 0000000000000022
	ldswa	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = ffffffff, %l4 = 0000000000000000
	lduha	[%i6+%o5]0x89,%l4	! %l4 = 000000000000ffff
!	Mem[00000000100c1408] = 00000000, %l7 = 0000000000000000
	ldsha	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101400] = ff00e842, %l6 = ffffffff80000000
	lduwa	[%i4+%g0]0x89,%l6	! %l6 = 00000000ff00e842
!	Mem[0000000010081410] = ffffffff, %f22 = 43f05d0f
	lda	[%i2+%o5]0x80,%f22	! %f22 = ffffffff
!	Mem[0000000010001418] = 0000ff24, %l2 = 0000000000000000, %asi = 80
	ldswa	[%i0+0x018]%asi,%l2	! %l2 = 000000000000ff24
!	Mem[0000000030141408] = 00000000, %l4 = 000000000000ffff
	lduha	[%i5+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101410] = ffff0000, %f16 = 00000000
	lda	[%i4+%o5]0x81,%f16	! %f16 = ffff0000
!	Mem[0000000010141408] = ff000000, %l4 = 0000000000000000
	lduha	[%i5+%o4]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010181410] = 00000000, %l1 = 0000000000000000
	lduw	[%i6+%o5],%l1		! %l1 = 0000000000000000

p0_label_465:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ff00e842, Mem[0000000030101410] = 0000ffff
	stha	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000e842
!	%f20 = 00000000 00000000, Mem[0000000010141410] = 00000000 00000000
	stda	%f20,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000 00000000
!	%l2 = 0000ff24, %l3 = 00000000, Mem[0000000030101410] = 0000e842 000000ff
	stda	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000ff24 00000000
!	%f16 = ffff0000 4c83d200, Mem[0000000010101400] = ff0000ff 4c83d251
	stda	%f16,[%i4+%g0]0x88	! Mem[0000000010101400] = ffff0000 4c83d200
!	Mem[00000000100c1428] = 4c83d251, %l3 = 0000000000000000, %asi = 80
	swapa	[%i3+0x028]%asi,%l3	! %l3 = 000000004c83d251
!	Mem[00000000201c0001] = 20ffa3b0, %l0 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030181400] = 0a58ef20 00000000, %l6 = ff00e842, %l7 = 00000000
	ldda	[%i6+%g0]0x81,%l6	! %l6 = 000000000a58ef20 0000000000000000
!	%l0 = 00000000000000ff, Mem[0000000010141408] = 000000ff
	stha	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff
!	%l0 = 00000000000000ff, Mem[0000000030041408] = 51d2834c
	stba	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 51d283ff
!	%f31 = 00000000, Mem[00000000300c1408] = 0000004c
	sta	%f31,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000

p0_label_466:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 00ff4c10, %l7 = 0000000000000000
	ldub	[%o1+0x040],%l7		! %l7 = 0000000000000000
!	%l3 = 000000004c83d251, %l3 = 000000004c83d251, %l1 = 0000000000000000
	sdivx	%l3,%l3,%l1		! %l1 = 0000000000000001
!	Mem[00000000211c0001] = 00ff5a40, %l2 = 000000000000ff24, %asi = 80
	lduba	[%o2+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141410] = 00000000, %l6 = 000000000a58ef20
	lduha	[%i5+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = ff000000, %l3 = 000000004c83d251
	ldsba	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000201c0001] = 20ffa3b0, %l2 = 00000000000000ff, %asi = 80
	ldsba	[%o0+0x001]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[000000001010142c] = 00000f5d, %l2 = ffffffffffffffff, %asi = 80
	lduha	[%i4+0x02c]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l7 = 0000000000000000
	ldsba	[%i1+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041404] = 00000000, %l1 = 0000000000000001
	lduh	[%i1+0x004],%l1		! %l1 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l6 = 0000000000000000
	lduba	[%i6+%o5]0x80,%l6	! %l6 = 0000000000000000

p0_label_467:
!	Starting 10 instruction Store Burst
!	%f0  = 00000000, Mem[0000000010141410] = 00000000
	sta	%f0 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
	membar	#Sync			! Added by membar checker (85)
!	%f16 = ffff0000, Mem[0000000030141408] = 00000000
	sta	%f16,[%i5+%o4]0x81	! Mem[0000000030141408] = ffff0000
!	%l4 = 000000000000ff00, Mem[0000000030001408] = 000000ff
	stba	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	Mem[0000000010001418] = 0000ff24, %l6 = 0000000000000000, %asi = 80
	swapa	[%i0+0x018]%asi,%l6	! %l6 = 000000000000ff24
!	Mem[0000000010101400] = 00d2834c, %l5 = 00000000000000ff
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 0000000000000000
!	%l5 = 0000000000000000, Mem[00000000100c1410] = 000000ff
	stwa	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	%l7 = 0000000000000000, Mem[0000000010181400] = 0000000051d2834c
	stx	%l7,[%i6+%g0]		! Mem[0000000010181400] = 0000000000000000
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030101408] = ff000000 00000980
	stda	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 00000000
!	%f2  = ff000000 00000f5d, %l6 = 000000000000ff24
!	Mem[0000000030181410] = ffffffff00ffffff
	add	%i6,0x010,%g1
	stda	%f2,[%g1+%l6]ASI_PST32_S ! Mem[0000000030181410] = ffffffff00ffffff
!	Code Fragment 3, seed = 327307
p0_fragment_34:
!	%l0 = 00000000000000ff
	setx	0xd31e74467a6afece,%g7,%l0 ! %l0 = d31e74467a6afece
!	%l1 = 0000000000000000
	setx	0xa11e9ede097d9279,%g7,%l1 ! %l1 = a11e9ede097d9279
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d31e74467a6afece
	setx	0x326c485bce557234,%g7,%l0 ! %l0 = 326c485bce557234
!	%l1 = a11e9ede097d9279
	setx	0x52a5e07140ee20ff,%g7,%l1 ! %l1 = 52a5e07140ee20ff
p0_fragment_34_end:

p0_label_468:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c141c] = 000000ff, %l2 = 0000000000000000
	ldsw	[%i3+0x01c],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010141410] = 00000000 00000000, %l4 = 0000ff00, %l5 = 00000000
	ldda	[%i5+%o5]0x80,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000030081400] = 0aad11ff, %l5 = 0000000000000000
	lduba	[%i2+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[00000000211c0000] = 00ff5a40, %l7 = 0000000000000000, %asi = 80
	lduha	[%o2+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1408] = 00000000, %l0 = 326c485bce557234
	lduha	[%i3+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181400] = 00000000 00000000, %l6 = 0000ff24, %l7 = 000000ff
	ldda	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010001410] = 00c4787f, %l6 = 0000000000000000
	lduh	[%i0+%o5],%l6		! %l6 = 00000000000000c4
!	Mem[00000000201c0000] = 20ffa3b0, %l7 = 0000000000000000, %asi = 80
	lduha	[%o0+0x000]%asi,%l7	! %l7 = 00000000000020ff
!	Mem[0000000030081410] = 00000000, %l7 = 00000000000020ff
	ldsha	[%i2+%o5]0x89,%l7	! %l7 = 0000000000000000
!	%l1 = 52a5e07140ee20ff, %l4 = 0000000000000000, %l4 = 0000000000000000
	andn	%l1,%l4,%l4		! %l4 = 52a5e07140ee20ff

p0_label_469:
!	Starting 10 instruction Store Burst
!	%f22 = ffffffff, Mem[0000000030181408] = 000000ff
	sta	%f22,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffffff
!	%f27 = 51d2834c, %f23 = ffffffff, %f18 = 4c83d251
	fdivs	%f27,%f23,%f18		! %f18 = ffffffff
!	Mem[0000000010041434] = 00000000, %l4 = 0000000040ee20ff
	swap	[%i1+0x034],%l4		! %l4 = 0000000000000000
!	%l1 = 52a5e07140ee20ff, Mem[0000000010141400] = ffff000020ef580a, %asi = 80
	stxa	%l1,[%i5+0x000]%asi	! Mem[0000000010141400] = 52a5e07140ee20ff
!	%f8  = 4c83d251, %f9  = 7f78c4ff, %f4  = ffde312a ff0000ff
	fsmuld	%f8 ,%f9 ,%f4 		! %f4  = 49900325 d99055e0
!	Mem[0000000010001400] = 00000000, %l4 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = ff11ad0a, %l7 = 0000000000000000
	ldstuba	[%i2+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	%f22 = ffffffff ffffffff, %l1 = 52a5e07140ee20ff
!	Mem[0000000010041420] = ffffffff00ffffff
	add	%i1,0x020,%g1
	stda	%f22,[%g1+%l1]ASI_PST16_P ! Mem[0000000010041420] = ffffffffffffffff
!	%l6 = 00000000000000c4, Mem[0000000010081408] = 51d2834c
	stha	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 00c4834c
!	Mem[0000000010141400] = 52a5e071, %l3 = 0000000000000000
	swapa	[%i5+%g0]0x80,%l3	! %l3 = 0000000052a5e071

p0_label_470:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00000000, %l6 = 00000000000000c4
	lduba	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081408] = ff000000, %l5 = 00000000000000ff
	lduwa	[%i2+%o4]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030141400] = 4c83d2ff, %l7 = 00000000000000ff
	lduha	[%i5+%g0]0x89,%l7	! %l7 = 000000000000d2ff
!	Mem[00000000100c1408] = 00000000 51d2834c, %l6 = 00000000, %l7 = 0000d2ff, %asi = 80
	ldda	[%i3+0x008]%asi,%l6	! %l6 = 0000000000000000 0000000051d2834c
!	Mem[0000000010101400] = ffd2834c0000ffff, %f6  = 43ccfaf1 ffff0000
	ldda	[%i4+%g0]0x80,%f6 	! %f6  = ffd2834c 0000ffff
!	Mem[00000000201c0000] = 20ffa3b0, %l6 = 0000000000000000
	ldsb	[%o0+%g0],%l6		! %l6 = 0000000000000020
!	Mem[0000000030001408] = 00000000, %l5 = 00000000ff000000
	ldsba	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141408] = 0000ffff, %l2 = 00000000000000ff
	ldsba	[%i5+%o4]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030081410] = 0000000051d2834c, %l6 = 0000000000000020
	ldxa	[%i2+%o5]0x81,%l6	! %l6 = 0000000051d2834c
!	Mem[00000000300c1408] = 00000000, %l1 = 52a5e07140ee20ff
	ldsba	[%i3+%o4]0x89,%l1	! %l1 = 0000000000000000

p0_label_471:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000052a5e071, Mem[00000000100c1410] = 00000000
	stwa	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = 52a5e071
!	%l2 = ffffffffffffffff, Mem[0000000010141408] = 000000ff
	stba	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff
!	Mem[0000000030181400] = 0a58ef20, %l0 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l0	! %l0 = 000000000000000a
!	Mem[0000000030101400] = ff00e842, %l0 = 000000000000000a
	ldstuba	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000042
!	%l6 = 0000000051d2834c, Mem[0000000030101410] = 000000000000ff24
	stxa	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000000051d2834c
!	%l3 = 0000000052a5e071, Mem[00000000100c1408] = 00000000
	stha	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000e071
!	Mem[0000000010081423] = ffc4787f, %l1 = 0000000000000000
	ldstub	[%i2+0x023],%l1		! %l1 = 000000000000007f
!	Mem[0000000030181408] = ffffffff, %l0 = 0000000000000042
	swapa	[%i6+%o4]0x81,%l0	! %l0 = 00000000ffffffff
!	%l7 = 0000000051d2834c, Mem[0000000010001400] = 00000000
	stwa	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 51d2834c
!	Mem[00000000300c1400] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i3+%g0]0x89,%l4	! %l4 = 0000000000000000

p0_label_472:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 0000000051d2834c, %l6 = 0000000051d2834c
	ldxa	[%i2+%o5]0x81,%l6	! %l6 = 0000000051d2834c
!	Mem[000000001010140e] = 00000000, %l5 = 0000000000000000, %asi = 80
	ldsha	[%i4+0x00e]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081400] = 0aad11ff, %f19 = 00000000
	lda	[%i2+%g0]0x89,%f19	! %f19 = 0aad11ff
!	Mem[0000000010181404] = 00000000, %l4 = 0000000000000000
	ldub	[%i6+0x004],%l4		! %l4 = 0000000000000000
!	Mem[0000000010001408] = 43000000 ffff00ff, %l6 = 51d2834c, %l7 = 51d2834c
	ldda	[%i0+%o4]0x80,%l6	! %l6 = 0000000043000000 00000000ffff00ff
!	Mem[0000000020800040] = 00ff4c10, %l2 = ffffffffffffffff, %asi = 80
	ldsha	[%o1+0x040]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000020800040] = 00ff4c10, %l3 = 0000000052a5e071
	lduh	[%o1+0x040],%l3		! %l3 = 00000000000000ff
!	Mem[0000000030101410] = 00000000 51d2834c, %l0 = ffffffff, %l1 = 0000007f
	ldda	[%i4+%o5]0x89,%l0	! %l0 = 0000000051d2834c 0000000000000000
!	Mem[00000000100c1408] = 0000e071, %l3 = 00000000000000ff
	lduha	[%i3+%o4]0x88,%l3	! %l3 = 000000000000e071
!	Code Fragment 3, seed = 113819
p0_fragment_35:
!	%l0 = 0000000051d2834c
	setx	0x2262709567f01e4e,%g7,%l0 ! %l0 = 2262709567f01e4e
!	%l1 = 0000000000000000
	setx	0x1a1346abbe0e99f9,%g7,%l1 ! %l1 = 1a1346abbe0e99f9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2262709567f01e4e
	setx	0xf436c043784de1b4,%g7,%l0 ! %l0 = f436c043784de1b4
!	%l1 = 1a1346abbe0e99f9
	setx	0x15b2ac8a85d1787f,%g7,%l1 ! %l1 = 15b2ac8a85d1787f
p0_fragment_35_end:

p0_label_473:
!	Starting 10 instruction Store Burst
!	%l0 = f436c043784de1b4, Mem[0000000010081410] = ffffffff2a31deff
	stxa	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = f436c043784de1b4
!	%f4  = 49900325 d99055e0, %l6 = 0000000043000000
!	Mem[0000000010001428] = 000000003d5cff77
	add	%i0,0x028,%g1
	stda	%f4,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010001428] = 000000003d5cff77
!	Mem[0000000010041438] = 00000000, %l1 = 0000000085d1787f
	swap	[%i1+0x038],%l1		! %l1 = 0000000000000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030001410] = ff1563ff 00000000
	stda	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000 00000000
!	%l7 = 00000000ffff00ff, Mem[0000000030041408] = ffc4787f51d283ff
	stxa	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000ffff00ff
!	%f28 = 3d5c9877, Mem[0000000010101408] = ff000000
	sta	%f28,[%i4+%o4]0x80	! Mem[0000000010101408] = 3d5c9877
!	%l7 = 00000000ffff00ff, Mem[00000000300c1408] = 6600000000000000
	stxa	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000ffff00ff
!	%l2 = 00000000000000ff, Mem[0000000030001400] = 1ae542ff
	stba	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 1ae542ff
!	%l1 = 0000000000000000, Mem[0000000010181408] = ffffffff
	sth	%l1,[%i6+%o4]		! Mem[0000000010181408] = 0000ffff
!	%l7 = 00000000ffff00ff, Mem[0000000010181410] = 00000000
	stha	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff

p0_label_474:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 000000004c83d251, %l4 = 0000000000000000
	ldxa	[%i3+%g0]0x80,%l4	! %l4 = 000000004c83d251
!	Mem[0000000010041410] = 000000ff, %l1 = 0000000000000000
	lduha	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081430] = 0000004f, %l3 = 000000000000e071
	ldsh	[%i2+0x030],%l3		! %l3 = 0000000000000000
!	%l0 = 784de1b4, %l1 = 00000000, Mem[0000000030181408] = 42000000 00000000
	stda	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 784de1b4 00000000
!	Mem[0000000030181410] = ffffffff, %l0 = f436c043784de1b4
	lduha	[%i6+%o5]0x81,%l0	! %l0 = 000000000000ffff
!	Mem[0000000030001408] = 0000000000000000, %l2 = 00000000000000ff
	ldxa	[%i0+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001408] = 0000000000000000, %f8  = 4c83d251 7f78c4ff
	ldda	[%i0+%o4]0x81,%f8 	! %f8  = 00000000 00000000
!	Mem[00000000100c1400] = 00000000, %l3 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001414] = 51d2834c, %l3 = 0000000000000000, %asi = 80
	lduba	[%i0+0x014]%asi,%l3	! %l3 = 0000000000000051
!	Mem[00000000300c1400] = ff000000 00000000, %l0 = 0000ffff, %l1 = 00000000
	ldda	[%i3+%g0]0x81,%l0	! %l0 = 00000000ff000000 0000000000000000

p0_label_475:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000030141400] = 4c83d2ff
	stwa	%l1,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	Mem[0000000010181408] = 0000ffff, %l4 = 000000004c83d251
	ldstuba	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000211c0000] = 00ff5a40, %l5 = 0000000000000000
	lduh	[%o2+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030101410] = 4c83d251, %l1 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l1	! %l1 = 000000000000004c
!	%f30 = 00000000, Mem[00000000300c1408] = ffff00ff
	sta	%f30,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	Code Fragment 4, seed = 567274
p0_fragment_36:
!	%l0 = 00000000ff000000
	setx	0x2df07901bb3042d6,%g7,%l0 ! %l0 = 2df07901bb3042d6
!	%l1 = 000000000000004c
	setx	0xef3c9858cb963801,%g7,%l1 ! %l1 = ef3c9858cb963801
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2df07901bb3042d6
	setx	0xf8c2b1975e21c13c,%g7,%l0 ! %l0 = f8c2b1975e21c13c
!	%l1 = ef3c9858cb963801
	setx	0xd85557ecf87be187,%g7,%l1 ! %l1 = d85557ecf87be187
p0_fragment_36_end:
!	%l2 = 0000000000000000, Mem[0000000010041410] = ff000000
	stba	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = ff000000
!	Mem[000000001000142c] = 3d5cff77, %l1 = 00000000f87be187
	swap	[%i0+0x02c],%l1		! %l1 = 000000003d5cff77
!	%f14 = 00000055 ffff0000, %l5 = 00000000000000ff
!	Mem[0000000030101418] = 4b439fda0f5df043
	add	%i4,0x018,%g1
	stda	%f14,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030101418] = 0000ffff55000000
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000030041408] = ffff00ff 00000000
	stda	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000 000000ff

p0_label_476:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff000000, %f26 = ffc4787f
	lda	[%i3+%g0]0x81,%f26	! %f26 = ff000000
!	Mem[0000000030181410] = ffffffff, %l6 = 0000000043000000
	lduba	[%i6+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101408] = 00000000 00000000, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000030041410] = 00000000, %l6 = 00000000000000ff
	lduba	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l1 = 000000003d5cff77
	lduba	[%i3+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l7 = 00000000ffff00ff
	lduwa	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000000
!	%f14 = 00000055 ffff0000, %l3 = 0000000000000051
!	Mem[0000000030041420] = 9725ca243e295957
	add	%i1,0x020,%g1
	stda	%f14,[%g1+%l3]ASI_PST32_SL ! Mem[0000000030041420] = 0000ffff3e295957
!	Mem[0000000010041408] = 4c000000daffcb1c, %l1 = 0000000000000000
	ldxa	[%i1+%o4]0x88,%l1	! %l1 = 4c000000daffcb1c
!	Mem[0000000010101400] = 4c83d2ff, %l1 = 4c000000daffcb1c
	lduba	[%i4+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181408] = ff00ffff, %l6 = 0000000000000000
	lduwa	[%i6+%o4]0x80,%l6	! %l6 = 00000000ff00ffff

p0_label_477:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000030081408] = ff000000
	stba	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	%f18 = ffffffff 0aad11ff, Mem[00000000100c1400] = 00000000 4c83d251
	stda	%f18,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffffffff 0aad11ff
!	Mem[0000000030181410] = ffffffff, %l2 = 0000000000000000
	ldstuba	[%i6+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%f16 = ffff0000 4c83d200, %l0 = f8c2b1975e21c13c
!	Mem[0000000030041418] = 43f05d0fda9f434b
	add	%i1,0x018,%g1
	stda	%f16,[%g1+%l0]ASI_PST8_S ! Mem[0000000030041418] = 43f000004c83434b
!	%l2 = 00000000000000ff, Mem[0000000030101408] = 0000000000000000
	stxa	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000000000ff
!	Mem[0000000030041410] = 00000000, %l6 = 00000000ff00ffff
	ldstuba	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000201c0001] = 20ffa3b0, %l3 = 0000000000000051
	ldstuba	[%o0+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	%f20 = 00000000 00000000, %l5 = 0000000000000000
!	Mem[00000000100c1428] = 000000007f78c4ff
	add	%i3,0x028,%g1
	stda	%f20,[%g1+%l5]ASI_PST8_P ! Mem[00000000100c1428] = 000000007f78c4ff
!	%f8  = 00000000 00000000, Mem[00000000100c1420] = ffffff00 ffffffff
	std	%f8 ,[%i3+0x020]	! Mem[00000000100c1420] = 00000000 00000000
!	%f17 = 4c83d200, Mem[0000000010181404] = 00000000
	sta	%f17,[%i6+0x004]%asi	! Mem[0000000010181404] = 4c83d200

p0_label_478:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 4c83d251ff00d46d, %l1 = 00000000000000ff, %asi = 80
	ldxa	[%i0+0x000]%asi,%l1	! %l1 = 4c83d251ff00d46d
!	Mem[00000000100c142c] = 7f78c4ff, %l3 = 00000000000000ff
	lduw	[%i3+0x02c],%l3		! %l3 = 000000007f78c4ff
!	Mem[0000000030041400] = ff000000, %f10 = ff000000
	lda	[%i1+%g0]0x89,%f10	! %f10 = ff000000
!	Mem[000000001008141c] = 7fff0000, %f14 = 00000055
	lda	[%i2+0x01c]%asi,%f14	! %f14 = 7fff0000
!	Mem[00000000201c0001] = 20ffa3b0, %l3 = 000000007f78c4ff
	ldub	[%o0+0x001],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010081400] = ff000000, %l0 = f8c2b1975e21c13c
	lduha	[%i2+%g0]0x80,%l0	! %l0 = 000000000000ff00
!	Mem[0000000021800040] = ffffeaa0, %l7 = 0000000000000000, %asi = 80
	ldsha	[%o3+0x040]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000201c0000] = 20ffa3b0, %l1 = 4c83d251ff00d46d, %asi = 80
	ldsba	[%o0+0x000]%asi,%l1	! %l1 = 0000000000000020
!	Mem[0000000010041408] = 1ccbffda, %l2 = 00000000000000ff
	lduba	[%i1+%o4]0x80,%l2	! %l2 = 000000000000001c
!	%f9  = 00000000, %f4  = 49900325
	fsqrts	%f9 ,%f4 		! %f4  = 00000000

p0_label_479:
!	Starting 10 instruction Store Burst
!	Code Fragment 4, seed = 748185
p0_fragment_37:
!	%l0 = 000000000000ff00
	setx	0x563dcfcf5ae70c5e,%g7,%l0 ! %l0 = 563dcfcf5ae70c5e
!	%l1 = 0000000000000020
	setx	0xb1ec7df7bc776b09,%g7,%l1 ! %l1 = b1ec7df7bc776b09
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 563dcfcf5ae70c5e
	setx	0xe695447df77f25c4,%g7,%l0 ! %l0 = e695447df77f25c4
!	%l1 = b1ec7df7bc776b09
	setx	0xbf4a6d11aa9cbf8f,%g7,%l1 ! %l1 = bf4a6d11aa9cbf8f
p0_fragment_37_end:
!	Mem[0000000030141408] = ffff0000, %l5 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l5	! %l5 = 00000000ffff0000
!	Mem[0000000030101410] = 51d283ff, %l0 = 00000000f77f25c4
	swapa	[%i4+%o5]0x89,%l0	! %l0 = 0000000051d283ff
!	%l0 = 0000000051d283ff, Mem[0000000030041408] = 000000ff00000000
	stxa	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000051d283ff
!	%f2  = ff000000 00000f5d, Mem[00000000100c1410] = 71e0a552 000000ff
	stda	%f2 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff000000 00000f5d
!	Mem[000000001004140d] = 0000004c, %l3 = 00000000000000ff
	ldstuba	[%i1+0x00d]%asi,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = 00ff5a40, %l5 = 00000000ffff0000
	ldstuba	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101410] = ffc4787f, %l5 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l5	! %l5 = 000000000000007f
!	%l4 = 0000000000000000, imm = ffffffffffffffe4, %l7 = ffffffffffffffff
	subc	%l4,-0x01c,%l7		! %l7 = 000000000000001c
!	Mem[00000000100c141c] = 000000ff, %l5 = 000000000000007f
	swap	[%i3+0x01c],%l5		! %l5 = 00000000000000ff

p0_label_480:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001424] = 00000000, %f22 = ffffffff
	lda	[%i0+0x024]%asi,%f22	! %f22 = 00000000
!	Mem[0000000010081408] = 00c4834c, %f19 = 0aad11ff
	lda	[%i2+%o4]0x80,%f19	! %f19 = 00c4834c
!	Mem[0000000010001408] = 00000043, %l4 = 0000000000000000
	lduha	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000043
!	Mem[0000000010081400] = ff00000000000f5d, %l0 = 0000000051d283ff
	ldxa	[%i2+%g0]0x80,%l0	! %l0 = ff00000000000f5d
!	Mem[0000000030041410] = ff000000, %l4 = 0000000000000043
	lduwa	[%i1+%o5]0x81,%l4	! %l4 = 00000000ff000000
!	Mem[0000000030141400] = 00000000, %f2  = ff000000
	lda	[%i5+%g0]0x89,%f2 	! %f2 = 00000000
!	%l6 = 0000000000000000, %l2 = 000000000000001c, %y  = 00000000
	smul	%l6,%l2,%l2		! %l2 = 0000000000000000, %y = 00000000
!	Mem[0000000010141400] = 0000000040ee20ff, %f4  = 00000000 d99055e0
	ldda	[%i5+%g0]0x80,%f4 	! %f4  = 00000000 40ee20ff
!	Mem[0000000010041435] = 40ee20ff, %l0 = ff00000000000f5d, %asi = 80
	lduba	[%i1+0x035]%asi,%l0	! %l0 = 00000000000000ee
!	Mem[0000000030041408] = 51d283ff, %l6 = 0000000000000000
	ldswa	[%i1+%o4]0x89,%l6	! %l6 = 0000000051d283ff

p0_label_481:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ff000000, Mem[0000000030081410] = 00000000
	stwa	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = ff000000
!	%l3 = 0000000000000000, Mem[0000000010181408] = ffff00ff
	stba	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = ffff0000
!	Mem[00000000300c1400] = ff000000 00000000 00000000 00000000
!	%f0  = 00000000 00000000 00000000 00000f5d
!	%f4  = 00000000 40ee20ff ffd2834c 0000ffff
!	%f8  = 00000000 00000000 ff000000 00000000
!	%f12 = ff000000 00000000 7fff0000 ffff0000
	stda	%f0 ,[%i3+%g0]ASI_BLK_AIUSL	! Block Store to 00000000300c1400
	membar	#Sync			! Added by membar checker (86)
!	Mem[00000000300c1400] = 00000000, %l7 = 000000000000001c
	swapa	[%i3+%g0]0x89,%l7	! %l7 = 0000000000000000
!	%l6 = 0000000051d283ff, Mem[0000000010001410] = 4c83d2517f78c400
	stxa	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000051d283ff
!	%l0 = 00000000000000ee, Mem[00000000300c1400] = 0000001c
	stha	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ee
!	%f3  = 00000f5d, Mem[0000000010101410] = ffc478ff
	sta	%f3 ,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000f5d
!	%l5 = 00000000000000ff, Mem[0000000010001424] = 00000000, %asi = 80
	stha	%l5,[%i0+0x024]%asi	! Mem[0000000010001424] = 00ff0000
!	%f23 = ffffffff, Mem[0000000030001408] = 00000000
	sta	%f23,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffffff
!	%l7 = 0000000000000000, Mem[0000000010101410] = 5d0f0000
	stwa	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000

p0_label_482:
!	Starting 10 instruction Load Burst
!	%l5 = 00000000000000ff, %l7 = 0000000000000000, %y  = 00000000
	udiv	%l5,%l7,%l4		! Div by zero, %l0 = 0000000000000116
!	Mem[0000000010141408] = ff000000, %l3 = 0000000000000000
	ldsb	[%i5+%o4],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030001408] = ffffffff, %l6 = 0000000051d283ff
	lduwa	[%i0+%o4]0x81,%l6	! %l6 = 00000000ffffffff
!	Mem[00000000300c1400] = 000000ee, %l1 = bf4a6d11aa9cbf8f
	ldsha	[%i3+%g0]0x89,%l1	! %l1 = 00000000000000ee
!	Mem[0000000010181438] = 0000000000000000, %f2  = 00000000 00000f5d, %asi = 80
	ldda	[%i6+0x038]%asi,%f2 	! %f2  = 00000000 00000000
!	Mem[0000000010081410] = f436c043, %l2 = 0000000000000000
	lduwa	[%i2+%o5]0x80,%l2	! %l2 = 00000000f436c043
!	Mem[0000000010141408] = 000000ff, %l4 = 00000000ff000000
	lduba	[%i5+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141408] = 40980000000000ff, %f12 = ff000000 00000000
	ldda	[%i5+%o4]0x88,%f12	! %f12 = 40980000 000000ff
!	Mem[0000000030041400] = 000000ff, %l7 = 0000000000000000
	lduba	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = ff0000004c83c400, %f20 = 00000000 00000000
	ldda	[%i2+%o4]0x88,%f20	! %f20 = ff000000 4c83c400

p0_label_483:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[0000000010101410] = 00000000
	stha	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 00ff0000
!	%l0 = 0000000000000116, Mem[0000000030041410] = 000000ff
	stha	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000116
!	Mem[00000000300c1400] = ee000000 00000000 5d0f0000 00000000
!	%f16 = ffff0000 4c83d200 ffffffff 00c4834c
!	%f20 = ff000000 4c83c400 00000000 ffffffff
!	%f24 = ffffffff 19ffffff ff000000 51d2834c
!	%f28 = 3d5c9877 000000ff 00000000 00000000
	stda	%f16,[%i3+%g0]ASI_BLK_SL	! Block Store to 00000000300c1400
!	%f24 = ffffffff 19ffffff, %l5 = 00000000000000ff
!	Mem[0000000030181418] = ffafa800000000ff
	add	%i6,0x018,%g1
	stda	%f24,[%g1+%l5]ASI_PST16_S ! Mem[0000000030181418] = ffffffff19ffffff
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000030101400] = ffe800ff 00000000
	stda	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff 000000ff
!	Mem[0000000010141410] = 00000000, %l4 = 00000000000000ff
	ldstuba	[%i5+%o5]0x88,%l4	! %l4 = 0000000000000000
!	%l6 = ffffffff, %l7 = 00000000, Mem[0000000010081400] = ff000000 00000f5d
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffffff 00000000
!	Mem[0000000030181410] = ffffffff, %l6 = 00000000ffffffff
	ldstuba	[%i6+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	%l3 = ffffffffffffffff, Mem[0000000030101408] = 000000ff
	stha	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000ffff
!	%l7 = 0000000000000000, Mem[0000000030001400] = 1ae542ff
	stha	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = 1ae50000

p0_label_484:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 20ef58ff, %l4 = 0000000000000000
	lduba	[%i6+%g0]0x89,%l4	! %l4 = 00000000000000ff
	membar	#Sync			! Added by membar checker (87)
!	Mem[00000000300c1410] = 00c4834c, %l0 = 0000000000000116
	lduwa	[%i3+%o5]0x81,%l0	! %l0 = 0000000000c4834c
!	Mem[0000000010041410] = 000000ff, %l2 = 00000000f436c043
	lduba	[%i1+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1410] = 5d0f0000000000ff, %f24 = ffffffff 19ffffff
	ldda	[%i3+%o5]0x88,%f24	! %f24 = 5d0f0000 000000ff
!	Mem[0000000030041408] = 51d283ff, %l5 = 00000000000000ff
	ldsha	[%i1+%o4]0x89,%l5	! %l5 = ffffffffffff83ff
!	Mem[0000000021800000] = 004ce470, %l6 = 00000000000000ff, %asi = 80
	ldsha	[%o3+0x000]%asi,%l6	! %l6 = 000000000000004c
!	Mem[0000000030001410] = 00000000, %l4 = 00000000000000ff
	lduha	[%i0+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = ff00000051d2834c, %l6 = 000000000000004c
	ldxa	[%i2+%o5]0x81,%l6	! %l6 = ff00000051d2834c
!	Mem[0000000030101400] = 000000ff, %l7 = 0000000000000000
	ldswa	[%i4+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000021800180] = ffff4d90, %l6 = ff00000051d2834c, %asi = 80
	ldsba	[%o3+0x180]%asi,%l6	! %l6 = ffffffffffffffff

p0_label_485:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000c4834c, Mem[0000000010101410] = 0000ff00
	stwa	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 00c4834c
!	%f10 = ff000000 00000000, Mem[0000000010141410] = 000000ff 00000000
	stda	%f10,[%i5+%o5]0x88	! Mem[0000000010141410] = ff000000 00000000
!	%l1 = 00000000000000ee, Mem[0000000030141400] = 00000000
	stba	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = ee000000
!	Mem[0000000030181400] = ff58ef20, %l1 = 00000000000000ee
	ldstuba	[%i6+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	%f10 = ff000000 00000000, %l4 = 0000000000000000
!	Mem[0000000010181430] = ff0000000507110d
	add	%i6,0x030,%g1
	stda	%f10,[%g1+%l4]ASI_PST32_P ! Mem[0000000010181430] = ff0000000507110d
!	%f30 = 00000000, Mem[0000000010181434] = 0507110d
	st	%f30,[%i6+0x034]	! Mem[0000000010181434] = 00000000
!	Mem[000000001018140c] = 80000000, %l6 = ffffffffffffffff
	ldstuba	[%i6+0x00c]%asi,%l6	! %l6 = 0000000000000080
!	%l6 = 0000000000000080, Mem[0000000030181400] = 0000000020ef58ff
	stxa	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000000000000080
!	%l2 = 00000000, %l3 = ffffffff, Mem[00000000300c1408] = 4c83c400 ffffffff
	stda	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000 ffffffff
!	Mem[00000000300c1408] = 00000000, %l1 = 00000000000000ff
	lduha	[%i3+%o4]0x89,%l1	! %l1 = 0000000000000000

p0_label_486:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 0aad11ff, %l5 = ffffffffffff83ff
	lduba	[%i2+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081400] = 0aad11ff, %l0 = 0000000000c4834c
	lduwa	[%i2+%g0]0x89,%l0	! %l0 = 000000000aad11ff
!	Mem[0000000030001410] = 00000000, %l0 = 000000000aad11ff
	ldsha	[%i0+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = 00000043, %f5  = 40ee20ff
	lda	[%i0+%o4]0x88,%f5 	! %f5 = 00000043
!	Mem[00000000300c1408] = 00000000 ffffffff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000 00000000ffffffff
!	%f31 = 00000000, %f6  = ffd2834c, %f27 = 51d2834c
	fsubs	%f31,%f6 ,%f27		! %f27 = ffd2834c
!	Mem[0000000010041410] = ff000000, %l7 = 00000000000000ff
	lduha	[%i1+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001408] = 43000000ffff00ff, %f16 = ffff0000 4c83d200
	ldda	[%i0+%o4]0x80,%f16	! %f16 = 43000000 ffff00ff
!	Mem[0000000010041412] = 000000ff, %l1 = 00000000ffffffff, %asi = 80
	lduba	[%i1+0x012]%asi,%l1	! %l1 = 0000000000000000
!	%l5 = 00000000000000ff, %l7 = 0000000000000000, %l2 = 0000000000000000
	udivx	%l5,%l7,%l2		! Div by zero, %l0 = 0000000000000028

p0_label_487:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010081438] = 000000005500a800
	stx	%l1,[%i2+0x038]		! Mem[0000000010081438] = 0000000000000000
!	%l4 = 0000000000000000, Mem[00000000100c1408] = 0000e071
	stha	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	%l2 = 0000000000000000, Mem[00000000300c1408] = 00000000
	stba	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%f22 = 00000000 ffffffff, Mem[0000000010181408] = ffff0000 000000ff
	stda	%f22,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000 ffffffff
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000010001400] = 51d2834c 6dd400ff
	stda	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000 000000ff
!	Mem[0000000020800041] = 00ff4c10, %l3 = ffffffffffffffff
	ldstuba	[%o1+0x041]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041408] = 1ccbffda, %l4 = 0000000000000000
	ldstuba	[%i1+%o4]0x80,%l4	! %l4 = 000000000000001c
!	%f2  = 00000000 00000000, Mem[00000000100c1408] = 00000000 51d2834c
	stda	%f2 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 00000000
!	%l3 = 00000000000000ff, Mem[0000000010101400] = 4c83d2ff
	stba	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 4c83d2ff
!	%l0 = 00000028, %l1 = 00000000, Mem[0000000010181410] = 000000ff ff000000
	stda	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000028 00000000

p0_label_488:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 0000000000000028, %l0 = 0000000000000028
	ldxa	[%i6+%o5]0x88,%l0	! %l0 = 0000000000000028
!	Mem[0000000030081410] = ff000000 51d2834c, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i2+%o5]0x81,%l2	! %l2 = 00000000ff000000 0000000051d2834c
!	Mem[00000000100c1420] = 00000000, %l3 = 0000000051d2834c, %asi = 80
	ldswa	[%i3+0x020]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041410] = 000000ff, %l0 = 0000000000000028
	ldswa	[%i1+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101420] = 000000ff 4fafa800, %l2 = ff000000, %l3 = 00000000
	ldd	[%i4+0x020],%l2		! %l2 = 00000000000000ff 000000004fafa800
!	Mem[0000000030041400] = ff000000, %l6 = 0000000000000080
	ldsba	[%i1+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101408] = 77985c3d, %l2 = 00000000000000ff
	ldsba	[%i4+%o4]0x88,%l2	! %l2 = 000000000000003d
!	Mem[00000000100c1400] = ffffffff, %l0 = 00000000000000ff
	lduba	[%i3+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001408] = ffffffff, %l6 = 0000000000000000
	lduwa	[%i0+%o4]0x81,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000010041410] = ffffffffff000000, %l1 = 0000000000000000
	ldxa	[%i1+%o5]0x88,%l1	! %l1 = ffffffffff000000

p0_label_489:
!	Starting 10 instruction Store Burst
!	%l3 = 000000004fafa800, Mem[00000000100c1410] = 5d0f0000000000ff
	stxa	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000004fafa800
!	Mem[0000000030041408] = 51d283ff, %l5 = 00000000000000ff
	swapa	[%i1+%o4]0x89,%l5	! %l5 = 0000000051d283ff
!	%l7 = 0000000000000000, Mem[00000000100c1400] = ffffffff
	stwa	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	%f6  = ffd2834c 0000ffff, %l7 = 0000000000000000
!	Mem[0000000030181418] = ffffffff19ffffff
	add	%i6,0x018,%g1
	stda	%f6,[%g1+%l7]ASI_PST16_S ! Mem[0000000030181418] = ffffffff19ffffff
!	%l0 = 00000000000000ff, Mem[00000000100c1400] = 00000000
	stwa	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff
!	Mem[000000001014142a] = 66220000, %l2 = 000000000000003d
	ldstub	[%i5+0x02a],%l2		! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030141408] = 00000000
	stha	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	Mem[00000000201c0001] = 20ffa3b0, %l5 = 0000000051d283ff
	ldstub	[%o0+0x001],%l5		! %l5 = 00000000000000ff
!	%l4 = 000000000000001c, Mem[0000000010001400] = 00000000ff000000
	stxa	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000000000001c
!	%l0 = 00000000000000ff, Mem[0000000030141410] = 00000000
	stba	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = ff000000

p0_label_490:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = c4257ff7, %l3 = 000000004fafa800
	lduba	[%i4+%o5]0x81,%l3	! %l3 = 00000000000000c4
!	Mem[0000000030001408] = ffffffff 00000000, %l2 = 00000000, %l3 = 000000c4
	ldda	[%i0+%o4]0x81,%l2	! %l2 = 00000000ffffffff 0000000000000000
!	Mem[0000000030041408] = 000000ff, %l6 = 00000000ffffffff
	ldsha	[%i1+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181400] = 80000000, %l1 = ffffffffff000000
	lduwa	[%i6+%g0]0x81,%l1	! %l1 = 0000000080000000
!	Mem[0000000030001400] = 00000000 1ae50000, %l2 = ffffffff, %l3 = 00000000
	ldda	[%i0+%g0]0x89,%l2	! %l2 = 000000001ae50000 0000000000000000
!	Mem[00000000100c1410] = 4fafa800, %l3 = 0000000000000000
	ldsba	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141400] = ee000000, %l1 = 0000000080000000
	lduba	[%i5+%g0]0x81,%l1	! %l1 = 00000000000000ee
!	Mem[0000000010001400] = 00000000 0000001c, %l4 = 0000001c, %l5 = 000000ff
	ldda	[%i0+%g0]0x80,%l4	! %l4 = 0000000000000000 000000000000001c
!	Mem[0000000030081410] = ff000000, %l2 = 000000001ae50000
	ldswa	[%i2+%o5]0x81,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010101438] = 000000000000008b, %l0 = 00000000000000ff
	ldx	[%i4+0x038],%l0		! %l0 = 000000000000008b

p0_label_491:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c140c] = 00000000, %l6 = 00000000000000ff, %asi = 80
	swapa	[%i3+0x00c]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181400] = 00d2834c00000000, %l2 = ffffffffff000000
	ldxa	[%i6+%g0]0x88,%l2	! %l2 = 00d2834c00000000
!	%l2 = 00d2834c00000000, Mem[0000000030141400] = 000000ee
	stwa	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	Mem[00000000300c1408] = 00000000, %l6 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030101408] = 0000ffff 00000000
	stda	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 00000000
!	%l1 = 00000000000000ee, Mem[00000000201c0001] = 20ffa3b0, %asi = 80
	stba	%l1,[%o0+0x001]%asi	! Mem[00000000201c0000] = 20eea3b0
!	Mem[0000000030181410] = ffffffff, %l5 = 000000000000001c
	swapa	[%i6+%o5]0x81,%l5	! %l5 = 00000000ffffffff
!	%l3 = 0000000000000000, Mem[0000000010141408] = 000000ff
	stwa	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	Mem[0000000010181408] = ffffffff, %l4 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l4	! %l4 = 00000000ffffffff
!	%l1 = 00000000000000ee, Mem[00000000211c0000] = ffff5a40, %asi = 80
	stba	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = eeff5a40

p0_label_492:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 43c036f4, %l5 = 00000000ffffffff
	ldsha	[%i2+%o5]0x88,%l5	! %l5 = 00000000000036f4
!	Mem[00000000100c1408] = ff000000 00000000, %l4 = ffffffff, %l5 = 000036f4
	ldda	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000000 00000000ff000000
!	Mem[0000000010101408] = 77985c3d, %l2 = 00d2834c00000000
	ldsba	[%i4+%o4]0x88,%l2	! %l2 = 000000000000003d
!	Mem[0000000030141408] = 00000000, %l4 = 0000000000000000
	lduwa	[%i5+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041400] = f1facc43, %l7 = 0000000000000000
	lduba	[%i1+%g0]0x88,%l7	! %l7 = 0000000000000043
!	Mem[0000000030101408] = 00000000, %l6 = 0000000000000000
	lduwa	[%i4+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041400] = 43ccfaf1, %l2 = 000000000000003d, %asi = 80
	ldsba	[%i1+0x000]%asi,%l2	! %l2 = 0000000000000043
!	Mem[0000000030081400] = 0aad11ff, %l3 = 0000000000000000
	ldsha	[%i2+%g0]0x89,%l3	! %l3 = 00000000000011ff
!	Mem[0000000010101400] = ffd2834c, %f10 = ff000000
	lda	[%i4+%g0]0x80,%f10	! %f10 = ffd2834c
!	Mem[0000000010101410] = 00000000 00c4834c, %l6 = 00000000, %l7 = 00000043
	ldda	[%i4+%o5]0x88,%l6	! %l6 = 0000000000c4834c 0000000000000000

p0_label_493:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181406] = 4c83d200, %l0 = 000000000000008b
	ldstuba	[%i6+0x006]%asi,%l0	! %l0 = 00000000000000d2
!	Mem[0000000030041400] = 000000ff, %l2 = 0000000000000043
	ldstuba	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041410] = 000000ff, %l2 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[00000000201c0000] = 20eea3b0, %l7 = 0000000000000000
	ldstub	[%o0+%g0],%l7		! %l7 = 0000000000000020
!	%f0  = 00000000 00000000, Mem[0000000010041410] = 00000000 ffffffff
	std	%f0 ,[%i1+%o5]		! Mem[0000000010041410] = 00000000 00000000
!	Mem[0000000030141410] = 000000ff, %l4 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081400] = ffffffff, %l2 = 00000000000000ff
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 00000000ffffffff
!	Mem[000000001010143a] = 00000000, %l3 = 00000000000011ff
	ldstub	[%i4+0x03a],%l3		! %l3 = 0000000000000000
!	%l7 = 0000000000000020, Mem[0000000010181400] = 00000000
	stba	%l7,[%i6+%g0]0x80	! Mem[0000000010181400] = 20000000
!	%l4 = 00000000000000ff, Mem[0000000030081410] = ff000000
	stha	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 00ff0000

p0_label_494:
!	Starting 10 instruction Load Burst
!	%f30 = 00000000, %f14 = 7fff0000, %f16 = 43000000 ffff00ff
	fsmuld	%f30,%f14,%f16		! %f16 = 7fffe000 00000000
!	Mem[0000000010181420] = 00000000 000000ff, %l0 = 000000d2, %l1 = 000000ee, %asi = 80
	ldda	[%i6+0x020]%asi,%l0	! %l0 = 0000000000000000 00000000000000ff
!	Mem[00000000100c1400] = 000000ff, %l1 = 00000000000000ff
	ldswa	[%i3+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101408] = 00000000, %l3 = 0000000000000000
	lduha	[%i4+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101400] = ff000000, %l1 = 00000000000000ff
	ldswa	[%i4+%g0]0x89,%l1	! %l1 = ffffffffff000000
!	Mem[0000000010101400] = ffd2834c, %l2 = 00000000ffffffff
	lduwa	[%i4+%g0]0x80,%l2	! %l2 = 00000000ffd2834c
!	Mem[0000000010081410] = b4e14d7843c036f4, %f26 = ff000000 ffd2834c
	ldda	[%i2+%o5]0x88,%f26	! %f26 = b4e14d78 43c036f4
!	Mem[0000000010181400] = 00000020, %l0 = 0000000000000000
	ldsba	[%i6+%g0]0x88,%l0	! %l0 = 0000000000000020
!	%f14 = 7fff0000, %f1  = 00000000
	fsqrts	%f14,%f1 		! %f1  = 7fff0000
!	Mem[00000000300c1408] = 00000000, %l3 = 0000000000000000
	lduba	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000000

p0_label_495:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 00000028, %l7 = 0000000000000020
	ldstuba	[%i6+%o5]0x88,%l7	! %l7 = 0000000000000028
!	%f8  = 00000000 00000000, %l0 = 0000000000000020
!	Mem[0000000010101420] = 000000ff4fafa800
	add	%i4,0x020,%g1
	stda	%f8,[%g1+%l0]ASI_PST32_P ! Mem[0000000010101420] = 000000ff4fafa800
!	%l7 = 0000000000000028, Mem[0000000030001410] = 00000000
	stwa	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000028
!	Mem[0000000030181410] = 0000001c, %l3 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 000000000000001c
!	%f12 = 40980000, %f26 = b4e14d78, %f1  = 7fff0000
	fsubs	%f12,%f26,%f1 		! %f1  = 40980001
!	%l0 = 0000000000000020, Mem[0000000030081410] = 00ff0000
	stha	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 00200000
!	%f7  = 0000ffff, Mem[0000000010141430] = 80090000
	st	%f7 ,[%i5+0x030]	! Mem[0000000010141430] = 0000ffff
!	%l5 = 00000000ff000000, Mem[0000000010141400] = 00000000
	stha	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	%l3 = 000000000000001c, Mem[0000000010141420] = 00000000000000ff
	stx	%l3,[%i5+0x020]		! Mem[0000000010141420] = 000000000000001c
!	%l6 = 0000000000c4834c, Mem[0000000010101400] = ffd2834c
	stha	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 834c834c

p0_label_496:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00000000, %l4 = 00000000000000ff
	lduba	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %l6 = 0000000000c4834c
	ldsba	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l7 = 0000000000000028
	ldsba	[%i0+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041408] = 4c00ff00 daffcbff, %l6 = 00000000, %l7 = 00000000
	ldda	[%i1+%o4]0x88,%l6	! %l6 = 00000000daffcbff 000000004c00ff00
!	Mem[00000000100c1409] = 00000000, %l1 = ffffffffff000000
	ldub	[%i3+0x009],%l1		! %l1 = 0000000000000000
!	Mem[0000000030081410] = 4c83d251 00002000, %l6 = daffcbff, %l7 = 4c00ff00
	ldda	[%i2+%o5]0x89,%l6	! %l6 = 0000000000002000 000000004c83d251
!	Mem[0000000010141422] = 00000000, %l3 = 000000000000001c
	lduh	[%i5+0x022],%l3		! %l3 = 0000000000000000
!	Mem[0000000030001408] = ffffffff, %l7 = 000000004c83d251
	lduba	[%i0+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041438] = 85d1787f0000ff00, %l3 = 0000000000000000, %asi = 80
	ldxa	[%i1+0x038]%asi,%l3	! %l3 = 85d1787f0000ff00
!	Mem[0000000010001400] = 000000000000001c, %l4 = 0000000000000000, %asi = 80
	ldxa	[%i0+0x000]%asi,%l4	! %l4 = 000000000000001c

p0_label_497:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001428] = 00000000, %l3 = 000000000000ff00, %asi = 80
	swapa	[%i0+0x028]%asi,%l3	! %l3 = 0000000000000000
!	%f16 = 7fffe000 00000000, Mem[0000000030141408] = 00000000 51d2834c
	stda	%f16,[%i5+%o4]0x81	! Mem[0000000030141408] = 7fffe000 00000000
!	Mem[00000000100c1400] = 000000ff, %l0 = 0000000000000020
	swapa	[%i3+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181408] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000000
!	%f22 = 00000000 ffffffff, Mem[0000000030041408] = ff000000 00000000
	stda	%f22,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000 ffffffff
!	%l1 = 0000000000000000, Mem[0000000010181410] = ff00000000000000
	stxa	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l1 = 0000000000000000
	swapa	[%i5+%g0]0x89,%l1	! %l1 = 0000000000000000
!	%l6 = 0000000000002000, Mem[0000000030141410] = 00000000
	stha	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 00002000
!	%f6  = ffd2834c, Mem[0000000010141400] = 00000000
	sta	%f6 ,[%i5+%g0]0x80	! Mem[0000000010141400] = ffd2834c
!	%l4 = 000000000000001c, Mem[0000000010041410] = 00000000
	stba	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000001c

p0_label_498:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00c4834c, %l4 = 000000000000001c
	lduwa	[%i3+%o5]0x81,%l4	! %l4 = 0000000000c4834c
!	Mem[0000000020800041] = 00ff4c10, %l0 = 0000000000000000, %asi = 80
	lduba	[%o1+0x041]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081408] = 00c4834c000000ff, %l3 = 0000000000000000
	ldx	[%i2+%o4],%l3		! %l3 = 00c4834c000000ff
!	Mem[0000000010101410] = 4c83c400, %l1 = 0000000000000000
	lduba	[%i4+%o5]0x80,%l1	! %l1 = 000000000000004c
!	Mem[00000000100c140e] = 000000ff, %l3 = 00c4834c000000ff
	lduh	[%i3+0x00e],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010141438] = 4fafa800 00001500, %l4 = 00c4834c, %l5 = ff000000
	ldd	[%i5+0x038],%l4		! %l4 = 000000004fafa800 0000000000001500
!	Mem[00000000100c140c] = 000000ff, %l1 = 000000000000004c, %asi = 80
	lduha	[%i3+0x00c]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081410] = 00200000 51d2834c, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i2+%o5]0x81,%l0	! %l0 = 0000000000200000 0000000051d2834c
!	Mem[00000000211c0000] = eeff5a40, %l1 = 0000000051d2834c
	ldsh	[%o2+%g0],%l1		! %l1 = ffffffffffffeeff
!	Mem[0000000010001410] = ff83d25100000000, %f4  = 00000000 00000043
	ldda	[%i0+%o5]0x80,%f4 	! %f4  = ff83d251 00000000

p0_label_499:
!	Starting 10 instruction Store Burst
!	Mem[000000001010141c] = ff000000, %l3 = 000000ff, %l3 = 000000ff
	add	%i4,0x1c,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 00000000ff000000
!	%l7 = 00000000000000ff, Mem[0000000010141408] = 0000000000009840
	stxa	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000000000ff
!	%l4 = 000000004fafa800, imm = fffffffffffff7e8, %l5 = 0000000000001500
	subc	%l4,-0x818,%l5		! %l5 = 000000004fafb018
!	%l4 = 000000004fafa800, Mem[0000000030001400] = 1ae50000
	stwa	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 4fafa800
!	%l5 = 000000004fafb018, Mem[0000000020800040] = 00ff4c10, %asi = 80
	stha	%l5,[%o1+0x040]%asi	! Mem[0000000020800040] = b0184c10
!	Mem[0000000010141408] = 00000000, %l7 = 00000000000000ff
	swapa	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000000
!	%l1 = ffffffffffffeeff, Mem[0000000030181408] = 784de1b4
	stha	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = 784deeff
!	Mem[0000000010081416] = 784de1b4, %l2 = 00000000ffd2834c
	ldstub	[%i2+0x016],%l2		! %l2 = 00000000000000e1
!	Mem[0000000010101408] = 3d5c9877, %l5 = 000000004fafb018, %asi = 80
	swapa	[%i4+0x008]%asi,%l5	! %l5 = 000000003d5c9877
!	Mem[00000000300c1408] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000000

p0_label_500:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 43000000ffff00ff, %f12 = 40980000 000000ff
	ldda	[%i0+%o4]0x80,%f12	! %f12 = 43000000 ffff00ff
!	Mem[0000000010081410] = f436c043784dffb4, %f24 = 5d0f0000 000000ff
	ldd	[%i2+%o5],%f24		! %f24 = f436c043 784dffb4
!	Mem[0000000010081400] = 000000ff00000000, %f14 = 7fff0000 ffff0000
	ldda	[%i2+%g0]0x80,%f14	! %f14 = 000000ff 00000000
!	Mem[0000000010181408] = ff00000000000000, %f2  = 00000000 00000000
	ldda	[%i6+%o4]0x80,%f2 	! %f2  = ff000000 00000000
!	Mem[0000000030041400] = ff0000ff, %l3 = 00000000ff000000
	ldsba	[%i1+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181410] = 00000000, %f26 = b4e14d78
	lda	[%i6+%o5]0x80,%f26	! %f26 = 00000000
!	Mem[0000000030041408] = 00000000, %l2 = 00000000000000e1
	ldsha	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = ffd2834c40ee20ff, %l3 = ffffffffffffffff
	ldxa	[%i5+%g0]0x80,%l3	! %l3 = ffd2834c40ee20ff
!	Mem[0000000010141410] = 00000000 000000ff, %l0 = 00200000, %l1 = ffffeeff
	ldda	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000000 00000000000000ff
!	Mem[0000000030141410] = 00002000, %l4 = 000000004fafa800
	ldsba	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000

!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 0000000000000000
	bne	%xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 00000000000000ff
	bne	%xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000000
	bne	%xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be ffd2834c40ee20ff
	bne	%xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000000000
	bne	%xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 000000003d5c9877
	bne	%xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000002000
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
	cmp	%l0,%l1			! %f0  should be 00000000 40980001
	bne	%xcc,p0_freg_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be ff000000 00000000
	bne	%xcc,p0_freg_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be ff83d251 00000000
	bne	%xcc,p0_freg_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be ffd2834c 0000ffff
	bne	%xcc,p0_freg_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000000 00000000
	bne	%xcc,p0_freg_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be ffd2834c 00000000
	bne	%xcc,p0_freg_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 43000000 ffff00ff
	bne	%xcc,p0_freg_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 000000ff 00000000
	bne	%xcc,p0_freg_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 7fffe000 00000000
	bne	%xcc,p0_freg_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be ffffffff 00c4834c
	bne	%xcc,p0_freg_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be ff000000 4c83c400
	bne	%xcc,p0_freg_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 00000000 ffffffff
	bne	%xcc,p0_freg_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be f436c043 784dffb4
	bne	%xcc,p0_freg_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 00000000 43c036f4
	bne	%xcc,p0_freg_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 3d5c9877 000000ff
	bne	%xcc,p0_freg_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 00000000 00000000
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
	ldx	[%g1+0x000],%l0		! %l0 = 0e3fd1b4c94ad5be
	ldx	[%g1+0x008],%l1		! %l1 = 93e0da4c80547669
	ldx	[%g1+0x010],%l2		! %l2 = 82d122ea8239d324
	ldx	[%g1+0x018],%l3		! %l3 = 3af1e2bacfeb6eef
	ldx	[%g1+0x020],%l4		! %l4 = 980f19f0c3ee5cca
	ldx	[%g1+0x028],%l5		! %l5 = 9c5f5956e5773fb5
	ldx	[%g1+0x030],%l6		! %l6 = e43c0fa8ac954ab0
	ldx	[%g1+0x038],%l7		! %l7 = 6c76ae34aa6d40bb

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
	lduh	[%i2+0x000],%l4		! Mem[0000000010081400]
	orn	%l6,0xf14,%l7
	sdivx	%l7,0x539,%l5
	jmpl	%o7,%g0
	fmuls	%f0 ,%f8 ,%f8 
p0_near_0_he:
	sub	%l2,-0x1b6,%l2
	umul	%l4,%l4,%l0
	xnor	%l6,%l7,%l5
	umul	%l1,%l6,%l3
	jmpl	%o7,%g0
	fmuls	%f22,%f29,%f31
p0_near_0_lo:
	lduh	[%o2+0x000],%l4		! Mem[0000000010081400]
	orn	%l6,0xf14,%l7
	sdivx	%l7,0x539,%l5
	jmpl	%o7,%g0
	fmuls	%f0 ,%f8 ,%f8 
p0_near_0_ho:
	sub	%l2,-0x1b6,%l2
	umul	%l4,%l4,%l0
	xnor	%l6,%l7,%l5
	umul	%l1,%l6,%l3
	jmpl	%o7,%g0
	fmuls	%f22,%f29,%f31
near0_b2b_h:
	fsubs	%f26,%f18,%f24
	fmuls	%f25,%f29,%f19
	fsubs	%f19,%f16,%f23
	andn	%l3,%l7,%l1
	andn	%l1,0xbd3,%l7
	orn	%l6,0xda7,%l4
	mulx	%l3,0x4a9,%l0
	jmpl	%o7,%g0
	xnor	%l1,%l6,%l6
near0_b2b_l:
	umul	%l4,0x908,%l1
	fdivs	%f3 ,%f10,%f15
	add	%l6,%l7,%l6
	sdivx	%l3,0xf00,%l4
	addc	%l6,0x643,%l7
	xnor	%l5,%l4,%l2
	fcmps	%fcc1,%f11,%f14
	jmpl	%o7,%g0
	mulx	%l4,0x3e7,%l5
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
	subc	%l5,0xffa,%l1
	andn	%l2,%l3,%l3
	orn	%l1,%l4,%l3
	jmpl	%o7,%g0
	sub	%l2,%l1,%l5
p0_near_1_he:
	jmpl	%o7,%g0
	fadds	%f19,%f20,%f21
	jmpl	%o7,%g0
	nop
p0_near_1_lo:
	subc	%l5,0xffa,%l1
	andn	%l2,%l3,%l3
	orn	%l1,%l4,%l3
	jmpl	%o7,%g0
	sub	%l2,%l1,%l5
p0_near_1_ho:
	jmpl	%o7,%g0
	fadds	%f19,%f20,%f21
	jmpl	%o7,%g0
	nop
near1_b2b_h:
	and	%l4,%l7,%l0
	orn	%l7,%l0,%l0
	mulx	%l6,%l1,%l3
	jmpl	%o7,%g0
	fcmps	%fcc1,%f19,%f30
near1_b2b_l:
	fsqrts	%f1 ,%f0 
	umul	%l0,%l7,%l5
	add	%l7,0xbba,%l1
	jmpl	%o7,%g0
	fmuls	%f12,%f15,%f1 
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
	addc	%l7,-0x231,%l7
	orn	%l5,-0x172,%l6
	jmpl	%o7,%g0
	smul	%l6,-0x837,%l5
p0_near_2_he:
	smul	%l1,%l0,%l3
	addc	%l6,%l6,%l6
	fsqrts	%f29,%f26
	fdivs	%f27,%f19,%f28
	add	%l1,0xa98,%l5
	jmpl	%o7,%g0
	xnor	%l6,-0xedd,%l2
p0_near_2_lo:
	addc	%l7,-0x231,%l7
	orn	%l5,-0x172,%l6
	jmpl	%o7,%g0
	smul	%l6,-0x837,%l5
p0_near_2_ho:
	smul	%l1,%l0,%l3
	addc	%l6,%l6,%l6
	fsqrts	%f29,%f26
	fdivs	%f27,%f19,%f28
	add	%l1,0xa98,%l5
	jmpl	%o7,%g0
	xnor	%l6,-0xedd,%l2
near2_b2b_h:
	udivx	%l3,0x1ef,%l1
	jmpl	%o7,%g0
	sub	%l3,-0x3bc,%l0
near2_b2b_l:
	sub	%l1,%l2,%l6
	jmpl	%o7,%g0
	addc	%l5,0xae3,%l1
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
	fadds	%f11,%f13,%f2 
	orn	%l3,%l2,%l3
	or	%l2,-0xd05,%l0
	jmpl	%o7,%g0
	mulx	%l2,-0xd29,%l2
p0_near_3_he:
	addc	%l6,0x9f3,%l4
	xor	%l6,-0xf20,%l7
	jmpl	%o7,%g0
	andn	%l6,%l3,%l2
p0_near_3_lo:
	fadds	%f11,%f13,%f2 
	orn	%l3,%l2,%l3
	or	%l2,-0xd05,%l0
	jmpl	%o7,%g0
	mulx	%l2,-0xd29,%l2
p0_near_3_ho:
	addc	%l6,0x9f3,%l4
	xor	%l6,-0xf20,%l7
	jmpl	%o7,%g0
	andn	%l6,%l3,%l2
near3_b2b_h:
	xor	%l1,%l5,%l2
	add	%l0,%l3,%l0
	sub	%l3,0x1ba,%l5
	fcmps	%fcc2,%f21,%f17
	xor	%l1,%l5,%l0
	xnor	%l0,%l3,%l6
	jmpl	%o7,%g0
	orn	%l5,%l7,%l5
near3_b2b_l:
	udivx	%l0,%l3,%l2
	mulx	%l2,%l5,%l3
	umul	%l7,%l0,%l2
	xor	%l4,-0xf4f,%l0
	fdivs	%f7 ,%f4 ,%f15
	mulx	%l5,%l5,%l6
	jmpl	%o7,%g0
	add	%l4,%l6,%l3
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
	xnor	%l5,%l6,%l6
	fmuls	%f5 ,%f10,%f3 
	jmpl	%o7,%g0
	subc	%l7,%l6,%l1
p0_far_0_he:
	or	%l2,%l2,%l7
	addc	%l0,0x8e9,%l5
	fmuls	%f26,%f19,%f31
	sub	%l0,-0x97c,%l5
	fsqrts	%f26,%f26
	jmpl	%o7,%g0
	fdtos	%f18,%f18
p0_far_0_lo:
	xnor	%l5,%l6,%l6
	fmuls	%f5 ,%f10,%f3 
	jmpl	%o7,%g0
	subc	%l7,%l6,%l1
p0_far_0_ho:
	or	%l2,%l2,%l7
	addc	%l0,0x8e9,%l5
	fmuls	%f26,%f19,%f31
	sub	%l0,-0x97c,%l5
	fsqrts	%f26,%f26
	jmpl	%o7,%g0
	fdtos	%f18,%f18
far0_b2b_h:
	fdivs	%f17,%f24,%f24
	sub	%l4,%l3,%l5
	jmpl	%o7,%g0
	addc	%l3,%l7,%l6
far0_b2b_l:
	xnor	%l7,0x321,%l0
	add	%l3,%l3,%l1
	jmpl	%o7,%g0
	udivx	%l0,%l1,%l4
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
	ldsh	[%i0+0x020],%l7		! Mem[0000000010001420]
	ldsw	[%i4+0x01c],%l6		! Mem[000000001010141c]
	jmpl	%o7,%g0
	fsubs	%f15,%f10,%f13
p0_far_1_he:
	fdivs	%f26,%f25,%f16
	nop
	fmuls	%f21,%f22,%f18
	andn	%l4,0xd54,%l2
	ldsh	[%i2+0x024],%l7		! Mem[0000000010081424]
	fmuls	%f20,%f31,%f23
	smul	%l0,0x5ea,%l0
	jmpl	%o7,%g0
	sub	%l3,-0x561,%l6
p0_far_1_lo:
	ldsh	[%o0+0x020],%l7		! Mem[0000000010001420]
	ldsw	[%o4+0x01c],%l6		! Mem[000000001010141c]
	jmpl	%o7,%g0
	fsubs	%f15,%f10,%f13
p0_far_1_ho:
	fdivs	%f26,%f25,%f16
	nop
	fmuls	%f21,%f22,%f18
	andn	%l4,0xd54,%l2
	ldsh	[%o2+0x024],%l7		! Mem[0000000010081424]
	fmuls	%f20,%f31,%f23
	smul	%l0,0x5ea,%l0
	jmpl	%o7,%g0
	sub	%l3,-0x561,%l6
far1_b2b_h:
	mulx	%l3,%l7,%l4
	jmpl	%o7,%g0
	or	%l4,0x699,%l5
far1_b2b_l:
	xnor	%l6,-0x479,%l5
	jmpl	%o7,%g0
	sub	%l0,-0xec5,%l1
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
	fadds	%f10,%f1 ,%f0 
	jmpl	%o7,%g0
	nop
p0_far_2_he:
	jmpl	%o7,%g0
	fcmps	%fcc0,%f20,%f29
	jmpl	%o7,%g0
	nop
p0_far_2_lo:
	jmpl	%o7,%g0
	fadds	%f10,%f1 ,%f0 
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
p0_far_2_ho:
	jmpl	%o7,%g0
	fcmps	%fcc0,%f20,%f29
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
far2_b2b_h:
	fsubs	%f19,%f21,%f17
	addc	%l7,-0x772,%l4
	udivx	%l2,0xd49,%l5
	smul	%l2,0xcce,%l7
	fsubs	%f28,%f24,%f27
	fdivs	%f19,%f21,%f23
	jmpl	%o7,%g0
	fdivs	%f30,%f17,%f23
far2_b2b_l:
	fmuls	%f5 ,%f8 ,%f3 
	fadds	%f4 ,%f7 ,%f13
	orn	%l0,0xb79,%l0
	andn	%l7,0x4c2,%l3
	add	%l3,%l3,%l3
	addc	%l0,0xeb7,%l2
	jmpl	%o7,%g0
	andn	%l7,0x6d2,%l2
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
	subc	%l4,%l1,%l7
	fcmps	%fcc0,%f6 ,%f12
	mulx	%l6,0xe3c,%l7
	jmpl	%o7,%g0
	umul	%l3,%l6,%l6
p0_far_3_he:
	fsqrts	%f18,%f31
	orn	%l5,%l1,%l0
	xnor	%l7,0x7be,%l1
	jmpl	%o7,%g0
	sub	%l0,-0x698,%l6
p0_far_3_lo:
	subc	%l4,%l1,%l7
	fcmps	%fcc0,%f6 ,%f12
	mulx	%l6,0xe3c,%l7
	jmpl	%o7,%g0
	umul	%l3,%l6,%l6
p0_far_3_ho:
	fsqrts	%f18,%f31
	orn	%l5,%l1,%l0
	xnor	%l7,0x7be,%l1
	jmpl	%o7,%g0
	sub	%l0,-0x698,%l6
far3_b2b_h:
	smul	%l1,%l1,%l5
	and	%l2,-0xe0e,%l5
	sdivx	%l7,0xc33,%l5
	fsqrts	%f16,%f19
	fmuls	%f16,%f24,%f26
	andn	%l3,0x21e,%l5
	and	%l0,%l1,%l1
	jmpl	%o7,%g0
	andn	%l1,%l5,%l0
far3_b2b_l:
	sub	%l6,%l7,%l3
	orn	%l1,%l7,%l4
	fmuls	%f15,%f15,%f14
	fadds	%f6 ,%f5 ,%f1 
	fadds	%f13,%f4 ,%f3 
	fsqrts	%f7 ,%f6 
	orn	%l0,%l1,%l1
	jmpl	%o7,%g0
	addc	%l0,0x4b9,%l7
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	.skip	16
p0_jmpl_0_le:
	lduw	[%i0+0x028],%l2		! Mem[0000000010001428]
	xor	%l0,%l1,%l5
	sub	%l1,-0xd97,%l3
	jmpl	%g6+8,%g0
	and	%l4,-0xe4f,%l6
p0_call_0_le:
	mulx	%l1,%l5,%l7
	smul	%l2,0x415,%l5
	sub	%l0,-0xb4d,%l4
	sdivx	%l2,%l5,%l2
	umul	%l0,-0x48d,%l6
	or	%l2,-0x317,%l2
	retl
	fsubs	%f8 ,%f6 ,%f4 
p0_jmpl_0_lo:
	lduw	[%o0+0x028],%l2		! Mem[0000000010001428]
	xor	%l0,%l1,%l5
	sub	%l1,-0xd97,%l3
	jmpl	%g6+8,%g0
	and	%l4,-0xe4f,%l6
p0_call_0_lo:
	mulx	%l1,%l5,%l7
	smul	%l2,0x415,%l5
	sub	%l0,-0xb4d,%l4
	sdivx	%l2,%l5,%l2
	umul	%l0,-0x48d,%l6
	or	%l2,-0x317,%l2
	retl
	fsubs	%f8 ,%f6 ,%f4 
p0_jmpl_0_he:
	jmpl	%g6+8,%g0
	subc	%l6,0x24f,%l5
p0_call_0_he:
	and	%l2,%l3,%l5
	xor	%l4,0x61a,%l3
	fmuls	%f20,%f18,%f26
	retl
	fcmps	%fcc3,%f29,%f24
p0_jmpl_0_ho:
	jmpl	%g6+8,%g0
	subc	%l6,0x24f,%l5
p0_call_0_ho:
	and	%l2,%l3,%l5
	xor	%l4,0x61a,%l3
	fmuls	%f20,%f18,%f26
	retl
	fcmps	%fcc3,%f29,%f24
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	.skip	32
p0_jmpl_1_le:
	fadds	%f3 ,%f4 ,%f2 
	fcmps	%fcc0,%f15,%f3 
	umul	%l1,0xdde,%l7
	fadds	%f0 ,%f10,%f14
	fdtos	%f6 ,%f7 
	or	%l4,%l4,%l6
	jmpl	%g6+8,%g0
	fsubs	%f9 ,%f15,%f12
p0_call_1_le:
	sdivx	%l3,%l1,%l1
	xor	%l3,%l2,%l6
	and	%l6,0x5e0,%l1
	retl
	sub	%l7,0xc7c,%l3
p0_jmpl_1_lo:
	fadds	%f3 ,%f4 ,%f2 
	fcmps	%fcc0,%f15,%f3 
	umul	%l1,0xdde,%l7
	fadds	%f0 ,%f10,%f14
	fdtos	%f6 ,%f7 
	or	%l4,%l4,%l6
	jmpl	%g6+8,%g0
	fsubs	%f9 ,%f15,%f12
p0_call_1_lo:
	sdivx	%l3,%l1,%l1
	xor	%l3,%l2,%l6
	and	%l6,0x5e0,%l1
	retl
	sub	%l7,0xc7c,%l3
p0_jmpl_1_he:
	fadds	%f26,%f17,%f28
	st	%f25,[%i4+0x034]	! Mem[0000000010101434]
	xor	%l4,%l6,%l6
	xnor	%l0,%l3,%l0
	jmpl	%g6+8,%g0
	fsubs	%f19,%f27,%f31
p0_call_1_he:
	xnor	%l1,%l7,%l2
	smul	%l6,-0xd31,%l3
	retl
	fcmps	%fcc3,%f22,%f23
p0_jmpl_1_ho:
	fadds	%f26,%f17,%f28
	st	%f25,[%o4+0x034]	! Mem[0000000010101434]
	xor	%l4,%l6,%l6
	xnor	%l0,%l3,%l0
	jmpl	%g6+8,%g0
	fsubs	%f19,%f27,%f31
p0_call_1_ho:
	xnor	%l1,%l7,%l2
	smul	%l6,-0xd31,%l3
	retl
	fcmps	%fcc3,%f22,%f23
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	.skip	48
p0_jmpl_2_le:
	sdivx	%l6,%l1,%l1
	fadds	%f3 ,%f15,%f5 
	udivx	%l2,%l7,%l1
	jmpl	%g6+8,%g0
	andn	%l6,%l3,%l0
p0_call_2_le:
	subc	%l6,-0x20e,%l7
	xnor	%l2,%l0,%l7
	fmuls	%f10,%f0 ,%f5 
	fsqrts	%f5 ,%f14
	retl
	smul	%l4,%l7,%l6
p0_jmpl_2_lo:
	sdivx	%l6,%l1,%l1
	fadds	%f3 ,%f15,%f5 
	udivx	%l2,%l7,%l1
	jmpl	%g6+8,%g0
	andn	%l6,%l3,%l0
p0_call_2_lo:
	subc	%l6,-0x20e,%l7
	xnor	%l2,%l0,%l7
	fmuls	%f10,%f0 ,%f5 
	fsqrts	%f5 ,%f14
	retl
	smul	%l4,%l7,%l6
p0_jmpl_2_he:
	fadds	%f22,%f17,%f26
	jmpl	%g6+8,%g0
	fadds	%f16,%f21,%f22
p0_call_2_he:
	andn	%l4,%l3,%l5
	fdivs	%f17,%f29,%f27
	fsqrts	%f20,%f18
	fitod	%f24,%f18
	or	%l0,0x9aa,%l1
	retl
	sdivx	%l1,0xa83,%l6
p0_jmpl_2_ho:
	fadds	%f22,%f17,%f26
	jmpl	%g6+8,%g0
	fadds	%f16,%f21,%f22
p0_call_2_ho:
	andn	%l4,%l3,%l5
	fdivs	%f17,%f29,%f27
	fsqrts	%f20,%f18
	fitod	%f24,%f18
	or	%l0,0x9aa,%l1
	retl
	sdivx	%l1,0xa83,%l6
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	.skip	64
p0_jmpl_3_le:
	mulx	%l4,%l0,%l5
	addc	%l5,%l6,%l4
	sdivx	%l6,%l1,%l5
	and	%l5,-0x32a,%l6
	fdtos	%f0 ,%f0 
	subc	%l2,%l5,%l4
	jmpl	%g6+8,%g0
	fsqrts	%f4 ,%f4 
p0_call_3_le:
	fdivs	%f0 ,%f2 ,%f10
	smul	%l7,-0xf9d,%l0
	stw	%l1,[%i3+0x00c]		! Mem[00000000100c140c]
	and	%l5,-0x755,%l6
	umul	%l0,0x71f,%l6
	retl
	fcmps	%fcc0,%f4 ,%f8 
p0_jmpl_3_lo:
	mulx	%l4,%l0,%l5
	addc	%l5,%l6,%l4
	sdivx	%l6,%l1,%l5
	and	%l5,-0x32a,%l6
	fdtos	%f0 ,%f0 
	subc	%l2,%l5,%l4
	jmpl	%g6+8,%g0
	fsqrts	%f4 ,%f4 
p0_call_3_lo:
	fdivs	%f0 ,%f2 ,%f10
	smul	%l7,-0xf9d,%l0
	stw	%l1,[%o3+0x00c]		! Mem[00000000100c140c]
	and	%l5,-0x755,%l6
	umul	%l0,0x71f,%l6
	retl
	fcmps	%fcc0,%f4 ,%f8 
p0_jmpl_3_he:
	andn	%l7,0x725,%l1
	sub	%l4,-0x936,%l3
	add	%l3,%l4,%l2
	and	%l6,%l6,%l4
	andn	%l5,0xa67,%l2
	sdivx	%l0,0xca8,%l1
	and	%l5,%l1,%l2
	jmpl	%g6+8,%g0
	sdivx	%l2,%l3,%l4
p0_call_3_he:
	fsqrts	%f19,%f18
	mulx	%l3,%l2,%l4
	mulx	%l6,-0x75b,%l6
	retl
	xnor	%l1,%l7,%l6
p0_jmpl_3_ho:
	andn	%l7,0x725,%l1
	sub	%l4,-0x936,%l3
	add	%l3,%l4,%l2
	and	%l6,%l6,%l4
	andn	%l5,0xa67,%l2
	sdivx	%l0,0xca8,%l1
	and	%l5,%l1,%l2
	jmpl	%g6+8,%g0
	sdivx	%l2,%l3,%l4
p0_call_3_ho:
	fsqrts	%f19,%f18
	mulx	%l3,%l2,%l4
	mulx	%l6,-0x75b,%l6
	retl
	xnor	%l1,%l7,%l6
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
	.word	0x0e3fd1b4,0xc94ad5be		! Init value for %l0
	.word	0x93e0da4c,0x80547669		! Init value for %l1
	.word	0x82d122ea,0x8239d324		! Init value for %l2
	.word	0x3af1e2ba,0xcfeb6eef		! Init value for %l3
	.word	0x980f19f0,0xc3ee5cca		! Init value for %l4
	.word	0x9c5f5956,0xe5773fb5		! Init value for %l5
	.word	0xe43c0fa8,0xac954ab0		! Init value for %l6
	.word	0x6c76ae34,0xaa6d40bb		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x655ee850,0x5b9f5521		! Init value for %f0 
	.word	0x4c1c580e,0x0a1d1727		! Init value for %f2 
	.word	0x7825163c,0x488d27dd		! Init value for %f4 
	.word	0x7fedfa5a,0x306450c3		! Init value for %f6 
	.word	0x0c4cb7e8,0x1fbb4759		! Init value for %f8 
	.word	0x36c7be66,0x5af30d1f		! Init value for %f10
	.word	0x026d1954,0x1e644f95		! Init value for %f12
	.word	0x01a85032,0x7db1c83b		! Init value for %f14
	.word	0x314f4680,0x75159c91		! Init value for %f16
	.word	0x44de1bbe,0x1dc1be17		! Init value for %f18
	.word	0x019a0b6c,0x392b4a4d		! Init value for %f20
	.word	0x46134d0a,0x6fd8eab3		! Init value for %f22
	.word	0x693df418,0x5f0c34c9		! Init value for %f24
	.word	0x2819d016,0x155e0a0f		! Init value for %f26
	.word	0x52a14c84,0x1925f805		! Init value for %f28
	.word	0x407750e2,0x3444982b		! Init value for %f30
	.word	0x3b8c20b0,0x37a8f001		! Init value for %f32
	.word	0x72b13b6e,0x65a8d107		! Init value for %f34
	.word	0x17d43c9c,0x650438bd		! Init value for %f36
	.word	0x7d58bbba,0x372bb0a3		! Init value for %f38
	.word	0x43c92c48,0x5b21ae39		! Init value for %f40
	.word	0x64d6bdc6,0x3b0ef2ff		! Init value for %f42
	.word	0x12603bb4,0x6d61ec75		! Init value for %f44
	.word	0x67f7ed92,0x6311141b		! Init value for %f46
	.word	0x432076e0,0x03584f71
	.word	0x2a38b71e,0x22094ff7
	.word	0x6bcea9cc,0x6046f32d
	.word	0x7fd1466a,0x1043a293
	.word	0x21d96078,0x535ab3a9
	.word	0x07818776,0x0e9cc7ef
	.word	0x6f84e6e4,0x2ca72ce5
	.word	0x7e1d2642,0x245e3c0b
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
	.word	0x00000000,0x000000ff		! %l1
	.word	0x00000000,0x00000000		! %l2
	.word	0xffd2834c,0x40ee20ff		! %l3
	.word	0x00000000,0x00000000		! %l4
	.word	0x00000000,0x3d5c9877		! %l5
	.word	0x00000000,0x00002000		! %l6
	.word	0x00000000,0x00000000		! %l7
p0_expected_fp_regs:
	.word	0x00000000,0x40980001		! %f0
	.word	0xff000000,0x00000000		! %f2
	.word	0xff83d251,0x00000000		! %f4
	.word	0xffd2834c,0x0000ffff		! %f6
	.word	0x00000000,0x00000000		! %f8
	.word	0xffd2834c,0x00000000		! %f10
	.word	0x43000000,0xffff00ff		! %f12
	.word	0x000000ff,0x00000000		! %f14
	.word	0x7fffe000,0x00000000		! %f16
	.word	0xffffffff,0x00c4834c		! %f18
	.word	0xff000000,0x4c83c400		! %f20
	.word	0x00000000,0xffffffff		! %f22
	.word	0xf436c043,0x784dffb4		! %f24
	.word	0x00000000,0x43c036f4		! %f26
	.word	0x3d5c9877,0x000000ff		! %f28
	.word	0x00000000,0x00000000		! %f30
	.word	0x0000003e,0x000007e1		! %fsr
p0_local0_expect:
	.word	0x00000000,0x0000001c,0x43000000,0xffff00ff ! PA = 0000000010001400
	.word	0xff83d251,0x00000000,0x00000000,0x00000000 ! PA = 0000000010001410
	.word	0xff000000,0x00ff0000,0x0000ff00,0xf87be187 ! PA = 0000000010001420
	.word	0x000000ff,0x000000ff,0xff631500,0x00000000 ! PA = 0000000010001430
p0_local0_sec_expect:
	.word	0x00a8af4f,0x00000000,0xffffffff,0x00000000 ! PA = 0000000030001400
	.word	0x00000028,0x00000000,0x43ccfaf1,0x43ccfaf1 ! PA = 0000000030001410
	.word	0xf1facc43,0x00a8af4f,0x0000ffe6,0x00000000 ! PA = 0000000030001420
	.word	0x00000000,0x000000ff,0x43ccfa71,0x00000000 ! PA = 0000000030001430
!	Scratch Area for Non-Transactional Memory Stores
	.word	0x37e5341e,0xd144662f,0x4df778c2,0xc208099b
	.word	0xc5f1f386,0xc7e75b67,0x62951d6a,0x54f72693
	.word	0x091d776e,0xe3f34e1f,0x3175ca92,0x7d2d8d0b
	.word	0x430b67d6,0x2a223657,0xffd4683a,0xb262f503
p0_local1_expect:
	.word	0x43ccfaf1,0x00000000,0xffcbffda,0x00ff004c ! PA = 0000000010041400
	.word	0x1c000000,0x00000000,0x00000000,0xffffffff ! PA = 0000000010041410
	.word	0xffffffff,0xffffffff,0xffffffff,0x00000f5d ! PA = 0000000010041420
	.word	0xffafa800,0x40ee20ff,0x85d1787f,0x0000ff00 ! PA = 0000000010041430
p0_local1_sec_expect:
	.word	0xff0000ff,0x5d0f00ff,0x00000000,0xffffffff ! PA = 0000000030041400
	.word	0x16010000,0x55000000,0x43f00000,0x4c83434b ! PA = 0000000030041410
	.word	0x0000ffff,0x3e295957,0xffc4787f,0x51d2834c ! PA = 0000000030041420
	.word	0x3d5c9877,0x1c368a02,0x00000000,0x00000000 ! PA = 0000000030041430
p0_local2_expect:
	.word	0x000000ff,0x00000000,0x00c4834c,0x000000ff ! PA = 0000000010081400
	.word	0xf436c043,0x784dffb4,0x00ffdbff,0x7fff0000 ! PA = 0000000010081410
	.word	0xffc478ff,0x51d2834c,0xff83d251,0x00ffffff ! PA = 0000000010081420
	.word	0x0000004f,0xffff00ff,0x00000000,0x00000000 ! PA = 0000000010081430
p0_local2_sec_expect:
	.word	0xff11ad0a,0x80ffffff,0x00000000,0x00000000 ! PA = 0000000030081400
	.word	0x00200000,0x51d2834c,0x43f05d0f,0xffffffff ! PA = 0000000030081410
	.word	0x9725ca24,0x3e295957,0xffc4787f,0x51d2834c ! PA = 0000000030081420
	.word	0xff0000ff,0xdaffcb1c,0x00000000,0x00000000 ! PA = 0000000030081430
p0_local3_expect:
	.word	0x20000000,0x0aad11ff,0x00000000,0x000000ff ! PA = 00000000100c1400
	.word	0x00a8af4f,0x00000000,0x00000000,0x0000007f ! PA = 00000000100c1410
	.word	0x00000000,0x00000000,0x00000000,0x7f78c4ff ! PA = 00000000100c1420
	.word	0x028a361c,0x77985c3d,0x0000d200,0x0000ff00 ! PA = 00000000100c1430
p0_local3_sec_expect:
	.word	0x00d2834c,0x0000ffff,0xff000000,0xffffffff ! PA = 00000000300c1400
	.word	0x00c4834c,0x000000ff,0xffffffff,0x00000000 ! PA = 00000000300c1410
	.word	0xffffff19,0xffffffff,0x4c83d251,0x000000ff ! PA = 00000000300c1420
	.word	0xff000000,0x77985c3d,0x00000000,0x00000000 ! PA = 00000000300c1430
p0_local4_expect:
	.word	0x834c834c,0x0000ffff,0x4fafb018,0x00000000 ! PA = 0000000010101400
	.word	0x4c83c400,0x00000000,0x1ccbffda,0xff000000 ! PA = 0000000010101410
	.word	0x000000ff,0x4fafa800,0xff000000,0x00000f5d ! PA = 0000000010101420
	.word	0x000000ff,0x66000000,0x0000ff00,0x0000008b ! PA = 0000000010101430
p0_local4_sec_expect:
	.word	0x000000ff,0x000000ff,0x00000000,0x00000000 ! PA = 0000000030101400
	.word	0xc4257ff7,0x00000000,0x0000ffff,0x55000000 ! PA = 0000000030101410
	.word	0x5759293e,0x24ca2597,0x4c83d251,0x7f78c4ff ! PA = 0000000030101420
	.word	0x4b439fda,0x1362852c,0x66000000,0x55000000 ! PA = 0000000030101430
p0_local5_expect:
	.word	0xffd2834c,0x40ee20ff,0x000000ff,0x000000ff ! PA = 0000000010141400
	.word	0x00000000,0x000000ff,0x20efff0a,0x00000980 ! PA = 0000000010141410
	.word	0x00000000,0x0000001c,0x6622ff00,0xff000000 ! PA = 0000000010141420
	.word	0x0000ffff,0x73ffb0ec,0x4fafa800,0x00001500 ! PA = 0000000010141430
p0_local5_sec_expect:
	.word	0x00000000,0x00000000,0x7fffe000,0x00000000 ! PA = 0000000030141400
	.word	0x00200000,0x00000000,0xffffffff,0x0f5df043 ! PA = 0000000030141410
	.word	0xffffff19,0xffffffff,0x4c83d251,0x7f78c4ff ! PA = 0000000030141420
	.word	0xff000000,0x77985c3d,0x00000000,0x00000000 ! PA = 0000000030141430
p0_local6_expect:
	.word	0x20000000,0x4c83ff00,0xff000000,0x00000000 ! PA = 0000000010181400
	.word	0x00000000,0x00000000,0xff000000,0x00a8afff ! PA = 0000000010181410
	.word	0x00000000,0x000000ff,0xffafa800,0x00000000 ! PA = 0000000010181420
	.word	0xff000000,0x00000000,0x00000000,0x00000000 ! PA = 0000000010181430
p0_local6_sec_expect:
	.word	0x80000000,0x00000000,0xffee4d78,0x00000000 ! PA = 0000000030181400
	.word	0x00000000,0x00ffffff,0xffffffff,0x19ffffff ! PA = 0000000030181410
	.word	0xff000000,0x00000000,0x00ff0000,0xff000000 ! PA = 0000000030181420
	.word	0x0d110705,0x000000ff,0xff000000,0x00000000 ! PA = 0000000030181430
share0_expect:
	.word	0xffeea3b0,0x741c8701,0x2bac166e,0x4db36007 ! PA = 00000000201c0000
	.word	0x1f4f2f9c,0x5e9f7fbd,0x7a4e86ba,0x11af6fa3 ! PA = 00000000201c0010
	.word	0x2e5a8f48,0x02b3a539,0x05fa78c6,0x2b92e1ff ! PA = 00000000201c0020
	.word	0x15130eb4,0x00e99375,0x27ec9892,0x77cc331b ! PA = 00000000201c0030
share1_expect:
	.word	0xffffb9e0,0x5504a671,0x6911521e,0x12e29ef7 ! PA = 0000000020800000
	.word	0x68a55ccc,0x4d76fa2d,0x3e10d16a,0x2dd22193 ! PA = 0000000020800010
	.word	0x3d928378,0x6b9d6aa9,0x111b0276,0x612776ef ! PA = 0000000020800020
	.word	0x38eb79e4,0x08bb93e5,0x05739142,0x3adc1b0b ! PA = 0000000020800030
	.word	0xb0184c10,0x5bb7d1e1,0x20bde9ce,0x02f249e7 ! PA = 0000000020800040
	.word	0x2026c5fc,0x3b97409d,0x4609381a,0x72d0ff83 ! PA = 0000000020800050
	.word	0x30aa73a8,0x3ab9bc19,0x2e9c6826,0x5b5ff7df ! PA = 0000000020800060
	.word	0x4d74a114,0x76d5e055,0x4c8225f2,0x75e3aefb ! PA = 0000000020800070
share2_expect:
	.word	0xeeff5a40,0x39b50951,0x42d4dd7e,0x5b9960d7 ! PA = 00000000211c0000
	.word	0x0e4e6b2c,0x46af530d,0x5fcabaca,0x60130973 ! PA = 00000000211c0010
	.word	0x3d0d5fd8,0x70e79989,0x4481a9d6,0x4a5364cf ! PA = 00000000211c0020
	.word	0x48098444,0x564778c5,0x268b56a2,0x28a9eeeb ! PA = 00000000211c0030
share3_expect:
	.word	0x004ce470,0x5b3b4cc1,0x57392d2e,0x3b4ee3c7 ! PA = 0000000021800000
	.word	0x61574c5c,0x432e317d,0x7ca8597a,0x31bf3f63 ! PA = 0000000021800010
	.word	0x69e64808,0x01c602f9,0x288dc786,0x36d8bdbf ! PA = 0000000021800020
	.word	0x1bc52374,0x20df5d35,0x38c22352,0x07b5dadb ! PA = 0000000021800030
	.word	0xffffeaa0,0x57499c31,0x2d8dd8de,0x1149d2b7 ! PA = 0000000021800040
	.word	0x5d3c698c,0x2c42dbed,0x61b5142a,0x50bca153 ! PA = 0000000021800050
	.word	0x40202c38,0x43b3f869,0x5043c136,0x728702af ! PA = 0000000021800060
	.word	0x69827ea4,0x2f2c8da5,0x54198c02,0x6c4e72cb ! PA = 0000000021800070
	.word	0xffff6cd0,0x5f9ef7a1,0x0d35e08e,0x0d812da7 ! PA = 0000000021800080
	.word	0x0bb8c2bc,0x13dc525d,0x57c3eada,0x42b22f43 ! PA = 0000000021800090
	.word	0x7a660c68,0x5fd079d9,0x00e696e6,0x07b5339f ! PA = 00000000218000a0
	.word	0x2fdc95d4,0x287e0a15,0x254490b2,0x447ab6bb ! PA = 00000000218000b0
	.word	0x00556b00,0x30ba5f11,0x6554443e,0x10abf497 ! PA = 00000000218000c0
	.word	0x6c4757ec,0x12a994cd,0x5b67dd8a,0x1a06e933 ! PA = 00000000218000d0
	.word	0x3522e898,0x41fa8749,0x7f794896,0x297a508f ! PA = 00000000218000e0
	.word	0x7b2e6904,0x72e2d285,0x64b63162,0x0301a6ab ! PA = 00000000218000f0
	.word	0xffffe530,0x01dad281,0x7ccc03ee,0x1c412787 ! PA = 0000000021800100
	.word	0x2423291c,0x3819a33d,0x4cf3ec3a,0x65e1cf23 ! PA = 0000000021800110
	.word	0x1e81c0c8,0x08d120b9,0x40bed646,0x23ad597f ! PA = 0000000021800120
	.word	0x1592f834,0x2329e6f5,0x06a16e12,0x0f6a429b ! PA = 0000000021800130
	.word	0xcc43db60,0x74ff51f1,0x22401f9e,0x4277c677 ! PA = 0000000021800140
	.word	0x2e47364c,0x7a5b7dad,0x207b16ea,0x2229e113 ! PA = 0000000021800150
	.word	0x266d94f8,0x75b34629,0x193a3ff6,0x4ae54e6f ! PA = 0000000021800160
	.word	0x36e54364,0x6ce24765,0x6af946c2,0x35fb8a8b ! PA = 0000000021800170
	.word	0xffff4d90,0x06e6dd61,0x5c13974e,0x1646d167 ! PA = 0000000021800180
	.word	0x0b6e7f7c,0x265e241d,0x0dd05d9a,0x27861f03 ! PA = 0000000021800190
	.word	0x2e916528,0x5cbff799,0x6d2e85a6,0x6c792f5f ! PA = 00000000218001a0
	.word	0x34c04a94,0x125af3d5,0x0d70bb72,0x17bc7e7b ! PA = 00000000218001b0
	.word	0xff803bc0,0x7f1074d1,0x18696afe,0x1b654857 ! PA = 00000000218001c0
	.word	0x721404ac,0x4fd0968d,0x4086c04a,0x1b5d88f3 ! PA = 00000000218001d0
	.word	0x3a583158,0x14d63509,0x609ea756,0x3e7ffc4f ! PA = 00000000218001e0
	.word	0x327f0dc4,0x54a2ec45,0x357acc22,0x1a741e6b ! PA = 00000000218001f0
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
	.word	0x60d74910,0x12e2bae1,0x77d78ece,0x13da3ae7	! PA = 0000000010001400
	.word	0x344452fc,0x15e2799d,0x6b4fed1a,0x61c7c083	! PA = 0000000010001410
	.word	0x7b1990a8,0x19d64519,0x3a5d2d26,0x4b5e88df	! PA = 0000000010001420
	.word	0x35aa4e14,0x7744b955,0x2499faf2,0x67330ffb	! PA = 0000000010001430
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
	.word	0x373b9740,0x6bc73251,0x4fb0c27e,0x6cd291d7	! PA = 0000000030001400
	.word	0x5db0382c,0x3785cc0d,0x5167afca,0x5f1f0a73	! PA = 0000000030001410
	.word	0x68f4bcd8,0x03736289,0x676caed6,0x156b35cf	! PA = 0000000030001420
	.word	0x7e2b7144,0x6c4991c5,0x48e16ba2,0x5f568feb	! PA = 0000000030001430
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
	.word	0x22986170,0x4e44b5c1,0x3da7522e,0x3f6954c7	! PA = 0000000010041400
	.word	0x3a4d595c,0x2d9fea7d,0x676b8e7a,0x78708063	! PA = 0000000010041410
	.word	0x5695e508,0x57d10bf9,0x68730c86,0x6999cebf	! PA = 0000000010041420
	.word	0x60235074,0x1984b635,0x54267852,0x754fbbdb	! PA = 0000000010041430
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
	.word	0x68f8a7a0,0x255a4531,0x155e3dde,0x6ed583b7	! PA = 0000000030041400
	.word	0x3216b68c,0x075fd4ed,0x366e892a,0x4aa32253	! PA = 0000000030041410
	.word	0x30e80938,0x414e4169,0x36f34636,0x0d8153af	! PA = 0000000030041420
	.word	0x206ceba4,0x6b8526a5,0x5b5c2102,0x366593cb	! PA = 0000000030041430
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
	.word	0x6a2769d0,0x76c6e0a1,0x2238858e,0x1f0e1ea7	! PA = 0000000010081400
	.word	0x72c74fbc,0x6ab48b5d,0x4b439fda,0x0f5df043	! PA = 0000000010081410
	.word	0x16962968,0x3d0a02d9,0x1c305be6,0x7f78c49f	! PA = 0000000010081420
	.word	0x61a342d4,0x1d99e315,0x4f3565b2,0x449f17bb	! PA = 0000000010081430
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
	.word	0x4fafa800,0x53098811,0x5759293e,0x24ca2597	! PA = 0000000030081400
	.word	0x1fda24ec,0x044d0dcd,0x667dd28a,0x0d07ea33	! PA = 0000000030081410
	.word	0x080b4598,0x0ae35049,0x612d4d96,0x6697218f	! PA = 0000000030081420
	.word	0x54215604,0x29d1eb85,0x2c254662,0x46c347ab	! PA = 0000000030081430
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
	.word	0x3cdc6230,0x45613b81,0x7fa328ee,0x75809887	! PA = 00000000100c1400
	.word	0x028a361c,0x77985c3d,0x2c70213a,0x06c81023	! PA = 00000000100c1410
	.word	0x17725dc8,0x1d7929b9,0x7ead1b46,0x02b36a7f	! PA = 00000000100c1420
	.word	0x66022534,0x38fc3ff5,0x2a5ec312,0x5859239b	! PA = 00000000100c1430
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
	.word	0x7eb89860,0x43ccfaf1,0x6db9849e,0x17687777	! PA = 00000000300c1400
	.word	0x39d2834c,0x4ec576ad,0x552d8bea,0x2c856213	! PA = 00000000300c1410
	.word	0x18b671f8,0x0a2a8f29,0x4d32c4f6,0x1c649f6f	! PA = 00000000300c1420
	.word	0x7320b064,0x12a7e065,0x6dd4dbc2,0x79a7ab8b	! PA = 00000000300c1430
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
	.word	0x3c0f4a90,0x1f0bc661,0x2bff3c4e,0x1178c267	! PA = 0000000010101400
	.word	0x6a6e0c7c,0x6ac35d1d,0x5c89129a,0x0ae6e003	! PA = 0000000010101410
	.word	0x51828228,0x79168099,0x35014aa6,0x7501c05f	! PA = 0000000010101420
	.word	0x7517f794,0x0d23ccd5,0x363a9072,0x7fb5df7b	! PA = 0000000010101430
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
	.word	0x256b78c0,0x729c9dd1,0x2c974ffe,0x5b687957	! PA = 0000000030101400
	.word	0x6ed7d1ac,0x73410f8d,0x3215b54a,0x7b5389f3	! PA = 0000000030101410
	.word	0x29418e58,0x151bfe09,0x5e1bac56,0x36a1cd4f	! PA = 0000000030101420
	.word	0x3342fac4,0x7d7f0545,0x0f02e122,0x044abf6b	! PA = 0000000030101430
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
	.word	0x251822f0,0x14be8141,0x7964bfae,0x4dae9c47	! PA = 0000000010141400
	.word	0x074ad2dc,0x46ad8dfd,0x692673fa,0x13f25fe3	! PA = 0000000010141410
	.word	0x591e9688,0x7bda0779,0x6044ea06,0x641bc63f	! PA = 0000000010141420
	.word	0x72bcb9f4,0x278889b5,0x7f60cdd2,0x55ed4b5b	! PA = 0000000010141430
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
	.word	0x0f204920,0x067070b1,0x640a8b5e,0x11822b37	! PA = 0000000030141400
	.word	0x09c2100c,0x6a37d86d,0x68ce4eaa,0x17aa61d3	! PA = 0000000030141410
	.word	0x1c049ab8,0x2daf9ce9,0x730003b6,0x4906ab2f	! PA = 0000000030141420
	.word	0x26603524,0x2dcf5a25,0x3a475682,0x67e4834b	! PA = 0000000030141430
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
	.word	0x514eeb50,0x63716c21,0x35ebb30e,0x10da2627	! PA = 0000000010181400
	.word	0x11f8893c,0x79ceeedd,0x1be0455a,0x66228fc3	! PA = 0000000010181410
	.word	0x5e9e9ae8,0x7dbbbe59,0x1d8ff966,0x69b97c1f	! PA = 0000000010181420
	.word	0x1ec86c54,0x01a27695,0x4e697b32,0x4237673b	! PA = 0000000010181430
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
	.word	0x232f0980,0x52407391,0x602b36be,0x666d8d17	! PA = 0000000030181400
	.word	0x31693e6c,0x1821d14d,0x20ef580a,0x6bc1e9b3	! PA = 0000000030181410
	.word	0x6f579718,0x01dd6bc9,0x66f7cb16,0x734b390f	! PA = 0000000030181420
	.word	0x3a505f84,0x5310df05,0x563a3be2,0x71acf72b	! PA = 0000000030181430
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
	.word	0x360ba3b0,0x741c8701,0x2bac166e,0x4db36007	! PA = 00000000201c0000
	.word	0x1f4f2f9c,0x5e9f7fbd,0x7a4e86ba,0x11af6fa3	! PA = 00000000201c0010
	.word	0x2e5a8f48,0x02b3a539,0x05fa78c6,0x2b92e1ff	! PA = 00000000201c0020
	.word	0x15130eb4,0x00e99375,0x27ec9892,0x77cc331b	! PA = 00000000201c0030
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
	.word	0x64efb9e0,0x5504a671,0x6911521e,0x12e29ef7	! PA = 0000000020800000
	.word	0x68a55ccc,0x4d76fa2d,0x3e10d16a,0x2dd22193	! PA = 0000000020800010
	.word	0x3d928378,0x6b9d6aa9,0x111b0276,0x612776ef	! PA = 0000000020800020
	.word	0x38eb79e4,0x08bb93e5,0x05739142,0x3adc1b0b	! PA = 0000000020800030
	.word	0x64a64c10,0x5bb7d1e1,0x20bde9ce,0x02f249e7	! PA = 0000000020800040
	.word	0x2026c5fc,0x3b97409d,0x4609381a,0x72d0ff83	! PA = 0000000020800050
	.word	0x30aa73a8,0x3ab9bc19,0x2e9c6826,0x5b5ff7df	! PA = 0000000020800060
	.word	0x4d74a114,0x76d5e055,0x4c8225f2,0x75e3aefb	! PA = 0000000020800070
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
	.word	0x73ba5a40,0x39b50951,0x42d4dd7e,0x5b9960d7	! PA = 00000000211c0000
	.word	0x0e4e6b2c,0x46af530d,0x5fcabaca,0x60130973	! PA = 00000000211c0010
	.word	0x3d0d5fd8,0x70e79989,0x4481a9d6,0x4a5364cf	! PA = 00000000211c0020
	.word	0x48098444,0x564778c5,0x268b56a2,0x28a9eeeb	! PA = 00000000211c0030
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
	.word	0x0a76e470,0x5b3b4cc1,0x57392d2e,0x3b4ee3c7	! PA = 0000000021800000
	.word	0x61574c5c,0x432e317d,0x7ca8597a,0x31bf3f63	! PA = 0000000021800010
	.word	0x69e64808,0x01c602f9,0x288dc786,0x36d8bdbf	! PA = 0000000021800020
	.word	0x1bc52374,0x20df5d35,0x38c22352,0x07b5dadb	! PA = 0000000021800030
	.word	0x0ae6eaa0,0x57499c31,0x2d8dd8de,0x1149d2b7	! PA = 0000000021800040
	.word	0x5d3c698c,0x2c42dbed,0x61b5142a,0x50bca153	! PA = 0000000021800050
	.word	0x40202c38,0x43b3f869,0x5043c136,0x728702af	! PA = 0000000021800060
	.word	0x69827ea4,0x2f2c8da5,0x54198c02,0x6c4e72cb	! PA = 0000000021800070
	.word	0x70d56cd0,0x5f9ef7a1,0x0d35e08e,0x0d812da7	! PA = 0000000021800080
	.word	0x0bb8c2bc,0x13dc525d,0x57c3eada,0x42b22f43	! PA = 0000000021800090
	.word	0x7a660c68,0x5fd079d9,0x00e696e6,0x07b5339f	! PA = 00000000218000a0
	.word	0x2fdc95d4,0x287e0a15,0x254490b2,0x447ab6bb	! PA = 00000000218000b0
	.word	0x01cd6b00,0x30ba5f11,0x6554443e,0x10abf497	! PA = 00000000218000c0
	.word	0x6c4757ec,0x12a994cd,0x5b67dd8a,0x1a06e933	! PA = 00000000218000d0
	.word	0x3522e898,0x41fa8749,0x7f794896,0x297a508f	! PA = 00000000218000e0
	.word	0x7b2e6904,0x72e2d285,0x64b63162,0x0301a6ab	! PA = 00000000218000f0
	.word	0x7d19e530,0x01dad281,0x7ccc03ee,0x1c412787	! PA = 0000000021800100
	.word	0x2423291c,0x3819a33d,0x4cf3ec3a,0x65e1cf23	! PA = 0000000021800110
	.word	0x1e81c0c8,0x08d120b9,0x40bed646,0x23ad597f	! PA = 0000000021800120
	.word	0x1592f834,0x2329e6f5,0x06a16e12,0x0f6a429b	! PA = 0000000021800130
	.word	0x4bc5db60,0x74ff51f1,0x22401f9e,0x4277c677	! PA = 0000000021800140
	.word	0x2e47364c,0x7a5b7dad,0x207b16ea,0x2229e113	! PA = 0000000021800150
	.word	0x266d94f8,0x75b34629,0x193a3ff6,0x4ae54e6f	! PA = 0000000021800160
	.word	0x36e54364,0x6ce24765,0x6af946c2,0x35fb8a8b	! PA = 0000000021800170
	.word	0x309c4d90,0x06e6dd61,0x5c13974e,0x1646d167	! PA = 0000000021800180
	.word	0x0b6e7f7c,0x265e241d,0x0dd05d9a,0x27861f03	! PA = 0000000021800190
	.word	0x2e916528,0x5cbff799,0x6d2e85a6,0x6c792f5f	! PA = 00000000218001a0
	.word	0x34c04a94,0x125af3d5,0x0d70bb72,0x17bc7e7b	! PA = 00000000218001b0
	.word	0x78283bc0,0x7f1074d1,0x18696afe,0x1b654857	! PA = 00000000218001c0
	.word	0x721404ac,0x4fd0968d,0x4086c04a,0x1b5d88f3	! PA = 00000000218001d0
	.word	0x3a583158,0x14d63509,0x609ea756,0x3e7ffc4f	! PA = 00000000218001e0
	.word	0x327f0dc4,0x54a2ec45,0x357acc22,0x1a741e6b	! PA = 00000000218001f0
share3_end:
