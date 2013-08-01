/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_5000_6.s
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
!	Seed = 626172910
!	Riesling can be on
!	1 Thread, 5000 lines
!	mpgen   created on May 4, 2009 (15:17:56), Version 2.81
!	mpgen_5000l_18.s created on Jun 26, 2009 (17:29:10)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.090504 -rc random.rc -o mpgen_5000l_18 -p 1 -l 5000

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
!	%f0  = 7db5a9e8 4e413159 537bc066 056dc71f
!	%f4  = 1400ab54 21465995 4933f232 4c61a23b
!	%f8  = 428f7880 148dc691 72535dbe 4c30b817
!	%f12 = 21a8dd6c 6a93944d 59242f0a 07b104b3
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 68dd6618 4ede9ec9 07185216 4869440f
!	%f20 = 76335e84 54fc8205 7a5572e2 566cf22b
!	%f24 = 0d12d2b0 783d9a01 2100fd6e 06f84b07
!	%f28 = 58f18e9c 783102bd 464c1dba 5dcc4aa3
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 7fbf1e48 2de09839 1d3fbfc6 3d4aacff
!	%f36 = 5010cdb4 35ccf675 55488f92 6151ee1b
!	%f40 = 570da8e0 0aa97971 6482f91e 20d949f7
!	%f44 = 6a1a7bcc 6cd83d2d 73c7286a 324cbc93
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x4a5966c900000067,%g7,%g1 ! %gsr scale = 12, align = 7
	wr	%g1,%g0,%gsr		! %gsr = 4a5966c900000067

	wr	%g0,%y			! Clear %y register
	xorcc	%g0,%g0,%g3		! %g3 = 0, %ccr = 44
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = f646fa42, %l7 = 7f9e2deab99c8f33
	ldstuba	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000042
!	%l1 = b1eae9f58e2dd5e1, Mem[0000000010101418] = 03e43272514bb97b
	stx	%l1,[%i4+0x018]		! Mem[0000000010101418] = b1eae9f58e2dd5e1
!	Mem[0000000010181400] = e88c6f52, %l1 = b1eae9f58e2dd5e1
	ldstuba	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000052
!	Mem[0000000030001410] = 4483f74a, %l1 = 0000000000000052
	ldstuba	[%i0+%o5]0x89,%l1	! %l1 = 000000000000004a
!	Mem[000000001018142c] = 3de48717, %l5 = 000000002233092d, %asi = 80
	swapa	[%i6+0x02c]%asi,%l5	! %l5 = 000000003de48717
!	%l4 = 009df20e1e53b7c2, Mem[0000000010081410] = 26aad4d4
	stba	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = c2aad4d4
!	%l6 = dc514d59cf5e3aa8, Mem[0000000010041418] = 3a811a525a3295db
	stx	%l6,[%i1+0x018]		! Mem[0000000010041418] = dc514d59cf5e3aa8
!	Mem[0000000010001434] = 1dc0160d, %l0 = 000000003f2fa6b6
	swap	[%i0+0x034],%l0		! %l0 = 000000001dc0160d
!	Mem[00000000100c1418] = 1bc36512, %l1 = 000000000000004a, %asi = 80
	swapa	[%i3+0x018]%asi,%l1	! %l1 = 000000001bc36512
!	Mem[0000000030181408] = 164d9e73, %l1 = 000000001bc36512
	ldstuba	[%i6+%o4]0x89,%l1	! %l1 = 0000000000000073

p0_label_2:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 35ebfb66383c361f, %f24 = 0d12d2b0 783d9a01
	ldda	[%i6+%o4]0x80,%f24	! %f24 = 35ebfb66 383c361f
!	Mem[0000000030181408] = ff9e4d16, %l2 = 97b621be2be4791c
	ldsha	[%i6+%o4]0x81,%l2	! %l2 = ffffffffffffff9e
!	Mem[0000000010141410] = f44b9b43, %l3 = ddcdf1bf9b069367
	lduwa	[%i5+%o5]0x88,%l3	! %l3 = 00000000f44b9b43
!	Mem[0000000010081400] = d9ec7363681b3345, %l0 = 000000001dc0160d
	ldxa	[%i2+%g0]0x88,%l0	! %l0 = d9ec7363681b3345
!	%l1 = 0000000000000073, %l4 = 009df20e1e53b7c2, %l6 = dc514d59cf5e3aa8
	subc	%l1,%l4,%l6		! %l6 = ff620df1e1ac48b1
!	Mem[0000000030101400] = 58002f11, %l5 = 000000003de48717
	ldswa	[%i4+%g0]0x89,%l5	! %l5 = 0000000058002f11
!	%o1 = deadbeefdeadbeef
	set	share1_start,%o1	! set %o1[0] to VA
!	Mem[0000000020800040] = 1a1565a8, %l0 = d9ec7363681b3345
	ldub	[%o1+0x040],%l0		! %l0 = 000000000000001a
!	%f7  = 4c61a23b, %f31 = 5dcc4aa3, %f6  = 4933f232
	fdivs	%f7 ,%f31,%f6 		! %f6  = 2e0d5f3f
!	Mem[0000000010041400] = 08d72571, %f14 = 59242f0a
	lda	[%i1+%g0]0x88,%f14	! %f14 = 08d72571
!	Mem[0000000010041408] = 860ec60d, %f2  = 537bc066
	lda	[%i1+%o4]0x88,%f2 	! %f2 = 860ec60d

p0_label_3:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000058002f11, Mem[0000000010081400] = 681b3345
	stwa	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 58002f11
!	%l1 = 0000000000000073, Mem[0000000010041408] = bf88d70a860ec60d
	stxa	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000000073
!	%o3 = deadbeefdeadbeef
	set	share3_start,%o3	! set %o3[0] to VA
!	Mem[0000000021800101] = 5013b2c8, %l1 = 0000000000000073
	ldstub	[%o3+0x101],%l1		! %l1 = 0000000000000013
!	%f8  = 428f7880 148dc691, Mem[00000000300c1410] = 5183c264 276b6a65
	stda	%f8 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 428f7880 148dc691
!	%f9  = 148dc691, Mem[00000000100c1400] = c84f9c72
	sta	%f9 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 148dc691
!	Mem[0000000010081408] = 12b85de6, %l2 = ffffffffffffff9e
	ldstuba	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000012
!	%f13 = 6a93944d, Mem[0000000010001430] = 4ab90a2c
	sta	%f13,[%i0+0x030]%asi	! Mem[0000000010001430] = 6a93944d
!	%l5 = 0000000058002f11, Mem[0000000030001408] = 46d530d6
	stba	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = 11d530d6
!	Mem[0000000010141410] = 439b4bf4, %l4 = 009df20e1e53b7c2
	ldstuba	[%i5+%o5]0x80,%l4	! %l4 = 0000000000000043
!	Mem[0000000030041400] = 466e7b38, %l2 = 0000000000000012
	ldstuba	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000046

p0_label_4:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = 7466f578, %l1 = 0000000000000013, %asi = 80
	ldsha	[%o1+0x000]%asi,%l1	! %l1 = 0000000000007466
!	Mem[0000000030141400] = b80cbf65, %l5 = 0000000058002f11
	ldsha	[%i5+%g0]0x89,%l5	! %l5 = ffffffffffffbf65
!	%l7 = 0000000000000042, %l6 = ff620df1e1ac48b1, %l7 = 0000000000000042
	addc	%l7,%l6,%l7		! %l7 = ff620df1e1ac48f3
!	Mem[00000000218000c0] = 775e5a98, %l3 = 00000000f44b9b43
	ldsb	[%o3+0x0c0],%l3		! %l3 = 0000000000000077
!	%o2 = deadbeefdeadbeef
	set	share2_start,%o2	! set %o2[0] to VA
!	Mem[00000000211c0001] = 7f2ed1d8, %l6 = ff620df1e1ac48b1, %asi = 80
	ldsba	[%o2+0x001]%asi,%l6	! %l6 = 000000000000002e
!	Mem[0000000030001400] = d82eae7e, %l5 = ffffffffffffbf65
	ldsha	[%i0+%g0]0x89,%l5	! %l5 = ffffffffffffae7e
!	Mem[00000000100c1408] = 02ea1d46, %l7 = ff620df1e1ac48f3
	ldsha	[%i3+%o4]0x80,%l7	! %l7 = 00000000000002ea
!	Mem[0000000010041410] = 778de274, %l6 = 000000000000002e
	ldswa	[%i1+%o5]0x80,%l6	! %l6 = 00000000778de274
!	Mem[0000000010001410] = 14e0f75f, %l5 = ffffffffffffae7e
	ldswa	[%i0+%o5]0x88,%l5	! %l5 = 0000000014e0f75f
!	Mem[0000000010001410] = 5ff7e01473b8c355, %f0  = 7db5a9e8 4e413159
	ldda	[%i0+%o5]0x80,%f0 	! %f0  = 5ff7e014 73b8c355

p0_label_5:
!	Starting 10 instruction Store Burst
!	%f8  = 428f7880, %f28 = 58f18e9c, %f30 = 464c1dba
	fmuls	%f8 ,%f28,%f30		! %f30 = 5c07605d
!	%l5 = 0000000014e0f75f, Mem[0000000010081400] = 58002f11
	stba	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 58002f5f
!	%l4 = 0000000000000043, Mem[00000000100c1410] = 5926b734688b49f5, %asi = 80
	stxa	%l4,[%i3+0x010]%asi	! Mem[00000000100c1410] = 0000000000000043
!	%o0 = deadbeefdeadbeef
	set	share0_start,%o0	! set %o0[0] to VA
!	%l2 = 0000000000000046, Mem[00000000201c0001] = 30b88148, %asi = 80
	stba	%l2,[%o0+0x001]%asi	! Mem[00000000201c0000] = 30468148
!	%l5 = 0000000014e0f75f, Mem[0000000030181400] = 135f09182377d5c9
	stxa	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000014e0f75f
!	Mem[0000000010081404] = 6373ecd9, %l4 = 00000043, %l5 = 14e0f75f
	add	%i2,0x04,%g1
	casa	[%g1]0x80,%l4,%l5	! %l5 = 000000006373ecd9
!	Mem[0000000030041410] = a4fd9552, %l0 = 000000000000001a
	swapa	[%i1+%o5]0x89,%l0	! %l0 = 00000000a4fd9552
!	Mem[00000000211c0001] = 7f2ed1d8, %l7 = 00000000000002ea
	ldstuba	[%o2+0x001]%asi,%l7	! %l7 = 000000000000002e
!	%l3 = 0000000000000077, Mem[0000000010101410] = 56d98994
	stwa	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000077
!	%f6  = 2e0d5f3f 4c61a23b, %l7 = 000000000000002e
!	Mem[0000000010041428] = 0ed27fde2de77db7
	add	%i1,0x028,%g1
	stda	%f6,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010041428] = 0ed27fde3f5f0d2e

p0_label_6:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 7125d708, %l0 = 00000000a4fd9552, %asi = 80
	ldsha	[%i1+0x000]%asi,%l0	! %l0 = 0000000000007125
!	Mem[0000000010041408] = 7300000000000000, %l3 = 0000000000000077
	ldxa	[%i1+%o4]0x80,%l3	! %l3 = 7300000000000000
!	Mem[00000000100c1400] = 148dc691, %f3  = 056dc71f
	lda	[%i3+%g0]0x88,%f3 	! %f3 = 148dc691
!	Mem[0000000010101406] = 42726a99, %l4 = 0000000000000043, %asi = 80
	lduha	[%i4+0x006]%asi,%l4	! %l4 = 0000000000006a99
!	Code Fragment 3, seed = 141362
p0_fragment_1:
!	%l0 = 0000000000007125
	setx	0xaad43894953f0896,%g7,%l0 ! %l0 = aad43894953f0896
!	%l1 = 0000000000007466
	setx	0x7179e008c42d11c1,%g7,%l1 ! %l1 = 7179e008c42d11c1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = aad43894953f0896
	setx	0xa5db2422df546efc,%g7,%l0 ! %l0 = a5db2422df546efc
!	%l1 = 7179e008c42d11c1
	setx	0x38decb9eab122347,%g7,%l1 ! %l1 = 38decb9eab122347
p0_fragment_1_end:
!	Mem[0000000010101404] = 42726a99, %l7 = 000000000000002e
	ldsw	[%i4+0x004],%l7		! %l7 = 0000000042726a99
!	Mem[0000000021800080] = 3b6afe68, %l1 = 38decb9eab122347
	lduh	[%o3+0x080],%l1		! %l1 = 0000000000003b6a
!	Mem[0000000010181436] = 78d21b4d, %l4 = 0000000000006a99, %asi = 80
	ldsba	[%i6+0x036]%asi,%l4	! %l4 = 000000000000001b
!	Mem[0000000030001410] = c51b32204483f7ff, %l3 = 7300000000000000
	ldxa	[%i0+%o5]0x89,%l3	! %l3 = c51b32204483f7ff
!	Mem[0000000010181400] = ff6f8ce80409a859, %f0  = 5ff7e014 73b8c355
	ldda	[%i6+%g0]0x80,%f0 	! %f0  = ff6f8ce8 0409a859

p0_label_7:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000042726a99, %l4 = 000000000000001b, %y  = 00000000
	smul	%l7,%l4,%l4		! %l4 = 0000000702113e23, %y = 00000007
!	Mem[0000000021800140] = 5d7606f8, %l4 = 0000000702113e23
	ldstuba	[%o3+0x140]%asi,%l4	! %l4 = 000000000000005d
!	%l2 = 0000000000000046, Mem[0000000030141410] = 32fd4724
	stha	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 00464724
!	Mem[00000000100c1408] = 461dea02, %l5 = 000000006373ecd9
	ldstuba	[%i3+%o4]0x88,%l5	! %l5 = 0000000000000002
!	%f25 = 383c361f, Mem[0000000010041410] = 74e28d77
	sta	%f25,[%i1+%o5]0x88	! Mem[0000000010041410] = 383c361f
!	%l7 = 0000000042726a99, %l3 = c51b32204483f7ff, %l7 = 0000000042726a99
	xor	%l7,%l3,%l7		! %l7 = c51b322006f19d66
!	%l6 = 00000000778de274, Mem[0000000010041400] = 08d72571
	stha	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 08d7e274
!	%l6 = 00000000778de274, Mem[00000000300c1400] = 5756e3f8
	stwa	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 778de274
!	Mem[00000000100c1410] = 00000000, %l0 = a5db2422df546efc
	ldstuba	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141408] = b6853146, %l4 = 000000000000005d
	ldstuba	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000046

p0_label_8:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141438] = 70a230aa7b597bd3, %l5 = 0000000000000002
	ldx	[%i5+0x038],%l5		! %l5 = 70a230aa7b597bd3
!	Mem[0000000010181410] = 54fe431f, %l3 = c51b32204483f7ff
	lduha	[%i6+%o5]0x88,%l3	! %l3 = 000000000000431f
!	Mem[00000000100c1410] = 000000ff, %l7 = c51b322006f19d66
	ldsha	[%i3+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141410] = f44b9bff, %f30 = 5c07605d
	lda	[%i5+%o5]0x88,%f30	! %f30 = f44b9bff
!	Mem[0000000030181410] = 0eca7184, %l4 = 0000000000000046
	lduha	[%i6+%o5]0x81,%l4	! %l4 = 0000000000000eca
!	%f0  = ff6f8ce8, %f12 = 21a8dd6c, %f15 = 07b104b3
	fdivs	%f0 ,%f12,%f15		! %f15 = ff800000
!	Mem[0000000010041408] = 00000073, %l4 = 0000000000000eca
	lduha	[%i1+%o4]0x88,%l4	! %l4 = 0000000000000073
!	Mem[0000000010141410] = ff9b4bf461a993b5, %f10 = 72535dbe 4c30b817
	ldda	[%i5+%o5]0x80,%f10	! %f10 = ff9b4bf4 61a993b5
!	Mem[0000000020800000] = 7466f578, %l5 = 70a230aa7b597bd3
	ldsh	[%o1+%g0],%l5		! %l5 = 0000000000007466
!	Mem[00000000100c142c] = 40bc7177, %l6 = 00000000778de274
	ldsh	[%i3+0x02c],%l6		! %l6 = 00000000000040bc

p0_label_9:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 06ec6b35, %l2 = 0000000000000046
	swapa	[%i5+%o4]0x88,%l2	! %l2 = 0000000006ec6b35
!	%l6 = 000040bc, %l7 = 000000ff, Mem[0000000010101420] = 2639aac0 32aac7d1
	std	%l6,[%i4+0x020]		! Mem[0000000010101420] = 000040bc 000000ff
!	%l2 = 0000000006ec6b35, Mem[0000000010181438] = 79283a0a5b2203b3, %asi = 80
	stxa	%l2,[%i6+0x038]%asi	! Mem[0000000010181438] = 0000000006ec6b35
!	%f22 = 7a5572e2, Mem[0000000010181400] = e88c6fff
	sta	%f22,[%i6+%g0]0x88	! Mem[0000000010181400] = 7a5572e2
!	%l7 = 00000000000000ff, Mem[0000000030001410] = 4483f7ff
	stha	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = 448300ff
!	%f22 = 7a5572e2 566cf22b, Mem[0000000010001410] = 5ff7e014 73b8c355
	std	%f22,[%i0+%o5]		! Mem[0000000010001410] = 7a5572e2 566cf22b
!	%l6 = 000040bc, %l7 = 000000ff, Mem[00000000100c1420] = 3259ca60 0b8224f1, %asi = 80
	stda	%l6,[%i3+0x020]%asi	! Mem[00000000100c1420] = 000040bc 000000ff
!	%f14 = 08d72571, Mem[0000000010181430] = 1160106c
	st	%f14,[%i6+0x030]	! Mem[0000000010181430] = 08d72571
!	%f0  = ff6f8ce8, %f9  = 148dc691, %f18 = 07185216
	fadds	%f0 ,%f9 ,%f18		! %f18 = ff6f8ce8
!	Mem[0000000030101410] = 58830cc4, %l4 = 0000000000000073
	ldstuba	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000058

p0_label_10:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 1f363c3866fbeb35, %l6 = 00000000000040bc
	ldxa	[%i6+%o4]0x88,%l6	! %l6 = 1f363c3866fbeb35
!	Mem[0000000030041400] = 387b6eff, %f17 = 4ede9ec9
	lda	[%i1+%g0]0x89,%f17	! %f17 = 387b6eff
!	Mem[0000000010001400] = a8821c5a, %l6 = 1f363c3866fbeb35
	lduha	[%i0+%g0]0x88,%l6	! %l6 = 0000000000001c5a
!	Mem[0000000020800000] = 7466f578, %l2 = 0000000006ec6b35
	lduh	[%o1+%g0],%l2		! %l2 = 0000000000007466
!	Mem[0000000010041410] = 1f363c387881c035, %f20 = 76335e84 54fc8205
	ldda	[%i1+%o5]0x80,%f20	! %f20 = 1f363c38 7881c035
!	Mem[0000000030181408] = 164d9eff, %l5 = 0000000000007466
	ldsba	[%i6+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000300c1410] = 80788f42, %l3 = 000000000000431f
	ldswa	[%i3+%o5]0x89,%l3	! %l3 = ffffffff80788f42
!	Mem[0000000010181408] = 1f363c3866fbeb35, %l6 = 0000000000001c5a
	ldxa	[%i6+%o4]0x88,%l6	! %l6 = 1f363c3866fbeb35
!	Mem[00000000211c0001] = 7fffd1d8, %l6 = 1f363c3866fbeb35, %asi = 80
	ldsba	[%o2+0x001]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000300c1410] = 80788f42, %l4 = 0000000000000058
	lduba	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000042

p0_label_11:
!	Starting 10 instruction Store Burst
!	Code Fragment 4, seed = 969675
p0_fragment_2:
!	%l0 = 0000000000000000
	setx	0xccd1b5e387add4ce,%g7,%l0 ! %l0 = ccd1b5e387add4ce
!	%l1 = 0000000000003b6a
	setx	0xdec43ce8ec808879,%g7,%l1 ! %l1 = dec43ce8ec808879
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = ccd1b5e387add4ce
	setx	0x26008c6fb59e8834,%g7,%l0 ! %l0 = 26008c6fb59e8834
!	%l1 = dec43ce8ec808879
	setx	0xba6763c90c2356ff,%g7,%l1 ! %l1 = ba6763c90c2356ff
p0_fragment_2_end:
!	%l1 = ba6763c90c2356ff, Mem[0000000010181408] = 35ebfb66
	stha	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = 56fffb66
!	%l2 = 0000000000007466, Mem[0000000010141414] = 61a993b5
	stw	%l2,[%i5+0x014]		! Mem[0000000010141414] = 00007466
!	Mem[0000000030101408] = 562e5814, %l1 = 000000000c2356ff
	swapa	[%i4+%o4]0x89,%l1	! %l1 = 00000000562e5814
!	%f0  = ff6f8ce8, Mem[000000001010142c] = 499d7357
	sta	%f0 ,[%i4+0x02c]%asi	! Mem[000000001010142c] = ff6f8ce8
!	%f22 = 7a5572e2 566cf22b, %l0 = 26008c6fb59e8834
!	Mem[0000000030141428] = 584e750e2e10a027
	add	%i5,0x028,%g1
	stda	%f22,[%g1+%l0]ASI_PST16_S ! Mem[0000000030141428] = 584e72e22e10a027
!	%f12 = 21a8dd6c, Mem[0000000030041400] = 387b6eff
	sta	%f12,[%i1+%g0]0x89	! Mem[0000000030041400] = 21a8dd6c
!	%l3 = ffffffff80788f42, %l1 = 00000000562e5814, %l5 = ffffffffffffffff
	sub	%l3,%l1,%l5		! %l5 = ffffffff2a4a372e
!	Mem[0000000010001438] = 1ac291ca, %l3 = 0000000080788f42, %asi = 80
	swapa	[%i0+0x038]%asi,%l3	! %l3 = 000000001ac291ca
!	Mem[0000000010141424] = 35579ab1, %l1 = 00000000562e5814, %asi = 80
	swapa	[%i5+0x024]%asi,%l1	! %l1 = 0000000035579ab1

p0_label_12:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 46000000, %l3 = 000000001ac291ca
	ldsha	[%i5+%o4]0x80,%l3	! %l3 = 0000000000004600
!	Mem[0000000010141414] = 00007466, %l5 = ffffffff2a4a372e
	ldub	[%i5+0x014],%l5		! %l5 = 0000000000000000
!	Mem[000000001014140c] = 015d803f, %l5 = 0000000000000000, %asi = 80
	lduwa	[%i5+0x00c]%asi,%l5	! %l5 = 00000000015d803f
!	Mem[0000000030041400] = 6cdda821130bab69, %l1 = 0000000035579ab1
	ldxa	[%i1+%g0]0x81,%l1	! %l1 = 6cdda821130bab69
!	Mem[00000000211c0000] = 7fffd1d8, %l5 = 00000000015d803f, %asi = 80
	lduba	[%o2+0x000]%asi,%l5	! %l5 = 000000000000007f
!	Mem[0000000030181408] = ff9e4d16, %f8  = 428f7880
	lda	[%i6+%o4]0x81,%f8 	! %f8 = ff9e4d16
!	Mem[0000000010081410] = c2aad4d4, %l5 = 000000000000007f
	lduba	[%i2+%o5]0x80,%l5	! %l5 = 00000000000000c2
!	Mem[0000000030081408] = 32ffcf966ca65b8f, %f22 = 7a5572e2 566cf22b
	ldda	[%i2+%o4]0x81,%f22	! %f22 = 32ffcf96 6ca65b8f
!	Mem[0000000010081410] = c2aad4d4, %l7 = 00000000000000ff
	lduba	[%i2+%o5]0x80,%l7	! %l7 = 00000000000000c2
!	Mem[0000000010101400] = 996a7242 2874b931, %l6 = ffffffff, %l7 = 000000c2
	ldda	[%i4+%g0]0x88,%l6	! %l6 = 000000002874b931 00000000996a7242

p0_label_13:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = 08d7e274, %l0 = 26008c6fb59e8834
	ldstuba	[%i1+%g0]0x88,%l0	! %l0 = 0000000000000074
!	Mem[0000000030101400] = 112f0058 43446809 ff56230c 4533074f
!	%f0  = ff6f8ce8 0409a859 860ec60d 148dc691
!	%f4  = 1400ab54 21465995 2e0d5f3f 4c61a23b
!	%f8  = ff9e4d16 148dc691 ff9b4bf4 61a993b5
!	%f12 = 21a8dd6c 6a93944d 08d72571 ff800000
	stda	%f0 ,[%i4+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030101400
!	%f8  = ff9e4d16 148dc691, Mem[0000000010101420] = 000040bc 000000ff
	std	%f8 ,[%i4+0x020]	! Mem[0000000010101420] = ff9e4d16 148dc691
!	%f12 = 21a8dd6c, %f4  = 1400ab54, %f16 = 68dd6618
	fdivs	%f12,%f4 ,%f16		! %f16 = 4d27fc92
!	%f16 = 4d27fc92, Mem[0000000010141400] = 56e28888
	sta	%f16,[%i5+0x000]%asi	! Mem[0000000010141400] = 4d27fc92
!	%l7 = 00000000996a7242, Mem[0000000010081410] = d4d4aac2
	stwa	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = 996a7242
!	Mem[0000000030041408] = 4150c836, %l5 = 00000000000000c2
	swapa	[%i1+%o4]0x81,%l5	! %l5 = 000000004150c836
!	%f12 = 21a8dd6c 6a93944d, %l1 = 6cdda821130bab69
!	Mem[0000000030041410] = 1a0000007136b0a5
	add	%i1,0x010,%g1
	stda	%f12,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030041410] = 4d94936a7136b0a5
!	%l1 = 6cdda821130bab69, Mem[00000000201c0001] = 30468148
	stb	%l1,[%o0+0x001]		! Mem[00000000201c0000] = 30698148
!	%l1 = 6cdda821130bab69, Mem[0000000030081410] = 4c2768040fcc7585
	stxa	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = 6cdda821130bab69

p0_label_14:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010101410] = 00000077 2abbd6d5, %l0 = 00000074, %l1 = 130bab69
	ldda	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000077 000000002abbd6d5
!	Mem[0000000030141400] = 65bf0cb8, %l5 = 000000004150c836
	lduha	[%i5+%g0]0x81,%l5	! %l5 = 00000000000065bf
!	Mem[0000000010181408] = 56fffb66, %f15 = ff800000
	lda	[%i6+%o4]0x80,%f15	! %f15 = 56fffb66
!	Mem[00000000201c0000] = 30698148, %l5 = 00000000000065bf
	ldsb	[%o0+%g0],%l5		! %l5 = 0000000000000030
!	Mem[0000000010101408] = 43734ca6, %l2 = 0000000000007466
	lduha	[%i4+%o4]0x80,%l2	! %l2 = 0000000000004373
!	Mem[0000000010181410] = 54fe431f, %l7 = 00000000996a7242
	swapa	[%i6+%o5]0x88,%l7	! %l7 = 0000000054fe431f
!	Mem[0000000030181400] = 00000000, %l2 = 0000000000004373
	lduha	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1408] = f646faff, %l7 = 0000000054fe431f
	ldsha	[%i3+%o4]0x89,%l7	! %l7 = fffffffffffffaff
!	Mem[00000000100c1408] = ffea1d46 2cf3247f, %l2 = 00000000, %l3 = 00004600
	ldda	[%i3+%o4]0x80,%l2	! %l2 = 00000000ffea1d46 000000002cf3247f
!	Mem[0000000010041408] = 00000073, %l3 = 000000002cf3247f
	lduha	[%i1+%o4]0x88,%l3	! %l3 = 0000000000000073

p0_label_15:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000030, Mem[0000000010001408] = 0afb2f26
	stba	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 30fb2f26
!	%f12 = 21a8dd6c 6a93944d, Mem[0000000010001410] = e272557a 2bf26c56
	stda	%f12,[%i0+%o5]0x88	! Mem[0000000010001410] = 21a8dd6c 6a93944d
!	%l2 = 00000000ffea1d46, Mem[0000000030041400] = 21a8dd6c
	stba	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 21a8dd46
!	Mem[00000000100c1410] = ff000000, %l5 = 0000000000000030
	ldstuba	[%i3+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081430] = 1bdcf6ec, %l7 = fffffffffffffaff
	ldstuba	[%i2+0x030]%asi,%l7	! %l7 = 000000000000001b
!	%l4 = 0000000000000042, Mem[0000000030041410] = 6a93944d
	stha	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 6a930042
!	%l6 = 2874b931, %l7 = 0000001b, Mem[0000000030001410] = 448300ff c51b3220
	stda	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 2874b931 0000001b
!	%l5 = 00000000000000ff, Mem[0000000010001400] = 5a1c82a8
	stha	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 00ff82a8
!	Mem[0000000010001410] = 4d94936a, %l3 = 0000000000000073
	swapa	[%i0+%o5]0x80,%l3	! %l3 = 000000004d94936a
!	%l2 = 00000000ffea1d46, Mem[0000000030081408] = 32ffcf96
	stba	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 46ffcf96

p0_label_16:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 98b7de15, %l6 = 000000002874b931
	lduwa	[%i2+%g0]0x89,%l6	! %l6 = 0000000098b7de15
!	%l3 = 000000004d94936a, imm = fffffffffffffdeb, %l3 = 000000004d94936a
	addc	%l3,-0x215,%l3		! %l3 = 000000004d949155
!	Mem[0000000030181400] = 00000000 14e0f75f, %l2 = ffea1d46, %l3 = 4d949155
	ldda	[%i6+%g0]0x81,%l2	! %l2 = 0000000000000000 0000000014e0f75f
!	Mem[0000000030141408] = b68531ff, %l0 = 0000000000000077
	ldswa	[%i5+%o4]0x89,%l0	! %l0 = ffffffffb68531ff
!	Mem[00000000300c1410] = 428f7880, %l5 = 00000000000000ff
	lduha	[%i3+%o5]0x81,%l5	! %l5 = 000000000000428f
!	Mem[0000000010041400] = ffe2d708, %l5 = 000000000000428f
	lduha	[%i1+%g0]0x80,%l5	! %l5 = 000000000000ffe2
!	Mem[0000000030101410] = 21465995, %l3 = 0000000014e0f75f
	lduha	[%i4+%o5]0x89,%l3	! %l3 = 0000000000005995
!	Mem[0000000010001400] = a882ff00, %l6 = 0000000098b7de15
	ldsba	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081400] = 15deb798, %l2 = 0000000000000000
	ldsha	[%i2+%g0]0x81,%l2	! %l2 = 00000000000015de
!	Mem[0000000010101400] = 31b97428 42726a99 43734ca6 1b827a5f
!	Mem[0000000010101410] = 00000077 2abbd6d5 b1eae9f5 8e2dd5e1
!	Mem[0000000010101420] = ff9e4d16 148dc691 228a91fe ff6f8ce8
!	Mem[0000000010101430] = 3bd4a3ac 311f598d 5e04974a 25d1a3f3
	ldda	[%i4+%g0]ASI_BLK_AIUP,%f16	! Block Load from 0000000010101400

p0_label_17:
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000ffe2, Mem[0000000010041408] = 0000000000000073
	stxa	%l5,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000000000ffe2
!	Mem[0000000010081400] = 58002f5f, %l0 = ffffffffb68531ff
	ldstuba	[%i2+%g0]0x88,%l0	! %l0 = 000000000000005f
!	%f10 = ff9b4bf4 61a993b5, Mem[0000000010001400] = 00ff82a8 374e2f19, %asi = 80
	stda	%f10,[%i0+0x000]%asi	! Mem[0000000010001400] = ff9b4bf4 61a993b5
!	%l2 = 00000000000015de, Mem[00000000100c1410] = ff000000
	stwa	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000015de
!	Mem[00000000211c0001] = 7fffd1d8, %l7 = 000000000000001b
	ldstub	[%o2+0x001],%l7		! %l7 = 00000000000000ff
!	%l4 = 0000000000000042, Mem[0000000030181410] = 8471ca0e
	stba	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 8471ca42
!	Mem[000000001004141c] = cf5e3aa8, %l7 = 000000ff, %l0 = 0000005f
	add	%i1,0x1c,%g1
	casa	[%g1]0x80,%l7,%l0	! %l0 = 00000000cf5e3aa8
!	Code Fragment 3, seed = 125611
p0_fragment_3:
!	%l0 = 00000000cf5e3aa8
	setx	0x1c8e6c94e3c9bdce,%g7,%l0 ! %l0 = 1c8e6c94e3c9bdce
!	%l1 = 000000002abbd6d5
	setx	0x692e1522aacc2179,%g7,%l1 ! %l1 = 692e1522aacc2179
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1c8e6c94e3c9bdce
	setx	0x4b52c113bccad134,%g7,%l0 ! %l0 = 4b52c113bccad134
!	%l1 = 692e1522aacc2179
	setx	0xf2bb4d1f18114fff,%g7,%l1 ! %l1 = f2bb4d1f18114fff
p0_fragment_3_end:
!	Mem[0000000010141410] = f44b9bff, %l3 = 0000000000005995
	ldstuba	[%i5+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000010001400] = f44b9bff
	stha	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = f44b0000

p0_label_18:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 21a8dd6c73000000, %l7 = 00000000000000ff
	ldxa	[%i0+%o5]0x88,%l7	! %l7 = 21a8dd6c73000000
!	Mem[00000000100c1408] = 461deaff, %l1 = f2bb4d1f18114fff
	lduha	[%i3+%o4]0x88,%l1	! %l1 = 000000000000eaff
!	Mem[0000000010141400] = 4d27fc92, %l0 = 4b52c113bccad134
	ldsba	[%i5+%g0]0x80,%l0	! %l0 = 000000000000004d
!	Mem[0000000030001408] = d630d511, %l4 = 0000000000000042
	ldsba	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000011
!	Mem[0000000010181400] = e272557a 0409a859, %l0 = 0000004d, %l1 = 0000eaff
	ldda	[%i6+%g0]0x80,%l0	! %l0 = 00000000e272557a 000000000409a859
!	Mem[0000000010041430] = 5e5c888c, %l1 = 000000000409a859, %asi = 80
	lduba	[%i1+0x030]%asi,%l1	! %l1 = 000000000000005e
!	Mem[0000000010141410] = 66740000 f44b9bff, %l0 = e272557a, %l1 = 0000005e
	ldda	[%i5+%o5]0x88,%l0	! %l0 = 00000000f44b9bff 0000000066740000
!	%f25 = 148dc691, %f15 = 56fffb66, %f13 = 6a93944d
	fdivs	%f25,%f15,%f13		! tt=0x22, %l0 = 00000000f44b9c21
!	Mem[00000000300c1410] = 80788f42, %l2 = 00000000000015de
	ldsha	[%i3+%o5]0x89,%l2	! %l2 = ffffffffffff8f42
!	Mem[0000000030141408] = 2fe59863b68531ff, %f12 = 21a8dd6c 6a93944d
	ldda	[%i5+%o4]0x89,%f12	! %f12 = 2fe59863 b68531ff

p0_label_19:
!	Starting 10 instruction Store Burst
!	%l7 = 21a8dd6c73000000, Mem[0000000010081416] = 4d9fed15, %asi = 80
	stha	%l7,[%i2+0x016]%asi	! Mem[0000000010081414] = 4d9f0000
!	%f30 = 5e04974a, Mem[0000000010041414] = 7881c035
	st	%f30,[%i1+0x014]	! Mem[0000000010041414] = 5e04974a
	membar	#Sync			! Added by membar checker (2)
!	%f24 = ff9e4d16 148dc691, Mem[0000000010101410] = 00000077 2abbd6d5
	stda	%f24,[%i4+%o5]0x80	! Mem[0000000010101410] = ff9e4d16 148dc691
!	Mem[0000000010081400] = ff2f0058, %l0 = 00000000f44b9c21
	ldstuba	[%i2+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000030101408] = 91c68d14
	stba	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 00c68d14
!	Mem[0000000030141400] = 65bf0cb8 325106e9 ff3185b6 6398e52f
!	%f0  = ff6f8ce8 0409a859 860ec60d 148dc691
!	%f4  = 1400ab54 21465995 2e0d5f3f 4c61a23b
!	%f8  = ff9e4d16 148dc691 ff9b4bf4 61a993b5
!	%f12 = 2fe59863 b68531ff 08d72571 56fffb66
	stda	%f0 ,[%i5+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030141400
!	%l2 = ffff8f42, %l3 = 000000ff, Mem[0000000010041408] = e2ff0000 00000000
	stda	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = ffff8f42 000000ff
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000030141408] = 148dc691, %l5 = 000000000000ffe2
	swapa	[%i5+%o4]0x89,%l5	! %l5 = 00000000148dc691
!	Mem[0000000010041408] = 428fffff, %l3 = 00000000000000ff
	swapa	[%i1+%o4]0x88,%l3	! %l3 = 00000000428fffff
!	%l0 = 00000000000000ff, Mem[0000000010101410] = 164d9eff
	stba	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 164d9eff

p0_label_20:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 30698148, %l1 = 0000000066740000, %asi = 80
	ldsha	[%o0+0x000]%asi,%l1	! %l1 = 0000000000003069
!	Mem[0000000030001400] = 89ccb718 d82eae7e, %l0 = 000000ff, %l1 = 00003069
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 00000000d82eae7e 0000000089ccb718
!	Mem[0000000020800000] = 7466f578, %l4 = 0000000000000011
	ldsb	[%o1+%g0],%l4		! %l4 = 0000000000000074
!	Mem[0000000030141408] = 0000ffe2, %l1 = 0000000089ccb718
	ldswa	[%i5+%o4]0x89,%l1	! %l1 = 000000000000ffe2
!	Mem[0000000020800040] = 1a1565a8, %l6 = 0000000000000000, %asi = 80
	ldsha	[%o1+0x040]%asi,%l6	! %l6 = 0000000000001a15
!	%f9  = 148dc691, %f22 = b1eae9f5, %f1  = 0409a859
	fdivs	%f9 ,%f22,%f1 		! %f1  = a21a8067
!	Mem[0000000010181418] = 421d1d32 536f413b, %l4 = 00000074, %l5 = 148dc691
	ldd	[%i6+0x018],%l4		! %l4 = 00000000421d1d32 00000000536f413b
!	%l3 = 00000000428fffff, imm = 00000000000009fa, %l2 = ffffffffffff8f42
	sub	%l3,0x9fa,%l2		! %l2 = 00000000428ff605
!	Mem[0000000030081410] = 21a8dd6c, %l1 = 000000000000ffe2
	lduha	[%i2+%o5]0x89,%l1	! %l1 = 000000000000dd6c
!	Mem[000000001014143c] = 7b597bd3, %l6 = 0000000000001a15, %asi = 80
	lduwa	[%i5+0x03c]%asi,%l6	! %l6 = 000000007b597bd3

p0_label_21:
!	Starting 10 instruction Store Burst
!	%f14 = 08d72571, Mem[0000000030041400] = 46dda821
	sta	%f14,[%i1+%g0]0x81	! Mem[0000000030041400] = 08d72571
!	%l5 = 00000000536f413b, Mem[0000000010101400] = 996a72422874b931
	stxa	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000536f413b
!	Mem[0000000030081400] = 98b7de15, %l1 = 000000000000dd6c
	swapa	[%i2+%g0]0x89,%l1	! %l1 = 0000000098b7de15
!	Mem[000000001000143c] = 5dd92473, %l4 = 00000000421d1d32, %asi = 80
	swapa	[%i0+0x03c]%asi,%l4	! %l4 = 000000005dd92473
!	Mem[00000000300c1400] = 74e28d77, %l3 = 00000000428fffff
	ldstuba	[%i3+%g0]0x89,%l3	! %l3 = 0000000000000077
!	Mem[0000000030081408] = 96cfff46, %l3 = 0000000000000077
	ldstuba	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000046
!	%l5 = 00000000536f413b, Mem[0000000030101410] = 1400ab5421465995
	stxa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000536f413b
!	%l4 = 000000005dd92473, Mem[0000000010041400] = 08d7e2ff
	stha	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 08d72473
!	%l4 = 000000005dd92473, Mem[0000000010181408] = 66fbff56
	stba	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 66fbff73
!	%l0 = d82eae7e, %l1 = 98b7de15, Mem[00000000100c1400] = 148dc691 b9131c02
	stda	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = d82eae7e 98b7de15

p0_label_22:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 29f9596874e28dff, %l6 = 000000007b597bd3
	ldxa	[%i3+%g0]0x89,%l6	! %l6 = 29f9596874e28dff
!	Mem[0000000010001400] = f44b0000, %l4 = 000000005dd92473
	ldsha	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = 73fffb66, %l2 = 00000000428ff605
	ldsba	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000073
!	Mem[0000000020800000] = 7466f578, %l2 = 0000000000000073, %asi = 80
	ldsba	[%o1+0x000]%asi,%l2	! %l2 = 0000000000000074
!	Mem[0000000010101400] = 3b416f53, %l6 = 29f9596874e28dff
	lduwa	[%i4+%g0]0x80,%l6	! %l6 = 000000003b416f53
!	Mem[00000000201c0001] = 30698148, %l2 = 0000000000000074, %asi = 80
	ldsba	[%o0+0x001]%asi,%l2	! %l2 = 0000000000000069
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000030141400] = 59a80904 e88c6fff e2ff0000 0dc60e86
!	Mem[0000000030141410] = 95594621 54ab0014 3ba2614c 3f5f0d2e
!	Mem[0000000030141420] = 91c68d14 164d9eff b593a961 f44b9bff
!	Mem[0000000030141430] = ff3185b6 6398e52f 66fbff56 7125d708
	ldda	[%i5+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030141400
!	Mem[0000000030041408] = c2000000, %l2 = 0000000000000069
	ldsba	[%i1+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1411] = 000015de, %l3 = 0000000000000046
	ldsb	[%i3+0x011],%l3		! %l3 = 0000000000000000
!	Mem[00000000201c0000] = 30698148, %l3 = 0000000000000000, %asi = 80
	lduba	[%o0+0x000]%asi,%l3	! %l3 = 0000000000000030

p0_label_23:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 42726a99, %l5 = 00000000536f413b
	ldstuba	[%i6+%o5]0x80,%l5	! %l5 = 0000000000000042
!	%f18 = e2ff0000 0dc60e86, Mem[0000000030101410] = 3b416f53 00000000
	stda	%f18,[%i4+%o5]0x81	! Mem[0000000030101410] = e2ff0000 0dc60e86
!	%f27 = f44b9bff, Mem[0000000030081410] = 6cdda821
	sta	%f27,[%i2+%o5]0x81	! Mem[0000000030081410] = f44b9bff
!	%l5 = 0000000000000042, Mem[00000000100c1410] = de150000
	stha	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = de150042
!	%l5 = 0000000000000042, Mem[0000000010001401] = 00004bf4, %asi = 80
	stba	%l5,[%i0+0x001]%asi	! Mem[0000000010001400] = 00424bf4
!	Mem[0000000010181400] = e272557a, %l7 = 21a8dd6c73000000
	ldstuba	[%i6+%g0]0x80,%l7	! %l7 = 00000000000000e2
!	%l5 = 0000000000000042, Mem[00000000100c1400] = d82eae7e
	stba	%l5,[%i3+%g0]0x88	! Mem[00000000100c1400] = d82eae42
!	%l7 = 00000000000000e2, Mem[0000000010081430] = ffdcf6ec
	stw	%l7,[%i2+0x030]		! Mem[0000000010081430] = 000000e2
!	%l2 = 00000000, %l3 = 00000030, Mem[0000000010101408] = a64c7343 5f7a821b
	stda	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000 00000030
!	Mem[0000000030101408] = 00c68d14, %l0 = 00000000d82eae7e
	ldstuba	[%i4+%o4]0x81,%l0	! %l0 = 0000000000000000

p0_label_24:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 92fc274d, %l6 = 000000003b416f53
	lduwa	[%i5+%g0]0x88,%l6	! %l6 = 0000000092fc274d
!	Mem[00000000300c1408] = fffa46f6, %l0 = 0000000000000000
	lduwa	[%i3+%o4]0x81,%l0	! %l0 = 00000000fffa46f6
!	Mem[0000000010181410] = 996a72ff, %l4 = 0000000000000000
	lduha	[%i6+%o5]0x88,%l4	! %l4 = 00000000000072ff
!	Mem[0000000030101400] = 59a80904e88c6fff, %l0 = 00000000fffa46f6
	ldxa	[%i4+%g0]0x81,%l0	! %l0 = 59a80904e88c6fff
!	Mem[0000000010181420] = 37d73b80, %l4 = 00000000000072ff
	lduh	[%i6+0x020],%l4		! %l4 = 00000000000037d7
!	Mem[00000000300c1408] = f646faff, %l6 = 0000000092fc274d
	lduwa	[%i3+%o4]0x89,%l6	! %l6 = 00000000f646faff
!	Mem[0000000030141410] = 21465995, %l7 = 00000000000000e2
	ldsba	[%i5+%o5]0x89,%l7	! %l7 = ffffffffffffff95
!	Mem[0000000030181410] = 05692f4b 8471ca42, %l6 = f646faff, %l7 = ffffff95
	ldda	[%i6+%o5]0x89,%l6	! %l6 = 000000008471ca42 0000000005692f4b
!	Mem[0000000010081408] = e65db8ff, %l1 = 0000000098b7de15
	ldswa	[%i2+%o4]0x88,%l1	! %l1 = ffffffffe65db8ff
!	Mem[0000000010081408] = ffb85de667f77e9f, %l7 = 0000000005692f4b
	ldxa	[%i2+%o4]0x80,%l7	! %l7 = ffb85de667f77e9f

p0_label_25:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081420] = 5ea3da00, %l2 = 0000000000000000
	ldstuba	[%i2+0x020]%asi,%l2	! %l2 = 000000000000005e
!	Mem[0000000010181408] = 66fbff73, %l4 = 00000000000037d7
	swapa	[%i6+%o4]0x88,%l4	! %l4 = 0000000066fbff73
!	Mem[0000000010081400] = ff2f0058, %l4 = 0000000066fbff73
	swapa	[%i2+%g0]0x80,%l4	! %l4 = 00000000ff2f0058
!	%f3  = 148dc691, Mem[0000000010101408] = 00000000
	sta	%f3 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 148dc691
!	Mem[0000000010101401] = 3b416f53, %l7 = ffb85de667f77e9f
	ldstub	[%i4+0x001],%l7		! %l7 = 0000000000000041
!	%f19 = 0dc60e86, Mem[0000000010041410] = 383c361f
	sta	%f19,[%i1+%o5]0x88	! Mem[0000000010041410] = 0dc60e86
!	%l4 = 00000000ff2f0058, Mem[0000000030001400] = 7eae2ed8
	stha	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 00582ed8
!	%f12 = 2fe59863, Mem[0000000010001434] = 3f2fa6b6
	st	%f12,[%i0+0x034]	! Mem[0000000010001434] = 2fe59863
!	%l3 = 0000000000000030, Mem[0000000010041408] = ff000000
	stba	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = 30000000
	membar	#Sync			! Added by membar checker (5)
!	%f18 = e2ff0000 0dc60e86, Mem[0000000030141408] = 0000ffe2 860ec60d
	stda	%f18,[%i5+%o4]0x89	! Mem[0000000030141408] = e2ff0000 0dc60e86

p0_label_26:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = b593a961 f44b4200, %l6 = 8471ca42, %l7 = 00000041
	ldda	[%i0+%g0]0x88,%l6	! %l6 = 00000000f44b4200 00000000b593a961
!	Mem[00000000100c143a] = 59b76dea, %l3 = 0000000000000030, %asi = 80
	ldsha	[%i3+0x03a]%asi,%l3	! %l3 = 0000000000006dea
!	Mem[00000000300c1400] = ff8de274, %l0 = 59a80904e88c6fff
	lduwa	[%i3+%g0]0x81,%l0	! %l0 = 00000000ff8de274
!	%l4 = 00000000ff2f0058, imm = ffffffffffffff2c, %l2 = 000000000000005e
	subc	%l4,-0x0d4,%l2		! %l2 = 00000000ff2f012c
!	Mem[0000000010181410] = ff726a99, %l1 = ffffffffe65db8ff
	lduwa	[%i6+%o5]0x80,%l1	! %l1 = 00000000ff726a99
!	Mem[0000000010101400] = 3bff6f53 00000000 91c68d14 30000000
!	Mem[0000000010101410] = ff9e4d16 148dc691 b1eae9f5 8e2dd5e1
!	Mem[0000000010101420] = ff9e4d16 148dc691 228a91fe ff6f8ce8
!	Mem[0000000010101430] = 3bd4a3ac 311f598d 5e04974a 25d1a3f3
	ldda	[%i4+%g0]ASI_BLK_AIUPL,%f0 	! Block Load from 0000000010101400
!	Mem[0000000030181410] = 8471ca42, %l7 = 00000000b593a961
	ldswa	[%i6+%o5]0x89,%l7	! %l7 = ffffffff8471ca42
!	%l1 = 00000000ff726a99, %l3 = 0000000000006dea, %l5 = 0000000000000042
	xnor	%l1,%l3,%l5		! %l5 = ffffffff008df88c
!	Mem[0000000030141410] = 21465995, %f23 = 3f5f0d2e
	lda	[%i5+%o5]0x89,%f23	! %f23 = 21465995
!	Mem[0000000010081410] = 42726a99 4d9f0000, %l0 = ff8de274, %l1 = ff726a99
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 0000000042726a99 000000004d9f0000

p0_label_27:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 428f7880, %l5 = ffffffff008df88c
	ldstuba	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000042
!	%l0 = 42726a99, %l1 = 4d9f0000, Mem[0000000010041400] = 7324d708 2681f5f9
	stda	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 42726a99 4d9f0000
	membar	#Sync			! Added by membar checker (6)
!	%l1 = 000000004d9f0000, Mem[0000000010101410] = ff9e4d16
	stha	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 00004d16
!	%l1 = 000000004d9f0000, Mem[0000000030101410] = 0000ffe2
	stha	%l1,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	%l4 = 00000000ff2f0058, Mem[0000000030181400] = 0000000014e0f75f
	stxa	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000ff2f0058
!	%l0 = 0000000042726a99, Mem[0000000030141400] = 59a80904e88c6fff
	stxa	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000000042726a99
!	%f16 = 59a80904 e88c6fff, Mem[0000000010181408] = d7370000 383c361f
	stda	%f16,[%i6+%o4]0x80	! Mem[0000000010181408] = 59a80904 e88c6fff
!	%l1 = 000000004d9f0000, immd = fffff4fb, %y  = 00000007
	udiv	%l1,-0xb05,%l4		! %l4 = 0000000000000007
	mov	%l0,%y			! %y = 42726a99
!	%f30 = 66fbff56 7125d708, %l0 = 0000000042726a99
!	Mem[0000000030101408] = ffc68d140dc60e86
	add	%i4,0x008,%g1
	stda	%f30,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030101408] = 08d725710dc60e86
!	Mem[0000000030141408] = 0dc60e86, %l7 = 000000008471ca42
	swapa	[%i5+%o4]0x89,%l7	! %l7 = 000000000dc60e86

p0_label_28:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 420015de, %l2 = 00000000ff2f012c
	lduba	[%i3+%o5]0x80,%l2	! %l2 = 0000000000000042
!	Mem[0000000010081408] = ffb85de6, %f2  = 00000030
	lda	[%i2+%o4]0x80,%f2 	! %f2 = ffb85de6
!	Mem[0000000030041410] = a5b036716a930042, %l2 = 0000000000000042
	ldxa	[%i1+%o5]0x89,%l2	! %l2 = a5b036716a930042
!	Mem[0000000030141408] = 42ca7184, %l1 = 000000004d9f0000
	ldswa	[%i5+%o4]0x81,%l1	! %l1 = 0000000042ca7184
!	Mem[00000000300c1408] = fffa46f63974d96f, %l1 = 0000000042ca7184
	ldxa	[%i3+%o4]0x81,%l1	! %l1 = fffa46f63974d96f
!	Mem[0000000030001400] = 00582ed8 18b7cc89, %l6 = f44b4200, %l7 = 0dc60e86
	ldda	[%i0+%g0]0x81,%l6	! %l6 = 0000000000582ed8 0000000018b7cc89
!	Mem[0000000030101408] = 7125d708, %l7 = 0000000018b7cc89
	lduwa	[%i4+%o4]0x89,%l7	! %l7 = 000000007125d708
!	Mem[0000000010041408] = 30000000 000000ff, %l2 = 6a930042, %l3 = 00006dea
	ldda	[%i1+%o4]0x80,%l2	! %l2 = 0000000030000000 00000000000000ff
!	Mem[0000000010081400] = 66fbff73 6373ecd9, %l6 = 00582ed8, %l7 = 7125d708, %asi = 80
	ldda	[%i2+0x000]%asi,%l6	! %l6 = 0000000066fbff73 000000006373ecd9
!	Mem[0000000030001408] = d630d511, %l5 = 0000000000000042
	ldswa	[%i0+%o4]0x89,%l5	! %l5 = ffffffffd630d511

p0_label_29:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000007, Mem[0000000010181410] = ff726a99
	stba	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 07726a99
!	%l2 = 0000000030000000, %l1 = fffa46f63974d96f, %l0 = 0000000042726a99
	xnor	%l2,%l1,%l0		! %l0 = 0005b909f68b2690
!	%l1 = fffa46f63974d96f, Mem[0000000010181410] = 996a7207
	stwa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = 3974d96f
!	Mem[0000000010141400] = 92fc274d, %l2 = 0000000030000000
	ldstuba	[%i5+%g0]0x88,%l2	! %l2 = 000000000000004d
!	%l5 = ffffffffd630d511, Mem[0000000030141400] = 00000000
	stha	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = d5110000
!	%l5 = ffffffffd630d511, %l0 = 0005b909f68b2690, %l5 = ffffffffd630d511
	and	%l5,%l0,%l5		! %l5 = 0005b909d6000410
!	%f2  = ffb85de6 148dc691, Mem[0000000010181418] = 421d1d32 536f413b, %asi = 80
	stda	%f2 ,[%i6+0x018]%asi	! Mem[0000000010181418] = ffb85de6 148dc691
!	Mem[0000000010081410] = 996a7242, %l7 = 000000006373ecd9
	swapa	[%i2+%o5]0x88,%l7	! %l7 = 00000000996a7242
!	Mem[0000000030101408] = 7125d708, %l7 = 00000000996a7242
	swapa	[%i4+%o4]0x89,%l7	! %l7 = 000000007125d708
!	%f8  = 91c68d14 164d9eff, Mem[00000000100c1400] = 42ae2ed8 15deb798
	stda	%f8 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = 91c68d14 164d9eff

p0_label_30:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001438] = 80788f42, %f22 = 3ba2614c
	ld	[%i0+0x038],%f22	! %f22 = 80788f42
!	Mem[0000000010181400] = ff72557a, %l2 = 000000000000004d
	lduba	[%i6+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181400] = ff72557a 0409a859, %l0 = f68b2690, %l1 = 3974d96f
	ldda	[%i6+%g0]0x80,%l0	! %l0 = 00000000ff72557a 000000000409a859
!	Mem[0000000030081410] = f44b9bff 130bab69, %l0 = ff72557a, %l1 = 0409a859
	ldda	[%i2+%o5]0x81,%l0	! %l0 = 00000000f44b9bff 00000000130bab69
!	Mem[00000000300c1400] = 29f9596874e28dff, %f28 = ff3185b6 6398e52f
	ldda	[%i3+%g0]0x89,%f28	! %f28 = 29f95968 74e28dff
!	Code Fragment 4, seed = 818905
p0_fragment_4:
!	%l0 = 00000000f44b9bff
	setx	0xde17bc068566aa5e,%g7,%l0 ! %l0 = de17bc068566aa5e
!	%l1 = 00000000130bab69
	setx	0x2a4063b88dbca909,%g7,%l1 ! %l1 = 2a4063b88dbca909
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = de17bc068566aa5e
	setx	0x68e7ebb35d1803c4,%g7,%l0 ! %l0 = 68e7ebb35d1803c4
!	%l1 = 2a4063b88dbca909
	setx	0x2394a66cb4b73d8f,%g7,%l1 ! %l1 = 2394a66cb4b73d8f
p0_fragment_4_end:
!	Mem[0000000021800000] = 52de3a08, %l2 = 00000000000000ff, %asi = 80
	lduha	[%o3+0x000]%asi,%l2	! %l2 = 00000000000052de
!	Mem[0000000030181408] = ff9e4d16, %l2 = 00000000000052de
	lduwa	[%i6+%o4]0x81,%l2	! %l2 = 00000000ff9e4d16
!	Mem[0000000030101400] = ff6f8ce80409a859, %f14 = f3a3d125 4a97045e
	ldda	[%i4+%g0]0x89,%f14	! %f14 = ff6f8ce8 0409a859
!	%l3 = 00000000000000ff, Mem[000000001010142c] = ff6f8ce8
	sth	%l3,[%i4+0x02c]		! Mem[000000001010142c] = 00ff8ce8

p0_label_31:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = ff9b4bf4, %l1 = 2394a66cb4b73d8f
	ldstuba	[%i5+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001400] = 00582ed8 18b7cc89 11d530d6 7cf86fcf
!	%f16 = 59a80904 e88c6fff e2ff0000 0dc60e86
!	%f20 = 95594621 54ab0014 80788f42 21465995
!	%f24 = 91c68d14 164d9eff b593a961 f44b9bff
!	%f28 = 29f95968 74e28dff 66fbff56 7125d708
	stda	%f16,[%i0+%g0]ASI_BLK_AIUS	! Block Store to 0000000030001400
!	%f2  = ffb85de6 148dc691, Mem[0000000030141400] = d5110000 42726a99
	stda	%f2 ,[%i5+%g0]0x81	! Mem[0000000030141400] = ffb85de6 148dc691
!	%l1 = 00000000000000ff, Mem[0000000030041408] = 000000c2
	stha	%l1,[%i1+%o4]0x81	! Mem[0000000030041408] = 00ff00c2
!	Mem[0000000010141408] = 46000000, %l2 = 00000000ff9e4d16
	swapa	[%i5+%o4]0x80,%l2	! %l2 = 0000000046000000
!	%l0 = 5d1803c4, %l1 = 000000ff, Mem[0000000010101400] = 3bff6f53 00000000
	stda	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 5d1803c4 000000ff
!	Mem[0000000020800040] = 1a1565a8, %l0 = 68e7ebb35d1803c4
	ldstub	[%o1+0x040],%l0		! %l0 = 000000000000001a
!	%l4 = 00000007, %l5 = d6000410, Mem[0000000010001410] = 73000000 21a8dd6c
	stda	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000007 d6000410
!	%l6 = 0000000066fbff73, Mem[0000000010101408] = 91c68d1430000000
	stxa	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000000066fbff73
!	%l7 = 000000007125d708, %l5 = 0005b909d6000410, %y  = 42726a99
	umul	%l7,%l5,%l7		! %l7 = 5e95a38c59b99080, %y = 5e95a38c

p0_label_32:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ff9b4bf4, %l0 = 000000000000001a
	ldsba	[%i5+%o5]0x80,%l0	! %l0 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010001400] = 00424bf4, %f2  = ffb85de6
	lda	[%i0+%g0]0x80,%f2 	! %f2 = 00424bf4
!	Mem[0000000030081400] = 0000dd6c, %f10 = e88c6fff
	lda	[%i2+%g0]0x89,%f10	! %f10 = 0000dd6c
!	Mem[0000000010141406] = 106ef179, %l1 = 00000000000000ff
	lduh	[%i5+0x006],%l1		! %l1 = 000000000000f179
!	Mem[0000000030141408] = 42ca7184 0000ffe2, %l0 = ffffffff, %l1 = 0000f179
	ldda	[%i5+%o4]0x81,%l0	! %l0 = 0000000042ca7184 000000000000ffe2
!	Mem[0000000030101408] = 996a7242, %f6  = e1d52d8e
	lda	[%i4+%o4]0x89,%f6 	! %f6 = 996a7242
!	Mem[0000000010181400] = ff72557a 0409a859, %l0 = 42ca7184, %l1 = 0000ffe2
	ldda	[%i6+%g0]0x80,%l0	! %l0 = 00000000ff72557a 000000000409a859
!	Mem[0000000021800141] = ff7606f8, %l2 = 0000000046000000, %asi = 80
	lduba	[%o3+0x141]%asi,%l2	! %l2 = 0000000000000076
!	Mem[0000000030141410] = 95594621, %l7 = 5e95a38c59b99080
	lduha	[%i5+%o5]0x81,%l7	! %l7 = 0000000000009559
!	Mem[0000000030101408] = 42726a99, %l7 = 0000000000009559
	ldstuba	[%i4+%o4]0x81,%l7	! %l7 = 0000000000000042

p0_label_33:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 42ca7184, %l3 = 00000000000000ff
	ldstuba	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000042
!	%l1 = 000000000409a859, Mem[00000000218001c0] = 5eada358
	stb	%l1,[%o3+0x1c0]		! Mem[00000000218001c0] = 59ada358
!	%f26 = b593a961 f44b9bff, Mem[0000000010081408] = ffb85de6 67f77e9f, %asi = 80
	stda	%f26,[%i2+0x008]%asi	! Mem[0000000010081408] = b593a961 f44b9bff
!	%l7 = 0000000000000042, Mem[0000000030041408] = 00ff00c2
	stba	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = 42ff00c2
!	%l3 = 0000000000000042, Mem[0000000010141410] = f44b9bff
	stha	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = f44b0042
!	Mem[0000000010001408] = 30fb2f26, %l6 = 66fbff73, %l1 = 0409a859
	add	%i0,0x08,%g1
	casa	[%g1]0x80,%l6,%l1	! %l1 = 0000000030fb2f26
!	Mem[0000000010001428] = 6350047e, %l2 = 0000000000000076, %asi = 80
	swapa	[%i0+0x028]%asi,%l2	! %l2 = 000000006350047e
!	Mem[0000000030141400] = e65db8ff, %l5 = 0005b909d6000410
	ldstuba	[%i5+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1430] = 5612554c38fac0ad, %l0 = 00000000ff72557a, %l0 = 00000000ff72557a
	add	%i3,0x30,%g1
	casxa	[%g1]0x80,%l0,%l0	! %l0 = 5612554c38fac0ad
!	%f30 = 66fbff56 7125d708, Mem[0000000010141410] = f44b0042 66740000
	stda	%f30,[%i5+%o5]0x88	! Mem[0000000010141410] = 66fbff56 7125d708

p0_label_34:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ffca7184, %l0 = 5612554c38fac0ad
	ldsba	[%i6+%o5]0x81,%l0	! %l0 = ffffffffffffffff
!	%l5 = 00000000000000ff, %l2 = 000000006350047e, %y  = 5e95a38c
	sdiv	%l5,%l2,%l5		! %l5 = 000000007fffffff
	mov	%l0,%y			! %y = ffffffff
!	Mem[00000000300c1400] = 29f9596874e28dff, %f16 = 59a80904 e88c6fff
	ldda	[%i3+%g0]0x89,%f16	! %f16 = 29f95968 74e28dff
!	Mem[00000000300c1400] = ff8de274, %l2 = 000000006350047e
	ldsha	[%i3+%g0]0x81,%l2	! %l2 = ffffffffffffff8d
!	Mem[0000000030101408] = ff726a99, %l1 = 0000000030fb2f26
	lduwa	[%i4+%o4]0x81,%l1	! %l1 = 00000000ff726a99
!	Mem[0000000010141400] = 92fc27ff, %f12 = 8d591f31
	lda	[%i5+%g0]0x88,%f12	! %f12 = 92fc27ff
!	Mem[0000000010101410] = 164d0000, %f28 = 29f95968
	lda	[%i4+%o5]0x88,%f28	! %f28 = 164d0000
!	Mem[00000000300c1410] = ff8f7880, %l3 = 0000000000000042
	ldsha	[%i3+%o5]0x81,%l3	! %l3 = ffffffffffffff8f
!	Mem[00000000211c0001] = 7fffd1d8, %l7 = 0000000000000042
	ldsb	[%o2+0x001],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010081408] = 61a993b5, %f6  = 996a7242
	lda	[%i2+%o4]0x88,%f6 	! %f6 = 61a993b5

p0_label_35:
!	Starting 10 instruction Store Burst
!	%f2  = 00424bf4 148dc691, Mem[0000000010141408] = 164d9eff 3f805d01
	stda	%f2 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 00424bf4 148dc691
!	%f30 = 66fbff56, Mem[0000000010081408] = b593a961
	sta	%f30,[%i2+%o4]0x80	! Mem[0000000010081408] = 66fbff56
!	%f28 = 164d0000 74e28dff, %f17 = 74e28dff
	fdtos	%f28,%f17		! %f17 = 00000000
!	%l2 = ffffffffffffff8d, Mem[0000000030041410] = 4200936a
	stwa	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = ffffff8d
!	%l5 = 000000007fffffff, Mem[000000001010143c] = 25d1a3f3
	sth	%l5,[%i4+0x03c]		! Mem[000000001010143c] = ffffa3f3
!	%f17 = 00000000, Mem[0000000010041408] = 00000030
	sta	%f17,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	Mem[0000000020800000] = 7466f578, %l0 = ffffffffffffffff
	ldstub	[%o1+%g0],%l0		! %l0 = 0000000000000074
!	Mem[000000001000142c] = 06838bd7, %l5 = 000000007fffffff
	ldstuba	[%i0+0x02c]%asi,%l5	! %l5 = 0000000000000006
!	%l1 = 00000000ff726a99, imm = ffffffffffffff52, %l2 = ffffffffffffff8d
	andn	%l1,-0x0ae,%l2		! %l2 = 0000000000000089
!	Mem[0000000010141418] = 0dcf6fd2, %l3 = ffffff8f, %l6 = 66fbff73
	add	%i5,0x18,%g1
	casa	[%g1]0x80,%l3,%l6	! %l6 = 000000000dcf6fd2

p0_label_36:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ffea1d46, %l4 = 0000000000000007
	ldswa	[%i3+%o4]0x80,%l4	! %l4 = ffffffffffea1d46
!	Mem[00000000100c1400] = ff9e4d16148dc691, %f12 = 92fc27ff aca3d43b
	ldda	[%i3+%g0]0x88,%f12	! %f12 = ff9e4d16 148dc691
!	%l3 = ffffffffffffff8f, %l1 = 00000000ff726a99, %l4 = ffffffffffea1d46
	udivx	%l3,%l1,%l4		! %l4 = 00000001008de3e0
!	Mem[00000000300c1400] = ff8de274 6859f929 fffa46f6 3974d96f
!	Mem[00000000300c1410] = ff8f7880 148dc691 24cbfdc2 20e5058b
!	Mem[00000000300c1420] = 4d36fc90 681d7061 4eb7fe4e 7fed3c67
!	Mem[00000000300c1430] = 48fc5e7c 0afd271d 7235749a 03bc7a03
	ldda	[%i3+%g0]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[0000000030101410] = 00000000, %l7 = ffffffffffffffff
	lduba	[%i4+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001408] = 30fb2f26, %l0 = 0000000000000074
	lduha	[%i0+%o4]0x80,%l0	! %l0 = 00000000000030fb
!	Mem[0000000010041408] = ff000000 00000000, %l6 = 0dcf6fd2, %l7 = 00000000
	ldda	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000000 00000000ff000000
!	Mem[0000000010101408] = 0000000066fbff73, %l3 = ffffffffffffff8f
	ldxa	[%i4+%o4]0x80,%l3	! %l3 = 0000000066fbff73
!	%f8  = 91c68d14, %f23 = 20e5058b, %f5  = 164d9eff
	fadds	%f8 ,%f23,%f5 		! %f5  = 20e5058b
!	Mem[0000000030181410] = ffca71844b2f6905, %l5 = 0000000000000006
	ldxa	[%i6+%o5]0x81,%l5	! %l5 = ffca71844b2f6905

p0_label_37:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000ff000000, Mem[0000000010141438] = 70a230aa, %asi = 80
	stwa	%l7,[%i5+0x038]%asi	! Mem[0000000010141438] = ff000000
!	Mem[0000000010101408] = 00000000, %l3 = 0000000066fbff73
	swapa	[%i4+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1400] = 91c68d14, %l6 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l6	! %l6 = 0000000091c68d14
!	%f14 = ff6f8ce8, Mem[0000000030141400] = ffb85de6
	sta	%f14,[%i5+%g0]0x81	! Mem[0000000030141400] = ff6f8ce8
!	%l7 = 00000000ff000000, Mem[0000000010101410] = 00004d16
	stwa	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = ff000000
!	Mem[000000001018143c] = 06ec6b35, %l2 = 0000000000000089, %asi = 80
	swapa	[%i6+0x03c]%asi,%l2	! %l2 = 0000000006ec6b35
!	Mem[0000000030081400] = 6cdd0000, %l1 = 00000000ff726a99
	ldstuba	[%i2+%g0]0x81,%l1	! %l1 = 000000000000006c
!	%l6 = 91c68d14, %l7 = ff000000, Mem[0000000010081410] = 6373ecd9 00009f4d
	stda	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 91c68d14 ff000000
!	Mem[000000001000142f] = ff838bd7, %l4 = 00000001008de3e0
	ldstuba	[%i0+0x02f]%asi,%l4	! %l4 = 00000000000000d7
!	%f22 = 24cbfdc2 20e5058b, Mem[0000000030001408] = 0000ffe2 860ec60d
	stda	%f22,[%i0+%o4]0x89	! Mem[0000000030001408] = 24cbfdc2 20e5058b

p0_label_38:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ffffff8d 7136b0a5, %l4 = 000000d7, %l5 = 4b2f6905
	ldda	[%i1+%o5]0x81,%l4	! %l4 = 00000000ffffff8d 000000007136b0a5
!	Mem[00000000100c1410] = 420015de00000043, %l1 = 000000000000006c
	ldxa	[%i3+%o5]0x80,%l1	! %l1 = 420015de00000043
!	Mem[0000000030141400] = e88c6fff, %f5  = 20e5058b
	lda	[%i5+%g0]0x89,%f5 	! %f5 = e88c6fff
!	Mem[0000000030141400] = ff6f8ce8, %l1 = 420015de00000043
	ldsba	[%i5+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000100c1414] = 00000043, %l5 = 000000007136b0a5
	ldsh	[%i3+0x014],%l5		! %l5 = 0000000000000000
!	Mem[0000000030081410] = f44b9bff, %f5  = e88c6fff
	lda	[%i2+%o5]0x81,%f5 	! %f5 = f44b9bff
!	Mem[00000000100c1434] = 38fac0ad, %l4 = 00000000ffffff8d, %asi = 80
	ldswa	[%i3+0x034]%asi,%l4	! %l4 = 0000000038fac0ad
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000030041400] = 08d72571 130bab69 42ff00c2 170f8daf
!	Mem[0000000030041410] = ffffff8d 7136b0a5 52c94302 5a80edcb
!	Mem[0000000030041420] = 61f51bd0 2c268aa1 7747478e 08c098a7
!	Mem[0000000030041430] = 40dba1bc 509c555d 2b2601da 4fd18a43
	ldda	[%i1+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030041400
!	Mem[0000000021800000] = 52de3a08, %l3 = 0000000000000000, %asi = 80
	lduha	[%o3+0x000]%asi,%l3	! %l3 = 00000000000052de
!	Mem[0000000030001408] = 20e5058b, %f0  = 00000000
	lda	[%i0+%o4]0x89,%f0 	! %f0 = 20e5058b

p0_label_39:
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffffff, Mem[0000000010041408] = 00000000000000ff
	stxa	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = ffffffffffffffff
	membar	#Sync			! Added by membar checker (9)
!	%l3 = 00000000000052de, Mem[0000000030041410] = 8dffffff
	stba	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 8dffffde
!	%f14 = ff6f8ce8, Mem[0000000010101410] = ff000000
	sta	%f14,[%i4+%o5]0x80	! Mem[0000000010101410] = ff6f8ce8
!	%l4 = 38fac0ad, %l5 = 00000000, Mem[00000000300c1408] = f646faff 6fd97439
	stda	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 38fac0ad 00000000
!	Mem[0000000030041400] = 08d72571 130bab69 42ff00c2 170f8daf
!	%f0  = 20e5058b 536fff3b 00424bf4 148dc691
!	%f4  = 91c68d14 f44b9bff 61a993b5 f5e9eab1
!	%f8  = 91c68d14 164d9eff 0000dd6c fe918a22
!	%f12 = ff9e4d16 148dc691 ff6f8ce8 0409a859
	stda	%f0 ,[%i1+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030041400
!	%l4 = 38fac0ad, %l5 = 00000000, Mem[00000000300c1410] = 80788fff 91c68d14
	stda	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 38fac0ad 00000000
!	%l4 = 0000000038fac0ad, Mem[0000000010001408] = 30fb2f26
	stba	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = adfb2f26
!	%f9  = 164d9eff, %f14 = ff6f8ce8
	fcmps	%fcc1,%f9 ,%f14		! %fcc1 = 2
!	%f0  = 20e5058b 536fff3b, %l0 = 00000000000030fb
!	Mem[0000000010081428] = 03226b3e53bd1f97
	add	%i2,0x028,%g1
	stda	%f0,[%g1+%l0]ASI_PST16_P ! Mem[0000000010081428] = 20e56b3e536fff3b
!	%l0 = 000030fb, %l1 = ffffffff, Mem[0000000030081410] = ff9b4bf4 69ab0b13
	stda	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 000030fb ffffffff

p0_label_40:
!	Starting 10 instruction Load Burst
!	%l5 = 0000000000000000, %l0 = 00000000000030fb, %l5 = 0000000000000000
	sub	%l5,%l0,%l5		! %l5 = ffffffffffffcf05
!	Mem[0000000010001400] = 00424bf4, %l1 = ffffffffffffffff
	lduha	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000042
!	%l4 = 0000000038fac0ad, %l1 = 0000000000000042, %l6 = 0000000091c68d14
	sub	%l4,%l1,%l6		! %l6 = 0000000038fac06b
!	Mem[0000000010081410] = 148dc691, %l2 = 0000000006ec6b35
	ldswa	[%i2+%o5]0x80,%l2	! %l2 = 00000000148dc691
!	Mem[00000000100c1400] = 00000000, %l5 = ffffffffffffcf05
	lduha	[%i3+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = 73fffb66, %l7 = 00000000ff000000
	ldsha	[%i2+%g0]0x88,%l7	! %l7 = fffffffffffffb66
!	Mem[0000000010081410] = 148dc691 000000ff, %l6 = 38fac06b, %l7 = fffffb66, %asi = 80
	ldda	[%i2+0x010]%asi,%l6	! %l6 = 00000000148dc691 00000000000000ff
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000030041408] = 91c68d14, %l3 = 00000000000052de
	lduwa	[%i1+%o4]0x81,%l3	! %l3 = 0000000091c68d14
!	Mem[0000000030141410] = 21465995, %l0 = 00000000000030fb
	lduba	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000095
!	Mem[0000000030101400] = 59a80904, %l7 = 00000000000000ff
	lduwa	[%i4+%g0]0x81,%l7	! %l7 = 0000000059a80904

p0_label_41:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000038fac0ad, Mem[0000000030101408] = ff726a99
	stba	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = ad726a99
!	Mem[0000000010101438] = 5e04974a, %l1 = 00000042, %l2 = 148dc691
	add	%i4,0x38,%g1
	casa	[%g1]0x80,%l1,%l2	! %l2 = 000000005e04974a
!	%l4 = 0000000038fac0ad, Mem[00000000100c1434] = 38fac0ad
	stw	%l4,[%i3+0x034]		! Mem[00000000100c1434] = 38fac0ad
!	%f4  = 91c68d14 f44b9bff, Mem[0000000010101408] = 66fbff73 66fbff73
	stda	%f4 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 91c68d14 f44b9bff
!	%l1 = 0000000000000042, Mem[0000000030081408] = 8f5ba66c96cfffff
	stxa	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000000000000042
!	Mem[0000000030081408] = 42000000, %l1 = 0000000000000042
	swapa	[%i2+%o4]0x81,%l1	! %l1 = 0000000042000000
!	Mem[0000000030141400] = ff6f8ce8, %l0 = 0000000000000095
	ldstuba	[%i5+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001410] = 07000000, %l7 = 0000000059a80904
	ldstuba	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000007
!	%l3 = 0000000091c68d14, %l1 = 0000000042000000, %y  = ffffffff
	udiv	%l3,%l1,%l3		! %l3 = 00000000ffffffff
	mov	%l0,%y			! %y = 000000ff
!	Mem[0000000030001400] = 59a80904, %l0 = 00000000000000ff
	swapa	[%i0+%g0]0x81,%l0	! %l0 = 0000000059a80904

p0_label_42:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 0dc60e86, %l6 = 00000000148dc691
	lduwa	[%i1+%o5]0x88,%l6	! %l6 = 000000000dc60e86
!	Mem[0000000010141410] = 7125d708, %l7 = 0000000000000007
	lduha	[%i5+%o5]0x88,%l7	! %l7 = 000000000000d708
!	Mem[00000000300c1400] = 74e28dff, %l7 = 000000000000d708
	ldsba	[%i3+%g0]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030141408] = 42ca71840000ffe2, %f28 = 40dba1bc 509c555d
	ldda	[%i5+%o4]0x81,%f28	! %f28 = 42ca7184 0000ffe2
!	Mem[00000000201c0000] = 30698148, %l1 = 0000000042000000
	ldsb	[%o0+%g0],%l1		! %l1 = 0000000000000030
!	Mem[0000000030081400] = 0000ddff, %f24 = 61f51bd0
	lda	[%i2+%g0]0x89,%f24	! %f24 = 0000ddff
!	Mem[0000000010141400] = ff27fc92, %l3 = 00000000ffffffff
	ldswa	[%i5+%g0]0x80,%l3	! %l3 = ffffffffff27fc92
!	Mem[0000000030041400] = 536fff3b, %l2 = 000000005e04974a
	ldsha	[%i1+%g0]0x89,%l2	! %l2 = ffffffffffffff3b
!	Mem[0000000010001408] = df42db5f262ffbad, %f26 = 7747478e 08c098a7
	ldda	[%i0+%o4]0x88,%f26	! %f26 = df42db5f 262ffbad
!	Mem[00000000201c0000] = 30698148, %l2 = ffffffffffffff3b, %asi = 80
	lduha	[%o0+0x000]%asi,%l2	! %l2 = 0000000000003069

p0_label_43:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = ffca7184, %l0 = 0000000059a80904
	ldstuba	[%i6+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000030101400] = 59a80904
	stwa	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff
!	%l6 = 000000000dc60e86, Mem[00000000100c1400] = 00000000
	stwa	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0dc60e86
!	%f18 = 42ff00c2 170f8daf, Mem[0000000010141400] = ff27fc92 106ef179
	stda	%f18,[%i5+%g0]0x80	! Mem[0000000010141400] = 42ff00c2 170f8daf
!	Mem[0000000010041400] = 42726a99, %l4 = 0000000038fac0ad
	ldstuba	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000042
!	Mem[0000000030081410] = 000030fb, %l5 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l5	! %l5 = 00000000000000fb
!	%f0  = 20e5058b 536fff3b, %l4 = 0000000000000042
!	Mem[0000000010101428] = 228a91fe00ff8ce8
	add	%i4,0x028,%g1
	stda	%f0,[%g1+%l4]ASI_PST16_P ! Mem[0000000010101428] = 228a91fe536f8ce8
!	%l4 = 0000000000000042, Mem[00000000201c0000] = 30698148, %asi = 80
	stba	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 42698148
!	Mem[0000000030141400] = e88c6fff, %l0 = 00000000000000ff
	swapa	[%i5+%g0]0x89,%l0	! %l0 = 00000000e88c6fff
!	%l3 = ffffffffff27fc92, Mem[0000000010181410] = 9580cc463974d96f
	stxa	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffffffff27fc92

p0_label_44:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ff66f578, %l6 = 000000000dc60e86, %asi = 80
	lduba	[%o1+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181408] = 164d9eff, %f11 = fe918a22
	lda	[%i6+%o4]0x89,%f11	! %f11 = 164d9eff
!	Mem[0000000010001430] = 6a93944d2fe59863, %l3 = ffffffffff27fc92, %asi = 80
	ldxa	[%i0+0x030]%asi,%l3	! %l3 = 6a93944d2fe59863
!	Mem[0000000010181430] = 08d72571 78d21b4d, %l4 = 00000042, %l5 = 000000fb
	ldd	[%i6+0x030],%l4		! %l4 = 0000000008d72571 0000000078d21b4d
!	Mem[0000000010001408] = adfb2f26 5fdb42df, %l0 = e88c6fff, %l1 = 00000030
	ldda	[%i0+%o4]0x80,%l0	! %l0 = 00000000adfb2f26 000000005fdb42df
!	Mem[0000000030181408] = 164d9eff, %f11 = 164d9eff
	lda	[%i6+%o4]0x89,%f11	! %f11 = 164d9eff
!	Mem[00000000100c1408] = 461deaff, %l7 = ffffffffffffffff
	ldsba	[%i3+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000021800140] = ff7606f8, %l3 = 6a93944d2fe59863, %asi = 80
	lduba	[%o3+0x140]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141408] = 91c68d14, %f13 = 148dc691
	lda	[%i5+%o4]0x80,%f13	! %f13 = 91c68d14
!	Mem[0000000010001408] = adfb2f26, %l0 = 00000000adfb2f26
	ldsba	[%i0+%o4]0x80,%l0	! %l0 = ffffffffffffffad

p0_label_45:
!	Starting 10 instruction Store Burst
!	%f2  = 00424bf4 148dc691, %l0 = ffffffffffffffad
!	Mem[0000000010101418] = b1eae9f58e2dd5e1
	add	%i4,0x018,%g1
	stda	%f2,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010101418] = 91c6e9f5f44b4200
!	%l6 = 000000ff, %l7 = ffffffff, Mem[0000000010001410] = ff000000 100400d6
	stda	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000ff ffffffff
!	%f12 = ff9e4d16 91c68d14, %l2 = 0000000000003069
!	Mem[0000000030181420] = 6cfa55b003793101
	add	%i6,0x020,%g1
	stda	%f12,[%g1+%l2]ASI_PST16_S ! Mem[0000000030181420] = ff9e55b003798d14
!	%l5 = 0000000078d21b4d, Mem[0000000030041400] = 20e5058b536fff3b
	stxa	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000000078d21b4d
!	Mem[0000000010081408] = 66fbff56, %l6 = 000000ff, %l1 = 5fdb42df
	add	%i2,0x08,%g1
	casa	[%g1]0x80,%l6,%l1	! %l1 = 0000000066fbff56
!	Mem[0000000030041410] = f44b9bff, %l0 = ffffffffffffffad
	ldstuba	[%i1+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%l2 = 0000000000003069, Mem[0000000030001400] = 000000ff
	stha	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 306900ff
!	%f14 = ff6f8ce8 0409a859, %l5 = 0000000078d21b4d
!	Mem[0000000030041430] = 91c68d14164d9eff
	add	%i1,0x030,%g1
	stda	%f14,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030041430] = 59c60904164d6fff
!	%f18 = 42ff00c2, Mem[0000000010101400] = c403185d
	sta	%f18,[%i4+%g0]0x88	! Mem[0000000010101400] = 42ff00c2
!	%l0 = 00000000000000ff, Mem[0000000030041400] = 4d1bd27800000000
	stxa	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000000000ff

p0_label_46:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 91c68d14 f44b4200, %l6 = 000000ff, %l7 = ffffffff
	ldd	[%i5+%o4],%l6		! %l6 = 0000000091c68d14 00000000f44b4200
	membar	#Sync			! Added by membar checker (11)
!	Mem[00000000100c1400] = 860ec60d 164d9eff ffea1d46 2cf3247f
!	Mem[00000000100c1410] = 420015de 00000043 0000004a 2dddfd9b
!	Mem[00000000100c1420] = 000040bc 000000ff 5857c69e 40bc7177
!	Mem[00000000100c1430] = 5612554c 38fac0ad 59b76dea 30527c13
	ldda	[%i3+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 00000000100c1400
!	Mem[0000000010041400] = 996a72ff, %l3 = 00000000000000ff
	ldswa	[%i1+%g0]0x88,%l3	! %l3 = ffffffff996a72ff
!	Mem[00000000201c0001] = 42698148, %l0 = 00000000000000ff
	ldub	[%o0+0x001],%l0		! %l0 = 0000000000000069
!	Mem[0000000030081410] = ff300000ffffffff, %f0  = 20e5058b 536fff3b
	ldda	[%i2+%o5]0x81,%f0 	! %f0  = ff300000 ffffffff
!	Mem[0000000030181408] = 164d9eff, %l5 = 0000000078d21b4d
	lduwa	[%i6+%o4]0x89,%l5	! %l5 = 00000000164d9eff
!	Mem[0000000010041418] = dc514d59 cf5e3aa8, %l6 = 91c68d14, %l7 = f44b4200
	ldd	[%i1+0x018],%l6		! %l6 = 00000000dc514d59 00000000cf5e3aa8
!	Mem[0000000010181430] = 08d72571, %l2 = 0000000000003069, %asi = 80
	lduha	[%i6+0x030]%asi,%l2	! %l2 = 00000000000008d7
!	Mem[0000000030041400] = 00000000, %l1 = 0000000066fbff56
	ldsha	[%i1+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = ff9e4d16 0dc60e86, %l4 = 08d72571, %l5 = 164d9eff
	ldda	[%i3+%g0]0x88,%l4	! %l4 = 000000000dc60e86 00000000ff9e4d16

p0_label_47:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000030081408] = 42000000
	stwa	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%l4 = 000000000dc60e86, Mem[0000000010001410] = 000000ff
	stwa	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 0dc60e86
!	%l2 = 00000000000008d7, Mem[0000000010181400] = ff72557a, %asi = 80
	stha	%l2,[%i6+0x000]%asi	! Mem[0000000010181400] = 08d7557a
!	%l4 = 0dc60e86, %l5 = ff9e4d16, Mem[0000000030081410] = 000030ff ffffffff
	stda	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 0dc60e86 ff9e4d16
!	Mem[0000000010041408] = ffffffff, %l0 = 0000000000000069
	ldstuba	[%i1+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141408] = 91c68d14, %l2 = 00000000000008d7
	ldstuba	[%i5+%o4]0x80,%l2	! %l2 = 0000000000000091
!	Mem[000000001018141c] = 148dc691, %l2 = 0000000000000091
	swap	[%i6+0x01c],%l2		! %l2 = 00000000148dc691
!	%f16 = ff9e4d16 0dc60e86, %l4 = 000000000dc60e86
!	Mem[0000000010181408] = 59a80904e88c6fff
	add	%i6,0x008,%g1
	stda	%f16,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010181408] = 590ec604e88c6fff
!	%l3 = ffffffff996a72ff, Mem[0000000030041400] = 00000000
	stwa	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = 996a72ff
!	%l2 = 00000000148dc691, immd = 000000000000097f, %l108 = 0000000000000006
	sdivx	%l2,0x97f,%l6		! %l6 = 0000000000022a19

p0_label_48:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ff9b4bf4148dc691, %f4  = 91c68d14 f44b9bff
	ldda	[%i1+%o5]0x81,%f4 	! %f4  = ff9b4bf4 148dc691
!	Mem[0000000030181410] = ffca7184, %f1  = ffffffff
	lda	[%i6+%o5]0x81,%f1 	! %f1 = ffca7184
!	Mem[0000000010041400] = ff726a99, %l4 = 000000000dc60e86
	ldsha	[%i1+%g0]0x80,%l4	! %l4 = ffffffffffffff72
!	Mem[00000000211c0001] = 7fffd1d8, %l6 = 0000000000022a19
	ldub	[%o2+0x001],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010181408] = 04c60e59, %l2 = 00000000148dc691
	ldsha	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000e59
!	Mem[00000000100c1400] = 0dc60e86, %l0 = 00000000000000ff
	ldswa	[%i3+%g0]0x88,%l0	! %l0 = 000000000dc60e86
!	Mem[00000000100c1408] = 461deaff, %l1 = 0000000000000000
	ldsba	[%i3+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001408] = adfb2f26 5fdb42df, %l0 = 0dc60e86, %l1 = ffffffff, %asi = 80
	ldda	[%i0+0x008]%asi,%l0	! %l0 = 00000000adfb2f26 000000005fdb42df
!	Mem[0000000030081410] = 0dc60e86, %l0 = 00000000adfb2f26
	lduha	[%i2+%o5]0x89,%l0	! %l0 = 0000000000000e86
!	Mem[00000000300c1400] = 74e28dff, %l1 = 000000005fdb42df
	ldsha	[%i3+%g0]0x89,%l1	! %l1 = ffffffffffff8dff

p0_label_49:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000e59, immd = 0000000000000f75, %l108 = 0000000000000000
	udivx	%l2,0xf75,%l0		! %l0 = 0000000000000000
!	Mem[0000000030001408] = 8b05e520, %l2 = 0000000000000e59
	ldstuba	[%i0+%o4]0x81,%l2	! %l2 = 000000000000008b
!	%f12 = ff9e4d16 91c68d14, Mem[0000000010001408] = adfb2f26 5fdb42df
	stda	%f12,[%i0+%o4]0x80	! Mem[0000000010001408] = ff9e4d16 91c68d14
!	Mem[0000000030081400] = 0000ddff, %l7 = 00000000cf5e3aa8
	swapa	[%i2+%g0]0x89,%l7	! %l7 = 000000000000ddff
!	%l7 = 000000000000ddff, imm = fffffffffffff274, %l7 = 000000000000ddff
	xnor	%l7,-0xd8c,%l7		! %l7 = 000000000000d074
!	%f4  = ff9b4bf4, Mem[0000000010181420] = 37d73b80
	sta	%f4 ,[%i6+0x020]%asi	! Mem[0000000010181420] = ff9b4bf4
!	Mem[0000000030101410] = 00000000, %l2 = 000000000000008b
	ldstuba	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000
!	%l2 = 00000000, %l3 = 996a72ff, Mem[0000000030141408] = 8471ca42 e2ff0000
	stda	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000 996a72ff
!	%f1  = ffca7184, %f26 = 7771bc40, %f22 = 9bfddd2d
	fsubs	%f1 ,%f26,%f22		! %f22 = ffca7184
!	Mem[0000000010101410] = ff6f8ce8, %l6 = 00000000000000ff
	ldstuba	[%i4+%o5]0x80,%l6	! %l6 = 00000000000000ff

p0_label_50:
!	Starting 10 instruction Load Burst
!	Mem[000000001000141c] = 5784e9fb, %l7 = 000000000000d074
	ldsw	[%i0+0x01c],%l7		! %l7 = 000000005784e9fb
!	Mem[0000000030101410] = ff000000, %f7  = f5e9eab1
	lda	[%i4+%o5]0x81,%f7 	! %f7 = ff000000
!	Mem[0000000010041400] = 996a72ff, %l1 = ffffffffffff8dff
	ldsha	[%i1+%g0]0x88,%l1	! %l1 = 00000000000072ff
!	Mem[00000000100c1400] = 860ec60d 164d9eff ffea1d46 2cf3247f
!	Mem[00000000100c1410] = 420015de 00000043 0000004a 2dddfd9b
!	Mem[00000000100c1420] = 000040bc 000000ff 5857c69e 40bc7177
!	Mem[00000000100c1430] = 5612554c 38fac0ad 59b76dea 30527c13
	ldda	[%i3+%g0]ASI_BLK_AIUP,%f0 	! Block Load from 00000000100c1400
!	Mem[0000000030181408] = 164d9eff, %l1 = 00000000000072ff
	lduba	[%i6+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%f4  = 420015de, %f8  = 000040bc, %f27 = 9ec65758
	fmuls	%f4 ,%f8 ,%f27		! tt=0x22, %l0 = 0000000000000022
!	Mem[00000000100c1428] = 5857c69e, %l7 = 000000005784e9fb, %asi = 80
	ldsba	[%i3+0x028]%asi,%l7	! %l7 = 0000000000000058
!	Mem[0000000010081404] = 6373ecd9, %l7 = 0000000000000058, %asi = 80
	lduha	[%i2+0x004]%asi,%l7	! %l7 = 0000000000006373
!	Mem[0000000030141400] = 000000ff, %l3 = ffffffff996a72ff
	ldsba	[%i5+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000100c141c] = 2dddfd9b, %l3 = ffffffffffffffff, %asi = 80
	ldsha	[%i3+0x01c]%asi,%l3	! %l3 = 0000000000002ddd

p0_label_51:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 148dc691, %l1 = 00000000000000ff
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 00000000148dc691
!	%l4 = ffffffffffffff72, Mem[0000000010001410] = 0dc60e86ffffffff
	stxa	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = ffffffffffffff72
	membar	#Sync			! Added by membar checker (12)
!	%l4 = ffffffffffffff72, Mem[00000000100c1410] = 420015de00000043
	stxa	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffffffffffffff72
!	Mem[00000000100c1432] = 5612554c, %l7 = 0000000000006373
	ldstuba	[%i3+0x032]%asi,%l7	! %l7 = 0000000000000055
!	%l4 = ffffffffffffff72, %l0 = 0000000000000022, %y  = 000000ff
	smul	%l4,%l0,%l5		! %l5 = ffffffffffffed24, %y = ffffffff
!	%l1 = 00000000148dc691, imm = fffffffffffff89f, %l1 = 00000000148dc691
	xnor	%l1,-0x761,%l1		! %l1 = 00000000148dc1f1
!	%f9  = 000000ff, Mem[000000001004140c] = ffffffff
	st	%f9 ,[%i1+0x00c]	! Mem[000000001004140c] = 000000ff
!	%l5 = ffffffffffffed24, %l0 = 0000000000000022, %l2  = 0000000000000000
	mulx	%l5,%l0,%l2		! %l2 = fffffffffffd7ec8
!	Mem[0000000010081400] = 66fbff73 6373ecd9 66fbff56 f44b9bff
!	%f16 = ff9e4d16 0dc60e86 7f24f32c 461deaff
!	%f20 = 43000000 de150042 ffca7184 4a000000
!	%f24 = ff000000 bc400000 7771bc40 9ec65758
!	%f28 = adc0fa38 4c551256 137c5230 ea6db759
	stda	%f16,[%i2+%g0]ASI_COMMIT_P	! Block Store to 0000000010081400
!	%l0 = 00000022, %l1 = 148dc1f1, Mem[0000000010101410] = e88c6fff 91c68d14
	stda	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000022 148dc1f1

p0_label_52:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00000000, %l6 = 00000000000000ff
	ldswa	[%i6+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041408] = ffffffff, %l4 = ffffffffffffff72
	lduha	[%i1+%o4]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030101410] = ff000000, %l1 = 00000000148dc1f1
	ldswa	[%i4+%o5]0x81,%l1	! %l1 = ffffffffff000000
!	Mem[0000000030181410] = 05692f4b8471caff, %l5 = ffffffffffffed24
	ldxa	[%i6+%o5]0x89,%l5	! %l5 = 05692f4b8471caff
!	%l4 = 000000000000ffff, Mem[0000000030041400] = ff000000996a72ff
	stxa	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000000000ffff
!	Mem[0000000030101408] = 996a72ad, %l5 = 05692f4b8471caff
	ldswa	[%i4+%o4]0x89,%l5	! %l5 = ffffffff996a72ad
!	Mem[0000000010001408] = ff9e4d16, %l1 = ffffffffff000000
	lduha	[%i0+%o4]0x80,%l1	! %l1 = 000000000000ff9e
!	Mem[0000000030101410] = 000000ff, %f4  = 420015de
	lda	[%i4+%o5]0x89,%f4 	! %f4 = 000000ff
!	Mem[0000000010001400] = f44b4200, %l7 = 0000000000000055
	lduba	[%i0+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101408] = ff9b4bf4000000ff, %f12 = 5612554c 38fac0ad
	ldda	[%i4+%o4]0x88,%f12	! %f12 = ff9b4bf4 000000ff

p0_label_53:
!	Starting 10 instruction Store Burst
!	%f14 = 59b76dea 30527c13, %l5 = ffffffff996a72ad
!	Mem[0000000030101428] = b593a961f44b9bff
	add	%i4,0x028,%g1
	stda	%f14,[%g1+%l5]ASI_PST8_S ! Mem[0000000030101428] = 59936d6130529b13
!	Mem[0000000030041400] = ffff0000, %l5 = 00000000996a72ad
	swapa	[%i1+%g0]0x81,%l5	! %l5 = 00000000ffff0000
!	Mem[0000000030101408] = 996a72ad, %l0 = 0000000000000022
	swapa	[%i4+%o4]0x89,%l0	! %l0 = 00000000996a72ad
	membar	#Sync			! Added by membar checker (13)
!	%f29 = 4c551256, Mem[0000000010081410] = 43000000
	sta	%f29,[%i2+%o5]0x80	! Mem[0000000010081410] = 4c551256
!	Mem[0000000030181410] = 8471caff, %l1 = 000000000000ff9e
	swapa	[%i6+%o5]0x89,%l1	! %l1 = 000000008471caff
!	Mem[000000001000140c] = 91c68d14, %l5 = ffff0000, %l3 = 00002ddd
	add	%i0,0x0c,%g1
	casa	[%g1]0x80,%l5,%l3	! %l3 = 0000000091c68d14
!	%l4 = 0000ffff, %l5 = ffff0000, Mem[00000000100c1410] = ffffffff ffffff72
	std	%l4,[%i3+%o5]		! Mem[00000000100c1410] = 0000ffff ffff0000
!	%f24 = ff000000, Mem[0000000010101400] = 42ff00c2
	sta	%f24,[%i4+%g0]0x88	! Mem[0000000010101400] = ff000000
!	Mem[0000000020800040] = ff1565a8, %l6 = 0000000000000000
	ldstub	[%o1+0x040],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010081408] = 7f24f32c, %l7 = 0000000000000000
	swap	[%i2+%o4],%l7		! %l7 = 000000007f24f32c

p0_label_54:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 0000000000000000, %l1 = 000000008471caff
	ldxa	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000211c0000] = 7fffd1d8, %l2 = fffffffffffd7ec8, %asi = 80
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 0000000000007fff
!	Mem[0000000010181410] = ff27fc92, %l7 = 000000007f24f32c
	lduha	[%i6+%o5]0x88,%l7	! %l7 = 000000000000fc92
!	Mem[0000000030181408] = ff9e4d16, %l5 = 00000000ffff0000
	ldswa	[%i6+%o4]0x81,%l5	! %l5 = ffffffffff9e4d16
!	Mem[0000000010101410] = 22000000, %l5 = ffffffffff9e4d16
	lduba	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000022
!	Mem[0000000010001408] = ff9e4d16, %l0 = 00000000996a72ad
	lduha	[%i0+%o4]0x80,%l0	! %l0 = 000000000000ff9e
!	Mem[00000000211c0001] = 7fffd1d8, %l2 = 0000000000007fff, %asi = 80
	lduba	[%o2+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181408] = 164d9eff, %l0 = 000000000000ff9e
	ldsha	[%i6+%o4]0x89,%l0	! %l0 = ffffffffffff9eff
!	Mem[00000000201c0000] = 42698148, %l7 = 000000000000fc92, %asi = 80
	lduba	[%o0+0x000]%asi,%l7	! %l7 = 0000000000000042
!	Mem[0000000010081400] = ff9e4d16 0dc60e86, %l4 = 0000ffff, %l5 = 00000022
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 00000000ff9e4d16 000000000dc60e86

p0_label_55:
!	Starting 10 instruction Store Burst
!	%f18 = 7f24f32c, Mem[0000000030101408] = 00000022
	sta	%f18,[%i4+%o4]0x89	! Mem[0000000030101408] = 7f24f32c
!	Mem[0000000021800000] = 52de3a08, %l5 = 000000000dc60e86
	ldstuba	[%o3+0x000]%asi,%l5	! %l5 = 0000000000000052
!	%f1  = 164d9eff, Mem[00000000100c140c] = 2cf3247f
	sta	%f1 ,[%i3+0x00c]%asi	! Mem[00000000100c140c] = 164d9eff
!	%f23 = 4a000000, Mem[000000001004143c] = 388e3c53
	sta	%f23,[%i1+0x03c]%asi	! Mem[000000001004143c] = 4a000000
!	Mem[0000000030181400] = 00000000, %l4 = 00000000ff9e4d16
	ldstuba	[%i6+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%f28 = adc0fa38 4c551256, %l1 = 0000000000000000
!	Mem[0000000030081418] = 411768625b2fa1ab
	add	%i2,0x018,%g1
	stda	%f28,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030081418] = 411768625b2fa1ab
!	%l0 = ffff9eff, %l1 = 00000000, Mem[00000000100c1438] = 59b76dea 30527c13, %asi = 80
	stda	%l0,[%i3+0x038]%asi	! Mem[00000000100c1438] = ffff9eff 00000000
!	%f16 = ff9e4d16 0dc60e86, Mem[0000000030081400] = a83a5ecf 5f99ba49
	stda	%f16,[%i2+%g0]0x81	! Mem[0000000030081400] = ff9e4d16 0dc60e86
!	Mem[0000000020800040] = ff1565a8, %l0 = ffffffffffff9eff
	ldstuba	[%o1+0x040]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141408] = 148dc6ff, %l1 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l1	! %l1 = 00000000000000ff

p0_label_56:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 7fffd1d8, %l2 = 00000000000000ff, %asi = 80
	lduba	[%o2+0x000]%asi,%l2	! %l2 = 000000000000007f
!	Mem[00000000201c0001] = 42698148, %l3 = 0000000091c68d14
	ldsb	[%o0+0x001],%l3		! %l3 = 0000000000000069
!	Mem[0000000010081438] = 137c5230 ea6db759, %l4 = 00000000, %l5 = 00000052, %asi = 80
	ldda	[%i2+0x038]%asi,%l4	! %l4 = 00000000137c5230 00000000ea6db759
!	Mem[0000000030101400] = ff000000, %l2 = 000000000000007f
	lduwa	[%i4+%g0]0x89,%l2	! %l2 = 00000000ff000000
!	Mem[0000000030041410] = 91c68d14f44b9bff, %l4 = 00000000137c5230
	ldxa	[%i1+%o5]0x89,%l4	! %l4 = 91c68d14f44b9bff
!	Mem[000000001008143c] = ea6db759, %l1 = 00000000000000ff
	lduh	[%i2+0x03c],%l1		! %l1 = 000000000000ea6d
!	Mem[0000000030041408] = 91c68d14, %l5 = 00000000ea6db759
	ldswa	[%i1+%o4]0x81,%l5	! %l5 = ffffffff91c68d14
!	Mem[00000000211c0000] = 7fffd1d8, %l1 = 000000000000ea6d, %asi = 80
	lduba	[%o2+0x000]%asi,%l1	! %l1 = 000000000000007f
!	Mem[0000000020800001] = ff66f578, %l3 = 0000000000000069, %asi = 80
	lduba	[%o1+0x001]%asi,%l3	! %l3 = 0000000000000066
!	Mem[0000000021800040] = 460e9e38, %l1 = 000000000000007f
	ldsh	[%o3+0x040],%l1		! %l1 = 000000000000460e

p0_label_57:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 000000ff, %l3 = 0000000000000066
	swapa	[%i4+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[0000000010101410] = 22000000
	stha	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 00ff0000
!	%l3 = 00000000000000ff, Mem[0000000010101410] = 00ff0000
	stw	%l3,[%i4+%o5]		! Mem[0000000010101410] = 000000ff
!	%l3 = 00000000000000ff, Mem[0000000010101408] = 66000000
	stha	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = 00ff0000
!	%l2 = ff000000, %l3 = 000000ff, Mem[0000000030081410] = 860ec60d 164d9eff
	stda	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = ff000000 000000ff
!	%l4 = 91c68d14f44b9bff, Mem[0000000030041408] = 148dc691
	stha	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 148d9bff
!	%l0 = 000000ff, %l1 = 0000460e, Mem[0000000010141400] = c200ff42 af8d0f17
	stda	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff 0000460e
!	Mem[00000000300c1400] = 74e28dff, %l2 = 00000000ff000000
	swapa	[%i3+%g0]0x89,%l2	! %l2 = 0000000074e28dff
!	Mem[00000000100c1438] = ffff9eff00000000, %l2 = 0000000074e28dff, %l7 = 0000000000000042
	add	%i3,0x38,%g1
	casxa	[%g1]0x80,%l2,%l7	! %l7 = ffff9eff00000000
!	Mem[0000000010001400] = 00424bf4, %l2 = 0000000074e28dff
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000

p0_label_58:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 42698148, %l6 = 00000000000000ff, %asi = 80
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 0000000000004269
!	Mem[0000000030081408] = 00000000, %f14 = 59b76dea
	lda	[%i2+%o4]0x81,%f14	! %f14 = 00000000
!	Mem[0000000030041408] = ff9b8d14, %l1 = 000000000000460e
	ldsba	[%i1+%o4]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000100c1400] = 0dc60e86, %l2 = 0000000000000000
	lduha	[%i3+%g0]0x88,%l2	! %l2 = 0000000000000e86
!	Mem[0000000030101400] = 000000ff, %l3 = 00000000000000ff
	ldsba	[%i4+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001400] = 306900ff, %f20 = 43000000
	lda	[%i0+%g0]0x81,%f20	! %f20 = 306900ff
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000010101400] = 000000ff 000000ff 00ff0000 f44b9bff
!	Mem[0000000010101410] = 000000ff f1c18d14 91c6e9f5 f44b4200
!	Mem[0000000010101420] = ff9e4d16 148dc691 228a91fe 536f8ce8
!	Mem[0000000010101430] = 3bd4a3ac 311f598d 5e04974a ffffa3f3
	ldda	[%i4+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010101400
!	Mem[0000000010081408] = 00000000, %f12 = ff9b4bf4
	lda	[%i2+%o4]0x80,%f12	! %f12 = 00000000
!	Mem[0000000010181410] = ff27fc92, %f3  = 2cf3247f
	lda	[%i6+%o5]0x88,%f3 	! %f3 = ff27fc92
!	Mem[0000000010141410] = 7125d708, %l7 = ffff9eff00000000
	lduha	[%i5+%o5]0x88,%l7	! %l7 = 000000000000d708

p0_label_59:
!	Starting 10 instruction Store Burst
!	%l4 = 91c68d14f44b9bff, Mem[0000000030001410] = 21465995
	stwa	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = f44b9bff
!	Mem[0000000030181410] = 9eff0000, %l5 = ffffffff91c68d14
	ldstuba	[%i6+%o5]0x81,%l5	! %l5 = 000000000000009e
!	Mem[0000000010081400] = 164d9eff, %l4 = 00000000f44b9bff
	swapa	[%i2+%g0]0x88,%l4	! %l4 = 00000000164d9eff
!	%l7 = 000000000000d708, Mem[0000000030081400] = ff9e4d16
	stha	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = d7084d16
!	%f13 = 000000ff, %f9  = 000000ff
	fsqrts	%f13,%f9 		! tt=0x22, %l0 = 0000000000000121
!	Mem[0000000030181408] = ff9e4d16, %l2 = 0000000000000e86
	swapa	[%i6+%o4]0x81,%l2	! %l2 = 00000000ff9e4d16
!	Mem[0000000010101430] = 3bd4a3ac311f598d, %l2 = 00000000ff9e4d16, %l2 = 00000000ff9e4d16
	add	%i4,0x30,%g1
	casxa	[%g1]0x80,%l2,%l2	! %l2 = 3bd4a3ac311f598d
!	Mem[0000000030141400] = 000000ff, %l0 = 0000000000000121
	ldstuba	[%i5+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1410] = 0000ffff, %l2 = 3bd4a3ac311f598d
	ldstuba	[%i3+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000201c0001] = 42698148, %l2 = 0000000000000000
	ldstub	[%o0+0x001],%l2		! %l2 = 0000000000000069

p0_label_60:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 0dc60e86, %l4 = 00000000164d9eff
	ldswa	[%i3+%g0]0x88,%l4	! %l4 = 000000000dc60e86
!	Mem[0000000030001400] = 306900ff, %l5 = 000000000000009e
	ldsba	[%i0+%g0]0x81,%l5	! %l5 = 0000000000000030
!	Mem[0000000010181408] = 590ec604e88c6fff, %f10 = 5857c69e 40bc7177
	ldda	[%i6+%o4]0x80,%f10	! %f10 = 590ec604 e88c6fff
!	Mem[0000000021800041] = 460e9e38, %l5 = 0000000000000030, %asi = 80
	lduba	[%o3+0x041]%asi,%l5	! %l5 = 000000000000000e
!	Mem[0000000030041400] = 996a72ad, %l0 = 00000000000000ff
	ldswa	[%i1+%g0]0x81,%l0	! %l0 = ffffffff996a72ad
!	Mem[0000000030181408] = 00000e86, %l4 = 000000000dc60e86
	lduwa	[%i6+%o4]0x81,%l4	! %l4 = 0000000000000e86
!	Mem[0000000010101400] = 000000ff 000000ff, %l6 = 00004269, %l7 = 0000d708
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 00000000000000ff 00000000000000ff
!	Mem[0000000030141408] = 00000000, %l7 = 00000000000000ff
	ldsba	[%i5+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001410] = ff9b4bf4, %l4 = 0000000000000e86
	lduba	[%i0+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[00000000211c0000] = 7fffd1d8, %l4 = 00000000000000ff, %asi = 80
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = 0000000000007fff

p0_label_61:
!	Starting 10 instruction Store Burst
!	%f0  = 860ec60d 164d9eff, %l7 = 0000000000000000
!	Mem[0000000010081430] = adc0fa384c551256
	add	%i2,0x030,%g1
	stda	%f0,[%g1+%l7]ASI_PST32_P ! Mem[0000000010081430] = adc0fa384c551256
!	%l5 = 000000000000000e, Mem[0000000030001400] = 306900ffe88c6fff
	stxa	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000000000000e
!	Mem[0000000010141400] = ff000000, %l6 = 00000000000000ff
	swapa	[%i5+%g0]0x80,%l6	! %l6 = 00000000ff000000
!	Mem[0000000030101400] = 000000ff, %l0 = ffffffff996a72ad
	ldstuba	[%i4+%g0]0x81,%l0	! %l0 = 0000000000000000
!	%l7 = 0000000000000000, Mem[00000000300c1400] = 000000ff6859f929
	stxa	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000000000000
!	Mem[0000000010181408] = 590ec604, %l2 = 0000000000000069
	ldstuba	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000059
!	Mem[0000000010141434] = 3a3f226d, %l6 = 00000000ff000000
	swap	[%i5+0x034],%l6		! %l6 = 000000003a3f226d
!	%l2 = 00000059, %l3 = 00000000, Mem[0000000010181418] = ffb85de6 00000091, %asi = 80
	stda	%l2,[%i6+0x018]%asi	! Mem[0000000010181418] = 00000059 00000000
!	%f13 = 000000ff, Mem[00000000100c1408] = 461deaff
	sta	%f13,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff
!	Mem[0000000010081400] = f44b9bff, %l4 = 0000000000007fff
	ldstuba	[%i2+%g0]0x88,%l4	! %l4 = 00000000000000ff

p0_label_62:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = d7084d16, %l4 = 00000000000000ff
	lduha	[%i2+%g0]0x81,%l4	! %l4 = 000000000000d708
!	Mem[0000000030081408] = 00000000 00000000, %l2 = 00000059, %l3 = 00000000
	ldda	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010141410] = 7125d708, %l3 = 0000000000000000
	ldsha	[%i5+%o5]0x88,%l3	! %l3 = ffffffffffffd708
!	Mem[00000000100c1410] = ff00ffffffff0000, %l3 = ffffffffffffd708
	ldxa	[%i3+%o5]0x80,%l3	! %l3 = ff00ffffffff0000
!	Mem[0000000010041400] = ff726a99, %l0 = 0000000000000000
	ldsha	[%i1+%g0]0x80,%l0	! %l0 = ffffffffffffff72
!	%f3  = ff27fc92, %f24 = ff9e4d16
	fsqrts	%f3 ,%f24		! %f24 = 7fffffff
!	Mem[0000000010141410] = 08d7257156fffb66, %f28 = 3bd4a3ac 311f598d
	ldda	[%i5+%o5]0x80,%f28	! %f28 = 08d72571 56fffb66
!	Mem[0000000030141408] = 00000000, %l3 = ff00ffffffff0000
	lduha	[%i5+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = 08d72571, %l0 = ffffffffffffff72
	ldsha	[%i5+%o5]0x80,%l0	! %l0 = 00000000000008d7
!	Mem[0000000030041400] = 00000000ad726a99, %l4 = 000000000000d708
	ldxa	[%i1+%g0]0x89,%l4	! %l4 = 00000000ad726a99

p0_label_63:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c143f] = 00000000, %l1 = ffffffffffffffff
	ldstub	[%i3+0x03f],%l1		! %l1 = 0000000000000000
!	%l6 = 000000003a3f226d, Mem[0000000021800180] = 29305728
	sth	%l6,[%o3+0x180]		! Mem[0000000021800180] = 226d5728
!	%l5 = 000000000000000e, Mem[0000000030101410] = 000000ff
	stha	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000000e
!	%f6  = 0000004a 2dddfd9b, %l3 = 0000000000000000
!	Mem[0000000010001430] = 6a93944d2fe59863
	add	%i0,0x030,%g1
	stda	%f6,[%g1+%l3]ASI_PST32_P ! Mem[0000000010001430] = 6a93944d2fe59863
!	%l0 = 00000000000008d7, Mem[0000000030101410] = 0000000e
	stwa	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 000008d7
!	%f28 = 08d72571 56fffb66, Mem[0000000010081400] = ff9b4bf4 0dc60e86
	stda	%f28,[%i2+%g0]0x80	! Mem[0000000010081400] = 08d72571 56fffb66
!	%f0  = 860ec60d 164d9eff, %l7 = 0000000000000000
!	Mem[0000000030081410] = ff000000000000ff
	add	%i2,0x010,%g1
	stda	%f0,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030081410] = ff000000000000ff
!	%l4 = 00000000ad726a99, Mem[000000001000142c] = ff838bff
	stw	%l4,[%i0+0x02c]		! Mem[000000001000142c] = ad726a99
!	%f6  = 0000004a, Mem[0000000030001410] = f44b9bff
	sta	%f6 ,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000004a
	membar	#Sync			! Added by membar checker (15)
!	%l5 = 000000000000000e, Mem[0000000010101424] = 148dc691, %asi = 80
	stwa	%l5,[%i4+0x024]%asi	! Mem[0000000010101424] = 0000000e

p0_label_64:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = f44b42ff, %l7 = 0000000000000000
	ldswa	[%i0+%g0]0x88,%l7	! %l7 = fffffffff44b42ff
!	Mem[0000000030181400] = 58002fff000000ff, %l2 = 0000000000000000
	ldxa	[%i6+%g0]0x89,%l2	! %l2 = 58002fff000000ff
!	%f26 = 228a91fe, Mem[0000000010041400] = ff726a99
	sta	%f26,[%i1+%g0]0x80	! Mem[0000000010041400] = 228a91fe
!	Mem[0000000010081400] = 7125d708, %l0 = 00000000000008d7
	ldsba	[%i2+%g0]0x88,%l0	! %l0 = 0000000000000008
!	Mem[0000000010041400] = 228a91fe, %f22 = 91c6e9f5
	lda	[%i1+%g0]0x80,%f22	! %f22 = 228a91fe
!	Mem[0000000010041400] = 228a91fe, %l3 = 0000000000000000
	lduha	[%i1+%g0]0x80,%l3	! %l3 = 000000000000228a
!	Mem[0000000010081428] = 7771bc409ec65758, %l7 = fffffffff44b42ff, %asi = 80
	ldxa	[%i2+0x028]%asi,%l7	! %l7 = 7771bc409ec65758
!	Mem[00000000100c1408] = ff000000 164d9eff, %l2 = 000000ff, %l3 = 0000228a
	ldd	[%i3+%o4],%l2		! %l2 = 00000000ff000000 00000000164d9eff
!	Mem[0000000010181408] = ff6f8ce8 04c60eff, %l2 = ff000000, %l3 = 164d9eff
	ldda	[%i6+%o4]0x88,%l2	! %l2 = 0000000004c60eff 00000000ff6f8ce8
!	Mem[000000001004141c] = cf5e3aa8, %l4 = ad726a99, %l6 = 3a3f226d
	add	%i1,0x1c,%g1
	casa	[%g1]0x80,%l4,%l6	! %l6 = 00000000cf5e3aa8

p0_label_65:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 000000ff, %l4 = 00000000ad726a99
	swapa	[%i2+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	%l6 = 00000000cf5e3aa8, Mem[0000000010041400] = fe918a22
	stha	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = fe913aa8
!	Mem[0000000010141408] = ffc68d14, %l6 = 00000000cf5e3aa8
	swap	[%i5+%o4],%l6		! %l6 = 00000000ffc68d14
!	Mem[0000000010101418] = 91c6e9f5, %l3 = 00000000ff6f8ce8, %asi = 80
	swapa	[%i4+0x018]%asi,%l3	! %l3 = 0000000091c6e9f5
!	%l7 = 7771bc409ec65758, Mem[0000000010041420] = 3bbfd9a0, %asi = 80
	stha	%l7,[%i1+0x020]%asi	! Mem[0000000010041420] = 5758d9a0
!	%f25 = 148dc691, Mem[0000000030141408] = 00000000
	sta	%f25,[%i5+%o4]0x89	! Mem[0000000030141408] = 148dc691
!	%l6 = ffc68d14, %l7 = 9ec65758, Mem[0000000010081400] = 08d72571 56fffb66
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = ffc68d14 9ec65758
!	%f16 = 000000ff 000000ff, Mem[0000000010041418] = dc514d59 cf5e3aa8, %asi = 80
	stda	%f16,[%i1+0x018]%asi	! Mem[0000000010041418] = 000000ff 000000ff
!	%l2 = 04c60eff, %l3 = 91c6e9f5, Mem[0000000010141438] = ff000000 7b597bd3, %asi = 80
	stda	%l2,[%i5+0x038]%asi	! Mem[0000000010141438] = 04c60eff 91c6e9f5
!	Mem[0000000010101400] = 000000ff, %l5 = 000000000000000e
	swapa	[%i4+%g0]0x80,%l5	! %l5 = 00000000000000ff

p0_label_66:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00ff0000, %l2 = 0000000004c60eff
	lduha	[%i4+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081400] = ffc68d14, %l3 = 0000000091c6e9f5
	lduba	[%i2+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	%l0 = 0000000000000008, %l7 = 7771bc409ec65758, %y  = ffffffff
	sdiv	%l0,%l7,%l0		! %l0 = 0000000000000002
	mov	%l0,%y			! %y = 00000002
!	%l6 = 00000000ffc68d14, %l5 = 00000000000000ff, %y  = 00000002
	udiv	%l6,%l5,%l1		! %l1 = 000000000302c956
	mov	%l0,%y			! %y = 00000002
!	Mem[0000000030001408] = ff05e520 c2fdcb24, %l0 = 00000002, %l1 = 0302c956
	ldda	[%i0+%o4]0x81,%l0	! %l0 = 00000000ff05e520 00000000c2fdcb24
!	Mem[00000000100c1428] = 5857c69e40bc7177, %f18 = 00ff0000 f44b9bff
	ldd	[%i3+0x028],%f18	! %f18 = 5857c69e 40bc7177
!	%f31 = ffffa3f3, %f20 = 000000ff, %f0  = 860ec60d
	fdivs	%f31,%f20,%f0 		! %f0  = ffffa3f3
!	Mem[0000000030101410] = d7080000, %l1 = 00000000c2fdcb24
	lduha	[%i4+%o5]0x81,%l1	! %l1 = 000000000000d708
!	Mem[0000000010101410] = ff000000, %l7 = 7771bc409ec65758
	lduha	[%i4+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081428] = 7771bc409ec65758, %l0 = 00000000ff05e520
	ldx	[%i2+0x028],%l0		! %l0 = 7771bc409ec65758

p0_label_67:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = ff000000, %l0 = 000000009ec65758
	swapa	[%i5+%g0]0x81,%l0	! %l0 = 00000000ff000000
!	%l1 = 000000000000d708, Mem[0000000010101408] = 0000ff00
	stha	%l1,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000d708
!	Mem[0000000030081400] = 164d08d7, %l2 = 00000000000000ff
	swapa	[%i2+%g0]0x89,%l2	! %l2 = 00000000164d08d7
!	%l3 = 00000000000000ff, Mem[0000000010181400] = 59a809047a55d708
	stxa	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000000000ff
!	Mem[0000000010081400] = ffc68d14, %l7 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	%l3 = 00000000000000ff, %l7 = 00000000000000ff, %l2 = 00000000164d08d7
	udivx	%l3,%l7,%l2		! %l2 = 0000000000000001
!	Mem[00000000100c1400] = 0dc60e86, %l2 = 0000000000000001
	swapa	[%i3+%g0]0x88,%l2	! %l2 = 000000000dc60e86
!	Mem[0000000010181420] = ff9b4bf4, %l1 = 000000000000d708
	swap	[%i6+0x020],%l1		! %l1 = 00000000ff9b4bf4
!	%f10 = 590ec604 e88c6fff, %l0 = 00000000ff000000
!	Mem[0000000030081438] = 3cf7833a0a2caa23
	add	%i2,0x038,%g1
	stda	%f10,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030081438] = 3cf7833a0a2caa23
!	%l7 = 00000000000000ff, Mem[0000000020800041] = ff1565a8, %asi = 80
	stba	%l7,[%o1+0x041]%asi	! Mem[0000000020800040] = ffff65a8

p0_label_68:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 7fffd1d8, %l0 = 00000000ff000000
	ldsh	[%o2+%g0],%l0		! %l0 = 0000000000007fff
!	Mem[0000000030041410] = ff9b4bf4, %l4 = 00000000000000ff
	lduha	[%i1+%o5]0x81,%l4	! %l4 = 000000000000ff9b
!	Mem[0000000010141408] = cf5e3aa8f44b4200, %f14 = 00000000 30527c13
	ldda	[%i5+%o4]0x80,%f14	! %f14 = cf5e3aa8 f44b4200
!	Mem[0000000010001428] = 00000076ad726a99, %l4 = 000000000000ff9b
	ldx	[%i0+0x028],%l4		! %l4 = 00000076ad726a99
!	Mem[0000000010141400] = 000000ff, %l0 = 0000000000007fff, %asi = 80
	ldsba	[%i5+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = ff0000000dc60e86, %f28 = 08d72571 56fffb66
	ldda	[%i2+%g0]0x81,%f28	! %f28 = ff000000 0dc60e86
!	%f28 = ff000000, %f18 = 5857c69e, %f14 = cf5e3aa8 f44b4200
	fsmuld	%f28,%f18,%f14		! %f14 = cafaf8d3 c0000000
!	Mem[0000000030181410] = 05692f4b0000ffff, %f18 = 5857c69e 40bc7177
	ldda	[%i6+%o5]0x89,%f18	! %f18 = 05692f4b 0000ffff
!	Mem[0000000010101400] = 0e000000, %l5 = 00000000000000ff
	lduha	[%i4+%g0]0x88,%l5	! %l5 = 0000000000000000
!	%f27 = 536f8ce8, %f1  = 164d9eff, %f22 = 228a91fe f44b4200
	fsmuld	%f27,%f1 ,%f22		! %f22 = 3d480d13 ab916300

p0_label_69:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181436] = 78d21b4d, %l3 = 00000000000000ff
	ldstuba	[%i6+0x036]%asi,%l3	! %l3 = 000000000000001b
!	Mem[0000000021800180] = 226d5728, %l1 = 00000000ff9b4bf4
	ldstub	[%o3+0x180],%l1		! %l1 = 0000000000000022
!	Mem[0000000010181410] = ff27fc92, %l7 = 00000000000000ff
	swapa	[%i6+%o5]0x88,%l7	! %l7 = 00000000ff27fc92
!	%l2 = 000000000dc60e86, Mem[00000000201c0000] = 42ff8148, %asi = 80
	stba	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 86ff8148
!	%l2 = 000000000dc60e86, Mem[00000000100c1400] = 00000001
	stwa	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0dc60e86
!	Mem[000000001000141c] = 5784e9fb, %l0 = 0000000000000000
	swap	[%i0+0x01c],%l0		! %l0 = 000000005784e9fb
!	%l0 = 000000005784e9fb, imm = fffffffffffffd7a, %l7 = 00000000ff27fc92
	xnor	%l0,-0x286,%l7		! %l7 = 000000005784eb7e
!	Mem[0000000010081400] = ffc68d14, %l7 = 000000005784eb7e
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 00000000ffc68d14
!	Mem[0000000030141410] = 21465995, %l3 = 000000000000001b
	swapa	[%i5+%o5]0x89,%l3	! %l3 = 0000000021465995
!	Mem[0000000010001410] = ffffffff, %l0 = 000000005784e9fb
	ldstuba	[%i0+%o5]0x88,%l0	! %l0 = 00000000000000ff

p0_label_70:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 1b00000054ab0014, %l1 = 0000000000000022
	ldxa	[%i5+%o5]0x81,%l1	! %l1 = 1b00000054ab0014
!	Mem[0000000010101434] = 311f598d, %l4 = 00000076ad726a99, %asi = 80
	lduha	[%i4+0x034]%asi,%l4	! %l4 = 000000000000311f
!	Mem[0000000030001400] = 00000000, %l3 = 0000000021465995
	lduba	[%i0+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101410] = 148dc1f1ff000000, %l7 = 00000000ffc68d14
	ldxa	[%i4+%o5]0x88,%l7	! %l7 = 148dc1f1ff000000
!	Mem[0000000030081400] = 000000ff, %f30 = 5e04974a
	lda	[%i2+%g0]0x89,%f30	! %f30 = 000000ff
!	Mem[00000000100c1408] = ff000000, %l1 = 1b00000054ab0014
	ldsha	[%i3+%o4]0x80,%l1	! %l1 = ffffffffffffff00
!	Mem[000000001014141f] = 2614255b, %l4 = 000000000000311f
	ldsb	[%i5+0x01f],%l4		! %l4 = 000000000000005b
!	Mem[0000000010141410] = 08d72571, %l4 = 000000000000005b
	ldswa	[%i5+%o5]0x80,%l4	! %l4 = 0000000008d72571
!	Mem[0000000030181410] = ffff0000 4b2f6905, %l6 = ffc68d14, %l7 = ff000000
	ldda	[%i6+%o5]0x81,%l6	! %l6 = 00000000ffff0000 000000004b2f6905
!	Mem[0000000030081408] = 00000000, %l2 = 000000000dc60e86
	lduba	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000000

p0_label_71:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 164d9eff, %l3 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l3	! %l3 = 00000000164d9eff
!	%f14 = cafaf8d3, %f11 = e88c6fff, %f8  = 000040bc
	fdivs	%f14,%f11,%f8 		! %f8  = 21e4becb
!	%f30 = 000000ff ffffa3f3, Mem[0000000010081408] = 00000000 461deaff
	stda	%f30,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000ff ffffa3f3
!	%l5 = 0000000000000000, Mem[00000000300c1408] = adc0fa3800000000
	stxa	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000000000000
!	%f2  = ffea1d46 ff27fc92, Mem[00000000300c1408] = 00000000 00000000
	stda	%f2 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffea1d46 ff27fc92
!	%l5 = 0000000000000000, Mem[00000000100c1400] = 0dc60e86
	stwa	%l5,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	%l6 = 00000000ffff0000, Mem[0000000030081400] = ff000000
	stba	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	Mem[0000000030181400] = ff000000 ff2f0058 00000e86 745e730f
!	%f0  = ffffa3f3 164d9eff ffea1d46 ff27fc92
!	%f4  = 000000ff 00000043 0000004a 2dddfd9b
!	%f8  = 21e4becb 000000ff 590ec604 e88c6fff
!	%f12 = 00000000 000000ff cafaf8d3 c0000000
	stda	%f0 ,[%i6+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030181400
!	%l0 = 000000ff, %l1 = ffffff00, Mem[0000000030181400] = 164d9eff ffffa3f3
	stda	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff ffffff00
!	Mem[0000000021800140] = ff7606f8, %l6 = 00000000ffff0000
	ldstuba	[%o3+0x140]%asi,%l6	! %l6 = 00000000000000ff

p0_label_72:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 0000000000000000, %f20 = 000000ff f1c18d14
	ldda	[%i2+%o4]0x89,%f20	! %f20 = 00000000 00000000
!	Mem[0000000010041400] = fe913aa8, %l4 = 0000000008d72571
	lduha	[%i1+%g0]0x88,%l4	! %l4 = 0000000000003aa8
!	Mem[000000001010141c] = f44b4200, %l1 = ffffffffffffff00, %asi = 80
	lduwa	[%i4+0x01c]%asi,%l1	! %l1 = 00000000f44b4200
!	Mem[0000000010041410] = 0dc60e86, %l5 = 0000000000000000
	ldsba	[%i1+%o5]0x88,%l5	! %l5 = ffffffffffffff86
!	Mem[00000000211c0000] = 7fffd1d8, %l3 = 00000000164d9eff
	ldsh	[%o2+%g0],%l3		! %l3 = 0000000000007fff
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000010181400] = 000000ff, %f21 = 00000000
	lda	[%i6+%g0]0x88,%f21	! %f21 = 000000ff
!	Mem[0000000021800100] = 50ffb2c8, %l0 = 00000000000000ff
	lduh	[%o3+0x100],%l0		! %l0 = 00000000000050ff
!	Mem[0000000030101408] = 7f24f32c, %l2 = 0000000000000000
	ldswa	[%i4+%o4]0x89,%l2	! %l2 = 000000007f24f32c
!	Mem[0000000030141400] = 5857c69e, %l6 = 00000000000000ff
	ldsba	[%i5+%g0]0x89,%l6	! %l6 = ffffffffffffff9e
!	Mem[0000000010181411] = ff000000, %l0 = 00000000000050ff, %asi = 80
	ldsba	[%i6+0x011]%asi,%l0	! %l0 = 0000000000000000

p0_label_73:
!	Starting 10 instruction Store Burst
!	%f6  = 0000004a 2dddfd9b, Mem[00000000100c1400] = 00000000 ff9e4d16
	stda	%f6 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000004a 2dddfd9b
!	%f1  = 164d9eff, Mem[0000000010081408] = 000000ff
	st	%f1 ,[%i2+%o4]		! Mem[0000000010081408] = 164d9eff
!	%l2 = 000000007f24f32c, Mem[0000000030081400] = 00000000
	stba	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000002c
!	Mem[00000000100c143c] = 000000ff, %l1 = f44b4200, %l0 = 00000000
	add	%i3,0x3c,%g1
	casa	[%g1]0x80,%l1,%l0	! %l0 = 00000000000000ff
!	Mem[000000001004140e] = 000000ff, %l6 = ffffffffffffff9e
	ldstuba	[%i1+0x00e]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = 860ec60d5e04974a, %l6 = 0000000000000000, %l2 = 000000007f24f32c
	add	%i1,0x10,%g1
	casxa	[%g1]0x80,%l6,%l2	! %l2 = 860ec60d5e04974a
!	%f12 = 00000000, Mem[0000000010001410] = ffffffff
	sta	%f12,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	Mem[0000000010181408] = 04c60eff, %l1 = 00000000f44b4200
	swapa	[%i6+%o4]0x88,%l1	! %l1 = 0000000004c60eff
!	%l0 = 000000ff, %l1 = 04c60eff, Mem[0000000010081428] = 7771bc40 9ec65758
	std	%l0,[%i2+0x028]		! Mem[0000000010081428] = 000000ff 04c60eff
!	%l0 = 00000000000000ff, Mem[0000000030101408] = 7f24f32c
	stba	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 7f24f3ff

p0_label_74:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 5784eb7e, %l6 = 0000000000000000
	lduba	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000057
!	Mem[00000000201c0000] = 86ff8148, %l6 = 0000000000000057, %asi = 80
	lduba	[%o0+0x000]%asi,%l6	! %l6 = 0000000000000086
!	Mem[0000000010041410] = 860ec60d5e04974a, %f10 = 590ec604 e88c6fff
	ldda	[%i1+%o5]0x80,%f10	! %f10 = 860ec60d 5e04974a
!	Mem[0000000010081410] = 420015de5612554c, %l6 = 0000000000000086
	ldxa	[%i2+%o5]0x88,%l6	! %l6 = 420015de5612554c
!	Mem[0000000010141408] = a83a5ecf, %l1 = 0000000004c60eff
	ldsha	[%i5+%o4]0x88,%l1	! %l1 = 0000000000005ecf
!	%l4 = 0000000000003aa8, %l1 = 0000000000005ecf, %l7 = 000000004b2f6905
	subc	%l4,%l1,%l7		! %l7 = ffffffffffffdbd9
!	Mem[0000000010041408] = ffffffff, %f2  = ffea1d46
	lda	[%i1+%o4]0x88,%f2 	! %f2 = ffffffff
!	Mem[0000000010001408] = 00000000 91c68d14, %l0 = 000000ff, %l1 = 00005ecf, %asi = 80
	ldda	[%i0+0x008]%asi,%l0	! %l0 = 0000000000000000 0000000091c68d14
!	Mem[0000000030141400] = 9ec65758, %l0 = 0000000000000000
	lduwa	[%i5+%g0]0x81,%l0	! %l0 = 000000009ec65758
!	Mem[0000000010081400] = 5857c69e7eeb8457, %l6 = 420015de5612554c
	ldxa	[%i2+%g0]0x88,%l6	! %l6 = 5857c69e7eeb8457

p0_label_75:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 00000000, %l2 = 000000005e04974a
	swapa	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000000
!	%f12 = 00000000, Mem[0000000010141410] = 7125d708
	sta	%f12,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	Mem[0000000010181400] = ff00000000000000, %l0 = 000000009ec65758, %l4 = 0000000000003aa8
	casxa	[%i6]0x80,%l0,%l4	! %l4 = ff00000000000000
!	%l4 = ff00000000000000, Mem[00000000100c1410] = ff00ffff
	stwa	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	%f31 = ffffa3f3, Mem[0000000030081400] = 2c000000
	sta	%f31,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffa3f3
!	Mem[00000000300c1410] = 38fac0ad, %l3 = 0000000000007fff
	ldstuba	[%i3+%o5]0x89,%l3	! %l3 = 00000000000000ad
!	%l2 = 0000000000000000, Mem[0000000010141400] = ff000000
	stba	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = ff000000
!	Mem[0000000010001410] = 00000000, %l5 = 00000000ffffff86
	swapa	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000000
!	%l6 = 5857c69e7eeb8457, Mem[0000000010041410] = 860ec60d
	stha	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 8457c60d
!	Mem[0000000030181410] = 43000000, %l6 = 000000007eeb8457
	swapa	[%i6+%o5]0x81,%l6	! %l6 = 0000000043000000

p0_label_76:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l7 = ffffffffffffdbd9
	lduha	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000000
!	%f0  = ffffa3f3, %f0  = ffffa3f3, %f13 = 000000ff
	fsubs	%f0 ,%f0 ,%f13		! %f13 = ffffa3f3
!	Mem[0000000010041400] = a83a91fe, %l1 = 0000000091c68d14
	ldsw	[%i1+%g0],%l1		! %l1 = ffffffffa83a91fe
!	Mem[0000000010041404] = 4d9f0000, %l0 = 000000009ec65758
	ldsb	[%i1+0x004],%l0		! %l0 = 000000000000004d
!	Mem[0000000010181408] = 00424bf4, %l4 = ff00000000000000
	ldsha	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000042
!	Mem[0000000030001410] = 4a000000, %l2 = 0000000000000000
	lduba	[%i0+%o5]0x81,%l2	! %l2 = 000000000000004a
!	Mem[00000000201c0001] = 86ff8148, %l6 = 0000000043000000
	ldub	[%o0+0x001],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010101411] = 000000ff, %l0 = 000000000000004d
	ldub	[%i4+0x011],%l0		! %l0 = 0000000000000000
!	Mem[0000000030181408] = ff27fc92, %l4 = 0000000000000042
	lduba	[%i6+%o4]0x89,%l4	! %l4 = 0000000000000092
!	Mem[00000000300c1400] = 000000005e04974a, %l0 = 0000000000000000
	ldxa	[%i3+%g0]0x89,%l0	! %l0 = 000000005e04974a

p0_label_77:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 4a97045e 00000000 92fc27ff 461deaff
!	%f0  = ffffa3f3 164d9eff ffffffff ff27fc92
!	%f4  = 000000ff 00000043 0000004a 2dddfd9b
!	%f8  = 21e4becb 000000ff 860ec60d 5e04974a
!	%f12 = 00000000 ffffa3f3 cafaf8d3 c0000000
	stda	%f0 ,[%i3+%g0]ASI_COMMIT_S	! Block Store to 00000000300c1400
	membar	#Sync			! Added by membar checker (17)
!	%l6 = 00000000000000ff, Mem[00000000100c1400] = 2dddfd9b
	stha	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 2ddd00ff
!	%l0 = 000000005e04974a, Mem[0000000030001400] = 00000000
	stba	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 4a000000
!	%l3 = 00000000000000ad, %l4 = 0000000000000092, %l5 = 0000000000000000
	add	%l3,%l4,%l5		! %l5 = 000000000000013f
!	Mem[0000000010101410] = 000000ff, %l5 = 000000000000013f
	swapa	[%i4+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181418] = 00000059, %l6 = 000000ff, %l7 = 00000000
	add	%i6,0x18,%g1
	casa	[%g1]0x80,%l6,%l7	! %l7 = 0000000000000059
!	Mem[00000000100c1424] = 000000ff, %l5 = 00000000000000ff
	swap	[%i3+0x024],%l5		! %l5 = 00000000000000ff
!	%f12 = 00000000 ffffa3f3, %l7 = 0000000000000059
!	Mem[0000000010141408] = cf5e3aa8f44b4200
	add	%i5,0x008,%g1
	stda	%f12,[%g1+%l7]ASI_PST16_P ! Mem[0000000010141408] = 00003aa8f44ba3f3
!	%f31 = ffffa3f3, Mem[0000000030141408] = 91c68d14
	sta	%f31,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffa3f3
!	%f16 = 000000ff, Mem[0000000030001400] = 0000004a
	sta	%f16,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff

p0_label_78:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = f44b9bff, %f20 = 00000000
	lda	[%i1+%o5]0x89,%f20	! %f20 = f44b9bff
!	Mem[00000000100c1408] = 000000ff, %l5 = 00000000000000ff
	lduha	[%i3+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041410] = 8457c60d 5e04974a, %l2 = 0000004a, %l3 = 000000ad
	ldd	[%i1+%o5],%l2		! %l2 = 000000008457c60d 000000005e04974a
!	Mem[0000000010101410] = 3f010000, %l6 = 00000000000000ff
	lduha	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = ff0000ff, %l3 = 000000005e04974a
	lduba	[%i4+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000211c0001] = 7fffd1d8, %l0 = 000000005e04974a, %asi = 80
	ldsba	[%o2+0x001]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000300c1410] = 000000ff, %f3  = ff27fc92
	lda	[%i3+%o5]0x81,%f3 	! %f3 = 000000ff
!	Mem[0000000010001410] = 86ffffff, %l5 = 00000000000000ff
	ldsba	[%i0+%o5]0x80,%l5	! %l5 = ffffffffffffff86
!	Mem[0000000010101415] = f1c18d14, %l7 = 0000000000000059
	ldub	[%i4+0x015],%l7		! %l7 = 00000000000000c1
!	Mem[0000000021800141] = ff7606f8, %l4 = 0000000000000092, %asi = 80
	lduba	[%o3+0x141]%asi,%l4	! %l4 = 0000000000000076

p0_label_79:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 00000000, %l6 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000000
!	%l5 = ffffffffffffff86, imm = 0000000000000321, %l6 = 0000000000000000
	sub	%l5,0x321,%l6		! %l6 = fffffffffffffc65
!	Mem[00000000100c1410] = 00000000, %l3 = 00000000000000ff
	swapa	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%l5 = ffffffffffffff86, Mem[0000000030101408] = 860ec60d7f24f3ff
	stxa	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = ffffffffffffff86
!	%l4 = 0000000000000076, Mem[0000000030181410] = 7eeb8457
	stba	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 76eb8457
!	%l2 = 8457c60d, %l3 = 00000000, Mem[0000000010141428] = 71d2cd5e 4f182537
	std	%l2,[%i5+0x028]		! Mem[0000000010141428] = 8457c60d 00000000
!	Mem[0000000010181408] = f44b4200, %l0 = 00000000ffffffff
	swapa	[%i6+%o4]0x88,%l0	! %l0 = 00000000f44b4200
!	%l1 = ffffffffa83a91fe, Mem[00000000100c1400] = ff00dd2d4a000000
	stxa	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffffffffa83a91fe
!	%l2 = 000000008457c60d, Mem[0000000010141408] = 00003aa8
	stwa	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 8457c60d
!	%l5 = ffffffffffffff86, Mem[0000000030041410] = ff9b4bf4
	stwa	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = ffffff86

p0_label_80:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = f3a34bf40dc65784, %l1 = ffffffffa83a91fe
	ldxa	[%i5+%o4]0x88,%l1	! %l1 = f3a34bf40dc65784
!	Mem[0000000030041410] = 86ffffff, %l5 = ffffffffffffff86
	ldsba	[%i1+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030181400] = 000000ff, %l6 = fffffffffffffc65
	lduha	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141408] = 8457c60d, %l4 = 0000000000000076
	ldsha	[%i5+%o4]0x80,%l4	! %l4 = ffffffffffff8457
!	Mem[0000000020800040] = ffff65a8, %l1 = f3a34bf40dc65784, %asi = 80
	ldsba	[%o1+0x040]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030081400] = 860ec60df3a3ffff, %l6 = 00000000000000ff
	ldxa	[%i2+%g0]0x89,%l6	! %l6 = 860ec60df3a3ffff
!	Code Fragment 3, seed = 364492
p0_fragment_5:
!	%l0 = 00000000f44b4200
	setx	0xddb8713f03e085c6,%g7,%l0 ! %l0 = ddb8713f03e085c6
!	%l1 = ffffffffffffffff
	setx	0x2e15dc45acc1c7f1,%g7,%l1 ! %l1 = 2e15dc45acc1c7f1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ddb8713f03e085c6
	setx	0xec98dc668aab0e2c,%g7,%l0 ! %l0 = ec98dc668aab0e2c
!	%l1 = 2e15dc45acc1c7f1
	setx	0xdfc71a76327a5b77,%g7,%l1 ! %l1 = dfc71a76327a5b77
p0_fragment_5_end:
!	Mem[0000000010101408] = 0000d708, %l1 = dfc71a76327a5b77
	ldsba	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000008
!	Mem[0000000030141408] = ffffa3f3 ff726a99, %l4 = ffff8457, %l5 = ffffffff
	ldda	[%i5+%o4]0x81,%l4	! %l4 = 00000000ffffa3f3 00000000ff726a99
!	Mem[0000000030081400] = 860ec60df3a3ffff, %f12 = 00000000 ffffa3f3
	ldda	[%i2+%g0]0x89,%f12	! %f12 = 860ec60d f3a3ffff

p0_label_81:
!	Starting 10 instruction Store Burst
!	%f14 = cafaf8d3 c0000000, Mem[00000000300c1408] = ffffffff 92fc27ff
	stda	%f14,[%i3+%o4]0x89	! Mem[00000000300c1408] = cafaf8d3 c0000000
!	%f2  = ffffffff 000000ff, %l5 = 00000000ff726a99
!	Mem[0000000030141400] = 9ec65758148dc691
	stda	%f2,[%i5+%l5]ASI_PST16_SL ! Mem[0000000030141400] = ff005758148dffff
!	%l4 = 00000000ffffa3f3, Mem[000000001004143a] = 09ae6b2a
	stb	%l4,[%i1+0x03a]		! Mem[0000000010041438] = 09aef32a
!	Mem[0000000030181408] = ff27fc92, %l6 = 860ec60df3a3ffff
	ldstuba	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000092
!	Mem[00000000300c1408] = c0000000, %l6 = 0000000000000092
	ldstuba	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	%f24 = 7fffffff, Mem[0000000010041414] = 5e04974a
	st	%f24,[%i1+0x014]	! Mem[0000000010041414] = 7fffffff
!	%f12 = 860ec60d f3a3ffff, Mem[0000000030081408] = 00000000 00000000
	stda	%f12,[%i2+%o4]0x81	! Mem[0000000030081408] = 860ec60d f3a3ffff
!	Mem[0000000010041400] = a83a91fe, %l5 = 00000000ff726a99
	swapa	[%i1+%g0]0x80,%l5	! %l5 = 00000000a83a91fe
!	%l7 = 00000000000000c1, Mem[0000000010101408] = 0000d708
	stba	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000d7c1
!	%l2 = 8457c60d, %l3 = 00000000, Mem[0000000010181400] = ff000000 00000000, %asi = 80
	stda	%l2,[%i6+0x000]%asi	! Mem[0000000010181400] = 8457c60d 00000000

p0_label_82:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 996a72ad, %l1 = 0000000000000008
	ldsha	[%i1+%g0]0x81,%l1	! %l1 = ffffffffffff996a
!	Mem[000000001000141c] = 00000000, %l6 = 0000000000000000
	ldsw	[%i0+0x01c],%l6		! %l6 = 0000000000000000
!	Mem[0000000010101400] = 0000000e, %l3 = 0000000000000000
	lduba	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141400] = ff005758, %l6 = 0000000000000000
	lduba	[%i5+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181408] = ff27fcff, %l5 = 00000000a83a91fe
	ldsha	[%i6+%o4]0x89,%l5	! %l5 = fffffffffffffcff
!	Mem[0000000030181410] = 000000ff5784eb76, %f8  = 21e4becb 000000ff
	ldda	[%i6+%o5]0x89,%f8 	! %f8  = 000000ff 5784eb76
!	%l3 = 0000000000000000, immd = fffffbdf, %y  = 00000002
	sdiv	%l3,-0x421,%l1		! %l1 = ffffffffff83ff08
	mov	%l0,%y			! %y = 8aab0e2c
!	Mem[0000000010141410] = 00000000, %l6 = 00000000000000ff
	ldsha	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081410] = 4c551256, %l2 = 000000008457c60d
	lduha	[%i2+%o5]0x80,%l2	! %l2 = 0000000000004c55
!	%l7 = 00000000000000c1, Mem[00000000300c1400] = f3a3ffff
	stba	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = f3a3ffc1

p0_label_83:
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffff83ff08, Mem[0000000010081400] = 7eeb8457
	stba	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = 7eeb8408
!	Mem[000000001010140c] = f44b9bff, %l7 = 00000000000000c1, %asi = 80
	swapa	[%i4+0x00c]%asi,%l7	! %l7 = 00000000f44b9bff
!	%l3 = 0000000000000000, Mem[0000000030141410] = 1b000000
	stwa	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	Mem[000000001004142c] = 3f5f0d2e, %l4 = 00000000ffffa3f3
	swap	[%i1+0x02c],%l4		! %l4 = 000000003f5f0d2e
!	Mem[0000000030001408] = ff05e520, %l2 = 0000000000004c55
	ldstuba	[%i0+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	%f14 = cafaf8d3 c0000000, Mem[0000000030181400] = 000000ff ffffff00
	stda	%f14,[%i6+%g0]0x89	! Mem[0000000030181400] = cafaf8d3 c0000000
!	%l0 = ec98dc668aab0e2c, Mem[0000000030041408] = 00424bf4148d9bff
	stxa	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = ec98dc668aab0e2c
!	Mem[0000000030081408] = 860ec60d, %l1 = ffffffffff83ff08
	ldstuba	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000086
!	Mem[0000000010041400] = 996a72ff, %l2 = 00000000000000ff
	swapa	[%i1+%g0]0x88,%l2	! %l2 = 00000000996a72ff
!	Mem[0000000010041418] = 000000ff000000ff, %l2 = 00000000996a72ff, %l3 = 0000000000000000
	add	%i1,0x18,%g1
	casxa	[%g1]0x80,%l2,%l3	! %l3 = 000000ff000000ff

p0_label_84:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ff0000ff, %l1 = 0000000000000086
	lduha	[%i4+%g0]0x81,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010041408] = ffffffff, %l3 = 000000ff000000ff
	lduba	[%i1+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%l6 = 0000000000000000, %l5 = fffffffffffffcff, %y  = 8aab0e2c
	udiv	%l6,%l5,%l5		! %l5 = 000000008aab0fcc
	mov	%l0,%y			! %y = 8aab0e2c
!	Mem[0000000030001410] = 0000004a, %l4 = 000000003f5f0d2e
	lduba	[%i0+%o5]0x89,%l4	! %l4 = 000000000000004a
!	Mem[0000000030001408] = ff05e520, %l2 = 00000000996a72ff
	lduba	[%i0+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001400] = 000000ff, %l7 = 00000000f44b9bff
	ldswa	[%i0+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1400] = ffffffff, %l0 = ec98dc668aab0e2c
	lduh	[%i3+%g0],%l0		! %l0 = 000000000000ffff
!	Mem[000000001004141c] = 000000ff, %f31 = ffffa3f3
	ld	[%i1+0x01c],%f31	! %f31 = 000000ff
!	Mem[0000000010041400] = ff000000 4d9f0000, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 00000000ff000000 000000004d9f0000
!	Mem[0000000030141408] = f3a3ffff, %l5 = 000000008aab0fcc
	lduha	[%i5+%o4]0x89,%l5	! %l5 = 000000000000ffff

p0_label_85:
!	Starting 10 instruction Store Burst
!	Mem[000000001010140c] = 000000c1, %l7 = 4d9f0000, %l0 = 0000ffff
	add	%i4,0x0c,%g1
	casa	[%g1]0x80,%l7,%l0	! %l0 = 00000000000000c1
!	Mem[0000000010101427] = 0000000e, %l4 = 000000000000004a
	ldstuba	[%i4+0x027]%asi,%l4	! %l4 = 000000000000000e
!	Code Fragment 4, seed = 554413
p0_fragment_6:
!	%l0 = 00000000000000c1
	setx	0x50c4d945f2da07be,%g7,%l0 ! %l0 = 50c4d945f2da07be
!	%l1 = 000000000000ff00
	setx	0x799b83800a250869,%g7,%l1 ! %l1 = 799b83800a250869
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 50c4d945f2da07be
	setx	0x0faa33e89c0dc524,%g7,%l0 ! %l0 = 0faa33e89c0dc524
!	%l1 = 799b83800a250869
	setx	0xf29090c145e4c0ef,%g7,%l1 ! %l1 = f29090c145e4c0ef
p0_fragment_6_end:
!	Mem[0000000021800140] = ff7606f8, %l2 = 00000000000000ff
	ldstub	[%o3+0x140],%l2		! %l2 = 00000000000000ff
!	%l7 = 000000004d9f0000, Mem[00000000201c0000] = 86ff8148
	stb	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 00ff8148
!	%f29 = 0dc60e86, Mem[0000000030181408] = ff27fcff
	sta	%f29,[%i6+%o4]0x89	! Mem[0000000030181408] = 0dc60e86
!	%l4 = 0000000e, %l5 = 0000ffff, Mem[0000000010181410] = ff000000 ffffffff
	stda	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000e 0000ffff
!	%l7 = 000000004d9f0000, Mem[00000000100c1408] = ff000000
	stba	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	Mem[0000000010041410] = 0dc65784, %l1 = f29090c145e4c0ef
	ldstuba	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000084
!	Mem[0000000010181428] = 524878be2233092d, %l6 = 00000000ff000000, %l3 = 00000000000000ff
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l6,%l3	! %l3 = 524878be2233092d

p0_label_86:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = c1ffa3f3, %l5 = 000000000000ffff
	lduwa	[%i3+%g0]0x81,%l5	! %l5 = 00000000c1ffa3f3
!	Mem[0000000010001400] = ff424bf461a993b5, %f14 = cafaf8d3 c0000000, %asi = 80
	ldda	[%i0+0x000]%asi,%f14	! %f14 = ff424bf4 61a993b5
!	Mem[00000000300c1400] = f3a3ffc1, %l0 = 0faa33e89c0dc524
	lduwa	[%i3+%g0]0x89,%l0	! %l0 = 00000000f3a3ffc1
!	Mem[0000000030081408] = ff0ec60df3a3ffff, %f18 = 05692f4b 0000ffff
	ldda	[%i2+%o4]0x81,%f18	! %f18 = ff0ec60d f3a3ffff
!	Mem[0000000030101408] = ffffff86, %l3 = 524878be2233092d
	ldswa	[%i4+%o4]0x89,%l3	! %l3 = ffffffffffffff86
!	Mem[0000000030141410] = 0000000054ab0014, %f30 = 000000ff 000000ff
	ldda	[%i5+%o5]0x81,%f30	! %f30 = 00000000 54ab0014
!	Mem[0000000030041410] = 86ffffff, %l2 = 00000000000000ff
	lduha	[%i1+%o5]0x89,%l2	! %l2 = 000000000000ffff
!	Mem[00000000300c1410] = ff000000, %l5 = 00000000c1ffa3f3
	lduba	[%i3+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081410] = 996a72ad, %l0 = 00000000f3a3ffc1
	ldswa	[%i2+%o5]0x81,%l0	! %l0 = ffffffff996a72ad
!	%l0 = ffffffff996a72ad, %l2 = 000000000000ffff, %l5 = 0000000000000000
	orn	%l0,%l2,%l5		! %l5 = ffffffffffff72ad

p0_label_87:
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000000e, Mem[0000000030081408] = ff0ec60d
	stha	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 000ec60d
!	%l7 = 000000004d9f0000, Mem[00000000211c0000] = 7fffd1d8
	sth	%l7,[%o2+%g0]		! Mem[00000000211c0000] = 0000d1d8
!	%f25 = 148dc691, Mem[0000000010001400] = ff424bf4
	sta	%f25,[%i0+%g0]0x80	! Mem[0000000010001400] = 148dc691
!	%f8  = 000000ff 5784eb76, %l5 = ffffffffffff72ad
!	Mem[0000000030141410] = 0000000054ab0014
	add	%i5,0x010,%g1
	stda	%f8,[%g1+%l5]ASI_PST8_S ! Mem[0000000030141410] = 0000000057840076
!	Mem[0000000030001410] = 4a000000, %l5 = ffffffffffff72ad
	ldsha	[%i0+%o5]0x81,%l5	! %l5 = 0000000000004a00
!	%f29 = 0dc60e86, Mem[0000000010041438] = 09aef32a
	sta	%f29,[%i1+0x038]%asi	! Mem[0000000010041438] = 0dc60e86
!	%f6  = 0000004a 2dddfd9b, Mem[0000000010001408] = 00000000 148dc691
	stda	%f6 ,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000004a 2dddfd9b
!	Mem[000000001010142c] = 536f8ce8, %l5 = 00004a00, %l4 = 0000000e
	add	%i4,0x2c,%g1
	casa	[%g1]0x80,%l5,%l4	! %l4 = 00000000536f8ce8
!	%l3 = ffffffffffffff86, imm = fffffffffffff98f, %l2 = 000000000000ffff
	xnor	%l3,-0x671,%l2		! %l2 = fffffffffffff9f6
!	%l2 = fffff9f6, %l3 = ffffff86, Mem[0000000010181408] = ffffffff e88c6fff
	stda	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = fffff9f6 ffffff86

p0_label_88:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 000000ff, %l6 = 00000000ff000000
	lduwa	[%i5+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141418] = 0dcf6fd22614255b, %l6 = 00000000000000ff, %asi = 80
	ldxa	[%i5+0x018]%asi,%l6	! %l6 = 0dcf6fd22614255b
!	Mem[00000000100c1400] = ffffffff, %l0 = ffffffff996a72ad
	lduba	[%i3+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030041400] = ad726a99, %l7 = 000000004d9f0000
	lduba	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000099
!	%f2  = ffffffff, %f1  = 164d9eff, %f9  = 5784eb76
	fdivs	%f2 ,%f1 ,%f9 		! %f9  = ffffffff
!	Mem[0000000010001410] = ffffff86, %l4 = 00000000536f8ce8
	ldswa	[%i0+%o5]0x88,%l4	! %l4 = ffffffffffffff86
!	Mem[0000000030081410] = ff000000 ad726a99, %l4 = ffffff86, %l5 = 00004a00
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 00000000ad726a99 00000000ff000000
!	Mem[0000000030041410] = ffffff86, %l2 = fffffffffffff9f6
	ldsba	[%i1+%o5]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010041400] = ff000000, %l5 = 00000000ff000000
	lduha	[%i1+%g0]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[0000000010181408] = f6f9ffff, %l4 = 00000000ad726a99
	ldswa	[%i6+%o4]0x88,%l4	! %l4 = fffffffff6f9ffff

p0_label_89:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 00000000, %l4 = 00000000f6f9ffff
	swapa	[%i5+%o5]0x80,%l4	! %l4 = 0000000000000000
!	%l0 = 00000000000000ff, Mem[00000000300c1410] = ff000000
	stha	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = ff0000ff
!	Mem[0000000010041400] = 000000ff, %l3 = 00000000ffffff86
	swapa	[%i1+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1424] = 000000ff, %l2 = 00000000ffffffff
	swap	[%i3+0x024],%l2		! %l2 = 00000000000000ff
!	%f25 = 148dc691, Mem[0000000010041408] = ffffffff
	sta	%f25,[%i1+%o4]0x88	! Mem[0000000010041408] = 148dc691
!	Mem[000000001004142c] = ffffa3f3, %l6 = 2614255b, %l5 = 0000ff00
	add	%i1,0x2c,%g1
	casa	[%g1]0x80,%l6,%l5	! %l5 = 00000000ffffa3f3
!	Mem[0000000030141408] = f3a3ffff, %l2 = 00000000000000ff
	swapa	[%i5+%o4]0x89,%l2	! %l2 = 00000000f3a3ffff
!	Mem[0000000030081400] = ffffa3f3, %l6 = 000000002614255b
	swapa	[%i2+%g0]0x81,%l6	! %l6 = 00000000ffffa3f3
!	%f28 = ff000000 0dc60e86, Mem[00000000100c1410] = ff000000 0000ffff
	stda	%f28,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff000000 0dc60e86
!	Mem[0000000010181420] = 0000d708, %l6 = ffffa3f3, %l6 = ffffa3f3
	add	%i6,0x20,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 000000000000d708

p0_label_90:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 000000ff5784eb76, %l1 = 0000000000000084
	ldxa	[%i6+%o5]0x89,%l1	! %l1 = 000000ff5784eb76
!	Mem[0000000030001408] = 20e505ff, %l3 = 00000000000000ff
	ldsha	[%i0+%o4]0x89,%l3	! %l3 = 00000000000005ff
!	Mem[0000000030001410] = 0000004a, %l2 = 00000000f3a3ffff
	ldswa	[%i0+%o5]0x89,%l2	! %l2 = 000000000000004a
!	Mem[0000000010041400] = 86ffffff, %l4 = 0000000000000000
	lduha	[%i1+%g0]0x80,%l4	! %l4 = 00000000000086ff
!	%f8  = 000000ff, %f10 = 860ec60d
	fstoi	%f8 ,%f10		! tt=0x22, %l0 = 0000000000000121
!	Mem[0000000010181424] = 26809d91, %l4 = 00000000000086ff
	lduh	[%i6+0x024],%l4		! %l4 = 0000000000002680
!	Mem[00000000201c0000] = 00ff8148, %l3 = 00000000000005ff, %asi = 80
	ldsba	[%o0+0x000]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001428] = 00000076ad726a99, %l3 = 0000000000000000, %asi = 80
	ldxa	[%i0+0x028]%asi,%l3	! %l3 = 00000076ad726a99
!	Mem[0000000020800000] = ff66f578, %l0 = 0000000000000121, %asi = 80
	lduha	[%o1+0x000]%asi,%l0	! %l0 = 000000000000ff66
!	Mem[0000000010181400] = 8457c60d, %l3 = 00000076ad726a99
	ldsba	[%i6+%g0]0x80,%l3	! %l3 = ffffffffffffff84

p0_label_91:
!	Starting 10 instruction Store Burst
!	%l6 = 0000d708, %l7 = 00000099, Mem[0000000030141408] = 000000ff 996a72ff
	stda	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000d708 00000099
!	Mem[0000000010081418] = ffca7184, %l6 = 000000000000d708
	swap	[%i2+0x018],%l6		! %l6 = 00000000ffca7184
!	Mem[0000000030101400] = ff0000ff, %l1 = 000000ff5784eb76
	ldstuba	[%i4+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181410] = 0e000000, %l4 = 0000000000002680
	ldstuba	[%i6+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141418] = 0dcf6fd2, %l2 = 0000004a, %l5 = ffffa3f3
	add	%i5,0x18,%g1
	casa	[%g1]0x80,%l2,%l5	! %l5 = 000000000dcf6fd2
!	%l6 = 00000000ffca7184, Mem[0000000010101400] = 0e000000
	stwa	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = ffca7184
!	Mem[000000001008142f] = 04c60eff, %l3 = ffffffffffffff84
	ldstub	[%i2+0x02f],%l3		! %l3 = 00000000000000ff
!	%l4 = 00000000, %l5 = 0dcf6fd2, Mem[0000000010181418] = 00000059 00000000, %asi = 80
	stda	%l4,[%i6+0x018]%asi	! Mem[0000000010181418] = 00000000 0dcf6fd2
!	%l0 = 000000000000ff66, Mem[0000000010101408] = c1d70000
	stwa	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000ff66
!	Mem[0000000010041410] = ff57c60d, %l1 = 00000000000000ff
	ldstuba	[%i1+%o5]0x80,%l1	! %l1 = 00000000000000ff

p0_label_92:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 860ec60d, %l6 = 00000000ffca7184
	ldswa	[%i6+%o4]0x81,%l6	! %l6 = ffffffff860ec60d
!	Mem[00000000300c1410] = ff0000ff, %f17 = 000000ff
	lda	[%i3+%o5]0x89,%f17	! %f17 = ff0000ff
!	Mem[00000000300c1410] = ff0000ff, %l4 = 0000000000000000
	ldswa	[%i3+%o5]0x89,%l4	! %l4 = ffffffffff0000ff
!	Mem[0000000030101410] = d7080000, %l1 = 00000000000000ff
	lduha	[%i4+%o5]0x81,%l1	! %l1 = 000000000000d708
!	Mem[0000000030001410] = 0000004a, %l2 = 000000000000004a
	ldsba	[%i0+%o5]0x89,%l2	! %l2 = 000000000000004a
!	Mem[0000000010041404] = 4d9f0000, %l5 = 000000000dcf6fd2
	lduh	[%i1+0x004],%l5		! %l5 = 0000000000004d9f
!	Mem[0000000030101410] = d7080000, %l7 = 0000000000000099
	lduwa	[%i4+%o5]0x81,%l7	! %l7 = 00000000d7080000
!	Mem[0000000010001410] = 86ffffff, %f1  = 164d9eff
	lda	[%i0+%o5]0x80,%f1 	! %f1 = 86ffffff
!	Mem[00000000100c1420] = 000040bc, %l5 = 0000000000004d9f
	lduh	[%i3+0x020],%l5		! %l5 = 0000000000000000
!	Mem[0000000030101410] = d7080000 0dc60e86, %l2 = 0000004a, %l3 = 000000ff
	ldda	[%i4+%o5]0x81,%l2	! %l2 = 00000000d7080000 000000000dc60e86

p0_label_93:
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000ff66, immd = 00000605, %y  = 8aab0e2c
	udiv	%l0,0x605,%l2		! %l2 = 00000000ffffffff
	mov	%l0,%y			! %y = 0000ff66
!	%l7 = 00000000d7080000, Mem[0000000010081400] = 7eeb8408
	stwa	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = d7080000
!	Mem[0000000030181410] = 5784eb76, %l1 = 000000000000d708
	swapa	[%i6+%o5]0x89,%l1	! %l1 = 000000005784eb76
!	%f4  = 000000ff 00000043, Mem[0000000010001400] = 148dc691 61a993b5
	stda	%f4 ,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000ff 00000043
!	%l3 = 000000000dc60e86, Mem[0000000010081408] = ff9e4d16
	stwa	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 0dc60e86
!	Mem[0000000010181410] = ff00000e0000ffff, %l5 = 0000000000000000, %l5 = 0000000000000000
	add	%i6,0x10,%g1
	casxa	[%g1]0x80,%l5,%l5	! %l5 = ff00000e0000ffff
!	Mem[0000000010141410] = f6f9ffff, %l6 = 860ec60d, %l6 = 860ec60d
	add	%i5,0x10,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 00000000f6f9ffff
!	%f17 = ff0000ff, Mem[0000000010101410] = 3f010000
	sta	%f17,[%i4+%o5]0x88	! Mem[0000000010101410] = ff0000ff
!	Mem[00000000201c0001] = 00ff8148, %l4 = ffffffffff0000ff
	ldstub	[%o0+0x001],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030041408] = 2c0eab8a, %l1 = 000000005784eb76
	ldstuba	[%i1+%o4]0x81,%l1	! %l1 = 000000000000002c

p0_label_94:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 0dc60e00, %l2 = 00000000ffffffff
	lduba	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000211c0000] = 0000d1d8, %l4 = 00000000000000ff
	ldub	[%o2+%g0],%l4		! %l4 = 0000000000000000
!	Mem[0000000010001410] = 86ffffffffffff72, %l3 = 000000000dc60e86
	ldxa	[%i0+%o5]0x80,%l3	! %l3 = 86ffffffffffff72
!	Mem[0000000010001410] = ffffff86, %l7 = 00000000d7080000
	lduha	[%i0+%o5]0x88,%l7	! %l7 = 000000000000ff86
!	Mem[00000000100c1410] = 0dc60e86, %l3 = 86ffffffffffff72
	lduba	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000086
!	Mem[0000000010041408] = ffff0000148dc691, %f2  = ffffffff 000000ff
	ldda	[%i1+%o4]0x88,%f2 	! %f2  = ffff0000 148dc691
!	Mem[0000000030101400] = ff0000ff, %l2 = 0000000000000000
	lduha	[%i4+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041400] = 86ffffff, %f25 = 148dc691
	lda	[%i1+%g0]0x80,%f25	! %f25 = 86ffffff
!	Mem[0000000010041408] = 91c68d14, %f3  = 148dc691
	lda	[%i1+%o4]0x80,%f3 	! %f3 = 91c68d14
!	Mem[00000000100c1400] = ffffffff, %l7 = 000000000000ff86
	lduha	[%i3+%g0]0x80,%l7	! %l7 = 000000000000ffff

p0_label_95:
!	Starting 10 instruction Store Burst
!	%l5 = ff00000e0000ffff, %l2 = 00000000000000ff, %l1 = 000000000000002c
	sub	%l5,%l2,%l1		! %l1 = ff00000e0000ff00
!	Mem[0000000010141433] = 57fbe20c, %l5 = ff00000e0000ffff
	ldstuba	[%i5+0x033]%asi,%l5	! %l5 = 000000000000000c
!	%l6 = 00000000f6f9ffff, Mem[00000000300c1408] = ff0000c0
	stha	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffff00c0
!	%l3 = 0000000000000086, Mem[0000000030181410] = 0000d708
	stba	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000d786
!	Mem[00000000100c1410] = 0dc60e86, %l2 = 00000000000000ff
	ldstuba	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000086
!	%l4 = 00000000, %l5 = 0000000c, Mem[0000000030101410] = 000008d7 860ec60d
	stda	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000 0000000c
!	Mem[00000000100c1408] = 00000000, %l0 = 000000000000ff66
	ldstuba	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010101420] = ff9e4d16, %asi = 80
	stwa	%l0,[%i4+0x020]%asi	! Mem[0000000010101420] = 00000000
!	Mem[0000000010141400] = 000000ff, %l6 = 00000000f6f9ffff
	ldstuba	[%i5+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%l2 = 0000000000000086, Mem[0000000010041436] = 05c31eed, %asi = 80
	stba	%l2,[%i1+0x036]%asi	! Mem[0000000010041434] = 05c386ed

p0_label_96:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = fffff9f6, %l7 = 000000000000ffff
	lduba	[%i6+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[000000001010142b] = 228a91fe, %l5 = 000000000000000c, %asi = 80
	ldsba	[%i4+0x02b]%asi,%l5	! %l5 = fffffffffffffffe
!	Mem[0000000030001410] = 0000004a, %l0 = 0000000000000000
	ldsha	[%i0+%o5]0x89,%l0	! %l0 = 000000000000004a
!	Mem[0000000030181400] = c0000000, %l2 = 0000000000000086
	lduwa	[%i6+%g0]0x89,%l2	! %l2 = 00000000c0000000
!	Mem[0000000010101408] = 0000ff66000000c1, %f16 = 000000ff ff0000ff
	ldda	[%i4+%o4]0x80,%f16	! %f16 = 0000ff66 000000c1
!	Mem[00000000300c1410] = ff0000ff, %l0 = 000000000000004a
	lduwa	[%i3+%o5]0x81,%l0	! %l0 = 00000000ff0000ff
!	Mem[0000000030081410] = ad726a99, %l2 = 00000000c0000000
	ldswa	[%i2+%o5]0x89,%l2	! %l2 = ffffffffad726a99
!	Mem[0000000010001410] = 86ffffff ffffff72, %l0 = ff0000ff, %l1 = 0000ff00
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 0000000086ffffff 00000000ffffff72
!	Mem[0000000030141410] = 00000000, %l6 = 0000000000000000
	ldsha	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000201c0000] = 00ff8148, %l3 = 0000000000000086, %asi = 80
	ldsba	[%o0+0x000]%asi,%l3	! %l3 = 0000000000000000

p0_label_97:
!	Starting 10 instruction Store Burst
!	%l0 = 86ffffff, %l1 = ffffff72, Mem[0000000010081400] = d7080000 5857c69e
	stda	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 86ffffff ffffff72
!	%l4 = 0000000000000000, Mem[00000000100c1400] = ffffffff
	stwa	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	%l2 = ffffffffad726a99, Mem[00000000100c1400] = 00000000
	stba	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000099
!	%l2 = ffffffffad726a99, Mem[0000000010141410] = fffff9f6
	stba	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = fffff999
!	%l7 = 00000000000000ff, Mem[0000000010081400] = ffffff86
	stba	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffff86
!	Mem[000000001014143b] = 04c60eff, %l0 = 0000000086ffffff
	ldstub	[%i5+0x03b],%l0		! %l0 = 00000000000000ff
!	Mem[00000000201c0001] = 00ff8148, %l1 = 00000000ffffff72
	ldstub	[%o0+0x001],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010001400] = 000000ff, %l1 = 00000000000000ff
	swapa	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000010041426] = 5fdd6f31
	sth	%l7,[%i1+0x026]		! Mem[0000000010041424] = 5fdd00ff
!	Mem[0000000010141400] = ff0000ff, %l7 = 00000000000000ff
	swapa	[%i5+%g0]0x88,%l7	! %l7 = 00000000ff0000ff

p0_label_98:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010081400] = ffffff86 72ffffff 860ec60d ffffa3f3
!	Mem[0000000010081410] = 4c551256 de150042 0000d708 4a000000
!	Mem[0000000010081420] = ff000000 bc400000 000000ff 04c60eff
!	Mem[0000000010081430] = adc0fa38 4c551256 137c5230 ea6db759
	ldda	[%i2+%g0]ASI_BLK_PL,%f16	! Block Load from 0000000010081400
!	Mem[0000000010181410] = ff00000e, %l0 = 00000000000000ff
	lduha	[%i6+%o5]0x80,%l0	! %l0 = 000000000000ff00
!	Mem[0000000020800000] = ff66f578, %l3 = 0000000000000000, %asi = 80
	ldsba	[%o1+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010141410] = 99f9ffff56fffb66, %f8  = 000000ff ffffffff
	ldda	[%i5+%o5]0x80,%f8 	! %f8  = 99f9ffff 56fffb66
!	Mem[0000000030101400] = ff0000ff, %l0 = 000000000000ff00
	lduha	[%i4+%g0]0x81,%l0	! %l0 = 000000000000ff00
!	Mem[0000000030001410] = 0000004a, %f8  = 99f9ffff
	lda	[%i0+%o5]0x89,%f8 	! %f8 = 0000004a
!	Mem[0000000030181410] = 0000d786, %l1 = 00000000000000ff
	lduha	[%i6+%o5]0x89,%l1	! %l1 = 000000000000d786
!	Mem[0000000010041420] = 5758d9a05fdd00ff, %f12 = 860ec60d f3a3ffff
	ldd	[%i1+0x020],%f12	! %f12 = 5758d9a0 5fdd00ff
!	Mem[0000000030101408] = 86ffffff, %l4 = 0000000000000000
	ldsba	[%i4+%o4]0x81,%l4	! %l4 = ffffffffffffff86
!	Mem[000000001008143a] = 137c5230, %l3 = ffffffffffffffff
	ldsb	[%i2+0x03a],%l3		! %l3 = 0000000000000052

p0_label_99:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = ff0000ff, Mem[0000000010141410] = 99f9ffff 56fffb66
	stda	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 ff0000ff
!	Mem[0000000030081400] = 2614255b, %l5 = 00000000fffffffe
	swapa	[%i2+%g0]0x81,%l5	! %l5 = 000000002614255b
!	%f2  = ffff0000 91c68d14, Mem[0000000010181410] = ff00000e 0000ffff, %asi = 80
	stda	%f2 ,[%i6+0x010]%asi	! Mem[0000000010181410] = ffff0000 91c68d14
!	Mem[000000001004141c] = 000000ff, %l4 = 00000000ffffff86, %asi = 80
	swapa	[%i1+0x01c]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[000000001014140c] = f44ba3f3, %l4 = 00000000000000ff, %asi = 80
	swapa	[%i5+0x00c]%asi,%l4	! %l4 = 00000000f44ba3f3
!	%l0 = 0000ff00, %l1 = 0000d786, Mem[0000000010141408] = 0dc65784 ff000000
	stda	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000ff00 0000d786
!	%f3  = 91c68d14, Mem[0000000010101410] = ff0000ff
	sta	%f3 ,[%i4+%o5]0x88	! Mem[0000000010101410] = 91c68d14
!	%l2 = ad726a99, %l3 = 00000052, Mem[0000000010181400] = 8457c60d 00000000
	stda	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = ad726a99 00000052
!	Mem[0000000010001408] = 2dddfd9b, %l0 = 000000000000ff00
	ldstuba	[%i0+%o4]0x88,%l0	! %l0 = 000000000000009b
!	Mem[0000000020800041] = ffff65a8, %l5 = 000000002614255b
	ldstuba	[%o1+0x041]%asi,%l5	! %l5 = 00000000000000ff

p0_label_100:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ff0000ff, %l3 = 0000000000000052
	lduha	[%i4+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041400] = 00009f4dffffff86, %l3 = 00000000000000ff
	ldxa	[%i1+%g0]0x88,%l3	! %l3 = 00009f4dffffff86
!	Mem[0000000010141400] = ff000000, %l5 = 00000000000000ff
	lduha	[%i5+%g0]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[00000000201c0000] = 00ff8148, %l4 = 00000000f44ba3f3
	ldub	[%o0+%g0],%l4		! %l4 = 0000000000000000
!	Mem[0000000010081430] = adc0fa38, %l3 = 00009f4dffffff86
	ldsh	[%i2+0x030],%l3		! %l3 = ffffffffffffadc0
!	Mem[0000000010101434] = 311f598d, %l3 = ffffffffffffadc0
	lduh	[%i4+0x034],%l3		! %l3 = 000000000000311f
!	Mem[0000000010081400] = 86ffffff, %l2 = ffffffffad726a99
	lduwa	[%i2+%g0]0x88,%l2	! %l2 = 0000000086ffffff
!	Mem[00000000100c1400] = 99000000a83a91fe, %l5 = 000000000000ff00
	ldxa	[%i3+%g0]0x80,%l5	! %l5 = 99000000a83a91fe
!	%l3 = 000000000000311f, %l2 = 0000000086ffffff, %y  = 0000ff66
	sdiv	%l3,%l2,%l3		! %l3 = fffffffffffde3a8
	mov	%l0,%y			! %y = 0000009b
!	Mem[0000000010001410] = ffffff86, %l0 = 000000000000009b
	ldsba	[%i0+%o5]0x88,%l0	! %l0 = ffffffffffffff86

p0_label_101:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = f6f9ffff, %l2 = 0000000086ffffff
	swapa	[%i6+%o4]0x88,%l2	! %l2 = 00000000f6f9ffff
!	%f6  = 0000004a 2dddfd9b, Mem[0000000010041400] = ffffff86 00009f4d
	stda	%f6 ,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000004a 2dddfd9b
!	%l7 = 00000000ff0000ff, Mem[0000000030081410] = ad726a99
	stwa	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = ff0000ff
!	Mem[0000000030101410] = 00000000, %l3 = fffffffffffde3a8
	ldstuba	[%i4+%o5]0x81,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (19)
!	%l2 = 00000000f6f9ffff, Mem[0000000010081438] = 137c5230ea6db759, %asi = 80
	stxa	%l2,[%i2+0x038]%asi	! Mem[0000000010081438] = 00000000f6f9ffff
!	%l2 = 00000000f6f9ffff, Mem[000000001000142a] = 00000076, %asi = 80
	stba	%l2,[%i0+0x02a]%asi	! Mem[0000000010001428] = 0000ff76
!	%l1 = 000000000000d786, Mem[0000000010181430] = 08d7257178d2ff4d
	stx	%l1,[%i6+0x030]		! Mem[0000000010181430] = 000000000000d786
!	%l1 = 000000000000d786, Mem[0000000030081408] = 0dc60e00
	stba	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 0dc60e86
!	Mem[0000000010001408] = fffddd2d, %l3 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l3	! %l3 = 00000000fffddd2d
!	%l0 = ffffffffffffff86, Mem[00000000300c1410] = ff0000ff00000043
	stxa	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffffffffffff86

p0_label_102:
!	Starting 10 instruction Load Burst
!	Mem[000000001000143a] = 80788f42, %l3 = 00000000fffddd2d, %asi = 80
	lduha	[%i0+0x03a]%asi,%l3	! %l3 = 0000000000008f42
!	Mem[0000000010081400] = ffffff7286ffffff, %f12 = 5758d9a0 5fdd00ff
	ldda	[%i2+%g0]0x88,%f12	! %f12 = ffffff72 86ffffff
!	Mem[0000000010141408] = 00ff0000 86d70000, %l0 = ffffff86, %l1 = 0000d786
	ldda	[%i5+%o4]0x80,%l0	! %l0 = 0000000000ff0000 0000000086d70000
!	Mem[0000000030081410] = ff000000ff0000ff, %l4 = 0000000000000000
	ldxa	[%i2+%o5]0x89,%l4	! %l4 = ff000000ff0000ff
!	Mem[0000000030101400] = ff0000ff, %l5 = 99000000a83a91fe
	lduha	[%i4+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181410] = 86d70000, %l6 = 0000000000000000
	ldswa	[%i6+%o5]0x81,%l6	! %l6 = ffffffff86d70000
!	%l7 = 00000000ff0000ff, %l5 = 00000000000000ff, %l5 = 00000000000000ff
	udivx	%l7,%l5,%l5		! %l5 = 0000000001000001
!	Mem[0000000010001408] = 0000004a 00000000, %l4 = ff0000ff, %l5 = 01000001
	ldda	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000000 000000000000004a
!	Mem[0000000010081408] = 860ec60d, %l7 = 00000000ff0000ff
	ldsba	[%i2+%o4]0x80,%l7	! %l7 = ffffffffffffff86
!	Mem[0000000010041408] = 91c68d140000ffff, %l0 = 0000000000ff0000, %asi = 80
	ldxa	[%i1+0x008]%asi,%l0	! %l0 = 91c68d140000ffff

p0_label_103:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000086d70000, Mem[0000000010081408] = 0dc60e86
	stba	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = 0dc60e00
!	Mem[0000000030001400] = ff000000, %l0 = 91c68d140000ffff
	ldstuba	[%i0+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041410] = ff57c60d, %l4 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 00000000ff57c60d
!	%l7 = ffffffffffffff86, Mem[0000000021800180] = ff6d5728
	sth	%l7,[%o3+0x180]		! Mem[0000000021800180] = ff865728
!	%f21 = 5612554c, %f17 = 86ffffff, %f12 = ffffff72
	fmuls	%f21,%f17,%f12		! %f12 = 9d92554b
!	%l0 = 00000000000000ff, %l7 = ffffffffffffff86, %y  = 0000009b
	udiv	%l0,%l7,%l4		! %l4 = 000000000000009b
	mov	%l0,%y			! %y = 000000ff
!	%l4 = 000000000000009b, Mem[0000000010041408] = ffff0000148dc691
	stxa	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000000000009b
!	%l7 = ffffffffffffff86, Mem[00000000300c1410] = ffffffff
	stwa	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffff86
!	Mem[0000000030001400] = ff000000, %l5 = 000000000000004a
	ldstuba	[%i0+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141400] = ff000000, %l5 = 00000000000000ff
	swapa	[%i5+%g0]0x80,%l5	! %l5 = 00000000ff000000

p0_label_104:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 0000ff00, %l2 = 00000000f6f9ffff
	ldsba	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181410] = ffff0000, %l7 = ffffffffffffff86
	lduwa	[%i6+%o5]0x80,%l7	! %l7 = 00000000ffff0000
!	Mem[0000000010101430] = 3bd4a3ac 311f598d, %l4 = 0000009b, %l5 = ff000000
	ldd	[%i4+0x030],%l4		! %l4 = 000000003bd4a3ac 00000000311f598d
!	Mem[0000000010141410] = 00000000, %l5 = 00000000311f598d
	ldswa	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181400] = c0000000, %l5 = 0000000000000000
	lduwa	[%i6+%g0]0x89,%l5	! %l5 = 00000000c0000000
!	Mem[00000000300c1410] = 86ffffff86ffffff, %f28 = 5612554c 38fac0ad
	ldda	[%i3+%o5]0x89,%f28	! %f28 = 86ffffff 86ffffff
!	Mem[0000000010081400] = ffffff7286ffffff, %f12 = 9d92554b 86ffffff
	ldda	[%i2+%g0]0x88,%f12	! %f12 = ffffff72 86ffffff
!	Mem[0000000010141408] = 0000ff00, %l3 = 0000000000008f42
	ldsha	[%i5+%o4]0x88,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000030181410] = 0000d786, %l4 = 000000003bd4a3ac
	ldsba	[%i6+%o5]0x89,%l4	! %l4 = ffffffffffffff86
!	Mem[00000000300c1408] = ffff00c0, %l5 = 00000000c0000000
	ldswa	[%i3+%o4]0x81,%l5	! %l5 = ffffffffffff00c0

p0_label_105:
!	Starting 10 instruction Store Burst
!	%l4 = ffffff86, %l5 = ffff00c0, Mem[0000000030141408] = 08d70000 99000000
	stda	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffff86 ffff00c0
!	Mem[00000000201c0001] = 00ff8148, %l0 = 00000000000000ff
	ldstub	[%o0+0x001],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010181410] = ffff0000, %l2 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181400] = 000000c0, %l5 = 00000000ffff00c0
	swapa	[%i6+%g0]0x81,%l5	! %l5 = 00000000000000c0
!	Mem[0000000010001400] = ff000000, %l3 = ffffffffffffff00
	ldsba	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1400] = 00000099, %l1 = 0000000086d70000
	swapa	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000099
!	Mem[0000000010101400] = 8471caff, %l1 = 0000000000000099
	ldstuba	[%i4+%g0]0x80,%l1	! %l1 = 0000000000000084
!	Mem[00000000100c1400] = 0000d786a83a91fe, %l2 = 00000000000000ff, %l1 = 0000000000000084
	casxa	[%i3]0x80,%l2,%l1	! %l1 = 0000d786a83a91fe
!	Mem[0000000010001418] = 5c2f9cf2, %l2 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x018]%asi,%l2	! %l2 = 000000005c2f9cf2
!	%f15 = 61a993b5, %f18 = f3a3ffff, %f14 = ff424bf4
	fmuls	%f15,%f18,%f14		! %f14 = ff800000

p0_label_106:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 000000004a000000, %f14 = ff800000 61a993b5
	ldda	[%i0+%o4]0x80,%f14	! %f14 = 00000000 4a000000
!	Mem[00000000300c1408] = ffff00c0, %f8  = 0000004a
	lda	[%i3+%o4]0x81,%f8 	! %f8 = ffff00c0
!	Mem[0000000010001400] = ff000000, %f9  = 56fffb66
	lda	[%i0+%g0]0x88,%f9 	! %f9 = ff000000
!	Mem[0000000010041400] = 9bfddd2d, %l6 = ffffffff86d70000
	ldsh	[%i1+%g0],%l6		! %l6 = ffffffffffff9bfd
!	%f10 = 860ec60d, %f23 = 08d70000
	fsqrts	%f10,%f23		! %f23 = 7fffffff
!	Mem[00000000218001c1] = 59ada358, %l6 = ffffffffffff9bfd
	ldub	[%o3+0x1c1],%l6		! %l6 = 00000000000000ad
!	Mem[0000000010141410] = ff0000ff 00000000, %l0 = 000000ff, %l1 = a83a91fe
	ldda	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000000 00000000ff0000ff
!	Mem[00000000218001c0] = 59ada358, %l2 = 000000005c2f9cf2, %asi = 80
	lduha	[%o3+0x1c0]%asi,%l2	! %l2 = 00000000000059ad
!	Mem[0000000010141420] = 459b7b20 562e5814, %l4 = ffffff86, %l5 = 000000c0, %asi = 80
	ldda	[%i5+0x020]%asi,%l4	! %l4 = 00000000459b7b20 00000000562e5814
!	Mem[0000000010141410] = 00000000, %l6 = 00000000000000ad
	lduwa	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000

p0_label_107:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000021800181] = ff865728, %asi = 80
	stba	%l6,[%o3+0x181]%asi	! Mem[0000000021800180] = ff005728
!	Mem[0000000030181400] = c000ffff, %l6 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%f6  = 0000004a, Mem[0000000030181400] = ffff00c0
	sta	%f6 ,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000004a
!	%l0 = 0000000000000000, Mem[0000000020800000] = ff66f578, %asi = 80
	stha	%l0,[%o1+0x000]%asi	! Mem[0000000020800000] = 0000f578
!	Mem[00000000100c1400] = 0000d786, %l7 = 00000000ffff0000
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001410] = 86ffffff, %l1 = 00000000ff0000ff
	swapa	[%i0+%o5]0x80,%l1	! %l1 = 0000000086ffffff
!	Mem[000000001014141e] = 2614255b, %l7 = 0000000000000000
	ldstub	[%i5+0x01e],%l7		! %l7 = 0000000000000025
!	%l4 = 00000000459b7b20, Mem[0000000021800140] = ff7606f8
	stb	%l4,[%o3+0x140]		! Mem[0000000021800140] = 207606f8
!	Mem[0000000010181418] = 00000000, %l1 = 0000000086ffffff
	ldstuba	[%i6+0x018]%asi,%l1	! %l1 = 0000000000000000
!	%f16 = ffffff72 86ffffff, Mem[00000000100c1410] = ff0ec60d 000000ff
	stda	%f16,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffffff72 86ffffff

p0_label_108:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ffff0000, %l2 = 00000000000059ad
	ldswa	[%i6+%o5]0x80,%l2	! %l2 = ffffffffffff0000
!	Mem[0000000030081408] = 860ec60d, %l3 = 0000000000000000
	ldswa	[%i2+%o4]0x81,%l3	! %l3 = ffffffff860ec60d
!	Mem[0000000010041400] = 2dddfd9b, %l7 = 0000000000000025
	lduba	[%i1+%g0]0x88,%l7	! %l7 = 000000000000009b
!	Mem[00000000211c0000] = 0000d1d8, %l5 = 00000000562e5814
	ldsh	[%o2+%g0],%l5		! %l5 = 0000000000000000
!	Mem[00000000218001c0] = 59ada358, %l4 = 00000000459b7b20, %asi = 80
	lduha	[%o3+0x1c0]%asi,%l4	! %l4 = 00000000000059ad
!	Mem[0000000010181408] = ffffff86, %l0 = 0000000000000000
	ldsba	[%i6+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010081408] = 0dc60e00, %l2 = ffffffffffff0000
	ldsha	[%i2+%o4]0x88,%l2	! %l2 = 0000000000000e00
!	Mem[0000000030141408] = 86ffffff, %l7 = 000000000000009b
	lduba	[%i5+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1400] = 86d700ff, %f26 = ff0ec604
	lda	[%i3+%g0]0x88,%f26	! %f26 = 86d700ff
!	Mem[0000000030101410] = 000000ff, %l7 = 00000000000000ff
	lduwa	[%i4+%o5]0x89,%l7	! %l7 = 00000000000000ff

p0_label_109:
!	Starting 10 instruction Store Burst
!	%f4  = 000000ff 00000043, %l6 = 00000000000000ff
!	Mem[00000000300c1428] = 860ec60d5e04974a
	add	%i3,0x028,%g1
	stda	%f4,[%g1+%l6]ASI_PST16_S ! Mem[00000000300c1428] = 000000ff00000043
!	%l2 = 0000000000000e00, Mem[00000000100c1402] = ff00d786, %asi = 80
	stha	%l2,[%i3+0x002]%asi	! Mem[00000000100c1400] = ff000e00
!	%f16 = ffffff72 86ffffff, Mem[0000000030181408] = 860ec60d 461deaff
	stda	%f16,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffff72 86ffffff
!	%l1 = 0000000000000000, Mem[0000000020800040] = ffff65a8
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040] = 000065a8
!	%l6 = 00000000000000ff, Mem[0000000030101400] = ff0000ff
	stha	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 00ff00ff
!	%l1 = 0000000000000000, Mem[0000000010001400] = 43000000ff000000
	stxa	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000000
!	Mem[000000001008140a] = 000ec60d, %l2 = 0000000000000e00
	ldstuba	[%i2+0x00a]%asi,%l2	! %l2 = 00000000000000c6
!	Mem[00000000201c0000] = 00ff8148, %l3 = ffffffff860ec60d
	ldstub	[%o0+%g0],%l3		! %l3 = 0000000000000000
!	%f26 = 86d700ff ff000000, Mem[00000000300c1408] = c000ffff cafaf8d3
	stda	%f26,[%i3+%o4]0x89	! Mem[00000000300c1408] = 86d700ff ff000000
!	%l2 = 000000c6, %l3 = 00000000, Mem[0000000010081408] = 0dff0e00 f3a3ffff
	stda	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000c6 00000000

p0_label_110:
!	Starting 10 instruction Load Burst
!	%l3 = 0000000000000000, immd = fffffbed, %y  = 000000ff
	smul	%l3,-0x413,%l2		! %l2 = 0000000000000000, %y = 00000000
!	%l2 = 0000000000000000, Mem[0000000030001410] = 0000004a
	stha	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	Mem[000000001014142b] = 8457c60d, %l2 = 0000000000000000
	ldsb	[%i5+0x02b],%l2		! %l2 = 000000000000000d
!	Mem[0000000010001410] = ff0000ff, %l3 = 0000000000000000
	lduha	[%i0+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001400] = 00000000, %l3 = 00000000000000ff
	lduba	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081428] = 000000ff, %l2 = 000000000000000d
	lduw	[%i2+0x028],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010181400] = 996a72ad, %l5 = 0000000000000000
	ldswa	[%i6+%g0]0x88,%l5	! %l5 = ffffffff996a72ad
!	Mem[0000000010041400] = 9bfddd2d, %l3 = 0000000000000000
	lduh	[%i1+%g0],%l3		! %l3 = 0000000000009bfd
!	Mem[00000000100c1408] = ff000000164d9eff, %l7 = 00000000000000ff
	ldxa	[%i3+%o4]0x80,%l7	! %l7 = ff000000164d9eff
!	Mem[00000000300c1408] = ff000000, %l4 = 00000000000059ad
	ldsha	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000

p0_label_111:
!	Starting 10 instruction Store Burst
!	%l6 = 000000ff, %l7 = 164d9eff, Mem[0000000010081410] = 5612554c 420015de
	stda	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff 164d9eff
!	%f2  = ffff0000 91c68d14, Mem[0000000010181408] = 86ffffff 86ffffff
	stda	%f2 ,[%i6+%o4]0x88	! Mem[0000000010181408] = ffff0000 91c68d14
!	%f4  = 000000ff 00000043, Mem[0000000010081400] = ffffff86 72ffffff, %asi = 80
	stda	%f4 ,[%i2+0x000]%asi	! Mem[0000000010081400] = 000000ff 00000043
!	%l3 = 0000000000009bfd, Mem[0000000010001410] = ff0000ff
	stha	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = 9bfd00ff
!	Mem[0000000010081408] = c6000000, %l2 = 00000000000000ff
	swapa	[%i2+%o4]0x80,%l2	! %l2 = 00000000c6000000
!	%l0 = ffffffffffffffff, %l0 = ffffffffffffffff, %l5 = ffffffff996a72ad
	sub	%l0,%l0,%l5		! %l5 = 0000000000000000
!	Mem[0000000010101400] = ffca71ff, %l6 = 00000000000000ff
	swapa	[%i4+%g0]0x88,%l6	! %l6 = 00000000ffca71ff
!	%l2 = 00000000c6000000, Mem[0000000010081400] = 000000ff, %asi = 80
	stba	%l2,[%i2+0x000]%asi	! Mem[0000000010081400] = 000000ff
!	%l1 = 0000000000000000, Mem[0000000010101400] = ff000000000000ff
	stxa	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000000000000000
!	Mem[0000000030181410] = 0000d786, %l4 = 0000000000000000
	ldstuba	[%i6+%o5]0x89,%l4	! %l4 = 0000000000000086

p0_label_112:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 86ffffff, %l6 = 00000000ffca71ff
	lduha	[%i4+%o4]0x81,%l6	! %l6 = 00000000000086ff
!	Mem[0000000030101410] = ff000000 0c000000, %l0 = ffffffff, %l1 = 00000000
	ldda	[%i4+%o5]0x81,%l0	! %l0 = 00000000ff000000 000000000c000000
!	Mem[00000000100c1408] = ff000000, %l7 = ff000000164d9eff
	ldswa	[%i3+%o4]0x80,%l7	! %l7 = ffffffffff000000
!	Mem[0000000030081408] = 860ec60d, %l2 = 00000000c6000000
	ldsha	[%i2+%o4]0x81,%l2	! %l2 = ffffffffffff860e
!	Mem[00000000100c1410] = ffffff72 86ffffff, %l4 = 00000086, %l5 = 00000000
	ldda	[%i3+%o5]0x80,%l4	! %l4 = 00000000ffffff72 0000000086ffffff
!	Mem[0000000030181400] = 4a000000, %l1 = 000000000c000000
	lduha	[%i6+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001408] = 24cbfdc2 20e505ff, %l6 = 000086ff, %l7 = ff000000
	ldda	[%i0+%o4]0x89,%l6	! %l6 = 0000000020e505ff 0000000024cbfdc2
!	Mem[0000000010141400] = ff000000, %l6 = 0000000020e505ff
	ldsha	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101408] = 0000ff66, %l3 = 0000000000009bfd
	ldsha	[%i4+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141408] = ffffff86ffff00c0, %l6 = 0000000000000000
	ldxa	[%i5+%o4]0x81,%l6	! %l6 = ffffff86ffff00c0

p0_label_113:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000086ffffff, Mem[00000000100c143c] = 000000ff
	sth	%l5,[%i3+0x03c]		! Mem[00000000100c143c] = ffff00ff
!	%l1 = 0000000000000000, Mem[0000000030141408] = 86ffffff
	stwa	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	Mem[000000001014142c] = 00000000, %l6 = 00000000ffff00c0, %asi = 80
	swapa	[%i5+0x02c]%asi,%l6	! %l6 = 0000000000000000
!	%f6  = 0000004a 2dddfd9b, %l6 = 0000000000000000
!	Mem[00000000300c1420] = 21e4becb000000ff
	add	%i3,0x020,%g1
	stda	%f6,[%g1+%l6]ASI_PST32_S ! Mem[00000000300c1420] = 21e4becb000000ff
!	%l2 = ffffffffffff860e, Mem[0000000030101400] = ff00ff00
	stwa	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = ffff860e
!	Mem[0000000010081400] = ff000000, %l7 = 0000000024cbfdc2
	ldstuba	[%i2+%g0]0x88,%l7	! %l7 = 0000000000000000
!	%l0 = 00000000ff000000, Mem[0000000030141410] = 7600845700000000
	stxa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000ff000000
!	Mem[0000000010181434] = 0000d786, %l3 = 00000000, %l5 = 86ffffff
	add	%i6,0x34,%g1
	casa	[%g1]0x80,%l3,%l5	! %l5 = 000000000000d786
!	%l1 = 0000000000000000, Mem[000000001018141f] = 0dcf6fd2
	stb	%l1,[%i6+0x01f]		! Mem[000000001018141c] = 0dcf6f00
!	%f2  = ffff0000 91c68d14, %l5 = 000000000000d786
!	Mem[0000000010181408] = 148dc6910000ffff
	add	%i6,0x008,%g1
	stda	%f2,[%g1+%l5]ASI_PST8_P ! Mem[0000000010181408] = ff8dc69100c68dff

p0_label_114:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff0000ff, %l1 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001408] = 24cbfdc220e505ff, %l6 = 0000000000000000
	ldxa	[%i0+%o4]0x89,%l6	! %l6 = 24cbfdc220e505ff
!	Mem[0000000010001432] = 6a93944d, %l2 = ffffffffffff860e, %asi = 80
	lduha	[%i0+0x032]%asi,%l2	! %l2 = 000000000000944d
!	%f23 = 7fffffff, %f25 = 000000ff, %f7  = 2dddfd9b
	fdivs	%f23,%f25,%f7 		! %f7  = 7fffffff
!	Mem[0000000030001410] = 0000000054ab0014, %l3 = 0000000000000000
	ldxa	[%i0+%o5]0x81,%l3	! %l3 = 0000000054ab0014
!	Mem[0000000030101410] = 000000ff, %l3 = 0000000054ab0014
	lduha	[%i4+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141410] = 00000000, %l4 = 00000000ffffff72
	lduba	[%i5+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = ff0000ff000000ff, %l2 = 000000000000944d
	ldxa	[%i2+%o5]0x81,%l2	! %l2 = ff0000ff000000ff
!	Mem[0000000030081410] = ff0000ff, %l6 = 24cbfdc220e505ff
	lduha	[%i2+%o5]0x81,%l6	! %l6 = 000000000000ff00
!	Mem[0000000010001408] = 00000000, %l7 = 0000000000000000
	lduba	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000000

p0_label_115:
!	Starting 10 instruction Store Burst
!	%l6 = 000000000000ff00, Mem[0000000030141410] = 000000ff
	stba	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000ff
!	%l6 = 000000000000ff00, Mem[00000000211c0000] = 0000d1d8
	sth	%l6,[%o2+%g0]		! Mem[00000000211c0000] = ff00d1d8
!	%l6 = 0000ff00, %l7 = 00000000, Mem[0000000030081408] = 860ec60d f3a3ffff
	stda	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000ff00 00000000
!	%f28 = 86ffffff 86ffffff, %l1 = 00000000000000ff
!	Mem[0000000030181428] = ff6f8ce804c60e59
	add	%i6,0x028,%g1
	stda	%f28,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030181428] = ffffff86ffffff86
!	%l6 = 000000000000ff00, Mem[0000000030041410] = 86ffffff
	stwa	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000ff00
!	%l4 = 00000000, %l5 = 0000d786, Mem[0000000010141408] = 0000ff00 0000d786
	stda	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 0000d786
!	Mem[0000000010181410] = ffff0000, %l2 = 00000000000000ff
	swapa	[%i6+%o5]0x80,%l2	! %l2 = 00000000ffff0000
!	%l7 = 0000000000000000, Mem[0000000030181410] = 000000ff0000d7ff
	stxa	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000000000000000
!	%f23 = 7fffffff, Mem[0000000010181400] = ad726a99
	sta	%f23,[%i6+%g0]0x80	! Mem[0000000010181400] = 7fffffff
!	Mem[0000000010101400] = 00000000, %l7 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l7	! %l7 = 0000000000000000

p0_label_116:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ff8dc691, %l6 = 000000000000ff00
	lduwa	[%i6+%o4]0x80,%l6	! %l6 = 00000000ff8dc691
!	Mem[0000000010141410] = 00000000, %l7 = 0000000000000000
	ldsha	[%i5+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %l0 = 00000000ff000000
	ldsba	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081408] = ff000000, %l1 = 00000000000000ff
	lduha	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[000000001018140c] = 00c68dff, %l0 = 0000000000000000
	ldsb	[%i6+0x00c],%l0		! %l0 = 0000000000000000
!	Mem[0000000010081418] = 0000d7084a000000, %f14 = 00000000 4a000000, %asi = 80
	ldda	[%i2+0x018]%asi,%f14	! %f14 = 0000d708 4a000000
!	Mem[00000000100c1430] = 5612ff4c38fac0ad, %f30 = 59b76dea 30527c13, %asi = 80
	ldda	[%i3+0x030]%asi,%f30	! %f30 = 5612ff4c 38fac0ad
!	Mem[0000000030081400] = feffffff, %l7 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l7	! %l7 = 00000000feffffff
!	Mem[00000000201c0000] = ffff8148, %l4 = 0000000000000000
	ldsh	[%o0+%g0],%l4		! %l4 = ffffffffffffffff
!	Mem[00000000100c1400] = 000e00ff, %f8  = ffff00c0
	lda	[%i3+%g0]0x88,%f8 	! %f8 = 000e00ff

p0_label_117:
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffffff, Mem[0000000020800040] = 000065a8
	sth	%l4,[%o1+0x040]		! Mem[0000000020800040] = ffff65a8
!	%l7 = 00000000feffffff, immd = 0000000000000b84, %l108 = 0000000000000004
	udivx	%l7,0xb84,%l4		! %l4 = 00000000001624d1
!	%l6 = 00000000ff8dc691, Mem[0000000010001400] = 00000000
	stwa	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = ff8dc691
!	%f12 = ffffff72 86ffffff, Mem[0000000010081420] = ff000000 bc400000, %asi = 80
	stda	%f12,[%i2+0x020]%asi	! Mem[0000000010081420] = ffffff72 86ffffff
!	%l5 = 000000000000d786, Mem[00000000100c141c] = 2dddfd9b
	stw	%l5,[%i3+0x01c]		! Mem[00000000100c141c] = 0000d786
!	Mem[0000000010081408] = ff000000, %l7 = 00000000feffffff
	ldstuba	[%i2+%o4]0x88,%l7	! %l7 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000030181410] = 00000000
	stha	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	Mem[0000000030041400] = 996a72ad 00000000 ff0eab8a 66dc98ec
!	%f16 = ffffff72 86ffffff f3a3ffff 0dc60e86
!	%f20 = 420015de 5612554c 0000004a 7fffffff
!	%f24 = 000040bc 000000ff 86d700ff ff000000
!	%f28 = 86ffffff 86ffffff 5612ff4c 38fac0ad
	stda	%f16,[%i1+%g0]ASI_BLK_S	! Block Store to 0000000030041400
!	Mem[0000000010141400] = ff000000, %l4 = 00000000001624d1
	ldsba	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000211c0000] = ff00d1d8, %l6 = 00000000ff8dc691
	ldstub	[%o2+%g0],%l6		! %l6 = 00000000000000ff

p0_label_118:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 86ffffff 86ffffff, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i3+%o5]0x89,%l6	! %l6 = 0000000086ffffff 0000000086ffffff
!	Mem[0000000030001400] = ff000000, %f7  = 7fffffff
	lda	[%i0+%g0]0x81,%f7 	! %f7 = ff000000
!	Mem[0000000030001408] = ff05e520, %f15 = 4a000000
	lda	[%i0+%o4]0x81,%f15	! %f15 = ff05e520
!	Mem[0000000010141408] = 00000000, %l7 = 0000000086ffffff
	ldswa	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181422] = 0000d708, %l3 = 00000000000000ff
	ldsh	[%i6+0x022],%l3		! %l3 = ffffffffffffd708
!	%l2 = 00000000ffff0000, immd = 00000221, %y  = 00000000
	smul	%l2,0x221,%l1		! %l1 = fffffffffddf0000, %y = ffffffff
!	%l1 = fffffffffddf0000, %l3 = ffffffffffffd708, %l5  = 000000000000d786
	mulx	%l1,%l3,%l5		! %l5 = 0000005737f80000
!	Mem[0000000010081410] = 164d9eff000000ff, %l7 = 0000000000000000
	ldxa	[%i2+%o5]0x88,%l7	! %l7 = 164d9eff000000ff
!	Code Fragment 4, seed = 795063
p0_fragment_7:
!	%l0 = 0000000000000000
	setx	0x4774513bbd18d16e,%g7,%l0 ! %l0 = 4774513bbd18d16e
!	%l1 = fffffffffddf0000
	setx	0x00890507bf2f6319,%g7,%l1 ! %l1 = 00890507bf2f6319
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4774513bbd18d16e
	setx	0x926460ced622e0d4,%g7,%l0 ! %l0 = 926460ced622e0d4
!	%l1 = 00890507bf2f6319
	setx	0x2561d0ebdedccd9f,%g7,%l1 ! %l1 = 2561d0ebdedccd9f
p0_fragment_7_end:
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000010041400] = 9bfddd2d, %l3 = ffffffffffffd708
	lduba	[%i1+%g0]0x80,%l3	! %l3 = 000000000000009b

p0_label_119:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 585700ff, %l3 = 000000000000009b
	ldstuba	[%i5+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010101430] = 3bd4a3ac311f598d
	stx	%l4,[%i4+0x030]		! Mem[0000000010101430] = 0000000000000000
!	%l3 = 00000000000000ff, imm = 0000000000000ce5, %l4 = 0000000000000000
	or	%l3,0xce5,%l4		! %l4 = 0000000000000cff
!	%f18 = f3a3ffff 0dc60e86, %l1 = 2561d0ebdedccd9f
!	Mem[0000000010141428] = 8457c60dffff00c0
	add	%i5,0x028,%g1
	stda	%f18,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010141428] = 860ec60dffff00f3
!	%l0 = 926460ced622e0d4, Mem[000000001000140a] = 00000000
	sth	%l0,[%i0+0x00a]		! Mem[0000000010001408] = 0000e0d4
!	%l0 = 926460ced622e0d4, Mem[000000001008140c] = 00000000, %asi = 80
	stwa	%l0,[%i2+0x00c]%asi	! Mem[000000001008140c] = d622e0d4
!	%l6 = 0000000086ffffff, Mem[000000001008141b] = 0000d708, %asi = 80
	stba	%l6,[%i2+0x01b]%asi	! Mem[0000000010081418] = 0000d7ff
!	%l6 = 0000000086ffffff, Mem[0000000010081408] = ff0000ff
	stwa	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 86ffffff
!	%l4 = 0000000000000cff, Mem[0000000030041400] = ffffff7286ffffff
	stxa	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000000000000cff
!	Mem[0000000010081400] = ff0000ff, %l0 = 00000000d622e0d4
	swapa	[%i2+%g0]0x88,%l0	! %l0 = 00000000ff0000ff

p0_label_120:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ff05e520, %l1 = 2561d0ebdedccd9f
	lduba	[%i0+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001410] = 9bfd00ff ffffff72, %l2 = ffff0000, %l3 = 000000ff
	ldda	[%i0+%o5]0x80,%l2	! %l2 = 000000009bfd00ff 00000000ffffff72
!	Mem[0000000010141420] = 459b7b20, %f10 = 860ec60d
	ld	[%i5+0x020],%f10	! %f10 = 459b7b20
!	Mem[0000000030041408] = ffffa3f3, %f11 = 5e04974a
	lda	[%i1+%o4]0x89,%f11	! %f11 = ffffa3f3
!	Mem[000000001018140c] = 00c68dff, %l1 = 00000000000000ff
	lduw	[%i6+0x00c],%l1		! %l1 = 0000000000c68dff
!	Mem[00000000100c1408] = ff000000, %l3 = 00000000ffffff72
	ldstuba	[%i3+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	%l6 = 0000000086ffffff, %l1 = 0000000000c68dff, %y  = ffffffff
	smul	%l6,%l1,%l4		! %l4 = ffa226e278397201, %y = ffa226e2
!	Mem[00000000100c1408] = ff000000, %l5 = 0000005737f80000
	lduba	[%i3+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1408] = 000000ff, %f3  = 91c68d14
	lda	[%i3+%o4]0x81,%f3 	! %f3 = 000000ff
!	%l7 = 164d9eff000000ff, %l1 = 0000000000c68dff, %l6 = 0000000086ffffff
	add	%l7,%l1,%l6		! %l6 = 164d9eff00c68efe

p0_label_121:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 00000000, %l4 = ffa226e278397201
	ldstuba	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081408] = 00ff0000, %l2 = 000000009bfd00ff
	swapa	[%i2+%o4]0x89,%l2	! %l2 = 0000000000ff0000
!	Mem[0000000030141408] = 000000ff, %l1 = 0000000000c68dff
	ldstuba	[%i5+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101408] = ffffff86, %l7 = 164d9eff000000ff
	ldstuba	[%i4+%o4]0x89,%l7	! %l7 = 0000000000000086
!	%l2 = 0000000000ff0000, Mem[00000000211c0001] = ff00d1d8, %asi = 80
	stba	%l2,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff00d1d8
!	Mem[0000000030041408] = ffffa3f3, %l6 = 0000000000c68efe
	swapa	[%i1+%o4]0x89,%l6	! %l6 = 00000000ffffa3f3
!	%f22 = 0000004a, Mem[0000000030101410] = ff000000
	sta	%f22,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000004a
!	%l4 = 00000000, %l5 = 000000ff, Mem[00000000300c1410] = ffffff86 ffffff86
	stda	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000 000000ff
!	%l0 = 00000000ff0000ff, Mem[0000000010041400] = 2dddfd9b
	stba	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 2dddfdff
!	%l2 = 0000000000ff0000, Mem[0000000010101410] = 91c68d14
	stha	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 91c60000

p0_label_122:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ffffffff ffffffff, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i4+%o4]0x81,%l4	! %l4 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000010181410] = 000000ff91c68d14, %f16 = ffffff72 86ffffff
	ldda	[%i6+%o5]0x80,%f16	! %f16 = 000000ff 91c68d14
!	Mem[0000000021800100] = 50ffb2c8, %l0 = 00000000ff0000ff, %asi = 80
	ldsba	[%o3+0x100]%asi,%l0	! %l0 = 0000000000000050
!	Mem[0000000010001408] = 0000e0d4, %l6 = 00000000ffffa3f3
	lduba	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041400] = fffddd2d 4a000000, %l0 = 00000050, %l1 = 000000ff
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 00000000fffddd2d 000000004a000000
!	Mem[0000000030081410] = ff0000ff, %f31 = 38fac0ad
	lda	[%i2+%o5]0x81,%f31	! %f31 = ff0000ff
!	Mem[0000000030041410] = 420015de, %l0 = 00000000fffddd2d
	lduba	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000042
!	Mem[0000000010141400] = 0000460eff000000, %l7 = 0000000000000086
	ldxa	[%i5+%g0]0x88,%l7	! %l7 = 0000460eff000000
!	Mem[0000000021800141] = 207606f8, %l1 = 000000004a000000
	ldub	[%o3+0x141],%l1		! %l1 = 0000000000000076
!	Mem[00000000100c1410] = ffffff72, %l1 = 0000000000000076
	ldsba	[%i3+%o5]0x80,%l1	! %l1 = ffffffffffffffff

p0_label_123:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000042, Mem[0000000030001408] = 20e505ff
	stha	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 20e50042
!	%f8  = 000e00ff ff000000, %l3 = 00000000000000ff
!	Mem[0000000010001410] = 9bfd00ffffffff72
	add	%i0,0x010,%g1
	stda	%f8,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010001410] = 000000ffff000e00
!	%l1 = ffffffffffffffff, Mem[00000000201c0000] = ffff8148
	sth	%l1,[%o0+%g0]		! Mem[00000000201c0000] = ffff8148
!	Mem[0000000010041411] = 00000000, %l5 = 00000000ffffffff
	ldstub	[%i1+0x011],%l5		! %l5 = 0000000000000000
!	Mem[0000000010001400] = 91c68dff, %l2 = 0000000000ff0000
	swapa	[%i0+%g0]0x80,%l2	! %l2 = 0000000091c68dff
!	%l6 = 00000000, %l7 = ff000000, Mem[0000000010001428] = 0000ff76 ad726a99
	std	%l6,[%i0+0x028]		! Mem[0000000010001428] = 00000000 ff000000
!	Mem[00000000201c0001] = ffff8148, %l6 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1410] = 00000000, %l0 = 0000000000000042
	swapa	[%i3+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0001] = ffff8148, %l5 = 0000000000000000
	ldstub	[%o0+0x001],%l5		! %l5 = 00000000000000ff
!	Mem[00000000201c0000] = ffff8148, %l5 = 00000000000000ff
	ldstuba	[%o0+0x000]%asi,%l5	! %l5 = 00000000000000ff

p0_label_124:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 0000ff00, %l2 = 0000000091c68dff
	ldsba	[%i0+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %l7 = 0000460eff000000
	ldswa	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = ff000000, %l7 = 0000000000000000
	lduba	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101400] = ffff860e, %l3 = 00000000000000ff
	ldsha	[%i4+%g0]0x89,%l3	! %l3 = ffffffffffff860e
!	Mem[0000000010141400] = ff000000, %l4 = 00000000ffffffff
	lduba	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = 00000000 0dc60e86, %l2 = 00000000, %l3 = ffff860e
	ldda	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000 000000000dc60e86
!	Mem[0000000021800080] = 3b6afe68, %l3 = 000000000dc60e86
	lduh	[%o3+0x080],%l3		! %l3 = 0000000000003b6a
!	Mem[0000000030081400] = 00000000, %l2 = 0000000000000000
	lduba	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101400] = ffff860e, %l7 = 0000000000000000
	lduwa	[%i4+%g0]0x89,%l7	! %l7 = 00000000ffff860e
!	Mem[0000000010001408] = 0000e0d4 4a000000, %l0 = 00000000, %l1 = ffffffff
	ldda	[%i0+%o4]0x80,%l0	! %l0 = 000000000000e0d4 000000004a000000

p0_label_125:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i0+%o5]0x88,%l4	! %l4 = 0000000000000000
!	%l6 = 00000000000000ff, Mem[0000000030101408] = ffffffffffffffff
	stxa	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[0000000010181410] = ff000000
	stba	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = ff0000ff
!	%l4 = 0000000000000000, Mem[00000000300c1400] = f3a3ffc1
	stwa	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	Mem[0000000010001400] = 00ff0000, %l7 = 00000000ffff860e
	ldstuba	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = ff8dc691, %l4 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l4	! %l4 = 00000000ff8dc691
!	%l6 = 00000000000000ff, Mem[0000000010181408] = 00000000
	stha	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff
!	Mem[0000000030141408] = ff000000, %l3 = 0000000000003b6a
	ldstuba	[%i5+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101400] = 0e86ffff e88c6fff ff000000 00000000
!	%f16 = 000000ff 91c68d14 f3a3ffff 0dc60e86
!	%f20 = 420015de 5612554c 0000004a 7fffffff
!	%f24 = 000040bc 000000ff 86d700ff ff000000
!	%f28 = 86ffffff 86ffffff 5612ff4c ff0000ff
	stda	%f16,[%i4+%g0]ASI_COMMIT_S	! Block Store to 0000000030101400
!	Mem[00000000218001c1] = 59ada358, %l7 = 0000000000000000
	ldstub	[%o3+0x1c1],%l7		! %l7 = 00000000000000ad

p0_label_126:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 9b000000, %l1 = 000000004a000000
	ldsw	[%i1+%o4],%l1		! %l1 = ffffffff9b000000
!	Mem[00000000300c1408] = 86d700ff ff000000, %l0 = 0000e0d4, %l1 = 9b000000
	ldda	[%i3+%o4]0x89,%l0	! %l0 = 00000000ff000000 0000000086d700ff
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000030101408] = f3a3ffff0dc60e86, %f6  = 0000004a ff000000
	ldda	[%i4+%o4]0x81,%f6 	! %f6  = f3a3ffff 0dc60e86
!	Mem[0000000030101400] = 148dc691 ff000000, %l6 = 000000ff, %l7 = 000000ad
	ldda	[%i4+%g0]0x89,%l6	! %l6 = 00000000ff000000 00000000148dc691
!	Mem[0000000030181408] = 72ffffff, %l1 = 0000000086d700ff
	lduwa	[%i6+%o4]0x89,%l1	! %l1 = 0000000072ffffff
!	Mem[00000000100c1408] = ff9e4d16000000ff, %f16 = 000000ff 91c68d14
	ldda	[%i3+%o4]0x88,%f16	! %f16 = ff9e4d16 000000ff
!	%l5 = 00000000000000ff, %l5 = 00000000000000ff, %y  = ffa226e2
	sdiv	%l5,%l5,%l1		! %l1 = ffffffff80000000
	mov	%l0,%y			! %y = ff000000
!	Mem[0000000020800041] = ffff65a8, %l2 = 0000000000000000, %asi = 80
	ldsba	[%o1+0x041]%asi,%l2	! %l2 = ffffffffffffffff
!	%l3 = 00000000000000ff, imm = 0000000000000546, %l5 = 00000000000000ff
	xor	%l3,0x546,%l5		! %l5 = 00000000000005b9
!	Mem[0000000010001410] = ff0000ff, %l4 = 00000000ff8dc691
	ldsba	[%i0+%o5]0x88,%l4	! %l4 = ffffffffffffffff

p0_label_127:
!	Starting 10 instruction Store Burst
!	%f6  = f3a3ffff 0dc60e86, %l1 = ffffffff80000000
!	Mem[0000000010081430] = adc0fa384c551256
	add	%i2,0x030,%g1
	stda	%f6,[%g1+%l1]ASI_PST16_P ! Mem[0000000010081430] = adc0fa384c551256
!	%l3 = 00000000000000ff, Mem[0000000020800001] = 0000f578, %asi = 80
	stba	%l3,[%o1+0x001]%asi	! Mem[0000000020800000] = 00fff578
!	%l3 = 00000000000000ff, Mem[00000000100c1410] = ffffff72
	stwa	%l3,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000ff
!	%l6 = 00000000ff000000, imm = 0000000000000386, %l6 = 00000000ff000000
	addc	%l6,0x386,%l6		! %l6 = 00000000ff000386
!	%l0 = 00000000ff000000, Mem[00000000300c1408] = 000000ff
	stwa	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff000000
!	%l1 = ffffffff80000000, Mem[0000000030001400] = 000000ff
	stwa	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = 80000000
!	Mem[0000000030141410] = 000000ff, %l3 = 00000000000000ff
	ldswa	[%i5+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	%l2 = ffffffffffffffff, Mem[0000000010181420] = 0000d70826809d91, %asi = 80
	stxa	%l2,[%i6+0x020]%asi	! Mem[0000000010181420] = ffffffffffffffff
!	%l4 = ffffffffffffffff, Mem[0000000010181438] = 00000000, %asi = 80
	stwa	%l4,[%i6+0x038]%asi	! Mem[0000000010181438] = ffffffff
!	%l1 = ffffffff80000000, Mem[0000000030001408] = 4200e520
	stba	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000e520

p0_label_128:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 0000c691, %f17 = 000000ff
	lda	[%i4+%o5]0x80,%f17	! %f17 = 0000c691
!	Mem[0000000010041410] = ffffff7f 0000ff00, %l6 = ff000386, %l7 = 148dc691
	ldda	[%i1+%o5]0x88,%l6	! %l6 = 000000000000ff00 00000000ffffff7f
!	Mem[0000000030141410] = 000000ff, %l1 = ffffffff80000000
	ldsha	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = 2dddfdff, %l1 = 0000000000000000
	ldsha	[%i1+%g0]0x88,%l1	! %l1 = fffffffffffffdff
!	Mem[00000000300c1410] = 00000042, %l4 = ffffffffffffffff
	ldswa	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000042
!	Code Fragment 4, seed = 683506
p0_fragment_8:
!	%l0 = 00000000ff000000
	setx	0xbf64cecf34ee9a96,%g7,%l0 ! %l0 = bf64cecf34ee9a96
!	%l1 = fffffffffffffdff
	setx	0x1d8f2d7eb9b003c1,%g7,%l1 ! %l1 = 1d8f2d7eb9b003c1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = bf64cecf34ee9a96
	setx	0x3a14a7074dccc0fc,%g7,%l0 ! %l0 = 3a14a7074dccc0fc
!	%l1 = 1d8f2d7eb9b003c1
	setx	0x384604d37401d547,%g7,%l1 ! %l1 = 384604d37401d547
p0_fragment_8_end:
!	Mem[0000000010101410] = 91c60000, %l6 = 000000000000ff00
	lduha	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141400] = ff005758 148dffff ff000000 ffff00c0
!	Mem[0000000030141410] = 000000ff 00000000 3ba2614c 3f5f0d2e
!	Mem[0000000030141420] = 91c68d14 164d9eff b593a961 f44b9bff
!	Mem[0000000030141430] = ff3185b6 6398e52f 66fbff56 7125d708
	ldda	[%i5+%g0]ASI_BLK_SL,%f0 	! Block Load from 0000000030141400
!	Mem[0000000010001400] = 000000000000ffff, %f30 = 5612ff4c ff0000ff
	ldda	[%i0+%g0]0x88,%f30	! %f30 = 00000000 0000ffff
!	%l6 = 0000000000000000, %l2 = ffffffffffffffff, %l2 = ffffffffffffffff
	andn	%l6,%l2,%l2		! %l2 = 0000000000000000

p0_label_129:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = ffffff7f, Mem[0000000010181400] = 7fffffff 00000052, %asi = 80
	stda	%l6,[%i6+0x000]%asi	! Mem[0000000010181400] = 00000000 ffffff7f
!	%f18 = f3a3ffff, Mem[0000000010141408] = 00000000
	sta	%f18,[%i5+%o4]0x88	! Mem[0000000010141408] = f3a3ffff
!	%l7 = 00000000ffffff7f, Mem[000000001018142e] = 2233092d
	sth	%l7,[%i6+0x02e]		! Mem[000000001018142c] = 2233ff7f
!	%f16 = ff9e4d16, Mem[0000000010041414] = 7fffffff
	sta	%f16,[%i1+0x014]%asi	! Mem[0000000010041414] = ff9e4d16
!	%f23 = 7fffffff, Mem[0000000030101400] = 000000ff
	sta	%f23,[%i4+%g0]0x81	! Mem[0000000030101400] = 7fffffff
!	Mem[0000000030001400] = 00000080, %l3 = 00000000000000ff
	ldstuba	[%i0+%g0]0x81,%l3	! %l3 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000030181408] = 72ffffff
	stwa	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	Mem[0000000020800040] = ffff65a8, %l7 = 00000000ffffff7f
	ldstuba	[%o1+0x040]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[00000000201c0001] = ffff8148, %l6 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000010141400] = 000000ff 0e460000
	stda	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000ff 000000ff

p0_label_130:
!	Starting 10 instruction Load Burst
!	Mem[000000001008143c] = f6f9ffff, %f25 = 000000ff
	lda	[%i2+0x03c]%asi,%f25	! %f25 = f6f9ffff
!	Mem[0000000010181400] = 00000000, %l3 = 0000000000000000
	ldswa	[%i6+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = ff0000ffff000e00, %l1 = 384604d37401d547
	ldxa	[%i0+%o5]0x80,%l1	! %l1 = ff0000ffff000e00
!	Mem[0000000010001400] = 0000ffff, %l6 = 00000000000000ff
	ldsba	[%i0+%g0]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101400] = 00000000 00000000, %l6 = ffffffff, %l7 = 000000ff
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[00000000201c0000] = ffff8148, %l1 = ff0000ffff000e00
	ldub	[%o0+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030001400] = ff0000800000000e, %l7 = 0000000000000000
	ldxa	[%i0+%g0]0x81,%l7	! %l7 = ff0000800000000e
!	Mem[00000000100c1404] = a83a91fe, %f19 = 0dc60e86
	ld	[%i3+0x004],%f19	! %f19 = a83a91fe
!	%f14 = 08d72571, %f20 = 420015de, %f23 = 7fffffff
	fsubs	%f14,%f20,%f23		! %f23 = c20015de
!	Mem[0000000010081410] = ff000000, %l7 = ff0000800000000e
	ldsw	[%i2+%o5],%l7		! %l7 = ffffffffff000000

p0_label_131:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 0000ff66, %l6 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l6	! %l6 = 000000000000ff66
!	Mem[0000000010081410] = 000000ff, %l5 = 00000000000005b9
	ldstuba	[%i2+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[0000000030001400] = ff000080
	stwa	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000ff
!	%l2 = 0000000000000000, Mem[0000000010001410] = ff0000ffff000e00
	stxa	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000000
	membar	#Sync			! Added by membar checker (22)
!	%l1 = 00000000000000ff, Mem[0000000030141400] = ff005758
	stba	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = ff005758
!	Mem[000000001000141c] = 00000000, %l6 = 0000ff66, %l4 = 00000042
	add	%i0,0x1c,%g1
	casa	[%g1]0x80,%l6,%l4	! %l4 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030081408] = ff00fd9b
	stba	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000fd9b
!	%l7 = ffffffffff000000, %l7 = ffffffffff000000, %y  = ff000000
	sdiv	%l7,%l7,%l6		! %l6 = 000000007fffffff
	mov	%l0,%y			! %y = 4dccc0fc
!	%l4 = 0000000000000000, Mem[0000000010141408] = ffffa3f3
	stwa	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	%l4 = 0000000000000000, Mem[0000000010101408] = 00000000, %asi = 80
	stwa	%l4,[%i4+0x008]%asi	! Mem[0000000010101408] = 00000000

p0_label_132:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 91c60000, %l5 = 00000000000000ff
	lduwa	[%i4+%o5]0x88,%l5	! %l5 = 0000000091c60000
!	Mem[0000000010181408] = ff00000000c68dff, %l7 = ffffffffff000000
	ldxa	[%i6+%o4]0x80,%l7	! %l7 = ff00000000c68dff
!	Mem[0000000030181408] = 00000000, %l6 = 000000007fffffff
	lduha	[%i6+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l0 = 3a14a7074dccc0fc
	ldsha	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041410] = 420015de, %l2 = 0000000000000000
	lduha	[%i1+%o5]0x81,%l2	! %l2 = 0000000000004200
!	Mem[0000000010141414] = ff0000ff, %l4 = 0000000000000000, %asi = 80
	lduwa	[%i5+0x014]%asi,%l4	! %l4 = 00000000ff0000ff
!	Mem[0000000010081410] = 164d9eff000000ff, %l1 = 00000000000000ff
	ldxa	[%i2+%o5]0x88,%l1	! %l1 = 164d9eff000000ff
!	Mem[0000000010081400] = d622e0d4, %l5 = 0000000091c60000
	ldswa	[%i2+%g0]0x88,%l5	! %l5 = ffffffffd622e0d4
!	Mem[0000000010181408] = ff000000, %l6 = 0000000000000000, %asi = 80
	ldswa	[%i6+0x008]%asi,%l6	! %l6 = ffffffffff000000
!	Mem[0000000030101408] = f3a3ffff, %l5 = ffffffffd622e0d4
	ldsha	[%i4+%o4]0x81,%l5	! %l5 = fffffffffffff3a3

p0_label_133:
!	Starting 10 instruction Store Burst
!	%l5 = fffffffffffff3a3, Mem[0000000030041410] = 420015de
	stha	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = f3a315de
!	%l4 = 00000000ff0000ff, Mem[0000000030001410] = 00000000
	stba	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = ff000000
!	%l5 = fffffffffffff3a3, Mem[000000001018142f] = 2233ff7f
	stb	%l5,[%i6+0x02f]		! Mem[000000001018142c] = 2233ffa3
!	%f22 = 0000004a, Mem[0000000030081408] = 9bfd0000
	sta	%f22,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000004a
!	Mem[00000000218001c1] = 59ffa358, %l3 = 0000000000000000
	ldstuba	[%o3+0x1c1]%asi,%l3	! %l3 = 00000000000000ff
!	%l1 = 164d9eff000000ff, Mem[000000001008140a] = 86ffffff, %asi = 80
	stba	%l1,[%i2+0x00a]%asi	! Mem[0000000010081408] = 86ffffff
!	%f12 = 2fe59863 b68531ff, %l4 = 00000000ff0000ff
!	Mem[0000000010181408] = ff00000000c68dff
	add	%i6,0x008,%g1
	stda	%f12,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010181408] = ff3185b66398e52f
!	%f30 = 00000000, Mem[0000000010081418] = 0000d7ff
	st	%f30,[%i2+0x018]	! Mem[0000000010081418] = 00000000
!	%l4 = 00000000ff0000ff, Mem[00000000100c1408] = 000000ff
	stba	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff
!	%l1 = 164d9eff000000ff, Mem[0000000010081400] = d4e022d600000043
	stxa	%l1,[%i2+%g0]0x80	! Mem[0000000010081400] = 164d9eff000000ff

p0_label_134:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff9e4d16, %l4 = 00000000ff0000ff
	lduwa	[%i2+%g0]0x88,%l4	! %l4 = 00000000ff9e4d16
!	Mem[0000000030181408] = 00000000, %l6 = ffffffffff000000
	lduba	[%i6+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = 0000ff00, %l1 = 164d9eff000000ff
	ldsba	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081428] = 000000ff 04c60eff, %l0 = 00000000, %l1 = 00000000
	ldd	[%i2+0x028],%l0		! %l0 = 00000000000000ff 0000000004c60eff
!	Mem[00000000300c1410] = 00000042000000ff, %l1 = 0000000004c60eff
	ldxa	[%i3+%o5]0x81,%l1	! %l1 = 00000042000000ff
!	Mem[0000000010181400] = 00000000, %l0 = 00000000000000ff
	lduha	[%i6+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l1 = 00000042000000ff
	lduha	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1410] = 00000042000000ff, %l6 = 0000000000000000
	ldxa	[%i3+%o5]0x81,%l6	! %l6 = 00000042000000ff
!	Mem[0000000030041410] = de15a3f3, %l7 = ff00000000c68dff
	ldsba	[%i1+%o5]0x89,%l7	! %l7 = fffffffffffffff3
!	Mem[0000000030081400] = 00000000, %l3 = 00000000000000ff
	lduba	[%i2+%g0]0x81,%l3	! %l3 = 0000000000000000

p0_label_135:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = ff0000ff, %l0 = 0000000000000000
	swapa	[%i6+%o5]0x88,%l0	! %l0 = 00000000ff0000ff
!	%l4 = 00000000ff9e4d16, Mem[0000000010041408] = 0000009b
	stwa	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = ff9e4d16
!	Mem[0000000030101400] = 7fffffff, %l6 = 00000000000000ff
	swapa	[%i4+%g0]0x81,%l6	! %l6 = 000000007fffffff
!	Mem[0000000010101408] = 00000000, %l7 = fffffffffffffff3
	ldstuba	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000
!	%f6  = 2e0d5f3f, %f27 = ff000000, %f17 = 0000c691
	fsubs	%f6 ,%f27,%f17		! %f17 = 7f000000
!	Mem[0000000030081400] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000030081408] = 4a000000
	stha	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	Mem[00000000300c1408] = 000000ff, %l0 = 00000000ff0000ff
	ldstuba	[%i3+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %l4 = 00000000ff9e4d16
	ldstuba	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c142f] = 40bc7177, %l1 = 0000000000000000
	ldstub	[%i3+0x02f],%l1		! %l1 = 0000000000000077

p0_label_136:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181438] = ffffffff00000089, %l2 = 0000000000004200, %asi = 80
	ldxa	[%i6+0x038]%asi,%l2	! %l2 = ffffffff00000089
!	Mem[00000000100c1410] = 000000ff86ffffff, %l7 = 0000000000000000
	ldx	[%i3+%o5],%l7		! %l7 = 000000ff86ffffff
!	Mem[0000000010181410] = 00000000, %l3 = 0000000000000000
	lduha	[%i6+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081410] = ff000000, %f19 = a83a91fe
	lda	[%i2+%o5]0x80,%f19	! %f19 = ff000000
!	Mem[0000000010181400] = 00000000, %l1 = 0000000000000077
	lduwa	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041408] = fe8ec600, %l4 = 0000000000000000
	lduba	[%i1+%o4]0x81,%l4	! %l4 = 00000000000000fe
!	Mem[0000000010101404] = 00000000, %l0 = 00000000000000ff
	lduw	[%i4+0x004],%l0		! %l0 = 0000000000000000
!	Mem[0000000030041410] = f3a315de5612554c, %f14 = 08d72571 56fffb66
	ldda	[%i1+%o5]0x81,%f14	! %f14 = f3a315de 5612554c
!	Mem[0000000010081404] = 000000ff, %l6 = 000000007fffffff, %asi = 80
	ldsha	[%i2+0x004]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = 0000e520 c2fdcb24, %l2 = 00000089, %l3 = 00000000
	ldda	[%i0+%o4]0x81,%l2	! %l2 = 000000000000e520 00000000c2fdcb24

p0_label_137:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010101408] = 000000ff
	stwa	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	%f6  = 2e0d5f3f, Mem[00000000100c1408] = 000000ff
	sta	%f6 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 2e0d5f3f
!	%l5 = fffffffffffff3a3, Mem[0000000010001410] = 00000000
	stwa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = fffff3a3
!	%l2 = 000000000000e520, Mem[0000000030041408] = fe8ec600
	stha	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = e520c600
!	%l0 = 0000000000000000, Mem[0000000010141410] = 00000000
	stwa	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	Mem[0000000010041400] = fffddd2d, %l4 = 00000000000000fe
	ldstuba	[%i1+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041408] = e520c600, %l7 = 000000ff86ffffff
	ldstuba	[%i1+%o4]0x81,%l7	! %l7 = 00000000000000e5
!	%l6 = 0000000000000000, Mem[000000001008143c] = f6f9ffff
	stw	%l6,[%i2+0x03c]		! Mem[000000001008143c] = 00000000
!	%l7 = 00000000000000e5, Mem[0000000030141408] = 000000ff
	stha	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000e5
!	Mem[00000000100c1424] = ffffffff, %l2 = 000000000000e520
	swap	[%i3+0x024],%l2		! %l2 = 00000000ffffffff

p0_label_138:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 2e0d5f3f, %f11 = 61a993b5
	lda	[%i3+%o4]0x88,%f11	! %f11 = 2e0d5f3f
!	Mem[0000000010041410] = 0000ff00, %l1 = 0000000000000000
	lduha	[%i1+%o5]0x88,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010181410] = 00000000, %l5 = fffffffffffff3a3
	lduha	[%i6+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081400] = ff000000 0dc60e86, %l2 = ffffffff, %l3 = c2fdcb24
	ldda	[%i2+%g0]0x81,%l2	! %l2 = 00000000ff000000 000000000dc60e86
!	Mem[00000000100c141c] = 0000d786, %f26 = 86d700ff
	ld	[%i3+0x01c],%f26	! %f26 = 0000d786
!	Mem[0000000030181400] = 0000004a d3f8faca 00000000 86ffffff
!	Mem[0000000030181410] = 00000000 00000000 9bfddd2d 4a000000
!	Mem[0000000030181420] = ff000000 cbbee421 ffffff86 ffffff86
!	Mem[0000000030181430] = ff000000 00000000 000000c0 d3f8faca
	ldda	[%i6+%g0]ASI_BLK_AIUS,%f0 	! Block Load from 0000000030181400
!	Mem[0000000010041424] = 5fdd00ff, %f29 = 86ffffff
	lda	[%i1+0x024]%asi,%f29	! %f29 = 5fdd00ff
!	Mem[00000000100c1400] = 000e00ff, %l7 = 00000000000000e5
	lduwa	[%i3+%g0]0x88,%l7	! %l7 = 00000000000e00ff
!	Mem[0000000010181400] = 00000000, %f25 = f6f9ffff
	lda	[%i6+%g0]0x80,%f25	! %f25 = 00000000
!	%f1  = d3f8faca, %f22 = 0000004a c20015de
	fitod	%f1 ,%f22		! %f22 = c1c60382 9b000000

p0_label_139:
!	Starting 10 instruction Store Burst
!	%f15 = d3f8faca, %f5  = 00000000
	fcmpes	%fcc3,%f15,%f5 		! %fcc3 = 1
!	%f12 = ff000000 00000000, %l2 = 00000000ff000000
!	Mem[0000000030001438] = 66fbff567125d708
	add	%i0,0x038,%g1
	stda	%f12,[%g1+%l2]ASI_PST32_S ! Mem[0000000030001438] = 66fbff567125d708
!	Mem[0000000030001400] = 000000ff 0000000e 0000e520 c2fdcb24
!	%f0  = 0000004a d3f8faca 00000000 86ffffff
!	%f4  = 00000000 00000000 9bfddd2d 4a000000
!	%f8  = ff000000 cbbee421 ffffff86 ffffff86
!	%f12 = ff000000 00000000 000000c0 d3f8faca
	stda	%f0 ,[%i0+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030001400
!	%f22 = c1c60382 9b000000, %l2 = 00000000ff000000
!	Mem[0000000030041420] = 000040bc000000ff
	add	%i1,0x020,%g1
	stda	%f22,[%g1+%l2]ASI_PST32_SL ! Mem[0000000030041420] = 000040bc000000ff
!	%l5 = 0000000000000000, Mem[0000000030041410] = de15a3f3
	stba	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = de15a300
!	Mem[0000000010081408] = 86ffffff, %l2 = 00000000ff000000
	swap	[%i2+%o4],%l2		! %l2 = 0000000086ffffff
!	Mem[0000000030101400] = 000000ff, %l4 = 00000000000000ff
	swapa	[%i4+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%l1 = 000000000000ff00, Mem[0000000030141400] = ff005758
	stha	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = ff005758
!	%l6 = 0000000000000000, Mem[0000000010041410] = 0000ff00
	stba	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000ff00
!	Mem[00000000300c1400] = 00000000, %l5 = 0000000000000000
	swapa	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000000

p0_label_140:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 3f5f0d2e, %l7 = 00000000000e00ff
	lduwa	[%i3+%o4]0x80,%l7	! %l7 = 000000003f5f0d2e
!	Mem[00000000211c0000] = ff00d1d8, %l2 = 0000000086ffffff, %asi = 80
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 000000000000ff00
!	%l2 = 000000000000ff00, %l1 = 000000000000ff00, %l1 = 000000000000ff00
	subc	%l2,%l1,%l1		! %l1 = 0000000000000000
!	Mem[0000000010101438] = 5e04974affffa3f3, %f28 = 86ffffff 5fdd00ff
	ldd	[%i4+0x038],%f28	! %f28 = 5e04974a ffffa3f3
!	Mem[0000000030081410] = ff0000ff, %f28 = 5e04974a
	lda	[%i2+%o5]0x89,%f28	! %f28 = ff0000ff
	membar	#Sync			! Added by membar checker (23)
!	Mem[000000001000142c] = ff000000, %l3 = 000000000dc60e86, %asi = 80
	ldswa	[%i0+0x02c]%asi,%l3	! %l3 = ffffffffff000000
!	Mem[0000000030141408] = c000ffff000000e5, %f22 = c1c60382 9b000000
	ldda	[%i5+%o4]0x89,%f22	! %f22 = c000ffff 000000e5
!	Mem[0000000010181410] = 00000000, %l0 = 0000000000000000
	ldsba	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001408] = 86ffffff, %l7 = 000000003f5f0d2e
	lduba	[%i0+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %l4 = 00000000000000ff
	ldsba	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000000

p0_label_141:
!	Starting 10 instruction Store Burst
!	%f2  = 00000000 86ffffff, Mem[0000000030081408] = 00000000 00000000
	stda	%f2 ,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000 86ffffff
!	Mem[00000000211c0000] = ff00d1d8, %l7 = 00000000000000ff
	ldstuba	[%o2+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000010141400] = 000000ff000000ff
	stxa	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000030101410] = de150042
	stwa	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	Mem[0000000030181410] = 00000000, %l4 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l4	! %l4 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000030101408] = ffffa3f3
	stba	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = ffffa300
!	%l4 = 0000000000000000, Mem[0000000030041410] = 4c551256de15a300
	stxa	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000000000000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000030001408] = ffffff86 00000000
	stda	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000 00000000
!	%l6 = 0000000000000000, Mem[00000000218001c0] = 59ffa358, %asi = 80
	stba	%l6,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 00ffa358
!	Mem[0000000010101432] = 00000000, %l7 = 00000000000000ff
	ldstub	[%i4+0x032],%l7		! %l7 = 0000000000000000

p0_label_142:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00000000, %l0 = 0000000000000000
	lduwa	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = 0000000091c68d14, %l4 = 0000000000000000, %asi = 80
	ldxa	[%i6+0x010]%asi,%l4	! %l4 = 0000000091c68d14
!	Mem[00000000300c1408] = 000000ff, %f10 = ffffff86
	lda	[%i3+%o4]0x89,%f10	! %f10 = 000000ff
!	Mem[00000000218000c0] = 775e5a98, %l5 = 0000000000000000
	ldsh	[%o3+0x0c0],%l5		! %l5 = 000000000000775e
!	Mem[0000000010101408] = 00000000, %f8  = ff000000
	lda	[%i4+%o4]0x80,%f8 	! %f8 = 00000000
!	Mem[00000000300c1400] = ff9e4d16 00000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i3+%g0]0x89,%l0	! %l0 = 0000000000000000 00000000ff9e4d16
!	Mem[00000000211c0001] = ff00d1d8, %l7 = 0000000000000000
	ldub	[%o2+0x001],%l7		! %l7 = 0000000000000000
!	Mem[00000000100c1408] = ff9e4d162e0d5f3f, %f10 = 000000ff ffffff86
	ldda	[%i3+%o4]0x88,%f10	! %f10 = ff9e4d16 2e0d5f3f
!	Mem[00000000201c0000] = ffff8148, %l7 = 0000000000000000, %asi = 80
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010081408] = ff000000, %l7 = ffffffffffffffff
	ldsha	[%i2+%o4]0x80,%l7	! %l7 = ffffffffffffff00

p0_label_143:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001429] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i0+0x029]%asi,%l6	! %l6 = 0000000000000000
!	%l3 = ffffffffff000000, Mem[0000000030181410] = 00000000
	stwa	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = ff000000
!	Mem[00000000100c1400] = ff000e00, %l3 = 00000000ff000000
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 00000000ff000e00
!	%f26 = 0000d786, Mem[00000000100c1400] = 000000ff
	sta	%f26,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000d786
!	%l4 = 0000000091c68d14, Mem[0000000030001410] = 00000000
	stha	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 00008d14
!	Mem[0000000020800000] = 00fff578, %l5 = 000000000000775e
	ldstub	[%o1+%g0],%l5		! %l5 = 0000000000000000
!	Mem[0000000010181430] = 00000000, %l4 = 0000000091c68d14
	swap	[%i6+0x030],%l4		! %l4 = 0000000000000000
!	%l1 = 00000000ff9e4d16, Mem[0000000010181410] = 00000000
	stha	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = 4d160000
!	%l6 = 00000000, %l7 = ffffff00, Mem[0000000010081400] = ff9e4d16 ff000000
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000 ffffff00
!	%f14 = 000000c0, Mem[00000000100c1408] = 3f5f0d2e
	sta	%f14,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000c0

p0_label_144:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 148dc6910000164d, %l3 = 00000000ff000e00
	ldxa	[%i6+%o5]0x88,%l3	! %l3 = 148dc6910000164d
!	Mem[0000000010001408] = d4e00000, %l7 = ffffffffffffff00
	ldsha	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001410] = 00008d14, %l1 = 00000000ff9e4d16
	lduba	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000014
!	Mem[0000000010181400] = 00000000, %l4 = 0000000000000000
	lduwa	[%i6+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001410] = 00008d14, %l6 = 0000000000000000
	lduba	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000014
!	Mem[0000000030101408] = 860ec60dffffa300, %f8  = 00000000 cbbee421
	ldda	[%i4+%o4]0x89,%f8 	! %f8  = 860ec60d ffffa300
!	Mem[0000000030101408] = ffffa300, %l1 = 0000000000000014
	lduba	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = 000000ff, %l4 = 0000000000000000
	lduba	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141430] = 57fbe2ffff000000, %f24 = 000040bc 00000000, %asi = 80
	ldda	[%i5+0x030]%asi,%f24	! %f24 = 57fbe2ff ff000000
!	Mem[000000001018143a] = ffffffff, %l0 = 0000000000000000
	ldsb	[%i6+0x03a],%l0		! %l0 = ffffffffffffffff

p0_label_145:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101438] = 5e04974affffa3f3, %l2 = 000000000000ff00, %l1 = 0000000000000000
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l2,%l1	! %l1 = 5e04974affffa3f3
!	%l2 = 000000000000ff00, Mem[0000000010001414] = 00000000, %asi = 80
	stba	%l2,[%i0+0x014]%asi	! Mem[0000000010001414] = 00000000
!	Mem[0000000030001400] = d3f8faca, %l7 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l7	! %l7 = 00000000d3f8faca
!	%f24 = 57fbe2ff ff000000, Mem[0000000010101410] = 91c60000 148dc1f1
	stda	%f24,[%i4+%o5]0x88	! Mem[0000000010101410] = 57fbe2ff ff000000
!	%l5 = 0000000000000000, Mem[00000000201c0000] = ffff8148, %asi = 80
	stha	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00008148
!	Mem[00000000100c1408] = 000000c0, %l1 = 00000000ffffa3f3
	swapa	[%i3+%o4]0x80,%l1	! %l1 = 00000000000000c0
!	%l4 = 0000000000000000, Mem[00000000100c1420] = 000040bc0000e520
	stx	%l4,[%i3+0x020]		! Mem[00000000100c1420] = 0000000000000000
!	%l3 = 148dc6910000164d, Mem[0000000010081428] = 000000ff04c60eff
	stx	%l3,[%i2+0x028]		! Mem[0000000010081428] = 148dc6910000164d
!	%l5 = 0000000000000000, Mem[0000000021800140] = 207606f8
	sth	%l5,[%o3+0x140]		! Mem[0000000021800140] = 000006f8
!	%l6 = 00000014, %l7 = d3f8faca, Mem[0000000010081400] = 00000000 ffffff00
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000014 d3f8faca

p0_label_146:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000 fffff3a3, %l0 = ffffffff, %l1 = 000000c0
	ldda	[%i0+%o5]0x88,%l0	! %l0 = 00000000fffff3a3 0000000000000000
!	Mem[0000000010041400] = fffddd2d, %l2 = 000000000000ff00
	lduha	[%i1+%g0]0x80,%l2	! %l2 = 000000000000fffd
!	Mem[00000000100c1408] = f3a3ffff, %l3 = 148dc6910000164d
	ldswa	[%i3+%o4]0x88,%l3	! %l3 = fffffffff3a3ffff
!	Mem[0000000030181410] = ff000000, %l5 = 0000000000000000
	ldswa	[%i6+%o5]0x89,%l5	! %l5 = ffffffffff000000
!	Mem[0000000030041408] = 00c620ff, %l4 = 0000000000000000
	ldsba	[%i1+%o4]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030001408] = 00000000, %l2 = 000000000000fffd
	ldsha	[%i0+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = 148d000000000000, %l6 = 0000000000000014
	ldxa	[%i0+%o5]0x81,%l6	! %l6 = 148d000000000000
!	%l0 = 00000000fffff3a3, immd = fffffffffffff59a, %l0  = 00000000fffff3a3
	mulx	%l0,-0xa66,%l0		! %l0 = fffff59a00808f0e
!	Mem[0000000030101410] = 00000000, %l1 = 0000000000000000
	ldsba	[%i4+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081424] = 86ffffff, %f28 = ff0000ff
	lda	[%i2+0x024]%asi,%f28	! %f28 = 86ffffff

p0_label_147:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[00000000100c1408] = ffffa3f3
	stba	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00ffa3f3
!	%l0 = fffff59a00808f0e, Mem[0000000030181400] = 4a000000
	stha	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 4a008f0e
!	%l6 = 148d000000000000, Mem[0000000030141408] = 000000e5
	stwa	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	%f5  = 00000000, Mem[0000000030101408] = ffffa300
	sta	%f5 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	%l3 = fffffffff3a3ffff, Mem[0000000030181410] = 000000ff00000000
	stxa	%l3,[%i6+%o5]0x81	! Mem[0000000030181410] = fffffffff3a3ffff
!	%l1 = 0000000000000000, Mem[0000000010081410] = 000000ff
	stba	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000
!	Mem[0000000010081400] = 14000000 cafaf8d3 ff000000 d622e0d4
!	%f16 = ff9e4d16 7f000000 f3a3ffff ff000000
!	%f20 = 420015de 5612554c c000ffff 000000e5
!	%f24 = 57fbe2ff ff000000 0000d786 ff000000
!	%f28 = 86ffffff ffffa3f3 00000000 0000ffff
	stda	%f16,[%i2+%g0]ASI_COMMIT_P	! Block Store to 0000000010081400
!	Mem[000000001004142f] = ffffa3f3, %l6 = 148d000000000000
	ldstuba	[%i1+0x02f]%asi,%l6	! %l6 = 00000000000000f3
!	%l6 = 00000000000000f3, Mem[0000000030041400] = 00000000
	stwa	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000f3
!	Mem[0000000030181410] = ffffffff, %l6 = 00000000000000f3
	swapa	[%i6+%o5]0x81,%l6	! %l6 = 00000000ffffffff

p0_label_148:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181414] = 91c68d14, %l1 = 0000000000000000
	ldsw	[%i6+0x014],%l1		! %l1 = ffffffff91c68d14
!	Mem[000000001004143e] = 4a000000, %l0 = fffff59a00808f0e
	lduh	[%i1+0x03e],%l0		! %l0 = 0000000000000000
!	Mem[0000000030041408] = 860ec60d 00c620ff, %l2 = 00000000, %l3 = f3a3ffff
	ldda	[%i1+%o4]0x89,%l2	! %l2 = 0000000000c620ff 00000000860ec60d
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000010001400] = ffff0000 00000000 0000e0d4 4a000000
!	Mem[0000000010001410] = a3f3ffff 00000000 000000ff 00000000
!	Mem[0000000010001420] = 7655c940 11715c51 00ff0000 ff000000
!	Mem[0000000010001430] = 6a93944d 2fe59863 80788f42 421d1d32
	ldda	[%i0+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010001400
!	Mem[0000000010081410] = 420015de, %l5 = ffffffffff000000
	ldsha	[%i2+%o5]0x80,%l5	! %l5 = 0000000000004200
!	Mem[0000000010141408] = 000000ff, %f11 = 2e0d5f3f
	lda	[%i5+%o4]0x88,%f11	! %f11 = 000000ff
!	Mem[0000000030181400] = 0e8f004a, %l4 = ffffffffffffffff
	lduba	[%i6+%g0]0x81,%l4	! %l4 = 000000000000000e
!	Mem[0000000020800040] = ffff65a8, %l0 = 0000000000000000, %asi = 80
	lduha	[%o1+0x040]%asi,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010181410] = 0000164d, %l4 = 000000000000000e
	lduha	[%i6+%o5]0x88,%l4	! %l4 = 000000000000164d
!	Mem[0000000010041400] = fffddd2d, %l5 = 0000000000004200
	ldswa	[%i1+%g0]0x80,%l5	! %l5 = fffffffffffddd2d

p0_label_149:
!	Starting 10 instruction Store Burst
!	%f19 = d4e00000, Mem[0000000010101408] = 00000000
	sta	%f19,[%i4+%o4]0x80	! Mem[0000000010101408] = d4e00000
!	%l4 = 0000164d, %l5 = fffddd2d, Mem[0000000010081400] = ff9e4d16 7f000000
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000164d fffddd2d
!	%l4 = 000000000000164d, Mem[00000000211c0001] = ff00d1d8
	stb	%l4,[%o2+0x001]		! Mem[00000000211c0000] = ff4dd1d8
!	Mem[0000000010001400] = ffff0000, %l5 = fffffffffffddd2d
	ldstuba	[%i0+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101410] = ff000000, %l1 = 0000000091c68d14
	swapa	[%i4+%o5]0x88,%l1	! %l1 = 00000000ff000000
!	%l1 = 00000000ff000000, Mem[0000000010081400] = 2dddfdff4d160000
	stxa	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000ff000000
!	Mem[0000000030001410] = 00008d14, %l6 = 00000000ffffffff
	ldstuba	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000014
!	Mem[0000000010001410] = fffff3a3, %l5 = 00000000000000ff
	swapa	[%i0+%o5]0x88,%l5	! %l5 = 00000000fffff3a3
!	%l4 = 0000164d, %l5 = fffff3a3, Mem[0000000030081410] = ff0000ff 000000ff
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000164d fffff3a3
!	%l4 = 000000000000164d, Mem[0000000010081400] = 000000ff, %asi = 80
	stwa	%l4,[%i2+0x000]%asi	! Mem[0000000010081400] = 0000164d

p0_label_150:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001424] = 11715c51, %l0 = 000000000000ffff, %asi = 80
	ldswa	[%i0+0x024]%asi,%l0	! %l0 = 0000000011715c51
!	Mem[0000000010101408] = c1000000 0000e0d4, %l0 = 11715c51, %l1 = ff000000
	ldda	[%i4+%o4]0x88,%l0	! %l0 = 000000000000e0d4 00000000c1000000
!	Mem[0000000030001408] = 00000000, %l1 = 00000000c1000000
	ldsba	[%i0+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1408] = ff000000 ff00d786, %l2 = 00c620ff, %l3 = 860ec60d
	ldda	[%i3+%o4]0x81,%l2	! %l2 = 00000000ff000000 00000000ff00d786
!	Mem[0000000010081408] = f3a3ffff, %l4 = 000000000000164d
	ldsba	[%i2+%o4]0x80,%l4	! %l4 = fffffffffffffff3
!	%l2 = 00000000ff000000, imm = 000000000000089a, %l1 = 0000000000000000
	or	%l2,0x89a,%l1		! %l1 = 00000000ff00089a
!	Mem[0000000010041410] = 00ff0000, %l3 = 00000000ff00d786
	ldsha	[%i1+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181410] = 0000164d, %l6 = 0000000000000014
	ldsha	[%i6+%o5]0x88,%l6	! %l6 = 000000000000164d
!	Mem[0000000010141408] = ff00000086d70000, %f0  = 0000004a d3f8faca
	ldda	[%i5+%o4]0x80,%f0 	! %f0  = ff000000 86d70000
!	Mem[0000000030001408] = 00000000, %f6  = 9bfddd2d
	lda	[%i0+%o4]0x89,%f6 	! %f6 = 00000000

p0_label_151:
!	Starting 10 instruction Store Burst
!	%f11 = 000000ff, Mem[0000000010101400] = 00000000
	sta	%f11,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff
!	%l5 = 00000000fffff3a3, Mem[00000000211c0000] = ff4dd1d8
	sth	%l5,[%o2+%g0]		! Mem[00000000211c0000] = f3a3d1d8
!	%l5 = 00000000fffff3a3, Mem[0000000020800040] = ffff65a8, %asi = 80
	stha	%l5,[%o1+0x040]%asi	! Mem[0000000020800040] = f3a365a8
!	%l7 = 00000000d3f8faca, %l2 = 00000000ff000000, %l0 = 000000000000e0d4
	subc	%l7,%l2,%l0		! %l0 = ffffffffd4f8faca
!	%f2  = 00000000 86ffffff, Mem[0000000010141428] = 860ec60d ffff00f3
	std	%f2 ,[%i5+0x028]	! Mem[0000000010141428] = 00000000 86ffffff
!	%l1 = 00000000ff00089a, Mem[0000000021800001] = ffde3a08
	stb	%l1,[%o3+0x001]		! Mem[0000000021800000] = ff9a3a08
!	%l6 = 000000000000164d, immd = 000000000000038d, %l108 = 0000000000000003
	udivx	%l6,0x38d,%l3		! %l3 = 0000000000000006
!	%l7 = 00000000d3f8faca, Mem[0000000010181408] = ff3185b6
	stwa	%l7,[%i6+%o4]0x80	! Mem[0000000010181408] = d3f8faca
!	Mem[0000000030101400] = 000000ff 91c68d14 00000000 0dc60e86
!	%f0  = ff000000 86d70000 00000000 86ffffff
!	%f4  = 00000000 00000000 00000000 4a000000
!	%f8  = 860ec60d ffffa300 ff9e4d16 000000ff
!	%f12 = ff000000 00000000 000000c0 d3f8faca
	stda	%f0 ,[%i4+%g0]ASI_BLK_SL	! Block Store to 0000000030101400
!	%l1 = 00000000ff00089a, Mem[0000000010141400] = 00000000
	stha	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = 089a0000

p0_label_152:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000, %l4 = fffffffffffffff3
	lduba	[%i3+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141408] = ff000000, %l5 = 00000000fffff3a3
	ldsba	[%i5+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030081408] = ffffff86, %l6 = 000000000000164d
	lduha	[%i2+%o4]0x81,%l6	! %l6 = 000000000000ffff
!	Mem[00000000100c1410] = ff000000, %f22 = 00000000
	lda	[%i3+%o5]0x88,%f22	! %f22 = ff000000
!	Mem[0000000030141400] = ff005758148dffff, %l7 = 00000000d3f8faca
	ldxa	[%i5+%g0]0x81,%l7	! %l7 = ff005758148dffff
!	Mem[0000000010181424] = ffffffff, %f30 = 321d1d42
	ld	[%i6+0x024],%f30	! %f30 = ffffffff
!	Mem[0000000030041410] = 00000000, %l7 = ff005758148dffff
	ldsba	[%i1+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081400] = ff000000, %f24 = 515c7111
	lda	[%i2+%g0]0x81,%f24	! %f24 = ff000000
!	Mem[0000000030001410] = ff8d0000, %f24 = ff000000
	lda	[%i0+%o5]0x81,%f24	! %f24 = ff8d0000
!	Mem[00000000100c1425] = 00000000, %l6 = 000000000000ffff
	ldsb	[%i3+0x025],%l6		! %l6 = 0000000000000000

p0_label_153:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 000000ff, %l5 = 00000000ffffffff
	swapa	[%i3+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[0000000010081410] = 420015de
	stha	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = 00ff15de
!	%f6  = 00000000 4a000000, %l0 = ffffffffd4f8faca
!	Mem[0000000030101430] = 00000000000000ff
	add	%i4,0x030,%g1
	stda	%f6,[%g1+%l0]ASI_PST32_S ! Mem[0000000030101430] = 00000000000000ff
!	Mem[0000000030181400] = 0e8f004a, %l4 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l4	! %l4 = 000000000e8f004a
!	%l3 = 0000000000000006, Mem[0000000030081408] = ffffff8600000000
	stxa	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000000000006
!	%f6  = 00000000, Mem[0000000030101400] = 86d70000
	sta	%f6 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	%f0  = ff000000, Mem[0000000030101408] = ffffff86
	sta	%f0 ,[%i4+%o4]0x81	! Mem[0000000030101408] = ff000000
!	Mem[00000000300c1410] = 00000042, %l4 = 000000000e8f004a
	swapa	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000042
!	%f7  = 4a000000, Mem[0000000030141410] = ff000000
	sta	%f7 ,[%i5+%o5]0x89	! Mem[0000000030141410] = 4a000000
!	%f15 = d3f8faca, Mem[00000000100c140c] = 164d9eff
	st	%f15,[%i3+0x00c]	! Mem[00000000100c140c] = d3f8faca

p0_label_154:
!	Starting 10 instruction Load Burst
!	%f9  = ffffa300, %f1  = 86d70000, %f20 = 00000000
	fsubs	%f9 ,%f1 ,%f20		! %f20 = ffffa300
!	Mem[0000000030001400] = 00000000, %l2 = 00000000ff000000
	ldsba	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = 0000000000008dff, %l6 = 0000000000000000
	ldxa	[%i0+%o5]0x89,%l6	! %l6 = 0000000000008dff
!	Mem[0000000010081408] = f3a3ffffff000000, %f20 = ffffa300 fffff3a3
	ldd	[%i2+%o4],%f20		! %f20 = f3a3ffff ff000000
!	Mem[0000000010181400] = 00000000, %l3 = 0000000000000006
	ldsha	[%i6+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l4 = 0000000000000042
	lduba	[%i6+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041408] = ff20c6000dc60e86, %f30 = ffffffff 428f7880
	ldda	[%i1+%o4]0x81,%f30	! %f30 = ff20c600 0dc60e86
!	Mem[0000000020800000] = fffff578, %l6 = 0000000000008dff
	ldub	[%o1+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010181410] = 4d160000, %l0 = ffffffffd4f8faca
	ldsba	[%i6+%o5]0x80,%l0	! %l0 = 000000000000004d
!	Mem[0000000030041408] = 860ec60d00c620ff, %f30 = ff20c600 0dc60e86
	ldda	[%i1+%o4]0x89,%f30	! %f30 = 860ec60d 00c620ff

p0_label_155:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, immd = fffff425, %y  = 4dccc0fc
	smul	%l2,-0xbdb,%l2		! %l2 = 0000000000000000, %y = 00000000
!	%l6 = 00000000000000ff, Mem[0000000020800041] = f3a365a8, %asi = 80
	stba	%l6,[%o1+0x041]%asi	! Mem[0000000020800040] = f3ff65a8
	membar	#Sync			! Added by membar checker (25)
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000010001430] = 6a93944d 2fe59863
	std	%l6,[%i0+0x030]		! Mem[0000000010001430] = 000000ff 00000000
!	%l3 = 0000000000000000, imm = 0000000000000aa8, %l0 = 000000000000004d
	subc	%l3,0xaa8,%l0		! %l0 = fffffffffffff558
!	%l2 = 0000000000000000, Mem[0000000010041408] = ff9e4d16
	stba	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = ff9e4d00
!	Mem[00000000211c0000] = f3a3d1d8, %l5 = 00000000000000ff
	ldstub	[%o2+%g0],%l5		! %l5 = 00000000000000f3
!	Mem[0000000010081437] = ffffa3f3, %l3 = 0000000000000000
	ldstuba	[%i2+0x037]%asi,%l3	! %l3 = 00000000000000f3
!	%l3 = 00000000000000f3, Mem[0000000030141408] = 00000000
	stwa	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000f3
!	%f13 = 00000000, Mem[0000000010081418] = c000ffff
	sta	%f13,[%i2+0x018]%asi	! Mem[0000000010081418] = 00000000
!	Mem[0000000021800040] = 460e9e38, %l3 = 00000000000000f3
	ldstub	[%o3+0x040],%l3		! %l3 = 0000000000000046

p0_label_156:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1438] = ffff9eff, %l7 = 0000000000000000, %asi = 80
	lduwa	[%i3+0x038]%asi,%l7	! %l7 = 00000000ffff9eff
!	%l0 = fffffffffffff558, %l2 = 0000000000000000, %y  = 00000000
	sdiv	%l0,%l2,%l0		! Div by zero, %l0 = fffffffffffff580
!	Mem[0000000030101400] = 00000000, %l7 = 00000000ffff9eff
	lduha	[%i4+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081401] = 0000164d, %l0 = fffffffffffff580, %asi = 80
	lduba	[%i2+0x001]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l3 = 0000000000000046
	ldsba	[%i0+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l5 = 00000000000000f3
	lduha	[%i6+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = ff9e4d1600000000, %l6 = 00000000000000ff
	ldxa	[%i3+%g0]0x89,%l6	! %l6 = ff9e4d1600000000
!	Mem[00000000100c142f] = 40bc71ff, %l7 = 0000000000000000, %asi = 80
	ldsba	[%i3+0x02f]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010141403] = 089a0000, %l4 = 0000000000000000
	ldstub	[%i5+0x003],%l4		! %l4 = 0000000000000000
!	Mem[0000000010181410] = 4d160000, %l7 = ffffffffffffffff
	ldsha	[%i6+%o5]0x80,%l7	! %l7 = 0000000000004d16

p0_label_157:
!	Starting 10 instruction Store Burst
!	Mem[000000001010143b] = 5e04974a, %l7 = 0000000000004d16
	ldstuba	[%i4+0x03b]%asi,%l7	! %l7 = 000000000000004a
!	Mem[0000000030001410] = 00008dff, %l4 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	%f24 = ff8d0000 40c95576, Mem[0000000030081410] = 4d160000 a3f3ffff
	stda	%f24,[%i2+%o5]0x89	! Mem[0000000030081410] = ff8d0000 40c95576
!	%l5 = 0000000000000000, Mem[0000000030041400] = ff0c0000f3000000
	stxa	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000000000000000
!	%l4 = 00000000000000ff, Mem[0000000010141408] = 000000ff
	stba	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff
!	%l6 = ff9e4d1600000000, Mem[0000000010081400] = 0000164d
	stwa	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	Mem[0000000010181410] = 4d160000, %l7 = 000000000000004a
	swapa	[%i6+%o5]0x80,%l7	! %l7 = 000000004d160000
!	Mem[0000000010001404] = 00000000, %l1 = ff00089a, %l4 = 000000ff
	add	%i0,0x04,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141410] = 0000004a, %l1 = 00000000ff00089a
	ldstuba	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000201c0000] = 00008148, %l3 = 0000000000000000
	ldstub	[%o0+%g0],%l3		! %l3 = 0000000000000000

p0_label_158:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 004d9eff 00000000, %l6 = 00000000, %l7 = 4d160000
	ldda	[%i1+%o4]0x80,%l6	! %l6 = 00000000004d9eff 0000000000000000
!	Mem[000000001008143a] = 00000000, %l6 = 00000000004d9eff, %asi = 80
	ldsha	[%i2+0x03a]%asi,%l6	! %l6 = 0000000000000000
!	Mem[000000001008141c] = 000000e5, %l1 = 0000000000000000, %asi = 80
	ldswa	[%i2+0x01c]%asi,%l1	! %l1 = 00000000000000e5
!	%l2 = 0000000000000000, imm = 0000000000000215, %l1 = 00000000000000e5
	andn	%l2,0x215,%l1		! %l1 = 0000000000000000
!	Mem[0000000010181408] = cafaf8d3, %l6 = 0000000000000000
	lduwa	[%i6+%o4]0x88,%l6	! %l6 = 00000000cafaf8d3
!	Mem[000000001014143c] = 91c6e9f5, %l7 = 0000000000000000
	ldub	[%i5+0x03c],%l7		! %l7 = 0000000000000091
!	Mem[0000000030181410] = 000000f3, %l6 = 00000000cafaf8d3
	ldsba	[%i6+%o5]0x81,%l6	! %l6 = 0000000000000000
!	%l0 = 0000000000000000, imm = 0000000000000186, %l0 = 0000000000000000
	andn	%l0,0x186,%l0		! %l0 = 0000000000000000
!	Mem[0000000010101400] = ff000000, %l7 = 0000000000000091
	ldsba	[%i4+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030041408] = 860ec60d00c620ff, %l3 = 0000000000000000
	ldxa	[%i1+%o4]0x89,%l3	! %l3 = 860ec60d00c620ff

p0_label_159:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[00000000100c1410] = 000000ff
	stha	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000ff
!	Mem[0000000010141400] = 089a00ff, %l3 = 0000000000c620ff
	swapa	[%i5+%g0]0x80,%l3	! %l3 = 00000000089a00ff
!	%l2 = 00000000, %l3 = 089a00ff, Mem[0000000010081428] = 0000d786 ff000000
	std	%l2,[%i2+0x028]		! Mem[0000000010081428] = 00000000 089a00ff
!	%l5 = 0000000000000000, Mem[0000000030001400] = 00000000
	stha	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	%l4 = 0000000000000000, %l6 = 0000000000000000, %l4  = 0000000000000000
	mulx	%l4,%l6,%l4		! %l4 = 0000000000000000
!	Mem[0000000021800181] = ff005728, %l5 = 0000000000000000
	ldstub	[%o3+0x181],%l5		! %l5 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010001400] = 0000ffff
	stba	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000ff00
!	Mem[0000000010101408] = 0000e0d4, %l4 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l4	! %l4 = 000000000000e0d4
!	%l7 = ffffffffffffffff, Mem[00000000100c1408] = 00ffa3f3d3f8faca
	stx	%l7,[%i3+%o4]		! Mem[00000000100c1408] = ffffffffffffffff
!	Mem[00000000100c1408] = ffffffff, %l2 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l2	! %l2 = 00000000000000ff

p0_label_160:
!	Starting 10 instruction Load Burst
!	%l7 = ffffffffffffffff, %l0 = 0000000000000000, %l7 = ffffffffffffffff
	orn	%l7,%l0,%l7		! %l7 = ffffffffffffffff
!	Mem[0000000030001408] = 00000000, %f6  = 00000000
	lda	[%i0+%o4]0x89,%f6 	! %f6 = 00000000
!	Mem[0000000021800180] = ffff5728, %l2 = 00000000000000ff
	ldsb	[%o3+0x180],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010081438] = 00000000, %l0 = 0000000000000000, %asi = 80
	lduwa	[%i2+0x038]%asi,%l0	! %l0 = 0000000000000000
!	%l7 = ffffffffffffffff, imm = fffffffffffffed6, %l3 = 00000000089a00ff
	subc	%l7,-0x12a,%l3		! %l3 = 0000000000000129
!	Mem[0000000030141410] = 4a0000ff, %l5 = 0000000000000000
	lduha	[%i5+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101400] = 00000000, %l6 = 0000000000000000
	lduba	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = cafaf8d3, %l2 = ffffffffffffffff
	lduba	[%i6+%o4]0x88,%l2	! %l2 = 00000000000000d3
!	Mem[0000000010041408] = ff9e4d00, %l5 = 00000000000000ff
	lduha	[%i1+%o4]0x88,%l5	! %l5 = 0000000000004d00
!	Mem[0000000010181410] = 4a000000, %l7 = ffffffffffffffff
	ldswa	[%i6+%o5]0x88,%l7	! %l7 = 000000004a000000

p0_label_161:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 000000ff, %l2 = 00000000000000d3
	ldstuba	[%i0+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%f13 = 00000000, Mem[0000000030081408] = 00000000
	sta	%f13,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	%f20 = f3a3ffff ff000000, %l3 = 0000000000000129
!	Mem[0000000010141400] = 00c620ff000000ff
	stda	%f20,[%i5+%l3]ASI_PST16_PL ! Mem[0000000010141400] = 000020ff0000a3f3
!	%l4 = 000000000000e0d4, Mem[00000000100c1408] = ffffffff
	stha	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffffe0d4
!	%l4 = 000000000000e0d4, Mem[0000000010001400] = 00ff0000
	stba	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = d4ff0000
!	%f3  = 86ffffff, %f14 = 000000c0, %f26 = 000000ff 0000ff00
	fsmuld	%f3 ,%f14,%f26		! tt=0x22, %l0 = 0000000000000022
!	%l7 = 000000004a000000, Mem[0000000010141410] = 00000000
	stba	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	%l6 = 0000000000000000, %l2 = 00000000000000ff, %l3 = 0000000000000129
	addc	%l6,%l2,%l3		! %l3 = 00000000000000ff
!	Mem[0000000030101408] = 000000ff, %l2 = 00000000000000ff
	ldstuba	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%l6 = 00000000, %l7 = 4a000000, Mem[0000000030001408] = 00000000 00000000
	stda	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000 4a000000

p0_label_162:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 0000004a, %l0 = 0000000000000022
	ldsba	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000010041400] = fffddd2d 4a000000 004d9eff 00000000
!	Mem[0000000010041410] = 00ff0000 ff9e4d16 000000ff ffffff86
!	Mem[0000000010041420] = 5758d9a0 5fdd00ff 0ed27fde ffffa3ff
!	Mem[0000000010041430] = 5e5c888c 05c386ed 0dc60e86 4a000000
	ldda	[%i1+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	Mem[0000000030001410] = 0000000000008dff, %f6  = 00000000 4a000000
	ldda	[%i0+%o5]0x89,%f6 	! %f6  = 00000000 00008dff
!	Mem[0000000030181408] = ffffff86 00000000, %l4 = 0000e0d4, %l5 = 00004d00
	ldda	[%i6+%o4]0x89,%l4	! %l4 = 0000000000000000 00000000ffffff86
!	Mem[0000000030041408] = 00c620ff, %l2 = 00000000000000ff
	ldsha	[%i1+%o4]0x89,%l2	! %l2 = 00000000000020ff
!	Mem[00000000100c1410] = 000000ff86ffffff, %f4  = 00000000 00000000
	ldda	[%i3+%o5]0x80,%f4 	! %f4  = 000000ff 86ffffff
!	%l7 = 000000004a000000, imm = 00000000000004cb, %l7 = 000000004a000000
	sub	%l7,0x4cb,%l7		! %l7 = 0000000049fffb35
!	Mem[0000000010081400] = 00000000 00000000, %l2 = 000020ff, %l3 = 000000ff
	ldd	[%i2+%g0],%l2		! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000030101400] = 00000000, %f6  = 00000000
	lda	[%i4+%g0]0x81,%f6 	! %f6 = 00000000
!	Mem[0000000010141400] = 000020ff0000a3f3, %f4  = 000000ff 86ffffff
	ldd	[%i5+%g0],%f4 		! %f4  = 000020ff 0000a3f3

p0_label_163:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (27)
!	%f30 = 0dc60e86, Mem[0000000010041408] = ff9e4d00
	sta	%f30,[%i1+%o4]0x88	! Mem[0000000010041408] = 0dc60e86
!	%l2 = 0000000000000000, Mem[0000000010141408] = 000000ff
	stha	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%l2 = 0000000000000000, Mem[0000000010101430] = 0000ff0000000000
	stx	%l2,[%i4+0x030]		! Mem[0000000010101430] = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010001433] = 000000ff
	stb	%l3,[%i0+0x033]		! Mem[0000000010001430] = 00000000
!	%l0 = 0000000000000000, imm = 0000000000000e70, %l1 = 0000000000000000
	orn	%l0,0xe70,%l1		! %l1 = fffffffffffff18f
!	Mem[0000000010101408] = 00000000, %l7 = 0000000049fffb35
	ldstuba	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181410] = 000000f3, %l4 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l4	! %l4 = 00000000000000f3
!	Mem[0000000010001418] = 000000ff, %l3 = 0000000000000000
	swap	[%i0+0x018],%l3		! %l3 = 00000000000000ff
!	%l4 = 00000000000000f3, Mem[0000000030001408] = 00000000
	stba	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000f3
!	Mem[0000000030181410] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000000

p0_label_164:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 000000ff, %l4 = 00000000000000f3
	ldsba	[%i4+%o4]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030041410] = 0000000000000000, %f24 = 5758d9a0 5fdd00ff
	ldda	[%i1+%o5]0x89,%f24	! %f24 = 00000000 00000000
!	Mem[0000000010041410] = 00ff0000, %l7 = 0000000000000000
	lduwa	[%i1+%o5]0x80,%l7	! %l7 = 0000000000ff0000
!	Mem[0000000010081400] = 00000000, %l2 = 0000000000000000
	lduba	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001408] = f3000000, %l0 = 0000000000000000
	lduwa	[%i0+%o4]0x81,%l0	! %l0 = 00000000f3000000
!	Mem[0000000010081400] = 00000000, %l7 = 0000000000ff0000
	ldsba	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	%l6 = 0000000000000000, %l0 = 00000000f3000000, %l4  = ffffffffffffffff
	mulx	%l6,%l0,%l4		! %l4 = 0000000000000000
!	Mem[0000000010001410] = 000000ff, %l7 = 0000000000000000
	lduwa	[%i0+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000211c0000] = ffa3d1d8, %l2 = 0000000000000000
	ldsb	[%o2+%g0],%l2		! %l2 = ffffffffffffffff
!	Mem[00000000300c1408] = ffffffff, %f14 = 000000c0
	lda	[%i3+%o4]0x81,%f14	! %f14 = ffffffff

p0_label_165:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000030081410] = 40c95576
	stba	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 40c955ff
!	%l7 = 00000000000000ff, Mem[0000000010101400] = 00000000000000ff
	stxa	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000000000ff
!	%f30 = 0dc60e86, Mem[0000000030101410] = 00000000
	sta	%f30,[%i4+%o5]0x89	! Mem[0000000030101410] = 0dc60e86
!	Mem[0000000030141408] = f3000000, %l1 = 00000000fffff18f
	swapa	[%i5+%o4]0x89,%l1	! %l1 = 00000000f3000000
!	Mem[000000001004141e] = ffffff86, %l7 = 00000000000000ff
	ldstuba	[%i1+0x01e]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041400] = 00000000, %l4 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%l2 = ffffffffffffffff, Mem[0000000030041408] = 860ec60d00c620ff
	stxa	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffffffffffffff
!	%f12 = ff000000 00000000, %l0 = 00000000f3000000
!	Mem[0000000030101438] = cafaf8d3c0000000
	add	%i4,0x038,%g1
	stda	%f12,[%g1+%l0]ASI_PST16_S ! Mem[0000000030101438] = cafaf8d3c0000000
!	Mem[0000000021800181] = ffff5728, %l6 = 0000000000000000
	ldstub	[%o3+0x181],%l6		! %l6 = 00000000000000ff
!	Mem[0000000020800000] = fffff578, %l1 = 00000000f3000000
	ldstuba	[%o1+0x000]%asi,%l1	! %l1 = 00000000000000ff

p0_label_166:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ff000000, %l0 = 00000000f3000000
	ldswa	[%i4+%o4]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010101424] = 000000ff, %l6 = 00000000000000ff
	lduh	[%i4+0x024],%l6		! %l6 = 0000000000000000
!	%l6 = 0000000000000000, %l6 = 0000000000000000, %l2 = ffffffffffffffff
	sub	%l6,%l6,%l2		! %l2 = 0000000000000000
!	Mem[0000000010101408] = ff000000, %l2 = 0000000000000000
	ldswa	[%i4+%o4]0x80,%l2	! %l2 = ffffffffff000000
!	Mem[0000000030041410] = 00000000, %l0 = ffffffffff000000
	lduwa	[%i1+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141410] = 00000000 ff0000ff, %l6 = 00000000, %l7 = 000000ff, %asi = 80
	ldda	[%i5+0x010]%asi,%l6	! %l6 = 0000000000000000 00000000ff0000ff
!	Mem[0000000010041400] = fffddd2d4a000000, %f4  = 000020ff 0000a3f3
	ldda	[%i1+%g0]0x80,%f4 	! %f4  = fffddd2d 4a000000
!	Mem[00000000300c1400] = ff9e4d1600000000, %l1 = 00000000000000ff
	ldxa	[%i3+%g0]0x89,%l1	! %l1 = ff9e4d1600000000
!	Mem[0000000030001400] = 00000000, %l6 = 0000000000000000
	lduwa	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l5 = 00000000ffffff86
	lduwa	[%i5+%o4]0x80,%l5	! %l5 = 0000000000000000

p0_label_167:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 0000d786, %l7 = 00000000ff0000ff
	ldstuba	[%i3+%g0]0x88,%l7	! %l7 = 0000000000000086
!	%l2 = ffffffffff000000, Mem[00000000218001c0] = 00ffa358, %asi = 80
	stha	%l2,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 0000a358
!	%l7 = 0000000000000086, Mem[0000000010141402] = 000020ff
	sth	%l7,[%i5+0x002]		! Mem[0000000010141400] = 00000086
!	%l0 = 0000000000000000, imm = 00000000000004ea, %l7 = 0000000000000086
	andn	%l0,0x4ea,%l7		! %l7 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010081400] = 0000000000000000
	stxa	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000000000
!	%f0  = ff000000 86d70000, %l4 = 0000000000000000
!	Mem[0000000010081428] = 00000000089a00ff
	add	%i2,0x028,%g1
	stda	%f0,[%g1+%l4]ASI_PST16_P ! Mem[0000000010081428] = 00000000089a00ff
!	%l6 = 0000000000000000, Mem[0000000020800040] = f3ff65a8, %asi = 80
	stba	%l6,[%o1+0x040]%asi	! Mem[0000000020800040] = 00ff65a8
!	%l5 = 0000000000000000, %l2 = ffffffffff000000, %l2 = ffffffffff000000
	and	%l5,%l2,%l2		! %l2 = 0000000000000000
!	Mem[0000000010001410] = 000000ff, %l3 = 0000000000000000
	ldstuba	[%i0+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010141400] = 00000086 0000a3f3
	stda	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000 00000000

p0_label_168:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = f3a3ffff, %l2 = 0000000000000000
	ldswa	[%i2+%o4]0x80,%l2	! %l2 = fffffffff3a3ffff
!	Mem[0000000010081410] = 00ff15de 5612554c, %l0 = 00000000, %l1 = 00000000
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 0000000000ff15de 000000005612554c
!	Mem[0000000010001410] = ff000000, %l1 = 000000005612554c
	lduwa	[%i0+%o5]0x80,%l1	! %l1 = 00000000ff000000
!	Mem[00000000100c1408] = d4e0ffff, %l4 = 0000000000000000
	lduwa	[%i3+%o4]0x80,%l4	! %l4 = 00000000d4e0ffff
!	%f14 = ffffffff, %f8  = 860ec60d, %f19 = 00000000
	fsubs	%f14,%f8 ,%f19		! %f19 = ffffffff
!	Mem[0000000010141408] = 00000000, %l0 = 0000000000ff15de
	ldswa	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %f22 = 000000ff
	lda	[%i6+%o4]0x89,%f22	! %f22 = 00000000
!	Mem[0000000020800040] = 00ff65a8, %l4 = 00000000d4e0ffff
	lduh	[%o1+0x040],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030041408] = ffffffff, %l2 = fffffffff3a3ffff
	lduba	[%i1+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101410] = 0dc60e86, %f4  = fffddd2d
	lda	[%i4+%o5]0x89,%f4 	! %f4 = 0dc60e86

p0_label_169:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000030041408] = ffffffff
	stba	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffff00
!	%l1 = 00000000ff000000, Mem[0000000010101410] = 148dc691
	stha	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000c691
!	Mem[0000000010181418] = ff000000, %l4 = 000000ff, %l6 = 000000ff
	add	%i6,0x18,%g1
	casa	[%g1]0x80,%l4,%l6	! %l6 = 00000000ff000000
!	%l5 = 0000000000000000, Mem[0000000010181400] = 00000000
	stw	%l5,[%i6+%g0]		! Mem[0000000010181400] = 00000000
!	%l4 = 00000000000000ff, %l2 = 00000000000000ff, %l0 = 0000000000000000
	orn	%l4,%l2,%l0		! %l0 = ffffffffffffffff
!	Mem[00000000100c1410] = 000000ff, %l0 = 00000000ffffffff
	swapa	[%i3+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%f16 = fffddd2d, Mem[0000000030181400] = 00000000
	sta	%f16,[%i6+%g0]0x81	! Mem[0000000030181400] = fffddd2d
!	%f10 = ff9e4d16 000000ff, Mem[0000000010081430] = 86ffffff ffffa3ff
	std	%f10,[%i2+0x030]	! Mem[0000000010081430] = ff9e4d16 000000ff
!	Mem[0000000010041408] = 0dc60e86, %l0 = 00000000000000ff
	ldstuba	[%i1+%o4]0x88,%l0	! %l0 = 0000000000000086

p0_label_170:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 0000e0d4, %l1 = 00000000ff000000
	lduba	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = 164d9eff0000ff00, %l0 = 0000000000000086
	ldxa	[%i1+%o5]0x88,%l0	! %l0 = 164d9eff0000ff00
!	Mem[0000000030081400] = 860ec60d000000ff, %f10 = ff9e4d16 000000ff
	ldda	[%i2+%g0]0x89,%f10	! %f10 = 860ec60d 000000ff
!	Mem[0000000010001408] = 0000e0d4, %l1 = 0000000000000000
	lduha	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = d4ff0000, %f7  = 00008dff
	lda	[%i0+%g0]0x80,%f7 	! %f7 = d4ff0000
!	Mem[0000000030181408] = ffffff86 00000000, %l2 = 000000ff, %l3 = 000000ff
	ldda	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000000 00000000ffffff86
!	Mem[00000000100c1400] = 0000d7ff, %l7 = 0000000000000000
	lduwa	[%i3+%g0]0x88,%l7	! %l7 = 000000000000d7ff
!	Mem[0000000010101400] = 000000ff, %l4 = 00000000000000ff
	lduba	[%i4+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1408] = d4e0ffff, %l0 = 164d9eff0000ff00
	lduba	[%i3+%o4]0x80,%l0	! %l0 = 00000000000000d4
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000010041400] = fffddd2d 4a000000 ff0ec60d 00000000
!	Mem[0000000010041410] = 00ff0000 ff9e4d16 000000ff ffffff86
!	Mem[0000000010041420] = 5758d9a0 5fdd00ff 0ed27fde ffffa3ff
!	Mem[0000000010041430] = 5e5c888c 05c386ed 0dc60e86 4a000000
	ldda	[%i1+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010041400

p0_label_171:
!	Starting 10 instruction Store Burst
!	%f8  = 860ec60d ffffa300, Mem[0000000010081408] = f3a3ffff ff000000
	stda	%f8 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 860ec60d ffffa300
!	%l5 = 0000000000000000, Mem[00000000300c1408] = ffffffffff00d786
	stxa	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000000000000
!	%f3  = 86ffffff, Mem[0000000010001420] = 7655c940
	st	%f3 ,[%i0+0x020]	! Mem[0000000010001420] = 86ffffff
!	%l2 = 00000000, %l3 = ffffff86, Mem[0000000010001410] = 000000ff 00000000
	stda	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 ffffff86
!	%f17 = 4a000000, %f30 = 0dc60e86, %f3  = 86ffffff
	fdivs	%f17,%f30,%f3 		! %f3  = 7ba57292
!	%f1  = 86d70000, Mem[00000000300c1410] = 0e8f004a
	sta	%f1 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 86d70000
!	Mem[00000000100c1434] = 38fac0ad, %l6 = 00000000ff000000
	swap	[%i3+0x034],%l6		! %l6 = 0000000038fac0ad
!	Mem[0000000010041400] = fffddd2d 4a000000 ff0ec60d 00000000
!	%f0  = ff000000 86d70000 00000000 7ba57292
!	%f4  = 0dc60e86 4a000000 00000000 d4ff0000
!	%f8  = 860ec60d ffffa300 860ec60d 000000ff
!	%f12 = ff000000 00000000 ffffffff d3f8faca
	stda	%f0 ,[%i1+%g0]ASI_COMMIT_P	! Block Store to 0000000010041400
!	%f23 = ffffff86, Mem[00000000300c1408] = 00000000
	sta	%f23,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffff86
!	%l3 = 00000000ffffff86, Mem[0000000030081408] = 00000000
	stwa	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffff86

p0_label_172:
!	Starting 10 instruction Load Burst
!	%f1  = 86d70000, %f24 = 5758d9a0, %f25 = 5fdd00ff
	fsubs	%f1 ,%f24,%f25		! %f25 = d758d9a0
!	Mem[0000000010101410] = 0000c691, %l1 = 0000000000000000
	ldsba	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = ffd70000, %l6 = 0000000038fac0ad
	lduwa	[%i3+%g0]0x80,%l6	! %l6 = 00000000ffd70000
!	Mem[00000000100c1400] = ffd70000, %l6 = 00000000ffd70000
	ldsha	[%i3+%g0]0x80,%l6	! %l6 = ffffffffffffffd7
!	Mem[0000000020800001] = fffff578, %l2 = 0000000000000000, %asi = 80
	lduba	[%o1+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081410] = 4c551256de15ff00, %l2 = 00000000000000ff
	ldxa	[%i2+%o5]0x88,%l2	! %l2 = 4c551256de15ff00
!	Mem[00000000100c1418] = 0000004a0000d786, %f24 = 5758d9a0 d758d9a0, %asi = 80
	ldda	[%i3+0x018]%asi,%f24	! %f24 = 0000004a 0000d786
!	Mem[0000000010181408] = d3f8faca6398e52f, %l5 = 0000000000000000
	ldxa	[%i6+%o4]0x80,%l5	! %l5 = d3f8faca6398e52f
!	Mem[0000000030141408] = c000fffffffff18f, %f24 = 0000004a 0000d786
	ldda	[%i5+%o4]0x89,%f24	! %f24 = c000ffff fffff18f
!	Mem[0000000030101400] = 00000000 000000ff ff000000 00000000
!	Mem[0000000030101410] = 860ec60d 00000000 0000004a 00000000
!	Mem[0000000030101420] = 00a3ffff 0dc60e86 ff000000 164d9eff
!	Mem[0000000030101430] = 00000000 000000ff cafaf8d3 c0000000
	ldda	[%i4+%g0]ASI_BLK_AIUSL,%f0 	! Block Load from 0000000030101400

p0_label_173:
!	Starting 10 instruction Store Burst
!	%f13 = 00000000, %f22 = 000000ff
	fsqrts	%f13,%f22		! %f22 = 00000000
!	Mem[0000000010101430] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i4+0x030]%asi,%l1	! %l1 = 0000000000000000
!	%l5 = d3f8faca6398e52f, Mem[0000000010181414] = 91c68d14
	sth	%l5,[%i6+0x014]		! Mem[0000000010181414] = e52f8d14
!	%l7 = 000000000000d7ff, Mem[00000000300c1408] = 86ffffff
	stba	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffffffff
!	Mem[0000000030081400] = 000000ff, %l2 = 4c551256de15ff00
	ldstuba	[%i2+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %l5 = 000000006398e52f
	swap	[%i6+%g0],%l5		! %l5 = 0000000000000000
!	%l3 = 00000000ffffff86, Mem[00000000100c1410] = ffffffff
	stha	%l3,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff86ffff
!	%l6 = ffffffffffffffd7, Mem[0000000010101400] = 000000ff
	stba	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000d7
	membar	#Sync			! Added by membar checker (29)
!	%l2 = 00000000000000ff, Mem[0000000010041410] = 0dc60e864a000000
	stxa	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000000000ff
!	Code Fragment 3, seed = 836874
p0_fragment_9:
!	%l0 = 00000000000000d4
	setx	0xaf5f2c3ca75679d6,%g7,%l0 ! %l0 = af5f2c3ca75679d6
!	%l1 = 0000000000000000
	setx	0x61d9b22fa472bf01,%g7,%l1 ! %l1 = 61d9b22fa472bf01
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = af5f2c3ca75679d6
	setx	0x023a8f4d8023983c,%g7,%l0 ! %l0 = 023a8f4d8023983c
!	%l1 = 61d9b22fa472bf01
	setx	0xebe19bf300e20887,%g7,%l1 ! %l1 = ebe19bf300e20887
p0_fragment_9_end:

p0_label_174:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ff000000, %l3 = 00000000ffffff86
	ldsba	[%i2+%g0]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081400] = ff000000, %l4 = 00000000000000ff
	lduwa	[%i2+%g0]0x81,%l4	! %l4 = 00000000ff000000
!	Mem[00000000201c0000] = ff008148, %l4 = 00000000ff000000, %asi = 80
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = ffffffffffffff00
!	Mem[00000000218001c0] = 0000a358, %l5 = 0000000000000000, %asi = 80
	lduha	[%o3+0x1c0]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = 7fffffff 2fe59863, %l0 = 8023983c, %l1 = 00e20887
	ldda	[%i6+%g0]0x88,%l0	! %l0 = 000000002fe59863 000000007fffffff
!	%f30 = 0dc60e86, %f20 = 00ff0000, %f6  = 00000000
	fdivs	%f30,%f20,%f6 		! %f6  = 4c46d55b
!	Mem[00000000100c1418] = 0000004a 0000d786, %l2 = 000000ff, %l3 = ffffffff, %asi = 80
	ldda	[%i3+0x018]%asi,%l2	! %l2 = 000000000000004a 000000000000d786
!	Mem[0000000010041408] = 00000000, %l4 = ffffffffffffff00
	lduwa	[%i1+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l7 = 000000000000d7ff
	lduha	[%i1+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001400] = 0000ffd4, %f23 = ffffff86
	lda	[%i0+%g0]0x88,%f23	! %f23 = 0000ffd4

p0_label_175:
!	Starting 10 instruction Store Burst
!	%f22 = 00000000, Mem[0000000030081408] = ffffff86
	sta	%f22,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%f28 = 5e5c888c 05c386ed, Mem[0000000010141410] = 00000000 ff0000ff, %asi = 80
	stda	%f28,[%i5+0x010]%asi	! Mem[0000000010141410] = 5e5c888c 05c386ed
!	Mem[0000000010081400] = 00000000, %l4 = 0000000000000000
	swapa	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101408] = ff000000, %l6 = ffffffffffffffd7
	ldsha	[%i4+%o4]0x81,%l6	! %l6 = ffffffffffffff00
!	%l5 = 0000000000000000, Mem[0000000030141410] = 4a0000ff
	stha	%l5,[%i5+%o5]0x89	! Mem[0000000030141410] = 4a000000
!	%l6 = ffffff00, %l7 = 00000000, Mem[0000000010081400] = 00000000 00000000
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffff00 00000000
!	Mem[00000000100c1400] = 0000d7ff, %l4 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l4	! %l4 = 000000000000d7ff
!	Mem[000000001018140c] = 6398e52f, %l3 = 000000000000d786
	swap	[%i6+0x00c],%l3		! %l3 = 000000006398e52f
!	%l5 = 0000000000000000, Mem[0000000010141430] = 57fbe2ff
	stw	%l5,[%i5+0x030]		! Mem[0000000010141430] = 00000000
!	Mem[0000000010041420] = 860ec60d, %l3 = 000000006398e52f
	ldstub	[%i1+0x020],%l3		! %l3 = 0000000000000086

p0_label_176:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0001] = ffa3d1d8, %l3 = 0000000000000086
	ldsb	[%o2+0x001],%l3		! %l3 = ffffffffffffffa3
!	Mem[0000000010081408] = 0dc60e86, %l3 = ffffffffffffffa3
	ldsha	[%i2+%o4]0x88,%l3	! %l3 = 0000000000000e86
!	%l4 = 000000000000d7ff, imm = 0000000000000934, %l6 = ffffffffffffff00
	andn	%l4,0x934,%l6		! %l6 = 000000000000d6cb
!	Mem[0000000010101408] = 000000ff, %l2 = 000000000000004a
	lduba	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001410] = ff8d000000000000, %f20 = 00ff0000 ff9e4d16
	ldda	[%i0+%o5]0x81,%f20	! %f20 = ff8d0000 00000000
!	Mem[0000000010081408] = 860ec60d, %l7 = 0000000000000000
	ldswa	[%i2+%o4]0x80,%l7	! %l7 = ffffffff860ec60d
!	Mem[00000000211c0000] = ffa3d1d8, %l0 = 000000002fe59863, %asi = 80
	lduha	[%o2+0x000]%asi,%l0	! %l0 = 000000000000ffa3
!	Mem[0000000030001400] = 00000000, %f27 = ffffa3ff
	lda	[%i0+%g0]0x89,%f27	! %f27 = 00000000
!	Mem[0000000030101400] = 00000000000000ff, %l4 = 000000000000d7ff
	ldxa	[%i4+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101410] = 0000c691, %l2 = 00000000000000ff
	lduha	[%i4+%o5]0x80,%l2	! %l2 = 0000000000000000

p0_label_177:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010101400] = 000000d7
	stwa	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000
!	%l5 = 0000000000000000, Mem[0000000010181408] = d3f8faca
	stha	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000faca
!	Mem[0000000030001400] = 00000000 4a000000 f3000000 4a000000
!	%f0  = ff000000 00000000 00000000 000000ff
!	%f4  = 00000000 0dc60e86 4c46d55b 4a000000
!	%f8  = 860ec60d ffffa300 ff9e4d16 000000ff
!	%f12 = ff000000 00000000 000000c0 d3f8faca
	stda	%f0 ,[%i0+%g0]ASI_BLK_SL	! Block Store to 0000000030001400
!	%f12 = ff000000 00000000, %l1 = 000000007fffffff
!	Mem[0000000030101418] = 0000004a00000000
	add	%i4,0x018,%g1
	stda	%f12,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030101418] = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000010041408] = 00000000
	stwa	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	%l6 = 0000d6cb, %l7 = 860ec60d, Mem[0000000010181408] = 0000faca 0000d786
	stda	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000d6cb 860ec60d
!	Mem[00000000100c1414] = 86ffffff, %l1 = 000000007fffffff
	ldstuba	[%i3+0x014]%asi,%l1	! %l1 = 0000000000000086
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000030001408] = 000000ff, %l6 = 000000000000d6cb
	swapa	[%i0+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%l0 = 000000000000ffa3, Mem[0000000010001408] = d4e00000
	stba	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = d4e000a3
!	Mem[0000000021800040] = ff0e9e38, %l3 = 0000000000000e86
	ldstub	[%o3+0x040],%l3		! %l3 = 00000000000000ff

p0_label_178:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 00ff15de, %f25 = fffff18f
	lda	[%i2+%o5]0x80,%f25	! %f25 = 00ff15de
!	Mem[0000000010101406] = 00000000, %l3 = 00000000000000ff
	lduh	[%i4+0x006],%l3		! %l3 = 0000000000000000
!	Mem[0000000030081408] = 00000000 00000006, %l2 = 00000000, %l3 = 00000000
	ldda	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000000 0000000000000006
!	%l0 = 000000000000ffa3, imm = fffffffffffff180, %l4 = 00000000000000ff
	xor	%l0,-0xe80,%l4		! %l4 = ffffffffffff0e23
!	Mem[0000000030141408] = c000fffffffff18f, %l4 = ffffffffffff0e23
	ldxa	[%i5+%o4]0x89,%l4	! %l4 = c000fffffffff18f
!	%l5 = 0000000000000000, immd = ffffff03, %y  = 00000000
	udiv	%l5,-0x0fd,%l0		! %l0 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000030001400] = 00000000, %l0 = 0000000000000000
	ldswa	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101410] = 860ec60d00000000, %l0 = 0000000000000000
	ldxa	[%i4+%o5]0x81,%l0	! %l0 = 860ec60d00000000
!	Mem[0000000030181410] = ffffa3f3000000ff, %l2 = 0000000000000000
	ldxa	[%i6+%o5]0x89,%l2	! %l2 = ffffa3f3000000ff
!	Mem[0000000010101400] = 00000000, %l7 = ffffffff860ec60d
	lduba	[%i4+%g0]0x80,%l7	! %l7 = 0000000000000000

p0_label_179:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 0000004a, %l4 = 00000000fffff18f
	swapa	[%i6+%o5]0x80,%l4	! %l4 = 000000000000004a
!	%l0 = 860ec60d00000000, Mem[0000000010141408] = 0000000086d70000
	stx	%l0,[%i5+%o4]		! Mem[0000000010141408] = 860ec60d00000000
!	%l0 = 860ec60d00000000, Mem[0000000010081400] = 00ffffff
	stba	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 00ffff00
!	%l7 = 0000000000000000, Mem[0000000030141408] = fffff18f
	stwa	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	Mem[0000000010181410] = fffff18f, %l3 = 0000000000000006
	swap	[%i6+%o5],%l3		! %l3 = 00000000fffff18f
!	%l7 = 0000000000000000, Mem[0000000010081400] = 00ffff00
	stha	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = 00ff0000
!	Mem[0000000030181410] = ff000000, %l3 = 00000000fffff18f
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[00000000300c1400] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l5	! %l5 = 0000000000000000
!	%f22 = 00000000 0000ffd4, %l5 = 0000000000000000
!	Mem[0000000010181428] = 524878be2233ffa3
	add	%i6,0x028,%g1
	stda	%f22,[%g1+%l5]ASI_PST8_P ! Mem[0000000010181428] = 524878be2233ffa3
!	Mem[0000000010141428] = 00000000, %l1 = 0000000000000086, %asi = 80
	swapa	[%i5+0x028]%asi,%l1	! %l1 = 0000000000000000

p0_label_180:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ff86ffffffffffff, %l0 = 860ec60d00000000, %asi = 80
	ldxa	[%i3+0x010]%asi,%l0	! %l0 = ff86ffffffffffff
!	Mem[0000000010081400] = 0000ff0000000000, %l6 = 00000000000000ff
	ldxa	[%i2+%g0]0x80,%l6	! %l6 = 0000ff0000000000
!	Mem[0000000030101400] = 00000000, %f11 = 000000ff
	lda	[%i4+%g0]0x89,%f11	! %f11 = 00000000
!	Mem[0000000010141400] = 00000000 00000000, %l2 = 000000ff, %l3 = ff000000, %asi = 80
	ldda	[%i5+0x000]%asi,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010141400] = 0000000000000000, %f10 = ff9e4d16 00000000
	ldda	[%i5+%g0]0x88,%f10	! %f10 = 00000000 00000000
!	Mem[0000000010041410] = 00000000, %l0 = ff86ffffffffffff
	lduba	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (31)
!	Mem[0000000010141400] = 00000000 00000000 860ec60d 00000000
!	Mem[0000000010141410] = 5e5c888c 05c386ed 0dcf6fd2 2614ff5b
!	Mem[0000000010141420] = 459b7b20 562e5814 00000086 86ffffff
!	Mem[0000000010141430] = 00000000 ff000000 04c60eff 91c6e9f5
	ldda	[%i5+%g0]ASI_BLK_AIUPL,%f0 	! Block Load from 0000000010141400
!	%l5 = 0000000000000000, immd = 00000f5a, %y  = 00000000
	sdiv	%l5,0xf5a,%l5		! %l5 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	Mem[00000000100c1408] = d4e0ffff, %l5 = 0000000000000000
	ldsha	[%i3+%o4]0x80,%l5	! %l5 = ffffffffffffd4e0
!	Mem[0000000030181400] = fffddd2d d3f8faca, %l2 = 00000000, %l3 = 00000000
	ldda	[%i6+%g0]0x81,%l2	! %l2 = 00000000fffddd2d 00000000d3f8faca

p0_label_181:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 00ff15de, %l3 = 00000000d3f8faca
	swapa	[%i2+%o5]0x80,%l3	! %l3 = 0000000000ff15de
!	%l0 = 0000000000000000, Mem[0000000030181408] = ffffff8600000000
	stxa	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l1 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101408] = ff000000, %l5 = 00000000ffffd4e0
	swapa	[%i4+%o4]0x81,%l5	! %l5 = 00000000ff000000
!	%l3 = 0000000000ff15de, Mem[0000000030001408] = cbd6000000000000
	stxa	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000000000ff15de
!	%l7 = 0000000000000000, Mem[0000000030001400] = 00000000
	stha	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	Mem[0000000010001410] = 00000000, %l3 = 0000000000ff15de
	swapa	[%i0+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[000000001000140c] = 4a000000, %l2 = fffddd2d, %l1 = 00000000
	add	%i0,0x0c,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 000000004a000000
!	%l7 = 0000000000000000, Mem[00000000211c0001] = ffa3d1d8
	stb	%l7,[%o2+0x001]		! Mem[00000000211c0000] = ff00d1d8
!	Mem[0000000010001400] = 0000ffd4, %l4 = 000000000000004a
	ldstuba	[%i0+%g0]0x88,%l4	! %l4 = 00000000000000d4

p0_label_182:
!	Starting 10 instruction Load Burst
!	%f19 = 00000000, %f9  = 207b9b45, %f28 = 5e5c888c
	fmuls	%f19,%f9 ,%f28		! %f28 = 00000000
!	Mem[0000000010041410] = 00000000, %l5 = 00000000ff000000
	ldsha	[%i1+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041425] = ffffa300, %l4 = 00000000000000d4
	ldsb	[%i1+0x025],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010141435] = ff000000, %l2 = 00000000fffddd2d, %asi = 80
	lduba	[%i5+0x035]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041408] = 00ffffffffffffff, %f18 = ff0ec60d 00000000
	ldda	[%i1+%o4]0x81,%f18	! %f18 = 00ffffff ffffffff
!	%f14 = f5e9c691 ff0ec604, Mem[0000000030001410] = 0dc60e86 00000000
	stda	%f14,[%i0+%o5]0x89	! Mem[0000000030001410] = f5e9c691 ff0ec604
!	Mem[00000000100c1424] = 00000000, %l3 = 0000000000000000, %asi = 80
	ldswa	[%i3+0x024]%asi,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1410] = ffff86ff, %l2 = 0000000000000000
	lduha	[%i3+%o5]0x88,%l2	! %l2 = 00000000000086ff
!	Mem[0000000030101410] = 000000000dc60e86, %l5 = 0000000000000000
	ldxa	[%i4+%o5]0x89,%l5	! %l5 = 000000000dc60e86
!	Mem[0000000010081408] = 0dc60e86, %f17 = 4a000000
	lda	[%i2+%o4]0x88,%f17	! %f17 = 0dc60e86

p0_label_183:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = de15ff00, %l0 = 0000000000000000
	ldstuba	[%i0+%o5]0x80,%l0	! %l0 = 00000000000000de
!	%l6 = 0000ff0000000000, Mem[0000000030081400] = ff000000
	stha	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	Mem[0000000010041420] = ff0ec60d, %l7 = 00000000, %l7 = 00000000
	add	%i1,0x20,%g1
	casa	[%g1]0x80,%l7,%l7	! %l7 = 00000000ff0ec60d
!	Mem[0000000030181410] = fffff18f, %l4 = 00000000ffffffff
	swapa	[%i6+%o5]0x81,%l4	! %l4 = 00000000fffff18f
!	%l0 = 000000de, %l1 = 4a000000, Mem[0000000030001400] = 00000000 ff000000
	stda	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000de 4a000000
!	%f16 = fffddd2d 0dc60e86, Mem[0000000010101408] = 000000ff c1000000
	stda	%f16,[%i4+%o4]0x88	! Mem[0000000010101408] = fffddd2d 0dc60e86
!	%l6 = 0000ff0000000000, Mem[0000000030041410] = 00000000
	stba	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	Mem[0000000030181410] = ffffffff, %l2 = 00000000000086ff
	ldstuba	[%i6+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000010081410] = d3f8faca5612554c
	stxa	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000000000000000
!	Mem[0000000010081400] = 00ff0000, %l1 = 000000004a000000
	ldstuba	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000

p0_label_184:
!	Starting 10 instruction Load Burst
!	%l1 = 0000000000000000, %l5 = 000000000dc60e86, %y  = 00000000
	sdiv	%l1,%l5,%l2		! %l2 = 0000000000000000
	mov	%l0,%y			! %y = 000000de
!	Mem[0000000030081410] = ff55c940, %l1 = 0000000000000000
	lduwa	[%i2+%o5]0x81,%l1	! %l1 = 00000000ff55c940
!	Mem[0000000010001408] = d4e000a3, %l7 = 00000000ff0ec60d
	ldswa	[%i0+%o4]0x88,%l7	! %l7 = ffffffffd4e000a3
!	Mem[0000000010001410] = 00ff15ff, %l2 = 0000000000000000
	ldswa	[%i0+%o5]0x88,%l2	! %l2 = 0000000000ff15ff
!	Mem[0000000010101408] = 860ec60d 2dddfdff, %l4 = fffff18f, %l5 = 0dc60e86
	ldd	[%i4+%o4],%l4		! %l4 = 00000000860ec60d 000000002dddfdff
!	Mem[0000000010181410] = 00000006, %l6 = 0000ff0000000000
	lduwa	[%i6+%o5]0x80,%l6	! %l6 = 0000000000000006
!	Mem[0000000010101410] = 91c60000, %l7 = ffffffffd4e000a3
	ldswa	[%i4+%o5]0x88,%l7	! %l7 = ffffffff91c60000
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000030081400] = 00000000 0dc60e86 00000000 00000006
!	Mem[0000000030081410] = ff55c940 00008dff 41176862 5b2fa1ab
!	Mem[0000000030081420] = 7d171430 7959e581 6546eaee 4c541287
!	Mem[0000000030081430] = 609b881c 0b69263d 3cf7833a 0a2caa23
	ldda	[%i2+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030081400
!	Mem[0000000030081400] = 00000000 0dc60e86, %l0 = 000000de, %l1 = ff55c940
	ldda	[%i2+%g0]0x81,%l0	! %l0 = 0000000000000000 000000000dc60e86
!	Code Fragment 4, seed = 846993
p0_fragment_10:
!	%l0 = 0000000000000000
	setx	0xc3ae76e0aed6749e,%g7,%l0 ! %l0 = c3ae76e0aed6749e
!	%l1 = 000000000dc60e86
	setx	0xeed6d1cb0f9f5f49,%g7,%l1 ! %l1 = eed6d1cb0f9f5f49
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c3ae76e0aed6749e
	setx	0x9cda50cdf869e604,%g7,%l0 ! %l0 = 9cda50cdf869e604
!	%l1 = eed6d1cb0f9f5f49
	setx	0xd0b409243ec08bcf,%g7,%l1 ! %l1 = d0b409243ec08bcf
p0_fragment_10_end:

p0_label_185:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 00000000 a83a91fe d4e0ffff ffffffff
!	%f16 = fffddd2d 0dc60e86 00ffffff ffffffff
!	%f20 = ff8d0000 00000000 00000000 0000ffd4
!	%f24 = c000ffff 00ff15de 0ed27fde 00000000
!	%f28 = 00000000 05c386ed 0dc60e86 4a000000
	stda	%f16,[%i3+%g0]ASI_BLK_P	! Block Store to 00000000100c1400
!	%l0 = 9cda50cdf869e604, Mem[0000000010041404] = 86d70000
	stw	%l0,[%i1+0x004]		! Mem[0000000010041404] = f869e604
!	Mem[0000000010101410] = 0000c691, %l2 = 0000000000ff15ff
	swapa	[%i4+%o5]0x80,%l2	! %l2 = 000000000000c691
!	%f20 = ff8d0000 00000000, Mem[0000000010141408] = 0dc60e86 00000000
	stda	%f20,[%i5+%o4]0x88	! Mem[0000000010141408] = ff8d0000 00000000
!	%f2  = 00000000 00000006, Mem[0000000010081428] = 00000000 089a00ff
	std	%f2 ,[%i2+0x028]	! Mem[0000000010081428] = 00000000 00000006
!	Mem[00000000300c1410] = 0000d786, %l0 = 00000000f869e604
	swapa	[%i3+%o5]0x89,%l0	! %l0 = 000000000000d786
	membar	#Sync			! Added by membar checker (33)
!	Mem[00000000100c1408] = 00ffffff, %l2 = 000000000000c691, %asi = 80
	swapa	[%i3+0x008]%asi,%l2	! %l2 = 0000000000ffffff
!	%l2 = 00ffffff, %l3 = 00000000, Mem[0000000010141408] = 00000000 00008dff
	stda	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 00ffffff 00000000
!	Mem[0000000030081408] = 00000000, %l1 = 000000003ec08bcf
	swapa	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101410] = 860ec60d, %l7 = 0000000091c60000
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 00000000860ec60d

p0_label_186:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ff000000 f869e604 00000000 7ba57292
!	Mem[0000000010041410] = 00000000 000000ff 00000000 d4ff0000
!	Mem[0000000010041420] = ff0ec60d ffffa300 860ec60d 000000ff
!	Mem[0000000010041430] = ff000000 00000000 ffffffff d3f8faca
	ldda	[%i1+%g0]ASI_BLK_PL,%f16	! Block Load from 0000000010041400
!	Mem[00000000211c0000] = ff00d1d8, %l4 = 00000000860ec60d, %asi = 80
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000010041434] = 00000000, %l1 = 0000000000000000
	lduw	[%i1+0x034],%l1		! %l1 = 0000000000000000
!	Mem[00000000201c0000] = ff008148, %l5 = 000000002dddfdff
	ldsh	[%o0+%g0],%l5		! %l5 = ffffffffffffff00
!	Mem[0000000010081400] = ff00ff00, %l2 = 0000000000ffffff
	lduba	[%i2+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181410] = ffffffff, %f10 = 6546eaee
	lda	[%i6+%o5]0x81,%f10	! %f10 = ffffffff
!	Mem[0000000010041408] = 00000000, %l2 = 00000000000000ff
	lduba	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141428] = 0000008686ffffff, %f0  = 00000000 0dc60e86, %asi = 80
	ldda	[%i5+0x028]%asi,%f0 	! %f0  = 00000086 86ffffff
!	Mem[0000000030041410] = 00000000, %f5  = 00008dff
	lda	[%i1+%o5]0x81,%f5 	! %f5 = 00000000
!	Mem[0000000030001410] = 04c60eff, %l5 = ffffffffffffff00
	lduha	[%i0+%o5]0x81,%l5	! %l5 = 00000000000004c6

p0_label_187:
!	Starting 10 instruction Store Burst
!	%f0  = 00000086, Mem[0000000030081408] = 3ec08bcf
	sta	%f0 ,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000086
!	%l4 = ffffffffffffff00, Mem[0000000030081410] = ff55c94000008dff
	stxa	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffffffffffff00
!	Mem[0000000010181400] = 2fe59863, %l3 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l3	! %l3 = 000000002fe59863
!	%f28 = 00000000, Mem[0000000030081410] = ffffffff
	sta	%f28,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	Mem[00000000100c1438] = 0dc60e864a000000, %l6 = 0000000000000006, %l5 = 00000000000004c6
	add	%i3,0x38,%g1
	casxa	[%g1]0x80,%l6,%l5	! %l5 = 0dc60e864a000000
!	Mem[0000000010141410] = 8c885c5e, %l7 = 00000000860ec60d
	ldstuba	[%i5+%o5]0x88,%l7	! %l7 = 000000000000005e
!	%l6 = 00000006, %l7 = 0000005e, Mem[0000000030041408] = 00ffffff ffffffff
	stda	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000006 0000005e
!	%l6 = 0000000000000006, Mem[0000000030141400] = ffff8d14585700ff
	stxa	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000006
!	Mem[00000000100c1408] = 91c60000, %l0 = 000000000000d786
	ldstuba	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000000
!	%l4 = ffffffffffffff00, Mem[0000000010001408] = a300e0d4
	stha	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = ff00e0d4

p0_label_188:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 000000ff, %l2 = 0000000000000000
	ldsba	[%i1+%g0]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1408] = ff00c691, %l0 = 0000000000000000
	lduha	[%i3+%o4]0x80,%l0	! %l0 = 000000000000ff00
!	%l2 = ffffffffffffffff, %l0 = 000000000000ff00, %l3  = 000000002fe59863
	mulx	%l2,%l0,%l3		! %l3 = ffffffffffff0100
!	Mem[0000000010101400] = 00000000 00000000, %l2 = ffffffff, %l3 = ffff0100
	ldda	[%i4+%g0]0x88,%l2	! %l2 = 0000000000000000 0000000000000000
!	%f12 = 609b881c 0b69263d, %f10 = ffffffff
	fdtos	%f12,%f10		! %f10 = 7f800000
!	Mem[0000000010141408] = 00ffffff, %l5 = 0dc60e864a000000
	lduha	[%i5+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1410] = 04e669f8000000ff, %f0  = 00000086 86ffffff
	ldda	[%i3+%o5]0x81,%f0 	! %f0  = 04e669f8 000000ff
!	%f3  = 00000006, %f12 = 609b881c
	fcmpes	%fcc0,%f3 ,%f12		! %fcc0 = 1
!	Mem[0000000010141412] = ff5c888c, %l7 = 000000000000005e, %asi = 80
	lduba	[%i5+0x012]%asi,%l7	! %l7 = 0000000000000088
!	Mem[0000000030181400] = cafaf8d32dddfdff, %f2  = 00000000 00000006
	ldda	[%i6+%g0]0x89,%f2 	! %f2  = cafaf8d3 2dddfdff

p0_label_189:
!	Starting 10 instruction Store Burst
!	%f14 = 3cf7833a 0a2caa23, %l5 = 00000000000000ff
!	Mem[0000000030181410] = fffffffff3a3ffff
	add	%i6,0x010,%g1
	stda	%f14,[%g1+%l5]ASI_PST32_S ! Mem[0000000030181410] = 3cf7833a0a2caa23
!	%f16 = 04e669f8, %f18 = 9272a57b, %f10 = 7f800000
	fmuls	%f16,%f18,%f10		! %f10 = 80000000
!	Mem[0000000030081408] = 00000086, %l1 = 0000000000000000
	lduwa	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000086
!	%l4 = ffffffffffffff00, %l4 = ffffffffffffff00, %l5 = 00000000000000ff
	sdivx	%l4,%l4,%l5		! %l5 = 0000000000000001
!	%l4 = ffffffffffffff00, Mem[00000000100c1434] = 05c386ed
	stw	%l4,[%i3+0x034]		! Mem[00000000100c1434] = ffffff00
!	%l7 = 0000000000000088, Mem[00000000100c143b] = 0dc60e86
	stb	%l7,[%i3+0x03b]		! Mem[00000000100c1438] = 0dc60e88
!	Mem[0000000010081438] = 00000000, %l3 = 0000000000000000
	swap	[%i2+0x038],%l3		! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (34)
!	%f22 = 0000ffd4 00000000, Mem[0000000010041410] = 00000000 ff000000
	stda	%f22,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000ffd4 00000000
!	%f12 = 609b881c 0b69263d, %l4 = ffffffffffffff00
!	Mem[00000000100c1438] = 0dc60e884a000000
	add	%i3,0x038,%g1
	stda	%f12,[%g1+%l4]ASI_PST8_P ! Mem[00000000100c1438] = 0dc60e884a000000
!	%l6 = 00000006, %l7 = 00000088, Mem[0000000010101400] = 00000000 00000000
	stda	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000006 00000088

p0_label_190:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 3cf7833a, %l3 = 0000000000000000
	lduha	[%i6+%o5]0x81,%l3	! %l3 = 0000000000003cf7
!	Mem[0000000030081408] = 00000086, %l0 = 000000000000ff00
	ldsba	[%i2+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l6 = 0000000000000006
	lduha	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001400] = 000000de, %l6 = 0000000000000000
	lduha	[%i0+%g0]0x89,%l6	! %l6 = 00000000000000de
!	Mem[0000000010041400] = ff000000, %l2 = 0000000000000000
	ldsba	[%i1+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010181400] = 00000000, %l2 = ffffffffffffffff
	lduha	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181420] = ffffffff, %l5 = 0000000000000001, %asi = 80
	ldsha	[%i6+0x020]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030001408] = 00000000, %l6 = 00000000000000de
	lduba	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l2 = 0000000000000000
	ldsha	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l3 = 0000000000003cf7
	ldswa	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000000

p0_label_191:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010101410] = 00ff15ff
	stwa	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	%l2 = 0000000000000000, Mem[0000000010041408] = 00000000
	stwa	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	%l6 = 0000000000000000, Mem[000000001018143e] = 00000089
	sth	%l6,[%i6+0x03e]		! Mem[000000001018143c] = 00000000
!	Mem[00000000100c1400] = 2dddfdff, %l4 = ffffffffffffff00
	ldstuba	[%i3+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%l5 = ffffffffffffffff, %l3 = 0000000000000000, %l1  = 0000000000000086
	mulx	%l5,%l3,%l1		! %l1 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010141410] = ff5c888c
	stba	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 005c888c
!	Mem[0000000010181418] = ff000000, %l0 = 0000000000000000, %asi = 80
	swapa	[%i6+0x018]%asi,%l0	! %l0 = 00000000ff000000
!	%f22 = 0000ffd4 00000000, Mem[0000000010081400] = 00ff00ff 00000000
	stda	%f22,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000ffd4 00000000
!	Mem[0000000010081430] = ff9e4d16000000ff, %l1 = 0000000000000000, %l1 = 0000000000000000
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l1,%l1	! %l1 = ff9e4d16000000ff
!	%l7 = 0000000000000088, Mem[00000000100c1418] = 000000000000ffd4
	stx	%l7,[%i3+0x018]		! Mem[00000000100c1418] = 0000000000000088

p0_label_192:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 04e669f8, %l4 = 00000000000000ff
	ldsba	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000004
!	Mem[00000000211c0000] = ff00d1d8, %l3 = 0000000000000000, %asi = 80
	ldsha	[%o2+0x000]%asi,%l3	! %l3 = ffffffffffffff00
	membar	#Sync			! Added by membar checker (35)
!	Mem[0000000010041400] = ff000000 f869e604 00000000 7ba57292
!	Mem[0000000010041410] = 00000000 d4ff0000 00000000 d4ff0000
!	Mem[0000000010041420] = ff0ec60d ffffa300 860ec60d 000000ff
!	Mem[0000000010041430] = ff000000 00000000 ffffffff d3f8faca
	ldda	[%i1+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010041400
!	Mem[0000000020800041] = 00ff65a8, %l7 = 0000000000000088
	ldub	[%o1+0x041],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030041400] = 00000000, %l0 = 00000000ff000000
	lduwa	[%i1+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l0 = 0000000000000000
	ldswa	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = 06000000, %l1 = ff9e4d16000000ff
	lduwa	[%i5+%g0]0x81,%l1	! %l1 = 0000000006000000
!	Mem[0000000030141408] = c000ffff 00000000, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000000 00000000c000ffff
!	Mem[0000000010001428] = 00ff0000 ff000000, %l2 = 00000000, %l3 = ffffff00
	ldd	[%i0+0x028],%l2		! %l2 = 0000000000ff0000 00000000ff000000
!	Mem[0000000010041408] = 9272a57b 00000000, %l2 = 00ff0000, %l3 = ff000000
	ldda	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000000 000000009272a57b

p0_label_193:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010001400] = ffff000000000000
	stxa	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000000000000000
!	Mem[0000000020800000] = fffff578, %l3 = 000000009272a57b
	ldstuba	[%o1+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141400] = 00000006, %l6 = 0000000000000000
	ldstuba	[%i5+%g0]0x89,%l6	! %l6 = 0000000000000006
!	Code Fragment 3, seed = 850542
p0_fragment_11:
!	%l0 = 0000000000000000
	setx	0xac9d174413fb72b6,%g7,%l0 ! %l0 = ac9d174413fb72b6
!	%l1 = 0000000006000000
	setx	0x2155d4940e1fe1e1,%g7,%l1 ! %l1 = 2155d4940e1fe1e1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ac9d174413fb72b6
	setx	0x75784c091b28c51c,%g7,%l0 ! %l0 = 75784c091b28c51c
!	%l1 = 2155d4940e1fe1e1
	setx	0x1afe183bf6091f67,%g7,%l1 ! %l1 = 1afe183bf6091f67
p0_fragment_11_end:
!	%l0 = 1b28c51c, %l1 = f6091f67, Mem[00000000300c1400] = 000000ff ff9e4d16
	stda	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 1b28c51c f6091f67
!	%l5 = ffffffffffffffff, Mem[00000000300c1400] = 1cc5281b
	stba	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffc5281b
!	%l5 = ffffffffffffffff, Mem[0000000010181408] = cbd60000
	stwa	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffffff
!	%l2 = 0000000000000000, Mem[00000000211c0000] = ff00d1d8, %asi = 80
	stha	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0000d1d8
!	%l0 = 75784c091b28c51c, Mem[00000000100c1400] = fffddd2d0dc60e86
	stx	%l0,[%i3+%g0]		! Mem[00000000100c1400] = 75784c091b28c51c
!	%f8  = 7d171430 7959e581, Mem[0000000010141410] = 8c885c00 ed86c305
	stda	%f8 ,[%i5+%o5]0x88	! Mem[0000000010141410] = 7d171430 7959e581

p0_label_194:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00000000 00000000, %l0 = 1b28c51c, %l1 = f6091f67
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[00000000100c1400] = 75784c091b28c51c, %f8  = 7d171430 7959e581
	ldda	[%i3+%g0]0x80,%f8 	! %f8  = 75784c09 1b28c51c
!	Mem[00000000211c0001] = 0000d1d8, %l6 = 0000000000000006
	ldub	[%o2+0x001],%l6		! %l6 = 0000000000000000
!	Mem[0000000010101400] = 00000006, %l2 = 0000000000000000
	ldswa	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000006
!	Mem[00000000211c0001] = 0000d1d8, %l5 = ffffffffffffffff, %asi = 80
	ldsba	[%o2+0x001]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101410] = 91c6000000000000, %f14 = 3cf7833a 0a2caa23
	ldda	[%i4+%o5]0x81,%f14	! %f14 = 91c60000 00000000
!	%l2 = 00000006, %l3 = 000000ff, Mem[0000000030001408] = 00000000 de15ff00
	stda	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000006 000000ff
!	Mem[0000000010001400] = 00000000, %l6 = 0000000000000000
	ldsba	[%i0+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = 0000000000000000, %f20 = 0000ffd4 00000000
	ldda	[%i0+%g0]0x88,%f20	! %f20 = 00000000 00000000
!	Mem[0000000030141410] = 4a000000, %l7 = 00000000c000ffff
	lduha	[%i5+%o5]0x89,%l7	! %l7 = 0000000000000000

p0_label_195:
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ff, Mem[0000000010181400] = 00000000
	stha	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 00ff0000
!	%l3 = 00000000000000ff, Mem[0000000020800040] = 00ff65a8
	sth	%l3,[%o1+0x040]		! Mem[0000000020800040] = 00ff65a8
!	Mem[00000000201c0001] = ff008148, %l5 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000020800040] = 00ff65a8, %l7 = 0000000000000000
	ldstuba	[%o1+0x040]%asi,%l7	! %l7 = 0000000000000000
!	%f30 = cafaf8d3 ffffffff, %l4 = 0000000000000004
!	Mem[0000000030101400] = 00000000000000ff
	stda	%f30,[%i4+%l4]ASI_PST32_SL ! Mem[0000000030101400] = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000030001400] = 000000de
	stwa	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	%l5 = 0000000000000000, Mem[00000000300c1408] = 00000000ffffffff
	stxa	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000000000000
!	%f10 = 80000000 4c541287, %l3 = 00000000000000ff
!	Mem[0000000030141410] = 0000004a00000000
	add	%i5,0x010,%g1
	stda	%f10,[%g1+%l3]ASI_PST16_SL ! Mem[0000000030141410] = 8712544c00000080
!	Mem[00000000300c1408] = 00000000, %l1 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181400] = 0000ff00, %l7 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l7	! %l7 = 000000000000ff00

p0_label_196:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00000000, %l0 = 0000000000000000
	ldsba	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000211c0000] = 0000d1d8, %l2 = 0000000000000006, %asi = 80
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041410] = 00000000d4ff0000, %f4  = ff55c940 00000000
	ldd	[%i1+%o5],%f4 		! %f4  = 00000000 d4ff0000
!	Mem[0000000030041400] = 00000000 00000000 00000006 0000005e
!	Mem[0000000030041410] = 00000000 00000000 0000004a 7fffffff
!	Mem[0000000030041420] = 000040bc 000000ff 86d700ff ff000000
!	Mem[0000000030041430] = 86ffffff 86ffffff 5612ff4c 38fac0ad
	ldda	[%i1+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030041400
!	%l7 = 000000000000ff00, %l5 = 0000000000000000, %y  = 000000de
	smul	%l7,%l5,%l4		! %l4 = 0000000000000000, %y = 00000000
!	Mem[0000000030101410] = 000000000000c691, %f2  = cafaf8d3 2dddfdff
	ldda	[%i4+%o5]0x89,%f2 	! %f2  = 00000000 0000c691
!	Mem[0000000010001400] = 00000000, %l0 = 0000000000000000
	ldswa	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800001] = fffff578, %l7 = 000000000000ff00
	ldub	[%o1+0x001],%l7		! %l7 = 00000000000000ff
!	Mem[00000000100c1410] = 00008dff, %f13 = 0b69263d
	lda	[%i3+%o5]0x88,%f13	! %f13 = 00008dff
!	Mem[0000000010041408] = 00000000, %f6  = 41176862
	lda	[%i1+0x008]%asi,%f6 	! %f6 = 00000000

p0_label_197:
!	Starting 10 instruction Store Burst
!	%f22 = 0000004a, %f14 = 91c60000, %f3  = 0000c691
	fsubs	%f22,%f14,%f3 		! tt=0x22, %l0 = 0000000000000022
!	Mem[0000000010141408] = 00ffffff, %l5 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001410] = 00ff15ff, %l1 = 0000000000000000
	ldstuba	[%i0+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1410] = 04e669f8, %l1 = 00000000000000ff
	ldstuba	[%i3+%o5]0x81,%l1	! %l1 = 0000000000000004
!	Mem[0000000010081410] = 00000000, %l5 = 0000000000000000
	swapa	[%i2+%o5]0x88,%l5	! %l5 = 0000000000000000
!	%f18 = 00000006, Mem[0000000030181408] = 00000000
	sta	%f18,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000006
!	%f4  = 00000000, Mem[0000000030181408] = 00000006
	sta	%f4 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	Mem[000000001004142e] = 000000ff, %l5 = 0000000000000000
	ldstub	[%i1+0x02e],%l5		! %l5 = 0000000000000000
!	%f30 = 5612ff4c 38fac0ad, %l0 = 0000000000000022
!	Mem[0000000010181408] = ffffffff860ec60d
	add	%i6,0x008,%g1
	stda	%f30,[%g1+%l0]ASI_PST16_P ! Mem[0000000010181408] = ffffffff38fac60d
!	%l2 = 0000000000000000, Mem[0000000010141400] = 00000000
	stba	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000

p0_label_198:
!	Starting 10 instruction Load Burst
!	Mem[000000001018143e] = 00000000, %l2 = 0000000000000000, %asi = 80
	ldsha	[%i6+0x03e]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l5 = 0000000000000000
	ldsba	[%i4+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[000000001014142a] = 00000086, %l7 = 00000000000000ff
	lduh	[%i5+0x02a],%l7		! %l7 = 0000000000000086
!	Mem[00000000300c1410] = ffe669f8000000ff, %l2 = 0000000000000000
	ldxa	[%i3+%o5]0x81,%l2	! %l2 = ffe669f8000000ff
!	Mem[0000000010081414] = 00000000, %l2 = ffe669f8000000ff
	ldsb	[%i2+0x014],%l2		! %l2 = 0000000000000000
!	Mem[00000000300c1400] = ffc5281b, %l1 = 0000000000000004
	ldsha	[%i3+%g0]0x81,%l1	! %l1 = ffffffffffffffc5
!	Mem[0000000010141408] = ffffffff, %l3 = 00000000000000ff
	ldswa	[%i5+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081410] = 00000000, %l5 = 0000000000000000
	lduba	[%i2+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041408] = 06000000, %l6 = 0000000000000000
	ldswa	[%i1+%o4]0x89,%l6	! %l6 = 0000000006000000
!	Mem[0000000030101400] = 00000000, %l4 = 0000000000000000
	ldswa	[%i4+%g0]0x81,%l4	! %l4 = 0000000000000000

p0_label_199:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = ffffd4e0, %l4 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l4	! %l4 = 00000000ffffd4e0
!	%l6 = 0000000006000000, Mem[0000000010181410] = 148d2fe506000000
	stxa	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000000006000000
!	%l6 = 0000000006000000, Mem[0000000010081410] = 0000000000000000
	stxa	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000000006000000
!	Mem[0000000010001400] = 00000000, %l7 = 0000000000000086
	ldstuba	[%i0+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1410] = f869e6ff, %l1 = ffffffffffffffc5
	ldstuba	[%i3+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1400] = 75784c09, %l3 = ffffffffffffffff
	ldstuba	[%i3+0x000]%asi,%l3	! %l3 = 0000000000000075
!	Mem[0000000030181400] = fffddd2d d3f8faca 00000000 00000000
!	%f16 = 00000000 00000000 00000006 0000005e
!	%f20 = 00000000 00000000 0000004a 7fffffff
!	%f24 = 000040bc 000000ff 86d700ff ff000000
!	%f28 = 86ffffff 86ffffff 5612ff4c 38fac0ad
	stda	%f16,[%i6+%g0]ASI_BLK_SL	! Block Store to 0000000030181400
!	%f18 = 00000006, %f24 = 000040bc
	fcmpes	%fcc0,%f18,%f24		! %fcc0 = 1
!	Mem[00000000211c0000] = 0000d1d8, %l1 = 00000000000000ff
	ldstub	[%o2+%g0],%l1		! %l1 = 0000000000000000
!	%l5 = 0000000000000000, Mem[000000001018141c] = 0dcf6f00
	stw	%l5,[%i6+0x01c]		! Mem[000000001018141c] = 00000000

p0_label_200:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ffc5281b, %l3 = 0000000000000075
	lduwa	[%i3+%g0]0x81,%l3	! %l3 = 00000000ffc5281b
!	Mem[00000000201c0000] = ffff8148, %l6 = 0000000006000000
	ldub	[%o0+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[00000000201c0000] = ffff8148, %l0 = 0000000000000022, %asi = 80
	lduba	[%o0+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081408] = 86000000, %l4 = 00000000ffffd4e0
	ldsba	[%i2+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141408] = 00000000, %l7 = 0000000000000000
	lduwa	[%i5+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000201c0001] = ffff8148, %l6 = 00000000000000ff
	ldsb	[%o0+0x001],%l6		! %l6 = ffffffffffffffff
!	Mem[00000000300c1408] = 00000000, %l0 = 00000000000000ff
	lduwa	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000211c0001] = ff00d1d8, %l4 = 0000000000000000, %asi = 80
	ldsba	[%o2+0x001]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141408] = ffffffff, %l1 = 0000000000000000
	lduwa	[%i5+%o4]0x88,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000010141430] = 00000000, %l2 = 0000000000000000
	ldsb	[%i5+0x030],%l2		! %l2 = 0000000000000000

p0_label_201:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
	membar	#Sync			! Added by membar checker (36)
!	%l2 = 0000000000000000, Mem[0000000010041436] = 00000000, %asi = 80
	stba	%l2,[%i1+0x036]%asi	! Mem[0000000010041434] = 00000000
!	Mem[0000000030101410] = 0000c691, %l5 = 0000000000000000
	swapa	[%i4+%o5]0x89,%l5	! %l5 = 000000000000c691
!	%f14 = 91c60000 00000000, %l1 = 00000000ffffffff
!	Mem[0000000010141420] = 459b7b20562e5814
	add	%i5,0x020,%g1
	stda	%f14,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010141420] = 000000000000c691
!	%l7 = 0000000000000000, Mem[0000000010081408] = 860ec60d
	stha	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000c60d
!	%f2  = 00000000 0000c691, Mem[0000000010141420] = 00000000 0000c691
	std	%f2 ,[%i5+0x020]	! Mem[0000000010141420] = 00000000 0000c691
!	Mem[0000000030041400] = 00000000, %l2 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000020800001] = fffff578
	stb	%l4,[%o1+0x001]		! Mem[0000000020800000] = ff00f578
!	%l6 = ffffffffffffffff, Mem[0000000010101424] = 000000ff, %asi = 80
	stha	%l6,[%i4+0x024]%asi	! Mem[0000000010101424] = ffff00ff
!	%f1  = 000000ff, Mem[0000000010001408] = ff00e0d4
	sta	%f1 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000ff

p0_label_202:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 0000000000000000, %l6 = ffffffffffffffff
	ldxa	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000218000c1] = 775e5a98, %l2 = 0000000000000000, %asi = 80
	lduba	[%o3+0x0c1]%asi,%l2	! %l2 = 000000000000005e
!	Mem[00000000100c1410] = ff8d0000, %l7 = 0000000000000000
	ldswa	[%i3+%o5]0x80,%l7	! %l7 = ffffffffff8d0000
!	Mem[0000000010101410] = 00000000ffe2fb57, %f22 = 0000004a 7fffffff
	ldda	[%i4+%o5]0x80,%f22	! %f22 = 00000000 ffe2fb57
!	Mem[0000000030001410] = ff0ec604, %l6 = 0000000000000000
	ldswa	[%i0+%o5]0x89,%l6	! %l6 = ffffffffff0ec604
!	Mem[0000000030041408] = 06000000, %l3 = 00000000ffc5281b
	lduwa	[%i1+%o4]0x89,%l3	! %l3 = 0000000006000000
!	Mem[0000000010081410] = 00000000, %l3 = 0000000006000000
	lduwa	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181408] = 0000005e, %l6 = ffffffffff0ec604
	lduha	[%i6+%o4]0x89,%l6	! %l6 = 000000000000005e
!	Mem[0000000030041408] = 00000006, %l7 = ffffffffff8d0000
	ldsha	[%i1+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l3 = 0000000000000000
	ldswa	[%i2+%o5]0x81,%l3	! %l3 = 0000000000000000

p0_label_203:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 00000000, %l1 = 00000000ffffffff
	swapa	[%i4+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181434] = 0000d786, %l6 = 0000005e, %l5 = 0000c691
	add	%i6,0x34,%g1
	casa	[%g1]0x80,%l6,%l5	! %l5 = 000000000000d786
!	%f30 = 5612ff4c, Mem[0000000010081438] = 00000000
	sta	%f30,[%i2+0x038]%asi	! Mem[0000000010081438] = 5612ff4c
!	Mem[00000000300c1408] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = ff000000f869e604, %l5 = 000000000000d786, %l1 = 0000000000000000
	casxa	[%i1]0x80,%l5,%l1	! %l1 = ff000000f869e604
!	Mem[0000000010141400] = 00000000, %l2 = 000000000000005e
	swapa	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%f18 = 00000006 0000005e, Mem[0000000010081400] = ff000000 d4ff0000, %asi = 80
	stda	%f18,[%i2+0x000]%asi	! Mem[0000000010081400] = 00000006 0000005e
!	Mem[0000000010181400] = 00000000, %l3 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = ff000000, %l7 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 00000000ff000000
!	%l3 = 0000000000000000, Mem[0000000010041434] = 00000000
	sth	%l3,[%i1+0x034]		! Mem[0000000010041434] = 00000000

p0_label_204:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 9272a57b00000000, %l4 = 0000000000000000
	ldxa	[%i1+%o4]0x88,%l4	! %l4 = 9272a57b00000000
!	Mem[0000000030041408] = 06000000, %l3 = 0000000000000000
	lduba	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1400] = 094c78ff, %l7 = 00000000ff000000
	ldsha	[%i3+%g0]0x88,%l7	! %l7 = 00000000000078ff
!	%l0 = 00000000, %l1 = f869e604, Mem[0000000030141408] = 00000000 c000ffff
	stda	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000 f869e604
!	Mem[0000000010141410] = 7959e581, %l7 = 00000000000078ff
	lduwa	[%i5+%o5]0x88,%l7	! %l7 = 000000007959e581
!	Mem[0000000030041410] = 00000000, %l1 = ff000000f869e604
	lduha	[%i1+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1408] = ff00c691, %l0 = 0000000000000000
	ldswa	[%i3+%o4]0x80,%l0	! %l0 = ffffffffff00c691
!	Mem[00000000201c0000] = ffff8148, %l5 = 000000000000d786
	lduh	[%o0+%g0],%l5		! %l5 = 000000000000ffff
!	Mem[0000000010041408] = 000000007ba57292, %f20 = 00000000 00000000
	ldda	[%i1+%o4]0x80,%f20	! %f20 = 00000000 7ba57292
!	Mem[0000000010081410] = 0000000006000000, %f20 = 00000000 7ba57292
	ldd	[%i2+%o5],%f20		! %f20 = 00000000 06000000

p0_label_205:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 0000000000000000, %l4 = 9272a57b00000000, %l2 = 0000000000000000
	casxa	[%i0]0x80,%l4,%l2	! %l2 = 0000000000000000
!	%f2  = 00000000 0000c691, Mem[0000000030101410] = ffffffff 00000000
	stda	%f2 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000 0000c691
!	Mem[000000001014141f] = 2614ff5b, %l6 = 000000000000005e
	ldstub	[%i5+0x01f],%l6		! %l6 = 000000000000005b
!	%f9  = 1b28c51c, Mem[0000000030141400] = 000000ff
	sta	%f9 ,[%i5+%g0]0x89	! Mem[0000000030141400] = 1b28c51c
!	%l5 = 000000000000ffff, Mem[0000000030081410] = 00000000
	stba	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = ff000000
!	Mem[0000000030101408] = 00000000, %l1 = 0000000000000000
	swapa	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000
!	%f26 = 86d700ff ff000000, %l3 = 0000000000000000
!	Mem[0000000010001400] = 0000000000000000
	stda	%f26,[%i0+%l3]ASI_PST16_PL ! Mem[0000000010001400] = 0000000000000000
!	%f20 = 00000000 06000000, %l4 = 9272a57b00000000
!	Mem[0000000030141400] = 1cc5281b00000000
	stda	%f20,[%i5+%l4]ASI_PST16_SL ! Mem[0000000030141400] = 1cc5281b00000000
!	Mem[0000000010081400] = 00000006, %l0 = 00000000ff00c691
	swapa	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000006
!	%l2 = 0000000000000000, Mem[0000000010081400] = ff00c6910000005e
	stxa	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000000000

p0_label_206:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 1b28c51c, %l4 = 9272a57b00000000
	lduwa	[%i5+%g0]0x89,%l4	! %l4 = 000000001b28c51c
!	Mem[00000000300c1400] = 1b28c5ff, %l0 = 0000000000000006
	ldsha	[%i3+%g0]0x89,%l0	! %l0 = ffffffffffffc5ff
!	Mem[0000000010001400] = 00000000, %l7 = 000000007959e581
	lduha	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = 094c78ff, %l6 = 000000000000005b
	lduha	[%i3+%g0]0x88,%l6	! %l6 = 00000000000078ff
	membar	#Sync			! Added by membar checker (37)
!	Mem[0000000030101400] = 00000000 000000ff 00000000 00000000
!	Mem[0000000030101410] = 91c60000 00000000 00000000 000000ff
!	Mem[0000000030101420] = 00a3ffff 0dc60e86 ff000000 164d9eff
!	Mem[0000000030101430] = 00000000 000000ff cafaf8d3 c0000000
	ldda	[%i4+%g0]ASI_BLK_SL,%f16	! Block Load from 0000000030101400
!	Mem[0000000010081410] = 00000000, %l5 = 000000000000ffff
	lduba	[%i2+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001410] = ffffff86 00ff15ff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i0+%o5]0x88,%l2	! %l2 = 0000000000ff15ff 00000000ffffff86
!	Mem[0000000010041410] = 00000000, %l0 = ffffffffffffc5ff
	ldsha	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000000
!	%f23 = 00000000, %f15 = 00000000, %f4  = 00000000 d4ff0000
	fsmuld	%f23,%f15,%f4 		! %f4  = 00000000 00000000
!	Mem[0000000030081410] = 00ffffff000000ff, %f14 = 91c60000 00000000
	ldda	[%i2+%o5]0x89,%f14	! %f14 = 00ffffff 000000ff

p0_label_207:
!	Starting 10 instruction Store Burst
!	%f11 = 4c541287, Mem[0000000010041410] = 00000000
	sta	%f11,[%i1+%o5]0x88	! Mem[0000000010041410] = 4c541287
!	Mem[0000000010141424] = 0000c691, %l1 = 0000000000000000, %asi = 80
	swapa	[%i5+0x024]%asi,%l1	! %l1 = 000000000000c691
!	%l1 = 000000000000c691, Mem[0000000010001408] = 000000ff
	stha	%l1,[%i0+%o4]0x80	! Mem[0000000010001408] = c69100ff
!	Mem[00000000100c1438] = 0dc60e884a000000, %l5 = 0000000000000000, %l3 = 00000000ffffff86
	add	%i3,0x38,%g1
	casxa	[%g1]0x80,%l5,%l3	! %l3 = 0dc60e884a000000
!	%l5 = 0000000000000000, Mem[0000000030001410] = ff0ec604
	stwa	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	%f30 = 000000c0 d3f8faca, Mem[0000000030081410] = ff000000 ffffff00
	stda	%f30,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000c0 d3f8faca
!	%f17 = 00000000, Mem[000000001014142c] = 86ffffff
	st	%f17,[%i5+0x02c]	! Mem[000000001014142c] = 00000000
!	Mem[0000000010181410] = 00000006, %l3 = 0dc60e884a000000
	ldstuba	[%i6+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%l3 = 0000000000000000, Mem[00000000300c1410] = ff000000f869e6ff
	stxa	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000000000000000
!	Mem[0000000010041400] = ff000000, %l7 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l7	! %l7 = 00000000000000ff

p0_label_208:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00000000, %l6 = 00000000000078ff
	lduba	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081408] = 0dc60000, %l5 = 0000000000000000
	lduba	[%i2+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = ff0091c6, %l3 = 0000000000000000
	lduha	[%i0+%o4]0x88,%l3	! %l3 = 00000000000091c6
!	Mem[0000000010141410] = 7d1714307959e581, %f4  = 00000000 00000000
	ldda	[%i5+%o5]0x88,%f4 	! %f4  = 7d171430 7959e581
!	Mem[0000000010001410] = ffffff8600ff15ff, %f2  = 00000000 0000c691
	ldda	[%i0+%o5]0x88,%f2 	! %f2  = ffffff86 00ff15ff
!	Mem[0000000030041408] = 5e00000006000000, %l7 = 00000000000000ff
	ldxa	[%i1+%o4]0x89,%l7	! %l7 = 5e00000006000000
!	Mem[0000000030081400] = 00000000, %l2 = 0000000000ff15ff
	ldsha	[%i2+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000021800180] = ffff5728, %l7 = 5e00000006000000
	ldub	[%o3+0x180],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010081400] = 00000000, %l1 = 000000000000c691
	lduba	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[000000001014142c] = 00000000, %l4 = 000000001b28c51c
	ldsw	[%i5+0x02c],%l4		! %l4 = 0000000000000000

p0_label_209:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000030181400] = 00000000
	stwa	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	%l6 = 0000000000000000, Mem[0000000030001408] = 00000006
	stwa	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	%l2 = 0000000000000000, Mem[0000000030041408] = 06000000
	stba	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 06000000
!	%l7 = 00000000000000ff, %l2 = 0000000000000000, %l1 = 0000000000000000
	xnor	%l7,%l2,%l1		! %l1 = ffffffffffffff00
!	Mem[00000000201c0000] = ffff8148, %l5 = 0000000000000000
	ldstub	[%o0+%g0],%l5		! %l5 = 00000000000000ff
!	%f22 = ff000000 00000000, %l7 = 00000000000000ff
!	Mem[00000000100c1408] = ff00c691ffffffff
	add	%i3,0x008,%g1
	stda	%f22,[%g1+%l7]ASI_PST32_PL ! Mem[00000000100c1408] = 00000000000000ff
!	Mem[0000000010141400] = 5e000000, %l6 = 0000000000000000
	ldstuba	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000000
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010101420] = 00000000 ffff00ff, %asi = 80
	stda	%l6,[%i4+0x020]%asi	! Mem[0000000010101420] = 00000000 000000ff
!	%f4  = 7d171430 7959e581, Mem[00000000300c1400] = 1b28c5ff f6091f67
	stda	%f4 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 7d171430 7959e581
!	Mem[0000000030101410] = 0000c691, %l6 = 0000000000000000
	swapa	[%i4+%o5]0x89,%l6	! %l6 = 000000000000c691

p0_label_210:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141418] = 0dcf6fd22614ffff, %f18 = 00000000 00000000, %asi = 80
	ldda	[%i5+0x018]%asi,%f18	! %f18 = 0dcf6fd2 2614ffff
!	Mem[00000000300c1410] = 00000000, %f16 = ff000000
	lda	[%i3+%o5]0x81,%f16	! %f16 = 00000000
!	Mem[0000000010141400] = 000000005e0000ff, %l7 = 00000000000000ff
	ldxa	[%i5+%g0]0x88,%l7	! %l7 = 000000005e0000ff
!	Mem[00000000300c1400] = 7959e581, %l4 = 0000000000000000
	ldsba	[%i3+%g0]0x89,%l4	! %l4 = ffffffffffffff81
!	Mem[0000000030001400] = 00000000, %l7 = 000000005e0000ff
	lduwa	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %f1  = 000000ff
	lda	[%i1+%g0]0x81,%f1 	! %f1 = 00000000
!	Mem[0000000010141400] = ff00005e, %f25 = ffffa300
	lda	[%i5+%g0]0x80,%f25	! %f25 = ff00005e
!	Mem[0000000030181410] = 00000000, %l4 = ffffffffffffff81
	ldsha	[%i6+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = ff00005e00000000, %f26 = ff9e4d16 000000ff
	ldda	[%i5+%g0]0x80,%f26	! %f26 = ff00005e 00000000
!	Mem[0000000010101410] = 00000000, %f2  = ffffff86
	lda	[%i4+%o5]0x80,%f2 	! %f2 = 00000000

p0_label_211:
!	Starting 10 instruction Store Burst
!	%f26 = ff00005e 00000000, %l4 = 0000000000000000
!	Mem[0000000030181420] = ff000000bc400000
	add	%i6,0x020,%g1
	stda	%f26,[%g1+%l4]ASI_PST16_S ! Mem[0000000030181420] = ff000000bc400000
!	%f8  = 75784c09 1b28c51c, Mem[0000000030141400] = 1b28c51c 00000000
	stda	%f8 ,[%i5+%g0]0x89	! Mem[0000000030141400] = 75784c09 1b28c51c
!	%l1 = ffffffffffffff00, Mem[0000000030001408] = 00000000
	stwa	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffff00
!	%l5 = 00000000000000ff, Mem[00000000300c1400] = 81e55979
	stba	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffe55979
!	Mem[00000000300c1400] = ffe55979, %l7 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l7	! %l7 = 00000000ffe55979
!	%f21 = 0000c691, Mem[00000000100c1410] = ff8d0000
	sta	%f21,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000c691
!	%l4 = 00000000, %l5 = 000000ff, Mem[00000000300c1400] = 00000000 3014177d
	stda	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000 000000ff
!	%l6 = 000000000000c691, Mem[0000000010181408] = ffffffff
	stba	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 91ffffff
!	Mem[0000000010181408] = 91ffffff, %l0 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l0	! %l0 = 0000000091ffffff
!	Mem[00000000100c1400] = 094c78ff, %l4 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l4	! %l4 = 00000000000000ff

p0_label_212:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 0dc60000, %l4 = 00000000000000ff
	ldsha	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[000000001000141c] = 00000000, %l0 = 0000000091ffffff, %asi = 80
	lduwa	[%i0+0x01c]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = 06000000, %l3 = 00000000000091c6
	ldswa	[%i4+%g0]0x88,%l3	! %l3 = 0000000006000000
!	Mem[0000000030101408] = 00000000, %l0 = 0000000000000000
	ldsha	[%i4+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001410] = 00000000, %l4 = 0000000000000000
	lduba	[%i0+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181410] = 0000000000000000, %f30 = 000000c0 d3f8faca
	ldda	[%i6+%o5]0x81,%f30	! %f30 = 00000000 00000000
!	Mem[0000000030081410] = c0000000, %l3 = 0000000006000000
	lduha	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081434] = 000000ff, %f31 = 00000000
	lda	[%i2+0x034]%asi,%f31	! %f31 = 000000ff
!	Mem[0000000010101408] = 860ec60d, %l7 = 00000000ffe55979
	lduha	[%i4+%o4]0x80,%l7	! %l7 = 000000000000860e
!	Mem[0000000010141408] = ffffffff, %l1 = ffffffffffffff00
	ldsha	[%i5+%o4]0x80,%l1	! %l1 = ffffffffffffffff

p0_label_213:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 00000000, %l5 = 00000000000000ff
	swapa	[%i4+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = ffffffff, %l0 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l0	! %l0 = 00000000ffffffff
!	%l6 = 000000000000c691, Mem[000000001010143f] = ffffa3f3, %asi = 80
	stba	%l6,[%i4+0x03f]%asi	! Mem[000000001010143c] = ffffa391
!	Mem[0000000030181408] = 0000005e, %l2 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l2	! %l2 = 000000000000005e
!	Mem[00000000300c1400] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000000
!	%l3 = 0000000000000000, immd = 0000015b, %y  = 00000000
	sdiv	%l3,0x15b,%l6		! %l6 = 0000000000000000
	mov	%l0,%y			! %y = ffffffff
!	%f10 = 80000000 4c541287, Mem[00000000100c1438] = 0dc60e88 4a000000
	std	%f10,[%i3+0x038]	! Mem[00000000100c1438] = 80000000 4c541287
!	%f2  = 00000000 00ff15ff, Mem[0000000010041400] = 000000ff 04e669f8
	stda	%f2 ,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000 00ff15ff
!	%l5 = 0000000000000000, Mem[0000000010081400] = 00000000
	stha	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	Mem[0000000030081408] = 00000086, %l1 = ffffffffffffffff
	ldstuba	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000000

p0_label_214:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00000000, %l3 = 0000000000000000
	ldsba	[%i4+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141408] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141400] = ff00005e, %l7 = 000000000000860e
	lduba	[%i5+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181408] = 00000000, %l7 = 00000000000000ff
	lduba	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %l5 = 0000000000000000
	ldsha	[%i4+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141408] = ff00000004e669f8, %f24 = 860ec60d ff00005e
	ldda	[%i5+%o4]0x81,%f24	! %f24 = ff000000 04e669f8
!	Mem[0000000030081400] = 00000000 0dc60e86, %l4 = 00000000, %l5 = 00000000
	ldda	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000000 000000000dc60e86
!	Mem[0000000010041408] = 000000007ba57292, %l0 = 00000000ffffffff, %asi = 80
	ldxa	[%i1+0x008]%asi,%l0	! %l0 = 000000007ba57292
!	Mem[0000000010101400] = 0000000600000088, %l0 = 000000007ba57292
	ldxa	[%i4+%g0]0x80,%l0	! %l0 = 0000000600000088
	membar	#Sync			! Added by membar checker (38)
!	Mem[00000000100c1400] = ff784c09 1b28c51c 00000000 000000ff
!	Mem[00000000100c1410] = 0000c691 00000000 00000000 00000088
!	Mem[00000000100c1420] = c000ffff 00ff15de 0ed27fde 00000000
!	Mem[00000000100c1430] = 00000000 ffffff00 80000000 4c541287
	ldda	[%i3+%g0]ASI_BLK_P,%f16	! Block Load from 00000000100c1400

p0_label_215:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 00000000, %l6 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%l4 = 0000000000000000, %l4 = 0000000000000000, %l0 = 0000000600000088
	subc	%l4,%l4,%l0		! %l0 = 0000000000000000
!	%f22 = 00000000 00000088, Mem[00000000300c1408] = ff000000 00000000
	stda	%f22,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000 00000088
!	%l6 = 0000000000000000, immd = fffff08d, %y  = ffffffff
	umul	%l6,-0xf73,%l6		! %l6 = 0000000000000000, %y = 00000000
!	Mem[0000000010041408] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l7	! %l7 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010141400] = ff00005e
	stha	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000005e
!	Mem[0000000010081424] = ff000000, %l3 = 00000000, %l0 = 00000000
	add	%i2,0x24,%g1
	casa	[%g1]0x80,%l3,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030001400] = 00000000, %l6 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%f2  = 00000000, Mem[0000000010101408] = 0dc60e86
	sta	%f2 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	%l5 = 000000000dc60e86, Mem[0000000010181408] = 00000000
	stwa	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 0dc60e86

p0_label_216:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081435] = 000000ff, %l6 = 0000000000000000
	ldub	[%i2+0x035],%l6		! %l6 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %l7 = 0000000000000000
	ldswa	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141408] = 000000ff, %l4 = 0000000000000000
	ldswa	[%i5+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001410] = 00000000, %l1 = 0000000000000000
	lduba	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %f8  = 75784c09
	lda	[%i3+%o4]0x80,%f8 	! %f8 = 00000000
!	Mem[0000000030041410] = 0000000000000000, %f14 = 00ffffff 000000ff
	ldda	[%i1+%o5]0x89,%f14	! %f14 = 00000000 00000000
!	Mem[00000000100c1410] = 91c60000, %f9  = 1b28c51c
	lda	[%i3+%o5]0x88,%f9 	! %f9 = 91c60000
!	Mem[0000000010081410] = 00000000, %l0 = 00000000ff000000
	ldswa	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	%l2 = 000000000000005e, immd = fffffd34, %y  = 00000000
	smul	%l2,-0x2cc,%l3		! %l3 = fffffffffffef918, %y = ffffffff
!	Mem[0000000010041408] = ff000000, %l2 = 000000000000005e
	lduha	[%i1+%o4]0x80,%l2	! %l2 = 000000000000ff00

p0_label_217:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010181438] = ffffffff 00000000, %asi = 80
	stda	%l0,[%i6+0x038]%asi	! Mem[0000000010181438] = 00000000 00000000
!	Mem[0000000010081430] = ff9e4d16000000ff, %l6 = 0000000000000000, %l3 = fffffffffffef918
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l6,%l3	! %l3 = ff9e4d16000000ff
!	Mem[0000000030141400] = 1b28c51c, %l2 = 000000000000ff00
	swapa	[%i5+%g0]0x89,%l2	! %l2 = 000000001b28c51c
!	%l4 = 000000ff, %l5 = 0dc60e86, Mem[0000000010101420] = 00000000 000000ff
	std	%l4,[%i4+0x020]		! Mem[0000000010101420] = 000000ff 0dc60e86
!	%l1 = 0000000000000000, Mem[0000000010101410] = 00000000
	stwa	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	%f14 = 00000000 00000000, %l3 = ff9e4d16000000ff
!	Mem[0000000030181430] = ffffff86ffffff86
	add	%i6,0x030,%g1
	stda	%f14,[%g1+%l3]ASI_PST32_S ! Mem[0000000030181430] = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l6 = 00000000, %l6 = 00000000
	casa	[%i0]0x80,%l6,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041400] = 00ff15ff, %l4 = 00000000000000ff
	ldstuba	[%i1+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%l2 = 000000001b28c51c, Mem[0000000010101400] = 0000000600000088
	stxa	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000001b28c51c
!	Mem[0000000020800001] = ff00f578, %l0 = 0000000000000000
	ldstuba	[%o1+0x001]%asi,%l0	! %l0 = 0000000000000000

p0_label_218:
!	Starting 10 instruction Load Burst
!	Mem[000000001000143c] = 421d1d32, %l2 = 000000001b28c51c, %asi = 80
	lduwa	[%i0+0x03c]%asi,%l2	! %l2 = 00000000421d1d32
!	Mem[0000000030081400] = 860ec60d00000000, %l7 = 0000000000000000
	ldxa	[%i2+%g0]0x89,%l7	! %l7 = 860ec60d00000000
!	Mem[0000000010181434] = 0000d786, %l3 = ff9e4d16000000ff
	lduw	[%i6+0x034],%l3		! %l3 = 000000000000d786
!	Mem[0000000021800140] = 000006f8, %l6 = 0000000000000000
	lduh	[%o3+0x140],%l6		! %l6 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l3 = 000000000000d786
	lduwa	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101410] = 00000000ffe2fb57, %f14 = 00000000 00000000
	ldda	[%i4+%o5]0x80,%f14	! %f14 = 00000000 ffe2fb57
!	Mem[0000000010041400] = 00ff15ff, %l6 = 0000000000000000
	ldswa	[%i1+%g0]0x88,%l6	! %l6 = 0000000000ff15ff
!	Mem[0000000010141400] = 0000005e, %l1 = 0000000000000000
	lduba	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001410] = f5e9c69100000000, %l0 = 0000000000000000
	ldxa	[%i0+%o5]0x89,%l0	! %l0 = f5e9c69100000000
!	Mem[0000000010001414] = 86ffffff, %l3 = 0000000000000000
	ldsb	[%i0+0x014],%l3		! %l3 = ffffffffffffff86

p0_label_219:
!	Starting 10 instruction Store Burst
!	%f12 = 609b881c 00008dff, %l5 = 000000000dc60e86
!	Mem[0000000030001410] = 0000000091c6e9f5
	add	%i0,0x010,%g1
	stda	%f12,[%g1+%l5]ASI_PST32_S ! Mem[0000000030001410] = 609b881c91c6e9f5
!	%f16 = ff784c09 1b28c51c, %l4 = 00000000000000ff
!	Mem[00000000300c1418] = 0000004a2dddfd9b
	add	%i3,0x018,%g1
	stda	%f16,[%g1+%l4]ASI_PST16_S ! Mem[00000000300c1418] = ff784c091b28c51c
!	%f28 = 00000000 ffffff00, %l1 = 0000000000000000
!	Mem[0000000030001430] = 00000000000000ff
	add	%i0,0x030,%g1
	stda	%f28,[%g1+%l1]ASI_PST8_S ! Mem[0000000030001430] = 00000000000000ff
!	Mem[00000000100c1400] = 094c78ff, %l7 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l7	! %l7 = 00000000094c78ff
!	Mem[0000000010181428] = 524878be2233ffa3, %l7 = 00000000094c78ff, %l2 = 00000000421d1d32
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l7,%l2	! %l2 = 524878be2233ffa3
!	Mem[0000000010141410] = 7959e581, %l2 = 000000002233ffa3
	swapa	[%i5+%o5]0x88,%l2	! %l2 = 000000007959e581
!	%l4 = 00000000000000ff, Mem[0000000030141408] = ff000000
	stba	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = ff000000
!	%l7 = 00000000094c78ff, %l6 = 0000000000ff15ff, %l3 = ffffffffffffff86
	subc	%l7,%l6,%l3		! %l3 = 00000000084d6300
!	Mem[0000000021800081] = 3b6afe68, %l3 = 00000000084d6300
	ldstuba	[%o3+0x081]%asi,%l3	! %l3 = 000000000000006a
!	Mem[00000000201c0000] = ffff8148, %l4 = 00000000000000ff
	ldstub	[%o0+%g0],%l4		! %l4 = 00000000000000ff

p0_label_220:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 0000005e, %f2  = 00000000
	lda	[%i5+%g0]0x80,%f2 	! %f2 = 0000005e
!	Mem[0000000030081408] = ff000086, %l3 = 000000000000006a
	lduha	[%i2+%o4]0x81,%l3	! %l3 = 000000000000ff00
!	Mem[00000000201c0000] = ffff8148, %l0 = f5e9c69100000000, %asi = 80
	ldsba	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030101408] = 000000ff 00000000, %l4 = 000000ff, %l5 = 0dc60e86
	ldda	[%i4+%o4]0x81,%l4	! %l4 = 00000000000000ff 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l6 = 0000000000ff15ff
	lduha	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1410] = 0000c691, %l7 = 00000000094c78ff
	lduha	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000000
	membar	#Sync			! Added by membar checker (39)
!	Mem[0000000010101400] = 00000000 1b28c51c 00000000 2dddfdff
!	Mem[0000000010101410] = 00000000 ffe2fb57 ff6f8ce8 f44b4200
!	Mem[0000000010101420] = 000000ff 0dc60e86 228a91fe 536f8ce8
!	Mem[0000000010101430] = ff000000 00000000 5e0497ff ffffa391
	ldda	[%i4+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010101400
!	Mem[0000000030001400] = 00000000, %l0 = ffffffffffffffff
	lduwa	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041408] = ff000000, %l4 = 00000000000000ff
	ldsha	[%i1+%o4]0x80,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000030081408] = ff000086, %l3 = 000000000000ff00
	ldsha	[%i2+%o4]0x81,%l3	! %l3 = ffffffffffffff00

p0_label_221:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 00000000, %l1 = 0000000000000000
	swapa	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%f10 = 80000000, Mem[00000000100c1400] = 00000000
	sta	%f10,[%i3+%g0]0x88	! Mem[00000000100c1400] = 80000000
!	%l6 = 0000000000000000, Mem[0000000010041410] = 8712544cd4ff0000
	stxa	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000030141408] = ff000000
	stwa	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	%l2 = 7959e581, %l3 = ffffff00, Mem[0000000010141400] = 5e000000 00000000
	stda	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 7959e581 ffffff00
!	%f10 = 80000000 4c541287, %l3 = ffffffffffffff00
!	Mem[0000000030041430] = 86ffffff86ffffff
	add	%i1,0x030,%g1
	stda	%f10,[%g1+%l3]ASI_PST16_S ! Mem[0000000030041430] = 86ffffff86ffffff
!	%f5  = 7959e581, %f15 = ffe2fb57, %f12 = 609b881c
	fadds	%f5 ,%f15,%f12		! %f12 = ffe2fb57
!	%f18 = 00000000, Mem[0000000030141408] = 00000000
	sta	%f18,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	Mem[00000000300c1408] = 00000000, %l1 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l1	! %l1 = 0000000000000000
!	%f22 = ff6f8ce8 f44b4200, Mem[0000000010041418] = 00000000 d4ff0000, %asi = 80
	stda	%f22,[%i1+0x018]%asi	! Mem[0000000010041418] = ff6f8ce8 f44b4200

p0_label_222:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = fffff578, %l1 = 0000000000000000
	ldub	[%o1+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030081410] = c0000000, %l3 = ffffffffffffff00
	ldsha	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l5 = 0000000000000000
	lduwa	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l5 = 0000000000000000
	lduha	[%i4+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1400] = 80000000, %f10 = 80000000
	lda	[%i3+%g0]0x88,%f10	! %f10 = 80000000
!	Mem[0000000010101430] = ff00000000000000, %f2  = 0000005e 00ff15ff, %asi = 80
	ldda	[%i4+0x030]%asi,%f2 	! %f2  = ff000000 00000000
!	Mem[00000000100c1400] = 00000080, %l1 = 00000000000000ff
	lduwa	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000080
!	Mem[0000000010081408] = 0dc60000, %l6 = 0000000000000000
	lduwa	[%i2+%o4]0x88,%l6	! %l6 = 000000000dc60000
!	Mem[00000000100c1400] = 80000000, %l6 = 000000000dc60000
	ldswa	[%i3+%g0]0x88,%l6	! %l6 = ffffffff80000000
!	Mem[0000000030181408] = ff000000 06000000, %l6 = 80000000, %l7 = 00000000
	ldda	[%i6+%o4]0x81,%l6	! %l6 = 00000000ff000000 0000000006000000

p0_label_223:
!	Starting 10 instruction Store Burst
!	%f2  = ff000000 00000000, Mem[00000000300c1400] = 000000ff ff000000
	stda	%f2 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = ff000000 00000000
!	%l7 = 0000000006000000, Mem[000000001018142e] = 2233ffa3
	sth	%l7,[%i6+0x02e]		! Mem[000000001018142c] = 22330000
!	Mem[00000000100c1400] = 00000080, %l7 = 0000000006000000
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[000000001014140c] = 00000000, %l4 = 00000000ffffff00
	swap	[%i5+0x00c],%l4		! %l4 = 0000000000000000
!	%l0 = 00000000, %l1 = 00000080, Mem[0000000030041400] = 00000000 00000000
	stda	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000 00000080
!	Mem[0000000030041400] = 00000000, %l5 = 0000000000000000
	swapa	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000000
!	%l0 = 00000000, %l1 = 00000080, Mem[0000000030181408] = 000000ff 00000006
	stda	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 00000080
!	Mem[0000000010081410] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l4	! %l4 = 0000000000000000
!	%l4 = 00000000, %l5 = 00000000, Mem[00000000300c1410] = 00000000 00000000
	stda	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000 00000000
!	%f0  = 04e669f8 00000000, Mem[00000000100c1400] = 800000ff 1cc5281b
	stda	%f0 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 04e669f8 00000000

p0_label_224:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000, %l1 = 0000000000000080
	lduba	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001410] = ff15ff0086ffffff, %f20 = 00000000 ffe2fb57
	ldda	[%i0+%o5]0x80,%f20	! %f20 = ff15ff00 86ffffff
!	Mem[0000000010081400] = 00000000, %l3 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = ff15ff00, %l0 = 0000000000000000
	ldsba	[%i0+%o5]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030181408] = 0000000080000000, %f4  = 7d171430 7959e581
	ldda	[%i6+%o4]0x81,%f4 	! %f4  = 00000000 80000000
!	Mem[0000000030141400] = 00ff0000 094c7875, %l4 = 00000000, %l5 = 00000000
	ldda	[%i5+%g0]0x81,%l4	! %l4 = 0000000000ff0000 00000000094c7875
!	Mem[0000000030101400] = 00000000, %l7 = 0000000000000000
	lduba	[%i4+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800000] = fffff578, %l0 = ffffffffffffffff
	ldub	[%o1+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030081410] = 000000c0, %l7 = 0000000000000000
	lduha	[%i2+%o5]0x81,%l7	! %l7 = 0000000000000000
!	%l4 = 0000000000ff0000, Mem[00000000100c141a] = 00000000, %asi = 80
	stha	%l4,[%i3+0x01a]%asi	! Mem[00000000100c1418] = 00000000

p0_label_225:
!	Starting 10 instruction Store Burst
!	%f28 = ff000000 00000000, %l0 = 00000000000000ff
!	Mem[0000000010081410] = ff00000006000000
	add	%i2,0x010,%g1
	stda	%f28,[%g1+%l0]ASI_PST32_P ! Mem[0000000010081410] = ff00000000000000
!	Mem[0000000030081400] = 00000000, %l6 = 00000000ff000000
	swapa	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%l3 = 0000000000000000, imm = 00000000000001b7, %l2 = 000000007959e581
	orn	%l3,0x1b7,%l2		! %l2 = fffffffffffffe48
!	Mem[0000000010181430] = 91c68d14, %l7 = 00000000, %l4 = 00ff0000
	add	%i6,0x30,%g1
	casa	[%g1]0x80,%l7,%l4	! %l4 = 0000000091c68d14
!	%l2 = fffffffffffffe48, Mem[0000000030081400] = 000000ff
	stha	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000fe48
!	%l1 = 0000000000000000, Mem[0000000021800100] = 50ffb2c8
	sth	%l1,[%o3+0x100]		! Mem[0000000021800100] = 0000b2c8
!	Mem[0000000030101400] = 00000000 000000ff 000000ff 00000000
!	%f16 = 00000000 1b28c51c 00000000 2dddfdff
!	%f20 = ff15ff00 86ffffff ff6f8ce8 f44b4200
!	%f24 = 000000ff 0dc60e86 228a91fe 536f8ce8
!	%f28 = ff000000 00000000 5e0497ff ffffa391
	stda	%f16,[%i4+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030101400
!	%l2 = fffffffffffffe48, Mem[0000000010181410] = ff000006
	stha	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = fe480006
!	Mem[0000000010181408] = 0dc60e86, %l0 = 00000000000000ff
	ldstuba	[%i6+%o4]0x80,%l0	! %l0 = 000000000000000d
!	%l7 = 0000000000000000, Mem[0000000010081410] = 00000000000000ff
	stxa	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000000000000000

p0_label_226:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 7959e581, %l3 = 0000000000000000
	ldsba	[%i5+%g0]0x88,%l3	! %l3 = ffffffffffffff81
	membar	#Sync			! Added by membar checker (40)
!	Mem[0000000010101410] = 00000000, %l5 = 00000000094c7875
	ldsba	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = 00000000 000000ff, %l4 = 91c68d14, %l5 = 00000000
	ldda	[%i3+%g0]0x81,%l4	! %l4 = 0000000000000000 00000000000000ff
!	Mem[0000000030001400] = 4a000000 00000000, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000000 000000004a000000
!	Mem[0000000021800040] = ff0e9e38, %l4 = 0000000000000000, %asi = 80
	lduha	[%o3+0x040]%asi,%l4	! %l4 = 000000000000ff0e
!	Mem[0000000030041400] = 00000000, %l0 = 000000000000000d
	lduba	[%i1+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141410] = a3ff3322, %l3 = ffffffffffffff81
	lduha	[%i5+%o5]0x80,%l3	! %l3 = 000000000000a3ff
!	Mem[00000000300c1408] = 00000000, %l1 = 0000000000000000
	ldsba	[%i3+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000211c0000] = ff00d1d8, %l2 = fffffffffffffe48
	ldsh	[%o2+%g0],%l2		! %l2 = ffffffffffffff00
!	%l3 = 000000000000a3ff, imm = fffffffffffff290, %l1 = 0000000000000000
	or	%l3,-0xd70,%l1		! %l1 = fffffffffffff3ff

p0_label_227:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 00000000, %l5 = 000000004a000000
	ldstuba	[%i5+%o4]0x89,%l5	! %l5 = 0000000000000000
!	%f26 = 228a91fe 536f8ce8, %l0 = 0000000000000000
!	Mem[0000000030181410] = 0000000000000000
	add	%i6,0x010,%g1
	stda	%f26,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030181410] = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i4+%g0]0x88,%l5	! %l5 = 0000000000000000
!	%l7 = 0000000000000000, Mem[000000001018142a] = 524878be
	sth	%l7,[%i6+0x02a]		! Mem[0000000010181428] = 52480000
!	%l2 = ffffffffffffff00, %l1 = fffffffffffff3ff, %y  = ffffffff
	sdiv	%l2,%l1,%l5		! %l5 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	%l0 = 0000000000000000, Mem[00000000218001c0] = 0000a358
	sth	%l0,[%o3+0x1c0]		! Mem[00000000218001c0] = 0000a358
!	%f20 = ff15ff00, Mem[0000000030181410] = 00000000
	sta	%f20,[%i6+%o5]0x89	! Mem[0000000030181410] = ff15ff00
!	Mem[0000000030001400] = 00000000, %l6 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = 00000000 00000000 0000c60d ffffa300
!	%f16 = 00000000 1b28c51c 00000000 2dddfdff
!	%f20 = ff15ff00 86ffffff ff6f8ce8 f44b4200
!	%f24 = 000000ff 0dc60e86 228a91fe 536f8ce8
!	%f28 = ff000000 00000000 5e0497ff ffffa391
	stda	%f16,[%i2+%g0]ASI_BLK_AIUP	! Block Store to 0000000010081400
!	Mem[0000000010141400] = 7959e581, %l7 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l7	! %l7 = 000000007959e581

p0_label_228:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 0000000000000000, %l3 = 000000000000a3ff
	ldxa	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %f5  = 80000000
	lda	[%i1+%o5]0x80,%f5 	! %f5 = 00000000
!	Mem[0000000010041418] = ff6f8ce8f44b4200, %l3 = 0000000000000000, %asi = 80
	ldxa	[%i1+0x018]%asi,%l3	! %l3 = ff6f8ce8f44b4200
!	Mem[00000000201c0000] = ffff8148, %l5 = 0000000000000000
	ldub	[%o0+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010141410] = 2233ffa3, %l0 = 0000000000000000
	lduha	[%i5+%o5]0x88,%l0	! %l0 = 000000000000ffa3
!	Mem[0000000030181410] = ff15ff00, %l0 = 000000000000ffa3
	lduwa	[%i6+%o5]0x89,%l0	! %l0 = 00000000ff15ff00
!	Mem[0000000030101400] = 1b28c51c, %l4 = 000000000000ff0e
	lduwa	[%i4+%g0]0x89,%l4	! %l4 = 000000001b28c51c
!	Mem[0000000010001400] = 00000000, %l3 = ff6f8ce8f44b4200
	ldswa	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (41)
!	Mem[0000000010081400] = 00000000, %l4 = 000000001b28c51c
	lduha	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141400] = 00ff0000, %l0 = 00000000ff15ff00
	ldsba	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000

p0_label_229:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000010141400] = 00000000
	stw	%l5,[%i5+%g0]		! Mem[0000000010141400] = 000000ff
!	%l6 = 00000000, %l7 = 7959e581, Mem[0000000030041400] = 00000000 00000080
	stda	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000 7959e581
!	%l6 = 0000000000000000, Mem[0000000010141410] = 7d1714302233ffa3
	stxa	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010181410] = 060048fe
	stwa	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	%f22 = ff6f8ce8 f44b4200, %l4 = 0000000000000000
!	Mem[0000000010181410] = 0000000000000000
	add	%i6,0x010,%g1
	stda	%f22,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010181410] = 0000000000000000
!	%l6 = 0000000000000000, Mem[00000000300c1408] = 8800000000000000
	stxa	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000000000000
!	%f28 = ff000000 00000000, Mem[0000000010181408] = 860ec6ff 0dc6fa38
	stda	%f28,[%i6+%o4]0x88	! Mem[0000000010181408] = ff000000 00000000
!	%l2 = ffffffffffffff00, Mem[00000000211c0001] = ff00d1d8, %asi = 80
	stba	%l2,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff00d1d8
!	Mem[0000000010141400] = 000000ff 00ffffff 00000000 ffffff00
!	%f0  = 04e669f8 00000000 ff000000 00000000
!	%f4  = 00000000 00000000 00000000 5b2fa1ab
!	%f8  = 00000000 91c60000 80000000 4c541287
!	%f12 = ffe2fb57 00008dff 00000000 ffe2fb57
	stda	%f0 ,[%i5+%g0]ASI_BLK_PL	! Block Store to 0000000010141400
!	%l4 = 0000000000000000, Mem[0000000030041410] = 00000000
	stba	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000

p0_label_230:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 1cc5281b 000000ff, %l2 = ffffff00, %l3 = 00000000
	ldda	[%i4+%g0]0x88,%l2	! %l2 = 00000000000000ff 000000001cc5281b
!	Mem[0000000010081400] = 00000000 1b28c51c 00000000 2dddfdff
!	Mem[0000000010081410] = ff15ff00 86ffffff ff6f8ce8 f44b4200
!	Mem[0000000010081420] = 000000ff 0dc60e86 228a91fe 536f8ce8
!	Mem[0000000010081430] = ff000000 00000000 5e0497ff ffffa391
	ldda	[%i2+%g0]ASI_BLK_PL,%f16	! Block Load from 0000000010081400
!	Mem[0000000030041400] = 81e5597900000000, %f4  = 00000000 00000000
	ldda	[%i1+%g0]0x89,%f4 	! %f4  = 81e55979 00000000
!	Mem[0000000030181400] = 00000000, %f1  = 00000000
	lda	[%i6+%g0]0x81,%f1 	! %f1 = 00000000
!	Mem[0000000010101408] = 00000000, %l7 = 000000007959e581
	ldsba	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000201c0000] = ffff8148, %l4 = 0000000000000000
	ldub	[%o0+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010181410] = 00000000, %f9  = 91c60000
	lda	[%i6+%o5]0x80,%f9 	! %f9 = 00000000
!	%l6 = 0000000000000000, %l1 = fffffffffffff3ff, %l1 = fffffffffffff3ff
	add	%l6,%l1,%l1		! %l1 = fffffffffffff3ff
!	Mem[00000000211c0000] = ff00d1d8, %l3 = 000000001cc5281b
	ldub	[%o2+%g0],%l3		! %l3 = 00000000000000ff
!	Mem[0000000030141410] = 4c541287, %l2 = 00000000000000ff
	ldswa	[%i5+%o5]0x89,%l2	! %l2 = 000000004c541287

p0_label_231:
!	Starting 10 instruction Store Burst
!	%l2 = 000000004c541287, Mem[0000000010001408] = ff0091c6
	stwa	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 4c541287
!	Mem[0000000010081408] = 00000000, %l5 = 00000000000000ff
	swapa	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1424] = 00ff15de, %l3 = 00000000000000ff
	swap	[%i3+0x024],%l3		! %l3 = 0000000000ff15de
!	Mem[0000000010081408] = 000000ff, %l3 = 0000000000ff15de, %asi = 80
	swapa	[%i2+0x008]%asi,%l3	! %l3 = 00000000000000ff
!	%l6 = 0000000000000000, %l7 = 0000000000000000, %l7 = 0000000000000000
	add	%l6,%l7,%l7		! %l7 = 0000000000000000
!	Mem[0000000010041408] = ff000000, %l3 = 00000000000000ff
	swapa	[%i1+%o4]0x80,%l3	! %l3 = 00000000ff000000
!	%l7 = 0000000000000000, Mem[0000000030101408] = 2dddfdff
	stha	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 2ddd0000
!	Mem[000000001008140c] = 2dddfdff, %l4 = 00000000000000ff, %asi = 80
	swapa	[%i2+0x00c]%asi,%l4	! %l4 = 000000002dddfdff
!	%l0 = 0000000000000000, Mem[0000000030081400] = 48fe00000dc60e86
	stxa	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000000000000000
!	%l4 = 000000002dddfdff, Mem[0000000030081410] = 000000c0d3f8faca
	stxa	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000002dddfdff

p0_label_232:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000000, %f5  = 00000000
	lda	[%i2+%g0]0x80,%f5 	! %f5 = 00000000
!	Mem[0000000030041400] = 00000000, %l0 = 0000000000000000
	ldsba	[%i1+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001410] = ff15ff00, %l4 = 000000002dddfdff
	lduwa	[%i0+%o5]0x80,%l4	! %l4 = 00000000ff15ff00
!	Mem[0000000030141400] = 00ff0000 094c7875, %l4 = ff15ff00, %l5 = 00000000
	ldda	[%i5+%g0]0x81,%l4	! %l4 = 0000000000ff0000 00000000094c7875
!	Mem[0000000030181400] = 00000000, %l5 = 00000000094c7875
	lduha	[%i6+%g0]0x81,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (42)
!	Mem[0000000010141438] = 57fbe2ff, %l5 = 0000000000000000
	lduh	[%i5+0x038],%l5		! %l5 = 00000000000057fb
!	Mem[0000000010181410] = 00000000, %l5 = 00000000000057fb
	ldswa	[%i6+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0001] = ffff8148, %l2 = 000000004c541287
	ldstuba	[%o0+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181400] = 00000000ffffff7f, %f28 = 00000000 000000ff
	ldda	[%i6+%g0]0x80,%f28	! %f28 = 00000000 ffffff7f
!	Mem[00000000100c1408] = 00000000, %l3 = 00000000ff000000
	ldswa	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000000

p0_label_233:
!	Starting 10 instruction Store Burst
!	%f9  = 00000000, Mem[0000000010181430] = 91c68d14
	sta	%f9 ,[%i6+0x030]%asi	! Mem[0000000010181430] = 00000000
!	%f18 = fffddd2d, Mem[0000000030041408] = 00000006
	sta	%f18,[%i1+%o4]0x81	! Mem[0000000030041408] = fffddd2d
!	%l2 = 00000000000000ff, Mem[0000000030081400] = 0000000000000000
	stxa	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000000000ff
!	%f14 = 00000000 ffe2fb57, %l4 = 0000000000ff0000
!	Mem[0000000030081430] = 609b881c0b69263d
	add	%i2,0x030,%g1
	stda	%f14,[%g1+%l4]ASI_PST32_S ! Mem[0000000030081430] = 609b881c0b69263d
!	Mem[0000000030181400] = 00000000, %l5 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l5	! %l5 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000020800040] = ffff65a8
	sth	%l5,[%o1+0x040]		! Mem[0000000020800040] = 000065a8
!	%f10 = 80000000, Mem[0000000030041410] = 00000000
	sta	%f10,[%i1+%o5]0x89	! Mem[0000000030041410] = 80000000
!	%l1 = fffffffffffff3ff, Mem[0000000010081400] = 00000000
	stwa	%l1,[%i2+%g0]0x80	! Mem[0000000010081400] = fffff3ff
!	%f14 = 00000000 ffe2fb57, Mem[0000000010101430] = ff000000 00000000, %asi = 80
	stda	%f14,[%i4+0x030]%asi	! Mem[0000000010101430] = 00000000 ffe2fb57
!	%l2 = 00000000000000ff, Mem[0000000030001408] = ffffff00
	stwa	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000ff

p0_label_234:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00000000, %l7 = 0000000000000000
	lduha	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[000000001008143c] = ffffa391, %f26 = e88c6f53
	lda	[%i2+0x03c]%asi,%f26	! %f26 = ffffa391
!	Mem[0000000030141410] = 8712544c, %l3 = 0000000000000000
	ldsba	[%i5+%o5]0x81,%l3	! %l3 = ffffffffffffff87
!	Mem[00000000100c1400] = 00000000, %l2 = 00000000000000ff
	lduba	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041434] = 00000000, %f28 = 00000000
	lda	[%i1+0x034]%asi,%f28	! %f28 = 00000000
!	Mem[00000000201c0000] = ffff8148, %l4 = 0000000000ff0000
	lduh	[%o0+%g0],%l4		! %l4 = 000000000000ffff
!	Mem[000000001010141c] = f44b4200, %l4 = 000000000000ffff, %asi = 80
	ldswa	[%i4+0x01c]%asi,%l4	! %l4 = fffffffff44b4200
!	Mem[0000000010041408] = 000000ff, %f10 = 80000000
	lda	[%i1+%o4]0x80,%f10	! %f10 = 000000ff
!	Mem[0000000010181408] = 00000000000000ff, %l2 = 0000000000000000
	ldxa	[%i6+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181418] = 0000000000000000, %l0 = 0000000000000000, %asi = 80
	ldxa	[%i6+0x018]%asi,%l0	! %l0 = 0000000000000000

p0_label_235:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 00000000, %l6 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = ff15ff00, %l2 = 00000000000000ff
	ldstuba	[%i0+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[00000000201c0000] = ffff8148, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ff8148
!	Mem[0000000030101410] = 86ffffff, %l6 = 0000000000000000
	swapa	[%i4+%o5]0x89,%l6	! %l6 = 0000000086ffffff
!	Mem[0000000010101408] = 00000000, %l4 = fffffffff44b4200
	ldstuba	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000000
!	%l7 = 0000000000000000, Mem[000000001010143c] = ffffa391, %asi = 80
	stwa	%l7,[%i4+0x03c]%asi	! Mem[000000001010143c] = 00000000
!	Mem[00000000100c1408] = 00000000, %l6 = 0000000086ffffff
	swap	[%i3+%o4],%l6		! %l6 = 0000000000000000
!	%f14 = 00000000 ffe2fb57, Mem[0000000030181400] = 00000000 00000000
	stda	%f14,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000 ffe2fb57
!	Mem[0000000010041410] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l1 = 00000000fffff3ff
	swapa	[%i0+%g0]0x81,%l1	! %l1 = 0000000000000000

p0_label_236:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff15ff00, %l5 = 0000000000000000
	lduwa	[%i2+%o5]0x80,%l5	! %l5 = 00000000ff15ff00
!	Mem[0000000010041410] = ff000000, %l6 = 0000000000000000
	ldswa	[%i1+%o5]0x80,%l6	! %l6 = ffffffffff000000
!	Mem[0000000030001400] = fff3ffff, %l6 = ffffffffff000000
	ldsha	[%i0+%g0]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081410] = ff15ff00, %l2 = 00000000000000ff
	lduha	[%i2+%o5]0x80,%l2	! %l2 = 000000000000ff15
!	Mem[0000000010001408] = 8712544c 4a000000, %l4 = 00000000, %l5 = ff15ff00
	ldda	[%i0+%o4]0x80,%l4	! %l4 = 000000008712544c 000000004a000000
!	Mem[00000000211c0000] = ff00d1d8, %l7 = 0000000000000000
	ldsb	[%o2+%g0],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010181400] = 00000000, %l1 = 0000000000000000
	lduha	[%i6+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101408] = 0000dd2d, %f24 = 860ec60d
	lda	[%i4+%o4]0x81,%f24	! %f24 = 0000dd2d
!	Mem[0000000010041410] = 000000ff, %l7 = ffffffffffffffff
	lduha	[%i1+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181410] = 00000000, %f2  = ff000000
	lda	[%i6+%o5]0x80,%f2 	! %f2 = 00000000

p0_label_237:
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffff87, Mem[0000000030141408] = 000000ff
	stba	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000087
!	%l2 = 0000ff15, %l3 = ffffff87, Mem[0000000010041410] = ff000000 00000000
	stda	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000ff15 ffffff87
!	%f28 = 00000000 ffffff7f, Mem[0000000010041438] = ffffffff d3f8faca
	std	%f28,[%i1+0x038]	! Mem[0000000010041438] = 00000000 ffffff7f
!	%l2 = 000000000000ff15, imm = fffffffffffff88e, %l3 = ffffffffffffff87
	xnor	%l2,-0x772,%l3		! %l3 = 000000000000f864
!	Mem[00000000201c0001] = 00ff8148, %l7 = 00000000000000ff
	ldstuba	[%o0+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101408] = 0000dd2d, %l3 = 000000000000f864
	swapa	[%i4+%o4]0x81,%l3	! %l3 = 000000000000dd2d
!	%l6 = ffffffffffffffff, Mem[0000000030001410] = f5e9c6911c889b60
	stxa	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = ffffffffffffffff
!	Mem[0000000030041410] = 80000000, %l7 = 00000000000000ff
	swapa	[%i1+%o5]0x89,%l7	! %l7 = 0000000080000000
!	%l7 = 0000000080000000, Mem[0000000030081410] = 00000000
	stha	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	Mem[0000000010041410] = 0000ff15ffffff87, %l0 = 0000000000000000, %l3 = 000000000000dd2d
	add	%i1,0x10,%g1
	casxa	[%g1]0x80,%l0,%l3	! %l3 = 0000ff15ffffff87

p0_label_238:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = de15ff00, %l7 = 0000000080000000
	lduba	[%i2+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 86ffffff, %l0 = 0000000000000000
	lduba	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000086
!	Mem[0000000010141400] = 00000000, %l6 = ffffffffffffffff
	lduha	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001418] = 00000000 00000000, %l0 = 00000086, %l1 = 00000000
	ldd	[%i0+0x018],%l0		! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010101410] = 00000000, %l5 = 000000004a000000
	ldsha	[%i4+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000218000c1] = 775e5a98, %l6 = 0000000000000000
	ldub	[%o3+0x0c1],%l6		! %l6 = 000000000000005e
!	Mem[0000000010141408] = 00000000000000ff, %f26 = ffffa391 fe918a22
	ldda	[%i5+%o4]0x80,%f26	! %f26 = 00000000 000000ff
!	Mem[0000000030081410] = 00000000, %l1 = 0000000000000000
	ldswa	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181410] = 00ff15ff, %l5 = 0000000000000000
	lduwa	[%i6+%o5]0x81,%l5	! %l5 = 0000000000ff15ff
!	Mem[0000000010101408] = 000000ff, %f21 = 00ff15ff
	lda	[%i4+%o4]0x88,%f21	! %f21 = 000000ff

p0_label_239:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 00000000, %l6 = 000000000000005e
	ldstuba	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000000
!	%f31 = ff97045e, %f12 = ffe2fb57
	fitos	%f31,%f12		! %f12 = cad1f744
!	%f31 = ff97045e, Mem[00000000100c1400] = 00000000
	sta	%f31,[%i3+%g0]0x80	! Mem[00000000100c1400] = ff97045e
!	Mem[0000000010081410] = ff15ff00, %l3 = 0000ff15ffffff87
	ldstuba	[%i2+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Code Fragment 4, seed = 626397
p0_fragment_12:
!	%l0 = 0000000000000000
	setx	0x47710cfd37216e3e,%g7,%l0 ! %l0 = 47710cfd37216e3e
!	%l1 = 0000000000000000
	setx	0x4b652e1f3cb1a6e9,%g7,%l1 ! %l1 = 4b652e1f3cb1a6e9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 47710cfd37216e3e
	setx	0x388fb23dbc3a1ba4,%g7,%l0 ! %l0 = 388fb23dbc3a1ba4
!	%l1 = 4b652e1f3cb1a6e9
	setx	0xd31c3db126034f6f,%g7,%l1 ! %l1 = d31c3db126034f6f
p0_fragment_12_end:
!	%l0 = 388fb23dbc3a1ba4, %l4 = 000000008712544c, %l2 = 000000000000ff15
	xnor	%l0,%l4,%l2		! %l2 = c7704dc2c4d7b017
!	%l7 = 0000000000000000, Mem[00000000100c1408] = ffffff86
	stwa	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	%f23 = e88c6fff, Mem[0000000030101408] = 0000f864
	sta	%f23,[%i4+%o4]0x81	! Mem[0000000030101408] = e88c6fff
!	%f22 = 00424bf4 e88c6fff, Mem[0000000010101400] = ff000000 1b28c51c
	stda	%f22,[%i4+%g0]0x80	! Mem[0000000010101400] = 00424bf4 e88c6fff
!	Mem[0000000030041400] = 00000000, %l1 = d31c3db126034f6f
	ldstuba	[%i1+%g0]0x89,%l1	! %l1 = 0000000000000000

p0_label_240:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 00ff0000, %l4 = 000000008712544c
	lduha	[%i5+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041402] = ff15ff00, %l6 = 0000000000000000
	ldub	[%i1+0x002],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030141408] = 00000087, %l6 = 00000000000000ff
	lduwa	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000087
!	Mem[0000000030081400] = 00000000, %l0 = 388fb23dbc3a1ba4
	lduba	[%i2+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l4 = 00000000000000ff
	lduwa	[%i6+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001418] = 0000000000000000, %f0  = 04e669f8 00000000
	ldd	[%i0+0x018],%f0 	! %f0  = 00000000 00000000
!	Mem[00000000211c0000] = ff00d1d8, %l1 = 0000000000000000
	ldsh	[%o2+%g0],%l1		! %l1 = ffffffffffffff00
!	Mem[0000000010001410] = ff15ff00, %l2 = c7704dc2c4d7b017
	lduha	[%i0+%o5]0x80,%l2	! %l2 = 000000000000ff15
!	Mem[0000000010141414] = 00000000, %l2 = 000000000000ff15
	ldsh	[%i5+0x014],%l2		! %l2 = 0000000000000000
!	Mem[0000000010081408] = 00ff15de 000000ff, %l4 = 00000000, %l5 = 00ff15ff
	ldda	[%i2+%o4]0x80,%l4	! %l4 = 0000000000ff15de 00000000000000ff

p0_label_241:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010081408] = 00ff15de 000000ff
	stda	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000 000000ff
!	Mem[0000000010001413] = ff15ff00, %l2 = 0000000000000000
	ldstuba	[%i0+0x013]%asi,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030041400] = 000000ff
	stwa	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
!	%l4 = 00ff15de, %l5 = 000000ff, Mem[00000000100c1410] = 91c60000 00000000
	stda	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00ff15de 000000ff
!	%l6 = 00000087, %l7 = 00000000, Mem[0000000030101408] = ff6f8ce8 00000000
	stda	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000087 00000000
!	%l7 = 0000000000000000, Mem[0000000010041410] = 0000ff15
	stha	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000ff15
!	Mem[0000000030141408] = 00000087, %l1 = ffffffffffffff00
	ldstuba	[%i5+%o4]0x89,%l1	! %l1 = 0000000000000087
!	%f8  = 00000000, %f31 = ff97045e
	fcmpes	%fcc3,%f8 ,%f31		! %fcc3 = 3
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010001400] = 00000000 00000000
	stda	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000 000000ff
!	%l0 = 0000000000000000, Mem[00000000300c1408] = 000000ff
	stha	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000

p0_label_242:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 8700000000000000, %l0 = 0000000000000000
	ldxa	[%i4+%o4]0x81,%l0	! %l0 = 8700000000000000
!	Mem[0000000030041410] = ff000000 00000000, %l4 = 00ff15de, %l5 = 000000ff
	ldda	[%i1+%o5]0x81,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Mem[0000000030141408] = ff000000, %l0 = 8700000000000000
	ldsha	[%i5+%o4]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010001410] = ffffff86 ffff15ff, %l0 = ffffff00, %l1 = 00000087
	ldda	[%i0+%o5]0x88,%l0	! %l0 = 00000000ffff15ff 00000000ffffff86
!	Mem[0000000030041410] = 000000ff, %l2 = 0000000000000000
	lduha	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1424] = 000000ff, %l0 = 00000000ffff15ff
	ldsw	[%i3+0x024],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010041410] = 15ff0000, %l7 = 0000000000000000
	ldswa	[%i1+%o5]0x88,%l7	! %l7 = 0000000015ff0000
!	%f4  = 81e55979, Mem[0000000030081400] = 00000000
	sta	%f4 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 81e55979
!	Mem[0000000010041426] = ffffa300, %l5 = 0000000000000000
	ldsh	[%i1+0x026],%l5		! %l5 = ffffffffffffa300
!	Mem[0000000010101408] = ff000000, %l3 = 00000000000000ff
	ldswa	[%i4+%o4]0x80,%l3	! %l3 = ffffffffff000000

p0_label_243:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 000000ff, %l0 = 00000000000000ff
	swapa	[%i1+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101410] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000
!	%l4 = 00000000ff000000, %l0 = 0000000000000000, %l5 = ffffffffffffa300
	xor	%l4,%l0,%l5		! %l5 = 00000000ff000000
!	Mem[0000000010181420] = ffffffff, %l5 = 00000000ff000000
	swap	[%i6+0x020],%l5		! %l5 = 00000000ffffffff
!	Mem[0000000010081410] = ff15ff00, %l1 = 00000000ffffff86, %asi = 80
	swapa	[%i2+0x010]%asi,%l1	! %l1 = 00000000ff15ff00
!	Mem[0000000010101424] = 0dc60e86, %l0 = 0000000000000000, %asi = 80
	swapa	[%i4+0x024]%asi,%l0	! %l0 = 000000000dc60e86
!	Mem[0000000010141400] = 00000000, %l7 = 0000000015ff0000
	ldstuba	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000000
!	%l0 = 000000000dc60e86, Mem[0000000030081408] = ff000086
	stha	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 0e860086
!	%l2 = 000000ff, %l3 = ff000000, Mem[00000000100c1408] = 00000000 000000ff
	stda	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ff ff000000
!	%l7 = 0000000000000000, Mem[0000000010101400] = 00424bf4
	stba	%l7,[%i4+%g0]0x80	! Mem[0000000010101400] = 00424bf4

p0_label_244:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000000, %l2 = 00000000000000ff
	ldsba	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001410] = ff15ffff, %l5 = 00000000ffffffff
	lduba	[%i0+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Code Fragment 4, seed = 696200
p0_fragment_13:
!	%l0 = 000000000dc60e86
	setx	0xf52b1249150083e6,%g7,%l0 ! %l0 = f52b1249150083e6
!	%l1 = 00000000ff15ff00
	setx	0x986305617253ec11,%g7,%l1 ! %l1 = 986305617253ec11
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f52b1249150083e6
	setx	0x2b68ba54618e784c,%g7,%l0 ! %l0 = 2b68ba54618e784c
!	%l1 = 986305617253ec11
	setx	0x09598af0a7e42b97,%g7,%l1 ! %l1 = 09598af0a7e42b97
p0_fragment_13_end:
!	Mem[0000000030081408] = 0e860086, %l1 = 09598af0a7e42b97
	lduha	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000e86
!	Mem[0000000030001410] = ffffffff, %l4 = 00000000ff000000
	ldsha	[%i0+%o5]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030101410] = 00000000, %l4 = ffffffffffffffff
	lduha	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041410] = 15ff0000, %l1 = 0000000000000e86
	lduba	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = de15ff00, %l0 = 2b68ba54618e784c
	lduba	[%i3+%o5]0x80,%l0	! %l0 = 00000000000000de
!	Mem[0000000010041410] = 0000ff15ffffff87, %f20 = ffffff86 000000ff
	ldda	[%i1+%o5]0x80,%f20	! %f20 = 0000ff15 ffffff87
!	Mem[0000000030141408] = 000000ff, %l6 = 0000000000000087
	ldswa	[%i5+%o4]0x89,%l6	! %l6 = 00000000000000ff

p0_label_245:
!	Starting 10 instruction Store Burst
!	%f4  = 81e55979 00000000, %l0 = 00000000000000de
!	Mem[00000000100c1438] = 800000004c541287
	add	%i3,0x038,%g1
	stda	%f4,[%g1+%l0]ASI_PST16_PL ! Mem[00000000100c1438] = 800000007959e581
!	%l1 = 0000000000000000, Mem[0000000020800000] = fffff578, %asi = 80
	stha	%l1,[%o1+0x000]%asi	! Mem[0000000020800000] = 0000f578
!	%l4 = 00000000, %l5 = 000000ff, Mem[00000000300c1410] = 00000000 00000000
	stda	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000 000000ff
!	%l4 = 0000000000000000, Mem[0000000010041410] = 0000ff15
	sth	%l4,[%i1+%o5]		! Mem[0000000010041410] = 0000ff15
!	%f12 = cad1f744 00008dff, %l5 = 00000000000000ff
!	Mem[0000000010001400] = 00000000000000ff
	stda	%f12,[%i0+%l5]ASI_PST8_P ! Mem[0000000010001400] = cad1f74400008dff
!	%f4  = 81e55979 00000000, Mem[00000000100c1400] = 5e0497ff 04e669f8
	stda	%f4 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 81e55979 00000000
!	Mem[0000000020800041] = 000065a8, %l2 = 0000000000000000
	ldstuba	[%o1+0x041]%asi,%l2	! %l2 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000030101408] = 8700000000000000
	stxa	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000000000000000
!	%l0 = 00000000000000de, Mem[0000000030001410] = ffffffff
	stha	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 00deffff
!	%l2 = 0000000000000000, Mem[0000000030041408] = fffddd2d0000005e
	stxa	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000000000000000

p0_label_246:
!	Starting 10 instruction Load Burst
!	Mem[000000001008140d] = 000000ff, %l5 = 00000000000000ff
	ldsb	[%i2+0x00d],%l5		! %l5 = 0000000000000000
!	Mem[0000000030041410] = ff00000000000000, %f18 = fffddd2d 00000000
	ldda	[%i1+%o5]0x81,%f18	! %f18 = ff000000 00000000
!	Mem[00000000201c0000] = 00ff8148, %l2 = 0000000000000000
	ldsb	[%o0+%g0],%l2		! %l2 = 0000000000000000
!	Mem[0000000010001410] = ff15ffff, %f7  = 5b2fa1ab
	ld	[%i0+%o5],%f7 		! %f7 = ff15ffff
!	Mem[0000000010101400] = f44b4200, %l2 = 0000000000000000
	lduba	[%i4+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041410] = 0000ff15ffffff87, %l4 = 0000000000000000
	ldxa	[%i1+%o5]0x80,%l4	! %l4 = 0000ff15ffffff87
!	Mem[0000000030141410] = 80000000 4c541287, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i5+%o5]0x89,%l6	! %l6 = 000000004c541287 0000000080000000
!	Mem[0000000010181400] = 00000000ffffff7f, %f8  = 00000000 00000000, %asi = 80
	ldda	[%i6+0x000]%asi,%f8 	! %f8  = 00000000 ffffff7f
!	Mem[0000000030101408] = 00000000, %f18 = ff000000
	lda	[%i4+%o4]0x81,%f18	! %f18 = 00000000
!	Mem[00000000100c1408] = 000000ff ff000000, %l2 = 00000000, %l3 = ff000000
	ldda	[%i3+%o4]0x80,%l2	! %l2 = 00000000000000ff 00000000ff000000

p0_label_247:
!	Starting 10 instruction Store Burst
!	%l2 = 000000ff, %l3 = ff000000, Mem[0000000010181400] = 00000000 7fffffff
	stda	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff ff000000
!	Mem[0000000010181400] = ff000000, %l1 = 0000000000000000
	ldstuba	[%i6+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	%l3 = 00000000ff000000, Mem[0000000030141400] = 75784c090000ff00
	stxa	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000ff000000
!	%f16 = 1cc5281b 00000000, %l1 = 00000000000000ff
!	Mem[0000000010181430] = 000000000000d786
	add	%i6,0x030,%g1
	stda	%f16,[%g1+%l1]ASI_PST16_P ! Mem[0000000010181430] = 1cc5281b00000000
!	%l7 = 0000000080000000, Mem[0000000030141400] = 000000ff00000000
	stxa	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000000080000000
!	%f26 = 00000000 000000ff, Mem[0000000030001410] = ffffde00 ffffffff
	stda	%f26,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000 000000ff
!	%l0 = 00000000000000de, Mem[0000000010001410] = ff15ffff
	stwa	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000de
!	Mem[0000000010081410] = ffffff86, %l4 = 00000000ffffff87
	swapa	[%i2+%o5]0x80,%l4	! %l4 = 00000000ffffff86
!	%l1 = 00000000000000ff, Mem[0000000020800040] = 00ff65a8, %asi = 80
	stha	%l1,[%o1+0x040]%asi	! Mem[0000000020800040] = 00ff65a8
!	Mem[0000000010141410] = 00000000, %l1 = 00000000000000ff
	swapa	[%i5+%o5]0x80,%l1	! %l1 = 0000000000000000

p0_label_248:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 7959e581000000ff, %f6  = 00000000 ff15ffff
	ldda	[%i2+%g0]0x81,%f6 	! %f6  = 7959e581 000000ff
!	Mem[0000000010141418] = aba12f5b, %l7 = 0000000080000000, %asi = 80
	lduba	[%i5+0x018]%asi,%l7	! %l7 = 00000000000000ab
!	Mem[0000000030141408] = f869e604 000000ff, %l6 = 4c541287, %l7 = 000000ab
	ldda	[%i5+%o4]0x89,%l6	! %l6 = 00000000000000ff 00000000f869e604
!	Mem[0000000030041410] = 00000000000000ff, %f10 = 000000ff 4c541287
	ldda	[%i1+%o5]0x89,%f10	! %f10 = 00000000 000000ff
!	Mem[0000000030081410] = fffddd2d 00000000, %l4 = ffffff86, %l5 = 00000000
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000 00000000fffddd2d
!	Mem[0000000030141410] = 4c541287, %l7 = 00000000f869e604
	lduba	[%i5+%o5]0x89,%l7	! %l7 = 0000000000000087
!	Mem[00000000100c1420] = c000ffff 000000ff, %l4 = 00000000, %l5 = fffddd2d
	ldd	[%i3+0x020],%l4		! %l4 = 00000000c000ffff 00000000000000ff
!	%l5 = 00000000000000ff, immd = 00000dac, %y  = 00000000
	sdiv	%l5,0xdac,%l2		! %l2 = 0000000000000000
	mov	%l0,%y			! %y = 000000de
!	Mem[0000000010041400] = ff15ff00, %l0 = 00000000000000de
	lduba	[%i1+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081400] = fffff3ff, %l4 = 00000000c000ffff
	lduh	[%i2+%g0],%l4		! %l4 = 000000000000ffff

p0_label_249:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[0000000010181400] = ff000000
	stba	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = ff000000
!	%f14 = 00000000 ffe2fb57, %l1 = 0000000000000000
!	Mem[0000000010181410] = 0000000000000000
	add	%i6,0x010,%g1
	stda	%f14,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010181410] = 0000000000000000
!	%l4 = 0000ffff, %l5 = 000000ff, Mem[0000000030101408] = 00000000 00000000
	stda	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000ffff 000000ff
!	%f8  = 00000000 ffffff7f, %l3 = 00000000ff000000
!	Mem[0000000010001420] = 86ffffff11715c51
	add	%i0,0x020,%g1
	stda	%f8,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010001420] = 86ffffff11715c51
!	%f6  = 7959e581, Mem[00000000100c1408] = ff000000
	sta	%f6 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 7959e581
!	%l3 = 00000000ff000000, Mem[00000000100c1408] = 7959e581
	stha	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = 79590000
!	%f1  = 00000000, Mem[0000000010041408] = 000000ff
	sta	%f1 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	%f18 = 00000000 00000000, Mem[0000000010081418] = ff6f8ce8 f44b4200
	std	%f18,[%i2+0x018]	! Mem[0000000010081418] = 00000000 00000000
!	%l2 = 0000000000000000, %l2 = 0000000000000000, %y  = 000000de
	udiv	%l2,%l2,%l4		! Div by zero, %l0 = 0000000000000127
!	%l2 = 0000000000000000, Mem[0000000010081422] = 000000ff, %asi = 80
	stba	%l2,[%i2+0x022]%asi	! Mem[0000000010081420] = 000000ff

p0_label_250:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 0e860086, %l2 = 0000000000000000
	ldsha	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000e86
!	Mem[0000000010181426] = ffffffff, %l7 = 0000000000000087, %asi = 80
	lduba	[%i6+0x026]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081410] = fffddd2d00000000, %f2  = 00000000 00000000
	ldda	[%i2+%o5]0x89,%f2 	! %f2  = fffddd2d 00000000
!	Mem[0000000010001410] = 000000de86ffffff, %f0  = 00000000 00000000
	ldd	[%i0+%o5],%f0 		! %f0  = 000000de 86ffffff
!	Mem[0000000010001400] = cad1f744, %f28 = 00000000
	lda	[%i0+%g0]0x80,%f28	! %f28 = cad1f744
!	Mem[0000000010181410] = 0000000000000000, %f16 = 1cc5281b 00000000
	ldda	[%i6+%o5]0x88,%f16	! %f16 = 00000000 00000000
!	Mem[0000000010101410] = 000000ff, %l0 = 0000000000000127
	ldsba	[%i4+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000300c1408] = 0000000000000000, %f22 = 00424bf4 e88c6fff
	ldda	[%i3+%o4]0x81,%f22	! %f22 = 00000000 00000000
!	Mem[0000000010001408] = 8712544c4a000000, %l6 = 00000000000000ff
	ldxa	[%i0+%o4]0x80,%l6	! %l6 = 8712544c4a000000
!	Mem[0000000010081420] = 000000ff, %l5 = 00000000000000ff, %asi = 80
	ldswa	[%i2+0x020]%asi,%l5	! %l5 = 00000000000000ff

p0_label_251:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1420] = c000ffff000000ff, %l7 = 00000000000000ff, %l1 = 0000000000000000
	add	%i3,0x20,%g1
	casxa	[%g1]0x80,%l7,%l1	! %l1 = c000ffff000000ff
!	%f31 = ff97045e, Mem[0000000010101410] = ff000000
	st	%f31,[%i4+%o5]		! Mem[0000000010101410] = ff97045e
!	Mem[0000000030181408] = 00000000, %l4 = 000000000000ffff
	ldstuba	[%i6+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0001] = 00ff8148, %l0 = ffffffffffffffff
	ldstub	[%o0+0x001],%l0		! %l0 = 00000000000000ff
!	%l2 = 00000e86, %l3 = ff000000, Mem[0000000010081400] = fff3ffff 1cc5281b
	stda	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000e86 ff000000
!	%l7 = 00000000000000ff, Mem[00000000100c1410] = de15ff00ff000000
	stxa	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000000000ff
!	Mem[0000000010181400] = ff000000, %l0 = 00000000000000ff
	swapa	[%i6+%g0]0x80,%l0	! %l0 = 00000000ff000000
!	%l4 = 0000000000000000, Mem[0000000030081410] = 00000000
	stha	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	%l7 = 00000000000000ff, Mem[0000000010001406] = 00008dff
	sth	%l7,[%i0+0x006]		! Mem[0000000010001404] = 000000ff
!	%l1 = c000ffff000000ff, Mem[0000000010041408] = 00000000
	stba	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff

p0_label_252:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 7959e581, %l7 = 00000000000000ff
	lduba	[%i2+%g0]0x81,%l7	! %l7 = 0000000000000079
!	Mem[0000000030101410] = 00000000, %l4 = 0000000000000000
	ldsha	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041434] = 00000000, %l5 = 00000000000000ff
	ldsw	[%i1+0x034],%l5		! %l5 = 0000000000000000
!	Mem[0000000010101410] = 5e0497ff, %l7 = 0000000000000079
	lduba	[%i4+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101400] = 00000000 1b28c51c, %l6 = 4a000000, %l7 = 000000ff
	ldda	[%i4+%g0]0x89,%l6	! %l6 = 000000001b28c51c 0000000000000000
!	Mem[0000000030141410] = 4c541287, %l5 = 0000000000000000
	ldsba	[%i5+%o5]0x89,%l5	! %l5 = ffffffffffffff87
!	Mem[0000000010181437] = 00000000, %l3 = 00000000ff000000
	ldub	[%i6+0x037],%l3		! %l3 = 0000000000000000
!	Mem[0000000010101420] = 000000ff00000000, %f22 = 00000000 00000000
	ldd	[%i4+0x020],%f22	! %f22 = 000000ff 00000000
!	Mem[0000000030101410] = 00000000, %f2  = fffddd2d
	lda	[%i4+%o5]0x81,%f2 	! %f2 = 00000000
!	Mem[00000000100c1408] = 79590000, %l5 = ffffffffffffff87
	ldsha	[%i3+%o4]0x88,%l5	! %l5 = 0000000000000000

p0_label_253:
!	Starting 10 instruction Store Burst
!	%f21 = ffffff87, Mem[0000000030101410] = 00000000
	sta	%f21,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffff87
!	Mem[0000000010181409] = 00000000, %l0 = 00000000ff000000
	ldstuba	[%i6+0x009]%asi,%l0	! %l0 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000030101400] = 1b28c51c
	stwa	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	Mem[0000000010041400] = ff15ff00, %l3 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	%l2 = 00000e86, %l3 = 000000ff, Mem[0000000010001410] = 000000de 86ffffff
	stda	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000e86 000000ff
!	%f29 = ffffff7f, Mem[0000000010181410] = 00000000
	sta	%f29,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffff7f
!	%f25 = ff000000, Mem[00000000100c1400] = 00000000
	sta	%f25,[%i3+%g0]0x80	! Mem[00000000100c1400] = ff000000
!	%l2 = 0000000000000e86, Mem[0000000010101400] = 00424bf4e88c6fff, %asi = 80
	stxa	%l2,[%i4+0x000]%asi	! Mem[0000000010101400] = 0000000000000e86
!	%f20 = 0000ff15 ffffff87, %l7 = 0000000000000000
!	Mem[0000000030101408] = ffff0000ff000000
	add	%i4,0x008,%g1
	stda	%f20,[%g1+%l7]ASI_PST8_S ! Mem[0000000030101408] = ffff0000ff000000
!	%l1 = c000ffff000000ff, Mem[0000000021800100] = 0000b2c8
	sth	%l1,[%o3+0x100]		! Mem[0000000021800100] = 00ffb2c8

p0_label_254:
!	Starting 10 instruction Load Burst
!	Mem[000000001000142c] = ff000000, %l3 = 00000000000000ff
	ldsw	[%i0+0x02c],%l3		! %l3 = ffffffffff000000
!	Mem[0000000010081410] = ffffff8687ffffff, %l0 = 0000000000000000
	ldxa	[%i2+%o5]0x88,%l0	! %l0 = ffffff8687ffffff
!	Mem[0000000030181400] = 00000000, %l6 = 000000001b28c51c
	ldsba	[%i6+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = 00000000 00000e86, %l6 = 00000000, %l7 = 00000000
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000000 0000000000000e86
!	Mem[0000000030181408] = ff000000, %l5 = 0000000000000000
	ldsha	[%i6+%o4]0x81,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000010081408] = 00000000, %l5 = ffffffffffffff00
	ldswa	[%i2+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041400] = ff15ff0000000000, %f0  = 000000de 86ffffff
	ldda	[%i1+%g0]0x80,%f0 	! %f0  = ff15ff00 00000000
!	Mem[0000000010181428] = 52480000, %l7 = 0000000000000e86, %asi = 80
	lduwa	[%i6+0x028]%asi,%l7	! %l7 = 0000000052480000
!	Mem[0000000010081400] = ff000000 00000e86, %l6 = 00000000, %l7 = 52480000
	ldda	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000e86 00000000ff000000
	membar	#Sync			! Added by membar checker (43)
!	Mem[0000000010041400] = ff15ff00 00000000 ff000000 7ba57292
!	Mem[0000000010041410] = 0000ff15 ffffff87 ff6f8ce8 f44b4200
!	Mem[0000000010041420] = ff0ec60d ffffa300 860ec60d 0000ffff
!	Mem[0000000010041430] = ff000000 00000000 00000000 ffffff7f
	ldda	[%i1+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010041400

p0_label_255:
!	Starting 10 instruction Store Burst
!	%f11 = 000000ff, Mem[0000000010181400] = 000000ff
	sta	%f11,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000ff
!	Mem[0000000030101410] = 87ffffff, %l1 = 00000000000000ff
	swapa	[%i4+%o5]0x89,%l1	! %l1 = 0000000087ffffff
!	Mem[0000000030081400] = 7959e581, %l7 = 00000000ff000000
	ldstuba	[%i2+%g0]0x81,%l7	! %l7 = 0000000000000079
!	%l6 = 0000000000000e86, Mem[0000000020800001] = 0000f578, %asi = 80
	stba	%l6,[%o1+0x001]%asi	! Mem[0000000020800000] = 0086f578
!	Mem[00000000300c1410] = 00000000, %l6 = 0000000000000e86
	swapa	[%i3+%o5]0x89,%l6	! %l6 = 0000000000000000
!	%f8  = 00000000 ffffff7f, %l4 = 0000000000000000
!	Mem[0000000010001420] = 86ffffff11715c51
	add	%i0,0x020,%g1
	stda	%f8,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010001420] = 86ffffff11715c51
!	Mem[00000000211c0000] = ff00d1d8, %l3 = ffffffffff000000, %asi = 80
	ldsba	[%o2+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	%l5 = 0000000000000000, Mem[0000000020800000] = 0086f578
	sth	%l5,[%o1+%g0]		! Mem[0000000020800000] = 0000f578
!	%l2 = 0000000000000e86, Mem[0000000030141410] = 4c541287
	stha	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 4c540e86
!	Mem[0000000010001424] = 11715c51, %l5 = 00000000, %l4 = 00000000
	add	%i0,0x24,%g1
	casa	[%g1]0x80,%l5,%l4	! %l4 = 0000000011715c51

p0_label_256:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141430] = ff8d000057fbe2ff, %l0 = ffffff8687ffffff
	ldx	[%i5+0x030],%l0		! %l0 = ff8d000057fbe2ff
!	Mem[0000000010141400] = ff000000 f869e604 00000000 000000ff
!	Mem[0000000010141410] = 000000ff 00000000 aba12f5b 00000000
!	Mem[0000000010141420] = 0000c691 00000000 8712544c 00000080
!	Mem[0000000010141430] = ff8d0000 57fbe2ff 57fbe2ff 00000000
	ldda	[%i5+%g0]ASI_BLK_PL,%f0 	! Block Load from 0000000010141400
!	Mem[0000000030001408] = 000000ff, %l6 = 0000000000000000
	lduha	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081404] = 000000ff, %l2 = 0000000000000e86
	lduw	[%i2+0x004],%l2		! %l2 = 00000000000000ff
!	%l0 = ff8d000057fbe2ff, imm = fffffffffffff67a, %l5 = 0000000000000000
	orn	%l0,-0x986,%l5		! %l5 = ff8d000057fbebff
!	Mem[0000000030001408] = 000000ff, %l0 = ff8d000057fbe2ff
	lduba	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = 81e559ff, %l3 = ffffffffffffffff
	ldsba	[%i2+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030001400] = fffff3ff, %l1 = 0000000087ffffff
	ldswa	[%i0+%g0]0x81,%l1	! %l1 = fffffffffffff3ff
!	Mem[0000000030081408] = 0e86008600000006, %l3 = ffffffffffffffff
	ldxa	[%i2+%o4]0x81,%l3	! %l3 = 0e86008600000006
!	Mem[0000000010141400] = ff000000f869e604, %f28 = ff000000 00000000
	ldda	[%i5+%g0]0x80,%f28	! %f28 = ff000000 f869e604

p0_label_257:
!	Starting 10 instruction Store Burst
!	%l5 = ff8d000057fbebff, Mem[0000000030041400] = 00000000
	stba	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ff
	membar	#Sync			! Added by membar checker (44)
!	%l7 = 0000000000000079, Mem[0000000010041400] = ff15ff00
	stha	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 0079ff00
!	Mem[0000000010081418] = 00000000, %l3 = 0000000000000006, %asi = 80
	swapa	[%i2+0x018]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = ff59e581, %l7 = 0000000000000079
	swapa	[%i2+%g0]0x81,%l7	! %l7 = 00000000ff59e581
!	%l6 = 0000000000000000, Mem[0000000010141400] = ff000000
	stba	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	%l1 = fffffffffffff3ff, Mem[0000000030181408] = 00000080000000ff
	stxa	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = fffffffffffff3ff
!	%f0  = 04e669f8, Mem[0000000010041408] = 000000ff
	sta	%f0 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 04e669f8
!	%f28 = ff000000 f869e604, %l0 = 0000000000000000
!	Mem[0000000030001418] = 0000004a5bd5464c
	add	%i0,0x018,%g1
	stda	%f28,[%g1+%l0]ASI_PST16_S ! Mem[0000000030001418] = 0000004a5bd5464c
!	%l2 = 00000000000000ff, Mem[0000000010141410] = 000000ff
	stba	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = ff0000ff

p0_label_258:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = f869e604 7ba57292, %l6 = 00000000, %l7 = ff59e581
	ldda	[%i1+%o4]0x80,%l6	! %l6 = 00000000f869e604 000000007ba57292
!	Mem[00000000211c0000] = ff00d1d8, %l1 = fffffffffffff3ff
	lduh	[%o2+%g0],%l1		! %l1 = 000000000000ff00
!	Mem[000000001014140a] = 00000000, %l6 = 00000000f869e604
	lduh	[%i5+0x00a],%l6		! %l6 = 0000000000000000
!	Mem[0000000010001410] = 00000e86, %l7 = 000000007ba57292
	ldsba	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041428] = 860ec60d0000ffff, %l3 = 0000000000000000, %asi = 80
	ldxa	[%i1+0x028]%asi,%l3	! %l3 = 860ec60d0000ffff
!	Mem[0000000010041400] = 0079ff00, %l2 = 00000000000000ff
	lduwa	[%i1+%g0]0x80,%l2	! %l2 = 000000000079ff00
!	Mem[00000000100c1408] = 00005979, %l4 = 0000000011715c51
	lduba	[%i3+%o4]0x80,%l4	! %l4 = 0000000000000000
!	%f12 = ffe2fb57, %f20 = 0000ff15
	fcmpes	%fcc0,%f12,%f20		! %fcc0 = 3
!	Mem[0000000010081408] = 00000000000000ff, %f30 = 00000000 ffffff7f, %asi = 80
	ldda	[%i2+0x008]%asi,%f30	! %f30 = 00000000 000000ff
!	Mem[0000000010101410] = ff97045e, %l6 = 0000000000000000
	ldsha	[%i4+%o5]0x80,%l6	! %l6 = ffffffffffffff97

p0_label_259:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101408] = ffff0000, %l1 = 000000000000ff00
	ldstuba	[%i4+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	%f24 = ff0ec60d, Mem[0000000010101400] = 00000000
	sta	%f24,[%i4+%g0]0x88	! Mem[0000000010101400] = ff0ec60d
!	%f25 = ffffa300, Mem[0000000010081410] = 87ffffff
	sta	%f25,[%i2+%o5]0x88	! Mem[0000000010081410] = ffffa300
!	Mem[000000001008140d] = 000000ff, %l4 = 00000000000000ff
	ldstub	[%i2+0x00d],%l4		! %l4 = 0000000000000000
!	%l4 = 00000000, %l5 = 57fbebff, Mem[0000000010081408] = 00000000 ff00ff00
	stda	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000 57fbebff
!	Mem[0000000010101438] = 5e0497ff00000000, %l2 = 000000000079ff00, %l2 = 000000000079ff00
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l2,%l2	! %l2 = 5e0497ff00000000
!	%l5 = ff8d000057fbebff, Mem[00000000100c1408] = 00005979ff000000
	stxa	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff8d000057fbebff
!	%f16 = ff15ff00 00000000, Mem[0000000010081430] = ff000000 00000000, %asi = 80
	stda	%f16,[%i2+0x030]%asi	! Mem[0000000010081430] = ff15ff00 00000000
!	%f18 = ff000000 7ba57292, Mem[00000000300c1410] = 860e0000 000000ff
	stda	%f18,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff000000 7ba57292

p0_label_260:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00000000, %l7 = 0000000000000000
	ldsha	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1404] = 7959e581, %l2 = 5e0497ff00000000, %asi = 80
	lduha	[%i3+0x004]%asi,%l2	! %l2 = 0000000000007959
!	Mem[0000000010081410] = 00a3ffff, %l0 = 0000000000000000
	lduba	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141410] = 4c540e86, %f19 = 7ba57292
	lda	[%i5+%o5]0x89,%f19	! %f19 = 4c540e86
!	Mem[0000000030181410] = 00000000 ff15ff00, %l2 = 00007959, %l3 = 0000ffff
	ldda	[%i6+%o5]0x89,%l2	! %l2 = 00000000ff15ff00 0000000000000000
!	Mem[0000000030001400] = fff3ffff, %l7 = 0000000000000000
	lduba	[%i0+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1400] = 000000ff, %l4 = 0000000000000000
	ldsha	[%i3+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081423] = 000000ff, %l3 = 0000000000000000
	ldstuba	[%i2+0x023]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001410] = 860e0000, %l2 = 00000000ff15ff00
	lduha	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101433] = 00000000, %l5 = ff8d000057fbebff, %asi = 80
	ldsba	[%i4+0x033]%asi,%l5	! %l5 = 0000000000000000

p0_label_261:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1438] = 80000000, %l1 = 00000000000000ff
	swap	[%i3+0x038],%l1		! %l1 = 0000000080000000
!	%l2 = 0000000000000000, Mem[00000000300c1408] = 0000000000000000
	stxa	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000000000000
!	%l1 = 0000000080000000, Mem[0000000030101400] = ff000000
	stwa	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = 80000000
!	%l5 = 0000000000000000, Mem[0000000010001400] = 44f7d1ca
	stha	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 44f70000
!	%l3 = 00000000000000ff, Mem[0000000030081410] = 00000000
	stba	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff
!	%l4 = 00000000000000ff, Mem[000000001018142c] = 22330000
	sth	%l4,[%i6+0x02c]		! Mem[000000001018142c] = 00ff0000
!	%f10 = 80000000 4c541287, Mem[0000000010141400] = 00000000 04e669f8
	stda	%f10,[%i5+%g0]0x88	! Mem[0000000010141400] = 80000000 4c541287
!	%f14 = 00000000, Mem[0000000010101408] = 000000ff
	sta	%f14,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	%l1 = 0000000080000000, Mem[0000000030101400] = 00000080
	stha	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	%f24 = ff0ec60d, Mem[00000000100c1400] = ff000000
	sta	%f24,[%i3+%g0]0x80	! Mem[00000000100c1400] = ff0ec60d

p0_label_262:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 0e860086, %f16 = ff15ff00
	lda	[%i2+%o4]0x81,%f16	! %f16 = 0e860086
!	%f30 = 00000000, %f27 = 0000ffff, %f2  = ff000000
	fmuls	%f30,%f27,%f2 		! %f2  = 00000000
!	Mem[0000000010041409] = f869e604, %l6 = ffffffffffffff97
	ldub	[%i1+0x009],%l6		! %l6 = 0000000000000069
!	%f8  = 00000000, Mem[0000000030181408] = fff3ffff
	sta	%f8 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	Mem[0000000030181410] = 00ff15ff, %l6 = 0000000000000069
	ldswa	[%i6+%o5]0x81,%l6	! %l6 = 0000000000ff15ff
!	Mem[0000000030181400] = 57fbe2ff 00000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i6+%g0]0x89,%l4	! %l4 = 0000000000000000 0000000057fbe2ff
!	Mem[00000000300c1408] = 00000000, %l4 = 0000000000000000
	ldsba	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141408] = f869e604000000ff, %f6  = 00000000 5b2fa1ab
	ldda	[%i5+%o4]0x89,%f6 	! %f6  = f869e604 000000ff
!	Mem[0000000010041410] = 87ffffff 15ff0000, %l4 = 00000000, %l5 = 57fbe2ff
	ldda	[%i1+%o5]0x88,%l4	! %l4 = 0000000015ff0000 0000000087ffffff
!	Mem[0000000030081400] = 00000079, %l2 = 0000000000000000
	ldsha	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000

p0_label_263:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = ffff0000, %l3 = 00000000000000ff
	swapa	[%i4+%o4]0x81,%l3	! %l3 = 00000000ffff0000
!	%l4 = 0000000015ff0000, Mem[0000000030001408] = 000000ffff000000
	stxa	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000000015ff0000
!	%l7 = 00000000000000ff, immd = fffff1a8, %y  = 000000de
	sdiv	%l7,-0xe58,%l0		! %l0 = fffffffff085db31
	mov	%l0,%y			! %y = f085db31
!	%l5 = 0000000087ffffff, Mem[0000000010101400] = ff0ec60d
	stha	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = ff0effff
!	%f29 = f869e604, %f20 = 0000ff15, %f7  = 000000ff
	fdivs	%f29,%f20,%f7 		! %f7  = ff800000
!	%l4 = 15ff0000, %l5 = 87ffffff, Mem[0000000010141400] = 4c541287 80000000
	stda	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 15ff0000 87ffffff
!	%f29 = f869e604, Mem[00000000100c1418] = 00000000
	st	%f29,[%i3+0x018]	! Mem[00000000100c1418] = f869e604
!	%l5 = 0000000087ffffff, Mem[0000000030081400] = 00000079
	stwa	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = 87ffffff
!	%l6 = 0000000000ff15ff, Mem[0000000020800041] = 00ff65a8
	stb	%l6,[%o1+0x041]		! Mem[0000000020800040] = 00ff65a8
!	%f22 = ff6f8ce8, Mem[0000000010181434] = 00000000
	st	%f22,[%i6+0x034]	! Mem[0000000010181434] = ff6f8ce8

p0_label_264:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 0079ff00, %f7  = ff800000
	lda	[%i1+%g0]0x80,%f7 	! %f7 = 0079ff00
!	%f0  = 04e669f8, %f27 = 0000ffff
	fcmps	%fcc2,%f0 ,%f27		! %fcc2 = 2
!	Mem[0000000010041410] = 0000ff15ffffff87, %l4 = 0000000015ff0000
	ldxa	[%i1+%o5]0x80,%l4	! %l4 = 0000ff15ffffff87
!	Mem[00000000100c1404] = 7959e581, %l6 = 00ff15ff, %l6 = 00ff15ff
	add	%i3,0x04,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 000000007959e581
!	Mem[0000000010181408] = 00ff0000, %l3 = 00000000ffff0000
	ldsha	[%i6+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[000000001014143f] = 00000000, %l6 = 000000007959e581
	ldub	[%i5+0x03f],%l6		! %l6 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l2 = 0000000000000000
	lduba	[%i5+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081400] = 87ffffff, %l1 = 0000000080000000
	lduwa	[%i2+%g0]0x81,%l1	! %l1 = 0000000087ffffff
	membar	#Sync			! Added by membar checker (45)
!	Mem[00000000100c1400] = ff0ec60d 7959e581 ff8d0000 57fbebff
!	Mem[00000000100c1410] = 00000000 000000ff f869e604 00000088
!	Mem[00000000100c1420] = c000ffff 000000ff 0ed27fde 00000000
!	Mem[00000000100c1430] = 00000000 ffffff00 000000ff 7959e581
	ldda	[%i3+%g0]ASI_BLK_P,%f16	! Block Load from 00000000100c1400
!	Mem[00000000300c1410] = 000000ff, %l4 = 0000ff15ffffff87
	ldsba	[%i3+%o5]0x89,%l4	! %l4 = ffffffffffffffff

p0_label_265:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = ff0ec60d, %l5 = 0000000087ffffff
	swapa	[%i3+%g0]0x80,%l5	! %l5 = 00000000ff0ec60d
!	Mem[0000000010081400] = 860e0000, %l0 = fffffffff085db31
	ldstuba	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000086
!	%f16 = ff0ec60d 7959e581, %l0 = 0000000000000086
!	Mem[0000000010141430] = ff8d000057fbe2ff
	add	%i5,0x030,%g1
	stda	%f16,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010141430] = ffe5590057fbe2ff
!	%l5 = 00000000ff0ec60d, Mem[0000000010181410] = 7fffffff
	stwa	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = ff0ec60d
!	%f30 = 000000ff, Mem[0000000010081400] = ff0e0000
	st	%f30,[%i2+%g0]		! Mem[0000000010081400] = 000000ff
!	%l0 = 00000086, %l1 = 87ffffff, Mem[0000000030001410] = 000000ff 00000000
	stda	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000086 87ffffff
!	Mem[0000000010001408] = 8712544c, %l3 = 00000000000000ff
	ldstuba	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000087
!	%l2 = 0000000000000000, Mem[0000000030101400] = 00000000
	stha	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	Mem[00000000300c1400] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%l5 = 00000000ff0ec60d, Mem[0000000030141400] = 00000000
	stba	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 0d000000

p0_label_266:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000, %l6 = 0000000000000000
	ldsha	[%i1+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Code Fragment 3, seed = 626871
p0_fragment_14:
!	%l0 = 0000000000000086
	setx	0xed1702c480cc596e,%g7,%l0 ! %l0 = ed1702c480cc596e
!	%l1 = 0000000087ffffff
	setx	0x6fb24245e12c6b19,%g7,%l1 ! %l1 = 6fb24245e12c6b19
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ed1702c480cc596e
	setx	0x00008dd8e23168d4,%g7,%l0 ! %l0 = 00008dd8e23168d4
!	%l1 = 6fb24245e12c6b19
	setx	0x7592c1d43644d59f,%g7,%l1 ! %l1 = 7592c1d43644d59f
p0_fragment_14_end:
!	Mem[000000001008141e] = 00000000, %l7 = 00000000000000ff, %asi = 80
	lduha	[%i2+0x01e]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l1 = 7592c1d43644d59f
	lduha	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1408] = ff8d0000, %l7 = 0000000000000000
	lduha	[%i3+%o4]0x80,%l7	! %l7 = 000000000000ff8d
!	Mem[0000000030141400] = 0000000d, %l4 = ffffffffffffffff
	ldsba	[%i5+%g0]0x89,%l4	! %l4 = 000000000000000d
!	Mem[0000000010181408] = ff0000000000ff00, %f12 = ffe2fb57 00008dff
	ldda	[%i6+%o4]0x88,%f12	! %f12 = ff000000 0000ff00
!	Mem[0000000010001406] = 000000ff, %l7 = 000000000000ff8d
	ldsh	[%i0+0x006],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010081400] = ff000000, %l4 = 000000000000000d
	lduha	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041408] = 0000000000000000, %f8  = 00000000 91c60000
	ldda	[%i1+%o4]0x89,%f8 	! %f8  = 00000000 00000000

p0_label_267:
!	Starting 10 instruction Store Burst
!	%f22 = f869e604, Mem[0000000010041414] = ffffff87
	st	%f22,[%i1+0x014]	! Mem[0000000010041414] = f869e604
!	Mem[0000000030041400] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000030081408] = 0e860086
	stba	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 00860086
!	%l0 = e23168d4, %l1 = 00000000, Mem[0000000010101408] = 00000000 2dddfdff
	std	%l0,[%i4+%o4]		! Mem[0000000010101408] = e23168d4 00000000
!	%l7 = 00000000000000ff, Mem[0000000010041400] = 0000000000ff7900
	stxa	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000000000ff
!	Mem[0000000030001410] = 00000086, %l1 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000086
!	%l0 = 00008dd8e23168d4, Mem[0000000010041410] = 0000ff15f869e604
	stxa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 00008dd8e23168d4
!	Mem[0000000021800140] = 000006f8, %l0 = 00008dd8e23168d4
	ldstuba	[%o3+0x140]%asi,%l0	! %l0 = 0000000000000000
!	%l7 = 00000000000000ff, Mem[0000000030001400] = fffff3ff
	stwa	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000ff
!	Code Fragment 3, seed = 589413
p0_fragment_15:
!	%l0 = 0000000000000000
	setx	0xf1cac22e3e53f9fe,%g7,%l0 ! %l0 = f1cac22e3e53f9fe
!	%l1 = 0000000000000086
	setx	0x309d7677791966a9,%g7,%l1 ! %l1 = 309d7677791966a9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f1cac22e3e53f9fe
	setx	0xb43e9d2736e0cf64,%g7,%l0 ! %l0 = b43e9d2736e0cf64
!	%l1 = 309d7677791966a9
	setx	0x5a208df3acc6b72f,%g7,%l1 ! %l1 = 5a208df3acc6b72f
p0_fragment_15_end:

p0_label_268:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 0000000d, %f3  = 00000000
	lda	[%i5+%g0]0x89,%f3 	! %f3 = 0000000d
!	Mem[0000000030081408] = 00860086, %l3 = 0000000000000087
	ldswa	[%i2+%o4]0x81,%l3	! %l3 = 0000000000860086
!	Mem[0000000010041408] = f869e604, %l5 = 00000000ff0ec60d
	lduba	[%i1+%o4]0x80,%l5	! %l5 = 00000000000000f8
!	Mem[00000000100c1400] = ffffff87, %l7 = 00000000000000ff
	lduba	[%i3+%g0]0x88,%l7	! %l7 = 0000000000000087
!	%l6 = 0000000000000000, %l5 = 00000000000000f8, %l0 = b43e9d2736e0cf64
	udivx	%l6,%l5,%l0		! %l0 = 0000000000000000
!	Mem[0000000020800000] = 0000f578, %l4 = 0000000000000000
	lduh	[%o1+%g0],%l4		! %l4 = 0000000000000000
!	Mem[00000000300c1400] = 000000ff, %l3 = 0000000000860086
	ldsha	[%i3+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000021800140] = ff0006f8, %l2 = 00000000000000ff
	ldsh	[%o3+0x140],%l2		! %l2 = ffffffffffffff00
!	Mem[00000000100c1418] = f869e604, %l3 = 00000000000000ff, %asi = 80
	lduwa	[%i3+0x018]%asi,%l3	! %l3 = 00000000f869e604
!	Mem[0000000010141400] = 0000ff15, %l5 = 00000000000000f8
	lduba	[%i5+%g0]0x80,%l5	! %l5 = 0000000000000000

p0_label_269:
!	Starting 10 instruction Store Burst
!	%f30 = 000000ff 7959e581, Mem[0000000030041410] = 000000ff 00000000
	stda	%f30,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff 7959e581
!	%l1 = 5a208df3acc6b72f, Mem[0000000030181410] = 00ff15ff00000000
	stxa	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = 5a208df3acc6b72f
!	Mem[0000000030081408] = 86008600, %l1 = 5a208df3acc6b72f
	ldstuba	[%i2+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000211c0000] = ff00d1d8, %l3 = 00000000f869e604
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	%l2 = ffffffffffffff00, Mem[0000000030001408] = 15ff0000
	stba	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 15ff0000
	membar	#Sync			! Added by membar checker (46)
!	%f0  = 04e669f8, Mem[00000000100c1434] = ffffff00
	st	%f0 ,[%i3+0x034]	! Mem[00000000100c1434] = 04e669f8
!	%f30 = 000000ff 7959e581, Mem[0000000010181400] = 000000ff 000000ff, %asi = 80
	stda	%f30,[%i6+0x000]%asi	! Mem[0000000010181400] = 000000ff 7959e581
!	%f14 = 00000000 ffe2fb57, Mem[0000000030041408] = 00000000 00000000
	stda	%f14,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000 ffe2fb57
!	%l1 = 0000000000000000, Mem[0000000010181400] = 81e55979ff000000
	stxa	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000000000000000
!	%f0  = 04e669f8 000000ff, %l0 = 0000000000000000
!	Mem[0000000010181420] = ff000000ffffffff
	add	%i6,0x020,%g1
	stda	%f0,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010181420] = ff000000ffffffff

p0_label_270:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00000000ff0000ff, %f2  = 00000000 0000000d
	ldda	[%i5+%o5]0x88,%f2 	! %f2  = 00000000 ff0000ff
!	Mem[0000000010041400] = ff00000000000000, %l1 = 0000000000000000
	ldxa	[%i1+%g0]0x80,%l1	! %l1 = ff00000000000000
!	Mem[00000000201c0000] = 00ff8148, %l2 = ffffffffffffff00
	lduh	[%o0+%g0],%l2		! %l2 = 00000000000000ff
!	%l5 = 0000000000000000, %l7 = 0000000000000087, %l7 = 0000000000000087
	or	%l5,%l7,%l7		! %l7 = 0000000000000087
!	Mem[0000000010081400] = 000000ff, %f19 = 57fbebff
	lda	[%i2+%g0]0x80,%f19	! %f19 = 000000ff
!	Mem[0000000010041408] = f869e6047ba57292, %f20 = 00000000 000000ff, %asi = 80
	ldda	[%i1+0x008]%asi,%f20	! %f20 = f869e604 7ba57292
!	%l3 = 00000000000000ff, %l2 = 00000000000000ff, %l7 = 0000000000000087
	sdivx	%l3,%l2,%l7		! %l7 = 0000000000000001
!	Mem[0000000010181408] = 00ff0000000000ff, %f26 = 0ed27fde 00000000
	ldd	[%i6+%o4],%f26		! %f26 = 00ff0000 000000ff
!	Mem[0000000030001408] = 15ff0000, %l2 = 00000000000000ff
	ldsha	[%i0+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1408] = 0000000000000000, %l5 = 0000000000000000
	ldxa	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000000

p0_label_271:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 0dc60eff, %l1 = ff00000000000000
	ldstuba	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000010001430] = 00000000 00000000
	std	%l0,[%i0+0x030]		! Mem[0000000010001430] = 00000000 000000ff
!	%l5 = 0000000000000000, Mem[0000000010001408] = 4c5412ff
	stwa	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
!	Mem[0000000030141410] = 860e544c, %l2 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l2	! %l2 = 00000000860e544c
!	%l5 = 0000000000000000, Mem[0000000010001408] = 00000000
	stba	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	%l6 = 0000000000000000, Mem[0000000030041410] = 7959e581
	stwa	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	%l1 = 00000000000000ff, Mem[0000000010101410] = ff97045effe2fb57
	stx	%l1,[%i4+%o5]		! Mem[0000000010101410] = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000030181408] = ffffffff00000000
	stxa	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000000000000000
!	Mem[0000000010141410] = ff0000ff, %l1 = 00000000000000ff
	swapa	[%i5+%o5]0x80,%l1	! %l1 = 00000000ff0000ff
!	%f9  = 00000000, Mem[000000001008140c] = ffebfb57
	sta	%f9 ,[%i2+0x00c]%asi	! Mem[000000001008140c] = 00000000

p0_label_272:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00000000, %l4 = 0000000000000000
	lduwa	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001410] = ff000000, %l6 = 0000000000000000
	ldsba	[%i0+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010041400] = 000000ff, %l6 = ffffffffffffffff
	lduba	[%i1+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000021800001] = ff9a3a08, %l2 = 00000000860e544c
	ldub	[%o3+0x001],%l2		! %l2 = 000000000000009a
!	Mem[0000000030081400] = ffffff87, %l5 = 0000000000000000
	lduba	[%i2+%g0]0x89,%l5	! %l5 = 0000000000000087
!	Mem[0000000010081408] = 00000000, %l0 = 0000000000000000
	ldswa	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141416] = 00000000, %l5 = 0000000000000087, %asi = 80
	ldsba	[%i5+0x016]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101408] = e23168d400000000, %l5 = 0000000000000000
	ldxa	[%i4+%o4]0x80,%l5	! %l5 = e23168d400000000
!	Mem[0000000010141408] = 00000000000000ff, %l5 = e23168d400000000, %asi = 80
	ldxa	[%i5+0x008]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181430] = 1cc5281b, %l0 = 0000000000000000
	lduh	[%i6+0x030],%l0		! %l0 = 0000000000001cc5

p0_label_273:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000001cc5, Mem[0000000010181433] = 1cc5281b
	stb	%l0,[%i6+0x033]		! Mem[0000000010181430] = 1cc528c5
!	%f8  = 00000000, Mem[0000000010081408] = 00000000
	sta	%f8 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	Code Fragment 3, seed = 124132
p0_fragment_16:
!	%l0 = 0000000000001cc5
	setx	0xde8267dac6d67506,%g7,%l0 ! %l0 = de8267dac6d67506
!	%l1 = 00000000ff0000ff
	setx	0x94f70d89a7f59331,%g7,%l1 ! %l1 = 94f70d89a7f59331
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = de8267dac6d67506
	setx	0x1a7f967083e5f56c,%g7,%l0 ! %l0 = 1a7f967083e5f56c
!	%l1 = 94f70d89a7f59331
	setx	0xbb00f8c3ae419eb7,%g7,%l1 ! %l1 = bb00f8c3ae419eb7
p0_fragment_16_end:
!	%l0 = 1a7f967083e5f56c, Mem[00000000100c1400] = 87ffffff
	stha	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = f56cffff
!	Mem[0000000010101410] = 00000000000000ff, %l6 = 00000000000000ff, %l6 = 00000000000000ff
	add	%i4,0x10,%g1
	casxa	[%g1]0x80,%l6,%l6	! %l6 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[0000000010001410] = 00000e86000000ff
	stxa	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000000000ff
!	Mem[000000001014142f] = 00000080, %l1 = bb00f8c3ae419eb7
	ldstuba	[%i5+0x02f]%asi,%l1	! %l1 = 0000000000000080
!	%l3 = 00000000000000ff, Mem[0000000010041400] = 000000ff
	stwa	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000ff
!	%l7 = 0000000000000001, Mem[00000000201c0001] = 00ff8148, %asi = 80
	stba	%l7,[%o0+0x001]%asi	! Mem[00000000201c0000] = 00018148
!	%f1  = 000000ff, Mem[0000000010141410] = ff000000
	sta	%f1 ,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff

p0_label_274:
!	Starting 10 instruction Load Burst
!	Mem[000000001000141c] = 00000000, %l2 = 000000000000009a, %asi = 80
	lduwa	[%i0+0x01c]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l4 = 0000000000000000
	ldswa	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = 00000000000000ff, %f20 = f869e604 7ba57292, %asi = 80
	ldda	[%i4+0x010]%asi,%f20	! %f20 = 00000000 000000ff
!	Mem[0000000010141408] = 00000000, %l0 = 1a7f967083e5f56c
	lduha	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101408] = e23168d4, %l1 = 0000000000000080
	ldsba	[%i4+%o4]0x80,%l1	! %l1 = ffffffffffffffe2
!	Mem[0000000010101408] = 00000000d46831e2, %l7 = 0000000000000001
	ldxa	[%i4+%o4]0x88,%l7	! %l7 = 00000000d46831e2
!	Mem[0000000030081408] = 06000000860086ff, %l1 = ffffffffffffffe2
	ldxa	[%i2+%o4]0x89,%l1	! %l1 = 06000000860086ff
!	Mem[0000000010081408] = 00000000 00000000, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010101408] = e23168d400000000, %f22 = f869e604 00000088
	ldda	[%i4+%o4]0x80,%f22	! %f22 = e23168d4 00000000
!	Mem[00000000100c1408] = ff8d0000, %l4 = 0000000000000000
	lduba	[%i3+%o4]0x80,%l4	! %l4 = 00000000000000ff

p0_label_275:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000010101408] = d46831e2
	stwa	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	Mem[0000000030041408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000
!	%f18 = ff8d0000 000000ff, Mem[0000000010141430] = ffe55900 57fbe2ff
	std	%f18,[%i5+0x030]	! Mem[0000000010141430] = ff8d0000 000000ff
!	Mem[0000000030101400] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l3	! %l3 = 0000000000000000
!	%l5 = 00000000000000ff, Mem[0000000010101408] = 00000000, %asi = 80
	stha	%l5,[%i4+0x008]%asi	! Mem[0000000010101408] = 00ff0000
!	Mem[0000000020800041] = 00ff65a8, %l2 = 0000000000000000
	ldstuba	[%o1+0x041]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141400] = 0d000000, %l2 = 00000000000000ff
	ldstuba	[%i5+%g0]0x81,%l2	! %l2 = 000000000000000d
!	%l0 = 0000000000000000, Mem[0000000030141400] = ff000000
	stba	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	Mem[000000001014143c] = 00000000, %l0 = 0000000000000000
	swap	[%i5+0x03c],%l0		! %l0 = 0000000000000000
!	%l1 = 06000000860086ff, Mem[0000000030081408] = 860086ff
	stwa	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 860086ff

p0_label_276:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041428] = 860ec60d 0000ffff, %l6 = 000000ff, %l7 = d46831e2
	ldd	[%i1+0x028],%l6		! %l6 = 00000000860ec60d 000000000000ffff
!	Mem[0000000010081410] = ffffa300, %l2 = 000000000000000d
	ldsba	[%i2+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1400] = f56cffff, %l2 = 0000000000000000
	lduwa	[%i3+%g0]0x80,%l2	! %l2 = 00000000f56cffff
!	Mem[0000000010141428] = 8712544c, %f5  = ff000000
	lda	[%i5+0x028]%asi,%f5 	! %f5 = 8712544c
!	Mem[000000001004143c] = ffffff7f, %f18 = ff8d0000
	ld	[%i1+0x03c],%f18	! %f18 = ffffff7f
!	Mem[0000000010001400] = 0000f744000000ff, %f0  = 04e669f8 000000ff
	ldda	[%i0+%g0]0x80,%f0 	! %f0  = 0000f744 000000ff
!	Mem[0000000010101408] = 00ff000000000000, %l0 = 0000000000000000
	ldxa	[%i4+%o4]0x80,%l0	! %l0 = 00ff000000000000
!	Mem[0000000010141432] = ff8d0000, %l1 = 06000000860086ff, %asi = 80
	lduha	[%i5+0x032]%asi,%l1	! %l1 = 0000000000000000
!	%l4 = 00000000000000ff, imm = 0000000000000e3d, %l6 = 00000000860ec60d
	subc	%l4,0xe3d,%l6		! %l6 = fffffffffffff2c2
!	Mem[0000000010001410] = 00000000, %l5 = 00000000000000ff
	lduba	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000000

p0_label_277:
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000ffff, Mem[0000000010041400] = ff000000
	stwa	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000ffff
!	%l7 = 000000000000ffff, Mem[0000000030001400] = 000000ff0000004a
	stxa	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000000000ffff
!	%l0 = 00ff000000000000, Mem[0000000030081410] = ff000000
	stba	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	%l5 = 0000000000000000, %l7 = 000000000000ffff, %l1  = 0000000000000000
	mulx	%l5,%l7,%l1		! %l1 = 0000000000000000
!	%f8  = 00000000 00000000, Mem[0000000030181410] = f38d205a 2fb7c6ac
	stda	%f8 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000 00000000
!	%f16 = ff0ec60d 7959e581, %l5 = 0000000000000000
!	Mem[00000000100c1410] = 00000000000000ff
	add	%i3,0x010,%g1
	stda	%f16,[%g1+%l5]ASI_PST8_PL ! Mem[00000000100c1410] = 00000000000000ff
!	Mem[0000000010081400] = 000000ff, %l0 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	%l2 = f56cffff, %l3 = 00000000, Mem[0000000030141408] = ff000000 04e669f8
	stda	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = f56cffff 00000000
!	%f0  = 0000f744 000000ff, %l2 = 00000000f56cffff
!	Mem[0000000010141408] = 00000000000000ff
	add	%i5,0x008,%g1
	stda	%f0,[%g1+%l2]ASI_PST32_P ! Mem[0000000010141408] = 0000f744000000ff
!	%l2 = 00000000f56cffff, %l4 = 00000000000000ff, %l1 = 0000000000000000
	sub	%l2,%l4,%l1		! %l1 = 00000000f56cff00

p0_label_278:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = f869e604, %f9  = 00000000
	lda	[%i1+%o4]0x80,%f9 	! %f9 = f869e604
!	Mem[0000000030041400] = ff0000007959e581, %f16 = ff0ec60d 7959e581
	ldda	[%i1+%g0]0x81,%f16	! %f16 = ff000000 7959e581
!	Mem[0000000010081410] = ffffa300, %l2 = 00000000f56cffff
	lduha	[%i2+%o5]0x88,%l2	! %l2 = 000000000000a300
!	Mem[0000000030141410] = 80000000 00000000, %l0 = 000000ff, %l1 = f56cff00
	ldda	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000 0000000080000000
!	Mem[0000000010141410] = 000000ff, %l5 = 0000000000000000
	lduba	[%i5+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041408] = f869e604, %l1 = 0000000080000000
	ldsba	[%i1+%o4]0x80,%l1	! %l1 = fffffffffffffff8
!	Mem[0000000010081418] = 00000006 00000000, %l2 = 0000a300, %l3 = 00000000
	ldd	[%i2+0x018],%l2		! %l2 = 0000000000000006 0000000000000000
!	Mem[0000000030081408] = 860086ff, %f10 = 80000000
	lda	[%i2+%o4]0x89,%f10	! %f10 = 860086ff
!	Mem[0000000030101408] = ff000000, %l1 = fffffffffffffff8
	ldsha	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181410] = 0dc60eff, %l1 = 0000000000000000
	lduha	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000eff

p0_label_279:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030041400] = 000000ff
	stwa	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
!	Mem[0000000010181400] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i6+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l6 = fffffffffffff2c2
	ldstuba	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141410] = ff000000, %l6 = 0000000000000000
	ldstuba	[%i5+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101410] = ff000000, %l4 = 00000000000000ff
	ldstuba	[%i4+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%f18 = ffffff7f 000000ff, Mem[0000000030001408] = 0000ff15 00000000
	stda	%f18,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffff7f 000000ff
!	%f24 = c000ffff, Mem[0000000010181408] = 0000ff00
	sta	%f24,[%i6+%o4]0x88	! Mem[0000000010181408] = c000ffff
!	%l1 = 0000000000000eff, Mem[0000000010081410] = ffffff86ffffa300
	stxa	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000000000000eff
!	Mem[0000000010101410] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	%l1 = 0000000000000eff, Mem[0000000030181400] = 00000000ffe2fb57
	stxa	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000000000eff

p0_label_280:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ffff0000, %l3 = 00000000000000ff
	lduba	[%i1+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101420] = 000000ff00000000, %l5 = 0000000000000000, %asi = 80
	ldxa	[%i4+0x020]%asi,%l5	! %l5 = 000000ff00000000
!	%l3 = 0000000000000000, imm = 0000000000000fa4, %l4 = 00000000000000ff
	xnor	%l3,0xfa4,%l4		! %l4 = fffffffffffff05b
!	Mem[0000000030141408] = ffff6cf5, %l2 = 0000000000000006
	lduha	[%i5+%o4]0x89,%l2	! %l2 = 0000000000006cf5
!	Mem[0000000030141400] = 00000000, %l4 = fffffffffffff05b
	lduwa	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141410] = 00000000000000ff, %f4  = 00000000 8712544c
	ldda	[%i5+%o5]0x88,%f4 	! %f4  = 00000000 000000ff
!	%f15 = ffe2fb57, %f28 = 00000000
	fcmps	%fcc0,%f15,%f28		! %fcc0 = 3
!	Mem[00000000300c1410] = ff000000, %l5 = 000000ff00000000
	ldswa	[%i3+%o5]0x81,%l5	! %l5 = ffffffffff000000
!	Mem[00000000300c1408] = 00000000 00000000, %l6 = 000000ff, %l7 = 0000ffff
	ldda	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010141400] = 0000ff15, %f15 = ffe2fb57
	lda	[%i5+%g0]0x80,%f15	! %f15 = 0000ff15

p0_label_281:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010181410] = 0dc60eff
	stwa	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	%l7 = 0000000000000000, Mem[0000000030041410] = 00000000ff000000
	stxa	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000000000000000
!	%l1 = 0000000000000eff, Mem[0000000010081410] = ff0e0000
	stwa	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000eff
!	Mem[00000000100c1410] = 00000000, %l5 = 00000000ff000000
	swapa	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c140e] = 57fbebff, %l6 = 0000000000000000
	ldstuba	[%i3+0x00e]%asi,%l6	! %l6 = 00000000000000eb
!	%f18 = ffffff7f, Mem[0000000030101408] = ff000000
	sta	%f18,[%i4+%o4]0x89	! Mem[0000000030101408] = ffffff7f
!	Mem[0000000010041400] = 0000ffff, %l7 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 000000000000ffff
!	%f0  = 0000f744 000000ff, %l6 = 00000000000000eb
!	Mem[0000000030141420] = 91c68d14164d9eff
	add	%i5,0x020,%g1
	stda	%f0,[%g1+%l6]ASI_PST16_S ! Mem[0000000030141420] = 00008d14000000ff
!	%l4 = 0000000000000000, Mem[0000000010041400] = 00000000
	stba	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	%f10 = 860086ff 4c541287, %l3 = 0000000000000000
!	Mem[0000000030141428] = b593a961f44b9bff
	add	%i5,0x028,%g1
	stda	%f10,[%g1+%l3]ASI_PST16_S ! Mem[0000000030141428] = b593a961f44b9bff

p0_label_282:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %l3 = 0000000000000000
	ldsba	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1400] = 81e55979ffff6cf5, %f10 = 860086ff 4c541287
	ldda	[%i3+%g0]0x88,%f10	! %f10 = 81e55979 ffff6cf5
!	Mem[0000000030041400] = 00000000, %f3  = ff0000ff
	lda	[%i1+%g0]0x89,%f3 	! %f3 = 00000000
!	Mem[0000000030081400] = ff000000ffffff87, %f14 = 00000000 0000ff15
	ldda	[%i2+%g0]0x89,%f14	! %f14 = ff000000 ffffff87
!	Mem[0000000030001400] = ffff0000 00000000, %l6 = 000000eb, %l7 = 0000ffff
	ldda	[%i0+%g0]0x89,%l6	! %l6 = 0000000000000000 00000000ffff0000
!	Mem[0000000030101410] = 000000ff, %l4 = 0000000000000000
	lduwa	[%i4+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181410] = 0000000000000000, %f12 = ff000000 0000ff00
	ldda	[%i6+%o5]0x88,%f12	! %f12 = 00000000 00000000
!	Mem[0000000030101400] = 000000ff, %l3 = 0000000000000000
	ldsha	[%i4+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181408] = 00000000, %l4 = 00000000000000ff
	ldsba	[%i6+%o4]0x89,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (47)
!	Mem[0000000030101400] = ff000000 00000000 7fffffff ff000000
!	Mem[0000000030101410] = ff000000 00ff15ff 00424bf4 e88c6fff
!	Mem[0000000030101420] = 860ec60d ff000000 e88c6f53 fe918a22
!	Mem[0000000030101430] = 00000000 000000ff 91a3ffff ff97045e
	ldda	[%i4+%g0]ASI_BLK_SL,%f0 	! Block Load from 0000000030101400

p0_label_283:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = ffff0000, Mem[0000000010181400] = ff000000 00000000
	stda	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 ffff0000
!	Mem[0000000010041410] = 00008dd8e23168d4, %l1 = 0000000000000eff, %l7 = 00000000ffff0000
	add	%i1,0x10,%g1
	casxa	[%g1]0x80,%l1,%l7	! %l7 = 00008dd8e23168d4
!	%f16 = ff000000, Mem[0000000010001408] = 00000000
	sta	%f16,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000000
!	%l3 = 00000000000000ff, Mem[0000000030181400] = 00000000
	stwa	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff
!	%l1 = 0000000000000eff, Mem[0000000010101436] = ffe2fb57
	stb	%l1,[%i4+0x036]		! Mem[0000000010101434] = ffe2ff57
!	%l7 = 00008dd8e23168d4, Mem[0000000010081400] = ff00000000000000
	stxa	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = 00008dd8e23168d4
!	%l0 = 00000000, %l1 = 00000eff, Mem[0000000030001410] = ff000000 ffffff87
	stda	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000 00000eff
!	%l0 = 0000000000000000, Mem[0000000010141410] = ff00000000000000
	stxa	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000000000000
!	Mem[00000000100c1420] = c000ffff, %l5 = 0000000000000000, %asi = 80
	swapa	[%i3+0x020]%asi,%l5	! %l5 = 00000000c000ffff
!	Mem[0000000030181410] = 00000000, %l7 = 00008dd8e23168d4
	ldstuba	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000000

p0_label_284:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000000, %l6 = 0000000000000000
	ldswa	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000201c0000] = 00018148, %l4 = 0000000000000000, %asi = 80
	lduba	[%o0+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l7 = 0000000000000000
	ldsba	[%i2+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001400] = ff00000044f70000, %l6 = 0000000000000000
	ldxa	[%i0+%g0]0x88,%l6	! %l6 = ff00000044f70000
!	Mem[0000000010141408] = 0000f744, %l0 = 0000000000000000
	lduha	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = 000000ff, %l7 = 0000000000000000
	ldsha	[%i6+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101408] = 000000000000ff00, %l7 = 00000000000000ff
	ldxa	[%i4+%o4]0x88,%l7	! %l7 = 000000000000ff00
!	Mem[0000000010141434] = 000000ff, %l2 = 0000000000006cf5
	lduh	[%i5+0x034],%l2		! %l2 = 0000000000000000
!	Mem[0000000010101432] = 00000000, %l1 = 0000000000000eff
	lduh	[%i4+0x032],%l1		! %l1 = 0000000000000000
!	%f7  = f44b4200, %f20 = 00000000
	fsqrts	%f7 ,%f20		! %f20 = 7fffffff

p0_label_285:
!	Starting 10 instruction Store Burst
!	%f16 = ff000000 7959e581, Mem[0000000010181428] = 52480000 00ff0000, %asi = 80
	stda	%f16,[%i6+0x028]%asi	! Mem[0000000010181428] = ff000000 7959e581
!	%l2 = 0000000000000000, Mem[0000000021800140] = ff0006f8
	sth	%l2,[%o3+0x140]		! Mem[0000000021800140] = 000006f8
!	%f10 = 228a91fe, Mem[0000000030001400] = 00000000
	sta	%f10,[%i0+%g0]0x81	! Mem[0000000030001400] = 228a91fe
!	Mem[00000000300c1410] = 000000ff, %l7 = 000000000000ff00
	swapa	[%i3+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	%l3 = 00000000000000ff, imm = fffffffffffffd48, %l3 = 00000000000000ff
	andn	%l3,-0x2b8,%l3		! %l3 = 00000000000000b7
!	%f0  = 00000000 000000ff, %l3 = 00000000000000b7
!	Mem[0000000030041438] = 5612ff4c38fac0ad
	add	%i1,0x038,%g1
	stda	%f0,[%g1+%l3]ASI_PST16_SL ! Mem[0000000030041438] = ff0000000000c0ad
!	%f10 = 228a91fe, %f23 = 00000000
	fsqrts	%f10,%f23		! %f23 = 31052e29
!	%l1 = 0000000000000000, Mem[0000000010181410] = 00000000
	stwa	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010101400] = ff0effff 860e0000
	stda	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000 00000000
!	Mem[0000000010141408] = 0000f744, %l2 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l2	! %l2 = 000000000000f744

p0_label_286:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00ff000000000000, %l4 = 0000000000000000
	ldxa	[%i4+%o4]0x80,%l4	! %l4 = 00ff000000000000
!	Mem[00000000300c1400] = ff000000000000ff, %l1 = 0000000000000000
	ldxa	[%i3+%g0]0x89,%l1	! %l1 = ff000000000000ff
!	%l4 = 00ff000000000000, %l7 = 00000000000000ff, %l0 = 0000000000000000
	orn	%l4,%l7,%l0		! %l0 = ffffffffffffff00
!	Mem[0000000030081400] = 87ffffff, %l3 = 00000000000000b7
	ldsba	[%i2+%g0]0x81,%l3	! %l3 = ffffffffffffff87
!	Mem[0000000010141408] = 00000000 000000ff, %l6 = 44f70000, %l7 = 000000ff
	ldda	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000 00000000000000ff
!	Mem[0000000030101410] = ff15ff00000000ff, %f18 = ffffff7f 000000ff
	ldda	[%i4+%o5]0x89,%f18	! %f18 = ff15ff00 000000ff
!	Mem[00000000211c0000] = ff00d1d8, %l6 = 0000000000000000, %asi = 80
	ldsha	[%o2+0x000]%asi,%l6	! %l6 = ffffffffffffff00
!	Mem[00000000100c1410] = 000000ff, %l2 = 000000000000f744
	lduha	[%i3+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041400] = 00000000, %l0 = ffffffffffffff00
	ldswa	[%i1+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101410] = ff000000000000ff, %l4 = 00ff000000000000
	ldxa	[%i4+%o5]0x80,%l4	! %l4 = ff000000000000ff

p0_label_287:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = ffff00c0, %l6 = 00000000ffffff00
	swapa	[%i6+%o4]0x80,%l6	! %l6 = 00000000ffff00c0
!	%f5  = 000000ff, Mem[0000000030141400] = 00000000
	sta	%f5 ,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff
!	Mem[00000000300c1408] = 00000000, %l0 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = ff000000, %l3 = ffffffffffffff87
	ldstuba	[%i6+%o5]0x81,%l3	! %l3 = 00000000000000ff
	membar	#Sync			! Added by membar checker (48)
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000030101410] = 000000ff ff15ff00
	stda	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000 000000ff
!	%l6 = 00000000ffff00c0, Mem[00000000201c0001] = 00018148
	stb	%l6,[%o0+0x001]		! Mem[00000000201c0000] = 00c08148
!	Mem[0000000010041410] = 00008dd8, %l6 = 00000000ffff00c0
	ldstuba	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081408] = ff860086, %l1 = ff000000000000ff
	ldstuba	[%i2+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	%l0 = 00000000, %l1 = 000000ff, Mem[00000000100c1410] = 000000ff ff000000
	stda	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000 000000ff
!	%l0 = 00000000, %l1 = 000000ff, Mem[00000000300c1400] = ff000000 000000ff
	stda	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000 000000ff

p0_label_288:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 0000000000000000, %f20 = 7fffffff 000000ff
	ldda	[%i1+%g0]0x80,%f20	! %f20 = 00000000 00000000
!	Mem[00000000300c1408] = 00000000, %l4 = ff000000000000ff
	lduwa	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l4 = 0000000000000000
	ldswa	[%i1+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001408] = 000000ff, %l4 = 0000000000000000
	lduba	[%i0+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1400] = 00000000, %l6 = 0000000000000000
	lduba	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000
!	%f11 = 536f8ce8, %f25 = 000000ff, %f30 = 000000ff
	fadds	%f11,%f25,%f30		! tt=0x22, %l0 = 0000000000000022
!	Mem[00000000100c1408] = ff8d0000, %l6 = 0000000000000000
	lduba	[%i3+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081400] = ffffff87, %l3 = 00000000000000ff
	lduwa	[%i2+%g0]0x89,%l3	! %l3 = 00000000ffffff87
!	Mem[0000000010001410] = 00000000, %l0 = 0000000000000022
	lduha	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Code Fragment 3, seed = 591203
p0_fragment_17:
!	%l0 = 0000000000000000
	setx	0x4eb946129441200e,%g7,%l0 ! %l0 = 4eb946129441200e
!	%l1 = 00000000000000ff
	setx	0x7f7dcc544f02efb9,%g7,%l1 ! %l1 = 7f7dcc544f02efb9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4eb946129441200e
	setx	0x9449ed918e154b74,%g7,%l0 ! %l0 = 9449ed918e154b74
!	%l1 = 7f7dcc544f02efb9
	setx	0x9ae30285d48fb63f,%g7,%l1 ! %l1 = 9ae30285d48fb63f
p0_fragment_17_end:

p0_label_289:
!	Starting 10 instruction Store Burst
!	%l0 = 9449ed918e154b74, Mem[00000000300c1410] = 00ff0000
	stha	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 4b740000
!	Mem[0000000030041410] = 00000000, %l0 = 000000008e154b74
	swapa	[%i1+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101408] = ffffff7f, %l7 = 00000000000000ff
	ldstuba	[%i4+%o4]0x89,%l7	! %l7 = 000000000000007f
!	Mem[0000000030141408] = ffff6cf5, %l0 = 0000000000000000
	swapa	[%i5+%o4]0x89,%l0	! %l0 = 00000000ffff6cf5
!	Mem[000000001018140f] = 000000ff, %l2 = 00000000000000ff
	ldstub	[%i6+0x00f],%l2		! %l2 = 00000000000000ff
!	Mem[000000001014143d] = 00000000, %l4 = 00000000000000ff
	ldstuba	[%i5+0x03d]%asi,%l4	! %l4 = 0000000000000000
!	%f30 = 000000ff, Mem[0000000030181400] = ff000000
	sta	%f30,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000ff
!	%l4 = 00000000, %l5 = c000ffff, Mem[0000000010001408] = 000000ff 0000004a
	stda	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000 c000ffff
!	%l0 = ffff6cf5, %l1 = d48fb63f, Mem[0000000010181418] = 00000000 00000000
	std	%l0,[%i6+0x018]		! Mem[0000000010181418] = ffff6cf5 d48fb63f
!	Mem[00000000300c1410] = 0000744b, %l2 = 00000000000000ff
	swapa	[%i3+%o5]0x89,%l2	! %l2 = 000000000000744b

p0_label_290:
!	Starting 10 instruction Load Burst
!	%f29 = ffffff00, %f28 = 00000000, %f28 = 00000000 ffffff00
	fsmuld	%f29,%f28,%f28		! %f28 = ffffffe0 00000000
!	Mem[0000000010041410] = ff008dd8e23168d4, %l5 = 00000000c000ffff, %asi = 80
	ldxa	[%i1+0x010]%asi,%l5	! %l5 = ff008dd8e23168d4
!	Mem[0000000010181400] = 0000ffff00000000, %l7 = 000000000000007f
	ldxa	[%i6+%g0]0x88,%l7	! %l7 = 0000ffff00000000
!	Mem[0000000010181410] = 00000000, %l2 = 000000000000744b
	ldsba	[%i6+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = ffffffffff000000, %f0  = 00000000 000000ff
	ldda	[%i4+%o4]0x81,%f0 	! %f0  = ffffffff ff000000
!	Mem[00000000100c1420] = 00000000000000ff, %l5 = ff008dd8e23168d4
	ldx	[%i3+0x020],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030101410] = 00000000, %l5 = 00000000000000ff
	lduwa	[%i4+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041410] = ff008dd8, %f10 = 228a91fe
	lda	[%i1+%o5]0x80,%f10	! %f10 = ff008dd8
!	Mem[0000000021800080] = 3bfffe68, %l5 = 0000000000000000
	lduh	[%o3+0x080],%l5		! %l5 = 0000000000003bff
!	Mem[0000000030141408] = 0000000000000000, %f8  = 000000ff 0dc60e86
	ldda	[%i5+%o4]0x89,%f8 	! %f8  = 00000000 00000000

p0_label_291:
!	Starting 10 instruction Store Burst
!	%f8  = 00000000 00000000, %l3 = 00000000ffffff87
!	Mem[0000000030141410] = 0000000000000080
	add	%i5,0x010,%g1
	stda	%f8,[%g1+%l3]ASI_PST32_S ! Mem[0000000030141410] = 0000000000000000
!	%l3 = 00000000ffffff87, Mem[0000000030041408] = ff000000ffe2fb57
	stxa	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000ffffff87
!	%f28 = ffffffe0 00000000, Mem[0000000010101408] = 00ff0000 00000000, %asi = 80
	stda	%f28,[%i4+0x008]%asi	! Mem[0000000010101408] = ffffffe0 00000000
!	%l2 = 00000000, %l3 = ffffff87, Mem[0000000030101408] = ffffffff 000000ff
	stda	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 ffffff87
!	Mem[0000000010081410] = 00000eff, %l1 = 00000000d48fb63f
	swapa	[%i2+%o5]0x80,%l1	! %l1 = 0000000000000eff
!	%l5 = 0000000000003bff, Mem[0000000030001410] = 00000000
	stba	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff
!	Mem[0000000030001410] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%l0 = 00000000ffff6cf5, Mem[0000000030001410] = 000000ff
	stwa	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = ffff6cf5
!	%l1 = 0000000000000eff, Mem[0000000010141410] = 00000000
	stha	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000eff
!	Mem[00000000211c0000] = ff00d1d8, %l1 = 0000000000000eff
	ldstuba	[%o2+0x000]%asi,%l1	! %l1 = 00000000000000ff

p0_label_292:
!	Starting 10 instruction Load Burst
!	Mem[000000001008140a] = 00000000, %l5 = 0000000000003bff
	ldsh	[%i2+0x00a],%l5		! %l5 = 0000000000000000
!	Mem[0000000010081410] = d48fb63f, %l1 = 00000000000000ff
	lduba	[%i2+%o5]0x80,%l1	! %l1 = 00000000000000d4
!	Mem[0000000030101410] = 00000000ff000000, %l0 = 00000000ffff6cf5
	ldxa	[%i4+%o5]0x81,%l0	! %l0 = 00000000ff000000
!	Mem[0000000010181410] = 00000000 00000000, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i6+%o5]0x80,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030181400] = ff000000, %l2 = 0000000000000000
	lduba	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l6 = 0000000000000000
	lduwa	[%i1+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101408] = ffffffe000000000, %f12 = ff000000 00000000
	ldda	[%i4+%o4]0x80,%f12	! %f12 = ffffffe0 00000000
!	Mem[0000000030041408] = 00000000, %f26 = 00ff0000
	lda	[%i1+%o4]0x89,%f26	! %f26 = 00000000
!	Mem[0000000030101410] = 00000000 ff000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000000 00000000ff000000
!	Mem[0000000010041400] = 00000000, %l4 = 0000000000000000
	ldsba	[%i1+%g0]0x88,%l4	! %l4 = 0000000000000000

p0_label_293:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000030101410] = 00000000
	stwa	%l7,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	Mem[00000000201c0001] = 00c08148, %l3 = 00000000ffffff87
	ldstub	[%o0+0x001],%l3		! %l3 = 00000000000000c0
!	%l6 = 0000000000000000, %l2 = 0000000000000000, %l4 = 0000000000000000
	xnor	%l6,%l2,%l4		! %l4 = ffffffffffffffff
!	%l0 = 00000000ff000000, Mem[0000000030181410] = 000000ff
	stha	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	Mem[0000000030141408] = 00000000, %l3 = 00000000000000c0
	swapa	[%i5+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l1 = 00000000000000d4
	swap	[%i3+%o5],%l1		! %l1 = 0000000000000000
!	%l4 = ffffffffffffffff, Mem[00000000100c1410] = 000000d4
	stwa	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffffffff
!	%f4  = ff15ff00 000000ff, %l4 = ffffffffffffffff
!	Mem[0000000010181428] = ff0000007959e581
	add	%i6,0x028,%g1
	stda	%f4,[%g1+%l4]ASI_PST32_P ! Mem[0000000010181428] = ff15ff00000000ff
!	%l1 = 0000000000000000, Mem[0000000030101400] = 000000ff
	stha	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	Mem[0000000010141402] = 0000ff15, %l0 = 00000000ff000000
	ldstuba	[%i5+0x002]%asi,%l0	! %l0 = 00000000000000ff

p0_label_294:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000, %l3 = 0000000000000000
	ldsha	[%i0+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081408] = ff860086, %l6 = 0000000000000000
	lduha	[%i2+%o4]0x81,%l6	! %l6 = 000000000000ff86
!	Mem[00000000100c1400] = f56cffff 7959e581, %l4 = ffffffff, %l5 = ff000000
	ldda	[%i3+%g0]0x80,%l4	! %l4 = 00000000f56cffff 000000007959e581
!	Mem[0000000030001400] = fe918a22, %l3 = 0000000000000000
	lduha	[%i0+%g0]0x89,%l3	! %l3 = 0000000000008a22
!	Mem[0000000010001410] = 00000000, %l4 = 00000000f56cffff
	ldsba	[%i0+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l2 = 0000000000000000
	ldsha	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000218001c0] = 0000a358, %l6 = 000000000000ff86, %asi = 80
	ldsha	[%o3+0x1c0]%asi,%l6	! %l6 = 0000000000000000
!	%l7 = 0000000000000000, immd = fffffffffffff471, %l108 = 0000000000000007
	sdivx	%l7,-0xb8f,%l7		! %l7 = 0000000000000000
!	Mem[0000000010141400] = 15ff0000, %l4 = 0000000000000000
	lduba	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041408] = 00000000 ffffff87, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i1+%o4]0x81,%l0	! %l0 = 0000000000000000 00000000ffffff87

p0_label_295:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 00ffffff, %l7 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%f12 = ffffffe0 00000000, %l1 = 00000000ffffff87
!	Mem[0000000010101408] = ffffffe000000000
	add	%i4,0x008,%g1
	stda	%f12,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010101408] = 000000e0000000ff
!	%f5  = 000000ff, %f22 = e23168d4
	fcmps	%fcc2,%f5 ,%f22		! %fcc2 = 2
!	%l1 = 00000000ffffff87, Mem[0000000010181410] = 00000000, %asi = 80
	stha	%l1,[%i6+0x010]%asi	! Mem[0000000010181410] = ff870000
!	%f28 = ffffffe0 00000000, Mem[0000000010001438] = 80788f42 421d1d32
	std	%f28,[%i0+0x038]	! Mem[0000000010001438] = ffffffe0 00000000
!	%l3 = 0000000000008a22, imm = fffffffffffff0ca, %l0 = 0000000000000000
	addc	%l3,-0xf36,%l0		! %l0 = 0000000000007aec
!	%l6 = 00000000, %l7 = 000000ff, Mem[00000000300c1408] = 00000000 00000000
	stda	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000 000000ff
!	Mem[0000000010081418] = 00000006, %l2 = 0000000000000000
	ldstub	[%i2+0x018],%l2		! %l2 = 0000000000000000
!	%l0 = 00007aec, %l1 = ffffff87, Mem[00000000100c1400] = ffff6cf5 81e55979
	stda	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00007aec ffffff87
!	%l6 = 0000000000000000, Mem[0000000020800040] = 00ff65a8
	stb	%l6,[%o1+0x040]		! Mem[0000000020800040] = 00ff65a8

p0_label_296:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ff8148, %l0 = 0000000000007aec, %asi = 80
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Code Fragment 3, seed = 219720
p0_fragment_18:
!	%l0 = 00000000000000ff
	setx	0xbccede6838b16de6,%g7,%l0 ! %l0 = bccede6838b16de6
!	%l1 = 00000000ffffff87
	setx	0x73c6e0e5c8f8b611,%g7,%l1 ! %l1 = 73c6e0e5c8f8b611
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = bccede6838b16de6
	setx	0xdb4f56696e61224c,%g7,%l0 ! %l0 = db4f56696e61224c
!	%l1 = 73c6e0e5c8f8b611
	setx	0xadbed99690feb597,%g7,%l1 ! %l1 = adbed99690feb597
p0_fragment_18_end:
!	Mem[0000000030181410] = 00000000, %l6 = 0000000000000000
	lduba	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[000000001018141c] = d48fb63f, %l3 = 0000000000008a22
	lduh	[%i6+0x01c],%l3		! %l3 = 000000000000d48f
!	Mem[00000000100c140c] = 57fbffff, %l2 = 0000000000000000, %asi = 80
	ldsha	[%i3+0x00c]%asi,%l2	! %l2 = 00000000000057fb
!	Mem[0000000010001410] = 00000000, %l2 = 00000000000057fb
	ldsha	[%i0+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l2 = 0000000000000000
	ldswa	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1410] = ffffffff, %l0 = db4f56696e61224c
	ldswa	[%i3+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1410] = 000000ffffffffff, %l5 = 000000007959e581
	ldxa	[%i3+%o5]0x88,%l5	! %l5 = 000000ffffffffff
!	%l1 = adbed99690feb597, immd = 0000000000000b5a, %l108 = 0000000000000005
	sdivx	%l1,0xb5a,%l5		! %l5 = fff8c0fff6b643e6

p0_label_297:
!	Starting 10 instruction Store Burst
!	%f7  = f44b4200, Mem[0000000010041408] = 04e669f8
	sta	%f7 ,[%i1+%o4]0x88	! Mem[0000000010041408] = f44b4200
!	%f6  = ff6f8ce8 f44b4200, Mem[0000000030041408] = 00000000 87ffffff
	stda	%f6 ,[%i1+%o4]0x89	! Mem[0000000030041408] = ff6f8ce8 f44b4200
!	%l3 = 000000000000d48f, Mem[0000000010001400] = 0000f744
	stba	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = 8f00f744
!	Mem[0000000010181420] = ff000000, %l2 = 0000000000000000
	swap	[%i6+0x020],%l2		! %l2 = 00000000ff000000
!	Mem[0000000010081400] = d46831e2, %l5 = 00000000f6b643e6
	swapa	[%i2+%g0]0x80,%l5	! %l5 = 00000000d46831e2
!	%l4 = 0000000000000000, Mem[0000000010141400] = 0000ff15ffffff87
	stxa	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000000000000000
!	Mem[00000000300c1410] = 000000ff, %l3 = 000000000000d48f
	ldstuba	[%i3+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1410] = 000000ff, %l4 = 0000000000000000
	swapa	[%i3+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	%f16 = ff000000 7959e581, %l0 = ffffffffffffffff
!	Mem[0000000030181418] = ffffff7f4a000000
	add	%i6,0x018,%g1
	stda	%f16,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030181418] = 81e55979000000ff
!	%f29 = 00000000, Mem[0000000030181408] = 00000000
	sta	%f29,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000

p0_label_298:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff000000, %l0 = ffffffffffffffff
	lduwa	[%i4+%o5]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[0000000010081400] = e643b6f6, %l6 = 0000000000000000
	ldsba	[%i2+%g0]0x88,%l6	! %l6 = fffffffffffffff6
!	Mem[000000001008140c] = 00000000, %l0 = 00000000ff000000
	ldsw	[%i2+0x00c],%l0		! %l0 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l6 = fffffffffffffff6
	lduha	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001410] = ffff6cf5, %l6 = 0000000000000000
	ldswa	[%i0+%o5]0x89,%l6	! %l6 = ffffffffffff6cf5
!	Mem[0000000010001410] = 00000000, %l2 = 00000000ff000000
	ldsha	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081410] = fffddd2d00000000, %f2  = 000000ff ffffff7f
	ldda	[%i2+%o5]0x89,%f2 	! %f2  = fffddd2d 00000000
!	Mem[0000000010081410] = 3fb68fd4, %f16 = ff000000
	lda	[%i2+%o5]0x88,%f16	! %f16 = 3fb68fd4
!	Mem[0000000020800000] = 0000f578, %l4 = 00000000000000ff, %asi = 80
	ldsha	[%o1+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101410] = 00000000 ff000000, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000000 00000000ff000000

p0_label_299:
!	Starting 10 instruction Store Burst
!	%l6 = ffff6cf5, %l7 = 000000ff, Mem[0000000010001410] = 00000000 ff000000
	stda	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = ffff6cf5 000000ff
!	Mem[0000000030181400] = ff000000, %l5 = 00000000d46831e2
	swapa	[%i6+%g0]0x89,%l5	! %l5 = 00000000ff000000
!	%l3 = 00000000ff000000, Mem[0000000010101408] = 000000e0
	stha	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000e0
!	Mem[0000000030001410] = f56cffff, %l4 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 00000000000000f5
!	%l5 = 00000000ff000000, Mem[0000000010041400] = 00000000
	stba	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	Mem[0000000010081408] = 00000000, %l4 = 00000000000000f5
	ldstuba	[%i2+%o4]0x80,%l4	! %l4 = 0000000000000000
!	%f18 = ff15ff00 000000ff, Mem[0000000010001400] = 8f00f744 000000ff
	stda	%f18,[%i0+%g0]0x80	! Mem[0000000010001400] = ff15ff00 000000ff
!	Mem[0000000030141410] = 00000000, %l1 = adbed99690feb597
	ldstuba	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%l1 = 0000000000000000, Mem[00000000300c1400] = 00000000000000ff
	stxa	%l1,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000000000000
!	Mem[0000000010141420] = 0000c69100000000, %l3 = 00000000ff000000, %l4 = 0000000000000000
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l3,%l4	! %l4 = 0000c69100000000

p0_label_300:
!	Starting 10 instruction Load Burst
!	Mem[00000000218000c0] = 775e5a98, %l2 = 0000000000000000, %asi = 80
	ldsha	[%o3+0x0c0]%asi,%l2	! %l2 = 000000000000775e
!	Mem[0000000010101400] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i4+%g0]0x80,%l7	! %l7 = 0000000000000000
!	%l4 = 0000c69100000000, imm = 0000000000000cde, %l6 = ffffffffffff6cf5
	subc	%l4,0xcde,%l6		! %l6 = 0000c690fffff322
!	Mem[00000000100c1438] = 000000ff, %l0 = 0000000000000000, %asi = 80
	ldsha	[%i3+0x038]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1408] = fffffb5700008dff, %l2 = 000000000000775e
	ldxa	[%i3+%o4]0x88,%l2	! %l2 = fffffb5700008dff
!	Mem[0000000010181424] = ffffffff, %l4 = 0000c69100000000, %asi = 80
	ldsba	[%i6+0x024]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[000000001000142a] = 00ff0000, %l0 = 0000000000000000, %asi = 80
	ldsha	[%i0+0x02a]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081410] = 000000002dddfdff, %l1 = 0000000000000000
	ldxa	[%i2+%o5]0x81,%l1	! %l1 = 000000002dddfdff
!	Mem[0000000010041400] = 0000000000000000, %l4 = ffffffffffffffff
	ldxa	[%i1+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %f15 = ffffa391
	lda	[%i1+%g0]0x80,%f15	! %f15 = 00000000

p0_label_301:
!	Starting 10 instruction Store Burst
!	%l3 = 00000000ff000000, Mem[0000000030041408] = 00424bf4
	stba	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 00424bf4
!	Mem[0000000030081408] = ff860086, %l0 = 0000000000000000
	swapa	[%i2+%o4]0x81,%l0	! %l0 = 00000000ff860086
!	%l4 = 0000000000000000, imm = fffffffffffff6e5, %l0 = 00000000ff860086
	or	%l4,-0x91b,%l0		! %l0 = fffffffffffff6e5
!	Mem[0000000021800140] = 000006f8, %l2 = fffffb5700008dff
	ldstub	[%o3+0x140],%l2		! %l2 = 0000000000000000
!	%l3 = 00000000ff000000, Mem[0000000010141428] = 8712544c, %asi = 80
	stwa	%l3,[%i5+0x028]%asi	! Mem[0000000010141428] = ff000000
!	%l7 = 0000000000000000, Mem[00000000218001c1] = 0000a358
	stb	%l7,[%o3+0x1c1]		! Mem[00000000218001c0] = 0000a358
!	%f0  = ffffffff ff000000, %l5 = 00000000ff000000
!	Mem[0000000030081400] = 87ffffff000000ff
	stda	%f0,[%i2+%l5]ASI_PST16_SL ! Mem[0000000030081400] = 87ffffff000000ff
!	Mem[0000000010141410] = 00000eff, %l4 = 0000000000000000
	ldstuba	[%i5+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c141c] = 00000088, %l2 = 0000000000000000
	swap	[%i3+0x01c],%l2		! %l2 = 0000000000000088
!	%l4 = 00000000000000ff, Mem[0000000030141400] = 00000080000000ff
	stxa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000000000ff

p0_label_302:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141424] = 00000000, %l3 = 00000000ff000000, %asi = 80
	ldsha	[%i5+0x024]%asi,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l4 = 00000000000000ff
	ldswa	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0001] = 00ff8148, %l4 = 0000000000000000
	ldsb	[%o0+0x001],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030141408] = c0000000, %l5 = 00000000ff000000
	ldswa	[%i5+%o4]0x89,%l5	! %l5 = ffffffffc0000000
!	Mem[0000000020800001] = 0000f578, %l4 = ffffffffffffffff, %asi = 80
	lduba	[%o1+0x001]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = ff000000ffffff87, %l4 = 0000000000000000
	ldxa	[%i2+%g0]0x89,%l4	! %l4 = ff000000ffffff87
!	Mem[0000000010041400] = 00000000 00000000, %l6 = fffff322, %l7 = 00000000
	ldda	[%i1+%g0]0x88,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030081410] = fffddd2d00000000, %f2  = fffddd2d 00000000
	ldda	[%i2+%o5]0x89,%f2 	! %f2  = fffddd2d 00000000
!	Mem[0000000010101410] = ff000000 000000ff, %l2 = 00000088, %l3 = 00000000
	ldda	[%i4+%o5]0x88,%l2	! %l2 = 00000000000000ff 00000000ff000000
!	Mem[0000000030141408] = 000000c0, %l2 = 00000000000000ff
	ldswa	[%i5+%o4]0x81,%l2	! %l2 = 00000000000000c0

p0_label_303:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041414] = e23168d4, %l7 = 0000000000000000
	ldstub	[%i1+0x014],%l7		! %l7 = 00000000000000e2
!	%f18 = ff15ff00, Mem[0000000030081408] = 00000000
	sta	%f18,[%i2+%o4]0x81	! Mem[0000000030081408] = ff15ff00
!	%l4 = ff000000ffffff87, Mem[0000000030101400] = 0000000000000000
	stxa	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = ff000000ffffff87
!	%l1 = 000000002dddfdff, Mem[0000000030081408] = ff15ff0000000006
	stxa	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000002dddfdff
!	%l6 = 00000000, %l7 = 000000e2, Mem[0000000010081408] = ff000000 00000000
	stda	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000 000000e2
!	%l4 = ffffff87, %l5 = c0000000, Mem[0000000010141428] = ff000000 000000ff, %asi = 80
	stda	%l4,[%i5+0x028]%asi	! Mem[0000000010141428] = ffffff87 c0000000
!	%l4 = ff000000ffffff87, Mem[0000000010181410] = ff87000000000000
	stxa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = ff000000ffffff87
!	Mem[0000000030101400] = ff000000, %l2 = 00000000000000c0
	swapa	[%i4+%g0]0x81,%l2	! %l2 = 00000000ff000000
!	%l5 = ffffffffc0000000, Mem[0000000030001400] = 228a91fe
	stha	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 000091fe
!	%l4 = ff000000ffffff87, Mem[0000000030041400] = 00000000
	stba	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000087

p0_label_304:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00000000 00000000, %l6 = 00000000, %l7 = 000000e2
	ldda	[%i5+%g0]0x80,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010141410] = ff0e0000, %l6 = 0000000000000000
	ldsba	[%i5+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181410] = ff000000, %f13 = 00000000
	lda	[%i6+%o5]0x80,%f13	! %f13 = ff000000
!	Mem[0000000030001400] = fe910000, %l4 = ff000000ffffff87
	lduba	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l5 = ffffffffc0000000
	lduwa	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181410] = 87ffffff 000000ff, %l6 = ffffffff, %l7 = 00000000
	ldda	[%i6+%o5]0x88,%l6	! %l6 = 00000000000000ff 0000000087ffffff
!	Mem[0000000010141418] = aba12f5b 00000000, %l2 = ff000000, %l3 = ff000000
	ldd	[%i5+0x018],%l2		! %l2 = 00000000aba12f5b 0000000000000000
!	Mem[0000000010041408] = f44b4200, %l5 = 0000000000000000
	lduba	[%i1+%o4]0x88,%l5	! %l5 = 0000000000000000
!	%l6 = 00000000000000ff, %l7 = 0000000087ffffff, %l4 = 0000000000000000
	sub	%l6,%l7,%l4		! %l4 = ffffffff78000100
!	Mem[0000000030081400] = ffffff87, %l2 = 00000000aba12f5b
	lduba	[%i2+%g0]0x89,%l2	! %l2 = 0000000000000087

p0_label_305:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 00000000, %l1 = 000000002dddfdff
	ldstuba	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = 0000000000000000, %l0 = fffffffffffff6e5, %l4 = ffffffff78000100
	casxa	[%i1]0x80,%l0,%l4	! %l4 = 0000000000000000
!	%f0  = ffffffff ff000000, Mem[00000000100c1410] = ffffffff ff000000
	std	%f0 ,[%i3+%o5]		! Mem[00000000100c1410] = ffffffff ff000000
!	Mem[00000000100c1410] = ffffffff, %l7 = 0000000087ffffff
	swap	[%i3+%o5],%l7		! %l7 = 00000000ffffffff
!	%f30 = 000000ff, %f23 = 31052e29, %f15 = 00000000
	fmuls	%f30,%f23,%f15		! %f15 = 00000000
!	%f2  = fffddd2d, Mem[0000000030001408] = ffffff7f
	sta	%f2 ,[%i0+%o4]0x81	! Mem[0000000030001408] = fffddd2d
!	Mem[0000000030101408] = 00000000, %l2 = 0000000000000087
	ldstuba	[%i4+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000211c0000] = ff00d1d8, %l6 = 00000000000000ff
	ldstub	[%o2+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010081400] = f6b643e6, %l2 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 00000000f6b643e6
!	%f6  = ff6f8ce8 f44b4200, Mem[0000000010041438] = 00000000 ffffff7f
	std	%f6 ,[%i1+0x038]	! Mem[0000000010041438] = ff6f8ce8 f44b4200

p0_label_306:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00000000, %l0 = fffffffffffff6e5
	ldsha	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %f12 = ffffffe0
	lda	[%i1+%g0]0x88,%f12	! %f12 = 00000000
!	Mem[0000000030041410] = 00000000 8e154b74, %l4 = 00000000, %l5 = 00000000
	ldda	[%i1+%o5]0x89,%l4	! %l4 = 000000008e154b74 0000000000000000
!	Mem[0000000010181410] = ff000000, %l2 = 00000000f6b643e6
	ldsba	[%i6+%o5]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030141408] = c0000000, %l7 = 00000000ffffffff
	lduwa	[%i5+%o4]0x89,%l7	! %l7 = 00000000c0000000
!	Mem[00000000100c1400] = 00007aec, %l0 = 0000000000000000
	lduwa	[%i3+%g0]0x88,%l0	! %l0 = 0000000000007aec
!	%l1 = 0000000000000000, %l7 = 00000000c0000000, %l6 = 00000000000000ff
	andn	%l1,%l7,%l6		! %l6 = 0000000000000000
!	Mem[0000000010101428] = 228a91fe536f8ce8, %f4  = ff15ff00 000000ff
	ldd	[%i4+0x028],%f4 	! %f4  = 228a91fe 536f8ce8
!	Mem[00000000201c0000] = 00ff8148, %l5 = 0000000000000000
	lduh	[%o0+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[00000000201c0000] = 00ff8148, %l2 = ffffffffffffffff
	ldsb	[%o0+%g0],%l2		! %l2 = 0000000000000000

p0_label_307:
!	Starting 10 instruction Store Burst
!	%l4 = 000000008e154b74, Mem[0000000030081408] = 00000000
	stha	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 4b740000
!	%l0 = 00007aec, %l1 = 00000000, Mem[00000000100c1408] = ff8d0000 57fbffff
	stda	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00007aec 00000000
!	Code Fragment 3, seed = 151946
p0_fragment_19:
!	%l0 = 0000000000007aec
	setx	0x4f274ab6c15e95d6,%g7,%l0 ! %l0 = 4f274ab6c15e95d6
!	%l1 = 0000000000000000
	setx	0xb064a51d57301b01,%g7,%l1 ! %l1 = b064a51d57301b01
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4f274ab6c15e95d6
	setx	0x1bffe6d18692343c,%g7,%l0 ! %l0 = 1bffe6d18692343c
!	%l1 = b064a51d57301b01
	setx	0x4720b18bd53de487,%g7,%l1 ! %l1 = 4720b18bd53de487
p0_fragment_19_end:
!	%f14 = 5e0497ff 00000000, Mem[0000000030041410] = 744b158e 00000000
	stda	%f14,[%i1+%o5]0x81	! Mem[0000000030041410] = 5e0497ff 00000000
!	%f22 = e23168d4 31052e29, %l5 = 00000000000000ff
!	Mem[0000000010101418] = ff6f8ce8f44b4200
	add	%i4,0x018,%g1
	stda	%f22,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010101418] = 292e0531d46831e2
!	%f17 = 7959e581, Mem[0000000010081418] = ff000006
	st	%f17,[%i2+0x018]	! Mem[0000000010081418] = 7959e581
!	%l4 = 000000008e154b74, Mem[0000000030041400] = 87000000
	stba	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 74000000
!	Mem[0000000030101408] = ff000000, %l6 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1408] = 00007aec, %l6 = 00000000000000ff
	ldstuba	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081410] = d48fb63f, %l3 = 0000000000000000
	swapa	[%i2+%o5]0x80,%l3	! %l3 = 00000000d48fb63f

p0_label_308:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00000000 00000000, %l6 = 00000000, %l7 = c0000000
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010041414] = ff3168d4, %l4 = 000000008e154b74
	ldsb	[%i1+0x014],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030041410] = ff97045e, %l2 = 0000000000000000
	lduha	[%i1+%o5]0x89,%l2	! %l2 = 000000000000045e
!	Mem[0000000010101410] = 000000ff, %l3 = 00000000d48fb63f
	ldswa	[%i4+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %l6 = 0000000000000000
	ldsba	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000020800000] = 0000f578, %l4 = ffffffffffffffff, %asi = 80
	ldsba	[%o1+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101400] = 000000c0ffffff87, %l6 = 0000000000000000
	ldxa	[%i4+%g0]0x81,%l6	! %l6 = 000000c0ffffff87
!	Mem[0000000030141410] = 000000ff, %l5 = 00000000000000ff
	ldsba	[%i5+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000201c0000] = 00ff8148, %l2 = 000000000000045e
	ldub	[%o0+%g0],%l2		! %l2 = 0000000000000000
!	Mem[00000000201c0000] = 00ff8148, %l1 = 4720b18bd53de487, %asi = 80
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 00000000000000ff

p0_label_309:
!	Starting 10 instruction Store Burst
!	%f0  = ffffffff, Mem[0000000010041408] = 00424bf4
	sta	%f0 ,[%i1+%o4]0x80	! Mem[0000000010041408] = ffffffff
!	%f2  = fffddd2d 00000000, %l0 = 1bffe6d18692343c
!	Mem[0000000030001408] = fffddd2d000000ff
	add	%i0,0x008,%g1
	stda	%f2,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030001408] = fffddd2d000000ff
!	Mem[0000000010041400] = 00000000, %l6 = 00000000ffffff87
	swapa	[%i1+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001400] = 000091fe, %l4 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l4	! %l4 = 00000000000091fe
!	%l1 = 00000000000000ff, Mem[0000000030141400] = ff000000
	stha	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = 00ff0000
!	Mem[0000000010041410] = ff008dd8, %l5 = ffffffffffffffff
	ldstuba	[%i1+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001400] = 00ff15ff, %l6 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l6	! %l6 = 0000000000ff15ff
!	Mem[00000000100c1410] = 87ffffff, %l0 = 000000008692343c, %asi = 80
	swapa	[%i3+0x010]%asi,%l0	! %l0 = 0000000087ffffff
!	%f14 = 5e0497ff, Mem[000000001018141c] = d48fb63f
	sta	%f14,[%i6+0x01c]%asi	! Mem[000000001018141c] = 5e0497ff
!	%l3 = 00000000000000ff, Mem[0000000030001410] = ff6cffff
	stba	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = ff6cffff

p0_label_310:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff0e0000ffff6cff, %f14 = 5e0497ff 00000000
	ldda	[%i0+%o5]0x89,%f14	! %f14 = ff0e0000 ffff6cff
!	Code Fragment 3, seed = 5737
p0_fragment_20:
!	%l0 = 0000000087ffffff
	setx	0x3f03d45730c67dde,%g7,%l0 ! %l0 = 3f03d45730c67dde
!	%l1 = 00000000000000ff
	setx	0x3b93d914b63a2489,%g7,%l1 ! %l1 = 3b93d914b63a2489
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3f03d45730c67dde
	setx	0xd711b3df0762a744,%g7,%l0 ! %l0 = d711b3df0762a744
!	%l1 = 3b93d914b63a2489
	setx	0xd3581fce1c66890f,%g7,%l1 ! %l1 = d3581fce1c66890f
p0_fragment_20_end:
!	Mem[0000000030041400] = 81e5597900000074, %f30 = 000000ff 7959e581
	ldda	[%i1+%g0]0x89,%f30	! %f30 = 81e55979 00000074
!	Mem[0000000030181400] = e23168d4, %l1 = d3581fce1c66890f
	ldswa	[%i6+%g0]0x81,%l1	! %l1 = ffffffffe23168d4
!	Mem[0000000010001430] = 00000000 000000ff, %l6 = 00ff15ff, %l7 = 00000000
	ldd	[%i0+0x030],%l6		! %l6 = 0000000000000000 00000000000000ff
!	%f8  = 00000000, %f14 = ff0e0000
	fcmpes	%fcc3,%f8 ,%f14		! %fcc3 = 2
!	Mem[0000000010141423] = 0000c691, %l5 = 00000000000000ff
	ldub	[%i5+0x023],%l5		! %l5 = 0000000000000091
!	Mem[0000000010001410] = ffff6cf5, %l2 = 0000000000000000
	lduba	[%i0+%o5]0x88,%l2	! %l2 = 00000000000000f5
!	Mem[00000000211c0000] = ff00d1d8, %l4 = 00000000000091fe, %asi = 80
	lduba	[%o2+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041410] = d88d00ff, %l4 = 00000000000000ff
	ldswa	[%i1+%o5]0x88,%l4	! %l4 = ffffffffd88d00ff

p0_label_311:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = f56cffff, %l6 = 0000000000000000
	swapa	[%i0+%o5]0x80,%l6	! %l6 = 00000000f56cffff
!	%l1 = ffffffffe23168d4, imm = 0000000000000f62, %l4 = ffffffffd88d00ff
	addc	%l1,0xf62,%l4		! %l4 = ffffffffe2317836
!	%l3 = 00000000000000ff, Mem[00000000100c1414] = ff000000
	stw	%l3,[%i3+0x014]		! Mem[00000000100c1414] = 000000ff
!	%l0 = d711b3df0762a744, %l3 = 00000000000000ff, %l7 = 00000000000000ff
	and	%l0,%l3,%l7		! %l7 = 0000000000000044
!	%l7 = 0000000000000044, Mem[0000000030081400] = ffffff87
	stha	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = ffff0044
!	Mem[00000000211c0000] = ff00d1d8, %l6 = 00000000f56cffff
	ldstub	[%o2+%g0],%l6		! %l6 = 00000000000000ff
!	%l7 = 0000000000000044, Mem[00000000100c141c] = 00000000
	stw	%l7,[%i3+0x01c]		! Mem[00000000100c141c] = 00000044
!	%l3 = 00000000000000ff, Mem[0000000030081408] = 0000744b
	stwa	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000ff
!	%l0 = d711b3df0762a744, Mem[000000001010142c] = 536f8ce8, %asi = 80
	stwa	%l0,[%i4+0x02c]%asi	! Mem[000000001010142c] = 0762a744
!	Mem[0000000010041424] = ffffa300, %l2 = 00000000000000f5, %asi = 80
	swapa	[%i1+0x024]%asi,%l2	! %l2 = 00000000ffffa300

p0_label_312:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff000000, %l4 = ffffffffe2317836
	lduwa	[%i4+%o5]0x80,%l4	! %l4 = 00000000ff000000
!	Mem[0000000030101408] = ff00000087ffffff, %l7 = 0000000000000044
	ldxa	[%i4+%o4]0x81,%l7	! %l7 = ff00000087ffffff
!	Mem[0000000030101400] = 000000c0, %l2 = 00000000ffffa300
	lduwa	[%i4+%g0]0x81,%l2	! %l2 = 00000000000000c0
!	%l0 = d711b3df0762a744, imm = fffffffffffff0f8, %l1 = ffffffffe23168d4
	add	%l0,-0xf08,%l1		! %l1 = d711b3df0762983c
!	Mem[00000000201c0000] = 00ff8148, %l7 = ff00000087ffffff, %asi = 80
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1410] = 3c349286, %l6 = 00000000000000ff
	lduwa	[%i3+%o5]0x88,%l6	! %l6 = 000000003c349286
!	Mem[0000000010141408] = 00000000 000000ff, %l0 = 0762a744, %l1 = 0762983c
	ldda	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000 00000000000000ff
!	Mem[0000000010041410] = d88d00ff, %l7 = 00000000000000ff
	lduha	[%i1+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[000000001010143f] = 00000000, %l1 = 00000000000000ff
	ldsb	[%i4+0x03f],%l1		! %l1 = 0000000000000000
!	Mem[0000000010141410] = ff0e0000, %l4 = 00000000ff000000
	ldswa	[%i5+%o5]0x80,%l4	! %l4 = ffffffffff0e0000

p0_label_313:
!	Starting 10 instruction Store Burst
!	%f10 = ff008dd8 536f8ce8, Mem[0000000030081410] = 000000ff fffddd2d
	stda	%f10,[%i2+%o5]0x89	! Mem[0000000030081410] = ff008dd8 536f8ce8
!	Mem[0000000010181400] = 00000000, %l2 = 00000000000000c0
	ldstuba	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010101410] = 000000ff ff000000
	stda	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000 000000ff
!	%l1 = 0000000000000000, Mem[0000000030181410] = 00000000
	stha	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	%l7 = 00000000000000ff, %l1 = 0000000000000000, %l6 = 000000003c349286
	sdivx	%l7,%l1,%l6		! Div by zero, %l0 = 0000000000000028
!	Mem[0000000030001410] = ffff6cff, %l2 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%f28 = ffffffe0 00000000, Mem[00000000100c1408] = ff007aec 00000000, %asi = 80
	stda	%f28,[%i3+0x008]%asi	! Mem[00000000100c1408] = ffffffe0 00000000
!	Mem[0000000030081410] = 536f8ce8, %l5 = 0000000000000091
	ldstuba	[%i2+%o5]0x89,%l5	! %l5 = 00000000000000e8
!	%f12 = 00000000, Mem[0000000030101408] = ff000000
	sta	%f12,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	%l4 = ff0e0000, %l5 = 000000e8, Mem[0000000010101410] = 00000000 ff000000
	stda	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = ff0e0000 000000e8

p0_label_314:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff00d1d8, %l3 = 00000000000000ff
	lduh	[%o2+%g0],%l3		! %l3 = 000000000000ff00
!	Mem[0000000010001408] = 00000000, %l4 = ffffffffff0e0000
	ldswa	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101408] = ffffff8700000000, %f30 = 81e55979 00000074
	ldda	[%i4+%o4]0x89,%f30	! %f30 = ffffff87 00000000
!	Mem[0000000010001410] = 00000000, %l5 = 00000000000000e8
	lduha	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001400] = ff00000000000000, %l5 = 0000000000000000
	ldxa	[%i0+%g0]0x88,%l5	! %l5 = ff00000000000000
!	Mem[0000000010041400] = ffffff87, %l4 = 0000000000000000
	ldsha	[%i1+%g0]0x88,%l4	! %l4 = ffffffffffffff87
!	Mem[0000000010101430] = 00000000 ffe2ff57, %l2 = 000000ff, %l3 = 0000ff00
	ldd	[%i4+0x030],%l2		! %l2 = 0000000000000000 00000000ffe2ff57
!	Mem[0000000030141410] = 000000ff, %l5 = ff00000000000000
	lduwa	[%i5+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081410] = ff8c6f53d88d00ff, %f20 = 00000000 00000000
	ldda	[%i2+%o5]0x81,%f20	! %f20 = ff8c6f53 d88d00ff
!	%f28 = ffffffe0, %f19 = 000000ff
	fcmpes	%fcc3,%f28,%f19		! %fcc3 = 3

p0_label_315:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = ff0e0000, %l3 = 00000000ffe2ff57
	swapa	[%i4+%o5]0x80,%l3	! %l3 = 00000000ff0e0000
!	Mem[0000000010041404] = 00000000, %l7 = 000000ff, %l4 = ffffff87
	add	%i1,0x04,%g1
	casa	[%g1]0x80,%l7,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081404] = d88d0000, %l1 = 0000000000000000
	ldstuba	[%i2+0x004]%asi,%l1	! %l1 = 00000000000000d8
!	%f24 = c000ffff, %f10 = ff008dd8, %f30 = ffffff87 00000000
	fsmuld	%f24,%f10,%f30		! %f30 = 47f031de 55dc8a00
!	%f2  = fffddd2d, Mem[00000000100c1430] = 00000000
	sta	%f2 ,[%i3+0x030]%asi	! Mem[00000000100c1430] = fffddd2d
!	%f10 = ff008dd8 536f8ce8, %l7 = 00000000000000ff
!	Mem[0000000030041400] = 740000007959e581
	stda	%f10,[%i1+%l7]ASI_PST8_S ! Mem[0000000030041400] = ff008dd8536f8ce8
!	%l0 = 0000000000000028, Mem[0000000030141410] = 000000ff
	stha	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000028
!	Mem[0000000010041400] = 87ffffff, %l1 = 00000000000000d8
	swapa	[%i1+%g0]0x80,%l1	! %l1 = 0000000087ffffff
!	%f18 = ff15ff00 000000ff, Mem[0000000010101400] = 00000000 00000000
	stda	%f18,[%i4+%g0]0x88	! Mem[0000000010101400] = ff15ff00 000000ff
!	%l6 = 3c349286, %l7 = 000000ff, Mem[0000000010101400] = ff000000 00ff15ff, %asi = 80
	stda	%l6,[%i4+0x000]%asi	! Mem[0000000010101400] = 3c349286 000000ff

p0_label_316:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff000000, %l7 = 00000000000000ff
	lduha	[%i6+%o5]0x80,%l7	! %l7 = 000000000000ff00
!	Mem[00000000300c1410] = 000000007ba57292, %f30 = 47f031de 55dc8a00
	ldda	[%i3+%o5]0x81,%f30	! %f30 = 00000000 7ba57292
!	Mem[0000000010101400] = 8692343c, %l6 = 000000003c349286
	lduha	[%i4+%g0]0x88,%l6	! %l6 = 000000000000343c
!	Mem[00000000211c0000] = ff00d1d8, %l7 = 000000000000ff00
	lduh	[%o2+%g0],%l7		! %l7 = 000000000000ff00
!	Mem[0000000030001400] = 00000000, %l4 = 0000000000000000
	lduwa	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141424] = 00000000, %l0 = 0000000000000028
	swap	[%i5+0x024],%l0		! %l0 = 0000000000000000
!	Mem[0000000030041400] = ff008dd8, %l1 = 0000000087ffffff
	ldswa	[%i1+%g0]0x81,%l1	! %l1 = ffffffffff008dd8
!	%f4  = 228a91fe, %f31 = 7ba57292, %f12 = 00000000
	fdivs	%f4 ,%f31,%f12		! %f12 = 00000000
!	Mem[0000000030041400] = e88c6f53d88d00ff, %f22 = e23168d4 31052e29
	ldda	[%i1+%g0]0x89,%f22	! %f22 = e88c6f53 d88d00ff
!	Mem[0000000030041400] = d88d00ff, %l2 = 0000000000000000
	lduwa	[%i1+%g0]0x89,%l2	! %l2 = 00000000d88d00ff

p0_label_317:
!	Starting 10 instruction Store Burst
!	%l6 = 0000343c, %l7 = 0000ff00, Mem[00000000300c1410] = 00000000 9272a57b
	stda	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000343c 0000ff00
!	Mem[0000000010141400] = 00000000, %l5 = 00000000000000ff
	swapa	[%i5+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l2 = 00000000d88d00ff
	ldstuba	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000021800080] = 3bfffe68
	sth	%l0,[%o3+0x080]		! Mem[0000000021800080] = 0000fe68
!	%l2 = 0000000000000000, %l3 = 00000000ff0e0000, %l6 = 000000000000343c
	sub	%l2,%l3,%l6		! %l6 = ffffffff00f20000
!	Mem[0000000030101410] = 00000000, %l6 = 0000000000f20000
	swapa	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = 2dddfdff, %l5 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l5	! %l5 = 000000002dddfdff
!	Mem[00000000211c0001] = ff00d1d8, %l7 = 000000000000ff00
	ldstub	[%o2+0x001],%l7		! %l7 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l6 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000000
!	%f28 = ffffffe0, Mem[0000000010141408] = 00000000
	sta	%f28,[%i5+%o4]0x80	! Mem[0000000010141408] = ffffffe0

p0_label_318:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = e0000000, %l0 = 0000000000000000
	lduha	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041410] = 5e0497ff, %l1 = ffffffffff008dd8
	ldsba	[%i1+%o5]0x81,%l1	! %l1 = 000000000000005e
!	Mem[0000000010041408] = ffffffff, %f8  = 00000000
	lda	[%i1+%o4]0x80,%f8 	! %f8 = ffffffff
!	Mem[0000000030101410] = 0000f200, %f27 = 000000ff
	lda	[%i4+%o5]0x81,%f27	! %f27 = 0000f200
!	Mem[0000000010001410] = 000000ff00000000, %l4 = 0000000000000000
	ldxa	[%i0+%o5]0x88,%l4	! %l4 = 000000ff00000000
!	Mem[00000000300c1408] = 00000000, %l7 = 0000000000000000
	ldswa	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l3 = 00000000ff0e0000
	ldswa	[%i4+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l3 = 0000000000000000
	lduba	[%i0+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = 000000ff, %l3 = 0000000000000000
	ldsha	[%i3+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%l6 = 0000000000000000, %l7 = 0000000000000000, %l3 = 00000000000000ff
	orn	%l6,%l7,%l3		! %l3 = ffffffffffffffff

p0_label_319:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 0000f200, %l2 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000000
!	%f6  = ff6f8ce8 f44b4200, Mem[0000000030081400] = 4400ffff 000000ff
	stda	%f6 ,[%i2+%g0]0x81	! Mem[0000000030081400] = ff6f8ce8 f44b4200
!	Mem[0000000010101414] = 000000e8, %l5 = 000000002dddfdff
	ldstuba	[%i4+0x014]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = 000000c0, %l3 = 00000000ffffffff
	swapa	[%i4+%g0]0x81,%l3	! %l3 = 00000000000000c0
!	%f3  = 00000000, Mem[0000000010001414] = ff000000
	st	%f3 ,[%i0+0x014]	! Mem[0000000010001414] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010101420] = 000000ff, %asi = 80
	stwa	%l6,[%i4+0x020]%asi	! Mem[0000000010101420] = 00000000
!	%f24 = c000ffff 000000ff, %f18 = ff15ff00
	fxtos	%f24,%f18		! %f18 = de7ffc00
!	Mem[0000000030081400] = ff6f8ce8, %l2 = 0000000000000000
	lduba	[%i2+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[00000000300c1408] = 00000000
	stba	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	Mem[0000000010141400] = ff000000, %l3 = 00000000000000c0
	swapa	[%i5+%g0]0x88,%l3	! %l3 = 00000000ff000000

p0_label_320:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181418] = ffff6cf5, %l5 = 0000000000000000
	ldsw	[%i6+0x018],%l5		! %l5 = ffffffffffff6cf5
!	Mem[0000000010181408] = 00ffffff, %l0 = 0000000000000000
	lduba	[%i6+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000020800040] = 00ff65a8, %l3 = 00000000ff000000
	ldsb	[%o1+0x040],%l3		! %l3 = 0000000000000000
!	Mem[00000000201c0000] = 00ff8148, %l6 = 0000000000000000, %asi = 80
	lduba	[%o0+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1400] = 00007aec, %l1 = 000000000000005e
	ldsha	[%i3+%g0]0x88,%l1	! %l1 = 0000000000007aec
!	Mem[0000000030181408] = 0000000000000000, %f26 = 00000000 0000f200
	ldda	[%i6+%o4]0x89,%f26	! %f26 = 00000000 00000000
!	Mem[0000000020800000] = 0000f578, %l0 = 00000000000000ff
	ldsh	[%o1+%g0],%l0		! %l0 = 0000000000000000
!	Mem[0000000010181410] = ff000000ffffff87, %f24 = c000ffff 000000ff
	ldda	[%i6+%o5]0x80,%f24	! %f24 = ff000000 ffffff87
!	Mem[0000000010041408] = ffffffff, %f26 = 00000000
	lda	[%i1+%o4]0x88,%f26	! %f26 = ffffffff
!	Mem[0000000030001408] = 00000000, %l5 = ffffffffffff6cf5
	ldswa	[%i0+%o4]0x81,%l5	! %l5 = 0000000000000000

p0_label_321:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000030001410] = ffff6cff
	stba	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = ffff6c00
!	Mem[0000000030041410] = ff97045e, %l5 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l5	! %l5 = 00000000ff97045e
!	%l6 = 0000000000000000, Mem[0000000010101408] = 000000e0000000ff
	stxa	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000000000000000
!	%l2 = 00000000000000ff, Mem[0000000010181400] = ff000000ffff0000
	stxa	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000030041400] = ff008dd8
	stba	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = 00008dd8
!	%l7 = 0000000000000000, Mem[0000000010101410] = ffe2ff57
	stwa	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	Mem[0000000010101410] = 00000000, %l1 = 0000000000007aec
	swapa	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%f20 = ff8c6f53 d88d00ff, Mem[0000000010101410] = ec7a0000 e80000ff
	stda	%f20,[%i4+%o5]0x88	! Mem[0000000010101410] = ff8c6f53 d88d00ff
!	%f24 = ff000000 ffffff87, Mem[0000000030081408] = 000000ff fffddd2d
	stda	%f24,[%i2+%o4]0x89	! Mem[0000000030081408] = ff000000 ffffff87
!	%f13 = ff000000, Mem[0000000010101400] = 3c349286
	sta	%f13,[%i4+%g0]0x80	! Mem[0000000010101400] = ff000000

p0_label_322:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff000000 000000ff, %l6 = 00000000, %l7 = 00000000
	ldda	[%i4+%g0]0x88,%l6	! %l6 = 00000000000000ff 00000000ff000000
!	Mem[0000000010181408] = ffffff00, %l3 = 0000000000000000
	ldsba	[%i6+%o4]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010141408] = e0ffffff, %f17 = 7959e581
	lda	[%i5+%o4]0x88,%f17	! %f17 = e0ffffff
!	Mem[0000000030001400] = 000000000000ffff, %f0  = ffffffff ff000000
	ldda	[%i0+%g0]0x81,%f0 	! %f0  = 00000000 0000ffff
!	Mem[0000000030001408] = 00000000, %l3 = ffffffffffffffff
	ldsba	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141408] = 000000c000000000, %f28 = ffffffe0 00000000
	ldda	[%i5+%o4]0x81,%f28	! %f28 = 000000c0 00000000
!	Code Fragment 3, seed = 243384
p0_fragment_21:
!	%l0 = 0000000000000000
	setx	0x2e29332507e5fa66,%g7,%l0 ! %l0 = 2e29332507e5fa66
!	%l1 = 0000000000000000
	setx	0xf43d74a0f6619a91,%g7,%l1 ! %l1 = f43d74a0f6619a91
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2e29332507e5fa66
	setx	0xa4589ed7fcaedecc,%g7,%l0 ! %l0 = a4589ed7fcaedecc
!	%l1 = f43d74a0f6619a91
	setx	0xd88144982df9ca17,%g7,%l1 ! %l1 = d88144982df9ca17
p0_fragment_21_end:
!	Mem[0000000030001408] = 00000000, %l4 = 000000ff00000000
	lduwa	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001410] = 006cffff, %l4 = 0000000000000000
	lduba	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000211c0000] = ffffd1d8, %l2 = 00000000000000ff
	ldstub	[%o2+%g0],%l2		! %l2 = 00000000000000ff

p0_label_323:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 0000343c, %l5 = 00000000ff97045e
	ldstuba	[%i3+%o5]0x89,%l5	! %l5 = 000000000000003c
!	Mem[0000000030101400] = ffffffff, %l6 = 00000000000000ff
	ldstuba	[%i4+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010101432] = 00000000, %asi = 80
	stha	%l4,[%i4+0x032]%asi	! Mem[0000000010101430] = 00000000
!	%l7 = 00000000ff000000, Mem[0000000010181400] = 00000000000000ff
	stxa	%l7,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000ff000000
!	%l2 = 00000000000000ff, Mem[0000000010041410] = ff008dd8
	stba	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = ff008dd8
!	%f10 = ff008dd8 536f8ce8, Mem[00000000100c1408] = e0ffffff 00000000
	stda	%f10,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff008dd8 536f8ce8
!	%l0 = a4589ed7fcaedecc, Mem[0000000010101438] = 5e0497ff00000000, %asi = 80
	stxa	%l0,[%i4+0x038]%asi	! Mem[0000000010101438] = a4589ed7fcaedecc
!	%l4 = 0000000000000000, Mem[0000000010081410] = 00000000
	stba	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000
!	%l4 = 0000000000000000, Mem[0000000010101402] = ff000000, %asi = 80
	stha	%l4,[%i4+0x002]%asi	! Mem[0000000010101400] = ff000000
!	%l2 = 00000000000000ff, Mem[0000000030181400] = e23168d400000eff
	stxa	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000000000ff

p0_label_324:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00000000, %l3 = 0000000000000000
	ldsba	[%i4+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181439] = 00000000, %l7 = 00000000ff000000
	ldub	[%i6+0x039],%l7		! %l7 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l5 = 000000000000003c
	ldsba	[%i1+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l7 = 0000000000000000
	lduha	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141400] = 000000000000ff00, %f8  = ffffffff 00000000
	ldda	[%i5+%g0]0x89,%f8 	! %f8  = 00000000 0000ff00
!	Mem[0000000010141410] = ff0e0000, %l1 = d88144982df9ca17
	ldsha	[%i5+%o5]0x80,%l1	! %l1 = ffffffffffffff0e
!	Mem[0000000030081400] = ff6f8ce8, %l5 = 0000000000000000
	ldsha	[%i2+%g0]0x81,%l5	! %l5 = ffffffffffffff6f
!	Mem[0000000030181410] = 00000000 00000000, %l0 = fcaedecc, %l1 = ffffff0e
	ldda	[%i6+%o5]0x89,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[000000001004143c] = f44b4200, %f19 = 000000ff
	lda	[%i1+0x03c]%asi,%f19	! %f19 = f44b4200
!	Mem[0000000010101410] = d88d00ff, %l5 = ffffffffffffff6f
	ldswa	[%i4+%o5]0x88,%l5	! %l5 = ffffffffd88d00ff

p0_label_325:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = d88d00ff, Mem[0000000010181408] = ffffff00 000000ff
	stda	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 d88d00ff
!	Mem[000000001014142a] = ffffff87, %l6 = 00000000000000ff
	ldstub	[%i5+0x02a],%l6		! %l6 = 00000000000000ff
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000030081400] = ff6f8ce8 f44b4200
	stda	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000 00000000
!	Mem[0000000010001408] = 00000000, %l5 = ffffffffd88d00ff
	ldstuba	[%i0+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081410] = ff8c6f53, %l7 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041407] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i1+0x007]%asi,%l4	! %l4 = 0000000000000000
!	%l6 = 00000000000000ff, Mem[00000000218000c0] = 775e5a98
	sth	%l6,[%o3+0x0c0]		! Mem[00000000218000c0] = 00ff5a98
!	Mem[000000001000140c] = ffff00c0, %l0 = 0000000000000000
	swap	[%i0+0x00c],%l0		! %l0 = 00000000ffff00c0
!	Mem[0000000010001410] = 00000000, %l0 = 00000000ffff00c0
	swapa	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000000
!	%l6 = 00000000000000ff, Mem[0000000010101400] = ff000000000000ff
	stxa	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000000000ff

p0_label_326:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 00ff0000, %l3 = 0000000000000000
	ldswa	[%i5+%g0]0x81,%l3	! %l3 = 0000000000ff0000
!	Mem[0000000030081410] = ff8c6f53d88d00ff, %f2  = fffddd2d 00000000
	ldda	[%i2+%o5]0x81,%f2 	! %f2  = ff8c6f53 d88d00ff
!	Mem[0000000030181408] = 0000000000000000, %f18 = de7ffc00 f44b4200
	ldda	[%i6+%o4]0x81,%f18	! %f18 = 00000000 00000000
!	%l3 = 0000000000ff0000, %l0 = 0000000000000000, %l4 = 0000000000000000
	xor	%l3,%l0,%l4		! %l4 = 0000000000ff0000
!	Mem[0000000010041408] = ffffffff, %l5 = 0000000000000000
	lduwa	[%i1+%o4]0x80,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000030041400] = e88c6f53 d88d0000, %l2 = 000000ff, %l3 = 00ff0000
	ldda	[%i1+%g0]0x89,%l2	! %l2 = 00000000d88d0000 00000000e88c6f53
!	%l5 = 00000000ffffffff, Mem[0000000030041410] = 00000000
	stba	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = ff000000
!	Mem[0000000010081410] = 00000000, %l3 = 00000000e88c6f53
	ldsba	[%i2+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[000000001018142e] = 000000ff, %l7 = 00000000000000ff, %asi = 80
	lduha	[%i6+0x02e]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081400] = 00000000, %l2 = 00000000d88d0000
	lduwa	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000000

p0_label_327:
!	Starting 10 instruction Store Burst
!	%l4 = 00ff0000, %l5 = ffffffff, Mem[0000000030001400] = 00000000 ffff0000
	stda	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 00ff0000 ffffffff
!	Mem[0000000010081400] = 00000000, %l4 = 0000000000ff0000
	swapa	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[000000001000141a] = 00000000, %l4 = 0000000000000000
	ldstub	[%i0+0x01a],%l4		! %l4 = 0000000000000000
!	Mem[00000000201c0000] = 00ff8148, %l4 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010141402] = c0000000
	sth	%l2,[%i5+0x002]		! Mem[0000000010141400] = c0000000
!	%l4 = 0000000000000000, Mem[0000000010041408] = ffffffff
	stwa	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	Mem[0000000010001410] = c000ffff, %l5 = 00000000ffffffff
	ldstuba	[%i0+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000030141400] = 0000ff00
	stwa	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff
!	%l1 = 0000000000000000, Mem[0000000010041438] = ff6f8ce8
	stw	%l1,[%i1+0x038]		! Mem[0000000010041438] = 00000000
!	%l7 = 00000000000000ff, Mem[00000000201c0000] = ffff8148, %asi = 80
	stha	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ff8148

p0_label_328:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101418] = 292e0531, %f9  = 0000ff00
	lda	[%i4+0x018]%asi,%f9 	! %f9 = 292e0531
!	Mem[0000000030001408] = 00000000, %l0 = 0000000000000000
	ldsba	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041410] = ff00000000000000, %f2  = ff8c6f53 d88d00ff
	ldda	[%i1+%o5]0x81,%f2 	! %f2  = ff000000 00000000
!	Mem[0000000010101400] = 00000000, %l3 = 0000000000000000
	lduha	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = 000000ff, %f9  = 292e0531
	lda	[%i0+%o4]0x88,%f9 	! %f9 = 000000ff
!	Mem[0000000010001400] = 00000000, %l2 = 0000000000000000
	ldswa	[%i0+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = c000000000000000, %l7 = 00000000000000ff
	ldxa	[%i5+%g0]0x80,%l7	! %l7 = c000000000000000
!	Mem[0000000010101420] = 00000000, %f19 = 00000000
	ld	[%i4+0x020],%f19	! %f19 = 00000000
!	Mem[0000000010081410] = 0000000000000000, %l7 = c000000000000000
	ldxa	[%i2+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101408] = 00000000 00000000, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i4+%o4]0x80,%l4	! %l4 = 0000000000000000 0000000000000000

p0_label_329:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010041410] = ff008dd8 ff3168d4
	stda	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000 00000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030101408] = 00000000 ffffff87
	stda	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 00000000
!	Mem[0000000010101400] = 00000000, %l0 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%l1 = 0000000000000000, Mem[000000001004143c] = f44b4200, %asi = 80
	stwa	%l1,[%i1+0x03c]%asi	! Mem[000000001004143c] = 00000000
!	Mem[0000000010141400] = c0000000, %l2 = 0000000000000000
	ldstuba	[%i5+%g0]0x80,%l2	! %l2 = 00000000000000c0
!	%l2 = 00000000000000c0, immd = 0000000000000f38, %l108 = 0000000000000007
	udivx	%l2,0xf38,%l7		! %l7 = 0000000000000000
!	%l6 = 00000000000000ff, Mem[0000000030081408] = 87ffffff000000ff
	stxa	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000000000ff
!	%l2 = 00000000000000c0, Mem[0000000010081410] = 0000000000000000
	stx	%l2,[%i2+%o5]		! Mem[0000000010081410] = 00000000000000c0
!	%f4  = 228a91fe, %f5  = 536f8ce8
	fitos	%f4 ,%f5 		! %f5  = 4e0a2a48
!	%f10 = ff008dd8 536f8ce8, %l4 = 0000000000000000
!	Mem[0000000010141428] = ffffff87c0000000
	add	%i5,0x028,%g1
	stda	%f10,[%g1+%l4]ASI_PST8_P ! Mem[0000000010141428] = ffffff87c0000000

p0_label_330:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ff00000000000000, %l5 = 0000000000000000
	ldxa	[%i2+%o4]0x89,%l5	! %l5 = ff00000000000000
!	Mem[0000000010181410] = 000000ff, %l4 = 0000000000000000
	lduha	[%i6+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041408] = 00000000, %f31 = 7ba57292
	lda	[%i1+%o4]0x80,%f31	! %f31 = 00000000
!	%l0 = 0000000000000000, %l0 = 0000000000000000, %y  = f085db31
	udiv	%l0,%l0,%l7		! Div by zero, %l0 = 0000000000000028
!	Mem[0000000010141410] = 00000eff, %f18 = 00000000
	lda	[%i5+%o5]0x88,%f18	! %f18 = 00000eff
!	Mem[0000000030181410] = 00000000, %f10 = ff008dd8
	lda	[%i6+%o5]0x89,%f10	! %f10 = 00000000
!	Mem[0000000030041408] = 00424bf4, %l2 = 00000000000000c0
	lduba	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101410] = ff008dd8, %f12 = 00000000
	lda	[%i4+%o5]0x80,%f12	! %f12 = ff008dd8
!	Mem[00000000300c1400] = 000000ff, %l7 = 0000000000000000
	ldswa	[%i3+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001408] = ff000000, %l2 = 0000000000000000
	ldsha	[%i0+%o4]0x80,%l2	! %l2 = ffffffffffffff00

p0_label_331:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 3c349286, %l5 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l5	! %l5 = 000000003c349286
!	Mem[0000000010101408] = 00000000, %l2 = 00000000ffffff00
	swapa	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000000
!	%l1 = 0000000000000000, Mem[00000000100c1408] = e88c6f53
	stwa	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	%l7 = 00000000000000ff, Mem[0000000030041408] = 00424bf4
	stha	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = 00ff4bf4
!	%f28 = 000000c0, %f16 = 3fb68fd4
	fsqrts	%f28,%f16		! tt=0x22, %l0 = 000000000000004a
!	Mem[0000000010101428] = 228a91fe0762a744, %l6 = 00000000000000ff, %l2 = 0000000000000000
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l6,%l2	! %l2 = 228a91fe0762a744
!	Mem[0000000010101410] = ff008dd8, %l1 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%f29 = 00000000, Mem[0000000030001400] = 00ff0000
	sta	%f29,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	%l4 = 00000000000000ff, Mem[0000000030141408] = c0000000
	stba	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = c00000ff
!	%f22 = e88c6f53, %f10 = 00000000, %f5  = 4e0a2a48
	fdivs	%f22,%f10,%f5 		! %f5  = ff800000

p0_label_332:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00000000000000ff, %f16 = 3fb68fd4 e0ffffff
	ldda	[%i6+%g0]0x81,%f16	! %f16 = 00000000 000000ff
!	Mem[00000000100c1400] = 00007aec, %f26 = ffffffff
	lda	[%i3+%g0]0x88,%f26	! %f26 = 00007aec
!	%l7 = 00000000000000ff, imm = 0000000000000b63, %l5 = 000000003c349286
	or	%l7,0xb63,%l5		! %l5 = 0000000000000bff
!	Mem[0000000010041430] = ff00000000000000, %l4 = 00000000000000ff
	ldx	[%i1+0x030],%l4		! %l4 = ff00000000000000
!	Mem[0000000010141408] = ffffffe0000000ff, %l6 = 00000000000000ff
	ldxa	[%i5+%o4]0x80,%l6	! %l6 = ffffffe0000000ff
!	Mem[0000000010181404] = ff000000, %f29 = 00000000
	lda	[%i6+0x004]%asi,%f29	! %f29 = ff000000
!	%f24 = ff000000, %f4  = 228a91fe, %f24 = ff000000
	fadds	%f24,%f4 ,%f24		! %f24 = ff000000
!	%f26 = 00007aec, %f16 = 00000000 000000ff
	fitod	%f26,%f16		! %f16 = 40debb00 00000000
!	Mem[0000000030081410] = ff8c6f53, %l7 = 00000000000000ff
	ldsha	[%i2+%o5]0x81,%l7	! %l7 = ffffffffffffff8c
!	Mem[00000000300c1410] = ff340000, %f15 = ffff6cff
	lda	[%i3+%o5]0x81,%f15	! %f15 = ff340000

p0_label_333:
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffff8c, Mem[0000000010081400] = 0000ff00
	stha	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = ff8cff00
!	%l2 = 0762a744, %l3 = 00000000, Mem[0000000010141400] = ff000000 00000000
	stda	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 0762a744 00000000
!	%f7  = f44b4200, Mem[00000000100c1408] = 00000000
	sta	%f7 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = f44b4200
!	Mem[0000000030041400] = 00008dd8, %l7 = 00000000ffffff8c
	swapa	[%i1+%g0]0x81,%l7	! %l7 = 0000000000008dd8
!	%l0 = 0000004a, %l1 = 000000ff, Mem[0000000010001410] = c000ffff 00000000
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000004a 000000ff
!	%f6  = ff6f8ce8 f44b4200, Mem[0000000010101410] = ff008dd8 536f8cff
	stda	%f6 ,[%i4+%o5]0x80	! Mem[0000000010101410] = ff6f8ce8 f44b4200
!	Mem[0000000010141410] = 00000eff, %l3 = 0000000000000000
	ldstuba	[%i5+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[0000000010041410] = 00000000
	stha	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 00ff0000
!	%f24 = ff000000, %f10 = 00000000, %f28 = 000000c0
	fsubs	%f24,%f10,%f28		! %f28 = ff000000
!	Mem[0000000010101408] = ffffff00, %l3 = 00000000000000ff
	lduha	[%i4+%o4]0x88,%l3	! %l3 = 000000000000ff00

p0_label_334:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ffffffe0, %l5 = 0000000000000bff
	ldswa	[%i5+%o4]0x80,%l5	! %l5 = ffffffffffffffe0
!	Mem[0000000010181410] = ff000000, %l0 = 000000000000004a
	ldswa	[%i6+%o5]0x80,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010181410] = 000000ff, %l6 = ffffffe0000000ff
	ldsha	[%i6+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181408] = 00000000, %l1 = 00000000000000ff
	lduwa	[%i6+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000021800180] = ffff5728, %l7 = 0000000000008dd8, %asi = 80
	lduha	[%o3+0x180]%asi,%l7	! %l7 = 000000000000ffff
!	Mem[00000000300c1410] = 0000ff00000034ff, %l6 = 00000000000000ff
	ldxa	[%i3+%o5]0x89,%l6	! %l6 = 0000ff00000034ff
!	Mem[0000000030001400] = 00000000, %l1 = 0000000000000000
	lduha	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[000000001014141c] = 00000000, %f31 = 00000000
	lda	[%i5+0x01c]%asi,%f31	! %f31 = 00000000
!	%f7  = f44b4200, %f3  = 00000000, %f18 = 00000eff
	fdivs	%f7 ,%f3 ,%f18		! %f18 = ff800000
!	Mem[0000000030101400] = ffffffff, %l5 = ffffffffffffffe0
	lduba	[%i4+%g0]0x89,%l5	! %l5 = 00000000000000ff

p0_label_335:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = ff000000, %l5 = 00000000000000ff
	swapa	[%i1+%o5]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[00000000100c1410] = 00000000, %l3 = 000000000000ff00
	swapa	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%l0 = ffffffffff000000, Mem[0000000030141408] = ff0000c0
	stwa	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = ff000000
!	%f22 = e88c6f53 d88d00ff, %l3 = 0000000000000000
!	Mem[0000000010001410] = 4a000000ff000000
	add	%i0,0x010,%g1
	stda	%f22,[%g1+%l3]ASI_PST32_P ! Mem[0000000010001410] = 4a000000ff000000
!	%l7 = 000000000000ffff, Mem[0000000030181410] = 00000000
	stba	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = ff000000
!	%l4 = ff00000000000000, immd = fffff3ad, %y  = f085db31
	udiv	%l4,-0xc53,%l7		! %l7 = 00000000f085e6c5
	mov	%l0,%y			! %y = ff000000
!	Mem[0000000010181408] = 00000000, %l6 = 000034ff, %l6 = 000034ff
	add	%i6,0x08,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000030001400] = 00000000
	stba	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	Mem[0000000010141418] = aba12f5b, %l2 = 000000000762a744, %asi = 80
	swapa	[%i5+0x018]%asi,%l2	! %l2 = 00000000aba12f5b
!	%f28 = ff000000, %f7  = f44b4200
	fcmps	%fcc3,%f28,%f7 		! %fcc3 = 1

p0_label_336:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00000000, %l1 = 0000000000000000
	lduba	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081430] = ff15ff00, %f7  = f44b4200
	lda	[%i2+0x030]%asi,%f7 	! %f7 = ff15ff00
!	Mem[0000000010101408] = 00ffffff, %l2 = 00000000aba12f5b
	lduwa	[%i4+%o4]0x80,%l2	! %l2 = 0000000000ffffff
!	Mem[0000000010081410] = c000000000000000, %l7 = 00000000f085e6c5
	ldxa	[%i2+%o5]0x88,%l7	! %l7 = c000000000000000
!	Mem[0000000030001408] = 00000000000000ff, %l3 = 0000000000000000
	ldxa	[%i0+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001410] = 0000004a, %l1 = 0000000000000000
	lduwa	[%i0+%o5]0x88,%l1	! %l1 = 000000000000004a
!	Mem[000000001004142c] = 0000ffff, %l5 = 00000000ff000000
	ldsh	[%i1+0x02c],%l5		! %l5 = 0000000000000000
!	Mem[0000000010101410] = ff6f8ce8f44b4200, %f12 = ff008dd8 ff000000
	ldda	[%i4+%o5]0x80,%f12	! %f12 = ff6f8ce8 f44b4200
!	Mem[0000000010041404] = 000000ff, %f29 = ff000000
	ld	[%i1+0x004],%f29	! %f29 = 000000ff
!	Mem[0000000030141410] = 00000028, %l4 = ff00000000000000
	lduwa	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000028

p0_label_337:
!	Starting 10 instruction Store Burst
!	%l7 = c000000000000000, Mem[0000000030141400] = 000000ff
	stba	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	%l2 = 0000000000ffffff, Mem[00000000100c140e] = d88d00ff, %asi = 80
	stha	%l2,[%i3+0x00e]%asi	! Mem[00000000100c140c] = d88dffff
!	%f2  = ff000000, Mem[0000000010141424] = 00000028
	st	%f2 ,[%i5+0x024]	! Mem[0000000010141424] = ff000000
!	%l4 = 0000000000000028, Mem[0000000010081400] = 00ff8cff
	stha	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = 00ff0028
!	%l2 = 0000000000ffffff, Mem[0000000010081410] = 00000000
	stwa	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 00ffffff
!	%f8  = 00000000 000000ff, Mem[0000000010081400] = 2800ff00 ff8d0000
	stda	%f8 ,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000 000000ff
!	%l6 = 0000000000000000, Mem[0000000030181400] = 00000000
	stba	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	%l1 = 000000000000004a, Mem[0000000030181408] = 00000000
	stha	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000004a
!	%l6 = 0000000000000000, Mem[0000000010101410] = e88c6fff
	stha	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = e88c0000
!	Mem[0000000010181400] = 00000000, %l5 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l5	! %l5 = 0000000000000000

p0_label_338:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 0762a744, %l0 = ffffffffff000000
	ldsha	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000762
!	Mem[0000000030181408] = 4a000000 00000000, %l2 = 00ffffff, %l3 = 000000ff
	ldda	[%i6+%o4]0x81,%l2	! %l2 = 000000004a000000 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l2 = 000000004a000000
	ldsba	[%i3+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %f20 = ff8c6f53
	lda	[%i6+%g0]0x81,%f20	! %f20 = 00000000
!	Mem[0000000010041410] = 00ff0000, %l2 = 0000000000000000
	ldsba	[%i1+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081410] = 536f8cff, %l0 = 0000000000000762
	ldsba	[%i2+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010041408] = 00000000, %l1 = 000000000000004a
	lduba	[%i1+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041408] = 000000007ba57292, %l1 = 0000000000000000
	ldxa	[%i1+%o4]0x80,%l1	! %l1 = 000000007ba57292
!	%l2 = 0000000000000000, %l6 = 0000000000000000, %l6 = 0000000000000000
	sdivx	%l2,%l6,%l6		! Div by zero, %l0 = 0000000000000027
!	%f20 = 00000000, %f13 = f44b4200, %f28 = ff000000 000000ff
	fsmuld	%f20,%f13,%f28		! %f28 = 80000000 00000000

p0_label_339:
!	Starting 10 instruction Store Burst
!	%f29 = 00000000, %f18 = ff800000, %f24 = ff000000
	fsubs	%f29,%f18,%f24		! %f24 = 7f800000
!	%l3 = 0000000000000000, Mem[0000000010101430] = 00000000, %asi = 80
	stwa	%l3,[%i4+0x030]%asi	! Mem[0000000010101430] = 00000000
!	%l3 = 0000000000000000, %l5 = 0000000000000000, %l0 = 0000000000000027
	subc	%l3,%l5,%l0		! %l0 = 0000000000000000
!	Mem[00000000218001c1] = 0000a358, %l1 = 000000007ba57292
	ldstub	[%o3+0x1c1],%l1		! %l1 = 0000000000000000
!	%l7 = c000000000000000, Mem[0000000030081410] = ff8c6f53
	stba	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 008c6f53
!	Mem[00000000100c1400] = ec7a0000 87ffffff f44b4200 d88dffff
!	%f0  = 00000000 0000ffff ff000000 00000000
!	%f4  = 228a91fe ff800000 ff6f8ce8 ff15ff00
!	%f8  = 00000000 000000ff 00000000 536f8ce8
!	%f12 = ff6f8ce8 f44b4200 ff0e0000 ff340000
	stda	%f0 ,[%i3+%g0]ASI_COMMIT_P	! Block Store to 00000000100c1400
!	%f8  = 00000000, Mem[0000000030101410] = 00f200ff
	sta	%f8 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	%l4 = 00000028, %l5 = 00000000, Mem[0000000030181400] = 00000000 000000ff
	stda	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000028 00000000
!	Mem[0000000030181408] = 0000004a, %l0 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l0	! %l0 = 000000000000004a
!	%l0 = 0000004a, %l1 = 00000000, Mem[0000000010101408] = 00ffffff 00000000
	stda	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000004a 00000000

p0_label_340:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 28000000, %l3 = 0000000000000000
	ldsha	[%i5+%o5]0x81,%l3	! %l3 = 0000000000002800
!	Mem[0000000030001408] = 00000000, %l0 = 000000000000004a
	ldsba	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1400] = 000000ff, %l0 = 0000000000000000
	lduwa	[%i3+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %l4 = 0000000000000028
	ldsba	[%i6+%g0]0x80,%l4	! %l4 = 0000000000000000
!	%f27 = 00000000, %f0  = 00000000, %f27 = 00000000
	fsubs	%f27,%f0 ,%f27		! %f27 = 00000000
!	Mem[0000000010141408] = ffffffe0000000ff, %l4 = 0000000000000000
	ldxa	[%i5+%o4]0x80,%l4	! %l4 = ffffffe0000000ff
!	Mem[0000000010041400] = d8000000, %l0 = 00000000000000ff
	ldsha	[%i1+%g0]0x88,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (49)
!	Mem[00000000100c1408] = ff000000, %l2 = 0000000000000000
	lduba	[%i3+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1434] = f44b4200, %l5 = 0000000000000000
	ldub	[%i3+0x034],%l5		! %l5 = 00000000000000f4
!	Mem[0000000030001408] = 00000000, %f16 = 40debb00
	lda	[%i0+%o4]0x81,%f16	! %f16 = 00000000

p0_label_341:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, %l1 = 0000000000000000, %l0 = 0000000000000000
	andn	%l0,%l1,%l0		! %l0 = 0000000000000000
!	%f20 = 00000000 d88d00ff, %l3 = 0000000000002800
!	Mem[0000000010141400] = 0762a74400000000
	stda	%f20,[%i5+%l3]ASI_PST8_PL ! Mem[0000000010141400] = 0762a74400000000
!	%f30 = 00000000 00000000, Mem[00000000100c1400] = 00000000 ffff0000
	stda	%f30,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 00000000
!	Mem[0000000030141408] = ff000000, %l4 = ffffffe0000000ff
	ldstuba	[%i5+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	%f24 = 7f800000 ffffff87, Mem[00000000300c1410] = ff340000 00ff0000
	stda	%f24,[%i3+%o5]0x81	! Mem[00000000300c1410] = 7f800000 ffffff87
!	%l1 = 0000000000000000, Mem[000000001010140a] = 0000004a, %asi = 80
	stha	%l1,[%i4+0x00a]%asi	! Mem[0000000010101408] = 00000000
!	%f21 = d88d00ff, Mem[0000000010041410] = 0000ff00
	sta	%f21,[%i1+%o5]0x88	! Mem[0000000010041410] = d88d00ff
!	%l0 = 0000000000000000, Mem[0000000030141408] = 00000000000000ff
	stxa	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000000000000000
!	%f20 = 00000000, Mem[0000000010141410] = ff0e0000
	sta	%f20,[%i5+0x010]%asi	! Mem[0000000010141410] = 00000000
!	Mem[0000000010001430] = 00000000, %l7 = 00000000, %l7 = 00000000
	add	%i0,0x30,%g1
	casa	[%g1]0x80,%l7,%l7	! %l7 = 0000000000000000

p0_label_342:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 28000000, %l3 = 0000000000002800
	lduha	[%i5+%o5]0x81,%l3	! %l3 = 0000000000002800
!	Mem[0000000010101410] = 00008ce8, %f2  = ff000000
	lda	[%i4+%o5]0x80,%f2 	! %f2 = 00008ce8
!	Mem[00000000300c1410] = 7f800000, %l5 = 00000000000000f4
	lduha	[%i3+%o5]0x81,%l5	! %l5 = 0000000000007f80
!	Mem[0000000010141410] = 00000000, %l0 = 0000000000000000
	lduha	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %f20 = 00000000
	lda	[%i4+%o4]0x88,%f20	! %f20 = 00000000
!	%f27 = 00000000, %f3  = 00000000, %f16 = 00000000
	fdivs	%f27,%f3 ,%f16		! %f16 = 7fffffff
!	Mem[0000000030101408] = 00000000, %l3 = 0000000000002800
	lduha	[%i4+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = ff00000000000000, %l0 = 0000000000000000
	ldxa	[%i0+%o4]0x80,%l0	! %l0 = ff00000000000000
!	Mem[0000000010081400] = 00000000000000ff, %f10 = 00000000 536f8ce8
	ldda	[%i2+%g0]0x80,%f10	! %f10 = 00000000 000000ff
!	Mem[00000000218000c0] = 00ff5a98, %l1 = 0000000000000000
	ldsb	[%o3+0x0c0],%l1		! %l1 = 0000000000000000

p0_label_343:
!	Starting 10 instruction Store Burst
!	%f3  = 00000000, Mem[00000000100c1408] = ff000000
	sta	%f3 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	%l0 = ff00000000000000, Mem[000000001000143c] = 00000000, %asi = 80
	stwa	%l0,[%i0+0x03c]%asi	! Mem[000000001000143c] = 00000000
!	Mem[0000000010041408] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010101420] = 00000000, %asi = 80
	stwa	%l6,[%i4+0x020]%asi	! Mem[0000000010101420] = 00000000
!	%l1 = 0000000000000000, Mem[000000001010141c] = d46831e2
	stw	%l1,[%i4+0x01c]		! Mem[000000001010141c] = 00000000
!	%f8  = 00000000 000000ff, %l5 = 0000000000007f80
!	Mem[0000000010001400] = 00000000000000ff
	stda	%f8,[%i0+%l5]ASI_PST32_P ! Mem[0000000010001400] = 00000000000000ff
!	Mem[0000000030001408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000201c0000] = 00ff8148, %l4 = 00000000000000ff
	ldstub	[%o0+%g0],%l4		! %l4 = 0000000000000000
!	Mem[0000000010141408] = ffffffe0, %l7 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[00000000211c0001] = ffffd1d8
	stb	%l7,[%o2+0x001]		! Mem[00000000211c0000] = ffffd1d8

p0_label_344:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff8148, %l7 = 00000000000000ff, %asi = 80
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101432] = 00000000, %l7 = ffffffffffffffff, %asi = 80
	ldsha	[%i4+0x032]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = 00000000, %l3 = 0000000000000000
	ldsba	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1410] = fe918a22, %l0 = ff00000000000000
	lduwa	[%i3+%o5]0x88,%l0	! %l0 = 00000000fe918a22
!	Mem[0000000030141400] = 00000000, %l6 = 0000000000000000
	ldsba	[%i5+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = 00000000 00000000, %l0 = fe918a22, %l1 = 00000000
	ldda	[%i4+%o4]0x89,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010101400] = 00000000, %f23 = d88d00ff
	lda	[%i4+%g0]0x80,%f23	! %f23 = 00000000
!	Mem[0000000030181410] = ff00000000000000, %l6 = 0000000000000000
	ldxa	[%i6+%o5]0x81,%l6	! %l6 = ff00000000000000
!	Mem[0000000010101410] = 00008ce8, %l1 = 0000000000000000
	ldsha	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101400] = ffffffff, %f16 = 7fffffff
	lda	[%i4+%g0]0x89,%f16	! %f16 = ffffffff

p0_label_345:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 00000000 00000000 00000000 00000000
!	%f16 = ffffffff 00000000 ff800000 00000000
!	%f20 = 00000000 d88d00ff e88c6f53 00000000
!	%f24 = 7f800000 ffffff87 00007aec 00000000
!	%f28 = 80000000 00000000 00000000 00000000
	stda	%f16,[%i5+%g0]ASI_BLK_S	! Block Store to 0000000030141400
!	Mem[0000000030181400] = 00000028 00000000 00000000 00000000
!	%f0  = 00000000 0000ffff 00008ce8 00000000
!	%f4  = 228a91fe ff800000 ff6f8ce8 ff15ff00
!	%f8  = 00000000 000000ff 00000000 000000ff
!	%f12 = ff6f8ce8 f44b4200 ff0e0000 ff340000
	stda	%f0 ,[%i6+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030181400
!	%l3 = 0000000000000000, Mem[00000000300c1408] = 00000000
	stha	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	Mem[0000000030001408] = 000000ff, %l3 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[0000000030041408] = f44bff00
	stba	%l3,[%i1+%o4]0x89	! Mem[0000000030041408] = f44bffff
!	Mem[00000000201c0000] = ffff8148, %l1 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[00000000201c0001] = ffff8148, %l5 = 0000000000007f80
	ldstub	[%o0+0x001],%l5		! %l5 = 00000000000000ff
	membar	#Sync			! Added by membar checker (50)
!	Mem[0000000030141408] = 000080ff, %l0 = 0000000000000000
	swapa	[%i5+%o4]0x89,%l0	! %l0 = 00000000000080ff
!	%f12 = ff6f8ce8 f44b4200, Mem[0000000030141400] = ffffffff 00000000
	stda	%f12,[%i5+%g0]0x89	! Mem[0000000030141400] = ff6f8ce8 f44b4200
!	Mem[0000000030141410] = 00000000, %l1 = 00000000000000ff
	swapa	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000000

p0_label_346:
!	Starting 10 instruction Load Burst
!	%l7 = 0000000000000000, imm = 0000000000000bfd, %l0 = 00000000000080ff
	or	%l7,0xbfd,%l0		! %l0 = 0000000000000bfd
!	Mem[0000000010101418] = 292e053100000000, %f16 = ffffffff 00000000, %asi = 80
	ldda	[%i4+0x018]%asi,%f16	! %f16 = 292e0531 00000000
!	Mem[0000000010141408] = ffffffe0000000ff, %l4 = 0000000000000000
	ldxa	[%i5+%o4]0x80,%l4	! %l4 = ffffffe0000000ff
!	Mem[0000000030001408] = 00000000, %l6 = ff00000000000000
	ldswa	[%i0+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = ffffffff, %l7 = 0000000000000000
	ldswa	[%i4+%g0]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181410] = ff000000, %l7 = ffffffffffffffff
	ldsba	[%i6+%o5]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010141410] = 00000000, %l3 = 00000000000000ff
	ldsba	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[000000001018141c] = 5e0497ff, %f9  = 000000ff
	ld	[%i6+0x01c],%f9 	! %f9 = 5e0497ff
!	Mem[0000000010041408] = ff0000007ba57292, %l4 = ffffffe0000000ff
	ldxa	[%i1+%o4]0x80,%l4	! %l4 = ff0000007ba57292
!	Mem[0000000010101410] = 00008ce8, %l1 = 0000000000000000
	lduba	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000

p0_label_347:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = ffff0000, %l7 = 00000000ffffffff
	swapa	[%i6+%g0]0x81,%l7	! %l7 = 00000000ffff0000
!	Mem[0000000030081410] = 008c6f53, %l7 = 00000000ffff0000
	swapa	[%i2+%o5]0x81,%l7	! %l7 = 00000000008c6f53
!	%f18 = ff800000 00000000, Mem[0000000030181400] = ffffffff 00000000
	stda	%f18,[%i6+%g0]0x89	! Mem[0000000030181400] = ff800000 00000000
!	%l1 = 0000000000000000, Mem[0000000010101408] = 00000000
	stwa	%l1,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	%l0 = 0000000000000bfd, Mem[0000000030101410] = 00000000
	stha	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 0bfd0000
!	%l0 = 00000bfd, %l1 = 00000000, Mem[0000000010181408] = 00000000 d88d00ff
	std	%l0,[%i6+%o4]		! Mem[0000000010181408] = 00000bfd 00000000
!	%f5  = ff800000, Mem[0000000030101410] = 0000fd0b
	sta	%f5 ,[%i4+%o5]0x89	! Mem[0000000030101410] = ff800000
!	Mem[0000000010181439] = 00000000, %l3 = 0000000000000000
	ldstub	[%i6+0x039],%l3		! %l3 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010081410] = 00ffffff000000c0, %asi = 80
	stxa	%l3,[%i2+0x010]%asi	! Mem[0000000010081410] = 0000000000000000
!	%l7 = 00000000008c6f53, Mem[00000000211c0001] = ffffd1d8, %asi = 80
	stba	%l7,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff53d1d8

p0_label_348:
!	Starting 10 instruction Load Burst
!	%f11 = 000000ff, %f14 = ff0e0000
	fcmpes	%fcc2,%f11,%f14		! %fcc2 = 2
!	Mem[0000000010141410] = 00000000 00000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000030001410] = 006cffff00000eff, %l2 = 0000000000000000
	ldxa	[%i0+%o5]0x81,%l2	! %l2 = 006cffff00000eff
!	Mem[0000000030041410] = ff000000, %l0 = 0000000000000bfd
	ldsha	[%i1+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101410] = 00008ce8f44b4200, %l2 = 006cffff00000eff
	ldxa	[%i4+%o5]0x80,%l2	! %l2 = 00008ce8f44b4200
!	Mem[0000000010141408] = ffffffe0, %l1 = 0000000000000000
	ldsha	[%i5+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000100c1432] = ff6f8ce8, %l1 = ffffffffffffffff
	lduh	[%i3+0x032],%l1		! %l1 = 0000000000008ce8
!	Mem[0000000030081410] = ff008dd80000ffff, %l3 = 0000000000000000
	ldxa	[%i2+%o5]0x89,%l3	! %l3 = ff008dd80000ffff
!	Mem[0000000030081400] = 00000000, %l0 = 0000000000000000
	lduha	[%i2+%g0]0x81,%l0	! %l0 = 0000000000000000
!	%l2 = 00008ce8f44b4200, imm = 0000000000000d2e, %l2 = 00008ce8f44b4200
	xnor	%l2,0xd2e,%l2		! %l2 = ffff73170bb4b0d1

p0_label_349:
!	Starting 10 instruction Store Burst
!	%l2 = 0bb4b0d1, %l3 = 0000ffff, Mem[0000000010181400] = 00000000 ff000000, %asi = 80
	stda	%l2,[%i6+0x000]%asi	! Mem[0000000010181400] = 0bb4b0d1 0000ffff
!	Mem[0000000030141410] = ff000000, %l7 = 00000000008c6f53
	swapa	[%i5+%o5]0x89,%l7	! %l7 = 00000000ff000000
!	Mem[0000000030181408] = 00000000, %l2 = ffff73170bb4b0d1
	ldstuba	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000000
!	%l7 = 00000000ff000000, Mem[0000000030001408] = 00000000
	stha	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	%l3 = ff008dd80000ffff, imm = 0000000000000d9a, %l2 = 0000000000000000
	orn	%l3,0xd9a,%l2		! %l2 = ffffffffffffffff
!	Mem[0000000030141410] = 008c6f53, %l5 = 00000000000000ff
	ldstuba	[%i5+%o5]0x89,%l5	! %l5 = 0000000000000053
!	Mem[0000000010081408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i2+%o4]0x88,%l6	! %l6 = 0000000000000000
!	%f3  = 00000000, %f13 = f44b4200, %f23 = 00000000
	fdivs	%f3 ,%f13,%f23		! %f23 = 80000000
!	Mem[0000000020800001] = 0000f578, %l6 = 0000000000000000
	ldstub	[%o1+0x001],%l6		! %l6 = 0000000000000000
!	Mem[0000000010181410] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l6	! %l6 = 00000000000000ff

p0_label_350:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 8cffffff, %l0 = 0000000000000000
	ldswa	[%i1+%g0]0x89,%l0	! %l0 = ffffffff8cffffff
!	Mem[0000000010001408] = 00000000000000ff, %l1 = 0000000000008ce8
	ldxa	[%i0+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%l0 = ffffffff8cffffff, imm = fffffffffffff69c, %l0 = ffffffff8cffffff
	add	%l0,-0x964,%l0		! %l0 = ffffffff8cfff69b
!	Mem[0000000010001410] = 0000004a, %l2 = ffffffffffffffff
	lduba	[%i0+%o5]0x88,%l2	! %l2 = 000000000000004a
!	Mem[0000000010081418] = 7959e581, %l6 = 00000000000000ff, %asi = 80
	ldsha	[%i2+0x018]%asi,%l6	! %l6 = 0000000000007959
!	Mem[0000000030081408] = 00000000, %f30 = 00000000
	lda	[%i2+%o4]0x89,%f30	! %f30 = 00000000
!	Mem[0000000010001410] = 000000ff0000004a, %l7 = 00000000ff000000
	ldxa	[%i0+%o5]0x88,%l7	! %l7 = 000000ff0000004a
!	Mem[0000000020800040] = 00ff65a8, %l3 = ff008dd80000ffff
	ldsb	[%o1+0x040],%l3		! %l3 = 0000000000000000
!	Mem[0000000030001400] = ffffffff00000000, %l6 = 0000000000007959
	ldxa	[%i0+%g0]0x89,%l6	! %l6 = ffffffff00000000
!	Mem[0000000030141410] = 008c6fff, %l2 = 000000000000004a
	lduha	[%i5+%o5]0x89,%l2	! %l2 = 0000000000006fff

p0_label_351:
!	Starting 10 instruction Store Burst
!	%f1  = 0000ffff, Mem[0000000010101408] = 00000000
	sta	%f1 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000ffff
!	%l7 = 000000ff0000004a, Mem[0000000010081408] = ff000000000000e2
	stxa	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000ff0000004a
!	Mem[0000000010041408] = ff000000, %l1 = 00000000000000ff
	ldstuba	[%i1+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001400] = 00000000, %l0 = 000000008cfff69b
	swapa	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l2 = 0000000000006fff
	ldstuba	[%i6+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181410] = ff800000, %l3 = 0000000000000000
	swapa	[%i6+%o5]0x89,%l3	! %l3 = 00000000ff800000
!	%f4  = 228a91fe ff800000, Mem[0000000030141410] = ff6f8c00 d88d00ff
	stda	%f4 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 228a91fe ff800000
!	%l2 = 0000000000000000, Mem[0000000030081400] = 00000000
	stha	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	Mem[00000000100c1408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l2	! %l2 = 0000000000000000

p0_label_352:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00008ce8000000ff, %f18 = ff800000 00000000
	ldda	[%i6+%o4]0x89,%f18	! %f18 = 00008ce8 000000ff
!	Mem[00000000100c141c] = ff15ff00, %l7 = 000000ff0000004a
	ldsw	[%i3+0x01c],%l7		! %l7 = ffffffffff15ff00
!	Mem[0000000030001410] = 006cffff, %l3 = 00000000ff800000
	ldsba	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[000000001014143c] = 00ff0000, %l1 = 00000000000000ff, %asi = 80
	lduwa	[%i5+0x03c]%asi,%l1	! %l1 = 0000000000ff0000
!	Mem[0000000030101408] = 00000000, %f18 = 00008ce8
	lda	[%i4+%o4]0x81,%f18	! %f18 = 00000000
!	Mem[0000000010141408] = ffffffe0, %l3 = 0000000000000000
	ldsha	[%i5+%o4]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030041400] = 8cffffff, %l7 = ffffffffff15ff00
	ldsba	[%i1+%g0]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000100c1410] = 000080fffe918a22, %f10 = 00000000 000000ff
	ldda	[%i3+%o5]0x88,%f10	! %f10 = 000080ff fe918a22
!	Mem[0000000010001408] = 00000000000000ff, %l0 = 0000000000000000
	ldxa	[%i0+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141408] = e0ffffff, %l4 = ff0000007ba57292
	lduha	[%i5+%o4]0x88,%l4	! %l4 = 000000000000ffff

p0_label_353:
!	Starting 10 instruction Store Burst
!	%f2  = 00008ce8 00000000, Mem[0000000030041408] = f44bffff ff6f8ce8
	stda	%f2 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 00008ce8 00000000
!	%l3 = ffffffffffffffff, immd = 000003e0, %y  = ff000000
	smul	%l3,0x3e0,%l4		! %l4 = fffffffffffffc20, %y = ffffffff
!	%f30 = 00000000 00000000, Mem[0000000030081408] = 00000000 000000ff
	stda	%f30,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000 00000000
!	Mem[0000000010101420] = 00000000, %l2 = 00000000, %l5 = 00000053
	add	%i4,0x20,%g1
	casa	[%g1]0x80,%l2,%l5	! %l5 = 0000000000000000
!	%l7 = ffffffffffffffff, Mem[00000000300c1410] = 7f800000ffffff87
	stxa	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffffffffffffff
!	%f12 = ff6f8ce8 f44b4200, Mem[0000000010141408] = ffffffe0 000000ff
	stda	%f12,[%i5+%o4]0x80	! Mem[0000000010141408] = ff6f8ce8 f44b4200
!	%f28 = 80000000 00000000, Mem[0000000030181408] = ff000000 e88c0000
	stda	%f28,[%i6+%o4]0x81	! Mem[0000000030181408] = 80000000 00000000
!	%l0 = 00000000000000ff, %l7 = ffffffffffffffff, %l1  = 0000000000ff0000
	mulx	%l0,%l7,%l1		! %l1 = ffffffffffffff01
!	%l7 = ffffffffffffffff, Mem[0000000030081408] = 00000000
	stha	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = ffff0000
!	%f0  = 00000000 0000ffff, Mem[0000000030041410] = ff000000 00000000
	stda	%f0 ,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000 0000ffff

p0_label_354:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = ff0006f8, %l3 = ffffffffffffffff, %asi = 80
	ldsba	[%o3+0x140]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010141400] = 0762a744 00000000, %l0 = 000000ff, %l1 = ffffff01
	ldda	[%i5+%g0]0x80,%l0	! %l0 = 000000000762a744 0000000000000000
!	Mem[000000001000142f] = ff000000, %l1 = 0000000000000000, %asi = 80
	lduba	[%i0+0x02f]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101418] = 292e0531, %f0  = 00000000
	ld	[%i4+0x018],%f0 	! %f0 = 292e0531
!	Code Fragment 3, seed = 648189
p0_fragment_22:
!	%l0 = 000000000762a744
	setx	0x267a26f5ed1de53e,%g7,%l0 ! %l0 = 267a26f5ed1de53e
!	%l1 = 0000000000000000
	setx	0x85a51d6f24906de9,%g7,%l1 ! %l1 = 85a51d6f24906de9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 267a26f5ed1de53e
	setx	0x50faac8d9aaa32a4,%g7,%l0 ! %l0 = 50faac8d9aaa32a4
!	%l1 = 85a51d6f24906de9
	setx	0x16e04b2f8c83b66f,%g7,%l1 ! %l1 = 16e04b2f8c83b66f
p0_fragment_22_end:
!	Mem[0000000030001410] = ff0e0000ffff6c00, %f24 = 7f800000 ffffff87
	ldda	[%i0+%o5]0x89,%f24	! %f24 = ff0e0000 ffff6c00
!	Mem[0000000030001410] = ff0e0000ffff6c00, %f0  = 292e0531 0000ffff
	ldda	[%i0+%o5]0x89,%f0 	! %f0  = ff0e0000 ffff6c00
!	Mem[00000000300c1408] = 00000000, %l6 = ffffffff00000000
	lduba	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101410] = 00424bf4e88c0000, %f2  = 00008ce8 00000000
	ldda	[%i4+%o5]0x88,%f2 	! %f2  = 00424bf4 e88c0000
	membar	#Sync			! Added by membar checker (51)
!	Mem[0000000010041400] = 000000d8 000000ff ff000000 7ba57292
!	Mem[0000000010041410] = ff008dd8 00000000 ff6f8ce8 f44b4200
!	Mem[0000000010041420] = ff0ec60d 000000f5 860ec60d 0000ffff
!	Mem[0000000010041430] = ff000000 00000000 00000000 00000000
	ldda	[%i1+%g0]ASI_BLK_AIUP,%f0 	! Block Load from 0000000010041400

p0_label_355:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[00000000100c1423] = 00000000, %asi = 80
	stba	%l2,[%i3+0x023]%asi	! Mem[00000000100c1420] = 00000000
!	%l0 = 50faac8d9aaa32a4, Mem[00000000100c1408] = ff000000
	stwa	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 9aaa32a4
!	%l4 = fffffffffffffc20, Mem[00000000100c1408] = 9aaa32a4
	stba	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 20aa32a4
!	Mem[00000000100c1410] = 228a91feff800000, %l1 = 16e04b2f8c83b66f, %l1 = 16e04b2f8c83b66f
	add	%i3,0x10,%g1
	casxa	[%g1]0x80,%l1,%l1	! %l1 = 228a91feff800000
!	%l7 = ffffffffffffffff, Mem[0000000010101408] = 0000ffff
	stha	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = ffffffff
!	%l5 = 0000000000000000, Mem[00000000300c1410] = ffffffff
	stba	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00ffffff
!	Mem[0000000010141400] = 44a76207, %l3 = ffffffffffffffff
	ldstuba	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000007
!	Mem[0000000030081410] = 0000ffff, %l6 = 0000000000000000
	swapa	[%i2+%o5]0x89,%l6	! %l6 = 000000000000ffff
!	Mem[00000000300c1410] = ffffff00, %l0 = 000000009aaa32a4
	swapa	[%i3+%o5]0x89,%l0	! %l0 = 00000000ffffff00
	membar	#Sync			! Added by membar checker (52)
!	%l2 = 00000000, %l3 = 00000007, Mem[0000000010041410] = ff008dd8 00000000
	stda	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000 00000007

p0_label_356:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00000000, %l0 = 00000000ffffff00
	lduwa	[%i3+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1410] = 000080fffe918a22, %f4  = ff008dd8 00000000
	ldda	[%i3+%o5]0x88,%f4 	! %f4  = 000080ff fe918a22
!	Mem[00000000100c1402] = 00000000, %l2 = 0000000000000000, %asi = 80
	lduha	[%i3+0x002]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %l1 = 228a91feff800000
	ldswa	[%i6+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041418] = ff6f8ce8, %l6 = 000000000000ffff
	lduw	[%i1+0x018],%l6		! %l6 = 00000000ff6f8ce8
!	Mem[0000000030181400] = ff000000000080ff, %l2 = 0000000000000000
	ldxa	[%i6+%g0]0x81,%l2	! %l2 = ff000000000080ff
!	Mem[0000000030001410] = 006cffff, %f31 = 00000000
	lda	[%i0+%o5]0x81,%f31	! %f31 = 006cffff
!	Mem[0000000010181410] = 87ffffff000000ff, %f22 = e88c6f53 80000000
	ldda	[%i6+%o5]0x88,%f22	! %f22 = 87ffffff 000000ff
!	Mem[000000001008143c] = ffffa391, %f23 = 000000ff
	lda	[%i2+0x03c]%asi,%f23	! %f23 = ffffa391
!	Mem[0000000010001408] = ff00000000000000, %f28 = 80000000 00000000
	ldda	[%i0+%o4]0x80,%f28	! %f28 = ff000000 00000000

p0_label_357:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000030141408] = 00000000
	stba	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	Mem[0000000010101416] = f44b4200, %l3 = 0000000000000007
	ldstub	[%i4+0x016],%l3		! %l3 = 0000000000000042
!	%l4 = fffffffffffffc20, Mem[0000000030181400] = ff000000
	stwa	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = fffffc20
!	%f2  = ff000000 7ba57292, %f21 = d88d00ff
	fdtos	%f2 ,%f21		! %f21 = ff800000
!	Mem[0000000010001400] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%l4 = fffffc20, %l5 = 00000000, Mem[0000000010181408] = fd0b0000 00000000
	stda	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = fffffc20 00000000
!	%l3 = 0000000000000042, Mem[00000000100c1410] = fe918a22
	stha	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = fe910042
!	Mem[0000000010101400] = ff000000 000000ff ffffffff 00000000
!	%f16 = 292e0531 00000000 00000000 000000ff
!	%f20 = 00000000 ff800000 87ffffff ffffa391
!	%f24 = ff0e0000 ffff6c00 00007aec 00000000
!	%f28 = ff000000 00000000 00000000 006cffff
	stda	%f16,[%i4+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010101400
!	%f10 = 860ec60d 0000ffff, Mem[0000000030041400] = 8cffffff e88c6f53
	stda	%f10,[%i1+%g0]0x89	! Mem[0000000030041400] = 860ec60d 0000ffff
!	%l2 = 000080ff, %l3 = 00000042, Mem[0000000030141400] = 00424bf4 e88c6fff
	stda	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 000080ff 00000042

p0_label_358:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ff800000, %l5 = 0000000000000000
	lduba	[%i4+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081408] = ff000000, %f13 = 00000000
	lda	[%i2+%o4]0x88,%f13	! %f13 = ff000000
!	Mem[0000000030001408] = ff000000 00000000, %l6 = ff6f8ce8, %l7 = ffffffff
	ldda	[%i0+%o4]0x89,%l6	! %l6 = 0000000000000000 00000000ff000000
!	Mem[0000000021800141] = ff0006f8, %l4 = fffffffffffffc20, %asi = 80
	lduba	[%o3+0x141]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %f10 = 860ec60d
	lda	[%i2+%g0]0x81,%f10	! %f10 = 00000000
!	%f16 = 292e0531, %f11 = 0000ffff
	fcmps	%fcc1,%f16,%f11		! %fcc1 = 2
!	%l7 = 00000000ff000000, %l4 = 0000000000000000, %y  = ffffffff
	sdiv	%l7,%l4,%l6		! Div by zero, %l0 = 0000000000000028
!	Mem[0000000010181408] = 20fcffff00000000, %f8  = ff0ec60d 000000f5
	ldda	[%i6+%o4]0x80,%f8 	! %f8  = 20fcffff 00000000
!	Mem[00000000300c1410] = 9aaa32a4, %l1 = 0000000000000000
	lduwa	[%i3+%o5]0x89,%l1	! %l1 = 000000009aaa32a4
!	Mem[0000000010081408] = 000000ff, %f2  = ff000000
	lda	[%i2+%o4]0x80,%f2 	! %f2 = 000000ff

p0_label_359:
!	Starting 10 instruction Store Burst
!	%l2 = ff000000000080ff, Mem[0000000010041410] = 00000000
	stwa	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 000080ff
!	Mem[0000000030041400] = ffff0000, %l7 = 00000000ff000000
	ldstuba	[%i1+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	%l1 = 000000009aaa32a4, Mem[0000000030041408] = 00008ce800000000
	stxa	%l1,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000009aaa32a4
!	%f3  = 7ba57292, Mem[00000000100c1410] = fe910042
	sta	%f3 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = 7ba57292
!	Mem[00000000218001c0] = 00ffa358, %l0 = 0000000000000028
	ldstuba	[%o3+0x1c0]%asi,%l0	! %l0 = 0000000000000000
!	%l2 = ff000000000080ff, Mem[0000000010081410] = 00000000
	stwa	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 000080ff
!	Mem[00000000300c1410] = a432aa9a, %l1 = 000000009aaa32a4
	swapa	[%i3+%o5]0x81,%l1	! %l1 = 00000000a432aa9a
!	%f14 = 00000000, %f8  = 20fcffff
	fcmpes	%fcc2,%f14,%f8 		! %fcc2 = 1
!	Mem[0000000010041438] = 00000000, %l1 = 00000000a432aa9a
	swap	[%i1+0x038],%l1		! %l1 = 0000000000000000
!	Mem[0000000010001410] = 0000004a, %l4 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l4	! %l4 = 000000000000004a

p0_label_360:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141438] = 57fbe2ff, %f7  = f44b4200
	ld	[%i5+0x038],%f7 	! %f7 = 57fbe2ff
!	Mem[0000000010001408] = ff000000 00000000, %l2 = 000080ff, %l3 = 00000042
	ldda	[%i0+%o4]0x80,%l2	! %l2 = 00000000ff000000 0000000000000000
!	Mem[0000000010141400] = 44a762ff, %f7  = 57fbe2ff
	lda	[%i5+%g0]0x88,%f7 	! %f7 = 44a762ff
!	Mem[0000000010041408] = ff000000, %l2 = 00000000ff000000
	ldsba	[%i1+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010041408] = 9272a57b000000ff, %f12 = ff000000 ff000000
	ldda	[%i1+%o4]0x88,%f12	! %f12 = 9272a57b 000000ff
!	Mem[0000000010001434] = 000000ff, %f2  = 000000ff
	lda	[%i0+0x034]%asi,%f2 	! %f2 = 000000ff
!	Mem[0000000010081400] = 00000000, %f0  = 000000d8
	lda	[%i2+%g0]0x88,%f0 	! %f0 = 00000000
!	Mem[0000000010081408] = 4a000000ff000000, %l1 = 0000000000000000
	ldxa	[%i2+%o4]0x88,%l1	! %l1 = 4a000000ff000000
!	Mem[0000000020800040] = 00ff65a8, %l6 = 0000000000000000
	ldsb	[%o1+0x040],%l6		! %l6 = 0000000000000000
!	Mem[00000000201c0000] = ffff8148, %l3 = 0000000000000000, %asi = 80
	ldsba	[%o0+0x000]%asi,%l3	! %l3 = ffffffffffffffff

p0_label_361:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000030041408] = 9aaa32a4
	stha	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 9aaa0000
!	%l4 = 000000000000004a, Mem[0000000030001410] = ffff6c00
	stba	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = ffff6c4a
!	Mem[0000000030101400] = ffffffff, %l0 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1410] = 7ba57292, %l6 = 0000000000000000
	ldstuba	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000092
!	%l6 = 0000000000000092, Mem[00000000100c1410] = ff72a57bff800000
	stxa	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000000000000092
!	%l4 = 0000004a, %l5 = 00000000, Mem[0000000010001420] = 86ffffff 11715c51, %asi = 80
	stda	%l4,[%i0+0x020]%asi	! Mem[0000000010001420] = 0000004a 00000000
!	Mem[0000000030001400] = 9bf6ff8c, %l6 = 0000000000000092
	ldstuba	[%i0+%g0]0x89,%l6	! %l6 = 000000000000008c
!	Mem[0000000010041400] = d8000000, %l2 = ffffffffffffffff
	ldstuba	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081408] = ffff0000, %l0 = 00000000000000ff
	swapa	[%i2+%o4]0x81,%l0	! %l0 = 00000000ffff0000
!	%f9  = 00000000, Mem[00000000300c1410] = 9aaa32a4
	sta	%f9 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000

p0_label_362:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 000000ff, %l2 = 0000000000000000
	lduba	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (53)
!	Mem[0000000010081400] = 00000000 000000ff 000000ff 0000004a
!	Mem[0000000010081410] = 000080ff 00000000 7959e581 00000000
!	Mem[0000000010081420] = 000000ff 0dc60e86 228a91fe 536f8ce8
!	Mem[0000000010081430] = ff15ff00 00000000 5e0497ff ffffa391
	ldda	[%i2+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010081400
!	Mem[0000000010141410] = 0000000000000000, %l6 = 000000000000008c
	ldxa	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181400] = fffffc20, %l0 = 00000000ffff0000
	ldsha	[%i6+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030101400] = ffffffff ffffff87, %l0 = ffffffff, %l1 = ff000000
	ldda	[%i4+%g0]0x81,%l0	! %l0 = 00000000ffffffff 00000000ffffff87
!	Mem[0000000010041410] = ff800000, %l4 = 000000000000004a
	ldsba	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081408] = 000000ff, %l7 = 00000000000000ff
	lduwa	[%i2+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141408] = 00000000, %l6 = 0000000000000000
	ldswa	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041410] = ffff0000, %l6 = 0000000000000000
	lduha	[%i1+%o5]0x81,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030001400] = fffff69b, %l5 = 0000000000000000
	lduwa	[%i0+%g0]0x81,%l5	! %l5 = 00000000fffff69b

p0_label_363:
!	Starting 10 instruction Store Burst
!	%f4  = 000080ff, %f6  = ff6f8ce8
	fsqrts	%f4 ,%f6 		! tt=0x22, %l0 = 0000000100000021
!	Code Fragment 3, seed = 516072
p0_fragment_23:
!	%l0 = 0000000100000021
	setx	0xd905d64b0c24e0e6,%g7,%l0 ! %l0 = d905d64b0c24e0e6
!	%l1 = 00000000ffffff87
	setx	0x5f942a6bdd4db911,%g7,%l1 ! %l1 = 5f942a6bdd4db911
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d905d64b0c24e0e6
	setx	0xfe7d71e9b922b54c,%g7,%l0 ! %l0 = fe7d71e9b922b54c
!	%l1 = 5f942a6bdd4db911
	setx	0x98585b0d2dc7d897,%g7,%l1 ! %l1 = 98585b0d2dc7d897
p0_fragment_23_end:
!	Mem[0000000010001420] = 0000004a00000000, %l3 = ffffffffffffffff, %l2 = 0000000000000000
	add	%i0,0x20,%g1
	casxa	[%g1]0x80,%l3,%l2	! %l2 = 0000004a00000000
!	Mem[0000000030141408] = 00000000, %l5 = 00000000fffff69b
	swapa	[%i5+%o4]0x81,%l5	! %l5 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010181410] = ff000000
	stwa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	%f24 = 000000ff 0dc60e86, %l0 = fe7d71e9b922b54c
!	Mem[0000000030101418] = 00424bf4e88c6fff
	add	%i4,0x018,%g1
	stda	%f24,[%g1+%l0]ASI_PST16_S ! Mem[0000000030101418] = 000000ffe88c6fff
!	Mem[00000000211c0001] = ff53d1d8, %l3 = ffffffffffffffff
	ldstub	[%o2+0x001],%l3		! %l3 = 0000000000000053
!	%f22 = 7959e581 00000000, %l5 = 0000000000000000
!	Mem[0000000030041418] = 0000004a7fffffff
	add	%i1,0x018,%g1
	stda	%f22,[%g1+%l5]ASI_PST32_S ! Mem[0000000030041418] = 0000004a7fffffff
!	%f12 = 9272a57b 000000ff, %l7 = 00000000000000ff
!	Mem[0000000010001420] = 0000004a00000000
	add	%i0,0x020,%g1
	stda	%f12,[%g1+%l7]ASI_PST16_P ! Mem[0000000010001420] = 9272a57b000000ff
!	%l5 = 0000000000000000, Mem[0000000010181400] = d1b0b40b
	stha	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = d1b00000

p0_label_364:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00000000, %l0 = fe7d71e9b922b54c
	lduba	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (54)
!	Mem[0000000010001400] = ff000000 000000ff ff000000 00000000
!	Mem[0000000010001410] = 00000000 ff000000 0000ff00 00000000
!	Mem[0000000010001420] = 9272a57b 000000ff 00ff0000 ff000000
!	Mem[0000000010001430] = 00000000 000000ff ffffffe0 00000000
	ldda	[%i0+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010001400
!	Mem[0000000030001410] = ffff6c4a, %l2 = 0000004a00000000
	lduba	[%i0+%o5]0x89,%l2	! %l2 = 000000000000004a
!	Mem[0000000010001400] = ff000000000000ff, %l1 = 98585b0d2dc7d897
	ldx	[%i0+%g0],%l1		! %l1 = ff000000000000ff
!	%l6 = 000000000000ffff, imm = fffffffffffff06c, %l1 = ff000000000000ff
	xnor	%l6,-0xf94,%l1		! %l1 = 000000000000f06c
!	Mem[0000000030081408] = ff000000, %l4 = 0000000000000000
	ldswa	[%i2+%o4]0x89,%l4	! %l4 = ffffffffff000000
!	Mem[0000000010081400] = ff00000000000000, %f24 = 000000ff 0dc60e86
	ldda	[%i2+%g0]0x88,%f24	! %f24 = ff000000 00000000
!	Mem[0000000030041410] = ffff0000 00000000, %l4 = ff000000, %l5 = 00000000
	ldda	[%i1+%o5]0x81,%l4	! %l4 = 00000000ffff0000 0000000000000000
!	Mem[0000000010041400] = ff0000d8, %f30 = 5e0497ff
	lda	[%i1+%g0]0x80,%f30	! %f30 = ff0000d8
!	Mem[0000000030181400] = fffffc20, %l5 = 0000000000000000
	lduba	[%i6+%g0]0x81,%l5	! %l5 = 00000000000000ff

p0_label_365:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = 00000080, %l6 = 000000000000ffff
	swapa	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000080
!	%l3 = 0000000000000053, Mem[0000000030081408] = ff000000
	stha	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = ff000053
!	Mem[0000000010001434] = 000000ff, %l3 = 0000000000000053, %asi = 80
	swapa	[%i0+0x034]%asi,%l3	! %l3 = 00000000000000ff
!	%l6 = 0000000000000080, Mem[0000000030141408] = fffff69b
	stwa	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000080
!	%l0 = 0000000000000000, Mem[0000000030001408] = 00000000
	stwa	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	%l2 = 0000004a, %l3 = 000000ff, Mem[0000000030001410] = ffff6c4a ff0e0000
	stda	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000004a 000000ff
!	Mem[0000000010081408] = 000000ff, %f24 = ff000000
	lda	[%i2+%o4]0x80,%f24	! %f24 = 000000ff
!	%l3 = 00000000000000ff, Mem[0000000010141414] = 00000000, %asi = 80
	stba	%l3,[%i5+0x014]%asi	! Mem[0000000010141414] = ff000000
!	%l0 = 0000000000000000, Mem[0000000030041400] = ffff0000
	stba	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 00ff0000
	membar	#Sync			! Added by membar checker (55)
!	%l2 = 000000000000004a, Mem[0000000010001408] = 000000ff
	stba	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000004a

p0_label_366:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 9aaa0000, %l5 = 00000000000000ff
	ldsha	[%i1+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181410] = 87ffffff 00000000, %l2 = 0000004a, %l3 = 000000ff
	ldda	[%i6+%o5]0x88,%l2	! %l2 = 0000000000000000 0000000087ffffff
!	Mem[0000000030081408] = 530000ff, %l5 = 0000000000000000
	ldsba	[%i2+%o4]0x81,%l5	! %l5 = 0000000000000053
!	Mem[00000000100c1410] = 0000000000000092, %l1 = 000000000000f06c
	ldxa	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000092
!	Mem[0000000010141410] = 00000000, %l2 = 0000000000000000
	lduba	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141410] = fe918a22, %l5 = 0000000000000053
	ldsha	[%i5+%o5]0x89,%l5	! %l5 = ffffffffffff8a22
!	Mem[0000000030141400] = 000080ff, %l2 = 0000000000000000
	lduba	[%i5+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181400] = d1b00000, %l7 = 00000000000000ff
	lduha	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1430] = ff6f8ce8 f44b4200, %l6 = 00000080, %l7 = 00000000, %asi = 80
	ldda	[%i3+0x030]%asi,%l6	! %l6 = 00000000ff6f8ce8 00000000f44b4200
!	Mem[0000000010141410] = 000000ff00000000, %f16 = 00000000 000000ff
	ldda	[%i5+%o5]0x88,%f16	! %f16 = 000000ff 00000000

p0_label_367:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 4a000000, %l4 = 00000000ffff0000
	ldstuba	[%i0+%o4]0x80,%l4	! %l4 = 000000000000004a
!	Mem[00000000100c1419] = ff6f8ce8, %l4 = 000000000000004a
	ldstuba	[%i3+0x019]%asi,%l4	! %l4 = 000000000000006f
!	%l5 = ffffffffffff8a22, Mem[00000000300c1400] = ff00000000000000
	stxa	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffffffff8a22
!	Mem[0000000030141400] = ff800000, %l3 = 0000000087ffffff
	ldstuba	[%i5+%g0]0x89,%l3	! %l3 = 0000000000000000
!	%l4 = 0000006f, %l5 = ffff8a22, Mem[0000000010101400] = 00000000 292e0531
	stda	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000006f ffff8a22
!	%l0 = 00000000, %l1 = 00000092, Mem[00000000100c1408] = a432aa20 00000000
	stda	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 00000092
!	%l6 = 00000000ff6f8ce8, Mem[0000000030141408] = 00000080
	stha	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 8ce80080
!	%l2 = 0000000000000000, Mem[00000000100c1408] = 00000000
	stwa	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	Mem[0000000010081408] = 000000ff, %l4 = 000000000000006f
	swapa	[%i2+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[00000000211c0001] = ffffd1d8, %l6 = 00000000ff6f8ce8
	ldstuba	[%o2+0x001]%asi,%l6	! %l6 = 00000000000000ff

p0_label_368:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000000, %l7 = 00000000f44b4200
	lduw	[%i2+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %l6 = 00000000000000ff
	ldsba	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l5 = ffffffffffff8a22
	lduba	[%i3+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l6 = 0000000000000000
	lduba	[%i6+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001400] = ffffffff 9bf6ffff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i0+%g0]0x89,%l2	! %l2 = 000000009bf6ffff 00000000ffffffff
!	Mem[00000000201c0000] = ffff8148, %l4 = 00000000000000ff, %asi = 80
	lduha	[%o0+0x000]%asi,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010181400] = 0000b0d1 0000ffff 20fcffff 00000000
!	Mem[0000000010181410] = 00000000 ffffff87 ffff6cf5 5e0497ff
!	Mem[0000000010181420] = 00000000 ffffffff ff15ff00 000000ff
!	Mem[0000000010181430] = 1cc528c5 ff6f8ce8 00ff0000 00000000
	ldda	[%i6+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010181400
!	%l5 = 0000000000000000, immd = 00000b8c, %y  = ffffffff
	smul	%l5,0xb8c,%l3		! %l3 = 0000000000000000, %y = 00000000
!	%l4 = 000000000000ffff, immd = 00000cd7, %y  = 00000000
	umul	%l4,0xcd7,%l1		! %l1 = 000000000cd6f329, %y = 00000000
!	Mem[0000000010101408] = 000000ff, %l3 = 0000000000000000
	ldsha	[%i4+%o4]0x88,%l3	! %l3 = 00000000000000ff

p0_label_369:
!	Starting 10 instruction Store Burst
!	%f11 = ff000000, Mem[0000000030101410] = 000080ff
	sta	%f11,[%i4+%o5]0x81	! Mem[0000000030101410] = ff000000
!	%l7 = 0000000000000000, Mem[0000000030041408] = 9aaa0000
	stba	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = 9aaa0000
!	%l3 = 00000000000000ff, Mem[0000000010141400] = ff62a74400000000
	stxa	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000000000ff
!	%f0  = ff000000, Mem[000000001010140c] = 00000000
	sta	%f0 ,[%i4+0x00c]%asi	! Mem[000000001010140c] = ff000000
!	%l1 = 000000000cd6f329, %l1 = 000000000cd6f329, %l7 = 0000000000000000
	xnor	%l1,%l1,%l7		! %l7 = ffffffffffffffff
!	%l2 = 000000009bf6ffff, Mem[0000000010081405] = 000000ff
	stb	%l2,[%i2+0x005]		! Mem[0000000010081404] = 00ff00ff
!	%l0 = 0000000000000000, Mem[0000000030141410] = fe918a22
	stha	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = fe910000
!	%l5 = 0000000000000000, Mem[0000000021800100] = 00ffb2c8
	stb	%l5,[%o3+0x100]		! Mem[0000000021800100] = 00ffb2c8
!	%l1 = 000000000cd6f329, Mem[0000000030181408] = 0000ffff
	stwa	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = 0cd6f329
!	Mem[0000000030101400] = ffffffffffffff87, %f10 = 00ff0000 ff000000
	ldda	[%i4+%g0]0x81,%f10	! %f10 = ffffffff ffffff87

p0_label_370:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ff0000d8, %l5 = 0000000000000000
	lduwa	[%i1+%g0]0x80,%l5	! %l5 = 00000000ff0000d8
!	Mem[0000000030101410] = ff000000, %l2 = 000000009bf6ffff
	ldsba	[%i4+%o5]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030001408] = 00000000000000ff, %f14 = ffffffe0 00000000
	ldda	[%i0+%o4]0x81,%f14	! %f14 = 00000000 000000ff
!	Mem[0000000010001400] = 000000ff, %f12 = 00000000
	lda	[%i0+%g0]0x88,%f12	! %f12 = 000000ff
!	Mem[0000000010041434] = 00000000, %l5 = 00000000ff0000d8
	lduw	[%i1+0x034],%l5		! %l5 = 0000000000000000
!	Mem[0000000010181408] = 00000000fffffc20, %l1 = 000000000cd6f329
	ldxa	[%i6+%o4]0x88,%l1	! %l1 = 00000000fffffc20
!	Mem[0000000030041400] = 00ff0000, %l6 = 0000000000000000
	lduba	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = ffffd1d8, %l3 = 00000000000000ff, %asi = 80
	ldsha	[%o2+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000020800040] = 00ff65a8, %l1 = 00000000fffffc20
	ldsb	[%o1+0x040],%l1		! %l1 = 0000000000000000
!	Mem[0000000010041410] = 000080ff, %f13 = 000000ff
	lda	[%i1+%o5]0x80,%f13	! %f13 = 000080ff

p0_label_371:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101414] = 00000000, %l4 = 000000000000ffff, %asi = 80
	swapa	[%i4+0x014]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = 000080ff0000ffff, %l1 = 0000000000000000, %l4 = 0000000000000000
	add	%i4,0x10,%g1
	casxa	[%g1]0x80,%l1,%l4	! %l4 = 000080ff0000ffff
!	%l1 = 0000000000000000, Mem[0000000030001408] = 00000000
	stba	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	%f18 = 00000000 fffffc20, Mem[0000000010041400] = ff0000d8 000000ff
	stda	%f18,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000 fffffc20
!	Mem[000000001018141c] = 5e0497ff, %l6 = 0000000000000000
	ldstub	[%i6+0x01c],%l6		! %l6 = 000000000000005e
!	%l4 = 000080ff0000ffff, Mem[0000000030041400] = 0000ff00
	stwa	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000ffff
!	%l4 = 000080ff0000ffff, Mem[0000000030081408] = 530000ff
	stwa	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000ffff
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010141400] = 00000000 000000ff
	stda	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000 00000000
!	%l4 = 000080ff0000ffff, Mem[00000000300c1408] = 00000000
	stha	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000ffff

p0_label_372:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000, %l0 = 0000000000000000
	lduwa	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Code Fragment 3, seed = 464496
p0_fragment_24:
!	%l0 = 0000000000000000
	setx	0x4ebfe56220d034a6,%g7,%l0 ! %l0 = 4ebfe56220d034a6
!	%l1 = 0000000000000000
	setx	0xfcb02af4b373c0d1,%g7,%l1 ! %l1 = fcb02af4b373c0d1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4ebfe56220d034a6
	setx	0x414add7234d5310c,%g7,%l0 ! %l0 = 414add7234d5310c
!	%l1 = fcb02af4b373c0d1
	setx	0x7eb6f69ca96c8857,%g7,%l1 ! %l1 = 7eb6f69ca96c8857
p0_fragment_24_end:
!	Mem[000000001000141a] = 0000ff00, %l6 = 000000000000005e
	lduh	[%i0+0x01a],%l6		! %l6 = 000000000000ff00
!	Mem[0000000010141410] = 00000000, %l4 = 000080ff0000ffff
	lduba	[%i5+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041400] = 0000ffff, %l6 = 000000000000ff00
	ldswa	[%i1+%g0]0x89,%l6	! %l6 = 000000000000ffff
!	Mem[00000000300c1408] = 0000ffff, %l1 = 7eb6f69ca96c8857
	ldsha	[%i3+%o4]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000021800181] = ffff5728, %l2 = ffffffffffffffff, %asi = 80
	ldsba	[%o3+0x181]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1408] = 00000000, %l2 = ffffffffffffffff
	lduwa	[%i3+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l4 = 0000000000000000
	lduwa	[%i0+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041410] = 000080ff, %l2 = 0000000000000000
	ldsba	[%i1+%o5]0x80,%l2	! %l2 = 0000000000000000

p0_label_373:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 000000ff, %l3 = 00000000ffffffff
	swapa	[%i4+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041400] = 00000000, %l6 = 000000000000ffff
	swapa	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010141420] = 0000c691ff000000
	stx	%l6,[%i5+0x020]		! Mem[0000000010141420] = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030141410] = 000091fe
	stha	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 000091fe
!	%l5 = 0000000000000000, Mem[0000000030041410] = 0000ffff
	stwa	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	Mem[0000000030081400] = 00000000 00000000 0000ffff 00000000
!	%f16 = ffff0000 d1b00000 00000000 fffffc20
!	%f20 = 87ffffff 00000000 ff97045e f56cffff
!	%f24 = ffffffff 00000000 ff000000 00ff15ff
!	%f28 = e88c6fff c528c51c 00000000 0000ff00
	stda	%f16,[%i2+%g0]ASI_BLK_SL	! Block Store to 0000000030081400
!	%l3 = 00000000000000ff, Mem[0000000030041408] = 000000009aaa0000
	stxa	%l3,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000010141410] = 00000000ff000000
	stxa	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l0 = 414add7234d5310c
	ldstuba	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181400] = fffffc20, %l3 = 00000000000000ff
	ldstuba	[%i6+%g0]0x81,%l3	! %l3 = 00000000000000ff

p0_label_374:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = fffff69b, %l1 = ffffffffffffffff
	ldsha	[%i0+%g0]0x81,%l1	! %l1 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (56)
!	Mem[0000000030081410] = 00000000ffffff87, %f0  = ff000000 000000ff
	ldda	[%i2+%o5]0x81,%f0 	! %f0  = 00000000 ffffff87
!	Mem[0000000030001400] = 9bf6ffff, %l2 = 0000000000000000
	lduba	[%i0+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1400] = ffffffff ffff8a22, %l0 = 00000000, %l1 = ffffffff
	ldda	[%i3+%g0]0x81,%l0	! %l0 = 00000000ffffffff 00000000ffff8a22
!	Mem[0000000010001410] = 000000ff00000000, %l1 = 00000000ffff8a22
	ldxa	[%i0+%o5]0x88,%l1	! %l1 = 000000ff00000000
!	Mem[00000000300c1408] = ff0000000000ffff, %l4 = 0000000000000000
	ldxa	[%i3+%o4]0x89,%l4	! %l4 = ff0000000000ffff
!	Mem[0000000030181410] = 00000000, %f8  = 9272a57b
	lda	[%i6+%o5]0x89,%f8 	! %f8 = 00000000
!	Mem[0000000010041410] = ff800000, %l0 = 00000000ffffffff
	lduwa	[%i1+%o5]0x88,%l0	! %l0 = 00000000ff800000
!	Mem[0000000010181438] = 00ff0000, %l3 = 00000000000000ff
	lduh	[%i6+0x038],%l3		! %l3 = 00000000000000ff
!	Mem[0000000030001400] = fffff69b ffffffff, %l2 = 000000ff, %l3 = 000000ff
	ldda	[%i0+%g0]0x81,%l2	! %l2 = 00000000fffff69b 00000000ffffffff

p0_label_375:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041430] = ff000000, %l0 = ff800000, %l7 = ffffffff
	add	%i1,0x30,%g1
	casa	[%g1]0x80,%l0,%l7	! %l7 = 00000000ff000000
!	%f12 = 000000ff, %f19 = fffffc20
	fcmps	%fcc3,%f12,%f19		! %fcc3 = 3
!	Mem[00000000100c1410] = 00000000, %l0 = 00000000ff800000
	swapa	[%i3+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l5 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000000
!	%f5  = ff000000, Mem[00000000300c1400] = ffffffff
	sta	%f5 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = ff000000
!	%f8  = 00000000 000000ff, Mem[0000000030081400] = d1b00000 ffff0000
	stda	%f8 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000 000000ff
!	Mem[0000000010001408] = 000000ff, %l4 = ff0000000000ffff
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041400] = ffff0000, %l5 = 0000000000000000
	ldstuba	[%i1+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	%l7 = 00000000ff000000, Mem[00000000100c1400] = 00000000, %asi = 80
	stha	%l7,[%i3+0x000]%asi	! Mem[00000000100c1400] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010141400] = 0000000000000000
	stxa	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000000000000000

p0_label_376:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 6f000000, %l5 = 00000000000000ff
	ldsba	[%i2+%o4]0x88,%l5	! %l5 = 0000000000000000
!	%l2 = 00000000fffff69b, %l4 = 00000000000000ff, %l0 = 0000000000000000
	orn	%l2,%l4,%l0		! %l0 = ffffffffffffff9b
!	Mem[00000000100c1410] = ff80000000000092, %l1 = 000000ff00000000
	ldxa	[%i3+%o5]0x80,%l1	! %l1 = ff80000000000092
!	Mem[000000001000140f] = 00000000, %l3 = 00000000ffffffff, %asi = 80
	ldsba	[%i0+0x00f]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = 000000ff, %l4 = 00000000000000ff
	ldswa	[%i2+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000021800181] = ffff5728, %l0 = ffffffffffffff9b, %asi = 80
	lduba	[%o3+0x181]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1408] = ff000000, %l7 = 00000000ff000000
	ldsba	[%i3+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030041400] = ffff0000 0dc60e86, %l0 = 000000ff, %l1 = 00000092
	ldda	[%i1+%g0]0x81,%l0	! %l0 = 00000000ffff0000 000000000dc60e86
!	Mem[0000000010081400] = 000000ff, %l4 = 00000000000000ff
	lduwa	[%i2+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%l0 = 00000000ffff0000, %l1 = 000000000dc60e86, %y  = 00000000
	sdiv	%l0,%l1,%l1		! %l1 = 0000000000000012
	mov	%l0,%y			! %y = ffff0000

p0_label_377:
!	Starting 10 instruction Store Burst
!	%f8  = 00000000 000000ff, Mem[0000000030101400] = ffffffff 87ffffff
	stda	%f8 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000 000000ff
!	%l4 = 00000000000000ff, Mem[0000000010181408] = fffffc20
	stba	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = fffffcff
!	Mem[0000000010101410] = ffff0000ff800000, %f28 = e88c6fff c528c51c
	ldda	[%i4+%o5]0x88,%f28	! %f28 = ffff0000 ff800000
!	Mem[0000000010181400] = d1b00000, %l0 = 00000000ffff0000
	ldstuba	[%i6+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%l2 = 00000000fffff69b, imm = fffffffffffffda8, %l5 = 0000000000000000
	xor	%l2,-0x258,%l5		! %l5 = ffffffff00000b33
!	%l0 = 0000000000000000, Mem[0000000030001400] = ffffffff9bf6ffff
	stxa	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000000000000000
!	Mem[0000000010101434] = 000000ff, %l0 = 0000000000000000
	swap	[%i4+0x034],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010141400] = 00000000, %l3 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000000
!	%l4 = 00000000000000ff, Mem[0000000030101408] = 00000000
	stha	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 00ff0000
!	%f16 = ffff0000 d1b00000, Mem[0000000010181420] = 00000000 ffffffff
	std	%f16,[%i6+0x020]	! Mem[0000000010181420] = ffff0000 d1b00000

p0_label_378:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 0000006f0000004a, %f14 = 00000000 000000ff
	ldda	[%i2+%o4]0x80,%f14	! %f14 = 0000006f 0000004a
!	Mem[0000000030181400] = 20fcffff, %l5 = ffffffff00000b33
	ldswa	[%i6+%g0]0x89,%l5	! %l5 = 0000000020fcffff
!	Mem[00000000300c1410] = 00000000, %l0 = 00000000000000ff
	lduha	[%i3+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101405] = 228affff, %l0 = 0000000000000000
	ldsb	[%i4+0x005],%l0		! %l0 = ffffffffffffff8a
!	Mem[0000000010181410] = 87ffffff00000000, %f12 = 000000ff 000080ff
	ldda	[%i6+%o5]0x88,%f12	! %f12 = 87ffffff 00000000
!	Mem[0000000030181400] = fffffc20, %l6 = 0000000000000000
	ldsba	[%i6+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030101410] = 000000ff000000ff, %l4 = 00000000000000ff
	ldxa	[%i4+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	Mem[000000001010140e] = ff000000, %l3 = 0000000000000000
	ldsh	[%i4+0x00e],%l3		! %l3 = 0000000000000000
!	Code Fragment 3, seed = 332160
p0_fragment_25:
!	%l0 = ffffffffffffff8a
	setx	0x116ff1d865186c26,%g7,%l0 ! %l0 = 116ff1d865186c26
!	%l1 = 0000000000000012
	setx	0x0ab47e23933c6051,%g7,%l1 ! %l1 = 0ab47e23933c6051
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 116ff1d865186c26
	setx	0x85019abd2e51b88c,%g7,%l0 ! %l0 = 85019abd2e51b88c
!	%l1 = 0ab47e23933c6051
	setx	0xc97348918a7877d7,%g7,%l1 ! %l1 = c97348918a7877d7
p0_fragment_25_end:
!	Mem[0000000010141400] = 00000000, %l1 = c97348918a7877d7
	ldsba	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000

p0_label_379:
!	Starting 10 instruction Store Burst
!	%f22 = ff97045e f56cffff, %l5 = 0000000020fcffff
!	Mem[0000000010181420] = ffff0000d1b00000
	add	%i6,0x020,%g1
	stda	%f22,[%g1+%l5]ASI_PST16_P ! Mem[0000000010181420] = ff97045ef56cffff
!	Mem[0000000030141410] = fe910000, %l1 = 0000000000000000
	ldstuba	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%f0  = 00000000 ffffff87, %l3 = 0000000000000000
!	Mem[0000000010141430] = ff8d0000000000ff
	add	%i5,0x030,%g1
	stda	%f0,[%g1+%l3]ASI_PST32_P ! Mem[0000000010141430] = ff8d0000000000ff
!	%l2 = fffff69b, %l3 = 00000000, Mem[0000000010181410] = 00000000 87ffffff
	stda	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = fffff69b 00000000
!	%l0 = 85019abd2e51b88c, %l2 = 00000000fffff69b, %y  = ffff0000
	umul	%l0,%l2,%l1		! %l1 = 2e51b6d8da4544c4, %y = 2e51b6d8
!	%l7 = ffffffffffffffff, Mem[00000000300c1400] = ff000000
	stha	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = ff00ffff
!	%l0 = 2e51b88c, %l1 = da4544c4, Mem[00000000300c1410] = 00000000 ffffffff
	stda	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 2e51b88c da4544c4
!	Mem[000000001010140c] = ff000000, %l3 = 00000000, %l5 = 20fcffff
	add	%i4,0x0c,%g1
	casa	[%g1]0x80,%l3,%l5	! %l5 = 00000000ff000000
!	Mem[00000000100c1420] = 00000000, %l1 = 2e51b6d8da4544c4
	ldstub	[%i3+0x020],%l1		! %l1 = 0000000000000000
!	%l4 = 000000ff000000ff, Mem[00000000100c1400] = 00000000
	stwa	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff

p0_label_380:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 000080ff00000007, %l6 = ffffffffffffffff
	ldxa	[%i1+%o5]0x80,%l6	! %l6 = 000080ff00000007
!	Mem[0000000010001400] = ff000000 000000ff, %l0 = 2e51b88c, %l1 = 00000000
	ldda	[%i0+%g0]0x80,%l0	! %l0 = 00000000ff000000 00000000000000ff
!	Mem[0000000010001410] = 00000000, %l5 = 00000000ff000000
	ldsha	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Code Fragment 4, seed = 121052
p0_fragment_26:
!	%l0 = 00000000ff000000
	setx	0xf65843395de44d46,%g7,%l0 ! %l0 = f65843395de44d46
!	%l1 = 00000000000000ff
	setx	0x3e905fbc08b0f771,%g7,%l1 ! %l1 = 3e905fbc08b0f771
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f65843395de44d46
	setx	0x88ea0a3036c925ac,%g7,%l0 ! %l0 = 88ea0a3036c925ac
!	%l1 = 3e905fbc08b0f771
	setx	0x053be0990fb2daf7,%g7,%l1 ! %l1 = 053be0990fb2daf7
p0_fragment_26_end:
!	Mem[0000000030101410] = 000000ff, %l3 = 0000000000000000
	ldsha	[%i4+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041408] = ff000000, %l1 = 053be0990fb2daf7
	ldsba	[%i1+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030041408] = ff000000, %l3 = 00000000000000ff
	ldsba	[%i1+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101400] = 6f000000228affff, %f8  = 00000000 000000ff
	ldda	[%i4+%g0]0x80,%f8 	! %f8  = 6f000000 228affff
!	Mem[0000000030141408] = 8ce80080, %l0 = 88ea0a3036c925ac
	lduba	[%i5+%o4]0x81,%l0	! %l0 = 000000000000008c
!	Mem[0000000010001400] = ff000000, %l5 = 0000000000000000
	ldsba	[%i0+%g0]0x80,%l5	! %l5 = ffffffffffffffff

p0_label_381:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 000000ff, %l7 = ffffffffffffffff
	ldstuba	[%i4+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	%l6 = 000080ff00000007, Mem[0000000020800040] = 00ff65a8
	stb	%l6,[%o1+0x040]		! Mem[0000000020800040] = 07ff65a8
!	%l4 = 000000ff000000ff, Mem[00000000211c0001] = ffffd1d8, %asi = 80
	stba	%l4,[%o2+0x001]%asi	! Mem[00000000211c0000] = ffffd1d8
!	Mem[0000000010101425] = 00000eff, %l1 = ffffffffffffffff
	ldstub	[%i4+0x025],%l1		! %l1 = 0000000000000000
!	Mem[0000000010041408] = 000000ff, %l1 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081410] = ff800000, %l6 = 000080ff00000007
	ldstuba	[%i2+%o5]0x88,%l6	! %l6 = 0000000000000000
!	%l3 = ffffffffffffffff, Mem[0000000030141410] = fe9100ff
	stha	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = fe91ffff
!	Mem[0000000030041410] = 00000000, %l4 = 000000ff000000ff
	ldstuba	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000000
!	%l2 = 00000000fffff69b, Mem[000000001004142e] = 0000ffff, %asi = 80
	stha	%l2,[%i1+0x02e]%asi	! Mem[000000001004142c] = 0000f69b
!	%l5 = ffffffffffffffff, Mem[0000000030041408] = ff00000000000000
	stxa	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffffffffffff

p0_label_382:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ff00b0d1 0000ffff, %l2 = fffff69b, %l3 = ffffffff
	ldda	[%i6+%g0]0x80,%l2	! %l2 = 00000000ff00b0d1 000000000000ffff
!	%l3 = 000000000000ffff, %l1 = 00000000000000ff, %l2 = 00000000ff00b0d1
	addc	%l3,%l1,%l2		! %l2 = 00000000000100fe
!	Mem[0000000010041408] = 9272a57b 000000ff, %l4 = 00000000, %l5 = ffffffff
	ldda	[%i1+%o4]0x88,%l4	! %l4 = 00000000000000ff 000000009272a57b
!	Mem[00000000300c1410] = 8cb8512e, %l3 = 000000000000ffff
	ldsha	[%i3+%o5]0x81,%l3	! %l3 = ffffffffffff8cb8
!	Mem[00000000218000c0] = 00ff5a98, %l1 = 00000000000000ff, %asi = 80
	lduha	[%o3+0x0c0]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1410] = 2e51b88c, %l7 = 00000000000000ff
	ldsba	[%i3+%o5]0x89,%l7	! %l7 = ffffffffffffff8c
!	Mem[0000000010081408] = 0000006f, %f27 = 00ff15ff
	lda	[%i2+%o4]0x80,%f27	! %f27 = 0000006f
!	Mem[0000000030101408] = 00ff0000 00000000, %l2 = 000100fe, %l3 = ffff8cb8
	ldda	[%i4+%o4]0x81,%l2	! %l2 = 0000000000ff0000 0000000000000000
!	Mem[00000000300c1410] = 2e51b88c, %l4 = 00000000000000ff
	ldswa	[%i3+%o5]0x89,%l4	! %l4 = 000000002e51b88c
!	Mem[00000000211c0001] = ffffd1d8, %l2 = 0000000000ff0000
	ldub	[%o2+0x001],%l2		! %l2 = 00000000000000ff

p0_label_383:
!	Starting 10 instruction Store Burst
!	%l4 = 000000002e51b88c, Mem[0000000010101408] = ffffffff
	stwa	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = 2e51b88c
!	%f26 = ff000000 0000006f, Mem[0000000010001410] = 00000000 ff000000
	stda	%f26,[%i0+%o5]0x80	! Mem[0000000010001410] = ff000000 0000006f
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010001410] = ff000000 0000006f, %asi = 80
	stda	%l2,[%i0+0x010]%asi	! Mem[0000000010001410] = 000000ff 00000000
!	Mem[000000001004140c] = 7ba57292, %l3 = 0000000000000000
	swap	[%i1+0x00c],%l3		! %l3 = 000000007ba57292
!	%l2 = 00000000000000ff, Mem[0000000030101400] = ff000000
	stba	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = ff000000
!	Mem[0000000010101410] = 000080ff, %l5 = 000000009272a57b
	swapa	[%i4+%o5]0x80,%l5	! %l5 = 00000000000080ff
!	%l3 = 000000007ba57292, Mem[0000000010181410] = 9bf6ffff00000000
	stxa	%l3,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000007ba57292
!	%f24 = ffffffff, %f23 = f56cffff, %f5  = ff000000
	fmuls	%f24,%f23,%f5 		! %f5  = ffffffff
!	Mem[0000000010081420] = 000000ff0dc60e86, %l2 = 00000000000000ff, %l5 = 00000000000080ff
	add	%i2,0x20,%g1
	casxa	[%g1]0x80,%l2,%l5	! %l5 = 000000ff0dc60e86
!	%f0  = 00000000 ffffff87, %l3 = 000000007ba57292
!	Mem[0000000030041400] = ffff00000dc60e86
	stda	%f0,[%i1+%l3]ASI_PST32_S ! Mem[0000000030041400] = 000000000dc60e86

p0_label_384:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 860ec60d00000000, %l7 = ffffffffffffff8c
	ldxa	[%i1+%g0]0x89,%l7	! %l7 = 860ec60d00000000
!	Mem[0000000010101420] = 006cffff 00ff0eff, %l2 = 000000ff, %l3 = 7ba57292, %asi = 80
	ldda	[%i4+0x020]%asi,%l2	! %l2 = 00000000006cffff 0000000000ff0eff
!	Mem[0000000030101410] = 000000ff, %l3 = 0000000000ff0eff
	lduba	[%i4+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101408] = 2e51b88c, %l7 = 860ec60d00000000, %asi = 80
	lduba	[%i4+0x008]%asi,%l7	! %l7 = 000000000000002e
!	Mem[00000000100c1425] = 000000ff, %l7 = 000000000000002e, %asi = 80
	lduba	[%i3+0x025]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l1 = 00000000000000ff
	lduwa	[%i0+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l2 = 00000000006cffff
	ldsha	[%i5+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = ff000000, %l0 = 000000000000008c
	ldsha	[%i1+%o4]0x80,%l0	! %l0 = ffffffffffffff00
	membar	#Sync			! Added by membar checker (57)
!	Mem[0000000030001400] = 00000000 00000000 00000000 000000ff
!	Mem[0000000030001410] = 4a000000 ff000000 0000004a 5bd5464c
!	Mem[0000000030001420] = 00a3ffff 0dc60e86 ff000000 164d9eff
!	Mem[0000000030001430] = 00000000 000000ff cafaf8d3 c0000000
	ldda	[%i0+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030001400
!	Mem[0000000030101400] = ff000000, %l3 = 00000000000000ff
	ldsha	[%i4+%g0]0x81,%l3	! %l3 = ffffffffffffff00

p0_label_385:
!	Starting 10 instruction Store Burst
!	%l4 = 000000002e51b88c, Mem[0000000010081410] = ff8000ff
	stba	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = ff80008c
!	%l0 = ffffffffffffff00, Mem[0000000010041410] = 000080ff
	stwa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffff00
!	Mem[000000001000141c] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i0+0x01c]%asi,%l2	! %l2 = 0000000000000000
!	%f0  = 00000000 ffffff87, %l0 = ffffffffffffff00
!	Mem[0000000030041408] = ffffffffffffffff
	add	%i1,0x008,%g1
	stda	%f0,[%g1+%l0]ASI_PST16_S ! Mem[0000000030041408] = ffffffffffffffff
!	%l3 = ffffffffffffff00, Mem[0000000010041420] = ff0ec60d
	sth	%l3,[%i1+0x020]		! Mem[0000000010041420] = ff00c60d
!	Mem[0000000010001408] = ff000000, %l3 = 00000000ffffff00
	swapa	[%i0+%o4]0x80,%l3	! %l3 = 00000000ff000000
!	%l6 = 0000000000000000, Mem[000000001004140c] = 00000000, %asi = 80
	stwa	%l6,[%i1+0x00c]%asi	! Mem[000000001004140c] = 00000000
!	Mem[0000000030141410] = fe91ffff, %l2 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l2	! %l2 = 00000000fe91ffff
	membar	#Sync			! Added by membar checker (58)
!	%f19 = 000000ff, Mem[0000000030001400] = 00000000
	sta	%f19,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff
!	%f27 = 164d9eff, Mem[0000000030181410] = 00000000
	sta	%f27,[%i6+%o5]0x89	! Mem[0000000030181410] = 164d9eff

p0_label_386:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000000ff800000, %f22 = 0000004a 5bd5464c
	ldda	[%i5+%o5]0x81,%f22	! %f22 = 00000000 ff800000
!	Mem[000000001014142c] = c0000000, %l2 = 00000000fe91ffff, %asi = 80
	lduha	[%i5+0x02c]%asi,%l2	! %l2 = 000000000000c000
!	Mem[0000000030001400] = ff000000, %l5 = 000000ff0dc60e86
	lduha	[%i0+%g0]0x81,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030101408] = 0000ff00, %l5 = 000000000000ff00
	ldswa	[%i4+%o4]0x89,%l5	! %l5 = 000000000000ff00
!	Mem[00000000100c1400] = 000000ff, %l6 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181407] = 0000ffff, %l5 = 000000000000ff00, %asi = 80
	lduba	[%i6+0x007]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101410] = ff000000 ff000000, %l4 = 2e51b88c, %l5 = 000000ff
	ldda	[%i4+%o5]0x81,%l4	! %l4 = 00000000ff000000 00000000ff000000
!	%l6 = 0000000000000000, %l4 = 00000000ff000000, %l5 = 00000000ff000000
	sdivx	%l6,%l4,%l5		! %l5 = 0000000000000000
!	Mem[0000000030001400] = ff000000, %l2 = 000000000000c000
	ldsba	[%i0+%g0]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030101400] = 000000ff, %l1 = 0000000000000000
	ldsba	[%i4+%g0]0x89,%l1	! %l1 = ffffffffffffffff

p0_label_387:
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffffff00, Mem[0000000010001424] = 000000ff, %asi = 80
	stwa	%l0,[%i0+0x024]%asi	! Mem[0000000010001424] = ffffff00
!	Mem[0000000010141408] = e88c6fff, %l3 = 00000000ff000000
	swapa	[%i5+%o4]0x88,%l3	! %l3 = 00000000e88c6fff
!	Mem[0000000010081426] = 0dc60e86, %l2 = ffffffffffffffff
	ldstuba	[%i2+0x026]%asi,%l2	! %l2 = 000000000000000e
!	%l3 = 00000000e88c6fff, Mem[0000000010001408] = ffffff0000000000
	stxa	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000e88c6fff
!	%l3 = 00000000e88c6fff, Mem[0000000010141412] = 00000000, %asi = 80
	stha	%l3,[%i5+0x012]%asi	! Mem[0000000010141410] = 00006fff
!	Mem[0000000030181408] = 29f3d60c, %l3 = 00000000e88c6fff
	ldstuba	[%i6+%o4]0x81,%l3	! %l3 = 0000000000000029
!	Mem[0000000030181408] = fff3d60c, %l1 = 00000000ffffffff
	swapa	[%i6+%o4]0x81,%l1	! %l1 = 00000000fff3d60c
!	Mem[0000000010141400] = 00000000, %l1 = 00000000fff3d60c
	swapa	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%l0 = ffffffffffffff00, Mem[00000000218001c0] = ffffa358, %asi = 80
	stha	%l0,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = ff00a358
!	Mem[0000000010081410] = 8c0080ff, %l1 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l1	! %l1 = 000000000000008c

p0_label_388:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 0000ffff, %l3 = 0000000000000029
	lduwa	[%i3+%o4]0x89,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010081410] = ff8000ff, %l7 = 0000000000000000
	ldswa	[%i2+%o5]0x88,%l7	! %l7 = ffffffffff8000ff
!	Mem[0000000030101410] = ff000000, %l3 = 000000000000ffff
	ldsba	[%i4+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000300c1408] = ffff0000000000ff, %l3 = ffffffffffffffff
	ldxa	[%i3+%o4]0x81,%l3	! %l3 = ffff0000000000ff
!	Code Fragment 3, seed = 48935
p0_fragment_27:
!	%l0 = ffffffffffffff00
	setx	0xb5f3d7c6d9bc55ee,%g7,%l0 ! %l0 = b5f3d7c6d9bc55ee
!	%l1 = 000000000000008c
	setx	0xc25cf95fa435bf99,%g7,%l1 ! %l1 = c25cf95fa435bf99
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b5f3d7c6d9bc55ee
	setx	0x324eef4af0f49554,%g7,%l0 ! %l0 = 324eef4af0f49554
!	%l1 = c25cf95fa435bf99
	setx	0xff45dce2aa7a5a1f,%g7,%l1 ! %l1 = ff45dce2aa7a5a1f
p0_fragment_27_end:
!	Mem[0000000030101400] = ff000000, %l2 = 000000000000000e
	lduba	[%i4+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001400] = ff00000000000000, %f14 = 0000006f 0000004a
	ldda	[%i0+%g0]0x81,%f14	! %f14 = ff000000 00000000
!	Mem[0000000010081408] = 0000006f, %l3 = ffff0000000000ff
	ldsba	[%i2+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181430] = 1cc528c5ff6f8ce8, %f30 = cafaf8d3 c0000000, %asi = 80
	ldda	[%i6+0x030]%asi,%f30	! %f30 = 1cc528c5 ff6f8ce8
!	Mem[0000000010081400] = ff000000 00ff00ff, %l0 = f0f49554, %l1 = aa7a5a1f
	ldda	[%i2+%g0]0x80,%l0	! %l0 = 00000000ff000000 0000000000ff00ff

p0_label_389:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 00000000, %l4 = 00000000ff000000
	swapa	[%i2+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041400] = ffff0000, %l3 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l3	! %l3 = 00000000ffff0000
!	Mem[000000001000143c] = 00000000, %l1 = 0000000000ff00ff
	ldsw	[%i0+0x03c],%l1		! %l1 = 0000000000000000
!	Mem[0000000010141410] = ff6f0000, %l7 = ffffffffff8000ff
	ldstuba	[%i5+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081400] = 000000ff, %l4 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000020800001] = 00fff578, %l7 = 0000000000000000
	ldstuba	[%o1+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	%l3 = 00000000ffff0000, Mem[0000000030041408] = ffffffffffffffff
	stxa	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000ffff0000
!	%f24 = 00a3ffff, Mem[0000000030181410] = ff9e4d16
	sta	%f24,[%i6+%o5]0x81	! Mem[0000000030181410] = 00a3ffff
!	Mem[0000000030101410] = 000000ff, %l0 = 00000000ff000000
	swapa	[%i4+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%f24 = 00a3ffff 0dc60e86, Mem[0000000010081410] = ff0080ff 00000000, %asi = 80
	stda	%f24,[%i2+0x010]%asi	! Mem[0000000010081410] = 00a3ffff 0dc60e86

p0_label_390:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 8cb8512e, %l6 = 0000000000000000
	lduha	[%i3+%o5]0x81,%l6	! %l6 = 0000000000008cb8
!	Mem[0000000030101410] = 000000ffff000000, %l5 = 0000000000000000
	ldxa	[%i4+%o5]0x89,%l5	! %l5 = 000000ffff000000
!	Mem[0000000030081400] = 00000000, %l3 = 00000000ffff0000
	lduba	[%i2+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1400] = 000000ff 00000000, %l6 = 00008cb8, %l7 = 000000ff
	ldda	[%i3+%g0]0x80,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Mem[0000000030041400] = 00000000, %l0 = 00000000000000ff
	lduha	[%i1+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l1 = 0000000000000000
	ldsha	[%i1+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = 9272a57b, %l3 = 0000000000000000
	ldsba	[%i4+%o5]0x80,%l3	! %l3 = ffffffffffffff92
!	Mem[0000000010041408] = 00000000000000ff, %f4  = 00000000 ffffffff
	ldda	[%i1+%o4]0x88,%f4 	! %f4  = 00000000 000000ff
!	Mem[0000000030081400] = 0000000000000000, %l6 = 00000000000000ff
	ldxa	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = 000000ff00000000, %l6 = 0000000000000000
	ldxa	[%i0+%o5]0x80,%l6	! %l6 = 000000ff00000000

p0_label_391:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010041410] = 00ffffff
	stba	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = 00ffff00
!	%l2 = 00000000000000ff, Mem[0000000010001410] = ff000000
	stwa	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000ff
!	Mem[0000000030001400] = ff000000, %l5 = 000000ffff000000
	ldstuba	[%i0+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	%f27 = 164d9eff, Mem[0000000010101408] = 8cb8512e
	sta	%f27,[%i4+%o4]0x88	! Mem[0000000010101408] = 164d9eff
!	%f18 = 00000000 000000ff, %l5 = 00000000000000ff
!	Mem[0000000010001420] = 9272a57bffffff00
	add	%i0,0x020,%g1
	stda	%f18,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010001420] = ff00000000000000
!	%l0 = 0000000000000000, Mem[0000000030041408] = 00000000
	stba	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	Mem[00000000201c0001] = ffff8148, %l3 = ffffffffffffff92
	ldstub	[%o0+0x001],%l3		! %l3 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000030041410] = 000000ff
	stba	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff
!	Mem[0000000010081408] = 6f000000, %l6 = 000000ff00000000
	ldstuba	[%i2+%o4]0x88,%l6	! %l6 = 0000000000000000
!	%f22 = 00000000 ff800000, Mem[0000000010041410] = 00ffff00 00000007, %asi = 80
	stda	%f22,[%i1+0x010]%asi	! Mem[0000000010041410] = 00000000 ff800000

p0_label_392:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000, %l3 = 00000000000000ff
	ldsba	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1400] = 00000000 ff000000, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i3+%g0]0x88,%l2	! %l2 = 00000000ff000000 0000000000000000
!	Mem[0000000010101408] = ff9e4d16, %l3 = 0000000000000000
	ldsha	[%i4+%o4]0x80,%l3	! %l3 = ffffffffffffff9e
!	Mem[0000000010001400] = ff000000000000ff, %f10 = ffffffff ffffff87
	ldda	[%i0+%g0]0x80,%f10	! %f10 = ff000000 000000ff
!	Mem[0000000010001400] = 000000ff, %l3 = ffffffffffffff9e
	ldsba	[%i0+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101410] = ffff0000 7ba57292, %l4 = 000000ff, %l5 = 000000ff
	ldda	[%i4+%o5]0x88,%l4	! %l4 = 000000007ba57292 00000000ffff0000
!	Mem[0000000010101410] = 9272a57b0000ffff, %f26 = ff000000 164d9eff
	ldda	[%i4+%o5]0x80,%f26	! %f26 = 9272a57b 0000ffff
!	Mem[0000000010041430] = ff000000 00000000, %l0 = 00000000, %l1 = 00000000, %asi = 80
	ldda	[%i1+0x030]%asi,%l0	! %l0 = 00000000ff000000 0000000000000000
!	Mem[0000000010181428] = ff15ff00000000ff, %f6  = 0000ff00 00000000, %asi = 80
	ldda	[%i6+0x028]%asi,%f6 	! %f6  = ff15ff00 000000ff
!	Mem[00000000201c0000] = ffff8148, %l2 = 00000000ff000000, %asi = 80
	lduba	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff

p0_label_393:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 20fcffff, %l0 = 00000000ff000000
	swapa	[%i6+%g0]0x89,%l0	! %l0 = 0000000020fcffff
!	%l3 = ffffffffffffffff, Mem[00000000100c1410] = 92000000000080ff
	stxa	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffffffffffffffff
!	%l4 = 7ba57292, %l5 = ffff0000, Mem[0000000010101400] = 6f000000 228affff
	stda	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 7ba57292 ffff0000
!	%f8  = 6f000000 228affff, Mem[0000000010081410] = 00a3ffff 0dc60e86
	stda	%f8 ,[%i2+%o5]0x80	! Mem[0000000010081410] = 6f000000 228affff
!	%f0  = 00000000 ffffff87, %l4 = 000000007ba57292
!	Mem[0000000010041400] = 00000000fffffc20
	stda	%f0,[%i1+%l4]ASI_PST8_PL ! Mem[0000000010041400] = 00ff000000fffc00
!	%l4 = 7ba57292, %l5 = ffff0000, Mem[00000000100c1400] = ff000000 00000000
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 7ba57292 ffff0000
!	%l0 = 20fcffff, %l1 = 00000000, Mem[0000000010001408] = 00000000 ff6f8ce8
	stda	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 20fcffff 00000000
!	%l5 = 00000000ffff0000, Mem[00000000300c1408] = ffff0000
	stha	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	%l2 = 000000ff, %l3 = ffffffff, Mem[0000000010041418] = ff6f8ce8 f44b4200
	std	%l2,[%i1+0x018]		! Mem[0000000010041418] = 000000ff ffffffff
!	Mem[0000000030041400] = 00000000 0dc60e86 00000000 ffff0000
!	%f0  = 00000000 ffffff87 ff000000 00000000
!	%f4  = 00000000 000000ff ff15ff00 000000ff
!	%f8  = 6f000000 228affff ff000000 000000ff
!	%f12 = 87ffffff 00000000 ff000000 00000000
	stda	%f0 ,[%i1+%g0]ASI_COMMIT_S	! Block Store to 0000000030041400

p0_label_394:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (59)
!	Mem[0000000010041408] = ff000000, %l6 = 0000000000000000
	ldsha	[%i1+%o4]0x80,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000030081410] = 87ffffff 000000ff, %l4 = 7ba57292, %l5 = ffff0000
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 00000000000000ff 0000000087ffffff
!	Mem[0000000010101408] = 000000ff 164d9eff, %l0 = 20fcffff, %l1 = 00000000
	ldda	[%i4+%o4]0x88,%l0	! %l0 = 00000000164d9eff 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010081408] = 6f0000ff
	stba	%l7,[%i2+%o4]0x88	! Mem[0000000010081408] = 6f000000
!	Mem[00000000218000c0] = 00ff5a98, %l1 = 00000000000000ff, %asi = 80
	ldsha	[%o3+0x0c0]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030041410] = 00000000, %l4 = 00000000000000ff
	lduwa	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000020800040] = 07ff65a8, %l4 = 0000000000000000
	lduh	[%o1+0x040],%l4		! %l4 = 00000000000007ff
!	Mem[0000000030041410] = ff00000000000000, %f28 = 00000000 000000ff
	ldda	[%i1+%o5]0x89,%f28	! %f28 = ff000000 00000000
!	Mem[0000000030041400] = 00000000, %l0 = 00000000164d9eff
	ldswa	[%i1+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l4 = 00000000000007ff
	ldsba	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000000

p0_label_395:
!	Starting 10 instruction Store Burst
!	%f12 = 87ffffff 00000000, %l4 = 0000000000000000
!	Mem[0000000030181400] = 000000ff000080ff
	stda	%f12,[%i6+%l4]ASI_PST16_SL ! Mem[0000000030181400] = 000000ff000080ff
!	%f19 = 000000ff, Mem[0000000010101428] = 00000000
	sta	%f19,[%i4+0x028]%asi	! Mem[0000000010101428] = 000000ff
!	Mem[0000000010181423] = ff97045e, %l7 = 0000000000000000
	ldstub	[%i6+0x023],%l7		! %l7 = 000000000000005e
!	%f25 = 0dc60e86, Mem[0000000030081400] = 00000000
	sta	%f25,[%i2+%g0]0x89	! Mem[0000000030081400] = 0dc60e86
!	%l0 = 0000000000000000, Mem[00000000100c1431] = ff6f8ce8, %asi = 80
	stba	%l0,[%i3+0x031]%asi	! Mem[00000000100c1430] = ff008ce8
!	Mem[0000000030141410] = 00000000, %l7 = 000000000000005e
	swapa	[%i5+%o5]0x89,%l7	! %l7 = 0000000000000000
!	%l5 = 0000000087ffffff, Mem[0000000010101400] = 9272a57b
	stwa	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = 87ffffff
!	%l5 = 0000000087ffffff, Mem[00000000100c1410] = ffffffff
	stba	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffffffff
!	%l2 = 00000000000000ff, Mem[00000000300c1408] = ff00000000000000
	stxa	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000000000ff
!	Mem[0000000010101408] = 164d9eff, %l7 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l7	! %l7 = 00000000000000ff

p0_label_396:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00fcff000000ff00, %f20 = 4a000000 ff000000
	ldda	[%i1+%g0]0x88,%f20	! %f20 = 00fcff00 0000ff00
!	Mem[0000000010181400] = d1b000ff, %l1 = 00000000000000ff
	lduba	[%i6+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001410] = 000000ff0000004a, %l2 = 00000000000000ff
	ldxa	[%i0+%o5]0x89,%l2	! %l2 = 000000ff0000004a
!	Mem[0000000010081438] = 5e0497ffffffa391, %f28 = ff000000 00000000
	ldd	[%i2+0x038],%f28	! %f28 = 5e0497ff ffffa391
!	Mem[0000000010041410] = 00000000, %l5 = 0000000087ffffff
	lduwa	[%i1+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = 000000ff, %f23 = ff800000
	lda	[%i4+%g0]0x89,%f23	! %f23 = 000000ff
!	Mem[00000000211c0000] = ffffd1d8, %l4 = 0000000000000000
	lduh	[%o2+%g0],%l4		! %l4 = 000000000000ffff
!	Mem[0000000030181400] = ff000000, %l7 = 00000000000000ff
	lduba	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081438] = 5e0497ff, %l6 = ffffffffffffff00
	lduh	[%i2+0x038],%l6		! %l6 = 0000000000005e04
!	Mem[00000000300c1408] = 00000000 000000ff, %l6 = 00005e04, %l7 = 00000000
	ldda	[%i3+%o4]0x89,%l6	! %l6 = 00000000000000ff 0000000000000000

p0_label_397:
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000ffff, imm = 0000000000000ec3, %l2 = 000000ff0000004a
	and	%l4,0xec3,%l2		! %l2 = 0000000000000ec3
!	%l1 = 00000000000000ff, Mem[0000000010141438] = 57fbe2ff
	stw	%l1,[%i5+0x038]		! Mem[0000000010141438] = 000000ff
!	%l1 = 00000000000000ff, Mem[0000000030001400] = 000000ff
	stba	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff
!	Mem[0000000030001410] = 0000004a, %l1 = 00000000000000ff
	swapa	[%i0+%o5]0x89,%l1	! %l1 = 000000000000004a
!	%f18 = 00000000, Mem[00000000300c1408] = ff000000
	sta	%f18,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	Mem[0000000030001400] = 000000ff, %l1 = 000000000000004a
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000030041410] = 00000000 000000ff
	stda	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 000000ff
!	Mem[00000000300c1400] = ff00ffff, %l5 = 0000000000000000
	swapa	[%i3+%g0]0x89,%l5	! %l5 = 00000000ff00ffff
!	Mem[00000000300c1410] = 2e51b88c, %l3 = 00000000ffffffff
	swapa	[%i3+%o5]0x89,%l3	! %l3 = 000000002e51b88c
!	%l2 = 0000000000000ec3, Mem[0000000010181400] = ff00b0d10000ffff
	stxa	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000000000000ec3

p0_label_398:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00ff000000fffc00, %l6 = 00000000000000ff
	ldxa	[%i1+%g0]0x80,%l6	! %l6 = 00ff000000fffc00
!	Mem[0000000010081410] = 6f000000, %l2 = 0000000000000ec3
	ldswa	[%i2+%o5]0x80,%l2	! %l2 = 000000006f000000
!	%l1 = 00000000000000ff, %l1 = 00000000000000ff, %l1 = 00000000000000ff
	sub	%l1,%l1,%l1		! %l1 = 0000000000000000
!	%f5  = 000000ff, %f13 = 00000000, %f6  = ff15ff00 000000ff
	fsmuld	%f5 ,%f13,%f6 		! %f6  = 00000000 00000000
!	Mem[0000000010081410] = 6f000000228affff, %f28 = 5e0497ff ffffa391
	ldd	[%i2+%o5],%f28		! %f28 = 6f000000 228affff
!	Mem[0000000030181400] = 000000ff, %f21 = 0000ff00
	lda	[%i6+%g0]0x81,%f21	! %f21 = 000000ff
!	Mem[0000000010041408] = 000000ff, %f31 = ff6f8ce8
	lda	[%i1+%o4]0x88,%f31	! %f31 = 000000ff
!	Mem[0000000030001410] = ff000000ff000000, %f2  = ff000000 00000000
	ldda	[%i0+%o5]0x81,%f2 	! %f2  = ff000000 ff000000
!	Mem[0000000010181410] = 00000000, %f18 = 00000000
	lda	[%i6+0x010]%asi,%f18	! %f18 = 00000000
!	Mem[00000000201c0000] = ffff8148, %l4 = 000000000000ffff
	ldub	[%o0+%g0],%l4		! %l4 = 00000000000000ff

p0_label_399:
!	Starting 10 instruction Store Burst
!	%f8  = 6f000000 228affff, %l3 = 000000002e51b88c
!	Mem[0000000030081400] = 860ec60d00000000
	stda	%f8,[%i2+%l3]ASI_PST8_SL ! Mem[0000000030081400] = 860e8a220000006f
!	Mem[00000000211c0001] = ffffd1d8, %l2 = 000000006f000000
	ldstub	[%o2+0x001],%l2		! %l2 = 00000000000000ff
!	Mem[0000000030001410] = 000000ff, %l0 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141428] = ffffff87c0000000, %l2 = 00000000000000ff, %l5 = 00000000ff00ffff
	add	%i5,0x28,%g1
	casxa	[%g1]0x80,%l2,%l5	! %l5 = ffffff87c0000000
!	%l1 = 0000000000000000, Mem[0000000010101426] = 00ff0eff
	sth	%l1,[%i4+0x026]		! Mem[0000000010101424] = 00ff0000
!	%f27 = 0000ffff, Mem[0000000010001410] = 000000ff
	sta	%f27,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000ffff
!	%f22 = 00000000, Mem[0000000010181400] = 00000000
	sta	%f22,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	%f30 = 1cc528c5 000000ff, %l5 = ffffff87c0000000
!	Mem[0000000030081418] = ffff6cf55e0497ff
	add	%i2,0x018,%g1
	stda	%f30,[%g1+%l5]ASI_PST16_SL ! Mem[0000000030081418] = ffff6cf55e0497ff
!	%l5 = ffffff87c0000000, Mem[0000000010081408] = 0000006f
	stw	%l5,[%i2+%o4]		! Mem[0000000010081408] = c0000000
!	Mem[000000001010140f] = ff000000, %l5 = ffffff87c0000000
	ldstuba	[%i4+0x00f]%asi,%l5	! %l5 = 0000000000000000

p0_label_400:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00000000 ffffffff, %l2 = 000000ff, %l3 = 2e51b88c
	ldda	[%i6+%o4]0x89,%l2	! %l2 = 00000000ffffffff 0000000000000000
!	Mem[0000000030101410] = 000000ff, %l4 = 00000000000000ff
	lduha	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181400] = 0000000000000ec3, %l2 = 00000000ffffffff
	ldxa	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000ec3
!	Mem[00000000300c1410] = ffffffff, %l6 = 00ff000000fffc00
	ldswa	[%i3+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000100c1404] = 0000ffff, %l5 = 0000000000000000
	ldsb	[%i3+0x004],%l5		! %l5 = 0000000000000000
!	Mem[0000000010141410] = ff6f00ff, %l1 = 0000000000000000
	lduwa	[%i5+%o5]0x88,%l1	! %l1 = 00000000ff6f00ff
!	Mem[0000000010101408] = ff0000ff164d9eff, %l4 = 0000000000000000
	ldxa	[%i4+%o4]0x88,%l4	! %l4 = ff0000ff164d9eff
!	Mem[0000000010001400] = ff000000, %f24 = 00a3ffff
	ld	[%i0+%g0],%f24		! %f24 = ff000000
!	Mem[0000000010141400] = fff3d60c, %l5 = 0000000000000000
	lduw	[%i5+%g0],%l5		! %l5 = 00000000fff3d60c
!	Mem[0000000030181408] = ffffffff, %l6 = ffffffffffffffff
	lduba	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff

p0_label_401:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[0000000030041408] = 000000ff
	stwa	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000ff
!	Mem[00000000100c1416] = ffffffff, %l4 = ff0000ff164d9eff
	ldstub	[%i3+0x016],%l4		! %l4 = 00000000000000ff
!	Mem[00000000300c1400] = 00000000, %l5 = 00000000fff3d60c
	swapa	[%i3+%g0]0x81,%l5	! %l5 = 0000000000000000
!	%f30 = 1cc528c5 000000ff, Mem[0000000010041408] = ff000000 00000000
	stda	%f30,[%i1+%o4]0x80	! Mem[0000000010041408] = 1cc528c5 000000ff
!	%f14 = ff000000 00000000, %l7 = 0000000000000000
!	Mem[0000000030141410] = 5e000000ff800000
	add	%i5,0x010,%g1
	stda	%f14,[%g1+%l7]ASI_PST16_S ! Mem[0000000030141410] = 5e000000ff800000
!	Mem[000000001010142e] = ec7a0000, %l7 = 0000000000000000
	ldstub	[%i4+0x02e],%l7		! %l7 = 0000000000000000
!	Mem[0000000010001410] = ffff000000000000, %l4 = 00000000000000ff, %l4 = 00000000000000ff
	add	%i0,0x10,%g1
	casxa	[%g1]0x80,%l4,%l4	! %l4 = ffff000000000000
!	%f22 = 00000000 000000ff, %l6 = 00000000000000ff
!	Mem[00000000100c1410] = ffffffffffffffff
	add	%i3,0x010,%g1
	stda	%f22,[%g1+%l6]ASI_PST32_P ! Mem[00000000100c1410] = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000021800140] = ff0006f8
	sth	%l0,[%o3+0x140]		! Mem[0000000021800140] = 00ff06f8
!	%l1 = 00000000ff6f00ff, Mem[0000000010001410] = ffff000000000000
	stxa	%l1,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000ff6f00ff

p0_label_402:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000, %f6  = 00000000
	lda	[%i0+%o5]0x80,%f6 	! %f6 = 00000000
!	Mem[0000000010181410] = 9272a57b00000000, %f20 = 00fcff00 000000ff
	ldda	[%i6+%o5]0x88,%f20	! %f20 = 9272a57b 00000000
!	Mem[0000000030141408] = 8ce80080, %l7 = 0000000000000000
	ldsha	[%i5+%o4]0x81,%l7	! %l7 = ffffffffffff8ce8
!	Mem[0000000030141400] = 42000000ff8000ff, %l0 = 00000000000000ff
	ldxa	[%i5+%g0]0x89,%l0	! %l0 = 42000000ff8000ff
!	Mem[0000000030101410] = 000000ff, %l7 = ffffffffffff8ce8
	lduwa	[%i4+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041400] = 0000ff00, %f18 = 00000000
	lda	[%i1+%g0]0x88,%f18	! %f18 = 0000ff00
!	Mem[0000000030181410] = 00a3ffff, %l3 = 0000000000000000
	lduba	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101410] = ffff00007ba57292, %l2 = 0000000000000ec3
	ldxa	[%i4+%o5]0x88,%l2	! %l2 = ffff00007ba57292
!	Mem[0000000010081408] = 000000c0, %f21 = 00000000
	lda	[%i2+%o4]0x88,%f21	! %f21 = 000000c0
!	Mem[0000000010001408] = fffffc20, %l2 = ffff00007ba57292
	lduba	[%i0+%o4]0x80,%l2	! %l2 = 00000000000000ff

p0_label_403:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = ff000000, %l4 = ffff000000000000
	ldstuba	[%i0+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000030001400] = 000000ff
	stha	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	Mem[0000000030101408] = 00ff0000, %l7 = 00000000000000ff
	swapa	[%i4+%o4]0x81,%l7	! %l7 = 0000000000ff0000
!	Mem[000000001014141d] = 00000000, %l0 = 42000000ff8000ff
	ldstub	[%i5+0x01d],%l0		! %l0 = 0000000000000000
!	%l7 = 0000000000ff0000, Mem[0000000020800000] = 00fff578
	stb	%l7,[%o1+%g0]		! Mem[0000000020800000] = 00fff578
!	Mem[0000000010081410] = 6f000000, %l7 = 0000000000ff0000
	ldstuba	[%i2+%o5]0x80,%l7	! %l7 = 000000000000006f
!	Mem[0000000010181404] = 00000ec3, %l1 = ff6f00ff, %l7 = 0000006f
	add	%i6,0x04,%g1
	casa	[%g1]0x80,%l1,%l7	! %l7 = 0000000000000ec3
!	%l4 = 00000000000000ff, Mem[00000000100c1410] = 00000000
	stwa	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000ff
!	%l0 = 00000000, %l1 = ff6f00ff, Mem[0000000010101420] = 006cffff 00ff0000
	std	%l0,[%i4+0x020]		! Mem[0000000010101420] = 00000000 ff6f00ff
!	Mem[00000000100c1400] = 9272a57b, %l1 = 00000000ff6f00ff
	ldstuba	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000092

p0_label_404:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ff6f00ff, %l1 = 0000000000000092
	ldsba	[%i5+%o5]0x88,%l1	! %l1 = ffffffffffffffff
!	%f15 = 00000000, %f20 = 9272a57b
	fcmpes	%fcc3,%f15,%f20		! %fcc3 = 2
!	Mem[0000000030141410] = 5e000000, %l0 = 0000000000000000
	lduba	[%i5+%o5]0x81,%l0	! %l0 = 000000000000005e
!	Mem[0000000030141410] = 5e000000, %l2 = 00000000000000ff
	lduwa	[%i5+%o5]0x81,%l2	! %l2 = 000000005e000000
!	Mem[0000000030081408] = 00000000fffffc20, %f12 = 87ffffff 00000000
	ldda	[%i2+%o4]0x89,%f12	! %f12 = 00000000 fffffc20
!	%f19 = 000000ff, %f20 = 9272a57b, %f23 = 000000ff
	fsubs	%f19,%f20,%f23		! tt=0x22, %l0 = 0000000000000080
!	Mem[0000000010001428] = 00ff0000, %l7 = 0000000000000ec3
	ldsb	[%i0+0x028],%l7		! %l7 = 0000000000000000
!	Mem[000000001000142c] = ff000000, %f31 = 000000ff
	lda	[%i0+0x02c]%asi,%f31	! %f31 = ff000000
!	Mem[00000000100c1400] = ff72a57b, %l6 = 00000000000000ff
	ldsba	[%i3+%g0]0x80,%l6	! %l6 = ffffffffffffffff
!	%l3 = 0000000000000000, %l2 = 000000005e000000, %y  = 2e51b6d8
	smul	%l3,%l2,%l4		! %l4 = 0000000000000000, %y = 00000000

p0_label_405:
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffffff, Mem[0000000030001400] = 00000000
	stha	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = ffff0000
!	%l0 = 00000080, %l1 = ffffffff, Mem[0000000010181410] = 00000000 9272a57b
	stda	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000080 ffffffff
!	%f12 = 00000000 fffffc20, %l1 = ffffffffffffffff
!	Mem[0000000010101430] = 0000000000000000
	add	%i4,0x030,%g1
	stda	%f12,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010101430] = 20fcffff00000000
!	%f14 = ff000000 00000000, Mem[0000000030101410] = 000000ff ff000000
	stda	%f14,[%i4+%o5]0x81	! Mem[0000000030101410] = ff000000 00000000
!	Mem[0000000010141410] = ff006fff, %l7 = 0000000000000000
	swapa	[%i5+%o5]0x80,%l7	! %l7 = 00000000ff006fff
!	%l2 = 5e000000, %l3 = 00000000, Mem[0000000030101410] = 000000ff 00000000
	stda	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 5e000000 00000000
!	Mem[0000000030181400] = ff000000, %l0 = 0000000000000080
	ldstuba	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101410] = 9272a57b0000ffff, %l1 = ffffffffffffffff, %l6 = ffffffffffffffff
	add	%i4,0x10,%g1
	casxa	[%g1]0x80,%l1,%l6	! %l6 = 9272a57b0000ffff
!	Mem[0000000010001410] = 00000000, %l2 = 000000005e000000
	swapa	[%i0+%o5]0x80,%l2	! %l2 = 0000000000000000
!	%f30 = 1cc528c5, Mem[00000000300c1400] = 0cd6f3ff
	sta	%f30,[%i3+%g0]0x89	! Mem[00000000300c1400] = 1cc528c5

p0_label_406:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffffd1d8, %l0 = 0000000000000000
	lduh	[%o2+%g0],%l0		! %l0 = 000000000000ffff
!	Mem[0000000010181410] = 80000000ffffffff, %l0 = 000000000000ffff, %asi = 80
	ldxa	[%i6+0x010]%asi,%l0	! %l0 = 80000000ffffffff
!	Mem[0000000030181400] = ff0000ff, %l3 = 0000000000000000
	ldsha	[%i6+%g0]0x81,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000010101400] = 87ffffff, %f11 = 000000ff
	lda	[%i4+%g0]0x88,%f11	! %f11 = 87ffffff
!	Mem[0000000021800000] = ff9a3a08, %l6 = 9272a57b0000ffff
	ldsh	[%o3+%g0],%l6		! %l6 = ffffffffffffff9a
!	Mem[0000000010001400] = ff000000 000000ff, %l2 = 00000000, %l3 = ffffff00
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 00000000ff000000 00000000000000ff
!	Mem[0000000010081410] = ff000000, %f20 = 9272a57b
	lda	[%i2+%o5]0x80,%f20	! %f20 = ff000000
!	Code Fragment 3, seed = 178694
p0_fragment_28:
!	%l0 = 80000000ffffffff
	setx	0x196c7858d1188df6,%g7,%l0 ! %l0 = 196c7858d1188df6
!	%l1 = ffffffffffffffff
	setx	0xb16c96285b431921,%g7,%l1 ! %l1 = b16c96285b431921
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 196c7858d1188df6
	setx	0xe222294d08a7585c,%g7,%l0 ! %l0 = e222294d08a7585c
!	%l1 = b16c96285b431921
	setx	0x92bdb2e93d344ea7,%g7,%l1 ! %l1 = 92bdb2e93d344ea7
p0_fragment_28_end:
!	%f2  = ff000000, %f27 = 0000ffff, %f20 = ff000000
	fadds	%f2 ,%f27,%f20		! tt=0x22, %l0 = e222294d08a7587e
!	Mem[00000000100c1408] = ff000000 92000000, %l6 = ffffff9a, %l7 = ff006fff
	ldda	[%i3+%o4]0x80,%l6	! %l6 = 00000000ff000000 0000000092000000

p0_label_407:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000092000000, Mem[0000000010181410] = 80000000
	stba	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	Mem[0000000010101410] = 9272a57b, %l1 = 000000003d344ea7
	swapa	[%i4+%o5]0x80,%l1	! %l1 = 000000009272a57b
!	%f12 = 00000000 fffffc20, %l5 = 0000000000000000
!	Mem[0000000010041408] = 1cc528c5000000ff
	add	%i1,0x008,%g1
	stda	%f12,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010041408] = 1cc528c5000000ff
!	%l4 = 0000000000000000, Mem[0000000010081408] = c0000000
	stba	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	%l2 = ff000000, %l3 = 000000ff, Mem[0000000030181400] = ff0000ff 000080ff
	stda	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = ff000000 000000ff
!	%l3 = 00000000000000ff, Mem[0000000010081400] = 000000ff
	stwa	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff
!	%l0 = 08a7587e, %l1 = 9272a57b, Mem[0000000010041410] = 00000000 000080ff
	stda	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 08a7587e 9272a57b
!	Mem[0000000030041400] = 00000000, %l0 = e222294d08a7587e
	ldstuba	[%i1+%g0]0x89,%l0	! %l0 = 0000000000000000
!	%f10 = ff000000 87ffffff, Mem[0000000030081408] = fffffc20 00000000
	stda	%f10,[%i2+%o4]0x89	! Mem[0000000030081408] = ff000000 87ffffff
!	%f30 = 1cc528c5, Mem[0000000030101408] = ff000000
	sta	%f30,[%i4+%o4]0x89	! Mem[0000000030101408] = 1cc528c5

p0_label_408:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0001] = ffff8148, %l2 = 00000000ff000000, %asi = 80
	lduba	[%o0+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181410] = 00a3fffffe918a22, %l4 = 0000000000000000
	ldxa	[%i6+%o5]0x81,%l4	! %l4 = 00a3fffffe918a22
!	Mem[0000000010101400] = ffffff87, %l0 = 0000000000000000
	ldswa	[%i4+%g0]0x80,%l0	! %l0 = ffffffffffffff87
!	Mem[0000000020800000] = 00fff578, %l5 = 0000000000000000, %asi = 80
	ldsba	[%o1+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l1 = 000000009272a57b
	ldsba	[%i2+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = 87ffffff, %l0 = ffffffffffffff87
	lduba	[%i4+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101410] = 5e000000, %l1 = 0000000000000000
	lduba	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = 00fcff000000ff00, %l0 = 00000000000000ff
	ldxa	[%i1+%g0]0x88,%l0	! %l0 = 00fcff000000ff00
!	Mem[0000000010181400] = c30e0000 00000000, %l2 = 000000ff, %l3 = 000000ff
	ldda	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000000 00000000c30e0000
!	Mem[0000000020800040] = 07ff65a8, %l4 = 00a3fffffe918a22, %asi = 80
	lduba	[%o1+0x040]%asi,%l4	! %l4 = 0000000000000007

p0_label_409:
!	Starting 10 instruction Store Burst
!	%f18 = 0000ff00 000000ff, %l2 = 0000000000000000
!	Mem[0000000030141410] = 5e000000ff800000
	add	%i5,0x010,%g1
	stda	%f18,[%g1+%l2]ASI_PST32_S ! Mem[0000000030141410] = 5e000000ff800000
!	%l4 = 0000000000000007, Mem[0000000030101408] = 000000001cc528c5
	stxa	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000007
!	%f8  = 6f000000 228affff, Mem[0000000010081400] = 000000ff ff00ff00
	stda	%f8 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 6f000000 228affff
!	Mem[0000000010081400] = 228affff, %l1 = 0000000000000000
	ldstuba	[%i2+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[0000000030181408] = ffffffff
	stha	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 00ffffff
!	Mem[0000000010101410] = a74e343d, %l4 = 0000000000000007
	swapa	[%i4+%o5]0x88,%l4	! %l4 = 00000000a74e343d
!	%f2  = ff000000, Mem[0000000030181408] = ffffff00
	sta	%f2 ,[%i6+%o4]0x89	! Mem[0000000030181408] = ff000000
!	%f30 = 1cc528c5 ff000000, Mem[0000000010141400] = fff3d60c 00000000
	stda	%f30,[%i5+%g0]0x80	! Mem[0000000010141400] = 1cc528c5 ff000000
!	%l6 = ff000000, %l7 = 92000000, Mem[0000000010101438] = ffff6c00 00000000, %asi = 80
	stda	%l6,[%i4+0x038]%asi	! Mem[0000000010101438] = ff000000 92000000
!	%l6 = ff000000, %l7 = 92000000, Mem[0000000010081410] = ff000000 228affff
	stda	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = ff000000 92000000

p0_label_410:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ffff00007ba572ff, %f14 = ff000000 00000000
	ldda	[%i3+%g0]0x88,%f14	! %f14 = ffff0000 7ba572ff
!	Mem[0000000030101400] = 000000ff, %l0 = 00fcff000000ff00
	ldsba	[%i4+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030081408] = ffffff87, %l4 = 00000000a74e343d
	ldsba	[%i2+%o4]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000021800081] = 0000fe68, %l2 = 0000000000000000
	ldub	[%o3+0x081],%l2		! %l2 = 0000000000000000
!	Mem[0000000010081439] = 5e0497ff, %l0 = ffffffffffffffff
	ldsb	[%i2+0x039],%l0		! %l0 = 0000000000000004
!	Mem[00000000100c1400] = ff72a57b, %l2 = 0000000000000000
	ldswa	[%i3+%g0]0x80,%l2	! %l2 = ffffffffff72a57b
!	Mem[0000000010081411] = ff000000, %l0 = 0000000000000004, %asi = 80
	lduba	[%i2+0x011]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101408] = 164d9eff, %l7 = 0000000092000000
	lduwa	[%i4+%o4]0x88,%l7	! %l7 = 00000000164d9eff
!	Mem[00000000100c1400] = ff72a57b, %l4 = ffffffffffffffff
	lduha	[%i3+%g0]0x80,%l4	! %l4 = 000000000000ff72
!	Mem[0000000030101400] = ff00000000000000, %l5 = 0000000000000000
	ldxa	[%i4+%g0]0x81,%l5	! %l5 = ff00000000000000

p0_label_411:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 0000ffff, %l3 = 00000000c30e0000
	swapa	[%i0+%g0]0x89,%l3	! %l3 = 000000000000ffff
!	%l2 = ff72a57b, %l3 = 0000ffff, Mem[0000000010181438] = 00ff0000 00000000, %asi = 80
	stda	%l2,[%i6+0x038]%asi	! Mem[0000000010181438] = ff72a57b 0000ffff
!	Mem[0000000010081424] = 0dc6ff86, %l4 = 000000000000ff72
	swap	[%i2+0x024],%l4		! %l4 = 000000000dc6ff86
!	%l1 = 00000000000000ff, Mem[0000000030101400] = ff000000
	stba	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = ff000000
!	%l0 = 0000000000000000, Mem[00000000100c1400] = ff72a57b
	stba	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0072a57b
!	%l7 = 00000000164d9eff, Mem[0000000010181409] = fffcffff
	stb	%l7,[%i6+0x009]		! Mem[0000000010181408] = ffffffff
!	%l2 = ffffffffff72a57b, Mem[0000000010041410] = 9272a57b08a7587e
	stxa	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffffff72a57b
!	Mem[0000000010001410] = 0000005e, %l1 = 00000000000000ff
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 000000000000005e
!	Mem[0000000010141430] = ff8d0000, %l5 = 0000000000000000
	swap	[%i5+0x030],%l5		! %l5 = 00000000ff8d0000
!	Mem[0000000010041410] = ff72a57b, %l5 = 00000000ff8d0000
	swapa	[%i1+%o5]0x88,%l5	! %l5 = 00000000ff72a57b

p0_label_412:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00000000, %l6 = 00000000ff000000
	ldsba	[%i5+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001400] = c30e0000, %l7 = 00000000164d9eff
	ldsha	[%i0+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101408] = 07000000, %l5 = 00000000ff72a57b
	ldsha	[%i4+%o4]0x81,%l5	! %l5 = 0000000000000700
!	Mem[000000001000143f] = 00000000, %l0 = 0000000000000000, %asi = 80
	ldsba	[%i0+0x03f]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %f19 = 000000ff
	lda	[%i2+%o4]0x80,%f19	! %f19 = 00000000
!	Mem[0000000030141410] = 5e000000, %l5 = 0000000000000700
	lduha	[%i5+%o5]0x81,%l5	! %l5 = 0000000000005e00
!	Mem[0000000030041408] = ff000000, %l0 = 0000000000000000
	lduwa	[%i1+%o4]0x81,%l0	! %l0 = 00000000ff000000
!	Mem[00000000300c1410] = ffffffff c44445da, %l2 = ff72a57b, %l3 = 0000ffff
	ldda	[%i3+%o5]0x81,%l2	! %l2 = 00000000ffffffff 00000000c44445da
!	Mem[0000000030041410] = 00000000, %l5 = 0000000000005e00
	lduha	[%i1+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041408] = c528c51c, %f20 = ff000000
	lda	[%i1+%o4]0x88,%f20	! %f20 = c528c51c

p0_label_413:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 00000000, Mem[00000000300c1400] = 1cc528c5 228affff
	stda	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 00000000
!	%f8  = 6f000000 228affff, %l4 = 000000000dc6ff86
!	Mem[0000000010101430] = 20fcffff00000000
	add	%i4,0x030,%g1
	stda	%f8,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010101430] = 20ff8aff0000006f
!	%l4 = 0dc6ff86, %l5 = 00000000, Mem[0000000010181410] = 00000000 ffffffff
	stda	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 0dc6ff86 00000000
!	Mem[0000000010001408] = 20fcffff, %l6 = 0000000000000000
	ldstuba	[%i0+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	%l2 = ffffffff, %l3 = c44445da, Mem[0000000030181408] = 000000ff 00000000
	stda	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffffff c44445da
!	Mem[0000000030001400] = 00000ec3, %l0 = 00000000ff000000
	swapa	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000ec3
!	%l7 = 0000000000000000, Mem[00000000100c141e] = ff15ff00
	sth	%l7,[%i3+0x01e]		! Mem[00000000100c141c] = ff150000
!	%l2 = 00000000ffffffff, Mem[0000000030101400] = 000000ff
	stba	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff
!	%l4 = 0dc6ff86, %l5 = 00000000, Mem[0000000030081400] = 228a0e86 6f000000
	stda	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 0dc6ff86 00000000
!	Mem[0000000030081408] = 87ffffff, %l0 = 0000000000000ec3
	ldstuba	[%i2+%o4]0x89,%l0	! %l0 = 00000000000000ff

p0_label_414:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ff0080ff, %l7 = 0000000000000000
	lduwa	[%i5+%g0]0x81,%l7	! %l7 = 00000000ff0080ff
!	Mem[00000000100c1400] = 0072a57b, %f13 = fffffc20
	lda	[%i3+%g0]0x80,%f13	! %f13 = 0072a57b
!	Mem[0000000030001408] = 00000000, %l7 = 00000000ff0080ff
	ldsba	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101410] = 07000000, %l2 = 00000000ffffffff
	ldsh	[%i4+%o5],%l2		! %l2 = 0000000000000700
!	Mem[0000000030181400] = ff000000000000ff, %l2 = 0000000000000700
	ldxa	[%i6+%g0]0x89,%l2	! %l2 = ff000000000000ff
!	Mem[0000000010141408] = 000000ff, %f14 = ffff0000
	lda	[%i5+%o4]0x80,%f14	! %f14 = 000000ff
!	Mem[0000000010041425] = 000000f5, %l3 = 00000000c44445da, %asi = 80
	lduba	[%i1+0x025]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101410] = 00000007, %l6 = 00000000000000ff
	lduba	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000007
!	Mem[0000000030181400] = ff000000, %l4 = 000000000dc6ff86
	lduwa	[%i6+%g0]0x81,%l4	! %l4 = 00000000ff000000
!	Code Fragment 4, seed = 591824
p0_fragment_29:
!	%l0 = 00000000000000ff
	setx	0xa87c4d44905009a6,%g7,%l0 ! %l0 = a87c4d44905009a6
!	%l1 = 000000000000005e
	setx	0x2fc791a1e74f85d1,%g7,%l1 ! %l1 = 2fc791a1e74f85d1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = a87c4d44905009a6
	setx	0x69ccf38b2109e60c,%g7,%l0 ! %l0 = 69ccf38b2109e60c
!	%l1 = 2fc791a1e74f85d1
	setx	0xf9e9d4fd85672d57,%g7,%l1 ! %l1 = f9e9d4fd85672d57
p0_fragment_29_end:

p0_label_415:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ff000000, Mem[000000001010142c] = ec7aff00
	stw	%l4,[%i4+0x02c]		! Mem[000000001010142c] = ff000000
!	%l6 = 0000000000000007, %l7 = 0000000000000000, %l5 = 0000000000000000
	xnor	%l6,%l7,%l5		! %l5 = fffffffffffffff8
!	%l4 = 00000000ff000000, Mem[000000001010142e] = ff000000, %asi = 80
	stha	%l4,[%i4+0x02e]%asi	! Mem[000000001010142c] = ff000000
!	Mem[0000000010141408] = 000000ff, %l5 = fffffffffffffff8
	ldstuba	[%i5+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101408] = 07000000, %l6 = 0000000000000007
	swapa	[%i4+%o4]0x81,%l6	! %l6 = 0000000007000000
!	Mem[00000000300c1400] = 00000000, %l3 = 0000000000000000
	swapa	[%i3+%g0]0x89,%l3	! %l3 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000030101408] = 07000000
	stba	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 07000000
!	Mem[0000000010041408] = c528c51c, %l1 = f9e9d4fd85672d57
	ldstuba	[%i1+%o4]0x88,%l1	! %l1 = 000000000000001c
!	Mem[00000000300c1400] = 00000000 00000000 00000000 00000000
!	%f0  = 00000000 ffffff87 ff000000 ff000000
!	%f4  = 00000000 000000ff 00000000 00000000
!	%f8  = 6f000000 228affff ff000000 87ffffff
!	%f12 = 00000000 0072a57b 000000ff 7ba572ff
	stda	%f0 ,[%i3+%g0]ASI_BLK_AIUSL	! Block Store to 00000000300c1400
!	Mem[0000000010041400] = 00ff0000 00fffc00 ffc528c5 000000ff
!	%f0  = 00000000 ffffff87 ff000000 ff000000
!	%f4  = 00000000 000000ff 00000000 00000000
!	%f8  = 6f000000 228affff ff000000 87ffffff
!	%f12 = 00000000 0072a57b 000000ff 7ba572ff
	stda	%f0 ,[%i1+%g0]ASI_COMMIT_P	! Block Store to 0000000010041400

p0_label_416:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00000000, %l5 = 0000000000000000
	lduha	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000020800040] = 07ff65a8, %l5 = 0000000000000000, %asi = 80
	lduha	[%o1+0x040]%asi,%l5	! %l5 = 00000000000007ff
!	Mem[0000000010081410] = ff000000, %l3 = 0000000000000000
	ldswa	[%i2+%o5]0x80,%l3	! %l3 = ffffffffff000000
!	Mem[0000000030101410] = 000000005e000000, %l0 = 69ccf38b2109e60c
	ldxa	[%i4+%o5]0x89,%l0	! %l0 = 000000005e000000
!	Mem[0000000010101408] = 164d9eff, %l6 = 0000000007000000
	ldsha	[%i4+%o4]0x88,%l6	! %l6 = ffffffffffff9eff
!	Mem[0000000030141408] = 8000e88c, %l5 = 00000000000007ff
	lduwa	[%i5+%o4]0x89,%l5	! %l5 = 000000008000e88c
!	Mem[0000000030101408] = 00000007, %l6 = ffffffffffff9eff
	ldsba	[%i4+%o4]0x81,%l6	! %l6 = 0000000000000000
	membar	#Sync			! Added by membar checker (60)
!	Mem[00000000300c1410] = 000000ff, %l4 = 00000000ff000000
	ldsha	[%i3+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041410] = 00000000, %f4  = 00000000
	lda	[%i1+%o5]0x89,%f4 	! %f4 = 00000000
!	Mem[0000000030181408] = ffffffff, %f21 = 000000c0
	lda	[%i6+%o4]0x89,%f21	! %f21 = ffffffff

p0_label_417:
!	Starting 10 instruction Store Burst
!	Mem[0000000020800040] = 07ff65a8, %l1 = 000000000000001c
	ldstub	[%o1+0x040],%l1		! %l1 = 0000000000000007
!	Mem[0000000010101410] = 07000000, %l1 = 0000000000000007
	swapa	[%i4+%o5]0x80,%l1	! %l1 = 0000000007000000
!	%l2 = ff000000000000ff, Mem[000000001004142e] = 87ffffff, %asi = 80
	stha	%l2,[%i1+0x02e]%asi	! Mem[000000001004142c] = 87ff00ff
!	Mem[00000000100c1430] = ff008ce8f44b4200, %l6 = 0000000000000000, %l3 = ffffffffff000000
	add	%i3,0x30,%g1
	casxa	[%g1]0x80,%l6,%l3	! %l3 = ff008ce8f44b4200
!	Mem[0000000010041410] = 00000000, %l1 = 0000000007000000
	ldstuba	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[000000001018140c] = 00000000, %l3 = f44b4200, %l5 = 8000e88c
	add	%i6,0x0c,%g1
	casa	[%g1]0x80,%l3,%l5	! %l5 = 0000000000000000
!	%f28 = 6f000000, %f4  = 00000000 000000ff
	fstox	%f28,%f4 		! %f4  = 7fffffff ffffffff
!	%l2 = ff000000000000ff, Mem[0000000030041408] = 00000000000000ff
	stxa	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = ff000000000000ff
!	%l7 = 0000000000000000, %l3 = ff008ce8f44b4200, %l5 = 0000000000000000
	or	%l7,%l3,%l5		! %l5 = ff008ce8f44b4200
!	%f11 = 87ffffff, Mem[0000000010141424] = 00000000
	sta	%f11,[%i5+0x024]%asi	! Mem[0000000010141424] = 87ffffff

p0_label_418:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ff000000, %l5 = ff008ce8f44b4200
	ldsba	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141408] = 8ce80080, %l1 = 0000000000000000
	ldsha	[%i5+%o4]0x81,%l1	! %l1 = ffffffffffff8ce8
!	Mem[0000000010001400] = ff000000, %l0 = 000000005e000000
	lduw	[%i0+%g0],%l0		! %l0 = 00000000ff000000
!	Mem[0000000030181400] = ff000000, %l5 = 0000000000000000
	lduha	[%i6+%g0]0x81,%l5	! %l5 = 000000000000ff00
!	Mem[0000000010141410] = 00000000, %f30 = 1cc528c5
	lda	[%i5+0x010]%asi,%f30	! %f30 = 00000000
!	Mem[0000000030041408] = 000000ff, %f13 = 0072a57b
	lda	[%i1+%o4]0x89,%f13	! %f13 = 000000ff
!	%l4 = 00000000000000ff, %l7 = 0000000000000000, %l5 = 000000000000ff00
	sdivx	%l4,%l7,%l5		! Div by zero, %l0 = 00000000ff000028
!	Mem[0000000030041400] = ff000000, %l5 = 000000000000ff00
	ldsba	[%i1+%g0]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030001410] = ff000000ff000000, %f22 = 00000000 000000ff
	ldda	[%i0+%o5]0x81,%f22	! %f22 = ff000000 ff000000
!	Code Fragment 4, seed = 925450
p0_fragment_30:
!	%l0 = 00000000ff000028
	setx	0x11d2fe87e9c5a9d6,%g7,%l0 ! %l0 = 11d2fe87e9c5a9d6
!	%l1 = ffffffffffff8ce8
	setx	0x242b459b6f7aef01,%g7,%l1 ! %l1 = 242b459b6f7aef01
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 11d2fe87e9c5a9d6
	setx	0xc1ed0b122474c83c,%g7,%l0 ! %l0 = c1ed0b122474c83c
!	%l1 = 242b459b6f7aef01
	setx	0x6b8a24a9b02c3887,%g7,%l1 ! %l1 = 6b8a24a9b02c3887
p0_fragment_30_end:

p0_label_419:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[00000000211c0000] = ffffd1d8
	sth	%l7,[%o2+%g0]		! Mem[00000000211c0000] = 0000d1d8
!	%f22 = ff000000, Mem[0000000010041410] = 000000ff
	sta	%f22,[%i1+%o5]0x88	! Mem[0000000010041410] = ff000000
!	%l0 = c1ed0b122474c83c, immd = 0000000000000304, %l6  = 0000000000000000
	mulx	%l0,0x304,%l6		! %l6 = ced562b5f02bd4f0
!	%f24 = ff000000 0dc60e86, %l3 = ff008ce8f44b4200
!	Mem[0000000030001410] = ff000000ff000000
	add	%i0,0x010,%g1
	stda	%f24,[%g1+%l3]ASI_PST32_S ! Mem[0000000030001410] = ff000000ff000000
!	%l4 = 00000000000000ff, Mem[0000000021800041] = ff0e9e38
	stb	%l4,[%o3+0x041]		! Mem[0000000021800040] = ffff9e38
!	Mem[0000000030181400] = ff000000, %l6 = 00000000f02bd4f0
	swapa	[%i6+%g0]0x81,%l6	! %l6 = 00000000ff000000
!	%l0 = 2474c83c, %l1 = b02c3887, Mem[0000000030001410] = ff000000 ff000000
	stda	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 2474c83c b02c3887
!	%l4 = 000000ff, %l5 = ffffffff, Mem[0000000030181400] = f0d42bf0 ff000000
	stda	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff ffffffff
!	%l4 = 00000000000000ff, Mem[00000000100c1408] = ff00000092000000
	stxa	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000000000ff
!	%l0 = 2474c83c, %l1 = b02c3887, Mem[00000000100c1410] = 000000ff 000000ff
	stda	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 2474c83c b02c3887

p0_label_420:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff000000, %l1 = 6b8a24a9b02c3887
	ldswa	[%i0+%g0]0x80,%l1	! %l1 = ffffffffff000000
!	Mem[0000000030041400] = 000000ff, %l4 = 00000000000000ff
	lduba	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141400] = 1cc528c5, %l0 = c1ed0b122474c83c
	lduba	[%i5+%g0]0x80,%l0	! %l0 = 000000000000001c
!	Mem[0000000010041410] = 000000ff, %l4 = 00000000000000ff
	lduba	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181420] = ff9704ff, %l3 = ff008ce8f44b4200
	lduw	[%i6+0x020],%l3		! %l3 = 00000000ff9704ff
!	Mem[0000000010081408] = 4a000000 00000000, %l2 = 000000ff, %l3 = ff9704ff
	ldda	[%i2+%o4]0x88,%l2	! %l2 = 0000000000000000 000000004a000000
!	Mem[0000000010081410] = 000000ff, %f8  = 6f000000
	lda	[%i2+%o5]0x88,%f8 	! %f8 = 000000ff
!	Mem[00000000300c1408] = ff000000, %l4 = 0000000000000000
	lduba	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000211c0000] = 0000d1d8, %l0 = 000000000000001c
	ldub	[%o2+%g0],%l0		! %l0 = 0000000000000000
!	Mem[0000000010141400] = c528c51c, %l4 = 0000000000000000
	lduha	[%i5+%g0]0x88,%l4	! %l4 = 000000000000c51c

p0_label_421:
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffffff, Mem[00000000100c1400] = ffff00007ba57200
	stxa	%l5,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffffffffffff
!	%f13 = 000000ff, %f31 = ff000000, %f28 = 6f000000
	fdivs	%f13,%f31,%f28		! %f28 = 80000000
!	Mem[0000000010141410] = 00000000, %l1 = 00000000ff000000
	swapa	[%i5+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181400] = 000000ff, %l5 = 00000000ffffffff
	swapa	[%i6+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%f6  = 00000000 00000000, Mem[0000000010041430] = 00000000 0072a57b, %asi = 80
	stda	%f6 ,[%i1+0x030]%asi	! Mem[0000000010041430] = 00000000 00000000
!	Mem[00000000100c1418] = ffff8ce8, %l0 = 0000000000000000
	swap	[%i3+0x018],%l0		! %l0 = 00000000ffff8ce8
!	%l2 = 0000000000000000, Mem[00000000100c1400] = ffffffff
	stwa	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	%f12 = 00000000 000000ff, Mem[0000000010101408] = ff9e4d16 ff0000ff
	stda	%f12,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000 000000ff
!	Mem[0000000010181410] = 0dc6ff86, %l1 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l1	! %l1 = 000000000000000d
!	%l2 = 0000000000000000, Mem[00000000211c0000] = 0000d1d8, %asi = 80
	stha	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0000d1d8

p0_label_422:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 000000070000ffff, %l6 = 00000000ff000000
	ldxa	[%i4+%o5]0x80,%l6	! %l6 = 000000070000ffff
!	Mem[00000000211c0001] = 0000d1d8, %l6 = 000000070000ffff, %asi = 80
	lduba	[%o2+0x001]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181400] = ffffffffffffffff, %l2 = 0000000000000000
	ldxa	[%i6+%g0]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030041408] = ff000000, %l0 = 00000000ffff8ce8
	ldsha	[%i1+%o4]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000030041410] = 00000000, %f1  = ffffff87
	lda	[%i1+%o5]0x81,%f1 	! %f1 = 00000000
!	Mem[0000000010081408] = 00000000, %l0 = ffffffffffffff00
	ldsba	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l1 = 000000000000000d
	ldsba	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = ff000000, %l1 = 0000000000000000
	lduha	[%i0+%g0]0x80,%l1	! %l1 = 000000000000ff00
	membar	#Sync			! Added by membar checker (61)
!	Mem[0000000010101400] = ffffff87 ffff0000 00000000 000000ff
!	Mem[0000000010101410] = 00000007 0000ffff 91a3ffff ffffff87
!	Mem[0000000010101420] = 00000000 ff6f00ff 000000ff ff000000
!	Mem[0000000010101430] = 20ff8aff 0000006f ff000000 92000000
	ldda	[%i4+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010101400
!	Mem[0000000021800100] = 00ffb2c8, %l1 = 000000000000ff00
	ldsb	[%o3+0x100],%l1		! %l1 = 0000000000000000

p0_label_423:
!	Starting 10 instruction Store Burst
!	%l3 = 000000004a000000, Mem[0000000030041408] = ff000000
	stha	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	%l6 = 0000000000000000, Mem[0000000030081408] = ffffff87
	stba	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 00ffff87
!	Mem[000000001008143a] = 5e0497ff, %l4 = 000000000000c51c
	ldstuba	[%i2+0x03a]%asi,%l4	! %l4 = 0000000000000097
!	Mem[0000000010001408] = fffffc20, %l6 = 0000000000000000
	ldstuba	[%i0+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000030181400] = ffffffff
	stha	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000ffff
!	Mem[0000000010081408] = 00000000, %l6 = 00000000000000ff
	swapa	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = 87ffffff, %l6 = 0000000000000000
	ldstuba	[%i4+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	%l2 = ffffffffffffffff, Mem[0000000030001400] = 000000ff
	stba	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff
!	%l2 = ffffffff, %l3 = 4a000000, Mem[0000000030001410] = 2474c83c b02c3887
	stda	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = ffffffff 4a000000
!	%l3 = 000000004a000000, Mem[0000000030141400] = ff0080ff
	stwa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 4a000000

p0_label_424:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101428] = 000000ffff000000, %l1 = 0000000000000000, %asi = 80
	ldxa	[%i4+0x028]%asi,%l1	! %l1 = 000000ffff000000
!	Mem[0000000010081410] = ff00000092000000, %f18 = 0000ff00 00000000
	ldda	[%i2+%o5]0x80,%f18	! %f18 = ff000000 92000000
!	Mem[0000000030181410] = 00a3ffff, %l3 = 000000004a000000
	lduwa	[%i6+%o5]0x81,%l3	! %l3 = 0000000000a3ffff
!	Mem[0000000010001400] = 000000ff, %l5 = 00000000000000ff
	ldstuba	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030141400] = 0000004a, %f29 = 228affff
	lda	[%i5+%g0]0x89,%f29	! %f29 = 0000004a
!	Mem[00000000100c1410] = 2474c83cb02c3887, %f30 = 00000000 ff000000
	ldda	[%i3+%o5]0x80,%f30	! %f30 = 2474c83c b02c3887
!	Mem[0000000030081408] = 87ffff00, %l1 = 000000ffff000000
	ldsba	[%i2+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181410] = 86ffc6ff, %f31 = b02c3887
	lda	[%i6+%o5]0x88,%f31	! %f31 = 86ffc6ff
!	Mem[00000000100c1408] = 00000000, %l3 = 0000000000a3ffff
	ldswa	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141410] = 0000005e, %l0 = 0000000000000000
	ldsha	[%i5+%o5]0x89,%l0	! %l0 = 000000000000005e

p0_label_425:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 00000000, %l0 = 000000000000005e
	swap	[%i6+%g0],%l0		! %l0 = 0000000000000000
!	%l2 = ffffffffffffffff, %l4 = 0000000000000097, %l1 = 0000000000000000
	and	%l2,%l4,%l1		! %l1 = 0000000000000097
!	%l4 = 00000097, %l5 = 000000ff, Mem[0000000030101408] = 00000007 00000000
	stda	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000097 000000ff
!	Mem[00000000100c1430] = ff008ce8, %l1 = 0000000000000097
	swap	[%i3+0x030],%l1		! %l1 = 00000000ff008ce8
!	%l1 = 00000000ff008ce8, Mem[00000000211c0000] = 0000d1d8
	stb	%l1,[%o2+%g0]		! Mem[00000000211c0000] = e800d1d8
!	%l1 = 00000000ff008ce8, Mem[0000000030101408] = 97000000
	stba	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = 970000e8
!	%l4 = 0000000000000097, Mem[00000000100c1400] = 00000000ffffffff, %asi = 80
	stxa	%l4,[%i3+0x000]%asi	! Mem[00000000100c1400] = 0000000000000097
!	%l3 = 0000000000000000, Mem[0000000010181400] = 5e000000
	stba	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 5e000000
!	%l6 = 00000000000000ff, Mem[0000000030081410] = ff000000
	stha	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 00ff0000
!	%f16 = 00000000 00000000, Mem[0000000010001408] = 20fcffff 00000000
	stda	%f16,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000 00000000

p0_label_426:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ffffff87, %l0 = 0000000000000000, %asi = 80
	ldswa	[%i4+0x000]%asi,%l0	! %l0 = ffffffffffffff87
!	Mem[00000000100c1416] = b02c3887, %l3 = 0000000000000000, %asi = 80
	lduha	[%i3+0x016]%asi,%l3	! %l3 = 0000000000003887
!	Mem[0000000010001400] = ff000000 000000ff, %l0 = ffffff87, %l1 = ff008ce8
	ldda	[%i0+%g0]0x88,%l0	! %l0 = 00000000000000ff 00000000ff000000
!	Mem[00000000300c1408] = 000000ff, %l3 = 0000000000003887
	ldsha	[%i3+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101400] = ff000000, %l6 = 00000000000000ff
	ldsha	[%i4+%g0]0x81,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000010081428] = 228a91fe536f8ce8, %l4 = 0000000000000097
	ldx	[%i2+0x028],%l4		! %l4 = 228a91fe536f8ce8
!	Mem[00000000211c0000] = e800d1d8, %l0 = 00000000000000ff, %asi = 80
	lduha	[%o2+0x000]%asi,%l0	! %l0 = 000000000000e800
!	Mem[0000000010041422] = 6f000000, %l4 = 228a91fe536f8ce8, %asi = 80
	ldsba	[%i1+0x022]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000020800001] = 00fff578, %l3 = 0000000000000000
	ldsb	[%o1+0x001],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010181400] = 5e000000, %l2 = ffffffffffffffff
	ldsha	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000000

p0_label_427:
!	Starting 10 instruction Store Burst
!	%f0  = ffffff87 ffff0000, %l1 = 00000000ff000000
!	Mem[0000000030181410] = 00a3fffffe918a22
	add	%i6,0x010,%g1
	stda	%f0,[%g1+%l1]ASI_PST8_S ! Mem[0000000030181410] = 00a3fffffe918a22
!	Mem[0000000030041410] = 00000000, %l0 = 000000000000e800
	swapa	[%i1+%o5]0x89,%l0	! %l0 = 0000000000000000
!	%l1 = 00000000ff000000, Mem[00000000218000c0] = 00ff5a98, %asi = 80
	stba	%l1,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 00ff5a98
!	Mem[0000000020800001] = 00fff578, %l0 = 0000000000000000
	ldstuba	[%o1+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[00000000300c1410] = 000000ff, %l0 = 00000000000000ff
	swapa	[%i3+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%f26 = 9272a57b 0000ffff, Mem[0000000030041410] = 0000e800 ff000000
	stda	%f26,[%i1+%o5]0x89	! Mem[0000000030041410] = 9272a57b 0000ffff
!	%f28 = 80000000 0000004a, Mem[0000000010041410] = ff000000 ff000000
	stda	%f28,[%i1+%o5]0x88	! Mem[0000000010041410] = 80000000 0000004a
!	Mem[0000000010181430] = 1cc528c5, %l0 = 00000000000000ff
	swap	[%i6+0x030],%l0		! %l0 = 000000001cc528c5
!	Mem[0000000010101410] = 00000007, %l1 = 00000000ff000000, %asi = 80
	swapa	[%i4+0x010]%asi,%l1	! %l1 = 0000000000000007
!	Mem[0000000010001414] = ff6f00ff, %l3 = 00000000ffffffff, %asi = 80
	swapa	[%i0+0x014]%asi,%l3	! %l3 = 00000000ff6f00ff

p0_label_428:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 000000ff, %l4 = 0000000000000000
	ldsba	[%i3+%o5]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030181410] = 00a3ffff, %l1 = 0000000000000007
	lduba	[%i6+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = 4a000000, %l2 = 0000000000000000
	lduba	[%i5+%g0]0x81,%l2	! %l2 = 000000000000004a
!	Mem[0000000030001410] = ffffffff, %l5 = 00000000000000ff
	ldsha	[%i0+%o5]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030041410] = 0000ffff, %l1 = 0000000000000000
	lduha	[%i1+%o5]0x89,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010041400] = 00000000ffffff87, %l7 = 0000000000000000, %asi = 80
	ldxa	[%i1+0x000]%asi,%l7	! %l7 = 00000000ffffff87
!	Mem[0000000010001400] = ff000000000000ff, %l7 = 00000000ffffff87, %asi = 80
	ldxa	[%i0+0x000]%asi,%l7	! %l7 = ff000000000000ff
!	Code Fragment 3, seed = 968853
p0_fragment_31:
!	%l0 = 000000001cc528c5
	setx	0x0e39cb26faf6d87e,%g7,%l0 ! %l0 = 0e39cb26faf6d87e
!	%l1 = 000000000000ffff
	setx	0x954c2a4a7487fd29,%g7,%l1 ! %l1 = 954c2a4a7487fd29
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0e39cb26faf6d87e
	setx	0xa699c0c0ebad9de4,%g7,%l0 ! %l0 = a699c0c0ebad9de4
!	%l1 = 954c2a4a7487fd29
	setx	0x370da818e2fc3daf,%g7,%l1 ! %l1 = 370da818e2fc3daf
p0_fragment_31_end:
!	Mem[0000000010041400] = 00000000, %l1 = 370da818e2fc3daf
	lduwa	[%i1+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001410] = ffffffff, %l2 = 000000000000004a
	ldsba	[%i0+%o5]0x81,%l2	! %l2 = ffffffffffffffff

p0_label_429:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 000000ff, %l1 = 0000000000000000
	swapa	[%i2+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030041400] = 000000ff, %l6 = ffffffffffffff00
	ldstuba	[%i1+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[0000000030001408] = 00000000000000ff
	stxa	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000000000ff
!	%l4 = ffffffff, %l5 = ffffffff, Mem[00000000300c1400] = 87ffffff 00000000
	stda	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffff ffffffff
!	Mem[0000000010141410] = ff000000, %l4 = ffffffffffffffff
	ldstuba	[%i5+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%l3 = 00000000ff6f00ff, Mem[0000000010181400] = 0000005e
	stha	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 00ff005e
!	Mem[00000000201c0000] = ffff8148, %l6 = 00000000000000ff
	ldstub	[%o0+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010001410] = 000000ff, %l4 = 00000000000000ff
	swapa	[%i0+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%l3 = 00000000ff6f00ff, Mem[0000000010081400] = 228affff
	stwa	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = ff6f00ff
!	Mem[0000000010141424] = 87ffffff, %l3 = ff6f00ff, %l1 = 000000ff
	add	%i5,0x24,%g1
	casa	[%g1]0x80,%l3,%l1	! %l1 = 0000000087ffffff

p0_label_430:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff000000, %l0 = a699c0c0ebad9de4
	ldswa	[%i2+%o5]0x80,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010181410] = 0000000086ffc6ff, %f28 = 80000000 0000004a
	ldda	[%i6+%o5]0x88,%f28	! %f28 = 00000000 86ffc6ff
!	Mem[0000000010041410] = 0000004a, %f19 = 92000000
	lda	[%i1+%o5]0x88,%f19	! %f19 = 0000004a
!	Mem[0000000030101400] = ff00000000000000, %f2  = 00000000 000000ff
	ldda	[%i4+%g0]0x81,%f2 	! %f2  = ff000000 00000000
!	Mem[0000000030081400] = 86ffc60d, %f31 = 86ffc6ff
	lda	[%i2+%g0]0x81,%f31	! %f31 = 86ffc60d
!	Mem[0000000030041408] = 00000000, %l3 = 00000000ff6f00ff
	lduba	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = ff000000, %l3 = 0000000000000000
	ldswa	[%i0+%g0]0x80,%l3	! %l3 = ffffffffff000000
!	Mem[0000000010001408] = 0000000000000000, %l4 = 00000000000000ff
	ldxa	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181410] = ffc6ff86, %f19 = 0000004a
	ld	[%i6+%o5],%f19		! %f19 = ffc6ff86
!	Mem[0000000010041410] = 4a000000, %f8  = 00000000
	lda	[%i1+%o5]0x80,%f8 	! %f8 = 4a000000

p0_label_431:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 0000ffff, %l6 = 00000000000000ff
	ldstuba	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000020800040] = ffff65a8, %asi = 80
	stha	%l4,[%o1+0x040]%asi	! Mem[0000000020800040] = 000065a8
!	Mem[0000000010001430] = 00000000, %l4 = 00000000, %l4 = 00000000
	add	%i0,0x30,%g1
	casa	[%g1]0x80,%l4,%l4	! %l4 = 0000000000000000
!	%l0 = ffffffffff000000, Mem[0000000010041410] = 4a00000000000080
	stxa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffffffff000000
!	Mem[0000000020800000] = 00fff578, %l6 = 00000000000000ff
	ldstuba	[%o1+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l5 = 00000000ffffffff
	swapa	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000000
!	%l2 = ffffffff, %l3 = ff000000, Mem[0000000010141408] = ff0000ff f44b4200
	stda	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = ffffffff ff000000
!	%f14 = ff000000 92000000, Mem[0000000030181408] = ffffffff c44445da
	stda	%f14,[%i6+%o4]0x81	! Mem[0000000030181408] = ff000000 92000000
!	Mem[0000000030141400] = 4a000000, %l0 = ffffffffff000000
	ldstuba	[%i5+%g0]0x81,%l0	! %l0 = 000000000000004a
!	Mem[0000000030141408] = 8ce80080, %l7 = ff000000000000ff
	ldstuba	[%i5+%o4]0x81,%l7	! %l7 = 000000000000008c

p0_label_432:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041422] = 6f000000, %l5 = 0000000000000000, %asi = 80
	ldsha	[%i1+0x022]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081410] = ff000000, %l3 = ffffffffff000000
	ldswa	[%i2+%o5]0x80,%l3	! %l3 = ffffffffff000000
!	Mem[0000000010181400] = 00ff005e, %l3 = ffffffffff000000
	ldswa	[%i6+%g0]0x80,%l3	! %l3 = 0000000000ff005e
!	Mem[0000000021800001] = ff9a3a08, %l6 = 0000000000000000, %asi = 80
	ldsba	[%o3+0x001]%asi,%l6	! %l6 = ffffffffffffff9a
!	Mem[0000000010041410] = ffffffffff000000, %f22 = ff000000 ff000000
	ldda	[%i1+%o5]0x80,%f22	! %f22 = ffffffff ff000000
!	Mem[000000001014142e] = c0000000, %l7 = 000000000000008c, %asi = 80
	lduba	[%i5+0x02e]%asi,%l7	! %l7 = 0000000000000000
!	%f15 = 92000000, %f13 = 0000006f, %f31 = 86ffc60d
	fsubs	%f15,%f13,%f31		! tt=0x22, %l0 = 000000000000006c
!	Mem[0000000030141408] = ffe80080, %l0 = 000000000000006c
	ldsha	[%i5+%o4]0x81,%l0	! %l0 = ffffffffffffffe8
!	Mem[0000000030001410] = ffffffff, %l6 = ffffffffffffff9a
	ldsha	[%i0+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010041408] = ff000000ff000000, %l3 = 0000000000ff005e
	ldxa	[%i1+%o4]0x80,%l3	! %l3 = ff000000ff000000

p0_label_433:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010041408] = ff000000
	stha	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	%f11 = ff000000, Mem[0000000030001408] = ffffffff
	sta	%f11,[%i0+%o4]0x81	! Mem[0000000030001408] = ff000000
!	%l2 = ffffffff, %l3 = ff000000, Mem[00000000100c1408] = 00000000 000000ff
	stda	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffffffff ff000000
!	%l7 = 0000000000000000, Mem[0000000030101400] = 000000ff
	stba	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	Mem[0000000010081410] = ff000000, %l2 = 00000000ffffffff
	swapa	[%i2+%o5]0x80,%l2	! %l2 = 00000000ff000000
!	%f27 = 0000ffff, Mem[0000000030041410] = 0000ffff
	sta	%f27,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000ffff
!	%l5 = 0000000000000000, Mem[0000000030181408] = ff000000
	stwa	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	%f18 = ff000000 ffc6ff86, Mem[0000000030181410] = 00a3ffff fe918a22
	stda	%f18,[%i6+%o5]0x81	! Mem[0000000030181410] = ff000000 ffc6ff86
!	%l7 = 0000000000000000, Mem[0000000010141414] = 00000000, %asi = 80
	stwa	%l7,[%i5+0x014]%asi	! Mem[0000000010141414] = 00000000
!	Mem[00000000218000c0] = 00ff5a98, %l7 = 0000000000000000
	ldstuba	[%o3+0x0c0]%asi,%l7	! %l7 = 0000000000000000

p0_label_434:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 87ffffff000000ff, %l3 = ff000000ff000000
	ldxa	[%i1+%g0]0x89,%l3	! %l3 = 87ffffff000000ff
!	Mem[0000000030101408] = e8000097, %l5 = 0000000000000000
	lduha	[%i4+%o4]0x81,%l5	! %l5 = 000000000000e800
!	Mem[0000000010141410] = ff000000, %l0 = ffffffffffffffe8
	ldswa	[%i5+%o5]0x80,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010141400] = 1cc528c5 ff000000, %l6 = ffffffff, %l7 = 00000000
	ldda	[%i5+%g0]0x80,%l6	! %l6 = 000000001cc528c5 00000000ff000000
!	Mem[000000001008140b] = 00000000, %l4 = 0000000000000000
	ldub	[%i2+0x00b],%l4		! %l4 = 0000000000000000
!	Mem[00000000300c1410] = ff000000, %l5 = 000000000000e800
	lduha	[%i3+%o5]0x81,%l5	! %l5 = 000000000000ff00
!	Mem[000000001008140c] = 0000004a, %l4 = 0000000000000000, %asi = 80
	ldswa	[%i2+0x00c]%asi,%l4	! %l4 = 000000000000004a
!	Mem[000000001008141c] = 00000000, %l2 = 00000000ff000000
	ldsh	[%i2+0x01c],%l2		! %l2 = 0000000000000000
!	Mem[0000000010001414] = ffffffff, %l0 = ffffffffff000000
	lduw	[%i0+0x014],%l0		! %l0 = 00000000ffffffff
!	Mem[0000000030001400] = ff000000, %l1 = 0000000087ffffff
	ldsha	[%i0+%g0]0x81,%l1	! %l1 = ffffffffffffff00

p0_label_435:
!	Starting 10 instruction Store Burst
!	%l6 = 000000001cc528c5, %l7 = 00000000ff000000, %l5 = 000000000000ff00
	xor	%l6,%l7,%l5		! %l5 = 00000000e3c528c5
!	%l2 = 0000000000000000, Mem[0000000010081410] = ffffffff
	stba	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = ffffff00
!	%l1 = ffffffffffffff00, Mem[0000000010081400] = ff6f00ff
	stba	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = ff6f0000
!	Mem[0000000010081408] = 000000000000004a, %l1 = ffffffffffffff00, %l2 = 0000000000000000
	add	%i2,0x08,%g1
	casxa	[%g1]0x80,%l1,%l2	! %l2 = 000000000000004a
!	%l2 = 000000000000004a, Mem[0000000010181405] = 00000ec3
	stb	%l2,[%i6+0x005]		! Mem[0000000010181404] = 004a0ec3
!	%f28 = 00000000, Mem[0000000030101410] = 0000005e
	sta	%f28,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	%l0 = 00000000ffffffff, Mem[0000000010141408] = 000000ffffffffff
	stxa	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000ffffffff
!	Mem[0000000010081403] = 00006fff, %l7 = 00000000ff000000
	ldstuba	[%i2+0x003]%asi,%l7	! %l7 = 00000000000000ff
!	%f26 = 9272a57b, Mem[0000000030001400] = 000000ff
	sta	%f26,[%i0+%g0]0x89	! Mem[0000000030001400] = 9272a57b
!	Mem[0000000030141410] = 5e000000, %l1 = 00000000ffffff00
	swapa	[%i5+%o5]0x81,%l1	! %l1 = 000000005e000000

p0_label_436:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 2474c83cb02c3887, %f28 = 00000000 86ffc6ff
	ldda	[%i3+%o5]0x80,%f28	! %f28 = 2474c83c b02c3887
!	Mem[0000000010001408] = 0000000000000000, %l7 = 00000000000000ff
	ldxa	[%i0+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l3 = 87ffffff000000ff
	lduba	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800000] = fffff578, %l5 = 00000000e3c528c5
	ldsh	[%o1+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[00000000100c1408] = ffffffff, %l1 = 000000005e000000
	ldswa	[%i3+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030181410] = 000000ff, %l2 = 000000000000004a
	ldsba	[%i6+%o5]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010181400] = 00ff005e 004a0ec3, %l6 = 1cc528c5, %l7 = 00000000
	ldd	[%i6+%g0],%l6		! %l6 = 0000000000ff005e 00000000004a0ec3
!	Mem[000000001008141c] = 00000000, %l0 = 00000000ffffffff, %asi = 80
	ldswa	[%i2+0x01c]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = 1cc528c5, %l2 = ffffffffffffffff
	ldsba	[%i5+%g0]0x80,%l2	! %l2 = 000000000000001c
	membar	#Sync			! Added by membar checker (62)
!	Mem[00000000300c1400] = ffffffff ffffffff 000000ff 000000ff
!	Mem[00000000300c1410] = ff000000 00000000 00000000 00000000
!	Mem[00000000300c1420] = ffff8a22 0000006f ffffff87 000000ff
!	Mem[00000000300c1430] = 7ba57200 00000000 ff72a57b ff000000
	ldda	[%i3+%g0]ASI_BLK_S,%f0 	! Block Load from 00000000300c1400

p0_label_437:
!	Starting 10 instruction Store Burst
!	%f1  = ffffffff, Mem[0000000030041408] = 00000000
	sta	%f1 ,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffff
!	%l2 = 000000000000001c, Mem[0000000030101410] = 00000000
	stba	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000001c
!	Mem[0000000010001400] = ff000000, %l6 = 0000000000ff005e, %asi = 80
	swapa	[%i0+0x000]%asi,%l6	! %l6 = 00000000ff000000
!	%f8  = ffff8a22 0000006f, Mem[0000000010041400] = 00000000 ffffff87
	std	%f8 ,[%i1+%g0]		! Mem[0000000010041400] = ffff8a22 0000006f
!	%l7 = 00000000004a0ec3, Mem[0000000010001408] = 0000000000000000, %asi = 80
	stxa	%l7,[%i0+0x008]%asi	! Mem[0000000010001408] = 00000000004a0ec3
!	%l0 = 0000000000000000, Mem[0000000030181410] = 000000ff
	stha	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	%l2 = 000000000000001c, Mem[0000000010101428] = 000000ff
	stb	%l2,[%i4+0x028]		! Mem[0000000010101428] = 1c0000ff
!	Mem[0000000030081410] = 00ff0000, %l3 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l3	! %l3 = 0000000000ff0000
!	Mem[0000000010081421] = 000000ff, %l2 = 000000000000001c
	ldstuba	[%i2+0x021]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041410] = ffffffff, %l1 = 00000000ffffffff
	swapa	[%i1+%o5]0x80,%l1	! %l1 = 00000000ffffffff

p0_label_438:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00000000, %f31 = 86ffc60d
	lda	[%i6+%o4]0x81,%f31	! %f31 = 00000000
!	Mem[00000000100c1410] = 2474c83c, %l1 = 00000000ffffffff, %asi = 80
	lduwa	[%i3+0x010]%asi,%l1	! %l1 = 000000002474c83c
!	Mem[0000000010141404] = ff000000, %f18 = ff000000
	ld	[%i5+0x004],%f18	! %f18 = ff000000
!	Mem[0000000030041400] = 87ffffff000000ff, %l4 = 000000000000004a
	ldxa	[%i1+%g0]0x89,%l4	! %l4 = 87ffffff000000ff
!	Mem[000000001008142c] = 536f8ce8, %l3 = 0000000000ff0000, %asi = 80
	ldswa	[%i2+0x02c]%asi,%l3	! %l3 = 00000000536f8ce8
!	Mem[0000000030041410] = 9272a57b0000ffff, %l7 = 00000000004a0ec3
	ldxa	[%i1+%o5]0x89,%l7	! %l7 = 9272a57b0000ffff
!	Mem[0000000030141408] = ffe80080, %l0 = 0000000000000000
	ldsba	[%i5+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030141408] = 8000e8ff, %l0 = ffffffffffffffff
	ldswa	[%i5+%o4]0x89,%l0	! %l0 = ffffffff8000e8ff
!	Mem[00000000100c1410] = 2474c83c, %l0 = ffffffff8000e8ff
	lduba	[%i3+%o5]0x80,%l0	! %l0 = 0000000000000024
!	Mem[0000000010041410] = ffffffff, %f21 = ffffffff
	lda	[%i1+%o5]0x88,%f21	! %f21 = ffffffff

p0_label_439:
!	Starting 10 instruction Store Burst
!	%l7 = 9272a57b0000ffff, Mem[0000000010041400] = 6f000000228affff
	stxa	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = 9272a57b0000ffff
!	%l5 = ffffffffffffffff, Mem[00000000100c1413] = 2474c83c, %asi = 80
	stba	%l5,[%i3+0x013]%asi	! Mem[00000000100c1410] = 2474c8ff
!	%l1 = 000000002474c83c, Mem[0000000010141400] = c528c51c
	stha	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = c528c83c
!	%l6 = ff000000, %l7 = 0000ffff, Mem[0000000010101408] = 00000000 000000ff
	stda	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = ff000000 0000ffff
!	Mem[0000000010081400] = 00006fff0000006f, %l2 = 0000000000000000, %l3 = 00000000536f8ce8
	casxa	[%i2]0x80,%l2,%l3	! %l3 = 00006fff0000006f
!	%f30 = 2474c83c 00000000, Mem[0000000010101410] = ff000000 0000ffff
	std	%f30,[%i4+%o5]		! Mem[0000000010101410] = 2474c83c 00000000
!	%l5 = ffffffffffffffff, Mem[0000000030181400] = ffffffffffff0000
	stxa	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = ffffffffffffffff
!	%l4 = 87ffffff000000ff, Mem[0000000010081408] = 000000000000004a
	stxa	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 87ffffff000000ff
!	Mem[00000000300c1410] = ff000000, %l0 = 0000000000000024
	ldstuba	[%i3+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[000000001014140a] = ffffffff, %l3 = 00006fff0000006f
	ldstub	[%i5+0x00a],%l3		! %l3 = 00000000000000ff

p0_label_440:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041429] = ff000000, %l3 = 00000000000000ff, %asi = 80
	lduba	[%i1+0x029]%asi,%l3	! %l3 = 0000000000000000
!	%l1 = 000000002474c83c, imm = 0000000000000deb, %l4 = 87ffffff000000ff
	and	%l1,0xdeb,%l4		! %l4 = 0000000000000828
!	Mem[0000000030181400] = ffffffff, %l2 = 0000000000000000
	lduwa	[%i6+%g0]0x81,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000030001400] = 9272a57b, %l2 = 00000000ffffffff
	ldsha	[%i0+%g0]0x89,%l2	! %l2 = ffffffffffffa57b
!	Mem[000000001000142a] = 00ff0000, %l2 = ffffffffffffa57b
	lduh	[%i0+0x02a],%l2		! %l2 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l4 = 0000000000000828
	lduha	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101400] = ffffff87, %f31 = 00000000
	lda	[%i4+%g0]0x80,%f31	! %f31 = ffffff87
!	Mem[0000000010001400] = ff0000005e00ff00, %l1 = 000000002474c83c
	ldxa	[%i0+%g0]0x88,%l1	! %l1 = ff0000005e00ff00
!	Mem[00000000100c1408] = ffffffff, %l3 = 0000000000000000
	lduba	[%i3+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000021800001] = ff9a3a08, %l1 = ff0000005e00ff00
	ldsb	[%o3+0x001],%l1		! %l1 = ffffffffffffff9a

p0_label_441:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 00000000, %l5 = ffffffffffffffff
	ldstuba	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000000
!	%l6 = ff000000, %l7 = 0000ffff, Mem[0000000010081438] = 5e04ffff ffffa391, %asi = 80
	stda	%l6,[%i2+0x038]%asi	! Mem[0000000010081438] = ff000000 0000ffff
!	%l1 = ffffffffffffff9a, imm = fffffffffffff674, %l1 = ffffffffffffff9a
	add	%l1,-0x98c,%l1		! %l1 = fffffffffffff60e
!	%l4 = 0000000000000000, immd = 000000000000060a, %l3  = 00000000000000ff
	mulx	%l4,0x60a,%l3		! %l3 = 0000000000000000
!	%l4 = 0000000000000000, immd = 00000fa0, %y  = 00000000
	smul	%l4,0xfa0,%l7		! %l7 = 0000000000000000, %y = 00000000
!	Mem[0000000010141400] = c528c83c, %l5 = 0000000000000000
	ldstuba	[%i5+%g0]0x88,%l5	! %l5 = 000000000000003c
!	%f21 = ffffffff, %f16 = 00000000, %f20 = c528c51c ffffffff
	fsmuld	%f21,%f16,%f20		! %f20 = ffffffff e0000000
!	%l3 = 0000000000000000, Mem[0000000010101408] = 000000ff
	stwa	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	Mem[0000000030081410] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	%l5 = 000000000000003c, immd = 000006c3, %y  = 00000000
	umul	%l5,0x6c3,%l4		! %l4 = 00000000000195b4, %y = 00000000

p0_label_442:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ffffffff, %l0 = 00000000000000ff
	ldsha	[%i3+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001408] = 00000000, %l4 = 00000000000195b4
	ldsha	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = 2474c83c 00000000, %l6 = ff000000, %l7 = 00000000
	ldda	[%i4+%o5]0x80,%l6	! %l6 = 000000002474c83c 0000000000000000
!	Mem[0000000030141410] = ffffff00, %l7 = 0000000000000000
	lduwa	[%i5+%o5]0x81,%l7	! %l7 = 00000000ffffff00
!	Mem[0000000010041400] = 9272a57b0000ffff, %f16 = 00000000 00000000
	ldda	[%i1+%g0]0x88,%f16	! %f16 = 9272a57b 0000ffff
!	Mem[0000000010001408] = c30e4a00 00000000, %l6 = 2474c83c, %l7 = ffffff00
	ldda	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000000 00000000c30e4a00
!	Mem[0000000010181408] = ffffffff, %l6 = 0000000000000000
	lduw	[%i6+%o4],%l6		! %l6 = 00000000ffffffff
!	Mem[00000000211c0001] = e800d1d8, %l3 = 0000000000000000, %asi = 80
	lduba	[%o2+0x001]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081408] = 87ffff00, %l2 = 0000000000000000
	ldsha	[%i2+%o4]0x89,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000030141408] = ffe80080, %l1 = fffffffffffff60e
	ldsha	[%i5+%o4]0x81,%l1	! %l1 = ffffffffffffffe8

p0_label_443:
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffffe8, Mem[0000000010081412] = 00ffffff
	sth	%l1,[%i2+0x012]		! Mem[0000000010081410] = 00ffffe8
!	Code Fragment 3, seed = 305921
p0_fragment_32:
!	%l0 = ffffffffffffffff
	setx	0x2e7fd5a6bd51f11e,%g7,%l0 ! %l0 = 2e7fd5a6bd51f11e
!	%l1 = ffffffffffffffe8
	setx	0xc365f9b2185c33c9,%g7,%l1 ! %l1 = c365f9b2185c33c9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2e7fd5a6bd51f11e
	setx	0xd94c474304889284,%g7,%l0 ! %l0 = d94c474304889284
!	%l1 = c365f9b2185c33c9
	setx	0xc29d2394f779904f,%g7,%l1 ! %l1 = c29d2394f779904f
p0_fragment_32_end:
	membar	#Sync			! Added by membar checker (63)
!	%l0 = d94c474304889284, Mem[00000000300c1400] = ffffffff
	stwa	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = 04889284
!	%f24 = ff000000 0dc60e86, %l7 = 00000000c30e4a00
!	Mem[00000000300c1420] = ffff8a220000006f
	add	%i3,0x020,%g1
	stda	%f24,[%g1+%l7]ASI_PST8_SL ! Mem[00000000300c1420] = ffff8a220000006f
!	Mem[0000000010181410] = ffc6ff86, %l0 = 0000000004889284
	swapa	[%i6+%o5]0x80,%l0	! %l0 = 00000000ffc6ff86
!	%f16 = 9272a57b 0000ffff, Mem[0000000010181408] = ffffffff 00000000
	stda	%f16,[%i6+%o4]0x80	! Mem[0000000010181408] = 9272a57b 0000ffff
!	%l3 = 0000000000000000, Mem[00000000100c1408] = ffffffffff000000
	stxa	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000000000
!	%f0  = ffffffff ffffffff, Mem[00000000100c1408] = 00000000 00000000
	stda	%f0 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffffffff ffffffff
!	Mem[0000000010081400] = 00006fff, %l6 = 00000000ffffffff
	swapa	[%i2+%g0]0x80,%l6	! %l6 = 0000000000006fff
!	%l6 = 0000000000006fff, Mem[00000000100c1408] = ffffffff
	stha	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 6fffffff

p0_label_444:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ffffffff, %l6 = 0000000000006fff
	ldsba	[%i1+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081400] = ffffffff, %l5 = 000000000000003c
	ldsha	[%i2+%g0]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010081410] = 00ffffe892000000, %f24 = ff000000 0dc60e86
	ldd	[%i2+%o5],%f24		! %f24 = 00ffffe8 92000000
!	Mem[0000000010041408] = 00000000ff000000, %f4  = ff000000 00000000
	ldd	[%i1+%o4],%f4 		! %f4  = 00000000 ff000000
!	Mem[0000000030181400] = ffffffff ffffffff, %l2 = ffffff00, %l3 = 00000000
	ldda	[%i6+%g0]0x81,%l2	! %l2 = 00000000ffffffff 00000000ffffffff
!	Mem[00000000100c1400] = 00000000, %f27 = 0000ffff
	lda	[%i3+%g0]0x80,%f27	! %f27 = 00000000
!	Mem[00000000300c1400] = 04889284, %l3 = 00000000ffffffff
	ldsha	[%i3+%g0]0x81,%l3	! %l3 = 0000000000000488
!	Mem[0000000030041410] = ffff00007ba57292, %l5 = ffffffffffffffff
	ldxa	[%i1+%o5]0x81,%l5	! %l5 = ffff00007ba57292
!	Mem[0000000010101400] = ffffff87 ffff0000, %l4 = 00000000, %l5 = 7ba57292
	ldd	[%i4+%g0],%l4		! %l4 = 00000000ffffff87 00000000ffff0000
!	Mem[0000000010001400] = 00ff005e 000000ff, %l6 = ffffffff, %l7 = c30e4a00
	ldd	[%i0+%g0],%l6		! %l6 = 0000000000ff005e 00000000000000ff

p0_label_445:
!	Starting 10 instruction Store Burst
!	Mem[0000000020800041] = 000065a8, %l4 = 00000000ffffff87
	ldstuba	[%o1+0x041]%asi,%l4	! %l4 = 0000000000000000
!	%l3 = 0000000000000488, Mem[0000000010041410] = ffffffff
	stba	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffff88
!	%l4 = 00000000, %l5 = ffff0000, Mem[0000000010041408] = 00000000 000000ff
	stda	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000 ffff0000
!	%l2 = 00000000ffffffff, Mem[0000000030041400] = 000000ff
	stwa	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffffff
!	%l6 = 0000000000ff005e, Mem[0000000030001400] = 7ba57292
	stba	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 5ea57292
!	Mem[0000000010181400] = 00ff005e 004a0ec3 9272a57b 0000ffff
!	%f16 = 9272a57b 0000ffff ff000000 ffc6ff86
!	%f20 = ffffffff e0000000 ffffffff ff000000
!	%f24 = 00ffffe8 92000000 9272a57b 00000000
!	%f28 = 2474c83c b02c3887 2474c83c ffffff87
	stda	%f16,[%i6+%g0]ASI_BLK_AIUP	! Block Store to 0000000010181400
!	%l7 = 00000000000000ff, Mem[0000000010141430] = 00000000000000ff
	stx	%l7,[%i5+0x030]		! Mem[0000000010141430] = 00000000000000ff
!	%l5 = 00000000ffff0000, Mem[0000000010001400] = 00ff005e
	stwa	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = ffff0000
!	%l3 = 0000000000000488, Mem[0000000010001408] = 00000000
	stha	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 04880000
!	%l2 = 00000000ffffffff, Mem[00000000211c0000] = e800d1d8
	stb	%l2,[%o2+%g0]		! Mem[00000000211c0000] = ff00d1d8

p0_label_446:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041418] = 0000000000000000, %l2 = 00000000ffffffff, %asi = 80
	ldxa	[%i1+0x018]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001410] = 000000ff, %l2 = 0000000000000000
	ldsba	[%i0+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141410] = ff00000000000000, %l1 = c29d2394f779904f
	ldxa	[%i5+%o5]0x80,%l1	! %l1 = ff00000000000000
!	Mem[0000000010041400] = ffff0000, %f1  = ffffffff
	lda	[%i1+%g0]0x80,%f1 	! %f1 = ffff0000
!	Mem[0000000010041412] = 88ffffff, %l5 = 00000000ffff0000, %asi = 80
	ldsha	[%i1+0x012]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010041408] = 000000000000ffff, %l6 = 0000000000ff005e
	ldxa	[%i1+%o4]0x80,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010041400] = ffff00007ba57292, %f2  = 000000ff 000000ff
	ldda	[%i1+%g0]0x80,%f2 	! %f2  = ffff0000 7ba57292
!	Mem[00000000201c0000] = ffff8148, %l2 = ffffffffffffffff
	ldsh	[%o0+%g0],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010081410] = 00ffffe892000000, %l6 = 000000000000ffff, %asi = 80
	ldxa	[%i2+0x010]%asi,%l6	! %l6 = 00ffffe892000000
!	%l5 = ffffffffffffffff, %l6 = 00ffffe892000000, %l0 = 00000000ffc6ff86
	orn	%l5,%l6,%l0		! %l0 = ffffffffffffffff

p0_label_447:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 00ffffe8, %l3 = 0000000000000488
	ldstuba	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181400] = ffffffff ffffffff 00000000 92000000
!	%f0  = ffffffff ffff0000 ffff0000 7ba57292
!	%f4  = 00000000 ff000000 00000000 00000000
!	%f8  = ffff8a22 0000006f ffffff87 000000ff
!	%f12 = 7ba57200 00000000 ff72a57b ff000000
	stda	%f0 ,[%i6+%g0]ASI_BLK_SL	! Block Store to 0000000030181400
!	%l7 = 00000000000000ff, Mem[0000000010141408] = ffffffff
	stwa	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000ff
!	%l0 = ffffffffffffffff, Mem[000000001010140f] = 0000ffff, %asi = 80
	stba	%l0,[%i4+0x00f]%asi	! Mem[000000001010140c] = 0000ffff
!	Mem[0000000030041410] = ffff0000, %l5 = ffffffffffffffff
	ldstuba	[%i1+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[00000000100c1420] = ff000000000000ff
	stx	%l7,[%i3+0x020]		! Mem[00000000100c1420] = 00000000000000ff
!	%l2 = ffffffffffffffff, %l3 = 0000000000000000, %l4 = 0000000000000000
	sdivx	%l2,%l3,%l4		! Div by zero, %l0 = 0000000000000027
!	%f26 = 9272a57b 00000000, %l6 = 00ffffe892000000
!	Mem[00000000100c1420] = 00000000000000ff
	add	%i3,0x020,%g1
	stda	%f26,[%g1+%l6]ASI_PST16_P ! Mem[00000000100c1420] = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000030081408] = 87ffff00
	stha	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = 87ff00ff
	membar	#Sync			! Added by membar checker (64)
!	Mem[0000000030181410] = ff000000, %l3 = 0000000000000000
	swapa	[%i6+%o5]0x89,%l3	! %l3 = 00000000ff000000

p0_label_448:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00000000, %l3 = 00000000ff000000
	lduba	[%i4+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141400] = ffc828c5, %l1 = ff00000000000000
	ldsba	[%i5+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041400] = ffff0000, %l6 = 00ffffe892000000
	lduwa	[%i1+%g0]0x80,%l6	! %l6 = 00000000ffff0000
!	Mem[0000000030001410] = ffffffff 4a000000, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i0+%o5]0x81,%l4	! %l4 = 00000000ffffffff 000000004a000000
!	Mem[0000000010081402] = ffffffff, %l3 = 0000000000000000
	ldsb	[%i2+0x002],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030041408] = ffffffff, %l4 = 00000000ffffffff
	lduwa	[%i1+%o4]0x81,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000030041408] = ffffffff, %l3 = ffffffffffffffff
	lduwa	[%i1+%o4]0x81,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000030141410] = 000080ff00ffffff, %f2  = ffff0000 7ba57292
	ldda	[%i5+%o5]0x89,%f2 	! %f2  = 000080ff 00ffffff
!	Mem[000000001004143e] = 7ba572ff, %l0 = 0000000000000027, %asi = 80
	lduba	[%i1+0x03e]%asi,%l0	! %l0 = 0000000000000072
!	Mem[0000000010181400] = 7ba57292, %l5 = 000000004a000000
	lduha	[%i6+%g0]0x88,%l5	! %l5 = 0000000000007292

p0_label_449:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 00000000, %l3 = 00000000ffffffff
	ldstuba	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000000
!	%l2 = ffffffffffffffff, Mem[0000000010181408] = 000000ff
	stwa	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffffff
!	Mem[0000000010081400] = ffffffff, %l7 = 00000000000000ff
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 00000000ffffffff
!	%l6 = ffff0000, %l7 = ffffffff, Mem[0000000010181430] = 2474c83c b02c3887
	std	%l6,[%i6+0x030]		! Mem[0000000010181430] = ffff0000 ffffffff
!	Mem[0000000010101408] = 00000000, %l1 = 00000000ffffffff
	swapa	[%i4+%o4]0x80,%l1	! %l1 = 0000000000000000
!	%f6  = 00000000, Mem[00000000100c1408] = 6fffffff
	sta	%f6 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	Mem[0000000010041410] = ffffff88, %l3 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l3	! %l3 = 00000000ffffff88
!	%f29 = b02c3887, Mem[0000000030141400] = 000000ff
	sta	%f29,[%i5+%g0]0x89	! Mem[0000000030141400] = b02c3887
!	Mem[0000000010041400] = 0000ffff, %l5 = 0000000000007292
	swapa	[%i1+%g0]0x88,%l5	! %l5 = 000000000000ffff
!	%l0 = 0000000000000072, Mem[0000000030181400] = ffff0000
	stha	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = ffff0072

p0_label_450:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ffffffff, %l1 = 0000000000000000
	ldsha	[%i6+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010181408] = ffffffff, %l1 = ffffffffffffffff
	ldsha	[%i6+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010141408] = ff000000, %l7 = 00000000ffffffff
	lduwa	[%i5+%o4]0x88,%l7	! %l7 = 00000000ff000000
!	Mem[00000000201c0000] = ffff8148, %l2 = ffffffffffffffff, %asi = 80
	ldsba	[%o0+0x000]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010001438] = ffffffe0 00000000, %l4 = ffffffff, %l5 = 0000ffff, %asi = 80
	ldda	[%i0+0x038]%asi,%l4	! %l4 = 00000000ffffffe0 0000000000000000
!	Mem[0000000010181432] = ffff0000, %l1 = ffffffffffffffff
	ldub	[%i6+0x032],%l1		! %l1 = 0000000000000000
!	Mem[0000000010101400] = 0000ffff 87ffffff, %l4 = ffffffe0, %l5 = 00000000
	ldda	[%i4+%g0]0x88,%l4	! %l4 = 0000000087ffffff 000000000000ffff
!	Mem[0000000010001418] = 0000ff00 ff000000, %l6 = ffff0000, %l7 = ff000000
	ldd	[%i0+0x018],%l6		! %l6 = 000000000000ff00 00000000ff000000
!	Mem[0000000010041410] = 00000000 ff000000, %l0 = 00000072, %l1 = 00000000
	ldd	[%i1+%o5],%l0		! %l0 = 0000000000000000 00000000ff000000
!	Mem[0000000010001400] = ffff0000, %l3 = 00000000ffffff88
	lduha	[%i0+%g0]0x80,%l3	! %l3 = 000000000000ffff

p0_label_451:
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffffff, Mem[00000000100c1410] = 2474c8ff
	stba	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff74c8ff
!	%f27 = 00000000, %f19 = ffc6ff86, %f16 = 9272a57b 0000ffff
	fsmuld	%f27,%f19,%f16		! %f16 = fff8dff0 c0000000
!	Mem[0000000030141408] = 8000e8ff, %l6 = 000000000000ff00
	swapa	[%i5+%o4]0x89,%l6	! %l6 = 000000008000e8ff
!	Mem[00000000100c1400] = 00000000, %l2 = ffffffffffffffff
	ldstuba	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l6 = 000000008000e8ff
	swapa	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000
!	%l7 = 00000000ff000000, Mem[0000000010001410] = ff000000
	stw	%l7,[%i0+%o5]		! Mem[0000000010001410] = ff000000
!	Mem[0000000030041408] = ffffffff, %l3 = 000000000000ffff
	swapa	[%i1+%o4]0x81,%l3	! %l3 = 00000000ffffffff
!	%l4 = 0000000087ffffff, Mem[0000000030141410] = 00ffffff
	stha	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 00ffffff
!	%l2 = 0000000000000000, Mem[00000000211c0000] = ff00d1d8, %asi = 80
	stha	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0000d1d8
!	%l4 = 0000000087ffffff, Mem[0000000030001400] = 9272a55e
	stba	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 9272a5ff

p0_label_452:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 000000ff000000ff, %f2  = 000080ff 00ffffff
	ldda	[%i3+%o4]0x81,%f2 	! %f2  = 000000ff 000000ff
!	Mem[0000000010041400] = 92720000, %l7 = 00000000ff000000
	ldsha	[%i1+%g0]0x80,%l7	! %l7 = ffffffffffff9272
!	Mem[00000000300c1408] = 000000ff000000ff, %f12 = 7ba57200 00000000
	ldda	[%i3+%o4]0x81,%f12	! %f12 = 000000ff 000000ff
!	Mem[00000000211c0000] = 0000d1d8, %l4 = 0000000087ffffff
	ldsb	[%o2+%g0],%l4		! %l4 = 0000000000000000
!	Mem[0000000030181408] = 9272a57b, %l1 = 00000000ff000000
	ldswa	[%i6+%o4]0x81,%l1	! %l1 = ffffffff9272a57b
!	%l0 = 0000000000000000, imm = fffffffffffffe83, %l4 = 0000000000000000
	andn	%l0,-0x17d,%l4		! %l4 = 0000000000000000
!	Mem[0000000030101410] = 0000001c, %l6 = 0000000000000000
	ldsha	[%i4+%o5]0x89,%l6	! %l6 = 000000000000001c
!	Mem[00000000100c1438] = ff0e0000ff340000, %l0 = 0000000000000000
	ldx	[%i3+0x038],%l0		! %l0 = ff0e0000ff340000
!	Mem[0000000030001400] = 9272a5ff, %l5 = 000000000000ffff
	ldswa	[%i0+%g0]0x89,%l5	! %l5 = ffffffff9272a5ff
!	Mem[0000000010101408] = ffff0000 ffffffff, %l2 = 00000000, %l3 = ffffffff
	ldda	[%i4+%o4]0x88,%l2	! %l2 = 00000000ffffffff 00000000ffff0000

p0_label_453:
!	Starting 10 instruction Store Burst
!	%f2  = 000000ff, %f23 = ff000000
	fcmpes	%fcc1,%f2 ,%f23		! %fcc1 = 2
!	Mem[0000000010101424] = ff6f00ff, %l5 = 9272a5ff, %l5 = 9272a5ff
	add	%i4,0x24,%g1
	casa	[%g1]0x80,%l5,%l5	! %l5 = 00000000ff6f00ff
!	%l3 = 00000000ffff0000, Mem[0000000030041408] = ff000000ffff0000
	stxa	%l3,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000ffff0000
!	Mem[0000000010141418] = 0762a74400ff0000, %l7 = ffffffffffff9272, %l6 = 000000000000001c
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l7,%l6	! %l6 = 0762a74400ff0000
!	Mem[00000000100c1400] = 000000ff, %l3 = 00000000ffff0000
	swapa	[%i3+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	%l2 = 00000000ffffffff, Mem[0000000010101410] = 3cc87424
	stha	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 3cc8ffff
!	%f4  = 00000000 ff000000, Mem[0000000010041408] = 000000ff ffff0000
	stda	%f4 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000 ff000000
!	%l4 = 00000000, %l5 = ff6f00ff, Mem[0000000030181400] = 7200ffff ffffffff
	stda	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000 ff6f00ff
!	%f22 = ffffffff ff000000, Mem[0000000010141408] = 000000ff 00000000
	std	%f22,[%i5+%o4]		! Mem[0000000010141408] = ffffffff ff000000
!	Mem[0000000010141423] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i5+0x023]%asi,%l4	! %l4 = 0000000000000000

p0_label_454:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 9272a57b, %l4 = 0000000000000000
	ldsba	[%i6+%o4]0x81,%l4	! %l4 = ffffffffffffff92
!	Mem[0000000010081410] = e8ffffff, %l3 = 00000000000000ff
	ldsha	[%i2+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000201c0000] = ffff8148, %l7 = ffffffffffff9272
	ldub	[%o0+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010181410] = ffffffff, %l7 = 00000000000000ff
	ldsha	[%i6+%o5]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010001400] = ffff0000000000ff, %f24 = 00ffffe8 92000000
	ldda	[%i0+%g0]0x80,%f24	! %f24 = ffff0000 000000ff
!	Mem[0000000010001434] = 00000053, %l0 = ff0e0000ff340000
	lduw	[%i0+0x034],%l0		! %l0 = 0000000000000053
!	Mem[00000000100c1410] = ff74c8ff, %l2 = 00000000ffffffff
	ldswa	[%i3+%o5]0x80,%l2	! %l2 = ffffffffff74c8ff
!	Mem[0000000030041408] = ffff0000, %l6 = 0762a74400ff0000
	lduwa	[%i1+%o4]0x89,%l6	! %l6 = 00000000ffff0000
!	Mem[0000000030141400] = 87382cb0, %l1 = ffffffff9272a57b
	lduba	[%i5+%g0]0x81,%l1	! %l1 = 0000000000000087
!	Mem[0000000021800180] = ffff5728, %l7 = ffffffffffffffff
	lduh	[%o3+0x180],%l7		! %l7 = 000000000000ffff

p0_label_455:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041406] = 7ba57292, %l0 = 0000000000000053
	ldstub	[%i1+0x006],%l0		! %l0 = 0000000000000072
!	Mem[00000000100c1408] = 00000000, %l5 = 00000000ff6f00ff
	ldstuba	[%i3+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000218000c0] = ffff5a98, %l3 = ffffffffffffffff
	ldstub	[%o3+0x0c0],%l3		! %l3 = 00000000000000ff
!	%l6 = 00000000ffff0000, Mem[0000000010181428] = 9272a57b
	sth	%l6,[%i6+0x028]		! Mem[0000000010181428] = 0000a57b
!	Mem[00000000211c0001] = 0000d1d8, %l5 = 0000000000000000
	ldstub	[%o2+0x001],%l5		! %l5 = 0000000000000000
!	%l1 = 0000000000000087, imm = fffffffffffffd84, %l3 = 00000000000000ff
	or	%l1,-0x27c,%l3		! %l3 = fffffffffffffd87
!	%l6 = 00000000ffff0000, Mem[00000000100c1400] = ffff0000
	stba	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffff0000
!	%l4 = ffffffffffffff92, Mem[0000000030141400] = b02c3887
	stba	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = b02c3892
!	Mem[00000000218001c1] = ff00a358, %l4 = ffffffffffffff92
	ldstuba	[%o3+0x1c1]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l3 = fffffffffffffd87
	ldstuba	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000000

p0_label_456:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ffff0000, %l1 = 0000000000000087
	ldswa	[%i0+%g0]0x80,%l1	! %l1 = ffffffffffff0000
!	Mem[00000000300c1400] = ffffffff 84928804, %l0 = 00000072, %l1 = ffff0000
	ldda	[%i3+%g0]0x89,%l0	! %l0 = 0000000084928804 00000000ffffffff
!	Mem[00000000100c1422] = 00000000, %l0 = 0000000084928804, %asi = 80
	ldsha	[%i3+0x022]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181408] = ffffffff, %l2 = ffffffffff74c8ff
	ldswa	[%i6+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010081428] = 228a91fe536f8ce8, %l2 = ffffffffffffffff
	ldx	[%i2+0x028],%l2		! %l2 = 228a91fe536f8ce8
!	Mem[0000000030041410] = ffff0000, %f12 = 000000ff
	lda	[%i1+%o5]0x81,%f12	! %f12 = ffff0000
!	Mem[0000000030081410] = 000000ff, %l1 = 00000000ffffffff
	lduwa	[%i2+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1400] = ffffffff 84928804, %l4 = 00000000, %l5 = 00000000
	ldda	[%i3+%g0]0x89,%l4	! %l4 = 0000000084928804 00000000ffffffff
!	Mem[0000000010101400] = ffffff87, %l6 = 00000000ffff0000
	lduwa	[%i4+%g0]0x80,%l6	! %l6 = 00000000ffffff87
!	Mem[0000000010101410] = ffffc83c 00000000, %l2 = 536f8ce8, %l3 = 00000000
	ldda	[%i4+%o5]0x80,%l2	! %l2 = 00000000ffffc83c 0000000000000000

p0_label_457:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ffffff87, %l3 = 0000000000000000, %l5 = 00000000ffffffff
	xnor	%l6,%l3,%l5		! %l5 = ffffffff00000078
!	%f11 = 000000ff, Mem[0000000030101410] = 0000001c
	sta	%f11,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000ff
!	%f24 = ffff0000, Mem[0000000010001434] = 00000053
	sta	%f24,[%i0+0x034]%asi	! Mem[0000000010001434] = ffff0000
!	%l5 = ffffffff00000078, imm = 00000000000003cb, %l3 = 0000000000000000
	subc	%l5,0x3cb,%l3		! %l3 = fffffffefffffcad
!	%l5 = ffffffff00000078, Mem[0000000010041400] = 92ffa57b00007292
	stxa	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = ffffffff00000078
!	%l6 = ffffff87, %l7 = 0000ffff, Mem[0000000030001410] = ffffffff 0000004a
	stda	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = ffffff87 0000ffff
!	Mem[0000000030141400] = 92382cb0, %l3 = fffffffefffffcad
	ldstuba	[%i5+%g0]0x81,%l3	! %l3 = 0000000000000092
!	%l1 = 00000000000000ff, Mem[0000000030081410] = 87ffffff000000ff
	stxa	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000000000ff
!	%l6 = 00000000ffffff87, %l3 = 0000000000000092, %l5 = ffffffff00000078
	addc	%l6,%l3,%l5		! %l5 = 0000000100000019
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000030081400] = 86ffc60d 00000000
	stda	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000 000000ff

p0_label_458:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ffffffff000000ff, %f8  = ffff8a22 0000006f
	ldda	[%i3+%o4]0x88,%f8 	! %f8  = ffffffff 000000ff
!	Mem[0000000030141408] = 0000ff00, %l0 = 0000000000000000
	ldsha	[%i5+%o4]0x89,%l0	! %l0 = ffffffffffffff00
!	Mem[00000000100c1400] = ffff0000, %l0 = ffffffffffffff00
	ldsha	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081408] = ff00ff87, %l5 = 0000000100000019
	lduha	[%i2+%o4]0x81,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030141400] = ff382cb000000042, %f26 = 9272a57b 00000000
	ldda	[%i5+%g0]0x81,%f26	! %f26 = ff382cb0 00000042
!	Mem[0000000010001400] = 0000ffff, %l3 = 0000000000000092
	ldsba	[%i0+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030101410] = ff000000, %l2 = 00000000ffffc83c
	ldswa	[%i4+%o5]0x81,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010081410] = e8ffffff, %f31 = ffffff87
	lda	[%i2+%o5]0x88,%f31	! %f31 = e8ffffff
!	Mem[00000000100c1420] = 00000000, %l3 = ffffffffffffffff
	ldsb	[%i3+0x020],%l3		! %l3 = 0000000000000000
!	%l2 = ffffffffff000000, %l4 = 0000000084928804, %l7 = 000000000000ffff
	or	%l2,%l4,%l7		! %l7 = ffffffffff928804

p0_label_459:
!	Starting 10 instruction Store Burst
!	%f23 = ff000000, %f17 = c0000000, %f15 = ff000000
	fdivs	%f23,%f17,%f15		! %f15 = 7e800000
!	%l4 = 84928804, %l5 = 0000ff00, Mem[0000000030041408] = ffff0000 00000000
	stda	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 84928804 0000ff00
!	%f26 = ff382cb0, Mem[0000000010141400] = ffc828c5
	sta	%f26,[%i5+%g0]0x80	! Mem[0000000010141400] = ff382cb0
!	%l4 = 0000000084928804, %l7 = ffffffffff928804, %l7 = ffffffffff928804
	xor	%l4,%l7,%l7		! %l7 = ffffffff7b000000
!	%l5 = 000000000000ff00, Mem[00000000100c141b] = 00000000, %asi = 80
	stba	%l5,[%i3+0x01b]%asi	! Mem[00000000100c1418] = 00000000
!	%l5 = 000000000000ff00, Mem[0000000030081408] = ff00ff87
	stba	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000ff87
!	%l2 = ffffffffff000000, Mem[0000000030081408] = 0000ff87
	stwa	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = ff000000
!	%f20 = ffffffff e0000000, %l0 = 0000000000000000
!	Mem[0000000010181418] = ffffffffff000000
	add	%i6,0x018,%g1
	stda	%f20,[%g1+%l0]ASI_PST8_P ! Mem[0000000010181418] = ffffffffff000000
!	%f28 = 2474c83c b02c3887, %l7 = ffffffff7b000000
!	Mem[0000000030141410] = ffffff00ff800000
	add	%i5,0x010,%g1
	stda	%f28,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030141410] = ffffff00ff800000
!	%l7 = ffffffff7b000000, Mem[0000000010041408] = ff000000
	stwa	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = 7b000000

p0_label_460:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 0000007b, %l4 = 0000000084928804
	ldsba	[%i1+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001408] = ff000000, %l3 = 0000000000000000
	lduwa	[%i0+%o4]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010181408] = ffffffff, %l3 = 00000000ff000000
	lduwa	[%i6+%o4]0x80,%l3	! %l3 = 00000000ffffffff
!	Mem[00000000300c1400] = 04889284, %l6 = 00000000ffffff87
	lduba	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000004
!	%l1 = 00000000000000ff, Mem[0000000030101408] = e8000097
	stwa	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ff
!	Mem[0000000010141410] = 000000ff, %l0 = 0000000000000000
	ldsha	[%i5+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1408] = ff000000ffffffff, %f22 = ffffffff ff000000
	ldda	[%i3+%o4]0x80,%f22	! %f22 = ff000000 ffffffff
!	Mem[00000000100c1400] = 0000ffff, %l4 = 0000000000000000
	lduwa	[%i3+%g0]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030181400] = 00000000ff6f00ff, %l3 = 00000000ffffffff
	ldxa	[%i6+%g0]0x81,%l3	! %l3 = 00000000ff6f00ff
!	Mem[00000000201c0000] = ffff8148, %l2 = ffffffffff000000, %asi = 80
	lduba	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff

p0_label_461:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000021800181] = ffff5728
	stb	%l2,[%o3+0x181]		! Mem[0000000021800180] = ffff5728
!	Mem[0000000010041400] = 78000000, %l2 = 00000000000000ff
	swap	[%i1+%g0],%l2		! %l2 = 0000000078000000
!	%f3  = 000000ff, Mem[0000000010001408] = 04880000
	sta	%f3 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000ff
!	%l6 = 0000000000000004, Mem[0000000010081400] = 000000ff
	stba	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 040000ff
!	Mem[0000000030141400] = b02c38ff, %l5 = 000000000000ff00
	swapa	[%i5+%g0]0x89,%l5	! %l5 = 00000000b02c38ff
!	Mem[0000000010041408] = 7b000000, %l6 = 0000000000000004
	ldstuba	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000000
!	%l4 = 000000000000ffff, Mem[0000000010081410] = ffffffe8
	stwa	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000ffff
!	Mem[0000000010041410] = ff000000, %l2 = 0000000078000000
	ldstuba	[%i1+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%l2 = 000000ff, %l3 = ff6f00ff, Mem[0000000030141408] = 00ff0000 00000000
	stda	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000ff ff6f00ff
!	%l7 = ffffffff7b000000, Mem[0000000030001408] = ff000000
	stwa	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 7b000000

p0_label_462:
!	Starting 10 instruction Load Burst
!	%l1 = 00000000000000ff, %l1 = 00000000000000ff, %l6 = 0000000000000000
	xor	%l1,%l1,%l6		! %l6 = 0000000000000000
!	Mem[00000000300c1400] = 04889284 ffffffff, %l0 = 000000ff, %l1 = 000000ff
	ldda	[%i3+%g0]0x81,%l0	! %l0 = 0000000004889284 00000000ffffffff
!	Mem[0000000030081408] = ff000000000000ff, %l1 = 00000000ffffffff
	ldxa	[%i2+%o4]0x89,%l1	! %l1 = ff000000000000ff
!	Mem[0000000010101400] = ffffff87ffff0000, %f18 = ff000000 ffc6ff86
	ldd	[%i4+%g0],%f18		! %f18 = ffffff87 ffff0000
!	Mem[00000000201c0000] = ffff8148, %l0 = 0000000004889284
	ldub	[%o0+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010181408] = ffffffff, %l3 = 00000000ff6f00ff
	ldswa	[%i6+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000100c1400] = 0000ffff 00000097, %l0 = 000000ff, %l1 = 000000ff
	ldda	[%i3+%g0]0x80,%l0	! %l0 = 000000000000ffff 0000000000000097
!	Mem[00000000100c1410] = ff74c8ffb02c3887, %l3 = ffffffffffffffff
	ldxa	[%i3+%o5]0x80,%l3	! %l3 = ff74c8ffb02c3887
!	%l3 = ff74c8ffb02c3887, %l3 = ff74c8ffb02c3887, %l7 = ffffffff7b000000
	and	%l3,%l3,%l7		! %l7 = ff74c8ffb02c3887
!	Mem[0000000030081410] = ff000000, %f18 = ffffff87
	lda	[%i2+%o5]0x81,%f18	! %f18 = ff000000

p0_label_463:
!	Starting 10 instruction Store Burst
!	%l3 = ff74c8ffb02c3887, Mem[000000001014141a] = 0762a744, %asi = 80
	stha	%l3,[%i5+0x01a]%asi	! Mem[0000000010141418] = 07623887
!	%l7 = ff74c8ffb02c3887, Mem[0000000030101410] = 000000ff
	stba	%l7,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000087
!	%f26 = ff382cb0 00000042, Mem[00000000100c1410] = ff74c8ff b02c3887
	stda	%f26,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff382cb0 00000042
!	%l6 = 0000000000000000, Mem[00000000300c1400] = ffffffff84928804
	stxa	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000000000000
!	%l5 = 00000000b02c38ff, Mem[0000000010181400] = 9272a57b
	stha	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 38ffa57b
!	%l2 = 000000ff, %l3 = b02c3887, Mem[0000000010041400] = 000000ff ffffffff
	stda	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff b02c3887
!	Mem[0000000010141418] = 0762388700ff0000, %l4 = 000000000000ffff, %l7 = ff74c8ffb02c3887
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l4,%l7	! %l7 = 0762388700ff0000
!	%l0 = 0000ffff, %l1 = 00000097, Mem[0000000010081408] = 87ffffff 000000ff
	std	%l0,[%i2+%o4]		! Mem[0000000010081408] = 0000ffff 00000097
!	%l1 = 0000000000000097, Mem[0000000030081408] = 000000ff
	stba	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000097
!	%f16 = fff8dff0, Mem[0000000010101400] = 87ffffff
	sta	%f16,[%i4+%g0]0x88	! Mem[0000000010101400] = fff8dff0

p0_label_464:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800001] = fffff578, %l2 = 00000000000000ff, %asi = 80
	ldsba	[%o1+0x001]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030141400] = 00ff0000, %l1 = 0000000000000097
	ldswa	[%i5+%g0]0x81,%l1	! %l1 = 0000000000ff0000
!	Mem[00000000218001c0] = ffffa358, %l5 = 00000000b02c38ff, %asi = 80
	lduba	[%o3+0x1c0]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[00000000211c0001] = 00ffd1d8, %l0 = 000000000000ffff
	ldub	[%o2+0x001],%l0		! %l0 = 00000000000000ff
!	%f23 = ffffffff, %f4  = 00000000
	fsqrts	%f23,%f4 		! %f4  = ffffffff
!	Mem[0000000010181408] = ffffffff, %l0 = 00000000000000ff
	lduwa	[%i6+%o4]0x88,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000030141400] = 00ff0000, %f18 = ff000000
	lda	[%i5+%g0]0x81,%f18	! %f18 = 00ff0000
!	%f10 = ffffff87, Mem[00000000100c1410] = ff382cb0
	sta	%f10,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffffff87
!	Mem[000000001014143f] = 00ff0000, %l4 = 000000000000ffff
	ldsb	[%i5+0x03f],%l4		! %l4 = 0000000000000000
!	Mem[0000000030001410] = ffffff87, %l4 = 0000000000000000
	lduha	[%i0+%o5]0x89,%l4	! %l4 = 000000000000ff87

p0_label_465:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181438] = 2474c83c, %l6 = 00000000, %l3 = b02c3887
	add	%i6,0x38,%g1
	casa	[%g1]0x80,%l6,%l3	! %l3 = 000000002474c83c
!	%f4  = ffffffff ff000000, Mem[0000000010101428] = 1c0000ff ff000000, %asi = 80
	stda	%f4 ,[%i4+0x028]%asi	! Mem[0000000010101428] = ffffffff ff000000
!	Mem[0000000010101430] = 20ff8aff, %l7 = 00ff0000, %l6 = 00000000
	add	%i4,0x30,%g1
	casa	[%g1]0x80,%l7,%l6	! %l6 = 0000000020ff8aff
!	Mem[0000000010181408] = ffffffff, %l4 = 000000000000ff87
	swapa	[%i6+%o4]0x80,%l4	! %l4 = 00000000ffffffff
!	%l2 = ffffffff, %l3 = 2474c83c, Mem[0000000030101400] = 8000e8ff 00000000
	stda	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffffff 2474c83c
!	%l7 = 0762388700ff0000, Mem[0000000010101434] = 0000006f, %asi = 80
	stwa	%l7,[%i4+0x034]%asi	! Mem[0000000010101434] = 00ff0000
!	Mem[000000001008143c] = 0000ffff, %l3 = 2474c83c, %l3 = 2474c83c
	add	%i2,0x3c,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 000000000000ffff
!	%l2 = ffffffffffffffff, Mem[0000000030101408] = ff000000
	stwa	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = ffffffff
!	Mem[0000000010001418] = 0000ff00ff000000, %l4 = 00000000ffffffff, %l3 = 000000000000ffff
	add	%i0,0x18,%g1
	casxa	[%g1]0x80,%l4,%l3	! %l3 = 0000ff00ff000000
!	Mem[00000000100c1400] = ffff0000, %l7 = 0000000000ff0000
	swapa	[%i3+%g0]0x88,%l7	! %l7 = 00000000ffff0000

p0_label_466:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff8148, %l3 = 0000ff00ff000000, %asi = 80
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000020800000] = fffff578, %l3 = ffffffffffffffff
	ldsh	[%o1+%g0],%l3		! %l3 = ffffffffffffffff
!	Mem[00000000100c1408] = ffffffff 000000ff, %l4 = ffffffff, %l5 = 000000ff
	ldda	[%i3+%o4]0x88,%l4	! %l4 = 00000000000000ff 00000000ffffffff
!	Mem[00000000300c1400] = 00000000, %l7 = 00000000ffff0000
	ldsba	[%i3+%g0]0x89,%l7	! %l7 = 0000000000000000
!	%l6 = 0000000020ff8aff, imm = 0000000000000926, %l3 = ffffffffffffffff
	and	%l6,0x926,%l3		! %l3 = 0000000000000826
!	%f6  = 00000000, %f3  = 000000ff
	fcmps	%fcc0,%f6 ,%f3 		! %fcc0 = 1
!	Mem[0000000030081410] = ff000000 00000000, %l2 = ffffffff, %l3 = 00000826
	ldda	[%i2+%o5]0x81,%l2	! %l2 = 00000000ff000000 0000000000000000
!	Mem[0000000010101410] = 00000000 3cc8ffff, %l4 = 000000ff, %l5 = ffffffff
	ldda	[%i4+%o5]0x88,%l4	! %l4 = 000000003cc8ffff 0000000000000000
!	Mem[0000000030101408] = ff000000ffffffff, %f0  = ffffffff ffff0000
	ldda	[%i4+%o4]0x89,%f0 	! %f0  = ff000000 ffffffff
!	Mem[0000000030181400] = ff006fff00000000, %l3 = 0000000000000000
	ldxa	[%i6+%g0]0x89,%l3	! %l3 = ff006fff00000000

p0_label_467:
!	Starting 10 instruction Store Burst
!	%f10 = ffffff87 000000ff, Mem[00000000300c1408] = ff000000 ff000000
	stda	%f10,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffff87 000000ff
!	%f12 = ffff0000 000000ff, %l7 = 0000000000000000
!	Mem[0000000010081428] = 228a91fe536f8ce8
	add	%i2,0x028,%g1
	stda	%f12,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010081428] = 228a91fe536f8ce8
!	%l4 = 000000003cc8ffff, Mem[0000000010101400] = fff8dff0
	stha	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = fff8ffff
!	Mem[0000000010181428] = 0000a57b00000000, %l3 = ff006fff00000000, %l6 = 0000000020ff8aff
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l3,%l6	! %l6 = 0000a57b00000000
!	%l0 = 00000000ffffffff, Mem[0000000010041400] = 87382cb0ff000000
	stxa	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000ffffffff
!	%f10 = ffffff87 000000ff, Mem[0000000010041408] = ff00007b 00000000
	std	%f10,[%i1+%o4]		! Mem[0000000010041408] = ffffff87 000000ff
!	%l7 = 0000000000000000, Mem[0000000010041400] = ffffffff
	stba	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = ffffff00
!	%l7 = 0000000000000000, Mem[0000000030081410] = 000000ff
	stba	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	%l3 = ff006fff00000000, Mem[00000000100c1408] = 000000ff
	stwa	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	%l4 = 000000003cc8ffff, Mem[0000000010001406] = 000000ff
	stb	%l4,[%i0+0x006]		! Mem[0000000010001404] = 0000ffff

p0_label_468:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff000000, %l4 = 000000003cc8ffff
	ldsba	[%i1+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030101410] = 00000087, %l7 = 0000000000000000
	ldswa	[%i4+%o5]0x89,%l7	! %l7 = 0000000000000087
!	Mem[0000000030001408] = 0000007b, %l2 = 00000000ff000000
	lduwa	[%i0+%o4]0x89,%l2	! %l2 = 000000000000007b
!	Mem[0000000010041400] = ffffff00, %l5 = 0000000000000000
	lduwa	[%i1+%g0]0x88,%l5	! %l5 = 00000000ffffff00
!	Mem[00000000100c1410] = ffffff87 00000042, %l6 = 00000000, %l7 = 00000087
	ldda	[%i3+%o5]0x80,%l6	! %l6 = 00000000ffffff87 0000000000000042
!	Mem[00000000100c1405] = 00000097, %l2 = 000000000000007b
	ldub	[%i3+0x005],%l2		! %l2 = 0000000000000000
!	Mem[0000000030041410] = 0000ffff, %l2 = 0000000000000000
	ldsha	[%i1+%o5]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[000000001000140b] = 000000ff, %l7 = 0000000000000042, %asi = 80
	ldsba	[%i0+0x00b]%asi,%l7	! %l7 = ffffffffffffffff
!	%l3 = ff006fff00000000, %l7 = ffffffffffffffff, %l2 = ffffffffffffffff
	andn	%l3,%l7,%l2		! %l2 = 0000000000000000
!	Mem[00000000300c1408] = 000000ff, %l1 = 0000000000ff0000
	ldstuba	[%i3+%o4]0x89,%l1	! %l1 = 00000000000000ff

p0_label_469:
!	Starting 10 instruction Store Burst
!	%l4 = ffffffff, %l5 = ffffff00, Mem[0000000010001410] = 000000ff ffffffff
	stda	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffff ffffff00
!	%f28 = 2474c83c b02c3887, %l6 = 00000000ffffff87
!	Mem[0000000030181410] = 0000000000000000
	add	%i6,0x010,%g1
	stda	%f28,[%g1+%l6]ASI_PST32_S ! Mem[0000000030181410] = 2474c83cb02c3887
!	%l6 = ffffff87, %l7 = ffffffff, Mem[0000000010101400] = fff8ffff 0000ffff
	stda	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffff87 ffffffff
!	%l4 = ffffffffffffffff, Mem[0000000020800000] = fffff578, %asi = 80
	stba	%l4,[%o1+0x000]%asi	! Mem[0000000020800000] = fffff578
!	%f18 = 00ff0000, Mem[0000000010001410] = ffffffff
	sta	%f18,[%i0+%o5]0x88	! Mem[0000000010001410] = 00ff0000
!	%l6 = ffffff87, %l7 = ffffffff, Mem[0000000010141410] = ff000000 00000000
	stda	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffff87 ffffffff
!	%l6 = ffffff87, %l7 = ffffffff, Mem[0000000010081410] = 0000ffff 92000000
	std	%l6,[%i2+%o5]		! Mem[0000000010081410] = ffffff87 ffffffff
!	%l1 = 00000000000000ff, Mem[0000000030001408] = 0000007b
	stwa	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000ff
!	Mem[00000000300c1400] = 00000000, %l0 = 00000000ffffffff
	ldstuba	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000
!	%l5 = 00000000ffffff00, %l0 = 0000000000000000, %l7 = ffffffffffffffff
	subc	%l5,%l0,%l7		! %l7 = 00000000ffffff00

p0_label_470:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ffffffff, %l7 = 00000000ffffff00
	ldswa	[%i4+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000100c1400] = 0000ff00, %l1 = 00000000000000ff
	lduba	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101408] = ffffffff 0000ffff, %l4 = ffffffff, %l5 = ffffff00
	ldd	[%i4+%o4],%l4		! %l4 = 00000000ffffffff 000000000000ffff
!	%l3 = ff006fff00000000, %l0 = 0000000000000000, %l7 = ffffffffffffffff
	sub	%l3,%l0,%l7		! %l7 = ff006fff00000000
!	Mem[0000000030081400] = 00000000000000ff, %l3 = ff006fff00000000
	ldxa	[%i2+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	%f16 = fff8dff0 c0000000, %l4 = 00000000ffffffff
!	Mem[00000000300c1428] = ffffff87000000ff
	add	%i3,0x028,%g1
	stda	%f16,[%g1+%l4]ASI_PST16_S ! Mem[00000000300c1428] = fff8dff0c0000000
!	Mem[0000000010181408] = 0000ff87, %l4 = 00000000ffffffff
	ldsha	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001408] = ff000000000000ff, %f6  = 00000000 00000000
	ldda	[%i0+%o4]0x89,%f6 	! %f6  = ff000000 000000ff
!	Mem[0000000010141408] = ffffffff, %f20 = ffffffff
	lda	[%i5+0x008]%asi,%f20	! %f20 = ffffffff
!	Mem[0000000030081408] = 97000000, %f4  = ffffffff
	lda	[%i2+%o4]0x81,%f4 	! %f4 = 97000000

p0_label_471:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[00000000100c1400] = 0000ff00
	stwa	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	%f15 = 7e800000, %f18 = 00ff0000, %f20 = ffffffff
	fmuls	%f15,%f18,%f20		! %f20 = 3fff0000
!	Mem[0000000030001410] = 87ffffff, %l6 = 00000000ffffff87
	ldstuba	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000087
!	%f24 = ffff0000, Mem[00000000100c1410] = 87ffffff
	sta	%f24,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffff0000
!	Mem[0000000010181400] = 38ffa57b0000ffff, %l2 = 0000000000000000, %l7 = ff006fff00000000
	casxa	[%i6]0x80,%l2,%l7	! %l7 = 38ffa57b0000ffff
!	%l4 = 0000000000000000, Mem[0000000030081408] = 97000000
	stha	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	%l5 = 000000000000ffff, Mem[0000000010141408] = ffffffffff000000
	stxa	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000000000ffff
!	Mem[00000000100c1408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i3+%o4]0x88,%l2	! %l2 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010041408] = ffffff87
	stba	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 00ffff87
!	%l0 = 0000000000000000, Mem[0000000010101410] = ffffc83c
	stwa	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000

p0_label_472:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = fffff578, %l6 = 0000000000000087, %asi = 80
	lduba	[%o1+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001400] = 0000ffff, %l5 = 000000000000ffff
	lduba	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000021800100] = 00ffb2c8, %l5 = 00000000000000ff, %asi = 80
	lduha	[%o3+0x100]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181400] = 00000000, %l5 = 00000000000000ff
	ldswa	[%i6+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141410] = ffffff00ff800000, %f24 = ffff0000 000000ff
	ldda	[%i5+%o5]0x81,%f24	! %f24 = ffffff00 ff800000
!	Mem[0000000030041408] = 0000ff0084928804, %f10 = ffffff87 000000ff
	ldda	[%i1+%o4]0x89,%f10	! %f10 = 0000ff00 84928804
!	Mem[0000000010141400] = ff382cb0, %l6 = 00000000000000ff
	ldsba	[%i5+%g0]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000100c1410] = 0000ffff00000042, %l0 = 0000000000000000
	ldxa	[%i3+%o5]0x80,%l0	! %l0 = 0000ffff00000042
!	Mem[0000000010181408] = 0000ff87ffc6ff86, %l0 = 0000ffff00000042, %asi = 80
	ldxa	[%i6+0x008]%asi,%l0	! %l0 = 0000ff87ffc6ff86
!	Mem[0000000030141400] = 00ff0000, %l7 = 38ffa57b0000ffff
	ldswa	[%i5+%g0]0x81,%l7	! %l7 = 0000000000ff0000

p0_label_473:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 000000ff, %l7 = 0000000000ff0000
	ldstuba	[%i0+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001410] = 0000ff00, %l3 = 00000000000000ff
	ldstuba	[%i0+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%l7 = 00000000000000ff, Mem[0000000010181408] = 87ff0000
	stba	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 87ff00ff
!	Mem[0000000010001410] = ff00ff00, %l4 = 0000000000000000
	ldstuba	[%i0+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%f6  = ff000000 000000ff, %l0 = 0000ff87ffc6ff86
!	Mem[0000000010101428] = ffffffffff000000
	add	%i4,0x028,%g1
	stda	%f6,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010101428] = ffff000000000000
!	Mem[00000000300c1410] = ff000000, %l0 = 00000000ffc6ff86
	swapa	[%i3+%o5]0x81,%l0	! %l0 = 00000000ff000000
!	%f4  = 97000000, Mem[0000000010081408] = ffff0000
	sta	%f4 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 97000000
!	%l6 = ffffffffffffffff, Mem[0000000030141410] = 00ffffff
	stba	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 00ffffff
!	%l0 = 00000000ff000000, Mem[0000000030181410] = 2474c83c
	stba	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 0074c83c
!	%l2 = 0000000000000000, Mem[0000000010001408] = 000000ff
	stw	%l2,[%i0+%o4]		! Mem[0000000010001408] = 00000000

p0_label_474:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00ffd1d8, %l4 = 00000000000000ff
	ldsh	[%o2+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030141410] = ffffff00ff800000, %f30 = 2474c83c e8ffffff
	ldda	[%i5+%o5]0x81,%f30	! %f30 = ffffff00 ff800000
!	Mem[00000000100c1420] = 00000000000000ff, %l3 = 0000000000000000, %asi = 80
	ldxa	[%i3+0x020]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041400] = ffffffff ffffff87, %l0 = ff000000, %l1 = 00000000
	ldda	[%i1+%g0]0x81,%l0	! %l0 = 00000000ffffffff 00000000ffffff87
!	Mem[0000000030081410] = 0000000000000000, %f18 = 00ff0000 ffff0000
	ldda	[%i2+%o5]0x81,%f18	! %f18 = 00000000 00000000
!	Mem[0000000010181400] = 38ffa57b 0000ffff, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i6+%g0]0x80,%l2	! %l2 = 0000000038ffa57b 000000000000ffff
!	Mem[0000000010001410] = ff00ff00, %l2 = 0000000038ffa57b
	ldsha	[%i0+%o5]0x80,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010041408] = 00ffff87, %l2 = ffffffffffffff00
	ldsba	[%i1+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = ffffffff, %l1 = 00000000ffffff87
	ldsha	[%i4+%o4]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000300c1408] = 000000ff, %f8  = ffffffff
	lda	[%i3+%o4]0x89,%f8 	! %f8 = 000000ff

p0_label_475:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ffffffff, Mem[0000000010001408] = 00000000
	stha	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = ffff0000
!	%l2 = 0000000000000000, Mem[0000000010181400] = ffff00007ba5ff38
	stxa	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000000000000000
!	%l1 = ffffffffffffffff, Mem[0000000010001438] = ffffffe000000000
	stx	%l1,[%i0+0x038]		! Mem[0000000010001438] = ffffffffffffffff
!	Mem[00000000211c0001] = 00ffd1d8, %l7 = 00000000000000ff
	ldstuba	[%o2+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	%f4  = 97000000 ff000000, Mem[0000000010181418] = ffffffff ff000000, %asi = 80
	stda	%f4 ,[%i6+0x018]%asi	! Mem[0000000010181418] = 97000000 ff000000
!	Mem[0000000010081400] = 040000ff, %l0 = 00000000ffffffff
	swap	[%i2+%g0],%l0		! %l0 = 00000000040000ff
!	%f16 = fff8dff0 c0000000, Mem[0000000010001408] = ffff0000 004a0ec3, %asi = 80
	stda	%f16,[%i0+0x008]%asi	! Mem[0000000010001408] = fff8dff0 c0000000
!	Mem[00000000100c1408] = ff000000, %l3 = 000000000000ffff
	swapa	[%i3+%o4]0x80,%l3	! %l3 = 00000000ff000000
!	%l7 = 00000000000000ff, Mem[00000000300c1408] = ff000000
	stha	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00ff0000
!	Mem[0000000030081410] = 00000000, %l6 = 00000000ffffffff
	swapa	[%i2+%o5]0x89,%l6	! %l6 = 0000000000000000

p0_label_476:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 00000000, %f14 = ff72a57b
	lda	[%i3+%g0]0x88,%f14	! %f14 = 00000000
!	%l4 = 00000000000000ff, %l1 = ffffffffffffffff, %l6  = 0000000000000000
	mulx	%l4,%l1,%l6		! %l6 = ffffffffffffff01
!	Mem[0000000010141410] = 87ffffff, %l1 = ffffffffffffffff
	ldsba	[%i5+%o5]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010081400] = ffffffff, %l1 = ffffffffffffffff
	lduwa	[%i2+%g0]0x80,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000030001410] = ffffffff, %l0 = 00000000040000ff
	ldsha	[%i0+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030181408] = 7ba57292, %f28 = 2474c83c
	lda	[%i6+%o4]0x89,%f28	! %f28 = 7ba57292
!	Mem[0000000010001400] = ffff00000000ffff, %l3 = 00000000ff000000
	ldxa	[%i0+%g0]0x88,%l3	! %l3 = ffff00000000ffff
!	Mem[0000000030101410] = 00000087, %l1 = 00000000ffffffff
	lduwa	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000087
!	Mem[0000000030141410] = ffffff00, %l1 = 0000000000000087
	lduba	[%i5+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101410] = 00000087, %l0 = ffffffffffffffff
	ldsba	[%i4+%o5]0x89,%l0	! %l0 = ffffffffffffff87

p0_label_477:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 00ff0000, %l2 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = 00ffff87, %l3 = 000000000000ffff
	swapa	[%i1+%o4]0x80,%l3	! %l3 = 0000000000ffff87
!	Mem[00000000211c0000] = 00ffd1d8, %l6 = ffffffffffffff01
	ldstub	[%o2+%g0],%l6		! %l6 = 0000000000000000
!	%f12 = ffff0000 000000ff, Mem[0000000030141400] = 0000ff00 42000000
	stda	%f12,[%i5+%g0]0x89	! Mem[0000000030141400] = ffff0000 000000ff
!	Mem[00000000100c1410] = ffff0000, %l1 = 00000000000000ff
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 00000000ffff0000
!	Mem[0000000010081408] = 00000097, %l0 = ffffffffffffff87
	ldstuba	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010041400] = ffffff00
	stha	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = ffff0000
!	Mem[0000000010181400] = 00000000, %l4 = 000000ff, %l2 = 00000000
	casa	[%i6]0x80,%l4,%l2	! %l2 = 0000000000000000
!	%l1 = 00000000ffff0000, Mem[00000000100c1408] = ffff0000
	stba	%l1,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffff0000
!	%l7 = 00000000000000ff, Mem[0000000030141400] = 000000ff
	stba	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff

p0_label_478:
!	Starting 10 instruction Load Burst
!	%l6 = 0000000000000000, %l4 = 00000000000000ff, %l1 = 00000000ffff0000
	udivx	%l6,%l4,%l1		! %l1 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l1 = 0000000000000000
	ldsha	[%i6+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081408] = 00000000, %f31 = ff800000
	lda	[%i2+%o4]0x81,%f31	! %f31 = 00000000
!	Mem[0000000020800040] = 00ff65a8, %l0 = 0000000000000000
	ldsb	[%o1+0x040],%l0		! %l0 = 0000000000000000
!	Mem[00000000300c1400] = ff000000, %l4 = 00000000000000ff
	ldsha	[%i3+%g0]0x81,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000010141410] = ffffff87ffffffff, %l5 = 0000000000000000
	ldxa	[%i5+%o5]0x80,%l5	! %l5 = ffffff87ffffffff
!	Mem[0000000010081408] = 970000ff, %l7 = 00000000000000ff
	ldsba	[%i2+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010081410] = ffffff87 ffffffff, %l2 = 00000000, %l3 = 00ffff87
	ldda	[%i2+%o5]0x80,%l2	! %l2 = 00000000ffffff87 00000000ffffffff
!	Mem[00000000211c0000] = ffffd1d8, %l3 = 00000000ffffffff, %asi = 80
	lduha	[%o2+0x000]%asi,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010101400] = 87ffffff, %l2 = 00000000ffffff87
	ldsba	[%i4+%g0]0x80,%l2	! %l2 = ffffffffffffff87

p0_label_479:
!	Starting 10 instruction Store Burst
!	%f12 = ffff0000 000000ff, Mem[0000000030101410] = 87000000 00000000
	stda	%f12,[%i4+%o5]0x81	! Mem[0000000030101410] = ffff0000 000000ff
!	%l2 = ffffffffffffff87, Mem[0000000010081434] = 00000000
	stw	%l2,[%i2+0x034]		! Mem[0000000010081434] = ffffff87
!	Mem[0000000010141400] = b02c38ff, %l2 = 00000000ffffff87
	swapa	[%i5+%g0]0x88,%l2	! %l2 = 00000000b02c38ff
!	%l0 = 0000000000000000, Mem[0000000030101408] = ffffffff
	stha	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = ffff0000
!	Mem[00000000100c1408] = ffff0000, %l3 = 000000000000ffff
	swapa	[%i3+%o4]0x88,%l3	! %l3 = 00000000ffff0000
!	%l6 = 0000000000000000, Mem[0000000010101410] = 00000000
	stha	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010001428] = 00ff0000, %asi = 80
	stwa	%l6,[%i0+0x028]%asi	! Mem[0000000010001428] = 00000000
!	%f12 = ffff0000 000000ff, Mem[0000000030041410] = ffff0000 7ba57292
	stda	%f12,[%i1+%o5]0x81	! Mem[0000000030041410] = ffff0000 000000ff
!	Mem[0000000030041408] = 84928804, %l0 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l0	! %l0 = 0000000000000004
!	%l7 = ffffffffffffffff, Mem[0000000030001408] = 000000ff
	stwa	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffff

p0_label_480:
!	Starting 10 instruction Load Burst
!	%l5 = ffffff87ffffffff, %l2 = 00000000b02c38ff, %l2 = 00000000b02c38ff
	xnor	%l5,%l2,%l2		! %l2 = 00000078b02c38ff
!	Mem[0000000030041400] = ffffffff, %l2 = 00000078b02c38ff
	ldswa	[%i1+%g0]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000218000c0] = ffff5a98, %l0 = 0000000000000004
	ldub	[%o3+0x0c0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010101408] = ffff0000ffffffff, %l6 = 0000000000000000
	ldxa	[%i4+%o4]0x88,%l6	! %l6 = ffff0000ffffffff
!	Mem[0000000010041410] = 000000ff 000000ff, %l4 = ffffff00, %l5 = ffffffff
	ldda	[%i1+%o5]0x88,%l4	! %l4 = 00000000000000ff 00000000000000ff
!	Mem[0000000030041400] = ffffffff, %l1 = 0000000000000000
	ldswa	[%i1+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010181434] = ffffffff, %l5 = 00000000000000ff
	ldsw	[%i6+0x034],%l5		! %l5 = ffffffffffffffff
!	Mem[00000000100c1410] = ff000000, %l1 = ffffffffffffffff
	lduha	[%i3+%o5]0x80,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010081408] = ff000097, %l7 = ffffffffffffffff
	lduha	[%i2+%o4]0x80,%l7	! %l7 = 000000000000ff00
!	Mem[0000000030141410] = 00ffffff, %l7 = 000000000000ff00
	lduha	[%i5+%o5]0x89,%l7	! %l7 = 000000000000ffff

p0_label_481:
!	Starting 10 instruction Store Burst
!	Mem[0000000020800040] = 00ff65a8, %l5 = ffffffffffffffff
	ldstub	[%o1+0x040],%l5		! %l5 = 0000000000000000
!	Mem[00000000201c0001] = ffff8148, %l6 = ffff0000ffffffff
	ldstub	[%o0+0x001],%l6		! %l6 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000030001408] = ffffffff000000ff
	stxa	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000000000ff
!	%f28 = 7ba57292 b02c3887, Mem[0000000030041400] = ffffffff 87ffffff
	stda	%f28,[%i1+%g0]0x89	! Mem[0000000030041400] = 7ba57292 b02c3887
!	Mem[0000000010001415] = 00ffffff, %l6 = 00000000000000ff
	ldstub	[%i0+0x015],%l6		! %l6 = 00000000000000ff
!	Mem[00000000100c1410] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000010001400] = 0000ffff ffff0000
	stda	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff 000000ff
!	Mem[0000000010101424] = ff6f00ff, %l4 = 00000000000000ff, %asi = 80
	swapa	[%i4+0x024]%asi,%l4	! %l4 = 00000000ff6f00ff
!	Mem[0000000030001408] = 00000000, %l4 = 00000000ff6f00ff
	ldstuba	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000010101400] = ffffff87 ffffffff
	stda	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000 000000ff

p0_label_482:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ff00ff00, %l5 = 00000000000000ff
	lduha	[%i0+%o5]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[0000000010081410] = ffffff87ffffffff, %l3 = 00000000ffff0000
	ldxa	[%i2+%o5]0x80,%l3	! %l3 = ffffff87ffffffff
!	Mem[0000000010181400] = 0000000000000000, %l6 = 00000000000000ff
	ldxa	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Code Fragment 4, seed = 251805
p0_fragment_33:
!	%l0 = 00000000000000ff
	setx	0x1490d63017b3e83e,%g7,%l0 ! %l0 = 1490d63017b3e83e
!	%l1 = 000000000000ff00
	setx	0xe118d2d585c300e9,%g7,%l1 ! %l1 = e118d2d585c300e9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1490d63017b3e83e
	setx	0xa4592da4171455a4,%g7,%l0 ! %l0 = a4592da4171455a4
!	%l1 = e118d2d585c300e9
	setx	0x4edd9f8541d0696f,%g7,%l1 ! %l1 = 4edd9f8541d0696f
p0_fragment_33_end:
!	Mem[0000000010081410] = ffffffff 87ffffff, %l2 = ffffffff, %l3 = ffffffff
	ldda	[%i2+%o5]0x88,%l2	! %l2 = 0000000087ffffff 00000000ffffffff
!	Mem[0000000030101400] = ffffffff3cc87424, %f24 = ffffff00 ff800000
	ldda	[%i4+%g0]0x81,%f24	! %f24 = ffffffff 3cc87424
!	Mem[0000000030041408] = 849288ff, %l2 = 0000000087ffffff
	ldswa	[%i1+%o4]0x89,%l2	! %l2 = ffffffff849288ff
!	Mem[0000000010041418] = 00000000 00000000, %l2 = 849288ff, %l3 = ffffffff
	ldd	[%i1+0x018],%l2		! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000030181410] = 0074c83cb02c3887, %f18 = 00000000 00000000
	ldda	[%i6+%o5]0x81,%f18	! %f18 = 0074c83c b02c3887
!	Mem[0000000010101410] = 00000000, %l6 = 0000000000000000
	ldsha	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000000

p0_label_483:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = ffffffff0000ffff, %l4 = 0000000000000000, %l3 = 0000000000000000
	add	%i4,0x08,%g1
	casxa	[%g1]0x80,%l4,%l3	! %l3 = ffffffff0000ffff
!	%l2 = 0000000000000000, Mem[0000000030041410] = 0000ffff
	stwa	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	%f8  = 000000ff 000000ff, %l5 = 000000000000ff00
!	Mem[0000000010101430] = 20ff8aff00ff0000
	add	%i4,0x030,%g1
	stda	%f8,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010101430] = 20ff8aff00ff0000
!	Mem[0000000010001400] = ff000000, %l3 = ffffffff0000ffff
	ldstuba	[%i0+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	%l0 = 171455a4, %l1 = 41d0696f, Mem[00000000300c1400] = 000000ff 00000000
	stda	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 171455a4 41d0696f
!	%l1 = 4edd9f8541d0696f, Mem[0000000030181400] = 00000000
	stha	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 696f0000
!	%l7 = 000000000000ffff, Mem[0000000030141410] = 00ffffff
	stba	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = 00ffffff
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010181410] = ffffffff 000000e0
	stda	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000 000000ff
!	%f2  = 000000ff 000000ff, Mem[00000000100c1438] = ff0e0000 ff340000
	std	%f2 ,[%i3+0x038]	! Mem[00000000100c1438] = 000000ff 000000ff
!	%f28 = 7ba57292, Mem[0000000030041400] = b02c3887
	sta	%f28,[%i1+%g0]0x89	! Mem[0000000030041400] = 7ba57292

p0_label_484:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000, %l6 = 0000000000000000
	lduwa	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001408] = f0dff8ff, %l2 = 0000000000000000
	lduwa	[%i0+%o4]0x88,%l2	! %l2 = 00000000f0dff8ff
!	Mem[000000001018141b] = 97000000, %l3 = 00000000000000ff
	ldsb	[%i6+0x01b],%l3		! %l3 = 0000000000000000
!	Mem[00000000300c1410] = 00000000 86ffc6ff, %l0 = 171455a4, %l1 = 41d0696f
	ldda	[%i3+%o5]0x89,%l0	! %l0 = 0000000086ffc6ff 0000000000000000
!	Mem[0000000021800140] = 00ff06f8, %l3 = 0000000000000000, %asi = 80
	ldsha	[%o3+0x140]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041410] = 00000000, %l4 = 0000000000000000
	lduha	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (65)
!	Mem[0000000010001400] = ff000000 ff000000 fff8dff0 c0000000
!	Mem[0000000010001410] = ff00ff00 00ffffff 0000ff00 ff000000
!	Mem[0000000010001420] = ff000000 00000000 00000000 ff000000
!	Mem[0000000010001430] = 00000000 ffff0000 ffffffff ffffffff
	ldda	[%i0+%g0]ASI_BLK_AIUP,%f0 	! Block Load from 0000000010001400
!	Mem[0000000010141410] = ffffff87, %l2 = 00000000f0dff8ff
	lduha	[%i5+%o5]0x80,%l2	! %l2 = 000000000000ffff
!	Mem[000000001010141c] = ffffff87, %l5 = 000000000000ff00, %asi = 80
	ldswa	[%i4+0x01c]%asi,%l5	! %l5 = ffffffffffffff87
!	Mem[0000000010181408] = ff00ff87ffc6ff86, %f20 = 3fff0000 e0000000, %asi = 80
	ldda	[%i6+0x008]%asi,%f20	! %f20 = ff00ff87 ffc6ff86

p0_label_485:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000086ffc6ff, Mem[0000000010101408] = ffffffff
	stha	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffc6ff
!	%f30 = ffffff00 00000000, %l2 = 000000000000ffff
!	Mem[00000000100c1410] = ff00000000000042
	add	%i3,0x010,%g1
	stda	%f30,[%g1+%l2]ASI_PST8_P ! Mem[00000000100c1410] = ffffff0000000000
!	%l2 = 000000000000ffff, Mem[0000000010041408] = 0000ffff
	stha	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = ffffffff
!	Mem[0000000030141400] = 000000ff, %l7 = 000000000000ffff
	ldstuba	[%i5+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[0000000010081408] = ff000097
	stha	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = 00ff0097
!	Mem[0000000030001408] = ff000000, %l5 = ffffffffffffff87
	ldstuba	[%i0+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	%f16 = fff8dff0 c0000000, %l1 = 0000000000000000
!	Mem[0000000030001418] = 0000004a5bd5464c
	add	%i0,0x018,%g1
	stda	%f16,[%g1+%l1]ASI_PST8_S ! Mem[0000000030001418] = 0000004a5bd5464c
!	%l1 = 0000000000000000, Mem[0000000030001400] = ffa57292
	stha	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 00007292
!	%l6 = 0000000000000000, immd = fffffb66, %y  = 00000000
	sdiv	%l6,-0x49a,%l6		! %l6 = 0000000000000000
	mov	%l0,%y			! %y = 86ffc6ff
!	Mem[0000000010141410] = 87ffffff, %l2 = 000000000000ffff
	swapa	[%i5+%o5]0x88,%l2	! %l2 = 0000000087ffffff

p0_label_486:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0001] = ffff8148, %l7 = 00000000000000ff
	ldsb	[%o0+0x001],%l7		! %l7 = ffffffffffffffff
!	Mem[00000000300c1400] = a4551417, %l7 = ffffffffffffffff
	lduha	[%i3+%g0]0x81,%l7	! %l7 = 000000000000a455
!	Mem[0000000030101400] = ffffffff, %l2 = 0000000087ffffff
	lduha	[%i4+%g0]0x81,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030001410] = 0000ffffffffffff, %l0 = 0000000086ffc6ff
	ldxa	[%i0+%o5]0x89,%l0	! %l0 = 0000ffffffffffff
!	Mem[0000000030081408] = 00000000, %f16 = fff8dff0
	lda	[%i2+%o4]0x81,%f16	! %f16 = 00000000
!	Mem[000000001000141d] = ff000000, %l0 = 0000ffffffffffff, %asi = 80
	lduba	[%i0+0x01d]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1410] = 00ffffff, %l4 = 0000000000000000
	ldsha	[%i3+%o5]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010181424] = 92000000, %l5 = 00000000000000ff, %asi = 80
	ldswa	[%i6+0x024]%asi,%l5	! %l5 = ffffffff92000000
!	Mem[0000000010041400] = ffff0000, %l2 = 000000000000ffff
	ldswa	[%i1+%g0]0x88,%l2	! %l2 = ffffffffffff0000
!	Mem[0000000010141408] = 000000000000ffff, %l5 = ffffffff92000000
	ldxa	[%i5+%o4]0x80,%l5	! %l5 = 000000000000ffff

p0_label_487:
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000ffff, Mem[0000000030081408] = 00000000
	stwa	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000ffff
!	Mem[0000000010081400] = ffffffff, %l7 = 000000000000a455
	swap	[%i2+%g0],%l7		! %l7 = 00000000ffffffff
!	Mem[0000000010181410] = 00000000, %l1 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1410] = 86ffc6ff, %l1 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%f4  = ff00ff00 00ffffff, %l7 = 00000000ffffffff
!	Mem[0000000030101408] = 0000ffff000000ff
	add	%i4,0x008,%g1
	stda	%f4,[%g1+%l7]ASI_PST8_S ! Mem[0000000030101408] = ff00ff0000ffffff
!	Mem[00000000211c0000] = ffffd1d8, %l7 = 00000000ffffffff
	ldsh	[%o2+%g0],%l7		! %l7 = ffffffffffffffff
!	%l7 = ffffffffffffffff, Mem[00000000201c0000] = ffff8148, %asi = 80
	stha	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = ffff8148
!	Mem[0000000021800101] = 00ffb2c8, %l1 = 00000000000000ff
	ldstuba	[%o3+0x101]%asi,%l1	! %l1 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[00000000100c1408] = ffff0000ffffffff
	stxa	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000000000ff
!	Mem[0000000030041408] = ff889284, %l0 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l0	! %l0 = 00000000000000ff

p0_label_488:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ffffffff, %l0 = 00000000000000ff
	ldsha	[%i1+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1400] = 00000000, %l4 = ffffffffffffffff
	ldsba	[%i3+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l5 = 000000000000ffff
	ldsha	[%i3+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1408] = ffffff870000ffff, %f20 = ff00ff87 ffc6ff86
	ldda	[%i3+%o4]0x89,%f20	! %f20 = ffffff87 0000ffff
!	Mem[0000000010101400] = 00000000, %l7 = ffffffffffffffff
	lduwa	[%i4+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101410] = 0000000000000000, %f0  = ff000000 ff000000
	ldda	[%i4+%o5]0x80,%f0 	! %f0  = 00000000 00000000
!	Mem[0000000030101408] = ff00ff0000ffffff, %l1 = 00000000000000ff
	ldxa	[%i4+%o4]0x81,%l1	! %l1 = ff00ff0000ffffff
!	Mem[00000000201c0000] = ffff8148, %l6 = 0000000000000000, %asi = 80
	ldsha	[%o0+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	%l4 = 0000000000000000, immd = 00000122, %y  = 86ffc6ff
	umul	%l4,0x122,%l6		! %l6 = 0000000000000000, %y = 00000000
!	Mem[0000000030041410] = 00000000 000000ff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000 00000000000000ff

p0_label_489:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 0000ffff, %l3 = 00000000000000ff
	ldstuba	[%i4+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	%l1 = ff00ff0000ffffff, Mem[0000000030001408] = 000000ff
	stwa	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 00ffffff
!	Code Fragment 4, seed = 599895
p0_fragment_34:
!	%l0 = ffffffffffffffff
	setx	0xbd91a1387148446e,%g7,%l0 ! %l0 = bd91a1387148446e
!	%l1 = ff00ff0000ffffff
	setx	0xe262999d87806619,%g7,%l1 ! %l1 = e262999d87806619
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = bd91a1387148446e
	setx	0xfc15db5d442073d4,%g7,%l0 ! %l0 = fc15db5d442073d4
!	%l1 = e262999d87806619
	setx	0x59d83944ea21f09f,%g7,%l1 ! %l1 = 59d83944ea21f09f
p0_fragment_34_end:
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010141430] = 00000000 000000ff
	std	%l6,[%i5+0x030]		! Mem[0000000010141430] = 00000000 00000000
!	%l0 = fc15db5d442073d4, Mem[0000000030141400] = 000000ff
	stba	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000d4
!	Mem[0000000010041408] = ffffffff, %l6 = 0000000000000000
	ldstuba	[%i1+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[0000000010181400] = 00000000
	stha	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000010141430] = 00000000 00000000
	std	%l6,[%i5+0x030]		! Mem[0000000010141430] = 000000ff 00000000
!	%l5 = 00000000000000ff, Mem[00000000100c141a] = 00000000
	sth	%l5,[%i3+0x01a]		! Mem[00000000100c1418] = 000000ff
!	Mem[00000000211c0001] = ffffd1d8, %l1 = 59d83944ea21f09f
	ldstub	[%o2+0x001],%l1		! %l1 = 00000000000000ff

p0_label_490:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800041] = ffff9e38, %l3 = 00000000000000ff
	ldub	[%o3+0x041],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010001408] = 000000c0f0dff8ff, %l1 = 00000000000000ff
	ldxa	[%i0+%o4]0x88,%l1	! %l1 = 000000c0f0dff8ff
!	Mem[0000000030181410] = 0074c83c, %l1 = 000000c0f0dff8ff
	ldswa	[%i6+%o5]0x81,%l1	! %l1 = 000000000074c83c
!	Mem[0000000010101408] = ffff0000ffffc6ff, %l0 = fc15db5d442073d4
	ldxa	[%i4+%o4]0x88,%l0	! %l0 = ffff0000ffffc6ff
!	Mem[0000000030001408] = 00ffffff, %f16 = 00000000
	lda	[%i0+%o4]0x89,%f16	! %f16 = 00ffffff
!	Mem[0000000010141400] = ffffff87, %f14 = ffffffff
	lda	[%i5+%g0]0x88,%f14	! %f14 = ffffff87
	membar	#Sync			! Added by membar checker (66)
!	Mem[0000000030081400] = 00000000 000000ff 0000ffff 000000ff
!	Mem[0000000030081410] = ffffffff 00000000 ffff6cf5 5e0497ff
!	Mem[0000000030081420] = 00000000 ffffffff ff15ff00 000000ff
!	Mem[0000000030081430] = 1cc528c5 ff6f8ce8 00ff0000 00000000
	ldda	[%i2+%g0]ASI_BLK_AIUS,%f16	! Block Load from 0000000030081400
!	Mem[0000000010081430] = ff15ff00 ffffff87, %l6 = 000000ff, %l7 = 00000000
	ldd	[%i2+0x030],%l6		! %l6 = 00000000ff15ff00 00000000ffffff87
!	Mem[0000000010081410] = ffffff87ffffffff, %l1 = 000000000074c83c
	ldxa	[%i2+%o5]0x80,%l1	! %l1 = ffffff87ffffffff
!	Mem[0000000030101400] = 2474c83cffffffff, %l5 = 00000000000000ff
	ldxa	[%i4+%g0]0x89,%l5	! %l5 = 2474c83cffffffff

p0_label_491:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 00000000, %l0 = 00000000ffffc6ff
	swapa	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%l0 = 00000000, %l1 = ffffffff, Mem[0000000030181400] = 696f0000 ff6f00ff
	stda	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000 ffffffff
!	%f10 = 00000000 ff000000, %l2 = ffffffffffff0000
!	Mem[0000000030001400] = 0000729200000000
	stda	%f10,[%i0+%l2]ASI_PST32_S ! Mem[0000000030001400] = 0000729200000000
!	Mem[0000000030101410] = 0000ffff, %l6 = 00000000ff15ff00
	ldstuba	[%i4+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%l1 = ffffff87ffffffff, Mem[0000000030001400] = 00007292
	stwa	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = ffffffff
!	%f4  = ff00ff00 00ffffff, %l0 = 0000000000000000
!	Mem[0000000030001438] = cafaf8d3c0000000
	add	%i0,0x038,%g1
	stda	%f4,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030001438] = cafaf8d3c0000000
!	%l1 = ffffff87ffffffff, Mem[0000000030141408] = ff000000
	stwa	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffff
!	%f16 = 00000000 000000ff, Mem[0000000010081400] = 55a40000 6f000000
	stda	%f16,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000 000000ff
!	Mem[0000000030041400] = 9272a57b, %l2 = 00000000ffff0000
	swapa	[%i1+%g0]0x81,%l2	! %l2 = 000000009272a57b
!	%f30 = 00ff0000 00000000, Mem[0000000030001400] = ffffffff 00000000
	stda	%f30,[%i0+%g0]0x81	! Mem[0000000030001400] = 00ff0000 00000000

p0_label_492:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041430] = 0000000000000000, %l5 = 2474c83cffffffff
	ldx	[%i1+0x030],%l5		! %l5 = 0000000000000000
!	Mem[0000000030181408] = 9272a57b, %l7 = 00000000ffffff87
	ldsba	[%i6+%o4]0x81,%l7	! %l7 = ffffffffffffff92
!	Mem[0000000010001408] = fff8dff0, %l0 = 0000000000000000
	ldsba	[%i0+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030141410] = 000080ff 00ffffff, %l0 = ffffffff, %l1 = ffffffff
	ldda	[%i5+%o5]0x89,%l0	! %l0 = 0000000000ffffff 00000000000080ff
!	Mem[0000000010041414] = ff000000, %l6 = 00000000000000ff
	ldsh	[%i1+0x014],%l6		! %l6 = ffffffffffffff00
!	%l6 = ffffffffffffff00, imm = fffffffffffff252, %l0 = 0000000000ffffff
	add	%l6,-0xdae,%l0		! %l0 = fffffffffffff152
!	Mem[0000000010141408] = 00000000, %l4 = 0000000000000000
	lduba	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081408] = 970000009700ff00, %l5 = 0000000000000000
	ldxa	[%i2+%o4]0x88,%l5	! %l5 = 970000009700ff00
!	Mem[0000000010081408] = 00ff0097, %l3 = 00000000000000ff
	lduwa	[%i2+%o4]0x80,%l3	! %l3 = 0000000000ff0097
!	%f14 = ffffff87, %f29 = ff6f8ce8
	fcmps	%fcc2,%f14,%f29		! %fcc2 = 3

p0_label_493:
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffffff00, Mem[0000000030181408] = 9272a57b
	stwa	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffff00
!	%f0  = 00000000, %f11 = ff000000, %f1  = 00000000
	fsubs	%f0 ,%f11,%f1 		! %f1  = 7f000000
!	Mem[0000000030081410] = ffffffff, %l0 = fffffffffffff152
	ldstuba	[%i2+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%l2 = 000000009272a57b, Mem[00000000100c143e] = 000000ff
	stb	%l2,[%i3+0x03e]		! Mem[00000000100c143c] = 00007bff
!	%l3 = 0000000000ff0097, Mem[00000000300c1408] = 0000ffff
	stba	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000ff97
!	%l0 = 000000ff, %l1 = 000080ff, Mem[0000000030041410] = 00000000 000000ff
	stda	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000ff 000080ff
!	%l0 = 00000000000000ff, Mem[0000000030001408] = ffffff00
	stba	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffff00
!	Mem[0000000010081439] = ff000000, %l6 = ffffffffffffff00
	ldstuba	[%i2+0x039]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = ffffffff, %l7 = 00000000ffffff92
	swapa	[%i4+%g0]0x81,%l7	! %l7 = 00000000ffffffff
!	%l4 = 0000000000000000, Mem[0000000030001400] = 00ff0000
	stba	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 00ff0000

p0_label_494:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181418] = 97000000 ff000000, %l4 = 00000000, %l5 = 9700ff00, %asi = 80
	ldda	[%i6+0x018]%asi,%l4	! %l4 = 0000000097000000 00000000ff000000
!	Mem[0000000030101408] = 00ff00ff, %l1 = 00000000000080ff
	lduha	[%i4+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141400] = 000000ff ffffff87, %l0 = 000000ff, %l1 = 000000ff
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 00000000ffffff87 00000000000000ff
!	Mem[0000000010001408] = fff8dff0, %l1 = 00000000000000ff
	ldswa	[%i0+%o4]0x80,%l1	! %l1 = fffffffffff8dff0
!	Mem[00000000201c0000] = ffff8148, %l5 = 00000000ff000000, %asi = 80
	ldsha	[%o0+0x000]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010101400] = ffffc6ffff000000, %l2 = 000000009272a57b
	ldxa	[%i4+%g0]0x80,%l2	! %l2 = ffffc6ffff000000
!	Mem[00000000100c1400] = 00000000, %l5 = ffffffffffffffff
	ldswa	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081410] = ffffffff, %f30 = 00ff0000
	lda	[%i2+%o5]0x89,%f30	! %f30 = ffffffff
!	Mem[0000000030041400] = ffff0000, %f1  = 7f000000
	lda	[%i1+%g0]0x81,%f1 	! %f1 = ffff0000
!	Mem[0000000010141410] = ffff0000, %l0 = 00000000ffffff87
	ldsha	[%i5+%o5]0x80,%l0	! %l0 = ffffffffffffffff

p0_label_495:
!	Starting 10 instruction Store Burst
!	%f31 = 00000000, Mem[0000000010181408] = 87ff00ff
	sta	%f31,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	%l1 = fffffffffff8dff0, Mem[0000000030141400] = d4000000
	stba	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = f0000000
!	Mem[0000000010181408] = 00000000, %l5 = 0000000000000000
	swapa	[%i6+%o4]0x88,%l5	! %l5 = 0000000000000000
!	%f20 = ffffffff 00000000, Mem[0000000030041410] = ff000000 ff800000
	stda	%f20,[%i1+%o5]0x89	! Mem[0000000030041410] = ffffffff 00000000
!	%f20 = ffffffff, Mem[00000000100c1400] = 00000000
	sta	%f20,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffff
	membar	#Sync			! Added by membar checker (67)
!	%l1 = fffffffffff8dff0, Mem[0000000030081410] = ffffffff
	stba	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = fffffff0
!	%f20 = ffffffff, %f25 = ffffffff, %f7  = ff000000
	fdivs	%f20,%f25,%f7 		! %f7  = ffffffff
!	Mem[00000000100c1413] = ffffff00, %l4 = 0000000097000000
	ldstub	[%i3+0x013],%l4		! %l4 = 0000000000000000
!	%l2 = ffffc6ffff000000, Mem[0000000010081408] = 00ff0097
	stba	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 00ff0097
!	Mem[0000000030181410] = 0074c83c, %l1 = 00000000fff8dff0
	swapa	[%i6+%o5]0x81,%l1	! %l1 = 000000000074c83c

p0_label_496:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00000000ffffffff, %f28 = 1cc528c5 ff6f8ce8
	ldda	[%i6+%g0]0x81,%f28	! %f28 = 00000000 ffffffff
!	Mem[0000000010081400] = 000000ff, %l2 = ffffc6ffff000000
	lduba	[%i2+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001408] = fff8dff0, %f15 = ffffffff
	lda	[%i0+%o4]0x80,%f15	! %f15 = fff8dff0
!	Mem[0000000030101410] = ffff0000, %l5 = 0000000000000000
	ldswa	[%i4+%o5]0x81,%l5	! %l5 = ffffffffffff0000
!	Mem[0000000010181410] = 00000000ff000000, %f26 = ff15ff00 000000ff
	ldd	[%i6+%o5],%f26		! %f26 = 00000000 ff000000
!	Mem[00000000300c1400] = a45514176f69d041, %l0 = ffffffffffffffff
	ldxa	[%i3+%g0]0x81,%l0	! %l0 = a45514176f69d041
!	Mem[0000000010001424] = 00000000, %f2  = fff8dff0
	ld	[%i0+0x024],%f2 	! %f2 = 00000000
!	Mem[0000000010041430] = 00000000 00000000, %l6 = 00000000, %l7 = ffffffff, %asi = 80
	ldda	[%i1+0x030]%asi,%l6	! %l6 = 0000000000000000 0000000000000000
!	%f29 = ffffffff, %f25 = ffffffff, %f11 = ff000000
	fadds	%f29,%f25,%f11		! %f11 = ffffffff
!	Mem[0000000030001400] = 00ff000000000000, %f22 = ffff6cf5 5e0497ff
	ldda	[%i0+%g0]0x81,%f22	! %f22 = 00ff0000 00000000

p0_label_497:
!	Starting 10 instruction Store Burst
!	%f23 = 00000000, Mem[0000000030041400] = ffff0000
	sta	%f23,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	%l4 = 00000000, %l5 = ffff0000, Mem[0000000010041418] = 00000000 00000000, %asi = 80
	stda	%l4,[%i1+0x018]%asi	! Mem[0000000010041418] = 00000000 ffff0000
!	%l1 = 000000000074c83c, Mem[0000000030101400] = 2474c83c92ffffff
	stxa	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000000074c83c
!	%l4 = 0000000000000000, Mem[0000000021800000] = ff9a3a08
	sth	%l4,[%o3+%g0]		! Mem[0000000021800000] = 00003a08
!	Mem[0000000020800001] = fffff578, %l7 = 0000000000000000
	ldstuba	[%o1+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041418] = 00000000ffff0000, %l6 = 0000000000000000, %l1 = 000000000074c83c
	add	%i1,0x18,%g1
	casxa	[%g1]0x80,%l6,%l1	! %l1 = 00000000ffff0000
!	Mem[0000000030001400] = 0000ff00, %l1 = 00000000ffff0000
	swapa	[%i0+%g0]0x89,%l1	! %l1 = 000000000000ff00
!	%l0 = a45514176f69d041, Mem[0000000030181408] = ffff000000ffffff
	stxa	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = a45514176f69d041
!	Mem[0000000010081408] = 00ff0097, %l6 = 0000000000000000
	swapa	[%i2+%o4]0x80,%l6	! %l6 = 0000000000ff0097
!	Mem[0000000030101408] = ff00ff00, %l2 = 00000000000000ff
	ldstuba	[%i4+%o4]0x81,%l2	! %l2 = 00000000000000ff

p0_label_498:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 7ba57292 00000000, %l0 = 6f69d041, %l1 = 0000ff00
	ldda	[%i1+%g0]0x89,%l0	! %l0 = 0000000000000000 000000007ba57292
!	Mem[0000000010081400] = 000000ff, %l5 = ffffffffffff0000
	ldswa	[%i2+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%l2 = 00000000000000ff, immd = 0000000000000273, %l108 = 0000000000000001
	udivx	%l2,0x273,%l1		! %l1 = 0000000000000000
!	Mem[0000000030081400] = ff000000 00000000, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i2+%g0]0x89,%l4	! %l4 = 0000000000000000 00000000ff000000
!	Mem[00000000100c1408] = ff00000000000000, %l6 = 0000000000ff0097
	ldxa	[%i3+%o4]0x88,%l6	! %l6 = ff00000000000000
!	%f5  = 00ffffff, Mem[0000000010181400] = ff000000
	sta	%f5 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 00ffffff
!	Mem[0000000030081408] = ff000000ffff0000, %f0  = 00000000 ffff0000
	ldda	[%i2+%o4]0x89,%f0 	! %f0  = ff000000 ffff0000
!	Mem[0000000010141400] = 87ffffff, %l6 = ff00000000000000
	lduba	[%i5+%g0]0x80,%l6	! %l6 = 0000000000000087
!	Mem[0000000010041400] = 0000ffff, %f29 = ffffffff
	ld	[%i1+%g0],%f29		! %f29 = 0000ffff
!	Mem[0000000030141410] = ffffff00, %l2 = 00000000000000ff
	lduha	[%i5+%o5]0x81,%l2	! %l2 = 000000000000ffff

p0_label_499:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000010041430] = 00000000, %asi = 80
	stwa	%l7,[%i1+0x030]%asi	! Mem[0000000010041430] = 000000ff
!	Mem[00000000211c0000] = ffffd1d8, %l7 = 00000000000000ff
	ldstuba	[%o2+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001400] = ff000000, %l7 = 00000000000000ff
	ldstuba	[%i0+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101400] = ffffc6ff ff000000 ffc6ffff 0000ffff
!	%f0  = ff000000 ffff0000 00000000 c0000000
!	%f4  = ff00ff00 00ffffff 0000ff00 ffffffff
!	%f8  = ff000000 00000000 00000000 ffffffff
!	%f12 = 00000000 ffff0000 ffffff87 fff8dff0
	stda	%f0 ,[%i4+%g0]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	Mem[0000000030001408] = 00ffffff, %l4 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l4	! %l4 = 0000000000ffffff
!	%l6 = 0000000000000087, Mem[0000000030081408] = 0000ffff
	stha	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 0087ffff
!	%l7 = 00000000000000ff, Mem[0000000010041429] = ff000000, %asi = 80
	stba	%l7,[%i1+0x029]%asi	! Mem[0000000010041428] = ffff0000
!	Mem[000000001000140c] = c0000000, %l0 = 00000000, %l6 = 00000087
	add	%i0,0x0c,%g1
	casa	[%g1]0x80,%l0,%l6	! %l6 = 00000000c0000000
!	Mem[0000000030081400] = 00000000, %l5 = 00000000ff000000
	ldstuba	[%i2+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l6 = 00000000c0000000
	swapa	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000000

p0_label_500:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 0074c83c, %l4 = 0000000000ffffff
	lduwa	[%i4+%g0]0x89,%l4	! %l4 = 000000000074c83c
!	Mem[0000000010001400] = ff000000, %f24 = 00000000
	ld	[%i0+%g0],%f24		! %f24 = ff000000
!	%l6 = 0000000000000000, %l2 = 000000000000ffff, %l0 = 0000000000000000
	add	%l6,%l2,%l0		! %l0 = 000000000000ffff
!	Mem[00000000100c1410] = ffffffff 00000000, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i3+%o5]0x80,%l6	! %l6 = 00000000ffffffff 0000000000000000
!	Mem[0000000030041410] = 00000000, %f27 = ff000000
	lda	[%i1+%o5]0x89,%f27	! %f27 = 00000000
!	Mem[0000000020800000] = fffff578, %l6 = 00000000ffffffff, %asi = 80
	lduha	[%o1+0x000]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010181420] = 00ffffe8, %l4 = 000000000074c83c
	lduw	[%i6+0x020],%l4		! %l4 = 0000000000ffffe8
!	Mem[0000000030141410] = 00ffffff, %l4 = 0000000000ffffe8
	lduba	[%i5+%o5]0x89,%l4	! %l4 = 00000000000000ff
	membar	#Sync			! Added by membar checker (68)
!	Mem[0000000010101418] = 0000ff00, %f22 = 00ff0000
	lda	[%i4+0x018]%asi,%f22	! %f22 = 0000ff00
!	Mem[0000000030141400] = f0000000, %l4 = 00000000000000ff
	lduwa	[%i5+%g0]0x81,%l4	! %l4 = 00000000f0000000

!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 000000000000ffff
	bne	%xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000000000000
	bne	%xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 000000000000ffff
	bne	%xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000ff0097
	bne	%xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000f0000000
	bne	%xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000000000000
	bne	%xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 000000000000ffff
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
	cmp	%l0,%l1			! %f0  should be ff000000 ffff0000
	bne	%xcc,p0_freg_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00000000 c0000000
	bne	%xcc,p0_freg_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be ff00ff00 00ffffff
	bne	%xcc,p0_freg_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 0000ff00 ffffffff
	bne	%xcc,p0_freg_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be ff000000 00000000
	bne	%xcc,p0_freg_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000000 ffffffff
	bne	%xcc,p0_freg_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 00000000 ffff0000
	bne	%xcc,p0_freg_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be ffffff87 fff8dff0
	bne	%xcc,p0_freg_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00000000 000000ff
	bne	%xcc,p0_freg_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 0000ffff 000000ff
	bne	%xcc,p0_freg_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be ffffffff 00000000
	bne	%xcc,p0_freg_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 0000ff00 00000000
	bne	%xcc,p0_freg_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be ff000000 ffffffff
	bne	%xcc,p0_freg_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 00000000 00000000
	bne	%xcc,p0_freg_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 00000000 0000ffff
	bne	%xcc,p0_freg_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be ffffffff 00000000
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
	ldx	[%g1+0x000],%l0		! %l0 = 426097763f2fa6b6
	ldx	[%g1+0x008],%l1		! %l1 = b1eae9f58e2dd5e1
	ldx	[%g1+0x010],%l2		! %l2 = 97b621be2be4791c
	ldx	[%g1+0x018],%l3		! %l3 = ddcdf1bf9b069367
	ldx	[%g1+0x020],%l4		! %l4 = 009df20e1e53b7c2
	ldx	[%g1+0x028],%l5		! %l5 = eaaf05d12233092d
	ldx	[%g1+0x030],%l6		! %l6 = dc514d59cf5e3aa8
	ldx	[%g1+0x038],%l7		! %l7 = 7f9e2deab99c8f33

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
	umul	%l5,0x2c2,%l6
	sdivx	%l1,%l6,%l1
	swap	[%i0+0x020],%l4		! Mem[0000000010001420]
	sdivx	%l2,%l6,%l7
	fsqrts	%f12,%f15
	add	%l4,0x2de,%l2
	jmpl	%o7,%g0
	xor	%l6,0x86f,%l3
p0_near_0_he:
	smul	%l1,%l3,%l4
	add	%l7,%l7,%l1
	and	%l2,-0xd6d,%l4
	udivx	%l5,%l0,%l3
	jmpl	%o7,%g0
	addc	%l2,0x8fc,%l6
p0_near_0_lo:
	umul	%l5,0x2c2,%l6
	sdivx	%l1,%l6,%l1
	swap	[%o0+0x020],%l4		! Mem[0000000010001420]
	sdivx	%l2,%l6,%l7
	fsqrts	%f12,%f15
	add	%l4,0x2de,%l2
	jmpl	%o7,%g0
	xor	%l6,0x86f,%l3
p0_near_0_ho:
	smul	%l1,%l3,%l4
	add	%l7,%l7,%l1
	and	%l2,-0xd6d,%l4
	udivx	%l5,%l0,%l3
	jmpl	%o7,%g0
	addc	%l2,0x8fc,%l6
near0_b2b_h:
	sub	%l1,0x164,%l0
	andn	%l1,-0x6d2,%l1
	and	%l5,%l2,%l6
	jmpl	%o7,%g0
	subc	%l0,%l0,%l3
near0_b2b_l:
	fdivs	%f12,%f9 ,%f10
	fdivs	%f5 ,%f11,%f10
	fdivs	%f10,%f12,%f3 
	jmpl	%o7,%g0
	udivx	%l4,%l6,%l5
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
	add	%l2,%l4,%l3
	stx	%l2,[%i2+0x028]		! Mem[0000000010081428]
	smul	%l4,-0xc22,%l7
	orn	%l0,-0xad7,%l5
	mulx	%l6,0x3a5,%l3
	sdivx	%l7,%l0,%l6
	jmpl	%o7,%g0
	fdivs	%f10,%f5 ,%f4 
p0_near_1_he:
	fsubs	%f18,%f30,%f28
	jmpl	%o7,%g0
	mulx	%l4,-0x4e3,%l0
p0_near_1_lo:
	add	%l2,%l4,%l3
	stx	%l2,[%o2+0x028]		! Mem[0000000010081428]
	smul	%l4,-0xc22,%l7
	orn	%l0,-0xad7,%l5
	mulx	%l6,0x3a5,%l3
	sdivx	%l7,%l0,%l6
	jmpl	%o7,%g0
	fdivs	%f10,%f5 ,%f4 
p0_near_1_ho:
	fsubs	%f18,%f30,%f28
	jmpl	%o7,%g0
	mulx	%l4,-0x4e3,%l0
near1_b2b_h:
	andn	%l6,0x0c2,%l1
	umul	%l7,0x816,%l2
	addc	%l4,0x2d4,%l5
	jmpl	%o7,%g0
	addc	%l2,%l4,%l4
near1_b2b_l:
	fsubs	%f1 ,%f14,%f15
	smul	%l0,%l7,%l2
	umul	%l0,%l7,%l6
	jmpl	%o7,%g0
	fcmps	%fcc1,%f10,%f2 
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
	fdivs	%f8 ,%f6 ,%f7 
	fcmps	%fcc1,%f9 ,%f5 
	or	%l3,%l0,%l0
	jmpl	%o7,%g0
	umul	%l7,%l7,%l3
p0_near_2_he:
	fsqrts	%f19,%f25
	fmuls	%f27,%f27,%f30
	lduw	[%i6+0x030],%l0		! Mem[0000000010181430]
	fcmps	%fcc0,%f20,%f20
	jmpl	%o7,%g0
	addc	%l1,-0x13a,%l7
p0_near_2_lo:
	fdivs	%f8 ,%f6 ,%f7 
	fcmps	%fcc1,%f9 ,%f5 
	or	%l3,%l0,%l0
	jmpl	%o7,%g0
	umul	%l7,%l7,%l3
p0_near_2_ho:
	fsqrts	%f19,%f25
	fmuls	%f27,%f27,%f30
	lduw	[%o6+0x030],%l0		! Mem[0000000010181430]
	fcmps	%fcc0,%f20,%f20
	jmpl	%o7,%g0
	addc	%l1,-0x13a,%l7
near2_b2b_h:
	jmpl	%o7,%g0
	fcmps	%fcc0,%f19,%f30
	jmpl	%o7,%g0
	nop
near2_b2b_l:
	jmpl	%o7,%g0
	fsubs	%f5 ,%f1 ,%f2 
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
	umul	%l3,0xc65,%l3
	andn	%l7,%l7,%l4
	xnor	%l2,-0x2cb,%l3
	mulx	%l4,%l6,%l4
	jmpl	%o7,%g0
	fdivs	%f4 ,%f1 ,%f11
p0_near_3_he:
	udivx	%l2,%l4,%l7
	jmpl	%o7,%g0
	add	%l7,%l7,%l0
p0_near_3_lo:
	umul	%l3,0xc65,%l3
	andn	%l7,%l7,%l4
	xnor	%l2,-0x2cb,%l3
	mulx	%l4,%l6,%l4
	jmpl	%o7,%g0
	fdivs	%f4 ,%f1 ,%f11
p0_near_3_ho:
	udivx	%l2,%l4,%l7
	jmpl	%o7,%g0
	add	%l7,%l7,%l0
near3_b2b_h:
	fmuls	%f19,%f27,%f22
	sub	%l6,0x13d,%l1
	orn	%l6,-0xd00,%l2
	add	%l7,-0x7bb,%l4
	jmpl	%o7,%g0
	mulx	%l7,0xb96,%l3
near3_b2b_l:
	mulx	%l4,-0x0c0,%l2
	smul	%l3,%l0,%l7
	umul	%l3,%l4,%l4
	fcmps	%fcc1,%f2 ,%f11
	jmpl	%o7,%g0
	fdivs	%f8 ,%f11,%f8 
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
	fcmps	%fcc2,%f0 ,%f1 
	orn	%l2,0xce9,%l0
	std	%l4,[%i1+0x018]		! Mem[0000000010041418]
	and	%l7,%l2,%l3
	jmpl	%o7,%g0
	sdivx	%l6,0x7ab,%l2
p0_far_0_he:
	fadds	%f30,%f24,%f21
	xnor	%l7,%l5,%l0
	sub	%l5,%l3,%l4
	std	%f18,[%i6+0x020]	! Mem[0000000010181420]
	fcmps	%fcc0,%f17,%f26
	udivx	%l5,%l4,%l0
	add	%l4,%l0,%l2
	jmpl	%o7,%g0
	stx	%l0,[%i4+0x028]		! Mem[0000000010101428]
p0_far_0_lo:
	fcmps	%fcc2,%f0 ,%f1 
	orn	%l2,0xce9,%l0
	std	%l4,[%o1+0x018]		! Mem[0000000010041418]
	and	%l7,%l2,%l3
	jmpl	%o7,%g0
	sdivx	%l6,0x7ab,%l2
p0_far_0_ho:
	fadds	%f30,%f24,%f21
	xnor	%l7,%l5,%l0
	sub	%l5,%l3,%l4
	std	%f18,[%o6+0x020]	! Mem[0000000010181420]
	fcmps	%fcc0,%f17,%f26
	udivx	%l5,%l4,%l0
	add	%l4,%l0,%l2
	jmpl	%o7,%g0
	stx	%l0,[%o4+0x028]		! Mem[0000000010101428]
far0_b2b_h:
	jmpl	%o7,%g0
	add	%l0,-0x79f,%l5
	jmpl	%o7,%g0
	nop
far0_b2b_l:
	jmpl	%o7,%g0
	fdivs	%f6 ,%f11,%f6 
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
	umul	%l0,0xf10,%l4
	fmuls	%f6 ,%f2 ,%f2 
	jmpl	%o7,%g0
	fcmps	%fcc1,%f12,%f8 
p0_far_1_he:
	swap	[%i4+0x020],%l4		! Mem[0000000010101420]
	fitos	%f31,%f30
	fcmps	%fcc1,%f22,%f23
	xor	%l0,-0x29e,%l6
	fcmps	%fcc0,%f28,%f31
	orn	%l7,%l7,%l6
	xnor	%l7,%l4,%l0
	jmpl	%o7,%g0
	smul	%l3,%l6,%l1
p0_far_1_lo:
	umul	%l0,0xf10,%l4
	fmuls	%f6 ,%f2 ,%f2 
	jmpl	%o7,%g0
	fcmps	%fcc1,%f12,%f8 
p0_far_1_ho:
	swap	[%o4+0x020],%l4		! Mem[0000000010101420]
	fitos	%f31,%f30
	fcmps	%fcc1,%f22,%f23
	xor	%l0,-0x29e,%l6
	fcmps	%fcc0,%f28,%f31
	orn	%l7,%l7,%l6
	xnor	%l7,%l4,%l0
	jmpl	%o7,%g0
	smul	%l3,%l6,%l1
far1_b2b_h:
	udivx	%l1,0x9b5,%l5
	fadds	%f22,%f26,%f21
	sdivx	%l2,0x06e,%l2
	and	%l0,-0x3a4,%l7
	xnor	%l5,-0xccf,%l1
	jmpl	%o7,%g0
	fdivs	%f22,%f25,%f22
far1_b2b_l:
	fmuls	%f14,%f13,%f6 
	sdivx	%l5,0x883,%l5
	fcmps	%fcc2,%f13,%f10
	fsubs	%f13,%f8 ,%f8 
	addc	%l4,-0x983,%l5
	jmpl	%o7,%g0
	addc	%l1,%l4,%l7
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
	umul	%l6,-0x9ed,%l4
	jmpl	%o7,%g0
	nop
p0_far_2_he:
	xnor	%l2,-0x51d,%l7
	umul	%l4,%l5,%l5
	udivx	%l1,0x6cc,%l4
	fmuls	%f22,%f20,%f28
	fdivs	%f22,%f21,%f26
	sub	%l0,-0x50b,%l4
	jmpl	%o7,%g0
	subc	%l2,-0xff8,%l7
p0_far_2_lo:
	jmpl	%o7,%g0
	umul	%l6,-0x9ed,%l4
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
p0_far_2_ho:
	xnor	%l2,-0x51d,%l7
	umul	%l4,%l5,%l5
	udivx	%l1,0x6cc,%l4
	fmuls	%f22,%f20,%f28
	fdivs	%f22,%f21,%f26
	sub	%l0,-0x50b,%l4
	jmpl	%o7,%g0
	subc	%l2,-0xff8,%l7
far2_b2b_h:
	mulx	%l4,%l3,%l0
	addc	%l5,-0x44e,%l0
	udivx	%l0,%l1,%l2
	fsubs	%f31,%f18,%f31
	fstod	%f18,%f16
	fcmps	%fcc1,%f27,%f24
	smul	%l3,-0xea4,%l3
	jmpl	%o7,%g0
	xor	%l2,-0x85c,%l6
far2_b2b_l:
	or	%l7,%l1,%l3
	orn	%l0,-0x49e,%l1
	fadds	%f8 ,%f13,%f12
	fsubs	%f9 ,%f3 ,%f9 
	smul	%l7,0xef3,%l4
	fsubs	%f2 ,%f5 ,%f15
	add	%l3,%l0,%l4
	jmpl	%o7,%g0
	smul	%l6,0x7c4,%l1
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
	or	%l6,%l5,%l4
	fcmps	%fcc2,%f0 ,%f0 
	xor	%l1,%l5,%l2
	fadds	%f9 ,%f8 ,%f14
	xor	%l6,%l6,%l1
	mulx	%l3,0x56c,%l7
	mulx	%l0,%l5,%l6
	jmpl	%o7,%g0
	addc	%l2,%l0,%l2
p0_far_3_he:
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
p0_far_3_lo:
	or	%l6,%l5,%l4
	fcmps	%fcc2,%f0 ,%f0 
	xor	%l1,%l5,%l2
	fadds	%f9 ,%f8 ,%f14
	xor	%l6,%l6,%l1
	mulx	%l3,0x56c,%l7
	mulx	%l0,%l5,%l6
	jmpl	%o7,%g0
	addc	%l2,%l0,%l2
p0_far_3_ho:
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
far3_b2b_h:
	umul	%l1,%l3,%l0
	fsubs	%f22,%f28,%f21
	jmpl	%o7,%g0
	udivx	%l1,0xb31,%l3
far3_b2b_l:
	sdivx	%l5,0x9e3,%l4
	umul	%l0,0x3f4,%l5
	jmpl	%o7,%g0
	subc	%l0,%l6,%l5
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	.skip	16
p0_jmpl_0_le:
	xnor	%l5,%l2,%l6
	udivx	%l1,0xc16,%l1
	udivx	%l0,%l2,%l0
	fcmps	%fcc3,%f1 ,%f5 
	umul	%l2,-0xfa1,%l6
	and	%l5,0x7cd,%l3
	jmpl	%g6+8,%g0
	xnor	%l2,-0x0cb,%l7
p0_call_0_le:
	swap	[%i4+0x020],%l2		! Mem[0000000010101420]
	mulx	%l0,0xc70,%l7
	andn	%l3,-0x848,%l5
	or	%l1,-0x869,%l4
	retl
	fmuls	%f3 ,%f5 ,%f2 
p0_jmpl_0_lo:
	xnor	%l5,%l2,%l6
	udivx	%l1,0xc16,%l1
	udivx	%l0,%l2,%l0
	fcmps	%fcc3,%f1 ,%f5 
	umul	%l2,-0xfa1,%l6
	and	%l5,0x7cd,%l3
	jmpl	%g6+8,%g0
	xnor	%l2,-0x0cb,%l7
p0_call_0_lo:
	swap	[%o4+0x020],%l2		! Mem[0000000010101420]
	mulx	%l0,0xc70,%l7
	andn	%l3,-0x848,%l5
	or	%l1,-0x869,%l4
	retl
	fmuls	%f3 ,%f5 ,%f2 
p0_jmpl_0_he:
	fdivs	%f28,%f31,%f26
	xor	%l7,0x07c,%l1
	jmpl	%g6+8,%g0
	orn	%l4,-0x792,%l6
p0_call_0_he:
	fdivs	%f28,%f26,%f20
	and	%l0,%l5,%l6
	fadds	%f18,%f16,%f28
	sdivx	%l0,0x309,%l0
	sth	%l2,[%i1+0x004]		! Mem[0000000010041404]
	sub	%l3,0xc01,%l6
	smul	%l6,%l4,%l7
	retl
	std	%f24,[%i5+0x038]	! Mem[0000000010141438]
p0_jmpl_0_ho:
	fdivs	%f28,%f31,%f26
	xor	%l7,0x07c,%l1
	jmpl	%g6+8,%g0
	orn	%l4,-0x792,%l6
p0_call_0_ho:
	fdivs	%f28,%f26,%f20
	and	%l0,%l5,%l6
	fadds	%f18,%f16,%f28
	sdivx	%l0,0x309,%l0
	sth	%l2,[%o1+0x004]		! Mem[0000000010041404]
	sub	%l3,0xc01,%l6
	smul	%l6,%l4,%l7
	retl
	std	%f24,[%o5+0x038]	! Mem[0000000010141438]
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	.skip	32
p0_jmpl_1_le:
	fadds	%f10,%f9 ,%f7 
	smul	%l5,%l4,%l0
	addc	%l4,-0x4d1,%l3
	jmpl	%g6+8,%g0
	xnor	%l6,%l4,%l1
p0_call_1_le:
	fdivs	%f0 ,%f15,%f15
	orn	%l7,0x252,%l7
	and	%l6,0xb5c,%l4
	retl
	orn	%l5,0x53b,%l6
p0_jmpl_1_lo:
	fadds	%f10,%f9 ,%f7 
	smul	%l5,%l4,%l0
	addc	%l4,-0x4d1,%l3
	jmpl	%g6+8,%g0
	xnor	%l6,%l4,%l1
p0_call_1_lo:
	fdivs	%f0 ,%f15,%f15
	orn	%l7,0x252,%l7
	and	%l6,0xb5c,%l4
	retl
	orn	%l5,0x53b,%l6
p0_jmpl_1_he:
	smul	%l0,-0x8e0,%l1
	or	%l7,%l1,%l0
	orn	%l5,0x124,%l1
	umul	%l0,%l1,%l7
	ldsb	[%i3+0x01b],%l4		! Mem[00000000100c141b]
	jmpl	%g6+8,%g0
	add	%l6,-0x3c3,%l0
p0_call_1_he:
	swap	[%i2+0x024],%l1		! Mem[0000000010081424]
	add	%l6,-0xeda,%l7
	fdivs	%f23,%f25,%f22
	sdivx	%l2,0xb9d,%l0
	fdivs	%f18,%f31,%f30
	retl
	fadds	%f20,%f17,%f16
p0_jmpl_1_ho:
	smul	%l0,-0x8e0,%l1
	or	%l7,%l1,%l0
	orn	%l5,0x124,%l1
	umul	%l0,%l1,%l7
	ldsb	[%o3+0x01b],%l4		! Mem[00000000100c141b]
	jmpl	%g6+8,%g0
	add	%l6,-0x3c3,%l0
p0_call_1_ho:
	swap	[%o2+0x024],%l1		! Mem[0000000010081424]
	add	%l6,-0xeda,%l7
	fdivs	%f23,%f25,%f22
	sdivx	%l2,0xb9d,%l0
	fdivs	%f18,%f31,%f30
	retl
	fadds	%f20,%f17,%f16
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	.skip	48
p0_jmpl_2_le:
	add	%l2,-0x44e,%l0
	xnor	%l2,%l2,%l5
	jmpl	%g6+8,%g0
	andn	%l3,0x898,%l0
p0_call_2_le:
	fdivs	%f3 ,%f7 ,%f12
	sub	%l4,-0x553,%l4
	retl
	subc	%l7,-0x365,%l4
p0_jmpl_2_lo:
	add	%l2,-0x44e,%l0
	xnor	%l2,%l2,%l5
	jmpl	%g6+8,%g0
	andn	%l3,0x898,%l0
p0_call_2_lo:
	fdivs	%f3 ,%f7 ,%f12
	sub	%l4,-0x553,%l4
	retl
	subc	%l7,-0x365,%l4
p0_jmpl_2_he:
	fdtos	%f24,%f30
	fsubs	%f18,%f28,%f16
	fdivs	%f24,%f31,%f30
	jmpl	%g6+8,%g0
	xor	%l5,0xcdc,%l4
p0_call_2_he:
	retl
	fdivs	%f27,%f25,%f28
p0_jmpl_2_ho:
	fdtos	%f24,%f30
	fsubs	%f18,%f28,%f16
	fdivs	%f24,%f31,%f30
	jmpl	%g6+8,%g0
	xor	%l5,0xcdc,%l4
p0_call_2_ho:
	retl
	fdivs	%f27,%f25,%f28
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	.skip	64
p0_jmpl_3_le:
	orn	%l5,-0x9cb,%l4
	sub	%l4,-0xedd,%l3
	mulx	%l6,-0xe4f,%l5
	or	%l4,0x8f3,%l4
	subc	%l5,%l7,%l2
	xnor	%l2,0x6c9,%l3
	jmpl	%g6+8,%g0
	or	%l7,-0x00a,%l3
p0_call_3_le:
	orn	%l0,%l2,%l2
	xor	%l2,0xd5c,%l7
	addc	%l1,%l7,%l6
	umul	%l2,%l2,%l4
	retl
	smul	%l4,-0xa76,%l4
p0_jmpl_3_lo:
	orn	%l5,-0x9cb,%l4
	sub	%l4,-0xedd,%l3
	mulx	%l6,-0xe4f,%l5
	or	%l4,0x8f3,%l4
	subc	%l5,%l7,%l2
	xnor	%l2,0x6c9,%l3
	jmpl	%g6+8,%g0
	or	%l7,-0x00a,%l3
p0_call_3_lo:
	orn	%l0,%l2,%l2
	xor	%l2,0xd5c,%l7
	addc	%l1,%l7,%l6
	umul	%l2,%l2,%l4
	retl
	smul	%l4,-0xa76,%l4
p0_jmpl_3_he:
	jmpl	%g6+8,%g0
	nop
p0_call_3_he:
	andn	%l3,-0x2e8,%l6
	retl
	sth	%l7,[%o1+0x000]		! Mem[0000000020800000]
p0_jmpl_3_ho:
	jmpl	%g6+8,%g0
	nop
p0_call_3_ho:
	andn	%l3,-0x2e8,%l6
	retl
	sth	%l7,[%i1+0x000]		! Mem[0000000020800000]
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
	.word	0x42609776,0x3f2fa6b6		! Init value for %l0
	.word	0xb1eae9f5,0x8e2dd5e1		! Init value for %l1
	.word	0x97b621be,0x2be4791c		! Init value for %l2
	.word	0xddcdf1bf,0x9b069367		! Init value for %l3
	.word	0x009df20e,0x1e53b7c2		! Init value for %l4
	.word	0xeaaf05d1,0x2233092d		! Init value for %l5
	.word	0xdc514d59,0xcf5e3aa8		! Init value for %l6
	.word	0x7f9e2dea,0xb99c8f33		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x7db5a9e8,0x4e413159		! Init value for %f0 
	.word	0x537bc066,0x056dc71f		! Init value for %f2 
	.word	0x1400ab54,0x21465995		! Init value for %f4 
	.word	0x4933f232,0x4c61a23b		! Init value for %f6 
	.word	0x428f7880,0x148dc691		! Init value for %f8 
	.word	0x72535dbe,0x4c30b817		! Init value for %f10
	.word	0x21a8dd6c,0x6a93944d		! Init value for %f12
	.word	0x59242f0a,0x07b104b3		! Init value for %f14
	.word	0x68dd6618,0x4ede9ec9		! Init value for %f16
	.word	0x07185216,0x4869440f		! Init value for %f18
	.word	0x76335e84,0x54fc8205		! Init value for %f20
	.word	0x7a5572e2,0x566cf22b		! Init value for %f22
	.word	0x0d12d2b0,0x783d9a01		! Init value for %f24
	.word	0x2100fd6e,0x06f84b07		! Init value for %f26
	.word	0x58f18e9c,0x783102bd		! Init value for %f28
	.word	0x464c1dba,0x5dcc4aa3		! Init value for %f30
	.word	0x7fbf1e48,0x2de09839		! Init value for %f32
	.word	0x1d3fbfc6,0x3d4aacff		! Init value for %f34
	.word	0x5010cdb4,0x35ccf675		! Init value for %f36
	.word	0x55488f92,0x6151ee1b		! Init value for %f38
	.word	0x570da8e0,0x0aa97971		! Init value for %f40
	.word	0x6482f91e,0x20d949f7		! Init value for %f42
	.word	0x6a1a7bcc,0x6cd83d2d		! Init value for %f44
	.word	0x73c7286a,0x324cbc93		! Init value for %f46
	.word	0x7045d278,0x32a61da9
	.word	0x18750976,0x6ea901ef
	.word	0x7773f8e4,0x5d46b6e5
	.word	0x48004842,0x4f57960b
	.word	0x614afb10,0x0e9064e1
	.word	0x313c50ce,0x22cab4e7
	.word	0x33dea4fc,0x3b78439d
	.word	0x67684f1a,0x33d95a83
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
	.word	0x00000000,0x0000ffff		! %l0
	.word	0x00000000,0x00000000		! %l1
	.word	0x00000000,0x0000ffff		! %l2
	.word	0x00000000,0x00ff0097		! %l3
	.word	0x00000000,0xf0000000		! %l4
	.word	0x00000000,0x00000000		! %l5
	.word	0x00000000,0x0000ffff		! %l6
	.word	0x00000000,0x00000000		! %l7
p0_expected_fp_regs:
	.word	0xff000000,0xffff0000		! %f0
	.word	0x00000000,0xc0000000		! %f2
	.word	0xff00ff00,0x00ffffff		! %f4
	.word	0x0000ff00,0xffffffff		! %f6
	.word	0xff000000,0x00000000		! %f8
	.word	0x00000000,0xffffffff		! %f10
	.word	0x00000000,0xffff0000		! %f12
	.word	0xffffff87,0xfff8dff0		! %f14
	.word	0x00000000,0x000000ff		! %f16
	.word	0x0000ffff,0x000000ff		! %f18
	.word	0xffffffff,0x00000000		! %f20
	.word	0x0000ff00,0x00000000		! %f22
	.word	0xff000000,0xffffffff		! %f24
	.word	0x00000000,0x00000000		! %f26
	.word	0x00000000,0x0000ffff		! %f28
	.word	0xffffffff,0x00000000		! %f30
	.word	0x0000002e,0x000007e0		! %fsr
p0_local0_expect:
	.word	0xff000000,0xff000000,0xfff8dff0,0xc0000000 ! PA = 0000000010001400
	.word	0xff00ff00,0x00ffffff,0x0000ff00,0xff000000 ! PA = 0000000010001410
	.word	0xff000000,0x00000000,0x00000000,0xff000000 ! PA = 0000000010001420
	.word	0x00000000,0xffff0000,0xffffffff,0xffffffff ! PA = 0000000010001430
p0_local0_sec_expect:
	.word	0x0000ffff,0x00000000,0x00000000,0x000000ff ! PA = 0000000030001400
	.word	0xffffffff,0xffff0000,0x0000004a,0x5bd5464c ! PA = 0000000030001410
	.word	0x00a3ffff,0x0dc60e86,0xff000000,0x164d9eff ! PA = 0000000030001420
	.word	0x00000000,0x000000ff,0xcafaf8d3,0xc0000000 ! PA = 0000000030001430
!	Scratch Area for Non-Transactional Memory Stores
	.word	0x4076e086,0xbded0267,0x13deb26a,0x3179c593
	.word	0xd00af46e,0x16c8a51f,0xdc306f92,0xdbc95c0b
	.word	0xffd674d6,0x70063d57,0xa85d1d3a,0x810ef403
	.word	0xe2c589be,0x9869430f,0x904c2362,0x84b7c57b
p0_local1_expect:
	.word	0x0000ffff,0x00000000,0xffffffff,0x000000ff ! PA = 0000000010041400
	.word	0xff000000,0xff000000,0x00000000,0xffff0000 ! PA = 0000000010041410
	.word	0x6f000000,0x228affff,0xffff0000,0x87ff00ff ! PA = 0000000010041420
	.word	0x000000ff,0x00000000,0x000000ff,0x7ba572ff ! PA = 0000000010041430
p0_local1_sec_expect:
	.word	0x00000000,0x9272a57b,0xff889284,0x00ff0000 ! PA = 0000000030041400
	.word	0x00000000,0xffffffff,0xff15ff00,0x000000ff ! PA = 0000000030041410
	.word	0x6f000000,0x228affff,0xff000000,0x000000ff ! PA = 0000000030041420
	.word	0x87ffffff,0x00000000,0xff000000,0x00000000 ! PA = 0000000030041430
p0_local2_expect:
	.word	0xff000000,0x00000000,0x00000000,0x00000097 ! PA = 0000000010081400
	.word	0xffffff87,0xffffffff,0x7959e581,0x00000000 ! PA = 0000000010081410
	.word	0x00ff00ff,0x0000ff72,0x228a91fe,0x536f8ce8 ! PA = 0000000010081420
	.word	0xff15ff00,0xffffff87,0xffff0000,0x0000ffff ! PA = 0000000010081430
p0_local2_sec_expect:
	.word	0xff000000,0x000000ff,0x0087ffff,0x000000ff ! PA = 0000000030081400
	.word	0xf0ffffff,0x00000000,0xffff6cf5,0x5e0497ff ! PA = 0000000030081410
	.word	0x00000000,0xffffffff,0xff15ff00,0x000000ff ! PA = 0000000030081420
	.word	0x1cc528c5,0xff6f8ce8,0x00ff0000,0x00000000 ! PA = 0000000030081430
p0_local3_expect:
	.word	0xffffffff,0x00000097,0x00000000,0x000000ff ! PA = 00000000100c1400
	.word	0xffffffff,0x00000000,0x000000ff,0xff150000 ! PA = 00000000100c1410
	.word	0x00000000,0x000000ff,0x00000000,0x536f8ce8 ! PA = 00000000100c1420
	.word	0x00000097,0xf44b4200,0x000000ff,0x00007bff ! PA = 00000000100c1430
p0_local3_sec_expect:
	.word	0xa4551417,0x6f69d041,0x97ff0000,0x87ffffff ! PA = 00000000300c1400
	.word	0xffc6ff86,0x00000000,0x00000000,0x00000000 ! PA = 00000000300c1410
	.word	0xffff8a22,0x0000006f,0xfff8dff0,0xc0000000 ! PA = 00000000300c1420
	.word	0x7ba57200,0x00000000,0xff72a57b,0xff000000 ! PA = 00000000300c1430
p0_local4_expect:
	.word	0xff000000,0xffff0000,0x00000000,0xc0000000 ! PA = 0000000010101400
	.word	0xff00ff00,0x00ffffff,0x0000ff00,0xffffffff ! PA = 0000000010101410
	.word	0xff000000,0x00000000,0x00000000,0xffffffff ! PA = 0000000010101420
	.word	0x00000000,0xffff0000,0xffffff87,0xfff8dff0 ! PA = 0000000010101430
p0_local4_sec_expect:
	.word	0x3cc87400,0x00000000,0xff00ff00,0x00ffffff ! PA = 0000000030101400
	.word	0xffff0000,0x000000ff,0x000000ff,0xe88c6fff ! PA = 0000000030101410
	.word	0x860ec60d,0xff000000,0xe88c6f53,0xfe918a22 ! PA = 0000000030101420
	.word	0x00000000,0x000000ff,0x91a3ffff,0xff97045e ! PA = 0000000030101430
p0_local5_expect:
	.word	0x87ffffff,0xff000000,0x00000000,0x0000ffff ! PA = 0000000010141400
	.word	0xffff0000,0xffffffff,0x07623887,0x00ff0000 ! PA = 0000000010141410
	.word	0x000000ff,0x87ffffff,0xffffff87,0xc0000000 ! PA = 0000000010141420
	.word	0x000000ff,0x00000000,0x000000ff,0x00ff0000 ! PA = 0000000010141430
p0_local5_sec_expect:
	.word	0xf0000000,0x0000ffff,0xffffffff,0xff6f00ff ! PA = 0000000030141400
	.word	0xffffff00,0xff800000,0xe88c6f53,0x00000000 ! PA = 0000000030141410
	.word	0x7f800000,0xffffff87,0x00007aec,0x00000000 ! PA = 0000000030141420
	.word	0x80000000,0x00000000,0x00000000,0x00000000 ! PA = 0000000030141430
p0_local6_expect:
	.word	0x00ffffff,0x00000000,0xc0000000,0xffc6ff86 ! PA = 0000000010181400
	.word	0x00000000,0xff000000,0x97000000,0xff000000 ! PA = 0000000010181410
	.word	0x00ffffe8,0x92000000,0x0000a57b,0x00000000 ! PA = 0000000010181420
	.word	0xffff0000,0xffffffff,0x2474c83c,0xffffff87 ! PA = 0000000010181430
p0_local6_sec_expect:
	.word	0x00000000,0xffffffff,0x41d0696f,0x171455a4 ! PA = 0000000030181400
	.word	0xfff8dff0,0xb02c3887,0x00000000,0x00000000 ! PA = 0000000030181410
	.word	0x6f000000,0x228affff,0xff000000,0x87ffffff ! PA = 0000000030181420
	.word	0x00000000,0x0072a57b,0x000000ff,0x7ba572ff ! PA = 0000000030181430
share0_expect:
	.word	0xffff8148,0x613a8f39,0x1e0b7ac6,0x25d69bff ! PA = 00000000201c0000
	.word	0x45aba0b4,0x7f9c9d75,0x65653a92,0x4c950d1b ! PA = 00000000201c0010
	.word	0x4044ebe0,0x451dd071,0x4c03941e,0x0eba98f7 ! PA = 00000000201c0020
	.word	0x2ad92ecc,0x7d50442d,0x1b2eb36a,0x3b633b93 ! PA = 00000000201c0030
share1_expect:
	.word	0xfffff578,0x30b0d4a9,0x33b68476,0x633bb0ef ! PA = 0000000020800000
	.word	0x75c28be4,0x69a31de5,0x717eb342,0x065d750b ! PA = 0000000020800010
	.word	0x0e81fe10,0x5a2d7be1,0x74caabce,0x78eac3e7 ! PA = 0000000020800020
	.word	0x65a917fc,0x3e750a9d,0x3d499a1a,0x3a6a9983 ! PA = 0000000020800030
	.word	0xffff65a8,0x17f9a619,0x42e26a26,0x3be4b1df ! PA = 0000000020800040
	.word	0x6eaa3314,0x1d91ea55,0x783fc7f2,0x50bd88fb ! PA = 0000000020800050
	.word	0x3e3c8c40,0x7c273351,0x631c1f7e,0x46525ad7 ! PA = 0000000020800060
	.word	0x433f3d2c,0x44319d0d,0x364d9cca,0x5e552373 ! PA = 0000000020800070
share2_expect:
	.word	0xffffd1d8,0x1ff40389,0x19922bd6,0x27e89ecf ! PA = 00000000211c0000
	.word	0x4dbd9644,0x2e7802c5,0x0b1b78a2,0x737c48eb ! PA = 00000000211c0010
	.word	0x6fbf9670,0x1f49f6c1,0x06daef2e,0x5d685dc7 ! PA = 00000000211c0020
	.word	0x19d69e5c,0x6af4fb7d,0x5f8dbb7a,0x2b49d963 ! PA = 00000000211c0030
share3_expect:
	.word	0x00003a08,0x443eecf9,0x7588c986,0x781e77bf ! PA = 0000000021800000
	.word	0x2e17b574,0x1e246735,0x3744c552,0x6b20b4db ! PA = 0000000021800010
	.word	0x2d161ca0,0x6294c631,0x17aa1ade,0x7563ccb7 ! PA = 0000000021800020
	.word	0x556a3b8c,0x35ee25ed,0x661cf62a,0x522fbb53 ! PA = 0000000021800030
	.word	0xffff9e38,0x63396269,0x34494336,0x461d3caf ! PA = 0000000021800040
	.word	0x589390a4,0x4d2617a5,0x35aeae02,0x58f1cccb ! PA = 0000000021800050
	.word	0x1a0b1ed0,0x7fc6a1a1,0x44eca28e,0x063ba7a7 ! PA = 0000000021800060
	.word	0x27b514bc,0x3f0c1c5d,0x7ace4cda,0x20adc943 ! PA = 0000000021800070
	.word	0x0000fe68,0x2e0263d9,0x031698e6,0x643bed9f ! PA = 0000000021800080
	.word	0x73cc27d4,0x6acc1415,0x1b0c32b2,0x72f690bb ! PA = 0000000021800090
	.word	0x24299d00,0x3b5e8911,0x65c5863e,0x38a6ee97 ! PA = 00000000218000a0
	.word	0x383229ec,0x26fddecd,0x0234bf8a,0x712b0333 ! PA = 00000000218000b0
	.word	0xffff5a98,0x1878f149,0x0ef3ca96,0x4d918a8f ! PA = 00000000218000c0
	.word	0x341c7b04,0x65255c85,0x07d05362,0x73f600ab ! PA = 00000000218000d0
	.word	0x32bc9730,0x549b7c81,0x2917c5ee,0x561ca187 ! PA = 00000000218000e0
	.word	0x541c7b1c,0x05326d3d,0x44a34e3a,0x1ace6923 ! PA = 00000000218000f0
	.word	0x00ffb2c8,0x493c0ab9,0x34a3d846,0x15f5137f ! PA = 0000000021800100
	.word	0x0b9f8a34,0x5900f0f5,0x582e1012,0x0b771c9b ! PA = 0000000021800110
	.word	0x56cf0d60,0x757c7bf1,0x4586619e,0x38d3c077 ! PA = 0000000021800120
	.word	0x1e6f084c,0x57d8c7ad,0x1e2cf8ea,0x617efb13 ! PA = 0000000021800130
	.word	0x00ff06f8,0x09aab029,0x30a9c1f6,0x59fd886f ! PA = 0000000021800140
	.word	0x5a305564,0x01edd165,0x541868c2,0x4dc0e48b ! PA = 0000000021800150
	.word	0x7b2bff90,0x22c08761,0x2974594e,0x3bc34b67 ! PA = 0000000021800160
	.word	0x3fe4d17c,0x73dfee1d,0x2ea4bf9a,0x65e3b903 ! PA = 0000000021800170
	.word	0xffff5728,0x35e3e199,0x4f4887a6,0x2f01e95f ! PA = 0000000021800180
	.word	0x1d69dc94,0x2a3afdd5,0x5f425d72,0x23da587b ! PA = 0000000021800190
	.word	0x145e6dc0,0x2be69ed1,0x2b04acfe,0x2aa24257 ! PA = 00000000218001a0
	.word	0x16f8d6ac,0x74f6e08d,0x099da24a,0x1563a2f3 ! PA = 00000000218001b0
	.word	0xffffa358,0x2cc69f09,0x1c832956,0x1319364f ! PA = 00000000218001c0
	.word	0x20a71fc4,0x1af77645,0x291eee22,0x3b8a786b ! PA = 00000000218001d0
	.word	0x50b157f0,0x1b2dc241,0x381a5cae,0x31e7a547 ! PA = 00000000218001e0
	.word	0x67e617dc,0x2d8c9efd,0x666aa0fa,0x1a25b8e3 ! PA = 00000000218001f0
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
	.word	0x5a1c82a8,0x374e2f19,0x0afb2f26,0x5fdb42df	! PA = 0000000010001400
	.word	0x5ff7e014,0x73b8c355,0x5c2f9cf2,0x5784e9fb	! PA = 0000000010001410
	.word	0x7655c940,0x11715c51,0x6350047e,0x06838bd7	! PA = 0000000010001420
	.word	0x4ab90a2c,0x1dc0160d,0x1ac291ca,0x5dd92473	! PA = 0000000010001430
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
	.word	0x7eae2ed8,0x18b7cc89,0x46d530d6,0x7cf86fcf	! PA = 0000000030001400
	.word	0x4af78344,0x20321bc5,0x67498da2,0x75a0e9eb	! PA = 0000000030001410
	.word	0x1a791370,0x5b8b5fc1,0x6ea1142e,0x267acec7	! PA = 0000000030001420
	.word	0x28e4ab5c,0x041eb47d,0x2b28f07a,0x68731a63	! PA = 0000000030001430
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
	.word	0x7125d708,0x2681f5f9,0x0dc60e86,0x0ad788bf	! PA = 0000000010041400
	.word	0x778de274,0x7881c035,0x3a811a52,0x5a3295db	! PA = 0000000010041410
	.word	0x3bbfd9a0,0x5fdd6f31,0x0ed27fde,0x2de77db7	! PA = 0000000010041420
	.word	0x5e5c888c,0x05c31eed,0x09ae6b2a,0x388e3c53	! PA = 0000000010041430
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
	.word	0x466e7b38,0x130bab69,0x4150c836,0x170f8daf	! PA = 0000000030041400
	.word	0x5295fda4,0x7136b0a5,0x52c94302,0x5a80edcb	! PA = 0000000030041410
	.word	0x61f51bd0,0x2c268aa1,0x7747478e,0x08c098a7	! PA = 0000000030041420
	.word	0x40dba1bc,0x509c555d,0x2b2601da,0x4fd18a43	! PA = 0000000030041430
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
	.word	0x45331b68,0x6373ecd9,0x12b85de6,0x67f77e9f	! PA = 0000000010081400
	.word	0x26aad4d4,0x4d9fed15,0x08d507b2,0x6092f1bb	! PA = 0000000010081410
	.word	0x5ea3da00,0x58e5b211,0x03226b3e,0x53bd1f97	! PA = 0000000010081420
	.word	0x1bdcf6ec,0x195957cd,0x3822b48a,0x3ca40433	! PA = 0000000010081430
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
	.word	0x15deb798,0x5f99ba49,0x32ffcf96,0x6ca65b8f	! PA = 0000000030081400
	.word	0x4c276804,0x0fcc7585,0x41176862,0x5b2fa1ab	! PA = 0000000030081410
	.word	0x7d171430,0x7959e581,0x6546eaee,0x4c541287	! PA = 0000000030081420
	.word	0x609b881c,0x0b69263d,0x3cf7833a,0x0a2caa23	! PA = 0000000030081430
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
	.word	0x729c4fc8,0x021c13b9,0x02ea1d46,0x2cf3247f	! PA = 00000000100c1400
	.word	0x5926b734,0x688b49f5,0x1bc36512,0x2dddfd9b	! PA = 00000000100c1410
	.word	0x3259ca60,0x0b8224f1,0x5857c69e,0x40bc7177	! PA = 00000000100c1420
	.word	0x5612554c,0x38fac0ad,0x59b76dea,0x30527c13	! PA = 00000000100c1430
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
	.word	0x5756e3f8,0x6859f929,0x42fa46f6,0x3974d96f	! PA = 00000000300c1400
	.word	0x5183c264,0x276b6a65,0x24cbfdc2,0x20e5058b	! PA = 00000000300c1410
	.word	0x4d36fc90,0x681d7061,0x4eb7fe4e,0x7fed3c67	! PA = 00000000300c1420
	.word	0x48fc5e7c,0x0afd271d,0x7235749a,0x03bc7a03	! PA = 00000000300c1430
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
	.word	0x31b97428,0x42726a99,0x43734ca6,0x1b827a5f	! PA = 0000000010101400
	.word	0x56d98994,0x2abbd6d5,0x03e43272,0x514bb97b	! PA = 0000000010101410
	.word	0x2639aac0,0x32aac7d1,0x228a91fe,0x499d7357	! PA = 0000000010101420
	.word	0x3bd4a3ac,0x311f598d,0x5e04974a,0x25d1a3f3	! PA = 0000000010101430
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
	.word	0x112f0058,0x43446809,0x14582e56,0x4533074f	! PA = 0000000030101400
	.word	0x58830cc4,0x4f8b8f45,0x2c7f0322,0x20d9196b	! PA = 0000000030101410
	.word	0x4facd4f0,0x49692b41,0x45b281ae,0x3e441647	! PA = 0000000030101420
	.word	0x16d624dc,0x11d057fd,0x1877d5fa,0x74b8f9e3	! PA = 0000000030101430
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
	.word	0x56e28888,0x106ef179,0x356bec06,0x015d803f	! PA = 0000000010141400
	.word	0x439b4bf4,0x61a993b5,0x0dcf6fd2,0x2614255b	! PA = 0000000010141410
	.word	0x459b7b20,0x35579ab1,0x71d2cd5e,0x4f182537	! PA = 0000000010141420
	.word	0x57fbe20c,0x3a3f226d,0x70a230aa,0x7b597bd3	! PA = 0000000010141430
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
	.word	0x65bf0cb8,0x325106e9,0x463185b6,0x6398e52f	! PA = 0000000030141400
	.word	0x32fd4724,0x0ba4e425,0x42c87882,0x1c43dd4b	! PA = 0000000030141410
	.word	0x1dd09d50,0x1a351621,0x584e750e,0x2e10a027	! PA = 0000000030141420
	.word	0x4300db3c,0x4e5ab8dd,0x3956a75a,0x615a29c3	! PA = 0000000030141430
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
	.word	0x526f8ce8,0x0409a859,0x35ebfb66,0x383c361f	! PA = 0000000010181400
	.word	0x1f43fe54,0x46cc8095,0x421d1d32,0x536f413b	! PA = 0000000010181410
	.word	0x37d73b80,0x26809d91,0x524878be,0x3de48717	! PA = 0000000010181420
	.word	0x1160106c,0x78d21b4d,0x79283a0a,0x5b2203b3	! PA = 0000000010181430
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
	.word	0x135f0918,0x2377d5c9,0x739e4d16,0x745e730f	! PA = 0000000030181400
	.word	0x0eca7184,0x4b2f6905,0x0e405de2,0x205d512b	! PA = 0000000030181410
	.word	0x6cfa55b0,0x03793101,0x10a3d86e,0x020ada07	! PA = 0000000030181420
	.word	0x2254819c,0x5b1449bd,0x1a69e8ba,0x19d809a3	! PA = 0000000030181430
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
	.word	0x30b88148,0x613a8f39,0x1e0b7ac6,0x25d69bff	! PA = 00000000201c0000
	.word	0x45aba0b4,0x7f9c9d75,0x65653a92,0x4c950d1b	! PA = 00000000201c0010
	.word	0x4044ebe0,0x451dd071,0x4c03941e,0x0eba98f7	! PA = 00000000201c0020
	.word	0x2ad92ecc,0x7d50442d,0x1b2eb36a,0x3b633b93	! PA = 00000000201c0030
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
	.word	0x7466f578,0x30b0d4a9,0x33b68476,0x633bb0ef	! PA = 0000000020800000
	.word	0x75c28be4,0x69a31de5,0x717eb342,0x065d750b	! PA = 0000000020800010
	.word	0x0e81fe10,0x5a2d7be1,0x74caabce,0x78eac3e7	! PA = 0000000020800020
	.word	0x65a917fc,0x3e750a9d,0x3d499a1a,0x3a6a9983	! PA = 0000000020800030
	.word	0x1a1565a8,0x17f9a619,0x42e26a26,0x3be4b1df	! PA = 0000000020800040
	.word	0x6eaa3314,0x1d91ea55,0x783fc7f2,0x50bd88fb	! PA = 0000000020800050
	.word	0x3e3c8c40,0x7c273351,0x631c1f7e,0x46525ad7	! PA = 0000000020800060
	.word	0x433f3d2c,0x44319d0d,0x364d9cca,0x5e552373	! PA = 0000000020800070
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
	.word	0x7f2ed1d8,0x1ff40389,0x19922bd6,0x27e89ecf	! PA = 00000000211c0000
	.word	0x4dbd9644,0x2e7802c5,0x0b1b78a2,0x737c48eb	! PA = 00000000211c0010
	.word	0x6fbf9670,0x1f49f6c1,0x06daef2e,0x5d685dc7	! PA = 00000000211c0020
	.word	0x19d69e5c,0x6af4fb7d,0x5f8dbb7a,0x2b49d963	! PA = 00000000211c0030
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
	.word	0x52de3a08,0x443eecf9,0x7588c986,0x781e77bf	! PA = 0000000021800000
	.word	0x2e17b574,0x1e246735,0x3744c552,0x6b20b4db	! PA = 0000000021800010
	.word	0x2d161ca0,0x6294c631,0x17aa1ade,0x7563ccb7	! PA = 0000000021800020
	.word	0x556a3b8c,0x35ee25ed,0x661cf62a,0x522fbb53	! PA = 0000000021800030
	.word	0x460e9e38,0x63396269,0x34494336,0x461d3caf	! PA = 0000000021800040
	.word	0x589390a4,0x4d2617a5,0x35aeae02,0x58f1cccb	! PA = 0000000021800050
	.word	0x1a0b1ed0,0x7fc6a1a1,0x44eca28e,0x063ba7a7	! PA = 0000000021800060
	.word	0x27b514bc,0x3f0c1c5d,0x7ace4cda,0x20adc943	! PA = 0000000021800070
	.word	0x3b6afe68,0x2e0263d9,0x031698e6,0x643bed9f	! PA = 0000000021800080
	.word	0x73cc27d4,0x6acc1415,0x1b0c32b2,0x72f690bb	! PA = 0000000021800090
	.word	0x24299d00,0x3b5e8911,0x65c5863e,0x38a6ee97	! PA = 00000000218000a0
	.word	0x383229ec,0x26fddecd,0x0234bf8a,0x712b0333	! PA = 00000000218000b0
	.word	0x775e5a98,0x1878f149,0x0ef3ca96,0x4d918a8f	! PA = 00000000218000c0
	.word	0x341c7b04,0x65255c85,0x07d05362,0x73f600ab	! PA = 00000000218000d0
	.word	0x32bc9730,0x549b7c81,0x2917c5ee,0x561ca187	! PA = 00000000218000e0
	.word	0x541c7b1c,0x05326d3d,0x44a34e3a,0x1ace6923	! PA = 00000000218000f0
	.word	0x5013b2c8,0x493c0ab9,0x34a3d846,0x15f5137f	! PA = 0000000021800100
	.word	0x0b9f8a34,0x5900f0f5,0x582e1012,0x0b771c9b	! PA = 0000000021800110
	.word	0x56cf0d60,0x757c7bf1,0x4586619e,0x38d3c077	! PA = 0000000021800120
	.word	0x1e6f084c,0x57d8c7ad,0x1e2cf8ea,0x617efb13	! PA = 0000000021800130
	.word	0x5d7606f8,0x09aab029,0x30a9c1f6,0x59fd886f	! PA = 0000000021800140
	.word	0x5a305564,0x01edd165,0x541868c2,0x4dc0e48b	! PA = 0000000021800150
	.word	0x7b2bff90,0x22c08761,0x2974594e,0x3bc34b67	! PA = 0000000021800160
	.word	0x3fe4d17c,0x73dfee1d,0x2ea4bf9a,0x65e3b903	! PA = 0000000021800170
	.word	0x29305728,0x35e3e199,0x4f4887a6,0x2f01e95f	! PA = 0000000021800180
	.word	0x1d69dc94,0x2a3afdd5,0x5f425d72,0x23da587b	! PA = 0000000021800190
	.word	0x145e6dc0,0x2be69ed1,0x2b04acfe,0x2aa24257	! PA = 00000000218001a0
	.word	0x16f8d6ac,0x74f6e08d,0x099da24a,0x1563a2f3	! PA = 00000000218001b0
	.word	0x5eada358,0x2cc69f09,0x1c832956,0x1319364f	! PA = 00000000218001c0
	.word	0x20a71fc4,0x1af77645,0x291eee22,0x3b8a786b	! PA = 00000000218001d0
	.word	0x50b157f0,0x1b2dc241,0x381a5cae,0x31e7a547	! PA = 00000000218001e0
	.word	0x67e617dc,0x2d8c9efd,0x666aa0fa,0x1a25b8e3	! PA = 00000000218001f0
share3_end:
