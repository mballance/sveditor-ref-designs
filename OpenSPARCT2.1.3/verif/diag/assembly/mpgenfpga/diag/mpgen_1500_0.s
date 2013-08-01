/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_1500_0.s
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
!	Seed = 327144512
!	Riesling can be on
!	1 Thread, 1500 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_1500_0.s created on Mar 27, 2009 (14:45:12)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_1500_0 -p 1 -l 1500

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
!	%f0  = 7305ee2b 05700460 1bdb04eb be0d35c3
!	%f4  = bf394847 e96dec05 7a365fa4 5dcbbc8b
!	%f8  = c5d648c2 fcfc54b5 9f65dd20 71bc8902
!	%f12 = 5778a534 8cd70f82 d0ea4854 c51b8c18
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 66cf68ad 18f5c11a 69d1b2cd 049302d3
!	%f20 = 2c37451b ac7d3113 7bf4a25b 4e003c1d
!	%f24 = af1d6e14 dd9e0d5b 3dc23d89 9f8083fc
!	%f28 = e19681f6 df9d2fa9 00411874 36c5746b
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 26945d3b c1f74eb9 39a006e2 dacd325c
!	%f36 = 632ae364 1b1f32bc 5196d30d 50a190bd
!	%f40 = 7b3cbd0c 966fcc16 6b370f16 cea99933
!	%f44 = 0824c1f1 0a75c8f7 35f6561f f2296706
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0xdcb986b800000072,%g7,%g1 ! GSR scale = 14, align = 2
	wr	%g1,%g0,%gsr		! GSR = dcb986b800000072
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000030101410] = a45cd978, %l1 = 6cc5281648442129
	lduwa	[%i4+%o5]0x89,%l1	! %l1 = 00000000a45cd978
!	Mem[0000000030001410] = b6b7b005, %l0 = 21aef1b6627715a4
	lduha	[%i0+%o5]0x89,%l0	! %l0 = 000000000000b005
!	Mem[0000000030141410] = 31b792a8 2bd3ee6d, %l6 = e68f7d13, %l7 = cee10e4c
	ldda	[%i5+%o5]0x81,%l6	! %l6 = 0000000031b792a8 000000002bd3ee6d
!	%f22 = 7bf4a25b 4e003c1d, Mem[0000000010001408] = 7854cb73 b7b9f2eb
	stda	%f22,[%i0+%o4]0x88	! Mem[0000000010001408] = 7bf4a25b 4e003c1d
!	%l3 = f49b5d786d7fe83c, Mem[0000000030141408] = 28445af0
	stwa	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = 6d7fe83c
!	%l4 = 38816709f5682bd5, Mem[0000000010041408] = 05fb436c5247ea58
	stxa	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 38816709f5682bd5
!	Mem[0000000010141420] = fd5d119e 072e55cd, %l4 = f5682bd5, %l5 = 63f17a31
	ldda	[%i5+0x020]%asi,%l4	! %l4 = 00000000fd5d119e 00000000072e55cd
!	%f12 = 5778a534 8cd70f82, Mem[0000000030101410] = a45cd978 7434a653
	stda	%f12,[%i4+%o5]0x89	! Mem[0000000030101410] = 5778a534 8cd70f82
!	Mem[0000000030041400] = be6a4109, %l2 = 6b54aaa27f00f608
	ldsba	[%i1+%g0]0x81,%l2	! %l2 = ffffffffffffffbe
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 50c88875, %l4 = 00000000fd5d119e
	swapa	[%i5+%o5]0x88,%l4	! %l4 = 0000000050c88875

p0_label_2:
!	Mem[0000000030101400] = 00dd0448, %l4 = 0000000050c88875
	lduwa	[%i4+%g0]0x81,%l4	! %l4 = 0000000000dd0448
!	Mem[000000001008141e] = 55c5ee92, %l4 = 0000000000dd0448
	ldstuba	[%i2+0x01e]%asi,%l4	! %l4 = 000000ee000000ff
!	Mem[00000000100c1408] = 93a22e2d, %l0 = 000000000000b005
	ldstuba	[%i3+%o4]0x88,%l0	! %l0 = 0000002d000000ff
!	%l0 = 000000000000002d, Mem[0000000030081408] = 8c9fa7fcbb1c0e9a
	stxa	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000000000002d
!	%f16 = 66cf68ad 18f5c11a, Mem[0000000010181410] = 4a99712b 8b931e4a
	stda	%f16,[%i6+%o5]0x80	! Mem[0000000010181410] = 66cf68ad 18f5c11a
!	Mem[0000000010081410] = 975a576a, %l5 = 00000000072e55cd
	ldstuba	[%i2+%o5]0x88,%l5	! %l5 = 0000006a000000ff
!	%l0 = 000000000000002d, Mem[00000000100c1437] = df489ae7
	stb	%l0,[%i3+0x037]		! Mem[00000000100c1434] = df489a2d
!	Mem[0000000010081410] = 975a57ff, %l2 = ffffffffffffffbe
	ldstuba	[%i2+%o5]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010081430] = a675a8b07cfb0e7c, %l7 = 000000002bd3ee6d, %l2 = 00000000000000ff
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l7,%l2	! %l2 = a675a8b07cfb0e7c
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00000000, %l5 = 000000000000006a
	ldswa	[%i2+%o4]0x81,%l5	! %l5 = 0000000000000000

p0_label_3:
!	Mem[0000000010081408] = 5eaea3bd, %l6 = 0000000031b792a8
	ldsba	[%i2+%o4]0x88,%l6	! %l6 = ffffffffffffffbd
!	Mem[0000000010101410] = 14e8c16302ef4a3c, %l7 = 000000002bd3ee6d
	ldxa	[%i4+%o5]0x80,%l7	! %l7 = 14e8c16302ef4a3c
!	Mem[0000000010001420] = 50bb809c, %l6 = ffffffffffffffbd
	ldsba	[%i0+0x020]%asi,%l6	! %l6 = 0000000000000050
!	%f14 = d0ea4854, %f22 = 7bf4a25b
	fcmps	%fcc1,%f14,%f22		! %fcc1 = 1
!	Mem[00000000300c1408] = 0a6c330b, %l3 = f49b5d786d7fe83c
	lduha	[%i3+%o4]0x81,%l3	! %l3 = 0000000000000a6c
!	Mem[0000000030141408] = 3ce87f6d, %l2 = a675a8b07cfb0e7c
	lduwa	[%i5+%o4]0x89,%l2	! %l2 = 000000003ce87f6d
!	Mem[0000000010101400] = fd5debc7, %l0 = 000000000000002d
	ldsba	[%i4+%g0]0x80,%l0	! %l0 = fffffffffffffffd
!	Mem[0000000030181400] = 3cd20ca4 f7afdc53 fb3e1bd5 a2a94821
!	Mem[0000000030181410] = fc725355 364150a3 cba17b8b b7c5c017
!	Mem[0000000030181420] = e30703b9 945d7d1e 3823183b 48d4823e
!	Mem[0000000030181430] = 53f361b2 ce50ef63 bb7e34bd b43585f9
	ldda	[%i6]ASI_BLK_SL,%f16	! Block Load from 0000000030181400
	membar	#Sync			! Added by membar checker (1)
!	Mem[00000000100c1400] = 94b18a76 271c236d ff2ea293 ef1e7c67
!	Mem[00000000100c1410] = 2fc09ddd c193a468 2349c7e1 89422d3b
!	Mem[00000000100c1420] = ac990448 ce32d083 7c829e0f 0ac5eded
!	Mem[00000000100c1430] = bc5a3abb df489a2d b4e1f0f6 6740d656
	ldda	[%i3]ASI_BLK_PL,%f16	! Block Load from 00000000100c1400
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[000000001004143f] = 2d3bd93b, %asi = 80
	stba	%l5,[%i1+0x03f]%asi	! Mem[000000001004143c] = 2d3bd900

p0_label_4:
!	Mem[0000000010141400] = cdb20396, %l2 = 000000003ce87f6d
	swapa	[%i5+%g0]0x88,%l2	! %l2 = 00000000cdb20396
!	%l4 = 00000000000000ee, Mem[0000000010041408] = d52b68f5
	stha	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 00ee68f5
!	%l7 = 14e8c16302ef4a3c, Mem[0000000010101418] = d6989865
	stw	%l7,[%i4+0x018]		! Mem[0000000010101418] = 02ef4a3c
!	%l4 = 000000ee, %l5 = 00000000, Mem[0000000010081410] = ff575a97 8f45e8bb
	stda	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ee 00000000
!	%l3 = 0000000000000a6c, Mem[00000000218001c0] = 75bf6949
	sth	%l3,[%o3+0x1c0]		! Mem[00000000218001c0] = 0a6c6949
!	%l7 = 14e8c16302ef4a3c, Mem[0000000010141410] = 9e115dfd471e33cf
	stx	%l7,[%i5+%o5]		! Mem[0000000010141410] = 14e8c16302ef4a3c
!	%l6 = 00000050, %l7 = 02ef4a3c, Mem[0000000010101410] = 63c1e814 3c4aef02
	stda	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000050 02ef4a3c
!	%l0 = fffffffffffffffd, Mem[0000000030041410] = 063b3f93
	stha	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = fffd3f93
!	Mem[0000000030081410] = 3600dec8, %l6 = 0000000000000050
	swapa	[%i2+%o5]0x89,%l6	! %l6 = 000000003600dec8
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 552e6a66, %l7 = 14e8c16302ef4a3c
	lduwa	[%i4+%o4]0x89,%l7	! %l7 = 00000000552e6a66

p0_label_5:
!	Mem[00000000211c0000] = 482885d2, %l7 = 00000000552e6a66
	ldsh	[%o2+%g0],%l7		! %l7 = 0000000000004828
!	Mem[0000000010041408] = f568ee00, %l6 = 000000003600dec8
	lduba	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141410] = 63c1e814, %l2 = 00000000cdb20396
	ldsba	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000014
!	Mem[00000000300c1400] = 95cfd873 493cb9ff 0a6c330b 94cf7e4f
!	Mem[00000000300c1410] = 0bbb6971 e611a2f7 cabcfbb8 e672a99b
!	Mem[00000000300c1420] = dd02365f 81d02f83 f338bb9f e62627fb
!	Mem[00000000300c1430] = 5059a5cf 12e09aad 817ce1e4 c5bf4db2
	ldda	[%i3]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[0000000030081410] = 50000000, %l5 = 0000000000000000
	lduba	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000050
!	Mem[0000000010001410] = 15e3f35e, %l0 = fffffffffffffffd
	ldsha	[%i0+%o5]0x80,%l0	! %l0 = 00000000000015e3
!	Mem[0000000010081420] = aa88243b, %l3 = 0000000000000a6c, %asi = 80
	swapa	[%i2+0x020]%asi,%l3	! %l3 = 00000000aa88243b
!	Mem[0000000010081410] = 000000ee, %l3 = 00000000aa88243b
	lduw	[%i2+%o5],%l3		! %l3 = 00000000000000ee
!	%f0  = 7305ee2b, %f6  = 7a365fa4, %f6  = 7a365fa4 5dcbbc8b
	fsmuld	%f0 ,%f6 ,%f6 		! %f6  = 4db7da56 f0222300
!	Starting 10 instruction Store Burst
!	%f0  = 7305ee2b 05700460, Mem[0000000030081410] = 50000000 ebc42b04
	stda	%f0 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 7305ee2b 05700460

p0_label_6:
!	Mem[0000000030041410] = fffd3f93, %l7 = 0000000000004828
	ldstuba	[%i1+%o5]0x81,%l7	! %l7 = 000000ff000000ff
!	%l5 = 0000000000000050, Mem[00000000201c0000] = 90434c08
	sth	%l5,[%o0+%g0]		! Mem[00000000201c0000] = 00504c08
!	%l1 = 00000000a45cd978, Mem[0000000030081400] = 32000f4b
	stba	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 78000f4b
!	Mem[0000000030081410] = 7305ee2b, %l6 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l6	! %l6 = 000000007305ee2b
!	Mem[00000000300c1408] = 0a6c330b, %l3 = 00000000000000ee
	swapa	[%i3+%o4]0x81,%l3	! %l3 = 000000000a6c330b
!	%l0 = 00000000000015e3, Mem[0000000030141408] = 3ce87f6d
	stha	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 3ce815e3
!	Mem[0000000030081400] = 78000f4b, %l1 = 00000000a45cd978
	ldstuba	[%i2+%g0]0x81,%l1	! %l1 = 00000078000000ff
!	%l1 = 0000000000000078, Mem[0000000030001408] = e47d68df
	stwa	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000078
	membar	#Sync			! Added by membar checker (2)
!	%l6 = 000000007305ee2b, Mem[00000000100c1408] = 677c1eef93a22eff
	stxa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000007305ee2b
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 9f7c66b3, %l7 = 00000000000000ff
	ldsha	[%i1+%o5]0x88,%l7	! %l7 = 00000000000066b3

p0_label_7:
!	Mem[00000000100c1438] = b4e1f0f6, %f31 = c5bf4db2
	lda	[%i3+0x038]%asi,%f31	! %f31 = b4e1f0f6
!	Mem[0000000010081408] = bda3ae5e 5ce9b16a, %l6 = 7305ee2b, %l7 = 000066b3
	ldd	[%i2+%o4],%l6		! %l6 = 00000000bda3ae5e 000000005ce9b16a
!	Mem[0000000010141408] = d7c76781 a7094efb, %l6 = bda3ae5e, %l7 = 5ce9b16a
	ldd	[%i5+%o4],%l6		! %l6 = 00000000d7c76781 00000000a7094efb
!	Mem[0000000030041400] = be6a4109, %f12 = 5778a534
	lda	[%i1+%g0]0x81,%f12	! %f12 = be6a4109
!	Mem[00000000201c0000] = 00504c08, %l7 = 00000000a7094efb
	ldsba	[%o0+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101408] = d87f1c64, %l2 = 0000000000000014
	ldsba	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000064
!	Mem[0000000010081410] = 000000ee, %l1 = 0000000000000078
	lduha	[%i2+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141408] = 3ce815e3, %l0 = 00000000000015e3
	lduha	[%i5+%o4]0x89,%l0	! %l0 = 00000000000015e3
!	Mem[0000000010181410] = 66cf68ad18f5c11a, %l4 = 00000000000000ee
	ldxa	[%i6+0x010]%asi,%l4	! %l4 = 66cf68ad18f5c11a
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 50000000, %l2 = 0000000000000064, %asi = 80
	swapa	[%i4+0x010]%asi,%l2	! %l2 = 0000000050000000

p0_label_8:
!	Mem[00000000218001c0] = 0a6c6949, %l5 = 0000000000000050
	ldstub	[%o3+0x1c0],%l5		! %l5 = 0000000a000000ff
!	%l0 = 000015e3, %l1 = 00000000, Mem[0000000010181410] = ad68cf66 1ac1f518
	stda	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 000015e3 00000000
!	Mem[0000000030141400] = d6400445 72507abd e315e83c b86b016b
!	Mem[0000000030141410] = 31b792a8 2bd3ee6d 58f57a37 6f1ae716
!	Mem[0000000030141420] = f59c2a36 63ace9a5 ec7caf0d c2f15a43
!	Mem[0000000030141430] = 4befa1be 4960bfff ea03fd1a 13c71665
	ldda	[%i5]ASI_BLK_SL,%f16	! Block Load from 0000000030141400
!	%f11 = 71bc8902, Mem[0000000030081400] = ff000f4b
	sta	%f11,[%i2+%g0]0x81	! Mem[0000000030081400] = 71bc8902
!	%l0 = 00000000000015e3, Mem[00000000201c0000] = 00504c08, %asi = 80
	stba	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = e3504c08
!	%f0  = 7305ee2b, Mem[0000000010181400] = aa3cb13f
	sta	%f0 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 7305ee2b
!	Mem[00000000211c0001] = 482885d2, %l1 = 0000000000000000
	ldstub	[%o2+0x001],%l1		! %l1 = 00000028000000ff
!	%l4 = 66cf68ad18f5c11a, Mem[00000000100c141d] = 89422d3b
	stb	%l4,[%i3+0x01d]		! Mem[00000000100c141c] = 891a2d3b
	membar	#Sync			! Added by membar checker (3)
!	%l4 = 66cf68ad18f5c11a, Mem[0000000030141400] = d6400445
	stwa	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 18f5c11a
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = bf09f722, %l7 = 0000000000000000
	lduwa	[%i2+%g0]0x80,%l7	! %l7 = 00000000bf09f722

p0_label_9:
!	Mem[0000000010041408] = f568ee00, %l5 = 000000000000000a
	ldsha	[%i1+%o4]0x88,%l5	! %l5 = ffffffffffffee00
!	Mem[000000001004143c] = 2d3bd900, %l1 = 0000000000000028
	ldsba	[%i1+0x03e]%asi,%l1	! %l1 = ffffffffffffffd9
!	Mem[0000000030081400] = 0289bc71, %l3 = 000000000a6c330b
	ldswa	[%i2+%g0]0x89,%l3	! %l3 = 000000000289bc71
!	Mem[0000000030081400] = 71bc8902, %l5 = ffffffffffffee00
	ldsba	[%i2+%g0]0x81,%l5	! %l5 = 0000000000000071
!	Mem[0000000010081400] = 22f709bf, %l7 = 00000000bf09f722
	ldsha	[%i2+%g0]0x88,%l7	! %l7 = 00000000000009bf
!	Mem[0000000030001400] = eca7a64a, %l2 = 0000000050000000
	lduwa	[%i0+%g0]0x81,%l2	! %l2 = 00000000eca7a64a
!	Mem[00000000211c0000] = 48ff85d2, %l2 = 00000000eca7a64a
	lduh	[%o2+%g0],%l2		! %l2 = 00000000000048ff
!	Mem[0000000010041410] = 9f7c66b3, %l4 = 66cf68ad18f5c11a
	lduha	[%i1+%o5]0x88,%l4	! %l4 = 00000000000066b3
!	Mem[0000000010141408] = d7c76781a7094efb, %l5 = 0000000000000071
	ldxa	[%i5+%o4]0x80,%l5	! %l5 = d7c76781a7094efb
!	Starting 10 instruction Store Burst
!	%l6 = 00000000d7c76781, imm = fffffffffffffccd, %l5 = d7c76781a7094efb
	or	%l6,-0x333,%l5		! %l5 = ffffffffffffffcd

p0_label_10:
!	%l3 = 000000000289bc71, %l3 = 000000000289bc71, %l0 = 00000000000015e3
	subc	%l3,%l3,%l0		! %l0 = 0000000000000000
!	Mem[0000000030041408] = 8d1a1f54, %l6 = 00000000d7c76781
	ldstuba	[%i1+%o4]0x81,%l6	! %l6 = 0000008d000000ff
!	%l2 = 00000000000048ff, Mem[00000000100c1408] = 2bee0573
	stha	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 48ff0573
!	Mem[0000000030001400] = eca7a64a, %l4 = 00000000000066b3
	swapa	[%i0+%g0]0x81,%l4	! %l4 = 00000000eca7a64a
!	Mem[0000000010101408] = 641c7fd8, %l0 = 0000000000000000
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 00000064000000ff
!	Mem[00000000100c1408] = 7305ff48, %l0 = 0000000000000064
	ldstuba	[%i3+%o4]0x88,%l0	! %l0 = 00000048000000ff
!	Mem[00000000218001c1] = ff6c6949, %l5 = ffffffffffffffcd
	ldstuba	[%o3+0x1c1]%asi,%l5	! %l5 = 0000006c000000ff
!	Mem[0000000010001410] = 15e3f35e, %l1 = ffffffffffffffd9
	swapa	[%i0+%o5]0x80,%l1	! %l1 = 0000000015e3f35e
!	Mem[0000000030001408] = 00000078, %l2 = 00000000000048ff
	swapa	[%i0+%o4]0x89,%l2	! %l2 = 0000000000000078
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 000048ff, %l2 = 0000000000000078
	ldswa	[%i0+%o4]0x89,%l2	! %l2 = 00000000000048ff

p0_label_11:
!	Mem[0000000010101420] = 1c5029f5, %l3 = 000000000289bc71
	lduwa	[%i4+0x020]%asi,%l3	! %l3 = 000000001c5029f5
!	Mem[0000000010141438] = 944c8e2c, %l6 = 000000000000008d
	lduh	[%i5+0x038],%l6		! %l6 = 000000000000944c
!	Mem[0000000010001400] = 154c2cee, %l4 = 00000000eca7a64a
	ldsba	[%i0+%g0]0x88,%l4	! %l4 = ffffffffffffffee
!	Mem[0000000030141408] = 3ce815e3, %l0 = 0000000000000048
	ldsba	[%i5+%o4]0x89,%l0	! %l0 = ffffffffffffffe3
!	Mem[00000000100c1408] = 7305ffff, %l3 = 000000001c5029f5
	ldswa	[%i3+%o4]0x88,%l3	! %l3 = 000000007305ffff
!	Mem[0000000010101438] = ff5e835f, %l0 = ffffffffffffffe3
	lduba	[%i4+0x038]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001400] = 154c2cee, %l6 = 000000000000944c
	lduba	[%i0+%g0]0x88,%l6	! %l6 = 00000000000000ee
!	Mem[0000000030041400] = 09416abe, %l4 = ffffffffffffffee
	ldsha	[%i1+%g0]0x89,%l4	! %l4 = 0000000000006abe
!	Mem[00000000100c1400] = 94b18a76, %l7 = 00000000000009bf
	lduha	[%i3+0x002]%asi,%l7	! %l7 = 0000000000008a76
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = b3667c9f, %l1 = 0000000015e3f35e
	swapa	[%i1+%o5]0x80,%l1	! %l1 = 00000000b3667c9f

p0_label_12:
!	%f8  = c5d648c2, Mem[00000000300c1410] = 7169bb0b
	sta	%f8 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = c5d648c2
!	%f17 = 450440d6, Mem[0000000030081408] = 00000000
	sta	%f17,[%i2+%o4]0x81	! Mem[0000000030081408] = 450440d6
!	%f28 = ffbf6049 bea1ef4b, Mem[00000000300c1408] = ee000000 4f7ecf94
	stda	%f28,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffbf6049 bea1ef4b
!	Mem[0000000010181408] = 9df0a0da, %l2 = 00000000000048ff
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 000000009df0a0da
!	Mem[0000000010141420] = fd5d119e072e55cd, %l0 = 00000000000000ff, %l1 = 00000000b3667c9f
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l0,%l1	! %l1 = fd5d119e072e55cd
!	Mem[00000000300c1410] = c248d6c5, %l4 = 0000000000006abe
	swapa	[%i3+%o5]0x81,%l4	! %l4 = 00000000c248d6c5
!	%f28 = ffbf6049 bea1ef4b, %l6 = 00000000000000ee
!	Mem[0000000030001420] = d784f77e71e910f2
	add	%i0,0x020,%g1
	stda	%f28,[%g1+%l6]ASI_PST8_S ! Mem[0000000030001420] = ffbf607ebea1eff2
!	Mem[0000000010181400] = 7305ee2b, %l0 = 00000000000000ff
	swapa	[%i6+%g0]0x88,%l0	! %l0 = 000000007305ee2b
!	%l2 = 9df0a0da, %l3 = 7305ffff, Mem[0000000030041410] = 933ffdff eaf51a60
	stda	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 9df0a0da 7305ffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1420] = ac990448, %l7 = 0000000000008a76
	lduba	[%i3+0x022]%asi,%l7	! %l7 = 0000000000000004

p0_label_13:
!	Mem[00000000211c0000] = 48ff85d2, %l6 = 00000000000000ee
	lduh	[%o2+%g0],%l6		! %l6 = 00000000000048ff
!	%l5 = 000000000000006c, %l0 = 000000007305ee2b, %l0 = 000000007305ee2b
	addc	%l5,%l0,%l0		! %l0 = 000000007305ee97
!	Mem[00000000211c0000] = 48ff85d2, %l2 = 000000009df0a0da
	ldsba	[%o2+0x001]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010081408] = bda3ae5e, %l0 = 000000007305ee97
	ldsba	[%i2+%o4]0x80,%l0	! %l0 = ffffffffffffffbd
!	Mem[0000000010181410] = 000015e3, %l7 = 0000000000000004
	ldswa	[%i6+%o5]0x88,%l7	! %l7 = 00000000000015e3
!	Mem[0000000010101404] = b72f703d, %f20 = 6deed32b
	lda	[%i4+0x004]%asi,%f20	! %f20 = b72f703d
!	Mem[00000000300c1408] = 4befa1be, %l1 = fd5d119e072e55cd
	lduha	[%i3+%o4]0x81,%l1	! %l1 = 0000000000004bef
!	Mem[0000000010141410] = 3c4aef02 63c1e814, %l6 = 000048ff, %l7 = 000015e3
	ldda	[%i5+%o5]0x88,%l6	! %l6 = 0000000063c1e814 000000003c4aef02
!	Mem[0000000010001410] = d70e0c4e d9ffffff, %l4 = c248d6c5, %l5 = 0000006c
	ldda	[%i0+%o5]0x88,%l4	! %l4 = 00000000d9ffffff 00000000d70e0c4e
!	Starting 10 instruction Store Burst
!	Mem[0000000010001414] = 4e0c0ed7, %l6 = 0000000063c1e814, %asi = 80
	swapa	[%i0+0x014]%asi,%l6	! %l6 = 000000004e0c0ed7

p0_label_14:
!	%l5 = 00000000d70e0c4e, Mem[000000001000143e] = fc26441d, %asi = 80
	stha	%l5,[%i0+0x03e]%asi	! Mem[000000001000143c] = fc260c4e
!	%l2 = ffffffffffffffff, Mem[00000000201c0000] = e3504c08
	stb	%l2,[%o0+%g0]		! Mem[00000000201c0000] = ff504c08
!	%f8  = c5d648c2, Mem[0000000010101410] = 64000000
	sta	%f8 ,[%i4+%o5]0x88	! Mem[0000000010101410] = c5d648c2
!	%f0  = 7305ee2b 05700460 1bdb04eb be0d35c3
!	%f4  = bf394847 e96dec05 4db7da56 f0222300
!	%f8  = c5d648c2 fcfc54b5 9f65dd20 71bc8902
!	%f12 = be6a4109 8cd70f82 d0ea4854 c51b8c18
	stda	%f0,[%i0]ASI_BLK_PL	! Block Store to 0000000010001400
!	%l3 = 000000007305ffff, Mem[0000000030141400] = 1ac1f518
	stba	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 1ac1f5ff
!	%l5 = 00000000d70e0c4e, Mem[0000000021800041] = 9a2fd022
	stb	%l5,[%o3+0x041]		! Mem[0000000021800040] = 9a4ed022
!	%f18 = 6b016bb8 3ce815e3, %l2 = ffffffffffffffff
!	Mem[0000000030181428] = 3823183b48d4823e
	add	%i6,0x028,%g1
	stda	%f18,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030181428] = e315e83cb86b016b
!	%l2 = ffffffffffffffff, Mem[00000000211c0000] = 48ff85d2
	sth	%l2,[%o2+%g0]		! Mem[00000000211c0000] = ffff85d2
!	%l2 = ffffffffffffffff, Mem[0000000010081400] = 22f709bf
	stha	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 22f7ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041428] = bff84ba1, %l3 = 000000007305ffff
	lduha	[%i1+0x02a]%asi,%l3	! %l3 = 0000000000004ba1

p0_label_15:
!	Mem[00000000211c0000] = ffff85d2, %l4 = 00000000d9ffffff
	ldsh	[%o2+%g0],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030001410] = 05b0b7b6, %l5 = 00000000d70e0c4e
	ldsha	[%i0+%o5]0x81,%l5	! %l5 = 00000000000005b0
!	Mem[00000000100c1400] = 94b18a76, %f25 = 362a9cf5
	ld	[%i3+%g0],%f25	! %f25 = 94b18a76
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000010001410] = 05ec6de9474839bf, %f20 = b72f703d a892b731
	ldda	[%i0+%o5]0x80,%f20	! %f20 = 05ec6de9 474839bf
!	Mem[0000000010101408] = 3ac0b435d87f1cff, %l5 = 00000000000005b0
	ldxa	[%i4+%o4]0x88,%l5	! %l5 = 3ac0b435d87f1cff
!	Mem[0000000020800040] = ba7dc1d1, %l2 = ffffffffffffffff
	lduba	[%o1+0x041]%asi,%l2	! %l2 = 000000000000007d
!	Mem[0000000030141400] = fff5c11a, %l4 = ffffffffffffffff
	lduha	[%i5+%g0]0x81,%l4	! %l4 = 000000000000fff5
!	Mem[0000000010181400] = ff000000, %l3 = 0000000000004ba1
	ldsba	[%i6+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000211c0000] = ffff85d2, %l5 = 3ac0b435d87f1cff
	lduba	[%o2+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f3  = be0d35c3, %f23 = 377af558, %f26 = 435af1c2
	fdivs	%f3 ,%f23,%f26		! %f26 = c6100bfe

p0_label_16:
!	Mem[0000000030101408] = 666a2e55, %l4 = 000000000000fff5
	swapa	[%i4+%o4]0x81,%l4	! %l4 = 00000000666a2e55
!	%l6 = 000000004e0c0ed7, Mem[0000000010181410] = e3150000
	stba	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = d7150000
!	Mem[0000000030081400] = 0289bc71, %l7 = 000000003c4aef02
	ldstuba	[%i2+%g0]0x89,%l7	! %l7 = 00000071000000ff
!	Mem[0000000030141410] = 31b792a8, %l0 = ffffffffffffffbd
	swapa	[%i5+%o5]0x81,%l0	! %l0 = 0000000031b792a8
!	%f0  = 7305ee2b 05700460 1bdb04eb be0d35c3
!	%f4  = bf394847 e96dec05 4db7da56 f0222300
!	%f8  = c5d648c2 fcfc54b5 9f65dd20 71bc8902
!	%f12 = be6a4109 8cd70f82 d0ea4854 c51b8c18
	stda	%f0,[%i6]ASI_BLK_AIUSL	! Block Store to 0000000030181400
!	%f30 = 6516c713, Mem[00000000100c1408] = ffff0573
	sta	%f30,[%i3+%o4]0x80	! Mem[00000000100c1408] = 6516c713
!	%l7 = 0000000000000071, Mem[0000000010041400] = e7b2ebbe
	stwa	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000071
!	%l0 = 31b792a8, %l1 = 00004bef, Mem[00000000100c1408] = 13c71665 00000000
	stda	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 31b792a8 00004bef
!	%f28 = ffbf6049 bea1ef4b, Mem[0000000010101408] = ff1c7fd8 35b4c03a
	stda	%f28,[%i4+%o4]0x80	! Mem[0000000010101408] = ffbf6049 bea1ef4b
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ff480000, %l6 = 000000004e0c0ed7
	ldswa	[%i0+%o4]0x81,%l6	! %l6 = ffffffffff480000

p0_label_17:
!	%l4 = 00000000666a2e55, %l0 = 0000000031b792a8, %l0 = 0000000031b792a8
	andn	%l4,%l0,%l0		! %l0 = 0000000046482c55
!	Code Fragment 3
p0_fragment_1:
!	%l0 = 0000000046482c55
	setx	0x33204c8fa03c53cd,%g7,%l0 ! %l0 = 33204c8fa03c53cd
!	%l1 = 0000000000004bef
	setx	0x666990d0417ab24f,%g7,%l1 ! %l1 = 666990d0417ab24f
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 33204c8fa03c53cd
	setx	0xf49df487f68a95f4,%g7,%l0 ! %l0 = f49df487f68a95f4
!	%l1 = 666990d0417ab24f
	setx	0x7f1498f7be7453cf,%g7,%l1 ! %l1 = 7f1498f7be7453cf
!	Mem[00000000100c1410] = 2fc09dddc193a468, %f30 = 6516c713 1afd03ea
	ldda	[%i3+%o5]0x80,%f30	! %f30 = 2fc09ddd c193a468
!	Mem[0000000010081428] = fd06f774, %l0 = f49df487f68a95f4
	lduw	[%i2+0x028],%l0		! %l0 = 00000000fd06f774
!	Mem[0000000010081410] = 000000ee00000000, %f18 = 6b016bb8 3ce815e3
	ldd	[%i2+%o5],%f18		! %f18 = 000000ee 00000000
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010181400] = ff00000036c0c225, %f28 = ffbf6049 bea1ef4b
	ldda	[%i6+%g0]0x80,%f28	! %f28 = ff000000 36c0c225
!	Mem[0000000010141408] = d7c76781a7094efb, %f6  = 4db7da56 f0222300
	ldda	[%i5+%o4]0x80,%f6 	! %f6  = d7c76781 a7094efb
!	Mem[0000000010101400] = c7eb5dfd, %l0 = 00000000fd06f774
	lduha	[%i4+%g0]0x88,%l0	! %l0 = 0000000000005dfd
!	Mem[0000000010041408] = 00ee68f5 09678138, %l6 = ff480000, %l7 = 00000071
	ldda	[%i1+%o4]0x80,%l6	! %l6 = 0000000000ee68f5 0000000009678138
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, imm = 000000000000045e, %l6 = 0000000000ee68f5
	and	%l5,0x45e,%l6		! %l6 = 000000000000005e

p0_label_18:
!	%f24 = a5e9ac63, Mem[0000000030001408] = ff480000
	sta	%f24,[%i0+%o4]0x81	! Mem[0000000030001408] = a5e9ac63
!	%f2  = 1bdb04eb, Mem[0000000030081410] = 00000000
	sta	%f2 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 1bdb04eb
!	%l6 = 000000000000005e, Mem[0000000010041410] = 15e3f35e
	stba	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 5ee3f35e
!	Mem[00000000211c0001] = ffff85d2, %l5 = 00000000000000ff
	ldstuba	[%o2+0x001]%asi,%l5	! %l5 = 000000ff000000ff
!	%f28 = ff000000 36c0c225, Mem[0000000030181400] = 05700460 7305ee2b
	stda	%f28,[%i6+%g0]0x89	! Mem[0000000030181400] = ff000000 36c0c225
!	%l5 = 00000000000000ff, Mem[0000000010141414] = 02ef4a3c, %asi = 80
	stba	%l5,[%i5+0x014]%asi	! Mem[0000000010141414] = ffef4a3c
!	Mem[0000000010081400] = fffff722, %l1 = 7f1498f7be7453cf
	swapa	[%i2+%g0]0x80,%l1	! %l1 = 00000000fffff722
!	Mem[0000000030081400] = 0289bcff, %l7 = 0000000009678138
	ldsha	[%i2+%g0]0x89,%l7	! %l7 = ffffffffffffbcff
!	%l0 = 0000000000005dfd, Mem[0000000010141400] = e0e18dbb3ce87f6d
	stxa	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000000000005dfd
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = eb04db1b, %l3 = ffffffffffffffff
	lduba	[%i2+%o5]0x89,%l3	! %l3 = 000000000000001b

p0_label_19:
!	Mem[0000000030081410] = eb04db1b, %l1 = 00000000fffff722
	lduha	[%i2+%o5]0x89,%l1	! %l1 = 000000000000db1b
!	Mem[0000000030081400] = ffbc8902b01cb197, %f26 = c6100bfe 0daf7cec
	ldda	[%i2+%g0]0x81,%f26	! %f26 = ffbc8902 b01cb197
!	%l1 = 000000000000db1b, %l3 = 000000000000001b, %y  = 00000000
	umul	%l1,%l3,%l7		! %l7 = 0000000000171bd9, %y = 00000000
!	Mem[0000000010081410] = 000000ee, %l2 = 000000000000007d
	ldsha	[%i2+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101408] = ffbf6049, %f5  = e96dec05
	lda	[%i4+%o4]0x80,%f5 	! %f5 = ffbf6049
!	Mem[0000000030081410] = 1bdb04eb, %l7 = 0000000000171bd9
	lduba	[%i2+%o5]0x81,%l7	! %l7 = 000000000000001b
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000030001400] = 000066b3 048fa16b a5e9ac63 d9af76d2
!	Mem[0000000030001410] = 05b0b7b6 b1dfcfbd 0de00ad7 3f0316a6
!	Mem[0000000030001420] = ffbf607e bea1eff2 7e848291 012e512a
!	Mem[0000000030001430] = 0b8ebdd3 e299e9e3 11872dd6 85f46044
	ldda	[%i0]ASI_BLK_S,%f0	! Block Load from 0000000030001400
!	Mem[00000000300c1408] = 4befa1be4960bfff, %f20 = 05ec6de9 474839bf
	ldda	[%i3+%o4]0x81,%f20	! %f20 = 4befa1be 4960bfff
!	Mem[0000000010141410] = 63c1e814, %l6 = 000000000000005e
	lduwa	[%i5+%o5]0x88,%l6	! %l6 = 0000000063c1e814
!	Starting 10 instruction Store Burst
!	Mem[000000001008141c] = 55c5ff92, %l6 = 63c1e814, %l1 = 0000db1b
	add	%i2,0x1c,%g1
	casa	[%g1]0x80,%l6,%l1	! %l1 = 0000000055c5ff92

p0_label_20:
!	%f30 = 2fc09ddd c193a468, Mem[0000000010141420] = fd5d119e 072e55cd
	stda	%f30,[%i5+0x020]%asi	! Mem[0000000010141420] = 2fc09ddd c193a468
!	%l2 = 00000000, %l3 = 0000001b, Mem[00000000300c1408] = bea1ef4b ffbf6049
	stda	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000 0000001b
!	%l0 = 0000000000005dfd, imm = fffffffffffff19f, %l0 = 0000000000005dfd
	subc	%l0,-0xe61,%l0		! %l0 = 0000000000006c5e
!	%f18 = 000000ee 00000000, %l0 = 0000000000006c5e
!	Mem[0000000030181418] = 002322f056dab74d
	add	%i6,0x018,%g1
	stda	%f18,[%g1+%l0]ASI_PST8_S ! Mem[0000000030181418] = 000022ee0000004d
!	Mem[0000000010001410] = 05ec6de9, %l6 = 0000000063c1e814
	ldstuba	[%i0+%o5]0x80,%l6	! %l6 = 00000005000000ff
!	%l0 = 00006c5e, %l1 = 55c5ff92, Mem[0000000010041408] = 00ee68f5 09678138
	stda	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 00006c5e 55c5ff92
!	%f24 = a5e9ac63 94b18a76, Mem[0000000010081408] = bda3ae5e 5ce9b16a
	stda	%f24,[%i2+%o4]0x80	! Mem[0000000010081408] = a5e9ac63 94b18a76
!	Mem[0000000010181404] = 36c0c225, %l3 = 0000001b, %l0 = 00006c5e
	add	%i6,0x04,%g1
	casa	[%g1]0x80,%l3,%l0	! %l0 = 0000000036c0c225
!	%l2 = 0000000000000000, Mem[0000000010141430] = 0782d3ac, %asi = 80
	stwa	%l2,[%i5+0x030]%asi	! Mem[0000000010141430] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = daa0f09d, %l3 = 000000000000001b
	lduha	[%i1+%o5]0x81,%l3	! %l3 = 000000000000daa0

p0_label_21:
!	Mem[0000000010101400] = c7eb5dfd, %f26 = ffbc8902
	lda	[%i4+%g0]0x88,%f26	! %f26 = c7eb5dfd
!	%f28 = ff000000, %f23 = 377af558
	fcmps	%fcc0,%f28,%f23		! %fcc0 = 1
!	Mem[0000000030001408] = 63ace9a5, %l5 = 00000000000000ff
	lduha	[%i0+%o4]0x89,%l5	! %l5 = 000000000000e9a5
!	Mem[0000000010101410] = c248d6c5, %l0 = 0000000036c0c225
	lduba	[%i4+%o5]0x80,%l0	! %l0 = 00000000000000c2
!	Mem[0000000030081410] = 60047005 eb04db1b, %l2 = 00000000, %l3 = 0000daa0
	ldda	[%i2+%o5]0x89,%l2	! %l2 = 00000000eb04db1b 0000000060047005
!	Mem[0000000030041400] = be6a4109 3833c7eb, %l2 = eb04db1b, %l3 = 60047005
	ldda	[%i1+%g0]0x81,%l2	! %l2 = 00000000be6a4109 000000003833c7eb
!	%l7 = 000000000000001b, imm = 0000000000000657, %l2 = 00000000be6a4109
	add	%l7,0x657,%l2		! %l2 = 0000000000000672
!	Mem[0000000010081400] = be7453cf9f6ec53a, %f30 = 2fc09ddd c193a468
	ldda	[%i2+0x000]%asi,%f30	! %f30 = be7453cf 9f6ec53a
!	Mem[0000000030181410] = bf394847 e96dec05, %l4 = 666a2e55, %l5 = 0000e9a5
	ldda	[%i6+%o5]0x89,%l4	! %l4 = 00000000e96dec05 00000000bf394847
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = ffbf6049, %l3 = 000000003833c7eb
	swapa	[%i4+%o4]0x80,%l3	! %l3 = 00000000ffbf6049

p0_label_22:
!	%l6 = 0000000000000005, Mem[00000000201c0000] = ff504c08, %asi = 80
	stha	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00054c08
!	%l5 = 00000000bf394847, imm = fffffffffffffe75, %l2 = 0000000000000672
	and	%l5,-0x18b,%l2		! %l2 = 00000000bf394845
	membar	#Sync			! Added by membar checker (7)
!	%l1 = 0000000055c5ff92, Mem[0000000030001410] = 05b0b7b6
	stha	%l1,[%i0+%o5]0x81	! Mem[0000000030001410] = ff92b7b6
!	%l6 = 00000005, %l7 = 0000001b, Mem[0000000010081410] = 000000ee 00000000
	stda	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000005 0000001b
!	Mem[00000000100c1400] = 768ab194, %l4 = 00000000e96dec05
	ldstuba	[%i3+%g0]0x88,%l4	! %l4 = 00000094000000ff
!	Mem[0000000010041400] = 00000071, %l6 = 0000000000000005
	ldstuba	[%i1+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	%l1 = 0000000055c5ff92, %l6 = 0000000000000000, %l7 = 000000000000001b
	sdivx	%l1,%l6,%l7		! Div by zero, %l0 = 0000000000000112
!	Mem[0000000010041400] = ff000071, %l2 = 00000000bf394845
	lduwa	[%i1+%g0]0x80,%l2	! %l2 = 00000000ff000071
!	%l2 = ff000071, %l3 = ffbf6049, Mem[0000000010141438] = 944c8e2c cc6e2f05
	stda	%l2,[%i5+0x038]%asi	! Mem[0000000010141438] = ff000071 ffbf6049
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ff000071, %l7 = 000000000000001b
	ldsba	[%i1+%g0]0x80,%l7	! %l7 = ffffffffffffffff

p0_label_23:
!	Mem[0000000010181434] = c1307e7d, %l6 = 0000000000000000
	ldsb	[%i6+0x034],%l6		! %l6 = ffffffffffffffc1
!	Mem[0000000010101400] = c7eb5dfd, %l4 = 0000000000000094
	lduwa	[%i4+%g0]0x88,%l4	! %l4 = 00000000c7eb5dfd
!	Mem[0000000030141410] = 6deed32bbdffffff, %f12 = 0b8ebdd3 e299e9e3
	ldda	[%i5+%o5]0x89,%f12	! %f12 = 6deed32b bdffffff
!	Mem[0000000030181410] = 05ec6de9 474839bf, %l0 = 000000ea, %l1 = 55c5ff92
	ldda	[%i6+%o5]0x81,%l0	! %l0 = 0000000005ec6de9 00000000474839bf
!	Mem[0000000021800180] = 4bedbd9f, %l6 = ffffffffffffffc1
	ldsha	[%o3+0x180]%asi,%l6	! %l6 = 0000000000004bed
!	Mem[0000000010001410] = ffec6de9, %l3 = 00000000ffbf6049
	ldsba	[%i0+%o5]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010001410] = e96decff, %f1  = 048fa16b
	lda	[%i0+%o5]0x88,%f1 	! %f1 = e96decff
!	Mem[0000000010141410] = 14e8c163, %l0 = 0000000005ec6de9
	ldsba	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000014
!	Mem[0000000010181410] = 00000000000015d7, %f10 = 7e848291 012e512a
	ldda	[%i6+%o5]0x88,%f10	! %f10 = 00000000 000015d7
!	Starting 10 instruction Store Burst
!	%f2  = a5e9ac63, %f4  = 05b0b7b6, %f6  = 0de00ad7
	fmuls	%f2 ,%f4 ,%f6 		! %f6  = 80000000

p0_label_24:
!	Mem[0000000030141408] = e315e83c, %l2 = 00000000ff000071
	ldstuba	[%i5+%o4]0x81,%l2	! %l2 = 000000e3000000ff
!	%l5 = 00000000bf394847, Mem[00000000300c1408] = 000000001b000000
	stxa	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000bf394847
!	%l5 = 00000000bf394847, Mem[0000000010181408] = ff480000
	stba	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = ff480047
!	Code Fragment 4
p0_fragment_2:
!	%l0 = 0000000000000014
	setx	0xceff4e7fa8d0e2cc,%g7,%l0 ! %l0 = ceff4e7fa8d0e2cc
!	%l1 = 00000000474839bf
	setx	0x24fe23101b38490a,%g7,%l1 ! %l1 = 24fe23101b38490a
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = ceff4e7fa8d0e2cc
	setx	0x787cab983574c6cd,%g7,%l0 ! %l0 = 787cab983574c6cd
!	%l1 = 24fe23101b38490a
	setx	0x2e093b307661040b,%g7,%l1 ! %l1 = 2e093b307661040b
!	%l3 = ffffffffffffffff, Mem[0000000030101400] = 00dd0448
	stha	%l3,[%i4+%g0]0x81	! Mem[0000000030101400] = ffff0448
!	%l6 = 00004bed, %l7 = ffffffff, Mem[0000000010041400] = ff000071 f86b1e23
	stda	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 00004bed ffffffff
!	%f19 = 00000000, %f16 = bd7a5072, %f28 = ff000000
	fdivs	%f19,%f16,%f28		! %f28 = 80000000
!	%l4 = 00000000c7eb5dfd, Mem[0000000010101408] = ebc73338
	stha	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = ebc75dfd
!	Mem[0000000010041408] = 5e6c0000, %l4 = 00000000c7eb5dfd
	ldstuba	[%i1+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 9a828394 ff480047, %l6 = 00004bed, %l7 = ffffffff
	ldda	[%i6+%o4]0x88,%l6	! %l6 = 00000000ff480047 000000009a828394

p0_label_25:
!	Mem[0000000030181400] = ff000000 36c0c225, %l6 = ff480047, %l7 = 9a828394
	ldda	[%i6+%g0]0x89,%l6	! %l6 = 0000000036c0c225 00000000ff000000
!	Mem[0000000030081410] = eb04db1b, %l4 = 0000000000000000
	lduha	[%i2+%o5]0x89,%l4	! %l4 = 000000000000db1b
!	%l6 = 0000000036c0c225, %l5 = 00000000bf394847, %l2 = 00000000000000e3
	xor	%l6,%l5,%l2		! %l2 = 0000000089f98a62
!	Mem[0000000010081408] = a5e9ac63 94b18a76, %l0 = 3574c6cd, %l1 = 7661040b
	ldda	[%i2+%o4]0x80,%l0	! %l0 = 00000000a5e9ac63 0000000094b18a76
!	Mem[0000000010001410] = ffec6de9474839bf, %f4  = 05b0b7b6 b1dfcfbd
	ldda	[%i0+%o5]0x80,%f4 	! %f4  = ffec6de9 474839bf
!	%l7 = 00000000ff000000, imm = fffffffffffff153, %l5 = 00000000bf394847
	xor	%l7,-0xead,%l5		! %l5 = ffffffff00fff153
!	Mem[0000000030181410] = e96dec05, %l7 = 00000000ff000000
	lduba	[%i6+%o5]0x89,%l7	! %l7 = 0000000000000005
!	Mem[00000000300c1400] = 95cfd873, %l7 = 0000000000000005
	lduha	[%i3+%g0]0x81,%l7	! %l7 = 00000000000095cf
!	Mem[00000000100c1410] = 2fc09dddc193a468, %l2 = 0000000089f98a62
	ldxa	[%i3+%o5]0x80,%l2	! %l2 = 2fc09dddc193a468
!	Starting 10 instruction Store Burst
!	%f10 = 00000000, %f8  = ffbf607e
	fcmpes	%fcc3,%f10,%f8 		! %fcc3 = 3

p0_label_26:
!	%f22 = 16e71a6f, Mem[000000001000143c] = 5448ead0
	st	%f22,[%i0+0x03c]	! Mem[000000001000143c] = 16e71a6f
!	%f8  = ffbf607e, Mem[0000000030101408] = 0000fff5
	sta	%f8 ,[%i4+%o4]0x81	! Mem[0000000030101408] = ffbf607e
!	%f9  = bea1eff2, Mem[0000000030181410] = e96dec05
	sta	%f9 ,[%i6+%o5]0x89	! Mem[0000000030181410] = bea1eff2
!	%f14 = 11872dd6 85f46044, Mem[0000000010141408] = d7c76781 a7094efb
	stda	%f14,[%i5+%o4]0x80	! Mem[0000000010141408] = 11872dd6 85f46044
!	Mem[0000000030141410] = bdffffff, %l5 = ffffffff00fff153
	ldstuba	[%i5+%o5]0x89,%l5	! %l5 = 000000ff000000ff
!	%f18 = 000000ee 00000000, Mem[0000000010181410] = 000015d7 00000000
	stda	%f18,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ee 00000000
!	%f28 = 80000000 36c0c225, Mem[0000000010081400] = cf5374be 3ac56e9f
	stda	%f28,[%i2+%g0]0x88	! Mem[0000000010081400] = 80000000 36c0c225
!	Mem[0000000010041420] = 19df3cea, %l3 = ffffffffffffffff, %asi = 80
	swapa	[%i1+0x020]%asi,%l3	! %l3 = 0000000019df3cea
!	%l2 = 2fc09dddc193a468, Mem[000000001018142e] = 81ec1b4a
	stb	%l2,[%i6+0x02e]		! Mem[000000001018142c] = 81ec684a
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 3d702fb7c7eb5dfd, %f10 = 00000000 000015d7
	ldda	[%i4+%g0]0x88,%f10	! %f10 = 3d702fb7 c7eb5dfd

p0_label_27:
!	Mem[000000001008140c] = 94b18a76, %l7 = 00000000000095cf
	ldsh	[%i2+0x00e],%l7		! %l7 = ffffffffffff8a76
!	Mem[00000000211c0000] = ffff85d2, %l3 = 0000000019df3cea
	lduh	[%o2+%g0],%l3		! %l3 = 000000000000ffff
!	Mem[0000000030001410] = ff92b7b6, %l0 = 00000000a5e9ac63
	lduha	[%i0+%o5]0x81,%l0	! %l0 = 000000000000ff92
!	Mem[0000000010101428] = 765c210f, %l2 = 2fc09dddc193a468
	ldsb	[%i4+0x02b],%l2		! %l2 = 000000000000000f
!	Mem[0000000010141410] = 63c1e814, %l5 = 00000000000000ff
	lduha	[%i5+%o5]0x88,%l5	! %l5 = 000000000000e814
!	Mem[0000000030181400] = 25c2c036, %l0 = 000000000000ff92
	lduba	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000025
!	Mem[0000000010141400] = fd5d0000, %l0 = 0000000000000025
	ldsha	[%i5+%g0]0x80,%l0	! %l0 = fffffffffffffd5d
!	Mem[0000000030181408] = c3350dbe eb04db1b, %l6 = 36c0c225, %l7 = ffff8a76
	ldda	[%i6+%o4]0x81,%l6	! %l6 = 00000000c3350dbe 00000000eb04db1b
!	Mem[0000000010141410] = 63c1e814, %f9  = bea1eff2
	lda	[%i5+%o5]0x88,%f9 	! %f9 = 63c1e814
!	Starting 10 instruction Store Burst
!	%f0  = 000066b3 e96decff a5e9ac63 d9af76d2
!	%f4  = ffec6de9 474839bf 80000000 3f0316a6
!	%f8  = ffbf607e 63c1e814 3d702fb7 c7eb5dfd
!	%f12 = 6deed32b bdffffff 11872dd6 85f46044
	stda	%f0,[%i6]ASI_COMMIT_S	! Block Store to 0000000030181400

p0_label_28:
!	Mem[00000000100c143b] = b4e1f0f6, %l3 = 000000000000ffff
	ldstuba	[%i3+0x03b]%asi,%l3	! %l3 = 000000f6000000ff
!	%f18 = 000000ee 00000000, %l0 = fffffffffffffd5d
!	Mem[0000000010041410] = 5ee3f35e37328bd7
	add	%i1,0x010,%g1
	stda	%f18,[%g1+%l0]ASI_PST8_P ! Mem[0000000010041410] = 5e00f3ee00008b00
!	%l2 = 000000000000000f, Mem[00000000100c1406] = 271c236d
	sth	%l2,[%i3+0x006]		! Mem[00000000100c1404] = 271c000f
!	%l3 = 00000000000000f6, Mem[0000000010141408] = d62d8711
	stha	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = d62d00f6
!	%l5 = 000000000000e814, Mem[0000000010101408] = ebc75dfd
	stwa	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000e814
!	%l6 = 00000000c3350dbe, Mem[0000000010101408] = 0000e814
	stwa	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = c3350dbe
!	%l5 = 000000000000e814, Mem[00000000100c1436] = df489a2d, %asi = 80
	stha	%l5,[%i3+0x036]%asi	! Mem[00000000100c1434] = df48e814
	membar	#Sync			! Added by membar checker (8)
!	%f16 = bd7a5072, Mem[0000000010181408] = ff480047
	sta	%f16,[%i6+%o4]0x88	! Mem[0000000010181408] = bd7a5072
!	Mem[00000000300c1410] = be6a0000, %l1 = 0000000094b18a76
	ldstuba	[%i3+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 000000050000001b, %l7 = 00000000eb04db1b
	ldx	[%i2+%o5],%l7		! %l7 = 000000050000001b

p0_label_29:
!	Mem[0000000030141408] = 3ce815ff, %l1 = 0000000000000000
	ldswa	[%i5+%o4]0x89,%l1	! %l1 = 000000003ce815ff
!	Mem[0000000010081408] = 63ace9a5, %l1 = 000000003ce815ff
	lduba	[%i2+%o4]0x88,%l1	! %l1 = 00000000000000a5
!	Mem[00000000300c1410] = ff006abe, %l2 = 000000000000000f
	lduwa	[%i3+%o5]0x81,%l2	! %l2 = 00000000ff006abe
!	Mem[00000000100c1410] = 2fc09dddc193a468, %l4 = 000000000000db1b
	ldxa	[%i3+%o5]0x80,%l4	! %l4 = 2fc09dddc193a468
!	Mem[0000000030041408] = 541f1aff, %l7 = 000000050000001b
	ldsba	[%i1+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010081410] = 000000050000001b, %f12 = 6deed32b bdffffff
	ldda	[%i2+%o5]0x80,%f12	! %f12 = 00000005 0000001b
!	Mem[0000000030081408] = 450440d6, %f7  = 3f0316a6
	lda	[%i2+%o4]0x81,%f7 	! %f7 = 450440d6
!	Mem[0000000010141410] = 14e8c163, %l3 = 00000000000000f6
	lduha	[%i5+%o5]0x80,%l3	! %l3 = 00000000000014e8
!	Mem[0000000010101404] = b72f703d, %l3 = 00000000000014e8
	ldub	[%i4+0x005],%l3		! %l3 = 000000000000002f
!	Starting 10 instruction Store Burst
!	%f0  = 000066b3 e96decff, Mem[0000000010181408] = bd7a5072 9a828394
	stda	%f0 ,[%i6+%o4]0x88	! Mem[0000000010181408] = 000066b3 e96decff

p0_label_30:
!	Mem[0000000020800001] = 5fecba64, %l1 = 00000000000000a5
	ldstuba	[%o1+0x001]%asi,%l1	! %l1 = 000000ec000000ff
!	%l2 = 00000000ff006abe, %l6 = 00000000c3350dbe, %l6 = 00000000c3350dbe
	and	%l2,%l6,%l6		! %l6 = 00000000c30008be
!	Mem[0000000030141400] = fff5c11a, %l3 = 000000000000002f
	ldstuba	[%i5+%g0]0x81,%l3	! %l3 = 000000ff000000ff
!	%l1 = 00000000000000ec, Mem[0000000010181408] = ffec6de9
	stha	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = 00ec6de9
!	Mem[0000000010141413] = 14e8c163, %l1 = 00000000000000ec
	ldstub	[%i5+0x013],%l1		! %l1 = 00000063000000ff
!	%f28 = 80000000 36c0c225, %l2 = 00000000ff006abe
!	Mem[0000000010081420] = 00000a6c96e4ffcd
	add	%i2,0x020,%g1
	stda	%f28,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010081420] = 00000a6c00000080
!	%l1 = 0000000000000063, Mem[0000000010181400] = 000000ff
	stba	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000063
!	Mem[0000000010181424] = 09a81740, %l1 = 0000000000000063
	ldstub	[%i6+0x024],%l1		! %l1 = 00000009000000ff
!	Mem[0000000030001408] = a5e9ac63, %l3 = 00000000000000ff
	swapa	[%i0+%o4]0x81,%l3	! %l3 = 00000000a5e9ac63
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff85d2, %l4 = 2fc09dddc193a468
	ldsh	[%o2+%g0],%l4		! %l4 = ffffffffffffffff

p0_label_31:
!	Mem[00000000211c0000] = ffff85d2, %l6 = 00000000c30008be
	lduha	[%o2+0x000]%asi,%l6	! %l6 = 000000000000ffff
!	%l2 = 00000000ff006abe, %l1 = 0000000000000009, %l2 = 00000000ff006abe
	udivx	%l2,%l1,%l2		! %l2 = 000000001c556131
!	Mem[0000000010001410] = ffec6de9, %f15 = 85f46044
	lda	[%i0+0x010]%asi,%f15	! %f15 = ffec6de9
!	Mem[0000000030101410] = 820fd78c, %l2 = 000000001c556131
	ldsba	[%i4+%o5]0x81,%l2	! %l2 = ffffffffffffff82
!	Mem[0000000030041410] = daa0f09d, %l2 = ffffffffffffff82
	ldsha	[%i1+%o5]0x81,%l2	! %l2 = ffffffffffffdaa0
!	Mem[0000000010181400] = 63000000, %l3 = 00000000a5e9ac63
	ldsba	[%i6+%g0]0x80,%l3	! %l3 = 0000000000000063
!	Mem[0000000010181428] = b91090d3, %l7 = ffffffffffffffff
	lduwa	[%i6+0x028]%asi,%l7	! %l7 = 00000000b91090d3
!	Mem[0000000030141400] = bd7a50721ac1f5ff, %f8  = ffbf607e 63c1e814
	ldda	[%i5+%g0]0x89,%f8 	! %f8  = bd7a5072 1ac1f5ff
!	Mem[0000000010101410] = c248d6c5, %l3 = 0000000000000063
	ldsba	[%i4+%o5]0x80,%l3	! %l3 = ffffffffffffffc2
!	Starting 10 instruction Store Burst
!	Mem[000000001000143c] = 16e71a6f, %l2 = ffffffffffffdaa0
	swap	[%i0+0x03c],%l2		! %l2 = 0000000016e71a6f

p0_label_32:
!	Mem[0000000010081424] = 00000080, %l2 = 0000000016e71a6f, %asi = 80
	swapa	[%i2+0x024]%asi,%l2	! %l2 = 0000000000000080
!	%l4 = ffffffffffffffff, Mem[00000000300c1410] = be6a00ff
	stwa	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffffffff
!	Mem[00000000100c1400] = 768ab1ff, %l1 = 0000000000000009
	ldstuba	[%i3+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	%l0 = fffffd5d, %l1 = 000000ff, Mem[0000000010041400] = 00004bed ffffffff
	stda	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = fffffd5d 000000ff
!	Mem[0000000010101408] = c3350dbe, %l7 = 00000000b91090d3
	swapa	[%i4+%o4]0x88,%l7	! %l7 = 00000000c3350dbe
!	%l2 = 0000000000000080, %l5 = 000000000000e814, %l0 = fffffffffffffd5d
	xor	%l2,%l5,%l0		! %l0 = 000000000000e894
!	%l6 = 000000000000ffff, Mem[0000000010041408] = ff006c5e
	stwa	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000ffff
!	%l6 = 000000000000ffff, Mem[00000000100c142a] = 7c829e0f
	sth	%l6,[%i3+0x02a]		! Mem[00000000100c1428] = 7c82ffff
!	%l1 = 00000000000000ff, Mem[0000000030041408] = ff1a1f545d890443
	stxa	%l1,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = f6002dd685f46044, %f14 = 11872dd6 ffec6de9
	ldda	[%i5+%o4]0x80,%f14	! %f14 = f6002dd6 85f46044

p0_label_33:
!	Mem[0000000010041400] = 5dfdffff, %l2 = 0000000000000080
	lduwa	[%i1+%g0]0x88,%l2	! %l2 = 000000005dfdffff
!	Mem[00000000300c1400] = 95cfd873, %l4 = ffffffffffffffff
	ldsha	[%i3+%g0]0x81,%l4	! %l4 = ffffffffffff95cf
!	Mem[00000000100c1410] = 68a493c1 dd9dc02f, %l4 = ffff95cf, %l5 = 0000e814
	ldda	[%i3+%o5]0x88,%l4	! %l4 = 00000000dd9dc02f 0000000068a493c1
!	Mem[0000000010001434] = 09416abe, %f6  = 80000000
	lda	[%i0+0x034]%asi,%f6 	! %f6 = 09416abe
!	Mem[0000000030081408] = 450440d6, %l4 = 00000000dd9dc02f
	lduba	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000045
!	Mem[0000000010101400] = fd5debc7 b72f703d, %l4 = 00000045, %l5 = 68a493c1
	ldda	[%i4+%g0]0x80,%l4	! %l4 = 00000000fd5debc7 00000000b72f703d
!	Mem[0000000030181408] = 63ace9a5, %f15 = 85f46044
	lda	[%i6+%o4]0x89,%f15	! %f15 = 63ace9a5
!	Mem[0000000030101410] = 820fd78c34a57857, %f26 = c7eb5dfd b01cb197
	ldda	[%i4+%o5]0x81,%f26	! %f26 = 820fd78c 34a57857
!	%l4 = 00000000fd5debc7, imm = fffffffffffffc1f, %l2 = 000000005dfdffff
	orn	%l4,-0x3e1,%l2		! %l2 = 00000000fd5debe7
!	Starting 10 instruction Store Burst
!	%f4  = ffec6de9 474839bf, Mem[0000000030001408] = ff000000 d276afd9
	stda	%f4 ,[%i0+%o4]0x89	! Mem[0000000030001408] = ffec6de9 474839bf

p0_label_34:
!	Mem[0000000030181408] = a5e9ac63, %l7 = 00000000c3350dbe
	swapa	[%i6+%o4]0x81,%l7	! %l7 = 00000000a5e9ac63
!	%l5 = 00000000b72f703d, Mem[00000000100c1408] = a892b731
	stha	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 703db731
!	Mem[0000000010041410] = eef3005e, %l6 = 000000000000ffff
	swapa	[%i1+%o5]0x88,%l6	! %l6 = 00000000eef3005e
!	%l6 = 00000000eef3005e, Mem[0000000010081408] = 63ace9a5
	stha	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 63ac005e
!	Mem[0000000010101408] = d39010b9bea1ef4b, %l7 = 00000000a5e9ac63, %l2 = 00000000fd5debe7
	add	%i4,0x08,%g1
	casxa	[%g1]0x80,%l7,%l2	! %l2 = d39010b9bea1ef4b
!	%l1 = 00000000000000ff, Mem[0000000030081408] = 450440d6
	stwa	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000ff
!	%l4 = 00000000fd5debc7, %l3 = ffffffffffffffc2, %l4 = 00000000fd5debc7
	sub	%l4,%l3,%l4		! %l4 = 00000000fd5dec05
!	%f3  = d9af76d2, Mem[00000000300c1400] = 73d8cf95
	sta	%f3 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = d9af76d2
!	%f25 = 94b18a76, %f3  = d9af76d2
	fcmpes	%fcc2,%f25,%f3 		! %fcc2 = 2
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 600470052bee0573, %l2 = d39010b9bea1ef4b
	ldxa	[%i0+%g0]0x80,%l2	! %l2 = 600470052bee0573

p0_label_35:
!	%f25 = 94b18a76, %f20 = 4befa1be
	fcmpes	%fcc2,%f25,%f20		! %fcc2 = 1
!	Mem[0000000010041400] = fffffd5d, %l0 = 000000000000e894
	lduwa	[%i1+%g0]0x80,%l0	! %l0 = 00000000fffffd5d
!	Mem[0000000010001410] = e96decff, %l5 = 00000000b72f703d
	lduha	[%i0+%o5]0x88,%l5	! %l5 = 000000000000ecff
!	Mem[0000000010081408] = 5e00ac6394b18a76, %f2  = a5e9ac63 d9af76d2
	ldd	[%i2+%o4],%f2 		! %f2  = 5e00ac63 94b18a76
!	Mem[0000000010001400] = 600470052bee0573, %f8  = bd7a5072 1ac1f5ff
	ldda	[%i0+%g0]0x80,%f8 	! %f8  = 60047005 2bee0573
!	Mem[0000000010181410] = 00000000, %l4 = 00000000fd5dec05
	ldswa	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141420] = 2fc09dddc193a468, %f20 = 4befa1be 4960bfff
	ldd	[%i5+0x020],%f20	! %f20 = 2fc09ddd c193a468
!	Mem[00000000211c0000] = ffff85d2, %l5 = 000000000000ecff
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = ffffffffffffffff
!	%l7 = 00000000a5e9ac63, %l6 = 00000000eef3005e, %l0 = 00000000fffffd5d
	xor	%l7,%l6,%l0		! %l0 = 000000004b1aac3d
!	Starting 10 instruction Store Burst
!	%l7 = 00000000a5e9ac63, Mem[00000000100c1428] = 7c82ffff0ac5eded, %asi = 80
	stxa	%l7,[%i3+0x028]%asi	! Mem[00000000100c1428] = 00000000a5e9ac63

p0_label_36:
!	Mem[0000000010081408] = 63ac005e, %l7 = 00000000a5e9ac63
	swapa	[%i2+%o4]0x88,%l7	! %l7 = 0000000063ac005e
!	Mem[00000000100c1410] = dd9dc02f, %l5 = ffffffffffffffff
	ldstuba	[%i3+%o5]0x88,%l5	! %l5 = 0000002f000000ff
!	%l4 = 00000000, %l5 = 0000002f, Mem[0000000010101438] = ff5e835f e834d14c
	stda	%l4,[%i4+0x038]%asi	! Mem[0000000010101438] = 00000000 0000002f
!	%l4 = 00000000, %l5 = 0000002f, Mem[0000000010081410] = 00000005 0000001b
	stda	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000 0000002f
!	Mem[00000000300c1400] = d9af76d2, %l7 = 0000000063ac005e
	swapa	[%i3+%g0]0x89,%l7	! %l7 = 00000000d9af76d2
!	Mem[0000000030181400] = b3660000, %l3 = ffffffffffffffc2
	swapa	[%i6+%g0]0x89,%l3	! %l3 = 00000000b3660000
!	Mem[0000000010081410] = 00000000, %l0 = 000000004b1aac3d
	ldstuba	[%i2+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141408] = f6002dd6, %l2 = 600470052bee0573
	ldsba	[%i5+%o4]0x80,%l2	! %l2 = fffffffffffffff6
!	%l0 = 0000000000000000, Mem[0000000030101410] = 5778a5348cd70f82
	stxa	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 0000000000000000, %l2 = fffffffffffffff6
	ldxa	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000000

p0_label_37:
!	Mem[0000000010001400] = 600470052bee0573, %l2 = 0000000000000000
	ldxa	[%i0+0x000]%asi,%l2	! %l2 = 600470052bee0573
!	Mem[0000000010001408] = c3350dbe, %l2 = 600470052bee0573
	ldsw	[%i0+%o4],%l2		! %l2 = ffffffffc3350dbe
!	Mem[0000000030101408] = 7e60bfff, %l0 = 0000000000000000
	ldsha	[%i4+%o4]0x89,%l0	! %l0 = ffffffffffffbfff
!	Mem[00000000300c1408] = 00000000, %l5 = 000000000000002f
	ldswa	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1400] = ffb18a76, %l1 = 00000000000000ff
	lduwa	[%i3+%g0]0x80,%l1	! %l1 = 00000000ffb18a76
!	Mem[0000000010101408] = d39010b9, %l1 = 00000000ffb18a76
	ldub	[%i4+0x00b],%l1		! %l1 = 00000000000000b9
!	Mem[00000000201c0000] = 00054c08, %l3 = 00000000b3660000
	ldsh	[%o0+%g0],%l3		! %l3 = 0000000000000005
!	%f16 = bd7a5072, %f30 = be7453cf, %f2  = 5e00ac63 94b18a76
	fsmuld	%f16,%f30,%f2 		! %f2  = 3f8ddcd3 e48045c0
!	Mem[00000000300c1410] = f7a211e6 ffffffff, %l6 = eef3005e, %l7 = d9af76d2
	ldda	[%i3+%o5]0x89,%l6	! %l6 = 00000000ffffffff 00000000f7a211e6
!	Starting 10 instruction Store Burst
!	%f24 = a5e9ac63 94b18a76, Mem[0000000010001410] = e96decff bf394847
	stda	%f24,[%i0+%o5]0x88	! Mem[0000000010001410] = a5e9ac63 94b18a76

p0_label_38:
!	Mem[0000000030041400] = be6a4109, %l1 = 00000000000000b9
	ldstuba	[%i1+%g0]0x81,%l1	! %l1 = 000000be000000ff
!	Mem[0000000010141430] = 00000000d1122200, %l0 = ffffffffffffbfff, %l4 = 0000000000000000
	add	%i5,0x30,%g1
	casxa	[%g1]0x80,%l0,%l4	! %l4 = 00000000d1122200
!	%f8  = 60047005, Mem[0000000010141410] = ffc1e814
	sta	%f8 ,[%i5+%o5]0x88	! Mem[0000000010141410] = 60047005
!	Mem[000000001000141c] = 56dab74d, %l0 = ffffffffffffbfff, %asi = 80
	swapa	[%i0+0x01c]%asi,%l0	! %l0 = 0000000056dab74d
!	%f26 = 820fd78c, Mem[00000000300c1400] = 5e00ac63
	sta	%f26,[%i3+%g0]0x81	! Mem[00000000300c1400] = 820fd78c
!	%f0  = 000066b3 e96decff 3f8ddcd3 e48045c0
!	%f4  = ffec6de9 474839bf 09416abe 450440d6
!	%f8  = 60047005 2bee0573 3d702fb7 c7eb5dfd
!	%f12 = 00000005 0000001b f6002dd6 63ace9a5
	stda	%f0,[%i6]ASI_BLK_AIUP	! Block Store to 0000000010181400
!	Mem[0000000030181408] = be0d35c3, %l7 = 00000000f7a211e6
	swapa	[%i6+%o4]0x89,%l7	! %l7 = 00000000be0d35c3
!	%l2 = ffffffffc3350dbe, Mem[000000001000141c] = ffffbfff, %asi = 80
	stwa	%l2,[%i0+0x01c]%asi	! Mem[000000001000141c] = c3350dbe
!	Mem[0000000030141410] = bdffffff, %l5 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l5	! %l5 = 00000000bdffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ffc09dddc193a468, %f22 = 16e71a6f 377af558
	ldda	[%i3+%o5]0x80,%f22	! %f22 = ffc09ddd c193a468

p0_label_39:
!	Mem[0000000030041408] = 00000000, %l4 = 00000000d1122200
	ldsha	[%i1+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001408] = bf394847e96decff, %l0 = 0000000056dab74d
	ldxa	[%i0+%o4]0x81,%l0	! %l0 = bf394847e96decff
!	Mem[0000000020800000] = 5fffba64, %l3 = 0000000000000005
	lduha	[%o1+0x000]%asi,%l3	! %l3 = 0000000000005fff
!	Mem[0000000010141410] = 05700460, %l2 = ffffffffc3350dbe
	ldsha	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000570
!	Mem[00000000100c1410] = ffc09dddc193a468, %f18 = 000000ee 00000000
	ldd	[%i3+%o5],%f18		! %f18 = ffc09ddd c193a468
!	Mem[0000000030081400] = 0289bcff, %l6 = 00000000ffffffff
	lduwa	[%i2+%g0]0x89,%l6	! %l6 = 000000000289bcff
!	Mem[0000000030001408] = bf394847, %l6 = 000000000289bcff
	ldsha	[%i0+%o4]0x81,%l6	! %l6 = ffffffffffffbf39
!	Mem[00000000211c0000] = ffff85d2, %l7 = 00000000be0d35c3
	ldsh	[%o2+%g0],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010081400] = 25c2c036, %l2 = 0000000000000570
	ldswa	[%i2+%g0]0x80,%l2	! %l2 = 0000000025c2c036
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000be, Mem[0000000010041418] = 70719357
	stw	%l1,[%i1+0x018]		! Mem[0000000010041418] = 000000be

p0_label_40:
!	%f16 = bd7a5072 450440d6, Mem[0000000010041410] = ffff0000 00008b00
	stda	%f16,[%i1+%o5]0x80	! Mem[0000000010041410] = bd7a5072 450440d6
!	%f16 = bd7a5072 450440d6 ffc09ddd c193a468
!	%f20 = 2fc09ddd c193a468 ffc09ddd c193a468
!	%f24 = a5e9ac63 94b18a76 820fd78c 34a57857
!	%f28 = 80000000 36c0c225 be7453cf 9f6ec53a
	stda	%f16,[%i1]ASI_COMMIT_S	! Block Store to 0000000030041400
	membar	#Sync			! Added by membar checker (9)
!	%l0 = e96decff, %l1 = 000000be, Mem[0000000010041408] = 0000ffff 55c5ff92
	stda	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = e96decff 000000be
!	Mem[0000000010041400] = 5dfdffff, %l4 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l4	! %l4 = 000000005dfdffff
!	%f30 = be7453cf, Mem[0000000010001408] = c3350dbe
	sta	%f30,[%i0+%o4]0x80	! Mem[0000000010001408] = be7453cf
!	%l5 = 00000000bdffffff, Mem[0000000030141400] = fff5c11a72507abd
	stxa	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000bdffffff
!	Mem[00000000100c1408] = 703db731, %l6 = ffffffffffffbf39
	swapa	[%i3+%o4]0x80,%l6	! %l6 = 00000000703db731
!	Mem[0000000030001410] = ff92b7b6, %l3 = 0000000000005fff
	swapa	[%i0+%o5]0x81,%l3	! %l3 = 00000000ff92b7b6
!	Mem[0000000010101417] = 3c4aef02, %l3 = 00000000ff92b7b6
	ldstuba	[%i4+0x017]%asi,%l3	! %l3 = 00000002000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 000066b3, %l5 = 00000000bdffffff
	lduba	[%i0+%g0]0x81,%l5	! %l5 = 0000000000000000

p0_label_41:
!	Mem[00000000100c1430] = bc5a3abb, %l0 = bf394847e96decff
	lduw	[%i3+0x030],%l0		! %l0 = 00000000bc5a3abb
!	Mem[0000000030181400] = ffffffc2, %l6 = 00000000703db731
	lduwa	[%i6+%g0]0x89,%l6	! %l6 = 00000000ffffffc2
!	Mem[0000000030101410] = 0000000000000000, %l1 = 00000000000000be
	ldxa	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = f7a211e6, %l7 = ffffffffffffffff
	ldsha	[%i6+%o4]0x89,%l7	! %l7 = 00000000000011e6
!	Mem[0000000010001400] = 60047005 2bee0573, %l6 = ffffffc2, %l7 = 000011e6
	ldda	[%i0+%g0]0x80,%l6	! %l6 = 0000000060047005 000000002bee0573
!	Mem[00000000100c1438] = b4e1f0ff, %l3 = 0000000000000002
	ldswa	[%i3+0x038]%asi,%l3	! %l3 = ffffffffb4e1f0ff
!	Mem[00000000201c0000] = 00054c08, %l6 = 0000000060047005
	ldsh	[%o0+%g0],%l6		! %l6 = 0000000000000005
!	Mem[0000000030101410] = 00000000, %l1 = 0000000000000000
	lduha	[%i4+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001408] = cf5374be, %l3 = ffffffffb4e1f0ff
	ldsba	[%i0+%o4]0x88,%l3	! %l3 = ffffffffffffffbe
!	Starting 10 instruction Store Burst
!	%f18 = ffc09ddd c193a468, Mem[0000000010141408] = d62d00f6 4460f485
	stda	%f18,[%i5+%o4]0x88	! Mem[0000000010141408] = ffc09ddd c193a468

p0_label_42:
!	%l7 = 000000002bee0573, Mem[00000000100c1408] = 00004bef39bfffff
	stxa	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000002bee0573
!	%l4 = 000000005dfdffff, Mem[0000000010041408] = ffec6de9
	stha	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = ffecffff
!	%l2 = 0000000025c2c036, immed = 0000079e, %y  = 00000000
	smul	%l2,0x79e,%l6		! %l6 = 0000011fa1741b54, %y = 0000011f
!	%f18 = ffc09ddd c193a468, %l4 = 000000005dfdffff
!	Mem[0000000030041410] = 2fc09dddc193a468
	add	%i1,0x010,%g1
	stda	%f18,[%g1+%l4]ASI_PST16_S ! Mem[0000000030041410] = ffc09dddc193a468
!	%l7 = 000000002bee0573, Mem[0000000010181410] = ffec6de9474839bf
	stx	%l7,[%i6+%o5]		! Mem[0000000010181410] = 000000002bee0573
!	%l4 = 000000005dfdffff, Mem[0000000010001420] = b554fcfcc248d6c5, %asi = 80
	stxa	%l4,[%i0+0x020]%asi	! Mem[0000000010001420] = 000000005dfdffff
!	%l7 = 000000002bee0573, Mem[00000000211c0000] = ffff85d2
	stb	%l7,[%o2+%g0]		! Mem[00000000211c0000] = 73ff85d2
!	Mem[000000001000142b] = 0289bc71, %l7 = 000000002bee0573
	ldstub	[%i0+0x02b],%l7		! %l7 = 00000071000000ff
!	%l4 = 000000005dfdffff, Mem[000000001004140a] = ffffecff
	sth	%l4,[%i1+0x00a]		! Mem[0000000010041408] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = a5e9ac63, %f5  = 474839bf
	lda	[%i2+%o4]0x88,%f5 	! %f5 = a5e9ac63

p0_label_43:
!	Mem[0000000030001408] = 474839bf, %l2 = 0000000025c2c036
	ldswa	[%i0+%o4]0x89,%l2	! %l2 = 00000000474839bf
!	Mem[0000000030181400] = ffec6de9ffffffc2, %f28 = 80000000 36c0c225
	ldda	[%i6+%g0]0x89,%f28	! %f28 = ffec6de9 ffffffc2
!	Mem[000000001004140c] = 000000be, %l4 = 000000005dfdffff
	ldsh	[%i1+0x00c],%l4		! %l4 = 0000000000000000
!	Mem[0000000030041408] = ffc09ddd, %l1 = 0000000000000000
	lduba	[%i1+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181410] = 00000000, %l1 = 00000000000000ff
	lduba	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1410] = ffffffffe611a2f7, %f4  = ffec6de9 a5e9ac63
	ldda	[%i3+%o5]0x81,%f4 	! %f4  = ffffffff e611a2f7
!	Mem[0000000030041408] = 68a493c1dd9dc0ff, %l6 = 0000011fa1741b54
	ldxa	[%i1+%o4]0x89,%l6	! %l6 = 68a493c1dd9dc0ff
!	Mem[00000000211c0000] = 73ff85d2, %l1 = 0000000000000000
	lduh	[%o2+%g0],%l1		! %l1 = 00000000000073ff
!	Mem[0000000010141400] = fd5d0000, %l4 = 0000000000000000
	lduba	[%i5+%g0]0x80,%l4	! %l4 = 00000000000000fd
!	Starting 10 instruction Store Burst
!	%f9  = 2bee0573, Mem[0000000010001418] = 002322f0
	st	%f9 ,[%i0+0x018]	! Mem[0000000010001418] = 2bee0573

p0_label_44:
!	%l3 = ffffffffffffffbe, immed = 000002d2, %y  = 0000011f
	sdiv	%l3,0x2d2,%l2		! %l2 = 00000000661dc8af
	mov	%l0,%y			! %y = bc5a3abb
!	%f12 = 00000005 0000001b, Mem[0000000010141418] = 4992ebff 140a8f00
	stda	%f12,[%i5+0x018]%asi	! Mem[0000000010141418] = 00000005 0000001b
!	%l7 = 0000000000000071, Mem[0000000010181408] = 3f8ddcd3
	stha	%l7,[%i6+%o4]0x80	! Mem[0000000010181408] = 0071dcd3
!	Mem[0000000010081428] = fd06f774, %l7 = 0000000000000071
	ldstub	[%i2+0x028],%l7		! %l7 = 000000fd000000ff
!	Mem[0000000010041400] = 00000000, %l4 = 00000000000000fd
	swapa	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000
!	%l6 = dd9dc0ff, %l7 = 000000fd, Mem[0000000030141410] = 00000000 2bd3ee6d
	stda	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = dd9dc0ff 000000fd
!	%l6 = 68a493c1dd9dc0ff, Mem[0000000010101418] = 02ef4a3c, %asi = 80
	stwa	%l6,[%i4+0x018]%asi	! Mem[0000000010101418] = dd9dc0ff
!	%l4 = 0000000000000000, %l2 = 00000000661dc8af, %l2 = 00000000661dc8af
	orn	%l4,%l2,%l2		! %l2 = ffffffff99e23750
!	%l2 = ffffffff99e23750, Mem[0000000030001400] = b3660000
	stwa	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 99e23750
!	Starting 10 instruction Load Burst
!	Mem[0000000010181428] = 3d702fb7 c7eb5dfd, %l4 = 00000000, %l5 = 00000000
	ldda	[%i6+0x028]%asi,%l4	! %l4 = 000000003d702fb7 00000000c7eb5dfd

p0_label_45:
!	Mem[0000000030181400] = c2ffffffe96decff, %l3 = ffffffffffffffbe
	ldxa	[%i6+%g0]0x81,%l3	! %l3 = c2ffffffe96decff
!	Mem[0000000010001400] = 7305ee2b05700460, %l0 = 00000000bc5a3abb
	ldxa	[%i0+%g0]0x88,%l0	! %l0 = 7305ee2b05700460
!	%f3  = e48045c0, %f11 = c7eb5dfd
	fcmpes	%fcc1,%f3 ,%f11		! %fcc1 = 1
!	Mem[0000000010041428] = bff84ba1, %l0 = 7305ee2b05700460
	ldsb	[%i1+0x029],%l0		! %l0 = fffffffffffffff8
!	Mem[0000000030141400] = 00000000, %l5 = 00000000c7eb5dfd
	ldsha	[%i5+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001400] = 5037e299, %l6 = 68a493c1dd9dc0ff
	ldsha	[%i0+%g0]0x81,%l6	! %l6 = 0000000000005037
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000030001400] = 5037e299 048fa16b bf394847 e96decff
!	Mem[0000000030001410] = 00005fff b1dfcfbd 0de00ad7 3f0316a6
!	Mem[0000000030001420] = ffbf607e bea1eff2 7e848291 012e512a
!	Mem[0000000030001430] = 0b8ebdd3 e299e9e3 11872dd6 85f46044
	ldda	[%i0]ASI_BLK_S,%f0	! Block Load from 0000000030001400
!	Mem[0000000010041408] = ffffffff 000000be, %l6 = 00005037, %l7 = 000000fd
	ldda	[%i1+%o4]0x80,%l6	! %l6 = 00000000ffffffff 00000000000000be
!	Mem[0000000030001400] = 99e23750, %l5 = 0000000000000000
	ldsba	[%i0+%g0]0x89,%l5	! %l5 = 0000000000000050
!	Starting 10 instruction Store Burst
!	Mem[0000000010101404] = b72f703d, %l1 = 00000000000073ff
	ldstuba	[%i4+0x004]%asi,%l1	! %l1 = 000000b7000000ff

p0_label_46:
!	Mem[0000000010141408] = c193a468, %l3 = c2ffffffe96decff
	ldstuba	[%i5+%o4]0x88,%l3	! %l3 = 00000068000000ff
!	Mem[0000000030001408] = bf394847, %l2 = ffffffff99e23750
	swapa	[%i0+%o4]0x81,%l2	! %l2 = 00000000bf394847
!	%l5 = 0000000000000050, %l5 = 0000000000000050, %l1 = 00000000000000b7
	addc	%l5,%l5,%l1		! %l1 = 00000000000000a0
!	%f21 = c193a468, Mem[000000001008141c] = 55c5ff92
	sta	%f21,[%i2+0x01c]%asi	! Mem[000000001008141c] = c193a468
!	Mem[0000000030081410] = eb04db1b, %l7 = 00000000000000be
	swapa	[%i2+%o5]0x89,%l7	! %l7 = 00000000eb04db1b
!	%f22 = ffc09ddd c193a468, Mem[0000000030141410] = ffc09ddd fd000000
	stda	%f22,[%i5+%o5]0x89	! Mem[0000000030141410] = ffc09ddd c193a468
!	%l0 = fffffffffffffff8, Mem[0000000010181410] = 00000000
	stwa	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = fffffff8
!	%l0 = fffffffffffffff8, imm = 0000000000000cfc, %l0 = fffffffffffffff8
	sub	%l0,0xcfc,%l0		! %l0 = fffffffffffff2fc
!	%f24 = a5e9ac63 94b18a76, %l1 = 00000000000000a0
!	Mem[00000000100c1408] = 7305ee2b00000000
	add	%i3,0x008,%g1
	stda	%f24,[%g1+%l1]ASI_PST16_P ! Mem[00000000100c1408] = 7305ee2b00000000
!	Starting 10 instruction Load Burst
!	Code Fragment 4
p0_fragment_3:
!	%l0 = fffffffffffff2fc
	setx	0x936af8d7cff398be,%g7,%l0 ! %l0 = 936af8d7cff398be
!	%l1 = 00000000000000a0
	setx	0x9d1b7f1fe8b0210f,%g7,%l1 ! %l1 = 9d1b7f1fe8b0210f
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 936af8d7cff398be
	setx	0xd5225f4808331a21,%g7,%l0 ! %l0 = d5225f4808331a21
!	%l1 = 9d1b7f1fe8b0210f
	setx	0x5569c3384fb5933a,%g7,%l1 ! %l1 = 5569c3384fb5933a

p0_label_47:
!	Mem[0000000010041408] = ffffffff, %l0 = d5225f4808331a21
	ldsba	[%i1+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010081408] = 63ace9a5, %f27 = 34a57857
	lda	[%i2+%o4]0x80,%f27	! %f27 = 63ace9a5
!	Mem[0000000010081408] = a5e9ac63, %f23 = c193a468
	lda	[%i2+%o4]0x88,%f23	! %f23 = a5e9ac63
!	Mem[0000000030181408] = e611a2f7, %l0 = ffffffffffffffff
	lduba	[%i6+%o4]0x81,%l0	! %l0 = 00000000000000e6
!	Mem[0000000030181410] = e96decff, %l5 = 0000000000000050
	lduba	[%i6+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141420] = 2fc09ddd, %l4 = 000000003d702fb7
	ldswa	[%i5+0x020]%asi,%l4	! %l4 = 000000002fc09ddd
!	Mem[0000000030081400] = ffbc8902b01cb197, %l4 = 000000002fc09ddd
	ldxa	[%i2+%g0]0x81,%l4	! %l4 = ffbc8902b01cb197
!	Mem[0000000010141400] = 0000000000005dfd, %l7 = 00000000eb04db1b
	ldxa	[%i5+%g0]0x88,%l7	! %l7 = 0000000000005dfd
!	Mem[00000000300c1408] = 00000000 bf394847, %l0 = 000000e6, %l1 = 4fb5933a
	ldda	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000 00000000bf394847
!	Starting 10 instruction Store Burst
!	%f2  = bf394847, %f7  = 3f0316a6
	fcmpes	%fcc2,%f2 ,%f7 		! %fcc2 = 1

p0_label_48:
!	Mem[0000000030181400] = c2ffffff, %l4 = ffbc8902b01cb197
	ldstuba	[%i6+%g0]0x81,%l4	! %l4 = 000000c2000000ff
!	Mem[0000000030141400] = 00000000, %l6 = 00000000ffffffff
	ldstuba	[%i5+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000010101434] = 431a4824, %asi = 80
	stwa	%l0,[%i4+0x034]%asi	! Mem[0000000010101434] = 00000000
!	%f8  = ffbf607e bea1eff2, Mem[0000000010041408] = ffffffff 000000be
	stda	%f8 ,[%i1+%o4]0x80	! Mem[0000000010041408] = ffbf607e bea1eff2
!	Mem[0000000010041418] = 000000be0896b14a, %l0 = 0000000000000000, %l3 = 0000000000000068
	add	%i1,0x18,%g1
	casxa	[%g1]0x80,%l0,%l3	! %l3 = 000000be0896b14a
!	%f22 = ffc09ddd, Mem[0000000010001400] = 60047005
	sta	%f22,[%i0+%g0]0x80	! Mem[0000000010001400] = ffc09ddd
!	Mem[0000000030181410] = e96decff, %l7 = 0000000000005dfd
	swapa	[%i6+%o5]0x89,%l7	! %l7 = 00000000e96decff
!	%l0 = 0000000000000000, Mem[0000000030141410] = 68a493c1dd9dc0ff
	stxa	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000000000000000
	membar	#Sync			! Added by membar checker (11)
!	%l2 = 00000000bf394847, Mem[0000000030001410] = bdcfdfb1ff5f0000
	stxa	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000bf394847
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = be7453cfeb04db1b, %l5 = 00000000000000ff
	ldx	[%i0+%o4],%l5		! %l5 = be7453cfeb04db1b

p0_label_49:
!	Mem[00000000300c1400] = 820fd78c493cb9ff, %l3 = 000000be0896b14a
	ldxa	[%i3+%g0]0x81,%l3	! %l3 = 820fd78c493cb9ff
!	Mem[0000000010181414] = 2bee0573, %l0 = 0000000000000000
	ldsh	[%i6+0x014],%l0		! %l0 = 0000000000002bee
!	Mem[0000000030181410] = 00005dfd, %l7 = 00000000e96decff
	ldsha	[%i6+%o5]0x89,%l7	! %l7 = 0000000000005dfd
!	Mem[00000000100c1408] = 7305ee2b, %l4 = 00000000000000c2
	lduha	[%i3+%o4]0x80,%l4	! %l4 = 0000000000007305
!	Mem[0000000030101400] = ffff0448 0d0d2138 ffbf607e 4c552e69
!	Mem[0000000030101410] = 00000000 00000000 e139503d 8ea8260e
!	Mem[0000000030101420] = 5586c10f 17a27aa7 55882df0 a2fb63dd
!	Mem[0000000030101430] = 87cb8c91 b50e61d7 ece72778 0a32e176
	ldda	[%i4]ASI_BLK_S,%f0	! Block Load from 0000000030101400
!	Mem[0000000010181400] = b3660000, %f30 = be7453cf
	lda	[%i6+%g0]0x88,%f30	! %f30 = b3660000
!	Mem[0000000030001400] = 6ba18f0499e23750, %l0 = 0000000000002bee
	ldxa	[%i0+%g0]0x89,%l0	! %l0 = 6ba18f0499e23750
!	Mem[0000000030001408] = 5037e299, %l0 = 6ba18f0499e23750
	ldsha	[%i0+%o4]0x89,%l0	! %l0 = ffffffffffffe299
!	%l7 = 0000000000005dfd, imm = fffffffffffff98b, %l3 = 820fd78c493cb9ff
	sub	%l7,-0x675,%l3		! %l3 = 0000000000006472
!	Starting 10 instruction Store Burst
!	%l5 = be7453cfeb04db1b, imm = fffffffffffff424, %l1 = 00000000bf394847
	xor	%l5,-0xbdc,%l1		! %l1 = 418bac3014fb2f3f

p0_label_50:
!	%l1 = 418bac3014fb2f3f, immed = fffff92f, %y  = bc5a3abb
	udiv	%l1,-0x6d1,%l6		! %l6 = 00000000bc5a3fbe
	mov	%l0,%y			! %y = ffffe299
!	%l1 = 418bac3014fb2f3f, Mem[0000000010141408] = ffa493c1, %asi = 80
	stba	%l1,[%i5+0x008]%asi	! Mem[0000000010141408] = 3fa493c1
!	%f28 = ffec6de9 ffffffc2, Mem[0000000010141408] = 3fa493c1 dd9dc0ff
	stda	%f28,[%i5+0x008]%asi	! Mem[0000000010141408] = ffec6de9 ffffffc2
!	%l7 = 0000000000005dfd, Mem[0000000010081408] = 63ace9a594b18a76
	stxa	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000005dfd
!	%l3 = 0000000000006472, Mem[0000000010001430] = 820fd78c09416abe
	stx	%l3,[%i0+0x030]		! Mem[0000000010001430] = 0000000000006472
!	%l4 = 0000000000007305, Mem[00000000100c143d] = 6740d656, %asi = 80
	stba	%l4,[%i3+0x03d]%asi	! Mem[00000000100c143c] = 6705d656
!	%l3 = 0000000000006472, Mem[0000000030001408] = 99e23750
	stba	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = 72e23750
!	Mem[00000000300c1408] = 00000000, %l0 = ffffffffffffe299
	ldstuba	[%i3+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	%l7 = 0000000000005dfd, Mem[0000000010141410] = 60047005
	stwa	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 00005dfd
!	Starting 10 instruction Load Burst
!	Mem[0000000021800180] = 4bedbd9f, %l0 = 0000000000000000
	lduh	[%o3+0x180],%l0		! %l0 = 0000000000004bed

p0_label_51:
!	Mem[0000000030001400] = 99e23750, %f31 = 9f6ec53a
	lda	[%i0+%g0]0x89,%f31	! %f31 = 99e23750
!	Mem[00000000300c1408] = 474839bf000000ff, %f16 = bd7a5072 450440d6
	ldda	[%i3+%o4]0x89,%f16	! %f16 = 474839bf 000000ff
!	Mem[00000000300c1408] = 000000ff, %l4 = 0000000000007305
	lduba	[%i3+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1408] = 000000ff, %l6 = 00000000bc5a3fbe
	ldsba	[%i3+%o4]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030181410] = 00005dfd, %l5 = be7453cfeb04db1b
	ldsba	[%i6+%o5]0x89,%l5	! %l5 = fffffffffffffffd
!	Mem[0000000010141418] = 000000050000001b, %f20 = 2fc09ddd c193a468
	ldd	[%i5+0x018],%f20	! %f20 = 00000005 0000001b
!	Mem[0000000030101408] = 7e60bfff, %l6 = ffffffffffffffff
	ldsba	[%i4+%o4]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000300c1410] = ffffffff e611a2f7, %l0 = 00004bed, %l1 = 14fb2f3f
	ldda	[%i3+%o5]0x81,%l0	! %l0 = 00000000ffffffff 00000000e611a2f7
!	Mem[0000000030081408] = ff000000, %l3 = 0000000000006472
	lduha	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[0000000010081410] = 000000ff
	stwa	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff

p0_label_52:
!	Mem[00000000100c1400] = 768ab1ff, %l2 = 00000000bf394847
	swapa	[%i3+%g0]0x88,%l2	! %l2 = 00000000768ab1ff
!	%l5 = fffffffffffffffd, Mem[0000000010041400] = 000000fd000000ff, %asi = 80
	stxa	%l5,[%i1+0x000]%asi	! Mem[0000000010041400] = fffffffffffffffd
!	Mem[0000000020800041] = ba7dc1d1, %l2 = 00000000768ab1ff
	ldstuba	[%o1+0x041]%asi,%l2	! %l2 = 0000007d000000ff
!	%f19 = c193a468, Mem[0000000010141408] = e96decff
	sta	%f19,[%i5+%o4]0x88	! Mem[0000000010141408] = c193a468
!	%l6 = ffffffffffffffff, Mem[0000000020800040] = baffc1d1
	stb	%l6,[%o1+0x040]		! Mem[0000000020800040] = ffffc1d1
!	%l1 = 00000000e611a2f7, imm = 00000000000009e6, %l4 = 00000000000000ff
	sub	%l1,0x9e6,%l4		! %l4 = 00000000e6119911
!	Mem[0000000010001400] = dd9dc0ff, %l4 = 00000000e6119911
	swapa	[%i0+%g0]0x88,%l4	! %l4 = 00000000dd9dc0ff
!	%f27 = 63ace9a5, %f23 = a5e9ac63, %f23 = a5e9ac63
	fsubs	%f27,%f23,%f23		! %f23 = 63ace9a5
!	Mem[0000000030001400] = 99e23750, %l5 = fffffffffffffffd
	ldstuba	[%i0+%g0]0x89,%l5	! %l5 = 00000050000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = b91090d3, %l2 = 000000000000007d
	lduwa	[%i4+%o4]0x88,%l2	! %l2 = 00000000b91090d3

p0_label_53:
!	Mem[0000000010101400] = fd5debc7, %l3 = 0000000000000000
	ldswa	[%i4+%g0]0x80,%l3	! %l3 = fffffffffd5debc7
!	Mem[0000000010181408] = 0071dcd3, %l1 = 00000000e611a2f7
	lduwa	[%i6+%o4]0x80,%l1	! %l1 = 000000000071dcd3
!	Mem[0000000010081400] = 36c0c225, %l2 = 00000000b91090d3
	lduba	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000025
!	Mem[0000000030041400] = bd7a5072 450440d6, %l0 = ffffffff, %l1 = 0071dcd3
	ldda	[%i1+%g0]0x81,%l0	! %l0 = 00000000bd7a5072 00000000450440d6
!	Mem[0000000010181404] = e96decff, %l0 = 00000000bd7a5072
	ldsw	[%i6+0x004],%l0		! %l0 = ffffffffe96decff
!	Mem[0000000020800040] = ffffc1d1, %l5 = 0000000000000050
	ldub	[%o1+0x040],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030081410] = be000000, %l0 = ffffffffe96decff
	lduba	[%i2+%o5]0x81,%l0	! %l0 = 00000000000000be
!	%l2 = 0000000000000025, Mem[0000000030001410] = bf394847
	stha	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = bf390025
!	Mem[0000000010101408] = d39010b9, %l0 = 00000000000000be
	lduha	[%i4+%o4]0x80,%l0	! %l0 = 000000000000d390
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 5037e272, %l4 = 00000000dd9dc0ff
	swapa	[%i0+%o4]0x89,%l4	! %l4 = 000000005037e272

p0_label_54:
	membar	#Sync			! Added by membar checker (12)
!	%l2 = 0000000000000025, Mem[0000000030101400] = ffff04480d0d2138
	stxa	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000000025
!	%l1 = 00000000450440d6, %l4 = 000000005037e272, %l7 = 0000000000005dfd
	add	%l1,%l4,%l7		! %l7 = 00000000953c2348
!	Mem[0000000021800081] = f68e7b7d, %l1 = 00000000450440d6
	ldstuba	[%o3+0x081]%asi,%l1	! %l1 = 0000008e000000ff
!	%l4 = 000000005037e272, Mem[0000000030141408] = 3ce815ff
	stba	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 3ce81572
!	Mem[00000000100c1408] = 7305ee2b, %l0 = 000000000000d390
	ldstuba	[%i3+%o4]0x80,%l0	! %l0 = 00000073000000ff
!	Mem[0000000030101408] = ffbf607e, %l3 = fffffffffd5debc7
	ldstuba	[%i4+%o4]0x81,%l3	! %l3 = 000000ff000000ff
!	%l4 = 000000005037e272, Mem[0000000010141410] = fd5d0000
	stwa	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 5037e272
!	%l1 = 000000000000008e, Mem[0000000030181408] = f7a211e6
	stha	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = f7a2008e
!	%l3 = 00000000000000ff, Mem[0000000010041428] = bff84ba163486307, %asi = 80
	stxa	%l3,[%i1+0x028]%asi	! Mem[0000000010041428] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00054c08, %l4 = 000000005037e272
	lduha	[%o0+0x000]%asi,%l4	! %l4 = 0000000000000005

p0_label_55:
!	%l3 = 00000000000000ff, imm = fffffffffffff14f, %l5 = 00000000000000ff
	xnor	%l3,-0xeb1,%l5		! %l5 = 0000000000000e4f
!	Mem[0000000030081408] = ff000000, %l5 = 0000000000000e4f
	ldsha	[%i2+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041400] = ffffffff, %l7 = 00000000953c2348
	lduw	[%i1+%g0],%l7		! %l7 = 00000000ffffffff
!	Mem[0000000030041400] = bd7a5072450440d6, %f26 = 820fd78c 63ace9a5
	ldda	[%i1+%g0]0x81,%f26	! %f26 = bd7a5072 450440d6
!	Mem[0000000030081400] = 0289bcff, %l7 = 00000000ffffffff
	ldsha	[%i2+%g0]0x89,%l7	! %l7 = ffffffffffffbcff
!	Mem[0000000021800000] = bbb2f103, %l6 = ffffffffffffffff
	ldsb	[%o3+0x001],%l6		! %l6 = ffffffffffffffb2
!	Mem[0000000010101408] = d39010b9bea1ef4b, %f16 = 474839bf 000000ff
	ldda	[%i4+0x008]%asi,%f16	! %f16 = d39010b9 bea1ef4b
!	Mem[0000000010181438] = f6002dd6, %l6 = ffffffffffffffb2
	ldub	[%i6+0x03b],%l6		! %l6 = 00000000000000d6
!	Mem[0000000020800000] = 5fffba64, %l1 = 000000000000008e
	lduh	[%o1+%g0],%l1		! %l1 = 0000000000005fff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = ff37e299, %l1 = 0000000000005fff
	swapa	[%i0+%g0]0x81,%l1	! %l1 = 00000000ff37e299

p0_label_56:
!	%f2  = ffbf607e 4c552e69, %l3 = 00000000000000ff
!	Mem[0000000030001410] = 250039bf00000000
	add	%i0,0x010,%g1
	stda	%f2,[%g1+%l3]ASI_PST8_SL ! Mem[0000000030001410] = 692e554c7e60bfff
!	%l0 = 0000000000000073, Mem[0000000030181408] = f7a2008e
	stha	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = f7a20073
!	Mem[0000000010041408] = ffbf607e, %l3 = 00000000000000ff
	swapa	[%i1+%o4]0x80,%l3	! %l3 = 00000000ffbf607e
!	%l6 = 000000d6, %l7 = ffffbcff, Mem[0000000030001410] = 4c552e69 ffbf607e
	stda	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000d6 ffffbcff
!	Mem[0000000021800041] = 9a4ed022, %l6 = 00000000000000d6
	ldstub	[%o3+0x041],%l6		! %l6 = 0000004e000000ff
!	%l6 = 000000000000004e, Mem[0000000010081408] = 00000000
	stwa	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000004e
!	%l1 = 00000000ff37e299, Mem[0000000030081410] = 000000be
	stha	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000e299
!	%f4  = 00000000, Mem[0000000030181408] = 7300a2f7
	sta	%f4 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	Mem[0000000010001408] = cf5374be, %l1 = 00000000ff37e299
	swapa	[%i0+%o4]0x88,%l1	! %l1 = 00000000cf5374be
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ffbf607e, %l7 = ffffffffffffbcff
	lduha	[%i4+%o4]0x81,%l7	! %l7 = 000000000000ffbf

p0_label_57:
!	Mem[0000000030041410] = ffc09dddc193a468, %l7 = 000000000000ffbf
	ldxa	[%i1+%o5]0x81,%l7	! %l7 = ffc09dddc193a468
!	Mem[0000000010001428] = 0289bcff, %l0 = 0000000000000073
	ldsha	[%i0+0x028]%asi,%l0	! %l0 = 0000000000000289
!	Mem[0000000030041410] = 68a493c1dd9dc0ff, %l3 = 00000000ffbf607e
	ldxa	[%i1+%o5]0x89,%l3	! %l3 = 68a493c1dd9dc0ff
!	Mem[0000000010141400] = fd5d0000, %l6 = 000000000000004e
	ldsba	[%i5+%g0]0x80,%l6	! %l6 = fffffffffffffffd
!	Mem[0000000030101410] = 00000000, %l4 = 0000000000000005
	ldsba	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000020800040] = ffffc1d1, %l6 = fffffffffffffffd
	lduha	[%o1+0x040]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010141410] = 5037e272, %l3 = 68a493c1dd9dc0ff
	lduba	[%i5+%o5]0x80,%l3	! %l3 = 0000000000000050
!	Mem[00000000211c0000] = 73ff85d2, %l2 = 0000000000000025
	ldsba	[%o2+0x000]%asi,%l2	! %l2 = 0000000000000073
!	%l6 = 000000000000ffff, Mem[00000000300c1408] = 474839bf000000ff
	stxa	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 768ab194, %l7 = ffc09dddc193a468
	ldstuba	[%i0+%o5]0x80,%l7	! %l7 = 00000076000000ff

p0_label_58:
!	Mem[00000000100c1410] = ffc09ddd, %l7 = 0000000000000076
	ldstuba	[%i3+%o5]0x80,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010181408] = 0071dcd3e48045c0, %l1 = 00000000cf5374be, %l0 = 0000000000000289
	add	%i6,0x08,%g1
	casxa	[%g1]0x80,%l1,%l0	! %l0 = 0071dcd3e48045c0
!	%f16 = d39010b9 bea1ef4b, Mem[0000000010041408] = 000000ff bea1eff2
	stda	%f16,[%i1+%o4]0x80	! Mem[0000000010041408] = d39010b9 bea1ef4b
!	Mem[0000000021800001] = bbb2f103, %l6 = 000000000000ffff
	ldstub	[%o3+0x001],%l6		! %l6 = 000000b2000000ff
!	%f20 = 00000005 0000001b, %l6 = 00000000000000b2
!	Mem[0000000030141438] = ea03fd1a13c71665
	add	%i5,0x038,%g1
	stda	%f20,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030141438] = ea00fd1a05001600
!	Mem[0000000030101410] = 00000000, %l7 = 00000000000000ff
	swapa	[%i4+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = ffff0000, %l0 = 0071dcd3e48045c0
	swapa	[%i3+%o4]0x81,%l0	! %l0 = 00000000ffff0000
!	Mem[0000000010081410] = ff000000, %l0 = 00000000ffff0000
	ldstuba	[%i2+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	%f24 = a5e9ac63 94b18a76, %l7 = 0000000000000000
!	Mem[0000000010041410] = bd7a5072450440d6
	add	%i1,0x010,%g1
	stda	%f24,[%g1+%l7]ASI_PST16_P ! Mem[0000000010041410] = bd7a5072450440d6
!	Starting 10 instruction Load Burst
!	Mem[0000000021800080] = f6ff7b7d, %l7 = 0000000000000000
	ldub	[%o3+0x081],%l7		! %l7 = 00000000000000ff

p0_label_59:
!	Mem[0000000021800140] = f60105d8, %l0 = 00000000000000ff
	lduha	[%o3+0x140]%asi,%l0	! %l0 = 000000000000f601
!	Mem[0000000010041400] = ffffffff, %l1 = 00000000cf5374be
	ldswa	[%i1+%g0]0x88,%l1	! %l1 = ffffffffffffffff
!	%l6 = 00000000000000b2, %l5 = 0000000000000000, %l1 = ffffffffffffffff
	addc	%l6,%l5,%l1		! %l1 = 00000000000000b2
!	Mem[00000000100c1404] = 271c000f, %l4 = 0000000000000000
	ldsw	[%i3+0x004],%l4		! %l4 = 00000000271c000f
!	Mem[0000000010101410] = ffef4a3c c5d648c2, %l2 = 00000073, %l3 = 00000050
	ldda	[%i4+%o5]0x88,%l2	! %l2 = 00000000c5d648c2 00000000ffef4a3c
!	Mem[0000000010181408] = 0071dcd3, %l6 = 00000000000000b2
	lduwa	[%i6+%o4]0x80,%l6	! %l6 = 000000000071dcd3
!	Mem[0000000010181400] = 000066b3, %l1 = 00000000000000b2
	lduha	[%i6+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = fd5debc7, %l0 = 000000000000f601
	ldswa	[%i4+%g0]0x80,%l0	! %l0 = fffffffffd5debc7
!	Mem[0000000030101408] = ffbf607e 4c552e69, %l2 = c5d648c2, %l3 = ffef4a3c
	ldda	[%i4+%o4]0x81,%l2	! %l2 = 00000000ffbf607e 000000004c552e69
!	Starting 10 instruction Store Burst
!	%f10 = 55882df0 a2fb63dd, %l2 = 00000000ffbf607e
!	Mem[0000000010141410] = 5037e272ffef4a3c
	add	%i5,0x010,%g1
	stda	%f10,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010141410] = 5063fba2f02d883c

p0_label_60:
!	%l2 = ffbf607e, %l3 = 4c552e69, Mem[0000000030001400] = ff5f0000 6ba18f04
	stda	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = ffbf607e 4c552e69
!	Mem[00000000100c1400] = 474839bf, %l5 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l5	! %l5 = 00000000474839bf
!	Mem[0000000010001428] = 0289bcff, %l2 = 00000000ffbf607e, %asi = 80
	swapa	[%i0+0x028]%asi,%l2	! %l2 = 000000000289bcff
!	%l0 = fffffffffd5debc7, Mem[00000000211c0000] = 73ff85d2
	stb	%l0,[%o2+%g0]		! Mem[00000000211c0000] = c7ff85d2
!	%f0  = ffff0448 0d0d2138 ffbf607e 4c552e69
!	%f4  = 00000000 00000000 e139503d 8ea8260e
!	%f8  = 5586c10f 17a27aa7 55882df0 a2fb63dd
!	%f12 = 87cb8c91 b50e61d7 ece72778 0a32e176
	stda	%f0,[%i4]ASI_BLK_SL	! Block Store to 0000000030101400
!	%l3 = 000000004c552e69, Mem[0000000030141400] = ff000000
	stwa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 4c552e69
!	%l6 = 0071dcd3, %l7 = 000000ff, Mem[0000000010181408] = 0071dcd3 e48045c0
	stda	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 0071dcd3 000000ff
!	%f27 = 450440d6, %f31 = 99e23750
	fcmpes	%fcc0,%f27,%f31		! %fcc0 = 2
!	%l3 = 000000004c552e69, Mem[00000000300c1410] = f7a211e6ffffffff
	stxa	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000004c552e69
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 72507abd, %l6 = 000000000071dcd3
	ldswa	[%i1+%o5]0x88,%l6	! %l6 = 0000000072507abd

p0_label_61:
!	Mem[0000000010181410] = f8ffffff, %l0 = fffffffffd5debc7
	ldsba	[%i6+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030001408] = ffc09ddde96decff, %l2 = 000000000289bcff
	ldxa	[%i0+%o4]0x81,%l2	! %l2 = ffc09ddde96decff
!	Mem[000000001018140c] = 000000ff, %l7 = 00000000000000ff
	lduba	[%i6+0x00f]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1410] = 692e554c00000000, %l7 = 00000000000000ff
	ldxa	[%i3+%o5]0x81,%l7	! %l7 = 692e554c00000000
!	Mem[00000000300c1400] = 8cd70f82, %l2 = ffc09ddde96decff
	ldswa	[%i3+%g0]0x89,%l2	! %l2 = ffffffff8cd70f82
!	%l6 = 0000000072507abd, imm = 0000000000000bed, %l2 = ffffffff8cd70f82
	add	%l6,0xbed,%l2		! %l2 = 00000000725086aa
!	Mem[0000000030081408] = 000000ff, %l4 = 00000000271c000f
	ldsba	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141410] = 5063fba2, %f27 = 450440d6
	lda	[%i5+%o5]0x80,%f27	! %f27 = 5063fba2
!	Mem[0000000030181400] = ffec6de9ffffffff, %l2 = 00000000725086aa
	ldxa	[%i6+%g0]0x89,%l2	! %l2 = ffec6de9ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = bd7a5072, %l4 = 0000000000000000
	ldstuba	[%i1+%o5]0x80,%l4	! %l4 = 000000bd000000ff

p0_label_62:
!	Mem[000000001000141c] = c3350dbe, %l6 = 0000000072507abd
	swap	[%i0+0x01c],%l6		! %l6 = 00000000c3350dbe
!	%l0 = ffffffffffffffff, imm = fffffffffffff947, %l3 = 000000004c552e69
	xnor	%l0,-0x6b9,%l3		! %l3 = fffffffffffff947
!	%l4 = 00000000000000bd, imm = 00000000000009a0, %l0 = ffffffffffffffff
	sub	%l4,0x9a0,%l0		! %l0 = fffffffffffff71d
!	%l3 = fffffffffffff947, %l6 = 00000000c3350dbe, %l1  = 0000000000000000
	mulx	%l3,%l6,%l1		! %l1 = fffffadfb0569db2
!	%l4 = 00000000000000bd, immd = 0000000000000b8d, %l6 = 00000000c3350dbe
	udivx	%l4,0xb8d,%l6		! %l6 = 0000000000000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030041408] = ffc09ddd c193a468
	stda	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000 00000000
!	%f26 = bd7a5072 5063fba2, Mem[0000000010081428] = ff06f774 fe3cff92
	stda	%f26,[%i2+0x028]%asi	! Mem[0000000010081428] = bd7a5072 5063fba2
!	%l0 = fffffffffffff71d, Mem[0000000020800040] = ffffc1d1, %asi = 80
	stha	%l0,[%o1+0x040]%asi	! Mem[0000000020800040] = f71dc1d1
!	%f16 = d39010b9 bea1ef4b ffc09ddd c193a468
!	%f20 = 00000005 0000001b ffc09ddd 63ace9a5
!	%f24 = a5e9ac63 94b18a76 bd7a5072 5063fba2
!	%f28 = ffec6de9 ffffffc2 b3660000 99e23750
	stda	%f16,[%i3]ASI_BLK_S	! Block Store to 00000000300c1400
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = fd5d0000, %l3 = fffffffffffff947
	ldswa	[%i5+%g0]0x80,%l3	! %l3 = fffffffffd5d0000

p0_label_63:
!	Mem[0000000030001410] = ffffbcff 000000d6, %l0 = fffff71d, %l1 = b0569db2
	ldda	[%i0+%o5]0x89,%l0	! %l0 = 00000000000000d6 00000000ffffbcff
	membar	#Sync			! Added by membar checker (13)
!	Mem[00000000100c1410] = dd9dc0ff, %l6 = 0000000000000000
	lduwa	[%i3+%o5]0x88,%l6	! %l6 = 00000000dd9dc0ff
!	Mem[00000000211c0000] = c7ff85d2, %l2 = ffec6de9ffffffff
	lduba	[%o2+0x000]%asi,%l2	! %l2 = 00000000000000c7
!	Mem[00000000300c1410] = 00000005, %l4 = 00000000000000bd
	lduha	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = fd5d0000, %l1 = 00000000ffffbcff
	ldsb	[%i5+0x003],%l1		! %l1 = 0000000000000000
!	Mem[0000000010141408] = 68a493c1 ffffffc2, %l0 = 000000d6, %l1 = 00000000
	ldd	[%i5+%o4],%l0		! %l0 = 0000000068a493c1 00000000ffffffc2
!	%l7 = 692e554c00000000, immd = 0000000000000008, %l6 = 00000000dd9dc0ff
	sdivx	%l7,0x008,%l6		! %l6 = 0d25caa980000000
!	Mem[0000000010081408] = fd5d00004e000000, %l3 = fffffffffd5d0000
	ldxa	[%i2+%o4]0x88,%l3	! %l3 = fd5d00004e000000
!	Mem[0000000010041408] = b91090d3, %l1 = 00000000ffffffc2
	ldsba	[%i1+%o4]0x88,%l1	! %l1 = ffffffffffffffd3
!	Starting 10 instruction Store Burst
!	Mem[0000000010101439] = 00000000, %l7 = 692e554c00000000
	ldstub	[%i4+0x039],%l7		! %l7 = 00000000000000ff

p0_label_64:
!	%f22 = ffc09ddd 63ace9a5, Mem[0000000030141400] = 4c552e69 bdffffff
	stda	%f22,[%i5+%g0]0x81	! Mem[0000000030141400] = ffc09ddd 63ace9a5
!	Mem[0000000030181408] = 00000000, %l1 = ffffffffffffffd3
	ldstuba	[%i6+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[00000000100c141c] = 891a2d3b
	stw	%l1,[%i3+0x01c]		! Mem[00000000100c141c] = 00000000
!	%f4  = 00000000 00000000, Mem[00000000300c1400] = b91090d3 4befa1be
	stda	%f4 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 00000000
!	Mem[0000000030041400] = bd7a5072, %l1 = 0000000000000000
	ldstuba	[%i1+%g0]0x81,%l1	! %l1 = 000000bd000000ff
!	%f5  = 00000000, Mem[0000000010041438] = a220ac6a
	sta	%f5 ,[%i1+0x038]%asi	! Mem[0000000010041438] = 00000000
!	%l3 = fd5d00004e000000, Mem[0000000010081410] = ff0000000000002f, %asi = 80
	stxa	%l3,[%i2+0x010]%asi	! Mem[0000000010081410] = fd5d00004e000000
!	%l5 = 00000000474839bf, Mem[00000000211c0001] = c7ff85d2, %asi = 80
	stba	%l5,[%o2+0x001]%asi	! Mem[00000000211c0000] = c7bf85d2
!	%l2 = 00000000000000c7, Mem[0000000010001408] = ff37e299
	stha	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = ff3700c7
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00000000 00005dfd, %l6 = 80000000, %l7 = 00000000
	ldda	[%i5+%g0]0x88,%l6	! %l6 = 0000000000005dfd 0000000000000000

p0_label_65:
!	Mem[0000000030181408] = 000000ff, %l6 = 0000000000005dfd
	lduba	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1408] = 68a493c1dd9dc0ff, %f30 = b3660000 99e23750
	ldda	[%i3+%o4]0x89,%f30	! %f30 = 68a493c1 dd9dc0ff
!	Mem[0000000010081400] = 80000000 36c0c225, %l4 = 00000000, %l5 = 474839bf
	ldda	[%i2+%g0]0x88,%l4	! %l4 = 0000000036c0c225 0000000080000000
!	Mem[0000000010041400] = ffffffff fffffffd, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 00000000ffffffff 00000000fffffffd
!	Mem[0000000030181400] = ffffffff, %l6 = 00000000ffffffff
	lduha	[%i6+%g0]0x89,%l6	! %l6 = 000000000000ffff
!	Mem[00000000100c1430] = bc5a3abb df48e814, %l2 = 000000c7, %l3 = 4e000000
	ldd	[%i3+0x030],%l2		! %l2 = 00000000bc5a3abb 00000000df48e814
!	Mem[00000000300c1400] = 00000000, %l5 = 0000000080000000
	ldsba	[%i3+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081400] = 0289bcff, %l7 = 00000000fffffffd
	lduba	[%i2+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081410] = 99e2000005700460, %l7 = 00000000000000ff
	ldxa	[%i2+%o5]0x81,%l7	! %l7 = 99e2000005700460
!	Starting 10 instruction Store Burst
!	%l2 = 00000000bc5a3abb, Mem[0000000010041400] = fdffffffffffffff
	stxa	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000bc5a3abb

p0_label_66:
!	Mem[0000000010101410] = c5d648c2, %l1 = 00000000000000bd
	ldstuba	[%i4+%o5]0x88,%l1	! %l1 = 000000c2000000ff
!	Mem[0000000030001400] = ffbf607e, %l7 = 99e2000005700460
	swapa	[%i0+%g0]0x89,%l7	! %l7 = 00000000ffbf607e
!	Mem[0000000010181410] = fffffff8, %l0 = 0000000068a493c1
	ldstuba	[%i6+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[000000001004141c] = 0896b14a, %l2 = 00000000bc5a3abb
	ldstub	[%i1+0x01c],%l2		! %l2 = 00000008000000ff
!	Mem[000000001010142c] = c26cf44e, %l6 = 0000ffff, %l5 = 00000000
	add	%i4,0x2c,%g1
	casa	[%g1]0x80,%l6,%l5	! %l5 = 00000000c26cf44e
!	Mem[0000000010041408] = b91090d3, %l2 = 0000000000000008
	ldstuba	[%i1+%o4]0x88,%l2	! %l2 = 000000d3000000ff
!	Mem[0000000030181410] = fd5d0000, %l2 = 00000000000000d3
	ldstuba	[%i6+%o5]0x81,%l2	! %l2 = 000000fd000000ff
!	Mem[0000000030081410] = 99e20000, %l4 = 0000000036c0c225
	ldstuba	[%i2+%o5]0x81,%l4	! %l4 = 00000099000000ff
!	%l7 = 00000000ffbf607e, Mem[00000000218001c1] = ffff6949
	stb	%l7,[%o3+0x1c1]		! Mem[00000000218001c0] = ff7e6949
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = dd9dc0ff, %f31 = dd9dc0ff
	lda	[%i1+%o5]0x89,%f31	! %f31 = dd9dc0ff

p0_label_67:
!	Mem[0000000030041410] = ffc09dddc193a468, %l5 = 00000000c26cf44e
	ldxa	[%i1+%o5]0x81,%l5	! %l5 = ffc09dddc193a468
!	Mem[0000000010101404] = ff2f703d, %l5 = ffc09dddc193a468
	ldsh	[%i4+0x006],%l5		! %l5 = 000000000000703d
!	Mem[0000000010101408] = b91090d3, %l0 = 00000000000000ff
	ldsba	[%i4+%o4]0x88,%l0	! %l0 = ffffffffffffffd3
!	%l1 = 00000000000000c2, %l2 = 00000000000000fd, %l2 = 00000000000000fd
	andn	%l1,%l2,%l2		! %l2 = 0000000000000002
!	Mem[0000000030101410] = 00000000, %l2 = 0000000000000002
	lduha	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1410] = ffc09ddd, %f16 = d39010b9
	lda	[%i3+%o5]0x80,%f16	! %f16 = ffc09ddd
!	Mem[0000000030081408] = 000000ff, %l6 = 000000000000ffff
	lduwa	[%i2+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101408] = 4c552e69, %l6 = 00000000000000ff
	lduwa	[%i4+%o4]0x89,%l6	! %l6 = 000000004c552e69
!	Mem[00000000300c1400] = 0000000000000000, %f20 = 00000005 0000001b
	ldda	[%i3+%g0]0x81,%f20	! %f20 = 00000000 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = ffc09ddd, %l4 = 0000000000000099
	swapa	[%i0+%o4]0x81,%l4	! %l4 = 00000000ffc09ddd

p0_label_68:
!	%l6 = 000000004c552e69, %l0 = ffffffffffffffd3, %y  = ffffe299
	udiv	%l6,%l0,%l0		! %l0 = 00000000ffffe2c6
	mov	%l0,%y			! %y = ffffe2c6
!	%l2 = 0000000000000000, Mem[00000000100c1406] = 271c000f, %asi = 80
	stha	%l2,[%i3+0x006]%asi	! Mem[00000000100c1404] = 271c0000
!	%l6 = 000000004c552e69, imm = fffffffffffff7a2, %l2 = 0000000000000000
	add	%l6,-0x85e,%l2		! %l2 = 000000004c55260b
!	%l3 = 00000000df48e814, Mem[0000000030041408] = 00000000
	stwa	%l3,[%i1+%o4]0x89	! Mem[0000000030041408] = df48e814
!	%f22 = ffc09ddd, Mem[0000000030101410] = 00000000
	sta	%f22,[%i4+%o5]0x89	! Mem[0000000030101410] = ffc09ddd
!	Mem[0000000030141410] = 00000000, %l4 = 00000000ffc09ddd
	swapa	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000
!	%l1 = 00000000000000c2, Mem[0000000030081408] = 000000ff0000002d
	stxa	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000000000c2
!	Mem[0000000010141418] = 00000005, %l3 = 00000000df48e814, %asi = 80
	swapa	[%i5+0x018]%asi,%l3	! %l3 = 0000000000000005
!	%l4 = 00000000, %l5 = 0000703d, Mem[0000000010181400] = 000066b3 e96decff
	stda	%l4,[%i6+0x000]%asi	! Mem[0000000010181400] = 00000000 0000703d
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 4befa1beb91090ff, %l5 = 000000000000703d
	ldxa	[%i1+%o4]0x88,%l5	! %l5 = 4befa1beb91090ff

p0_label_69:
!	Mem[0000000010181410] = f8ffffff, %f26 = bd7a5072
	lda	[%i6+%o5]0x88,%f26	! %f26 = f8ffffff
!	Mem[0000000030181408] = ff000000, %l5 = 4befa1beb91090ff
	lduha	[%i6+%o4]0x81,%l5	! %l5 = 000000000000ff00
!	Mem[00000000100c1418] = 2349c7e1, %l1 = 00000000000000c2
	ldsb	[%i3+0x01b],%l1		! %l1 = ffffffffffffffe1
!	Mem[0000000030181410] = ff5d0000, %l6 = 000000004c552e69
	lduwa	[%i6+%o5]0x81,%l6	! %l6 = 00000000ff5d0000
!	Mem[00000000211c0000] = c7bf85d2, %l3 = 0000000000000005
	ldsh	[%o2+%g0],%l3		! %l3 = ffffffffffffc7bf
!	Mem[0000000010101408] = d39010b9, %l0 = 00000000ffffe2c6
	lduha	[%i4+%o4]0x80,%l0	! %l0 = 000000000000d390
!	Mem[0000000030141408] = 7215e83cb86b016b, %l6 = 00000000ff5d0000
	ldxa	[%i5+%o4]0x81,%l6	! %l6 = 7215e83cb86b016b
!	Mem[0000000030001410] = d6000000, %l0 = 000000000000d390
	ldsba	[%i0+%o5]0x81,%l0	! %l0 = ffffffffffffffd6
!	Mem[0000000010141420] = 2fc09ddd, %l1 = ffffffffffffffe1
	ldsba	[%i5+0x022]%asi,%l1	! %l1 = ffffffffffffff9d
!	Starting 10 instruction Store Burst
!	%f4  = 00000000 00000000, Mem[0000000010101400] = fd5debc7 ff2f703d
	stda	%f4 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000 00000000

p0_label_70:
!	%f6  = e139503d 8ea8260e, Mem[0000000010081420] = 00000a6c 16e71a6f
	std	%f6 ,[%i2+0x020]	! Mem[0000000010081420] = e139503d 8ea8260e
!	%f28 = ffec6de9 ffffffc2, Mem[0000000010001430] = 00000000 00006472
	std	%f28,[%i0+0x030]	! Mem[0000000010001430] = ffec6de9 ffffffc2
!	%l2 = 000000004c55260b, Mem[0000000030181410] = 00005dff
	stba	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 00005d0b
!	Mem[00000000300c1408] = dd9dc0ff, %l0 = ffffffffffffffd6
	swapa	[%i3+%o4]0x89,%l0	! %l0 = 00000000dd9dc0ff
!	%l6 = 7215e83cb86b016b, Mem[0000000010081408] = 0000004e, %asi = 80
	stwa	%l6,[%i2+0x008]%asi	! Mem[0000000010081408] = b86b016b
!	Mem[0000000010001410] = 94b18aff, %l3 = ffffffffffffc7bf
	ldstuba	[%i0+%o5]0x88,%l3	! %l3 = 000000ff000000ff
!	%f26 = f8ffffff 5063fba2, Mem[0000000010081428] = bd7a5072 5063fba2
	std	%f26,[%i2+0x028]	! Mem[0000000010081428] = f8ffffff 5063fba2
!	%l7 = 00000000ffbf607e, Mem[0000000010101410] = ff48d6c5
	stwa	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = ffbf607e
!	Mem[0000000030081408] = 00000000, %l5 = 000000000000ff00
	ldstuba	[%i2+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ff9010b9, %l6 = 7215e83cb86b016b
	ldswa	[%i1+%o4]0x80,%l6	! %l6 = ffffffffff9010b9

p0_label_71:
!	Mem[0000000010001408] = c70037ff, %l2 = 000000004c55260b
	lduba	[%i0+%o4]0x80,%l2	! %l2 = 00000000000000c7
!	Mem[00000000211c0000] = c7bf85d2, %l6 = ffffffffff9010b9
	ldsb	[%o2+0x001],%l6		! %l6 = ffffffffffffffbf
!	%l5 = 0000000000000000, %l3 = 00000000000000ff, %l1 = ffffffffffffff9d
	udivx	%l5,%l3,%l1		! %l1 = 0000000000000000
!	Mem[00000000100c1400] = 00001c2700000000, %f0  = ffff0448 0d0d2138
	ldda	[%i3+%g0]0x88,%f0 	! %f0  = 00001c27 00000000
!	%l6 = ffffffffffffffbf, Mem[00000000100c1400] = 00000000, %asi = 80
	stha	%l6,[%i3+0x000]%asi	! Mem[00000000100c1400] = ffbf0000
!	Mem[0000000010181408] = d3dc7100, %f6  = e139503d
	lda	[%i6+%o4]0x88,%f6 	! %f6 = d3dc7100
!	Mem[0000000010081428] = f8ffffff, %l3 = 00000000000000ff
	lduba	[%i2+0x02b]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %l4 = 0000000000000000
	ldub	[%i6+0x001],%l4		! %l4 = 0000000000000000
!	Mem[00000000300c1410] = 00000005, %l6 = ffffffffffffffbf
	lduha	[%i3+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 692e554c, %l6 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l6	! %l6 = 00000000692e554c

p0_label_72:
!	Mem[0000000010001410] = ff8ab194, %l3 = 00000000000000ff
	ldstuba	[%i0+%o5]0x80,%l3	! %l3 = 000000ff000000ff
!	%l1 = 0000000000000000, Mem[0000000010041400] = bb3a5abc, %asi = 80
	stha	%l1,[%i1+0x000]%asi	! Mem[0000000010041400] = 00005abc
!	%l0 = 00000000dd9dc0ff, imm = 000000000000046d, %l5 = 0000000000000000
	subc	%l0,0x46d,%l5		! %l5 = 00000000dd9dbc92
!	%f30 = 68a493c1 dd9dc0ff, Mem[0000000030101400] = 38210d0d 4804ffff
	stda	%f30,[%i4+%g0]0x81	! Mem[0000000030101400] = 68a493c1 dd9dc0ff
!	%l2 = 000000c7, %l3 = 000000ff, Mem[0000000010081408] = 6b016bb8 fd5d0000
	stda	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000c7 000000ff
!	%f30 = 68a493c1 dd9dc0ff, Mem[0000000010101408] = d39010b9 bea1ef4b
	stda	%f30,[%i4+%o4]0x80	! Mem[0000000010101408] = 68a493c1 dd9dc0ff
!	Mem[00000000300c1410] = 00000005, %l4 = 0000000000000000
	ldstuba	[%i3+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%l7 = 00000000ffbf607e, Mem[0000000010141434] = d1122200, %asi = 80
	stwa	%l7,[%i5+0x034]%asi	! Mem[0000000010141434] = ffbf607e
!	%l5 = 00000000dd9dbc92, Mem[0000000010001410] = a5e9ac6394b18aff
	stxa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000dd9dbc92
!	Starting 10 instruction Load Burst
!	%f27 = 5063fba2, %f23 = 63ace9a5
	fcmpes	%fcc1,%f27,%f23		! %fcc1 = 1

p0_label_73:
!	Mem[00000000300c1410] = 050000ff, %l2 = 00000000000000c7
	lduwa	[%i3+%o5]0x89,%l2	! %l2 = 00000000050000ff
!	Mem[0000000030001410] = d6000000, %f6  = d3dc7100
	lda	[%i0+%o5]0x81,%f6 	! %f6 = d6000000
!	Mem[0000000010101428] = 765c210f, %l7 = 00000000ffbf607e
	ldsba	[%i4+0x028]%asi,%l7	! %l7 = 0000000000000076
!	Mem[0000000030041410] = dd9dc0ff, %l3 = 00000000000000ff
	ldsba	[%i1+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010081400] = 25c2c036 00000080, %l4 = 00000000, %l5 = dd9dbc92
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 0000000025c2c036 0000000000000080
!	Mem[0000000010081414] = 4e000000, %l6 = 00000000692e554c
	lduha	[%i2+0x014]%asi,%l6	! %l6 = 0000000000004e00
!	Mem[0000000030181400] = ffffffff, %l5 = 0000000000000080
	ldswa	[%i6+%g0]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000211c0000] = c7bf85d2, %l4 = 0000000025c2c036
	ldsb	[%o2+0x001],%l4		! %l4 = ffffffffffffffbf
!	Mem[0000000010081400] = 36c0c225, %f26 = f8ffffff
	lda	[%i2+%g0]0x88,%f26	! %f26 = 36c0c225
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 68a493c1, %l7 = 0000000000000076
	ldstuba	[%i4+%g0]0x81,%l7	! %l7 = 00000068000000ff

p0_label_74:
!	Mem[00000000300c1410] = 050000ff, %l0 = 00000000dd9dc0ff
	swapa	[%i3+%o5]0x89,%l0	! %l0 = 00000000050000ff
!	Mem[0000000010101428] = 765c210f, %l7 = 00000068, %l7 = 00000068
	add	%i4,0x28,%g1
	casa	[%g1]0x80,%l7,%l7	! %l7 = 00000000765c210f
!	%l4 = ffffffffffffffbf, Mem[0000000030101400] = ffa493c1
	stha	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = ffbf93c1
!	Mem[00000000300c1400] = 00000000, %l0 = 00000000050000ff
	swapa	[%i3+%g0]0x89,%l0	! %l0 = 0000000000000000
!	%l2 = 050000ff, %l3 = ffffffff, Mem[0000000030041410] = ffc09ddd c193a468
	stda	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = 050000ff ffffffff
!	%l7 = 00000000765c210f, Mem[0000000030101400] = ffc09dddc193bfff
	stxa	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000765c210f
!	Mem[0000000030101408] = 00000000, %l3 = ffffffffffffffff
	swapa	[%i4+%o4]0x81,%l3	! %l3 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000030141400] = ffc09ddd
	stba	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 00c09ddd
!	%l6 = 0000000000004e00, Mem[00000000201c0001] = 00054c08, %asi = 80
	stba	%l6,[%o0+0x001]%asi	! Mem[00000000201c0000] = 00004c08
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ffc09ddd, %l0 = 0000000000000000
	lduba	[%i3+%o5]0x81,%l0	! %l0 = 00000000000000ff

p0_label_75:
!	Code Fragment 4
p0_fragment_4:
!	%l0 = 00000000000000ff
	setx	0xf5cd0ca81cf042c9,%g7,%l0 ! %l0 = f5cd0ca81cf042c9
!	%l1 = 0000000000000000
	setx	0xa1dce820352b5e79,%g7,%l1 ! %l1 = a1dce820352b5e79
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f5cd0ca81cf042c9
	setx	0x3c87785fb4fec3a9,%g7,%l0 ! %l0 = 3c87785fb4fec3a9
!	%l1 = a1dce820352b5e79
	setx	0x83cb3eaf87f61a87,%g7,%l1 ! %l1 = 83cb3eaf87f61a87
!	Mem[0000000010141410] = 3c882df0a2fb6350, %f10 = 55882df0 a2fb63dd
	ldda	[%i5+%o5]0x88,%f10	! %f10 = 3c882df0 a2fb6350
!	Mem[0000000010181400] = 00000000, %l2 = 00000000050000ff
	ldsha	[%i6+0x002]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1400] = ffbf0000, %l4 = ffffffffffffffbf
	ldsw	[%i3+%g0],%l4		! %l4 = ffffffffffbf0000
!	Mem[0000000010101410] = ffbf607e, %f23 = 63ace9a5
	lda	[%i4+%o5]0x80,%f23	! %f23 = ffbf607e
!	%l0 = 3c87785fb4fec3a9, imm = 000000000000044d, %l3 = 0000000000000000
	subc	%l0,0x44d,%l3		! %l3 = 3c87785fb4febf5c
!	Mem[0000000010141438] = ff000071, %l2 = 0000000000000000
	ldsb	[%i5+0x039],%l2		! %l2 = 0000000000000000
!	Mem[0000000030001400] = 05700460, %l0 = 3c87785fb4fec3a9
	ldswa	[%i0+%g0]0x89,%l0	! %l0 = 0000000005700460
!	Mem[0000000010181410] = fffffff8, %l7 = 00000000765c210f
	ldsha	[%i6+%o5]0x80,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 72507aff, %l1 = 83cb3eaf87f61a87
	swapa	[%i1+%o5]0x88,%l1	! %l1 = 0000000072507aff

p0_label_76:
!	%f20 = 00000000 00000000, Mem[0000000030181410] = 0b5d0000 474839bf
	stda	%f20,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000 00000000
!	Mem[00000000300c1410] = dd9dc0ff, %l0 = 0000000005700460
	ldstuba	[%i3+%o5]0x89,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010041400] = bc5a0000, %l5 = ffffffffffffffff
	ldstuba	[%i1+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%f2  = ffbf607e 4c552e69, %l4 = ffffffffffbf0000
!	Mem[0000000010101410] = ffbf607e3c4aefff
	add	%i4,0x010,%g1
	stda	%f2,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010101410] = ffbf607e3c4aefff
!	Mem[0000000030001408] = 00000099, %l4 = ffffffffffbf0000
	ldstuba	[%i0+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101410] = 7e60bfff, %l4 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	%f28 = ffec6de9 ffffffc2, Mem[00000000300c1408] = d6ffffff c193a468
	stda	%f28,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffec6de9 ffffffc2
!	%l4 = 00000000000000ff, immd = fffffffffffffd37, %l3 = 3c87785fb4febf5c
	sdivx	%l4,-0x2c9,%l3		! %l3 = 0000000000000000
!	%f16 = ffc09ddd bea1ef4b, Mem[0000000010001400] = e6119911 7305ee2b
	stda	%f16,[%i0+%g0]0x88	! Mem[0000000010001400] = ffc09ddd bea1ef4b
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 36c0c225, %l0 = 00000000000000ff
	lduwa	[%i2+%g0]0x88,%l0	! %l0 = 0000000036c0c225

p0_label_77:
!	Mem[0000000030081410] = 600470050000e2ff, %f24 = a5e9ac63 94b18a76
	ldda	[%i2+%o5]0x89,%f24	! %f24 = 60047005 0000e2ff
!	Code Fragment 4
p0_fragment_5:
!	%l0 = 0000000036c0c225
	setx	0x03ab5e600cd69214,%g7,%l0 ! %l0 = 03ab5e600cd69214
!	%l1 = 0000000072507aff
	setx	0x826881f87439102d,%g7,%l1 ! %l1 = 826881f87439102d
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 03ab5e600cd69214
	setx	0x7d82b9bfe2aa4b91,%g7,%l0 ! %l0 = 7d82b9bfe2aa4b91
!	%l1 = 826881f87439102d
	setx	0x20b9b17807aae88c,%g7,%l1 ! %l1 = 20b9b17807aae88c
!	Mem[00000000100c1428] = 00000000, %f9  = 17a27aa7
	lda	[%i3+0x028]%asi,%f9 	! %f9 = 00000000
!	Mem[0000000010101408] = 68a493c1dd9dc0ff, %f24 = 60047005 0000e2ff
	ldda	[%i4+%o4]0x80,%f24	! %f24 = 68a493c1 dd9dc0ff
!	Mem[0000000010001408] = ff3700c7, %l4 = 00000000000000ff
	ldsha	[%i0+%o4]0x88,%l4	! %l4 = 00000000000000c7
!	Mem[0000000030081408] = 000000ff, %l6 = 0000000000004e00
	lduba	[%i2+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141400] = fd5d0000, %l6 = 00000000000000ff
	ldsha	[%i5+%g0]0x80,%l6	! %l6 = fffffffffffffd5d
!	Mem[0000000020800040] = f71dc1d1, %l7 = ffffffffffffffff
	ldsb	[%o1+0x040],%l7		! %l7 = fffffffffffffff7
!	%f24 = 68a493c1, %f16 = ffc09ddd, %f7  = 8ea8260e
	fmuls	%f24,%f16,%f7 		! %f7  = ffc09ddd
!	Starting 10 instruction Store Burst
!	Mem[0000000010181424] = 2bee0573, %l3 = 00000000, %l2 = 00000000
	add	%i6,0x24,%g1
	casa	[%g1]0x80,%l3,%l2	! %l2 = 000000002bee0573

p0_label_78:
!	%f0  = 00001c27, Mem[00000000100c1408] = 2bee05ff
	sta	%f0 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00001c27
!	%l0 = 7d82b9bfe2aa4b91, Mem[0000000030181410] = 00000000
	stba	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000091
!	Mem[0000000020800001] = 5fffba64, %l6 = fffffffffffffd5d
	ldstub	[%o1+0x001],%l6		! %l6 = 000000ff000000ff
!	%l4 = 00000000000000c7, Mem[0000000010181408] = ff000000d3dc7100
	stxa	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000000000c7
!	Mem[0000000010101408] = 68a493c1dd9dc0ff, %l1 = 20b9b17807aae88c, %l1 = 20b9b17807aae88c
	add	%i4,0x08,%g1
	casxa	[%g1]0x80,%l1,%l1	! %l1 = 68a493c1dd9dc0ff
!	%l3 = 0000000000000000, Mem[0000000010101410] = ffbf607e
	stba	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 00bf607e
!	%f0  = 00001c27 00000000 ffbf607e 4c552e69
!	%f4  = 00000000 00000000 d6000000 ffc09ddd
!	%f8  = 5586c10f 00000000 3c882df0 a2fb6350
!	%f12 = 87cb8c91 b50e61d7 ece72778 0a32e176
	stda	%f0,[%i5]ASI_COMMIT_S	! Block Store to 0000000030141400
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000010141400] = 00005dfd, %l6 = 00000000000000ff
	ldstuba	[%i5+%g0]0x88,%l6	! %l6 = 000000fd000000ff
!	Mem[000000001000143c] = ffffdaa0, %l2 = 2bee0573, %l1 = dd9dc0ff
	add	%i0,0x3c,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 00000000ffffdaa0
!	Starting 10 instruction Load Burst
!	%l4 = 00000000000000c7, imm = fffffffffffff203, %l3 = 0000000000000000
	sub	%l4,-0xdfd,%l3		! %l3 = 0000000000000ec4

p0_label_79:
!	%f18 = ffc09ddd, %f8  = 5586c10f
	fcmpes	%fcc2,%f18,%f8 		! %fcc2 = 3
!	Mem[0000000010141400] = ff5d0000, %l5 = 0000000000000000
	lduwa	[%i5+%g0]0x80,%l5	! %l5 = 00000000ff5d0000
!	Mem[0000000030001410] = d6000000, %l1 = 00000000ffffdaa0
	lduha	[%i0+%o5]0x81,%l1	! %l1 = 000000000000d600
!	Mem[0000000010141428] = 425aeabe, %l3 = 0000000000000ec4
	ldsha	[%i5+0x02a]%asi,%l3	! %l3 = ffffffffffffeabe
!	Mem[0000000010041408] = b91090ff, %l0 = 7d82b9bfe2aa4b91
	ldsba	[%i1+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030101408] = ffffffff, %l1 = 000000000000d600
	lduha	[%i4+%o4]0x89,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010181410] = 7305ee2b f8ffffff, %l2 = 2bee0573, %l3 = ffffeabe
	ldda	[%i6+%o5]0x88,%l2	! %l2 = 00000000f8ffffff 000000007305ee2b
!	Mem[0000000010041408] = b91090ff, %l1 = 000000000000ffff
	ldsba	[%i1+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010081408] = 000000c7, %l2 = 00000000f8ffffff
	lduwa	[%i2+%o4]0x88,%l2	! %l2 = 00000000000000c7
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 871af687, %l0 = ffffffffffffffff
	ldstuba	[%i1+%o5]0x80,%l0	! %l0 = 00000087000000ff

p0_label_80:
!	%l0 = 0000000000000087, Mem[0000000010081408] = c7000000
	stwa	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000087
!	Mem[00000000211c0001] = c7bf85d2, %l1 = ffffffffffffffff
	ldstuba	[%o2+0x001]%asi,%l1	! %l1 = 000000bf000000ff
!	Mem[0000000030001400] = 05700460, %l1 = 00000000000000bf
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 00000060000000ff
!	Mem[0000000030041410] = 050000ff, %l3 = 000000007305ee2b
	swapa	[%i1+%o5]0x81,%l3	! %l3 = 00000000050000ff
!	%l6 = 00000000000000fd, Mem[0000000010181408] = 00000000000000c7
	stxa	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000000000fd
!	%l2 = 00000000000000c7, Mem[0000000030181408] = ff000000
	stba	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = c7000000
!	%l7 = fffffffffffffff7, Mem[0000000010101400] = 0000000000000000
	stxa	%l7,[%i4+%g0]0x80	! Mem[0000000010101400] = fffffffffffffff7
!	%f5  = 00000000, %f20 = 00000000, %f25 = dd9dc0ff
	fadds	%f5 ,%f20,%f25		! %f25 = 00000000
!	Mem[0000000010001400] = 4befa1bedd9dc0ff, %l1 = 0000000000000060, %l4 = 00000000000000c7
	casxa	[%i0]0x80,%l1,%l4	! %l4 = 4befa1bedd9dc0ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff000005, %l5 = 00000000ff5d0000
	lduwa	[%i3+%g0]0x81,%l5	! %l5 = 00000000ff000005

p0_label_81:
!	Mem[0000000010001408] = ff3700c7, %f29 = ffffffc2
	lda	[%i0+%o4]0x88,%f29	! %f29 = ff3700c7
!	Mem[0000000030001408] = 990000ff, %l6 = 00000000000000fd
	lduba	[%i0+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101400] = ffffffff, %l2 = 00000000000000c7
	ldsba	[%i4+%g0]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000211c0000] = c7ff85d2, %l6 = 00000000000000ff
	lduba	[%o2+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	%l0 = 0000000000000087, immd = fffffffffffff36e, %l7  = fffffffffffffff7
	mulx	%l0,-0xc92,%l7		! %l7 = fffffffffff95f02
!	Mem[0000000030041408] = 14e848df, %l6 = 00000000000000ff
	ldsha	[%i1+%o4]0x81,%l6	! %l6 = 00000000000014e8
!	Mem[0000000010101408] = 68a493c1dd9dc0ff, %f4  = 00000000 00000000
	ldda	[%i4+%o4]0x80,%f4 	! %f4  = 68a493c1 dd9dc0ff
!	Mem[0000000010001400] = bea1ef4b, %l1 = 0000000000000060
	lduha	[%i0+%g0]0x88,%l1	! %l1 = 000000000000ef4b
!	Mem[0000000030181408] = 000000c7, %l2 = ffffffffffffffff
	lduha	[%i6+%o4]0x89,%l2	! %l2 = 00000000000000c7
!	Starting 10 instruction Store Burst
!	Mem[0000000010141438] = ff000071, %l7 = fffffffffff95f02
	swap	[%i5+0x038],%l7		! %l7 = 00000000ff000071

p0_label_82:
!	Mem[0000000010181408] = fd000000, %l6 = 00000000000014e8
	ldstuba	[%i6+%o4]0x80,%l6	! %l6 = 000000fd000000ff
!	Mem[0000000010001400] = bea1ef4b, %l2 = 00000000000000c7
	ldstuba	[%i0+%g0]0x88,%l2	! %l2 = 0000004b000000ff
!	%f6  = d6000000 ffc09ddd, Mem[0000000030081408] = ff000000 000000c2
	stda	%f6 ,[%i2+%o4]0x81	! Mem[0000000030081408] = d6000000 ffc09ddd
!	%l6 = 000000fd, %l7 = ff000071, Mem[0000000010001408] = ff3700c7 1bdb04eb
	stda	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000fd ff000071
!	%l0 = 0000000000000087, Mem[0000000010081410] = 00005dfd
	stwa	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000087
!	%l3 = 00000000050000ff, Mem[0000000030141408] = 7e60bfff
	stha	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 7e6000ff
!	Mem[0000000010181410] = f8ffffff, %l5 = 00000000ff000005
	swapa	[%i6+%o5]0x88,%l5	! %l5 = 00000000f8ffffff
!	%f25 = 00000000, Mem[0000000030081400] = ffbc8902
	sta	%f25,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	%l1 = 000000000000ef4b, Mem[00000000211c0001] = c7ff85d2, %asi = 80
	stba	%l1,[%o2+0x001]%asi	! Mem[00000000211c0000] = c74b85d2
!	Starting 10 instruction Load Burst
!	%f20 = 00000000 00000000, Mem[0000000030181408] = c7000000 d9af76d2
	stda	%f20,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000 00000000

p0_label_83:
!	Mem[0000000010041408] = ff9010b9, %l2 = 000000000000004b
	lduwa	[%i1+%o4]0x80,%l2	! %l2 = 00000000ff9010b9
!	Mem[0000000030001400] = ff047005, %l5 = 00000000f8ffffff
	ldsha	[%i0+%g0]0x81,%l5	! %l5 = ffffffffffffff04
!	Mem[0000000010141408] = c193a468, %f7  = ffc09ddd
	lda	[%i5+%o4]0x88,%f7 	! %f7 = c193a468
!	Mem[00000000201c0000] = 00004c08, %l0 = 0000000000000087
	lduh	[%o0+%g0],%l0		! %l0 = 0000000000000000
!	Mem[0000000030141408] = 7e6000ff, %l1 = 000000000000ef4b
	ldswa	[%i5+%o4]0x89,%l1	! %l1 = 000000007e6000ff
!	Mem[0000000010181400] = 00000000, %f16 = ffc09ddd
	lda	[%i6+%g0]0x88,%f16	! %f16 = 00000000
!	Mem[0000000030141400] = 00001c27, %l0 = 0000000000000000
	lduha	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000030001400] = ff047005 692e554c ff000099 e96decff
!	Mem[0000000030001410] = d6000000 ffbcffff 0de00ad7 3f0316a6
!	Mem[0000000030001420] = ffbf607e bea1eff2 7e848291 012e512a
!	Mem[0000000030001430] = 0b8ebdd3 e299e9e3 11872dd6 85f46044
	ldda	[%i0]ASI_BLK_S,%f0	! Block Load from 0000000030001400
!	Mem[0000000010101410] = 00bf607e, %l1 = 000000007e6000ff
	ldsha	[%i4+0x012]%asi,%l1	! %l1 = 000000000000607e
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ff9010b9, Mem[0000000010041401] = ff005abc
	stb	%l2,[%i1+0x001]		! Mem[0000000010041400] = ffb95abc

p0_label_84:
	membar	#Sync			! Added by membar checker (16)
!	%l5 = ffffffffffffff04, Mem[0000000030001400] = 057004ff
	stwa	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffff04
!	%f8  = ffbf607e bea1eff2, %l7 = 00000000ff000071
!	Mem[0000000010101428] = 765c210fc26cf44e
	add	%i4,0x028,%g1
	stda	%f8,[%g1+%l7]ASI_PST16_P ! Mem[0000000010101428] = 765c210fc26ceff2
!	%f20 = 00000000 00000000, %l2 = 00000000ff9010b9
!	Mem[0000000030001438] = 11872dd685f46044
	add	%i0,0x038,%g1
	stda	%f20,[%g1+%l2]ASI_PST16_S ! Mem[0000000030001438] = 00002dd685f40000
!	%l0 = 0000000000000000, Mem[0000000010141400] = ff5d0000
	stwa	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	%f2  = ff000099, Mem[000000001000143c] = ffffdaa0
	sta	%f2 ,[%i0+0x03c]%asi	! Mem[000000001000143c] = ff000099
!	Mem[0000000010181410] = 050000ff, %l6 = 000000fd, %l4 = dd9dc0ff
	add	%i6,0x10,%g1
	casa	[%g1]0x80,%l6,%l4	! %l4 = 00000000050000ff
!	Mem[00000000300c1408] = e96decff, %l5 = ffffffffffffff04
	swapa	[%i3+%o4]0x89,%l5	! %l5 = 00000000e96decff
!	%l4 = 00000000050000ff, Mem[00000000300c1400] = 050000ff
	stha	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 050000ff
!	%l4 = 00000000050000ff, Mem[0000000010041400] = ffb95abc
	stba	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = ffb95abc
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = c193a468, %l7 = 00000000ff000071
	ldswa	[%i5+%o4]0x88,%l7	! %l7 = ffffffffc193a468

p0_label_85:
!	Mem[00000000300c1400] = 050000ff, %l3 = 00000000050000ff
	lduwa	[%i3+%g0]0x89,%l3	! %l3 = 00000000050000ff
!	Mem[0000000010081408] = 00000087, %l4 = 00000000050000ff
	lduba	[%i2+0x00a]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101400] = ffffffff, %l3 = 00000000050000ff
	lduwa	[%i4+%g0]0x88,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000010001438] = 188c1bc5, %l0 = 0000000000000000
	ldub	[%i0+0x03a],%l0		! %l0 = 000000000000001b
!	%l0 = 000000000000001b, immd = 000000000000022a, %l7 = ffffffffc193a468
	udivx	%l0,0x22a,%l7		! %l7 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l6 = 00000000000000fd
	lduba	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = ff1af687, %l1 = 000000000000607e
	ldswa	[%i1+%o5]0x80,%l1	! %l1 = ffffffffff1af687
!	Mem[0000000010001410] = 92bc9ddd, %l5 = 00000000e96decff
	ldsba	[%i0+%o5]0x80,%l5	! %l5 = ffffffffffffff92
!	Mem[0000000010001400] = bea1efff, %l4 = 0000000000000000
	ldsha	[%i0+%g0]0x88,%l4	! %l4 = ffffffffffffefff
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000001b, Mem[00000000100c1400] = ffbf0000
	stba	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 1bbf0000

p0_label_86:
!	%l4 = ffffffffffffefff, Mem[0000000030181408] = 00000000
	stha	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000efff
!	%l2 = ff9010b9, %l3 = ffffffff, Mem[0000000010041430] = ef8c9284 db19a1b5
	std	%l2,[%i1+0x030]		! Mem[0000000010041430] = ff9010b9 ffffffff
!	%f10 = 7e848291 012e512a, %l5 = ffffffffffffff92
!	Mem[0000000030081428] = 204360baaa51901e
	add	%i2,0x028,%g1
	stda	%f10,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030081428] = 204360ba9182847e
!	%f20 = 00000000, Mem[0000000030141410] = 00000000
	sta	%f20,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	%l2 = 00000000ff9010b9, Mem[0000000010141408] = c2ffffffc193a468
	stxa	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000ff9010b9
!	%f6  = 0de00ad7, %f24 = 68a493c1
	fcmpes	%fcc0,%f6 ,%f24		! %fcc0 = 1
!	%l1 = ffffffffff1af687, %l0 = 000000000000001b, %y  = ffffe2c6
	udiv	%l1,%l0,%l0		! %l0 = 00000000ffffffff
	mov	%l0,%y			! %y = ffffffff
!	Mem[0000000030181400] = ffffffff, %l5 = ffffffffffffff92
	swapa	[%i6+%g0]0x81,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010101408] = c193a468, %l0 = 00000000ffffffff
	ldstuba	[%i4+%o4]0x88,%l0	! %l0 = 00000068000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ffffffff, %l6 = 0000000000000000
	ldswa	[%i4+%g0]0x80,%l6	! %l6 = ffffffffffffffff

p0_label_87:
!	Mem[0000000030181408] = ffef0000, %l6 = ffffffffffffffff
	lduba	[%i6+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041400] = ff7a5072450440d6, %l1 = ffffffffff1af687
	ldxa	[%i1+%g0]0x81,%l1	! %l1 = ff7a5072450440d6
!	Mem[00000000100c1410] = ffc09ddd, %l4 = ffffffffffffefff
	ldsba	[%i3+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141420] = 2fc09ddd, %l3 = 00000000ffffffff
	lduha	[%i5+0x020]%asi,%l3	! %l3 = 0000000000002fc0
!	Mem[00000000211c0000] = c74b85d2, %l7 = 0000000000000000
	ldsh	[%o2+%g0],%l7		! %l7 = ffffffffffffc74b
!	Mem[0000000010141410] = 5063fba2f02d883c, %l7 = ffffffffffffc74b
	ldx	[%i5+%o5],%l7		! %l7 = 5063fba2f02d883c
!	Mem[0000000021800140] = f60105d8, %l6 = 00000000000000ff
	lduh	[%o3+0x140],%l6		! %l6 = 000000000000f601
!	Mem[0000000010181408] = 00000000000000ff, %l1 = ff7a5072450440d6
	ldxa	[%i6+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%l5 = 00000000ffffffff, %l0 = 0000000000000068, %l3 = 0000000000002fc0
	sub	%l5,%l0,%l3		! %l3 = 00000000ffffff97
!	Starting 10 instruction Store Burst
!	Code Fragment 4
p0_fragment_6:
!	%l0 = 0000000000000068
	setx	0xbec5f588423721ac,%g7,%l0 ! %l0 = bec5f588423721ac
!	%l1 = 00000000000000ff
	setx	0xe8561b2071400fcc,%g7,%l1 ! %l1 = e8561b2071400fcc
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = bec5f588423721ac
	setx	0x45f2bd8027403a39,%g7,%l0 ! %l0 = 45f2bd8027403a39
!	%l1 = e8561b2071400fcc
	setx	0xbfb3d90f82ec1abd,%g7,%l1 ! %l1 = bfb3d90f82ec1abd

p0_label_88:
!	%l5 = 00000000ffffffff, Mem[0000000030041410] = 2bee0573
	stwa	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = ffffffff
!	%l6 = 0000f601, %l7 = f02d883c, Mem[0000000010181408] = ff000000 00000000
	std	%l6,[%i6+%o4]		! Mem[0000000010181408] = 0000f601 f02d883c
!	Mem[0000000030081408] = d6000000, %l3 = 00000000ffffff97
	ldstuba	[%i2+%o4]0x81,%l3	! %l3 = 000000d6000000ff
!	Mem[0000000030041408] = 14e848df, %l0 = 45f2bd8027403a39
	ldstuba	[%i1+%o4]0x81,%l0	! %l0 = 00000014000000ff
!	%l2 = ff9010b9, %l3 = 000000d6, Mem[0000000030001410] = d6000000 ffbcffff
	stda	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = ff9010b9 000000d6
!	Mem[0000000030081410] = 0000e2ff, %l0 = 0000000000000014
	swapa	[%i2+%o5]0x89,%l0	! %l0 = 000000000000e2ff
!	Mem[00000000100c1408] = 00001c27, %l3 = 00000000000000d6
	swapa	[%i3+%o4]0x88,%l3	! %l3 = 0000000000001c27
!	Mem[00000000100c1414] = c193a468, %l3 = 0000000000001c27, %asi = 80
	swapa	[%i3+0x014]%asi,%l3	! %l3 = 00000000c193a468
!	%l3 = 00000000c193a468, Mem[0000000010181408] = 0000f601, %asi = 80
	stwa	%l3,[%i6+0x008]%asi	! Mem[0000000010181408] = c193a468
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = c193a468f02d883c, %f24 = 68a493c1 00000000
	ldda	[%i6+%o4]0x80,%f24	! %f24 = c193a468 f02d883c

p0_label_89:
!	%l3 = 00000000c193a468, imm = fffffffffffff4af, %l7 = 5063fba2f02d883c
	or	%l3,-0xb51,%l7		! %l7 = fffffffffffff4ef
!	Mem[0000000010181410] = ff000005, %l6 = 000000000000f601
	ldswa	[%i6+%o5]0x88,%l6	! %l6 = ffffffffff000005
!	%l4 = ffffffffffffffff, %l1 = bfb3d90f82ec1abd, %l5 = 00000000ffffffff
	xnor	%l4,%l1,%l5		! %l5 = bfb3d90f82ec1abd
!	Mem[0000000030041400] = ff7a5072, %l4 = ffffffffffffffff
	ldsba	[%i1+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000300c1408] = ffffff04, %l0 = 000000000000e2ff
	ldswa	[%i3+%o4]0x89,%l0	! %l0 = ffffffffffffff04
!	Mem[0000000010181408] = 68a493c1, %l6 = ffffffffff000005
	ldsba	[%i6+%o4]0x88,%l6	! %l6 = ffffffffffffffc1
!	%l1 = bfb3d90f82ec1abd, %l5 = bfb3d90f82ec1abd, %l4  = ffffffffffffffff
	mulx	%l1,%l5,%l4		! %l4 = 4a42310f4342ef89
!	Mem[0000000010041408] = ff9010b9 bea1ef4b, %l2 = ff9010b9, %l3 = c193a468
	ldda	[%i1+%o4]0x80,%l2	! %l2 = 00000000ff9010b9 00000000bea1ef4b
!	Mem[0000000030141410] = 00000000, %f16 = 00000000
	lda	[%i5+%o5]0x81,%f16	! %f16 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181428] = 3d702fb7, %l1 = 82ec1abd, %l2 = ff9010b9
	add	%i6,0x28,%g1
	casa	[%g1]0x80,%l1,%l2	! %l2 = 000000003d702fb7

p0_label_90:
!	Mem[000000001000140f] = 710000ff, %l3 = 00000000bea1ef4b
	ldstub	[%i0+0x00f],%l3		! %l3 = 000000ff000000ff
!	%l4 = 4a42310f4342ef89, Mem[0000000030041410] = ffffffffffffffff
	stxa	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 4a42310f4342ef89
!	%f12 = 0b8ebdd3 e299e9e3, Mem[0000000010181400] = 00000000 0000703d
	stda	%f12,[%i6+%g0]0x80	! Mem[0000000010181400] = 0b8ebdd3 e299e9e3
!	Mem[0000000010001410] = dd9dbc92, %l2 = 000000003d702fb7
	ldstuba	[%i0+%o5]0x88,%l2	! %l2 = 00000092000000ff
!	Mem[0000000020800000] = 5fffba64, %l5 = bfb3d90f82ec1abd
	ldstub	[%o1+%g0],%l5		! %l5 = 0000005f000000ff
!	Mem[00000000100c1400] = 0000bf1b, %l4 = 4a42310f4342ef89
	swapa	[%i3+%g0]0x88,%l4	! %l4 = 000000000000bf1b
!	%f22 = ffc09ddd ffbf607e, Mem[0000000010181400] = d3bd8e0b e3e999e2
	stda	%f22,[%i6+%g0]0x88	! Mem[0000000010181400] = ffc09ddd ffbf607e
!	Mem[0000000010101428] = 765c210f, %l0 = ffffffffffffff04, %asi = 80
	swapa	[%i4+0x028]%asi,%l0	! %l0 = 00000000765c210f
!	%l2 = 00000092, %l3 = 000000ff, Mem[0000000010041438] = 00000000 2d3bd900
	std	%l2,[%i1+0x038]		! Mem[0000000010041438] = 00000092 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ffffff04, %l5 = 000000000000005f
	ldsba	[%i0+%g0]0x89,%l5	! %l5 = 0000000000000004

p0_label_91:
!	%l6 = ffffffffffffffc1, %l4 = 000000000000bf1b, %l4 = 000000000000bf1b
	subc	%l6,%l4,%l4		! %l4 = ffffffffffff40a6
!	Mem[0000000030181410] = 9100000000000000, %f28 = ffec6de9 ff3700c7
	ldda	[%i6+%o5]0x81,%f28	! %f28 = 91000000 00000000
!	Mem[0000000030101400] = 765c210f, %l3 = 00000000000000ff
	ldsha	[%i4+%g0]0x89,%l3	! %l3 = 000000000000210f
!	Mem[0000000010141400] = 00000000, %l0 = 00000000765c210f
	ldsba	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081400] = 36c0c225, %l1 = bfb3d90f82ec1abd
	lduwa	[%i2+%g0]0x88,%l1	! %l1 = 0000000036c0c225
!	Mem[0000000020800040] = f71dc1d1, %l3 = 000000000000210f
	ldsba	[%o1+0x040]%asi,%l3	! %l3 = fffffffffffffff7
!	Mem[0000000010101418] = dd9dc0ff, %l7 = fffffffffffff4ef
	lduha	[%i4+0x018]%asi,%l7	! %l7 = 000000000000dd9d
!	Mem[0000000030181400] = 92ffffff, %l7 = 000000000000dd9d
	lduha	[%i6+%g0]0x89,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010181400] = 7e60bfff, %l0 = 0000000000000000
	ldswa	[%i6+%g0]0x80,%l0	! %l0 = 000000007e60bfff
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = b91090ff, %l3 = fffffffffffffff7
	swapa	[%i5+%o4]0x80,%l3	! %l3 = 00000000b91090ff

p0_label_92:
!	%l0 = 7e60bfff, %l1 = 36c0c225, Mem[0000000010041410] = ff1af687 450440d6
	stda	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 7e60bfff 36c0c225
!	%l0 = 7e60bfff, %l1 = 36c0c225, Mem[0000000010181418] = 09416abe 450440d6
	stda	%l0,[%i6+0x018]%asi	! Mem[0000000010181418] = 7e60bfff 36c0c225
!	%l3 = 00000000b91090ff, Mem[00000000300c1410] = ffc09ddd0000001b
	stxa	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000b91090ff
!	%l2 = 0000000000000092, Mem[0000000030041400] = 72507aff
	stha	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 72500092
!	Mem[0000000010181400] = 7e60bfff, %l6 = ffffffffffffffc1
	swapa	[%i6+%g0]0x80,%l6	! %l6 = 000000007e60bfff
!	%l2 = 0000000000000092, Mem[0000000010041430] = ff9010b9
	stb	%l2,[%i1+0x030]		! Mem[0000000010041430] = 929010b9
!	Mem[0000000030101400] = 0f215c76, %l1 = 0000000036c0c225
	swapa	[%i4+%g0]0x81,%l1	! %l1 = 000000000f215c76
!	Mem[0000000030081408] = ff000000, %l7 = 000000000000ffff
	ldstuba	[%i2+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010081410] = 00000087, %l0 = 000000007e60bfff
	swapa	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000087
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 00000091, %l4 = ffffffffffff40a6
	ldsha	[%i6+%o5]0x89,%l4	! %l4 = 0000000000000091

p0_label_93:
!	Mem[00000000201c0000] = 00004c08, %l3 = 00000000b91090ff
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = 25c2c036, %l6 = 000000007e60bfff
	lduwa	[%i2+%g0]0x80,%l6	! %l6 = 0000000025c2c036
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000030001400] = 04ffffff 692e554c ff000099 e96decff
!	Mem[0000000030001410] = ff9010b9 000000d6 0de00ad7 3f0316a6
!	Mem[0000000030001420] = ffbf607e bea1eff2 7e848291 012e512a
!	Mem[0000000030001430] = 0b8ebdd3 e299e9e3 00002dd6 85f40000
	ldda	[%i0]ASI_BLK_SL,%f16	! Block Load from 0000000030001400
!	Mem[0000000010141400] = 0000000000000000, %f10 = 7e848291 012e512a
	ldda	[%i5+%g0]0x80,%f10	! %f10 = 00000000 00000000
!	Mem[00000000100c1438] = b4e1f0ff, %l7 = 00000000000000ff
	lduba	[%i3+0x03a]%asi,%l7	! %l7 = 00000000000000f0
!	Mem[0000000030041400] = 72500092, %l5 = 0000000000000004
	lduha	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000092
!	Mem[0000000030081400] = 00000000, %l6 = 0000000025c2c036
	ldsba	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = 25c2c036ffbf607e, %l2 = 0000000000000092
	ldxa	[%i1+%o5]0x88,%l2	! %l2 = 25c2c036ffbf607e
!	Mem[00000000300c1408] = 04ffffffffffffc2, %f10 = 00000000 00000000
	ldda	[%i3+%o4]0x81,%f10	! %f10 = 04ffffff ffffffc2
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = ff9010b9, %l0 = 0000000000000087
	ldstuba	[%i0+%o5]0x81,%l0	! %l0 = 000000ff000000ff

p0_label_94:
!	%l1 = 000000000f215c76, Mem[0000000030141410] = 00000000
	stwa	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = 0f215c76
!	%f10 = 04ffffff ffffffc2, Mem[00000000100c1410] = dd9dc0ff 271c0000
	stda	%f10,[%i3+%o5]0x88	! Mem[00000000100c1410] = 04ffffff ffffffc2
	membar	#Sync			! Added by membar checker (18)
!	%f15 = 85f46044, Mem[0000000030001400] = 04ffffff
	sta	%f15,[%i0+%g0]0x81	! Mem[0000000030001400] = 85f46044
!	Mem[0000000010001410] = ffbc9ddd, %l4 = 0000000000000091
	swapa	[%i0+%o5]0x80,%l4	! %l4 = 00000000ffbc9ddd
!	Mem[00000000300c1400] = ff000005, %l0 = 00000000000000ff
	ldstuba	[%i3+%g0]0x81,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010181400] = c1ffffff, %l2 = 25c2c036ffbf607e
	ldstuba	[%i6+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	%l5 = 0000000000000092, Mem[0000000010001408] = fd000000
	stwa	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000092
!	Mem[0000000010181400] = c1ffffff, %l5 = 0000000000000092
	swapa	[%i6+%g0]0x88,%l5	! %l5 = 00000000c1ffffff
!	%l2 = 00000000000000ff, Mem[0000000030001410] = b91090ff
	stba	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = b91090ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff000005, %l1 = 000000000f215c76
	ldsba	[%i3+%g0]0x81,%l1	! %l1 = ffffffffffffffff

p0_label_95:
!	Mem[0000000030101410] = dd9dc0ff, %l1 = ffffffffffffffff
	ldsba	[%i4+%o5]0x81,%l1	! %l1 = ffffffffffffffdd
!	Mem[0000000010141410] = 5063fba2, %l3 = 0000000000000000
	ldswa	[%i5+%o5]0x80,%l3	! %l3 = 000000005063fba2
!	Mem[0000000010101410] = 00bf607e, %l2 = 00000000000000ff
	ldsha	[%i4+%o5]0x80,%l2	! %l2 = 00000000000000bf
!	Mem[0000000030081400] = 00000000, %l3 = 000000005063fba2
	lduwa	[%i2+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = f7ffffff, %l2 = 00000000000000bf
	ldsha	[%i5+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000218000c0] = 6fd44ce8, %l0 = 00000000000000ff
	lduh	[%o3+0x0c0],%l0		! %l0 = 0000000000006fd4
!	Mem[0000000030181408] = 000000000000efff, %l7 = 00000000000000f0
	ldxa	[%i6+%o4]0x89,%l7	! %l7 = 000000000000efff
!	Mem[0000000010081408] = 00000087, %l0 = 0000000000006fd4
	lduba	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141430] = 00000000, %f13 = e299e9e3
	lda	[%i5+0x030]%asi,%f13	! %f13 = 00000000
!	Starting 10 instruction Store Burst
!	%l5 = 00000000c1ffffff, Mem[0000000030181410] = 00000091
	stwa	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = c1ffffff

p0_label_96:
!	%l6 = 0000000000000000, Mem[0000000030101400] = 36c0c22500000000
	stxa	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000000000
!	Mem[0000000010001425] = 5dfdffff, %l3 = 0000000000000000
	ldstuba	[%i0+0x025]%asi,%l3	! %l3 = 000000fd000000ff
!	%l4 = 00000000ffbc9ddd, Mem[000000001004140a] = ff9010b9
	stb	%l4,[%i1+0x00a]		! Mem[0000000010041408] = ff90ddb9
!	Mem[0000000010041400] = ffb95abc, %l3 = 00000000000000fd
	swapa	[%i1+%g0]0x80,%l3	! %l3 = 00000000ffb95abc
!	%l0 = 0000000000000000, Mem[00000000300c1410] = 00000000
	stha	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	%l0 = 00000000, %l1 = ffffffdd, Mem[00000000300c1408] = ffffff04 c2ffffff
	stda	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000 ffffffdd
!	Mem[00000000300c1400] = 050000ff, %l0 = 0000000000000000
	ldstuba	[%i3+%g0]0x89,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010081400] = 25c2c036, %l2 = ffffffffffffffff
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 0000000025c2c036
!	Mem[0000000010001408] = 00000092710000ff, %l7 = 000000000000efff, %l2 = 0000000025c2c036
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l7,%l2	! %l2 = 00000092710000ff
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_7:
!	%l0 = 00000000000000ff
	setx	0xbae45f1f9e7528c9,%g7,%l0 ! %l0 = bae45f1f9e7528c9
!	%l1 = ffffffffffffffdd
	setx	0x47a4a8d7cb990960,%g7,%l1 ! %l1 = 47a4a8d7cb990960
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = bae45f1f9e7528c9
	setx	0x0b920507aadf3a53,%g7,%l0 ! %l0 = 0b920507aadf3a53
!	%l1 = 47a4a8d7cb990960
	setx	0x070bc0a017f4a9ea,%g7,%l1 ! %l1 = 070bc0a017f4a9ea

p0_label_97:
!	Mem[0000000010081408] = 87000000, %l0 = 0b920507aadf3a53
	ldswa	[%i2+%o4]0x88,%l0	! %l0 = ffffffff87000000
!	Mem[00000000300c1400] = 050000ff, %l3 = 00000000ffb95abc
	lduha	[%i3+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081400] = ffffffff, %l7 = 000000000000efff
	ldsha	[%i2+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010141434] = ffbf607e, %l3 = 00000000000000ff
	ldsha	[%i5+0x034]%asi,%l3	! %l3 = ffffffffffffffbf
!	Mem[0000000030001408] = ff000099, %l2 = 00000092710000ff
	ldswa	[%i0+%o4]0x81,%l2	! %l2 = ffffffffff000099
!	Mem[0000000030101408] = ffffffff, %l5 = 00000000c1ffffff
	lduba	[%i4+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101410] = 00000000ffc09ddd, %f10 = 04ffffff ffffffc2
	ldda	[%i4+%o5]0x89,%f10	! %f10 = 00000000 ffc09ddd
!	Mem[0000000021800140] = f60105d8, %l6 = 0000000000000000
	ldsb	[%o3+0x140],%l6		! %l6 = fffffffffffffff6
!	Mem[0000000030041410] = 4342ef89, %l0 = ffffffff87000000
	ldswa	[%i1+%o5]0x89,%l0	! %l0 = 000000004342ef89
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = ffef0000, %l3 = ffffffffffffffbf
	ldstuba	[%i6+%o4]0x81,%l3	! %l3 = 000000ff000000ff

p0_label_98:
!	Mem[0000000030141408] = ff00607e, %l2 = ffffffffff000099
	swapa	[%i5+%o4]0x81,%l2	! %l2 = 00000000ff00607e
!	Mem[00000000300c1408] = 00000000, %l6 = fffffffffffffff6
	swapa	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000000
!	%l3 = 00000000000000ff, Mem[00000000201c0001] = 00004c08
	stb	%l3,[%o0+0x001]		! Mem[00000000201c0000] = 00ff4c08
!	%l5 = 00000000000000ff, Mem[00000000300c1400] = 00000000050000ff
	stxa	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000000000ff
!	Mem[0000000010101400] = ffffffff, %l1 = 070bc0a017f4a9ea
	ldstuba	[%i4+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000030101408] = ffffffff
	stha	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = 00ffffff
!	Mem[0000000030181410] = ffffffc1, %l5 = 00000000000000ff
	ldstuba	[%i6+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010001400] = bea1efff, %l3 = 00000000000000ff
	ldstuba	[%i0+%g0]0x88,%l3	! %l3 = 000000ff000000ff
!	%l3 = 00000000000000ff, %l2 = 00000000ff00607e, %l4 = 00000000ffbc9ddd
	sub	%l3,%l2,%l4		! %l4 = ffffffff00ffa081
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = f7ffffff, %f1  = 692e554c
	lda	[%i5+%o4]0x88,%f1 	! %f1 = f7ffffff

p0_label_99:
!	Mem[0000000010181428] = 3d702fb7c7eb5dfd, %f12 = 0b8ebdd3 00000000
	ldd	[%i6+0x028],%f12	! %f12 = 3d702fb7 c7eb5dfd
!	Mem[0000000030141408] = ff000099, %l7 = ffffffffffffffff
	ldswa	[%i5+%o4]0x81,%l7	! %l7 = ffffffffff000099
!	Mem[0000000010081408] = 00000087, %l0 = 000000004342ef89
	lduwa	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000087
!	Mem[0000000030101408] = 00ffffff, %l3 = 00000000000000ff
	ldswa	[%i4+%o4]0x81,%l3	! %l3 = 0000000000ffffff
!	Mem[0000000010041410] = 7e60bfff, %l1 = 00000000000000ff
	lduha	[%i1+0x010]%asi,%l1	! %l1 = 0000000000007e60
!	Mem[00000000201c0000] = 00ff4c08, %l5 = 00000000000000ff
	ldsba	[%o0+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1428] = 00000000, %l5 = 0000000000000000
	ldsh	[%i3+0x028],%l5		! %l5 = 0000000000000000
!	Mem[0000000030001408] = ffec6de9 990000ff, %l0 = 00000087, %l1 = 00007e60
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 00000000990000ff 00000000ffec6de9
!	Mem[0000000010181410] = 050000ff, %l7 = ffffffffff000099
	lduwa	[%i6+%o5]0x80,%l7	! %l7 = 00000000050000ff
!	Starting 10 instruction Store Burst
!	%f12 = 3d702fb7, Mem[00000000100c1410] = c2ffffff
	sta	%f12,[%i3+%o5]0x80	! Mem[00000000100c1410] = 3d702fb7

p0_label_100:
!	Mem[0000000010141400] = 00000000, %l7 = 00000000050000ff
	swapa	[%i5+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081410] = 00000014, %l5 = 0000000000000000
	swapa	[%i2+%o5]0x89,%l5	! %l5 = 0000000000000014
!	%l6 = 0000000000000000, Mem[0000000010081400] = ffffffff
	stwa	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	Mem[0000000010001400] = ffefa1be, %l0 = 00000000990000ff
	swapa	[%i0+%g0]0x80,%l0	! %l0 = 00000000ffefa1be
!	Mem[0000000010001408] = 00000092710000ff, %l5 = 0000000000000014, %l4 = ffffffff00ffa081
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l5,%l4	! %l4 = 00000092710000ff
!	%l7 = 0000000000000000, Mem[0000000030101400] = 00000000
	stha	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	%l0 = 00000000ffefa1be, Mem[0000000030001408] = ffec6de9990000ff
	stxa	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000ffefa1be
!	Mem[0000000030181410] = c1ffffff, %l3 = 0000000000ffffff
	ldstuba	[%i6+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	%l6 = 0000000000000000, Mem[0000000030001400] = 85f46044692e554c
	stxa	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000092, %l7 = 0000000000000000
	lduh	[%i0+%o4],%l7		! %l7 = 0000000000000000

p0_label_101:
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000010081400] = 00000000 00000080 00000087 ff000000
!	Mem[0000000010081410] = ffbf607e 4e000000 acad0ca9 c193a468
!	Mem[0000000010081420] = e139503d 8ea8260e f8ffffff 5063fba2
!	Mem[0000000010081430] = a675a8b0 7cfb0e7c 55045c7d 6de02ca5
	ldda	[%i2]ASI_BLK_P,%f16	! Block Load from 0000000010081400
!	Mem[0000000030081408] = dd9dc0ff000000ff, %f14 = 11872dd6 85f46044
	ldda	[%i2+%o4]0x89,%f14	! %f14 = dd9dc0ff 000000ff
!	Mem[0000000010181410] = 050000ff, %l2 = 00000000ff00607e
	lduwa	[%i6+%o5]0x80,%l2	! %l2 = 00000000050000ff
!	Code Fragment 4
p0_fragment_8:
!	%l0 = 00000000ffefa1be
	setx	0x2a758437b5105ba6,%g7,%l0 ! %l0 = 2a758437b5105ba6
!	%l1 = 00000000ffec6de9
	setx	0x7c63f81780530014,%g7,%l1 ! %l1 = 7c63f81780530014
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2a758437b5105ba6
	setx	0x949e034781301375,%g7,%l0 ! %l0 = 949e034781301375
!	%l1 = 7c63f81780530014
	setx	0x2daff30044f2afac,%g7,%l1 ! %l1 = 2daff30044f2afac
!	Mem[00000000300c1400] = ff000000 00000000 fffffff6 ddffffff
!	Mem[00000000300c1410] = 00000000 b91090ff ffc09ddd 63ace9a5
!	Mem[00000000300c1420] = a5e9ac63 94b18a76 bd7a5072 5063fba2
!	Mem[00000000300c1430] = ffec6de9 ffffffc2 b3660000 99e23750
	ldda	[%i3]ASI_BLK_S,%f0	! Block Load from 00000000300c1400
!	Mem[0000000030141410] = 00000000765c210f, %f20 = ffbf607e 4e000000
	ldda	[%i5+%o5]0x89,%f20	! %f20 = 00000000 765c210f
!	Mem[0000000030001400] = 00000000, %l2 = 00000000050000ff
	ldstuba	[%i0+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141400] = 050000ff 00000000 fffffff7 00000000
!	Mem[0000000010141410] = 5063fba2 f02d883c df48e814 0000001b
!	Mem[0000000010141420] = 2fc09ddd c193a468 425aeabe 0e541a91
!	Mem[0000000010141430] = 00000000 ffbf607e fff95f02 ffbf6049
	ldda	[%i5]ASI_BLK_PL,%f16	! Block Load from 0000000010141400
!	Mem[0000000030001408] = 00000000ffefa1be, %l0 = 949e034781301375
	ldxa	[%i0+%o4]0x89,%l0	! %l0 = 00000000ffefa1be
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000030181400] = ffffff92
	stba	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 00ffff92

p0_label_102:
!	Mem[0000000010001408] = 92000000, %l6 = 0000000000000000
	ldstuba	[%i0+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	%f2  = fffffff6, Mem[0000000010041424] = 4f881d5f
	st	%f2 ,[%i1+0x024]	! Mem[0000000010041424] = fffffff6
!	%l6 = 0000000000000000, Mem[00000000211c0000] = c74b85d2, %asi = 80
	stha	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = 000085d2
!	%l4 = 710000ff, %l5 = 00000014, Mem[0000000030101408] = 00ffffff 7e60bfff
	stda	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 710000ff 00000014
!	%l0 = 00000000ffefa1be, Mem[0000000030081410] = 0000000005700460
	stxa	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000ffefa1be
!	%f3  = ddffffff, Mem[0000000010101408] = ffa493c1
	sta	%f3 ,[%i4+0x008]%asi	! Mem[0000000010101408] = ddffffff
!	%f4  = 00000000 b91090ff, %l0 = 00000000ffefa1be
!	Mem[0000000030081420] = 6148fa0619b6d8d1
	add	%i2,0x020,%g1
	stda	%f4,[%g1+%l0]ASI_PST16_S ! Mem[0000000030081420] = 00000000b910d8d1
!	Mem[0000000010001438] = 188c1bc5, %l2 = 0000000000000000
	swap	[%i0+0x038],%l2		! %l2 = 00000000188c1bc5
!	%l1 = 2daff30044f2afac, Mem[0000000030041410] = 4342ef89
	stha	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = 4342afac
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 050000ff 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i5+%g0]0x80,%l6	! %l6 = 00000000050000ff 0000000000000000

p0_label_103:
!	Mem[0000000010101428] = ffffff04, %l0 = 00000000ffefa1be
	ldsba	[%i4+0x02a]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000300c1410] = 00000000, %l2 = 00000000188c1bc5
	ldswa	[%i3+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1400] = 4342ef89, %l6 = 00000000050000ff
	lduba	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000089
!	Mem[0000000010181418] = 7e60bfff, %l2 = 0000000000000000
	lduba	[%i6+0x019]%asi,%l2	! %l2 = 0000000000000060
!	Mem[0000000010001408] = ff000092, %l5 = 0000000000000014
	lduwa	[%i0+%o4]0x80,%l5	! %l5 = 00000000ff000092
!	Mem[0000000030141400] = 00001c27, %l0 = ffffffffffffffff
	ldsba	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000
!	%l1 = 2daff30044f2afac, immd = fffffffffffffb52, %l1  = 2daff30044f2afac
	mulx	%l1,-0x4ae,%l1		! %l1 = 329cd4bd584de918
!	Mem[00000000100c1410] = 3d702fb7, %l3 = 00000000000000ff
	ldsba	[%i3+%o5]0x80,%l3	! %l3 = 000000000000003d
!	Mem[0000000010041408] = ff90ddb9, %l2 = 0000000000000060
	lduba	[%i1+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000030141410] = 0f215c76
	stba	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 00215c76

p0_label_104:
!	Mem[0000000010001408] = 920000ff, %l7 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l7	! %l7 = 00000000920000ff
!	Mem[0000000030101400] = 00000000, %l6 = 0000000000000089
	swapa	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = ffefa1be, %l7 = 00000000920000ff
	ldstuba	[%i0+%o4]0x89,%l7	! %l7 = 000000be000000ff
!	Mem[0000000010081410] = 7e60bfff, %l5 = 00000000ff000092
	ldstuba	[%i2+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	%f10 = bd7a5072 5063fba2, %l3 = 000000000000003d
!	Mem[0000000010101438] = 00ff00000000002f
	add	%i4,0x038,%g1
	stda	%f10,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010101438] = a2fb63500000002f
!	%l7 = 00000000000000be, Mem[0000000030081410] = 00000000
	stha	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000be
!	Mem[0000000010101434] = 00000000, %l7 = 00000000000000be, %asi = 80
	swapa	[%i4+0x034]%asi,%l7	! %l7 = 0000000000000000
	membar	#Sync			! Added by membar checker (20)
!	%l1 = 329cd4bd584de918, Mem[0000000010081408] = 00000087
	stwa	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 584de918
!	Mem[00000000300c1410] = 00000000, %l4 = 00000092710000ff
	swapa	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff000005, %l7 = 0000000000000000
	ldsha	[%i6+%o5]0x88,%l7	! %l7 = 0000000000000005

p0_label_105:
!	Mem[0000000030181400] = 00ffff92, %l0 = 0000000000000000
	ldsha	[%i6+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041438] = 00000092, %l0 = 00000000000000ff
	ldsw	[%i1+0x038],%l0		! %l0 = 0000000000000092
!	Mem[00000000100c1410] = b72f703d, %l6 = 0000000000000000
	ldsha	[%i3+%o5]0x88,%l6	! %l6 = 000000000000703d
!	Mem[0000000010181404] = dd9dc0ff, %l3 = 000000000000003d
	lduh	[%i6+0x004],%l3		! %l3 = 000000000000dd9d
!	Mem[0000000010001404] = dd9dc0ff, %l6 = 000000000000703d
	ldsw	[%i0+0x004],%l6		! %l6 = ffffffffdd9dc0ff
!	%l2 = 00000000000000ff, %l3 = 000000000000dd9d, %l2 = 00000000000000ff
	subc	%l2,%l3,%l2		! %l2 = ffffffffffff2362
!	Mem[0000000010181400] = 00000092, %l2 = ffffffffffff2362
	lduba	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000092
!	Mem[0000000010081410] = ffbf607e, %l7 = 0000000000000005
	ldswa	[%i2+%o5]0x80,%l7	! %l7 = ffffffffffbf607e
!	Mem[0000000030141408] = ff0000994c552e69, %f22 = 1b000000 14e848df
	ldda	[%i5+%o4]0x81,%f22	! %f22 = ff000099 4c552e69
!	Starting 10 instruction Store Burst
!	Mem[0000000010081412] = ffbf607e, %l2 = 0000000000000092
	ldstuba	[%i2+0x012]%asi,%l2	! %l2 = 00000060000000ff

p0_label_106:
!	%l5 = 00000000000000ff, Mem[0000000010181408] = 3c882df068a493c1
	stxa	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010181410] = 050000ff
	stha	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000ff
!	%f21 = a2fb6350, Mem[0000000010181400] = 92000000
	st	%f21,[%i6+%g0]		! Mem[0000000010181400] = a2fb6350
!	Mem[0000000020800040] = f71dc1d1, %l6 = ffffffffdd9dc0ff
	ldstuba	[%o1+0x040]%asi,%l6	! %l6 = 000000f7000000ff
!	%l3 = 000000000000dd9d, Mem[00000000201c0000] = 00ff4c08
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = dd9d4c08
!	Mem[0000000030101400] = 00000000 00000089, %l0 = 00000092, %l1 = 584de918
	ldda	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000089 0000000000000000
!	Mem[0000000030001408] = ffefa1ff, %l6 = 00000000000000f7
	swapa	[%i0+%o4]0x89,%l6	! %l6 = 00000000ffefa1ff
!	%l6 = 00000000ffefa1ff, %l7 = ffffffffffbf607e, %l6 = 00000000ffefa1ff
	xnor	%l6,%l7,%l6		! %l6 = 00000000ffaf3e7e
!	%l6 = ffaf3e7e, %l7 = ffbf607e, Mem[0000000030141410] = 00215c76 00000000
	stda	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = ffaf3e7e ffbf607e
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff000071 b91090ff, %l2 = 00000060, %l3 = 0000dd9d
	ldda	[%i3+%o5]0x81,%l2	! %l2 = 00000000ff000071 00000000b91090ff

p0_label_107:
!	Mem[0000000010141400] = 00000000 ff000005, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i5+%g0]0x88,%l4	! %l4 = 00000000ff000005 0000000000000000
!	Mem[0000000010081400] = 8000000000000000, %f24 = 68a493c1 dd9dc02f
	ldda	[%i2+%g0]0x88,%f24	! %f24 = 80000000 00000000
!	Mem[0000000010041428] = 00000000000000ff, %f0  = ff000000 00000000
	ldd	[%i1+0x028],%f0 	! %f0  = 00000000 000000ff
!	Mem[0000000030041410] = acaf4243, %l6 = 00000000ffaf3e7e
	lduwa	[%i1+%o5]0x81,%l6	! %l6 = 00000000acaf4243
!	Mem[0000000030041408] = df48e8ff, %l5 = 0000000000000000
	ldsha	[%i1+%o4]0x89,%l5	! %l5 = ffffffffffffe8ff
!	Mem[0000000030141408] = 990000ff, %l6 = 00000000acaf4243
	ldsha	[%i5+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081408] = ff000000, %f25 = 00000000
	lda	[%i2+%o4]0x81,%f25	! %f25 = ff000000
!	Mem[0000000010141408] = fffffff7, %l5 = ffffffffffffe8ff
	ldswa	[%i5+%o4]0x80,%l5	! %l5 = fffffffffffffff7
!	Mem[00000000100c1410] = 04ffffffb72f703d, %l5 = fffffffffffffff7
	ldxa	[%i3+%o5]0x88,%l5	! %l5 = 04ffffffb72f703d
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ff000071, Mem[0000000030181410] = ffffffc100000000
	stxa	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000ff000071

p0_label_108:
!	Mem[0000000010101407] = fffffff7, %l6 = 00000000000000ff
	ldstub	[%i4+0x007],%l6		! %l6 = 000000f7000000ff
!	Mem[0000000010041408] = b9dd90ff, %l6 = 00000000000000f7
	lduwa	[%i1+%o4]0x88,%l6	! %l6 = 00000000b9dd90ff
!	%f26 = 911a540e, %f13 = ffffffc2, %f19 = f7ffffff
	fmuls	%f26,%f13,%f19		! %f19 = ffffffc2
!	%l7 = ffffffffffbf607e, Mem[00000000300c1408] = f6ffffff
	stwa	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffbf607e
!	Mem[0000000030101408] = ff000071, %l6 = 00000000b9dd90ff
	swapa	[%i4+%o4]0x89,%l6	! %l6 = 00000000ff000071
!	%f27 = beea5a42, Mem[0000000030081400] = 00000000
	sta	%f27,[%i2+%g0]0x81	! Mem[0000000030081400] = beea5a42
!	%f14 = b3660000 99e23750, %l6 = 00000000ff000071
!	Mem[0000000010181420] = 600470052bee0573
	add	%i6,0x020,%g1
	stda	%f14,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010181420] = 5037e2992bee0573
!	Mem[0000000010001400] = 990000ff, %l1 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l1	! %l1 = 00000000990000ff
!	Mem[0000000010181408] = ff000000, %l0 = 0000000000000089
	swapa	[%i6+%o4]0x80,%l0	! %l0 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ffe848df, %l5 = 04ffffffb72f703d
	ldsha	[%i1+%o4]0x81,%l5	! %l5 = ffffffffffffffe8

p0_label_109:
!	Mem[00000000201c0000] = dd9d4c08, %l0 = 00000000ff000000
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 000000000000dd9d
!	Mem[0000000010001408] = 00000000, %f28 = 7e60bfff
	lda	[%i0+%o4]0x80,%f28	! %f28 = 00000000
!	Mem[0000000010081420] = e139503d, %l4 = 00000000ff000005
	ldub	[%i2+0x022],%l4		! %l4 = 0000000000000050
!	Mem[0000000010101408] = ddffffff, %l1 = 00000000990000ff
	ldswa	[%i4+%o4]0x80,%l1	! %l1 = ffffffffddffffff
!	Mem[0000000010041400] = fd000000, %l6 = 00000000ff000071
	ldsha	[%i1+%g0]0x88,%l6	! %l6 = 0000000000000000
!	%l3 = 00000000b91090ff, immed = fffff104, %y  = ffffffff
	udiv	%l3,-0xefc,%l6		! %l6 = 00000000ffffffff
	mov	%l0,%y			! %y = 0000dd9d
!	Mem[0000000030081400] = 425aeabe, %l6 = 00000000ffffffff
	lduwa	[%i2+%g0]0x89,%l6	! %l6 = 00000000425aeabe
!	Mem[00000000201c0000] = dd9d4c08, %l6 = 00000000425aeabe
	ldsba	[%o0+0x001]%asi,%l6	! %l6 = ffffffffffffff9d
!	Mem[0000000010001418] = 2bee0573, %l5 = ffffffffffffffe8
	ldsh	[%i0+0x01a],%l5		! %l5 = 0000000000000573
!	Starting 10 instruction Store Burst
!	%f30 = 4960bfff, Mem[0000000030181400] = 00ffff92
	sta	%f30,[%i6+%g0]0x81	! Mem[0000000030181400] = 4960bfff

p0_label_110:
!	%l7 = ffffffffffbf607e, %l1 = ffffffffddffffff, %l1 = ffffffffddffffff
	xnor	%l7,%l1,%l1		! %l1 = ffffffffddbf607e
!	Mem[00000000100c1400] = 4342ef89, %l2 = 00000000ff000071
	ldstuba	[%i3+%g0]0x88,%l2	! %l2 = 00000089000000ff
!	Mem[0000000030101408] = b9dd90ff, %l0 = 000000000000dd9d
	ldstuba	[%i4+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	%f27 = beea5a42, Mem[0000000030041408] = df48e8ff
	sta	%f27,[%i1+%o4]0x89	! Mem[0000000030041408] = beea5a42
!	%l5 = 0000000000000573, Mem[0000000010041400] = fd000000
	stwa	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000573
!	%f21 = a2fb6350, %f14 = b3660000, %f5  = b91090ff
	fsubs	%f21,%f14,%f5 		! %f5  = 33660000
!	%l1 = ffffffffddbf607e, Mem[00000000211c0000] = 000085d2
	sth	%l1,[%o2+%g0]		! Mem[00000000211c0000] = 607e85d2
!	Mem[0000000010041410] = 7e60bfff, %l3 = 00000000b91090ff
	ldstuba	[%i1+%o5]0x80,%l3	! %l3 = 0000007e000000ff
!	Mem[0000000010001430] = ffec6de9, %l6 = ffffffffffffff9d
	ldstuba	[%i0+0x030]%asi,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081438] = 55045c7d, %l3 = 000000000000007e
	lduwa	[%i2+0x038]%asi,%l3	! %l3 = 0000000055045c7d

p0_label_111:
!	Mem[0000000030101410] = ffc09ddd, %l3 = 0000000055045c7d
	lduha	[%i4+%o5]0x89,%l3	! %l3 = 0000000000009ddd
!	Mem[0000000010141408] = 00000000 f7ffffff, %l2 = 00000089, %l3 = 00009ddd
	ldda	[%i5+%o4]0x88,%l2	! %l2 = 00000000f7ffffff 0000000000000000
!	Mem[00000000100c1410] = 3d702fb7, %l4 = 0000000000000050
	ldsw	[%i3+%o5],%l4		! %l4 = 000000003d702fb7
!	Mem[0000000030081410] = be000000, %l0 = 00000000000000ff
	ldswa	[%i2+%o5]0x81,%l0	! %l0 = ffffffffbe000000
!	Mem[00000000300c1400] = ff00000000000000, %f28 = 00000000 00000000
	ldda	[%i3+%g0]0x81,%f28	! %f28 = ff000000 00000000
!	Mem[0000000010001400] = 00000000 dd9dc0ff, %l6 = 000000ff, %l7 = ffbf607e
	ldda	[%i0+%g0]0x80,%l6	! %l6 = 0000000000000000 00000000dd9dc0ff
!	Mem[0000000030041400] = 72500092, %l4 = 000000003d702fb7
	lduha	[%i1+%g0]0x89,%l4	! %l4 = 0000000000000092
!	Mem[0000000030001400] = 000000ff, %l0 = ffffffffbe000000
	ldsba	[%i0+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000218001c0] = ff7e6949, %l7 = 00000000dd9dc0ff
	lduh	[%o3+0x1c0],%l7		! %l7 = 000000000000ff7e
!	Starting 10 instruction Store Burst
!	%f10 = bd7a5072 5063fba2, %l1 = ffffffffddbf607e
!	Mem[0000000030141428] = 3c882df0a2fb6350
	add	%i5,0x028,%g1
	stda	%f10,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030141428] = 3c88635072507abd

p0_label_112:
!	Mem[00000000300c1400] = 000000ff, %l5 = 0000000000000573
	swapa	[%i3+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081410] = 000000be, %l6 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l6	! %l6 = 000000be000000ff
!	%l5 = 00000000000000ff, Mem[0000000030101408] = b9dd90ff
	stwa	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000ff
!	%l5 = 00000000000000ff, Mem[00000000100c1400] = 4342efff
	stha	%l5,[%i3+%g0]0x88	! Mem[00000000100c1400] = 434200ff
!	Mem[00000000100c1408] = d6000000, %l6 = 000000be, %l3 = 00000000
	add	%i3,0x08,%g1
	casa	[%g1]0x80,%l6,%l3	! %l3 = 00000000d6000000
!	Mem[0000000010041408] = b9dd90ff, %l6 = 00000000000000be
	ldstuba	[%i1+%o4]0x88,%l6	! %l6 = 000000ff000000ff
!	%f20 = 3c882df0, %f16 = 00000000
	fcmps	%fcc2,%f20,%f16		! %fcc2 = 2
!	Mem[0000000030181400] = ffbf6049, %l0 = ffffffffffffffff
	ldstuba	[%i6+%g0]0x89,%l0	! %l0 = 00000049000000ff
!	%l3 = 00000000d6000000, Mem[0000000010141408] = fffffff7
	stwa	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = d6000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ff000099, %l3 = 00000000d6000000
	lduba	[%i5+%o4]0x81,%l3	! %l3 = 00000000000000ff

p0_label_113:
!	Mem[0000000010181438] = f6002dd663ace9a5, %l3 = 00000000000000ff
	ldxa	[%i6+0x038]%asi,%l3	! %l3 = f6002dd663ace9a5
!	Mem[0000000030181400] = ff60bfff, %l4 = 0000000000000092
	ldsba	[%i6+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010101408] = ddffffff, %l2 = 00000000f7ffffff
	lduba	[%i4+%o4]0x80,%l2	! %l2 = 00000000000000dd
!	Mem[0000000021800180] = 4bedbd9f, %l0 = 0000000000000049
	ldsba	[%o3+0x180]%asi,%l0	! %l0 = 000000000000004b
!	Mem[0000000010081400] = 00000000, %l1 = ffffffffddbf607e
	ldsba	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = 00000000000000d6, %l2 = 00000000000000dd
	ldxa	[%i5+%o4]0x88,%l2	! %l2 = 00000000000000d6
!	Mem[0000000010041430] = 929010b9, %l2 = 00000000000000d6
	lduw	[%i1+0x030],%l2		! %l2 = 00000000929010b9
!	Mem[0000000010041428] = 00000000, %f8  = a5e9ac63
	ld	[%i1+0x028],%f8 	! %f8 = 00000000
!	Mem[0000000030041410] = 4342afac, %l2 = 00000000929010b9
	lduba	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000ac
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000004b, Mem[00000000300c1408] = ffbf607e
	stwa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000004b

p0_label_114:
!	%f14 = b3660000, Mem[0000000010181400] = 5063fba2
	sta	%f14,[%i6+%g0]0x88	! Mem[0000000010181400] = b3660000
!	Mem[00000000300c1400] = 00000573, %l4 = ffffffffffffffff
	swapa	[%i3+%g0]0x89,%l4	! %l4 = 0000000000000573
!	%l1 = 0000000000000000, Mem[0000000010001431] = ffec6de9, %asi = 80
	stba	%l1,[%i0+0x031]%asi	! Mem[0000000010001430] = ff006de9
!	Mem[0000000010001414] = 00000000, %l3 = f6002dd663ace9a5
	swap	[%i0+0x014],%l3		! %l3 = 0000000000000000
!	%l5 = 00000000000000ff, Mem[00000000100c1410] = 3d702fb7
	stwa	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000ff
!	Mem[0000000030081410] = 000000ff, %l7 = 000000000000ff7e
	ldstuba	[%i2+%o5]0x89,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010101408] = ffffffdd, %l2 = 00000000000000ac
	ldstuba	[%i4+%o4]0x88,%l2	! %l2 = 000000dd000000ff
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000030001410] = b91090ff d6000000
	stda	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff 000000ff
!	%l4 = 0000000000000573, Mem[0000000030181410] = 00000000
	stwa	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000573
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1418] = 2349c7e1, %l7 = 00000000000000ff
	ldswa	[%i3+0x018]%asi,%l7	! %l7 = 000000002349c7e1

p0_label_115:
!	Mem[00000000100c1400] = ff004243, %l6 = 00000000000000ff
	ldsh	[%i3+0x002],%l6		! %l6 = 0000000000004243
!	Mem[0000000010101400] = ffffffff, %l4 = 0000000000000573
	ldswa	[%i4+%g0]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001408] = 00000000, %l5 = 00000000000000ff
	lduh	[%i0+%o4],%l5		! %l5 = 0000000000000000
!	Mem[0000000010141408] = d6000000, %l1 = 0000000000000000
	ldsha	[%i5+%o4]0x80,%l1	! %l1 = ffffffffffffd600
!	Mem[0000000030101400] = 89000000, %l0 = 000000000000004b
	ldsha	[%i4+%g0]0x81,%l0	! %l0 = ffffffffffff8900
!	Mem[0000000030041408] = 425aeabe, %l5 = 0000000000000000
	ldsba	[%i1+%o4]0x81,%l5	! %l5 = 0000000000000042
!	Mem[0000000010081400] = 00000000, %l5 = 0000000000000042
	ldsh	[%i2+0x002],%l5		! %l5 = 0000000000000000
!	%l6 = 0000000000004243, imm = 000000000000059a, %l2 = 00000000000000dd
	xor	%l6,0x59a,%l2		! %l2 = 00000000000047d9
!	Mem[0000000010101408] = ffffffff, %l4 = ffffffffffffffff
	lduba	[%i4+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 000000002349c7e1, Mem[0000000010001408] = 00000000
	stwa	%l7,[%i0+%o4]0x88	! Mem[0000000010001408] = 2349c7e1

p0_label_116:
!	%f14 = b3660000, Mem[0000000010141400] = 050000ff
	sta	%f14,[%i5+%g0]0x80	! Mem[0000000010141400] = b3660000
!	%l4 = 00000000000000ff, Mem[0000000010001400] = 00000000
	stba	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = ff000000
!	%l5 = 0000000000000000, Mem[0000000030081408] = ff000000ffc09ddd
	stxa	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000000000000
!	%l2 = 00000000000047d9, Mem[0000000010081426] = 8ea8260e
	sth	%l2,[%i2+0x026]		! Mem[0000000010081424] = 8ea847d9
!	%l0 = ffffffffffff8900, Mem[0000000030181400] = ff60bfff
	stha	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 8900bfff
!	Mem[0000000010081410] = ffbfff7e, %l7 = 000000002349c7e1
	swapa	[%i2+%o5]0x80,%l7	! %l7 = 00000000ffbfff7e
!	%l6 = 00004243, %l7 = ffbfff7e, Mem[0000000010101400] = ffffffff ffffffff
	stda	%l6,[%i4+0x000]%asi	! Mem[0000000010101400] = 00004243 ffbfff7e
!	%l0 = ffffffffffff8900, Mem[0000000010081408] = 584de918
	stba	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 004de918
!	%l3 = 0000000000000000, Mem[00000000211c0000] = 607e85d2
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 000085d2
!	Starting 10 instruction Load Burst
!	Mem[0000000010041420] = ffffffff, %l6 = 0000000000004243
	ldsh	[%i1+0x022],%l6		! %l6 = ffffffffffffffff

p0_label_117:
!	Mem[0000000030081400] = beea5a42, %l3 = 0000000000000000
	ldsba	[%i2+%g0]0x81,%l3	! %l3 = ffffffffffffffbe
!	Mem[00000000300c1400] = ffffffff, %l6 = ffffffffffffffff
	lduba	[%i3+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041400] = 92005072450440d6, %f20 = 3c882df0 a2fb6350
	ldda	[%i1+%g0]0x81,%f20	! %f20 = 92005072 450440d6
!	Mem[0000000030181400] = 8900bfff, %f6  = ffc09ddd
	lda	[%i6+%g0]0x81,%f6 	! %f6 = 8900bfff
!	Mem[0000000010181408] = 00000089, %l0 = ffffffffffff8900
	ldsba	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000000
!	%l1 = ffffffffffffd600, imm = 0000000000000124, %l3 = ffffffffffffffbe
	xor	%l1,0x124,%l3		! %l3 = ffffffffffffd724
!	Mem[00000000211c0000] = 000085d2, %l1 = ffffffffffffd600
	ldub	[%o2+0x001],%l1		! %l1 = 0000000000000000
!	Mem[0000000030001400] = ff000000 00000000, %l6 = 000000ff, %l7 = ffbfff7e
	ldda	[%i0+%g0]0x81,%l6	! %l6 = 00000000ff000000 0000000000000000
!	Mem[0000000010001410] = 00000091, %l2 = 00000000000047d9
	lduba	[%i0+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010141400] = b3660000
	stwa	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000

p0_label_118:
!	Mem[0000000010081400] = 00000000, %l5 = 0000000000000000
	swap	[%i2+%g0],%l5		! %l5 = 0000000000000000
!	Mem[00000000201c0001] = dd9d4c08, %l1 = 0000000000000000
	ldstub	[%o0+0x001],%l1		! %l1 = 0000009d000000ff
!	%f2  = fffffff6 ddffffff, Mem[0000000030141400] = 271c0000 00000000
	stda	%f2 ,[%i5+%g0]0x89	! Mem[0000000030141400] = fffffff6 ddffffff
!	Mem[00000000100c1418] = 2349c7e1, %l2 = 00000000, %l1 = 0000009d
	add	%i3,0x18,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 000000002349c7e1
!	%l4 = 00000000000000ff, Mem[0000000010041408] = b9dd90ff
	stha	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = b9dd00ff
!	%l5 = 0000000000000000, Mem[0000000030101400] = 0000000000000089
	stxa	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000000000000000
!	%l3 = ffffffffffffd724, %l7 = 0000000000000000, %l0 = 0000000000000000
	xor	%l3,%l7,%l0		! %l0 = ffffffffffffd724
!	%l6 = 00000000ff000000, Mem[0000000010101400] = 43420000
	stwa	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = ff000000
!	%f10 = bd7a5072, Mem[0000000030041400] = 92005072
	sta	%f10,[%i1+%g0]0x81	! Mem[0000000030041400] = bd7a5072
!	Starting 10 instruction Load Burst
!	Mem[0000000010081428] = f8ffffff, %l2 = 0000000000000000
	ldsha	[%i2+0x028]%asi,%l2	! %l2 = fffffffffffff8ff

p0_label_119:
!	Mem[0000000010081408] = 004de918, %f8  = 00000000
	lda	[%i2+%o4]0x80,%f8 	! %f8 = 004de918
!	Mem[0000000030041400] = bd7a5072, %l1 = 000000002349c7e1
	lduha	[%i1+%g0]0x81,%l1	! %l1 = 000000000000bd7a
!	Mem[0000000030101410] = dd9dc0ff, %f7  = 63ace9a5
	lda	[%i4+%o5]0x81,%f7 	! %f7 = dd9dc0ff
!	Mem[00000000201c0000] = ddff4c08, %l2 = fffffffffffff8ff
	ldsba	[%o0+0x001]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030181400] = 8900bfffe96decff, %f14 = b3660000 99e23750
	ldda	[%i6+%g0]0x81,%f14	! %f14 = 8900bfff e96decff
!	Mem[0000000010081400] = 00000000, %l0 = ffffffffffffd724
	ldswa	[%i2+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = 00000573ff000071, %f10 = bd7a5072 5063fba2
	ldda	[%i6+%o5]0x81,%f10	! %f10 = 00000573 ff000071
!	Mem[0000000030101410] = ffc09ddd, %l4 = 00000000000000ff
	ldsba	[%i4+%o5]0x89,%l4	! %l4 = ffffffffffffffdd
!	Mem[0000000010001400] = ff000000 dd9dc0ff, %l6 = ff000000, %l7 = 00000000
	ldda	[%i0+%g0]0x80,%l6	! %l6 = 00000000ff000000 00000000dd9dc0ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = ffbf0089, %l4 = ffffffffffffffdd
	ldstuba	[%i6+%g0]0x89,%l4	! %l4 = 00000089000000ff

p0_label_120:
!	%l7 = 00000000dd9dc0ff, Mem[0000000030081408] = 00000000
	stba	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = ff000000
!	%l2 = ffffffff, %l3 = ffffd724, Mem[0000000010181410] = ff000000 7305ee2b
	stda	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffffff ffffd724
!	%l5 = 0000000000000000, Mem[0000000010081400] = 00000000
	stwa	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	Mem[0000000010101400] = ff000000, %l2 = ffffffffffffffff
	ldstuba	[%i4+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%f22 = ff000099, %f29 = 00000000, %f12 = ffec6de9 ffffffc2
	fsmuld	%f22,%f29,%f12		! %f12 = 80000000 00000000
!	%l0 = 0000000000000000, imm = 0000000000000003, %l5 = 0000000000000000
	xnor	%l0,0x003,%l5		! %l5 = fffffffffffffffc
!	Mem[00000000100c1410] = 000000ff, %l2 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[000000001018142c] = c7eb5dfd
	sth	%l0,[%i6+0x02c]		! Mem[000000001018142c] = 00005dfd
!	%l2 = 000000ff, %l3 = ffffd724, Mem[0000000030001400] = 000000ff 00000000
	stda	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff ffffd724
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00bf607e3c4aefff, %f24 = 80000000 ff000000
	ldda	[%i4+%o5]0x80,%f24	! %f24 = 00bf607e 3c4aefff

p0_label_121:
!	Mem[0000000010181410] = ffffffff24d7ffff, %f12 = 80000000 00000000
	ldda	[%i6+%o5]0x80,%f12	! %f12 = ffffffff 24d7ffff
!	Mem[0000000030041400] = bd7a5072, %f25 = 3c4aefff
	lda	[%i1+%g0]0x81,%f25	! %f25 = bd7a5072
!	Mem[0000000030081400] = 97b11cb0425aeabe, %l3 = ffffffffffffd724
	ldxa	[%i2+%g0]0x89,%l3	! %l3 = 97b11cb0425aeabe
!	Mem[0000000010181410] = ffffffff, %f13 = 24d7ffff
	lda	[%i6+%o5]0x80,%f13	! %f13 = ffffffff
!	Mem[00000000300c1400] = ffffffff, %l5 = fffffffffffffffc
	ldsba	[%i3+%g0]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010041410] = ffbf60ff, %l1 = 000000000000bd7a
	lduha	[%i1+%o5]0x88,%l1	! %l1 = 00000000000060ff
!	Mem[0000000030141400] = ddffffff, %l4 = 0000000000000089
	lduba	[%i5+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081400] = 8000000000000000, %l3 = 97b11cb0425aeabe
	ldxa	[%i2+%g0]0x88,%l3	! %l3 = 8000000000000000
!	Mem[0000000010141400] = 00000000, %l0 = 0000000000000000
	lduwa	[%i5+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001438] = 00000000, %l3 = 00000000, %l3 = 00000000
	add	%i0,0x38,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 0000000000000000

p0_label_122:
!	%l4 = 000000ff, %l5 = ffffffff, Mem[0000000010001400] = ff000000 dd9dc0ff
	stda	%l4,[%i0+0x000]%asi	! Mem[0000000010001400] = 000000ff ffffffff
!	%f19 = ffffffc2, Mem[0000000030041410] = 4342afac
	sta	%f19,[%i1+%o5]0x89	! Mem[0000000030041410] = ffffffc2
!	%l7 = 00000000dd9dc0ff, %l2 = 00000000000000ff, %l1 = 00000000000060ff
	andn	%l7,%l2,%l1		! %l1 = 00000000dd9dc000
!	%l1 = 00000000dd9dc000, Mem[0000000030041408] = 425aeabe
	stba	%l1,[%i1+%o4]0x81	! Mem[0000000030041408] = 005aeabe
!	%l4 = 000000ff, %l5 = ffffffff, Mem[0000000030181400] = ffbf00ff ffec6de9
	stda	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff ffffffff
!	Mem[0000000030181410] = 73050000, %l7 = 00000000dd9dc0ff
	swapa	[%i6+%o5]0x89,%l7	! %l7 = 0000000073050000
!	Mem[000000001000140c] = 710000ff, %l7 = 73050000, %l3 = 00000000
	add	%i0,0x0c,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 00000000710000ff
!	%f9  = 94b18a76, Mem[0000000030141408] = 990000ff
	sta	%f9 ,[%i5+%o4]0x89	! Mem[0000000030141408] = 94b18a76
!	%l2 = 000000ff, %l3 = 710000ff, Mem[0000000030141408] = 94b18a76 692e554c
	stda	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000ff 710000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ddff4c08, %l3 = 00000000710000ff
	ldsb	[%o0+%g0],%l3		! %l3 = ffffffffffffffdd

p0_label_123:
!	Mem[0000000030181410] = dd9dc0ff, %l6 = 00000000ff000000
	lduba	[%i6+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181400] = ffc09dddb3660000, %f20 = 92005072 450440d6
	ldda	[%i6+%g0]0x88,%f20	! %f20 = ffc09ddd b3660000
!	Mem[0000000010081408] = 000000ff18e94d00, %f22 = ff000099 4c552e69
	ldda	[%i2+%o4]0x88,%f22	! %f22 = 000000ff 18e94d00
!	Mem[0000000030081400] = beea5a42, %l2 = 00000000000000ff
	ldsha	[%i2+%g0]0x81,%l2	! %l2 = ffffffffffffbeea
!	%l6 = 00000000000000ff, immed = 00000c15, %y  = 0000dd9d
	smul	%l6,0xc15,%l2		! %l2 = 00000000000c08eb, %y = 00000000
!	Mem[00000000300c1408] = 4b000000, %l0 = 0000000000000000
	ldsha	[%i3+%o4]0x81,%l0	! %l0 = 0000000000004b00
!	Mem[0000000030101408] = 000000ff, %l4 = 00000000000000ff
	lduha	[%i4+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141408] = 000000d6, %l2 = 00000000000c08eb
	ldsba	[%i5+%o4]0x88,%l2	! %l2 = ffffffffffffffd6
!	Mem[0000000021800100] = eca18676, %l4 = 00000000000000ff
	ldsb	[%o3+0x100],%l4		! %l4 = ffffffffffffffec
!	Starting 10 instruction Store Burst
!	Mem[0000000020800000] = ffffba64, %l6 = 00000000000000ff
	ldstub	[%o1+%g0],%l6		! %l6 = 000000ff000000ff

p0_label_124:
!	%f16 = 00000000 ff000005 00000000 ffffffc2
!	%f20 = ffc09ddd b3660000 000000ff 18e94d00
!	%f24 = 00bf607e bd7a5072 911a540e beea5a42
!	%f28 = ff000000 00000000 4960bfff 025ff9ff
	stda	%f16,[%i6]ASI_COMMIT_S	! Block Store to 0000000030181400
!	Mem[000000001000140c] = 710000ff, %l6 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x00c]%asi,%l6	! %l6 = 00000000710000ff
!	Mem[0000000030141408] = ff000000, %l0 = 0000000000004b00
	ldstuba	[%i5+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	%l4 = ffffffec, %l5 = ffffffff, Mem[0000000010001410] = 91000000 a5e9ac63
	stda	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffec ffffffff
!	%l0 = 00000000000000ff, Mem[0000000030001408] = f7000000
	stha	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 00ff0000
!	Mem[0000000010101430] = fcf158f1, %l7 = 0000000073050000, %asi = 80
	swapa	[%i4+0x030]%asi,%l7	! %l7 = 00000000fcf158f1
	membar	#Sync			! Added by membar checker (21)
!	%l6 = 710000ff, %l7 = fcf158f1, Mem[0000000030181408] = 00000000 c2ffffff
	stda	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 710000ff fcf158f1
!	%f6  = 8900bfff dd9dc0ff, %l4 = ffffffffffffffec
!	Mem[00000000300c1420] = a5e9ac6394b18a76
	add	%i3,0x020,%g1
	stda	%f6,[%g1+%l4]ASI_PST32_SL ! Mem[00000000300c1420] = a5e9ac6394b18a76
!	Mem[0000000030181400] = 00000000, %l0 = 00000000000000ff
	swapa	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = d6000000 00000000, %l0 = 00000000, %l1 = dd9dc000
	ldd	[%i5+%o4],%l0		! %l0 = 00000000d6000000 0000000000000000

p0_label_125:
!	Mem[00000000100c1420] = ac990448ce32d083, %f28 = ff000000 00000000
	ldda	[%i3+0x020]%asi,%f28	! %f28 = ac990448 ce32d083
!	Mem[0000000010181410] = ffffffff24d7ffff, %l1 = 0000000000000000
	ldxa	[%i6+%o5]0x80,%l1	! %l1 = ffffffff24d7ffff
!	Mem[0000000030101400] = 00000000 00000000, %l0 = d6000000, %l1 = 24d7ffff
	ldda	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010001410] = ffffffffffffffec, %l1 = 0000000000000000
	ldxa	[%i0+%o5]0x88,%l1	! %l1 = ffffffffffffffec
!	Mem[0000000030001410] = 000000ff, %l1 = ffffffffffffffec
	lduwa	[%i0+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141438] = fff95f02, %l1 = 00000000000000ff
	ldsha	[%i5+0x038]%asi,%l1	! %l1 = fffffffffffffff9
!	Mem[0000000010041430] = 929010b9ffffffff, %f18 = 00000000 ffffffc2
	ldda	[%i1+0x030]%asi,%f18	! %f18 = 929010b9 ffffffff
!	Mem[00000000300c1410] = ff000071, %l4 = ffffffffffffffec
	ldsha	[%i3+%o5]0x81,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000030101408] = ff000000, %f18 = 929010b9
	lda	[%i4+%o4]0x81,%f18	! %f18 = ff000000
!	Starting 10 instruction Store Burst
!	%f28 = ac990448 ce32d083, %l5 = ffffffffffffffff
!	Mem[0000000010041438] = 00000092000000ff
	add	%i1,0x038,%g1
	stda	%f28,[%g1+%l5]ASI_PST8_P ! Mem[0000000010041438] = ac990448ce32d083

p0_label_126:
!	%l6 = 00000000710000ff, Mem[00000000211c0000] = 000085d2
	stb	%l6,[%o2+%g0]		! Mem[00000000211c0000] = ff0085d2
!	%l7 = 00000000fcf158f1, Mem[0000000030141410] = 7e3eafff
	stha	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = 7e3e58f1
!	%l1 = fffffffffffffff9, Mem[0000000030041408] = 005aeabe
	stha	%l1,[%i1+%o4]0x81	! Mem[0000000030041408] = fff9eabe
!	Mem[0000000030101410] = dd9dc0ff, %l2 = ffffffffffffffd6
	ldstuba	[%i4+%o5]0x81,%l2	! %l2 = 000000dd000000ff
!	Mem[0000000030041400] = bd7a5072, %l0 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l0	! %l0 = 00000000bd7a5072
!	%f30 = 4960bfff, Mem[0000000010001410] = ecffffff
	st	%f30,[%i0+%o5]		! Mem[0000000010001410] = 4960bfff
!	Mem[000000001010143a] = a2fb6350, %l2 = 00000000000000dd
	ldstuba	[%i4+0x03a]%asi,%l2	! %l2 = 00000063000000ff
!	Mem[00000000100c1430] = bc5a3abb, %l1 = fffffffffffffff9
	swap	[%i3+0x030],%l1		! %l1 = 00000000bc5a3abb
!	%l4 = ffffffffffffff00, Mem[0000000030081400] = beea5a42
	stba	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 00ea5a42
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = d600000000000000, %l1 = 00000000bc5a3abb
	ldxa	[%i3+0x008]%asi,%l1	! %l1 = d600000000000000

p0_label_127:
!	Mem[00000000100c1408] = 000000d6, %f12 = ffffffff
	lda	[%i3+%o4]0x88,%f12	! %f12 = 000000d6
!	Mem[0000000010181424] = 2bee0573, %l7 = 00000000fcf158f1
	lduba	[%i6+0x026]%asi,%l7	! %l7 = 0000000000000005
!	Mem[00000000211c0000] = ff0085d2, %l3 = ffffffffffffffdd
	ldsba	[%o2+0x001]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041408] = fff9eabe, %l3 = 0000000000000000
	ldsba	[%i1+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[000000001004142c] = 000000ff, %l3 = ffffffffffffffff
	lduha	[%i1+0x02e]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081408] = 000000ff, %f8  = 004de918
	lda	[%i2+%o4]0x89,%f8 	! %f8 = 000000ff
!	Mem[0000000030181400] = 050000ff000000ff, %l6 = 00000000710000ff
	ldxa	[%i6+%g0]0x89,%l6	! %l6 = 050000ff000000ff
!	Mem[00000000100c1410] = 00000000, %f4  = 00000000
	lda	[%i3+%o5]0x80,%f4 	! %f4 = 00000000
!	Mem[0000000030101400] = 00000000, %l5 = ffffffffffffffff
	lduwa	[%i4+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000005, Mem[00000000300c1408] = ffffffdd0000004b
	stxa	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000000000005

p0_label_128:
!	%l7 = 0000000000000005, Mem[0000000030141400] = ddffffff
	stha	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = ddff0005
!	Mem[00000000100c1414] = ffffff04, %l2 = 0000000000000063
	ldstuba	[%i3+0x014]%asi,%l2	! %l2 = 000000ff000000ff
!	Mem[000000001014141d] = 0000001b, %l5 = 0000000000000000
	ldstuba	[%i5+0x01d]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101400] = ff0000ff, %l1 = d600000000000000
	ldstuba	[%i4+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030101410] = ff9dc0ff, %l7 = 0000000000000005
	ldstuba	[%i4+%o5]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030141400] = 0500ffdd, %l3 = 00000000000000ff
	swapa	[%i5+%g0]0x81,%l3	! %l3 = 000000000500ffdd
!	%f16 = 00000000 ff000005 ff000000 ffffffff
!	%f20 = ffc09ddd b3660000 000000ff 18e94d00
!	%f24 = 00bf607e bd7a5072 911a540e beea5a42
!	%f28 = ac990448 ce32d083 4960bfff 025ff9ff
	stda	%f16,[%i6]ASI_BLK_AIUSL	! Block Store to 0000000030181400
!	%f14 = 8900bfff e96decff, %l4 = ffffffffffffff00
!	Mem[0000000030101420] = a77aa2170fc18655
	add	%i4,0x020,%g1
	stda	%f14,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030101420] = a77aa2170fc18655
!	%l2 = 00000000000000ff, Mem[0000000010101400] = 7effbfffff0000ff
	stxa	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000000, %l3 = 000000000500ffdd
	ldswa	[%i1+%g0]0x89,%l3	! %l3 = 0000000000000000

p0_label_129:
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000010181408] = 00000000 89000000, %l0 = bd7a5072, %l1 = 000000ff
	ldda	[%i6+%o4]0x88,%l0	! %l0 = 0000000089000000 0000000000000000
!	Mem[0000000010081408] = 004de918ff000000, %f22 = 000000ff 18e94d00
	ldd	[%i2+%o4],%f22		! %f22 = 004de918 ff000000
!	%l6 = 050000ff000000ff, immed = 00000dad, %y  = 00000000
	smul	%l6,0xdad,%l2		! %l2 = 00000000000d9f53, %y = 00000000
!	Mem[00000000211c0000] = ff0085d2, %l5 = 0000000000000000
	lduh	[%o2+%g0],%l5		! %l5 = 000000000000ff00
!	Mem[00000000201c0000] = ddff4c08, %l2 = 00000000000d9f53
	lduha	[%o0+0x000]%asi,%l2	! %l2 = 000000000000ddff
!	Mem[0000000010041408] = ff00ddb9, %l6 = 050000ff000000ff
	ldsba	[%i1+%o4]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030001400] = ffffd724 000000ff, %l0 = 89000000, %l1 = 00000000
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 00000000000000ff 00000000ffffd724
!	Mem[0000000010141410] = 5063fba2f02d883c, %f18 = ff000000 ffffffff
	ldda	[%i5+%o5]0x80,%f18	! %f18 = 5063fba2 f02d883c
!	Mem[00000000100c1410] = 04ffffff00000000, %f16 = 00000000 ff000005
	ldda	[%i3+%o5]0x88,%f16	! %f16 = 04ffffff 00000000
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ffffd724, Mem[0000000010101400] = 00000000000000ff
	stxa	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000ffffd724

p0_label_130:
!	%l1 = 00000000ffffd724, immd = fffffffffffffe6f, %l4  = ffffffffffffff00
	mulx	%l1,-0x191,%l4		! %l4 = fffffe6f0040009c
!	%l5 = 000000000000ff00, Mem[00000000100c1408] = 000000d6
	stha	%l5,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000ff00
!	Mem[0000000010001438] = 00000000, %l4 = fffffe6f0040009c
	swap	[%i0+0x038],%l4		! %l4 = 0000000000000000
!	%l1 = 00000000ffffd724, Mem[0000000010101400] = 24d7ffff
	stba	%l1,[%i4+%g0]0x80	! Mem[0000000010101400] = 24d7ffff
!	%f14 = 8900bfff e96decff, Mem[0000000030101408] = ff000000 00000014
	stda	%f14,[%i4+%o4]0x81	! Mem[0000000030101408] = 8900bfff e96decff
!	%l0 = 00000000000000ff, Mem[00000000100c140a] = 00ff0000
	stb	%l0,[%i3+0x00a]		! Mem[00000000100c1408] = 00ffff00
!	Mem[0000000030081408] = 000000ff, %l0 = 00000000000000ff
	ldstuba	[%i2+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	%f4  = 00000000 33660000, %l0 = 00000000000000ff
!	Mem[0000000010141400] = 0000000000000000
	stda	%f4,[%i5+%l0]ASI_PST8_PL ! Mem[0000000010141400] = 0000663300000000
!	%l4 = 0000000000000000, Mem[0000000030101400] = 00000000
	stha	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 000000ff, %l1 = 00000000ffffd724
	lduha	[%i5+%g0]0x81,%l1	! %l1 = 0000000000000000

p0_label_131:
!	Mem[0000000030101408] = ffbf0089, %l2 = 000000000000ddff
	ldsba	[%i4+%o4]0x89,%l2	! %l2 = ffffffffffffff89
!	Mem[0000000030101410] = ffc09dff, %l3 = 0000000000000000
	lduba	[%i4+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181400] = 050000ff, %l7 = 00000000000000ff
	ldswa	[%i6+%g0]0x81,%l7	! %l7 = 00000000050000ff
!	Mem[0000000010101428] = ffffff04c26ceff2, %l7 = 00000000050000ff
	ldxa	[%i4+0x028]%asi,%l7	! %l7 = ffffff04c26ceff2
!	Mem[0000000030041408] = 00000000beeaf9ff, %f26 = 911a540e beea5a42
	ldda	[%i1+%o4]0x89,%f26	! %f26 = 00000000 beeaf9ff
!	%l1 = 0000000000000000, %l2 = ffffffffffffff89, %l0 = 00000000000000ff
	or	%l1,%l2,%l0		! %l0 = ffffffffffffff89
!	Mem[0000000030081410] = bea1efff000000ff, %l2 = ffffffffffffff89
	ldxa	[%i2+%o5]0x89,%l2	! %l2 = bea1efff000000ff
!	Mem[0000000010141418] = df48e81400ff001b, %l4 = 0000000000000000
	ldx	[%i5+0x018],%l4		! %l4 = df48e81400ff001b
!	Mem[0000000010141410] = 5063fba2, %l5 = 000000000000ff00
	lduba	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000050
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 000000ff, %l5 = 0000000000000050
	ldstuba	[%i2+%o4]0x89,%l5	! %l5 = 000000ff000000ff

p0_label_132:
!	Mem[0000000030041410] = ffffffc2, %l3 = 00000000000000ff
	swapa	[%i1+%o5]0x89,%l3	! %l3 = 00000000ffffffc2
!	%f30 = 4960bfff 025ff9ff, Mem[0000000030181408] = ffffffff 000000ff
	stda	%f30,[%i6+%o4]0x81	! Mem[0000000030181408] = 4960bfff 025ff9ff
!	Mem[00000000300c1400] = ffffffff, %l0 = ffffffffffffff89
	ldstuba	[%i3+%g0]0x89,%l0	! %l0 = 000000ff000000ff
!	%f3  = ddffffff, Mem[0000000030101408] = ffbf0089
	sta	%f3 ,[%i4+%o4]0x89	! Mem[0000000030101408] = ddffffff
!	%l1 = 0000000000000000, Mem[0000000010181408] = 00000089
	stba	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000089
!	%l6 = ffffffff, %l7 = c26ceff2, Mem[0000000010101408] = ffffffff ffc09ddd
	stda	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffffff c26ceff2
!	Mem[0000000030101408] = ffffffdd, %l4 = df48e81400ff001b
	swapa	[%i4+%o4]0x81,%l4	! %l4 = 00000000ffffffdd
!	%f13 = ffffffff, Mem[000000001004142c] = 000000ff
	sta	%f13,[%i1+0x02c]%asi	! Mem[000000001004142c] = ffffffff
!	%l7 = ffffff04c26ceff2, Mem[00000000100c143b] = b4e1f0ff, %asi = 80
	stba	%l7,[%i3+0x03b]%asi	! Mem[00000000100c1438] = b4e1f0f2
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 8000000000000000, %l0 = 00000000000000ff
	ldxa	[%i2+%g0]0x88,%l0	! %l0 = 8000000000000000

p0_label_133:
!	Mem[0000000030041400] = d6400445 00000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i1+%g0]0x89,%l0	! %l0 = 0000000000000000 00000000d6400445
!	Mem[0000000030081400] = 00ea5a42, %l1 = 00000000d6400445
	lduwa	[%i2+%g0]0x81,%l1	! %l1 = 0000000000ea5a42
!	Mem[0000000010101404] = 00000000, %l7 = ffffff04c26ceff2
	ldsb	[%i4+0x007],%l7		! %l7 = 0000000000000000
!	Mem[0000000010141410] = 5063fba2, %l5 = 00000000000000ff
	ldswa	[%i5+%o5]0x80,%l5	! %l5 = 000000005063fba2
!	Mem[0000000030001400] = 000000ff, %l6 = ffffffffffffffff
	ldswa	[%i0+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[000000001004142c] = ffffffff, %l5 = 000000005063fba2
	ldswa	[%i1+0x02c]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010001424] = 5dffffff, %l5 = ffffffffffffffff
	ldsb	[%i0+0x026],%l5		! %l5 = ffffffffffffffff
!	Mem[00000000100c1408] = 00ffff0000000000, %l2 = bea1efff000000ff
	ldxa	[%i3+%o4]0x80,%l2	! %l2 = 00ffff0000000000
!	Mem[0000000030181410] = 000066b3, %l1 = 0000000000ea5a42
	lduwa	[%i6+%o5]0x81,%l1	! %l1 = 00000000000066b3
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 000000ff, %l2 = 00ffff0000000000
	swapa	[%i0+%g0]0x80,%l2	! %l2 = 00000000000000ff

p0_label_134:
!	%l4 = 00000000ffffffdd, Mem[0000000030081400] = 00ea5a42
	stha	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = ffdd5a42
!	%l4 = ffffffdd, %l5 = ffffffff, Mem[0000000010081408] = 18e94d00 000000ff
	stda	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffffdd ffffffff
!	Mem[0000000030141410] = 7e3e58f1, %l3 = 00000000ffffffc2
	ldstuba	[%i5+%o5]0x89,%l3	! %l3 = 000000f1000000ff
!	Mem[0000000010141420] = 2fc09ddd, %l0 = 0000000000000000, %asi = 80
	swapa	[%i5+0x020]%asi,%l0	! %l0 = 000000002fc09ddd
!	%f8  = 000000ff 94b18a76, Mem[00000000100c1400] = ff004243 271c0000
	stda	%f8 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff 94b18a76
!	%f18 = 5063fba2 f02d883c, Mem[0000000030141400] = 000000ff f6ffffff
	stda	%f18,[%i5+%g0]0x81	! Mem[0000000030141400] = 5063fba2 f02d883c
!	Mem[0000000010101428] = ffffff04c26ceff2, %l7 = 0000000000000000, %l7 = 0000000000000000
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l7,%l7	! %l7 = ffffff04c26ceff2
!	%l2 = 00000000000000ff, Mem[0000000010041410] = ff60bfff
	stwa	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000ff
!	Mem[0000000030141408] = ff000000, %l2 = 00000000000000ff
	swapa	[%i5+%o4]0x81,%l2	! %l2 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001428] = ffbf607e, %l2 = 00000000ff000000
	ldswa	[%i0+0x028]%asi,%l2	! %l2 = ffffffffffbf607e

p0_label_135:
!	Mem[0000000030081408] = ff00000000000000, %l3 = 00000000000000f1
	ldxa	[%i2+%o4]0x81,%l3	! %l3 = ff00000000000000
!	Mem[0000000010081400] = 8000000000000000, %l6 = 00000000000000ff
	ldxa	[%i2+%g0]0x88,%l6	! %l6 = 8000000000000000
!	Mem[0000000010041400] = 00000573, %l5 = ffffffffffffffff
	ldsha	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000573
!	Mem[0000000030141410] = ff583e7effbf607e, %l1 = 00000000000066b3
	ldxa	[%i5+%o5]0x81,%l1	! %l1 = ff583e7effbf607e
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000010081400] = 00000000 00000080 ddffffff ffffffff
!	Mem[0000000010081410] = 2349c7e1 4e000000 acad0ca9 c193a468
!	Mem[0000000010081420] = e139503d 8ea847d9 f8ffffff 5063fba2
!	Mem[0000000010081430] = a675a8b0 7cfb0e7c 55045c7d 6de02ca5
	ldda	[%i2]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010081400
!	Mem[0000000030141410] = 7e3e58ff, %f0  = 00000000
	lda	[%i5+%o5]0x89,%f0 	! %f0 = 7e3e58ff
!	Mem[0000000030041400] = 00000000, %l6 = 8000000000000000
	ldsba	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141408] = d6000000, %l3 = ff00000000000000
	ldswa	[%i5+0x008]%asi,%l3	! %l3 = ffffffffd6000000
!	Mem[00000000211c0000] = ff0085d2, %l5 = 0000000000000573
	lduh	[%o2+%g0],%l5		! %l5 = 000000000000ff00
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (24)
!	%l6 = 00000000, %l7 = c26ceff2, Mem[0000000010081400] = 00000000 80000000
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000 c26ceff2

p0_label_136:
!	Mem[0000000030101400] = 00000000, %l5 = 000000000000ff00
	swapa	[%i4+%g0]0x89,%l5	! %l5 = 0000000000000000
!	%f20 = 0000004e e1c74923, Mem[0000000030041408] = fff9eabe 00000000
	stda	%f20,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000004e e1c74923
!	%l1 = ff583e7effbf607e, Mem[0000000010141418] = df48e81400ff001b
	stx	%l1,[%i5+0x018]		! Mem[0000000010141418] = ff583e7effbf607e
!	Mem[0000000010041434] = ffffffff, %l7 = c26ceff2, %l4 = ffffffdd
	add	%i1,0x34,%g1
	casa	[%g1]0x80,%l7,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000030101400] = 00ff0000, %l3 = ffffffffd6000000
	swapa	[%i4+%g0]0x81,%l3	! %l3 = 0000000000ff0000
!	%f12 = 000000d6, Mem[00000000300c1400] = ffffffff
	sta	%f12,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000d6
!	%f26 = a2fb6350 fffffff8, Mem[0000000010181408] = 00000089 00000000
	stda	%f26,[%i6+%o4]0x80	! Mem[0000000010181408] = a2fb6350 fffffff8
!	%l2 = ffffffffffbf607e, %l7 = ffffff04c26ceff2, %l2 = ffffffffffbf607e
	sdivx	%l2,%l7,%l2		! %l2 = 0000000000000000
!	Mem[0000000010101438] = a2fbff500000002f, %l1 = ff583e7effbf607e, %l7 = ffffff04c26ceff2
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l1,%l7	! %l7 = a2fbff500000002f
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 24d7ffff, %l5 = 0000000000000000
	ldsha	[%i4+0x002]%asi,%l5	! %l5 = ffffffffffffffff

p0_label_137:
!	Mem[0000000030101408] = 1b00ff00, %l1 = ff583e7effbf607e
	lduwa	[%i4+%o4]0x89,%l1	! %l1 = 000000001b00ff00
!	Mem[0000000010101408] = fffffffff2ef6cc2, %l0 = 000000002fc09ddd
	ldxa	[%i4+%o4]0x80,%l0	! %l0 = fffffffff2ef6cc2
!	Mem[0000000030081408] = ff000000, %l2 = 0000000000000000
	lduha	[%i2+%o4]0x81,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010081400] = 00000000, %l4 = 00000000ffffffff
	ldswa	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1420] = ac990448, %l0 = fffffffff2ef6cc2
	lduwa	[%i3+0x020]%asi,%l0	! %l0 = 00000000ac990448
!	Mem[0000000030001408] = 00ff0000, %l7 = a2fbff500000002f
	lduha	[%i0+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001408] = ff0000002349c7e1, %l4 = 0000000000000000
	ldxa	[%i0+%o4]0x88,%l4	! %l4 = ff0000002349c7e1
!	Mem[0000000010001400] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141410] = 7e60bfff7e3e58ff, %f20 = 0000004e e1c74923
	ldda	[%i5+%o5]0x89,%f20	! %f20 = 7e60bfff 7e3e58ff
!	Starting 10 instruction Store Burst
!	%f22 = 68a493c1 a90cadac, Mem[0000000030001400] = 000000ff ffffd724
	stda	%f22,[%i0+%g0]0x89	! Mem[0000000030001400] = 68a493c1 a90cadac

p0_label_138:
!	%f16 = 80000000 00000000 ffffffff ffffffdd
!	%f20 = 7e60bfff 7e3e58ff 68a493c1 a90cadac
!	%f24 = d947a88e 3d5039e1 a2fb6350 fffffff8
!	%f28 = 7c0efb7c b0a875a6 a52ce06d 7d5c0455
	stda	%f16,[%i3]ASI_BLK_AIUSL	! Block Store to 00000000300c1400
!	%l6 = 0000000000000000, Mem[0000000010181410] = ffffffff
	stwa	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	%f2  = fffffff6 ddffffff, Mem[0000000010141410] = a2fb6350 3c882df0
	stda	%f2 ,[%i5+%o5]0x88	! Mem[0000000010141410] = fffffff6 ddffffff
!	%f11 = ff000071, %f15 = e96decff
	fsqrts	%f11,%f15		! %f15 = 7fffffff
!	Mem[000000001004143b] = ac990448, %l7 = 0000000000000000
	ldstuba	[%i1+0x03b]%asi,%l7	! %l7 = 00000048000000ff
!	%l7 = 0000000000000048, Mem[0000000030101408] = 1b00ff00
	stba	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 1b00ff48
!	%l0 = ac990448, %l1 = 1b00ff00, Mem[0000000010001420] = 00000000 5dffffff
	stda	%l0,[%i0+0x020]%asi	! Mem[0000000010001420] = ac990448 1b00ff00
!	%l1 = 000000001b00ff00, Mem[0000000010041400] = 73050000
	stwa	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 1b00ff00
!	%f15 = 7fffffff, Mem[0000000010001408] = e1c74923
	sta	%f15,[%i0+%o4]0x80	! Mem[0000000010001408] = 7fffffff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (25)
!	Mem[00000000100c1400] = 000000ff 94b18a76, %l0 = ac990448, %l1 = 1b00ff00
	ldda	[%i3+%g0]0x80,%l0	! %l0 = 00000000000000ff 0000000094b18a76

p0_label_139:
!	Mem[0000000030101410] = 00000000ffc09dff, %l5 = ffffffffffffffff
	ldxa	[%i4+%o5]0x89,%l5	! %l5 = 00000000ffc09dff
!	Mem[0000000010101424] = c70d15f3, %l6 = 0000000000000000
	ldsb	[%i4+0x025],%l6		! %l6 = 000000000000000d
!	Mem[0000000010001410] = ffbf6049, %l3 = 0000000000ff0000
	lduwa	[%i0+%o5]0x88,%l3	! %l3 = 00000000ffbf6049
!	Mem[0000000030081400] = ffdd5a42 b01cb197, %l4 = 2349c7e1, %l5 = ffc09dff
	ldda	[%i2+%g0]0x81,%l4	! %l4 = 00000000ffdd5a42 00000000b01cb197
!	Mem[0000000010041438] = ac9904ff, %l1 = 0000000094b18a76
	lduha	[%i1+0x038]%asi,%l1	! %l1 = 000000000000ac99
!	Mem[0000000010141408] = d600000000000000, %f2  = fffffff6 ddffffff
	ldda	[%i5+%o4]0x80,%f2 	! %f2  = d6000000 00000000
!	Mem[0000000010041408] = b9dd00ff, %l4 = 00000000ffdd5a42
	ldswa	[%i1+%o4]0x88,%l4	! %l4 = ffffffffb9dd00ff
!	Mem[0000000010181410] = 00000000, %l1 = 000000000000ac99
	ldswa	[%i6+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000218000c0] = 6fd44ce8, %l0 = 00000000000000ff
	lduha	[%o3+0x0c0]%asi,%l0	! %l0 = 0000000000006fd4
!	Starting 10 instruction Store Burst
!	Mem[0000000021800141] = f60105d8, %l0 = 0000000000006fd4
	ldstub	[%o3+0x141],%l0		! %l0 = 00000001000000ff

p0_label_140:
!	%l3 = 00000000ffbf6049, Mem[00000000211c0000] = ff0085d2, %asi = 80
	stha	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = 604985d2
!	%l1 = 0000000000000000, Mem[0000000030001400] = acad0ca9
	stwa	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	Mem[0000000030001408] = 00ff0000, %l4 = ffffffffb9dd00ff
	ldstuba	[%i0+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	%f13 = ffffffff, %f23 = a90cadac, %f26 = a2fb6350
	fsubs	%f13,%f23,%f26		! %f26 = ffffffff
!	%l7 = 0000000000000048, Mem[0000000010181408] = 5063fba2
	stwa	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000048
!	%f28 = 7c0efb7c b0a875a6, Mem[0000000030081400] = 425addff 97b11cb0
	stda	%f28,[%i2+%g0]0x89	! Mem[0000000030081400] = 7c0efb7c b0a875a6
!	Mem[0000000020800040] = ff1dc1d1, %l0 = 0000000000000001
	ldsb	[%o1+0x040],%l0		! %l0 = ffffffffffffffff
!	%l2 = 000000000000ff00, Mem[0000000010041414] = 36c0c225
	stw	%l2,[%i1+0x014]		! Mem[0000000010041414] = 0000ff00
!	Mem[0000000030141400] = a2fb6350, %l4 = 0000000000000000
	ldsha	[%i5+%g0]0x89,%l4	! %l4 = 0000000000006350
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 000000d6, %l3 = 00000000ffbf6049
	ldswa	[%i5+%o4]0x88,%l3	! %l3 = 00000000000000d6

p0_label_141:
!	Mem[0000000030101408] = ffec6de91b00ff48, %f14 = 8900bfff 7fffffff
	ldda	[%i4+%o4]0x89,%f14	! %f14 = ffec6de9 1b00ff48
!	Mem[0000000030141400] = 3c882df0 a2fb6350, %l4 = 00006350, %l5 = b01cb197
	ldda	[%i5+%g0]0x89,%l4	! %l4 = 00000000a2fb6350 000000003c882df0
!	Mem[0000000010181408] = f8ffffff00000048, %f24 = d947a88e 3d5039e1
	ldda	[%i6+%o4]0x88,%f24	! %f24 = f8ffffff 00000048
!	Mem[0000000010001400] = 00000000, %l3 = 00000000000000d6
	lduwa	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1408] = 00ffff00, %f29 = b0a875a6
	lda	[%i3+%o4]0x88,%f29	! %f29 = 00ffff00
!	Mem[0000000030041410] = ff000000, %l7 = 0000000000000048
	lduwa	[%i1+%o5]0x81,%l7	! %l7 = 00000000ff000000
!	Mem[0000000010001410] = ffbf6049, %l6 = 000000000000000d
	lduba	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000049
!	Mem[0000000010041400] = 1b00ff00, %l4 = 00000000a2fb6350
	ldswa	[%i1+0x000]%asi,%l4	! %l4 = 000000001b00ff00
!	Mem[0000000020800000] = ffffba64, %l4 = 000000001b00ff00
	ldsba	[%o1+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010081410] = 0000004ee1c74923
	stxa	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000000000000000

p0_label_142:
!	Mem[0000000010041404] = 00000000, %l2 = 000000000000ff00
	swap	[%i1+0x004],%l2		! %l2 = 0000000000000000
!	Mem[00000000211c0001] = 604985d2, %l1 = 0000000000000000
	ldstub	[%o2+0x001],%l1		! %l1 = 00000049000000ff
!	Mem[0000000030041408] = 0000004e, %l2 = 0000000000000000
	swapa	[%i1+%o4]0x81,%l2	! %l2 = 000000000000004e
!	Mem[0000000030181408] = 4960bfff, %l0 = ffffffffffffffff
	swapa	[%i6+%o4]0x81,%l0	! %l0 = 000000004960bfff
!	%l6 = 0000000000000049, Mem[0000000030141410] = 7e60bfff7e3e58ff
	stxa	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000000000049
!	%l0 = 000000004960bfff, Mem[0000000030081410] = ff000000
	stba	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = ff000000
!	%l6 = 0000000000000049, Mem[0000000010101410] = 00bf607e
	stha	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 0049607e
!	Mem[0000000030041400] = 00000000, %l4 = ffffffffffffffff
	swapa	[%i1+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, %l5 = 000000003c882df0, %l7 = 00000000ff000000
	add	%l4,%l5,%l7		! %l7 = 000000003c882df0
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ffef4a3c7e604900, %l4 = 0000000000000000
	ldxa	[%i4+%o5]0x88,%l4	! %l4 = ffef4a3c7e604900

p0_label_143:
!	Mem[0000000030001410] = ff000000, %l7 = 000000003c882df0
	lduha	[%i0+%o5]0x81,%l7	! %l7 = 000000000000ff00
!	Mem[00000000100c143c] = 6705d656, %l0 = 000000004960bfff
	lduba	[%i3+0x03f]%asi,%l0	! %l0 = 0000000000000056
!	Mem[0000000010001400] = 00000000, %l7 = 000000000000ff00
	ldub	[%i0+0x002],%l7		! %l7 = 0000000000000000
!	%f23 = a90cadac, %f9  = 94b18a76, %f7  = dd9dc0ff
	fsubs	%f23,%f9 ,%f7 		! %f7  = a90cadac
!	Mem[00000000211c0000] = 60ff85d2, %l6 = 0000000000000049
	ldsha	[%o2+0x000]%asi,%l6	! %l6 = 00000000000060ff
!	Mem[0000000010141400] = 00006633, %l2 = 000000000000004e
	lduha	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l4 = ffef4a3c7e604900
	lduwa	[%i2+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1414] = ffffff04, %l2 = 0000000000000000
	ldswa	[%i3+0x014]%asi,%l2	! %l2 = ffffffffffffff04
!	Mem[0000000010001400] = 00000000, %l0 = 0000000000000056
	lduwa	[%i0+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010081410] = 00000000
	stha	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000

p0_label_144:
!	Mem[0000000030081400] = b0a875a6, %l0 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l0	! %l0 = 00000000b0a875a6
!	Mem[000000001018142c] = 00005dfd, %l3 = 00000000, %l0 = b0a875a6
	add	%i6,0x2c,%g1
	casa	[%g1]0x80,%l3,%l0	! %l0 = 0000000000005dfd
!	%l4 = 0000000000000000, Mem[0000000010181400] = b3660000
	stha	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = b3660000
!	Mem[0000000010001400] = 00000000, %l7 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%l0 = 00005dfd, %l1 = 00000049, Mem[0000000010181410] = 00000000 ffffd724
	stda	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 00005dfd 00000049
!	%f16 = 80000000 00000000, Mem[00000000100c1410] = 00000000 04ffffff
	stda	%f16,[%i3+%o5]0x88	! Mem[00000000100c1410] = 80000000 00000000
!	Mem[0000000010141410] = ffffffdd, %l5 = 000000003c882df0
	ldstuba	[%i5+%o5]0x80,%l5	! %l5 = 000000ff000000ff
!	%l6 = 00000000000060ff, immed = 00000dc8, %y  = 00000000
	smul	%l6,0xdc8,%l7		! %l7 = 000000000538ba38, %y = 00000000
!	Starting 10 instruction Load Burst
!	%f25 = 00000048, %f2  = d6000000, %f2  = d6000000 00000000
	fsmuld	%f25,%f2 ,%f2 		! %l0 = 0000000000005e1f, Unfinished, %fsr = 3900000400

p0_label_145:
!	Mem[0000000030041408] = 00000000, %l1 = 0000000000000049
	lduha	[%i1+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = ffffffff, %l7 = 000000000538ba38
	lduba	[%i6+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%l0 = 0000000000005e1f, imm = 0000000000000dde, %l5 = 00000000000000ff
	subc	%l0,0xdde,%l5		! %l5 = 0000000000005041
!	Mem[0000000010001408] = ff000000ffffff7f, %l2 = ffffffffffffff04
	ldxa	[%i0+%o4]0x88,%l2	! %l2 = ff000000ffffff7f
!	Mem[0000000010001428] = ffbf607e, %l0 = 0000000000005e1f
	lduw	[%i0+0x028],%l0		! %l0 = 00000000ffbf607e
!	Mem[0000000010041400] = 1b00ff00, %l5 = 0000000000005041
	lduha	[%i1+%g0]0x80,%l5	! %l5 = 0000000000001b00
!	Mem[0000000021800140] = f6ff05d8, %l7 = 00000000000000ff
	lduha	[%o3+0x140]%asi,%l7	! %l7 = 000000000000f6ff
!	Mem[0000000030081408] = ff000000, %l1 = 0000000000000000
	lduba	[%i2+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1408] = ffffffdd, %l0 = 00000000ffbf607e
	lduwa	[%i3+%o4]0x89,%l0	! %l0 = 00000000ffffffdd
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 00ffff00, %l1 = 00000000000000ff
	ldstuba	[%i3+%o4]0x88,%l1	! %l1 = 00000000000000ff

p0_label_146:
!	Mem[0000000010181410] = fd5d0000, %l0 = 00000000ffffffdd
	swapa	[%i6+%o5]0x80,%l0	! %l0 = 00000000fd5d0000
!	Mem[0000000010041408] = ff00ddb9, %l2 = ff000000ffffff7f
	ldstuba	[%i1+%o4]0x80,%l2	! %l2 = 000000ff000000ff
!	%f14 = ffec6de9, Mem[0000000010141410] = ffffffdd
	sta	%f14,[%i5+%o5]0x80	! Mem[0000000010141410] = ffec6de9
!	Mem[00000000100c142c] = a5e9ac63, %l2 = 00000000000000ff, %asi = 80
	swapa	[%i3+0x02c]%asi,%l2	! %l2 = 00000000a5e9ac63
!	%l7 = 000000000000f6ff, Mem[0000000030141410] = 0000000000000049
	stxa	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000000000f6ff
!	%f30 = a52ce06d 7d5c0455, %l5 = 0000000000001b00
!	Mem[0000000030101438] = 76e1320a7827e7ec
	add	%i4,0x038,%g1
	stda	%f30,[%g1+%l5]ASI_PST8_S ! Mem[0000000030101438] = 76e1320a7827e7ec
!	Mem[0000000030181408] = ffffffff, %l5 = 0000000000001b00
	swapa	[%i6+%o4]0x89,%l5	! %l5 = 00000000ffffffff
!	%l2 = 00000000a5e9ac63, Mem[0000000030101400] = 000000d6
	stha	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000ac63
!	%l5 = 00000000ffffffff, Mem[00000000201c0000] = ddff4c08
	sth	%l5,[%o0+%g0]		! Mem[00000000201c0000] = ffff4c08
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000000, %l0 = 00000000fd5d0000
	lduwa	[%i2+%g0]0x81,%l0	! %l0 = 0000000000000000

p0_label_147:
!	Mem[0000000030101410] = ff9dc0ff, %l2 = 00000000a5e9ac63
	lduba	[%i4+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041408] = 00000000, %l5 = 00000000ffffffff
	ldsba	[%i1+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041410] = 000000ff, %l3 = 0000000000000000
	ldsba	[%i1+0x012]%asi,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = 60ff85d2, %l6 = 00000000000060ff
	lduba	[%o2+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141408] = 00000000 000000d6, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i5+%o4]0x88,%l2	! %l2 = 00000000000000d6 0000000000000000
!	Mem[00000000100c1400] = 000000ff, %l7 = 000000000000f6ff
	lduha	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000201c0000] = ffff4c08, %l6 = 00000000000000ff
	ldsb	[%o0+%g0],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000010101410] = 0049607e, %l2 = 00000000000000d6
	lduha	[%i4+%o5]0x80,%l2	! %l2 = 0000000000000049
!	Mem[0000000030181410] = b3660000, %f15 = 1b00ff48
	lda	[%i6+%o5]0x89,%f15	! %f15 = b3660000
!	Starting 10 instruction Store Burst
!	%l6 = ffffffff, %l7 = 00000000, Mem[0000000030101408] = 1b00ff48 ffec6de9
	stda	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = ffffffff 00000000

p0_label_148:
!	%f28 = 7c0efb7c 00ffff00, Mem[0000000030181400] = 050000ff 00000000
	stda	%f28,[%i6+%g0]0x81	! Mem[0000000030181400] = 7c0efb7c 00ffff00
!	%f6  = 8900bfff a90cadac, %l6 = ffffffffffffffff
!	Mem[0000000030041410] = ff0000000f31424a
	add	%i1,0x010,%g1
	stda	%f6,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030041410] = acad0ca9ffbf0089
!	Mem[0000000010001400] = 00000000, %l1 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%l7 = 0000000000000000, Mem[00000000100c1400] = 000000ff
	stha	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff
!	Mem[0000000030141400] = a2fb6350, %l5 = 0000000000000000
	lduba	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000050
!	%l6 = ffffffffffffffff, Mem[0000000030181410] = b3660000
	stwa	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = ffffffff
!	Mem[0000000010101410] = 0049607e, %l4 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%f24 = f8ffffff 00000048, Mem[0000000010181418] = 7e60bfff 36c0c225
	stda	%f24,[%i6+0x018]%asi	! Mem[0000000010181418] = f8ffffff 00000048
!	%l7 = 0000000000000000, Mem[0000000030001410] = ff000000
	stha	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000, %l3 = 0000000000000000
	lduba	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000

p0_label_149:
!	Mem[0000000010001408] = ffffff7f, %l6 = ffffffffffffffff
	ldsba	[%i0+%o4]0x88,%l6	! %l6 = 000000000000007f
!	Code Fragment 4
p0_fragment_9:
!	%l0 = 0000000000000000
	setx	0xa6f70d7fc56363e7,%g7,%l0 ! %l0 = a6f70d7fc56363e7
!	%l1 = 0000000000000000
	setx	0xa090525fbde35823,%g7,%l1 ! %l1 = a090525fbde35823
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = a6f70d7fc56363e7
	setx	0x980642ffe1e35bc5,%g7,%l0 ! %l0 = 980642ffe1e35bc5
!	%l1 = a090525fbde35823
	setx	0x8c4a5eefac87ff56,%g7,%l1 ! %l1 = 8c4a5eefac87ff56
!	Mem[0000000010001410] = ffbf6049, %l3 = 0000000000000000
	ldswa	[%i0+%o5]0x88,%l3	! %l3 = ffffffffffbf6049
!	Mem[000000001000143c] = ff000099, %l3 = ffffffffffbf6049
	ldsba	[%i0+0x03d]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001408] = 0000ffff, %l0 = 980642ffe1e35bc5
	lduba	[%i0+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000211c0000] = 60ff85d2, %l0 = 00000000000000ff
	ldsb	[%o2+0x001],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010181410] = ddffffff, %f25 = 00000048
	lda	[%i6+%o5]0x88,%f25	! %f25 = ddffffff
!	Mem[0000000010181408] = 48000000, %l4 = 0000000000000000
	ldswa	[%i6+%o4]0x80,%l4	! %l4 = 0000000048000000
!	%f22 = 68a493c1, %f3  = 00000000, %f14 = ffec6de9
	fdivs	%f22,%f3 ,%f14		! %f14 = 7f800000
!	Starting 10 instruction Store Burst
!	%f13 = ffffffff, Mem[0000000030041400] = ffffffff
	sta	%f13,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffffff

p0_label_150:
!	%l6 = 000000000000007f, Mem[0000000010081400] = 00000000f2ef6cc2
	stxa	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000000000007f
!	%l0 = ffffffffffffffff, Mem[0000000030141408] = 000000ff
	stha	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = ffff00ff
!	%l2 = 0000000000000049, Mem[0000000030141410] = fff6000000000000
	stxa	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000000000000049
!	%f6  = 8900bfff a90cadac, Mem[0000000030081408] = ff000000 00000000
	stda	%f6 ,[%i2+%o4]0x81	! Mem[0000000030081408] = 8900bfff a90cadac
!	%f16 = 80000000 00000000 ffffffff ffffffdd
!	%f20 = 7e60bfff 7e3e58ff 68a493c1 a90cadac
!	%f24 = f8ffffff ddffffff ffffffff fffffff8
!	%f28 = 7c0efb7c 00ffff00 a52ce06d 7d5c0455
	stda	%f16,[%i1]ASI_BLK_AIUP	! Block Store to 0000000010041400
!	%l6 = 000000000000007f, Mem[0000000030001408] = 0000ffff
	stba	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000ff7f
!	Mem[0000000030001400] = 00000000, %l0 = ffffffffffffffff
	ldswa	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = ffffff7f, %l1 = 8c4a5eefac87ff56
	swapa	[%i0+%o4]0x88,%l1	! %l1 = 00000000ffffff7f
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000010041410] = 7e60bfff, %l0 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l0	! %l0 = 000000007e60bfff
!	Starting 10 instruction Load Burst
!	%f21 = 7e3e58ff, %f17 = 00000000
	fcmpes	%fcc0,%f21,%f17		! %fcc0 = 2

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	and	%l0,0xfba,%l6
	fdivs	%f8,%f1,%f19
	nop
	fmuls	%f26,%f15,%f7
	std	%l2,[%i6+0x008]
	smul	%l5,0x705,%l3
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 000000007e60bfff
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 00000000ffffff7f
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000049
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000048000000
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000000000050
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 000000000000007f
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check Floating Point Registers

p0_check_fp_registers:
	set	p0_expected_fp_regs,%g3
	std	%f0,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x00],%l0
	cmp	%l0,%l1			! %f0  should be 7e3e58ff 000000ff
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be d6000000 00000000
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00000000 33660000
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 8900bfff a90cadac
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 000000ff 94b18a76
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000573 ff000071
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 000000d6 ffffffff
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 7f800000 b3660000
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 80000000 00000000
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be ffffffff ffffffdd
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 7e60bfff 7e3e58ff
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 68a493c1 a90cadac
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be f8ffffff ddffffff
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be ffffffff fffffff8
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 7c0efb7c 00ffff00
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be a52ce06d 7d5c0455
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
	subc	%l3,%l1,%l4
	fdivs	%f8 ,%f12,%f1 
	and	%l1,%l6,%l1
	xnor	%l5,0xe4c,%l7
	orn	%l1,%l0,%l6
	done

p0_trap1o:
	subc	%l3,%l1,%l4
	fdivs	%f8 ,%f12,%f1 
	and	%l1,%l6,%l1
	xnor	%l5,0xe4c,%l7
	orn	%l1,%l0,%l6
	done


p0_trap2e:
	fmuls	%f8 ,%f13,%f1 
	fcmps	%fcc2,%f13,%f10
	fsubs	%f7 ,%f3 ,%f4 
	fdivs	%f2 ,%f12,%f7 
	fcmps	%fcc2,%f11,%f13
	done

p0_trap2o:
	fmuls	%f8 ,%f13,%f1 
	fcmps	%fcc2,%f13,%f10
	fsubs	%f7 ,%f3 ,%f4 
	fdivs	%f2 ,%f12,%f7 
	fcmps	%fcc2,%f11,%f13
	done


p0_trap3e:
	xor	%l5,0x4f9,%l1
	done

p0_trap3o:
	xor	%l5,0x4f9,%l1
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
	ldx	[%g1+0x000],%l0		! %l0 = 21aef1b6627715a4
	ldx	[%g1+0x008],%l1		! %l1 = 6cc5281648442129
	ldx	[%g1+0x010],%l2		! %l2 = 6b54aaa27f00f608
	ldx	[%g1+0x018],%l3		! %l3 = f49b5d786d7fe83c
	ldx	[%g1+0x020],%l4		! %l4 = 38816709f5682bd5
	ldx	[%g1+0x028],%l5		! %l5 = 38ba49a063f17a31
	ldx	[%g1+0x030],%l6		! %l6 = 6eac650be68f7d13
	ldx	[%g1+0x038],%l7		! %l7 = fb5bda39cee10e4c

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
	subc	%l3,%l1,%l4
	fdivs	%f8 ,%f12,%f1 
	fsubs	%f8 ,%f11,%f15
	jmpl	%o7,%g0
	fitod	%f13,%f12
p0_near_0_he:
	ldstub	[%o2+0x000],%l6		! Mem[00000000211c0000]
	xor	%l1,-0xcab,%l3
	umul	%l1,-0xaa6,%l0
	jmpl	%o7,%g0
	xor	%l5,%l5,%l3
near0_b2b_h:
	add	%l5,%l1,%l5
	fmuls	%f25,%f23,%f23
	xor	%l0,%l2,%l1
	andn	%l1,%l7,%l2
	mulx	%l7,%l5,%l2
	mulx	%l0,0x590,%l2
	jmpl	%o7,%g0
	fsqrts	%f27,%f16
near0_b2b_l:
	and	%l7,%l3,%l0
	udivx	%l6,%l5,%l5
	xor	%l2,%l3,%l5
	xnor	%l2,%l5,%l5
	smul	%l4,0x22a,%l0
	sub	%l1,%l3,%l6
	jmpl	%o7,%g0
	xnor	%l0,%l0,%l4
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	xor	%l3,%l4,%l3
	subc	%l4,0xafe,%l2
	smul	%l6,%l6,%l4
	jmpl	%o7,%g0
	sub	%l7,-0x69e,%l2
p0_near_1_he:
	udivx	%l6,-0x70e,%l7
	fmuls	%f21,%f31,%f18
	ldub	[%i2+0x00f],%l2		! Mem[000000001008140f]
	ldsw	[%i0+0x010],%l0		! Mem[0000000010001410]
	nop
	fcmps	%fcc2,%f31,%f26
	fcmps	%fcc3,%f25,%f19
	jmpl	%o7,%g0
	sdivx	%l4,%l6,%l5
near1_b2b_h:
	fdivs	%f18,%f23,%f27
	jmpl	%o7,%g0
	xnor	%l3,-0xda7,%l3
near1_b2b_l:
	or	%l6,%l7,%l4
	jmpl	%o7,%g0
	fcmps	%fcc0,%f12,%f12
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	xor	%l0,%l4,%l6
	udivx	%l0,-0xa0f,%l6
	udivx	%l0,%l6,%l2
	smul	%l0,-0x968,%l0
	addc	%l0,0x145,%l2
	fdivs	%f8 ,%f6 ,%f10
	add	%l6,%l3,%l3
	jmpl	%o7,%g0
	or	%l5,%l6,%l4
p0_near_2_he:
	subc	%l3,%l6,%l0
	fmuls	%f24,%f17,%f21
	jmpl	%o7,%g0
	fsubs	%f17,%f30,%f27
near2_b2b_h:
	subc	%l3,-0x924,%l2
	jmpl	%o7,%g0
	add	%l2,-0xaa1,%l4
near2_b2b_l:
	orn	%l7,%l4,%l7
	jmpl	%o7,%g0
	orn	%l1,0x4b2,%l7
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	smul	%l5,0x602,%l4
	fsqrts	%f13,%f3 
	smul	%l0,%l6,%l0
	smul	%l6,0x882,%l7
	jmpl	%o7,%g0
	orn	%l6,0xaf9,%l5
p0_near_3_he:
	ldub	[%i2+0x021],%l4		! Mem[0000000010081421]
	mulx	%l7,-0x6c4,%l5
	fsubs	%f29,%f25,%f16
	sdivx	%l6,%l4,%l0
	jmpl	%o7,%g0
	sub	%l2,0xbf6,%l5
near3_b2b_h:
	udivx	%l2,%l5,%l5
	fcmps	%fcc1,%f21,%f29
	sdivx	%l2,-0x308,%l1
	xor	%l1,%l5,%l2
	addc	%l7,-0x5a8,%l5
	jmpl	%o7,%g0
	add	%l5,-0xd7b,%l3
near3_b2b_l:
	fcmps	%fcc1,%f5 ,%f12
	or	%l5,%l3,%l7
	addc	%l2,0x24c,%l5
	fdivs	%f2 ,%f12,%f9 
	fdivs	%f6 ,%f15,%f0 
	jmpl	%o7,%g0
	mulx	%l7,0x01d,%l5
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	mulx	%l6,%l5,%l7
	jmpl	%o7,%g0
	smul	%l3,%l7,%l2
p0_far_0_lem:
	mulx	%l6,%l5,%l7
	jmpl	%o7,%g0
	smul	%l3,%l7,%l2
p0_far_0_he:
	mulx	%l3,0x257,%l7
	fmuls	%f18,%f20,%f17
	ldd	[%i0+0x028],%l6		! Mem[0000000010001428]
	andn	%l5,%l4,%l5
	mulx	%l7,-0x9fc,%l1
	subc	%l7,-0xc41,%l3
	fdivs	%f31,%f17,%f20
	jmpl	%o7,%g0
	xor	%l0,-0x797,%l4
p0_far_0_hem:
	mulx	%l3,0x257,%l7
	fmuls	%f18,%f20,%f17
	membar	#Sync
	ldd	[%i0+0x028],%l6		! Mem[0000000010001428]
	andn	%l5,%l4,%l5
	mulx	%l7,-0x9fc,%l1
	subc	%l7,-0xc41,%l3
	fdivs	%f31,%f17,%f20
	jmpl	%o7,%g0
	xor	%l0,-0x797,%l4
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	fcmps	%fcc2,%f20,%f29
	xnor	%l0,%l1,%l6
	fcmps	%fcc1,%f17,%f22
	fadds	%f24,%f26,%f23
	sdivx	%l6,%l1,%l7
	jmpl	%o7,%g0
	andn	%l6,-0xdb5,%l7
far0_b2b_l:
	subc	%l4,%l5,%l5
	xor	%l5,%l4,%l2
	fdivs	%f2 ,%f13,%f14
	umul	%l6,%l6,%l3
	umul	%l5,%l5,%l0
	jmpl	%o7,%g0
	andn	%l5,%l3,%l4
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	udivx	%l2,%l2,%l1
	jmpl	%o7,%g0
	smul	%l6,-0xd43,%l4
p0_far_1_lem:
	udivx	%l2,%l2,%l1
	jmpl	%o7,%g0
	smul	%l6,-0xd43,%l4
p0_far_1_he:
	udivx	%l4,%l3,%l3
	andn	%l3,%l4,%l3
	jmpl	%o7,%g0
	fcmps	%fcc3,%f21,%f19
p0_far_1_hem:
	udivx	%l4,%l3,%l3
	andn	%l3,%l4,%l3
	jmpl	%o7,%g0
	fcmps	%fcc3,%f21,%f19
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	sub	%l0,-0x17c,%l3
	fadds	%f29,%f16,%f19
	fsubs	%f24,%f26,%f27
	orn	%l5,0xcb6,%l3
	jmpl	%o7,%g0
	or	%l7,0x837,%l7
far1_b2b_l:
	fcmps	%fcc3,%f0 ,%f15
	addc	%l4,-0x65c,%l1
	fsqrts	%f7 ,%f14
	smul	%l5,%l7,%l4
	jmpl	%o7,%g0
	fcmps	%fcc3,%f11,%f4 
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	fitod	%f1 ,%f4 
	sub	%l2,%l3,%l2
	fdivs	%f0 ,%f10,%f5 
	fdivs	%f1 ,%f3 ,%f11
	subc	%l7,%l6,%l5
	fdivs	%f14,%f12,%f6 
	xor	%l3,0xfbf,%l7
	jmpl	%o7,%g0
	addc	%l2,%l4,%l4
p0_far_2_lem:
	fitod	%f1 ,%f4 
	sub	%l2,%l3,%l2
	fdivs	%f0 ,%f10,%f5 
	fdivs	%f1 ,%f3 ,%f11
	subc	%l7,%l6,%l5
	fdivs	%f14,%f12,%f6 
	xor	%l3,0xfbf,%l7
	jmpl	%o7,%g0
	addc	%l2,%l4,%l4
p0_far_2_he:
	fmuls	%f22,%f23,%f17
	fsubs	%f30,%f29,%f22
	addc	%l0,%l6,%l4
	jmpl	%o7,%g0
	sub	%l0,%l0,%l6
p0_far_2_hem:
	fmuls	%f22,%f23,%f17
	fsubs	%f30,%f29,%f22
	addc	%l0,%l6,%l4
	jmpl	%o7,%g0
	sub	%l0,%l0,%l6
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	fdivs	%f17,%f19,%f19
	and	%l4,%l4,%l0
	mulx	%l3,-0xafc,%l7
	xnor	%l0,%l5,%l4
	jmpl	%o7,%g0
	udivx	%l2,-0x6ac,%l5
far2_b2b_l:
	fadds	%f1 ,%f5 ,%f7 
	mulx	%l5,-0x2b1,%l6
	sdivx	%l0,-0x868,%l3
	or	%l0,%l5,%l1
	jmpl	%o7,%g0
	andn	%l3,%l2,%l4
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	orn	%l3,%l7,%l5
	fsubs	%f3 ,%f7 ,%f9 
	st	%f2 ,[%i1+0x008]	! Mem[0000000010041408]
	andn	%l3,0x2fd,%l2
	fsqrts	%f0 ,%f3 
	addc	%l5,%l5,%l2
	subc	%l0,%l6,%l3
	jmpl	%o7,%g0
	and	%l4,%l7,%l2
p0_far_3_lem:
	orn	%l3,%l7,%l5
	fsubs	%f3 ,%f7 ,%f9 
	membar	#Sync
	st	%f2 ,[%i1+0x008]	! Mem[0000000010041408]
	andn	%l3,0x2fd,%l2
	fsqrts	%f0 ,%f3 
	addc	%l5,%l5,%l2
	subc	%l0,%l6,%l3
	jmpl	%o7,%g0
	and	%l4,%l7,%l2
p0_far_3_he:
	mulx	%l1,%l2,%l1
	sdivx	%l0,%l7,%l7
	andn	%l1,%l1,%l1
	or	%l2,-0xdd3,%l2
	fmuls	%f28,%f16,%f26
	sub	%l7,%l2,%l7
	fcmps	%fcc0,%f16,%f28
	jmpl	%o7,%g0
	xnor	%l5,-0x0f7,%l6
p0_far_3_hem:
	mulx	%l1,%l2,%l1
	sdivx	%l0,%l7,%l7
	andn	%l1,%l1,%l1
	or	%l2,-0xdd3,%l2
	fmuls	%f28,%f16,%f26
	sub	%l7,%l2,%l7
	fcmps	%fcc0,%f16,%f28
	jmpl	%o7,%g0
	xnor	%l5,-0x0f7,%l6
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	mulx	%l2,%l3,%l5
	smul	%l7,-0x994,%l2
	fsubs	%f21,%f23,%f22
	add	%l6,%l0,%l7
	fcmps	%fcc2,%f20,%f31
	fcmps	%fcc0,%f20,%f21
	add	%l2,-0xde2,%l3
	jmpl	%o7,%g0
	smul	%l4,0x6b0,%l1
far3_b2b_l:
	subc	%l3,%l7,%l4
	andn	%l7,%l0,%l3
	sub	%l5,-0x1c8,%l3
	sdivx	%l3,%l3,%l6
	fadds	%f0 ,%f11,%f10
	and	%l6,-0x043,%l5
	mulx	%l3,-0x351,%l6
	jmpl	%o7,%g0
	mulx	%l5,%l6,%l3
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	fmuls	%f11,%f12,%f9 
	orn	%l5,%l2,%l6
	fsubs	%f1 ,%f13,%f7 
	jmpl	%g6+8,%g0
	udivx	%l7,0x7a9,%l2
p0_call_0_le:
	fadds	%f15,%f13,%f3 
	umul	%l4,%l4,%l4
	and	%l6,0x594,%l3
	retl
	sdivx	%l7,%l5,%l3
p0_jmpl_0_lo:
	fmuls	%f11,%f12,%f9 
	orn	%l5,%l2,%l6
	fsubs	%f1 ,%f13,%f7 
	jmpl	%g6+8,%g0
	udivx	%l7,0x7a9,%l2
p0_call_0_lo:
	fadds	%f15,%f13,%f3 
	umul	%l4,%l4,%l4
	and	%l6,0x594,%l3
	retl
	sdivx	%l7,%l5,%l3
p0_jmpl_0_he:
	fcmps	%fcc1,%f25,%f17
	jmpl	%g6+8,%g0
	fsubs	%f23,%f25,%f28
p0_call_0_he:
	addc	%l1,-0x173,%l5
	or	%l1,0xc7f,%l0
	fsqrts	%f20,%f25
	fsubs	%f24,%f25,%f19
	retl
	udivx	%l0,0xbe9,%l0
p0_jmpl_0_ho:
	fcmps	%fcc1,%f25,%f17
	jmpl	%g6+8,%g0
	fsubs	%f23,%f25,%f28
p0_call_0_ho:
	addc	%l1,-0x173,%l5
	or	%l1,0xc7f,%l0
	fsqrts	%f20,%f25
	fsubs	%f24,%f25,%f19
	retl
	udivx	%l0,0xbe9,%l0
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	jmpl	%g6+8,%g0
	addc	%l0,-0xbb8,%l1
p0_call_1_le:
	xnor	%l6,-0xaf7,%l1
	addc	%l6,%l3,%l3
	umul	%l5,%l7,%l0
	fsubs	%f11,%f15,%f2 
	smul	%l7,%l4,%l3
	or	%l7,-0x3de,%l1
	retl
	mulx	%l6,-0xca2,%l1
p0_jmpl_1_lo:
	jmpl	%g6+8,%g0
	addc	%l0,-0xbb8,%l1
p0_call_1_lo:
	xnor	%l6,-0xaf7,%l1
	addc	%l6,%l3,%l3
	umul	%l5,%l7,%l0
	fsubs	%f11,%f15,%f2 
	smul	%l7,%l4,%l3
	or	%l7,-0x3de,%l1
	retl
	mulx	%l6,-0xca2,%l1
p0_jmpl_1_he:
	or	%l7,%l4,%l5
	add	%l3,%l1,%l3
	or	%l1,%l1,%l5
	swap	[%i6+0x00c],%l5		! Mem[000000001018140c]
	jmpl	%g6+8,%g0
	addc	%l7,%l3,%l4
p0_call_1_he:
	mulx	%l1,%l2,%l7
	fcmps	%fcc3,%f28,%f29
	mulx	%l1,%l3,%l4
	andn	%l6,-0x1a3,%l6
	xnor	%l3,-0x5e6,%l0
	retl
	addc	%l5,-0xc02,%l6
p0_jmpl_1_ho:
	or	%l7,%l4,%l5
	add	%l3,%l1,%l3
	or	%l1,%l1,%l5
	swap	[%o6+0x00c],%l5		! Mem[000000001018140c]
	jmpl	%g6+8,%g0
	addc	%l7,%l3,%l4
p0_call_1_ho:
	mulx	%l1,%l2,%l7
	fcmps	%fcc3,%f28,%f29
	mulx	%l1,%l3,%l4
	andn	%l6,-0x1a3,%l6
	xnor	%l3,-0x5e6,%l0
	retl
	addc	%l5,-0xc02,%l6
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	ldub	[%i2+0x02d],%l1		! Mem[000000001008142d]
	sdivx	%l6,0x023,%l3
	fadds	%f8 ,%f5 ,%f9 
	fstoi	%f11,%f0 
	jmpl	%g6+8,%g0
	xnor	%l2,-0xe85,%l0
p0_call_2_le:
	fdivs	%f1 ,%f12,%f1 
	andn	%l7,%l3,%l0
	add	%l4,0xd50,%l5
	retl
	add	%l6,0x1f8,%l6
p0_jmpl_2_lo:
	ldub	[%o2+0x02d],%l1		! Mem[000000001008142d]
	sdivx	%l6,0x023,%l3
	fadds	%f8 ,%f5 ,%f9 
	fstoi	%f11,%f0 
	jmpl	%g6+8,%g0
	xnor	%l2,-0xe85,%l0
p0_call_2_lo:
	fdivs	%f1 ,%f12,%f1 
	andn	%l7,%l3,%l0
	add	%l4,0xd50,%l5
	retl
	add	%l6,0x1f8,%l6
p0_jmpl_2_he:
	and	%l7,0x05c,%l0
	smul	%l5,-0x197,%l0
	sub	%l1,%l2,%l6
	orn	%l1,%l5,%l2
	udivx	%l4,%l5,%l6
	addc	%l0,%l0,%l3
	orn	%l7,-0x093,%l0
	jmpl	%g6+8,%g0
	orn	%l6,0x8fc,%l3
p0_call_2_he:
	retl
	fsqrts	%f30,%f22
p0_jmpl_2_ho:
	and	%l7,0x05c,%l0
	smul	%l5,-0x197,%l0
	sub	%l1,%l2,%l6
	orn	%l1,%l5,%l2
	udivx	%l4,%l5,%l6
	addc	%l0,%l0,%l3
	orn	%l7,-0x093,%l0
	jmpl	%g6+8,%g0
	orn	%l6,0x8fc,%l3
p0_call_2_ho:
	retl
	fsqrts	%f30,%f22
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	fdivs	%f4 ,%f5 ,%f9 
	andn	%l1,0x1ee,%l4
	sdivx	%l6,-0x09d,%l1
	fsubs	%f11,%f11,%f13
	xor	%l2,0x8af,%l1
	mulx	%l0,-0xa42,%l1
	jmpl	%g6+8,%g0
	subc	%l1,%l5,%l7
p0_call_3_le:
	smul	%l1,%l0,%l2
	fsubs	%f4 ,%f12,%f9 
	fmuls	%f14,%f13,%f2 
	subc	%l6,%l5,%l0
	retl
	mulx	%l7,-0x561,%l4
p0_jmpl_3_lo:
	fdivs	%f4 ,%f5 ,%f9 
	andn	%l1,0x1ee,%l4
	sdivx	%l6,-0x09d,%l1
	fsubs	%f11,%f11,%f13
	xor	%l2,0x8af,%l1
	mulx	%l0,-0xa42,%l1
	jmpl	%g6+8,%g0
	subc	%l1,%l5,%l7
p0_call_3_lo:
	smul	%l1,%l0,%l2
	fsubs	%f4 ,%f12,%f9 
	fmuls	%f14,%f13,%f2 
	subc	%l6,%l5,%l0
	retl
	mulx	%l7,-0x561,%l4
p0_jmpl_3_he:
	umul	%l0,%l5,%l1
	xnor	%l0,%l0,%l5
	andn	%l4,0x50a,%l1
	smul	%l5,%l5,%l4
	jmpl	%g6+8,%g0
	fsubs	%f27,%f27,%f16
p0_call_3_he:
	fcmps	%fcc1,%f16,%f24
	retl
	orn	%l6,0xd7a,%l2
p0_jmpl_3_ho:
	umul	%l0,%l5,%l1
	xnor	%l0,%l0,%l5
	andn	%l4,0x50a,%l1
	smul	%l5,%l5,%l4
	jmpl	%g6+8,%g0
	fsubs	%f27,%f27,%f16
p0_call_3_ho:
	fcmps	%fcc1,%f16,%f24
	retl
	orn	%l6,0xd7a,%l2
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
	.word	0x21aef1b6,0x627715a4		! Init value for %l0
	.word	0x6cc52816,0x48442129		! Init value for %l1
	.word	0x6b54aaa2,0x7f00f608		! Init value for %l2
	.word	0xf49b5d78,0x6d7fe83c		! Init value for %l3
	.word	0x38816709,0xf5682bd5		! Init value for %l4
	.word	0x38ba49a0,0x63f17a31		! Init value for %l5
	.word	0x6eac650b,0xe68f7d13		! Init value for %l6
	.word	0xfb5bda39,0xcee10e4c		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x7305ee2b,0x05700460		! Init value for %f0 
	.word	0x1bdb04eb,0xbe0d35c3		! Init value for %f2 
	.word	0xbf394847,0xe96dec05		! Init value for %f4 
	.word	0x7a365fa4,0x5dcbbc8b		! Init value for %f6 
	.word	0xc5d648c2,0xfcfc54b5		! Init value for %f8 
	.word	0x9f65dd20,0x71bc8902		! Init value for %f10
	.word	0x5778a534,0x8cd70f82		! Init value for %f12
	.word	0xd0ea4854,0xc51b8c18		! Init value for %f14
	.word	0x66cf68ad,0x18f5c11a		! Init value for %f16
	.word	0x69d1b2cd,0x049302d3		! Init value for %f18
	.word	0x2c37451b,0xac7d3113		! Init value for %f20
	.word	0x7bf4a25b,0x4e003c1d		! Init value for %f22
	.word	0xaf1d6e14,0xdd9e0d5b		! Init value for %f24
	.word	0x3dc23d89,0x9f8083fc		! Init value for %f26
	.word	0xe19681f6,0xdf9d2fa9		! Init value for %f28
	.word	0x00411874,0x36c5746b		! Init value for %f30
	.word	0x26945d3b,0xc1f74eb9		! Init value for %f32
	.word	0x39a006e2,0xdacd325c		! Init value for %f34
	.word	0x632ae364,0x1b1f32bc		! Init value for %f36
	.word	0x5196d30d,0x50a190bd		! Init value for %f38
	.word	0x7b3cbd0c,0x966fcc16		! Init value for %f40
	.word	0x6b370f16,0xcea99933		! Init value for %f42
	.word	0x0824c1f1,0x0a75c8f7		! Init value for %f44
	.word	0x35f6561f,0xf2296706		! Init value for %f46
	.word	0x127e12a7,0x65174122
	.word	0xec9171cb,0xbbc72e86
	.word	0x4c463d6d,0x1cd1a84f
	.word	0x0977d09c,0x8e6669bc
	.word	0xbb6cff85,0x90feeb7e
	.word	0x72dda5a4,0x27384e07
	.word	0x1eebc6ae,0x63beff5b
	.word	0x49bc8ea1,0x3c5cd347
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
	.word	0x00000000,0x7e60bfff
	.word	0x00000000,0xffffff7f
	.word	0x00000000,0x00000049
	.word	0x00000000,0x00000000
	.word	0x00000000,0x48000000
	.word	0x00000000,0x00000050
	.word	0x00000000,0x0000007f
	.word	0x00000000,0x00000000
p0_expected_fp_regs:
	.word	0x7e3e58ff,0x000000ff
	.word	0xd6000000,0x00000000
	.word	0x00000000,0x33660000
	.word	0x8900bfff,0xa90cadac
	.word	0x000000ff,0x94b18a76
	.word	0x00000573,0xff000071
	.word	0x000000d6,0xffffffff
	.word	0x7f800000,0xb3660000
	.word	0x80000000,0x00000000
	.word	0xffffffff,0xffffffdd
	.word	0x7e60bfff,0x7e3e58ff
	.word	0x68a493c1,0xa90cadac
	.word	0xf8ffffff,0xddffffff
	.word	0xffffffff,0xfffffff8
	.word	0x7c0efb7c,0x00ffff00
	.word	0xa52ce06d,0x7d5c0455
	.word	0x00000039,0x00000800		! %fsr = 0000003900000800
p0_local0_expect:
	.word	0x00000000,0xffffffff
	.word	0x56ff87ac,0x000000ff
	.word	0x4960bfff,0xffffffff
	.word	0x2bee0573,0x72507abd
	.word	0xac990448,0x1b00ff00
	.word	0xffbf607e,0x20dd659f
	.word	0xff006de9,0xffffffc2
	.word	0x0040009c,0xff000099
p0_local0_sec_expect:
	.word	0x00000000,0xc193a468
	.word	0x7fff0000,0x00000000
	.word	0x00000000,0xff000000
	.word	0x0de00ad7,0x3f0316a6
	.word	0xffbf607e,0xbea1eff2
	.word	0x7e848291,0x012e512a
	.word	0x0b8ebdd3,0xe299e9e3
	.word	0x00002dd6,0x85f40000
p0_local1_expect:
	.word	0x80000000,0x00000000
	.word	0xffffffff,0xffffffdd
	.word	0x00000000,0x7e3e58ff
	.word	0x68a493c1,0xa90cadac
	.word	0xf8ffffff,0xddffffff
	.word	0xffffffff,0xfffffff8
	.word	0x7c0efb7c,0x00ffff00
	.word	0xa52ce06d,0x7d5c0455
p0_local1_sec_expect:
	.word	0xffffffff,0x450440d6
	.word	0x00000000,0xe1c74923
	.word	0xacad0ca9,0xffbf0089
	.word	0xffc09ddd,0xc193a468
	.word	0xa5e9ac63,0x94b18a76
	.word	0x820fd78c,0x34a57857
	.word	0x80000000,0x36c0c225
	.word	0xbe7453cf,0x9f6ec53a
p0_local2_expect:
	.word	0x00000000,0x0000007f
	.word	0xddffffff,0xffffffff
	.word	0x00000000,0x00000000
	.word	0xacad0ca9,0xc193a468
	.word	0xe139503d,0x8ea847d9
	.word	0xf8ffffff,0x5063fba2
	.word	0xa675a8b0,0x7cfb0e7c
	.word	0x55045c7d,0x6de02ca5
p0_local2_sec_expect:
	.word	0x00000000,0x7cfb0e7c
	.word	0x8900bfff,0xa90cadac
	.word	0xff000000,0xffefa1be
	.word	0x480aa5b1,0xd145d7f9
	.word	0x00000000,0xb910d8d1
	.word	0x204360ba,0x9182847e
	.word	0x3c670b9d,0x4de211f1
	.word	0x48c3d2b8,0xa313f7da
p0_local3_expect:
	.word	0x000000ff,0x94b18a76
	.word	0xffffff00,0x00000000
	.word	0x00000000,0x00000080
	.word	0x2349c7e1,0x00000000
	.word	0xac990448,0xce32d083
	.word	0x00000000,0x000000ff
	.word	0xfffffff9,0xdf48e814
	.word	0xb4e1f0f2,0x6705d656
p0_local3_sec_expect:
	.word	0xff000000,0x00000080
	.word	0xddffffff,0xffffffff
	.word	0xff583e7e,0xffbf607e
	.word	0xacad0ca9,0xc193a468
	.word	0xe139503d,0x8ea847d9
	.word	0xf8ffffff,0x5063fba2
	.word	0xa675a8b0,0x7cfb0e7c
	.word	0x55045c7d,0x6de02ca5
p0_local4_expect:
	.word	0x24d7ffff,0x00000000
	.word	0xffffffff,0xf2ef6cc2
	.word	0xff49607e,0x3c4aefff
	.word	0xdd9dc0ff,0xf2182fdc
	.word	0x1c5029f5,0xc70d15f3
	.word	0xffffff04,0xc26ceff2
	.word	0x73050000,0x000000be
	.word	0xa2fbff50,0x0000002f
p0_local4_sec_expect:
	.word	0x63ac0000,0x00000000
	.word	0xffffffff,0x00000000
	.word	0xff9dc0ff,0x00000000
	.word	0x0e26a88e,0x3d5039e1
	.word	0xa77aa217,0x0fc18655
	.word	0xdd63fba2,0xf02d8855
	.word	0xd7610eb5,0x918ccb87
	.word	0x76e1320a,0x7827e7ec
p0_local5_expect:
	.word	0x00006633,0x00000000
	.word	0xd6000000,0x00000000
	.word	0xffec6de9,0xf6ffffff
	.word	0xff583e7e,0xffbf607e
	.word	0x00000000,0xc193a468
	.word	0x425aeabe,0x0e541a91
	.word	0x00000000,0xffbf607e
	.word	0xfff95f02,0xffbf6049
p0_local5_sec_expect:
	.word	0x5063fba2,0xf02d883c
	.word	0xffff00ff,0xff000071
	.word	0x00000000,0x00000049
	.word	0xd6000000,0xffc09ddd
	.word	0x5586c10f,0x00000000
	.word	0x3c886350,0x72507abd
	.word	0x87cb8c91,0xb50e61d7
	.word	0xece72778,0x0a32e176
p0_local6_expect:
	.word	0x000066b3,0xdd9dc0ff
	.word	0x48000000,0xfffffff8
	.word	0xffffffdd,0x49000000
	.word	0xf8ffffff,0x00000048
	.word	0x5037e299,0x2bee0573
	.word	0x3d702fb7,0x00005dfd
	.word	0x00000005,0x0000001b
	.word	0xf6002dd6,0x63ace9a5
p0_local6_sec_expect:
	.word	0x7c0efb7c,0x00ffff00
	.word	0x001b0000,0x025ff9ff
	.word	0xffffffff,0xdd9dc0ff
	.word	0x004de918,0xff000000
	.word	0x72507abd,0x7e60bf00
	.word	0x425aeabe,0x0e541a91
	.word	0x83d032ce,0x480499ac
	.word	0xfff95f02,0xffbf6049
share0_expect:
	.word	0xffff4c08,0xa7219620
	.word	0xbe499bb9,0x55ac559e
	.word	0x3b840c0c,0xcac34e7a
	.word	0x4747065c,0x69aaffc5
	.word	0xf160d889,0x56a8f4e2
	.word	0x00f7902c,0x0d194686
	.word	0x3836e9fc,0x3a4b319f
	.word	0x3657104c,0x4ce0b43b
share1_expect:
	.word	0xffffba64,0x50be9cb2
	.word	0x358d183c,0x1ce9d66d
	.word	0xb7794811,0xf64baa5f
	.word	0x3aa37139,0xd4b64d83
	.word	0x2d5a2da7,0x4c9ec607
	.word	0xc7fd7ba5,0x546e20d3
	.word	0x04c49397,0x75ec205b
	.word	0xb32084ab,0x4074f878
	.word	0xff1dc1d1,0x4b815f4d
	.word	0x9715d1ba,0x8c699d55
	.word	0x7c1d3022,0xffef4079
	.word	0x0fee4678,0x7a6e9b1e
	.word	0x2f27f261,0xb3ad3d93
	.word	0xe82250b4,0xc4758128
	.word	0x37ddc559,0x8943c72f
	.word	0xb2040dd9,0xee0f0873
share2_expect:
	.word	0x60ff85d2,0xf2e9b997
	.word	0x48ae5c5b,0xe9d9a858
	.word	0x70290700,0x8e2d2739
	.word	0x89407bcd,0xc1ede677
	.word	0x170db53d,0x1c24e995
	.word	0x9281ae71,0xd8b45a3d
	.word	0x20d69ba0,0xef2c7d6e
	.word	0x6ac4e5d4,0x85422183
share3_expect:
	.word	0xbbfff103,0x16814f74
	.word	0xefdca886,0x6cacea9c
	.word	0x2973621e,0x156c973e
	.word	0xcb3cfc8c,0x973a275a
	.word	0x60fb5560,0x9934d5bb
	.word	0x0f54d78c,0xea1d77fc
	.word	0xa3bc4765,0xa207cd85
	.word	0x73e5ef6d,0x83db9860
	.word	0x9affd022,0x96df108e
	.word	0x93a772a1,0x7e5a380e
	.word	0x278f7abf,0xfc85b7aa
	.word	0xe46778a1,0xd69ec2b6
	.word	0x8f6eab53,0x70d0f394
	.word	0x6330c36a,0x74ba978b
	.word	0xce22797b,0xf7842f48
	.word	0x54b80c18,0xa4886a38
	.word	0xf6ff7b7d,0x4cb93442
	.word	0xe49ad591,0x6731c45d
	.word	0x6451aafc,0xef7433fd
	.word	0xdf760f6c,0x0cc7a120
	.word	0x057f4fc4,0x8df98e1f
	.word	0xf71b1a64,0x20cafedd
	.word	0x49ea0c9b,0x199931e8
	.word	0xb4f77d2f,0xff1434ce
	.word	0x6fd44ce8,0x536cd1eb
	.word	0x67b00ca1,0x097f066a
	.word	0xec55c970,0x84748abc
	.word	0x1113243a,0x038a149d
	.word	0x9c969d70,0xf86de02d
	.word	0x0ef5cf67,0x7985df14
	.word	0xe5cf2011,0x7b9fd797
	.word	0xeb4517de,0x60c900ac
	.word	0xeca18676,0x96d95e1f
	.word	0xea012100,0xc2920fd6
	.word	0x7b9ed8d1,0xacd4824d
	.word	0xc369db0e,0x9127c08b
	.word	0x6b60d927,0xf137b852
	.word	0x5ee60923,0x7c90abb1
	.word	0x08ea27e4,0xd83ccc74
	.word	0x00a330ee,0xa63bd6a8
	.word	0xf6ff05d8,0x3974017c
	.word	0x42e618f1,0x3e4ffe49
	.word	0x28a3e544,0xc06663ef
	.word	0xe5aa2101,0x7a26bf90
	.word	0x0a350172,0xe838d296
	.word	0x14cceb2a,0x7a361faa
	.word	0xc4ab4810,0xee4e7370
	.word	0x2ff3ba60,0x1840e2e3
	.word	0x4bedbd9f,0x209341b1
	.word	0x04093592,0xbd46d214
	.word	0xd0c920b0,0x0e1a28e9
	.word	0xc569b75d,0xd1b4c8f9
	.word	0xebcaec9c,0x6807c145
	.word	0xcd3b49d8,0xb4a6dcb4
	.word	0x54395b0f,0xf41fe9e7
	.word	0x5f65dfbc,0x632533e7
	.word	0xff7e6949,0x11167c8d
	.word	0x72cae032,0x922d1f72
	.word	0x562d4f04,0xdee38014
	.word	0xf83cc914,0xfecd5710
	.word	0x94704c3e,0xbe35f8d7
	.word	0x60e4aac6,0xf35a1f9e
	.word	0x191732b0,0xa37bbd64
	.word	0x22cdc76f,0xb30c2a09
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
	.word	0x7b6c0cc8,0x6e208af6
	.word	0x00000000,0x00000002
	.word	0xba599050,0x1cacaf1d
	.word	0x00000000,0x00000003
	.word	0xaa548f57,0x8cf0ed0b
	.word	0x00000000,0x00000004
	.word	0xc4c1d848,0x05a26428
	.word	0x00000000,0x00000005
	.word	0x9ffa7eb7,0xa53ddd2b
	.word	0x00000000,0x00000006
	.word	0xf37a5217,0xd03b3391
	.word	0x00000000,0x00000007
	.word	0xd51b0198,0x6800553a
	.word	0x00000000,0x00000008
	.word	0xbd9b2d58,0x6e6d3ba7
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
	.word	0xee2c4c15,0xdc3fcc00,0x73cb5478,0xebf2b9b7
	.word	0x15e3f35e,0x4e0c0ed7,0xcf495bf9,0x016d7777
	.word	0x50bb809c,0x68604785,0xa3f1a2ac,0x73209ff1
	.word	0x011c805b,0x5219c84f,0x753a8d6d,0xfc26441d
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
	.word	0xeca7a64a,0x048fa16b,0xdf687de4,0xd9af76d2
	.word	0x05b0b7b6,0xb1dfcfbd,0x0de00ad7,0x3f0316a6
	.word	0xd784f77e,0x71e910f2,0x7e848291,0x012e512a
	.word	0x0b8ebdd3,0xe299e9e3,0x11872dd6,0x85f46044
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
	.word	0xe7b2ebbe,0xf86b1e23,0x58ea4752,0x6c43fb05
	.word	0xb3667c9f,0x37328bd7,0x70719357,0x0896b14a
	.word	0x19df3cea,0x4f881d5f,0xbff84ba1,0x63486307
	.word	0xef8c9284,0xdb19a1b5,0xa220ac6a,0x2d3bd93b
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
	.word	0xbe6a4109,0x3833c7eb,0x8d1a1f54,0x5d890443
	.word	0x063b3f93,0x601af5ea,0x0ce50438,0xb6fe7da0
	.word	0xc11fe171,0x280fc23d,0x5e985489,0x05bf6787
	.word	0xcb0e28ae,0x1b0de348,0x76058216,0x399f5b62
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
	.word	0xbf09f722,0x9f6ec53a,0xbda3ae5e,0x5ce9b16a
	.word	0x6a575a97,0x8f45e8bb,0xacad0ca9,0x55c5ee92
	.word	0xaa88243b,0x96e4ffcd,0xfd06f774,0xfe3cff92
	.word	0xa675a8b0,0x7cfb0e7c,0x55045c7d,0x6de02ca5
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
	.word	0x32000f4b,0xb01cb197,0x8c9fa7fc,0xbb1c0e9a
	.word	0xc8de0036,0xebc42b04,0x480aa5b1,0xd145d7f9
	.word	0x6148fa06,0x19b6d8d1,0x204360ba,0xaa51901e
	.word	0x3c670b9d,0x4de211f1,0x48c3d2b8,0xa313f7da
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
	.word	0x94b18a76,0x271c236d,0x2d2ea293,0xef1e7c67
	.word	0x2fc09ddd,0xc193a468,0x2349c7e1,0x89422d3b
	.word	0xac990448,0xce32d083,0x7c829e0f,0x0ac5eded
	.word	0xbc5a3abb,0xdf489ae7,0xb4e1f0f6,0x6740d656
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
	.word	0x95cfd873,0x493cb9ff,0x0a6c330b,0x94cf7e4f
	.word	0x0bbb6971,0xe611a2f7,0xcabcfbb8,0xe672a99b
	.word	0xdd02365f,0x81d02f83,0xf338bb9f,0xe62627fb
	.word	0x5059a5cf,0x12e09aad,0x817ce1e4,0xc5bf4db2
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
	.word	0xfd5debc7,0xb72f703d,0x641c7fd8,0x35b4c03a
	.word	0x14e8c163,0x02ef4a3c,0xd6989865,0xf2182fdc
	.word	0x1c5029f5,0xc70d15f3,0x765c210f,0xc26cf44e
	.word	0xfcf158f1,0x431a4824,0xff5e835f,0xe834d14c
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
	.word	0x00dd0448,0x0d0d2138,0x666a2e55,0x4c552e69
	.word	0x78d95ca4,0x53a63474,0xe139503d,0x8ea8260e
	.word	0x5586c10f,0x17a27aa7,0x55882df0,0xa2fb63dd
	.word	0x87cb8c91,0xb50e61d7,0xece72778,0x0a32e176
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
	.word	0x9603b2cd,0xbb8de1e0,0xd7c76781,0xa7094efb
	.word	0x7588c850,0x471e33cf,0x4992ebff,0x140a8f00
	.word	0xfd5d119e,0x072e55cd,0x425aeabe,0x0e541a91
	.word	0x0782d3ac,0xd1122200,0x944c8e2c,0xcc6e2f05
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
	.word	0xd6400445,0x72507abd,0x28445af0,0xb86b016b
	.word	0x31b792a8,0x2bd3ee6d,0x58f57a37,0x6f1ae716
	.word	0xf59c2a36,0x63ace9a5,0xec7caf0d,0xc2f15a43
	.word	0x4befa1be,0x4960bfff,0xea03fd1a,0x13c71665
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
	.word	0x3fb13caa,0x36c0c225,0x9df0a0da,0x9483829a
	.word	0x4a99712b,0x8b931e4a,0xd71ed3d6,0x28e7d378
	.word	0x2c900443,0x09a81740,0xb91090d3,0x81ec1b4a
	.word	0xcde9aaa7,0xc1307e7d,0x337b240e,0x2e6f90a0
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
	.word	0x3cd20ca4,0xf7afdc53,0xfb3e1bd5,0xa2a94821
	.word	0xfc725355,0x364150a3,0xcba17b8b,0xb7c5c017
	.word	0xe30703b9,0x945d7d1e,0x3823183b,0x48d4823e
	.word	0x53f361b2,0xce50ef63,0xbb7e34bd,0xb43585f9
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
	.word	0x90434c08,0xa7219620,0xbe499bb9,0x55ac559e
	.word	0x3b840c0c,0xcac34e7a,0x4747065c,0x69aaffc5
	.word	0xf160d889,0x56a8f4e2,0x00f7902c,0x0d194686
	.word	0x3836e9fc,0x3a4b319f,0x3657104c,0x4ce0b43b
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
	.word	0x5fecba64,0x50be9cb2,0x358d183c,0x1ce9d66d
	.word	0xb7794811,0xf64baa5f,0x3aa37139,0xd4b64d83
	.word	0x2d5a2da7,0x4c9ec607,0xc7fd7ba5,0x546e20d3
	.word	0x04c49397,0x75ec205b,0xb32084ab,0x4074f878
	.word	0xba7dc1d1,0x4b815f4d,0x9715d1ba,0x8c699d55
	.word	0x7c1d3022,0xffef4079,0x0fee4678,0x7a6e9b1e
	.word	0x2f27f261,0xb3ad3d93,0xe82250b4,0xc4758128
	.word	0x37ddc559,0x8943c72f,0xb2040dd9,0xee0f0873
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
	.word	0x482885d2,0xf2e9b997,0x48ae5c5b,0xe9d9a858
	.word	0x70290700,0x8e2d2739,0x89407bcd,0xc1ede677
	.word	0x170db53d,0x1c24e995,0x9281ae71,0xd8b45a3d
	.word	0x20d69ba0,0xef2c7d6e,0x6ac4e5d4,0x85422183
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
	.word	0xbbb2f103,0x16814f74,0xefdca886,0x6cacea9c
	.word	0x2973621e,0x156c973e,0xcb3cfc8c,0x973a275a
	.word	0x60fb5560,0x9934d5bb,0x0f54d78c,0xea1d77fc
	.word	0xa3bc4765,0xa207cd85,0x73e5ef6d,0x83db9860
	.word	0x9a2fd022,0x96df108e,0x93a772a1,0x7e5a380e
	.word	0x278f7abf,0xfc85b7aa,0xe46778a1,0xd69ec2b6
	.word	0x8f6eab53,0x70d0f394,0x6330c36a,0x74ba978b
	.word	0xce22797b,0xf7842f48,0x54b80c18,0xa4886a38
	.word	0xf68e7b7d,0x4cb93442,0xe49ad591,0x6731c45d
	.word	0x6451aafc,0xef7433fd,0xdf760f6c,0x0cc7a120
	.word	0x057f4fc4,0x8df98e1f,0xf71b1a64,0x20cafedd
	.word	0x49ea0c9b,0x199931e8,0xb4f77d2f,0xff1434ce
	.word	0x6fd44ce8,0x536cd1eb,0x67b00ca1,0x097f066a
	.word	0xec55c970,0x84748abc,0x1113243a,0x038a149d
	.word	0x9c969d70,0xf86de02d,0x0ef5cf67,0x7985df14
	.word	0xe5cf2011,0x7b9fd797,0xeb4517de,0x60c900ac
	.word	0xeca18676,0x96d95e1f,0xea012100,0xc2920fd6
	.word	0x7b9ed8d1,0xacd4824d,0xc369db0e,0x9127c08b
	.word	0x6b60d927,0xf137b852,0x5ee60923,0x7c90abb1
	.word	0x08ea27e4,0xd83ccc74,0x00a330ee,0xa63bd6a8
	.word	0xf60105d8,0x3974017c,0x42e618f1,0x3e4ffe49
	.word	0x28a3e544,0xc06663ef,0xe5aa2101,0x7a26bf90
	.word	0x0a350172,0xe838d296,0x14cceb2a,0x7a361faa
	.word	0xc4ab4810,0xee4e7370,0x2ff3ba60,0x1840e2e3
	.word	0x4bedbd9f,0x209341b1,0x04093592,0xbd46d214
	.word	0xd0c920b0,0x0e1a28e9,0xc569b75d,0xd1b4c8f9
	.word	0xebcaec9c,0x6807c145,0xcd3b49d8,0xb4a6dcb4
	.word	0x54395b0f,0xf41fe9e7,0x5f65dfbc,0x632533e7
	.word	0x75bf6949,0x11167c8d,0x72cae032,0x922d1f72
	.word	0x562d4f04,0xdee38014,0xf83cc914,0xfecd5710
	.word	0x94704c3e,0xbe35f8d7,0x60e4aac6,0xf35a1f9e
	.word	0x191732b0,0xa37bbd64,0x22cdc76f,0xb30c2a09
share3_end:
