/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_4000l_2.s
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
!	Seed = 326172605
!	Riesling can be on
!	1 Thread, 4000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_4000l_2.s created on Mar 26, 2009 (17:26:05)
!	RC file : mar26.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc mar26.rc -o mpgen_4000l_2 -p 1 -l 4000

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
!	%f0  = 19f12272 d29d483e 6c18b3e4 9238c078
!	%f4  = 92601512 9f170de2 a81225f9 319f9fdd
!	%f8  = 606dabe8 632b7c38 a9be66dd cce2ad12
!	%f12 = 8ddd271d 089d268f 9c744930 ff4ed13e
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 9fa03fa1 4633a6cd 541ff3ee 36332e16
!	%f20 = ce046bb5 97dc11ee 01860239 eb70490c
!	%f24 = d75c395e eea966aa d452d7fb 16d46b14
!	%f28 = c05baf2c 44a4efac cae96edc 45556fdf
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = ea5a12e7 53a05a23 bdbc3912 743d19d5
!	%f36 = 0e17cc11 30e213d6 eb5f91ef 94843d4b
!	%f40 = bfa83f07 e7e64909 fb5b3d72 5d1fa85a
!	%f44 = 80e912a0 681c09fb e09f4a11 0e48b8ba
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0xa1eda84700000029,%g7,%g1 ! GSR scale =  5, align = 1
	wr	%g1,%g0,%gsr		! GSR = a1eda84700000029
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000010181400] = cdcc175c, %f13 = 089d268f
	lda	[%i6+%g0]0x80,%f13	! %f13 = cdcc175c
!	%f2  = 6c18b3e4, Mem[0000000030081410] = 07ad8b73
	sta	%f2 ,[%i2+%o5]0x89	! Mem[0000000030081410] = 6c18b3e4
!	Mem[0000000021800080] = da21bc25, %l6 = a8ac012463ded8d6
	lduh	[%o3+0x080],%l6		! %l6 = 000000000000da21
!	Mem[0000000030001400] = 8a194a2804195233, %l6 = 000000000000da21
	ldxa	[%i0+%g0]0x89,%l6	! %l6 = 8a194a2804195233
!	Mem[0000000010181400] = 5c17cccd, %l3 = 0200d87005b78c51
	swapa	[%i6+%g0]0x88,%l3	! %l3 = 000000005c17cccd
!	Mem[0000000030101400] = 24c779e4, %l0 = 1274e62641c67f5d
	lduwa	[%i4+%g0]0x89,%l0	! %l0 = 0000000024c779e4
!	%l5 = 9fcca2a63b040418, Mem[0000000030041408] = 4f67df13
	stba	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 1867df13
!	Mem[0000000010081410] = 082a8d8506b55dc6, %f16 = 9fa03fa1 4633a6cd
	ldda	[%i2+%o5]0x80,%f16	! %f16 = 082a8d85 06b55dc6
!	Mem[0000000010041410] = 5247f799, %l4 = 9acfcb259e317529
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 000000005247f799
!	Starting 10 instruction Store Burst
!	Mem[000000001010142c] = f4c586e6, %l5 = 9fcca2a63b040418, %asi = 80
	swapa	[%i4+0x02c]%asi,%l5	! %l5 = 00000000f4c586e6

p0_label_2:
!	Mem[0000000010141435] = 7d9afab3, %l6 = 8a194a2804195233
	ldstuba	[%i5+0x035]%asi,%l6	! %l6 = 0000009a000000ff
!	%f6  = a81225f9 319f9fdd, %l2 = 33de6c842ad92551
!	Mem[00000000300c1420] = 72a316e4ba1fd026
	add	%i3,0x020,%g1
	stda	%f6,[%g1+%l2]ASI_PST32_S ! Mem[00000000300c1420] = 72a316e4319f9fdd
!	%l7 = a08ef8e26bd70144, Mem[0000000030041408] = 13df6718
	stba	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = 13df6744
!	Mem[00000000300c1408] = 3d90d6d1, %l6 = 000000000000009a
	ldstuba	[%i3+%o4]0x81,%l6	! %l6 = 0000003d000000ff
!	%l4 = 000000005247f799, Mem[0000000010001400] = d8e046c2
	stba	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = d8e04699
!	Mem[0000000030041410] = f1098b57, %l0 = 0000000024c779e4
	ldstuba	[%i1+%o5]0x89,%l0	! %l0 = 00000057000000ff
!	%l5 = 00000000f4c586e6, Mem[0000000010041408] = 5aeda113
	stha	%l5,[%i1+%o4]0x80	! Mem[0000000010041408] = 86e6a113
!	Mem[00000000100c1400] = 6ea8bce2, %l6 = 000000000000003d
	swapa	[%i3+%g0]0x88,%l6	! %l6 = 000000006ea8bce2
!	%l4 = 000000005247f799, Mem[0000000010001410] = e2a0a81874e1cfa1
	stxa	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000005247f799
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 4467df13, %l2 = 33de6c842ad92551
	ldswa	[%i1+%o4]0x81,%l2	! %l2 = 000000004467df13

p0_label_3:
!	Mem[0000000030141400] = 2e471b9c24a4e720, %f26 = d452d7fb 16d46b14
	ldda	[%i5+%g0]0x81,%f26	! %f26 = 2e471b9c 24a4e720
!	Mem[00000000300c1408] = ff90d6d1, %l5 = 00000000f4c586e6
	lduha	[%i3+%o4]0x81,%l5	! %l5 = 000000000000ff90
!	Mem[0000000010101408] = c100e9a3, %l2 = 000000004467df13
	ldswa	[%i4+%o4]0x88,%l2	! %l2 = ffffffffc100e9a3
!	Mem[0000000010181400] = 518cb70516767a96, %l2 = ffffffffc100e9a3
	ldxa	[%i6+%g0]0x80,%l2	! %l2 = 518cb70516767a96
!	Mem[0000000010101430] = e015433c, %l4 = 000000005247f799
	lduw	[%i4+0x030],%l4		! %l4 = 00000000e015433c
!	Mem[0000000010001410] = 00000000, %l6 = 000000006ea8bce2
	ldswa	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041400] = ad87309c, %l5 = 000000000000ff90
	ldswa	[%i1+%g0]0x80,%l5	! %l5 = ffffffffad87309c
!	Mem[0000000030181410] = d0d42ed9, %l1 = 4237e26493ecd953
	ldsha	[%i6+%o5]0x89,%l1	! %l1 = 0000000000002ed9
!	Mem[0000000010141408] = 5b3285ea cac88006, %l4 = e015433c, %l5 = ad87309c
	ldda	[%i5+%o4]0x88,%l4	! %l4 = 00000000cac88006 000000005b3285ea
!	Starting 10 instruction Store Burst
!	Mem[00000000218000c0] = 7e57f483, %l3 = 000000005c17cccd
	lduha	[%o3+0x0c0]%asi,%l3	! %l3 = 0000000000007e57

p0_label_4:
!	%f13 = cdcc175c, Mem[00000000100c1410] = 5f0ebe6c
	sta	%f13,[%i3+%o5]0x80	! Mem[00000000100c1410] = cdcc175c
!	%l4 = cac88006, %l5 = 5b3285ea, Mem[0000000010041420] = 1d380168 57c3e3a2
	std	%l4,[%i1+0x020]		! Mem[0000000010041420] = cac88006 5b3285ea
!	Mem[00000000300c1410] = c56afa38, %l0 = 0000000000000057
	ldstuba	[%i3+%o5]0x81,%l0	! %l0 = 000000c5000000ff
!	%l7 = a08ef8e26bd70144, Mem[00000000300c1410] = 38fa6aff
	stwa	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 6bd70144
!	%l2 = 16767a96, %l3 = 00007e57, Mem[0000000030141400] = 2e471b9c 24a4e720
	stda	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 16767a96 00007e57
!	%l2 = 16767a96, %l3 = 00007e57, Mem[0000000010141400] = 5be81b55 c120630d
	stda	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 16767a96 00007e57
!	Mem[0000000030141400] = 967a7616, %l7 = a08ef8e26bd70144
	ldstuba	[%i5+%g0]0x89,%l7	! %l7 = 00000016000000ff
!	%l0 = 000000c5, %l1 = 00002ed9, Mem[0000000010101400] = dc254ca4 6e74332a
	stda	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000c5 00002ed9
!	%l4 = cac88006, %l5 = 5b3285ea, Mem[0000000010081408] = b3e6aeeb 917d1a57
	stda	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = cac88006 5b3285ea
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ff8b09f141dce33e, %f16 = 082a8d85 06b55dc6
	ldda	[%i1+%o5]0x81,%f16	! %f16 = ff8b09f1 41dce33e

p0_label_5:
!	Mem[00000000100c1408] = a5231c3f, %l3 = 0000000000007e57
	ldsha	[%i3+%o4]0x88,%l3	! %l3 = 0000000000001c3f
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010101400] = c5000000 d92e0000 a3e900c1 ca3195ab
!	Mem[0000000010101410] = 9de194d4 2487796b e546fc98 04107510
!	Mem[0000000010101420] = d552b408 9dcf9345 21081c6c 3b040418
!	Mem[0000000010101430] = e015433c 02d64a7c 45124473 00735b41
	ldda	[%i4]ASI_BLK_P,%f16	! Block Load from 0000000010101400
!	Mem[0000000030141408] = ac64ec22, %l3 = 0000000000001c3f
	lduha	[%i5+%o4]0x81,%l3	! %l3 = 000000000000ac64
!	Mem[0000000030181400] = 6438fc84 b9fe27f8 64ec388c 3ef18701
!	Mem[0000000030181410] = d92ed4d0 f127e800 c1c2cd68 dba914be
!	Mem[0000000030181420] = bbc84b8f 091a31ab cb1b95f9 19e5791d
!	Mem[0000000030181430] = 9162379f 804b26e1 dd16b305 d8a73cd7
	ldda	[%i6]ASI_BLK_AIUS,%f0	! Block Load from 0000000030181400
!	Mem[0000000030181400] = 84fc3864, %l5 = 000000005b3285ea
	ldswa	[%i6+%g0]0x89,%l5	! %l5 = ffffffff84fc3864
!	Mem[0000000010041410] = 83244100 2975319e, %l2 = 16767a96, %l3 = 0000ac64
	ldda	[%i1+%o5]0x88,%l2	! %l2 = 000000002975319e 0000000083244100
!	Mem[0000000030101410] = b101c35c, %l1 = 0000000000002ed9
	lduwa	[%i4+%o5]0x89,%l1	! %l1 = 00000000b101c35c
!	Mem[0000000010141400] = 16767a9600007e57, %f16 = c5000000 d92e0000
	ldda	[%i5+%g0]0x80,%f16	! %f16 = 16767a96 00007e57
!	Mem[0000000030101400] = 24c779e4, %l0 = 00000000000000c5
	lduha	[%i4+%g0]0x89,%l0	! %l0 = 00000000000079e4
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = d10e626e, %l4 = 00000000cac88006
	ldstuba	[%i5+%o5]0x89,%l4	! %l4 = 0000006e000000ff

p0_label_6:
!	%l4 = 000000000000006e, Mem[0000000030081408] = 6bd7c61313b4309c
	stxa	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000000000006e
!	Mem[0000000030001408] = 28cc9675, %l4 = 000000000000006e
	swapa	[%i0+%o4]0x81,%l4	! %l4 = 0000000028cc9675
!	%l0 = 00000000000079e4, Mem[0000000010141400] = 16767a96
	stwa	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 000079e4
!	%l2 = 000000002975319e, Mem[0000000030081400] = cb1fbef5
	stwa	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 2975319e
!	Mem[00000000300c1410] = 7e2aecc76bd70144, %l4 = 0000000028cc9675
	ldxa	[%i3+%o5]0x89,%l4	! %l4 = 7e2aecc76bd70144
!	Mem[00000000300c1400] = 59f33322, %l5 = ffffffff84fc3864
	ldstuba	[%i3+%g0]0x89,%l5	! %l5 = 00000022000000ff
!	Mem[0000000020800041] = 6362095a, %l5 = 0000000000000022
	ldstuba	[%o1+0x041]%asi,%l5	! %l5 = 00000062000000ff
!	Mem[0000000010081408] = 0680c8ca, %l0 = 00000000000079e4
	swapa	[%i2+%o4]0x88,%l0	! %l0 = 000000000680c8ca
!	Mem[0000000010081434] = 2c1d23d2, %l3 = 0000000083244100, %asi = 80
	swapa	[%i2+0x034]%asi,%l3	! %l3 = 000000002c1d23d2
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 16218b78, %f21 = 2487796b
	lda	[%i5+%o5]0x88,%f21	! %f21 = 16218b78

p0_label_7:
!	Mem[0000000010101408] = a3e900c1ca3195ab, %f18 = a3e900c1 ca3195ab
	ldda	[%i4+%o4]0x80,%f18	! %f18 = a3e900c1 ca3195ab
!	Mem[00000000211c0000] = b2031327, %l1 = 00000000b101c35c
	ldsha	[%o2+0x000]%asi,%l1	! %l1 = ffffffffffffb203
!	Mem[0000000010181410] = 60bcac86, %f22 = e546fc98
	lda	[%i6+%o5]0x88,%f22	! %f22 = 60bcac86
!	Mem[0000000010041408] = 86e6a113, %l6 = 0000000000000000
	lduha	[%i1+%o4]0x80,%l6	! %l6 = 00000000000086e6
!	Mem[0000000010181410] = 86acbc60, %l6 = 00000000000086e6
	lduha	[%i6+%o5]0x80,%l6	! %l6 = 00000000000086ac
!	Mem[00000000300c1410] = 4401d76b, %l7 = 0000000000000016
	lduha	[%i3+%o5]0x81,%l7	! %l7 = 0000000000004401
!	Mem[0000000010141400] = e4790000, %l3 = 000000002c1d23d2
	lduba	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141408] = ac64ec22, %l0 = 000000000680c8ca
	ldswa	[%i5+%o4]0x81,%l0	! %l0 = ffffffffac64ec22
!	Mem[0000000010001400] = f0215fa0d8e04699, %f22 = 60bcac86 04107510
	ldda	[%i0+%g0]0x88,%f22	! %f22 = f0215fa0 d8e04699
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = e4790000, %l3 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l3	! %l3 = 00000000e4790000

p0_label_8:
!	Mem[00000000100c1414] = 536ce18f, %l4 = 7e2aecc76bd70144
	ldstub	[%i3+0x014],%l4		! %l4 = 00000053000000ff
!	Mem[0000000010001428] = e975e15d, %l5 = 00000062, %l0 = ac64ec22
	add	%i0,0x28,%g1
	casa	[%g1]0x80,%l5,%l0	! %l0 = 00000000e975e15d
!	Mem[0000000030081408] = 00000000, %l4 = 0000000000000053
	ldstuba	[%i2+%o4]0x81,%l4	! %l4 = 00000000000000ff
	membar	#Sync			! Added by membar checker (2)
!	%f21 = 16218b78, Mem[0000000030181408] = 64ec388c
	sta	%f21,[%i6+%o4]0x81	! Mem[0000000030181408] = 16218b78
!	%f2  = 64ec388c 3ef18701, Mem[0000000010141410] = 16218b78 4568cfda
	stda	%f2 ,[%i5+%o5]0x88	! Mem[0000000010141410] = 64ec388c 3ef18701
!	Mem[0000000010181410] = 60bcac86, %l0 = 00000000e975e15d
	ldstuba	[%i6+%o5]0x88,%l0	! %l0 = 00000086000000ff
!	Mem[0000000010181408] = 66059598, %l2 = 000000002975319e
	swapa	[%i6+%o4]0x88,%l2	! %l2 = 0000000066059598
!	Mem[0000000021800080] = da21bc25, %l6 = 00000000000086ac
	ldstub	[%o3+0x080],%l6		! %l6 = 000000da000000ff
!	%f20 = 9de194d4 16218b78, %l0 = 0000000000000086
!	Mem[00000000300c1418] = 1aec33c95edd8ea5
	add	%i3,0x018,%g1
	stda	%f20,[%g1+%l0]ASI_PST8_SL ! Mem[00000000300c1418] = 1a8b21c95edd8e9d
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ff000000, %l2 = 0000000066059598
	ldsba	[%i2+%o4]0x81,%l2	! %l2 = ffffffffffffffff

p0_label_9:
!	Mem[0000000010001408] = 2942a86d, %l6 = 00000000000000da
	ldswa	[%i0+%o4]0x88,%l6	! %l6 = 000000002942a86d
!	Mem[0000000010181410] = ffacbc60, %f27 = 3b040418
	lda	[%i6+%o5]0x80,%f27	! %f27 = ffacbc60
!	Mem[00000000201c0000] = 4bd77e52, %l3 = 00000000e4790000
	lduba	[%o0+0x001]%asi,%l3	! %l3 = 00000000000000d7
!	Mem[0000000030141400] = 967a76ff, %l0 = 0000000000000086
	lduwa	[%i5+%g0]0x89,%l0	! %l0 = 00000000967a76ff
!	Mem[0000000030141400] = ff767a96, %l2 = ffffffffffffffff
	lduba	[%i5+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1410] = 4401d76b, %f7  = dba914be
	lda	[%i3+%o5]0x81,%f7 	! %f7 = 4401d76b
!	Mem[0000000010041400] = d9c5af5d 9c3087ad, %l6 = 2942a86d, %l7 = 00004401
	ldda	[%i1+%g0]0x88,%l6	! %l6 = 000000009c3087ad 00000000d9c5af5d
!	Mem[000000001008140c] = 5b3285ea, %l1 = ffffffffffffb203
	lduba	[%i2+0x00c]%asi,%l1	! %l1 = 000000000000005b
!	Mem[0000000030181408] = 0187f13e 788b2116, %l0 = 967a76ff, %l1 = 0000005b
	ldda	[%i6+%o4]0x89,%l0	! %l0 = 00000000788b2116 000000000187f13e
!	Starting 10 instruction Store Burst
!	%l2 = 000000ff, %l3 = 000000d7, Mem[0000000010081400] = 68f51298 e2c602bf
	stda	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff 000000d7

p0_label_10:
!	%f7  = 4401d76b, Mem[0000000030181400] = 6438fc84
	sta	%f7 ,[%i6+%g0]0x81	! Mem[0000000030181400] = 4401d76b
!	Mem[0000000030181400] = 6bd70144, %l4 = 0000000000000000
	swapa	[%i6+%g0]0x89,%l4	! %l4 = 000000006bd70144
!	Mem[0000000010101410] = d494e19d, %l3 = 00000000000000d7
	ldstuba	[%i4+%o5]0x88,%l3	! %l3 = 0000009d000000ff
!	%l2 = 00000000000000ff, Mem[0000000030001408] = 0000006e
	stba	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = ff00006e
!	Mem[0000000030141410] = d10e62ff, %l5 = 0000000000000062
	swapa	[%i5+%o5]0x89,%l5	! %l5 = 00000000d10e62ff
!	Mem[0000000030041400] = 6d435c87, %l2 = 00000000000000ff
	ldstuba	[%i1+%g0]0x81,%l2	! %l2 = 0000006d000000ff
!	%l5 = 00000000d10e62ff, Mem[0000000021800040] = 14644546, %asi = 80
	stba	%l5,[%o3+0x040]%asi	! Mem[0000000021800040] = ff644546
!	%f8  = bbc84b8f 091a31ab, %l7 = 00000000d9c5af5d
!	Mem[0000000010041410] = 9e31752900412483
	add	%i1,0x010,%g1
	stda	%f8,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010041410] = ab311a098f41c883
!	%f24 = d552b408, Mem[0000000010181400] = 518cb705
	sta	%f24,[%i6+%g0]0x80	! Mem[0000000010181400] = d552b408
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 17646aca2975319e, %l2 = 000000000000006d
	ldxa	[%i6+%o4]0x88,%l2	! %l2 = 17646aca2975319e

p0_label_11:
!	Mem[0000000030101408] = 50663268, %l2 = 17646aca2975319e
	lduba	[%i4+%o4]0x81,%l2	! %l2 = 0000000000000050
!	Mem[0000000030081410] = 6c18b3e4, %l2 = 0000000000000050
	ldsha	[%i2+%o5]0x89,%l2	! %l2 = ffffffffffffb3e4
!	Mem[00000000300c1410] = 7e2aecc7 6bd70144, %l2 = ffffb3e4, %l3 = 0000009d
	ldda	[%i3+%o5]0x89,%l2	! %l2 = 000000006bd70144 000000007e2aecc7
!	Mem[0000000010001424] = d80faf28, %l7 = 00000000d9c5af5d
	ldsw	[%i0+0x024],%l7		! %l7 = ffffffffd80faf28
!	Mem[0000000030001410] = 6c624374, %l1 = 000000000187f13e
	ldsba	[%i0+%o5]0x81,%l1	! %l1 = 000000000000006c
!	Mem[0000000030081408] = 000000ff, %l0 = 00000000788b2116
	lduba	[%i2+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141410] = 62000000, %l1 = 000000000000006c
	ldswa	[%i5+%o5]0x81,%l1	! %l1 = 0000000062000000
!	Mem[00000000300c1400] = 228e7d80 59f333ff, %l4 = 6bd70144, %l5 = d10e62ff
	ldda	[%i3+%g0]0x89,%l4	! %l4 = 0000000059f333ff 00000000228e7d80
!	Mem[0000000010141400] = 00000000, %l5 = 00000000228e7d80
	lduw	[%i5+%g0],%l5		! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 000000007e2aecc7, Mem[00000000300c1400] = ff33f359
	stba	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = c733f359

p0_label_12:
!	Mem[0000000010001418] = 33f6410836578637, %l5 = 0000000000000000, %l0 = 00000000000000ff
	add	%i0,0x18,%g1
	casxa	[%g1]0x80,%l5,%l0	! %l0 = 33f6410836578637
!	%l4 = 0000000059f333ff, Mem[0000000010041400] = ad87309c
	stwa	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 59f333ff
!	%f15 = d8a73cd7, Mem[0000000030081408] = ff000000
	sta	%f15,[%i2+%o4]0x81	! Mem[0000000030081408] = d8a73cd7
!	Mem[0000000010001410] = 00000000, %l2 = 000000006bd70144
	ldstuba	[%i0+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%f18 = a3e900c1 ca3195ab, %l7 = ffffffffd80faf28
!	Mem[0000000010001430] = a26bffb2d09b646b
	add	%i0,0x030,%g1
	stda	%f18,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010001430] = a26bffb2d09b646b
!	Mem[00000000100c1404] = 0e4021ed, %l4 = 59f333ff, %l5 = 00000000
	add	%i3,0x04,%g1
	casa	[%g1]0x80,%l4,%l5	! %l5 = 000000000e4021ed
!	%l4 = 59f333ff, %l5 = 0e4021ed, Mem[0000000010081400] = 000000ff 000000d7
	stda	%l4,[%i2+0x000]%asi	! Mem[0000000010081400] = 59f333ff 0e4021ed
!	%l6 = 000000009c3087ad, Mem[00000000100c1400] = 0000003d
	stwa	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 9c3087ad
!	%l3 = 000000007e2aecc7, Mem[0000000010181400] = 967a761608b452d5
	stxa	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000007e2aecc7
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 59f333ff, %l1 = 0000000062000000
	lduba	[%i1+%g0]0x80,%l1	! %l1 = 0000000000000059

p0_label_13:
!	Mem[0000000010041408] = 86e6a113, %f20 = 9de194d4
	lda	[%i1+%o4]0x80,%f20	! %f20 = 86e6a113
!	Mem[0000000021800180] = 5bcb6058, %l3 = 000000007e2aecc7
	ldsba	[%o3+0x181]%asi,%l3	! %l3 = ffffffffffffffcb
!	Mem[00000000300c1400] = c733f359807d8e22, %l3 = ffffffffffffffcb
	ldxa	[%i3+%g0]0x81,%l3	! %l3 = c733f359807d8e22
!	Mem[0000000010041400] = 59f333ff5dafc5d9, %l0 = 33f6410836578637
	ldxa	[%i1+%g0]0x80,%l0	! %l0 = 59f333ff5dafc5d9
!	Mem[0000000010101410] = ffe194d42487796b, %l2 = 0000000000000000
	ldxa	[%i4+%o5]0x80,%l2	! %l2 = ffe194d42487796b
!	Mem[0000000030101410] = b101c35c, %l5 = 000000000e4021ed
	ldsha	[%i4+%o5]0x89,%l5	! %l5 = ffffffffffffc35c
!	Mem[0000000010081400] = ff33f359, %l2 = ffe194d42487796b
	ldsha	[%i2+%g0]0x88,%l2	! %l2 = fffffffffffff359
!	Mem[0000000010081410] = 082a8d8506b55dc6, %l0 = 59f333ff5dafc5d9
	ldxa	[%i2+%o5]0x80,%l0	! %l0 = 082a8d8506b55dc6
!	Mem[0000000010141400] = 00000000, %l2 = fffffffffffff359
	swapa	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 082a8d85, %l4 = 0000000059f333ff
	ldstuba	[%i2+%o5]0x80,%l4	! %l4 = 00000008000000ff

p0_label_14:
!	%l3 = c733f359807d8e22, Mem[0000000010041430] = 9cbe8f5f
	sth	%l3,[%i1+0x030]		! Mem[0000000010041430] = 8e228f5f
!	%l6 = 000000009c3087ad, Mem[0000000010041400] = ff33f359
	stwa	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 9c3087ad
!	%f6  = c1c2cd68 4401d76b, Mem[0000000010081410] = ff2a8d85 06b55dc6
	stda	%f6 ,[%i2+%o5]0x80	! Mem[0000000010081410] = c1c2cd68 4401d76b
!	%l1 = 0000000000000059, Mem[00000000100c1406] = 0e4021ed, %asi = 80
	stba	%l1,[%i3+0x006]%asi	! Mem[00000000100c1404] = 0e4059ed
!	%l3 = c733f359807d8e22, Mem[0000000030141400] = ff767a96
	stba	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 22767a96
!	%l6 = 000000009c3087ad, Mem[000000001010141c] = 04107510
	stw	%l6,[%i4+0x01c]		! Mem[000000001010141c] = 9c3087ad
!	%f28 = e015433c 02d64a7c, Mem[00000000100c1408] = a5231c3f 39a9e536
	stda	%f28,[%i3+%o4]0x88	! Mem[00000000100c1408] = e015433c 02d64a7c
!	Mem[0000000010081408] = e4790000, %l7 = ffffffffd80faf28
	ldstuba	[%i2+%o4]0x80,%l7	! %l7 = 000000e4000000ff
!	Mem[0000000030141410] = 62000000, %l4 = 0000000000000008
	ldstuba	[%i5+%o5]0x81,%l4	! %l4 = 00000062000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001004140c] = e19e84fe, %l6 = 000000009c3087ad
	lduha	[%i1+0x00c]%asi,%l6	! %l6 = 000000000000e19e

p0_label_15:
!	Mem[0000000010181418] = b9b4bd5e, %l1 = 0000000000000059
	ldsw	[%i6+0x018],%l1		! %l1 = ffffffffb9b4bd5e
!	Mem[0000000010101410] = 6b798724 d494e1ff, %l6 = 0000e19e, %l7 = 000000e4
	ldda	[%i4+%o5]0x88,%l6	! %l6 = 00000000d494e1ff 000000006b798724
!	Mem[0000000010041420] = cac88006 5b3285ea, %l4 = 00000062, %l5 = ffffc35c
	ldda	[%i1+0x020]%asi,%l4	! %l4 = 00000000cac88006 000000005b3285ea
!	Mem[0000000010041408] = 13a1e686, %l6 = 00000000d494e1ff
	ldsba	[%i1+%o4]0x88,%l6	! %l6 = ffffffffffffff86
!	Mem[0000000010041408] = 86e6a113, %l5 = 000000005b3285ea
	ldsba	[%i1+%o4]0x80,%l5	! %l5 = ffffffffffffff86
!	Mem[0000000010141400] = 577e000059f3ffff, %f14 = dd16b305 d8a73cd7
	ldda	[%i5+%g0]0x88,%f14	! %f14 = 577e0000 59f3ffff
!	Mem[0000000010001400] = 9946e0d8, %l5 = ffffffffffffff86
	lduha	[%i0+%g0]0x80,%l5	! %l5 = 0000000000009946
!	Mem[0000000030041400] = f2b282f2 875c43ff, %l6 = ffffff86, %l7 = 6b798724
	ldda	[%i1+%g0]0x89,%l6	! %l6 = 00000000875c43ff 00000000f2b282f2
!	Mem[0000000010041408] = fe849ee113a1e686, %l0 = 082a8d8506b55dc6
	ldxa	[%i1+%o4]0x88,%l0	! %l0 = fe849ee113a1e686
!	Starting 10 instruction Store Burst
!	%l7 = 00000000f2b282f2, Mem[0000000010141400] = fffff359
	stba	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = f2fff359

p0_label_16:
!	Mem[0000000030081408] = d73ca7d8, %l6 = 00000000875c43ff
	swapa	[%i2+%o4]0x89,%l6	! %l6 = 00000000d73ca7d8
!	%l6 = 00000000d73ca7d8, Mem[0000000030141410] = ff000000
	stha	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = a7d80000
!	Mem[0000000030081408] = 875c43ff, %l7 = 00000000f2b282f2
	ldstuba	[%i2+%o4]0x89,%l7	! %l7 = 000000ff000000ff
!	%l2 = 0000000000000000, Mem[00000000100c1400] = ad87309c
	stwa	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	%l3 = c733f359807d8e22, Mem[0000000030101408] = 506632685610727e
	stxa	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = c733f359807d8e22
!	%f0  = 6438fc84 b9fe27f8, %l3 = c733f359807d8e22
!	Mem[0000000010081428] = 9ba07c06cd1847cb
	add	%i2,0x028,%g1
	stda	%f0,[%g1+%l3]ASI_PST8_P ! Mem[0000000010081428] = 9ba0fc06cd1827cb
!	%l3 = c733f359807d8e22, Mem[0000000010001410] = ff0000005247f799
	stxa	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = c733f359807d8e22
!	%f16 = 16767a96 00007e57 a3e900c1 ca3195ab
!	%f20 = 86e6a113 16218b78 f0215fa0 d8e04699
!	%f24 = d552b408 9dcf9345 21081c6c ffacbc60
!	%f28 = e015433c 02d64a7c 45124473 00735b41
	stda	%f16,[%i2]ASI_BLK_P	! Block Store to 0000000010081400
!	Mem[0000000010001400] = d8e04699, %l1 = ffffffffb9b4bd5e
	swapa	[%i0+%g0]0x88,%l1	! %l1 = 00000000d8e04699
!	Starting 10 instruction Load Burst
!	Mem[0000000010141418] = 618cf5a1, %l2 = 0000000000000000
	ldsh	[%i5+0x018],%l2		! %l2 = 000000000000618c

p0_label_17:
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010081410] = 86e6a113, %f6  = c1c2cd68
	lda	[%i2+%o5]0x80,%f6 	! %f6 = 86e6a113
!	Mem[0000000010041410] = 091a31ab, %l5 = 0000000000009946
	lduwa	[%i1+%o5]0x88,%l5	! %l5 = 00000000091a31ab
!	Mem[00000000201c0000] = 4bd77e52, %l5 = 00000000091a31ab
	ldsha	[%o0+0x000]%asi,%l5	! %l5 = 0000000000004bd7
!	Mem[0000000010041428] = ce824c3f, %l1 = 00000000d8e04699
	ldsb	[%i1+0x02a],%l1		! %l1 = 000000000000004c
!	Mem[0000000010181414] = 1ccc65c9, %l3 = c733f359807d8e22
	ldswa	[%i6+0x014]%asi,%l3	! %l3 = 000000001ccc65c9
!	Mem[0000000030141400] = 577e0000967a7622, %f0  = 6438fc84 b9fe27f8
	ldda	[%i5+%g0]0x89,%f0 	! %f0  = 577e0000 967a7622
!	Mem[0000000030181410] = d92ed4d0, %l7 = 00000000000000ff
	ldsba	[%i6+%o5]0x81,%l7	! %l7 = ffffffffffffffd9
!	Mem[00000000300c1408] = ebeb91bfd1d690ff, %l4 = 00000000cac88006
	ldxa	[%i3+%o4]0x89,%l4	! %l4 = ebeb91bfd1d690ff
!	Mem[0000000030081400] = 2975319e, %l3 = 000000001ccc65c9
	lduwa	[%i2+%g0]0x81,%l3	! %l3 = 000000002975319e
!	Starting 10 instruction Store Burst
!	%f30 = 45124473 00735b41, %l3 = 000000002975319e
!	Mem[0000000010141430] = 14a78cbd7dfffab3
	add	%i5,0x030,%g1
	stda	%f30,[%g1+%l3]ASI_PST8_P ! Mem[0000000010141430] = 45a78c7300735bb3

p0_label_18:
!	%l0 = 13a1e686, %l1 = 0000004c, Mem[00000000300c1408] = ff90d6d1 bf91ebeb
	stda	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 13a1e686 0000004c
!	%f27 = ffacbc60, Mem[0000000010041410] = ab311a09
	sta	%f27,[%i1+%o5]0x80	! Mem[0000000010041410] = ffacbc60
!	%f0  = 577e0000 967a7622, Mem[0000000010181400] = c7ec2a7e 00000000
	stda	%f0 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 577e0000 967a7622
!	Mem[0000000010181430] = 3466373aab7d4cce, %l5 = 0000000000004bd7
	ldxa	[%i6+0x030]%asi,%l5	! %l5 = 3466373aab7d4cce
!	Mem[0000000010181418] = b9b4bd5e, %l1 = 000000000000004c, %asi = 80
	swapa	[%i6+0x018]%asi,%l1	! %l1 = 00000000b9b4bd5e
!	%l7 = ffffffffffffffd9, Mem[0000000010101408] = a3e900c1
	stwa	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = ffffffd9
!	Mem[0000000010181410] = 60bcacff, %l2 = 000000000000618c
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030001400] = 04195233, %l0 = fe849ee113a1e686
	ldstuba	[%i0+%g0]0x89,%l0	! %l0 = 00000033000000ff
!	Mem[0000000010001408] = 6da84229, %l2 = 00000000000000ff
	ldstuba	[%i0+%o4]0x80,%l2	! %l2 = 0000006d000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 6b798724 d494e1ff, %l2 = 0000006d, %l3 = 2975319e
	ldda	[%i4+%o5]0x88,%l2	! %l2 = 00000000d494e1ff 000000006b798724

p0_label_19:
!	Mem[0000000030141410] = 0000d8a7, %f4  = d92ed4d0
	lda	[%i5+%o5]0x89,%f4 	! %f4 = 0000d8a7
!	Mem[0000000010141410] = 3ef18701, %f16 = 16767a96
	lda	[%i5+%o5]0x88,%f16	! %f16 = 3ef18701
!	%f0  = 577e0000 967a7622 64ec388c 3ef18701
!	%f4  = 0000d8a7 f127e800 86e6a113 4401d76b
!	%f8  = bbc84b8f 091a31ab cb1b95f9 19e5791d
!	%f12 = 9162379f 804b26e1 577e0000 59f3ffff
	stda	%f0,[%i6]ASI_BLK_S	! Block Store to 0000000030181400
!	Mem[0000000030001410] = 6c624374a601a6c2, %l6 = 00000000d73ca7d8
	ldxa	[%i0+%o5]0x81,%l6	! %l6 = 6c624374a601a6c2
!	Mem[000000001008140c] = ca3195ab, %l2 = 00000000d494e1ff
	ldsba	[%i2+0x00c]%asi,%l2	! %l2 = ffffffffffffffca
!	Mem[0000000010041400] = 9c3087ad, %l5 = 3466373aab7d4cce
	lduwa	[%i1+%g0]0x88,%l5	! %l5 = 000000009c3087ad
!	Mem[0000000010041424] = 5b3285ea, %f24 = d552b408
	ld	[%i1+0x024],%f24	! %f24 = 5b3285ea
!	Mem[0000000010101400] = c5000000d92e0000, %l3 = 000000006b798724
	ldxa	[%i4+%g0]0x80,%l3	! %l3 = c5000000d92e0000
!	Mem[0000000010101410] = d494e1ff, %l6 = 6c624374a601a6c2
	lduwa	[%i4+%o5]0x88,%l6	! %l6 = 00000000d494e1ff
!	Starting 10 instruction Store Burst
!	%f31 = 00735b41, Mem[0000000010141410] = 0187f13e
	sta	%f31,[%i5+%o5]0x80	! Mem[0000000010141410] = 00735b41

p0_label_20:
!	%f20 = 86e6a113 16218b78, %l1 = 00000000b9b4bd5e
!	Mem[0000000030081428] = cfb5930ca2f692e9
	add	%i2,0x028,%g1
	stda	%f20,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030081428] = cfb5930c13a1e686
!	Mem[0000000010101410] = ffe194d4, %l3 = c5000000d92e0000
	ldstuba	[%i4+%o5]0x80,%l3	! %l3 = 000000ff000000ff
!	%l2 = ffffffca, %l3 = 000000ff, Mem[0000000030081408] = ff435c87 0000006e
	stda	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = ffffffca 000000ff
!	%l4 = d1d690ff, %l5 = 9c3087ad, Mem[0000000010141408] = 0680c8ca ea85325b
	stda	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = d1d690ff 9c3087ad
!	%l0 = 0000000000000033, Mem[0000000010181408] = 9e317529ca6a6417
	stxa	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000000000033
!	Mem[0000000010141424] = 20a2f730, %l6 = 00000000d494e1ff, %asi = 80
	swapa	[%i5+0x024]%asi,%l6	! %l6 = 0000000020a2f730
!	Mem[0000000010101410] = d494e1ff, %l4 = ebeb91bfd1d690ff
	swapa	[%i4+%o5]0x88,%l4	! %l4 = 00000000d494e1ff
!	Mem[0000000020800000] = 874fca09, %l1 = 00000000b9b4bd5e
	ldstuba	[%o1+0x000]%asi,%l1	! %l1 = 00000087000000ff
!	%l6 = 0000000020a2f730, Mem[0000000010141410] = 00735b418c38ec64
	stxa	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000020a2f730
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 6c624374, %l4 = 00000000d494e1ff
	ldsha	[%i0+%o5]0x81,%l4	! %l4 = 0000000000006c62

p0_label_21:
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000010181410] = 60bcacff, %l2 = ffffffffffffffca
	ldswa	[%i6+%o5]0x88,%l2	! %l2 = 0000000060bcacff
!	Mem[0000000030001400] = ff521904, %l3 = 00000000000000ff
	lduha	[%i0+%g0]0x81,%l3	! %l3 = 000000000000ff52
!	%l6 = 20a2f730, %l7 = ffffffd9, Mem[0000000010001408] = ffa84229 27844cc3
	stda	%l6,[%i0+0x008]%asi	! Mem[0000000010001408] = 20a2f730 ffffffd9
!	Mem[0000000030041400] = 875c43ff, %l0 = 0000000000000033
	lduha	[%i1+%g0]0x89,%l0	! %l0 = 00000000000043ff
!	Mem[00000000100c1434] = 353b7eea, %l3 = 000000000000ff52
	lduh	[%i3+0x036],%l3		! %l3 = 0000000000007eea
!	Mem[0000000010001404] = a05f21f0, %l1 = 0000000000000087
	lduh	[%i0+0x006],%l1		! %l1 = 00000000000021f0
!	Mem[00000000100c1400] = 00000000, %l3 = 0000000000007eea
	ldswa	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001408] = ef16213e 6e0000ff, %l4 = 00006c62, %l5 = 9c3087ad
	ldda	[%i0+%o4]0x89,%l4	! %l4 = 000000006e0000ff 00000000ef16213e
!	Mem[0000000010001410] = c733f359, %l5 = 00000000ef16213e
	lduw	[%i0+%o5],%l5		! %l5 = 00000000c733f359
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = f1098bff, %l4 = 000000006e0000ff
	swapa	[%i1+%o5]0x89,%l4	! %l4 = 00000000f1098bff

p0_label_22:
!	Mem[0000000030081400] = 2975319e, %l1 = 00000000000021f0
	ldstuba	[%i2+%g0]0x81,%l1	! %l1 = 00000029000000ff
!	Mem[000000001004142f] = a7e1c4cc, %l5 = 00000000c733f359
	ldstuba	[%i1+0x02f]%asi,%l5	! %l5 = 000000cc000000ff
!	Mem[0000000030081408] = caffffff, %l2 = 0000000060bcacff
	ldstuba	[%i2+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	%f30 = 45124473 00735b41, %l3 = 0000000000000000
!	Mem[0000000030001418] = 38d4dbf9529ac29e
	add	%i0,0x018,%g1
	stda	%f30,[%g1+%l3]ASI_PST8_SL ! Mem[0000000030001418] = 38d4dbf9529ac29e
!	Mem[0000000030041408] = 4467df13, %l4 = 00000000f1098bff
	ldstuba	[%i1+%o4]0x81,%l4	! %l4 = 00000044000000ff
!	%l3 = 0000000000000000, Mem[0000000030081408] = caffffff
	stba	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = caffff00
!	%l6 = 0000000020a2f730, Mem[0000000010101400] = 000000c5
	stba	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000030
!	Mem[0000000021800081] = ff21bc25, %l4 = 0000000000000044
	ldstuba	[%o3+0x081]%asi,%l4	! %l4 = 00000021000000ff
!	Mem[0000000010081400] = 967a7616, %l2 = 00000000000000ff
	swapa	[%i2+%g0]0x88,%l2	! %l2 = 00000000967a7616
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00000000, %l2 = 00000000967a7616
	ldsha	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000

p0_label_23:
!	Mem[0000000030181400] = 577e0000967a7622, %f8  = bbc84b8f 091a31ab
	ldda	[%i6+%g0]0x81,%f8 	! %f8  = 577e0000 967a7622
!	Mem[0000000030101408] = c733f359, %l0 = 00000000000043ff
	ldsha	[%i4+%o4]0x81,%l0	! %l0 = ffffffffffffc733
!	Mem[000000001010141c] = 9c3087ad, %l0 = ffffffffffffc733
	lduw	[%i4+0x01c],%l0		! %l0 = 000000009c3087ad
!	Mem[0000000010101420] = d552b408, %l5 = 00000000000000cc
	ldsw	[%i4+0x020],%l5		! %l5 = ffffffffd552b408
!	Mem[0000000030081400] = ff75319e, %f24 = 5b3285ea
	lda	[%i2+%g0]0x81,%f24	! %f24 = ff75319e
!	Mem[00000000300c1400] = 59f333c7, %l1 = 0000000000000029
	lduba	[%i3+%g0]0x89,%l1	! %l1 = 00000000000000c7
!	Mem[0000000030141400] = 967a7622, %l7 = ffffffffffffffd9
	ldswa	[%i5+%g0]0x89,%l7	! %l7 = ffffffff967a7622
!	Mem[00000000300c1400] = c733f359 807d8e22, %l2 = 00000000, %l3 = 00000000
	ldda	[%i3+%g0]0x81,%l2	! %l2 = 00000000c733f359 00000000807d8e22
!	Mem[00000000300c1400] = c733f359, %l4 = 0000000000000021
	ldswa	[%i3+%g0]0x81,%l4	! %l4 = ffffffffc733f359
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 0000d8a7, %l5 = ffffffffd552b408
	swapa	[%i6+%o5]0x81,%l5	! %l5 = 000000000000d8a7

p0_label_24:
!	%f0  = 577e0000 967a7622, Mem[00000000100c1408] = 7c4ad602 3c4315e0
	stda	%f0 ,[%i3+0x008]%asi	! Mem[00000000100c1408] = 577e0000 967a7622
!	%l6 = 0000000020a2f730, Mem[00000000201c0000] = 4bd77e52
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = f7307e52
!	%f8  = 577e0000 967a7622, %l4 = ffffffffc733f359
!	Mem[0000000010141400] = f2fff35900007e57
	stda	%f8,[%i5+%l4]ASI_PST16_P ! Mem[0000000010141400] = 577ef35900007622
!	%l4 = ffffffffc733f359, Mem[0000000010141438] = e752064c4c3765e9
	stx	%l4,[%i5+0x038]		! Mem[0000000010141438] = ffffffffc733f359
!	%f30 = 45124473 00735b41, Mem[0000000010041400] = ad87309c 5dafc5d9
	std	%f30,[%i1+%g0]	! Mem[0000000010041400] = 45124473 00735b41
!	%l4 = ffffffffc733f359, Mem[00000000201c0001] = f7307e52
	stb	%l4,[%o0+0x001]		! Mem[00000000201c0000] = f7597e52
!	%f31 = 00735b41, Mem[0000000010041400] = 45124473
	st	%f31,[%i1+%g0]		! Mem[0000000010041400] = 00735b41
!	Mem[00000000100c140d] = 967a7622, %l7 = ffffffff967a7622
	ldstuba	[%i3+0x00d]%asi,%l7	! %l7 = 0000007a000000ff
!	Mem[0000000030081410] = 6c18b3e4, %l3 = 00000000807d8e22
	ldstuba	[%i2+%o5]0x89,%l3	! %l3 = 000000e4000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = a7d80000bc565889, %f30 = 45124473 00735b41
	ldda	[%i5+%o5]0x81,%f30	! %f30 = a7d80000 bc565889

p0_label_25:
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010101400] = 30000000 d92e0000 ffffffd9 ca3195ab
!	Mem[0000000010101410] = ff90d6d1 2487796b e546fc98 9c3087ad
!	Mem[0000000010101420] = d552b408 9dcf9345 21081c6c 3b040418
!	Mem[0000000010101430] = e015433c 02d64a7c 45124473 00735b41
	ldda	[%i4]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010101400
!	Mem[0000000010001400] = b9b4bd5e, %l3 = 00000000000000e4
	lduha	[%i0+%g0]0x88,%l3	! %l3 = 000000000000bd5e
!	Mem[000000001008143c] = 00735b41, %l2 = 00000000c733f359
	ldsh	[%i2+0x03e],%l2		! %l2 = 0000000000005b41
!	Mem[0000000010041400] = 00735b41, %l4 = ffffffffc733f359
	lduwa	[%i1+%g0]0x80,%l4	! %l4 = 0000000000735b41
!	Mem[0000000010181428] = 14e4a5a9 fe813cbc, %l6 = 20a2f730, %l7 = 0000007a
	ldd	[%i6+0x028],%l6		! %l6 = 0000000014e4a5a9 00000000fe813cbc
!	Mem[00000000201c0000] = f7597e52, %l6 = 0000000014e4a5a9
	ldub	[%o0+0x001],%l6		! %l6 = 0000000000000059
!	Mem[00000000211c0000] = b2031327, %l0 = 000000009c3087ad
	ldsh	[%o2+%g0],%l0		! %l0 = ffffffffffffb203
!	Mem[0000000010141420] = 41d24e96, %l6 = 0000000000000059
	lduh	[%i5+0x022],%l6		! %l6 = 0000000000004e96
!	Code Fragment 3
p0_fragment_1:
!	%l0 = ffffffffffffb203
	setx	0x7e67f078616655f4,%g7,%l0 ! %l0 = 7e67f078616655f4
!	%l1 = 00000000000000c7
	setx	0x23fce0606a84637b,%g7,%l1 ! %l1 = 23fce0606a84637b
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7e67f078616655f4
	setx	0x016cbc67ca934dfc,%g7,%l0 ! %l0 = 016cbc67ca934dfc
!	%l1 = 23fce0606a84637b
	setx	0x00c10fffdc645100,%g7,%l1 ! %l1 = 00c10fffdc645100
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000d8a7, Mem[0000000010081416] = 16218b78, %asi = 80
	stha	%l5,[%i2+0x016]%asi	! Mem[0000000010081414] = 1621d8a7

p0_label_26:
!	Mem[00000000100c1408] = 577e0000, %l6 = 0000000000004e96
	ldstuba	[%i3+%o4]0x80,%l6	! %l6 = 00000057000000ff
!	%f16 = 00002ed9 00000030 ab9531ca d9ffffff
!	%f20 = 6b798724 d1d690ff ad87309c 98fc46e5
!	%f24 = 4593cf9d 08b452d5 1804043b 6c1c0821
!	%f28 = 7c4ad602 3c4315e0 415b7300 73441245
	stda	%f16,[%i6]ASI_BLK_AIUS	! Block Store to 0000000030181400
!	%l1 = 00c10fffdc645100, Mem[0000000030141410] = 895856bc0000d8a7
	stxa	%l1,[%i5+%o5]0x89	! Mem[0000000030141410] = 00c10fffdc645100
	membar	#Sync			! Added by membar checker (6)
!	%f2  = 64ec388c, Mem[0000000010101410] = ff90d6d1
	sta	%f2 ,[%i4+0x010]%asi	! Mem[0000000010101410] = 64ec388c
!	Mem[0000000020800000] = ff4fca09, %l6 = 0000000000000057
	ldstub	[%o1+%g0],%l6		! %l6 = 000000ff000000ff
!	Mem[0000000030141400] = 22767a96, %l7 = 00000000fe813cbc
	swapa	[%i5+%g0]0x81,%l7	! %l7 = 0000000022767a96
!	Mem[0000000010041408] = 86e6a113, %l6 = 00000000000000ff
	ldstuba	[%i1+%o4]0x80,%l6	! %l6 = 00000086000000ff
!	%f5  = f127e800, Mem[00000000100c1400] = 00000000
	sta	%f5 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = f127e800
!	%f16 = 00002ed9 00000030 ab9531ca d9ffffff
!	%f20 = 6b798724 d1d690ff ad87309c 98fc46e5
!	%f24 = 4593cf9d 08b452d5 1804043b 6c1c0821
!	%f28 = 7c4ad602 3c4315e0 415b7300 73441245
	stda	%f16,[%i4]ASI_BLK_SL	! Block Store to 0000000030101400
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = c733f359, %f5  = f127e800
	lda	[%i3+%g0]0x81,%f5 	! %f5 = c733f359

p0_label_27:
!	Mem[0000000030041400] = 875c43ff, %l5 = 000000000000d8a7
	lduha	[%i1+%g0]0x89,%l5	! %l5 = 00000000000043ff
!	Mem[0000000030081410] = ffb3186c, %l6 = 0000000000000086
	lduba	[%i2+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000021800000] = f6f0b8f7, %l2 = 0000000000005b41
	lduh	[%o3+%g0],%l2		! %l2 = 000000000000f6f0
!	Mem[0000000030041400] = ff435c87f282b2f2, %l5 = 00000000000043ff
	ldxa	[%i1+%g0]0x81,%l5	! %l5 = ff435c87f282b2f2
!	Mem[00000000100c1408] = ff7e0000, %l3 = 000000000000bd5e
	ldswa	[%i3+%o4]0x80,%l3	! %l3 = ffffffffff7e0000
!	Mem[0000000010141400] = 577ef35900007622, %l0 = 016cbc67ca934dfc
	ldxa	[%i5+%g0]0x80,%l0	! %l0 = 577ef35900007622
!	Mem[0000000030041400] = ff435c87, %l7 = 0000000022767a96
	lduha	[%i1+%g0]0x81,%l7	! %l7 = 000000000000ff43
!	Mem[0000000010181400] = 577e0000, %l0 = 577ef35900007622
	ldsba	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000057
!	Mem[00000000201c0000] = f7597e52, %l3 = ffffffffff7e0000
	ldsh	[%o0+%g0],%l3		! %l3 = fffffffffffff759
!	Starting 10 instruction Store Burst
!	Mem[0000000010141428] = 9650fa58, %l4 = 0000000000735b41, %asi = 80
	swapa	[%i5+0x028]%asi,%l4	! %l4 = 000000009650fa58

p0_label_28:
!	%l4 = 9650fa58, %l5 = f282b2f2, Mem[0000000010001408] = 20a2f730 ffffffd9
	stda	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 9650fa58 f282b2f2
!	%f3  = 3ef18701, Mem[0000000010181400] = 577e0000
	sta	%f3 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 3ef18701
!	Mem[00000000100c1408] = ff7e0000, %l6 = 00000000000000ff
	swap	[%i3+%o4],%l6		! %l6 = 00000000ff7e0000
!	%f10 = cb1b95f9 19e5791d, Mem[0000000010081400] = ff000000 00007e57
	stda	%f10,[%i2+%g0]0x80	! Mem[0000000010081400] = cb1b95f9 19e5791d
!	%l4 = 000000009650fa58, Mem[0000000010181410] = c965cc1c60bcacff
	stxa	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000009650fa58
!	Mem[00000000300c1408] = 86e6a113, %l2 = 000000000000f6f0
	ldstuba	[%i3+%o4]0x89,%l2	! %l2 = 00000013000000ff
!	Mem[0000000010041410] = ffacbc60, %l6 = 00000000ff7e0000
	ldstuba	[%i1+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	%l2 = 0000000000000013, Mem[0000000010101424] = 9dcf9345
	stw	%l2,[%i4+0x024]		! Mem[0000000010101424] = 00000013
!	%f10 = cb1b95f9 19e5791d, Mem[0000000030081400] = 9e3175ff d9f7426a
	stda	%f10,[%i2+%g0]0x89	! Mem[0000000030081400] = cb1b95f9 19e5791d
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = b2031327, %l5 = ff435c87f282b2f2
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 000000000000b203

p0_label_29:
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000030101410] = d1d690ff, %l3 = fffffffffffff759
	ldsha	[%i4+%o5]0x89,%l3	! %l3 = ffffffffffff90ff
!	Mem[0000000010081400] = cb1b95f9, %l3 = ffffffffffff90ff
	ldsha	[%i2+%g0]0x80,%l3	! %l3 = ffffffffffffcb1b
!	Mem[00000000300c1400] = c733f359, %l6 = 00000000000000ff
	lduwa	[%i3+%g0]0x81,%l6	! %l6 = 00000000c733f359
!	Mem[0000000010181408] = 00000000, %l4 = 000000009650fa58
	lduha	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = 5c17cccd, %f1  = 967a7622
	lda	[%i3+%o5]0x88,%f1 	! %f1 = 5c17cccd
!	Mem[00000000100c1418] = 845c2afa, %l3 = ffffffffffffcb1b
	swap	[%i3+0x018],%l3		! %l3 = 00000000845c2afa
!	Mem[0000000030101400] = 30000000, %l4 = 0000000000000000
	lduha	[%i4+%g0]0x81,%l4	! %l4 = 0000000000003000
!	Mem[0000000010041400] = 415b7300, %l0 = 0000000000000057
	ldsha	[%i1+%g0]0x88,%l0	! %l0 = 0000000000007300
!	Mem[0000000010001408] = f2b282f258fa5096, %f30 = 415b7300 73441245
	ldda	[%i0+%o4]0x88,%f30	! %f30 = f2b282f2 58fa5096
!	Starting 10 instruction Store Burst
!	Mem[0000000010181418] = 0000004c55a6359c, %l5 = 000000000000b203, %l0 = 0000000000007300
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l5,%l0	! %l0 = 0000004c55a6359c

p0_label_30:
!	%l6 = 00000000c733f359, Mem[00000000201c0001] = f7597e52
	stb	%l6,[%o0+0x001]		! Mem[00000000201c0000] = f7597e52
!	Mem[0000000010141408] = d1d690ff, %l0 = 0000004c55a6359c
	swapa	[%i5+%o4]0x80,%l0	! %l0 = 00000000d1d690ff
!	Mem[0000000010141408] = 9c35a655, %l7 = 000000000000ff43
	ldstuba	[%i5+%o4]0x88,%l7	! %l7 = 00000055000000ff
!	Mem[0000000010141400] = 577ef359, %l7 = 0000000000000055
	ldstuba	[%i5+%g0]0x80,%l7	! %l7 = 00000057000000ff
!	%f14 = 577e0000 59f3ffff, Mem[0000000010141400] = 59f37eff 22760000
	stda	%f14,[%i5+%g0]0x88	! Mem[0000000010141400] = 577e0000 59f3ffff
!	%l0 = d1d690ff, %l1 = dc645100, Mem[0000000010141410] = 00000000 30f7a220
	stda	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = d1d690ff dc645100
!	%l0 = 00000000d1d690ff, Mem[0000000030041408] = ff67df1317546bc1
	stxa	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000d1d690ff
!	Mem[0000000030101400] = 30000000, %l2 = 0000000000000013
	ldstuba	[%i4+%g0]0x81,%l2	! %l2 = 00000030000000ff
!	Mem[00000000218000c1] = 7e57f483, %l4 = 0000000000003000
	ldstuba	[%o3+0x0c1]%asi,%l4	! %l4 = 00000057000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 9650fa58, %l4 = 0000000000000057
	lduha	[%i6+%o5]0x88,%l4	! %l4 = 000000000000fa58

p0_label_31:
!	Mem[0000000030001408] = ff00006e, %l2 = 0000000000000030
	lduwa	[%i0+%o4]0x81,%l2	! %l2 = 00000000ff00006e
!	Mem[00000000201c0000] = f7597e52, %l0 = 00000000d1d690ff
	lduh	[%o0+%g0],%l0		! %l0 = 000000000000f759
!	Mem[0000000010101400] = 30000000, %l2 = 00000000ff00006e
	ldswa	[%i4+%g0]0x80,%l2	! %l2 = 0000000030000000
!	Mem[0000000030041400] = ff435c87 f282b2f2, %l4 = 0000fa58, %l5 = 0000b203
	ldda	[%i1+%g0]0x81,%l4	! %l4 = 00000000ff435c87 00000000f282b2f2
!	Mem[0000000030001400] = 041952ff, %l4 = 00000000ff435c87
	lduha	[%i0+%g0]0x89,%l4	! %l4 = 00000000000052ff
!	Mem[0000000030141400] = fe813cbc, %l5 = 00000000f282b2f2
	lduba	[%i5+%g0]0x81,%l5	! %l5 = 00000000000000fe
!	Mem[00000000100c1408] = ff000000, %l1 = 00c10fffdc645100
	lduwa	[%i3+%o4]0x88,%l1	! %l1 = 00000000ff000000
!	Mem[0000000030041408] = 00000000d1d690ff, %l2 = 0000000030000000
	ldxa	[%i1+%o4]0x81,%l2	! %l2 = 00000000d1d690ff
!	Mem[0000000010101400] = 00000030, %l3 = 00000000845c2afa
	ldsba	[%i4+%g0]0x88,%l3	! %l3 = 0000000000000030
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 6e0000ff, %l0 = 000000000000f759
	ldswa	[%i0+%o4]0x89,%l0	! %l0 = 000000006e0000ff

p0_label_32:
!	Mem[0000000010101420] = d552b40800000013, %l0 = 000000006e0000ff, %l7 = 0000000000000057
	add	%i4,0x20,%g1
	casxa	[%g1]0x80,%l0,%l7	! %l7 = d552b40800000013
!	%l0 = 000000006e0000ff, Mem[00000000218000c1] = 7efff483, %asi = 80
	stba	%l0,[%o3+0x0c1]%asi	! Mem[00000000218000c0] = 7efff483
!	Mem[00000000100c1400] = f127e800, %l3 = 0000000000000030
	ldstuba	[%i3+%g0]0x80,%l3	! %l3 = 000000f1000000ff
!	%f6  = 86e6a113, Mem[0000000030081400] = 19e5791d
	sta	%f6 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 86e6a113
!	Mem[000000001000140a] = 9650fa58, %l2 = 00000000d1d690ff
	ldstuba	[%i0+0x00a]%asi,%l2	! %l2 = 000000fa000000ff
!	Mem[0000000010001400] = b9b4bd5e, %l4 = 00000000000052ff
	lduha	[%i0+%g0]0x88,%l4	! %l4 = 000000000000bd5e
!	%f16 = 00002ed9 00000030, Mem[0000000030041400] = ff435c87 f282b2f2
	stda	%f16,[%i1+%g0]0x81	! Mem[0000000030041400] = 00002ed9 00000030
!	%l2 = 00000000000000fa, Mem[0000000010041408] = fe849ee113a1e6ff
	stxa	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000000000fa
!	%l0 = 000000006e0000ff, Mem[0000000010101430] = e015433c, %asi = 80
	stba	%l0,[%i4+0x030]%asi	! Mem[0000000010101430] = ff15433c
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 13a1e686, %l3 = 00000000000000f1
	ldsba	[%i2+%g0]0x81,%l3	! %l3 = 0000000000000013

p0_label_33:
!	Mem[0000000010101410] = 64ec388c 2487796b, %l2 = 000000fa, %l3 = 00000013
	ldda	[%i4+%o5]0x80,%l2	! %l2 = 0000000064ec388c 000000002487796b
!	Mem[0000000010141400] = fffff359, %l1 = 00000000ff000000
	ldsb	[%i5+0x001],%l1		! %l1 = ffffffffffffffff
!	%l4 = 000000000000bd5e, Mem[00000000100c1400] = 00e827ff
	stha	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00e8bd5e
!	Mem[0000000030081408] = 00ffffca, %f10 = cb1b95f9
	lda	[%i2+%o4]0x81,%f10	! %f10 = 00ffffca
!	Mem[000000001010141c] = 9c3087ad, %l1 = ffffffffffffffff
	ldsha	[%i4+0x01c]%asi,%l1	! %l1 = ffffffffffff9c30
!	Mem[0000000030101410] = ff90d6d1, %l6 = 00000000c733f359
	lduha	[%i4+%o5]0x81,%l6	! %l6 = 000000000000ff90
!	Mem[0000000030141408] = 22ec64ac, %l5 = 00000000000000fe
	ldsha	[%i5+%o4]0x89,%l5	! %l5 = 00000000000064ac
!	Mem[0000000010001408] = 9650ff58 f282b2f2, %l0 = 6e0000ff, %l1 = ffff9c30
	ldda	[%i0+%o4]0x80,%l0	! %l0 = 000000009650ff58 00000000f282b2f2
!	Mem[0000000010081400] = cb1b95f919e5791d, %f16 = 00002ed9 00000030
	ldda	[%i2+%g0]0x80,%f16	! %f16 = cb1b95f9 19e5791d
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = ca3195ab, %l4 = 000000000000bd5e
	swapa	[%i6+%o4]0x89,%l4	! %l4 = 00000000ca3195ab

p0_label_34:
!	%f0  = 577e0000 5c17cccd, Mem[0000000030101408] = d9ffffff ab9531ca
	stda	%f0 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 577e0000 5c17cccd
!	Mem[0000000030181410] = 6b798724, %l1 = 00000000f282b2f2
	swapa	[%i6+%o5]0x81,%l1	! %l1 = 000000006b798724
!	%l0 = 000000009650ff58, Mem[0000000010041410] = ffacbc60
	stha	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = ff58bc60
!	Mem[0000000030101400] = ff000000, %l2 = 0000000064ec388c
	ldstuba	[%i4+%g0]0x81,%l2	! %l2 = 000000ff000000ff
!	%l2 = 000000ff, %l3 = 2487796b, Mem[00000000100c1428] = ccd93a65 ef76192f
	std	%l2,[%i3+0x028]		! Mem[00000000100c1428] = 000000ff 2487796b
!	Mem[0000000010101438] = 4512447300735b41, %l6 = 000000000000ff90, %l7 = d552b40800000013
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l6,%l7	! %l7 = 4512447300735b41
!	%l2 = 00000000000000ff, Mem[0000000021800081] = ffffbc25
	stb	%l2,[%o3+0x081]		! Mem[0000000021800080] = ffffbc25
!	Mem[0000000030001410] = 7443626c, %l7 = 4512447300735b41
	swapa	[%i0+%o5]0x89,%l7	! %l7 = 000000007443626c
!	%f30 = f2b282f2, Mem[0000000010101400] = 00000030
	sta	%f30,[%i4+%g0]0x88	! Mem[0000000010101400] = f2b282f2
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ac64ec22, %l0 = 000000009650ff58
	ldswa	[%i5+%o4]0x81,%l0	! %l0 = ffffffffac64ec22

p0_label_35:
!	Mem[0000000030101410] = d1d690ff, %l7 = 000000007443626c
	ldswa	[%i4+%o5]0x89,%l7	! %l7 = ffffffffd1d690ff
!	Mem[0000000030041410] = ff00006e, %f22 = ad87309c
	lda	[%i1+%o5]0x81,%f22	! %f22 = ff00006e
!	Mem[0000000010001408] = 58ff5096, %l6 = 000000000000ff90
	ldsba	[%i0+%o4]0x88,%l6	! %l6 = ffffffffffffff96
!	Mem[00000000300c1410] = 4401d76bc7ec2a7e, %f2  = 64ec388c 3ef18701
	ldda	[%i3+%o5]0x81,%f2 	! %f2  = 4401d76b c7ec2a7e
!	Mem[0000000010181408] = 0000000000000033, %f12 = 9162379f 804b26e1
	ldda	[%i6+%o4]0x80,%f12	! %f12 = 00000000 00000033
!	Mem[0000000010101410] = 64ec388c, %l3 = 000000002487796b
	lduha	[%i4+%o5]0x80,%l3	! %l3 = 00000000000064ec
!	Mem[0000000030181410] = f2b282f2, %l2 = 00000000000000ff
	lduwa	[%i6+%o5]0x89,%l2	! %l2 = 00000000f2b282f2
!	Mem[0000000010141408] = ffa6359c9c3087ad, %l2 = 00000000f2b282f2
	ldx	[%i5+%o4],%l2		! %l2 = ffa6359c9c3087ad
!	Mem[0000000010041408] = 000000fa, %l1 = 000000006b798724
	lduba	[%i1+%o4]0x88,%l1	! %l1 = 00000000000000fa
!	Starting 10 instruction Store Burst
!	%f14 = 577e0000, Mem[0000000030041410] = ff00006e
	sta	%f14,[%i1+%o5]0x81	! Mem[0000000030041410] = 577e0000

p0_label_36:
!	%l4 = ca3195ab, %l5 = 000064ac, Mem[0000000030141410] = dc645100 00c10fff
	stda	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = ca3195ab 000064ac
!	%f6  = 86e6a113, Mem[0000000010081400] = f9951bcb
	sta	%f6 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 86e6a113
!	Mem[0000000030141408] = 22ec64ac, %l0 = ffffffffac64ec22
	swapa	[%i5+%o4]0x89,%l0	! %l0 = 0000000022ec64ac
!	%l6 = ffffff96, %l7 = d1d690ff, Mem[0000000010141400] = 59f3ffff 577e0000
	stda	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffff96 d1d690ff
!	%l4 = 00000000ca3195ab, Mem[0000000010141400] = 96ffffffff90d6d1
	stxa	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000ca3195ab
!	Mem[0000000010181408] = 00000000, %l0 = 0000000022ec64ac
	ldstuba	[%i6+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1410] = 5c17cccd, %l6 = ffffffffffffff96
	ldstuba	[%i3+%o5]0x88,%l6	! %l6 = 000000cd000000ff
!	Mem[0000000030041400] = d92e0000, %l4 = 00000000ca3195ab
	ldstuba	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181438] = 715a66fe, %l2 = ffa6359c9c3087ad
	ldstuba	[%i6+0x038]%asi,%l2	! %l2 = 00000071000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 13a1e686, %l4 = 0000000000000000
	lduha	[%i2+%o5]0x88,%l4	! %l4 = 000000000000e686

p0_label_37:
!	Mem[0000000010181408] = ff00000000000033, %l1 = 00000000000000fa
	ldxa	[%i6+0x008]%asi,%l1	! %l1 = ff00000000000033
!	Mem[0000000030081410] = ffb3186c, %l7 = ffffffffd1d690ff
	lduwa	[%i2+%o5]0x81,%l7	! %l7 = 00000000ffb3186c
!	Mem[0000000010041400] = 415b7300, %l4 = 000000000000e686
	lduba	[%i1+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081408] = 00ffffca 000000ff, %l2 = 00000071, %l3 = 000064ec
	ldda	[%i2+%o4]0x81,%l2	! %l2 = 0000000000ffffca 00000000000000ff
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000030001400] = ff521904 284a198a ff00006e 3e2116ef
!	Mem[0000000030001410] = 415b7300 a601a6c2 38d4dbf9 529ac29e
!	Mem[0000000030001420] = 64cc4306 c43dfc12 7a807c68 d22f44e8
!	Mem[0000000030001430] = ebd37259 6316adec 14755347 6d6c1a5b
	ldda	[%i0]ASI_BLK_S,%f0	! Block Load from 0000000030001400
!	Mem[0000000010141408] = ffa6359c, %l2 = 0000000000ffffca
	lduba	[%i5+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141420] = 41d24e96, %l5 = 00000000000064ac
	ldsh	[%i5+0x020],%l5		! %l5 = 00000000000041d2
!	Mem[0000000010101400] = f282b2f2, %l7 = 00000000ffb3186c
	lduwa	[%i4+%g0]0x80,%l7	! %l7 = 00000000f282b2f2
!	Mem[0000000010101420] = d552b40800000013, %f18 = ab9531ca d9ffffff
	ldda	[%i4+0x020]%asi,%f18	! %f18 = d552b408 00000013
!	Starting 10 instruction Store Burst
!	%l0 = 00000000, %l1 = 00000033, Mem[0000000030041400] = ff002ed9 00000030
	stda	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000 00000033

p0_label_38:
!	%l6 = 000000cd, %l7 = f282b2f2, Mem[0000000010001410] = c733f359 807d8e22
	stda	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000cd f282b2f2
!	%l4 = 00000000, %l5 = 000041d2, Mem[00000000100c1400] = 5ebde800 0e4059ed
	stda	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000 000041d2
!	%l3 = 00000000000000ff, Mem[0000000010001408] = 9650ff58
	stha	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 00ffff58
!	%l3 = 00000000000000ff, Mem[0000000010101408] = d9ffffff
	stba	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = d9ffffff
!	%l2 = 00000000000000ff, Mem[0000000020800001] = ff4fca09
	stb	%l2,[%o1+0x001]		! Mem[0000000020800000] = ffffca09
!	Mem[000000001008143c] = 00735b41, %l0 = 0000000000000000
	swap	[%i2+0x03c],%l0		! %l0 = 0000000000735b41
!	%l0 = 0000000000735b41, Mem[00000000300c1410] = 6bd70144
	stba	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 6bd70141
!	Mem[0000000010001410] = cd000000, %l0 = 0000000000735b41
	swapa	[%i0+%o5]0x88,%l0	! %l0 = 00000000cd000000
!	%l4 = 0000000000000000, Mem[0000000010041418] = 93c2c0d9
	stw	%l4,[%i1+0x018]		! Mem[0000000010041418] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ffa6359c9c3087ad, %f24 = 4593cf9d 08b452d5
	ldd	[%i5+%o4],%f24		! %f24 = ffa6359c 9c3087ad

p0_label_39:
!	Mem[0000000030141410] = ab9531ca, %l6 = 00000000000000cd
	lduha	[%i5+%o5]0x81,%l6	! %l6 = 000000000000ab95
!	Mem[0000000030141400] = bc3c81fe, %l3 = 00000000000000ff
	lduba	[%i5+%g0]0x89,%l3	! %l3 = 00000000000000fe
!	Mem[0000000010181410] = 58fa5096, %l6 = 000000000000ab95
	ldsw	[%i6+%o5],%l6		! %l6 = 0000000058fa5096
!	Mem[0000000030181408] = ffffffd9 0000bd5e, %l0 = cd000000, %l1 = 00000033
	ldda	[%i6+%o4]0x89,%l0	! %l0 = 000000000000bd5e 00000000ffffffd9
!	Mem[0000000010081400] = 86e6a113, %l5 = 00000000000041d2
	ldswa	[%i2+%g0]0x88,%l5	! %l5 = ffffffff86e6a113
!	Mem[0000000020800040] = 63ff095a, %l4 = 0000000000000000
	ldsb	[%o1+0x041],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030101408] = 5c17cccd, %l6 = 0000000058fa5096
	ldswa	[%i4+%o4]0x89,%l6	! %l6 = 000000005c17cccd
!	Mem[00000000100c1408] = 000000ff, %l6 = 000000005c17cccd
	ldsha	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = f282b2f2, %l1 = 00000000ffffffd9
	ldsba	[%i4+%g0]0x80,%l1	! %l1 = fffffffffffffff2
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = f282b2f2, %l3 = 00000000000000fe
	ldstuba	[%i4+%g0]0x80,%l3	! %l3 = 000000f2000000ff

p0_label_40:
!	Mem[0000000010041410] = 60bc58ff, %l2 = 00000000000000ff
	ldstuba	[%i1+%o5]0x88,%l2	! %l2 = 000000ff000000ff
!	%l1 = fffffffffffffff2, Mem[0000000010041410] = 83c8418f60bc58ff
	stxa	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = fffffffffffffff2
!	%l2 = 00000000000000ff, Mem[0000000030181400] = 00002ed9
	stha	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 00ff2ed9
!	%f20 = 6b798724 d1d690ff, %l4 = ffffffffffffffff
!	Mem[0000000030101428] = 21081c6c3b040418
	add	%i4,0x028,%g1
	stda	%f20,[%g1+%l4]ASI_PST16_SL ! Mem[0000000030101428] = ff90d6d12487796b
!	%l0 = 000000000000bd5e, Mem[0000000010181408] = ff000000
	stha	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = bd5e0000
!	%l7 = 00000000f282b2f2, Mem[0000000030041410] = 00007e57
	stwa	%l7,[%i1+%o5]0x89	! Mem[0000000030041410] = f282b2f2
!	%l6 = 0000000000000000, Mem[0000000030181400] = 00ff2ed9
	stwa	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	%l3 = 00000000000000f2, Mem[00000000100c1420] = 370b6648597dd6d2
	stx	%l3,[%i3+0x020]		! Mem[00000000100c1420] = 00000000000000f2
!	Mem[0000000030181400] = 00000000, %l0 = 000000000000bd5e
	ldstuba	[%i6+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff82b2f2d92e0000, %l7 = 00000000f282b2f2
	ldx	[%i4+%g0],%l7		! %l7 = ff82b2f2d92e0000

p0_label_41:
!	Mem[000000001004142c] = a7e1c4ff, %l7 = ff82b2f2d92e0000
	lduba	[%i1+0x02d]%asi,%l7	! %l7 = 00000000000000e1
!	Mem[0000000020800040] = 63ff095a, %l0 = 0000000000000000
	ldsh	[%o1+0x040],%l0		! %l0 = 00000000000063ff
!	Mem[0000000010001408] = 00ffff58, %l1 = fffffffffffffff2
	lduba	[%i0+0x008]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081408] = ff000000 caffff00, %l4 = ffffffff, %l5 = 86e6a113
	ldda	[%i2+%o4]0x89,%l4	! %l4 = 00000000caffff00 00000000ff000000
!	Mem[00000000300c1400] = c733f359807d8e22, %f20 = 6b798724 d1d690ff
	ldda	[%i3+%g0]0x81,%f20	! %f20 = c733f359 807d8e22
!	Mem[00000000100c1430] = be0f56d7, %l6 = 0000000000000000
	ldub	[%i3+0x032],%l6		! %l6 = 0000000000000056
!	Mem[0000000010041410] = fffffff2, %l0 = 00000000000063ff
	lduwa	[%i1+%o5]0x88,%l0	! %l0 = 00000000fffffff2
!	Mem[0000000010001410] = 00735b41, %l0 = 00000000fffffff2
	lduba	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000041
!	Mem[0000000030181410] = ff90d6d1 f2b282f2, %l6 = 00000056, %l7 = 000000e1
	ldda	[%i6+%o5]0x89,%l6	! %l6 = 00000000f2b282f2 00000000ff90d6d1
!	Starting 10 instruction Store Burst
!	%f12 = ebd37259 6316adec, %l5 = 00000000ff000000
!	Mem[0000000010081418] = f0215fa0d8e04699
	add	%i2,0x018,%g1
	stda	%f12,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010081418] = f0215fa0d8e04699

p0_label_42:
!	%l0 = 0000000000000041, Mem[0000000010101410] = 8c38ec64
	stha	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 8c380041
!	Mem[0000000010081408] = c100e9a3, %l4 = 00000000caffff00
	ldstuba	[%i2+%o4]0x88,%l4	! %l4 = 000000a3000000ff
!	%l4 = 000000a3, %l5 = ff000000, Mem[0000000030141410] = ca3195ab 000064ac
	stda	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000a3 ff000000
!	Mem[0000000010001410] = 00735b41, %l5 = 00000000ff000000
	ldstuba	[%i0+%o5]0x88,%l5	! %l5 = 00000041000000ff
!	Mem[000000001004142c] = a7e1c4ff, %l3 = 000000f2, %l4 = 000000a3
	add	%i1,0x2c,%g1
	casa	[%g1]0x80,%l3,%l4	! %l4 = 00000000a7e1c4ff
!	%l5 = 0000000000000041, Mem[00000000300c1400] = c733f359807d8e22
	stxa	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000000000041
!	%f13 = 6316adec, Mem[0000000010001408] = 58ffff00
	sta	%f13,[%i0+%o4]0x88	! Mem[0000000010001408] = 6316adec
!	Mem[0000000030101400] = ff000000, %l6 = 00000000f2b282f2
	ldstuba	[%i4+%g0]0x81,%l6	! %l6 = 000000ff000000ff
!	Mem[000000001000140c] = f282b2f2, %l4 = 00000000a7e1c4ff
	swap	[%i0+0x00c],%l4		! %l4 = 00000000f282b2f2
!	Starting 10 instruction Load Burst
!	%l2 = 00000000000000ff, imm = 00000000000002ea, %l7 = 00000000ff90d6d1
	orn	%l2,0x2ea,%l7		! %l7 = fffffffffffffdff

p0_label_43:
!	Mem[0000000010101408] = ffffffd9ca3195ab, %l2 = 00000000000000ff
	ldxa	[%i4+%o4]0x80,%l2	! %l2 = ffffffd9ca3195ab
!	Mem[0000000010081408] = ab9531cac100e9ff, %f28 = 7c4ad602 3c4315e0
	ldda	[%i2+%o4]0x88,%f28	! %f28 = ab9531ca c100e9ff
!	Mem[00000000300c1408] = 86e6a1ff, %l5 = 0000000000000041
	lduha	[%i3+%o4]0x89,%l5	! %l5 = 000000000000a1ff
!	Mem[0000000010181408] = bd5e0000, %l5 = 000000000000a1ff
	ldsba	[%i6+%o4]0x80,%l5	! %l5 = ffffffffffffffbd
!	Mem[0000000030041408] = 00000000, %l1 = 0000000000000000
	ldsha	[%i1+%o4]0x89,%l1	! %l1 = 0000000000000000
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000030141400] = fe813cbc 00007e57 22ec64ac 21198762
!	Mem[0000000030141410] = a3000000 000000ff 814f8833 e255b5f4
!	Mem[0000000030141420] = 40577e51 04a24db6 a6568bbe 7e80b946
!	Mem[0000000030141430] = 2bd71cbc 9dc1869c 500bbc13 5eb92bab
	ldda	[%i5]ASI_BLK_AIUS,%f0	! Block Load from 0000000030141400
!	Mem[0000000010001410] = 00735bff, %l1 = 0000000000000000
	ldsha	[%i0+%o5]0x88,%l1	! %l1 = 0000000000005bff
!	Mem[0000000020800040] = 63ff095a, %l1 = 0000000000005bff
	ldub	[%o1+0x040],%l1		! %l1 = 0000000000000063
!	Mem[0000000030001408] = 6e0000ff, %l5 = ffffffffffffffbd
	ldswa	[%i0+%o4]0x89,%l5	! %l5 = 000000006e0000ff
!	Starting 10 instruction Store Burst
!	%l4 = f282b2f2, %l5 = 6e0000ff, Mem[0000000030101410] = d1d690ff 6b798724
	stda	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = f282b2f2 6e0000ff

p0_label_44:
!	%l4 = f282b2f2, %l5 = 6e0000ff, Mem[00000000300c1408] = ffa1e686 0000004c
	stda	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = f282b2f2 6e0000ff
!	%l7 = fffffffffffffdff, Mem[0000000030101400] = ff000000
	stwa	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = fffffdff
!	%l2 = ffffffd9ca3195ab, %l5 = 000000006e0000ff, %y  = 00000000
	umul	%l2,%l5,%l5		! %l5 = 56e14f18e1641555, %y = 56e14f18
!	%l5 = 56e14f18e1641555, Mem[0000000010041438] = 4dd06b24c3bec231
	stx	%l5,[%i1+0x038]		! Mem[0000000010041438] = 56e14f18e1641555
!	%f21 = 807d8e22, Mem[0000000030081408] = caffff00
	sta	%f21,[%i2+%o4]0x89	! Mem[0000000030081408] = 807d8e22
!	Mem[0000000030041410] = f2b282f2, %l6 = 00000000000000ff
	swapa	[%i1+%o5]0x81,%l6	! %l6 = 00000000f2b282f2
!	%f26 = 1804043b, Mem[0000000010041434] = ecd17a46
	st	%f26,[%i1+0x034]	! Mem[0000000010041434] = 1804043b
!	Mem[0000000030101410] = f2b282f2, %l6 = 00000000f2b282f2
	swapa	[%i4+%o5]0x81,%l6	! %l6 = 00000000f2b282f2
!	%l2 = ffffffd9ca3195ab, Mem[0000000030041410] = ff000000
	stwa	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = ca3195ab
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 415b7300, %l2 = ffffffd9ca3195ab
	ldsha	[%i1+%g0]0x88,%l2	! %l2 = 0000000000007300

p0_label_45:
!	Mem[0000000010041408] = fa000000, %l4 = 00000000f282b2f2
	lduba	[%i1+%o4]0x80,%l4	! %l4 = 00000000000000fa
!	%l2 = 0000000000007300, Mem[00000000201c0001] = f7597e52, %asi = 80
	stba	%l2,[%o0+0x001]%asi	! Mem[00000000201c0000] = f7007e52
!	%f22 = ff00006e, Mem[0000000010141400] = 00000000
	sta	%f22,[%i5+%g0]0x88	! Mem[0000000010141400] = ff00006e
!	Mem[0000000030141410] = a3000000, %l3 = 00000000000000f2
	ldsba	[%i5+%o5]0x81,%l3	! %l3 = ffffffffffffffa3
!	Mem[00000000218001c0] = 19eabc74, %l6 = 00000000f2b282f2
	ldub	[%o3+0x1c0],%l6		! %l6 = 0000000000000019
!	Mem[000000001010142c] = 3b040418, %l2 = 0000000000007300
	lduwa	[%i4+0x02c]%asi,%l2	! %l2 = 000000003b040418
!	Mem[0000000030181408] = 0000bd5e, %l0 = 0000000000000041
	lduha	[%i6+%o4]0x89,%l0	! %l0 = 000000000000bd5e
!	Mem[0000000030181408] = 0000bd5e, %f18 = d552b408
	lda	[%i6+%o4]0x89,%f18	! %f18 = 0000bd5e
!	Mem[0000000010101410] = 4100388c 2487796b, %l2 = 3b040418, %l3 = ffffffa3
	ldda	[%i4+%o5]0x80,%l2	! %l2 = 000000004100388c 000000002487796b
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000fa, Mem[0000000010101414] = 2487796b
	sth	%l4,[%i4+0x014]		! Mem[0000000010101414] = 00fa796b

p0_label_46:
!	%l3 = 000000002487796b, Mem[0000000010141408] = ffa6359c9c3087ad
	stxa	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000002487796b
!	Mem[0000000010041418] = 00000000, %l7 = fffffffffffffdff
	ldsha	[%i1+0x01a]%asi,%l7	! %l7 = 0000000000000000
!	%f24 = ffa6359c 9c3087ad, %l2 = 000000004100388c
!	Mem[0000000030041400] = 0000000000000033
	stda	%f24,[%i1+%l2]ASI_PST32_SL ! Mem[0000000030041400] = 0000000000000033
!	Mem[0000000030041410] = ab9531ca, %l6 = 0000000000000019
	ldstuba	[%i1+%o5]0x81,%l6	! %l6 = 000000ab000000ff
!	%l4 = 000000fa, %l5 = e1641555, Mem[0000000030101408] = cdcc175c 00007e57
	stda	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000fa e1641555
!	%l5 = 56e14f18e1641555, Mem[0000000030001400] = 041952ff
	stba	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 04195255
!	Mem[0000000010001410] = 00735bff, %l6 = 00000000000000ab
	ldstuba	[%i0+%o5]0x88,%l6	! %l6 = 000000ff000000ff
!	Mem[000000001008141c] = d8e04699, %l2 = 000000004100388c
	swap	[%i2+0x01c],%l2		! %l2 = 00000000d8e04699
!	Mem[0000000010141434] = 00735bb3, %l5 = 56e14f18e1641555, %asi = 80
	swapa	[%i5+0x034]%asi,%l5	! %l5 = 0000000000735bb3
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000, %l3 = 000000002487796b
	lduwa	[%i1+%o4]0x81,%l3	! %l3 = 0000000000000000

p0_label_47:
!	Mem[0000000030181410] = f2b282f2, %l0 = 000000000000bd5e
	lduwa	[%i6+%o5]0x89,%l0	! %l0 = 00000000f2b282f2
!	Mem[0000000010181400] = 3ef18701, %l6 = 00000000000000ff
	lduha	[%i6+%g0]0x80,%l6	! %l6 = 0000000000003ef1
!	Mem[0000000010141400] = ff00006e, %f9  = 04a24db6
	lda	[%i5+%g0]0x88,%f9 	! %f9 = ff00006e
!	Mem[0000000010101410] = 4100388c00fa796b, %l0 = 00000000f2b282f2
	ldxa	[%i4+%o5]0x80,%l0	! %l0 = 4100388c00fa796b
!	Mem[00000000218000c0] = 7efff483, %l4 = 00000000000000fa
	ldsha	[%o3+0x0c0]%asi,%l4	! %l4 = 0000000000007eff
!	Mem[0000000010001410] = 00735bff, %l1 = 0000000000000063
	lduwa	[%i0+%o5]0x88,%l1	! %l1 = 0000000000735bff
!	Mem[0000000010041438] = 56e14f18, %l5 = 0000000000735bb3
	lduba	[%i1+0x03b]%asi,%l5	! %l5 = 0000000000000018
!	Mem[0000000010001410] = 00735bff, %l3 = 0000000000000000
	ldsha	[%i0+%o5]0x88,%l3	! %l3 = 0000000000005bff
!	Mem[0000000030101400] = fffffdff, %l1 = 0000000000735bff
	lduwa	[%i4+%g0]0x81,%l1	! %l1 = 00000000fffffdff
!	Starting 10 instruction Store Burst
!	%l0 = 4100388c00fa796b, Mem[0000000010181400] = 0187f13e
	stba	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 0187f16b

p0_label_48:
!	Mem[0000000010181408] = bd5e0000, %l0 = 4100388c00fa796b
	ldstuba	[%i6+%o4]0x80,%l0	! %l0 = 000000bd000000ff
!	Mem[0000000030081400] = 86e6a113, %l4 = 0000000000007eff
	swapa	[%i2+%g0]0x89,%l4	! %l4 = 0000000086e6a113
!	Mem[0000000010181408] = 00005eff, %l7 = 0000000000000000
	swapa	[%i6+%o4]0x88,%l7	! %l7 = 0000000000005eff
!	Mem[0000000030081408] = 807d8e22, %l0 = 00000000000000bd
	ldstuba	[%i2+%o4]0x89,%l0	! %l0 = 00000022000000ff
!	%l7 = 0000000000005eff, Mem[0000000030181400] = ff00000000000030
	stxa	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000000005eff
!	%f16 = cb1b95f9 19e5791d 0000bd5e 00000013
!	%f20 = c733f359 807d8e22 ff00006e 98fc46e5
!	%f24 = ffa6359c 9c3087ad 1804043b 6c1c0821
!	%f28 = ab9531ca c100e9ff f2b282f2 58fa5096
	stda	%f16,[%i2]ASI_BLK_SL	! Block Store to 0000000030081400
!	%f8  = 40577e51, Mem[0000000030041410] = ff9531ca
	sta	%f8 ,[%i1+%o5]0x81	! Mem[0000000030041410] = 40577e51
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000010081400] = 13a1e686, %l2 = 00000000d8e04699
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 0000000013a1e686
!	%l7 = 0000000000005eff, Mem[0000000030141400] = fe813cbc
	stba	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = ff813cbc
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = c2a601a600735b41, %l1 = 00000000fffffdff
	ldxa	[%i0+%o5]0x89,%l1	! %l1 = c2a601a600735b41

p0_label_49:
!	Mem[0000000010081410] = 86e6a113, %l3 = 0000000000005bff
	lduwa	[%i2+%o5]0x80,%l3	! %l3 = 0000000086e6a113
!	Mem[00000000201c0000] = f7007e52, %l2 = 0000000013a1e686
	ldsba	[%o0+0x000]%asi,%l2	! %l2 = fffffffffffffff7
!	Mem[00000000300c1408] = f282b2f2, %l6 = 0000000000003ef1
	ldsha	[%i3+%o4]0x81,%l6	! %l6 = fffffffffffff282
!	Mem[0000000010181420] = 5148fd82, %l0 = 0000000000000022
	lduh	[%i6+0x020],%l0		! %l0 = 0000000000005148
!	Mem[0000000010041408] = fa000000, %l6 = fffffffffffff282
	ldsba	[%i1+%o4]0x80,%l6	! %l6 = fffffffffffffffa
!	Mem[00000000100c1400] = 00000000, %l2 = fffffffffffffff7
	ldsba	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181408] = 5ebd0000, %f0  = fe813cbc
	lda	[%i6+%o4]0x81,%f0 	! %f0 = 5ebd0000
!	Mem[0000000030001400] = 04195255, %l5 = 0000000000000018
	lduwa	[%i0+%g0]0x89,%l5	! %l5 = 0000000004195255
!	Mem[0000000030141410] = a3000000, %f4  = a3000000
	lda	[%i5+%o5]0x81,%f4 	! %f4 = a3000000
!	Starting 10 instruction Store Burst
!	Mem[0000000021800081] = ffffbc25, %l2 = 0000000000000000
	ldstub	[%o3+0x081],%l2		! %l2 = 000000ff000000ff

p0_label_50:
!	%l6 = fffffffa, %l7 = 00005eff, Mem[0000000030141400] = ff813cbc 00007e57
	stda	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = fffffffa 00005eff
!	%f24 = ffa6359c 9c3087ad, Mem[0000000030141410] = 000000a3 ff000000
	stda	%f24,[%i5+%o5]0x89	! Mem[0000000030141410] = ffa6359c 9c3087ad
!	%f4  = a3000000 000000ff, Mem[0000000010081410] = 13a1e686 a7d82116
	stda	%f4 ,[%i2+%o5]0x88	! Mem[0000000010081410] = a3000000 000000ff
!	Mem[0000000030001408] = 6e0000ff, %l6 = fffffffffffffffa
	ldstuba	[%i0+%o4]0x89,%l6	! %l6 = 000000ff000000ff
!	%l5 = 0000000004195255, Mem[0000000010001400] = 5ebdb4b9
	stba	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 55bdb4b9
!	Mem[0000000030001408] = ff00006e, %l5 = 0000000004195255
	ldstuba	[%i0+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	%l1 = c2a601a600735b41, Mem[0000000010081408] = ffe900c1
	stwa	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 00735b41
!	Mem[0000000030141408] = ac64ec22, %l3 = 0000000086e6a113
	ldstuba	[%i5+%o4]0x89,%l3	! %l3 = 00000022000000ff
!	%f16 = cb1b95f9 19e5791d, Mem[0000000030081408] = 00000013 0000bd5e
	stda	%f16,[%i2+%o4]0x89	! Mem[0000000030081408] = cb1b95f9 19e5791d
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = b9b4bd55, %l5 = 00000000000000ff
	lduba	[%i0+%g0]0x88,%l5	! %l5 = 0000000000000055

p0_label_51:
!	Mem[0000000030181410] = f282b2f2, %l1 = c2a601a600735b41
	ldswa	[%i6+%o5]0x81,%l1	! %l1 = fffffffff282b2f2
!	Mem[0000000010001408] = ecad1663, %l1 = fffffffff282b2f2
	ldswa	[%i0+%o4]0x80,%l1	! %l1 = ffffffffecad1663
!	Mem[0000000030181408] = 5ebd0000, %l6 = 00000000000000ff
	lduwa	[%i6+%o4]0x81,%l6	! %l6 = 000000005ebd0000
!	Mem[0000000010081400] = d8e04699, %f23 = 98fc46e5
	lda	[%i2+%g0]0x80,%f23	! %f23 = d8e04699
!	Mem[0000000010181400] = 22767a96 0187f16b, %l0 = 00005148, %l1 = ecad1663
	ldda	[%i6+%g0]0x88,%l0	! %l0 = 000000000187f16b 0000000022767a96
!	Mem[00000000100c1410] = 5c17ccff, %l6 = 000000005ebd0000
	lduba	[%i3+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081410] = 807d8e22, %l1 = 0000000022767a96
	ldsha	[%i2+%o5]0x89,%l1	! %l1 = ffffffffffff8e22
!	Mem[0000000010141408] = 6b79872400000000, %l0 = 000000000187f16b
	ldxa	[%i5+%o4]0x88,%l0	! %l0 = 6b79872400000000
!	Mem[00000000218001c0] = 19eabc74, %l1 = ffffffffffff8e22
	ldsb	[%o3+0x1c0],%l1		! %l1 = 0000000000000019
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 19e5791d, %l5 = 0000000000000055
	ldstuba	[%i2+%o4]0x89,%l5	! %l5 = 0000001d000000ff

p0_label_52:
!	Mem[0000000010181404] = 967a7622, %l7 = 0000000000005eff
	swap	[%i6+0x004],%l7		! %l7 = 00000000967a7622
!	%f28 = ab9531ca c100e9ff, %l6 = 00000000000000ff
!	Mem[00000000300c1438] = a147a275f3ce4583
	add	%i3,0x038,%g1
	stda	%f28,[%g1+%l6]ASI_PST16_S ! Mem[00000000300c1438] = ab9531cac100e9ff
!	Mem[0000000010101408] = ffffffd9, %l6 = 00000000000000ff
	ldstuba	[%i4+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	%l4 = 0000000086e6a113, Mem[0000000010141408] = 00000000
	stha	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = a1130000
!	%l6 = 00000000000000ff, Mem[0000000010081400] = d8e04699
	stwa	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff
!	%f29 = c100e9ff, %f10 = a6568bbe
	fcmps	%fcc0,%f29,%f10		! %fcc0 = 1
!	Mem[000000001010140f] = ca3195ab, %l6 = 00000000000000ff
	ldstuba	[%i4+0x00f]%asi,%l6	! %l6 = 000000ab000000ff
!	%l0 = 00000000, %l1 = 00000019, Mem[0000000030081410] = 807d8e22 c733f359
	stda	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000 00000019
!	%f2  = 22ec64ac 21198762, Mem[0000000010001408] = ecad1663 a7e1c4ff
	std	%f2 ,[%i0+%o4]	! Mem[0000000010001408] = 22ec64ac 21198762
!	Starting 10 instruction Load Burst
!	Mem[0000000021800080] = ffffbc25, %l5 = 000000000000001d
	lduha	[%o3+0x080]%asi,%l5	! %l5 = 000000000000ffff

p0_label_53:
!	Mem[00000000100c1400] = 00000000, %l3 = 0000000000000022
	ldsha	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = b2031327, %l1 = 0000000000000019
	lduba	[%o2+0x001]%asi,%l1	! %l1 = 0000000000000003
!	Mem[00000000201c0000] = f7007e52, %l7 = 00000000967a7622
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = fffffffffffff700
!	Mem[0000000010141400] = ff00006e, %l5 = 000000000000ffff
	lduba	[%i5+%g0]0x88,%l5	! %l5 = 000000000000006e
!	Mem[0000000010141408] = a1130000, %l2 = 00000000000000ff
	lduwa	[%i5+%o4]0x80,%l2	! %l2 = 00000000a1130000
!	Mem[00000000100c1400] = 00000000, %l0 = 6b79872400000000
	ldsba	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1410] = 6bd70141, %l2 = 00000000a1130000
	lduha	[%i3+%o5]0x89,%l2	! %l2 = 0000000000000141
!	Mem[0000000030081400] = 1d79e519, %l5 = 000000000000006e
	ldswa	[%i2+%g0]0x81,%l5	! %l5 = 000000001d79e519
!	Mem[0000000030001400] = 55521904284a198a, %f20 = c733f359 807d8e22
	ldda	[%i0+%g0]0x81,%f20	! %f20 = 55521904 284a198a
!	Starting 10 instruction Store Burst
!	%l7 = fffffffffffff700, Mem[0000000030141410] = ad87309c
	stha	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = f700309c

p0_label_54:
!	%f6  = 814f8833 e255b5f4, Mem[0000000010101410] = 4100388c 00fa796b
	stda	%f6 ,[%i4+%o5]0x80	! Mem[0000000010101410] = 814f8833 e255b5f4
!	Mem[0000000030041410] = 40577e51, %l1 = 0000000000000003
	swapa	[%i1+%o5]0x81,%l1	! %l1 = 0000000040577e51
!	%l5 = 000000001d79e519, Mem[00000000100c1410] = ffcc175c
	stwa	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = 1d79e519
!	%f20 = 55521904 284a198a, Mem[0000000030081400] = 19e5791d cb1b95f9
	stda	%f20,[%i2+%g0]0x89	! Mem[0000000030081400] = 55521904 284a198a
!	%l6 = 000000ab, %l7 = fffff700, Mem[0000000010141418] = 618cf5a1 4aeb8874
	stda	%l6,[%i5+0x018]%asi	! Mem[0000000010141418] = 000000ab fffff700
!	%l2 = 00000141, %l3 = 00000000, Mem[00000000300c1410] = 6bd70141 7e2aecc7
	stda	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000141 00000000
!	%f0  = 5ebd0000 00007e57 22ec64ac 21198762
!	%f4  = a3000000 000000ff 814f8833 e255b5f4
!	%f8  = 40577e51 ff00006e a6568bbe 7e80b946
!	%f12 = 2bd71cbc 9dc1869c 500bbc13 5eb92bab
	stda	%f0,[%i0]ASI_BLK_AIUS	! Block Store to 0000000030001400
!	%l7 = fffffffffffff700, Mem[0000000010181408] = 00000000, %asi = 80
	stha	%l7,[%i6+0x008]%asi	! Mem[0000000010181408] = f7000000
!	%l0 = 0000000000000000, Mem[0000000010101408] = d9ffffff
	stha	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = d9ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ffffca09, %l0 = 0000000000000000
	lduha	[%o1+0x000]%asi,%l0	! %l0 = 000000000000ffff

p0_label_55:
!	Mem[00000000100c1428] = 000000ff, %l2 = 0000000000000141
	lduha	[%i3+0x028]%asi,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010001408] = 22ec64ac, %l6 = 00000000000000ab
	ldsba	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000022
!	Mem[0000000010101408] = 0000ffd9, %l1 = 0000000040577e51
	ldswa	[%i4+%o4]0x80,%l1	! %l1 = 000000000000ffd9
!	Mem[0000000010141410] = ff90d6d1005164dc, %f24 = ffa6359c 9c3087ad
	ldda	[%i5+%o5]0x80,%f24	! %f24 = ff90d6d1 005164dc
!	Mem[0000000010101408] = d9ff0000, %l2 = 0000000000000000
	ldsba	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101438] = 45124473, %l0 = 000000000000ffff
	lduw	[%i4+0x038],%l0		! %l0 = 0000000045124473
!	Mem[0000000010081410] = 000000ff, %l4 = 0000000086e6a113
	ldsba	[%i2+%o5]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030041400] = 0000000000000033, %f24 = ff90d6d1 005164dc
	ldda	[%i1+%g0]0x81,%f24	! %f24 = 00000000 00000033
!	Mem[0000000030181410] = f282b2f2, %l1 = 000000000000ffd9
	swapa	[%i6+%o5]0x81,%l1	! %l1 = 00000000f282b2f2
!	Starting 10 instruction Store Burst
!	Mem[0000000010141418] = 000000ab, %l5 = 000000001d79e519
	swap	[%i5+0x018],%l5		! %l5 = 00000000000000ab

p0_label_56:
!	%l5 = 00000000000000ab, Mem[00000000300c1408] = f282b2f26e0000ff
	stxa	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000000000ab
!	%l1 = 00000000f282b2f2, Mem[00000000100c1400] = 00000000
	stwa	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = f282b2f2
!	%l0 = 45124473, %l1 = f282b2f2, Mem[00000000300c1410] = 41010000 00000000
	stda	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 45124473 f282b2f2
!	%f9  = ff00006e, Mem[00000000300c1408] = 00000000
	sta	%f9 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff00006e
!	%f8  = 40577e51 ff00006e, Mem[0000000030141400] = fffffffa 00005eff
	stda	%f8 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 40577e51 ff00006e
!	%l1 = 00000000f282b2f2, Mem[0000000010181410] = 58fa509600000000
	stxa	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000f282b2f2
!	%f26 = 1804043b 6c1c0821, Mem[0000000010101410] = 814f8833 e255b5f4
	stda	%f26,[%i4+%o5]0x80	! Mem[0000000010101410] = 1804043b 6c1c0821
!	%l0 = 0000000045124473, Mem[0000000030101400] = fffdffff
	stwa	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = 45124473
!	%l6 = 0000000000000022, Mem[0000000010181408] = f700000000000033
	stx	%l6,[%i6+%o4]		! Mem[0000000010181408] = 0000000000000022
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 55bdb4b9, %l6 = 0000000000000022
	ldsha	[%i0+%g0]0x80,%l6	! %l6 = 00000000000055bd

p0_label_57:
!	Mem[0000000030001400] = 5ebd0000 00007e57, %l6 = 000055bd, %l7 = fffff700
	ldda	[%i0+%g0]0x81,%l6	! %l6 = 000000005ebd0000 0000000000007e57
!	Mem[0000000010181410] = 00000000f282b2f2, %l3 = 0000000000000000
	ldxa	[%i6+0x010]%asi,%l3	! %l3 = 00000000f282b2f2
!	Mem[0000000010141400] = 6e0000ff, %l7 = 0000000000007e57
	ldsh	[%i5+0x002],%l7		! %l7 = 00000000000000ff
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000010141400] = 6e0000ff ca3195ab a1130000 2487796b
!	Mem[0000000010141410] = ff90d6d1 005164dc 1d79e519 fffff700
!	Mem[0000000010141420] = 41d24e96 d494e1ff 00735b41 e10bde60
!	Mem[0000000010141430] = 45a78c73 e1641555 ffffffff c733f359
	ldda	[%i5]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010141400
!	Mem[00000000100c1400] = f282b2f2, %l2 = 0000000000000000
	lduba	[%i3+0x002]%asi,%l2	! %l2 = 00000000000000b2
!	Mem[0000000030081410] = 00000000, %f4  = a3000000
	lda	[%i2+%o5]0x89,%f4 	! %f4 = 00000000
!	Mem[0000000030001400] = 5ebd0000 00007e57 22ec64ac 21198762
!	Mem[0000000030001410] = a3000000 000000ff 814f8833 e255b5f4
!	Mem[0000000030001420] = 40577e51 ff00006e a6568bbe 7e80b946
!	Mem[0000000030001430] = 2bd71cbc 9dc1869c 500bbc13 5eb92bab
	ldda	[%i0]ASI_BLK_AIUS,%f0	! Block Load from 0000000030001400
!	Mem[0000000030001400] = 5ebd0000 00007e57 22ec64ac 21198762
!	Mem[0000000030001410] = a3000000 000000ff 814f8833 e255b5f4
!	Mem[0000000030001420] = 40577e51 ff00006e a6568bbe 7e80b946
!	Mem[0000000030001430] = 2bd71cbc 9dc1869c 500bbc13 5eb92bab
	ldda	[%i0]ASI_BLK_AIUS,%f0	! Block Load from 0000000030001400
!	Mem[0000000010081408] = 00735b41ca3195ab, %f20 = dc645100 d1d690ff
	ldda	[%i2+%o4]0x80,%f20	! %f20 = 00735b41 ca3195ab
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000b2, Mem[0000000010101418] = e546fc989c3087ad
	stx	%l2,[%i4+0x018]		! Mem[0000000010101418] = 00000000000000b2

p0_label_58:
!	%l6 = 000000005ebd0000, Mem[0000000010101410] = 21081c6c3b040418
	stxa	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000005ebd0000
!	Mem[0000000010041400] = 415b7300, %l3 = 00000000f282b2f2
	swapa	[%i1+%g0]0x88,%l3	! %l3 = 00000000415b7300
	membar	#Sync			! Added by membar checker (13)
!	%l2 = 00000000000000b2, Mem[0000000010141400] = 6e0000ff
	stwa	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000b2
!	%f2  = 22ec64ac, Mem[0000000030041408] = 00000000
	sta	%f2 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 22ec64ac
!	Mem[0000000010041438] = 56e14f18, %l6 = 000000005ebd0000, %asi = 80
	swapa	[%i1+0x038]%asi,%l6	! %l6 = 0000000056e14f18
!	%f14 = 500bbc13 5eb92bab, Mem[0000000030101400] = 45124473 00002ed9
	stda	%f14,[%i4+%g0]0x89	! Mem[0000000030101400] = 500bbc13 5eb92bab
!	%f22 = 00f7ffff 19e5791d, Mem[0000000010101400] = ff82b2f2 d92e0000
	stda	%f22,[%i4+%g0]0x80	! Mem[0000000010101400] = 00f7ffff 19e5791d
!	%f28 = 551564e1, Mem[0000000030001400] = 0000bd5e
	sta	%f28,[%i0+%g0]0x89	! Mem[0000000030001400] = 551564e1
!	%l0 = 45124473, %l1 = f282b2f2, Mem[0000000030041400] = 00000000 00000033
	stda	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 45124473 f282b2f2
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 22ec64ac, %l7 = 00000000000000ff
	ldsw	[%i0+%o4],%l7		! %l7 = 0000000022ec64ac

p0_label_59:
!	Mem[00000000100c1430] = be0f56d7, %l7 = 0000000022ec64ac
	ldswa	[%i3+0x030]%asi,%l7	! %l7 = ffffffffbe0f56d7
!	Mem[0000000010141410] = ff90d6d1, %f28 = 551564e1
	lda	[%i5+%o5]0x80,%f28	! %f28 = ff90d6d1
!	Mem[0000000030141408] = ac64ecff, %l2 = 00000000000000b2
	ldswa	[%i5+%o4]0x89,%l2	! %l2 = ffffffffac64ecff
!	Mem[0000000010001410] = ff5b7300, %f18 = 6b798724
	lda	[%i0+0x010]%asi,%f18	! %f18 = ff5b7300
!	Mem[0000000030181400] = 00000000, %l0 = 0000000045124473
	ldsha	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1408] = ab000000ff00006e, %l1 = 00000000f282b2f2
	ldxa	[%i3+%o4]0x89,%l1	! %l1 = ab000000ff00006e
!	Mem[00000000218000c0] = 7efff483, %l4 = ffffffffffffffff
	ldsha	[%o3+0x0c0]%asi,%l4	! %l4 = 0000000000007eff
!	Mem[00000000218000c0] = 7efff483, %l3 = 00000000415b7300
	lduha	[%o3+0x0c0]%asi,%l3	! %l3 = 0000000000007eff
!	Mem[0000000010081404] = 19e5791d, %f8  = 40577e51
	ld	[%i2+0x004],%f8 	! %f8 = 19e5791d
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 000000ff, %l1 = ab000000ff00006e
	swapa	[%i3+%o4]0x80,%l1	! %l1 = 00000000000000ff

p0_label_60:
!	Mem[0000000030041408] = ac64ec22, %l5 = 00000000000000ab
	swapa	[%i1+%o4]0x81,%l5	! %l5 = 00000000ac64ec22
!	%l0 = 0000000000000000, Mem[0000000030101400] = ab2bb95e
	stha	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000b95e
!	Mem[0000000030101400] = 0000b95e, %l0 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	%l6 = 0000000056e14f18, Mem[0000000010101418] = 00000000000000b2, %asi = 80
	stxa	%l6,[%i4+0x018]%asi	! Mem[0000000010101418] = 0000000056e14f18
!	%f24 = ffe194d4, Mem[0000000010141400] = 000000b2
	sta	%f24,[%i5+%g0]0x80	! Mem[0000000010141400] = ffe194d4
!	Mem[0000000030181408] = 5ebd0000, %l3 = 0000000000007eff
	swapa	[%i6+%o4]0x81,%l3	! %l3 = 000000005ebd0000
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000010181408] = 00000000 22000000
	stda	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000 000000ff
!	Mem[0000000030141410] = f700309c, %l2 = ffffffffac64ecff
	ldstuba	[%i5+%o5]0x81,%l2	! %l2 = 000000f7000000ff
!	Mem[0000000030181400] = 00000000, %l0 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = f7007e52, %l4 = 0000000000007eff
	lduh	[%o0+%g0],%l4		! %l4 = 000000000000f700

p0_label_61:
!	Mem[0000000010041410] = fffffffffffffff2, %l2 = 00000000000000f7
	ldxa	[%i1+%o5]0x88,%l2	! %l2 = fffffffffffffff2
!	Mem[0000000010181408] = 00000000, %l3 = 000000005ebd0000
	ldswa	[%i6+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000201c0000] = f7007e52, %l1 = 00000000000000ff
	lduh	[%o0+%g0],%l1		! %l1 = 000000000000f700
!	Mem[0000000030141400] = 40577e51, %l6 = 0000000056e14f18
	ldswa	[%i5+%g0]0x81,%l6	! %l6 = 0000000040577e51
!	Mem[0000000030081400] = 8a194a28, %l6 = 0000000040577e51
	ldsba	[%i2+%g0]0x81,%l6	! %l6 = ffffffffffffff8a
!	Mem[0000000010101418] = 00000000 56e14f18, %l2 = fffffff2, %l3 = 00000000
	ldd	[%i4+0x018],%l2		! %l2 = 0000000000000000 0000000056e14f18
!	Mem[0000000030181400] = ff5e0000 00000000, %l0 = 00000000, %l1 = 0000f700
	ldda	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000000 00000000ff5e0000
!	Mem[0000000010081428] = 21081c6cffacbc60, %f20 = 00735b41 ca3195ab
	ldd	[%i2+0x028],%f20	! %f20 = 21081c6c ffacbc60
!	Mem[00000000100c1408] = ff00006e, %l1 = 00000000ff5e0000
	ldsba	[%i3+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 00000000, %l2 = 0000000000000000
	swapa	[%i6+%o5]0x88,%l2	! %l2 = 0000000000000000

p0_label_62:
!	%f20 = 21081c6c, Mem[0000000010001408] = ac64ec22
	sta	%f20,[%i0+%o4]0x88	! Mem[0000000010001408] = 21081c6c
!	%l3 = 0000000056e14f18, Mem[000000001010142a] = 21081c6c
	sth	%l3,[%i4+0x02a]		! Mem[0000000010101428] = 21084f18
!	%l4 = 0000f700, %l5 = ac64ec22, Mem[0000000010041410] = f2ffffff ffffffff
	stda	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000f700 ac64ec22
!	%f20 = 21081c6c ffacbc60, %l6 = ffffffffffffff8a
!	Mem[0000000010101420] = d552b40800000013
	add	%i4,0x020,%g1
	stda	%f20,[%g1+%l6]ASI_PST16_P ! Mem[0000000010101420] = 2108b408ffac0013
!	Mem[0000000030141408] = ffec64ac, %l2 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l2	! %l2 = 00000000ffec64ac
!	%l2 = 00000000ffec64ac, Mem[0000000030041400] = 45124473
	stwa	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = ffec64ac
!	Mem[0000000010041400] = f282b2f2, %l0 = 0000000000000000
	ldstuba	[%i1+%g0]0x88,%l0	! %l0 = 000000f2000000ff
!	%l6 = ffffffffffffff8a, Mem[0000000030101410] = f2b282f2
	stba	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 8ab282f2
!	Mem[0000000030181410] = d9ff0000, %l5 = 00000000ac64ec22
	swapa	[%i6+%o5]0x89,%l5	! %l5 = 00000000d9ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = fffff700, %l5 = 00000000d9ff0000
	lduwa	[%i4+%g0]0x88,%l5	! %l5 = 00000000fffff700

p0_label_63:
!	Mem[00000000100c1428] = 000000ff, %l3 = 0000000056e14f18
	lduh	[%i3+0x028],%l3		! %l3 = 0000000000000000
!	Mem[0000000030081408] = 19e579ff, %l3 = 0000000000000000
	ldsha	[%i2+%o4]0x89,%l3	! %l3 = 00000000000079ff
!	Mem[0000000010081408] = ab9531ca415b7300, %l0 = 00000000000000f2
	ldxa	[%i2+%o4]0x88,%l0	! %l0 = ab9531ca415b7300
!	Mem[0000000030181410] = ac64ec22, %l3 = 00000000000079ff
	lduba	[%i6+%o5]0x89,%l3	! %l3 = 0000000000000022
!	Mem[0000000010041400] = ffb282f2, %l3 = 0000000000000022
	lduba	[%i1+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141410] = ff00309c, %l5 = 00000000fffff700
	lduwa	[%i5+%o5]0x81,%l5	! %l5 = 00000000ff00309c
!	Mem[0000000030001410] = a3000000, %l6 = ffffffffffffff8a
	lduba	[%i0+%o5]0x81,%l6	! %l6 = 00000000000000a3
!	Mem[0000000030181400] = 0000000000005eff, %l5 = 00000000ff00309c
	ldxa	[%i6+%g0]0x81,%l5	! %l5 = 0000000000005eff
!	Mem[000000001008142c] = ffacbc60, %l6 = 00000000000000a3
	ldsb	[%i2+0x02f],%l6		! %l6 = 0000000000000060
!	Starting 10 instruction Store Burst
!	%f26 = 60de0be1, Mem[0000000010001408] = 6c1c0821
	sta	%f26,[%i0+%o4]0x80	! Mem[0000000010001408] = 60de0be1

p0_label_64:
!	%l4 = 000000000000f700, Mem[0000000030001400] = 577e0000551564e1
	stxa	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000000000f700
!	%f12 = 2bd71cbc 9dc1869c, Mem[0000000030101408] = fa000000 551564e1
	stda	%f12,[%i4+%o4]0x89	! Mem[0000000030101408] = 2bd71cbc 9dc1869c
!	Mem[0000000010041415] = ac64ec22, %l3 = 00000000000000ff
	ldstub	[%i1+0x015],%l3		! %l3 = 00000064000000ff
!	%f28 = ff90d6d1 738ca745, Mem[0000000030001410] = a3000000 000000ff
	stda	%f28,[%i0+%o5]0x81	! Mem[0000000030001410] = ff90d6d1 738ca745
!	Mem[0000000010141400] = d494e1ff, %l6 = 0000000000000060
	ldstuba	[%i5+%g0]0x88,%l6	! %l6 = 000000ff000000ff
!	%l7 = ffffffffbe0f56d7, Mem[00000000100c1400] = f282b2f2000041d2
	stxa	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffffffffbe0f56d7
!	Mem[0000000010081400] = ff000000, %l3 = 0000000000000064
	ldstuba	[%i2+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	%l5 = 0000000000005eff, Mem[0000000030081400] = 284a198a
	stba	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = 284a19ff
!	Mem[00000000100c140f] = 96ff7622, %l5 = 0000000000005eff
	ldstub	[%i3+0x00f],%l5		! %l5 = 00000022000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00000000, %l2 = 00000000ffec64ac
	lduha	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000000

p0_label_65:
!	Mem[0000000030181410] = ac64ec22, %l0 = ab9531ca415b7300
	lduwa	[%i6+%o5]0x89,%l0	! %l0 = 00000000ac64ec22
!	Mem[0000000010101400] = 00f7ffff, %l1 = ffffffffffffffff
	ldsba	[%i4+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101400] = 5eb900ff, %l1 = 0000000000000000
	ldsha	[%i4+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081428] = 21081c6c, %l5 = 0000000000000022
	ldsh	[%i2+0x02a],%l5		! %l5 = 0000000000001c6c
!	Mem[0000000010141438] = ffffffff, %l0 = 00000000ac64ec22
	ldsb	[%i5+0x03a],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000030001400] = 0000f700, %l7 = ffffffffbe0f56d7
	ldswa	[%i0+%g0]0x89,%l7	! %l7 = 000000000000f700
!	Mem[0000000010101408] = 0000ffd9, %l4 = 000000000000f700
	ldswa	[%i4+%o4]0x80,%l4	! %l4 = 000000000000ffd9
!	Mem[0000000010081400] = 1d79e519ff0000ff, %l2 = 0000000000000000
	ldxa	[%i2+%g0]0x88,%l2	! %l2 = 1d79e519ff0000ff
!	Mem[0000000010041408] = fa00000000000000, %l3 = 0000000000000000
	ldxa	[%i1+%o4]0x80,%l3	! %l3 = fa00000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000ffd9, Mem[0000000030181410] = 22ec64ac
	stba	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = d9ec64ac

p0_label_66:
!	Mem[0000000030181408] = 00007eff, %l1 = 00000000000000ff
	ldstuba	[%i6+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	%l2 = 1d79e519ff0000ff, Mem[0000000010081420] = d552b4089dcf9345, %asi = 80
	stxa	%l2,[%i2+0x020]%asi	! Mem[0000000010081420] = 1d79e519ff0000ff
!	Mem[0000000010081410] = ff000000, %l2 = 1d79e519ff0000ff
	ldstuba	[%i2+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	%l4 = 0000ffd9, %l5 = 00001c6c, Mem[00000000100c1410] = 1d79e519 ff6ce18f
	stda	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000ffd9 00001c6c
!	Mem[0000000010041431] = 8e228f5f, %l5 = 0000000000001c6c
	ldstub	[%i1+0x031],%l5		! %l5 = 00000022000000ff
!	%l6 = 000000ff, %l7 = 0000f700, Mem[0000000030081400] = 284a19ff 55521904
	stda	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff 0000f700
!	%l7 = 000000000000f700, Mem[0000000030041408] = 000000ab
	stha	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = f70000ab
!	%l6 = 00000000000000ff, Mem[0000000030001408] = 22ec64ac21198762
	stxa	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000000000ff
!	%l4 = 0000ffd9, %l5 = 00000022, Mem[0000000030001400] = 0000f700 00000000
	stda	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000ffd9 00000022
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 2bd71cbc9dc1869c, %l0 = ffffffffffffffff
	ldxa	[%i4+%o4]0x89,%l0	! %l0 = 2bd71cbc9dc1869c

p0_label_67:
!	Mem[00000000100c1400] = ffffffff, %l1 = 0000000000000000
	lduwa	[%i3+%g0]0x80,%l1	! %l1 = 00000000ffffffff
!	Mem[000000001004142c] = a7e1c4ff, %l1 = 00000000ffffffff
	ldsw	[%i1+0x02c],%l1		! %l1 = ffffffffa7e1c4ff
!	Mem[00000000211c0000] = b2031327, %l0 = 2bd71cbc9dc1869c
	lduh	[%o2+%g0],%l0		! %l0 = 000000000000b203
!	Mem[0000000010181408] = 00000000, %l0 = 000000000000b203
	ldsba	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001418] = 33f64108, %l2 = 00000000000000ff
	ldsba	[%i0+0x01b]%asi,%l2	! %l2 = 0000000000000008
!	Mem[0000000030101408] = 9c86c19d, %l2 = 0000000000000008
	lduba	[%i4+%o4]0x81,%l2	! %l2 = 000000000000009c
!	Mem[0000000010001400] = 55bdb4b9, %l6 = 00000000000000ff
	ldsha	[%i0+%g0]0x80,%l6	! %l6 = 00000000000055bd
!	Mem[0000000020800040] = 63ff095a, %l3 = fa00000000000000
	lduba	[%o1+0x040]%asi,%l3	! %l3 = 0000000000000063
!	Mem[0000000010041408] = 000000fa, %l7 = 000000000000f700
	ldsha	[%i1+%o4]0x88,%l7	! %l7 = 00000000000000fa
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000022, Mem[00000000201c0000] = f7007e52
	sth	%l5,[%o0+%g0]		! Mem[00000000201c0000] = 00227e52

p0_label_68:
!	Mem[00000000201c0001] = 00227e52, %l3 = 0000000000000063
	ldstuba	[%o0+0x001]%asi,%l3	! %l3 = 00000022000000ff
!	Mem[000000001018140c] = ff000000, %l0 = 0000000000000000, %asi = 80
	swapa	[%i6+0x00c]%asi,%l0	! %l0 = 00000000ff000000
!	Mem[0000000010081410] = 000000ff, %l1 = ffffffffa7e1c4ff
	ldstuba	[%i2+%o5]0x88,%l1	! %l1 = 000000ff000000ff
!	%l6 = 000055bd, %l7 = 000000fa, Mem[0000000010141400] = d494e1ff ab9531ca
	stda	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 000055bd 000000fa
!	%l0 = 00000000ff000000, Mem[0000000010081410] = ff000000
	stha	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	Mem[0000000010001400] = 55bdb4b9, %l2 = 000000000000009c
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 00000055000000ff
!	Mem[0000000010081408] = 00735b41, %l5 = 0000000000000022
	swapa	[%i2+%o4]0x80,%l5	! %l5 = 0000000000735b41
!	Mem[0000000010001408] = e10bde60, %l6 = 00000000000055bd
	swapa	[%i0+%o4]0x88,%l6	! %l6 = 00000000e10bde60
!	%f20 = 21081c6c ffacbc60, %l3 = 0000000000000022
!	Mem[0000000010181438] = ff5a66fe1af22efd
	add	%i6,0x038,%g1
	stda	%f20,[%g1+%l3]ASI_PST16_P ! Mem[0000000010181438] = ff5a66feffac2efd
!	Starting 10 instruction Load Burst
!	Mem[0000000021800100] = 31488c1a, %l5 = 0000000000735b41
	lduha	[%o3+0x100]%asi,%l5	! %l5 = 0000000000003148

p0_label_69:
!	Mem[0000000030181400] = ff5e000000000000, %f14 = 500bbc13 5eb92bab
	ldda	[%i6+%g0]0x89,%f14	! %f14 = ff5e0000 00000000
!	Mem[0000000030041408] = f70000ab d1d690ff, %l0 = ff000000, %l1 = 000000ff
	ldda	[%i1+%o4]0x81,%l0	! %l0 = 00000000f70000ab 00000000d1d690ff
!	Mem[0000000020800000] = ffffca09, %l7 = 00000000000000fa
	ldsba	[%o1+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030041400] = ac64ecff, %f16 = ab9531ca
	lda	[%i1+%g0]0x89,%f16	! %f16 = ac64ecff
!	Mem[00000000100c1400] = ffffffff, %l1 = 00000000d1d690ff
	lduha	[%i3+%g0]0x80,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010041408] = fa000000 00000000, %l0 = f70000ab, %l1 = 0000ffff
	ldda	[%i1+%o4]0x80,%l0	! %l0 = 00000000fa000000 0000000000000000
!	Mem[0000000010181414] = f282b2f2, %f15 = 00000000
	ld	[%i6+0x014],%f15	! %f15 = f282b2f2
!	Mem[0000000010181410] = 00000000, %l0 = 00000000fa000000
	lduba	[%i6+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041400] = ffb282f200735b41, %l4 = 000000000000ffd9
	ldxa	[%i1+%g0]0x80,%l4	! %l4 = ffb282f200735b41
!	Starting 10 instruction Store Burst
!	Mem[0000000010001430] = a26bffb2, %l2 = 0000000000000055, %asi = 80
	swapa	[%i0+0x030]%asi,%l2	! %l2 = 00000000a26bffb2

p0_label_70:
!	%l6 = 00000000e10bde60, Mem[0000000020800000] = ffffca09
	stb	%l6,[%o1+%g0]		! Mem[0000000020800000] = 60ffca09
!	%f2  = 22ec64ac 21198762, %l7 = ffffffffffffffff
!	Mem[00000000100c1428] = 000000ff2487796b
	add	%i3,0x028,%g1
	stda	%f2,[%g1+%l7]ASI_PST16_PL ! Mem[00000000100c1428] = 62871921ac64ec22
!	Mem[0000000010181400] = 6bf1870100005eff, %l6 = 00000000e10bde60, %l4 = ffb282f200735b41
	casxa	[%i6]0x80,%l6,%l4	! %l4 = 6bf1870100005eff
!	Mem[0000000010101410] = 5ebd0000, %l3 = 0000000000000022
	swapa	[%i4+%o5]0x88,%l3	! %l3 = 000000005ebd0000
!	Mem[0000000010141410] = ff90d6d1, %l5 = 00003148, %l2 = a26bffb2
	add	%i5,0x10,%g1
	casa	[%g1]0x80,%l5,%l2	! %l2 = 00000000ff90d6d1
!	%l5 = 0000000000003148, Mem[0000000030081410] = 00000000
	stwa	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = 00003148
!	%l4 = 6bf1870100005eff, Mem[0000000030001410] = ff90d6d1738ca745
	stxa	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 6bf1870100005eff
!	%l5 = 0000000000003148, Mem[00000000201c0000] = 00ff7e52
	sth	%l5,[%o0+%g0]		! Mem[00000000201c0000] = 31487e52
!	Mem[0000000020800000] = 60ffca09, %l2 = 00000000ff90d6d1
	ldstub	[%o1+%g0],%l2		! %l2 = 00000060000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00f70000, %f9  = ff00006e
	lda	[%i1+%o5]0x88,%f9 	! %f9 = 00f70000

p0_label_71:
!	Mem[0000000010041408] = fa000000, %l5 = 0000000000003148
	lduha	[%i1+%o4]0x80,%l5	! %l5 = 000000000000fa00
!	Mem[0000000010101410] = 0000000000000022, %f22 = 00f7ffff 19e5791d
	ldda	[%i4+%o5]0x88,%f22	! %f22 = 00000000 00000022
!	Mem[0000000010181400] = 6bf18701, %l7 = ffffffffffffffff
	lduba	[%i6+%g0]0x80,%l7	! %l7 = 000000000000006b
!	Mem[0000000010181410] = f2b282f200000000, %f28 = ff90d6d1 738ca745
	ldda	[%i6+%o5]0x88,%f28	! %f28 = f2b282f2 00000000
!	Mem[0000000010101410] = 00000022, %l1 = 0000000000000000
	lduwa	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000022
!	Mem[0000000010041404] = 00735b41, %l6 = 00000000e10bde60
	lduw	[%i1+0x004],%l6		! %l6 = 0000000000735b41
!	Mem[0000000010141400] = bd550000, %l2 = 0000000000000060
	ldsba	[%i5+0x001]%asi,%l2	! %l2 = 0000000000000055
!	Mem[00000000300c1410] = 73441245, %l0 = 0000000000000000
	ldswa	[%i3+%o5]0x89,%l0	! %l0 = 0000000073441245
!	Mem[0000000030081408] = ff79e519, %l0 = 0000000073441245
	lduwa	[%i2+%o4]0x81,%l0	! %l0 = 00000000ff79e519
!	Starting 10 instruction Store Burst
!	%l4 = 6bf1870100005eff, Mem[00000000211c0000] = b2031327, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 5eff1327

p0_label_72:
!	%l4 = 6bf1870100005eff, Mem[0000000010181400] = 6bf1870100005eff
	stxa	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 6bf1870100005eff
!	%f25 = 964ed241, Mem[0000000010181428] = 14e4a5a9
	sta	%f25,[%i6+0x028]%asi	! Mem[0000000010181428] = 964ed241
!	Mem[0000000030001410] = 0187f16b, %l0 = 00000000ff79e519
	ldstuba	[%i0+%o5]0x89,%l0	! %l0 = 0000006b000000ff
!	%f28 = f2b282f2 00000000, Mem[0000000030001410] = 0187f1ff ff5e0000
	stda	%f28,[%i0+%o5]0x89	! Mem[0000000030001410] = f2b282f2 00000000
!	%l3 = 000000005ebd0000, Mem[0000000030101400] = ff00b95e
	stba	%l3,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000b95e
!	%l4 = 6bf1870100005eff, Mem[00000000100c1410] = 0000ffd9
	stha	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 5effffd9
!	Mem[0000000030041408] = f70000ab, %l1 = 0000000000000022
	swapa	[%i1+%o4]0x81,%l1	! %l1 = 00000000f70000ab
!	Mem[00000000100c1405] = be0f56d7, %l1 = 00000000f70000ab
	ldstuba	[%i3+0x005]%asi,%l1	! %l1 = 0000000f000000ff
!	Mem[0000000030041410] = 00000003, %l2 = 0000000000000055
	swapa	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000003
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ffb282f2, %l1 = 000000000000000f
	lduwa	[%i1+%g0]0x80,%l1	! %l1 = 00000000ffb282f2

p0_label_73:
!	Mem[0000000020800000] = ffffca09, %l1 = 00000000ffb282f2
	lduh	[%o1+%g0],%l1		! %l1 = 000000000000ffff
!	Mem[0000000030041400] = ffec64ac, %l3 = 000000005ebd0000
	lduwa	[%i1+%g0]0x81,%l3	! %l3 = 00000000ffec64ac
!	Mem[0000000030181400] = 00000000, %f28 = f2b282f2
	lda	[%i6+%g0]0x81,%f28	! %f28 = 00000000
!	Mem[000000001004141c] = d02e34e7, %l7 = 000000000000006b
	ldsba	[%i1+0x01d]%asi,%l7	! %l7 = 000000000000002e
!	Mem[0000000010181410] = f2b282f200000000, %f30 = 59f333c7 ffffffff
	ldda	[%i6+%o5]0x88,%f30	! %f30 = f2b282f2 00000000
!	Mem[0000000030041408] = 00000022, %l5 = 000000000000fa00
	lduha	[%i1+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101410] = 00000000 00000022, %l0 = 0000006b, %l1 = 0000ffff
	ldda	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000022 0000000000000000
!	Mem[0000000010001434] = d09b646b, %l0 = 0000000000000022
	ldswa	[%i0+0x034]%asi,%l0	! %l0 = ffffffffd09b646b
!	Mem[0000000010181418] = 0000004c, %l7 = 000000000000002e
	ldub	[%i6+0x018],%l7		! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 73441245, %l7 = 0000000000000000
	swapa	[%i3+%o5]0x89,%l7	! %l7 = 0000000073441245

p0_label_74:
!	Mem[0000000010041408] = fa000000, %l6 = 00735b41, %l6 = 00735b41
	add	%i1,0x08,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 00000000fa000000
!	%f20 = 21081c6c, Mem[0000000030001410] = 00000000
	sta	%f20,[%i0+%o5]0x89	! Mem[0000000030001410] = 21081c6c
!	%l5 = 0000000000000000, Mem[0000000030041400] = ffec64ac
	stha	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = 000064ac
!	Mem[0000000010081408] = 22000000, %l2 = 0000000000000003
	swapa	[%i2+%o4]0x88,%l2	! %l2 = 0000000022000000
!	%l6 = 00000000fa000000, Mem[0000000020800040] = 63ff095a, %asi = 80
	stha	%l6,[%o1+0x040]%asi	! Mem[0000000020800040] = 0000095a
!	%l3 = 00000000ffec64ac, Mem[0000000010081410] = 00000000
	stwa	%l3,[%i2+%o5]0x88	! Mem[0000000010081410] = ffec64ac
!	%f14 = ff5e0000 f282b2f2, Mem[0000000030081400] = 000000ff 0000f700
	stda	%f14,[%i2+%g0]0x89	! Mem[0000000030081400] = ff5e0000 f282b2f2
!	Mem[00000000300c1408] = 6e0000ff, %l7 = 0000000073441245
	swapa	[%i3+%o4]0x81,%l7	! %l7 = 000000006e0000ff
!	Mem[0000000030181400] = 00000000, %l7 = 000000006e0000ff
	swapa	[%i6+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ffffffd9ff7e00ff, %f16 = ac64ecff ff00006e
	ldda	[%i6+%o4]0x89,%f16	! %f16 = ffffffd9 ff7e00ff

p0_label_75:
!	Mem[0000000010141404] = fa000000, %l4 = 6bf1870100005eff
	ldswa	[%i5+0x004]%asi,%l4	! %l4 = fffffffffa000000
!	Mem[0000000010101420] = 2108b408, %f29 = 00000000
	ld	[%i4+0x020],%f29	! %f29 = 2108b408
!	Mem[0000000030181400] = ff00006e, %l1 = 0000000000000000
	lduwa	[%i6+%g0]0x89,%l1	! %l1 = 00000000ff00006e
!	Mem[0000000030141408] = 00000000, %l4 = fffffffffa000000
	ldswa	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1408] = 45124473, %l7 = 0000000000000000
	lduha	[%i3+%o4]0x89,%l7	! %l7 = 0000000000004473
!	Mem[0000000010101410] = 00000000 00000022, %l6 = fa000000, %l7 = 00004473
	ldda	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000022 0000000000000000
!	Mem[0000000010001400] = ffbdb4b9 a05f21f0, %l0 = d09b646b, %l1 = ff00006e
	ldda	[%i0+%g0]0x80,%l0	! %l0 = 00000000ffbdb4b9 00000000a05f21f0
!	Mem[00000000201c0000] = 31487e52, %l7 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = 0000000000003148
!	Mem[0000000030181410] = ac64ecd9, %l4 = 0000000000000000
	ldsba	[%i6+%o5]0x89,%l4	! %l4 = ffffffffffffffd9
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 5eb90000, %l2 = 0000000022000000
	ldstuba	[%i4+%g0]0x89,%l2	! %l2 = 00000000000000ff

p0_label_76:
!	Mem[0000000010001408] = bd550000, %l0 = 00000000ffbdb4b9
	swapa	[%i0+%o4]0x80,%l0	! %l0 = 00000000bd550000
!	%f0  = 5ebd0000 00007e57, Mem[0000000010181400] = 0187f16b ff5e0000
	stda	%f0 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 5ebd0000 00007e57
!	%l6 = 00000022, %l7 = 00003148, Mem[0000000010001410] = ff5b7300 f282b2f2
	stda	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000022 00003148
!	%l7 = 0000000000003148, Mem[00000000100c1408] = ff00006e96ff76ff
	stxa	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000003148
!	Mem[0000000030001410] = 6c1c0821, %l5 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l5	! %l5 = 0000006c000000ff
!	%f20 = 21081c6c ffacbc60, %l7 = 0000000000003148
!	Mem[0000000030181408] = ff007effd9ffffff
	add	%i6,0x008,%g1
	stda	%f20,[%g1+%l7]ASI_PST32_S ! Mem[0000000030181408] = ff007effd9ffffff
!	%f22 = 00000000 00000022, Mem[0000000030001410] = 21081cff f2b282f2
	stda	%f22,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000 00000022
!	Mem[0000000030001400] = d9ff0000, %l1 = 00000000a05f21f0
	ldstuba	[%i0+%g0]0x81,%l1	! %l1 = 000000d9000000ff
!	%l2 = 0000000000000000, Mem[00000000201c0000] = 31487e52, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00007e52
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 8ab282f2ff00006e, %l6 = 0000000000000022
	ldxa	[%i4+%o5]0x81,%l6	! %l6 = 8ab282f2ff00006e

p0_label_77:
!	Mem[0000000010081400] = ff0000ff, %l3 = 00000000ffec64ac
	ldsba	[%i2+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000100c1408] = 00000000, %l6 = 8ab282f2ff00006e
	lduwa	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = ff0000ff, %l4 = ffffffffffffffd9
	lduba	[%i2+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081410] = ac64ecff, %l6 = 0000000000000000
	ldsba	[%i2+%o5]0x80,%l6	! %l6 = ffffffffffffffac
!	Mem[0000000010181408] = 00000000, %l2 = 0000000000000000
	ldsh	[%i6+%o4],%l2		! %l2 = 0000000000000000
!	Mem[0000000010081408] = 00000003, %f8  = 19e5791d
	lda	[%i2+%o4]0x88,%f8 	! %f8 = 00000003
!	Mem[00000000218001c0] = 19eabc74, %l5 = 000000000000006c
	ldsba	[%o3+0x1c0]%asi,%l5	! %l5 = 0000000000000019
!	Mem[0000000030181408] = ff007eff, %f21 = ffacbc60
	lda	[%i6+%o4]0x81,%f21	! %f21 = ff007eff
!	Mem[0000000030081408] = 19e579ff, %l3 = ffffffffffffffff
	lduwa	[%i2+%o4]0x89,%l3	! %l3 = 0000000019e579ff
!	Starting 10 instruction Store Burst
!	%f9  = 00f70000, Mem[0000000030081408] = ff79e519
	sta	%f9 ,[%i2+%o4]0x81	! Mem[0000000030081408] = 00f70000

p0_label_78:
!	%l2 = 0000000000000000, Mem[0000000010041408] = 000000fa
	stba	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	%l1 = 00000000000000d9, Mem[00000000100c1400] = ffffffff
	stba	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffd9
!	Mem[00000000100c1410] = 5effffd9, %l6 = ffffffffffffffac
	swapa	[%i3+%o5]0x80,%l6	! %l6 = 000000005effffd9
!	%f30 = f2b282f2, Mem[0000000010101430] = ff15433c
	sta	%f30,[%i4+0x030]%asi	! Mem[0000000010101430] = f2b282f2
!	%l7 = 0000000000003148, Mem[0000000030101400] = ff00b95e
	stwa	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = 00003148
!	Mem[0000000010141400] = 000055bd, %l1 = 00000000000000d9
	swapa	[%i5+%g0]0x88,%l1	! %l1 = 00000000000055bd
!	%l5 = 0000000000000019, Mem[0000000010081400] = ff0000ff19e5791d
	stxa	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000000019
!	%l4 = 00000000000000ff, Mem[0000000010101410] = 2200000000000000
	stxa	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000000000ff
!	Mem[0000000010041438] = 5ebd0000, %l5 = 00000019, %l5 = 00000019
	add	%i1,0x38,%g1
	casa	[%g1]0x80,%l5,%l5	! %l5 = 000000005ebd0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ffa6359c 9c3000ff, %l6 = 5effffd9, %l7 = 00003148
	ldda	[%i5+%o5]0x89,%l6	! %l6 = 000000009c3000ff 00000000ffa6359c

p0_label_79:
!	Mem[0000000010041408] = 0000000000000000, %l3 = 0000000019e579ff
	ldxa	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = 00007e57, %l2 = 0000000000000000
	lduba	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000057
!	Mem[0000000010081400] = 00000000, %l6 = 000000009c3000ff
	ldswa	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = 00f70000, %l5 = 000000005ebd0000
	ldsba	[%i1+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101420] = 2108b408, %l5 = 0000000000000000
	ldsb	[%i4+0x021],%l5		! %l5 = 0000000000000008
!	Mem[0000000010141430] = 45a78c73e1641555, %f10 = a6568bbe 7e80b946
	ldda	[%i5+0x030]%asi,%f10	! %f10 = 45a78c73 e1641555
!	Mem[0000000030041410] = 55000000, %l4 = 00000000000000ff
	ldsba	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = ac64ecff 000000a3, %l4 = 00000000, %l5 = 00000008
	ldda	[%i2+%o5]0x80,%l4	! %l4 = 00000000ac64ecff 00000000000000a3
!	Mem[00000000100c1420] = 00000000, %l0 = 00000000bd550000
	lduba	[%i3+0x021]%asi,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 00000000, %l4 = 00000000ac64ecff
	swapa	[%i6+%o5]0x88,%l4	! %l4 = 0000000000000000

p0_label_80:
!	%f2  = 22ec64ac 21198762, Mem[0000000010041410] = 0000f700 acffec22
	stda	%f2 ,[%i1+%o5]0x80	! Mem[0000000010041410] = 22ec64ac 21198762
!	Mem[00000000100c1408] = 00000000, %l0 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010081410] = ac64ecff
	stha	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000ecff
!	Mem[0000000030041400] = 000064ac, %l2 = 0000000000000057
	ldswa	[%i1+%g0]0x81,%l2	! %l2 = 00000000000064ac
!	Mem[0000000030081410] = 00003148, %l6 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l6	! %l6 = 0000000000003148
!	%f11 = e1641555, Mem[0000000010001410] = 00000022
	sta	%f11,[%i0+%o5]0x80	! Mem[0000000010001410] = e1641555
!	%l2 = 000064ac, %l3 = 00000000, Mem[0000000010041410] = ac64ec22 62871921
	stda	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 000064ac 00000000
!	%l0 = 0000000000000000, Mem[0000000030181410] = d9ec64ac
	stba	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 00ec64ac
!	Mem[0000000030081408] = 0000f700, %l0 = 0000000000000000
	swapa	[%i2+%o4]0x89,%l0	! %l0 = 000000000000f700
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ff00309c, %l0 = 000000000000f700
	ldsba	[%i5+%o5]0x81,%l0	! %l0 = ffffffffffffffff

p0_label_81:
!	Mem[0000000030141408] = 00000000, %f23 = 00000022
	lda	[%i5+%o4]0x81,%f23	! %f23 = 00000000
!	Mem[0000000010141408] = 6b798724 000013a1, %l4 = 00000000, %l5 = 000000a3
	ldda	[%i5+%o4]0x88,%l4	! %l4 = 00000000000013a1 000000006b798724
!	Mem[0000000010001430] = 00000055d09b646b, %l1 = 00000000000055bd
	ldx	[%i0+0x030],%l1		! %l1 = 00000055d09b646b
!	Mem[00000000300c1410] = 00000000 f282b2f2, %l6 = 00003148, %l7 = ffa6359c
	ldda	[%i3+%o5]0x81,%l6	! %l6 = 0000000000000000 00000000f282b2f2
!	Mem[0000000030181408] = ff7e00ff, %l0 = ffffffffffffffff
	ldswa	[%i6+%o4]0x89,%l0	! %l0 = ffffffffff7e00ff
!	Mem[0000000010001438] = 75f01295, %f12 = 2bd71cbc
	lda	[%i0+0x038]%asi,%f12	! %f12 = 75f01295
!	Mem[0000000030101400] = 0000314813bc0b50, %f28 = 00000000 2108b408
	ldda	[%i4+%g0]0x81,%f28	! %f28 = 00003148 13bc0b50
!	Mem[00000000300c1400] = 41000000 00000000, %l2 = 000064ac, %l3 = 00000000
	ldda	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000000 0000000041000000
!	Mem[0000000030141410] = ff00309c, %l7 = 00000000f282b2f2
	ldsha	[%i5+%o5]0x81,%l7	! %l7 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	Mem[0000000021800081] = ffffbc25, %l4 = 00000000000013a1
	ldstuba	[%o3+0x081]%asi,%l4	! %l4 = 000000ff000000ff

p0_label_82:
!	%f8  = 00000003 00f70000, Mem[0000000030101408] = 9dc1869c 2bd71cbc
	stda	%f8 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000003 00f70000
!	%l4 = 00000000000000ff, Mem[0000000030141410] = ff00309c9c35a6ff
	stxa	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000000000ff
!	Mem[0000000010101418] = 0000000056e14f18, %l4 = 00000000000000ff, %l6 = 0000000000000000
	add	%i4,0x18,%g1
	casxa	[%g1]0x80,%l4,%l6	! %l6 = 0000000056e14f18
!	%f2  = 22ec64ac 21198762, Mem[0000000010181400] = 577e0000 0000bd5e
	stda	%f2 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 22ec64ac 21198762
!	%f27 = 415b7300, Mem[00000000100c1410] = ffffffac
	sta	%f27,[%i3+%o5]0x80	! Mem[00000000100c1410] = 415b7300
!	Mem[00000000300c1410] = 00000000, %l6 = 0000000056e14f18
	swapa	[%i3+%o5]0x89,%l6	! %l6 = 0000000000000000
!	%l7 = ffffffffffffff00, Mem[0000000030181410] = ac64ec00
	stha	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = ac64ff00
!	%f21 = ff007eff, Mem[0000000030001410] = 22000000
	sta	%f21,[%i0+%o5]0x81	! Mem[0000000030001410] = ff007eff
!	Mem[0000000010181408] = 00000000, %l0 = ffffffffff7e00ff
	swapa	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 6e0000ff 517e5740, %l6 = 00000000, %l7 = ffffff00
	ldda	[%i5+%g0]0x89,%l6	! %l6 = 00000000517e5740 000000006e0000ff

p0_label_83:
!	Mem[0000000030141410] = 00000000, %l1 = 00000055d09b646b
	lduba	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800040] = 0000095a, %l3 = 0000000041000000
	lduba	[%o1+0x041]%asi,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1430] = be0f56d7353b7eea, %f22 = 00000000 00000000
	ldd	[%i3+0x030],%f22	! %f22 = be0f56d7 353b7eea
!	Mem[0000000010181408] = ff007eff00000000, %f26 = 60de0be1 415b7300
	ldda	[%i6+%o4]0x80,%f26	! %f26 = ff007eff 00000000
!	Mem[0000000030181410] = 00ff64ac, %l7 = 000000006e0000ff
	lduba	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141400] = 6e0000ff 517e5740, %l2 = 00000000, %l3 = 00000000
	ldda	[%i5+%g0]0x89,%l2	! %l2 = 00000000517e5740 000000006e0000ff
!	Mem[00000000100c1400] = ffffffd9, %l6 = 00000000517e5740
	ldsba	[%i3+%g0]0x88,%l6	! %l6 = ffffffffffffffd9
!	Mem[0000000010101408] = 0000ffd9, %l4 = 00000000000000ff
	lduba	[%i4+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081408] = 00000000, %f13 = 9dc1869c
	lda	[%i2+%o4]0x81,%f13	! %f13 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101426] = ffac0013, %l2 = 00000000517e5740
	ldstuba	[%i4+0x026]%asi,%l2	! %l2 = 00000000000000ff

p0_label_84:
!	%l6 = ffffffd9, %l7 = 00000000, Mem[0000000030081400] = f282b2f2 ff5e0000
	stda	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffd9 00000000
!	%f23 = 353b7eea, Mem[0000000010101408] = d9ff0000
	sta	%f23,[%i4+%o4]0x88	! Mem[0000000010101408] = 353b7eea
!	Mem[0000000010101424] = ffacff13, %l5 = 000000006b798724
	swap	[%i4+0x024],%l5		! %l5 = 00000000ffacff13
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000030101410] = f282b28a 6e0000ff
	stda	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000 00000000
!	%f0  = 5ebd0000 00007e57, %l4 = 0000000000000000
!	Mem[0000000030181438] = 415b730073441245
	add	%i6,0x038,%g1
	stda	%f0,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030181438] = 415b730073441245
!	%l1 = 0000000000000000, Mem[0000000010001408] = 62871921b9b4bdff
	stxa	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000000000000000
!	Mem[00000000100c1404] = beff56d7, %l7 = 0000000000000000, %asi = 80
	swapa	[%i3+0x004]%asi,%l7	! %l7 = 00000000beff56d7
!	%f28 = 00003148 13bc0b50, %l6 = ffffffffffffffd9
!	Mem[0000000030181408] = ff007effd9ffffff
	add	%i6,0x008,%g1
	stda	%f28,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030181408] = 500bbc13d9ffffff
!	Mem[0000000010001410] = 551564e1, %l7 = 00000000beff56d7
	ldstuba	[%i0+%o5]0x88,%l7	! %l7 = 000000e1000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000000, %f21 = ff007eff
	lda	[%i5+%o5]0x81,%f21	! %f21 = 00000000

p0_label_85:
!	Mem[0000000010181410] = ffec64ac f282b2f2, %l6 = ffffffd9, %l7 = 000000e1
	ldda	[%i6+%o5]0x80,%l6	! %l6 = 00000000ffec64ac 00000000f282b2f2
!	Mem[00000000300c1408] = 45124473, %l6 = 00000000ffec64ac
	lduha	[%i3+%o4]0x89,%l6	! %l6 = 0000000000004473
!	Mem[00000000211c0000] = 5eff1327, %l3 = 000000006e0000ff
	ldsb	[%o2+%g0],%l3		! %l3 = 000000000000005e
!	Mem[0000000010081414] = 000000a3, %l3 = 000000000000005e
	ldsha	[%i2+0x016]%asi,%l3	! %l3 = 00000000000000a3
!	Mem[0000000010041410] = 000064ac, %l0 = 0000000000000000
	lduwa	[%i1+%o5]0x88,%l0	! %l0 = 00000000000064ac
!	Mem[0000000030141408] = 62871921 00000000, %l6 = 00004473, %l7 = f282b2f2
	ldda	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000000 0000000062871921
!	Mem[0000000030101410] = 00000000 00000000, %l4 = 00000000, %l5 = ffacff13
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[00000000300c1410] = 184fe156, %l0 = 00000000000064ac
	ldsha	[%i3+%o5]0x81,%l0	! %l0 = 000000000000184f
!	Mem[0000000030001410] = 00000000 ff7e00ff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i0+%o5]0x89,%l4	! %l4 = 00000000ff7e00ff 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = ac64ecff, %l2 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 000000ff000000ff

p0_label_86:
!	%f2  = 22ec64ac 21198762, Mem[0000000010101430] = f2b282f2 02d64a7c
	std	%f2 ,[%i4+0x030]	! Mem[0000000010101430] = 22ec64ac 21198762
!	Mem[0000000010141404] = fa000000, %l3 = 000000a3, %l1 = 00000000
	add	%i5,0x04,%g1
	casa	[%g1]0x80,%l3,%l1	! %l1 = 00000000fa000000
!	%l2 = 000000ff, %l3 = 000000a3, Mem[0000000010141410] = ff90d6d1 005164dc
	stda	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000ff 000000a3
!	%l0 = 000000000000184f, Mem[00000000100c1400] = ffffffd9
	stba	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffff4f
!	Mem[0000000021800141] = b02aab40, %l2 = 00000000000000ff
	ldstub	[%o3+0x141],%l2		! %l2 = 0000002a000000ff
!	%l3 = 00000000000000a3, Mem[00000000300c1400] = 00000000
	stba	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000a3
!	%l5 = 0000000000000000, Mem[0000000030141400] = 40577e51
	stwa	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	Mem[00000000300c1408] = 45124473, %l1 = 00000000fa000000
	swapa	[%i3+%o4]0x89,%l1	! %l1 = 0000000045124473
!	Mem[00000000201c0000] = 00007e52, %l2 = 000000000000002a
	lduba	[%o0+0x001]%asi,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ff007eff, %l6 = 0000000000000000
	ldsba	[%i6+%o4]0x80,%l6	! %l6 = ffffffffffffffff

p0_label_87:
!	Mem[0000000010101410] = 00000000, %l5 = 0000000000000000
	ldsha	[%i4+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101434] = 21198762, %l7 = 0000000062871921
	ldsh	[%i4+0x036],%l7		! %l7 = ffffffffffff8762
!	%f27 = 00000000, %f17 = ff7e00ff
	fitos	%f27,%f17		! %f17 = 00000000
!	Mem[0000000010081400] = 00000000, %l0 = 000000000000184f
	ldsba	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181408] = ff007eff, %l4 = 00000000ff7e00ff
	lduwa	[%i6+%o4]0x80,%l4	! %l4 = 00000000ff007eff
!	Mem[0000000010181410] = ffec64ac, %l7 = ffffffffffff8762
	ldsha	[%i6+%o5]0x80,%l7	! %l7 = ffffffffffffffec
!	Mem[0000000021800100] = 31488c1a, %l2 = 0000000000000000
	ldsb	[%o3+0x101],%l2		! %l2 = 0000000000000048
!	Mem[0000000030101410] = 00000000 00000000, %l4 = ff007eff, %l5 = 00000000
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000030041400] = ac640000, %l4 = 0000000000000000
	lduwa	[%i1+%g0]0x89,%l4	! %l4 = 00000000ac640000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000048, Mem[0000000030041400] = 000064ac
	stha	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 004864ac

p0_label_88:
!	%f14 = ff5e0000, Mem[0000000030141410] = 00000000
	sta	%f14,[%i5+%o5]0x81	! Mem[0000000030141410] = ff5e0000
!	%l3 = 00000000000000a3, Mem[0000000010041410] = 000064ac
	stba	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 000064a3
!	%l7 = ffffffffffffffec, Mem[0000000010141408] = a11300002487796b
	stxa	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = ffffffffffffffec
!	%f26 = ff007eff, Mem[000000001000140c] = 00000000
	sta	%f26,[%i0+0x00c]%asi	! Mem[000000001000140c] = ff007eff
!	%f28 = 00003148 13bc0b50, Mem[0000000030041408] = 22000000 ff90d6d1
	stda	%f28,[%i1+%o4]0x89	! Mem[0000000030041408] = 00003148 13bc0b50
!	%l4 = ac640000, %l5 = 00000000, Mem[0000000010001408] = 00000000 ff7e00ff
	stda	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = ac640000 00000000
!	Mem[0000000030181400] = 6e0000ff, %l2 = 0000000000000048
	swapa	[%i6+%g0]0x81,%l2	! %l2 = 000000006e0000ff
!	%l6 = ffffffff, %l7 = ffffffec, Mem[0000000010081400] = 00000000 19000000
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffffff ffffffec
!	Mem[00000000100c1410] = 415b7300, %l5 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l5	! %l5 = 00000041000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 4831000000000000, %l1 = 0000000045124473
	ldxa	[%i3+%o4]0x88,%l1	! %l1 = 4831000000000000

p0_label_89:
!	Mem[0000000010141410] = 000000ff, %l3 = 00000000000000a3
	ldsba	[%i5+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1410] = 184fe156, %l5 = 0000000000000041
	ldswa	[%i3+%o5]0x81,%l5	! %l5 = 00000000184fe156
!	Mem[0000000030081400] = d9ffffff00000000, %l6 = ffffffffffffffff
	ldxa	[%i2+%g0]0x81,%l6	! %l6 = d9ffffff00000000
!	Mem[00000000100c1400] = ffffff4f, %l2 = 000000006e0000ff
	ldsba	[%i3+%g0]0x88,%l2	! %l2 = 000000000000004f
!	Mem[0000000010001418] = 33f64108 36578637, %l6 = 00000000, %l7 = ffffffec
	ldda	[%i0+0x018]%asi,%l6	! %l6 = 0000000033f64108 0000000036578637
!	Mem[00000000300c1408] = fa000000, %f10 = 45a78c73
	lda	[%i3+%o4]0x89,%f10	! %f10 = fa000000
!	Mem[0000000010081410] = ffec0000, %l7 = 0000000036578637
	lduwa	[%i2+%o5]0x88,%l7	! %l7 = 00000000ffec0000
!	Mem[0000000010141410] = a3000000ff000000, %f24 = ffe194d4 964ed241
	ldda	[%i5+%o5]0x88,%f24	! %f24 = a3000000 ff000000
!	Mem[0000000010181408] = ff7e00ff, %l1 = 4831000000000000
	lduha	[%i6+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[0000000030001400] = 0000ffff
	stha	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff

p0_label_90:
!	%l6 = 0000000033f64108, Mem[0000000010101400] = 1d79e519fffff700
	stxa	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000000033f64108
!	%f14 = ff5e0000 f282b2f2, Mem[0000000030141410] = 00005eff ff000000
	stda	%f14,[%i5+%o5]0x89	! Mem[0000000030141410] = ff5e0000 f282b2f2
!	Mem[0000000010041420] = cac88006, %l3 = 00000000, %l0 = 00000000
	add	%i1,0x20,%g1
	casa	[%g1]0x80,%l3,%l0	! %l0 = 00000000cac88006
!	%l0 = 00000000cac88006, Mem[0000000010041410] = a364000000000000
	stxa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000cac88006
!	%l6 = 33f64108, %l7 = ffec0000, Mem[0000000010101410] = 00000000 ff000000
	stda	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 33f64108 ffec0000
!	%f6  = 814f8833 e255b5f4, Mem[0000000010181400] = 22ec64ac 21198762
	std	%f6 ,[%i6+%g0]	! Mem[0000000010181400] = 814f8833 e255b5f4
!	Mem[00000000100c1410] = ff5b7300, %l7 = 00000000ffec0000
	ldstuba	[%i3+%o5]0x80,%l7	! %l7 = 000000ff000000ff
!	%l2 = 0000004f, %l3 = 00000000, Mem[0000000030101408] = 0000f700 03000000
	stda	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000004f 00000000
!	Mem[0000000010081408] = 03000000, %l0 = 00000000cac88006
	ldstuba	[%i2+%o4]0x80,%l0	! %l0 = 00000003000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081430] = e015433c02d64a7c, %f4  = a3000000 000000ff
	ldd	[%i2+0x030],%f4 	! %f4  = e015433c 02d64a7c

p0_label_91:
!	Mem[0000000010181400] = 33884f81, %l0 = 0000000000000003
	ldsha	[%i6+%g0]0x88,%l0	! %l0 = 0000000000004f81
!	Mem[0000000030141400] = 00000000, %l7 = 00000000000000ff
	lduha	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141400] = 6e0000ff 00000000, %l6 = 33f64108, %l7 = 00000000
	ldda	[%i5+%g0]0x89,%l6	! %l6 = 0000000000000000 000000006e0000ff
!	Mem[0000000021800140] = b0ffab40, %l7 = 000000006e0000ff
	ldsb	[%o3+0x141],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010041430] = 8eff8f5f 1804043b, %l0 = 00004f81, %l1 = 000000ff
	ldd	[%i1+0x030],%l0		! %l0 = 000000008eff8f5f 000000001804043b
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000010041400] = ffb282f2 00735b41 00000000 00000000
!	Mem[0000000010041410] = 00000000 cac88006 00000000 d02e34e7
!	Mem[0000000010041420] = cac88006 5b3285ea ce824c3f a7e1c4ff
!	Mem[0000000010041430] = 8eff8f5f 1804043b 5ebd0000 e1641555
	ldda	[%i1]ASI_BLK_P,%f0	! Block Load from 0000000010041400
!	Mem[000000001014142c] = e10bde60, %l5 = 00000000184fe156
	lduw	[%i5+0x02c],%l5		! %l5 = 00000000e10bde60
!	Mem[0000000030001410] = ff7e00ff, %l3 = 0000000000000000
	ldswa	[%i0+%o5]0x89,%l3	! %l3 = ffffffffff7e00ff
!	Mem[0000000020800040] = 0000095a, %l4 = 00000000ac640000
	lduba	[%o1+0x040]%asi,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 13bc0b50, %l2 = 000000000000004f
	ldstuba	[%i1+%o4]0x89,%l2	! %l2 = 00000050000000ff

p0_label_92:
!	Mem[00000000100c1400] = ffffff4f, %l6 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l6	! %l6 = 0000004f000000ff
!	%l0 = 000000008eff8f5f, Mem[0000000010081408] = 000000ff
	stha	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 00008f5f
!	%l3 = ffffffffff7e00ff, Mem[0000000010101408] = ea7e3b35ca3195ff
	stxa	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = ffffffffff7e00ff
!	%l0 = 8eff8f5f, %l1 = 1804043b, Mem[0000000010181400] = 814f8833 e255b5f4
	stda	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 8eff8f5f 1804043b
!	%f28 = 00003148 13bc0b50, %l2 = 0000000000000050
!	Mem[0000000030001420] = 40577e51ff00006e
	add	%i0,0x020,%g1
	stda	%f28,[%g1+%l2]ASI_PST32_S ! Mem[0000000030001420] = 40577e51ff00006e
!	%l4 = 0000000000000000, Mem[0000000030141410] = f282b2f2
	stha	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = f2820000
!	Mem[0000000010101400] = 33f64108, %l6 = 000000000000004f
	ldstuba	[%i4+%g0]0x88,%l6	! %l6 = 00000008000000ff
!	Mem[0000000010101414] = 0000ecff, %l0 = 8eff8f5f, %l6 = 00000008
	add	%i4,0x14,%g1
	casa	[%g1]0x80,%l0,%l6	! %l6 = 000000000000ecff
!	%f22 = be0f56d7 353b7eea, Mem[0000000030181408] = 13bc0b50 ffffffd9
	stda	%f22,[%i6+%o4]0x89	! Mem[0000000030181408] = be0f56d7 353b7eea
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ffbdb4b9a05f21f0, %l7 = ffffffffffffffff
	ldxa	[%i0+%g0]0x80,%l7	! %l7 = ffbdb4b9a05f21f0

p0_label_93:
!	Mem[0000000030041400] = 004864ac f282b2f2, %l4 = 00000000, %l5 = e10bde60
	ldda	[%i1+%g0]0x81,%l4	! %l4 = 00000000004864ac 00000000f282b2f2
!	Mem[0000000030101410] = 0000000000000000, %f22 = be0f56d7 353b7eea
	ldda	[%i4+%o5]0x81,%f22	! %f22 = 00000000 00000000
!	Mem[00000000100c1400] = ffffffff, %l7 = ffbdb4b9a05f21f0
	ldswa	[%i3+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030001400] = ff00000022000000, %l3 = ffffffffff7e00ff
	ldxa	[%i0+%g0]0x81,%l3	! %l3 = ff00000022000000
!	Mem[00000000100c1400] = ffffffff, %f26 = ff007eff
	lda	[%i3+%g0]0x80,%f26	! %f26 = ffffffff
!	Mem[0000000010101424] = 6b798724, %l4 = 00000000004864ac
	ldub	[%i4+0x024],%l4		! %l4 = 000000000000006b
!	Mem[0000000030001408] = 00000000, %f26 = ffffffff
	lda	[%i0+%o4]0x89,%f26	! %f26 = 00000000
!	Mem[0000000030081400] = 00000000 ffffffd9, %l6 = 0000ecff, %l7 = ffffffff
	ldda	[%i2+%g0]0x89,%l6	! %l6 = 00000000ffffffd9 0000000000000000
!	Mem[00000000218001c0] = 19eabc74, %l6 = 00000000ffffffd9
	ldsba	[%o3+0x1c1]%asi,%l6	! %l6 = ffffffffffffffea
!	Starting 10 instruction Store Burst
!	%l2 = 00000050, %l3 = 22000000, Mem[0000000030041400] = 004864ac f282b2f2
	stda	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000050 22000000

p0_label_94:
!	Mem[0000000010101408] = ffffffff, %l5 = 00000000f282b2f2
	ldstuba	[%i4+%o4]0x80,%l5	! %l5 = 000000ff000000ff
!	%l0 = 000000008eff8f5f, Mem[00000000201c0001] = 00007e52
	stb	%l0,[%o0+0x001]		! Mem[00000000201c0000] = 005f7e52
!	%l4 = 000000000000006b, Mem[0000000030141410] = 000082f2
	stha	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 006b82f2
!	Mem[00000000211c0000] = 5eff1327, %l7 = 0000000000000000
	ldstub	[%o2+%g0],%l7		! %l7 = 0000005e000000ff
!	%l6 = ffffffea, %l7 = 0000005e, Mem[0000000010181408] = ff7e00ff 00000000
	stda	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffffea 0000005e
!	%l1 = 000000001804043b, Mem[0000000030001400] = 00000022000000ff
	stxa	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000001804043b
!	Mem[0000000010141408] = ffffffff, %l1 = 000000001804043b
	swapa	[%i5+%o4]0x80,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000010041408] = 00000000, %l4 = 000000000000006b
	ldstuba	[%i1+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%l4 = 00000000, %l5 = 000000ff, Mem[00000000100c1400] = ffffffff 00000000
	stda	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ff5b7300, %l6 = ffffffffffffffea
	lduba	[%i3+%o5]0x80,%l6	! %l6 = 00000000000000ff

p0_label_95:
!	Mem[0000000030041400] = 00000050, %l6 = 00000000000000ff
	lduha	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041400] = f282b2ff, %l1 = 00000000ffffffff
	lduba	[%i1+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101408] = ffffffff, %l7 = 000000000000005e
	ldsba	[%i4+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101400] = ff41f633, %l3 = ff00000022000000
	lduw	[%i4+%g0],%l3		! %l3 = 00000000ff41f633
!	Mem[0000000010001400] = ffbdb4b9, %l7 = ffffffffffffffff
	ldsha	[%i0+%g0]0x80,%l7	! %l7 = ffffffffffffffbd
!	Mem[0000000010141400] = d9000000fa000000, %l2 = 0000000000000050
	ldxa	[%i5+%g0]0x80,%l2	! %l2 = d9000000fa000000
!	Mem[0000000010181408] = ffffffea, %l1 = 00000000000000ff
	ldswa	[%i6+%o4]0x88,%l1	! %l1 = ffffffffffffffea
!	Mem[0000000010141400] = d9000000, %f4  = 00000000
	lda	[%i5+%g0]0x80,%f4 	! %f4 = d9000000
!	Mem[0000000010081400] = ffffffff, %f14 = 5ebd0000
	lda	[%i2+%g0]0x88,%f14	! %f14 = ffffffff
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = ffffffbd, Mem[0000000010001410] = ff641555 00003148
	std	%l6,[%i0+%o5]		! Mem[0000000010001410] = 00000000 ffffffbd

p0_label_96:
!	Mem[0000000010141430] = 45a78c73, %l6 = 00000000, %l2 = fa000000
	add	%i5,0x30,%g1
	casa	[%g1]0x80,%l6,%l2	! %l2 = 0000000045a78c73
!	Mem[0000000010001408] = 000064ac, %l6 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l6	! %l6 = 00000000000064ac
!	%f8  = cac88006 5b3285ea, %l4 = 0000000000000000
!	Mem[0000000030041430] = adcb22a4a208773c
	add	%i1,0x030,%g1
	stda	%f8,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030041430] = adcb22a4a208773c
!	%l6 = 00000000000064ac, Mem[0000000010101410] = 0841f633
	stwa	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 000064ac
!	Mem[00000000300c1400] = 000000a3, %l0 = 000000008eff8f5f
	ldstuba	[%i3+%g0]0x89,%l0	! %l0 = 000000a3000000ff
!	Mem[0000000010081408] = 5f8f0000, %l0 = 00000000000000a3
	swapa	[%i2+%o4]0x80,%l0	! %l0 = 000000005f8f0000
!	Mem[0000000030041408] = ff0bbc13, %l2 = 0000000045a78c73
	swapa	[%i1+%o4]0x81,%l2	! %l2 = 00000000ff0bbc13
!	%f6  = 00000000 d02e34e7, Mem[0000000030001400] = 1804043b 00000000
	stda	%f6 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 d02e34e7
!	Mem[0000000010181419] = 0000004c, %l6 = 00000000000064ac
	ldstuba	[%i6+0x019]%asi,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00000000, %l6 = 0000000000000000
	ldswa	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000

p0_label_97:
!	Mem[0000000030101410] = 00000000, %l0 = 000000005f8f0000
	lduha	[%i4+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000211c0000] = ffff1327, %l2 = 00000000ff0bbc13
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010041410] = 00000000, %f30 = f2b282f2
	lda	[%i1+%o5]0x88,%f30	! %f30 = 00000000
!	Mem[00000000300c1410] = f2b282f256e14f18, %l3 = 00000000ff41f633
	ldxa	[%i3+%o5]0x89,%l3	! %l3 = f2b282f256e14f18
!	Mem[0000000030041400] = 0000005022000000, %f24 = a3000000 ff000000
	ldda	[%i1+%g0]0x81,%f24	! %f24 = 00000050 22000000
!	Mem[0000000030041408] = 738ca745, %l6 = 0000000000000000
	lduba	[%i1+%o4]0x89,%l6	! %l6 = 0000000000000045
!	Mem[0000000010181400] = 8eff8f5f, %l7 = ffffffffffffffbd
	lduba	[%i6+%g0]0x80,%l7	! %l7 = 000000000000008e
!	Mem[00000000211c0000] = ffff1327, %l3 = f2b282f256e14f18
	ldsb	[%o2+0x001],%l3		! %l3 = ffffffffffffffff
!	Mem[00000000300c1408] = 000000fa000000ab, %f8  = cac88006 5b3285ea
	ldda	[%i3+%o4]0x81,%f8 	! %f8  = 000000fa 000000ab
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000045, Mem[0000000010101410] = ac640000
	stba	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = ac640045

p0_label_98:
!	Mem[000000001004140c] = 00000000, %l7 = 000000000000008e
	swap	[%i1+0x00c],%l7		! %l7 = 0000000000000000
!	%l1 = ffffffffffffffea, Mem[00000000100c1400] = 00000000000000ff
	stxa	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffffffffffffffea
!	%f30 = 00000000 00000000, %l2 = 000000000000ffff
!	Mem[0000000030041438] = 026d54bed3db8fe8
	add	%i1,0x038,%g1
	stda	%f30,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030041438] = 0000000000000000
!	%l0 = 00000000, %l1 = ffffffea, Mem[0000000010101410] = ac640045 ffec0000
	stda	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000 ffffffea
	membar	#Sync			! Added by membar checker (15)
!	%l2 = 000000000000ffff, Mem[0000000010041408] = ff000000
	stha	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = ffff0000
!	Mem[0000000010081400] = ffffffff, %l3 = ffffffff, %l1 = ffffffea
	casa	[%i2]0x80,%l3,%l1	! %l1 = 00000000ffffffff
!	%f6  = 00000000, Mem[0000000010041408] = ffff0000
	sta	%f6 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	%f24 = 00000050 22000000, Mem[0000000030141400] = 00000000 ff00006e
	stda	%f24,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000050 22000000
!	%l3 = ffffffffffffffff, Mem[0000000010181408] = ffffffea
	stba	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00003148, %l1 = 00000000ffffffff
	ldswa	[%i4+%g0]0x81,%l1	! %l1 = 0000000000003148

p0_label_99:
!	Mem[0000000030001408] = 00000000, %l0 = 0000000000000000
	ldswa	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0000] = 005f7e52, %l5 = 00000000000000ff
	lduh	[%o0+%g0],%l5		! %l5 = 000000000000005f
!	Mem[00000000100c1410] = ff5b730000001c6c, %f6  = 00000000 d02e34e7
	ldda	[%i3+%o5]0x80,%f6 	! %f6  = ff5b7300 00001c6c
!	Mem[0000000030101410] = 00000000, %l5 = 000000000000005f
	ldsba	[%i4+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101408] = 4f000000, %l3 = ffffffffffffffff
	lduba	[%i4+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141400] = 00000050, %l6 = 0000000000000045
	ldsha	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = ffff1327, %l6 = 0000000000000000
	lduba	[%o2+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[000000001014141c] = fffff700, %l7 = 0000000000000000
	ldsw	[%i5+0x01c],%l7		! %l7 = fffffffffffff700
!	Mem[0000000020800040] = 0000095a, %l0 = 0000000000000000
	lduha	[%o1+0x040]%asi,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f12 = 8eff8f5f 1804043b, Mem[0000000010041420] = cac88006 5b3285ea
	stda	%f12,[%i1+0x020]%asi	! Mem[0000000010041420] = 8eff8f5f 1804043b

p0_label_100:
!	%l1 = 0000000000003148, Mem[0000000030101400] = 00003148
	stba	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = 48003148
!	Mem[00000000201c0000] = 005f7e52, %l1 = 0000000000003148
	ldstub	[%o0+%g0],%l1		! %l1 = 00000000000000ff
!	%l0 = 00000000, %l1 = 00000000, Mem[00000000300c1400] = 000000ff 41000000
	stda	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 00000000
!	Mem[0000000010181400] = 5f8fff8e, %l2 = 000000000000ffff
	swapa	[%i6+%g0]0x88,%l2	! %l2 = 000000005f8fff8e
!	Mem[0000000010001410] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i0+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[00000000201c0000] = ff5f7e52
	sth	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 00007e52
!	%l1 = 0000000000000000, Mem[0000000030001408] = 00000000
	stba	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	%l2 = 000000005f8fff8e, Mem[0000000010081410] = 0000ecff
	stha	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = ff8eecff
!	%f12 = 8eff8f5f 1804043b, %l7 = fffffffffffff700
!	Mem[00000000100c1428] = 62871921ac64ec22
	add	%i3,0x028,%g1
	stda	%f12,[%g1+%l7]ASI_PST32_P ! Mem[00000000100c1428] = 62871921ac64ec22
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00007e52, %l7 = fffffffffffff700
	lduh	[%o0+%g0],%l7		! %l7 = 0000000000000000

p0_label_101:
!	Mem[0000000010001408] = 0000000000000000, %l1 = 0000000000000000
	ldxa	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = ffffffff 5e000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i6+%o4]0x80,%l0	! %l0 = 00000000ffffffff 000000005e000000
!	Mem[0000000010101408] = ffffffff ff7e00ff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i4+%o4]0x80,%l4	! %l4 = 00000000ffffffff 00000000ff7e00ff
!	Mem[0000000010081400] = eaffffff, %l7 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081400] = d9ffffff, %l4 = 00000000ffffffff
	lduwa	[%i2+%g0]0x81,%l4	! %l4 = 00000000d9ffffff
!	Mem[00000000300c1408] = 000000fa 000000ab, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i3+%o4]0x81,%l6	! %l6 = 00000000000000fa 00000000000000ab
!	Mem[00000000201c0000] = 00007e52, %l2 = 000000005f8fff8e
	ldsba	[%o0+0x001]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001400] = ffbdb4b9, %l0 = 00000000ffffffff
	lduw	[%i0+%g0],%l0		! %l0 = 00000000ffbdb4b9
!	Mem[0000000010181400] = ffff0000, %l7 = 00000000000000ab
	ldswa	[%i6+%g0]0x80,%l7	! %l7 = ffffffffffff0000
!	Starting 10 instruction Store Burst
!	%f24 = 00000050 22000000, %l4 = 00000000d9ffffff
!	Mem[0000000030141428] = a6568bbe7e80b946
	add	%i5,0x028,%g1
	stda	%f24,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030141428] = 0000002250000000

p0_label_102:
!	Mem[0000000010181408] = ffffffff, %l5 = 00000000ff7e00ff
	swapa	[%i6+%o4]0x80,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010101408] = ffffffff, %l2 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000100c1428] = 62871921, %l4 = 00000000d9ffffff
	ldstuba	[%i3+0x028]%asi,%l4	! %l4 = 00000062000000ff
!	%l3 = 0000000000000000, Mem[0000000030081410] = 00000000
	stba	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	%l6 = 000000fa, %l7 = ffff0000, Mem[00000000100c1410] = 00735bff 6c1c0000
	stda	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000fa ffff0000
!	Mem[0000000010001408] = 00000000, %l4 = 0000000000000062
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%l6 = 000000fa, %l7 = ffff0000, Mem[0000000010141430] = 45a78c73 e1641555
	std	%l6,[%i5+0x030]		! Mem[0000000010141430] = 000000fa ffff0000
!	Mem[0000000010181410] = ffec64ac, %l4 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l4	! %l4 = 000000ff000000ff
!	%f13 = 1804043b, Mem[0000000010041428] = ce824c3f
	sta	%f13,[%i1+0x028]%asi	! Mem[0000000010041428] = 1804043b
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff8eecff, %l4 = 00000000000000ff
	ldsb	[%i2+%o5],%l4		! %l4 = ffffffffffffffff

p0_label_103:
!	Mem[0000000010181408] = ff7e00ff5e000000, %f16 = ffffffd9 00000000
	ldda	[%i6+0x008]%asi,%f16	! %f16 = ff7e00ff 5e000000
!	Mem[0000000030141408] = 00000000, %l2 = 00000000000000ff
	ldswa	[%i5+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181410] = ac64ecff, %l6 = 00000000000000fa
	lduha	[%i6+%o5]0x88,%l6	! %l6 = 000000000000ecff
!	Mem[0000000030141408] = 00000000, %l6 = 000000000000ecff
	lduha	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = 0000004f, %l4 = ffffffffffffffff
	ldswa	[%i4+%o4]0x81,%l4	! %l4 = 000000000000004f
!	Mem[0000000010101430] = 22ec64ac, %l5 = 00000000ffffffff
	ldsb	[%i4+0x032],%l5		! %l5 = 0000000000000064
!	Mem[0000000021800040] = ff644546, %l2 = 0000000000000000
	ldsba	[%o3+0x041]%asi,%l2	! %l2 = 0000000000000064
!	Mem[0000000010141428] = 00735b41, %l3 = 0000000000000000
	lduh	[%i5+0x02a],%l3		! %l3 = 0000000000005b41
!	Mem[0000000030101410] = 0000000000000000, %l4 = 000000000000004f
	ldxa	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = ffffffff, %l0 = 00000000ffbdb4b9
	ldstuba	[%i3+%g0]0x88,%l0	! %l0 = 000000ff000000ff

p0_label_104:
!	Mem[0000000010181418] = 00ff004c55a6359c, %l5 = 0000000000000064, %l6 = 0000000000000000
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l5,%l6	! %l6 = 00ff004c55a6359c
!	%f16 = ff7e00ff 5e000000, Mem[0000000010081400] = ffffffea ecffffff
	stda	%f16,[%i2+%g0]0x80	! Mem[0000000010081400] = ff7e00ff 5e000000
!	Mem[00000000211c0001] = ffff1327, %l7 = ffffffffffff0000
	ldstub	[%o2+0x001],%l7		! %l7 = 000000ff000000ff
!	Mem[0000000010181400] = ffff00001804043b, %l4 = 0000000000000000, %l4 = 0000000000000000
	casxa	[%i6]0x80,%l4,%l4	! %l4 = ffff00001804043b
!	Mem[0000000030181410] = 00ff64ac, %l4 = ffff00001804043b
	ldstuba	[%i6+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%f30 = 00000000 00000000, %l0 = 00000000000000ff
!	Mem[0000000010081418] = f0215fa04100388c
	add	%i2,0x018,%g1
	stda	%f30,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010081418] = 0000000000000000
!	%l6 = 00ff004c55a6359c, Mem[00000000100c1408] = 00000000
	stwa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 55a6359c
!	Mem[0000000010141408] = 3b040418, %l1 = 000000005e000000
	ldstuba	[%i5+%o4]0x88,%l1	! %l1 = 00000018000000ff
!	Mem[00000000100c1424] = 000000f2, %l1 = 00000018, %l2 = 00000064
	add	%i3,0x24,%g1
	casa	[%g1]0x80,%l1,%l2	! %l2 = 00000000000000f2
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff000000, %l2 = 00000000000000f2
	lduwa	[%i0+0x008]%asi,%l2	! %l2 = 00000000ff000000

p0_label_105:
!	Mem[0000000010081430] = e015433c, %l2 = 00000000ff000000
	ldsb	[%i2+0x033],%l2		! %l2 = 000000000000003c
!	Mem[0000000030041408] = 45a78c73, %l2 = 000000000000003c
	ldswa	[%i1+%o4]0x81,%l2	! %l2 = 0000000045a78c73
!	Mem[0000000010041408] = 8e000000 00000000, %l2 = 45a78c73, %l3 = 00005b41
	ldda	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000000 000000008e000000
!	Mem[0000000010001408] = ff000000, %l4 = 0000000000000000
	ldsha	[%i0+%o4]0x80,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000010141438] = ffffffff, %l6 = 00ff004c55a6359c
	ldswa	[%i5+0x038]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030101408] = 4f000000, %f17 = 5e000000
	lda	[%i4+%o4]0x89,%f17	! %f17 = 4f000000
!	Mem[00000000300c1408] = 000000fa000000ab, %f12 = 8eff8f5f 1804043b
	ldda	[%i3+%o4]0x81,%f12	! %f12 = 000000fa 000000ab
!	Mem[0000000010081400] = ff007eff, %l5 = 0000000000000064
	lduha	[%i2+%g0]0x88,%l5	! %l5 = 0000000000007eff
!	Mem[0000000030181400] = 00000048, %l7 = 00000000000000ff
	lduwa	[%i6+%g0]0x81,%l7	! %l7 = 0000000000000048
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000048, Mem[0000000010181410] = ffec64ac
	stwa	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000048

p0_label_106:
!	Mem[0000000010181400] = ffff0000, %l7 = 0000000000000048
	ldstuba	[%i6+%g0]0x80,%l7	! %l7 = 000000ff000000ff
!	%l0 = 000000ff, %l1 = 00000018, Mem[0000000030141408] = 00000000 21198762
	stda	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000ff 00000018
!	Mem[0000000010041408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[00000000100c1414] = 0000ffff
	stw	%l2,[%i3+0x014]		! Mem[00000000100c1414] = 00000000
!	%l4 = ffffffffffffff00, Mem[0000000030181410] = ffff64ac
	stwa	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffff00
!	%l6 = ffffffff, %l7 = 000000ff, Mem[0000000010181408] = ff7e00ff 5e000000
	stda	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = ffffffff 000000ff
!	%l7 = 00000000000000ff, Mem[0000000010001422] = 3c1df47b
	sth	%l7,[%i0+0x022]		! Mem[0000000010001420] = 3c1d00ff
!	%f8  = 000000fa 000000ab, %l6 = ffffffffffffffff
!	Mem[0000000010041410] = 00000000cac88006
	add	%i1,0x010,%g1
	stda	%f8,[%g1+%l6]ASI_PST16_P ! Mem[0000000010041410] = 000000fa000000ab
!	%f4  = d9000000 cac88006, %l7 = 00000000000000ff
!	Mem[0000000030141420] = 40577e5104a24db6
	add	%i5,0x020,%g1
	stda	%f4,[%g1+%l7]ASI_PST8_S ! Mem[0000000030141420] = d9000000cac88006
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = d9000000, %l1 = 0000000000000018
	lduba	[%i5+%g0]0x80,%l1	! %l1 = 00000000000000d9

p0_label_107:
!	Mem[00000000300c1410] = f2b282f256e14f18, %f22 = 00000000 00000000
	ldda	[%i3+%o5]0x89,%f22	! %f22 = f2b282f2 56e14f18
!	Mem[0000000010001438] = 75f012952cafd500, %f22 = f2b282f2 56e14f18
	ldda	[%i0+0x038]%asi,%f22	! %f22 = 75f01295 2cafd500
!	Mem[0000000030141400] = 50000000, %l5 = 0000000000007eff
	lduha	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001434] = d09b646b, %l0 = 00000000000000ff
	ldsh	[%i0+0x036],%l0		! %l0 = 000000000000646b
!	Mem[00000000100c1410] = 000000fa, %l7 = 00000000000000ff
	ldsba	[%i3+%o5]0x88,%l7	! %l7 = fffffffffffffffa
!	Mem[00000000201c0000] = 00007e52, %l6 = ffffffffffffffff
	ldsb	[%o0+0x001],%l6		! %l6 = 0000000000000000
!	Mem[0000000010181400] = 3b0404180000ffff, %l2 = 0000000000000000
	ldxa	[%i6+%g0]0x88,%l2	! %l2 = 3b0404180000ffff
!	Mem[0000000030141410] = 006b82f2, %l1 = 00000000000000d9
	lduha	[%i5+%o5]0x81,%l1	! %l1 = 000000000000006b
!	Mem[0000000021800180] = 5bcb6058, %l7 = fffffffffffffffa
	lduba	[%o3+0x180]%asi,%l7	! %l7 = 000000000000005b
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 0000005b, Mem[0000000010181408] = ffffffff 000000ff
	stda	%l6,[%i6+0x008]%asi	! Mem[0000000010181408] = 00000000 0000005b

p0_label_108:
!	%f22 = 75f01295, Mem[0000000010101400] = ff41f633
	st	%f22,[%i4+%g0]		! Mem[0000000010101400] = 75f01295
!	%l5 = 0000000000000000, Mem[0000000030101410] = 0000000000000000
	stxa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000000000000000
!	%l7 = 000000000000005b, Mem[0000000010141408] = 3b0404ff
	stwa	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000005b
!	Mem[0000000010001410] = 000000ff, %l3 = 000000008e000000
	swapa	[%i0+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%f14 = ffffffff e1641555, Mem[0000000010001400] = ffbdb4b9 a05f21f0
	stda	%f14,[%i0+%g0]0x80	! Mem[0000000010001400] = ffffffff e1641555
!	Mem[0000000030001408] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	%l1 = 000000000000006b, Mem[00000000300c1408] = fa000000
	stwa	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000006b
!	%l4 = ffffffffffffff00, Mem[0000000030101410] = 00000000
	stwa	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffff00
!	Mem[0000000020800040] = 0000095a, %l1 = 000000000000006b
	ldstuba	[%o1+0x040]%asi,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 45a78c73, %f21 = 00000000
	lda	[%i1+%o4]0x81,%f21	! %f21 = 45a78c73

p0_label_109:
!	Mem[0000000010181410] = 00000048f282b2f2, %f14 = ffffffff e1641555
	ldda	[%i6+%o5]0x80,%f14	! %f14 = 00000048 f282b2f2
!	Mem[0000000030101410] = ffffff0000000000, %f10 = ce824c3f a7e1c4ff
	ldda	[%i4+%o5]0x81,%f10	! %f10 = ffffff00 00000000
!	Mem[0000000030181410] = ffffff00, %l3 = 00000000000000ff
	lduha	[%i6+%o5]0x81,%l3	! %l3 = 000000000000ffff
!	Mem[0000000030041410] = 0000005541dce33e, %l7 = 000000000000005b
	ldxa	[%i1+%o5]0x81,%l7	! %l7 = 0000005541dce33e
!	Mem[0000000010181420] = 5148fd82, %l6 = 0000000000000000
	ldswa	[%i6+0x020]%asi,%l6	! %l6 = 000000005148fd82
!	Mem[0000000010141408] = 5b000000, %l4 = ffffffffffffff00
	ldsw	[%i5+%o4],%l4		! %l4 = 000000005b000000
!	Mem[00000000300c1410] = 56e14f18, %l0 = 000000000000646b
	ldsba	[%i3+%o5]0x89,%l0	! %l0 = 0000000000000018
!	Mem[0000000010181410] = 00000048, %l7 = 0000005541dce33e
	lduha	[%i6+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041410] = 00000055, %l4 = 000000005b000000
	ldsha	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[00000000300c1400] = 0000000000000000
	stxa	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000000000000

p0_label_110:
!	%l6 = 000000005148fd82, Mem[0000000010001400] = 551564e1ffffffff
	stxa	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000005148fd82
!	%l4 = 0000000000000000, Mem[0000000010041400] = ffb282f2
	stwa	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	Mem[0000000030001400] = e7342ed0, %l6 = 000000005148fd82
	ldstuba	[%i0+%g0]0x81,%l6	! %l6 = 000000e7000000ff
!	%f28 = 00003148 13bc0b50, %l7 = 0000000000000000
!	Mem[0000000030141410] = 006b82f200005eff
	add	%i5,0x010,%g1
	stda	%f28,[%g1+%l7]ASI_PST8_S ! Mem[0000000030141410] = 006b82f200005eff
!	%f9  = 000000ab, Mem[0000000030141410] = 006b82f2
	sta	%f9 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000ab
!	%f24 = 00000050 22000000, %l4 = 0000000000000000
!	Mem[00000000300c1438] = ab9531cac100e9ff
	add	%i3,0x038,%g1
	stda	%f24,[%g1+%l4]ASI_PST32_S ! Mem[00000000300c1438] = ab9531cac100e9ff
!	%l4 = 0000000000000000, Mem[0000000010041400] = 00000000
	stwa	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	%f5  = cac88006, %f4  = d9000000 cac88006
	fitod	%f5 ,%f4 		! %f4  = c1ca9bbf fd000000
!	%l7 = 0000000000000000, Mem[0000000010101408] = ffffffff
	stwa	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 6b000000, %l7 = 0000000000000000
	ldsha	[%i3+%o4]0x81,%l7	! %l7 = 0000000000006b00

p0_label_111:
!	Mem[0000000010001408] = ff000000 00000000, %l6 = 000000e7, %l7 = 00006b00
	ldda	[%i0+%o4]0x80,%l6	! %l6 = 00000000ff000000 0000000000000000
!	%f26 = 00000000 00000000, Mem[0000000010141410] = 000000ff 000000a3
	stda	%f26,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 00000000
!	Mem[0000000010181410] = 48000000, %l7 = 0000000000000000
	lduha	[%i6+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181410] = ff90d6d100ffffff, %f14 = 00000048 f282b2f2
	ldda	[%i6+%o5]0x89,%f14	! %f14 = ff90d6d1 00ffffff
!	Mem[0000000020800040] = ff00095a, %l0 = 0000000000000018
	lduha	[%o1+0x040]%asi,%l0	! %l0 = 000000000000ff00
!	Mem[00000000100c1430] = be0f56d7, %l2 = 3b0404180000ffff
	ldsba	[%i3+0x031]%asi,%l2	! %l2 = 000000000000000f
!	Mem[00000000300c1400] = 00000000, %l4 = 0000000000000000
	ldswa	[%i3+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001410] = 8e000000, %l7 = 0000000000000000
	lduba	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181400] = 48000000, %l6 = 00000000ff000000
	lduwa	[%i6+%g0]0x89,%l6	! %l6 = 0000000048000000
!	Starting 10 instruction Store Burst
!	%f16 = ff7e00ff 4f000000, Mem[0000000010001410] = 0000008e ffffffbd
	stda	%f16,[%i0+0x010]%asi	! Mem[0000000010001410] = ff7e00ff 4f000000

p0_label_112:
!	%l4 = 0000000000000000, Mem[0000000021800180] = 5bcb6058
	sth	%l4,[%o3+0x180]		! Mem[0000000021800180] = 00006058
!	%l5 = 0000000000000000, Mem[0000000010141410] = 00000000
	stha	%l5,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	%f0  = ffb282f2, Mem[0000000010001400] = 82fd4851
	sta	%f0 ,[%i0+0x000]%asi	! Mem[0000000010001400] = ffb282f2
!	Mem[0000000010041410] = 000000fa, %l3 = 000000000000ffff
	ldstuba	[%i1+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081408] = a3000000, %l4 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l4	! %l4 = 00000000a3000000
!	Mem[00000000300c1408] = 6b000000, %l2 = 000000000000000f
	swapa	[%i3+%o4]0x81,%l2	! %l2 = 000000006b000000
!	%l2 = 000000006b000000, Mem[0000000030101410] = 00ffffff
	stha	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 00ff0000
!	Mem[0000000010141400] = d9000000fa000000, %l3 = 0000000000000000, %l0 = 000000000000ff00
	casxa	[%i5]0x80,%l3,%l0	! %l0 = d9000000fa000000
!	Mem[0000000010081420] = 1d79e519, %l7 = 00000000, %l1 = 00000000
	add	%i2,0x20,%g1
	casa	[%g1]0x80,%l7,%l1	! %l1 = 000000001d79e519
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 00000050, %l4 = 00000000a3000000
	lduwa	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000050

p0_label_113:
!	Mem[0000000010081428] = 21081c6c, %l2 = 000000006b000000
	ldsha	[%i2+0x028]%asi,%l2	! %l2 = 0000000000002108
!	Mem[0000000030081400] = 00000000ffffffd9, %l5 = 0000000000000000
	ldxa	[%i2+%g0]0x89,%l5	! %l5 = 00000000ffffffd9
!	Mem[0000000010181410] = 48000000, %l5 = 00000000ffffffd9
	ldsha	[%i6+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041420] = 8eff8f5f, %l6 = 0000000048000000
	lduw	[%i1+0x020],%l6		! %l6 = 000000008eff8f5f
!	Mem[0000000030041408] = 45a78c73, %l0 = d9000000fa000000
	lduha	[%i1+%o4]0x81,%l0	! %l0 = 00000000000045a7
!	Mem[00000000300c1408] = 0000000f000000ab, %l5 = 0000000000000000
	ldxa	[%i3+%o4]0x81,%l5	! %l5 = 0000000f000000ab
!	Mem[00000000201c0000] = 00007e52, %l2 = 0000000000002108
	ldsh	[%o0+%g0],%l2		! %l2 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l0 = 00000000000045a7
	ldsba	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101410] = 0000ff00, %l6 = 000000008eff8f5f
	lduha	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000050, %l5 = 000000ab, Mem[0000000010041408] = ff000000 0000008e
	stda	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000050 000000ab

p0_label_114:
!	Mem[0000000010001410] = ff007eff, %l7 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l7	! %l7 = 00000000ff007eff
!	%f14 = ff90d6d1, Mem[0000000030141400] = 50000000
	sta	%f14,[%i5+%g0]0x89	! Mem[0000000030141400] = ff90d6d1
!	%l0 = 0000000000000000, Mem[0000000010041400] = 415b730000000000
	stxa	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010041410] = ab000000fa0000ff
	stxa	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000000000000000
!	%l1 = 000000001d79e519, Mem[0000000010041400] = 00000000
	stba	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 19000000
!	%l7 = 00000000ff007eff, Mem[0000000010101400] = 000000009512f075
	stxa	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000ff007eff
!	%l4 = 0000000000000050, Mem[000000001010142e] = 3b040418
	stb	%l4,[%i4+0x02e]		! Mem[000000001010142c] = 3b045018
!	Mem[0000000010141408] = 0000005b, %l2 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l2	! %l2 = 0000005b000000ff
!	Mem[0000000010001400] = ffb282f2, %l1 = 000000001d79e519
	swapa	[%i0+%g0]0x80,%l1	! %l1 = 00000000ffb282f2
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000, %l1 = 00000000ffb282f2
	lduha	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000000

p0_label_115:
!	Mem[0000000030181400] = 0000004800005eff, %l1 = 0000000000000000
	ldxa	[%i6+%g0]0x81,%l1	! %l1 = 0000004800005eff
!	Mem[0000000010041404] = 00000000, %l3 = 0000000000000000
	ldsba	[%i1+0x005]%asi,%l3	! %l3 = 0000000000000000
!	%l6 = 0000000000000000, Mem[00000000300c1408] = 0f000000
	stha	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0f000000
!	Mem[0000000010141428] = 00735b41 e10bde60, %l4 = 00000050, %l5 = 000000ab
	ldda	[%i5+0x028]%asi,%l4	! %l4 = 0000000000735b41 00000000e10bde60
!	Mem[0000000030181400] = 48000000, %l4 = 0000000000735b41
	lduba	[%i6+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = fa000000, %l3 = 0000000000000000
	ldsha	[%i3+%o5]0x80,%l3	! %l3 = fffffffffffffa00
!	Mem[0000000010081400] = ff7e00ff5e000000, %f12 = 000000fa 000000ab
	ldda	[%i2+%g0]0x80,%f12	! %f12 = ff7e00ff 5e000000
!	Mem[0000000010181408] = 00000000 0000005b, %l6 = 00000000, %l7 = ff007eff
	ldda	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000000 000000000000005b
!	Mem[0000000030181400] = 00000048, %l4 = 0000000000000000
	ldswa	[%i6+%g0]0x81,%l4	! %l4 = 0000000000000048
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = ffff1327, %l0 = 0000000000000000
	ldstub	[%o2+0x001],%l0		! %l0 = 000000ff000000ff

p0_label_116:
!	Mem[0000000010141408] = ff000000, %l5 = 00000000e10bde60
	ldstuba	[%i5+%o4]0x80,%l5	! %l5 = 000000ff000000ff
!	%f16 = ff7e00ff 4f000000 ff5b7300 000013a1
!	%f20 = 21081c6c 45a78c73 75f01295 2cafd500
!	%f24 = 00000050 22000000 00000000 00000000
!	%f28 = 00003148 13bc0b50 00000000 00000000
	stda	%f16,[%i0]ASI_COMMIT_P	! Block Store to 0000000010001400
!	%l5 = 00000000000000ff, Mem[0000000010181410] = 00000048f282b2f2
	stxa	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000000000ff
	membar	#Sync			! Added by membar checker (16)
!	%l3 = fffffffffffffa00, Mem[0000000010001400] = ff7e00ff
	stw	%l3,[%i0+%g0]		! Mem[0000000010001400] = fffffa00
!	%f6  = ff5b7300 00001c6c, %l6 = 0000000000000000
!	Mem[0000000010141428] = 00735b41e10bde60
	add	%i5,0x028,%g1
	stda	%f6,[%g1+%l6]ASI_PST16_P ! Mem[0000000010141428] = 00735b41e10bde60
!	%l1 = 0000004800005eff, Mem[0000000030041408] = 45a78c73
	stwa	%l1,[%i1+%o4]0x81	! Mem[0000000030041408] = 00005eff
!	%f6  = ff5b7300, Mem[0000000030081408] = 00000000
	sta	%f6 ,[%i2+%o4]0x81	! Mem[0000000030081408] = ff5b7300
!	%l2 = 000000000000005b, Mem[0000000010041416] = 00000000
	stb	%l2,[%i1+0x016]		! Mem[0000000010041414] = 00005b00
!	Mem[0000000010081408] = 00000000, %f8  = 000000fa
	lda	[%i2+%o4]0x88,%f8 	! %f8 = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 000000fa000000d9, %l5 = 00000000000000ff
	ldxa	[%i5+%g0]0x88,%l5	! %l5 = 000000fa000000d9

p0_label_117:
!	Mem[0000000030181400] = 00000048, %f15 = 00ffffff
	lda	[%i6+%g0]0x81,%f15	! %f15 = 00000048
!	Mem[0000000030001410] = ff007eff, %f29 = 13bc0b50
	lda	[%i0+%o5]0x81,%f29	! %f29 = ff007eff
!	Mem[0000000030101400] = 48310048, %l7 = 000000000000005b
	lduba	[%i4+%g0]0x89,%l7	! %l7 = 0000000000000048
!	Mem[00000000100c1400] = ffffffff, %f8  = 00000000
	lda	[%i3+%g0]0x80,%f8 	! %f8 = ffffffff
!	Mem[0000000010041430] = 8eff8f5f 1804043b, %l2 = 0000005b, %l3 = fffffa00
	ldd	[%i1+0x030],%l2		! %l2 = 000000008eff8f5f 000000001804043b
!	Mem[0000000030141400] = 00000022ff90d6d1, %l5 = 000000fa000000d9
	ldxa	[%i5+%g0]0x89,%l5	! %l5 = 00000022ff90d6d1
!	Mem[0000000010141400] = d9000000, %l0 = 00000000000000ff
	ldsha	[%i5+%g0]0x80,%l0	! %l0 = ffffffffffffd900
!	Mem[0000000010141400] = 000000fa 000000d9, %l4 = 00000048, %l5 = ff90d6d1
	ldda	[%i5+%g0]0x88,%l4	! %l4 = 00000000000000d9 00000000000000fa
!	Mem[0000000010181424] = b7393c5a, %l2 = 000000008eff8f5f
	ldub	[%i6+0x027],%l2		! %l2 = 000000000000005a
!	Starting 10 instruction Store Burst
!	%l0 = ffffd900, %l1 = 00005eff, Mem[0000000010041408] = 50000000 ab000000
	stda	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffd900 00005eff

p0_label_118:
!	%l6 = 00000000, %l7 = 00000048, Mem[0000000030041408] = 00005eff 48310000
	stda	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000 00000048
!	%l2 = 000000000000005a, Mem[0000000030081400] = d9ffffff00000000
	stxa	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000000000005a
!	%f27 = 00000000, Mem[0000000030101408] = 0000004f
	sta	%f27,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	Mem[0000000010141410] = 00000000, %l0 = ffffffffffffd900
	ldstuba	[%i5+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	%l2 = 000000000000005a, Mem[0000000030101408] = 00000000
	stha	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 005a0000
!	%l1 = 0000004800005eff, Mem[0000000010141418] = 1d79e519
	sth	%l1,[%i5+0x018]		! Mem[0000000010141418] = 5effe519
!	%f12 = ff7e00ff 5e000000, Mem[0000000010141408] = ff000000 ffffffec
	stda	%f12,[%i5+%o4]0x80	! Mem[0000000010141408] = ff7e00ff 5e000000
!	%l7 = 0000000000000048, Mem[0000000030101410] = 0000000000ff0000
	stxa	%l7,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000000000000048
!	%l2 = 0000005a, %l3 = 1804043b, Mem[0000000010101430] = 22ec64ac 21198762
	std	%l2,[%i4+0x030]		! Mem[0000000010101430] = 0000005a 1804043b
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ffffffff ffffffea, %l4 = 000000d9, %l5 = 000000fa
	ldda	[%i3+%g0]0x80,%l4	! %l4 = 00000000ffffffff 00000000ffffffea

p0_label_119:
!	Mem[00000000100c1400] = ffffffff, %l2 = 000000000000005a
	lduwa	[%i3+%g0]0x80,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000010141408] = 0000005e ff007eff, %l4 = ffffffff, %l5 = ffffffea
	ldda	[%i5+%o4]0x88,%l4	! %l4 = 00000000ff007eff 000000000000005e
!	Mem[0000000030041410] = 00000055, %l4 = 00000000ff007eff
	lduha	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041410] = 3ee3dc41 55000000, %l4 = 00000000, %l5 = 0000005e
	ldda	[%i1+%o5]0x89,%l4	! %l4 = 0000000055000000 000000003ee3dc41
!	Mem[0000000030001410] = ff007eff, %f14 = ff90d6d1
	lda	[%i0+%o5]0x81,%f14	! %f14 = ff007eff
!	Mem[0000000010141418] = 5effe519, %l4 = 0000000055000000
	lduba	[%i5+0x01a]%asi,%l4	! %l4 = 00000000000000e5
!	Mem[0000000010001410] = 21081c6c, %l1 = 0000004800005eff
	lduba	[%i0+%o5]0x80,%l1	! %l1 = 0000000000000021
!	Mem[0000000010181400] = 0000ffff, %l4 = 00000000000000e5
	lduha	[%i6+%g0]0x88,%l4	! %l4 = 000000000000ffff
!	Mem[00000000300c1400] = 00000000 00000000 0000000f 000000ab
!	Mem[00000000300c1410] = 184fe156 f282b2f2 1a8b21c9 5edd8e9d
!	Mem[00000000300c1420] = 72a316e4 319f9fdd 48894813 8c92de46
!	Mem[00000000300c1430] = f844afee 834d6f99 ab9531ca c100e9ff
	ldda	[%i3]ASI_BLK_AIUS,%f16	! Block Load from 00000000300c1400
!	Starting 10 instruction Store Burst
!	%l5 = 000000003ee3dc41, Mem[0000000010041400] = 00000019
	stha	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000dc41

p0_label_120:
!	Mem[00000000100c1400] = ffffffff, %l2 = 00000000ffffffff
	ldstuba	[%i3+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010041408] = ffffd900, %l6 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	%l4 = 000000000000ffff, Mem[0000000010001408] = 00735bff
	stha	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = 0073ffff
!	Mem[0000000030181400] = 48000000, %l7 = 0000000000000048
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101400] = 48310048, %l6 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l6	! %l6 = 00000048000000ff
!	%f14 = ff007eff 00000048, %l7 = 0000000000000000
!	Mem[0000000010001428] = 0000000000000000
	add	%i0,0x028,%g1
	stda	%f14,[%g1+%l7]ASI_PST32_P ! Mem[0000000010001428] = 0000000000000000
!	Mem[0000000020800001] = ffffca09, %l0 = 0000000000000000
	ldstuba	[%o1+0x001]%asi,%l0	! %l0 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[0000000010181414] = 000000ff
	sth	%l0,[%i6+0x014]		! Mem[0000000010181414] = 00ff00ff
!	%l6 = 0000000000000048, Mem[0000000010141408] = ff007eff
	stha	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = ff000048
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 000000ff, %l7 = 0000000000000000
	ldsba	[%i0+%o4]0x89,%l7	! %l7 = ffffffffffffffff

p0_label_121:
!	Mem[0000000010041408] = 00005effffffd9ff, %f2  = 00000000 00000000
	ldda	[%i1+%o4]0x88,%f2 	! %f2  = 00005eff ffffd9ff
!	Mem[00000000100c1410] = fa000000, %l0 = 00000000000000ff
	lduwa	[%i3+%o5]0x80,%l0	! %l0 = 00000000fa000000
!	Mem[0000000030041400] = 50000000, %l5 = 000000003ee3dc41
	ldswa	[%i1+%g0]0x89,%l5	! %l5 = 0000000050000000
!	Mem[0000000030081410] = 00000000, %l5 = 0000000050000000
	ldswa	[%i2+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041410] = 0000000000005b00, %l1 = 0000000000000021
	ldxa	[%i1+%o5]0x80,%l1	! %l1 = 0000000000005b00
!	Mem[0000000010041410] = 00000000, %f10 = ffffff00
	lda	[%i1+%o5]0x88,%f10	! %f10 = 00000000
!	Mem[00000000300c1400] = 00000000, %l5 = 0000000000000000
	lduba	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1400] = ffffffff, %l1 = 0000000000005b00
	lduha	[%i3+%g0]0x80,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010001410] = 21081c6c, %l2 = 00000000000000ff
	lduha	[%i0+%o5]0x80,%l2	! %l2 = 0000000000002108
!	Starting 10 instruction Store Burst
!	Mem[000000001010140f] = ff7e00ff, %l5 = 0000000000000000
	ldstuba	[%i4+0x00f]%asi,%l5	! %l5 = 000000ff000000ff

p0_label_122:
	membar	#Sync			! Added by membar checker (17)
!	%l2 = 0000000000002108, Mem[00000000300c1410] = f2b282f256e14f18
	stxa	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000000000002108
!	%l5 = 00000000000000ff, Mem[0000000010141400] = d9000000
	stwa	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000ff
!	%f6  = ff5b7300 00001c6c, Mem[0000000010041410] = 00000000 005b0000
	stda	%f6 ,[%i1+%o5]0x88	! Mem[0000000010041410] = ff5b7300 00001c6c
!	Mem[00000000218000c0] = 7efff483, %l4 = 000000000000ffff
	ldstuba	[%o3+0x0c0]%asi,%l4	! %l4 = 0000007e000000ff
!	%l0 = 00000000fa000000, Mem[0000000030041400] = 50000000
	stba	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 50000000
!	Mem[00000000100c1434] = 353b7eea, %l7 = ffffffffffffffff
	swap	[%i3+0x034],%l7		! %l7 = 00000000353b7eea
!	%l2 = 0000000000002108, Mem[0000000021800180] = 00006058, %asi = 80
	stha	%l2,[%o3+0x180]%asi	! Mem[0000000021800180] = 21086058
!	%l2 = 0000000000002108, Mem[0000000030001408] = 000000ff
	stba	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000008
!	%l1 = 000000000000ffff, Mem[0000000030101400] = ff003148
	stha	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = ffff3148
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff7e00ff, %l0 = 00000000fa000000
	lduwa	[%i2+%g0]0x80,%l0	! %l0 = 00000000ff7e00ff

p0_label_123:
!	Mem[0000000010101410] = 00000000eaffffff, %l7 = 00000000353b7eea
	ldxa	[%i4+%o5]0x80,%l7	! %l7 = 00000000eaffffff
!	Mem[0000000030001400] = ff342ed0, %l6 = 0000000000000048
	ldsha	[%i0+%g0]0x81,%l6	! %l6 = ffffffffffffff34
!	Mem[00000000300c1400] = 00000000, %f31 = c100e9ff
	lda	[%i3+%g0]0x81,%f31	! %f31 = 00000000
!	Code Fragment 4
p0_fragment_2:
!	%l0 = 00000000ff7e00ff
	setx	0x40ada49fe687dae6,%g7,%l0 ! %l0 = 40ada49fe687dae6
!	%l1 = 000000000000ffff
	setx	0x4585423fbd6f303c,%g7,%l1 ! %l1 = 4585423fbd6f303c
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 40ada49fe687dae6
	setx	0x7e4b9ed86f69bd3c,%g7,%l0 ! %l0 = 7e4b9ed86f69bd3c
!	%l1 = 4585423fbd6f303c
	setx	0x7f980d2818bcc444,%g7,%l1 ! %l1 = 7f980d2818bcc444
!	Mem[000000001018141c] = 55a6359c, %f5  = fd000000
	lda	[%i6+0x01c]%asi,%f5 	! %f5 = 55a6359c
!	Mem[0000000030001408] = ff00000000000008, %l4 = 000000000000007e
	ldxa	[%i0+%o4]0x89,%l4	! %l4 = ff00000000000008
!	Mem[0000000010041400] = 41dc000000000000, %l4 = ff00000000000008
	ldxa	[%i1+%g0]0x80,%l4	! %l4 = 41dc000000000000
!	Mem[0000000010141400] = 000000ff, %f20 = 184fe156
	lda	[%i5+%g0]0x80,%f20	! %f20 = 000000ff
!	Mem[0000000010041400] = 41dc0000, %l4 = 41dc000000000000
	lduha	[%i1+%g0]0x80,%l4	! %l4 = 00000000000041dc
!	Starting 10 instruction Store Burst
!	%l6 = ffffff34, %l7 = eaffffff, Mem[0000000030181410] = ffffff00 d1d690ff
	stda	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffff34 eaffffff

p0_label_124:
!	Mem[00000000100c1438] = f1d308f3, %l2 = 00002108, %l7 = eaffffff
	add	%i3,0x38,%g1
	casa	[%g1]0x80,%l2,%l7	! %l7 = 00000000f1d308f3
!	Mem[0000000030081408] = 00735bff, %l4 = 00000000000041dc
	ldstuba	[%i2+%o4]0x89,%l4	! %l4 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000030141400] = d1d690ff
	stha	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 00ff90ff
!	Mem[0000000010001410] = 21081c6c, %l6 = ffffffffffffff34
	swapa	[%i0+%o5]0x80,%l6	! %l6 = 0000000021081c6c
!	Mem[0000000010041400] = 41dc0000, %l7 = 00000000f1d308f3
	ldstuba	[%i1+%g0]0x80,%l7	! %l7 = 00000041000000ff
!	Mem[0000000010141400] = 000000ff, %l5 = 00000000000000ff
	swapa	[%i5+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%l0 = 6f69bd3c, %l1 = 18bcc444, Mem[0000000010081408] = 00000000 ca3195ab
	stda	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 6f69bd3c 18bcc444
!	Mem[0000000010081410] = ff8eecff, %l2 = 0000000000002108
	ldstuba	[%i2+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	%f16 = 00000000 00000000, Mem[00000000100c1400] = ffffffff ffffffea
	stda	%f16,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ff00095a, %l3 = 000000001804043b
	lduba	[%o1+0x041]%asi,%l3	! %l3 = 0000000000000000

p0_label_125:
!	Randomly selected nop
	nop
!	Mem[0000000030141408] = ff000000, %l2 = 00000000000000ff
	lduwa	[%i5+%o4]0x89,%l2	! %l2 = 00000000ff000000
!	Mem[00000000201c0000] = 00007e52, %l5 = 00000000000000ff
	ldsb	[%o0+%g0],%l5		! %l5 = 0000000000000000
!	Mem[00000000100c1410] = fa000000, %f7  = 00001c6c
	lda	[%i3+%o5]0x80,%f7 	! %f7 = fa000000
!	Mem[0000000010181438] = ff5a66fe, %l1 = 7f980d2818bcc444
	ldub	[%i6+0x038],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030101410] = 0000000000000048, %f0  = ffb282f2 00735b41
	ldda	[%i4+%o5]0x89,%f0 	! %f0  = 00000000 00000048
!	Mem[0000000030141400] = 00ff90ff, %l1 = 00000000000000ff
	lduwa	[%i5+%g0]0x81,%l1	! %l1 = 0000000000ff90ff
!	Mem[0000000010041408] = ffd9ffff, %l2 = 00000000ff000000
	ldsba	[%i1+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010041418] = 00000000, %l3 = 0000000000000000
	lduw	[%i1+0x018],%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = 353b7eea, %l2 = ffffffffffffffff
	ldstuba	[%i6+%o4]0x89,%l2	! %l2 = 000000ea000000ff

p0_label_126:
!	%l0 = 7e4b9ed86f69bd3c, Mem[0000000010141420] = 41d24e96d494e1ff, %asi = 80
	stxa	%l0,[%i5+0x020]%asi	! Mem[0000000010141420] = 7e4b9ed86f69bd3c
!	%l2 = 00000000000000ea, Mem[0000000030101408] = 00005a00
	stba	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 00005aea
!	%f18 = 0000000f 000000ab, Mem[0000000010141400] = 000000ff fa000000
	stda	%f18,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000000f 000000ab
!	%l2 = 00000000000000ea, Mem[00000000100c1408] = 55a6359c
	stba	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 55a635ea
!	%l5 = 0000000000000000, Mem[0000000010101408] = 00000000
	stba	%l5,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	%l0 = 7e4b9ed86f69bd3c, Mem[000000001018142e] = fe813cbc, %asi = 80
	stha	%l0,[%i6+0x02e]%asi	! Mem[000000001018142c] = fe81bd3c
!	Mem[0000000010101410] = 00000000, %l1 = 0000000000ff90ff
	swapa	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l0 = 7e4b9ed86f69bd3c
	ldstuba	[%i3+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141400] = 0000000f, %l4 = 00000000000000ff
	swapa	[%i5+%g0]0x80,%l4	! %l4 = 000000000000000f
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff90ff00, %l1 = 0000000000000000
	lduba	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000000

p0_label_127:
!	Mem[00000000300c1400] = 00000000, %f23 = 5edd8e9d
	lda	[%i3+%g0]0x89,%f23	! %f23 = 00000000
!	Mem[0000000030181410] = 34ffffff, %f19 = 000000ab
	lda	[%i6+%o5]0x89,%f19	! %f19 = 34ffffff
!	Mem[00000000300c1408] = 0f000000, %l6 = 0000000021081c6c
	lduba	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[000000001018142c] = fe81bd3c, %l2 = 00000000000000ea, %asi = 80
	swapa	[%i6+0x02c]%asi,%l2	! %l2 = 00000000fe81bd3c
!	Mem[0000000010001410] = 34ffffff, %l6 = 0000000000000000
	lduwa	[%i0+%o5]0x88,%l6	! %l6 = 0000000034ffffff
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010001400] = fffffa00 4f000000 ffff7300 000013a1
!	Mem[0000000010001410] = ffffff34 45a78c73 75f01295 2cafd500
!	Mem[0000000010001420] = 00000050 22000000 00000000 00000000
!	Mem[0000000010001430] = 00003148 13bc0b50 00000000 00000000
	ldda	[%i0]ASI_BLK_PL,%f16	! Block Load from 0000000010001400
!	Mem[00000000300c1410] = 0821000000000000, %l0 = 0000000000000000
	ldxa	[%i3+%o5]0x81,%l0	! %l0 = 0821000000000000
!	Mem[0000000010001400] = fffffa00, %f10 = 00000000
	lda	[%i0+%g0]0x80,%f10	! %f10 = fffffa00
!	Mem[000000001018143c] = ffac2efd, %l0 = 0821000000000000
	lduwa	[%i6+0x03c]%asi,%l0	! %l0 = 00000000ffac2efd
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 00ff90ff, %l6 = 0000000034ffffff
	swapa	[%i5+%g0]0x81,%l6	! %l6 = 0000000000ff90ff

p0_label_128:
!	Mem[0000000010081400] = ff007eff, %l3 = 0000000000000000
	swapa	[%i2+%g0]0x88,%l3	! %l3 = 00000000ff007eff
!	%f9  = 000000ab, Mem[0000000010141410] = ff000000
	sta	%f9 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000ab
!	%l7 = 0000000000000041, Mem[0000000010141408] = 480000ff, %asi = 80
	stwa	%l7,[%i5+0x008]%asi	! Mem[0000000010141408] = 00000041
!	Mem[0000000030041400] = 50000000, %l3 = 00000000ff007eff
	swapa	[%i1+%g0]0x89,%l3	! %l3 = 0000000050000000
!	Mem[0000000030041410] = 00000055, %l4 = 000000000000000f
	ldstuba	[%i1+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%l3 = 0000000050000000, Mem[0000000010041410] = 6c1c0000
	stba	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 001c0000
!	%l5 = 0000000000000000, Mem[0000000030141408] = 000000ff
	stha	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000ff
!	Mem[0000000010181400] = ffff0000, %l1 = 0000000000000000, %asi = 80
	swapa	[%i6+0x000]%asi,%l1	! %l1 = 00000000ffff0000
!	%l0 = ffac2efd, %l1 = ffff0000, Mem[0000000010041410] = 001c0000 00735bff
	stda	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = ffac2efd ffff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ffd9ffff, %l6 = 0000000000ff90ff
	ldsha	[%i1+%o4]0x80,%l6	! %l6 = ffffffffffffffd9

p0_label_129:
!	Mem[0000000010041410] = 0000fffffd2eacff, %l3 = 0000000050000000
	ldxa	[%i1+%o5]0x88,%l3	! %l3 = 0000fffffd2eacff
!	Mem[00000000300c1408] = 0000000f, %l4 = 0000000000000000
	ldswa	[%i3+%o4]0x81,%l4	! %l4 = 000000000000000f
!	Mem[0000000010081410] = ff8eecff, %l0 = 00000000ffac2efd
	ldswa	[%i2+%o5]0x80,%l0	! %l0 = ffffffffff8eecff
!	Mem[0000000030081408] = ff5b7300, %l2 = 00000000fe81bd3c
	lduwa	[%i2+%o4]0x81,%l2	! %l2 = 00000000ff5b7300
!	Mem[0000000030181410] = ffffff34, %l2 = 00000000ff5b7300
	ldswa	[%i6+%o5]0x81,%l2	! %l2 = ffffffffffffff34
!	Mem[00000000300c1400] = 00000000, %l3 = 0000fffffd2eacff
	lduwa	[%i3+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l2 = ffffffffffffff34
	lduw	[%i2+%g0],%l2		! %l2 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %l6 = ffffffffffffffd9
	ldsha	[%i4+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1408] = ea35a655 00003148, %l4 = 0000000f, %l5 = 00000000
	ldd	[%i3+%o4],%l4		! %l4 = 00000000ea35a655 0000000000003148
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000003148, Mem[000000001008142c] = ffacbc60
	stb	%l5,[%i2+0x02c]		! Mem[000000001008142c] = 48acbc60

p0_label_130:
!	%f3  = ffffd9ff, Mem[0000000010141408] = 41000000
	sta	%f3 ,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffd9ff
!	%l4 = 00000000ea35a655, Mem[0000000010041408] = ffd9ffffff5e0000
	stxa	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000ea35a655
!	%l0 = ffffffffff8eecff, Mem[000000001014141a] = 5effe519, %asi = 80
	stba	%l0,[%i5+0x01a]%asi	! Mem[0000000010141418] = 5effff19
!	Mem[0000000010101408] = 00000000, %l1 = 00000000ffff0000
	swap	[%i4+%o4],%l1		! %l1 = 0000000000000000
!	%l7 = 0000000000000041, Mem[00000000300c1400] = 00000000
	stba	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = 41000000
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030181408] = ff7e3b35 d7560fbe
	stda	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000 00000000
!	%l2 = 0000000000000000, Mem[0000000030101400] = ffff314813bc0b50
	stxa	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000000000
!	%f0  = 00000000 00000048, Mem[0000000030081410] = 00000000 00000019
	stda	%f0 ,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000 00000048
!	%l7 = 0000000000000041, Mem[0000000010081410] = a3000000ffec8eff
	stxa	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000000000000041
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000000, %l6 = 0000000000000000
	ldswa	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000000

p0_label_131:
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000030081400] = 00000000 0000005a ff5b7300 f9951bcb
!	Mem[0000000030081410] = 48000000 00000000 e546fc98 6e0000ff
!	Mem[0000000030081420] = ad87309c 9c35a6ff 21081c6c 3b040418
!	Mem[0000000030081430] = ffe900c1 ca3195ab 9650fa58 f282b2f2
	ldda	[%i2]ASI_BLK_AIUS,%f0	! Block Load from 0000000030081400
!	Mem[0000000010041408] = 00000000, %l1 = 0000000000000000
	ldswa	[%i1+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = 000000fa, %l2 = 0000000000000000
	ldsha	[%i3+%o5]0x88,%l2	! %l2 = 00000000000000fa
!	Mem[0000000010081410] = 00000041, %l6 = 0000000000000000
	lduba	[%i2+%o5]0x88,%l6	! %l6 = 0000000000000041
!	Mem[00000000100c1414] = 00000000, %l5 = 0000000000003148
	lduh	[%i3+0x016],%l5		! %l5 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l2 = 00000000000000fa
	lduba	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1408] = 55a635ea, %l0 = ffffffffff8eecff
	lduwa	[%i3+%o4]0x88,%l0	! %l0 = 0000000055a635ea
!	Mem[0000000030081410] = 48000000, %l1 = 0000000000000000
	ldswa	[%i2+%o5]0x81,%l1	! %l1 = 0000000048000000
!	Mem[0000000030001410] = ff007eff, %l3 = 0000000000000000
	ldswa	[%i0+%o5]0x81,%l3	! %l3 = ffffffffff007eff
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (20)
!	%l6 = 0000000000000041, Mem[0000000030081410] = 4800000000000000
	stxa	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000000000000041

p0_label_132:
!	%l6 = 0000000000000041, Mem[0000000030041410] = ff000055
	stba	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 41000055
!	%l0 = 0000000055a635ea, Mem[00000000211c0000] = ffff1327, %asi = 80
	stha	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = 35ea1327
!	%l2 = 0000000000000000, Mem[0000000030181408] = 00000000
	stba	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	Mem[0000000010041434] = 1804043b, %l1 = 0000000048000000
	swap	[%i1+0x034],%l1		! %l1 = 000000001804043b
!	%l5 = 0000000000000000, Mem[00000000300c1410] = 0000000000002108
	stxa	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l5 = 00000000, %l5 = 00000000
	add	%i1,0x08,%g1
	casa	[%g1]0x80,%l5,%l5	! %l5 = 0000000000000000
!	%l6 = 00000041, %l7 = 00000041, Mem[0000000030041408] = 00000000 00000048
	stda	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000041 00000041
!	%f9  = 9c35a6ff, Mem[0000000030141410] = 000000ab
	sta	%f9 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 9c35a6ff
!	%l2 = 0000000000000000, Mem[0000000010001408] = a11300000073ffff
	stxa	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[000000001014143c] = c733f359, %l2 = 0000000000000000
	ldsh	[%i5+0x03e],%l2		! %l2 = fffffffffffff359

p0_label_133:
!	Mem[0000000010181400] = 00000000, %f11 = 3b040418
	lda	[%i6+%g0]0x80,%f11	! %f11 = 00000000
!	Mem[0000000010181408] = 00000000, %l5 = 0000000000000000
	lduba	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141404] = 000000ab, %l0 = 0000000055a635ea
	ldswa	[%i5+0x004]%asi,%l0	! %l0 = 00000000000000ab
!	Mem[0000000010181428] = 964ed241, %l5 = 0000000000000000
	lduw	[%i6+0x028],%l5		! %l5 = 00000000964ed241
!	Mem[0000000010041414] = ffff0000, %l7 = 0000000000000041
	ldsba	[%i1+0x016]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001400] = ff342ed0, %l2 = fffffffffffff359
	ldswa	[%i0+%g0]0x81,%l2	! %l2 = ffffffffff342ed0
!	Mem[0000000010001408] = 00000000 00000000, %l6 = 00000041, %l7 = 00000000
	ldda	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010001418] = 75f012952cafd500, %l6 = 0000000000000000
	ldxa	[%i0+0x018]%asi,%l6	! %l6 = 75f012952cafd500
!	Mem[0000000010001400] = fffffa004f000000, %f12 = ffe900c1 ca3195ab
	ldda	[%i0+%g0]0x80,%f12	! %f12 = fffffa00 4f000000
!	Starting 10 instruction Store Burst
!	%l5 = 00000000964ed241, Mem[0000000010181400] = 3b04041800000000
	stxa	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000964ed241

p0_label_134:
!	%l0 = 00000000000000ab, Mem[0000000030081408] = 00735bff
	stwa	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000ab
!	%l0 = 00000000000000ab, Mem[0000000010141410] = ab000000
	stha	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = ab0000ab
!	%l1 = 000000001804043b, Mem[0000000010001410] = 34ffffff
	stba	%l1,[%i0+%o5]0x88	! Mem[0000000010001410] = 34ffff3b
!	Mem[00000000100c1400] = 000000ff, %l2 = ffffffffff342ed0
	ldstuba	[%i3+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	%l6 = 75f012952cafd500, Mem[0000000030081410] = 00000000
	stba	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	%f6  = e546fc98 6e0000ff, Mem[0000000030041400] = ff007eff 00000022
	stda	%f6 ,[%i1+%g0]0x89	! Mem[0000000030041400] = e546fc98 6e0000ff
!	%f8  = ad87309c, Mem[0000000010141410] = ab0000ab
	sta	%f8 ,[%i5+%o5]0x88	! Mem[0000000010141410] = ad87309c
!	%l6 = 75f012952cafd500, Mem[00000000300c1408] = 0000000f
	stba	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000f
!	Mem[0000000010101400] = ff007eff, %l2 = 00000000000000ff
	ldstuba	[%i4+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff007eff, %l5 = 00000000964ed241
	ldswa	[%i0+%o5]0x81,%l5	! %l5 = ffffffffff007eff

p0_label_135:
!	Mem[0000000010101420] = 2108b408, %l4 = 00000000ea35a655
	lduwa	[%i4+0x020]%asi,%l4	! %l4 = 000000002108b408
!	Mem[0000000010181410] = 00000000, %l7 = 0000000000000000
	lduwa	[%i6+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001424] = 22000000, %l4 = 000000002108b408
	lduw	[%i0+0x024],%l4		! %l4 = 0000000022000000
!	Mem[0000000021800180] = 21086058, %l6 = 75f012952cafd500
	ldsh	[%o3+0x180],%l6		! %l6 = 0000000000002108
!	Mem[0000000010181400] = 41d24e96, %l6 = 0000000000002108
	ldsha	[%i6+%g0]0x80,%l6	! %l6 = 00000000000041d2
!	Mem[00000000100c1400] = ff000000, %f23 = 9512f075
	lda	[%i3+%g0]0x80,%f23	! %f23 = ff000000
!	Mem[0000000030101410] = 48000000, %l3 = ffffffffff007eff
	lduwa	[%i4+%o5]0x81,%l3	! %l3 = 0000000048000000
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000030041400] = ff00006e 98fc46e5 00000041 00000041
!	Mem[0000000030041410] = 41000055 41dce33e c22c71c6 b0c7cf8a
!	Mem[0000000030041420] = 6c437800 0e340020 7eafd2b7 bb110ed7
!	Mem[0000000030041430] = adcb22a4 a208773c 00000000 00000000
	ldda	[%i1]ASI_BLK_S,%f16	! Block Load from 0000000030041400
!	Mem[0000000010081410] = 00000041, %l1 = 000000001804043b
	lduba	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000041
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 9c35a6ff, %l4 = 0000000022000000
	swapa	[%i5+%o5]0x81,%l4	! %l4 = 000000009c35a6ff

p0_label_136:
!	%f12 = fffffa00 4f000000, Mem[0000000030001410] = ff7e00ff 00000000
	stda	%f12,[%i0+%o5]0x89	! Mem[0000000030001410] = fffffa00 4f000000
!	%l0 = 000000ab, %l1 = 00000041, Mem[0000000030101408] = ea5a0000 00000000
	stda	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ab 00000041
!	%l4 = 000000009c35a6ff, Mem[0000000010181400] = 964ed241
	stwa	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 9c35a6ff
!	Mem[0000000010181400] = ffa6359c, %l6 = 00000000000041d2
	lduwa	[%i6+%g0]0x80,%l6	! %l6 = 00000000ffa6359c
!	%l2 = 00000000000000ff, Mem[0000000010001428] = 0000000000000000
	stx	%l2,[%i0+0x028]		! Mem[0000000010001428] = 00000000000000ff
!	%f0  = 00000000, Mem[0000000010101408] = 0000ffff
	sta	%f0 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	Mem[00000000201c0001] = 00007e52, %l5 = ffffffffff007eff
	ldstuba	[%o0+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000030001400] = 00000000d02e34ff
	stxa	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000000000ff
!	Mem[0000000010001400] = 00faffff, %l7 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081418] = 00000000, %l1 = 0000000000000041
	ldub	[%i2+0x019],%l1		! %l1 = 0000000000000000

p0_label_137:
!	Mem[0000000030101410] = 48000000, %l1 = 0000000000000000
	lduba	[%i4+%o5]0x81,%l1	! %l1 = 0000000000000048
!	Mem[0000000030141400] = 00000022 ffffff34, %l0 = 000000ab, %l1 = 00000048
	ldda	[%i5+%g0]0x89,%l0	! %l0 = 00000000ffffff34 0000000000000022
!	Mem[0000000030181400] = 480000ff, %l6 = 00000000ffa6359c
	ldswa	[%i6+%g0]0x89,%l6	! %l6 = 00000000480000ff
!	Mem[0000000030101400] = 00000000 00000000, %l4 = 9c35a6ff, %l5 = 00000000
	ldda	[%i4+%g0]0x81,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010081400] = 00000000, %l2 = 00000000000000ff
	lduwa	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Code Fragment 3
p0_fragment_3:
!	%l0 = 00000000ffffff34
	setx	0x66eb7f0061c7e6fc,%g7,%l0 ! %l0 = 66eb7f0061c7e6fc
!	%l1 = 0000000000000022
	setx	0xee1aa02804ce082e,%g7,%l1 ! %l1 = ee1aa02804ce082e
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 66eb7f0061c7e6fc
	setx	0x6b7f24b82077d7c8,%g7,%l0 ! %l0 = 6b7f24b82077d7c8
!	%l1 = ee1aa02804ce082e
	setx	0x00d4d687d33d02c6,%g7,%l1 ! %l1 = 00d4d687d33d02c6
!	Mem[00000000218001c0] = 19eabc74, %l7 = 00000000000000ff
	lduha	[%o3+0x1c0]%asi,%l7	! %l7 = 00000000000019ea
!	Mem[0000000030181408] = 00000000, %l3 = 0000000048000000
	lduha	[%i6+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081408] = 3cbd696f, %l0 = 6b7f24b82077d7c8
	ldsha	[%i2+%o4]0x88,%l0	! %l0 = 000000000000696f
!	Starting 10 instruction Store Burst
!	%f12 = fffffa00, Mem[00000000100c1408] = ea35a655
	sta	%f12,[%i3+%o4]0x80	! Mem[00000000100c1408] = fffffa00

p0_label_138:
!	%f8  = ad87309c 9c35a6ff, Mem[0000000030081410] = 00000000 41000000
	stda	%f8 ,[%i2+%o5]0x89	! Mem[0000000030081410] = ad87309c 9c35a6ff
!	%l7 = 00000000000019ea, Mem[0000000010101410] = ff90ff00
	stba	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = ff90ffea
!	Mem[0000000030001400] = 000000ff, %l3 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%f0  = 00000000 0000005a ff5b7300 f9951bcb
!	%f4  = 48000000 00000000 e546fc98 6e0000ff
!	%f8  = ad87309c 9c35a6ff 21081c6c 00000000
!	%f12 = fffffa00 4f000000 9650fa58 f282b2f2
	stda	%f0,[%i2]ASI_COMMIT_P	! Block Store to 0000000010081400
!	%f16 = ff00006e 98fc46e5, Mem[0000000030101408] = 000000ab 00000041
	stda	%f16,[%i4+%o4]0x81	! Mem[0000000030101408] = ff00006e 98fc46e5
!	Mem[00000000201c0000] = 00ff7e52, %l3 = 00000000000000ff
	ldstub	[%o0+%g0],%l3		! %l3 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000010001400] = 00faffff
	stba	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 00faff00
!	%l2 = 0000000000000000, Mem[00000000100c1400] = 000000ff
	stha	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	%f30 = 00000000 00000000, Mem[0000000030141400] = ffffff34 00000022
	stda	%f30,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 0000000f, %l2 = 0000000000000000
	lduha	[%i3+%o4]0x81,%l2	! %l2 = 0000000000000000

p0_label_139:
!	Mem[0000000030041410] = 55000041, %l3 = 0000000000000000
	ldswa	[%i1+%o5]0x89,%l3	! %l3 = 0000000055000041
!	Mem[00000000300c1410] = 00000000, %l1 = 00d4d687d33d02c6
	ldsha	[%i3+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181400] = ff000048, %l2 = 0000000000000000
	ldswa	[%i6+%g0]0x81,%l2	! %l2 = ffffffffff000048
!	Mem[0000000030001408] = 08000000, %l3 = 0000000055000041
	ldswa	[%i0+%o4]0x81,%l3	! %l3 = 0000000008000000
!	Mem[0000000030001400] = 00000000, %l7 = 00000000000019ea
	lduha	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181410] = ffffff34, %f29 = a208773c
	lda	[%i6+%o5]0x81,%f29	! %f29 = ffffff34
!	Mem[0000000030181410] = ffffff34eaffffff, %f26 = 7eafd2b7 bb110ed7
	ldda	[%i6+%o5]0x81,%f26	! %f26 = ffffff34 eaffffff
!	Mem[00000000201c0000] = ffff7e52, %l4 = 0000000000000000
	lduba	[%o0+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041400] = ffdc0000, %l7 = 0000000000000000
	lduba	[%i1+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000020800041] = ff00095a, %l5 = 0000000000000000
	ldstub	[%o1+0x041],%l5		! %l5 = 00000000000000ff

p0_label_140:
!	%l6 = 00000000480000ff, Mem[0000000020800000] = ffffca09
	sth	%l6,[%o1+%g0]		! Mem[0000000020800000] = 00ffca09
!	%f16 = ff00006e 98fc46e5, Mem[0000000030081408] = 000000ab cb1b95f9
	stda	%f16,[%i2+%o4]0x89	! Mem[0000000030081408] = ff00006e 98fc46e5
	membar	#Sync			! Added by membar checker (22)
!	%l5 = 0000000000000000, Mem[0000000010081410] = 48000000
	stba	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	Mem[0000000010141430] = 000000fa, %l4 = 00000000000000ff
	swap	[%i5+0x030],%l4		! %l4 = 00000000000000fa
!	%f11 = 00000000, Mem[0000000010101410] = eaff90ff
	sta	%f11,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	%f8  = ad87309c 9c35a6ff, Mem[0000000030081400] = 00000000 0000005a
	stda	%f8 ,[%i2+%g0]0x81	! Mem[0000000030081400] = ad87309c 9c35a6ff
!	%f30 = 00000000 00000000, Mem[00000000100c1410] = fa000000 00000000
	stda	%f30,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000 00000000
!	%l6 = 00000000480000ff, Mem[0000000010001404] = 4f000000, %asi = 80
	stha	%l6,[%i0+0x004]%asi	! Mem[0000000010001404] = 00ff0000
!	%l7 = 00000000000000ff, Mem[0000000030101408] = e546fc986e0000ff
	stxa	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 00000000, %l6 = 00000000480000ff
	lduha	[%i2+%o5]0x80,%l6	! %l6 = 0000000000000000

p0_label_141:
!	Mem[0000000010041408] = 00000000, %l3 = 0000000008000000
	ldsba	[%i1+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = 00000000 00000000, %l4 = 000000fa, %l5 = 00000000
	ldda	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010001418] = 75f01295, %l2 = ffffffffff000048
	ldswa	[%i0+0x018]%asi,%l2	! %l2 = 0000000075f01295
!	Mem[0000000021800080] = ffffbc25, %l5 = 0000000000000000
	ldsha	[%o3+0x080]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030001410] = 4f000000, %l5 = ffffffffffffffff
	lduba	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c143c] = 355d6f3b, %l3 = 0000000000000000
	lduba	[%i3+0x03f]%asi,%l3	! %l3 = 000000000000003b
!	Mem[0000000010081438] = 9650fa58, %l7 = 00000000000000ff
	ldsh	[%i2+0x03a],%l7		! %l7 = fffffffffffffa58
!	Mem[00000000100c1408] = 00faffff, %f26 = ffffff34
	lda	[%i3+%o4]0x88,%f26	! %f26 = 00faffff
!	Mem[0000000030081400] = ad87309c9c35a6ff, %f18 = 00000041 00000041
	ldda	[%i2+%g0]0x81,%f18	! %f18 = ad87309c 9c35a6ff
!	Starting 10 instruction Store Burst
!	%f16 = ff00006e 98fc46e5, Mem[0000000030001400] = 00000000 00000000
	stda	%f16,[%i0+%g0]0x89	! Mem[0000000030001400] = ff00006e 98fc46e5

p0_label_142:
!	%l5 = 0000000000000000, Mem[0000000030001410] = 0000004f
	stwa	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	%l4 = 0000000000000000, Mem[0000000010041438] = 5ebd0000e1641555, %asi = 80
	stxa	%l4,[%i1+0x038]%asi	! Mem[0000000010041438] = 0000000000000000
!	Mem[0000000010081408] = ff5b7300, %l0 = 000000000000696f
	ldstuba	[%i2+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010041420] = 8eff8f5f1804043b, %l0 = 00000000000000ff, %l7 = fffffffffffffa58
	add	%i1,0x20,%g1
	casxa	[%g1]0x80,%l0,%l7	! %l7 = 8eff8f5f1804043b
!	Mem[0000000030101410] = 48000000, %l1 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l1	! %l1 = 00000048000000ff
!	%l5 = 0000000000000000, Mem[0000000030141410] = 00000022
	stwa	%l5,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010081408] = 00735bff cb1b95f9
	stda	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000 00000000
!	%l4 = 0000000000000000, Mem[00000000201c0001] = ffff7e52, %asi = 80
	stba	%l4,[%o0+0x001]%asi	! Mem[00000000201c0000] = ff007e52
!	%f16 = ff00006e 98fc46e5 ad87309c 9c35a6ff
!	%f20 = 41000055 41dce33e c22c71c6 b0c7cf8a
!	%f24 = 6c437800 0e340020 00faffff eaffffff
!	%f28 = adcb22a4 ffffff34 00000000 00000000
	stda	%f16,[%i6]ASI_COMMIT_S	! Block Store to 0000000030181400
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000030181408] = 9c3087ad, %l0 = 00000000000000ff
	ldswa	[%i6+%o4]0x89,%l0	! %l0 = ffffffff9c3087ad

p0_label_143:
!	Mem[0000000010081410] = 0000000000000000, %f22 = c22c71c6 b0c7cf8a
	ldda	[%i2+%o5]0x88,%f22	! %f22 = 00000000 00000000
!	Mem[0000000030081410] = ffa6359c, %l4 = 0000000000000000
	ldswa	[%i2+%o5]0x81,%l4	! %l4 = ffffffffffa6359c
!	Mem[00000000211c0000] = 35ea1327, %l5 = 0000000000000000
	ldsba	[%o2+0x001]%asi,%l5	! %l5 = ffffffffffffffea
!	Mem[0000000030181408] = ad87309c9c35a6ff, %l3 = 000000000000003b
	ldxa	[%i6+%o4]0x81,%l3	! %l3 = ad87309c9c35a6ff
!	Mem[0000000010001400] = 00faff00, %l1 = 0000000000000048
	ldswa	[%i0+%g0]0x88,%l1	! %l1 = 0000000000faff00
!	Mem[0000000010101404] = 00000000, %l0 = ffffffff9c3087ad
	ldsh	[%i4+0x006],%l0		! %l0 = 0000000000000000
!	Mem[0000000010181400] = 9c35a6ff, %l6 = 0000000000000000
	ldswa	[%i6+%g0]0x88,%l6	! %l6 = ffffffff9c35a6ff
!	Mem[0000000010141400] = 000000ff 000000ab ffd9ffff 5e000000
!	Mem[0000000010141410] = 9c3087ad 00000000 5effff19 fffff700
!	Mem[0000000010141420] = 7e4b9ed8 6f69bd3c 00735b41 e10bde60
!	Mem[0000000010141430] = 000000ff ffff0000 ffffffff c733f359
	ldda	[%i5]ASI_BLK_P,%f16	! Block Load from 0000000010141400
!	Mem[0000000030001410] = 00000000, %l7 = 8eff8f5f1804043b
	lduha	[%i0+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 000000ff, %l3 = ad87309c9c35a6ff
	swapa	[%i4+%o5]0x89,%l3	! %l3 = 00000000000000ff

p0_label_144:
!	%l3 = 00000000000000ff, Mem[00000000300c1410] = 0000000000000000
	stxa	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000030101400] = 0000000000000000
	stxa	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000030181400] = e546fc986e0000ff
	stxa	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000000000000000
!	%f6  = e546fc98 6e0000ff, %l0 = 0000000000000000
!	Mem[0000000030001430] = 2bd71cbc9dc1869c
	add	%i0,0x030,%g1
	stda	%f6,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030001430] = 2bd71cbc9dc1869c
!	%l3 = 00000000000000ff, Mem[0000000010181400] = ffa6359c
	stwa	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000ff
!	%f0  = 00000000 0000005a, Mem[0000000010081408] = 00000000 00000000
	stda	%f0 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000 0000005a
!	%l0 = 0000000000000000, Mem[00000000100c1410] = 00000000
	stha	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	%l5 = ffffffffffffffea, Mem[0000000030101408] = 000000ff
	stba	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000ea
!	Mem[0000000030181410] = 41000055, %l1 = 0000000000faff00
	ldstuba	[%i6+%o5]0x81,%l1	! %l1 = 00000041000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000030001400] = e546fc98 6e0000ff 08000000 000000ff
!	Mem[0000000030001410] = 00000000 00faffff 814f8833 e255b5f4
!	Mem[0000000030001420] = 40577e51 ff00006e a6568bbe 7e80b946
!	Mem[0000000030001430] = 2bd71cbc 9dc1869c 500bbc13 5eb92bab
	ldda	[%i0]ASI_BLK_AIUS,%f16	! Block Load from 0000000030001400

p0_label_145:
!	Mem[0000000010001408] = 00000000, %l3 = 00000000000000ff
	lduba	[%i0+0x008]%asi,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = 35ea1327, %l4 = ffffffffffa6359c
	ldsba	[%o2+0x000]%asi,%l4	! %l4 = 0000000000000035
!	Mem[0000000010101410] = 00000000eaffffff, %l1 = 0000000000000041
	ldxa	[%i4+%o5]0x80,%l1	! %l1 = 00000000eaffffff
!	Mem[00000000300c1400] = 00000000 00000041, %l2 = 75f01295, %l3 = 00000000
	ldda	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000041 0000000000000000
!	Mem[0000000010041430] = 8eff8f5f, %l0 = 0000000000000000
	lduh	[%i1+0x030],%l0		! %l0 = 0000000000008eff
!	Mem[0000000010141420] = 7e4b9ed8, %l3 = 0000000000000000
	ldub	[%i5+0x021],%l3		! %l3 = 000000000000004b
!	Mem[0000000010101418] = 0000000056e14f18, %f12 = fffffa00 4f000000
	ldda	[%i4+0x018]%asi,%f12	! %f12 = 00000000 56e14f18
!	Mem[00000000201c0000] = ff007e52, %l3 = 000000000000004b
	ldub	[%o0+%g0],%l3		! %l3 = 00000000000000ff
!	Mem[00000000100c1400] = 00000000, %l5 = ffffffffffffffea
	ldsha	[%i3+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 00000000, %l4 = 0000000000000035
	swapa	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000000

p0_label_146:
!	Mem[0000000030001410] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000ff
	membar	#Sync			! Added by membar checker (25)
!	%l3 = 00000000000000ff, Mem[0000000030001408] = 08000000
	stha	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = 00ff0000
!	Mem[0000000010141410] = ad87309c, %l5 = 0000000000000000
	ldstuba	[%i5+%o5]0x88,%l5	! %l5 = 0000009c000000ff
!	%l1 = 00000000eaffffff, %l0 = 0000000000008eff, %y  = 56e14f18
	smul	%l1,%l0,%l2		! %l2 = fffff44514ff7101, %y = fffff445
!	Code Fragment 3
p0_fragment_4:
!	%l0 = 0000000000008eff
	setx	0x0382b2efbee65efe,%g7,%l0 ! %l0 = 0382b2efbee65efe
!	%l1 = 00000000eaffffff
	setx	0xe6671897912fd484,%g7,%l1 ! %l1 = e6671897912fd484
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0382b2efbee65efe
	setx	0x46b648a7b4137242,%g7,%l0 ! %l0 = 46b648a7b4137242
!	%l1 = e6671897912fd484
	setx	0xdca98d5014a826c7,%g7,%l1 ! %l1 = dca98d5014a826c7
!	Mem[0000000030181400] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141410] = ff3087ad, %l4 = 0000000000000000
	swapa	[%i5+%o5]0x80,%l4	! %l4 = 00000000ff3087ad
!	%l2 = fffff44514ff7101, Mem[0000000010081410] = 0000000000000000
	stxa	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = fffff44514ff7101
!	%l4 = ff3087ad, %l5 = 0000009c, Mem[0000000010141410] = 00000000 00000000
	stda	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = ff3087ad 0000009c
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00000000, %l1 = dca98d5014a826c7
	lduha	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000000

p0_label_147:
!	Mem[0000000030041400] = 6e0000ff, %l4 = 00000000ff3087ad
	lduha	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141404] = 000000ab, %l3 = 00000000000000ff
	ldsh	[%i5+0x004],%l3		! %l3 = 0000000000000000
!	Mem[0000000010141408] = 0000005effffd9ff, %f8  = ad87309c 9c35a6ff
	ldda	[%i5+%o4]0x88,%f8 	! %f8  = 0000005e ffffd9ff
!	Mem[0000000010041400] = ffdc0000, %l0 = 46b648a7b4137242
	ldsha	[%i1+%g0]0x80,%l0	! %l0 = ffffffffffffffdc
!	Mem[00000000100c1414] = 00000000, %f0  = 00000000
	ld	[%i3+0x014],%f0 	! %f0 = 00000000
!	%f30 = 500bbc13 5eb92bab, Mem[00000000300c1400] = 41000000 00000000
	stda	%f30,[%i3+%g0]0x81	! Mem[00000000300c1400] = 500bbc13 5eb92bab
!	Mem[0000000010081400] = 00000000, %f23 = e255b5f4
	lda	[%i2+%g0]0x88,%f23	! %f23 = 00000000
!	Mem[0000000010101410] = 00000000, %l7 = 0000000000000000
	ldsba	[%i4+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = 9c35a6ff, %l2 = fffff44514ff7101
	ldswa	[%i4+%o5]0x89,%l2	! %l2 = ffffffff9c35a6ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 00000000, %l3 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000

p0_label_148:
!	Mem[0000000030101410] = ffa6359c, %l4 = 00000000000000ff
	ldstuba	[%i4+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	%f0  = 00000000 0000005a, Mem[0000000030001408] = 00ff0000 000000ff
	stda	%f0 ,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000 0000005a
!	%f6  = e546fc98 6e0000ff, %l1 = 0000000000000000
!	Mem[0000000030141420] = d9000000cac88006
	add	%i5,0x020,%g1
	stda	%f6,[%g1+%l1]ASI_PST16_S ! Mem[0000000030141420] = d9000000cac88006
!	%l1 = 0000000000000000, Mem[0000000010001408] = 00000000
	stba	%l1,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	%l7 = 0000000000000000, Mem[00000000100c1400] = 0000000000000000
	stxa	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l0 = ffffffffffffffdc
	swapa	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000000
!	%f20 = 00000000, Mem[0000000010181410] = 00000000
	sta	%f20,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	%f30 = 500bbc13 5eb92bab, %l3 = 0000000000000000
!	Mem[0000000030041438] = 0000000000000000
	add	%i1,0x038,%g1
	stda	%f30,[%g1+%l3]ASI_PST16_S ! Mem[0000000030041438] = 0000000000000000
!	%f13 = 56e14f18, Mem[0000000010001400] = 00fffa00
	sta	%f13,[%i0+0x000]%asi	! Mem[0000000010001400] = 56e14f18
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = b0ffab40, %l1 = 0000000000000000
	lduha	[%o3+0x140]%asi,%l1	! %l1 = 000000000000b0ff

p0_label_149:
!	Mem[00000000211c0000] = 35ea1327, %l3 = 0000000000000000
	ldsha	[%o2+0x000]%asi,%l3	! %l3 = 00000000000035ea
!	%l0 = 0000000000000000, Mem[0000000010001408] = 00000000
	stha	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
!	Mem[0000000030181400] = 000000ff, %l6 = ffffffff9c35a6ff
	ldsha	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081408] = e546fc98, %l1 = 000000000000b0ff
	lduwa	[%i2+%o4]0x81,%l1	! %l1 = 00000000e546fc98
!	Mem[0000000010101404] = 00000000, %f10 = 21081c6c
	lda	[%i4+0x004]%asi,%f10	! %f10 = 00000000
!	Mem[00000000201c0000] = ff007e52, %l2 = ffffffff9c35a6ff
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010041424] = 1804043b, %l2 = ffffffffffffff00
	lduw	[%i1+0x024],%l2		! %l2 = 000000001804043b
!	Mem[0000000010141410] = 9c000000ad8730ff, %l5 = 000000000000009c
	ldxa	[%i5+%o5]0x88,%l5	! %l5 = 9c000000ad8730ff
!	Mem[0000000010101404] = 00000000, %l6 = 00000000000000ff
	ldsba	[%i4+0x006]%asi,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f30 = 500bbc13 5eb92bab, %l4 = 00000000000000ff
!	Mem[0000000030181430] = adcb22a4ffffff34
	add	%i6,0x030,%g1
	stda	%f30,[%g1+%l4]ASI_PST8_S ! Mem[0000000030181430] = 500bbc135eb92bab

p0_label_150:
!	Code Fragment 4
p0_fragment_5:
!	%l0 = 0000000000000000
	setx	0x85e465107ee9002b,%g7,%l0 ! %l0 = 85e465107ee9002b
!	%l1 = 00000000e546fc98
	setx	0xd543b6787d0bc090,%g7,%l1 ! %l1 = d543b6787d0bc090
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 85e465107ee9002b
	setx	0xf182617f859579e6,%g7,%l0 ! %l0 = f182617f859579e6
!	%l1 = d543b6787d0bc090
	setx	0x7daff07fd1bd677e,%g7,%l1 ! %l1 = 7daff07fd1bd677e
!	%l7 = 0000000000000000, Mem[000000001000142a] = 00000000, %asi = 80
	stba	%l7,[%i0+0x02a]%asi	! Mem[0000000010001428] = 00000000
!	Mem[0000000030041408] = 41000000, %l6 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%f0  = 00000000 0000005a, Mem[0000000030141408] = 000000ff 00000018
	stda	%f0 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000 0000005a
!	%l4 = 00000000000000ff, Mem[0000000030041410] = 41000055
	stwa	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000ff
!	Mem[0000000020800041] = ffff095a, %l4 = 00000000000000ff
	ldstub	[%o1+0x041],%l4		! %l4 = 000000ff000000ff
!	%l1 = 7daff07fd1bd677e, Mem[0000000020800000] = 00ffca09
	sth	%l1,[%o1+%g0]		! Mem[0000000020800000] = 677eca09
!	%l5 = 9c000000ad8730ff, Mem[0000000010001410] = 34ffff3b
	stha	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 34ff30ff
!	Mem[00000000201c0000] = ff007e52, %l2 = 000000001804043b
	ldstuba	[%o0+0x000]%asi,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ff000000, %l7 = 0000000000000000
	ldswa	[%i6+%g0]0x88,%l7	! %l7 = ffffffffff000000

p0_label_151:
!	Mem[0000000030001410] = 000000ff, %l3 = 00000000000035ea
	lduwa	[%i0+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081408] = 5a000000 00000000, %l6 = 00000000, %l7 = ff000000
	ldda	[%i2+%o4]0x80,%l6	! %l6 = 000000005a000000 0000000000000000
!	Mem[00000000100c1438] = f1d308f3, %f10 = 00000000
	ld	[%i3+0x038],%f10	! %f10 = f1d308f3
!	Mem[0000000030181400] = ff000000, %l4 = 00000000000000ff
	ldsha	[%i6+%g0]0x81,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000010041410] = fd2eacff, %l4 = ffffffffffffff00
	lduwa	[%i1+%o5]0x88,%l4	! %l4 = 00000000fd2eacff
!	Mem[0000000010081410] = 0171ff14, %l3 = 00000000000000ff
	lduba	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000001
!	Mem[0000000030141400] = 00000000, %l6 = 000000005a000000
	ldsha	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = 0000000f, %l2 = 00000000000000ff
	ldswa	[%i3+%o4]0x81,%l2	! %l2 = 000000000000000f
!	Mem[0000000030081410] = ffa6359c, %l2 = 000000000000000f
	lduha	[%i2+%o5]0x81,%l2	! %l2 = 000000000000ffa6
!	Starting 10 instruction Store Burst
!	%f22 = 814f8833 00000000, %l3 = 0000000000000001
!	Mem[0000000030181428] = 00faffffeaffffff
	add	%i6,0x028,%g1
	stda	%f22,[%g1+%l3]ASI_PST8_SL ! Mem[0000000030181428] = 00faffffeaffffff

p0_label_152:
!	%l2 = 0000ffa6, %l3 = 00000001, Mem[0000000030101410] = ffa6359c 00000000
	stda	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000ffa6 00000001
!	%l3 = 0000000000000001, Mem[0000000010101410] = 00000000
	stha	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 00010000
!	Mem[00000000211c0000] = 35ea1327, %l4 = 00000000fd2eacff
	ldstub	[%o2+%g0],%l4		! %l4 = 00000035000000ff
!	%f6  = e546fc98 6e0000ff, Mem[0000000030101408] = 000000ea 00000000
	stda	%f6 ,[%i4+%o4]0x89	! Mem[0000000030101408] = e546fc98 6e0000ff
!	Mem[0000000010181410] = 00000000, %l6 = 0000000000000000, %asi = 80
	swapa	[%i6+0x010]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l3 = 0000000000000001
	ldstuba	[%i5+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101410] = 0000ffa6, %l0 = f182617f859579e6
	ldstuba	[%i4+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101410] = 00000100, %l3 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%f12 = 00000000, Mem[0000000010181410] = 00000000
	sta	%f12,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000000, %l0 = 0000000000000000
	lduba	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000

p0_label_153:
!	Mem[0000000030101400] = 00000000, %l0 = 0000000000000000
	lduwa	[%i4+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181420] = 5148fd82, %l2 = 000000000000ffa6
	ldsh	[%i6+0x020],%l2		! %l2 = 0000000000005148
!	Mem[0000000010101410] = 000001ff, %l5 = 9c000000ad8730ff
	lduha	[%i4+%o5]0x88,%l5	! %l5 = 00000000000001ff
!	Mem[0000000030041400] = 6e0000ff, %l5 = 00000000000001ff
	lduwa	[%i1+%g0]0x89,%l5	! %l5 = 000000006e0000ff
!	Mem[0000000030141408] = 00000000, %f6  = e546fc98
	lda	[%i5+%o4]0x89,%f6 	! %f6 = 00000000
!	Mem[00000000100c1400] = 00000000, %l3 = 0000000000000000
	lduwa	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081408] = 0000005a, %f25 = ff00006e
	lda	[%i2+%o4]0x88,%f25	! %f25 = 0000005a
!	Mem[0000000010081400] = 00000000, %l7 = 0000000000000000
	lduwa	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041400] = ff00006e, %l5 = 000000006e0000ff
	ldsha	[%i1+%g0]0x81,%l5	! %l5 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010141418] = 5effff19 fffff700
	stda	%l6,[%i5+0x018]%asi	! Mem[0000000010141418] = 00000000 00000000

p0_label_154:
!	%l1 = 7daff07fd1bd677e, Mem[00000000201c0001] = ff007e52
	stb	%l1,[%o0+0x001]		! Mem[00000000201c0000] = ff7e7e52
!	%l6 = 0000000000000000, Mem[0000000010141400] = ff000000
	stha	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = ff000000
!	%l1 = 7daff07fd1bd677e, Mem[0000000030081408] = 98fc46e5
	stba	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 98fc467e
!	%f6  = 00000000 6e0000ff, Mem[0000000030041410] = 000000ff 41dce33e
	stda	%f6 ,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 6e0000ff
!	%l4 = 0000000000000035, Mem[00000000100c1408] = 4831000000faffff
	stxa	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000000000000035
!	%l0 = 0000000000000000, Mem[0000000030101408] = e546fc986e0000ff
	stxa	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000000
!	Mem[0000000010001400] = 184fe156, %l5 = ffffffffffffff00
	ldstuba	[%i0+%g0]0x88,%l5	! %l5 = 00000056000000ff
!	Mem[0000000010101424] = 6b798724, %l3 = 0000000000000000
	swap	[%i4+0x024],%l3		! %l3 = 000000006b798724
!	%f24 = 40577e51 0000005a, %l3 = 000000006b798724
!	Mem[0000000030041438] = 0000000000000000
	add	%i1,0x038,%g1
	stda	%f24,[%g1+%l3]ASI_PST32_S ! Mem[0000000030041438] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[000000001004140c] = ea35a655, %l0 = 0000000000000000
	lduw	[%i1+0x00c],%l0		! %l0 = 00000000ea35a655

p0_label_155:
!	Mem[0000000030141408] = 00000000, %l7 = 0000000000000000
	ldsba	[%i5+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = ff000000, %l5 = 0000000000000056
	lduha	[%i5+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101400] = 00000000ff007eff, %f10 = f1d308f3 00000000
	ldda	[%i4+%g0]0x88,%f10	! %f10 = 00000000 ff007eff
!	Mem[0000000010141408] = ffd9ffff, %l4 = 0000000000000035
	lduh	[%i5+%o4],%l4		! %l4 = 000000000000ffd9
!	Mem[0000000030101410] = ff00ffa6, %l7 = 0000000000000000
	ldswa	[%i4+%o5]0x81,%l7	! %l7 = ffffffffff00ffa6
!	Mem[0000000030001400] = 98fc46e5, %l3 = 000000006b798724
	lduba	[%i0+%g0]0x89,%l3	! %l3 = 00000000000000e5
!	Mem[00000000100c1400] = 0000000000000000, %l5 = 0000000000000000
	ldxa	[%i3+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l4 = 000000000000ffd9
	lduba	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = 000000ff, %l4 = 0000000000000000
	lduba	[%i5+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ea35a655, Mem[0000000010041406] = 00000000
	stb	%l0,[%i1+0x006]		! Mem[0000000010041404] = 00005500

p0_label_156:
!	Mem[00000000100c1400] = 00000000, %l7 = ffffffffff00ffa6
	ldstuba	[%i3+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001422] = 00000050, %l5 = 0000000000000000
	ldstub	[%i0+0x022],%l5		! %l5 = 00000000000000ff
!	%f10 = 00000000 ff007eff, %l6 = 0000000000000000
!	Mem[0000000030141408] = 000000000000005a
	add	%i5,0x008,%g1
	stda	%f10,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030141408] = 000000000000005a
!	%f22 = 814f8833 00000000, %l6 = 0000000000000000
!	Mem[0000000010141430] = 000000ffffff0000
	add	%i5,0x030,%g1
	stda	%f22,[%g1+%l6]ASI_PST32_P ! Mem[0000000010141430] = 000000ffffff0000
!	Mem[00000000201c0000] = ff7e7e52, %l7 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030081408] = 98fc467e, %l3 = 00000000000000e5
	swapa	[%i2+%o4]0x89,%l3	! %l3 = 0000000098fc467e
!	Mem[00000000300c1408] = 0000000f, %l6 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l6	! %l6 = 000000000000000f
!	Mem[0000000030001410] = 000000ff, %l3 = 0000000098fc467e
	swapa	[%i0+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	%l2 = 0000000000005148, Mem[0000000030041410] = 00000000
	stha	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 00005148
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = dcffffff, %l4 = 0000000000000000
	lduwa	[%i1+%o4]0x88,%l4	! %l4 = 00000000dcffffff

p0_label_157:
!	Mem[0000000030081400] = 9c3087ad, %l4 = 00000000dcffffff
	lduba	[%i2+%g0]0x89,%l4	! %l4 = 00000000000000ad
!	Mem[0000000010101410] = ff010000eaffffff, %f18 = 08000000 000000ff
	ldd	[%i4+%o5],%f18		! %f18 = ff010000 eaffffff
!	%l1 = 7daff07fd1bd677e, Mem[0000000030181400] = 000000ff
	stwa	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = d1bd677e
!	Mem[0000000010041408] = dcffffff, %l0 = 00000000ea35a655
	lduwa	[%i1+%o4]0x88,%l0	! %l0 = 00000000dcffffff
!	Mem[0000000010041410] = ffac2efd, %f7  = 6e0000ff
	lda	[%i1+%o5]0x80,%f7 	! %f7 = ffac2efd
!	Mem[00000000100c1400] = 000000ff, %l0 = 00000000dcffffff
	lduba	[%i3+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[000000001014143c] = c733f359, %l2 = 0000000000005148
	lduba	[%i5+0x03c]%asi,%l2	! %l2 = 00000000000000c7
!	Mem[0000000010081410] = 0171ff14, %l3 = 00000000000000ff
	lduba	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000001
!	Mem[0000000010041400] = ffdc000000005500, %f26 = a6568bbe 7e80b946
	ldda	[%i1+%g0]0x80,%f26	! %f26 = ffdc0000 00005500
!	Starting 10 instruction Store Burst
!	%f9  = ffffd9ff, Mem[0000000030081410] = 9c35a6ff
	sta	%f9 ,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffd9ff

p0_label_158:
!	Mem[00000000100c142c] = ac64ec22, %l3 = 0000000000000001, %asi = 80
	swapa	[%i3+0x02c]%asi,%l3	! %l3 = 00000000ac64ec22
!	%f6  = 00000000 ffac2efd, Mem[0000000010141410] = ad8730ff 9c000000
	stda	%f6 ,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000 ffac2efd
!	%l2 = 000000c7, %l3 = ac64ec22, Mem[0000000010041410] = fd2eacff 0000ffff
	stda	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000c7 ac64ec22
!	%l4 = 00000000000000ad, Mem[0000000030181400] = d1bd677e
	stwa	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ad
!	%f22 = 814f8833 00000000, Mem[0000000010001438] = 00000000 00000000
	std	%f22,[%i0+0x038]	! Mem[0000000010001438] = 814f8833 00000000
!	%f4  = 48000000 00000000, %l0 = 00000000000000ff
!	Mem[0000000010001400] = ffe14f1800ff0000
	stda	%f4,[%i0+%l0]ASI_PST32_PL ! Mem[0000000010001400] = 0000000000000048
!	%f24 = 40577e51 0000005a, %l0 = 00000000000000ff
!	Mem[0000000030101410] = ff00ffa600000001
	add	%i4,0x010,%g1
	stda	%f24,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030101410] = 5a000000517e5740
!	%f4  = 48000000 00000000, Mem[0000000010001400] = 00000000 00000048
	stda	%f4 ,[%i0+%g0]0x80	! Mem[0000000010001400] = 48000000 00000000
!	Mem[0000000010181428] = 964ed241, %l4 = 00000000000000ad
	swap	[%i6+0x028],%l4		! %l4 = 00000000964ed241
!	Starting 10 instruction Load Burst
!	Mem[0000000010101430] = 0000005a1804043b, %f14 = 9650fa58 f282b2f2
	ldd	[%i4+0x030],%f14	! %f14 = 0000005a 1804043b

p0_label_159:
!	Mem[00000000300c1400] = 500bbc135eb92bab, %l2 = 00000000000000c7
	ldxa	[%i3+%g0]0x81,%l2	! %l2 = 500bbc135eb92bab
!	Mem[0000000030181410] = 550000ff, %l6 = 000000000000000f
	ldsba	[%i6+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[000000001008141c] = 6e0000ff, %l7 = 00000000000000ff
	ldub	[%i2+0x01f],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030081410] = ffffd9ff, %f13 = 56e14f18
	lda	[%i2+%o5]0x89,%f13	! %f13 = ffffd9ff
!	Mem[00000000100c1408] = 35000000, %f15 = 1804043b
	lda	[%i3+%o4]0x80,%f15	! %f15 = 35000000
!	Mem[00000000201c0000] = ff7e7e52, %l1 = 7daff07fd1bd677e
	ldsh	[%o0+%g0],%l1		! %l1 = ffffffffffffff7e
!	Mem[0000000030081408] = e5000000, %l1 = ffffffffffffff7e
	lduba	[%i2+%o4]0x81,%l1	! %l1 = 00000000000000e5
!	Mem[0000000030101400] = 00000000, %l7 = 00000000000000ff
	lduba	[%i4+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000021800100] = 31488c1a, %l1 = 00000000000000e5
	ldsh	[%o3+0x100],%l1		! %l1 = 0000000000003148
!	Starting 10 instruction Store Burst
!	%l4 = 964ed241, %l5 = 00000000, Mem[0000000030181410] = ff000055 41dce33e
	stda	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 964ed241 00000000

p0_label_160:
!	%f16 = e546fc98 6e0000ff ff010000 eaffffff
!	%f20 = 00000000 00faffff 814f8833 00000000
!	%f24 = 40577e51 0000005a ffdc0000 00005500
!	%f28 = 2bd71cbc 9dc1869c 500bbc13 5eb92bab
	stda	%f16,[%i5]ASI_COMMIT_S	! Block Store to 0000000030141400
!	%l2 = 500bbc135eb92bab, Mem[00000000211c0000] = ffea1327
	stb	%l2,[%o2+%g0]		! Mem[00000000211c0000] = abea1327
!	%l0 = 000000ff, %l1 = 00003148, Mem[0000000030181410] = 964ed241 00000000
	stda	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000ff 00003148
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000010141408] = ffd9ffff, %l6 = ffffffffffffffff
	ldstuba	[%i5+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	%l1 = 0000000000003148, Mem[0000000010181410] = 00000000
	stha	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = 31480000
!	Mem[00000000100c143c] = 355d6f3b, %l4 = 00000000964ed241, %asi = 80
	swapa	[%i3+0x03c]%asi,%l4	! %l4 = 00000000355d6f3b
!	Mem[0000000030101408] = 00000000, %l3 = 00000000ac64ec22
	ldstuba	[%i4+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%f4  = 48000000 00000000, Mem[0000000030141410] = 00000000 fffffa00
	stda	%f4 ,[%i5+%o5]0x89	! Mem[0000000030141410] = 48000000 00000000
!	Mem[0000000010081408] = 5a000000, %l1 = 0000000000003148
	ldstuba	[%i2+%o4]0x80,%l1	! %l1 = 0000005a000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = 677eca09, %l5 = 0000000000000000
	lduba	[%o1+0x001]%asi,%l5	! %l5 = 000000000000007e

p0_label_161:
!	Mem[0000000030041400] = ff00006e, %l5 = 000000000000007e
	lduwa	[%i1+%g0]0x81,%l5	! %l5 = 00000000ff00006e
!	Mem[0000000010001430] = 0000314813bc0b50, %f12 = 00000000 ffffd9ff
	ldd	[%i0+0x030],%f12	! %f12 = 00003148 13bc0b50
!	Mem[0000000010141428] = 00735b41 e10bde60, %l6 = 000000ff, %l7 = 00000000
	ldd	[%i5+0x028],%l6		! %l6 = 0000000000735b41 00000000e10bde60
!	Mem[0000000010081428] = 21081c6c00000000, %l5 = 00000000ff00006e
	ldx	[%i2+0x028],%l5		! %l5 = 21081c6c00000000
!	Mem[0000000030041410] = ff00006e00005148, %l5 = 21081c6c00000000
	ldxa	[%i1+%o5]0x89,%l5	! %l5 = ff00006e00005148
!	Mem[0000000030141408] = ff010000 eaffffff, %l0 = 000000ff, %l1 = 0000005a
	ldda	[%i5+%o4]0x81,%l0	! %l0 = 00000000ff010000 00000000eaffffff
!	Mem[0000000030041410] = 485100006e0000ff, %l5 = ff00006e00005148
	ldxa	[%i1+%o5]0x81,%l5	! %l5 = 485100006e0000ff
!	Mem[0000000030001410] = fffffa0098fc467e, %l3 = 0000000000000000
	ldxa	[%i0+%o5]0x89,%l3	! %l3 = fffffa0098fc467e
!	Mem[0000000030001408] = 00000000, %l7 = 00000000e10bde60
	ldsba	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = ffd9ffff, %l7 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l7	! %l7 = 000000ff000000ff

p0_label_162:
!	Mem[0000000010041408] = ffffffdc, %l3 = fffffa0098fc467e
	ldstuba	[%i1+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010141400] = ff000000, %l0 = 00000000ff010000
	ldstuba	[%i5+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141423] = 7e4b9ed8, %l0 = 0000000000000000
	ldstuba	[%i5+0x023]%asi,%l0	! %l0 = 000000d8000000ff
!	Mem[0000000030001408] = 00000000, %l5 = 485100006e0000ff
	swapa	[%i0+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141404] = 000000ab, %l5 = 0000000000000000
	ldstuba	[%i5+0x004]%asi,%l5	! %l5 = 00000000000000ff
!	%l0 = 00000000000000d8, Mem[0000000010101400] = ff007eff
	stwa	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000d8
!	Mem[0000000010001408] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i0+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	%l1 = 00000000eaffffff, Mem[0000000010001427] = 22000000
	stb	%l1,[%i0+0x027]		! Mem[0000000010001424] = 220000ff
!	%f3  = f9951bcb, Mem[0000000010141400] = ff0000ff
	sta	%f3 ,[%i5+%g0]0x88	! Mem[0000000010141400] = f9951bcb
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 0000dcff, %l2 = 500bbc135eb92bab
	ldswa	[%i1+%g0]0x88,%l2	! %l2 = 000000000000dcff

p0_label_163:
!	Mem[0000000030181408] = 9c3087ad, %l6 = 0000000000735b41
	ldsha	[%i6+%o4]0x89,%l6	! %l6 = ffffffffffff87ad
!	Mem[0000000030141410] = 4800000000000000, %l3 = 0000000000000000
	ldxa	[%i5+%o5]0x89,%l3	! %l3 = 4800000000000000
!	Mem[0000000030141410] = 00000000, %f7  = ffac2efd
	lda	[%i5+%o5]0x81,%f7 	! %f7 = 00000000
!	Mem[0000000010001408] = ff00000000000000, %f8  = 0000005e ffffd9ff
	ldda	[%i0+%o4]0x80,%f8 	! %f8  = ff000000 00000000
!	Mem[0000000010081410] = fffff44514ff7101, %l1 = 00000000eaffffff
	ldxa	[%i2+%o5]0x88,%l1	! %l1 = fffff44514ff7101
!	Mem[0000000010101418] = 00000000, %l1 = fffff44514ff7101
	ldsh	[%i4+0x01a],%l1		! %l1 = 0000000000000000
!	Mem[0000000030181410] = ff000000, %l2 = 000000000000dcff
	ldsha	[%i6+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081410] = 0171ff1445f4ffff, %l0 = 00000000000000d8
	ldxa	[%i2+%o5]0x80,%l0	! %l0 = 0171ff1445f4ffff
!	Mem[0000000010081408] = ff00000000000000, %l7 = 00000000000000ff
	ldxa	[%i2+%o4]0x80,%l7	! %l7 = ff00000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000030141400] = 98fc46e5
	stwa	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000

p0_label_164:
!	Mem[0000000010041400] = ffdc0000, %l4 = 00000000355d6f3b
	swapa	[%i1+%g0]0x80,%l4	! %l4 = 00000000ffdc0000
!	Mem[0000000020800041] = ffff095a, %l7 = ff00000000000000
	ldstuba	[%o1+0x041]%asi,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010001424] = 220000ff, %l0 = 0171ff1445f4ffff
	ldstuba	[%i0+0x024]%asi,%l0	! %l0 = 00000022000000ff
!	Mem[0000000030101410] = 5a000000, %l1 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l1	! %l1 = 0000005a000000ff
!	%l1 = 000000000000005a, Mem[0000000010081410] = 0171ff14
	stwa	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000005a
!	%l4 = ffdc0000, %l5 = 00000000, Mem[0000000010041408] = dcffffff 55a635ea
	stda	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = ffdc0000 00000000
!	%l2 = 0000000000000000, Mem[00000000211c0000] = abea1327, %asi = 80
	stba	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ea1327
!	Mem[00000000100c1410] = 00000000, %l4 = 00000000ffdc0000
	swapa	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000020800040] = ffff095a
	sth	%l2,[%o1+0x040]		! Mem[0000000020800040] = 0000095a
!	Starting 10 instruction Load Burst
!	Mem[000000001000143c] = 00000000, %l0 = 0000000000000022
	lduwa	[%i0+0x03c]%asi,%l0	! %l0 = 0000000000000000

p0_label_165:
!	Mem[00000000300c1408] = ab000000 00000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i3+%o4]0x89,%l2	! %l2 = 0000000000000000 00000000ab000000
!	Mem[000000001010143c] = 00735b41, %l5 = 0000000000000000
	lduba	[%i4+0x03f]%asi,%l5	! %l5 = 0000000000000041
!	Mem[00000000100c1410] = ffdc0000, %l2 = 0000000000000000
	ldsba	[%i3+0x012]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l7 = 00000000000000ff
	ldswa	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141400] = ff00006e00000000, %l0 = 0000000000000000
	ldxa	[%i5+%g0]0x89,%l0	! %l0 = ff00006e00000000
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000010001400] = 48000000 00000000 ff000000 00000000
!	Mem[0000000010001410] = ff30ff34 45a78c73 75f01295 2cafd500
!	Mem[0000000010001420] = 0000ff50 ff0000ff 00000000 000000ff
!	Mem[0000000010001430] = 00003148 13bc0b50 814f8833 00000000
	ldda	[%i0]ASI_BLK_AIUP,%f16	! Block Load from 0000000010001400
!	Mem[0000000030081400] = ad87309c 9c35a6ff, %l4 = 00000000, %l5 = 00000041
	ldda	[%i2+%g0]0x81,%l4	! %l4 = 00000000ad87309c 000000009c35a6ff
!	Mem[0000000030141400] = 00000000, %l5 = 000000009c35a6ff
	ldsba	[%i5+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0000] = ff7e7e52, %l6 = ffffffffffff87ad
	ldub	[%o0+%g0],%l6		! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000030141400] = ff00006e00000000
	stxa	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000000

p0_label_166:
!	Mem[0000000010041408] = 0000dcff, %l3 = 00000000ab000000
	ldstuba	[%i1+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	%f6  = 00000000 00000000, Mem[0000000010141410] = fd2eacff 00000000
	stda	%f6 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 00000000
!	Mem[00000000100c1400] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l3	! %l3 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (28)
!	%l5 = 0000000000000000, Mem[0000000010001408] = ff000000
	stba	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	%l3 = 00000000000000ff, Mem[000000001010141f] = 56e14f18
	stb	%l3,[%i4+0x01f]		! Mem[000000001010141c] = 56e14fff
!	%l5 = 0000000000000000, Mem[0000000010181400] = 000000ff
	stha	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000ff
!	Mem[0000000010141410] = 00000000, %l4 = 00000000ad87309c
	ldstuba	[%i5+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000010101410] = ff010000 eaffffff
	stda	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000ff 00000000
!	%f16 = 48000000 00000000, %l4 = 0000000000000000
!	Mem[0000000030001408] = 6e0000ff0000005a
	add	%i0,0x008,%g1
	stda	%f16,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030001408] = 6e0000ff0000005a
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 48510000, %l6 = 00000000000000ff
	ldswa	[%i1+%o5]0x81,%l6	! %l6 = 0000000048510000

p0_label_167:
!	Mem[0000000010081408] = ff000000 00000000, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i2+%o4]0x80,%l2	! %l2 = 00000000ff000000 0000000000000000
!	Mem[0000000010141418] = 0000000000000000, %l0 = ff00006e00000000
	ldx	[%i5+0x018],%l0		! %l0 = 0000000000000000
!	Mem[0000000030001408] = ff00006e, %l3 = 0000000000000000
	ldswa	[%i0+%o4]0x89,%l3	! %l3 = ffffffffff00006e
!	Mem[0000000010181408] = 350000000000005b, %l5 = 0000000000000000
	ldxa	[%i6+%o4]0x80,%l5	! %l5 = 350000000000005b
!	Mem[0000000010001420] = 0000ff50, %l3 = ffffffffff00006e
	lduha	[%i0+0x022]%asi,%l3	! %l3 = 000000000000ff50
!	Mem[0000000030141400] = 00000000, %l0 = 0000000000000000
	lduba	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1410] = ff00000000000000, %l7 = 0000000000000000
	ldxa	[%i3+%o5]0x81,%l7	! %l7 = ff00000000000000
!	Mem[00000000300c1408] = 00000000, %l3 = 000000000000ff50
	ldswa	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181408] = 00000035, %l0 = 0000000000000000
	ldswa	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000035
!	Starting 10 instruction Store Burst
!	%l7 = ff00000000000000, Mem[0000000010101410] = 000000ff
	stwa	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000

p0_label_168:
!	%l2 = 00000000ff000000, Mem[00000000100c1408] = 35000000
	stba	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	Mem[0000000021800040] = ff644546, %l0 = 0000000000000035
	ldstuba	[%o3+0x040]%asi,%l0	! %l0 = 000000ff000000ff
!	%l4 = 0000000000000000, Mem[00000000201c0001] = ff7e7e52
	stb	%l4,[%o0+0x001]		! Mem[00000000201c0000] = ff007e52
!	Mem[0000000010101400] = d8000000, %l5 = 350000000000005b
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 000000d8000000ff
!	%l2 = 00000000ff000000, Mem[0000000030081400] = ad87309c
	stwa	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = ff000000
!	%l4 = 00000000, %l5 = 000000d8, Mem[0000000010181400] = 000000ff 00000000
	stda	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 000000d8
!	%l0 = 000000ff, %l1 = 0000005a, Mem[0000000010041400] = 3b6f5d35 00550000
	stda	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000ff 0000005a
!	Mem[0000000010181410] = 00004831, %l7 = ff00000000000000
	swapa	[%i6+%o5]0x88,%l7	! %l7 = 0000000000004831
!	%f4  = 48000000 00000000, Mem[0000000010001438] = 814f8833 00000000
	stda	%f4 ,[%i0+0x038]%asi	! Mem[0000000010001438] = 48000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = cb1b95f9, %l7 = 0000000000004831
	ldswa	[%i5+%g0]0x80,%l7	! %l7 = ffffffffcb1b95f9

p0_label_169:
!	Code Fragment 4
p0_fragment_6:
!	%l0 = 00000000000000ff
	setx	0xcf9bc9907d87bedb,%g7,%l0 ! %l0 = cf9bc9907d87bedb
!	%l1 = 000000000000005a
	setx	0x8dfe88d83b5e38d3,%g7,%l1 ! %l1 = 8dfe88d83b5e38d3
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = cf9bc9907d87bedb
	setx	0xb9bc9177a5c2bacd,%g7,%l0 ! %l0 = b9bc9177a5c2bacd
!	%l1 = 8dfe88d83b5e38d3
	setx	0xf55d51f071c133ad,%g7,%l1 ! %l1 = f55d51f071c133ad
!	Mem[0000000010041400] = 000000ff, %l1 = f55d51f071c133ad
	lduba	[%i1+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001408] = 6e0000ff0000005a, %l4 = 0000000000000000
	ldxa	[%i0+%o4]0x81,%l4	! %l4 = 6e0000ff0000005a
!	Mem[0000000010181410] = 00000000, %l1 = 00000000000000ff
	ldswa	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = 5b000000 00000035, %l0 = a5c2bacd, %l1 = 00000000
	ldda	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000035 000000005b000000
!	Mem[0000000010141400] = cb1b95f9, %l5 = 00000000000000d8
	ldsb	[%i5+0x001],%l5		! %l5 = 000000000000001b
!	Mem[00000000100c1408] = 0000000000000000, %l3 = 0000000000000000
	ldxa	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = ffd9ffff, %l7 = ffffffffcb1b95f9
	ldsha	[%i5+%o4]0x80,%l7	! %l7 = ffffffffffffffd9
!	Mem[0000000010041408] = ffdc00ff, %l7 = ffffffffffffffd9
	ldswa	[%i1+%o4]0x88,%l7	! %l7 = ffffffffffdc00ff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 00000000, %l2 = 00000000ff000000
	swapa	[%i3+%o4]0x81,%l2	! %l2 = 0000000000000000

p0_label_170:
!	%l3 = 0000000000000000, Mem[00000000300c1408] = 000000ff
	stha	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	Mem[000000001010141c] = 56e14fff, %l5 = 000000000000001b, %asi = 80
	swapa	[%i4+0x01c]%asi,%l5	! %l5 = 0000000056e14fff
!	Mem[0000000030101410] = ff000000, %l7 = ffffffffffdc00ff
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 00000000ff000000
!	%f8  = ff000000 00000000, %l0 = 0000000000000035
!	Mem[0000000010001418] = 75f012952cafd500
	add	%i0,0x018,%g1
	stda	%f8,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010001418] = 000012950000d500
!	Mem[0000000030181400] = ad000000, %l3 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l3	! %l3 = 00000000ad000000
!	%f10 = 00000000, Mem[0000000010081408] = 000000ff
	sta	%f10,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	%l3 = 00000000ad000000, Mem[0000000030001400] = 98fc46e5
	stha	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 98fc0000
!	%f16 = 48000000 00000000 ff000000 00000000
!	%f20 = ff30ff34 45a78c73 75f01295 2cafd500
!	%f24 = 0000ff50 ff0000ff 00000000 000000ff
!	%f28 = 00003148 13bc0b50 814f8833 00000000
	stda	%f16,[%i2]ASI_BLK_P	! Block Store to 0000000010081400
	membar	#Sync			! Added by membar checker (29)
!	Mem[000000001008143c] = 00000000, %l6 = 0000000048510000
	ldstub	[%i2+0x03c],%l6		! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00000000, %l0 = 0000000000000035
	ldsha	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000000

p0_label_171:
!	Mem[000000001018140c] = 0000005b, %l5 = 0000000056e14fff
	ldsha	[%i6+0x00e]%asi,%l5	! %l5 = 000000000000005b
!	Mem[0000000030041400] = ff00006e, %l5 = 000000000000005b
	ldswa	[%i1+%g0]0x81,%l5	! %l5 = ffffffffff00006e
!	Mem[0000000010081418] = 75f012952cafd500, %f12 = 00003148 13bc0b50
	ldda	[%i2+0x018]%asi,%f12	! %f12 = 75f01295 2cafd500
!	Mem[0000000030041410] = 00005148, %f2  = ff5b7300
	lda	[%i1+%o5]0x89,%f2 	! %f2 = 00005148
!	Mem[0000000010101410] = 00000000, %l7 = 00000000ff000000
	ldswa	[%i4+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l1 = 000000005b000000
	ldswa	[%i6+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l5 = ffffffffff00006e
	ldswa	[%i6+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141400] = f9951bcb, %l4 = 6e0000ff0000005a
	lduwa	[%i5+%g0]0x88,%l4	! %l4 = 00000000f9951bcb
!	Mem[00000000300c1408] = 00000000000000ab, %l7 = 0000000000000000
	ldxa	[%i3+%o4]0x81,%l7	! %l7 = 00000000000000ab
!	Starting 10 instruction Store Burst
!	Mem[0000000021800100] = 31488c1a, %l6 = 0000000000000000
	ldstuba	[%o3+0x100]%asi,%l6	! %l6 = 00000031000000ff

p0_label_172:
!	%f16 = 48000000 00000000, Mem[0000000010041408] = ff00dcff 00000000
	stda	%f16,[%i1+%o4]0x80	! Mem[0000000010041408] = 48000000 00000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010041418] = 00000000 d02e34e7
	std	%l0,[%i1+0x018]		! Mem[0000000010041418] = 00000000 00000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010181410] = 00000000 ff00ff00
	stda	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000 00000000
!	Mem[0000000010181431] = 3466373a, %l6 = 0000000000000031
	ldstuba	[%i6+0x031]%asi,%l6	! %l6 = 00000066000000ff
!	Mem[0000000010101408] = 00000000, %l0 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081408] = 000000e5, %l6 = 0000000000000066
	ldstuba	[%i2+%o4]0x89,%l6	! %l6 = 000000e5000000ff
!	%f6  = 00000000 00000000, Mem[00000000100c1408] = 00000000 00000000
	stda	%f6 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 00000000
!	%l6 = 00000000000000e5, Mem[0000000010041420] = 8eff8f5f1804043b, %asi = 80
	stxa	%l6,[%i1+0x020]%asi	! Mem[0000000010041420] = 00000000000000e5
!	%l5 = 0000000000000000, Mem[0000000010081408] = ff00000000000000
	stx	%l5,[%i2+%o4]		! Mem[0000000010081408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 000001ff, %l3 = 00000000ad000000
	ldsha	[%i5+%o4]0x89,%l3	! %l3 = 00000000000001ff

p0_label_173:
!	Mem[0000000010141410] = ff000000, %l4 = 00000000f9951bcb
	lduwa	[%i5+%o5]0x80,%l4	! %l4 = 00000000ff000000
!	Mem[0000000030181410] = 48310000ff000000, %f6  = 00000000 00000000
	ldda	[%i6+%o5]0x89,%f6 	! %f6  = 48310000 ff000000
!	Mem[0000000010041410] = c7000000, %l4 = 00000000ff000000
	ldsha	[%i1+0x010]%asi,%l4	! %l4 = ffffffffffffc700
!	Mem[0000000010181408] = 35000000, %l0 = 0000000000000000
	lduba	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000035
!	Mem[0000000010041410] = 000000c7, %l5 = 0000000000000000
	ldswa	[%i1+%o5]0x88,%l5	! %l5 = 00000000000000c7
!	Mem[0000000030141408] = ff010000, %l1 = 0000000000000000
	ldsha	[%i5+%o4]0x81,%l1	! %l1 = ffffffffffffff01
!	Mem[0000000010001410] = ff30ff34, %l1 = ffffffffffffff01
	lduwa	[%i0+%o5]0x80,%l1	! %l1 = 00000000ff30ff34
!	Mem[00000000100c1420] = 00000000, %l3 = 00000000000001ff
	ldsb	[%i3+0x023],%l3		! %l3 = 0000000000000000
!	%l4 = ffffffffffffc700, %l5 = 00000000000000c7, %l5 = 00000000000000c7
	sdivx	%l4,%l5,%l5		! %l5 = ffffffffffffffb7
!	Starting 10 instruction Store Burst
!	%l4 = ffffc700, %l5 = ffffffb7, Mem[0000000010141400] = cb1b95f9 ff0000ab
	stda	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = ffffc700 ffffffb7

p0_label_174:
!	%l3 = 0000000000000000, Mem[000000001000143c] = 00000000, %asi = 80
	stwa	%l3,[%i0+0x03c]%asi	! Mem[000000001000143c] = 00000000
!	%f20 = ff30ff34 45a78c73, Mem[0000000030141410] = 00000000 48000000
	stda	%f20,[%i5+%o5]0x89	! Mem[0000000030141410] = ff30ff34 45a78c73
!	Mem[0000000030001400] = 0000fc98, %l1 = 00000000ff30ff34
	swapa	[%i0+%g0]0x81,%l1	! %l1 = 000000000000fc98
!	Mem[0000000010141410] = 000000ff, %l6 = 00000000000000e5
	ldstuba	[%i5+%o5]0x88,%l6	! %l6 = 000000ff000000ff
!	%l6 = 00000000000000ff, Mem[00000000201c0000] = ff007e52
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 00ff7e52
!	%l5 = ffffffffffffffb7, Mem[00000000211c0000] = 00ea1327, %asi = 80
	stha	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffb71327
!	%l0 = 0000000000000035, Mem[0000000010081410] = ff30ff3445a78c73
	stxa	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000000000000035
!	%l7 = 00000000000000ab, Mem[0000000030141410] = 45a78c73
	stha	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = 45a700ab
!	%l7 = 00000000000000ab, Mem[0000000030081408] = ff0000006e0000ff
	stxa	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000000000ab
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ff7e52, %l4 = ffffffffffffc700
	ldub	[%o0+0x001],%l4		! %l4 = 00000000000000ff

p0_label_175:
!	Mem[0000000010101400] = 000000ff, %l1 = 000000000000fc98
	ldswa	[%i4+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1408] = 00000000, %l4 = 00000000000000ff
	ldswa	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041410] = ff00006e00005148, %l0 = 0000000000000035
	ldxa	[%i1+%o5]0x89,%l0	! %l0 = ff00006e00005148
!	Mem[000000001000140c] = 00000000, %l7 = 00000000000000ab
	ldsha	[%i0+0x00e]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101400] = ff000000, %l7 = 0000000000000000
	ldsba	[%i4+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010081410] = 0000000000000035, %f18 = ff000000 00000000
	ldda	[%i2+%o5]0x80,%f18	! %f18 = 00000000 00000035
!	Mem[00000000300c1400] = 500bbc13, %l0 = ff00006e00005148
	ldsha	[%i3+%g0]0x81,%l0	! %l0 = 000000000000500b
!	Mem[0000000010081430] = 00003148 13bc0b50, %l6 = 000000ff, %l7 = ffffffff
	ldd	[%i2+0x030],%l6		! %l6 = 0000000000003148 0000000013bc0b50
!	Mem[0000000010081410] = 3500000000000000, %f4  = 48000000 00000000
	ldda	[%i2+%o5]0x88,%f4 	! %f4  = 35000000 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 000000ff, %l3 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l3	! %l3 = 00000000000000ff

p0_label_176:
!	%l6 = 00003148, %l7 = 13bc0b50, Mem[0000000010101418] = 00000000 0000001b
	stda	%l6,[%i4+0x018]%asi	! Mem[0000000010101418] = 00003148 13bc0b50
!	Mem[0000000010081408] = 00000000, %l3 = 00000000000000ff
	swapa	[%i2+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041400] = 6e0000ff, %l2 = 0000000000000000
	swapa	[%i1+%g0]0x89,%l2	! %l2 = 000000006e0000ff
!	Mem[0000000010041410] = 000000c7, %l0 = 000000000000500b
	ldstuba	[%i1+%o5]0x88,%l0	! %l0 = 000000c7000000ff
!	Mem[0000000010181408] = 35000000, %l7 = 0000000013bc0b50
	swapa	[%i6+%o4]0x80,%l7	! %l7 = 0000000035000000
!	Mem[0000000010081408] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i2+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181410] = ff000000, %l6 = 0000000000003148
	swapa	[%i6+%o5]0x89,%l6	! %l6 = 00000000ff000000
!	Mem[00000000211c0001] = ffb71327, %l0 = 00000000000000c7
	ldstub	[%o2+0x001],%l0		! %l0 = 000000b7000000ff
!	%l2 = 000000006e0000ff, Mem[0000000010081408] = ff0000ff
	stha	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181430] = 34ff373a, %f10 = 00000000
	lda	[%i6+0x030]%asi,%f10	! %f10 = 34ff373a

p0_label_177:
!	Mem[0000000010041410] = ac64ec22000000ff, %l1 = 00000000000000ff
	ldxa	[%i1+%o5]0x88,%l1	! %l1 = ac64ec22000000ff
!	Mem[0000000030041400] = 00000000, %l3 = 0000000000000000
	lduha	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = 0000000000000000, %l1 = ac64ec22000000ff
	ldx	[%i0+%o4],%l1		! %l1 = 0000000000000000
!	Mem[0000000030001410] = 98fc467e, %l1 = 0000000000000000
	lduwa	[%i0+%o5]0x89,%l1	! %l1 = 0000000098fc467e
!	Mem[0000000010101410] = 00000000, %l3 = 0000000000000000
	lduha	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181408] = ad87309c, %l6 = 00000000ff000000
	ldsba	[%i6+%o4]0x81,%l6	! %l6 = ffffffffffffffad
!	Mem[0000000020800040] = 0000095a, %l0 = 00000000000000b7
	lduh	[%o1+0x040],%l0		! %l0 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l7 = 0000000035000000
	lduba	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000201c0000] = 00ff7e52, %l0 = 0000000000000000
	lduh	[%o0+%g0],%l0		! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 000000ff, %l7 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l7	! %l7 = 00000000000000ff

p0_label_178:
!	Mem[0000000010101400] = 000000ff, %l3 = 0000000000000000
	swapa	[%i4+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	%l1 = 0000000098fc467e, Mem[0000000010101410] = 00000000
	stwa	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = 98fc467e
!	Mem[00000000201c0001] = 00ff7e52, %l6 = ffffffffffffffad
	ldstub	[%o0+0x001],%l6		! %l6 = 000000ff000000ff
!	%f18 = 00000000 00000035, Mem[0000000010181410] = 00000000 00000000
	stda	%f18,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000 00000035
!	%l3 = 00000000000000ff, Mem[0000000010141400] = 00c7ffff
	stba	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = 00c7ffff
!	%l0 = 00000000000000ff, Mem[0000000030141408] = ff010000
	stha	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 00ff0000
!	Mem[00000000100c1410] = ffdc0000, %l0 = 00000000000000ff
	ldstuba	[%i3+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030181408] = 9c3087ad, %l5 = ffffffffffffffb7
	ldstuba	[%i6+%o4]0x89,%l5	! %l5 = 000000ad000000ff
!	Mem[0000000030001408] = 6e0000ff, %l6 = 00000000000000ff
	ldstuba	[%i0+%o4]0x81,%l6	! %l6 = 0000006e000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ff000000, %l3 = 00000000000000ff
	ldsba	[%i4+%o4]0x81,%l3	! %l3 = ffffffffffffffff

p0_label_179:
!	Mem[0000000010181400] = 00000000, %f31 = 00000000
	lda	[%i6+%g0]0x80,%f31	! %f31 = 00000000
!	Mem[0000000010041408] = 00000048, %l1 = 0000000098fc467e
	ldsha	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000048
!	Mem[00000000100c1408] = 00000000, %l2 = 000000006e0000ff
	ldsba	[%i3+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181410] = 48310000, %f11 = ff007eff
	lda	[%i6+%o5]0x81,%f11	! %f11 = 48310000
!	Mem[00000000201c0000] = 00ff7e52, %l7 = 00000000000000ff
	ldub	[%o0+0x001],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030001410] = 7e46fc98, %l5 = 00000000000000ad
	ldswa	[%i0+%o5]0x81,%l5	! %l5 = 000000007e46fc98
!	Mem[00000000201c0000] = 00ff7e52, %l3 = ffffffffffffffff
	ldub	[%o0+0x001],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010041408] = 4800000000000000, %f30 = 814f8833 00000000
	ldda	[%i1+%o4]0x80,%f30	! %f30 = 48000000 00000000
!	Mem[0000000010041400] = 0000005a000000ff, %f12 = 75f01295 2cafd500
	ldda	[%i1+%g0]0x88,%f12	! %f12 = 0000005a 000000ff
!	Starting 10 instruction Store Burst
!	%f16 = 48000000 00000000 00000000 00000035
!	%f20 = ff30ff34 45a78c73 75f01295 2cafd500
!	%f24 = 0000ff50 ff0000ff 00000000 000000ff
!	%f28 = 00003148 13bc0b50 48000000 00000000
	stda	%f16,[%i6]ASI_BLK_AIUSL	! Block Store to 0000000030181400

p0_label_180:
!	%l3 = 00000000000000ff, Mem[00000000300c1410] = ff000000
	stha	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00ff0000
!	%l6 = 000000000000006e, Mem[00000000100c1428] = ff871921, %asi = 80
	stba	%l6,[%i3+0x028]%asi	! Mem[00000000100c1428] = 6e871921
!	Mem[0000000030101400] = 00000000, %l1 = 0000000000000048
	ldstuba	[%i4+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000030001400] = 34ff30ff
	stha	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 34ff0000
!	%l3 = 00000000000000ff, Mem[0000000030001410] = 7e46fc9800faffff
	stxa	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000000000ff
!	%l1 = 0000000000000000, Mem[00000000100c1408] = 0000000000000000, %asi = 80
	stxa	%l1,[%i3+0x008]%asi	! Mem[00000000100c1408] = 0000000000000000
!	%f3  = f9951bcb, Mem[0000000010141408] = ffd9ffff
	sta	%f3 ,[%i5+%o4]0x80	! Mem[0000000010141408] = f9951bcb
!	Mem[0000000030141400] = 00000000, %l7 = 00000000000000ff
	swapa	[%i5+%g0]0x89,%l7	! %l7 = 0000000000000000
!	%l6 = 000000000000006e, Mem[000000001014142a] = 00735b41
	sth	%l6,[%i5+0x02a]		! Mem[0000000010141428] = 0073006e
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000030181408] = 35000000, %l2 = 0000000000000000
	ldswa	[%i6+%o4]0x81,%l2	! %l2 = 0000000035000000

p0_label_181:
!	Mem[0000000010141400] = ffffc700ffffffb7, %l5 = 000000007e46fc98
	ldxa	[%i5+%g0]0x80,%l5	! %l5 = ffffc700ffffffb7
!	Mem[0000000030141400] = 000000ff, %l1 = 0000000000000000
	lduba	[%i5+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000021800000] = f6f0b8f7, %l2 = 0000000035000000
	ldsba	[%o3+0x001]%asi,%l2	! %l2 = fffffffffffffff0
!	Mem[0000000010001410] = ff30ff3445a78c73, %f16 = 48000000 00000000
	ldda	[%i0+%o5]0x80,%f16	! %f16 = ff30ff34 45a78c73
!	Mem[0000000030141400] = ff000000, %l2 = fffffffffffffff0
	ldsba	[%i5+%g0]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010001400] = 48000000 00000000, %l6 = 0000006e, %l7 = 00000000
	ldda	[%i0+%g0]0x80,%l6	! %l6 = 0000000048000000 0000000000000000
!	Mem[0000000010181430] = 34ff373a, %l7 = 0000000000000000
	ldub	[%i6+0x033],%l7		! %l7 = 000000000000003a
!	Randomly selected nop
	nop
!	Mem[000000001004141c] = 00000000, %l6 = 0000000048000000
	ldsb	[%i1+0x01d],%l6		! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f14 = 0000005a, Mem[0000000010101424] = 00000000
	sta	%f14,[%i4+0x024]%asi	! Mem[0000000010101424] = 0000005a

p0_label_182:
!	Mem[0000000010041400] = 000000ff, %l5 = ffffc700ffffffb7
	swapa	[%i1+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[0000000020800040] = 0000095a
	sth	%l5,[%o1+0x040]		! Mem[0000000020800040] = 00ff095a
!	Mem[0000000030181408] = 35000000, %l2 = ffffffffffffffff
	ldstuba	[%i6+%o4]0x81,%l2	! %l2 = 00000035000000ff
!	%l2 = 00000035, %l3 = 000000ff, Mem[0000000030101400] = ff000000 00000000
	stda	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000035 000000ff
!	%l0 = 000000ff, %l1 = 000000ff, Mem[0000000030041410] = 48510000 6e0000ff
	stda	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000ff 000000ff
!	%l3 = 00000000000000ff, Mem[0000000010001408] = 0000000000000000
	stxa	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000000000ff
!	Mem[0000000010001410] = 34ff30ff, %l1 = 00000000000000ff
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 0000000034ff30ff
!	Mem[00000000100c1400] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i3+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	%l7 = 000000000000003a, Mem[0000000030101408] = 00000000000000ff
	stxa	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000000000003a
!	Starting 10 instruction Load Burst
!	%l2 = 0000000000000035, Mem[0000000010001400] = 48000000
	stwa	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000035

p0_label_183:
!	Mem[0000000010141410] = 000000ff, %l1 = 0000000034ff30ff
	lduba	[%i5+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181410] = 45a78c73, %l3 = 0000000000000000
	ldswa	[%i6+%o5]0x89,%l3	! %l3 = 0000000045a78c73
!	Mem[0000000010141400] = ffffc700 ffffffb7, %l0 = 000000ff, %l1 = 000000ff
	ldda	[%i5+0x000]%asi,%l0	! %l0 = 00000000ffffc700 00000000ffffffb7
!	Mem[000000001000140c] = 000000ff, %l0 = 00000000ffffc700
	ldsb	[%i0+0x00f],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000030001410] = 00000000, %l0 = ffffffffffffffff
	lduba	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000211c0000] = ffff1327, %l3 = 0000000045a78c73
	ldsba	[%o2+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181400] = 00000000, %l3 = ffffffffffffffff
	lduha	[%i6+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800040] = 00ff095a, %l5 = 00000000000000ff
	ldub	[%o1+0x041],%l5		! %l5 = 00000000000000ff
!	Mem[00000000300c1410] = 00ff0000, %f18 = 00000000
	lda	[%i3+%o5]0x81,%f18	! %f18 = 00ff0000
!	Starting 10 instruction Store Burst
!	%f4  = 35000000 00000000, Mem[0000000010041438] = 00000000 00000000
	std	%f4 ,[%i1+0x038]	! Mem[0000000010041438] = 35000000 00000000

p0_label_184:
!	%f4  = 35000000 00000000, Mem[0000000030041408] = ff000041 00000041
	stda	%f4 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 35000000 00000000
!	%l0 = 0000000000000000, Mem[00000000100c1428] = 6e87192100000001
	stx	%l0,[%i3+0x028]		! Mem[00000000100c1428] = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000030141408] = 0000ff00
	stba	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000ff00
!	%l4 = 00000000, %l5 = 000000ff, Mem[00000000100c1428] = 00000000 00000000
	stda	%l4,[%i3+0x028]%asi	! Mem[00000000100c1428] = 00000000 000000ff
!	Mem[0000000030141408] = 00ff0000, %l5 = 00000000000000ff
	swapa	[%i5+%o4]0x81,%l5	! %l5 = 0000000000ff0000
!	%f17 = 45a78c73, Mem[00000000100c143c] = 964ed241
	sta	%f17,[%i3+0x03c]%asi	! Mem[00000000100c143c] = 45a78c73
!	%f10 = 34ff373a 48310000, %l1 = 00000000ffffffb7
!	Mem[0000000030001430] = 2bd71cbc9dc1869c
	add	%i0,0x030,%g1
	stda	%f10,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030001430] = 000031483a37869c
!	Mem[0000000030181408] = 000000ff, %l0 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	%l6 = 00000000, %l7 = 0000003a, Mem[0000000010101408] = 00000000 ff7e00ff
	stda	%l6,[%i4+0x008]%asi	! Mem[0000000010101408] = 00000000 0000003a
!	Starting 10 instruction Load Burst
!	Mem[0000000010081420] = 0000ff50, %f5  = 00000000
	ld	[%i2+0x020],%f5 	! %f5 = 0000ff50

p0_label_185:
!	Mem[0000000010101424] = 0000005a, %l2 = 0000000000000035
	ldswa	[%i4+0x024]%asi,%l2	! %l2 = 000000000000005a
!	Mem[00000000100c142c] = 000000ff, %l0 = 00000000000000ff
	lduw	[%i3+0x02c],%l0		! %l0 = 00000000000000ff
!	Mem[0000000020800000] = 677eca09, %l3 = 0000000000000000
	ldsb	[%o1+0x001],%l3		! %l3 = 000000000000007e
!	Mem[0000000010181408] = 500bbc13, %f1  = 0000005a
	lda	[%i6+%o4]0x88,%f1 	! %f1 = 500bbc13
!	Mem[0000000010041400] = ffffffb7, %f16 = ff30ff34
	lda	[%i1+%g0]0x88,%f16	! %f16 = ffffffb7
!	Mem[0000000010081400] = 00000000 00000048, %l6 = 00000000, %l7 = 0000003a
	ldda	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000048 0000000000000000
!	Mem[0000000030001408] = 5a000000ff0000ff, %f26 = 00000000 000000ff
	ldda	[%i0+%o4]0x89,%f26	! %f26 = 5a000000 ff0000ff
!	Mem[00000000100c1400] = ff000000, %l0 = 00000000000000ff
	lduba	[%i3+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101408] = 000000000000003a, %f12 = 0000005a 000000ff
	ldda	[%i4+%o4]0x89,%f12	! %f12 = 00000000 0000003a
!	Starting 10 instruction Store Burst
!	%f0  = 00000000, Mem[0000000010181410] = 00000035
	sta	%f0 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000

p0_label_186:
!	Mem[0000000010181408] = 500bbc13, %l0 = 00000000000000ff
	ldstuba	[%i6+%o4]0x88,%l0	! %l0 = 00000013000000ff
!	Mem[0000000010041400] = ffffffb7, %l4 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l4	! %l4 = 00000000ffffffb7
!	%l0 = 00000013, %l1 = ffffffb7, Mem[0000000010001410] = ff000000 45a78c73
	stda	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000013 ffffffb7
!	Mem[0000000010001408] = 00000000, %l5 = 0000000000ff0000
	ldstuba	[%i0+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101410] = ff00dcff, %l4 = 00000000ffffffb7
	ldstuba	[%i4+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030001408] = ff0000ff, %l2 = 000000000000005a
	ldstuba	[%i0+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010101408] = 00000000, %l4 = 00000000000000ff
	swapa	[%i4+%o4]0x80,%l4	! %l4 = 0000000000000000
!	%f4  = 35000000 0000ff50, %l5 = 0000000000000000
!	Mem[0000000010041408] = 4800000000000000
	add	%i1,0x008,%g1
	stda	%f4,[%g1+%l5]ASI_PST8_P ! Mem[0000000010041408] = 4800000000000000
!	%l5 = 0000000000000000, Mem[0000000010101400] = 00000000
	stha	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001418] = 00001295, %l2 = 00000000000000ff
	ldub	[%i0+0x01a],%l2		! %l2 = 0000000000000012

p0_label_187:
!	Mem[00000000201c0000] = 00ff7e52, %l6 = 0000000000000048
	ldsha	[%o0+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181408] = ffbc0b50, %l7 = 0000000000000000
	lduha	[%i6+0x00a]%asi,%l7	! %l7 = 0000000000000b50
!	Mem[0000000030041410] = ff000000, %l3 = 000000000000007e
	ldsha	[%i1+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001420] = 0000ff50, %l5 = 0000000000000000
	ldsb	[%i0+0x022],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010181408] = ffbc0b500000005b, %l7 = 0000000000000b50
	ldx	[%i6+%o4],%l7		! %l7 = ffbc0b500000005b
!	Mem[0000000010001410] = 13000000, %f26 = 5a000000
	lda	[%i0+%o5]0x88,%f26	! %f26 = 13000000
!	Mem[0000000030181410] = 738ca745, %l2 = 0000000000000012
	lduba	[%i6+%o5]0x81,%l2	! %l2 = 0000000000000073
!	Mem[0000000010181400] = 00000000, %l1 = 00000000ffffffb7
	ldsha	[%i6+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = ff000000, %l3 = 0000000000000000
	ldsba	[%i5+%g0]0x81,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 00000035, %l5 = ffffffffffffffff
	swapa	[%i4+%g0]0x81,%l5	! %l5 = 0000000000000035

p0_label_188:
!	Mem[0000000010041410] = ff000000, %l5 = 0000000000000035
	swapa	[%i1+%o5]0x80,%l5	! %l5 = 00000000ff000000
!	%l7 = ffbc0b500000005b, Mem[0000000030101408] = 3a00000000000000
	stxa	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = ffbc0b500000005b
!	Mem[0000000010041404] = 5a000000, %l5 = 00000000ff000000
	ldstuba	[%i1+0x004]%asi,%l5	! %l5 = 0000005a000000ff
!	%l3 = ffffffffffffffff, Mem[00000000300c1400] = 500bbc13
	stha	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffbc13
!	%l0 = 0000000000000013, Mem[0000000030001410] = 00000000
	stba	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000013
!	%l4 = 0000000000000000, Mem[0000000030141400] = 000000ff
	stwa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	%f0  = 00000000 500bbc13, %l0 = 0000000000000013
!	Mem[0000000010001400] = 0000003500000000
	stda	%f0,[%i0+%l0]ASI_PST16_PL ! Mem[0000000010001400] = 13bc0b5000000000
!	Mem[000000001004140f] = 00000000, %l4 = 0000000000000000
	ldstub	[%i1+0x00f],%l4		! %l4 = 00000000000000ff
!	%l0 = 0000000000000013, Mem[0000000010101400] = 00000000
	stw	%l0,[%i4+%g0]		! Mem[0000000010101400] = 00000013
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00000000, %l5 = 000000000000005a
	lduwa	[%i6+%g0]0x80,%l5	! %l5 = 0000000000000000

p0_label_189:
!	Mem[00000000100c1400] = 000000ff, %l2 = 0000000000000073
	ldsha	[%i3+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1400] = ab2bb95e 13bcffff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i3+%g0]0x89,%l4	! %l4 = 0000000013bcffff 00000000ab2bb95e
!	Mem[00000000201c0000] = 00ff7e52, %l2 = 00000000000000ff
	ldsh	[%o0+%g0],%l2		! %l2 = 00000000000000ff
!	Mem[0000000030181408] = ff000000, %l5 = 00000000ab2bb95e
	lduwa	[%i6+%o4]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010101400] = 0000001300000000, %f22 = 75f01295 2cafd500
	ldda	[%i4+0x000]%asi,%f22	! %f22 = 00000013 00000000
!	Mem[000000001010143c] = 00735b41, %l7 = ffbc0b500000005b
	ldswa	[%i4+0x03c]%asi,%l7	! %l7 = 0000000000735b41
!	Mem[00000000211c0000] = ffff1327, %l2 = 00000000000000ff
	ldub	[%o2+0x001],%l2		! %l2 = 00000000000000ff
!	Mem[00000000100c1408] = 00000000, %f21 = 45a78c73
	lda	[%i3+%o4]0x88,%f21	! %f21 = 00000000
!	Mem[00000000201c0000] = 00ff7e52, %l4 = 0000000013bcffff
	ldsba	[%o0+0x001]%asi,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181404] = 000000d8, %l1 = 00000000, %l1 = 00000000
	add	%i6,0x04,%g1
	casa	[%g1]0x80,%l1,%l1	! %l1 = 00000000000000d8

p0_label_190:
!	%l0 = 0000000000000013, Mem[00000000218000c0] = fffff483, %asi = 80
	stha	%l0,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 0013f483
!	%f23 = 00000000, Mem[0000000010041400] = 00000000
	sta	%f23,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	%f20 = ff30ff34 00000000, %l4 = ffffffffffffffff
!	Mem[0000000010081410] = 0000000000000035
	add	%i2,0x010,%g1
	stda	%f20,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010081410] = 0000000034ff30ff
!	%f16 = ffffffb7 45a78c73, Mem[00000000300c1408] = 00000000 000000ab
	stda	%f16,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffffffb7 45a78c73
!	Mem[0000000010081400] = 4800000000000000, %l2 = 00000000000000ff, %l7 = 0000000000735b41
	casxa	[%i2]0x80,%l2,%l7	! %l7 = 4800000000000000
!	%f16 = ffffffb7 45a78c73 00ff0000 00000035
!	%f20 = ff30ff34 00000000 00000013 00000000
!	%f24 = 0000ff50 ff0000ff 13000000 ff0000ff
!	%f28 = 00003148 13bc0b50 48000000 00000000
	stda	%f16,[%i5]ASI_BLK_AIUSL	! Block Store to 0000000030141400
!	Mem[0000000010101410] = 7e46fc98, %l2 = 00000000000000ff
	ldstuba	[%i4+%o5]0x80,%l2	! %l2 = 0000007e000000ff
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000030101400] = ffffffff ff000000
	stda	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff 00000000
!	%f4  = 35000000 0000ff50, Mem[0000000030101400] = ff000000 00000000
	stda	%f4 ,[%i4+%g0]0x81	! Mem[0000000030101400] = 35000000 0000ff50
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (31)
!	Mem[0000000010141418] = 0000000000000000, %f2  = 00005148 f9951bcb
	ldda	[%i5+0x018]%asi,%f2 	! %f2  = 00000000 00000000

p0_label_191:
!	Mem[0000000030041400] = 00000000 98fc46e5, %l0 = 00000013, %l1 = 000000d8
	ldda	[%i1+%g0]0x81,%l0	! %l0 = 0000000000000000 0000000098fc46e5
!	Mem[0000000010101410] = 0000000098fc46ff, %f28 = 00003148 13bc0b50
	ldda	[%i4+%o5]0x88,%f28	! %f28 = 00000000 98fc46ff
!	Mem[0000000010141430] = 000000ffffff0000, %f30 = 48000000 00000000
	ldd	[%i5+0x030],%f30	! %f30 = 000000ff ffff0000
!	Mem[0000000010001410] = 00000013, %l6 = 00000000000000ff
	ldsba	[%i0+0x010]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041410] = 000000ff, %l7 = 4800000000000000
	ldsba	[%i1+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800040] = 00ff095a, %l1 = 0000000098fc46e5
	ldsha	[%o1+0x040]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141400] = 45a78c73, %l4 = ffffffffffffffff
	lduwa	[%i5+%g0]0x89,%l4	! %l4 = 0000000045a78c73
!	Mem[0000000010141420] = 7e4b9eff6f69bd3c, %l5 = 00000000ff000000
	ldx	[%i5+0x020],%l5		! %l5 = 7e4b9eff6f69bd3c
!	Mem[0000000010001400] = 13bc0b50, %l6 = 0000000000000000
	lduba	[%i0+%g0]0x80,%l6	! %l6 = 0000000000000013
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 48000000, %l3 = ffffffffffffffff
	swapa	[%i2+%g0]0x80,%l3	! %l3 = 0000000048000000

p0_label_192:
!	%f15 = 35000000, Mem[0000000010101400] = 00000013
	st	%f15,[%i4+%g0]		! Mem[0000000010101400] = 35000000
!	%l3 = 0000000048000000, Mem[0000000030081410] = ffd9ffff9c3087ad
	stxa	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000000048000000
!	%l0 = 0000000000000000, Mem[0000000010181408] = ffbc0b500000005b
	stxa	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000030081410] = 00000000
	stwa	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	Mem[00000000100c1400] = ff000000, %l7 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010181408] = 00000000, %l5 = 7e4b9eff6f69bd3c
	swapa	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = f9951bcb, %l4 = 0000000045a78c73
	ldstuba	[%i5+%o4]0x80,%l4	! %l4 = 000000f9000000ff
!	%l2 = 000000000000007e, Mem[0000000030081410] = 00000000
	stba	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000007e
!	Mem[00000000201c0000] = 00ff7e52, %l7 = 00000000000000ff
	ldstub	[%o0+%g0],%l7		! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000035, %l1 = 00000000000000ff
	ldsha	[%i1+%o4]0x89,%l1	! %l1 = 0000000000000035

p0_label_193:
!	Mem[0000000010001410] = 00000013ffffffb7, %f22 = 00000013 00000000
	ldda	[%i0+%o5]0x80,%f22	! %f22 = 00000013 ffffffb7
!	Mem[0000000010181438] = ff5a66fe, %l0 = 0000000000000000
	lduwa	[%i6+0x038]%asi,%l0	! %l0 = 00000000ff5a66fe
!	Mem[0000000010041420] = 00000000, %l2 = 000000000000007e
	ldsba	[%i1+0x021]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041410] = 000000ff, %l6 = 0000000000000013
	lduwa	[%i1+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[00000000201c0000] = ffff7e52, %l4 = 00000000000000f9
	lduha	[%o0+0x000]%asi,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030041408] = 0000000000000035, %f14 = 0000005a 35000000
	ldda	[%i1+%o4]0x89,%f14	! %f14 = 00000000 00000035
!	Mem[0000000010101410] = ff46fc9800000000, %f12 = 00000000 0000003a
	ldda	[%i4+%o5]0x80,%f12	! %f12 = ff46fc98 00000000
!	Mem[0000000010181438] = ff5a66feffac2efd, %l6 = 00000000000000ff
	ldxa	[%i6+0x038]%asi,%l6	! %l6 = ff5a66feffac2efd
!	Mem[0000000010141428] = 0073006ee10bde60, %f10 = 34ff373a 48310000
	ldda	[%i5+0x028]%asi,%f10	! %f10 = 0073006e e10bde60
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = ff000000, %l5 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l5	! %l5 = 00000000ff000000

p0_label_194:
!	%l2 = 0000000000000000, Mem[0000000010001408] = 00000000
	stha	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	Mem[0000000010081410] = 0000000034ff30ff, %l1 = 0000000000000035, %l7 = 0000000000000000
	add	%i2,0x10,%g1
	casxa	[%g1]0x80,%l1,%l7	! %l7 = 0000000034ff30ff
!	Mem[00000000100c1410] = ffdc0000, %l4 = 000000000000ffff
	ldstuba	[%i3+%o5]0x80,%l4	! %l4 = 000000ff000000ff
!	%l3 = 0000000048000000, Mem[0000000030181408] = ff000000
	stwa	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = 48000000
!	Mem[00000000300c1400] = ffffbc13, %l0 = 00000000ff5a66fe
	swapa	[%i3+%g0]0x81,%l0	! %l0 = 00000000ffffbc13
!	%l1 = 0000000000000035, Mem[0000000010081410] = 00000000
	stba	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 35000000
!	%l5 = 00000000ff000000, Mem[0000000010181408] = 6f69bd3c
	stba	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 0069bd3c
!	%l0 = 00000000ffffbc13, Mem[00000000300c1408] = ffffffb7
	stba	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 13ffffb7
!	Mem[0000000010141410] = 000000ff, %l3 = 0000000048000000
	swapa	[%i5+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff5a66fe, %f11 = e10bde60
	lda	[%i3+%g0]0x81,%f11	! %f11 = ff5a66fe

p0_label_195:
!	Mem[0000000010181400] = 00000000, %l1 = 0000000000000035
	lduba	[%i6+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101408] = 500bbcff, %l6 = ff5a66feffac2efd
	ldsba	[%i4+%o4]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181400] = 00000000000000d8, %l7 = 0000000034ff30ff
	ldxa	[%i6+%g0]0x80,%l7	! %l7 = 00000000000000d8
!	Mem[0000000010081428] = 00000000, %l1 = 0000000000000000
	lduwa	[%i2+0x028]%asi,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1400] = fe665aff, %l3 = 00000000000000ff
	lduba	[%i3+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181428] = 000000ad, %f12 = ff46fc98
	lda	[%i6+0x028]%asi,%f12	! %f12 = 000000ad
!	Mem[0000000010041410] = 0000003522ec64ac, %l1 = 0000000000000000
	ldxa	[%i1+%o5]0x80,%l1	! %l1 = 0000003522ec64ac
!	Mem[0000000020800040] = 00ff095a, %l3 = 00000000000000ff
	lduh	[%o1+0x040],%l3		! %l3 = 00000000000000ff
!	Mem[0000000030181408] = 48000000, %l3 = 00000000000000ff
	ldswa	[%i6+%o4]0x81,%l3	! %l3 = 0000000048000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 45a78c73, %l2 = 0000000000000000
	swapa	[%i6+%o5]0x89,%l2	! %l2 = 0000000045a78c73

p0_label_196:
!	Mem[0000000010101408] = ff000000, %l3 = 0000000048000000
	swapa	[%i4+%o4]0x88,%l3	! %l3 = 00000000ff000000
!	%f30 = 000000ff ffff0000, Mem[0000000030001410] = 00000013 ff000000
	stda	%f30,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff ffff0000
!	%f16 = ffffffb7 45a78c73 00ff0000 00000035
!	%f20 = ff30ff34 00000000 00000013 ffffffb7
!	%f24 = 0000ff50 ff0000ff 13000000 ff0000ff
!	%f28 = 00000000 98fc46ff 000000ff ffff0000
	stda	%f16,[%i6]ASI_BLK_AIUS	! Block Store to 0000000030181400
!	Mem[0000000010001408] = 00000000, %l1 = 0000003522ec64ac
	ldstuba	[%i0+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101430] = 0000005a, %l0 = 00000000ffffbc13
	swap	[%i4+0x030],%l0		! %l0 = 000000000000005a
!	Mem[000000001000140e] = 000000ff, %l7 = 00000000000000d8
	ldstub	[%i0+0x00e],%l7		! %l7 = 00000000000000ff
!	%l3 = 00000000ff000000, Mem[0000000030081408] = 00000000
	stwa	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = ff000000
!	Mem[0000000030101400] = 00000035, %l4 = 00000000000000ff
	ldstuba	[%i4+%g0]0x89,%l4	! %l4 = 00000035000000ff
!	%l5 = 00000000ff000000, Mem[0000000010001408] = ffff0000000000ff
	stxa	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000000, %l3 = 00000000ff000000
	ldswa	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000000

p0_label_197:
!	Mem[0000000010001400] = 00000000500bbc13, %l0 = 000000000000005a
	ldxa	[%i0+%g0]0x88,%l0	! %l0 = 00000000500bbc13
!	Mem[0000000010141430] = 000000ffffff0000, %l1 = 0000000000000000
	ldx	[%i5+0x030],%l1		! %l1 = 000000ffffff0000
!	Mem[0000000010081400] = ffffffff, %l2 = 0000000045a78c73
	lduha	[%i2+%g0]0x88,%l2	! %l2 = 000000000000ffff
!	Mem[00000000201c0000] = ffff7e52, %l7 = 0000000000000000
	lduba	[%o0+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041410] = ff000000, %l5 = 00000000ff000000
	lduwa	[%i1+%o5]0x89,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010001410] = b7ffffff13000000, %l1 = 000000ffffff0000
	ldxa	[%i0+%o5]0x88,%l1	! %l1 = b7ffffff13000000
!	Mem[0000000030141410] = 00000000, %l6 = ffffffffffffffff
	ldsba	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l5 = 00000000ff000000
	ldsha	[%i3+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[000000001008140c] = 00000000, %f8  = ff000000
	lda	[%i2+0x00c]%asi,%f8 	! %f8 = 00000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000010181410] = 00000000, %l2 = 000000000000ffff
	ldstuba	[%i6+%o5]0x80,%l2	! %l2 = 00000000000000ff

p0_label_198:
!	Mem[0000000010001410] = 13000000, %l4 = 0000000000000035
	swapa	[%i0+%o5]0x88,%l4	! %l4 = 0000000013000000
!	%l1 = b7ffffff13000000, Mem[00000000300c1410] = 0000ff00
	stha	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	%l2 = 0000000000000000, Mem[000000001008141c] = 2cafd500, %asi = 80
	stwa	%l2,[%i2+0x01c]%asi	! Mem[000000001008141c] = 00000000
!	%f4  = 35000000 0000ff50, Mem[0000000030001408] = ff0000ff 5a000000
	stda	%f4 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 35000000 0000ff50
!	Mem[0000000010181410] = 000000ff, %l7 = 00000000000000ff
	swapa	[%i6+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%f28 = 00000000 98fc46ff, Mem[0000000010141430] = 000000ff ffff0000
	stda	%f28,[%i5+0x030]%asi	! Mem[0000000010141430] = 00000000 98fc46ff
!	Mem[0000000030041410] = ff000000, %l2 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000010001408] = 000000ff
	stwa	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	%l0 = 500bbc13, %l1 = 13000000, Mem[0000000010181400] = 00000000 000000d8
	stda	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 500bbc13 13000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 35000000, %l3 = 0000000000000000
	ldswa	[%i2+0x010]%asi,%l3	! %l3 = 0000000035000000

p0_label_199:
!	Mem[0000000030041410] = ff0000ff, %l6 = 0000000000000000
	ldsha	[%i1+%o5]0x81,%l6	! %l6 = ffffffffffffff00
!	Mem[00000000211c0000] = ffff1327, %l5 = 0000000000000000
	ldsb	[%o2+0x001],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000030101410] = ffdc00ff, %l2 = 0000000000000000
	ldsha	[%i4+%o5]0x81,%l2	! %l2 = ffffffffffffffdc
!	Mem[00000000100c1408] = 0000000000000000, %l6 = ffffffffffffff00
	ldxa	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041410] = ff0000ff, %l3 = 0000000035000000
	ldsha	[%i1+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101410] = 98fc46ff, %l4 = 0000000013000000
	lduwa	[%i4+%o5]0x88,%l4	! %l4 = 0000000098fc46ff
!	Mem[0000000030141408] = 00000035, %l6 = 0000000000000000
	ldsba	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000035
!	Mem[0000000030001400] = 0000ff34, %l2 = ffffffffffffffdc
	ldswa	[%i0+%g0]0x81,%l2	! %l2 = 000000000000ff34
!	Mem[0000000030041410] = ff0000ff, %f17 = 45a78c73
	lda	[%i1+%o5]0x89,%f17	! %f17 = ff0000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 00000048, %l6 = 0000000000000035
	swapa	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000048

p0_label_200:
!	%l2 = 000000000000ff34, Mem[0000000010001400] = 13bc0b5000000000
	stx	%l2,[%i0+%g0]		! Mem[0000000010001400] = 000000000000ff34
!	Mem[0000000010081410] = 35000000, %l4 = 0000000098fc46ff
	ldstuba	[%i2+%o5]0x80,%l4	! %l4 = 00000035000000ff
!	Mem[0000000030101410] = ff00dcff, %l6 = 0000000000000048
	swapa	[%i4+%o5]0x89,%l6	! %l6 = 00000000ff00dcff
!	%l0 = 00000000500bbc13, Mem[0000000010041400] = 00000000ff000000
	stx	%l0,[%i1+%g0]		! Mem[0000000010041400] = 00000000500bbc13
!	%f20 = ff30ff34, Mem[0000000030101400] = ff000000
	sta	%f20,[%i4+%g0]0x81	! Mem[0000000030101400] = ff30ff34
!	%l3 = 00000000000000ff, Mem[00000000300c1400] = ff5a66fe5eb92bab
	stxa	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000000000ff
!	%l0 = 00000000500bbc13, Mem[0000000030101408] = 500bbcff
	stba	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 500bbc13
!	Mem[0000000010001408] = 00000000, %l1 = b7ffffff13000000
	ldstuba	[%i0+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%f14 = 00000000 00000035, %l4 = 0000000000000035
!	Mem[0000000030041438] = 0000000000000000
	add	%i1,0x038,%g1
	stda	%f14,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030041438] = 3500000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 3500000000000000, %f26 = 13000000 ff0000ff
	ldda	[%i1+%o4]0x81,%f26	! %f26 = 35000000 00000000

p0_label_201:
!	Mem[0000000020800000] = 677eca09, %l0 = 00000000500bbc13
	ldsb	[%o1+%g0],%l0		! %l0 = 0000000000000067
!	Mem[0000000010141438] = ffffffff, %l2 = 000000000000ff34
	ldsha	[%i5+0x03a]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000021800140] = b0ffab40, %l0 = 0000000000000067
	ldsh	[%o3+0x140],%l0		! %l0 = ffffffffffffb0ff
!	Mem[00000000211c0000] = ffff1327, %l6 = 00000000ff00dcff
	lduba	[%o2+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001408] = 350000000000ff50, %l4 = 0000000000000035
	ldxa	[%i0+%o4]0x89,%l4	! %l4 = 350000000000ff50
!	Mem[0000000010181408] = 3cbd6900, %l2 = ffffffffffffffff
	lduwa	[%i6+%o4]0x88,%l2	! %l2 = 000000003cbd6900
!	Mem[0000000030181408] = 00ff0000, %l0 = ffffffffffffb0ff
	lduwa	[%i6+%o4]0x81,%l0	! %l0 = 0000000000ff0000
!	Mem[0000000010001428] = 00000000 000000ff, %l4 = 0000ff50, %l5 = ffffffff
	ldda	[%i0+0x028]%asi,%l4	! %l4 = 0000000000000000 00000000000000ff
!	Mem[0000000010081430] = 00003148, %l5 = 00000000000000ff
	lduh	[%i2+0x030],%l5		! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 000000ff, %l1 = 0000000000000000
	swapa	[%i2+%o5]0x88,%l1	! %l1 = 00000000000000ff

p0_label_202:
!	Mem[0000000010181421] = 5148fd82, %l1 = 00000000000000ff
	ldstuba	[%i6+0x021]%asi,%l1	! %l1 = 00000048000000ff
!	%l1 = 0000000000000048, Mem[0000000010181410] = ff000000
	stba	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = 48000000
!	Code Fragment 3
p0_fragment_7:
!	%l0 = 0000000000ff0000
	setx	0x3816aeefeed701a3,%g7,%l0 ! %l0 = 3816aeefeed701a3
!	%l1 = 0000000000000048
	setx	0x31d8a2783724cb57,%g7,%l1 ! %l1 = 31d8a2783724cb57
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3816aeefeed701a3
	setx	0x7115934fd61e7246,%g7,%l0 ! %l0 = 7115934fd61e7246
!	%l1 = 31d8a2783724cb57
	setx	0x279aaa301fc19dab,%g7,%l1 ! %l1 = 279aaa301fc19dab
!	Mem[0000000030001400] = 0000ff34, %l2 = 000000003cbd6900
	ldstuba	[%i0+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%f6  = 48310000 ff000000, Mem[0000000010041410] = 35000000 ac64ec22
	stda	%f6 ,[%i1+%o5]0x88	! Mem[0000000010041410] = 48310000 ff000000
!	%f10 = 0073006e, Mem[0000000010001410] = 35000000
	st	%f10,[%i0+%o5]		! Mem[0000000010001410] = 0073006e
!	%l6 = 00000000000000ff, Mem[000000001018142c] = 000000ea
	stb	%l6,[%i6+0x02c]		! Mem[000000001018142c] = ff0000ea
!	Mem[0000000010101412] = ff46fc98, %l3 = 00000000000000ff
	ldstuba	[%i4+0x012]%asi,%l3	! %l3 = 000000fc000000ff
!	%l0 = 7115934fd61e7246, Mem[0000000010101400] = 3500000000000000
	stx	%l0,[%i4+%g0]		! Mem[0000000010101400] = 7115934fd61e7246
!	Starting 10 instruction Load Burst
!	Mem[0000000010081430] = 00003148, %l5 = 0000000000000000
	lduh	[%i2+0x032],%l5		! %l5 = 0000000000003148

p0_label_203:
!	Mem[0000000010081410] = 00000000, %l1 = 279aaa301fc19dab
	ldsba	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = 00000000 ff0000ff, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i2+%o4]0x88,%l6	! %l6 = 00000000ff0000ff 0000000000000000
!	Mem[0000000030001410] = 0000ffff ff000000, %l6 = ff0000ff, %l7 = 00000000
	ldda	[%i0+%o5]0x81,%l6	! %l6 = 000000000000ffff 00000000ff000000
!	Mem[0000000030101410] = 48000000, %l5 = 0000000000003148
	lduba	[%i4+%o5]0x81,%l5	! %l5 = 0000000000000048
!	Mem[0000000030001408] = 0000ff50, %l5 = 0000000000000048
	lduha	[%i0+%o4]0x89,%l5	! %l5 = 000000000000ff50
!	Mem[00000000100c1400] = 00000000000000ff, %l7 = 00000000ff000000
	ldxa	[%i3+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141408] = ff951bcb5e000000, %f30 = 000000ff ffff0000
	ldda	[%i5+%o4]0x80,%f30	! %f30 = ff951bcb 5e000000
!	Mem[0000000030001400] = ff00ff34, %f5  = 0000ff50
	lda	[%i0+%g0]0x81,%f5 	! %f5 = ff00ff34
!	Mem[0000000030001400] = ff00006e34ff00ff, %l5 = 000000000000ff50
	ldxa	[%i0+%g0]0x89,%l5	! %l5 = ff00006e34ff00ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010141418] = 00000000, %l7 = 000000ff, %l4 = 00000000
	add	%i5,0x18,%g1
	casa	[%g1]0x80,%l7,%l4	! %l4 = 0000000000000000

p0_label_204:
!	Mem[0000000030101400] = 34ff30ff, %l6 = 000000000000ffff
	ldstuba	[%i4+%g0]0x89,%l6	! %l6 = 000000ff000000ff
!	%l7 = 00000000000000ff, Mem[0000000030101410] = 40577e5100000048
	stxa	%l7,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000000000ff
!	Mem[0000000030101400] = 34ff30ff, %l3 = 00000000000000fc
	ldstuba	[%i4+%g0]0x89,%l3	! %l3 = 000000ff000000ff
!	%l6 = 00000000000000ff, Mem[0000000010181400] = 0000001313bc0b50
	stxa	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000000000ff
!	%l2 = 0000000000000000, Mem[00000000211c0000] = ffff1327
	stb	%l2,[%o2+%g0]		! Mem[00000000211c0000] = 00ff1327
!	%l4 = 00000000, %l5 = 34ff00ff, Mem[0000000030101408] = 13bc0b50 0000005b
	stda	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 34ff00ff
!	%l0 = 7115934fd61e7246, Mem[000000001014141e] = 00000000, %asi = 80
	stha	%l0,[%i5+0x01e]%asi	! Mem[000000001014141c] = 00007246
!	%f10 = 0073006e ff5a66fe, %l5 = ff00006e34ff00ff
!	Mem[0000000030141410] = 0000000034ff30ff
	add	%i5,0x010,%g1
	stda	%f10,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030141410] = fe665aff6e007300
!	%l7 = 00000000000000ff, Mem[00000000300c1410] = 0000000000000000
	stxa	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 13ffffb745a78c73, %f6  = 48310000 ff000000
	ldda	[%i3+%o4]0x81,%f6 	! %f6  = 13ffffb7 45a78c73

p0_label_205:
!	Mem[0000000010041434] = 48000000, %l3 = 00000000000000ff
	lduh	[%i1+0x036],%l3		! %l3 = 0000000000000000
!	Mem[0000000010001400] = 34ff000000000000, %f4  = 35000000 ff00ff34
	ldda	[%i0+%g0]0x88,%f4 	! %f4  = 34ff0000 00000000
!	Mem[0000000010001410] = 6e007300, %f9  = 00000000
	lda	[%i0+%o5]0x88,%f9 	! %f9 = 6e007300
!	Mem[0000000030141408] = 00ff0000 00000035, %l4 = 00000000, %l5 = 34ff00ff
	ldda	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000035 0000000000ff0000
!	Mem[0000000010101400] = 7115934fd61e7246, %f2  = 00000000 00000000
	ldda	[%i4+%g0]0x80,%f2 	! %f2  = 7115934f d61e7246
!	Mem[0000000010141410] = 0000000048000000, %f22 = 00000013 ffffffb7
	ldda	[%i5+%o5]0x88,%f22	! %f22 = 00000000 48000000
!	Mem[00000000211c0000] = 00ff1327, %l7 = 00000000000000ff
	ldub	[%o2+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000030141408] = 00000035, %l5 = 0000000000ff0000
	ldsha	[%i5+%o4]0x89,%l5	! %l5 = 0000000000000035
!	Mem[0000000030041410] = ff0000ff000000ff, %l5 = 0000000000000035
	ldxa	[%i1+%o5]0x81,%l5	! %l5 = ff0000ff000000ff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 00000000, Mem[00000000100c1430] = be0f56d7 ffffffff
	stda	%l2,[%i3+0x030]%asi	! Mem[00000000100c1430] = 00000000 00000000

p0_label_206:
!	%f0  = 00000000 500bbc13, Mem[0000000010101410] = 98ff46ff 00000000
	stda	%f0 ,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000 500bbc13
!	Mem[0000000010041434] = 48000000, %l5 = ff0000ff000000ff, %asi = 80
	swapa	[%i1+0x034]%asi,%l5	! %l5 = 0000000048000000
!	%f20 = ff30ff34 00000000, Mem[0000000030181400] = ffffffb7 45a78c73
	stda	%f20,[%i6+%g0]0x81	! Mem[0000000030181400] = ff30ff34 00000000
!	Mem[0000000030081400] = 00000000, %l4 = 0000000000000035
	ldstuba	[%i2+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000211c0001] = 00ff1327, %l1 = 0000000000000000
	ldstuba	[%o2+0x001]%asi,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010101400] = 7115934fd61e7246, %l5 = 0000000048000000, %l1 = 00000000000000ff
	casxa	[%i4]0x80,%l5,%l1	! %l1 = 7115934fd61e7246
!	Mem[0000000030101408] = 00000000, %l3 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001410] = ffff0000, %l2 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%l5 = 0000000048000000, Mem[0000000010081420] = 0000ff50, %asi = 80
	stha	%l5,[%i2+0x020]%asi	! Mem[0000000010081420] = 0000ff50
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ff0000009c35a6ff, %l6 = 00000000000000ff
	ldxa	[%i2+%g0]0x81,%l6	! %l6 = ff0000009c35a6ff

p0_label_207:
!	Mem[0000000010181408] = 0069bd3c, %l6 = ff0000009c35a6ff
	ldsha	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000069
!	Mem[0000000010081424] = ff0000ff, %l5 = 0000000048000000
	ldsh	[%i2+0x024],%l5		! %l5 = ffffffffffffff00
!	Mem[0000000030041408] = 35000000 00000000, %l6 = 00000069, %l7 = 00000000
	ldda	[%i1+%o4]0x81,%l6	! %l6 = 0000000035000000 0000000000000000
!	Mem[00000000218001c0] = 19eabc74, %l2 = 0000000000000000
	lduba	[%o3+0x1c0]%asi,%l2	! %l2 = 0000000000000019
!	Mem[0000000030001400] = 34ff00ff, %l1 = 7115934fd61e7246
	lduwa	[%i0+%g0]0x89,%l1	! %l1 = 0000000034ff00ff
!	Mem[0000000010101400] = 7115934f, %l4 = 0000000000000000
	lduha	[%i4+0x002]%asi,%l4	! %l4 = 000000000000934f
!	Mem[0000000010081410] = 00000000, %l4 = 000000000000934f
	lduwa	[%i2+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001404] = 0000ff34, %l6 = 0000000035000000
	lduba	[%i0+0x006]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041410] = ff0000ff, %l0 = 7115934fd61e7246
	lduwa	[%i1+%o5]0x89,%l0	! %l0 = 00000000ff0000ff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000030081400] = 000000ff
	stha	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000

p0_label_208:
!	Mem[0000000010141408] = ff951bcb, %l6 = 00000000000000ff
	ldsha	[%i5+%o4]0x80,%l6	! %l6 = ffffffffffffff95
!	%f18 = 00ff0000 00000035, Mem[0000000030041408] = 00000035 00000000
	stda	%f18,[%i1+%o4]0x89	! Mem[0000000030041408] = 00ff0000 00000035
!	%l4 = 00000000, %l5 = ffffff00, Mem[0000000010041400] = 00000000 500bbc13
	std	%l4,[%i1+%g0]		! Mem[0000000010041400] = 00000000 ffffff00
!	%l4 = 0000000000000000, Mem[0000000030001410] = ff00ffff
	stba	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000ffff
!	%l6 = ffffffffffffff95, Mem[00000000100c1408] = 0000000000000000, %asi = 80
	stxa	%l6,[%i3+0x008]%asi	! Mem[00000000100c1408] = ffffffffffffff95
!	Mem[0000000030001410] = ffff0000, %l6 = ffffffffffffff95
	ldstuba	[%i0+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%f7  = 45a78c73, Mem[0000000030041400] = 00000000
	sta	%f7 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 45a78c73
!	%l2 = 0000000000000019, Mem[0000000030041410] = ff0000ff
	stwa	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000019
!	%l1 = 0000000034ff00ff, Mem[0000000030181400] = ff30ff3400000000
	stxa	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000034ff00ff
!	Starting 10 instruction Load Burst
!	%f12 = 000000ad, %f29 = 98fc46ff, %f10 = 0073006e
	fadds	%f12,%f29,%f10		! %l0 = 00000000ff000121, Unfinished, %fsr = 0000000400

p0_label_209:
!	Mem[00000000100c1430] = 00000000, %l5 = ffffffffffffff00
	lduba	[%i3+0x033]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = cb1b95ff, %l3 = 0000000000000000
	ldsba	[%i5+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010141410] = 00000048, %l2 = 0000000000000019
	lduha	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041410] = 000000ff, %f21 = 00000000
	lda	[%i1+%o5]0x80,%f21	! %f21 = 000000ff
!	Mem[0000000010101410] = 500bbc13, %l7 = 0000000000000000
	lduha	[%i4+%o5]0x88,%l7	! %l7 = 000000000000bc13
!	Mem[00000000100c1400] = ff000000, %l5 = 0000000000000000
	ldsba	[%i3+%g0]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010101410] = 500bbc13, %f16 = ffffffb7
	lda	[%i4+%o5]0x88,%f16	! %f16 = 500bbc13
!	Mem[0000000010141410] = 48000000, %l5 = ffffffffffffffff
	ldswa	[%i5+%o5]0x88,%l5	! %l5 = 0000000048000000
!	Mem[00000000211c0000] = 00ff1327, %l3 = ffffffffffffffff
	lduh	[%o2+%g0],%l3		! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181428] = 000000adff0000ea, %l1 = 0000000034ff00ff, %l3 = 00000000000000ff
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l1,%l3	! %l3 = 000000adff0000ea

p0_label_210:
!	%f16 = 500bbc13 ff0000ff 00ff0000 00000035
!	%f20 = ff30ff34 000000ff 00000000 48000000
!	%f24 = 0000ff50 ff0000ff 35000000 00000000
!	%f28 = 00000000 98fc46ff ff951bcb 5e000000
	stda	%f16,[%i4]ASI_BLK_AIUSL	! Block Store to 0000000030101400
!	%l3 = 000000adff0000ea, Mem[0000000010101410] = 13bc0b50
	stba	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = eabc0b50
!	%f14 = 00000000 00000035, Mem[0000000030041410] = 00000019 ff000000
	stda	%f14,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000 00000035
!	%f8  = 00000000 6e007300, Mem[0000000010081410] = 00000000 ff30ff34
	stda	%f8 ,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000 6e007300
!	Mem[0000000010081413] = 0073006e, %l0 = 00000000ff000121
	ldstuba	[%i2+0x013]%asi,%l0	! %l0 = 0000006e000000ff
!	Mem[0000000030141408] = 35000000, %l3 = 000000adff0000ea
	swapa	[%i5+%o4]0x81,%l3	! %l3 = 0000000035000000
!	%f7  = 45a78c73, Mem[0000000030081410] = 7e000000
	sta	%f7 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 45a78c73
!	%f16 = 500bbc13 ff0000ff 00ff0000 00000035
!	%f20 = ff30ff34 000000ff 00000000 48000000
!	%f24 = 0000ff50 ff0000ff 35000000 00000000
!	%f28 = 00000000 98fc46ff ff951bcb 5e000000
	stda	%f16,[%i0]ASI_BLK_P	! Block Store to 0000000010001400
!	%f1  = 500bbc13, Mem[0000000010001428] = 35000000
	st	%f1 ,[%i0+0x028]	! Mem[0000000010001428] = 500bbc13
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (33)
!	Mem[0000000030101408] = 00000035, %f8  = 00000000
	lda	[%i4+%o4]0x89,%f8 	! %f8 = 00000035

p0_label_211:
!	Mem[0000000010001410] = ff30ff34, %l6 = 0000000000000000
	lduh	[%i0+%o5],%l6		! %l6 = 000000000000ff30
!	Mem[0000000010041400] = 00000000, %f6  = 13ffffb7
	lda	[%i1+%g0]0x80,%f6 	! %f6 = 00000000
!	Mem[0000000010041408] = 00000035, %l0 = 000000000000006e
	ldsha	[%i1+%o4]0x88,%l0	! %l0 = 0000000000000035
!	Mem[0000000030081410] = 45a78c73, %l5 = 0000000048000000
	lduba	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000045
!	Mem[0000000010081410] = 00000000ff007300, %f22 = 00000000 48000000
	ldda	[%i2+%o5]0x88,%f22	! %f22 = 00000000 ff007300
!	Mem[0000000010041410] = 000000ff00003148, %f4  = 34ff0000 00000000
	ldda	[%i1+0x010]%asi,%f4 	! %f4  = 000000ff 00003148
!	Mem[0000000030081400] = 00000000, %f27 = 00000000
	lda	[%i2+%g0]0x89,%f27	! %f27 = 00000000
!	Mem[0000000030101410] = ff000000, %l4 = 0000000000000000
	ldswa	[%i4+%o5]0x81,%l4	! %l4 = ffffffffff000000
!	Mem[0000000010001400] = 500bbc13, %f0  = 00000000
	lda	[%i0+%g0]0x80,%f0 	! %f0 = 500bbc13
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 00000035, %l6 = 000000000000ff30
	swapa	[%i1+%o4]0x89,%l6	! %l6 = 0000000000000035

p0_label_212:
!	%f26 = 35000000 00000000, Mem[0000000010181408] = 0069bd3c 00000000
	stda	%f26,[%i6+%o4]0x80	! Mem[0000000010181408] = 35000000 00000000
!	%f6  = 00000000, Mem[0000000010141408] = ff951bcb
	sta	%f6 ,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	Mem[0000000010081400] = ffffffff, %l3 = 0000000035000000
	ldstuba	[%i2+%g0]0x80,%l3	! %l3 = 000000ff000000ff
!	%l2 = 0000000000000000, Mem[00000000300c1408] = b7ffff13
	stha	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = b7ff0000
!	%l5 = 0000000000000045, Mem[0000000030101408] = 35000000
	stwa	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000045
!	%l6 = 0000000000000035, Mem[0000000010041420] = 00000000000000e5
	stx	%l6,[%i1+0x020]		! Mem[0000000010041420] = 0000000000000035
!	Mem[0000000020800040] = 00ff095a, %l7 = 000000000000bc13
	ldstuba	[%o1+0x040]%asi,%l7	! %l7 = 00000000000000ff
!	%f30 = ff951bcb 5e000000, Mem[00000000100c1400] = ff000000 00000000
	stda	%f30,[%i3+0x000]%asi	! Mem[00000000100c1400] = ff951bcb 5e000000
!	Mem[000000001014143c] = c733f359, %l7 = 0000000000000000
	ldstuba	[%i5+0x03c]%asi,%l7	! %l7 = 000000c7000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 35000000, %l1 = 0000000034ff00ff
	lduba	[%i6+%o4]0x80,%l1	! %l1 = 0000000000000035

p0_label_213:
!	Mem[0000000010001410] = ff30ff34, %f24 = 0000ff50
	lda	[%i0+%o5]0x80,%f24	! %f24 = ff30ff34
!	Mem[0000000030141410] = fe665aff, %l6 = 0000000000000035
	lduha	[%i5+%o5]0x81,%l6	! %l6 = 000000000000fe66
!	Mem[0000000010081410] = ff007300, %l6 = 000000000000fe66
	lduha	[%i2+%o5]0x88,%l6	! %l6 = 0000000000007300
!	Mem[0000000030041400] = 45a78c73, %l4 = ffffffffff000000
	lduwa	[%i1+%g0]0x81,%l4	! %l4 = 0000000045a78c73
!	Mem[0000000010041408] = 00000035, %l4 = 0000000045a78c73
	lduba	[%i1+%o4]0x88,%l4	! %l4 = 0000000000000035
	membar	#Sync			! Added by membar checker (34)
!	Mem[0000000030101400] = ff0000ff 13bc0b50 00000045 0000ff00
!	Mem[0000000030101410] = ff000000 34ff30ff 00000048 00000000
!	Mem[0000000030101420] = ff0000ff 50ff0000 00000000 00000035
!	Mem[0000000030101430] = ff46fc98 00000000 0000005e cb1b95ff
	ldda	[%i4]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	%l6 = 0000000000007300, Mem[0000000010001400] = 500bbc13
	stba	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 000bbc13
!	Mem[0000000030101408] = 45000000, %l3 = 00000000000000ff
	ldsba	[%i4+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141400] = ffffc700ffffffb7, %l6 = 0000000000007300
	ldxa	[%i5+%g0]0x80,%l6	! %l6 = ffffc700ffffffb7
!	Starting 10 instruction Store Burst
!	%f1  = 500bbc13, Mem[0000000030041408] = 0000ff30
	sta	%f1 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 500bbc13

p0_label_214:
!	Mem[0000000010081408] = ff0000ff, %l7 = 00000000000000c7
	ldstuba	[%i2+%o4]0x88,%l7	! %l7 = 000000ff000000ff
!	Mem[000000001004142c] = a7e1c4ff, %l0 = 0000000000000035, %asi = 80
	swapa	[%i1+0x02c]%asi,%l0	! %l0 = 00000000a7e1c4ff
!	%l1 = 0000000000000035, Mem[0000000010041408] = 00000035
	stha	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000035
!	%l6 = ffffc700ffffffb7, Mem[0000000020800000] = 677eca09
	sth	%l6,[%o1+%g0]		! Mem[0000000020800000] = ffb7ca09
	membar	#Sync			! Added by membar checker (35)
!	%l0 = 00000000a7e1c4ff, Mem[0000000030101410] = 000000ff
	stwa	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = a7e1c4ff
!	Mem[0000000020800001] = ffb7ca09, %l4 = 0000000000000035
	ldstuba	[%o1+0x001]%asi,%l4	! %l4 = 000000b7000000ff
!	Mem[000000001008142c] = 000000ff, %l2 = 00000000, %l4 = 000000b7
	add	%i2,0x2c,%g1
	casa	[%g1]0x80,%l2,%l4	! %l4 = 00000000000000ff
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010181400] = ff000000 00000000
	stda	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 00000000
!	%f26 = 00000000 00000035, Mem[0000000030141400] = 45a78c73 ffffffb7
	stda	%f26,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 00000035
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = fe665aff, %l5 = 0000000000000045
	ldsha	[%i5+%o5]0x81,%l5	! %l5 = fffffffffffffe66

p0_label_215:
!	Mem[00000000100c1400] = ff951bcb, %l2 = 0000000000000000
	lduha	[%i3+%g0]0x80,%l2	! %l2 = 000000000000ff95
!	Mem[0000000010141408] = 0000005e00000000, %f16 = ff0000ff 13bc0b50
	ldda	[%i5+%o4]0x88,%f16	! %f16 = 0000005e 00000000
!	Mem[0000000010101400] = 4f931571, %l7 = 00000000000000ff
	ldsba	[%i4+%g0]0x88,%l7	! %l7 = 0000000000000071
!	Mem[0000000020800000] = ffffca09, %l7 = 0000000000000071
	ldsha	[%o1+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010081408] = ff0000ff00000000, %l4 = 00000000000000ff
	ldxa	[%i2+%o4]0x80,%l4	! %l4 = ff0000ff00000000
!	Mem[0000000030101400] = ff0000ff, %l1 = 0000000000000035
	lduha	[%i4+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030081400] = 00000000, %l1 = 00000000000000ff
	ldsha	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = 0000ff00, %l1 = 0000000000000000
	ldswa	[%i6+%o4]0x89,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010101410] = eabc0b50, %l0 = 00000000a7e1c4ff
	lduba	[%i4+%o5]0x80,%l0	! %l0 = 00000000000000ea
!	Starting 10 instruction Store Burst
!	%f20 = ff000000 34ff30ff, %l4 = ff0000ff00000000
!	Mem[00000000100c1438] = f1d308f345a78c73
	add	%i3,0x038,%g1
	stda	%f20,[%g1+%l4]ASI_PST16_PL ! Mem[00000000100c1438] = f1d308f345a78c73

p0_label_216:
!	%l7 = ffffffffffffffff, Mem[0000000020800000] = ffffca09, %asi = 80
	stba	%l7,[%o1+0x000]%asi	! Mem[0000000020800000] = ffffca09
!	%l6 = ffffc700ffffffb7, Mem[00000000201c0001] = ffff7e52
	stb	%l6,[%o0+0x001]		! Mem[00000000201c0000] = ffb77e52
!	%f10 = 0073006e, Mem[0000000010041400] = 00000000
	sta	%f10,[%i1+%g0]0x88	! Mem[0000000010041400] = 0073006e
!	Mem[0000000030101410] = ffc4e1a7, %l6 = ffffc700ffffffb7
	swapa	[%i4+%o5]0x81,%l6	! %l6 = 00000000ffc4e1a7
!	%l7 = ffffffffffffffff, Mem[0000000030081410] = 738ca745
	stwa	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffffff
!	%l1 = 000000000000ff00, Mem[0000000030001408] = 50ff0000
	stba	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 00ff0000
!	%l0 = 00000000000000ea, Mem[0000000030041400] = 738ca745
	stwa	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ea
!	%l4 = ff0000ff00000000, Mem[00000000201c0000] = ffb77e52, %asi = 80
	stba	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00b77e52
!	%l2 = 000000000000ff95, Mem[0000000010081408] = ff0000ff
	stba	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = ff000095
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00ff0000 00000035, %l4 = 00000000, %l5 = fffffe66
	ldda	[%i6+%o4]0x81,%l4	! %l4 = 0000000000ff0000 0000000000000035

p0_label_217:
!	Mem[0000000020800000] = ffffca09, %l5 = 0000000000000035
	ldstub	[%o1+%g0],%l5		! %l5 = 000000ff000000ff
!	Mem[00000000100c1400] = ff951bcb5e000000, %f10 = 0073006e ff5a66fe
	ldda	[%i3+%g0]0x80,%f10	! %f10 = ff951bcb 5e000000
!	Mem[0000000030081400] = 00000000, %l3 = 0000000000000000
	ldsba	[%i2+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = 00000048, %l0 = 00000000000000ea
	ldswa	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000048
!	Mem[0000000030041410] = 35000000, %l1 = 000000000000ff00
	ldsha	[%i1+%o5]0x81,%l1	! %l1 = 0000000000003500
	membar	#Sync			! Added by membar checker (36)
!	Mem[0000000030001400] = ff00ff34 6e0000ff 00ff0000 00000035
!	Mem[0000000030001410] = ff00ffff ff000000 814f8833 e255b5f4
!	Mem[0000000030001420] = 40577e51 ff00006e a6568bbe 7e80b946
!	Mem[0000000030001430] = 00003148 3a37869c 500bbc13 5eb92bab
	ldda	[%i0]ASI_BLK_S,%f16	! Block Load from 0000000030001400
!	Mem[0000000010181410] = 48000000, %l7 = ffffffffffffffff
	ldsba	[%i6+%o5]0x80,%l7	! %l7 = 0000000000000048
!	Mem[0000000010141400] = ffffc700, %l5 = 00000000000000ff
	lduha	[%i5+%g0]0x80,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030041408] = 13bc0b50, %l2 = 000000000000ff95
	ldswa	[%i1+%o4]0x81,%l2	! %l2 = 0000000013bc0b50
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 00000000, %l2 = 0000000013bc0b50
	swapa	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000

p0_label_218:
!	%l1 = 0000000000003500, Mem[0000000030181408] = 00ff0000
	stba	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 00ff0000
!	Mem[0000000010101430] = ffffbc13, %l6 = 00000000ffc4e1a7
	swap	[%i4+0x030],%l6		! %l6 = 00000000ffffbc13
!	%f12 = 000000ad 00000000, %l4 = 0000000000ff0000
!	Mem[0000000010001428] = 500bbc1300000000
	add	%i0,0x028,%g1
	stda	%f12,[%g1+%l4]ASI_PST8_P ! Mem[0000000010001428] = 500bbc1300000000
!	%l2 = 0000000000000000, Mem[0000000030041410] = 3500000000000000
	stxa	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000000000000000
!	%f0  = 500bbc13, Mem[0000000010181410] = 48000000
	sta	%f0 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 500bbc13
!	Mem[00000000100c1410] = ffdc0000, %l6 = 00000000ffffbc13
	ldstuba	[%i3+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	Mem[00000000300c1400] = 00000000, %l5 = 000000000000ffff
	swapa	[%i3+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041408] = 00000035, %l2 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l2	! %l2 = 00000035000000ff
!	%l4 = 0000000000ff0000, Mem[0000000010181410] = 500bbc13
	stha	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000bc13
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00ff1327, %l0 = 0000000000000048
	ldsba	[%o2+0x001]%asi,%l0	! %l0 = ffffffffffffffff

p0_label_219:
!	Mem[00000000201c0000] = 00b77e52, %l5 = 0000000000000000
	lduba	[%o0+0x001]%asi,%l5	! %l5 = 00000000000000b7
	membar	#Sync			! Added by membar checker (37)
!	Mem[0000000010141400] = ffffc700 ffffffb7 500bbc13 5e000000
!	Mem[0000000010141410] = 00000048 00000000 00000000 00007246
!	Mem[0000000010141420] = 7e4b9eff 6f69bd3c 0073006e e10bde60
!	Mem[0000000010141430] = 00000000 98fc46ff ffffffff ff33f359
	ldda	[%i5]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010141400
!	Mem[000000001008140c] = 00000000, %l1 = 0000000000003500
	lduba	[%i2+0x00f]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = 500bbcea, %l2 = 0000000000000035
	ldsba	[%i4+%o5]0x88,%l2	! %l2 = ffffffffffffffea
!	Mem[0000000030001410] = ff00ffff, %f24 = 40577e51
	lda	[%i0+%o5]0x81,%f24	! %f24 = ff00ffff
!	Mem[00000000211c0000] = 00ff1327, %l2 = ffffffffffffffea
	lduh	[%o2+%g0],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010041410] = 000000ff, %f21 = ff000000
	lda	[%i1+%o5]0x80,%f21	! %f21 = 000000ff
!	Mem[0000000030081400] = 00000000, %f24 = ff00ffff
	lda	[%i2+%g0]0x89,%f24	! %f24 = 00000000
!	Mem[0000000010081400] = ffffffff, %l1 = 0000000000000000
	ldsha	[%i2+%g0]0x88,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000048, Mem[0000000030081410] = ffffffff
	stwa	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000048

p0_label_220:
	membar	#Sync			! Added by membar checker (38)
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010141408] = 13bc0b50 0000005e
	stda	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff 00000000
!	%l2 = 00000000000000ff, Mem[0000000010141400] = ffffc700
	stwa	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000ff
!	%l4 = 00ff0000, %l5 = 000000b7, Mem[0000000010141408] = ff000000 00000000
	stda	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 00ff0000 000000b7
!	%l0 = ffffffffffffffff, Mem[0000000021800080] = ffffbc25, %asi = 80
	stha	%l0,[%o3+0x080]%asi	! Mem[0000000021800080] = ffffbc25
!	%l2 = 00000000000000ff, Mem[0000000010101408] = 3a00000048000000
	stxa	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000000000ff
!	%f8  = 3cbd696f ff9e4b7e, %f16 = ff00ff34
	fxtos	%f8 ,%f16		! %f16 = 5e72f5a6
!	%f19 = 00000035, Mem[0000000010041428] = 1804043b
	st	%f19,[%i1+0x028]	! Mem[0000000010041428] = 00000035
!	%l2 = 00000000000000ff, Mem[0000000010181435] = ab7d4cce, %asi = 80
	stba	%l2,[%i6+0x035]%asi	! Mem[0000000010181434] = abff4cce
!	%l2 = 00000000000000ff, Mem[0000000010181400] = 00000000
	stha	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 7115934f, %l0 = ffffffffffffffff
	ldsha	[%i4+%g0]0x80,%l0	! %l0 = 0000000000007115

p0_label_221:
!	Mem[0000000030101408] = 00ff000045000000, %l5 = 00000000000000b7
	ldxa	[%i4+%o4]0x89,%l5	! %l5 = 00ff000045000000
	membar	#Sync			! Added by membar checker (39)
!	Mem[0000000010101400] = 7115934f d61e7246 ff000000 00000000
!	Mem[0000000010101410] = eabc0b50 00000000 00003148 13bc0b50
!	Mem[0000000010101420] = 2108b408 0000005a 21084f18 3b045018
!	Mem[0000000010101430] = ffc4e1a7 1804043b 45124473 00735b41
	ldda	[%i4]ASI_BLK_P,%f16	! Block Load from 0000000010101400
!	Mem[00000000201c0000] = 00b77e52, %l1 = ffffffffffffffff
	ldsha	[%o0+0x000]%asi,%l1	! %l1 = 00000000000000b7
!	Mem[0000000030101410] = b7ffffff, %l1 = 00000000000000b7
	ldswa	[%i4+%o5]0x89,%l1	! %l1 = ffffffffb7ffffff
!	Mem[00000000300c1408] = b7ff0000, %l0 = 0000000000007115
	ldsha	[%i3+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081410] = 007300ff00000000, %l3 = 0000000000000000
	ldxa	[%i2+%o5]0x80,%l3	! %l3 = 007300ff00000000
!	Mem[00000000100c1410] = 0000dcff, %f12 = ff46fc98
	lda	[%i3+%o5]0x88,%f12	! %f12 = 0000dcff
!	Mem[0000000030041400] = 000000ea, %l3 = 007300ff00000000
	lduba	[%i1+%g0]0x89,%l3	! %l3 = 00000000000000ea
!	Mem[00000000100c1408] = ffffffff ffffff95, %l0 = 00000000, %l1 = b7ffffff
	ldda	[%i3+%o4]0x80,%l0	! %l0 = 00000000ffffffff 00000000ffffff95
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 00ff0000, %l4 = 0000000000ff0000
	swapa	[%i0+%o4]0x80,%l4	! %l4 = 0000000000ff0000

p0_label_222:
!	%l2 = 00000000000000ff, Mem[0000000030001400] = ff00ff346e0000ff
	stxa	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000000000ff
!	%f14 = 59f333ff ffffffff, %l0 = 00000000ffffffff
!	Mem[0000000010141438] = ffffffffff33f359
	add	%i5,0x038,%g1
	stda	%f14,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010141438] = ffffffffff33f359
!	%l5 = 00ff000045000000, Mem[0000000010181408] = 3500000000000000
	stxa	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 00ff000045000000
!	%f8  = 3cbd696f ff9e4b7e, Mem[0000000010081438] = 814f8833 ff000000
	stda	%f8 ,[%i2+0x038]%asi	! Mem[0000000010081438] = 3cbd696f ff9e4b7e
	membar	#Sync			! Added by membar checker (40)
!	%f11 = 6e007300, Mem[0000000010101410] = eabc0b50
	sta	%f11,[%i4+%o5]0x80	! Mem[0000000010101410] = 6e007300
!	%l0 = 00000000ffffffff, Mem[0000000030101410] = ffffffb7
	stba	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffffb7
!	Mem[0000000030141410] = ff5a66fe, %l3 = 00000000000000ea
	ldstuba	[%i5+%o5]0x89,%l3	! %l3 = 000000fe000000ff
!	%f12 = 0000dcff 00000000, Mem[0000000010181420] = 51fffd82 b7393c5a
	std	%f12,[%i6+0x020]	! Mem[0000000010181420] = 0000dcff 00000000
!	Mem[0000000030081408] = 000000ff, %l2 = 00000000000000ff
	swapa	[%i2+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181418] = 00ff004c55a6359c, %l1 = 00000000ffffff95
	ldx	[%i6+0x018],%l1		! %l1 = 00ff004c55a6359c

p0_label_223:
!	Mem[00000000201c0000] = 00b77e52, %l7 = 0000000000000048
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = 00000000000000b7
!	Mem[0000000030001410] = ffff00ff, %l7 = 00000000000000b7
	ldsba	[%i0+%o5]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010141410] = 00000048, %l4 = 0000000000ff0000
	lduba	[%i5+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1430] = 00000000 00000000, %l2 = 000000ff, %l3 = 000000fe
	ldd	[%i3+0x030],%l2		! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010041410] = ff000000, %l6 = 00000000000000ff
	ldsba	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141408] = ea0000ff, %l1 = 00ff004c55a6359c
	lduha	[%i5+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000218001c0] = 19eabc74, %l7 = ffffffffffffffff
	lduh	[%o3+0x1c0],%l7		! %l7 = 00000000000019ea
!	Mem[0000000010001408] = 00ff0000, %l0 = 00000000ffffffff
	ldswa	[%i0+%o4]0x80,%l0	! %l0 = 0000000000ff0000
!	Mem[0000000010041430] = 8eff8f5f, %f12 = 0000dcff
	ld	[%i1+0x030],%f12	! %f12 = 8eff8f5f
!	Starting 10 instruction Store Burst
!	Mem[00000000100c143c] = 45a78c73, %l7 = 00000000000019ea
	ldstuba	[%i3+0x03c]%asi,%l7	! %l7 = 00000045000000ff

p0_label_224:
!	Mem[0000000030101410] = ffffffb7, %l2 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l2	! %l2 = 000000ff000000ff
!	%f2  = 0000005e 13bc0b50, %l4 = 0000000000000000
!	Mem[0000000030081400] = 000000009c35a6ff
	stda	%f2,[%i2+%l4]ASI_PST16_SL ! Mem[0000000030081400] = 000000009c35a6ff
!	%l6 = 0000000000000000, Mem[00000000201c0000] = 00b77e52, %asi = 80
	stha	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00007e52
!	Mem[0000000010001410] = 34ff30ff, %l1 = 00000000000000ff
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 0000000034ff30ff
!	Mem[0000000010141408] = 00ff0000, %l4 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l4	! %l4 = 0000000000ff0000
!	Mem[0000000010101410] = 6e007300, %l7 = 0000000000000045
	swapa	[%i4+%o5]0x80,%l7	! %l7 = 000000006e007300
!	%f23 = 13bc0b50, %f18 = ff000000 00000000
	fstox	%f23,%f18		! %f18 = 00000000 00000000
!	%f0  = b7ffffff, Mem[0000000010101408] = 000000ff
	sta	%f0 ,[%i4+%o4]0x88	! Mem[0000000010101408] = b7ffffff
!	%l6 = 0000000000000000, Mem[0000000010101430] = ffc4e1a71804043b
	stx	%l6,[%i4+0x030]		! Mem[0000000010101430] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041434] = 000000ff, %l7 = 000000006e007300
	lduwa	[%i1+0x034]%asi,%l7	! %l7 = 00000000000000ff

p0_label_225:
!	Mem[0000000010181400] = 000000ff, %l1 = 0000000034ff30ff
	ldsha	[%i6+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[000000001004140c] = 000000ff, %l5 = 00ff000045000000
	lduha	[%i1+0x00c]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041408] = ff000000000000ff, %f2  = 0000005e 13bc0b50
	ldda	[%i1+%o4]0x80,%f2 	! %f2  = ff000000 000000ff
!	Mem[00000000201c0000] = 00007e52, %l0 = 0000000000ff0000
	ldub	[%o0+%g0],%l0		! %l0 = 0000000000000000
!	Mem[00000000300c1408] = 0000ffb7, %l6 = 0000000000000000
	ldsha	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1400] = ffff0000, %l6 = 0000000000000000
	lduba	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = ff0000ff, %f21 = 00000000
	lda	[%i4+%g0]0x81,%f21	! %f21 = ff0000ff
!	Mem[0000000030101408] = 45000000, %f15 = ffffffff
	lda	[%i4+%o4]0x89,%f15	! %f15 = 45000000
!	Mem[0000000010041400] = 0073006e, %l2 = 00000000000000ff
	ldsba	[%i1+%g0]0x88,%l2	! %l2 = 000000000000006e
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000010101400] = 7115934f
	stha	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000934f

p0_label_226:
!	Mem[0000000010081400] = ffffffff, %l1 = 000000ff, %l6 = 00000000
	casa	[%i2]0x80,%l1,%l6	! %l6 = 00000000ffffffff
!	%l6 = ffffffff, %l7 = 000000ff, Mem[0000000010001408] = 00ff0000 00000035
	stda	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = ffffffff 000000ff
!	%l2 = 000000000000006e, Mem[0000000010041410] = ff000000
	stwa	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000006e
!	Mem[0000000010001408] = ffffffff, %l5 = 0000000000000000
	ldstuba	[%i0+%o4]0x80,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010181400] = 000000ff, %l0 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%l4 = 0000000000ff0000, Mem[0000000020800001] = ffffca09
	stb	%l4,[%o1+0x001]		! Mem[0000000020800000] = ff00ca09
!	%l7 = 00000000000000ff, Mem[0000000010041400] = 0073006e
	stha	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = 007300ff
!	%f19 = 00000000, Mem[0000000010181410] = 13bc0000
	sta	%f19,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	Mem[0000000010141400] = 000000ffffffffb7, %l1 = 00000000000000ff, %l1 = 00000000000000ff
	casxa	[%i5]0x80,%l1,%l1	! %l1 = 000000ffffffffb7
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 45000000, %l0 = 00000000000000ff
	ldsha	[%i4+%o4]0x89,%l0	! %l0 = 0000000000000000

p0_label_227:
!	Mem[0000000010041410] = 6e000000, %l7 = 00000000000000ff
	ldsha	[%i1+0x010]%asi,%l7	! %l7 = 0000000000006e00
!	Mem[0000000010101410] = 00000045, %f0  = b7ffffff
	lda	[%i4+%o5]0x80,%f0 	! %f0 = 00000045
!	Mem[0000000010181408] = 0000ff00, %l3 = 0000000000000000
	ldsba	[%i6+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l0 = 0000000000000000
	lduba	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = ffffffff000000ff, %l3 = 0000000000000000
	ldx	[%i0+%o4],%l3		! %l3 = ffffffff000000ff
!	Mem[0000000030141410] = ff5a66ff, %f16 = 7115934f
	lda	[%i5+%o5]0x89,%f16	! %f16 = ff5a66ff
!	Mem[0000000010041408] = ff000000, %l0 = 0000000000000000
	ldsha	[%i1+%o4]0x80,%l0	! %l0 = ffffffffffffff00
!	Mem[00000000211c0000] = 00ff1327, %l6 = 00000000ffffffff
	ldub	[%o2+%g0],%l6		! %l6 = 0000000000000000
!	Mem[0000000030081410] = 48000000 48000000, %l0 = ffffff00, %l1 = ffffffb7
	ldda	[%i2+%o5]0x81,%l0	! %l0 = 0000000048000000 0000000048000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 00ff0000, %l2 = 000000000000006e
	swapa	[%i0+%o4]0x81,%l2	! %l2 = 0000000000ff0000

p0_label_228:
!	%l3 = ffffffff000000ff, Mem[0000000030041408] = 13bc0b50
	stha	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 00ff0b50
!	%l7 = 0000000000006e00, Mem[0000000010101410] = 00000045
	stha	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 6e000045
!	Mem[000000001018141c] = 55a6359c, %l3 = ffffffff000000ff
	swap	[%i6+0x01c],%l3		! %l3 = 0000000055a6359c
!	Mem[0000000010141408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141408] = ff0000ea, %l0 = 0000000048000000
	ldstuba	[%i5+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	%f4  = 00000000, Mem[0000000010081408] = 950000ff
	sta	%f4 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	Mem[0000000010101400] = 4f930000, %l3 = 0000000055a6359c
	ldstuba	[%i4+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141408] = 000000ff, %l2 = 0000000000ff0000
	ldstuba	[%i5+%o4]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030001408] = 6e000000, %f10 = 60de0be1
	lda	[%i0+%o4]0x89,%f10	! %f10 = 6e000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ffffffff, %l3 = 0000000000000000
	lduha	[%i0+%o4]0x88,%l3	! %l3 = 000000000000ffff

p0_label_229:
!	Mem[00000000100c1410] = 0000dcff, %f9  = ff9e4b7e
	lda	[%i3+%o5]0x88,%f9 	! %f9 = 0000dcff
!	Mem[0000000030141400] = 35000000, %l1 = 0000000048000000
	ldsha	[%i5+%g0]0x81,%l1	! %l1 = 0000000000003500
!	Mem[0000000010101408] = ffffffb7, %f29 = 1804043b
	lda	[%i4+%o4]0x80,%f29	! %f29 = ffffffb7
!	Mem[00000000100c1400] = cb1b95ff, %l4 = 0000000000ff0000
	lduha	[%i3+%g0]0x88,%l4	! %l4 = 00000000000095ff
!	Mem[0000000010041400] = 007300ff, %l4 = 00000000000095ff
	lduwa	[%i1+%g0]0x88,%l4	! %l4 = 00000000007300ff
!	Mem[000000001004140c] = 000000ff, %l7 = 0000000000006e00
	lduwa	[%i1+0x00c]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1408] = ffffffff, %l3 = 000000000000ffff
	ldsha	[%i3+%o4]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030041400] = e546fc98000000ea, %l7 = 00000000000000ff
	ldxa	[%i1+%g0]0x89,%l7	! %l7 = e546fc98000000ea
!	Mem[0000000010081408] = 00000000, %f3  = 000000ff
	lda	[%i2+%o4]0x88,%f3 	! %f3 = 00000000
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000010141400] = 000000ff
	stba	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = ff0000ff

p0_label_230:
!	Mem[0000000030101408] = 45000000, %l4 = 00000000007300ff
	ldstuba	[%i4+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%l7 = e546fc98000000ea, Mem[0000000030041410] = 00000000
	stba	%l7,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ea
!	%f30 = 45124473, Mem[0000000030001400] = 00000000
	sta	%f30,[%i0+%g0]0x81	! Mem[0000000030001400] = 45124473
!	Mem[00000000300c1410] = 000000ff, %l1 = 0000000000003500
	swapa	[%i3+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000010101408] = ffffffb7
	stwa	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff
!	%l6 = 00000000, %l7 = 000000ea, Mem[00000000100c1410] = ffdc0000 00000000
	stda	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000 000000ea
!	%f20 = eabc0b50, Mem[0000000030141410] = ff665aff
	sta	%f20,[%i5+%o5]0x81	! Mem[0000000030141410] = eabc0b50
!	Mem[0000000010001408] = ffffffff, %l5 = 00000000000000ff
	ldstuba	[%i0+%o4]0x88,%l5	! %l5 = 000000ff000000ff
!	%l2 = 000000ff, %l3 = ffffffff, Mem[0000000010001400] = 13bc0b00 ff0000ff
	stda	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff ffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ff951bcb, %l4 = 0000000000000000
	lduha	[%i3+%g0]0x80,%l4	! %l4 = 000000000000ff95

p0_label_231:
!	Mem[0000000010041408] = 000000ff, %l7 = e546fc98000000ea
	ldsba	[%i1+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000020800040] = ffff095a, %l7 = ffffffffffffffff
	lduha	[%o1+0x040]%asi,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010041400] = ff007300, %l1 = 00000000000000ff
	ldswa	[%i1+%g0]0x80,%l1	! %l1 = ffffffffff007300
!	Mem[00000000100c1408] = 95ffffffffffffff, %l7 = 000000000000ffff
	ldxa	[%i3+%o4]0x88,%l7	! %l7 = 95ffffffffffffff
!	Mem[00000000100c1400] = cb1b95ff, %l6 = 0000000000000000
	lduba	[%i3+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181400] = 0000000000000000, %f0  = 00000045 00c7ffff
	ldda	[%i6+%g0]0x88,%f0 	! %f0  = 00000000 00000000
!	Mem[00000000100c1428] = 00000000, %l7 = 95ffffffffffffff
	lduw	[%i3+0x028],%l7		! %l7 = 0000000000000000
!	Mem[0000000030141410] = 0073006e500bbcea, %l2 = 00000000000000ff
	ldxa	[%i5+%o5]0x89,%l2	! %l2 = 0073006e500bbcea
!	Mem[00000000300c1400] = ffff0000, %l0 = 00000000000000ff
	ldsba	[%i3+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = ff007300, %l2 = 0073006e500bbcea
	ldstuba	[%i2+%o5]0x88,%l2	! %l2 = 00000000000000ff

p0_label_232:
!	%l0 = 0000000000000000, Mem[0000000010141408] = 000000ff
	stwa	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%l0 = 0000000000000000, Mem[0000000010181410] = 00000000
	stwa	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	%f0  = 00000000 00000000 ff000000 00000000
!	%f4  = 00000000 48000000 46720000 00000000
!	%f8  = 3cbd696f 0000dcff 6e000000 6e007300
!	%f12 = 8eff8f5f 00000000 59f333ff 45000000
	stda	%f0,[%i2]ASI_BLK_PL	! Block Store to 0000000010081400
!	Mem[0000000030141410] = eabc0b50, %l6 = 00000000000000ff
	ldstuba	[%i5+%o5]0x81,%l6	! %l6 = 000000ea000000ff
!	Mem[0000000010041408] = ff000000, %l6 = 00000000000000ea
	ldstuba	[%i1+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	%f28 = ffc4e1a7, Mem[0000000030141410] = 500bbcff
	sta	%f28,[%i5+%o5]0x89	! Mem[0000000030141410] = ffc4e1a7
!	%l4 = 000000000000ff95, Mem[0000000010081404] = 00000000, %asi = 80
	stba	%l4,[%i2+0x004]%asi	! Mem[0000000010081404] = 95000000
!	%l0 = 0000000000000000, Mem[00000000211c0001] = 00ff1327, %asi = 80
	stba	%l0,[%o2+0x001]%asi	! Mem[00000000211c0000] = 00001327
!	%f29 = ffffffb7, Mem[0000000030081400] = 00000000
	sta	%f29,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffffb7
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (41)
!	Mem[0000000030001400] = 45124473 000000ff 0000006e 00000035
!	Mem[0000000030001410] = ff00ffff ff000000 814f8833 e255b5f4
!	Mem[0000000030001420] = 40577e51 ff00006e a6568bbe 7e80b946
!	Mem[0000000030001430] = 00003148 3a37869c 500bbc13 5eb92bab
	ldda	[%i0]ASI_BLK_S,%f16	! Block Load from 0000000030001400

p0_label_233:
!	Mem[0000000030181400] = 00000000, %l1 = ffffffffff007300
	ldsba	[%i6+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041400] = e546fc98 000000ea, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i1+%g0]0x89,%l6	! %l6 = 00000000000000ea 00000000e546fc98
!	Mem[0000000010141400] = ff0000ff, %l2 = 0000000000000000
	lduha	[%i5+%g0]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030041408] = 500bff00, %f7  = 00000000
	lda	[%i1+%o4]0x89,%f7 	! %f7 = 500bff00
!	Mem[0000000030101408] = ff000045 0000ff00, %l6 = 000000ea, %l7 = e546fc98
	ldda	[%i4+%o4]0x81,%l6	! %l6 = 00000000ff000045 000000000000ff00
!	Mem[00000000300c1410] = 00003500, %l0 = 0000000000000000
	lduba	[%i3+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[000000001014143c] = ff33f359, %l6 = 00000000ff000045
	lduba	[%i5+0x03d]%asi,%l6	! %l6 = 0000000000000033
!	Mem[00000000100c1408] = ffffffff, %l6 = 0000000000000033
	ldsb	[%i3+0x00b],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030101410] = b7ffffff, %l5 = 00000000000000ff
	lduha	[%i4+%o5]0x89,%l5	! %l5 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000ff00, Mem[00000000201c0000] = 00007e52, %asi = 80
	stha	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = ff007e52

p0_label_234:
	membar	#Sync			! Added by membar checker (42)
!	%l2 = 0000ff00, %l3 = ffffffff, Mem[0000000030001410] = ffff00ff 000000ff
	stda	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000ff00 ffffffff
!	%l0 = 0000000000000000, Mem[0000000030081408] = ff000000
	stha	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	%l5 = 000000000000ffff, Mem[0000000030041408] = 00ff0000500bff00
	stxa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000000000ffff
!	%f28 = 00003148, Mem[00000000300c1400] = 0000ffff
	sta	%f28,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00003148
!	Mem[00000000100c1410] = 00000000, %l4 = 000000000000ff95
	swapa	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041408] = ffff0000, %l5 = 000000000000ffff
	ldstuba	[%i1+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	%l2 = 000000000000ff00, Mem[0000000010101408] = ff000000
	stba	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = ff000000
!	%f26 = a6568bbe, Mem[0000000010181400] = 00000000
	sta	%f26,[%i6+%g0]0x88	! Mem[0000000010181400] = a6568bbe
!	%l7 = 000000000000ff00, Mem[00000000201c0000] = ff007e52
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = ff007e52
!	Starting 10 instruction Load Burst
!	Mem[0000000010081420] = ffdc0000, %l2 = 000000000000ff00
	lduw	[%i2+0x020],%l2		! %l2 = 00000000ffdc0000

p0_label_235:
!	Mem[0000000010081408] = 00000000000000ff, %l3 = ffffffffffffffff
	ldxa	[%i2+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1410] = 0000ff95, %l7 = 000000000000ff00
	ldsba	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041430] = 8eff8f5f000000ff, %f18 = 0000006e 00000035
	ldd	[%i1+0x030],%f18	! %f18 = 8eff8f5f 000000ff
!	Mem[00000000300c1408] = 738ca745 b7ff0000, %l2 = ffdc0000, %l3 = 000000ff
	ldda	[%i3+%o4]0x89,%l2	! %l2 = 00000000b7ff0000 00000000738ca745
!	Mem[00000000300c1400] = 00003148, %l1 = 0000000000000000
	lduwa	[%i3+%g0]0x81,%l1	! %l1 = 0000000000003148
!	Mem[0000000010041408] = 000000ff, %l7 = 0000000000000000
	lduwa	[%i1+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1408] = 738ca745b7ff0000, %f18 = 8eff8f5f 000000ff
	ldda	[%i3+%o4]0x89,%f18	! %f18 = 738ca745 b7ff0000
!	Mem[0000000010041410] = 0000006e, %l2 = 00000000b7ff0000
	lduwa	[%i1+%o5]0x88,%l2	! %l2 = 000000000000006e
!	Mem[0000000010041400] = ff007300, %l4 = 0000000000000000
	ldsha	[%i1+%g0]0x80,%l4	! %l4 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000030081410] = 48000000
	stha	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = 00ff0000

p0_label_236:
!	%l6 = ffffffff, %l7 = 000000ff, Mem[00000000100c1400] = cb1b95ff 0000005e
	stda	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffff 000000ff
!	%l4 = ffffffffffffff00, Mem[0000000010141408] = b700000000000000
	stxa	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffffffffffff00
!	Mem[0000000010081424] = 6f69bd3c, %l6 = ffffffff, %l6 = ffffffff
	add	%i2,0x24,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 000000006f69bd3c
!	%l4 = ffffffffffffff00, Mem[00000000100c143c] = ffa78c73, %asi = 80
	stwa	%l4,[%i3+0x03c]%asi	! Mem[00000000100c143c] = ffffff00
!	Mem[0000000010141408] = ffffff00, %l6 = 000000006f69bd3c
	ldstuba	[%i5+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101423] = 2108b408, %l6 = 0000000000000000
	ldstub	[%i4+0x023],%l6		! %l6 = 00000008000000ff
!	Mem[00000000100c1400] = ffffffff, %l7 = 00000000000000ff
	swapa	[%i3+%g0]0x88,%l7	! %l7 = 00000000ffffffff
!	%l7 = 00000000ffffffff, Mem[0000000030081400] = ffffffb7
	stha	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffffb7
!	Mem[0000000010181408] = 0000ff00, %l3 = 00000000738ca745
	swapa	[%i6+%o4]0x88,%l3	! %l3 = 000000000000ff00
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ff00ca09, %l6 = 0000000000000008
	ldub	[%o1+%g0],%l6		! %l6 = 00000000000000ff

p0_label_237:
!	Mem[0000000010141420] = 7e4b9eff 6f69bd3c, %l4 = ffffff00, %l5 = 000000ff
	ldd	[%i5+0x020],%l4		! %l4 = 000000007e4b9eff 000000006f69bd3c
!	Mem[0000000010181400] = be8b56a6, %l4 = 000000007e4b9eff
	lduha	[%i6+0x002]%asi,%l4	! %l4 = 00000000000056a6
!	Mem[00000000100c1410] = 0000ff95, %f22 = 814f8833
	lda	[%i3+%o5]0x80,%f22	! %f22 = 0000ff95
!	Mem[00000000100c1410] = 0000ff95, %f21 = ff000000
	lda	[%i3+%o5]0x80,%f21	! %f21 = 0000ff95
!	Mem[00000000100c1414] = 000000ea, %l7 = 00000000ffffffff
	ldsh	[%i3+0x014],%l7		! %l7 = 0000000000000000
!	Mem[0000000010041404] = ffffff00, %f17 = 000000ff
	lda	[%i1+0x004]%asi,%f17	! %f17 = ffffff00
!	Mem[0000000010001400] = ff000000ffffffff, %f14 = 59f333ff 45000000
	ldda	[%i0+%g0]0x80,%f14	! %f14 = ff000000 ffffffff
!	Mem[0000000010001400] = 000000ff, %l7 = 0000000000000000
	lduha	[%i0+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081408] = ab000000 00000000, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i2+%o4]0x89,%l6	! %l6 = 0000000000000000 00000000ab000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 48000000, %l7 = 00000000ab000000
	ldstuba	[%i2+%o5]0x88,%l7	! %l7 = 00000000000000ff

p0_label_238:
!	%f8  = 3cbd696f 0000dcff, %l0 = 0000000000000000
!	Mem[0000000030141400] = 3500000000000000
	stda	%f8,[%i5+%l0]ASI_PST16_S ! Mem[0000000030141400] = 3500000000000000
!	%l0 = 0000000000000000, Mem[0000000030081408] = 00000000
	stba	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%l1 = 0000000000003148, Mem[0000000010181408] = 00000045738ca745
	stxa	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000000000003148
!	Mem[0000000010141438] = ffffffff, %l5 = 000000006f69bd3c
	swap	[%i5+0x038],%l5		! %l5 = 00000000ffffffff
!	%l5 = 00000000ffffffff, Mem[0000000030001408] = 0000006e00000035
	stxa	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000ffffffff
!	%l3 = 000000000000ff00, Mem[0000000010141410] = 0000004800000000
	stxa	%l3,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000000000ff00
!	%l7 = 0000000000000000, Mem[0000000030141408] = ea0000ff
	stwa	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	%f26 = a6568bbe 7e80b946, %l0 = 0000000000000000
!	Mem[0000000010081420] = ffdc00006f69bd3c
	add	%i2,0x020,%g1
	stda	%f26,[%g1+%l0]ASI_PST32_P ! Mem[0000000010081420] = ffdc00006f69bd3c
!	%f21 = 0000ff95, Mem[0000000010041400] = 007300ff
	sta	%f21,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000ff95
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 46721ed64f9300ff, %f22 = 0000ff95 e255b5f4
	ldda	[%i4+%g0]0x88,%f22	! %f22 = 46721ed6 4f9300ff

p0_label_239:
!	Mem[00000000201c0000] = ff007e52, %l2 = 000000000000006e
	ldsh	[%o0+%g0],%l2		! %l2 = ffffffffffffff00
!	Mem[0000000021800080] = ffffbc25, %l3 = 000000000000ff00
	ldub	[%o3+0x080],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010181400] = be8b56a6 00000000, %l4 = 000056a6, %l5 = ffffffff
	ldda	[%i6+%g0]0x80,%l4	! %l4 = 00000000be8b56a6 0000000000000000
!	Mem[0000000010181410] = 00000000, %f12 = 8eff8f5f
	lda	[%i6+%o5]0x88,%f12	! %f12 = 00000000
!	Mem[0000000010181430] = 34ff373a, %l0 = 0000000000000000
	ldsb	[%i6+0x033],%l0		! %l0 = 000000000000003a
!	Mem[0000000010101408] = 000000ff, %l5 = 0000000000000000
	lduwa	[%i4+0x008]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030141400] = 35000000, %l4 = 00000000be8b56a6
	ldsba	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000035
!	Code Fragment 4
p0_fragment_8:
!	%l0 = 000000000000003a
	setx	0xa0019f77ef3f33ca,%g7,%l0 ! %l0 = a0019f77ef3f33ca
!	%l1 = 0000000000003148
	setx	0xaa4226406f7648df,%g7,%l1 ! %l1 = aa4226406f7648df
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = a0019f77ef3f33ca
	setx	0x0d57fa1fdf91c94a,%g7,%l0 ! %l0 = 0d57fa1fdf91c94a
!	%l1 = aa4226406f7648df
	setx	0x0107cff85fd29fea,%g7,%l1 ! %l1 = 0107cff85fd29fea
!	Mem[0000000010041428] = 00000035, %l4 = 0000000000000035
	ldsba	[%i1+0x02b]%asi,%l4	! %l4 = 0000000000000035
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = ea000000, %l5 = 00000000000000ff
	ldstuba	[%i1+%o5]0x81,%l5	! %l5 = 000000ea000000ff

p0_label_240:
!	%l3 = 00000000000000ff, Mem[0000000010041410] = 0000006e
	stwa	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff
!	%f16 = 45124473 ffffff00, Mem[0000000010081410] = 480000ff 00000000
	stda	%f16,[%i2+%o5]0x88	! Mem[0000000010081410] = 45124473 ffffff00
!	%l0 = 0d57fa1fdf91c94a, Mem[0000000030101408] = 450000ff
	stha	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 4500c94a
!	Mem[0000000010101400] = ff00934f, %l1 = 0107cff85fd29fea
	swapa	[%i4+%g0]0x80,%l1	! %l1 = 00000000ff00934f
!	Mem[0000000030141408] = 00000000, %l7 = 0000000000000000
	swapa	[%i5+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000201c0000] = ff007e52, %l4 = 0000000000000035
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030181408] = 00ff0000, %l6 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	%f4  = 00000000 48000000, Mem[00000000100c1410] = 0000ff95 000000ea
	stda	%f4 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000 48000000
!	Mem[0000000010081410] = 00ffffff, %l4 = 00000000000000ff
	swapa	[%i2+%o5]0x80,%l4	! %l4 = 0000000000ffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff000000, %l6 = 0000000000000000
	ldswa	[%i2+%o5]0x88,%l6	! %l6 = ffffffffff000000

p0_label_241:
!	Mem[0000000030181410] = ff30ff34, %l3 = 00000000000000ff
	lduba	[%i6+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[000000001000143c] = 5e000000, %l1 = 00000000ff00934f
	ldsw	[%i0+0x03c],%l1		! %l1 = 000000005e000000
!	Mem[0000000030101408] = 4ac90045, %f1  = 00000000
	lda	[%i4+%o4]0x81,%f1 	! %f1 = 4ac90045
!	Mem[0000000010101410] = 00000000 4500006e, %l4 = 00ffffff, %l5 = 000000ea
	ldda	[%i4+%o5]0x88,%l4	! %l4 = 000000004500006e 0000000000000000
!	Mem[00000000300c1410] = 00350000, %l6 = ffffffffff000000
	ldswa	[%i3+%o5]0x81,%l6	! %l6 = 0000000000350000
!	Mem[0000000010081424] = 6f69bd3c, %l5 = 0000000000000000
	ldsw	[%i2+0x024],%l5		! %l5 = 000000006f69bd3c
!	Mem[0000000030041408] = 000000000000ffff, %f0  = 00000000 4ac90045
	ldda	[%i1+%o4]0x89,%f0 	! %f0  = 00000000 0000ffff
!	Mem[0000000010181400] = 00000000 a6568bbe, %l0 = df91c94a, %l1 = 5e000000
	ldda	[%i6+%g0]0x88,%l0	! %l0 = 00000000a6568bbe 0000000000000000
!	Mem[0000000010101400] = 5fd29fea, %f21 = 0000ff95
	lda	[%i4+%g0]0x80,%f21	! %f21 = 5fd29fea
!	Starting 10 instruction Store Burst
!	Mem[0000000010181418] = 00ff004c, %l7 = 0000000000000000, %asi = 80
	swapa	[%i6+0x018]%asi,%l7	! %l7 = 0000000000ff004c

p0_label_242:
!	%l4 = 000000004500006e, Mem[0000000030181400] = 00000000
	stwa	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 4500006e
!	Mem[0000000010181410] = 00000000, %l7 = 0000000000ff004c
	ldstuba	[%i6+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1418] = ffffcb1b, %l0 = a6568bbe, %l4 = 4500006e
	add	%i3,0x18,%g1
	casa	[%g1]0x80,%l0,%l4	! %l4 = 00000000ffffcb1b
!	%l6 = 0000000000350000, Mem[0000000010181408] = 00003148
	stwa	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 00350000
!	%l2 = ffffffffffffff00, Mem[0000000010081400] = 00000000
	stha	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000ff00
!	Mem[0000000030041400] = 000000ea, %l6 = 0000000000350000
	swapa	[%i1+%g0]0x89,%l6	! %l6 = 00000000000000ea
!	%f16 = 45124473 ffffff00, %l1 = 0000000000000000
!	Mem[0000000030041418] = c22c71c6b0c7cf8a
	add	%i1,0x018,%g1
	stda	%f16,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030041418] = c22c71c6b0c7cf8a
!	Mem[0000000010041438] = 3500000000000000, %l1 = 0000000000000000, %l7 = 0000000000000000
	add	%i1,0x38,%g1
	casxa	[%g1]0x80,%l1,%l7	! %l7 = 3500000000000000
!	Mem[0000000010001410] = 000000ff, %l7 = 3500000000000000
	swapa	[%i0+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000095 0000ff00, %l0 = a6568bbe, %l1 = 00000000
	ldda	[%i2+%g0]0x88,%l0	! %l0 = 000000000000ff00 0000000000000095

p0_label_243:
!	Mem[0000000030081400] = ffa6359c b7ffffff, %l2 = ffffff00, %l3 = 000000ff
	ldda	[%i2+%g0]0x89,%l2	! %l2 = 00000000b7ffffff 00000000ffa6359c
!	Mem[0000000030081400] = ffffffb7, %l2 = 00000000b7ffffff
	lduba	[%i2+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081410] = 45124473 ff000000, %l0 = 0000ff00, %l1 = 00000095
	ldda	[%i2+%o5]0x88,%l0	! %l0 = 00000000ff000000 0000000045124473
!	Mem[0000000010041410] = ff000000, %l6 = 00000000000000ea
	lduba	[%i1+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101408] = 4ac90045, %l4 = 00000000ffffcb1b
	ldswa	[%i4+%o4]0x81,%l4	! %l4 = 000000004ac90045
!	Mem[0000000010141408] = ffffffffffffffff, %l7 = 00000000000000ff
	ldxa	[%i5+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030081400] = ffffffb7, %f8  = 3cbd696f
	lda	[%i2+%g0]0x81,%f8 	! %f8 = ffffffb7
!	Mem[0000000010041410] = 000000ff, %l1 = 0000000045124473
	lduha	[%i1+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141410] = 00000000, %l4 = 000000004ac90045
	ldsba	[%i5+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000030181408] = 350000000000ffff
	stxa	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000000000ff

p0_label_244:
!	%l0 = ff000000, %l1 = 000000ff, Mem[0000000010081410] = 000000ff 73441245
	stda	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = ff000000 000000ff
!	Mem[0000000010041410] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i1+%o5]0x80,%l4	! %l4 = 000000ff000000ff
!	%l7 = ffffffffffffffff, Mem[000000001018141c] = 000000ff
	sth	%l7,[%i6+0x01c]		! Mem[000000001018141c] = ffff00ff
!	%f30 = 500bbc13 5eb92bab, %l6 = 00000000000000ff
!	Mem[0000000010001408] = ffffffff000000ff
	add	%i0,0x008,%g1
	stda	%f30,[%g1+%l6]ASI_PST16_P ! Mem[0000000010001408] = 500bbc135eb92bab
!	Mem[0000000010041408] = 000000ff, %l3 = 00000000ffa6359c
	swapa	[%i1+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[00000000100c1400] = ff000000ff000000
	stxa	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000000000ff
!	%l5 = 000000006f69bd3c, Mem[00000000201c0000] = ff007e52
	stb	%l5,[%o0+%g0]		! Mem[00000000201c0000] = 3c007e52
!	Mem[00000000300c1408] = b7ff0000, %l6 = 00000000000000ff
	swapa	[%i3+%o4]0x89,%l6	! %l6 = 00000000b7ff0000
!	%l6 = 00000000b7ff0000, Mem[0000000030081400] = b7ffffff
	stha	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = b7ff0000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %f27 = 7e80b946
	lda	[%i3+%o5]0x88,%f27	! %f27 = 00000000

p0_label_245:
!	Mem[00000000300c1400] = 00003148, %l1 = 00000000000000ff
	lduba	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800000] = ff00ca09, %l7 = ffffffffffffffff
	lduh	[%o1+%g0],%l7		! %l7 = 000000000000ff00
!	Mem[0000000030141400] = 35000000 00000000, %l0 = ff000000, %l1 = 00000000
	ldda	[%i5+%g0]0x81,%l0	! %l0 = 0000000035000000 0000000000000000
!	Mem[0000000010181424] = 00000000, %l1 = 0000000000000000
	ldsb	[%i6+0x026],%l1		! %l1 = 0000000000000000
!	Mem[0000000010041410] = ff00000000003148, %l7 = 000000000000ff00
	ldxa	[%i1+%o5]0x80,%l7	! %l7 = ff00000000003148
!	Mem[0000000010081414] = 000000ff, %l3 = 00000000000000ff
	ldsh	[%i2+0x016],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010081400] = 00ff0000, %l1 = 0000000000000000
	lduha	[%i2+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181430] = 34ff373aabff4cce, %l3 = 00000000000000ff
	ldx	[%i6+0x030],%l3		! %l3 = 34ff373aabff4cce
!	Mem[0000000010041400] = 0000ff95, %l3 = 34ff373aabff4cce
	ldsha	[%i1+%g0]0x88,%l3	! %l3 = ffffffffffffff95
!	Starting 10 instruction Store Burst
!	%l6 = 00000000b7ff0000, Mem[00000000211c0000] = 00001327, %asi = 80
	stha	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00001327

p0_label_246:
!	%l0 = 0000000035000000, Mem[0000000030141410] = ffc4e1a7
	stba	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = ffc4e100
!	Mem[0000000010101418] = 0000314813bc0b50, %l5 = 000000006f69bd3c, %l7 = ff00000000003148
	add	%i4,0x18,%g1
	casxa	[%g1]0x80,%l5,%l7	! %l7 = 0000314813bc0b50
!	%l2 = 00000000000000ff, Mem[0000000030141410] = 00e1c4ff6e007300
	stxa	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000000000ff
!	%f16 = 45124473 ffffff00 738ca745 b7ff0000
!	%f20 = ff00ffff 5fd29fea 46721ed6 4f9300ff
!	%f24 = 40577e51 ff00006e a6568bbe 00000000
!	%f28 = 00003148 3a37869c 500bbc13 5eb92bab
	stda	%f16,[%i1]ASI_BLK_AIUPL	! Block Store to 0000000010041400
!	%l1 = 00000000000000ff, Mem[0000000010141400] = ff0000ffffffffb7
	stxa	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000000000ff
!	Mem[0000000010001408] = 500bbc13, %l7 = 0000314813bc0b50
	swapa	[%i0+%o4]0x80,%l7	! %l7 = 00000000500bbc13
!	Code Fragment 3
p0_fragment_9:
!	%l0 = 0000000035000000
	setx	0xe64e763050cddb78,%g7,%l0 ! %l0 = e64e763050cddb78
!	%l1 = 00000000000000ff
	setx	0xd08c7f8fe502031f,%g7,%l1 ! %l1 = d08c7f8fe502031f
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e64e763050cddb78
	setx	0x841a3a8fad140156,%g7,%l0 ! %l0 = 841a3a8fad140156
!	%l1 = d08c7f8fe502031f
	setx	0x0d2aa65ff83a5548,%g7,%l1 ! %l1 = 0d2aa65ff83a5548
!	%l4 = 000000ff, %l5 = 6f69bd3c, Mem[0000000030081408] = 00000000 000000ab
	stda	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000ff 6f69bd3c
!	Mem[0000000010101404] = d61e7246, %l6 = b7ff0000, %l4 = 000000ff
	add	%i4,0x04,%g1
	casa	[%g1]0x80,%l6,%l4	! %l4 = 00000000d61e7246
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ffff095a, %l2 = 00000000000000ff
	ldub	[%o1+0x041],%l2		! %l2 = 00000000000000ff

p0_label_247:
!	Mem[0000000010081400] = 0000ff00, %l0 = 841a3a8fad140156
	lduha	[%i2+%g0]0x88,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010101400] = 5fd29fea, %l0 = 000000000000ff00
	lduwa	[%i4+%g0]0x80,%l0	! %l0 = 000000005fd29fea
!	Mem[0000000030081408] = ff000000, %f9  = 0000dcff
	lda	[%i2+%o4]0x89,%f9 	! %f9 = ff000000
!	Mem[0000000010101408] = ff000000, %l1 = 0d2aa65ff83a5548
	lduwa	[%i4+%o4]0x88,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010101400] = 5fd29fead61e7246, %l3 = ffffffffffffff95
	ldxa	[%i4+%g0]0x80,%l3	! %l3 = 5fd29fead61e7246
!	Mem[0000000010141400] = 00000000, %l6 = 00000000b7ff0000
	ldsba	[%i5+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = 4500c94a, %f7  = 500bff00
	lda	[%i4+%o4]0x89,%f7 	! %f7 = 4500c94a
!	Mem[0000000010081410] = 000000ff, %l7 = 00000000500bbc13
	lduba	[%i2+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141400] = 00000000, %l7 = 00000000000000ff
	ldsba	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000030181400] = 6e000045
	stha	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 00ff0045

p0_label_248:
!	%f12 = 00000000, Mem[0000000010141408] = ffffffff
	sta	%f12,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%l4 = 00000000d61e7246, Mem[0000000030001410] = 0000ff00
	stha	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 00007246
!	%l0 = 5fd29fea, %l1 = ff000000, Mem[00000000100c1430] = 00000000 00000000
	stda	%l0,[%i3+0x030]%asi	! Mem[00000000100c1430] = 5fd29fea ff000000
!	Mem[0000000030101410] = ffffffb7, %l1 = 00000000ff000000
	swapa	[%i4+%o5]0x81,%l1	! %l1 = 00000000ffffffb7
!	%l5 = 000000006f69bd3c, Mem[0000000010101400] = ea9fd25f
	stba	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = ea9fd23c
!	Mem[0000000010001418] = 00000000, %l2 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x018]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081400] = 00ff0000, %l5 = 000000006f69bd3c
	swapa	[%i2+%g0]0x80,%l5	! %l5 = 0000000000ff0000
!	%l1 = 00000000ffffffb7, Mem[00000000300c1400] = 48310000
	stba	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = 483100b7
!	%f20 = ff00ffff, Mem[00000000300c1408] = ff000000
	sta	%f20,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff00ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = b0ffab40, %l2 = 0000000000000000
	ldsha	[%o3+0x140]%asi,%l2	! %l2 = ffffffffffffb0ff

p0_label_249:
!	Mem[0000000030001410] = 00007246, %l6 = 0000000000000000
	lduha	[%i0+%o5]0x89,%l6	! %l6 = 0000000000007246
!	Mem[0000000010141400] = 00000000, %l6 = 0000000000007246
	lduba	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041408] = 0000ffff, %l5 = 0000000000ff0000
	ldsba	[%i1+%o4]0x89,%l5	! %l5 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (43)
!	Mem[0000000010041408] = 0000ffb7, %l1 = 00000000ffffffb7
	ldsba	[%i1+0x009]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = ff000000, %l4 = 00000000d61e7246
	ldsba	[%i0+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010181408] = 00003500, %l4 = ffffffffffffffff
	lduba	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001410] = 46720000, %l1 = 0000000000000000
	lduha	[%i0+%o5]0x81,%l1	! %l1 = 0000000000004672
!	Mem[0000000010141400] = 00000000000000ff, %f12 = 00000000 00000000
	ldda	[%i5+0x000]%asi,%f12	! %f12 = 00000000 000000ff
!	Mem[0000000030101410] = 000000ff, %l3 = 5fd29fead61e7246
	ldswa	[%i4+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = ffffffff, Mem[0000000010041430] = 9c86373a 48310000
	stda	%l4,[%i1+0x030]%asi	! Mem[0000000010041430] = 00000000 ffffffff

p0_label_250:
!	%l7 = 0000000000000000, Mem[000000001010142f] = 3b045018
	stb	%l7,[%i4+0x02f]		! Mem[000000001010142c] = 3b045000
!	Mem[0000000030001410] = 00007246, %l4 = 0000000000000000
	swapa	[%i0+%o5]0x89,%l4	! %l4 = 0000000000007246
!	%l4 = 0000000000007246, Mem[0000000010141408] = 00000000
	stba	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 46000000
!	%f16 = 45124473 ffffff00, %l3 = 00000000000000ff
!	Mem[0000000010081420] = ffdc00006f69bd3c
	add	%i2,0x020,%g1
	stda	%f16,[%g1+%l3]ASI_PST16_P ! Mem[0000000010081420] = 45124473ffffff00
!	Mem[0000000030181400] = 4500ff00, %l4 = 0000000000007246
	swapa	[%i6+%g0]0x89,%l4	! %l4 = 000000004500ff00
!	%l2 = ffffffffffffb0ff, Mem[00000000218000c0] = 0013f483
	sth	%l2,[%o3+0x0c0]		! Mem[00000000218000c0] = b0fff483
!	%f7  = 4500c94a, Mem[0000000010001400] = 000000ff
	sta	%f7 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 4500c94a
!	%l5 = ffffffffffffffff, Mem[0000000010081404] = 95000000
	sth	%l5,[%i2+0x004]		! Mem[0000000010081404] = ffff0000
!	%l2 = ffffffffffffb0ff, Mem[00000000300c1400] = b7003148
	stba	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff003148
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00000000, %l7 = 0000000000000000
	lduha	[%i5+%o4]0x81,%l7	! %l7 = 0000000000000000

p0_label_251:
!	Mem[0000000030181400] = 00007246, %l2 = ffffffffffffb0ff
	lduba	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000046
!	Mem[0000000010101400] = 3cd29fea, %l2 = 0000000000000046
	ldsba	[%i4+%g0]0x80,%l2	! %l2 = 000000000000003c
!	Mem[0000000010041408] = 0000ffb7, %l2 = 000000000000003c
	lduwa	[%i1+%o4]0x80,%l2	! %l2 = 000000000000ffb7
!	Mem[0000000010081408] = 00000000, %f4  = 00000000
	lda	[%i2+%o4]0x88,%f4 	! %f4 = 00000000
!	Mem[0000000010141408] = 00000046, %l4 = 000000004500ff00
	lduwa	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000046
!	Mem[0000000030081400] = 0000ffb79c35a6ff, %f16 = 45124473 ffffff00
	ldda	[%i2+%g0]0x81,%f16	! %f16 = 0000ffb7 9c35a6ff
	membar	#Sync			! Added by membar checker (44)
!	Mem[0000000010101400] = 3cd29fea d61e7246 000000ff 00000000
!	Mem[0000000010101410] = 6e000045 00000000 00003148 13bc0b50
!	Mem[0000000010101420] = 2108b4ff 0000005a 21084f18 3b045000
!	Mem[0000000010101430] = 00000000 00000000 45124473 00735b41
	ldda	[%i4]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010101400
!	Mem[0000000030001400] = 73441245, %l7 = 0000000000000000
	ldsba	[%i0+%g0]0x89,%l7	! %l7 = 0000000000000045
!	Mem[00000000100c1428] = 00000000, %l6 = 0000000000000000
	ldsha	[%i3+0x028]%asi,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000030101400] = 500bbc13ff0000ff
	stxa	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000000000000000

p0_label_252:
!	%l3 = 00000000000000ff, Mem[0000000030001400] = 73441245
	stba	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 734412ff
!	Mem[0000000030181408] = 000000ff, %l0 = 000000005fd29fea
	swapa	[%i6+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[000000001010140c] = 00000000, %l5 = ffffffffffffffff
	swap	[%i4+0x00c],%l5		! %l5 = 0000000000000000
!	Mem[0000000030141400] = 00000035, %l3 = 00000000000000ff
	swapa	[%i5+%g0]0x89,%l3	! %l3 = 0000000000000035
!	Mem[0000000010141424] = 6f69bd3c, %l5 = 0000000000000000, %asi = 80
	swapa	[%i5+0x024]%asi,%l5	! %l5 = 000000006f69bd3c
!	Mem[0000000010081400] = 3cbd696f, %l2 = 000000000000ffb7
	swapa	[%i2+%g0]0x88,%l2	! %l2 = 000000003cbd696f
!	%l5 = 000000006f69bd3c, Mem[0000000030041408] = ffff0000
	stba	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 3cff0000
!	Mem[0000000010041428] = 00000000be8b56a6, %l0 = 00000000000000ff, %l0 = 00000000000000ff
	add	%i1,0x28,%g1
	casxa	[%g1]0x80,%l0,%l0	! %l0 = 00000000be8b56a6
!	Mem[0000000010041400] = 00ffffff, %l7 = 0000000000000045
	ldstuba	[%i1+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 734412ff, %l0 = 00000000be8b56a6
	lduba	[%i0+%g0]0x89,%l0	! %l0 = 00000000000000ff

p0_label_253:
!	Mem[0000000030001408] = 00000000, %f24 = 40577e51
	lda	[%i0+%o4]0x81,%f24	! %f24 = 00000000
!	Mem[000000001008142c] = 0000006e, %l5 = 000000006f69bd3c
	lduwa	[%i2+0x02c]%asi,%l5	! %l5 = 000000000000006e
!	Mem[0000000010141400] = 00000000, %l1 = 0000000000004672
	ldsba	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041410] = ff000000, %f22 = 46721ed6
	lda	[%i1+%o5]0x81,%f22	! %f22 = ff000000
!	Mem[0000000010081400] = 0000ffb7, %f21 = 5fd29fea
	lda	[%i2+%g0]0x88,%f21	! %f21 = 0000ffb7
!	Mem[00000000201c0000] = 3c007e52, %l0 = 00000000000000ff
	lduh	[%o0+%g0],%l0		! %l0 = 0000000000003c00
!	Mem[0000000030181400] = ff00ff34 00007246, %l6 = 00000000, %l7 = 00000000
	ldda	[%i6+%g0]0x89,%l6	! %l6 = 0000000000007246 00000000ff00ff34
!	Mem[0000000010101408] = ff000000, %f20 = ff00ffff
	lda	[%i4+%o4]0x88,%f20	! %f20 = ff000000
!	Mem[0000000030041400] = 00003500, %f21 = 0000ffb7
	lda	[%i1+%g0]0x81,%f21	! %f21 = 00003500
!	Starting 10 instruction Store Burst
!	%l4 = 00000046, %l5 = 0000006e, Mem[0000000030101400] = 00000000 00000000
	stda	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000046 0000006e

p0_label_254:
!	Mem[000000001014143c] = ff33f359, %l0 = 00003c00, %l6 = 00007246
	add	%i5,0x3c,%g1
	casa	[%g1]0x80,%l0,%l6	! %l6 = 00000000ff33f359
!	Mem[0000000010001410] = 00000000, %l2 = 000000003cbd696f
	swapa	[%i0+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001400] = 4500c94a, %l3 = 0000000000000035
	ldstuba	[%i0+%g0]0x88,%l3	! %l3 = 0000004a000000ff
!	Mem[000000001010141b] = 00003148, %l1 = 0000000000000000
	ldstub	[%i4+0x01b],%l1		! %l1 = 00000048000000ff
!	Mem[000000001010142c] = 3b045000, %l3 = 000000000000004a
	swap	[%i4+0x02c],%l3		! %l3 = 000000003b045000
!	%l4 = 0000000000000046, Mem[0000000010001400] = ffc90045
	stwa	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000046
!	%l1 = 0000000000000048, Mem[0000000030181400] = ff00ff3400007246
	stxa	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000000000000048
!	%l1 = 0000000000000048, Mem[000000001008141c] = 00007246, %asi = 80
	stba	%l1,[%i2+0x01c]%asi	! Mem[000000001008141c] = 48007246
!	Mem[0000000010101413] = 6e000045, %l5 = 000000000000006e
	ldstub	[%i4+0x013],%l5		! %l5 = 00000045000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00000000, %f28 = 00003148
	lda	[%i5+%o5]0x80,%f28	! %f28 = 00000000

p0_label_255:
!	Mem[0000000010001430] = 00000000, %l7 = 00000000ff00ff34
	lduw	[%i0+0x030],%l7		! %l7 = 0000000000000000
	membar	#Sync			! Added by membar checker (45)
!	Mem[0000000010081400] = b7ff0000 ffff0000 00000000 000000ff
!	Mem[0000000010081410] = ff000000 000000ff 00000000 48007246
!	Mem[0000000010081420] = 45124473 ffffff00 0073006e 0000006e
!	Mem[0000000010081430] = 00000000 5f8fff8e 00000045 ff33f359
	ldda	[%i2]ASI_BLK_PL,%f0	! Block Load from 0000000010081400
!	Mem[00000000218000c0] = b0fff483, %l6 = 00000000ff33f359
	ldsh	[%o3+0x0c0],%l6		! %l6 = ffffffffffffb0ff
!	Mem[0000000010101408] = 000000ff, %l7 = 0000000000000000
	ldsba	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l2 = 0000000000000000
	ldsba	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041410] = ff00000000000000, %l7 = 0000000000000000
	ldxa	[%i1+%o5]0x81,%l7	! %l7 = ff00000000000000
!	Mem[00000000100c1400] = 00000000, %l0 = 0000000000003c00
	ldswa	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081408] = 3cbd696fff000000, %l1 = 0000000000000048
	ldxa	[%i2+%o4]0x89,%l1	! %l1 = 3cbd696fff000000
!	Mem[0000000010001438] = ff951bcb, %l5 = 0000000000000045
	lduwa	[%i0+0x038]%asi,%l5	! %l5 = 00000000ff951bcb
!	Starting 10 instruction Store Burst
!	%l1 = 3cbd696fff000000, Mem[0000000010181410] = ff000000
	stwa	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = ff000000

p0_label_256:
!	Mem[0000000010041410] = 5fd29fea, %l7 = ff00000000000000
	lduha	[%i1+%o5]0x88,%l7	! %l7 = 0000000000009fea
!	%f30 = 500bbc13, Mem[00000000100c1408] = ffffffff
	sta	%f30,[%i3+%o4]0x88	! Mem[00000000100c1408] = 500bbc13
!	%l2 = 0000000000000000, Mem[0000000010001400] = ffffffff46000000
	stxa	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000000
!	Mem[000000001008142b] = 0073006e, %l3 = 000000003b045000
	ldstuba	[%i2+0x02b]%asi,%l3	! %l3 = 0000006e000000ff
!	Mem[0000000010001410] = 3cbd696f, %l5 = 00000000ff951bcb
	ldstuba	[%i0+%o5]0x80,%l5	! %l5 = 0000003c000000ff
!	Mem[0000000030041408] = 3cff0000, %l5 = 000000000000003c
	ldstuba	[%i1+%o4]0x81,%l5	! %l5 = 0000003c000000ff
!	%l6 = ffffffffffffb0ff, Mem[0000000030001408] = 00000000
	stba	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000ff
	membar	#Sync			! Added by membar checker (46)
!	%l1 = 3cbd696fff000000, Mem[0000000010081434] = 5f8fff8e
	stb	%l1,[%i2+0x034]		! Mem[0000000010081434] = 008fff8e
!	%l6 = ffffffffffffb0ff, Mem[00000000300c1408] = ffff00ff
	stba	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffff00ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00350000, %l5 = 000000000000003c
	lduwa	[%i3+%o5]0x81,%l5	! %l5 = 0000000000350000

p0_label_257:
!	Mem[0000000010081408] = 00000000, %l5 = 0000000000350000
	ldsba	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181408] = 00350000, %f3  = 00000000
	lda	[%i6+%o4]0x88,%f3 	! %f3 = 00350000
!	Mem[0000000030001408] = ff000000, %l0 = 0000000000000000
	lduba	[%i0+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081414] = 000000ff, %l6 = ffffffffffffb0ff
	ldsh	[%i2+0x016],%l6		! %l6 = 00000000000000ff
!	Mem[000000001004143c] = 13bc0b50, %l4 = 0000000000000046
	ldsh	[%i1+0x03e],%l4		! %l4 = 0000000000000b50
!	Mem[00000000100c1408] = 13bc0b50, %l7 = 0000000000009fea
	ldsba	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000013
!	Mem[0000000010181400] = be8b56a6 00000000, %l4 = 00000b50, %l5 = 00000000
	ldd	[%i6+%g0],%l4		! %l4 = 00000000be8b56a6 0000000000000000
!	Mem[0000000010141410] = 00000000, %f1  = 0000ffb7
	lda	[%i5+%o5]0x80,%f1 	! %f1 = 00000000
!	Mem[00000000100c1424] = 000000f2, %l0 = 00000000000000ff
	lduha	[%i3+0x026]%asi,%l0	! %l0 = 00000000000000f2
!	Starting 10 instruction Store Burst
!	Mem[0000000010041407] = 73441245, %l1 = 3cbd696fff000000
	ldstuba	[%i1+0x007]%asi,%l1	! %l1 = 00000045000000ff

p0_label_258:
!	%l1 = 0000000000000045, Mem[000000001014141a] = 00000000
	sth	%l1,[%i5+0x01a]		! Mem[0000000010141418] = 00000045
!	%l1 = 0000000000000045, Mem[0000000030181400] = 48000000
	stha	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 00450000
!	Mem[0000000030081400] = b7ff0000, %l4 = 00000000be8b56a6
	ldstuba	[%i2+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%l0 = 00000000000000f2, Mem[0000000030041408] = ffff0000
	stba	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = f2ff0000
!	%l2 = 00000000, %l3 = 0000006e, Mem[00000000100c1410] = 00000000 00000048
	stda	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000 0000006e
!	Mem[00000000300c1408] = ff00ffff, %l7 = 0000000000000013
	ldstuba	[%i3+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[0000000030081410] = 000000480000ff00
	stxa	%l5,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000000000000000
!	%l6 = 00000000000000ff, Mem[0000000030081410] = 00000000
	stha	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff
!	Mem[0000000020800040] = ffff095a, %l7 = 00000000000000ff
	ldstuba	[%o1+0x040]%asi,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = e546fc9800350000, %f22 = ff000000 4f9300ff
	ldda	[%i1+%g0]0x89,%f22	! %f22 = e546fc98 00350000

p0_label_259:
!	Mem[0000000010081400] = b7ff0000, %l0 = 00000000000000f2
	ldsha	[%i2+%g0]0x80,%l0	! %l0 = ffffffffffffb7ff
!	Mem[0000000010041408] = b7ff0000, %l1 = 0000000000000045
	lduba	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181400] = 00450000, %l3 = 000000000000006e
	lduba	[%i6+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = ff000000, %l2 = 0000000000000000
	lduwa	[%i4+%o4]0x88,%l2	! %l2 = 00000000ff000000
!	Mem[0000000030181410] = 34ff30ff, %f31 = 5eb92bab
	lda	[%i6+%o5]0x89,%f31	! %f31 = 34ff30ff
!	Mem[000000001008140c] = 000000ff, %l7 = 00000000000000ff
	ldswa	[%i2+0x00c]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141404] = 000000ff, %f22 = e546fc98
	lda	[%i5+0x004]%asi,%f22	! %f22 = 000000ff
!	Mem[0000000010101408] = 000000ff, %l2 = 00000000ff000000
	lduba	[%i4+0x00b]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1408] = ff00ffff, %l2 = 00000000000000ff
	lduwa	[%i3+%o4]0x81,%l2	! %l2 = 00000000ff00ffff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ff00ffff, Mem[0000000030101400] = 0000006e00000046
	stxa	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000ff00ffff

p0_label_260:
!	Mem[0000000010081410] = 000000ff, %l7 = 00000000000000ff
	swapa	[%i2+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010081430] = 00000000 008fff8e
	std	%l4,[%i2+0x030]		! Mem[0000000010081430] = 00000000 00000000
!	Mem[0000000030001408] = ff000000, %l7 = 00000000000000ff
	ldstuba	[%i0+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010101422] = 2108b4ff, %l0 = ffffffffffffb7ff
	ldstuba	[%i4+0x022]%asi,%l0	! %l0 = 000000b4000000ff
!	%l2 = 00000000ff00ffff, Mem[0000000010001408] = 13bc0b50
	stba	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = ffbc0b50
!	Mem[0000000030141408] = 00000000, %l7 = 00000000000000ff
	swapa	[%i5+%o4]0x89,%l7	! %l7 = 0000000000000000
!	%f15 = 45000000, Mem[0000000030001408] = ff000000
	sta	%f15,[%i0+%o4]0x81	! Mem[0000000030001408] = 45000000
!	%l3 = 0000000000000000, Mem[0000000010041400] = ffffffff734412ff, %asi = 80
	stxa	%l3,[%i1+0x000]%asi	! Mem[0000000010041400] = 0000000000000000
!	Mem[0000000010141408] = 46000000, %l7 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l7	! %l7 = 00000046000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00000000 ffffffff, %l6 = 000000ff, %l7 = 00000046
	ldda	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000 00000000ffffffff

p0_label_261:
!	Mem[00000000300c1408] = ff00ffff45a78c73, %f0  = 0000ffff 00000000
	ldda	[%i3+%o4]0x81,%f0 	! %f0  = ff00ffff 45a78c73
!	Mem[00000000100c143c] = ffffff00, %f17 = 9c35a6ff
	lda	[%i3+0x03c]%asi,%f17	! %f17 = ffffff00
!	Mem[0000000010041420] = 6e0000ff 517e5740, %l2 = ff00ffff, %l3 = 00000000
	ldd	[%i1+0x020],%l2		! %l2 = 000000006e0000ff 00000000517e5740
!	Mem[00000000300c1408] = ff00ffff45a78c73, %l0 = 00000000000000b4
	ldxa	[%i3+%o4]0x81,%l0	! %l0 = ff00ffff45a78c73
!	Mem[00000000100c1408] = 500bbc13, %l2 = 000000006e0000ff
	lduwa	[%i3+%o4]0x88,%l2	! %l2 = 00000000500bbc13
!	Mem[0000000010001400] = 00000000 00000000, %l2 = 500bbc13, %l3 = 517e5740
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[00000000300c1408] = ff00ffff45a78c73, %f14 = 59f333ff 45000000
	ldda	[%i3+%o4]0x81,%f14	! %f14 = ff00ffff 45a78c73
!	Mem[0000000030101408] = 4ac90045, %l2 = 0000000000000000
	ldsba	[%i4+%o4]0x81,%l2	! %l2 = 000000000000004a
!	Mem[0000000010101418] = 000031ff, %l3 = 0000000000000000
	ldsba	[%i4+0x018]%asi,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 00000000, %l6 = 0000000000000000
	lduha	[%i5+%g0]0x80,%l6	! %l6 = 0000000000000000

p0_label_262:
!	Mem[0000000010001400] = 0000000000000000, %l0 = ff00ffff45a78c73, %l3 = 0000000000000000
	casxa	[%i0]0x80,%l0,%l3	! %l3 = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000010081421] = 45124473
	stb	%l1,[%i2+0x021]		! Mem[0000000010081420] = 45004473
!	%l5 = 0000000000000000, Mem[0000000010101408] = 000000ffffffffff
	stxa	%l5,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000030101410] = ff30ff34000000ff
	stxa	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000000000000000
!	%l7 = 00000000ffffffff, Mem[0000000010081420] = 45004473, %asi = 80
	stba	%l7,[%i2+0x020]%asi	! Mem[0000000010081420] = ff004473
!	%l3 = 0000000000000000, Mem[0000000030181410] = ff30ff3400000000
	stxa	%l3,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000000000000000
!	%l0 = ff00ffff45a78c73, Mem[0000000010181408] = 0000350000000000
	stxa	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = ff00ffff45a78c73
!	%l7 = 00000000ffffffff, Mem[0000000010141400] = 00000000, %asi = 80
	stha	%l7,[%i5+0x000]%asi	! Mem[0000000010141400] = ffff0000
!	%f17 = ffffff00, Mem[0000000030001400] = 734412ff
	sta	%f17,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffff00
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 0000000000000000, %f24 = 00000000 ff00006e
	ldda	[%i4+%o4]0x80,%f24	! %f24 = 00000000 00000000

p0_label_263:
!	Mem[00000000100c1434] = ff000000, %l5 = 0000000000000000
	ldsb	[%i3+0x036],%l5		! %l5 = 0000000000000000
!	Mem[0000000030041410] = 000000ff, %l6 = 0000000000000000
	lduwa	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081410] = 000000ff, %l4 = 0000000000000000
	ldsba	[%i2+%o5]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000300c1410] = 00003500, %l6 = 00000000000000ff
	ldsba	[%i3+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081410] = 000000ff, %f6  = 46720048
	lda	[%i2+%o5]0x89,%f6 	! %f6 = 000000ff
!	Mem[0000000010141408] = ff000000, %f23 = 00350000
	lda	[%i5+%o4]0x80,%f23	! %f23 = ff000000
!	Mem[0000000010001408] = ffbc0b50 5eb92bab, %l4 = ffffffff, %l5 = 00000000
	ldda	[%i0+%o4]0x80,%l4	! %l4 = 00000000ffbc0b50 000000005eb92bab
!	Mem[0000000010101410] = ff00006e, %l3 = 0000000000000000
	ldsha	[%i4+%o5]0x88,%l3	! %l3 = 000000000000006e
!	Mem[00000000100c1434] = ff000000, %l0 = ff00ffff45a78c73
	lduha	[%i3+0x036]%asi,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f12 = 8eff8f5f 00000000, Mem[0000000030181400] = 00450000 00000000
	stda	%f12,[%i6+%g0]0x81	! Mem[0000000030181400] = 8eff8f5f 00000000

p0_label_264:
!	%l5 = 000000005eb92bab, Mem[0000000020800000] = ff00ca09, %asi = 80
	stha	%l5,[%o1+0x000]%asi	! Mem[0000000020800000] = 2babca09
!	%l3 = 000000000000006e, Mem[0000000030081408] = 000000ff
	stba	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = 6e0000ff
!	%f2  = ff000000 00350000, Mem[0000000010141418] = 00000045 00007246
	std	%f2 ,[%i5+0x018]	! Mem[0000000010141418] = ff000000 00350000
!	%l2 = 0000004a, %l3 = 0000006e, Mem[0000000010181410] = ff000000 00000000
	stda	%l2,[%i6+0x010]%asi	! Mem[0000000010181410] = 0000004a 0000006e
!	Mem[0000000030141410] = 00000000, %l7 = 00000000ffffffff
	ldstuba	[%i5+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	%f20 = ff000000, Mem[0000000030001400] = 00ffffff
	sta	%f20,[%i0+%g0]0x81	! Mem[0000000030001400] = ff000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000030101400] = ff00ffff 00000000
	stda	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000 00000000
!	%f24 = 00000000 00000000, Mem[00000000300c1408] = ffff00ff 738ca745
	stda	%f24,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000 00000000
!	Mem[0000000010081410] = 000000ff, %l7 = 0000000000000000
	swapa	[%i2+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = 2babca09, %l0 = 0000000000000000
	ldsh	[%o1+%g0],%l0		! %l0 = 0000000000002bab

p0_label_265:
!	Mem[0000000030001408] = 45000000, %l7 = 00000000000000ff
	lduba	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000045
!	Mem[00000000201c0000] = 3c007e52, %l0 = 0000000000002bab
	ldsb	[%o0+%g0],%l0		! %l0 = 000000000000003c
!	Mem[0000000010181408] = ffff00ff, %l4 = 00000000ffbc0b50
	ldsha	[%i6+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041408] = f2ff0000, %l0 = 000000000000003c
	lduwa	[%i1+%o4]0x81,%l0	! %l0 = 00000000f2ff0000
!	Mem[0000000010001400] = 00000000, %l3 = 000000000000006e
	lduba	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141408] = 000000ff, %l6 = 0000000000000000
	lduha	[%i5+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181408] = ea9fd25f, %l4 = 00000000000000ff
	lduba	[%i6+%o4]0x81,%l4	! %l4 = 00000000000000ea
!	Mem[0000000030101400] = 00000000 00000000, %l0 = f2ff0000, %l1 = 00000000
	ldda	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010041400] = 00000000, %l7 = 0000000000000045
	ldsba	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 00000000, %l4 = 00000000000000ea
	ldstuba	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000ff

p0_label_266:
!	Mem[0000000030181408] = 5fd29fea, %l4 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l4	! %l4 = 000000ea000000ff
!	%l2 = 0000004a, %l3 = 00000000, Mem[0000000010181400] = be8b56a6 00000000
	stda	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000004a 00000000
!	%l2 = 0000004a, %l3 = 00000000, Mem[00000000100c1400] = 00000000 000000ff
	stda	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000004a 00000000
!	%f18 = 738ca745 b7ff0000, Mem[00000000100c1410] = 00000000 0000006e
	stda	%f18,[%i3+%o5]0x88	! Mem[00000000100c1410] = 738ca745 b7ff0000
!	%l6 = 00000000000000ff, Mem[0000000010181410] = 0000004a
	stwa	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000ff
!	%l6 = 00000000000000ff, Mem[00000000100c1400] = 0000004a, %asi = 80
	stwa	%l6,[%i3+0x000]%asi	! Mem[00000000100c1400] = 000000ff
!	%f12 = 8eff8f5f 00000000, Mem[0000000010001408] = 500bbcff ab2bb95e
	stda	%f12,[%i0+%o4]0x88	! Mem[0000000010001408] = 8eff8f5f 00000000
!	Mem[0000000010041428] = 00000000, %l3 = 0000000000000000, %asi = 80
	swapa	[%i1+0x028]%asi,%l3	! %l3 = 0000000000000000
!	%l1 = 0000000000000000, Mem[00000000100c1408] = 500bbc13
	stha	%l1,[%i3+%o4]0x88	! Mem[00000000100c1408] = 500b0000
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 3c007e52, %l5 = 000000005eb92bab
	lduh	[%o0+%g0],%l5		! %l5 = 0000000000003c00

p0_label_267:
!	Mem[0000000010081408] = 00000000, %f20 = ff000000
	lda	[%i2+%o4]0x80,%f20	! %f20 = 00000000
!	Mem[0000000030101410] = 00000000, %l4 = 00000000000000ea
	ldsba	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l7 = 0000000000000000
	lduwa	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081400] = ff00ffb7, %l4 = 0000000000000000
	lduha	[%i2+%g0]0x81,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010181400] = 0000004a, %l3 = 0000000000000000
	ldsha	[%i6+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = 4a000000, %l2 = 000000000000004a
	ldswa	[%i6+%g0]0x88,%l2	! %l2 = 000000004a000000
!	Mem[0000000030181410] = 0000000000000000, %f16 = 0000ffb7 ffffff00
	ldda	[%i6+%o5]0x81,%f16	! %f16 = 00000000 00000000
!	Mem[0000000010081410] = 00000000 000000ff, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i2+%o5]0x80,%l6	! %l6 = 0000000000000000 00000000000000ff
!	Mem[0000000030081408] = ff00006e, %l4 = 000000000000ff00
	lduba	[%i2+%o4]0x89,%l4	! %l4 = 000000000000006e
!	Starting 10 instruction Store Burst
!	%l2 = 000000004a000000, Mem[0000000030141408] = 00ff0000000000ff
	stxa	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000004a000000

p0_label_268:
!	%l1 = 0000000000000000, Mem[0000000010041400] = 0000000000000000
	stxa	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000000000000000
!	%l4 = 0000006e, %l5 = 00003c00, Mem[0000000010041408] = 0000ffb7 45a78c73
	stda	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000006e 00003c00
!	%l4 = 000000000000006e, Mem[0000000021800140] = b0ffab40
	stb	%l4,[%o3+0x140]		! Mem[0000000021800140] = 6effab40
!	%l7 = 00000000000000ff, Mem[0000000010101400] = 3cd29fead61e7246
	stxa	%l7,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000000000ff
!	%l2 = 4a000000, %l3 = 00000000, Mem[0000000030001408] = 00000045 ffffffff
	stda	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 4a000000 00000000
!	%f29 = 3a37869c, Mem[0000000010141408] = ff000000
	sta	%f29,[%i5+%o4]0x80	! Mem[0000000010141408] = 3a37869c
!	%f14 = ff00ffff, Mem[0000000010081410] = 00000000
	sta	%f14,[%i2+%o5]0x88	! Mem[0000000010081410] = ff00ffff
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000030001408] = 4a000000 00000000
	stda	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000 000000ff
!	Mem[0000000010041408] = 0000006e, %l4 = 000000000000006e
	swapa	[%i1+%o4]0x80,%l4	! %l4 = 000000000000006e
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ffbd696f, %l0 = 0000000000000000
	ldsba	[%i0+%o5]0x80,%l0	! %l0 = ffffffffffffffff

p0_label_269:
!	Mem[0000000010101400] = 00000000, %l7 = 00000000000000ff
	lduba	[%i4+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000201c0000] = 3c007e52, %l5 = 0000000000003c00
	ldsha	[%o0+0x000]%asi,%l5	! %l5 = 0000000000003c00
!	Mem[0000000030041410] = ff000000, %l0 = ffffffffffffffff
	ldsha	[%i1+%o5]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000030181410] = 00000000, %l0 = ffffffffffffff00
	ldsba	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c141c] = a4497f50, %l1 = 0000000000000000
	lduw	[%i3+0x01c],%l1		! %l1 = 00000000a4497f50
!	Mem[0000000030001400] = 000000ff, %l0 = 0000000000000000
	ldswa	[%i0+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1410] = 0000ffb7 45a78c73, %l4 = 0000006e, %l5 = 00003c00
	ldda	[%i3+%o5]0x80,%l4	! %l4 = 000000000000ffb7 0000000045a78c73
!	Mem[00000000201c0000] = 3c007e52, %l0 = 00000000000000ff
	ldsh	[%o0+%g0],%l0		! %l0 = 0000000000003c00
!	Mem[0000000030101400] = 00000000, %l0 = 0000000000003c00
	ldsha	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f16 = 00000000 00000000, Mem[00000000100c1418] = ffffcb1b a4497f50
	stda	%f16,[%i3+0x018]%asi	! Mem[00000000100c1418] = 00000000 00000000

p0_label_270:
!	Mem[00000000100c1400] = 000000ff, %l2 = 000000004a000000
	ldstuba	[%i3+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	%l4 = 000000000000ffb7, Mem[0000000010141410] = 00000000
	stw	%l4,[%i5+%o5]		! Mem[0000000010141410] = 0000ffb7
!	%l6 = 0000000000000000, Mem[0000000030041408] = f2ff0000
	stha	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	%l4 = 000000000000ffb7, Mem[0000000030141400] = ff00000000000000
	stxa	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000000000ffb7
!	Mem[0000000010081410] = ffff00ff, %l7 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l7	! %l7 = 000000ff000000ff
!	%l4 = 0000ffb7, %l5 = 45a78c73, Mem[0000000030181408] = 5fd29fff 00000000
	stda	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000ffb7 45a78c73
!	%l4 = 0000ffb7, %l5 = 45a78c73, Mem[0000000030001410] = 000000ff ffffffff
	stda	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000ffb7 45a78c73
!	Mem[00000000100c1400] = ff0000ff, %l5 = 0000000045a78c73
	ldstuba	[%i3+%g0]0x80,%l5	! %l5 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000010101408] = 00000000
	stha	%l5,[%i4+%o4]0x80	! Mem[0000000010101408] = 00ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = 2babca09, %l2 = 0000000000000000
	ldsb	[%o1+0x001],%l2		! %l2 = ffffffffffffffab

p0_label_271:
!	Mem[0000000010001428] = 500bbc1300000000, %l0 = 0000000000000000
	ldxa	[%i0+0x028]%asi,%l0	! %l0 = 500bbc1300000000
!	Mem[0000000010181400] = 4a000000, %l3 = 0000000000000000
	lduwa	[%i6+%g0]0x88,%l3	! %l3 = 000000004a000000
!	Mem[000000001010140c] = 00000000, %l6 = 0000000000000000
	lduba	[%i4+0x00d]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081400] = b7ff00ff, %l6 = 0000000000000000
	ldsba	[%i2+%g0]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010001400] = 00000000, %l1 = 00000000a4497f50
	ldswa	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = ea9fd25f, %l3 = 000000004a000000
	lduba	[%i1+%o5]0x80,%l3	! %l3 = 00000000000000ea
!	Mem[0000000030081408] = 3cbd696fff00006e, %f22 = 000000ff ff000000
	ldda	[%i2+%o4]0x89,%f22	! %f22 = 3cbd696f ff00006e
!	Mem[0000000010101408] = 00ff0000, %l0 = 500bbc1300000000
	ldsba	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = 00000000 ff0000ff, %l4 = 0000ffb7, %l5 = 000000ff
	ldda	[%i3+%g0]0x88,%l4	! %l4 = 00000000ff0000ff 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = ffffffab, %l3 = 000000ea, Mem[0000000010081400] = 0000ffb7 0000ffff
	stda	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffffab 000000ea

p0_label_272:
!	%l6 = ffffffff, %l7 = 000000ff, Mem[0000000010041400] = 00000000 00000000
	stda	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = ffffffff 000000ff
!	%f22 = 3cbd696f, Mem[00000000100c1400] = ff0000ff
	sta	%f22,[%i3+%g0]0x80	! Mem[00000000100c1400] = 3cbd696f
!	%l3 = 00000000000000ea, Mem[0000000030181400] = 8eff8f5f00000000
	stxa	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000000000ea
!	%f12 = 8eff8f5f 00000000, %l1 = 0000000000000000
!	Mem[0000000010141420] = 7e4b9eff00000000
	add	%i5,0x020,%g1
	stda	%f12,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010141420] = 7e4b9eff00000000
!	Mem[000000001010140c] = 00000000, %l2 = ffffffab, %l6 = ffffffff
	add	%i4,0x0c,%g1
	casa	[%g1]0x80,%l2,%l6	! %l6 = 0000000000000000
!	%l7 = 00000000000000ff, Mem[0000000010081410] = ffff00ff000000ff
	stxa	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000000000ff
!	Mem[0000000010181438] = ff5a66fe, %l0 = 0000000000000000
	swap	[%i6+0x038],%l0		! %l0 = 00000000ff5a66fe
!	Mem[0000000030141408] = 4a000000, %l5 = 0000000000000000
	ldstuba	[%i5+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000010141400] = ffff0000
	stba	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 00ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00ff0000 b7ff0000, %l2 = ffffffab, %l3 = 000000ea
	ldda	[%i5+%o5]0x88,%l2	! %l2 = 00000000b7ff0000 0000000000ff0000

p0_label_273:
!	Mem[0000000010101408] = 00ff0000, %l2 = 00000000b7ff0000
	ldsw	[%i4+%o4],%l2		! %l2 = 0000000000ff0000
!	Mem[0000000010041410] = ea9fd25f, %l6 = 0000000000000000
	lduwa	[%i1+%o5]0x80,%l6	! %l6 = 00000000ea9fd25f
!	Mem[0000000010181408] = ff00ffff, %l0 = 00000000ff5a66fe
	lduwa	[%i6+%o4]0x80,%l0	! %l0 = 00000000ff00ffff
!	Mem[0000000010081400] = ffffffab, %f5  = 000000ff
	lda	[%i2+%g0]0x88,%f5 	! %f5 = ffffffab
!	Mem[0000000010001410] = 6f69bdff, %l6 = 00000000ea9fd25f
	ldswa	[%i0+%o5]0x88,%l6	! %l6 = 000000006f69bdff
!	Mem[000000001004143c] = 13bc0b50, %l6 = 000000006f69bdff
	ldswa	[%i1+0x03c]%asi,%l6	! %l6 = 0000000013bc0b50
!	Mem[00000000100c1420] = 00000000, %l6 = 0000000013bc0b50
	lduha	[%i3+0x020]%asi,%l6	! %l6 = 0000000000000000
!	Mem[000000001000143c] = 5e000000, %l5 = 0000000000000000
	lduba	[%i0+0x03c]%asi,%l5	! %l5 = 000000000000005e
!	Mem[00000000100c1408] = 00000b50, %l4 = 00000000ff0000ff
	ldswa	[%i3+%o4]0x80,%l4	! %l4 = 0000000000000b50
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = 00001327, %l4 = 0000000000000b50
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 00000000000000ff

p0_label_274:
!	Mem[0000000030041400] = 00003500, %l2 = 0000000000ff0000
	ldstuba	[%i1+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000030081408] = 6e0000ff
	stha	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000ff
!	%f6  = 000000ff, Mem[0000000030081408] = ff000000
	sta	%f6 ,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000ff
!	%l5 = 000000000000005e, Mem[0000000010141424] = 00000000
	sth	%l5,[%i5+0x024]		! Mem[0000000010141424] = 005e0000
!	%f10 = 6e000000 6e007300, Mem[00000000100c1410] = 0000ffb7 45a78c73
	stda	%f10,[%i3+%o5]0x80	! Mem[00000000100c1410] = 6e000000 6e007300
!	%f0  = ff00ffff 45a78c73 ff000000 00350000
!	%f4  = ff000000 ffffffab 000000ff 00000000
!	%f8  = 00ffffff 73441245 6e000000 6e007300
!	%f12 = 8eff8f5f 00000000 ff00ffff 45a78c73
	stda	%f0,[%i5]ASI_BLK_P	! Block Store to 0000000010141400
	membar	#Sync			! Added by membar checker (47)
!	%f0  = ff00ffff 45a78c73 ff000000 00350000
!	%f4  = ff000000 ffffffab 000000ff 00000000
!	%f8  = 00ffffff 73441245 6e000000 6e007300
!	%f12 = 8eff8f5f 00000000 ff00ffff 45a78c73
	stda	%f0,[%i5]ASI_BLK_PL	! Block Store to 0000000010141400
!	Mem[0000000010041410] = ea9fd25f, %l3 = 0000000000ff0000
	swapa	[%i1+%o5]0x80,%l3	! %l3 = 00000000ea9fd25f
!	%l2 = 0000000000000000, Mem[0000000030001408] = 00000000ff000000
	stxa	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001424] = ff0000ff, %l7 = 00000000000000ff
	ldsh	[%i0+0x026],%l7		! %l7 = 00000000000000ff

p0_label_275:
!	Mem[0000000010001404] = 00000000, %l5 = 000000000000005e
	ldsh	[%i0+0x006],%l5		! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (48)
!	Mem[0000000010141408] = ff000000 00350000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i5+%o4]0x88,%l4	! %l4 = 0000000000350000 00000000ff000000
!	%f20 = 00000000, Mem[00000000100c1400] = 3cbd696f
	sta	%f20,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	Mem[00000000300c1400] = ff003148, %l2 = 0000000000000000
	lduha	[%i3+%g0]0x81,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030181408] = b7ff0000, %l4 = 0000000000350000
	lduwa	[%i6+%o4]0x81,%l4	! %l4 = 00000000b7ff0000
!	Mem[0000000030101410] = 00000000, %f17 = 00000000
	lda	[%i4+%o5]0x89,%f17	! %f17 = 00000000
!	Mem[0000000030181400] = 00000000, %l0 = 00000000ff00ffff
	ldsba	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101410] = 6e0000ff00000000, %l0 = 0000000000000000
	ldxa	[%i4+%o5]0x80,%l0	! %l0 = 6e0000ff00000000
!	Mem[0000000010041430] = 00000000, %l4 = 00000000b7ff0000
	ldsw	[%i1+0x030],%l4		! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 00000000, %l3 = 00000000ea9fd25f, %asi = 80
	swapa	[%i0+0x008]%asi,%l3	! %l3 = 0000000000000000

p0_label_276:
!	Mem[0000000030141400] = 00000000, %l3 = 0000000000000000
	swapa	[%i5+%g0]0x81,%l3	! %l3 = 0000000000000000
!	%f2  = ff000000, Mem[0000000010081410] = 00000000
	sta	%f2 ,[%i2+%o5]0x88	! Mem[0000000010081410] = ff000000
!	%l7 = 00000000000000ff, Mem[0000000010141408] = 00003500
	stwa	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000ff
!	Mem[0000000030001408] = 00000000, %l3 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000000
!	%l4 = 0000000000000000, Mem[00000000100c1438] = f1d308f3ffffff00
	stx	%l4,[%i3+0x038]		! Mem[00000000100c1438] = 0000000000000000
!	%l5 = 00000000ff000000, Mem[00000000100c1436] = ff000000, %asi = 80
	stha	%l5,[%i3+0x036]%asi	! Mem[00000000100c1434] = ff000000
!	%l1 = 0000000000000000, Mem[0000000030001408] = 00000000
	stwa	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	Mem[00000000300c1408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041410] = 0000ff00, %l7 = 00000000000000ff
	swapa	[%i1+%o5]0x88,%l7	! %l7 = 000000000000ff00
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 0000ff00, %l5 = 00000000ff000000
	ldswa	[%i4+%o4]0x88,%l5	! %l5 = 000000000000ff00

p0_label_277:
!	Mem[0000000030081408] = 3cbd696f 000000ff, %l6 = 00000000, %l7 = 0000ff00
	ldda	[%i2+%o4]0x89,%l6	! %l6 = 00000000000000ff 000000003cbd696f
!	Mem[0000000030181410] = 00000000, %l4 = 0000000000000000
	ldswa	[%i6+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = 45a78c73, %l1 = 0000000000000000
	lduwa	[%i5+%g0]0x88,%l1	! %l1 = 0000000045a78c73
!	Mem[00000000100c1408] = 00000b50, %l3 = 0000000000000000
	ldsw	[%i3+%o4],%l3		! %l3 = 0000000000000b50
!	Mem[0000000010041408] = 0000006e00003c00, %l6 = 00000000000000ff
	ldxa	[%i1+%o4]0x80,%l6	! %l6 = 0000006e00003c00
!	Mem[00000000100c1410] = 0000006e, %l4 = 0000000000000000
	ldsba	[%i3+%o5]0x88,%l4	! %l4 = 000000000000006e
!	Mem[0000000010181400] = 0000004a, %l0 = 6e0000ff00000000
	ldswa	[%i6+%g0]0x80,%l0	! %l0 = 000000000000004a
!	Mem[0000000030001408] = 00000000, %l6 = 0000006e00003c00
	ldsba	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = ff000000, %l0 = 000000000000004a
	lduwa	[%i3+%o4]0x81,%l0	! %l0 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000b50, Mem[0000000010141408] = ff000000
	stha	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = ff000b50

p0_label_278:
!	%l0 = 00000000ff000000, Mem[00000000100c1410] = 6e000000
	stwa	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff000000
!	%f2  = ff000000 00350000, Mem[0000000030181410] = 00000000 00000000
	stda	%f2 ,[%i6+%o5]0x81	! Mem[0000000030181410] = ff000000 00350000
!	%l4 = 000000000000006e, Mem[0000000030041410] = 000000ff
	stba	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000006e
!	Mem[0000000010001410] = ffbd696f, %l1 = 0000000045a78c73
	swapa	[%i0+%o5]0x80,%l1	! %l1 = 00000000ffbd696f
!	%f20 = 00000000 00003500, Mem[0000000010001438] = ff951bcb 5e000000
	stda	%f20,[%i0+0x038]%asi	! Mem[0000000010001438] = 00000000 00003500
!	Mem[0000000010041418] = ff00934fd61e7246, %l6 = 0000000000000000, %l6 = 0000000000000000
	add	%i1,0x18,%g1
	casxa	[%g1]0x80,%l6,%l6	! %l6 = ff00934fd61e7246
!	%f0  = ff00ffff 45a78c73 ff000000 00350000
!	%f4  = ff000000 ffffffab 000000ff 00000000
!	%f8  = 00ffffff 73441245 6e000000 6e007300
!	%f12 = 8eff8f5f 00000000 ff00ffff 45a78c73
	stda	%f0,[%i2]ASI_COMMIT_S	! Block Store to 0000000030081400
!	Mem[0000000010041410] = 000000ff, %l0 = 00000000ff000000
	swapa	[%i1+%o5]0x88,%l0	! %l0 = 00000000000000ff
	membar	#Sync			! Added by membar checker (49)
!	Mem[0000000010081410] = 000000ff, %l1 = 00000000ffbd696f
	ldstuba	[%i2+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141418] = 00000000, %f30 = 500bbc13
	lda	[%i5+0x018]%asi,%f30	! %f30 = 00000000

p0_label_279:
!	Mem[0000000030181410] = 00003500 000000ff, %l2 = 0000ff00, %l3 = 00000b50
	ldda	[%i6+%o5]0x89,%l2	! %l2 = 00000000000000ff 0000000000003500
!	Mem[0000000030081408] = 000000ff, %l6 = ff00934fd61e7246
	lduba	[%i2+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1400] = ff003148, %l1 = 0000000000000000
	ldswa	[%i3+%g0]0x81,%l1	! %l1 = ffffffffff003148
!	%f19 = b7ff0000, %f0  = ff00ffff
	fsqrts	%f19,%f0 		! %f0  = 7fffffff
!	Mem[0000000030141408] = ff00004a 00000000, %l4 = 0000006e, %l5 = 0000ff00
	ldda	[%i5+%o4]0x81,%l4	! %l4 = 00000000ff00004a 0000000000000000
!	Mem[0000000010001408] = ea9fd25f, %l5 = 0000000000000000
	ldswa	[%i0+%o4]0x80,%l5	! %l5 = ffffffffea9fd25f
!	Mem[0000000010041404] = 000000ff, %l0 = 00000000000000ff
	lduh	[%i1+0x006],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030081408] = ff00000000350000, %l6 = 00000000000000ff
	ldxa	[%i2+%o4]0x81,%l6	! %l6 = ff00000000350000
!	Mem[0000000010081424] = ffffff00, %l1 = ffffffffff003148
	ldsba	[%i2+0x025]%asi,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 000000ff, %l1 = ffffffffffffffff
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 00000000000000ff

p0_label_280:
!	Mem[0000000010081400] = abffffff, %l6 = ff00000000350000
	ldstuba	[%i2+%g0]0x80,%l6	! %l6 = 000000ab000000ff
!	Mem[0000000030001408] = 00000000, %l7 = 000000003cbd696f
	ldstuba	[%i0+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000010041418] = ff00934fd61e7246
	stx	%l0,[%i1+0x018]		! Mem[0000000010041418] = 00000000000000ff
!	Mem[0000000010001410] = 738ca745, %l1 = 00000000000000ff
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 00000000738ca745
!	%f22 = 3cbd696f ff00006e, Mem[0000000030141410] = 000000ff ff000000
	stda	%f22,[%i5+%o5]0x89	! Mem[0000000030141410] = 3cbd696f ff00006e
!	%l2 = 000000ff, %l3 = 00003500, Mem[00000000100c1400] = 00000000 00000000
	stda	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff 00003500
!	%l5 = ffffffffea9fd25f, Mem[0000000010081408] = 00000000
	stwa	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = ea9fd25f
!	%l4 = 00000000ff00004a, Mem[0000000030001410] = 0000ffb7
	stha	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000004a
!	%f2  = ff000000 00350000, Mem[0000000010001438] = 00000000 00003500
	std	%f2 ,[%i0+0x038]	! Mem[0000000010001438] = ff000000 00350000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ff000000, %l6 = 00000000000000ab
	ldsha	[%i3+%o4]0x81,%l6	! %l6 = ffffffffffffff00

p0_label_281:
!	Mem[0000000030081400] = ffff00ff, %l3 = 0000000000003500
	lduwa	[%i2+%g0]0x89,%l3	! %l3 = 00000000ffff00ff
!	Mem[00000000100c1430] = 5fd29fea, %l7 = 0000000000000000
	lduha	[%i3+0x030]%asi,%l7	! %l7 = 0000000000005fd2
!	Mem[00000000100c1408] = 00000b50, %l7 = 0000000000005fd2
	lduha	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081410] = ff0000ff, %l1 = 00000000738ca745
	lduwa	[%i2+%o5]0x80,%l1	! %l1 = 00000000ff0000ff
!	Mem[00000000100c1438] = 0000000000000000, %f12 = 8eff8f5f 00000000
	ldda	[%i3+0x038]%asi,%f12	! %f12 = 00000000 00000000
!	Mem[0000000030041410] = 0000006e, %l0 = 00000000000000ff
	lduba	[%i1+%o5]0x89,%l0	! %l0 = 000000000000006e
!	Mem[00000000100c1408] = 95ffffff 500b0000, %l2 = 000000ff, %l3 = ffff00ff
	ldda	[%i3+%o4]0x88,%l2	! %l2 = 00000000500b0000 0000000095ffffff
!	Mem[0000000010041408] = 6e000000, %l6 = ffffffffffffff00
	ldstuba	[%i1+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041410] = ff000000, %l6 = 0000000000000000
	lduwa	[%i1+%o5]0x88,%l6	! %l6 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = ffffffab, %l0 = 000000000000006e
	swapa	[%i5+%o5]0x88,%l0	! %l0 = 00000000ffffffab

p0_label_282:
!	%l6 = 00000000ff000000, Mem[0000000021800100] = ff488c1a
	stb	%l6,[%o3+0x100]		! Mem[0000000021800100] = 00488c1a
!	%l5 = ffffffffea9fd25f, Mem[0000000030101408] = 4500c94a
	stba	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 4500c95f
!	Mem[0000000010181410] = 000000ff, %l3 = 0000000095ffffff
	ldstuba	[%i6+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000021800140] = 6effab40, %l4 = 00000000ff00004a
	ldstub	[%o3+0x140],%l4		! %l4 = 0000006e000000ff
!	%l6 = 00000000ff000000, Mem[0000000010081410] = ff0000ff
	stha	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = ff000000
!	%f28 = 00000000, Mem[00000000300c1410] = 00350000
	sta	%f28,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	%f12 = 00000000, Mem[0000000010081400] = ffffffff
	sta	%f12,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	%l5 = ffffffffea9fd25f, Mem[0000000010041408] = ff00006e
	stwa	%l5,[%i1+%o4]0x80	! Mem[0000000010041408] = ea9fd25f
!	Mem[0000000010101410] = ff00006e, %l7 = 0000000000000000
	swapa	[%i4+%o5]0x88,%l7	! %l7 = 00000000ff00006e
!	Starting 10 instruction Load Burst
!	Mem[0000000010181438] = 00000000, %l0 = 00000000ffffffab
	ldswa	[%i6+0x038]%asi,%l0	! %l0 = 0000000000000000

p0_label_283:
!	Mem[0000000010181408] = ff00ffff, %l4 = 000000000000006e
	lduba	[%i6+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081400] = 00000000, %l2 = 00000000500b0000
	lduba	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1400] = 000000ff, %l1 = 00000000ff0000ff
	lduba	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l6 = 00000000ff000000
	ldsba	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %f14 = ff00ffff
	lda	[%i0+%g0]0x80,%f14	! %f14 = 00000000
!	Mem[0000000020800000] = 2babca09, %l0 = 0000000000000000
	ldsha	[%o1+0x000]%asi,%l0	! %l0 = 0000000000002bab
!	Mem[0000000010181400] = 4a000000, %l1 = 0000000000000000
	lduha	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = 500b00ff, %l7 = 00000000ff00006e
	lduwa	[%i5+%o4]0x80,%l7	! %l7 = 00000000500b00ff
!	Mem[0000000010141408] = 500b00ff000000ff, %l0 = 0000000000002bab
	ldxa	[%i5+%o4]0x80,%l0	! %l0 = 500b00ff000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 500b00ff000000ff, Mem[00000000300c1410] = 00000000
	stba	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000ff

p0_label_284:
!	%l0 = 500b00ff000000ff, Mem[000000001000143a] = ff000000, %asi = 80
	stha	%l0,[%i0+0x03a]%asi	! Mem[0000000010001438] = ff0000ff
!	%f24 = 00000000, Mem[0000000010141430] = 00000000
	st	%f24,[%i5+0x030]	! Mem[0000000010141430] = 00000000
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030081400] = ffff00ff 738ca745
	stda	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000 00000000
!	%l4 = 00000000000000ff, Mem[0000000030181408] = 0000ffb7
	stba	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000ffff
!	%f9  = 73441245, Mem[0000000030081410] = ff000000
	sta	%f9 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 73441245
!	%l3 = 0000000000000000, Mem[00000000211c0000] = ff001327
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 00001327
!	%l5 = ffffffffea9fd25f, Mem[0000000030041400] = 003500ff
	stba	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = 0035005f
!	%f0  = 7fffffff 45a78c73, Mem[0000000010081428] = 007300ff 0000006e
	std	%f0 ,[%i2+0x028]	! Mem[0000000010081428] = 7fffffff 45a78c73
!	Mem[0000000010001408] = 5fd29fea, %l5 = ffffffffea9fd25f
	ldstuba	[%i0+%o4]0x88,%l5	! %l5 = 000000ea000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff000000, %l7 = 00000000500b00ff
	ldsba	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000000

p0_label_285:
!	Mem[0000000010141410] = 6e000000, %l6 = 0000000000000000
	ldsha	[%i5+%o5]0x80,%l6	! %l6 = 0000000000006e00
!	Mem[0000000030141400] = 00000000 0000ffb7, %l2 = 00000000, %l3 = 00000000
	ldda	[%i5+%g0]0x81,%l2	! %l2 = 0000000000000000 000000000000ffb7
!	Mem[0000000010101408] = 0000ff00, %l5 = 00000000000000ea
	lduwa	[%i4+%o4]0x88,%l5	! %l5 = 000000000000ff00
!	Mem[0000000010081424] = ffffff00, %l4 = 00000000000000ff
	lduwa	[%i2+0x024]%asi,%l4	! %l4 = 00000000ffffff00
!	Mem[0000000010001408] = 5fd29fff, %l1 = 0000000000000000
	ldsba	[%i0+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001408] = ff9fd25f 5f8fff8e, %l0 = 000000ff, %l1 = ffffffff
	ldda	[%i0+%o4]0x80,%l0	! %l0 = 00000000ff9fd25f 000000005f8fff8e
!	Mem[0000000010181408] = ff00ffff, %l1 = 000000005f8fff8e
	ldsba	[%i6+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030081400] = 00000000, %f29 = 3a37869c
	lda	[%i2+%g0]0x81,%f29	! %f29 = 00000000
!	Mem[0000000010141430] = 00000000 5f8fff8e, %l6 = 00006e00, %l7 = 00000000
	ldd	[%i5+0x030],%l6		! %l6 = 0000000000000000 000000005f8fff8e
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffffff, Mem[0000000020800040] = ffff095a
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040] = ffff095a

p0_label_286:
!	%l7 = 000000005f8fff8e, Mem[0000000030081408] = ff00000000350000
	stxa	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000005f8fff8e
!	%l2 = 0000000000000000, Mem[0000000010001428] = 500bbc13, %asi = 80
	stwa	%l2,[%i0+0x028]%asi	! Mem[0000000010001428] = 00000000
!	%l2 = 0000000000000000, Mem[0000000010081400] = 00000000
	stha	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	Mem[00000000100c1418] = 00000000, %l4 = 00000000ffffff00, %asi = 80
	swapa	[%i3+0x018]%asi,%l4	! %l4 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030041408] = 0000000000000000
	stxa	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000000000000
!	%f30 = 00000000 34ff30ff, Mem[0000000030041400] = 0035005f e546fc98
	stda	%f30,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000 34ff30ff
!	Mem[00000000300c1410] = ff000000, %l5 = 000000000000ff00
	ldstuba	[%i3+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	%l0 = 00000000ff9fd25f, Mem[0000000010041427] = 517e5740, %asi = 80
	stba	%l0,[%i1+0x027]%asi	! Mem[0000000010041424] = 517e575f
!	Mem[0000000030081408] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff000000, %l3 = 000000000000ffb7
	ldsba	[%i2+%o5]0x88,%l3	! %l3 = 0000000000000000

p0_label_287:
!	Mem[0000000010181408] = ffff00ff, %l7 = 000000005f8fff8e
	lduha	[%i6+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1408] = 00000b50ffffff95, %f12 = 00000000 00000000
	ldda	[%i3+%o4]0x80,%f12	! %f12 = 00000b50 ffffff95
!	Mem[0000000010001400] = 00000000, %l7 = 00000000000000ff
	lduba	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = 6e000000, %l4 = 0000000000000000
	lduha	[%i5+%o5]0x80,%l4	! %l4 = 0000000000006e00
!	Mem[0000000010001400] = 00000000, %l6 = 0000000000000000
	ldsba	[%i0+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041424] = 517e575f, %l4 = 0000000000006e00
	lduw	[%i1+0x024],%l4		! %l4 = 00000000517e575f
!	Mem[000000001014141c] = ff000000, %l5 = 00000000000000ff
	lduha	[%i5+0x01e]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081410] = 73441245, %f8  = 00ffffff
	lda	[%i2+%o5]0x81,%f8 	! %f8 = 73441245
!	Mem[0000000030041400] = ff30ff34, %l0 = 00000000ff9fd25f
	ldswa	[%i1+%g0]0x81,%l0	! %l0 = ffffffffff30ff34
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = ff000000, %l7 = 0000000000000000
	swapa	[%i2+%o4]0x81,%l7	! %l7 = 00000000ff000000

p0_label_288:
!	%l3 = 0000000000000000, Mem[0000000010081410] = 000000ff
	stba	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff
!	Mem[0000000010041400] = ffffffff, %l3 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l3	! %l3 = 000000ff000000ff
!	%l4 = 00000000517e575f, Mem[0000000010041410] = ff000000
	stha	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = ff00575f
!	%l2 = 0000000000000000, Mem[0000000010081432] = 00000000
	stb	%l2,[%i2+0x032]		! Mem[0000000010081430] = 00000000
!	Mem[00000000100c1400] = 000000ff, %l5 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%l1 = ffffffffffffffff, Mem[0000000010181418] = 00000000ffff00ff, %asi = 80
	stxa	%l1,[%i6+0x018]%asi	! Mem[0000000010181418] = ffffffffffffffff
!	%f4  = ff000000 ffffffab, Mem[0000000010081438] = 00000045 ff33f359
	std	%f4 ,[%i2+0x038]	! Mem[0000000010081438] = ff000000 ffffffab
!	Mem[00000000100c1408] = 00000b50, %l4 = 00000000517e575f
	swapa	[%i3+%o4]0x80,%l4	! %l4 = 0000000000000b50
!	%l4 = 0000000000000b50, Mem[0000000010041408] = 003c00005fd29fea
	stxa	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000000b50
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000000, %l7 = 00000000ff000000
	lduwa	[%i0+%g0]0x88,%l7	! %l7 = 0000000000000000

p0_label_289:
!	Mem[0000000010081408] = 5fd29fea, %l2 = 0000000000000000
	ldub	[%i2+0x00a],%l2		! %l2 = 000000000000009f
!	Mem[0000000010001428] = 00000000, %l1 = ffffffffffffffff
	ldsb	[%i0+0x029],%l1		! %l1 = 0000000000000000
!	Mem[0000000030181408] = 0000ffff, %l3 = 00000000000000ff
	ldswa	[%i6+%o4]0x89,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010101408] = 000000000000ff00, %l4 = 0000000000000b50
	ldxa	[%i4+%o4]0x88,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010101418] = 000031ff13bc0b50, %f26 = a6568bbe 00000000
	ldd	[%i4+0x018],%f26	! %f26 = 000031ff 13bc0b50
!	Mem[0000000010041400] = ffffffff, %l7 = 0000000000000000
	lduha	[%i1+%g0]0x88,%l7	! %l7 = 000000000000ffff
!	Mem[00000000100c1408] = 517e575f, %l6 = 0000000000000000
	lduba	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000051
!	Mem[0000000010081410] = 000000ff, %f8  = 73441245
	lda	[%i2+%o5]0x80,%f8 	! %f8 = 000000ff
!	Mem[0000000010041408] = 00000b50, %l2 = 000000000000009f
	ldswa	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000b50
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffff30ff34, Mem[00000000211c0000] = 00001327, %asi = 80
	stha	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = ff341327

p0_label_290:
!	Mem[0000000030001400] = ff000000, %l6 = 0000000000000051
	ldstuba	[%i0+%g0]0x81,%l6	! %l6 = 000000ff000000ff
!	%f26 = 000031ff 13bc0b50, Mem[0000000010101438] = 45124473 00735b41
	std	%f26,[%i4+0x038]	! Mem[0000000010101438] = 000031ff 13bc0b50
!	Mem[0000000030001410] = 0000004a, %l1 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l1	! %l1 = 0000004a000000ff
!	%f14 = 00000000 45a78c73, Mem[0000000030041408] = 00000000 00000000
	stda	%f14,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000 45a78c73
!	Mem[00000000100c1408] = 5f577e51, %l5 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l5	! %l5 = 000000005f577e51
!	%f14 = 00000000 45a78c73, Mem[0000000010101408] = 0000ff00 00000000
	stda	%f14,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000 45a78c73
!	%l4 = 0000ff00, %l5 = 5f577e51, Mem[0000000010181400] = 0000004a 00000000
	stda	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000ff00 5f577e51
!	Mem[000000001000142f] = 00000000, %l0 = ffffffffff30ff34
	ldstub	[%i0+0x02f],%l0		! %l0 = 00000000000000ff
!	%l0 = 00000000, %l1 = 0000004a, Mem[00000000300c1408] = ff000000 00000000
	stda	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000 0000004a
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ff0000ff 00003500, %l2 = 00000b50, %l3 = 0000ffff
	ldda	[%i3+0x000]%asi,%l2	! %l2 = 00000000ff0000ff 0000000000003500

p0_label_291:
!	Mem[0000000030141408] = 4a0000ff, %l5 = 000000005f577e51
	lduba	[%i5+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[00000000201c0000] = 3c007e52, %l5 = 00000000000000ff
	ldsh	[%o0+%g0],%l5		! %l5 = 0000000000003c00
!	Mem[0000000030001408] = 000000ff, %f31 = 34ff30ff
	lda	[%i0+%o4]0x89,%f31	! %f31 = 000000ff
!	Mem[0000000030181410] = ff000000, %l6 = 00000000000000ff
	lduwa	[%i6+%o5]0x81,%l6	! %l6 = 00000000ff000000
!	Mem[00000000100c1408] = 00000000, %l5 = 0000000000003c00
	ldsba	[%i3+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001410] = 000000ff, %l2 = 00000000ff0000ff
	ldsba	[%i0+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141408] = ff000b50, %l5 = 0000000000000000
	lduba	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000050
!	Mem[0000000030101410] = 0000000000000000, %l6 = 00000000ff000000
	ldxa	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %l4 = 000000000000ff00
	ldsba	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000030041408] = 45a78c73
	stba	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 45a78c00

p0_label_292:
!	%l4 = 00000000, %l5 = 00000050, Mem[0000000010001400] = 00000000 00000000
	stda	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000 00000050
!	%l4 = 0000000000000000, Mem[00000000100c1408] = 00000000ffffff95
	stxa	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000000000
!	%f18 = 738ca745 b7ff0000, Mem[0000000010141438] = 738ca745 ffff00ff
	stda	%f18,[%i5+0x038]%asi	! Mem[0000000010141438] = 738ca745 b7ff0000
!	%l3 = 0000000000003500, Mem[0000000030181408] = ffff0000
	stwa	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = 00003500
!	%l1 = 000000000000004a, Mem[0000000010081426] = ffffff00, %asi = 80
	stha	%l1,[%i2+0x026]%asi	! Mem[0000000010081424] = ffff004a
!	%l0 = 0000000000000000, Mem[00000000211c0000] = ff341327
	stb	%l0,[%o2+%g0]		! Mem[00000000211c0000] = 00341327
!	Mem[0000000010181404] = 5f577e51, %l7 = 000000000000ffff, %asi = 80
	swapa	[%i6+0x004]%asi,%l7	! %l7 = 000000005f577e51
!	%l7 = 000000005f577e51, Mem[0000000010141408] = 500b00ff
	stwa	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 5f577e51
!	%f31 = 000000ff, Mem[0000000010081408] = 5fd29fea
	sta	%f31,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00000000, %l4 = 0000000000000000
	lduha	[%i3+%o4]0x80,%l4	! %l4 = 0000000000000000

p0_label_293:
!	Mem[00000000100c1400] = ff0000ff, %l7 = 000000005f577e51
	lduba	[%i3+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101408] = 738ca745, %l0 = 0000000000000000
	lduba	[%i4+0x00a]%asi,%l0	! %l0 = 00000000000000a7
!	Mem[0000000030041408] = 008ca745, %l1 = 000000000000004a
	lduwa	[%i1+%o4]0x81,%l1	! %l1 = 00000000008ca745
!	Mem[00000000100c1408] = 00000000, %l5 = 0000000000000050
	ldsba	[%i3+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = ff9fd25f 5f8fff8e, %l2 = ffffffff, %l3 = 00003500
	ldda	[%i0+%o4]0x80,%l2	! %l2 = 00000000ff9fd25f 000000005f8fff8e
!	Mem[00000000300c1410] = ff000000, %f17 = 00000000
	lda	[%i3+%o5]0x81,%f17	! %f17 = ff000000
!	Mem[0000000030001408] = ff000000, %l7 = 00000000000000ff
	lduha	[%i0+%o4]0x81,%l7	! %l7 = 000000000000ff00
!	Mem[0000000030141410] = ff00006e, %l4 = 0000000000000000
	ldsha	[%i5+%o5]0x89,%l4	! %l4 = 000000000000006e
!	Mem[00000000300c1410] = 000000ff, %l3 = 000000005f8fff8e
	ldsba	[%i3+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181412] = ff0000ff, %l0 = 00000000000000a7
	ldstuba	[%i6+0x012]%asi,%l0	! %l0 = 00000000000000ff

p0_label_294:
!	Mem[0000000020800040] = ffff095a, %l1 = 00000000008ca745
	ldstuba	[%o1+0x040]%asi,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030181408] = 00350000, %l7 = 000000000000ff00
	ldstuba	[%i6+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%f4  = ff000000 ffffffab, Mem[0000000010081408] = 000000ff 000000ff
	stda	%f4 ,[%i2+%o4]0x80	! Mem[0000000010081408] = ff000000 ffffffab
!	%f16 = 00000000 ff000000 738ca745 b7ff0000
!	%f20 = 00000000 00003500 3cbd696f ff00006e
!	%f24 = 00000000 00000000 000031ff 13bc0b50
!	%f28 = 00000000 00000000 00000000 000000ff
	stda	%f16,[%i1]ASI_BLK_SL	! Block Store to 0000000030041400
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000030001400] = 000000ff ff000000
	stda	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 000000ff
!	%f4  = ff000000 ffffffab, Mem[0000000030101408] = 4500c95f 00ff0000
	stda	%f4 ,[%i4+%o4]0x89	! Mem[0000000030101408] = ff000000 ffffffab
!	%l1 = 00000000000000ff, Mem[00000000100c140c] = 00000000, %asi = 80
	stha	%l1,[%i3+0x00c]%asi	! Mem[00000000100c140c] = 00ff0000
!	Mem[0000000030181400] = 00000000, %l7 = 0000000000000000
	swapa	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000020800040] = ffff095a
	sth	%l5,[%o1+0x040]		! Mem[0000000020800040] = 0000095a
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1438] = 00000000, %l0 = 0000000000000000
	ldsb	[%i3+0x038],%l0		! %l0 = 0000000000000000

p0_label_295:
!	Mem[0000000030141410] = ff00006e, %l3 = ffffffffffffffff
	ldswa	[%i5+%o5]0x89,%l3	! %l3 = ffffffffff00006e
!	Mem[0000000030141408] = 4a0000ff, %l2 = 00000000ff9fd25f
	lduha	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1408] = 0000000000ff0000, %f10 = 6e000000 6e007300
	ldd	[%i3+%o4],%f10		! %f10 = 00000000 00ff0000
!	Mem[0000000010101408] = 00000000 45a78c73, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i4+%o4]0x88,%l0	! %l0 = 0000000045a78c73 0000000000000000
!	Mem[0000000010181418] = ffffffff, %l4 = 000000000000006e
	ldsha	[%i6+0x018]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001408] = ff9fd25f, %f8  = 000000ff
	lda	[%i0+0x008]%asi,%f8 	! %f8 = ff9fd25f
!	Mem[00000000100c1428] = 00000000000000ff, %f8  = ff9fd25f 73441245
	ldda	[%i3+0x028]%asi,%f8 	! %f8  = 00000000 000000ff
!	Mem[0000000030181408] = 003500ff, %f1  = 45a78c73
	lda	[%i6+%o4]0x89,%f1 	! %f1 = 003500ff
!	Mem[00000000100c1410] = 0073006e ffffffff, %l0 = 45a78c73, %l1 = 00000000
	ldda	[%i3+%o5]0x88,%l0	! %l0 = 00000000ffffffff 000000000073006e
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = ff00ffff, %l3 = ffffffffff00006e
	swapa	[%i6+%o5]0x80,%l3	! %l3 = 00000000ff00ffff

p0_label_296:
!	%l6 = 0000000000000000, Mem[00000000100c1408] = 00000000
	stwa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	Mem[0000000010181410] = 6e0000ff, %l1 = 000000000073006e
	swapa	[%i6+%o5]0x88,%l1	! %l1 = 000000006e0000ff
!	%l7 = 0000000000000000, Mem[000000001000141c] = 48000000, %asi = 80
	stwa	%l7,[%i0+0x01c]%asi	! Mem[000000001000141c] = 00000000
!	%l3 = 00000000ff00ffff, Mem[0000000010181408] = ff00ffff
	stwa	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = ff00ffff
!	%f14 = 00000000 45a78c73, Mem[0000000010041400] = ffffffff ff000000
	stda	%f14,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000 45a78c73
	membar	#Sync			! Added by membar checker (50)
!	Mem[0000000010041408] = 00000b50, %l1 = 000000006e0000ff
	swapa	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000b50
!	%f2  = ff000000 00350000, Mem[0000000010041408] = ff00006e 00000000
	std	%f2 ,[%i1+%o4]	! Mem[0000000010041408] = ff000000 00350000
!	%l0 = 00000000ffffffff, Mem[0000000010141410] = 6e000000
	stwa	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffffff
!	%l4 = ffffffffffffffff, Mem[0000000021800180] = 21086058
	sth	%l4,[%o3+0x180]		! Mem[0000000021800180] = ffff6058
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000000, %l4 = ffffffffffffffff
	ldsba	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000000

p0_label_297:
!	Mem[0000000030181410] = ff000000, %l1 = 0000000000000b50
	ldswa	[%i6+%o5]0x81,%l1	! %l1 = ffffffffff000000
!	Mem[00000000218001c0] = 19eabc74, %l7 = 0000000000000000
	ldsba	[%o3+0x1c1]%asi,%l7	! %l7 = ffffffffffffffea
!	Mem[0000000030181400] = 00000000000000ea, %l1 = ffffffffff000000
	ldxa	[%i6+%g0]0x81,%l1	! %l1 = 00000000000000ea
!	Mem[0000000010141400] = 45a78c73, %l5 = 0000000000000000
	ldsha	[%i5+%g0]0x88,%l5	! %l5 = ffffffffffff8c73
!	Mem[00000000300c1408] = 00000000, %l1 = 00000000000000ea
	ldsba	[%i3+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = 5f577e51, %l2 = 00000000000000ff
	lduha	[%i5+%o4]0x80,%l2	! %l2 = 0000000000005f57
!	Mem[0000000010101400] = 00000000, %l1 = 0000000000000000
	ldswa	[%i4+0x000]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141438] = 738ca745, %l4 = 0000000000000000
	ldsb	[%i5+0x03b],%l4		! %l4 = 0000000000000045
!	Mem[0000000020800040] = 0000095a, %l5 = ffffffffffff8c73
	ldsba	[%o1+0x041]%asi,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 00000000, %l3 = 00000000ff00ffff
	swapa	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000

p0_label_298:
!	%l0 = 00000000ffffffff, Mem[0000000010141410] = ffffffff
	stha	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffffff
!	%f8  = 00000000, Mem[00000000100c1408] = ff00ffff
	sta	%f8 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	Mem[0000000010141400] = 45a78c73, %l7 = ffffffffffffffea
	ldstuba	[%i5+%g0]0x88,%l7	! %l7 = 00000073000000ff
!	%f20 = 00000000, Mem[0000000010041410] = 5f5700ff
	sta	%f20,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	%f18 = 738ca745 b7ff0000, %l0 = 00000000ffffffff
!	Mem[0000000030081430] = 8eff8f5f00000000
	add	%i2,0x030,%g1
	stda	%f18,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030081430] = 0000ffb745a78c73
!	Mem[0000000010141400] = 45a78cff, %l4 = 0000000000000045
	ldstuba	[%i5+%g0]0x88,%l4	! %l4 = 000000ff000000ff
!	%f22 = 3cbd696f ff00006e, Mem[0000000010181400] = 00ff0000 ffff0000
	stda	%f22,[%i6+%g0]0x88	! Mem[0000000010181400] = 3cbd696f ff00006e
!	%l7 = 0000000000000073, Mem[0000000010141400] = ff8ca745
	stha	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = 0073a745
!	%f19 = b7ff0000, Mem[0000000030001400] = 00000000
	sta	%f19,[%i0+%g0]0x89	! Mem[0000000030001400] = b7ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = abffffff45124473, %l4 = 00000000000000ff
	ldxa	[%i2+%o5]0x89,%l4	! %l4 = abffffff45124473

p0_label_299:
!	Mem[0000000030101408] = ff000000 ffffffab, %l4 = 45124473, %l5 = 00000000
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 00000000ffffffab 00000000ff000000
!	Mem[0000000010181410] = 6e0073000000006e, %f10 = 00000000 00ff0000
	ldda	[%i6+%o5]0x80,%f10	! %f10 = 6e007300 0000006e
!	Mem[0000000010141410] = ff000000ffffffff, %f10 = 6e007300 0000006e
	ldda	[%i5+%o5]0x88,%f10	! %f10 = ff000000 ffffffff
!	Mem[0000000010141408] = ff000000 517e575f, %l2 = 00005f57, %l3 = 00000000
	ldda	[%i5+%o4]0x88,%l2	! %l2 = 00000000517e575f 00000000ff000000
!	Mem[0000000010181410] = 6e007300, %l7 = 0000000000000073
	ldsha	[%i6+%o5]0x80,%l7	! %l7 = 0000000000006e00
!	Mem[0000000010001414] = 000000ff, %f11 = ffffffff
	lda	[%i0+0x014]%asi,%f11	! %f11 = 000000ff
!	Mem[0000000010001410] = ff000000, %l1 = 0000000000000000
	ldswa	[%i0+%o5]0x80,%l1	! %l1 = ffffffffff000000
!	Mem[0000000010101400] = 00000000, %l0 = 00000000ffffffff
	lduwa	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141408] = 5f577e51, %l3 = 00000000ff000000
	ldswa	[%i5+%o4]0x80,%l3	! %l3 = 000000005f577e51
!	Starting 10 instruction Store Burst
!	Mem[000000001008140c] = ffffffab, %l4 = 00000000ffffffab, %asi = 80
	swapa	[%i2+0x00c]%asi,%l4	! %l4 = 00000000ffffffab

p0_label_300:
!	Mem[0000000010081410] = 000000ff, %l2 = 00000000517e575f
	ldstuba	[%i2+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[00000000201c0000] = 3c007e52, %l3 = 000000005f577e51
	ldsh	[%o0+%g0],%l3		! %l3 = 0000000000003c00
!	Mem[0000000010141400] = 0073a745, %l1 = ffffffffff000000
	swapa	[%i5+%g0]0x80,%l1	! %l1 = 000000000073a745
!	%f5  = ffffffab, Mem[0000000010101408] = 45a78c73
	sta	%f5 ,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffffab
!	%l5 = 00000000ff000000, Mem[0000000030181408] = ff003500
	stha	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 00003500
!	%l6 = 0000000000000000, Mem[0000000030181400] = 00000000
	stba	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010141410] = ffffffff000000ff
	stxa	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000000000000
!	%f26 = 000031ff, Mem[0000000010101410] = 00000000
	st	%f26,[%i4+%o5]		! Mem[0000000010101410] = 000031ff
!	%l3 = 0000000000003c00, Mem[0000000030081408] = 00000000
	stba	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00000000, %l0 = 0000000000000000
	ldswa	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000000

p0_label_301:
!	Mem[0000000030141410] = 3cbd696fff00006e, %f2  = ff000000 00350000
	ldda	[%i5+%o5]0x89,%f2 	! %f2  = 3cbd696f ff00006e
!	Mem[0000000010141408] = 517e575f, %l2 = 0000000000000000
	lduwa	[%i5+%o4]0x88,%l2	! %l2 = 00000000517e575f
!	Mem[0000000030001408] = 000000ff, %l4 = 00000000ffffffab
	lduba	[%i0+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081410] = ff0000ff, %l2 = 00000000517e575f
	ldsha	[%i2+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000020800040] = 0000095a, %l3 = 0000000000003c00
	lduha	[%o1+0x040]%asi,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1408] = 4a00000000000000, %f2  = 3cbd696f ff00006e
	ldda	[%i3+%o4]0x89,%f2 	! %f2  = 4a000000 00000000
!	Mem[0000000030041410] = 00350000, %f2  = 4a000000
	lda	[%i1+%o5]0x81,%f2 	! %f2 = 00350000
!	Mem[00000000300c1410] = ff000000, %l4 = 00000000000000ff
	ldsba	[%i3+%o5]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030101410] = 00000000, %l4 = ffffffffffffffff
	lduha	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ff000000, Mem[0000000010141438] = 738ca745
	stw	%l5,[%i5+0x038]		! Mem[0000000010141438] = ff000000

p0_label_302:
!	%f22 = 3cbd696f, Mem[0000000010041418] = 00000000
	st	%f22,[%i1+0x018]	! Mem[0000000010041418] = 3cbd696f
!	Mem[0000000020800041] = 0000095a, %l7 = 0000000000006e00
	ldstub	[%o1+0x041],%l7		! %l7 = 00000000000000ff
!	%l4 = 00000000, %l5 = ff000000, Mem[0000000010141420] = 45124473 ffffff00
	stda	%l4,[%i5+0x020]%asi	! Mem[0000000010141420] = 00000000 ff000000
!	%f8  = 00000000 000000ff, %l4 = 0000000000000000
!	Mem[0000000010081428] = 7fffffff45a78c73
	add	%i2,0x028,%g1
	stda	%f8,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010081428] = 7fffffff45a78c73
!	Mem[0000000030181410] = 000000ff, %l2 = 00000000000000ff
	swapa	[%i6+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%f18 = 738ca745 b7ff0000, %l7 = 0000000000000000
!	Mem[0000000030041430] = 0000000000000000
	add	%i1,0x030,%g1
	stda	%f18,[%g1+%l7]ASI_PST8_S ! Mem[0000000030041430] = 0000000000000000
!	%l6 = 0000000000000000, Mem[00000000218001c0] = 19eabc74
	sth	%l6,[%o3+0x1c0]		! Mem[00000000218001c0] = 0000bc74
!	Mem[0000000010041400] = 45a78c73, %l2 = 00000000000000ff
	swapa	[%i1+%g0]0x88,%l2	! %l2 = 0000000045a78c73
!	%f8  = 00000000 000000ff, %l2 = 0000000045a78c73
!	Mem[0000000030141428] = ff0000ff00000013
	add	%i5,0x028,%g1
	stda	%f8,[%g1+%l2]ASI_PST16_S ! Mem[0000000030141428] = ff0000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001438] = ff0000ff, %l0 = 0000000000000000
	ldsb	[%i0+0x039],%l0		! %l0 = 0000000000000000

p0_label_303:
!	Mem[0000000030081408] = 00000000, %l6 = 0000000000000000
	lduha	[%i2+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000021800040] = ff644546, %l5 = 00000000ff000000
	ldsba	[%o3+0x040]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010181408] = ffff00ff, %l4 = 0000000000000000
	ldsba	[%i6+%o4]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030101410] = 00000000, %l7 = 0000000000000000
	ldsba	[%i4+%o5]0x89,%l7	! %l7 = 0000000000000000
	membar	#Sync			! Added by membar checker (51)
!	Mem[0000000030181400] = 00000000 000000ea 00003500 738ca745
!	Mem[0000000030181410] = ff000000 00350000 00000013 ffffffb7
!	Mem[0000000030181420] = 0000ff50 ff0000ff 13000000 ff0000ff
!	Mem[0000000030181430] = 00000000 98fc46ff 000000ff ffff0000
	ldda	[%i6]ASI_BLK_S,%f0	! Block Load from 0000000030181400
!	Mem[0000000030181408] = 00003500, %l7 = 0000000000000000
	ldsha	[%i6+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = ff00006e, %l4 = ffffffffffffffff
	ldsha	[%i6+%g0]0x88,%l4	! %l4 = 000000000000006e
!	Mem[0000000030181400] = ea00000000000000, %l5 = ffffffffffffffff
	ldxa	[%i6+%g0]0x89,%l5	! %l5 = ea00000000000000
!	Mem[0000000010101400] = 00000000000000ff, %l2 = 0000000045a78c73
	ldx	[%i4+%g0],%l2		! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 45124473, %l0 = 0000000000000000
	swapa	[%i2+%o5]0x89,%l0	! %l0 = 0000000045124473

p0_label_304:
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010001400] = 00000000 00000050
	stda	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff 00000000
!	%f26 = 000031ff 13bc0b50, %l7 = 0000000000000000
!	Mem[0000000030001430] = 000031483a37869c
	add	%i0,0x030,%g1
	stda	%f26,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030001430] = 000031483a37869c
!	Mem[0000000021800101] = 00488c1a, %l4 = 000000000000006e
	ldstub	[%o3+0x101],%l4		! %l4 = 00000048000000ff
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000030001410] = ff000000 738ca745
	stda	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000ff 00000000
!	%l2 = 00000000000000ff, Mem[00000000201c0000] = 3c007e52, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ff7e52
!	%f26 = 000031ff 13bc0b50, Mem[0000000030001408] = 000000ff 00000000
	stda	%f26,[%i0+%o4]0x89	! Mem[0000000030001408] = 000031ff 13bc0b50
!	%l1 = 000000000073a745, Mem[0000000030081400] = 00000000
	stba	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000045
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010041408] = 000000ff 00003500
	stda	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff 00000000
!	Mem[0000000030041400] = 000000ff, %l0 = 0000000045124473
	ldstuba	[%i1+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 500bbc13ff310000, %f24 = 00000000 00000000
	ldda	[%i0+%o4]0x81,%f24	! %f24 = 500bbc13 ff310000

p0_label_305:
!	Mem[0000000030041400] = ff0000ff 00000000, %l4 = 00000048, %l5 = 00000000
	ldda	[%i1+%g0]0x81,%l4	! %l4 = 00000000ff0000ff 0000000000000000
!	Mem[0000000010101408] = abffffff, %l1 = 000000000073a745
	ldsba	[%i4+0x00a]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001430] = 00000000, %l3 = 0000000000000000
	ldswa	[%i0+0x030]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l0 = 0000000000000000
	lduwa	[%i2+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l0 = 0000000000000000
	lduha	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141408] = 00000000 4a0000ff, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i5+%o4]0x89,%l2	! %l2 = 000000004a0000ff 0000000000000000
!	Mem[0000000030041408] = b7ff0000, %l3 = 0000000000000000
	lduba	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000
!	%f31 = 000000ff, %f27 = 13bc0b50
	fcmps	%fcc1,%f31,%f27		! %fcc1 = 1
!	Mem[0000000010081400] = 00000000 ea000000 ff000000 ffffffab
!	Mem[0000000010081410] = ff0000ff 000000ff 00000000 48007246
!	Mem[0000000010081420] = ff004473 ffff004a 7fffffff 45a78c73
!	Mem[0000000010081430] = 00000000 00000000 ff000000 ffffffab
	ldda	[%i2]ASI_BLK_PL,%f0	! Block Load from 0000000010081400
!	Starting 10 instruction Store Burst
!	%f16 = 00000000, Mem[0000000010041410] = 00000000
	sta	%f16,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000

p0_label_306:
!	%f27 = 13bc0b50, Mem[0000000010041400] = 000000ff
	sta	%f27,[%i1+%g0]0x88	! Mem[0000000010041400] = 13bc0b50
!	%l7 = 0000000000000000, Mem[0000000010001415] = 000000ff
	stb	%l7,[%i0+0x015]		! Mem[0000000010001414] = 000000ff
!	%l0 = 00000000, %l1 = ffffffff, Mem[0000000010181410] = 6e007300 0000006e
	stda	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000 ffffffff
!	%f25 = ff310000, Mem[00000000300c1400] = ff003148
	sta	%f25,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff310000
!	%f30 = 00000000 000000ff, %l1 = ffffffffffffffff
!	Mem[00000000100c1420] = 00000000000000f2
	add	%i3,0x020,%g1
	stda	%f30,[%g1+%l1]ASI_PST8_P ! Mem[00000000100c1420] = 00000000000000ff
!	Mem[0000000010081400] = 00000000, %l2 = 000000004a0000ff
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101430] = 0000000000000000, %l5 = 0000000000000000, %l2 = 0000000000000000
	add	%i4,0x30,%g1
	casxa	[%g1]0x80,%l5,%l2	! %l2 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010141408] = 517e575f
	stha	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = 517e0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00000000, %l0 = 0000000000000000
	ldswa	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000

p0_label_307:
!	Mem[00000000100c1408] = 00000000, %l4 = 00000000ff0000ff
	ldsba	[%i3+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %l5 = 0000000000000000
	lduba	[%i4+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181408] = 00003500, %l7 = 0000000000000000
	lduha	[%i6+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181408] = 00003500, %l2 = 0000000000000000
	lduha	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141420] = 00000000, %l3 = 0000000000000000
	lduba	[%i5+0x020]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101400] = ff000000 00000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i4+%g0]0x88,%l2	! %l2 = 0000000000000000 00000000ff000000
!	Mem[0000000010141408] = 00007e51, %l0 = 0000000000000000
	ldsha	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101410] = 000031ff, %l0 = 0000000000000000
	ldsha	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000211c0000] = 00341327, %l3 = 00000000ff000000
	lduha	[%o2+0x000]%asi,%l3	! %l3 = 0000000000000034
!	Starting 10 instruction Store Burst
!	%f30 = 00000000 000000ff, %l5 = 0000000000000000
!	Mem[0000000010101418] = 000031ff13bc0b50
	add	%i4,0x018,%g1
	stda	%f30,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010101418] = 000031ff13bc0b50

p0_label_308:
!	Mem[0000000030181400] = 00000000, %l7 = 0000000000000000
	swapa	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l4 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l4	! %l4 = 0000000000000000
!	%l5 = 0000000000000000, Mem[000000001004140a] = ff000000, %asi = 80
	stha	%l5,[%i1+0x00a]%asi	! Mem[0000000010041408] = ff000000
	membar	#Sync			! Added by membar checker (52)
!	%l4 = 0000000000000000, Mem[0000000010081400] = 4a0000ff
	stba	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff
!	%l6 = 0000000000000000, Mem[00000000100c1410] = ffffffff
	stba	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffffff00
!	Mem[000000001008141c] = 48007246, %l7 = 00000000, %l3 = 00000034
	add	%i2,0x1c,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 0000000048007246
!	Mem[0000000030181410] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i6+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	%f27 = 13bc0b50, Mem[00000000100c1410] = 00ffffff
	sta	%f27,[%i3+0x010]%asi	! Mem[00000000100c1410] = 13bc0b50
!	%l2 = 00000000000000ff, immed = 00000b19, %y  = fffff445
	umul	%l2,0xb19,%l3		! %l3 = 00000000000b0de7, %y = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ff7e52, %l5 = 0000000000000000
	lduba	[%o0+0x001]%asi,%l5	! %l5 = 00000000000000ff

p0_label_309:
!	Mem[000000001018141c] = ffffffff, %l5 = 00000000000000ff
	ldub	[%i6+0x01c],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010001400] = 00000000 000000ff, %l2 = 000000ff, %l3 = 000b0de7
	ldda	[%i0+%g0]0x88,%l2	! %l2 = 00000000000000ff 0000000000000000
!	Mem[0000000030101408] = abffffff 000000ff, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i4+%o4]0x81,%l4	! %l4 = 00000000abffffff 00000000000000ff
!	Mem[00000000100c1400] = ff0000ff, %l2 = 00000000000000ff
	lduha	[%i3+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141400] = 00000000, %l0 = 0000000000000000
	lduba	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800000] = 2babca09, %l3 = 0000000000000000
	lduha	[%o1+0x000]%asi,%l3	! %l3 = 0000000000002bab
!	Mem[00000000100c1410] = 13bc0b506e007300, %f30 = 00000000 000000ff
	ldda	[%i3+%o5]0x80,%f30	! %f30 = 13bc0b50 6e007300
!	Mem[0000000030041408] = 0000ffb7, %l2 = 00000000000000ff
	ldsha	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101410] = 0000000000000000, %f2  = abffffff 000000ff
	ldda	[%i4+%o5]0x81,%f2 	! %f2  = 00000000 00000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010141412] = 00000000, %asi = 80
	stha	%l7,[%i5+0x012]%asi	! Mem[0000000010141410] = 00000000

p0_label_310:
!	%l6 = 0000000000000000, Mem[0000000021800141] = ffffab40
	stb	%l6,[%o3+0x141]		! Mem[0000000021800140] = ff00ab40
!	%f2  = 00000000 00000000, %l7 = 0000000000000000
!	Mem[00000000100c1420] = 00000000000000ff
	add	%i3,0x020,%g1
	stda	%f2,[%g1+%l7]ASI_PST8_PL ! Mem[00000000100c1420] = 00000000000000ff
!	%f6  = 46720048 00000000, Mem[0000000030141400] = 00000000 0000ffb7
	stda	%f6 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 46720048 00000000
!	%l5 = 00000000000000ff, Mem[00000000300c1408] = 00000000
	stwa	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000ff
!	Mem[0000000010181400] = ff00006e, %l4 = 00000000abffffff
	ldstuba	[%i6+%g0]0x88,%l4	! %l4 = 0000006e000000ff
!	Mem[0000000030081400] = 00000045, %l0 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000045
!	%l3 = 0000000000002bab, Mem[0000000010141400] = ff00ffff000000ff
	stxa	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000000000002bab
!	%f8  = 4a00ffff 734400ff, Mem[0000000030041410] = 00350000 00000000
	stda	%f8 ,[%i1+%o5]0x81	! Mem[0000000030041410] = 4a00ffff 734400ff
!	%f28 = 00000000, Mem[0000000030081408] = 00000000
	sta	%f28,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ff000000000000ff, %l3 = 0000000000002bab
	ldxa	[%i0+%o5]0x88,%l3	! %l3 = ff000000000000ff

p0_label_311:
!	Mem[00000000300c1400] = 000031ff, %f18 = 738ca745
	lda	[%i3+%g0]0x89,%f18	! %f18 = 000031ff
!	Mem[0000000010181404] = 6f69bd3c, %l7 = 0000000000000000
	lduh	[%i6+0x004],%l7		! %l7 = 0000000000006f69
!	Mem[0000000010081408] = 000000ff, %l5 = 00000000000000ff
	ldsha	[%i2+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081410] = 00000000, %l3 = ff000000000000ff
	ldsba	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = 5fd29fff, %l1 = ffffffffffffffff
	ldsha	[%i0+%o4]0x88,%l1	! %l1 = ffffffffffff9fff
!	Mem[0000000010101400] = 00000000 000000ff abffffff 00000000
!	Mem[0000000010101410] = 000031ff 00000000 000031ff 13bc0b50
!	Mem[0000000010101420] = 2108ffff 0000005a 21084f18 0000004a
!	Mem[0000000010101430] = 00000000 00000000 000031ff 13bc0b50
	ldda	[%i4]ASI_BLK_PL,%f16	! Block Load from 0000000010101400
!	Mem[0000000010141400] = ab2b0000, %l1 = ffffffffffff9fff
	lduha	[%i5+%g0]0x80,%l1	! %l1 = 000000000000ab2b
!	Mem[00000000100c1400] = 00350000ff0000ff, %l2 = 0000000000000000
	ldxa	[%i3+%g0]0x88,%l2	! %l2 = 00350000ff0000ff
!	Mem[0000000010101408] = abffffff, %l6 = 0000000000000000
	ldsba	[%i4+%o4]0x80,%l6	! %l6 = ffffffffffffffab
!	Starting 10 instruction Store Burst
!	%f8  = 4a00ffff, Mem[0000000030101408] = ffffffab
	sta	%f8 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 4a00ffff

p0_label_312:
!	Mem[00000000300c1410] = 000000ff, %l1 = 000000000000ab2b
	swapa	[%i3+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%f14 = abffffff 000000ff, %l4 = 000000000000006e
!	Mem[0000000010001410] = ff000000000000ff
	add	%i0,0x010,%g1
	stda	%f14,[%g1+%l4]ASI_PST32_P ! Mem[0000000010001410] = abffffff000000ff
!	%f15 = 000000ff, Mem[0000000010041408] = 000000ff
	sta	%f15,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff
!	%f0  = 000000ea 00000000 00000000 00000000
!	%f4  = ff000000 ff0000ff 46720048 00000000
!	%f8  = 4a00ffff 734400ff 738ca745 ffffff7f
!	%f12 = 00000000 00000000 abffffff 000000ff
	stda	%f0,[%i4]ASI_BLK_AIUPL	! Block Store to 0000000010101400
!	%f18 = 00000000 ffffffab, Mem[0000000010001410] = abffffff 000000ff
	stda	%f18,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000 ffffffab
!	Mem[0000000030041400] = ff0000ff, %l3 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l3	! %l3 = 000000ff000000ff
!	%l4 = 000000000000006e, Mem[0000000030181408] = 00350000
	stba	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 0035006e
!	Mem[00000000211c0000] = 00341327, %l6 = ffffffffffffffab
	ldstub	[%o2+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030001410] = ff000000, %l2 = 00350000ff0000ff
	ldstuba	[%i0+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010181418] = ffffffff ffffffff
	std	%l2,[%i6+0x018]		! Mem[0000000010181418] = 00000000 000000ff

p0_label_313:
!	Mem[00000000100c1408] = 00000000, %l5 = 00000000000000ff
	lduha	[%i3+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181410] = ffffffff 000000ff, %l4 = 0000006e, %l5 = 00000000
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 00000000000000ff 00000000ffffffff
!	Mem[0000000030081400] = 00000000, %f25 = ffff0821
	lda	[%i2+%g0]0x89,%f25	! %f25 = 00000000
!	Mem[00000000201c0000] = 00ff7e52, %l0 = 0000000000000045
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081400] = 00000000, %l1 = 00000000000000ff
	ldswa	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = 0035006e, %l4 = 00000000000000ff
	lduba	[%i6+%o4]0x89,%l4	! %l4 = 000000000000006e
!	Mem[0000000010001400] = 000000ff, %l7 = 0000000000006f69
	ldsha	[%i0+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081400] = ff000000, %l1 = 0000000000000000
	ldswa	[%i2+%g0]0x88,%l1	! %l1 = ffffffffff000000
	membar	#Sync			! Added by membar checker (53)
!	Mem[0000000010101400] = 00000000ea000000, %l0 = 00000000000000ff
	ldxa	[%i4+%g0]0x80,%l0	! %l0 = 00000000ea000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = ff0000ff, %l0 = 00000000ea000000
	ldstuba	[%i0+%o5]0x81,%l0	! %l0 = 000000ff000000ff

p0_label_314:
!	%l2 = 0000000000000000, Mem[0000000030041408] = 0000ffb7
	stwa	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	%l3 = 00000000000000ff, Mem[000000001018141c] = 000000ff
	stb	%l3,[%i6+0x01c]		! Mem[000000001018141c] = ff0000ff
!	%f6  = 46720048 00000000, Mem[00000000300c1410] = 2bab0000 00000000
	stda	%f6 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 46720048 00000000
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010001410] = 00000000 abffffff
	stda	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 000000ff
!	%l3 = 00000000000000ff, Mem[0000000010101406] = ea000000
	stb	%l3,[%i4+0x006]		! Mem[0000000010101404] = ea00ff00
!	%l4 = 000000000000006e, Mem[00000000211c0000] = ff341327
	stb	%l4,[%o2+%g0]		! Mem[00000000211c0000] = 6e341327
!	%f26 = 4a000000 184f0821, %l3 = 00000000000000ff
!	Mem[00000000300c1410] = 4672004800000000
	add	%i3,0x010,%g1
	stda	%f26,[%g1+%l3]ASI_PST32_S ! Mem[00000000300c1410] = 4a000000184f0821
!	%l5 = 00000000ffffffff, Mem[0000000010081408] = ff000000
	stwa	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffffff
!	Mem[00000000300c1400] = ff310000, %l2 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l2	! %l2 = 00000000ff310000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00000000, %l2 = 00000000ff310000
	ldsha	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000000

p0_label_315:
!	Mem[00000000201c0000] = 00ff7e52, %l2 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000020800000] = 2babca09, %l4 = 000000000000006e
	ldsba	[%o1+0x000]%asi,%l4	! %l4 = 000000000000002b
!	Mem[0000000030101408] = 4a00ffff, %f16 = ff000000
	lda	[%i4+%o4]0x89,%f16	! %f16 = 4a00ffff
!	Mem[00000000300c1408] = 000000ff, %l0 = 00000000000000ff
	lduwa	[%i3+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181400] = ff0000ff, %l0 = 00000000000000ff
	lduwa	[%i6+%g0]0x88,%l0	! %l0 = 00000000ff0000ff
!	Mem[0000000010141410] = 00000000, %l0 = 00000000ff0000ff
	ldsha	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181400] = ff0000ff, %l6 = 0000000000000000
	ldsha	[%i6+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041408] = ff00000000000000, %l0 = 0000000000000000
	ldxa	[%i1+%o4]0x80,%l0	! %l0 = ff00000000000000
!	Mem[0000000010041418] = 3cbd696f, %f0  = 000000ea
	ld	[%i1+0x018],%f0 	! %f0 = 3cbd696f
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 13bc0b50, %l2 = 00000000000000ff
	swapa	[%i3+%o5]0x80,%l2	! %l2 = 0000000013bc0b50

p0_label_316:
!	%l3 = 00000000000000ff, Mem[0000000030181410] = 000000ff
	stha	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff
!	%l1 = ffffffffff000000, Mem[0000000030001400] = b7ff0000
	stba	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = b7ff0000
!	%l1 = ffffffffff000000, Mem[00000000211c0000] = 6e341327, %asi = 80
	stha	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00001327
!	Mem[000000001004143c] = 13bc0b50, %l0 = ff00000000000000
	swap	[%i1+0x03c],%l0		! %l0 = 0000000013bc0b50
!	%f16 = 4a00ffff 00000000 00000000 ffffffab
!	%f20 = 00000000 ff310000 500bbc13 ff310000
!	%f24 = 5a000000 00000000 4a000000 184f0821
!	%f28 = 00000000 00000000 500bbc13 ff310000
	stda	%f16,[%i3]ASI_COMMIT_P	! Block Store to 00000000100c1400
!	Mem[000000001014141c] = ff000000, %l4 = 0000002b, %l5 = ffffffff
	add	%i5,0x1c,%g1
	casa	[%g1]0x80,%l4,%l5	! %l5 = 00000000ff000000
!	%f0  = 3cbd696f 00000000, Mem[0000000010101408] = 00000000 00000000
	stda	%f0 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 3cbd696f 00000000
!	Mem[0000000010041410] = 00000000, %l4 = 000000000000002b
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000000
!	%l5 = 00000000ff000000, Mem[0000000010001410] = 00000000
	stba	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ffff004a, %l0 = 0000000013bc0b50
	ldswa	[%i4+%o4]0x81,%l0	! %l0 = ffffffffffff004a

p0_label_317:
!	Mem[0000000010101400] = 00000000, %l5 = 00000000ff000000
	ldswa	[%i4+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101410] = ff0000ff, %l1 = ffffffffff000000
	lduha	[%i4+0x012]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000021800180] = ffff6058, %l3 = 00000000000000ff
	ldsba	[%o3+0x180]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081410] = abffffff 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000 00000000abffffff
!	Mem[0000000010141408] = 517e0000, %l6 = 00000000000000ff
	lduba	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = ff000000, %l5 = 00000000abffffff
	ldsha	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101414] = 000000ff, %l1 = 00000000000000ff
	ldswa	[%i4+0x014]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141400] = 46720048 00000000, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 0000000046720048 0000000000000000
	membar	#Sync			! Added by membar checker (54)
!	Mem[00000000100c142c] = 184f0821, %l1 = 00000000000000ff
	ldsha	[%i3+0x02c]%asi,%l1	! %l1 = 000000000000184f
!	Starting 10 instruction Store Burst
!	%f6  = 46720048, Mem[000000001008142c] = 45a78c73
	st	%f6 ,[%i2+0x02c]	! Mem[000000001008142c] = 46720048

p0_label_318:
!	%l1 = 000000000000184f, Mem[0000000010181400] = 3cbd696fff0000ff
	stxa	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000000000184f
!	%l2 = 0000000013bc0b50, Mem[0000000010181408] = ff00ffff
	stwa	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 13bc0b50
!	%f12 = 00000000 00000000, Mem[0000000010141410] = 00000000 00000000
	stda	%f12,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 00000000
!	%l2 = 0000000013bc0b50, Mem[0000000030041408] = 738ca74500000000
	stxa	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000013bc0b50
!	%l4 = 0000000000000000, Mem[00000000300c1400] = 00000000
	stba	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	Mem[00000000201c0001] = 00ff7e52, %l4 = 0000000000000000
	ldstub	[%o0+0x001],%l4		! %l4 = 000000ff000000ff
!	%l7 = 0000000000000000, Mem[000000001008143a] = ff000000
	stb	%l7,[%i2+0x03a]		! Mem[0000000010081438] = ff000000
!	%f7  = 00000000, Mem[0000000010101400] = 00000000
	sta	%f7 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	%f28 = 00000000 00000000, Mem[0000000030181408] = 0035006e 45a78c73
	stda	%f28,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 4a00ffff, %l7 = 0000000000000000
	lduha	[%i3+%g0]0x80,%l7	! %l7 = 0000000000004a00

p0_label_319:
!	Mem[000000001018143c] = ffac2efd, %l4 = 00000000000000ff
	lduha	[%i6+0x03e]%asi,%l4	! %l4 = 0000000000002efd
!	Mem[0000000030141410] = ff00006e, %l6 = 0000000046720048
	ldsha	[%i5+%o5]0x89,%l6	! %l6 = 000000000000006e
!	Mem[00000000100c1410] = 00000000, %l0 = ffffffffffff004a
	lduwa	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141410] = ff00006e, %l4 = 0000000000002efd
	lduba	[%i5+%o5]0x89,%l4	! %l4 = 000000000000006e
!	Mem[0000000030081408] = 00000000, %l4 = 000000000000006e
	lduba	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l6 = 000000000000006e
	ldsba	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = ff000000, %l5 = 0000000000000000
	ldsba	[%i0+%g0]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010081400] = 000000eaff000000, %f12 = 00000000 00000000
	ldda	[%i2+%g0]0x88,%f12	! %f12 = 000000ea ff000000
!	Mem[0000000010001408] = ff9fd25f5f8fff8e, %l1 = 000000000000184f
	ldxa	[%i0+0x008]%asi,%l1	! %l1 = ff9fd25f5f8fff8e
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 00004a00, Mem[0000000010081428] = 7fffffff 46720048
	stda	%l6,[%i2+0x028]%asi	! Mem[0000000010081428] = 00000000 00004a00

p0_label_320:
!	%f24 = 5a000000 00000000, Mem[0000000030101408] = 4a00ffff ff000000
	stda	%f24,[%i4+%o4]0x89	! Mem[0000000030101408] = 5a000000 00000000
!	%l5 = ffffffffffffffff, Mem[00000000300c1400] = 00000000
	stha	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000ffff
!	%f11 = ffffff7f, Mem[0000000030041400] = ff0000ff
	sta	%f11,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffff7f
!	Mem[0000000010081400] = ff000000, %l2 = 0000000013bc0b50
	swapa	[%i2+%g0]0x88,%l2	! %l2 = 00000000ff000000
!	%l6 = 0000000000000000, Mem[0000000030001410] = ff0000ff
	stwa	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	Mem[0000000010001410] = 00000000, %l1 = ff9fd25f5f8fff8e
	ldstuba	[%i0+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181400] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000010041408] = 00000000000000ff
	stxa	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000000000
!	%f0  = 3cbd696f 00000000, Mem[0000000030181400] = ff000000 000000ea
	stda	%f0 ,[%i6+%g0]0x81	! Mem[0000000030181400] = 3cbd696f 00000000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (55)
!	Mem[0000000030041400] = ffffff7f 00000000 500bbc13 00000000
!	Mem[0000000030041410] = 4a00ffff 734400ff 6e0000ff 6f69bd3c
!	Mem[0000000030041420] = 00000000 00000000 500bbc13 ff310000
!	Mem[0000000030041430] = 00000000 00000000 ff000000 00000000
	ldda	[%i1]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030041400

p0_label_321:
!	Mem[00000000300c1410] = 0000004a, %l4 = 0000000000000000
	ldsha	[%i3+%o5]0x89,%l4	! %l4 = 000000000000004a
!	Mem[0000000010141408] = 517e0000, %l1 = 0000000000000000
	lduwa	[%i5+%o4]0x88,%l1	! %l1 = 00000000517e0000
!	Mem[0000000030041408] = 500bbc13, %l3 = ffffffffffffffff
	ldsha	[%i1+%o4]0x81,%l3	! %l3 = 000000000000500b
!	Mem[0000000010001408] = 5fd29fff, %f8  = 4a00ffff
	lda	[%i0+%o4]0x88,%f8 	! %f8 = 5fd29fff
!	Mem[0000000010001408] = ff9fd25f 5f8fff8e, %l6 = 00000000, %l7 = 00004a00
	ldda	[%i0+%o4]0x80,%l6	! %l6 = 00000000ff9fd25f 000000005f8fff8e
!	Mem[0000000010101404] = ea00ff00, %l7 = 000000005f8fff8e
	ldsh	[%i4+0x004],%l7		! %l7 = ffffffffffffea00
!	Mem[0000000010001408] = ff9fd25f, %l1 = 00000000517e0000
	ldswa	[%i0+%o4]0x80,%l1	! %l1 = ffffffffff9fd25f
!	Mem[00000000100c1410] = 00000000ff310000, %l1 = ffffffffff9fd25f
	ldxa	[%i3+%o5]0x80,%l1	! %l1 = 00000000ff310000
!	Mem[00000000100c1408] = abffffff00000000, %l5 = ffffffffffffffff
	ldxa	[%i3+%o4]0x88,%l5	! %l5 = abffffff00000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000, %l1 = ff310000, Mem[0000000010181410] = ff000000 ffffffff
	stda	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000 ff310000

p0_label_322:
!	Mem[0000000020800000] = 2babca09, %l2 = 00000000ff000000
	ldstuba	[%o1+0x000]%asi,%l2	! %l2 = 0000002b000000ff
!	%l3 = 000000000000500b, Mem[0000000010181400] = 000000000000184f
	stxa	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000000000500b
!	%f13 = ff000000, Mem[0000000010041408] = 00000000
	sta	%f13,[%i1+%o4]0x80	! Mem[0000000010041408] = ff000000
!	Mem[0000000030101408] = 00000000, %l0 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l0	! %l0 = 0000000000000000
!	%l2 = 000000000000002b, Mem[0000000010041400] = 500bbc13
	stba	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 2b0bbc13
!	%l1 = 00000000ff310000, Mem[0000000030001410] = 00000000
	stwa	%l1,[%i0+%o5]0x81	! Mem[0000000030001410] = ff310000
!	Mem[0000000010181414] = ff310000, %l6 = 00000000ff9fd25f
	ldsha	[%i6+0x016]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = 000000ff, %l2 = 000000000000002b
	ldstuba	[%i0+%o5]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000100c1434] = 00000000, %l7 = ffffffffffffea00
	swap	[%i3+0x034],%l7		! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 0000004a, %l6 = 0000000000000000
	lduha	[%i3+%o5]0x89,%l6	! %l6 = 000000000000004a

p0_label_323:
!	Mem[0000000030101400] = 00000000, %f14 = abffffff
	lda	[%i4+%g0]0x81,%f14	! %f14 = 00000000
!	Mem[0000000010141428] = 0073006e, %f12 = 000000ea
	ld	[%i5+0x028],%f12	! %f12 = 0073006e
!	Mem[0000000030181400] = 3cbd696f, %l0 = 0000000000000000
	ldsba	[%i6+%g0]0x81,%l0	! %l0 = 000000000000003c
!	Mem[0000000010041410] = 0000002b, %l2 = 00000000000000ff
	ldsba	[%i1+%o5]0x88,%l2	! %l2 = 000000000000002b
!	Mem[00000000100c1438] = 500bbc13 ff310000, %l0 = 0000003c, %l1 = ff310000
	ldda	[%i3+0x038]%asi,%l0	! %l0 = 00000000500bbc13 00000000ff310000
!	Mem[0000000030081400] = 00000000, %l5 = abffffff00000000
	ldswa	[%i2+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181400] = 3cbd696f, %f15 = 000000ff
	lda	[%i6+%g0]0x81,%f15	! %f15 = 3cbd696f
!	Mem[0000000010041408] = ff00000000000000, %f4  = ff000000 ff0000ff
	ldda	[%i1+%o4]0x80,%f4 	! %f4  = ff000000 00000000
!	Mem[0000000010181434] = abff4cce, %l3 = 000000000000500b
	lduba	[%i6+0x036]%asi,%l3	! %l3 = 000000000000004c
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000004c, Mem[00000000100c1400] = 4a00ffff00000000
	stx	%l3,[%i3+%g0]		! Mem[00000000100c1400] = 000000000000004c

p0_label_324:
!	%l4 = 000000000000004a, Mem[0000000010181408] = 500bbc13
	stha	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 500b004a
!	Mem[000000001010140c] = 6f69bd3c, %l3 = 0000004c, %l7 = 00000000
	add	%i4,0x0c,%g1
	casa	[%g1]0x80,%l3,%l7	! %l7 = 000000006f69bd3c
!	Mem[0000000010141410] = 00000000, %l7 = 000000006f69bd3c
	ldstuba	[%i5+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001410] = 00000000000031ff, %l7 = 0000000000000000
	ldxa	[%i0+%o5]0x89,%l7	! %l7 = 00000000000031ff
!	%f16 = 00000000 7fffffff, %l2 = 000000000000002b
!	Mem[00000000100c1438] = 500bbc13ff310000
	add	%i3,0x038,%g1
	stda	%f16,[%g1+%l2]ASI_PST8_P ! Mem[00000000100c1438] = 500b00137f31ffff
	membar	#Sync			! Added by membar checker (56)
!	%f22 = 3cbd696f ff00006e, %l7 = 00000000000031ff
!	Mem[0000000030041430] = 0000000000000000
	add	%i1,0x030,%g1
	stda	%f22,[%g1+%l7]ASI_PST8_S ! Mem[0000000030041430] = 3cbd696fff00006e
!	%l2 = 000000000000002b, Mem[000000001000142d] = 000000ff
	stb	%l2,[%i0+0x02d]		! Mem[000000001000142c] = 002b00ff
!	%f2  = 00000000 00000000, Mem[0000000010041428] = 00000000 be8b56a6
	stda	%f2 ,[%i1+0x028]%asi	! Mem[0000000010041428] = 00000000 00000000
!	%f16 = 00000000 7fffffff, Mem[0000000010181420] = 0000dcff 00000000
	std	%f16,[%i6+0x020]	! Mem[0000000010181420] = 00000000 7fffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ffffff7f, %l5 = 0000000000000000
	ldsba	[%i1+%g0]0x81,%l5	! %l5 = ffffffffffffffff

p0_label_325:
!	Mem[0000000010101400] = 00ff00ea00000000, %l0 = 00000000500bbc13
	ldxa	[%i4+%g0]0x88,%l0	! %l0 = 00ff00ea00000000
!	Mem[0000000010141400] = 0000000000002bab, %l0 = 00ff00ea00000000
	ldxa	[%i5+%g0]0x88,%l0	! %l0 = 0000000000002bab
!	Mem[0000000010001400] = ff000000, %l7 = 00000000000031ff
	ldsba	[%i0+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000201c0000] = 00ff7e52, %l4 = 000000000000004a
	lduba	[%o0+0x001]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001408] = 5fd29fff, %l4 = 00000000000000ff
	lduba	[%i0+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041400] = 2b0bbc1300000000, %l7 = ffffffffffffffff
	ldx	[%i1+%g0],%l7		! %l7 = 2b0bbc1300000000
!	Mem[00000000300c1408] = 4a000000 ff000000, %l0 = 00002bab, %l1 = ff310000
	ldda	[%i3+%o4]0x89,%l0	! %l0 = 00000000ff000000 000000004a000000
!	Mem[0000000030101408] = 000000000000005a, %f6  = 46720048 00000000
	ldda	[%i4+%o4]0x81,%f6 	! %f6  = 00000000 0000005a
!	Mem[00000000300c1400] = ffff0000, %l2 = 000000000000002b
	ldswa	[%i3+%g0]0x81,%l2	! %l2 = ffffffffffff0000
!	Starting 10 instruction Store Burst
!	%f28 = 00000000 00000000, Mem[0000000010101410] = ff0000ff ff000000
	stda	%f28,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000 00000000

p0_label_326:
!	Mem[0000000030081410] = 00000000, %l3 = 000000000000004c
	swapa	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000000
!	%l4 = 00000000000000ff, Mem[00000000100c1400] = 00000000
	stba	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff
!	%l0 = 00000000ff000000, Mem[0000000010141408] = 00007e51
	stba	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 00007e51
!	%f0  = 3cbd696f, Mem[0000000010081410] = ff0000ff
	sta	%f0 ,[%i2+%o5]0x80	! Mem[0000000010081410] = 3cbd696f
!	Randomly selected nop
	nop
!	Mem[0000000010181400] = 0000500b, %l3 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l3	! %l3 = 000000000000500b
!	%l4 = 000000ff, %l5 = ffffffff, Mem[0000000030081410] = 4c000000 ffffffab
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000ff ffffffff
!	%l3 = 000000000000500b, Mem[00000000300c1410] = 4a000000
	stha	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 500b0000
!	%f20 = ff004473 ffff004a, Mem[0000000010101418] = 00000000 48007246
	stda	%f20,[%i4+0x018]%asi	! Mem[0000000010101418] = ff004473 ffff004a
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 0000000000000000, %l5 = ffffffffffffffff
	ldxa	[%i6+%g0]0x88,%l5	! %l5 = 0000000000000000

p0_label_327:
!	Mem[0000000030041400] = ffffff7f 00000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i1+%g0]0x81,%l4	! %l4 = 00000000ffffff7f 0000000000000000
!	Mem[0000000020800040] = 00ff095a, %l2 = ffffffffffff0000
	ldsba	[%o1+0x041]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010041400] = 2b0bbc13 00000000, %l2 = ffffffff, %l3 = 0000500b
	ldda	[%i1+%g0]0x80,%l2	! %l2 = 000000002b0bbc13 0000000000000000
!	Mem[00000000300c1408] = 000000ff, %f25 = 00000000
	lda	[%i3+%o4]0x81,%f25	! %f25 = 000000ff
!	Mem[0000000010041408] = 000000ff, %l5 = 0000000000000000
	ldsha	[%i1+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1410] = 00000000, %l7 = 2b0bbc1300000000
	lduha	[%i3+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001410] = 000031ff, %l0 = 00000000ff000000
	lduba	[%i0+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141408] = 4a0000ff, %l6 = 000000000000004a
	ldsha	[%i5+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041410] = ff004473ffff004a, %l7 = 0000000000000000
	ldxa	[%i1+%o5]0x89,%l7	! %l7 = ff004473ffff004a
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 00000000, %l2 = 2b0bbc13, %l7 = ffff004a
	add	%i6,0x10,%g1
	casa	[%g1]0x80,%l2,%l7	! %l7 = 0000000000000000

p0_label_328:
!	%l0 = 00000000000000ff, Mem[0000000010141438] = ff000000b7ff0000, %asi = 80
	stxa	%l0,[%i5+0x038]%asi	! Mem[0000000010141438] = 00000000000000ff
!	%l1 = 000000004a000000, Mem[00000000218001c0] = 0000bc74
	sth	%l1,[%o3+0x1c0]		! Mem[00000000218001c0] = 0000bc74
!	%l5 = 00000000000000ff, Mem[0000000010181400] = 0000000000000000
	stxa	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000000000ff
!	Mem[00000000201c0000] = 00ff7e52, %l2 = 000000002b0bbc13
	ldstub	[%o0+%g0],%l2		! %l2 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[000000001014140a] = 00007e51
	sth	%l0,[%i5+0x00a]		! Mem[0000000010141408] = 000000ff
!	%l5 = 00000000000000ff, Mem[0000000010041408] = 000000ff
	stha	%l5,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff
!	Mem[0000000030001400] = 0000ffb7, %l1 = 000000004a000000
	ldstuba	[%i0+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181413] = 00000000, %l3 = 0000000000000000
	ldstub	[%i6+0x013],%l3		! %l3 = 00000000000000ff
!	%f4  = ff000000 00000000, %l3 = 0000000000000000
!	Mem[0000000010001420] = 0000ff50ff0000ff
	add	%i0,0x020,%g1
	stda	%f4,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010001420] = 0000ff50ff0000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (57)
!	Mem[0000000010181400] = ff000000 00000000 4a000b50 45a78c73
!	Mem[0000000010181410] = 000000ff ff310000 00000000 ff0000ff
!	Mem[0000000010181420] = 00000000 7fffffff 000000ad ff0000ea
!	Mem[0000000010181430] = 34ff373a abff4cce 00000000 ffac2efd
	ldda	[%i6]ASI_BLK_AIUP,%f0	! Block Load from 0000000010181400

p0_label_329:
!	Mem[0000000010101408] = 00000000, %l6 = 00000000000000ff
	lduha	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %f24 = 00000000
	lda	[%i3+%o5]0x88,%f24	! %f24 = 00000000
!	Mem[00000000211c0000] = 00001327, %l0 = 00000000000000ff
	ldsba	[%o2+0x001]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800000] = ffabca09, %l3 = 0000000000000000
	lduba	[%o1+0x001]%asi,%l3	! %l3 = 00000000000000ab
!	Mem[00000000100c1410] = 00000000, %l4 = 00000000ffffff7f
	lduha	[%i3+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081400] = 500bbc13, %l4 = 0000000000000000
	lduwa	[%i2+%g0]0x80,%l4	! %l4 = 00000000500bbc13
!	Mem[00000000300c1410] = 21084f1800000b50, %l6 = 0000000000000000
	ldxa	[%i3+%o5]0x89,%l6	! %l6 = 21084f1800000b50
!	Mem[0000000010141400] = ab2b0000, %l4 = 00000000500bbc13
	lduwa	[%i5+%g0]0x80,%l4	! %l4 = 00000000ab2b0000
!	Mem[0000000010141410] = 000000ff, %l4 = 00000000ab2b0000
	lduha	[%i5+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f18 = 00000000 13bc0b50, Mem[00000000100c1420] = 5a000000 00000000
	stda	%f18,[%i3+0x020]%asi	! Mem[00000000100c1420] = 00000000 13bc0b50

p0_label_330:
!	%f30 = 00000000 000000ff, Mem[0000000010141410] = ff000000 00000000
	stda	%f30,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 000000ff
!	Mem[0000000010081400] = 500bbc13, %l2 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 00000000500bbc13
!	Mem[0000000010101400] = 00000000, %l5 = 00000000000000ff
	swap	[%i4+%g0],%l5		! %l5 = 0000000000000000
!	Mem[00000000201c0000] = ffff7e52, %l7 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010141408] = 000000ff, %l1 = 0000000000000000, %asi = 80
	swapa	[%i5+0x008]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081420] = ff004473ffff004a, %l6 = 21084f1800000b50, %l4 = 00000000000000ff
	add	%i2,0x20,%g1
	casxa	[%g1]0x80,%l6,%l4	! %l4 = ff004473ffff004a
!	%l1 = 00000000000000ff, Mem[0000000030141410] = 6e0000ff
	stba	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = ff0000ff
!	Mem[0000000010081410] = 3cbd696f, %l0 = 0000000000000000
	ldsha	[%i2+0x010]%asi,%l0	! %l0 = 0000000000003cbd
!	%l2 = 00000000500bbc13, Mem[0000000030041408] = 13bc0b50
	stba	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 13bc0b13
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff000000, %l4 = ff004473ffff004a
	ldsba	[%i4+%g0]0x88,%l4	! %l4 = 0000000000000000

p0_label_331:
!	Mem[0000000010081410] = 3cbd696f, %l3 = 00000000000000ab
	lduba	[%i2+%o5]0x80,%l3	! %l3 = 000000000000003c
!	Mem[0000000030041410] = 4a00ffff, %l6 = 21084f1800000b50
	ldsha	[%i1+%o5]0x81,%l6	! %l6 = 0000000000004a00
!	Mem[0000000010141400] = 00002bab, %l6 = 0000000000004a00
	lduwa	[%i5+%g0]0x88,%l6	! %l6 = 0000000000002bab
!	Mem[0000000030001408] = 500bbc13, %l0 = 0000000000003cbd
	ldsba	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000050
!	Mem[0000000010181410] = 000000ff, %l0 = 0000000000000050
	ldsba	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141410] = ff00000000000000, %l3 = 000000000000003c
	ldxa	[%i5+%o5]0x88,%l3	! %l3 = ff00000000000000
!	Mem[0000000010101408] = 00000000, %l0 = 0000000000000000
	lduha	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1410] = 21084f1800000b50, %l6 = 0000000000002bab
	ldxa	[%i3+%o5]0x89,%l6	! %l6 = 21084f1800000b50
!	Mem[00000000100c1400] = ff000000, %l5 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 00000000, %l6 = 21084f1800000b50
	ldstuba	[%i3+%o5]0x88,%l6	! %l6 = 00000000000000ff

p0_label_332:
!	%f26 = 000031ff 13bc0b50, Mem[0000000030181408] = 00000000 00000000
	stda	%f26,[%i6+%o4]0x89	! Mem[0000000030181408] = 000031ff 13bc0b50
!	%f22 = 3cbd696f, Mem[0000000010101408] = 00000000
	sta	%f22,[%i4+%o4]0x88	! Mem[0000000010101408] = 3cbd696f
!	%f18 = 00000000 13bc0b50, Mem[00000000100c1400] = ff000000 0000004c
	std	%f18,[%i3+%g0]	! Mem[00000000100c1400] = 00000000 13bc0b50
!	Mem[0000000030181408] = 13bc0b50, %l3 = ff00000000000000
	ldstuba	[%i6+%o4]0x89,%l3	! %l3 = 00000050000000ff
!	%f2  = 4a000b50, Mem[0000000030101410] = 00000000
	sta	%f2 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 4a000b50
!	%f24 = 00000000 000000ff, Mem[0000000030081400] = 00000000 00000000
	stda	%f24,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000 000000ff
!	%f28 = 00000000 00000000, %l3 = 0000000000000050
!	Mem[00000000300c1420] = 72a316e4319f9fdd
	add	%i3,0x020,%g1
	stda	%f28,[%g1+%l3]ASI_PST16_SL ! Mem[00000000300c1420] = 72a316e4319f9fdd
!	Mem[0000000010041410] = 0000002b, %l1 = 00000000000000ff
	swapa	[%i1+%o5]0x88,%l1	! %l1 = 000000000000002b
!	%f22 = 3cbd696f, Mem[0000000010081408] = ffffffff
	sta	%f22,[%i2+%o4]0x88	! Mem[0000000010081408] = 3cbd696f
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1420] = 00000000, %l1 = 000000000000002b
	ldub	[%i3+0x022],%l1		! %l1 = 0000000000000000

p0_label_333:
!	Mem[0000000030141400] = 46720048, %l5 = 00000000000000ff
	ldsha	[%i5+%g0]0x81,%l5	! %l5 = 0000000000004672
!	Mem[0000000010101400] = 000000ffea00ff00, %l5 = 0000000000004672
	ldxa	[%i4+%g0]0x80,%l5	! %l5 = 000000ffea00ff00
!	Mem[0000000030001408] = 13bc0b50, %l5 = 000000ffea00ff00
	ldsba	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000050
!	Mem[0000000030101400] = 00000000, %f25 = 000000ff
	lda	[%i4+%g0]0x81,%f25	! %f25 = 00000000
!	Mem[0000000010041408] = 000000ff, %f22 = 3cbd696f
	lda	[%i1+%o4]0x88,%f22	! %f22 = 000000ff
!	Mem[0000000010001410] = ff000000, %l5 = 0000000000000050
	lduba	[%i0+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081410] = ff000000, %l4 = 0000000000000000
	ldswa	[%i2+%o5]0x89,%l4	! %l4 = ffffffffff000000
!	Mem[0000000010041408] = 000000ff, %l0 = 0000000000000000
	lduwa	[%i1+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041434] = ffffffff, %l5 = 00000000000000ff
	ldub	[%i1+0x035],%l5		! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = ff000000, %l0 = 00000000000000ff
	swapa	[%i1+%o4]0x80,%l0	! %l0 = 00000000ff000000

p0_label_334:
!	Mem[0000000030081400] = ff000000, %l0 = 00000000ff000000
	swapa	[%i2+%g0]0x81,%l0	! %l0 = 00000000ff000000
!	Mem[000000001004143f] = 00000000, %l7 = 00000000000000ff
	ldstub	[%i1+0x03f],%l7		! %l7 = 00000000000000ff
!	%l4 = ffffffffff000000, Mem[000000001010143f] = ffffffab
	stb	%l4,[%i4+0x03f]		! Mem[000000001010143c] = ffffff00
!	%l3 = 0000000000000050, Mem[0000000010081400] = 00000000
	stha	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000050
!	%l7 = 0000000000000000, Mem[0000000030081410] = 000000ffffffffff
	stxa	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010001413] = ff000000, %asi = 80
	stba	%l6,[%i0+0x013]%asi	! Mem[0000000010001410] = ff000000
!	Mem[0000000030001408] = 13bc0b50, %l4 = ffffffffff000000
	ldstuba	[%i0+%o4]0x89,%l4	! %l4 = 00000050000000ff
!	Mem[0000000020800041] = 00ff095a, %l1 = 0000000000000000
	ldstub	[%o1+0x041],%l1		! %l1 = 000000ff000000ff
!	%f16 = 00000000 7fffffff 00000000 13bc0b50
!	%f20 = ff004473 ffff004a 000000ff ff00006e
!	%f24 = 00000000 00000000 000031ff 13bc0b50
!	%f28 = 00000000 00000000 00000000 000000ff
	stda	%f16,[%i3]ASI_BLK_S	! Block Store to 00000000300c1400
!	Starting 10 instruction Load Burst
!	%f7  = ff0000ff, %f6  = 00000000 ff0000ff
	fstox	%f7 ,%f6 		! %f6  = 80000000 00000000

p0_label_335:
	membar	#Sync			! Added by membar checker (58)
!	Mem[00000000300c1408] = 500bbc1300000000, %l5 = 00000000000000ff
	ldxa	[%i3+%o4]0x89,%l5	! %l5 = 500bbc1300000000
!	Mem[0000000010081408] = abffffff 3cbd696f, %l2 = 500bbc13, %l3 = 00000050
	ldda	[%i2+%o4]0x88,%l2	! %l2 = 000000003cbd696f 00000000abffffff
!	Mem[0000000030101408] = 00000000, %f4  = 000000ff
	lda	[%i4+%o4]0x81,%f4 	! %f4 = 00000000
!	Mem[0000000010101400] = 000000ffea00ff00, %l3 = 00000000abffffff
	ldxa	[%i4+%g0]0x80,%l3	! %l3 = 000000ffea00ff00
!	Mem[00000000100c1400] = 00000000, %l7 = 0000000000000000
	ldsha	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = 4a000b50, %l4 = 0000000000000050
	lduwa	[%i4+%o5]0x81,%l4	! %l4 = 000000004a000b50
!	Mem[0000000010081410] = 6f69bd3c, %l7 = 0000000000000000
	lduba	[%i2+%o5]0x88,%l7	! %l7 = 000000000000003c
!	Mem[0000000010181410] = ff000000, %l3 = 000000ffea00ff00
	lduwa	[%i6+%o5]0x88,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010081408] = 6f69bd3c, %l3 = 00000000ff000000
	ldsha	[%i2+%o4]0x80,%l3	! %l3 = 0000000000006f69
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 500b004a, %l7 = 000000000000003c
	ldstuba	[%i4+%o5]0x89,%l7	! %l7 = 0000004a000000ff

p0_label_336:
!	%l2 = 000000003cbd696f, Mem[00000000211c0000] = 00001327, %asi = 80
	stha	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 696f1327
!	%l0 = 00000000ff000000, Mem[00000000300c1400] = 00000000
	stha	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	Mem[0000000010181408] = 4a000b50, %f20 = ff004473
	lda	[%i6+%o4]0x80,%f20	! %f20 = 4a000b50
!	Mem[0000000020800001] = ffabca09, %l5 = 500bbc1300000000
	ldstuba	[%o1+0x001]%asi,%l5	! %l5 = 000000ab000000ff
!	%l1 = 00000000000000ff, Mem[0000000010041404] = 00000000
	sth	%l1,[%i1+0x004]		! Mem[0000000010041404] = 00ff0000
!	%f8  = 00000000 7fffffff, %l1 = 00000000000000ff
!	Mem[0000000010101400] = 000000ffea00ff00
	stda	%f8,[%i4+%l1]ASI_PST32_P ! Mem[0000000010101400] = 000000007fffffff
!	Mem[0000000030081408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101410] = 00000000, %l3 = 0000000000006f69
	ldstuba	[%i4+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%f20 = 4a000b50 ffff004a, %l1 = 00000000000000ff
!	Mem[0000000030141430] = 500bbc1348310000
	add	%i5,0x030,%g1
	stda	%f20,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030141430] = 4a00ffff500b004a
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 000031ff, %f5  = ff310000
	lda	[%i0+%o5]0x89,%f5 	! %f5 = 000031ff

p0_label_337:
!	Mem[0000000010001400] = 000000ff, %l4 = 000000004a000b50
	lduwa	[%i0+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101438] = ff000000, %l0 = 00000000ff000000
	ldsba	[%i4+0x03b]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l5 = 00000000000000ab
	lduwa	[%i5+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l4 = 00000000000000ff
	lduba	[%i4+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081400] = 00000050, %f14 = 00000000
	lda	[%i2+%g0]0x88,%f14	! %f14 = 00000050
!	Mem[0000000010041400] = 2b0bbc1300ff0000, %f18 = 00000000 13bc0b50
	ldda	[%i1+%g0]0x80,%f18	! %f18 = 2b0bbc13 00ff0000
!	Mem[0000000030041408] = 130bbc13 00000000, %l6 = 00000000, %l7 = 0000004a
	ldda	[%i1+%o4]0x81,%l6	! %l6 = 00000000130bbc13 0000000000000000
!	Mem[0000000010181410] = 000000ff, %l4 = 0000000000000000
	ldsw	[%i6+%o5],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030081400] = ff000000, %l0 = 0000000000000000
	lduwa	[%i2+%g0]0x81,%l0	! %l0 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 5fd29fff, %l4 = 00000000000000ff
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 000000ff000000ff

p0_label_338:
!	%l1 = 00000000000000ff, Mem[00000000100c1424] = 13bc0b50, %asi = 80
	stwa	%l1,[%i3+0x024]%asi	! Mem[00000000100c1424] = 000000ff
!	%f8  = 00000000 7fffffff, Mem[0000000030141410] = ff0000ff 3cbd696f
	stda	%f8 ,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000 7fffffff
!	%l2 = 000000003cbd696f, Mem[0000000030141410] = ffffff7f
	stba	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 6fffff7f
!	%l3 = 0000000000000000, Mem[0000000030101408] = 5a00000000000000
	stxa	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000000
!	%l4 = 00000000000000ff, Mem[0000000030181410] = ff000000
	stba	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = ff000000
!	%f4  = 00000000 000031ff, Mem[00000000100c1428] = 4a000000 184f0821
	stda	%f4 ,[%i3+0x028]%asi	! Mem[00000000100c1428] = 00000000 000031ff
!	%l6 = 00000000130bbc13, Mem[00000000201c0001] = ffff7e52
	stb	%l6,[%o0+0x001]		! Mem[00000000201c0000] = ff137e52
!	%l4 = 00000000000000ff, Mem[0000000030041400] = 7fffffff
	stwa	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ff
!	%l2 = 000000003cbd696f, Mem[0000000030101408] = 00000000
	stba	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000006f
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 3cbd696f, %l4 = 00000000000000ff
	ldsw	[%i2+%o5],%l4		! %l4 = 000000003cbd696f

p0_label_339:
!	Mem[00000000300c1400] = 000000007fffffff, %f14 = 00000050 ffac2efd
	ldda	[%i3+%g0]0x81,%f14	! %f14 = 00000000 7fffffff
!	Mem[0000000030101400] = 00000000, %l3 = 0000000000000000
	ldsba	[%i4+%g0]0x81,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (59)
!	Mem[0000000030081400] = ff000000 00000000 ff000000 5f8fff8e
!	Mem[0000000030081410] = 00000000 00000000 000000ff 00000000
!	Mem[0000000030081420] = 00ffffff 73441245 6e000000 6e007300
!	Mem[0000000030081430] = 0000ffb7 45a78c73 ff00ffff 45a78c73
	ldda	[%i2]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030081400
!	Mem[0000000010081434] = 00000000, %f24 = 00000000
	ld	[%i2+0x034],%f24	! %f24 = 00000000
!	Mem[0000000010101400] = 000000007fffffff, %l3 = 0000000000000000
	ldxa	[%i4+%g0]0x80,%l3	! %l3 = 000000007fffffff
!	Mem[0000000010101400] = ffffff7f00000000, %l6 = 00000000130bbc13
	ldxa	[%i4+%g0]0x88,%l6	! %l6 = ffffff7f00000000
!	Mem[0000000010001410] = 000000ff, %l1 = 00000000000000ff
	lduha	[%i0+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101408] = 6f69bd3c, %l5 = 0000000000000000
	ldswa	[%i4+%o4]0x80,%l5	! %l5 = 000000006f69bd3c
!	Mem[00000000100c1410] = 000000ff, %l5 = 000000006f69bd3c
	ldsba	[%i3+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = ff137e52, %l2 = 000000003cbd696f
	ldstuba	[%o0+0x000]%asi,%l2	! %l2 = 000000ff000000ff

p0_label_340:
!	Mem[0000000010001428] = 00000000, %l3 = 000000007fffffff
	swap	[%i0+0x028],%l3		! %l3 = 0000000000000000
!	Mem[0000000010041410] = ff000000, %l4 = 000000003cbd696f
	swap	[%i1+%o5],%l4		! %l4 = 00000000ff000000
!	%l3 = 0000000000000000, Mem[0000000010181432] = 34ff373a
	stb	%l3,[%i6+0x032]		! Mem[0000000010181430] = 34ff003a
!	Mem[00000000201c0000] = ff137e52, %l5 = ffffffffffffffff
	ldstuba	[%o0+0x000]%asi,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030041400] = ff000000, %l1 = 00000000000000ff
	swapa	[%i1+%g0]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[0000000030081410] = 00000000, %l1 = 00000000ff000000
	swapa	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%f25 = 00000000, Mem[0000000010141410] = 00000000
	sta	%f25,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	%l3 = 0000000000000000, Mem[0000000010081408] = 6f69bd3cffffffab
	stxa	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000000
!	%f24 = 00000000 00000000, Mem[0000000030141410] = 7fffff6f 00000000
	stda	%f24,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ffffff7f 00000000, %l0 = ff000000, %l1 = 00000000
	ldda	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000000 00000000ffffff7f

p0_label_341:
!	Mem[0000000010181408] = 500b004a, %l2 = 00000000000000ff
	lduba	[%i6+%o4]0x88,%l2	! %l2 = 000000000000004a
!	Mem[0000000010101414] = 00000000, %l4 = 00000000ff000000
	ldsha	[%i4+0x014]%asi,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l1 = 00000000ffffff7f
	lduwa	[%i3+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001438] = ff0000ff, %l2 = 000000000000004a
	ldub	[%i0+0x039],%l2		! %l2 = 0000000000000000
!	Mem[0000000030041410] = 4a00ffff, %l1 = 0000000000000000
	lduha	[%i1+%o5]0x81,%l1	! %l1 = 0000000000004a00
!	Mem[00000000300c1410] = ff004473, %l6 = ffffff7f00000000
	ldswa	[%i3+%o5]0x81,%l6	! %l6 = ffffffffff004473
!	%f28 = 00000000, %f26 = 000031ff 13bc0b50
	fitod	%f28,%f26		! %f26 = 00000000 00000000
!	Mem[00000000100c140c] = ffffffab, %l0 = 0000000000000000
	lduha	[%i3+0x00e]%asi,%l0	! %l0 = 000000000000ffab
!	Mem[0000000010081400] = 50000000, %l0 = 000000000000ffab
	lduwa	[%i2+%g0]0x80,%l0	! %l0 = 0000000050000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 4a00ffff, %l3 = 0000000000000000
	swapa	[%i1+%o5]0x81,%l3	! %l3 = 000000004a00ffff

p0_label_342:
!	%f21 = ffff004a, Mem[0000000010101400] = 00000000
	sta	%f21,[%i4+%g0]0x88	! Mem[0000000010101400] = ffff004a
!	Mem[0000000020800001] = ffffca09, %l0 = 0000000050000000
	ldstuba	[%o1+0x001]%asi,%l0	! %l0 = 000000ff000000ff
!	%l4 = 0000000000000000, Mem[000000001000140b] = ff9fd25f
	stb	%l4,[%i0+0x00b]		! Mem[0000000010001408] = ff9fd200
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000010081408] = 00000000 00000000
	stda	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000 000000ff
!	%l6 = ffffffffff004473, Mem[0000000010041400] = 2b0bbc13
	stwa	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = ff004473
!	Mem[0000000030001400] = ff00ffb7, %l5 = 00000000000000ff
	ldstuba	[%i0+%g0]0x81,%l5	! %l5 = 000000ff000000ff
!	%f30 = 00000000 000000ff, Mem[0000000030101410] = 500b00ff 00000000
	stda	%f30,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000 000000ff
!	Mem[0000000010141408] = 00000000000000ff, %l6 = ffffffffff004473, %l5 = 00000000000000ff
	add	%i5,0x08,%g1
	casxa	[%g1]0x80,%l6,%l5	! %l5 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010181430] = 34ff003a
	stw	%l7,[%i6+0x030]		! Mem[0000000010181430] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001418] = 000000ff, %l6 = ffffffffff004473
	lduba	[%i0+0x019]%asi,%l6	! %l6 = 0000000000000000

p0_label_343:
!	Mem[000000001008143c] = ffffffab, %l0 = 00000000000000ff
	ldsba	[%i2+0x03f]%asi,%l0	! %l0 = ffffffffffffffab
!	Mem[0000000030041400] = 000000ff00000000, %f8  = 45124473 ffffff00
	ldda	[%i1+%g0]0x81,%f8 	! %f8  = 000000ff 00000000
!	Mem[0000000030181400] = 3cbd696f, %f16 = 00000000
	lda	[%i6+%g0]0x81,%f16	! %f16 = 3cbd696f
!	Mem[00000000100c1404] = 13bc0b50, %f4  = 00000000
	ld	[%i3+0x004],%f4 	! %f4 = 13bc0b50
!	Mem[0000000030081400] = ff000000, %l7 = 0000000000000000
	lduwa	[%i2+%g0]0x81,%l7	! %l7 = 00000000ff000000
!	Mem[0000000010181410] = 000031ff ff000000, %l2 = 00000000, %l3 = 4a00ffff
	ldda	[%i6+%o5]0x88,%l2	! %l2 = 00000000ff000000 00000000000031ff
!	%l0 = ffffffffffffffab, %l4 = 0000000000000000, %l5 = 00000000000000ff
	or	%l0,%l4,%l5		! %l5 = ffffffffffffffab
!	Mem[0000000030041400] = 000000ff00000000, %f30 = 00000000 000000ff
	ldda	[%i1+%g0]0x81,%f30	! %f30 = 000000ff 00000000
!	Mem[0000000010101410] = 00000000000000ff, %l0 = ffffffffffffffab
	ldxa	[%i4+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = ff000000, Mem[00000000300c1410] = 734400ff 4a00ffff
	stda	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000 ff000000

p0_label_344:
!	Mem[0000000030101408] = 0000006f, %l7 = 00000000ff000000
	ldstuba	[%i4+%o4]0x89,%l7	! %l7 = 0000006f000000ff
!	Mem[0000000010141410] = 00000000, %l7 = 000000000000006f
	swapa	[%i5+%o5]0x88,%l7	! %l7 = 0000000000000000
!	%l1 = 0000000000004a00, Mem[0000000010001410] = 000000ff000000ff
	stxa	%l1,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000004a00
!	%l4 = 0000000000000000, Mem[0000000010101418] = ff004473, %asi = 80
	stwa	%l4,[%i4+0x018]%asi	! Mem[0000000010101418] = 00000000
!	%f13 = b7ff0000, Mem[0000000030041408] = 13bc0b13
	sta	%f13,[%i1+%o4]0x89	! Mem[0000000030041408] = b7ff0000
!	%l0 = 00000000000000ff, Mem[00000000300c1408] = 00000000
	stba	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff000000
!	%f30 = 000000ff 00000000, Mem[0000000010041408] = 000000ff 00000000
	stda	%f30,[%i1+0x008]%asi	! Mem[0000000010041408] = 000000ff 00000000
!	%f12 = 738ca745, Mem[0000000010141410] = 6f000000
	sta	%f12,[%i5+%o5]0x80	! Mem[0000000010141410] = 738ca745
!	Mem[0000000030141400] = 48007246, %l1 = 0000000000004a00
	ldstuba	[%i5+%g0]0x89,%l1	! %l1 = 00000046000000ff
!	Starting 10 instruction Load Burst
!	%l2 = 00000000ff000000, %l6 = 0000000000000000, %l1 = 0000000000000046
	xor	%l2,%l6,%l1		! %l1 = 00000000ff000000

p0_label_345:
!	Mem[000000001018141c] = ff0000ff, %l6 = 0000000000000000
	lduh	[%i6+0x01e],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010001408] = ff9fd200, %l4 = 0000000000000000
	ldswa	[%i0+%o4]0x80,%l4	! %l4 = ffffffffff9fd200
!	Mem[0000000010141428] = 0073006e0000006e, %f30 = 000000ff 00000000
	ldd	[%i5+0x028],%f30	! %f30 = 0073006e 0000006e
!	Mem[0000000030041410] = 00000000, %l6 = 00000000000000ff
	ldswa	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041408] = 00000000 b7ff0000, %l4 = ff9fd200, %l5 = ffffffab
	ldda	[%i1+%o4]0x89,%l4	! %l4 = 00000000b7ff0000 0000000000000000
!	Mem[0000000030041408] = b7ff0000, %l3 = 00000000000031ff
	lduba	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l7 = 0000000000000000
	ldsba	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101400] = ffffff7fffff004a, %l7 = 0000000000000000
	ldxa	[%i4+%g0]0x88,%l7	! %l7 = ffffff7fffff004a
!	Mem[0000000010141400] = ab2b0000, %l4 = 00000000b7ff0000
	ldsba	[%i5+%g0]0x80,%l4	! %l4 = ffffffffffffffab
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[0000000030181400] = 6f69bd3c
	stha	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 6f6900ff

p0_label_346:
!	%l7 = ffffff7fffff004a, Mem[000000001014140a] = 00000000, %asi = 80
	stha	%l7,[%i5+0x00a]%asi	! Mem[0000000010141408] = 0000004a
!	%f4  = 13bc0b50, Mem[0000000030001400] = ff00ffb7
	sta	%f4 ,[%i0+%g0]0x81	! Mem[0000000030001400] = 13bc0b50
!	%l2 = ff000000, %l3 = 00000000, Mem[0000000010101408] = 3cbd696f 3cbd696f
	stda	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = ff000000 00000000
	membar	#Sync			! Added by membar checker (60)
!	%l7 = ffffff7fffff004a, Mem[0000000030081410] = ff00000000000000
	stxa	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffff7fffff004a
!	%l2 = 00000000ff000000, Mem[0000000010001408] = ff9fd200
	stwa	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000000
!	Code Fragment 3
p0_fragment_10:
!	%l0 = 00000000000000ff
	setx	0x8073e1479aa25879,%g7,%l0 ! %l0 = 8073e1479aa25879
!	%l1 = 00000000ff000000
	setx	0xf1f82cd054c890c4,%g7,%l1 ! %l1 = f1f82cd054c890c4
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8073e1479aa25879
	setx	0x79955ee0545e241a,%g7,%l0 ! %l0 = 79955ee0545e241a
!	%l1 = f1f82cd054c890c4
	setx	0x9b916657e6b4a991,%g7,%l1 ! %l1 = 9b916657e6b4a991
!	Mem[0000000020800040] = 00ff095a, %l6 = 0000000000000000
	ldstub	[%o1+0x040],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010141408] = 4a000000, %l1 = 9b916657e6b4a991
	ldstuba	[%i5+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%f2  = 8eff8f5f 000000ff, Mem[0000000010081408] = 00000000 000000ff
	stda	%f2 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 8eff8f5f 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ff000000, %l3 = 0000000000000000
	lduba	[%i4+%o5]0x81,%l3	! %l3 = 00000000000000ff

p0_label_347:
!	Mem[00000000211c0000] = 696f1327, %l4 = ffffffffffffffab
	ldsb	[%o2+%g0],%l4		! %l4 = 0000000000000069
!	Mem[0000000010141408] = 4a0000ff, %l3 = 00000000000000ff
	ldsha	[%i5+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101410] = 000000ff, %l2 = 00000000ff000000
	ldsha	[%i4+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141400] = 00000000 480072ff, %l2 = 000000ff, %l3 = 000000ff
	ldda	[%i5+%g0]0x89,%l2	! %l2 = 00000000480072ff 0000000000000000
!	Mem[0000000010181400] = ff00000000000000, %f2  = 8eff8f5f 000000ff
	ldda	[%i6+%g0]0x80,%f2 	! %f2  = ff000000 00000000
!	Mem[0000000010001430] = 0000000098fc46ff, %l2 = 00000000480072ff
	ldxa	[%i0+0x030]%asi,%l2	! %l2 = 0000000098fc46ff
!	Mem[00000000300c1408] = 500bbc13000000ff, %l3 = 0000000000000000
	ldxa	[%i3+%o4]0x89,%l3	! %l3 = 500bbc13000000ff
!	Mem[0000000030041400] = 000000ff00000000, %l0 = 79955ee0545e241a
	ldxa	[%i1+%g0]0x81,%l0	! %l0 = 000000ff00000000
!	Mem[0000000010141418] = 00000000ff000000, %f18 = 2b0bbc13 00ff0000
	ldda	[%i5+0x018]%asi,%f18	! %f18 = 00000000 ff000000
!	Starting 10 instruction Store Burst
!	%f6  = 00000000 ff000000, Mem[0000000010101410] = 000000ff 00000000
	stda	%f6 ,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000 ff000000

p0_label_348:
!	Mem[0000000010081422] = ff004473, %l4 = 0000000000000069
	ldstuba	[%i2+0x022]%asi,%l4	! %l4 = 00000044000000ff
!	Mem[0000000010101408] = ff000000, %l6 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l6	! %l6 = 00000000ff000000
!	%l1 = 0000000000000000, Mem[00000000100c143a] = 500b0013
	sth	%l1,[%i3+0x03a]		! Mem[00000000100c1438] = 500b0000
!	Mem[0000000010141430] = 00000000, %l1 = 0000000000000000
	swap	[%i5+0x030],%l1		! %l1 = 0000000000000000
!	Mem[0000000010041414] = ffff00ff, %l3 = 500bbc13000000ff
	swap	[%i1+0x014],%l3		! %l3 = 00000000ffff00ff
!	%l1 = 0000000000000000, Mem[0000000010141408] = ff00004a
	stba	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000004a
!	%l0 = 000000ff00000000, Mem[00000000100c1400] = 00000000
	stha	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	%f14 = 738ca745 ffff00ff, Mem[0000000010001408] = ff000000 5f8fff8e
	stda	%f14,[%i0+%o4]0x80	! Mem[0000000010001408] = 738ca745 ffff00ff
!	Mem[0000000030001400] = 13bc0b50, %l4 = 0000000000000044
	swapa	[%i0+%g0]0x81,%l4	! %l4 = 0000000013bc0b50
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ff000000, %l4 = 0000000013bc0b50
	ldswa	[%i2+%o4]0x81,%l4	! %l4 = ffffffffff000000

p0_label_349:
!	Mem[0000000010101400] = ffff004a, %l1 = 0000000000000000
	ldsba	[%i4+%g0]0x88,%l1	! %l1 = 000000000000004a
!	Mem[0000000010081408] = ff000000, %l3 = 00000000ffff00ff
	ldsba	[%i2+%o4]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000201c0000] = ff137e52, %l7 = ffffff7fffff004a
	lduh	[%o0+%g0],%l7		! %l7 = 000000000000ff13
!	Mem[0000000030101410] = ff000000, %l3 = ffffffffffffffff
	ldswa	[%i4+%o5]0x81,%l3	! %l3 = ffffffffff000000
!	Mem[0000000010141400] = 0000000000002bab, %l6 = 00000000ff000000
	ldxa	[%i5+%g0]0x88,%l6	! %l6 = 0000000000002bab
!	Mem[0000000010001408] = 738ca745, %l1 = 000000000000004a
	lduha	[%i0+%o4]0x80,%l1	! %l1 = 000000000000738c
!	Mem[0000000010041408] = 000000ff, %l2 = 0000000098fc46ff
	ldswa	[%i1+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141400] = ab2b000000000000, %f30 = 0073006e 0000006e
	ldda	[%i5+0x000]%asi,%f30	! %f30 = ab2b0000 00000000
!	Mem[0000000010141400] = 00000000 00002bab, %l0 = 00000000, %l1 = 0000738c
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 0000000000002bab 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffff000000, Mem[0000000030001410] = ff31000000000000
	stxa	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = ffffffffff000000

p0_label_350:
!	%l0 = 0000000000002bab, Mem[0000000030141408] = 000000004a0000ff
	stxa	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000000000002bab
!	Mem[00000000100c1408] = 00000000, %l1 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l1	! %l1 = 0000000000000000
!	%l2 = 00000000000000ff, Mem[0000000010001400] = 000000ff
	stba	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff
!	Mem[0000000010041400] = 734400ff, %l3 = ffffffffff000000
	ldstuba	[%i1+%g0]0x88,%l3	! %l3 = 000000ff000000ff
!	%l4 = ffffffffff000000, Mem[00000000100c142a] = 00000000
	stb	%l4,[%i3+0x02a]		! Mem[00000000100c1428] = 00000000
!	%f0  = 00000000 000000ff, Mem[0000000010081408] = ff000000 5f8fff8e
	stda	%f0 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000 000000ff
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000010001430] = 00000000 98fc46ff
	stda	%l2,[%i0+0x030]%asi	! Mem[0000000010001430] = 000000ff 000000ff
!	Mem[0000000010101408] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i4+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000030041410] = 00000000
	stba	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00000000 00000000, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i4+%g0]0x89,%l2	! %l2 = 0000000000000000 0000000000000000

p0_label_351:
!	Mem[0000000010041410] = 3cbd696f, %l2 = 0000000000000000
	ldsha	[%i1+%o5]0x80,%l2	! %l2 = 0000000000003cbd
!	Mem[00000000100c1410] = ff000000, %l1 = 0000000000000000
	ldub	[%i3+0x012],%l1		! %l1 = 0000000000000000
!	Mem[0000000010041408] = ff000000, %l4 = ffffffffff000000
	lduwa	[%i1+%o4]0x88,%l4	! %l4 = 00000000ff000000
!	Mem[00000000100c1410] = 000031ff 000000ff, %l6 = 00002bab, %l7 = 0000ff13
	ldda	[%i3+%o5]0x88,%l6	! %l6 = 00000000000000ff 00000000000031ff
!	Mem[0000000030081400] = ff000000, %l6 = 00000000000000ff
	lduwa	[%i2+%g0]0x81,%l6	! %l6 = 00000000ff000000
!	Mem[00000000300c1408] = 500bbc13000000ff, %f14 = 738ca745 ffff00ff
	ldda	[%i3+%o4]0x89,%f14	! %f14 = 500bbc13 000000ff
!	Mem[00000000300c1408] = 000000ff, %l4 = 00000000ff000000
	lduha	[%i3+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101420] = ff004473, %l6 = 00000000ff000000
	lduwa	[%i4+0x020]%asi,%l6	! %l6 = 00000000ff004473
!	Mem[0000000030141410] = 00000000, %l0 = 0000000000002bab
	lduha	[%i5+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010001410] = 0000000000004a00
	stxa	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000000000

p0_label_352:
!	Mem[0000000030141410] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i5+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000010181408] = 4a000b50
	stwa	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000030001410] = ffffffff 000000ff
	stda	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000 00000000
!	Mem[0000000010141431] = 00000000, %l7 = 00000000000031ff
	ldstuba	[%i5+0x031]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141408] = 0000004a, %l6 = 00000000ff004473
	swapa	[%i5+%o4]0x80,%l6	! %l6 = 000000000000004a
!	Mem[000000001010141a] = 00000000, %l2 = 0000000000003cbd
	ldstuba	[%i4+0x01a]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001408] = 13bc0bff, %l1 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l1	! %l1 = 0000000013bc0bff
!	Mem[0000000030141410] = 000000ff, %l3 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000010141408] = ff004473
	stha	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 00004473
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00004473, %l4 = 00000000000000ff
	ldsha	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000

p0_label_353:
!	Mem[0000000010081408] = 00000000, %l5 = 0000000000000000
	ldswa	[%i2+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101408] = 000000ff, %f1  = 000000ff
	lda	[%i4+%o4]0x88,%f1 	! %f1 = 000000ff
!	Mem[0000000010081408] = 00000000 000000ff, %l0 = 00000000, %l1 = 13bc0bff
	ldda	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000000 00000000000000ff
!	Mem[0000000010181400] = ff000000, %l3 = 00000000000000ff
	ldswa	[%i6+%g0]0x80,%l3	! %l3 = ffffffffff000000
!	Mem[0000000010001408] = 45a78c73, %l4 = 0000000000000000
	ldswa	[%i0+%o4]0x88,%l4	! %l4 = 0000000045a78c73
!	Mem[0000000030141408] = 00000000 00002bab, %l2 = 00000000, %l3 = ff000000
	ldda	[%i5+%o4]0x89,%l2	! %l2 = 0000000000002bab 0000000000000000
!	Mem[00000000100c1408] = 00000000ffffffab, %f20 = 4a000b50 ffff004a
	ldda	[%i3+%o4]0x80,%f20	! %f20 = 00000000 ffffffab
!	Mem[00000000300c1410] = 00000000000000ff, %l2 = 0000000000002bab
	ldxa	[%i3+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081408] = 000000ff, %f14 = 500bbc13
	lda	[%i2+%o4]0x89,%f14	! %f14 = 000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000010141418] = 00000000 ff000000
	stda	%l0,[%i5+0x018]%asi	! Mem[0000000010141418] = 00000000 000000ff

p0_label_354:
!	Mem[0000000010141410] = 45a78c73, %l6 = 000000000000004a
	ldstuba	[%i5+%o5]0x88,%l6	! %l6 = 00000073000000ff
!	Mem[0000000010101408] = 000000ff, %l6 = 0000000000000073
	ldstuba	[%i4+%o4]0x88,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030101410] = 000000ff, %l6 = 00000000000000ff
	swapa	[%i4+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000030101410] = 00000000000000ff
	stxa	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000010101410] = 000000ff
	stha	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000ff
!	%f14 = 000000ff 000000ff, Mem[00000000300c1410] = 00000000 000000ff
	stda	%f14,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000ff 000000ff
!	Mem[00000000100c1410] = 000000ff, %l7 = 0000000000000000
	ldstuba	[%i3+%o5]0x88,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030141408] = ab2b0000, %l6 = 00000000000000ff
	ldstuba	[%i5+%o4]0x81,%l6	! %l6 = 000000ab000000ff
!	Mem[00000000201c0000] = ff137e52, %l6 = 00000000000000ab
	ldstuba	[%o0+0x000]%asi,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ff000000, %f1  = 000000ff
	lda	[%i1+%o5]0x81,%f1 	! %f1 = ff000000

p0_label_355:
!	Mem[0000000010081400] = 50000000ea000000, %f24 = 00000000 00000000
	ldda	[%i2+%g0]0x80,%f24	! %f24 = 50000000 ea000000
!	Mem[0000000020800000] = ffffca09, %l0 = 0000000000000000
	lduh	[%o1+%g0],%l0		! %l0 = 000000000000ffff
!	Mem[0000000030041408] = b7ff0000, %l6 = 00000000000000ff
	lduwa	[%i1+%o4]0x89,%l6	! %l6 = 00000000b7ff0000
!	Mem[0000000010001410] = 00000000, %l0 = 000000000000ffff
	ldsha	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %f1  = ff000000
	lda	[%i2+%o4]0x88,%f1 	! %f1 = 00000000
!	Mem[0000000010101400] = ffff004a, %l7 = 00000000000000ff
	lduwa	[%i4+%g0]0x88,%l7	! %l7 = 00000000ffff004a
!	Mem[0000000010081404] = ea000000, %l7 = 00000000ffff004a
	lduba	[%i2+0x007]%asi,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l6 = 00000000b7ff0000
	ldsha	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = 696f1327, %l2 = 00000000000000ff
	ldsba	[%o2+0x000]%asi,%l2	! %l2 = 0000000000000069
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010001408] = 45a78c73
	stba	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 45a78c00

p0_label_356:
!	Mem[0000000030041400] = 000000ff, %l5 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	%l4 = 0000000045a78c73, Mem[0000000030141400] = ff720048
	stha	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 8c730048
!	%f4  = 13bc0b50 00000000, %l6 = 0000000000000000
!	Mem[0000000030101408] = ff00000000000000
	add	%i4,0x008,%g1
	stda	%f4,[%g1+%l6]ASI_PST32_S ! Mem[0000000030101408] = ff00000000000000
!	Mem[0000000030001400] = 00000044, %l3 = 0000000000000000
	ldstuba	[%i0+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	%l2 = 0000000000000069, Mem[0000000010041410] = 6f69bd3c
	stba	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 6f69bd69
!	Mem[0000000010001410] = 00000000, %l0 = 0000000000000000
	swapa	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000000
!	%f7  = ff000000, Mem[00000000300c1400] = 00000000
	sta	%f7 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff000000
!	%l0 = 0000000000000000, Mem[000000001018141c] = ff0000ff, %asi = 80
	stwa	%l0,[%i6+0x01c]%asi	! Mem[000000001018141c] = 00000000
!	%l1 = 00000000000000ff, Mem[0000000010041408] = 00000000ff000000
	stxa	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001008140c] = 000000ff, %l1 = 00000000000000ff
	ldsba	[%i2+0x00f]%asi,%l1	! %l1 = ffffffffffffffff

p0_label_357:
!	Mem[0000000020800000] = ffffca09, %l5 = 00000000000000ff
	ldsh	[%o1+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010081400] = 50000000, %l4 = 0000000045a78c73
	ldswa	[%i2+%g0]0x80,%l4	! %l4 = 0000000050000000
!	Mem[0000000030181410] = 000000ff, %l5 = ffffffffffffffff
	ldswa	[%i6+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001400] = 000000ff 440000ff, %l0 = 00000000, %l1 = ffffffff
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 00000000440000ff 00000000000000ff
!	Mem[0000000030181410] = 000000ff, %l7 = 0000000000000000
	ldswa	[%i6+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141400] = ab2b0000 00000000, %l4 = 50000000, %l5 = 000000ff
	ldda	[%i5+%g0]0x80,%l4	! %l4 = 00000000ab2b0000 0000000000000000
!	Mem[00000000100c1410] = 000000ff, %l4 = 00000000ab2b0000
	lduha	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081408] = 00000000, %l1 = 00000000000000ff
	ldswa	[%i2+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1408] = 00000000 ffffffab, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000 00000000ffffffab
!	Starting 10 instruction Store Burst
!	%f2  = ff000000 00000000, Mem[0000000030181410] = 000000ff 00003500
	stda	%f2 ,[%i6+%o5]0x89	! Mem[0000000030181410] = ff000000 00000000

p0_label_358:
!	Mem[000000001018142a] = 000000ad, %l7 = 00000000ffffffab
	ldstub	[%i6+0x02a],%l7		! %l7 = 00000000000000ff
!	%l2 = 0000000000000069, Mem[0000000010001408] = 008ca745
	stwa	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000069
!	%l7 = 0000000000000000, Mem[0000000010141418] = 00000000
	stw	%l7,[%i5+0x018]		! Mem[0000000010141418] = 00000000
!	%l2 = 00000069, %l3 = 00000000, Mem[0000000030081400] = ff000000 00000000
	stda	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000069 00000000
!	%f16 = 3cbd696f 7fffffff, Mem[0000000010041400] = ff004473 00ff0000
	stda	%f16,[%i1+%g0]0x80	! Mem[0000000010041400] = 3cbd696f 7fffffff
!	Mem[00000000100c1408] = 00000000, %l7 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	%l2 = 0000000000000069, Mem[000000001000141a] = 000000ff, %asi = 80
	stha	%l2,[%i0+0x01a]%asi	! Mem[0000000010001418] = 00000069
!	%l1 = 0000000000000000, Mem[0000000030001400] = ff000044
	stha	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000044
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff000000, %l1 = 0000000000000000
	ldsba	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000000

p0_label_359:
!	Mem[000000001004142c] = 00000000, %f15 = 000000ff
	lda	[%i1+0x02c]%asi,%f15	! %f15 = 00000000
!	Mem[0000000010101400] = 4a00ffff, %f5  = 00000000
	lda	[%i4+%g0]0x80,%f5 	! %f5 = 4a00ffff
!	Mem[0000000010101410] = 00000000ff000000, %l6 = 0000000000000000
	ldxa	[%i4+%o5]0x88,%l6	! %l6 = 00000000ff000000
!	Mem[0000000010141408] = 73440000, %l2 = 0000000000000069
	ldswa	[%i5+%o4]0x88,%l2	! %l2 = 0000000073440000
!	Mem[0000000010181420] = 00000000, %l6 = 00000000ff000000
	lduwa	[%i6+0x020]%asi,%l6	! %l6 = 0000000000000000
!	Code Fragment 4
p0_fragment_11:
!	%l0 = 00000000440000ff
	setx	0x0b942f1ff4cd53f4,%g7,%l0 ! %l0 = 0b942f1ff4cd53f4
!	%l1 = 0000000000000000
	setx	0xe4fe199032dbb201,%g7,%l1 ! %l1 = e4fe199032dbb201
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0b942f1ff4cd53f4
	setx	0x4fcc410864c6b119,%g7,%l0 ! %l0 = 4fcc410864c6b119
!	%l1 = e4fe199032dbb201
	setx	0x39647be7e5986f1f,%g7,%l1 ! %l1 = 39647be7e5986f1f
!	Mem[0000000010081404] = ea000000, %l3 = 0000000000000000
	ldsba	[%i2+0x007]%asi,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1400] = ff000000, %f14 = 000000ff
	lda	[%i3+%g0]0x80,%f14	! %f14 = ff000000
!	Mem[0000000010041408] = 00000000 000000ff, %l2 = 73440000, %l3 = 00000000
	ldda	[%i1+%o4]0x88,%l2	! %l2 = 00000000000000ff 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 4fcc410864c6b119, Mem[0000000010181408] = 0000000045a78c73
	stx	%l0,[%i6+%o4]		! Mem[0000000010181408] = 4fcc410864c6b119

p0_label_360:
!	Mem[0000000010181408] = 0841cc4f, %l3 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l3	! %l3 = 0000004f000000ff
!	Mem[00000000100c1412] = ff000000, %l4 = 00000000000000ff
	ldstub	[%i3+0x012],%l4		! %l4 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000030081410] = ffffff7f
	stha	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000ff7f
!	Mem[00000000100c1400] = 000000ff, %l1 = 39647be7e5986f1f
	ldstuba	[%i3+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[00000000300c1408] = ff00000013bc0b50
	stxa	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000000000000
!	Mem[00000000100c1400] = ff000000, %l7 = 0000000000000000
	ldstuba	[%i3+0x000]%asi,%l7	! %l7 = 000000ff000000ff
!	%l4 = 00000000, %l5 = 00000000, Mem[00000000300c1410] = 000000ff 000000ff
	stda	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000 00000000
!	Mem[0000000010081408] = 00000000, %l5 = 0000000000000000
	swapa	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030081408] = 8eff8f5f000000ff
	stxa	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff000000, %l4 = 0000000000000000
	ldswa	[%i6+%o5]0x88,%l4	! %l4 = ffffffffff000000

p0_label_361:
!	Mem[0000000030081408] = 0000000000000000, %f2  = ff000000 00000000
	ldda	[%i2+%o4]0x81,%f2 	! %f2  = 00000000 00000000
!	Mem[0000000010001438] = ff0000ff 00350000, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i0+0x038]%asi,%l6	! %l6 = 00000000ff0000ff 0000000000350000
!	Mem[0000000030101400] = 00000000, %l6 = 00000000ff0000ff
	ldsba	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081410] = 0000ff7f, %l2 = 00000000000000ff
	lduha	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001410] = 0000000000000000, %l7 = 0000000000350000
	ldxa	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041410] = 000000ff, %l5 = 0000000000000000
	lduba	[%i1+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1410] = 00000000, %f26 = 00000000
	lda	[%i3+%o5]0x81,%f26	! %f26 = 00000000
!	Mem[0000000010101400] = ffffff7fffff004a, %l7 = 0000000000000000
	ldxa	[%i4+%g0]0x88,%l7	! %l7 = ffffff7fffff004a
!	Mem[0000000030141410] = 00000000 00000000, %l2 = 00000000, %l3 = 0000004f
	ldda	[%i5+%o5]0x81,%l2	! %l2 = 0000000000000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = ffff004a, Mem[00000000100c1408] = 00000000 abffffff
	stda	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 ffff004a

p0_label_362:
!	%l0 = 4fcc410864c6b119, Mem[0000000010001424] = ff0000ff
	stw	%l0,[%i0+0x024]		! Mem[0000000010001424] = 64c6b119
!	%l2 = 0000000000000000, Mem[00000000211c0000] = 696f1327, %asi = 80
	stba	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 006f1327
!	%f16 = 3cbd696f, Mem[00000000100c1428] = 00000000
	st	%f16,[%i3+0x028]	! Mem[00000000100c1428] = 3cbd696f
!	%l6 = 0000000000000000, %l6 = 0000000000000000, %y  = 00000000
	sdiv	%l6,%l6,%l5		! Div by zero, %l0 = 4fcc410864c6b169
	mov	%l0,%y			! %y = 64c6b141
!	Mem[0000000030041408] = 0000ffb7, %l7 = ffffff7fffff004a
	swapa	[%i1+%o4]0x81,%l7	! %l7 = 000000000000ffb7
!	Mem[0000000010101410] = 000000ff, %l0 = 4fcc410864c6b141
	ldstuba	[%i4+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%l4 = ffffffffff000000, Mem[0000000010041408] = 000000ff
	stba	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	%l4 = ff000000, %l5 = 000000ff, Mem[0000000010041400] = 6f69bd3c ffffff7f
	stda	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = ff000000 000000ff
!	%f20 = 00000000 ffffffab, Mem[0000000010101438] = ff000000 ffffff00
	std	%f20,[%i4+0x038]	! Mem[0000000010101438] = 00000000 ffffffab
!	Starting 10 instruction Load Burst
!	Mem[0000000010141420] = 00000000, %l1 = 00000000000000ff
	ldsba	[%i5+0x023]%asi,%l1	! %l1 = 0000000000000000

p0_label_363:
!	Mem[0000000010001400] = 000000ff, %l2 = 0000000000000000
	lduwa	[%i0+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1400] = ff000000, %l2 = 00000000000000ff
	ldsha	[%i3+%g0]0x80,%l2	! %l2 = ffffffffffffff00
!	Mem[00000000201c0000] = ff137e52, %l4 = ffffffffff000000
	ldsba	[%o0+0x001]%asi,%l4	! %l4 = 0000000000000013
!	Mem[0000000030041400] = 00000000, %l1 = 0000000000000000
	lduba	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = 00004473, %l7 = 000000000000ffb7
	lduwa	[%i5+%o4]0x80,%l7	! %l7 = 0000000000004473
!	Mem[0000000030081400] = 00000069 00000000, %l4 = 00000013, %l5 = 000000ff
	ldda	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000069 0000000000000000
!	Mem[0000000010181400] = 000000ff, %l2 = ffffffffffffff00
	lduba	[%i6+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101400] = ffff004a, %l1 = 0000000000000000
	ldsba	[%i4+%g0]0x88,%l1	! %l1 = 000000000000004a
!	Mem[0000000010181410] = ff000000, %l6 = 0000000000000000
	ldswa	[%i6+%o5]0x88,%l6	! %l6 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	%f26 = 00000000, Mem[0000000010041408] = 00000000
	sta	%f26,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000

p0_label_364:
!	Mem[0000000030181408] = ff0bbc13, %l0 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	%f15 = 00000000, Mem[0000000030081410] = 0000ff7f
	sta	%f15,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	%f12 = 738ca745 b7ff0000, Mem[0000000010101438] = 00000000 ffffffab
	std	%f12,[%i4+0x038]	! Mem[0000000010101438] = 738ca745 b7ff0000
!	Mem[00000000201c0000] = ff137e52, %l1 = 000000000000004a
	ldstuba	[%o0+0x000]%asi,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010041410] = 6f69bd69, %l6 = ffffffffff000000
	swapa	[%i1+%o5]0x88,%l6	! %l6 = 000000006f69bd69
!	%l7 = 0000000000004473, Mem[00000000100c1408] = 00000000
	stba	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000073
!	%l4 = 0000000000000069, Mem[0000000010041400] = ff000000
	stba	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = ff000069
!	Mem[0000000030041408] = ffff004a, %l6 = 000000006f69bd69
	swapa	[%i1+%o4]0x81,%l6	! %l6 = 00000000ffff004a
!	%l3 = 0000000000000000, Mem[0000000021800101] = 00ff8c1a, %asi = 80
	stba	%l3,[%o3+0x101]%asi	! Mem[0000000021800100] = 00008c1a
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00000000, %l0 = 00000000000000ff
	lduha	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000

p0_label_365:
!	Mem[0000000010101400] = 4a00ffff7fffffff, %l5 = 0000000000000000
	ldxa	[%i4+%g0]0x80,%l5	! %l5 = 4a00ffff7fffffff
!	Mem[0000000030141410] = 00000000, %l2 = 00000000000000ff
	lduba	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081410] = 6f69bd3c, %l6 = 00000000ffff004a
	ldsha	[%i2+%o5]0x88,%l6	! %l6 = ffffffffffffbd3c
!	Mem[00000000100c1410] = 00ff00ff, %l3 = 0000000000000000
	ldswa	[%i3+%o5]0x88,%l3	! %l3 = 0000000000ff00ff
!	Mem[0000000010141400] = ab2b0000, %f15 = 00000000
	lda	[%i5+0x000]%asi,%f15	! %f15 = ab2b0000
!	Mem[0000000010001410] = 00000000 00000000, %l4 = 00000069, %l5 = 7fffffff
	ldda	[%i0+%o5]0x80,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000030041400] = 00000000 00000000, %l2 = 00000000, %l3 = 00ff00ff
	ldda	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010041400] = ff000069, %l1 = 00000000000000ff
	lduba	[%i1+%g0]0x88,%l1	! %l1 = 0000000000000069
!	Mem[0000000010041408] = 0000000000000000, %l4 = 0000000000000000
	ldxa	[%i1+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030001408] = 00000000
	stwa	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000

p0_label_366:
!	Mem[0000000030041410] = ff000000, %l7 = 0000000000004473
	swapa	[%i1+%o5]0x81,%l7	! %l7 = 00000000ff000000
!	%l2 = 0000000000000000, Mem[0000000010081410] = 6f69bd3c
	stba	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 6f69bd00
!	%l4 = 0000000000000000, Mem[0000000010141404] = 00000000, %asi = 80
	stha	%l4,[%i5+0x004]%asi	! Mem[0000000010141404] = 00000000
!	%f6  = 00000000, Mem[00000000100c1410] = ff00ff00
	sta	%f6 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	%f20 = 00000000 ffffffab, Mem[0000000010101400] = ffff004a ffffff7f
	stda	%f20,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000 ffffffab
!	Mem[00000000100c1424] = 000000ff, %l7 = ff000000, %l5 = 00000000
	add	%i3,0x24,%g1
	casa	[%g1]0x80,%l7,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141408] = 00004473, %l0 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	%f16 = 3cbd696f 7fffffff 00000000 ff000000
!	%f20 = 00000000 ffffffab 000000ff ff00006e
!	%f24 = 50000000 ea000000 00000000 00000000
!	%f28 = 00000000 00000000 ab2b0000 00000000
	stda	%f16,[%i0]ASI_BLK_SL	! Block Store to 0000000030001400
!	%l1 = 0000000000000069, Mem[0000000010101410] = ff0000ff
	stba	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 690000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001004141c] = 000000ff, %l7 = 00000000ff000000
	ldsw	[%i1+0x01c],%l7		! %l7 = 00000000000000ff

p0_label_367:
!	Mem[0000000010141410] = ff8ca745000000ff, %l2 = 0000000000000000
	ldxa	[%i5+%o5]0x80,%l2	! %l2 = ff8ca745000000ff
!	Mem[0000000010181408] = ffcc4108, %l7 = 00000000000000ff
	ldswa	[%i6+%o4]0x80,%l7	! %l7 = ffffffffffcc4108
	membar	#Sync			! Added by membar checker (61)
!	Mem[0000000030001400] = 3cbd696f7fffffff, %l2 = ff8ca745000000ff
	ldxa	[%i0+%g0]0x89,%l2	! %l2 = 3cbd696f7fffffff
!	Mem[0000000010101410] = 690000ff, %l6 = ffffffffffffbd3c
	ldswa	[%i4+%o5]0x80,%l6	! %l6 = 00000000690000ff
!	Mem[00000000100c1400] = 500bbc13000000ff, %f2  = 00000000 00000000
	ldda	[%i3+%g0]0x88,%f2 	! %f2  = 500bbc13 000000ff
!	Mem[0000000010081400] = 00000050, %l4 = 0000000000000000
	lduwa	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000050
!	Mem[0000000010101400] = ffffffab, %l2 = 3cbd696f7fffffff
	ldsha	[%i4+%g0]0x88,%l2	! %l2 = ffffffffffffffab
!	Mem[0000000010041410] = ff000000, %l2 = ffffffffffffffab
	ldswa	[%i1+%o5]0x88,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010081408] = ff00000000000000, %f16 = 3cbd696f 7fffffff
	ldda	[%i2+%o4]0x88,%f16	! %f16 = ff000000 00000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000069, Mem[0000000010141406] = 00000000, %asi = 80
	stba	%l1,[%i5+0x006]%asi	! Mem[0000000010141404] = 00006900

p0_label_368:
!	%l1 = 0000000000000069, Mem[0000000010001400] = 00000000000000ff
	stxa	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000069
!	%f22 = 000000ff, Mem[0000000030041400] = 00000000
	sta	%f22,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff
!	%f14 = ff000000 ab2b0000, Mem[0000000030081408] = 00000000 00000000
	stda	%f14,[%i2+%o4]0x89	! Mem[0000000030081408] = ff000000 ab2b0000
!	Mem[0000000010081408] = 00000000, %l7 = ffffffffffcc4108
	swapa	[%i2+%o4]0x80,%l7	! %l7 = 0000000000000000
!	%f12 = 738ca745, Mem[00000000100c1400] = 000000ff
	sta	%f12,[%i3+%g0]0x88	! Mem[00000000100c1400] = 738ca745
!	Mem[00000000100c1410] = 00000000, %l6 = 00000000690000ff
	swapa	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010181408] = ffcc4108
	stha	%l7,[%i6+%o4]0x80	! Mem[0000000010181408] = 00004108
!	%l3 = 0000000000000000, Mem[0000000010041410] = 000000ff
	stwa	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	Mem[0000000010141408] = ff004473, %l6 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00002bab, %f3  = 000000ff
	lda	[%i5+%g0]0x88,%f3 	! %f3 = 00002bab

p0_label_369:
!	Mem[00000000300c1400] = 000000ff, %l1 = 0000000000000069
	ldswa	[%i3+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141410] = ff8ca745, %l3 = 0000000000000000
	ldswa	[%i5+%o5]0x80,%l3	! %l3 = ffffffffff8ca745
!	Mem[0000000010141408] = 734400ff, %l1 = 00000000000000ff
	ldswa	[%i5+%o4]0x88,%l1	! %l1 = 00000000734400ff
!	Mem[0000000030141408] = 00002bff, %l2 = ffffffffff000000
	lduwa	[%i5+%o4]0x89,%l2	! %l2 = 0000000000002bff
!	Mem[0000000010101410] = 690000ff, %l1 = 00000000734400ff
	ldswa	[%i4+%o5]0x80,%l1	! %l1 = 00000000690000ff
!	Mem[0000000010041400] = 690000ff, %l0 = 0000000000000000
	lduwa	[%i1+%g0]0x80,%l0	! %l0 = 00000000690000ff
!	Mem[0000000010181410] = ff000000, %l1 = 00000000690000ff
	lduha	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101430] = 00000000, %l5 = 00000000000000ff
	lduwa	[%i4+0x030]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081410] = ff000000 6f69bd00, %l2 = 00002bff, %l3 = ff8ca745
	ldda	[%i2+%o5]0x88,%l2	! %l2 = 000000006f69bd00 00000000ff000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[00000000100c1408] = 730000004a00ffff
	stxa	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000000000

p0_label_370:
!	%l3 = 00000000ff000000, Mem[0000000030181408] = 13bc0bff
	stwa	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = ff000000
!	%f5  = 4a00ffff, Mem[0000000030101410] = ff000000
	sta	%f5 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 4a00ffff
!	%l4 = 0000000000000050, Mem[0000000010141400] = 0069000000002bab
	stxa	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000000000000050
!	Mem[0000000030141400] = 4800738c, %l7 = 0000000000000000
	ldstuba	[%i5+%g0]0x89,%l7	! %l7 = 0000008c000000ff
!	Mem[0000000030141410] = 00000000, %l5 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081401] = 50000000, %l3 = 00000000ff000000
	ldstub	[%i2+0x001],%l3		! %l3 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[00000000100c1408] = 00000000
	stba	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	%f4  = 13bc0b50 4a00ffff, %l0 = 00000000690000ff
!	Mem[0000000030141438] = 0000000000000048
	add	%i5,0x038,%g1
	stda	%f4,[%g1+%l0]ASI_PST8_S ! Mem[0000000030141438] = 13bc0b504a00ffff
!	%f9  = 00000000, Mem[0000000010101400] = abffffff
	sta	%f9 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 5000000000000000, %f10 = 0073006e 0000006e
	ldda	[%i5+%g0]0x80,%f10	! %f10 = 50000000 00000000

p0_label_371:
!	Mem[0000000030141400] = ff73004800000000, %l4 = 0000000000000050
	ldxa	[%i5+%g0]0x81,%l4	! %l4 = ff73004800000000
!	Mem[0000000010041408] = 0000000000000000, %f12 = 738ca745 b7ff0000
	ldd	[%i1+%o4],%f12		! %f12 = 00000000 00000000
!	Mem[0000000010101408] = ff000000, %f0  = 00000000
	lda	[%i4+%o4]0x80,%f0 	! %f0 = ff000000
!	Mem[0000000030181410] = 00000000, %l6 = 00000000000000ff
	ldsba	[%i6+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000020800000] = ffffca09, %l1 = 0000000000000000
	lduha	[%o1+0x000]%asi,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010181420] = 00000000, %l5 = 0000000000000000
	ldub	[%i6+0x022],%l5		! %l5 = 0000000000000000
!	Mem[0000000030041400] = ff000000, %f1  = 00000000
	lda	[%i1+%g0]0x89,%f1 	! %f1 = ff000000
!	Mem[0000000030101410] = 00000000 ffff004a, %l0 = 690000ff, %l1 = 0000ffff
	ldda	[%i4+%o5]0x89,%l0	! %l0 = 00000000ffff004a 0000000000000000
!	Mem[0000000010141410] = 45a78cff, %l1 = 0000000000000000
	ldsba	[%i5+%o5]0x88,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 00000000, %l1 = ffffffffffffffff
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 0000000000000000

p0_label_372:
!	Mem[0000000010101410] = ff000069, %l2 = 000000006f69bd00
	swapa	[%i4+%o5]0x88,%l2	! %l2 = 00000000ff000069
!	%l6 = 0000000000000000, Mem[00000000100c1408] = 0000000000000000
	stxa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000000000000000
!	Mem[0000000010181410] = 000000ff, %l3 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	%l4 = ff73004800000000, Mem[0000000030001400] = 7fffffff
	stha	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 7fff0000
!	%f8  = 000000ff 00000000, Mem[00000000300c1410] = 00000000 00000000
	stda	%f8 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000ff 00000000
!	%l5 = 0000000000000000, Mem[00000000211c0000] = 006f1327, %asi = 80
	stha	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00001327
!	Mem[0000000010081400] = 50ff0000, %l3 = 00000000000000ff
	ldstuba	[%i2+%g0]0x80,%l3	! %l3 = 00000050000000ff
!	%f8  = 000000ff 00000000, %l6 = 0000000000000000
!	Mem[0000000030141420] = ff0000ff50ff0000
	add	%i5,0x020,%g1
	stda	%f8,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030141420] = ff0000ff50ff0000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030081410] = 00000000 ffff004a
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001434] = 000000ff, %l6 = 0000000000000000
	lduw	[%i0+0x034],%l6		! %l6 = 00000000000000ff

p0_label_373:
!	Mem[000000001010141c] = ffff004a, %l0 = 00000000ffff004a
	ldsw	[%i4+0x01c],%l0		! %l0 = ffffffffffff004a
!	Mem[00000000218000c0] = b0fff483, %l7 = 000000000000008c
	ldsb	[%o3+0x0c1],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010101400] = 00000000, %l2 = 00000000ff000069
	ldswa	[%i4+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = 00000069, %l0 = ffffffffffff004a
	lduwa	[%i0+0x008]%asi,%l0	! %l0 = 0000000000000069
!	Mem[0000000010001420] = 0000ff50 64c6b119, %l6 = 000000ff, %l7 = ffffffff
	ldda	[%i0+0x020]%asi,%l6	! %l6 = 000000000000ff50 0000000064c6b119
!	Mem[0000000010041410] = 00000000, %l1 = 0000000000000000
	lduwa	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[000000001010141c] = ffff004a, %l6 = 000000000000ff50
	ldsha	[%i4+0x01c]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101408] = 000000ff, %f7  = ff000000
	lda	[%i4+%o4]0x88,%f7 	! %f7 = 000000ff
!	Mem[0000000010181408] = 08410000, %l0 = 0000000000000069
	ldsba	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000050, Mem[00000000300c1400] = ff0000007fffffff
	stxa	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000000000050

p0_label_374:
!	%l1 = 0000000000000000, Mem[0000000030081410] = 00000000
	stba	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	%l7 = 0000000064c6b119, Mem[0000000030181410] = 00000000
	stwa	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 64c6b119
!	%l2 = 00000000, %l3 = 00000050, Mem[0000000030001400] = 7fff0000 3cbd696f
	stda	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 00000050
!	Mem[0000000010141432] = 00ff0000, %l4 = ff73004800000000
	ldstuba	[%i5+0x032]%asi,%l4	! %l4 = 00000000000000ff
!	%l7 = 0000000064c6b119, Mem[0000000030041410] = ff00447373440000
	stxa	%l7,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000000064c6b119
!	Mem[0000000020800040] = ffff095a, %l5 = 0000000000000000
	ldstuba	[%o1+0x040]%asi,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000100c1400] = 45a78c73, %l4 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l4	! %l4 = 0000000045a78c73
!	%f18 = 00000000 ff000000, Mem[0000000030041408] = 69bd696f 00000000
	stda	%f18,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000 ff000000
!	Mem[0000000030141400] = ff730048, %l2 = 0000000000000000
	swapa	[%i5+%g0]0x81,%l2	! %l2 = 00000000ff730048
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 00000050 00000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000 0000000000000050

p0_label_375:
!	Mem[0000000030001400] = 00000000, %l7 = 0000000064c6b119
	ldswa	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = 4a00ffff, %l4 = 0000000045a78c73
	ldswa	[%i4+%o5]0x81,%l4	! %l4 = 000000004a00ffff
!	Mem[0000000010081408] = 0841ccff, %l5 = 00000000000000ff
	ldsha	[%i2+%o4]0x88,%l5	! %l5 = ffffffffffffccff
!	Mem[00000000300c1400] = 0000000000000050, %f28 = 00000000 00000000
	ldda	[%i3+%g0]0x81,%f28	! %f28 = 00000000 00000050
!	Mem[00000000100c1408] = 00000000, %f24 = 50000000
	lda	[%i3+%o4]0x88,%f24	! %f24 = 00000000
!	Mem[0000000010141410] = 45a78cff, %l7 = 0000000000000000
	ldsha	[%i5+%o5]0x88,%l7	! %l7 = ffffffffffff8cff
!	Mem[00000000300c1400] = 00000000, %l1 = 0000000000000050
	lduba	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l4 = 000000004a00ffff
	lduha	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081418] = 0000000048007246, %f30 = ab2b0000 00000000
	ldd	[%i2+0x018],%f30	! %f30 = 00000000 48007246
!	Starting 10 instruction Store Burst
!	Mem[000000001018140c] = 64c6b119, %l1 = 0000000000000000
	ldstub	[%i6+0x00c],%l1		! %l1 = 00000064000000ff

p0_label_376:
!	%l6 = ffffffffffffffff, Mem[0000000010181410] = 00000000
	stba	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff
!	Mem[00000000300c1400] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i3+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000030101400] = 00000000
	stba	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	Mem[0000000010181400] = ff000000, %l2 = 00000000ff730048
	ldstuba	[%i6+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	%l7 = ffffffffffff8cff, Mem[0000000010041400] = 690000ff
	stha	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 8cff00ff
!	Mem[00000000218001c1] = 0000bc74, %l1 = 0000000000000064
	ldstuba	[%o3+0x1c1]%asi,%l1	! %l1 = 00000000000000ff
!	%f10 = 50000000 00000000, %l1 = 0000000000000000
!	Mem[0000000030001428] = 0000000000000000
	add	%i0,0x028,%g1
	stda	%f10,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030001428] = 0000000000000000
!	%l6 = ffffffffffffffff, Mem[000000001010140e] = 00000000
	sth	%l6,[%i4+0x00e]		! Mem[000000001010140c] = 0000ffff
!	%l2 = 00000000000000ff, Mem[0000000030101408] = 000000ff
	stwa	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001010143c] = b7ff0000, %f15 = ab2b0000
	lda	[%i4+0x03c]%asi,%f15	! %f15 = b7ff0000

p0_label_377:
!	Mem[00000000300c1410] = 00000000, %l7 = ffffffffffff8cff
	lduwa	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101430] = 00000000, %l4 = 0000000000000000
	ldswa	[%i4+0x030]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001410] = ffffffab, %l2 = 00000000000000ff
	ldsba	[%i0+%o5]0x89,%l2	! %l2 = ffffffffffffffab
!	Mem[00000000211c0000] = 00001327, %l1 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = 00000069, %f7  = 000000ff
	lda	[%i0+%g0]0x88,%f7 	! %f7 = 00000069
!	Mem[0000000010001400] = 00000069, %l4 = 0000000000000000
	ldsha	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000069
!	Mem[0000000030081408] = ff000000ab2b0000, %l7 = 0000000000000000
	ldxa	[%i2+%o4]0x89,%l7	! %l7 = ff000000ab2b0000
!	Mem[00000000211c0000] = 00001327, %l0 = 0000000000000000
	ldsb	[%o2+0x001],%l0		! %l0 = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l4 = 0000000000000069
	ldsha	[%i5+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f27 = 00000000, Mem[0000000010101400] = 00000000
	sta	%f27,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000

p0_label_378:
!	Mem[0000000020800000] = ffffca09, %l6 = ffffffffffffffff
	ldstub	[%o1+%g0],%l6		! %l6 = 000000ff000000ff
!	%l1 = 0000000000000000, Mem[0000000030001400] = 00000000
	stwa	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010141400] = 50000000 00000000
	stda	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000 00000000
!	%l7 = ff000000ab2b0000, Mem[00000000300c1400] = 000000ff
	stha	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	Mem[0000000010101430] = 00000000, %l6 = 00000000000000ff, %asi = 80
	swapa	[%i4+0x030]%asi,%l6	! %l6 = 0000000000000000
!	%l5 = ffffffffffffccff, Mem[0000000010001400] = 00000069
	stwa	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffccff
!	%l3 = 0000000000000050, Mem[0000000010181402] = ff000000
	sth	%l3,[%i6+0x002]		! Mem[0000000010181400] = ff000050
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010041408] = 00000000 00000000
	stda	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000 00000000
!	%l0 = 0000000000000000, Mem[0000000030041410] = 19b1c664
	stba	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 00b1c664
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 0000000064c6b100, %l1 = 0000000000000000
	ldxa	[%i1+%o5]0x89,%l1	! %l1 = 0000000064c6b100

p0_label_379:
!	Mem[0000000030101400] = 00000000 00000000, %l4 = 00000000, %l5 = ffffccff
	ldda	[%i4+%g0]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l5 = 0000000000000000
	lduwa	[%i3+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101408] = ff000000, %l5 = 0000000000000000
	ldsba	[%i4+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010181410] = ff000000ff310000, %f26 = 00000000 00000000
	ldda	[%i6+%o5]0x80,%f26	! %f26 = ff000000 ff310000
!	Mem[0000000030101408] = 00000000000000ff, %l4 = 0000000000000000
	ldxa	[%i4+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041400] = ff00ff8c, %l7 = ff000000ab2b0000
	lduwa	[%i1+%g0]0x88,%l7	! %l7 = 00000000ff00ff8c
!	Mem[00000000300c1410] = 00000000, %l6 = 0000000000000000
	lduwa	[%i3+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081418] = 00000000, %l3 = 0000000000000050
	ldsw	[%i2+0x018],%l3		! %l3 = 0000000000000000
!	Mem[0000000010081408] = 0841ccff, %l2 = ffffffffffffffab
	ldswa	[%i2+%o4]0x88,%l2	! %l2 = 000000000841ccff
!	Starting 10 instruction Store Burst
!	%l2 = 000000000841ccff, Mem[0000000030141400] = 0000000000000000
	stxa	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000000841ccff

p0_label_380:
!	%l2 = 0841ccff, %l3 = 00000000, Mem[0000000010001408] = 69000000 ff00ffff
	stda	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 0841ccff 00000000
!	Mem[0000000030041408] = ff000000, %l3 = 0000000000000000
	swapa	[%i1+%o4]0x89,%l3	! %l3 = 00000000ff000000
!	%l2 = 000000000841ccff, Mem[00000000100c1410] = 000031ff690000ff
	stxa	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000000841ccff
!	Mem[0000000010081408] = 0841ccff, %l7 = 00000000ff00ff8c
	swapa	[%i2+%o4]0x88,%l7	! %l7 = 000000000841ccff
!	Mem[0000000010001408] = ffcc4108, %l6 = 0000000000000000
	ldstuba	[%i0+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	%l0 = 00000000, %l1 = 64c6b100, Mem[0000000010001408] = ffcc4108 00000000
	stda	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000 64c6b100
!	%l6 = 00000000000000ff, Mem[0000000030001408] = 000000ff00000000
	stxa	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000000000ff
!	%l2 = 0841ccff, %l3 = ff000000, Mem[0000000010001410] = ffffffff 00000000
	stda	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 0841ccff ff000000
!	Mem[00000000100c142a] = 3cbd696f, %l1 = 0000000064c6b100
	ldstub	[%i3+0x02a],%l1		! %l1 = 00000069000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 19b1c664, %l7 = 000000000841ccff
	lduha	[%i6+%o5]0x81,%l7	! %l7 = 00000000000019b1

p0_label_381:
!	Mem[0000000010081424] = ffff004a, %l6 = 00000000000000ff
	ldsba	[%i2+0x025]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181410] = 000031ff000000ff, %l7 = 00000000000019b1
	ldxa	[%i6+%o5]0x88,%l7	! %l7 = 000031ff000000ff
!	Mem[00000000300c1410] = 00000000, %f28 = 00000000
	lda	[%i3+%o5]0x89,%f28	! %f28 = 00000000
!	Mem[0000000030141400] = ffcc410800000000, %l2 = 000000000841ccff
	ldxa	[%i5+%g0]0x81,%l2	! %l2 = ffcc410800000000
!	Mem[0000000010041408] = 00000000, %l2 = ffcc410800000000
	ldsha	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000020800000] = ffffca09, %l3 = 00000000ff000000
	ldsb	[%o1+%g0],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010041410] = 00000000, %l6 = ffffffffffffffff
	ldsba	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1410] = 00000000ff000000, %l1 = 0000000000000069
	ldxa	[%i3+%o5]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[00000000300c1410] = 000000ff00000000, %f22 = 000000ff ff00006e
	ldda	[%i3+%o5]0x89,%f22	! %f22 = 000000ff 00000000
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = ff137e52, %l7 = 000031ff000000ff
	ldstuba	[%o0+0x001]%asi,%l7	! %l7 = 00000013000000ff

p0_label_382:
!	%l1 = 00000000ff000000, Mem[0000000030081400] = 00000069
	stha	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000069
!	%l2 = 0000000000000000, Mem[0000000030001408] = 00000000
	stwa	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	Mem[0000000030081408] = 00002bab, %l5 = ffffffffffffffff
	ldstuba	[%i2+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1410] = 00000000, %l2 = 0000000000000000
	swapa	[%i3+%o5]0x81,%l2	! %l2 = 0000000000000000
!	%l3 = ffffffffffffffff, Mem[0000000030041400] = 000000ff00000000
	stxa	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffffffffffffff
!	%f26 = ff000000 ff310000, Mem[00000000300c1408] = 00000000 00000000
	stda	%f26,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff000000 ff310000
!	Mem[000000001000142d] = 002b00ff, %l3 = ffffffffffffffff
	ldstub	[%i0+0x02d],%l3		! %l3 = 0000002b000000ff
!	%l2 = 0000000000000000, Mem[00000000100c1408] = 00000000
	stha	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	%l2 = 00000000, %l3 = 0000002b, Mem[0000000010081400] = ffff0000 ea000000
	stda	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000 0000002b
!	Starting 10 instruction Load Burst
!	Mem[0000000010081428] = 00000000 00004a00, %l2 = 00000000, %l3 = 0000002b
	ldda	[%i2+0x028]%asi,%l2	! %l2 = 0000000000000000 0000000000004a00

p0_label_383:
!	Mem[0000000020800000] = ffffca09, %l1 = 00000000ff000000
	ldsh	[%o1+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010041410] = 00000000, %f4  = 13bc0b50
	lda	[%i1+%o5]0x88,%f4 	! %f4 = 00000000
!	Mem[0000000030181400] = 00000000 6f6900ff, %l2 = 00000000, %l3 = 00004a00
	ldda	[%i6+%g0]0x89,%l2	! %l2 = 000000006f6900ff 0000000000000000
!	Mem[0000000030001408] = 00000000, %l2 = 000000006f6900ff
	lduwa	[%i0+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181400] = ff00696f, %l3 = 0000000000000000
	ldsba	[%i6+%g0]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041400] = ff00ff8c, %l0 = 0000000000000000
	lduwa	[%i1+%g0]0x88,%l0	! %l0 = 00000000ff00ff8c
!	Mem[0000000010181400] = ff000050, %f21 = ffffffab
	lda	[%i6+%g0]0x80,%f21	! %f21 = ff000050
!	Mem[0000000030001408] = 00000000, %l5 = 0000000000000000
	ldsha	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000021800100] = 00008c1a, %l0 = 00000000ff00ff8c
	ldsh	[%o3+0x100],%l0		! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010041410] = 00000000
	stha	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000

p0_label_384:
!	%l6 = 0000000000000000, Mem[0000000030041408] = 0000000000000000
	stxa	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l2 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l2	! %l2 = 0000000000000000
!	%f12 = 00000000, Mem[0000000030041410] = 00b1c664
	sta	%f12,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	%l2 = 0000000000000000, Mem[00000000100c1400] = 00000000
	stha	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	%f23 = 00000000, Mem[00000000100c1400] = 00000000
	sta	%f23,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	Mem[0000000010141429] = 0073006e, %l4 = 00000000000000ff
	ldstub	[%i5+0x029],%l4		! %l4 = 00000073000000ff
!	Mem[0000000030041410] = 00000000, %l4 = 0000000000000073
	ldsba	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[000000001000143c] = 00350000, %l7 = 0000000000000013
	swap	[%i0+0x03c],%l7		! %l7 = 0000000000350000
!	Mem[0000000030101408] = ff000000, %l7 = 0000000000350000
	ldstuba	[%i4+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ff00696f, %l5 = 0000000000000000
	lduwa	[%i6+%g0]0x81,%l5	! %l5 = 00000000ff00696f

p0_label_385:
!	Mem[0000000030081408] = ff000000ab2b00ff, %l4 = 0000000000000000
	ldxa	[%i2+%o4]0x89,%l4	! %l4 = ff000000ab2b00ff
!	Mem[0000000030181410] = 19b1c664, %l2 = 0000000000000000
	lduba	[%i6+%o5]0x81,%l2	! %l2 = 0000000000000019
!	Mem[0000000010101400] = 0000000000000000, %l4 = ff000000ab2b00ff
	ldxa	[%i4+%g0]0x88,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (62)
!	Mem[0000000030041400] = ffffffff ffffffff 00000000 00000000
!	Mem[0000000030041410] = 00000000 00000000 6e0000ff 6f69bd3c
!	Mem[0000000030041420] = 00000000 00000000 500bbc13 ff310000
!	Mem[0000000030041430] = 3cbd696f ff00006e ff000000 00000000
	ldda	[%i1]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030041400
!	Mem[0000000010001400] = ffccffff, %l3 = ffffffffffffffff
	ldswa	[%i0+%g0]0x80,%l3	! %l3 = ffffffffffccffff
!	Mem[0000000010141400] = 00000000, %l6 = 0000000000000000
	ldsha	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000021800100] = 00008c1a, %l3 = ffffffffffccffff
	lduha	[%o3+0x100]%asi,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = 00000000 00000050, %l4 = 00000000, %l5 = ff00696f
	ldda	[%i3+%g0]0x81,%l4	! %l4 = 0000000000000000 0000000000000050
!	Mem[0000000010041400] = ff00ff8c, %l3 = 0000000000000000
	ldswa	[%i1+%g0]0x88,%l3	! %l3 = ffffffffff00ff8c
!	Starting 10 instruction Store Burst
!	%f10 = 50000000 00000000, Mem[0000000010001410] = 0841ccff ff000000
	stda	%f10,[%i0+%o5]0x88	! Mem[0000000010001410] = 50000000 00000000

p0_label_386:
!	%l1 = ffffffffffffffff, Mem[00000000201c0000] = ffff7e52
	stb	%l1,[%o0+%g0]		! Mem[00000000201c0000] = ffff7e52
!	%l3 = ffffffffff00ff8c, Mem[0000000030101408] = ff000000
	stha	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = ff8c0000
!	Mem[0000000030101408] = 00008cff, %l1 = ffffffffffffffff
	ldstuba	[%i4+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	%l7 = 00000000000000ff, Mem[0000000010141400] = 00000000
	stba	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff
!	Mem[0000000030001408] = 00000000, %l2 = 0000000000000019
	ldstuba	[%i0+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1410] = ffcc410800000000, %l3 = ffffffffff00ff8c, %l1 = 00000000000000ff
	add	%i3,0x10,%g1
	casxa	[%g1]0x80,%l3,%l1	! %l1 = ffcc410800000000
!	Mem[00000000300c1408] = ff310000, %l6 = 0000000000000000
	ldstuba	[%i3+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000010141400] = 000000ff
	stba	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	Mem[0000000010041420] = 6e0000ff517e575f, %l1 = ffcc410800000000, %l2 = 0000000000000000
	add	%i1,0x20,%g1
	casxa	[%g1]0x80,%l1,%l2	! %l2 = 6e0000ff517e575f
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 000000ff, %l1 = ffcc410800000000
	ldsba	[%i6+%o5]0x88,%l1	! %l1 = ffffffffffffffff

p0_label_387:
!	Mem[00000000300c1410] = 00000000, %l1 = ffffffffffffffff
	ldswa	[%i3+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = ff00ff8c, %l6 = 0000000000000000
	ldsha	[%i2+%o4]0x88,%l6	! %l6 = ffffffffffffff8c
!	Mem[0000000010181400] = 500000ff, %l1 = 0000000000000000
	ldsba	[%i6+%g0]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001430] = 000000ff, %f5  = 4a00ffff
	ld	[%i0+0x030],%f5 	! %f5 = 000000ff
!	Mem[0000000010101430] = 000000ff00000000, %l0 = 0000000000000000
	ldxa	[%i4+0x030]%asi,%l0	! %l0 = 000000ff00000000
!	Mem[0000000010101400] = 00000000, %l7 = 00000000000000ff
	ldswa	[%i4+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141404] = 00000000, %l7 = 0000000000000000
	ldsh	[%i5+0x004],%l7		! %l7 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l6 = ffffffffffffff8c
	lduba	[%i0+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l4 = 0000000000000000
	lduha	[%i0+0x008]%asi,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000030001408] = ff000000
	stha	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000

p0_label_388:
!	%l2 = 6e0000ff517e575f, Mem[0000000030081400] = 69000000
	stba	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 6900005f
!	%l2 = 6e0000ff517e575f, Mem[000000001018141e] = 00000000, %asi = 80
	stba	%l2,[%i6+0x01e]%asi	! Mem[000000001018141c] = 00005f00
!	Mem[00000000100c142c] = 000031ff, %l3 = ffffffffff00ff8c
	ldstub	[%i3+0x02c],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010081400] = 00000000, %l2 = 6e0000ff517e575f
	ldstuba	[%i2+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%f12 = 00000000 00000000, Mem[0000000030141410] = 00000000 00000000
	stda	%f12,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000 00000000
!	Mem[0000000010001420] = 0000ff50, %l7 = 0000000000000000
	swap	[%i0+0x020],%l7		! %l7 = 000000000000ff50
!	Mem[00000000201c0001] = ffff7e52, %l6 = 0000000000000000
	ldstub	[%o0+0x001],%l6		! %l6 = 000000ff000000ff
!	%l2 = 0000000000000000, Mem[0000000010001418] = 00000069
	sth	%l2,[%i0+0x018]		! Mem[0000000010001418] = 00000069
!	%f8  = 000000ff 00000000, Mem[00000000100c1400] = 00000000 13bc0b50
	stda	%f8 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff 00000000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (63)
!	Mem[0000000010181400] = ff000050 00000000 00004108 ffc6b119
!	Mem[0000000010181410] = ff000000 ff310000 00000000 00005f00
!	Mem[0000000010181420] = 00000000 7fffffff 0000ffad ff0000ea
!	Mem[0000000010181430] = 00000000 abff4cce 00000000 ffac2efd
	ldda	[%i6]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010181400

p0_label_389:
!	Mem[0000000030001410] = abffffff, %f13 = 00000000
	lda	[%i0+%o5]0x81,%f13	! %f13 = abffffff
!	Mem[0000000010041408] = 00000000, %l7 = 000000000000ff50
	lduha	[%i1+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081410] = 6f69bd00, %l4 = 0000000000000000
	lduba	[%i2+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1408] = ff0031ff, %l0 = 000000ff00000000
	lduba	[%i3+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	%f10 = 50000000, %f10 = 50000000, %f7  = 00000069
	fadds	%f10,%f10,%f7 		! %f7  = 50800000
!	Mem[0000000030001408] = 00000000, %l0 = 00000000000000ff
	lduba	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041400] = ffffffff, %f12 = 00000000
	lda	[%i1+%g0]0x81,%f12	! %f12 = ffffffff
!	Mem[0000000010101428] = 7fffffff 45a78c73, %l0 = 00000000, %l1 = ffffffff
	ldd	[%i4+0x028],%l0		! %l0 = 000000007fffffff 0000000045a78c73
!	Mem[0000000010101410] = 6f69bd00, %l2 = 0000000000000000
	lduwa	[%i4+%o5]0x88,%l2	! %l2 = 000000006f69bd00
!	Starting 10 instruction Store Burst
!	%f4  = 00000000 000000ff, Mem[0000000030041408] = 00000000 00000000
	stda	%f4 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000 000000ff

p0_label_390:
!	Mem[0000000010041410] = 00000000, %l7 = 0000000000000000
	swap	[%i1+%o5],%l7		! %l7 = 0000000000000000
!	%l5 = 0000000000000050, Mem[0000000030141410] = 0000000000000000
	stxa	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000000000000050
!	%l6 = 000000ff, %l7 = 00000000, Mem[00000000300c1408] = ff3100ff ff000000
	stda	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff 00000000
!	%l3 = 0000000000000000, Mem[0000000030041408] = ff000000
	stwa	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	Mem[0000000010141434] = 5f8fff8e, %l1 = 0000000045a78c73
	swap	[%i5+0x034],%l1		! %l1 = 000000005f8fff8e
	membar	#Sync			! Added by membar checker (64)
!	%f14 = ff000000, Mem[000000001018142c] = ff0000ea
	st	%f14,[%i6+0x02c]	! Mem[000000001018142c] = ff000000
!	%f4  = 00000000 000000ff, Mem[0000000030101408] = ff8c0000 00000000
	stda	%f4 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 000000ff
!	Mem[0000000030081400] = 6900005f, %l6 = 00000000000000ff
	ldstuba	[%i2+%g0]0x89,%l6	! %l6 = 0000005f000000ff
!	Mem[0000000010181400] = ff000050, %l4 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l4	! %l4 = 00000000ff000050
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00000000, %l1 = 000000005f8fff8e
	lduha	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000

p0_label_391:
!	Mem[0000000010101410] = 6f69bd00, %l0 = 000000007fffffff
	lduwa	[%i4+%o5]0x88,%l0	! %l0 = 000000006f69bd00
!	Mem[0000000010141400] = 00000000, %l0 = 000000006f69bd00
	lduwa	[%i5+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041400] = ff00ff8c, %l6 = 000000000000005f
	lduha	[%i1+%g0]0x88,%l6	! %l6 = 000000000000ff8c
!	Mem[00000000100c1408] = 00000000, %l3 = 0000000000000000
	ldswa	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141400] = 0841ccff, %l1 = 0000000000000000
	lduha	[%i5+%g0]0x89,%l1	! %l1 = 000000000000ccff
!	Mem[0000000030141410] = 00000000, %l3 = 0000000000000000
	lduwa	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l2 = 000000006f69bd00
	lduha	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181400] = ff00696f, %l2 = 0000000000000000
	lduba	[%i6+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101408] = 00000000, %l0 = 0000000000000000
	ldsba	[%i4+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = ffff7e52, %l7 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l7	! %l7 = 000000ff000000ff

p0_label_392:
!	%l7 = 00000000000000ff, Mem[0000000010181400] = 00000000
	stha	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff
!	Mem[0000000010001410] = 00000000, %l6 = 000000000000ff8c
	ldstuba	[%i0+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081400] = 690000ff, %l3 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l3	! %l3 = 00000000690000ff
!	%f12 = ffffffff abffffff, Mem[0000000030041410] = 00000000 00000000
	stda	%f12,[%i1+%o5]0x89	! Mem[0000000030041410] = ffffffff abffffff
!	%l0 = 0000000000000000, Mem[0000000030181410] = 19b1c664
	stba	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 00b1c664
!	%f8  = 000000ff 00000000, %l1 = 000000000000ccff
!	Mem[0000000010041408] = 0000000000000000
	add	%i1,0x008,%g1
	stda	%f8,[%g1+%l1]ASI_PST32_P ! Mem[0000000010041408] = 000000ff00000000
!	%l6 = 0000000000000000, Mem[0000000010141400] = 00000000
	stwa	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	Mem[0000000010141438] = 00000000000000ff, %l0 = 0000000000000000, %l2 = 00000000000000ff
	add	%i5,0x38,%g1
	casxa	[%g1]0x80,%l0,%l2	! %l2 = 00000000000000ff
!	%f10 = 50000000 00000000, Mem[0000000010081438] = ff000000 ffffffab
	stda	%f10,[%i2+0x038]%asi	! Mem[0000000010081438] = 50000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00004108, %l6 = 0000000000000000
	lduwa	[%i6+%o4]0x80,%l6	! %l6 = 0000000000004108

p0_label_393:
!	Mem[0000000010101408] = 000000ff, %l2 = 00000000000000ff
	ldswa	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000201c0000] = ffff7e52, %l3 = 00000000690000ff
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030101410] = ffff004a, %l4 = 00000000ff000050
	lduba	[%i4+%o5]0x89,%l4	! %l4 = 000000000000004a
!	Mem[0000000010041410] = 00000000, %l1 = 000000000000ccff
	ldswa	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181410] = 64c6b100, %l4 = 000000000000004a
	lduwa	[%i6+%o5]0x89,%l4	! %l4 = 0000000064c6b100
!	Mem[0000000010041410] = 00000000000000ff, %l6 = 0000000000004108
	ldxa	[%i1+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001408] = 00000000, %l2 = 00000000000000ff
	lduha	[%i0+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l7 = 00000000000000ff
	ldsba	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141408] = ff000000 734400ff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i5+%o4]0x88,%l0	! %l0 = 00000000734400ff 00000000ff000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000734400ff, Mem[0000000010041434] = ffffffff, %asi = 80
	stwa	%l0,[%i1+0x034]%asi	! Mem[0000000010041434] = 734400ff

p0_label_394:
!	%f29 = 00000000, Mem[00000000100c1404] = 00000000
	sta	%f29,[%i3+0x004]%asi	! Mem[00000000100c1404] = 00000000
!	%l0 = 734400ff, %l1 = ff000000, Mem[0000000010101408] = 000000ff ffff0000
	stda	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 734400ff ff000000
!	%f19 = 08410000, Mem[0000000030101400] = 00000000
	sta	%f19,[%i4+%g0]0x89	! Mem[0000000030101400] = 08410000
!	Mem[0000000010041415] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i1+0x015]%asi,%l2	! %l2 = 00000000000000ff
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000010101408] = 734400ff ff000000
	stda	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000ff 00000000
!	%l0 = 00000000734400ff, Mem[0000000020800000] = ffffca09
	sth	%l0,[%o1+%g0]		! Mem[0000000020800000] = 00ffca09
!	Mem[0000000010101400] = 00000000, %l2 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = ffffffab, %l0 = 00000000734400ff
	swapa	[%i0+%o5]0x89,%l0	! %l0 = 00000000ffffffab
!	Mem[0000000030001408] = 00000000, %l5 = 0000000000000050
	swapa	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 000000ff, %l5 = 0000000000000000
	lduha	[%i2+%g0]0x88,%l5	! %l5 = 00000000000000ff

p0_label_395:
!	Mem[0000000030141410] = 00000000, %l0 = 00000000ffffffab
	lduba	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = 64c6b100, %l2 = 0000000000000000
	lduha	[%i6+%o5]0x89,%l2	! %l2 = 000000000000b100
!	Mem[0000000010181408] = 00004108, %l7 = 0000000000000000
	ldsba	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800040] = ffff095a, %l5 = 00000000000000ff
	lduba	[%o1+0x041]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[00000000201c0000] = ffff7e52, %l5 = 00000000000000ff
	lduh	[%o0+%g0],%l5		! %l5 = 000000000000ffff
!	Mem[0000000030041410] = ffffffab, %l0 = 0000000000000000
	lduwa	[%i1+%o5]0x81,%l0	! %l0 = 00000000ffffffab
!	Mem[0000000010001400] = 00000000ffffccff, %l4 = 0000000064c6b100
	ldxa	[%i0+%g0]0x88,%l4	! %l4 = 00000000ffffccff
!	Mem[00000000300c1408] = 000000ff, %l4 = 00000000ffffccff
	ldsha	[%i3+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181410] = 000000ff, %l7 = 0000000000000000
	lduwa	[%i6+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000ffff, Mem[0000000030101410] = 4a00ffff
	stha	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffffff

p0_label_396:
!	Mem[0000000030181400] = 6f6900ff, %l6 = 00000000000000ff
	swapa	[%i6+%g0]0x89,%l6	! %l6 = 000000006f6900ff
!	%l1 = 00000000ff000000, Mem[0000000030041408] = 00000000
	stwa	%l1,[%i1+%o4]0x89	! Mem[0000000030041408] = ff000000
!	%l2 = 0000b100, %l3 = ffffffff, Mem[0000000010181408] = 08410000 19b1c6ff
	stda	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000b100 ffffffff
!	%f21 = 000000ff, Mem[0000000010041410] = 00000000
	sta	%f21,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000ff
!	%f6  = 00000000, Mem[00000000100c1438] = 500b0000
	st	%f6 ,[%i3+0x038]	! Mem[00000000100c1438] = 00000000
!	%l4 = 00000000000000ff, Mem[0000000030081408] = ff000000ab2b00ff
	stxa	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000000000ff
!	%f19 = 08410000, Mem[0000000010181400] = 000000ff
	sta	%f19,[%i6+%g0]0x88	! Mem[0000000010181400] = 08410000
!	%f2  = 500bbc13, Mem[0000000030141408] = 00002bff
	sta	%f2 ,[%i5+%o4]0x89	! Mem[0000000030141408] = 500bbc13
!	%f0  = ff000000 ff000000, Mem[0000000030041408] = 000000ff 00000000
	stda	%f0 ,[%i1+%o4]0x81	! Mem[0000000030041408] = ff000000 ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff000000, %l4 = 00000000000000ff
	ldsba	[%i4+%o4]0x80,%l4	! %l4 = ffffffffffffffff

p0_label_397:
!	Mem[0000000010101424] = ffff004a, %f8  = 000000ff
	lda	[%i4+0x024]%asi,%f8 	! %f8 = ffff004a
!	Mem[00000000100c1408] = 00000000, %l4 = ffffffffffffffff
	lduwa	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c141c] = ff310000, %l6 = 000000006f6900ff
	lduha	[%i3+0x01e]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181408] = ff000000, %l4 = 0000000000000000
	lduwa	[%i6+%o4]0x89,%l4	! %l4 = 00000000ff000000
!	Mem[00000000100c1410] = 0841ccff, %f18 = 19b1c6ff
	lda	[%i3+%o5]0x88,%f18	! %f18 = 0841ccff
!	Mem[0000000010101400] = 0000000000000000, %l2 = 000000000000b100
	ldxa	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000218001c0] = 00ffbc74, %l2 = 0000000000000000
	ldsba	[%o3+0x1c1]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010081400] = 000000ff, %l1 = 00000000ff000000
	lduba	[%i2+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101410] = ffffffff 00000000, %l0 = ffffffab, %l1 = 000000ff
	ldda	[%i4+%o5]0x81,%l0	! %l0 = 00000000ffffffff 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l6	! %l6 = 00000000000000ff

p0_label_398:
!	%l2 = ffffffffffffffff, Mem[0000000010101400] = 00000000
	stba	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = ff000000
!	%f14 = ff000000 b7ff0000, Mem[0000000030181410] = 64c6b100 ff000000
	stda	%f14,[%i6+%o5]0x89	! Mem[0000000030181410] = ff000000 b7ff0000
!	Mem[0000000010181410] = 000000ff, %l5 = 000000000000ffff
	ldstuba	[%i6+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030141400] = 0841ccff, %l4 = 00000000ff000000
	ldstuba	[%i5+%g0]0x89,%l4	! %l4 = 000000ff000000ff
!	%l2 = ffffffffffffffff, Mem[0000000020800040] = ffff095a
	stb	%l2,[%o1+0x040]		! Mem[0000000020800040] = ffff095a
!	Mem[0000000010041434] = 734400ff, %l0 = 00000000ffffffff
	swap	[%i1+0x034],%l0		! %l0 = 00000000734400ff
!	%l7 = 00000000000000ff, Mem[0000000010041408] = 000000ff
	stha	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = 00ff00ff
!	%f23 = 00000000, Mem[0000000010181408] = 0000b100
	sta	%f23,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	%f6  = 00000000 50800000, Mem[00000000100c1410] = ffcc4108 00000000
	std	%f6 ,[%i3+%o5]	! Mem[00000000100c1410] = 00000000 50800000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ff00ff8c, %l5 = 00000000000000ff
	ldswa	[%i1+%g0]0x88,%l5	! %l5 = ffffffffff00ff8c

p0_label_399:
!	Mem[0000000030141408] = 500bbc13, %l7 = 00000000000000ff
	ldsba	[%i5+%o4]0x89,%l7	! %l7 = 0000000000000013
!	Mem[00000000100c1424] = 000000ff, %l0 = 00000000734400ff
	ldsha	[%i3+0x026]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1410] = 00000000, %l6 = 0000000000000000
	ldsba	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041400] = ff00ff8c, %l1 = 0000000000000000
	lduwa	[%i1+%g0]0x88,%l1	! %l1 = 00000000ff00ff8c
!	Mem[0000000010081410] = ff0000006f69bd00, %f14 = ff000000 b7ff0000
	ldda	[%i2+%o5]0x88,%f14	! %f14 = ff000000 6f69bd00
!	Mem[0000000030081410] = 00000000, %l6 = 0000000000000000
	lduba	[%i2+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041400] = 8cff00ffff000000, %f24 = ffffff7f 00000000
	ldda	[%i1+%g0]0x80,%f24	! %f24 = 8cff00ff ff000000
!	Mem[00000000211c0000] = 00001327, %l5 = ffffffffff00ff8c
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l0 = 00000000000000ff
	ldsba	[%i0+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[0000000030041410] = abffffff
	stwa	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff

p0_label_400:
!	%l6 = 0000000000000000, Mem[0000000010141400] = 00000000
	stba	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	Mem[0000000010101400] = ff000000, %l1 = 00000000ff00ff8c
	swapa	[%i4+%g0]0x80,%l1	! %l1 = 00000000ff000000
!	%f0  = ff000000 ff000000, %l0 = 0000000000000000
!	Mem[0000000030141410] = 0000000000000050
	add	%i5,0x010,%g1
	stda	%f0,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030141410] = 0000000000000050
!	Mem[0000000030081408] = 000000ff, %l5 = 0000000000000000
	swapa	[%i2+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101408] = 000000ff, %l7 = 0000000000000013
	swapa	[%i4+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000201c0001] = ffff7e52, %l1 = 00000000ff000000
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000300c1410] = 00000000, %l2 = ffffffffffffffff
	swapa	[%i3+%o5]0x81,%l2	! %l2 = 0000000000000000
!	%f14 = ff000000 6f69bd00, Mem[00000000100c1400] = 000000ff 00000000
	stda	%f14,[%i3+0x000]%asi	! Mem[00000000100c1400] = ff000000 6f69bd00
!	Mem[0000000010081400] = ff000000, %l3 = ffffffffffffffff
	swapa	[%i2+%g0]0x80,%l3	! %l3 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 6f69bd00, %l3 = 00000000ff000000
	lduha	[%i2+%o5]0x88,%l3	! %l3 = 000000000000bd00

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	stwa	%l4,[%i1+0x02c]%asi
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
	cmp	%l3,%g2			! %l3 should be 000000000000bd00
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x64c6b141,%g2
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
	cmp	%l0,%l1			! %f0  should be ff000000 ff000000
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 500bbc13 00002bab
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00000000 000000ff
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 00000000 50800000
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be ffff004a 00000000
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 50000000 00000000
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be ffffffff abffffff
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be ff000000 6f69bd00
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00000000 500000ff
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 0841ccff 08410000
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 000031ff 000000ff
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 005f0000 00000000
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 8cff00ff ff000000
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be ea0000ff adff0000
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be ce4cffab 00000000
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be fd2eacff 00000000
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
	fitod	%f2 ,%f2 
	fcmps	%fcc0,%f15,%f1 
	lduwa	[%i5+%o4]ASI_AS_IF_USER_PRIMARY,%l1	! Mem[0000000010141408]
	done

p0_trap1o:
	fitod	%f2 ,%f2 
	fcmps	%fcc0,%f15,%f1 
	lduwa	[%o5+%i4]ASI_AS_IF_USER_PRIMARY,%l1	! Mem[0000000010141408]
	done


p0_trap2e:
	andn	%l1,0x144,%l6
	stda	%l2,[%i0+%o4]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010001408]
	done

p0_trap2o:
	andn	%l1,0x144,%l6
	stda	%l2,[%o0+%i4]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010001408]
	done


p0_trap3e:
	xor	%l6,-0x87f,%l6
	done

p0_trap3o:
	xor	%l6,-0x87f,%l6
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
	ldx	[%g1+0x000],%l0		! %l0 = 1274e62641c67f5d
	ldx	[%g1+0x008],%l1		! %l1 = 4237e26493ecd953
	ldx	[%g1+0x010],%l2		! %l2 = 33de6c842ad92551
	ldx	[%g1+0x018],%l3		! %l3 = 0200d87005b78c51
	ldx	[%g1+0x020],%l4		! %l4 = 9acfcb259e317529
	ldx	[%g1+0x028],%l5		! %l5 = 9fcca2a63b040418
	ldx	[%g1+0x030],%l6		! %l6 = a8ac012463ded8d6
	ldx	[%g1+0x038],%l7		! %l7 = a08ef8e26bd70144

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
	fitod	%f2 ,%f2 
	fcmps	%fcc0,%f15,%f1 
	lduw	[%i5+0x028],%l3		! Mem[0000000010141428]
	jmpl	%o7,%g0
	subc	%l6,-0xd91,%l4
p0_near_0_he:
	stw	%l2,[%i0+0x004]		! Mem[0000000010001404]
	jmpl	%o7,%g0
	swap	[%i0+0x014],%l5		! Mem[0000000010001414]
near0_b2b_h:
	fdivs	%f24,%f26,%f18
	subc	%l0,%l0,%l1
	fdtos	%f20,%f27
	sub	%l4,%l7,%l3
	jmpl	%o7,%g0
	fsubs	%f31,%f26,%f25
near0_b2b_l:
	mulx	%l1,%l1,%l0
	fdtos	%f10,%f6 
	fdtoi	%f4 ,%f1 
	fitod	%f6 ,%f10
	jmpl	%o7,%g0
	fsqrts	%f0 ,%f7 
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	jmpl	%o7,%g0
	fcmps	%fcc2,%f3 ,%f14
	jmpl	%o7,%g0
	nop
p0_near_1_he:
	jmpl	%o7,%g0
	fdtos	%f26,%f25
	jmpl	%o7,%g0
	nop
near1_b2b_h:
	xnor	%l7,-0x315,%l0
	orn	%l4,%l1,%l3
	umul	%l4,%l6,%l2
	fmuls	%f30,%f25,%f29
	andn	%l4,%l2,%l5
	nop
	subc	%l5,%l5,%l6
	jmpl	%o7,%g0
	sub	%l2,-0xd23,%l1
near1_b2b_l:
	fsubs	%f0 ,%f9 ,%f9 
	orn	%l3,%l0,%l3
	fdtos	%f12,%f13
	fadds	%f10,%f15,%f8 
	orn	%l1,-0x4f0,%l5
	xor	%l0,%l7,%l4
	or	%l5,0x73c,%l5
	jmpl	%o7,%g0
	add	%l6,0x5a8,%l6
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	stw	%l6,[%i6+0x02c]		! Mem[000000001018142c]
	sth	%l0,[%i1+0x038]		! Mem[0000000010041438]
	jmpl	%o7,%g0
	ldsh	[%i3+0x032],%l3		! Mem[00000000100c1432]
p0_near_2_he:
	ldd	[%i0+0x020],%f22	! Mem[0000000010001420]
	ldstub	[%o0+0x000],%l4		! Mem[00000000201c0000]
	ldstub	[%o1+0x001],%l7		! Mem[0000000020800001]
	fstod	%f18,%f22
	swap	[%i4+0x01c],%l1		! Mem[000000001010141c]
	xnor	%l0,%l7,%l6
	jmpl	%o7,%g0
	add	%l3,%l5,%l1
near2_b2b_h:
	jmpl	%o7,%g0
	xor	%l2,-0x54d,%l4
	jmpl	%o7,%g0
	nop
near2_b2b_l:
	jmpl	%o7,%g0
	andn	%l3,%l3,%l4
	jmpl	%o7,%g0
	nop
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	swap	[%i1+0x000],%l2		! Mem[0000000010041400]
	subc	%l5,-0xac9,%l1
	fitod	%f5 ,%f14
	stb	%l6,[%i6+0x03a]		! Mem[000000001018143a]
	jmpl	%o7,%g0
	std	%l4,[%i4+0x010]		! Mem[0000000010101410]
p0_near_3_he:
	fdtos	%f28,%f30
	stw	%l7,[%i3+0x004]		! Mem[00000000100c1404]
	andn	%l0,%l5,%l0
	swap	[%i2+0x038],%l0		! Mem[0000000010081438]
	ldub	[%i3+0x00f],%l4		! Mem[00000000100c140f]
	st	%f18,[%i5+0x018]	! Mem[0000000010141418]
	jmpl	%o7,%g0
	fdtos	%f28,%f19
near3_b2b_h:
	jmpl	%o7,%g0
	and	%l3,0xd49,%l2
	jmpl	%o7,%g0
	nop
near3_b2b_l:
	jmpl	%o7,%g0
	orn	%l7,-0xc59,%l2
	jmpl	%o7,%g0
	nop
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	fmuls	%f10,%f6 ,%f7 
	stw	%l0,[%i4+0x038]		! Mem[0000000010101438]
	jmpl	%o7,%g0
	fdtoi	%f8 ,%f13
p0_far_0_lem:
	fmuls	%f10,%f6 ,%f7 
	membar	#Sync
	stw	%l0,[%i4+0x038]		! Mem[0000000010101438]
	jmpl	%o7,%g0
	fdtoi	%f8 ,%f13
p0_far_0_he:
	jmpl	%o7,%g0
	udivx	%l0,-0x3ca,%l1
	jmpl	%o7,%g0
	nop
p0_far_0_hem:
	jmpl	%o7,%g0
	udivx	%l0,-0x3ca,%l1
	jmpl	%o7,%g0
	nop
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	umul	%l2,-0x784,%l2
	fdtoi	%f30,%f16
	jmpl	%o7,%g0
	fitod	%f21,%f16
far0_b2b_l:
	mulx	%l0,-0x8d2,%l1
	nop
	jmpl	%o7,%g0
	mulx	%l6,%l0,%l2
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	lduh	[%i3+0x02a],%l3		! Mem[00000000100c142a]
	add	%l6,-0x335,%l4
	mulx	%l4,%l2,%l7
	xnor	%l2,0xaf6,%l2
	nop
	stw	%l4,[%i5+0x010]		! Mem[0000000010141410]
	jmpl	%o7,%g0
	swap	[%i5+0x038],%l5		! Mem[0000000010141438]
p0_far_1_lem:
	membar	#Sync
	lduh	[%i3+0x02a],%l3		! Mem[00000000100c142a]
	add	%l6,-0x335,%l4
	mulx	%l4,%l2,%l7
	xnor	%l2,0xaf6,%l2
	nop
	stw	%l4,[%i5+0x010]		! Mem[0000000010141410]
	membar	#Sync
	jmpl	%o7,%g0
	swap	[%i5+0x038],%l5		! Mem[0000000010141438]
p0_far_1_he:
	jmpl	%o7,%g0
	add	%l6,-0xdbd,%l0
	jmpl	%o7,%g0
	nop
p0_far_1_hem:
	jmpl	%o7,%g0
	add	%l6,-0xdbd,%l0
	jmpl	%o7,%g0
	nop
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	sub	%l4,0xb5e,%l5
	orn	%l3,%l4,%l7
	fcmps	%fcc2,%f27,%f23
	fcmps	%fcc3,%f21,%f28
	udivx	%l1,%l6,%l1
	sub	%l0,-0xdbb,%l2
	fitos	%f17,%f27
	jmpl	%o7,%g0
	add	%l6,%l1,%l6
far1_b2b_l:
	and	%l5,%l7,%l7
	fsubs	%f6 ,%f13,%f1 
	udivx	%l4,-0x458,%l1
	addc	%l2,-0xc66,%l3
	orn	%l1,%l2,%l5
	fstoi	%f12,%f10
	fstod	%f2 ,%f2 
	jmpl	%o7,%g0
	fstod	%f0 ,%f14
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	udivx	%l6,%l5,%l3
	ldub	[%i6+0x03c],%l5		! Mem[000000001018143c]
	st	%f9 ,[%i5+0x004]	! Mem[0000000010141404]
	fdtos	%f8 ,%f8 
	std	%l2,[%i2+0x010]		! Mem[0000000010081410]
	swap	[%i5+0x02c],%l7		! Mem[000000001014142c]
	andn	%l0,0xb54,%l6
	jmpl	%o7,%g0
	stw	%l2,[%i3+0x014]		! Mem[00000000100c1414]
p0_far_2_lem:
	udivx	%l6,%l5,%l3
	membar	#Sync
	ldub	[%i6+0x03c],%l5		! Mem[000000001018143c]
	st	%f9 ,[%i5+0x004]	! Mem[0000000010141404]
	fdtos	%f8 ,%f8 
	std	%l2,[%i2+0x010]		! Mem[0000000010081410]
	swap	[%i5+0x02c],%l7		! Mem[000000001014142c]
	andn	%l0,0xb54,%l6
	membar	#Sync
	jmpl	%o7,%g0
	stw	%l2,[%i3+0x014]		! Mem[00000000100c1414]
p0_far_2_he:
	stx	%l2,[%i3+0x030]		! Mem[00000000100c1430]
	xor	%l5,%l2,%l0
	add	%l3,%l2,%l6
	add	%l4,0xa5c,%l1
	st	%f22,[%i5+0x018]	! Mem[0000000010141418]
	ldsh	[%i1+0x00e],%l1		! Mem[000000001004140e]
	jmpl	%o7,%g0
	fdtoi	%f16,%f28
p0_far_2_hem:
	membar	#Sync
	stx	%l2,[%i3+0x030]		! Mem[00000000100c1430]
	xor	%l5,%l2,%l0
	add	%l3,%l2,%l6
	add	%l4,0xa5c,%l1
	st	%f22,[%i5+0x018]	! Mem[0000000010141418]
	ldsh	[%i1+0x00e],%l1		! Mem[000000001004140e]
	jmpl	%o7,%g0
	fdtoi	%f16,%f28
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	and	%l2,0x5a0,%l6
	add	%l4,0xc95,%l4
	fitod	%f30,%f20
	subc	%l3,%l4,%l0
	udivx	%l6,%l6,%l5
	jmpl	%o7,%g0
	fdivs	%f28,%f24,%f29
far2_b2b_l:
	add	%l5,-0x1aa,%l6
	fstod	%f14,%f10
	fcmps	%fcc3,%f4 ,%f15
	udivx	%l7,-0x4b3,%l6
	andn	%l3,0x95c,%l4
	jmpl	%o7,%g0
	umul	%l7,0x705,%l2
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	ldstub	[%i3+0x03f],%l5		! Mem[00000000100c143f]
	stb	%l1,[%i6+0x001]		! Mem[0000000010181401]
	fdivs	%f9 ,%f3 ,%f5 
	jmpl	%o7,%g0
	std	%f8 ,[%i1+0x000]	! Mem[0000000010041400]
p0_far_3_lem:
	membar	#Sync
	ldstub	[%i3+0x03f],%l5		! Mem[00000000100c143f]
	stb	%l1,[%i6+0x001]		! Mem[0000000010181401]
	fdivs	%f9 ,%f3 ,%f5 
	membar	#Sync
	jmpl	%o7,%g0
	std	%f8 ,[%i1+0x000]	! Mem[0000000010041400]
p0_far_3_he:
	jmpl	%o7,%g0
	stx	%l5,[%i1+0x038]		! Mem[0000000010041438]
	jmpl	%o7,%g0
	nop
p0_far_3_hem:
	membar	#Sync
	jmpl	%o7,%g0
	stx	%l5,[%i1+0x038]		! Mem[0000000010041438]
	jmpl	%o7,%g0
	nop
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	sdivx	%l6,-0xb9b,%l4
	and	%l1,-0xb65,%l7
	sub	%l3,0xa4b,%l4
	jmpl	%o7,%g0
	and	%l2,0xfdf,%l1
far3_b2b_l:
	fsqrts	%f7 ,%f11
	fcmps	%fcc1,%f1 ,%f9 
	fadds	%f15,%f5 ,%f13
	jmpl	%o7,%g0
	fadds	%f10,%f8 ,%f7 
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	stb	%l4,[%i1+0x037]		! Mem[0000000010041437]
	add	%l4,%l0,%l0
	ldstub	[%i5+0x000],%l5		! Mem[0000000010141400]
	jmpl	%g6+8,%g0
	andn	%l7,%l7,%l5
p0_call_0_le:
	fdtoi	%f2 ,%f10
	sth	%l7,[%i6+0x02e]		! Mem[000000001018142e]
	stx	%l4,[%i3+0x010]		! Mem[00000000100c1410]
	fmuls	%f14,%f1 ,%f14
	or	%l0,-0x843,%l1
	smul	%l6,%l3,%l2
	retl
	fstod	%f2 ,%f8 
p0_jmpl_0_lo:
	stb	%l4,[%o1+0x037]		! Mem[0000000010041437]
	add	%l4,%l0,%l0
	ldstub	[%o5+0x000],%l5		! Mem[0000000010141400]
	jmpl	%g6+8,%g0
	andn	%l7,%l7,%l5
p0_call_0_lo:
	fdtoi	%f2 ,%f10
	sth	%l7,[%o6+0x02e]		! Mem[000000001018142e]
	stx	%l4,[%o3+0x010]		! Mem[00000000100c1410]
	fmuls	%f14,%f1 ,%f14
	or	%l0,-0x843,%l1
	smul	%l6,%l3,%l2
	retl
	fstod	%f2 ,%f8 
p0_jmpl_0_he:
	andn	%l5,0x402,%l7
	smul	%l2,-0x9af,%l2
	sub	%l6,%l5,%l5
	fitos	%f24,%f26
	std	%l0,[%i2+0x010]		! Mem[0000000010081410]
	ldstub	[%o2+0x000],%l2		! Mem[00000000211c0000]
	jmpl	%g6+8,%g0
	stw	%l4,[%i1+0x028]		! Mem[0000000010041428]
p0_call_0_he:
	st	%f21,[%i2+0x038]	! Mem[0000000010081438]
	or	%l7,%l6,%l6
	ldub	[%i5+0x037],%l6		! Mem[0000000010141437]
	swap	[%i6+0x02c],%l1		! Mem[000000001018142c]
	ldd	[%i5+0x010],%l6		! Mem[0000000010141410]
	sdivx	%l3,-0x1bc,%l1
	retl
	fstod	%f30,%f22
p0_jmpl_0_ho:
	andn	%l5,0x402,%l7
	smul	%l2,-0x9af,%l2
	sub	%l6,%l5,%l5
	fitos	%f24,%f26
	std	%l0,[%o2+0x010]		! Mem[0000000010081410]
	ldstub	[%i2+0x000],%l2		! Mem[00000000211c0000]
	jmpl	%g6+8,%g0
	stw	%l4,[%o1+0x028]		! Mem[0000000010041428]
p0_call_0_ho:
	st	%f21,[%o2+0x038]	! Mem[0000000010081438]
	or	%l7,%l6,%l6
	ldub	[%o5+0x037],%l6		! Mem[0000000010141437]
	swap	[%o6+0x02c],%l1		! Mem[000000001018142c]
	ldd	[%o5+0x010],%l6		! Mem[0000000010141410]
	sdivx	%l3,-0x1bc,%l1
	retl
	fstod	%f30,%f22
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	mulx	%l7,-0xd92,%l7
	andn	%l4,%l5,%l3
	jmpl	%g6+8,%g0
	sth	%l3,[%i0+0x010]		! Mem[0000000010001410]
p0_call_1_le:
	smul	%l4,-0x26d,%l2
	fmuls	%f7 ,%f13,%f13
	ldsw	[%i0+0x03c],%l2		! Mem[000000001000143c]
	ld	[%i0+0x008],%f1 	! Mem[0000000010001408]
	fitos	%f7 ,%f5 
	retl
	lduw	[%i1+0x01c],%l4		! Mem[000000001004141c]
p0_jmpl_1_lo:
	mulx	%l7,-0xd92,%l7
	andn	%l4,%l5,%l3
	jmpl	%g6+8,%g0
	sth	%l3,[%o0+0x010]		! Mem[0000000010001410]
p0_call_1_lo:
	smul	%l4,-0x26d,%l2
	fmuls	%f7 ,%f13,%f13
	ldsw	[%o0+0x03c],%l2		! Mem[000000001000143c]
	ld	[%o0+0x008],%f1 	! Mem[0000000010001408]
	fitos	%f7 ,%f5 
	retl
	lduw	[%o1+0x01c],%l4		! Mem[000000001004141c]
p0_jmpl_1_he:
	sub	%l2,%l0,%l0
	st	%f31,[%i1+0x010]	! Mem[0000000010041410]
	jmpl	%g6+8,%g0
	fcmps	%fcc1,%f20,%f29
p0_call_1_he:
	retl
	andn	%l7,-0xa3f,%l4
p0_jmpl_1_ho:
	sub	%l2,%l0,%l0
	st	%f31,[%o1+0x010]	! Mem[0000000010041410]
	jmpl	%g6+8,%g0
	fcmps	%fcc1,%f20,%f29
p0_call_1_ho:
	retl
	andn	%l7,-0xa3f,%l4
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	addc	%l6,0x871,%l0
	ldd	[%i5+0x000],%f4 	! Mem[0000000010141400]
	lduw	[%i4+0x008],%l1		! Mem[0000000010101408]
	ldx	[%i1+0x018],%l6		! Mem[0000000010041418]
	fdivs	%f6 ,%f3 ,%f10
	jmpl	%g6+8,%g0
	swap	[%i5+0x004],%l6		! Mem[0000000010141404]
p0_call_2_le:
	fsqrts	%f13,%f14
	retl
	fstoi	%f0 ,%f3 
p0_jmpl_2_lo:
	addc	%l6,0x871,%l0
	ldd	[%o5+0x000],%f4 	! Mem[0000000010141400]
	lduw	[%o4+0x008],%l1		! Mem[0000000010101408]
	ldx	[%o1+0x018],%l6		! Mem[0000000010041418]
	fdivs	%f6 ,%f3 ,%f10
	jmpl	%g6+8,%g0
	swap	[%o5+0x004],%l6		! Mem[0000000010141404]
p0_call_2_lo:
	fsqrts	%f13,%f14
	retl
	fstoi	%f0 ,%f3 
p0_jmpl_2_he:
	jmpl	%g6+8,%g0
	fcmps	%fcc1,%f20,%f21
p0_call_2_he:
	fitos	%f17,%f23
	retl
	ldstub	[%i1+0x022],%l1		! Mem[0000000010041422]
p0_jmpl_2_ho:
	jmpl	%g6+8,%g0
	fcmps	%fcc1,%f20,%f21
p0_call_2_ho:
	fitos	%f17,%f23
	retl
	ldstub	[%o1+0x022],%l1		! Mem[0000000010041422]
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	fsqrts	%f13,%f9 
	stb	%l6,[%i1+0x023]		! Mem[0000000010041423]
	sub	%l1,%l2,%l2
	stx	%l0,[%i0+0x028]		! Mem[0000000010001428]
	stw	%l0,[%i2+0x014]		! Mem[0000000010081414]
	fadds	%f15,%f14,%f8 
	fstod	%f7 ,%f12
	jmpl	%g6+8,%g0
	sdivx	%l6,%l7,%l1
p0_call_3_le:
	lduw	[%i0+0x03c],%l4		! Mem[000000001000143c]
	swap	[%i6+0x024],%l5		! Mem[0000000010181424]
	andn	%l4,%l6,%l0
	retl
	ldstub	[%o2+0x001],%l0		! Mem[00000000211c0001]
p0_jmpl_3_lo:
	fsqrts	%f13,%f9 
	stb	%l6,[%o1+0x023]		! Mem[0000000010041423]
	sub	%l1,%l2,%l2
	stx	%l0,[%o0+0x028]		! Mem[0000000010001428]
	stw	%l0,[%o2+0x014]		! Mem[0000000010081414]
	fadds	%f15,%f14,%f8 
	fstod	%f7 ,%f12
	jmpl	%g6+8,%g0
	sdivx	%l6,%l7,%l1
p0_call_3_lo:
	lduw	[%o0+0x03c],%l4		! Mem[000000001000143c]
	swap	[%o6+0x024],%l5		! Mem[0000000010181424]
	andn	%l4,%l6,%l0
	retl
	ldstub	[%i2+0x001],%l0		! Mem[00000000211c0001]
p0_jmpl_3_he:
	addc	%l7,0x163,%l4
	ldd	[%i4+0x038],%f24	! Mem[0000000010101438]
	ld	[%i2+0x004],%f31	! Mem[0000000010081404]
	jmpl	%g6+8,%g0
	stw	%l3,[%i6+0x018]		! Mem[0000000010181418]
p0_call_3_he:
	fsqrts	%f21,%f30
	fadds	%f19,%f29,%f24
	st	%f17,[%i6+0x020]	! Mem[0000000010181420]
	fcmps	%fcc0,%f31,%f21
	std	%l4,[%i1+0x000]		! Mem[0000000010041400]
	retl
	fmuls	%f25,%f24,%f27
p0_jmpl_3_ho:
	addc	%l7,0x163,%l4
	ldd	[%o4+0x038],%f24	! Mem[0000000010101438]
	ld	[%o2+0x004],%f31	! Mem[0000000010081404]
	jmpl	%g6+8,%g0
	stw	%l3,[%o6+0x018]		! Mem[0000000010181418]
p0_call_3_ho:
	fsqrts	%f21,%f30
	fadds	%f19,%f29,%f24
	st	%f17,[%o6+0x020]	! Mem[0000000010181420]
	fcmps	%fcc0,%f31,%f21
	std	%l4,[%o1+0x000]		! Mem[0000000010041400]
	retl
	fmuls	%f25,%f24,%f27
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
	.word	0x1274e626,0x41c67f5d		! Init value for %l0
	.word	0x4237e264,0x93ecd953		! Init value for %l1
	.word	0x33de6c84,0x2ad92551		! Init value for %l2
	.word	0x0200d870,0x05b78c51		! Init value for %l3
	.word	0x9acfcb25,0x9e317529		! Init value for %l4
	.word	0x9fcca2a6,0x3b040418		! Init value for %l5
	.word	0xa8ac0124,0x63ded8d6		! Init value for %l6
	.word	0xa08ef8e2,0x6bd70144		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x19f12272,0xd29d483e		! Init value for %f0 
	.word	0x6c18b3e4,0x9238c078		! Init value for %f2 
	.word	0x92601512,0x9f170de2		! Init value for %f4 
	.word	0xa81225f9,0x319f9fdd		! Init value for %f6 
	.word	0x606dabe8,0x632b7c38		! Init value for %f8 
	.word	0xa9be66dd,0xcce2ad12		! Init value for %f10
	.word	0x8ddd271d,0x089d268f		! Init value for %f12
	.word	0x9c744930,0xff4ed13e		! Init value for %f14
	.word	0x9fa03fa1,0x4633a6cd		! Init value for %f16
	.word	0x541ff3ee,0x36332e16		! Init value for %f18
	.word	0xce046bb5,0x97dc11ee		! Init value for %f20
	.word	0x01860239,0xeb70490c		! Init value for %f22
	.word	0xd75c395e,0xeea966aa		! Init value for %f24
	.word	0xd452d7fb,0x16d46b14		! Init value for %f26
	.word	0xc05baf2c,0x44a4efac		! Init value for %f28
	.word	0xcae96edc,0x45556fdf		! Init value for %f30
	.word	0xea5a12e7,0x53a05a23		! Init value for %f32
	.word	0xbdbc3912,0x743d19d5		! Init value for %f34
	.word	0x0e17cc11,0x30e213d6		! Init value for %f36
	.word	0xeb5f91ef,0x94843d4b		! Init value for %f38
	.word	0xbfa83f07,0xe7e64909		! Init value for %f40
	.word	0xfb5b3d72,0x5d1fa85a		! Init value for %f42
	.word	0x80e912a0,0x681c09fb		! Init value for %f44
	.word	0xe09f4a11,0x0e48b8ba		! Init value for %f46
	.word	0x6f3dbb26,0x23c0b42e
	.word	0xe94a2ef6,0xddffb3a0
	.word	0x4712ed68,0xb296d512
	.word	0xda0b70d8,0x55f19c85
	.word	0xf113fbf3,0x68889de1
	.word	0x1299138b,0x284f41c4
	.word	0x12207a82,0xc56038a8
	.word	0x3a8845b9,0x0b6034ec
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
	.word	0x00000000,0x0000bd00
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
p0_expected_fp_regs:
	.word	0xff000000,0xff000000
	.word	0x500bbc13,0x00002bab
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x50800000
	.word	0xffff004a,0x00000000
	.word	0x50000000,0x00000000
	.word	0xffffffff,0xabffffff
	.word	0xff000000,0x6f69bd00
	.word	0x00000000,0x500000ff
	.word	0x0841ccff,0x08410000
	.word	0x000031ff,0x000000ff
	.word	0x005f0000,0x00000000
	.word	0x8cff00ff,0xff000000
	.word	0xea0000ff,0xadff0000
	.word	0xce4cffab,0x00000000
	.word	0xfd2eacff,0x00000000
	.word	0x00000001,0x00000400		! %fsr = 0000000100000400
p0_local0_expect:
	.word	0xffccffff,0x00000000
	.word	0x00000000,0x64c6b100
	.word	0xff000000,0x00000050
	.word	0x00000069,0x00000000
	.word	0x00000000,0x64c6b119
	.word	0x7fffffff,0x00ff00ff
	.word	0x000000ff,0x000000ff
	.word	0xff0000ff,0x00000013
p0_local0_sec_expect:
	.word	0x00000000,0x50000000
	.word	0x50000000,0x000000ff
	.word	0xff004473,0x00000000
	.word	0x6e0000ff,0xff000000
	.word	0x000000ea,0x00000050
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00002bab
p0_local1_expect:
	.word	0x8cff00ff,0xff000000
	.word	0x00ff00ff,0x00000000
	.word	0x000000ff,0x00ff00ff
	.word	0x3cbd696f,0x000000ff
	.word	0x6e0000ff,0x517e575f
	.word	0x00000000,0x00000000
	.word	0x00000000,0xffffffff
	.word	0xab2bb95e,0x000000ff
p0_local1_sec_expect:
	.word	0xffffffff,0xffffffff
	.word	0xff000000,0xff000000
	.word	0xff000000,0xffffffff
	.word	0x6e0000ff,0x6f69bd3c
	.word	0x00000000,0x00000000
	.word	0x500bbc13,0xff310000
	.word	0x3cbd696f,0xff00006e
	.word	0xff000000,0x00000000
p0_local2_expect:
	.word	0xffffffff,0x0000002b
	.word	0x8cff00ff,0x000000ff
	.word	0x00bd696f,0x000000ff
	.word	0x00000000,0x48007246
	.word	0xff00ff73,0xffff004a
	.word	0x00000000,0x00004a00
	.word	0x00000000,0x00000000
	.word	0x50000000,0x00000000
p0_local2_sec_expect:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x000000ff,0x00000000
	.word	0x00ffffff,0x73441245
	.word	0x6e000000,0x6e007300
	.word	0x0000ffb7,0x45a78c73
	.word	0xff00ffff,0x45a78c73
p0_local3_expect:
	.word	0xff000000,0x6f69bd00
	.word	0x00000000,0x00000000
	.word	0x00000000,0x50800000
	.word	0x500bbc13,0xff310000
	.word	0x00000000,0x000000ff
	.word	0x3cbdff6f,0xff0031ff
	.word	0x00000000,0xffffea00
	.word	0x00000000,0x7f31ffff
p0_local3_sec_expect:
	.word	0xff000000,0x00000050
	.word	0xff000000,0x00000000
	.word	0xffffffff,0xff000000
	.word	0x000000ff,0xff00006e
	.word	0x00000000,0x00000000
	.word	0x000031ff,0x13bc0b50
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
p0_local4_expect:
	.word	0xff00ff8c,0x00000000
	.word	0x13000000,0x00000000
	.word	0x00bd696f,0x00000000
	.word	0x0000ff00,0xffff004a
	.word	0xff004473,0xffff004a
	.word	0x7fffffff,0x45a78c73
	.word	0x000000ff,0x00000000
	.word	0x738ca745,0xb7ff0000
p0_local4_sec_expect:
	.word	0x00004108,0x00000000
	.word	0x00000000,0x000000ff
	.word	0xffffffff,0x00000000
	.word	0x00000048,0x00000000
	.word	0xff0000ff,0x50ff0000
	.word	0x00000000,0x00000035
	.word	0xff46fc98,0x00000000
	.word	0x0000005e,0xcb1b95ff
p0_local5_expect:
	.word	0x00000000,0x00000000
	.word	0xff004473,0x000000ff
	.word	0xff8ca745,0x000000ff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0xff000000
	.word	0x00ff006e,0x0000006e
	.word	0x00ffff00,0x45a78c73
	.word	0x00000000,0x000000ff
p0_local5_sec_expect:
	.word	0xffcc4108,0x00000000
	.word	0x13bc0b50,0x00000000
	.word	0x00000000,0x00000050
	.word	0x00000000,0x13000000
	.word	0xff0000ff,0x50ff0000
	.word	0xff0000ff,0x000000ff
	.word	0x4a00ffff,0x500b004a
	.word	0x13bc0b50,0x4a00ffff
p0_local6_expect:
	.word	0x00004108,0x00000000
	.word	0x00000000,0xffffffff
	.word	0xff000000,0xff310000
	.word	0x00000000,0x00005f00
	.word	0x00000000,0x7fffffff
	.word	0x0000ffad,0xff000000
	.word	0x00000000,0xabff4cce
	.word	0x00000000,0xffac2efd
p0_local6_sec_expect:
	.word	0xff000000,0x00000000
	.word	0x000000ff,0xff310000
	.word	0x0000ffb7,0x000000ff
	.word	0x00000013,0xffffffb7
	.word	0x0000ff50,0xff0000ff
	.word	0x13000000,0xff0000ff
	.word	0x00000000,0x98fc46ff
	.word	0x000000ff,0xffff0000
share0_expect:
	.word	0xffff7e52,0x569788d4
	.word	0x53246abf,0xbaffa7eb
	.word	0xf17f7380,0x25fe823e
	.word	0xdca634e7,0x60bd5cb3
	.word	0xe5898d35,0x7fa552ee
	.word	0x7fba9085,0x1800bc01
	.word	0xf7c1dc78,0x0cc004e2
	.word	0xb1edbd82,0xc97c5527
share1_expect:
	.word	0x00ffca09,0x6e2e7193
	.word	0xa82a1bb2,0x6e11cb18
	.word	0xed9617e9,0x7e8d8d3b
	.word	0xa144b4d3,0xda8ee187
	.word	0xdf361c0c,0x12a13716
	.word	0xabbd2681,0xa1c72375
	.word	0xc2ecdf3a,0xe03329d7
	.word	0x42625651,0x2aefdcb1
	.word	0xffff095a,0xe86aece3
	.word	0xe868f542,0x8279061f
	.word	0xd92e4812,0x1d7afabb
	.word	0x5199c068,0x97e7674d
	.word	0x50ab0138,0xec683845
	.word	0xf1a230db,0xbb3dfeb3
	.word	0x95d7c172,0xad8b0712
	.word	0xa137f608,0xbb5f6b9d
share2_expect:
	.word	0x00001327,0x31acad0f
	.word	0x6184b8bd,0x657897b4
	.word	0x39cb1188,0xf76e86b5
	.word	0xc44bc0b2,0x34808b44
	.word	0xdb73ce66,0x344d2fe3
	.word	0x8214a8c4,0x3b3c71f6
	.word	0x43af5f20,0xa4a4d759
	.word	0x84d92e6b,0x1e52da0c
share3_expect:
	.word	0xf6f0b8f7,0x4bed31fb
	.word	0x0db67e4a,0x2442c284
	.word	0x1397533f,0x3b40c943
	.word	0xc988af3b,0x5edcd27b
	.word	0x63f844b1,0xdcc040a2
	.word	0x0f7670b5,0x310d790b
	.word	0x56402281,0xd15f24be
	.word	0x2cffa77a,0x00d10cbf
	.word	0xff644546,0x7a044a86
	.word	0x5d3de3aa,0x33c27842
	.word	0xa7e5c923,0x221887fa
	.word	0xd24d772d,0x979f3fc0
	.word	0x46ac1894,0xf6ab22b3
	.word	0xca21927c,0x998ca69e
	.word	0xc8199a22,0xe2ebad4a
	.word	0xa1683927,0x9ed9e8ae
	.word	0xffffbc25,0x0ec0efdd
	.word	0xed25e8ff,0x006d6259
	.word	0xc206f185,0xf21eb822
	.word	0x8f4851e9,0xc14eb850
	.word	0x5b6d23c5,0xf0c21006
	.word	0x7d8493c1,0xe1666fbf
	.word	0x1cbc5f01,0xa63764e0
	.word	0xe4080233,0xcfd13a76
	.word	0xb0fff483,0xdbbac948
	.word	0xee755fd4,0x8cf1e9e6
	.word	0xca7b0cf4,0xe3c0cd4c
	.word	0x1099240a,0x0a3289fa
	.word	0x1d359d40,0x48b35fd1
	.word	0xff063085,0x18640e85
	.word	0xa77751fa,0x8b29a6af
	.word	0xc3a1ac53,0x438bd826
	.word	0x00008c1a,0x371b97da
	.word	0x0697270f,0x5fa76c47
	.word	0x556fbf88,0xbd1de841
	.word	0xd05686b0,0x0ae86cc2
	.word	0x924ecd7c,0xd08df1d1
	.word	0x59e7daa4,0x38da12e7
	.word	0x0f63eddb,0x52b782ec
	.word	0x6108121d,0x101e53c6
	.word	0xff00ab40,0xad17d1a5
	.word	0x474e7260,0x60e72692
	.word	0x6917ff80,0x780b849a
	.word	0xd740ffcf,0xe19c4800
	.word	0x82f80f71,0x4db8a34c
	.word	0xcb325468,0xf1450634
	.word	0xd31327aa,0x260d2cf2
	.word	0x703965b2,0x205549be
	.word	0xffff6058,0x2d21f701
	.word	0xdbd0d150,0xe518e760
	.word	0x21c0b1a7,0xeeb58320
	.word	0xd9c3c058,0x568866c1
	.word	0xb62847f1,0x7d2c9c9e
	.word	0xc276cee0,0x0effc83d
	.word	0x87077492,0xcd17e4b2
	.word	0x76b9e168,0xd5eff416
	.word	0x00ffbc74,0xb755b779
	.word	0x024b508b,0x63c8c0b4
	.word	0xe90e8cd4,0x76050ba8
	.word	0xd3420234,0x28a400f5
	.word	0x279574d6,0xbda5769f
	.word	0x947a5e66,0x698488e1
	.word	0x7453f92c,0x02b31b5d
	.word	0x47908a45,0x928a7974
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
	.word	0xd25589c8,0x32e6818d
	.word	0x00000000,0x00000002
	.word	0x83a23d17,0x92ba3811
	.word	0x00000000,0x00000003
	.word	0x7ddfeaaf,0xe636bfd7
	.word	0x00000000,0x00000004
	.word	0x993a9308,0x6a1ab942
	.word	0x00000000,0x00000005
	.word	0xc4e5fc70,0x16b4fe6c
	.word	0x00000000,0x00000006
	.word	0xf1c1e278,0x1fcfa15d
	.word	0x00000000,0x00000007
	.word	0x096cf0c7,0x874c971b
	.word	0x00000000,0x00000008
	.word	0x0fe6ec08,0x00e4ee54
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
	.word	0xc246e0d8,0xa05f21f0,0x6da84229,0x27844cc3
	.word	0xe2a0a818,0x74e1cfa1,0x33f64108,0x36578637
	.word	0x3c1df47b,0xd80faf28,0xe975e15d,0xfa044f92
	.word	0xa26bffb2,0xd09b646b,0x75f01295,0x2cafd500
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
	.word	0x33521904,0x284a198a,0x28cc9675,0x3e2116ef
	.word	0x6c624374,0xa601a6c2,0x38d4dbf9,0x529ac29e
	.word	0x64cc4306,0xc43dfc12,0x7a807c68,0xd22f44e8
	.word	0xebd37259,0x6316adec,0x14755347,0x6d6c1a5b
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
	.word	0xad87309c,0x5dafc5d9,0x5aeda113,0xe19e84fe
	.word	0x5247f799,0x00412483,0x93c2c0d9,0xd02e34e7
	.word	0x1d380168,0x57c3e3a2,0xce824c3f,0xa7e1c4cc
	.word	0x9cbe8f5f,0xecd17a46,0x4dd06b24,0xc3bec231
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
	.word	0x6d435c87,0xf282b2f2,0x4f67df13,0x17546bc1
	.word	0x578b09f1,0x41dce33e,0xc22c71c6,0xb0c7cf8a
	.word	0x6c437800,0x0e340020,0x7eafd2b7,0xbb110ed7
	.word	0xadcb22a4,0xa208773c,0x026d54be,0xd3db8fe8
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
	.word	0x68f51298,0xe2c602bf,0xb3e6aeeb,0x917d1a57
	.word	0x082a8d85,0x06b55dc6,0x62f8671c,0xe6a9539a
	.word	0x0efdf9fd,0xea78ef1b,0x9ba07c06,0xcd1847cb
	.word	0xa788ed0f,0x2c1d23d2,0xcab22175,0x0e806733
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
	.word	0xcb1fbef5,0x6a42f7d9,0x6bd7c613,0x13b4309c
	.word	0x738bad07,0xaa192ac3,0x8b6f4073,0x6b5e331f
	.word	0xad3c9978,0xebbb4525,0xcfb5930c,0xa2f692e9
	.word	0x76a30d77,0x006168c8,0xf956c8d7,0xb395b69b
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
	.word	0xe2bca86e,0x0e4021ed,0x3f1c23a5,0x36e5a939
	.word	0x5f0ebe6c,0x536ce18f,0x845c2afa,0xa4497f50
	.word	0x370b6648,0x597dd6d2,0xccd93a65,0xef76192f
	.word	0xbe0f56d7,0x353b7eea,0xf1d308f3,0x355d6f3b
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
	.word	0x2233f359,0x807d8e22,0x3d90d6d1,0xbf91ebeb
	.word	0xc56afa38,0xc7ec2a7e,0x1aec33c9,0x5edd8ea5
	.word	0x72a316e4,0xba1fd026,0x48894813,0x8c92de46
	.word	0xf844afee,0x834d6f99,0xa147a275,0xf3ce4583
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
	.word	0xa44c25dc,0x2a33746e,0xa3e900c1,0xca3195ab
	.word	0x9de194d4,0x2487796b,0xe546fc98,0x04107510
	.word	0xd552b408,0x9dcf9345,0x21081c6c,0xf4c586e6
	.word	0xe015433c,0x02d64a7c,0x45124473,0x00735b41
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
	.word	0xe479c724,0x881bf23c,0x50663268,0x5610727e
	.word	0x5cc301b1,0x4f199d7b,0x9fc0fe5b,0xf4aaf005
	.word	0xd11a7501,0x3ba4bedf,0x80f7f937,0x592ac288
	.word	0x452eba44,0xa3a144c5,0xbe497e83,0x20a6f006
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
	.word	0x5be81b55,0xc120630d,0x0680c8ca,0xea85325b
	.word	0x788b2116,0xdacf6845,0x618cf5a1,0x4aeb8874
	.word	0x41d24e96,0x20a2f730,0x9650fa58,0xe10bde60
	.word	0x14a78cbd,0x7d9afab3,0xe752064c,0x4c3765e9
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
	.word	0x2e471b9c,0x24a4e720,0xac64ec22,0x21198762
	.word	0x6e620ed1,0xbc565889,0x814f8833,0xe255b5f4
	.word	0x40577e51,0x04a24db6,0xa6568bbe,0x7e80b946
	.word	0x2bd71cbc,0x9dc1869c,0x500bbc13,0x5eb92bab
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
	.word	0xcdcc175c,0x16767a96,0x98950566,0xca6a6417
	.word	0x86acbc60,0x1ccc65c9,0xb9b4bd5e,0x55a6359c
	.word	0x5148fd82,0xb7393c5a,0x14e4a5a9,0xfe813cbc
	.word	0x3466373a,0xab7d4cce,0x715a66fe,0x1af22efd
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
	.word	0x6438fc84,0xb9fe27f8,0x64ec388c,0x3ef18701
	.word	0xd92ed4d0,0xf127e800,0xc1c2cd68,0xdba914be
	.word	0xbbc84b8f,0x091a31ab,0xcb1b95f9,0x19e5791d
	.word	0x9162379f,0x804b26e1,0xdd16b305,0xd8a73cd7
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
	.word	0x4bd77e52,0x569788d4,0x53246abf,0xbaffa7eb
	.word	0xf17f7380,0x25fe823e,0xdca634e7,0x60bd5cb3
	.word	0xe5898d35,0x7fa552ee,0x7fba9085,0x1800bc01
	.word	0xf7c1dc78,0x0cc004e2,0xb1edbd82,0xc97c5527
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
	.word	0x874fca09,0x6e2e7193,0xa82a1bb2,0x6e11cb18
	.word	0xed9617e9,0x7e8d8d3b,0xa144b4d3,0xda8ee187
	.word	0xdf361c0c,0x12a13716,0xabbd2681,0xa1c72375
	.word	0xc2ecdf3a,0xe03329d7,0x42625651,0x2aefdcb1
	.word	0x6362095a,0xe86aece3,0xe868f542,0x8279061f
	.word	0xd92e4812,0x1d7afabb,0x5199c068,0x97e7674d
	.word	0x50ab0138,0xec683845,0xf1a230db,0xbb3dfeb3
	.word	0x95d7c172,0xad8b0712,0xa137f608,0xbb5f6b9d
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
	.word	0xb2031327,0x31acad0f,0x6184b8bd,0x657897b4
	.word	0x39cb1188,0xf76e86b5,0xc44bc0b2,0x34808b44
	.word	0xdb73ce66,0x344d2fe3,0x8214a8c4,0x3b3c71f6
	.word	0x43af5f20,0xa4a4d759,0x84d92e6b,0x1e52da0c
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
	.word	0xf6f0b8f7,0x4bed31fb,0x0db67e4a,0x2442c284
	.word	0x1397533f,0x3b40c943,0xc988af3b,0x5edcd27b
	.word	0x63f844b1,0xdcc040a2,0x0f7670b5,0x310d790b
	.word	0x56402281,0xd15f24be,0x2cffa77a,0x00d10cbf
	.word	0x14644546,0x7a044a86,0x5d3de3aa,0x33c27842
	.word	0xa7e5c923,0x221887fa,0xd24d772d,0x979f3fc0
	.word	0x46ac1894,0xf6ab22b3,0xca21927c,0x998ca69e
	.word	0xc8199a22,0xe2ebad4a,0xa1683927,0x9ed9e8ae
	.word	0xda21bc25,0x0ec0efdd,0xed25e8ff,0x006d6259
	.word	0xc206f185,0xf21eb822,0x8f4851e9,0xc14eb850
	.word	0x5b6d23c5,0xf0c21006,0x7d8493c1,0xe1666fbf
	.word	0x1cbc5f01,0xa63764e0,0xe4080233,0xcfd13a76
	.word	0x7e57f483,0xdbbac948,0xee755fd4,0x8cf1e9e6
	.word	0xca7b0cf4,0xe3c0cd4c,0x1099240a,0x0a3289fa
	.word	0x1d359d40,0x48b35fd1,0xff063085,0x18640e85
	.word	0xa77751fa,0x8b29a6af,0xc3a1ac53,0x438bd826
	.word	0x31488c1a,0x371b97da,0x0697270f,0x5fa76c47
	.word	0x556fbf88,0xbd1de841,0xd05686b0,0x0ae86cc2
	.word	0x924ecd7c,0xd08df1d1,0x59e7daa4,0x38da12e7
	.word	0x0f63eddb,0x52b782ec,0x6108121d,0x101e53c6
	.word	0xb02aab40,0xad17d1a5,0x474e7260,0x60e72692
	.word	0x6917ff80,0x780b849a,0xd740ffcf,0xe19c4800
	.word	0x82f80f71,0x4db8a34c,0xcb325468,0xf1450634
	.word	0xd31327aa,0x260d2cf2,0x703965b2,0x205549be
	.word	0x5bcb6058,0x2d21f701,0xdbd0d150,0xe518e760
	.word	0x21c0b1a7,0xeeb58320,0xd9c3c058,0x568866c1
	.word	0xb62847f1,0x7d2c9c9e,0xc276cee0,0x0effc83d
	.word	0x87077492,0xcd17e4b2,0x76b9e168,0xd5eff416
	.word	0x19eabc74,0xb755b779,0x024b508b,0x63c8c0b4
	.word	0xe90e8cd4,0x76050ba8,0xd3420234,0x28a400f5
	.word	0x279574d6,0xbda5769f,0x947a5e66,0x698488e1
	.word	0x7453f92c,0x02b31b5d,0x47908a45,0x928a7974
share3_end:
