/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_1500_12.s
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
!	Seed = 330103158
!	Riesling can be on
!	1 Thread, 1500 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_1500_12.s created on Mar 30, 2009 (10:31:58)
!	RC file : mar26.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc mar26.rc -o mpgen_1500_12 -p 1 -l 1500

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
!	%f0  = f94249ad b1c2eccd fa4f0f60 a7af83e9
!	%f4  = bda69ba1 0599a0f2 49fbd613 0b914ad0
!	%f8  = 8f9419ff 74cf9048 684f1716 473bf102
!	%f12 = 7230fc3b 96cad698 bb2707a5 3e00102c
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = ba75ad65 1f57c39b c64eb61b 4b875e3d
!	%f20 = 7004603e 5031f144 8e062548 73e08d46
!	%f24 = b02846e0 6679adcd 6c22320e fde08795
!	%f28 = e35a6faa 701e00d3 c096dffb d6a9a9c3
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = bffcb3fa a8e00da5 8d29a9e2 6f24de51
!	%f36 = a9ec5791 ea7a4371 19f71669 7ff40f01
!	%f40 = f51daba6 c2a08900 12b6c07e 6a89d15e
!	%f44 = 2fec52a3 39190918 10bb4072 564559fe
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0xdb1c1b8f00000014,%g7,%g1 ! GSR scale =  2, align = 4
	wr	%g1,%g0,%gsr		! GSR = db1c1b8f00000014
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000030181408] = 6f67f0aa, %l7 = 1b505269f557d8dc
	lduba	[%i6+%o4]0x81,%l7	! %l7 = 000000000000006f
!	Mem[00000000300c1410] = 1e607566, %l4 = 44d88924bd72b1f6
	ldsha	[%i3+%o5]0x81,%l4	! %l4 = 0000000000001e60
!	%l5 = 29eb9f341b6781fc, Mem[0000000010041400] = 61b5801a
	stha	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = 61b581fc
!	%l3 = fb61541a352c50cb, Mem[0000000030101410] = 4e4ca547
	stwa	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 352c50cb
!	Mem[0000000010141410] = ba6a7b2e30fb9b79, %l5 = 29eb9f341b6781fc
	ldxa	[%i5+%o5]0x80,%l5	! %l5 = ba6a7b2e30fb9b79
!	%l7 = 000000000000006f, Mem[0000000010101400] = 0ea98bb1
	stwa	%l7,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000006f
!	%f16 = ba75ad65 1f57c39b c64eb61b 4b875e3d
!	%f20 = 7004603e 5031f144 8e062548 73e08d46
!	%f24 = b02846e0 6679adcd 6c22320e fde08795
!	%f28 = e35a6faa 701e00d3 c096dffb d6a9a9c3
	stda	%f16,[%i5]ASI_BLK_SL	! Block Store to 0000000030141400
!	Mem[0000000030181408] = aaf0676f, %l2 = dbf710bdfb5aa8dd
	swapa	[%i6+%o4]0x89,%l2	! %l2 = 00000000aaf0676f
!	Mem[00000000218001c0] = 21a75e86, %l0 = b99ac5c452e46c99
	ldsba	[%o3+0x1c0]%asi,%l0	! %l0 = 0000000000000021
!	Starting 10 instruction Store Burst
!	%l6 = 58793366, %l7 = 0000006f, Mem[0000000010081408] = ffa26b0c 0e0492de
	stda	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 58793366 0000006f

p0_label_2:
!	Mem[0000000010101420] = 0218b4c522356f56, %l5 = ba6a7b2e30fb9b79, %l4 = 0000000000001e60
	add	%i4,0x20,%g1
	casxa	[%g1]0x80,%l5,%l4	! %l4 = 0218b4c522356f56
!	%l0 = 0000000000000021, Mem[0000000010181410] = d18f29ec18d3805a
	stxa	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000000000021
!	%f8  = 8f9419ff, Mem[00000000300c1408] = 5222fa54
	sta	%f8 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 8f9419ff
!	%l2 = 00000000aaf0676f, Mem[0000000030101400] = c5a47d7f
	stwa	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = aaf0676f
!	Mem[0000000020800000] = 21addad7, %l1 = 8c0ec69aae2fb43e
	lduha	[%o1+0x000]%asi,%l1	! %l1 = 00000000000021ad
	membar	#Sync			! Added by membar checker (1)
!	Mem[000000001014140c] = c3916472, %l4 = 0218b4c522356f56
	swap	[%i5+0x00c],%l4		! %l4 = 00000000c3916472
!	%l1 = 00000000000021ad, Mem[00000000300c1410] = 6675601e
	stha	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 667521ad
!	Mem[0000000030101400] = 6f67f0aa, %l5 = ba6a7b2e30fb9b79
	swapa	[%i4+%g0]0x81,%l5	! %l5 = 000000006f67f0aa
!	%l2 = aaf0676f, %l3 = 352c50cb, Mem[00000000300c1410] = ad217566 07eb22c0
	stda	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = aaf0676f 352c50cb
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 9bc3571f65ad75ba, %l2 = 00000000aaf0676f
	ldxa	[%i5+%g0]0x81,%l2	! %l2 = 9bc3571f65ad75ba

p0_label_3:
!	Mem[00000000100c1410] = 91f00131, %l0 = 0000000000000021
	ldswa	[%i3+%o5]0x88,%l0	! %l0 = ffffffff91f00131
!	Mem[0000000010001408] = 6146e006, %l0 = ffffffff91f00131
	lduwa	[%i0+%o4]0x80,%l0	! %l0 = 000000006146e006
!	Mem[0000000010181400] = 99630af4, %l7 = 000000000000006f
	ldswa	[%i6+%g0]0x80,%l7	! %l7 = ffffffff99630af4
!	Mem[0000000030081408] = 368d50fbd8c656cf, %l7 = ffffffff99630af4
	ldxa	[%i2+%o4]0x89,%l7	! %l7 = 368d50fbd8c656cf
!	Mem[0000000010181408] = e52db38d, %f23 = 73e08d46
	lda	[%i6+%o4]0x88,%f23	! %f23 = e52db38d
!	Mem[0000000010041418] = b581d11ce3248c09, %f28 = e35a6faa 701e00d3
	ldd	[%i1+0x018],%f28	! %f28 = b581d11c e3248c09
!	Mem[0000000030141410] = 5031f144, %l7 = 368d50fbd8c656cf
	lduha	[%i5+%o5]0x89,%l7	! %l7 = 000000000000f144
!	Mem[00000000100c1408] = 2bb194bf c5db534d, %l6 = 58793366, %l7 = 0000f144
	ldda	[%i3+%o4]0x88,%l6	! %l6 = 00000000c5db534d 000000002bb194bf
!	Mem[00000000211c0000] = 8063fc65, %l1 = 00000000000021ad
	lduh	[%o2+%g0],%l1		! %l1 = 0000000000008063
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 9c5a122a, %l7 = 000000002bb194bf
	swapa	[%i6+%o5]0x81,%l7	! %l7 = 000000009c5a122a

p0_label_4:
!	%l0 = 6146e006, %l1 = 00008063, Mem[0000000030181400] = 0d489fb9 821f696f
	stda	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 6146e006 00008063
!	Mem[0000000030101408] = 0fca60c7, %l6 = 00000000c5db534d
	swapa	[%i4+%o4]0x81,%l6	! %l6 = 000000000fca60c7
!	%l6 = 0fca60c7, %l7 = 9c5a122a, Mem[0000000010001400] = 3d5653b3 9474ad25
	stda	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 0fca60c7 9c5a122a
!	%l6 = 000000000fca60c7, Mem[0000000010181410] = 0000000000000021
	stx	%l6,[%i6+%o5]		! Mem[0000000010181410] = 000000000fca60c7
!	%l3 = fb61541a352c50cb, Mem[0000000010101410] = 6ce13f1d
	stha	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 50cb3f1d
!	%l6 = 000000000fca60c7, Mem[0000000010001400] = c760ca0f2a125a9c, %asi = 80
	stxa	%l6,[%i0+0x000]%asi	! Mem[0000000010001400] = 000000000fca60c7
!	%l0 = 000000006146e006, Mem[0000000030081410] = 7403f231
	stba	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 0603f231
!	%f23 = e52db38d, Mem[0000000010101438] = c3bf7286
	st	%f23,[%i4+0x038]	! Mem[0000000010101438] = e52db38d
!	%f18 = c64eb61b 4b875e3d, %l2 = 9bc3571f65ad75ba
!	Mem[0000000030081418] = 35adac6c6250d3fc
	add	%i2,0x018,%g1
	stda	%f18,[%g1+%l2]ASI_PST8_S ! Mem[0000000030081418] = c6adb61b4b505efc
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 1b873e42497dd5be, %l2 = 9bc3571f65ad75ba
	ldxa	[%i0+%o5]0x80,%l2	! %l2 = 1b873e42497dd5be

p0_label_5:
!	Mem[0000000010001408] = 6146e006 e22d51aa, %l4 = c3916472, %l5 = 6f67f0aa
	ldda	[%i0+%o4]0x80,%l4	! %l4 = 000000006146e006 00000000e22d51aa
!	Mem[0000000010041428] = 7646daf5, %l6 = 000000000fca60c7
	ldsba	[%i1+0x02a]%asi,%l6	! %l6 = ffffffffffffffda
!	Mem[0000000010181410] = 00000000, %l7 = 000000009c5a122a
	lduha	[%i6+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = ba6a7b2e, %l0 = 000000006146e006
	ldsha	[%i5+%o5]0x80,%l0	! %l0 = ffffffffffffba6a
!	Mem[0000000010081408] = 58793366, %l1 = 0000000000008063
	ldsba	[%i2+0x009]%asi,%l1	! %l1 = 0000000000000079
!	Mem[0000000030141400] = 1f57c39b, %l0 = ffffffffffffba6a
	ldsba	[%i5+%g0]0x89,%l0	! %l0 = ffffffffffffff9b
!	Mem[0000000010181400] = 99630af4, %l4 = 000000006146e006
	ldsba	[%i6+%g0]0x80,%l4	! %l4 = ffffffffffffff99
!	Mem[0000000030001408] = ea37af22, %l7 = 0000000000000000
	lduha	[%i0+%o4]0x89,%l7	! %l7 = 000000000000af22
!	Mem[0000000010041408] = 2d1b38cb, %l7 = 000000000000af22
	lduha	[%i1+%o4]0x88,%l7	! %l7 = 00000000000038cb
!	Starting 10 instruction Store Burst
!	%l2 = 1b873e42497dd5be, Mem[0000000010181400] = 99630af4
	stba	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = be630af4

p0_label_6:
!	%l0 = ffffffffffffff9b, Mem[0000000010181410] = c760ca0f00000000
	stxa	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffffffffffff9b
!	%l5 = 00000000e22d51aa, Mem[0000000030181400] = 06e04661
	stwa	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = e22d51aa
!	Mem[0000000010141400] = e6644197, %l3 = fb61541a352c50cb
	ldstuba	[%i5+%g0]0x88,%l3	! %l3 = 00000097000000ff
!	Mem[0000000010041410] = 4c0d1e2d, %l4 = ffffffffffffff99
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 000000004c0d1e2d
!	Mem[0000000010081400] = 100444bd, %l7 = 00000000000038cb
	ldstuba	[%i2+%g0]0x80,%l7	! %l7 = 00000010000000ff
!	Mem[0000000030041410] = 02b012f0, %l4 = 000000004c0d1e2d
	ldstuba	[%i1+%o5]0x89,%l4	! %l4 = 000000f0000000ff
!	Mem[00000000100c1420] = 7edff2c5, %l1 = 0000000000000079
	swap	[%i3+0x020],%l1		! %l1 = 000000007edff2c5
!	%l2 = 1b873e42497dd5be, Mem[0000000010081410] = 6dc334b0
	stha	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 6dc3d5be
!	%f0  = f94249ad, Mem[0000000030101400] = 799bfb30
	sta	%f0 ,[%i4+%g0]0x89	! Mem[0000000030101400] = f94249ad
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 4d53dbc5, %l5 = 00000000e22d51aa
	ldsha	[%i3+%o4]0x80,%l5	! %l5 = 0000000000004d53

p0_label_7:
!	Mem[0000000010141408] = e61daff2, %l5 = 0000000000004d53
	ldsha	[%i5+%o4]0x88,%l5	! %l5 = ffffffffffffaff2
!	Mem[0000000010041400] = 312a1f03 61b581fc, %l4 = 000000f0, %l5 = ffffaff2
	ldda	[%i1+%g0]0x88,%l4	! %l4 = 0000000061b581fc 00000000312a1f03
!	Mem[0000000030181410] = f0e89c44 bf94b12b, %l6 = ffffffda, %l7 = 00000010
	ldda	[%i6+%o5]0x89,%l6	! %l6 = 00000000bf94b12b 00000000f0e89c44
!	Mem[0000000030101408] = c5db534db92024da, %f0  = f94249ad b1c2eccd
	ldda	[%i4+%o4]0x81,%f0 	! %f0  = c5db534d b92024da
!	Mem[0000000010181408] = 8db32de5, %l2 = 1b873e42497dd5be
	ldsha	[%i6+%o4]0x80,%l2	! %l2 = ffffffffffff8db3
!	Mem[0000000010081410] = bed5c36d, %l0 = ffffffffffffff9b
	ldsba	[%i2+%o5]0x80,%l0	! %l0 = ffffffffffffffbe
!	Mem[0000000030081410] = 0603f231, %l3 = 0000000000000097
	lduwa	[%i2+%o5]0x81,%l3	! %l3 = 000000000603f231
!	Mem[0000000010181410] = 9bffffff, %l3 = 000000000603f231
	ldsha	[%i6+%o5]0x80,%l3	! %l3 = ffffffffffff9bff
!	Mem[0000000010181410] = ffffff9b, %l3 = ffffffffffff9bff
	ldsha	[%i6+%o5]0x88,%l3	! %l3 = ffffffffffffff9b
!	Starting 10 instruction Store Burst
!	%f29 = e3248c09, Mem[00000000100c1408] = 4d53dbc5
	sta	%f29,[%i3+%o4]0x80	! Mem[00000000100c1408] = e3248c09

p0_label_8:
!	Mem[0000000010041408] = 2d1b38cb, %l7 = 00000000f0e89c44
	ldstuba	[%i1+%o4]0x88,%l7	! %l7 = 000000cb000000ff
!	%l5 = 00000000312a1f03, Mem[00000000300c1408] = ff19948f
	stha	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 1f03948f
!	%l3 = ffffffffffffff9b, Mem[0000000021800181] = 40615fec, %asi = 80
	stba	%l3,[%o3+0x181]%asi	! Mem[0000000021800180] = 409b5fec
!	Mem[0000000030041408] = 09b16f3a, %l0 = ffffffffffffffbe
	ldstuba	[%i1+%o4]0x81,%l0	! %l0 = 00000009000000ff
!	%l4 = 0000000061b581fc, Mem[0000000010081400] = ff0444bda0f36d7f
	stxa	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000061b581fc
!	%f10 = 684f1716 473bf102, %l5 = 00000000312a1f03
!	Mem[0000000030001418] = 34c6a322b316670e
	add	%i0,0x018,%g1
	stda	%f10,[%g1+%l5]ASI_PST32_S ! Mem[0000000030001418] = 684f1716473bf102
!	Mem[0000000010041428] = 7646daf58bd5e470, %l5 = 00000000312a1f03, %l4 = 0000000061b581fc
	add	%i1,0x28,%g1
	casxa	[%g1]0x80,%l5,%l4	! %l4 = 7646daf58bd5e470
!	Mem[0000000030041410] = ff12b002, %l1 = 000000007edff2c5
	ldstuba	[%i1+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	%l4 = 8bd5e470, %l5 = 312a1f03, Mem[0000000010041410] = ffffff99 c1bba0dd
	stda	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 8bd5e470 312a1f03
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 7633a250, %l5 = 00000000312a1f03
	ldsba	[%o0+0x000]%asi,%l5	! %l5 = 0000000000000076

p0_label_9:
!	Mem[00000000100c1418] = 9da4e622, %l5 = 0000000000000076
	ldsha	[%i3+0x01a]%asi,%l5	! %l5 = ffffffffffffe622
!	Mem[0000000030141400] = ba75ad651f57c39b, %l4 = 7646daf58bd5e470
	ldxa	[%i5+%g0]0x89,%l4	! %l4 = ba75ad651f57c39b
!	Mem[0000000030101408] = 4d53dbc5, %l1 = 00000000000000ff
	ldstuba	[%i4+%o4]0x89,%l1	! %l1 = 000000c5000000ff
!	Mem[0000000010081410] = bed5c36d, %l3 = ffffffffffffff9b
	ldsha	[%i2+%o5]0x80,%l3	! %l3 = ffffffffffffbed5
!	Mem[0000000010001400] = 00000000, %f24 = b02846e0
	lda	[%i0+%g0]0x88,%f24	! %f24 = 00000000
!	Mem[0000000010101400] = 0000006f bad3e618, %l2 = ffff8db3, %l3 = ffffbed5
	ldda	[%i4+%g0]0x80,%l2	! %l2 = 000000000000006f 00000000bad3e618
!	Mem[00000000300c1400] = 99900043, %l3 = 00000000bad3e618
	ldsha	[%i3+%g0]0x89,%l3	! %l3 = 0000000000000043
!	Mem[00000000100c1408] = e3248c09, %l0 = 0000000000000009
	ldsw	[%i3+%o4],%l0		! %l0 = ffffffffe3248c09
!	Mem[0000000030141400] = 1f57c39b, %l3 = 0000000000000043
	ldsha	[%i5+%g0]0x89,%l3	! %l3 = ffffffffffffc39b
!	Starting 10 instruction Store Burst
!	%f0  = c5db534d, Mem[0000000010081408] = 58793366
	st	%f0 ,[%i2+%o4]		! Mem[0000000010081408] = c5db534d

p0_label_10:
!	%f6  = 49fbd613, Mem[0000000030001410] = 5c8a3a78
	sta	%f6 ,[%i0+%o5]0x89	! Mem[0000000030001410] = 49fbd613
!	%l5 = ffffffffffffe622, Mem[0000000030041410] = 758efe6702b012ff
	stxa	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = ffffffffffffe622
!	%l2 = 000000000000006f, Mem[0000000010181428] = f7fa9d79, %asi = 80
	stba	%l2,[%i6+0x028]%asi	! Mem[0000000010181428] = 6ffa9d79
!	%f22 = 8e062548 e52db38d, %l0 = ffffffffe3248c09
!	Mem[0000000010101410] = 50cb3f1d083bcea6
	add	%i4,0x010,%g1
	stda	%f22,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010101410] = 8db33f1d083b068e
!	Mem[0000000030101408] = ffdb534d, %l1 = 00000000000000c5
	swapa	[%i4+%o4]0x81,%l1	! %l1 = 00000000ffdb534d
!	%l4 = ba75ad651f57c39b, Mem[0000000030041408] = 3a6fb1ff
	stba	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 3a6fb19b
!	Mem[0000000030081410] = 0603f231, %l2 = 000000000000006f
	ldstuba	[%i2+%o5]0x81,%l2	! %l2 = 00000006000000ff
!	Mem[0000000030101400] = ad4942f9, %l7 = 00000000000000cb
	ldstuba	[%i4+%g0]0x81,%l7	! %l7 = 000000ad000000ff
!	%l6 = 00000000bf94b12b, Mem[0000000020800040] = c5638049, %asi = 80
	stha	%l6,[%o1+0x040]%asi	! Mem[0000000020800040] = b12b8049
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 312a1f0361b581fc, %f2  = fa4f0f60 a7af83e9
	ldda	[%i1+%g0]0x88,%f2 	! %f2  = 312a1f03 61b581fc

p0_label_11:
!	Mem[0000000010041424] = 8db1fdd1, %l6 = 00000000bf94b12b
	ldsh	[%i1+0x024],%l6		! %l6 = ffffffffffff8db1
!	Mem[0000000010001408] = 6146e006, %f22 = 8e062548
	lda	[%i0+%o4]0x80,%f22	! %f22 = 6146e006
!	Mem[00000000300c1400] = 43009099, %l6 = ffffffffffff8db1
	lduba	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000043
!	Mem[0000000010041408] = ff381b2d97694597, %f30 = c096dffb d6a9a9c3
	ldda	[%i1+%o4]0x80,%f30	! %f30 = ff381b2d 97694597
!	Mem[00000000100c1410] = 3101f091, %l4 = ba75ad651f57c39b
	ldsha	[%i3+%o5]0x80,%l4	! %l4 = 0000000000003101
!	Mem[0000000030041408] = 3a6fb19b, %l2 = 0000000000000006
	ldswa	[%i1+%o4]0x89,%l2	! %l2 = 000000003a6fb19b
!	Mem[00000000100c1428] = e7c06ab9744ab3d1, %f22 = 6146e006 e52db38d
	ldd	[%i3+0x028],%f22	! %f22 = e7c06ab9 744ab3d1
!	Mem[0000000010101408] = 6e05bab7, %l6 = 0000000000000043
	ldsha	[%i4+%o4]0x80,%l6	! %l6 = 0000000000006e05
!	Mem[00000000100c1408] = 098c24e3, %l5 = ffffffffffffe622
	ldsha	[%i3+%o4]0x88,%l5	! %l5 = 00000000000024e3
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = ffffff9b, %l1 = 00000000ffdb534d
	ldstuba	[%i6+%o5]0x88,%l1	! %l1 = 0000009b000000ff

p0_label_12:
!	%l7 = 00000000000000ad, Mem[00000000100c1408] = e3248c09
	stwa	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ad
!	%l4 = 0000000000003101, Mem[0000000021800040] = 9eef53ef
	sth	%l4,[%o3+0x040]		! Mem[0000000021800040] = 310153ef
!	%l0 = ffffffffe3248c09, Mem[0000000010001410] = 1b873e42497dd5be, %asi = 80
	stxa	%l0,[%i0+0x010]%asi	! Mem[0000000010001410] = ffffffffe3248c09
!	%l3 = ffffffffffffc39b, Mem[0000000010141400] = ff4164e6
	stwa	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = ffffc39b
!	%f0  = c5db534d b92024da, Mem[0000000010081400] = 00000000 61b581fc
	stda	%f0 ,[%i2+%g0]0x80	! Mem[0000000010081400] = c5db534d b92024da
!	Mem[00000000300c1410] = aaf0676f, %l1 = 000000000000009b
	swapa	[%i3+%o5]0x81,%l1	! %l1 = 00000000aaf0676f
!	Mem[0000000030041408] = 9bb16f3a, %l7 = 00000000000000ad
	swapa	[%i1+%o4]0x81,%l7	! %l7 = 000000009bb16f3a
!	%l3 = ffffffffffffc39b, Mem[0000000010001426] = 4736edeb
	sth	%l3,[%i0+0x026]		! Mem[0000000010001424] = 4736c39b
!	%f25 = 6679adcd, Mem[0000000010041408] = 2d1b38ff
	sta	%f25,[%i1+%o4]0x88	! Mem[0000000010041408] = 6679adcd
!	Starting 10 instruction Load Burst
!	%l6 = 0000000000006e05, Mem[0000000020800040] = b12b8049
	sth	%l6,[%o1+0x040]		! Mem[0000000020800040] = 6e058049

p0_label_13:
!	Mem[0000000010181408] = e52db38d, %l0 = ffffffffe3248c09
	ldswa	[%i6+%o4]0x88,%l0	! %l0 = ffffffffe52db38d
!	Mem[0000000030181400] = e22d51aa, %l4 = 0000000000003101
	ldsha	[%i6+%g0]0x89,%l4	! %l4 = 00000000000051aa
!	Mem[00000000300c1400] = 43009099865fb465, %f26 = 6c22320e fde08795
	ldda	[%i3+%g0]0x81,%f26	! %f26 = 43009099 865fb465
!	Mem[0000000010181430] = 75c7575d, %l5 = 00000000000024e3
	ldsha	[%i6+0x032]%asi,%l5	! %l5 = 000000000000575d
!	Mem[0000000030001408] = 22af37ea0fb8309e, %f14 = bb2707a5 3e00102c
	ldda	[%i0+%o4]0x81,%f14	! %f14 = 22af37ea 0fb8309e
!	Mem[0000000030101400] = ff4942f9, %l2 = 000000003a6fb19b
	lduwa	[%i4+%g0]0x81,%l2	! %l2 = 00000000ff4942f9
!	Mem[0000000010081434] = ff33b71c, %l1 = 00000000aaf0676f
	ldswa	[%i2+0x034]%asi,%l1	! %l1 = ffffffffff33b71c
!	Mem[0000000010081408] = c5db534d0000006f, %f8  = 8f9419ff 74cf9048
	ldda	[%i2+%o4]0x80,%f8 	! %f8  = c5db534d 0000006f
!	Mem[00000000100c1400] = 42ed4f8d, %l1 = ffffffffff33b71c
	ldsba	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000042
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000575d, Mem[0000000030041408] = 86cc233ead000000
	stxa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000000000575d

p0_label_14:
!	%f30 = ff381b2d 97694597, Mem[0000000010141410] = ba6a7b2e 30fb9b79
	stda	%f30,[%i5+%o5]0x80	! Mem[0000000010141410] = ff381b2d 97694597
!	Mem[00000000100c1400] = 42ed4f8d, %l1 = 0000000000000042
	ldstuba	[%i3+%g0]0x80,%l1	! %l1 = 00000042000000ff
!	%l1 = 0000000000000042, Mem[0000000010041400] = fc81b561
	stba	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 4281b561
!	Mem[000000001000140c] = e22d51aa, %l2 = 00000000ff4942f9
	swap	[%i0+0x00c],%l2		! %l2 = 00000000e22d51aa
!	%f31 = 97694597, Mem[0000000030181400] = aa512de2
	sta	%f31,[%i6+%g0]0x81	! Mem[0000000030181400] = 97694597
!	Mem[0000000030001410] = 49fbd613, %l1 = 0000000000000042
	ldstuba	[%i0+%o5]0x89,%l1	! %l1 = 00000013000000ff
!	%l1 = 0000000000000013, Mem[0000000030001400] = 10609d9d
	stwa	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000013
!	Mem[0000000030001400] = 13000000, %l1 = 0000000000000013
	swapa	[%i0+%g0]0x81,%l1	! %l1 = 0000000013000000
!	Mem[0000000030041410] = 22e6ffff, %l1 = 0000000013000000
	swapa	[%i1+%o5]0x81,%l1	! %l1 = 0000000022e6ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = fb5aa8dd, %l4 = 00000000000051aa
	lduba	[%i6+%o4]0x89,%l4	! %l4 = 00000000000000dd

p0_label_15:
!	Mem[0000000030041410] = 00000013, %l7 = 000000009bb16f3a
	ldsha	[%i1+%o5]0x89,%l7	! %l7 = 0000000000000013
!	Mem[0000000010141400] = 9bc3ffff, %l2 = 00000000e22d51aa
	lduwa	[%i5+%g0]0x88,%l2	! %l2 = 000000009bc3ffff
!	Mem[0000000030181410] = f0e89c44bf94b12b, %l4 = 00000000000000dd
	ldxa	[%i6+%o5]0x89,%l4	! %l4 = f0e89c44bf94b12b
!	Mem[0000000010081430] = e58b57de, %l0 = ffffffffe52db38d
	lduh	[%i2+0x030],%l0		! %l0 = 000000000000e58b
!	Mem[00000000300c1410] = cb502c359b000000, %l4 = f0e89c44bf94b12b
	ldxa	[%i3+%o5]0x89,%l4	! %l4 = cb502c359b000000
!	Mem[0000000010081424] = feb50952, %l0 = 000000000000e58b
	lduwa	[%i2+0x024]%asi,%l0	! %l0 = 00000000feb50952
!	Mem[00000000300c1408] = 8f94031f, %l5 = 000000000000575d
	lduwa	[%i3+%o4]0x89,%l5	! %l5 = 000000008f94031f
!	Mem[0000000010141408] = e61daff2, %l4 = cb502c359b000000
	ldsha	[%i5+%o4]0x88,%l4	! %l4 = ffffffffffffaff2
!	Mem[0000000010041410] = 312a1f03 8bd5e470, %l0 = feb50952, %l1 = 22e6ffff
	ldda	[%i1+%o5]0x88,%l0	! %l0 = 000000008bd5e470 00000000312a1f03
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 4f2f59a9, %l3 = ffffffffffffc39b
	swapa	[%i1+%g0]0x89,%l3	! %l3 = 000000004f2f59a9

p0_label_16:
!	%f12 = 7230fc3b 96cad698, Mem[0000000030001410] = ffd6fb49 fea95ba5
	stda	%f12,[%i0+%o5]0x81	! Mem[0000000030001410] = 7230fc3b 96cad698
!	%l2 = 000000009bc3ffff, Mem[00000000201c0001] = 7633a250, %asi = 80
	stba	%l2,[%o0+0x001]%asi	! Mem[00000000201c0000] = 76ffa250
!	Mem[00000000100c140c] = bf94b12b, %l2 = 000000009bc3ffff, %asi = 80
	swapa	[%i3+0x00c]%asi,%l2	! %l2 = 00000000bf94b12b
!	%l2 = 00000000bf94b12b, Mem[0000000030141410] = 5031f144
	stwa	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = bf94b12b
!	%l0 = 000000008bd5e470, Mem[0000000010101410] = 8db33f1d
	stha	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = e4703f1d
!	%l4 = ffffffffffffaff2, Mem[0000000010181408] = 444da48fe52db38d
	stxa	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffffffffffaff2
!	Mem[0000000010081400] = 4d53dbc5, %l4 = ffffffffffffaff2
	ldstuba	[%i2+%g0]0x88,%l4	! %l4 = 000000c5000000ff
!	%l4 = 000000c5, %l5 = 8f94031f, Mem[0000000010181418] = e756ad06 df12c492
	stda	%l4,[%i6+0x018]%asi	! Mem[0000000010181418] = 000000c5 8f94031f
!	Mem[0000000010181400] = be630af4, %l1 = 00000000312a1f03
	swapa	[%i6+%g0]0x80,%l1	! %l1 = 00000000be630af4
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = cdad7966, %l3 = 000000004f2f59a9
	lduha	[%i1+%o4]0x80,%l3	! %l3 = 000000000000cdad

p0_label_17:
!	Mem[0000000030181408] = dda85afb, %l1 = 00000000be630af4
	lduha	[%i6+%o4]0x81,%l1	! %l1 = 000000000000dda8
!	%l1 = 000000000000dda8, Mem[0000000010081412] = bed5c36d
	stb	%l1,[%i2+0x012]		! Mem[0000000010081410] = bed5a86d
!	Mem[00000000100c1400] = ffed4f8d, %l6 = 0000000000006e05
	ldswa	[%i3+%g0]0x80,%l6	! %l6 = ffffffffffed4f8d
!	Mem[0000000030081400] = 602119be 5a9786c8, %l4 = 000000c5, %l5 = 8f94031f
	ldda	[%i2+%g0]0x89,%l4	! %l4 = 000000005a9786c8 00000000602119be
!	Mem[0000000010081424] = feb50952, %l7 = 0000000000000013
	ldsw	[%i2+0x024],%l7		! %l7 = fffffffffeb50952
!	Mem[0000000010081400] = ffdb534d, %l0 = 000000008bd5e470
	ldswa	[%i2+%g0]0x80,%l0	! %l0 = ffffffffffdb534d
!	Mem[0000000030081408] = cf56c6d8, %l3 = 000000000000cdad
	ldswa	[%i2+%o4]0x81,%l3	! %l3 = ffffffffcf56c6d8
!	Mem[0000000010081430] = e58b57deff33b71c, %f28 = b581d11c e3248c09
	ldd	[%i2+0x030],%f28	! %f28 = e58b57de ff33b71c
!	Mem[0000000030141400] = 9bc3571f65ad75ba, %f16 = ba75ad65 1f57c39b
	ldda	[%i5+%g0]0x81,%f16	! %f16 = 9bc3571f 65ad75ba
!	Starting 10 instruction Store Burst
!	%f17 = 65ad75ba, Mem[0000000030181410] = bf94b12b
	sta	%f17,[%i6+%o5]0x89	! Mem[0000000030181410] = 65ad75ba

p0_label_18:
!	%f10 = 684f1716 473bf102, Mem[0000000010141420] = e3556f4a b5849df1
	std	%f10,[%i5+0x020]	! Mem[0000000010141420] = 684f1716 473bf102
!	Mem[0000000010141410] = 2d1b38ff, %l0 = ffffffffffdb534d
	swapa	[%i5+%o5]0x88,%l0	! %l0 = 000000002d1b38ff
!	Mem[0000000020800040] = 6e058049, %l4 = 000000005a9786c8
	ldstuba	[%o1+0x040]%asi,%l4	! %l4 = 0000006e000000ff
!	Mem[0000000030041410] = 00000013, %l5 = 00000000602119be
	ldstuba	[%i1+%o5]0x89,%l5	! %l5 = 00000013000000ff
!	%l2 = bf94b12b, %l3 = cf56c6d8, Mem[0000000010041408] = cdad7966 97694597
	stda	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = bf94b12b cf56c6d8
!	%l6 = ffffffffffed4f8d, Mem[0000000010081408] = c5db534d
	stha	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 4f8d534d
!	%f0  = c5db534d, Mem[0000000030141400] = 9bc3571f
	sta	%f0 ,[%i5+%g0]0x81	! Mem[0000000030141400] = c5db534d
!	Mem[00000000211c0000] = 8063fc65, %l7 = fffffffffeb50952
	ldstuba	[%o2+0x000]%asi,%l7	! %l7 = 00000080000000ff
!	%f6  = 49fbd613, Mem[0000000010101408] = b7ba056e
	sta	%f6 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 49fbd613
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 97694597, %l1 = 000000000000dda8
	ldswa	[%i6+%g0]0x81,%l1	! %l1 = ffffffff97694597

p0_label_19:
!	Mem[0000000010101420] = 0218b4c522356f56, %f26 = 43009099 865fb465
	ldda	[%i4+0x020]%asi,%f26	! %f26 = 0218b4c5 22356f56
!	Mem[0000000010101400] = 0000006fbad3e618, %l1 = ffffffff97694597
	ldxa	[%i4+%g0]0x80,%l1	! %l1 = 0000006fbad3e618
!	Mem[0000000030181408] = dda85afb, %l1 = 0000006fbad3e618
	lduha	[%i6+%o4]0x81,%l1	! %l1 = 000000000000dda8
!	Mem[0000000030081400] = c886975abe192160, %f16 = 9bc3571f 65ad75ba
	ldda	[%i2+%g0]0x81,%f16	! %f16 = c886975a be192160
!	Mem[00000000211c0000] = ff63fc65, %l1 = 000000000000dda8
	ldsha	[%o2+0x000]%asi,%l1	! %l1 = ffffffffffffff63
!	Mem[0000000030141400] = 4d53dbc5, %l6 = ffffffffffed4f8d
	ldsba	[%i5+%g0]0x89,%l6	! %l6 = ffffffffffffffc5
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000010101400] = 0000006f bad3e618 13d6fb49 ae74c3c6
!	Mem[0000000010101410] = e4703f1d 083b068e 5f00f0e5 14f48c0e
!	Mem[0000000010101420] = 0218b4c5 22356f56 bc38b04d a692875c
!	Mem[0000000010101430] = 2091dbe7 7c90f09e e52db38d e9cd8241
	ldda	[%i4]ASI_BLK_P,%f16	! Block Load from 0000000010101400
!	Mem[0000000030101408] = 000000c5, %l6 = ffffffffffffffc5
	ldsha	[%i4+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001410] = 98d6ca963bfc3072, %l7 = 0000000000000080
	ldxa	[%i0+%o5]0x89,%l7	! %l7 = 98d6ca963bfc3072
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffff63, Mem[0000000030101408] = da2420b9c5000000
	stxa	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = ffffffffffffff63

p0_label_20:
!	%f14 = 22af37ea, Mem[0000000030001408] = ea37af22
	sta	%f14,[%i0+%o4]0x89	! Mem[0000000030001408] = 22af37ea
!	%f4  = bda69ba1 0599a0f2, %l4 = 000000000000006e
!	Mem[0000000030181430] = c0cb8cd651b0d0db
	add	%i6,0x030,%g1
	stda	%f4,[%g1+%l4]ASI_PST16_SL ! Mem[0000000030181430] = c0cb9905a19ba6bd
!	%l4 = 000000000000006e, Mem[0000000010081434] = ff33b71c
	stw	%l4,[%i2+0x034]		! Mem[0000000010081434] = 0000006e
!	%f4  = bda69ba1 0599a0f2, %f8  = c5db534d
	fxtos	%f4 ,%f8 		! %f8  = de84b2c9
!	%l5 = 0000000000000013, Mem[0000000010181408] = ffffaff2
	stba	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffaf13
!	%l7 = 98d6ca963bfc3072, Mem[0000000030101400] = ff4942f9
	stwa	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = 3bfc3072
!	Mem[0000000010141404] = 700412b3, %l7 = 98d6ca963bfc3072
	swap	[%i5+0x004],%l7		! %l7 = 00000000700412b3
!	%l0 = 2d1b38ff, %l1 = ffffff63, Mem[00000000100c1400] = ffed4f8d 872cd317
	stda	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 2d1b38ff ffffff63
!	%l6 = 0000000000000000, Mem[0000000010041408] = bf94b12b
	stba	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 0094b12b
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 4d53dbc5, %l4 = 000000000000006e
	lduwa	[%i5+%g0]0x89,%l4	! %l4 = 000000004d53dbc5

p0_label_21:
!	Mem[0000000030101410] = c7e62b75 cb502c35, %l2 = bf94b12b, %l3 = cf56c6d8
	ldda	[%i4+%o5]0x89,%l2	! %l2 = 00000000cb502c35 00000000c7e62b75
!	Mem[00000000211c0000] = ff63fc65, %l5 = 0000000000000013
	ldsb	[%o2+0x001],%l5		! %l5 = 0000000000000063
!	Mem[0000000010181400] = 312a1f03, %l3 = 00000000c7e62b75
	lduba	[%i6+0x002]%asi,%l3	! %l3 = 000000000000001f
!	Mem[000000001014141c] = 7e98219d, %l5 = 0000000000000063
	ldsba	[%i5+0x01f]%asi,%l5	! %l5 = ffffffffffffff9d
!	Mem[0000000030181408] = dda85afbe1d89a27, %f4  = bda69ba1 0599a0f2
	ldda	[%i6+%o4]0x81,%f4 	! %f4  = dda85afb e1d89a27
!	Mem[0000000010001410] = ffffffff, %l2 = 00000000cb502c35
	lduha	[%i0+%o5]0x80,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010041410] = 70e4d58b, %l6 = 0000000000000000
	ldsba	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000070
!	Mem[0000000010081434] = 0000006e, %l5 = ffffffffffffff9d
	ldsh	[%i2+0x034],%l5		! %l5 = 0000000000000000
!	Mem[00000000300c1410] = 9b000000, %l6 = 0000000000000070
	lduha	[%i3+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f2  = 312a1f03 61b581fc, %l1 = ffffffffffffff63
!	Mem[0000000010081428] = f849b038eed01bdc
	add	%i2,0x028,%g1
	stda	%f2,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010081428] = fc81b561eed01bdc

p0_label_22:
!	Mem[00000000300c1410] = 9b000000, %l5 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1408] = 8f94031f, %l6 = 0000000000000000
	ldstuba	[%i3+%o4]0x89,%l6	! %l6 = 0000001f000000ff
!	%l0 = 000000002d1b38ff, Mem[0000000030001400] = 00000013
	stwa	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 2d1b38ff
!	Mem[0000000030081410] = ff03f231, %l2 = 000000000000ffff
	ldstuba	[%i2+%o5]0x81,%l2	! %l2 = 000000ff000000ff
!	%l6 = 000000000000001f, Mem[0000000030101410] = 352c50cb
	stwa	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000001f
!	Mem[0000000030041408] = 0000575d, %l3 = 000000000000001f
	swapa	[%i1+%o4]0x89,%l3	! %l3 = 000000000000575d
!	Mem[0000000010081404] = b92024da, %l4 = 4d53dbc5, %l1 = ffffff63
	add	%i2,0x04,%g1
	casa	[%g1]0x80,%l4,%l1	! %l1 = 00000000b92024da
!	%l4 = 000000004d53dbc5, Mem[0000000030001410] = 3bfc3072
	stba	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 3bfc30c5
!	Mem[0000000010181400] = 312a1f03, %l3 = 000000000000575d
	swapa	[%i6+%g0]0x80,%l3	! %l3 = 00000000312a1f03
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1420] = 00000079, %l5 = 0000000000000000
	lduw	[%i3+0x020],%l5		! %l5 = 0000000000000079

p0_label_23:
!	Mem[0000000010141430] = aee50a77d1692ee8, %l6 = 000000000000001f
	ldxa	[%i5+0x030]%asi,%l6	! %l6 = aee50a77d1692ee8
!	Mem[0000000030181400] = 97456997, %l1 = 00000000b92024da
	lduba	[%i6+%g0]0x89,%l1	! %l1 = 0000000000000097
!	Mem[0000000030181410] = 65ad75ba, %l0 = 000000002d1b38ff
	ldswa	[%i6+%o5]0x89,%l0	! %l0 = 0000000065ad75ba
!	Mem[00000000211c0000] = ff63fc65, %l5 = 0000000000000079
	lduba	[%o2+0x001]%asi,%l5	! %l5 = 0000000000000063
!	Code Fragment 4
p0_fragment_1:
!	%l0 = 0000000065ad75ba
	setx	0x3ed8ead00d6b386e,%g7,%l0 ! %l0 = 3ed8ead00d6b386e
!	%l1 = 0000000000000097
	setx	0x3be8bca056e0dd08,%g7,%l1 ! %l1 = 3be8bca056e0dd08
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3ed8ead00d6b386e
	setx	0xcd3a2e8014cf9307,%g7,%l0 ! %l0 = cd3a2e8014cf9307
!	%l1 = 3be8bca056e0dd08
	setx	0xb87e3648018b012a,%g7,%l1 ! %l1 = b87e3648018b012a
!	Mem[0000000030001400] = ff381b2d, %l2 = 00000000000000ff
	ldsha	[%i0+%g0]0x89,%l2	! %l2 = 0000000000001b2d
!	Mem[0000000030101410] = 0000001f, %l3 = 00000000312a1f03
	ldsba	[%i4+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = ffdb534d, %l0 = cd3a2e8014cf9307
	lduha	[%i5+%o5]0x88,%l0	! %l0 = 000000000000534d
!	Mem[0000000030041408] = 000000000000001f, %f28 = 2091dbe7 7c90f09e
	ldda	[%i1+%o4]0x89,%f28	! %f28 = 00000000 0000001f
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = ea37af22, %l7 = 00000000700412b3
	ldstuba	[%i0+%o4]0x81,%l7	! %l7 = 000000ea000000ff

p0_label_24:
!	%l3 = 0000000000000000, Mem[0000000030141410] = 2bb194bf
	stba	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = 00b194bf
!	Mem[0000000010141400] = ffffc39b, %l4 = 000000004d53dbc5
	swapa	[%i5+%g0]0x80,%l4	! %l4 = 00000000ffffc39b
!	%f0  = c5db534d b92024da, %l0 = 000000000000534d
!	Mem[00000000100c1438] = 4ec5c0b285c5bcee
	add	%i3,0x038,%g1
	stda	%f0,[%g1+%l0]ASI_PST16_PL ! Mem[00000000100c1438] = da24c0b24d53dbc5
!	Mem[0000000030101410] = 0000001f, %l1 = b87e3648018b012a
	swapa	[%i4+%o5]0x81,%l1	! %l1 = 000000000000001f
!	Mem[0000000030101400] = 7230fc3b, %l6 = aee50a77d1692ee8
	swapa	[%i4+%g0]0x89,%l6	! %l6 = 000000007230fc3b
!	Mem[0000000010001400] = 00000000, %l7 = 00000000000000ea
	ldstuba	[%i0+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	%f26 = bc38b04d a692875c, Mem[0000000030001408] = 22af37ff 9e30b80f
	stda	%f26,[%i0+%o4]0x89	! Mem[0000000030001408] = bc38b04d a692875c
!	%f28 = 00000000 0000001f, %l4 = 00000000ffffc39b
!	Mem[0000000010081428] = fc81b561eed01bdc
	add	%i2,0x028,%g1
	stda	%f28,[%g1+%l4]ASI_PST8_P ! Mem[0000000010081428] = 0081b50000d0001f
!	Mem[0000000010141404] = 3bfc3072, %l7 = 00000000, %l3 = 00000000
	add	%i5,0x04,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 000000003bfc3072
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 000000ff, %l3 = 000000003bfc3072
	ldsha	[%i0+%g0]0x88,%l3	! %l3 = 00000000000000ff

p0_label_25:
!	Mem[0000000010101408] = 49fbd613, %l2 = 0000000000001b2d
	ldsba	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000013
!	Mem[0000000030101408] = ffffff63, %l5 = 0000000000000063
	lduha	[%i4+%o4]0x89,%l5	! %l5 = 000000000000ff63
!	Mem[0000000030081410] = 31f203ff, %l1 = 000000000000001f
	lduha	[%i2+%o5]0x89,%l1	! %l1 = 00000000000003ff
!	Mem[0000000030101400] = d1692ee8, %l2 = 0000000000000013
	lduwa	[%i4+%g0]0x89,%l2	! %l2 = 00000000d1692ee8
!	Mem[0000000010181400] = 0000575d, %l2 = 00000000d1692ee8
	ldswa	[%i6+%g0]0x80,%l2	! %l2 = 000000000000575d
!	Mem[00000000300c1408] = 8f9403ff, %l7 = 0000000000000000
	ldsba	[%i3+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000201c0000] = 76ffa250, %l2 = 000000000000575d
	ldsb	[%o0+0x001],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000030181408] = dda85afbe1d89a27, %l6 = 000000007230fc3b
	ldxa	[%i6+%o4]0x81,%l6	! %l6 = dda85afbe1d89a27
!	Mem[0000000030001400] = 2d1b38ff3dd55192, %f4  = dda85afb e1d89a27
	ldda	[%i0+%g0]0x81,%f4 	! %f4  = 2d1b38ff 3dd55192
!	Starting 10 instruction Store Burst
!	%f28 = 00000000 0000001f, Mem[0000000030181408] = fb5aa8dd 279ad8e1
	stda	%f28,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 0000001f

p0_label_26:
!	%l0 = 000000000000534d, Mem[0000000010181410] = ffffffffffffffff
	stxa	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000000000534d
!	Mem[00000000211c0000] = ff63fc65, %l3 = 00000000000000ff
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010081400] = ffdb534d, %l6 = dda85afbe1d89a27
	swapa	[%i2+%g0]0x80,%l6	! %l6 = 00000000ffdb534d
!	%l3 = 00000000000000ff, Mem[00000000100c1400] = 2d1b38ff
	stwa	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff
!	Mem[0000000010081408] = 4f8d534d, %l2 = ffffffffffffffff
	ldstub	[%i2+%o4],%l2		! %l2 = 0000004f000000ff
!	%l0 = 000000000000534d, Mem[0000000030041408] = 1f000000
	stba	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 4d000000
!	%l6 = ffdb534d, %l7 = ffffffff, Mem[0000000010181410] = 0000534d 00000000
	stda	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = ffdb534d ffffffff
!	%l3 = 00000000000000ff, Mem[0000000010041410] = 70e4d58b031f2a31
	stxa	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000000000ff
!	%l4 = 00000000ffffc39b, Mem[0000000030041408] = 4d000000
	stba	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 9b000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 0094b12b, %l7 = ffffffffffffffff
	ldsba	[%i1+%o4]0x80,%l7	! %l7 = 0000000000000000

p0_label_27:
!	Mem[0000000030181400] = 97456997, %l6 = 00000000ffdb534d
	lduwa	[%i6+%g0]0x89,%l6	! %l6 = 0000000097456997
!	Mem[0000000030041408] = 0000009b, %l4 = 00000000ffffc39b
	lduba	[%i1+%o4]0x89,%l4	! %l4 = 000000000000009b
!	Mem[00000000211c0000] = ff63fc65, %l0 = 000000000000534d
	lduha	[%o2+0x000]%asi,%l0	! %l0 = 000000000000ff63
!	Mem[00000000300c1410] = 9b0000ff, %l3 = 00000000000000ff
	ldswa	[%i3+%o5]0x89,%l3	! %l3 = ffffffff9b0000ff
!	Mem[00000000100c1408] = 000000ad, %l7 = 0000000000000000
	lduba	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000211c0000] = ff63fc65, %l6 = 0000000097456997
	ldub	[%o2+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010041410] = 00000000, %f29 = 0000001f
	lda	[%i1+%o5]0x88,%f29	! %f29 = 00000000
!	Mem[0000000010181410] = ffdb534d, %l0 = 000000000000ff63
	lduba	[%i6+%o5]0x88,%l0	! %l0 = 000000000000004d
!	Mem[00000000300c1410] = 9b0000ff, %l7 = 0000000000000000
	ldsba	[%i3+%o5]0x89,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000ff63, Mem[0000000030081408] = d8c656cf
	stwa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000ff63

p0_label_28:
!	Mem[000000001008140c] = 0000006f, %l6 = 00000000000000ff, %asi = 80
	swapa	[%i2+0x00c]%asi,%l6	! %l6 = 000000000000006f
!	Mem[0000000020800000] = 21addad7, %l4 = 000000000000009b
	ldstub	[%o1+%g0],%l4		! %l4 = 00000021000000ff
!	%l3 = ffffffff9b0000ff, Mem[0000000030181400] = 97694597
	stwa	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = 9b0000ff
!	Mem[0000000021800081] = eab38eeb, %l7 = ffffffffffffffff
	ldstub	[%o3+0x081],%l7		! %l7 = 000000b3000000ff
!	Mem[0000000010101438] = e52db38d, %l7 = 00000000000000b3, %asi = 80
	swapa	[%i4+0x038]%asi,%l7	! %l7 = 00000000e52db38d
!	%l5 = 000000000000ff63, Mem[0000000030181410] = 65ad75ba
	stba	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = 65ad7563
!	%l4 = 0000000000000021, Mem[0000000030141410] = bf94b100
	stha	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = bf940021
!	%l0 = 000000000000004d, Mem[0000000030081408] = 0000ff63
	stba	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000ff4d
!	%f0  = c5db534d b92024da 312a1f03 61b581fc
!	%f4  = 2d1b38ff 3dd55192 49fbd613 0b914ad0
!	%f8  = de84b2c9 0000006f 684f1716 473bf102
!	%f12 = 7230fc3b 96cad698 22af37ea 0fb8309e
	stda	%f0,[%i2]ASI_BLK_AIUPL	! Block Store to 0000000010081400
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 9b000000, %f29 = 00000000
	lda	[%i1+%o4]0x81,%f29	! %f29 = 9b000000

p0_label_29:
!	Mem[000000001018140c] = ffffffff, %l7 = 00000000e52db38d
	ldsba	[%i6+0x00d]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000100c1410] = 3101f09144eb1b1a, %f22 = 5f00f0e5 14f48c0e
	ldda	[%i3+%o5]0x80,%f22	! %f22 = 3101f091 44eb1b1a
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010041400] = 4281b561 031f2a31 0094b12b cf56c6d8
!	Mem[0000000010041410] = 00000000 000000ff b581d11c e3248c09
!	Mem[0000000010041420] = 0faed309 8db1fdd1 7646daf5 8bd5e470
!	Mem[0000000010041430] = a9078e32 6ec9d9ff 2164d7e3 8329f2b8
	ldda	[%i1]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010041400
!	Mem[0000000030001400] = ff381b2d, %l4 = 0000000000000021
	lduha	[%i0+%g0]0x89,%l4	! %l4 = 0000000000001b2d
!	Mem[00000000201c0000] = 76ffa250, %l3 = ffffffff9b0000ff
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 00000000000076ff
!	Mem[00000000300c1410] = 9b0000ff, %l1 = 00000000000003ff
	ldsba	[%i3+%o5]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000300c1410] = 9b0000ff, %f25 = 22356f56
	lda	[%i3+%o5]0x89,%f25	! %f25 = 9b0000ff
!	Mem[0000000010001408] = f94249ff06e04661, %l2 = 000000000000004f
	ldxa	[%i0+%o4]0x88,%l2	! %l2 = f94249ff06e04661
!	Mem[0000000030081408] = 0000ff4d, %l6 = 000000000000006f
	ldswa	[%i2+%o4]0x89,%l6	! %l6 = 000000000000ff4d
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000ff63, Mem[0000000010141408] = 566f3522e61daff2
	stxa	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000000000ff63

p0_label_30:
	membar	#Sync			! Added by membar checker (4)
!	%l2 = f94249ff06e04661, Mem[0000000010041408] = 0094b12b
	stba	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 6194b12b
!	Mem[0000000010081410] = 3dd55192, %l3 = 00000000000076ff
	ldstuba	[%i2+%o5]0x88,%l3	! %l3 = 00000092000000ff
!	%l0 = 0000004d, %l1 = ffffffff, Mem[0000000010041410] = 00000000 ff000000
	stda	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000004d ffffffff
!	Mem[0000000030081408] = 4dff0000, %l7 = ffffffffffffffff
	swapa	[%i2+%o4]0x81,%l7	! %l7 = 000000004dff0000
!	%l3 = 0000000000000092, Mem[00000000300c1400] = 43009099
	stba	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 92009099
!	%l4 = 0000000000001b2d, Mem[0000000010101408] = c6c374ae49fbd613
	stxa	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000000000001b2d
!	%l7 = 000000004dff0000, Mem[0000000030001400] = 9251d53dff381b2d
	stxa	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000004dff0000
!	Mem[0000000030101410] = 018b012a, %l1 = ffffffffffffffff
	swapa	[%i4+%o5]0x81,%l1	! %l1 = 00000000018b012a
!	Mem[0000000010001400] = ff000000, %l2 = f94249ff06e04661
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 000000000000004d
	setx	0x9e8f2f17ba2cd74c,%g7,%l0 ! %l0 = 9e8f2f17ba2cd74c
!	%l1 = 00000000018b012a
	setx	0x1d8fb24ffcd05cb2,%g7,%l1 ! %l1 = 1d8fb24ffcd05cb2
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9e8f2f17ba2cd74c
	setx	0x349e930fa37307e4,%g7,%l0 ! %l0 = 349e930fa37307e4
!	%l1 = 1d8fb24ffcd05cb2
	setx	0x79c89b2fd26e6645,%g7,%l1 ! %l1 = 79c89b2fd26e6645

p0_label_31:
!	Mem[0000000030041408] = 0000009b, %l2 = 00000000000000ff
	lduwa	[%i1+%o4]0x89,%l2	! %l2 = 000000000000009b
!	Mem[0000000030101400] = d1692ee8, %l4 = 0000000000001b2d
	lduha	[%i4+%g0]0x89,%l4	! %l4 = 0000000000002ee8
!	Mem[00000000300c1400] = 92009099, %l6 = 000000000000ff4d
	lduwa	[%i3+%g0]0x81,%l6	! %l6 = 0000000092009099
!	Mem[00000000211c0000] = ff63fc65, %l5 = 000000000000ff63
	ldsh	[%o2+%g0],%l5		! %l5 = ffffffffffffff63
!	Mem[00000000218000c0] = 75584245, %l4 = 0000000000002ee8
	ldsh	[%o3+0x0c0],%l4		! %l4 = 0000000000007558
!	Mem[0000000010001408] = 6146e006, %l6 = 0000000092009099
	ldswa	[%i0+%o4]0x80,%l6	! %l6 = 000000006146e006
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000030081400] = c886975a be192160 ffffffff fb508d36
!	Mem[0000000030081410] = ff03f231 d27e23a9 c6adb61b 4b505efc
!	Mem[0000000030081420] = 55b0ad43 53de60ff 3f7eaa97 ace1b665
!	Mem[0000000030081430] = 1ee92253 08ff36c6 0e87ae95 83cca9c7
	ldda	[%i2]ASI_BLK_SL,%f0	! Block Load from 0000000030081400
!	Mem[0000000010101400] = 6f000000, %l6 = 000000006146e006
	ldswa	[%i4+%g0]0x88,%l6	! %l6 = 000000006f000000
!	Mem[0000000030081408] = ffffffff, %l1 = 79c89b2fd26e6645
	lduba	[%i2+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 210094bf, %l3 = 0000000000000092
	ldstuba	[%i5+%o5]0x81,%l3	! %l3 = 00000021000000ff

p0_label_32:
!	%l1 = 00000000000000ff, Mem[0000000010181400] = b6cbdc7b5d570000
	stxa	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000000000ff
!	%l0 = a37307e4, %l1 = 000000ff, Mem[0000000030041400] = ffffc39b 2f103fb0
	stda	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = a37307e4 000000ff
	membar	#Sync			! Added by membar checker (6)
!	%l3 = 0000000000000021, Mem[0000000030081410] = 31f203ff
	stha	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = 31f20021
!	%f7  = 1bb6adc6, Mem[0000000030041408] = 0000009b
	sta	%f7 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 1bb6adc6
!	%l0 = 349e930fa37307e4, Mem[00000000100c1408] = ffffc39bad000000
	stxa	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 349e930fa37307e4
!	Mem[000000001008142b] = 02f13b47, %l7 = 000000004dff0000
	ldstuba	[%i2+0x02b]%asi,%l7	! %l7 = 00000047000000ff
!	%l0 = 349e930fa37307e4, Mem[0000000010141400] = c5db534d
	stwa	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = a37307e4
!	Mem[0000000010101410] = 1d3f70e4, %l0 = 349e930fa37307e4
	swapa	[%i4+%o5]0x88,%l0	! %l0 = 000000001d3f70e4
!	Mem[00000000100c1408] = e40773a3, %l6 = 000000006f000000
	ldstuba	[%i3+%o4]0x80,%l6	! %l6 = 000000e4000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c140c] = 0f939e34, %f23 = 44eb1b1a
	ld	[%i3+0x00c],%f23	! %f23 = 0f939e34

p0_label_33:
!	Mem[00000000100c1410] = 1a1beb4491f00131, %f12 = c636ff08 5322e91e
	ldda	[%i3+%o5]0x88,%f12	! %f12 = 1a1beb44 91f00131
!	Mem[0000000010081410] = ff51d53d, %l7 = 0000000000000047
	ldswa	[%i2+%o5]0x80,%l7	! %l7 = ffffffffff51d53d
!	Mem[0000000030001408] = 5c8792a6, %l3 = 0000000000000021
	ldswa	[%i0+%o4]0x81,%l3	! %l3 = 000000005c8792a6
!	Mem[0000000010101400] = 0000006fbad3e618, %f28 = 00000000 9b000000
	ldd	[%i4+%g0],%f28		! %f28 = 0000006f bad3e618
!	Mem[0000000010141410] = ffdb534d, %f18 = 13d6fb49
	lda	[%i5+%o5]0x88,%f18	! %f18 = ffdb534d
!	Mem[0000000030041400] = 000000ffa37307e4, %l7 = ffffffffff51d53d
	ldxa	[%i1+%g0]0x89,%l7	! %l7 = 000000ffa37307e4
!	Mem[00000000100c1418] = 9da4e622, %l3 = 000000005c8792a6
	lduw	[%i3+0x018],%l3		! %l3 = 000000009da4e622
!	Mem[0000000030181400] = 9b0000ff, %l7 = 000000ffa37307e4
	ldsba	[%i6+%g0]0x81,%l7	! %l7 = ffffffffffffff9b
!	Mem[0000000010041410] = 0000004d, %l4 = 0000000000007558
	ldsha	[%i1+%o5]0x88,%l4	! %l4 = 000000000000004d
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 3bfc30c5, %l7 = ffffffffffffff9b
	ldstuba	[%i0+%o5]0x89,%l7	! %l7 = 000000c5000000ff

p0_label_34:
!	%l2 = 0000009b, %l3 = 9da4e622, Mem[0000000010181400] = ff000000 00000000
	stda	%l2,[%i6+0x000]%asi	! Mem[0000000010181400] = 0000009b 9da4e622
!	%f10 = 65b6e1ac 97aa7e3f, %l5 = ffffffffffffff63
!	Mem[0000000010101408] = 2d1b000000000000
	add	%i4,0x008,%g1
	stda	%f10,[%g1+%l5]ASI_PST32_P ! Mem[0000000010101408] = 65b6e1ac97aa7e3f
!	Mem[0000000030141408] = 3d5e874b, %l5 = ffffffffffffff63
	ldstuba	[%i5+%o4]0x81,%l5	! %l5 = 0000003d000000ff
!	%l6 = 00000000000000e4, Mem[0000000030141410] = ff0094bf3e600470
	stxa	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000000000e4
!	%f7  = 1bb6adc6, Mem[0000000030141410] = 00000000
	sta	%f7 ,[%i5+%o5]0x89	! Mem[0000000030141410] = 1bb6adc6
!	%l0 = 000000001d3f70e4, Mem[0000000030141400] = c5db534d
	stwa	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 1d3f70e4
!	%l4 = 000000000000004d, Mem[0000000010041410] = 0000004d
	stwa	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000004d
!	%l2 = 000000000000009b, Mem[0000000010181410] = ffdb534d
	stwa	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000009b
!	Mem[0000000030001408] = a692875c, %l6 = 00000000000000e4
	swapa	[%i0+%o4]0x89,%l6	! %l6 = 00000000a692875c
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 13afffff, %l4 = 000000000000004d
	lduwa	[%i6+%o4]0x80,%l4	! %l4 = 0000000013afffff

p0_label_35:
!	Mem[00000000211c0000] = ff63fc65, %l5 = 000000000000003d
	ldub	[%o2+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[00000000100c1408] = 349e930fa37307ff, %l6 = 00000000a692875c
	ldxa	[%i3+%o4]0x88,%l6	! %l6 = 349e930fa37307ff
!	Mem[0000000010101400] = 6f000000, %l3 = 000000009da4e622
	lduwa	[%i4+%g0]0x88,%l3	! %l3 = 000000006f000000
!	Mem[0000000020800000] = ffaddad7, %l6 = 349e930fa37307ff
	ldsb	[%o1+%g0],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000010141408] = 0000ff63, %l5 = 00000000000000ff
	lduwa	[%i5+%o4]0x88,%l5	! %l5 = 000000000000ff63
!	Mem[000000001004142c] = 8bd5e470, %l5 = 000000000000ff63
	ldsba	[%i1+0x02d]%asi,%l5	! %l5 = ffffffffffffffd5
!	Mem[0000000010041408] = 2bb19461, %l5 = ffffffffffffffd5
	lduwa	[%i1+%o4]0x88,%l5	! %l5 = 000000002bb19461
!	Mem[0000000010001410] = ffffffff, %l4 = 0000000013afffff
	lduwa	[%i0+%o5]0x88,%l4	! %l4 = 00000000ffffffff
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010181400] = 0000009b 9da4e622 13afffff ffffffff
!	Mem[0000000010181410] = 9b000000 ffffffff 000000c5 8f94031f
!	Mem[0000000010181420] = 5a27f1e3 ebfe2995 6ffa9d79 56cfcd01
!	Mem[0000000010181430] = 75c7575d 95387d15 b8677ec6 0b8cb14f
	ldda	[%i6]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010181400
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 63ffffff, %l7 = 00000000000000c5
	swapa	[%i4+%o4]0x81,%l7	! %l7 = 0000000063ffffff

p0_label_36:
!	%f4  = a9237ed2 31f203ff, %l5 = 000000002bb19461
!	Mem[0000000010081400] = da2420b94d53dbc5
	stda	%f4,[%i2+%l5]ASI_PST8_P ! Mem[0000000010081400] = da237eb94d53dbff
!	Mem[0000000010181400] = 0000009b, %l7 = 0000000063ffffff
	ldstuba	[%i6+%g0]0x80,%l7	! %l7 = 00000000000000ff
	membar	#Sync			! Added by membar checker (8)
!	%l4 = 00000000ffffffff, Mem[0000000010181420] = 5a27f1e3ebfe2995
	stx	%l4,[%i6+0x020]		! Mem[0000000010181420] = 00000000ffffffff
!	Mem[0000000010041408] = 6194b12b, %l4 = 00000000ffffffff
	swapa	[%i1+%o4]0x80,%l4	! %l4 = 000000006194b12b
!	%l4 = 6194b12b, %l5 = 2bb19461, Mem[0000000030141408] = ff5e874b 1bb64ec6
	stda	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = 6194b12b 2bb19461
!	Mem[0000000030041400] = a37307e4, %l1 = 00000000000000ff
	ldstuba	[%i1+%g0]0x89,%l1	! %l1 = 000000e4000000ff
!	%l5 = 000000002bb19461, Mem[0000000010101408] = 65b6e1ac
	sth	%l5,[%i4+%o4]		! Mem[0000000010101408] = 9461e1ac
!	%l1 = 00000000000000e4, Mem[00000000300c1400] = 99900092
	stwa	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000e4
!	%l3 = 000000006f000000, Mem[0000000010181408] = ffffffffffffaf13
	stxa	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000006f000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 6194b12b2bb19461, %l0 = 000000001d3f70e4
	ldxa	[%i5+%o4]0x81,%l0	! %l0 = 6194b12b2bb19461

p0_label_37:
!	Mem[0000000010041410] = 0000004d, %l5 = 000000002bb19461
	lduwa	[%i1+%o5]0x88,%l5	! %l5 = 000000000000004d
!	Mem[0000000030181410] = 6375ad65, %l6 = ffffffffffffffff
	lduwa	[%i6+%o5]0x81,%l6	! %l6 = 000000006375ad65
!	Mem[00000000300c1410] = 9b0000ff, %l5 = 000000000000004d
	lduha	[%i3+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101408] = ace16194, %l0 = 6194b12b2bb19461
	ldswa	[%i4+%o4]0x88,%l0	! %l0 = fffffffface16194
!	Mem[00000000218001c0] = 21a75e86, %l6 = 000000006375ad65
	lduh	[%o3+0x1c0],%l6		! %l6 = 00000000000021a7
!	Mem[0000000010041408] = ffffffff, %l0 = fffffffface16194
	lduba	[%i1+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141410] = ffdb534d, %l1 = 00000000000000e4
	lduha	[%i5+%o5]0x88,%l1	! %l1 = 000000000000534d
!	Mem[000000001004140c] = cf56c6d8, %l1 = 000000000000534d
	lduw	[%i1+0x00c],%l1		! %l1 = 00000000cf56c6d8
!	Mem[0000000010141408] = 63ff000000000000, %f0  = 602119be 5a9786c8
	ldda	[%i5+%o4]0x80,%f0 	! %f0  = 63ff0000 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 4dff0000, %l4 = 000000006194b12b
	ldstuba	[%i0+%g0]0x89,%l4	! %l4 = 00000000000000ff

p0_label_38:
!	%l5 = 00000000000000ff, Mem[0000000010141410] = 4d53dbff
	stba	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = ff53dbff
!	Mem[00000000100c1410] = 3101f091, %l2 = 000000000000009b
	swapa	[%i3+%o5]0x80,%l2	! %l2 = 000000003101f091
!	%l2 = 3101f091, %l3 = 6f000000, Mem[00000000300c1400] = e4000000 865fb465
	stda	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 3101f091 6f000000
!	Mem[0000000010141410] = ff53dbff, %l2 = 000000003101f091, %asi = 80
	swapa	[%i5+0x010]%asi,%l2	! %l2 = 00000000ff53dbff
!	Mem[0000000010001410] = ffffffff, %l4 = 0000000000000000
	ldstuba	[%i0+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010041400] = 4281b561, %l5 = 00000000000000ff
	swapa	[%i1+%g0]0x80,%l5	! %l5 = 000000004281b561
!	Mem[0000000010001400] = ff000000, %l0 = 000000ff, %l2 = ff53dbff
	casa	[%i0]0x80,%l0,%l2	! %l2 = 00000000ff000000
!	Mem[00000000100c1408] = ff0773a3, %l2 = 00000000ff000000
	ldstuba	[%i3+%o4]0x80,%l2	! %l2 = 000000ff000000ff
!	%l5 = 000000004281b561, Mem[0000000010041400] = 000000ff
	stba	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 610000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141434] = d1692ee8, %l1 = 00000000cf56c6d8
	lduha	[%i5+0x034]%asi,%l1	! %l1 = 000000000000d169

p0_label_39:
!	%f12 = 1a1beb44 91f00131, Mem[0000000010181408] = 6f000000 00000000
	stda	%f12,[%i6+%o4]0x88	! Mem[0000000010181408] = 1a1beb44 91f00131
!	Mem[00000000218000c0] = 75584245, %l1 = 000000000000d169
	ldsb	[%o3+0x0c1],%l1		! %l1 = 0000000000000058
!	Mem[0000000030041410] = 000000ff, %l5 = 000000004281b561
	ldsba	[%i1+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010081410] = ff51d53d, %f16 = 22e6a49d
	lda	[%i2+%o5]0x80,%f16	! %f16 = ff51d53d
!	Mem[00000000300c1410] = ff00009b 352c50cb, %l6 = 000021a7, %l7 = 00000000
	ldda	[%i3+%o5]0x81,%l6	! %l6 = 00000000ff00009b 00000000352c50cb
!	Mem[0000000030181410] = 65ad7563, %l3 = 000000006f000000
	ldsha	[%i6+%o5]0x89,%l3	! %l3 = 0000000000007563
!	Mem[0000000010101410] = e40773a3, %l2 = 00000000000000ff
	lduha	[%i4+%o5]0x80,%l2	! %l2 = 000000000000e407
!	Mem[0000000010001408] = 6146e006ff4942f9, %f26 = 01cdcf56 799dfa6f
	ldda	[%i0+%o4]0x80,%f26	! %f26 = 6146e006 ff4942f9
!	Code Fragment 3
p0_fragment_3:
!	%l0 = 00000000000000ff
	setx	0xec4df787c67ebf38,%g7,%l0 ! %l0 = ec4df787c67ebf38
!	%l1 = 0000000000000058
	setx	0x87d39be7ff92454b,%g7,%l1 ! %l1 = 87d39be7ff92454b
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ec4df787c67ebf38
	setx	0x6da59607f41d6a6c,%g7,%l0 ! %l0 = 6da59607f41d6a6c
!	%l1 = 87d39be7ff92454b
	setx	0x3c91aed03aabd7b0,%g7,%l1 ! %l1 = 3c91aed03aabd7b0
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffffff, Mem[0000000020800040] = ff058049, %asi = 80
	stba	%l5,[%o1+0x040]%asi	! Mem[0000000020800040] = ff058049

p0_label_40:
!	%f4  = a9237ed2 31f203ff, Mem[0000000030041400] = a37307ff 000000ff
	stda	%f4 ,[%i1+%g0]0x89	! Mem[0000000030041400] = a9237ed2 31f203ff
!	%f14 = c7a9cc83 95ae870e, %l5 = ffffffffffffffff
!	Mem[00000000100c1400] = 000000ffffffff63
	stda	%f14,[%i3+%l5]ASI_PST16_PL ! Mem[00000000100c1400] = 0e87ae9583cca9c7
!	%l3 = 0000000000007563, Mem[00000000100c1400] = c7a9cc8395ae870e
	stxa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000000000007563
!	%f10 = 65b6e1ac 97aa7e3f, %l2 = 000000000000e407
!	Mem[00000000100c1400] = 6375000000000000
	stda	%f10,[%i3+%l2]ASI_PST16_P ! Mem[00000000100c1400] = 6375e1ac97aa7e3f
!	%f16 = ff51d53d 9b000000 ffffffff ffffaf13
!	%f20 = ffffffff 0000009b 1f03948f c5000000
!	%f24 = 9529feeb e3f1275a 6146e006 ff4942f9
!	%f28 = 157d3895 5d57c775 4fb18c0b c67e67b8
	stda	%f16,[%i4]ASI_BLK_P	! Block Store to 0000000010101400
!	%f6  = fc5e504b, Mem[0000000010001400] = ff000000
	st	%f6 ,[%i0+%g0]		! Mem[0000000010001400] = fc5e504b
!	%l1 = 3c91aed03aabd7b0, Mem[00000000100c1410] = 0000009b44eb1b1a
	stxa	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = 3c91aed03aabd7b0
!	Mem[0000000030181408] = 1f000000, %l2 = 000000000000e407
	ldstuba	[%i6+%o4]0x81,%l2	! %l2 = 0000001f000000ff
!	Mem[00000000100c1400] = ace17563, %l1 = 3c91aed03aabd7b0
	ldstuba	[%i3+%g0]0x88,%l1	! %l1 = 00000063000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = da237eb9, %l4 = 00000000000000ff
	lduw	[%i2+%g0],%l4		! %l4 = 00000000da237eb9

p0_label_41:
!	Mem[0000000020800000] = ffaddad7, %l7 = 00000000352c50cb
	ldsb	[%o1+%g0],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010081420] = 6f000000, %l1 = 0000000000000063
	lduha	[%i2+0x020]%asi,%l1	! %l1 = 0000000000006f00
!	Mem[0000000010001400] = fc5e504b 0fca60c7, %l6 = ff00009b, %l7 = ffffffff
	ldda	[%i0+%g0]0x80,%l6	! %l6 = 00000000fc5e504b 000000000fca60c7
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000030001400] = ff00ff4d 00000000 e4000000 4db038bc
!	Mem[0000000030001410] = ff30fc3b 96cad698 684f1716 473bf102
!	Mem[0000000030001420] = 0d0a591f 48d9091d 9f220e89 7d46646e
!	Mem[0000000030001430] = a4487646 d429029d 2ee436eb cda6351e
	ldda	[%i0]ASI_BLK_S,%f0	! Block Load from 0000000030001400
!	Mem[0000000010181400] = ff00009b 9da4e622 3101f091 44eb1b1a
!	Mem[0000000010181410] = 9b000000 ffffffff 000000c5 8f94031f
!	Mem[0000000010181420] = 00000000 ffffffff 6ffa9d79 56cfcd01
!	Mem[0000000010181430] = 75c7575d 95387d15 b8677ec6 0b8cb14f
	ldda	[%i6]ASI_BLK_P,%f16	! Block Load from 0000000010181400
!	Mem[0000000010001408] = 06e04661, %l7 = 000000000fca60c7
	ldsba	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000061
!	Mem[0000000010001400] = 4b505efc, %l6 = 00000000fc5e504b
	lduha	[%i0+%g0]0x88,%l6	! %l6 = 0000000000005efc
!	Mem[0000000030181408] = ff000000, %l7 = 0000000000000061
	ldsha	[%i6+%o4]0x81,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000010141400] = e40773a33bfc3072, %l2 = 000000000000001f
	ldxa	[%i5+%g0]0x80,%l2	! %l2 = e40773a33bfc3072
!	Starting 10 instruction Store Burst
!	%l2 = e40773a33bfc3072, Mem[0000000010001400] = fc5e504b
	stwa	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 3bfc3072

p0_label_42:
	membar	#Sync			! Added by membar checker (10)
!	%l2 = 3bfc3072, %l3 = 00007563, Mem[0000000010181400] = 9b0000ff 22e6a49d
	stda	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 3bfc3072 00007563
!	Mem[0000000010101428] = 6146e006ff4942f9, %l7 = ffffffffffffff00, %l7 = ffffffffffffff00
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l7,%l7	! %l7 = 6146e006ff4942f9
!	Mem[0000000010081410] = ff51d53d, %l0 = 6da59607f41d6a6c
	ldstuba	[%i2+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030141410] = 1bb6adc6, %l4 = 00000000da237eb9
	swapa	[%i5+%o5]0x89,%l4	! %l4 = 000000001bb6adc6
!	Mem[00000000100c1424] = ca9d3442, %l3 = 0000000000007563, %asi = 80
	swapa	[%i3+0x024]%asi,%l3	! %l3 = 00000000ca9d3442
!	%l3 = 00000000ca9d3442, Mem[0000000030141410] = e4000000da237eb9
	stxa	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000ca9d3442
!	%f20 = 9b000000, Mem[0000000010101400] = ff51d53d
	sta	%f20,[%i4+%g0]0x80	! Mem[0000000010101400] = 9b000000
!	Mem[0000000010041408] = ffffffff, %l4 = 000000001bb6adc6
	swapa	[%i1+%o4]0x80,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000030001410] = ff30fc3b, %l2 = e40773a33bfc3072
	ldstuba	[%i0+%o5]0x81,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff00009b, %l5 = ffffffffffffffff
	ldsha	[%i3+%o5]0x81,%l5	! %l5 = ffffffffffffff00

p0_label_43:
!	Mem[0000000010041400] = 312a1f03ff000061, %f12 = a4487646 d429029d
	ldda	[%i1+%g0]0x88,%f12	! %f12 = 312a1f03 ff000061
!	Mem[0000000010141400] = e40773a3, %f21 = ffffffff
	lda	[%i5+%g0]0x80,%f21	! %f21 = e40773a3
!	Mem[0000000010141400] = e40773a33bfc3072, %l7 = 6146e006ff4942f9
	ldxa	[%i5+%g0]0x80,%l7	! %l7 = e40773a33bfc3072
!	Mem[0000000030141408] = 6194b12b, %f21 = e40773a3
	lda	[%i5+%o4]0x81,%f21	! %f21 = 6194b12b
!	Mem[00000000300c1400] = 3101f091, %l3 = 00000000ca9d3442
	ldsha	[%i3+%g0]0x81,%l3	! %l3 = 0000000000003101
!	Mem[0000000010001438] = e861939d, %l4 = 00000000ffffffff
	ldsw	[%i0+0x038],%l4		! %l4 = ffffffffe861939d
!	Mem[0000000010081408] = fc81b561, %l6 = 0000000000005efc
	ldswa	[%i2+%o4]0x80,%l6	! %l6 = fffffffffc81b561
!	Mem[0000000030181408] = ff000000, %f21 = 6194b12b
	lda	[%i6+%o4]0x81,%f21	! %f21 = ff000000
!	Mem[0000000010181400] = 7230fc3b, %l0 = 00000000000000ff
	ldsha	[%i6+%g0]0x80,%l0	! %l0 = 0000000000007230
!	Starting 10 instruction Store Burst
!	%f8  = 0d0a591f, Mem[0000000010101410] = ffffffff
	sta	%f8 ,[%i4+%o5]0x88	! Mem[0000000010101410] = 0d0a591f

p0_label_44:
!	%l0 = 0000000000007230, Mem[0000000010001408] = 6146e006
	stwa	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 00007230
!	%l5 = ffffffffffffff00, Mem[0000000030141410] = 42349dca
	stba	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = 00349dca
!	%f8  = 0d0a591f 48d9091d, Mem[0000000030141410] = 00349dca 00000000
	stda	%f8 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 0d0a591f 48d9091d
!	%l6 = fffffffffc81b561, Mem[0000000030041408] = 000000001bb6adc6
	stxa	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = fffffffffc81b561
!	%l6 = fffffffffc81b561, Mem[0000000030001408] = e40000004db038bc
	stxa	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = fffffffffc81b561
!	%l6 = fffffffffc81b561, Mem[0000000010001410] = ffffffff
	stha	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffb561
!	%l6 = fffffffffc81b561, Mem[0000000021800140] = 60ca0328, %asi = 80
	stha	%l6,[%o3+0x140]%asi	! Mem[0000000021800140] = b5610328
!	%l1 = 0000000000006f00, Mem[0000000010001400] = 7230fc3b
	stba	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = 7230fc00
!	%l5 = ffffffffffffff00, Mem[0000000030101400] = d1692ee8
	stha	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = d169ff00
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 312a1f03 ff000061, %l4 = e861939d, %l5 = ffffff00
	ldda	[%i1+%g0]0x88,%l4	! %l4 = 00000000ff000061 00000000312a1f03

p0_label_45:
!	Mem[0000000030141400] = ba75ad65e4703f1d, %f30 = b8677ec6 0b8cb14f
	ldda	[%i5+%g0]0x89,%f30	! %f30 = ba75ad65 e4703f1d
!	Mem[00000000100c1410] = 3c91aed03aabd7b0, %l0 = 0000000000007230
	ldxa	[%i3+%o5]0x80,%l0	! %l0 = 3c91aed03aabd7b0
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010181400] = 7230fc3b 63750000 3101f091 44eb1b1a
!	Mem[0000000010181410] = 9b000000 ffffffff 000000c5 8f94031f
!	Mem[0000000010181420] = 00000000 ffffffff 6ffa9d79 56cfcd01
!	Mem[0000000010181430] = 75c7575d 95387d15 b8677ec6 0b8cb14f
	ldda	[%i6]ASI_BLK_PL,%f0	! Block Load from 0000000010181400
!	Mem[0000000030181400] = 9b0000ff, %l3 = 0000000000003101
	lduba	[%i6+%g0]0x81,%l3	! %l3 = 000000000000009b
!	Mem[0000000021800080] = eaff8eeb, %l5 = 00000000312a1f03
	lduh	[%o3+0x080],%l5		! %l5 = 000000000000eaff
!	Mem[00000000201c0000] = 76ffa250, %l4 = 00000000ff000061
	ldsb	[%o0+0x001],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030181400] = ff00009b, %l0 = 3c91aed03aabd7b0
	lduha	[%i6+%g0]0x89,%l0	! %l0 = 000000000000009b
!	Mem[00000000100c1430] = abcd7408 ea83a18b, %l6 = fc81b561, %l7 = 3bfc3072
	ldd	[%i3+0x030],%l6		! %l6 = 00000000abcd7408 00000000ea83a18b
!	Mem[00000000211c0000] = ff63fc65, %l5 = 000000000000eaff
	lduh	[%o2+%g0],%l5		! %l5 = 000000000000ff63
!	Starting 10 instruction Store Burst
!	%f28 = 75c7575d 95387d15, Mem[00000000100c1408] = ff0773a3 0f939e34
	stda	%f28,[%i3+%o4]0x80	! Mem[00000000100c1408] = 75c7575d 95387d15

p0_label_46:
!	%f30 = ba75ad65 e4703f1d, Mem[0000000030081408] = ffffffff fb508d36
	stda	%f30,[%i2+%o4]0x81	! Mem[0000000030081408] = ba75ad65 e4703f1d
!	%l2 = 00000000000000ff, Mem[0000000010001400] = 00fc3072
	stba	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = fffc3072
!	%f30 = ba75ad65, Mem[0000000010101400] = 0000009b
	sta	%f30,[%i4+%g0]0x88	! Mem[0000000010101400] = ba75ad65
!	%l6 = 00000000abcd7408, Mem[0000000010001410] = 61b5ffff
	stba	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 08b5ffff
!	%l2 = 000000ff, %l3 = 0000009b, Mem[0000000030081410] = 2100f231 d27e23a9
	stda	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000ff 0000009b
!	%l6 = 00000000abcd7408, Mem[0000000010081418] = d04a910b13d6fb49
	stx	%l6,[%i2+0x018]		! Mem[0000000010081418] = 00000000abcd7408
!	%l4 = ffffffffffffffff, Mem[0000000010001410] = 08b5ffff
	stwa	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = ffffffff
!	%l5 = 000000000000ff63, Mem[0000000010001408] = 00007230
	stba	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 63007230
	membar	#Sync			! Added by membar checker (12)
!	%f22 = 000000c5 8f94031f, %l0 = 000000000000009b
!	Mem[0000000010181438] = b8677ec60b8cb14f
	add	%i6,0x038,%g1
	stda	%f22,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010181438] = 1f03948f0b8c0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 63ff0000, %l1 = 0000000000006f00
	ldsha	[%i5+0x00a]%asi,%l1	! %l1 = 0000000000000000

p0_label_47:
!	Mem[0000000030081410] = 000000ff0000009b, %f16 = ff00009b 9da4e622
	ldda	[%i2+%o5]0x81,%f16	! %f16 = 000000ff 0000009b
!	Mem[0000000010081410] = ff51d53d ff381b2d, %l2 = 000000ff, %l3 = 0000009b
	ldda	[%i2+0x010]%asi,%l2	! %l2 = 00000000ff51d53d 00000000ff381b2d
!	Mem[0000000010141410] = 91f00131, %l3 = 00000000ff381b2d
	ldsba	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000031
!	Mem[0000000010081408] = 61b581fc, %l0 = 000000000000009b
	ldswa	[%i2+%o4]0x88,%l0	! %l0 = 0000000061b581fc
!	Mem[0000000010101428] = 6146e006ff4942f9, %l7 = 00000000ea83a18b
	ldx	[%i4+0x028],%l7		! %l7 = 6146e006ff4942f9
!	Mem[0000000010181438] = 1f03948f, %l6 = 00000000abcd7408
	ldub	[%i6+0x038],%l6		! %l6 = 000000000000001f
!	Mem[0000000010081414] = ff381b2d, %l6 = 000000000000001f
	lduba	[%i2+0x017]%asi,%l6	! %l6 = 000000000000002d
!	Mem[0000000010141410] = 91f00131, %l6 = 000000000000002d
	ldsba	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000031
!	Mem[0000000010001400] = fffc3072, %l2 = 00000000ff51d53d
	ldsba	[%i0+0x002]%asi,%l2	! %l2 = 0000000000000030
!	Starting 10 instruction Store Burst
!	%l2 = 00000030, %l3 = 00000031, Mem[0000000010041400] = 610000ff 031f2a31
	stda	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000030 00000031

p0_label_48:
!	%l4 = ffffffff, %l5 = 0000ff63, Mem[0000000010041410] = 0000004d ffffffff
	stda	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffff 0000ff63
!	%l6 = 0000000000000031, Mem[0000000010081410] = ff51d53d
	stha	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 0031d53d
!	%f12 = 157d3895 5d57c775, Mem[0000000010181408] = 3101f091 44eb1b1a
	stda	%f12,[%i6+%o4]0x80	! Mem[0000000010181408] = 157d3895 5d57c775
!	Mem[0000000030101400] = 00ff69d1, %l2 = 0000000000000030
	swapa	[%i4+%g0]0x81,%l2	! %l2 = 0000000000ff69d1
!	%l1 = 0000000000000000, Mem[0000000010181410] = ffffffff0000009b
	stxa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000000000000000
!	%l7 = 6146e006ff4942f9, Mem[0000000030101400] = 30000000
	stba	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = 300000f9
!	Mem[0000000010081410] = 3dd53100, %l4 = ffffffffffffffff
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1408] = 75c7575d, %l7 = 6146e006ff4942f9, %asi = 80
	swapa	[%i3+0x008]%asi,%l7	! %l7 = 0000000075c7575d
!	%f14 = 4fb18c0b c67e67b8, Mem[0000000010141410] = 3101f091 97694597
	stda	%f14,[%i5+%o5]0x80	! Mem[0000000010141410] = 4fb18c0b c67e67b8
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = e4703f1d, %l3 = 0000000000000031
	ldsba	[%i5+%g0]0x89,%l3	! %l3 = 000000000000001d

p0_label_49:
!	Mem[0000000030001408] = 61b581fcffffffff, %f18 = 3101f091 44eb1b1a
	ldda	[%i0+%o4]0x89,%f18	! %f18 = 61b581fc ffffffff
!	Mem[0000000030141400] = e4703f1d, %l7 = 0000000075c7575d
	ldsha	[%i5+%g0]0x89,%l7	! %l7 = 0000000000003f1d
!	Mem[0000000010041400] = 00000030, %f21 = ff000000
	lda	[%i1+%g0]0x80,%f21	! %f21 = 00000030
!	Mem[0000000030101410] = ffffffff, %l6 = 0000000000000031
	ldsba	[%i4+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010141400] = e40773a3, %l2 = 0000000000ff69d1
	ldsba	[%i5+%g0]0x80,%l2	! %l2 = ffffffffffffffe4
!	Mem[0000000010081438] = 9e30b80f, %l7 = 0000000000003f1d
	ldsw	[%i2+0x038],%l7		! %l7 = ffffffff9e30b80f
!	Mem[000000001014140c] = 00000000, %l6 = ffffffffffffffff
	ldsh	[%i5+0x00e],%l6		! %l6 = 0000000000000000
!	Mem[00000000100c1400] = 3f7eaa97ace175ff, %l5 = 000000000000ff63
	ldxa	[%i3+%g0]0x88,%l5	! %l5 = 3f7eaa97ace175ff
!	Mem[0000000030101408] = c5000000, %l2 = ffffffffffffffe4
	lduba	[%i4+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000030041408] = fc81b561
	stha	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = fc810000

p0_label_50:
!	%f24 = 00000000 ffffffff, Mem[0000000030041400] = 31f203ff a9237ed2
	stda	%f24,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000 ffffffff
!	Mem[0000000020800001] = ffaddad7, %l7 = ffffffff9e30b80f
	ldstuba	[%o1+0x001]%asi,%l7	! %l7 = 000000ad000000ff
!	%l5 = 3f7eaa97ace175ff, Mem[00000000300c1408] = 8f9403ff
	stwa	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = ace175ff
!	%l4 = 0000000000000000, Mem[0000000030181408] = 000000ff
	stba	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	Mem[0000000010141400] = e40773a3, %l6 = 0000000000000000
	ldstuba	[%i5+%g0]0x80,%l6	! %l6 = 000000e4000000ff
!	Mem[0000000010001400] = fffc3072, %l2 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l2	! %l2 = 00000000fffc3072
!	%f0  = 00007563 3bfc3072, Mem[0000000010181400] = 7230fc3b 63750000
	stda	%f0 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 00007563 3bfc3072
!	Mem[0000000010101400] = 65ad75ba, %l0 = 0000000061b581fc
	swapa	[%i4+%g0]0x80,%l0	! %l0 = 0000000065ad75ba
!	Mem[00000000100c1408] = f94249ff, %l0 = 0000000065ad75ba
	ldstuba	[%i3+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ffffffff000000ff, %l6 = 00000000000000e4
	ldxa	[%i1+%o5]0x89,%l6	! %l6 = ffffffff000000ff

p0_label_51:
!	Mem[0000000030001408] = ffffffff fc81b561, %l6 = 000000ff, %l7 = 000000ad
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 00000000ffffffff 00000000fc81b561
!	Code Fragment 3
p0_fragment_4:
!	%l0 = 00000000000000ff
	setx	0x14663eef938d254d,%g7,%l0 ! %l0 = 14663eef938d254d
!	%l1 = 0000000000000000
	setx	0x546d8207ab1500af,%g7,%l1 ! %l1 = 546d8207ab1500af
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 14663eef938d254d
	setx	0xda2143d830c14f98,%g7,%l0 ! %l0 = da2143d830c14f98
!	%l1 = 546d8207ab1500af
	setx	0x401843e7fea12b02,%g7,%l1 ! %l1 = 401843e7fea12b02
!	Mem[00000000100c1408] = 157d3895 f94249ff, %l2 = fffc3072, %l3 = 0000001d
	ldda	[%i3+%o4]0x88,%l2	! %l2 = 00000000f94249ff 00000000157d3895
!	Mem[0000000010141400] = a37307ff, %l5 = 3f7eaa97ace175ff
	lduha	[%i5+%g0]0x88,%l5	! %l5 = 00000000000007ff
!	Mem[0000000010141400] = a37307ff, %f6  = 1f03948f
	lda	[%i5+%g0]0x88,%f6 	! %f6 = a37307ff
!	Mem[000000001004143c] = 8329f2b8, %l0 = da2143d830c14f98
	ldsba	[%i1+0x03f]%asi,%l0	! %l0 = ffffffffffffffb8
!	Mem[00000000100c1400] = ace175ff, %l2 = 00000000f94249ff
	ldswa	[%i3+%g0]0x88,%l2	! %l2 = fffffffface175ff
!	Mem[0000000010041410] = ffffffff, %f17 = 0000009b
	lda	[%i1+%o5]0x80,%f17	! %f17 = ffffffff
!	Mem[0000000010181428] = 6ffa9d79, %l4 = 0000000000000000
	lduh	[%i6+0x02a],%l4		! %l4 = 0000000000009d79
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffffffb8, Mem[0000000030141400] = e4703f1d
	stha	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = e470ffb8

p0_label_52:
!	%f30 = ba75ad65 e4703f1d, %l2 = fffffffface175ff
!	Mem[0000000030001428] = 9f220e897d46646e
	add	%i0,0x028,%g1
	stda	%f30,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030001428] = 1d3f70e465ad75ba
!	%l6 = 00000000ffffffff, Mem[0000000030101408] = 000000c5
	stba	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = ff0000c5
!	Mem[0000000030181400] = 9b0000ff, %l4 = 0000000000009d79
	ldstuba	[%i6+%g0]0x81,%l4	! %l4 = 0000009b000000ff
!	Mem[0000000010181408] = 95387d15, %l5 = 00000000000007ff
	swapa	[%i6+%o4]0x88,%l5	! %l5 = 0000000095387d15
!	%l6 = 00000000ffffffff, Mem[0000000010081400] = b97e23da
	stba	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = b97e23ff
!	%l0 = ffffffffffffffb8, Mem[0000000021800000] = 3cfcd0bd
	stb	%l0,[%o3+%g0]		! Mem[0000000021800000] = b8fcd0bd
!	%l4 = 0000009b, %l5 = 95387d15, Mem[0000000030101400] = f9000030 5b94469a
	stda	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000009b 95387d15
!	Mem[0000000010101421] = 9529feeb, %l6 = 00000000ffffffff
	ldstub	[%i4+0x021],%l6		! %l6 = 00000029000000ff
!	%l4 = 000000000000009b, Mem[0000000030101408] = ff0000c5
	stha	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 009b00c5
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 000081fc, %l0 = ffffffffffffffb8
	lduwa	[%i1+%o4]0x81,%l0	! %l0 = 00000000000081fc

p0_label_53:
!	Mem[0000000010101400] = 0000009bfc81b561, %f28 = 75c7575d 95387d15
	ldda	[%i4+%g0]0x88,%f28	! %f28 = 0000009b fc81b561
!	Mem[00000000300c1408] = 35ea586face175ff, %f8  = ffffffff 00000000
	ldda	[%i3+%o4]0x89,%f8 	! %f8  = 35ea586f ace175ff
!	Mem[0000000010141400] = ff0773a3, %l4 = 000000000000009b
	ldswa	[%i5+%g0]0x80,%l4	! %l4 = ffffffffff0773a3
!	Mem[0000000010081400] = ff237eb9, %l5 = 0000000095387d15
	ldsba	[%i2+%g0]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030081408] = ba75ad65, %l0 = 00000000000081fc
	lduwa	[%i2+%o4]0x81,%l0	! %l0 = 00000000ba75ad65
!	Mem[0000000010101420] = 95fffeeb, %l4 = ffffffffff0773a3
	ldsha	[%i4+0x022]%asi,%l4	! %l4 = fffffffffffffeeb
!	Mem[0000000030041408] = 000081fc ffffffff, %l0 = ba75ad65, %l1 = fea12b02
	ldda	[%i1+%o4]0x81,%l0	! %l0 = 00000000000081fc 00000000ffffffff
!	Mem[0000000010141400] = 7230fc3b a37307ff, %l2 = ace175ff, %l3 = 157d3895
	ldda	[%i5+%g0]0x88,%l2	! %l2 = 00000000a37307ff 000000007230fc3b
!	%l2 = 00000000a37307ff, Mem[0000000020800040] = ff058049
	sth	%l2,[%o1+0x040]		! Mem[0000000020800040] = 07ff8049
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffffff, Mem[0000000030041408] = 000081fc
	stwa	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffff

p0_label_54:
!	Mem[0000000010101408] = ffffffff, %l0 = 00000000000081fc
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 00000000ffffffff
!	%f12 = 157d3895 5d57c775, Mem[0000000010181408] = ff070000 5d57c775
	stda	%f12,[%i6+%o4]0x80	! Mem[0000000010181408] = 157d3895 5d57c775
!	%f9  = ace175ff, Mem[0000000030041410] = 000000ff
	sta	%f9 ,[%i1+%o5]0x89	! Mem[0000000030041410] = ace175ff
!	%f30 = ba75ad65, Mem[0000000010181400] = 63750000
	sta	%f30,[%i6+%g0]0x88	! Mem[0000000010181400] = ba75ad65
!	Mem[0000000010001400] = 00000000, %l7 = 00000000fc81b561
	ldstuba	[%i0+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Randomly selected nop
	nop
!	%f24 = 00000000 ffffffff, Mem[0000000030181408] = 00000000 00000000
	stda	%f24,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000 ffffffff
!	%l0 = ffffffff, %l1 = ffffffff, Mem[0000000010101400] = 61b581fc 9b000000
	stda	%l0,[%i4+0x000]%asi	! Mem[0000000010101400] = ffffffff ffffffff
!	Mem[0000000030101400] = 0000009b, %l6 = 0000000000000029
	swapa	[%i4+%g0]0x81,%l6	! %l6 = 000000000000009b
!	Starting 10 instruction Load Burst
!	Mem[000000001008143c] = ea37af22, %l0 = 00000000ffffffff
	lduba	[%i2+0x03e]%asi,%l0	! %l0 = 00000000000000af

p0_label_55:
!	Mem[0000000010141410] = b8677ec60b8cb14f, %l0 = 00000000000000af
	ldxa	[%i5+%o5]0x88,%l0	! %l0 = b8677ec60b8cb14f
!	Mem[0000000010101408] = fc810000, %f19 = ffffffff
	lda	[%i4+%o4]0x88,%f19	! %f19 = fc810000
!	Mem[0000000010001400] = c760ca0f 000000ff, %l2 = a37307ff, %l3 = 7230fc3b
	ldda	[%i0+%g0]0x88,%l2	! %l2 = 00000000000000ff 00000000c760ca0f
!	Mem[00000000100c1410] = 3c91aed0 3aabd7b0, %l2 = 000000ff, %l3 = c760ca0f
	ldda	[%i3+%o5]0x80,%l2	! %l2 = 000000003c91aed0 000000003aabd7b0
!	Mem[00000000300c1410] = 9b0000ff, %l0 = b8677ec60b8cb14f
	lduwa	[%i3+%o5]0x89,%l0	! %l0 = 000000009b0000ff
!	Mem[0000000010101404] = ffffffff, %l1 = 00000000ffffffff
	lduw	[%i4+0x004],%l1		! %l1 = 00000000ffffffff
!	Mem[0000000010101418] = 1f03948f, %l7 = 0000000000000000
	ldsh	[%i4+0x018],%l7		! %l7 = 0000000000001f03
!	Mem[0000000010101400] = ffffffff, %l2 = 000000003c91aed0
	ldswa	[%i4+0x000]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000300c1410] = 9b0000ff, %l6 = 000000000000009b
	ldsba	[%i3+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffffff, Mem[0000000010141400] = 7230fc3ba37307ff
	stxa	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffffffffffffff

p0_label_56:
!	Mem[00000000300c1410] = 9b0000ff, %l3 = 000000003aabd7b0
	swapa	[%i3+%o5]0x89,%l3	! %l3 = 000000009b0000ff
!	%f28 = 0000009b, Mem[00000000100c1404] = 97aa7e3f
	st	%f28,[%i3+0x004]	! Mem[00000000100c1404] = 0000009b
!	Mem[0000000030001408] = ffffffff, %l7 = 0000000000001f03
	ldstuba	[%i0+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030141400] = e470ffb8, %l6 = ffffffffffffffff
	ldstuba	[%i5+%g0]0x89,%l6	! %l6 = 000000b8000000ff
!	%f23 = 8f94031f, Mem[0000000010141400] = ffffffff
	sta	%f23,[%i5+%g0]0x80	! Mem[0000000010141400] = 8f94031f
!	%f29 = fc81b561, Mem[0000000030081400] = 5a9786c8
	sta	%f29,[%i2+%g0]0x89	! Mem[0000000030081400] = fc81b561
!	%l6 = 000000b8, %l7 = 000000ff, Mem[00000000300c1410] = b0d7ab3a 352c50cb
	stda	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000b8 000000ff
!	%f8  = 35ea586f, Mem[00000000300c1400] = 91f00131
	sta	%f8 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 35ea586f
!	Mem[0000000030141408] = 6194b12b, %l5 = ffffffffffffffff
	swapa	[%i5+%o4]0x81,%l5	! %l5 = 000000006194b12b
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 61b581fc, %l1 = 00000000ffffffff
	ldstuba	[%i2+%g0]0x81,%l1	! %l1 = 00000061000000ff

p0_label_57:
!	Mem[00000000201c0000] = 76ffa250, %l0 = 000000009b0000ff
	lduh	[%o0+%g0],%l0		! %l0 = 00000000000076ff
	membar	#Sync			! Added by membar checker (13)
!	Mem[00000000300c1400] = 6f58ea35 6f000000 ff75e1ac 6f58ea35
!	Mem[00000000300c1410] = 000000b8 000000ff 3063d4e6 26f99a8e
!	Mem[00000000300c1420] = 950a657c eed34507 cb340057 52e00c82
!	Mem[00000000300c1430] = c4f9d04f 7154ca5e 26ea6cc0 133e7541
	ldda	[%i3]ASI_BLK_AIUSL,%f0	! Block Load from 00000000300c1400
!	Mem[0000000030181410] = f0e89c4465ad7563, %l7 = 00000000000000ff
	ldxa	[%i6+%o5]0x89,%l7	! %l7 = f0e89c4465ad7563
!	Mem[0000000020800040] = 07ff8049, %l6 = 00000000000000b8
	ldsba	[%o1+0x040]%asi,%l6	! %l6 = 0000000000000007
!	Mem[0000000010141410] = 4fb18c0b, %l5 = 000000006194b12b
	ldswa	[%i5+%o5]0x80,%l5	! %l5 = 000000004fb18c0b
!	Mem[00000000100c1420] = 00000079, %l6 = 0000000000000007
	lduwa	[%i3+0x020]%asi,%l6	! %l6 = 0000000000000079
!	Mem[0000000030101408] = c5009b00, %l6 = 0000000000000079
	lduha	[%i4+%o4]0x89,%l6	! %l6 = 0000000000009b00
!	Mem[0000000030081400] = ffb581fc, %l6 = 0000000000009b00
	ldsba	[%i2+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030001408] = ffffffff, %l6 = ffffffffffffffff
	ldsha	[%i0+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f16 = 000000ff, Mem[00000000100c1400] = ace175ff
	sta	%f16,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff

p0_label_58:
!	%f19 = fc810000, Mem[0000000010001408] = 30720063
	sta	%f19,[%i0+%o4]0x88	! Mem[0000000010001408] = fc810000
!	%f22 = 000000c5 8f94031f, Mem[0000000010101400] = ffffffff ffffffff
	stda	%f22,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000c5 8f94031f
!	%f20 = 9b000000 00000030, Mem[0000000030101410] = ffffffff 752be6c7
	stda	%f20,[%i4+%o5]0x81	! Mem[0000000030101410] = 9b000000 00000030
!	%l4 = fffffffffffffeeb, Mem[00000000201c0000] = 76ffa250
	stb	%l4,[%o0+%g0]		! Mem[00000000201c0000] = ebffa250
!	%l1 = 0000000000000061, Mem[0000000030141410] = 0d0a591f
	stba	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = 610a591f
!	Mem[00000000100c1408] = ff4942f9, %l0 = 00000000000076ff, %asi = 80
	swapa	[%i3+0x008]%asi,%l0	! %l0 = 00000000ff4942f9
!	Mem[0000000030001408] = ffffffff, %l0 = 00000000ff4942f9
	ldstuba	[%i0+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010041410] = ffffffff, %l3 = 000000009b0000ff
	swapa	[%i1+%o5]0x88,%l3	! %l3 = 00000000ffffffff
!	%l2 = ffffffffffffffff, Mem[0000000010101430] = 157d38955d57c775
	stx	%l2,[%i4+0x030]		! Mem[0000000010101430] = ffffffffffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 1f590a0d, %f26 = 6ffa9d79
	lda	[%i4+%o5]0x80,%f26	! %f26 = 1f590a0d

p0_label_59:
!	Mem[0000000010001424] = 4736c39b, %l7 = f0e89c4465ad7563
	ldswa	[%i0+0x024]%asi,%l7	! %l7 = 000000004736c39b
!	Mem[0000000030001400] = ff00ff4d, %l4 = fffffffffffffeeb
	ldsha	[%i0+%g0]0x81,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000030181410] = 6375ad65, %l4 = ffffffffffffff00
	ldsba	[%i6+%o5]0x81,%l4	! %l4 = 0000000000000063
!	%l5 = 000000004fb18c0b, Mem[0000000010041400] = 0000003000000031
	stxa	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000004fb18c0b
!	Mem[0000000030181410] = 6375ad65449ce8f0, %f22 = 000000c5 8f94031f
	ldda	[%i6+%o5]0x81,%f22	! %f22 = 6375ad65 449ce8f0
!	Mem[0000000010101400] = 1f03948fc5000000, %l3 = 00000000ffffffff
	ldxa	[%i4+%g0]0x80,%l3	! %l3 = 1f03948fc5000000
!	Mem[0000000030001400] = 4dff00ff, %f28 = 0000009b
	lda	[%i0+%g0]0x89,%f28	! %f28 = 4dff00ff
!	Mem[0000000030041410] = ff75e1ac, %l6 = ffffffffffffffff
	lduha	[%i1+%o5]0x81,%l6	! %l6 = 000000000000ff75
!	Mem[0000000010081400] = ff237eb9, %l2 = ffffffffffffffff
	ldsha	[%i2+0x000]%asi,%l2	! %l2 = ffffffffffffff23
!	Starting 10 instruction Store Burst
!	Mem[0000000020800040] = 07ff8049, %l2 = ffffffffffffff23
	ldstub	[%o1+0x040],%l2		! %l2 = 00000007000000ff

p0_label_60:
!	%f18 = 61b581fc fc810000, Mem[00000000100c1428] = e7c06ab9 744ab3d1
	std	%f18,[%i3+0x028]	! Mem[00000000100c1428] = 61b581fc fc810000
!	%l4 = 0000000000000063, Mem[0000000010041400] = 0b8cb14f00000000
	stxa	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000000000000063
!	%l5 = 000000004fb18c0b, Mem[0000000010041400] = 63000000
	stha	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 8c0b0000
!	Mem[0000000010141400] = 8f94031f, %l6 = 000000000000ff75
	ldstuba	[%i5+%g0]0x80,%l6	! %l6 = 0000008f000000ff
!	Mem[0000000010081406] = 4d53dbff, %l4 = 0000000000000063
	ldstuba	[%i2+0x006]%asi,%l4	! %l4 = 000000db000000ff
!	%f0  = 0000006f 35ea586f, %l7 = 000000004736c39b
!	Mem[0000000030081430] = 1ee9225308ff36c6
	add	%i2,0x030,%g1
	stda	%f0,[%g1+%l7]ASI_PST32_SL ! Mem[0000000030081430] = 6f58ea356f000000
!	%l0 = 00000000000000ff, Mem[0000000010101410] = 0d0a591f
	stba	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 0d0a59ff
!	Mem[0000000010041410] = ff00009b, %l0 = 00000000000000ff
	swapa	[%i1+%o5]0x80,%l0	! %l0 = 00000000ff00009b
!	Mem[0000000010141410] = 0b8cb14f, %l5 = 000000004fb18c0b
	swapa	[%i5+%o5]0x88,%l5	! %l5 = 000000000b8cb14f
!	Starting 10 instruction Load Burst
!	Mem[0000000010081420] = 6f000000 c9b284de, %l6 = 0000008f, %l7 = 4736c39b
	ldda	[%i2+0x020]%asi,%l6	! %l6 = 000000006f000000 00000000c9b284de

p0_label_61:
!	Mem[000000001008140c] = 031f2a31, %l1 = 0000000000000061
	ldub	[%i2+0x00c],%l1		! %l1 = 0000000000000003
!	Mem[0000000030041400] = ffffffff 00000000 ffffffff ffffffff
!	Mem[0000000030041410] = ff75e1ac ffffffff 4079e437 60735afa
!	Mem[0000000030041420] = 7c359ca5 6fb439b2 d81697ab 2c43c3d6
!	Mem[0000000030041430] = 88007350 134d3f5b fc1705b3 50359917
	ldda	[%i1]ASI_BLK_AIUS,%f16	! Block Load from 0000000030041400
!	Mem[0000000030101410] = 300000000000009b, %f8  = 0745d3ee 7c650a95
	ldda	[%i4+%o5]0x89,%f8 	! %f8  = 30000000 0000009b
!	Mem[0000000030181408] = 00000000, %l2 = 0000000000000007
	ldsha	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041410] = ace175ff, %l2 = 0000000000000000
	lduba	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041400] = 00000b8c, %l4 = 00000000000000db
	lduwa	[%i1+%g0]0x88,%l4	! %l4 = 0000000000000b8c
!	Mem[0000000030041410] = ace175ff, %l5 = 000000000b8cb14f
	ldswa	[%i1+%o5]0x89,%l5	! %l5 = fffffffface175ff
!	Mem[0000000010001408] = 000081fc, %l2 = 00000000000000ff
	ldswa	[%i0+%o4]0x80,%l2	! %l2 = 00000000000081fc
!	Mem[0000000010181400] = 65ad75ba3bfc3072, %f8  = 30000000 0000009b
	ldda	[%i6+%g0]0x80,%f8 	! %f8  = 65ad75ba 3bfc3072
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000003, Mem[0000000030101410] = 9b000000
	stwa	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000003

p0_label_62:
!	Mem[0000000010001438] = e861939d, %l6 = 000000006f000000, %asi = 80
	swapa	[%i0+0x038]%asi,%l6	! %l6 = 00000000e861939d
!	%f8  = 65ad75ba 3bfc3072, Mem[0000000030181400] = ff0000ff 63800000
	stda	%f8 ,[%i6+%g0]0x89	! Mem[0000000030181400] = 65ad75ba 3bfc3072
!	%l3 = 1f03948fc5000000, Mem[0000000010101408] = fc810000
	stba	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = fc810000
!	Mem[00000000201c0000] = ebffa250, %l4 = 0000000000000b8c
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 000000eb000000ff
!	%l5 = fffffffface175ff, Mem[0000000010041400] = 00000b8c
	stwa	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = ace175ff
!	%l7 = 00000000c9b284de, Mem[0000000010001400] = 000000ff
	stha	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 000084de
!	%f4  = ff000000, Mem[0000000030181408] = 00000000
	sta	%f4 ,[%i6+%o4]0x89	! Mem[0000000030181408] = ff000000
!	%f14 = 41753e13, Mem[0000000010081414] = ff381b2d
	sta	%f14,[%i2+0x014]%asi	! Mem[0000000010081414] = 41753e13
!	Mem[0000000010081400] = ff237eb9, %l2 = 00000000000081fc
	ldstuba	[%i2+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041424] = 8db1fdd1, %l2 = 00000000000000ff
	ldsw	[%i1+0x024],%l2		! %l2 = ffffffff8db1fdd1

p0_label_63:
!	Mem[00000000300c1408] = ace175ff, %l5 = fffffffface175ff
	ldsba	[%i3+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030101400] = 29000000, %l6 = 00000000e861939d
	lduba	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000020800000] = ffffdad7, %l7 = 00000000c9b284de
	lduh	[%o1+%g0],%l7		! %l7 = 000000000000ffff
!	Mem[0000000030101410] = 0000000300000030, %l1 = 0000000000000003
	ldxa	[%i4+%o5]0x81,%l1	! %l1 = 0000000300000030
!	Mem[0000000030041400] = ffffffff, %l5 = ffffffffffffffff
	lduba	[%i1+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141400] = 1f0394ff, %f5  = b8000000
	lda	[%i5+%g0]0x88,%f5 	! %f5 = 1f0394ff
!	Mem[0000000010041410] = 000000ff, %l3 = 1f03948fc5000000
	ldsba	[%i1+0x012]%asi,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1408] = ff75e1ac 6f58ea35, %l4 = 000000eb, %l5 = 000000ff
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 00000000ff75e1ac 000000006f58ea35
!	Mem[0000000030101400] = 29000000, %l0 = 00000000ff00009b
	ldsha	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (14)
!	%l6 = 00000000, %l7 = 0000ffff, Mem[0000000030041410] = ff75e1ac ffffffff
	stda	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 0000ffff

p0_label_64:
!	%f16 = ffffffff 00000000 ffffffff ffffffff
!	%f20 = ff75e1ac ffffffff 4079e437 60735afa
!	%f24 = 7c359ca5 6fb439b2 d81697ab 2c43c3d6
!	%f28 = 88007350 134d3f5b fc1705b3 50359917
	stda	%f16,[%i1]ASI_BLK_AIUSL	! Block Store to 0000000030041400
!	Mem[0000000030101408] = c5009b00, %l5 = 000000006f58ea35
	ldstuba	[%i4+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081410] = ff31d53d, %l2 = ffffffff8db1fdd1
	swapa	[%i2+%o5]0x80,%l2	! %l2 = 00000000ff31d53d
!	%l4 = 00000000ff75e1ac, Mem[0000000010181408] = 157d38955d57c775
	stxa	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000ff75e1ac
!	%l1 = 0000000300000030, Mem[0000000010141403] = ff94031f, %asi = 80
	stba	%l1,[%i5+0x003]%asi	! Mem[0000000010141400] = ff940330
!	Mem[0000000010141400] = 300394ff, %l1 = 0000000300000030
	ldstuba	[%i5+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	%l7 = 000000000000ffff, Mem[0000000030081400] = ffb581fc
	stha	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = ffff81fc
!	%f6  = 8e9af926 e6d46330, Mem[0000000010001400] = 000084de c760ca0f
	stda	%f6 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 8e9af926 e6d46330
!	%l2 = ff31d53d, %l3 = 00000000, Mem[0000000030181410] = 6375ad65 449ce8f0
	stda	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = ff31d53d 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181428] = 6ffa9d79, %f10 = 820ce052
	ld	[%i6+0x028],%f10	! %f10 = 6ffa9d79

p0_label_65:
!	Mem[0000000030101400] = 29000000, %l6 = 0000000000000000
	ldsba	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000010041410] = ff000000, %l1 = 00000000000000ff
	ldswa	[%i1+%o5]0x88,%l1	! %l1 = ffffffffff000000
!	Mem[0000000030101408] = c5009bff, %l0 = 0000000000000000
	lduwa	[%i4+%o4]0x89,%l0	! %l0 = 00000000c5009bff
!	Mem[00000000201c0000] = ffffa250, %l4 = 00000000ff75e1ac
	lduh	[%o0+%g0],%l4		! %l4 = 000000000000ffff
!	Mem[0000000010081400] = ff237eb94d53ffff, %f10 = 6ffa9d79 570034cb
	ldda	[%i2+%g0]0x80,%f10	! %f10 = ff237eb9 4d53ffff
!	Mem[0000000030041410] = ffffffff, %l5 = 0000000000000000
	ldsba	[%i1+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010001400] = 3063d4e626f99a8e, %l6 = 0000000000000000
	ldxa	[%i0+%g0]0x80,%l6	! %l6 = 3063d4e626f99a8e
!	Mem[00000000300c1410] = 000000b8, %l3 = 0000000000000000
	lduba	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141400] = ff940330, %l3 = 0000000000000000
	ldswa	[%i5+%g0]0x80,%l3	! %l3 = ffffffffff940330
!	Starting 10 instruction Store Burst
!	%f5  = 1f0394ff, Mem[0000000010041400] = ff75e1ac
	sta	%f5 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 1f0394ff

p0_label_66:
!	Mem[00000000201c0000] = ffffa250, %l1 = ffffffffff000000
	ldstuba	[%o0+0x000]%asi,%l1	! %l1 = 000000ff000000ff
!	%l7 = 000000000000ffff, Mem[0000000020800000] = ffffdad7, %asi = 80
	stha	%l7,[%o1+0x000]%asi	! Mem[0000000020800000] = ffffdad7
!	Mem[0000000030101400] = 00000029, %l1 = 00000000000000ff
	ldswa	[%i4+%g0]0x81,%l1	! %l1 = 0000000000000029
!	Mem[0000000030001408] = ffffffff, %l1 = 0000000000000029
	ldstuba	[%i0+%o4]0x81,%l1	! %l1 = 000000ff000000ff
!	%l1 = 00000000000000ff, Mem[00000000300c1410] = 000000b8
	stba	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff0000b8
!	Mem[0000000010001430] = 657ff5f5300cfbe4, %l3 = ffffffffff940330, %l5 = ffffffffffffffff
	add	%i0,0x30,%g1
	casxa	[%g1]0x80,%l3,%l5	! %l5 = 657ff5f5300cfbe4
!	%l1 = 00000000000000ff, Mem[0000000010141408] = 0000ff63
	stha	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff
!	%f6  = 8e9af926 e6d46330, Mem[0000000010141408] = ff000000 00000000
	std	%f6 ,[%i5+%o4]	! Mem[0000000010141408] = 8e9af926 e6d46330
!	Mem[0000000010181408] = 00000000, %l6 = 3063d4e626f99a8e
	swapa	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ff000000, %l2 = 00000000ff31d53d
	lduba	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000000

p0_label_67:
!	Mem[00000000300c1410] = ff0000b8 000000ff, %l0 = c5009bff, %l1 = 000000ff
	ldda	[%i3+%o5]0x81,%l0	! %l0 = 00000000ff0000b8 00000000000000ff
!	Mem[0000000030141408] = ffffffff, %l2 = 0000000000000000
	ldswa	[%i5+%o4]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010081408] = 312a1f03 61b581fc, %l6 = 00000000, %l7 = 0000ffff
	ldda	[%i2+%o4]0x88,%l6	! %l6 = 0000000061b581fc 00000000312a1f03
!	Mem[0000000010101400] = 000000c5 8f94031f, %l0 = ff0000b8, %l1 = 000000ff
	ldda	[%i4+%g0]0x88,%l0	! %l0 = 000000008f94031f 00000000000000c5
!	%l0 = 000000008f94031f, Mem[0000000030041410] = ffffffff
	stha	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = ffff031f
!	Mem[00000000100c1400] = ff000000, %l7 = 00000000312a1f03
	lduw	[%i3+%g0],%l7		! %l7 = 00000000ff000000
!	Mem[0000000010101410] = ff590a0d, %l3 = ffffffffff940330
	lduha	[%i4+%o5]0x80,%l3	! %l3 = 000000000000ff59
!	Code Fragment 4
p0_fragment_5:
!	%l0 = 000000008f94031f
	setx	0xc5db410076de7e9e,%g7,%l0 ! %l0 = c5db410076de7e9e
!	%l1 = 00000000000000c5
	setx	0x77a745d7ba5f2586,%g7,%l1 ! %l1 = 77a745d7ba5f2586
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c5db410076de7e9e
	setx	0x7df774001b078797,%g7,%l0 ! %l0 = 7df774001b078797
!	%l1 = 77a745d7ba5f2586
	setx	0x486cb48fd5644814,%g7,%l1 ! %l1 = 486cb48fd5644814
!	Mem[0000000010101400] = 1f03948f, %l4 = 000000000000ffff
	ldub	[%i4+0x001],%l4		! %l4 = 0000000000000003
!	Starting 10 instruction Store Burst
!	%f0  = 0000006f 35ea586f 35ea586f ace175ff
!	%f4  = ff000000 1f0394ff 8e9af926 e6d46330
!	%f8  = 65ad75ba 3bfc3072 ff237eb9 4d53ffff
!	%f12 = 5eca5471 4fd0f9c4 41753e13 c06cea26
	stda	%f0,[%i6]ASI_COMMIT_P	! Block Store to 0000000010181400

p0_label_68:
!	%f30 = fc1705b3 50359917, Mem[0000000030141408] = ffffffff 2bb19461
	stda	%f30,[%i5+%o4]0x81	! Mem[0000000030141408] = fc1705b3 50359917
	membar	#Sync			! Added by membar checker (16)
!	Mem[000000001018141c] = e6d46330, %l6 = 0000000061b581fc
	lduha	[%i6+0x01e]%asi,%l6	! %l6 = 0000000000006330
!	%l1 = 486cb48fd5644814, Mem[0000000010041424] = 8db1fdd1, %asi = 80
	stha	%l1,[%i1+0x024]%asi	! Mem[0000000010041424] = 4814fdd1
!	%f4  = ff000000, Mem[0000000010001418] = d90bc91a
	sta	%f4 ,[%i0+0x018]%asi	! Mem[0000000010001418] = ff000000
!	%l4 = 0000000000000003, Mem[0000000030001408] = ffffffff
	stha	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 0003ffff
!	%l6 = 0000000000006330, Mem[0000000010001400] = 3063d4e6
	stha	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 6330d4e6
!	Mem[0000000010181400] = 6f000000, %l6 = 0000000000006330
	ldstuba	[%i6+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	%l7 = 00000000ff000000, Mem[0000000010041410] = 000000ff63ff0000, %asi = 80
	stxa	%l7,[%i1+0x010]%asi	! Mem[0000000010041410] = 00000000ff000000
!	Mem[0000000010081410] = d1fdb18d, %l7 = 00000000ff000000
	ldstuba	[%i2+%o5]0x88,%l7	! %l7 = 0000008d000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 7230fc3b, %l7 = 000000000000008d
	lduha	[%i6+%g0]0x81,%l7	! %l7 = 0000000000007230

p0_label_69:
!	Mem[0000000030001408] = 0003fffffc81b561, %f10 = ff237eb9 4d53ffff
	ldda	[%i0+%o4]0x81,%f10	! %f10 = 0003ffff fc81b561
!	Mem[00000000300c1408] = 35ea586face175ff, %f30 = fc1705b3 50359917
	ldda	[%i3+%o4]0x89,%f30	! %f30 = 35ea586f ace175ff
!	Mem[0000000030081400] = 602119befc81ffff, %l7 = 0000000000007230
	ldxa	[%i2+%g0]0x89,%l7	! %l7 = 602119befc81ffff
!	Mem[0000000010181400] = 6f0000ff, %l4 = 0000000000000003
	ldswa	[%i6+%g0]0x88,%l4	! %l4 = 000000006f0000ff
!	Mem[0000000030001408] = 0003ffff, %l4 = 000000006f0000ff
	ldswa	[%i0+%o4]0x81,%l4	! %l4 = 000000000003ffff
!	Mem[0000000010101400] = 1f03948f c5000000 000081fc ffffaf13
!	Mem[0000000010101410] = ff590a0d 0000009b 1f03948f c5000000
!	Mem[0000000010101420] = 95fffeeb e3f1275a 6146e006 ff4942f9
!	Mem[0000000010101430] = ffffffff ffffffff 4fb18c0b c67e67b8
	ldda	[%i4]ASI_BLK_AIUP,%f0	! Block Load from 0000000010101400
!	Mem[0000000010141400] = 300394ff, %l3 = 000000000000ff59
	ldswa	[%i5+%g0]0x88,%l3	! %l3 = 00000000300394ff
!	Mem[0000000030001410] = ff30fc3b, %l0 = 7df774001b078797
	lduha	[%i0+%o5]0x81,%l0	! %l0 = 000000000000ff30
!	Mem[0000000030081400] = ffff81fc, %l1 = 486cb48fd5644814
	lduha	[%i2+%g0]0x81,%l1	! %l1 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 6f58ea35, %l1 = 000000000000ffff
	ldstuba	[%i3+%g0]0x81,%l1	! %l1 = 0000006f000000ff

p0_label_70:
!	Mem[0000000010041400] = 1f0394ff, %l5 = 657ff5f5300cfbe4
	ldstuba	[%i1+%g0]0x80,%l5	! %l5 = 0000001f000000ff
!	Mem[0000000010101404] = c5000000, %l5 = 0000001f, %l4 = 0003ffff
	add	%i4,0x04,%g1
	casa	[%g1]0x80,%l5,%l4	! %l4 = 00000000c5000000
!	Mem[0000000010141410] = 0b8cb14f, %l5 = 000000000000001f, %asi = 80
	swapa	[%i5+0x010]%asi,%l5	! %l5 = 000000000b8cb14f
!	%l4 = 00000000c5000000, Mem[0000000010041400] = ff9403ff
	stwa	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = c5000000
!	%f28 = 88007350 134d3f5b, %l2 = ffffffffffffffff
!	Mem[0000000010081410] = ffb1fdd141753e13
	add	%i2,0x010,%g1
	stda	%f28,[%g1+%l2]ASI_PST16_PL ! Mem[0000000010081410] = 5b3f4d1350730088
!	%l1 = 000000000000006f, Mem[00000000300c1400] = ff58ea35
	stba	%l1,[%i3+%g0]0x81	! Mem[00000000300c1400] = 6f58ea35
!	%l7 = 602119befc81ffff, Mem[0000000030181408] = 000000ffffffffff
	stxa	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = 602119befc81ffff
!	%f18 = ffffffff ffffffff, %l5 = 000000000b8cb14f
!	Mem[0000000010141430] = aee50a77d1692ee8
	add	%i5,0x030,%g1
	stda	%f18,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010141430] = ffffffffffffffff
!	Mem[0000000010081408] = 61b581fc, %l7 = 602119befc81ffff
	swapa	[%i2+%o4]0x88,%l7	! %l7 = 0000000061b581fc
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff0000b8, %f28 = 88007350
	lda	[%i3+%o5]0x81,%f28	! %f28 = ff0000b8

p0_label_71:
!	Mem[0000000010101410] = ff590a0d, %l2 = ffffffffffffffff
	lduwa	[%i4+%o5]0x80,%l2	! %l2 = 00000000ff590a0d
!	Mem[0000000030181410] = 3dd531ff, %l0 = 000000000000ff30
	ldsha	[%i6+%o5]0x89,%l0	! %l0 = 00000000000031ff
!	Mem[0000000010001430] = 657ff5f5 300cfbe4, %l6 = 00000000, %l7 = 61b581fc
	ldd	[%i0+0x030],%l6		! %l6 = 00000000657ff5f5 00000000300cfbe4
!	Mem[0000000030101410] = 03000000, %l1 = 000000000000006f
	ldswa	[%i4+%o5]0x89,%l1	! %l1 = 0000000003000000
!	Mem[00000000300c1400] = 6f58ea35, %f16 = ffffffff
	lda	[%i3+%g0]0x81,%f16	! %f16 = 6f58ea35
!	Mem[0000000010181410] = ff000000 1f0394ff, %l4 = c5000000, %l5 = 0b8cb14f
	ldda	[%i6+%o5]0x80,%l4	! %l4 = 00000000ff000000 000000001f0394ff
!	Mem[0000000010181400] = 6f58ea356f0000ff, %l5 = 000000001f0394ff
	ldxa	[%i6+%g0]0x88,%l5	! %l5 = 6f58ea356f0000ff
!	Mem[0000000030001400] = 4dff00ff, %f25 = 6fb439b2
	lda	[%i0+%g0]0x89,%f25	! %f25 = 4dff00ff
!	Mem[0000000030041400] = ffffffff00000000, %l2 = 00000000ff590a0d
	ldxa	[%i1+%g0]0x89,%l2	! %l2 = ffffffff00000000
!	Starting 10 instruction Store Burst
!	%f30 = 35ea586f ace175ff, %l0 = 00000000000031ff
!	Mem[0000000010001438] = 6f00000094e531b7
	add	%i0,0x038,%g1
	stda	%f30,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010001438] = ff75e1ac6f58ea35

p0_label_72:
!	%l0 = 00000000000031ff, Mem[0000000010001400] = e6d43063
	stha	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = e6d431ff
!	%l2 = ffffffff00000000, Mem[0000000010001404] = 26f99a8e
	stw	%l2,[%i0+0x004]		! Mem[0000000010001404] = 00000000
!	%l6 = 00000000657ff5f5, Mem[0000000010001400] = ff31d4e600000000
	stx	%l6,[%i0+%g0]		! Mem[0000000010001400] = 00000000657ff5f5
!	Mem[0000000030001408] = 0003ffff, %l2 = ffffffff00000000
	swapa	[%i0+%o4]0x81,%l2	! %l2 = 000000000003ffff
!	%f22 = 4079e437, Mem[0000000010181404] = 35ea586f
	st	%f22,[%i6+0x004]	! Mem[0000000010181404] = 4079e437
!	%l4 = 00000000ff000000, Mem[00000000100c1420] = 0000007900007563, %asi = 80
	stxa	%l4,[%i3+0x020]%asi	! Mem[00000000100c1420] = 00000000ff000000
!	Mem[0000000030101400] = 29000000, %l5 = 6f58ea356f0000ff
	swapa	[%i4+%g0]0x89,%l5	! %l5 = 0000000029000000
!	%l2 = 000000000003ffff, Mem[0000000030001400] = ff00ff4d00000000
	stxa	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000000003ffff
!	%f0  = 1f03948f c5000000 000081fc ffffaf13
!	%f4  = ff590a0d 0000009b 1f03948f c5000000
!	%f8  = 95fffeeb e3f1275a 6146e006 ff4942f9
!	%f12 = ffffffff ffffffff 4fb18c0b c67e67b8
	stda	%f0,[%i2]ASI_BLK_S	! Block Store to 0000000030081400
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 1f03948f c5000000 000081fc ffffaf13
!	Mem[0000000010101410] = ff590a0d 0000009b 1f03948f c5000000
!	Mem[0000000010101420] = 95fffeeb e3f1275a 6146e006 ff4942f9
!	Mem[0000000010101430] = ffffffff ffffffff 4fb18c0b c67e67b8
	ldda	[%i4]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010101400

p0_label_73:
!	Mem[0000000010041430] = a9078e32 6ec9d9ff, %l0 = 000031ff, %l1 = 03000000
	ldda	[%i1+0x030]%asi,%l0	! %l0 = 00000000a9078e32 000000006ec9d9ff
!	Mem[00000000100c1410] = b0d7ab3a d0ae913c, %l2 = 0003ffff, %l3 = 300394ff
	ldda	[%i3+%o5]0x88,%l2	! %l2 = 00000000d0ae913c 00000000b0d7ab3a
!	Mem[0000000030181400] = 7230fc3b, %l2 = 00000000d0ae913c
	ldsba	[%i6+%g0]0x81,%l2	! %l2 = 0000000000000072
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000030081408] = fc810000, %l4 = 00000000ff000000
	ldsba	[%i2+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081400] = b97e23ff, %l1 = 000000006ec9d9ff
	lduha	[%i2+%g0]0x88,%l1	! %l1 = 00000000000023ff
!	Mem[0000000030101400] = ff00006f, %l6 = 00000000657ff5f5
	lduwa	[%i4+%g0]0x81,%l6	! %l6 = 00000000ff00006f
!	%l3 = 00000000b0d7ab3a, Mem[0000000010001408] = 000081fc
	stba	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 3a0081fc
!	Mem[0000000010081410] = 134d3f5b, %f9  = ebfeff95
	lda	[%i2+%o5]0x88,%f9 	! %f9 = 134d3f5b
!	Mem[0000000010181400] = ff00006f, %l4 = 0000000000000000
	ldsba	[%i6+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[000000001008142c] = 16174f68, %l4 = ffffffffffffffff
	swap	[%i2+0x02c],%l4		! %l4 = 0000000016174f68

p0_label_74:
!	%l6 = ff00006f, %l7 = 300cfbe4, Mem[0000000030041410] = 1f03ffff ace175ff
	stda	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = ff00006f 300cfbe4
!	Mem[0000000010181400] = 6f0000ff, %l6 = 00000000ff00006f
	swapa	[%i6+%g0]0x88,%l6	! %l6 = 000000006f0000ff
!	Mem[0000000030141400] = ffff70e4, %l7 = 00000000300cfbe4
	swapa	[%i5+%g0]0x81,%l7	! %l7 = 00000000ffff70e4
!	Mem[0000000010081400] = ff237eb9, %l2 = 0000000000000072
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 00000000ff237eb9
!	%l6 = 000000006f0000ff, Mem[0000000030141408] = fc1705b3
	stba	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = ff1705b3
!	Mem[0000000030101400] = 6f0000ff, %l0 = 00000000a9078e32
	ldstuba	[%i4+%g0]0x89,%l0	! %l0 = 000000ff000000ff
!	%l6 = 000000006f0000ff, Mem[00000000100c1438] = da24c0b24d53dbc5
	stx	%l6,[%i3+0x038]		! Mem[00000000100c1438] = 000000006f0000ff
!	%f2  = 13afffff fc810000, Mem[0000000030181408] = 602119be fc81ffff
	stda	%f2 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 13afffff fc810000
!	%l2 = ff237eb9, %l3 = b0d7ab3a, Mem[0000000030041400] = 00000000 ffffffff
	stda	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = ff237eb9 b0d7ab3a
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 35ea586f, %l1 = 00000000000023ff
	lduwa	[%i3+%g0]0x89,%l1	! %l1 = 0000000035ea586f

p0_label_75:
!	Mem[0000000030141400] = ba75ad65 e4fb0c30, %l0 = 000000ff, %l1 = 35ea586f
	ldda	[%i5+%g0]0x89,%l0	! %l0 = 00000000e4fb0c30 00000000ba75ad65
!	Mem[0000000030001410] = ff30fc3b96cad698, %f22 = 4079e437 60735afa
	ldda	[%i0+%o5]0x81,%f22	! %f22 = ff30fc3b 96cad698
!	Mem[0000000010181408] = 35ea586f, %l6 = 000000006f0000ff
	lduba	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000035
!	Mem[000000001014143c] = b70b9f3f, %l7 = 00000000ffff70e4
	lduwa	[%i5+0x03c]%asi,%l7	! %l7 = 00000000b70b9f3f
!	Mem[0000000010081410] = 134d3f5b, %l5 = 0000000029000000
	lduwa	[%i2+%o5]0x88,%l5	! %l5 = 00000000134d3f5b
!	Mem[0000000010081410] = 88007350134d3f5b, %f18 = ffffffff ffffffff
	ldda	[%i2+%o5]0x88,%f18	! %f18 = 88007350 134d3f5b
!	Mem[0000000020800040] = ffff8049, %l3 = 00000000b0d7ab3a
	ldsh	[%o1+0x040],%l3		! %l3 = ffffffffffffffff
!	Mem[00000000300c1400] = 6f58ea35, %f8  = 5a27f1e3
	lda	[%i3+%g0]0x81,%f8 	! %f8 = 6f58ea35
!	Mem[0000000010101400] = 1f03948fc5000000, %f8  = 6f58ea35 134d3f5b
	ldda	[%i4+0x000]%asi,%f8 	! %f8  = 1f03948f c5000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000e4fb0c30, Mem[0000000030101400] = 6f0000ff
	stba	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = 6f000030

p0_label_76:
!	%f16 = 6f58ea35 00000000, %l0 = 00000000e4fb0c30
!	Mem[0000000010001400] = 00000000657ff5f5
	stda	%f16,[%i0+%l0]ASI_PST16_P ! Mem[0000000010001400] = 00000000657ff5f5
!	%l4 = 0000000016174f68, Mem[0000000010081407] = 4d53ffff, %asi = 80
	stba	%l4,[%i2+0x007]%asi	! Mem[0000000010081404] = 4d53ff68
!	%l2 = 00000000ff237eb9, Mem[0000000010041400] = 000000c5
	stha	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 7eb900c5
!	Mem[00000000211c0001] = ff63fc65, %l6 = 0000000000000035
	ldstuba	[%o2+0x001]%asi,%l6	! %l6 = 00000063000000ff
!	%f2  = 13afffff fc810000, Mem[0000000010081408] = fc81ffff 312a1f03
	stda	%f2 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 13afffff fc810000
!	%l4 = 0000000016174f68, Mem[000000001008141c] = abcd7408, %asi = 80
	stha	%l4,[%i2+0x01c]%asi	! Mem[000000001008141c] = 4f687408
!	%f17 = 00000000, Mem[0000000030081400] = 1f03948f
	sta	%f17,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	%f4  = 9b000000, Mem[0000000030141400] = 300cfbe4
	sta	%f4 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 9b000000
!	Mem[0000000030081408] = 000081fc, %l7 = 00000000b70b9f3f
	swapa	[%i2+%o4]0x81,%l7	! %l7 = 00000000000081fc
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ffffffff, %l2 = 00000000ff237eb9
	ldsha	[%i1+%o4]0x81,%l2	! %l2 = ffffffffffffffff

p0_label_77:
!	Mem[0000000030001400] = 00000000, %l7 = 00000000000081fc
	lduha	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = ace175ff, %l1 = 00000000ba75ad65
	ldswa	[%i3+%o4]0x89,%l1	! %l1 = fffffffface175ff
!	Mem[0000000021800180] = 409b5fec, %l6 = 0000000000000063
	lduha	[%o3+0x180]%asi,%l6	! %l6 = 000000000000409b
!	Mem[0000000010181418] = 8e9af926e6d46330, %l6 = 000000000000409b
	ldxa	[%i6+0x018]%asi,%l6	! %l6 = 8e9af926e6d46330
!	Mem[0000000030081410] = 0d0a59ff, %l6 = 8e9af926e6d46330
	lduwa	[%i2+%o5]0x89,%l6	! %l6 = 000000000d0a59ff
!	Mem[0000000010101408] = fc810000, %l1 = fffffffface175ff
	ldsha	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101408] = ff9b00c5ffffffff, %l2 = ffffffffffffffff
	ldxa	[%i4+%o4]0x81,%l2	! %l2 = ff9b00c5ffffffff
!	Mem[0000000010101400] = 8f94031f, %l5 = 00000000134d3f5b
	lduha	[%i4+%g0]0x88,%l5	! %l5 = 000000000000031f
!	Mem[0000000010081400] = 000000724d53ff68, %l6 = 000000000d0a59ff
	ldxa	[%i2+%g0]0x80,%l6	! %l6 = 000000724d53ff68
!	Starting 10 instruction Store Burst
!	%l0 = 00000000e4fb0c30, Mem[0000000030041400] = 3aabd7b0b97e23ff
	stxa	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000e4fb0c30

p0_label_78:
!	Mem[0000000010081428] = 02f13bff, %l4 = 16174f68, %l1 = 00000000
	add	%i2,0x28,%g1
	casa	[%g1]0x80,%l4,%l1	! %l1 = 0000000002f13bff
!	%f18 = 88007350 134d3f5b, %l0 = 00000000e4fb0c30
!	Mem[0000000010041400] = 7eb900c500000000
	stda	%f18,[%i1+%l0]ASI_PST8_PL ! Mem[0000000010041400] = 7eb900c550730000
!	%l4 = 16174f68, %l5 = 0000031f, Mem[0000000010001400] = 00000000 657ff5f5
	stda	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 16174f68 0000031f
!	%f2  = 13afffff fc810000, %l4 = 0000000016174f68
!	Mem[0000000010001420] = a73d44b84736c39b
	add	%i0,0x020,%g1
	stda	%f2,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010001420] = a73d44fc47ffaf9b
!	%l6 = 000000724d53ff68, Mem[0000000010181400] = ff00006f
	stba	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = ff000068
!	%f10 = f94249ff 06e04661, Mem[0000000010141408] = 8e9af926 e6d46330
	stda	%f10,[%i5+%o4]0x80	! Mem[0000000010141408] = f94249ff 06e04661
!	Mem[00000000218000c0] = 75584245, %l1 = 0000000002f13bff
	ldstub	[%o3+0x0c0],%l1		! %l1 = 00000075000000ff
!	%f14 = b8677ec6 0b8cb14f, %l1 = 0000000000000075
!	Mem[0000000030041418] = fa5a736037e47940
	add	%i1,0x018,%g1
	stda	%f14,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030041418] = 4f5a8c60c67e6740
!	%l6 = 000000724d53ff68, Mem[00000000218000c0] = ff584245, %asi = 80
	stba	%l6,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 68584245
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 13afffff, %l6 = 000000724d53ff68
	ldsha	[%i6+%o4]0x81,%l6	! %l6 = 00000000000013af

p0_label_79:
!	Mem[0000000010081400] = 00000072, %l6 = 00000000000013af
	lduha	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181400] = 680000ff, %l2 = ff9b00c5ffffffff
	ldsba	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000068
!	Mem[00000000211c0000] = fffffc65, %l1 = 0000000000000075
	ldsba	[%o2+0x001]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030181410] = 3dd531ff, %l1 = ffffffffffffffff
	ldswa	[%i6+%o5]0x89,%l1	! %l1 = 000000003dd531ff
!	Mem[00000000211c0000] = fffffc65, %l4 = 0000000016174f68
	lduba	[%o2+0x001]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141408] = ff1705b3, %l0 = 00000000e4fb0c30
	lduha	[%i5+%o4]0x81,%l0	! %l0 = 000000000000ff17
!	Mem[0000000030101408] = ff9b00c5ffffffff, %l2 = 0000000000000068
	ldxa	[%i4+%o4]0x81,%l2	! %l2 = ff9b00c5ffffffff
!	Mem[0000000030001410] = ff30fc3b 96cad698, %l6 = 00000000, %l7 = 00000000
	ldda	[%i0+%o5]0x81,%l6	! %l6 = 00000000ff30fc3b 0000000096cad698
!	Mem[00000000300c1408] = ace175ff, %l5 = 000000000000031f
	ldsba	[%i3+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l4 = 000000ff, %l5 = ffffffff, Mem[0000000010001408] = 3a0081fc ff4942f9
	stda	%l4,[%i0+0x008]%asi	! Mem[0000000010001408] = 000000ff ffffffff

p0_label_80:
!	Mem[000000001018141f] = e6d46330, %l4 = 00000000000000ff
	ldstub	[%i6+0x01f],%l4		! %l4 = 00000030000000ff
!	%l0 = 000000000000ff17, Mem[0000000030041400] = 300cfbe400000000
	stxa	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000000000ff17
!	%l1 = 000000003dd531ff, Mem[0000000020800041] = ffff8049, %asi = 80
	stba	%l1,[%o1+0x041]%asi	! Mem[0000000020800040] = ffff8049
!	%l6 = 00000000ff30fc3b, Mem[0000000010081408] = 000081fc
	stha	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = fc3b81fc
!	%l6 = 00000000ff30fc3b, Mem[00000000100c1430] = abcd7408, %asi = 80
	stwa	%l6,[%i3+0x030]%asi	! Mem[00000000100c1430] = ff30fc3b
!	%f18 = 88007350 134d3f5b, %l0 = 000000000000ff17
!	Mem[0000000010041430] = a9078e326ec9d9ff
	add	%i1,0x030,%g1
	stda	%f18,[%g1+%l0]ASI_PST32_P ! Mem[0000000010041430] = 88007350134d3f5b
!	%l2 = ff9b00c5ffffffff, Mem[0000000030081408] = 3f9f0bb7
	stha	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 3f9fffff
!	Mem[0000000010181410] = 000000ff, %l3 = ffffffffffffffff
	swapa	[%i6+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%l5 = ffffffffffffffff, Mem[0000000010101400] = 8f94031f
	stwa	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000fc81b561, %l7 = 0000000096cad698
	ldxa	[%i0+%o4]0x81,%l7	! %l7 = 00000000fc81b561

p0_label_81:
!	Mem[0000000010081428] = 02f13bff, %l5 = ffffffffffffffff
	ldub	[%i2+0x028],%l5		! %l5 = 0000000000000002
!	Mem[0000000030081410] = ff590a0d0000009b, %l6 = 00000000ff30fc3b
	ldxa	[%i2+%o5]0x81,%l6	! %l6 = ff590a0d0000009b
!	Mem[0000000030001410] = 3bfc30ff, %f31 = ace175ff
	lda	[%i0+%o5]0x89,%f31	! %f31 = 3bfc30ff
!	Mem[00000000100c1400] = ff000000, %l2 = ff9b00c5ffffffff
	lduba	[%i3+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1410] = 3c91aed0, %l4 = 0000000000000030
	lduha	[%i3+%o5]0x80,%l4	! %l4 = 0000000000003c91
!	Mem[0000000030001400] = 00000000, %f14 = b8677ec6
	lda	[%i0+%g0]0x89,%f14	! %f14 = 00000000
!	Mem[0000000030141400] = 0000009b, %f14 = 00000000
	lda	[%i5+%g0]0x89,%f14	! %f14 = 0000009b
!	Mem[0000000021800080] = eaff8eeb, %l5 = 0000000000000002
	ldsb	[%o3+0x080],%l5		! %l5 = ffffffffffffffea
!	Mem[0000000030141410] = 1f590a61, %l5 = ffffffffffffffea
	lduba	[%i5+%o5]0x89,%l5	! %l5 = 0000000000000061
!	Starting 10 instruction Store Burst
!	%f28 = ff0000b8 134d3f5b, %l7 = 00000000fc81b561
!	Mem[00000000300c1410] = ff0000b8000000ff
	add	%i3,0x010,%g1
	stda	%f28,[%g1+%l7]ASI_PST8_SL ! Mem[00000000300c1410] = 5b0000b8000000ff

p0_label_82:
!	Mem[0000000010041410] = 00000000, %l7 = 00000000fc81b561
	ldstuba	[%i1+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010041408] = c6adb61b
	stba	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = c6adb600
!	Mem[00000000211c0000] = fffffc65, %l4 = 0000000000003c91
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	%f0  = 000000c5 8f94031f 13afffff fc810000
!	%f4  = 9b000000 0d0a59ff 000000c5 8f94031f
!	%f8  = 1f03948f c5000000 f94249ff 06e04661
!	%f12 = ffffffff ffffffff 0000009b 0b8cb14f
	stda	%f0,[%i1]ASI_BLK_SL	! Block Store to 0000000030041400
!	%l1 = 000000003dd531ff, Mem[0000000010041408] = c6adb600
	stwa	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 3dd531ff
!	Mem[0000000010001400] = 684f1716, %l1 = 000000003dd531ff
	swapa	[%i0+%g0]0x88,%l1	! %l1 = 00000000684f1716
!	%l2 = 00000000000000ff, Mem[0000000010141410] = 0000001f
	stba	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = ff00001f
!	Mem[000000001008142d] = ffffffff, %l2 = 00000000000000ff
	ldstuba	[%i2+0x02d]%asi,%l2	! %l2 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[0000000010101410] = 9b0000000d0a59ff
	stxa	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = fc3b81fc, %l6 = ff590a0d0000009b
	lduwa	[%i2+%o4]0x80,%l6	! %l6 = 00000000fc3b81fc

p0_label_83:
!	Mem[0000000010001400] = ff31d53d0000031f, %f16 = 6f58ea35 00000000
	ldda	[%i0+0x000]%asi,%f16	! %f16 = ff31d53d 0000031f
!	Mem[0000000030101408] = ff9b00c5, %l4 = 00000000000000ff
	ldsba	[%i4+%o4]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000211c0000] = fffffc65, %l6 = 00000000fc3b81fc
	lduh	[%o2+%g0],%l6		! %l6 = 000000000000ffff
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010041410] = ff000000, %l0 = 000000000000ff17
	ldsba	[%i1+%o5]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030141410] = 1f590a61, %l7 = 0000000000000000
	lduba	[%i5+%o5]0x89,%l7	! %l7 = 0000000000000061
!	Mem[0000000030001400] = 000000000003ffff, %f2  = 13afffff fc810000
	ldda	[%i0+%g0]0x81,%f2 	! %f2  = 00000000 0003ffff
!	Mem[0000000010041400] = 7eb900c5 50730000 ff31d53d cf56c6d8
!	Mem[0000000010041410] = ff000000 ff000000 b581d11c e3248c09
!	Mem[0000000010041420] = 0faed309 4814fdd1 7646daf5 8bd5e470
!	Mem[0000000010041430] = 88007350 134d3f5b 2164d7e3 8329f2b8
	ldda	[%i1]ASI_BLK_P,%f0	! Block Load from 0000000010041400
!	Mem[0000000010181418] = 8e9af926, %l6 = 000000000000ffff
	lduh	[%i6+0x01a],%l6		! %l6 = 000000000000f926
!	Mem[0000000010081430] = 98d6ca963bfc3072, %f16 = ff31d53d 0000031f
	ldda	[%i2+0x030]%asi,%f16	! %f16 = 98d6ca96 3bfc3072
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000061, Mem[0000000010001410] = ffffffff
	stba	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = 61ffffff

p0_label_84:
!	Mem[0000000010001428] = 52fe9f162a68efb1, %l6 = 000000000000f926, %l6 = 000000000000f926
	add	%i0,0x28,%g1
	casxa	[%g1]0x80,%l6,%l6	! %l6 = 52fe9f162a68efb1
!	Mem[0000000010081408] = fc3b81fc, %l4 = ffffffffffffffff, %asi = 80
	swapa	[%i2+0x008]%asi,%l4	! %l4 = 00000000fc3b81fc
!	%l5 = 0000000000000061, %l7 = 0000000000000061, %l3 = 00000000000000ff
	addc	%l5,%l7,%l3		! %l3 = 00000000000000c2
!	Mem[0000000030001400] = 00000000, %l3 = 00000000000000c2
	ldstuba	[%i0+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	%l0 = ffffffff, %l1 = 684f1716, Mem[0000000010001410] = ffffff61 098c24e3
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffff 684f1716
!	%f16 = 98d6ca96, Mem[000000001010143c] = c67e67b8
	sta	%f16,[%i4+0x03c]%asi	! Mem[000000001010143c] = 98d6ca96
!	Mem[0000000010041400] = 7eb900c5, %l3 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l3	! %l3 = 000000007eb900c5
!	Mem[0000000010101408] = 000081fc, %l2 = 00000000000000ff
	swapa	[%i4+%o4]0x80,%l2	! %l2 = 00000000000081fc
!	Mem[0000000010101410] = 000000ff, %l3 = 000000007eb900c5
	swapa	[%i4+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ffffffff1f0394ff, %f18 = 88007350 134d3f5b
	ldda	[%i6+%o5]0x80,%f18	! %f18 = ffffffff 1f0394ff

p0_label_85:
!	Mem[0000000030181410] = ff31d53d 00000000, %l4 = fc3b81fc, %l5 = 00000061
	ldda	[%i6+%o5]0x81,%l4	! %l4 = 00000000ff31d53d 0000000000000000
!	Mem[0000000010001410] = ffffffff, %l7 = 0000000000000061
	ldsba	[%i0+%o5]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101408] = ff000000, %l4 = 00000000ff31d53d
	ldsba	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181410] = 3dd531ff, %l4 = 0000000000000000
	lduba	[%i6+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141410] = ff00001f, %l3 = 00000000000000ff
	ldsba	[%i5+0x013]%asi,%l3	! %l3 = 000000000000001f
!	Mem[00000000100c143c] = 6f0000ff, %l2 = 00000000000081fc
	lduha	[%i3+0x03e]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000021800080] = eaff8eeb, %l6 = 52fe9f162a68efb1
	ldub	[%o3+0x080],%l6		! %l6 = 00000000000000ea
!	Mem[00000000100c1430] = ff30fc3b ea83a18b, %l6 = 000000ea, %l7 = ffffffff
	ldda	[%i3+0x030]%asi,%l6	! %l6 = 00000000ff30fc3b 00000000ea83a18b
!	Mem[0000000010041408] = ff31d53d, %l4 = 00000000000000ff
	ldsha	[%i1+0x008]%asi,%l4	! %l4 = ffffffffffffff31
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = ffffa250, %l0 = ffffffffffffffff
	ldstuba	[%o0+0x000]%asi,%l0	! %l0 = 000000ff000000ff

p0_label_86:
!	Mem[0000000030041410] = 0d0a59ff, %l7 = 00000000ea83a18b
	swapa	[%i1+%o5]0x89,%l7	! %l7 = 000000000d0a59ff
!	%l6 = 00000000ff30fc3b, Mem[0000000010101400] = 000000c5ffffffff
	stxa	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000ff30fc3b
!	Mem[0000000021800000] = b8fcd0bd, %l0 = 00000000000000ff
	ldstuba	[%o3+0x000]%asi,%l0	! %l0 = 000000b8000000ff
!	%l4 = ffffff31, %l5 = 00000000, Mem[0000000030081410] = 0d0a59ff 9b000000
	stda	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffff31 00000000
!	%l4 = ffffff31, %l5 = 00000000, Mem[0000000030001408] = 00000000 61b581fc
	stda	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffff31 00000000
!	%l3 = 000000000000001f, Mem[0000000021800040] = 310153ef, %asi = 80
	stba	%l3,[%o3+0x040]%asi	! Mem[0000000021800040] = 1f0153ef
!	%l0 = 00000000000000b8, Mem[0000000010001400] = 3dd531ff
	stwa	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000b8
!	%l5 = 0000000000000000, Mem[0000000030081408] = ffff9f3f
	stwa	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	%f22 = ff30fc3b 96cad698, Mem[0000000010081410] = 134d3f5b 88007350
	stda	%f22,[%i2+%o5]0x88	! Mem[0000000010081410] = ff30fc3b 96cad698
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_6:
!	%l0 = 00000000000000b8
	setx	0xd7dcb870225bcd9e,%g7,%l0 ! %l0 = d7dcb870225bcd9e
!	%l1 = 00000000684f1716
	setx	0xf36470786375111d,%g7,%l1 ! %l1 = f36470786375111d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d7dcb870225bcd9e
	setx	0x1fd1ac2862e74341,%g7,%l0 ! %l0 = 1fd1ac2862e74341
!	%l1 = f36470786375111d
	setx	0x2ffaaaa79512dd97,%g7,%l1 ! %l1 = 2ffaaaa79512dd97

p0_label_87:
!	Mem[0000000030001400] = 000000ff, %l3 = 000000000000001f
	lduwa	[%i0+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141400] = 0000009b, %l0 = 1fd1ac2862e74341
	lduwa	[%i5+%g0]0x89,%l0	! %l0 = 000000000000009b
!	Code Fragment 3
p0_fragment_7:
!	%l0 = 000000000000009b
	setx	0x50f40ab7f7a47e67,%g7,%l0 ! %l0 = 50f40ab7f7a47e67
!	%l1 = 2ffaaaa79512dd97
	setx	0x9dc7eda85f1ca2bd,%g7,%l1 ! %l1 = 9dc7eda85f1ca2bd
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 50f40ab7f7a47e67
	setx	0x3837b608447bb95f,%g7,%l0 ! %l0 = 3837b608447bb95f
!	%l1 = 9dc7eda85f1ca2bd
	setx	0xa83d0cb80efdaeae,%g7,%l1 ! %l1 = a83d0cb80efdaeae
!	Mem[0000000030001410] = 3bfc30ff, %l7 = 000000000d0a59ff
	ldsba	[%i0+%o5]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181438] = 41753e13 c06cea26, %l0 = 447bb95f, %l1 = 0efdaeae
	ldd	[%i6+0x038],%l0		! %l0 = 0000000041753e13 00000000c06cea26
!	Mem[0000000010081410] = 98d6ca96, %l7 = ffffffffffffffff
	lduha	[%i2+%o5]0x80,%l7	! %l7 = 00000000000098d6
!	Mem[0000000010041408] = ff31d53d, %l4 = ffffffffffffff31
	ldswa	[%i1+%o4]0x80,%l4	! %l4 = ffffffffff31d53d
!	Mem[0000000010041410] = 000000ff, %l2 = 00000000000000ff
	ldsha	[%i1+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181438] = 41753e13c06cea26, %f16 = 98d6ca96 3bfc3072
	ldda	[%i6+0x038]%asi,%f16	! %f16 = 41753e13 c06cea26
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000010141408] = f94249ff06e04661
	stxa	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000000000ff

p0_label_88:
!	Mem[0000000010101410] = 7eb900c5, %l4 = ffffffffff31d53d
	swapa	[%i4+%o5]0x88,%l4	! %l4 = 000000007eb900c5
	membar	#Sync			! Added by membar checker (19)
!	%l0 = 0000000041753e13, Mem[0000000010041420] = 0faed3094814fdd1, %asi = 80
	stxa	%l0,[%i1+0x020]%asi	! Mem[0000000010041420] = 0000000041753e13
!	Mem[00000000100c1410] = 3c91aed0, %l4 = 000000007eb900c5
	ldstuba	[%i3+%o5]0x80,%l4	! %l4 = 0000003c000000ff
!	Mem[0000000010181408] = 35ea586face175ff, %l2 = 00000000000000ff, %l2 = 00000000000000ff
	add	%i6,0x08,%g1
	casxa	[%g1]0x80,%l2,%l2	! %l2 = 35ea586face175ff
!	%l1 = 00000000c06cea26, Mem[00000000100c1410] = d0ae91ff
	stwa	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = c06cea26
!	%l6 = 00000000ff30fc3b, Mem[0000000010081430] = 98d6ca96
	sth	%l6,[%i2+0x030]		! Mem[0000000010081430] = fc3bca96
!	Mem[0000000010141418] = 57ba95af, %l3 = 00000000000000ff
	swap	[%i5+0x018],%l3		! %l3 = 0000000057ba95af
!	%l6 = 00000000ff30fc3b, Mem[0000000010181400] = ff000068
	stha	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = ff00fc3b
!	Mem[0000000010041408] = 3dd531ff, %l6 = 00000000ff30fc3b
	swapa	[%i1+%o4]0x88,%l6	! %l6 = 000000003dd531ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 31ffffff, %l3 = 0000000057ba95af
	ldsha	[%i2+%o5]0x81,%l3	! %l3 = 00000000000031ff

p0_label_89:
!	Mem[0000000030181408] = ffffaf13, %l0 = 0000000041753e13
	lduwa	[%i6+%o4]0x89,%l0	! %l0 = 00000000ffffaf13
!	Mem[0000000010081418] = 00000000 4f687408, %l4 = 0000003c, %l5 = 00000000
	ldda	[%i2+0x018]%asi,%l4	! %l4 = 0000000000000000 000000004f687408
!	%l1 = 00000000c06cea26, Mem[00000000100c1410] = c06cea26
	stha	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = c06cea26
!	Mem[0000000030001400] = ffff0300000000ff, %l3 = 00000000000031ff
	ldxa	[%i0+%g0]0x89,%l3	! %l3 = ffff0300000000ff
!	Mem[00000000100c1400] = 9b000000000000ff, %f30 = 35ea586f 3bfc30ff
	ldda	[%i3+%g0]0x88,%f30	! %f30 = 9b000000 000000ff
!	Mem[0000000010181428] = ff237eb9, %l5 = 000000004f687408
	ldsh	[%i6+0x028],%l5		! %l5 = ffffffffffffff23
!	Mem[0000000010101438] = 4fb18c0b98d6ca96, %f18 = ffffffff 1f0394ff
	ldd	[%i4+0x038],%f18	! %f18 = 4fb18c0b 98d6ca96
!	Mem[0000000030081410] = 31ffffff 00000000, %l4 = 00000000, %l5 = ffffff23
	ldda	[%i2+%o5]0x81,%l4	! %l4 = 0000000031ffffff 0000000000000000
!	Mem[0000000010041414] = ff000000, %l2 = 35ea586face175ff
	lduw	[%i1+0x014],%l2		! %l2 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	%l3 = ffff0300000000ff, Mem[0000000010081408] = 13afffffffffffff
	stxa	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = ffff0300000000ff

p0_label_90:
!	Mem[0000000010181438] = 41753e13, %l3 = ffff0300000000ff, %asi = 80
	swapa	[%i6+0x038]%asi,%l3	! %l3 = 0000000041753e13
!	%l7 = 00000000000098d6, Mem[0000000020800040] = ffff8049, %asi = 80
	stha	%l7,[%o1+0x040]%asi	! Mem[0000000020800040] = 98d68049
!	%f27 = 2c43c3d6, Mem[0000000010041408] = 3bfc30ff
	sta	%f27,[%i1+%o4]0x80	! Mem[0000000010041408] = 2c43c3d6
!	%l6 = 000000003dd531ff, Mem[0000000010041410] = 000000ff
	stba	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff
!	Mem[00000000300c1410] = b800005b, %l1 = 00000000c06cea26
	swapa	[%i3+%o5]0x89,%l1	! %l1 = 00000000b800005b
!	Mem[0000000010101400] = 3bfc30ff, %l1 = 00000000b800005b
	swap	[%i4+%g0],%l1		! %l1 = 000000003bfc30ff
!	Mem[0000000010081408] = ff000000, %l0 = 00000000ffffaf13
	ldstuba	[%i2+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010141410] = ff00001f, %l4 = 0000000031ffffff
	ldstuba	[%i5+%o5]0x80,%l4	! %l4 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[0000000010081410] = 98d6ca96
	stba	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = 00d6ca96
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 3000006f 95387d15, %l6 = 3dd531ff, %l7 = 000098d6
	ldda	[%i4+%g0]0x81,%l6	! %l6 = 000000003000006f 0000000095387d15

p0_label_91:
!	Mem[00000000100c1400] = ff0000000000009b, %f26 = d81697ab 2c43c3d6
	ldda	[%i3+%g0]0x80,%f26	! %f26 = ff000000 0000009b
!	Mem[0000000010101410] = 3dd531ff, %f11 = 8bd5e470
	lda	[%i4+%o5]0x80,%f11	! %f11 = 3dd531ff
!	Mem[00000000100c1408] = ff760000, %l4 = 00000000000000ff
	lduwa	[%i3+%o4]0x88,%l4	! %l4 = 00000000ff760000
!	Mem[00000000300c1410] = c06cea26, %l4 = 00000000ff760000
	ldsba	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000026
!	Mem[0000000030001410] = ff30fc3b, %l4 = 0000000000000026
	lduba	[%i0+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101408] = ff000000, %f11 = 3dd531ff
	lda	[%i4+%o4]0x88,%f11	! %f11 = ff000000
!	Mem[00000000100c1408] = ff760000, %l1 = 000000003bfc30ff
	lduha	[%i3+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[000000001010142c] = ff4942f9, %l3 = 0000000041753e13
	ldsha	[%i4+0x02c]%asi,%l3	! %l3 = ffffffffffffff49
!	Mem[0000000010041438] = 2164d7e3, %l3 = ffffffffffffff49
	ldswa	[%i1+0x038]%asi,%l3	! %l3 = 000000002164d7e3
!	Starting 10 instruction Store Burst
!	%f24 = 7c359ca5 4dff00ff, Mem[0000000010041400] = 00000000 50730000
	stda	%f24,[%i1+%g0]0x80	! Mem[0000000010041400] = 7c359ca5 4dff00ff

p0_label_92:
!	%l5 = 0000000000000000, Mem[0000000030081410] = 31ffffff
	stha	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000ffff
!	Mem[0000000010081408] = ff0000000003ffff, %l0 = 00000000000000ff, %l7 = 0000000095387d15
	add	%i2,0x08,%g1
	casxa	[%g1]0x80,%l0,%l7	! %l7 = ff0000000003ffff
!	%l2 = ff000000, %l3 = 2164d7e3, Mem[00000000100c1428] = 61b581fc fc810000
	std	%l2,[%i3+0x028]		! Mem[00000000100c1428] = ff000000 2164d7e3
!	%l3 = 000000002164d7e3, Mem[0000000030101408] = ff9b00c5
	stha	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = d7e300c5
!	%f20 = ff75e1ac, Mem[0000000010181400] = ff00fc3b
	sta	%f20,[%i6+%g0]0x88	! Mem[0000000010181400] = ff75e1ac
!	%l1 = 0000000000000000, Mem[00000000201c0001] = ffffa250
	stb	%l1,[%o0+0x001]		! Mem[00000000201c0000] = ff00a250
!	Mem[00000000300c1400] = 6f58ea35, %l7 = ff0000000003ffff
	ldstuba	[%i3+%g0]0x81,%l7	! %l7 = 0000006f000000ff
!	%l1 = 0000000000000000, Mem[0000000010001400] = 000000b8
	stwa	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	%f8  = 0faed309 4814fdd1, Mem[0000000010141400] = ff940330 ffffffff
	stda	%f8 ,[%i5+%g0]0x80	! Mem[0000000010141400] = 0faed309 4814fdd1
!	Starting 10 instruction Load Burst
!	Mem[0000000010181430] = 5eca5471, %l4 = 00000000000000ff
	lduh	[%i6+0x032],%l4		! %l4 = 0000000000005471

p0_label_93:
!	Mem[0000000030141400] = 9b00000065ad75ba, %l2 = 00000000ff000000
	ldxa	[%i5+%g0]0x81,%l2	! %l2 = 9b00000065ad75ba
!	Mem[0000000030001408] = 31ffffff 00000000, %l6 = 3000006f, %l7 = 0000006f
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 0000000031ffffff 0000000000000000
!	Mem[0000000010181408] = 6f58ea35, %l1 = 0000000000000000
	lduha	[%i6+%o4]0x88,%l1	! %l1 = 000000000000ea35
!	Mem[00000000100c1400] = ff000000, %l6 = 0000000031ffffff
	lduha	[%i3+%g0]0x80,%l6	! %l6 = 000000000000ff00
	membar	#Sync			! Added by membar checker (20)
!	Mem[00000000100c1400] = ff000000 0000009b 000076ff 95387d15
!	Mem[00000000100c1410] = 26ea6cc0 3aabd7b0 9da4e622 20ad4d1e
!	Mem[00000000100c1420] = 00000000 ff000000 ff000000 2164d7e3
!	Mem[00000000100c1430] = ff30fc3b ea83a18b 00000000 6f0000ff
	ldda	[%i3]ASI_BLK_P,%f0	! Block Load from 00000000100c1400
!	Mem[0000000010101408] = ff000000, %l7 = 0000000000000000
	ldsha	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081400] = 00000072 4d53ff68, %l0 = 000000ff, %l1 = 0000ea35
	ldda	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000072 000000004d53ff68
!	Mem[0000000010181420] = 65ad75ba3bfc3072, %f30 = 9b000000 000000ff
	ldda	[%i6+0x020]%asi,%f30	! %f30 = 65ad75ba 3bfc3072
!	Mem[0000000030181410] = 00000000 3dd531ff, %l6 = 0000ff00, %l7 = 00000000
	ldda	[%i6+%o5]0x89,%l6	! %l6 = 000000003dd531ff 0000000000000000
!	Starting 10 instruction Store Burst
!	%f26 = ff000000 0000009b, Mem[0000000030101410] = 03000000 30000000
	stda	%f26,[%i4+%o5]0x89	! Mem[0000000030101410] = ff000000 0000009b

p0_label_94:
!	%f16 = 41753e13, Mem[0000000030041400] = 1f03948f
	sta	%f16,[%i1+%g0]0x81	! Mem[0000000030041400] = 41753e13
!	Mem[0000000030101408] = c500e3d7, %l0 = 0000000000000072
	swapa	[%i4+%o4]0x89,%l0	! %l0 = 00000000c500e3d7
!	Mem[0000000010001436] = 300cfbe4, %l6 = 000000003dd531ff
	ldstub	[%i0+0x036],%l6		! %l6 = 000000fb000000ff
!	%l5 = 0000000000000000, Mem[0000000030041408] = fc810000
	stba	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = fc810000
!	Mem[0000000030001408] = 31ffffff, %l5 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l5	! %l5 = 0000000031ffffff
!	Mem[0000000010141400] = d1fd144809d3ae0f, %l4 = 0000000000005471
	ldxa	[%i5+%g0]0x88,%l4	! %l4 = d1fd144809d3ae0f
!	Mem[00000000100c1400] = ff000000, %l3 = 000000002164d7e3
	ldstuba	[%i3+%g0]0x80,%l3	! %l3 = 000000ff000000ff
!	%f21 = ffffffff, Mem[0000000030101400] = 6f000030
	sta	%f21,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffffff
!	Mem[0000000010101410] = ff31d53d, %l6 = 00000000000000fb
	swapa	[%i4+%o5]0x88,%l6	! %l6 = 00000000ff31d53d
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 1f0000ff, %f18 = 4fb18c0b
	lda	[%i5+%o5]0x88,%f18	! %f18 = 1f0000ff

p0_label_95:
!	Mem[0000000010001410] = ffffffff, %l5 = 0000000031ffffff
	ldsha	[%i0+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000020800000] = ffffdad7, %l0 = 00000000c500e3d7
	lduha	[%o1+0x000]%asi,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010181400] = ace175ff, %l7 = 0000000000000000
	lduha	[%i6+%g0]0x80,%l7	! %l7 = 000000000000ace1
!	Mem[0000000010101434] = ffffffff, %l2 = 9b00000065ad75ba
	ldsha	[%i4+0x034]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030141400] = ba75ad650000009b, %f18 = 1f0000ff 98d6ca96
	ldda	[%i5+%g0]0x89,%f18	! %f18 = ba75ad65 0000009b
!	Mem[0000000010041400] = a59c357c, %l5 = ffffffffffffffff
	lduha	[%i1+%g0]0x88,%l5	! %l5 = 000000000000357c
!	Mem[0000000010101410] = fb00000000000000, %l4 = d1fd144809d3ae0f
	ldxa	[%i4+0x010]%asi,%l4	! %l4 = fb00000000000000
!	Mem[0000000010001408] = 000000ff ffffffff, %l2 = ffffffff, %l3 = 000000ff
	ldda	[%i0+0x008]%asi,%l2	! %l2 = 00000000000000ff 00000000ffffffff
!	Mem[00000000201c0000] = ff00a250, %l7 = 000000000000ace1
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000ffff, Mem[00000000300c1410] = c06cea26
	stba	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = c06ceaff

p0_label_96:
!	%l0 = 000000000000ffff, Mem[0000000030141408] = b30517ff
	stba	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = b30517ff
	membar	#Sync			! Added by membar checker (21)
!	%l6 = ff31d53d, %l7 = ffffff00, Mem[00000000100c1400] = 000000ff 9b000000
	stda	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = ff31d53d ffffff00
!	%l2 = 00000000000000ff, Mem[00000000100c141c] = 20ad4d1e, %asi = 80
	stwa	%l2,[%i3+0x01c]%asi	! Mem[00000000100c141c] = 000000ff
!	%l4 = fb00000000000000, Mem[0000000010081400] = 00000072
	stba	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000072
!	Mem[0000000010181424] = 3bfc3072, %l1 = 4d53ff68, %l2 = 000000ff
	add	%i6,0x24,%g1
	casa	[%g1]0x80,%l1,%l2	! %l2 = 000000003bfc3072
!	%f0  = ff000000 0000009b 000076ff 95387d15
!	%f4  = 26ea6cc0 3aabd7b0 9da4e622 20ad4d1e
!	%f8  = 00000000 ff000000 ff000000 2164d7e3
!	%f12 = ff30fc3b ea83a18b 00000000 6f0000ff
	stda	%f0,[%i3]ASI_COMMIT_S	! Block Store to 00000000300c1400
!	%l6 = 00000000ff31d53d, Mem[0000000030181400] = 7230fc3b
	stwa	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = ff31d53d
!	%f18 = ba75ad65, Mem[0000000030141410] = 610a591f
	sta	%f18,[%i5+%o5]0x81	! Mem[0000000030141410] = ba75ad65
!	%f16 = 41753e13 c06cea26 ba75ad65 0000009b
!	%f20 = ff75e1ac ffffffff ff30fc3b 96cad698
!	%f24 = 7c359ca5 4dff00ff ff000000 0000009b
!	%f28 = ff0000b8 134d3f5b 65ad75ba 3bfc3072
	stda	%f16,[%i2]ASI_BLK_AIUP	! Block Store to 0000000010081400
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff00000000000000, %l1 = 000000004d53ff68
	ldxa	[%i5+%o4]0x88,%l1	! %l1 = ff00000000000000

p0_label_97:
!	Mem[0000000030101410] = 9b000000 000000ff, %l2 = 3bfc3072, %l3 = ffffffff
	ldda	[%i4+%o5]0x81,%l2	! %l2 = 000000009b000000 00000000000000ff
!	Mem[0000000030101410] = 0000009b, %f10 = ff000000
	lda	[%i4+%o5]0x89,%f10	! %f10 = 0000009b
!	Mem[0000000030101400] = 157d3895ffffffff, %f12 = ff30fc3b ea83a18b
	ldda	[%i4+%g0]0x89,%f12	! %f12 = 157d3895 ffffffff
!	Mem[0000000010041404] = 4dff00ff, %l7 = ffffffffffffff00
	ldsh	[%i1+0x006],%l7		! %l7 = 00000000000000ff
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000010081408] = ba75ad650000009b, %l0 = 000000000000ffff
	ldx	[%i2+%o4],%l0		! %l0 = ba75ad650000009b
!	Mem[0000000010181418] = 8e9af926 e6d463ff, %l4 = 00000000, %l5 = 0000357c
	ldd	[%i6+0x018],%l4		! %l4 = 000000008e9af926 00000000e6d463ff
!	Mem[00000000300c1400] = 000000ff, %l0 = ba75ad650000009b
	ldsba	[%i3+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141438] = f8de1fe1, %l3 = 00000000000000ff
	ldub	[%i5+0x039],%l3		! %l3 = 00000000000000de
!	Mem[00000000300c1410] = 26ea6cc0, %l6 = 00000000ff31d53d
	ldsha	[%i3+%o5]0x81,%l6	! %l6 = 00000000000026ea
!	Starting 10 instruction Store Burst
!	%f24 = 7c359ca5, Mem[0000000030081410] = ffff0000
	sta	%f24,[%i2+%o5]0x89	! Mem[0000000030081410] = 7c359ca5

p0_label_98:
!	Mem[0000000030041400] = 41753e13, %l6 = 00000000000026ea
	swapa	[%i1+%g0]0x81,%l6	! %l6 = 0000000041753e13
!	%f16 = 41753e13 c06cea26 ba75ad65 0000009b
!	%f20 = ff75e1ac ffffffff ff30fc3b 96cad698
!	%f24 = 7c359ca5 4dff00ff ff000000 0000009b
!	%f28 = ff0000b8 134d3f5b 65ad75ba 3bfc3072
	stda	%f16,[%i4]ASI_BLK_SL	! Block Store to 0000000030101400
!	Mem[0000000010081400] = 133e7541, %l7 = 00000000000000ff
	swapa	[%i2+%g0]0x88,%l7	! %l7 = 00000000133e7541
!	%l5 = 00000000e6d463ff, Mem[0000000010101400] = b800005b
	stha	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = 63ff005b
!	Mem[0000000030041410] = 8ba183ea, %l3 = 00000000000000de
	ldstuba	[%i1+%o5]0x81,%l3	! %l3 = 0000008b000000ff
!	%l3 = 000000000000008b, Mem[0000000010101400] = 5b00ff63
	stwa	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000008b
!	%f14 = 00000000 6f0000ff, Mem[0000000030101410] = ffffffff ff75e1ac
	stda	%f14,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000 6f0000ff
!	%f10 = 0000009b 2164d7e3, Mem[0000000030101400] = c06cea26 41753e13
	stda	%f10,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000009b 2164d7e3
!	%l7 = 00000000133e7541, Mem[0000000010081400] = ff000000
	stha	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = 75410000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = b0d7ab3a c06cea26, %l4 = 8e9af926, %l5 = e6d463ff
	ldda	[%i3+%o5]0x89,%l4	! %l4 = 00000000c06cea26 00000000b0d7ab3a

p0_label_99:
!	Mem[0000000010081410] = ff75e1acffffffff, %f4  = 26ea6cc0 3aabd7b0
	ldda	[%i2+%o5]0x80,%f4 	! %f4  = ff75e1ac ffffffff
!	Mem[0000000030001410] = 98d6ca963bfc30ff, %l1 = ff00000000000000
	ldxa	[%i0+%o5]0x89,%l1	! %l1 = 98d6ca963bfc30ff
!	%l2 = 000000009b000000, Mem[0000000030081410] = a59c357c00000000
	stxa	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000009b000000
!	Mem[0000000010041408] = 2c43c3d6, %l3 = 000000000000008b
	lduba	[%i1+%o4]0x80,%l3	! %l3 = 000000000000002c
!	Mem[0000000010181438] = 000000ff, %f2  = 000076ff
	lda	[%i6+0x038]%asi,%f2 	! %f2 = 000000ff
!	Mem[0000000030081400] = 000000c5 00000000, %l0 = ffffffff, %l1 = 3bfc30ff
	ldda	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000000 00000000000000c5
!	Mem[0000000010181410] = ffffffff, %f4  = ff75e1ac
	lda	[%i6+%o5]0x88,%f4 	! %f4 = ffffffff
!	Mem[00000000100c1400] = ff31d53d, %l1 = 00000000000000c5
	ldsha	[%i3+%g0]0x88,%l1	! %l1 = ffffffffffffd53d
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000010101400] = 8b000000 00000000 000000ff ffffaf13
!	Mem[0000000010101410] = fb000000 00000000 1f03948f c5000000
!	Mem[0000000010101420] = 95fffeeb e3f1275a 6146e006 ff4942f9
!	Mem[0000000010101430] = ffffffff ffffffff 4fb18c0b 98d6ca96
	ldda	[%i4]ASI_BLK_PL,%f16	! Block Load from 0000000010101400
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 8b000000, %l2 = 000000009b000000
	swapa	[%i4+%g0]0x80,%l2	! %l2 = 000000008b000000

p0_label_100:
!	%f10 = 0000009b 2164d7e3, %l2 = 000000008b000000
!	Mem[0000000030001418] = 684f1716473bf102
	add	%i0,0x018,%g1
	stda	%f10,[%g1+%l2]ASI_PST16_S ! Mem[0000000030001418] = 684f1716473bf102
!	%f0  = ff000000 0000009b, %l5 = 00000000b0d7ab3a
!	Mem[00000000300c1408] = 000076ff95387d15
	add	%i3,0x008,%g1
	stda	%f0,[%g1+%l5]ASI_PST8_SL ! Mem[00000000300c1408] = 0000760000007d15
!	Mem[0000000030081408] = 00000000, %l1 = ffffffffffffd53d
	swapa	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141408] = b30517ff, %l2 = 000000008b000000
	swapa	[%i5+%o4]0x89,%l2	! %l2 = 00000000b30517ff
!	%l6 = 0000000041753e13, Mem[0000000010081410] = ff75e1ac
	stba	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 1375e1ac
	membar	#Sync			! Added by membar checker (24)
!	%f6  = 9da4e622 20ad4d1e, Mem[0000000010101400] = 0000009b 00000000
	stda	%f6 ,[%i4+%g0]0x88	! Mem[0000000010101400] = 9da4e622 20ad4d1e
!	Mem[00000000100c1400] = ff31d53d, %l3 = 000000000000002c
	swapa	[%i3+%g0]0x88,%l3	! %l3 = 00000000ff31d53d
!	%f18 = 13afffff ff000000, Mem[0000000010001430] = 657ff5f5 300cffe4
	std	%f18,[%i0+0x030]	! Mem[0000000010001430] = 13afffff ff000000
!	%l6 = 0000000041753e13, Mem[0000000030181410] = 000000003dd531ff
	stxa	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000000041753e13
!	Starting 10 instruction Load Burst
!	Mem[000000001018142c] = 4d53ffff, %l3 = 00000000ff31d53d
	ldsh	[%i6+0x02e],%l3		! %l3 = ffffffffffffffff

p0_label_101:
!	Mem[0000000030101400] = e3d76421 9b000000 9b000000 65ad75ba
!	Mem[0000000030101410] = ff00006f 00000000 98d6ca96 3bfc30ff
!	Mem[0000000030101420] = ff00ff4d a59c357c 9b000000 000000ff
!	Mem[0000000030101430] = 5b3f4d13 b80000ff 7230fc3b ba75ad65
	ldda	[%i4]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030101400
!	Mem[0000000030181400] = ff31d53d, %l6 = 0000000041753e13
	ldsba	[%i6+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010041408] = 2c43c3d6, %f5  = ffffffff
	lda	[%i1+%o4]0x80,%f5 	! %f5 = 2c43c3d6
!	Mem[0000000030101400] = 2164d7e3, %l5 = 00000000b0d7ab3a
	ldsha	[%i4+%g0]0x89,%l5	! %l5 = ffffffffffffd7e3
!	Mem[0000000030081400] = 00000000, %l2 = 00000000b30517ff
	ldsba	[%i2+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181408] = 6f58ea35, %l1 = 0000000000000000
	ldsha	[%i6+%o4]0x88,%l1	! %l1 = ffffffffffffea35
!	Mem[0000000010141410] = ff00001f, %l1 = ffffffffffffea35
	lduwa	[%i5+%o5]0x80,%l1	! %l1 = 00000000ff00001f
!	Mem[00000000211c0000] = fffffc65, %l6 = ffffffffffffffff
	ldsha	[%o2+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000218001c0] = 21a75e86, %l5 = ffffffffffffd7e3
	ldsh	[%o3+0x1c0],%l5		! %l5 = 00000000000021a7
!	Starting 10 instruction Store Burst
!	%l6 = ffffffff, %l7 = 133e7541, Mem[00000000300c1408] = 00007600 00007d15
	stda	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffffffff 133e7541

p0_label_102:
!	Mem[00000000300c1410] = 26ea6cc0, %l4 = 00000000c06cea26
	swapa	[%i3+%o5]0x81,%l4	! %l4 = 0000000026ea6cc0
!	Mem[0000000010141438] = f8de1fe1b70b9f3f, %l4 = 0000000026ea6cc0, %l6 = ffffffffffffffff
	add	%i5,0x38,%g1
	casxa	[%g1]0x80,%l4,%l6	! %l6 = f8de1fe1b70b9f3f
!	%l4 = 26ea6cc0, %l5 = 000021a7, Mem[0000000010001400] = 00000000 1f030000
	stda	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 26ea6cc0 000021a7
!	%l3 = ffffffffffffffff, Mem[0000000030041400] = ea260000
	stwa	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffffff
!	%l6 = f8de1fe1b70b9f3f, Mem[0000000010001400] = 26ea6cc0
	stha	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 26ea9f3f
!	Mem[00000000211c0001] = fffffc65, %l3 = ffffffffffffffff
	ldstuba	[%o2+0x001]%asi,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000020800041] = 98d68049, %l4 = 0000000026ea6cc0
	ldstuba	[%o1+0x041]%asi,%l4	! %l4 = 000000d6000000ff
!	%l5 = 00000000000021a7, Mem[0000000010141408] = 00000000
	stha	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 21a70000
	membar	#Sync			! Added by membar checker (25)
!	%f14 = 00000000 6f0000ff, Mem[0000000030101408] = 0000009b ba75ad65
	stda	%f14,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 6f0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ffa183ea, %l7 = 00000000133e7541
	ldsha	[%i1+%o5]0x81,%l7	! %l7 = ffffffffffffffa1

p0_label_103:
!	Mem[0000000030081408] = ffffd53d ffffaf13, %l6 = b70b9f3f, %l7 = ffffffa1
	ldda	[%i2+%o4]0x81,%l6	! %l6 = 00000000ffffd53d 00000000ffffaf13
!	Mem[00000000100c1408] = 157d3895ff760000, %l0 = 0000000000000000
	ldxa	[%i3+%o4]0x88,%l0	! %l0 = 157d3895ff760000
!	Mem[0000000010041400] = 7c359ca5, %l4 = 00000000000000d6
	lduba	[%i1+%g0]0x80,%l4	! %l4 = 000000000000007c
!	Mem[00000000201c0000] = ff00a250, %l7 = 00000000ffffaf13
	ldub	[%o0+0x001],%l7		! %l7 = 0000000000000000
!	Mem[0000000030101400] = e3d76421, %l6 = 00000000ffffd53d
	lduha	[%i4+%g0]0x81,%l6	! %l6 = 000000000000e3d7
!	Mem[0000000010041400] = 7c359ca5, %l5 = 00000000000021a7
	ldsba	[%i1+%g0]0x80,%l5	! %l5 = 000000000000007c
!	Mem[0000000030181400] = 3dd531ff, %l3 = 00000000000000ff
	lduba	[%i6+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041408] = 000081fc, %l7 = 0000000000000000
	lduwa	[%i1+%o4]0x81,%l7	! %l7 = 00000000000081fc
!	Mem[0000000010081424] = 4dff00ff, %l3 = 00000000000000ff
	lduwa	[%i2+0x024]%asi,%l3	! %l3 = 000000004dff00ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i0+%o4]0x80,%l2	! %l2 = 00000000000000ff

p0_label_104:
!	%l0 = 157d3895ff760000, Mem[00000000300c1408] = ffffffff
	stwa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff760000
!	Mem[000000001018142c] = 4d53ffff, %l0 = 157d3895ff760000
	swap	[%i6+0x02c],%l0		! %l0 = 000000004d53ffff
!	Mem[0000000030041410] = ea83a1ff, %l6 = 000000000000e3d7
	swapa	[%i1+%o5]0x89,%l6	! %l6 = 00000000ea83a1ff
!	Mem[0000000030081410] = 00000000, %l5 = 000000000000007c
	swapa	[%i2+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041400] = ffffffff, %l5 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l5	! %l5 = 00000000ffffffff
!	%f30 = 65ad75ba, Mem[0000000030081408] = ffffd53d
	sta	%f30,[%i2+%o4]0x81	! Mem[0000000030081408] = 65ad75ba
!	Mem[0000000010081408] = ba75ad65, %l5 = 00000000ffffffff
	ldstuba	[%i2+%o4]0x80,%l5	! %l5 = 000000ba000000ff
!	%l3 = 000000004dff00ff, Mem[00000000211c0000] = fffffc65
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 00fffc65
!	Mem[0000000010101400] = 20ad4d1e, %l4 = 000000000000007c
	swapa	[%i4+%g0]0x88,%l4	! %l4 = 0000000020ad4d1e
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1418] = 9da4e622, %l0 = 000000004d53ffff
	lduh	[%i3+0x01a],%l0		! %l0 = 000000000000e622

p0_label_105:
!	Mem[0000000010181410] = ffffffff, %l2 = 0000000000000000
	ldsba	[%i6+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[000000001014143c] = b70b9f3f, %l7 = 00000000000081fc
	ldsw	[%i5+0x03c],%l7		! %l7 = ffffffffb70b9f3f
!	Mem[0000000030081410] = 7c000000, %l7 = ffffffffb70b9f3f
	lduba	[%i2+%o5]0x81,%l7	! %l7 = 000000000000007c
!	Mem[0000000010081428] = ff0000000000009b, %f24 = 7c359ca5 4dff00ff
	ldda	[%i2+0x028]%asi,%f24	! %f24 = ff000000 0000009b
!	Mem[0000000010001400] = 000021a726ea9f3f, %f22 = ff30fc3b 96cad698
	ldda	[%i0+%g0]0x88,%f22	! %f22 = 000021a7 26ea9f3f
!	Mem[00000000100c1400] = 0000002c, %l5 = 00000000000000ba
	ldswa	[%i3+%g0]0x88,%l5	! %l5 = 000000000000002c
!	Mem[00000000300c1400] = ff000000 0000009b, %l6 = ea83a1ff, %l7 = 0000007c
	ldda	[%i3+%g0]0x81,%l6	! %l6 = 00000000ff000000 000000000000009b
!	Mem[0000000030001408] = 00000000, %l6 = 00000000ff000000
	lduwa	[%i0+%o4]0x89,%l6	! %l6 = 0000000000000000
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000010181400] = ace175ff 4079e437 35ea586f ace175ff
!	Mem[0000000010181410] = ffffffff 1f0394ff 8e9af926 e6d463ff
!	Mem[0000000010181420] = 65ad75ba 3bfc3072 ff237eb9 ff760000
!	Mem[0000000010181430] = 5eca5471 4fd0f9c4 000000ff c06cea26
	ldda	[%i6]ASI_BLK_PL,%f0	! Block Load from 0000000010181400
!	Starting 10 instruction Store Burst
!	Mem[0000000010081430] = ff0000b8, %l7 = 000000000000009b, %asi = 80
	swapa	[%i2+0x030]%asi,%l7	! %l7 = 00000000ff0000b8

p0_label_106:
!	%l7 = 00000000ff0000b8, Mem[0000000010041414] = ff000000, %asi = 80
	stwa	%l7,[%i1+0x014]%asi	! Mem[0000000010041414] = ff0000b8
!	Mem[0000000030041400] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%l0 = 000000000000e622, Mem[0000000010101416] = 00000000, %asi = 80
	stha	%l0,[%i4+0x016]%asi	! Mem[0000000010101414] = 0000e622
!	%l3 = 000000004dff00ff, Mem[0000000030001408] = 00000000
	stha	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = 00ff0000
!	%l6 = 0000000000000000, Mem[0000000030081408] = ba75ad65
	stwa	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%l6 = 00000000, %l7 = ff0000b8, Mem[0000000010041400] = 7c359ca5 4dff00ff
	stda	%l6,[%i1+0x000]%asi	! Mem[0000000010041400] = 00000000 ff0000b8
!	Mem[0000000030141410] = 65ad75ba, %l1 = 00000000ff00001f
	ldstuba	[%i5+%o5]0x89,%l1	! %l1 = 000000ba000000ff
!	%f23 = 26ea9f3f, Mem[000000001000143c] = 6f58ea35
	sta	%f23,[%i0+0x03c]%asi	! Mem[000000001000143c] = 26ea9f3f
!	%f26 = ff000000 0000009b, %l6 = 0000000000000000
!	Mem[0000000030141430] = d3001e70aa6f5ae3
	add	%i5,0x030,%g1
	stda	%f26,[%g1+%l6]ASI_PST32_S ! Mem[0000000030141430] = d3001e70aa6f5ae3
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff75ad65, %l4 = 0000000020ad4d1e
	ldswa	[%i2+%o4]0x80,%l4	! %l4 = ffffffffff75ad65

p0_label_107:
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000010101400] = 7c000000 22e6a49d 000000ff ffffaf13
!	Mem[0000000010101410] = fb000000 0000e622 1f03948f c5000000
!	Mem[0000000010101420] = 95fffeeb e3f1275a 6146e006 ff4942f9
!	Mem[0000000010101430] = ffffffff ffffffff 4fb18c0b 98d6ca96
	ldda	[%i4]ASI_BLK_P,%f0	! Block Load from 0000000010101400
!	Mem[0000000010181408] = 35ea586f, %l5 = 000000000000002c
	lduha	[%i6+%o4]0x80,%l5	! %l5 = 00000000000035ea
!	Mem[00000000100c1400] = 2c000000, %l3 = 000000004dff00ff
	lduha	[%i3+%g0]0x80,%l3	! %l3 = 0000000000002c00
!	Mem[0000000021800080] = eaff8eeb, %l0 = 000000000000e622
	ldsb	[%o3+0x080],%l0		! %l0 = ffffffffffffffea
!	Mem[0000000030141410] = 1d09d94865ad75ff, %f22 = 000021a7 26ea9f3f
	ldda	[%i5+%o5]0x89,%f22	! %f22 = 1d09d948 65ad75ff
!	Mem[0000000010141410] = ff00001f, %l1 = 00000000000000ba
	ldswa	[%i5+%o5]0x80,%l1	! %l1 = ffffffffff00001f
!	Mem[00000000300c1410] = 26ea6cc0, %l1 = ffffffffff00001f
	lduba	[%i3+%o5]0x89,%l1	! %l1 = 00000000000000c0
!	Mem[0000000010181410] = ffffffff, %f16 = 0000009b
	lda	[%i6+%o5]0x88,%f16	! %f16 = ffffffff
!	Mem[0000000030141408] = 0000008b50359917, %f28 = ff0000b8 134d3f5b
	ldda	[%i5+%o4]0x81,%f28	! %f28 = 0000008b 50359917
!	Starting 10 instruction Store Burst
!	%f30 = 65ad75ba 3bfc3072, %l2 = ffffffffffffffff
!	Mem[0000000030081420] = 95fffeebe3f1275a
	add	%i2,0x020,%g1
	stda	%f30,[%g1+%l2]ASI_PST32_SL ! Mem[0000000030081420] = 7230fc3bba75ad65

p0_label_108:
!	Mem[0000000010041408] = d6c3432c, %l4 = ffffffffff75ad65
	swapa	[%i1+%o4]0x88,%l4	! %l4 = 00000000d6c3432c
!	%f0  = 7c000000 22e6a49d 000000ff ffffaf13
!	%f4  = fb000000 0000e622 1f03948f c5000000
!	%f8  = 95fffeeb e3f1275a 6146e006 ff4942f9
!	%f12 = ffffffff ffffffff 4fb18c0b 98d6ca96
	stda	%f0,[%i4]ASI_BLK_PL	! Block Store to 0000000010101400
!	Mem[0000000010081414] = ffffffff, %l7 = 00000000ff0000b8, %asi = 80
	swapa	[%i2+0x014]%asi,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000010001408] = ff0000ff, %l6 = 0000000000000000
	ldstuba	[%i0+%o4]0x88,%l6	! %l6 = 000000ff000000ff
!	%l1 = 00000000000000c0, Mem[00000000211c0000] = 00fffc65, %asi = 80
	stba	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = c0fffc65
!	Mem[0000000020800041] = 98ff8049, %l0 = ffffffffffffffea
	ldstub	[%o1+0x041],%l0		! %l0 = 000000ff000000ff
!	%l4 = 00000000d6c3432c, Mem[0000000010001400] = 26ea9f3f
	stba	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 26ea9f2c
!	%l2 = ffffffff, %l3 = 00002c00, Mem[0000000030141410] = ff75ad65 48d9091d
	stda	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffffff 00002c00
!	Mem[0000000010181410] = ffffffff, %l7 = 00000000ffffffff
	swapa	[%i6+%o5]0x88,%l7	! %l7 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ace175ff, %l5 = 00000000000035ea
	lduba	[%i6+%g0]0x80,%l5	! %l5 = 00000000000000ac

p0_label_109:
!	Mem[0000000010041400] = 00000000, %f29 = 50359917
	lda	[%i1+%g0]0x80,%f29	! %f29 = 00000000
!	Mem[0000000010041408] = ff75ad65, %l6 = 00000000000000ff
	lduha	[%i1+%o4]0x88,%l6	! %l6 = 000000000000ad65
!	Mem[0000000010141410] = 1f0000ff, %l1 = 00000000000000c0
	ldswa	[%i5+%o5]0x88,%l1	! %l1 = 000000001f0000ff
!	Mem[0000000030101408] = ff00006f, %f26 = ff000000
	lda	[%i4+%o4]0x81,%f26	! %f26 = ff00006f
!	Mem[0000000030041400] = 000000ff, %l4 = 00000000d6c3432c
	ldsba	[%i1+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c1410] = b0d7ab3a c06cea26, %l2 = ffffffff, %l3 = 00002c00
	ldda	[%i3+%o5]0x88,%l2	! %l2 = 00000000c06cea26 00000000b0d7ab3a
!	Mem[00000000300c1400] = 000000ff, %l1 = 000000001f0000ff
	lduwa	[%i3+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141408] = 0000008b, %l0 = 00000000000000ff
	lduba	[%i5+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1400] = 000000ff, %l3 = 00000000b0d7ab3a
	lduha	[%i3+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010141404] = 4814fdd1
	sth	%l0,[%i5+0x004]		! Mem[0000000010141404] = 0000fdd1

p0_label_110:
!	%l7 = 00000000ffffffff, Mem[0000000010141410] = 1f0000ff
	stba	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 1f0000ff
!	%f24 = ff000000, Mem[0000000030141408] = 0000008b
	sta	%f24,[%i5+%o4]0x81	! Mem[0000000030141408] = ff000000
!	Mem[0000000030001410] = ff30fc3b, %l7 = 00000000ffffffff
	ldstuba	[%i0+%o5]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010081410] = 1375e1ac, %l4 = ffffffffffffffff
	swapa	[%i2+%o5]0x80,%l4	! %l4 = 000000001375e1ac
!	%l2 = 00000000c06cea26, Mem[0000000010081400] = 75410000
	stwa	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = c06cea26
!	%f0  = 7c000000 22e6a49d 000000ff ffffaf13
!	%f4  = fb000000 0000e622 1f03948f c5000000
!	%f8  = 95fffeeb e3f1275a 6146e006 ff4942f9
!	%f12 = ffffffff ffffffff 4fb18c0b 98d6ca96
	stda	%f0,[%i2]ASI_BLK_AIUSL	! Block Store to 0000000030081400
!	%l7 = 00000000000000ff, Mem[0000000010041408] = ff75ad65
	stba	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = ff75adff
!	%f26 = ff00006f 0000009b, Mem[0000000010041408] = ffad75ff cf56c6d8
	stda	%f26,[%i1+0x008]%asi	! Mem[0000000010041408] = ff00006f 0000009b
!	%f18 = ba75ad65 0000009b, Mem[0000000030181400] = 3dd531ff 65ad75ba
	stda	%f18,[%i6+%g0]0x89	! Mem[0000000030181400] = ba75ad65 0000009b
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ffffff000000002c, %f28 = 0000008b 00000000
	ldda	[%i3+%g0]0x88,%f28	! %f28 = ffffff00 0000002c

p0_label_111:
!	Mem[0000000010041408] = ff00006f0000009b, %l7 = 00000000000000ff
	ldxa	[%i1+%o4]0x80,%l7	! %l7 = ff00006f0000009b
!	Mem[0000000010141408] = 21a70000000000ff, %l3 = 00000000000000ff
	ldxa	[%i5+%o4]0x80,%l3	! %l3 = 21a70000000000ff
!	Mem[0000000030001408] = 00ff000000000000, %f26 = ff00006f 0000009b
	ldda	[%i0+%o4]0x81,%f26	! %f26 = 00ff0000 00000000
!	Mem[0000000030001408] = 00ff0000, %l4 = 000000001375e1ac
	lduha	[%i0+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1400] = ff000000 0000009b 000076ff 133e7541
!	Mem[00000000300c1410] = c06cea26 3aabd7b0 9da4e622 20ad4d1e
!	Mem[00000000300c1420] = 00000000 ff000000 ff000000 2164d7e3
!	Mem[00000000300c1430] = ff30fc3b ea83a18b 00000000 6f0000ff
	ldda	[%i3]ASI_BLK_AIUS,%f16	! Block Load from 00000000300c1400
!	Mem[0000000030141400] = ba75ad65 0000009b, %l2 = c06cea26, %l3 = 000000ff
	ldda	[%i5+%g0]0x89,%l2	! %l2 = 000000000000009b 00000000ba75ad65
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000010101410] = 22e60000, %l1 = 00000000000000ff
	lduba	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000022
!	Mem[0000000010081410] = b80000ff ffffffff, %l0 = 00000000, %l1 = 00000022
	ldda	[%i2+%o5]0x88,%l0	! %l0 = 00000000ffffffff 00000000b80000ff
!	Mem[000000001000140c] = ffffffff, %l1 = 00000000b80000ff
	lduw	[%i0+0x00c],%l1		! %l1 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = ff000000, %l3 = 00000000ba75ad65
	swapa	[%i1+%g0]0x81,%l3	! %l3 = 00000000ff000000

p0_label_112:
!	Mem[0000000010101400] = 22e6a49d, %l0 = 00000000ffffffff
	ldstuba	[%i4+%g0]0x88,%l0	! %l0 = 0000009d000000ff
!	Mem[0000000010101408] = 13afffff, %l3 = 00000000ff000000
	ldstuba	[%i4+%o4]0x80,%l3	! %l3 = 00000013000000ff
!	Mem[0000000010081410] = ffffffff, %l6 = 000000000000ad65
	ldstuba	[%i2+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030141408] = 000000ff, %l2 = 000000000000009b
	ldstuba	[%i5+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	%l3 = 0000000000000013, Mem[00000000100c1408] = 000076ff95387d15, %asi = 80
	stxa	%l3,[%i3+0x008]%asi	! Mem[00000000100c1408] = 0000000000000013
!	Mem[0000000030141410] = ffffffff 00002c00, %l0 = 0000009d, %l1 = ffffffff
	ldda	[%i5+%o5]0x81,%l0	! %l0 = 00000000ffffffff 0000000000002c00
!	%f28 = ff30fc3b ea83a18b, Mem[00000000300c1408] = ff760000 41753e13
	stda	%f28,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff30fc3b ea83a18b
!	Mem[0000000010001400] = 26ea9f2c, %l3 = 0000000000000013
	swapa	[%i0+%g0]0x88,%l3	! %l3 = 0000000026ea9f2c
!	%f22 = 9da4e622 20ad4d1e, Mem[0000000010001410] = ffffffff 16174f68
	stda	%f22,[%i0+%o5]0x80	! Mem[0000000010001410] = 9da4e622 20ad4d1e
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 13afffff, %l3 = 0000000026ea9f2c
	ldsha	[%i6+%o4]0x81,%l3	! %l3 = 00000000000013af

p0_label_113:
!	Mem[0000000010041410] = ff000000, %l6 = 00000000000000ff
	lduwa	[%i1+%o5]0x80,%l6	! %l6 = 00000000ff000000
!	Mem[0000000030081400] = 9da4e6220000007c, %f8  = 95fffeeb e3f1275a
	ldda	[%i2+%g0]0x81,%f8 	! %f8  = 9da4e622 0000007c
!	Mem[0000000010041400] = 00000000, %f4  = fb000000
	lda	[%i1+%g0]0x88,%f4 	! %f4 = 00000000
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000010081400] = c06cea26 c06cea26 ff75ad65 0000009b
!	Mem[0000000010081410] = ffffffff ff0000b8 ff30fc3b 96cad698
!	Mem[0000000010081420] = 7c359ca5 4dff00ff ff000000 0000009b
!	Mem[0000000010081430] = 0000009b 134d3f5b 65ad75ba 3bfc3072
	ldda	[%i2]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010081400
!	Mem[00000000100c1408] = 00000000, %l2 = 00000000000000ff
	ldsba	[%i3+0x009]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041410] = d7e30000, %l7 = ff00006f0000009b
	lduwa	[%i1+%o5]0x81,%l7	! %l7 = 00000000d7e30000
!	Mem[0000000030141400] = 0000009b, %l3 = 00000000000013af
	lduba	[%i5+%g0]0x89,%l3	! %l3 = 000000000000009b
!	Mem[0000000010041400] = b80000ff00000000, %f12 = ffffffff ffffffff
	ldda	[%i1+%g0]0x88,%f12	! %f12 = b80000ff 00000000
!	Mem[00000000218001c0] = 21a75e86, %l3 = 000000000000009b
	ldsha	[%o3+0x1c0]%asi,%l3	! %l3 = 00000000000021a7
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = ffffffff, %l7 = 00000000d7e30000
	swapa	[%i5+%o5]0x89,%l7	! %l7 = 00000000ffffffff

p0_label_114:
!	%l2 = 00000000, %l3 = 000021a7, Mem[0000000030081410] = 0000e622 fb000000
	stda	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000 000021a7
!	Mem[0000000030041408] = 000081fc, %l3 = 00000000000021a7
	swapa	[%i1+%o4]0x81,%l3	! %l3 = 00000000000081fc
!	Mem[0000000030001400] = ff000000, %l0 = 00000000ffffffff
	ldstuba	[%i0+%g0]0x81,%l0	! %l0 = 000000ff000000ff
!	%f6  = 1f03948f c5000000, Mem[0000000030141408] = ff000000 50359917
	stda	%f6 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 1f03948f c5000000
!	Mem[0000000030141408] = 8f94031f, %l0 = 00000000000000ff
	swapa	[%i5+%o4]0x89,%l0	! %l0 = 000000008f94031f
!	%l7 = 00000000ffffffff, Mem[00000000100c143a] = 00000000
	sth	%l7,[%i3+0x03a]		! Mem[00000000100c1438] = 0000ffff
!	%l6 = ff000000, %l7 = ffffffff, Mem[0000000010181408] = 6f58ea35 ff75e1ac
	stda	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = ff000000 ffffffff
!	%l4 = 00000000000000ff, Mem[0000000010041410] = 000000ff
	stha	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff
!	%l3 = 00000000000081fc, Mem[00000000211c0001] = c0fffc65
	stb	%l3,[%o2+0x001]		! Mem[00000000211c0000] = c0fcfc65
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 21a70000, %f9  = 0000007c
	lda	[%i5+0x008]%asi,%f9 	! %f9 = 21a70000

p0_label_115:
!	Mem[0000000010001400] = 13000000, %l5 = 00000000000000ac
	lduba	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000013
!	Mem[0000000030181410] = 133e7541, %l2 = 0000000000000000
	ldsba	[%i6+%o5]0x81,%l2	! %l2 = 0000000000000013
!	Mem[00000000300c1400] = 000000ff, %f3  = ffffaf13
	lda	[%i3+%g0]0x89,%f3 	! %f3 = 000000ff
!	Mem[00000000201c0000] = ff00a250, %l3 = 00000000000081fc
	lduh	[%o0+%g0],%l3		! %l3 = 000000000000ff00
!	Mem[00000000201c0000] = ff00a250, %l4 = 00000000000000ff
	ldub	[%o0+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010141400] = 09d3ae0f, %l3 = 000000000000ff00
	lduwa	[%i5+%g0]0x88,%l3	! %l3 = 0000000009d3ae0f
!	Mem[0000000030041410] = 9b0000000000e3d7, %l3 = 0000000009d3ae0f
	ldxa	[%i1+%o5]0x89,%l3	! %l3 = 9b0000000000e3d7
!	Mem[0000000010041434] = 134d3f5b, %l3 = 9b0000000000e3d7
	ldsw	[%i1+0x034],%l3		! %l3 = 00000000134d3f5b
!	Mem[0000000030001410] = 3bfc30ff, %l4 = 00000000000000ff
	ldsba	[%i0+%o5]0x89,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 00000013, %l6 = 00000000ff000000
	swapa	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000013

p0_label_116:
!	Mem[0000000010181400] = ace175ff, %l3 = 134d3f5b, %l4 = ffffffff
	casa	[%i6]0x80,%l3,%l4	! %l4 = 00000000ace175ff
!	%f15 = 98d6ca96, Mem[0000000030181400] = 9b000000
	sta	%f15,[%i6+%g0]0x81	! Mem[0000000030181400] = 98d6ca96
!	%l7 = 00000000ffffffff, Mem[00000000100c143e] = 6f0000ff, %asi = 80
	stba	%l7,[%i3+0x03e]%asi	! Mem[00000000100c143c] = 6f00ffff
!	Mem[0000000010081400] = 26ea6cc0, %l6 = 0000000000000013
	ldstuba	[%i2+%g0]0x88,%l6	! %l6 = 000000c0000000ff
!	%f8  = 9da4e622 21a70000, Mem[0000000010041408] = 6f0000ff 9b000000
	stda	%f8 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 9da4e622 21a70000
!	Mem[0000000010081418] = ff30fc3b, %l7 = ffffffff, %l5 = 00000013
	add	%i2,0x18,%g1
	casa	[%g1]0x80,%l7,%l5	! %l5 = 00000000ff30fc3b
!	Mem[00000000100c1408] = 0000000000000013, %l1 = 0000000000002c00, %l6 = 00000000000000c0
	add	%i3,0x08,%g1
	casxa	[%g1]0x80,%l1,%l6	! %l6 = 0000000000000013
!	%f4  = 00000000, Mem[0000000010041408] = 21a70000
	sta	%f4 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	Mem[0000000010101406] = 0000007c, %l3 = 00000000134d3f5b
	ldstub	[%i4+0x006],%l3		! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 65ad75ba, %l6 = 0000000000000013
	lduwa	[%i1+%g0]0x89,%l6	! %l6 = 0000000065ad75ba

p0_label_117:
!	Mem[00000000100c1418] = 9da4e622000000ff, %f16 = 26ea6cc0 26ea6cc0
	ldda	[%i3+0x018]%asi,%f16	! %f16 = 9da4e622 000000ff
!	Mem[00000000300c1400] = ff000000, %f2  = 000000ff
	lda	[%i3+%g0]0x81,%f2 	! %f2 = ff000000
!	Mem[0000000030081408] = ffffaf13, %l3 = 0000000000000000
	ldsha	[%i2+%o4]0x89,%l3	! %l3 = ffffffffffffaf13
!	Mem[0000000010141400] = 09d3ae0f, %f16 = 9da4e622
	lda	[%i5+%g0]0x88,%f16	! %f16 = 09d3ae0f
!	Mem[00000000300c1400] = ff000000, %l3 = ffffffffffffaf13
	ldsha	[%i3+%g0]0x81,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000030101408] = ff00006f, %l2 = 0000000000000013
	lduba	[%i4+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001408] = 0000ff00, %l5 = 00000000ff30fc3b
	ldsha	[%i0+%o4]0x89,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000030181410] = 0000000041753e13, %f24 = ff00ff4d a59c357c
	ldda	[%i6+%o5]0x89,%f24	! %f24 = 00000000 41753e13
!	Mem[0000000030001408] = 0000ff00, %l7 = 00000000ffffffff
	lduha	[%i0+%o4]0x89,%l7	! %l7 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l0 = 000000008f94031f, Mem[0000000030141400] = 9b00000065ad75ba
	stxa	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000008f94031f

p0_label_118:
!	%l1 = 0000000000002c00, Mem[0000000010041410] = ff000000ff0000b8
	stxa	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000002c00
!	%f12 = b80000ff 00000000, Mem[0000000030141400] = 00000000 8f94031f
	stda	%f12,[%i5+%g0]0x81	! Mem[0000000030141400] = b80000ff 00000000
!	Mem[0000000030181408] = ffffaf13, %l0 = 000000008f94031f
	swapa	[%i6+%o4]0x89,%l0	! %l0 = 00000000ffffaf13
!	Mem[0000000030101408] = ff00006f, %l4 = 00000000ace175ff
	swapa	[%i4+%o4]0x81,%l4	! %l4 = 00000000ff00006f
!	Mem[0000000030101400] = e3d76421, %l6 = 0000000065ad75ba
	swapa	[%i4+%g0]0x81,%l6	! %l6 = 00000000e3d76421
!	%l4 = 00000000ff00006f, Mem[0000000010001419] = ff000000
	stb	%l4,[%i0+0x019]		! Mem[0000000010001418] = ff6f0000
!	%f0  = 7c000000 22e6a49d, Mem[0000000010101410] = 22e60000 000000fb
	stda	%f0 ,[%i4+%o5]0x80	! Mem[0000000010101410] = 7c000000 22e6a49d
	membar	#Sync			! Added by membar checker (30)
!	%f10 = 6146e006 ff4942f9, Mem[0000000010081438] = 65ad75ba 3bfc3072
	std	%f10,[%i2+0x038]	! Mem[0000000010081438] = 6146e006 ff4942f9
!	Mem[0000000010081420] = 7c359ca5, %l1 = 00002c00, %l3 = ffffff00
	add	%i2,0x20,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 000000007c359ca5
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = c0fcfc65, %l3 = 000000007c359ca5
	ldsha	[%o2+0x000]%asi,%l3	! %l3 = ffffffffffffc0fc

p0_label_119:
!	%l7 = 000000000000ff00, imm = ffffffffffffffa7, %l4 = 00000000ff00006f
	andn	%l7,-0x059,%l4		! %l4 = 0000000000000000
!	Mem[0000000010001428] = 52fe9f16 2a68efb1, %l6 = e3d76421, %l7 = 0000ff00
	ldd	[%i0+0x028],%l6		! %l6 = 0000000052fe9f16 000000002a68efb1
!	Mem[0000000010181400] = ace175ff, %l5 = ffffffffffffff00
	ldsba	[%i6+%g0]0x80,%l5	! %l5 = ffffffffffffffac
!	Mem[0000000030141410] = d7e30000, %l4 = 0000000000000000
	ldsba	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181400] = ff75e1ac, %l6 = 0000000052fe9f16
	ldswa	[%i6+%g0]0x88,%l6	! %l6 = ffffffffff75e1ac
!	Mem[0000000010141408] = ff0000000000a721, %f28 = 5b3f4d13 9b000000
	ldda	[%i5+%o4]0x88,%f28	! %f28 = ff000000 0000a721
!	Mem[000000001000141c] = 988ad9da, %l3 = ffffffffffffc0fc
	ldstuba	[%i0+0x01c]%asi,%l3	! %l3 = 00000098000000ff
!	Mem[0000000030181410] = 133e7541, %l0 = 00000000ffffaf13
	lduba	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000013
!	Mem[00000000300c1410] = 26ea6cc0, %l4 = 0000000000000000
	lduba	[%i3+%o5]0x89,%l4	! %l4 = 00000000000000c0
!	Starting 10 instruction Store Burst
!	Mem[0000000020800000] = ffffdad7, %l1 = 0000000000002c00
	ldstuba	[%o1+0x000]%asi,%l1	! %l1 = 000000ff000000ff

p0_label_120:
!	%l4 = 00000000000000c0, Mem[0000000030081408] = ffffaf13
	stha	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = ffff00c0
!	Mem[0000000010181408] = 000000ff, %l6 = ffffffffff75e1ac
	swapa	[%i6+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	%l5 = ffffffffffffffac, Mem[00000000201c0001] = ff00a250
	stb	%l5,[%o0+0x001]		! Mem[00000000201c0000] = ffaca250
!	Mem[0000000010001435] = ff000000, %l5 = ffffffffffffffac
	ldstub	[%i0+0x035],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030181400] = 98d6ca96, %l4 = 00000000000000c0
	swapa	[%i6+%g0]0x81,%l4	! %l4 = 0000000098d6ca96
!	%f20 = b80000ff ffffffff, Mem[00000000100c1438] = 0000ffff 6f00ffff
	stda	%f20,[%i3+0x038]%asi	! Mem[00000000100c1438] = b80000ff ffffffff
!	%l3 = 0000000000000098, Mem[0000000010001410] = 22e6a49d
	stba	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 22e6a498
!	%l2 = 00000000000000ff, Mem[0000000030101410] = ff00006f
	stha	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 00ff006f
!	%l6 = 00000000000000ff, Mem[00000000100c1418] = 9da4e622000000ff, %asi = 80
	stxa	%l6,[%i3+0x018]%asi	! Mem[00000000100c1418] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 65ad75ba, %l1 = 00000000000000ff
	ldsha	[%i1+%g0]0x89,%l1	! %l1 = 00000000000075ba

p0_label_121:
!	Mem[0000000010081410] = ffffffff, %l2 = 00000000000000ff
	lduha	[%i2+%o5]0x80,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010141408] = 0000a721, %l4 = 0000000098d6ca96
	lduwa	[%i5+%o4]0x88,%l4	! %l4 = 000000000000a721
!	Mem[0000000010181410] = ffffffff 1f0394ff, %l2 = 0000ffff, %l3 = 00000098
	ldda	[%i6+%o5]0x80,%l2	! %l2 = 00000000ffffffff 000000001f0394ff
!	Mem[00000000300c1408] = 8ba183ea, %l4 = 000000000000a721
	ldsha	[%i3+%o4]0x81,%l4	! %l4 = ffffffffffff8ba1
!	Mem[00000000300c1400] = 000000ff, %f15 = 98d6ca96
	lda	[%i3+%g0]0x89,%f15	! %f15 = 000000ff
!	Mem[0000000010181408] = ff75e1ac, %l6 = 00000000000000ff
	ldsha	[%i6+%o4]0x80,%l6	! %l6 = ffffffffffffff75
!	Mem[000000001004142c] = 8bd5e470, %l2 = 00000000ffffffff
	ldsw	[%i1+0x02c],%l2		! %l2 = ffffffff8bd5e470
!	Mem[0000000030001400] = 000000ff, %l6 = ffffffffffffff75
	lduha	[%i0+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001408] = 0000ff00, %l2 = ffffffff8bd5e470
	ldswa	[%i0+%o4]0x89,%l2	! %l2 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%f4  = 00000000 0000e622, Mem[0000000010141420] = 684f1716 473bf102
	std	%f4 ,[%i5+0x020]	! Mem[0000000010141420] = 00000000 0000e622

p0_label_122:
!	%l2 = 000000000000ff00, Mem[0000000030041400] = 65ad75ba
	stwa	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000ff00
!	%l6 = 000000ff, %l7 = 2a68efb1, Mem[0000000010001410] = 98a4e622 20ad4d1e
	std	%l6,[%i0+%o5]		! Mem[0000000010001410] = 000000ff 2a68efb1
!	Mem[00000000100c1410] = c06cea26, %l5 = 0000000000000000
	ldstuba	[%i3+%o5]0x88,%l5	! %l5 = 00000026000000ff
!	%f16 = 09d3ae0f 000000ff, %l2 = 000000000000ff00
!	Mem[0000000030101430] = 5b3f4d13b80000ff
	add	%i4,0x030,%g1
	stda	%f16,[%g1+%l2]ASI_PST16_S ! Mem[0000000030101430] = 5b3f4d13b80000ff
!	Mem[0000000030041410] = d7e30000, %l4 = ffffffffffff8ba1
	ldstuba	[%i1+%o5]0x81,%l4	! %l4 = 000000d7000000ff
!	%l4 = 00000000000000d7, Mem[0000000030141410] = d7e30000
	stha	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = d7e300d7
!	%l2 = 000000000000ff00, Mem[0000000010101400] = 22e6a4ff
	stwa	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000ff00
!	Mem[0000000010141408] = 0000a721, %l2 = 000000000000ff00
	swapa	[%i5+%o4]0x88,%l2	! %l2 = 000000000000a721
!	%l3 = 000000001f0394ff, Mem[0000000020800000] = ffffdad7, %asi = 80
	stba	%l3,[%o1+0x000]%asi	! Mem[0000000020800000] = ffffdad7
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff30fc3b96cad698, %l5 = 0000000000000026
	ldxa	[%i0+%o5]0x81,%l5	! %l5 = ff30fc3b96cad698

p0_label_123:
!	Mem[0000000030041410] = ffe30000, %f16 = 09d3ae0f
	lda	[%i1+%o5]0x81,%f16	! %f16 = ffe30000
!	Mem[0000000010181424] = 3bfc3072, %l4 = 00000000000000d7
	ldswa	[%i6+0x024]%asi,%l4	! %l4 = 000000003bfc3072
	membar	#Sync			! Added by membar checker (31)
!	Mem[0000000030081400] = 9da4e622 0000007c c000ffff ff000000
!	Mem[0000000030081410] = 00000000 a7210000 000000c5 8f94031f
!	Mem[0000000030081420] = 5a27f1e3 ebfeff95 f94249ff 06e04661
!	Mem[0000000030081430] = ffffffff ffffffff 96cad698 0b8cb14f
	ldda	[%i2]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030081400
!	Mem[0000000030181408] = 8f94031f, %l0 = 0000000000000013
	ldsba	[%i6+%o4]0x89,%l0	! %l0 = 000000000000001f
!	Mem[0000000020800000] = ffffdad7, %l4 = 000000003bfc3072
	ldsha	[%o1+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[000000001000142c] = 2a68efb1, %l5 = ff30fc3b96cad698
	ldswa	[%i0+0x02c]%asi,%l5	! %l5 = 000000002a68efb1
!	Mem[0000000010041408] = 00000000, %l7 = 000000002a68efb1
	ldsb	[%i1+0x00b],%l7		! %l7 = 0000000000000000
!	Mem[0000000010141414] = c67e67b8, %l7 = 0000000000000000
	ldsha	[%i5+0x016]%asi,%l7	! %l7 = 00000000000067b8
!	Mem[0000000010181400] = ace175ff4079e437, %f6  = 1f03948f c5000000
	ldda	[%i6+%g0]0x80,%f6 	! %f6  = ace175ff 4079e437
!	Starting 10 instruction Store Burst
!	%f14 = 4fb18c0b 000000ff, %l1 = 00000000000075ba
!	Mem[0000000030001430] = a4487646d429029d
	add	%i0,0x030,%g1
	stda	%f14,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030001430] = a44876460b8cb14f

p0_label_124:
!	%l7 = 00000000000067b8, Mem[0000000030101400] = 65ad75ba
	stba	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = b8ad75ba
!	%l3 = 000000001f0394ff, Mem[0000000010001410] = ff000000
	stha	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = ff0094ff
!	%l3 = 000000001f0394ff, Mem[00000000300c1408] = 8ba183ea
	stba	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffa183ea
!	%l5 = 000000002a68efb1, Mem[0000000030141400] = b80000ff
	stwa	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 2a68efb1
!	%l2 = 000000000000a721, Mem[0000000010181410] = ffffffff
	stwa	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000a721
!	%f2  = ff000000, Mem[0000000010181424] = 3bfc3072
	st	%f2 ,[%i6+0x024]	! Mem[0000000010181424] = ff000000
!	Mem[0000000010141410] = ff00001f, %l0 = 000000000000001f
	swapa	[%i5+%o5]0x80,%l0	! %l0 = 00000000ff00001f
!	%l2 = 000000000000a721, Mem[0000000020800040] = 98ff8049
	sth	%l2,[%o1+0x040]		! Mem[0000000020800040] = a7218049
!	%f9  = 21a70000, Mem[0000000030181408] = 1f03948f
	sta	%f9 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 21a70000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 0000ff00, %l5 = 000000002a68efb1
	lduha	[%i4+%g0]0x88,%l5	! %l5 = 000000000000ff00

p0_label_125:
!	Mem[0000000010041400] = 00000000, %l1 = 00000000000075ba
	ldsba	[%i1+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[000000001004141c] = e3248c09, %f12 = b80000ff
	lda	[%i1+0x01c]%asi,%f12	! %f12 = e3248c09
!	Mem[0000000010001408] = ffffffffff0000ff, %l7 = 00000000000067b8
	ldxa	[%i0+%o4]0x88,%l7	! %l7 = ffffffffff0000ff
!	Mem[0000000030081408] = 000000ff ffff00c0, %l6 = 000000ff, %l7 = ff0000ff
	ldda	[%i2+%o4]0x89,%l6	! %l6 = 00000000ffff00c0 00000000000000ff
!	Mem[0000000010081400] = ff6cea26 c06cea26, %l4 = ffffffff, %l5 = 0000ff00
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 00000000ff6cea26 00000000c06cea26
!	Mem[00000000100c1408] = 00000000, %l2 = 000000000000a721
	ldswa	[%i3+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001410] = b1ef682a ff0094ff, %l0 = ff00001f, %l1 = 00000000
	ldda	[%i0+%o5]0x88,%l0	! %l0 = 00000000ff0094ff 00000000b1ef682a
!	Mem[0000000010081434] = 134d3f5b, %l2 = 0000000000000000
	lduba	[%i2+0x034]%asi,%l2	! %l2 = 0000000000000013
!	Mem[00000000100c1400] = 2c00000000ffffff, %l5 = 00000000c06cea26
	ldxa	[%i3+%g0]0x80,%l5	! %l5 = 2c00000000ffffff
!	Starting 10 instruction Store Burst
!	%l1 = 00000000b1ef682a, Mem[0000000010041438] = 2164d7e3, %asi = 80
	stwa	%l1,[%i1+0x038]%asi	! Mem[0000000010041438] = b1ef682a

p0_label_126:
!	Mem[0000000010141408] = 00ff0000, %l4 = ff6cea26, %l5 = 00ffffff
	add	%i5,0x08,%g1
	casa	[%g1]0x80,%l4,%l5	! %l5 = 0000000000ff0000
!	Mem[0000000030041400] = 0000ff00, %l5 = 0000000000ff0000
	swapa	[%i1+%g0]0x89,%l5	! %l5 = 000000000000ff00
!	Mem[0000000010181428] = ff237eb9, %l6 = 00000000ffff00c0
	swap	[%i6+0x028],%l6		! %l6 = 00000000ff237eb9
!	%l3 = 000000001f0394ff, Mem[0000000030001400] = ff000000
	stwa	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 1f0394ff
!	Mem[0000000010001400] = 000000ff, %l0 = 00000000ff0094ff
	ldstuba	[%i0+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[00000000300c1410] = c06cea26
	stba	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff6cea26
!	%f18 = 000000ff, Mem[0000000010181408] = ff75e1ac
	sta	%f18,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000ff
!	Mem[0000000010141408] = 0000ff00, %l5 = 000000000000ff00
	ldstuba	[%i5+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000010041434] = 134d3f5b, %asi = 80
	stwa	%l0,[%i1+0x034]%asi	! Mem[0000000010041434] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[000000001000143c] = 26ea9f3f, %l0 = 0000000000000000
	ldsba	[%i0+0x03e]%asi,%l0	! %l0 = ffffffffffffff9f

p0_label_127:
!	Mem[00000000300c1400] = 000000ff, %l2 = 0000000000000013
	lduha	[%i3+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141400] = 2a68efb1 00000000, %l2 = 000000ff, %l3 = 1f0394ff
	ldda	[%i5+%g0]0x81,%l2	! %l2 = 000000002a68efb1 0000000000000000
!	Mem[0000000010141400] = 09d3ae0f, %l5 = 0000000000000000
	ldswa	[%i5+%g0]0x88,%l5	! %l5 = 0000000009d3ae0f
!	Mem[0000000030101408] = 00000000ff75e1ac, %l1 = 00000000b1ef682a
	ldxa	[%i4+%o4]0x89,%l1	! %l1 = 00000000ff75e1ac
!	Mem[0000000010141408] = ffff0000, %l1 = 00000000ff75e1ac
	lduwa	[%i5+%o4]0x80,%l1	! %l1 = 00000000ffff0000
!	Mem[0000000010101410] = 0000007c, %l7 = 00000000000000ff
	ldsha	[%i4+%o5]0x88,%l7	! %l7 = 000000000000007c
!	Mem[0000000010041410] = 00000000, %l7 = 000000000000007c
	lduha	[%i1+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 1300000000000000, %l2 = 000000002a68efb1
	ldxa	[%i3+%o4]0x88,%l2	! %l2 = 1300000000000000
!	Mem[000000001000140c] = ffffffff, %l4 = 00000000ff6cea26
	ldswa	[%i0+0x00c]%asi,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = ff30fc3b, %l1 = 00000000ffff0000
	ldstuba	[%i0+%o5]0x81,%l1	! %l1 = 000000ff000000ff

p0_label_128:
!	%f10 = 6146e006 ff4942f9, %l1 = 00000000000000ff
!	Mem[0000000030181430] = c0cb9905a19ba6bd
	add	%i6,0x030,%g1
	stda	%f10,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030181430] = f94249ff06e04661
!	%f30 = 4fb18c0b 98d6ca96, Mem[0000000030001400] = 1f0394ff 0003ffff
	stda	%f30,[%i0+%g0]0x81	! Mem[0000000030001400] = 4fb18c0b 98d6ca96
!	%l3 = 0000000000000000, Mem[0000000021800180] = 409b5fec, %asi = 80
	stha	%l3,[%o3+0x180]%asi	! Mem[0000000021800180] = 00005fec
!	Mem[00000000201c0000] = ffaca250, %l7 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030181400] = 000000c0, %l6 = 00000000ff237eb9
	ldstuba	[%i6+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Code Fragment 4
p0_fragment_8:
!	%l0 = ffffffffffffff9f
	setx	0x12b960a84cd82fa3,%g7,%l0 ! %l0 = 12b960a84cd82fa3
!	%l1 = 00000000000000ff
	setx	0xdf2df917f119efe0,%g7,%l1 ! %l1 = df2df917f119efe0
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 12b960a84cd82fa3
	setx	0x559f08ffe134be60,%g7,%l0 ! %l0 = 559f08ffe134be60
!	%l1 = df2df917f119efe0
	setx	0x6bc89fc814708ccf,%g7,%l1 ! %l1 = 6bc89fc814708ccf
!	Mem[00000000100c1405] = 00ffffff, %l1 = 6bc89fc814708ccf
	ldstub	[%i3+0x005],%l1		! %l1 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (32)
!	%l0 = 559f08ffe134be60, Mem[0000000030081400] = 22e6a49d
	stba	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = 22e6a460
!	%l6 = 0000000000000000, Mem[0000000030041408] = 13afffffa7210000
	stxa	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff75ad65, %l5 = 0000000009d3ae0f
	lduwa	[%i2+%o4]0x80,%l5	! %l5 = 00000000ff75ad65

p0_label_129:
!	%l5 = 00000000ff75ad65, %l4 = ffffffffffffffff, %l4 = ffffffffffffffff
	sub	%l5,%l4,%l4		! %l4 = 00000000ff75ad66
!	Mem[0000000010101410] = 9da4e6220000007c, %f12 = e3248c09 00000000
	ldda	[%i4+%o5]0x88,%f12	! %f12 = 9da4e622 0000007c
!	Mem[0000000030081400] = 22e6a460, %l4 = 00000000ff75ad66
	ldsha	[%i2+%g0]0x89,%l4	! %l4 = ffffffffffffa460
!	Mem[0000000010081408] = 65ad75ff, %l3 = 0000000000000000
	ldswa	[%i2+%o4]0x88,%l3	! %l3 = 0000000065ad75ff
!	Mem[0000000010041408] = 00000000, %l3 = 0000000065ad75ff
	lduwa	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001438] = ff75e1ac, %l2 = 1300000000000000
	ldsha	[%i0+0x03a]%asi,%l2	! %l2 = ffffffffffffe1ac
!	Mem[0000000030141408] = 000000c5000000ff, %l2 = ffffffffffffe1ac
	ldxa	[%i5+%o4]0x89,%l2	! %l2 = 000000c5000000ff
!	Mem[00000000300c1410] = ff6cea26 3aabd7b0, %l4 = ffffa460, %l5 = ff75ad65
	ldda	[%i3+%o5]0x81,%l4	! %l4 = 00000000ff6cea26 000000003aabd7b0
!	Mem[0000000010101408] = ffafffff, %l7 = 00000000000000ff
	lduwa	[%i4+%o4]0x80,%l7	! %l7 = 00000000ffafffff
!	Starting 10 instruction Store Burst
!	%f16 = 7c000000 22e6a49d 000000ff ffff00c0
!	%f20 = 000021a7 00000000 1f03948f c5000000
!	%f24 = 95fffeeb e3f1275a 6146e006 ff4942f9
!	%f28 = ffffffff ffffffff 4fb18c0b 98d6ca96
	stda	%f16,[%i0]ASI_BLK_AIUPL	! Block Store to 0000000010001400

p0_label_130:
!	%f14 = 4fb18c0b 000000ff, Mem[0000000010041400] = 00000000 ff0000b8
	stda	%f14,[%i1+0x000]%asi	! Mem[0000000010041400] = 4fb18c0b 000000ff
!	%l4 = ff6cea26, %l5 = 3aabd7b0, Mem[0000000010181408] = 000000ff ffffffff
	stda	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = ff6cea26 3aabd7b0
!	Mem[0000000010101410] = 0000007c, %l2 = 000000c5000000ff
	ldstuba	[%i4+%o5]0x88,%l2	! %l2 = 0000007c000000ff
!	%l1 = 00000000000000ff, Mem[0000000010101426] = ebfeff95, %asi = 80
	stha	%l1,[%i4+0x026]%asi	! Mem[0000000010101424] = ebfe00ff
!	Mem[0000000030101410] = 00ff006f, %l5 = 000000003aabd7b0
	ldstuba	[%i4+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030041400] = 00ff0000, %l2 = 000000000000007c
	ldstuba	[%i1+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[000000001008140d] = 0000009b, %l2 = 0000000000000000
	ldstuba	[%i2+0x00d]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[00000000201c0001] = ffaca250, %l5 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l5	! %l5 = 000000ac000000ff
!	%l0 = 559f08ffe134be60, Mem[0000000010041408] = 00000000
	stha	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000be60
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000, %l6 = 0000000000000000
	ldsw	[%i1+%o5],%l6		! %l6 = 0000000000000000

p0_label_131:
!	Mem[0000000010141408] = ffff0000000000ff, %f12 = 9da4e622 0000007c
	ldda	[%i5+%o4]0x80,%f12	! %f12 = ffff0000 000000ff
!	Mem[0000000010081410] = b80000ffffffffff, %f14 = 4fb18c0b 000000ff
	ldda	[%i2+%o5]0x88,%f14	! %f14 = b80000ff ffffffff
!	Mem[0000000030101408] = ace175ff, %l1 = 00000000000000ff
	ldsba	[%i4+%o4]0x81,%l1	! %l1 = ffffffffffffffac
!	Mem[00000000300c1408] = ea83a1ff, %l5 = 00000000000000ac
	swapa	[%i3+%o4]0x89,%l5	! %l5 = 00000000ea83a1ff
!	Mem[00000000100c1418] = 00000000, %f0  = 7c000000
	ld	[%i3+0x018],%f0 	! %f0 = 00000000
!	Mem[0000000010041408] = 9da4e6220000be60, %f12 = ffff0000 000000ff
	ldda	[%i1+%o4]0x88,%f12	! %f12 = 9da4e622 0000be60
!	Mem[0000000010101408] = ffafffffff000000, %l4 = 00000000ff6cea26
	ldxa	[%i4+%o4]0x80,%l4	! %l4 = ffafffffff000000
!	Mem[0000000030001410] = 98d6ca963bfc30ff, %f10 = 6146e006 ff4942f9
	ldda	[%i0+%o5]0x89,%f10	! %f10 = 98d6ca96 3bfc30ff
!	%f12 = 9da4e622, %f0  = 00000000 22e6a49d
	fstox	%f12,%f0 		! %f0  = 00000000 00000000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010041400] = 4fb18c0b
	stba	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 00b18c0b

p0_label_132:
!	%l0 = e134be60, %l1 = ffffffac, Mem[0000000030101408] = ff75e1ac 00000000
	stda	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = e134be60 ffffffac
!	%l7 = 00000000ffafffff, Mem[0000000010001428] = f94249ff, %asi = 80
	stha	%l7,[%i0+0x028]%asi	! Mem[0000000010001428] = ffff49ff
!	%l6 = 0000000000000000, Mem[0000000010041400] = 0b8cb100
	stba	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 0b8cb100
	membar	#Sync			! Added by membar checker (33)
!	Mem[000000001000142e] = 06e04661, %l4 = ffafffffff000000
	ldstuba	[%i0+0x02e]%asi,%l4	! %l4 = 00000046000000ff
!	%f23 = c5000000, Mem[0000000010041420] = 00000000
	st	%f23,[%i1+0x020]	! Mem[0000000010041420] = c5000000
!	%l6 = 00000000, %l7 = ffafffff, Mem[00000000300c1408] = ac000000 3bfc30ff
	stda	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000 ffafffff
!	%f4  = 00000000 0000e622, %l1 = ffffffffffffffac
!	Mem[0000000010041430] = 8800735000000000
	add	%i1,0x030,%g1
	stda	%f4,[%g1+%l1]ASI_PST8_P ! Mem[0000000010041430] = 0000005000000000
!	%f22 = 1f03948f c5000000, Mem[0000000010181408] = 26ea6cff b0d7ab3a
	stda	%f22,[%i6+%o4]0x88	! Mem[0000000010181408] = 1f03948f c5000000
!	Mem[0000000030141400] = 2a68efb1, %l6 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l6	! %l6 = 0000002a000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ace175ff, %l7 = 00000000ffafffff
	lduha	[%i6+%g0]0x80,%l7	! %l7 = 000000000000ace1

p0_label_133:
!	Mem[0000000030081408] = ffff00c0, %l6 = 000000000000002a
	ldsba	[%i2+%o4]0x89,%l6	! %l6 = ffffffffffffffc0
!	Mem[0000000030101408] = fffffface134be60, %l6 = ffffffffffffffc0
	ldxa	[%i4+%o4]0x89,%l6	! %l6 = fffffface134be60
!	Mem[000000001010140c] = ff000000, %l6 = fffffface134be60
	ldsw	[%i4+0x00c],%l6		! %l6 = ffffffffff000000
!	Mem[00000000300c1410] = ff6cea26, %f22 = 1f03948f
	lda	[%i3+%o5]0x81,%f22	! %f22 = ff6cea26
!	Mem[0000000020800040] = a7218049, %l3 = 0000000000000000
	ldsb	[%o1+0x040],%l3		! %l3 = ffffffffffffffa7
!	Mem[0000000030041400] = 00ff00ff, %l5 = 00000000ea83a1ff
	lduwa	[%i1+%g0]0x89,%l5	! %l5 = 0000000000ff00ff
!	Mem[00000000300c1410] = b0d7ab3a26ea6cff, %l0 = 559f08ffe134be60
	ldxa	[%i3+%o5]0x89,%l0	! %l0 = b0d7ab3a26ea6cff
!	Mem[0000000010181400] = ace175ff, %l3 = ffffffffffffffa7
	ldub	[%i6+%g0],%l3		! %l3 = 00000000000000ac
!	Mem[0000000030041408] = 0000000000000000, %f14 = b80000ff ffffffff
	ldda	[%i1+%o4]0x81,%f14	! %f14 = 00000000 00000000
!	Starting 10 instruction Store Burst
!	%l0 = 26ea6cff, %l1 = ffffffac, Mem[0000000010001418] = 000000c5 8f94031f
	std	%l0,[%i0+0x018]		! Mem[0000000010001418] = 26ea6cff ffffffac

p0_label_134:
!	Mem[0000000030141410] = d700e3d7, %l2 = 0000000000000000
	ldstuba	[%i5+%o5]0x81,%l2	! %l2 = 000000d7000000ff
!	%f12 = 9da4e622 0000be60, Mem[0000000030001410] = 3bfc30ff 98d6ca96
	stda	%f12,[%i0+%o5]0x89	! Mem[0000000030001410] = 9da4e622 0000be60
!	Mem[00000000218000c1] = 68584245, %l5 = 0000000000ff00ff
	ldstub	[%o3+0x0c1],%l5		! %l5 = 00000058000000ff
!	Mem[0000000010181400] = ace175ff4079e437, %l4 = 0000000000000046, %l0 = b0d7ab3a26ea6cff
	casxa	[%i6]0x80,%l4,%l0	! %l0 = ace175ff4079e437
!	Mem[0000000010001438] = 96cad698, %l4 = 0000000000000046, %asi = 80
	swapa	[%i0+0x038]%asi,%l4	! %l4 = 0000000096cad698
!	%f24 = 95fffeeb e3f1275a, Mem[0000000010081418] = ff30fc3b 96cad698
	stda	%f24,[%i2+0x018]%asi	! Mem[0000000010081418] = 95fffeeb e3f1275a
!	Mem[0000000030101408] = 60be34e1, %l1 = ffffffffffffffac
	swapa	[%i4+%o4]0x81,%l1	! %l1 = 0000000060be34e1
!	Mem[000000001008143c] = ff4942f9, %l0 = ace175ff4079e437, %asi = 80
	swapa	[%i2+0x03c]%asi,%l0	! %l0 = 00000000ff4942f9
!	Mem[0000000010081408] = 65ad75ff, %l5 = 0000000000000058
	swapa	[%i2+%o4]0x88,%l5	! %l5 = 0000000065ad75ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 22e6a49d, %l2 = 00000000000000d7
	ldsha	[%i0+%g0]0x88,%l2	! %l2 = ffffffffffffa49d

p0_label_135:
!	Mem[0000000010141400] = 0faed3090000fdd1, %l5 = 0000000065ad75ff
	ldxa	[%i5+%g0]0x80,%l5	! %l5 = 0faed3090000fdd1
!	Mem[0000000010081408] = 00000058, %f8  = 9da4e622
	lda	[%i2+%o4]0x88,%f8 	! %f8 = 00000058
!	Mem[0000000030141408] = 000000c5 000000ff, %l6 = ff000000, %l7 = 0000ace1
	ldda	[%i5+%o4]0x89,%l6	! %l6 = 00000000000000ff 00000000000000c5
!	Mem[00000000211c0000] = c0fcfc65, %l1 = 0000000060be34e1
	ldub	[%o2+0x001],%l1		! %l1 = 00000000000000fc
!	Mem[00000000300c1408] = 00000000, %l6 = 00000000000000ff
	ldsba	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l2 = ffffffffffffa49d
	lduwa	[%i3+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = 00000058, %l3 = 00000000000000ac
	ldsha	[%i2+%o4]0x88,%l3	! %l3 = 0000000000000058
!	Mem[000000001018143c] = c06cea26, %l2 = 0000000000000000
	ldsb	[%i6+0x03f],%l2		! %l2 = 0000000000000026
!	Mem[0000000030001408] = 0000ff00, %l1 = 00000000000000fc
	ldswa	[%i0+%o4]0x89,%l1	! %l1 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000058, Mem[0000000010081408] = 58000000
	stwa	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000058

p0_label_136:
!	%l5 = 0faed3090000fdd1, Mem[00000000100c1408] = 00000000
	stha	%l5,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000fdd1
!	%f27 = ff4942f9, Mem[0000000030141400] = b1ef68ff
	sta	%f27,[%i5+%g0]0x89	! Mem[0000000030141400] = ff4942f9
!	Mem[0000000030181408] = 0000a721, %l1 = 000000000000ff00
	swapa	[%i6+%o4]0x89,%l1	! %l1 = 000000000000a721
!	%l6 = 0000000000000000, Mem[00000000100c1400] = 0000002c
	stha	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	%l2 = 0000000000000026, Mem[0000000030181410] = 133e7541
	stba	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = 263e7541
!	Mem[00000000201c0001] = ffffa250, %l6 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 000000ff000000ff
!	%f20 = 000021a7 00000000, Mem[0000000010141408] = 0000ffff ff000000
	stda	%f20,[%i5+%o4]0x88	! Mem[0000000010141408] = 000021a7 00000000
!	%f8  = 00000058 21a70000, Mem[0000000010001410] = 00000000 a7210000
	stda	%f8 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000058 21a70000
!	Mem[0000000010001410] = 00000058, %l4 = 96cad698, %l6 = 000000ff
	add	%i0,0x10,%g1
	casa	[%g1]0x80,%l4,%l6	! %l6 = 0000000000000058
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ffff00c0, %l1 = 000000000000a721
	ldsha	[%i0+%o4]0x88,%l1	! %l1 = 00000000000000c0

p0_label_137:
!	Mem[0000000010181410] = 21a70000, %l2 = 0000000000000026
	ldswa	[%i6+%o5]0x80,%l2	! %l2 = 0000000021a70000
!	Mem[0000000030001410] = 60be0000 22e6a49d, %l2 = 21a70000, %l3 = 00000058
	ldda	[%i0+%o5]0x81,%l2	! %l2 = 0000000060be0000 0000000022e6a49d
!	Mem[0000000030181408] = 0000ff00, %f15 = 00000000
	lda	[%i6+%o4]0x89,%f15	! %f15 = 0000ff00
!	Mem[0000000010041400] = 00b18c0b000000ff, %f12 = 9da4e622 0000be60
	ldda	[%i1+%g0]0x80,%f12	! %f12 = 00b18c0b 000000ff
!	Mem[0000000010181410] = 0000a721, %l5 = 0faed3090000fdd1
	lduwa	[%i6+%o5]0x88,%l5	! %l5 = 000000000000a721
!	Mem[0000000030141410] = 002c0000d7e300ff, %f8  = 00000058 21a70000
	ldda	[%i5+%o5]0x89,%f8 	! %f8  = 002c0000 d7e300ff
!	Mem[0000000030001400] = 96cad698 0b8cb14f, %l2 = 60be0000, %l3 = 22e6a49d
	ldda	[%i0+%g0]0x89,%l2	! %l2 = 000000000b8cb14f 0000000096cad698
!	Mem[0000000010001408] = ffff00c0, %l1 = 00000000000000c0
	lduha	[%i0+%o4]0x88,%l1	! %l1 = 00000000000000c0
!	Mem[00000000300c1410] = ff6cea26, %l3 = 0000000096cad698
	lduba	[%i3+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 263e7541, %l3 = 00000000000000ff
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 00000000263e7541

p0_label_138:
!	Mem[00000000201c0001] = ffffa250, %l3 = 00000000263e7541
	ldstub	[%o0+0x001],%l3		! %l3 = 000000ff000000ff
!	Mem[0000000030101400] = b8ad75ba, %l6 = 0000000000000058
	ldstuba	[%i4+%g0]0x81,%l6	! %l6 = 000000b8000000ff
!	%l3 = 00000000000000ff, Mem[0000000030141408] = ff000000
	stha	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = 00ff0000
!	%l0 = 00000000ff4942f9, Mem[0000000030001410] = 0000be60
	stwa	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = ff4942f9
!	Mem[00000000201c0001] = ffffa250, %l5 = 000000000000a721
	ldstub	[%o0+0x001],%l5		! %l5 = 000000ff000000ff
!	%f20 = 000021a7 00000000, Mem[0000000010081418] = 95fffeeb e3f1275a
	std	%f20,[%i2+0x018]	! Mem[0000000010081418] = 000021a7 00000000
!	%l4 = 0000000096cad698, Mem[0000000030041408] = 0000000000000000
	stxa	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000000096cad698
!	%l6 = 000000b8, %l7 = 000000c5, Mem[0000000030101410] = 6f00ffff 00000000
	stda	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000b8 000000c5
!	Mem[00000000201c0000] = ffffa250, %l0 = 00000000ff4942f9
	ldub	[%o0+0x001],%l0		! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ffffafff, %l7 = 00000000000000c5
	ldsba	[%i4+%o4]0x88,%l7	! %l7 = ffffffffffffffff

p0_label_139:
!	Mem[0000000010001410] = 00000058 21a70000, %l2 = 0b8cb14f, %l3 = 000000ff
	ldd	[%i0+%o5],%l2		! %l2 = 0000000000000058 0000000021a70000
!	Mem[0000000030101400] = ba75adff, %l0 = 00000000000000ff
	ldsha	[%i4+%g0]0x89,%l0	! %l0 = ffffffffffffadff
!	Mem[0000000010181408] = c5000000, %l1 = 00000000000000c0
	lduba	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = 000000c5, %l5 = 00000000000000ff
	lduha	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101408] = ffffffac acffffff, %l6 = 000000b8, %l7 = ffffffff
	ldda	[%i4+%o4]0x89,%l6	! %l6 = 00000000acffffff 00000000ffffffac
!	Mem[0000000030041410] = 0000e3ff, %f20 = 000021a7
	lda	[%i1+%o5]0x89,%f20	! %f20 = 0000e3ff
!	Mem[0000000030181410] = 000000ff, %l3 = 0000000021a70000
	ldsba	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = c0fcfc65, %l3 = 0000000000000000
	ldsb	[%o2+%g0],%l3		! %l3 = ffffffffffffffc0
!	Mem[0000000030101400] = 0000009bba75adff, %l7 = 00000000ffffffac
	ldxa	[%i4+%g0]0x89,%l7	! %l7 = 0000009bba75adff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[00000000211c0000] = c0fcfc65, %asi = 80
	stha	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0000fc65

p0_label_140:
!	%f24 = 95fffeeb e3f1275a, Mem[00000000100c1420] = 00000000 ff000000
	std	%f24,[%i3+0x020]	! Mem[00000000100c1420] = 95fffeeb e3f1275a
!	%f4  = 00000000 0000e622, Mem[00000000100c1408] = d1fd0000 00000013
	stda	%f4 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 0000e622
!	%l1 = 0000000000000000, Mem[00000000100c1408] = 00000000
	stba	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	%l6 = 00000000acffffff, Mem[0000000030041400] = 00ff00ff
	stha	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 00ffffff
!	%f28 = ffffffff ffffffff, Mem[00000000300c1400] = ff000000 0000009b
	stda	%f28,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffff ffffffff
!	%l1 = 0000000000000000, Mem[0000000010141428] = 1b676987
	stw	%l1,[%i5+0x028]		! Mem[0000000010141428] = 00000000
!	%f12 = 00b18c0b 000000ff, %l0 = ffffffffffffadff
!	Mem[0000000010041408] = 60be000022e6a49d
	add	%i1,0x008,%g1
	stda	%f12,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010041408] = ff0000000b8cb100
!	%l0 = ffffffffffffadff, Mem[00000000300c1408] = 00000000ffafffff
	stxa	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffffffffffffadff
!	%l6 = 00000000acffffff, Mem[00000000211c0000] = 0000fc65, %asi = 80
	stba	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = ff00fc65
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ffe30000, %l7 = 0000009bba75adff
	ldsba	[%i1+%o5]0x81,%l7	! %l7 = ffffffffffffffff

p0_label_141:
!	Code Fragment 3
p0_fragment_9:
!	%l0 = ffffffffffffadff
	setx	0x8755fc68421f1e44,%g7,%l0 ! %l0 = 8755fc68421f1e44
!	%l1 = 0000000000000000
	setx	0xc51150d85bf95d1e,%g7,%l1 ! %l1 = c51150d85bf95d1e
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8755fc68421f1e44
	setx	0xa6a49a67a5235519,%g7,%l0 ! %l0 = a6a49a67a5235519
!	%l1 = c51150d85bf95d1e
	setx	0x6035911fb2ee0f7a,%g7,%l1 ! %l1 = 6035911fb2ee0f7a
!	Mem[0000000010101408] = 000000ffffffafff, %f4  = 00000000 0000e622
	ldda	[%i4+%o4]0x88,%f4 	! %f4  = 000000ff ffffafff
!	Mem[0000000030041410] = 9b0000000000e3ff, %f8  = 002c0000 d7e300ff
	ldda	[%i1+%o5]0x89,%f8 	! %f8  = 9b000000 0000e3ff
!	Mem[00000000300c1408] = ffffffff, %f22 = ff6cea26
	lda	[%i3+%o4]0x81,%f22	! %f22 = ffffffff
	membar	#Sync			! Added by membar checker (34)
!	Mem[00000000100c1400] = 00000000 00ffffff 00000000 0000e622
!	Mem[00000000100c1410] = ffea6cc0 3aabd7b0 00000000 000000ff
!	Mem[00000000100c1420] = 95fffeeb e3f1275a ff000000 2164d7e3
!	Mem[00000000100c1430] = ff30fc3b ea83a18b b80000ff ffffffff
	ldda	[%i3]ASI_BLK_AIUPL,%f16	! Block Load from 00000000100c1400
!	Mem[0000000010081410] = ffffffff, %l5 = 0000000000000000
	lduba	[%i2+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041410] = 00000000, %l5 = 00000000000000ff
	ldsha	[%i1+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141400] = 00000000ff4942f9, %l7 = ffffffffffffffff
	ldxa	[%i5+%g0]0x89,%l7	! %l7 = 00000000ff4942f9
!	Mem[0000000030101410] = 000000b8, %l7 = 00000000ff4942f9
	lduha	[%i4+%o5]0x89,%l7	! %l7 = 00000000000000b8
!	Starting 10 instruction Store Burst
!	%l4 = 0000000096cad698, Mem[0000000010181400] = ace175ff
	stba	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 98e175ff

p0_label_142:
	membar	#Sync			! Added by membar checker (35)
!	%l6 = 00000000acffffff, Mem[00000000100c1410] = b0d7ab3ac06ceaff
	stxa	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000acffffff
!	%f2  = ff000000, Mem[0000000010181400] = 98e175ff
	sta	%f2 ,[%i6+%g0]0x80	! Mem[0000000010181400] = ff000000
!	Mem[00000000100c1424] = e3f1275a, %l4 = 0000000096cad698, %asi = 80
	swapa	[%i3+0x024]%asi,%l4	! %l4 = 00000000e3f1275a
!	%l0 = a6a49a67a5235519, Mem[000000001008143c] = 4079e437, %asi = 80
	stwa	%l0,[%i2+0x03c]%asi	! Mem[000000001008143c] = a5235519
!	%l2 = 00000058, %l3 = ffffffc0, Mem[0000000010001408] = c000ffff ff000000
	stda	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000058 ffffffc0
!	Mem[00000000211c0001] = ff00fc65, %l6 = 00000000acffffff
	ldstuba	[%o2+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	%l0 = a6a49a67a5235519, Mem[0000000030081400] = 60a4e622
	stwa	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = a5235519
!	%l3 = ffffffffffffffc0, Mem[0000000030141400] = f94249ff00000000
	stxa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffffffffffffc0
!	Mem[0000000030141410] = ff00e3d7, %l7 = 00000000000000b8
	swapa	[%i5+%o5]0x81,%l7	! %l7 = 00000000ff00e3d7
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 00000000, %l3 = ffffffffffffffc0
	lduwa	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000000

p0_label_143:
!	Mem[0000000010041400] = 00b18c0b 000000ff, %l4 = e3f1275a, %l5 = 00000000
	ldda	[%i1+%g0]0x80,%l4	! %l4 = 0000000000b18c0b 00000000000000ff
!	Mem[0000000010141400] = 09d3ae0f, %l6 = 0000000000000000
	lduwa	[%i5+%g0]0x88,%l6	! %l6 = 0000000009d3ae0f
!	Mem[0000000010081408] = 0000005800ff009b, %l1 = 6035911fb2ee0f7a
	ldxa	[%i2+%o4]0x80,%l1	! %l1 = 0000005800ff009b
!	Mem[0000000010141410] = b8677ec61f000000, %l0 = a6a49a67a5235519
	ldxa	[%i5+%o5]0x88,%l0	! %l0 = b8677ec61f000000
!	Mem[0000000030141408] = 00ff0000c5000000, %l7 = 00000000ff00e3d7
	ldxa	[%i5+%o4]0x81,%l7	! %l7 = 00ff0000c5000000
!	Mem[0000000030181410] = 00000000 ff000000, %l4 = 00b18c0b, %l5 = 000000ff
	ldda	[%i6+%o5]0x89,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Mem[00000000100c1410] = ffffffac, %l6 = 0000000009d3ae0f
	ldsba	[%i3+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030001410] = 9da4e622ff4942f9, %f26 = e3d76421 000000ff
	ldda	[%i0+%o5]0x89,%f26	! %f26 = 9da4e622 ff4942f9
!	Mem[0000000010081400] = 26ea6cc0 26ea6cff, %l6 = ffffffff, %l7 = c5000000
	ldda	[%i2+%g0]0x88,%l6	! %l6 = 0000000026ea6cff 0000000026ea6cc0
!	Starting 10 instruction Store Burst
!	%l1 = 0000005800ff009b, Mem[0000000010181400] = ff0000004079e437
	stxa	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000005800ff009b

p0_label_144:
!	%f6  = ace175ff 4079e437, Mem[0000000030001410] = ff4942f9 9da4e622
	stda	%f6 ,[%i0+%o5]0x89	! Mem[0000000030001410] = ace175ff 4079e437
!	%f18 = 22e60000 00000000, Mem[0000000030101408] = acffffff ffffffac
	stda	%f18,[%i4+%o4]0x89	! Mem[0000000030101408] = 22e60000 00000000
!	%f7  = 4079e437, Mem[000000001004141c] = e3248c09
	st	%f7 ,[%i1+0x01c]	! Mem[000000001004141c] = 4079e437
!	%f10 = 98d6ca96 3bfc30ff, %l3 = 0000000000000000
!	Mem[0000000010101430] = ffffffffffffffff
	add	%i4,0x030,%g1
	stda	%f10,[%g1+%l3]ASI_PST32_P ! Mem[0000000010101430] = ffffffffffffffff
!	Mem[0000000010001410] = 0000005821a70000, %l6 = 0000000026ea6cff, %l7 = 0000000026ea6cc0
	add	%i0,0x10,%g1
	casxa	[%g1]0x80,%l6,%l7	! %l7 = 0000005821a70000
!	%l2 = 0000000000000058, Mem[0000000030001400] = 0b8cb14f
	stwa	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000058
!	%f24 = 5a27f1e3, Mem[0000000010041400] = 00b18c0b
	sta	%f24,[%i1+%g0]0x80	! Mem[0000000010041400] = 5a27f1e3
!	Mem[00000000100c1432] = ff30fc3b, %l2 = 0000000000000058
	ldstub	[%i3+0x032],%l2		! %l2 = 000000fc000000ff
!	%l1 = 0000005800ff009b, Mem[0000000010001408] = 00000058
	stb	%l1,[%i0+%o4]		! Mem[0000000010001408] = 9b000058
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00000000, %l1 = 0000005800ff009b
	ldub	[%i5+0x00a],%l1		! %l1 = 0000000000000000

p0_label_145:
!	Mem[0000000010001408] = 9b000058, %l2 = 00000000000000fc
	lduwa	[%i0+%o4]0x80,%l2	! %l2 = 000000009b000058
!	Mem[0000000010181408] = c5000000, %l2 = 000000009b000058
	lduba	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[000000001008142c] = 0000009b, %l3 = 0000000000000000
	ldswa	[%i2+0x02c]%asi,%l3	! %l3 = 000000000000009b
!	Mem[00000000211c0000] = fffffc65, %l7 = 0000005821a70000
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010141410] = 0000001f, %f24 = 5a27f1e3
	lda	[%i5+%o5]0x80,%f24	! %f24 = 0000001f
!	Mem[00000000100c1420] = 95fffeeb 96cad698, %l0 = 1f000000, %l1 = 00000000
	ldda	[%i3+0x020]%asi,%l0	! %l0 = 0000000095fffeeb 0000000096cad698
!	Mem[0000000030181400] = ff0000c0, %f24 = 0000001f
	lda	[%i6+%g0]0x81,%f24	! %f24 = ff0000c0
!	Mem[0000000010081400] = 26ea6cff, %l1 = 0000000096cad698
	lduwa	[%i2+%g0]0x88,%l1	! %l1 = 0000000026ea6cff
!	Mem[0000000010101408] = ffafffffff000000, %l0 = 0000000095fffeeb
	ldxa	[%i4+%o4]0x80,%l0	! %l0 = ffafffffff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000020800000] = ffffdad7, %l1 = 0000000026ea6cff
	ldstub	[%o1+%g0],%l1		! %l1 = 000000ff000000ff

p0_label_146:
!	Mem[0000000010181400] = 58000000, %l4 = 00000000ff000000
	ldstuba	[%i6+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181410] = 21a70000, %l2 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l2	! %l2 = 0000000021a70000
!	%f29 = 3bfc30ff, Mem[000000001008141c] = 00000000
	st	%f29,[%i2+0x01c]	! Mem[000000001008141c] = 3bfc30ff
!	%l4 = 0000000000000000, Mem[0000000030141400] = c0ffffffffffffff
	stxa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030001408] = 0000ff00 00000000
	stda	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000 00000000
!	%f6  = ace175ff, Mem[0000000010001408] = 9b000058
	sta	%f6 ,[%i0+0x008]%asi	! Mem[0000000010001408] = ace175ff
!	%l7 = ffffffffffffffff, Mem[0000000030041408] = 00000000
	stha	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = ffff0000
!	%l5 = 0000000000000000, Mem[00000000300c1400] = ffffffff
	stwa	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	%f24 = ff0000c0 ebfeff95, Mem[0000000030001410] = 37e47940 ff75e1ac
	stda	%f24,[%i0+%o5]0x81	! Mem[0000000030001410] = ff0000c0 ebfeff95
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 95fffeeb c00000ff, %l2 = 21a70000, %l3 = 0000009b
	ldda	[%i0+%o5]0x89,%l2	! %l2 = 00000000c00000ff 0000000095fffeeb

p0_label_147:
!	Mem[0000000030041408] = ffff0000, %l5 = 0000000000000000
	lduba	[%i1+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181400] = 580000ff, %l5 = 00000000000000ff
	lduha	[%i6+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101408] = 22e60000 00000000, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000 0000000022e60000
!	Mem[0000000010041400] = 5a27f1e3, %l2 = 00000000c00000ff
	ldsba	[%i1+%g0]0x80,%l2	! %l2 = 000000000000005a
!	Mem[0000000030001410] = 95fffeeb c00000ff, %l6 = 26ea6cff, %l7 = ffffffff
	ldda	[%i0+%o5]0x89,%l6	! %l6 = 00000000c00000ff 0000000095fffeeb
!	Mem[0000000010041428] = 7646daf5 8bd5e470, %l2 = 0000005a, %l3 = 95fffeeb
	ldda	[%i1+0x028]%asi,%l2	! %l2 = 000000007646daf5 000000008bd5e470
!	Mem[0000000010181408] = c5000000, %l2 = 000000007646daf5
	ldswa	[%i6+%o4]0x88,%l2	! %l2 = ffffffffc5000000
!	Mem[0000000010041408] = ff000000, %l3 = 000000008bd5e470
	lduwa	[%i1+%o4]0x80,%l3	! %l3 = 00000000ff000000
!	Mem[0000000030081408] = ffff00c0, %l5 = 0000000022e60000
	lduha	[%i2+%o4]0x89,%l5	! %l5 = 00000000000000c0
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[00000000211c0000] = fffffc65, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0000fc65

p0_label_148:
!	%l3 = 00000000ff000000, Mem[00000000100c1430] = ff30ff3bea83a18b
	stx	%l3,[%i3+0x030]		! Mem[00000000100c1430] = 00000000ff000000
!	%l4 = 0000000000000000, Mem[0000000030141410] = 000000b800002c00
	stxa	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000000000000000
!	%l6 = 00000000c00000ff, Mem[0000000020800000] = ffffdad7, %asi = 80
	stha	%l6,[%o1+0x000]%asi	! Mem[0000000020800000] = 00ffdad7
!	%f30 = ffffffff, Mem[0000000010101410] = 000000ff
	sta	%f30,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffffff
!	Mem[0000000010181408] = c5000000, %l1 = 00000000000000ff
	ldstuba	[%i6+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%l5 = 00000000000000c0, Mem[0000000010041404] = 000000ff, %asi = 80
	stha	%l5,[%i1+0x004]%asi	! Mem[0000000010041404] = 00c000ff
!	Mem[0000000021800101] = 900c757a, %l2 = ffffffffc5000000
	ldstub	[%o3+0x101],%l2		! %l2 = 0000000c000000ff
!	%l5 = 00000000000000c0, Mem[0000000030001410] = ff0000c0
	stwa	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000c0
!	Mem[0000000010181410] = 00000000, %l7 = 95fffeeb, %l4 = 00000000
	add	%i6,0x10,%g1
	casa	[%g1]0x80,%l7,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000, %l5 = 00000000000000c0
	ldsba	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000000

p0_label_149:
!	Mem[0000000010001400] = 9da4e622, %l4 = 0000000000000000
	ldsha	[%i0+%g0]0x80,%l4	! %l4 = ffffffffffff9da4
!	Mem[00000000100c1400] = 00000000, %f31 = ff0000b8
	lda	[%i3+%g0]0x80,%f31	! %f31 = 00000000
!	Mem[00000000201c0000] = ffffa250, %l5 = 0000000000000000
	lduha	[%o0+0x000]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010141408] = 00000000 a7210000, %l2 = 0000000c, %l3 = ff000000
	ldda	[%i5+0x008]%asi,%l2	! %l2 = 0000000000000000 00000000a7210000
!	Mem[0000000030101408] = 00000000, %l0 = ffafffffff000000
	ldsba	[%i4+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041410] = ffe30000, %l0 = 0000000000000000
	ldsha	[%i1+%o5]0x81,%l0	! %l0 = ffffffffffffffe3
!	Mem[0000000010181428] = ffff00c0ff760000, %f30 = ffffffff 00000000
	ldda	[%i6+0x028]%asi,%f30	! %f30 = ffff00c0 ff760000
!	Mem[00000000100c1400] = 00000000, %l0 = ffffffffffffffe3
	ldswa	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = ff000000, %l5 = 000000000000ffff
	ldswa	[%i6+%o5]0x89,%l5	! %l5 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[00000000100c1421] = 95fffeeb
	stb	%l2,[%i3+0x021]		! Mem[00000000100c1420] = 9500feeb

p0_label_150:
!	%f0  = 00000000 00000000 ff000000 000000ff
!	%f4  = 000000ff ffffafff ace175ff 4079e437
!	%f8  = 9b000000 0000e3ff 98d6ca96 3bfc30ff
!	%f12 = 00b18c0b 000000ff 00000000 0000ff00
	stda	%f0,[%i1]ASI_COMMIT_P	! Block Store to 0000000010041400
!	Mem[00000000201c0000] = ffffa250, %l1 = 0000000000000000
	ldstub	[%o0+%g0],%l1		! %l1 = 000000ff000000ff
!	%f16 = ffffff00 00000000, Mem[0000000030081410] = 00000000 a7210000
	stda	%f16,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffff00 00000000
!	%f22 = ff000000, Mem[0000000030181400] = ff0000c0
	sta	%f22,[%i6+%g0]0x81	! Mem[0000000030181400] = ff000000
!	Mem[0000000030181408] = 0000ff00, %l6 = 00000000c00000ff
	ldstuba	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i5+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%l4 = ffffffffffff9da4, Mem[0000000030141410] = 000000ff
	stha	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 00009da4
!	%f26 = 9da4e622, Mem[0000000010001404] = 0000007c
	st	%f26,[%i0+0x004]	! Mem[0000000010001404] = 9da4e622
	membar	#Sync			! Added by membar checker (36)
!	Mem[0000000010041400] = 00000000, %l2 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000, %f10 = 98d6ca96
	lda	[%i6+%o5]0x88,%f10	! %f10 = 00000000

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	fitod	%f27,%f4
	lduw	[%i1+0x028],%l4
	ldsba	[%i2+0x01e]%asi,%l5
	umul	%l0,%l1,%l5
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
	cmp	%l1,%g2			! %l1 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 00000000a7210000
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be ffffffffffff9da4
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be ffffffffff000000
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000095fffeeb
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check Floating Point Registers

p0_check_fp_registers:
	set	p0_expected_fp_regs,%g3
	std	%f0,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x00],%l0
	cmp	%l0,%l1			! %f0  should be 00000000 00000000
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be ff000000 000000ff
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 000000ff ffffafff
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be ace175ff 4079e437
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 9b000000 0000e3ff
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000000 3bfc30ff
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 00b18c0b 000000ff
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 00000000 0000ff00
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be ffffff00 00000000
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 22e60000 00000000
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be b0d7ab3a c06ceaff
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be ff000000 00000000
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be ff0000c0 ebfeff95
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 9da4e622 ff4942f9
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 8ba183ea 3bfc30ff
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be ffff00c0 ff760000
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
	and	%l5,%l3,%l2
	done

p0_trap1o:
	and	%l5,%l3,%l2
	done


p0_trap2e:
	fitos	%f9 ,%f6 
	addc	%l4,-0x8d1,%l2
	ldstuba	[%i1+%o4]ASI_AS_IF_USER_PRIMARY,%l3	! Mem[0000000010041408]
	fstoi	%f0 ,%f6 
	done

p0_trap2o:
	fitos	%f9 ,%f6 
	addc	%l4,-0x8d1,%l2
	ldstuba	[%o1+%i4]ASI_AS_IF_USER_PRIMARY,%l3	! Mem[0000000010041408]
	fstoi	%f0 ,%f6 
	done


p0_trap3e:
	addc	%l1,-0x446,%l2
	and	%l0,%l3,%l3
	orn	%l7,%l3,%l0
	xor	%l5,%l4,%l5
	done

p0_trap3o:
	addc	%l1,-0x446,%l2
	and	%l0,%l3,%l3
	orn	%l7,%l3,%l0
	xor	%l5,%l4,%l5
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
	ldx	[%g1+0x000],%l0		! %l0 = b99ac5c452e46c99
	ldx	[%g1+0x008],%l1		! %l1 = 8c0ec69aae2fb43e
	ldx	[%g1+0x010],%l2		! %l2 = dbf710bdfb5aa8dd
	ldx	[%g1+0x018],%l3		! %l3 = fb61541a352c50cb
	ldx	[%g1+0x020],%l4		! %l4 = 44d88924bd72b1f6
	ldx	[%g1+0x028],%l5		! %l5 = 29eb9f341b6781fc
	ldx	[%g1+0x030],%l6		! %l6 = 5b88876e58793366
	ldx	[%g1+0x038],%l7		! %l7 = 1b505269f557d8dc

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
	ldx	[%i0+0x010],%l6		! Mem[0000000010001410]
	ldsh	[%i0+0x03e],%l0		! Mem[000000001000143e]
	jmpl	%o7,%g0
	fdtos	%f2 ,%f2 
p0_near_0_he:
	stw	%l4,[%i2+0x01c]		! Mem[000000001008141c]
	std	%l0,[%i1+0x000]		! Mem[0000000010041400]
	lduh	[%i1+0x012],%l4		! Mem[0000000010041412]
	fitod	%f29,%f22
	jmpl	%o7,%g0
	smul	%l1,0xc8a,%l4
near0_b2b_h:
	fadds	%f19,%f25,%f31
	fadds	%f16,%f30,%f21
	fsubs	%f16,%f20,%f17
	xnor	%l0,%l4,%l5
	sub	%l3,%l7,%l4
	jmpl	%o7,%g0
	fdtoi	%f18,%f30
near0_b2b_l:
	fsqrts	%f11,%f15
	sub	%l0,%l6,%l0
	add	%l1,%l7,%l0
	fsqrts	%f5 ,%f1 
	fstod	%f0 ,%f12
	jmpl	%o7,%g0
	fsqrts	%f3 ,%f4 
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	ld	[%i5+0x028],%f5 	! Mem[0000000010141428]
	fadds	%f4 ,%f7 ,%f1 
	addc	%l2,0x8d5,%l0
	mulx	%l5,-0xc4e,%l0
	jmpl	%o7,%g0
	ldsw	[%i2+0x03c],%l7		! Mem[000000001008143c]
p0_near_1_he:
	xnor	%l4,%l4,%l4
	addc	%l7,0x824,%l6
	swap	[%i3+0x03c],%l1		! Mem[00000000100c143c]
	jmpl	%o7,%g0
	st	%f22,[%i4+0x020]	! Mem[0000000010101420]
near1_b2b_h:
	fdtoi	%f20,%f23
	sub	%l1,0x5fc,%l2
	addc	%l7,0xc59,%l0
	jmpl	%o7,%g0
	fstoi	%f16,%f22
near1_b2b_l:
	sdivx	%l3,0xa8f,%l0
	fadds	%f1 ,%f5 ,%f15
	or	%l3,-0x5ba,%l6
	jmpl	%o7,%g0
	fstod	%f9 ,%f6 
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	fsqrts	%f0 ,%f11
	ldsw	[%i6+0x01c],%l0		! Mem[000000001018141c]
	ldstub	[%i6+0x021],%l6		! Mem[0000000010181421]
	ldsh	[%i5+0x038],%l7		! Mem[0000000010141438]
	sdivx	%l0,%l5,%l5
	fitod	%f3 ,%f12
	ld	[%i1+0x028],%f15	! Mem[0000000010041428]
	jmpl	%o7,%g0
	fsqrts	%f14,%f13
p0_near_2_he:
	ldd	[%i1+0x008],%f28	! Mem[0000000010041408]
	sth	%l1,[%i2+0x034]		! Mem[0000000010081434]
	lduh	[%i6+0x016],%l7		! Mem[0000000010181416]
	add	%l5,-0xdfc,%l0
	jmpl	%o7,%g0
	fitod	%f30,%f20
near2_b2b_h:
	andn	%l4,-0xe7e,%l6
	sdivx	%l4,%l0,%l0
	jmpl	%o7,%g0
	xnor	%l0,%l0,%l2
near2_b2b_l:
	sub	%l5,%l6,%l7
	fsubs	%f5 ,%f6 ,%f0 
	jmpl	%o7,%g0
	add	%l0,%l7,%l3
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	fdtoi	%f10,%f15
	lduh	[%i5+0x034],%l6		! Mem[0000000010141434]
	jmpl	%o7,%g0
	fdtos	%f8 ,%f3 
p0_near_3_he:
	ldsb	[%i3+0x01a],%l1		! Mem[00000000100c141a]
	fitod	%f20,%f28
	orn	%l1,%l4,%l4
	ldsw	[%i0+0x018],%l4		! Mem[0000000010001418]
	subc	%l3,%l6,%l7
	jmpl	%o7,%g0
	lduh	[%i5+0x034],%l3		! Mem[0000000010141434]
near3_b2b_h:
	jmpl	%o7,%g0
	sub	%l4,%l4,%l1
	jmpl	%o7,%g0
	nop
near3_b2b_l:
	jmpl	%o7,%g0
	fadds	%f4 ,%f2 ,%f4 
	jmpl	%o7,%g0
	nop
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	jmpl	%o7,%g0
	subc	%l2,%l4,%l2
	jmpl	%o7,%g0
	nop
p0_far_0_lem:
	jmpl	%o7,%g0
	subc	%l2,%l4,%l2
	jmpl	%o7,%g0
	nop
p0_far_0_he:
	ldsh	[%i2+0x036],%l1		! Mem[0000000010081436]
	jmpl	%o7,%g0
	fsqrts	%f17,%f29
p0_far_0_hem:
	membar	#Sync
	ldsh	[%i2+0x036],%l1		! Mem[0000000010081436]
	jmpl	%o7,%g0
	fsqrts	%f17,%f29
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	fitod	%f27,%f20
	fsqrts	%f20,%f20
	fadds	%f28,%f17,%f24
	subc	%l3,-0x362,%l4
	jmpl	%o7,%g0
	fdivs	%f20,%f29,%f27
far0_b2b_l:
	subc	%l0,%l6,%l4
	xnor	%l0,-0x83d,%l1
	smul	%l7,%l3,%l5
	andn	%l4,%l1,%l0
	jmpl	%o7,%g0
	sub	%l2,-0xc84,%l7
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	fdtoi	%f8 ,%f15
	sth	%l5,[%i0+0x024]		! Mem[0000000010001424]
	ldsw	[%i2+0x030],%l6		! Mem[0000000010081430]
	jmpl	%o7,%g0
	sub	%l2,0xbdf,%l0
p0_far_1_lem:
	fdtoi	%f8 ,%f15
	membar	#Sync
	sth	%l5,[%i0+0x024]		! Mem[0000000010001424]
	ldsw	[%i2+0x030],%l6		! Mem[0000000010081430]
	jmpl	%o7,%g0
	sub	%l2,0xbdf,%l0
p0_far_1_he:
	udivx	%l4,%l7,%l4
	ldd	[%i2+0x030],%f20	! Mem[0000000010081430]
	smul	%l4,%l1,%l7
	stb	%l2,[%i2+0x026]		! Mem[0000000010081426]
	ldstub	[%o3+0x180],%l5		! Mem[0000000021800180]
	jmpl	%o7,%g0
	fadds	%f25,%f23,%f16
p0_far_1_hem:
	udivx	%l4,%l7,%l4
	membar	#Sync
	ldd	[%i2+0x030],%f20	! Mem[0000000010081430]
	smul	%l4,%l1,%l7
	stb	%l2,[%i2+0x026]		! Mem[0000000010081426]
	ldstub	[%o3+0x180],%l5		! Mem[0000000021800180]
	jmpl	%o7,%g0
	fadds	%f25,%f23,%f16
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	udivx	%l2,%l7,%l4
	nop
	mulx	%l1,%l3,%l4
	jmpl	%o7,%g0
	fstod	%f26,%f24
far1_b2b_l:
	mulx	%l3,0xca3,%l1
	andn	%l5,%l1,%l5
	nop
	jmpl	%o7,%g0
	fstod	%f9 ,%f2 
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	ldub	[%i6+0x039],%l1		! Mem[0000000010181439]
	ldsb	[%i3+0x036],%l2		! Mem[00000000100c1436]
	fmuls	%f10,%f8 ,%f10
	std	%f2 ,[%i4+0x018]	! Mem[0000000010101418]
	jmpl	%o7,%g0
	stb	%l3,[%i2+0x017]		! Mem[0000000010081417]
p0_far_2_lem:
	membar	#Sync
	ldub	[%i6+0x039],%l1		! Mem[0000000010181439]
	ldsb	[%i3+0x036],%l2		! Mem[00000000100c1436]
	fmuls	%f10,%f8 ,%f10
	std	%f2 ,[%i4+0x018]	! Mem[0000000010101418]
	membar	#Sync
	jmpl	%o7,%g0
	stb	%l3,[%i2+0x017]		! Mem[0000000010081417]
p0_far_2_he:
	xor	%l2,-0x8c9,%l2
	jmpl	%o7,%g0
	lduw	[%i3+0x00c],%l3		! Mem[00000000100c140c]
p0_far_2_hem:
	xor	%l2,-0x8c9,%l2
	membar	#Sync
	jmpl	%o7,%g0
	lduw	[%i3+0x00c],%l3		! Mem[00000000100c140c]
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	fsqrts	%f22,%f25
	sub	%l4,%l3,%l6
	and	%l1,0x237,%l5
	fstoi	%f26,%f29
	umul	%l5,%l1,%l0
	jmpl	%o7,%g0
	orn	%l0,0x456,%l4
far2_b2b_l:
	fstoi	%f6 ,%f8 
	xnor	%l7,0x155,%l4
	smul	%l2,-0xf1c,%l6
	fitos	%f10,%f2 
	fdtos	%f10,%f12
	jmpl	%o7,%g0
	umul	%l7,-0xc6a,%l4
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	stw	%l5,[%i3+0x008]		! Mem[00000000100c1408]
	std	%f6 ,[%i1+0x018]	! Mem[0000000010041418]
	xor	%l6,%l1,%l5
	andn	%l0,%l0,%l5
	xor	%l4,0x73a,%l6
	nop
	jmpl	%o7,%g0
	lduh	[%i3+0x008],%l6		! Mem[00000000100c1408]
p0_far_3_lem:
	membar	#Sync
	stw	%l5,[%i3+0x008]		! Mem[00000000100c1408]
	std	%f6 ,[%i1+0x018]	! Mem[0000000010041418]
	xor	%l6,%l1,%l5
	andn	%l0,%l0,%l5
	xor	%l4,0x73a,%l6
	nop
	membar	#Sync
	jmpl	%o7,%g0
	lduh	[%i3+0x008],%l6		! Mem[00000000100c1408]
p0_far_3_he:
	ldx	[%i1+0x018],%l3		! Mem[0000000010041418]
	stb	%l1,[%i5+0x00f]		! Mem[000000001014140f]
	ld	[%i5+0x008],%f24	! Mem[0000000010141408]
	xnor	%l4,0x5e1,%l0
	ldsb	[%i4+0x035],%l6		! Mem[0000000010101435]
	addc	%l6,%l3,%l2
	jmpl	%o7,%g0
	add	%l5,-0x373,%l6
p0_far_3_hem:
	membar	#Sync
	ldx	[%i1+0x018],%l3		! Mem[0000000010041418]
	stb	%l1,[%i5+0x00f]		! Mem[000000001014140f]
	ld	[%i5+0x008],%f24	! Mem[0000000010141408]
	xnor	%l4,0x5e1,%l0
	ldsb	[%i4+0x035],%l6		! Mem[0000000010101435]
	addc	%l6,%l3,%l2
	jmpl	%o7,%g0
	add	%l5,-0x373,%l6
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	xnor	%l0,0x81b,%l0
	and	%l4,%l5,%l5
	orn	%l3,0x378,%l0
	fsubs	%f29,%f17,%f24
	sub	%l3,%l6,%l6
	jmpl	%o7,%g0
	umul	%l2,0xc0e,%l1
far3_b2b_l:
	fsubs	%f4 ,%f10,%f2 
	fdivs	%f2 ,%f2 ,%f0 
	fitos	%f2 ,%f9 
	and	%l2,%l4,%l5
	and	%l1,0xcda,%l6
	jmpl	%o7,%g0
	mulx	%l7,0xf3d,%l0
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	std	%f6 ,[%i0+0x038]	! Mem[0000000010001438]
	addc	%l0,0x3b6,%l4
	jmpl	%g6+8,%g0
	fmuls	%f13,%f6 ,%f14
p0_call_0_le:
	subc	%l6,-0x19b,%l5
	smul	%l4,0x46b,%l2
	andn	%l4,-0xb21,%l0
	ldstub	[%i1+0x001],%l2		! Mem[0000000010041401]
	stw	%l6,[%i5+0x01c]		! Mem[000000001014141c]
	smul	%l0,-0xd95,%l2
	smul	%l4,0xa8b,%l5
	retl
	st	%f7 ,[%i3+0x004]	! Mem[00000000100c1404]
p0_jmpl_0_lo:
	std	%f6 ,[%o0+0x038]	! Mem[0000000010001438]
	addc	%l0,0x3b6,%l4
	jmpl	%g6+8,%g0
	fmuls	%f13,%f6 ,%f14
p0_call_0_lo:
	subc	%l6,-0x19b,%l5
	smul	%l4,0x46b,%l2
	andn	%l4,-0xb21,%l0
	ldstub	[%o1+0x001],%l2		! Mem[0000000010041401]
	stw	%l6,[%o5+0x01c]		! Mem[000000001014141c]
	smul	%l0,-0xd95,%l2
	smul	%l4,0xa8b,%l5
	retl
	st	%f7 ,[%o3+0x004]	! Mem[00000000100c1404]
p0_jmpl_0_he:
	ldsb	[%i5+0x020],%l7		! Mem[0000000010141420]
	fitos	%f17,%f19
	jmpl	%g6+8,%g0
	ldstub	[%i6+0x038],%l4		! Mem[0000000010181438]
p0_call_0_he:
	ld	[%i2+0x00c],%f31	! Mem[000000001008140c]
	nop
	fsubs	%f24,%f19,%f23
	stb	%l3,[%i5+0x025]		! Mem[0000000010141425]
	retl
	swap	[%i2+0x02c],%l2		! Mem[000000001008142c]
p0_jmpl_0_ho:
	ldsb	[%o5+0x020],%l7		! Mem[0000000010141420]
	fitos	%f17,%f19
	jmpl	%g6+8,%g0
	ldstub	[%o6+0x038],%l4		! Mem[0000000010181438]
p0_call_0_ho:
	ld	[%o2+0x00c],%f31	! Mem[000000001008140c]
	nop
	fsubs	%f24,%f19,%f23
	stb	%l3,[%o5+0x025]		! Mem[0000000010141425]
	retl
	swap	[%o2+0x02c],%l2		! Mem[000000001008142c]
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	ldsw	[%i4+0x020],%l5		! Mem[0000000010101420]
	smul	%l4,%l0,%l3
	lduw	[%i1+0x018],%l7		! Mem[0000000010041418]
	std	%f10,[%i6+0x030]	! Mem[0000000010181430]
	ldsh	[%i4+0x03a],%l5		! Mem[000000001010143a]
	fdtos	%f14,%f12
	stb	%l5,[%i4+0x01b]		! Mem[000000001010141b]
	jmpl	%g6+8,%g0
	stb	%l6,[%i6+0x022]		! Mem[0000000010181422]
p0_call_1_le:
	ldx	[%i2+0x018],%l2		! Mem[0000000010081418]
	ldsb	[%i1+0x00a],%l0		! Mem[000000001004140a]
	std	%l4,[%i4+0x038]		! Mem[0000000010101438]
	ldstub	[%o1+0x000],%l2		! Mem[0000000020800000]
	or	%l4,%l5,%l7
	swap	[%i3+0x008],%l6		! Mem[00000000100c1408]
	ldd	[%i5+0x008],%f8 	! Mem[0000000010141408]
	retl
	swap	[%i5+0x00c],%l2		! Mem[000000001014140c]
p0_jmpl_1_lo:
	ldsw	[%o4+0x020],%l5		! Mem[0000000010101420]
	smul	%l4,%l0,%l3
	lduw	[%o1+0x018],%l7		! Mem[0000000010041418]
	std	%f10,[%o6+0x030]	! Mem[0000000010181430]
	ldsh	[%o4+0x03a],%l5		! Mem[000000001010143a]
	fdtos	%f14,%f12
	stb	%l5,[%o4+0x01b]		! Mem[000000001010141b]
	jmpl	%g6+8,%g0
	stb	%l6,[%o6+0x022]		! Mem[0000000010181422]
p0_call_1_lo:
	ldx	[%o2+0x018],%l2		! Mem[0000000010081418]
	ldsb	[%o1+0x00a],%l0		! Mem[000000001004140a]
	std	%l4,[%o4+0x038]		! Mem[0000000010101438]
	ldstub	[%i1+0x000],%l2		! Mem[0000000020800000]
	or	%l4,%l5,%l7
	swap	[%o3+0x008],%l6		! Mem[00000000100c1408]
	ldd	[%o5+0x008],%f8 	! Mem[0000000010141408]
	retl
	swap	[%o5+0x00c],%l2		! Mem[000000001014140c]
p0_jmpl_1_he:
	orn	%l7,-0xd82,%l5
	fsqrts	%f29,%f19
	orn	%l2,-0x864,%l1
	lduw	[%i4+0x00c],%l5		! Mem[000000001010140c]
	std	%l6,[%i0+0x028]		! Mem[0000000010001428]
	swap	[%i2+0x010],%l5		! Mem[0000000010081410]
	fsqrts	%f23,%f24
	jmpl	%g6+8,%g0
	sth	%l6,[%i4+0x018]		! Mem[0000000010101418]
p0_call_1_he:
	stb	%l4,[%i5+0x014]		! Mem[0000000010141414]
	sub	%l4,0x1ca,%l3
	lduh	[%i6+0x000],%l2		! Mem[0000000010181400]
	mulx	%l0,%l7,%l3
	ldd	[%i5+0x018],%l0		! Mem[0000000010141418]
	retl
	stb	%l0,[%i0+0x00c]		! Mem[000000001000140c]
p0_jmpl_1_ho:
	orn	%l7,-0xd82,%l5
	fsqrts	%f29,%f19
	orn	%l2,-0x864,%l1
	lduw	[%o4+0x00c],%l5		! Mem[000000001010140c]
	std	%l6,[%o0+0x028]		! Mem[0000000010001428]
	swap	[%o2+0x010],%l5		! Mem[0000000010081410]
	fsqrts	%f23,%f24
	jmpl	%g6+8,%g0
	sth	%l6,[%o4+0x018]		! Mem[0000000010101418]
p0_call_1_ho:
	stb	%l4,[%o5+0x014]		! Mem[0000000010141414]
	sub	%l4,0x1ca,%l3
	lduh	[%o6+0x000],%l2		! Mem[0000000010181400]
	mulx	%l0,%l7,%l3
	ldd	[%o5+0x018],%l0		! Mem[0000000010141418]
	retl
	stb	%l0,[%o0+0x00c]		! Mem[000000001000140c]
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	std	%f4 ,[%i0+0x038]	! Mem[0000000010001438]
	subc	%l4,%l3,%l7
	std	%f2 ,[%i5+0x000]	! Mem[0000000010141400]
	mulx	%l3,-0xb4e,%l6
	jmpl	%g6+8,%g0
	lduw	[%i3+0x02c],%l2		! Mem[00000000100c142c]
p0_call_2_le:
	addc	%l4,0x5ef,%l4
	retl
	stb	%l0,[%i3+0x015]		! Mem[00000000100c1415]
p0_jmpl_2_lo:
	std	%f4 ,[%o0+0x038]	! Mem[0000000010001438]
	subc	%l4,%l3,%l7
	std	%f2 ,[%o5+0x000]	! Mem[0000000010141400]
	mulx	%l3,-0xb4e,%l6
	jmpl	%g6+8,%g0
	lduw	[%o3+0x02c],%l2		! Mem[00000000100c142c]
p0_call_2_lo:
	addc	%l4,0x5ef,%l4
	retl
	stb	%l0,[%o3+0x015]		! Mem[00000000100c1415]
p0_jmpl_2_he:
	fadds	%f20,%f20,%f19
	fsqrts	%f23,%f18
	ldx	[%i5+0x018],%l6		! Mem[0000000010141418]
	and	%l7,-0xf3d,%l5
	jmpl	%g6+8,%g0
	umul	%l5,%l6,%l4
p0_call_2_he:
	retl
	xnor	%l1,0xc32,%l5
p0_jmpl_2_ho:
	fadds	%f20,%f20,%f19
	fsqrts	%f23,%f18
	ldx	[%o5+0x018],%l6		! Mem[0000000010141418]
	and	%l7,-0xf3d,%l5
	jmpl	%g6+8,%g0
	umul	%l5,%l6,%l4
p0_call_2_ho:
	retl
	xnor	%l1,0xc32,%l5
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	swap	[%i1+0x028],%l3		! Mem[0000000010041428]
	xnor	%l1,%l3,%l2
	ldstub	[%o1+0x000],%l6		! Mem[0000000020800000]
	xnor	%l5,%l4,%l1
	ldstub	[%i4+0x02e],%l7		! Mem[000000001010142e]
	fstod	%f13,%f8 
	jmpl	%g6+8,%g0
	fadds	%f8 ,%f3 ,%f5 
p0_call_3_le:
	sub	%l7,-0x949,%l4
	fstod	%f4 ,%f14
	sub	%l6,0x4e3,%l3
	andn	%l4,-0xc53,%l7
	fitos	%f10,%f6 
	std	%f6 ,[%i2+0x008]	! Mem[0000000010081408]
	retl
	fmuls	%f6 ,%f3 ,%f1 
p0_jmpl_3_lo:
	swap	[%o1+0x028],%l3		! Mem[0000000010041428]
	xnor	%l1,%l3,%l2
	ldstub	[%i1+0x000],%l6		! Mem[0000000020800000]
	xnor	%l5,%l4,%l1
	ldstub	[%o4+0x02e],%l7		! Mem[000000001010142e]
	fstod	%f13,%f8 
	jmpl	%g6+8,%g0
	fadds	%f8 ,%f3 ,%f5 
p0_call_3_lo:
	sub	%l7,-0x949,%l4
	fstod	%f4 ,%f14
	sub	%l6,0x4e3,%l3
	andn	%l4,-0xc53,%l7
	fitos	%f10,%f6 
	std	%f6 ,[%o2+0x008]	! Mem[0000000010081408]
	retl
	fmuls	%f6 ,%f3 ,%f1 
p0_jmpl_3_he:
	jmpl	%g6+8,%g0
	st	%f22,[%i6+0x03c]	! Mem[000000001018143c]
p0_call_3_he:
	xnor	%l7,%l1,%l6
	stw	%l3,[%i6+0x02c]		! Mem[000000001018142c]
	fitos	%f16,%f27
	retl
	ldd	[%i1+0x000],%l2		! Mem[0000000010041400]
p0_jmpl_3_ho:
	jmpl	%g6+8,%g0
	st	%f22,[%o6+0x03c]	! Mem[000000001018143c]
p0_call_3_ho:
	xnor	%l7,%l1,%l6
	stw	%l3,[%o6+0x02c]		! Mem[000000001018142c]
	fitos	%f16,%f27
	retl
	ldd	[%o1+0x000],%l2		! Mem[0000000010041400]
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
	.word	0xb99ac5c4,0x52e46c99		! Init value for %l0
	.word	0x8c0ec69a,0xae2fb43e		! Init value for %l1
	.word	0xdbf710bd,0xfb5aa8dd		! Init value for %l2
	.word	0xfb61541a,0x352c50cb		! Init value for %l3
	.word	0x44d88924,0xbd72b1f6		! Init value for %l4
	.word	0x29eb9f34,0x1b6781fc		! Init value for %l5
	.word	0x5b88876e,0x58793366		! Init value for %l6
	.word	0x1b505269,0xf557d8dc		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xf94249ad,0xb1c2eccd		! Init value for %f0 
	.word	0xfa4f0f60,0xa7af83e9		! Init value for %f2 
	.word	0xbda69ba1,0x0599a0f2		! Init value for %f4 
	.word	0x49fbd613,0x0b914ad0		! Init value for %f6 
	.word	0x8f9419ff,0x74cf9048		! Init value for %f8 
	.word	0x684f1716,0x473bf102		! Init value for %f10
	.word	0x7230fc3b,0x96cad698		! Init value for %f12
	.word	0xbb2707a5,0x3e00102c		! Init value for %f14
	.word	0xba75ad65,0x1f57c39b		! Init value for %f16
	.word	0xc64eb61b,0x4b875e3d		! Init value for %f18
	.word	0x7004603e,0x5031f144		! Init value for %f20
	.word	0x8e062548,0x73e08d46		! Init value for %f22
	.word	0xb02846e0,0x6679adcd		! Init value for %f24
	.word	0x6c22320e,0xfde08795		! Init value for %f26
	.word	0xe35a6faa,0x701e00d3		! Init value for %f28
	.word	0xc096dffb,0xd6a9a9c3		! Init value for %f30
	.word	0xbffcb3fa,0xa8e00da5		! Init value for %f32
	.word	0x8d29a9e2,0x6f24de51		! Init value for %f34
	.word	0xa9ec5791,0xea7a4371		! Init value for %f36
	.word	0x19f71669,0x7ff40f01		! Init value for %f38
	.word	0xf51daba6,0xc2a08900		! Init value for %f40
	.word	0x12b6c07e,0x6a89d15e		! Init value for %f42
	.word	0x2fec52a3,0x39190918		! Init value for %f44
	.word	0x10bb4072,0x564559fe		! Init value for %f46
	.word	0x60e6fa39,0x53e79601
	.word	0xee9f5d45,0x5b1a17bb
	.word	0xed77d1e7,0x81e58910
	.word	0x3d0e2b64,0xc4c8c7ba
	.word	0xc656e1c0,0x293f487f
	.word	0xb5664a4f,0xc0a10ac6
	.word	0x7ffaa62f,0x2805e131
	.word	0x3aa8c1fa,0x757855ad
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
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x00000000
	.word	0x00000000,0xa7210000
	.word	0xffffffff,0xffff9da4
	.word	0xffffffff,0xff000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x95fffeeb
p0_expected_fp_regs:
	.word	0x00000000,0x00000000
	.word	0xff000000,0x000000ff
	.word	0x000000ff,0xffffafff
	.word	0xace175ff,0x4079e437
	.word	0x9b000000,0x0000e3ff
	.word	0x00000000,0x3bfc30ff
	.word	0x00b18c0b,0x000000ff
	.word	0x00000000,0x0000ff00
	.word	0xffffff00,0x00000000
	.word	0x22e60000,0x00000000
	.word	0xb0d7ab3a,0xc06ceaff
	.word	0xff000000,0x00000000
	.word	0xff0000c0,0xebfeff95
	.word	0x9da4e622,0xff4942f9
	.word	0x8ba183ea,0x3bfc30ff
	.word	0xffff00c0,0xff760000
	.word	0x00000000,0x00000000		! %fsr = 0000000000000000
p0_local0_expect:
	.word	0x9da4e622,0x9da4e622
	.word	0xace175ff,0xffffffc0
	.word	0x00000058,0x21a70000
	.word	0x26ea6cff,0xffffffac
	.word	0x5a27f1e3,0xebfeff95
	.word	0xffff49ff,0x06e0ff61
	.word	0xffffffff,0xffffffff
	.word	0x00000046,0x0b8cb14f
p0_local0_sec_expect:
	.word	0x58000000,0x98d6ca96
	.word	0x00000000,0x00000000
	.word	0x000000c0,0xebfeff95
	.word	0x684f1716,0x473bf102
	.word	0x0d0a591f,0x48d9091d
	.word	0x1d3f70e4,0x65ad75ba
	.word	0xa4487646,0x0b8cb14f
	.word	0x2ee436eb,0xcda6351e
p0_local1_expect:
	.word	0x00000000,0x00000000
	.word	0xff000000,0x000000ff
	.word	0x000000ff,0xffffafff
	.word	0xace175ff,0x4079e437
	.word	0x9b000000,0x0000e3ff
	.word	0x98d6ca96,0x3bfc30ff
	.word	0x00b18c0b,0x000000ff
	.word	0x00000000,0x0000ff00
p0_local1_sec_expect:
	.word	0xffffff00,0xc5000000
	.word	0xffff0000,0x96cad698
	.word	0xffe30000,0x0000009b
	.word	0x1f03948f,0xc5000000
	.word	0x000000c5,0x8f94031f
	.word	0x6146e006,0xff4942f9
	.word	0xffffffff,0xffffffff
	.word	0x4fb18c0b,0x9b000000
p0_local2_expect:
	.word	0xff6cea26,0xc06cea26
	.word	0x00000058,0x00ff009b
	.word	0xffffffff,0xff0000b8
	.word	0x000021a7,0x3bfc30ff
	.word	0x7c359ca5,0x4dff00ff
	.word	0xff000000,0x0000009b
	.word	0x0000009b,0x134d3f5b
	.word	0x6146e006,0xa5235519
p0_local2_sec_expect:
	.word	0xa5235519,0x0000007c
	.word	0xc000ffff,0xff000000
	.word	0xffffff00,0x00000000
	.word	0x000000c5,0x8f94031f
	.word	0x5a27f1e3,0xebfeff95
	.word	0xf94249ff,0x06e04661
	.word	0xffffffff,0xffffffff
	.word	0x96cad698,0x0b8cb14f
p0_local3_expect:
	.word	0x00000000,0x00ffffff
	.word	0x00000000,0x0000e622
	.word	0xffffffac,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x9500feeb,0x96cad698
	.word	0xff000000,0x2164d7e3
	.word	0x00000000,0xff000000
	.word	0xb80000ff,0xffffffff
p0_local3_sec_expect:
	.word	0x00000000,0xffffffff
	.word	0xffffffff,0xffffadff
	.word	0xff6cea26,0x3aabd7b0
	.word	0x9da4e622,0x20ad4d1e
	.word	0x00000000,0xff000000
	.word	0xff000000,0x2164d7e3
	.word	0xff30fc3b,0xea83a18b
	.word	0x00000000,0x6f0000ff
p0_local4_expect:
	.word	0x00ff0000,0x0000ff7c
	.word	0xffafffff,0xff000000
	.word	0xffffffff,0x22e6a49d
	.word	0x000000c5,0x8f94031f
	.word	0x5a27f1e3,0xebfe00ff
	.word	0xf94249ff,0x06e04661
	.word	0xffffffff,0xffffffff
	.word	0x96cad698,0x0b8cb14f
p0_local4_sec_expect:
	.word	0xffad75ba,0x9b000000
	.word	0x00000000,0x0000e622
	.word	0xb8000000,0xc5000000
	.word	0x98d6ca96,0x3bfc30ff
	.word	0xff00ff4d,0xa59c357c
	.word	0x9b000000,0x000000ff
	.word	0x5b3f4d13,0xb80000ff
	.word	0x7230fc3b,0xba75ad65
p0_local5_expect:
	.word	0x0faed309,0x0000fdd1
	.word	0x00000000,0xa7210000
	.word	0x0000001f,0xc67e67b8
	.word	0x000000ff,0x7e98219d
	.word	0x00000000,0x0000e622
	.word	0x00000000,0x86ddad8a
	.word	0xffffffff,0xffffffff
	.word	0xf8de1fe1,0xb70b9f3f
p0_local5_sec_expect:
	.word	0x00000000,0x00000000
	.word	0x00ff0000,0xc5000000
	.word	0xa49d0000,0x00000000
	.word	0x468de073,0x4825068e
	.word	0xcdad7966,0xe04628b0
	.word	0x9587e0fd,0x0e32226c
	.word	0xd3001e70,0xaa6f5ae3
	.word	0xc3a9a9d6,0xfbdf96c0
p0_local6_expect:
	.word	0xff000058,0x00ff009b
	.word	0xff0000c5,0x8f94031f
	.word	0x00000000,0x1f0394ff
	.word	0x8e9af926,0xe6d463ff
	.word	0x65ad75ba,0xff000000
	.word	0xffff00c0,0xff760000
	.word	0x5eca5471,0x4fd0f9c4
	.word	0x000000ff,0xc06cea26
p0_local6_sec_expect:
	.word	0xff000000,0x65ad75ba
	.word	0xffff0000,0xfc810000
	.word	0x000000ff,0x00000000
	.word	0x8e1022c7,0xd65e773b
	.word	0xe47726d2,0xa0811d11
	.word	0x0b935ae5,0xec1189c2
	.word	0xf94249ff,0x06e04661
	.word	0xa0a39494,0x886801d6
share0_expect:
	.word	0xffffa250,0x5d61bc8c
	.word	0x315e2ab9,0x3064a910
	.word	0x64443714,0x7823be14
	.word	0xfe341a02,0xdfc5dc46
	.word	0x00fe5a1f,0xf75848a0
	.word	0x688dabc9,0x945e8507
	.word	0xb8d4a139,0x55fe2e1b
	.word	0xd7b98d2d,0x943f13db
share1_expect:
	.word	0x00ffdad7,0x4b94a757
	.word	0x8daa54fb,0x09d562b4
	.word	0x2df3d287,0xc25edb8b
	.word	0xb3e05cd7,0x93d3679e
	.word	0xead8e208,0x62243d7c
	.word	0x260d77e0,0x680a3830
	.word	0xfc30bca6,0x79034fe7
	.word	0xaba6175c,0x58ec24d1
	.word	0xa7218049,0x5ed287e5
	.word	0xbaea7bf0,0x1e3168d4
	.word	0xf13e8a82,0xe05b6c41
	.word	0x58d98990,0x94dd09f0
	.word	0xc6ce365d,0xad55ee69
	.word	0xe4460770,0xe1a81897
	.word	0x003b4dc4,0x7945b3aa
	.word	0x67d9a2c0,0x141057b4
share2_expect:
	.word	0x0000fc65,0xa214900e
	.word	0x3a42fab3,0xd848e3cd
	.word	0x4de88f01,0x0b9530ee
	.word	0xb7713aae,0x64f15809
	.word	0xb001e66b,0x6aa6c349
	.word	0x4254f36b,0x1cec4d12
	.word	0xda2bef1e,0x6dc3a86f
	.word	0x3142c5b8,0x266bf3c8
share3_expect:
	.word	0xfffcd0bd,0xef3f12b3
	.word	0x48100798,0x324d50c5
	.word	0x2f7de80f,0x8998f90a
	.word	0x6917eb33,0x5579dbca
	.word	0x761a2885,0x7550effa
	.word	0xe0a72d74,0xba4917df
	.word	0x42259668,0x14ec6df1
	.word	0xbf4a4e52,0x654e657e
	.word	0x1f0153ef,0xc4e60ee0
	.word	0x8d103a32,0x56efd200
	.word	0xf9b58b7a,0x721ed0ff
	.word	0x875eac1d,0x16878c0b
	.word	0x236c1e5d,0xdd29a8f2
	.word	0x61409b51,0x0d370a23
	.word	0x0556cfbf,0xd54a4abb
	.word	0x429f75ed,0xd1628a22
	.word	0xeaff8eeb,0x61cb7963
	.word	0x4e0ed4e8,0xca8e9e5e
	.word	0xc1521e6d,0x2c62f92f
	.word	0xb108b627,0x4e034b8c
	.word	0x9236b260,0xbc5ea8d5
	.word	0x8ff961af,0x314a4ecc
	.word	0x2efc76ad,0x30414481
	.word	0xe3180fa0,0xb5af28f7
	.word	0x68ff4245,0xf7212108
	.word	0xc717a45e,0xda38edf0
	.word	0x9a2f0d25,0xc37423b6
	.word	0x8299699b,0xb5f6ddf1
	.word	0x4e06fa81,0xf9eb838d
	.word	0x12fdf99f,0xb524dde0
	.word	0x171cdec0,0x979f5228
	.word	0x4a02d0a4,0x73d04dac
	.word	0x90ff757a,0x6ec520b7
	.word	0x6068127c,0xb33778c5
	.word	0x94956f08,0x7d754d6d
	.word	0xbd1bc67e,0x647ef1fe
	.word	0x4c070445,0x290e5451
	.word	0x3fcade45,0x45c26531
	.word	0xf7179f72,0xf01a8d67
	.word	0x4ca4e179,0xcbe619bf
	.word	0xb5610328,0x94a5ecec
	.word	0x4a0b259f,0xda172a85
	.word	0x151339ad,0x9e54e1ea
	.word	0xdd3b3331,0x6b020a6b
	.word	0x20560194,0xc0088d1b
	.word	0x987a3a8d,0x64df65c0
	.word	0xd5326126,0x5029d555
	.word	0xfde604fa,0xc4c7ac32
	.word	0x00005fec,0x14fde8e7
	.word	0xc6ab7510,0xe92e9152
	.word	0x4714c9c0,0xc498fea9
	.word	0x21f34064,0x1f62adc8
	.word	0xad860ef1,0xcc9c67d3
	.word	0x58daf84f,0x8985f37e
	.word	0x953c60da,0x1d52cab4
	.word	0x7ef296e8,0x647a2d17
	.word	0x21a75e86,0xcebb237f
	.word	0xfdb2866c,0x706ca014
	.word	0x893fdf8d,0xeaa1081d
	.word	0x02562db1,0xfb4f5d4b
	.word	0x119534a8,0x3744aea1
	.word	0x542a4a91,0x75ef3d2d
	.word	0x9e50bc32,0x931811df
	.word	0xab3d0469,0x700b2b4f
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
	.word	0xdcd69878,0x32bc964f
	.word	0x00000000,0x00000002
	.word	0xb989f550,0x064a1765
	.word	0x00000000,0x00000003
	.word	0x780c2e28,0x52173dde
	.word	0x00000000,0x00000004
	.word	0xd69735b7,0xcb4467ca
	.word	0x00000000,0x00000005
	.word	0xbbe50690,0x5f812000
	.word	0x00000000,0x00000006
	.word	0x34186307,0xb0cafd16
	.word	0x00000000,0x00000007
	.word	0xad0a9c0f,0xd305bdb6
	.word	0x00000000,0x00000008
	.word	0x9234cdb8,0x1e36afd7
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
	.word	0xb353563d,0x25ad7494,0x6146e006,0xe22d51aa
	.word	0x1b873e42,0x497dd5be,0xd90bc91a,0x988ad9da
	.word	0xa73d44b8,0x4736edeb,0x52fe9f16,0x2a68efb1
	.word	0x657ff5f5,0x300cfbe4,0xe861939d,0x94e531b7
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
	.word	0x9d9d6010,0x3dd55192,0x22af37ea,0x0fb8309e
	.word	0x783a8a5c,0xfea95ba5,0x34c6a322,0xb316670e
	.word	0x0d0a591f,0x48d9091d,0x9f220e89,0x7d46646e
	.word	0xa4487646,0xd429029d,0x2ee436eb,0xcda6351e
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
	.word	0x1a80b561,0x031f2a31,0xcb381b2d,0x97694597
	.word	0x2d1e0d4c,0xdda0bbc1,0xb581d11c,0xe3248c09
	.word	0x0faed309,0x8db1fdd1,0x7646daf5,0x8bd5e470
	.word	0xa9078e32,0x6ec9d9ff,0x2164d7e3,0x8329f2b8
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
	.word	0xa9592f4f,0xb03f102f,0x09b16f3a,0x3e23cc86
	.word	0xf012b002,0x67fe8e75,0x4079e437,0x60735afa
	.word	0x7c359ca5,0x6fb439b2,0xd81697ab,0x2c43c3d6
	.word	0x88007350,0x134d3f5b,0xfc1705b3,0x50359917
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
	.word	0x100444bd,0xa0f36d7f,0xffa26b0c,0x0e0492de
	.word	0xb034c36d,0x56493a0e,0x63373912,0x20ffc7a4
	.word	0x1813fcb4,0xfeb50952,0xf849b038,0xeed01bdc
	.word	0xe58b57de,0xff33b71c,0xcaf1426b,0x1c7c50f4
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
	.word	0xc886975a,0xbe192160,0xcf56c6d8,0xfb508d36
	.word	0x7403f231,0xd27e23a9,0x35adac6c,0x6250d3fc
	.word	0x55b0ad43,0x53de60ff,0x3f7eaa97,0xace1b665
	.word	0x1ee92253,0x08ff36c6,0x0e87ae95,0x83cca9c7
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
	.word	0x42ed4f8d,0x872cd317,0x4d53dbc5,0xbf94b12b
	.word	0x3101f091,0x44eb1b1a,0x9da4e622,0x20ad4d1e
	.word	0x7edff2c5,0xca9d3442,0xe7c06ab9,0x744ab3d1
	.word	0xabcd7408,0xea83a18b,0x4ec5c0b2,0x85c5bcee
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
	.word	0x43009099,0x865fb465,0x54fa2252,0x6f58ea35
	.word	0x1e607566,0x07eb22c0,0x3063d4e6,0x26f99a8e
	.word	0x950a657c,0xeed34507,0xcb340057,0x52e00c82
	.word	0xc4f9d04f,0x7154ca5e,0x26ea6cc0,0x133e7541
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
	.word	0x0ea98bb1,0xbad3e618,0x6e05bab7,0xae74c3c6
	.word	0x6ce13f1d,0x083bcea6,0x5f00f0e5,0x14f48c0e
	.word	0x0218b4c5,0x22356f56,0xbc38b04d,0xa692875c
	.word	0x2091dbe7,0x7c90f09e,0xc3bf7286,0xe9cd8241
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
	.word	0x7f7da4c5,0x5b94469a,0x0fca60c7,0xb92024da
	.word	0x4e4ca547,0x752be6c7,0x6b332775,0x09c6284d
	.word	0x4ae09daa,0x383647d6,0x8d14dcbc,0x6b57c4b4
	.word	0xd4869c2d,0xa216864b,0xc315b1d1,0xc4914f8b
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
	.word	0x974164e6,0x700412b3,0xf2af1de6,0xc3916472
	.word	0xba6a7b2e,0x30fb9b79,0x57ba95af,0x7e98219d
	.word	0xe3556f4a,0xb5849df1,0x1b676987,0x86ddad8a
	.word	0xaee50a77,0xd1692ee8,0xf8de1fe1,0xb70b9f3f
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
	.word	0x214fe73a,0xc60facd6,0xf80f9380,0x8a73494e
	.word	0x740d1522,0x638fcb72,0x336439ee,0x06d7994c
	.word	0x97893504,0x4f9f31be,0x19a0a063,0x484739df
	.word	0xca743f3d,0x0f380743,0x2588309c,0xee00f827
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
	.word	0x99630af4,0x7bdccbb6,0x8db32de5,0x8fa44d44
	.word	0xd18f29ec,0x18d3805a,0xe756ad06,0xdf12c492
	.word	0x5a27f1e3,0xebfe2995,0xf7fa9d79,0x56cfcd01
	.word	0x75c7575d,0x95387d15,0xb8677ec6,0x0b8cb14f
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
	.word	0x0d489fb9,0x821f696f,0x6f67f0aa,0xe1d89a27
	.word	0x9c5a122a,0x449ce8f0,0x8e1022c7,0xd65e773b
	.word	0xe47726d2,0xa0811d11,0x0b935ae5,0xec1189c2
	.word	0xc0cb8cd6,0x51b0d0db,0xa0a39494,0x886801d6
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
	.word	0x7633a250,0x5d61bc8c,0x315e2ab9,0x3064a910
	.word	0x64443714,0x7823be14,0xfe341a02,0xdfc5dc46
	.word	0x00fe5a1f,0xf75848a0,0x688dabc9,0x945e8507
	.word	0xb8d4a139,0x55fe2e1b,0xd7b98d2d,0x943f13db
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
	.word	0x21addad7,0x4b94a757,0x8daa54fb,0x09d562b4
	.word	0x2df3d287,0xc25edb8b,0xb3e05cd7,0x93d3679e
	.word	0xead8e208,0x62243d7c,0x260d77e0,0x680a3830
	.word	0xfc30bca6,0x79034fe7,0xaba6175c,0x58ec24d1
	.word	0xc5638049,0x5ed287e5,0xbaea7bf0,0x1e3168d4
	.word	0xf13e8a82,0xe05b6c41,0x58d98990,0x94dd09f0
	.word	0xc6ce365d,0xad55ee69,0xe4460770,0xe1a81897
	.word	0x003b4dc4,0x7945b3aa,0x67d9a2c0,0x141057b4
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
	.word	0x8063fc65,0xa214900e,0x3a42fab3,0xd848e3cd
	.word	0x4de88f01,0x0b9530ee,0xb7713aae,0x64f15809
	.word	0xb001e66b,0x6aa6c349,0x4254f36b,0x1cec4d12
	.word	0xda2bef1e,0x6dc3a86f,0x3142c5b8,0x266bf3c8
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
	.word	0x3cfcd0bd,0xef3f12b3,0x48100798,0x324d50c5
	.word	0x2f7de80f,0x8998f90a,0x6917eb33,0x5579dbca
	.word	0x761a2885,0x7550effa,0xe0a72d74,0xba4917df
	.word	0x42259668,0x14ec6df1,0xbf4a4e52,0x654e657e
	.word	0x9eef53ef,0xc4e60ee0,0x8d103a32,0x56efd200
	.word	0xf9b58b7a,0x721ed0ff,0x875eac1d,0x16878c0b
	.word	0x236c1e5d,0xdd29a8f2,0x61409b51,0x0d370a23
	.word	0x0556cfbf,0xd54a4abb,0x429f75ed,0xd1628a22
	.word	0xeab38eeb,0x61cb7963,0x4e0ed4e8,0xca8e9e5e
	.word	0xc1521e6d,0x2c62f92f,0xb108b627,0x4e034b8c
	.word	0x9236b260,0xbc5ea8d5,0x8ff961af,0x314a4ecc
	.word	0x2efc76ad,0x30414481,0xe3180fa0,0xb5af28f7
	.word	0x75584245,0xf7212108,0xc717a45e,0xda38edf0
	.word	0x9a2f0d25,0xc37423b6,0x8299699b,0xb5f6ddf1
	.word	0x4e06fa81,0xf9eb838d,0x12fdf99f,0xb524dde0
	.word	0x171cdec0,0x979f5228,0x4a02d0a4,0x73d04dac
	.word	0x900c757a,0x6ec520b7,0x6068127c,0xb33778c5
	.word	0x94956f08,0x7d754d6d,0xbd1bc67e,0x647ef1fe
	.word	0x4c070445,0x290e5451,0x3fcade45,0x45c26531
	.word	0xf7179f72,0xf01a8d67,0x4ca4e179,0xcbe619bf
	.word	0x60ca0328,0x94a5ecec,0x4a0b259f,0xda172a85
	.word	0x151339ad,0x9e54e1ea,0xdd3b3331,0x6b020a6b
	.word	0x20560194,0xc0088d1b,0x987a3a8d,0x64df65c0
	.word	0xd5326126,0x5029d555,0xfde604fa,0xc4c7ac32
	.word	0x40615fec,0x14fde8e7,0xc6ab7510,0xe92e9152
	.word	0x4714c9c0,0xc498fea9,0x21f34064,0x1f62adc8
	.word	0xad860ef1,0xcc9c67d3,0x58daf84f,0x8985f37e
	.word	0x953c60da,0x1d52cab4,0x7ef296e8,0x647a2d17
	.word	0x21a75e86,0xcebb237f,0xfdb2866c,0x706ca014
	.word	0x893fdf8d,0xeaa1081d,0x02562db1,0xfb4f5d4b
	.word	0x119534a8,0x3744aea1,0x542a4a91,0x75ef3d2d
	.word	0x9e50bc32,0x931811df,0xab3d0469,0x700b2b4f
share3_end:
