/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_5000_0.s
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
!	1 Thread, 5000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_5000_0.s created on Mar 27, 2009 (14:45:12)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_5000_0 -p 1 -l 5000

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

p0_label_151:
!	Mem[0000000010081408] = ffffffdd, %f8  = 000000ff
	lda	[%i2+%o4]0x88,%f8 	! %f8 = ffffffdd
!	%l5 = 0000000000000050, %l3 = 0000000000000000, %l7  = 0000000000000000
	mulx	%l5,%l3,%l7		! %l7 = 0000000000000000
!	%l7 = 0000000000000000, %l0 = 000000007e60bfff, %l6  = 000000000000007f
	mulx	%l7,%l0,%l6		! %l6 = 0000000000000000
!	Mem[0000000030001400] = 00000000 c193a468, %l2 = 00000049, %l3 = 00000000
	ldda	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000 00000000c193a468
!	%l0 = 000000007e60bfff, %l3 = 00000000c193a468, %y  = 00000000
	umul	%l0,%l3,%l6		! %l6 = 5f8fd376d0ba5b98, %y = 5f8fd376
!	Mem[0000000030041408] = 00000000, %l2 = 0000000000000000
	ldsba	[%i1+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = ffec6de9, %l7 = 0000000000000000
	lduha	[%i5+%o5]0x80,%l7	! %l7 = 000000000000ffec
!	Mem[0000000010101400] = ffffd724, %l3 = 00000000c193a468
	lduwa	[%i4+%g0]0x88,%l3	! %l3 = 00000000ffffd724
!	Mem[0000000030081400] = 00000000, %l6 = 5f8fd376d0ba5b98
	lduba	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = ff49607e, %l3 = 00000000ffffd724
	swap	[%i4+%o5],%l3		! %l3 = 00000000ff49607e

p0_label_152:
!	%l2 = 00000000, %l3 = ff49607e, Mem[00000000300c1408] = ffffffdd ffffffff
	stda	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000 ff49607e
!	Mem[0000000021800100] = eca18676, %l6 = 0000000000000000
	ldstuba	[%o3+0x100]%asi,%l6	! %l6 = 000000ec000000ff
!	%l7 = 000000000000ffec, Mem[00000000100c1408] = 0000000000ffffff
	stxa	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000000000ffec
!	Mem[00000000100c1438] = b4e1f0f2, %l6 = 00000000000000ec
	ldstuba	[%i3+0x038]%asi,%l6	! %l6 = 000000b4000000ff
!	%l6 = 000000b4, %l7 = 0000ffec, Mem[0000000010141410] = e96decff fffffff6
	stda	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000b4 0000ffec
!	%f30 = a52ce06d 7d5c0455, Mem[0000000030141408] = ffff00ff ff000071
	stda	%f30,[%i5+%o4]0x81	! Mem[0000000030141408] = a52ce06d 7d5c0455
!	%l2 = 00000000, %l3 = ff49607e, Mem[00000000100c1410] = 00000000 80000000
	stda	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000 ff49607e
!	%l7 = 000000000000ffec, Mem[0000000010041415] = 7e3e58ff, %asi = 80
	stba	%l7,[%i1+0x015]%asi	! Mem[0000000010041414] = 7eec58ff
!	%l0 = 7e60bfff, %l1 = ffffff7f, Mem[00000000100c1400] = 000000ff 94b18a76
	stda	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 7e60bfff ffffff7f
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff583e7e, %f0  = 7e3e58ff
	lda	[%i3+%o5]0x81,%f0 	! %f0 = ff583e7e

p0_label_153:
!	Mem[0000000030041408] = 00000000, %l6 = 00000000000000b4
	ldsba	[%i1+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141408] = a52ce06d, %l2 = 0000000000000000
	lduwa	[%i5+%o4]0x81,%l2	! %l2 = 00000000a52ce06d
!	Mem[0000000010181424] = 2bee0573, %l7 = 000000000000ffec
	lduh	[%i6+0x024],%l7		! %l7 = 0000000000002bee
!	Mem[0000000010041408] = ddffffffffffffff, %l2 = 00000000a52ce06d
	ldxa	[%i1+%o4]0x88,%l2	! %l2 = ddffffffffffffff
!	Mem[0000000010141410] = 000000b4, %f22 = 68a493c1
	lda	[%i5+%o5]0x88,%f22	! %f22 = 000000b4
!	Mem[0000000030101400] = 63ac0000, %l6 = 0000000000000000
	ldsba	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000063
!	Mem[0000000030141410] = 0000000000000049, %l1 = 00000000ffffff7f
	ldxa	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000049
!	Mem[0000000030101410] = ff9dc0ff, %l1 = 0000000000000049
	ldsha	[%i4+%o5]0x81,%l1	! %l1 = ffffffffffffff9d
!	Mem[0000000030081400] = 00000000, %f17 = 00000000
	lda	[%i2+%g0]0x81,%f17	! %f17 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = ddffffff, %l7 = 0000000000002bee
	swapa	[%i2+%o4]0x80,%l7	! %l7 = 00000000ddffffff

p0_label_154:
!	Mem[0000000010081411] = 00000000, %l5 = 0000000000000050
	ldstuba	[%i2+0x011]%asi,%l5	! %l5 = 00000000000000ff
!	%f18 = ffffffff ffffffdd, %l0 = 000000007e60bfff
!	Mem[0000000030001400] = 00000000c193a468
	stda	%f18,[%i0+%l0]ASI_PST8_SL ! Mem[0000000030001400] = ddffffffffffffff
!	%l3 = 00000000ff49607e, Mem[0000000010001400] = 00000000
	stwa	%l3,[%i0+%g0]0x88	! Mem[0000000010001400] = ff49607e
!	%l2 = ddffffffffffffff, Mem[00000000300c1408] = 00000000
	stwa	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffffffff
!	%l2 = ddffffffffffffff, Mem[0000000030001400] = ddffffffffffffff
	stxa	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = ddffffffffffffff
!	%l1 = ffffffffffffff9d, Mem[0000000010141420] = 00000000c193a468
	stx	%l1,[%i5+0x020]		! Mem[0000000010141420] = ffffffffffffff9d
!	%l6 = 0000000000000063, Mem[00000000100c1408] = ecff0000
	stba	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 63ff0000
!	Mem[0000000010041410] = 00000000, %l3 = 00000000ff49607e
	ldstuba	[%i1+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000030181400] = 7c0efb7c00ffff00
	stxa	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = b4000000, %l1 = ffffffffffffff9d
	lduha	[%i5+%o5]0x80,%l1	! %l1 = 000000000000b400

p0_label_155:
!	Mem[0000000010081400] = 7f00000000000000, %l3 = 0000000000000000
	ldxa	[%i2+%g0]0x88,%l3	! %l3 = 7f00000000000000
!	Mem[0000000010001400] = ff49607e, %l7 = 00000000ddffffff
	ldswa	[%i0+%g0]0x88,%l7	! %l7 = ffffffffff49607e
!	Mem[0000000030181400] = 0000000000000000, %l6 = 0000000000000063
	ldxa	[%i6+%g0]0x89,%l6	! %l6 = 0000000000000000
!	%l1 = 000000000000b400, %l6 = 0000000000000000, %l0 = 000000007e60bfff
	andn	%l1,%l6,%l0		! %l0 = 000000000000b400
!	Mem[0000000030081410] = ff000000, %l2 = ddffffffffffffff
	lduwa	[%i2+%o5]0x81,%l2	! %l2 = 00000000ff000000
!	Mem[00000000300c1408] = ffffffff, %l6 = 0000000000000000
	lduha	[%i3+%o4]0x81,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010001430] = ff006de9, %f19 = ffffffdd
	lda	[%i0+0x030]%asi,%f19	! %f19 = ff006de9
!	Mem[0000000010141410] = 000000b4, %l3 = 7f00000000000000
	ldsha	[%i5+%o5]0x88,%l3	! %l3 = 00000000000000b4
!	Mem[00000000100c1410] = 00000000, %f31 = 7d5c0455
	lda	[%i3+%o5]0x80,%f31	! %f31 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 000000b4, %l7 = ffffffffff49607e
	ldstuba	[%i5+%o5]0x88,%l7	! %l7 = 000000b4000000ff

p0_label_156:
!	%f12 = 000000d6, %f9  = 94b18a76
	fsqrts	%f12,%f9 		! %l0 = 000000000000b422, Unfinished, %fsr = 3900000800
!	%l3 = 00000000000000b4, Mem[0000000010181408] = 00000048
	stha	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000b4
!	%f26 = ffffffff, Mem[0000000030141408] = a52ce06d
	sta	%f26,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffffff
!	%l1 = 000000000000b400, Mem[000000001010140f] = f2ef6cc2
	stb	%l1,[%i4+0x00f]		! Mem[000000001010140c] = f2ef6c00
!	%f18 = ffffffff, %f13 = ffffffff, %f9  = 94b18a76
	fsubs	%f18,%f13,%f9 		! %f9  = ffffffff
!	Mem[0000000030001410] = 00000000, %l7 = 00000000000000b4
	ldstuba	[%i0+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[000000001008141c] = c193a468, %l4 = 48000000, %l5 = 00000000
	add	%i2,0x1c,%g1
	casa	[%g1]0x80,%l4,%l5	! %l5 = 00000000c193a468
!	%l1 = 000000000000b400, Mem[0000000010041400] = 80000000
	stba	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	%l4 = 48000000, %l5 = c193a468, Mem[0000000010041408] = ffffffff ffffffdd
	stda	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 48000000 c193a468
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ffbf0089, %l5 = 00000000c193a468
	ldswa	[%i2+%o4]0x89,%l5	! %l5 = ffffffffffbf0089

p0_label_157:
!	%l6 = 000000000000ffff, immd = 00000000000009e7, %l5 = ffffffffffbf0089
	sdivx	%l6,0x9e7,%l5		! %l5 = 0000000000000019
!	Mem[00000000100c1408] = 0000ff63, %l7 = 0000000000000000
	lduwa	[%i3+%o4]0x88,%l7	! %l7 = 000000000000ff63
!	Mem[0000000010181410] = ddffffff, %l1 = 000000000000b400
	lduba	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1410] = 00000000, %l3 = 00000000000000b4
	lduha	[%i3+0x010]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141408] = ffffffff, %l0 = 000000000000b422
	ldsba	[%i5+%o4]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030001400] = ddffffff, %l2 = 00000000ff000000
	ldsba	[%i0+%g0]0x81,%l2	! %l2 = ffffffffffffffdd
!	Mem[0000000030041400] = ffffffff, %l3 = 0000000000000000
	lduba	[%i1+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181410] = ffffffff, %l3 = 00000000000000ff
	ldswa	[%i6+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081400] = 00000000, %l1 = 00000000000000ff
	lduba	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081428] = f8ffffff5063fba2, %l4 = 0000000048000000, %l1 = 0000000000000000
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l4,%l1	! %l1 = f8ffffff5063fba2

p0_label_158:
!	%l6 = 000000000000ffff, Mem[000000001018142e] = 00005dfd
	stb	%l6,[%i6+0x02e]		! Mem[000000001018142c] = 0000fffd
!	Mem[0000000010081400] = 00000000, %l4 = 0000000048000000
	swapa	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	%l6 = 0000ffff, %l7 = 0000ff63, Mem[00000000100c1400] = ffbf607e 7fffffff
	stda	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000ffff 0000ff63
!	%l2 = ffffffffffffffdd, Mem[0000000030081400] = 00000000
	stba	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000dd
!	%l6 = 000000000000ffff, Mem[00000000100c1410] = 00000000
	stwa	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000ffff
!	Mem[0000000010181438] = f6002dd663ace9a5, %l5 = 0000000000000019, %l7 = 000000000000ff63
	add	%i6,0x38,%g1
	casxa	[%g1]0x80,%l5,%l7	! %l7 = f6002dd663ace9a5
!	%l2 = ffffffffffffffdd, Mem[0000000030041408] = 00000000
	stba	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = dd000000
!	%l0 = ffffffffffffffff, Mem[0000000010101410] = ffffd724
	stba	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffd724
!	%f12 = 000000d6 ffffffff, Mem[0000000030101410] = ffc09dff 00000000
	stda	%f12,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000d6 ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 5063fba2, %l2 = ffffffffffffffdd
	lduwa	[%i5+%g0]0x81,%l2	! %l2 = 000000005063fba2

p0_label_159:
!	Mem[0000000010141410] = 000000ff, %l2 = 000000005063fba2
	ldsha	[%i5+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181408] = f8ffffff 000000b4, %l4 = 00000000, %l5 = 00000019
	ldda	[%i6+%o4]0x88,%l4	! %l4 = 00000000000000b4 00000000f8ffffff
!	Mem[0000000010141428] = 425aeabe0e541a91, %f10 = 00000573 ff000071
	ldd	[%i5+0x028],%f10	! %f10 = 425aeabe 0e541a91
!	Mem[0000000010001408] = 56ff87ac, %l3 = ffffffffffffffff
	lduha	[%i0+%o4]0x80,%l3	! %l3 = 00000000000056ff
!	Mem[0000000010041408] = 48000000, %l4 = 00000000000000b4
	ldswa	[%i1+%o4]0x80,%l4	! %l4 = 0000000048000000
!	%f28 = 7c0efb7c, %f13 = ffffffff
	fsqrts	%f28,%f13		! %f13 = 5dbf5204
!	Mem[0000000010141438] = fff95f02 ffbf6049, %l2 = 000000ff, %l3 = 000056ff
	ldda	[%i5+0x038]%asi,%l2	! %l2 = 00000000fff95f02 00000000ffbf6049
!	Mem[0000000030141410] = 00000000, %l3 = 00000000ffbf6049
	ldsha	[%i5+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181408] = 001b0000, %l5 = 00000000f8ffffff
	lduba	[%i6+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f2  = d6000000 00000000, Mem[0000000010101408] = ffffffff f2ef6c00
	stda	%f2 ,[%i4+0x008]%asi	! Mem[0000000010101408] = d6000000 00000000

p0_label_160:
!	Mem[00000000211c0001] = 60ff85d2, %l3 = 0000000000000000
	ldstub	[%o2+0x001],%l3		! %l3 = 000000ff000000ff
!	%f12 = 000000d6, Mem[000000001004143c] = 7d5c0455
	sta	%f12,[%i1+0x03c]%asi	! Mem[000000001004143c] = 000000d6
!	%l1 = f8ffffff5063fba2, Mem[0000000010101410] = ffffd7243c4aefff
	stxa	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = f8ffffff5063fba2
!	%f12 = 000000d6, Mem[0000000010041400] = 00000000
	sta	%f12,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000d6
!	%f7  = a90cadac, %f8  = ffffffdd
	fcmps	%fcc0,%f7 ,%f8 		! %fcc0 = 3
!	%l2 = fff95f02, %l3 = 000000ff, Mem[0000000030001408] = 7fff0000 00000000
	stda	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = fff95f02 000000ff
!	Mem[0000000030181400] = 00000000, %l6 = 000000000000ffff
	ldstuba	[%i6+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101400] = 0000ac63, %l7 = f6002dd663ace9a5
	ldstuba	[%i4+%g0]0x89,%l7	! %l7 = 00000063000000ff
!	%l4 = 0000000048000000, Mem[00000000201c0000] = ffff4c08, %asi = 80
	stha	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00004c08
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 33660000, %f22 = 000000b4
	lda	[%i5+%g0]0x88,%f22	! %f22 = 33660000

p0_label_161:
!	Mem[0000000030101410] = ffffffffd6000000, %f24 = f8ffffff ddffffff
	ldda	[%i4+%o5]0x81,%f24	! %f24 = ffffffff d6000000
!	Mem[0000000010001408] = ac87ff56, %l4 = 0000000048000000
	lduwa	[%i0+%o4]0x88,%l4	! %l4 = 00000000ac87ff56
!	Mem[0000000010141400] = 0000663300000000, %f20 = 7e60bfff 7e3e58ff
	ldda	[%i5+%g0]0x80,%f20	! %f20 = 00006633 00000000
!	Mem[0000000010181408] = 000000b4, %l4 = 00000000ac87ff56
	lduwa	[%i6+%o4]0x88,%l4	! %l4 = 00000000000000b4
!	Mem[0000000030001408] = fff95f02, %l6 = 0000000000000000
	ldsba	[%i0+%o4]0x81,%l6	! %l6 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000010181400] = 000066b3 dd9dc0ff b4000000 fffffff8
!	Mem[0000000010181410] = ffffffdd 49000000 f8ffffff 00000048
!	Mem[0000000010181420] = 5037e299 2bee0573 3d702fb7 0000fffd
!	Mem[0000000010181430] = 00000005 0000001b f6002dd6 63ace9a5
	ldda	[%i6]ASI_BLK_P,%f16	! Block Load from 0000000010181400
!	Mem[0000000010101410] = f8ffffff, %l4 = 00000000000000b4, %asi = 80
	swapa	[%i4+0x010]%asi,%l4	! %l4 = 00000000f8ffffff
!	Mem[0000000010041400] = d6000000, %l0 = ffffffffffffffff
	lduha	[%i1+%g0]0x80,%l0	! %l0 = 000000000000d600
!	Mem[0000000030001400] = ddffffff, %l3 = 00000000000000ff
	lduha	[%i0+%g0]0x81,%l3	! %l3 = 000000000000ddff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 0000acff, %l1 = f8ffffff5063fba2
	swapa	[%i4+%g0]0x89,%l1	! %l1 = 000000000000acff

p0_label_162:
!	%l6 = ffffffffffffffff, Mem[0000000030081410] = ff000000
	stba	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = ff000000
!	%l2 = 00000000fff95f02, Mem[00000000201c0000] = 00004c08, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 5f024c08
!	%l0 = 000000000000d600, Mem[00000000100c1408] = 000000000000ff63
	stxa	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000000000d600
!	Mem[0000000010081408] = ee2b0000, %l4 = 00000000f8ffffff
	ldstuba	[%i2+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%f12 = 000000d6 5dbf5204, %l4 = 0000000000000000
!	Mem[0000000010041420] = f8ffffffddffffff
	add	%i1,0x020,%g1
	stda	%f12,[%g1+%l4]ASI_PST16_P ! Mem[0000000010041420] = f8ffffffddffffff
	membar	#Sync			! Added by membar checker (28)
!	%l7 = 0000000000000063, Mem[000000001018142e] = 0000fffd, %asi = 80
	stha	%l7,[%i6+0x02e]%asi	! Mem[000000001018142c] = 00000063
!	Mem[0000000030081408] = ffbf0089, %l0 = 000000000000d600
	swapa	[%i2+%o4]0x89,%l0	! %l0 = 00000000ffbf0089
!	%l6 = ffffffffffffffff, Mem[0000000030101408] = ffffffff
	stwa	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = ffffffff
!	Mem[0000000010041408] = 00000048, %l4 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l4	! %l4 = 00000048000000ff
!	Starting 10 instruction Load Burst
!	%f8  = ffffffdd, %f7  = a90cadac, %f22 = f8ffffff
	fmuls	%f8 ,%f7 ,%f22		! %f22 = ffffffdd

p0_label_163:
!	Mem[0000000010181410] = ffffffdd, %l1 = 000000000000acff
	lduwa	[%i6+%o5]0x80,%l1	! %l1 = 00000000ffffffdd
!	Mem[0000000010001438] = 0040009cff000099, %f24 = 5037e299 2bee0573
	ldda	[%i0+0x038]%asi,%f24	! %f24 = 0040009c ff000099
!	Mem[00000000300c1408] = ffffffff 7e6049ff, %l2 = fff95f02, %l3 = 0000ddff
	ldda	[%i3+%o4]0x81,%l2	! %l2 = 00000000ffffffff 000000007e6049ff
!	Mem[0000000010081410] = 00ff000000000000, %f14 = 7f800000 b3660000
	ldda	[%i2+%o5]0x80,%f14	! %f14 = 00ff0000 00000000
!	Mem[0000000010101410] = 000000b45063fba2, %f28 = 00000005 0000001b
	ldda	[%i4+0x010]%asi,%f28	! %f28 = 000000b4 5063fba2
!	Mem[0000000010001410] = 4960bfffffffffff, %f16 = 000066b3 dd9dc0ff
	ldda	[%i0+%o5]0x80,%f16	! %f16 = 4960bfff ffffffff
!	Mem[0000000010181408] = b4000000, %f13 = 5dbf5204
	lda	[%i6+%o4]0x80,%f13	! %f13 = b4000000
!	Mem[0000000010081420] = e139503d, %l1 = 00000000ffffffdd
	lduwa	[%i2+0x020]%asi,%l1	! %l1 = 00000000e139503d
!	Mem[000000001000142c] = 20dd659f, %f14 = 00ff0000
	lda	[%i0+0x02c]%asi,%f14	! %f14 = 20dd659f
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = ffffffff, %l2 = 00000000ffffffff
	ldstuba	[%i6+%o5]0x81,%l2	! %l2 = 000000ff000000ff

p0_label_164:
!	%l7 = 0000000000000063, Mem[0000000030041410] = 8900bfffa90cadac
	stxa	%l7,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000000000000063
!	Mem[0000000030041408] = dd000000, %l1 = 00000000e139503d
	swapa	[%i1+%o4]0x81,%l1	! %l1 = 00000000dd000000
!	%f10 = 425aeabe 0e541a91, Mem[0000000010101408] = d6000000 00000000
	stda	%f10,[%i4+%o4]0x80	! Mem[0000000010101408] = 425aeabe 0e541a91
!	Mem[00000000100c1408] = 00d60000, %l5 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%f28 = 000000b4, Mem[0000000010001400] = 7e6049ff
	sta	%f28,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000b4
!	Mem[0000000010101400] = 24d7ffff, %l2 = 00000000000000ff
	swapa	[%i4+%g0]0x80,%l2	! %l2 = 0000000024d7ffff
!	Mem[0000000030181410] = ffffffff, %l1 = 00000000dd000000
	swapa	[%i6+%o5]0x89,%l1	! %l1 = 00000000ffffffff
!	%l0 = 00000000ffbf0089, Mem[0000000010041400] = d6000000
	stwa	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = ffbf0089
!	%l0 = 00000000ffbf0089, Mem[0000000030181400] = 00000000000000ff
	stxa	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000ffbf0089
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff000000, %f4  = 00000000
	lda	[%i4+%g0]0x88,%f4 	! %f4 = ff000000

p0_label_165:
!	Mem[00000000201c0000] = 5f024c08, %l2 = 0000000024d7ffff
	ldsh	[%o0+%g0],%l2		! %l2 = 0000000000005f02
!	Mem[0000000010081400] = 00000048, %l2 = 0000000000005f02
	lduha	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = 00006633, %l2 = 0000000000000000
	lduba	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%f25 = ff000099, %f29 = 5063fba2, %f2  = d6000000
	fdivs	%f25,%f29,%f2 		! %f2  = ee0fbb91
!	Mem[0000000030041410] = 0000000000000063, %f30 = f6002dd6 63ace9a5
	ldda	[%i1+%o5]0x89,%f30	! %f30 = 00000000 00000063
!	%f1  = 000000ff, %f21 = 49000000
	fcmps	%fcc0,%f1 ,%f21		! %fcc0 = 1
!	Mem[00000000201c0000] = 5f024c08, %l6 = ffffffffffffffff
	ldub	[%o0+%g0],%l6		! %l6 = 000000000000005f
!	Mem[0000000010041400] = ffbf0089, %l6 = 000000000000005f
	lduha	[%i1+%g0]0x80,%l6	! %l6 = 000000000000ffbf
!	Mem[00000000100c1400] = ffff0000, %l4 = 0000000000000048
	ldsba	[%i3+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l6 = 000000000000ffbf, Mem[0000000010041426] = ddffffff, %asi = 80
	stba	%l6,[%i1+0x026]%asi	! Mem[0000000010041424] = ddffbfff

p0_label_166:
!	%l4 = ffffffffffffffff, Mem[0000000030141408] = 55045c7dffffffff
	stxa	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffffffffffff
!	%l4 = ffffffffffffffff, Mem[0000000010101406] = 00000000
	sth	%l4,[%i4+0x006]		! Mem[0000000010101404] = 0000ffff
!	%f12 = 000000d6 b4000000, %l5 = 0000000000000000
!	Mem[0000000010001400] = 000000b4ffffffff
	stda	%f12,[%i0+%l5]ASI_PST8_PL ! Mem[0000000010001400] = 000000b4ffffffff
!	%f3  = 00000000, Mem[0000000010081400] = 48000000
	sta	%f3 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	%l1 = 00000000ffffffff, %l2 = 0000000000000000, %l4 = ffffffffffffffff
	addc	%l1,%l2,%l4		! %l4 = 00000000ffffffff
!	Mem[00000000100c142c] = 000000ff, %l5 = 0000000000000000
	ldstub	[%i3+0x02c],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010001400] = b4000000, %l0 = 00000000ffbf0089
	ldstuba	[%i0+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[00000000100c1420] = ac990448ce32d083
	stx	%l0,[%i3+0x020]		! Mem[00000000100c1420] = 0000000000000000
!	%l6 = 000000000000ffbf, Mem[0000000030181410] = 000000dd
	stha	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = ffbf00dd
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000000, %l4 = 00000000ffffffff
	ldsha	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000

p0_label_167:
!	Mem[0000000010001430] = ff006de9, %l6 = 000000000000ffbf
	ldsha	[%i0+0x032]%asi,%l6	! %l6 = 0000000000006de9
!	Mem[00000000201c0000] = 5f024c08, %l1 = 00000000ffffffff
	ldsba	[%o0+0x001]%asi,%l1	! %l1 = 0000000000000002
!	Mem[0000000010141400] = 0000663300000000, %l4 = 0000000000000000
	ldxa	[%i5+%g0]0x80,%l4	! %l4 = 0000663300000000
!	Mem[0000000030041408] = 3d5039e1, %l7 = 0000000000000063
	lduha	[%i1+%o4]0x89,%l7	! %l7 = 00000000000039e1
!	Mem[0000000010181410] = ffffffdd, %f12 = 000000d6
	lda	[%i6+%o5]0x80,%f12	! %f12 = ffffffdd
!	Mem[0000000030001400] = ddffffff, %l7 = 00000000000039e1
	lduwa	[%i0+%g0]0x81,%l7	! %l7 = 00000000ddffffff
!	Mem[00000000300c1408] = ffffffff, %l5 = 0000000000000000
	ldsha	[%i3+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010001400] = ffffffffb40000ff, %l6 = 0000000000006de9
	ldxa	[%i0+%g0]0x88,%l6	! %l6 = ffffffffb40000ff
!	Mem[0000000010141424] = ffffff9d, %l0 = 0000000000000000
	lduw	[%i5+0x024],%l0		! %l0 = 00000000ffffff9d
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffffff, Mem[0000000021800040] = 9affd022
	stb	%l5,[%o3+0x040]		! Mem[0000000021800040] = ffffd022

p0_label_168:
!	%l4 = 00000000, %l5 = ffffffff, Mem[0000000010001410] = ffbf6049 ffffffff
	stda	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 ffffffff
!	%f31 = 00000063, Mem[00000000100c1410] = ffff0000
	sta	%f31,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000063
!	%l5 = ffffffffffffffff, Mem[00000000201c0000] = 5f024c08
	stb	%l5,[%o0+%g0]		! Mem[00000000201c0000] = ff024c08
!	Mem[0000000010141438] = fff95f02, %l7 = 00000000ddffffff
	swap	[%i5+0x038],%l7		! %l7 = 00000000fff95f02
!	%l4 = 00000000, %l5 = ffffffff, Mem[0000000010041410] = ff000000 7eec58ff
	std	%l4,[%i1+%o5]		! Mem[0000000010041410] = 00000000 ffffffff
!	Mem[00000000300c1400] = ff000000, %l7 = 00000000fff95f02
	swapa	[%i3+%g0]0x81,%l7	! %l7 = 00000000ff000000
!	Mem[00000000300c1400] = 025ff9ff, %l5 = ffffffffffffffff
	ldstuba	[%i3+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	%l6 = b40000ff, %l7 = ff000000, Mem[0000000010141418] = ff583e7e ffbf607e
	std	%l6,[%i5+0x018]		! Mem[0000000010141418] = b40000ff ff000000
!	%l6 = ffffffffb40000ff, Mem[0000000010101400] = ff000000
	stwa	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = b40000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000000, %l6 = ffffffffb40000ff
	ldswa	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000

p0_label_169:
!	Mem[0000000010081400] = 7f000000 00000000, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000 000000007f000000
!	Mem[0000000010001410] = ffffffff 00000000, %l0 = ffffff9d, %l1 = 00000002
	ldda	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000000 00000000ffffffff
!	Mem[0000000030101408] = ffffffff00000000, %f6  = 8900bfff a90cadac
	ldda	[%i4+%o4]0x81,%f6 	! %f6  = ffffffff 00000000
!	Mem[000000001008143c] = 6de02ca5, %l0 = 0000000000000000
	lduha	[%i2+0x03e]%asi,%l0	! %l0 = 0000000000002ca5
!	Mem[0000000010001400] = b40000ff, %l4 = 0000000000000000
	lduha	[%i0+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101410] = 000000b4, %l1 = 00000000ffffffff
	ldswa	[%i4+%o5]0x80,%l1	! %l1 = 00000000000000b4
!	Mem[0000000030041410] = 63000000 00000000, %l4 = 000000ff, %l5 = 7f000000
	ldda	[%i1+%o5]0x81,%l4	! %l4 = 0000000063000000 0000000000000000
!	Mem[0000000010081408] = ff002bee, %l1 = 00000000000000b4
	ldsha	[%i2+%o4]0x80,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000010001430] = ff006de9, %l2 = 0000000000000000
	ldswa	[%i0+0x030]%asi,%l2	! %l2 = ffffffffff006de9
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = ee2b00ff, %l3 = 000000007e6049ff
	ldstuba	[%i2+%o4]0x88,%l3	! %l3 = 000000ff000000ff

p0_label_170:
!	%l6 = 0000000000000000, Mem[0000000030101408] = ffffffff
	stwa	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	Mem[00000000100c1400] = 0000ffff, %l1 = ffffffffffffff00
	swapa	[%i3+%g0]0x88,%l1	! %l1 = 000000000000ffff
!	%l4 = 0000000063000000, Mem[0000000030081400] = 000000dd
	stwa	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 63000000
!	%l0 = 0000000000002ca5, Mem[0000000030101410] = ffffffff
	stba	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = a5ffffff
!	%l6 = 0000000000000000, Mem[0000000030101400] = 5063fba2
	stha	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = 50630000
!	Mem[0000000010001400] = b40000ff, %l7 = 00000000ff000000
	swapa	[%i0+%g0]0x88,%l7	! %l7 = 00000000b40000ff
!	%f12 = ffffffdd b4000000, %l4 = 0000000063000000
!	Mem[0000000010041400] = ffbf008900000000
	stda	%f12,[%i1+%l4]ASI_PST32_PL ! Mem[0000000010041400] = ffbf008900000000
!	Mem[00000000300c1400] = fff95f02, %l1 = 000000000000ffff
	swapa	[%i3+%g0]0x81,%l1	! %l1 = 00000000fff95f02
!	Mem[0000000010081408] = ee2b00ff, %l6 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l6	! %l6 = 00000000ee2b00ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ac87ff56, %l4 = 0000000063000000
	ldswa	[%i0+%o4]0x88,%l4	! %l4 = ffffffffac87ff56

p0_label_171:
!	Mem[0000000030001400] = ddffffff, %l6 = 00000000ee2b00ff
	lduha	[%i0+%g0]0x81,%l6	! %l6 = 000000000000ddff
!	Mem[000000001008142c] = 5063fba2, %l6 = 000000000000ddff
	ldsha	[%i2+0x02c]%asi,%l6	! %l6 = 0000000000005063
!	Mem[0000000010141400] = 00006633 00000000, %l4 = ac87ff56, %l5 = 00000000
	ldda	[%i5+%g0]0x80,%l4	! %l4 = 0000000000006633 0000000000000000
!	Mem[00000000300c1408] = ffffffff, %l7 = 00000000b40000ff
	ldswa	[%i3+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030001410] = 000000ff, %l4 = 0000000000006633
	ldsba	[%i0+%o5]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c1414] = 7e6049ff, %l2 = ffffffffff006de9
	ldsb	[%i3+0x015],%l2		! %l2 = 0000000000000060
!	%l3 = 00000000000000ff, %l5 = 0000000000000000, %l2 = 0000000000000060
	orn	%l3,%l5,%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010181408] = 000000b4, %l4 = ffffffffffffffff
	ldsba	[%i6+%o4]0x88,%l4	! %l4 = ffffffffffffffb4
!	Mem[0000000010141434] = ffbf607e, %l6 = 0000000000005063
	lduwa	[%i5+0x034]%asi,%l6	! %l6 = 00000000ffbf607e
!	Starting 10 instruction Store Burst
!	%f4  = ff000000 33660000, Mem[0000000010001438] = 0040009c ff000099
	std	%f4 ,[%i0+0x038]	! Mem[0000000010001438] = ff000000 33660000

p0_label_172:
!	%l0 = 0000000000002ca5, Mem[0000000030081410] = 000000ff
	stha	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 00002ca5
!	Mem[0000000010141400] = 33660000, %l2 = ffffffffffffffff
	swapa	[%i5+%g0]0x88,%l2	! %l2 = 0000000033660000
!	%f22 = ffffffdd, Mem[0000000010101410] = 000000b4
	sta	%f22,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffffdd
!	%f6  = ffffffff 00000000, %l2 = 0000000033660000
!	Mem[0000000010001400] = 000000ffffffffff
	stda	%f6,[%i0+%l2]ASI_PST32_PL ! Mem[0000000010001400] = 000000ffffffffff
!	%l3 = 00000000000000ff, Mem[0000000030001400] = ffffffdd
	stba	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffffff
!	%f24 = 0040009c ff000099, %l0 = 0000000000002ca5
!	Mem[0000000010141418] = b40000ffff000000
	add	%i5,0x018,%g1
	stda	%f24,[%g1+%l0]ASI_PST32_P ! Mem[0000000010141418] = b40000ffff000099
!	Code Fragment 3
p0_fragment_10:
!	%l0 = 0000000000002ca5
	setx	0xc024fd9fb362ca94,%g7,%l0 ! %l0 = c024fd9fb362ca94
!	%l1 = 00000000fff95f02
	setx	0x6a38982072b23449,%g7,%l1 ! %l1 = 6a38982072b23449
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = c024fd9fb362ca94
	setx	0xcb326267aa3da3c7,%g7,%l0 ! %l0 = cb326267aa3da3c7
!	%l1 = 6a38982072b23449
	setx	0x919402785999d482,%g7,%l1 ! %l1 = 919402785999d482
!	%l7 = ffffffffffffffff, Mem[0000000010081410] = 00ff0000
	stha	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = ffff0000
!	%f2  = ee0fbb91, %f18 = b4000000
	fcmps	%fcc2,%f2 ,%f18		! %fcc2 = 1
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ffbf00dd dd9dc0ff, %l2 = 33660000, %l3 = 000000ff
	ldda	[%i6+%o5]0x81,%l2	! %l2 = 00000000ffbf00dd 00000000dd9dc0ff

p0_label_173:
!	Mem[0000000030141408] = ffffffffffffffff, %l6 = 00000000ffbf607e
	ldxa	[%i5+%o4]0x89,%l6	! %l6 = ffffffffffffffff
!	%f26 = 3d702fb7, %f5  = 33660000, %f0  = ff583e7e
	fsubs	%f26,%f5 ,%f0 		! %f0  = 3d702fa9
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000010081400] = 00000000 0000007f 00000000 ffffffff
!	Mem[0000000010081410] = ffff0000 00000000 acad0ca9 c193a468
!	Mem[0000000010081420] = e139503d 8ea847d9 f8ffffff 5063fba2
!	Mem[0000000010081430] = a675a8b0 7cfb0e7c 55045c7d 6de02ca5
	ldda	[%i2]ASI_BLK_AIUP,%f16	! Block Load from 0000000010081400
!	Mem[0000000010141410] = 000000ff, %l0 = cb326267aa3da3c7
	ldsba	[%i5+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010081400] = 000000000000007f, %f8  = ffffffdd ffffffff
	ldda	[%i2+%g0]0x80,%f8 	! %f8  = 00000000 0000007f
!	Mem[0000000010101408] = 425aeabe, %l1 = 919402785999d482
	lduba	[%i4+%o4]0x80,%l1	! %l1 = 0000000000000042
!	Mem[0000000010141408] = d6000000, %l4 = ffffffffffffffb4
	lduwa	[%i5+%o4]0x80,%l4	! %l4 = 00000000d6000000
!	Mem[0000000030141400] = 3c882df0a2fb6350, %l3 = 00000000dd9dc0ff
	ldxa	[%i5+%g0]0x89,%l3	! %l3 = 3c882df0a2fb6350
!	Mem[00000000300c1410] = 7e3e58ff, %l3 = 3c882df0a2fb6350
	lduba	[%i3+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (30)
!	%l3 = 00000000000000ff, Mem[0000000010081410] = 0000ffff
	stba	%l3,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000ffff

p0_label_174:
!	%l5 = 0000000000000000, Mem[0000000030101408] = 00000000
	stba	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	%l1 = 0000000000000042, immed = 000001af, %y  = 5f8fd376
	smul	%l1,0x1af,%l4		! %l4 = 0000000000006f1e, %y = 00000000
!	Mem[0000000030081408] = 00d60000, %l2 = 00000000ffbf00dd
	swapa	[%i2+%o4]0x81,%l2	! %l2 = 0000000000d60000
!	%l0 = ffffffffffffffff, Mem[0000000010141408] = 000000d6
	stha	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000ffff
!	%l5 = 0000000000000000, Mem[0000000010001400] = 000000ffffffffff, %asi = 80
	stxa	%l5,[%i0+0x000]%asi	! Mem[0000000010001400] = 0000000000000000
!	%f18 = 00000000 ffffffff, Mem[0000000010101410] = ddffffff a2fb6350
	stda	%f18,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000 ffffffff
!	%l6 = ffffffffffffffff, Mem[00000000211c0000] = 60ff85d2
	sth	%l6,[%o2+%g0]		! Mem[00000000211c0000] = ffff85d2
!	%l1 = 0000000000000042, Mem[0000000030001408] = 025ff9ff
	stwa	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000042
!	%l3 = 00000000000000ff, Mem[0000000010001408] = 56ff87ac
	stwa	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00001b00, %l0 = ffffffffffffffff
	lduba	[%i6+%o4]0x89,%l0	! %l0 = 0000000000000000

p0_label_175:
!	%l2 = 0000000000d60000, immd = fffffffffffffeab, %l4 = 0000000000006f1e
	udivx	%l2,-0x155,%l4		! %l4 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l0 = 0000000000000000
	ldsba	[%i4+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001400] = ffffffff, %f29 = 7cfb0e7c
	lda	[%i0+%g0]0x89,%f29	! %f29 = ffffffff
!	Mem[0000000010001408] = ff000000, %l2 = 0000000000d60000
	ldsba	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Randomly selected nop
	nop
!	Mem[0000000030001410] = 000000ff000000ff, %l1 = 0000000000000042
	ldxa	[%i0+%o5]0x89,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010181400] = 000066b3dd9dc0ff, %f2  = ee0fbb91 00000000
	ldda	[%i6+%g0]0x80,%f2 	! %f2  = 000066b3 dd9dc0ff
!	Mem[0000000030141400] = 3c882df0a2fb6350, %l7 = ffffffffffffffff
	ldxa	[%i5+%g0]0x89,%l7	! %l7 = 3c882df0a2fb6350
!	Mem[00000000300c1408] = ff49607effffffff, %l1 = 000000ff000000ff
	ldxa	[%i3+%o4]0x89,%l1	! %l1 = ff49607effffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 00006350, %l6 = ffffffffffffffff
	swapa	[%i4+%g0]0x81,%l6	! %l6 = 0000000000006350

p0_label_176:
!	Mem[00000000300c1400] = ffff0000, %l1 = ff49607effffffff
	ldstuba	[%i3+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%l6 = 0000000000006350, Mem[0000000030101410] = a5ffffffd6000000
	stxa	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000000000006350
!	Mem[0000000030181408] = 001b0000, %l6 = 0000000000006350
	ldstuba	[%i6+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	%f2  = 000066b3 dd9dc0ff, %l2 = 0000000000000000
!	Mem[0000000030081408] = ffbf00dda90cadac
	add	%i2,0x008,%g1
	stda	%f2,[%g1+%l2]ASI_PST32_S ! Mem[0000000030081408] = ffbf00dda90cadac
!	%f21 = 00000000, Mem[0000000030101400] = ffffffff
	sta	%f21,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	%l0 = 0000000000000000, Mem[0000000030181400] = ffbf0089
	stwa	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	Code Fragment 3
p0_fragment_11:
!	%l0 = 0000000000000000
	setx	0x24e33b38756a7b31,%g7,%l0 ! %l0 = 24e33b38756a7b31
!	%l1 = 0000000000000000
	setx	0xc6a734585bb86c1d,%g7,%l1 ! %l1 = c6a734585bb86c1d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 24e33b38756a7b31
	setx	0x6e1e4ed7c08f13e6,%g7,%l0 ! %l0 = 6e1e4ed7c08f13e6
!	%l1 = c6a734585bb86c1d
	setx	0x5b7b523f92728d91,%g7,%l1 ! %l1 = 5b7b523f92728d91
!	Mem[0000000010001410] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i0+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041410] = 63000000, %l3 = 0000000000000000
	ldstuba	[%i1+%o5]0x81,%l3	! %l3 = 00000063000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = b4000000, %l3 = 0000000000000063
	lduba	[%i6+%o4]0x80,%l3	! %l3 = 00000000000000b4

p0_label_177:
!	Mem[0000000030041400] = ffffffff, %l7 = 3c882df0a2fb6350
	ldsha	[%i1+%g0]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010081408] = 00000000, %l7 = ffffffffffffffff
	ldsha	[%i2+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l5 = 0000000000000000
	lduha	[%i5+%o5]0x81,%l5	! %l5 = 0000000000000000
!	%l4 = 0000000000000000, imm = 0000000000000867, %l7 = 0000000000000000
	add	%l4,0x867,%l7		! %l7 = 0000000000000867
!	Mem[00000000201c0000] = ff024c08, %l4 = 0000000000000000
	ldsba	[%o0+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c1408] = ffd60000, %f16 = 00000000
	lda	[%i3+%o4]0x80,%f16	! %f16 = ffd60000
!	Mem[0000000010001418] = 2bee0573, %l6 = 0000000000000000
	lduwa	[%i0+0x018]%asi,%l6	! %l6 = 000000002bee0573
!	Mem[000000001004142c] = fffffff8, %l0 = 6e1e4ed7c08f13e6
	ldsb	[%i1+0x02c],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000030001408] = ff000000 00000042, %l0 = ffffffff, %l1 = 92728d91
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000042 00000000ff000000
!	Starting 10 instruction Store Burst
!	%f20 = ffff0000 00000000, Mem[00000000300c1400] = ff00ffff 00000080
	stda	%f20,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffff0000 00000000

p0_label_178:
!	%l6 = 000000002bee0573, Mem[0000000030141408] = ffffffffffffffff
	stxa	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000002bee0573
!	Mem[00000000300c1400] = ffff0000, %l0 = 0000000000000042
	swapa	[%i3+%g0]0x81,%l0	! %l0 = 00000000ffff0000
!	Mem[0000000010181424] = 2bee0573, %l5 = 0000000000000000
	swap	[%i6+0x024],%l5		! %l5 = 000000002bee0573
!	%l2 = 0000000000000000, Mem[000000001010141d] = f2182fdc, %asi = 80
	stba	%l2,[%i4+0x01d]%asi	! Mem[000000001010141c] = f2002fdc
!	%l4 = ffffffff, %l5 = 2bee0573, Mem[0000000030181400] = 00000000 00000000
	stda	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = ffffffff 2bee0573
!	%l1 = 00000000ff000000, Mem[0000000010041408] = ff000000
	stba	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	Mem[00000000100c1410] = 00000063, %l7 = 0000000000000867
	ldstuba	[%i3+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	%l1 = 00000000ff000000, Mem[00000000211c0001] = ffff85d2, %asi = 80
	stba	%l1,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff0085d2
!	%l3 = 00000000000000b4, Mem[0000000030101410] = 00000000
	stha	%l3,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000b4
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (31)
!	Mem[0000000030101400] = 00000000 00000000 00000000 00000000
!	Mem[0000000030101410] = b4000000 00006350 0e26a88e 3d5039e1
!	Mem[0000000030101420] = a77aa217 0fc18655 dd63fba2 f02d8855
!	Mem[0000000030101430] = d7610eb5 918ccb87 76e1320a 7827e7ec
	ldda	[%i4]ASI_BLK_SL,%f0	! Block Load from 0000000030101400

p0_label_179:
!	Mem[0000000030181408] = 00001bff, %l3 = 00000000000000b4
	lduba	[%i6+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000211c0000] = ff0085d2, %l5 = 000000002bee0573
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000010181420] = 5037e299, %l4 = ffffffffffffffff
	ldsha	[%i6+0x022]%asi,%l4	! %l4 = ffffffffffffe299
!	Mem[00000000211c0000] = ff0085d2, %l4 = ffffffffffffe299
	ldub	[%o2+0x001],%l4		! %l4 = 0000000000000000
!	Mem[0000000010141400] = ffffffff, %l2 = 0000000000000000
	lduwa	[%i5+%g0]0x80,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000030181408] = 00001bff, %l0 = 00000000ffff0000
	ldsha	[%i6+%o4]0x89,%l0	! %l0 = 0000000000001bff
!	%f22 = acad0ca9, %f21 = 00000000, %f26 = f8ffffff
	fmuls	%f22,%f21,%f26		! %f26 = 80000000
!	Mem[0000000010081410] = 0000ffff, %l4 = 0000000000000000
	lduha	[%i2+%o5]0x88,%l4	! %l4 = 000000000000ffff
!	Mem[00000000201c0000] = ff024c08, %l0 = 0000000000001bff
	ldsb	[%o0+0x001],%l0		! %l0 = 0000000000000002
!	Starting 10 instruction Store Burst
!	%f18 = 00000000 ffffffff, %l2 = 00000000ffffffff
!	Mem[0000000010001410] = ff000000ffffffff
	add	%i0,0x010,%g1
	stda	%f18,[%g1+%l2]ASI_PST16_P ! Mem[0000000010001410] = 00000000ffffffff

p0_label_180:
!	%l2 = 00000000ffffffff, Mem[00000000100c1414] = 7e6049ff, %asi = 80
	stba	%l2,[%i3+0x014]%asi	! Mem[00000000100c1414] = ff6049ff
!	%l6 = 000000002bee0573, Mem[0000000010001410] = 00000000
	stba	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000073
!	Mem[0000000021800081] = f6ff7b7d, %l6 = 000000002bee0573
	ldstuba	[%o3+0x081]%asi,%l6	! %l6 = 000000ff000000ff
!	%f23 = c193a468, Mem[0000000010181428] = 3d702fb7
	sta	%f23,[%i6+0x028]%asi	! Mem[0000000010181428] = c193a468
!	%l3 = 00000000000000ff, Mem[0000000030141400] = 5063fba2f02d883c
	stxa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000000000ff
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000030081410] = 00002ca5 bea1efff
	stda	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff 00000000
!	Mem[0000000010001400] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	%l2 = 00000000ffffffff, Mem[0000000010081408] = 00000000ffffffff
	stxa	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000ffffffff
!	Mem[00000000218000c1] = 6fd44ce8, %l2 = 00000000ffffffff
	ldstub	[%o3+0x0c1],%l2		! %l2 = 000000d4000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ffff000000000000, %f18 = 00000000 ffffffff
	ldda	[%i2+%o5]0x80,%f18	! %f18 = ffff0000 00000000

p0_label_181:
!	Mem[0000000010041424] = ddffbfff, %l1 = 00000000ff000000
	lduh	[%i1+0x026],%l1		! %l1 = 000000000000bfff
!	Mem[00000000300c1410] = 7e60bfff7e3e58ff, %f24 = e139503d 8ea847d9
	ldda	[%i3+%o5]0x89,%f24	! %f24 = 7e60bfff 7e3e58ff
!	Mem[0000000021800180] = 4bedbd9f, %l6 = 00000000000000ff
	lduha	[%o3+0x180]%asi,%l6	! %l6 = 0000000000004bed
!	Mem[0000000010101410] = ffffffff 00000000, %l4 = 0000ffff, %l5 = ffffff00
	ldda	[%i4+%o5]0x80,%l4	! %l4 = 00000000ffffffff 0000000000000000
!	Mem[00000000201c0000] = ff024c08, %l6 = 0000000000004bed
	ldsba	[%o0+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000100c143c] = 6705d656, %f24 = 7e60bfff
	lda	[%i3+0x03c]%asi,%f24	! %f24 = 6705d656
!	Mem[0000000010181408] = f8ffffff 000000b4, %l2 = 000000d4, %l3 = 000000ff
	ldda	[%i6+%o4]0x88,%l2	! %l2 = 00000000000000b4 00000000f8ffffff
!	Mem[0000000010141408] = ffff0000, %f23 = c193a468
	lda	[%i5+%o4]0x80,%f23	! %f23 = ffff0000
!	Mem[0000000010141408] = ffff000000000000, %l1 = 000000000000bfff
	ldx	[%i5+%o4],%l1		! %l1 = ffff000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000030181408] = ff1b0000025ff9ff
	stxa	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000000000000000

p0_label_182:
!	Mem[0000000010081400] = 00000000, %l6 = ffffffffffffffff
	ldstuba	[%i2+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	%f28 = a675a8b0 ffffffff, Mem[0000000010001408] = 000000ff 000000ff
	stda	%f28,[%i0+0x008]%asi	! Mem[0000000010001408] = a675a8b0 ffffffff
!	%l2 = 00000000000000b4, Mem[00000000100c1410] = ff000063
	stwa	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000b4
!	Mem[0000000030001410] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030081410] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030181410] = dd00bfff, %l2 = 00000000000000b4
	swapa	[%i6+%o5]0x89,%l2	! %l2 = 00000000dd00bfff
!	%f3  = 00000000, %f22 = acad0ca9, %f29 = ffffffff
	fdivs	%f3 ,%f22,%f29		! %f29 = 80000000
!	%l0 = 0000000000000002, Mem[0000000010041408] = 00000000
	stwa	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000002
!	%l2 = 00000000dd00bfff, Mem[0000000030041410] = ff000000
	stba	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 0000000000000049, %l2 = 00000000dd00bfff
	ldxa	[%i5+%o5]0x81,%l2	! %l2 = 0000000000000049

p0_label_183:
!	Mem[0000000010081410] = ffff0000, %l3 = 00000000f8ffffff
	ldsha	[%i2+%o5]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000100c1400] = 0000ff63ffffff00, %f18 = ffff0000 00000000
	ldda	[%i3+%g0]0x88,%f18	! %f18 = 0000ff63 ffffff00
!	Mem[0000000010141400] = ffffffff 00000000, %l0 = 00000002, %l1 = 00000000
	ldda	[%i5+%g0]0x80,%l0	! %l0 = 00000000ffffffff 0000000000000000
!	Mem[0000000030141408] = 000000002bee0573, %f22 = acad0ca9 ffff0000
	ldda	[%i5+%o4]0x81,%f22	! %f22 = 00000000 2bee0573
!	Mem[00000000100c1410] = 000000b4 ff6049ff, %l2 = 00000049, %l3 = ffffffff
	ldd	[%i3+%o5],%l2		! %l2 = 00000000000000b4 00000000ff6049ff
!	Mem[0000000010181410] = ddffffff, %l6 = 00000000000000ff
	ldsba	[%i6+%o5]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000300c1410] = ff583e7e, %l2 = 00000000000000b4
	ldswa	[%i3+%o5]0x81,%l2	! %l2 = ffffffffff583e7e
!	Mem[0000000010101410] = ffffffff, %f1  = 00000000
	lda	[%i4+%o5]0x88,%f1 	! %f1 = ffffffff
!	Mem[0000000010181410] = ffffffdd, %l5 = 00000000000000ff
	lduha	[%i6+%o5]0x80,%l5	! %l5 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010081400] = ff000000
	stwa	%l1,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000

p0_label_184:
!	%f0  = 00000000 ffffffff 00000000 00000000
!	%f4  = 50630000 000000b4 e139503d 8ea8260e
!	%f8  = 5586c10f 17a27aa7 55882df0 a2fb63dd
!	%f12 = 87cb8c91 b50e61d7 ece72778 0a32e176
	stda	%f0,[%i0]ASI_BLK_SL	! Block Store to 0000000030001400
!	%f21 = 00000000, Mem[0000000010001400] = ff000000
	sta	%f21,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	%f29 = 80000000, Mem[0000000010001410] = 00000073
	sta	%f29,[%i0+%o5]0x88	! Mem[0000000010001410] = 80000000
!	%l7 = 0000000000000000, Mem[0000000030001408] = 00000000
	stha	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	%f20 = ffff0000, Mem[0000000010101400] = ff0000b4
	sta	%f20,[%i4+%g0]0x80	! Mem[0000000010101400] = ffff0000
!	%f23 = 2bee0573, Mem[00000000300c1410] = ff583e7e
	sta	%f23,[%i3+%o5]0x81	! Mem[00000000300c1410] = 2bee0573
!	Mem[00000000100c1400] = ffffff00, %l3 = 00000000ff6049ff
	ldstuba	[%i3+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081410] = ffff0000, %l3 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030041400] = ffffffff, %l0 = 00000000ffffffff
	swapa	[%i1+%g0]0x89,%l0	! %l0 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ffff0000, %l3 = 00000000000000ff
	lduwa	[%i5+%o4]0x80,%l3	! %l3 = 00000000ffff0000

p0_label_185:
!	Mem[0000000010041400] = 8900bfff, %l3 = 00000000ffff0000
	lduwa	[%i1+%g0]0x88,%l3	! %l3 = 000000008900bfff
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000010001408] = a675a8b0, %l7 = 0000000000000000
	lduwa	[%i0+%o4]0x80,%l7	! %l7 = 00000000a675a8b0
!	Mem[0000000010041408] = 68a493c1 02000000, %l2 = ff583e7e, %l3 = 8900bfff
	ldda	[%i1+%o4]0x88,%l2	! %l2 = 0000000002000000 0000000068a493c1
!	Mem[0000000010101408] = 425aeabe, %l3 = 0000000068a493c1
	ldsha	[%i4+%o4]0x80,%l3	! %l3 = 000000000000425a
!	Mem[00000000100c1400] = 0000ff63 ffffffff, %l2 = 02000000, %l3 = 0000425a
	ldda	[%i3+%g0]0x88,%l2	! %l2 = 00000000ffffffff 000000000000ff63
!	Mem[0000000030141400] = 00000000, %l1 = 0000000000000000
	lduwa	[%i5+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = 0000ffff, %l3 = 000000000000ff63
	ldsba	[%i4+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000211c0000] = ff0085d2, %l5 = 000000000000ffff
	ldsb	[%o2+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010181410] = ffffffdd49000000, %f2  = 00000000 00000000
	ldda	[%i6+%o5]0x80,%f2 	! %f2  = ffffffdd 49000000
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffffff, Mem[0000000010081438] = 55045c7d
	stw	%l5,[%i2+0x038]		! Mem[0000000010081438] = ffffffff

p0_label_186:
!	Mem[00000000300c1410] = 7305ee2b, %l1 = 0000000000000000
	swapa	[%i3+%o5]0x89,%l1	! %l1 = 000000007305ee2b
!	%l7 = 00000000a675a8b0, Mem[0000000010041420] = f8ffffffddffbfff
	stx	%l7,[%i1+0x020]		! Mem[0000000010041420] = 00000000a675a8b0
!	%f3  = 49000000, Mem[00000000300c1408] = ffffffff
	sta	%f3 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = 49000000
!	%l5 = ffffffffffffffff, Mem[0000000010141408] = 0000ffff
	stha	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000ffff
!	Mem[0000000030101410] = 000000b4, %l2 = 00000000ffffffff
	ldstuba	[%i4+%o5]0x89,%l2	! %l2 = 000000b4000000ff
!	Mem[0000000010041400] = ffbf008900000000, %l5 = ffffffffffffffff, %l6 = ffffffffffffffff
	casxa	[%i1]0x80,%l5,%l6	! %l6 = ffbf008900000000
!	%l3 = ffffffffffffffff, imm = fffffffffffffddb, %l7 = 00000000a675a8b0
	xor	%l3,-0x225,%l7		! %l7 = 0000000000000224
!	Mem[0000000030101408] = 00000000, %l7 = 0000000000000224
	swapa	[%i4+%o4]0x89,%l7	! %l7 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000030181408] = 00000000
	stha	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 49000000, %l6 = ffbf008900000000
	ldsha	[%i3+%o4]0x81,%l6	! %l6 = 0000000000004900

p0_label_187:
!	Mem[0000000010181418] = f8ffffff, %l6 = 0000000000004900
	ldswa	[%i6+0x018]%asi,%l6	! %l6 = fffffffff8ffffff
!	Mem[0000000010101408] = 425aeabe 0e541a91, %l4 = ffffffff, %l5 = ffffffff
	ldda	[%i4+%o4]0x80,%l4	! %l4 = 00000000425aeabe 000000000e541a91
!	Mem[0000000010141410] = 000000ff, %l4 = 00000000425aeabe
	lduha	[%i5+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141410] = 000000ff, %l2 = 00000000000000b4
	ldsba	[%i5+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010181408] = 000000b4, %l6 = fffffffff8ffffff
	ldswa	[%i6+%o4]0x88,%l6	! %l6 = 00000000000000b4
!	Mem[0000000010081408] = ffffffff00000000, %f22 = 00000000 2bee0573
	ldda	[%i2+%o4]0x88,%f22	! %f22 = ffffffff 00000000
!	%l0 = 00000000ffffffff, immd = fffffffffffffe63, %l1 = 000000007305ee2b
	sdivx	%l0,-0x19d,%l1		! %l1 = ffffffffff615134
!	Mem[0000000010001410] = 00000080, %f10 = 55882df0
	lda	[%i0+%o5]0x80,%f10	! %f10 = 00000080
!	Mem[0000000010141400] = 00000000 ffffffff, %l2 = ffffffff, %l3 = ffffffff
	ldda	[%i5+%g0]0x88,%l2	! %l2 = 00000000ffffffff 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000010041408] = 00000002
	stwa	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000

p0_label_188:
!	%f27 = 5063fba2, %f12 = 87cb8c91
	fsqrts	%f27,%f12		! %f12 = 47f195ee
!	%f2  = ffffffdd 49000000, Mem[0000000030081400] = 63000000 7c0efb7c
	stda	%f2 ,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffdd 49000000
!	%l5 = 000000000e541a91, Mem[0000000030101410] = 000000ff
	stwa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 0e541a91
!	Mem[0000000010001408] = a675a8b0, %l3 = 0000000000000000
	ldstuba	[%i0+%o4]0x80,%l3	! %l3 = 000000a6000000ff
!	%f10 = 00000080 a2fb63dd, Mem[0000000010081400] = 00000000 0000007f
	std	%f10,[%i2+%g0]	! Mem[0000000010081400] = 00000080 a2fb63dd
!	%f9  = 17a27aa7, Mem[0000000030001408] = 00000000
	sta	%f9 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 17a27aa7
!	%l4 = 00000000000000ff, Mem[0000000010001400] = 00000000
	stba	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = ff000000
!	Mem[000000001008143c] = 6de02ca5, %l3 = 00000000000000a6
	ldstuba	[%i2+0x03c]%asi,%l3	! %l3 = 0000006d000000ff
!	%l0 = 00000000ffffffff, Mem[0000000030141410] = 00000000
	stwa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ddffffff, %l0 = 00000000ffffffff
	ldsba	[%i6+%o5]0x88,%l0	! %l0 = ffffffffffffffff

p0_label_189:
!	Mem[0000000010141410] = 000000ff, %l5 = 000000000e541a91
	lduha	[%i5+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081408] = 00000000 ffffffff, %l2 = ffffffff, %l3 = 0000006d
	ldda	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000 00000000ffffffff
!	%l3 = 00000000ffffffff, immd = 00000000000007bb, %l4 = 00000000000000ff
	udivx	%l3,0x7bb,%l4		! %l4 = 0000000000211d9f
!	Mem[0000000030081410] = ff00000000000000, %l5 = 00000000000000ff
	ldxa	[%i2+%o5]0x81,%l5	! %l5 = ff00000000000000
!	Mem[0000000030101410] = 506300000e541a91, %f18 = 0000ff63 ffffff00
	ldda	[%i4+%o5]0x89,%f18	! %f18 = 50630000 0e541a91
!	Mem[0000000030141408] = 00000000, %l6 = 00000000000000b4
	lduwa	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = f8ffffff 000000b4, %l0 = ffffffff, %l1 = ff615134
	ldda	[%i6+%o4]0x88,%l0	! %l0 = 00000000000000b4 00000000f8ffffff
!	Mem[00000000211c0000] = ff0085d2, %l1 = 00000000f8ffffff
	lduba	[%o2+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101430] = 73050000, %f27 = 5063fba2
	lda	[%i4+0x030]%asi,%f27	! %f27 = 73050000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000b4, Mem[0000000030181400] = ffffffff7305ee2b
	stxa	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000000000b4

p0_label_190:
!	%f16 = ffd60000 0000007f 50630000 0e541a91
!	%f20 = ffff0000 00000000 ffffffff 00000000
!	%f24 = 6705d656 7e3e58ff 80000000 73050000
!	%f28 = a675a8b0 80000000 55045c7d 6de02ca5
	stda	%f16,[%i6]ASI_BLK_AIUS	! Block Store to 0000000030181400
!	%l6 = 0000000000000000, Mem[0000000030001410] = b4000000
	stwa	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	%l4 = 0000000000211d9f, Mem[0000000010041438] = a52ce06d000000d6
	stx	%l4,[%i1+0x038]		! Mem[0000000010041438] = 0000000000211d9f
!	%l2 = 00000000, %l3 = ffffffff, Mem[0000000010001410] = 80000000 ffffffff
	stda	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 ffffffff
!	Mem[0000000030041410] = 000000ff, %l0 = 00000000000000b4
	swapa	[%i1+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%f15 = 0a32e176, Mem[0000000010101410] = ffffffff
	sta	%f15,[%i4+%o5]0x80	! Mem[0000000010101410] = 0a32e176
!	%l5 = ff00000000000000, Mem[0000000030101408] = 00000224
	stwa	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	%l4 = 0000000000211d9f, Mem[0000000010081410] = ffff000000000000, %asi = 80
	stxa	%l4,[%i2+0x010]%asi	! Mem[0000000010081410] = 0000000000211d9f
!	Code Fragment 3
p0_fragment_12:
!	%l0 = 00000000000000ff
	setx	0xc5c40e07c08f926e,%g7,%l0 ! %l0 = c5c40e07c08f926e
!	%l1 = 00000000000000ff
	setx	0x3a72f6bfa66b9862,%g7,%l1 ! %l1 = 3a72f6bfa66b9862
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = c5c40e07c08f926e
	setx	0xfb8ea2105175a731,%g7,%l0 ! %l0 = fb8ea2105175a731
!	%l1 = 3a72f6bfa66b9862
	setx	0x25d2b0279ae0ffa9,%g7,%l1 ! %l1 = 25d2b0279ae0ffa9
!	Starting 10 instruction Load Burst
!	Mem[00000000218000c0] = 6fff4ce8, %l6 = 0000000000000000
	ldsb	[%o3+0x0c0],%l6		! %l6 = 000000000000006f

p0_label_191:
!	Mem[0000000030001400] = ffffffff, %l5 = ff00000000000000
	ldsha	[%i0+%g0]0x81,%l5	! %l5 = ffffffffffffffff
!	%f4  = 50630000, %f3  = 49000000, %f12 = 47f195ee
	fadds	%f4 ,%f3 ,%f12		! %f12 = 50630200
!	Mem[0000000030141400] = 00000000000000ff, %l6 = 000000000000006f
	ldxa	[%i5+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081408] = 00000000, %l1 = 25d2b0279ae0ffa9
	lduwa	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101430] = 73050000, %l7 = 0000000000000000
	lduba	[%i4+0x031]%asi,%l7	! %l7 = 0000000000000005
	membar	#Sync			! Added by membar checker (33)
!	Mem[0000000030181400] = 0000d6ff, %l6 = 00000000000000ff
	ldsba	[%i6+%g0]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000300c1408] = 00000049, %f20 = ffff0000
	lda	[%i3+%o4]0x89,%f20	! %f20 = 00000049
!	Mem[0000000010141438] = ddffffff, %l6 = ffffffffffffffff
	ldsha	[%i5+0x03a]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010041424] = a675a8b0, %f17 = 0000007f
	ld	[%i1+0x024],%f17	! %f17 = a675a8b0
!	Starting 10 instruction Store Burst
!	%f4  = 50630000 000000b4, Mem[0000000010101400] = ffff0000 0000ffff
	stda	%f4 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 50630000 000000b4

p0_label_192:
!	Mem[0000000010101400] = 00006350, %l2 = 0000000000000000
	swapa	[%i4+%g0]0x88,%l2	! %l2 = 0000000000006350
!	Mem[0000000030081410] = ff000000, %l1 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l1	! %l1 = 00000000ff000000
!	%l1 = 00000000ff000000, Mem[0000000010041410] = 00000000
	stba	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	Mem[0000000010181400] = 000066b3, %l0 = fb8ea2105175a731
	ldstuba	[%i6+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041408] = 00000000, %l6 = ffffffffffffffff
	swapa	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000000
!	%f2  = ffffffdd, Mem[0000000010101408] = beea5a42
	sta	%f2 ,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffffdd
!	%l7 = 0000000000000005, Mem[00000000100c1405] = 63ff0000, %asi = 80
	stba	%l7,[%i3+0x005]%asi	! Mem[00000000100c1404] = 63050000
!	%l7 = 0000000000000005, Mem[0000000021800000] = bbfff103, %asi = 80
	stha	%l7,[%o3+0x000]%asi	! Mem[0000000021800000] = 0005f103
!	%f19 = 0e541a91, %f2  = ffffffdd
	fcmps	%fcc0,%f19,%f2 		! %fcc0 = 3
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 0a32e17600000000, %l2 = 0000000000006350
	ldxa	[%i4+%o5]0x80,%l2	! %l2 = 0a32e17600000000

p0_label_193:
!	Mem[0000000010101408] = ddffffff 0e541a91, %l2 = 00000000, %l3 = ffffffff
	ldda	[%i4+%o4]0x80,%l2	! %l2 = 00000000ddffffff 000000000e541a91
!	Mem[00000000218000c0] = 6fff4ce8, %l1 = 00000000ff000000
	ldsba	[%o3+0x0c1]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000300c1408] = 49000000 7e6049ff, %l6 = 00000000, %l7 = 00000005
	ldda	[%i3+%o4]0x81,%l6	! %l6 = 0000000049000000 000000007e6049ff
!	Mem[0000000030141410] = ffffffff, %l7 = 000000007e6049ff
	ldsba	[%i5+%o5]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030181408] = 911a540e 00006350, %l2 = ddffffff, %l3 = 0e541a91
	ldda	[%i6+%o4]0x89,%l2	! %l2 = 0000000000006350 00000000911a540e
!	Mem[0000000010181408] = b4000000fffffff8, %l7 = ffffffffffffffff
	ldxa	[%i6+%o4]0x80,%l7	! %l7 = b4000000fffffff8
!	%l6 = 0000000049000000, %l6 = 0000000049000000, %y  = 00000000
	udiv	%l6,%l6,%l1		! %l1 = 0000000000000001
	mov	%l0,%y			! %y = 00000000
!	%f21 = 00000000, %f28 = a675a8b0
	fsqrts	%f21,%f28		! %f28 = 00000000
!	Mem[0000000010141400] = ffffffff, %l3 = 00000000911a540e
	lduha	[%i5+%g0]0x88,%l3	! %l3 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000001, Mem[0000000030101408] = 00000000
	stha	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = 00010000

p0_label_194:
!	Mem[0000000010081430] = a675a8b07cfb0e7c, %l0 = 0000000000000000, %l2 = 0000000000006350
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l0,%l2	! %l2 = a675a8b07cfb0e7c
!	%l0 = 0000000000000000, Mem[0000000020800041] = ff1dc1d1, %asi = 80
	stba	%l0,[%o1+0x041]%asi	! Mem[0000000020800040] = ff00c1d1
!	%l4 = 0000000000211d9f, Mem[0000000030141408] = 00000000
	stwa	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = 00211d9f
!	Mem[00000000211c0001] = ff0085d2, %l7 = b4000000fffffff8
	ldstub	[%o2+0x001],%l7		! %l7 = 00000000000000ff
!	%l4 = 0000000000211d9f, Mem[00000000100c1400] = ffffffff
	stwa	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00211d9f
!	Mem[0000000030041408] = e139503d, %l7 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l7	! %l7 = 000000e1000000ff
!	%l0 = 00000000, %l1 = 00000001, Mem[0000000030141410] = ffffffff 00000049
	stda	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 00000001
!	%f10 = 00000080 a2fb63dd, Mem[00000000300c1408] = 00000049 ff49607e
	stda	%f10,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000080 a2fb63dd
!	Mem[0000000010101408] = ddffffff, %l1 = 0000000000000001
	swapa	[%i4+%o4]0x80,%l1	! %l1 = 00000000ddffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000000, %l1 = 00000000ddffffff
	ldsha	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000000

p0_label_195:
!	Mem[00000000300c1400] = 42000000, %l7 = 00000000000000e1
	lduwa	[%i3+%g0]0x89,%l7	! %l7 = 0000000042000000
!	Mem[0000000010141408] = ffff0000, %l5 = ffffffffffffffff
	lduha	[%i5+%o4]0x80,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030001410] = 00000000, %f11 = a2fb63dd
	lda	[%i0+%o5]0x89,%f11	! %f11 = 00000000
!	%l6 = 0000000049000000, immed = ffffffaf, %y  = 00000000
	smul	%l6,-0x051,%l7		! %l7 = ffffffe8e7000000, %y = ffffffe8
!	Mem[0000000010181400] = ff0066b3, %l2 = a675a8b07cfb0e7c
	lduha	[%i6+%g0]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030101410] = 0e541a91, %l5 = 000000000000ffff
	lduha	[%i4+%o5]0x89,%l5	! %l5 = 0000000000001a91
!	Mem[0000000030141408] = 9f1d2100, %l4 = 0000000000211d9f
	lduba	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041400] = ffffffff450440d6, %f2  = ffffffdd 49000000
	ldda	[%i1+%g0]0x81,%f2 	! %f2  = ffffffff 450440d6
!	Mem[00000000100c1408] = 0000d6ff, %l4 = 0000000000000000
	lduha	[%i3+%o4]0x88,%l4	! %l4 = 000000000000d6ff
!	Starting 10 instruction Store Burst
!	%l2 = 0000ff00, %l3 = 0000ffff, Mem[0000000010101410] = 0a32e176 00000000
	stda	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000ff00 0000ffff

p0_label_196:
!	Mem[00000000211c0001] = ffff85d2, %l2 = 000000000000ff00
	ldstuba	[%o2+0x001]%asi,%l2	! %l2 = 000000ff000000ff
!	%l0 = 0000000000000000, Mem[0000000010041408] = ffffffffc193a468
	stxa	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000000000000000
!	%f21 = 00000000, Mem[0000000010041410] = 00000000
	sta	%f21,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%f16 = ffd60000, Mem[0000000030041408] = 3d5039ff
	sta	%f16,[%i1+%o4]0x89	! Mem[0000000030041408] = ffd60000
!	%l0 = 0000000000000000, Mem[0000000010101400] = 00000000
	stha	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	%f0  = 00000000 ffffffff ffffffff 450440d6
!	%f4  = 50630000 000000b4 e139503d 8ea8260e
!	%f8  = 5586c10f 17a27aa7 00000080 00000000
!	%f12 = 50630200 b50e61d7 ece72778 0a32e176
	stda	%f0,[%i6]ASI_BLK_SL	! Block Store to 0000000030181400
!	%l2 = 00000000000000ff, Mem[0000000010141400] = ffffffff
	stwa	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff
	membar	#Sync			! Added by membar checker (34)
!	Mem[0000000010181408] = 000000b4, %l4 = 000000000000d6ff
	swapa	[%i6+%o4]0x88,%l4	! %l4 = 00000000000000b4
!	Mem[0000000030101408] = 00010000, %l3 = 000000000000ffff
	ldstuba	[%i4+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 0000d6ff, %f18 = 50630000
	lda	[%i6+%o4]0x88,%f18	! %f18 = 0000d6ff

p0_label_197:
!	Mem[0000000010001400] = ff00000000000000, %f10 = 00000080 00000000
	ldda	[%i0+%g0]0x80,%f10	! %f10 = ff000000 00000000
!	Mem[0000000020800000] = ffffba64, %l0 = 0000000000000000
	ldub	[%o1+0x001],%l0		! %l0 = 00000000000000ff
!	Mem[00000000300c1410] = 7e60bfff 00000000, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i3+%o5]0x89,%l2	! %l2 = 0000000000000000 000000007e60bfff
!	Mem[0000000030181408] = 450440d6, %l2 = 0000000000000000
	lduba	[%i6+%o4]0x89,%l2	! %l2 = 00000000000000d6
!	Mem[0000000010141408] = 0000ffff, %f1  = ffffffff
	lda	[%i5+%o4]0x88,%f1 	! %f1 = 0000ffff
!	Mem[0000000020800000] = ffffba64, %l7 = ffffffe8e7000000
	ldsba	[%o1+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030041400] = ffffffff450440d6, %l1 = 0000000000000000
	ldxa	[%i1+%g0]0x81,%l1	! %l1 = ffffffff450440d6
!	Mem[0000000010141400] = ff000000, %l7 = ffffffffffffffff
	ldsha	[%i5+%g0]0x80,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000030101410] = 911a540e, %f7  = 8ea8260e
	lda	[%i4+%o5]0x81,%f7 	! %f7 = 911a540e
!	Starting 10 instruction Store Burst
!	%f8  = 5586c10f 17a27aa7, %l4 = 00000000000000b4
!	Mem[0000000030081410] = 0000000000000000
	add	%i2,0x010,%g1
	stda	%f8,[%g1+%l4]ASI_PST32_S ! Mem[0000000030081410] = 0000000000000000

p0_label_198:
!	Mem[0000000010141400] = 000000ff, %l4 = 00000000000000b4
	ldstuba	[%i5+%g0]0x88,%l4	! %l4 = 000000ff000000ff
!	%l7 = ffffffffffffff00, imm = 0000000000000f3b, %l5 = 0000000000001a91
	andn	%l7,0xf3b,%l5		! %l5 = fffffffffffff000
!	%f12 = 50630200 b50e61d7, Mem[0000000030081400] = 00000049 ddffffff
	stda	%f12,[%i2+%g0]0x81	! Mem[0000000030081400] = 50630200 b50e61d7
!	%l7 = ffffffffffffff00, Mem[0000000010041408] = 00000000
	stwa	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = ffffff00
!	Mem[0000000010181403] = ff0066b3, %l3 = 000000007e60bfff
	ldstuba	[%i6+0x003]%asi,%l3	! %l3 = 000000b3000000ff
!	%l0 = 00000000000000ff, Mem[0000000030101410] = 911a540e
	stba	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = ff1a540e
!	Mem[00000000100c1408] = ffd60000, %l4 = 00000000000000ff
	ldstuba	[%i3+%o4]0x80,%l4	! %l4 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[0000000030181410] = b4000000
	stha	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 00ff0000
!	%f21 = 00000000, Mem[0000000030141400] = 00000000
	sta	%f21,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 000001ff, %f18 = 0000d6ff
	lda	[%i4+%o4]0x89,%f18	! %f18 = 000001ff

p0_label_199:
!	Mem[0000000030141408] = 00211d9f, %l3 = 00000000000000b3
	ldsha	[%i5+%o4]0x81,%l3	! %l3 = 0000000000000021
!	Mem[0000000010081410] = 00000000, %f24 = 6705d656
	lda	[%i2+%o5]0x88,%f24	! %f24 = 00000000
!	Mem[0000000030141408] = 00211d9f2bee0573, %l5 = fffffffffffff000
	ldxa	[%i5+%o4]0x81,%l5	! %l5 = 00211d9f2bee0573
!	Mem[0000000030081408] = ffbf00dd a90cadac, %l0 = 000000ff, %l1 = 450440d6
	ldda	[%i2+%o4]0x81,%l0	! %l0 = 00000000ffbf00dd 00000000a90cadac
!	Mem[0000000030041408] = ffd60000, %l3 = 0000000000000021
	lduha	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[000000001008143c] = ffe02ca5, %l0 = 00000000ffbf00dd
	lduba	[%i2+0x03f]%asi,%l0	! %l0 = 00000000000000a5
!	Mem[0000000030081400] = 00026350, %l0 = 00000000000000a5
	lduba	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000050
!	Mem[0000000010181408] = ffd60000 fffffff8, %l0 = 00000050, %l1 = a90cadac
	ldda	[%i6+0x008]%asi,%l0	! %l0 = 00000000ffd60000 00000000fffffff8
!	Mem[00000000211c0000] = ffff85d2, %l7 = ffffffffffffff00
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l1 = 00000000fffffff8, Mem[0000000010041400] = 000000008900bfff
	stxa	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000fffffff8

p0_label_200:
!	%l7 = ffffffffffffffff, Mem[0000000030001408] = 17a27aa7
	stwa	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffff
!	%f23 = 00000000, Mem[0000000010001410] = 00000000
	sta	%f23,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	%l4 = 00000000000000ff, Mem[0000000030041408] = 0000d6ffe1c74923
	stxa	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000000000ff
!	%l2 = 00000000000000d6, Mem[0000000030181408] = d6400445
	stwa	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000d6
!	Mem[0000000010081408] = 00000000, %l2 = 00000000000000d6
	swapa	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000
!	%l7 = ffffffffffffffff, Mem[0000000030141410] = 00000000
	stwa	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffffff
!	%l4 = 00000000000000ff, Mem[00000000300c1408] = dd63fba280000000
	stxa	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000000000ff
!	Mem[0000000010101408] = 00000001, %l7 = ffffffff, %l1 = fffffff8
	add	%i4,0x08,%g1
	casa	[%g1]0x80,%l7,%l1	! %l1 = 0000000000000001
!	Mem[00000000100c1420] = 00000000, %l2 = 00000000, %l6 = 49000000
	add	%i3,0x20,%g1
	casa	[%g1]0x80,%l2,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ff000000ecff0000, %f16 = ffd60000 a675a8b0
	ldda	[%i5+%o5]0x80,%f16	! %f16 = ff000000 ecff0000

p0_label_201:
!	Mem[00000000300c1408] = 00000000, %l1 = 0000000000000001
	ldswa	[%i3+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = 000000b4, %l6 = 0000000000000000
	lduha	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = 0000000000000000, %f16 = ff000000 ecff0000
	ldda	[%i4+%g0]0x89,%f16	! %f16 = 00000000 00000000
!	%f11 = 00000000, %f18 = 000001ff
	fcmpes	%fcc0,%f11,%f18		! %fcc0 = 1
!	Mem[0000000010181408] = f8ffffff 0000d6ff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i6+%o4]0x88,%l2	! %l2 = 000000000000d6ff 00000000f8ffffff
!	%f16 = 00000000 00000000 000001ff 0e541a91
!	%f20 = 00000049 00000000 ffffffff 00000000
!	%f24 = 00000000 7e3e58ff 80000000 73050000
!	%f28 = 00000000 80000000 55045c7d 6de02ca5
	stda	%f16,[%i6]ASI_BLK_AIUPL	! Block Store to 0000000010181400
!	Mem[0000000030141408] = 9f1d2100, %l0 = 00000000ffd60000
	lduba	[%i5+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l0 = 0000000000000000
	ldsba	[%i1+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l4 = 00000000000000ff
	ldsba	[%i2+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = ffff85d2, %l5 = 00211d9f2bee0573
	ldstuba	[%o2+0x001]%asi,%l5	! %l5 = 000000ff000000ff

p0_label_202:
!	Mem[0000000010041438] = 00000000, %l6 = 0000000000000000
	swap	[%i1+0x038],%l6		! %l6 = 0000000000000000
!	Mem[0000000020800040] = ff00c1d1, %l7 = ffffffffffffffff
	ldstuba	[%o1+0x040]%asi,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030181400] = ffffffff, %l5 = 00000000000000ff
	swapa	[%i6+%g0]0x81,%l5	! %l5 = 00000000ffffffff
!	%f6  = e139503d, Mem[0000000010041410] = 00000000
	sta	%f6 ,[%i1+%o5]0x88	! Mem[0000000010041410] = e139503d
	membar	#Sync			! Added by membar checker (35)
!	Mem[0000000010181410] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i6+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041410] = 3d5039e1, %l5 = 00000000ffffffff
	swapa	[%i1+%o5]0x80,%l5	! %l5 = 000000003d5039e1
!	Mem[0000000030041408] = 00000000, %l2 = 000000000000d6ff
	ldstuba	[%i1+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001408] = ffffffff, %l7 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l7	! %l7 = 00000000ffffffff
!	Code Fragment 4
p0_fragment_13:
!	%l0 = 0000000000000000
	setx	0x9196a2f7ef38e9a7,%g7,%l0 ! %l0 = 9196a2f7ef38e9a7
!	%l1 = 0000000000000000
	setx	0x0b96d230423a6067,%g7,%l1 ! %l1 = 0b96d230423a6067
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9196a2f7ef38e9a7
	setx	0xe8060bf7d8b3d65b,%g7,%l0 ! %l0 = e8060bf7d8b3d65b
!	%l1 = 0b96d230423a6067
	setx	0xb811eeb8062c98b9,%g7,%l1 ! %l1 = b811eeb8062c98b9
!	Starting 10 instruction Load Burst
!	%l3 = 00000000f8ffffff, %l4 = 0000000000000000, %l7 = 00000000ffffffff
	xor	%l3,%l4,%l7		! %l7 = 00000000f8ffffff

p0_label_203:
!	Mem[0000000010101410] = 0000ff000000ffff, %l7 = 00000000f8ffffff
	ldxa	[%i4+%o5]0x80,%l7	! %l7 = 0000ff000000ffff
!	%f27 = 73050000, %f28 = 00000000
	fcmps	%fcc3,%f27,%f28		! %fcc3 = 2
!	Mem[0000000030081408] = ffbf00dd, %l5 = 000000003d5039e1
	ldsha	[%i2+%o4]0x81,%l5	! %l5 = ffffffffffffffbf
!	Mem[0000000010081408] = 000000d6, %l7 = 0000ff000000ffff
	ldstuba	[%i2+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000020800040] = ff00c1d1, %l0 = e8060bf7d8b3d65b
	ldub	[%o1+0x041],%l0		! %l0 = 0000000000000000
!	Mem[0000000010181410] = 00000049000000ff, %l6 = 0000000000000000
	ldxa	[%i6+%o5]0x88,%l6	! %l6 = 00000049000000ff
!	Mem[0000000010181408] = 911a540e, %l6 = 00000049000000ff
	ldsha	[%i6+%o4]0x80,%l6	! %l6 = ffffffffffff911a
!	Mem[0000000010001408] = ff75a8b0, %l6 = ffffffffffff911a
	ldsha	[%i0+%o4]0x80,%l6	! %l6 = ffffffffffffff75
!	Mem[0000000010141410] = 0000ffec000000ff, %l6 = ffffffffffffff75
	ldxa	[%i5+%o5]0x88,%l6	! %l6 = 0000ffec000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010141410] = ff000000
	stwa	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000

p0_label_204:
!	Mem[0000000030041410] = b4000000, %l1 = b811eeb8062c98b9
	swapa	[%i1+%o5]0x81,%l1	! %l1 = 00000000b4000000
!	%l2 = 00000000, %l3 = f8ffffff, Mem[00000000300c1408] = 00000000 ff000000
	stda	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000 f8ffffff
!	%l7 = 0000000000000000, Mem[00000000300c1408] = 00000000
	stba	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%l4 = 0000000000000000, Mem[0000000030001408] = 00000000
	stwa	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	%l4 = 0000000000000000, %l2 = 0000000000000000, %l4 = 0000000000000000
	xnor	%l4,%l2,%l4		! %l4 = ffffffffffffffff
!	%l4 = ffffffff, %l5 = ffffffbf, Mem[0000000030141410] = ffffffff 00000001
	stda	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffffff ffffffbf
!	Mem[0000000010141410] = 00000000, %l5 = ffffffffffffffbf
	swapa	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000
!	%f28 = 00000000, Mem[00000000300c1410] = 00000000
	sta	%f28,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	%l6 = 0000ffec000000ff, %l5 = 0000000000000000, %y  = ffffffe8
	sdiv	%l6,%l5,%l0		! Div by zero, %l0 = 0000000000000050
	mov	%l0,%y			! %y = 00000028
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ffffffff, %l7 = 0000000000000000
	lduba	[%i1+%o5]0x88,%l7	! %l7 = 00000000000000ff

p0_label_205:
!	Mem[0000000030101408] = 00000000000001ff, %l0 = 0000000000000028
	ldxa	[%i4+%o4]0x89,%l0	! %l0 = 00000000000001ff
!	Mem[00000000201c0000] = ff024c08, %l4 = ffffffffffffffff
	ldub	[%o0+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010081410] = 00000000, %l5 = 0000000000000000
	ldsha	[%i2+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001400] = ffffffff 00000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i0+%g0]0x81,%l4	! %l4 = 00000000ffffffff 0000000000000000
!	Mem[0000000010081410] = 9f1d210000000000, %l6 = 0000ffec000000ff
	ldxa	[%i2+%o5]0x88,%l6	! %l6 = 9f1d210000000000
!	Mem[0000000010041400] = f8ffffff, %l2 = 0000000000000000
	ldswa	[%i1+%g0]0x80,%l2	! %l2 = fffffffff8ffffff
!	Mem[00000000300c1410] = 00000000, %l7 = 00000000000000ff
	lduha	[%i3+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041438] = 0000000000211d9f, %f18 = 000001ff 0e541a91
	ldd	[%i1+0x038],%f18	! %f18 = 00000000 00211d9f
!	Mem[0000000021800180] = 4bedbd9f, %l4 = 00000000ffffffff
	ldsba	[%o3+0x180]%asi,%l4	! %l4 = 000000000000004b
!	Starting 10 instruction Store Burst
!	Mem[0000000010101420] = 1c5029f5c70d15f3, %l7 = 0000000000000000, %l5 = 0000000000000000
	add	%i4,0x20,%g1
	casxa	[%g1]0x80,%l7,%l5	! %l5 = 1c5029f5c70d15f3

p0_label_206:
!	%f16 = 00000000 00000000, Mem[0000000030041400] = ffffffff d6400445
	stda	%f16,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000 00000000
!	%l7 = 0000000000000000, Mem[0000000010141408] = 0000ffff
	stha	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%l4 = 000000000000004b, Mem[0000000030081408] = ffbf00dd
	stwa	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000004b
!	%l0 = 00000000000001ff, Mem[00000000201c0000] = ff024c08
	sth	%l0,[%o0+%g0]		! Mem[00000000201c0000] = 01ff4c08
!	%l6 = 9f1d210000000000, immed = 00000d7f, %y  = 00000028
	udiv	%l6,0xd7f,%l1		! %l1 = 0000000002f6bcf1
	mov	%l0,%y			! %y = 000001ff
!	Mem[0000000030041410] = 062c98b9, %l2 = fffffffff8ffffff
	swapa	[%i1+%o5]0x81,%l2	! %l2 = 00000000062c98b9
!	Mem[00000000211c0001] = ffff85d2, %l4 = 000000000000004b
	ldstub	[%o2+0x001],%l4		! %l4 = 000000ff000000ff
!	Mem[0000000010181438] = a52ce06d, %l7 = 00000000, %l6 = 00000000
	add	%i6,0x38,%g1
	casa	[%g1]0x80,%l7,%l6	! %l6 = 00000000a52ce06d
!	Mem[0000000030141400] = 00000000, %l3 = 00000000f8ffffff
	swapa	[%i5+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff000000 00000000, %l0 = 000001ff, %l1 = 02f6bcf1
	ldda	[%i0+%g0]0x80,%l0	! %l0 = 00000000ff000000 0000000000000000

p0_label_207:
!	Mem[0000000010081410] = 0000000000211d9f, %l1 = 0000000000000000
	ldxa	[%i2+%o5]0x80,%l1	! %l1 = 0000000000211d9f
!	%l4 = 00000000000000ff, imm = 00000000000002c7, %l4 = 00000000000000ff
	add	%l4,0x2c7,%l4		! %l4 = 00000000000003c6
!	Mem[00000000100c1424] = 00000000, %l7 = 0000000000000000
	ldsba	[%i3+0x025]%asi,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = f8ffffff00000000, %l1 = 0000000000211d9f
	ldxa	[%i3+%o4]0x89,%l1	! %l1 = f8ffffff00000000
!	Mem[00000000100c1400] = 00000563 9f1d2100, %l2 = 062c98b9, %l3 = 00000000
	ldda	[%i3+%g0]0x88,%l2	! %l2 = 000000009f1d2100 0000000000000563
!	Mem[00000000100c1400] = 00211d9f, %l4 = 00000000000003c6
	ldswa	[%i3+%g0]0x80,%l4	! %l4 = 0000000000211d9f
!	Mem[0000000030181408] = d6000000, %l2 = 000000009f1d2100
	lduba	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1438] = ffe1f0f2, %f25 = 7e3e58ff
	ld	[%i3+0x038],%f25	! %f25 = ffe1f0f2
!	Mem[0000000010101410] = 0000ff000000ffff, %l0 = 00000000ff000000
	ldxa	[%i4+0x010]%asi,%l0	! %l0 = 0000ff000000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = d6000000, %l1 = f8ffffff00000000
	swapa	[%i6+%o4]0x89,%l1	! %l1 = 00000000d6000000

p0_label_208:
!	Mem[0000000010101410] = 0000ff00, %l0 = 0000ff000000ffff
	swapa	[%i4+%o5]0x80,%l0	! %l0 = 000000000000ff00
!	%f14 = ece72778 0a32e176, %l4 = 0000000000211d9f
!	Mem[0000000010041408] = ffffff0000000000
	add	%i1,0x008,%g1
	stda	%f14,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010041408] = 76e1320a7827e7ec
!	%l1 = 00000000d6000000, imm = fffffffffffffb4c, %l4 = 0000000000211d9f
	xor	%l1,-0x4b4,%l4		! %l4 = ffffffff29fffb4c
!	Mem[0000000030001400] = ffffffff, %l2 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	%l4 = ffffffff29fffb4c, Mem[00000000211c0000] = ffff85d2
	sth	%l4,[%o2+%g0]		! Mem[00000000211c0000] = fb4c85d2
!	%l3 = 0000000000000563, %l7 = 0000000000000000, %l5 = 1c5029f5c70d15f3
	udivx	%l3,%l7,%l5		! Div by zero, %l0 = 000000000000ff50
!	Mem[0000000030141410] = ffffffff, %l5 = 1c5029f5c70d15f3
	ldstuba	[%i5+%o5]0x89,%l5	! %l5 = 000000ff000000ff
!	%f26 = 80000000 73050000, Mem[0000000030141400] = f8ffffff 000000ff
	stda	%f26,[%i5+%g0]0x81	! Mem[0000000030141400] = 80000000 73050000
!	%l1 = 00000000d6000000, Mem[0000000030101400] = 00000000
	stwa	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = d6000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 00000563 9f1d2100, %l0 = 0000ff28, %l1 = d6000000
	ldda	[%i3+%g0]0x88,%l0	! %l0 = 000000009f1d2100 0000000000000563

p0_label_209:
!	Mem[0000000010001410] = 00000000ffffffff, %l2 = 00000000000000ff
	ldxa	[%i0+%o5]0x80,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000010001418] = 2bee0573, %l1 = 0000000000000563
	ldsw	[%i0+0x018],%l1		! %l1 = 000000002bee0573
!	Mem[00000000201c0000] = 01ff4c08, %l3 = 0000000000000563
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = 00000000000001ff
!	Mem[00000000300c1410] = 00000000, %l3 = 00000000000001ff
	lduha	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = ffffffffb0a875ff, %l7 = 0000000000000000
	ldxa	[%i0+%o4]0x88,%l7	! %l7 = ffffffffb0a875ff
!	%l1 = 000000002bee0573, %l3 = 0000000000000000, %l6 = 00000000a52ce06d
	xnor	%l1,%l3,%l6		! %l6 = ffffffffd411fa8c
!	Mem[0000000030141400] = 0000057300000080, %l4 = ffffffff29fffb4c
	ldxa	[%i5+%g0]0x89,%l4	! %l4 = 0000057300000080
!	Mem[0000000010181410] = ff000000, %l6 = ffffffffd411fa8c
	lduwa	[%i6+%o5]0x80,%l6	! %l6 = 00000000ff000000
!	Mem[00000000211c0000] = fb4c85d2, %l1 = 000000002bee0573
	lduh	[%o2+%g0],%l1		! %l1 = 000000000000fb4c
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffb0a875ff, Mem[0000000030001410] = 00000000
	stha	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = 000075ff

p0_label_210:
!	%l0 = 000000009f1d2100, Mem[0000000010001410] = ffffffff00000000
	stxa	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000009f1d2100
!	%f13 = b50e61d7, Mem[0000000030181410] = 00ff0000
	sta	%f13,[%i6+%o5]0x81	! Mem[0000000030181410] = b50e61d7
!	%l5 = 00000000000000ff, Mem[00000000100c1408] = ffd60000
	stba	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffd60000
!	Mem[0000000021800080] = f6ff7b7d, %l3 = 0000000000000000
	ldstub	[%o3+0x080],%l3		! %l3 = 000000f6000000ff
!	%l6 = 00000000ff000000, Mem[00000000218001c0] = ff7e6949, %asi = 80
	stha	%l6,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 00006949
!	Mem[00000000211c0000] = fb4c85d2, %l5 = 00000000000000ff
	ldstub	[%o2+%g0],%l5		! %l5 = 000000fb000000ff
!	%f6  = e139503d 911a540e, Mem[0000000010101408] = 01000000 911a540e
	stda	%f6 ,[%i4+%o4]0x88	! Mem[0000000010101408] = e139503d 911a540e
!	Code Fragment 3
p0_fragment_14:
!	%l0 = 000000009f1d2100
	setx	0x79fbd07f9c7127e2,%g7,%l0 ! %l0 = 79fbd07f9c7127e2
!	%l1 = 000000000000fb4c
	setx	0x0010bef86d5c2a1d,%g7,%l1 ! %l1 = 0010bef86d5c2a1d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 79fbd07f9c7127e2
	setx	0x5ea259a84d30415d,%g7,%l0 ! %l0 = 5ea259a84d30415d
!	%l1 = 0010bef86d5c2a1d
	setx	0x8cab29b05308878c,%g7,%l1 ! %l1 = 8cab29b05308878c
!	Mem[0000000030081408] = 4b000000, %l7 = ffffffffb0a875ff
	ldstuba	[%i2+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ffffffff, %l6 = 00000000ff000000
	lduba	[%i0+%g0]0x89,%l6	! %l6 = 00000000000000ff

p0_label_211:
!	Mem[0000000020800040] = ff00c1d1, %l2 = 00000000ffffffff
	lduha	[%o1+0x040]%asi,%l2	! %l2 = 000000000000ff00
!	%f10 = ff000000, %f12 = 50630200, %f24 = 00000000
	fmuls	%f10,%f12,%f24		! %f24 = ff800000
!	Mem[0000000010081408] = ff0000d6, %l5 = 00000000000000fb
	lduha	[%i2+%o4]0x80,%l5	! %l5 = 000000000000ff00
!	%l5 = 000000000000ff00, %l1 = 8cab29b05308878c, %l2 = 000000000000ff00
	and	%l5,%l1,%l2		! %l2 = 0000000000008700
!	Mem[0000000010041418] = 68a493c1, %l6 = 00000000000000ff
	ldsba	[%i1+0x01a]%asi,%l6	! %l6 = ffffffffffffff93
!	Mem[0000000010001408] = ffffffffb0a875ff, %l5 = 000000000000ff00
	ldxa	[%i0+%o4]0x88,%l5	! %l5 = ffffffffb0a875ff
!	Code Fragment 3
p0_fragment_15:
!	%l0 = 5ea259a84d30415d
	setx	0x3a4f039f882abaa2,%g7,%l0 ! %l0 = 3a4f039f882abaa2
!	%l1 = 8cab29b05308878c
	setx	0x5ea6c6a7a2b4bf92,%g7,%l1 ! %l1 = 5ea6c6a7a2b4bf92
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3a4f039f882abaa2
	setx	0xb2870837c12894dc,%g7,%l0 ! %l0 = b2870837c12894dc
!	%l1 = 5ea6c6a7a2b4bf92
	setx	0x48f0b15841de7bc9,%g7,%l1 ! %l1 = 48f0b15841de7bc9
!	Mem[00000000100c1410] = b4000000, %l7 = 0000000000000000
	lduba	[%i3+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = 911a540e ff010000, %l4 = 00000080, %l5 = b0a875ff
	ldda	[%i6+0x008]%asi,%l4	! %l4 = 00000000911a540e 00000000ff010000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 00000000, %l1 = 48f0b15841de7bc9
	swapa	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000000

p0_label_212:
!	%l3 = 00000000000000f6, Mem[0000000030041410] = f8ffffff
	stwa	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000f6
!	Mem[0000000010001408] = ff75a8b0, %l0 = b2870837c12894dc
	ldstuba	[%i0+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010041408] = 76e1320a7827e7ec, %l2 = 0000000000008700, %l3 = 00000000000000f6
	add	%i1,0x08,%g1
	casxa	[%g1]0x80,%l2,%l3	! %l3 = 76e1320a7827e7ec
!	%l6 = ffffffffffffff93, Mem[0000000010081410] = 41de7bc9
	stwa	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = ffffff93
!	Code Fragment 4
p0_fragment_16:
!	%l0 = 00000000000000ff
	setx	0xb478017fd1a02409,%g7,%l0 ! %l0 = b478017fd1a02409
!	%l1 = 0000000000000000
	setx	0x1b83c8707223925f,%g7,%l1 ! %l1 = 1b83c8707223925f
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b478017fd1a02409
	setx	0xc944d487f27074b3,%g7,%l0 ! %l0 = c944d487f27074b3
!	%l1 = 1b83c8707223925f
	setx	0x78badd30571058d3,%g7,%l1 ! %l1 = 78badd30571058d3
!	Mem[00000000100c143e] = 6705d656, %l7 = 0000000000000000
	ldstub	[%i3+0x03e],%l7		! %l7 = 000000d6000000ff
!	%l0 = c944d487f27074b3, Mem[0000000030141410] = ffffffff
	stwa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = f27074b3
!	Mem[000000001014142c] = 0e541a91, %l7 = 00000000000000d6
	swap	[%i5+0x02c],%l7		! %l7 = 000000000e541a91
!	%l4 = 00000000911a540e, Mem[0000000010041408] = 76e1320a
	stwa	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 911a540e
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 0000d6ff, %l3 = 76e1320a7827e7ec
	lduha	[%i3+%o4]0x88,%l3	! %l3 = 000000000000d6ff

p0_label_213:
!	Mem[00000000100c1408] = ffd6000000000000, %l3 = 000000000000d6ff
	ldxa	[%i3+%o4]0x80,%l3	! %l3 = ffd6000000000000
!	Mem[00000000211c0000] = ff4c85d2, %l1 = 78badd30571058d3
	ldub	[%o2+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030181408] = 00000000ffffffff, %f12 = 50630200 b50e61d7
	ldda	[%i6+%o4]0x81,%f12	! %f12 = 00000000 ffffffff
!	Mem[0000000030141410] = b37470f2, %l7 = 000000000e541a91
	lduba	[%i5+%o5]0x81,%l7	! %l7 = 00000000000000b3
!	%l3 = ffd6000000000000, immed = fffff51d, %y  = 000001ff
	smul	%l3,-0xae3,%l6		! %l6 = 0000000000000000, %y = 00000000
!	Mem[0000000030001408] = 00000000, %l2 = 0000000000008700
	lduba	[%i0+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101410] = ff1a540e, %l3 = ffd6000000000000
	lduwa	[%i4+%o5]0x81,%l3	! %l3 = 00000000ff1a540e
!	Mem[0000000030001410] = ff750000, %l3 = 00000000ff1a540e
	ldstuba	[%i0+%o5]0x81,%l3	! %l3 = 000000ff000000ff
!	Mem[00000000100c1408] = 0000d6ff, %l7 = 00000000000000b3
	ldswa	[%i3+%o4]0x88,%l7	! %l7 = 000000000000d6ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = ff750000, %l4 = 00000000911a540e
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 000000ff000000ff

p0_label_214:
!	%l2 = 0000000000000000, immed = 000006ec, %y  = 00000000
	smul	%l2,0x6ec,%l0		! %l0 = 0000000000000000, %y = 00000000
!	%l2 = 0000000000000000, Mem[0000000010001400] = ff00000000000000
	stxa	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000000000000000
!	%f2  = ffffffff, Mem[0000000030081410] = 00000000
	sta	%f2 ,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffffff
!	Mem[0000000010101408] = 0e541a91, %l0 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 000000000e541a91
!	%l3 = 00000000000000ff, Mem[0000000010001408] = ff75a8b0ffffffff
	stxa	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000000000ff
!	%f4  = 50630000 000000b4, Mem[0000000030141400] = 00000080 00000573
	stda	%f4 ,[%i5+%g0]0x89	! Mem[0000000030141400] = 50630000 000000b4
!	Mem[0000000010101400] = 00000000, %l3 = 00000000000000ff
	swapa	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000000
!	%l4 = 000000ff, %l5 = ff010000, Mem[0000000030181410] = d7610eb5 50630000
	stda	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff ff010000
!	Mem[0000000030001408] = 00000000, %l5 = 00000000ff010000
	swapa	[%i0+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[000000001004143c] = 00211d9f, %f6  = e139503d
	lda	[%i1+0x03c]%asi,%f6 	! %f6 = 00211d9f

p0_label_215:
!	Mem[0000000021800040] = ffffd022, %l6 = 0000000000000000
	ldsh	[%o3+0x040],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030181408] = 00000000, %l0 = 000000000e541a91
	lduba	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000
!	%l4 = 00000000000000ff, %l3 = 0000000000000000, %y  = 00000000
	umul	%l4,%l3,%l2		! %l2 = 0000000000000000, %y = 00000000
!	Mem[0000000010081408] = ffffffffd60000ff, %f6  = 00211d9f 911a540e
	ldda	[%i2+%o4]0x88,%f6 	! %f6  = ffffffff d60000ff
!	Mem[00000000211c0000] = ff4c85d2, %l6 = ffffffffffffffff
	ldub	[%o2+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030101400] = 000000d6, %l6 = 00000000000000ff
	ldswa	[%i4+%g0]0x81,%l6	! %l6 = 00000000000000d6
!	Mem[0000000010141408] = 00000000, %l6 = 00000000000000d6
	lduba	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = ff000000, %f9  = 17a27aa7
	lda	[%i5+%g0]0x80,%f9 	! %f9 = ff000000
!	Mem[0000000010181410] = 00000049 000000ff, %l6 = 00000000, %l7 = 0000d6ff
	ldda	[%i6+%o5]0x88,%l6	! %l6 = 00000000000000ff 0000000000000049
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 000000ff, %l4 = 00000000000000ff
	swapa	[%i6+%g0]0x81,%l4	! %l4 = 00000000000000ff

p0_label_216:
!	%f10 = ff000000 00000000, Mem[0000000030081410] = ffffffff 00000000
	stda	%f10,[%i2+%o5]0x81	! Mem[0000000030081410] = ff000000 00000000
!	Mem[0000000010041410] = ffffffff, %l0 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000030041410] = 000000f6, %l2 = 0000000000000000
	swapa	[%i1+%o5]0x81,%l2	! %l2 = 00000000000000f6
!	Mem[0000000010001410] = 00211d9f, %l1 = 00000000000000ff
	ldstuba	[%i0+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181410] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l3	! %l3 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000010101410] = ffff0000
	stha	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = ffff00ff
!	%f4  = 50630000 000000b4, %l6 = 00000000000000ff
!	Mem[0000000030001430] = d7610eb5918ccb87
	add	%i0,0x030,%g1
	stda	%f4,[%g1+%l6]ASI_PST16_S ! Mem[0000000030001430] = 50630000000000b4
!	%f7  = d60000ff, Mem[0000000030101408] = ff010000
	sta	%f7 ,[%i4+%o4]0x81	! Mem[0000000030101408] = d60000ff
!	%l6 = 00000000000000ff, Mem[00000000201c0000] = 01ff4c08
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 00ff4c08
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00000000, %l7 = 0000000000000049
	lduha	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000

p0_label_217:
!	Mem[0000000010081410] = ffffff93, %l7 = 0000000000000000
	ldswa	[%i2+%o5]0x88,%l7	! %l7 = ffffffffffffff93
	membar	#Sync			! Added by membar checker (36)
!	Mem[0000000010001400] = 00000000 00000000 00000000 000000ff
!	Mem[0000000010001410] = ff211d9f 00000000 2bee0573 72507abd
!	Mem[0000000010001420] = ac990448 1b00ff00 ffbf607e 20dd659f
!	Mem[0000000010001430] = ff006de9 ffffffc2 ff000000 33660000
	ldda	[%i0]ASI_BLK_PL,%f16	! Block Load from 0000000010001400
!	Mem[0000000030081410] = ff000000, %l1 = 0000000000000000
	lduba	[%i2+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141410] = ffffffbf, %f2  = ffffffff
	lda	[%i5+%o5]0x80,%f2 	! %f2 = ffffffbf
!	Mem[0000000010101408] = 00000000, %l3 = 00000000000000ff
	lduba	[%i4+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = ff4c85d2, %l4 = 00000000000000ff
	ldsb	[%o2+0x001],%l4		! %l4 = 000000000000004c
!	Mem[00000000201c0000] = 00ff4c08, %l5 = 0000000000000000
	ldub	[%o0+0x001],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010081408] = ff0000d6, %l0 = 00000000ffffffff
	lduha	[%i2+%o4]0x80,%l0	! %l0 = 000000000000ff00
!	Mem[0000000030041408] = ff000000 000000ff, %l4 = 0000004c, %l5 = 000000ff
	ldda	[%i1+%o4]0x81,%l4	! %l4 = 00000000ff000000 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f7  = d60000ff, Mem[00000000300c1400] = 00000042
	sta	%f7 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = d60000ff

p0_label_218:
!	Mem[0000000010081410] = 93ffffff, %l0 = 000000000000ff00
	swapa	[%i2+%o5]0x80,%l0	! %l0 = 0000000093ffffff
!	Mem[0000000010001408] = 00000000, %l7 = ffffffffffffff93
	swapa	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000000
!	%f6  = ffffffff d60000ff, %l1 = 00000000000000ff
!	Mem[0000000030181430] = d7610eb500026350
	add	%i6,0x030,%g1
	stda	%f6,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030181430] = ff0000d6ffffffff
!	%f12 = 00000000, Mem[0000000030081400] = 50630200
	sta	%f12,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	Code Fragment 4
p0_fragment_17:
!	%l0 = 0000000093ffffff
	setx	0x8894cb78355cf82f,%g7,%l0 ! %l0 = 8894cb78355cf82f
!	%l1 = 00000000000000ff
	setx	0xa5839fb79f84cd0f,%g7,%l1 ! %l1 = a5839fb79f84cd0f
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8894cb78355cf82f
	setx	0xb846e60871c958e7,%g7,%l0 ! %l0 = b846e60871c958e7
!	%l1 = a5839fb79f84cd0f
	setx	0x7ffd0e4fe16c73ad,%g7,%l1 ! %l1 = 7ffd0e4fe16c73ad
!	%f8  = 5586c10f ff000000, Mem[0000000010041428] = ffffffff fffffff8
	stda	%f8 ,[%i1+0x028]%asi	! Mem[0000000010041428] = 5586c10f ff000000
!	Mem[0000000010181400] = 00000000, %l0 = b846e60871c958e7
	ldstuba	[%i6+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%f8  = 5586c10f ff000000, %l7 = 0000000000000000
!	Mem[0000000010081430] = a675a8b07cfb0e7c
	add	%i2,0x030,%g1
	stda	%f8,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010081430] = a675a8b07cfb0e7c
!	Mem[0000000030081408] = 4b0000ff, %l2 = 00000000000000f6
	swapa	[%i2+%o4]0x89,%l2	! %l2 = 000000004b0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ff000000 00000000, %l4 = ff000000, %l5 = 000000ff
	ldda	[%i6+0x000]%asi,%l4	! %l4 = 00000000ff000000 0000000000000000

p0_label_219:
!	Mem[0000000021800080] = ffff7b7d, %l6 = 00000000000000ff
	lduh	[%o3+0x080],%l6		! %l6 = 000000000000ffff
!	Mem[000000001000140c] = 000000ff, %l5 = 0000000000000000
	lduw	[%i0+0x00c],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030001410] = 000075ff, %l3 = 0000000000000000
	ldswa	[%i0+%o5]0x89,%l3	! %l3 = 00000000000075ff
!	Mem[0000000010181400] = 00000000000000ff, %l7 = 0000000000000000
	ldxa	[%i6+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000211c0000] = ff4c85d2, %l3 = 00000000000075ff
	ldub	[%o2+%g0],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010181410] = ff000000 49000000, %l6 = 0000ffff, %l7 = 000000ff
	ldda	[%i6+%o5]0x80,%l6	! %l6 = 00000000ff000000 0000000049000000
!	Mem[00000000100c1408] = 000000000000d6ff, %l4 = 00000000ff000000
	ldxa	[%i3+%o4]0x88,%l4	! %l4 = 000000000000d6ff
!	Mem[0000000010141408] = 00000000, %l1 = 7ffd0e4fe16c73ad
	lduwa	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001410] = ff211d9f, %l3 = 00000000000000ff
	lduwa	[%i0+%o5]0x80,%l3	! %l3 = 00000000ff211d9f
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l1	! %l1 = 00000000000000ff

p0_label_220:
!	%l3 = 00000000ff211d9f, Mem[0000000030181410] = ff000000
	stwa	%l3,[%i6+%o5]0x81	! Mem[0000000030181410] = ff211d9f
!	%l2 = 000000004b0000ff, Mem[0000000010101400] = b4000000ff000000
	stxa	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000004b0000ff
!	Mem[0000000010041410] = 00000000, %l2 = 000000004b0000ff
	swapa	[%i1+%o5]0x88,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030081400] = 00000000
	stba	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	%f6  = ffffffff d60000ff, Mem[0000000030181400] = 000000ff 00000000
	stda	%f6 ,[%i6+%g0]0x81	! Mem[0000000030181400] = ffffffff d60000ff
!	Mem[0000000030141410] = b37470f2, %l6 = 00000000ff000000
	swapa	[%i5+%o5]0x81,%l6	! %l6 = 00000000b37470f2
!	Mem[00000000100c1416] = ff6049ff, %l5 = 00000000000000ff
	ldstub	[%i3+0x016],%l5		! %l5 = 00000049000000ff
!	%f8  = 5586c10f ff000000, Mem[0000000030081400] = 00000000 b50e61d7
	stda	%f8 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 5586c10f ff000000
!	%l1 = 0000000000000000, Mem[0000000010041400] = f8ffffff
	stba	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 00ffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00ffffff00000000, %l4 = 000000000000d6ff
	ldxa	[%i1+%g0]0x80,%l4	! %l4 = 00ffffff00000000

p0_label_221:
!	Mem[0000000030041410] = 00000000, %l3 = 00000000ff211d9f
	ldswa	[%i1+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181410] = ff211d9f, %l6 = 00000000b37470f2
	lduba	[%i6+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001400] = 00000000, %l7 = 0000000049000000
	ldswa	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[000000001004142c] = ff000000, %l7 = 0000000000000000
	ldsb	[%i1+0x02f],%l7		! %l7 = 0000000000000000
!	Mem[0000000030141410] = 000000ff, %l3 = 0000000000000000
	lduwa	[%i5+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141400] = ff000000, %f13 = ffffffff
	ld	[%i5+%g0],%f13	! %f13 = ff000000
!	Mem[0000000030141400] = b4000000, %l3 = 00000000000000ff
	lduha	[%i5+%g0]0x81,%l3	! %l3 = 000000000000b400
!	%l2 = 0000000000000000, imm = 0000000000000372, %l1 = 0000000000000000
	xnor	%l2,0x372,%l1		! %l1 = fffffffffffffc8d
!	Mem[0000000030141408] = 00211d9f, %l0 = 0000000000000000
	lduha	[%i5+%o4]0x81,%l0	! %l0 = 0000000000000021
!	Starting 10 instruction Store Burst
!	%f14 = ece72778, Mem[00000000100c1400] = 00211d9f
	sta	%f14,[%i3+%g0]0x80	! Mem[00000000100c1400] = ece72778

p0_label_222:
!	%l0 = 0000000000000021, Mem[0000000010041419] = 68a493c1, %asi = 80
	stba	%l0,[%i1+0x019]%asi	! Mem[0000000010041418] = 682193c1
!	%l2 = 00000000, %l3 = 0000b400, Mem[0000000030181410] = 9f1d21ff ff010000
	stda	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000 0000b400
!	Mem[0000000010001418] = 2bee0573, %l2 = 0000000000000000
	swap	[%i0+0x018],%l2		! %l2 = 000000002bee0573
!	Mem[0000000010081400] = 80000000, %l7 = 0000000000000000
	ldstuba	[%i2+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	%l2 = 000000002bee0573, Mem[00000000100c1408] = 0000d6ff
	stha	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000573
!	Mem[000000001014141c] = ff000099, %l2 = 2bee0573, %l4 = 00000000
	add	%i5,0x1c,%g1
	casa	[%g1]0x80,%l2,%l4	! %l4 = 00000000ff000099
!	%l7 = 0000000000000000, imm = 0000000000000392, %l2 = 000000002bee0573
	and	%l7,0x392,%l2		! %l2 = 0000000000000000
!	%l5 = 0000000000000049, Mem[0000000010101424] = c70d15f3
	sth	%l5,[%i4+0x024]		! Mem[0000000010101424] = 004915f3
!	Mem[00000000211c0000] = ff4c85d2, %l0 = 0000000000000021
	ldstuba	[%o2+0x000]%asi,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff00ffff, %l7 = 0000000000000000
	lduwa	[%i4+%o5]0x80,%l7	! %l7 = 00000000ff00ffff

p0_label_223:
!	Mem[0000000030001400] = ffffffff, %l3 = 000000000000b400
	lduha	[%i0+%g0]0x89,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010081408] = ffffffff d60000ff, %l2 = 00000000, %l3 = 0000ffff
	ldda	[%i2+%o4]0x88,%l2	! %l2 = 00000000d60000ff 00000000ffffffff
!	Mem[00000000300c1408] = 00000000, %l6 = 00000000000000ff
	ldsha	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = ff010000, %l4 = 00000000ff000099
	lduwa	[%i0+%o4]0x81,%l4	! %l4 = 00000000ff010000
!	Mem[0000000030181408] = ffffffff000000ff, %f10 = ff000000 00000000
	ldda	[%i6+%o4]0x89,%f10	! %f10 = ffffffff 000000ff
!	Mem[0000000010081408] = ff0000d6, %f22 = bd7a5072
	lda	[%i2+%o4]0x80,%f22	! %f22 = ff0000d6
!	Mem[0000000010041400] = 00ffffff00000000, %l3 = 00000000ffffffff
	ldxa	[%i1+%g0]0x80,%l3	! %l3 = 00ffffff00000000
!	Mem[0000000020800040] = ff00c1d1, %l6 = 0000000000000000
	lduh	[%o1+0x040],%l6		! %l6 = 000000000000ff00
!	%l4 = 00000000ff010000, imm = 0000000000000e20, %l6 = 000000000000ff00
	orn	%l4,0xe20,%l6		! %l6 = fffffffffffff1df
!	Starting 10 instruction Store Burst
!	%f16 = 00000000 00000000 ff000000 00000000
!	%f20 = 00000000 9f1d21ff ff0000d6 7305ee2b
!	%f24 = 00ff001b 480499ac 9f65dd20 7e60bfff
!	%f28 = c2ffffff e96d00ff 00006633 000000ff
	stda	%f16,[%i2]ASI_COMMIT_S	! Block Store to 0000000030081400

p0_label_224:
!	%l4 = ff010000, %l5 = 00000049, Mem[0000000010101408] = 00000000 e139503d
	stda	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = ff010000 00000049
	membar	#Sync			! Added by membar checker (37)
!	Mem[0000000010081400] = ff000080, %l4 = 00000000ff010000
	ldstuba	[%i2+%g0]0x80,%l4	! %l4 = 000000ff000000ff
!	%l1 = fffffffffffffc8d, Mem[0000000030181410] = 00000000
	stba	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = 8d000000
!	%f18 = ff000000, Mem[000000001014141c] = ff000099
	st	%f18,[%i5+0x01c]	! Mem[000000001014141c] = ff000000
!	%f18 = ff000000, Mem[00000000100c1400] = ece72778
	st	%f18,[%i3+%g0]		! Mem[00000000100c1400] = ff000000
!	Mem[000000001018143c] = 7d5c0455, %l4 = 00000000000000ff
	swap	[%i6+0x03c],%l4		! %l4 = 000000007d5c0455
!	%l0 = 00000000000000ff, Mem[00000000211c0000] = ff4c85d2, %asi = 80
	stha	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ff85d2
!	Mem[00000000300c1408] = 00000000, %l6 = fffffffffffff1df
	swapa	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	%l5 = 0000000000000049, Mem[00000000100c1410] = ffff60ffb4000000
	stxa	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000000000000049
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ffffff00, %f7  = d60000ff
	lda	[%i1+%g0]0x88,%f7 	! %f7 = ffffff00

p0_label_225:
!	Mem[0000000010181408] = 911a540e ff010000, %l6 = 00000000, %l7 = ff00ffff
	ldda	[%i6+%o4]0x80,%l6	! %l6 = 00000000911a540e 00000000ff010000
!	Mem[0000000030101410] = 0e541aff, %l6 = 00000000911a540e
	lduha	[%i4+%o5]0x89,%l6	! %l6 = 0000000000001aff
!	Mem[0000000010101410] = ff00ffff, %l6 = 0000000000001aff
	lduha	[%i4+%o5]0x80,%l6	! %l6 = 000000000000ff00
!	Mem[00000000300c1400] = 00000000ff0000d6, %l0 = 00000000000000ff
	ldxa	[%i3+%g0]0x89,%l0	! %l0 = 00000000ff0000d6
!	Mem[0000000030001400] = ffffffff00000000, %l5 = 0000000000000049
	ldxa	[%i0+%g0]0x81,%l5	! %l5 = ffffffff00000000
!	Mem[0000000030141408] = 00211d9f, %f23 = 7305ee2b
	lda	[%i5+%o4]0x81,%f23	! %f23 = 00211d9f
!	Mem[0000000030041400] = 0000000000000000, %f6  = ffffffff ffffff00
	ldda	[%i1+%g0]0x81,%f6 	! %f6  = 00000000 00000000
!	Mem[0000000010141400] = 00000000000000ff, %l2 = 00000000d60000ff
	ldxa	[%i5+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1408] = 00000573, %l4 = 000000007d5c0455
	lduwa	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000573
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000030181400] = ff0000d6ffffffff
	stxa	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000000000ff

p0_label_226:
!	%l3 = 00ffffff00000000, Mem[0000000021800140] = f6ff05d8
	sth	%l3,[%o3+0x140]		! Mem[0000000021800140] = 000005d8
!	Mem[0000000030101400] = d6000000, %l6 = 000000000000ff00
	swapa	[%i4+%g0]0x89,%l6	! %l6 = 00000000d6000000
!	Mem[0000000030141400] = b4000000, %l4 = 0000000000000573
	swapa	[%i5+%g0]0x81,%l4	! %l4 = 00000000b4000000
!	Mem[0000000030101400] = 00ff0000, %l2 = 00000000000000ff
	ldstuba	[%i4+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%l7 = 00000000ff010000, Mem[0000000010041400] = 00ffffff
	stha	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000ffff
!	%l2 = 0000000000000000, Mem[0000000010141410] = ffffffbfecff0000
	stx	%l2,[%i5+%o5]		! Mem[0000000010141410] = 0000000000000000
!	%f2  = ffffffbf 450440d6, %l6 = 00000000d6000000
!	Mem[0000000030081418] = ff0000d67305ee2b
	add	%i2,0x018,%g1
	stda	%f2,[%g1+%l6]ASI_PST8_S ! Mem[0000000030081418] = ff0000d67305ee2b
!	%f23 = 00211d9f, Mem[0000000030181400] = 000000ff
	sta	%f23,[%i6+%g0]0x89	! Mem[0000000030181400] = 00211d9f
!	%l3 = 00ffffff00000000, Mem[0000000010141400] = ff000000
	stwa	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	Starting 10 instruction Load Burst
!	%l3 = 00ffffff00000000, %l7 = 00000000ff010000, %l1 = fffffffffffffc8d
	add	%l3,%l7,%l1		! %l1 = 00ffffffff010000

p0_label_227:
!	Mem[0000000010001400] = 0000000000000000, %l6 = 00000000d6000000
	ldxa	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101408] = 000001ff49000000, %f4  = 50630000 000000b4
	ldda	[%i4+%o4]0x80,%f4 	! %f4  = 000001ff 49000000
!	Mem[0000000010101410] = ff00ffff, %l3 = 00ffffff00000000
	ldsb	[%i4+0x011],%l3		! %l3 = 0000000000000000
!	Mem[0000000030081400] = 00000000 00000000, %l0 = ff0000d6, %l1 = ff010000
	ldda	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[00000000300c1400] = ff0000d6, %l4 = 00000000b4000000
	ldswa	[%i3+%g0]0x89,%l4	! %l4 = ffffffffff0000d6
!	Mem[0000000030181400] = 9f1d2100, %l4 = ffffffffff0000d6
	lduwa	[%i6+%g0]0x81,%l4	! %l4 = 000000009f1d2100
!	Mem[0000000030101410] = 0e541aff, %l7 = 00000000ff010000
	ldswa	[%i4+%o5]0x89,%l7	! %l7 = 000000000e541aff
!	Code Fragment 3
p0_fragment_18:
!	%l0 = 0000000000000000
	setx	0x24e06a97d19f507d,%g7,%l0 ! %l0 = 24e06a97d19f507d
!	%l1 = 0000000000000000
	setx	0x80ae90cf9187a25c,%g7,%l1 ! %l1 = 80ae90cf9187a25c
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 24e06a97d19f507d
	setx	0x0eed0e7059889fa4,%g7,%l0 ! %l0 = 0eed0e7059889fa4
!	%l1 = 80ae90cf9187a25c
	setx	0xd0916d200676add3,%g7,%l1 ! %l1 = d0916d200676add3
!	Mem[0000000030081410] = 00000000, %l5 = ffffffff00000000
	ldsba	[%i2+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f6  = 00000000, Mem[0000000010181408] = 911a540e
	st	%f6 ,[%i6+%o4]		! Mem[0000000010181408] = 00000000

p0_label_228:
!	%l1 = d0916d200676add3, Mem[0000000010181410] = 000000ff
	stha	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000add3
!	Mem[0000000010141400] = 00000000, %l7 = 000000000e541aff
	swapa	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000000
!	%l0 = 0eed0e7059889fa4, Mem[00000000100c1434] = df48e814, %asi = 80
	stha	%l0,[%i3+0x034]%asi	! Mem[00000000100c1434] = 9fa4e814
!	Mem[0000000010001408] = 93ffffff, %l5 = 0000000000000000
	ldstuba	[%i0+%o4]0x80,%l5	! %l5 = 00000093000000ff
!	%l0 = 0eed0e7059889fa4, %l5 = 0000000000000093, %y  = 00000000
	sdiv	%l0,%l5,%l6		! %l6 = 00000000009bec30
	mov	%l0,%y			! %y = 59889fa4
!	%l5 = 0000000000000093, immed = 000004d0, %y  = 59889fa4
	umul	%l5,0x4d0,%l4		! %l4 = 000000000002c370, %y = 00000000
!	Mem[00000000100c1410] = 49000000, %l7 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l7	! %l7 = 00000049000000ff
!	Mem[0000000030041400] = 00000000, %l5 = 0000000000000093
	swapa	[%i1+%g0]0x81,%l5	! %l5 = 0000000000000000
!	%l2 = 0000000000000000, %l4 = 000000000002c370, %l1 = d0916d200676add3
	xnor	%l2,%l4,%l1		! %l1 = fffffffffffd3c8f
!	Starting 10 instruction Load Burst
!	Mem[0000000010081424] = 8ea847d9, %l5 = 0000000000000000
	ldsw	[%i2+0x024],%l5		! %l5 = ffffffff8ea847d9

p0_label_229:
!	%l4 = 000000000002c370, Mem[0000000010081410] = 00ff0000
	stba	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 00ff0070
!	Mem[0000000010181408] = 000001ff 00000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000000 00000000000001ff
!	Mem[0000000030101408] = d60000ff, %l3 = 00000000000001ff
	ldsha	[%i4+%o4]0x81,%l3	! %l3 = ffffffffffffd600
!	Mem[0000000010041410] = ffffffff4b0000ff, %l7 = 0000000000000049
	ldxa	[%i1+%o5]0x88,%l7	! %l7 = ffffffff4b0000ff
!	Mem[00000000201c0000] = 00ff4c08, %l4 = 000000000002c370
	lduba	[%o0+0x001]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081420] = e139503d8ea847d9, %f2  = ffffffbf 450440d6
	ldd	[%i2+0x020],%f2 	! %f2  = e139503d 8ea847d9
!	Mem[0000000010101410] = ff00ffff, %f25 = 480499ac
	lda	[%i4+%o5]0x80,%f25	! %f25 = ff00ffff
!	Mem[0000000030101410] = ff1a540e 00006350, %l0 = 59889fa4, %l1 = fffd3c8f
	ldda	[%i4+%o5]0x81,%l0	! %l0 = 00000000ff1a540e 0000000000006350
!	Mem[0000000010081408] = ffffffffd60000ff, %f16 = 00000000 00000000
	ldda	[%i2+%o4]0x88,%f16	! %f16 = ffffffff d60000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 7000ff00, %l1 = 0000000000006350
	ldstuba	[%i2+%o5]0x80,%l1	! %l1 = 00000070000000ff

p0_label_230:
!	%f26 = 9f65dd20 7e60bfff, Mem[0000000030181400] = 00211d9f 00000000
	stda	%f26,[%i6+%g0]0x89	! Mem[0000000030181400] = 9f65dd20 7e60bfff
!	%l1 = 0000000000000070, Mem[0000000010101420] = 1c5029f5004915f3, %asi = 80
	stxa	%l1,[%i4+0x020]%asi	! Mem[0000000010101420] = 0000000000000070
!	Mem[0000000010041400] = 0000ffff, %l7 = ffffffff4b0000ff
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030081410] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000211c0000] = 00ff85d2, %l7 = 000000000000ffff
	ldstub	[%o2+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010181410] = d3ad0000, %l6 = 00000000009bec30
	swapa	[%i6+%o5]0x80,%l6	! %l6 = 00000000d3ad0000
!	%l5 = ffffffff8ea847d9, Mem[0000000010141410] = 00000000
	stha	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = 47d90000
!	Mem[0000000030141408] = 00211d9f, %l7 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	%l0 = 00000000ff1a540e, Mem[0000000010001432] = ff006de9, %asi = 80
	stha	%l0,[%i0+0x032]%asi	! Mem[0000000010001430] = ff00540e
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ff00004b, %f10 = ffffffff
	lda	[%i1+%g0]0x88,%f10	! %f10 = ff00004b

p0_label_231:
!	Code Fragment 4
p0_fragment_19:
!	%l0 = 00000000ff1a540e
	setx	0x0ae77c282c2ad246,%g7,%l0 ! %l0 = 0ae77c282c2ad246
!	%l1 = 0000000000000070
	setx	0x38140c7feea66ecd,%g7,%l1 ! %l1 = 38140c7feea66ecd
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0ae77c282c2ad246
	setx	0x35f6050fe9abafef,%g7,%l0 ! %l0 = 35f6050fe9abafef
!	%l1 = 38140c7feea66ecd
	setx	0xb8860aafcea5dc2d,%g7,%l1 ! %l1 = b8860aafcea5dc2d
!	Mem[0000000010101408] = 000001ff49000000, %l7 = 0000000000000000
	ldxa	[%i4+%o4]0x80,%l7	! %l7 = 000001ff49000000
!	Mem[0000000010181410] = 009bec3049000000, %f28 = c2ffffff e96d00ff
	ldda	[%i6+%o5]0x80,%f28	! %f28 = 009bec30 49000000
!	Mem[0000000010081408] = d60000ff, %l7 = 000001ff49000000
	lduwa	[%i2+%o4]0x88,%l7	! %l7 = 00000000d60000ff
!	Mem[000000001000142c] = 20dd659f, %l7 = 00000000d60000ff
	lduwa	[%i0+0x02c]%asi,%l7	! %l7 = 0000000020dd659f
!	Mem[0000000030081400] = 0000000000000000, %l3 = ffffffffffffd600
	ldxa	[%i2+%g0]0x89,%l3	! %l3 = 0000000000000000
!	%l6 = 00000000d3ad0000, imm = fffffffffffff20a, %l5 = ffffffff8ea847d9
	addc	%l6,-0xdf6,%l5		! %l5 = 00000000d3acf20a
!	Mem[0000000020800000] = ffffba64, %l7 = 0000000020dd659f
	lduba	[%o1+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001408] = 000001ff, %l7 = 00000000000000ff
	ldsha	[%i0+%o4]0x89,%l7	! %l7 = 00000000000001ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 30ec9b00, %l4 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l4	! %l4 = 00000000000000ff

p0_label_232:
!	%l6 = d3ad0000, %l7 = 000001ff, Mem[0000000030181410] = 8d000000 00b40000
	stda	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = d3ad0000 000001ff
!	Mem[000000001014141c] = ff000000, %l7 = 000001ff, %l7 = 000001ff
	add	%i5,0x1c,%g1
	casa	[%g1]0x80,%l7,%l7	! %l7 = 00000000ff000000
!	%l7 = 00000000ff000000, Mem[0000000010081410] = ff00ff00
	stba	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000ff00
!	Mem[00000000100c1400] = ff000000, %l0 = 35f6050fe9abafef
	swapa	[%i3+%g0]0x80,%l0	! %l0 = 00000000ff000000
!	%l5 = 00000000d3acf20a, Mem[000000001008143c] = ffe02ca5, %asi = 80
	stha	%l5,[%i2+0x03c]%asi	! Mem[000000001008143c] = f20a2ca5
!	Mem[00000000100c1408] = 73050000, %l1 = b8860aafcea5dc2d
	swapa	[%i3+%o4]0x80,%l1	! %l1 = 0000000073050000
!	%l2 = 0000000000000000, Mem[0000000030001400] = ffffffff00000000
	stxa	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000000000000000
!	Mem[0000000010141400] = 0e541aff, %l1 = 0000000073050000
	swapa	[%i5+%g0]0x88,%l1	! %l1 = 000000000e541aff
!	%l4 = 0000000000000000, immd = fffffffffffff0d1, %l0 = 00000000ff000000
	sdivx	%l4,-0xf2f,%l0		! %l0 = 0000000000000000
!	Starting 10 instruction Load Burst
!	%l1 = 000000000e541aff, %l1 = 000000000e541aff, %y  = 00000000
	sdiv	%l1,%l1,%l7		! %l7 = 0000000000000001
	mov	%l0,%y			! %y = 00000000

p0_label_233:
!	Mem[0000000030141400] = 73050000, %l6 = 00000000d3ad0000
	lduba	[%i5+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041400] = 0000009300000000, %f20 = 00000000 9f1d21ff
	ldda	[%i1+%g0]0x81,%f20	! %f20 = 00000093 00000000
!	Mem[0000000010141428] = 425aeabe, %l5 = 00000000d3acf20a
	ldsba	[%i5+0x028]%asi,%l5	! %l5 = 0000000000000042
!	Mem[0000000010081400] = dd63fba2800000ff, %l4 = 0000000000000000
	ldxa	[%i2+%g0]0x88,%l4	! %l4 = dd63fba2800000ff
!	Mem[0000000010101408] = ff010000, %l2 = 0000000000000000
	ldsba	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001420] = ac9904481b00ff00, %f30 = 00006633 000000ff
	ldda	[%i0+0x020]%asi,%f30	! %f30 = ac990448 1b00ff00
!	%l0 = 0000000000000000, imm = fffffffffffff6d4, %l1 = 000000000e541aff
	add	%l0,-0x92c,%l1		! %l1 = fffffffffffff6d4
!	Mem[00000000100c1410] = ff000000, %l4 = dd63fba2800000ff
	lduba	[%i3+0x011]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181400] = ff000000, %l3 = 0000000000000000
	ldsha	[%i6+%g0]0x80,%l3	! %l3 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%l1 = fffffffffffff6d4, immed = fffff8c4, %y  = 00000000
	sdiv	%l1,-0x73c,%l4		! %l4 = ffffffffffdc9d09
	mov	%l0,%y			! %y = 00000000

p0_label_234:
!	Mem[0000000030041408] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	%l0 = 00000000, %l1 = fffff6d4, Mem[0000000030081410] = 000000ff ff211d9f
	stda	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000 fffff6d4
!	Mem[0000000020800001] = ffffba64, %l0 = 0000000000000000
	ldstub	[%o1+0x001],%l0		! %l0 = 000000ff000000ff
!	Mem[0000000010101400] = 4b0000ff, %l4 = ffffffffffdc9d09
	swapa	[%i4+%g0]0x88,%l4	! %l4 = 000000004b0000ff
!	%l7 = 0000000000000001, Mem[0000000030101408] = d60000ff
	stba	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = 010000ff
!	%l2 = 00000000000000ff, Mem[0000000010101410] = ff00ffff0000ffff
	stxa	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000000000ff
!	Mem[0000000010141410] = 0000d947, %l4 = 000000004b0000ff
	ldstuba	[%i5+%o5]0x88,%l4	! %l4 = 00000047000000ff
!	Mem[000000001018140c] = ff010000, %l6 = 0000000000000000, %asi = 80
	swapa	[%i6+0x00c]%asi,%l6	! %l6 = 00000000ff010000
!	Mem[0000000030041408] = ff000000, %l2 = 00000000000000ff
	swapa	[%i1+%o4]0x81,%l2	! %l2 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ffd9000000000000, %l5 = 0000000000000042
	ldxa	[%i5+%o5]0x80,%l5	! %l5 = ffd9000000000000

p0_label_235:
!	Mem[0000000021800040] = ffffd022, %l6 = 00000000ff010000
	ldsba	[%o3+0x040]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030041400] = 93000000, %l1 = fffffffffffff6d4
	ldsha	[%i1+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = 00000000ff00004b, %f30 = ac990448 1b00ff00
	ldda	[%i1+%g0]0x88,%f30	! %f30 = 00000000 ff00004b
!	%l6 = ffffffffffffffff, %l2 = 00000000ff000000, %y  = 00000000
	sdiv	%l6,%l2,%l7		! %l7 = ffffffffffffff01
	mov	%l0,%y			! %y = 000000ff
!	Mem[0000000030141410] = 000000ff, %l6 = ffffffffffffffff
	lduwa	[%i5+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181408] = ff000000ffffffff, %l6 = 00000000000000ff
	ldxa	[%i6+%o4]0x81,%l6	! %l6 = ff000000ffffffff
!	Mem[0000000010081408] = ff0000d6ffffffff, %l4 = 0000000000000047
	ldxa	[%i2+%o4]0x80,%l4	! %l4 = ff0000d6ffffffff
!	Mem[0000000010001408] = ffffffff 000000ff, %l4 = ffffffff, %l5 = 00000000
	ldda	[%i0+0x008]%asi,%l4	! %l4 = 00000000ffffffff 00000000000000ff
!	Mem[0000000010001408] = ffffffff, %l1 = 0000000000000000
	lduba	[%i0+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l6 = ff000000ffffffff, Mem[0000000010081400] = dd63fba2800000ff
	stxa	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = ff000000ffffffff

p0_label_236:
!	%l2 = 00000000ff000000, Mem[0000000010001408] = ff000000ffffffff
	stxa	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000ff000000
!	%l4 = ffffffff, %l5 = 000000ff, Mem[0000000010081428] = f8ffffff 5063fba2
	stda	%l4,[%i2+0x028]%asi	! Mem[0000000010081428] = ffffffff 000000ff
!	Mem[00000000100c1408] = cea5dc2d, %l0 = 00000000000000ff
	ldstuba	[%i3+%o4]0x80,%l0	! %l0 = 000000ce000000ff
!	%f14 = ece72778 0a32e176, Mem[0000000030081410] = 00000000 fffff6d4
	stda	%f14,[%i2+%o5]0x89	! Mem[0000000030081410] = ece72778 0a32e176
!	%l1 = 00000000000000ff, Mem[0000000010181410] = 0000004930ec9bff
	stxa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000000000ff
!	%f16 = ffffffff d60000ff ff000000 00000000
!	%f20 = 00000093 00000000 ff0000d6 00211d9f
!	%f24 = 00ff001b ff00ffff 9f65dd20 7e60bfff
!	%f28 = 009bec30 49000000 00000000 ff00004b
	stda	%f16,[%i3]ASI_BLK_P	! Block Store to 00000000100c1400
!	%l3 = ffffffffffffff00, Mem[0000000030041400] = 0000000093000000
	stxa	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffffffffffff00
!	%l7 = ffffffffffffff01, Mem[0000000010041408] = 911a540e
	stha	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = ff01540e
!	%l5 = 00000000000000ff, Mem[0000000010081408] = ff0000d6
	stha	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = 00ff00d6
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 73050000, %l1 = 00000000000000ff
	lduba	[%i5+%g0]0x88,%l1	! %l1 = 0000000000000000

p0_label_237:
!	Mem[0000000030001410] = 000075ff, %l5 = 00000000000000ff
	lduwa	[%i0+%o5]0x89,%l5	! %l5 = 00000000000075ff
!	Mem[0000000030181410] = 0000add3, %f4  = 000001ff
	lda	[%i6+%o5]0x89,%f4 	! %f4 = 0000add3
!	Mem[0000000030041400] = 00ffffff, %f10 = ff00004b
	lda	[%i1+%g0]0x81,%f10	! %f10 = 00ffffff
!	Mem[0000000030001410] = ff750000, %l6 = ff000000ffffffff
	lduba	[%i0+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181408] = 00000000, %f8  = 5586c10f
	lda	[%i6+%o4]0x88,%f8 	! %f8 = 00000000
!	%l3 = ffffffffffffff00, Mem[0000000010181420] = ff583e7e
	stb	%l3,[%i6+0x020]		! Mem[0000000010181420] = 00583e7e
!	Mem[0000000010001438] = ff000000, %l3 = ffffffffffffff00
	ldsb	[%i0+0x038],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030141400] = 0000057300006350, %l5 = 00000000000075ff
	ldxa	[%i5+%g0]0x81,%l5	! %l5 = 0000057300006350
	membar	#Sync			! Added by membar checker (38)
!	Mem[00000000100c1420] = 00ff001b, %l0 = 00000000000000ce
	lduba	[%i3+0x020]%asi,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 000000ff, %l7 = ffffff01, Mem[0000000010001410] = ff211d9f 00000000
	std	%l6,[%i0+%o5]		! Mem[0000000010001410] = 000000ff ffffff01

p0_label_238:
!	Mem[0000000010141408] = 00000000, %l5 = 00006350, %l4 = ffffffff
	add	%i5,0x08,%g1
	casa	[%g1]0x80,%l5,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141419] = b40000ff, %l3 = ffffffffffffffff
	ldstub	[%i5+0x019],%l3		! %l3 = 00000000000000ff
!	%f14 = ece72778 0a32e176, Mem[0000000030181408] = 000000ff ffffffff
	stda	%f14,[%i6+%o4]0x89	! Mem[0000000030181408] = ece72778 0a32e176
!	Mem[0000000030041410] = 00000000, %l7 = ffffffffffffff01
	swapa	[%i1+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i2+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	%f28 = 009bec30 49000000, %l3 = 0000000000000000
!	Mem[0000000010081410] = 0000ff0000211d9f
	add	%i2,0x010,%g1
	stda	%f28,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010081410] = 0000ff0000211d9f
!	%f30 = 00000000, %f19 = 00000000, %f24 = 00ff001b ff00ffff
	fsmuld	%f30,%f19,%f24		! %f24 = 00000000 00000000
!	Mem[0000000010181430] = 0000008000000000, %l5 = 0000057300006350, %l5 = 0000057300006350
	add	%i6,0x30,%g1
	casxa	[%g1]0x80,%l5,%l5	! %l5 = 0000008000000000
!	%l6 = 00000000000000ff, Mem[00000000100c1438] = 00000000ff00004b
	stx	%l6,[%i3+0x038]		! Mem[00000000100c1438] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ff211d9f, %l3 = 0000000000000000
	lduha	[%i5+%o4]0x81,%l3	! %l3 = 000000000000ff21

p0_label_239:
!	Mem[0000000010081400] = ffffffff, %l1 = 0000000000000000
	ldsha	[%i2+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041400] = 4b0000ff 00000000 ff01540e 7827e7ec
!	Mem[0000000010041410] = ff00004b ffffffff 682193c1 a90cadac
!	Mem[0000000010041420] = 00000000 a675a8b0 5586c10f ff000000
!	Mem[0000000010041430] = 7c0efb7c 00ffff00 00000000 00211d9f
	ldda	[%i1]ASI_BLK_PL,%f16	! Block Load from 0000000010041400
!	Mem[0000000010081410] = 0000ff00, %l6 = 00000000000000ff
	lduha	[%i2+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l4 = 0000000000000000
	ldsha	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l2 = 00000000ff000000
	ldsba	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1408] = dff1ffff, %l6 = 0000000000000000
	ldswa	[%i3+%o4]0x81,%l6	! %l6 = ffffffffdff1ffff
!	Mem[0000000030141410] = ff000000ffffffbf, %l2 = 0000000000000000
	ldxa	[%i5+%o5]0x81,%l2	! %l2 = ff000000ffffffbf
!	Mem[0000000010101410] = ff00000000000000, %f0  = 00000000 0000ffff
	ldda	[%i4+%o5]0x88,%f0 	! %f0  = ff000000 00000000
!	Mem[0000000010101410] = 00000000, %l6 = ffffffffdff1ffff
	ldsba	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010101410] = 00000000
	stha	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000

p0_label_240:
!	%l7 = 0000000000000000, Mem[00000000100c141e] = 00211d9f
	stb	%l7,[%i3+0x01e]		! Mem[00000000100c141c] = 0021009f
!	Mem[00000000300c1410] = 00000000, %l3 = 000000000000ff21
	ldstuba	[%i3+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	%f0  = ff000000 00000000, Mem[00000000100c1408] = 000000ff 00000000
	stda	%f0 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff000000 00000000
!	%l2 = ff000000ffffffbf, Mem[0000000030001400] = 0000000000000000
	stxa	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = ff000000ffffffbf
!	Mem[00000000100c1410] = 00000093, %l0 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l0	! %l0 = 00000000000000ff
	membar	#Sync			! Added by membar checker (39)
!	%f8  = 00000000 ff000000, Mem[0000000010041408] = 0e5401ff ece72778
	stda	%f8 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000 ff000000
!	%f2  = e139503d 8ea847d9, Mem[0000000030181410] = d3ad0000 000001ff
	stda	%f2 ,[%i6+%o5]0x81	! Mem[0000000030181410] = e139503d 8ea847d9
!	%l3 = 0000000000000000, %l2 = ff000000ffffffbf, %l6 = 0000000000000000
	addc	%l3,%l2,%l6		! %l6 = ff000000ffffffbf
!	Mem[0000000010081408] = d600ff00, %l5 = 0000008000000000
	swapa	[%i2+%o4]0x88,%l5	! %l5 = 00000000d600ff00
!	Starting 10 instruction Load Burst
!	%l6 = ff000000ffffffbf, %l2 = ff000000ffffffbf, %l4 = 0000000000000000
	xnor	%l6,%l2,%l4		! %l4 = ffffffffffffffff

p0_label_241:
!	Mem[0000000010181418] = 00000000, %l2 = ff000000ffffffbf
	lduha	[%i6+0x018]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181408] = ece72778 0a32e176, %l4 = ffffffff, %l5 = d600ff00
	ldda	[%i6+%o4]0x89,%l4	! %l4 = 000000000a32e176 00000000ece72778
!	Mem[0000000020800040] = ff00c1d1, %l5 = 00000000ece72778
	ldub	[%o1+0x040],%l5		! %l5 = 00000000000000ff
!	Mem[00000000201c0000] = 00ff4c08, %l1 = ffffffffffffffff
	ldsh	[%o0+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010081400] = ffffffff000000ff, %f4  = 0000add3 49000000
	ldda	[%i2+%g0]0x80,%f4 	! %f4  = ffffffff 000000ff
!	Mem[0000000021800180] = 4bedbd9f, %l0 = 0000000000000000
	lduh	[%o3+0x180],%l0		! %l0 = 0000000000004bed
!	Mem[0000000010001408] = 000000ff, %l3 = 0000000000000000
	lduha	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = ece72778 0a32e176, %l2 = 00000000, %l3 = 00000000
	ldda	[%i2+%o5]0x89,%l2	! %l2 = 000000000a32e176 00000000ece72778
!	Mem[0000000010101400] = 099ddcff00000000, %f28 = 00ffff00 7cfb0e7c
	ldda	[%i4+%g0]0x80,%f28	! %f28 = 099ddcff 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081406] = 000000ff, %l2 = 000000000a32e176
	ldstub	[%i2+0x006],%l2		! %l2 = 00000000000000ff

p0_label_242:
!	Mem[0000000020800000] = ffffba64, %l7 = 0000000000000000
	ldstuba	[%o1+0x000]%asi,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030081410] = 76e1320a, %l5 = 00000000000000ff
	swapa	[%i2+%o5]0x81,%l5	! %l5 = 0000000076e1320a
!	Mem[0000000030101410] = ff1a540e, %l7 = 00000000000000ff
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 00000000ff1a540e
!	Mem[0000000020800040] = ff00c1d1, %l2 = 0000000000000000
	ldstuba	[%o1+0x040]%asi,%l2	! %l2 = 000000ff000000ff
!	%l2 = 00000000000000ff, %l7 = 00000000ff1a540e, %l7 = 00000000ff1a540e
	andn	%l2,%l7,%l7		! %l7 = 00000000000000f1
!	%l4 = 000000000a32e176, Mem[0000000030181408] = 76e1320a
	stba	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 76e1320a
!	%l7 = 00000000000000f1, Mem[0000000030181400] = ffbf607e
	stwa	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000f1
!	%l5 = 0000000076e1320a, Mem[0000000010081430] = a675a8b07cfb0e7c, %asi = 80
	stxa	%l5,[%i2+0x030]%asi	! Mem[0000000010081430] = 0000000076e1320a
!	%l3 = 00000000ece72778, Mem[0000000010001410] = 000000ff
	stba	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = 780000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 010000ff00000000, %f12 = 00000000 ff000000
	ldda	[%i4+%o4]0x81,%f12	! %f12 = 010000ff 00000000

p0_label_243:
!	Mem[0000000010101408] = 000001ff49000000, %f8  = 00000000 ff000000
	ldda	[%i4+%o4]0x80,%f8 	! %f8  = 000001ff 49000000
!	Mem[0000000030141408] = 9f1d21ff, %l5 = 0000000076e1320a
	ldsba	[%i5+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030041400] = 00ffffff, %l2 = 00000000000000ff
	ldsba	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101400] = 099ddcff 00000000, %l2 = 00000000, %l3 = ece72778
	ldda	[%i4+%g0]0x80,%l2	! %l2 = 00000000099ddcff 0000000000000000
!	Mem[0000000010081408] = 00000000, %l6 = ff000000ffffffbf
	lduba	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001410] = 50630000000075ff, %f6  = 00000000 00000000
	ldda	[%i0+%o5]0x89,%f6 	! %f6  = 50630000 000075ff
!	Mem[0000000010041400] = 4b0000ff, %f28 = 099ddcff
	lda	[%i1+%g0]0x80,%f28	! %f28 = 4b0000ff
!	%l1 = 00000000000000ff, Mem[0000000030101410] = ff000000
	stba	%l1,[%i4+%o5]0x89	! Mem[0000000030101410] = ff0000ff
!	Mem[0000000030181410] = 3d5039e1, %l1 = 00000000000000ff
	lduha	[%i6+%o5]0x89,%l1	! %l1 = 00000000000039e1
!	Starting 10 instruction Store Burst
!	%l4 = 000000000a32e176, Mem[0000000030101410] = ff0000ff
	stwa	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 0a32e176

p0_label_244:
!	Mem[00000000100c1408] = 00000000, %l0 = 0000000000004bed
	ldstuba	[%i3+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181408] = 00000000, %l4 = 000000000a32e176
	swapa	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000000
!	%f9  = 49000000, Mem[0000000030101408] = 010000ff
	sta	%f9 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 49000000
!	%l5 = ffffffffffffffff, Mem[0000000010141408] = 00000000
	stha	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000ffff
!	%l2 = 00000000099ddcff, Mem[00000000211c0000] = ffff85d2, %asi = 80
	stba	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffff85d2
!	%l3 = 0000000000000000, imm = fffffffffffff7a9, %l4 = 0000000000000000
	andn	%l3,-0x857,%l4		! %l4 = 0000000000000000
!	%f1  = 00000000, %f26 = 000000ff 0fc18655
	fitod	%f1 ,%f26		! %f26 = 00000000 00000000
!	Mem[0000000010141424] = ffffff9d, %l7 = 000000f1, %l2 = 099ddcff
	add	%i5,0x24,%g1
	casa	[%g1]0x80,%l7,%l2	! %l2 = 00000000ffffff9d
!	%l0 = 00000000, %l1 = 000039e1, Mem[0000000010041408] = 000000ff 00000000
	stda	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000 000039e1
!	Starting 10 instruction Load Burst
!	Mem[0000000010001428] = ffbf607e20dd659f, %l2 = 00000000ffffff9d
	ldxa	[%i0+0x028]%asi,%l2	! %l2 = ffbf607e20dd659f

p0_label_245:
!	%l4 = 0000000000000000, imm = 0000000000000ee4, %l3 = 0000000000000000
	xnor	%l4,0xee4,%l3		! %l3 = fffffffffffff11b
!	Mem[0000000010141424] = ffffff9d, %l6 = 0000000000000000
	ldsba	[%i5+0x026]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101400] = 099ddcff, %l1 = 00000000000039e1
	ldswa	[%i4+%g0]0x80,%l1	! %l1 = 00000000099ddcff
!	%l6 = ffffffffffffffff, %l6 = ffffffffffffffff, %l4 = 0000000000000000
	udivx	%l6,%l6,%l4		! %l4 = 0000000000000001
!	Mem[0000000030181400] = f1000000, %f4  = ffffffff
	lda	[%i6+%g0]0x89,%f4 	! %f4 = f1000000
!	Mem[0000000010141400] = 00000000 73050000, %l0 = 00000000, %l1 = 099ddcff
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 0000000073050000 0000000000000000
!	Mem[0000000030081408] = ff000000 00000000, %l0 = 73050000, %l1 = 00000000
	ldda	[%i2+%o4]0x81,%l0	! %l0 = 00000000ff000000 0000000000000000
!	Mem[00000000300c1400] = d60000ff, %l1 = 0000000000000000
	ldsha	[%i3+%g0]0x81,%l1	! %l1 = ffffffffffffd600
!	Mem[00000000100c1420] = 00ff001b, %l0 = 00000000ff000000
	lduh	[%i3+0x022],%l0		! %l0 = 000000000000001b
!	Starting 10 instruction Store Burst
!	Mem[00000000218000c0] = 6fff4ce8, %l0 = 000000000000001b
	ldstuba	[%o3+0x0c0]%asi,%l0	! %l0 = 0000006f000000ff

p0_label_246:
!	Mem[00000000300c1410] = ff000000, %l4 = 0000000000000001
	swapa	[%i3+%o5]0x81,%l4	! %l4 = 00000000ff000000
!	Mem[00000000100c1400] = ffffffff, %l6 = ffffffffffffffff
	ldstuba	[%i3+%g0]0x88,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010181408] = 0a32e176, %l2 = ffbf607e20dd659f
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 000000000a32e176
!	Mem[0000000010081410] = 0000ff00, %l6 = 00000000000000ff
	ldstuba	[%i2+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	%f24 = b0a875a6 00000000, %l1 = ffffffffffffd600
!	Mem[0000000030101408] = 4900000000000000
	add	%i4,0x008,%g1
	stda	%f24,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030101408] = 4900000000000000
!	Mem[0000000010141400] = 00000573, %l4 = 00000000ff000000
	swapa	[%i5+%g0]0x80,%l4	! %l4 = 0000000000000573
!	%f16 = 00000000 ff00004b ece72778 0e5401ff
!	%f20 = ffffffff 4b0000ff acad0ca9 c1932168
!	%f24 = b0a875a6 00000000 00000000 00000000
!	%f28 = 4b0000ff 00000000 9f1d2100 00000000
	stda	%f16,[%i5]ASI_BLK_PL	! Block Store to 0000000010141400
!	Mem[0000000030101410] = 76e1320a, %l0 = 000000000000006f
	ldstuba	[%i4+%o5]0x81,%l0	! %l0 = 00000076000000ff
!	%l7 = 00000000000000f1, Mem[00000000218001c1] = 00006949
	stb	%l7,[%o3+0x1c1]		! Mem[00000000218001c0] = 00f16949
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ffffffff, %l7 = 00000000000000f1
	ldsha	[%i2+%g0]0x80,%l7	! %l7 = ffffffffffffffff

p0_label_247:
!	Mem[0000000020800040] = ff00c1d1, %l5 = ffffffffffffffff
	ldub	[%o1+0x041],%l5		! %l5 = 0000000000000000
!	Mem[00000000300c1408] = f8ffffff fffff1df, %l0 = 00000076, %l1 = ffffd600
	ldda	[%i3+%o4]0x89,%l0	! %l0 = 00000000fffff1df 00000000f8ffffff
!	Mem[0000000030001400] = 000000ff, %l1 = 00000000f8ffffff
	ldsha	[%i0+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[000000001008141c] = c193a468, %l7 = ffffffffffffffff
	lduwa	[%i2+0x01c]%asi,%l7	! %l7 = 00000000c193a468
	membar	#Sync			! Added by membar checker (40)
!	Mem[00000000300c1400] = d60000ff 00000000 dff1ffff fffffff8
!	Mem[00000000300c1410] = 00000001 ffbf607e acad0ca9 c193a468
!	Mem[00000000300c1420] = e139503d 8ea847d9 f8ffffff 5063fba2
!	Mem[00000000300c1430] = a675a8b0 7cfb0e7c 55045c7d 6de02ca5
	ldda	[%i3]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010141408] = ff01540e7827e7ec, %l2 = 000000000a32e176
	ldxa	[%i5+%o4]0x80,%l2	! %l2 = ff01540e7827e7ec
!	%l6 = 0000000000000000, immed = fffff6fa, %y  = 000000ff
	smul	%l6,-0x906,%l6		! %l6 = 0000000000000000, %y = 00000000
!	Mem[0000000020800040] = ff00c1d1, %l3 = fffffffffffff11b
	ldsba	[%o1+0x040]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010141408] = 0e5401ff, %l4 = 0000000000000573
	lduwa	[%i5+%o4]0x88,%l4	! %l4 = 000000000e5401ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181438] = a52ce06d, %l7 = 00000000c193a468, %asi = 80
	swapa	[%i6+0x038]%asi,%l7	! %l7 = 00000000a52ce06d

p0_label_248:
!	%f6  = 50630000 000075ff, Mem[0000000010181408] = 9f65dd20 00000000
	stda	%f6 ,[%i6+%o4]0x88	! Mem[0000000010181408] = 50630000 000075ff
!	%l0 = 00000000fffff1df, Mem[0000000030001400] = 000000ff
	stba	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000df
!	%f6  = 50630000 000075ff, Mem[0000000030101410] = ffe1320a 00006350
	stda	%f6 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 50630000 000075ff
!	%l6 = 00000000, %l7 = a52ce06d, Mem[0000000010081400] = ffffffff 0000ffff
	std	%l6,[%i2+%g0]		! Mem[0000000010081400] = 00000000 a52ce06d
!	%l3 = ffffffffffffffff, Mem[0000000030041408] = ff000000
	stwa	%l3,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffffff
!	Mem[00000000300c1408] = dff1ffff, %l0 = 00000000fffff1df
	ldstuba	[%i3+%o4]0x81,%l0	! %l0 = 000000df000000ff
!	%f0  = ff000000 00000000, %l6 = 0000000000000000
!	Mem[0000000030041420] = a5e9ac6394b18a76
	add	%i1,0x020,%g1
	stda	%f0,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030041420] = a5e9ac6394b18a76
!	%l4 = 0e5401ff, %l5 = 00000000, Mem[0000000030001408] = 000001ff 00000000
	stda	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 0e5401ff 00000000
!	Mem[0000000030181410] = 3d5039e1, %l1 = 00000000000000ff
	swapa	[%i6+%o5]0x89,%l1	! %l1 = 000000003d5039e1
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ff000093, %l7 = 00000000a52ce06d
	lduba	[%i3+0x013]%asi,%l7	! %l7 = 0000000000000093

p0_label_249:
!	Mem[0000000010081408] = 00000000, %l5 = 0000000000000000
	ldsba	[%i2+%o4]0x88,%l5	! %l5 = 0000000000000000
!	%l4 = 000000000e5401ff, imm = fffffffffffff249, %l0 = 00000000000000df
	and	%l4,-0xdb7,%l0		! %l0 = 000000000e540049
!	Mem[0000000010101408] = 000001ff, %l7 = 0000000000000093
	lduba	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = fff1ffff, %l7 = 0000000000000000
	ldsha	[%i3+%o4]0x81,%l7	! %l7 = fffffffffffffff1
!	Mem[00000000100c1408] = ff000000, %l5 = 0000000000000000
	ldswa	[%i3+0x008]%asi,%l5	! %l5 = ffffffffff000000
!	Mem[0000000010081408] = 00000000, %l5 = ffffffffff000000
	lduwa	[%i2+%o4]0x88,%l5	! %l5 = 0000000000000000
!	%l1 = 000000003d5039e1, immd = 0000000000000718, %l2  = ff01540e7827e7ec
	mulx	%l1,0x718,%l2		! %l2 = 000001b2f11a9418
!	Mem[0000000010181410] = ff000000, %f0  = ff000000
	lda	[%i6+%o5]0x80,%f0 	! %f0 = ff000000
!	Mem[0000000010081400] = 00000000, %l1 = 000000003d5039e1
	ldsba	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffff, Mem[0000000010181400] = ff000000
	stba	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = ff000000

p0_label_250:
!	%l2 = f11a9418, %l3 = ffffffff, Mem[0000000030181410] = 000000ff d947a88e
	stda	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = f11a9418 ffffffff
!	Mem[0000000030141410] = ff000000 ffffffbf, %l6 = 00000000, %l7 = fffffff1
	ldda	[%i5+%o5]0x81,%l6	! %l6 = 00000000ff000000 00000000ffffffbf
!	%l5 = 0000000000000000, Mem[0000000030041410] = 01ffffff00000000
	stxa	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000000000000000
!	Mem[00000000100c1438] = 00000000, %l2 = 000001b2f11a9418
	swap	[%i3+0x038],%l2		! %l2 = 0000000000000000
!	%f7  = 000075ff, Mem[0000000030041410] = 00000000
	sta	%f7 ,[%i1+%o5]0x89	! Mem[0000000030041410] = 000075ff
!	%l5 = 0000000000000000, Mem[0000000030101400] = 0000ffff
	stba	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000ff00
!	Mem[0000000030041410] = ff750000, %l1 = 0000000000000000
	swapa	[%i1+%o5]0x81,%l1	! %l1 = 00000000ff750000
!	%l4 = 000000000e5401ff, Mem[0000000010041410] = ff00004b
	stha	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 01ff004b
	membar	#Sync			! Added by membar checker (41)
!	%l2 = 0000000000000000, Mem[00000000300c1400] = ff0000d6
	stba	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 4b00ff01, %l0 = 000000000e540049
	lduha	[%i1+%o5]0x88,%l0	! %l0 = 000000000000ff01

p0_label_251:
!	Mem[0000000010141410] = 4b0000ff, %l7 = 00000000ffffffbf
	lduwa	[%i5+%o5]0x88,%l7	! %l7 = 000000004b0000ff
!	Mem[0000000010101410] = 00000000, %l4 = 000000000e5401ff
	ldswa	[%i4+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = ff00004b, %l3 = ffffffffffffffff
	lduwa	[%i5+%g0]0x88,%l3	! %l3 = 00000000ff00004b
!	Mem[0000000010081410] = ff00ff00, %l6 = 00000000ff000000
	lduha	[%i2+%o5]0x80,%l6	! %l6 = 000000000000ff00
!	Mem[0000000030001410] = ff750000, %l2 = 0000000000000000
	lduwa	[%i0+%o5]0x81,%l2	! %l2 = 00000000ff750000
!	Mem[0000000030181410] = 18941af1, %l5 = 0000000000000000
	lduba	[%i6+%o5]0x81,%l5	! %l5 = 0000000000000018
!	Mem[0000000020800000] = ffffba64, %l6 = 000000000000ff00
	ldsha	[%o1+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000100c1400] = ffffffff, %l7 = 000000004b0000ff
	ldsha	[%i3+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030101400] = 0000ff00, %l7 = ffffffffffffffff
	ldsha	[%i4+%g0]0x89,%l7	! %l7 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000ff01, Mem[0000000010181400] = 000000ff
	stha	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000ff01

p0_label_252:
!	Mem[0000000030141410] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i5+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030141408] = ff211d9f, %l4 = 00000000000000ff
	ldstuba	[%i5+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010001410] = 780000ff, %l2 = 00000000ff750000
	swapa	[%i0+%o5]0x80,%l2	! %l2 = 00000000780000ff
!	%l0 = 000000000000ff01, Mem[0000000010181410] = 000000ff
	stwa	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000ff01
!	Mem[0000000030141408] = 9f1d21ff, %l4 = 00000000000000ff
	swapa	[%i5+%o4]0x89,%l4	! %l4 = 000000009f1d21ff
!	%f0  = ff000000 00000000 e139503d 8ea847d9
!	%f4  = f1000000 000000ff 50630000 000075ff
!	%f8  = 000001ff 49000000 00ffffff 000000ff
!	%f12 = 010000ff 00000000 ece72778 0a32e176
	stda	%f0,[%i2]ASI_BLK_SL	! Block Store to 0000000030081400
!	%f24 = e139503d, Mem[0000000030141400] = 73050000
	sta	%f24,[%i5+%g0]0x89	! Mem[0000000030141400] = e139503d
!	%l2 = 00000000780000ff, Mem[0000000010081430] = 0000000076e1320a
	stx	%l2,[%i2+0x030]		! Mem[0000000010081430] = 00000000780000ff
!	%l6 = ffffffffffffffff, Mem[0000000030041410] = 00000000
	stwa	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = ffffffff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (42)
!	Mem[0000000010081408] = ffffffff00000000, %f28 = a675a8b0 7cfb0e7c
	ldda	[%i2+%o4]0x88,%f28	! %f28 = ffffffff 00000000

p0_label_253:
!	Mem[0000000010141400] = ff00004b, %l4 = 000000009f1d21ff
	ldsba	[%i5+%g0]0x88,%l4	! %l4 = 000000000000004b
!	Mem[0000000010101408] = 000001ff49000000, %f26 = f8ffffff 5063fba2
	ldda	[%i4+%o4]0x80,%f26	! %f26 = 000001ff 49000000
!	Mem[0000000010181414] = 00000000, %l3 = 00000000ff00004b
	lduw	[%i6+0x014],%l3		! %l3 = 0000000000000000
!	Mem[000000001004141c] = a90cadac, %l0 = 000000000000ff01
	ldsha	[%i1+0x01e]%asi,%l0	! %l0 = ffffffffffffadac
!	Mem[0000000010101408] = 000001ff, %f30 = 55045c7d
	lda	[%i4+%o4]0x80,%f30	! %f30 = 000001ff
!	Mem[0000000020800000] = ffffba64, %l3 = 0000000000000000
	ldsba	[%o1+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030041400] = 00ffffff, %l1 = 00000000ff750000
	ldsha	[%i1+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	%l4 = 000000000000004b, Mem[0000000010081400] = 00000000
	stba	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000004b
!	Mem[000000001010143c] = 0000002f, %l4 = 000000000000004b
	lduba	[%i4+0x03f]%asi,%l4	! %l4 = 000000000000002f
!	Starting 10 instruction Store Burst
!	%f20 = 00000001 ffbf607e, %l2 = 00000000780000ff
!	Mem[0000000030181418] = 0e26a88e3d5039e1
	add	%i6,0x018,%g1
	stda	%f20,[%g1+%l2]ASI_PST32_SL ! Mem[0000000030181418] = 7e60bfff01000000

p0_label_254:
!	%l4 = 000000000000002f, Mem[0000000030101400] = 0000ff00
	stha	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000002f
!	Mem[0000000030041408] = ffffffff, %l1 = 00000000000000ff
	ldstuba	[%i1+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	%l1 = 00000000000000ff, Mem[0000000030141408] = ff0000002bee0573
	stxa	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000000000ff
!	%l3 = ffffffffffffffff, Mem[0000000030141408] = 00000000
	stwa	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffff
!	%f4  = f1000000 000000ff, %l4 = 000000000000002f
!	Mem[0000000010101400] = 099ddcff00000000
	stda	%f4,[%i4+%l4]ASI_PST8_PL ! Mem[0000000010101400] = ff00000000000000
!	Mem[0000000030081400] = 00000000, %l4 = 000000000000002f
	ldstuba	[%i2+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%l0 = ffffffffffffadac, immd = fffffffffffff9fa, %l0 = ffffffffffffadac
	sdivx	%l0,-0x606,%l0		! %l0 = 000000000000000d
!	Mem[0000000010101408] = ff010000, %l7 = ffffffffffffff00
	ldstuba	[%i4+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101410] = 00000000, %l1 = 00000000000000ff
	swapa	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 000000ff000000ff, %l0 = 000000000000000d
	ldxa	[%i4+%o5]0x80,%l0	! %l0 = 000000ff000000ff

p0_label_255:
!	Mem[0000000010081408] = ffffffff00000000, %l7 = 0000000000000000
	ldxa	[%i2+%o4]0x88,%l7	! %l7 = ffffffff00000000
!	Mem[0000000010141408] = ff01540e, %l3 = ffffffffffffffff
	ldsha	[%i5+%o4]0x80,%l3	! %l3 = ffffffffffffff01
!	Mem[0000000030041408] = ff000000ffffffff, %f24 = e139503d 8ea847d9
	ldda	[%i1+%o4]0x89,%f24	! %f24 = ff000000 ffffffff
!	Mem[0000000010101438] = a2fbff500000002f, %l4 = 0000000000000000
	ldx	[%i4+0x038],%l4		! %l4 = a2fbff500000002f
!	Mem[0000000010181408] = 50630000 000075ff, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i6+%o4]0x88,%l0	! %l0 = 00000000000075ff 0000000050630000
!	Mem[0000000030101408] = 49000000, %l3 = ffffffffffffff01
	lduba	[%i4+%o4]0x81,%l3	! %l3 = 0000000000000049
!	%f29 = 00000000, %f28 = ffffffff, %f6  = 50630000 000075ff
	fsmuld	%f29,%f28,%f6 		! %f6  = ffffffff e0000000
!	Mem[00000000300c1410] = 00000001ffbf607e, %l2 = 00000000780000ff
	ldxa	[%i3+%o5]0x81,%l2	! %l2 = 00000001ffbf607e
!	Mem[00000000100c1400] = ffffffff d60000ff ff000000 000000ff
!	Mem[00000000100c1410] = ff000093 00000000 ff0000d6 0021009f
!	Mem[00000000100c1420] = 00ff001b ff00ffff 9f65dd20 7e60bfff
!	Mem[00000000100c1430] = 009bec30 49000000 f11a9418 000000ff
	ldda	[%i3]ASI_BLK_PL,%f0	! Block Load from 00000000100c1400
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000075ff, Mem[0000000030041410] = 00000000ffffffff
	stxa	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000000075ff

p0_label_256:
!	Mem[0000000030041408] = ffffffff, %l5 = 0000000000000018
	swapa	[%i1+%o4]0x89,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010141404] = 00000000, %l7 = 00000000, %l4 = 0000002f
	add	%i5,0x04,%g1
	casa	[%g1]0x80,%l7,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1420] = 00ff001b, %l4 = 0000000000000000
	swap	[%i3+0x020],%l4		! %l4 = 0000000000ff001b
!	%l7 = ffffffff00000000, Mem[0000000030141408] = ffffffff000000ff
	stxa	%l7,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffffff00000000
!	%f17 = 00000000, Mem[0000000010041410] = 4b00ff01
	sta	%f17,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	Mem[0000000030101408] = 49000000, %l0 = 00000000000075ff
	swapa	[%i4+%o4]0x81,%l0	! %l0 = 0000000049000000
!	Mem[00000000300c1400] = ff000000, %l4 = 0000000000ff001b
	ldstuba	[%i3+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%l2 = 00000001ffbf607e, Mem[00000000300c1408] = fff1fffffffffff8
	stxa	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000001ffbf607e
!	%l2 = 00000001ffbf607e, Mem[0000000030181410] = fffffffff11a9418
	stxa	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000001ffbf607e
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ffffffff4b0000ff, %f28 = ffffffff 00000000
	ldda	[%i5+%o5]0x88,%f28	! %f28 = ffffffff 4b0000ff

p0_label_257:
!	Mem[0000000030081400] = 000000ff, %l6 = ffffffffffffffff
	lduha	[%i2+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041434] = 00ffff00, %l4 = 0000000000000000
	lduha	[%i1+0x034]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181400] = 00000000 0000ff01, %l2 = ffbf607e, %l3 = 00000049
	ldda	[%i6+%g0]0x88,%l2	! %l2 = 000000000000ff01 0000000000000000
!	Mem[00000000300c1408] = 01000000, %l7 = ffffffff00000000
	ldsha	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[000000001008140c] = ffffffff, %f17 = 00000000
	lda	[%i2+0x00c]%asi,%f17	! %f17 = ffffffff
!	Mem[0000000010141418] = 682193c1, %l3 = 0000000000000000
	ldswa	[%i5+0x018]%asi,%l3	! %l3 = 00000000682193c1
!	Mem[000000001018143c] = 000000ff, %f20 = 00000001
	ld	[%i6+0x03c],%f20	! %f20 = 000000ff
!	Mem[0000000030141410] = 000000ff, %f18 = dff1ffff
	lda	[%i5+%o5]0x89,%f18	! %f18 = 000000ff
!	Mem[0000000020800000] = ffffba64, %l4 = 00000000000000ff
	ldsh	[%o1+%g0],%l4		! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ffffffff, Mem[0000000010101400] = 00000000000000ff
	stxa	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000ffffffff

p0_label_258:
!	Mem[0000000010141438] = 00000000, %l1 = 0000000050630000
	swap	[%i5+0x038],%l1		! %l1 = 0000000000000000
!	Mem[0000000010041418] = 682193c1, %l2 = 000000000000ff01
	ldstub	[%i1+0x018],%l2		! %l2 = 00000068000000ff
!	%l0 = 49000000, %l1 = 00000000, Mem[0000000010041408] = 00000000 000039e1
	stda	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 49000000 00000000
!	%f18 = 000000ff, Mem[0000000030181410] = ffbf607e
	sta	%f18,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff
!	Mem[000000001018142b] = 00000573, %l0 = 0000000049000000
	ldstub	[%i6+0x02b],%l0		! %l0 = 00000073000000ff
!	Mem[0000000010001403] = 00000000, %l7 = 0000000000000000
	ldstub	[%i0+0x003],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010101424] = 00000070, %l1 = 0000000000000000
	ldstuba	[%i4+0x024]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[00000000201c0001] = 00ff4c08, %l2 = 0000000000000068
	ldstuba	[%o0+0x001]%asi,%l2	! %l2 = 000000ff000000ff
!	%l1 = 0000000000000000, Mem[0000000010001418] = 0000000072507abd, %asi = 80
	stxa	%l1,[%i0+0x018]%asi	! Mem[0000000010001418] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 000000ff00000000, %f20 = 000000ff ffbf607e
	ldda	[%i0+%g0]0x80,%f20	! %f20 = 000000ff 00000000

p0_label_259:
!	Mem[0000000021800140] = 000005d8, %l6 = 00000000000000ff
	ldsh	[%o3+0x140],%l6		! %l6 = 0000000000000000
!	Mem[0000000030101400] = 0000002f, %l5 = 00000000ffffffff
	ldsha	[%i4+%g0]0x89,%l5	! %l5 = 000000000000002f
!	Code Fragment 4
p0_fragment_20:
!	%l0 = 0000000000000073
	setx	0xbbf51df03b40c877,%g7,%l0 ! %l0 = bbf51df03b40c877
!	%l1 = 0000000000000000
	setx	0x673322d7888baf19,%g7,%l1 ! %l1 = 673322d7888baf19
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = bbf51df03b40c877
	setx	0xb6786547a452e87d,%g7,%l0 ! %l0 = b6786547a452e87d
!	%l1 = 673322d7888baf19
	setx	0xde67372007308f8d,%g7,%l1 ! %l1 = de67372007308f8d
!	Mem[0000000010101408] = ff0001ff, %l4 = ffffffffffffffff
	lduha	[%i4+%o4]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010181408] = 000075ff, %l2 = 00000000000000ff
	ldsha	[%i6+%o4]0x88,%l2	! %l2 = 00000000000075ff
!	Mem[0000000030041410] = ff750000, %l2 = 00000000000075ff
	ldswa	[%i1+%o5]0x81,%l2	! %l2 = ffffffffff750000
!	Mem[0000000010181410] = 0000ff01, %l5 = 000000000000002f
	ldswa	[%i6+%o5]0x88,%l5	! %l5 = 000000000000ff01
!	Mem[00000000211c0000] = ffff85d2, %l4 = 000000000000ff00
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001410] = ff750000, %l0 = b6786547a452e87d
	lduba	[%i0+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000020800001] = ffffba64, %l0 = 00000000000000ff
	ldstuba	[%o1+0x001]%asi,%l0	! %l0 = 000000ff000000ff

p0_label_260:
!	%l4 = ffffffffffffffff, Mem[0000000030081410] = 000000ff
	stba	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff
!	%f1  = ffffffff, Mem[0000000010001418] = 00000000
	st	%f1 ,[%i0+0x018]	! Mem[0000000010001418] = ffffffff
!	Mem[0000000010001410] = 000075ff, %l2 = ffffffffff750000
	swapa	[%i0+%o5]0x88,%l2	! %l2 = 00000000000075ff
!	Mem[0000000010181430] = 0000008000000000, %l0 = 00000000000000ff, %l6 = 0000000000000000
	add	%i6,0x30,%g1
	casxa	[%g1]0x80,%l0,%l6	! %l6 = 0000008000000000
!	%l2 = 00000000000075ff, Mem[0000000010181408] = ff750000
	stba	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = ff750000
!	%f16 = d60000ff ffffffff, %l7 = 0000000000000000
!	Mem[0000000010001428] = ffbf607e20dd659f
	add	%i0,0x028,%g1
	stda	%f16,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010001428] = ffbf607e20dd659f
!	%l6 = 0000008000000000, Mem[00000000300c1400] = ff0000ff
	stha	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000ff
!	Mem[0000000010101430] = 73050000, %l1 = de67372007308f8d
	swap	[%i4+0x030],%l1		! %l1 = 0000000073050000
!	%l2 = 00000000000075ff, Mem[0000000030181400] = 000000f1
	stwa	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 000075ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 01ff0000, %l2 = 00000000000075ff
	lduwa	[%i6+%o5]0x80,%l2	! %l2 = 0000000001ff0000

p0_label_261:
!	Mem[0000000030181408] = 76e1320a, %l4 = ffffffffffffffff
	ldswa	[%i6+%o4]0x81,%l4	! %l4 = 0000000076e1320a
!	Mem[0000000010001408] = 000000ff, %f29 = 4b0000ff
	lda	[%i0+%o4]0x80,%f29	! %f29 = 000000ff
!	Mem[0000000030181400] = ff750000, %l7 = 0000000000000000
	ldsha	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141408] = ffffffff, %l1 = 0000000073050000
	ldsha	[%i5+%o4]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[000000001018143c] = 000000ff, %l7 = 0000000000000000
	lduw	[%i6+0x03c],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010181404] = 00000000, %l3 = 00000000682193c1
	ldsba	[%i6+0x007]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041410] = 000075ff, %l7 = 00000000000000ff
	lduba	[%i1+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000201c0000] = 00ff4c08, %l1 = ffffffffffffffff
	ldsb	[%o0+%g0],%l1		! %l1 = 0000000000000000
!	Mem[0000000010101410] = 000000ff, %l5 = 000000000000ff01
	ldsha	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 76e1320a, %l5 = 00000000, Mem[0000000030041408] = 00000018 ff000000
	stda	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 76e1320a 00000000

p0_label_262:
!	%f21 = 00000000, Mem[00000000300c1408] = 01000000
	sta	%f21,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	Mem[0000000030081408] = d947a88e, %l5 = 0000000000000000
	swapa	[%i2+%o4]0x81,%l5	! %l5 = 00000000d947a88e
!	Mem[0000000030081408] = 00000000, %l2 = 0000000001ff0000
	ldstuba	[%i2+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1400] = ffffffff, %l2 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[0000000030041408] = 0a32e176
	stba	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = ff32e176
!	%f12 = 00000049 30ec9b00, %l6 = 0000008000000000
!	Mem[00000000300c1430] = a675a8b07cfb0e7c
	add	%i3,0x030,%g1
	stda	%f12,[%g1+%l6]ASI_PST32_SL ! Mem[00000000300c1430] = a675a8b07cfb0e7c
!	%l6 = 0000008000000000, Mem[0000000010101428] = ffffff04c26ceff2, %asi = 80
	stxa	%l6,[%i4+0x028]%asi	! Mem[0000000010101428] = 0000008000000000
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000030001400] = 000000df bfffffff
	stda	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff 00000000
!	%l2 = 00000000000000ff, Mem[00000000300c1408] = 00000000
	stwa	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001004140c] = 00000000, %f7  = d60000ff
	lda	[%i1+0x00c]%asi,%f7 	! %f7 = 00000000

p0_label_263:
!	Mem[0000000010081408] = ffffffff 00000000, %l4 = 76e1320a, %l5 = d947a88e
	ldda	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000000 00000000ffffffff
!	Mem[0000000010081400] = 0000004b, %l1 = 0000000000000000
	ldsha	[%i2+%g0]0x88,%l1	! %l1 = 000000000000004b
!	Mem[0000000030041400] = ffffffffffffff00, %f14 = ff000000 18941af1
	ldda	[%i1+%g0]0x89,%f14	! %f14 = ffffffff ffffff00
!	Mem[0000000010181404] = 00000000, %l4 = 0000000000000000
	lduh	[%i6+0x004],%l4		! %l4 = 0000000000000000
!	Mem[0000000030141400] = e139503d, %l6 = 0000008000000000
	ldswa	[%i5+%g0]0x89,%l6	! %l6 = ffffffffe139503d
!	Mem[0000000010101428] = 00000080, %l3 = 0000000000000000
	ldsb	[%i4+0x02a],%l3		! %l3 = 0000000000000000
!	Mem[0000000030101400] = 2f00000000000000, %f20 = 000000ff 00000000
	ldda	[%i4+%g0]0x81,%f20	! %f20 = 2f000000 00000000
!	Mem[0000000010181434] = 00000000, %l7 = 00000000000000ff
	ldsw	[%i6+0x034],%l7		! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 000000ff, %l3 = 0000000000000000
	lduha	[%i3+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1439] = f11a9418, %l7 = 0000000000000000
	ldstuba	[%i3+0x039]%asi,%l7	! %l7 = 0000001a000000ff

p0_label_264:
!	%l0 = 000000ff, %l1 = 0000004b, Mem[0000000010041400] = 4b0000ff 00000000
	stda	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff 0000004b
!	%l2 = 00000000000000ff, Mem[0000000030081400] = ff000000
	stha	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 00ff0000
!	%l4 = 0000000000000000, Mem[0000000030041400] = ffffffffffffff00
	stxa	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000000000000000
!	%l6 = ffffffffe139503d, Mem[0000000030081400] = ff0000000000ff00
	stxa	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffffe139503d
!	%l0 = 00000000000000ff, Mem[00000000300c1408] = 000000ff
	stba	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff
!	%l3 = 00000000000000ff, Mem[0000000010141400] = ff00004b
	stwa	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff
!	%f25 = ffffffff, Mem[0000000010081400] = 4b000000
	sta	%f25,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffffff
!	%f12 = 00000049 30ec9b00, %l0 = 00000000000000ff
!	Mem[0000000010081420] = e139503d8ea847d9
	add	%i2,0x020,%g1
	stda	%f12,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010081420] = 009bec3049000000
!	%l2 = 00000000000000ff, %l0 = 00000000000000ff, %y  = 00000000
	udiv	%l2,%l0,%l2		! %l2 = 0000000000000001
	mov	%l0,%y			! %y = 000000ff
!	Starting 10 instruction Load Burst
!	%l3 = 00000000000000ff, %l0 = 00000000000000ff, %l1 = 000000000000004b
	subc	%l3,%l0,%l1		! %l1 = 0000000000000000

p0_label_265:
!	Mem[0000000010081400] = ffffffff, %l1 = 0000000000000000
	lduha	[%i2+%g0]0x88,%l1	! %l1 = 000000000000ffff
!	Mem[00000000211c0000] = ffff85d2, %l4 = 0000000000000000
	lduba	[%o2+0x001]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081400] = ffffffff, %l3 = 00000000000000ff
	lduha	[%i2+%g0]0x80,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010101408] = ff0001ff, %l6 = ffffffffe139503d
	lduha	[%i4+%o4]0x80,%l6	! %l6 = 000000000000ff00
!	Mem[00000000300c1410] = 00000001, %f27 = 49000000
	lda	[%i3+%o5]0x81,%f27	! %f27 = 00000001
!	Mem[0000000010041408] = 49000000, %l1 = 000000000000ffff
	lduh	[%i1+0x00a],%l1		! %l1 = 0000000000000000
!	Mem[0000000010101420] = 00000000, %l5 = 00000000ffffffff
	ldswa	[%i4+0x020]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141410] = ff00004b ffffffff, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i5+%o5]0x80,%l4	! %l4 = 00000000ff00004b 00000000ffffffff
!	Mem[0000000030141400] = e139503d, %f0  = ff0000d6
	lda	[%i5+%g0]0x89,%f0 	! %f0 = e139503d
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = ff000000, %l1 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l1	! %l1 = 000000ff000000ff

p0_label_266:
!	%l1 = 00000000000000ff, Mem[0000000030101410] = 50630000
	stba	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = ff630000
!	%f10 = ffbf607e 20dd659f, Mem[0000000010101400] = ffffffff 00000000
	stda	%f10,[%i4+%g0]0x88	! Mem[0000000010101400] = ffbf607e 20dd659f
!	%l6 = 0000ff00, %l7 = 0000001a, Mem[0000000010141408] = ff01540e 7827e7ec
	stda	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000ff00 0000001a
!	%l7 = 000000000000001a, Mem[0000000010001408] = 000000ff00000000, %asi = 80
	stxa	%l7,[%i0+0x008]%asi	! Mem[0000000010001408] = 000000000000001a
!	%l4 = 00000000ff00004b, Mem[0000000010141408] = 0000ff000000001a
	stx	%l4,[%i5+%o4]		! Mem[0000000010141408] = 00000000ff00004b
!	Mem[0000000030101408] = ff750000, %l7 = 000000000000001a
	ldstuba	[%i4+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[00000000300c1408] = 000000ff
	stba	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%l3 = 000000000000ffff, Mem[0000000030041410] = ff750000
	stwa	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000ffff
!	%l3 = 000000000000ffff, Mem[0000000030081408] = 000000ff
	stha	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000000, %l1 = 00000000000000ff
	ldswa	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000000

p0_label_267:
!	Mem[0000000010101410] = ff000000, %l6 = 000000000000ff00
	ldsha	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = ffff85d2, %l1 = 0000000000000000
	ldsba	[%o2+0x000]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001410] = 000075ff, %l2 = 0000000000000001
	ldsh	[%i0+0x012],%l2		! %l2 = 00000000000075ff
!	Mem[0000000010001408] = 00000000, %l5 = 00000000ffffffff
	ldsba	[%i0+%o4]0x88,%l5	! %l5 = 0000000000000000
!	%l4 = 00000000ff00004b, immed = fffff490, %y  = 000000ff
	udiv	%l4,-0xb70,%l2		! %l2 = 00000000000000ff
	mov	%l0,%y			! %y = 000000ff
!	Mem[0000000010101424] = ff000070, %l1 = ffffffffffffffff
	ldswa	[%i4+0x024]%asi,%l1	! %l1 = ffffffffff000070
!	Mem[0000000010081400] = ffffffff, %l5 = 0000000000000000
	ldsw	[%i2+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000030041410] = 0000ffff00000000, %l5 = ffffffffffffffff
	ldxa	[%i1+%o5]0x81,%l5	! %l5 = 0000ffff00000000
!	Mem[0000000010081438] = ffffffff f20a2ca5, %l4 = ff00004b, %l5 = 00000000
	ldd	[%i2+0x038],%l4		! %l4 = 00000000ffffffff 00000000f20a2ca5
!	Starting 10 instruction Store Burst
!	Mem[0000000010101420] = 00000000, %l4 = ffffffff, %l2 = 000000ff
	add	%i4,0x20,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 0000000000000000

p0_label_268:
!	%l2 = 00000000, %l3 = 0000ffff, Mem[0000000010181408] = ff750000 00006350
	stda	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 0000ffff
!	Mem[0000000010001424] = 1b00ff00, %l2 = 0000000000000000
	swap	[%i0+0x024],%l2		! %l2 = 000000001b00ff00
!	%l5 = 00000000f20a2ca5, Mem[0000000030001408] = ff01540e
	stha	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = 2ca5540e
!	%f29 = 000000ff, Mem[0000000010141430] = 00000000
	sta	%f29,[%i5+0x030]%asi	! Mem[0000000010141430] = 000000ff
!	%l4 = 00000000ffffffff, Mem[0000000010081408] = 00000000
	stw	%l4,[%i2+%o4]		! Mem[0000000010081408] = ffffffff
!	%f12 = 00000049 30ec9b00, %l4 = 00000000ffffffff
!	Mem[0000000030041408] = ff32e17600000000
	add	%i1,0x008,%g1
	stda	%f12,[%g1+%l4]ASI_PST32_S ! Mem[0000000030041408] = 0000004930ec9b00
!	Mem[0000000030041408] = 49000000, %l2 = 000000001b00ff00
	swapa	[%i1+%o4]0x89,%l2	! %l2 = 0000000049000000
!	Mem[0000000010141434] = ff00004b, %l1 = ffffffffff000070
	ldstub	[%i5+0x034],%l1		! %l1 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (43)
!	%l3 = 000000000000ffff, Mem[00000000100c1408] = ff000000
	stha	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 9f65dd20, %l4 = 00000000ffffffff
	ldstuba	[%i4+%g0]0x80,%l4	! %l4 = 0000009f000000ff

p0_label_269:
!	Mem[0000000010181404] = 00000000, %l1 = 00000000000000ff
	ldsha	[%i6+0x004]%asi,%l1	! %l1 = 0000000000000000
!	Mem[000000001000140c] = 0000001a, %l1 = 0000000000000000
	lduha	[%i0+0x00e]%asi,%l1	! %l1 = 000000000000001a
!	Mem[000000001004141c] = a90cadac, %l0 = 00000000000000ff
	lduw	[%i1+0x01c],%l0		! %l0 = 00000000a90cadac
!	Mem[0000000030081410] = 000000ff, %l1 = 000000000000001a
	lduha	[%i2+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101400] = 0000002f, %l4 = 000000000000009f
	ldsha	[%i4+%g0]0x89,%l4	! %l4 = 000000000000002f
!	Code Fragment 4
p0_fragment_21:
!	%l0 = 00000000a90cadac
	setx	0x920831504bb1373b,%g7,%l0 ! %l0 = 920831504bb1373b
!	%l1 = 00000000000000ff
	setx	0x86b4de1f8446d71f,%g7,%l1 ! %l1 = 86b4de1f8446d71f
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 920831504bb1373b
	setx	0x36502098135ee927,%g7,%l0 ! %l0 = 36502098135ee927
!	%l1 = 86b4de1f8446d71f
	setx	0xbfcb81b81f67e806,%g7,%l1 ! %l1 = bfcb81b81f67e806
!	Mem[0000000010181408] = ffff000000000000, %l2 = 0000000049000000
	ldxa	[%i6+%o4]0x88,%l2	! %l2 = ffff000000000000
!	Mem[0000000010101408] = ff0001ff49000000, %f10 = ffbf607e 20dd659f
	ldda	[%i4+%o4]0x80,%f10	! %f10 = ff0001ff 49000000
!	%l3 = 000000000000ffff, immd = fffffffffffff5ad, %l2 = ffff000000000000
	udivx	%l3,-0xa53,%l2		! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f14 = ffffffff, Mem[00000000300c1400] = ff000000
	sta	%f14,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffffff

p0_label_270:
!	Mem[0000000020800041] = ff00c1d1, %l3 = 000000000000ffff
	ldstub	[%o1+0x041],%l3		! %l3 = 00000000000000ff
!	%l5 = 00000000f20a2ca5, Mem[0000000030001410] = ff750000
	stba	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = a5750000
!	%l7 = 0000000000000000, %l1 = bfcb81b81f67e806, %l0 = 36502098135ee927
	or	%l7,%l1,%l0		! %l0 = bfcb81b81f67e806
!	Mem[0000000010081408] = ffffffff, %l5 = 00000000f20a2ca5
	swapa	[%i2+%o4]0x88,%l5	! %l5 = 00000000ffffffff
!	%l1 = bfcb81b81f67e806, Mem[0000000010141408] = 00000000
	stba	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = 06000000
!	%l6 = 0000000000000000, Mem[0000000030081410] = f1000000000000ff
	stxa	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010141416] = ffffffff, %asi = 80
	stha	%l3,[%i5+0x016]%asi	! Mem[0000000010141414] = ffff0000
!	%f0  = e139503d ffffffff, Mem[0000000030001408] = 0e54a52c 00000000
	stda	%f0 ,[%i0+%o4]0x89	! Mem[0000000030001408] = e139503d ffffffff
!	Mem[0000000010141400] = 000000ff, %l0 = bfcb81b81f67e806
	swapa	[%i5+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ff000000, %f6  = 9f002100
	lda	[%i1+%g0]0x88,%f6 	! %f6 = ff000000

p0_label_271:
!	Mem[00000000100c1438] = f1ff9418000000ff, %f30 = 000001ff 6de02ca5
	ldda	[%i3+0x038]%asi,%f30	! %f30 = f1ff9418 000000ff
!	Mem[0000000030001408] = e139503d ffffffff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i0+%o4]0x89,%l2	! %l2 = 00000000ffffffff 00000000e139503d
!	Mem[0000000010181400] = 01ff000000000000, %f24 = ff000000 ffffffff
	ldda	[%i6+%g0]0x80,%f24	! %f24 = 01ff0000 00000000
!	Mem[0000000030041400] = 00000000, %l4 = 000000000000002f
	ldsha	[%i1+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041408] = 49000000, %f20 = 2f000000
	lda	[%i1+%o4]0x80,%f20	! %f20 = 49000000
!	Mem[00000000100c141c] = 0021009f, %l1 = bfcb81b81f67e806
	lduwa	[%i3+0x01c]%asi,%l1	! %l1 = 000000000021009f
!	Mem[0000000030081400] = 3d5039e1, %l7 = 0000000000000000
	ldsha	[%i2+%g0]0x81,%l7	! %l7 = 0000000000003d50
!	Mem[0000000030141410] = ff000000, %l1 = 000000000021009f
	lduwa	[%i5+%o5]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[0000000030101410] = ff750000000063ff, %f26 = 000001ff 00000001
	ldda	[%i4+%o5]0x89,%f26	! %f26 = ff750000 000063ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 000075ff, %l6 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l6	! %l6 = 00000000000000ff

p0_label_272:
!	%l5 = 00000000ffffffff, Mem[00000000300c1408] = 00000000ffbf607e
	stxa	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000ffffffff
!	%l2 = 00000000ffffffff, Mem[0000000030141408] = ffffffff
	stha	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffffff
!	%l2 = 00000000ffffffff, Mem[0000000010081410] = 00ff00ff
	stwa	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = ffffffff
!	Mem[0000000010081408] = f20a2ca5, %l0 = 00000000000000ff
	swapa	[%i2+%o4]0x88,%l0	! %l0 = 00000000f20a2ca5
!	%l7 = 0000000000003d50, Mem[0000000030101410] = ff630000
	stha	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 3d500000
!	%l5 = 00000000ffffffff, Mem[0000000030101408] = ff0075ff00000000
	stxa	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000ffffffff
!	Mem[000000001018141c] = ffffffff, %l6 = 00000000, %l6 = 00000000
	add	%i6,0x1c,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 00000000ffffffff
!	Mem[00000000201c0000] = 00ff4c08, %l5 = 00000000ffffffff
	ldstub	[%o0+%g0],%l5		! %l5 = 00000000000000ff
!	%l0 = f20a2ca5, %l1 = ff000000, Mem[0000000030041410] = 0000ffff 00000000
	stda	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = f20a2ca5 ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 000000ff, %l3 = 00000000e139503d
	lduwa	[%i1+%g0]0x80,%l3	! %l3 = 00000000000000ff

p0_label_273:
!	Mem[00000000300c1410] = 01000000, %l1 = 00000000ff000000
	lduba	[%i3+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181410] = 01ff0000, %l0 = 00000000f20a2ca5
	lduwa	[%i6+%o5]0x80,%l0	! %l0 = 0000000001ff0000
!	Mem[0000000030141400] = 3d5039e1 00006350, %l6 = ffffffff, %l7 = 00003d50
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 000000003d5039e1 0000000000006350
!	Mem[0000000010181408] = ffff0000 00000000, %l0 = 01ff0000, %l1 = 00000000
	ldda	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000000 00000000ffff0000
!	Mem[0000000010181408] = 00000000, %f19 = fffffff8
	lda	[%i6+%o4]0x88,%f19	! %f19 = 00000000
!	Mem[0000000030141410] = ff000000, %l0 = 0000000000000000
	lduba	[%i5+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041408] = 00000049, %l1 = 00000000ffff0000
	ldsba	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000049
!	Mem[0000000020800000] = ffffba64, %l0 = 00000000000000ff
	ldub	[%o1+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[000000001000140c] = 0000001a, %l0 = 00000000000000ff
	ldsha	[%i0+0x00c]%asi,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f20 = 49000000 00000000, %l6 = 000000003d5039e1
!	Mem[0000000030181430] = ff0000d6ffffffff
	add	%i6,0x030,%g1
	stda	%f20,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030181430] = 000000d6ff000049

p0_label_274:
!	Mem[0000000030001410] = 000075a5, %l4 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l4	! %l4 = 000000a5000000ff
!	%l4 = 00000000000000a5, immed = 00000668, %y  = 000000ff
	sdiv	%l4,0x668,%l2		! %l2 = 0000000027ce0c7c
	mov	%l0,%y			! %y = 00000000
!	Mem[00000000100c1408] = 0000ffff, %l0 = 0000000000000000
	ldstuba	[%i3+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010101430] = 07308f8d, %l4 = 00000000000000a5, %asi = 80
	swapa	[%i4+0x030]%asi,%l4	! %l4 = 0000000007308f8d
!	%l2 = 0000000027ce0c7c, Mem[0000000030101410] = 0000503d
	stba	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000507c
!	%l0 = 00000000000000ff, Mem[0000000010001410] = 000075ff
	stha	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 00ff75ff
!	%f30 = f1ff9418 000000ff, %l6 = 000000003d5039e1
!	Mem[0000000030101408] = 00000000ffffffff
	add	%i4,0x008,%g1
	stda	%f30,[%g1+%l6]ASI_PST32_S ! Mem[0000000030101408] = 00000000000000ff
!	Mem[0000000010041410] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i1+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	%l2 = 27ce0c7c, %l3 = 000000ff, Mem[0000000030001400] = ff000000 00000000
	stda	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 27ce0c7c 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ffffba64, %l4 = 0000000007308f8d
	ldsba	[%o1+0x001]%asi,%l4	! %l4 = ffffffffffffffff

p0_label_275:
!	Mem[0000000010101424] = ff000070, %l5 = 0000000000000000
	swap	[%i4+0x024],%l5		! %l5 = 00000000ff000070
!	Mem[0000000030181400] = ff0075ff20dd659f, %l4 = ffffffffffffffff
	ldxa	[%i6+%g0]0x81,%l4	! %l4 = ff0075ff20dd659f
!	Mem[0000000010041408] = 4900000000000000, %l5 = 00000000ff000070
	ldxa	[%i1+%o4]0x80,%l5	! %l5 = 4900000000000000
!	Mem[0000000010101408] = ff0100ff, %l3 = 00000000000000ff
	lduwa	[%i4+%o4]0x88,%l3	! %l3 = 00000000ff0100ff
!	Mem[00000000218000c0] = ffff4ce8, %l5 = 4900000000000000
	ldub	[%o3+0x0c1],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010081400] = ffffffff, %l6 = 000000003d5039e1
	lduba	[%i2+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181410] = 01ff0000, %l3 = 00000000ff0100ff
	ldswa	[%i6+%o5]0x80,%l3	! %l3 = 0000000001ff0000
!	Mem[0000000010181400] = 0000ff01, %l6 = 00000000000000ff
	ldsha	[%i6+%g0]0x88,%l6	! %l6 = ffffffffffffff01
!	Mem[0000000030101400] = 0000002f, %l4 = ff0075ff20dd659f
	lduba	[%i4+%g0]0x89,%l4	! %l4 = 000000000000002f
!	Starting 10 instruction Store Burst
!	%l4 = 0000002f, %l5 = 000000ff, Mem[0000000030001410] = ff750000 00006350
	stda	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000002f 000000ff

p0_label_276:
!	%l4 = 000000000000002f, Mem[0000000010041408] = 49000000
	stha	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 002f0000
!	%l6 = ffffffffffffff01, Mem[0000000010041424] = a675a8b0
	stw	%l6,[%i1+0x024]		! Mem[0000000010041424] = ffffff01
!	%l3 = 0000000001ff0000, %l5 = 00000000000000ff, %l4 = 000000000000002f
	subc	%l3,%l5,%l4		! %l4 = 0000000001feff01
!	Mem[0000000010101418] = dd9dc0ff, %l7 = 0000000000006350, %asi = 80
	swapa	[%i4+0x018]%asi,%l7	! %l7 = 00000000dd9dc0ff
!	Mem[000000001008143a] = ffffffff, %l6 = ffffffffffffff01
	ldstuba	[%i2+0x03a]%asi,%l6	! %l6 = 000000ff000000ff
!	%f7  = 00000000, Mem[0000000010141410] = ff00004b
	sta	%f7 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	%l7 = 00000000dd9dc0ff, Mem[0000000030141400] = 3d5039e1
	stwa	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = dd9dc0ff
!	Mem[0000000010141400] = 06e8671f, %l1 = 0000000000000049, %asi = 80
	swapa	[%i5+0x000]%asi,%l1	! %l1 = 0000000006e8671f
!	%l2 = 0000000027ce0c7c, Mem[0000000010001408] = 00000000
	stha	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 0c7c0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 2f000000, %l7 = 00000000dd9dc0ff
	lduha	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000000

p0_label_277:
!	Mem[0000000030101410] = 0000507c, %l6 = 00000000000000ff
	ldsha	[%i4+%o5]0x89,%l6	! %l6 = 000000000000507c
!	Mem[0000000030041400] = 00000000, %l5 = 00000000000000ff
	ldsba	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081420] = 009bec30, %l3 = 0000000001ff0000
	ldsh	[%i2+0x022],%l3		! %l3 = ffffffffffffec30
!	Mem[0000000010081400] = ffffffffa52ce06d, %f24 = 01ff0000 00000000
	ldd	[%i2+%g0],%f24		! %f24 = ffffffff a52ce06d
!	Mem[0000000020800000] = ffffba64, %l4 = 0000000001feff01
	ldsha	[%o1+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000300c1410] = 01000000, %l1 = 0000000006e8671f
	lduwa	[%i3+%o5]0x89,%l1	! %l1 = 0000000001000000
!	Mem[0000000030181400] = ff0075ff, %l6 = 000000000000507c
	ldsba	[%i6+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181408] = ffff000000000000, %l6 = ffffffffffffffff
	ldxa	[%i6+%o4]0x88,%l6	! %l6 = ffff000000000000
!	Mem[0000000030181400] = 9f65dd20ff7500ff, %f14 = ffffffff ffffff00
	ldda	[%i6+%g0]0x89,%f14	! %f14 = 9f65dd20 ff7500ff
!	Starting 10 instruction Store Burst
!	%l6 = ffff000000000000, Mem[0000000010001400] = ff000000
	stwa	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000

p0_label_278:
!	%f24 = ffffffff, Mem[0000000030181408] = 0a32e176
	sta	%f24,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffffff
!	Mem[00000000100c1424] = ff00ffff, %l6 = ffff000000000000
	swap	[%i3+0x024],%l6		! %l6 = 00000000ff00ffff
!	%l0 = 0000000000000000, Mem[0000000010081410] = ffffffff
	sth	%l0,[%i2+%o5]		! Mem[0000000010081410] = 0000ffff
!	%l0 = 0000000000000000, Mem[0000000010081412] = 0000ffff
	sth	%l0,[%i2+0x012]		! Mem[0000000010081410] = 00000000
!	Mem[0000000030181410] = 000000ff, %l5 = 0000000000000000
	swapa	[%i6+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	%l4 = ffffffffffffffff, Mem[0000000030081400] = 3d5039e1
	stwa	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffffff
!	Mem[0000000030081408] = ffff0000, %l1 = 0000000001000000
	ldstuba	[%i2+%o4]0x81,%l1	! %l1 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000030141410] = ff000000
	stba	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = ff000000
!	Mem[0000000010001400] = 00000000, %l3 = ffffffffffffec30
	swapa	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ffffffff000000ff, %l3 = 0000000000000000
	ldxa	[%i1+%o5]0x88,%l3	! %l3 = ffffffff000000ff

p0_label_279:
!	Mem[0000000030001408] = ffffffff, %l3 = ffffffff000000ff
	ldswa	[%i0+%o4]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041410] = ff000000, %f6  = ff000000
	lda	[%i1+%o5]0x80,%f6 	! %f6 = ff000000
!	Mem[0000000010181408] = 00000000, %l3 = ffffffffffffffff
	lduba	[%i6+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001400] = 7c0cce27, %l6 = 00000000ff00ffff
	ldsba	[%i0+%g0]0x89,%l6	! %l6 = 0000000000000027
!	Mem[00000000100c1400] = ffffffff, %l3 = 0000000000000000
	ldswa	[%i3+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041400] = 000000ff, %f21 = 00000000
	lda	[%i1+%g0]0x80,%f21	! %f21 = 000000ff
!	Mem[00000000300c1400] = ffffffff, %l5 = 00000000000000ff
	lduwa	[%i3+%g0]0x89,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010181410] = 01ff0000, %l4 = ffffffffffffffff
	ldsha	[%i6+%o5]0x80,%l4	! %l4 = 00000000000001ff
!	Mem[0000000010001410] = 00ff75ff, %l1 = 00000000000000ff
	ldswa	[%i0+%o5]0x80,%l1	! %l1 = 0000000000ff75ff
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ffffffff, Mem[0000000010001400] = 30ecffff
	stha	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = ffffffff

p0_label_280:
!	Mem[0000000010081408] = ff000000, %l2 = 0000000027ce0c7c
	ldstuba	[%i2+%o4]0x80,%l2	! %l2 = 000000ff000000ff
!	%l6 = 0000000000000027, Mem[00000000300c1408] = 00000000
	stwa	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000027
!	%l4 = 00000000000001ff, Mem[0000000030101400] = 000000000000002f
	stxa	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000000001ff
!	Mem[0000000010181408] = 00000000, %l5 = 00000000ffffffff
	swapa	[%i6+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l0 = 0000000000000000
	swapa	[%i1+%g0]0x89,%l0	! %l0 = 0000000000000000
!	%l6 = 0000000000000027, Mem[0000000010081408] = ff000000
	stha	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 00270000
!	Mem[0000000010041400] = 000000ff, %l3 = ffffffffffffffff
	ldstuba	[%i1+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081400] = ffffffff, %l7 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000010181400] = 0000ff01, %l4 = 00000000000001ff
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 000000000000ff01
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff4c08, %l3 = 0000000000000000
	ldsba	[%o0+0x001]%asi,%l3	! %l3 = ffffffffffffffff

p0_label_281:
!	Mem[0000000010141410] = 00000000, %f28 = ffffffff
	lda	[%i5+%o5]0x88,%f28	! %f28 = 00000000
!	Mem[0000000030181408] = ffffffff7827e7ec, %f4  = 00000000 930000ff
	ldda	[%i6+%o4]0x81,%f4 	! %f4  = ffffffff 7827e7ec
!	Mem[0000000010041400] = ff0000ff, %l0 = 0000000000000000
	ldswa	[%i1+%g0]0x80,%l0	! %l0 = ffffffffff0000ff
!	Mem[0000000030001400] = 27ce0c7c 000000ff, %l4 = 0000ff01, %l5 = 00000000
	ldda	[%i0+%g0]0x81,%l4	! %l4 = 0000000027ce0c7c 00000000000000ff
!	Mem[0000000010181410] = 01ff0000, %l6 = 0000000000000027
	lduha	[%i6+%o5]0x80,%l6	! %l6 = 00000000000001ff
	membar	#Sync			! Added by membar checker (44)
!	Mem[0000000010081400] = 00000000 a52ce06d 00270000 ffffffff
!	Mem[0000000010081410] = 00000000 00211d9f acad0ca9 c193a468
!	Mem[0000000010081420] = 009bec30 49000000 ffffffff 000000ff
!	Mem[0000000010081430] = 00000000 780000ff ffffffff f20a2ca5
	ldda	[%i2]ASI_BLK_AIUP,%f0	! Block Load from 0000000010081400
!	Mem[0000000030001400] = 27ce0c7c, %l0 = ffffffffff0000ff
	ldsba	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000027
!	Mem[0000000010181420] = 00583e7e, %f23 = c193a468
	ld	[%i6+0x020],%f23	! %f23 = 00583e7e
!	Mem[00000000300c1408] = 27000000ffffffff, %f18 = 000000ff 00000000
	ldda	[%i3+%o4]0x81,%f18	! %f18 = 27000000 ffffffff
!	Starting 10 instruction Store Burst
!	%f29 = 000000ff, Mem[0000000010101404] = 7e60bfff
	st	%f29,[%i4+0x004]	! Mem[0000000010101404] = 000000ff

p0_label_282:
!	Mem[0000000010181408] = ffffffff, %l5 = 00000000000000ff
	ldstuba	[%i6+%o4]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000100c1408] = ffff0000, %l3 = ffffffffffffffff
	swapa	[%i3+%o4]0x80,%l3	! %l3 = 00000000ffff0000
	membar	#Sync			! Added by membar checker (45)
!	%l7 = 00000000ffffffff, Mem[0000000010081408] = 00270000
	stwa	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffffff
!	Mem[0000000030001410] = 2f000000, %l4 = 0000000027ce0c7c
	ldstuba	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	%f14 = ffffffff, Mem[0000000030101410] = 0000507c
	sta	%f14,[%i4+%o5]0x89	! Mem[0000000030101410] = ffffffff
!	%l0 = 0000000000000027, immed = fffff327, %y  = 00000000
	umul	%l0,-0xcd9,%l6		! %l6 = 00000026fffe0af1, %y = 00000026
!	Mem[0000000030141400] = ffc09ddd, %l3 = 00000000ffff0000
	ldstuba	[%i5+%g0]0x89,%l3	! %l3 = 000000dd000000ff
!	%f24 = ffffffff a52ce06d, Mem[0000000010141418] = 682193c1 a90cadac
	stda	%f24,[%i5+0x018]%asi	! Mem[0000000010141418] = ffffffff a52ce06d
!	%f6  = acad0ca9, %f27 = 000063ff, %f18 = 27000000 ffffffff
	fsmuld	%f6 ,%f27,%f18		! %l0 = 0000000000000049, Unfinished, %fsr = 2500000400
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 2f00000049000000, %l4 = 0000000000000000
	ldxa	[%i5+%g0]0x88,%l4	! %l4 = 2f00000049000000

p0_label_283:
!	Mem[0000000010101410] = ff000000, %l3 = 00000000000000dd
	lduwa	[%i4+%o5]0x88,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010001400] = ffffffff 00000000 0c7c0000 0000001a
!	Mem[0000000010001410] = 00ff75ff ffffff01 ffffffff 00000000
!	Mem[0000000010001420] = ac990448 00000000 ffbf607e 20dd659f
!	Mem[0000000010001430] = ff00540e ffffffc2 ff000000 33660000
	ldda	[%i0]ASI_BLK_P,%f16	! Block Load from 0000000010001400
!	Mem[0000000030041400] = 00000000, %l0 = 0000000000000049
	ldsha	[%i1+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Code Fragment 4
p0_fragment_22:
!	%l0 = 0000000000000000
	setx	0xb895ff5fdcbb5ea4,%g7,%l0 ! %l0 = b895ff5fdcbb5ea4
!	%l1 = 0000000000ff75ff
	setx	0xd7fc357fa038895f,%g7,%l1 ! %l1 = d7fc357fa038895f
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b895ff5fdcbb5ea4
	setx	0x152fdb181e2beba7,%g7,%l0 ! %l0 = 152fdb181e2beba7
!	%l1 = d7fc357fa038895f
	setx	0x11cb273026f6e653,%g7,%l1 ! %l1 = 11cb273026f6e653
!	Mem[00000000100c1400] = ffffffffd60000ff, %l1 = 11cb273026f6e653
	ldxa	[%i3+%g0]0x80,%l1	! %l1 = ffffffffd60000ff
!	Mem[0000000010181424] = 00000000, %l4 = 2f00000049000000
	lduw	[%i6+0x024],%l4		! %l4 = 0000000000000000
!	Mem[0000000020800000] = ffffba64, %l4 = 0000000000000000
	ldsh	[%o1+%g0],%l4		! %l4 = ffffffffffffffff
!	Mem[00000000300c1408] = 27000000, %l6 = 00000026fffe0af1
	lduba	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000027
!	Mem[0000000021800080] = ffff7b7d, %l5 = 00000000000000ff
	lduha	[%o3+0x080]%asi,%l5	! %l5 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%f11 = 000000ff, Mem[0000000030181408] = ffffffff
	sta	%f11,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000ff

p0_label_284:
!	Mem[0000000030101400] = 000001ff, %l1 = ffffffffd60000ff
	swapa	[%i4+%g0]0x89,%l1	! %l1 = 00000000000001ff
!	%l3 = 00000000ff000000, immed = fffff1d6, %y  = 00000026
	udiv	%l3,-0xe2a,%l1		! %l1 = 0000000000000026
	mov	%l0,%y			! %y = 1e2beba7
!	%l2 = 00000000000000ff, Mem[00000000211c0000] = ffff85d2
	sth	%l2,[%o2+%g0]		! Mem[00000000211c0000] = 00ff85d2
!	%f0  = 00000000 a52ce06d 00270000 ffffffff
!	%f4  = 00000000 00211d9f acad0ca9 c193a468
!	%f8  = 009bec30 49000000 ffffffff 000000ff
!	%f12 = 00000000 780000ff ffffffff f20a2ca5
	stda	%f0,[%i0]ASI_BLK_S	! Block Store to 0000000030001400
!	%f30 = ff000000 33660000, Mem[0000000030041410] = f20a2ca5 ff000000
	stda	%f30,[%i1+%o5]0x81	! Mem[0000000030041410] = ff000000 33660000
!	%f28 = ff00540e, Mem[0000000030181400] = ff0075ff
	sta	%f28,[%i6+%g0]0x81	! Mem[0000000030181400] = ff00540e
!	%f30 = ff000000, %f30 = ff000000, %f16 = ffffffff
	fdivs	%f30,%f30,%f16		! %f16 = 3f800000
!	%l0 = 152fdb181e2beba7, Mem[0000000030101408] = 00000000
	stha	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000eba7
!	Mem[00000000300c1408] = 00000027, %l0 = 152fdb181e2beba7
	ldstuba	[%i3+%o4]0x89,%l0	! %l0 = 00000027000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ffffffff, %l3 = 00000000ff000000
	ldsha	[%i3+%o4]0x88,%l3	! %l3 = ffffffffffffffff

p0_label_285:
	membar	#Sync			! Added by membar checker (46)
!	Mem[0000000010001408] = 1a000000 00007c0c, %l6 = 00000027, %l7 = ffffffff
	ldda	[%i0+%o4]0x88,%l6	! %l6 = 0000000000007c0c 000000001a000000
!	Mem[0000000030041408] = 00ff001b 30ec9b00, %l6 = 00007c0c, %l7 = 1a000000
	ldda	[%i1+%o4]0x81,%l6	! %l6 = 0000000000ff001b 0000000030ec9b00
!	Mem[0000000010001408] = 00007c0c, %l6 = 0000000000ff001b
	lduha	[%i0+%o4]0x88,%l6	! %l6 = 0000000000007c0c
!	Mem[0000000030101408] = a7eb0000, %l7 = 0000000030ec9b00
	lduha	[%i4+%o4]0x81,%l7	! %l7 = 000000000000a7eb
!	Mem[0000000010141400] = 2f00000049000000, %l5 = 000000000000ffff
	ldxa	[%i5+%g0]0x88,%l5	! %l5 = 2f00000049000000
!	%l4 = ffffffffffffffff, %l6 = 0000000000007c0c, %l5 = 2f00000049000000
	and	%l4,%l6,%l5		! %l5 = 0000000000007c0c
!	Mem[0000000010181410] = 01ff000000000000, %l1 = 0000000000000026
	ldxa	[%i6+%o5]0x80,%l1	! %l1 = 01ff000000000000
!	Mem[0000000030101408] = 0000eba7, %l6 = 0000000000007c0c
	ldsba	[%i4+%o4]0x89,%l6	! %l6 = ffffffffffffffa7
!	Mem[0000000030081408] = 0000ffff, %l2 = 00000000000000ff
	lduwa	[%i2+%o4]0x89,%l2	! %l2 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l1 = 01ff000000000000, Mem[0000000010041408] = 0000000000002f00
	stxa	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 01ff000000000000

p0_label_286:
!	Code Fragment 4
p0_fragment_23:
!	%l0 = 0000000000000027
	setx	0x72d498a7ec276fb8,%g7,%l0 ! %l0 = 72d498a7ec276fb8
!	%l1 = 01ff000000000000
	setx	0x6618a7dfb76ba975,%g7,%l1 ! %l1 = 6618a7dfb76ba975
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 72d498a7ec276fb8
	setx	0xd6f658780d305319,%g7,%l0 ! %l0 = d6f658780d305319
!	%l1 = 6618a7dfb76ba975
	setx	0xac3753b794d3c7b3,%g7,%l1 ! %l1 = ac3753b794d3c7b3
!	Mem[0000000010101408] = ff0001ff, %l6 = ffffffffffffffa7
	ldsha	[%i4+0x00a]%asi,%l6	! %l6 = 00000000000001ff
!	%l2 = 000000000000ffff, Mem[0000000030141408] = ffffffff
	stba	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffff
!	Mem[00000000201c0001] = ffff4c08, %l5 = 0000000000007c0c
	ldstuba	[%o0+0x001]%asi,%l5	! %l5 = 000000ff000000ff
!	%f0  = 00000000 a52ce06d 00270000 ffffffff
!	%f4  = 00000000 00211d9f acad0ca9 c193a468
!	%f8  = 009bec30 49000000 ffffffff 000000ff
!	%f12 = 00000000 780000ff ffffffff f20a2ca5
	stda	%f0,[%i2]ASI_BLK_AIUP	! Block Store to 0000000010081400
!	%l2 = 000000000000ffff, Mem[00000000300c1408] = ff000000
	stba	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff000000
!	Mem[0000000010041430] = 7c0efb7c00ffff00, %l2 = 000000000000ffff, %l4 = ffffffffffffffff
	add	%i1,0x30,%g1
	casxa	[%g1]0x80,%l2,%l4	! %l4 = 7c0efb7c00ffff00
!	%l0 = d6f658780d305319, Mem[0000000030141408] = ffffffff
	stwa	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 0d305319
!	Mem[0000000020800000] = ffffba64, %l1 = ac3753b794d3c7b3
	ldstub	[%o1+%g0],%l1		! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001010142c] = 00000000, %l1 = 00000000000000ff
	ldsha	[%i4+0x02e]%asi,%l1	! %l1 = 0000000000000000

p0_label_287:
!	Mem[0000000030001408] = 00002700, %l7 = 000000000000a7eb
	ldswa	[%i0+%o4]0x89,%l7	! %l7 = 0000000000002700
	membar	#Sync			! Added by membar checker (47)
!	Mem[0000000010081418] = acad0ca9, %f31 = 33660000
	lda	[%i2+0x018]%asi,%f31	! %f31 = acad0ca9
!	Mem[0000000010001408] = 00007c0c, %l6 = 00000000000001ff
	lduha	[%i0+%o4]0x88,%l6	! %l6 = 0000000000007c0c
!	%f11 = 000000ff, %f7  = c193a468
	fcmpes	%fcc1,%f11,%f7 		! %fcc1 = 2
!	Mem[0000000010141428] = 00000000 00000000, %l2 = 0000ffff, %l3 = ffffffff
	ldda	[%i5+0x028]%asi,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010081408] = 00270000, %l1 = 0000000000000000
	ldub	[%i2+0x009],%l1		! %l1 = 0000000000000027
!	Mem[00000000211c0000] = 00ff85d2, %l0 = d6f658780d305319
	lduha	[%o2+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101408] = a7eb0000, %l4 = 7c0efb7c00ffff00
	ldsba	[%i4+%o4]0x81,%l4	! %l4 = ffffffffffffffa7
!	Mem[0000000030001410] = 00000000, %l7 = 0000000000002700
	lduba	[%i0+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f26 = ffbf607e 20dd659f, %l6 = 0000000000007c0c
!	Mem[0000000030081428] = ff000000ffffff00
	add	%i2,0x028,%g1
	stda	%f26,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030081428] = ff0000007e60bfff

p0_label_288:
!	Mem[0000000010181400] = 000001ff, %l1 = 0000000000000027
	ldstuba	[%i6+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	%l4 = ffffffffffffffa7, %l7 = 0000000000000000, %l3 = 0000000000000000
	orn	%l4,%l7,%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010041418] = ff2193c1, %l1 = 000000ff, %l0 = 000000ff
	add	%i1,0x18,%g1
	casa	[%g1]0x80,%l1,%l0	! %l0 = 00000000ff2193c1
!	Mem[0000000010101400] = 20dd65ff, %l2 = 0000000000000000
	ldstuba	[%i4+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	%l4 = ffffffa7, %l5 = 000000ff, Mem[0000000010041410] = ff000000 ffffffff
	stda	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffffa7 000000ff
!	%f16 = 3f800000 00000000, Mem[0000000010181408] = ffffffff 0000ffff
	stda	%f16,[%i6+%o4]0x80	! Mem[0000000010181408] = 3f800000 00000000
!	Mem[0000000010141438] = 5063000000211d9f, %l7 = 0000000000000000, %l6 = 0000000000007c0c
	add	%i5,0x38,%g1
	casxa	[%g1]0x80,%l7,%l6	! %l6 = 5063000000211d9f
!	Mem[0000000030001400] = 00000000, %l6 = 5063000000211d9f
	swapa	[%i0+%g0]0x89,%l6	! %l6 = 0000000000000000
!	%l4 = ffffffffffffffa7, Mem[0000000020800000] = ffffba64
	sth	%l4,[%o1+%g0]		! Mem[0000000020800000] = ffa7ba64
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = d60000ff, %f1  = a52ce06d
	lda	[%i4+%g0]0x89,%f1 	! %f1 = d60000ff

p0_label_289:
!	Mem[0000000010101400] = 20dd65ff, %l2 = 00000000000000ff
	lduba	[%i4+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1408] = 000000ff, %l1 = 00000000000000ff
	ldswa	[%i3+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001408] = 00002700, %l6 = 0000000000000000
	ldsha	[%i0+%o4]0x89,%l6	! %l6 = 0000000000002700
!	Mem[0000000010141408] = 00000006, %l2 = 00000000000000ff
	lduha	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000006
!	Mem[00000000100c1408] = ffffffff, %l6 = 0000000000002700
	lduba	[%i3+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081408] = 00270000, %f13 = 780000ff
	lda	[%i2+%o4]0x80,%f13	! %f13 = 00270000
!	Mem[0000000010081408] = ffffffff00002700, %f10 = ffffffff 000000ff
	ldda	[%i2+%o4]0x88,%f10	! %f10 = ffffffff 00002700
!	Mem[0000000010141420] = 00000000 a675a8b0, %l2 = 00000006, %l3 = ffffffff
	ldd	[%i5+0x020],%l2		! %l2 = 0000000000000000 00000000a675a8b0
!	Mem[0000000010101430] = 000000a5, %l5 = 00000000000000ff
	lduba	[%i4+0x031]%asi,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000010141410] = 00000000
	stba	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff

p0_label_290:
!	Mem[0000000030101410] = ffffffff, %l2 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000100c1428] = 9f65dd207e60bfff, %l4 = ffffffffffffffa7, %l6 = 00000000000000ff
	add	%i3,0x28,%g1
	casxa	[%g1]0x80,%l4,%l6	! %l6 = 9f65dd207e60bfff
!	%f24 = ac990448, Mem[0000000010001430] = ff00540e
	sta	%f24,[%i0+0x030]%asi	! Mem[0000000010001430] = ac990448
!	%f5  = 00211d9f, Mem[0000000030041400] = 00000000
	sta	%f5 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 00211d9f
!	%f22 = ffffffff 00000000, Mem[0000000010081408] = 00002700 ffffffff
	stda	%f22,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffffff 00000000
!	Code Fragment 4
p0_fragment_24:
!	%l0 = 00000000ff2193c1
	setx	0x8955862fb6dddab0,%g7,%l0 ! %l0 = 8955862fb6dddab0
!	%l1 = 00000000000000ff
	setx	0x8812a39ff0b78a25,%g7,%l1 ! %l1 = 8812a39ff0b78a25
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8955862fb6dddab0
	setx	0xc818ee306c541ba1,%g7,%l0 ! %l0 = c818ee306c541ba1
!	%l1 = 8812a39ff0b78a25
	setx	0xce8da55879350193,%g7,%l1 ! %l1 = ce8da55879350193
!	%f20 = 00ff75ff ffffff01, Mem[0000000030081408] = 0000ffff e139503d
	stda	%f20,[%i2+%o4]0x89	! Mem[0000000030081408] = 00ff75ff ffffff01
!	%l7 = 0000000000000000, Mem[0000000010041410] = ffffffa7
	stha	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000ffa7
!	%f10 = ffffffff, Mem[0000000030101400] = d60000ff
	sta	%f10,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff000000ff000000, %l4 = ffffffffffffffa7
	ldxa	[%i4+%o5]0x88,%l4	! %l4 = ff000000ff000000

p0_label_291:
!	Mem[0000000030181408] = 000000ff, %f10 = ffffffff
	lda	[%i6+%o4]0x81,%f10	! %f10 = 000000ff
!	Mem[0000000010041410] = ff000000a7ff0000, %f28 = ff00540e ffffffc2
	ldda	[%i1+%o5]0x88,%f28	! %f28 = ff000000 a7ff0000
!	Mem[0000000010181410] = 01ff0000, %l7 = 0000000000000000
	lduba	[%i6+%o5]0x80,%l7	! %l7 = 0000000000000001
!	Mem[0000000030101410] = ffffffff, %l2 = 00000000000000ff
	ldsha	[%i4+%o5]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010101400] = 20dd65ff, %f18 = 0c7c0000
	lda	[%i4+%g0]0x88,%f18	! %f18 = 20dd65ff
!	Mem[0000000030101410] = ffffffff, %l0 = c818ee306c541ba1
	ldsha	[%i4+%o5]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000201c0000] = ffff4c08, %l2 = ffffffffffffffff
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030181410] = 0000000001000000, %l4 = ff000000ff000000
	ldxa	[%i6+%o5]0x81,%l4	! %l4 = 0000000001000000
!	Mem[0000000010181420] = 00583e7e, %l4 = 0000000001000000
	lduh	[%i6+0x022],%l4		! %l4 = 0000000000003e7e
!	Starting 10 instruction Store Burst
!	%l0 = ffffffff, %l1 = 79350193, Mem[0000000010141400] = 00000049 0000002f
	std	%l0,[%i5+%g0]		! Mem[0000000010141400] = ffffffff 79350193

p0_label_292:
!	%l0 = ffffffffffffffff, Mem[0000000030041400] = 00211d9f
	stwa	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffffff
!	Mem[00000000300c1410] = 00000001, %l2 = ffffffffffffffff
	swapa	[%i3+%o5]0x81,%l2	! %l2 = 0000000000000001
!	%f30 = ff000000 acad0ca9, %l6 = 9f65dd207e60bfff
!	Mem[0000000030001400] = 9f1d2100a52ce06d
	stda	%f30,[%i0+%l6]ASI_PST32_S ! Mem[0000000030001400] = ff000000acad0ca9
!	Mem[0000000010181434] = 00000000, %l3 = 00000000a675a8b0, %asi = 80
	swapa	[%i6+0x034]%asi,%l3	! %l3 = 0000000000000000
!	%f4  = 00000000, %f13 = 00270000
	fcmps	%fcc1,%f4 ,%f13		! %fcc1 = 1
!	Mem[0000000010181417] = 00000000, %l3 = 0000000000000000
	ldstub	[%i6+0x017],%l3		! %l3 = 00000000000000ff
!	%f8  = 009bec30 49000000, Mem[0000000010081410] = 00000000 00211d9f
	stda	%f8 ,[%i2+%o5]0x80	! Mem[0000000010081410] = 009bec30 49000000
!	%f22 = ffffffff 00000000, Mem[0000000030101408] = a7eb0000 000000ff
	stda	%f22,[%i4+%o4]0x81	! Mem[0000000030101408] = ffffffff 00000000
!	%l5 = 0000000000000000, Mem[0000000030081410] = 00000000
	stba	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_25:
!	%l0 = ffffffffffffffff
	setx	0x7657cb1050e52476,%g7,%l0 ! %l0 = 7657cb1050e52476
!	%l1 = ce8da55879350193
	setx	0x035235204c2cb71b,%g7,%l1 ! %l1 = 035235204c2cb71b
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7657cb1050e52476
	setx	0xb45311efe24aebea,%g7,%l0 ! %l0 = b45311efe24aebea
!	%l1 = 035235204c2cb71b
	setx	0x03a1c00788846656,%g7,%l1 ! %l1 = 03a1c00788846656

p0_label_293:
!	Mem[0000000020800040] = ffffc1d1, %l4 = 0000000000003e7e
	lduh	[%o1+0x040],%l4		! %l4 = 000000000000ffff
!	Mem[0000000010141408] = 06000000, %l6 = 9f65dd207e60bfff
	ldsha	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000600
!	Mem[00000000300c1410] = 7e60bfffffffffff, %f10 = 000000ff 00002700
	ldda	[%i3+%o5]0x89,%f10	! %f10 = 7e60bfff ffffffff
!	Mem[00000000218001c0] = 00f16949, %l2 = 0000000000000001
	ldub	[%o3+0x1c1],%l2		! %l2 = 00000000000000f1
!	Mem[0000000010181410] = 01ff0000000000ff, %f12 = 00000000 00270000
	ldda	[%i6+0x010]%asi,%f12	! %f12 = 01ff0000 000000ff
!	Mem[0000000030181400] = ff00540e, %l2 = 00000000000000f1
	lduba	[%i6+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%l1 = 03a1c00788846656, %l1 = 03a1c00788846656, %l0 = b45311efe24aebea
	sdivx	%l1,%l1,%l0		! %l0 = 0000000000000001
!	Mem[0000000030141400] = 50630000 ffc09dff, %l0 = 00000001, %l1 = 88846656
	ldda	[%i5+%g0]0x89,%l0	! %l0 = 00000000ffc09dff 0000000050630000
!	Mem[0000000010041410] = a7ff0000, %l2 = 00000000000000ff
	lduha	[%i1+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[00000000100c1408] = ffffffff
	stha	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000ffff

p0_label_294:
!	%l1 = 0000000050630000, Mem[0000000020800040] = ffffc1d1, %asi = 80
	stha	%l1,[%o1+0x040]%asi	! Mem[0000000020800040] = 0000c1d1
!	%l2 = 0000000000000000, Mem[0000000030041408] = 1b00ff00
	stha	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 1b000000
!	Mem[00000000100c140b] = 0000ffff, %l0 = 00000000ffc09dff
	ldstuba	[%i3+0x00b]%asi,%l0	! %l0 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[0000000010141408] = 00000006
	stba	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%l3 = 0000000000000000, Mem[00000000211c0001] = 00ff85d2
	stb	%l3,[%o2+0x001]		! Mem[00000000211c0000] = 000085d2
!	%l1 = 0000000050630000, Mem[0000000010181410] = 01ff0000, %asi = 80
	stwa	%l1,[%i6+0x010]%asi	! Mem[0000000010181410] = 50630000
!	%l1 = 0000000050630000, Mem[0000000010001408] = 00007c0c
	stwa	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = 50630000
!	Mem[0000000010041424] = ffffff01, %l2 = 0000000000000000, %asi = 80
	swapa	[%i1+0x024]%asi,%l2	! %l2 = 00000000ffffff01
!	Mem[00000000300c1400] = ffffffff, %l0 = 00000000000000ff
	swapa	[%i3+%g0]0x89,%l0	! %l0 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff0100ff, %l3 = 0000000000000000
	ldsha	[%i4+%o4]0x88,%l3	! %l3 = 00000000000000ff

p0_label_295:
!	Mem[0000000010101400] = 20dd65ff, %l7 = 0000000000000001
	ldswa	[%i4+%g0]0x88,%l7	! %l7 = 0000000020dd65ff
!	Mem[0000000010141400] = ffffffff, %l7 = 0000000020dd65ff
	lduba	[%i5+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001408] = 50630000, %l3 = 00000000000000ff
	lduba	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081410] = 009bec30, %f18 = 20dd65ff
	lda	[%i2+%o5]0x80,%f18	! %f18 = 009bec30
!	Mem[0000000010041408] = 00000000, %l5 = 0000000000000000
	lduba	[%i1+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1408] = 000000ff, %l2 = 00000000ffffff01
	ldswa	[%i3+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101400] = ff65dd20, %l0 = 00000000ffffffff
	lduha	[%i4+%g0]0x80,%l0	! %l0 = 000000000000ff65
!	Mem[0000000030181400] = 0e5400ff, %l7 = 00000000000000ff
	lduba	[%i6+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001434] = ffffffc2, %l5 = 0000000000000000
	ldsb	[%i0+0x034],%l5		! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = ffffffff, %l4 = 000000000000ffff
	swapa	[%i4+%o5]0x81,%l4	! %l4 = 00000000ffffffff

p0_label_296:
!	%l4 = 00000000ffffffff, Mem[00000000300c1410] = ffffffff
	stba	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffffffff
!	%l2 = 000000ff, %l3 = 00000000, Mem[00000000300c1410] = ffffffff 7e60bfff
	stda	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000ff 00000000
!	%l3 = 0000000000000000, Mem[0000000030141400] = ffc09dff
	stwa	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	Mem[0000000010081410] = 30ec9b00, %l5 = ffffffffffffffff
	ldstuba	[%i2+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000030181410] = 00000000
	stha	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff
!	Mem[0000000030001410] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	%l1 = 0000000050630000, Mem[0000000010041408] = 00000000
	stha	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	%l0 = 0000ff65, %l1 = 50630000, Mem[0000000010001408] = 50630000 1a000000
	stda	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000ff65 50630000
!	%l4 = ffffffff, %l5 = 00000000, Mem[0000000010041428] = 5586c10f ff000000
	std	%l4,[%i1+0x028]		! Mem[0000000010041428] = ffffffff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00270000, %l6 = 0000000000000600
	lduha	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000027

p0_label_297:
!	Mem[00000000100c1400] = ffffffffd60000ff, %f8  = 009bec30 49000000
	ldda	[%i3+0x000]%asi,%f8 	! %f8  = ffffffff d60000ff
!	Mem[00000000300c1400] = ff000000, %l4 = 00000000ffffffff
	lduba	[%i3+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030181410] = ff000000, %l5 = 0000000000000000
	lduwa	[%i6+%o5]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010141408] = 00000000, %l2 = 00000000000000ff
	ldsha	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1400] = 000000ff, %l6 = 0000000000000027
	ldsba	[%i3+%g0]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030001408] = 00270000ffffffff, %f22 = ffffffff 00000000
	ldda	[%i0+%o4]0x81,%f22	! %f22 = 00270000 ffffffff
!	Mem[00000000100c1408] = ffff0000, %l6 = ffffffffffffffff
	lduha	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181408] = 000000ff, %l1 = 0000000050630000
	lduha	[%i6+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041410] = ff000000, %f16 = 3f800000
	lda	[%i1+%o5]0x81,%f16	! %f16 = ff000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000030181400] = ff00540e
	stba	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000540e

p0_label_298:
!	Mem[0000000030001408] = 00270000, %l2 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	%f5  = 00211d9f, Mem[00000000300c1410] = 000000ff
	sta	%f5 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00211d9f
!	%f26 = ffbf607e 20dd659f, Mem[0000000030001408] = 000027ff ffffffff
	stda	%f26,[%i0+%o4]0x89	! Mem[0000000030001408] = ffbf607e 20dd659f
!	%f30 = ff000000 acad0ca9, Mem[0000000010001438] = ff000000 33660000
	stda	%f30,[%i0+0x038]%asi	! Mem[0000000010001438] = ff000000 acad0ca9
!	%f22 = 00270000 ffffffff, Mem[0000000010001410] = ff75ff00 01ffffff
	stda	%f22,[%i0+%o5]0x88	! Mem[0000000010001410] = 00270000 ffffffff
!	%f20 = 00ff75ff, Mem[00000000100c1410] = 930000ff
	sta	%f20,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00ff75ff
!	%f21 = ffffff01, Mem[0000000010081408] = 00000000
	sta	%f21,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffff01
!	%f6  = acad0ca9 c193a468, Mem[0000000010081408] = 01ffffff ffffffff
	stda	%f6 ,[%i2+%o4]0x80	! Mem[0000000010081408] = acad0ca9 c193a468
!	%l3 = 0000000000000000, Mem[0000000010181400] = ff01000000000000
	stx	%l3,[%i6+%g0]		! Mem[0000000010181400] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = a90cadac000000ff, %f0  = 00000000 d60000ff
	ldda	[%i0+%g0]0x89,%f0 	! %f0  = a90cadac 000000ff

p0_label_299:
!	Mem[0000000010181408] = 3f80000000000000, %f16 = ff000000 00000000
	ldda	[%i6+0x008]%asi,%f16	! %f16 = 3f800000 00000000
!	Mem[0000000010041408] = 00000000, %l6 = 0000000000000000
	lduwa	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1400] = 00000000000000ff, %l5 = 00000000ff000000
	ldxa	[%i3+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%f5  = 00211d9f, %f3  = ffffffff
	fsqrts	%f5 ,%f3 		! %l0 = 000000000000ff87, Unfinished, %fsr = 2500000400
!	Mem[0000000010041430] = 7c0efb7c00ffff00, %f30 = ff000000 acad0ca9
	ldd	[%i1+0x030],%f30	! %f30 = 7c0efb7c 00ffff00
!	Mem[0000000010081408] = acad0ca9, %l7 = 00000000000000ff
	ldsha	[%i2+%o4]0x80,%l7	! %l7 = ffffffffffffacad
!	Mem[00000000300c1408] = ffffffff000000ff, %f0  = a90cadac 000000ff
	ldda	[%i3+%o4]0x89,%f0 	! %f0  = ffffffff 000000ff
!	Mem[0000000021800100] = ffa18676, %l4 = 00000000000000ff
	ldsba	[%o3+0x101]%asi,%l4	! %l4 = ffffffffffffffa1
!	Mem[0000000030001410] = ff000000, %l6 = 0000000000000000
	ldswa	[%i0+%o5]0x81,%l6	! %l6 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, immed = 0000092c, %y  = 1e2beba7
	sdiv	%l1,0x92c,%l6		! %l6 = 000000007fffffff
	mov	%l0,%y			! %y = 0000ff87

p0_label_300:
!	Mem[0000000010181408] = 0000803f, %l1 = 0000000000000000
	swapa	[%i6+%o4]0x88,%l1	! %l1 = 000000000000803f
!	%f30 = 7c0efb7c, Mem[0000000010141418] = ffffffff
	sta	%f30,[%i5+0x018]%asi	! Mem[0000000010141418] = 7c0efb7c
!	%l2 = 0000000000000000, Mem[0000000030001408] = 20dd659f
	stwa	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	%f13 = 000000ff, Mem[0000000030001400] = ff000000
	sta	%f13,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000ff
!	Mem[0000000030181410] = 000000ff, %l3 = 0000000000000000
	ldstuba	[%i6+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000030101400] = ffffffff
	stba	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = ffffffff
!	%f16 = 3f800000 00000000 009bec30 0000001a
!	%f20 = 00ff75ff ffffff01 00270000 ffffffff
!	%f24 = ac990448 00000000 ffbf607e 20dd659f
!	%f28 = ff000000 a7ff0000 7c0efb7c 00ffff00
	stda	%f16,[%i4]ASI_BLK_P	! Block Store to 0000000010101400
!	%f14 = ffffffff f20a2ca5, Mem[0000000030181400] = 0e540000 9f65dd20
	stda	%f14,[%i6+%g0]0x89	! Mem[0000000030181400] = ffffffff f20a2ca5
!	Mem[0000000010141434] = ff00004b, %l1 = 000000000000803f
	swap	[%i5+0x034],%l1		! %l1 = 00000000ff00004b
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (48)
!	Mem[0000000030181400] = a52c0af2 ffffffff 000000ff 7827e7ec
!	Mem[0000000030181410] = ff000000 01000000 7e60bfff 01000000
!	Mem[0000000030181420] = a77aa217 0fc18655 00000000 80000000
!	Mem[0000000030181430] = 000000d6 ff000049 76e1320a 7827e7ec
	ldda	[%i6]ASI_BLK_AIUS,%f0	! Block Load from 0000000030181400

p0_label_301:
!	Mem[00000000100c1400] = ffffffff d60000ff, %l0 = 0000ff87, %l1 = ff00004b
	ldda	[%i3+%g0]0x80,%l0	! %l0 = 00000000ffffffff 00000000d60000ff
!	Mem[00000000300c1400] = ff000000 00000000, %l4 = ffffffa1, %l5 = 000000ff
	ldda	[%i3+%g0]0x81,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Mem[0000000010041400] = ff0000ff 0000004b, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i1+%g0]0x80,%l2	! %l2 = 00000000ff0000ff 000000000000004b
!	Mem[0000000010001400] = ffffffff00000000, %f20 = 00ff75ff ffffff01
	ldd	[%i0+%g0],%f20		! %f20 = ffffffff 00000000
!	Mem[0000000010081410] = 30ec9bff, %l6 = 000000007fffffff
	lduwa	[%i2+%o5]0x88,%l6	! %l6 = 0000000030ec9bff
!	Mem[0000000030081410] = 00000000, %l3 = 000000000000004b
	ldswa	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181410] = 000000ff, %l4 = 00000000ff000000
	lduba	[%i6+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1420] = 00000000, %l3 = 0000000000000000
	ldsba	[%i3+0x021]%asi,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1408] = 0000ffff 000000ff, %l2 = ff0000ff, %l3 = 00000000
	ldda	[%i3+%o4]0x80,%l2	! %l2 = 000000000000ffff 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ff, Mem[00000000300c1400] = ff000000
	stba	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff000000

p0_label_302:
!	%l7 = ffffffffffffacad, Mem[000000001004141a] = ff2193c1
	sth	%l7,[%i1+0x01a]		! Mem[0000000010041418] = ff21acad
!	Mem[0000000010041414] = 000000ff, %l0 = 00000000ffffffff
	ldstuba	[%i1+0x014]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030041400] = ffffffff, %l3 = 00000000000000ff
	ldstuba	[%i1+%g0]0x89,%l3	! %l3 = 000000ff000000ff
!	Mem[00000000211c0001] = 000085d2, %l7 = ffffffffffffacad
	ldstuba	[%o2+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	%f30 = 7c0efb7c, Mem[00000000300c1408] = 000000ff
	sta	%f30,[%i3+%o4]0x89	! Mem[00000000300c1408] = 7c0efb7c
!	Mem[0000000010001411] = ffffffff, %l1 = 00000000d60000ff
	ldstuba	[%i0+0x011]%asi,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010001408] = 65ff0000, %l1 = 00000000000000ff
	ldstuba	[%i0+%o4]0x80,%l1	! %l1 = 00000065000000ff
!	Mem[0000000030041400] = ffffffff, %l6 = 0000000030ec9bff
	swapa	[%i1+%g0]0x81,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000030001410] = 000000ff, %l3 = 00000000000000ff
	ldstuba	[%i0+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00ff75ffffffff01, %l4 = 00000000000000ff
	ldx	[%i4+%o5],%l4		! %l4 = 00ff75ffffffff01

p0_label_303:
!	%f20 = ffffffff, %f23 = ffffffff
	fcmps	%fcc1,%f20,%f23		! %fcc1 = 3
!	Mem[00000000300c1408] = 7c0efb7c, %l4 = 00ff75ffffffff01
	ldsba	[%i3+%o4]0x89,%l4	! %l4 = 000000000000007c
!	Mem[0000000010081438] = ffffffff, %l6 = 00000000ffffffff
	lduh	[%i2+0x038],%l6		! %l6 = 000000000000ffff
!	Code Fragment 4
p0_fragment_26:
!	%l0 = 0000000000000000
	setx	0x0d4c2718667204e6,%g7,%l0 ! %l0 = 0d4c2718667204e6
!	%l1 = 0000000000000065
	setx	0x3eab80b066a88586,%g7,%l1 ! %l1 = 3eab80b066a88586
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0d4c2718667204e6
	setx	0x20d26be07e92a8ca,%g7,%l0 ! %l0 = 20d26be07e92a8ca
!	%l1 = 3eab80b066a88586
	setx	0xbfd82d77d7bd4972,%g7,%l1 ! %l1 = bfd82d77d7bd4972
!	Mem[0000000030081408] = 00ff75ffffffff01, %l5 = 0000000000000000
	ldxa	[%i2+%o4]0x89,%l5	! %l5 = 00ff75ffffffff01
!	Mem[0000000030001400] = 000000ff, %l1 = bfd82d77d7bd4972
	ldswa	[%i0+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101408] = ffffffff, %f15 = 7827e7ec
	lda	[%i4+%o4]0x89,%f15	! %f15 = ffffffff
!	Mem[0000000010101408] = 009bec30, %l3 = 00000000000000ff
	ldsha	[%i4+%o4]0x80,%l3	! %l3 = 000000000000009b
!	Mem[00000000100c1400] = ffffffff, %l6 = 000000000000ffff
	ldsb	[%i3+%g0],%l6		! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l4 = 0000007c, %l5 = ffffff01, Mem[0000000010141438] = 50630000 00211d9f
	std	%l4,[%i5+0x038]		! Mem[0000000010141438] = 0000007c ffffff01

p0_label_304:
!	Code Fragment 4
p0_fragment_27:
!	%l0 = 20d26be07e92a8ca
	setx	0xaa5eab2048684b39,%g7,%l0 ! %l0 = aa5eab2048684b39
!	%l1 = 00000000000000ff
	setx	0x59080b00450b8a83,%g7,%l1 ! %l1 = 59080b00450b8a83
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = aa5eab2048684b39
	setx	0x97b09417f852c352,%g7,%l0 ! %l0 = 97b09417f852c352
!	%l1 = 59080b00450b8a83
	setx	0x5df2da80763fbf8e,%g7,%l1 ! %l1 = 5df2da80763fbf8e
!	Mem[0000000010101410] = ff75ff00, %l3 = 000000000000009b
	ldstuba	[%i4+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000218001c0] = 00f16949, %l5 = 00ff75ffffffff01
	ldstub	[%o3+0x1c0],%l5		! %l5 = 00000000000000ff
!	%l2 = 000000000000ffff, Mem[0000000030001410] = ff000000
	stba	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = ff000000
!	Mem[0000000030101408] = ffffffff, %l1 = 5df2da80763fbf8e
	ldstuba	[%i4+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000201c0001] = ffff4c08, %l1 = 00000000000000ff
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 000000ff000000ff
!	%l2 = 000000000000ffff, Mem[0000000010141410] = 000000ff
	stha	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000ffff
!	Mem[0000000021800000] = 0005f103, %l4 = 000000000000007c
	ldstub	[%o3+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030181408] = 000000ff, %l2 = 000000000000ffff
	ldstuba	[%i6+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ff0000ff, %l3 = 0000000000000000
	ldsha	[%i6+%o4]0x89,%l3	! %l3 = 00000000000000ff

p0_label_305:
!	Mem[0000000030001410] = ff000000, %l6 = ffffffffffffffff
	lduwa	[%i0+%o5]0x81,%l6	! %l6 = 00000000ff000000
!	%l4 = 0000000000000000, Mem[0000000010081408] = acad0ca9
	stwa	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	Mem[0000000010181410] = 50630000000000ff, %f8  = a77aa217 0fc18655
	ldd	[%i6+%o5],%f8 		! %f8  = 50630000 000000ff
!	Mem[0000000030101400] = ffffffff 00000000, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i4+%g0]0x81,%l2	! %l2 = 00000000ffffffff 0000000000000000
!	%l2 = 00000000ffffffff, Mem[000000001018142c] = 00000080, %asi = 80
	stwa	%l2,[%i6+0x02c]%asi	! Mem[000000001018142c] = ffffffff
!	Mem[0000000030181400] = f20a2ca5, %l4 = 0000000000000000
	ldswa	[%i6+%g0]0x89,%l4	! %l4 = fffffffff20a2ca5
!	Mem[0000000030101408] = ffffffff, %l5 = 0000000000000000
	lduha	[%i4+%o4]0x81,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030081400] = ffffffff ffffffff, %l6 = ff000000, %l7 = 00000000
	ldda	[%i2+%g0]0x81,%l6	! %l6 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000010141410] = ffff0000 ffff0000, %l2 = ffffffff, %l3 = 00000000
	ldda	[%i5+%o5]0x80,%l2	! %l2 = 00000000ffff0000 00000000ffff0000
!	Starting 10 instruction Store Burst
!	Mem[0000000020800041] = 0000c1d1, %l2 = 00000000ffff0000
	ldstuba	[%o1+0x041]%asi,%l2	! %l2 = 00000000000000ff

p0_label_306:
!	%l2 = 0000000000000000, Mem[00000000100c141c] = 0021009f
	stw	%l2,[%i3+0x01c]		! Mem[00000000100c141c] = 00000000
!	Mem[00000000201c0001] = ffff4c08, %l4 = fffffffff20a2ca5
	ldstuba	[%o0+0x001]%asi,%l4	! %l4 = 000000ff000000ff
!	%l0 = 97b09417f852c352, Mem[0000000021800001] = ff05f103
	stb	%l0,[%o3+0x001]		! Mem[0000000021800000] = ff52f103
!	%f24 = ac990448 00000000, %l4 = 00000000000000ff
!	Mem[0000000010141420] = 00000000a675a8b0
	add	%i5,0x020,%g1
	stda	%f24,[%g1+%l4]ASI_PST32_P ! Mem[0000000010141420] = ac99044800000000
!	Mem[0000000010141410] = ffff0000, %l7 = 00000000ffffffff
	swapa	[%i5+%o5]0x80,%l7	! %l7 = 00000000ffff0000
!	Mem[00000000300c1400] = ff000000, %l5 = 000000000000ffff
	swapa	[%i3+%g0]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030081400] = ffffffff, %l4 = 00000000000000ff
	swapa	[%i2+%g0]0x89,%l4	! %l4 = 00000000ffffffff
!	%l5 = 00000000ff000000, Mem[0000000010101410] = ffff75ff
	stwa	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = ff000000
!	%l1 = 00000000000000ff, imm = 0000000000000589, %l3 = 00000000ffff0000
	sub	%l1,0x589,%l3		! %l3 = fffffffffffffb76
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ffffffffffff0000, %f0  = a52c0af2 ffffffff
	ldda	[%i5+%o5]0x80,%f0 	! %f0  = ffffffff ffff0000

p0_label_307:
!	Mem[0000000021800100] = ffa18676, %l0 = 97b09417f852c352
	ldub	[%o3+0x101],%l0		! %l0 = 00000000000000a1
!	Mem[00000000300c1410] = 00211d9f, %l6 = 00000000ffffffff
	lduha	[%i3+%o5]0x89,%l6	! %l6 = 0000000000001d9f
!	Mem[0000000030081408] = 01ffffff, %l7 = 00000000ffff0000
	lduba	[%i2+%o4]0x81,%l7	! %l7 = 0000000000000001
!	Mem[0000000030141400] = 5063000000000000, %f18 = 009bec30 0000001a
	ldda	[%i5+%g0]0x89,%f18	! %f18 = 50630000 00000000
!	Mem[00000000300c1400] = 00000000ffff0000, %f28 = ff000000 a7ff0000
	ldda	[%i3+%g0]0x89,%f28	! %f28 = 00000000 ffff0000
!	Mem[0000000030101410] = 0000ffff 000075ff, %l4 = ffffffff, %l5 = ff000000
	ldda	[%i4+%o5]0x81,%l4	! %l4 = 000000000000ffff 00000000000075ff
!	Mem[0000000010141410] = 0000ffffffffffff, %f4  = ff000000 01000000
	ldda	[%i5+%o5]0x88,%f4 	! %f4  = 0000ffff ffffffff
!	Mem[0000000010181418] = 00000000, %l4 = 000000000000ffff
	lduwa	[%i6+0x018]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141410] = ffffffff, %l0 = 00000000000000a1
	lduwa	[%i5+%o5]0x80,%l0	! %l0 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	Code Fragment 3
p0_fragment_28:
!	%l0 = 00000000ffffffff
	setx	0xe77d8ae780a44359,%g7,%l0 ! %l0 = e77d8ae780a44359
!	%l1 = 00000000000000ff
	setx	0x0f40d4e04e0241a9,%g7,%l1 ! %l1 = 0f40d4e04e0241a9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e77d8ae780a44359
	setx	0x82431937fef00fed,%g7,%l0 ! %l0 = 82431937fef00fed
!	%l1 = 0f40d4e04e0241a9
	setx	0x74afdc6022067d81,%g7,%l1 ! %l1 = 74afdc6022067d81

p0_label_308:
!	Mem[00000000218000c0] = ffff4ce8, %l0 = 82431937fef00fed
	ldstuba	[%o3+0x0c0]%asi,%l0	! %l0 = 000000ff000000ff
!	%l3 = fffffffffffffb76, Mem[00000000211c0001] = 00ff85d2, %asi = 80
	stba	%l3,[%o2+0x001]%asi	! Mem[00000000211c0000] = 007685d2
!	%f8  = 50630000 000000ff, Mem[0000000010181400] = 00000000 00000000
	stda	%f8 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 50630000 000000ff
!	%l1 = 74afdc6022067d81, Mem[0000000010081410] = ff9bec30
	stwa	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 22067d81
!	%l4 = 0000000000000000, Mem[0000000010081410] = 817d0622
	stba	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 817d0600
!	%l7 = 0000000000000001, Mem[0000000030041400] = 30ec9bff
	stba	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = 01ec9bff
!	%l2 = 0000000000000000, Mem[0000000030041408] = 1b000000
	stwa	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	%l3 = fffffffffffffb76, Mem[00000000300c1408] = 7c0efb7c
	stba	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = 7c0efb76
!	Mem[0000000030101400] = ffffffff, %l5 = 00000000000075ff
	swapa	[%i4+%g0]0x81,%l5	! %l5 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 7c0efb76, %l1 = 74afdc6022067d81
	ldswa	[%i3+%o4]0x89,%l1	! %l1 = 000000007c0efb76

p0_label_309:
!	Mem[0000000010041400] = ff0000ff, %f10 = 00000000
	lda	[%i1+%g0]0x88,%f10	! %f10 = ff0000ff
!	Mem[0000000021800080] = ffff7b7d, %l6 = 0000000000001d9f
	lduha	[%o3+0x080]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010081410] = 00067d81, %f21 = 00000000
	ld	[%i2+%o5],%f21	! %f21 = 00067d81
!	Mem[0000000030081408] = 01ffffff, %l5 = 00000000ffffffff
	lduha	[%i2+%o4]0x81,%l5	! %l5 = 00000000000001ff
!	Mem[0000000010081408] = 00000000, %l7 = 0000000000000001
	lduha	[%i2+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141408] = 0d305319, %l3 = fffffffffffffb76
	lduba	[%i5+%o4]0x89,%l3	! %l3 = 0000000000000019
!	Mem[0000000010141408] = 00000000, %l3 = 0000000000000019
	ldstuba	[%i5+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%f23 = ffffffff, %f21 = 00067d81, %f19 = 00000000
	fdivs	%f23,%f21,%f19		! %f19 = ffffffff
!	Mem[0000000030081408] = 01ffffff, %l6 = 000000000000ffff
	ldsha	[%i2+%o4]0x81,%l6	! %l6 = 00000000000001ff
!	Starting 10 instruction Store Burst
!	%f3  = 7827e7ec, Mem[0000000030101400] = ff750000
	sta	%f3 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 7827e7ec

p0_label_310:
!	%l5 = 00000000000001ff, imm = fffffffffffff1d1, %l4 = 0000000000000000
	and	%l5,-0xe2f,%l4		! %l4 = 00000000000001d1
!	%l6 = 00000000000001ff, Mem[0000000010001400] = ffffffff00000000
	stxa	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000000001ff
!	Mem[0000000030141408] = 1953300d, %l1 = 000000007c0efb76
	swapa	[%i5+%o4]0x81,%l1	! %l1 = 000000001953300d
!	%f20 = ffffffff 00067d81, Mem[0000000010001410] = ffffffff 00270000
	stda	%f20,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffff 00067d81
!	%l3 = 0000000000000000, Mem[000000001010142c] = 20dd659f, %asi = 80
	stwa	%l3,[%i4+0x02c]%asi	! Mem[000000001010142c] = 00000000
!	%f6  = 7e60bfff, Mem[00000000300c1400] = 0000ffff
	sta	%f6 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = 7e60bfff
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010041418] = ff21acad a90cadac
	std	%l2,[%i1+0x018]		! Mem[0000000010041418] = 00000000 00000000
!	%l4 = 000001d1, %l5 = 000001ff, Mem[0000000030081408] = ffffff01 00ff75ff
	stda	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 000001d1 000001ff
!	Mem[00000000100c1410] = ff75ff00, %l4 = 00000000000001d1
	swapa	[%i3+%o5]0x80,%l4	! %l4 = 00000000ff75ff00
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 01ff0000 00000000, %l6 = 000001ff, %l7 = 00000000
	ldda	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000000 0000000001ff0000

p0_label_311:
!	Mem[0000000030041408] = 00000000, %f25 = 00000000
	lda	[%i1+%o4]0x89,%f25	! %f25 = 00000000
!	Mem[0000000010081408] = 00000000 c193a468, %l6 = 00000000, %l7 = 01ff0000
	ldda	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000 00000000c193a468
!	Mem[00000000100c1408] = ff000000ffff0000, %f0  = ffffffff ffff0000
	ldda	[%i3+%o4]0x88,%f0 	! %f0  = ff000000 ffff0000
!	Mem[0000000010001410] = ffffffff00067d81, %l3 = 0000000000000000
	ldxa	[%i0+%o5]0x88,%l3	! %l3 = ffffffff00067d81
!	Mem[0000000020800040] = 00ffc1d1, %l0 = 00000000000000ff
	lduha	[%o1+0x040]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041410] = 0000ffa7, %l1 = 000000001953300d
	lduba	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l2 = 0000000000000000
	lduh	[%i2+0x002],%l2		! %l2 = 0000000000000000
!	Mem[0000000010181408] = 0000000000000000, %l2 = 0000000000000000
	ldx	[%i6+%o4],%l2		! %l2 = 0000000000000000
!	Mem[00000000100c1400] = ffffffff, %l0 = 00000000000000ff
	ldsha	[%i3+%g0]0x80,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f16 = 3f800000 00000000 50630000 ffffffff
!	%f20 = ffffffff 00067d81 00270000 ffffffff
!	%f24 = ac990448 00000000 ffbf607e 20dd659f
!	%f28 = 00000000 ffff0000 7c0efb7c 00ffff00
	stda	%f16,[%i0]ASI_BLK_AIUS	! Block Store to 0000000030001400

p0_label_312:
!	%f14 = 76e1320a, Mem[00000000300c1400] = 7e60bfff
	sta	%f14,[%i3+%g0]0x81	! Mem[00000000300c1400] = 76e1320a
	membar	#Sync			! Added by membar checker (49)
!	Mem[0000000030001410] = ffffffff, %l1 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l1	! %l1 = 000000ff000000ff
!	%f2  = 000000ff 7827e7ec, Mem[0000000010081408] = 00000000 68a493c1
	stda	%f2 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000ff 7827e7ec
!	%l5 = 00000000000001ff, Mem[0000000010001410] = 00067d81
	stwa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 000001ff
!	%l1 = 00000000000000ff, imm = 0000000000000697, %l1 = 00000000000000ff
	add	%l1,0x697,%l1		! %l1 = 0000000000000796
!	%l7 = 00000000c193a468, %l2 = 0000000000000000, %l2 = 0000000000000000
	sub	%l7,%l2,%l2		! %l2 = 00000000c193a468
!	%f22 = 00270000 ffffffff, Mem[0000000010081400] = 00000000 6de02ca5
	stda	%f22,[%i2+%g0]0x88	! Mem[0000000010081400] = 00270000 ffffffff
!	%l4 = ff75ff00, %l5 = 000001ff, Mem[0000000010101408] = 30ec9b00 1a000000
	stda	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = ff75ff00 000001ff
!	Mem[0000000010041414] = ff0000ff, %l5 = 00000000000001ff
	ldstub	[%i1+0x014],%l5		! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000000, %l6 = 0000000000000000
	lduba	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000000

p0_label_313:
!	Mem[00000000211c0000] = 007685d2, %l4 = 00000000ff75ff00
	lduh	[%o2+%g0],%l4		! %l4 = 0000000000000076
!	Mem[0000000010181418] = 00000000, %l5 = 00000000000000ff
	ldsba	[%i6+0x018]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1410] = 00211d9f, %l0 = ffffffffffffffff
	lduba	[%i3+%o5]0x89,%l0	! %l0 = 000000000000009f
!	Mem[0000000010101408] = ff75ff00, %f15 = ffffffff
	lda	[%i4+%o4]0x88,%f15	! %f15 = ff75ff00
!	Mem[0000000010081400] = ffffffff, %f0  = ff000000
	lda	[%i2+%g0]0x88,%f0 	! %f0 = ffffffff
!	Mem[0000000030101400] = 00000000 7827e7ec, %l4 = 00000076, %l5 = 00000000
	ldda	[%i4+%g0]0x89,%l4	! %l4 = 000000007827e7ec 0000000000000000
!	%f12 = 000000d6, %f18 = 50630000 ffffffff
	fitod	%f12,%f18		! %f18 = 406ac000 00000000
!	Mem[0000000010181410] = 00006350, %l6 = 0000000000000000
	ldswa	[%i6+%o5]0x88,%l6	! %l6 = 0000000000006350
!	Mem[0000000030141410] = ff000000, %l2 = 00000000c193a468
	ldsba	[%i5+%o5]0x81,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000796, %l1 = 0000000000000796, %y  = 0000ff87
	smul	%l1,%l1,%l5		! %l5 = 0000000000398be4, %y = 00000000

p0_label_314:
!	Mem[00000000100c1424] = 00000000, %l1 = 00000796, %l4 = 7827e7ec
	add	%i3,0x24,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010081430] = 00000000, %asi = 80
	stwa	%l4,[%i2+0x030]%asi	! Mem[0000000010081430] = 00000000
!	Mem[00000000100c1404] = d60000ff, %l1 = 0000000000000796
	swap	[%i3+0x004],%l1		! %l1 = 00000000d60000ff
!	Mem[0000000010041400] = ff0000ff, %l3 = ffffffff00067d81
	ldstub	[%i1+%g0],%l3		! %l3 = 000000ff000000ff
!	%f26 = ffbf607e 20dd659f, Mem[0000000030181408] = ff0000ff 7827e7ec
	stda	%f26,[%i6+%o4]0x81	! Mem[0000000030181408] = ffbf607e 20dd659f
!	Mem[0000000030041410] = 000000ff, %l6 = 0000000000006350
	swapa	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%f22 = 00270000 ffffffff, Mem[0000000010001410] = ff010000 ffffffff
	stda	%f22,[%i0+%o5]0x80	! Mem[0000000010001410] = 00270000 ffffffff
!	%f26 = ffbf607e, Mem[0000000010001408] = 0000ffff
	sta	%f26,[%i0+%o4]0x88	! Mem[0000000010001408] = ffbf607e
!	%f26 = ffbf607e 20dd659f, Mem[00000000100c1408] = ffff0000 ff000000
	stda	%f26,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffbf607e 20dd659f
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000, %f23 = ffffffff
	lda	[%i1+%o4]0x89,%f23	! %f23 = 00000000

p0_label_315:
!	Mem[0000000010181410] = 50630000, %l1 = 00000000d60000ff
	ldsha	[%i6+0x010]%asi,%l1	! %l1 = 0000000000005063
!	%l2 = ffffffffffffffff, immed = 000009be, %y  = 00000000
	udiv	%l2,0x9be,%l1		! %l1 = 00000000001a4708
	mov	%l0,%y			! %y = 0000009f
!	Mem[0000000010081408] = ece72778ff000000, %f2  = 000000ff 7827e7ec
	ldda	[%i2+%o4]0x80,%f2 	! %f2  = ece72778 ff000000
!	Mem[0000000010181400] = ff000000, %l0 = 000000000000009f
	lduha	[%i6+%g0]0x80,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010141408] = 000000ff, %l1 = 00000000001a4708
	ldsba	[%i5+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000300c1408] = 76fb0e7c, %l1 = ffffffffffffffff
	ldsha	[%i3+%o4]0x81,%l1	! %l1 = 00000000000076fb
!	Mem[0000000010001420] = ac990448, %f26 = ffbf607e
	ld	[%i0+0x020],%f26	! %f26 = ac990448
!	Mem[00000000100c1424] = 00000000, %l7 = 00000000c193a468
	ldswa	[%i3+0x024]%asi,%l7	! %l7 = 0000000000000000
!	%f10 = ff0000ff, %f28 = 00000000
	fcmps	%fcc1,%f10,%f28		! %fcc1 = 1
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = d1010000, %l7 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l7	! %l7 = 000000d1000000ff

p0_label_316:
!	%f23 = 00000000, Mem[0000000010041408] = 00000000
	sta	%f23,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	%l6 = 00000000000000ff, Mem[00000000300c1408] = 76fb0e7cffffffff
	stxa	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000000000ff
!	%f4  = 0000ffff ffffffff, %l6 = 00000000000000ff
!	Mem[0000000030181438] = 76e1320a7827e7ec
	add	%i6,0x038,%g1
	stda	%f4,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030181438] = ffffffffffff0000
!	Mem[0000000030141408] = 7c0efb76, %l4 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l4	! %l4 = 0000007c000000ff
!	%f31 = 00ffff00, Mem[00000000100c1418] = ff0000d6
	st	%f31,[%i3+0x018]	! Mem[00000000100c1418] = 00ffff00
!	Code Fragment 4
p0_fragment_29:
!	%l0 = 000000000000ff00
	setx	0x4a0c0977dc7f1ec9,%g7,%l0 ! %l0 = 4a0c0977dc7f1ec9
!	%l1 = 00000000000076fb
	setx	0x461dc007ecc9864f,%g7,%l1 ! %l1 = 461dc007ecc9864f
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4a0c0977dc7f1ec9
	setx	0x9ffb1da7dc3be306,%g7,%l0 ! %l0 = 9ffb1da7dc3be306
!	%l1 = 461dc007ecc9864f
	setx	0xfbafc2983703c15b,%g7,%l1 ! %l1 = fbafc2983703c15b
!	Mem[0000000010141403] = ffffffff, %l1 = fbafc2983703c15b
	ldstub	[%i5+0x003],%l1		! %l1 = 000000ff000000ff
!	Mem[0000000030041410] = 00006350, %l2 = ffffffffffffffff
	swapa	[%i1+%o5]0x89,%l2	! %l2 = 0000000000006350
!	Mem[0000000020800001] = ffa7ba64, %l5 = 0000000000398be4
	ldstuba	[%o1+0x001]%asi,%l5	! %l5 = 000000a7000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ffffffff33660000, %f4  = 0000ffff ffffffff
	ldda	[%i1+%o5]0x81,%f4 	! %f4  = ffffffff 33660000

p0_label_317:
!	Mem[0000000010101410] = ff000000ffffff01, %f16 = 3f800000 00000000
	ldd	[%i4+%o5],%f16		! %f16 = ff000000 ffffff01
!	Mem[0000000010141400] = ffffffff79350193, %l7 = 00000000000000d1
	ldxa	[%i5+%g0]0x80,%l7	! %l7 = ffffffff79350193
!	Mem[00000000211c0000] = 007685d2, %l3 = 00000000000000ff
	lduba	[%o2+0x000]%asi,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = 007685d2, %l1 = 00000000000000ff
	lduha	[%o2+0x000]%asi,%l1	! %l1 = 0000000000000076
!	Mem[0000000010041408] = 00000000, %l4 = 000000000000007c
	ldsba	[%i1+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041400] = ff0000ff, %l2 = 0000000000006350
	ldsha	[%i1+%g0]0x80,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010081430] = 00000000780000ff, %f20 = ffffffff 00067d81
	ldd	[%i2+0x030],%f20	! %f20 = 00000000 780000ff
!	%f7  = 01000000, %f29 = ffff0000
	fsqrts	%f7 ,%f29		! %f29 = 203504f3
!	Mem[0000000030101410] = 0000ffff 000075ff, %l4 = 00000000, %l5 = 000000a7
	ldda	[%i4+%o5]0x81,%l4	! %l4 = 000000000000ffff 00000000000075ff
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffff00, Mem[0000000030001400] = 0000803f
	stwa	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffff00

p0_label_318:
!	%l5 = 00000000000075ff, Mem[0000000030181400] = f20a2ca5
	stba	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = f20a2cff
!	Mem[0000000030101408] = ffffffff, %l2 = ffffffffffffff00
	ldstuba	[%i4+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	%f19 = 00000000, Mem[0000000010001400] = 00000000
	sta	%f19,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	%l5 = 00000000000075ff, Mem[0000000030181400] = ff2c0af2
	stba	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = ff2c0af2
!	Mem[0000000010101418] = 00270000ffffffff, %l1 = 0000000000000076, %l7 = ffffffff79350193
	add	%i4,0x18,%g1
	casxa	[%g1]0x80,%l1,%l7	! %l7 = 00270000ffffffff
!	Mem[0000000010101410] = ff000000, %l4 = 000000000000ffff
	ldstuba	[%i4+%o5]0x80,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010141410] = ffffffff, %l7 = 00270000ffffffff
	ldstuba	[%i5+%o5]0x88,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030041410] = ffffffff, %l1 = 0000000000000076
	swapa	[%i1+%o5]0x89,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000010181400] = ff000000, %l4 = 00000000000000ff
	ldstuba	[%i6+%g0]0x80,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000, %l3 = 0000000000000000
	ldsba	[%i1+%o4]0x81,%l3	! %l3 = 0000000000000000

p0_label_319:
!	Mem[00000000211c0000] = 007685d2, %l4 = 00000000000000ff
	ldsb	[%o2+%g0],%l4		! %l4 = 0000000000000000
!	Mem[0000000010081410] = 00000049817d0600, %f10 = ff0000ff 80000000
	ldda	[%i2+%o5]0x88,%f10	! %f10 = 00000049 817d0600
!	Mem[0000000030101408] = ffffffff, %l3 = 0000000000000000
	lduha	[%i4+%o4]0x81,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010001400] = 00000000, %l2 = 00000000000000ff
	lduba	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = ffffffff, %f21 = 780000ff
	lda	[%i5+%g0]0x80,%f21	! %f21 = ffffffff
!	Mem[00000000100c1414] = 00000000, %l1 = 00000000ffffffff
	lduh	[%i3+0x014],%l1		! %l1 = 0000000000000000
!	Mem[0000000030141408] = ff0efb76 00000000, %l0 = dc3be306, %l1 = 00000000
	ldda	[%i5+%o4]0x81,%l0	! %l0 = 00000000ff0efb76 0000000000000000
!	Mem[0000000010041420] = 00000000 00000000, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i1+0x020]%asi,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[00000000300c1410] = 00211d9f, %l7 = 0000000000000000
	ldsha	[%i3+%o5]0x89,%l7	! %l7 = 0000000000001d9f
!	Starting 10 instruction Store Burst
!	%f3  = ff000000, Mem[0000000030101408] = ffffffff
	sta	%f3 ,[%i4+%o4]0x81	! Mem[0000000030101408] = ff000000

p0_label_320:
!	Mem[0000000030081408] = 000001ff, %l7 = 0000000000001d9f
	swapa	[%i2+%o4]0x89,%l7	! %l7 = 00000000000001ff
!	%l4 = 00000000, %l5 = 000075ff, Mem[0000000010041410] = 0000ffa7 ff0000ff
	stda	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000 000075ff
!	Mem[000000001004143c] = 00211d9f, %l7 = 00000000000001ff
	ldstub	[%i1+0x03c],%l7		! %l7 = 00000000000000ff
!	%l0 = 00000000ff0efb76, Mem[0000000010081400] = ffffffff00002700
	stxa	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000ff0efb76
!	%l1 = 0000000000000000, Mem[0000000030101408] = ff000000
	stwa	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	Mem[000000001010142c] = 00000000, %l2 = 00000000, %l0 = ff0efb76
	add	%i4,0x2c,%g1
	casa	[%g1]0x80,%l2,%l0	! %l0 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000030081408] = 00001d9f
	stba	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 00001d00
!	%l5 = 00000000000075ff, Mem[0000000010001400] = 00000000
	stha	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 75ff0000
!	%l0 = 0000000000000000, Mem[0000000010001438] = ff000000acad0ca9, %asi = 80
	stxa	%l0,[%i0+0x038]%asi	! Mem[0000000010001438] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 000001d1 00000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i3+%o5]0x80,%l0	! %l0 = 00000000000001d1 0000000000000000

p0_label_321:
!	Mem[0000000010101400] = 000000000000803f, %l0 = 00000000000001d1
	ldxa	[%i4+%g0]0x88,%l0	! %l0 = 000000000000803f
!	%f0  = ffffffff ffff0000 ece72778 ff000000
!	%f4  = ffffffff 33660000 7e60bfff 01000000
!	%f8  = 50630000 000000ff 00000049 817d0600
!	%f12 = 000000d6 ff000049 76e1320a ff75ff00
	stda	%f0,[%i1]ASI_COMMIT_S	! Block Store to 0000000030041400
!	Mem[000000001014140c] = ff00004b, %l2 = 0000000000000000
	lduha	[%i5+0x00e]%asi,%l2	! %l2 = 000000000000004b
!	Mem[0000000030081400] = ff000000, %l7 = 0000000000000000
	lduwa	[%i2+%g0]0x81,%l7	! %l7 = 00000000ff000000
!	%f28 = 00000000, %f29 = 203504f3, %f30 = 7c0efb7c 00ffff00
	fsmuld	%f28,%f29,%f30		! %f30 = 00000000 00000000
!	Mem[0000000030141410] = bfffffff000000ff, %f16 = ff000000 ffffff01
	ldda	[%i5+%o5]0x89,%f16	! %f16 = bfffffff 000000ff
	membar	#Sync			! Added by membar checker (50)
!	Mem[0000000030041408] = ece72778, %l6 = 0000000000000000
	lduba	[%i1+%o4]0x81,%l6	! %l6 = 00000000000000ec
!	Mem[0000000010181400] = 000000ff, %l6 = 00000000000000ec
	lduha	[%i6+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181408] = ffbf607e20dd659f, %l2 = 000000000000004b
	ldxa	[%i6+%o4]0x81,%l2	! %l2 = ffbf607e20dd659f
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010141408] = ff000000
	stwa	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000

p0_label_322:
!	%l2 = ffbf607e20dd659f, immed = fffff219, %y  = 0000009f
	sdiv	%l2,-0xde7,%l1		! %l1 = fffffffff48dc8ce
	mov	%l0,%y			! %y = 0000803f
!	%f16 = bfffffff 000000ff 406ac000 00000000
!	%f20 = 00000000 ffffffff 00270000 00000000
!	%f24 = ac990448 00000000 ac990448 20dd659f
!	%f28 = 00000000 203504f3 00000000 00000000
	stda	%f16,[%i5]ASI_BLK_S	! Block Store to 0000000030141400
!	%f10 = 00000049 817d0600, %l6 = 00000000000000ff
!	Mem[0000000010041428] = ffffffff00000000
	add	%i1,0x028,%g1
	stda	%f10,[%g1+%l6]ASI_PST16_P ! Mem[0000000010041428] = 00000049817d0600
!	Mem[0000000010181438] = c193a468, %f4  = ffffffff
	lda	[%i6+0x038]%asi,%f4 	! %f4 = c193a468
!	Mem[0000000030041410] = ffffffff, %l3 = 000000000000ffff
	ldstuba	[%i1+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	%l6 = 000000ff, %l7 = ff000000, Mem[0000000030041408] = 7827e7ec 000000ff
	stda	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000ff ff000000
!	%l5 = 00000000000075ff, Mem[0000000010001400] = 0000ff75
	stba	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000ffff
!	%f6  = 7e60bfff, Mem[0000000030081410] = 00000000
	sta	%f6 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 7e60bfff
!	%l7 = 00000000ff000000, Mem[0000000030081400] = 000000ff
	stha	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ffff0000000001ff, %l0 = 000000000000803f
	ldx	[%i0+%g0],%l0		! %l0 = ffff0000000001ff

p0_label_323:
!	Mem[0000000010081400] = 00000000ff0efb76, %l0 = ffff0000000001ff
	ldxa	[%i2+%g0]0x80,%l0	! %l0 = 00000000ff0efb76
!	Mem[00000000100c1408] = 9f65dd207e60bfff, %f12 = 000000d6 ff000049
	ldda	[%i3+%o4]0x80,%f12	! %f12 = 9f65dd20 7e60bfff
!	Mem[0000000010081408] = 7827e7ec, %l7 = 00000000ff000000
	lduba	[%i2+%o4]0x88,%l7	! %l7 = 00000000000000ec
	membar	#Sync			! Added by membar checker (51)
!	Mem[0000000010141400] = ffffffff, %f5  = 33660000
	lda	[%i5+%g0]0x80,%f5 	! %f5 = ffffffff
!	Mem[00000000100c1400] = ffffffff, %l4 = 0000000000000000
	lduha	[%i3+%g0]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030001408] = 50630000, %l0 = 00000000ff0efb76
	ldswa	[%i0+%o4]0x81,%l0	! %l0 = 0000000050630000
!	Mem[0000000020800040] = 00ffc1d1, %l6 = 00000000000000ff
	ldsh	[%o1+0x040],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010181410] = 50630000, %l4 = 000000000000ffff
	ldsba	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000050
!	Mem[0000000030041400] = ffffffff, %l3 = 00000000000000ff
	ldsha	[%i1+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l2 = ffbf607e20dd659f, Mem[00000000300c1408] = 00000000
	stba	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000009f

p0_label_324:
!	Mem[0000000030081400] = 00000000, %l3 = ffffffffffffffff
	ldstuba	[%i2+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[00000000211c0000] = 007685d2
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 000085d2
!	%l0 = 0000000050630000, %l6 = 00000000000000ff, %l1 = fffffffff48dc8ce
	or	%l0,%l6,%l1		! %l1 = 00000000506300ff
!	%l3 = 0000000000000000, Mem[0000000030001408] = 50630000
	stha	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	%f1  = ffff0000, Mem[00000000300c1408] = 0000009f
	sta	%f1 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffff0000
!	%l4 = 00000050, %l5 = 000075ff, Mem[0000000010101438] = 7c0efb7c 00ffff00
	stda	%l4,[%i4+0x038]%asi	! Mem[0000000010101438] = 00000050 000075ff
!	%l6 = 00000000000000ff, Mem[000000001004140c] = 0000ff01
	stb	%l6,[%i1+0x00c]		! Mem[000000001004140c] = ff00ff01
!	Mem[0000000010081408] = 7827e7ec, %l5 = 00000000000075ff
	swapa	[%i2+%o4]0x88,%l5	! %l5 = 000000007827e7ec
!	%l6 = 00000000000000ff, Mem[00000000211c0000] = 000085d2
	stb	%l6,[%o2+%g0]		! Mem[00000000211c0000] = ff0085d2
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00ff75ffff010000, %f26 = ac990448 20dd659f
	ldda	[%i4+%o4]0x80,%f26	! %f26 = 00ff75ff ff010000

p0_label_325:
!	%l5 = 000000007827e7ec, %l5 = 000000007827e7ec, %l7 = 00000000000000ec
	addc	%l5,%l5,%l7		! %l7 = 00000000f04fcfd8
!	Mem[0000000010141408] = 00000000, %l6 = 00000000000000ff
	lduba	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l1 = 00000000506300ff
	ldsba	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101400] = 00000000 7827e7ec, %l2 = 20dd659f, %l3 = 00000000
	ldda	[%i4+%g0]0x89,%l2	! %l2 = 000000007827e7ec 0000000000000000
!	Mem[00000000300c1400] = 0a32e176, %l1 = 0000000000000000
	lduha	[%i3+%g0]0x89,%l1	! %l1 = 000000000000e176
!	Mem[0000000010181408] = 00000000, %l2 = 000000007827e7ec
	lduha	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081400] = 00000000ff0efb76, %f14 = 76e1320a ff75ff00
	ldda	[%i2+%g0]0x80,%f14	! %f14 = 00000000 ff0efb76
!	Mem[00000000300c1408] = 0000ffff, %l5 = 000000007827e7ec
	lduha	[%i3+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000021800000] = ff52f103, %l1 = 000000000000e176
	ldsb	[%o3+0x001],%l1		! %l1 = 0000000000000052
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000052, Mem[00000000100c1400] = ffffffff
	stba	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffff52

p0_label_326:
!	Mem[000000001010143c] = 000075ff, %l0 = 50630000, %l1 = 00000052
	add	%i4,0x3c,%g1
	casa	[%g1]0x80,%l0,%l1	! %l1 = 00000000000075ff
!	%l4 = 00000050, %l5 = 00000000, Mem[0000000030001400] = 00ffffff 00000000
	stda	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000050 00000000
!	Mem[0000000010181410] = 00006350, %l0 = 0000000050630000
	ldstuba	[%i6+%o5]0x88,%l0	! %l0 = 00000050000000ff
!	Mem[0000000010081410] = 817d0600, %l3 = 0000000000000000
	swapa	[%i2+%o5]0x88,%l3	! %l3 = 00000000817d0600
!	%l3 = 00000000817d0600, Mem[0000000010141410] = ffffffff, %asi = 80
	stwa	%l3,[%i5+0x010]%asi	! Mem[0000000010141410] = 817d0600
!	%f24 = ac990448, Mem[0000000010181410] = ff630000
	st	%f24,[%i6+%o5]		! Mem[0000000010181410] = ac990448
!	%l3 = 00000000817d0600, %l4 = 0000000000000050, %l0 = 0000000000000050
	sdivx	%l3,%l4,%l0		! %l0 = 00000000019e5ce0
!	Mem[0000000030041408] = ff000000, %l7 = 00000000f04fcfd8
	ldstuba	[%i1+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	%f6  = 7e60bfff 01000000, Mem[0000000030081400] = ff000000 ffffffff
	stda	%f6 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 7e60bfff 01000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00ff75ff, %l2 = 0000000000000000
	ldswa	[%i4+%o4]0x80,%l2	! %l2 = 0000000000ff75ff

p0_label_327:
!	Mem[00000000300c1410] = 9f1d2100, %l2 = 0000000000ff75ff
	ldswa	[%i3+%o5]0x81,%l2	! %l2 = ffffffff9f1d2100
!	Mem[0000000030001410] = ffffffff, %f21 = ffffffff
	lda	[%i0+%o5]0x81,%f21	! %f21 = ffffffff
!	Mem[0000000030141408] = 406ac00000000000, %f22 = 00270000 00000000
	ldda	[%i5+%o4]0x81,%f22	! %f22 = 406ac000 00000000
!	Mem[0000000010041408] = 00000000, %l2 = ffffffff9f1d2100
	ldsha	[%i1+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101410] = 000000ff, %l0 = 00000000019e5ce0
	ldswa	[%i4+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081410] = 00000000, %f20 = 00000000
	lda	[%i2+%o5]0x88,%f20	! %f20 = 00000000
!	Mem[0000000021800080] = ffff7b7d, %l6 = 0000000000000000
	ldub	[%o3+0x080],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010141400] = ffffffff, %f14 = 00000000
	lda	[%i5+%g0]0x80,%f14	! %f14 = ffffffff
!	Mem[00000000201c0000] = ffff4c08, %l6 = 00000000000000ff
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 817d0600, Mem[00000000100c1418] = 00ffff00 00000000
	std	%l2,[%i3+0x018]		! Mem[00000000100c1418] = 00000000 817d0600

p0_label_328:
!	Mem[000000001000141d] = 00000000, %l1 = 00000000000075ff
	ldstub	[%i0+0x01d],%l1		! %l1 = 00000000000000ff
!	%l4 = 0000000000000050, Mem[0000000030141408] = 406ac000
	stba	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = 506ac000
!	%l5 = 0000000000000000, imm = fffffffffffffbdd, %l3 = 00000000817d0600
	addc	%l5,-0x423,%l3		! %l3 = fffffffffffffbdd
!	Mem[0000000030041400] = ffffffff, %l5 = 0000000000000000
	ldstuba	[%i1+%g0]0x81,%l5	! %l5 = 000000ff000000ff
!	%l4 = 00000050, %l5 = 000000ff, Mem[00000000100c1410] = 000001d1 00000000
	std	%l4,[%i3+%o5]		! Mem[00000000100c1410] = 00000050 000000ff
!	%l3 = fffffffffffffbdd, Mem[0000000030041410] = ffffffff
	stba	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = ddffffff
!	Mem[00000000100c1418] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i3+0x018]%asi,%l1	! %l1 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[00000000100c1400] = ffffff52
	stha	%l5,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffff00ff
!	%l1 = 0000000000000000, Mem[0000000010081408] = ff750000ff000000
	stxa	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081434] = 780000ff, %l7 = 00000000000000ff
	ldswa	[%i2+0x034]%asi,%l7	! %l7 = 00000000780000ff

p0_label_329:
!	Mem[00000000100c1410] = 50000000, %l0 = 00000000000000ff
	lduba	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = ff00ffff00000796, %f20 = 00000000 ffffffff
	ldda	[%i3+0x000]%asi,%f20	! %f20 = ff00ffff 00000796
!	Mem[0000000010041410] = 00000000, %l0 = 0000000000000000
	ldsha	[%i1+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = 7e60bfff, %l3 = fffffffffffffbdd
	lduba	[%i2+%g0]0x81,%l3	! %l3 = 000000000000007e
!	%f29 = 203504f3, %f20 = ff00ffff
	fcmps	%fcc0,%f29,%f20		! %fcc0 = 2
!	%l3 = 000000000000007e, imm = 00000000000008d5, %l2 = 0000000000000000
	xnor	%l3,0x8d5,%l2		! %l2 = fffffffffffff754
!	Mem[0000000010081400] = 00000000, %f4  = c193a468
	lda	[%i2+%g0]0x80,%f4 	! %f4 = 00000000
!	Mem[0000000030141400] = bfffffff, %l6 = 000000000000ffff
	lduha	[%i5+%g0]0x81,%l6	! %l6 = 000000000000bfff
!	Mem[000000001008140c] = 00000000, %f20 = ff00ffff
	ld	[%i2+0x00c],%f20	! %f20 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1424] = 00000000, %l7 = 00000000780000ff, %asi = 80
	swapa	[%i3+0x024]%asi,%l7	! %l7 = 0000000000000000

p0_label_330:
!	%l5 = 00000000000000ff, Mem[0000000010181410] = 480499ac
	stba	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = 480499ff
!	%l6 = 000000000000bfff, Mem[00000000100c1408] = 9f65dd20
	stba	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff65dd20
!	Mem[0000000010141408] = 00000000, %l3 = 000000000000007e
	ldstuba	[%i5+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[00000000218000c1] = ffff4ce8, %asi = 80
	stba	%l5,[%o3+0x0c1]%asi	! Mem[00000000218000c0] = ffff4ce8
!	Mem[00000000100c1420] = 00000000, %l7 = 00000000, %l6 = 0000bfff
	add	%i3,0x20,%g1
	casa	[%g1]0x80,%l7,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101410] = ff000000, %l5 = 00000000000000ff
	swapa	[%i4+%o5]0x80,%l5	! %l5 = 00000000ff000000
!	%l4 = 0000000000000050, Mem[0000000030141408] = 00c06a50
	stha	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 00c00050
!	%l3 = 0000000000000000, Mem[00000000100c1408] = ff65dd207e60bfff
	stxa	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000000000
!	%f14 = ffffffff ff0efb76, %l1 = 0000000000000000
!	Mem[0000000030141410] = 00000000ffffffff
	add	%i5,0x010,%g1
	stda	%f14,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030141410] = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000, %l7 = 0000000000000000
	lduha	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000000

p0_label_331:
!	Mem[0000000010101408] = 00ff75ff, %l5 = 00000000ff000000
	ldsba	[%i4+0x008]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141408] = 00000000 00c00050, %l6 = 00000000, %l7 = 00000000
	ldda	[%i5+%o4]0x89,%l6	! %l6 = 0000000000c00050 0000000000000000
!	Mem[0000000010001410] = 00270000 ffffffff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i0+0x010]%asi,%l0	! %l0 = 0000000000270000 00000000ffffffff
!	Mem[0000000030001408] = 00000000ffffffff, %l2 = fffffffffffff754
	ldxa	[%i0+%o4]0x81,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000010001410] = 00270000, %l4 = 0000000000000050
	lduw	[%i0+%o5],%l4		! %l4 = 0000000000270000
!	Mem[0000000010101410] = 000000ff, %l6 = 0000000000c00050
	lduha	[%i4+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = 0000ffff000000ff, %l0 = 0000000000270000
	ldxa	[%i3+%o4]0x81,%l0	! %l0 = 0000ffff000000ff
!	Mem[0000000010001408] = ffbf607e, %l0 = 0000ffff000000ff
	ldsha	[%i0+%o4]0x88,%l0	! %l0 = 000000000000607e
!	Mem[0000000010181428] = 000005ff, %l2 = 00000000ffffffff
	lduba	[%i6+0x028]%asi,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f23 = 00000000, Mem[0000000010001410] = 00270000
	sta	%f23,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000

p0_label_332:
!	%l4 = 0000000000270000, Mem[0000000010001410] = 00000000
	stwa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 00270000
!	%f24 = ac990448 00000000, %l1 = 00000000ffffffff
!	Mem[0000000010001418] = ffffffff00ff0000
	add	%i0,0x018,%g1
	stda	%f24,[%g1+%l1]ASI_PST8_P ! Mem[0000000010001418] = ac99044800000000
!	%l4 = 0000000000270000, %l6 = 0000000000000000, %l6  = 0000000000000000
	mulx	%l4,%l6,%l6		! %l6 = 0000000000000000
!	Mem[0000000010141410] = 817d0600, %l4 = 0000000000270000
	ldstuba	[%i5+%o5]0x80,%l4	! %l4 = 00000081000000ff
!	%f23 = 00000000, Mem[00000000100c140c] = 00000000
	sta	%f23,[%i3+0x00c]%asi	! Mem[00000000100c140c] = 00000000
!	%l5 = 0000000000000000, Mem[0000000010181410] = ff990448000000ff
	stxa	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000000000000
!	Mem[00000000201c0001] = ffff4c08, %l3 = 0000000000000000
	ldstub	[%o0+0x001],%l3		! %l3 = 000000ff000000ff
!	%f26 = 00ff75ff, %f27 = ff010000
	fstoi	%f26,%f27		! %f27 = 00000000
!	Mem[0000000010181404] = 00006350, %l0 = 000000000000607e, %asi = 80
	swapa	[%i6+0x004]%asi,%l0	! %l0 = 0000000000006350
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00ff75ff, %l1 = 00000000ffffffff
	lduh	[%i4+%o4],%l1		! %l1 = 00000000000000ff

p0_label_333:
!	%l4 = 0000000000000081, Mem[0000000030041400] = ffffffff
	stha	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = ffff0081
!	Mem[0000000010141410] = ff7d0600, %l5 = 0000000000000000
	ldsha	[%i5+%o5]0x80,%l5	! %l5 = ffffffffffffff7d
!	Mem[00000000100c1408] = 00000000, %l0 = 0000000000006350
	ldsha	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101408] = 00ff75ffff010000, %l2 = 0000000000000000
	ldxa	[%i4+%o4]0x80,%l2	! %l2 = 00ff75ffff010000
!	Mem[0000000010101408] = ff75ff00, %l6 = 0000000000000000
	ldsha	[%i4+%o4]0x88,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000030001408] = 00000000, %f15 = ff0efb76
	lda	[%i0+%o4]0x81,%f15	! %f15 = 00000000
!	Mem[0000000030001408] = 00000000 ffffffff, %l4 = 00000081, %l5 = ffffff7d
	ldda	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000 00000000ffffffff
!	Mem[0000000030141410] = 00000000, %l4 = 0000000000000000
	lduba	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l7 = 0000000000000000
	ldswa	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffffff00, Mem[0000000030181400] = ff2c0af2ffffffff
	stxa	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = ffffffffffffff00

p0_label_334:
!	Mem[00000000300c1400] = 0a32e176, %l2 = 00ff75ffff010000
	ldstuba	[%i3+%g0]0x89,%l2	! %l2 = 00000076000000ff
!	Mem[0000000030001408] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	%f10 = 00000049 817d0600, Mem[0000000010141410] = ff7d0600 ffff0000
	stda	%f10,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000049 817d0600
!	%l1 = 00000000000000ff, Mem[00000000218001c0] = fff16949
	sth	%l1,[%o3+0x1c0]		! Mem[00000000218001c0] = 00ff6949
!	%l6 = ffffffffffffff00, Mem[0000000010101408] = 00ff75ff
	stba	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 00ff75ff
!	Mem[0000000010001400] = 0000ffff, %l1 = 00000000000000ff
	ldstuba	[%i0+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[000000001010143f] = 000075ff, %l0 = 0000000000000000
	ldstub	[%i4+0x03f],%l0		! %l0 = 000000ff000000ff
!	%f22 = 406ac000 00000000, %l7 = 0000000000000000
!	Mem[0000000030101420] = a77aa2170fc18655
	add	%i4,0x020,%g1
	stda	%f22,[%g1+%l7]ASI_PST32_S ! Mem[0000000030101420] = a77aa2170fc18655
!	%l2 = 00000076, %l3 = 000000ff, Mem[0000000010001408] = ffbf607e 50630000
	stda	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000076 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ffe1320a, %l0 = 00000000000000ff
	ldswa	[%i3+%g0]0x81,%l0	! %l0 = ffffffffffe1320a

p0_label_335:
!	Mem[0000000030101410] = ff750000ffff0000, %l2 = 0000000000000076
	ldxa	[%i4+%o5]0x89,%l2	! %l2 = ff750000ffff0000
	membar	#Sync			! Added by membar checker (52)
!	Mem[0000000030141400] = bfffffff 000000ff 5000c000 00000000
!	Mem[0000000030141410] = 00000000 ffffffff 00270000 00000000
!	Mem[0000000030141420] = ac990448 00000000 ac990448 20dd659f
!	Mem[0000000030141430] = 00000000 203504f3 00000000 00000000
	ldda	[%i5]ASI_BLK_S,%f0	! Block Load from 0000000030141400
!	Mem[0000000010041400] = ff0000ff, %l6 = ffffffffffffff00
	lduwa	[%i1+%g0]0x80,%l6	! %l6 = 00000000ff0000ff
!	Mem[00000000300c1400] = 0a32e1ff, %l5 = 00000000ffffffff
	lduba	[%i3+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Code Fragment 4
p0_fragment_30:
!	%l0 = ffffffffffe1320a
	setx	0x004258881649df35,%g7,%l0 ! %l0 = 004258881649df35
!	%l1 = 00000000000000ff
	setx	0x17882f78393fa4ac,%g7,%l1 ! %l1 = 17882f78393fa4ac
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 004258881649df35
	setx	0xdb037b981765b1c1,%g7,%l0 ! %l0 = db037b981765b1c1
!	%l1 = 17882f78393fa4ac
	setx	0x7af7e4578099d234,%g7,%l1 ! %l1 = 7af7e4578099d234
!	Mem[0000000030001410] = ffffffff00067d81, %l2 = ff750000ffff0000
	ldxa	[%i0+%o5]0x81,%l2	! %l2 = ffffffff00067d81
!	Mem[0000000010101400] = 0000803f, %l2 = ffffffff00067d81
	lduwa	[%i4+%g0]0x88,%l2	! %l2 = 000000000000803f
!	Mem[0000000010001428] = ffbf607e20dd659f, %f16 = bfffffff 000000ff
	ldda	[%i0+0x028]%asi,%f16	! %f16 = ffbf607e 20dd659f
!	Mem[0000000010001400] = ffff0000, %l5 = 00000000000000ff
	ldsw	[%i0+%g0],%l5		! %l5 = ffffffffffff0000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000030101408] = 0000000000000000
	stxa	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000000000000000

p0_label_336:
!	Mem[0000000010081416] = 49000000, %l7 = 0000000000000000
	ldstuba	[%i2+0x016]%asi,%l7	! %l7 = 00000000000000ff
!	%l0 = 1765b1c1, %l1 = 8099d234, Mem[0000000030181408] = ffbf607e 20dd659f
	stda	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 1765b1c1 8099d234
!	%f22 = 406ac000 00000000, %l7 = 0000000000000000
!	Mem[0000000010041428] = 00000049817d0600
	add	%i1,0x028,%g1
	stda	%f22,[%g1+%l7]ASI_PST16_P ! Mem[0000000010041428] = 00000049817d0600
!	Mem[0000000010181424] = 00000000, %l2 = 000000000000803f, %asi = 80
	swapa	[%i6+0x024]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000211c0001] = ff0085d2, %l5 = ffffffffffff0000
	ldstub	[%o2+0x001],%l5		! %l5 = 00000000000000ff
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010101438] = 00000050 000075ff
	std	%l2,[%i4+0x038]		! Mem[0000000010101438] = 00000000 000000ff
!	%f25 = 00000000, Mem[0000000030101408] = 00000000
	sta	%f25,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	Mem[0000000030081400] = ffbf607e, %l0 = db037b981765b1c1
	ldstuba	[%i2+%g0]0x89,%l0	! %l0 = 0000007e000000ff
!	Mem[0000000010041408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ff000000000000ff, %f18 = 406ac000 00000000
	ldda	[%i1+%o4]0x81,%f18	! %f18 = ff000000 000000ff

p0_label_337:
!	Mem[0000000010181400] = ff000000, %f20 = 00000000
	lda	[%i6+%g0]0x80,%f20	! %f20 = ff000000
!	Mem[00000000211c0000] = ffff85d2, %l0 = 000000000000007e
	ldsba	[%o2+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030041408] = 000000ff, %l3 = 00000000000000ff
	lduha	[%i1+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181410] = 00000000, %l6 = 00000000ff0000ff
	lduba	[%i6+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101408] = ff75ff00, %l7 = 0000000000000000
	ldsba	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101400] = 3f800000 00000000, %l0 = ffffffff, %l1 = 8099d234
	ldda	[%i4+%g0]0x80,%l0	! %l0 = 000000003f800000 0000000000000000
!	Mem[00000000300c1408] = 0000ffff 000000ff, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i3+%o4]0x81,%l2	! %l2 = 000000000000ffff 00000000000000ff
!	Mem[00000000300c1400] = 0a32e1ff, %l4 = 0000000000000000
	lduba	[%i3+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1400] = 0a32e1ff, %l3 = 00000000000000ff
	lduba	[%i3+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, %l1 = 0000000000000000, %l0 = 000000003f800000
	sdivx	%l4,%l1,%l0		! Div by zero, %l0 = 000000003f800050

p0_label_338:
!	Mem[0000000030041408] = 000000ff, %l0 = 000000003f800028
	ldsba	[%i1+%o4]0x89,%l0	! %l0 = ffffffffffffffff
!	%l1 = 0000000000000000, Mem[000000001014143e] = ffffff01, %asi = 80
	stha	%l1,[%i5+0x03e]%asi	! Mem[000000001014143c] = ffff0000
!	Mem[0000000010181428] = 000005ff, %l4 = 00000000000000ff
	swap	[%i6+0x028],%l4		! %l4 = 00000000000005ff
!	%l2 = 000000000000ffff, Mem[0000000010001408] = 76000000
	stba	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000000
!	Mem[0000000030041400] = 8100ffff, %l4 = 00000000000005ff
	swapa	[%i1+%g0]0x81,%l4	! %l4 = 000000008100ffff
!	%f20 = ff000000 00000796, Mem[0000000030101408] = 00000000 00000000
	stda	%f20,[%i4+%o4]0x81	! Mem[0000000030101408] = ff000000 00000796
!	%f4  = 00000000 ffffffff, %l3 = 00000000000000ff
!	Mem[0000000010101400] = 3f80000000000000
	stda	%f4,[%i4+%l3]ASI_PST8_P ! Mem[0000000010101400] = 00000000ffffffff
!	%l0 = ffffffffffffffff, Mem[0000000021800041] = ffffd022, %asi = 80
	stba	%l0,[%o3+0x041]%asi	! Mem[0000000021800040] = ffffd022
!	Mem[0000000010101420] = ac990448, %l7 = 0000000000000000
	swap	[%i4+0x020],%l7		! %l7 = 00000000ac990448
!	Starting 10 instruction Load Burst
!	Mem[0000000010001428] = ffbf607e 20dd659f, %l0 = ffffffff, %l1 = 00000000
	ldd	[%i0+0x028],%l0		! %l0 = 00000000ffbf607e 0000000020dd659f

p0_label_339:
!	Mem[0000000010101408] = 00ff75ff, %l3 = 00000000000000ff
	ldswa	[%i4+%o4]0x80,%l3	! %l3 = 0000000000ff75ff
!	Mem[0000000030181410] = 000000ff, %l1 = 0000000020dd659f
	ldsha	[%i6+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081404] = ff0efb76, %l0 = 00000000ffbf607e
	ldswa	[%i2+0x004]%asi,%l0	! %l0 = ffffffffff0efb76
!	Mem[0000000030001408] = ff000000ffffffff, %l6 = 0000000000000000
	ldxa	[%i0+%o4]0x81,%l6	! %l6 = ff000000ffffffff
!	Mem[0000000010041410] = ff75000000000000, %f12 = 00000000 203504f3
	ldda	[%i1+%o5]0x88,%f12	! %f12 = ff750000 00000000
!	Mem[0000000010101410] = 000000ff, %l4 = 000000008100ffff
	ldswa	[%i4+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181408] = 0000000000000000, %l1 = 00000000000000ff
	ldxa	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181418] = 00000000ffffffff, %l2 = 000000000000ffff
	ldx	[%i6+0x018],%l2		! %l2 = 00000000ffffffff
!	Mem[0000000030141408] = 00c00050, %l7 = 00000000ac990448
	ldsha	[%i5+%o4]0x89,%l7	! %l7 = 0000000000000050
!	Starting 10 instruction Store Burst
!	%f16 = ffbf607e 20dd659f, Mem[0000000010181410] = 00000000 00000000
	std	%f16,[%i6+%o5]	! Mem[0000000010181410] = ffbf607e 20dd659f

p0_label_340:
!	Mem[00000000100c1400] = ff00ffff, %l5 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l5	! %l5 = 000000ff000000ff
!	%l4 = 00000000000000ff, immd = fffffffffffff6e1, %l1 = 0000000000000000
	sdivx	%l4,-0x91f,%l1		! %l1 = 0000000000000000
!	%l6 = ff000000ffffffff, Mem[0000000010081412] = 00000000, %asi = 80
	stba	%l6,[%i2+0x012]%asi	! Mem[0000000010081410] = 0000ff00
!	%f11 = 20dd659f, Mem[0000000030101410] = ffff0000
	sta	%f11,[%i4+%o5]0x89	! Mem[0000000030101410] = 20dd659f
!	%l5 = 00000000000000ff, Mem[0000000010001408] = 000000ff
	stba	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff
!	%l2 = ffffffff, %l3 = 00ff75ff, Mem[0000000030001410] = ffffffff 817d0600
	stda	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = ffffffff 00ff75ff
!	Mem[00000000100c143b] = f1ff9418, %l0 = ffffffffff0efb76
	ldstub	[%i3+0x03b],%l0		! %l0 = 00000018000000ff
!	Mem[000000001018143b] = c193a468, %l3 = 0000000000ff75ff
	ldstuba	[%i6+0x03b]%asi,%l3	! %l3 = 00000068000000ff
!	%l6 = ffffffff, %l7 = 00000050, Mem[0000000010001420] = ac990448 00000000
	std	%l6,[%i0+0x020]		! Mem[0000000010001420] = ffffffff 00000050
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 0000000000c00050, %f6  = 00270000 00000000
	ldda	[%i5+%o4]0x89,%f6 	! %f6  = 00000000 00c00050

p0_label_341:
!	Mem[0000000020800040] = 00ffc1d1, %l6 = ff000000ffffffff
	ldsb	[%o1+0x040],%l6		! %l6 = 0000000000000000
!	Mem[000000001000142c] = 20dd659f, %l5 = 00000000000000ff
	ldsha	[%i0+0x02c]%asi,%l5	! %l5 = 00000000000020dd
!	Mem[0000000010001400] = ffff0000, %f9  = 00000000
	lda	[%i0+%g0]0x80,%f9 	! %f9 = ffff0000
!	Mem[0000000030101410] = 9f65dd20000075ff, %f20 = ff000000 00000796
	ldda	[%i4+%o5]0x81,%f20	! %f20 = 9f65dd20 000075ff
!	Mem[0000000010001408] = 000000ff000000ff, %l3 = 0000000000000068
	ldxa	[%i0+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010181408] = 00000000, %l5 = 00000000000020dd
	ldsba	[%i6+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = ff000000ff00004b, %l1 = 0000000000000000
	ldxa	[%i5+%o4]0x80,%l1	! %l1 = ff000000ff00004b
!	Mem[0000000030181410] = ff000000, %l7 = 0000000000000050
	lduba	[%i6+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101400] = 7827e7ec, %l2 = 00000000ffffffff
	ldsha	[%i4+%g0]0x89,%l2	! %l2 = ffffffffffffe7ec
!	Starting 10 instruction Store Burst
!	%f24 = ac990448 00000000, Mem[0000000030101400] = ece72778 00000000
	stda	%f24,[%i4+%g0]0x81	! Mem[0000000030101400] = ac990448 00000000

p0_label_342:
!	%l2 = ffffffffffffe7ec, Mem[0000000010141408] = 000000ff
	stba	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ec
!	%l2 = ffffffffffffe7ec, Mem[0000000010081408] = 00000000
	stba	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = ec000000
!	%f21 = 000075ff, %f31 = 00000000, %f0  = bfffffff 000000ff
	fsmuld	%f21,%f31,%f0 		! %f0  = 00000000 00000000
!	Mem[0000000030081410] = ffbf607e, %l0 = 0000000000000018
	ldstuba	[%i2+%o5]0x89,%l0	! %l0 = 0000007e000000ff
!	Mem[0000000030141408] = 00c00050, %l7 = 00000000000000ff
	swapa	[%i5+%o4]0x89,%l7	! %l7 = 0000000000c00050
!	Code Fragment 3
p0_fragment_31:
!	%l0 = 000000000000007e
	setx	0xa6c611b015bc5c5a,%g7,%l0 ! %l0 = a6c611b015bc5c5a
!	%l1 = ff000000ff00004b
	setx	0xa4eb89a7e3dc7470,%g7,%l1 ! %l1 = a4eb89a7e3dc7470
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a6c611b015bc5c5a
	setx	0xb1dd3ed85da4865a,%g7,%l0 ! %l0 = b1dd3ed85da4865a
!	%l1 = a4eb89a7e3dc7470
	setx	0xe5cf3467a21f2a28,%g7,%l1 ! %l1 = e5cf3467a21f2a28
!	%l7 = 0000000000c00050, Mem[00000000300c1400] = ffe1320a00000000
	stxa	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000000c00050
!	%f10 = ac990448 20dd659f, Mem[0000000030081410] = ffbf60ff 00000000
	stda	%f10,[%i2+%o5]0x89	! Mem[0000000030081410] = ac990448 20dd659f
	membar	#Sync			! Added by membar checker (53)
!	%f26 = 00ff75ff 00000000, Mem[0000000030141410] = 00000000 ffffffff
	stda	%f26,[%i5+%o5]0x89	! Mem[0000000030141410] = 00ff75ff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 000000ff, %l7 = 0000000000c00050
	ldsba	[%i5+%o4]0x89,%l7	! %l7 = ffffffffffffffff

p0_label_343:
!	Mem[0000000010181410] = ffbf607e, %f3  = 00000000
	lda	[%i6+%o5]0x80,%f3 	! %f3 = ffbf607e
!	Mem[0000000010001400] = ffff0000000001ff, %l2 = ffffffffffffe7ec
	ldxa	[%i0+%g0]0x80,%l2	! %l2 = ffff0000000001ff
!	Mem[0000000030181400] = ffffffff, %l4 = 00000000000000ff
	ldsha	[%i6+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030041410] = ffffffdd, %l5 = 0000000000000000
	lduba	[%i1+%o5]0x89,%l5	! %l5 = 00000000000000dd
!	Mem[0000000010001400] = 0000ffff, %f14 = 00000000
	lda	[%i0+%g0]0x88,%f14	! %f14 = 0000ffff
!	Mem[0000000020800040] = 00ffc1d1, %l4 = ffffffffffffffff
	ldsh	[%o1+0x040],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010141400] = ffffffff, %l6 = 0000000000000000
	ldsha	[%i5+%g0]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000020800040] = 00ffc1d1, %l4 = 00000000000000ff
	ldsb	[%o1+0x040],%l4		! %l4 = 0000000000000000
!	Mem[0000000010141410] = 49000000, %l6 = ffffffffffffffff
	ldsha	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 000000ff, %l3 = 000000ff000000ff
	swapa	[%i1+%o4]0x89,%l3	! %l3 = 00000000000000ff

p0_label_344:
!	%f29 = 203504f3, %f1  = 00000000, %f26 = 00ff75ff
	fsubs	%f29,%f1 ,%f26		! %f26 = 203504f3
!	Mem[00000000218000c0] = ffff4ce8, %l0 = b1dd3ed85da4865a
	ldstub	[%o3+0x0c0],%l0		! %l0 = 000000ff000000ff
!	%l6 = 0000000000000000, Mem[0000000010081400] = 00000000
	stha	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	%l7 = ffffffffffffffff, Mem[0000000030001410] = ffffffff
	stha	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = ffffffff
!	Mem[0000000010081400] = 00000000, %l3 = 00000000000000ff
	swapa	[%i2+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 000000ec, %l2 = ffff0000000001ff
	swapa	[%i5+%o4]0x88,%l2	! %l2 = 00000000000000ec
!	%l3 = 0000000000000000, Mem[00000000100c1410] = 50000000
	stha	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = 50000000
!	%l3 = 0000000000000000, Mem[0000000030041408] = ff000000
	stba	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	%l4 = 0000000000000000, Mem[0000000010181400] = ff000000
	stha	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	Starting 10 instruction Load Burst
!	%l4 = 0000000000000000, imm = ffffffffffffff8f, %l6 = 0000000000000000
	sub	%l4,-0x071,%l6		! %l6 = 0000000000000071

p0_label_345:
!	Mem[0000000010101438] = 00000000 000000ff, %l0 = 000000ff, %l1 = a21f2a28
	ldda	[%i4+0x038]%asi,%l0	! %l0 = 0000000000000000 00000000000000ff
!	Mem[0000000030081410] = 9f65dd20480499ac, %f6  = 00000000 00c00050
	ldda	[%i2+%o5]0x81,%f6 	! %f6  = 9f65dd20 480499ac
!	Mem[0000000010101434] = a7ff0000, %l0 = 0000000000000000
	ldsha	[%i4+0x034]%asi,%l0	! %l0 = ffffffffffffa7ff
!	Mem[00000000100c1408] = 00000000, %l5 = 00000000000000dd
	ldsha	[%i3+0x008]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181408] = 0000000000000000, %f2  = 5000c000 ffbf607e
	ldda	[%i6+%o4]0x80,%f2 	! %f2  = 00000000 00000000
!	Mem[0000000030081410] = 9f65dd20 480499ac, %l4 = 00000000, %l5 = 00000000
	ldda	[%i2+%o5]0x81,%l4	! %l4 = 000000009f65dd20 00000000480499ac
!	Mem[0000000030181400] = ffffffff, %l4 = 000000009f65dd20
	lduba	[%i6+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[00000000201c0000] = ffff4c08, %l1 = 00000000000000ff
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030101400] = 480499ac, %l6 = 0000000000000071
	lduha	[%i4+%g0]0x89,%l6	! %l6 = 00000000000099ac
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 9f65dd207e60bfff, %f2  = 00000000 00000000
	ldda	[%i6+%o5]0x88,%f2 	! %f2  = 9f65dd20 7e60bfff

p0_label_346:
!	Mem[0000000030101400] = ac990448, %l7 = ffffffffffffffff
	swapa	[%i4+%g0]0x81,%l7	! %l7 = 00000000ac990448
!	Mem[00000000100c1400] = ff00ffff, %l3 = 0000000000000000
	ldstuba	[%i3+0x000]%asi,%l3	! %l3 = 000000ff000000ff
!	%l5 = 00000000480499ac, Mem[00000000201c0000] = ffff4c08, %asi = 80
	stha	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = 99ac4c08
!	Mem[0000000010001410] = 00270000, %l0 = ffffffffffffa7ff
	swapa	[%i0+%o5]0x88,%l0	! %l0 = 0000000000270000
!	%l0 = 0000000000270000, Mem[0000000010001410] = ffa7ffffffffffff
	stxa	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000270000
!	%l2 = 00000000000000ec, Mem[0000000030081408] = 001d0000
	stba	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = ec1d0000
!	%f24 = ac990448 00000000, %l1 = 000000000000ffff
!	Mem[0000000030181420] = a77aa2170fc18655
	add	%i6,0x020,%g1
	stda	%f24,[%g1+%l1]ASI_PST32_S ! Mem[0000000030181420] = ac99044800000000
!	%l7 = 00000000ac990448, Mem[000000001010143d] = 000000ff, %asi = 80
	stba	%l7,[%i4+0x03d]%asi	! Mem[000000001010143c] = 004800ff
!	%l4 = 00000000000000ff, Mem[0000000010141410] = 49000000
	stha	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 490000ff
!	Starting 10 instruction Load Burst
!	%l1 = 000000000000ffff, Mem[0000000030141408] = ff000000
	stha	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = ffff0000

p0_label_347:
!	Mem[0000000010101438] = 00000000, %l1 = 000000000000ffff
	ldsh	[%i4+0x03a],%l1		! %l1 = 0000000000000000
!	Mem[0000000010001434] = ffffffc2, %l6 = 00000000000099ac
	lduh	[%i0+0x034],%l6		! %l6 = 000000000000ffff
!	Mem[0000000010001430] = ac990448ffffffc2, %l3 = 00000000000000ff
	ldxa	[%i0+0x030]%asi,%l3	! %l3 = ac990448ffffffc2
!	Mem[0000000010041400] = ff0000ff0000004b, %l1 = 0000000000000000
	ldxa	[%i1+%g0]0x80,%l1	! %l1 = ff0000ff0000004b
!	Mem[0000000030181400] = 00ffffffffffffff, %f6  = 9f65dd20 480499ac
	ldda	[%i6+%g0]0x89,%f6 	! %f6  = 00ffffff ffffffff
!	Mem[0000000010141400] = 93013579ffffffff, %l6 = 000000000000ffff
	ldxa	[%i5+%g0]0x88,%l6	! %l6 = 93013579ffffffff
!	Mem[0000000030141408] = 0000ffff, %l4 = 00000000000000ff
	ldsha	[%i5+%o4]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010101418] = 00270000, %l5 = 00000000480499ac
	lduw	[%i4+0x018],%l5		! %l5 = 0000000000270000
!	Mem[0000000010001410] = 0000270000000000, %l3 = ac990448ffffffc2
	ldxa	[%i0+%o5]0x88,%l3	! %l3 = 0000270000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = ffff0000, %l4 = ffffffffffffffff
	swapa	[%i3+%o4]0x89,%l4	! %l4 = 00000000ffff0000

p0_label_348:
!	%l3 = 0000270000000000, Mem[00000000100c1410] = 50000000
	stwa	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	Mem[000000001004143c] = ff211d9f, %l7 = 00000000ac990448
	swap	[%i1+0x03c],%l7		! %l7 = 00000000ff211d9f
!	%l6 = 93013579ffffffff, Mem[0000000030141410] = 00000000
	stwa	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffffff
!	Mem[0000000030101400] = ffffffff, %l4 = 00000000ffff0000
	swapa	[%i4+%g0]0x89,%l4	! %l4 = 00000000ffffffff
!	%l4 = 00000000ffffffff, Mem[0000000030001400] = 00000050
	stwa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = ffffffff
!	Mem[00000000100c1404] = 00000796, %l2 = 000000ec, %l1 = 0000004b
	add	%i3,0x04,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 0000000000000796
!	%f30 = 00000000 00000000, Mem[0000000030181400] = ffffffff 00ffffff
	stda	%f30,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000 00000000
!	%l6 = 93013579ffffffff, Mem[0000000030141410] = ffffffff
	stba	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffffff
!	%l4 = 00000000ffffffff, Mem[00000000211c0001] = ffff85d2, %asi = 80
	stba	%l4,[%o2+0x001]%asi	! Mem[00000000211c0000] = ffff85d2
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 000001ff, %l7 = 00000000ff211d9f
	lduba	[%i5+%o4]0x88,%l7	! %l7 = 00000000000000ff

p0_label_349:
!	Mem[0000000021800180] = 4bedbd9f, %l1 = 0000000000000796
	lduha	[%o3+0x180]%asi,%l1	! %l1 = 0000000000004bed
!	Mem[0000000010001410] = 00000000, %l0 = 0000000000270000
	ldsha	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041410] = 00000000 000075ff, %l6 = ffffffff, %l7 = 000000ff
	ldda	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000000 00000000000075ff
!	Mem[0000000030181400] = 00000000, %l1 = 0000000000004bed
	ldsba	[%i6+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l7 = 00000000000075ff
	lduha	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l0 = 0000000000000000
	ldsba	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = 7e60bfff, %l6 = 0000000000000000
	lduba	[%i6+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101400] = 00000000, %l6 = 00000000000000ff
	ldsh	[%i4+0x002],%l6		! %l6 = 0000000000000000
!	Mem[0000000020800040] = 00ffc1d1, %l7 = 0000000000000000
	ldub	[%o1+0x040],%l7		! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ffffffff, Mem[0000000030081410] = 9f65dd20480499ac
	stxa	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000ffffffff

p0_label_350:
!	Mem[0000000030101408] = ff000000, %l0 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	%l3 = 0000270000000000, Mem[0000000030041400] = 000005ffffff0000
	stxa	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000270000000000
!	%l4 = 00000000ffffffff, Mem[0000000010081400] = ff000000ff0efb76
	stx	%l4,[%i2+%g0]		! Mem[0000000010081400] = 00000000ffffffff
!	%f10 = ac990448 20dd659f, Mem[0000000030141410] = ffffffff 00ff75ff
	stda	%f10,[%i5+%o5]0x89	! Mem[0000000030141410] = ac990448 20dd659f
!	%f20 = 9f65dd20 000075ff, %l7 = 0000000000000000
!	Mem[00000000100c1418] = ff000000817d0600
	add	%i3,0x018,%g1
	stda	%f20,[%g1+%l7]ASI_PST16_PL ! Mem[00000000100c1418] = ff000000817d0600
!	%l2 = 00000000000000ec, Mem[0000000030001400] = ffffffff
	stha	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = ffff00ec
!	%f16 = ffbf607e 20dd659f, %l2 = 00000000000000ec
!	Mem[00000000300c1410] = 9f1d210000000000
	add	%i3,0x010,%g1
	stda	%f16,[%g1+%l2]ASI_PST16_SL ! Mem[00000000300c1410] = 9f1d21007e60bfff
!	%f8  = ac990448, Mem[0000000030181408] = c1b16517
	sta	%f8 ,[%i6+%o4]0x89	! Mem[0000000030181408] = ac990448
!	%l1 = 0000000000000000, Mem[0000000030101408] = ff000000
	stwa	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 490000ff, %l6 = 0000000000000000
	lduba	[%i5+%o5]0x88,%l6	! %l6 = 00000000000000ff

p0_label_351:
!	Mem[0000000010001400] = ffff0000, %l5 = 0000000000270000
	lduba	[%i0+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1408] = 0000000000000000, %l7 = 0000000000000000
	ldxa	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081410] = 00ff0000, %l1 = 0000000000000000
	ldsba	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181410] = ffbf607e, %l6 = 00000000000000ff
	lduwa	[%i6+%o5]0x80,%l6	! %l6 = 00000000ffbf607e
!	%l0 = 00000000000000ff, imm = fffffffffffffc9c, %l3 = 0000270000000000
	and	%l0,-0x364,%l3		! %l3 = 000000000000009c
!	Mem[0000000030181410] = 000000ff, %l3 = 000000000000009c
	lduwa	[%i6+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081410] = 00ff004900ff0000, %l6 = 00000000ffbf607e
	ldxa	[%i2+%o5]0x88,%l6	! %l6 = 00ff004900ff0000
!	Mem[00000000300c1410] = 00211d9f, %l5 = 00000000000000ff
	ldsha	[%i3+%o5]0x89,%l5	! %l5 = 0000000000001d9f
!	Mem[0000000010101410] = 000000ffffffff01, %f14 = 0000ffff 00000000
	ldda	[%i4+%o5]0x80,%f14	! %f14 = 000000ff ffffff01
!	Starting 10 instruction Store Burst
!	%l6 = 00ff004900ff0000, Mem[0000000010001410] = 00000000
	stha	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000

p0_label_352:
!	%l2 = 000000ec, %l3 = 000000ff, Mem[0000000010101408] = 00ff75ff ff010000
	stda	%l2,[%i4+0x008]%asi	! Mem[0000000010101408] = 000000ec 000000ff
!	%l3 = 00000000000000ff, Mem[00000000100c1408] = 00000000, %asi = 80
	stha	%l3,[%i3+0x008]%asi	! Mem[00000000100c1408] = 00ff0000
!	%f0  = 00000000 00000000, %l3 = 00000000000000ff
!	Mem[0000000010081408] = ec00000000000000
	add	%i2,0x008,%g1
	stda	%f0,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010081408] = 0000000000000000
!	%l1 = 0000000000000000, immed = 00000828, %y  = 0000803f
	smul	%l1,0x828,%l3		! %l3 = 0000000000000000, %y = 00000000
!	Mem[00000000218001c1] = 00ff6949, %l6 = 00ff004900ff0000
	ldstub	[%o3+0x1c1],%l6		! %l6 = 000000ff000000ff
!	%f0  = 00000000 00000000 9f65dd20 7e60bfff
!	%f4  = 00000000 ffffffff 00ffffff ffffffff
!	%f8  = ac990448 ffff0000 ac990448 20dd659f
!	%f12 = ff750000 00000000 000000ff ffffff01
	stda	%f0,[%i0]ASI_BLK_AIUSL	! Block Store to 0000000030001400
	membar	#Sync			! Added by membar checker (54)
!	Mem[0000000010001410] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i0+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	%f16 = ffbf607e, Mem[0000000030041410] = ffffffdd
	sta	%f16,[%i1+%o5]0x89	! Mem[0000000030041410] = ffbf607e
!	%l2 = 00000000000000ec, Mem[0000000010141400] = ffffffff, %asi = 80
	stba	%l2,[%i5+0x000]%asi	! Mem[0000000010141400] = ecffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ac990448, %l7 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l7	! %l7 = 00000048000000ff

p0_label_353:
!	Mem[0000000030041408] = ff000000 00000000, %l4 = ffffffff, %l5 = 00001d9f
	ldda	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000000 00000000ff000000
!	Mem[0000000010081400] = 00000000, %l6 = 00000000000000ff
	lduba	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000218000c0] = ffff4ce8, %l4 = 0000000000000000
	lduba	[%o3+0x0c1]%asi,%l4	! %l4 = 00000000000000ff
!	%l4 = 00000000000000ff, %l2 = 00000000000000ec, %y  = 00000000
	smul	%l4,%l2,%l4		! %l4 = 000000000000eb14, %y = 00000000
!	Mem[0000000010181410] = ffbf607e20dd659f, %f6  = 00ffffff ffffffff
	ldda	[%i6+%o5]0x80,%f6 	! %f6  = ffbf607e 20dd659f
!	Mem[00000000201c0000] = 99ac4c08, %l2 = 00000000000000ec
	ldub	[%o0+%g0],%l2		! %l2 = 0000000000000099
!	Mem[0000000010181408] = 0000000000000000, %l1 = 0000000000000000
	ldxa	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l2 = 0000000000000099
	ldsba	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = 00067d81490000ff, %l5 = 00000000ff000000
	ldxa	[%i5+%o5]0x88,%l5	! %l5 = 00067d81490000ff
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[00000000211c0001] = ffff85d2, %asi = 80
	stba	%l6,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff0085d2

p0_label_354:
!	%l7 = 0000000000000048, Mem[0000000010181432] = 00000080, %asi = 80
	stha	%l7,[%i6+0x032]%asi	! Mem[0000000010181430] = 00000048
!	%l2 = 0000000000000000, Mem[00000000100c1410] = ff00000000000000
	stxa	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000000000000000
!	Mem[0000000010181410] = ffbf607e, %l0 = 00000000000000ff
	ldstuba	[%i6+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	%l2 = 0000000000000000, Mem[0000000010001426] = 00000050
	stb	%l2,[%i0+0x026]		! Mem[0000000010001424] = 00000050
!	%l3 = 0000000000000000, Mem[0000000010181400] = 00000000, %asi = 80
	stwa	%l3,[%i6+0x000]%asi	! Mem[0000000010181400] = 00000000
!	%l2 = 0000000000000000, Mem[0000000030101408] = 00000000
	stha	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	Mem[0000000010101408] = 000000ec, %l4 = 000000000000eb14
	swapa	[%i4+%o4]0x80,%l4	! %l4 = 00000000000000ec
!	Mem[0000000010001438] = 00000000, %l2 = 00000000, %l1 = 00000000
	add	%i0,0x38,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 0000000000000000
!	%l4 = 00000000000000ec, Mem[00000000100c1410] = 00000000
	stha	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ec
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 4b0000ff000001ff, %l6 = 0000000000000000
	ldxa	[%i5+%o4]0x88,%l6	! %l6 = 4b0000ff000001ff

p0_label_355:
!	Mem[0000000010181420] = 00583e7e, %l0 = 00000000000000ff
	ldsha	[%i6+0x022]%asi,%l0	! %l0 = 0000000000003e7e
!	Mem[0000000010001400] = ffff0000 000001ff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 00000000ffff0000 00000000000001ff
!	Mem[0000000030081408] = 000001ff00001dec, %l7 = 0000000000000048
	ldxa	[%i2+%o4]0x89,%l7	! %l7 = 000001ff00001dec
!	Mem[0000000030041408] = 00000000, %l1 = 0000000000000000
	ldsha	[%i1+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001410] = ff000000 00270000, %l4 = 000000ec, %l5 = 490000ff
	ldda	[%i0+%o5]0x80,%l4	! %l4 = 00000000ff000000 0000000000270000
!	Mem[0000000030041410] = ffbf607e, %l1 = 0000000000000000
	lduha	[%i1+%o5]0x89,%l1	! %l1 = 000000000000607e
!	%l3 = 00000000000001ff, %l3 = 00000000000001ff, %l7 = 000001ff00001dec
	xnor	%l3,%l3,%l7		! %l7 = ffffffffffffffff
!	Mem[0000000030001410] = ffffffff, %l6 = 4b0000ff000001ff
	ldsha	[%i0+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181414] = 20dd659f, %l0 = 0000000000003e7e
	ldsba	[%i6+0x016]%asi,%l0	! %l0 = 0000000000000065
!	Starting 10 instruction Store Burst
!	%f10 = ac990448 20dd659f, %l6 = ffffffffffffffff
!	Mem[00000000100c1428] = 9f65dd207e60bfff
	add	%i3,0x028,%g1
	stda	%f10,[%g1+%l6]ASI_PST8_P ! Mem[00000000100c1428] = ac99044820dd659f

p0_label_356:
!	%f18 = ff000000 000000ff, Mem[0000000010141408] = 000001ff 4b0000ff
	stda	%f18,[%i5+%o4]0x88	! Mem[0000000010141408] = ff000000 000000ff
!	%l2 = 00000000ffff0000, Mem[0000000030041400] = 0000000000270000
	stxa	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000ffff0000
!	%l3 = 00000000000001ff, Mem[0000000010001410] = 000000ff
	stha	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 000001ff
!	Mem[0000000030141410] = 9f65dd20, %l0 = 0000000000000065
	ldstuba	[%i5+%o5]0x81,%l0	! %l0 = 0000009f000000ff
!	Mem[0000000010041410] = 00000000, %l3 = 00000000000001ff
	swapa	[%i1+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%l2 = 00000000ffff0000, Mem[0000000030141400] = bfffffff000000ff
	stxa	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000ffff0000
!	Mem[0000000030181400] = 00000000, %l0 = 000000000000009f
	swapa	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000000
!	%l4 = 00000000ff000000, Mem[0000000010101408] = 0000eb14
	stwa	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = ff000000
!	%l4 = ff000000, %l5 = 00270000, Mem[0000000030141400] = 00000000 ffff0000
	stda	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = ff000000 00270000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000, %l1 = 000000000000607e
	lduba	[%i1+%o4]0x89,%l1	! %l1 = 0000000000000000

p0_label_357:
!	Mem[0000000030101400] = 0000ffff, %l6 = ffffffffffffffff
	lduha	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = 00000000 00000000, %l6 = 00000000, %l7 = ffffffff
	ldda	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010001438] = 00000000, %l2 = 00000000ffff0000
	lduw	[%i0+0x038],%l2		! %l2 = 0000000000000000
!	Mem[00000000100c142c] = 20dd659f, %l5 = 0000000000270000
	lduha	[%i3+0x02c]%asi,%l5	! %l5 = 00000000000020dd
!	Mem[0000000010081400] = 00000000 ffffffff 00000000 00000000
!	Mem[0000000010081410] = 0000ff00 4900ff00 acad0ca9 c193a468
!	Mem[0000000010081420] = 009bec30 49000000 ffffffff 000000ff
!	Mem[0000000010081430] = 00000000 780000ff ffffffff f20a2ca5
	ldda	[%i2]ASI_BLK_P,%f0	! Block Load from 0000000010081400
!	Mem[0000000010181414] = 20dd659f, %l5 = 00000000000020dd
	ldsb	[%i6+0x014],%l5		! %l5 = 0000000000000020
!	Mem[000000001010140c] = 000000ff, %l1 = 0000000000000000
	ldub	[%i4+0x00f],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030141400] = 000000ff, %l4 = 00000000ff000000
	lduha	[%i5+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101400] = 0000ffff, %f22 = 406ac000
	lda	[%i4+%g0]0x81,%f22	! %f22 = 0000ffff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[0000000020800040] = 00ffc1d1, %asi = 80
	stha	%l4,[%o1+0x040]%asi	! Mem[0000000020800040] = 00ffc1d1

p0_label_358:
!	%l5 = 0000000000000020, Mem[0000000030081408] = 00001dec
	stba	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 00001d20
!	Mem[0000000020800000] = ffffba64, %l0 = 0000000000000000
	ldstuba	[%o1+0x000]%asi,%l0	! %l0 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[0000000030141400] = ff000000
	stba	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = ff000000
!	%l3 = 0000000000000000, Mem[0000000010141410] = 490000ff
	stba	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = 49000000
!	%l7 = 0000000000000000, Mem[0000000010181400] = 00000000
	stwa	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
	membar	#Sync			! Added by membar checker (55)
!	%l0 = 000000ff, %l1 = 000000ff, Mem[0000000010081408] = 00000000 00000000
	stda	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000ff 000000ff
!	Mem[0000000030141400] = 000000ff, %l5 = 0000000000000020
	swapa	[%i5+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%f16 = ffbf607e, Mem[0000000030181410] = ff000000
	sta	%f16,[%i6+%o5]0x81	! Mem[0000000030181410] = ffbf607e
!	%l4 = 00000000000000ff, Mem[0000000030141400] = 00000020
	stha	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000000, %l0 = 00000000000000ff
	ldswa	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000

p0_label_359:
!	Mem[00000000201c0000] = 99ac4c08, %l0 = 0000000000000000
	lduh	[%o0+%g0],%l0		! %l0 = 00000000000099ac
!	Mem[0000000030181410] = 000000017e60bfff, %f10 = ffffffff 000000ff
	ldda	[%i6+%o5]0x89,%f10	! %f10 = 00000001 7e60bfff
!	%l5 = 00000000000000ff, %l3 = 0000000000000000, %l7 = 0000000000000000
	addc	%l5,%l3,%l7		! %l7 = 00000000000000ff
!	Mem[0000000010181408] = 00000000, %l4 = 00000000000000ff
	ldsha	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001410] = ff01000000270000, %l5 = 00000000000000ff
	ldxa	[%i0+%o5]0x80,%l5	! %l5 = ff01000000270000
!	Mem[000000001008143c] = f20a2ca5, %l5 = ff01000000270000
	ldsw	[%i2+0x03c],%l5		! %l5 = fffffffff20a2ca5
!	Mem[0000000030041408] = 00000000, %l4 = 0000000000000000
	ldsha	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l4 = 0000000000000000
	ldsha	[%i4+%g0]0x88,%l4	! %l4 = 0000000000000000
!	%l0 = 00000000000099ac, %l2 = 0000000000000000, %l0 = 00000000000099ac
	addc	%l0,%l2,%l0		! %l0 = 00000000000099ac
!	Starting 10 instruction Store Burst
!	Mem[0000000010041427] = 00000000, %l3 = 0000000000000000
	ldstub	[%i1+0x027],%l3		! %l3 = 00000000000000ff

p0_label_360:
!	%f24 = ac990448, %f2  = 00000000, %f4  = 0000ff00
	fadds	%f24,%f2 ,%f4 		! %f4  = ac990448
!	%l2 = 0000000000000000, %l4 = 0000000000000000, %l5 = fffffffff20a2ca5
	xnor	%l2,%l4,%l5		! %l5 = ffffffffffffffff
!	Mem[0000000021800100] = ffa18676, %l7 = 00000000000000ff
	ldstuba	[%o3+0x100]%asi,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010181408] = 00000000, %l2 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000000
!	%l1 = 00000000000000ff, Mem[0000000030041410] = 7e60bfff
	stwa	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000ff
!	%f20 = 9f65dd20 000075ff, Mem[0000000010141410] = 00000049 817d0600
	stda	%f20,[%i5+%o5]0x80	! Mem[0000000010141410] = 9f65dd20 000075ff
!	%f20 = 9f65dd20, Mem[0000000010101410] = ff000000
	sta	%f20,[%i4+%o5]0x88	! Mem[0000000010101410] = 9f65dd20
!	%f22 = 0000ffff, Mem[0000000010101410] = 20dd659f
	sta	%f22,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000ffff
!	%l5 = ffffffffffffffff, Mem[00000000300c1408] = ffffffff
	stba	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[000000001000143c] = 00000000, %l5 = ffffffffffffffff
	ldsw	[%i0+0x03c],%l5		! %l5 = 0000000000000000

p0_label_361:
!	Mem[0000000010001400] = ffff0000, %l3 = 0000000000000000
	ldsha	[%i0+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010081408] = ff000000, %l5 = 0000000000000000
	lduba	[%i2+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1438] = f1ff94ff000000ff, %l7 = 00000000000000ff
	ldx	[%i3+0x038],%l7		! %l7 = f1ff94ff000000ff
!	Mem[00000000300c1400] = 00000000 00c00050, %l4 = 00000000, %l5 = 00000000
	ldda	[%i3+%g0]0x81,%l4	! %l4 = 0000000000000000 0000000000c00050
!	Mem[0000000030001400] = 00000000 00000000, %l2 = 00000000, %l3 = ffffffff
	ldda	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[00000000300c1400] = 00000000 00c00050, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000 0000000000c00050
!	Mem[0000000010041400] = ff0000ff 0000004b, %l6 = 00000000, %l7 = 00c00050
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 00000000ff0000ff 000000000000004b
!	Mem[0000000010101400] = 00000000, %l2 = 0000000000000000
	ldsba	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l0 = 00000000000099ac
	ldsba	[%i2+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = ff00ffff, %l7 = 000000000000004b
	swapa	[%i3+%g0]0x80,%l7	! %l7 = 00000000ff00ffff

p0_label_362:
!	%l7 = 00000000ff00ffff, Mem[0000000030041400] = ffff0000
	stba	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = ffff00ff
!	%f5  = 4900ff00, Mem[0000000030141408] = ffff0000
	sta	%f5 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 4900ff00
!	%l7 = 00000000ff00ffff, Mem[0000000010181410] = ffbf607e
	stha	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = ffff607e
!	Mem[0000000030141400] = ff000000, %l3 = 0000000000000000
	swapa	[%i5+%g0]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[00000000100c1408] = 0000ff00, %l7 = 00000000ff00ffff
	ldstuba	[%i3+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%f29 = 203504f3, Mem[0000000010001408] = ff000000
	sta	%f29,[%i0+%o4]0x80	! Mem[0000000010001408] = 203504f3
!	%f16 = ffbf607e 20dd659f ff000000 000000ff
!	%f20 = 9f65dd20 000075ff 0000ffff 00000000
!	%f24 = ac990448 00000000 203504f3 00000000
!	%f28 = 00000000 203504f3 00000000 00000000
	stda	%f16,[%i3]ASI_BLK_P	! Block Store to 00000000100c1400
!	%f10 = 00000001, Mem[0000000010101410] = ffff0000
	sta	%f10,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000001
!	%l4 = 0000000000000000, Mem[0000000010181410] = ffff607e20dd659f
	stxa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181404] = 0000607e, %l5 = 0000000000c00050
	lduha	[%i6+0x004]%asi,%l5	! %l5 = 0000000000000000

p0_label_363:
!	Mem[0000000010081410] = 00ff0000, %l7 = 0000000000000000
	ldsba	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041400] = ff00ffff, %l1 = 00000000000000ff
	ldsha	[%i1+%g0]0x81,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000030141410] = ff65dd20, %f11 = 7e60bfff
	lda	[%i5+%o5]0x81,%f11	! %f11 = ff65dd20
!	Mem[0000000010001410] = ff010000, %l3 = 00000000ff000000
	lduwa	[%i0+%o5]0x80,%l3	! %l3 = 00000000ff010000
!	Mem[0000000030081410] = 00000000, %f4  = ac990448
	lda	[%i2+%o5]0x89,%f4 	! %f4 = 00000000
!	Mem[0000000030001410] = ffffffff, %l3 = 00000000ff010000
	ldswa	[%i0+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041400] = ff0000ff 0000004b, %l4 = 00000000, %l5 = 00000000
	ldd	[%i1+%g0],%l4		! %l4 = 00000000ff0000ff 000000000000004b
!	Mem[0000000010181408] = 00000000, %l1 = ffffffffffffff00
	lduba	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = 000000ff 000000ff, %l6 = ff0000ff, %l7 = 00000000
	ldda	[%i2+%o4]0x80,%l6	! %l6 = 00000000000000ff 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000010101408] = ff000000000000ff
	stxa	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000000000ff

p0_label_364:
!	%l3 = ffffffffffffffff, %l6 = 00000000000000ff, %l1 = 0000000000000000
	orn	%l3,%l6,%l1		! %l1 = ffffffffffffffff
!	Mem[0000000030001410] = ffffffff, %l6 = 00000000000000ff
	ldstuba	[%i0+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	%l4 = ff0000ff, %l5 = 0000004b, Mem[0000000010181408] = 00000000 00000000
	stda	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = ff0000ff 0000004b
!	%l0 = 00000000, %l1 = ffffffff, Mem[0000000010041410] = ff010000 ff750000
	stda	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000 ffffffff
!	%f6  = acad0ca9 c193a468, %l3 = ffffffffffffffff
!	Mem[0000000030001428] = 9f65dd20480499ac
	add	%i0,0x028,%g1
	stda	%f6,[%g1+%l3]ASI_PST32_S ! Mem[0000000030001428] = acad0ca9c193a468
!	%f14 = ffffffff, Mem[0000000010101400] = 00000000
	sta	%f14,[%i4+%g0]0x80	! Mem[0000000010101400] = ffffffff
!	%l0 = 0000000000000000, Mem[0000000010001438] = 00000000
	stw	%l0,[%i0+0x038]		! Mem[0000000010001438] = 00000000
!	%l4 = 00000000ff0000ff, Mem[000000001010143a] = 00000000
	stb	%l4,[%i4+0x03a]		! Mem[0000000010101438] = 0000ff00
!	%f14 = ffffffff f20a2ca5, Mem[0000000030041408] = 00000000 000000ff
	stda	%f14,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffff f20a2ca5
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (56)
!	Mem[00000000300c1400] = 00000000 00c00050 ffffffff 000000ff
!	Mem[00000000300c1410] = 9f1d2100 7e60bfff acad0ca9 c193a468
!	Mem[00000000300c1420] = e139503d 8ea847d9 f8ffffff 5063fba2
!	Mem[00000000300c1430] = a675a8b0 7cfb0e7c 55045c7d 6de02ca5
	ldda	[%i3]ASI_BLK_S,%f16	! Block Load from 00000000300c1400

p0_label_365:
!	Mem[0000000010181400] = 00000000 0000607e ff0000ff 0000004b
!	Mem[0000000010181410] = 00000000 00000000 00000000 ffffffff
!	Mem[0000000010181420] = 00583e7e 0000803f 000000ff ffffffff
!	Mem[0000000010181430] = 00000048 a675a8b0 c193a4ff 000000ff
	ldda	[%i6]ASI_BLK_P,%f16	! Block Load from 0000000010181400
!	Mem[0000000030101400] = 00000000 ffff0000, %l2 = 00000000, %l3 = ffffffff
	ldda	[%i4+%g0]0x89,%l2	! %l2 = 00000000ffff0000 0000000000000000
!	Mem[0000000030141400] = 00000000, %l3 = 0000000000000000
	ldsba	[%i5+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000021800040] = ffffd022, %l2 = 00000000ffff0000
	ldsba	[%o3+0x040]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000201c0000] = 99ac4c08, %l3 = 0000000000000000
	lduh	[%o0+%g0],%l3		! %l3 = 00000000000099ac
!	Mem[00000000100c1400] = ffbf607e, %f8  = 009bec30
	lda	[%i3+%g0]0x80,%f8 	! %f8 = ffbf607e
!	Mem[00000000300c1408] = ffffffff, %f1  = ffffffff
	lda	[%i3+%o4]0x81,%f1 	! %f1 = ffffffff
!	Mem[0000000030001400] = 00000000, %l1 = ffffffffffffffff
	ldsha	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i2+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c141c] = 00000000, %l2 = ffffffffffffffff
	swap	[%i3+0x01c],%l2		! %l2 = 0000000000000000

p0_label_366:
!	Mem[0000000030081410] = 00000000, %l5 = 000000000000004b
	swapa	[%i2+%o5]0x89,%l5	! %l5 = 0000000000000000
!	%l0 = 0000000000000000, Mem[00000000211c0001] = ff0085d2, %asi = 80
	stba	%l0,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff0085d2
!	%l4 = 00000000ff0000ff, Mem[0000000010141400] = 93013579ffffffec
	stxa	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000ff0000ff
!	%f11 = ff65dd20, %f9  = 49000000, %f11 = ff65dd20
	fsubs	%f11,%f9 ,%f11		! %f11 = ff65dd20
!	Mem[000000001004142c] = 817d0600, %l4 = 00000000ff0000ff
	swap	[%i1+0x02c],%l4		! %l4 = 00000000817d0600
!	Mem[0000000010001410] = ff010000, %l1 = 0000000000000000
	swap	[%i0+%o5],%l1		! %l1 = 00000000ff010000
!	%l3 = 00000000000099ac, Mem[0000000010001410] = 00000000
	stha	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = 99ac0000
!	Mem[0000000030181408] = ac9904ff, %l1 = 00000000ff010000
	ldstuba	[%i6+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000100c1408] = ff000000, %l2 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l2	! %l2 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001438] = 00000000, %l1 = 00000000000000ff
	lduwa	[%i0+0x038]%asi,%l1	! %l1 = 0000000000000000

p0_label_367:
!	Mem[0000000010181404] = 0000607e, %f2  = 00000000
	lda	[%i6+0x004]%asi,%f2 	! %f2 = 0000607e
!	Mem[00000000100c143c] = 00000000, %l3 = 00000000000099ac
	lduh	[%i3+0x03c],%l3		! %l3 = 0000000000000000
!	Mem[0000000030141410] = ac99044820dd65ff, %l5 = 0000000000000000
	ldxa	[%i5+%o5]0x89,%l5	! %l5 = ac99044820dd65ff
!	%l7 = 0000000000000000, immd = fffffffffffffbe5, %l3  = 0000000000000000
	mulx	%l7,-0x41b,%l3		! %l3 = 0000000000000000
!	Mem[0000000010041408] = 000000ff, %l5 = ac99044820dd65ff
	ldsha	[%i1+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[000000001014141c] = a52ce06d, %l1 = 0000000000000000
	ldsb	[%i5+0x01e],%l1		! %l1 = ffffffffffffffe0
!	Randomly selected nop
	nop
!	Mem[0000000030101400] = 0000ffff, %f13 = 780000ff
	lda	[%i4+%g0]0x81,%f13	! %f13 = 0000ffff
!	%l5 = 00000000000000ff, %l7 = 0000000000000000, %l3 = 0000000000000000
	andn	%l5,%l7,%l3		! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffffe0, Mem[00000000100c1402] = ffbf607e, %asi = 80
	stha	%l1,[%i3+0x002]%asi	! Mem[00000000100c1400] = ffbfffe0

p0_label_368:
!	%l2 = ff000000, %l3 = 000000ff, Mem[0000000030001410] = ffffffff 00000000
	stda	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = ff000000 000000ff
!	%l2 = ff000000, %l3 = 000000ff, Mem[0000000030141408] = 4900ff00 00000000
	stda	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = ff000000 000000ff
!	%l6 = 00000000000000ff, %l0 = 0000000000000000, %y  = 00000000
	smul	%l6,%l0,%l1		! %l1 = 0000000000000000, %y = 00000000
!	%l2 = 00000000ff000000, imm = 0000000000000947, %l1 = 0000000000000000
	andn	%l2,0x947,%l1		! %l1 = 00000000ff000000
!	%l7 = 0000000000000000, Mem[0000000010001410] = 99ac000000270000
	stxa	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000000
!	%l6 = 00000000000000ff, Mem[0000000010141410] = 9f65dd20000075ff
	stxa	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000000000ff
!	Mem[0000000010101408] = 00000000, %l2 = 00000000ff000000
	ldstuba	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%l5 = 00000000000000ff, %l3 = 00000000000000ff, %l7 = 0000000000000000
	orn	%l5,%l3,%l7		! %l7 = ffffffffffffffff
!	%l6 = 00000000000000ff, Mem[0000000010001410] = 00000000
	stwa	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ffffffff f20a2ca5, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i1+%o4]0x81,%l2	! %l2 = 00000000ffffffff 00000000f20a2ca5

p0_label_369:
!	Mem[0000000010141438] = 0000007c ffff0000, %l2 = ffffffff, %l3 = f20a2ca5
	ldd	[%i5+0x038],%l2		! %l2 = 000000000000007c 00000000ffff0000
!	Mem[0000000010001410] = 000000ff, %l3 = 00000000ffff0000
	lduha	[%i0+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101418] = 00270000ffffffff, %l6 = 00000000000000ff
	ldxa	[%i4+0x018]%asi,%l6	! %l6 = 00270000ffffffff
!	Mem[0000000020800000] = ffffba64, %l1 = 00000000ff000000
	lduha	[%o1+0x000]%asi,%l1	! %l1 = 000000000000ffff
!	Mem[00000000201c0000] = 99ac4c08, %l0 = 0000000000000000
	ldsba	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffff99
!	Mem[00000000300c1410] = 00211d9f, %l3 = 0000000000000000
	lduba	[%i3+%o5]0x89,%l3	! %l3 = 000000000000009f
!	Mem[00000000211c0000] = ff0085d2, %l7 = ffffffffffffffff
	ldub	[%o2+0x001],%l7		! %l7 = 0000000000000000
!	Mem[0000000010181408] = ff0000ff, %l6 = 00270000ffffffff
	ldswa	[%i6+%o4]0x80,%l6	! %l6 = ffffffffff0000ff
!	Mem[0000000030001400] = 0000000000000000, %f10 = 00000001 ff65dd20
	ldda	[%i0+%g0]0x81,%f10	! %f10 = 00000000 00000000
!	Starting 10 instruction Store Burst
!	%f22 = 00000000, Mem[00000000100c1408] = 00000000
	sta	%f22,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000

p0_label_370:
!	%l7 = 0000000000000000, Mem[0000000021800181] = 4bedbd9f
	stb	%l7,[%o3+0x181]		! Mem[0000000021800180] = 4b00bd9f
!	%f21 = 00000000, %f30 = c193a4ff, %f31 = 000000ff
	fadds	%f21,%f30,%f31		! %f31 = c193a4ff
!	Mem[0000000010141414] = 000000ff, %l4 = 00000000817d0600, %asi = 80
	swapa	[%i5+0x014]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181430] = 00000048, %l1 = 000000000000ffff
	lduha	[%i6+0x030]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041410] = ff000000, %l7 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l7	! %l7 = 00000000ff000000
!	%l6 = ffffffffff0000ff, Mem[0000000010081400] = 00000000
	stha	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff
!	Mem[00000000100c1408] = 00000000, %l3 = 000000000000009f
	ldstuba	[%i3+%o4]0x80,%l3	! %l3 = 00000000000000ff
	membar	#Sync			! Added by membar checker (57)
!	%f2  = 0000607e 00000000, %l4 = 00000000000000ff
!	Mem[0000000010181438] = c193a4ff000000ff
	add	%i6,0x038,%g1
	stda	%f2,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010181438] = 000000007e600000
!	Mem[0000000030001410] = ff000000, %l1 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ffff0000, %f2  = 0000607e
	lda	[%i0+%g0]0x80,%f2 	! %f2 = ffff0000

p0_label_371:
!	Mem[0000000010041430] = 7c0efb7c, %l0 = ffffffffffffff99
	lduwa	[%i1+0x030]%asi,%l0	! %l0 = 000000007c0efb7c
!	%l0 = 7c0efb7c, %l1 = 00000000, Mem[0000000010041400] = ff0000ff 4b000000
	stda	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 7c0efb7c 00000000
!	Mem[0000000010141408] = 000000ff, %l6 = ffffffffff0000ff
	lduba	[%i5+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000021800000] = ff52f103, %l2 = 000000000000007c
	lduha	[%o3+0x000]%asi,%l2	! %l2 = 000000000000ff52
!	Mem[0000000010181404] = 0000607e, %l3 = 0000000000000000
	ldsh	[%i6+0x004],%l3		! %l3 = 0000000000000000
!	Mem[0000000010101410] = 00000001, %f2  = ffff0000
	lda	[%i4+%o5]0x88,%f2 	! %f2 = 00000001
!	Mem[0000000030141400] = 00000000, %l1 = 0000000000000000
	lduwa	[%i5+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041408] = ffffffff, %f16 = 00000000
	lda	[%i1+%o4]0x89,%f16	! %f16 = ffffffff
!	Mem[0000000010101408] = ff000000000000ff, %l3 = 0000000000000000
	ldxa	[%i4+%o4]0x80,%l3	! %l3 = ff000000000000ff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[0000000021800100] = ffa18676, %asi = 80
	stha	%l4,[%o3+0x100]%asi	! Mem[0000000021800100] = 00ff8676

p0_label_372:
!	%l6 = 000000ff, %l7 = ff000000, Mem[00000000300c1400] = 00000000 5000c000
	stda	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ff ff000000
!	Mem[0000000010101408] = 000000ff, %l2 = 000000000000ff52
	swapa	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%l7 = 00000000ff000000, immed = fffff0bd, %y  = 00000000
	smul	%l7,-0xf43,%l4		! %l4 = 0000000f43000000, %y = 0000000f
!	Mem[00000000100c1408] = ff000000, %l0 = 7c0efb7c, %l3 = 000000ff
	add	%i3,0x08,%g1
	casa	[%g1]0x80,%l0,%l3	! %l3 = 00000000ff000000
!	%l3 = 00000000ff000000, Mem[0000000010101410] = 00000001
	stba	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	Mem[0000000010181400] = 00000000, %l2 = 00000000000000ff
	swapa	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181428] = 000000ffffffffff, %l3 = 00000000ff000000, %l5 = 00000000000000ff
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l3,%l5	! %l5 = 000000ffffffffff
!	%l3 = 00000000ff000000, Mem[0000000030081400] = ff60bfff
	stwa	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = ff000000
!	%l5 = 000000ffffffffff, Mem[0000000010101410] = 00000000
	stwa	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff000000, %l0 = 000000007c0efb7c
	ldsha	[%i2+%g0]0x80,%l0	! %l0 = ffffffffffffff00

p0_label_373:
!	Mem[0000000010181408] = ff0000ff0000004b, %f8  = ffbf607e 49000000
	ldda	[%i6+%o4]0x80,%f8 	! %f8  = ff0000ff 0000004b
!	Mem[00000000100c1408] = ff000000, %l7 = 00000000ff000000
	lduha	[%i3+%o4]0x80,%l7	! %l7 = 000000000000ff00
!	Mem[0000000030081408] = 000001ff 00001d20, %l6 = 000000ff, %l7 = 0000ff00
	ldda	[%i2+%o4]0x89,%l6	! %l6 = 0000000000001d20 00000000000001ff
!	Mem[0000000030001400] = 00000000, %f15 = f20a2ca5
	lda	[%i0+%g0]0x89,%f15	! %f15 = 00000000
!	Mem[00000000100c1424] = 00000000, %l0 = ffffffffffffff00
	lduwa	[%i3+0x024]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181408] = 4b000000ff0000ff, %f6  = acad0ca9 c193a468
	ldda	[%i6+%o4]0x88,%f6 	! %f6  = 4b000000 ff0000ff
!	Mem[0000000010141418] = 7c0efb7c, %f17 = 0000607e
	lda	[%i5+0x018]%asi,%f17	! %f17 = 7c0efb7c
!	Mem[0000000010041400] = 7cfb0e7c00000000, %l5 = 000000ffffffffff
	ldxa	[%i1+%g0]0x80,%l5	! %l5 = 7cfb0e7c00000000
!	Mem[000000001008141c] = c193a468, %l5 = 7cfb0e7c00000000
	ldsb	[%i2+0x01e],%l5		! %l5 = ffffffffffffffa4
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 00000000, %l6 = 0000000000001d20
	ldstuba	[%i4+%o4]0x89,%l6	! %l6 = 00000000000000ff

p0_label_374:
!	Mem[0000000010081408] = ff000000, %l1 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l1	! %l1 = 00000000ff000000
!	Mem[0000000030081400] = 000000ff, %l5 = ffffffffffffffa4
	ldstuba	[%i2+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	%f24 = 00583e7e, %f21 = 00000000, %f24 = 00583e7e 0000803f
	fsmuld	%f24,%f21,%f24		! %f24 = 00000000 00000000
!	Mem[0000000010101400] = ffffffff, %l3 = 00000000ff000000
	ldstuba	[%i4+%g0]0x80,%l3	! %l3 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000030101408] = ff000000
	stba	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = ff000000
!	%f30 = c193a4ff c193a4ff, Mem[00000000100c1410] = 9f65dd20 000075ff
	stda	%f30,[%i3+%o5]0x80	! Mem[00000000100c1410] = c193a4ff c193a4ff
!	%l1 = 00000000ff000000, Mem[0000000010181418] = 00000000ffffffff, %asi = 80
	stxa	%l1,[%i6+0x018]%asi	! Mem[0000000010181418] = 00000000ff000000
!	%l5 = 00000000000000ff, Mem[0000000010141400] = ff0000ff
	stwa	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff
!	%f4  = 00000000 4900ff00, Mem[0000000010041400] = 7c0efb7c 00000000
	stda	%f4 ,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000 4900ff00
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 99ac4c08, %l4 = 0000000f43000000
	lduh	[%o0+%g0],%l4		! %l4 = 00000000000099ac

p0_label_375:
!	Mem[0000000010101410] = 01ffffffffffffff, %f2  = 00000001 00000000
	ldda	[%i4+%o5]0x88,%f2 	! %f2  = 01ffffff ffffffff
!	Mem[0000000030041400] = ff00ffff, %l6 = 0000000000000000
	ldswa	[%i1+%g0]0x81,%l6	! %l6 = ffffffffff00ffff
!	Mem[0000000010141410] = 00067d8100000000, %l3 = 00000000000000ff
	ldxa	[%i5+%o5]0x88,%l3	! %l3 = 00067d8100000000
!	Mem[0000000010041400] = 00ff004900000000, %l0 = 0000000000000000
	ldxa	[%i1+%g0]0x80,%l0	! %l0 = 00ff004900000000
!	Mem[00000000300c1400] = 000000ff, %l6 = ffffffffff00ffff
	ldsha	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1410] = 00211d9f, %l5 = 00000000000000ff
	ldsha	[%i3+%o5]0x89,%l5	! %l5 = 0000000000001d9f
!	Mem[0000000030041408] = a52c0af2ffffffff, %f6  = 4b000000 ff0000ff
	ldda	[%i1+%o4]0x89,%f6 	! %f6  = a52c0af2 ffffffff
!	Mem[0000000010001408] = 203504f3 ff000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i0+%o4]0x80,%l2	! %l2 = 00000000203504f3 00000000ff000000
!	Mem[0000000030141410] = ff65dd20, %l0 = 00ff004900000000
	lduha	[%i5+%o5]0x81,%l0	! %l0 = 000000000000ff65
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = ff000000, %l4 = 000099ac, %l2 = 203504f3
	casa	[%i5]0x80,%l4,%l2	! %l2 = 00000000ff000000

p0_label_376:
!	Mem[000000001014140d] = 000000ff, %l4 = 00000000000099ac
	ldstuba	[%i5+0x00d]%asi,%l4	! %l4 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000030101408] = ff000000
	stba	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	%l6 = 00000000000000ff, Mem[00000000100c141c] = ffffffff
	stw	%l6,[%i3+0x01c]		! Mem[00000000100c141c] = 000000ff
!	%l2 = 00000000ff000000, Mem[0000000021800001] = ff52f103
	stb	%l2,[%o3+0x001]		! Mem[0000000021800000] = ff00f103
!	%f21 = 00000000, Mem[0000000010101400] = ffffffff
	sta	%f21,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000
!	%l6 = 00000000000000ff, Mem[0000000030101410] = 9f65dd20
	stha	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 00ffdd20
!	%l2 = 00000000ff000000, Mem[000000001014143e] = ffff0000
	stb	%l2,[%i5+0x03e]		! Mem[000000001014143c] = ffff0000
!	Mem[0000000030081400] = ff000000, %l6 = 00000000000000ff
	swapa	[%i2+%g0]0x81,%l6	! %l6 = 00000000ff000000
!	Code Fragment 4
p0_fragment_32:
!	%l0 = 000000000000ff65
	setx	0x1b69a6a860508af9,%g7,%l0 ! %l0 = 1b69a6a860508af9
!	%l1 = 00000000ff000000
	setx	0x746560b7df7c2a34,%g7,%l1 ! %l1 = 746560b7df7c2a34
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1b69a6a860508af9
	setx	0x3a5a9d401260e767,%g7,%l0 ! %l0 = 3a5a9d401260e767
!	%l1 = 746560b7df7c2a34
	setx	0x43bb418864b753d2,%g7,%l1 ! %l1 = 43bb418864b753d2
!	Starting 10 instruction Load Burst
!	%l7 = 00000000000001ff, %l4 = 0000000000000000, %y  = 0000000f
	udiv	%l7,%l4,%l6		! Div by zero, %l0 = 3a5a9d401260e7b7
	mov	%l0,%y			! %y = 1260e78f

p0_label_377:
!	Mem[0000000030041408] = ffffffff, %l3 = 00000000ff000000
	ldswa	[%i1+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030101410] = 00ffdd20, %l2 = 00000000ff000000
	lduba	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[000000001008143c] = f20a2ca5, %l4 = 0000000000000000
	ldsb	[%i2+0x03f],%l4		! %l4 = ffffffffffffffa5
!	Mem[0000000030141400] = 00000000, %l3 = ffffffffffffffff
	lduha	[%i5+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041434] = 00ffff00, %l6 = 00000000ff000000
	lduba	[%i1+0x036]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101414] = ffffff01, %f2  = 01ffffff
	lda	[%i4+0x014]%asi,%f2 	! %f2 = ffffff01
!	Mem[0000000030081408] = 201d0000ff010000, %l7 = 00000000000001ff
	ldxa	[%i2+%o4]0x81,%l7	! %l7 = 201d0000ff010000
!	Mem[00000000201c0000] = 99ac4c08, %l5 = 0000000000001d9f
	lduba	[%o0+0x001]%asi,%l5	! %l5 = 00000000000000ac
!	Mem[00000000211c0000] = ff0085d2, %l2 = 0000000000000000
	ldsh	[%o2+%g0],%l2		! %l2 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%l4 = ffffffa5, %l5 = 000000ac, Mem[0000000010041410] = 00000000 ffffffff
	stda	%l4,[%i1+0x010]%asi	! Mem[0000000010041410] = ffffffa5 000000ac

p0_label_378:
!	%l4 = ffffffffffffffa5, Mem[00000000300c1400] = ff000000
	stwa	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffa5
!	%l5 = 00000000000000ac, Mem[0000000010081401] = ff000000
	stb	%l5,[%i2+0x001]		! Mem[0000000010081400] = ffac0000
!	%l1 = 43bb418864b753d2, %l7 = 201d0000ff010000, %y  = 1260e78f
	sdiv	%l1,%l7,%l0		! %l0 = ffffffff80000000
	mov	%l0,%y			! %y = 80000000
!	Mem[0000000010101400] = 00000000, %l1 = 43bb418864b753d2
	ldstuba	[%i4+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041400] = 00ff0049, %l5 = 00000000000000ac
	swapa	[%i1+%g0]0x80,%l5	! %l5 = 0000000000ff0049
!	Mem[000000001004141c] = 00000000, %l0 = ffffffff80000000
	ldstub	[%i1+0x01c],%l0		! %l0 = 00000000000000ff
!	Mem[000000001014141c] = a52ce06d, %l3 = 0000000000000000
	ldstuba	[%i5+0x01c]%asi,%l3	! %l3 = 000000a5000000ff
!	%f27 = ffffffff, %f8  = ff0000ff 0000004b
	fstod	%f27,%f8 		! %f8  = ffffffff e0000000
!	%l6 = 000000ff, %l7 = ff010000, Mem[0000000010001408] = 203504f3 ff000000
	std	%l6,[%i0+%o4]		! Mem[0000000010001408] = 000000ff ff010000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff0000000000ff52, %l0 = 0000000000000000
	ldxa	[%i4+%o4]0x88,%l0	! %l0 = ff0000000000ff52

p0_label_379:
!	Mem[0000000010041408] = ff000000, %l1 = 0000000000000000
	ldswa	[%i1+%o4]0x80,%l1	! %l1 = ffffffffff000000
!	Mem[0000000010101410] = ffffffff, %f19 = 0000004b
	lda	[%i4+%o5]0x80,%f19	! %f19 = ffffffff
!	Mem[0000000010001438] = 00000000 00000000, %l2 = ffffff00, %l3 = 000000a5
	ldda	[%i0+0x038]%asi,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000030081400] = ff000000, %l2 = 0000000000000000
	ldswa	[%i2+%g0]0x89,%l2	! %l2 = ffffffffff000000
!	Mem[0000000020800000] = ffffba64, %l2 = ffffffffff000000
	ldsh	[%o1+%g0],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010081408] = 00000000, %l4 = ffffffffffffffa5
	ldsw	[%i2+%o4],%l4		! %l4 = 0000000000000000
!	Mem[0000000010081400] = ffac0000, %f0  = 00000000
	lda	[%i2+%g0]0x80,%f0 	! %f0 = ffac0000
!	%f14 = ffffffff 00000000, Mem[0000000010041410] = ffffffa5 000000ac
	std	%f14,[%i1+%o5]	! Mem[0000000010041410] = ffffffff 00000000
!	Mem[0000000030041408] = ffffffff, %l3 = 0000000000000000
	ldsha	[%i1+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 00ff0049, Mem[0000000030181410] = 7e60bfff 00000001
	stda	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000 00ff0049

p0_label_380:
!	%l2 = ffffffff, %l3 = ffffffff, Mem[0000000030041410] = 00000000 00006633
	stda	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = ffffffff ffffffff
!	%f14 = ffffffff 00000000, Mem[0000000010181408] = ff0000ff 0000004b
	std	%f14,[%i6+%o4]	! Mem[0000000010181408] = ffffffff 00000000
!	Mem[0000000010141428] = 0000000000000000, %l2 = ffffffffffffffff, %l2 = ffffffffffffffff
	add	%i5,0x28,%g1
	casxa	[%g1]0x80,%l2,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[00000000100c1408] = ff000000000000ff
	stxa	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000000000000000
!	Mem[0000000030041410] = ffffffff, %l0 = ff0000000000ff52
	swapa	[%i1+%o5]0x81,%l0	! %l0 = 00000000ffffffff
!	Mem[000000001000143c] = 00000000, %l0 = 00000000ffffffff
	ldstub	[%i0+0x03c],%l0		! %l0 = 00000000000000ff
!	%l2 = 00000000, %l3 = ffffffff, Mem[0000000010081400] = 0000acff ffffffff
	stda	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000 ffffffff
!	%f2  = ffffff01, Mem[0000000010181410] = 00000000
	st	%f2 ,[%i6+%o5]		! Mem[0000000010181410] = ffffff01
!	Mem[0000000010181408] = ffffffff, %l3 = ffffffffffffffff
	ldstuba	[%i6+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 00000000, %l1 = ffffffffff000000
	lduwa	[%i6+%o5]0x81,%l1	! %l1 = 0000000000000000

p0_label_381:
!	Mem[0000000010041400] = ac000000, %l2 = 0000000000000000
	lduha	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = 9607000000000000, %f16 = ffffffff 7c0efb7c
	ldda	[%i4+%o4]0x89,%f16	! %f16 = 96070000 00000000
!	Mem[0000000030101410] = 00ffdd20000075ff, %l5 = 0000000000ff0049
	ldxa	[%i4+%o5]0x81,%l5	! %l5 = 00ffdd20000075ff
!	%f2  = ffffff01, %f28 = 00000048
	fcmpes	%fcc3,%f2 ,%f28		! %fcc3 = 3
!	Mem[0000000010181408] = ffffffff, %l7 = 201d0000ff010000
	ldsha	[%i6+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000211c0000] = ff0085d2, %l6 = 00000000000000ff
	lduha	[%o2+0x000]%asi,%l6	! %l6 = 000000000000ff00
!	Mem[0000000010081410] = 0000ff00, %l3 = 00000000000000ff
	ldswa	[%i2+0x010]%asi,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010101438] = 0000ff00, %l5 = 00ffdd20000075ff
	lduw	[%i4+0x038],%l5		! %l5 = 000000000000ff00
!	Mem[0000000010001408] = 000001ffff000000, %f22 = 00000000 ffffffff
	ldda	[%i0+%o4]0x88,%f22	! %f22 = 000001ff ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181424] = 0000803f, %l2 = 0000000000000000
	swap	[%i6+0x024],%l2		! %l2 = 000000000000803f

p0_label_382:
!	Mem[0000000010001400] = ffff0000000001ff, %l1 = 0000000000000000, %l2 = 000000000000803f
	casxa	[%i0]0x80,%l1,%l2	! %l2 = ffff0000000001ff
!	Mem[00000000100c1408] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%f26 = 000000ff, Mem[0000000030001400] = 00000000
	sta	%f26,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000ff
!	%l6 = 000000000000ff00, Mem[0000000030141410] = ff65dd20
	stha	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = ff00dd20
!	%f6  = a52c0af2, Mem[0000000010001400] = ffff0000
	sta	%f6 ,[%i0+%g0]0x80	! Mem[0000000010001400] = a52c0af2
!	Mem[0000000010081410] = 00ff0000, %l2 = ffff0000000001ff
	ldstuba	[%i2+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041400] = ff00ffff, %l2 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l2	! %l2 = 00000000ff00ffff
!	Mem[00000000218000c0] = ffff4ce8, %l0 = 0000000000000000
	ldstub	[%o3+0x0c0],%l0		! %l0 = 000000ff000000ff
!	Mem[0000000030101400] = ffff0000, %l4 = 0000000000000000
	swapa	[%i4+%g0]0x89,%l4	! %l4 = 00000000ffff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000000 ffffffff, %l6 = 0000ff00, %l7 = ffffffff
	ldd	[%i2+%g0],%l6		! %l6 = 0000000000000000 00000000ffffffff

p0_label_383:
!	Mem[0000000030101410] = 20ddff00, %l7 = 00000000ffffffff
	lduba	[%i4+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = 000000ff, %l0 = 00000000000000ff
	ldswa	[%i6+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141418] = 7c0efb7c, %l0 = 00000000000000ff
	lduwa	[%i5+0x018]%asi,%l0	! %l0 = 000000007c0efb7c
!	Mem[0000000030081400] = ff000000, %l5 = 000000000000ff00
	lduba	[%i2+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001400] = a52c0af2, %l0 = 000000007c0efb7c
	lduwa	[%i0+%g0]0x80,%l0	! %l0 = 00000000a52c0af2
!	Mem[0000000010081410] = ff00ff00 4900ff00, %l6 = 00000000, %l7 = 00000000
	ldda	[%i2+%o5]0x80,%l6	! %l6 = 00000000ff00ff00 000000004900ff00
!	Mem[0000000030181410] = 00000000 4900ff00, %l0 = a52c0af2, %l1 = 00000000
	ldda	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000000 000000004900ff00
!	Mem[00000000300c1408] = ff000000 ffffffff, %l4 = ffff0000, %l5 = 00000000
	ldda	[%i3+%o4]0x89,%l4	! %l4 = 00000000ffffffff 00000000ff000000
!	Mem[0000000030181408] = ff0499ac, %l0 = 0000000000000000
	ldsha	[%i6+%o4]0x81,%l0	! %l0 = ffffffffffffff04
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 00000000, %l6 = 00000000ff00ff00
	ldstuba	[%i5+%g0]0x89,%l6	! %l6 = 00000000000000ff

p0_label_384:
!	Mem[0000000010101434] = a7ff0000, %l1 = 000000004900ff00
	swap	[%i4+0x034],%l1		! %l1 = 00000000a7ff0000
!	%l4 = 00000000ffffffff, Mem[0000000030141410] = ac99044820dd00ff
	stxa	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000ffffffff
!	%l2 = 00000000ff00ffff, Mem[0000000030141400] = 000000ff
	stba	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff
!	Mem[00000000100c1401] = ffbfffe0, %l6 = 0000000000000000
	ldstuba	[%i3+0x001]%asi,%l6	! %l6 = 000000bf000000ff
!	%l2 = 00000000ff00ffff, Mem[0000000010181410] = 01ffffff
	stha	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 01ffffff
!	%f25 = 00000000, Mem[00000000300c1408] = ffffffff
	sta	%f25,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	Mem[00000000100c1400] = ffffffe0, %l1 = a7ff0000, %l3 = 0000ff00
	casa	[%i3]0x80,%l1,%l3	! %l3 = 00000000ffffffe0
!	%l6 = 000000bf, %l7 = 4900ff00, Mem[0000000010041410] = ffffffff 00000000
	stda	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000bf 4900ff00
!	Mem[0000000030101410] = 00ffdd20, %l4 = 00000000ffffffff
	swapa	[%i4+%o5]0x81,%l4	! %l4 = 0000000000ffdd20
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff000000ffffffff, %l1 = 00000000a7ff0000
	ldx	[%i4+%g0],%l1		! %l1 = ff000000ffffffff

p0_label_385:
!	Mem[0000000010081408] = 00000000, %f9  = e0000000
	lda	[%i2+%o4]0x80,%f9 	! %f9 = 00000000
!	Mem[0000000010041408] = 000000ff, %l1 = ff000000ffffffff
	lduba	[%i1+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081414] = 4900ff00, %l2 = 00000000ff00ffff
	ldsb	[%i2+0x017],%l2		! %l2 = 0000000000000000
!	Mem[0000000030141400] = ff00000000270000, %f26 = 000000ff ffffffff
	ldda	[%i5+%g0]0x81,%f26	! %f26 = ff000000 00270000
!	Mem[00000000100c1408] = ff000000, %f0  = ffac0000
	lda	[%i3+%o4]0x80,%f0 	! %f0 = ff000000
!	Mem[0000000010001400] = f20a2ca5, %l5 = 00000000ff000000
	ldswa	[%i0+%g0]0x88,%l5	! %l5 = fffffffff20a2ca5
!	Mem[0000000030041408] = ffffffff, %l3 = 00000000ffffffe0
	lduba	[%i1+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141400] = 000000ff, %f29 = a675a8b0
	lda	[%i5+%g0]0x88,%f29	! %f29 = 000000ff
!	Mem[0000000010181408] = 00000000ffffffff, %f30 = c193a4ff c193a4ff
	ldda	[%i6+%o4]0x88,%f30	! %f30 = 00000000 ffffffff
!	Starting 10 instruction Store Burst
!	%l6 = 000000bf, %l7 = 4900ff00, Mem[0000000010081408] = 00000000 ff000000
	stda	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000bf 4900ff00

p0_label_386:
!	%l4 = 00ffdd20, %l5 = f20a2ca5, Mem[00000000100c1400] = e0ffffff 9f65dd20
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00ffdd20 f20a2ca5
!	Mem[0000000030141408] = 000000ff, %l6 = 00000000000000bf
	ldstuba	[%i5+%o4]0x89,%l6	! %l6 = 000000ff000000ff
!	%l0 = ffffff04, %l1 = 000000ff, Mem[0000000010081400] = 00000000 ffffffff
	stda	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffff04 000000ff
!	%f14 = ffffffff, Mem[0000000030081400] = ff000000
	sta	%f14,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffff
!	Mem[0000000010101400] = 000000ff, %l1 = 00000000000000ff
	ldstuba	[%i4+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000021800140] = 000005d8, %l4 = 0000000000ffdd20
	ldstub	[%o3+0x140],%l4		! %l4 = 00000000000000ff
!	Mem[0000000020800040] = 00ffc1d1, %l7 = 000000004900ff00
	ldstuba	[%o1+0x040]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101408] = 0000ff52, %l1 = 00000000000000ff
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 000000000000ff52
!	%l5 = fffffffff20a2ca5, Mem[00000000100c1424] = 00000000
	stw	%l5,[%i3+0x024]		! Mem[00000000100c1424] = f20a2ca5
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff000000000000ff, %f6  = a52c0af2 ffffffff
	ldd	[%i4+%o4],%f6 		! %f6  = ff000000 000000ff

p0_label_387:
!	Mem[0000000010181410] = ffffff0100000000, %l2 = 0000000000000000
	ldxa	[%i6+%o5]0x80,%l2	! %l2 = ffffff0100000000
!	Mem[0000000010101408] = ff000000 000000ff, %l0 = ffffff04, %l1 = 0000ff52
	ldda	[%i4+%o4]0x80,%l0	! %l0 = 00000000ff000000 00000000000000ff
!	Mem[0000000010181408] = ffffffff00000000, %l7 = 0000000000000000
	ldxa	[%i6+%o4]0x80,%l7	! %l7 = ffffffff00000000
!	Mem[0000000030181408] = ff0499ac8099d234, %f0  = ff000000 ffffffff
	ldda	[%i6+%o4]0x81,%f0 	! %f0  = ff0499ac 8099d234
!	Mem[0000000030041408] = ffffffff, %l2 = ffffff0100000000
	lduwa	[%i1+%o4]0x89,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000010101410] = ffffffff, %l3 = 00000000000000ff
	ldswa	[%i4+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000201c0000] = 99ac4c08, %l2 = 00000000ffffffff
	ldsh	[%o0+%g0],%l2		! %l2 = ffffffffffff99ac
!	Mem[0000000010081410] = 00ff00ff, %l4 = 0000000000000000
	lduba	[%i2+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030181400] = 9f000000, %l4 = 00000000000000ff
	lduwa	[%i6+%g0]0x81,%l4	! %l4 = 000000009f000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 00ff00ff, %l6 = 00000000000000ff
	swapa	[%i2+%o5]0x88,%l6	! %l6 = 0000000000ff00ff

p0_label_388:
!	%l7 = ffffffff00000000, %l3 = ffffffffffffffff, %l5 = fffffffff20a2ca5
	xor	%l7,%l3,%l5		! %l5 = 00000000ffffffff
!	Mem[0000000010081410] = 000000ff, %l1 = 00000000000000ff
	swapa	[%i2+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[0000000010181400] = ff000000
	stha	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = 00ff0000
!	%l4 = 000000009f000000, Mem[0000000030081410] = 0000004b
	stha	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	Mem[0000000010081400] = 04ffffff, %l2 = ffffffffffff99ac
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 0000000004ffffff
!	%l4 = 000000009f000000, Mem[0000000030101400] = 00000000
	stwa	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 9f000000
!	%l6 = 0000000000ff00ff, Mem[00000000300c1400] = a5ffffff
	stba	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = a5ffffff
!	%f6  = ff000000 000000ff, %l1 = 00000000000000ff
!	Mem[0000000030001418] = ffffffffffffff00
	add	%i0,0x018,%g1
	stda	%f6,[%g1+%l1]ASI_PST32_S ! Mem[0000000030001418] = ff000000000000ff
!	%l3 = ffffffffffffffff, Mem[00000000100c1410] = c193a4ff
	stha	%l3,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffffa4ff
!	Starting 10 instruction Load Burst
!	Code Fragment 4
p0_fragment_33:
!	%l0 = 00000000ff000000
	setx	0x733f1550533acb02,%g7,%l0 ! %l0 = 733f1550533acb02
!	%l1 = 00000000000000ff
	setx	0x0e2506f7e2aa3411,%g7,%l1 ! %l1 = 0e2506f7e2aa3411
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 733f1550533acb02
	setx	0x71e6d2a808787a9c,%g7,%l0 ! %l0 = 71e6d2a808787a9c
!	%l1 = 0e2506f7e2aa3411
	setx	0xdd8c8a003e04cc3f,%g7,%l1 ! %l1 = dd8c8a003e04cc3f

p0_label_389:
!	Mem[0000000010001408] = 000001ffff000000, %f26 = ff000000 00270000
	ldda	[%i0+%o4]0x88,%f26	! %f26 = 000001ff ff000000
!	Mem[0000000010001428] = ffbf607e, %l2 = 0000000004ffffff
	lduba	[%i0+0x028]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101408] = ff000000, %l6 = 0000000000ff00ff
	ldswa	[%i4+%o4]0x80,%l6	! %l6 = ffffffffff000000
!	Mem[000000001014140c] = 00ff00ff, %f14 = ffffffff
	ld	[%i5+0x00c],%f14	! %f14 = 00ff00ff
!	Code Fragment 4
p0_fragment_34:
!	%l0 = 71e6d2a808787a9c
	setx	0xb0ea6be7f6f78b3c,%g7,%l0 ! %l0 = b0ea6be7f6f78b3c
!	%l1 = dd8c8a003e04cc3f
	setx	0x2ca21e2031dc577b,%g7,%l1 ! %l1 = 2ca21e2031dc577b
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b0ea6be7f6f78b3c
	setx	0xdbc38d6fc29a3e18,%g7,%l0 ! %l0 = dbc38d6fc29a3e18
!	%l1 = 2ca21e2031dc577b
	setx	0x686905707b90c787,%g7,%l1 ! %l1 = 686905707b90c787
!	Mem[0000000010001400] = ff010000f20a2ca5, %f18 = ff0000ff ffffffff
	ldda	[%i0+%g0]0x88,%f18	! %f18 = ff010000 f20a2ca5
!	Mem[0000000010001400] = a52c0af2, %l6 = ffffffffff000000
	lduba	[%i0+0x003]%asi,%l6	! %l6 = 00000000000000f2
!	Mem[0000000030041408] = ffffffff, %l6 = 00000000000000f2
	lduwa	[%i1+%o4]0x89,%l6	! %l6 = 00000000ffffffff
!	%f22 = 000001ff, %f21 = 00000000, %f7  = 000000ff
	fsubs	%f22,%f21,%f7 		! %l0 = dbc38d6fc29a3e3a, Unfinished, %fsr = 3500000800
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffff, Mem[0000000010041400] = ac000000
	stba	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = ac0000ff

p0_label_390:
!	%f16 = 96070000 00000000 ff010000 f20a2ca5
!	%f20 = 00000000 00000000 000001ff ff000000
!	%f24 = 00000000 00000000 000001ff ff000000
!	%f28 = 00000048 000000ff 00000000 ffffffff
	stda	%f16,[%i6]ASI_BLK_S	! Block Store to 0000000030181400
	membar	#Sync			! Added by membar checker (58)
!	Mem[0000000030181410] = 00000000, %l5 = 00000000ffffffff
	swapa	[%i6+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001400] = ff000000, %l5 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l5	! %l5 = 00000000ff000000
!	Mem[0000000021800081] = ffff7b7d, %l7 = ffffffff00000000
	ldstuba	[%o3+0x081]%asi,%l7	! %l7 = 000000ff000000ff
!	%l6 = 00000000ffffffff, Mem[000000001018143a] = 00000000
	sth	%l6,[%i6+0x03a]		! Mem[0000000010181438] = 0000ffff
!	Mem[0000000010041410] = 000000bf, %l7 = 00000000000000ff
	swapa	[%i1+%o5]0x80,%l7	! %l7 = 00000000000000bf
!	Mem[0000000030041400] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i1+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%l0 = dbc38d6fc29a3e3a, Mem[00000000100c1408] = 000000ff
	stba	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000003a
!	Mem[0000000010081400] = ffff99ac, %l6 = 00000000ffffffff
	ldstuba	[%i2+%g0]0x80,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ffffffff01000000, %f0  = ff0499ac 8099d234
	ldda	[%i2+%g0]0x81,%f0 	! %f0  = ffffffff 01000000

p0_label_391:
!	Mem[0000000010081400] = ac99ffff, %l7 = 00000000000000bf
	lduwa	[%i2+%g0]0x88,%l7	! %l7 = 00000000ac99ffff
!	Mem[0000000010181400] = 0000ff00, %l1 = 686905707b90c787
	lduba	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081408] = 000001ff 00001d20, %l4 = 9f000000, %l5 = ff000000
	ldda	[%i2+%o4]0x89,%l4	! %l4 = 0000000000001d20 00000000000001ff
!	Mem[0000000010001408] = ff000000, %l4 = 0000000000001d20
	lduwa	[%i0+%o4]0x88,%l4	! %l4 = 00000000ff000000
!	%l5 = 00000000000001ff, immed = fffff2cc, %y  = 80000000
	sdiv	%l5,-0xd34,%l2		! %l2 = 000000007fffffff
	mov	%l0,%y			! %y = c29a3e3a
!	Mem[0000000030101410] = ff750000 ffffffff, %l4 = ff000000, %l5 = 000001ff
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 00000000ffffffff 00000000ff750000
!	Mem[0000000010141408] = 000000ff, %f5  = 4900ff00
	lda	[%i5+%o4]0x88,%f5 	! %f5 = 000000ff
!	Mem[0000000010141408] = 000000ff, %l6 = 00000000000000ff
	lduwa	[%i5+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081410] = 00ff0049000000ff, %f6  = ff000000 000000ff
	ldda	[%i2+%o5]0x88,%f6 	! %f6  = 00ff0049 000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = ff0085d2, %l0 = dbc38d6fc29a3e3a
	ldstub	[%o2+%g0],%l0		! %l0 = 000000ff000000ff

p0_label_392:
!	%l5 = 00000000ff750000, %l1 = 0000000000000000, %l4 = 00000000ffffffff
	sdivx	%l5,%l1,%l4		! Div by zero, %l0 = 000000000000014f
!	%l5 = 00000000ff750000, Mem[00000000218001c0] = 00ff6949, %asi = 80
	stba	%l5,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 00ff6949
!	%l6 = 00000000000000ff, Mem[000000001004140e] = ff00ff01, %asi = 80
	stha	%l6,[%i1+0x00e]%asi	! Mem[000000001004140c] = ff0000ff
!	%l4 = ffffffff, %l5 = ff750000, Mem[0000000010141420] = ac990448 00000000
	std	%l4,[%i5+0x020]		! Mem[0000000010141420] = ffffffff ff750000
!	%f14 = 00ff00ff 00000000, Mem[0000000010001400] = a52c0af2 000001ff
	stda	%f14,[%i0+0x000]%asi	! Mem[0000000010001400] = 00ff00ff 00000000
!	Mem[0000000030101400] = 0000009f, %l7 = 00000000ac99ffff
	ldstuba	[%i4+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081413] = ff000000, %l2 = 000000007fffffff
	ldstuba	[%i2+0x013]%asi,%l2	! %l2 = 00000000000000ff
!	%l4 = 00000000ffffffff, Mem[0000000030101410] = ffffffff
	stba	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = ffffffff
!	%f30 = 00000000 ffffffff, Mem[0000000010081428] = ffffffff 000000ff
	stda	%f30,[%i2+0x028]%asi	! Mem[0000000010081428] = 00000000 ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101430] = ff0000004900ff00, %l7 = 0000000000000000
	ldxa	[%i4+0x030]%asi,%l7	! %l7 = ff0000004900ff00

p0_label_393:
!	Mem[0000000010001400] = 00000000 ff00ff00, %l2 = 00000000, %l3 = ffffffff
	ldda	[%i0+%g0]0x88,%l2	! %l2 = 00000000ff00ff00 0000000000000000
!	Mem[0000000010001408] = 000000ff, %l5 = 00000000ff750000
	ldsha	[%i0+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[000000001010142c] = ff0efb76, %f7  = 000000ff
	lda	[%i4+0x02c]%asi,%f7 	! %f7 = ff0efb76
!	Mem[0000000010101430] = ff000000 4900ff00, %l4 = ffffffff, %l5 = 00000000
	ldd	[%i4+0x030],%l4		! %l4 = 00000000ff000000 000000004900ff00
!	Mem[0000000010081400] = ffff99ac, %l0 = 0000000000000127
	ldswa	[%i2+%g0]0x80,%l0	! %l0 = ffffffffffff99ac
!	Mem[0000000010041408] = ff000000, %l0 = ffffffffffff99ac
	ldsha	[%i1+%o4]0x80,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010081410] = ff0000ff4900ff00, %f28 = 00000048 000000ff
	ldda	[%i2+%o5]0x80,%f28	! %f28 = ff0000ff 4900ff00
!	Mem[0000000010041408] = ff000000, %l3 = 0000000000000000
	ldsha	[%i1+0x00a]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181410] = ffffff01, %l7 = ff0000004900ff00
	ldsha	[%i6+%o5]0x80,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l5 = 000000004900ff00, Mem[00000000100c1426] = f20a2ca5
	stb	%l5,[%i3+0x026]		! Mem[00000000100c1424] = f20a00a5

p0_label_394:
!	Mem[00000000211c0000] = ff0085d2, %l2 = 00000000ff00ff00
	ldstub	[%o2+%g0],%l2		! %l2 = 000000ff000000ff
!	%f16 = 96070000 00000000 ff010000 f20a2ca5
!	%f20 = 00000000 00000000 000001ff ff000000
!	%f24 = 00000000 00000000 000001ff ff000000
!	%f28 = ff0000ff 4900ff00 00000000 ffffffff
	stda	%f16,[%i0]ASI_BLK_AIUSL	! Block Store to 0000000030001400
!	Mem[0000000030041400] = 000000ff, %l0 = ffffffffffffff00
	ldstuba	[%i1+%g0]0x89,%l0	! %l0 = 000000ff000000ff
!	%f12 = 00000000 0000ffff, %l0 = 00000000000000ff
!	Mem[0000000030101418] = 0e26a88e3d5039e1
	add	%i4,0x018,%g1
	stda	%f12,[%g1+%l0]ASI_PST32_S ! Mem[0000000030101418] = 000000000000ffff
!	%l2 = 000000ff, %l3 = 00000000, Mem[00000000100c1408] = 3a000000 00000000
	stda	%l2,[%i3+0x008]%asi	! Mem[00000000100c1408] = 000000ff 00000000
!	%l0 = 00000000000000ff, Mem[0000000030141400] = 000000ff
	stba	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff
!	%f0  = ffffffff, Mem[00000000100c1414] = c193a4ff
	st	%f0 ,[%i3+0x014]	! Mem[00000000100c1414] = ffffffff
!	%f16 = 96070000 00000000 ff010000 f20a2ca5
!	%f20 = 00000000 00000000 000001ff ff000000
!	%f24 = 00000000 00000000 000001ff ff000000
!	%f28 = ff0000ff 4900ff00 00000000 ffffffff
	stda	%f16,[%i2]ASI_BLK_P	! Block Store to 0000000010081400
!	%f5  = 000000ff, Mem[0000000010081408] = 000001ff
	sta	%f5 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181438] = 0000ffff7e600000, %f12 = 00000000 0000ffff
	ldda	[%i6+0x038]%asi,%f12	! %f12 = 0000ffff 7e600000

p0_label_395:
!	Mem[0000000030041410] = 52ff0000, %l5 = 000000004900ff00
	ldswa	[%i1+%o5]0x89,%l5	! %l5 = 0000000052ff0000
!	Mem[00000000100c1438] = 0000000000000000, %f8  = ffffffff 00000000
	ldda	[%i3+0x038]%asi,%f8 	! %f8  = 00000000 00000000
!	Mem[0000000030081408] = 201d0000, %l3 = 0000000000000000
	lduha	[%i2+%o4]0x81,%l3	! %l3 = 000000000000201d
	membar	#Sync			! Added by membar checker (59)
!	Mem[0000000030001410] = 00000000, %l5 = 0000000052ff0000
	lduba	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101430] = ff000000 4900ff00, %l4 = ff000000, %l5 = 00000000
	ldd	[%i4+0x030],%l4		! %l4 = 00000000ff000000 000000004900ff00
!	Mem[0000000030001400] = 00000000, %l4 = 00000000ff000000
	lduba	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041400] = 000000ff, %l5 = 000000004900ff00
	ldsba	[%i1+%g0]0x89,%l5	! %l5 = ffffffffffffffff
!	%f11 = 00000000, %f21 = 00000000, %f11 = 00000000
	fsubs	%f11,%f21,%f11		! %f11 = 00000000
!	Mem[0000000010001408] = 000000ff, %f18 = ff010000
	lda	[%i0+%o4]0x80,%f18	! %f18 = 000000ff
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000201d, Mem[0000000010181410] = ffffff01
	stha	%l3,[%i6+%o5]0x80	! Mem[0000000010181410] = 201dff01

p0_label_396:
!	%l2 = 00000000000000ff, %l3 = 000000000000201d, %l4 = 0000000000000000
	or	%l2,%l3,%l4		! %l4 = 00000000000020ff
!	%l6 = 00000000000000ff, Mem[0000000021800141] = ff0005d8
	stb	%l6,[%o3+0x141]		! Mem[0000000021800140] = ffff05d8
!	%f12 = 0000ffff, %f21 = 00000000, %f27 = ff000000
	fmuls	%f12,%f21,%f27		! %f27 = 00000000
!	%l5 = ffffffffffffffff, Mem[0000000010001408] = 000000ff
	stw	%l5,[%i0+%o4]		! Mem[0000000010001408] = ffffffff
!	Mem[0000000010081410] = 00000000, %l5 = ffffffffffffffff
	ldstuba	[%i2+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%l3 = 000000000000201d, Mem[0000000010181400] = 00ff0000
	stba	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 1dff0000
!	%l2 = 000000ff, %l3 = 0000201d, Mem[0000000010141420] = ffffffff ff750000
	std	%l2,[%i5+0x020]		! Mem[0000000010141420] = 000000ff 0000201d
!	Mem[0000000010041418] = 00000000ff000000, %l6 = 00000000000000ff, %l7 = ffffffffffffffff
	add	%i1,0x18,%g1
	casxa	[%g1]0x80,%l6,%l7	! %l7 = 00000000ff000000
!	Mem[00000000211c0001] = ff0085d2, %l1 = 0000000000000000
	ldstuba	[%o2+0x001]%asi,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ff00009f 00000000 00000000 00000796
!	Mem[0000000030101410] = ffffffff 000075ff 00000000 0000ffff
!	Mem[0000000030101420] = a77aa217 0fc18655 dd63fba2 f02d8855
!	Mem[0000000030101430] = d7610eb5 918ccb87 76e1320a 7827e7ec
	ldda	[%i4]ASI_BLK_AIUS,%f0	! Block Load from 0000000030101400

p0_label_397:
!	Mem[00000000100c1408] = 000000ff 00000000, %l6 = 000000ff, %l7 = ff000000
	ldda	[%i3+%o4]0x80,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Mem[0000000030141400] = ff000000, %l2 = 00000000000000ff
	ldswa	[%i5+%g0]0x81,%l2	! %l2 = ffffffffff000000
!	Mem[0000000030041410] = 0000ff52ffffffff, %f20 = 00000000 00000000
	ldda	[%i1+%o5]0x81,%f20	! %f20 = 0000ff52 ffffffff
!	Mem[0000000030081400] = ffffffff, %l0 = 00000000000000ff
	ldsha	[%i2+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1410] = ffffa4ff ffffffff, %l0 = ffffffff, %l1 = 00000000
	ldd	[%i3+%o5],%l0		! %l0 = 00000000ffffa4ff 00000000ffffffff
!	Mem[0000000030041410] = 0000ff52ffffffff, %f18 = 000000ff f20a2ca5
	ldda	[%i1+%o5]0x81,%f18	! %f18 = 0000ff52 ffffffff
!	Mem[0000000030041410] = 0000ff52, %l7 = 0000000000000000
	lduwa	[%i1+%o5]0x81,%l7	! %l7 = 000000000000ff52
!	Mem[0000000010101414] = ffffff01, %l0 = 00000000ffffa4ff
	ldsw	[%i4+0x014],%l0		! %l0 = ffffffffffffff01
!	Mem[0000000030141400] = 00002700000000ff, %l3 = 000000000000201d
	ldxa	[%i5+%g0]0x89,%l3	! %l3 = 00002700000000ff
!	Starting 10 instruction Store Burst
!	Code Fragment 3
p0_fragment_35:
!	%l0 = ffffffffffffff01
	setx	0xc86c0fffd10aaa1f,%g7,%l0 ! %l0 = c86c0fffd10aaa1f
!	%l1 = 00000000ffffffff
	setx	0xdfeda4f806325577,%g7,%l1 ! %l1 = dfeda4f806325577
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = c86c0fffd10aaa1f
	setx	0x4424203fb8547b5a,%g7,%l0 ! %l0 = 4424203fb8547b5a
!	%l1 = dfeda4f806325577
	setx	0x81c712185ac11e4d,%g7,%l1 ! %l1 = 81c712185ac11e4d

p0_label_398:
!	%f24 = 00000000 00000000, %l2 = ffffffffff000000
!	Mem[0000000030041420] = 50630000000000ff
	add	%i1,0x020,%g1
	stda	%f24,[%g1+%l2]ASI_PST8_S ! Mem[0000000030041420] = 50630000000000ff
!	%l6 = 00000000000000ff, Mem[0000000010041410] = 000000ff4900ff00
	stxa	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000000000ff
!	%f28 = ff0000ff 4900ff00, %l7 = 000000000000ff52
!	Mem[0000000010181410] = 201dff0100000000
	add	%i6,0x010,%g1
	stda	%f28,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010181410] = 201dff01ff0000ff
!	%f29 = 4900ff00, Mem[0000000030001400] = 00000000
	sta	%f29,[%i0+%g0]0x81	! Mem[0000000030001400] = 4900ff00
!	Mem[00000000201c0000] = 99ac4c08, %l7 = 000000000000ff52
	ldstub	[%o0+%g0],%l7		! %l7 = 00000099000000ff
!	%l3 = 00002700000000ff, Mem[0000000030141400] = 000000ff
	stba	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff
!	Mem[000000001018141c] = ff000000, %l7 = 00000099, %l0 = b8547b5a
	add	%i6,0x1c,%g1
	casa	[%g1]0x80,%l7,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030141400] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010001434] = ffffffc2, %l5 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x034]%asi,%l5	! %l5 = 00000000ffffffc2
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00001d20, %l2 = ffffffffff000000
	ldswa	[%i2+%o4]0x89,%l2	! %l2 = 0000000000001d20

p0_label_399:
!	Mem[00000000201c0000] = ffac4c08, %l7 = 0000000000000099
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = ffffffffffffffac
!	Mem[0000000030001408] = f20a2ca5, %l3 = 00002700000000ff
	ldswa	[%i0+%o4]0x89,%l3	! %l3 = fffffffff20a2ca5
!	Mem[000000001018143c] = 7e600000, %l4 = 00000000000020ff
	ldub	[%i6+0x03d],%l4		! %l4 = 0000000000000060
!	Mem[0000000030041410] = 52ff0000, %l0 = 00000000ff000000
	ldsha	[%i1+%o5]0x89,%l0	! %l0 = 0000000000000000
!	%f23 = ff000000, %f4  = ffffffff, %f22 = 000001ff
	fadds	%f23,%f4 ,%f22		! %f22 = ffffffff
!	Mem[0000000030141410] = 00000000ffffffff, %f18 = 0000ff52 ffffffff
	ldda	[%i5+%o5]0x89,%f18	! %f18 = 00000000 ffffffff
!	Mem[0000000010081400] = 96070000, %l0 = 0000000000000000
	ldsba	[%i2+%g0]0x80,%l0	! %l0 = ffffffffffffff96
!	Mem[0000000010081414] = 00000000, %f13 = 918ccb87
	lda	[%i2+0x014]%asi,%f13	! %f13 = 00000000
!	Mem[0000000010001410] = ff000000, %l5 = 00000000ffffffc2
	lduha	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 000000ff, %l3 = fffffffff20a2ca5
	swapa	[%i5+%g0]0x88,%l3	! %l3 = 00000000000000ff

p0_label_400:
!	%f8  = a77aa217 0fc18655, %l3 = 00000000000000ff
!	Mem[0000000030181408] = ff010000f20a2ca5
	add	%i6,0x008,%g1
	stda	%f8,[%g1+%l3]ASI_PST32_SL ! Mem[0000000030181408] = 5586c10f17a27aa7
!	%f6  = 00000000, %f12 = d7610eb5, %f15 = 7827e7ec
	fadds	%f6 ,%f12,%f15		! %f15 = d7610eb5
!	Mem[0000000010181410] = 01ff1d20, %l1 = 81c712185ac11e4d
	ldstuba	[%i6+%o5]0x88,%l1	! %l1 = 00000020000000ff
!	Mem[000000001008143c] = ffffffff, %l6 = 00000000000000ff, %asi = 80
	swapa	[%i2+0x03c]%asi,%l6	! %l6 = 00000000ffffffff
!	%l6 = ffffffff, %l7 = ffffffac, Mem[0000000030141408] = ff000000 000000ff
	stda	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffffff ffffffac
!	%f25 = 00000000, Mem[0000000010041408] = ff000000
	sta	%f25,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	%l0 = ffffffffffffff96, Mem[0000000010081408] = 000000ff
	stwa	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffff96
!	%f6  = 00000000 0000ffff, Mem[0000000030001408] = a52c0af2 000001ff
	stda	%f6 ,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000 0000ffff
!	%l6 = ffffffff, %l7 = ffffffac, Mem[00000000100c1420] = ac990448 f20a00a5
	stda	%l6,[%i3+0x020]%asi	! Mem[00000000100c1420] = ffffffff ffffffac
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00000796, %l6 = 00000000ffffffff
	ldswa	[%i6+%g0]0x89,%l6	! %l6 = 0000000000000796

p0_label_401:
!	Mem[0000000010081408] = 96fffffff20a2ca5, %f28 = ff0000ff 4900ff00
	ldda	[%i2+%o4]0x80,%f28	! %f28 = 96ffffff f20a2ca5
!	Mem[0000000030181410] = ffffffff, %l2 = 0000000000001d20
	lduba	[%i6+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141408] = ffffffff, %f7  = 0000ffff
	lda	[%i5+%o4]0x81,%f7 	! %f7 = ffffffff
!	Mem[0000000030141408] = ffffffff, %l7 = ffffffffffffffac
	lduwa	[%i5+%o4]0x81,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000010001408] = ffffffff, %l4 = 0000000000000060
	ldswa	[%i0+%o4]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041408] = ff0000ff 00000000, %l2 = 000000ff, %l3 = 000000ff
	ldda	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000000 00000000ff0000ff
!	Mem[0000000030041410] = 0000ff52, %l1 = 0000000000000020
	lduba	[%i1+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1400] = a5ffffff, %l6 = 0000000000000796
	lduba	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001408] = ffffffff, %l1 = 0000000000000000
	ldswa	[%i0+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f20 = 0000ff52 ffffffff, %l2 = 0000000000000000
!	Mem[0000000030141428] = ac99044820dd659f
	add	%i5,0x028,%g1
	stda	%f20,[%g1+%l2]ASI_PST8_S ! Mem[0000000030141428] = ac99044820dd659f

p0_label_402:
!	Mem[0000000010081408] = 96ffffff, %l5 = 0000000000000000, %asi = 80
	swapa	[%i2+0x008]%asi,%l5	! %l5 = 0000000096ffffff
!	Mem[00000000300c1408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i3+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%f20 = 0000ff52 ffffffff, Mem[0000000030181410] = ffffffff 00000000
	stda	%f20,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000ff52 ffffffff
!	%l3 = 00000000ff0000ff, Mem[00000000300c1400] = a5ffffff
	stwa	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = ff0000ff
!	%f26 = 000001ff 00000000, %l3 = 00000000ff0000ff
!	Mem[0000000010001408] = ffffffffff010000
	add	%i0,0x008,%g1
	stda	%f26,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010001408] = 00000000ff010000
!	Mem[0000000030181410] = ffffffff, %l2 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000100c1430] = 00000000, %l4 = ffffffff, %l1 = ffffffff
	add	%i3,0x30,%g1
	casa	[%g1]0x80,%l4,%l1	! %l1 = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000010101408] = 000000ff
	stha	%l1,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	%f14 = 76e1320a, %f19 = ffffffff, %f28 = 96ffffff f20a2ca5
	fsmuld	%f14,%f19,%f28		! %f28 = ffffffff e0000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 000000ff 00000000, %l0 = ffffff96, %l1 = 00000000
	ldda	[%i3+%o4]0x80,%l0	! %l0 = 00000000000000ff 0000000000000000

p0_label_403:
!	Mem[0000000010101400] = ff000000, %l0 = 00000000000000ff
	ldsba	[%i4+%g0]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010041430] = 7c0efb7c 00ffff00, %l0 = ffffffff, %l1 = 00000000
	ldda	[%i1+0x030]%asi,%l0	! %l0 = 000000007c0efb7c 0000000000ffff00
!	Mem[0000000010141400] = a52c0af2, %l6 = 00000000000000ff
	ldsha	[%i5+%g0]0x80,%l6	! %l6 = ffffffffffffa52c
!	Mem[00000000100c1404] = a52c0af2, %l6 = ffffffffffffa52c
	lduba	[%i3+0x005]%asi,%l6	! %l6 = 000000000000002c
!	Mem[0000000010041408] = 00000000, %l1 = 0000000000ffff00
	ldswa	[%i1+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = ff000000, %l0 = 000000007c0efb7c
	lduba	[%i5+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001400] = 4900ff0000000796, %l3 = 00000000ff0000ff
	ldxa	[%i0+%g0]0x81,%l3	! %l3 = 4900ff0000000796
!	Mem[0000000010041414] = 000000ff, %l1 = 0000000000000000
	lduba	[%i1+0x015]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081400] = ffffffff, %l6 = 000000000000002c
	lduwa	[%i2+%g0]0x89,%l6	! %l6 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 00000796, %l5 = 0000000096ffffff
	swapa	[%i6+%g0]0x89,%l5	! %l5 = 0000000000000796

p0_label_404:
!	Mem[00000000300c1408] = ff000000, %l7 = 00000000ffffffff
	swapa	[%i3+%o4]0x81,%l7	! %l7 = 00000000ff000000
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000030141400] = ff000000 00270000
	stda	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000ff 00000000
!	%l0 = 00000000000000ff, Mem[0000000030041410] = 0000ff52
	stwa	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000ff
!	Mem[0000000030041408] = ffffffff, %l0 = 00000000000000ff
	ldstuba	[%i1+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[0000000021800100] = 00ff8676, %asi = 80
	stba	%l2,[%o3+0x100]%asi	! Mem[0000000021800100] = ffff8676
!	%l1 = 0000000000000000, Mem[0000000030001400] = 4900ff00
	stha	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000ff00
!	Mem[0000000010001400] = 00ff00ff, %l2 = 00000000000000ff
	swapa	[%i0+%g0]0x80,%l2	! %l2 = 0000000000ff00ff
!	%l4 = ffffffffffffffff, Mem[0000000010101410] = ffffffff
	stba	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffffff
!	%f14 = 76e1320a d7610eb5, %l7 = 00000000ff000000
!	Mem[00000000100c1438] = 0000000000000000
	add	%i3,0x038,%g1
	stda	%f14,[%g1+%l7]ASI_PST32_P ! Mem[00000000100c1438] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00000000 817d0600, %l2 = 00ff00ff, %l3 = 00000796
	ldda	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000 00000000817d0600

p0_label_405:
!	Mem[0000000010181420] = 00583e7e, %f28 = ffffffff
	lda	[%i6+0x020]%asi,%f28	! %f28 = 00583e7e
!	Mem[0000000030041400] = 000000ff, %f6  = 00000000
	lda	[%i1+%g0]0x89,%f6 	! %f6 = 000000ff
!	Mem[0000000010081408] = 00000000, %l3 = 00000000817d0600
	lduha	[%i2+%o4]0x80,%l3	! %l3 = 0000000000000000
!	%l6 = 00000000ffffffff, immed = fffff5d0, %y  = c29a3e3a
	smul	%l6,-0xa30,%l2		! %l2 = 0000000000000a30, %y = 00000000
!	Mem[0000000030041408] = ffffffff, %l7 = 00000000ff000000
	ldswa	[%i1+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181400] = 1dff0000 0000607e, %l6 = ffffffff, %l7 = ffffffff
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 000000001dff0000 000000000000607e
!	Mem[0000000010041400] = 00000000 ac0000ff, %l6 = 1dff0000, %l7 = 0000607e
	ldda	[%i1+%g0]0x88,%l6	! %l6 = 00000000ac0000ff 0000000000000000
!	Mem[0000000010101408] = 00000000, %l0 = 00000000000000ff
	lduba	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	%l6 = 00000000ac0000ff, immed = fffff8d0, %y  = 00000000
	udiv	%l6,-0x730,%l4		! %l4 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010141410] = 00000000
	stha	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000

p0_label_406:
!	%l1 = 0000000000000000, imm = fffffffffffff38d, %l7 = 0000000000000000
	xor	%l1,-0xc73,%l7		! %l7 = fffffffffffff38d
!	Mem[0000000010041408] = 00000000, %l2 = 0000000000000a30
	swapa	[%i1+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[000000001018143c] = 7e600000, %l3 = 0000000000000000, %asi = 80
	swapa	[%i6+0x03c]%asi,%l3	! %l3 = 000000007e600000
!	Mem[0000000010081408] = 00000000, %l3 = 000000007e600000
	swapa	[%i2+%o4]0x80,%l3	! %l3 = 0000000000000000
!	%l4 = 0000000000000000, Mem[00000000201c0000] = ffac4c08
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 00004c08
!	%l6 = 00000000ac0000ff, Mem[0000000030141408] = ffffffff
	stha	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 00ffffff
!	Mem[0000000010101408] = 00000000, %l3 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l3	! %l3 = 0000000000000000
!	%f24 = 00000000 00000000, %l5 = 0000000000000796
!	Mem[0000000030001438] = ffffffff00000000
	add	%i0,0x038,%g1
	stda	%f24,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030001438] = ffffffff00000000
!	%l4 = 0000000000000000, Mem[0000000010141410] = 00000000
	stha	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ffffffff, %l0 = 0000000000000000
	lduba	[%i3+%o4]0x81,%l0	! %l0 = 00000000000000ff

p0_label_407:
!	Mem[0000000020800040] = ffffc1d1, %l5 = 0000000000000796
	lduha	[%o1+0x040]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010101410] = ffffffff, %l3 = 0000000000000000
	lduwa	[%i4+%o5]0x88,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000010101410] = ffffffff, %l0 = 00000000000000ff
	ldsw	[%i4+%o5],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010001400] = 000000ff 00000000, %l0 = ffffffff, %l1 = 00000000
	ldda	[%i0+%g0]0x80,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[0000000010001400] = 000000ff, %l6 = 00000000ac0000ff
	lduha	[%i0+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141420] = 000000ff 0000201d, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i5+0x020]%asi,%l0	! %l0 = 00000000000000ff 000000000000201d
!	Mem[0000000030081408] = 000001ff00001d20, %f22 = ffffffff ff000000
	ldda	[%i2+%o4]0x89,%f22	! %f22 = 000001ff 00001d20
!	Mem[0000000010001400] = 000000ff00000000, %l3 = 00000000ffffffff
	ldxa	[%i0+%g0]0x80,%l3	! %l3 = 000000ff00000000
!	Mem[0000000030141408] = ffffff00, %l2 = 0000000000000000
	lduha	[%i5+%o4]0x89,%l2	! %l2 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%f22 = 000001ff, %f11 = f02d8855
	fcmpes	%fcc3,%f22,%f11		! %fcc3 = 2

p0_label_408:
!	%f24 = 00000000 00000000, Mem[00000000100c1410] = ffa4ffff ffffffff
	stda	%f24,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000 00000000
!	%f10 = dd63fba2, Mem[00000000300c1408] = ffffffff
	sta	%f10,[%i3+%o4]0x81	! Mem[00000000300c1408] = dd63fba2
!	%f28 = 00583e7e, Mem[0000000010181410] = 01ff1dff
	sta	%f28,[%i6+%o5]0x88	! Mem[0000000010181410] = 00583e7e
!	Mem[0000000010041408] = 00000a30, %l6 = 0000000000000000
	ldstuba	[%i1+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	%l6 = 00000000, %l7 = fffff38d, Mem[0000000010101408] = 00000000 000000ff
	stda	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000 fffff38d
!	Mem[0000000010181404] = 0000607e, %l6 = 0000000000000000, %asi = 80
	swapa	[%i6+0x004]%asi,%l6	! %l6 = 000000000000607e
!	%l0 = 000000ff, %l1 = 0000201d, Mem[0000000010041400] = ff0000ac 00000000
	stda	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff 0000201d
!	%l2 = 0000ff00, %l3 = 00000000, Mem[0000000010141408] = ff000000 00ff00ff
	stda	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000ff00 00000000
!	Mem[0000000030141400] = ff000000, %l2 = 000000000000ff00
	ldstuba	[%i5+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 0000ff00, %l7 = fffffffffffff38d
	ldsha	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000000

p0_label_409:
!	Mem[0000000030041400] = 00000000000000ff, %f26 = 000001ff 00000000
	ldda	[%i1+%g0]0x89,%f26	! %f26 = 00000000 000000ff
!	Mem[0000000010001400] = ff000000, %l5 = 000000000000ffff
	ldsba	[%i0+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181418] = 00000000ff000000, %l7 = 0000000000000000
	ldxa	[%i6+0x018]%asi,%l7	! %l7 = 00000000ff000000
!	Mem[0000000030081400] = ffffffff, %l2 = 0000000000000000
	lduba	[%i2+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101408] = 00000000, %l7 = 00000000ff000000
	ldswa	[%i4+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101438] = 0000ff00, %l3 = 000000ff00000000
	lduba	[%i4+0x039]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041400] = ff000000, %l2 = 00000000000000ff
	ldsha	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l7 = 0000000000000000
	ldsba	[%i1+0x013]%asi,%l7	! %l7 = 0000000000000000
	membar	#Sync			! Added by membar checker (60)
!	Mem[0000000030001400] = 0000ff00 00000796 00000000 0000ffff
!	Mem[0000000030001410] = 00000000 00000000 000000ff ff010000
!	Mem[0000000030001420] = 00000000 00000000 000000ff ff010000
!	Mem[0000000030001430] = 00ff0049 ff0000ff ffffffff 00000000
	ldda	[%i0]ASI_BLK_S,%f0	! Block Load from 0000000030001400
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010181400] = 000000000000ff1d
	stxa	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000000000000000

p0_label_410:
	membar	#Sync			! Added by membar checker (61)
!	%f17 = 00000000, Mem[0000000030001410] = 00000000
	sta	%f17,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	%f21 = ffffffff, %f13 = ff0000ff, %f13 = ff0000ff
	fsubs	%f21,%f13,%f13		! %f13 = ffffffff
!	%f28 = 00583e7e, %f7  = ff010000
	fcmpes	%fcc2,%f28,%f7 		! %fcc2 = 2
!	Mem[0000000010041400] = ff000000, %l5 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030181410] = ffffffff, %l4 = 0000000000000000
	swapa	[%i6+%o5]0x89,%l4	! %l4 = 00000000ffffffff
!	%f6  = 000000ff, Mem[0000000010001410] = 000000ff
	sta	%f6 ,[%i0+0x010]%asi	! Mem[0000000010001410] = 000000ff
!	%l4 = 00000000ffffffff, immed = fffffc5d, %y  = 00000000
	sdiv	%l4,-0x3a3,%l0		! %l0 = ffffffffffb99b5d
	mov	%l0,%y			! %y = ffb99b5d
!	%l2 = 0000000000000000, Mem[000000001008140a] = 7e600000, %asi = 80
	stba	%l2,[%i2+0x00a]%asi	! Mem[0000000010081408] = 7e600000
!	%f30 = 00000000 ffffffff, Mem[0000000010101408] = 00000000 fffff38d
	stda	%f30,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000 ffffffff
!	Starting 10 instruction Load Burst
!	Mem[000000001018140c] = 00000000, %l6 = 000000000000607e
	ldsw	[%i6+0x00c],%l6		! %l6 = 0000000000000000

p0_label_411:
!	Mem[0000000030181400] = 96ffffff, %l7 = 0000000000000000
	ldsba	[%i6+%g0]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000218001c0] = 00ff6949, %l6 = 0000000000000000
	ldsha	[%o3+0x1c0]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001410] = 00000000, %l6 = 00000000000000ff
	ldsba	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = f20a2ca5, %l7 = ffffffffffffffff
	lduwa	[%i5+%g0]0x88,%l7	! %l7 = 00000000f20a2ca5
!	Mem[0000000030041410] = 000000ff, %l6 = 0000000000000000
	ldsba	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = 96070000, %l3 = 0000000000000000
	ldswa	[%i2+%g0]0x80,%l3	! %l3 = ffffffff96070000
!	Mem[0000000030081400] = ffffffff 01000000 201d0000 ff010000
!	Mem[0000000030081410] = 00000000 ffffffff ff750000 00006350
!	Mem[0000000030081420] = 00000049 ff010000 ff000000 7e60bfff
!	Mem[0000000030081430] = 00000000 ff000001 76e1320a 7827e7ec
	ldda	[%i2]ASI_BLK_SL,%f0	! Block Load from 0000000030081400
!	Mem[00000000300c1408] = a2fb63dd, %l5 = 00000000ff000000
	lduwa	[%i3+%o4]0x89,%l5	! %l5 = 00000000a2fb63dd
!	Mem[0000000010141410] = 00000000817d0600, %l2 = 0000000000000000
	ldxa	[%i5+0x010]%asi,%l2	! %l2 = 00000000817d0600
!	Starting 10 instruction Store Burst
!	%l3 = ffffffff96070000, Mem[0000000010081400] = 9607000000000000
	stxa	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffffff96070000

p0_label_412:
!	%f30 = 00000000 ffffffff, Mem[0000000030181410] = 00000000 0000ff52
	stda	%f30,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000 ffffffff
!	%l5 = 00000000a2fb63dd, Mem[0000000010081410] = 00000000000000ff
	stxa	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000a2fb63dd
!	%f19 = ffffffff, Mem[0000000010081410] = dd63fba2
	st	%f19,[%i2+%o5]		! Mem[0000000010081410] = ffffffff
!	%l4 = ffffffff, %l5 = a2fb63dd, Mem[0000000010101408] = 00000000 ffffffff
	stda	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = ffffffff a2fb63dd
!	Mem[0000000010001408] = 00000000, %l7 = 00000000f20a2ca5
	ldstuba	[%i0+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%l0 = ffffffffffb99b5d, immed = fffffded, %y  = ffb99b5d
	smul	%l0,-0x213,%l0		! %l0 = 000000009202be19, %y = 00000000
!	%l0 = 9202be19, %l1 = 0000201d, Mem[0000000010101400] = ff000000 ffffffff
	std	%l0,[%i4+%g0]		! Mem[0000000010101400] = 9202be19 0000201d
!	Mem[0000000010181408] = ffffffff, %l4 = 00000000ffffffff
	ldstuba	[%i6+%o4]0x88,%l4	! %l4 = 000000ff000000ff
!	%l3 = ffffffff96070000, Mem[00000000300c1408] = dd63fba2
	stba	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0063fba2
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 000001ff00001d20, %f22 = 000001ff 00001d20
	ldda	[%i2+%o4]0x89,%f22	! %f22 = 000001ff 00001d20

p0_label_413:
!	Mem[0000000030001408] = 00000000, %f29 = e0000000
	lda	[%i0+%o4]0x89,%f29	! %f29 = 00000000
!	Mem[00000000300c1408] = 0063fba2, %l3 = ffffffff96070000
	lduha	[%i3+%o4]0x81,%l3	! %l3 = 0000000000000063
!	%l2 = 00000000817d0600, %l1 = 000000000000201d, %l5 = 00000000a2fb63dd
	and	%l2,%l1,%l5		! %l5 = 0000000000000000
!	Mem[0000000030001410] = 00000000 00000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i0+%o5]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010001400] = 000000ff 00000000, %l0 = 9202be19, %l1 = 0000201d
	ldda	[%i0+%g0]0x80,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[0000000010141408] = 0000000000ff0000, %f28 = 00583e7e 00000000
	ldda	[%i5+%o4]0x88,%f28	! %f28 = 00000000 00ff0000
!	Mem[00000000300c1408] = 0063fba2, %l4 = 0000000000000000
	ldsba	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181410] = ffffffff, %l2 = 00000000817d0600
	lduwa	[%i6+%o5]0x89,%l2	! %l2 = 00000000ffffffff
!	Mem[00000000211c0000] = ffff85d2, %l4 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l4	! %l4 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000063, Mem[0000000030181400] = 96ffffff
	stba	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 96ffff63

p0_label_414:
!	Mem[00000000100c1408] = ff000000, %l0 = 00000000000000ff
	ldstuba	[%i3+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001410] = 000000ff00000000, %l0 = 0000000000000000, %l3 = 0000000000000063
	add	%i0,0x10,%g1
	casxa	[%g1]0x80,%l0,%l3	! %l3 = 000000ff00000000
	membar	#Sync			! Added by membar checker (62)
!	%l7 = 0000000000000000, Mem[0000000030081400] = 00000001ffffffff
	stxa	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000000000000000
!	Mem[0000000030041410] = 000000ff, %l3 = 000000ff00000000
	ldstuba	[%i1+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1400] = 00ffdd20, %l6 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l6	! %l6 = 00000020000000ff
!	Mem[0000000030181410] = ffffffff, %l6 = 0000000000000020
	ldstuba	[%i6+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010141410] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i5+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141408] = 0000ff00, %l3 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l3	! %l3 = 000000000000ff00
!	%l6 = 00000000000000ff, Mem[0000000030181410] = 00000000ffffffff
	stxa	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 0000ff00, %l0 = 0000000000000000
	lduba	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000000

p0_label_415:
!	Mem[0000000030001400] = 00ff0000, %l0 = 0000000000000000
	ldsha	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = 00000000000000ff, %f26 = 00000000 000000ff
	ldda	[%i6+%o5]0x89,%f26	! %f26 = 00000000 000000ff
!	%l7 = 0000000000000000, %l4 = 000000000000ffff, %l0 = 0000000000000000
	sdivx	%l7,%l4,%l0		! %l0 = 0000000000000000
!	Mem[00000000211c0000] = ffff85d2, %l6 = 00000000000000ff
	ldsh	[%o2+%g0],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030181408] = a77aa2170fc18655, %f12 = 010000ff 00000000
	ldda	[%i6+%o4]0x89,%f12	! %f12 = a77aa217 0fc18655
!	%l6 = ffffffffffffffff, imm = 0000000000000216, %l6 = ffffffffffffffff
	xor	%l6,0x216,%l6		! %l6 = fffffffffffffde9
!	Mem[0000000030101400] = ff00009f, %l7 = 0000000000000000
	lduwa	[%i4+%g0]0x81,%l7	! %l7 = 00000000ff00009f
!	Mem[0000000010081400] = ffffffff, %l1 = 0000000000000000
	ldsw	[%i2+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000030181400] = 63ffff96, %l1 = ffffffffffffffff
	ldsha	[%i6+%g0]0x81,%l1	! %l1 = 00000000000063ff
!	Starting 10 instruction Store Burst
!	%f2  = 000001ff 00001d20, %l0 = 0000000000000000
!	Mem[0000000010101408] = ffffffffa2fb63dd
	add	%i4,0x008,%g1
	stda	%f2,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010101408] = ffffffffa2fb63dd

p0_label_416:
!	Mem[0000000030081400] = 00000000, %l0 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000000
!	%l2 = ffffffff, %l3 = 0000ff00, Mem[0000000010081408] = 7e600000 f20a2ca5
	stda	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffffff 0000ff00
!	%l4 = 000000000000ffff, Mem[0000000030081400] = 00000000
	stba	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = ff000000
!	%l0 = 00000000, %l1 = 000063ff, Mem[0000000030081408] = 201d0000 ff010000
	stda	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000 000063ff
!	%l2 = 00000000ffffffff, Mem[000000001004140f] = ff0000ff
	stb	%l2,[%i1+0x00f]		! Mem[000000001004140c] = ff0000ff
!	%f16 = 96070000 00000000 00000000 ffffffff
!	%f20 = 0000ff52 ffffffff 000001ff 00001d20
!	%f24 = 00000000 00000000 00000000 000000ff
!	%f28 = 00000000 00ff0000 00000000 ffffffff
	stda	%f16,[%i4]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	Mem[0000000010041400] = 00000000, %l4 = 000000000000ffff
	swapa	[%i1+%g0]0x88,%l4	! %l4 = 0000000000000000
!	%f12 = a77aa217 0fc18655, Mem[0000000030101408] = 00000000 96070000
	stda	%f12,[%i4+%o4]0x89	! Mem[0000000030101408] = a77aa217 0fc18655
!	%l0 = 00000000, %l1 = 000063ff, Mem[0000000010081430] = ff0000ff 4900ff00
	stda	%l0,[%i2+0x030]%asi	! Mem[0000000010081430] = 00000000 000063ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ff0000ff 300a00ff, %l0 = 00000000, %l1 = 000063ff
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 00000000300a00ff 00000000ff0000ff

p0_label_417:
!	Mem[00000000201c0000] = 00004c08, %l5 = 0000000000000000
	ldsb	[%o0+%g0],%l5		! %l5 = 0000000000000000
!	%l7 = 00000000ff00009f, %l3 = 000000000000ff00, %l7 = 00000000ff00009f
	subc	%l7,%l3,%l7		! %l7 = 00000000feff019f
!	Mem[00000000300c1408] = 0063fba2, %l6 = fffffffffffffde9
	lduba	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001408] = 000000ff, %f1  = ffffffff
	lda	[%i0+%o4]0x88,%f1 	! %f1 = 000000ff
!	Mem[0000000030141408] = ffffff00, %l5 = 0000000000000000
	ldsha	[%i5+%o4]0x89,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000010181430] = 00000048a675a8b0, %f12 = a77aa217 0fc18655
	ldd	[%i6+0x030],%f12	! %f12 = 00000048 a675a8b0
!	Mem[00000000300c1410] = 9f1d21007e60bfff, %l7 = 00000000feff019f
	ldxa	[%i3+%o5]0x81,%l7	! %l7 = 9f1d21007e60bfff
!	Mem[000000001000143c] = ff000000, %l0 = 00000000300a00ff
	ldsw	[%i0+0x03c],%l0		! %l0 = ffffffffff000000
!	Mem[0000000030081408] = 00000000, %l0 = ffffffffff000000
	ldsba	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i6+%g0]0x88,%l4	! %l4 = 00000000000000ff

p0_label_418:
!	Mem[0000000010181410] = 00583e7e, %l6 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l6	! %l6 = 0000007e000000ff
!	%l6 = 000000000000007e, Mem[00000000100c1408] = ff0000ff
	stwa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000007e
!	%f12 = 00000048 a675a8b0, %l4 = 0000000000000000
!	Mem[0000000030141428] = ac99044820dd659f
	add	%i5,0x028,%g1
	stda	%f12,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030141428] = ac99044820dd659f
!	%l5 = ffffffffffffff00, Mem[0000000010041418] = 00000000ff000000, %asi = 80
	stxa	%l5,[%i1+0x018]%asi	! Mem[0000000010041418] = ffffffffffffff00
!	Mem[0000000010001410] = 000000ff, %l5 = ffffff00, %l7 = 7e60bfff
	add	%i0,0x10,%g1
	casa	[%g1]0x80,%l5,%l7	! %l7 = 00000000000000ff
!	%l5 = ffffffffffffff00, Mem[0000000010181400] = ff000000
	stwa	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = ffffff00
!	%f8  = 000001ff 49000000, %l5 = ffffffffffffff00
!	Mem[0000000010001400] = 000000ff00000000
	stda	%f8,[%i0+%l5]ASI_PST32_PL ! Mem[0000000010001400] = 000000ff00000000
!	%l0 = 0000000000000000, immed = fffff5c0, %y  = 00000000
	udiv	%l0,-0xa40,%l1		! %l1 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	%f9  = 49000000, Mem[0000000010101400] = 00000796
	sta	%f9 ,[%i4+%g0]0x88	! Mem[0000000010101400] = 49000000
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_36:
!	%l0 = 0000000000000000
	setx	0xc79ca707a2b305e0,%g7,%l0 ! %l0 = c79ca707a2b305e0
!	%l1 = 0000000000000000
	setx	0x8eb8b90fee1fd9a6,%g7,%l1 ! %l1 = 8eb8b90fee1fd9a6
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = c79ca707a2b305e0
	setx	0xb93df1384256d638,%g7,%l0 ! %l0 = b93df1384256d638
!	%l1 = 8eb8b90fee1fd9a6
	setx	0x426abed033ceda94,%g7,%l1 ! %l1 = 426abed033ceda94

p0_label_419:
!	Mem[0000000010181420] = 00583e7e, %l6 = 000000000000007e
	ldsw	[%i6+0x020],%l6		! %l6 = 0000000000583e7e
!	Mem[000000001018140c] = 00000000, %l6 = 0000000000583e7e
	ldub	[%i6+0x00e],%l6		! %l6 = 0000000000000000
!	Mem[0000000010001410] = 000000ff00000000, %f24 = 00000000 00000000
	ldda	[%i0+%o5]0x80,%f24	! %f24 = 000000ff 00000000
	membar	#Sync			! Added by membar checker (63)
!	Mem[0000000010101410] = 0000ff52, %l6 = 0000000000000000
	lduha	[%i4+%o5]0x80,%l6	! %l6 = 0000000000000000
!	%f28 = 00000000, %f29 = 00ff0000, %f21 = ffffffff
	fsubs	%f28,%f29,%f21		! %f21 = 80ff0000
!	Mem[00000000201c0000] = 00004c08, %l0 = b93df1384256d638
	ldsb	[%o0+%g0],%l0		! %l0 = 0000000000000000
!	Mem[0000000010141410] = 00067d81000000ff, %l7 = 00000000000000ff
	ldxa	[%i5+%o5]0x88,%l7	! %l7 = 00067d81000000ff
!	Mem[0000000010101410] = 0000ff52, %l7 = 00067d81000000ff
	ldswa	[%i4+%o5]0x80,%l7	! %l7 = 000000000000ff52
!	Mem[0000000010001410] = ff000000, %l7 = 000000000000ff52
	lduba	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f22 = 000001ff 00001d20, %l1 = 426abed033ceda94
!	Mem[0000000010081418] = 000001ffff000000
	add	%i2,0x018,%g1
	stda	%f22,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010081418] = 000000ffff000000

p0_label_420:
!	%l0 = 00000000, %l1 = 33ceda94, Mem[0000000030041408] = ffffffff f20a2ca5
	stda	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000 33ceda94
!	%f2  = 000001ff 00001d20, Mem[0000000010101408] = 00000000 ffffffff
	stda	%f2 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 000001ff 00001d20
!	Mem[0000000010181400] = ffffff00, %l0 = 0000000000000000
	ldstuba	[%i6+%g0]0x80,%l0	! %l0 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[0000000030101410] = ffffffff
	stha	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 00ffffff
!	Mem[0000000010141410] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i5+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030081410] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101404] = 00000000, %l4 = 000000ff, %l2 = ffffffff
	add	%i4,0x04,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041410] = ff0000ff, %l5 = ffffffffffffff00
	swapa	[%i1+%o5]0x89,%l5	! %l5 = 00000000ff0000ff
!	%l0 = 00000000000000ff, Mem[00000000300c1408] = a2fb6300
	stwa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 0fc18655, %l5 = 00000000ff0000ff
	ldsba	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000055

p0_label_421:
!	Mem[0000000010041408] = ff000a30, %l0 = 00000000000000ff
	ldsha	[%i1+0x00a]%asi,%l0	! %l0 = 0000000000000a30
!	Mem[0000000010001400] = 000000ff 00000000 ff000000 ff010000
!	Mem[0000000010001410] = 000000ff 00000000 ac990448 00000000
!	Mem[0000000010001420] = ffffffff 00000050 ffbf607e 20dd659f
!	Mem[0000000010001430] = ac990448 000000ff 00000000 ff000000
	ldda	[%i0]ASI_BLK_AIUP,%f0	! Block Load from 0000000010001400
!	Mem[0000000010041400] = ffff0000 0000201d, %l2 = 00000000, %l3 = 0000ff00
	ldda	[%i1+%g0]0x80,%l2	! %l2 = 00000000ffff0000 000000000000201d
!	Mem[0000000010001418] = ac99044800000000, %l4 = 00000000000000ff
	ldxa	[%i0+0x018]%asi,%l4	! %l4 = ac99044800000000
!	%f26 = 00000000 000000ff, %f25 = 00000000
	fdtos	%f26,%f25		! %f25 = 00000000
!	Mem[0000000030001410] = 00000000, %l7 = 0000000000000000
	lduha	[%i0+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041408] = ff000a30, %l7 = 0000000000000000
	lduba	[%i1+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1408] = 000000000000007e, %f30 = 00000000 ffffffff
	ldda	[%i3+%o4]0x88,%f30	! %f30 = 00000000 0000007e
!	%l7 = 00000000000000ff, immed = 0000059f, %y  = 00000000
	sdiv	%l7,0x59f,%l3		! %l3 = 0000000000000000
	mov	%l0,%y			! %y = 00000a30
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = 5586c10f, %l5 = 0000000000000055
	swapa	[%i6+%o4]0x81,%l5	! %l5 = 000000005586c10f

p0_label_422:
!	%f24 = 000000ff 00000000, Mem[0000000010141410] = ff000000 817d0600
	stda	%f24,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000ff 00000000
!	%l4 = ac99044800000000, Mem[0000000030181410] = 00000000000000ff
	stxa	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = ac99044800000000
!	Mem[0000000030141410] = ffffffff, %l0 = 0000000000000a30
	swapa	[%i5+%o5]0x89,%l0	! %l0 = 00000000ffffffff
!	%l0 = 00000000ffffffff, Mem[0000000030181400] = 96ffff63
	stba	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 96ffffff
!	Mem[00000000211c0001] = ffff85d2, %l6 = 0000000000000000
	ldstuba	[%o2+0x001]%asi,%l6	! %l6 = 000000ff000000ff
!	%l0 = 00000000ffffffff, immed = 00000a8d, %y  = 00000a30
	sdiv	%l0,0xa8d,%l1		! %l1 = 000000007fffffff
	mov	%l0,%y			! %y = ffffffff
!	%f18 = 00000000 ffffffff, Mem[00000000100c1400] = ffddff00 a52c0af2
	std	%f18,[%i3+%g0]	! Mem[00000000100c1400] = 00000000 ffffffff
!	Mem[0000000021800040] = ffffd022, %l7 = 00000000000000ff
	ldstuba	[%o3+0x040]%asi,%l7	! %l7 = 000000ff000000ff
!	Mem[000000001018143d] = 00000000, %l6 = 00000000000000ff
	ldstub	[%i6+0x03d],%l6		! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ffffff96, %l2 = 00000000ffff0000
	ldsha	[%i6+%g0]0x81,%l2	! %l2 = ffffffffffffffff

p0_label_423:
!	Mem[0000000010001410] = 000000ff, %l5 = 000000005586c10f
	ldub	[%i0+%o5],%l5		! %l5 = 0000000000000000
!	Mem[0000000010081438] = 00000000, %l4 = ac99044800000000
	lduba	[%i2+0x03a]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141410] = 300a0000, %f17 = 00000000
	lda	[%i5+%o5]0x81,%f17	! %f17 = 300a0000
!	Mem[0000000010101400] = 49000000, %f27 = 000000ff
	lda	[%i4+%g0]0x88,%f27	! %f27 = 49000000
!	Mem[0000000010141400] = a52c0af200000000, %l7 = 00000000000000ff
	ldxa	[%i5+%g0]0x80,%l7	! %l7 = a52c0af200000000
!	Mem[0000000010101410] = 0000ff52, %l6 = 0000000000000000
	ldsba	[%i4+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041400] = 000000ff, %l7 = a52c0af200000000
	ldsba	[%i1+%g0]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030181408] = 55000000, %l5 = 0000000000000000
	lduwa	[%i6+%o4]0x89,%l5	! %l5 = 0000000055000000
!	Mem[0000000010181410] = 00583eff, %l0 = 00000000ffffffff
	ldsha	[%i6+%o5]0x88,%l0	! %l0 = 0000000000003eff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 00000000, %l5 = 0000000055000000
	swapa	[%i1+%o5]0x80,%l5	! %l5 = 0000000000000000

p0_label_424:
!	%f24 = 000000ff, Mem[0000000030081410] = ff000000
	sta	%f24,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000ff
!	%l0 = 0000000000003eff, Mem[0000000010041424] = 000000ff, %asi = 80
	stwa	%l0,[%i1+0x024]%asi	! Mem[0000000010041424] = 00003eff
!	%f20 = 0000ff52 80ff0000, Mem[0000000010141400] = f20a2ca5 00000000
	stda	%f20,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000ff52 80ff0000
!	%f16 = 96070000 300a0000 00000000 ffffffff
!	%f20 = 0000ff52 80ff0000 000001ff 00001d20
!	%f24 = 000000ff 00000000 00000000 49000000
!	%f28 = 00000000 00ff0000 00000000 0000007e
	stda	%f16,[%i0]ASI_BLK_AIUS	! Block Store to 0000000030001400
!	%l0 = 00003eff, %l1 = 7fffffff, Mem[0000000030001400] = 00000796 00000a30
	stda	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 00003eff 7fffffff
	membar	#Sync			! Added by membar checker (64)
!	%l3 = 0000000000000000, Mem[0000000010001410] = ff000000
	stba	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = ff000000
!	%l2 = ffffffffffffffff, Mem[0000000010141408] = 00000000
	stha	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = ffff0000
!	Mem[0000000030041408] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	%f26 = 00000000, Mem[0000000030081410] = ff000000
	sta	%f26,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 000000ff, %l3 = 0000000000000000
	lduha	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000

p0_label_425:
!	Mem[0000000030081408] = 00000000, %l1 = 000000007fffffff
	ldswa	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181400] = 00ffffff, %l1 = 0000000000000000
	ldswa	[%i6+%g0]0x88,%l1	! %l1 = 0000000000ffffff
!	Mem[0000000030041410] = ffffff00, %f8  = ffffffff
	lda	[%i1+%o5]0x89,%f8 	! %f8 = ffffff00
!	%l2 = ffffffffffffffff, imm = fffffffffffffcad, %l2 = ffffffffffffffff
	andn	%l2,-0x353,%l2		! %l2 = 0000000000000352
!	Mem[00000000100c1410] = 0000000000000000, %l1 = 0000000000ffffff
	ldxa	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000021800140] = ffff05d8, %l1 = 0000000000000000
	ldub	[%o3+0x141],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030181408] = 55000000, %l4 = 0000000000000000
	lduba	[%i6+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Code Fragment 3
p0_fragment_37:
!	%l0 = 0000000000003eff
	setx	0x3058485877345eae,%g7,%l0 ! %l0 = 3058485877345eae
!	%l1 = 00000000000000ff
	setx	0x5ea3149847f90469,%g7,%l1 ! %l1 = 5ea3149847f90469
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3058485877345eae
	setx	0x390b7817921f8116,%g7,%l0 ! %l0 = 390b7817921f8116
!	%l1 = 5ea3149847f90469
	setx	0xe3c40cc05f6d17d9,%g7,%l1 ! %l1 = e3c40cc05f6d17d9
!	Mem[0000000010081410] = ffffffff, %l4 = 0000000000000000
	lduha	[%i2+%o5]0x80,%l4	! %l4 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000352, Mem[0000000030041400] = ff00000000000000
	stxa	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000000000000352

p0_label_426:
!	%f8  = ffffff00 00000050, Mem[0000000010001410] = ff000000 00000000
	stda	%f8 ,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffff00 00000050
!	Code Fragment 3
p0_fragment_38:
!	%l0 = 390b7817921f8116
	setx	0x29b293f021af4cd8,%g7,%l0 ! %l0 = 29b293f021af4cd8
!	%l1 = e3c40cc05f6d17d9
	setx	0xb2d5896016282d14,%g7,%l1 ! %l1 = b2d5896016282d14
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 29b293f021af4cd8
	setx	0xd49dacb0616c987a,%g7,%l0 ! %l0 = d49dacb0616c987a
!	%l1 = b2d5896016282d14
	setx	0x07664a9fd2e1caeb,%g7,%l1 ! %l1 = 07664a9fd2e1caeb
!	%l0 = 616c987a, %l1 = d2e1caeb, Mem[0000000010101400] = 00000049 00000000
	stda	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 616c987a d2e1caeb
!	Mem[0000000010181410] = ff3e5800, %l0 = d49dacb0616c987a
	ldstuba	[%i6+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[0000000010181438] = 0000ffff, %asi = 80
	stba	%l5,[%i6+0x038]%asi	! Mem[0000000010181438] = 0000ffff
!	%l4 = 000000000000ffff, Mem[0000000030101408] = 5586c10f17a27aa7
	stxa	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000000000ffff
!	%l4 = 000000000000ffff, Mem[0000000010181410] = 00583eff
	stwa	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000ffff
!	%l2 = 00000352, %l3 = 00000000, Mem[0000000010081400] = ffffffff 00000796
	stda	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000352 00000000
!	%f16 = 96070000 300a0000 00000000 ffffffff
!	%f20 = 0000ff52 80ff0000 000001ff 00001d20
!	%f24 = 000000ff 00000000 00000000 49000000
!	%f28 = 00000000 00ff0000 00000000 0000007e
	stda	%f16,[%i1]ASI_BLK_AIUPL	! Block Store to 0000000010041400
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000000, %f8  = ffffff00
	lda	[%i1+%g0]0x89,%f8 	! %f8 = 00000000

p0_label_427:
!	Mem[00000000300c1410] = 9f1d2100, %l0 = 00000000000000ff
	ldsha	[%i3+%o5]0x81,%l0	! %l0 = ffffffffffff9f1d
!	Mem[0000000010081410] = ffffffff00000000, %l6 = 0000000000000000
	ldxa	[%i2+%o5]0x80,%l6	! %l6 = ffffffff00000000
	membar	#Sync			! Added by membar checker (65)
!	Mem[000000001004142c] = 00000000, %l0 = ffffffffffff9f1d
	ldsw	[%i1+0x02c],%l0		! %l0 = 0000000000000000
!	Mem[0000000030041400] = 5203000000000000, %l1 = 07664a9fd2e1caeb
	ldxa	[%i1+%g0]0x89,%l1	! %l1 = 5203000000000000
!	Mem[00000000100c1430] = 00000000 203504f3, %l0 = 00000000, %l1 = 00000000
	ldd	[%i3+0x030],%l0		! %l0 = 0000000000000000 00000000203504f3
!	Mem[0000000010081400] = 52030000 00000000, %l0 = 00000000, %l1 = 203504f3
	ldda	[%i2+%g0]0x80,%l0	! %l0 = 0000000052030000 0000000000000000
!	Mem[0000000030041408] = 94dace33000000ff, %f14 = 00000000 ff000000
	ldda	[%i1+%o4]0x89,%f14	! %f14 = 94dace33 000000ff
!	Mem[0000000030081408] = ff63000000000000, %f10 = ffbf607e 20dd659f
	ldda	[%i2+%o4]0x89,%f10	! %f10 = ff630000 00000000
!	Mem[0000000030081408] = 00000000, %f9  = 00000050
	lda	[%i2+%o4]0x89,%f9 	! %f9 = 00000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000ffff, %l5 = 00000000, Mem[0000000030001400] = 00003eff 7fffffff
	stda	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000ffff 00000000

p0_label_428:
!	%f6  = ac990448 00000000, Mem[0000000010101410] = 52ff0000 ffffffff
	stda	%f6 ,[%i4+%o5]0x88	! Mem[0000000010101410] = ac990448 00000000
!	%l0 = 0000000052030000, Mem[0000000010101410] = 00000000
	stba	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	%f16 = 96070000, Mem[0000000010181400] = 00ffffff
	sta	%f16,[%i6+%g0]0x88	! Mem[0000000010181400] = 96070000
!	%l3 = 0000000000000000, Mem[000000001008143e] = 000000ff, %asi = 80
	stha	%l3,[%i2+0x03e]%asi	! Mem[000000001008143c] = 00000000
!	%l1 = 0000000000000000, Mem[0000000010041400] = 300a0000
	stba	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 300a0000
!	%f26 = 00000000 49000000, Mem[0000000010001408] = 000000ff 000001ff
	stda	%f26,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000 49000000
!	Mem[0000000010141410] = 000000ff, %l5 = 0000000000000000
	ldstuba	[%i5+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%f16 = 96070000 300a0000, Mem[0000000010141418] = 7c0efb7c ff2ce06d
	std	%f16,[%i5+0x018]	! Mem[0000000010141418] = 96070000 300a0000
!	Mem[00000000211c0001] = ffff85d2, %l1 = 0000000000000000
	ldstuba	[%o2+0x001]%asi,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ffff0000, %l6 = ffffffff00000000
	ldsb	[%i5+0x009],%l6		! %l6 = ffffffffffffffff

p0_label_429:
!	Mem[0000000030141400] = ff0000ff, %l4 = 000000000000ffff
	lduba	[%i5+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1408] = 0000007e, %l6 = ffffffffffffffff
	lduha	[%i3+%o4]0x88,%l6	! %l6 = 000000000000007e
!	Mem[00000000300c1408] = ff000000, %l3 = 0000000000000000
	lduwa	[%i3+%o4]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[0000000020800000] = ffffba64, %l2 = 0000000000000352
	lduha	[%o1+0x000]%asi,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010041400] = 96070000300a0000, %f6  = ac990448 00000000
	ldda	[%i1+%g0]0x88,%f6 	! %f6  = 96070000 300a0000
!	Mem[0000000030141410] = 00000a30, %l1 = 00000000000000ff
	ldswa	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000a30
!	Mem[0000000010081410] = ffffffff, %l4 = 00000000000000ff
	lduba	[%i2+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030181410] = 00000000, %l2 = 000000000000ffff
	lduwa	[%i6+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = ffffffff, %l1 = 0000000000000a30
	ldswa	[%i1+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffffff, Mem[0000000010081408] = ffffffff
	stha	%l7,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffffff

p0_label_430:
!	%l4 = 00000000000000ff, Mem[0000000010141420] = 000000ff0000201d
	stx	%l4,[%i5+0x020]		! Mem[0000000010141420] = 00000000000000ff
!	Mem[00000000211c0000] = ffff85d2, %l5 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l5	! %l5 = 000000ff000000ff
!	%l6 = 000000000000007e, Mem[0000000021800001] = ff00f103
	stb	%l6,[%o3+0x001]		! Mem[0000000021800000] = ff7ef103
!	%l2 = 0000000000000000, Mem[00000000300c1410] = 9f1d21007e60bfff
	stxa	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000000000000000
!	%l1 = ffffffffffffffff, Mem[0000000010001408] = 0000000049000000
	stxa	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffffffffffffff
!	%f24 = 000000ff 00000000, Mem[0000000030181400] = 96ffffff 00000000
	stda	%f24,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff 00000000
!	%f26 = 00000000 49000000, Mem[0000000010041410] = 0000ff80 52ff0000
	stda	%f26,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000 49000000
!	%l6 = 000000000000007e, immed = 00000dc1, %y  = ffffffff
	umul	%l6,0xdc1,%l2		! %l2 = 000000000006c4fe, %y = 00000000
!	%l2 = 0006c4fe, %l3 = ff000000, Mem[0000000010081408] = ffffffff 0000ff00
	stda	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 0006c4fe ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 96070000, %l3 = 00000000ff000000
	lduha	[%i6+%g0]0x88,%l3	! %l3 = 0000000000000000

p0_label_431:
!	Mem[0000000010181428] = 000000ff, %l2 = 000000000006c4fe
	ldsw	[%i6+0x028],%l2		! %l2 = 00000000000000ff
!	Mem[0000000021800140] = ffff05d8, %l7 = ffffffffffffffff
	ldub	[%o3+0x140],%l7		! %l7 = 00000000000000ff
!	Code Fragment 3
p0_fragment_39:
!	%l0 = 0000000052030000
	setx	0xa84b0d006cfec7b6,%g7,%l0 ! %l0 = a84b0d006cfec7b6
!	%l1 = ffffffffffffffff
	setx	0x612e69b0422467aa,%g7,%l1 ! %l1 = 612e69b0422467aa
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a84b0d006cfec7b6
	setx	0x6d9439a009ca5f71,%g7,%l0 ! %l0 = 6d9439a009ca5f71
!	%l1 = 612e69b0422467aa
	setx	0xa46f216fc92a007c,%g7,%l1 ! %l1 = a46f216fc92a007c
!	Mem[00000000100c141c] = 000000ff, %l6 = 000000000000007e
	ldub	[%i3+0x01e],%l6		! %l6 = 0000000000000000
!	Mem[00000000100c1408] = 7e000000, %l5 = 00000000000000ff
	lduwa	[%i3+%o4]0x80,%l5	! %l5 = 000000007e000000
!	%l3 = 0000000000000000, %l0 = 6d9439a009ca5f71, %l0 = 6d9439a009ca5f71
	xor	%l3,%l0,%l0		! %l0 = 6d9439a009ca5f71
!	Mem[0000000030181400] = 00000000ff000000, %f24 = 000000ff 00000000
	ldda	[%i6+%g0]0x81,%f24	! %f24 = 00000000 ff000000
!	Mem[0000000010001410] = 50000000, %l7 = 00000000000000ff
	lduba	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000050
!	Mem[0000000030001408] = 00000000ffffffff, %l1 = a46f216fc92a007c
	ldxa	[%i0+%o4]0x81,%l1	! %l1 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 7a986c61, %l4 = 00000000000000ff
	ldstuba	[%i4+%g0]0x88,%l4	! %l4 = 00000061000000ff

p0_label_432:
!	%f26 = 00000000 49000000, Mem[0000000010141408] = ffff0000 00000000
	stda	%f26,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000 49000000
!	Mem[0000000030001400] = 0000ffff, %l0 = 6d9439a009ca5f71
	swapa	[%i0+%g0]0x89,%l0	! %l0 = 000000000000ffff
!	Mem[0000000030181410] = 00000000, %l1 = 00000000ffffffff
	ldstuba	[%i6+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%f17 = 300a0000, Mem[0000000030041408] = 000000ff
	sta	%f17,[%i1+%o4]0x89	! Mem[0000000030041408] = 300a0000
!	Mem[0000000010041408] = ffffffff, %l2 = 00000000000000ff
	ldstuba	[%i1+%o4]0x88,%l2	! %l2 = 000000ff000000ff
!	%l0 = 000000000000ffff, Mem[0000000030081410] = ffffffff00000000
	stxa	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000000000ffff
!	Mem[0000000030001410] = 52ff0000, %l6 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081400] = 00000352, %l3 = 0000000000000000
	swapa	[%i2+%g0]0x88,%l3	! %l3 = 0000000000000352
!	%l1 = 0000000000000000, Mem[00000000100c1400] = 00000000
	stha	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000000, %l1 = 0000000000000000
	lduwa	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000

p0_label_433:
!	Mem[00000000300c1410] = 00000000, %l2 = 00000000000000ff
	lduha	[%i3+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141400] = ff0000ff, %l1 = 0000000000000000
	ldsha	[%i5+%g0]0x81,%l1	! %l1 = ffffffffffffff00
!	Mem[00000000100c1434] = 203504f3, %l0 = 000000000000ffff
	lduh	[%i3+0x034],%l0		! %l0 = 0000000000002035
!	Mem[0000000010041400] = 00000a3000000796, %l2 = 0000000000000000
	ldx	[%i1+%g0],%l2		! %l2 = 00000a3000000796
	membar	#Sync			! Added by membar checker (66)
!	Mem[0000000030001400] = 715fca09 00000000 00000000 ffffffff
!	Mem[0000000030001410] = ff00ff52 80ff0000 000001ff 00001d20
!	Mem[0000000030001420] = 000000ff 00000000 00000000 49000000
!	Mem[0000000030001430] = 00000000 00ff0000 00000000 0000007e
	ldda	[%i0]ASI_BLK_AIUS,%f0	! Block Load from 0000000030001400
!	Mem[0000000010081400] = 0000000000000000, %f22 = 000001ff 00001d20
	ldda	[%i2+%g0]0x88,%f22	! %f22 = 00000000 00000000
!	Mem[0000000030081400] = 00000000000000ff, %l3 = 0000000000000352
	ldxa	[%i2+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000021800080] = ffff7b7d, %l5 = 000000007e000000
	lduh	[%o3+0x080],%l5		! %l5 = 000000000000ffff
!	Mem[0000000010141400] = 80ff0000, %l4 = 0000000000000061
	ldsha	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffff00, Mem[0000000030141410] = 0000000000000a30
	stxa	%l1,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffffffffffff00

p0_label_434:
!	%f18 = 00000000, %f30 = 00000000, %f31 = 0000007e
	fdivs	%f18,%f30,%f31		! %f31 = 7fffffff
!	%l6 = 00000000, %l7 = 00000050, Mem[0000000010101408] = 201d0000 ff010000
	stda	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000 00000050
!	%l5 = 000000000000ffff, %l7 = 0000000000000050, %l1  = ffffffffffffff00
	mulx	%l5,%l7,%l1		! %l1 = 00000000004fffb0
!	%l5 = 000000000000ffff, imm = fffffffffffff7b9, %l0 = 0000000000002035
	sub	%l5,-0x847,%l0		! %l0 = 0000000000010846
!	%f26 = 00000000, Mem[0000000030041400] = 00000000
	sta	%f26,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	Code Fragment 3
p0_fragment_40:
!	%l0 = 0000000000010846
	setx	0x3986c557e297d349,%g7,%l0 ! %l0 = 3986c557e297d349
!	%l1 = 00000000004fffb0
	setx	0x6ef83dff87724308,%g7,%l1 ! %l1 = 6ef83dff87724308
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3986c557e297d349
	setx	0x7abf316839dcf16a,%g7,%l0 ! %l0 = 7abf316839dcf16a
!	%l1 = 6ef83dff87724308
	setx	0x8c4d7ec8254ca2c6,%g7,%l1 ! %l1 = 8c4d7ec8254ca2c6
!	%l3 = 00000000000000ff, Mem[00000000201c0001] = 00004c08
	stb	%l3,[%o0+0x001]		! Mem[00000000201c0000] = 00ff4c08
!	Mem[0000000010081438] = 00000000, %l7 = 0000000000000050
	ldstuba	[%i2+0x038]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %l1 = 8c4d7ec8254ca2c6
	ldstuba	[%i5+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 00000000 ffffffff, %l0 = 39dcf16a, %l1 = 00000000
	ldda	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000 00000000ffffffff

p0_label_435:
!	Mem[0000000010141400] = 80ff0000, %l6 = 0000000000000000
	ldsba	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141410] = 00000000ff0000ff, %f16 = 96070000 300a0000
	ldda	[%i5+%o5]0x88,%f16	! %f16 = 00000000 ff0000ff
!	Mem[0000000010101408] = 00000000, %l5 = 000000000000ffff
	ldsba	[%i4+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = 0000000000000000, %l2 = 00000a3000000796
	ldx	[%i2+%g0],%l2		! %l2 = 0000000000000000
!	%f22 = 00000000, %f17 = ff0000ff, %f31 = 7fffffff
	fadds	%f22,%f17,%f31		! %f31 = ff0000ff
!	Mem[0000000030101408] = 00000000, %l0 = 0000000000000000
	lduba	[%i4+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = 9f0000ff, %l6 = 0000000000000000
	lduwa	[%i4+%g0]0x89,%l6	! %l6 = 000000009f0000ff
!	Mem[0000000010181410] = ffff0000, %f17 = ff0000ff
	lda	[%i6+%o5]0x80,%f17	! %f17 = ffff0000
!	Mem[000000001000142c] = 20dd659f, %f25 = ff000000
	lda	[%i0+0x02c]%asi,%f25	! %f25 = 20dd659f
!	Starting 10 instruction Store Burst
!	Mem[0000000020800001] = ffffba64, %l4 = 0000000000000000
	ldstub	[%o1+0x001],%l4		! %l4 = 000000ff000000ff

p0_label_436:
!	%l3 = 00000000000000ff, Mem[0000000021800000] = ff7ef103
	sth	%l3,[%o3+%g0]		! Mem[0000000021800000] = 00fff103
!	%l7 = 0000000000000000, Mem[0000000030141408] = ffffff00
	stha	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = ffff0000
!	%l1 = 00000000ffffffff, immed = fffff3e8, %y  = 00000000
	umul	%l1,-0xc18,%l4		! %l4 = fffff3e700000c18, %y = fffff3e7
!	%f16 = 00000000 ffff0000, Mem[00000000100c1400] = 00000000 ffffffff
	stda	%f16,[%i3+0x000]%asi	! Mem[00000000100c1400] = 00000000 ffff0000
!	%f0  = 715fca09 00000000 00000000 ffffffff
!	%f4  = ff00ff52 80ff0000 000001ff 00001d20
!	%f8  = 000000ff 00000000 00000000 49000000
!	%f12 = 00000000 00ff0000 00000000 0000007e
	stda	%f0,[%i6]ASI_BLK_AIUPL	! Block Store to 0000000010181400
!	%l2 = 00000000, %l3 = 000000ff, Mem[00000000100c1410] = 00000000 00000000
	stda	%l2,[%i3+0x010]%asi	! Mem[00000000100c1410] = 00000000 000000ff
!	%l5 = 0000000000000000, Mem[0000000010101410] = ac99044800000000
	stxa	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000000000000
	membar	#Sync			! Added by membar checker (67)
!	Mem[0000000010181410] = 0000ff80, %l6 = 000000009f0000ff, %asi = 80
	swapa	[%i6+0x010]%asi,%l6	! %l6 = 000000000000ff80
!	Mem[0000000010001404] = 00000000, %l0 = 00000000, %l3 = 000000ff
	add	%i0,0x04,%g1
	casa	[%g1]0x80,%l0,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 7e000000 00000000, %l6 = 0000ff80, %l7 = 00000000
	ldda	[%i3+%o4]0x80,%l6	! %l6 = 000000007e000000 0000000000000000

p0_label_437:
!	Code Fragment 3
p0_fragment_41:
!	%l0 = 0000000000000000
	setx	0x72c357a86fa8bb25,%g7,%l0 ! %l0 = 72c357a86fa8bb25
!	%l1 = 00000000ffffffff
	setx	0x640901800bb8172e,%g7,%l1 ! %l1 = 640901800bb8172e
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 72c357a86fa8bb25
	setx	0x8f567d779376c3eb,%g7,%l0 ! %l0 = 8f567d779376c3eb
!	%l1 = 640901800bb8172e
	setx	0xbce8f6ffb93376c8,%g7,%l1 ! %l1 = bce8f6ffb93376c8
!	Mem[0000000010181408] = ffffffff, %l5 = 0000000000000000
	ldsba	[%i6+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[000000001008142c] = ff000000, %l0 = 8f567d779376c3eb
	lduba	[%i2+0x02d]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l2 = 0000000000000000
	lduwa	[%i3+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1414] = 000000ff, %l7 = 0000000000000000
	lduwa	[%i3+0x014]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001408] = ffffffff, %l7 = 00000000000000ff
	ldswa	[%i0+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010001400] = 000000ff, %l7 = ffffffffffffffff
	ldsw	[%i0+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010101408] = 0000000000000050, %f20 = 0000ff52 80ff0000
	ldda	[%i4+%o4]0x80,%f20	! %f20 = 00000000 00000050
!	Mem[0000000030141400] = ff0000ff, %l6 = 000000007e000000
	ldsha	[%i5+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000010181410] = 9f0000ff
	stba	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000ff

p0_label_438:
!	Mem[0000000010101400] = 7a986cff, %l0 = 0000000000000000
	ldstuba	[%i4+%g0]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010081437] = 000063ff, %l7 = 00000000000000ff
	ldstub	[%i2+0x037],%l7		! %l7 = 000000ff000000ff
!	%f1  = 00000000, %f25 = 20dd659f, %f3  = ffffffff
	fadds	%f1 ,%f25,%f3 		! %f3  = 20dd659f
!	Mem[0000000010001410] = 00000050, %l4 = fffff3e700000c18
	swapa	[%i0+%o5]0x88,%l4	! %l4 = 0000000000000050
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000030141410] = ffffff00 ffffffff
	stda	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000ff 000000ff
!	%l2 = 0000000000000000, Mem[0000000010001418] = ac990448, %asi = 80
	stba	%l2,[%i0+0x018]%asi	! Mem[0000000010001418] = 00990448
!	Mem[00000000218000c1] = ffff4ce8, %l6 = 00000000000000ff
	ldstuba	[%o3+0x0c1]%asi,%l6	! %l6 = 000000ff000000ff
!	%f22 = 00000000 00000000, %l1 = bce8f6ffb93376c8
!	Mem[0000000010081438] = ff00000000000000
	add	%i2,0x038,%g1
	stda	%f22,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010081438] = ff00000000000000
!	%l4 = 0000000000000050, Mem[000000001004140c] = 00000000
	stw	%l4,[%i1+0x00c]		! Mem[000000001004140c] = 00000050
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00000000, %l1 = bce8f6ffb93376c8
	ldsha	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000

p0_label_439:
!	Mem[0000000010101424] = 00000000, %l5 = ffffffffffffffff
	ldsh	[%i4+0x024],%l5		! %l5 = 0000000000000000
!	Mem[00000000211c0000] = ffff85d2, %l3 = 0000000000000000
	ldsba	[%o2+0x001]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030141408] = 0000ffff ffffffac, %l2 = 00000000, %l3 = ffffffff
	ldda	[%i5+%o4]0x81,%l2	! %l2 = 000000000000ffff 00000000ffffffac
!	Mem[00000000300c1408] = ff000000, %l7 = 00000000000000ff
	ldswa	[%i3+%o4]0x81,%l7	! %l7 = ffffffffff000000
!	Mem[0000000030101400] = 9f0000ff, %l0 = 00000000000000ff
	lduba	[%i4+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141400] = 00000000ff0000ff, %l0 = 00000000000000ff
	ldxa	[%i5+%g0]0x89,%l0	! %l0 = 00000000ff0000ff
!	Mem[0000000010101410] = 00000000, %l0 = 00000000ff0000ff
	lduwa	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = 80ff0000, %l7 = ffffffffff000000
	ldsba	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081410] = ffff0000, %l3 = 00000000ffffffac
	lduwa	[%i2+%o5]0x81,%l3	! %l3 = 00000000ffff0000
!	Starting 10 instruction Store Burst
!	%l4 = 00000050, %l5 = 00000000, Mem[0000000030041408] = 00000a30 33ceda94
	stda	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000050 00000000

p0_label_440:
!	%f14 = 00000000, %f6  = 000001ff, %f25 = 20dd659f
	fadds	%f14,%f6 ,%f25		! %l0 = 0000000000000022, Unfinished, %fsr = 2900000800
!	%l3 = 00000000ffff0000, Mem[0000000020800001] = ffffba64
	stb	%l3,[%o1+0x001]		! Mem[0000000020800000] = ff00ba64
!	Mem[00000000300c1400] = ff0000ff, %l0 = 0000000000000022
	swapa	[%i3+%g0]0x81,%l0	! %l0 = 00000000ff0000ff
!	Mem[000000001018143c] = 00000000, %l4 = 0000000000000050
	ldstuba	[%i6+0x03c]%asi,%l4	! %l4 = 00000000000000ff
!	%f31 = ff0000ff, Mem[00000000100c1410] = 00000000
	sta	%f31,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff0000ff
!	Mem[0000000010101415] = 00000000, %l4 = 0000000000000000
	ldstub	[%i4+0x015],%l4		! %l4 = 00000000000000ff
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030041408] = 00000050 00000000
	stda	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000 00000000
!	%f18 = 00000000 ffffffff, Mem[0000000010001400] = ff000000 ff000000
	stda	%f18,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000 ffffffff
!	%l7 = 0000000000000000, Mem[0000000010101408] = 00000000
	stha	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 80ff0000, %f17 = ffff0000
	lda	[%i5+%g0]0x88,%f17	! %f17 = 80ff0000

p0_label_441:
!	Code Fragment 3
p0_fragment_42:
!	%l0 = 00000000ff0000ff
	setx	0x92cbc2480d92f783,%g7,%l0 ! %l0 = 92cbc2480d92f783
!	%l1 = 0000000000000000
	setx	0xad6fd7f7a530b0d8,%g7,%l1 ! %l1 = ad6fd7f7a530b0d8
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 92cbc2480d92f783
	setx	0x34afe96f94fd9093,%g7,%l0 ! %l0 = 34afe96f94fd9093
!	%l1 = ad6fd7f7a530b0d8
	setx	0xd34a5c487d883793,%g7,%l1 ! %l1 = d34a5c487d883793
!	Mem[0000000010141410] = ff0000ff, %l1 = d34a5c487d883793
	ldsba	[%i5+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010081408] = 0006c4fe, %l5 = 0000000000000000
	ldsb	[%i2+0x009],%l5		! %l5 = 0000000000000006
!	Mem[0000000030141408] = acffffffffff0000, %l3 = 00000000ffff0000
	ldxa	[%i5+%o4]0x89,%l3	! %l3 = acffffffffff0000
!	Mem[0000000010101400] = ff6c987a, %l1 = ffffffffffffffff
	ldsha	[%i4+0x000]%asi,%l1	! %l1 = ffffffffffffff6c
!	Mem[0000000010041410] = 00000000, %l4 = 0000000000000000
	ldsba	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101400] = ff00009f, %f11 = 49000000
	lda	[%i4+%g0]0x81,%f11	! %f11 = ff00009f
!	Mem[0000000020800000] = ff00ba64, %l3 = acffffffffff0000
	lduba	[%o1+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141408] = ff000000, %l3 = 00000000000000ff
	ldsba	[%i5+%o4]0x80,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f16 = 00000000, Mem[0000000010141434] = 0000803f
	sta	%f16,[%i5+0x034]%asi	! Mem[0000000010141434] = 00000000

p0_label_442:
!	%l2 = 000000000000ffff, Mem[0000000010001418] = 00990448
	stw	%l2,[%i0+0x018]		! Mem[0000000010001418] = 0000ffff
!	%f0  = 715fca09 00000000 00000000 20dd659f
!	%f4  = ff00ff52 80ff0000 000001ff 00001d20
!	%f8  = 000000ff 00000000 00000000 ff00009f
!	%f12 = 00000000 00ff0000 00000000 0000007e
	stda	%f0,[%i5]ASI_BLK_AIUSL	! Block Store to 0000000030141400
!	%l5 = 0000000000000006, Mem[0000000030041408] = 00000000
	stwa	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000006
!	%l0 = 34afe96f94fd9093, Mem[0000000010001430] = ac990448000000ff
	stx	%l0,[%i0+0x030]		! Mem[0000000010001430] = 34afe96f94fd9093
!	%l0 = 34afe96f94fd9093, Mem[000000001004140e] = 00000050, %asi = 80
	stha	%l0,[%i1+0x00e]%asi	! Mem[000000001004140c] = 00009093
!	Mem[0000000030081400] = ff000000, %l1 = ffffffffffffff6c
	swapa	[%i2+%g0]0x81,%l1	! %l1 = 00000000ff000000
!	%l6 = 00000000000000ff, Mem[0000000030101410] = ffffff00
	stba	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = ffffffff
!	Mem[0000000010101438] = 00000000, %l1 = 00000000ff000000, %asi = 80
	swapa	[%i4+0x038]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001400] = 09ca5f71, %l6 = 00000000000000ff
	swapa	[%i0+%g0]0x89,%l6	! %l6 = 0000000009ca5f71
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ffff0000, %l4 = 0000000000000000
	ldsba	[%i2+%o5]0x81,%l4	! %l4 = ffffffffffffffff

p0_label_443:
!	Mem[0000000030041400] = 00000000, %l2 = 000000000000ffff
	ldsha	[%i1+%g0]0x89,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, immed = fffff3b7, %y  = fffff3e7
	sdiv	%l2,-0xc49,%l7		! %l7 = 000000007fffffff
	mov	%l0,%y			! %y = 94fd9093
!	Mem[00000000211c0000] = ffff85d2, %l7 = 000000007fffffff
	ldub	[%o2+0x001],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010181408] = ffffffff, %l5 = 0000000000000006
	ldsha	[%i6+%o4]0x88,%l5	! %l5 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (68)
!	Mem[0000000010141400] = 0000ff80 52ff0000 ff000000 49000000
!	Mem[0000000010141410] = ff0000ff 00000000 96070000 300a0000
!	Mem[0000000010141420] = 00000000 000000ff 00000000 00000000
!	Mem[0000000010141430] = 000000ff 00000000 0000007c ffff0000
	ldda	[%i5]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010141400
!	Mem[0000000010041400] = 00000a30, %l5 = ffffffffffffffff
	lduha	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101410] = ffffffff, %l7 = 00000000000000ff
	ldsha	[%i4+%o5]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030001410] = 52ff00ff, %f30 = 00000000
	lda	[%i0+%o5]0x89,%f30	! %f30 = 52ff00ff
!	Mem[0000000010001400] = ffffffff, %l1 = 0000000000000000
	lduha	[%i0+%g0]0x80,%l1	! %l1 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000ffff, Mem[00000000201c0001] = 00ff4c08, %asi = 80
	stba	%l1,[%o0+0x001]%asi	! Mem[00000000201c0000] = 00ff4c08

p0_label_444:
	membar	#Sync			! Added by membar checker (69)
!	%f30 = 52ff00ff ff0000ff, Mem[0000000010141410] = ff0000ff 00000000
	stda	%f30,[%i5+%o5]0x88	! Mem[0000000010141410] = 52ff00ff ff0000ff
!	%f5  = ff0000ff, Mem[0000000030141400] = 00000000
	sta	%f5 ,[%i5+%g0]0x81	! Mem[0000000030141400] = ff0000ff
!	Mem[00000000300c1408] = ff000000, %l5 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l5	! %l5 = 00000000ff000000
!	%f11 = 00000000, %f24 = 00000000, %f17 = 80ff0000
	fmuls	%f11,%f24,%f17		! %f17 = 00000000
!	Mem[0000000030001408] = 00000000, %l4 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%f17 = 00000000, %f9  = 00000000
	fcmpes	%fcc0,%f17,%f9 		! %fcc0 = 0
!	%l0 = 94fd9093, %l1 = 0000ffff, Mem[0000000010181408] = ffffffff 00000000
	stda	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 94fd9093 0000ffff
!	%f9  = 00000000, Mem[0000000010081408] = 0006c4fe
	st	%f9 ,[%i2+%o4]		! Mem[0000000010081408] = 00000000
!	%l7 = ffffffffffffffff, Mem[0000000030101408] = 00000000
	stba	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ffff0000, %l0 = 34afe96f94fd9093
	ldsha	[%i2+%o5]0x81,%l0	! %l0 = ffffffffffffffff

p0_label_445:
!	Mem[0000000030081408] = 00000000, %l4 = 0000000000000000
	lduba	[%i2+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = 0000ff52 80ff0000, %l0 = ffffffff, %l1 = 0000ffff
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 0000000080ff0000 000000000000ff52
!	Mem[0000000010041408] = ffffffff00009093, %l0 = 0000000080ff0000
	ldxa	[%i1+%o4]0x80,%l0	! %l0 = ffffffff00009093
!	Mem[0000000010101400] = ff6c987a, %f4  = 00000000
	lda	[%i4+%g0]0x80,%f4 	! %f4 = ff6c987a
!	Mem[0000000030181410] = 000000ff, %l2 = 0000000000000000
	ldsha	[%i6+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081410] = ffffffff, %l5 = 00000000ff000000
	lduha	[%i2+%o5]0x80,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010001410] = 180c0000, %l1 = 000000000000ff52
	ldswa	[%i0+0x010]%asi,%l1	! %l1 = 00000000180c0000
!	%f20 = 00000000, %f31 = ff0000ff
	fcmps	%fcc1,%f20,%f31		! %fcc1 = 2
!	Mem[0000000030101400] = 9f0000ff, %l7 = ffffffffffffffff
	lduwa	[%i4+%g0]0x89,%l7	! %l7 = 000000009f0000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000020800001] = ff00ba64, %l7 = 000000009f0000ff
	ldstub	[%o1+0x001],%l7		! %l7 = 00000000000000ff

p0_label_446:
!	%f6  = 00000a30, Mem[0000000030001400] = ff000000
	sta	%f6 ,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000a30
!	%l7 = 0000000000000000, Mem[0000000010081410] = ffffffff00000000, %asi = 80
	stxa	%l7,[%i2+0x010]%asi	! Mem[0000000010081410] = 0000000000000000
!	%l4 = 00000000, %l5 = 0000ffff, Mem[0000000010041408] = ffffffff 00009093
	stda	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000 0000ffff
!	%l3 = ffffffffffffffff, Mem[0000000010081408] = 00000000ff000000
	stxa	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffffffffffffff
!	Mem[0000000030101410] = ffffffff, %l1 = 00000000180c0000
	ldstuba	[%i4+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030101408] = ff000000, %l1 = 00000000000000ff
	ldstuba	[%i4+%o4]0x81,%l1	! %l1 = 000000ff000000ff
!	%f14 = 0000ffff, %f15 = 7c000000, %f14 = 0000ffff
	fmuls	%f14,%f15,%f14		! %l0 = ffffffff000090b5, Unfinished, %fsr = 2a00000000
!	Mem[0000000010081404] = 00000000, %l6 = 0000000009ca5f71, %asi = 80
	swapa	[%i2+0x004]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101410] = ffffffff, %l1 = 00000000000000ff
	ldstuba	[%i4+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 0000000000000000, %f18 = 00000000 ffffffff
	ldd	[%i2+%o5],%f18		! %f18 = 00000000 00000000

p0_label_447:
!	Mem[0000000030041408] = 00000006 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i1+%o4]0x81,%l6	! %l6 = 0000000000000006 0000000000000000
	membar	#Sync			! Added by membar checker (70)
!	Mem[0000000030141400] = ff0000ff 09ca5f71 9f65dd20 00000000
!	Mem[0000000030141410] = 0000ff80 52ff00ff 201d0000 ff010000
!	Mem[0000000030141420] = 00000000 ff000000 9f0000ff 00000000
!	Mem[0000000030141430] = 0000ff00 00000000 7e000000 00000000
	ldda	[%i5]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030141400
!	%f29 = 00ff0000, %f21 = 00000050, %f16 = 00000000 00000000
	fsmuld	%f29,%f21,%f16		! %l0 = ffffffff000090d7, Unfinished, %fsr = 2a00000000
!	Mem[0000000010181400] = 00000000, %l3 = ffffffffffffffff
	lduwa	[%i6+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = 180c0000, %l0 = ffffffff000090d7
	ldsba	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000018
!	Mem[0000000010181408] = 9390fd94, %l4 = 0000000000000000
	ldsha	[%i6+%o4]0x80,%l4	! %l4 = ffffffffffff9390
!	Mem[0000000030001400] = 00000a30 00000000, %l0 = 00000018, %l1 = 000000ff
	ldda	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000a30 0000000000000000
!	Mem[0000000010081408] = ffffffff, %l6 = 0000000000000006
	ldsha	[%i2+%o4]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081428] = 000001ff, %l2 = 00000000000000ff
	lduh	[%i2+0x02a],%l2		! %l2 = 00000000000001ff
!	Starting 10 instruction Store Burst
!	%l2 = 000001ff, %l3 = 00000000, Mem[0000000010181410] = 000000ff 52ff00ff
	stda	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 000001ff 00000000

p0_label_448:
!	%f20 = 00000000 00000050, %l0 = 0000000000000a30
!	Mem[0000000010041428] = 0000004900000000
	add	%i1,0x028,%g1
	stda	%f20,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010041428] = 0000004900000000
!	Mem[00000000100c1400] = 00000000, %l5 = 000000000000ffff
	ldstuba	[%i3+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000010181408] = 9390fd94
	stwa	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000
!	Mem[0000000030041400] = 00000000, %l4 = ffffffffffff9390
	ldstuba	[%i1+%g0]0x81,%l4	! %l4 = 00000000000000ff
	membar	#Sync			! Added by membar checker (71)
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030141410] = 80ff0000 ff00ff52
	stda	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000 00000000
!	%l0 = 0000000000000a30, Mem[0000000010141408] = 000000ff
	stba	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000030
!	%l1 = 0000000000000000, Mem[0000000010001400] = ffffffff
	stwa	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	%l5 = 0000000000000000, %l5 = 0000000000000000, %y  = 94fd9093
	sdiv	%l5,%l5,%l2		! Div by zero, %l0 = 0000000000000a80
	mov	%l0,%y			! %y = 00000a58
!	%l0 = 0000000000000a58, Mem[0000000010081410] = 00000000
	stwa	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000a58
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 715fca0900000000, %l2 = 00000000000001ff
	ldxa	[%i2+%g0]0x88,%l2	! %l2 = 715fca0900000000

p0_label_449:
!	Mem[0000000010101420] = 00000000, %l5 = 0000000000000000
	ldsb	[%i4+0x022],%l5		! %l5 = 0000000000000000
!	Mem[0000000030141400] = ff0000ff09ca5f71, %f0  = 715fca09 ff0000ff
	ldda	[%i5+%g0]0x81,%f0 	! %f0  = ff0000ff 09ca5f71
!	Mem[0000000030081408] = 00000000000063ff, %f8  = 000000ff 00000000
	ldda	[%i2+%o4]0x81,%f8 	! %f8  = 00000000 000063ff
!	Mem[0000000030181408] = 00000055 17a27aa7, %l6 = ffffffff, %l7 = 00000000
	ldda	[%i6+%o4]0x81,%l6	! %l6 = 0000000000000055 0000000017a27aa7
!	Mem[00000000100c1400] = 000000ff, %l7 = 0000000017a27aa7
	ldsba	[%i3+%g0]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181428] = 0000004900000000, %f28 = 00000000 00ff0000
	ldda	[%i6+0x028]%asi,%f28	! %f28 = 00000049 00000000
!	Mem[0000000010001428] = ffbf607e, %f6  = 000001ff
	ld	[%i0+0x028],%f6 	! %f6 = ffbf607e
!	Mem[0000000010141430] = 000000ff, %l2 = 715fca0900000000
	ldsha	[%i5+0x032]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1410] = ff0000ff, %l6 = 0000000000000055
	ldsba	[%i3+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[000000001014140c] = 49000000, %l6 = ffffffffffffffff
	ldstuba	[%i5+0x00c]%asi,%l6	! %l6 = 00000049000000ff

p0_label_450:
!	%l4 = 00000000, %l5 = 00000000, Mem[00000000100c1400] = ff000000 ffff0000
	stda	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000 00000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030101408] = 000000ff ffff0000
	stda	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 00000000
!	%l7 = ffffffffffffffff, Mem[00000000100c143c] = 00000000
	stw	%l7,[%i3+0x03c]		! Mem[00000000100c143c] = ffffffff
!	%l0 = 0000000000000a58, Mem[0000000030001410] = 52ff00ff
	stwa	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000a58
!	Mem[00000000100c1400] = 00000000, %l7 = ffffffffffffffff
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141400] = 80ff0000, %l3 = 0000000000000000
	ldstuba	[%i5+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081408] = ffffffff, %l4 = 0000000000000000, %asi = 80
	swapa	[%i2+0x008]%asi,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000010101408] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i4+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	%f24 = 00000000 20dd659f, %l4 = 00000000ffffffff
!	Mem[0000000010081420] = 0000000000000000
	add	%i2,0x020,%g1
	stda	%f24,[%g1+%l4]ASI_PST8_P ! Mem[0000000010081420] = 0000000020dd659f
!	Starting 10 instruction Load Burst
!	Mem[000000001014141c] = 300a0000, %l0 = 0000000000000a58
	ldsw	[%i5+0x01c],%l0		! %l0 = 00000000300a0000

p0_label_451:
!	Mem[0000000010101408] = 50000000 000000ff, %l0 = 300a0000, %l1 = 00000000
	ldda	[%i4+%o4]0x88,%l0	! %l0 = 00000000000000ff 0000000050000000
!	Mem[0000000030141408] = 9f65dd2000000000, %f4  = ff00ff52 80ff0000
	ldda	[%i5+%o4]0x81,%f4 	! %f4  = 9f65dd20 00000000
!	Mem[0000000010101400] = ff6c987a d2e1caeb, %l6 = 00000049, %l7 = 00000000
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 00000000ff6c987a 00000000d2e1caeb
!	%l1 = 0000000050000000, %l3 = 0000000000000000, %l0 = 00000000000000ff
	subc	%l1,%l3,%l0		! %l0 = 0000000050000000
!	Mem[0000000010141408] = 30000000ff000000, %l5 = 0000000000000000
	ldxa	[%i5+%o4]0x80,%l5	! %l5 = 30000000ff000000
!	Mem[00000000100c1400] = ff000000, %l7 = 00000000d2e1caeb
	lduba	[%i3+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Code Fragment 3
p0_fragment_43:
!	%l0 = 0000000050000000
	setx	0x4903ed282b1cb4b8,%g7,%l0 ! %l0 = 4903ed282b1cb4b8
!	%l1 = 0000000050000000
	setx	0x376000f87c619152,%g7,%l1 ! %l1 = 376000f87c619152
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4903ed282b1cb4b8
	setx	0x809a79bff7cca637,%g7,%l0 ! %l0 = 809a79bff7cca637
!	%l1 = 376000f87c619152
	setx	0xbb107d4ff5b52a24,%g7,%l1 ! %l1 = bb107d4ff5b52a24
!	Mem[0000000030141408] = 9f65dd2000000000, %l4 = 00000000ffffffff
	ldxa	[%i5+%o4]0x81,%l4	! %l4 = 9f65dd2000000000
!	Mem[0000000010081400] = 00000000, %l6 = 00000000ff6c987a
	lduwa	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f5  = 00000000, Mem[0000000030001410] = 00000a58
	sta	%f5 ,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000

p0_label_452:
!	Mem[0000000010081400] = 00000000, %l0 = 809a79bff7cca637
	swapa	[%i2+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%f24 = 00000000, Mem[0000000030101410] = ffffffff
	sta	%f24,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	Mem[0000000010081408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i2+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	%f25 = 20dd659f, Mem[0000000010141410] = ff0000ff
	sta	%f25,[%i5+%o5]0x80	! Mem[0000000010141410] = 20dd659f
!	Mem[0000000010041410] = 00000000, %l6 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l1 = bb107d4ff5b52a24
	swapa	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
!	%l6 = 0000000000000000, Mem[00000000300c1410] = 00000000
	stha	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	Mem[0000000030101400] = ff00009f, %l4 = 9f65dd2000000000
	swapa	[%i4+%g0]0x81,%l4	! %l4 = 00000000ff00009f
!	%l5 = 30000000ff000000, Mem[0000000030081410] = 0000ffff
	stba	%l5,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000ff00
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 6cffffff, %l2 = 0000000000000000
	lduba	[%i2+%g0]0x89,%l2	! %l2 = 00000000000000ff

p0_label_453:
!	Mem[0000000030041408] = 0000000600000000, %l1 = 0000000000000000
	ldxa	[%i1+%o4]0x81,%l1	! %l1 = 0000000600000000
!	Mem[0000000030001400] = 00000a30, %l1 = 0000000600000000
	lduha	[%i0+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l0 = 0000000000000000
	lduba	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141408] = 30000000ff000000, %l5 = 30000000ff000000
	ldxa	[%i5+%o4]0x80,%l5	! %l5 = 30000000ff000000
!	Mem[0000000010101410] = 0000ff00 00000000, %l4 = ff00009f, %l5 = ff000000
	ldda	[%i4+%o5]0x88,%l4	! %l4 = 0000000000000000 000000000000ff00
!	Mem[00000000100c1400] = 000000ff, %l3 = 0000000000000000
	lduba	[%i3+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1408] = ff00000000000000, %l0 = 0000000000000000
	ldxa	[%i3+%o4]0x89,%l0	! %l0 = ff00000000000000
!	Mem[0000000030181408] = 55000000, %l2 = 00000000000000ff
	ldsha	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101410] = 0000000000ff0000, %l7 = 00000000000000ff
	ldxa	[%i4+%o5]0x80,%l7	! %l7 = 0000000000ff0000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i5+%o5]0x81,%l1	! %l1 = 00000000000000ff

p0_label_454:
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000030041410] = ffffff00 ffffffff
	stda	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000 00000000
!	%f6  = ffbf607e, Mem[0000000010141420] = 00000000
	st	%f6 ,[%i5+0x020]	! Mem[0000000010141420] = ffbf607e
!	%l4 = 0000000000000000, Mem[0000000030101400] = 0000000000000000
	stxa	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000000000
!	Mem[0000000010181400] = 242ab5f5, %l2 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l2	! %l2 = 00000000242ab5f5
!	%f12 = 00000000 00ff0000, %l0 = ff00000000000000
!	Mem[0000000010101438] = ff000000ffffffff
	add	%i4,0x038,%g1
	stda	%f12,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010101438] = ff000000ffffffff
!	Mem[0000000030141410] = ff000000, %l7 = 0000000000ff0000
	swapa	[%i5+%o5]0x81,%l7	! %l7 = 00000000ff000000
!	Mem[00000000201c0001] = 00ff4c08, %l7 = 00000000ff000000
	ldstub	[%o0+0x001],%l7		! %l7 = 000000ff000000ff
!	%l1 = 0000000000000000, %l5 = 000000000000ff00, %y  = 00000a58
	smul	%l1,%l5,%l6		! %l6 = 0000000000000000, %y = 00000000
!	Mem[0000000010181400] = 00000000, %l6 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff000000, %l4 = 0000000000000000
	ldsha	[%i4+%o4]0x80,%l4	! %l4 = ffffffffffffff00

p0_label_455:
!	Mem[0000000010181410] = 000001ff 00000000, %l2 = 242ab5f5, %l3 = 000000ff
	ldda	[%i6+%o5]0x80,%l2	! %l2 = 00000000000001ff 0000000000000000
!	Mem[0000000030041410] = 0000000000000000, %f22 = 00000000 00000000
	ldda	[%i1+%o5]0x81,%f22	! %f22 = 00000000 00000000
!	Mem[0000000010081410] = 00000000 00000a58, %l2 = 000001ff, %l3 = 00000000
	ldda	[%i2+%o5]0x88,%l2	! %l2 = 0000000000000a58 0000000000000000
!	Mem[00000000201c0000] = 00ff4c08, %l1 = 0000000000000000
	lduh	[%o0+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %l5 = 000000000000ff00
	ldsba	[%i6+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l2 = 0000000000000a58
	lduha	[%i3+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %l2 = 0000000000000000
	lduha	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041430] = 0000ff0000000000, %f4  = 9f65dd20 00000000
	ldd	[%i1+0x030],%f4 	! %f4  = 0000ff00 00000000
!	Mem[0000000030101408] = 00000000 00000000, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i4+%o4]0x89,%l0	! %l0 = 0000000000000000 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 00000000, %l5 = 0000000000000000
	swapa	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000

p0_label_456:
!	%l0 = 0000000000000000, Mem[0000000010001410] = 180c000000ffffff
	stxa	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[00000000100c1410] = ff0000ff
	stba	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff000000
!	%l4 = ffffffffffffff00, Mem[0000000010041408] = 00000000
	stha	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000ff00
!	Mem[0000000030141410] = 00ff0000, %l0 = 0000000000000000
	ldstuba	[%i5+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000030001410] = 0000000080ff0000
	stxa	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000000000000
!	%f8  = 00000000 000063ff, Mem[0000000010081410] = 580a0000 00000000
	stda	%f8 ,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000 000063ff
!	%l6 = 0000000000000000, Mem[0000000030081410] = 000000000000ff00
	stxa	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000030081410] = 0000000000000000
	stxa	%l5,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ff0000ff, %l2 = 0000000000000000
	ldsha	[%i5+%g0]0x81,%l2	! %l2 = ffffffffffffff00

p0_label_457:
!	Mem[0000000030181408] = 55000000, %l5 = 0000000000000000
	lduba	[%i6+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = 00000022, %l1 = 0000000000000000
	lduba	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181410] = 000001ff, %l2 = ffffffffffffff00
	ldswa	[%i6+%o5]0x80,%l2	! %l2 = 00000000000001ff
!	Mem[0000000010081400] = 37a6ccf709ca5f71, %l6 = 0000000000000000
	ldxa	[%i2+%g0]0x80,%l6	! %l6 = 37a6ccf709ca5f71
!	Mem[0000000010041400] = 96070000300a0000, %f30 = 52ff00ff ff0000ff
	ldda	[%i1+%g0]0x88,%f30	! %f30 = 96070000 300a0000
!	Mem[00000000201c0000] = 00ff4c08, %l4 = ffffffffffffff00
	ldsb	[%o0+%g0],%l4		! %l4 = 0000000000000000
!	Mem[0000000030081410] = 00000000 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[00000000300c1408] = ff000000, %l3 = 0000000000000000
	lduha	[%i3+%o4]0x81,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010001410] = 00000000, %l6 = 37a6ccf709ca5f71
	lduba	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[00000000300c1400] = 00000022
	stba	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000022

p0_label_458:
!	%l0 = 0000000000000000, Mem[0000000010081408] = ffffffff000000ff
	stxa	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000000000000000
!	%f28 = 00000049 00000000, Mem[0000000010101410] = 00000000 0000ff00
	stda	%f28,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000049 00000000
!	Mem[0000000030101400] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i4+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	%l3 = 000000000000ff00, Mem[0000000030181410] = 000000ff
	stha	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000ff00
!	%f26 = 00000000 49000000, Mem[0000000010001410] = 00000000 00000000
	stda	%f26,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 49000000
!	%f1  = 09ca5f71, Mem[0000000010041410] = 00000000
	sta	%f1 ,[%i1+%o5]0x88	! Mem[0000000010041410] = 09ca5f71
!	%f0  = ff0000ff 09ca5f71, %l1 = 0000000000000000
!	Mem[0000000030101408] = 0000000000000000
	add	%i4,0x008,%g1
	stda	%f0,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030101408] = 0000000000000000
!	Mem[0000000030081408] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%l3 = 000000000000ff00, Mem[0000000010001410] = 00000049
	stha	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = ff000049
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 000001ff, %l4 = 0000000000000000
	ldsha	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000000

p0_label_459:
!	%l0 = 0000000000000000, %l3 = 000000000000ff00, %l0 = 0000000000000000
	udivx	%l0,%l3,%l0		! %l0 = 0000000000000000
!	Mem[0000000010041414] = 49000000, %l1 = 0000000000000000
	ldsw	[%i1+0x014],%l1		! %l1 = 0000000049000000
!	Mem[0000000010101410] = 00000000, %l5 = 0000000000000000
	lduwa	[%i4+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l6 = 0000000000000000
	lduha	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	%l5 = 0000000000000000, %l6 = 0000000000000000, %y  = 00000000
	sdiv	%l5,%l6,%l5		! Div by zero, %l0 = 0000000000000050
	mov	%l0,%y			! %y = 00000028
!	Mem[0000000010041410] = 09ca5f71, %l1 = 0000000049000000
	lduwa	[%i1+%o5]0x88,%l1	! %l1 = 0000000009ca5f71
!	Mem[0000000030001410] = 00000000, %l4 = 0000000000000000
	lduwa	[%i0+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001410] = 00000000, %l4 = 0000000000000000
	ldswa	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = 000000ff 000000ff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i3+%o5]0x80,%l4	! %l4 = 00000000000000ff 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 00ff00000000ffff, %l6 = 0000000000000000, %l7 = 0000000000000000
	add	%i1,0x08,%g1
	casxa	[%g1]0x80,%l6,%l7	! %l7 = 00ff00000000ffff

p0_label_460:
!	Mem[0000000010081430] = 00000000000063ff, %l4 = 00000000000000ff, %l2 = 00000000000001ff
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l4,%l2	! %l2 = 00000000000063ff
!	Mem[0000000030041408] = 06000000, %l5 = 00000000000000ff
	ldstuba	[%i1+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%l2 = 000063ff, %l3 = 0000ff00, Mem[0000000030081408] = ff000000 000063ff
	stda	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 000063ff 0000ff00
!	Mem[00000000100c143f] = ffffffff, %l6 = 0000000000000000
	ldstuba	[%i3+0x03f]%asi,%l6	! %l6 = 000000ff000000ff
!	%l3 = 000000000000ff00, Mem[0000000010181400] = 0000000009ca5f71
	stxa	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000000000ff00
!	%l1 = 0000000009ca5f71, Mem[0000000010081408] = 00000000
	stba	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 71000000
!	%f28 = 00000049 00000000, %l2 = 00000000000063ff
!	Mem[0000000030141428] = 9f0000ff00000000
	add	%i5,0x028,%g1
	stda	%f28,[%g1+%l2]ASI_PST32_S ! Mem[0000000030141428] = 0000004900000000
!	%f0  = ff0000ff 09ca5f71 00000000 20dd659f
!	%f4  = 0000ff00 00000000 ffbf607e 00001d20
!	%f8  = 00000000 000063ff 00000000 ff00009f
!	%f12 = 00000000 00ff0000 00000000 0000007e
	stda	%f0,[%i3]ASI_BLK_SL	! Block Store to 00000000300c1400
!	%l6 = 00000000000000ff, %l5 = 0000000000000000, %y  = 00000028
	smul	%l6,%l5,%l5		! %l5 = 0000000000000000, %y = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041430] = 0000ff00, %l2 = 00000000000063ff
	ldswa	[%i1+0x030]%asi,%l2	! %l2 = 000000000000ff00

p0_label_461:
!	Mem[0000000010101408] = 50000000 000000ff, %l2 = 0000ff00, %l3 = 0000ff00
	ldda	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff 0000000050000000
!	Mem[0000000030141400] = ff0000ff, %l1 = 0000000009ca5f71
	ldswa	[%i5+%g0]0x89,%l1	! %l1 = ffffffffff0000ff
!	Mem[0000000010181410] = ff010000, %l1 = ffffffffff0000ff
	ldsba	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800040] = ffffc1d1, %l5 = 0000000000000000
	lduh	[%o1+0x040],%l5		! %l5 = 000000000000ffff
	membar	#Sync			! Added by membar checker (72)
!	Mem[00000000300c1400] = 715fca09, %l7 = 00ff00000000ffff
	ldswa	[%i3+%g0]0x81,%l7	! %l7 = 00000000715fca09
!	Mem[0000000030181410] = 00ff0000, %l4 = 00000000000000ff
	lduba	[%i6+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001430] = 34afe96f94fd9093, %l1 = 0000000000000000
	ldx	[%i0+0x030],%l1		! %l1 = 34afe96f94fd9093
!	Mem[000000001014140c] = ff000000, %l5 = 000000000000ffff
	ldswa	[%i5+0x00c]%asi,%l5	! %l5 = ffffffffff000000
!	Mem[0000000010181400] = 00000000 0000ff00 00000000 ffff0000
!	Mem[0000000010181410] = 000001ff 00000000 201d0000 ff010000
!	Mem[0000000010181420] = 00000000 ff000000 00000049 00000000
!	Mem[0000000010181430] = 0000ff00 00000000 7e000000 ff000000
	ldda	[%i6]ASI_BLK_P,%f16	! Block Load from 0000000010181400
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000ff

p0_label_462:
!	Mem[00000000300c1408] = 9f65dd20, %l7 = 00000000715fca09
	ldstuba	[%i3+%o4]0x81,%l7	! %l7 = 0000009f000000ff
!	Mem[0000000030181400] = 00000000, %l6 = 00000000000000ff
	swapa	[%i6+%g0]0x89,%l6	! %l6 = 0000000000000000
!	%f0  = ff0000ff 09ca5f71, %l3 = 0000000050000000
!	Mem[0000000030141408] = 9f65dd2000000000
	add	%i5,0x008,%g1
	stda	%f0,[%g1+%l3]ASI_PST16_SL ! Mem[0000000030141408] = 9f65dd2000000000
!	%l2 = 00000000, %l3 = 50000000, Mem[0000000010101408] = ff000000 00000050
	std	%l2,[%i4+%o4]		! Mem[0000000010101408] = 00000000 50000000
!	%f9  = 000063ff, Mem[000000001000141c] = 00000000
	st	%f9 ,[%i0+0x01c]	! Mem[000000001000141c] = 000063ff
!	%f4  = 0000ff00, Mem[00000000300c1400] = 715fca09
	sta	%f4 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000ff00
!	%f0  = ff0000ff 09ca5f71, Mem[0000000010101430] = 00000000 00ff0000
	stda	%f0 ,[%i4+0x030]%asi	! Mem[0000000010101430] = ff0000ff 09ca5f71
!	%l0 = 00000028, %l1 = 94fd9093, Mem[0000000010101408] = 00000000 50000000
	std	%l0,[%i4+%o4]		! Mem[0000000010101408] = 00000028 94fd9093
!	%l3 = 0000000050000000, Mem[0000000030141400] = ff0000ff
	stba	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 000063ff0000ff00, %l1 = 34afe96f94fd9093
	ldxa	[%i2+%o4]0x81,%l1	! %l1 = 000063ff0000ff00

p0_label_463:
!	Mem[0000000030101400] = 00000000000000ff, %f12 = 00000000 00ff0000
	ldda	[%i4+%g0]0x89,%f12	! %f12 = 00000000 000000ff
!	Mem[0000000010001400] = 0000000000000000, %f2  = 00000000 20dd659f
	ldda	[%i0+%g0]0x80,%f2 	! %f2  = 00000000 00000000
!	Mem[00000000100c1434] = 203504f3, %l7 = 000000000000009f
	ldswa	[%i3+0x034]%asi,%l7	! %l7 = 00000000203504f3
!	Mem[0000000030001410] = 00000000, %f9  = 000063ff
	lda	[%i0+%o5]0x89,%f9 	! %f9 = 00000000
!	Mem[0000000010041434] = 00000000, %l5 = ffffffffff000000
	lduba	[%i1+0x034]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181410] = 000001ff, %l7 = 00000000203504f3
	ldsha	[%i6+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000021800000] = 00fff103, %l0 = 0000000000000028
	lduh	[%o3+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030041410] = 00000000000000ff, %f10 = 00000000 ff00009f
	ldda	[%i1+%o5]0x89,%f10	! %f10 = 00000000 000000ff
!	Mem[0000000010141404] = 52ff0000, %l7 = 0000000000000000
	ldswa	[%i5+0x004]%asi,%l7	! %l7 = 0000000052ff0000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, %l3 = 0000000050000000, %l6 = 0000000000000000
	xnor	%l0,%l3,%l6		! %l6 = ffffffffafffff00

p0_label_464:
!	Mem[0000000021800140] = ffff05d8, %l2 = 0000000000000000
	ldstub	[%o3+0x140],%l2		! %l2 = 000000ff000000ff
!	Mem[0000000020800001] = ffffba64, %l4 = 0000000000000000
	ldstub	[%o1+0x001],%l4		! %l4 = 000000ff000000ff
!	%f14 = 00000000, Mem[0000000010041410] = 715fca09
	sta	%f14,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	%f10 = 00000000 000000ff, %l0 = 00000000000000ff
!	Mem[00000000100c1420] = ffffffffffffffac
	add	%i3,0x020,%g1
	stda	%f10,[%g1+%l0]ASI_PST32_P ! Mem[00000000100c1420] = 00000000000000ff
!	Mem[0000000010001430] = 34afe96f94fd9093, %l5 = 0000000000000000, %l5 = 0000000000000000
	add	%i0,0x30,%g1
	casxa	[%g1]0x80,%l5,%l5	! %l5 = 34afe96f94fd9093
!	Mem[0000000030081410] = 00000000, %l1 = 000063ff0000ff00
	ldstuba	[%i2+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	%f14 = 00000000 0000007e, Mem[0000000010101408] = 28000000 9390fd94
	stda	%f14,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000 0000007e
!	Mem[00000000300c1400] = 0000ff00, %l3 = 0000000050000000
	ldstuba	[%i3+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000010141410] = 52ff00ff9f65dd20
	stxa	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 000000ff, %l0 = 00000000000000ff
	ldsba	[%i1+%g0]0x89,%l0	! %l0 = ffffffffffffffff

p0_label_465:
!	Mem[00000000300c1400] = ff00ff00, %l1 = 0000000000000000
	ldswa	[%i3+%g0]0x81,%l1	! %l1 = ffffffffff00ff00
!	Mem[0000000010041408] = ffff00000000ff00, %l5 = 34afe96f94fd9093
	ldxa	[%i1+%o4]0x88,%l5	! %l5 = ffff00000000ff00
!	%l2 = 00000000000000ff, %l1 = ffffffffff00ff00, %l0 = ffffffffffffffff
	or	%l2,%l1,%l0		! %l0 = ffffffffff00ffff
!	Mem[00000000300c1408] = 20dd65ff, %l2 = 00000000000000ff
	ldswa	[%i3+%o4]0x89,%l2	! %l2 = 0000000020dd65ff
!	Mem[0000000010141410] = 00000000000000ff, %l4 = 00000000000000ff
	ldxa	[%i5+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001400] = 00000000 300a0000, %l0 = ff00ffff, %l1 = ff00ff00
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 00000000300a0000 0000000000000000
!	Mem[0000000030101400] = ff000000, %l2 = 0000000020dd65ff
	lduwa	[%i4+%g0]0x81,%l2	! %l2 = 00000000ff000000
!	Mem[00000000300c1400] = ff00ff00 ff0000ff, %l2 = ff000000, %l3 = 00000000
	ldda	[%i3+%g0]0x81,%l2	! %l2 = 00000000ff00ff00 00000000ff0000ff
!	%l4 = 00000000000000ff, imm = fffffffffffffc94, %l1 = 0000000000000000
	addc	%l4,-0x36c,%l1		! %l1 = fffffffffffffd93
!	Starting 10 instruction Store Burst
!	%f2  = 00000000 00000000, Mem[0000000010141428] = 00000000 00000000
	stda	%f2 ,[%i5+0x028]%asi	! Mem[0000000010141428] = 00000000 00000000

p0_label_466:
!	Mem[0000000030141408] = 9f65dd20, %l5 = ffff00000000ff00
	swapa	[%i5+%o4]0x81,%l5	! %l5 = 000000009f65dd20
!	%f6  = ffbf607e 00001d20, %l5 = 000000009f65dd20
!	Mem[0000000030081420] = 00000049ff010000
	add	%i2,0x020,%g1
	stda	%f6,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030081420] = 00000049ff600000
!	%l4 = 00000000000000ff, Mem[00000000100c1400] = ff00000000000000
	stxa	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000000000ff
!	Mem[00000000100c1408] = 7e000000, %l4 = 00000000000000ff, %asi = 80
	swapa	[%i3+0x008]%asi,%l4	! %l4 = 000000007e000000
!	%l2 = ff00ff00, %l3 = ff0000ff, Mem[0000000030081408] = ff630000 00ff0000
	stda	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = ff00ff00 ff0000ff
!	Mem[0000000010181400] = 00000000, %l2 = 00000000ff00ff00
	ldstuba	[%i6+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	%f28 = 0000ff00 00000000, Mem[0000000030101408] = 00000000 00000000
	stda	%f28,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000ff00 00000000
!	%l2 = 0000000000000000, Mem[0000000030101408] = 00000000
	stwa	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	%l1 = fffffffffffffd93, Mem[0000000020800040] = ffffc1d1
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040] = fd93c1d1
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff85d2, %l6 = ffffffffafffff00
	ldub	[%o2+0x001],%l6		! %l6 = 00000000000000ff

p0_label_467:
!	%f17 = 0000ff00, %f6  = ffbf607e
	fcmps	%fcc2,%f17,%f6 		! %fcc2 = 3
!	Mem[0000000030141400] = 715fca09ff000000, %f14 = 00000000 0000007e
	ldda	[%i5+%g0]0x89,%f14	! %f14 = 715fca09 ff000000
!	Mem[0000000010141420] = ffbf607e000000ff, %l5 = 000000009f65dd20
	ldx	[%i5+0x020],%l5		! %l5 = ffbf607e000000ff
!	Mem[0000000010101408] = 7e00000000000000, %f30 = 7e000000 ff000000
	ldda	[%i4+%o4]0x80,%f30	! %f30 = 7e000000 00000000
!	Mem[0000000010041420] = 00000000, %f11 = 000000ff
	lda	[%i1+0x020]%asi,%f11	! %f11 = 00000000
!	Mem[00000000100c1400] = 00000000, %l4 = 000000007e000000
	lduwa	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000021800100] = ffff8676, %l5 = ffbf607e000000ff
	ldub	[%o3+0x101],%l5		! %l5 = 00000000000000ff
!	%l7 = 0000000052ff0000, %l2 = 0000000000000000, %y  = 00000000
	umul	%l7,%l2,%l6		! %l6 = 0000000000000000, %y = 00000000
!	Mem[00000000211c0000] = ffff85d2, %l2 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000030101400] = 00000000000000ff
	stxa	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000000000000000

p0_label_468:
!	Mem[0000000010001410] = ff000049, %l0 = 00000000300a0000
	ldstuba	[%i0+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[0000000010001410] = ff000049
	stwa	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000ff
!	%l2 = 0000ffff, %l3 = ff0000ff, Mem[00000000100c1408] = ff000000 00000000
	stda	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000ffff ff0000ff
!	%f30 = 7e000000 00000000, Mem[0000000030181400] = 000000ff 000000ff
	stda	%f30,[%i6+%g0]0x89	! Mem[0000000030181400] = 7e000000 00000000
!	Mem[0000000030141408] = 00ff0000, %l2 = 000000000000ffff
	swapa	[%i5+%o4]0x89,%l2	! %l2 = 0000000000ff0000
!	%l7 = 0000000052ff0000, Mem[00000000300c1408] = 20dd65ff
	stwa	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 52ff0000
!	%f16 = 00000000 0000ff00 00000000 ffff0000
!	%f20 = 000001ff 00000000 201d0000 ff010000
!	%f24 = 00000000 ff000000 00000049 00000000
!	%f28 = 0000ff00 00000000 7e000000 00000000
	stda	%f16,[%i5]ASI_BLK_AIUPL	! Block Store to 0000000010141400
!	Mem[0000000030081410] = ff000000, %l1 = fffffffffffffd93
	ldstuba	[%i2+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010101408] = 0000007e, %l2 = 0000000000ff0000
	ldstuba	[%i4+%o4]0x88,%l2	! %l2 = 0000007e000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ff000000, %l1 = 00000000000000ff
	lduba	[%i0+%o4]0x81,%l1	! %l1 = 00000000000000ff

p0_label_469:
!	Mem[00000000300c1400] = ff00ff00, %l1 = 00000000000000ff
	ldsha	[%i3+%g0]0x81,%l1	! %l1 = ffffffffffffff00
!	%l1 = ffffffffffffff00, imm = fffffffffffffccd, %l3 = 00000000ff0000ff
	xnor	%l1,-0x333,%l3		! %l3 = fffffffffffffc32
!	Mem[00000000100c1400] = ff00000000000000, %f0  = ff0000ff 09ca5f71
	ldda	[%i3+%g0]0x88,%f0 	! %f0  = ff000000 00000000
!	Mem[0000000010041408] = 00ff0000, %l3 = fffffffffffffc32
	ldsba	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041410] = 0000004900000000, %l2 = 000000000000007e
	ldxa	[%i1+%o5]0x88,%l2	! %l2 = 0000004900000000
!	Mem[00000000100c1408] = ff0000ff0000ffff, %l5 = 00000000000000ff
	ldxa	[%i3+%o4]0x88,%l5	! %l5 = ff0000ff0000ffff
!	Mem[00000000100c1400] = 00000000, %l3 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181424] = ff000000, %f0  = ff000000
	ld	[%i6+0x024],%f0 	! %f0 = ff000000
!	Mem[0000000030141400] = ff000000, %f13 = 000000ff
	lda	[%i5+%g0]0x89,%f13	! %f13 = ff000000
!	Starting 10 instruction Store Burst
!	%l5 = ff0000ff0000ffff, Mem[0000000010001400] = 00000000
	stba	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff

p0_label_470:
!	Mem[0000000010041400] = 300a0000, %l3 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l3	! %l3 = 00000000300a0000
!	%l2 = 00000000, %l3 = 300a0000, Mem[0000000010041428] = 00000049 00000000
	std	%l2,[%i1+0x028]		! Mem[0000000010041428] = 00000000 300a0000
!	Code Fragment 4
p0_fragment_44:
!	%l0 = 00000000000000ff
	setx	0x15cfbca80f38f60e,%g7,%l0 ! %l0 = 15cfbca80f38f60e
!	%l1 = ffffffffffffff00
	setx	0xd9bf62086e0ca51d,%g7,%l1 ! %l1 = d9bf62086e0ca51d
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 15cfbca80f38f60e
	setx	0x4a0c1a8ff58d321f,%g7,%l0 ! %l0 = 4a0c1a8ff58d321f
!	%l1 = d9bf62086e0ca51d
	setx	0x773dd3cf805faecc,%g7,%l1 ! %l1 = 773dd3cf805faecc
!	%f2  = 00000000 00000000, %l2 = 0000004900000000
!	Mem[0000000010041428] = 00000000300a0000
	add	%i1,0x028,%g1
	stda	%f2,[%g1+%l2]ASI_PST16_P ! Mem[0000000010041428] = 00000000300a0000
!	%l3 = 00000000300a0000, Mem[0000000030081400] = 6cffffff
	stha	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = 6cff0000
!	Mem[0000000030001408] = ff000000, %l0 = 4a0c1a8ff58d321f
	ldstuba	[%i0+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	%f0  = ff000000 00000000, Mem[0000000030181410] = 0000ff00 ac990448
	stda	%f0 ,[%i6+%o5]0x89	! Mem[0000000030181410] = ff000000 00000000
!	%f4  = 0000ff00 00000000, %l5 = ff0000ff0000ffff
!	Mem[0000000010141410] = 00000000ff010000
	add	%i5,0x010,%g1
	stda	%f4,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010141410] = 0000000000ff0000
!	Mem[00000000300c1400] = 00ff00ff, %l1 = 773dd3cf805faecc
	swapa	[%i3+%g0]0x89,%l1	! %l1 = 0000000000ff00ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00ff00ff, %f16 = 00000000
	lda	[%i2+%o4]0x81,%f16	! %f16 = 00ff00ff

p0_label_471:
!	%f11 = 00000000, %f24 = 00000000, %f20 = 000001ff
	fadds	%f11,%f24,%f20		! %f20 = 00000000
!	Mem[0000000030041410] = 00000000 000000ff, %l6 = 00000000, %l7 = 52ff0000
	ldda	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Mem[0000000010081400] = 37a6ccf7, %l2 = 0000004900000000
	ldswa	[%i2+%g0]0x80,%l2	! %l2 = 0000000037a6ccf7
!	Mem[00000000300c1408] = 52ff0000, %l4 = 0000000000000000
	lduwa	[%i3+%o4]0x89,%l4	! %l4 = 0000000052ff0000
!	Mem[0000000030101408] = 00000000, %l4 = 0000000052ff0000
	lduha	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000211c0000] = ffff85d2, %l4 = 0000000000000000
	lduba	[%o2+0x001]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041418] = 201d0000, %l0 = 00000000000000ff
	ldsba	[%i1+0x01b]%asi,%l0	! %l0 = 0000000000000000
!	%l3 = 00000000300a0000, %l7 = 0000000000000000, %l1  = 0000000000ff00ff
	mulx	%l3,%l7,%l1		! %l1 = 0000000000000000
!	Mem[00000000211c0000] = ffff85d2, %l4 = 00000000000000ff
	lduha	[%o2+0x000]%asi,%l4	! %l4 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000030081400] = 6cff0000
	stwa	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000

p0_label_472:
!	%l4 = 0000ffff, %l5 = 0000ffff, Mem[0000000010001408] = ffffffff ffffffff
	stda	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000ffff 0000ffff
!	Mem[00000000300c1408] = 0000ff52, %l7 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[0000000010101408] = 000000ff
	stwa	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000ff
!	%l6 = 00000000000000ff, Mem[0000000021800181] = 4b00bd9f
	stb	%l6,[%o3+0x181]		! Mem[0000000021800180] = 4bffbd9f
!	%f0  = ff000000 00000000 00000000 00000000
!	%f4  = 0000ff00 00000000 ffbf607e 00001d20
!	%f8  = 00000000 00000000 00000000 00000000
!	%f12 = 00000000 ff000000 715fca09 ff000000
	stda	%f0,[%i4]ASI_BLK_P	! Block Store to 0000000010101400
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000010141408] = 0000ffff 00000000
	std	%l6,[%i5+%o4]		! Mem[0000000010141408] = 000000ff 00000000
	membar	#Sync			! Added by membar checker (73)
!	Mem[0000000010101408] = 00000000, %l3 = 00000000300a0000
	ldstuba	[%i4+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000010041408] = 00ff0000 0000ffff
	stda	%l6,[%i1+0x008]%asi	! Mem[0000000010041408] = 000000ff 00000000
!	%l6 = 00000000000000ff, Mem[0000000020800040] = fd93c1d1
	sth	%l6,[%o1+0x040]		! Mem[0000000020800040] = 00ffc1d1
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ffffba64, %l4 = 000000000000ffff
	lduba	[%o1+0x001]%asi,%l4	! %l4 = 00000000000000ff

p0_label_473:
!	Mem[0000000010081410] = 00000000000063ff, %l0 = 0000000000000000
	ldxa	[%i2+%o5]0x80,%l0	! %l0 = 00000000000063ff
!	Mem[0000000030001400] = 00000a3000000000, %l7 = 0000000000000000
	ldxa	[%i0+%g0]0x81,%l7	! %l7 = 00000a3000000000
!	Mem[00000000100c1400] = 00000000, %l3 = 0000000000000000
	ldswa	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181400] = 7e00000000000000, %l5 = ff0000ff0000ffff
	ldxa	[%i6+%g0]0x89,%l5	! %l5 = 7e00000000000000
!	Mem[00000000100c1408] = ffff0000, %l5 = 7e00000000000000
	ldsha	[%i3+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010041400] = 0000000000000796, %l0 = 00000000000063ff
	ldxa	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000796
!	Mem[00000000300c1400] = 805faecc, %l4 = 00000000000000ff
	ldsba	[%i3+%g0]0x89,%l4	! %l4 = ffffffffffffffcc
!	Mem[0000000030181408] = 00000055, %l7 = 00000a3000000000
	lduha	[%i6+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = 0000000052ff00ff, %l2 = 0000000037a6ccf7
	ldxa	[%i3+%o4]0x89,%l2	! %l2 = 0000000052ff00ff
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030181408] = 55000000
	stba	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 55000000

p0_label_474:
!	%l2 = 52ff00ff, %l3 = 00000000, Mem[00000000300c1410] = 00000000 0000ff00
	stda	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 52ff00ff 00000000
!	Mem[0000000030001410] = 00000000, %l6 = 00000000000000ff
	swapa	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010181410] = 000001ff00000000
	stxa	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000000000000
!	Mem[00000000201c0000] = 00ff4c08, %l3 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	%f18 = 00000000, Mem[0000000010181434] = 00000000
	sta	%f18,[%i6+0x034]%asi	! Mem[0000000010181434] = 00000000
!	%l7 = 0000000000000000, Mem[0000000010181410] = 0000000000000000
	stxa	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000010001410] = ff000000
	stwa	%l1,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	%l4 = ffffffffffffffcc, imm = 0000000000000579, %l3 = 0000000000000000
	addc	%l4,0x579,%l3		! %l3 = 0000000000000545
!	Mem[0000000010081408] = 71000000, %l4 = ffffffffffffffcc
	ldsha	[%i2+0x008]%asi,%l4	! %l4 = 0000000000007100
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 000000ff, %l6 = 0000000000000000
	ldsha	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000

p0_label_475:
!	Mem[0000000010101400] = ff000000, %l0 = 0000000000000796
	ldsba	[%i4+%g0]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030181410] = 00000000 000000ff, %l4 = 00007100, %l5 = ffffffff
	ldda	[%i6+%o5]0x81,%l4	! %l4 = 0000000000000000 00000000000000ff
!	Mem[0000000021800100] = ffff8676, %l4 = 0000000000000000
	lduh	[%o3+0x100],%l4		! %l4 = 000000000000ffff
!	Mem[0000000010181400] = ff000000, %l3 = 0000000000000545
	lduba	[%i6+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001408] = ffff0000, %f22 = 201d0000
	ld	[%i0+%o4],%f22	! %f22 = ffff0000
!	Mem[0000000010041400] = 00000000, %l6 = 0000000000000000
	ldswa	[%i1+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081408] = 00000071, %f21 = 00000000
	lda	[%i2+%o4]0x88,%f21	! %f21 = 00000071
!	Mem[0000000010181408] = 00000000, %l5 = 00000000000000ff
	lduw	[%i6+%o4],%l5		! %l5 = 0000000000000000
!	Mem[00000000218000c0] = ffff4ce8, %l7 = 0000000000000000
	ldsh	[%o3+0x0c0],%l7		! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f5  = 00000000, Mem[0000000010001418] = 0000ffff
	sta	%f5 ,[%i0+0x018]%asi	! Mem[0000000010001418] = 00000000

p0_label_476:
!	Mem[00000000300c1410] = ff00ff52, %l4 = 000000000000ffff
	swapa	[%i3+%o5]0x81,%l4	! %l4 = 00000000ff00ff52
!	%f18 = 00000000 ffff0000, Mem[00000000100c1418] = 0000ffff 000000ff
	std	%f18,[%i3+0x018]	! Mem[00000000100c1418] = 00000000 ffff0000
!	%l2 = 0000000052ff00ff, Mem[0000000010141420] = 000000ff00000000, %asi = 80
	stxa	%l2,[%i5+0x020]%asi	! Mem[0000000010141420] = 0000000052ff00ff
!	%f6  = ffbf607e 00001d20, Mem[0000000010181408] = 00000000 ffff0000
	stda	%f6 ,[%i6+%o4]0x80	! Mem[0000000010181408] = ffbf607e 00001d20
!	Mem[0000000010001430] = 34afe96f, %l7 = ffffffff, %l2 = 52ff00ff
	add	%i0,0x30,%g1
	casa	[%g1]0x80,%l7,%l2	! %l2 = 0000000034afe96f
!	%l1 = 0000000000000000, Mem[00000000100c1400] = 00000000
	stba	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	Mem[0000000030041410] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010001410] = 00000000, %l7 = ffffffffffffffff
	ldstuba	[%i0+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[00000000211c0001] = ffff85d2
	stb	%l3,[%o2+0x001]		! Mem[00000000211c0000] = ffff85d2
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 000000ff, %l4 = 00000000ff00ff52
	lduha	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000

p0_label_477:
!	Mem[00000000100c1430] = 00000000, %l0 = ffffffffffffffff
	ldsw	[%i3+0x030],%l0		! %l0 = 0000000000000000
!	Mem[00000000100c1404] = 000000ff, %l2 = 0000000034afe96f
	ldsw	[%i3+0x004],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010141400] = 00ff0000, %l4 = 0000000000000000
	ldsha	[%i5+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[00000000201c0000] = ffff4c08, %l0 = 0000000000000000
	ldsba	[%o0+0x001]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010101400] = 000000ff, %l7 = 0000000000000000
	lduba	[%i4+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001408] = ff000000ffffffff, %l6 = 00000000000000ff
	ldxa	[%i0+%o4]0x81,%l6	! %l6 = ff000000ffffffff
!	Mem[0000000010001400] = ff00000000000000, %f24 = 00000000 ff000000
	ldda	[%i0+%g0]0x80,%f24	! %f24 = ff000000 00000000
!	Mem[0000000030001408] = 000000ff, %l3 = 00000000000000ff
	lduba	[%i0+%o4]0x89,%l3	! %l3 = 00000000000000ff
	membar	#Sync			! Added by membar checker (74)
!	Mem[00000000100c1400] = 00000000 000000ff ffff0000 ff0000ff
!	Mem[00000000100c1410] = 000000ff 000000ff 00000000 ffff0000
!	Mem[00000000100c1420] = 00000000 000000ff 203504f3 00000000
!	Mem[00000000100c1430] = 00000000 203504f3 00000000 ffffffff
	ldda	[%i3]ASI_BLK_P,%f0	! Block Load from 00000000100c1400
!	Starting 10 instruction Store Burst
!	%f31 = 00000000, Mem[0000000010141408] = 000000ff
	sta	%f31,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000

p0_label_478:
!	%l7 = 00000000000000ff, Mem[00000000218001c0] = 00ff6949
	sth	%l7,[%o3+0x1c0]		! Mem[00000000218001c0] = 00ff6949
!	Mem[0000000010041400] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i1+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041400] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i1+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[0000000030141408] = 000000000000ffff
	stxa	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000000000ff
!	Mem[0000000030001408] = ff000000, %l1 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l1	! %l1 = 00000000ff000000
!	%l4 = 00000000000000ff, Mem[0000000010141400] = 0000ff00
	stha	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff
!	%l5 = 0000000000000000, Mem[0000000030001408] = 00000000
	stba	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	%f24 = ff000000 00000000, Mem[0000000030041410] = ff000000 00000000
	stda	%f24,[%i1+%o5]0x81	! Mem[0000000030041410] = ff000000 00000000
!	Code Fragment 3
p0_fragment_45:
!	%l0 = ffffffffffffffff
	setx	0xd24534f80e7d2fd2,%g7,%l0 ! %l0 = d24534f80e7d2fd2
!	%l1 = 00000000ff000000
	setx	0x5eb06bafc0ad7665,%g7,%l1 ! %l1 = 5eb06bafc0ad7665
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d24534f80e7d2fd2
	setx	0x1f1ff9682ca9e4d8,%g7,%l0 ! %l0 = 1f1ff9682ca9e4d8
!	%l1 = 5eb06bafc0ad7665
	setx	0x49a18d3823250391,%g7,%l1 ! %l1 = 49a18d3823250391
!	Starting 10 instruction Load Burst
!	%l7 = 00000000000000ff, %l6 = ff000000ffffffff, %l5 = 0000000000000000
	xor	%l7,%l6,%l5		! %l5 = ff000000ffffff00

p0_label_479:
!	Mem[00000000100c1410] = 000000ff, %l6 = ff000000ffffffff
	lduha	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000020800000] = ffffba64, %l4 = 00000000000000ff
	ldsh	[%o1+%g0],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010141410] = 00000000, %l6 = 0000000000000000
	lduwa	[%i5+%o5]0x80,%l6	! %l6 = 0000000000000000
!	%l7 = 00000000000000ff, %l3 = 00000000000000ff, %y  = 00000000
	smul	%l7,%l3,%l7		! %l7 = 000000000000fe01, %y = 00000000
!	Mem[0000000030041400] = 000000ff, %l1 = 49a18d3823250391
	lduwa	[%i1+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000201c0000] = ffff4c08, %l1 = 00000000000000ff
	ldsba	[%o0+0x000]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010181408] = ffbf607e00001d20, %l5 = ff000000ffffff00
	ldxa	[%i6+%o4]0x80,%l5	! %l5 = ffbf607e00001d20
!	Mem[0000000030181408] = 00000055, %l7 = 000000000000fe01
	lduha	[%i6+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = ff00ff00, %l5 = ffbf607e00001d20
	lduha	[%i2+%o4]0x89,%l5	! %l5 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030081400] = 00000000 00000000
	stda	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000 00000000

p0_label_480:
!	Mem[0000000030101410] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041408] = ff000006, %l2 = 00000000000000ff
	ldstuba	[%i1+%o4]0x81,%l2	! %l2 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[000000001000143c] = ff000000
	stw	%l2,[%i0+0x03c]		! Mem[000000001000143c] = 000000ff
!	Mem[0000000010041409] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i1+0x009]%asi,%l6	! %l6 = 00000000000000ff
!	%l5 = 000000000000ff00, Mem[0000000010081408] = 00000071
	stwa	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000ff00
!	%f24 = ff000000 00000000, %l7 = 0000000000000000
!	Mem[00000000300c1400] = ccae5f80ff0000ff
	stda	%f24,[%i3+%l7]ASI_PST16_SL ! Mem[00000000300c1400] = ccae5f80ff0000ff
!	%l4 = ffffffffffffffff, Mem[0000000010101408] = ff000000
	stha	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = ffff0000
!	Mem[0000000010101410] = 00ff0000, %l0 = 1f1ff9682ca9e4d8
	ldstuba	[%i4+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	%l1 = ffffffffffffffff, Mem[0000000030181408] = 00000055
	stba	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = ff000055
!	Starting 10 instruction Load Burst
!	Mem[0000000010101404] = 00000000, %l3 = 00000000000000ff
	ldub	[%i4+0x004],%l3		! %l3 = 0000000000000000

p0_label_481:
!	%l5 = 000000000000ff00, Mem[0000000030101410] = ff750000000000ff
	stxa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000000000ff00
!	%l6 = 0000000000000000, immed = 000005cd, %y  = 00000000
	sdiv	%l6,0x5cd,%l5		! %l5 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	Mem[00000000100c1408] = 0000ffff, %l1 = ffffffffffffffff
	lduwa	[%i3+%o4]0x88,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030041410] = ff000000, %f0  = 00000000
	lda	[%i1+%o5]0x81,%f0 	! %f0 = ff000000
!	Mem[0000000030081410] = 00000000000000ff, %f0  = ff000000 000000ff
	ldda	[%i2+%o5]0x89,%f0 	! %f0  = 00000000 000000ff
!	Mem[0000000030101400] = 00000000, %l3 = 0000000000000000
	ldswa	[%i4+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1410] = 000000ff 000000ff, %l4 = ffffffff, %l5 = 00000000
	ldda	[%i3+%o5]0x80,%l4	! %l4 = 00000000000000ff 00000000000000ff
!	Mem[00000000300c1410] = 00000000 ffff0000, %l4 = 000000ff, %l5 = 000000ff
	ldda	[%i3+%o5]0x89,%l4	! %l4 = 00000000ffff0000 0000000000000000
!	Mem[0000000030141410] = ffff000000000000, %f2  = ffff0000 ff0000ff
	ldda	[%i5+%o5]0x81,%f2 	! %f2  = ffff0000 00000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (75)
!	%f0  = 00000000 000000ff, Mem[00000000100c1400] = 00000000 ff000000
	stda	%f0 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 000000ff

p0_label_482:
!	Mem[00000000201c0001] = ffff4c08, %l7 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l7	! %l7 = 000000ff000000ff
!	%l4 = 00000000ffff0000, Mem[0000000010081408] = 0000ff00
	stba	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000ff00
!	Mem[0000000030041400] = 000000ff, %l2 = 00000000000000ff
	ldstuba	[%i1+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030141410] = ffff0000, %l3 = 0000000000000000
	ldstuba	[%i5+%o5]0x81,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030181400] = 00000000, %l1 = 000000000000ffff
	ldstuba	[%i6+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	Code Fragment 4
p0_fragment_46:
!	%l0 = 0000000000000000
	setx	0x14891467d6acd663,%g7,%l0 ! %l0 = 14891467d6acd663
!	%l1 = 0000000000000000
	setx	0xa62da7b7f0723564,%g7,%l1 ! %l1 = a62da7b7f0723564
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 14891467d6acd663
	setx	0x2513fb004fd1a21c,%g7,%l0 ! %l0 = 2513fb004fd1a21c
!	%l1 = a62da7b7f0723564
	setx	0xb0ee04c868674d31,%g7,%l1 ! %l1 = b0ee04c868674d31
!	Mem[0000000010041408] = ff00ff00, %l5 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	%l4 = 00000000ffff0000, immed = fffffa53, %y  = 00000000
	umul	%l4,-0x5ad,%l1		! %l1 = fffefa5305ad0000, %y = fffefa53
!	%l1 = fffefa5305ad0000, Mem[00000000300c1410] = ffff0000
	stba	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 000000ff, %l7 = 00000000000000ff
	lduwa	[%i0+%g0]0x88,%l7	! %l7 = 00000000000000ff

p0_label_483:
!	Mem[0000000030101408] = 00000000, %l2 = 00000000000000ff
	lduha	[%i4+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181400] = 00ff0000000000ff, %f26 = 00000049 00000000
	ldda	[%i6+%g0]0x88,%f26	! %f26 = 00ff0000 000000ff
!	Mem[0000000010101424] = 00000000, %l3 = 00000000000000ff
	lduw	[%i4+0x024],%l3		! %l3 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l4 = 00000000ffff0000
	lduwa	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1400] = ccae5f80, %f6  = 00000000
	lda	[%i3+%g0]0x81,%f6 	! %f6 = ccae5f80
!	Mem[0000000030041410] = ff00000000000000, %l1 = fffefa5305ad0000
	ldxa	[%i1+%o5]0x81,%l1	! %l1 = ff00000000000000
!	Mem[0000000010101410] = 0000000000ff00ff, %l4 = 0000000000000000
	ldxa	[%i4+%o5]0x88,%l4	! %l4 = 0000000000ff00ff
!	Mem[0000000010101408] = ffff0000, %l7 = 00000000000000ff
	ldswa	[%i4+%o4]0x80,%l7	! %l7 = ffffffffffff0000
!	Mem[00000000300c1408] = ff00ff52, %l3 = 0000000000000000
	lduha	[%i3+%o4]0x81,%l3	! %l3 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%f1  = 000000ff, Mem[0000000010141400] = ff000000
	sta	%f1 ,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000ff

p0_label_484:
!	%f1  = 000000ff, Mem[0000000030041408] = 060000ff
	sta	%f1 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000ff
!	%l0 = 2513fb004fd1a21c, Mem[0000000010141410] = 00000000
	stha	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = a21c0000
!	%l5 = 0000000000000000, Mem[0000000010041410] = 00000000
	stba	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	Mem[000000001008140a] = 00ff0000, %l0 = 2513fb004fd1a21c
	ldstub	[%i2+0x00a],%l0		! %l0 = 00000000000000ff
!	%l1 = ff00000000000000, Mem[0000000010041400] = ff000000
	stba	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	Mem[0000000010101438] = 715fca09, %l4 = 0000000000ff00ff
	ldstub	[%i4+0x038],%l4		! %l4 = 00000071000000ff
!	%l4 = 00000071, %l5 = 00000000, Mem[0000000010101428] = 00000000 00000000
	std	%l4,[%i4+0x028]		! Mem[0000000010101428] = 00000071 00000000
!	%l2 = 0000000000000000, Mem[00000000201c0000] = ffff4c08, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00004c08
!	Mem[0000000010081408] = 00ffff00, %l1 = ff00000000000000
	swapa	[%i2+%o4]0x88,%l1	! %l1 = 0000000000ffff00
!	Starting 10 instruction Load Burst
!	Mem[0000000010101438] = ff5fca09, %l3 = 000000000000ff00
	ldsba	[%i4+0x038]%asi,%l3	! %l3 = ffffffffffffffff

p0_label_485:
!	Mem[0000000030081400] = 00000000, %l2 = 0000000000000000
	lduha	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041410] = ff000000, %f19 = ffff0000
	lda	[%i1+%o5]0x81,%f19	! %f19 = ff000000
!	Mem[0000000030001400] = 00000a30, %l4 = 0000000000000071
	lduwa	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000a30
!	Mem[0000000010181408] = ffbf607e00001d20, %f4  = 000000ff 000000ff
	ldda	[%i6+0x008]%asi,%f4 	! %f4  = ffbf607e 00001d20
!	Mem[00000000100c1410] = 000000ff, %l0 = 0000000000000000
	ldswa	[%i3+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030041408] = 00000000000000ff, %l2 = 0000000000000000
	ldxa	[%i1+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1400] = ff000000, %l3 = ffffffffffffffff
	lduwa	[%i3+%g0]0x80,%l3	! %l3 = 00000000ff000000
!	Mem[00000000300c1410] = 00000000ffff0000, %f20 = 00000000 00000071
	ldda	[%i3+%o5]0x89,%f20	! %f20 = 00000000 ffff0000
!	%l5 = 0000000000000000, %l0 = 00000000000000ff, %l2 = 00000000000000ff
	andn	%l5,%l0,%l2		! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f1  = 000000ff, Mem[00000000100c1434] = 203504f3
	st	%f1 ,[%i3+0x034]	! Mem[00000000100c1434] = 000000ff

p0_label_486:
!	%l1 = 0000000000ffff00, Mem[0000000030001410] = 000000ff
	stba	%l1,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000ff
!	Mem[0000000030081408] = 00ff00ff, %l0 = 00000000000000ff
	swapa	[%i2+%o4]0x81,%l0	! %l0 = 0000000000ff00ff
!	%f20 = 00000000 ffff0000, Mem[0000000010141410] = a21c0000 00ff0000
	stda	%f20,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 ffff0000
!	%l6 = 0000000000000000, Mem[0000000010041400] = 00000000
	stwa	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	%l7 = ffffffffffff0000, Mem[0000000010001400] = ff00000000000000
	stxa	%l7,[%i0+%g0]0x80	! Mem[0000000010001400] = ffffffffffff0000
!	Mem[0000000010101434] = ff000000, %l2 = 0000000000000000
	swap	[%i4+0x034],%l2		! %l2 = 00000000ff000000
!	%l5 = 0000000000000000, Mem[0000000010081400] = f7cca637
	stha	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = f7cc0000
!	%f22 = ffff0000 ff010000, %l4 = 0000000000000a30
!	Mem[0000000010041408] = ffff00ff00000000
	add	%i1,0x008,%g1
	stda	%f22,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010041408] = ffff00ff00000000
!	Mem[0000000010101414] = 00000000, %l4 = 0000000000000a30
	swap	[%i4+0x014],%l4		! %l4 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000, %f1  = 000000ff
	lda	[%i6+%o5]0x88,%f1 	! %f1 = 00000000

p0_label_487:
!	Mem[0000000030101410] = 0000ff00, %l5 = 0000000000000000
	ldswa	[%i4+%o5]0x89,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030181410] = 00000000000000ff, %f12 = 00000000 203504f3
	ldda	[%i6+%o5]0x81,%f12	! %f12 = 00000000 000000ff
!	Mem[0000000010001400] = ffffffff, %l3 = 00000000ff000000
	lduwa	[%i0+%g0]0x80,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000010181410] = 0000000000000000, %f0  = 00000000 00000000
	ldda	[%i6+%o5]0x88,%f0 	! %f0  = 00000000 00000000
!	Mem[0000000030001410] = 00000000 ff000000, %l6 = 00000000, %l7 = ffff0000
	ldda	[%i0+%o5]0x89,%l6	! %l6 = 00000000ff000000 0000000000000000
	membar	#Sync			! Added by membar checker (76)
!	Mem[0000000010141400] = 000000ff 00000000 00000000 00000000
!	Mem[0000000010141410] = 00000000 ffff0000 000001ff 00001d20
!	Mem[0000000010141420] = 00000000 52ff00ff 00000000 49000000
!	Mem[0000000010141430] = 00000000 00ff0000 00000000 0000007e
	ldda	[%i5]ASI_BLK_PL,%f16	! Block Load from 0000000010141400
!	Mem[0000000030141410] = 0000ffff, %l4 = 0000000000000000
	ldswa	[%i5+%o5]0x89,%l4	! %l4 = 000000000000ffff
!	Mem[00000000201c0000] = 00004c08, %l5 = 000000000000ff00
	lduha	[%o0+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081430] = 00000000 000063ff, %l2 = ff000000, %l3 = ffffffff
	ldd	[%i2+0x030],%l2		! %l2 = 0000000000000000 00000000000063ff
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000ffff, Mem[00000000100c1400] = ff000000
	stha	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffff0000

p0_label_488:
!	%f12 = 00000000 000000ff, %l7 = 0000000000000000
!	Mem[0000000010001408] = ffff0000ffff0000
	add	%i0,0x008,%g1
	stda	%f12,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010001408] = ffff0000ffff0000
!	%l1 = 0000000000ffff00, Mem[0000000030141410] = 0000ffff
	stba	%l1,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000ff00
!	%l1 = 0000000000ffff00, Mem[0000000030181400] = ff000000
	stba	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	%l6 = ff000000, %l7 = 00000000, Mem[0000000010101428] = 00000071 00000000
	std	%l6,[%i4+0x028]		! Mem[0000000010101428] = ff000000 00000000
	membar	#Sync			! Added by membar checker (77)
!	%f11 = 00000000, Mem[0000000010141408] = 00000000
	sta	%f11,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%f26 = 00000049 00000000, Mem[0000000010141400] = ff000000 00000000
	stda	%f26,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000049 00000000
!	%l6 = 00000000ff000000, Mem[0000000010001410] = ff00000000000000
	stxa	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000ff000000
!	%f25 = 00000000, Mem[0000000030141408] = ff000000
	sta	%f25,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	%l2 = 00000000, %l3 = 000063ff, Mem[0000000010081410] = 00000000 ff630000
	stda	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000 000063ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (78)
!	Mem[0000000010001400] = ffffffff ffff0000 ffff0000 ffff0000
!	Mem[0000000010001410] = 00000000 ff000000 00000000 000063ff
!	Mem[0000000010001420] = ffffffff 00000050 ffbf607e 20dd659f
!	Mem[0000000010001430] = 34afe96f 94fd9093 00000000 000000ff
	ldda	[%i0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010001400

p0_label_489:
!	Mem[00000000211c0000] = ffff85d2, %l5 = 0000000000000000
	ldub	[%o2+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010141400] = 00000000, %f14 = 00000000
	lda	[%i5+%g0]0x88,%f14	! %f14 = 00000000
!	%l1 = 0000000000ffff00, imm = 00000000000000eb, %l2 = 0000000000000000
	add	%l1,0x0eb,%l2		! %l2 = 0000000000ffffeb
!	Mem[00000000100c1400] = ffff0000, %l2 = 0000000000ffffeb
	lduwa	[%i3+%g0]0x80,%l2	! %l2 = 00000000ffff0000
!	Mem[0000000030041400] = 000000ff, %l2 = 00000000ffff0000
	lduwa	[%i1+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041400] = 00000000, %l5 = 00000000000000ff
	lduwa	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l5 = 0000000000000000
	lduba	[%i2+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181430] = 0000ff0000000000, %f0  = 00000000 00000000
	ldd	[%i6+0x030],%f0 	! %f0  = 0000ff00 00000000
!	Mem[0000000010141410] = 00000000, %l3 = 00000000000063ff
	lduwa	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f5  = 00001d20, Mem[0000000010041408] = ff00ffff
	sta	%f5 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 00001d20

p0_label_490:
!	%f8  = 00000000 000000ff, Mem[0000000010141410] = 00000000 0000ffff
	stda	%f8 ,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000 000000ff
!	Mem[0000000010141410] = ff000000, %l1 = 0000000000ffff00
	swapa	[%i5+%o5]0x80,%l1	! %l1 = 00000000ff000000
!	%l6 = 00000000ff000000, Mem[0000000030041408] = 000000ff
	stba	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	Mem[0000000010001408] = 0000ffff, %l5 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010041428] = 00000000, %l7 = 0000000000000000, %asi = 80
	swapa	[%i1+0x028]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101400] = 000000ff, %l1 = 00000000ff000000
	swapa	[%i4+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Code Fragment 4
p0_fragment_47:
!	%l0 = 0000000000ff00ff
	setx	0x5e0c81a79cf66eea,%g7,%l0 ! %l0 = 5e0c81a79cf66eea
!	%l1 = 00000000000000ff
	setx	0x77ee94f7915e986b,%g7,%l1 ! %l1 = 77ee94f7915e986b
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5e0c81a79cf66eea
	setx	0x1195b46fd0b19ff5,%g7,%l0 ! %l0 = 1195b46fd0b19ff5
!	%l1 = 77ee94f7915e986b
	setx	0x90e8f9c04b0b91a4,%g7,%l1 ! %l1 = 90e8f9c04b0b91a4
!	%l1 = 90e8f9c04b0b91a4, immed = 0000052e, %y  = fffefa53
	sdiv	%l1,0x52e,%l7		! %l7 = ffffffff80000000
	mov	%l0,%y			! %y = d0b19ff5
!	%f8  = 00000000 000000ff, %l6 = 00000000ff000000
!	Mem[0000000030141418] = 201d0000ff010000
	add	%i5,0x018,%g1
	stda	%f8,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030141418] = 201d0000ff010000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00ffff00, %f4  = ffbf607e
	lda	[%i5+%o5]0x88,%f4 	! %f4 = 00ffff00

p0_label_491:
!	Mem[0000000020800000] = ffffba64, %l5 = 000000000000ffff
	lduha	[%o1+0x000]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030181410] = 00000000000000ff, %f10 = 203504f3 00000000
	ldda	[%i6+%o5]0x81,%f10	! %f10 = 00000000 000000ff
!	Mem[0000000010101404] = 00000000, %l7 = ffffffff80000000
	ldsha	[%i4+0x006]%asi,%l7	! %l7 = 0000000000000000
!	%l3 = 0000000000000000, %l3 = 0000000000000000, %l6 = 00000000ff000000
	sub	%l3,%l3,%l6		! %l6 = 0000000000000000
!	Mem[00000000300c1400] = 805faecc, %l1 = 90e8f9c04b0b91a4
	ldsha	[%i3+%g0]0x89,%l1	! %l1 = ffffffffffffaecc
!	Mem[0000000010181410] = 00000000 00000000, %l4 = 0000ffff, %l5 = 0000ffff
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010081408] = 00000000, %l4 = 0000000000000000
	ldsha	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l0 = 1195b46fd0b19ff5
	ldswa	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001400] = ffffffff ffff0000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i0+%g0]0x80,%l4	! %l4 = 00000000ffffffff 00000000ffff0000
!	Starting 10 instruction Store Burst
!	%f13 = 000000ff, Mem[0000000030081410] = ff000000
	sta	%f13,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000ff

p0_label_492:
!	%l1 = ffffffffffffaecc, Mem[0000000010041408] = 201d0000
	stw	%l1,[%i1+%o4]		! Mem[0000000010041408] = ffffaecc
!	Mem[0000000010181434] = 00000000, %l6 = 0000000000000000, %asi = 80
	swapa	[%i6+0x034]%asi,%l6	! %l6 = 0000000000000000
!	%f16 = 0000ffff ffffffff, Mem[0000000010081400] = f7cc0000 715fca09
	stda	%f16,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000ffff ffffffff
!	%l1 = ffffffffffffaecc, Mem[0000000030001400] = 300a0000
	stwa	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffaecc
!	%f16 = 0000ffff ffffffff 0000ffff 0000ffff
!	%f20 = 000000ff 00000000 ff630000 00000000
!	%f24 = 50000000 ffffffff 9f65dd20 7e60bfff
!	%f28 = 9390fd94 6fe9af34 ff000000 00000000
	stda	%f16,[%i6]ASI_BLK_S	! Block Store to 0000000030181400
!	Mem[0000000010101408] = 0000ffff, %l0 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	%f10 = 00000000 000000ff, %l1 = ffffffffffffaecc
!	Mem[0000000030041418] = 7e60bfff01000000
	add	%i1,0x018,%g1
	stda	%f10,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030041418] = 7e60bfff01000000
!	Mem[0000000020800000] = ffffba64, %l2 = 00000000000000ff
	ldstuba	[%o1+0x000]%asi,%l2	! %l2 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (79)
!	Mem[0000000030181410] = ff000000, %l0 = 00000000000000ff
	swapa	[%i6+%o5]0x89,%l0	! %l0 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00000000ff000000, %l2 = 00000000000000ff
	ldxa	[%i4+%g0]0x88,%l2	! %l2 = 00000000ff000000

p0_label_493:
!	Mem[0000000030081408] = 000000ff, %l1 = ffffffffffffaecc
	ldswa	[%i2+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141400] = 00000000, %l3 = 0000000000000000
	ldswa	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = 00ffff00, %l7 = 0000000000000000
	ldswa	[%i5+%o5]0x88,%l7	! %l7 = 0000000000ffff00
!	%l5 = 00000000ffff0000, %l0 = 00000000ff000000, %l5  = 00000000ffff0000
	mulx	%l5,%l0,%l5		! %l5 = feff010000000000
!	Mem[00000000100c1414] = 000000ff, %f29 = 6fe9af34
	ld	[%i3+0x014],%f29	! %f29 = 000000ff
!	Mem[0000000010041408] = ffffaecc, %l6 = 0000000000000000
	ldswa	[%i1+0x008]%asi,%l6	! %l6 = ffffffffffffaecc
!	Mem[00000000300c1410] = ffff0000, %l4 = 00000000ffffffff
	lduba	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l5 = feff010000000000
	lduba	[%i2+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l0 = 00000000ff000000
	ldsha	[%i5+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c143c] = ffffffff, %l4 = 00000000, %l3 = 00000000
	add	%i3,0x3c,%g1
	casa	[%g1]0x80,%l4,%l3	! %l3 = 00000000ffffffff

p0_label_494:
!	%l0 = 00000000, %l1 = 000000ff, Mem[00000000100c1408] = ffff0000 ff0000ff
	stda	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 000000ff
!	%l5 = 0000000000000000, Mem[0000000030041408] = 00000000
	stha	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	%l7 = 0000000000ffff00, Mem[0000000010041438] = 7e000000, %asi = 80
	stha	%l7,[%i1+0x038]%asi	! Mem[0000000010041438] = ff000000
!	Mem[0000000030041410] = ff000000, %l0 = 0000000000000000
	swapa	[%i1+%o5]0x81,%l0	! %l0 = 00000000ff000000
!	%l6 = ffffaecc, %l7 = 00ffff00, Mem[0000000010041410] = 00000000 49000000
	stda	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffaecc 00ffff00
!	%f14 = 00000000, Mem[0000000030101408] = 00000000
	sta	%f14,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	%l6 = ffffaecc, %l7 = 00ffff00, Mem[0000000030141410] = 00ff0000 00000000
	stda	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffaecc 00ffff00
!	Mem[00000000300c1408] = 52ff00ff, %l3 = 00000000ffffffff
	swapa	[%i3+%o4]0x89,%l3	! %l3 = 0000000052ff00ff
!	%f9  = 000000ff, %f9  = 000000ff, %f22 = ff630000
	fsubs	%f9 ,%f9 ,%f22		! %l0 = 00000000ff000022, Unfinished, %fsr = 2e00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ccae5f80, %l2 = 00000000ff000000
	ldswa	[%i3+%g0]0x81,%l2	! %l2 = ffffffffccae5f80

p0_label_495:
!	Mem[0000000030041408] = 00000000, %l2 = ffffffffccae5f80
	lduwa	[%i1+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %f17 = ffffffff
	lda	[%i1+%o4]0x81,%f17	! %f17 = 00000000
!	Mem[0000000030001410] = 000000ff, %l0 = 00000000ff000022
	lduba	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001410] = 000000ff, %l7 = 0000000000ffff00
	ldsha	[%i0+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101400] = 000000ff 00000000, %l2 = 00000000, %l3 = 52ff00ff
	ldda	[%i4+0x000]%asi,%l2	! %l2 = 00000000000000ff 0000000000000000
!	Mem[0000000010101418] = ffbf607e, %l2 = 00000000000000ff
	lduh	[%i4+0x01a],%l2		! %l2 = 000000000000607e
!	Mem[0000000010001408] = 00000000, %l3 = 0000000000000000
	lduba	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %f25 = ffffffff
	lda	[%i6+%o5]0x80,%f25	! %f25 = 00000000
!	Mem[000000001000140c] = ffff0000, %l6 = ffffffffffffaecc
	ldsb	[%i0+0x00e],%l6		! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 000000000000607e, Mem[0000000010181400] = 000000ff
	stwa	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000607e

p0_label_496:
!	Mem[0000000030001408] = 00000000, %l5 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0000] = 00004c08, %l6 = 0000000000000000
	ldstub	[%o0+%g0],%l6		! %l6 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[000000001008141c] = ff000000
	sth	%l4,[%i2+0x01c]		! Mem[000000001008141c] = 00000000
!	Mem[0000000010101400] = ff000000, %l1 = 00000000000000ff
	ldstuba	[%i4+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101408] = 0000ffff, %l1 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 000000000000ffff
!	%l6 = 0000000000000000, Mem[0000000030041400] = 52030000000000ff
	stxa	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000000000000000
!	%f20 = 000000ff, Mem[000000001014143c] = 0000007e
	st	%f20,[%i5+0x03c]	! Mem[000000001014143c] = 000000ff
!	%f14 = 00000000 ffffffff, Mem[0000000010001418] = 00000000 000063ff
	stda	%f14,[%i0+0x018]%asi	! Mem[0000000010001418] = 00000000 ffffffff
!	%f2  = ffff0000 00000000, Mem[0000000010141428] = 00000000 49000000
	stda	%f2 ,[%i5+0x028]%asi	! Mem[0000000010141428] = ffff0000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041424] = ff000000, %l6 = 0000000000000000
	ldub	[%i1+0x025],%l6		! %l6 = 0000000000000000

p0_label_497:
!	%f20 = 000000ff 00000000, %l1 = 000000000000ffff
!	Mem[0000000030101430] = d7610eb5918ccb87
	add	%i4,0x030,%g1
	stda	%f20,[%g1+%l1]ASI_PST32_S ! Mem[0000000030101430] = 000000ff00000000
!	Mem[00000000300c1410] = ffff0000, %l4 = 0000000000000000
	ldswa	[%i3+%o5]0x89,%l4	! %l4 = ffffffffffff0000
!	Mem[0000000010041424] = ff000000, %l4 = ffffffffffff0000
	ldsh	[%i1+0x026],%l4		! %l4 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l5 = 0000000000000000
	lduwa	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141400] = 000000ff, %l5 = 0000000000000000
	ldsha	[%i5+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081430] = 00000000, %l4 = 0000000000000000
	lduh	[%i2+0x032],%l4		! %l4 = 0000000000000000
!	%f20 = 000000ff 00000000, Mem[0000000030001410] = ff000000 00000000
	stda	%f20,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff 00000000
!	Mem[0000000010141410] = 00ffff00, %l1 = 000000000000ffff
	ldsba	[%i5+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l7 = 0000000000000000
	lduha	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010001408] = 00000000 ffff0000
	stda	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000 00000000

p0_label_498:
!	%l0 = 0000000000000000, Mem[0000000010181408] = ffbf607e00001d20, %asi = 80
	stxa	%l0,[%i6+0x008]%asi	! Mem[0000000010181408] = 0000000000000000
!	Mem[00000000218001c0] = 00ff6949, %l4 = 0000000000000000
	ldstub	[%o3+0x1c0],%l4		! %l4 = 00000000000000ff
!	%f10 = 00000000 000000ff, Mem[0000000030141410] = ffffaecc 00ffff00
	stda	%f10,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 000000ff
!	%f26 = 9f65dd20, Mem[0000000010001438] = 00000000
	st	%f26,[%i0+0x038]	! Mem[0000000010001438] = 9f65dd20
!	%l1 = 0000000000000000, Mem[00000000100c1400] = ffff000000000000
	stxa	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000000000000000
!	%l2 = 0000607e, %l3 = 00000000, Mem[00000000100c1438] = 00000000 ffffffff
	std	%l2,[%i3+0x038]		! Mem[00000000100c1438] = 0000607e 00000000
!	%l1 = 0000000000000000, Mem[00000000211c0001] = ffff85d2
	stb	%l1,[%o2+0x001]		! Mem[00000000211c0000] = ff0085d2
!	Mem[000000001000141a] = 00000000, %l3 = 0000000000000000
	ldstub	[%i0+0x01a],%l3		! %l3 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000020800000] = ffffba64
	stb	%l7,[%o1+%g0]		! Mem[0000000020800000] = 00ffba64
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00000000, %l7 = 0000000000000000
	ldswa	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000

p0_label_499:
!	Mem[0000000010101408] = 00000000, %l3 = 0000000000000000
	ldsha	[%i4+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l6 = 0000000000000000
	ldsba	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141410] = 00000000000000ff, %l5 = 0000000000000000
	ldxa	[%i5+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141410] = 00ffff00, %f1  = 00000000
	lda	[%i5+%o5]0x80,%f1 	! %f1 = 00ffff00
!	Mem[00000000300c1408] = ffffffff, %l1 = 0000000000000000
	lduba	[%i3+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081408] = 00000000, %f23 = 00000000
	lda	[%i2+%o4]0x80,%f23	! %f23 = 00000000
!	Mem[0000000030041410] = 00000000, %l3 = 0000000000000000
	lduba	[%i1+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181400] = 0000ffff, %l3 = 0000000000000000
	ldsha	[%i6+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1408] = ffffffff, %l3 = 0000000000000000
	lduha	[%i3+%o4]0x81,%l3	! %l3 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000030041410] = 0000000000000000
	stxa	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000000000ff

p0_label_500:
!	%l3 = 000000000000ffff, Mem[0000000030141408] = 0000000000000000
	stxa	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000000000ffff
!	%l1 = 00000000000000ff, Mem[0000000010101438] = ff5fca09, %asi = 80
	stwa	%l1,[%i4+0x038]%asi	! Mem[0000000010101438] = 000000ff
!	%l7 = 0000000000000000, Mem[0000000010001410] = 00000000
	stha	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010181400] = 7e6000000000ff00
	stxa	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000020800001] = 00ffba64
	stb	%l0,[%o1+0x001]		! Mem[0000000020800000] = 0000ba64
!	Mem[0000000010101410] = 00ff00ff, %l6 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l6	! %l6 = 000000ff000000ff
!	%f16 = 0000ffff, Mem[0000000010041420] = 00000000
	st	%f16,[%i1+0x020]	! Mem[0000000010041420] = 0000ffff
!	%l1 = 00000000000000ff, Mem[0000000030001400] = 00000000ffffaecc
	stxa	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000000000ff
!	%l2 = 0000607e, %l3 = 0000ffff, Mem[0000000010041400] = 00000000 96070000
	stda	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000607e 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000, %l7 = 0000000000000000
	lduba	[%i6+%o5]0x80,%l7	! %l7 = 0000000000000000

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
	cmp	%l0,%g2			! %l0 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 000000000000607e
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 000000000000ffff
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0xd0b19ff5,%g2
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
	cmp	%l0,%l1			! %f0  should be 0000ff00 00ffff00
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be ffff0000 00000000
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00ffff00 00001d20
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be ccae5f80 ffff0000
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000000 000000ff
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000000 000000ff
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 00000000 000000ff
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 00000000 ffffffff
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 0000ffff 00000000
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 0000ffff 0000ffff
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 000000ff 00000000
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be ff630000 00000000
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 50000000 00000000
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 9f65dd20 7e60bfff
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 9390fd94 000000ff
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be ff000000 00000000
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
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x0000607e
	.word	0x00000000,0x0000ffff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x00000000
p0_expected_fp_regs:
	.word	0x0000ff00,0x00ffff00
	.word	0xffff0000,0x00000000
	.word	0x00ffff00,0x00001d20
	.word	0xccae5f80,0xffff0000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0xffffffff
	.word	0x0000ffff,0x00000000
	.word	0x0000ffff,0x0000ffff
	.word	0x000000ff,0x00000000
	.word	0xff630000,0x00000000
	.word	0x50000000,0x00000000
	.word	0x9f65dd20,0x7e60bfff
	.word	0x9390fd94,0x000000ff
	.word	0xff000000,0x00000000
	.word	0x0000002e,0x00000000		! %fsr = 0000002e00000000
p0_local0_expect:
	.word	0xffffffff,0xffff0000
	.word	0x00000000,0x00000000
	.word	0x00000000,0xff000000
	.word	0x0000ff00,0xffffffff
	.word	0xffffffff,0x00000050
	.word	0xffbf607e,0x20dd659f
	.word	0x34afe96f,0x94fd9093
	.word	0x9f65dd20,0x000000ff
p0_local0_sec_expect:
	.word	0xff000000,0x00000000
	.word	0x00000000,0xffffffff
	.word	0x00000000,0xff000000
	.word	0x000001ff,0x00001d20
	.word	0x000000ff,0x00000000
	.word	0x00000000,0x49000000
	.word	0x00000000,0x00ff0000
	.word	0x00000000,0x0000007e
p0_local1_expect:
	.word	0x7e600000,0xffff0000
	.word	0xffffaecc,0x00000000
	.word	0xffffaecc,0x00ffff00
	.word	0x201d0000,0xff010000
	.word	0x0000ffff,0xff000000
	.word	0x00000000,0x300a0000
	.word	0x0000ff00,0x00000000
	.word	0xff000000,0x00000000
p0_local1_sec_expect:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x7e60bfff,0x01000000
	.word	0x50630000,0x000000ff
	.word	0x00000049,0x817d0600
	.word	0x000000d6,0xff000049
	.word	0x76e1320a,0xff75ff00
p0_local2_expect:
	.word	0xffffffff,0xffff0000
	.word	0x00000000,0x00000000
	.word	0x00000000,0xff630000
	.word	0x000000ff,0x00000000
	.word	0x00000000,0x20dd659f
	.word	0x000001ff,0xff000000
	.word	0x00000000,0x000063ff
	.word	0xff000000,0x00000000
p0_local2_sec_expect:
	.word	0x00000000,0x00000000
	.word	0x000000ff,0xff0000ff
	.word	0x000000ff,0x00000000
	.word	0xff750000,0x00006350
	.word	0x00000049,0xff600000
	.word	0xff000000,0x7e60bfff
	.word	0x00000000,0xff000001
	.word	0x76e1320a,0x7827e7ec
p0_local3_expect:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x000000ff,0x000000ff
	.word	0x00000000,0xffff0000
	.word	0x00000000,0x000000ff
	.word	0x203504f3,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x0000607e,0x00000000
p0_local3_sec_expect:
	.word	0xccae5f80,0xff0000ff
	.word	0xffffffff,0x00000000
	.word	0x0000ffff,0x00000000
	.word	0x201d0000,0x7e60bfff
	.word	0xff630000,0x00000000
	.word	0x9f0000ff,0x00000000
	.word	0x0000ff00,0x00000000
	.word	0x7e000000,0x00000000
p0_local4_expect:
	.word	0xff0000ff,0x00000000
	.word	0x00000000,0x00000000
	.word	0xff00ff00,0x00000a30
	.word	0xffbf607e,0x00001d20
	.word	0x00000000,0x00000000
	.word	0xff000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x000000ff,0xff000000
p0_local4_sec_expect:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00ff0000
	.word	0x00ff0000,0x00000000
	.word	0x00000000,0x0000ffff
	.word	0xa77aa217,0x0fc18655
	.word	0xdd63fba2,0xf02d8855
	.word	0x000000ff,0x00000000
	.word	0x76e1320a,0x7827e7ec
p0_local5_expect:
	.word	0x00000000,0x49000000
	.word	0x00000000,0x00000000
	.word	0x00ffff00,0x00000000
	.word	0x000001ff,0x00001d20
	.word	0x00000000,0x52ff00ff
	.word	0xffff0000,0x00000000
	.word	0x00000000,0x00ff0000
	.word	0x00000000,0x000000ff
p0_local5_sec_expect:
	.word	0x000000ff,0x09ca5f71
	.word	0xffff0000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x201d0000,0xff010000
	.word	0x00000000,0xff000000
	.word	0x00000049,0x00000000
	.word	0x0000ff00,0x00000000
	.word	0x7e000000,0x00000000
p0_local6_expect:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x201d0000,0xff010000
	.word	0x00000000,0xff000000
	.word	0x00000049,0x00000000
	.word	0x0000ff00,0x00000000
	.word	0x7e000000,0xff000000
p0_local6_sec_expect:
	.word	0x0000ffff,0xffffffff
	.word	0x0000ffff,0x0000ffff
	.word	0xff000000,0x00000000
	.word	0xff630000,0x00000000
	.word	0x50000000,0xffffffff
	.word	0x9f65dd20,0x7e60bfff
	.word	0x9390fd94,0x6fe9af34
	.word	0xff000000,0x00000000
share0_expect:
	.word	0xff004c08,0xa7219620
	.word	0xbe499bb9,0x55ac559e
	.word	0x3b840c0c,0xcac34e7a
	.word	0x4747065c,0x69aaffc5
	.word	0xf160d889,0x56a8f4e2
	.word	0x00f7902c,0x0d194686
	.word	0x3836e9fc,0x3a4b319f
	.word	0x3657104c,0x4ce0b43b
share1_expect:
	.word	0x0000ba64,0x50be9cb2
	.word	0x358d183c,0x1ce9d66d
	.word	0xb7794811,0xf64baa5f
	.word	0x3aa37139,0xd4b64d83
	.word	0x2d5a2da7,0x4c9ec607
	.word	0xc7fd7ba5,0x546e20d3
	.word	0x04c49397,0x75ec205b
	.word	0xb32084ab,0x4074f878
	.word	0x00ffc1d1,0x4b815f4d
	.word	0x9715d1ba,0x8c699d55
	.word	0x7c1d3022,0xffef4079
	.word	0x0fee4678,0x7a6e9b1e
	.word	0x2f27f261,0xb3ad3d93
	.word	0xe82250b4,0xc4758128
	.word	0x37ddc559,0x8943c72f
	.word	0xb2040dd9,0xee0f0873
share2_expect:
	.word	0xff0085d2,0xf2e9b997
	.word	0x48ae5c5b,0xe9d9a858
	.word	0x70290700,0x8e2d2739
	.word	0x89407bcd,0xc1ede677
	.word	0x170db53d,0x1c24e995
	.word	0x9281ae71,0xd8b45a3d
	.word	0x20d69ba0,0xef2c7d6e
	.word	0x6ac4e5d4,0x85422183
share3_expect:
	.word	0x00fff103,0x16814f74
	.word	0xefdca886,0x6cacea9c
	.word	0x2973621e,0x156c973e
	.word	0xcb3cfc8c,0x973a275a
	.word	0x60fb5560,0x9934d5bb
	.word	0x0f54d78c,0xea1d77fc
	.word	0xa3bc4765,0xa207cd85
	.word	0x73e5ef6d,0x83db9860
	.word	0xffffd022,0x96df108e
	.word	0x93a772a1,0x7e5a380e
	.word	0x278f7abf,0xfc85b7aa
	.word	0xe46778a1,0xd69ec2b6
	.word	0x8f6eab53,0x70d0f394
	.word	0x6330c36a,0x74ba978b
	.word	0xce22797b,0xf7842f48
	.word	0x54b80c18,0xa4886a38
	.word	0xffff7b7d,0x4cb93442
	.word	0xe49ad591,0x6731c45d
	.word	0x6451aafc,0xef7433fd
	.word	0xdf760f6c,0x0cc7a120
	.word	0x057f4fc4,0x8df98e1f
	.word	0xf71b1a64,0x20cafedd
	.word	0x49ea0c9b,0x199931e8
	.word	0xb4f77d2f,0xff1434ce
	.word	0xffff4ce8,0x536cd1eb
	.word	0x67b00ca1,0x097f066a
	.word	0xec55c970,0x84748abc
	.word	0x1113243a,0x038a149d
	.word	0x9c969d70,0xf86de02d
	.word	0x0ef5cf67,0x7985df14
	.word	0xe5cf2011,0x7b9fd797
	.word	0xeb4517de,0x60c900ac
	.word	0xffff8676,0x96d95e1f
	.word	0xea012100,0xc2920fd6
	.word	0x7b9ed8d1,0xacd4824d
	.word	0xc369db0e,0x9127c08b
	.word	0x6b60d927,0xf137b852
	.word	0x5ee60923,0x7c90abb1
	.word	0x08ea27e4,0xd83ccc74
	.word	0x00a330ee,0xa63bd6a8
	.word	0xffff05d8,0x3974017c
	.word	0x42e618f1,0x3e4ffe49
	.word	0x28a3e544,0xc06663ef
	.word	0xe5aa2101,0x7a26bf90
	.word	0x0a350172,0xe838d296
	.word	0x14cceb2a,0x7a361faa
	.word	0xc4ab4810,0xee4e7370
	.word	0x2ff3ba60,0x1840e2e3
	.word	0x4bffbd9f,0x209341b1
	.word	0x04093592,0xbd46d214
	.word	0xd0c920b0,0x0e1a28e9
	.word	0xc569b75d,0xd1b4c8f9
	.word	0xebcaec9c,0x6807c145
	.word	0xcd3b49d8,0xb4a6dcb4
	.word	0x54395b0f,0xf41fe9e7
	.word	0x5f65dfbc,0x632533e7
	.word	0xffff6949,0x11167c8d
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
