/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_2000_9.s
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
!	Seed = 626121711
!	Riesling can be on
!	1 Thread, 2000 lines
!	mpgen   created on May 4, 2009 (15:17:56), Version 2.81
!	mpgen_2000_9.s created on Jun 26, 2009 (12:17:11)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.090504 -rc random.rc -o mpgen_2000_9 -p 1 -l 2000

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
!	%f0  = 4ecdab80 4cd74d91 515668be 7744b717
!	%f4  = 2361806c 4b27cb4d 68d92a0a 00b933b3
!	%f8  = 525b7918 15fc85c9 19623d16 0fdca30f
!	%f12 = 0fb1e184 49131905 6a874de2 2a72812b
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 17bcc5b0 1eebe101 4eddc86e 12670a07
!	%f20 = 21e1f19c 7d45f9bd 0106d8ba 172b39a3
!	%f24 = 6300f148 7a5b3f39 7e7b6ac6 75d0cbff
!	%f28 = 2b9f10b4 36dc4d75 0c182a92 03e63d1b
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 6dd35be0 28ac8071 7069841e 2112c8f7
!	%f36 = 36f29ecc 325df42d 4fb7a36a 2b726b93
!	%f40 = 68fb6578 236d84a9 55d27476 72b1e0ef
!	%f44 = 3fc1fbe4 7d3ecde5 199da342 65eaa50b
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x92d2c55000000050,%g7,%g1 ! %gsr scale = 10, align = 0
	wr	%g1,%g0,%gsr		! %gsr = 92d2c55000000050

	wr	%g0,%y			! Clear %y register
	xorcc	%g0,%g0,%g3		! %g3 = 0, %ccr = 44
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 47c4df2e, %l5 = eceb0ffea98912a5
	ldstuba	[%i0+%o4]0x81,%l5	! %l5 = 0000000000000047
!	%l0 = d9f714a2f1d2b7ae, imm = 0000000000000a8f, %l4 = ce25ff9249a752ba
	orn	%l0,0xa8f,%l4		! %l4 = fffffffffffff7fe
!	%l0 = d9f714a2f1d2b7ae, Mem[0000000010101408] = fe9c222e
	stba	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = fe9c22ae
!	%l6 = 023cf423f6ad6aa0, imm = 0000000000000ece, %l6 = 023cf423f6ad6aa0
	orn	%l6,0xece,%l6		! %l6 = fffffffffffffbb1
!	Mem[0000000030141410] = 3cbe2d19, %l0 = d9f714a2f1d2b7ae
	ldstuba	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000019
!	Mem[000000001000143c] = 148178eb, %l1 = c9717559, %l0 = 00000019
	add	%i0,0x3c,%g1
	casa	[%g1]0x80,%l1,%l0	! %l0 = 00000000148178eb
!	Mem[0000000010101408] = fe9c22ae, %l3 = 0000000031a3f7df
	swapa	[%i4+%o4]0x88,%l3	! %l3 = 00000000fe9c22ae
!	%l1 = 5561e372c9717559, Mem[0000000010141400] = 202e4e69
	stba	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 202e4e59
!	%l7 = e7d88329d37e1dab, Mem[0000000030001400] = 7006b23f
	stwa	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = d37e1dab
!	Mem[00000000100c1410] = 6ae8784c, %l7 = e7d88329d37e1dab
	ldstuba	[%i3+%o5]0x80,%l7	! %l7 = 000000000000006a

p0_label_2:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 3e763322, %l3 = 00000000fe9c22ae
	lduha	[%i2+%o4]0x88,%l3	! %l3 = 0000000000003322
!	Mem[00000000300c1408] = 4e496600, %l4 = fffffffffffff7fe
	ldsha	[%i3+%o4]0x89,%l4	! %l4 = 0000000000006600
!	Mem[00000000100c1438] = 439758c2 3b2e148b, %l4 = 00006600, %l5 = 00000047
	ldd	[%i3+0x038],%l4		! %l4 = 00000000439758c2 000000003b2e148b
!	%f23 = 172b39a3, %f25 = 7a5b3f39, %f28 = 2b9f10b4
	fdivs	%f23,%f25,%f28		! %f28 = 00000000
!	Mem[0000000010101408] = dff7a331, %l3 = 0000000000003322
	ldsba	[%i4+%o4]0x80,%l3	! %l3 = ffffffffffffffdf
!	Mem[0000000010041400] = 31769324a08cd43b, %f30 = 0c182a92 03e63d1b
	ldda	[%i1+%g0]0x88,%f30	! %f30 = 31769324 a08cd43b
!	Mem[0000000030081410] = 3d1d4412 1ceb091c, %l2 = 83e55f14, %l3 = ffffffdf
	ldda	[%i2+%o5]0x89,%l2	! %l2 = 000000001ceb091c 000000003d1d4412
!	Mem[0000000030181408] = 1d9ca36e4ea59907, %f0  = 4ecdab80 4cd74d91
	ldda	[%i6+%o4]0x81,%f0 	! %f0  = 1d9ca36e 4ea59907
!	Mem[0000000030101410] = dc87037c, %f20 = 21e1f19c
	lda	[%i4+%o5]0x89,%f20	! %f20 = dc87037c
!	Mem[0000000030041400] = d08e9516, %l1 = 5561e372c9717559
	ldsba	[%i1+%g0]0x89,%l1	! %l1 = 0000000000000016

p0_label_3:
!	Starting 10 instruction Store Burst
!	%f13 = 49131905, Mem[000000001004141c] = 1b2eeb53
	st	%f13,[%i1+0x01c]	! Mem[000000001004141c] = 49131905
!	%f24 = 6300f148 7a5b3f39, Mem[0000000010101410] = 498a46ac 4b9c908d
	std	%f24,[%i4+%o5]		! Mem[0000000010101410] = 6300f148 7a5b3f39
!	%l4 = 00000000439758c2, Mem[0000000010181410] = 6cb31439
	stba	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 6cb314c2
!	%l2 = 000000001ceb091c, Mem[0000000010041400] = 31769324a08cd43b
	stxa	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000001ceb091c
!	%f4  = 2361806c, Mem[0000000030041410] = 038a84bc
	sta	%f4 ,[%i1+%o5]0x81	! Mem[0000000030041410] = 2361806c
!	%f0  = 1d9ca36e, Mem[0000000010081438] = 3b774362
	st	%f0 ,[%i2+0x038]	! Mem[0000000010081438] = 1d9ca36e
!	Mem[0000000010001428] = 54061bd6, %l4 = 00000000439758c2
	swap	[%i0+0x028],%l4		! %l4 = 0000000054061bd6
!	Mem[0000000010081410] = ec99931a, %l3 = 000000003d1d4412
	ldstuba	[%i2+%o5]0x88,%l3	! %l3 = 000000000000001a
!	Mem[0000000010041410] = 49b3ab8c, %l5 = 000000003b2e148b
	ldsha	[%i1+%o5]0x80,%l5	! %l5 = 00000000000049b3
!	Mem[0000000010101414] = 7a5b3f39, %l4 = 0000000054061bd6
	ldstub	[%i4+0x014],%l4		! %l4 = 000000000000007a

p0_label_4:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = c214b36c, %l0 = 00000000148178eb
	ldswa	[%i6+%o5]0x80,%l0	! %l0 = ffffffffc214b36c
!	Mem[0000000010001410] = 4570ad2c, %l6 = fffffffffffffbb1
	ldsba	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000045
!	Mem[0000000010001410] = 4570ad2c, %l2 = 000000001ceb091c
	lduwa	[%i0+%o5]0x80,%l2	! %l2 = 000000004570ad2c
!	Mem[0000000010081400] = 7d800d00, %l2 = 000000004570ad2c
	ldsba	[%i2+%g0]0x80,%l2	! %l2 = 000000000000007d
!	Mem[0000000010041400] = 1ceb091c, %f3  = 7744b717
	lda	[%i1+%g0]0x88,%f3 	! %f3 = 1ceb091c
!	Mem[0000000030141408] = 27df65740ec0c334, %f2  = 515668be 1ceb091c
	ldda	[%i5+%o4]0x89,%f2 	! %f2  = 27df6574 0ec0c334
!	Code Fragment 3, seed = 5415
p0_fragment_1:
!	%l0 = ffffffffc214b36c
	setx	0xf25c69ffe6f7a5ee,%g7,%l0 ! %l0 = f25c69ffe6f7a5ee
!	%l1 = 0000000000000016
	setx	0xeb7835404ad00f99,%g7,%l1 ! %l1 = eb7835404ad00f99
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f25c69ffe6f7a5ee
	setx	0x9e1b6f429ebde554,%g7,%l0 ! %l0 = 9e1b6f429ebde554
!	%l1 = eb7835404ad00f99
	setx	0xfb637735a442aa1f,%g7,%l1 ! %l1 = fb637735a442aa1f
p0_fragment_1_end:
!	%o0 = deadbeefdeadbeef
	set	share0_start,%o0	! set %o0[0] to VA
!	Mem[00000000201c0000] = 1e469ee0, %l4 = 000000000000007a
	lduh	[%o0+%g0],%l4		! %l4 = 0000000000001e46
!	Mem[00000000100c1400] = 36bd7d6045eb2bf1, %l3 = 000000000000001a
	ldxa	[%i3+%g0]0x80,%l3	! %l3 = 36bd7d6045eb2bf1
!	Mem[00000000100c1410] = ffe8784c, %l0 = 9e1b6f429ebde554
	ldsha	[%i3+%o5]0x80,%l0	! %l0 = ffffffffffffffe8

p0_label_5:
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000006a, Mem[0000000010081434] = 01e90c85, %asi = 80
	stwa	%l7,[%i2+0x034]%asi	! Mem[0000000010081434] = 0000006a
!	Mem[0000000010081428] = 4e17ba9640efba8f, %l0 = ffffffffffffffe8, %l3 = 36bd7d6045eb2bf1
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l0,%l3	! %l3 = 4e17ba9640efba8f
!	Mem[00000000100c1400] = 36bd7d60, %l5 = 00000000000049b3
	ldstuba	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000036
!	%o3 = deadbeefdeadbeef
	set	share3_start,%o3	! set %o3[0] to VA
!	%l7 = 000000000000006a, Mem[0000000021800181] = 7a45a0c0
	stb	%l7,[%o3+0x181]		! Mem[0000000021800180] = 7a6aa0c0
!	%f12 = 0fb1e184, Mem[0000000030081410] = 1ceb091c
	sta	%f12,[%i2+%o5]0x89	! Mem[0000000030081410] = 0fb1e184
!	%o1 = deadbeefdeadbeef
	set	share1_start,%o1	! set %o1[0] to VA
!	Mem[0000000020800000] = 5d4f7110, %l7 = 000000000000006a
	ldstub	[%o1+%g0],%l7		! %l7 = 000000000000005d
!	%f18 = 4eddc86e 12670a07, Mem[0000000030101410] = 7c0387dc 780e4efd
	stda	%f18,[%i4+%o5]0x81	! Mem[0000000030101410] = 4eddc86e 12670a07
!	%l1 = fb637735a442aa1f, Mem[00000000300c1408] = 0066494e
	stha	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = aa1f494e
!	%f22 = 0106d8ba 172b39a3, %l5 = 0000000000000036
!	Mem[0000000010001428] = 439758c25756cecf
	add	%i0,0x028,%g1
	stda	%f22,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010001428] = 43972b17bad8cecf
!	%l7 = 000000000000005d, Mem[00000000100c143c] = 3b2e148b, %asi = 80
	stha	%l7,[%i3+0x03c]%asi	! Mem[00000000100c143c] = 005d148b

p0_label_6:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 34c3c00e, %l4 = 0000000000001e46
	ldsha	[%i5+%o4]0x81,%l4	! %l4 = 00000000000034c3
!	Mem[0000000010001408] = 48da0f7e, %l7 = 000000000000005d
	ldswa	[%i0+%o4]0x80,%l7	! %l7 = 0000000048da0f7e
!	Mem[00000000100c1400] = ffbd7d60, %f16 = 17bcc5b0
	ld	[%i3+%g0],%f16		! %f16 = ffbd7d60
!	Mem[0000000030141410] = 3cbe2dff, %l3 = 4e17ba9640efba8f
	ldswa	[%i5+%o5]0x89,%l3	! %l3 = 000000003cbe2dff
!	Mem[0000000030101408] = ae4c644e, %l3 = 000000003cbe2dff
	lduwa	[%i4+%o4]0x89,%l3	! %l3 = 00000000ae4c644e
!	Mem[000000001010142e] = 7a67664f, %l0 = ffffffffffffffe8
	ldsh	[%i4+0x02e],%l0		! %l0 = 000000000000664f
!	Mem[0000000010181438] = 1ece38e2, %l5 = 0000000000000036
	ldsw	[%i6+0x038],%l5		! %l5 = 000000001ece38e2
!	Mem[0000000020800000] = ff4f7110, %l5 = 000000001ece38e2
	lduh	[%o1+%g0],%l5		! %l5 = 000000000000ff4f
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000030001400] = ab1d7ed3 4d2ca6c1 ffc4df2e 77b48dc7
!	Mem[0000000030001410] = 05940e5c 6a96ab7d 07daab7a 158d0963
!	Mem[0000000030001420] = 6856aa08 75cf9cf9 06a8b986 0808a7bf
!	Mem[0000000030001430] = 1e3b2574 18d41735 2da7b552 2561e4db
	ldda	[%i0+%g0]ASI_BLK_AIUS,%f0 	! Block Load from 0000000030001400
!	Mem[0000000010101410] = 6300f148, %l3 = 00000000ae4c644e
	ldsw	[%i4+%o5],%l3		! %l3 = 000000006300f148

p0_label_7:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081418] = 2d45af8a48a23333, %l2 = 000000000000007d, %l7 = 0000000048da0f7e
	add	%i2,0x18,%g1
	casxa	[%g1]0x80,%l2,%l7	! %l7 = 2d45af8a48a23333
!	%l6 = 0000000000000045, Mem[0000000010041430] = 28c300a43031c7a5
	stx	%l6,[%i1+0x030]		! Mem[0000000010041430] = 0000000000000045
!	%l4 = 00000000000034c3, Mem[00000000100c1400] = 607dbdff
	stwa	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000034c3
!	%l6 = 0000000000000045, Mem[0000000010181400] = 55516e8035962491, %asi = 80
	stxa	%l6,[%i6+0x000]%asi	! Mem[0000000010181400] = 0000000000000045
!	%f8  = 6856aa08 75cf9cf9, Mem[0000000010181438] = 1ece38e2 29cee02b
	std	%f8 ,[%i6+0x038]	! Mem[0000000010181438] = 6856aa08 75cf9cf9
!	Mem[0000000010041400] = 1c09eb1c 00000000 5ac00ade 3dabfcb7
!	%f16 = ffbd7d60 1eebe101 4eddc86e 12670a07
!	%f20 = dc87037c 7d45f9bd 0106d8ba 172b39a3
!	%f24 = 6300f148 7a5b3f39 7e7b6ac6 75d0cbff
!	%f28 = 00000000 36dc4d75 31769324 a08cd43b
	stda	%f16,[%i1+%g0]ASI_BLK_AIUP	! Block Store to 0000000010041400
!	%l7 = 2d45af8a48a23333, Mem[0000000010141410] = 2151050c
	stba	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 3351050c
!	%f13 = 18d41735, Mem[0000000010101400] = c0dde436
	sta	%f13,[%i4+%g0]0x88	! Mem[0000000010101400] = 18d41735
!	%f17 = 1eebe101, Mem[0000000010081434] = 0000006a
	st	%f17,[%i2+0x034]	! Mem[0000000010081434] = 1eebe101
!	%l7 = 2d45af8a48a23333, Mem[0000000010001408] = 7e0fda48
	stwa	%l7,[%i0+%o4]0x88	! Mem[0000000010001408] = 48a23333

p0_label_8:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff9399ec, %l6 = 0000000000000045
	lduwa	[%i2+%o5]0x80,%l6	! %l6 = 00000000ff9399ec
!	Mem[0000000030101400] = 3b03c7f0, %l5 = 000000000000ff4f
	ldsba	[%i4+%g0]0x81,%l5	! %l5 = 000000000000003b
!	Mem[00000000100c1410] = 4c78e8ff, %f12 = 1e3b2574
	lda	[%i3+%o5]0x88,%f12	! %f12 = 4c78e8ff
!	Mem[00000000201c0000] = 1e469ee0, %l5 = 000000000000003b, %asi = 80
	ldsba	[%o0+0x000]%asi,%l5	! %l5 = 000000000000001e
!	Mem[0000000030041410] = 2361806c, %l5 = 000000000000001e
	ldswa	[%i1+%o5]0x81,%l5	! %l5 = 000000002361806c
	membar	#Sync			! Added by membar checker (2)
!	Mem[000000001004143c] = a08cd43b, %l4 = 00000000000034c3
	lduw	[%i1+0x03c],%l4		! %l4 = 00000000a08cd43b
!	Mem[0000000030181410] = 7c40e49c, %l0 = 000000000000664f
	ldsba	[%i6+%o5]0x81,%l0	! %l0 = 000000000000007c
!	Mem[0000000030141400] = 338f105068d5dd21, %l2 = 000000000000007d
	ldxa	[%i5+%g0]0x81,%l2	! %l2 = 338f105068d5dd21
!	Mem[0000000030081408] = 5cb1b5ee, %f21 = 7d45f9bd
	lda	[%i2+%o4]0x81,%f21	! %f21 = 5cb1b5ee
!	Mem[0000000030141410] = ff2dbe3c, %l4 = 00000000a08cd43b
	lduwa	[%i5+%o5]0x81,%l4	! %l4 = 00000000ff2dbe3c

p0_label_9:
!	Starting 10 instruction Store Burst
!	%f14 = 2da7b552 2561e4db, Mem[00000000100c1410] = 4c78e8ff ad77c60f
	stda	%f14,[%i3+%o5]0x88	! Mem[00000000100c1410] = 2da7b552 2561e4db
!	%l2 = 68d5dd21, %l3 = 6300f148, Mem[0000000010141410] = 0c055133 6dd92d18
	stda	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = 68d5dd21 6300f148
!	%l6 = 00000000ff9399ec, Mem[0000000010081430] = 4163eb04
	sth	%l6,[%i2+0x030]		! Mem[0000000010081430] = 99eceb04
!	Mem[00000000201c0001] = 1e469ee0, %l4 = 00000000ff2dbe3c
	ldstuba	[%o0+0x001]%asi,%l4	! %l4 = 0000000000000046
!	%f16 = ffbd7d60 1eebe101, Mem[0000000010041400] = 607dbdff 01e1eb1e
	stda	%f16,[%i1+%g0]0x88	! Mem[0000000010041400] = ffbd7d60 1eebe101
!	%f16 = ffbd7d60, %f13 = 18d41735, %f28 = 00000000
	fadds	%f16,%f13,%f28		! %f28 = fffd7d60
!	%l6 = ff9399ec, %l7 = 48a23333, Mem[0000000010001410] = 2cad7045 0d4df767
	stda	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = ff9399ec 48a23333
!	%f10 = 06a8b986 0808a7bf, %l5 = 000000002361806c
!	Mem[0000000030181400] = 03e048b02ff37801
	stda	%f10,[%i6+%l5]ASI_PST8_SL ! Mem[0000000030181400] = 03e008082fb9a801
!	%l7 = 2d45af8a48a23333, Mem[0000000010001410] = 48a23333ff9399ec
	stxa	%l7,[%i0+%o5]0x88	! Mem[0000000010001410] = 2d45af8a48a23333
!	%l4 = 0000000000000046, Mem[0000000010001408] = 3333a248
	stwa	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000046

p0_label_10:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = c334000045eb2bf1, %f10 = 06a8b986 0808a7bf
	ldda	[%i3+%g0]0x80,%f10	! %f10 = c3340000 45eb2bf1
!	Mem[0000000030141410] = ff2dbe3c, %l0 = 000000000000007c
	lduwa	[%i5+%o5]0x81,%l0	! %l0 = 00000000ff2dbe3c
!	Mem[0000000010081400] = 7d800d00, %l4 = 0000000000000046
	ldsba	[%i2+%g0]0x80,%l4	! %l4 = 000000000000007d
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010141400] = 594e2e20 3473a1b1 56ce585e 12f2a437
!	Mem[0000000010141410] = 21ddd568 48f10063 2db7abaa 55f02ad3
!	Mem[0000000010141420] = 1f819fb8 53d16de9 29c3f0b6 0fe2c42f
!	Mem[0000000010141430] = 65e84a24 25a5fb25 4caad382 1ae7ec4b
	ldda	[%i5+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010141400
!	Mem[0000000010141400] = b1a17334 202e4e59, %l6 = ff9399ec, %l7 = 48a23333
	ldda	[%i5+%g0]0x88,%l6	! %l6 = 00000000202e4e59 00000000b1a17334
!	Mem[0000000020800001] = ff4f7110, %l6 = 00000000202e4e59, %asi = 80
	lduba	[%o1+0x001]%asi,%l6	! %l6 = 000000000000004f
!	Mem[0000000020800000] = ff4f7110, %l7 = 00000000b1a17334, %asi = 80
	ldsha	[%o1+0x000]%asi,%l7	! %l7 = ffffffffffffff4f
!	Mem[0000000030081400] = 17df0730 44ee2c81 5cb1b5ee 2a58d187
!	Mem[0000000030081410] = 84e1b10f 12441d3d 1ea03e3a 22019923
!	Mem[0000000030081420] = 38bc22c8 433cbab9 6673c846 15cf437f
!	Mem[0000000030081430] = 75f2fa34 4720a0f5 0e410012 78a84c9b
	ldda	[%i2+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030081400
!	Mem[0000000030181400] = 03e00808 2fb9a801 1d9ca36e 4ea59907
!	Mem[0000000030181410] = 7c40e49c 5fb540bd 2f00a3ba 6c22f8a3
!	Mem[0000000030181420] = 45b65448 53013639 4fe325c6 5b08baff
!	Mem[0000000030181430] = 4fb5e3b4 37b7f475 1f90d592 1b955c1b
	ldda	[%i6+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030181400
!	Mem[00000000100c1410] = dbe46125 52b5a72d, %l2 = 68d5dd21, %l3 = 6300f148
	ldda	[%i3+%o5]0x80,%l2	! %l2 = 00000000dbe46125 0000000052b5a72d

p0_label_11:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 03e00808, %l0 = 00000000ff2dbe3c
	swapa	[%i6+%g0]0x81,%l0	! %l0 = 0000000003e00808
!	%f22 = d32af055 aaabb72d, %l0 = 0000000003e00808
!	Mem[0000000010041438] = 31769324a08cd43b
	add	%i1,0x038,%g1
	stda	%f22,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010041438] = 317693aaa08cd43b
!	Mem[0000000020800040] = 0385bf40, %l6 = 000000000000004f
	ldstuba	[%o1+0x040]%asi,%l6	! %l6 = 0000000000000003
!	Mem[0000000030001410] = 05940e5c, %l1 = 00000000a442aa1f
	swapa	[%i0+%o5]0x81,%l1	! %l1 = 0000000005940e5c
!	Mem[0000000010001410] = 3333a248, %l4 = 000000000000007d, %asi = 80
	swapa	[%i0+0x010]%asi,%l4	! %l4 = 000000003333a248
!	Mem[000000001014143c] = 1ae7ec4b, %l5 = 000000002361806c, %asi = 80
	swapa	[%i5+0x03c]%asi,%l5	! %l5 = 000000001ae7ec4b
	membar	#Sync			! Added by membar checker (4)
!	%l0 = 0000000003e00808, Mem[0000000030181410] = 9ce4407c
	stba	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 9ce44008
!	Mem[00000000300c1400] = 04e66f90, %l0 = 0000000003e00808
	swapa	[%i3+%g0]0x81,%l0	! %l0 = 0000000004e66f90
!	%l2 = 00000000dbe46125, Mem[0000000010001410] = 0000007d
	stwa	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = dbe46125
!	Mem[0000000010141410] = 21ddd568, %l6 = 0000000000000003
	ldsha	[%i5+%o5]0x80,%l6	! %l6 = 00000000000021dd

p0_label_12:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 3007df17, %l0 = 0000000004e66f90
	ldsba	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000017
!	Mem[0000000030101410] = 4eddc86e, %f13 = 37b7f475
	lda	[%i4+%o5]0x81,%f13	! %f13 = 4eddc86e
!	Mem[0000000010101414] = ff5b3f39, %f24 = e96dd153
	lda	[%i4+0x014]%asi,%f24	! %f24 = ff5b3f39
!	Mem[00000000201c0000] = 1eff9ee0, %l4 = 000000003333a248
	ldstub	[%o0+%g0],%l4		! %l4 = 000000000000001e
!	Mem[0000000030141400] = 338f1050, %l4 = 000000000000001e
	lduba	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000033
!	Mem[0000000030001400] = c1a62c4d d37e1dab, %l2 = dbe46125, %l3 = 52b5a72d
	ldda	[%i0+%g0]0x89,%l2	! %l2 = 00000000d37e1dab 00000000c1a62c4d
!	%l7 = ffffffffffffff4f, imm = fffffffffffff2f2, %l4 = 0000000000000033
	and	%l7,-0xd0e,%l4		! %l4 = fffffffffffff242
!	Mem[0000000010001400] = 40fc623e, %l5 = 000000001ae7ec4b
	ldsba	[%i0+%g0]0x88,%l5	! %l5 = 000000000000003e
!	Mem[0000000010081410] = cd8e334c ec9993ff, %l4 = fffff242, %l5 = 0000003e
	ldda	[%i2+%o5]0x88,%l4	! %l4 = 00000000ec9993ff 00000000cd8e334c
!	Mem[000000001014140f] = 12f2a437, %l7 = ffffffffffffff4f
	ldub	[%i5+0x00f],%l7		! %l7 = 0000000000000037

p0_label_13:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000021dd, Mem[0000000010001410] = dbe46125
	stb	%l6,[%i0+%o5]		! Mem[0000000010001410] = dde46125
!	%f30 = 4bece71a 82d3aa4c, %l7 = 0000000000000037
!	Mem[0000000010001438] = 5b1268a2148178eb
	add	%i0,0x038,%g1
	stda	%f30,[%g1+%l7]ASI_PST32_P ! Mem[0000000010001438] = 4bece71a82d3aa4c
!	%l6 = 00000000000021dd, immd = 0000000000000fb9, %l108 = 0000000000000004
	udivx	%l6,0xfb9,%l4		! %l4 = 0000000000000002
!	Mem[0000000021800041] = 7ce791d0, %l0 = 0000000000000017
	ldstuba	[%o3+0x041]%asi,%l0	! %l0 = 00000000000000e7
!	%f4  = 7c40e49c 5fb540bd, Mem[0000000010041420] = 6300f148 7a5b3f39
	std	%f4 ,[%i1+0x020]	! Mem[0000000010041420] = 7c40e49c 5fb540bd
!	%l1 = 0000000005940e5c, Mem[0000000030141400] = 21ddd56850108f33
	stxa	%l1,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000005940e5c
!	%l5 = 00000000cd8e334c, Mem[0000000010001410] = dde46125
	stha	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = 334c6125
!	Mem[0000000020800001] = ff4f7110, %l2 = 00000000d37e1dab
	ldstub	[%o1+0x001],%l2		! %l2 = 000000000000004f
!	Mem[000000001010142c] = 7a67664f, %l7 = 0000000000000037, %asi = 80
	swapa	[%i4+0x02c]%asi,%l7	! %l7 = 000000007a67664f
!	Mem[0000000010001410] = 25614c33, %l4 = 0000000000000002
	ldstuba	[%i0+%o5]0x88,%l4	! %l4 = 0000000000000033

p0_label_14:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff9ee0, %l5 = 00000000cd8e334c, %asi = 80
	lduha	[%o0+0x000]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[00000000100c1410] = 2da7b552 2561e4db, %l0 = 000000e7, %l1 = 05940e5c
	ldda	[%i3+%o5]0x88,%l0	! %l0 = 000000002561e4db 000000002da7b552
!	Mem[00000000100c1408] = 9e514c17, %l2 = 000000000000004f
	lduwa	[%i3+%o4]0x88,%l2	! %l2 = 000000009e514c17
!	Mem[0000000010101400] = 3517d418, %l0 = 000000002561e4db
	ldsha	[%i4+%g0]0x80,%l0	! %l0 = 0000000000003517
!	Mem[0000000030001410] = a442aa1f, %l2 = 000000009e514c17
	ldsba	[%i0+%o5]0x81,%l2	! %l2 = ffffffffffffffa4
!	%f8  = 45b65448, %f0  = 03e00808, %f30 = 4bece71a
	fdivs	%f8 ,%f0 ,%f30		! %f30 = 7f800000
!	Mem[0000000010141410] = 68d5dd21, %l2 = ffffffffffffffa4
	ldswa	[%i5+%o5]0x88,%l2	! %l2 = 0000000068d5dd21
!	Mem[0000000010181438] = 6856aa0875cf9cf9, %f2  = 1d9ca36e 4ea59907, %asi = 80
	ldda	[%i6+0x038]%asi,%f2 	! %f2  = 6856aa08 75cf9cf9
!	%l2 = 0000000068d5dd21, %l2 = 0000000068d5dd21, %l5 = 000000000000ffff
	addc	%l2,%l2,%l5		! %l5 = 00000000d1abba42
!	Mem[00000000300c1408] = 4e491faa, %l1 = 000000002da7b552
	lduha	[%i3+%o4]0x89,%l1	! %l1 = 0000000000001faa

p0_label_15:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000003517, Mem[00000000100c1400] = c3340000, %asi = 80
	stwa	%l0,[%i3+0x000]%asi	! Mem[00000000100c1400] = 00003517
!	%f9  = 53013639, Mem[0000000010181404] = 00000045
	sta	%f9 ,[%i6+0x004]%asi	! Mem[0000000010181404] = 53013639
!	Mem[000000001014140f] = 12f2a437, %l0 = 0000000000003517
	ldstub	[%i5+0x00f],%l0		! %l0 = 0000000000000037
!	%l0 = 0000000000000037, Mem[0000000010041408] = 6ec8dd4e
	stha	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 6ec80037
!	%l2 = 0000000068d5dd21, %l0 = 0000000000000037, %y  = 00000000
	sdiv	%l2,%l0,%l1		! %l1 = 0000000001e7f60e
	mov	%l0,%y			! %y = 00000037
!	%l0 = 00000037, %l1 = 01e7f60e, Mem[0000000010081410] = ff9399ec 4c338ecd
	std	%l0,[%i2+%o5]		! Mem[0000000010081410] = 00000037 01e7f60e
!	%f24 = ff5b3f39 b89f811f, Mem[0000000010041410] = dc87037c 7d45f9bd
	std	%f24,[%i1+%o5]		! Mem[0000000010041410] = ff5b3f39 b89f811f
!	Mem[0000000030081410] = 0fb1e184, %l7 = 000000007a67664f
	ldstuba	[%i2+%o5]0x89,%l7	! %l7 = 0000000000000084
!	%l7 = 0000000000000084, Mem[0000000030181400] = ff2dbe3c
	stha	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = 0084be3c
!	%l3 = 00000000c1a62c4d, Mem[0000000010001400] = 3e62fc40
	stba	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = 4d62fc40

p0_label_16:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 56ce585e, %l7 = 0000000000000084
	lduwa	[%i5+%o4]0x80,%l7	! %l7 = 0000000056ce585e
!	Mem[0000000030141408] = 34c3c00e7465df27, %f8  = 45b65448 53013639
	ldda	[%i5+%o4]0x81,%f8 	! %f8  = 34c3c00e 7465df27
!	Mem[0000000030081410] = 0fb1e1ff, %l3 = 00000000c1a62c4d
	lduba	[%i2+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000020800001] = ffff7110, %l1 = 0000000001e7f60e, %asi = 80
	ldsba	[%o1+0x001]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030081400] = 17df0730, %l6 = 00000000000021dd
	lduwa	[%i2+%g0]0x81,%l6	! %l6 = 0000000017df0730
!	Mem[0000000030041400] = a151e168d08e9516, %f8  = 34c3c00e 7465df27
	ldda	[%i1+%g0]0x89,%f8 	! %f8  = a151e168 d08e9516
!	Mem[0000000010001400] = 4d62fc40, %l5 = 00000000d1abba42
	ldswa	[%i0+%g0]0x80,%l5	! %l5 = 000000004d62fc40
!	Mem[0000000010101408] = dff7a331, %l7 = 0000000056ce585e
	lduw	[%i4+%o4],%l7		! %l7 = 00000000dff7a331
!	Mem[0000000010041408] = 3700c86e, %l2 = 0000000068d5dd21
	lduwa	[%i1+%o4]0x80,%l2	! %l2 = 000000003700c86e
!	Code Fragment 3, seed = 702137
p0_fragment_2:
!	%l0 = 0000000000000037
	setx	0xb501d3083492cb5e,%g7,%l0 ! %l0 = b501d3083492cb5e
!	%l1 = ffffffffffffffff
	setx	0x281c301ba082fa09,%g7,%l1 ! %l1 = 281c301ba082fa09
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b501d3083492cb5e
	setx	0x053c1636302184c4,%g7,%l0 ! %l0 = 053c1636302184c4
!	%l1 = 281c301ba082fa09
	setx	0xc2e5203af85cee8f,%g7,%l1 ! %l1 = c2e5203af85cee8f
p0_fragment_2_end:

p0_label_17:
!	Starting 10 instruction Store Burst
!	Mem[000000001018143a] = 6856aa08, %l3 = 00000000000000ff, %asi = 80
	lduha	[%i6+0x03a]%asi,%l3	! %l3 = 000000000000aa08
!	%l0 = 302184c4, %l1 = f85cee8f, Mem[0000000010041408] = 3700c86e 12670a07
	stda	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 302184c4 f85cee8f
!	Mem[0000000010101408] = dff7a331, %l3 = 000000000000aa08
	swapa	[%i4+%o4]0x80,%l3	! %l3 = 00000000dff7a331
!	Mem[0000000030181400] = 0084be3c, %l3 = 00000000dff7a331
	ldswa	[%i6+%g0]0x81,%l3	! %l3 = 000000000084be3c
!	Mem[00000000100c1400] = 00003517, %l4 = 0000000000000033
	ldstuba	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000
!	%f17 = 202e4e59, Mem[0000000030081410] = ffe1b10f
	sta	%f17,[%i2+%o5]0x81	! Mem[0000000030081410] = 202e4e59
!	%o2 = deadbeefdeadbeef
	set	share2_start,%o2	! set %o2[0] to VA
!	Mem[00000000211c0001] = 0d348970, %l6 = 0000000017df0730
	ldstuba	[%o2+0x001]%asi,%l6	! %l6 = 0000000000000034
!	Mem[0000000030001410] = 1faa42a4, %f31 = 82d3aa4c
	lda	[%i0+%o5]0x89,%f31	! %f31 = 1faa42a4
!	Mem[0000000030101400] = f0c7033b, %l5 = 000000004d62fc40
	ldstuba	[%i4+%g0]0x89,%l5	! %l5 = 000000000000003b
!	Mem[0000000030181400] = 0084be3c 2fb9a801 1d9ca36e 4ea59907
!	%f0  = 03e00808 2fb9a801 6856aa08 75cf9cf9
!	%f4  = 7c40e49c 5fb540bd 2f00a3ba 6c22f8a3
!	%f8  = a151e168 d08e9516 4fe325c6 5b08baff
!	%f12 = 4fb5e3b4 4eddc86e 1f90d592 1b955c1b
	stda	%f0 ,[%i6+%g0]ASI_BLK_SL	! Block Store to 0000000030181400

p0_label_18:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = aa1f494e, %l7 = 00000000dff7a331
	lduha	[%i3+%o4]0x81,%l7	! %l7 = 000000000000aa1f
!	Mem[0000000030101410] = 4eddc86e, %l7 = 000000000000aa1f
	lduwa	[%i4+%o5]0x81,%l7	! %l7 = 000000004eddc86e
!	Mem[0000000010041408] = c4842130, %l1 = c2e5203af85cee8f
	lduwa	[%i1+%o4]0x88,%l1	! %l1 = 00000000c4842130
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010181408] = 7d6783be, %l5 = 000000000000003b
	ldsha	[%i6+%o4]0x80,%l5	! %l5 = 0000000000007d67
!	Mem[0000000030101400] = f0c703ff, %l2 = 000000003700c86e
	ldswa	[%i4+%g0]0x89,%l2	! %l2 = fffffffff0c703ff
!	Mem[0000000010181410] = c214b36c, %f16 = b1a17334
	lda	[%i6+%o5]0x80,%f16	! %f16 = c214b36c
!	Mem[0000000030141400] = 05940e5c, %l4 = 0000000000000000
	lduha	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000e5c
!	%l5 = 0000000000007d67, imm = fffffffffffff397, %l0 = 053c1636302184c4
	add	%l5,-0xc69,%l0		! %l0 = 00000000000070fe
!	Mem[0000000010001410] = 25614cff, %l0 = 00000000000070fe
	lduha	[%i0+%o5]0x88,%l0	! %l0 = 0000000000004cff
!	Mem[0000000010041430] = 00000000, %f17 = 202e4e59
	lda	[%i1+0x030]%asi,%f17	! %f17 = 00000000

p0_label_19:
!	Starting 10 instruction Store Burst
!	%l6 = 00000034, %l7 = 4eddc86e, Mem[0000000030001410] = 1faa42a4 7dab966a
	stda	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000034 4eddc86e
!	Mem[00000000211c0000] = 0dff8970, %l1 = 00000000c4842130
	ldstub	[%o2+%g0],%l1		! %l1 = 000000000000000d
!	%l4 = 0000000000000e5c, Mem[0000000030141410] = ff2dbe3c
	stba	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 5c2dbe3c
!	%l1 = 000000000000000d, Mem[0000000010101410] = 48f10063
	stha	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = 48f1000d
!	%l4 = 0000000000000e5c, Mem[0000000030001408] = ffc4df2e
	stha	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 0e5cdf2e
!	%l3 = 000000000084be3c, Mem[0000000010041400] = 01e1eb1e
	stwa	%l3,[%i1+%g0]0x80	! Mem[0000000010041400] = 0084be3c
!	%f10 = 4fe325c6 5b08baff, Mem[0000000010081410] = 00000037 01e7f60e
	stda	%f10,[%i2+%o5]0x80	! Mem[0000000010081410] = 4fe325c6 5b08baff
!	%l6 = 0000000000000034, Mem[00000000100c141e] = 336e2b13
	sth	%l6,[%i3+0x01e]		! Mem[00000000100c141c] = 336e0034
!	Mem[0000000020800001] = ffff7110, %l4 = 0000000000000e5c
	ldstuba	[%o1+0x001]%asi,%l4	! %l4 = 00000000000000ff
!	%f29 = 244ae865, Mem[0000000010081408] = 2233763e
	sta	%f29,[%i2+%o4]0x80	! Mem[0000000010081408] = 244ae865

p0_label_20:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = c1a62c4dd37e1dab, %l6 = 0000000000000034
	ldxa	[%i0+%g0]0x89,%l6	! %l6 = c1a62c4dd37e1dab
!	Mem[0000000010141410] = 21ddd568, %f28 = 25fba525
	lda	[%i5+%o5]0x80,%f28	! %f28 = 21ddd568
!	%l6 = c1a62c4dd37e1dab, immd = 0000000000000c3b, %l7  = 000000004eddc86e
	mulx	%l6,0xc3b,%l7		! %l7 = 6b5fdbd9a774da69
!	Mem[0000000030041410] = 2361806c7f65cc5d, %l1 = 000000000000000d
	ldxa	[%i1+%o5]0x81,%l1	! %l1 = 2361806c7f65cc5d
!	Mem[0000000010181408] = 17862443be83677d, %f30 = 7f800000 1faa42a4
	ldda	[%i6+%o4]0x88,%f30	! %f30 = 17862443 be83677d
!	Mem[0000000010001410] = 25614cff, %f12 = 4fb5e3b4
	lda	[%i0+%o5]0x88,%f12	! %f12 = 25614cff
!	Mem[00000000100c1400] = ff003517, %l1 = 2361806c7f65cc5d
	lduha	[%i3+%g0]0x80,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010001400] = 51e3ed6840fc624d, %f10 = 4fe325c6 5b08baff
	ldda	[%i0+%g0]0x88,%f10	! %f10 = 51e3ed68 40fc624d
!	Mem[0000000030081410] = 202e4e59, %l2 = fffffffff0c703ff
	ldswa	[%i2+%o5]0x81,%l2	! %l2 = 00000000202e4e59
!	Mem[00000000100c1410] = dbe46125, %f31 = be83677d
	lda	[%i3+%o5]0x80,%f31	! %f31 = dbe46125

p0_label_21:
!	Starting 10 instruction Store Burst
!	%f22 = d32af055 aaabb72d, Mem[0000000030101410] = 6ec8dd4e 070a6712
	stda	%f22,[%i4+%o5]0x89	! Mem[0000000030101410] = d32af055 aaabb72d
!	Mem[0000000010001414] = 8aaf452d, %l5 = 0000000000007d67, %asi = 80
	swapa	[%i0+0x014]%asi,%l5	! %l5 = 000000008aaf452d
!	%l6 = d37e1dab, %l7 = a774da69, Mem[0000000030001408] = 0e5cdf2e 77b48dc7
	stda	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = d37e1dab a774da69
!	%l7 = 6b5fdbd9a774da69, Mem[0000000010041408] = 302184c4
	stwa	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = a774da69
!	Mem[0000000010141410] = 68d5dd21, %l1 = 000000000000ff00
	swapa	[%i5+%o5]0x88,%l1	! %l1 = 0000000068d5dd21
!	Mem[0000000010141408] = 5e58ce56, %l5 = 000000008aaf452d
	ldstuba	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000056
!	%l1 = 0000000068d5dd21, Mem[000000001014142c] = 0fe2c42f
	stb	%l1,[%i5+0x02c]		! Mem[000000001014142c] = 21e2c42f
!	%l1 = 0000000068d5dd21, Mem[000000001008141a] = 2d45af8a
	stb	%l1,[%i2+0x01a]		! Mem[0000000010081418] = 2d45218a
!	%l3 = 000000000084be3c, Mem[0000000010181408] = 7d6783be
	stba	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 3c6783be
!	Mem[0000000010001400] = 40fc624d, %l1 = 0000000068d5dd21
	ldstuba	[%i0+%g0]0x88,%l1	! %l1 = 000000000000004d

p0_label_22:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 594e2e20, %l2 = 00000000202e4e59
	ldswa	[%i5+%g0]0x80,%l2	! %l2 = 00000000594e2e20
!	%l7 = 6b5fdbd9a774da69, imm = 000000000000024b, %l6 = c1a62c4dd37e1dab
	xnor	%l7,0x24b,%l6		! %l6 = 94a02426588b27dd
!	Mem[0000000010181410] = 6cb314c2, %f29 = 244ae865
	lda	[%i6+%o5]0x88,%f29	! %f29 = 6cb314c2
!	Mem[00000000100c1428] = 5c25b1f67153b86f, %l5 = 0000000000000056, %asi = 80
	ldxa	[%i3+0x028]%asi,%l5	! %l5 = 5c25b1f67153b86f
!	Mem[00000000100c1408] = 174c519e, %l5 = 5c25b1f67153b86f
	lduha	[%i3+%o4]0x80,%l5	! %l5 = 000000000000174c
!	Mem[00000000300c1410] = 6fea417c, %l5 = 000000000000174c
	ldsba	[%i3+%o5]0x81,%l5	! %l5 = 000000000000006f
!	%l7 = 6b5fdbd9a774da69, imm = 0000000000000edf, %l5 = 000000000000006f
	or	%l7,0xedf,%l5		! %l5 = 6b5fdbd9a774deff
!	Mem[0000000030041408] = 8e922e71, %l0 = 0000000000004cff
	ldsha	[%i1+%o4]0x89,%l0	! %l0 = 0000000000002e71
!	Mem[00000000300c1400] = 0808e003, %l1 = 000000000000004d
	ldsha	[%i3+%g0]0x89,%l1	! %l1 = ffffffffffffe003
!	Code Fragment 4, seed = 210537
p0_fragment_3:
!	%l0 = 0000000000002e71
	setx	0xf1a831263dcd7dde,%g7,%l0 ! %l0 = f1a831263dcd7dde
!	%l1 = ffffffffffffe003
	setx	0x89e5138000912489,%g7,%l1 ! %l1 = 89e5138000912489
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f1a831263dcd7dde
	setx	0x18febbf84e09a744,%g7,%l0 ! %l0 = 18febbf84e09a744
!	%l1 = 89e5138000912489
	setx	0xbc6b9b26ee5d890f,%g7,%l1 ! %l1 = bc6b9b26ee5d890f
p0_fragment_3_end:

p0_label_23:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1430] = 208fc564, %l5 = 00000000a774deff
	swap	[%i3+0x030],%l5		! %l5 = 00000000208fc564
!	%f14 = 1f90d592 1b955c1b, %l1 = bc6b9b26ee5d890f
!	Mem[0000000010141438] = 4caad3822361806c
	add	%i5,0x038,%g1
	stda	%f14,[%g1+%l1]ASI_PST8_P ! Mem[0000000010141438] = 4caad3821b955c1b
!	Mem[00000000100c1430] = a774deff, %l2 = 594e2e20, %l3 = 0084be3c
	add	%i3,0x30,%g1
	casa	[%g1]0x80,%l2,%l3	! %l3 = 00000000a774deff
!	Mem[000000001008143c] = 5beb30ab, %l0 = 4e09a744, %l5 = 208fc564
	add	%i2,0x3c,%g1
	casa	[%g1]0x80,%l0,%l5	! %l5 = 000000005beb30ab
!	Mem[0000000010101410] = 0d00f148, %l5 = 000000005beb30ab
	ldstuba	[%i4+%o5]0x80,%l5	! %l5 = 000000000000000d
!	%l4 = 00000000000000ff, Mem[00000000218001c0] = 0c444af0
	stb	%l4,[%o3+0x1c0]		! Mem[00000000218001c0] = ff444af0
!	%f30 = 17862443 dbe46125, %l4 = 00000000000000ff
!	Mem[0000000030181428] = ffba085bc625e34f
	add	%i6,0x028,%g1
	stda	%f30,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030181428] = 2561e4db43248617
!	%f4  = 7c40e49c 5fb540bd, Mem[0000000030101410] = aaabb72d d32af055
	stda	%f4 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 7c40e49c 5fb540bd
!	Mem[0000000030141400] = 5c0e9405, %l6 = 00000000588b27dd
	swapa	[%i5+%g0]0x81,%l6	! %l6 = 000000005c0e9405
!	%f2  = 6856aa08 75cf9cf9, %l4 = 00000000000000ff
!	Mem[0000000010001400] = ff62fc4068ede351
	stda	%f2,[%i0+%l4]ASI_PST8_PL ! Mem[0000000010001400] = f99ccf7508aa5668

p0_label_24:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 2561e4db, %l5 = 000000000000000d
	lduwa	[%i3+%o5]0x88,%l5	! %l5 = 000000002561e4db
!	Mem[00000000211c0000] = ffff8970, %l0 = 18febbf84e09a744
	lduh	[%o2+%g0],%l0		! %l0 = 000000000000ffff
!	Mem[0000000030001410] = 34000000, %l7 = 6b5fdbd9a774da69
	lduha	[%i0+%o5]0x81,%l7	! %l7 = 0000000000003400
!	Mem[00000000300c1410] = 7c41ea6f, %l5 = 000000002561e4db
	lduba	[%i3+%o5]0x89,%l5	! %l5 = 000000000000006f
!	Mem[0000000010101418] = 7a5e924a4dcad2f3, %l0 = 000000000000ffff
	ldx	[%i4+0x018],%l0		! %l0 = 7a5e924a4dcad2f3
!	Mem[00000000300c1410] = 7c41ea6f, %l6 = 000000005c0e9405
	lduwa	[%i3+%o5]0x89,%l6	! %l6 = 000000007c41ea6f
!	Mem[00000000300c1400] = 0808e003, %l2 = 00000000594e2e20
	lduha	[%i3+%g0]0x89,%l2	! %l2 = 000000000000e003
!	Mem[0000000030101408] = 4e644cae, %l6 = 000000007c41ea6f
	lduwa	[%i4+%o4]0x81,%l6	! %l6 = 000000004e644cae
!	Mem[0000000030101410] = 7c40e49c5fb540bd, %l1 = bc6b9b26ee5d890f
	ldxa	[%i4+%o5]0x89,%l1	! %l1 = 7c40e49c5fb540bd
!	Mem[0000000010141410] = 0000ff00, %l1 = 7c40e49c5fb540bd
	lduwa	[%i5+%o5]0x88,%l1	! %l1 = 000000000000ff00

p0_label_25:
!	Starting 10 instruction Store Burst
!	%l0 = 4dcad2f3, %l1 = 0000ff00, Mem[0000000010101400] = 18d41735 d14e8d35
	stda	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 4dcad2f3 0000ff00
!	%l0 = 7a5e924a4dcad2f3, Mem[0000000010141408] = ffce585e
	stba	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = f3ce585e
!	Mem[0000000030141400] = 588b27dd 00000000 34c3c00e 7465df27
!	%f0  = 03e00808 2fb9a801 6856aa08 75cf9cf9
!	%f4  = 7c40e49c 5fb540bd 2f00a3ba 6c22f8a3
!	%f8  = a151e168 d08e9516 51e3ed68 40fc624d
!	%f12 = 25614cff 4eddc86e 1f90d592 1b955c1b
	stda	%f0 ,[%i5+%g0]ASI_BLK_SL	! Block Store to 0000000030141400
!	Mem[0000000010181420] = 53991c18, %l7 = 0000000000003400, %asi = 80
	swapa	[%i6+0x020]%asi,%l7	! %l7 = 0000000053991c18
!	Mem[000000001010142c] = 00000037, %l6 = 000000004e644cae, %asi = 80
	swapa	[%i4+0x02c]%asi,%l6	! %l6 = 0000000000000037
!	%l3 = 00000000a774deff, Mem[000000001018140f] = 43248617, %asi = 80
	stba	%l3,[%i6+0x00f]%asi	! Mem[000000001018140c] = 432486ff
!	Mem[0000000010181400] = 00000000, %l7 = 0000000053991c18
	ldstuba	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = 244ae865, %l3 = 00000000a774deff
	swapa	[%i2+%o4]0x80,%l3	! %l3 = 00000000244ae865
!	Mem[0000000010101410] = 48f100ff, %l3 = 00000000244ae865
	swapa	[%i4+%o5]0x88,%l3	! %l3 = 0000000048f100ff
!	%l6 = 00000037, %l7 = 00000000, Mem[0000000030001400] = ab1d7ed3 4d2ca6c1
	stda	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000037 00000000

p0_label_26:
!	Starting 10 instruction Load Burst
!	Mem[000000001010142a] = 50571956, %l2 = 000000000000e003
	ldub	[%i4+0x02a],%l2		! %l2 = 0000000000000019
!	Mem[0000000030081400] = 3007df17, %l1 = 000000000000ff00
	ldsha	[%i2+%g0]0x89,%l1	! %l1 = ffffffffffffdf17
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000010141408] = f3ce585e, %l3 = 0000000048f100ff
	ldsba	[%i5+%o4]0x80,%l3	! %l3 = fffffffffffffff3
!	Mem[0000000010041408] = 69da74a7, %l4 = 00000000000000ff
	lduwa	[%i1+%o4]0x88,%l4	! %l4 = 0000000069da74a7
!	Mem[00000000211c0001] = ffff8970, %l5 = 000000000000006f, %asi = 80
	lduba	[%o2+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041400] = 3cbe8400, %l7 = 0000000000000000
	ldswa	[%i1+%g0]0x88,%l7	! %l7 = 000000003cbe8400
!	Mem[0000000010081406] = 1e953911, %l6 = 0000000000000037, %asi = 80
	lduba	[%i2+0x006]%asi,%l6	! %l6 = 0000000000000039
!	Mem[0000000030141400] = 2fb9a801, %l5 = 00000000000000ff
	lduba	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000001
!	Mem[0000000030001408] = 69da74a7ab1d7ed3, %f12 = 25614cff 4eddc86e
	ldda	[%i0+%o4]0x89,%f12	! %f12 = 69da74a7 ab1d7ed3
!	Mem[0000000010141400] = 594e2e20, %l7 = 000000003cbe8400
	ldsha	[%i5+%g0]0x80,%l7	! %l7 = 000000000000594e

p0_label_27:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = ffde74a7, %l6 = 0000000000000039
	ldstuba	[%i2+%o4]0x88,%l6	! %l6 = 00000000000000a7
!	Mem[0000000010041400] = 3cbe8400, %l5 = 0000000000000001
	ldstuba	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000021800141] = 4d177290, %l1 = ffffffffffffdf17
	ldstub	[%o3+0x141],%l1		! %l1 = 0000000000000017
!	%l0 = 7a5e924a4dcad2f3, Mem[0000000030001410] = 34000000
	stwa	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 4dcad2f3
!	Mem[0000000010081410] = 4fe325c6, %l3 = 00000000fffffff3
	swapa	[%i2+%o5]0x80,%l3	! %l3 = 000000004fe325c6
!	%l1 = 0000000000000017, Mem[0000000030181400] = 2fb9a801
	stwa	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000017
!	Mem[0000000030081410] = 202e4e59, %l6 = 00000000000000a7
	swapa	[%i2+%o5]0x81,%l6	! %l6 = 00000000202e4e59
!	Mem[00000000201c0000] = ffff9ee0, %l4 = 0000000069da74a7
	ldstub	[%o0+%g0],%l4		! %l4 = 00000000000000ff
!	%f20 = 6300f148 68d5dd21, %l2 = 0000000000000019
!	Mem[0000000030181420] = 16958ed068e151a1
	add	%i6,0x020,%g1
	stda	%f20,[%g1+%l2]ASI_PST8_S ! Mem[0000000030181420] = 16958e4868e15121
!	Mem[00000000100c1400] = 173500ff, %l7 = 000000000000594e
	ldstuba	[%i3+%g0]0x88,%l7	! %l7 = 00000000000000ff

p0_label_28:
!	Starting 10 instruction Load Burst
!	%l5 = 0000000000000000, %l4 = 00000000000000ff, %l4  = 00000000000000ff
	mulx	%l5,%l4,%l4		! %l4 = 0000000000000000
!	Mem[0000000030181410] = 5fb540bd, %l7 = 00000000000000ff
	ldsba	[%i6+%o5]0x89,%l7	! %l7 = ffffffffffffffbd
!	Mem[0000000030181408] = f99ccf75, %l3 = 000000004fe325c6
	ldswa	[%i6+%o4]0x81,%l3	! %l3 = fffffffff99ccf75
!	Mem[0000000010041424] = 5fb540bd, %l3 = fffffffff99ccf75, %asi = 80
	ldswa	[%i1+0x024]%asi,%l3	! %l3 = 000000005fb540bd
!	Mem[0000000010181408] = ff862443 be83673c, %l4 = 00000000, %l5 = 00000000
	ldda	[%i6+%o4]0x88,%l4	! %l4 = 00000000be83673c 00000000ff862443
!	Mem[0000000030041410] = 2361806c, %l4 = 00000000be83673c
	ldsha	[%i1+%o5]0x81,%l4	! %l4 = 0000000000002361
!	Mem[0000000030181410] = 5fb540bd, %l7 = ffffffffffffffbd
	ldsha	[%i6+%o5]0x89,%l7	! %l7 = 00000000000040bd
!	Mem[0000000010101410] = 244ae865, %l6 = 00000000202e4e59
	ldsba	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000065
!	Mem[00000000100c1408] = 174c519e670bf077, %f0  = 03e00808 2fb9a801, %asi = 80
	ldda	[%i3+0x008]%asi,%f0 	! %f0  = 174c519e 670bf077
!	Mem[0000000010001408] = 46000000, %l4 = 0000000000002361
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000000

p0_label_29:
!	Starting 10 instruction Store Burst
!	%f30 = 17862443 dbe46125, Mem[0000000030181400] = 17000000 0808e003
	stda	%f30,[%i6+%g0]0x81	! Mem[0000000030181400] = 17862443 dbe46125
!	%l2 = 00000019, %l3 = 5fb540bd, Mem[0000000010001400] = 75cf9cf9 6856aa08
	stda	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000019 5fb540bd
!	%f10 = 51e3ed68, Mem[00000000300c1408] = aa1f494e
	sta	%f10,[%i3+%o4]0x81	! Mem[00000000300c1408] = 51e3ed68
!	%f14 = 1f90d592 1b955c1b, %l6 = 0000000000000065
!	Mem[00000000300c1430] = 7ed54c946412add5
	add	%i3,0x030,%g1
	stda	%f14,[%g1+%l6]ASI_PST32_S ! Mem[00000000300c1430] = 7ed54c941b955c1b
!	Mem[0000000030141408] = f99ccf75, %l0 = 000000004dcad2f3
	swapa	[%i5+%o4]0x81,%l0	! %l0 = 00000000f99ccf75
!	%f2  = 6856aa08 75cf9cf9, %l1 = 0000000000000017
!	Mem[0000000030141410] = bd40b55f9ce4407c
	add	%i5,0x010,%g1
	stda	%f2,[%g1+%l1]ASI_PST8_S ! Mem[0000000030141410] = bd40b5089ccf9cf9
!	%l7 = 00000000000040bd, Mem[00000000100c1410] = dbe46125
	stba	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = bde46125
!	%f28 = 21ddd568, Mem[0000000030101400] = f0c703ff
	sta	%f28,[%i4+%g0]0x89	! Mem[0000000030101400] = 21ddd568
!	Mem[0000000010081400] = 7d800d00, %l3 = 000000005fb540bd
	swapa	[%i2+%g0]0x80,%l3	! %l3 = 000000007d800d00
!	%f26 = 2fc4e20f b6f0c329, %l4 = 0000000000000000
!	Mem[00000000300c1428] = 3b7077a628d4195f
	add	%i3,0x028,%g1
	stda	%f26,[%g1+%l4]ASI_PST8_SL ! Mem[00000000300c1428] = 3b7077a628d4195f

p0_label_30:
!	Starting 10 instruction Load Burst
!	%f4  = 7c40e49c, %f5  = 5fb540bd, %f27 = b6f0c329
	fdivs	%f4 ,%f5 ,%f27		! %f27 = 5c08385f
!	Mem[0000000010081410] = f3ffffff, %l1 = 0000000000000017
	lduwa	[%i2+%o5]0x88,%l1	! %l1 = 00000000f3ffffff
!	Mem[0000000030141400] = 03e008082fb9a801, %l2 = 0000000000000019
	ldxa	[%i5+%g0]0x89,%l2	! %l2 = 03e008082fb9a801
!	Mem[00000000201c0000] = ffff9ee0, %l0 = 00000000f99ccf75, %asi = 80
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1420] = 006a76f875476029, %f24 = ff5b3f39 b89f811f
	ldd	[%i3+0x020],%f24	! %f24 = 006a76f8 75476029
!	Mem[0000000030101400] = 68d5dd21 7df07241, %l6 = 00000065, %l7 = 000040bd
	ldda	[%i4+%g0]0x81,%l6	! %l6 = 0000000068d5dd21 000000007df07241
!	Mem[0000000030081410] = a7000000, %l7 = 000000007df07241
	lduha	[%i2+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001408] = ff000046, %l7 = 0000000000000000
	ldswa	[%i0+%o4]0x80,%l7	! %l7 = ffffffffff000046
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010041400] = ff84be3c 607dbdff a774da69 f85cee8f
!	Mem[0000000010041410] = ff5b3f39 b89f811f 0106d8ba 172b39a3
!	Mem[0000000010041420] = 7c40e49c 5fb540bd 7e7b6ac6 75d0cbff
!	Mem[0000000010041430] = 00000000 36dc4d75 317693aa a08cd43b
	ldda	[%i1+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	Mem[0000000030141400] = 2fb9a801, %l2 = 03e008082fb9a801
	ldsha	[%i5+%g0]0x89,%l2	! %l2 = ffffffffffffa801

p0_label_31:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = bd40b55f, %l2 = 00000000ffffa801
	swapa	[%i2+%g0]0x88,%l2	! %l2 = 00000000bd40b55f
!	Mem[00000000100c1400] = ff003517 45eb2bf1 174c519e 670bf077
!	%f16 = ff84be3c 607dbdff a774da69 f85cee8f
!	%f20 = ff5b3f39 b89f811f 0106d8ba 172b39a3
!	%f24 = 7c40e49c 5fb540bd 7e7b6ac6 75d0cbff
!	%f28 = 00000000 36dc4d75 317693aa a08cd43b
	stda	%f16,[%i3+%g0]ASI_BLK_AIUPL	! Block Store to 00000000100c1400
!	%f27 = 75d0cbff, %f12 = 69da74a7, %f8  = a151e168
	fmuls	%f27,%f12,%f8 		! %f8  = 7f800000
!	%l5 = 00000000ff862443, Mem[0000000030041400] = 16958ed0
	stwa	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = ff862443
!	%l3 = 000000007d800d00, %l3 = 000000007d800d00, %l2 = 00000000bd40b55f
	and	%l3,%l3,%l2		! %l2 = 000000007d800d00
!	%l7 = ffffffffff000046, Mem[0000000030101410] = bd40b55f
	stha	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 0046b55f
!	Mem[0000000030141410] = bd40b508, %l4 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l4	! %l4 = 00000000bd40b508
!	Mem[0000000010141400] = 594e2e20, %l0 = 00000000ffffffff
	swapa	[%i5+%g0]0x80,%l0	! %l0 = 00000000594e2e20
	membar	#Sync			! Added by membar checker (8)
!	Mem[00000000100c1408] = 8fee5cf8, %l5 = 00000000ff862443
	swapa	[%i3+%o4]0x80,%l5	! %l5 = 000000008fee5cf8
!	%l0 = 594e2e20, %l1 = f3ffffff, Mem[00000000100c1410] = b89f811f ff5b3f39
	stda	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 594e2e20 f3ffffff

p0_label_32:
!	Starting 10 instruction Load Burst
!	%f23 = 172b39a3, %f9  = d08e9516
	fcmps	%fcc2,%f23,%f9 		! %fcc2 = 2
!	Mem[0000000030141408] = 6856aa08f3d2ca4d, %f12 = 69da74a7 ab1d7ed3
	ldda	[%i5+%o4]0x89,%f12	! %f12 = 6856aa08 f3d2ca4d
!	Mem[00000000100c1410] = 202e4e59, %l7 = ffffffffff000046
	lduwa	[%i3+%o5]0x80,%l7	! %l7 = 00000000202e4e59
!	Mem[0000000010001400] = 19000000bd40b55f, %f8  = 7f800000 d08e9516
	ldda	[%i0+%g0]0x80,%f8 	! %f8  = 19000000 bd40b55f
!	Mem[0000000010081410] = f3ffffff, %l0 = 00000000594e2e20
	ldsha	[%i2+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	%l6 = 0000000068d5dd21, %l4 = 00000000bd40b508, %l1 = 00000000f3ffffff
	and	%l6,%l4,%l1		! %l1 = 0000000028409500
!	Mem[0000000010081410] = ffba085bf3ffffff, %l6 = 0000000068d5dd21
	ldxa	[%i2+%o5]0x88,%l6	! %l6 = ffba085bf3ffffff
!	Mem[0000000030181400] = 43248617, %f26 = 7e7b6ac6
	lda	[%i6+%g0]0x89,%f26	! %f26 = 43248617
!	Mem[0000000030181410] = 5fb540bd, %l3 = 000000007d800d00
	ldswa	[%i6+%o5]0x89,%l3	! %l3 = 000000005fb540bd
!	Mem[0000000010101402] = f3d2ca4d, %l3 = 000000005fb540bd, %asi = 80
	lduha	[%i4+0x002]%asi,%l3	! %l3 = 000000000000ca4d

p0_label_33:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 51e3ed68, %l5 = 000000008fee5cf8
	swapa	[%i3+%o4]0x81,%l5	! %l5 = 0000000051e3ed68
!	%l0 = ffffffffffffffff, Mem[0000000020800001] = ffff7110, %asi = 80
	stba	%l0,[%o1+0x001]%asi	! Mem[0000000020800000] = ffff7110
!	Mem[0000000010041400] = ff84be3c, %l2 = 000000007d800d00
	swapa	[%i1+%g0]0x80,%l2	! %l2 = 00000000ff84be3c
!	%f8  = 19000000, Mem[0000000030141408] = f3d2ca4d
	sta	%f8 ,[%i5+%o4]0x89	! Mem[0000000030141408] = 19000000
!	%f0  = 174c519e 670bf077, %l5 = 0000000051e3ed68
!	Mem[0000000030001410] = 4dcad2f36ec8dd4e
	add	%i0,0x010,%g1
	stda	%f0,[%g1+%l5]ASI_PST16_S ! Mem[0000000030001410] = 174cd2f36ec8dd4e
!	Mem[0000000010041400] = 7d800d00, %l1 = 0000000028409500
	swapa	[%i1+%g0]0x80,%l1	! %l1 = 000000007d800d00
!	Mem[0000000030041408] = 8e922e71, %l1 = 000000007d800d00
	swapa	[%i1+%o4]0x89,%l1	! %l1 = 000000008e922e71
!	Mem[0000000010181400] = ff000000, %l5 = 0000000051e3ed68
	ldstuba	[%i6+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181400] = ff000000, %l6 = 00000000f3ffffff
	swapa	[%i6+%g0]0x80,%l6	! %l6 = 00000000ff000000
!	%f10 = 51e3ed68 40fc624d, %l6 = 00000000ff000000
!	Mem[0000000030001438] = 2da7b5522561e4db
	add	%i0,0x038,%g1
	stda	%f10,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030001438] = 2da7b5522561e4db

p0_label_34:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 7c41ea6f, %l7 = 00000000202e4e59
	lduha	[%i3+%o5]0x89,%l7	! %l7 = 000000000000ea6f
!	%f14 = 1f90d592, %f28 = 00000000, %f15 = 1b955c1b
	fadds	%f14,%f28,%f15		! %f15 = 1f90d592
!	Mem[0000000010181400] = f3ffffff 53013639, %l6 = ff000000, %l7 = 0000ea6f
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 00000000f3ffffff 0000000053013639
!	%f0  = 174c519e, %f18 = a774da69, %f4  = 7c40e49c 5fb540bd
	fsmuld	%f0 ,%f18,%f4 		! %f4  = b7e86d83 7cc0b9c0
!	Mem[0000000030081410] = a7000000, %l1 = 000000008e922e71
	ldswa	[%i2+%o5]0x89,%l1	! %l1 = ffffffffa7000000
!	Mem[00000000100c1439] = 3bd48ca0, %l0 = ffffffffffffffff, %asi = 80
	ldsba	[%i3+0x039]%asi,%l0	! %l0 = ffffffffffffffd4
!	Mem[000000001014141a] = 2db7abaa, %l5 = 00000000000000ff, %asi = 80
	lduha	[%i5+0x01a]%asi,%l5	! %l5 = 000000000000abaa
!	Mem[0000000010141421] = 1f819fb8, %l3 = 000000000000ca4d
	ldub	[%i5+0x021],%l3		! %l3 = 0000000000000081
!	%l2 = 00000000ff84be3c, %l4 = 00000000bd40b508, %l7 = 0000000053013639
	sdivx	%l2,%l4,%l7		! %l7 = 0000000000000001
!	Mem[0000000030181408] = 75cf9cf9, %l1 = ffffffffa7000000
	lduba	[%i6+%o4]0x89,%l1	! %l1 = 00000000000000f9

p0_label_35:
!	Starting 10 instruction Store Burst
!	%l2 = ff84be3c, %l3 = 00000081, Mem[0000000010141400] = ffffffff b1a17334
	stda	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = ff84be3c 00000081
!	%l7 = 0000000000000001, %l1 = 00000000000000f9, %l5 = 000000000000abaa
	subc	%l7,%l1,%l5		! %l5 = ffffffffffffff08
!	%l4 = 00000000bd40b508, Mem[0000000010001410] = 677d000025614cff
	stxa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000bd40b508
!	Mem[0000000010141410] = 0000ff00, %l5 = ffffffffffffff08
	ldstuba	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000000
!	%f2  = 6856aa08 75cf9cf9, Mem[0000000010141410] = ffff0000 48f10063
	stda	%f2 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 6856aa08 75cf9cf9
!	Mem[00000000300c1400] = 0808e003, %l0 = ffffffffffffffd4
	ldstuba	[%i3+%g0]0x89,%l0	! %l0 = 0000000000000003
!	Mem[0000000010081410] = f3ffffff, %l1 = 00000000000000f9
	ldstuba	[%i2+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Code Fragment 4, seed = 776868
p0_fragment_4:
!	%l0 = 0000000000000003
	setx	0xc94d073d87288706,%g7,%l0 ! %l0 = c94d073d87288706
!	%l1 = 00000000000000ff
	setx	0x51bd56b46e930531,%g7,%l1 ! %l1 = 51bd56b46e930531
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c94d073d87288706
	setx	0x710b041aea70c76c,%g7,%l0 ! %l0 = 710b041aea70c76c
!	%l1 = 51bd56b46e930531
	setx	0xc282134c44bbd0b7,%g7,%l1 ! %l1 = c282134c44bbd0b7
p0_fragment_4_end:
!	%l1 = c282134c44bbd0b7, Mem[0000000030101408] = 47d51370ae4c644e
	stxa	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = c282134c44bbd0b7
!	Mem[0000000030141410] = 00000000, %l7 = 0000000000000001
	ldstuba	[%i5+%o5]0x89,%l7	! %l7 = 0000000000000000

p0_label_36:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ff000000 9ccf9cf9, %l4 = bd40b508, %l5 = 00000000
	ldda	[%i5+%o5]0x81,%l4	! %l4 = 00000000ff000000 000000009ccf9cf9
!	Mem[0000000010041408] = a774da69, %l7 = 0000000000000000
	ldub	[%i1+%o4],%l7		! %l7 = 00000000000000a7
!	Mem[0000000010041408] = a774da69, %l5 = 000000009ccf9cf9
	ldsha	[%i1+%o4]0x80,%l5	! %l5 = ffffffffffffa774
!	Mem[0000000030001410] = 174cd2f3, %l1 = c282134c44bbd0b7
	lduha	[%i0+%o5]0x81,%l1	! %l1 = 000000000000174c
!	Mem[0000000010101428] = 50571956, %l0 = 710b041aea70c76c
	ldsh	[%i4+0x028],%l0		! %l0 = 0000000000005057
!	Mem[0000000010041408] = a774da69 f85cee8f, %l6 = f3ffffff, %l7 = 000000a7
	ldda	[%i1+%o4]0x80,%l6	! %l6 = 00000000a774da69 00000000f85cee8f
!	Mem[0000000010101408] = 5772d20d 08aa0000, %l2 = ff84be3c, %l3 = 00000081
	ldda	[%i4+%o4]0x88,%l2	! %l2 = 0000000008aa0000 000000005772d20d
!	Mem[0000000030141408] = 19000000, %l4 = 00000000ff000000
	lduwa	[%i5+%o4]0x89,%l4	! %l4 = 0000000019000000
!	Mem[0000000010141408] = 5e58cef3, %l4 = 0000000019000000
	ldsha	[%i5+%o4]0x88,%l4	! %l4 = ffffffffffffcef3
!	Mem[0000000010101410] = 244ae865, %l3 = 000000005772d20d
	lduwa	[%i4+%o5]0x88,%l3	! %l3 = 00000000244ae865

p0_label_37:
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffa774, Mem[0000000010181418] = 5fb9350a, %asi = 80
	stha	%l5,[%i6+0x018]%asi	! Mem[0000000010181418] = a774350a
!	%l7 = 00000000f85cee8f, immd = ffffff4d, %y  = 00000037
	umul	%l7,-0x0b3,%l5		! %l5 = f85cede157053203, %y = f85cede1
!	Mem[0000000010141408] = 5e58cef3, %l4 = ffffffffffffcef3
	ldstuba	[%i5+%o4]0x88,%l4	! %l4 = 00000000000000f3
!	%l0 = 0000000000005057, imm = fffffffffffff665, %l7 = 00000000f85cee8f
	or	%l0,-0x99b,%l7		! %l7 = fffffffffffff677
!	%f16 = ff84be3c, Mem[0000000030081400] = 3007df17
	sta	%f16,[%i2+%g0]0x89	! Mem[0000000030081400] = ff84be3c
!	Mem[0000000010181408] = 3c6783be, %l1 = 000000000000174c
	swapa	[%i6+%o4]0x80,%l1	! %l1 = 000000003c6783be
!	Mem[0000000010081419] = 2d45218a, %l7 = fffffffffffff677
	ldstuba	[%i2+0x019]%asi,%l7	! %l7 = 0000000000000045
!	Mem[0000000030141400] = 01a8b92f 0808e003 00000019 08aa5668
!	%f0  = 174c519e 670bf077 6856aa08 75cf9cf9
!	%f4  = b7e86d83 7cc0b9c0 2f00a3ba 6c22f8a3
!	%f8  = 19000000 bd40b55f 51e3ed68 40fc624d
!	%f12 = 6856aa08 f3d2ca4d 1f90d592 1f90d592
	stda	%f0 ,[%i5+%g0]ASI_BLK_SL	! Block Store to 0000000030141400
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000010141428] = 29c3f0b6, %l3 = 244ae865, %l6 = a774da69
	add	%i5,0x28,%g1
	casa	[%g1]0x80,%l3,%l6	! %l6 = 0000000029c3f0b6
!	%l6 = 0000000029c3f0b6, Mem[0000000021800100] = 7a6ec060, %asi = 80
	stha	%l6,[%o3+0x100]%asi	! Mem[0000000021800100] = f0b6c060

p0_label_38:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = f3ffffff 53013639 0000174c 432486ff
!	Mem[0000000010181410] = c214b36c 79f2524d a774350a 561632b3
!	Mem[0000000010181420] = 00003400 00e1bcc9 63843816 717dd20f
!	Mem[0000000010181430] = 0bc4f484 37520005 6856aa08 75cf9cf9
	ldda	[%i6+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010181400
!	Mem[0000000010181400] = f3ffffff53013639, %f6  = 2f00a3ba 6c22f8a3
	ldda	[%i6+%g0]0x80,%f6 	! %f6  = f3ffffff 53013639
!	Mem[00000000300c1400] = 0808e0ff, %l0 = 0000000000005057
	ldsha	[%i3+%g0]0x89,%l0	! %l0 = ffffffffffffe0ff
!	%l7 = 0000000000000045, immd = ffffff23, %y  = f85cede1
	smul	%l7,-0x0dd,%l7		! %l7 = ffffffffffffc46f, %y = ffffffff
!	Mem[0000000030041410] = 6c806123, %l0 = ffffffffffffe0ff
	ldsba	[%i1+%o5]0x89,%l0	! %l0 = 0000000000000023
!	Mem[0000000030001410] = 174cd2f3, %l4 = 00000000000000f3
	ldsha	[%i0+%o5]0x81,%l4	! %l4 = 000000000000174c
!	%l5 = f85cede157053203, %l0 = 0000000000000023, %l6 = 0000000029c3f0b6
	xor	%l5,%l0,%l6		! %l6 = f85cede157053220
!	Mem[0000000010141400] = ff84be3c, %l0 = 0000000000000023
	ldswa	[%i5+%g0]0x88,%l0	! %l0 = ffffffffff84be3c
!	Code Fragment 3, seed = 605519
p0_fragment_5:
!	%l0 = ffffffffff84be3c
	setx	0x5606ba0c6c170cae,%g7,%l0 ! %l0 = 5606ba0c6c170cae
!	%l1 = 000000003c6783be
	setx	0x095be5e3c6e9ba59,%g7,%l1 ! %l1 = 095be5e3c6e9ba59
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5606ba0c6c170cae
	setx	0xe4f7a152a10e9414,%g7,%l0 ! %l0 = e4f7a152a10e9414
!	%l1 = 095be5e3c6e9ba59
	setx	0xe4fe4e30e66b1cdf,%g7,%l1 ! %l1 = e4fe4e30e66b1cdf
p0_fragment_5_end:
!	Mem[0000000030041410] = 2361806c, %l2 = 0000000008aa0000
	lduba	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000023

p0_label_39:
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000174c, Mem[0000000030101400] = 21ddd568
	stwa	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000174c
!	%l7 = ffffffffffffc46f, Mem[00000000100c1400] = ffbd7d60
	stha	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = c46f7d60
!	Mem[0000000030141400] = 670bf077, %l7 = ffffffffffffc46f
	ldstuba	[%i5+%g0]0x89,%l7	! %l7 = 0000000000000077
!	%l5 = f85cede157053203, Mem[0000000010081410] = f3ffffff
	stha	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = f3ff3203
!	%l4 = 000000000000174c, Mem[00000000201c0000] = ffff9ee0, %asi = 80
	stha	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 174c9ee0
!	%l2 = 0000000000000023, Mem[0000000030141408] = f99ccf7508aa5668
	stxa	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000000000000023
!	%l7 = 0000000000000077, immd = fffffffffffff425, %l3  = 00000000244ae865
	mulx	%l7,-0xbdb,%l3		! %l3 = fffffffffffa7d33
!	Mem[0000000010081438] = 1d9ca36e5beb30ab, %l6 = f85cede157053220, %l5 = f85cede157053203
	add	%i2,0x38,%g1
	casxa	[%g1]0x80,%l6,%l5	! %l5 = 1d9ca36e5beb30ab
!	%l6 = f85cede157053220, Mem[0000000010141432] = 65e84a24
	sth	%l6,[%i5+0x032]		! Mem[0000000010141430] = 65e83220
!	%f20 = 4d52f279 6cb314c2, Mem[0000000030141410] = c0b9c07c 836de8b7
	stda	%f20,[%i5+%o5]0x81	! Mem[0000000030141410] = 4d52f279 6cb314c2

p0_label_40:
!	Starting 10 instruction Load Burst
!	Mem[000000001014142c] = 21e2c42f, %l7 = 0000000000000077
	ldsh	[%i5+0x02c],%l7		! %l7 = 00000000000021e2
!	Mem[0000000030181400] = 17862443, %l2 = 0000000000000023
	ldsba	[%i6+%g0]0x81,%l2	! %l2 = 0000000000000017
!	Mem[00000000100c1410] = f3ffffff594e2e20, %l3 = fffffffffffa7d33
	ldxa	[%i3+%o5]0x88,%l3	! %l3 = f3ffffff594e2e20
!	%l6 = f85cede157053220, imm = 0000000000000cc7, %l2 = 0000000000000017
	andn	%l6,0xcc7,%l2		! %l2 = f85cede157053220
!	Mem[0000000030181400] = 17862443 dbe46125, %l0 = a10e9414, %l1 = e66b1cdf
	ldda	[%i6+%g0]0x81,%l0	! %l0 = 0000000017862443 00000000dbe46125
!	Mem[00000000300c1400] = 0808e0ff, %l6 = f85cede157053220
	ldsha	[%i3+%g0]0x89,%l6	! %l6 = ffffffffffffe0ff
!	Mem[00000000100c1418] = a3392b17 bad80601, %l2 = 57053220, %l3 = 594e2e20, %asi = 80
	ldda	[%i3+0x018]%asi,%l2	! %l2 = 00000000a3392b17 00000000bad80601
!	Mem[0000000010041414] = b89f811f, %l7 = 00000000000021e2
	lduw	[%i1+0x014],%l7		! %l7 = 00000000b89f811f
!	Mem[0000000030041408] = 000d807d, %l4 = 000000000000174c
	ldsha	[%i1+%o4]0x81,%l4	! %l4 = 000000000000000d
!	Mem[00000000100c1410] = 594e2e20, %l6 = ffffffffffffe0ff
	lduwa	[%i3+%o5]0x88,%l6	! %l6 = 00000000594e2e20

p0_label_41:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (10)
!	%f2  = 6856aa08, Mem[0000000010181408] = 4c170000
	sta	%f2 ,[%i6+%o4]0x88	! Mem[0000000010181408] = 6856aa08
!	Mem[00000000300c1408] = 8fee5cf8, %l2 = 00000000a3392b17
	ldstuba	[%i3+%o4]0x81,%l2	! %l2 = 000000000000008f
!	%l3 = 00000000bad80601, Mem[00000000218000c0] = 31c08a30
	sth	%l3,[%o3+0x0c0]		! Mem[00000000218000c0] = 06018a30
!	Mem[0000000030181400] = 17862443, %l7 = 00000000b89f811f
	swapa	[%i6+%g0]0x81,%l7	! %l7 = 0000000017862443
!	Mem[0000000030041408] = 000d807d, %l5 = 1d9ca36e5beb30ab
	ldstuba	[%i1+%o4]0x81,%l5	! %l5 = 0000000000000000
!	%l6 = 00000000594e2e20, Mem[0000000030181408] = 75cf9cf9
	stba	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 75cf9c20
!	%f0  = 174c519e 670bf077, Mem[00000000100c1430] = 754ddc36 00000000, %asi = 80
	stda	%f0 ,[%i3+0x030]%asi	! Mem[00000000100c1430] = 174c519e 670bf077
!	%f18 = ff862443, Mem[0000000030081400] = ff84be3c
	sta	%f18,[%i2+%g0]0x89	! Mem[0000000030081400] = ff862443
!	%l5 = 0000000000000000, Mem[0000000030081408] = 5cb1b5ee2a58d187
	stxa	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000000000000
!	Mem[0000000030081408] = 00000000, %l0 = 0000000017862443
	swapa	[%i2+%o4]0x81,%l0	! %l0 = 0000000000000000

p0_label_42:
!	Starting 10 instruction Load Burst
!	Mem[000000001010143c] = 1a6fa86b, %f7  = 53013639
	ld	[%i4+0x03c],%f7 	! %f7 = 1a6fa86b
!	Mem[0000000010181428] = 63843816 717dd20f, %l0 = 00000000, %l1 = dbe46125, %asi = 80
	ldda	[%i6+0x028]%asi,%l0	! %l0 = 0000000063843816 00000000717dd20f
!	Mem[0000000021800001] = 6066cfa0, %l6 = 00000000594e2e20, %asi = 80
	ldsba	[%o3+0x001]%asi,%l6	! %l6 = 0000000000000066
!	Mem[0000000010081428] = 4e17ba96, %f17 = fffffff3
	lda	[%i2+0x028]%asi,%f17	! %f17 = 4e17ba96
!	Mem[00000000201c0000] = 174c9ee0, %l3 = 00000000bad80601, %asi = 80
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 000000000000174c
!	Mem[0000000010041400] = ffbd7d6000954028, %l4 = 000000000000000d
	ldxa	[%i1+%g0]0x88,%l4	! %l4 = ffbd7d6000954028
!	Mem[0000000010041408] = a774da69, %l6 = 0000000000000066
	ldswa	[%i1+%o4]0x80,%l6	! %l6 = ffffffffa774da69
!	Mem[0000000010101408] = 08aa0000, %l3 = 000000000000174c
	ldsha	[%i4+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081400] = 812cee44ff862443, %f16 = 39360153 4e17ba96
	ldda	[%i2+%g0]0x89,%f16	! %f16 = 812cee44 ff862443
!	Mem[0000000010181400] = f3ffffff53013639, %l1 = 00000000717dd20f
	ldxa	[%i6+%g0]0x80,%l1	! %l1 = f3ffffff53013639

p0_label_43:
!	Starting 10 instruction Store Burst
!	%f18 = ff862443 4c170000, %l4 = ffbd7d6000954028
!	Mem[0000000030101420] = 26f15b8832629879
	add	%i4,0x020,%g1
	stda	%f18,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030101420] = 26f15b8832629879
!	%f9  = bd40b55f, %f18 = ff862443, %f9  = bd40b55f
	fdivs	%f9 ,%f18,%f9 		! %f9  = ffc62443
!	Mem[000000001018140c] = 432486ff, %l1 = 0000000053013639
	swap	[%i6+0x00c],%l1		! %l1 = 00000000432486ff
!	%l4 = ffbd7d6000954028, Mem[0000000020800000] = ffff7110, %asi = 80
	stha	%l4,[%o1+0x000]%asi	! Mem[0000000020800000] = 40287110
!	%f24 = c9bce100, %f12 = 6856aa08, %f12 = 6856aa08 f3d2ca4d
	fsmuld	%f24,%f12,%f12		! %f12 = c653cc31 2a210000
!	%l4 = ffbd7d6000954028, Mem[0000000030141408] = 00000000
	stha	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 00004028
!	Mem[0000000021800141] = 4dff7290, %l3 = 0000000000000000
	ldstub	[%o3+0x141],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010141428] = 29c3f0b6, %l0 = 63843816, %l3 = 000000ff
	add	%i5,0x28,%g1
	casa	[%g1]0x80,%l0,%l3	! %l3 = 0000000029c3f0b6
!	%f8  = 19000000 ffc62443, Mem[00000000300c1410] = 7c41ea6f 1d9ea959
	stda	%f8 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = 19000000 ffc62443
!	Mem[0000000021800180] = 7a6aa0c0, %l4 = ffbd7d6000954028
	ldstub	[%o3+0x180],%l4		! %l4 = 000000000000007a

p0_label_44:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 3cbe84ff, %l3 = 0000000029c3f0b6
	ldsha	[%i5+%g0]0x80,%l3	! %l3 = 0000000000003cbe
!	Mem[0000000010041420] = 7c40e49c, %f25 = 00340000
	lda	[%i1+0x020]%asi,%f25	! %f25 = 7c40e49c
!	Mem[0000000030101400] = 4c170000, %l3 = 0000000000003cbe
	ldsba	[%i4+%g0]0x81,%l3	! %l3 = 000000000000004c
!	Mem[0000000010101408] = 0000aa08, %f27 = 16388463
	ld	[%i4+%o4],%f27		! %f27 = 0000aa08
!	Mem[0000000010181415] = 79f2524d, %l5 = 0000000000000000
	ldub	[%i6+0x015],%l5		! %l5 = 00000000000000f2
!	Mem[00000000300c1408] = f85ceeff, %f12 = c653cc31
	lda	[%i3+%o4]0x89,%f12	! %f12 = f85ceeff
!	Mem[0000000030101400] = 0000174c, %l2 = 000000000000008f
	ldswa	[%i4+%g0]0x89,%l2	! %l2 = 000000000000174c
!	Mem[0000000010141408] = ffa4f212 5e58ceff, %l0 = 63843816, %l1 = 432486ff
	ldda	[%i5+%o4]0x88,%l0	! %l0 = 000000005e58ceff 00000000ffa4f212
!	Mem[0000000010101400] = 4dcad2f3, %l4 = 000000000000007a
	ldswa	[%i4+%g0]0x88,%l4	! %l4 = 000000004dcad2f3
!	Mem[0000000030081408] = 17862443, %l2 = 000000000000174c
	lduba	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000017

p0_label_45:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 01a8ffff, %l0 = 000000005e58ceff
	ldstuba	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000001
!	%l6 = a774da69, %l7 = 17862443, Mem[00000000100c1410] = 202e4e59 fffffff3
	stda	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = a774da69 17862443
!	Mem[0000000030041408] = 7d800dff, %l1 = 00000000ffa4f212
	ldstuba	[%i1+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%f29 = 84f4c40b, Mem[00000000100c1408] = ff862443
	sta	%f29,[%i3+%o4]0x80	! Mem[00000000100c1408] = 84f4c40b
!	Mem[00000000300c1408] = f85ceeff, %l4 = 000000004dcad2f3
	ldstuba	[%i3+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%l4 = 00000000000000ff, %l2 = 0000000000000017, %l7 = 0000000017862443
	orn	%l4,%l2,%l7		! %l7 = ffffffffffffffff
!	%l6 = ffffffffa774da69, Mem[0000000010001410] = 08b540bd
	stba	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 69b540bd
!	%l4 = 000000ff, %l5 = 000000f2, Mem[0000000030041410] = 6c806123 5dcc657f
	stda	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff 000000f2
!	Mem[0000000010141400] = ff84be3c, %l4 = 00000000000000ff
	ldstuba	[%i5+%g0]0x88,%l4	! %l4 = 000000000000003c
!	%l2 = 0000000000000017, %l1 = 00000000000000ff, %l6 = ffffffffa774da69
	andn	%l2,%l1,%l6		! %l6 = 0000000000000000

p0_label_46:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 0000174c, %l4 = 000000000000003c
	lduba	[%i4+%g0]0x89,%l4	! %l4 = 000000000000004c
!	%l4 = 000000000000004c, %l4 = 000000000000004c, %l5 = 00000000000000f2
	andn	%l4,%l4,%l5		! %l5 = 0000000000000000
!	Mem[0000000020800000] = 40287110, %l6 = 0000000000000000
	ldsh	[%o1+%g0],%l6		! %l6 = 0000000000004028
!	%l2 = 0000000000000017, imm = 0000000000000805, %l2 = 0000000000000017
	addc	%l2,0x805,%l2		! %l2 = 000000000000081c
!	Mem[0000000030101408] = 44bbd0b7, %l0 = 0000000000000001
	lduwa	[%i4+%o4]0x89,%l0	! %l0 = 0000000044bbd0b7
!	Mem[0000000010041425] = 5fb540bd, %l4 = 000000000000004c
	ldub	[%i1+0x025],%l4		! %l4 = 00000000000000b5
!	Mem[0000000030041400] = ff862443, %l3 = 000000000000004c
	lduha	[%i1+%g0]0x81,%l3	! %l3 = 000000000000ff86
!	Mem[0000000010101408] = 08aa0000, %l0 = 0000000044bbd0b7
	lduha	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1410] = 4324c6ff, %f6  = f3ffffff
	lda	[%i3+%o5]0x81,%f6 	! %f6 = 4324c6ff
!	Mem[0000000030041408] = 7d800dff, %l4 = 00000000000000b5
	lduba	[%i1+%o4]0x89,%l4	! %l4 = 00000000000000ff

p0_label_47:
!	Starting 10 instruction Store Burst
!	%f24 = c9bce100, Mem[0000000010181410] = c214b36c
	sta	%f24,[%i6+%o5]0x80	! Mem[0000000010181410] = c9bce100
!	Mem[00000000218000c1] = 06018a30, %l3 = 000000000000ff86
	ldstuba	[%o3+0x0c1]%asi,%l3	! %l3 = 0000000000000001
!	%l0 = 0000000000000000, Mem[0000000010001430] = 5cd5064463cbb2c5
	stx	%l0,[%i0+0x030]		! Mem[0000000010001430] = 0000000000000000
!	%f17 = ff862443, Mem[0000000030041410] = 000000ff
	sta	%f17,[%i1+%o5]0x89	! Mem[0000000030041410] = ff862443
!	%f28 = 05005237 84f4c40b, Mem[0000000030181400] = b89f811f dbe46125
	stda	%f28,[%i6+%g0]0x81	! Mem[0000000030181400] = 05005237 84f4c40b
!	%l0 = 0000000000000000, Mem[0000000010001408] = ff000046
	stba	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000046
!	%f24 = c9bce100, Mem[0000000010181400] = f3ffffff
	sta	%f24,[%i6+%g0]0x80	! Mem[0000000010181400] = c9bce100
!	%f8  = 19000000, Mem[0000000010141408] = ffce585e
	sta	%f8 ,[%i5+%o4]0x80	! Mem[0000000010141408] = 19000000
!	%l3 = 0000000000000001, Mem[0000000010081410] = 0332fff3
	stba	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = 0132fff3
!	%l6 = 0000000000004028, Mem[0000000010101400] = f3d2ca4d
	stba	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 28d2ca4d

p0_label_48:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 0500523784f4c40b, %l4 = 00000000000000ff
	ldxa	[%i6+%g0]0x81,%l4	! %l4 = 0500523784f4c40b
!	Mem[0000000010001408] = d78aa25d46000000, %f0  = 174c519e 670bf077
	ldda	[%i0+%o4]0x88,%f0 	! %f0  = d78aa25d 46000000
!	Mem[000000001008141c] = 48a23333, %l0 = 0000000000000000
	lduh	[%i2+0x01c],%l0		! %l0 = 00000000000048a2
!	Mem[0000000010001410] = 00000000bd40b569, %f8  = 19000000 ffc62443
	ldda	[%i0+%o5]0x88,%f8 	! %f8  = 00000000 bd40b569
!	Mem[00000000201c0000] = 174c9ee0, %l6 = 0000000000004028
	lduh	[%o0+%g0],%l6		! %l6 = 000000000000174c
!	Mem[0000000010101400] = 28d2ca4d 00ff0000, %l6 = 0000174c, %l7 = ffffffff
	ldd	[%i4+%g0],%l6		! %l6 = 0000000028d2ca4d 0000000000ff0000
!	Mem[0000000030081410] = a7000000, %l2 = 000000000000081c
	lduwa	[%i2+%o5]0x89,%l2	! %l2 = 00000000a7000000
!	Mem[0000000010141418] = 2db7abaa, %l7 = 0000000000ff0000, %asi = 80
	lduwa	[%i5+0x018]%asi,%l7	! %l7 = 000000002db7abaa
!	Mem[0000000030081408] = 0000000043248617, %l1 = 00000000000000ff
	ldxa	[%i2+%o4]0x89,%l1	! %l1 = 0000000043248617
!	Mem[0000000030141400] = 670bf0ff, %f18 = ff862443
	lda	[%i5+%g0]0x89,%f18	! %f18 = 670bf0ff

p0_label_49:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000048a2, Mem[0000000030141408] = 28400000
	stwa	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 000048a2
!	Mem[0000000030041408] = ff0d807d, %l2 = 00000000a7000000
	ldstuba	[%i1+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081410] = 000000a7, %l4 = 0000000084f4c40b
	swapa	[%i2+%o5]0x81,%l4	! %l4 = 00000000000000a7
!	%f24 = c9bce100 7c40e49c, Mem[0000000030181408] = 75cf9c20 6856aa08
	stda	%f24,[%i6+%o4]0x89	! Mem[0000000030181408] = c9bce100 7c40e49c
!	Mem[0000000010141408] = 19000000, %l7 = 000000002db7abaa
	ldstuba	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000019
!	%l5 = 0000000000000000, Mem[0000000010141400] = ff84beff
	stwa	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	Mem[0000000010041408] = a774da69, %l6 = 0000000028d2ca4d
	swapa	[%i1+%o4]0x80,%l6	! %l6 = 00000000a774da69
!	%l2 = 00000000000000ff, Mem[0000000030081408] = 17862443
	stha	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 00ff2443
!	Mem[00000000100c1400] = c46f7d60, %l4 = 00000000000000a7
	ldstub	[%i3+%g0],%l4		! %l4 = 00000000000000c4
!	%l1 = 0000000043248617, Mem[00000000100c1410] = 69da74a7
	stba	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = 69da7417

p0_label_50:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 432486ff 44ee2c81, %l2 = 000000ff, %l3 = 00000001
	ldda	[%i2+%g0]0x81,%l2	! %l2 = 00000000432486ff 0000000044ee2c81
!	Mem[0000000010081410] = 0132fff3, %l6 = 00000000a774da69
	ldsha	[%i2+%o5]0x80,%l6	! %l6 = 0000000000000132
!	Mem[0000000010141408] = 000000ff, %l4 = 00000000000000c4
	lduha	[%i5+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001400] = 0000000037000000, %l6 = 0000000000000132
	ldxa	[%i0+%g0]0x89,%l6	! %l6 = 0000000037000000
!	Mem[0000000010141410] = 6856aa08, %l6 = 0000000037000000
	ldswa	[%i5+%o5]0x80,%l6	! %l6 = 000000006856aa08
!	Mem[0000000030041400] = a151e168 432486ff, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i1+%g0]0x89,%l4	! %l4 = 00000000432486ff 00000000a151e168
!	Mem[0000000030141408] = 23000000a2480000, %l5 = 00000000a151e168
	ldxa	[%i5+%o4]0x89,%l5	! %l5 = 23000000a2480000
!	Mem[0000000010001408] = 46000000, %l5 = 23000000a2480000
	ldsba	[%i0+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181400] = 0500523784f4c40b, %l3 = 0000000044ee2c81
	ldxa	[%i6+%g0]0x81,%l3	! %l3 = 0500523784f4c40b
!	Mem[0000000010041408] = 28d2ca4d f85cee8f, %l2 = 432486ff, %l3 = 84f4c40b
	ldda	[%i1+%o4]0x80,%l2	! %l2 = 0000000028d2ca4d 00000000f85cee8f

p0_label_51:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000432486ff, Mem[0000000030081400] = 432486ff
	stwa	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 432486ff
!	%f2  = 6856aa08 75cf9cf9, %l4 = 00000000432486ff
!	Mem[00000000300c1428] = 3b7077a628d4195f
	add	%i3,0x028,%g1
	stda	%f2,[%g1+%l4]ASI_PST16_SL ! Mem[00000000300c1428] = f99ccf7508aa5668
!	%l4 = 432486ff, %l5 = 00000000, Mem[0000000010141420] = 1f819fb8 53d16de9, %asi = 80
	stda	%l4,[%i5+0x020]%asi	! Mem[0000000010141420] = 432486ff 00000000
!	Mem[0000000010001430] = 00000000, %l7 = 00000019, %l3 = f85cee8f
	add	%i0,0x30,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 0000000000000000
!	%l4 = 00000000432486ff, Mem[0000000010181434] = 37520005
	sth	%l4,[%i6+0x034]		! Mem[0000000010181434] = 86ff0005
!	Mem[0000000010181410] = c9bce100, %l1 = 0000000043248617
	ldstuba	[%i6+%o5]0x80,%l1	! %l1 = 00000000000000c9
!	%l1 = 00000000000000c9, Mem[0000000030101410] = 0046b55f
	stha	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = 00c9b55f
!	%f26 = 0fd27d71, Mem[0000000010101400] = 28d2ca4d
	sta	%f26,[%i4+%g0]0x80	! Mem[0000000010101400] = 0fd27d71
!	%l7 = 0000000000000019, %l3 = 0000000000000000, %l3 = 0000000000000000
	xor	%l7,%l3,%l3		! %l3 = 0000000000000019
!	Mem[0000000010001400] = 00000019, %l2 = 0000000028d2ca4d
	ldstuba	[%i0+%g0]0x88,%l2	! %l2 = 0000000000000019

p0_label_52:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ffee5cf8 2ef77b67, %l4 = 432486ff, %l5 = 00000000
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 00000000ffee5cf8 000000002ef77b67
!	Mem[0000000010081400] = ffffa8ff, %l4 = 00000000ffee5cf8
	ldswa	[%i2+%g0]0x88,%l4	! %l4 = ffffffffffffa8ff
!	Mem[00000000100c1408] = 0bc4f484, %l6 = 000000006856aa08
	lduba	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000084
!	Mem[0000000030041410] = 432486ff, %l5 = 000000002ef77b67
	ldsba	[%i1+%o5]0x81,%l5	! %l5 = 0000000000000043
!	Mem[0000000030101408] = 44bbd0b7, %l6 = 0000000000000084
	lduha	[%i4+%o4]0x89,%l6	! %l6 = 000000000000d0b7
!	Mem[00000000100c1406] = 3cbe84ff, %l6 = 000000000000d0b7, %asi = 80
	lduha	[%i3+0x006]%asi,%l6	! %l6 = 00000000000084ff
!	Randomly selected nop
	nop
!	Mem[0000000030101408] = b7d0bb444c1382c2, %l0 = 00000000000048a2
	ldxa	[%i4+%o4]0x81,%l0	! %l0 = b7d0bb444c1382c2
!	Mem[0000000030181410] = bd40b55f, %l4 = ffffffffffffa8ff
	ldsha	[%i6+%o5]0x81,%l4	! %l4 = ffffffffffffbd40
!	%l1 = 00000000000000c9, imm = 0000000000000c58, %l4 = ffffffffffffbd40
	orn	%l1,0xc58,%l4		! %l4 = fffffffffffff3ef

p0_label_53:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000019, Mem[0000000030141410] = 4d52f279
	stwa	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000019
!	%f24 = c9bce100 7c40e49c, Mem[0000000010041400] = 00954028 ffbd7d60
	stda	%f24,[%i1+%g0]0x88	! Mem[0000000010041400] = c9bce100 7c40e49c
!	%l6 = 00000000000084ff, Mem[00000000211c0001] = ffff8970
	stb	%l6,[%o2+0x001]		! Mem[00000000211c0000] = ffff8970
!	Mem[0000000010101410] = 65e84a24, %l3 = 00000019, %l4 = fffff3ef
	add	%i4,0x10,%g1
	casa	[%g1]0x80,%l3,%l4	! %l4 = 0000000065e84a24
!	%f2  = 6856aa08 75cf9cf9, Mem[0000000010081430] = 99eceb04 1eebe101, %asi = 80
	stda	%f2 ,[%i2+0x030]%asi	! Mem[0000000010081430] = 6856aa08 75cf9cf9
!	Mem[0000000010041400] = 9ce4407c 00e1bcc9 28d2ca4d f85cee8f
!	%f0  = d78aa25d 46000000 6856aa08 75cf9cf9
!	%f4  = b7e86d83 7cc0b9c0 4324c6ff 1a6fa86b
!	%f8  = 00000000 bd40b569 51e3ed68 40fc624d
!	%f12 = f85ceeff 2a210000 1f90d592 1f90d592
	stda	%f0 ,[%i1+%g0]ASI_BLK_PL	! Block Store to 0000000010041400
!	%l5 = 0000000000000043, Mem[0000000010181408] = 6856aa08
	stwa	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000043
!	%f16 = 812cee44 ff862443, %l5 = 0000000000000043
!	Mem[0000000010101428] = 505719564e644cae
	add	%i4,0x028,%g1
	stda	%f16,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010101428] = 432486ff44ee2c81
!	%l6 = 00000000000084ff, %l5 = 0000000000000043, %l1 = 00000000000000c9
	addc	%l6,%l5,%l1		! %l1 = 0000000000008542
!	%f20 = 4d52f279 6cb314c2, Mem[0000000010081430] = 6856aa08 75cf9cf9, %asi = 80
	stda	%f20,[%i2+0x030]%asi	! Mem[0000000010081430] = 4d52f279 6cb314c2

p0_label_54:
!	Starting 10 instruction Load Burst
!	Code Fragment 3, seed = 763737
p0_fragment_6:
!	%l0 = b7d0bb444c1382c2
	setx	0xe7f043c7677de65e,%g7,%l0 ! %l0 = e7f043c7677de65e
!	%l1 = 0000000000008542
	setx	0x5d1e1adf11df2509,%g7,%l1 ! %l1 = 5d1e1adf11df2509
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e7f043c7677de65e
	setx	0xc103df7f3661bfc4,%g7,%l0 ! %l0 = c103df7f3661bfc4
!	%l1 = 5d1e1adf11df2509
	setx	0x26d320625b84398f,%g7,%l1 ! %l1 = 26d320625b84398f
p0_fragment_6_end:
!	Mem[00000000300c1400] = ffe00808, %l0 = c103df7f3661bfc4
	lduha	[%i3+%g0]0x81,%l0	! %l0 = 000000000000ffe0
!	Mem[00000000300c1400] = ffe00808, %l6 = 00000000000084ff
	ldswa	[%i3+%g0]0x81,%l6	! %l6 = ffffffffffe00808
!	Mem[0000000030101408] = b7d0bb44, %l3 = 0000000000000019
	lduwa	[%i4+%o4]0x81,%l3	! %l3 = 00000000b7d0bb44
!	Mem[00000000211c0000] = ffff8970, %l1 = 26d320625b84398f
	lduh	[%o2+%g0],%l1		! %l1 = 000000000000ffff
!	Mem[00000000201c0000] = 174c9ee0, %l6 = ffffffffffe00808
	ldsh	[%o0+%g0],%l6		! %l6 = 000000000000174c
!	Mem[0000000010081410] = 0132fff3, %f22 = b3321656
	lda	[%i2+%o5]0x80,%f22	! %f22 = 0132fff3
!	%l4 = 0000000065e84a24, %l0 = 000000000000ffe0, %l2 = 0000000000000019
	and	%l4,%l0,%l2		! %l2 = 0000000000004a20
!	Mem[0000000020800000] = 40287110, %l3 = 00000000b7d0bb44
	ldsh	[%o1+%g0],%l3		! %l3 = 0000000000004028
!	Mem[0000000010001408] = 00000046, %l3 = 0000000000004028
	lduwa	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000046

p0_label_55:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000004a20, immd = 00000ba7, %y  = ffffffff
	sdiv	%l2,0xba7,%l7		! %l7 = ffffffffffea07c0
	mov	%l0,%y			! %y = 0000ffe0
!	%l0 = 0000ffe0, %l1 = 0000ffff, Mem[00000000100c1410] = 69da7417 43248617
	stda	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000ffe0 0000ffff
!	%l2 = 00004a20, %l3 = 00000046, Mem[0000000030041408] = ff0d807d 677fd7a7
	stda	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 00004a20 00000046
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010041428] = 4d62fc4068ede351, %l2 = 0000000000004a20, %l3 = 0000000000000046
	add	%i1,0x28,%g1
	casxa	[%g1]0x80,%l2,%l3	! %l3 = 4d62fc4068ede351
!	%l6 = 000000000000174c, Mem[0000000030181410] = bd40b55f
	stwa	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000174c
!	Code Fragment 4, seed = 352801
p0_fragment_7:
!	%l0 = 000000000000ffe0
	setx	0xd816b1350b4d581e,%g7,%l0 ! %l0 = d816b1350b4d581e
!	%l1 = 000000000000ffff
	setx	0x2717d88336c6eac9,%g7,%l1 ! %l1 = 2717d88336c6eac9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = d816b1350b4d581e
	setx	0x3add1a7a36819984,%g7,%l0 ! %l0 = 3add1a7a36819984
!	%l1 = 2717d88336c6eac9
	setx	0x5e3f4687c1efe74f,%g7,%l1 ! %l1 = 5e3f4687c1efe74f
p0_fragment_7_end:
!	%l1 = 5e3f4687c1efe74f, %l7 = ffffffffffea07c0, %l6 = 000000000000174c
	addc	%l1,%l7,%l6		! %l6 = 5e3f4687c1d9ef0f
!	%f14 = 1f90d592 1f90d592, %l2 = 0000000000004a20
!	Mem[0000000010001428] = 43972b17bad8cecf
	add	%i0,0x028,%g1
	stda	%f14,[%g1+%l2]ASI_PST32_P ! Mem[0000000010001428] = 43972b17bad8cecf
!	%f26 = 0fd27d71 0000aa08, Mem[0000000010181410] = ffbce100 79f2524d, %asi = 80
	stda	%f26,[%i6+0x010]%asi	! Mem[0000000010181410] = 0fd27d71 0000aa08
!	%l7 = ffffffffffea07c0, Mem[0000000030141410] = 19000000
	stwa	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = ffea07c0

p0_label_56:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 0000174c, %l7 = ffffffffffea07c0
	ldsha	[%i4+%g0]0x89,%l7	! %l7 = 000000000000174c
!	Mem[0000000030181408] = 9ce4407c, %l2 = 0000000000004a20
	ldsha	[%i6+%o4]0x81,%l2	! %l2 = ffffffffffff9ce4
!	Mem[0000000030141408] = 000048a2, %l3 = 4d62fc4068ede351
	ldsha	[%i5+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041410] = 432486ff, %l6 = 5e3f4687c1d9ef0f
	lduha	[%i1+%o5]0x81,%l6	! %l6 = 0000000000004324
!	Mem[0000000030141400] = fff00b67, %l3 = 0000000000000000
	ldsba	[%i5+%g0]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[000000001010141e] = 4dcad2f3, %l2 = ffffffffffff9ce4
	ldsh	[%i4+0x01e],%l2		! %l2 = ffffffffffffd2f3
!	Mem[0000000010041400] = 46000000, %l3 = ffffffffffffffff
	lduha	[%i1+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = ffff8970, %l4 = 0000000065e84a24
	ldsb	[%o2+%g0],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010041418] = 6ba86f1a ffc62443, %l6 = 00004324, %l7 = 0000174c, %asi = 80
	ldda	[%i1+0x018]%asi,%l6	! %l6 = 000000006ba86f1a 00000000ffc62443
!	Mem[0000000010001439] = 4bece71a, %l0 = 3add1a7a36819984
	ldub	[%i0+0x039],%l0		! %l0 = 00000000000000ec

p0_label_57:
!	Starting 10 instruction Store Burst
!	%f13 = 2a210000, Mem[00000000300c1408] = f85ceeff
	sta	%f13,[%i3+%o4]0x89	! Mem[00000000300c1408] = 2a210000
!	%l1 = 5e3f4687c1efe74f, Mem[0000000030041410] = 000000f2ff862443
	stxa	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = 5e3f4687c1efe74f
!	Mem[0000000010041408] = f99ccf75, %l2 = ffffffffffffd2f3
	ldstuba	[%i1+%o4]0x80,%l2	! %l2 = 00000000000000f9
!	%l0 = 00000000000000ec, Mem[0000000010001410] = 69b540bd
	stwa	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000ec
!	Mem[0000000010181410] = 0fd27d71, %l0 = 00000000000000ec
	ldstuba	[%i6+%o5]0x80,%l0	! %l0 = 000000000000000f
!	Mem[00000000300c1400] = ffe00808, %l3 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l3	! %l3 = 00000000ffe00808
!	Mem[00000000300c1410] = 4324c6ff, %l7 = 00000000ffc62443
	lduba	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000043
!	Mem[0000000030101410] = 5fb5c900, %l1 = 5e3f4687c1efe74f
	ldstuba	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%l4 = ffffffffffffffff, Mem[00000000100c1408] = 84f4c40b
	stwa	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffffffff
!	%l2 = 00000000000000f9, Mem[0000000030081408] = 00ff244300000000
	stxa	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000000000f9

p0_label_58:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 0bc4f484 37520005, %l0 = 0000000f, %l1 = 00000000
	ldda	[%i6+%g0]0x89,%l0	! %l0 = 0000000037520005 000000000bc4f484
!	Mem[00000000100c140b] = ffffffff, %l2 = 00000000000000f9
	ldub	[%i3+0x00b],%l2		! %l2 = 00000000000000ff
!	Mem[0000000030141410] = c214b36c ffea07c0, %l0 = 37520005, %l1 = 0bc4f484
	ldda	[%i5+%o5]0x89,%l0	! %l0 = 00000000ffea07c0 00000000c214b36c
!	Mem[0000000010081400] = ffffa8ff, %l4 = ffffffffffffffff
	ldswa	[%i2+%g0]0x88,%l4	! %l4 = ffffffffffffa8ff
!	Mem[0000000010041408] = ff9ccf7508aa5668, %f24 = c9bce100 7c40e49c
	ldd	[%i1+%o4],%f24		! %f24 = ff9ccf75 08aa5668
!	Mem[0000000010041408] = 75cf9cff, %l7 = 0000000000000043
	ldsba	[%i1+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041400] = 000000465da28ad7, %l7 = ffffffffffffffff
	ldxa	[%i1+%g0]0x80,%l7	! %l7 = 000000465da28ad7
!	Mem[00000000300c1408] = 677bf72e2a210000, %l6 = 000000006ba86f1a
	ldxa	[%i3+%o4]0x89,%l6	! %l6 = 677bf72e2a210000
!	Mem[0000000030041410] = c1efe74f, %l5 = 0000000000000043
	lduba	[%i1+%o5]0x89,%l5	! %l5 = 000000000000004f
!	Mem[0000000010181400] = c9bce10053013639, %l2 = 00000000000000ff
	ldxa	[%i6+%g0]0x80,%l2	! %l2 = c9bce10053013639

p0_label_59:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 0000174c, %l5 = 000000000000004f
	ldstuba	[%i4+%g0]0x89,%l5	! %l5 = 000000000000004c
!	%f19 = 4c170000, %f28 = 05005237, %f30 = f99ccf75
	fdivs	%f19,%f28,%f30		! %f30 = 7f800000
!	Mem[0000000010101406] = 00ff0000, %l5 = 000000000000004c
	ldstub	[%i4+0x006],%l5		! %l5 = 0000000000000000
!	%f15 = 1f90d592, %f9  = bd40b569, %f11 = 40fc624d
	fsubs	%f15,%f9 ,%f11		! %f11 = 3d40b569
!	%l7 = 000000465da28ad7, Mem[0000000010101408] = 08aa0000
	stha	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = 08aa8ad7
!	%f22 = 0132fff3 0a3574a7, %l1 = 00000000c214b36c
!	Mem[0000000010081408] = ff74deff5de71e97
	add	%i2,0x008,%g1
	stda	%f22,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010081408] = ff74deff5de71e97
!	Mem[0000000021800100] = f0b6c060, %l7 = 000000465da28ad7
	ldstuba	[%o3+0x100]%asi,%l7	! %l7 = 00000000000000f0
!	Mem[0000000010001400] = ff000000bd40b55f, %l2 = c9bce10053013639, %l7 = 00000000000000f0
	casxa	[%i0]0x80,%l2,%l7	! %l7 = ff000000bd40b55f
!	%l7 = ff000000bd40b55f, Mem[00000000300c1408] = 2a210000
	stha	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 2a21b55f
!	Mem[00000000100c1400] = 607d6fff, %l4 = 00000000ffffa8ff
	swapa	[%i3+%g0]0x88,%l4	! %l4 = 00000000607d6fff

p0_label_60:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000046 5da28ad7, %l6 = 2a210000, %l7 = bd40b55f
	ldda	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000046 000000005da28ad7
!	Mem[0000000010041408] = ff9ccf75 08aa5668, %l4 = 607d6fff, %l5 = 00000000
	ldda	[%i1+%o4]0x80,%l4	! %l4 = 00000000ff9ccf75 0000000008aa5668
!	Mem[0000000010001410] = 00000000 ec000000, %l2 = 53013639, %l3 = ffe00808
	ldda	[%i0+%o5]0x88,%l2	! %l2 = 00000000ec000000 0000000000000000
!	Mem[0000000010041400] = 00000046 5da28ad7, %l4 = ff9ccf75, %l5 = 08aa5668
	ldda	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000046 000000005da28ad7
!	Mem[00000000100c1410] = e0ff0000, %l4 = 0000000000000046
	ldswa	[%i3+%o5]0x80,%l4	! %l4 = ffffffffe0ff0000
!	Mem[0000000010041410] = c0b9c07c836de8b7, %f20 = 4d52f279 6cb314c2
	ldd	[%i1+%o5],%f20		! %f20 = c0b9c07c 836de8b7
!	Mem[0000000010141408] = ff000000, %l2 = 00000000ec000000
	ldswa	[%i5+%o4]0x80,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010001400] = ff000000, %l6 = 0000000000000046
	ldsba	[%i0+%g0]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010041410] = b7e86d83 7cc0b9c0, %l4 = e0ff0000, %l5 = 5da28ad7
	ldda	[%i1+%o5]0x88,%l4	! %l4 = 000000007cc0b9c0 00000000b7e86d83
!	%l6 = ffffffff, %l7 = 5da28ad7, Mem[0000000010081408] = ffde74ff 971ee75d
	stda	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffffff 5da28ad7

p0_label_61:
!	Starting 10 instruction Store Burst
!	%f8  = 00000000 bd40b569, %l3 = 0000000000000000
!	Mem[0000000010181420] = 0000340000e1bcc9
	add	%i6,0x020,%g1
	stda	%f8,[%g1+%l3]ASI_PST32_P ! Mem[0000000010181420] = 0000340000e1bcc9
!	%l5 = 00000000b7e86d83, Mem[0000000010081400] = 1139951effffa8ff
	stxa	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000b7e86d83
!	Mem[0000000010081410] = f3ff3201, %l5 = 00000000b7e86d83
	swapa	[%i2+%o5]0x88,%l5	! %l5 = 00000000f3ff3201
!	%l2 = ffffffffff000000, imm = fffffffffffff500, %l2 = ffffffffff000000
	addc	%l2,-0xb00,%l2		! %l2 = fffffffffefff500
!	%l3 = 0000000000000000, Mem[00000000218001c0] = ff444af0, %asi = 80
	stba	%l3,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 00444af0
!	%l0 = 00000000ffea07c0, Mem[000000001004143f] = 92d5901f
	stb	%l0,[%i1+0x03f]		! Mem[000000001004143c] = 92d590c0
!	%l2 = fffffffffefff500, Mem[0000000010081408] = ffffffff
	stba	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffff00
!	%f19 = 4c170000, Mem[0000000010101428] = 432486ff
	st	%f19,[%i4+0x028]	! Mem[0000000010101428] = 4c170000
!	Mem[0000000030081400] = 432486ff, %l3 = 0000000000000000
	lduba	[%i2+%g0]0x81,%l3	! %l3 = 0000000000000043
!	%f30 = 7f800000, Mem[0000000010101404] = 00ffff00
	st	%f30,[%i4+0x004]	! Mem[0000000010101404] = 7f800000

p0_label_62:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ffd27d710000aa08, %l6 = ffffffffffffffff
	ldxa	[%i6+%o5]0x80,%l6	! %l6 = ffd27d710000aa08
!	Mem[0000000030181400] = 37520005, %l2 = fffffffffefff500
	lduba	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000005
!	Mem[0000000030141400] = fff00b67, %l6 = ffd27d710000aa08
	ldsba	[%i5+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081400] = b7e86d83, %l4 = 000000007cc0b9c0
	ldsha	[%i2+%g0]0x88,%l4	! %l4 = 0000000000006d83
!	Mem[0000000010001428] = 43972b17, %l2 = 0000000000000005, %asi = 80
	lduwa	[%i0+0x028]%asi,%l2	! %l2 = 0000000043972b17
!	Mem[0000000010181410] = ffd27d71, %l7 = 000000005da28ad7
	ldsha	[%i6+%o5]0x80,%l7	! %l7 = ffffffffffffffd2
!	Mem[0000000030001400] = 37000000, %l0 = 00000000ffea07c0
	lduwa	[%i0+%g0]0x89,%l0	! %l0 = 0000000037000000
!	Mem[0000000030141408] = a2480000, %f1  = 46000000
	lda	[%i5+%o4]0x89,%f1 	! %f1 = a2480000
!	%f30 = 7f800000, %f16 = 812cee44, %f12 = f85ceeff
	fmuls	%f30,%f16,%f12		! %f12 = ff800000
!	Mem[0000000010041400] = d78aa25d46000000, %l4 = 0000000000006d83
	ldxa	[%i1+%g0]0x88,%l4	! %l4 = d78aa25d46000000

p0_label_63:
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffffd2, Mem[0000000010181410] = ffd27d71
	stwa	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffffd2
!	Code Fragment 3, seed = 227930
p0_fragment_8:
!	%l0 = 0000000037000000
	setx	0xf49ea9de1ce71f56,%g7,%l0 ! %l0 = f49ea9de1ce71f56
!	%l1 = 00000000c214b36c
	setx	0x370a7372ee306c81,%g7,%l1 ! %l1 = 370a7372ee306c81
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f49ea9de1ce71f56
	setx	0x309b463fb11fcdbc,%g7,%l0 ! %l0 = 309b463fb11fcdbc
!	%l1 = 370a7372ee306c81
	setx	0xe3e530df3d764607,%g7,%l1 ! %l1 = e3e530df3d764607
p0_fragment_8_end:
!	Mem[0000000010101410] = 244ae865, %l7 = 00000000ffffffd2
	swapa	[%i4+%o5]0x88,%l7	! %l7 = 00000000244ae865
!	%l0 = 309b463fb11fcdbc, Mem[00000000300c1410] = 4324c6ff
	stha	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = cdbcc6ff
!	%f6  = 4324c6ff 1a6fa86b, Mem[0000000010081428] = 4e17ba96 40efba8f
	std	%f6 ,[%i2+0x028]	! Mem[0000000010081428] = 4324c6ff 1a6fa86b
!	%l4 = 46000000, %l5 = f3ff3201, Mem[0000000010101400] = 0fd27d71 7f800000
	stda	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 46000000 f3ff3201
!	%f15 = 1f90d592, Mem[0000000030001410] = f3d24c17
	sta	%f15,[%i0+%o5]0x89	! Mem[0000000030001410] = 1f90d592
!	%l6 = ffffffff, %l7 = 244ae865, Mem[0000000010101400] = 00000046 0132fff3
	stda	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffffff 244ae865
!	Mem[00000000300c1408] = 5fb5212a, %l6 = 00000000ffffffff
	swapa	[%i3+%o4]0x81,%l6	! %l6 = 000000005fb5212a
!	%l2 = 43972b17, %l3 = 00000043, Mem[00000000100c1410] = e0ff0000 ffff0000
	stda	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 43972b17 00000043

p0_label_64:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ffffff00, %l3 = 0000000000000043
	ldswa	[%i2+%o4]0x88,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000010141408] = ff000000, %l5 = 00000000f3ff3201
	lduha	[%i5+%o4]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[0000000010081400] = 836de8b7, %l3 = ffffffffffffff00
	lduwa	[%i2+%g0]0x80,%l3	! %l3 = 00000000836de8b7
!	Mem[0000000030101410] = ffc9b55f, %l4 = d78aa25d46000000
	lduba	[%i4+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1400] = ffa8ffff, %l1 = e3e530df3d764607
	lduha	[%i3+%g0]0x80,%l1	! %l1 = 000000000000ffa8
!	Mem[0000000010141430] = 65e8322025a5fb25, %l2 = 0000000043972b17
	ldx	[%i5+0x030],%l2		! %l2 = 65e8322025a5fb25
!	Mem[0000000020800041] = ff85bf40, %l1 = 000000000000ffa8, %asi = 80
	ldsba	[%o1+0x041]%asi,%l1	! %l1 = ffffffffffffff85
!	Mem[0000000010081400] = 836de8b7, %f15 = 1f90d592
	lda	[%i2+%g0]0x80,%f15	! %f15 = 836de8b7
!	Mem[0000000010101400] = ffffffff 65e84a24, %l0 = b11fcdbc, %l1 = ffffff85
	ldd	[%i4+%g0],%l0		! %l0 = 00000000ffffffff 0000000065e84a24
!	Mem[00000000201c0000] = 174c9ee0, %l2 = 65e8322025a5fb25, %asi = 80
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = 000000000000174c

p0_label_65:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000244ae865, imm = 0000000000000f3a, %l2 = 000000000000174c
	xor	%l7,0xf3a,%l2		! %l2 = 00000000244ae75f
!	%l0 = 00000000ffffffff, Mem[0000000010181410] = ffffffd2
	stba	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffffd2
!	%l0 = ffffffff, %l1 = 65e84a24, Mem[0000000010101410] = d2ffffff ff5b3f39
	stda	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffffff 65e84a24
!	%f13 = 2a210000, Mem[0000000030081410] = 84f4c40b
	sta	%f13,[%i2+%o5]0x81	! Mem[0000000030081410] = 2a210000
!	Mem[000000001018141a] = a774350a, %l2 = 00000000244ae75f
	ldstuba	[%i6+0x01a]%asi,%l2	! %l2 = 0000000000000035
!	Mem[0000000030181400] = 05005237, %l3 = 00000000836de8b7
	ldstuba	[%i6+%g0]0x81,%l3	! %l3 = 0000000000000005
!	%l6 = 5fb5212a, %l7 = 244ae865, Mem[0000000030181410] = 4c170000 7c40e49c
	stda	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 5fb5212a 244ae865
!	%f20 = c0b9c07c 836de8b7, Mem[0000000010101438] = 3075de22 1a6fa86b
	std	%f20,[%i4+0x038]	! Mem[0000000010101438] = c0b9c07c 836de8b7
!	Mem[0000000030101410] = 5fb5c9ff, %l0 = 00000000ffffffff
	ldstuba	[%i4+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%l0 = 000000ff, %l1 = 65e84a24, Mem[0000000010081400] = 836de8b7 00000000
	std	%l0,[%i2+%g0]		! Mem[0000000010081400] = 000000ff 65e84a24

p0_label_66:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 08aa5668, %l4 = 00000000000000ff
	ldsba	[%i5+%o5]0x88,%l4	! %l4 = 0000000000000068
!	%f11 = 3d40b569, Mem[0000000030041400] = 432486ff
	sta	%f11,[%i1+%g0]0x89	! Mem[0000000030041400] = 3d40b569
!	Mem[0000000010081400] = ff000000, %l3 = 0000000000000005
	lduha	[%i2+%g0]0x88,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (12)
!	Mem[00000000100c1400] = ffa8ffff 3cbe84ff ffffffff 69da74a7
!	Mem[00000000100c1410] = 43972b17 00000043 a3392b17 bad80601
!	Mem[00000000100c1420] = bd40b55f 9ce4407c ffcbd075 c66a7b7e
!	Mem[00000000100c1430] = 174c519e 670bf077 3bd48ca0 aa937631
	ldda	[%i3+%g0]ASI_BLK_PL,%f16	! Block Load from 00000000100c1400
!	Mem[0000000010101410] = ffffffff, %l3 = 0000000000000000
	lduwa	[%i4+%o5]0x80,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000010001410] = 000000ec 00000000, %l6 = 5fb5212a, %l7 = 244ae865
	ldda	[%i0+%o5]0x80,%l6	! %l6 = 00000000000000ec 0000000000000000
!	Mem[0000000010081418] = 2dff218a, %l2 = 0000000000000035, %asi = 80
	ldswa	[%i2+0x018]%asi,%l2	! %l2 = 000000002dff218a
!	Mem[0000000030101400] = ff170000, %l2 = 000000002dff218a
	lduba	[%i4+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001410] = ec000000, %l1 = 0000000065e84a24
	lduba	[%i0+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1408] = ffffffff, %l4 = 0000000000000068
	ldswa	[%i3+%o4]0x80,%l4	! %l4 = ffffffffffffffff

p0_label_67:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = ab1d7ed3, %l3 = 00000000ffffffff
	swapa	[%i0+%o4]0x89,%l3	! %l3 = 00000000ab1d7ed3
!	Mem[0000000030081410] = 2a210000, %l4 = ffffffffffffffff
	ldstuba	[%i2+%o5]0x81,%l4	! %l4 = 000000000000002a
!	%l1 = 0000000000000000, Mem[00000000300c1410] = 19000000ffc6bccd
	stxa	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000000000000000
!	Code Fragment 3, seed = 14713
p0_fragment_9:
!	%l0 = 00000000000000ff
	setx	0xcc535e47d7a5755e,%g7,%l0 ! %l0 = cc535e47d7a5755e
!	%l1 = 0000000000000000
	setx	0x26088a554bdd8409,%g7,%l1 ! %l1 = 26088a554bdd8409
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = cc535e47d7a5755e
	setx	0x5a311d26f6bdeec4,%g7,%l0 ! %l0 = 5a311d26f6bdeec4
!	%l1 = 26088a554bdd8409
	setx	0xef8ad8ca8415388f,%g7,%l1 ! %l1 = ef8ad8ca8415388f
p0_fragment_9_end:
!	%l3 = 00000000ab1d7ed3, Mem[0000000010001407] = bd40b55f
	stb	%l3,[%i0+0x007]		! Mem[0000000010001404] = bd40b5d3
!	%l4 = 000000000000002a, Mem[0000000030081408] = 00000000
	stwa	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000002a
!	%l0 = f6bdeec4, %l1 = 8415388f, Mem[0000000010141420] = 432486ff 00000000
	std	%l0,[%i5+0x020]		! Mem[0000000010141420] = f6bdeec4 8415388f
!	%l7 = 0000000000000000, %l0 = 5a311d26f6bdeec4, %l3 = 00000000ab1d7ed3
	sdivx	%l7,%l0,%l3		! %l3 = 0000000000000000
!	Mem[00000000100c140b] = ffffffff, %l3 = 0000000000000000
	ldstub	[%i3+0x00b],%l3		! %l3 = 00000000000000ff
	membar	#Sync			! Added by membar checker (13)
!	%f30 = 317693aa, Mem[00000000100c1400] = ffffa8ff
	sta	%f30,[%i3+%g0]0x88	! Mem[00000000100c1400] = 317693aa

p0_label_68:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 43000000, %l0 = 5a311d26f6bdeec4
	lduba	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000043
!	Mem[0000000030001410] = 1f90d592, %l0 = 0000000000000043
	lduwa	[%i0+%o5]0x89,%l0	! %l0 = 000000001f90d592
!	Mem[000000001004142c] = 68ede351, %l3 = 00000000000000ff, %asi = 80
	ldsha	[%i1+0x02c]%asi,%l3	! %l3 = 00000000000068ed
!	Mem[0000000010101410] = ffffffff, %f31 = a08cd43b
	lda	[%i4+%o5]0x80,%f31	! %f31 = ffffffff
!	Mem[0000000030181408] = 9ce4407c, %l2 = 00000000000000ff
	ldsba	[%i6+%o4]0x81,%l2	! %l2 = ffffffffffffff9c
!	%l7 = 0000000000000000, %l3 = 00000000000068ed, %l4 = 000000000000002a
	udivx	%l7,%l3,%l4		! %l4 = 0000000000000000
!	Mem[0000000010101408] = 08aa8ad7, %l6 = 00000000000000ec
	ldswa	[%i4+%o4]0x88,%l6	! %l6 = 0000000008aa8ad7
!	Mem[0000000010141410] = f99ccf7508aa5668, %f22 = 0106d8ba 172b39a3
	ldda	[%i5+%o5]0x88,%f22	! %f22 = f99ccf75 08aa5668
!	Mem[0000000010181400] = c9bce100, %f18 = a774da69
	lda	[%i6+%g0]0x80,%f18	! %f18 = c9bce100
!	Mem[00000000201c0001] = 174c9ee0, %l0 = 000000001f90d592
	ldsb	[%o0+0x001],%l0		! %l0 = 000000000000004c

p0_label_69:
!	Starting 10 instruction Store Burst
!	%l2 = ffffff9c, %l3 = 000068ed, Mem[0000000010001408] = 46000000 d78aa25d
	stda	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffff9c 000068ed
!	%l0 = 0000004c, %l1 = 8415388f, Mem[00000000100c1410] = 172b9743 43000000
	stda	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000004c 8415388f
!	Mem[00000000300c1408] = ffffffff, %l0 = 000000000000004c
	swapa	[%i3+%o4]0x89,%l0	! %l0 = 00000000ffffffff
!	%l2 = ffffffffffffff9c, Mem[0000000010101410] = ffffffff
	stwa	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffff9c
!	%f15 = 836de8b7, Mem[00000000300c1400] = 00000000
	sta	%f15,[%i3+%g0]0x81	! Mem[00000000300c1400] = 836de8b7
!	%l1 = ef8ad8ca8415388f, Mem[0000000010041434] = ffee5cf8
	stb	%l1,[%i1+0x034]		! Mem[0000000010041434] = 8fee5cf8
!	%l5 = 000000000000ff00, Mem[0000000010181410] = ffffffd2
	stha	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = ff00ffd2
!	%l2 = ffffff9c, %l3 = 000068ed, Mem[0000000030101410] = 5fb5c9ff 7c40e49c
	stda	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = ffffff9c 000068ed
!	%l7 = 0000000000000000, %l5 = 000000000000ff00, %l7 = 0000000000000000
	or	%l7,%l5,%l7		! %l7 = 000000000000ff00
!	%l0 = 00000000ffffffff, Mem[0000000010181408] = 3936015300000043
	stxa	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000ffffffff

p0_label_70:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ff210000, %l1 = ef8ad8ca8415388f
	lduwa	[%i2+%o5]0x81,%l1	! %l1 = 00000000ff210000
!	Mem[0000000030141400] = 174c519e670bf0ff, %f22 = f99ccf75 08aa5668
	ldda	[%i5+%g0]0x89,%f22	! %f22 = 174c519e 670bf0ff
!	Mem[0000000010001422] = 655b41d8, %l1 = 00000000ff210000, %asi = 80
	lduba	[%i0+0x022]%asi,%l1	! %l1 = 0000000000000041
!	Mem[0000000030141410] = c214b36c ffea07c0, %l4 = 00000000, %l5 = 0000ff00
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 00000000ffea07c0 00000000c214b36c
!	Mem[00000000201c0000] = 174c9ee0, %l3 = 00000000000068ed, %asi = 80
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = 000000000000174c
!	%l0 = 00000000ffffffff, %l3 = 000000000000174c, %l4 = 00000000ffea07c0
	xor	%l0,%l3,%l4		! %l4 = 00000000ffffe8b3
!	Mem[0000000010041410] = 7cc0b9c0, %l4 = 00000000ffffe8b3
	ldsba	[%i1+%o5]0x88,%l4	! %l4 = ffffffffffffffc0
!	%l1 = 0000000000000041, imm = 00000000000004b4, %l2 = ffffffffffffff9c
	addc	%l1,0x4b4,%l2		! %l2 = 00000000000004f5
!	Mem[0000000010141410] = 6856aa08, %l2 = 00000000000004f5
	ldsba	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000068
!	Mem[0000000010101400] = ffffffff, %l6 = 0000000008aa8ad7
	lduwa	[%i4+%g0]0x80,%l6	! %l6 = 00000000ffffffff

p0_label_71:
!	Starting 10 instruction Store Burst
!	%f30 = 317693aa ffffffff, %l4 = ffffffffffffffc0
!	Mem[0000000010101418] = 7a5e924a4dcad2f3
	add	%i4,0x018,%g1
	stda	%f30,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010101418] = 7a5e924a4dcad2f3
!	%l2 = 00000068, %l3 = 0000174c, Mem[0000000010081408] = ffffff00 5da28ad7
	stda	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000068 0000174c
!	Mem[0000000010101417] = 65e84a24, %l1 = 0000000000000041
	ldstuba	[%i4+0x017]%asi,%l1	! %l1 = 0000000000000024
!	Mem[00000000100c1432] = 174c519e, %l0 = 00000000ffffffff
	ldstuba	[%i3+0x032]%asi,%l0	! %l0 = 0000000000000051
!	%f0  = d78aa25d a2480000, %l2 = 0000000000000068
!	Mem[00000000300c1430] = 7ed54c941b955c1b
	add	%i3,0x030,%g1
	stda	%f0,[%g1+%l2]ASI_PST32_S ! Mem[00000000300c1430] = 7ed54c941b955c1b
!	%l7 = 000000000000ff00, Mem[0000000010141410] = 6856aa08
	stha	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = ff00aa08
!	%l5 = 00000000c214b36c, Mem[00000000100c1410] = 4c000000
	stwa	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = c214b36c
!	%l5 = 00000000c214b36c, Mem[00000000100c1400] = aa937631
	stba	%l5,[%i3+%g0]0x80	! Mem[00000000100c1400] = 6c937631
!	%l0 = 00000051, %l1 = 00000024, Mem[00000000100c1408] = ffffffff 69da74a7
	stda	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000051 00000024
!	%l5 = 00000000c214b36c, Mem[0000000010001400] = ff000000
	stba	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 6c000000

p0_label_72:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ff85bf40, %l4 = ffffffffffffffc0
	ldsb	[%o1+0x040],%l4		! %l4 = ffffffffffffffff
!	Code Fragment 4, seed = 19636
p0_fragment_10:
!	%l0 = 0000000000000051
	setx	0xde21e1cafee40686,%g7,%l0 ! %l0 = de21e1cafee40686
!	%l1 = 0000000000000024
	setx	0x937852ef9f0c6cb1,%g7,%l1 ! %l1 = 937852ef9f0c6cb1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = de21e1cafee40686
	setx	0xdeb64f93bb6396ec,%g7,%l0 ! %l0 = deb64f93bb6396ec
!	%l1 = 937852ef9f0c6cb1
	setx	0x9acb9275570b8837,%g7,%l1 ! %l1 = 9acb9275570b8837
p0_fragment_10_end:
!	Mem[00000000300c1410] = 00000000, %l6 = 00000000ffffffff
	lduha	[%i3+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101408] = d78aaa08, %l4 = ffffffffffffffff
	ldsha	[%i4+%o4]0x80,%l4	! %l4 = ffffffffffffd78a
!	Mem[0000000030101408] = b7d0bb44, %f29 = 9e514c17
	lda	[%i4+%o4]0x81,%f29	! %f29 = b7d0bb44
!	Mem[0000000010001400] = d3b540bd0000006c, %f28 = 77f00b67 b7d0bb44
	ldda	[%i0+%g0]0x88,%f28	! %f28 = d3b540bd 0000006c
!	%l4 = ffffffffffffd78a, immd = fffffb6f, %y  = 0000ffe0
	umul	%l4,-0x491,%l3		! %l3 = ffffd2f900b8c2d6, %y = ffffd2f9
!	Mem[0000000010141434] = 25a5fb25, %f13 = 2a210000
	lda	[%i5+0x034]%asi,%f13	! %f13 = 25a5fb25
!	Mem[0000000010081430] = 4d52f279 6cb314c2, %l6 = 00000000, %l7 = 0000ff00
	ldd	[%i2+0x030],%l6		! %l6 = 000000004d52f279 000000006cb314c2
!	Mem[00000000300c1400] = 836de8b7, %l1 = 9acb9275570b8837
	ldsha	[%i3+%g0]0x81,%l1	! %l1 = ffffffffffff836d

p0_label_73:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181420] = 00003400, %l3 = 00b8c2d6, %l7 = 6cb314c2
	add	%i6,0x20,%g1
	casa	[%g1]0x80,%l3,%l7	! %l7 = 0000000000003400
!	Mem[00000000100c1400] = 6c937631 3cbe84ff 00000051 00000024
!	%f16 = ff84be3c ffffa8ff c9bce100 ffffffff
!	%f20 = 43000000 172b9743 174c519e 670bf0ff
!	%f24 = 7c40e49c 5fb540bd 7e7b6ac6 75d0cbff
!	%f28 = d3b540bd 0000006c 317693aa ffffffff
	stda	%f16,[%i3+%g0]ASI_COMMIT_P	! Block Store to 00000000100c1400
!	%f22 = 174c519e 670bf0ff, Mem[0000000030081408] = 0000002a 000000f9
	stda	%f22,[%i2+%o4]0x81	! Mem[0000000030081408] = 174c519e 670bf0ff
!	%l2 = 0000000000000068, Mem[0000000010001400] = 6c000000
	stha	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 00680000
!	%l5 = 00000000c214b36c, immd = fffffffffffffddd, %l108 = 0000000000000005
	sdivx	%l5,-0x223,%l5		! %l5 = ffffffffffa52b33
!	Mem[00000000211c0001] = ffff8970, %l2 = 0000000000000068
	ldstuba	[%o2+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041400] = 3d40b569, %l4 = 00000000ffffd78a
	swapa	[%i1+%g0]0x89,%l4	! %l4 = 000000003d40b569
!	Mem[0000000010141400] = 00000000 81000000 ff000000 12f2a4ff
!	%f16 = ff84be3c ffffa8ff c9bce100 ffffffff
!	%f20 = 43000000 172b9743 174c519e 670bf0ff
!	%f24 = 7c40e49c 5fb540bd 7e7b6ac6 75d0cbff
!	%f28 = d3b540bd 0000006c 317693aa ffffffff
	stda	%f16,[%i5+%g0]ASI_BLK_AIUP	! Block Store to 0000000010141400
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000010141408] = c9bce100, %l1 = 00000000ffff836d
	swapa	[%i5+%o4]0x80,%l1	! %l1 = 00000000c9bce100
!	%l2 = 000000ff, %l3 = 00b8c2d6, Mem[00000000100c1428] = 7e7b6ac6 75d0cbff
	std	%l2,[%i3+0x028]		! Mem[00000000100c1428] = 000000ff 00b8c2d6

p0_label_74:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 174c9ee0, %l6 = 000000004d52f279
	lduh	[%o0+%g0],%l6		! %l6 = 000000000000174c
!	Mem[00000000201c0001] = 174c9ee0, %l0 = deb64f93bb6396ec
	ldub	[%o0+0x001],%l0		! %l0 = 000000000000004c
!	Mem[0000000030181400] = 375200ff, %l2 = 00000000000000ff
	ldsha	[%i6+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081438] = 1d9ca36e5beb30ab, %l5 = ffffffffffa52b33, %asi = 80
	ldxa	[%i2+0x038]%asi,%l5	! %l5 = 1d9ca36e5beb30ab
!	Mem[000000001004140a] = ff9ccf75, %l5 = 1d9ca36e5beb30ab, %asi = 80
	ldsha	[%i1+0x00a]%asi,%l5	! %l5 = ffffffffffffcf75
!	Mem[00000000300c1410] = 00000000, %l3 = ffffd2f900b8c2d6
	lduha	[%i3+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081408] = 00000068, %f4  = b7e86d83
	lda	[%i2+%o4]0x88,%f4 	! %f4 = 00000068
!	Mem[0000000030041400] = 8ad7ffff, %l5 = ffffffffffffcf75
	ldswa	[%i1+%g0]0x81,%l5	! %l5 = ffffffff8ad7ffff
!	Mem[000000001018141c] = 561632b3, %l0 = 000000000000004c, %asi = 80
	swapa	[%i6+0x01c]%asi,%l0	! %l0 = 00000000561632b3
!	Mem[0000000030141410] = ffea07c0, %l7 = 0000000000003400
	ldswa	[%i5+%o5]0x89,%l7	! %l7 = ffffffffffea07c0

p0_label_75:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 00680000, %l2 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x000]%asi,%l2	! %l2 = 0000000000680000
!	%l1 = 00000000c9bce100, Mem[0000000010041408] = ff9ccf75
	stwa	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = c9bce100
!	%f4  = 00000068 7cc0b9c0, Mem[0000000010141408] = 6d83ffff ffffffff
	stda	%f4 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000068 7cc0b9c0
!	%f9  = bd40b569, %f19 = ffffffff
	fcmpes	%fcc0,%f9 ,%f19		! %fcc0 = 3
!	%f12 = ff800000 25a5fb25, Mem[00000000300c1410] = 00000000 00000000
	stda	%f12,[%i3+%o5]0x89	! Mem[00000000300c1410] = ff800000 25a5fb25
!	%l7 = ffffffffffea07c0, Mem[000000001018142f] = 717dd20f, %asi = 80
	stba	%l7,[%i6+0x02f]%asi	! Mem[000000001018142c] = 717dd2c0
!	Mem[0000000010041410] = c0b9c07c836de8b7, %l2 = 0000000000680000, %l6 = 000000000000174c
	add	%i1,0x10,%g1
	casxa	[%g1]0x80,%l2,%l6	! %l6 = c0b9c07c836de8b7
!	%f25 = 5fb540bd, Mem[0000000010041408] = c9bce100
	sta	%f25,[%i1+%o4]0x80	! Mem[0000000010041408] = 5fb540bd
!	Mem[0000000010041410] = c0b9c07c, %l4 = 000000003d40b569
	ldstuba	[%i1+%o5]0x80,%l4	! %l4 = 00000000000000c0
!	%l0 = 00000000561632b3, Mem[0000000030041400] = ffffd78a
	stwa	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 561632b3

p0_label_76:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1405] = ffffa8ff, %l1 = 00000000c9bce100
	ldsb	[%i3+0x005],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010181408] = ffffffff, %l7 = ffffffffffea07c0
	lduwa	[%i6+%o4]0x80,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000030081410] = 000021ff, %l3 = 0000000000000000
	lduwa	[%i2+%o5]0x89,%l3	! %l3 = 00000000000021ff
!	Mem[0000000030101410] = ffffff9c, %f12 = ff800000
	lda	[%i4+%o5]0x89,%f12	! %f12 = ffffff9c
!	Mem[0000000010181400] = c9bce100 53013639, %l2 = 00680000, %l3 = 000021ff
	ldda	[%i6+%g0]0x80,%l2	! %l2 = 00000000c9bce100 0000000053013639
!	Mem[0000000010001408] = 9cffffff, %l7 = 00000000ffffffff
	ldsha	[%i0+%o4]0x80,%l7	! %l7 = ffffffffffff9cff
!	Mem[0000000010181400] = 3936015300e1bcc9, %f4  = 00000068 7cc0b9c0
	ldda	[%i6+%g0]0x88,%f4 	! %f4  = 39360153 00e1bcc9
!	Mem[0000000010041400] = 46000000, %l6 = c0b9c07c836de8b7
	ldsha	[%i1+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141408] = a2480000, %l4 = 00000000000000c0
	lduha	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000000
!	%l2 = 00000000c9bce100, %l2 = 00000000c9bce100, %l7 = ffffffffffff9cff
	udivx	%l2,%l2,%l7		! %l7 = 0000000000000001

p0_label_77:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1428] = 000000ff, %l4 = 0000000000000000
	swap	[%i3+0x028],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030141410] = ffea07c0, %l1 = 00000000ffffffff
	swapa	[%i5+%o5]0x89,%l1	! %l1 = 00000000ffea07c0
!	Mem[0000000030001410] = 1f90d592, %l4 = 00000000000000ff
	swapa	[%i0+%o5]0x89,%l4	! %l4 = 000000001f90d592
!	%f6  = 4324c6ff 1a6fa86b, %l2 = 00000000c9bce100
!	Mem[0000000010101430] = 1c1e8fc44f2b2645
	add	%i4,0x030,%g1
	stda	%f6,[%g1+%l2]ASI_PST32_P ! Mem[0000000010101430] = 1c1e8fc44f2b2645
!	%l2 = 00000000c9bce100, Mem[0000000010081400] = 000000ff
	stha	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = e10000ff
!	%l2 = c9bce100, %l3 = 53013639, Mem[0000000010081408] = 00000068 0000174c
	stda	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = c9bce100 53013639
!	Code Fragment 3, seed = 425897
p0_fragment_11:
!	%l0 = 00000000561632b3
	setx	0x34b56f9b698073de,%g7,%l0 ! %l0 = 34b56f9b698073de
!	%l1 = 00000000ffea07c0
	setx	0x5727101d918a3a89,%g7,%l1 ! %l1 = 5727101d918a3a89
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 34b56f9b698073de
	setx	0x07d2922f53eedd44,%g7,%l0 ! %l0 = 07d2922f53eedd44
!	%l1 = 5727101d918a3a89
	setx	0xe05d2c90dff4df0f,%g7,%l1 ! %l1 = e05d2c90dff4df0f
p0_fragment_11_end:
!	%l4 = 000000001f90d592, Mem[0000000010101438] = c0b9c07c836de8b7, %asi = 80
	stxa	%l4,[%i4+0x038]%asi	! Mem[0000000010101438] = 000000001f90d592
!	Mem[0000000030141410] = ffffffff, %l5 = 000000008ad7ffff
	swapa	[%i5+%o5]0x81,%l5	! %l5 = 00000000ffffffff
!	%l1 = e05d2c90dff4df0f, Mem[0000000010001410] = 000000ec
	stwa	%l1,[%i0+%o5]0x80	! Mem[0000000010001410] = dff4df0f

p0_label_78:
!	Starting 10 instruction Load Burst
!	%f0  = d78aa25d, %f1  = a2480000
	fcmpes	%fcc1,%f0 ,%f1 		! %fcc1 = 1
!	Mem[0000000030081410] = ff210000 12441d3d, %l4 = 1f90d592, %l5 = ffffffff
	ldda	[%i2+%o5]0x81,%l4	! %l4 = 00000000ff210000 0000000012441d3d
!	Mem[00000000211c0001] = ffff8970, %l2 = 00000000c9bce100
	ldsb	[%o2+0x001],%l2		! %l2 = ffffffffffffffff
!	%l3 = 0000000053013639, immd = 0000000000000687, %l108 = 0000000000000003
	udivx	%l3,0x687,%l3		! %l3 = 00000000000cb76a
!	Mem[00000000211c0001] = ffff8970, %l1 = e05d2c90dff4df0f
	ldsb	[%o2+0x001],%l1		! %l1 = ffffffffffffffff
!	%f27 = 75d0cbff, %f14 = 1f90d592
	fcmpes	%fcc1,%f27,%f14		! %fcc1 = 2
!	Mem[0000000030041408] = 204a0000, %l2 = ffffffffffffffff
	lduba	[%i1+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1420] = 7c40e49c5fb540bd, %l1 = ffffffffffffffff, %l7 = 0000000000000001
	add	%i3,0x20,%g1
	casxa	[%g1]0x80,%l1,%l7	! %l7 = 7c40e49c5fb540bd
!	Mem[0000000030181400] = ff005237, %l7 = 7c40e49c5fb540bd
	lduha	[%i6+%g0]0x81,%l7	! %l7 = 000000000000ff00
!	Mem[00000000100c1408] = ffffffff00e1bcc9, %f24 = 7c40e49c 5fb540bd
	ldda	[%i3+%o4]0x88,%f24	! %f24 = ffffffff 00e1bcc9

p0_label_79:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 836de8b7, %l4 = 00000000ff210000
	swapa	[%i3+%g0]0x81,%l4	! %l4 = 00000000836de8b7
!	%l0 = 07d2922f53eedd44, Mem[0000000030101400] = ff170000
	stwa	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 53eedd44
!	Mem[00000000100c140c] = ffffffff, %l0 = 53eedd44, %l6 = 00000000
	add	%i3,0x0c,%g1
	casa	[%g1]0x80,%l0,%l6	! %l6 = 00000000ffffffff
!	Mem[00000000300c1408] = 0000004c, %l1 = ffffffffffffffff
	ldstuba	[%i3+%o4]0x89,%l1	! %l1 = 000000000000004c
!	%f26 = 7e7b6ac6 75d0cbff, Mem[0000000030041410] = 4fe7efc1 87463f5e
	stda	%f26,[%i1+%o5]0x81	! Mem[0000000030041410] = 7e7b6ac6 75d0cbff
!	Code Fragment 3, seed = 301526
p0_fragment_12:
!	%l0 = 07d2922f53eedd44
	setx	0xc32de8a9be025f76,%g7,%l0 ! %l0 = c32de8a9be025f76
!	%l1 = 000000000000004c
	setx	0x607619d7558232a1,%g7,%l1 ! %l1 = 607619d7558232a1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = c32de8a9be025f76
	setx	0x440145072fd939dc,%g7,%l0 ! %l0 = 440145072fd939dc
!	%l1 = 607619d7558232a1
	setx	0x11682a000c7e7827,%g7,%l1 ! %l1 = 11682a000c7e7827
p0_fragment_12_end:
!	%f26 = 7e7b6ac6 75d0cbff, Mem[0000000010181400] = c9bce100 53013639
	stda	%f26,[%i6+%g0]0x80	! Mem[0000000010181400] = 7e7b6ac6 75d0cbff
!	Mem[0000000010101430] = 1c1e8fc4, %l5 = 12441d3d, %l0 = 2fd939dc
	add	%i4,0x30,%g1
	casa	[%g1]0x80,%l5,%l0	! %l0 = 000000001c1e8fc4
!	%f18 = c9bce100 ffffffff, %l3 = 00000000000cb76a
!	Mem[0000000010001400] = 000000ffbd40b5d3
	stda	%f18,[%i0+%l3]ASI_PST32_P ! Mem[0000000010001400] = c9bce100bd40b5d3
!	Mem[0000000030041408] = 204a0000, %l1 = 000000000c7e7827
	swapa	[%i1+%o4]0x89,%l1	! %l1 = 00000000204a0000

p0_label_80:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = b7e86d83, %l6 = 00000000ffffffff
	lduha	[%i2+%o5]0x88,%l6	! %l6 = 0000000000006d83
!	Mem[0000000030181410] = 2a21b55f65e84a24, %f10 = 51e3ed68 3d40b569
	ldda	[%i6+%o5]0x81,%f10	! %f10 = 2a21b55f 65e84a24
!	Mem[0000000030101410] = 9cffffff, %l0 = 000000001c1e8fc4
	ldswa	[%i4+%o5]0x81,%l0	! %l0 = ffffffff9cffffff
!	Mem[0000000010041408] = bd40b55f, %l1 = 00000000204a0000
	ldsba	[%i1+%o4]0x88,%l1	! %l1 = 000000000000005f
!	Mem[0000000010141408] = 7cc0b9c0, %l3 = 00000000000cb76a
	ldsha	[%i5+%o4]0x88,%l3	! %l3 = ffffffffffffb9c0
!	Mem[00000000201c0000] = 174c9ee0, %l4 = 00000000836de8b7
	lduh	[%o0+%g0],%l4		! %l4 = 000000000000174c
!	Mem[0000000030081400] = 812cee44ff862443, %f6  = 4324c6ff 1a6fa86b
	ldda	[%i2+%g0]0x89,%f6 	! %f6  = 812cee44 ff862443
!	Mem[0000000030181410] = 2a21b55f65e84a24, %l6 = 0000000000006d83
	ldxa	[%i6+%o5]0x81,%l6	! %l6 = 2a21b55f65e84a24
!	Mem[000000001010141f] = 4dcad2f3, %l0 = ffffffff9cffffff, %asi = 80
	ldsba	[%i4+0x01f]%asi,%l0	! %l0 = fffffffffffffff3
!	Mem[0000000010041408] = 5fb540bd08aa5668, %f30 = 317693aa ffffffff
	ldda	[%i1+%o4]0x80,%f30	! %f30 = 5fb540bd 08aa5668

p0_label_81:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = ff000000, %l7 = 000000000000ff00
	ldstuba	[%i0+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	%l1 = 000000000000005f, %l1 = 000000000000005f, %l2 = 0000000000000000
	sub	%l1,%l1,%l2		! %l2 = 0000000000000000
!	%l0 = fffffff3, %l1 = 0000005f, Mem[00000000300c1400] = ff210000 664b3761
	stda	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = fffffff3 0000005f
!	Mem[0000000010181400] = 7e7b6ac6, %l6 = 0000000065e84a24, %asi = 80
	swapa	[%i6+0x000]%asi,%l6	! %l6 = 000000007e7b6ac6
!	%l5 = 0000000012441d3d, Mem[00000000100c1400] = ff84be3c
	stha	%l5,[%i3+%g0]0x80	! Mem[00000000100c1400] = 1d3dbe3c
!	Mem[0000000030141410] = 8ad7ffff, %l3 = 00000000ffffb9c0
	swapa	[%i5+%o5]0x81,%l3	! %l3 = 000000008ad7ffff
!	%f30 = 5fb540bd 08aa5668, Mem[0000000010181408] = ffffffff 00000000
	stda	%f30,[%i6+%o4]0x80	! Mem[0000000010181408] = 5fb540bd 08aa5668
!	%l7 = 00000000000000ff, Mem[00000000300c1400] = fffffff3
	stha	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00fffff3
!	Mem[0000000010081418] = 2dff218a48a23333, %l6 = 000000007e7b6ac6, %l1 = 000000000000005f
	add	%i2,0x18,%g1
	casxa	[%g1]0x80,%l6,%l1	! %l1 = 2dff218a48a23333
!	Mem[0000000010001423] = 655b41d8, %l6 = 000000007e7b6ac6
	ldstuba	[%i0+0x023]%asi,%l6	! %l6 = 00000000000000d8

p0_label_82:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 1d3dbe3c ffffa8ff, %l6 = 000000d8, %l7 = 000000ff
	ldda	[%i3+%g0]0x80,%l6	! %l6 = 000000001d3dbe3c 00000000ffffa8ff
!	Mem[0000000010141410] = 43972b1700000043, %f4  = 39360153 00e1bcc9
	ldda	[%i5+%o5]0x88,%f4 	! %f4  = 43972b17 00000043
!	Mem[0000000030081410] = ff21000012441d3d, %l7 = 00000000ffffa8ff
	ldxa	[%i2+%o5]0x81,%l7	! %l7 = ff21000012441d3d
!	Mem[0000000010081410] = 836de8b7, %l4 = 000000000000174c
	lduw	[%i2+%o5],%l4		! %l4 = 00000000836de8b7
!	Mem[0000000030141408] = 000048a2, %l1 = 2dff218a48a23333
	ldswa	[%i5+%o4]0x81,%l1	! %l1 = 00000000000048a2
!	Mem[00000000300c1408] = ff000000 2ef77b67, %l6 = 1d3dbe3c, %l7 = 12441d3d
	ldda	[%i3+%o4]0x81,%l6	! %l6 = 00000000ff000000 000000002ef77b67
!	Mem[0000000010181428] = 63843816717dd2c0, %l4 = 00000000836de8b7, %asi = 80
	ldxa	[%i6+0x028]%asi,%l4	! %l4 = 63843816717dd2c0
!	Mem[0000000010141428] = 7e7b6ac6 75d0cbff, %l4 = 717dd2c0, %l5 = 12441d3d, %asi = 80
	ldda	[%i5+0x028]%asi,%l4	! %l4 = 000000007e7b6ac6 0000000075d0cbff
!	Mem[0000000010041410] = ffb9c07c836de8b7, %f4  = 43972b17 00000043
	ldda	[%i1+%o5]0x80,%f4 	! %f4  = ffb9c07c 836de8b7
!	Mem[0000000030081400] = ff862443, %l5 = 0000000075d0cbff
	ldsba	[%i2+%g0]0x89,%l5	! %l5 = 0000000000000043

p0_label_83:
!	Starting 10 instruction Store Burst
!	%f14 = 1f90d592, %f26 = 7e7b6ac6
	fcmpes	%fcc1,%f14,%f26		! %fcc1 = 1
!	Mem[0000000010081430] = 4d52f2796cb314c2, %l6 = 00000000ff000000, %l1 = 00000000000048a2
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l6,%l1	! %l1 = 4d52f2796cb314c2
!	%l5 = 0000000000000043, Mem[0000000010181434] = 86ff0005
	sth	%l5,[%i6+0x034]		! Mem[0000000010181434] = 00430005
!	Mem[000000001008143c] = 5beb30ab, %l2 = 0000000000000000, %asi = 80
	swapa	[%i2+0x03c]%asi,%l2	! %l2 = 000000005beb30ab
!	%l1 = 4d52f2796cb314c2, %l2 = 000000005beb30ab, %l6 = 00000000ff000000
	add	%l1,%l2,%l6		! %l6 = 4d52f279c89e456d
!	%l2 = 000000005beb30ab, Mem[000000001014140c] = 68000000
	stb	%l2,[%i5+0x00c]		! Mem[000000001014140c] = ab000000
!	%l0 = fffffffffffffff3, Mem[0000000010081418] = 2dff218a
	stb	%l0,[%i2+0x018]		! Mem[0000000010081418] = f3ff218a
!	%l5 = 0000000000000043, Mem[0000000030101410] = 9cffffff
	stwa	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000043
!	Mem[0000000010181400] = 244ae865, %l7 = 000000002ef77b67
	swapa	[%i6+%g0]0x88,%l7	! %l7 = 00000000244ae865
!	%f18 = c9bce100 ffffffff, %l4 = 000000007e7b6ac6
!	Mem[0000000010101400] = ffffffff65e84a24
	stda	%f18,[%i4+%l4]ASI_PST32_PL ! Mem[0000000010101400] = ffffffff00e1bcc9

p0_label_84:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = c0b9ffff, %l6 = 4d52f279c89e456d
	ldswa	[%i5+%o5]0x89,%l6	! %l6 = ffffffffc0b9ffff
!	Mem[0000000010101408] = 08aa8ad7, %l2 = 000000005beb30ab
	ldswa	[%i4+%o4]0x88,%l2	! %l2 = 0000000008aa8ad7
!	Mem[0000000030041408] = 27787e0c, %f28 = d3b540bd
	lda	[%i1+%o4]0x81,%f28	! %f28 = 27787e0c
!	Mem[0000000030001410] = 000000ff, %l7 = 00000000244ae865
	lduba	[%i0+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081400] = 432486ff, %l7 = 00000000000000ff
	lduha	[%i2+%g0]0x81,%l7	! %l7 = 0000000000004324
!	Mem[0000000010101408] = d78aaa080dd27257, %f12 = ffffff9c 25a5fb25
	ldda	[%i4+%o4]0x80,%f12	! %f12 = d78aaa08 0dd27257
!	Mem[0000000010001410] = 00000000 0fdff4df, %l4 = 7e7b6ac6, %l5 = 00000043
	ldda	[%i0+%o5]0x88,%l4	! %l4 = 000000000fdff4df 0000000000000000
!	Mem[0000000030141408] = a2480000, %f21 = 172b9743
	lda	[%i5+%o4]0x89,%f21	! %f21 = a2480000
!	Mem[0000000030181408] = 7c40e49c, %l4 = 000000000fdff4df
	ldsba	[%i6+%o4]0x89,%l4	! %l4 = ffffffffffffff9c
!	Mem[00000000218000c0] = 06ff8a30, %l5 = 0000000000000000, %asi = 80
	lduba	[%o3+0x0c0]%asi,%l5	! %l5 = 0000000000000006

p0_label_85:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000006, Mem[00000000300c1408] = 677bf72e000000ff
	stxa	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000000000006
!	Mem[00000000100c1410] = 43000000, %l1 = 000000006cb314c2
	swapa	[%i3+%o5]0x80,%l1	! %l1 = 0000000043000000
!	Mem[0000000010041410] = ffb9c07c, %l7 = 0000000000004324
	ldstuba	[%i1+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001408] = 9cffffffed680000, %l4 = ffffffffffffff9c, %l7 = 00000000000000ff
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l4,%l7	! %l7 = 9cffffffed680000
!	%l6 = ffffffffc0b9ffff, Mem[0000000010041400] = 46000000
	stwa	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = c0b9ffff
!	%l1 = 0000000043000000, Mem[0000000030141408] = 000048a200000023
	stxa	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000000043000000
!	Mem[0000000010001400] = c9bce100, %l5 = 0000000000000006
	ldstuba	[%i0+%g0]0x80,%l5	! %l5 = 00000000000000c9
!	%f30 = 5fb540bd, Mem[0000000030101408] = b7d0bb44
	sta	%f30,[%i4+%o4]0x81	! Mem[0000000030101408] = 5fb540bd
!	%f2  = 6856aa08 75cf9cf9, %l2 = 0000000008aa8ad7
!	Mem[00000000100c1438] = 317693aaffffffff
	add	%i3,0x038,%g1
	stda	%f2,[%g1+%l2]ASI_PST32_P ! Mem[00000000100c1438] = 6856aa0875cf9cf9
!	%f3  = 75cf9cf9, %f25 = 00e1bcc9, %f11 = 65e84a24
	fsubs	%f3 ,%f25,%f11		! %f11 = 75cf9cf9

p0_label_86:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 00000037, %l3 = 000000008ad7ffff
	ldsba	[%i0+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = 000068edffffff9c, %l5 = 00000000000000c9
	ldxa	[%i0+%o4]0x88,%l5	! %l5 = 000068edffffff9c
!	Mem[0000000010041410] = ffb9c07c, %l2 = 0000000008aa8ad7
	ldsha	[%i1+%o5]0x80,%l2	! %l2 = ffffffffffffffb9
!	Mem[0000000030081408] = fff00b679e514c17, %f0  = d78aa25d a2480000
	ldda	[%i2+%o4]0x89,%f0 	! %f0  = fff00b67 9e514c17
!	%f3  = 75cf9cf9, %f8  = 00000000, %f31 = 08aa5668
	fadds	%f3 ,%f8 ,%f31		! %f31 = 75cf9cf9
!	Mem[0000000010101435] = 4f2b2645, %l5 = 000068edffffff9c, %asi = 80
	ldsba	[%i4+0x035]%asi,%l5	! %l5 = 000000000000002b
!	Mem[000000001010142c] = 44ee2c81, %l5 = 000000000000002b, %asi = 80
	lduwa	[%i4+0x02c]%asi,%l5	! %l5 = 0000000044ee2c81
!	%f26 = 7e7b6ac6, %f2  = 6856aa08, %f31 = 75cf9cf9
	fadds	%f26,%f2 ,%f31		! %f31 = 7e7b6ac6
!	Mem[00000000300c1410] = 25fba525000080ff, %f8  = 00000000 bd40b569
	ldda	[%i3+%o5]0x81,%f8 	! %f8  = 25fba525 000080ff
!	Mem[0000000010001400] = ffbce100, %f18 = c9bce100
	lda	[%i0+%g0]0x80,%f18	! %f18 = ffbce100

p0_label_87:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[00000000201c0000] = 174c9ee0
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 00009ee0
!	%f16 = ff84be3c, %f28 = 27787e0c 0000006c
	fstox	%f16,%f28		! %f28 = 80000000 00000000
!	%l3 = 0000000000000000, Mem[0000000010101408] = d78aaa08
	stha	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000aa08
!	%l2 = ffffffffffffffb9, Mem[00000000100c1410] = 6cb314c2172b9743
	stxa	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffffffffffffffb9
!	Mem[0000000010181408] = 5fb540bd, %l7 = 00000000ed680000
	swapa	[%i6+%o4]0x80,%l7	! %l7 = 000000005fb540bd
!	%l1 = 0000000043000000, Mem[0000000010081432] = 4d52f279, %asi = 80
	stha	%l1,[%i2+0x032]%asi	! Mem[0000000010081430] = 4d520000
!	Mem[0000000030081408] = 9e514c17, %l6 = 00000000c0b9ffff
	swapa	[%i2+%o4]0x89,%l6	! %l6 = 000000009e514c17
!	Mem[0000000010001409] = 9cffffff, %l4 = ffffffffffffff9c
	ldstub	[%i0+0x009],%l4		! %l4 = 00000000000000ff
!	%f17 = ffffa8ff, Mem[00000000100c1408] = 00e1bcc9
	sta	%f17,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffffa8ff
!	%l5 = 0000000044ee2c81, Mem[0000000021800180] = ff6aa0c0, %asi = 80
	stha	%l5,[%o3+0x180]%asi	! Mem[0000000021800180] = 2c81a0c0

p0_label_88:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 5fb5212a, %l3 = 0000000000000000
	ldsha	[%i6+%o5]0x89,%l3	! %l3 = 000000000000212a
!	Mem[0000000030181400] = ff005237, %l3 = 000000000000212a
	ldswa	[%i6+%g0]0x81,%l3	! %l3 = ffffffffff005237
!	Mem[0000000030001408] = ffffffff, %l7 = 000000005fb540bd
	lduha	[%i0+%o4]0x89,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030001408] = ffffffff, %l5 = 0000000044ee2c81
	ldswa	[%i0+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010081408] = c9bce100, %l0 = fffffffffffffff3
	ldswa	[%i2+%o4]0x88,%l0	! %l0 = ffffffffc9bce100
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000010101400] = ffffffff 00e1bcc9 0000aa08 0dd27257
!	Mem[0000000010101410] = ffffff9c 65e84aff 7a5e924a 4dcad2f3
!	Mem[0000000010101420] = 633a1358 149b4f09 4c170000 44ee2c81
!	Mem[0000000010101430] = 1c1e8fc4 4f2b2645 00000000 1f90d592
	ldda	[%i4+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010101400
!	Mem[0000000010041410] = ffb9c07c, %l4 = 00000000000000ff
	ldsba	[%i1+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001410] = dff4df0f, %l5 = ffffffffffffffff
	ldswa	[%i0+%o5]0x80,%l5	! %l5 = ffffffffdff4df0f
!	Mem[0000000010181430] = 0bc4f484, %l5 = ffffffffdff4df0f, %asi = 80
	lduba	[%i6+0x030]%asi,%l5	! %l5 = 000000000000000b
!	Mem[0000000010101408] = 0000aa080dd27257, %f14 = 1f90d592 836de8b7
	ldda	[%i4+%o4]0x80,%f14	! %f14 = 0000aa08 0dd27257

p0_label_89:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = c0b9c07c, %l0 = 00000000c9bce100
	swapa	[%i5+%o4]0x80,%l0	! %l0 = 00000000c0b9c07c
!	%l7 = 000000000000ffff, Mem[0000000010041400] = ffffb9c0
	stw	%l7,[%i1+%g0]		! Mem[0000000010041400] = 0000ffff
!	%l5 = 000000000000000b, Mem[00000000100c1408] = ffa8ffff
	stwa	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000b
!	Mem[0000000010101400] = ffffffff, %l1 = 0000000043000000
	swapa	[%i4+%g0]0x88,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000030181410] = 2a21b55f, %l1 = 00000000ffffffff
	swapa	[%i6+%o5]0x81,%l1	! %l1 = 000000002a21b55f
!	%f4  = ffb9c07c 836de8b7, Mem[0000000010181400] = 677bf72e 75d0cbff
	stda	%f4 ,[%i6+%g0]0x80	! Mem[0000000010181400] = ffb9c07c 836de8b7
!	%f5  = 836de8b7, Mem[0000000010081410] = 836de8b7
	sta	%f5 ,[%i2+%o5]0x80	! Mem[0000000010081410] = 836de8b7
!	Mem[0000000010001408] = ffffff9c, %l5 = 000000000000000b
	ldstuba	[%i0+%o4]0x88,%l5	! %l5 = 000000000000009c
!	%l2 = ffffffffffffffb9, Mem[0000000030001400] = 0000003700000000
	stxa	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = ffffffffffffffb9
!	Mem[0000000010081400] = ff0000e1, %l4 = 00000000ffffffff
	swapa	[%i2+%g0]0x88,%l4	! %l4 = 00000000ff0000e1

p0_label_90:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ffcbd075c66a7b7e, %f6  = 812cee44 ff862443
	ldda	[%i1+%o5]0x89,%f6 	! %f6  = ffcbd075 c66a7b7e
!	%f7  = c66a7b7e, %f6  = ffcbd075, %f2  = 6856aa08
	fmuls	%f7 ,%f6 ,%f2 		! %f2  = ffcbd075
!	Mem[0000000010081408] = c9bce100, %l7 = 000000000000ffff
	ldsba	[%i2+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = 00000006, %l7 = 0000000000000000
	lduwa	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000006
!	Mem[0000000030181400] = ff005237, %l7 = 0000000000000006
	ldsba	[%i6+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010081400] = ffffffff, %f10 = 2a21b55f
	lda	[%i2+%g0]0x80,%f10	! %f10 = ffffffff
!	Mem[0000000010181410] = ff00ffd2 0000aa08, %l6 = 9e514c17, %l7 = ffffffff
	ldda	[%i6+%o5]0x80,%l6	! %l6 = 00000000ff00ffd2 000000000000aa08
!	Mem[0000000010141410] = 43000000, %l5 = 000000000000009c
	lduba	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000043
!	Mem[00000000218000c0] = 06ff8a30, %l1 = 000000002a21b55f
	ldsb	[%o3+0x0c0],%l1		! %l1 = 0000000000000006
!	Mem[0000000030081410] = 000021ff, %l2 = ffffffffffffffb9
	ldsba	[%i2+%o5]0x89,%l2	! %l2 = ffffffffffffffff

p0_label_91:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = ffffffff, %l2 = 00000000ffffffff
	swapa	[%i6+%o5]0x81,%l2	! %l2 = 00000000ffffffff
!	%f16 = ffffffff 00e1bcc9, Mem[00000000300c1410] = 25a5fb25 ff800000
	stda	%f16,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffffffff 00e1bcc9
!	%f12 = d78aaa08 0dd27257, %l2 = 00000000ffffffff
!	Mem[0000000010181400] = ffb9c07c836de8b7
	stda	%f12,[%i6+%l2]ASI_PST32_PL ! Mem[0000000010181400] = 5772d20d08aa8ad7
!	Mem[0000000010041400] = ffff0000, %l2 = 00000000ffffffff
	swapa	[%i1+%g0]0x88,%l2	! %l2 = 00000000ffff0000
!	%f10 = ffffffff 75cf9cf9, Mem[0000000010001408] = ffffffff ed680000
	std	%f10,[%i0+%o4]		! Mem[0000000010001408] = ffffffff 75cf9cf9
!	%l5 = 0000000000000043, Mem[0000000020800001] = 40287110, %asi = 80
	stba	%l5,[%o1+0x001]%asi	! Mem[0000000020800000] = 40437110
!	%l1 = 0000000000000006, Mem[0000000030181400] = ff00523784f4c40b
	stxa	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000000000006
!	%l7 = 000000000000aa08, Mem[0000000030081410] = ff210000
	stwa	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000aa08
	membar	#Sync			! Added by membar checker (16)
!	%l1 = 0000000000000006, Mem[0000000010101410] = ffffff9c65e84aff, %asi = 80
	stxa	%l1,[%i4+0x010]%asi	! Mem[0000000010101410] = 0000000000000006
!	Mem[0000000010041400] = ffffffff, %l5 = 0000000000000043
	swapa	[%i1+%g0]0x80,%l5	! %l5 = 00000000ffffffff

p0_label_92:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ffffb9c0, %f21 = 65e84aff
	lda	[%i2+%o4]0x81,%f21	! %f21 = ffffb9c0
!	Mem[0000000030181408] = 9ce4407c00e1bcc9, %l6 = 00000000ff00ffd2
	ldxa	[%i6+%o4]0x81,%l6	! %l6 = 9ce4407c00e1bcc9
!	Mem[0000000010141428] = 7e7b6ac6, %l3 = ffffffffff005237
	lduh	[%i5+0x028],%l3		! %l3 = 0000000000007e7b
!	%f28 = 1c1e8fc4, %f10 = ffffffff
	fcmps	%fcc3,%f28,%f10		! %fcc3 = 3
!	Mem[0000000010101400] = 43000000, %l7 = 000000000000aa08
	ldsba	[%i4+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101408] = 5772d20d 08aa0000, %l0 = c0b9c07c, %l1 = 00000006
	ldda	[%i4+%o4]0x88,%l0	! %l0 = 0000000008aa0000 000000005772d20d
!	Mem[0000000010001400] = 00e1bcff, %l6 = 9ce4407c00e1bcc9
	ldswa	[%i0+%g0]0x88,%l6	! %l6 = 0000000000e1bcff
!	Mem[000000001018142c] = 717dd2c0, %l0 = 0000000008aa0000, %asi = 80
	ldswa	[%i6+0x02c]%asi,%l0	! %l0 = 00000000717dd2c0
!	Mem[0000000010081410] = b7e86d83, %l0 = 00000000717dd2c0
	lduha	[%i2+%o5]0x88,%l0	! %l0 = 0000000000006d83
!	Mem[0000000010001410] = dff4df0f, %f28 = 1c1e8fc4
	lda	[%i0+%o5]0x80,%f28	! %f28 = dff4df0f

p0_label_93:
!	Starting 10 instruction Store Burst
!	%f23 = 4dcad2f3, Mem[0000000010081410] = 836de8b7
	sta	%f23,[%i2+%o5]0x80	! Mem[0000000010081410] = 4dcad2f3
!	%l3 = 0000000000007e7b, Mem[0000000030181400] = 0000000000000006
	stxa	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000000007e7b
!	Mem[00000000100c1410] = ffffffff, %l1 = 000000005772d20d
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000030081408] = ffffb9c0, %l0 = 0000000000006d83
	swapa	[%i2+%o4]0x81,%l0	! %l0 = 00000000ffffb9c0
!	%f12 = d78aaa08, Mem[0000000030101408] = 5fb540bd
	sta	%f12,[%i4+%o4]0x81	! Mem[0000000030101408] = d78aaa08
!	%f3  = 75cf9cf9, %f31 = 1f90d592
	fcmpes	%fcc3,%f3 ,%f31		! %fcc3 = 2
!	%l7 = 0000000000000000, Mem[00000000100c143d] = 75cf9cf9
	stb	%l7,[%i3+0x03d]		! Mem[00000000100c143c] = 75009cf9
!	%l7 = 0000000000000000, %l1 = 00000000ffffffff, %l1 = 00000000ffffffff
	xnor	%l7,%l1,%l1		! %l1 = ffffffff00000000
!	%f20 = ffffff9c, Mem[0000000010001430] = 00000000
	st	%f20,[%i0+0x030]	! Mem[0000000010001430] = ffffff9c
!	%l2 = ffff0000, %l3 = 00007e7b, Mem[00000000300c1400] = f3ffff00 5f000000
	stda	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffff0000 00007e7b

p0_label_94:
!	Starting 10 instruction Load Burst
!	Mem[000000001004143c] = 92d590c0, %l3 = 0000000000007e7b, %asi = 80
	lduwa	[%i1+0x03c]%asi,%l3	! %l3 = 0000000092d590c0
!	Mem[0000000010141410] = 43000000, %l3 = 0000000092d590c0
	lduwa	[%i5+%o5]0x80,%l3	! %l3 = 0000000043000000
!	Mem[00000000211c0000] = ffff8970, %l3 = 0000000043000000, %asi = 80
	ldsha	[%o2+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030101408] = c282134c08aa8ad7, %l3 = ffffffffffffffff
	ldxa	[%i4+%o4]0x89,%l3	! %l3 = c282134c08aa8ad7
!	Mem[0000000010101400] = 0000004300e1bcc9, %f16 = ffffffff 00e1bcc9
	ldda	[%i4+%g0]0x80,%f16	! %f16 = 00000043 00e1bcc9
!	Mem[0000000030081400] = 432486ff, %l6 = 0000000000e1bcff
	lduba	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000043
!	%l7 = 0000000000000000, imm = 0000000000000b31, %l5 = 00000000ffffffff
	sub	%l7,0xb31,%l5		! %l5 = fffffffffffff4cf
!	Mem[0000000010001408] = ffffffff, %l0 = 00000000ffffb9c0
	ldsha	[%i0+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030041400] = a151e168 561632b3, %l0 = ffffffff, %l1 = 00000000
	ldda	[%i1+%g0]0x89,%l0	! %l0 = 00000000561632b3 00000000a151e168
!	Mem[0000000010181430] = 0bc4f48400430005, %l5 = fffffffffffff4cf, %asi = 80
	ldxa	[%i6+0x030]%asi,%l5	! %l5 = 0bc4f48400430005

p0_label_95:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000a151e168, Mem[00000000100c1430] = d3b540bd0000006c, %asi = 80
	stxa	%l1,[%i3+0x030]%asi	! Mem[00000000100c1430] = 00000000a151e168
!	%f24 = 633a1358 149b4f09, Mem[00000000300c1408] = 06000000 00000000
	stda	%f24,[%i3+%o4]0x81	! Mem[00000000300c1408] = 633a1358 149b4f09
!	%f26 = 4c170000 44ee2c81, %l6 = 0000000000000043
!	Mem[0000000030001430] = 1e3b257418d41735
	add	%i0,0x030,%g1
	stda	%f26,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030001430] = 812cee440000174c
!	%l6 = 0000000000000043, Mem[0000000010041430] = 0000212a, %asi = 80
	stwa	%l6,[%i1+0x030]%asi	! Mem[0000000010041430] = 00000043
!	%l0 = 561632b3, %l1 = a151e168, Mem[0000000010081400] = ffffffff 244ae865
	stda	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 561632b3 a151e168
!	%l7 = 0000000000000000, Mem[000000001000141a] = 0bae8cca, %asi = 80
	stha	%l7,[%i0+0x01a]%asi	! Mem[0000000010001418] = 0bae0000
!	Mem[0000000020800041] = ff85bf40, %l1 = 00000000a151e168
	ldstuba	[%o1+0x041]%asi,%l1	! %l1 = 0000000000000085
!	Mem[0000000010041410] = 7cc0b9ff, %l0 = 00000000561632b3
	ldstuba	[%i1+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	%l1 = 0000000000000085, immd = 00000000000005a4, %l4  = 00000000ff0000e1
	mulx	%l1,0x5a4,%l4		! %l4 = 000000000002ee34
!	%f24 = 633a1358 149b4f09, Mem[0000000030141400] = 670bf0ff 174c519e
	stda	%f24,[%i5+%g0]0x89	! Mem[0000000030141400] = 633a1358 149b4f09

p0_label_96:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 149b4f09, %l1 = 0000000000000085
	lduwa	[%i5+%g0]0x89,%l1	! %l1 = 00000000149b4f09
!	Mem[0000000010141400] = ff84be3c ffffa8ff c9bce100 ab000000
!	Mem[0000000010141410] = 43000000 172b9743 174c519e 670bf0ff
!	Mem[0000000010141420] = 7c40e49c 5fb540bd 7e7b6ac6 75d0cbff
!	Mem[0000000010141430] = d3b540bd 0000006c 317693aa ffffffff
	ldda	[%i5+%g0]ASI_BLK_AIUP,%f0 	! Block Load from 0000000010141400
!	%l4 = 000000000002ee34, immd = 00000776, %y  = ffffd2f9
	udiv	%l4,0x776,%l4		! %l4 = 00000000ffffffff
	mov	%l0,%y			! %y = 000000ff
!	Mem[0000000030081408] = 836d0000, %f22 = 7a5e924a
	lda	[%i2+%o4]0x89,%f22	! %f22 = 836d0000
!	Mem[0000000010001400] = 00e1bcff, %l5 = 0bc4f48400430005
	lduwa	[%i0+%g0]0x88,%l5	! %l5 = 0000000000e1bcff
!	Mem[0000000030041410] = c66a7b7e, %l7 = 0000000000000000
	lduba	[%i1+%o5]0x89,%l7	! %l7 = 000000000000007e
!	Mem[00000000100c1400] = 1d3dbe3c, %l0 = 00000000000000ff
	lduha	[%i3+%g0]0x80,%l0	! %l0 = 0000000000001d3d
!	Mem[0000000010181410] = ff00ffd20000aa08, %l3 = c282134c08aa8ad7
	ldxa	[%i6+%o5]0x80,%l3	! %l3 = ff00ffd20000aa08
!	Mem[0000000010041408] = 5fb540bd, %l3 = ff00ffd20000aa08
	lduwa	[%i1+%o4]0x80,%l3	! %l3 = 000000005fb540bd
!	Mem[0000000030001408] = ffffffff, %l4 = 00000000ffffffff
	lduha	[%i0+%o4]0x89,%l4	! %l4 = 000000000000ffff

p0_label_97:
!	Starting 10 instruction Store Burst
!	%l3 = 000000005fb540bd, imm = 0000000000000a34, %l0 = 0000000000001d3d
	and	%l3,0xa34,%l0		! %l0 = 0000000000000034
!	Mem[0000000010041410] = 7cc0b9ff, %l6 = 0000000000000043
	swapa	[%i1+%o5]0x88,%l6	! %l6 = 000000007cc0b9ff
!	%f12 = d3b540bd 0000006c, Mem[0000000030041400] = 561632b3 a151e168
	stda	%f12,[%i1+%g0]0x89	! Mem[0000000030041400] = d3b540bd 0000006c
!	Mem[00000000201c0001] = 00009ee0, %l2 = 00000000ffff0000
	ldstub	[%o0+0x001],%l2		! %l2 = 0000000000000000
!	%f30 = 00000000 1f90d592, Mem[0000000030141400] = 149b4f09 633a1358
	stda	%f30,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 1f90d592
!	%l4 = 000000000000ffff, Mem[0000000010181400] = 5772d20d
	stwa	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000ffff
!	Mem[0000000010001408] = ffffffff, %l2 = 0000000000000000
	ldstuba	[%i0+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041428] = 4d62fc40, %l4 = 0000ffff, %l4 = 0000ffff
	add	%i1,0x28,%g1
	casa	[%g1]0x80,%l4,%l4	! %l4 = 000000004d62fc40
!	Mem[0000000010101424] = 149b4f09, %l7 = 000000000000007e, %asi = 80
	swapa	[%i4+0x024]%asi,%l7	! %l7 = 00000000149b4f09
!	Mem[0000000030081408] = 836d0000, %l3 = 000000005fb540bd
	ldstuba	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000000

p0_label_98:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 43000000, %l1 = 00000000149b4f09
	ldsha	[%i5+%o5]0x80,%l1	! %l1 = 0000000000004300
!	Mem[0000000010001408] = ffffffff, %l2 = 00000000000000ff
	ldswa	[%i0+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141410] = 43000000 172b9743, %l6 = 7cc0b9ff, %l7 = 149b4f09
	ldd	[%i5+%o5],%l6		! %l6 = 0000000043000000 00000000172b9743
!	%f10 = 7e7b6ac6 75d0cbff, Mem[0000000030001410] = 000000ff 4eddc86e
	stda	%f10,[%i0+%o5]0x89	! Mem[0000000030001410] = 7e7b6ac6 75d0cbff
!	Mem[00000000211c0001] = ffff8970, %l1 = 0000000000004300
	ldub	[%o2+0x001],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030101408] = d78aaa08, %l4 = 000000004d62fc40
	ldsba	[%i4+%o4]0x81,%l4	! %l4 = ffffffffffffffd7
!	Mem[0000000010141438] = 317693aa, %l1 = 00000000000000ff
	ldub	[%i5+0x038],%l1		! %l1 = 0000000000000031
!	Mem[0000000010001428] = 43972b17, %l4 = ffffffffffffffd7
	ldsb	[%i0+0x028],%l4		! %l4 = 0000000000000043
!	Mem[0000000030181410] = ffffffff, %l6 = 0000000043000000
	lduba	[%i6+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141408] = 00e1bcc9, %l5 = 0000000000e1bcff
	lduba	[%i5+%o4]0x88,%l5	! %l5 = 00000000000000c9

p0_label_99:
!	Starting 10 instruction Store Burst
!	%f26 = 4c170000 44ee2c81, %l4 = 0000000000000043
!	Mem[0000000030181438] = 1b5c951b92d5901f
	add	%i6,0x038,%g1
	stda	%f26,[%g1+%l4]ASI_PST32_S ! Mem[0000000030181438] = 4c17000044ee2c81
	membar	#Sync			! Added by membar checker (17)
!	%l6 = 00000000000000ff, Mem[0000000010141400] = ff84be3c
	stba	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = ff84be3c
!	Mem[0000000030001400] = ffffffff, %l6 = 00000000000000ff
	swapa	[%i0+%g0]0x89,%l6	! %l6 = 00000000ffffffff
!	Code Fragment 3, seed = 738837
p0_fragment_13:
!	%l0 = 0000000000000034
	setx	0xec30ef0c63886c7e,%g7,%l0 ! %l0 = ec30ef0c63886c7e
!	%l1 = 0000000000000031
	setx	0xbb5403cc06f55129,%g7,%l1 ! %l1 = bb5403cc06f55129
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ec30ef0c63886c7e
	setx	0x6e39afd07c2ab1e4,%g7,%l0 ! %l0 = 6e39afd07c2ab1e4
!	%l1 = bb5403cc06f55129
	setx	0xdea34dbb1f7d11af,%g7,%l1 ! %l1 = dea34dbb1f7d11af
p0_fragment_13_end:
!	Mem[0000000010081427] = 53dda149, %l6 = 00000000ffffffff
	ldstub	[%i2+0x027],%l6		! %l6 = 0000000000000049
!	Mem[0000000030141400] = 1f90d592, %l2 = ffffffffffffffff
	ldstuba	[%i5+%g0]0x89,%l2	! %l2 = 0000000000000092
!	%l1 = dea34dbb1f7d11af, Mem[00000000100c1434] = a151e168, %asi = 80
	stwa	%l1,[%i3+0x034]%asi	! Mem[00000000100c1434] = 1f7d11af
!	%l6 = 0000000000000049, Mem[00000000300c1400] = 0000ffff
	stwa	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000049
!	%l0 = 7c2ab1e4, %l1 = 1f7d11af, Mem[0000000010001420] = 655b41ff 5ee8b389
	std	%l0,[%i0+0x020]		! Mem[0000000010001420] = 7c2ab1e4 1f7d11af
!	Mem[00000000201c0000] = 00ff9ee0, %l3 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l3	! %l3 = 0000000000000000

p0_label_100:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 633a1358, %l3 = 0000000000000000
	ldswa	[%i3+%o4]0x81,%l3	! %l3 = 00000000633a1358
!	Mem[0000000030181410] = ffffffff, %l3 = 00000000633a1358
	ldsha	[%i6+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000300c1400] = 00007e7b49000000, %f26 = 4c170000 44ee2c81
	ldda	[%i3+%g0]0x89,%f26	! %f26 = 00007e7b 49000000
!	Mem[0000000010181410] = ff00ffd20000aa08, %f6  = 174c519e 670bf0ff
	ldda	[%i6+%o5]0x80,%f6 	! %f6  = ff00ffd2 0000aa08
!	Mem[0000000030001400] = 000000ff, %l3 = ffffffffffffffff
	lduwa	[%i0+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141410] = c214b36cc0b9ffff, %l1 = dea34dbb1f7d11af
	ldxa	[%i5+%o5]0x89,%l1	! %l1 = c214b36cc0b9ffff
!	Mem[00000000201c0001] = ffff9ee0, %l5 = 00000000000000c9
	ldsb	[%o0+0x001],%l5		! %l5 = ffffffffffffffff
!	Mem[00000000211c0001] = ffff8970, %l1 = c214b36cc0b9ffff, %asi = 80
	lduba	[%o2+0x001]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030041410] = c66a7b7e, %l2 = 0000000000000092
	ldsha	[%i1+%o5]0x89,%l2	! %l2 = 0000000000007b7e
!	Mem[00000000100c1430] = 000000001f7d11af, %f0  = ff84be3c ffffa8ff, %asi = 80
	ldda	[%i3+0x030]%asi,%f0 	! %f0  = 00000000 1f7d11af

p0_label_101:
!	Starting 10 instruction Store Burst
!	%f11 = 75d0cbff, Mem[0000000010141400] = 3cbe84ff
	sta	%f11,[%i5+%g0]0x88	! Mem[0000000010141400] = 75d0cbff
!	Mem[0000000030001400] = ff000000, %l2 = 0000000000007b7e
	ldstuba	[%i0+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%f8  = 7c40e49c 5fb540bd, %l7 = 00000000172b9743
!	Mem[0000000010041400] = 000000435da28ad7
	stda	%f8,[%i1+%l7]ASI_PST32_PL ! Mem[0000000010041400] = bd40b55f9ce4407c
!	Mem[0000000010141408] = 00e1bcc9, %l7 = 00000000172b9743
	swapa	[%i5+%o4]0x88,%l7	! %l7 = 0000000000e1bcc9
!	%l3 = 00000000000000ff, Mem[0000000030101410] = 43000000
	stha	%l3,[%i4+%o5]0x89	! Mem[0000000030101410] = 430000ff
!	Mem[0000000021800001] = 6066cfa0, %l1 = 00000000000000ff
	ldstuba	[%o3+0x001]%asi,%l1	! %l1 = 0000000000000066
!	Mem[0000000030081410] = 08aa0000, %l4 = 0000000000000043
	swapa	[%i2+%o5]0x89,%l4	! %l4 = 0000000008aa0000
!	Mem[0000000010001418] = 0bae0000, %l2 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x018]%asi,%l2	! %l2 = 000000000bae0000
!	Mem[0000000010081408] = c9bce100, %l0 = 000000007c2ab1e4
	swapa	[%i2+%o4]0x88,%l0	! %l0 = 00000000c9bce100
!	Mem[00000000201c0000] = ffff9ee0, %l0 = 00000000c9bce100
	ldstuba	[%o0+0x000]%asi,%l0	! %l0 = 00000000000000ff

p0_label_102:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = c0b9ffff, %l2 = 000000000bae0000
	lduwa	[%i5+%o5]0x89,%l2	! %l2 = 00000000c0b9ffff
!	Mem[0000000010141400] = ffcbd075, %l3 = 00000000000000ff
	ldswa	[%i5+%g0]0x80,%l3	! %l3 = ffffffffffcbd075
!	%l1 = 0000000000000066, imm = fffffffffffffa6d, %l3 = ffffffffffcbd075
	sub	%l1,-0x593,%l3		! %l3 = 00000000000005f9
!	Mem[00000000100c140d] = ffffffff, %l6 = 0000000000000049
	ldsb	[%i3+0x00d],%l6		! %l6 = ffffffffffffffff
!	Mem[00000000100c1400] = 1d3dbe3c ffffa8ff, %l6 = ffffffff, %l7 = 00e1bcc9
	ldda	[%i3+%g0]0x80,%l6	! %l6 = 000000001d3dbe3c 00000000ffffa8ff
!	Mem[0000000010181400] = d78aaa08 ffff0000, %l4 = 08aa0000, %l5 = ffffffff
	ldda	[%i6+%g0]0x88,%l4	! %l4 = 00000000ffff0000 00000000d78aaa08
!	Mem[0000000010001400] = ffbce100bd40b5d3, %f26 = 00007e7b 49000000, %asi = 80
	ldda	[%i0+0x000]%asi,%f26	! %f26 = ffbce100 bd40b5d3
!	Mem[00000000100c1410] = 5772d20d, %l3 = 00000000000005f9
	lduha	[%i3+%o5]0x88,%l3	! %l3 = 000000000000d20d
!	Mem[00000000100c1410] = 0dd27257, %l1 = 0000000000000066
	ldswa	[%i3+%o5]0x80,%l1	! %l1 = 000000000dd27257
!	%l7 = 00000000ffffa8ff, immd = fffffffffffff5e4, %l6  = 000000001d3dbe3c
	mulx	%l7,-0xa1c,%l6		! %l6 = fffff5e4036f8e1c

p0_label_103:
!	Starting 10 instruction Store Burst
!	%f25 = 149b4f09, Mem[00000000100c1410] = 5772d20d
	sta	%f25,[%i3+%o5]0x88	! Mem[00000000100c1410] = 149b4f09
!	%l1 = 000000000dd27257, Mem[0000000010001420] = 7c2ab1e4, %asi = 80
	stha	%l1,[%i0+0x020]%asi	! Mem[0000000010001420] = 7257b1e4
!	Mem[00000000300c1408] = 58133a63, %l0 = 00000000000000ff
	ldstuba	[%i3+%o4]0x89,%l0	! %l0 = 0000000000000063
!	Mem[0000000030141410] = c0b9ffff, %l2 = 00000000c0b9ffff
	ldstuba	[%i5+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141410] = ffffb9c0, %l3 = 000000000000d20d
	swapa	[%i5+%o5]0x81,%l3	! %l3 = 00000000ffffb9c0
!	%f31 = 1f90d592, %f4  = 43000000, %f13 = 0000006c
	fsubs	%f31,%f4 ,%f13		! %f13 = c3000000
!	%l1 = 000000000dd27257, Mem[000000001008140a] = e4b12a7c, %asi = 80
	stha	%l1,[%i2+0x00a]%asi	! Mem[0000000010081408] = e4b17257
!	Mem[0000000030101410] = 430000ff, %l3 = 00000000ffffb9c0
	ldstuba	[%i4+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	%f10 = 7e7b6ac6 75d0cbff, Mem[00000000100c1400] = 3cbe3d1d ffa8ffff
	stda	%f10,[%i3+%g0]0x88	! Mem[00000000100c1400] = 7e7b6ac6 75d0cbff
!	%f22 = 836d0000, Mem[0000000030101408] = 08aa8ad7
	sta	%f22,[%i4+%o4]0x89	! Mem[0000000030101408] = 836d0000

p0_label_104:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ffffffff, %l1 = 000000000dd27257
	ldsba	[%i0+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041420] = 69b540bd, %f19 = 0dd27257
	ld	[%i1+0x020],%f19	! %f19 = 69b540bd
!	Mem[0000000021800100] = ffb6c060, %l4 = 00000000ffff0000, %asi = 80
	lduba	[%o3+0x100]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181420] = 0000340000e1bcc9, %l2 = 00000000000000ff, %asi = 80
	ldxa	[%i6+0x020]%asi,%l2	! %l2 = 0000340000e1bcc9
!	Mem[0000000010141410] = 43972b1700000043, %f24 = 633a1358 149b4f09
	ldda	[%i5+%o5]0x88,%f24	! %f24 = 43972b17 00000043
!	%l7 = 00000000ffffa8ff, %l2 = 0000340000e1bcc9, %l0 = 0000000000000063
	sub	%l7,%l2,%l0		! %l0 = ffffcc00ff1dec36
!	Mem[00000000100c1418] = 174c519e, %l4 = 00000000000000ff
	ldsw	[%i3+0x018],%l4		! %l4 = 00000000174c519e
!	Mem[0000000030101400] = 53eedd447df07241, %l4 = 00000000174c519e
	ldxa	[%i4+%g0]0x81,%l4	! %l4 = 53eedd447df07241
!	%l7 = 00000000ffffa8ff, imm = fffffffffffffbd4, %l6 = fffff5e4036f8e1c
	subc	%l7,-0x42c,%l6		! %l6 = 00000000ffffad2b
!	Mem[00000000300c1408] = ff3a1358 149b4f09, %l6 = ffffad2b, %l7 = ffffa8ff
	ldda	[%i3+%o4]0x81,%l6	! %l6 = 00000000ff3a1358 00000000149b4f09

p0_label_105:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ff3a1358, Mem[00000000300c1408] = ff3a1358
	stwa	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff3a1358
!	%l7 = 00000000149b4f09, Mem[0000000010041408] = 5fb540bd
	stba	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = 09b540bd
!	Mem[0000000030001408] = ffffffff, %l3 = 00000000000000ff
	swapa	[%i0+%o4]0x89,%l3	! %l3 = 00000000ffffffff
!	%f8  = 7c40e49c 5fb540bd, Mem[00000000100c1418] = 174c519e 670bf0ff
	std	%f8 ,[%i3+0x018]	! Mem[00000000100c1418] = 7c40e49c 5fb540bd
!	%l7 = 00000000149b4f09, %l3 = 00000000ffffffff, %l5 = 00000000d78aaa08
	addc	%l7,%l3,%l5		! %l5 = 00000001149b4f08
!	%f5  = 172b9743, Mem[0000000010041430] = 00000043
	st	%f5 ,[%i1+0x030]	! Mem[0000000010041430] = 172b9743
!	%l5 = 00000001149b4f08, immd = fffffffffffffef8, %l0  = ffffcc00ff1dec36
	mulx	%l5,-0x108,%l0		! %l0 = fffffee2bfd67fc0
!	%l1 = ffffffffffffffff, %l1 = ffffffffffffffff, %l7 = 00000000149b4f09
	andn	%l1,%l1,%l7		! %l7 = 0000000000000000
!	%l0 = fffffee2bfd67fc0, Mem[0000000010141408] = 43972b17ab000000
	stxa	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = fffffee2bfd67fc0
!	Mem[0000000010141408] = e2feffff, %l6 = 00000000ff3a1358
	swapa	[%i5+%o4]0x88,%l6	! %l6 = 00000000e2feffff

p0_label_106:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = e4b17257 39360153, %l2 = 00e1bcc9, %l3 = ffffffff
	ldda	[%i2+%o4]0x80,%l2	! %l2 = 00000000e4b17257 0000000039360153
!	Mem[0000000030081410] = 43000000, %l2 = 00000000e4b17257
	ldsba	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000043
!	Mem[0000000010141400] = ffa8ffff 75d0cbff, %l2 = 00000043, %l3 = 39360153
	ldda	[%i5+%g0]0x88,%l2	! %l2 = 0000000075d0cbff 00000000ffa8ffff
!	Mem[0000000030141410] = 0000d20d6cb314c2, %l6 = 00000000e2feffff
	ldxa	[%i5+%o5]0x81,%l6	! %l6 = 0000d20d6cb314c2
!	Mem[0000000020800041] = ffffbf40, %l2 = 0000000075d0cbff
	ldsb	[%o1+0x041],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000030181410] = ffffffff, %l7 = 0000000000000000
	ldsha	[%i6+%o5]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000300c1410] = c9bce100, %f17 = 00e1bcc9
	lda	[%i3+%o5]0x81,%f17	! %f17 = c9bce100
!	%l6 = 6cb314c2, %l7 = ffffffff, Mem[00000000100c1400] = ffcbd075 c66a7b7e
	stda	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 6cb314c2 ffffffff
!	Mem[0000000030081400] = 432486ff, %l3 = 00000000ffa8ffff
	ldswa	[%i2+%g0]0x81,%l3	! %l3 = 00000000432486ff
!	Mem[0000000010041400] = bd40b55f9ce4407c, %f0  = 00000000 1f7d11af
	ldd	[%i1+%g0],%f0 		! %f0  = bd40b55f 9ce4407c

p0_label_107:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 0000000000000006, %l4 = 53eedd447df07241, %l2 = ffffffffffffffff
	add	%i4,0x10,%g1
	casxa	[%g1]0x80,%l4,%l2	! %l2 = 0000000000000006
!	%l7 = ffffffffffffffff, Mem[0000000030181408] = 9ce4407c
	stha	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = ffff407c
!	%f10 = 7e7b6ac6, Mem[00000000100c1420] = 7c40e49c
	sta	%f10,[%i3+0x020]%asi	! Mem[00000000100c1420] = 7e7b6ac6
!	%f20 = ffffff9c, Mem[0000000030181408] = 7c40ffff
	sta	%f20,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffff9c
!	%l1 = ffffffffffffffff, Mem[00000000218001c0] = 00444af0
	sth	%l1,[%o3+0x1c0]		! Mem[00000000218001c0] = ffff4af0
!	%l6 = 0000d20d6cb314c2, Mem[0000000010041422] = 69b540bd, %asi = 80
	stha	%l6,[%i1+0x022]%asi	! Mem[0000000010041420] = 69b514c2
!	%l1 = ffffffffffffffff, Mem[0000000010101408] = 0000aa08
	stba	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = ff00aa08
!	Mem[0000000010101400] = 00000043, %l5 = 00000000149b4f08
	swapa	[%i4+%g0]0x80,%l5	! %l5 = 0000000000000043
!	%f5  = 172b9743, Mem[00000000300c1410] = c9bce100
	sta	%f5 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 172b9743
!	%f26 = ffbce100, Mem[00000000300c1410] = 172b9743
	sta	%f26,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffbce100

p0_label_108:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 58133aff, %l6 = 0000d20d6cb314c2
	lduba	[%i3+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%f9  = 5fb540bd, %f22 = 836d0000, %f22 = 836d0000
	fsubs	%f9 ,%f22,%f22		! %f22 = 5fb540bd
!	Mem[0000000030041410] = ffcbd075 c66a7b7e, %l4 = 7df07241, %l5 = 00000043
	ldda	[%i1+%o5]0x89,%l4	! %l4 = 00000000c66a7b7e 00000000ffcbd075
!	Mem[00000000300c1410] = ffbce100ffffffff, %l4 = 00000000c66a7b7e
	ldxa	[%i3+%o5]0x81,%l4	! %l4 = ffbce100ffffffff
!	Mem[0000000010141420] = 7c40e49c, %l6 = 00000000000000ff
	ldsb	[%i5+0x020],%l6		! %l6 = 000000000000007c
!	Mem[0000000010141400] = 75d0cbff, %l3 = 00000000432486ff
	ldsba	[%i5+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101428] = 4c170000, %f11 = 75d0cbff
	ld	[%i4+0x028],%f11	! %f11 = 4c170000
!	Mem[0000000010081438] = 1d9ca36e00000000, %f30 = 00000000 1f90d592, %asi = 80
	ldda	[%i2+0x038]%asi,%f30	! %f30 = 1d9ca36e 00000000
!	Mem[0000000010001410] = 000000000fdff4df, %f18 = 0000aa08 69b540bd
	ldda	[%i0+%o5]0x88,%f18	! %f18 = 00000000 0fdff4df
!	Mem[0000000010041400] = 7c40e49c5fb540bd, %f16 = 00000043 c9bce100
	ldda	[%i1+%g0]0x88,%f16	! %f16 = 7c40e49c 5fb540bd

p0_label_109:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000006, Mem[0000000010041410] = 43000000
	stba	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 06000000
!	%l7 = ffffffffffffffff, Mem[0000000020800040] = ffffbf40, %asi = 80
	stha	%l7,[%o1+0x040]%asi	! Mem[0000000020800040] = ffffbf40
!	%l2 = 00000006, %l3 = ffffffff, Mem[0000000010081408] = e4b17257 39360153
	stda	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000006 ffffffff
!	%l4 = ffbce100ffffffff, Mem[0000000030101400] = 44ddee53
	stba	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 44ddeeff
!	Mem[0000000010101410] = 00000000, %l2 = 0000000000000006
	swapa	[%i4+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = ffffffff, %l4 = ffbce100ffffffff
	ldstuba	[%i0+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%l1 = ffffffffffffffff, Mem[0000000010181408] = 000068ed
	stha	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000ffff
!	Mem[0000000010101400] = 149b4f08, %l2 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l2	! %l2 = 00000000149b4f08
!	%f28 = dff4df0f, Mem[0000000010081408] = 06000000
	sta	%f28,[%i2+%o4]0x88	! Mem[0000000010081408] = dff4df0f
!	Mem[0000000030141410] = 0000d20d, %l6 = 000000000000007c
	ldstuba	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000

p0_label_110:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 5772d20d 08aa00ff, %l2 = 149b4f08, %l3 = ffffffff
	ldda	[%i4+%o4]0x88,%l2	! %l2 = 0000000008aa00ff 000000005772d20d
!	%f22 = 5fb540bd, %f8  = 7c40e49c, %f1  = 9ce4407c
	fadds	%f22,%f8 ,%f1 		! %f1  = 7c40e49c
!	Mem[0000000030101400] = ffeedd44, %l4 = 00000000000000ff
	lduha	[%i4+%g0]0x81,%l4	! %l4 = 000000000000ffee
!	Mem[0000000030041408] = 27787e0c00000046, %f26 = ffbce100 bd40b5d3
	ldda	[%i1+%o4]0x81,%f26	! %f26 = 27787e0c 00000046
!	Mem[0000000010181400] = 0000ffff, %l5 = 00000000ffcbd075
	lduha	[%i6+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1410] = ffffffff 00e1bcff, %l6 = 00000000, %l7 = ffffffff
	ldda	[%i3+%o5]0x89,%l6	! %l6 = 0000000000e1bcff 00000000ffffffff
!	Mem[0000000010141410] = 00000043, %l5 = 0000000000000000
	lduwa	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000043
!	Mem[00000000100c143a] = 6856aa08, %l3 = 000000005772d20d, %asi = 80
	lduha	[%i3+0x03a]%asi,%l3	! %l3 = 000000000000aa08
!	Mem[00000000100c1408] = 0b000000, %l3 = 000000000000aa08
	lduba	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141420] = 7c40e49c 5fb540bd, %l6 = 00e1bcff, %l7 = ffffffff, %asi = 80
	ldda	[%i5+0x020]%asi,%l6	! %l6 = 000000007c40e49c 000000005fb540bd

p0_label_111:
!	Starting 10 instruction Store Burst
!	%l0 = fffffee2bfd67fc0, immd = 0000085f, %y  = 000000ff
	sdiv	%l0,0x85f,%l2		! %l2 = 000000001e8d2e4a
	mov	%l0,%y			! %y = bfd67fc0
!	Mem[0000000010101438] = 00000000, %l5 = 0000000000000043
	swap	[%i4+0x038],%l5		! %l5 = 0000000000000000
!	%f23 = 4dcad2f3, %f21 = ffffb9c0, %f18 = 00000000
	fdivs	%f23,%f21,%f18		! %f18 = ffffb9c0
!	%l2 = 000000001e8d2e4a, Mem[0000000030181408] = ffffff9c
	stha	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = ffff2e4a
!	%f8  = 7c40e49c 5fb540bd, Mem[00000000100c1418] = 7c40e49c 5fb540bd
	std	%f8 ,[%i3+0x018]	! Mem[00000000100c1418] = 7c40e49c 5fb540bd
!	Mem[0000000010101428] = 4c170000, %l5 = 0000000000000000, %asi = 80
	swapa	[%i4+0x028]%asi,%l5	! %l5 = 000000004c170000
!	Mem[0000000010181400] = 0000ffff 08aa8ad7 ffff0000 08aa5668
!	%f16 = 7c40e49c 5fb540bd ffffb9c0 0fdff4df
!	%f20 = ffffff9c ffffb9c0 5fb540bd 4dcad2f3
!	%f24 = 43972b17 00000043 27787e0c 00000046
!	%f28 = dff4df0f 4f2b2645 1d9ca36e 00000000
	stda	%f16,[%i6+%g0]ASI_BLK_P	! Block Store to 0000000010181400
!	%f2  = c9bce100 ab000000, Mem[0000000030141400] = 1f90d5ff 00000000
	stda	%f2 ,[%i5+%g0]0x89	! Mem[0000000030141400] = c9bce100 ab000000
!	%l2 = 1e8d2e4a, %l3 = 00000000, Mem[0000000010081400] = 561632b3 a151e168
	stda	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 1e8d2e4a 00000000
!	%l0 = fffffee2bfd67fc0, Mem[0000000010141410] = 43000000
	stba	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = c0000000

p0_label_112:
!	Starting 10 instruction Load Burst
!	Code Fragment 4, seed = 826440
p0_fragment_14:
!	%l0 = fffffee2bfd67fc0
	setx	0x0b6cae2a8f495de6,%g7,%l0 ! %l0 = 0b6cae2a8f495de6
!	%l1 = ffffffffffffffff
	setx	0x300894ce2ecda611,%g7,%l1 ! %l1 = 300894ce2ecda611
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0b6cae2a8f495de6
	setx	0x4cdf3a3942e3124c,%g7,%l0 ! %l0 = 4cdf3a3942e3124c
!	%l1 = 300894ce2ecda611
	setx	0x92f19059d89da597,%g7,%l1 ! %l1 = 92f19059d89da597
p0_fragment_14_end:
!	Mem[00000000100c1408] = 0000000b, %l3 = 0000000000000000
	ldub	[%i3+%o4],%l3		! %l3 = 0000000000000000
!	Mem[0000000020800040] = ffffbf40, %l7 = 000000005fb540bd, %asi = 80
	lduba	[%o1+0x040]%asi,%l7	! %l7 = 00000000000000ff
!	%f14 = 317693aa ffffffff, Mem[00000000100c1428] = 00000000 00b8c2d6, %asi = 80
	stda	%f14,[%i3+0x028]%asi	! Mem[00000000100c1428] = 317693aa ffffffff
!	Mem[000000001010142e] = 44ee2c81, %l2 = 000000001e8d2e4a
	lduh	[%i4+0x02e],%l2		! %l2 = 0000000000002c81
!	Mem[0000000030001408] = ff000000, %l2 = 0000000000002c81
	ldsba	[%i0+%o4]0x81,%l2	! %l2 = ffffffffffffffff
!	Code Fragment 3, seed = 704287
p0_fragment_15:
!	%l0 = 4cdf3a3942e3124c
	setx	0xdce6cb6f5445ce2e,%g7,%l0 ! %l0 = dce6cb6f5445ce2e
!	%l1 = 92f19059d89da597
	setx	0x68a52218f01ac3d9,%g7,%l1 ! %l1 = 68a52218f01ac3d9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = dce6cb6f5445ce2e
	setx	0xc7d82d9c1f4f6594,%g7,%l0 ! %l0 = c7d82d9c1f4f6594
!	%l1 = 68a52218f01ac3d9
	setx	0x462604cfbe51365f,%g7,%l1 ! %l1 = 462604cfbe51365f
p0_fragment_15_end:
!	Mem[0000000030141410] = 0dd200ff, %l1 = 462604cfbe51365f
	ldsha	[%i5+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141408] = ff3a1358, %l3 = 0000000000000000
	lduwa	[%i5+%o4]0x88,%l3	! %l3 = 00000000ff3a1358
!	Mem[00000000100c1400] = ffffffff c214b36c, %l6 = 7c40e49c, %l7 = 000000ff
	ldda	[%i3+%g0]0x88,%l6	! %l6 = 00000000c214b36c 00000000ffffffff

p0_label_113:
!	Starting 10 instruction Store Burst
!	Mem[000000001010140d] = 0dd27257, %l3 = 00000000ff3a1358
	ldstuba	[%i4+0x00d]%asi,%l3	! %l3 = 00000000000000d2
!	%f0  = bd40b55f 7c40e49c, Mem[0000000010101400] = 00000000 c9bce100
	stda	%f0 ,[%i4+%g0]0x88	! Mem[0000000010101400] = bd40b55f 7c40e49c
!	%l6 = 00000000c214b36c, Mem[00000000100c1420] = 7e7b6ac6
	stw	%l6,[%i3+0x020]		! Mem[00000000100c1420] = c214b36c
!	%l3 = 00000000000000d2, Mem[0000000030001410] = ffcbd075
	stwa	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000d2
!	%f2  = c9bce100 ab000000, Mem[0000000010101410] = 00000006 00000006
	stda	%f2 ,[%i4+%o5]0x80	! Mem[0000000010101410] = c9bce100 ab000000
!	Mem[0000000030041410] = 7e7b6ac6, %l0 = 000000001f4f6594
	swapa	[%i1+%o5]0x81,%l0	! %l0 = 000000007e7b6ac6
!	%l0 = 000000007e7b6ac6, Mem[00000000100c1408] = 0000000bffffffff
	stxa	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000007e7b6ac6
!	%l6 = c214b36c, %l7 = ffffffff, Mem[0000000030001408] = 000000ff 69da74a7
	stda	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = c214b36c ffffffff
!	Mem[0000000010141400] = 75d0cbff, %l0 = 000000007e7b6ac6
	swapa	[%i5+%g0]0x88,%l0	! %l0 = 0000000075d0cbff
!	Mem[00000000100c1408] = 00000000, %l0 = 0000000075d0cbff
	swapa	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000000

p0_label_114:
!	Starting 10 instruction Load Burst
!	%l6 = 00000000c214b36c, %l5 = 000000004c170000, %y  = bfd67fc0
	smul	%l6,%l5,%l0		! %l0 = ed9895202eb40000, %y = ed989520
!	Mem[0000000010041410] = 00000006, %f21 = ffffb9c0
	lda	[%i1+%o5]0x88,%f21	! %f21 = 00000006
!	Mem[0000000010081400] = 1e8d2e4a, %l7 = 00000000ffffffff
	ldsha	[%i2+%g0]0x88,%l7	! %l7 = 0000000000002e4a
!	Mem[0000000030041410] = 94654f1f, %l7 = 0000000000002e4a
	ldsha	[%i1+%o5]0x89,%l7	! %l7 = 0000000000004f1f
!	Mem[0000000030041400] = 6c000000, %l4 = 000000000000ffee
	ldsba	[%i1+%g0]0x81,%l4	! %l4 = 000000000000006c
!	Mem[0000000030101408] = 836d0000, %l0 = ed9895202eb40000
	lduwa	[%i4+%o4]0x89,%l0	! %l0 = 00000000836d0000
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010181410] = c0b9ffff9cffffff, %l0 = 00000000836d0000
	ldxa	[%i6+%o5]0x88,%l0	! %l0 = c0b9ffff9cffffff
!	Mem[00000000300c1408] = ff3a1358, %l2 = ffffffffffffffff
	lduwa	[%i3+%o4]0x81,%l2	! %l2 = 00000000ff3a1358
!	Mem[00000000100c1410] = 094f9b14ffffffb9, %l1 = 00000000000000ff
	ldxa	[%i3+%o5]0x80,%l1	! %l1 = 094f9b14ffffffb9
!	Mem[0000000010001410] = dff4df0f, %f24 = 43972b17
	lda	[%i0+%o5]0x80,%f24	! %f24 = dff4df0f

p0_label_115:
!	Starting 10 instruction Store Burst
!	%f30 = 1d9ca36e, Mem[00000000300c1410] = 00e1bcff
	sta	%f30,[%i3+%o5]0x89	! Mem[00000000300c1410] = 1d9ca36e
!	Mem[0000000030101410] = 430000ff, %l0 = 000000009cffffff
	swapa	[%i4+%o5]0x89,%l0	! %l0 = 00000000430000ff
!	%l6 = 00000000c214b36c, Mem[00000000300c1408] = 58133aff
	stba	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 58133a6c
!	Mem[0000000010141400] = c66a7b7e, %l6 = 00000000c214b36c
	ldstuba	[%i5+%g0]0x80,%l6	! %l6 = 00000000000000c6
!	%l3 = 00000000000000d2, Mem[0000000010181412] = ffffff9c, %asi = 80
	stba	%l3,[%i6+0x012]%asi	! Mem[0000000010181410] = ffffd29c
!	%l7 = 0000000000004f1f, Mem[0000000010141408] = c07fd6bfff3a1358
	stxa	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000004f1f
!	%f2  = c9bce100, Mem[00000000100c141c] = 5fb540bd
	sta	%f2 ,[%i3+0x01c]%asi	! Mem[00000000100c141c] = c9bce100
!	%l1 = 094f9b14ffffffb9, Mem[0000000010041400] = 7c40e49c5fb540bd
	stxa	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 094f9b14ffffffb9
!	%l4 = 000000000000006c, Mem[00000000201c0000] = ffff9ee0, %asi = 80
	stha	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 006c9ee0
!	Mem[0000000010141410] = c0000000, %l0 = 00000000430000ff
	ldstuba	[%i5+%o5]0x80,%l0	! %l0 = 00000000000000c0

p0_label_116:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 432486ff44ee2c81, %f26 = 27787e0c 00000046
	ldda	[%i2+%g0]0x81,%f26	! %f26 = 432486ff 44ee2c81
!	Mem[0000000010141410] = 43972b17000000ff, %f28 = dff4df0f 4f2b2645
	ldda	[%i5+%o5]0x88,%f28	! %f28 = 43972b17 000000ff
!	Mem[00000000201c0000] = 006c9ee0, %l2 = 00000000ff3a1358
	ldub	[%o0+%g0],%l2		! %l2 = 0000000000000000
!	Mem[0000000030081410] = 00000043, %l2 = 0000000000000000
	lduwa	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000043
!	Mem[0000000010181400] = 9ce4407c, %l1 = 094f9b14ffffffb9
	ldsha	[%i6+%g0]0x88,%l1	! %l1 = 000000000000407c
!	Mem[0000000020800000] = 40437110, %l0 = 00000000000000c0, %asi = 80
	lduba	[%o1+0x000]%asi,%l0	! %l0 = 0000000000000040
!	Mem[0000000030101410] = ffffff9c, %l4 = 000000000000006c
	lduba	[%i4+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101408] = 00006d83, %l5 = 000000004c170000
	ldsba	[%i4+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001400] = ff000000, %f13 = c3000000
	lda	[%i0+%g0]0x81,%f13	! %f13 = ff000000
!	Code Fragment 4, seed = 668322
p0_fragment_16:
!	%l0 = 0000000000000040
	setx	0x39ec9aa3a1442516,%g7,%l0 ! %l0 = 39ec9aa3a1442516
!	%l1 = 000000000000407c
	setx	0x06591ade4cc18641,%g7,%l1 ! %l1 = 06591ade4cc18641
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 39ec9aa3a1442516
	setx	0x014e3c1cf438bb7c,%g7,%l0 ! %l0 = 014e3c1cf438bb7c
!	%l1 = 06591ade4cc18641
	setx	0x09c17bc9ba1ec7c7,%g7,%l1 ! %l1 = 09c17bc9ba1ec7c7
p0_fragment_16_end:

p0_label_117:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 7c40e49c, %l6 = 00000000000000c6
	swapa	[%i6+%g0]0x80,%l6	! %l6 = 000000007c40e49c
!	%f8  = 7c40e49c 5fb540bd, Mem[0000000010141400] = ff6a7b7e ffffa8ff
	stda	%f8 ,[%i5+%g0]0x80	! Mem[0000000010141400] = 7c40e49c 5fb540bd
!	%l4 = 00000000000000ff, Mem[0000000030081400] = 812cee44ff862443
	stxa	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000000000ff
!	%f22 = 5fb540bd 4dcad2f3, Mem[0000000010081400] = 4a2e8d1e 00000000
	stda	%f22,[%i2+%g0]0x80	! Mem[0000000010081400] = 5fb540bd 4dcad2f3
!	%l2 = 0000000000000043, Mem[0000000010101408] = 08aa00ff
	stba	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 08aa0043
!	%l3 = 00000000000000d2, Mem[00000000300c1410] = 1d9ca36e
	stba	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = 1d9ca3d2
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000030041408] = 0c7e7827 46000000
	stda	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000ff 00000000
!	Mem[0000000010141400] = 9ce4407c, %l1 = 00000000ba1ec7c7
	swapa	[%i5+%g0]0x88,%l1	! %l1 = 000000009ce4407c
!	Mem[0000000020800001] = 40437110, %l7 = 0000000000004f1f
	ldstub	[%o1+0x001],%l7		! %l7 = 0000000000000043
!	%f18 = ffffb9c0 0fdff4df, %l5 = 0000000000000000
!	Mem[0000000010041430] = 172b97438fee5cf8
	add	%i1,0x030,%g1
	stda	%f18,[%g1+%l5]ASI_PST32_P ! Mem[0000000010041430] = 172b97438fee5cf8

p0_label_118:
!	Starting 10 instruction Load Burst
!	Mem[000000001014141b] = 174c519e, %l6 = 000000007c40e49c
	ldub	[%i5+0x01b],%l6		! %l6 = 000000000000009e
!	%f6  = ff00ffd2, %f27 = 44ee2c81, %f10 = 7e7b6ac6
	fadds	%f6 ,%f27,%f10		! %f10 = ff00ffd2
!	Mem[000000001004141c] = ffc62443, %l2 = 0000000000000043, %asi = 80
	ldsha	[%i1+0x01c]%asi,%l2	! %l2 = ffffffffffffffc6
!	Mem[0000000030041400] = 0000006c, %l5 = 0000000000000000
	ldswa	[%i1+%g0]0x89,%l5	! %l5 = 000000000000006c
!	%l6 = 000000000000009e, %l1 = 000000009ce4407c, %l1 = 000000009ce4407c
	udivx	%l6,%l1,%l1		! %l1 = 0000000000000000
!	Mem[00000000100c1400] = ffffffffc214b36c, %f18 = ffffb9c0 0fdff4df
	ldda	[%i3+%g0]0x88,%f18	! %f18 = ffffffff c214b36c
!	Mem[0000000010181434] = 4f2b2645, %l6 = 000000000000009e
	ldsw	[%i6+0x034],%l6		! %l6 = 000000004f2b2645
!	Code Fragment 3, seed = 967083
p0_fragment_17:
!	%l0 = 014e3c1cf438bb7c
	setx	0x5474c37adaea05ce,%g7,%l0 ! %l0 = 5474c37adaea05ce
!	%l1 = 0000000000000000
	setx	0xdc3b27cdb399e979,%g7,%l1 ! %l1 = dc3b27cdb399e979
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5474c37adaea05ce
	setx	0x2448f71ad5ce1934,%g7,%l0 ! %l0 = 2448f71ad5ce1934
!	%l1 = dc3b27cdb399e979
	setx	0x5e998531995217ff,%g7,%l1 ! %l1 = 5e998531995217ff
p0_fragment_17_end:
!	Mem[0000000030101410] = 9cffffff, %l7 = 0000000000000043
	ldsha	[%i4+%o5]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010141400] = ba1ec7c7, %l2 = ffffffffffffffc6
	lduwa	[%i5+%g0]0x88,%l2	! %l2 = 00000000ba1ec7c7

p0_label_119:
!	Starting 10 instruction Store Burst
!	%l1 = 5e998531995217ff, immd = fffffffffffffbcc, %l0  = 2448f71ad5ce1934
	mulx	%l1,-0x434,%l0		! %l0 = 62bc2b8792f32434
!	Mem[0000000030001400] = 000000ff, %l4 = 00000000000000ff
	ldstuba	[%i0+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%f15 = ffffffff, Mem[0000000030081400] = ff000000
	sta	%f15,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffffff
!	%l1 = 5e998531995217ff, Mem[0000000010001428] = 43972b17bad8cecf
	stx	%l1,[%i0+0x028]		! Mem[0000000010001428] = 5e998531995217ff
!	%l7 = ffffffffffffffff, %l7 = ffffffffffffffff, %l1 = 5e998531995217ff
	subc	%l7,%l7,%l1		! %l1 = 0000000000000000
!	%f14 = 317693aa ffffffff, Mem[0000000010041400] = b9ffffff 149b4f09
	std	%f14,[%i1+%g0]		! Mem[0000000010041400] = 317693aa ffffffff
!	%l7 = ffffffffffffffff, Mem[0000000030081408] = ff006d83
	stba	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = ff006d83
!	Mem[0000000010181410] = ffffd29c, %l2 = 00000000ba1ec7c7
	swapa	[%i6+%o5]0x80,%l2	! %l2 = 00000000ffffd29c
!	Mem[0000000030041400] = 0000006c, %l3 = 00000000000000d2
	swapa	[%i1+%g0]0x89,%l3	! %l3 = 000000000000006c
!	%f24 = dff4df0f, Mem[0000000010081410] = 4dcad2f3
	sta	%f24,[%i2+%o5]0x80	! Mem[0000000010081410] = dff4df0f

p0_label_120:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800001] = 40ff7110, %l4 = 00000000000000ff, %asi = 80
	ldsba	[%o1+0x001]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c1410] = 094f9b14ffffffb9, %f10 = ff00ffd2 4c170000
	ldda	[%i3+%o5]0x80,%f10	! %f10 = 094f9b14 ffffffb9
!	%l0 = 62bc2b8792f32434, imm = fffffffffffffb2d, %l5 = 000000000000006c
	and	%l0,-0x4d3,%l5		! %l5 = 62bc2b8792f32024
!	Mem[00000000100c1410] = 094f9b14, %l5 = 62bc2b8792f32024
	ldswa	[%i3+%o5]0x80,%l5	! %l5 = 00000000094f9b14
!	%l3 = 000000000000006c, %l7 = ffffffffffffffff, %l4 = ffffffffffffffff
	subc	%l3,%l7,%l4		! %l4 = 000000000000006d
!	Mem[0000000030141410] = 0dd200ff, %l3 = 000000000000006c
	lduba	[%i5+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1410] = d2a39c1d, %l4 = 000000000000006d
	ldswa	[%i3+%o5]0x81,%l4	! %l4 = ffffffffd2a39c1d
!	Mem[0000000030081410] = 00000043, %l0 = 62bc2b8792f32434
	lduba	[%i2+%o5]0x89,%l0	! %l0 = 0000000000000043
!	Mem[0000000030041408] = ff000000, %l0 = 0000000000000043
	ldswa	[%i1+%o4]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010181428] = 27787e0c, %l7 = ffffffffffffffff, %asi = 80
	lduwa	[%i6+0x028]%asi,%l7	! %l7 = 0000000027787e0c

p0_label_121:
!	Starting 10 instruction Store Burst
!	%l4 = d2a39c1d, %l5 = 094f9b14, Mem[0000000030001408] = c214b36c ffffffff
	stda	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = d2a39c1d 094f9b14
!	%f26 = 432486ff 44ee2c81, Mem[0000000030001410] = 000000d2 c66a7b7e
	stda	%f26,[%i0+%o5]0x81	! Mem[0000000030001410] = 432486ff 44ee2c81
!	Mem[0000000030041410] = 94654f1f, %l0 = ffffffffff000000
	lduwa	[%i1+%o5]0x89,%l0	! %l0 = 0000000094654f1f
!	%l1 = 0000000000000000, Mem[00000000201c0000] = 006c9ee0
	sth	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 00009ee0
!	Mem[0000000010041434] = 8fee5cf8, %l3 = 00000000000000ff
	swap	[%i1+0x034],%l3		! %l3 = 000000008fee5cf8
!	%l5 = 00000000094f9b14, Mem[0000000010101422] = 633a1358, %asi = 80
	stba	%l5,[%i4+0x022]%asi	! Mem[0000000010101420] = 633a1458
!	Mem[0000000030141400] = 000000ab, %l6 = 000000004f2b2645
	ldstuba	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%l2 = 00000000ffffd29c, Mem[00000000300c1400] = 00000049
	stwa	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffd29c
!	%f28 = 43972b17, %f14 = 317693aa, %f2  = c9bce100
	fsubs	%f28,%f14,%f2 		! %f2  = 43972b17
!	%l4 = ffffffffd2a39c1d, Mem[0000000030001408] = 1d9ca3d2
	stha	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 9c1da3d2

p0_label_122:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800001] = 40ff7110, %l7 = 0000000027787e0c, %asi = 80
	lduba	[%o1+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181400] = 000000c65fb540bd, %l2 = 00000000ffffd29c
	ldxa	[%i6+%g0]0x80,%l2	! %l2 = 000000c65fb540bd
!	Mem[00000000100c1410] = b9ffffff149b4f09, %l3 = 000000008fee5cf8
	ldxa	[%i3+%o5]0x88,%l3	! %l3 = b9ffffff149b4f09
!	Mem[00000000100c1400] = c214b36c, %l5 = 00000000094f9b14
	ldswa	[%i3+%g0]0x88,%l5	! %l5 = ffffffffc214b36c
!	Mem[0000000010081408] = 0fdff4df, %l7 = 00000000000000ff
	lduwa	[%i2+%o4]0x80,%l7	! %l7 = 000000000fdff4df
!	Mem[0000000030041410] = 94654f1f, %l0 = 0000000094654f1f
	lduba	[%i1+%o5]0x89,%l0	! %l0 = 000000000000001f
!	Mem[0000000010081430] = 4d520000, %l7 = 000000000fdff4df
	lduw	[%i2+0x030],%l7		! %l7 = 000000004d520000
!	%l3 = b9ffffff149b4f09, %l6 = 0000000000000000, %l2 = 000000c65fb540bd
	and	%l3,%l6,%l2		! %l2 = 0000000000000000
!	Mem[0000000010081410] = dff4df0f, %l4 = ffffffffd2a39c1d
	lduwa	[%i2+%o5]0x80,%l4	! %l4 = 00000000dff4df0f
!	Mem[0000000010081408] = dff4df0f, %l5 = ffffffffc214b36c
	ldsha	[%i2+%o4]0x88,%l5	! %l5 = ffffffffffffdf0f

p0_label_123:
!	Starting 10 instruction Store Burst
!	%f8  = 7c40e49c 5fb540bd, Mem[0000000010001410] = dff4df0f 00000000
	stda	%f8 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 7c40e49c 5fb540bd
!	Mem[0000000010081400] = bd40b55f, %l4 = 00000000dff4df0f
	swapa	[%i2+%g0]0x88,%l4	! %l4 = 00000000bd40b55f
!	Mem[0000000030081400] = ffffffff, %l1 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l1	! %l1 = 00000000ffffffff
!	%f16 = 7c40e49c 5fb540bd, Mem[0000000010041400] = aa937631 ffffffff
	stda	%f16,[%i1+%g0]0x88	! Mem[0000000010041400] = 7c40e49c 5fb540bd
!	%f29 = 000000ff, Mem[0000000010141408] = 1f4f0000
	sta	%f29,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000ff
!	Mem[0000000010141410] = ff000000, %l2 = 0000000000000000
	swapa	[%i5+%o5]0x80,%l2	! %l2 = 00000000ff000000
!	%f20 = ffffff9c 00000006, Mem[0000000010041410] = 00000006 b7e86d83
	stda	%f20,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffff9c 00000006
!	Mem[0000000010101437] = 4f2b2645, %l4 = 00000000bd40b55f
	ldstub	[%i4+0x037],%l4		! %l4 = 0000000000000045
!	Mem[0000000030041400] = 000000d2, %l0 = 000000000000001f
	ldstuba	[%i1+%g0]0x89,%l0	! %l0 = 00000000000000d2
!	Mem[00000000300c1400] = 9cd2ffff, %l7 = 000000004d520000
	ldstuba	[%i3+%g0]0x89,%l7	! %l7 = 00000000000000ff

p0_label_124:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 4300aa080dff7257, %f24 = dff4df0f 00000043
	ldda	[%i4+%o4]0x80,%f24	! %f24 = 4300aa08 0dff7257
!	Mem[00000000100c141a] = 7c40e49c, %l4 = 0000000000000045
	ldsh	[%i3+0x01a],%l4		! %l4 = ffffffffffffe49c
!	Mem[00000000100c1408] = ffcbd075, %l7 = 00000000000000ff
	lduwa	[%i3+%o4]0x80,%l7	! %l7 = 00000000ffcbd075
!	Mem[0000000010081408] = 0fdff4dfffffffff, %f16 = 7c40e49c 5fb540bd
	ldda	[%i2+%o4]0x80,%f16	! %f16 = 0fdff4df ffffffff
!	Mem[00000000211c0000] = ffff8970, %l3 = b9ffffff149b4f09
	ldsh	[%o2+%g0],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030101408] = 00006d834c1382c2, %f20 = ffffff9c 00000006
	ldda	[%i4+%o4]0x81,%f20	! %f20 = 00006d83 4c1382c2
!	Mem[0000000010001400] = ffbce100, %l3 = ffffffffffffffff
	lduwa	[%i0+%g0]0x80,%l3	! %l3 = 00000000ffbce100
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000010181400] = 000000c6 5fb540bd ffffb9c0 0fdff4df
!	Mem[0000000010181410] = ba1ec7c7 ffffb9c0 5fb540bd 4dcad2f3
!	Mem[0000000010181420] = 43972b17 00000043 27787e0c 00000046
!	Mem[0000000010181430] = dff4df0f 4f2b2645 1d9ca36e 00000000
	ldda	[%i6+%g0]ASI_BLK_PL,%f0 	! Block Load from 0000000010181400
!	Mem[0000000010081418] = f3ff218a48a23333, %f28 = 43972b17 000000ff, %asi = 80
	ldda	[%i2+0x018]%asi,%f28	! %f28 = f3ff218a 48a23333
!	Mem[0000000030081400] = 00000000, %l0 = 00000000000000d2
	ldsba	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000000

p0_label_125:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = ffeedd44, %l3 = 00000000ffbce100
	swapa	[%i4+%g0]0x81,%l3	! %l3 = 00000000ffeedd44
	membar	#Sync			! Added by membar checker (20)
!	%l5 = ffffffffffffdf0f, Mem[0000000010181400] = c6000000
	stba	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = c600000f
!	%f3  = c0b9ffff, Mem[0000000010181408] = c0b9ffff
	sta	%f3 ,[%i6+%o4]0x88	! Mem[0000000010181408] = c0b9ffff
!	Mem[00000000100c1400] = 6cb314c2, %l6 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l6	! %l6 = 000000006cb314c2
!	%l6 = 6cb314c2, %l7 = ffcbd075, Mem[0000000030141410] = ff00d20d 6cb314c2
	stda	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 6cb314c2 ffcbd075
!	Mem[0000000010001410] = 9ce4407c, %l1 = 00000000ffffffff
	ldstuba	[%i0+%o5]0x88,%l1	! %l1 = 000000000000007c
!	%l0 = 00000000, %l1 = 0000007c, Mem[0000000010141410] = 00000000 172b9743
	stda	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 0000007c
!	Mem[0000000030141400] = ab0000ff, %l2 = 00000000ff000000
	swapa	[%i5+%g0]0x89,%l2	! %l2 = 00000000ab0000ff
!	Mem[00000000100c1420] = c214b36c, %l2 = ab0000ff, %l2 = ab0000ff
	add	%i3,0x20,%g1
	casa	[%g1]0x80,%l2,%l2	! %l2 = 00000000c214b36c
!	%f20 = 00006d83 4c1382c2, Mem[0000000010141400] = ba1ec7c7 bd40b55f
	stda	%f20,[%i5+%g0]0x88	! Mem[0000000010141400] = 00006d83 4c1382c2

p0_label_126:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00000000, %l6 = 000000006cb314c2
	ldswa	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000000
!	%l5 = ffffffffffffdf0f, immd = fffff9a4, %y  = ed989520
	smul	%l5,-0x65c,%l3		! %l3 = 0000000000d17c9c, %y = 00000000
!	Mem[0000000010101400] = 7c40e49c, %l4 = ffffffffffffe49c
	ldswa	[%i4+%g0]0x88,%l4	! %l4 = 000000007c40e49c
!	Mem[0000000010181410] = c7c71eba, %l3 = 0000000000d17c9c
	lduha	[%i6+%o5]0x88,%l3	! %l3 = 0000000000001eba
!	Mem[0000000030041408] = 000000ff, %l4 = 000000007c40e49c
	ldsba	[%i1+%o4]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c1410] = 094f9b14ffffffb9, %f24 = 4300aa08 0dff7257
	ldda	[%i3+%o5]0x80,%f24	! %f24 = 094f9b14 ffffffb9
!	Mem[0000000010181400] = c600000f, %l5 = ffffffffffffdf0f
	ldswa	[%i6+%g0]0x88,%l5	! %l5 = ffffffffc600000f
!	Mem[0000000010081408] = ffffffff dff4df0f, %l0 = 00000000, %l1 = 0000007c
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 00000000dff4df0f 00000000ffffffff
!	Mem[00000000100c1400] = 00000000ffffffff, %f12 = 45262b4f 0fdff4df
	ldd	[%i3+%g0],%f12		! %f12 = 00000000 ffffffff
!	Mem[0000000030081410] = 43000000, %f8  = 43000000
	lda	[%i2+%o5]0x81,%f8 	! %f8 = 43000000

p0_label_127:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = ffffffff, %l2 = 00000000c214b36c
	swapa	[%i0+%o4]0x88,%l2	! %l2 = 00000000ffffffff
!	Mem[00000000201c0000] = 00009ee0, %l5 = ffffffffc600000f
	ldstuba	[%o0+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1408] = ffcbd075, %l2 = 00000000ffffffff
	swapa	[%i3+%o4]0x80,%l2	! %l2 = 00000000ffcbd075
!	Mem[0000000010001435] = 00000000, %l3 = 0000000000001eba
	ldstub	[%i0+0x035],%l3		! %l3 = 0000000000000000
!	%f17 = ffffffff, Mem[0000000010001410] = 9ce440ff
	sta	%f17,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffff
!	Mem[000000001014141e] = 670bf0ff, %l7 = 00000000ffcbd075
	ldstub	[%i5+0x01e],%l7		! %l7 = 00000000000000f0
!	Mem[00000000100c1408] = ffffffff, %l4 = ffffffffffffffff
	ldstuba	[%i3+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001400] = 00e1bcff, %l3 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	%l0 = 00000000dff4df0f, Mem[0000000010081400] = 0fdff4df4dcad2f3
	stxa	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000dff4df0f
!	%f12 = 00000000 ffffffff, Mem[0000000030081410] = 00000043 3d1d4412
	stda	%f12,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000 ffffffff

p0_label_128:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 836d00ff, %l5 = 0000000000000000
	ldsba	[%i2+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010181400] = c600000f, %l4 = 00000000000000ff
	lduwa	[%i6+%g0]0x88,%l4	! %l4 = 00000000c600000f
!	Mem[0000000010101408] = 4300aa08, %l7 = 00000000000000f0
	ldsba	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000043
!	Mem[0000000030181400] = 00000000, %l2 = 00000000ffcbd075
	lduwa	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141408] = 000000ff, %l4 = 00000000c600000f, %asi = 80
	lduha	[%i5+0x008]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181400] = 0f0000c65fb540bd, %f22 = 5fb540bd 4dcad2f3
	ldda	[%i6+%g0]0x80,%f22	! %f22 = 0f0000c6 5fb540bd
!	Mem[0000000010041408] = 09b540bd, %l2 = 0000000000000000
	lduwa	[%i1+%o4]0x80,%l2	! %l2 = 0000000009b540bd
!	Mem[0000000010081400] = 00000000, %f26 = 432486ff
	lda	[%i2+%g0]0x88,%f26	! %f26 = 00000000
!	Mem[00000000300c1400] = ffffd29c 7b7e0000 6c3a1358 149b4f09
!	Mem[00000000300c1410] = d2a39c1d ffffffff 2b79af9a 5d8ee903
!	Mem[00000000300c1420] = 1570c728 061c9199 f99ccf75 08aa5668
!	Mem[00000000300c1430] = 7ed54c94 1b955c1b 7f2d4d72 4c83887b
	ldda	[%i3+%g0]ASI_BLK_AIUS,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010141408] = ff000000, %f4  = c0b9ffff
	lda	[%i5+%o4]0x88,%f4 	! %f4 = ff000000

p0_label_129:
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = ffff8970, %l0 = 00000000dff4df0f
	ldstuba	[%o2+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000030101400] = ffbce100
	stwa	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	%l5 = ffffffffffffffff, Mem[000000001008143f] = 00000000, %asi = 80
	stba	%l5,[%i2+0x03f]%asi	! Mem[000000001008143c] = 000000ff
!	%l6 = 0000000000000000, Mem[0000000010081400] = 00000000
	stba	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	Mem[00000000300c1408] = 6c3a1358, %l2 = 0000000009b540bd
	ldstuba	[%i3+%o4]0x81,%l2	! %l2 = 000000000000006c
!	%l0 = 00000000000000ff, Mem[0000000010141408] = 00000000ff000000
	stxa	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000000000ff
!	%l2 = 000000000000006c, Mem[0000000010141400] = 4c1382c2
	stwa	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000006c
!	%l3 = 00000000000000ff, Mem[0000000030141410] = 6cb314c2
	stha	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = 00ff14c2
!	%f14 = 00000000 6ea39c1d, %l0 = 00000000000000ff
!	Mem[0000000010081408] = 0fdff4dfffffffff
	add	%i2,0x008,%g1
	stda	%f14,[%g1+%l0]ASI_PST8_P ! Mem[0000000010081408] = 000000006ea39c1d
!	Mem[0000000030101410] = 9cffffff, %l2 = 000000000000006c
	ldstuba	[%i4+%o5]0x89,%l2	! %l2 = 00000000000000ff

p0_label_130:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 000000ff, %l3 = 00000000000000ff
	ldsha	[%i5+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141410] = c214ff00, %f10 = 46000000
	lda	[%i5+%o5]0x89,%f10	! %f10 = c214ff00
!	Mem[0000000030181408] = 4a2effff, %l4 = 0000000000000000
	lduha	[%i6+%o4]0x81,%l4	! %l4 = 0000000000004a2e
!	Mem[00000000100c1400] = 00000000 ffffffff, %l4 = 00004a2e, %l5 = ffffffff
	ldda	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000 00000000ffffffff
!	Mem[0000000010101410] = c9bce100, %l1 = 00000000ffffffff
	lduwa	[%i4+%o5]0x80,%l1	! %l1 = 00000000c9bce100
!	Mem[00000000300c1410] = 1d9ca3d2, %l0 = 00000000000000ff
	lduba	[%i3+%o5]0x89,%l0	! %l0 = 00000000000000d2
!	Mem[00000000300c1410] = d2a39c1d, %f9  = 172b9743
	lda	[%i3+%o5]0x81,%f9 	! %f9 = d2a39c1d
!	Mem[0000000010141400] = 00006d830000006c, %f10 = c214ff00 0c7e7827
	ldda	[%i5+%g0]0x88,%f10	! %f10 = 00006d83 0000006c
!	Mem[0000000030001410] = 432486ff44ee2c81, %l6 = 0000000000000000
	ldxa	[%i0+%o5]0x81,%l6	! %l6 = 432486ff44ee2c81
!	Mem[0000000030141400] = 000000ff00e1bcc9, %f2  = dff4df0f c0b9ffff
	ldda	[%i5+%g0]0x81,%f2 	! %f2  = 000000ff 00e1bcc9

p0_label_131:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (21)
!	%l6 = 432486ff44ee2c81, Mem[00000000300c1410] = d2a39c1d
	stha	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 2c819c1d
!	%f21 = ffffffff, Mem[0000000030041410] = 1f4f6594
	sta	%f21,[%i1+%o5]0x81	! Mem[0000000030041410] = ffffffff
!	Code Fragment 3, seed = 769857
p0_fragment_18:
!	%l0 = 00000000000000d2
	setx	0xd1b3f75bcda18f1e,%g7,%l0 ! %l0 = d1b3f75bcda18f1e
!	%l1 = 00000000c9bce100
	setx	0x2c4a5edc267171c9,%g7,%l1 ! %l1 = 2c4a5edc267171c9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d1b3f75bcda18f1e
	setx	0x10ca77f94df17084,%g7,%l0 ! %l0 = 10ca77f94df17084
!	%l1 = 2c4a5edc267171c9
	setx	0xe21b6b43dc640e4f,%g7,%l1 ! %l1 = e21b6b43dc640e4f
p0_fragment_18_end:
!	%l4 = 0000000000000000, Mem[0000000030001408] = d2a31d9c
	stha	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = d2a30000
!	%l3 = 00000000000000ff, Mem[0000000010081400] = 00000000
	stwa	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff
!	Mem[00000000300c1408] = ff3a1358, %l4 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	%l1 = e21b6b43dc640e4f, Mem[0000000010101408] = 4300aa08
	stwa	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = dc640e4f
!	%l2 = 000000ff, %l3 = 000000ff, Mem[00000000300c1408] = 58133aff 094f9b14
	stda	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff 000000ff
!	%l5 = 00000000ffffffff, Mem[0000000030141400] = 000000ff
	stba	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = ff0000ff
!	%l7 = 0000000000000043, Mem[00000000300c1410] = 1d9c812c
	stba	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 1d9c8143

p0_label_132:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181414] = ffffb9c0, %l0 = 10ca77f94df17084, %asi = 80
	ldswa	[%i6+0x014]%asi,%l0	! %l0 = ffffffffffffb9c0
!	Mem[0000000030081408] = ff006d83, %l5 = 00000000ffffffff
	ldswa	[%i2+%o4]0x81,%l5	! %l5 = ffffffffff006d83
!	Mem[0000000030041410] = ffffffff 75d0cbff, %l4 = 000000ff, %l5 = ff006d83
	ldda	[%i1+%o5]0x81,%l4	! %l4 = 00000000ffffffff 0000000075d0cbff
!	Mem[0000000010101400] = 9ce4407c5fb540bd, %l3 = 00000000000000ff
	ldxa	[%i4+%g0]0x80,%l3	! %l3 = 9ce4407c5fb540bd
!	Mem[0000000010141400] = 0000006c, %l7 = 0000000000000043
	lduba	[%i5+%g0]0x88,%l7	! %l7 = 000000000000006c
!	Mem[000000001010142a] = 00000000, %l1 = e21b6b43dc640e4f, %asi = 80
	lduba	[%i4+0x02a]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101410] = ffffff9c, %l6 = 432486ff44ee2c81
	lduwa	[%i4+%o5]0x81,%l6	! %l6 = 00000000ffffff9c
!	Mem[0000000030101408] = 836d0000, %l6 = 00000000ffffff9c
	ldswa	[%i4+%o4]0x89,%l6	! %l6 = ffffffff836d0000
!	Mem[0000000030041410] = ffffffff, %f7  = bd40b55f
	lda	[%i1+%o5]0x81,%f7 	! %f7 = ffffffff
!	Mem[0000000030141410] = 00ff14c2 ffcbd075, %l6 = 836d0000, %l7 = 0000006c
	ldda	[%i5+%o5]0x81,%l6	! %l6 = 0000000000ff14c2 00000000ffcbd075

p0_label_133:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ffffffff, Mem[0000000010001408] = 6cb314c275cf9cf9
	stxa	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000ffffffff
!	Mem[0000000021800101] = ffb6c060, %l3 = 9ce4407c5fb540bd
	ldstub	[%o3+0x101],%l3		! %l3 = 00000000000000b6
!	%f14 = 00000000 6ea39c1d, Mem[0000000010041408] = 09b540bd 08aa5668
	stda	%f14,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000 6ea39c1d
!	Mem[0000000030181408] = ffff2e4a, %l2 = 00000000000000ff
	ldstuba	[%i6+%o4]0x89,%l2	! %l2 = 000000000000004a
!	Mem[00000000300c1410] = 1d9c8143, %l2 = 000000000000004a
	swapa	[%i3+%o5]0x89,%l2	! %l2 = 000000001d9c8143
!	%l4 = 00000000ffffffff, Mem[0000000021800180] = 2c81a0c0, %asi = 80
	stba	%l4,[%o3+0x180]%asi	! Mem[0000000021800180] = ff81a0c0
!	%l6 = 0000000000ff14c2, Mem[000000001014140e] = 00000000, %asi = 80
	stha	%l6,[%i5+0x00e]%asi	! Mem[000000001014140c] = 000014c2
!	%f14 = 00000000 6ea39c1d, %l5 = 0000000075d0cbff
!	Mem[0000000030041400] = ff000000bd40b5d3
	stda	%f14,[%i1+%l5]ASI_PST16_S ! Mem[0000000030041400] = 000000006ea39c1d
!	%l4 = 00000000ffffffff, Mem[000000001010142a] = 00000000, %asi = 80
	stha	%l4,[%i4+0x02a]%asi	! Mem[0000000010101428] = 0000ffff
!	%f30 = 7f2d4d72 4c83887b, %l0 = ffffffffffffb9c0
!	Mem[0000000010141418] = 174c519e670bffff
	add	%i5,0x018,%g1
	stda	%f30,[%g1+%l0]ASI_PST8_P ! Mem[0000000010141418] = 7f2d519e670bffff

p0_label_134:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ff2effff00e1bcc9, %l6 = 0000000000ff14c2
	ldxa	[%i6+%o4]0x81,%l6	! %l6 = ff2effff00e1bcc9
!	Mem[0000000010181408] = ffffb9c00fdff4df, %f18 = 6c3a1358 149b4f09
	ldda	[%i6+%o4]0x80,%f18	! %f18 = ffffb9c0 0fdff4df
!	Mem[0000000030141400] = ff0000ff00e1bcc9, %l4 = 00000000ffffffff
	ldxa	[%i5+%g0]0x81,%l4	! %l4 = ff0000ff00e1bcc9
!	Mem[0000000030081400] = 00000000, %l4 = ff0000ff00e1bcc9
	ldsba	[%i2+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l6 = ff2effff00e1bcc9
	ldswa	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l7 = 00000000ffcbd075
	ldsha	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141410] = 75d0cbffc214ff00, %f2  = 000000ff 00e1bcc9
	ldda	[%i5+%o5]0x89,%f2 	! %f2  = 75d0cbff c214ff00
!	Mem[0000000010181408] = ffffb9c0 0fdff4df, %l4 = 00000000, %l5 = 75d0cbff
	ldda	[%i6+%o4]0x80,%l4	! %l4 = 00000000ffffb9c0 000000000fdff4df
!	%l3 = 00000000000000b6, %l7 = 0000000000000000, %y  = 00000000
	umul	%l3,%l7,%l2		! %l2 = 0000000000000000, %y = 00000000
!	Mem[0000000010001410] = ffffffff5fb540bd, %f20 = d2a39c1d ffffffff
	ldda	[%i0+%o5]0x80,%f20	! %f20 = ffffffff 5fb540bd

p0_label_135:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ffffb9c0, Mem[0000000010141410] = 00000000
	stwa	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = ffffb9c0
!	%l5 = 000000000fdff4df, Mem[0000000030181410] = ffffffff
	stba	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = ffffffdf
!	%f16 = ffffd29c 7b7e0000, %l4 = 00000000ffffb9c0
!	Mem[0000000010041430] = 172b9743000000ff
	add	%i1,0x030,%g1
	stda	%f16,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010041430] = 172b9743000000ff
!	Mem[00000000100c1400] = 00000000 ffffffff ffffffff 7e7b6ac6
!	%f0  = bd40b55f c6000000 75d0cbff c214ff00
!	%f4  = ff000000 c7c71eba f3d2ca4d ffffffff
!	%f8  = 43000000 d2a39c1d 00006d83 0000006c
!	%f12 = 00000000 ffffffff 00000000 6ea39c1d
	stda	%f0 ,[%i3+%g0]ASI_BLK_P	! Block Store to 00000000100c1400
!	%l7 = 0000000000000000, Mem[00000000100c1418] = f3d2ca4d, %asi = 80
	stha	%l7,[%i3+0x018]%asi	! Mem[00000000100c1418] = 0000ca4d
!	%l2 = 0000000000000000, Mem[0000000010101420] = 633a14580000007e
	stx	%l2,[%i4+0x020]		! Mem[0000000010101420] = 0000000000000000
!	%l4 = 00000000ffffb9c0, Mem[0000000010081400] = 000000ffdff4df0f
	stxa	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000ffffb9c0
!	%f3  = c214ff00, Mem[0000000030141408] = 00000000
	sta	%f3 ,[%i5+%o4]0x81	! Mem[0000000030141408] = c214ff00
!	%f26 = f99ccf75, Mem[0000000030081400] = 00000000
	sta	%f26,[%i2+%g0]0x81	! Mem[0000000030081400] = f99ccf75
!	%l4 = 00000000ffffb9c0, Mem[00000000100c1414] = c7c71eba
	sth	%l4,[%i3+0x014]		! Mem[00000000100c1414] = b9c01eba

p0_label_136:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 812cee44ff862443, %f20 = ffffffff 5fb540bd
	ldda	[%i0+%o5]0x89,%f20	! %f20 = 812cee44 ff862443
!	Mem[0000000010081400] = 00000000, %f28 = 7ed54c94
	lda	[%i2+%g0]0x88,%f28	! %f28 = 00000000
!	Mem[0000000030081400] = f99ccf75 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i2+%g0]0x81,%l6	! %l6 = 00000000f99ccf75 0000000000000000
!	Mem[0000000030141400] = ff0000ff00e1bcc9, %l2 = 0000000000000000
	ldxa	[%i5+%g0]0x81,%l2	! %l2 = ff0000ff00e1bcc9
!	Mem[0000000030141400] = ff0000ff 00e1bcc9, %l0 = ffffb9c0, %l1 = 00000000
	ldda	[%i5+%g0]0x81,%l0	! %l0 = 00000000ff0000ff 0000000000e1bcc9
!	Mem[0000000030181400] = 0000000000007e7b, %f26 = f99ccf75 08aa5668
	ldda	[%i6+%g0]0x81,%f26	! %f26 = 00000000 00007e7b
	membar	#Sync			! Added by membar checker (22)
!	Mem[00000000100c1404] = c6000000, %l4 = 00000000ffffb9c0
	lduw	[%i3+0x004],%l4		! %l4 = 00000000c6000000
!	Mem[0000000010181410] = c7c71eba, %l3 = 00000000000000b6
	lduwa	[%i6+%o5]0x88,%l3	! %l3 = 00000000c7c71eba
!	Mem[00000000201c0000] = ff009ee0, %l0 = 00000000ff0000ff
	ldsb	[%o0+%g0],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010141436] = 0000006c, %l7 = 0000000000000000
	lduh	[%i5+0x036],%l7		! %l7 = 000000000000006c

p0_label_137:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000c6000000, imm = 0000000000000109, %l4 = 00000000c6000000
	or	%l4,0x109,%l4		! %l4 = 00000000c6000109
!	Mem[00000000201c0000] = ff009ee0, %l0 = ffffffffffffffff
	ldstuba	[%o0+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	%f12 = 00000000, Mem[0000000030141408] = c214ff00
	sta	%f12,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	%l4 = 00000000c6000109, Mem[0000000010101405] = 5fb540bd
	stb	%l4,[%i4+0x005]		! Mem[0000000010101404] = 5f0940bd
!	%l7 = 000000000000006c, Mem[0000000010081410] = dff4df0f5b08baff, %asi = 80
	stxa	%l7,[%i2+0x010]%asi	! Mem[0000000010081410] = 000000000000006c
!	%l6 = 00000000f99ccf75, Mem[0000000010081410] = 00000000
	stha	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = cf750000
!	%l0 = 00000000000000ff, Mem[000000001010141a] = 7a5e924a
	sth	%l0,[%i4+0x01a]		! Mem[0000000010101418] = 7a5e00ff
!	Mem[0000000030141400] = ff0000ff, %l0 = 00000000000000ff
	ldstuba	[%i5+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	%f26 = 00000000 00007e7b, Mem[0000000010001410] = ffffffff 5fb540bd
	stda	%f26,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000 00007e7b
!	%l4 = c6000109, %l5 = 0fdff4df, Mem[00000000100c1400] = 5fb540bd 000000c6
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = c6000109 0fdff4df

p0_label_138:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00000000, %l4 = 00000000c6000109
	ldswa	[%i1+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l6 = 00000000f99ccf75
	lduba	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041400] = 00000000 6ea39c1d ff000000 00000000
!	Mem[0000000030041410] = ffffffff 75d0cbff 0df33cda 2368f943
!	Mem[0000000030041420] = 5c7b6e68 1dcb13d9 168e88e6 161e1d9f
!	Mem[0000000030041430] = 630797d4 1933c415 434722b2 10afc0bb
	ldda	[%i1+%g0]ASI_BLK_AIUS,%f0 	! Block Load from 0000000030041400
!	Mem[0000000030181400] = 00000000, %l3 = 00000000c7c71eba
	ldswa	[%i6+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041434] = 000000ff, %f26 = 00000000
	ld	[%i1+0x034],%f26	! %f26 = 000000ff
!	Mem[0000000010041400] = bd40b55f9ce4407c, %f26 = 000000ff 00007e7b
	ldda	[%i1+%g0]0x80,%f26	! %f26 = bd40b55f 9ce4407c
!	Mem[0000000010081410] = 000075cf, %l3 = 0000000000000000
	ldsba	[%i2+%o5]0x88,%l3	! %l3 = ffffffffffffffcf
!	Mem[0000000030001410] = 812cee44 ff862443, %l2 = 00e1bcc9, %l3 = ffffffcf
	ldda	[%i0+%o5]0x89,%l2	! %l2 = 00000000ff862443 00000000812cee44
!	Mem[0000000010001408] = 00000000, %f25 = 061c9199
	lda	[%i0+%o4]0x88,%f25	! %f25 = 00000000
!	Mem[00000000100c1408] = 00ff14c2 ffcbd075, %l4 = 00000000, %l5 = 0fdff4df
	ldda	[%i3+%o4]0x88,%l4	! %l4 = 00000000ffcbd075 0000000000ff14c2

p0_label_139:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 0f0000c6 5fb540bd ffffb9c0 0fdff4df
!	%f16 = ffffd29c 7b7e0000 ffffb9c0 0fdff4df
!	%f20 = 812cee44 ff862443 2b79af9a 5d8ee903
!	%f24 = 1570c728 00000000 bd40b55f 9ce4407c
!	%f28 = 00000000 1b955c1b 7f2d4d72 4c83887b
	stda	%f16,[%i6+%g0]ASI_BLK_PL	! Block Store to 0000000010181400
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000010181435] = 00000000, %l5 = 0000000000ff14c2
	ldstub	[%i6+0x035],%l5		! %l5 = 0000000000000000
!	%f26 = bd40b55f 9ce4407c, Mem[0000000010001400] = 00e1bcff d3b540bd
	stda	%f26,[%i0+%g0]0x88	! Mem[0000000010001400] = bd40b55f 9ce4407c
!	%l7 = 000000000000006c, Mem[0000000010101408] = dc640e4f0dff7257
	stxa	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000000000006c
!	Mem[000000001014140c] = 000014c2, %l1 = 00e1bcc9, %l1 = 00e1bcc9
	add	%i5,0x0c,%g1
	casa	[%g1]0x80,%l1,%l1	! %l1 = 00000000000014c2
!	%f13 = 1933c415, %f6  = 0df33cda, %f18 = ffffb9c0
	fdivs	%f13,%f6 ,%f18		! %f18 = 4abd32af
!	Mem[000000001000142c] = 995217ff, %l6 = 0000000000000000
	ldstuba	[%i0+0x02c]%asi,%l6	! %l6 = 0000000000000099
!	Mem[0000000010001422] = 7257b1e4, %l0 = 00000000000000ff
	ldstub	[%i0+0x022],%l0		! %l0 = 00000000000000b1
!	Mem[00000000201c0001] = ff009ee0, %l7 = 000000000000006c
	ldstuba	[%o0+0x001]%asi,%l7	! %l7 = 0000000000000000
!	%f20 = 812cee44 ff862443, %l7 = 0000000000000000
!	Mem[0000000010041430] = 172b9743000000ff
	add	%i1,0x030,%g1
	stda	%f20,[%g1+%l7]ASI_PST16_P ! Mem[0000000010041430] = 172b9743000000ff

p0_label_140:
!	Starting 10 instruction Load Burst
!	%l0 = 00000000000000b1, %l2 = 00000000ff862443, %l1 = 00000000000014c2
	xor	%l0,%l2,%l1		! %l1 = 00000000ff8624f2
!	Mem[0000000030181408] = ffff2eff, %f4  = ffffffff
	lda	[%i6+%o4]0x89,%f4 	! %f4 = ffff2eff
!	Mem[0000000030101410] = 9cffffff, %l4 = 00000000ffcbd075
	ldsba	[%i4+%o5]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[000000001008141c] = 48a23333, %f1  = 6ea39c1d
	ld	[%i2+0x01c],%f1 	! %f1 = 48a23333
!	Mem[0000000010041439] = 92d5901f, %l7 = 0000000000000000, %asi = 80
	lduba	[%i1+0x039]%asi,%l7	! %l7 = 00000000000000d5
!	Mem[0000000030001400] = 000000ff, %l2 = 00000000ff862443
	ldsha	[%i0+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041400] = 5fb540bd, %l3 = 00000000812cee44
	ldswa	[%i1+%g0]0x88,%l3	! %l3 = 000000005fb540bd
!	Code Fragment 3, seed = 178881
p0_fragment_19:
!	%l0 = 00000000000000b1
	setx	0xb41a1f71ef3d331e,%g7,%l0 ! %l0 = b41a1f71ef3d331e
!	%l1 = 00000000ff8624f2
	setx	0x1b0a5eed790bd5c9,%g7,%l1 ! %l1 = 1b0a5eed790bd5c9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b41a1f71ef3d331e
	setx	0xc398d3b1f84e9484,%g7,%l0 ! %l0 = c398d3b1f84e9484
!	%l1 = 1b0a5eed790bd5c9
	setx	0xff8fe6b19a07f24f,%g7,%l1 ! %l1 = ff8fe6b19a07f24f
p0_fragment_19_end:
!	Mem[0000000030101408] = 00006d83 4c1382c2, %l6 = 00000099, %l7 = 000000d5
	ldda	[%i4+%o4]0x81,%l6	! %l6 = 0000000000006d83 000000004c1382c2
!	Mem[0000000010141406] = 836d0000, %l1 = ff8fe6b19a07f24f, %asi = 80
	ldsha	[%i5+0x006]%asi,%l1	! %l1 = 0000000000000000

p0_label_141:
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffffff, Mem[0000000030101410] = ffffff9ced680000
	stxa	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffffffffffffff
!	Mem[0000000020800041] = ffffbf40, %l7 = 000000004c1382c2
	ldstub	[%o1+0x041],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010081408] = 00000000, %l3 = 000000005fb540bd, %asi = 80
	swapa	[%i2+0x008]%asi,%l3	! %l3 = 0000000000000000
!	%f6  = 0df33cda 2368f943, %l6 = 0000000000006d83
!	Mem[0000000010041410] = 060000009cffffff
	add	%i1,0x010,%g1
	stda	%f6,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010041410] = 43f96823da3cf30d
!	%l6 = 0000000000006d83, Mem[00000000201c0001] = ffff9ee0
	stb	%l6,[%o0+0x001]		! Mem[00000000201c0000] = ff839ee0
!	%l1 = 0000000000000000, Mem[00000000201c0000] = ff839ee0, %asi = 80
	stha	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00009ee0
!	Mem[0000000030101410] = ffffffff, %l3 = 0000000000000000
	swapa	[%i4+%o5]0x89,%l3	! %l3 = 00000000ffffffff
!	%f6  = 0df33cda, %f7  = 2368f943, %f2  = ff000000
	fadds	%f6 ,%f7 ,%f2 		! %f2  = 2368f943
!	Mem[0000000030101408] = 836d0000, %l1 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = ff000000, %l0 = 00000000f84e9484
	swapa	[%i5+%o4]0x80,%l0	! %l0 = 00000000ff000000

p0_label_142:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 7c40e49c, %l0 = 00000000ff000000
	lduba	[%i4+%g0]0x88,%l0	! %l0 = 000000000000009c
!	Mem[0000000030081408] = 836d00ff, %l5 = 0000000000000000
	ldsha	[%i2+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141400] = 0000006c, %f11 = 161e1d9f
	lda	[%i5+%g0]0x88,%f11	! %f11 = 0000006c
!	Code Fragment 4, seed = 200055
p0_fragment_20:
!	%l0 = 000000000000009c
	setx	0x25e1521c0ad9336e,%g7,%l0 ! %l0 = 25e1521c0ad9336e
!	%l1 = 0000000000000000
	setx	0xd81ff059f22a2519,%g7,%l1 ! %l1 = d81ff059f22a2519
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 25e1521c0ad9336e
	setx	0xd1277dc240ca02d4,%g7,%l0 ! %l0 = d1277dc240ca02d4
!	%l1 = d81ff059f22a2519
	setx	0xbcb3efd5b1024f9f,%g7,%l1 ! %l1 = bcb3efd5b1024f9f
p0_fragment_20_end:
!	Mem[0000000010081410] = cf750000, %l0 = d1277dc240ca02d4
	ldsba	[%i2+%o5]0x80,%l0	! %l0 = ffffffffffffffcf
!	Mem[0000000010141408] = 84944ef8, %f4  = ffff2eff
	lda	[%i5+%o4]0x88,%f4 	! %f4 = 84944ef8
!	Mem[0000000030001400] = ff000000, %l7 = 00000000000000ff
	lduba	[%i0+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141438] = 317693aa, %l3 = 00000000ffffffff, %asi = 80
	lduwa	[%i5+0x038]%asi,%l3	! %l3 = 00000000317693aa
!	Mem[0000000030041408] = ff00000000000000, %f30 = 7f2d4d72 4c83887b
	ldda	[%i1+%o4]0x81,%f30	! %f30 = ff000000 00000000
!	Mem[0000000010101408] = 00000000, %l1 = bcb3efd5b1024f9f
	ldsba	[%i4+%o4]0x80,%l1	! %l1 = 0000000000000000

p0_label_143:
!	Starting 10 instruction Store Burst
!	%f4  = 84944ef8, Mem[0000000030081400] = 75cf9cf9
	sta	%f4 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 84944ef8
!	%l6 = 0000000000006d83, Mem[0000000030141410] = c214ff00
	stha	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = c2146d83
!	%l7 = 00000000000000ff, %l2 = 00000000000000ff, %l2 = 00000000000000ff
	orn	%l7,%l2,%l2		! %l2 = ffffffffffffffff
!	%l1 = 0000000000000000, Mem[0000000010001408] = ffffffff00000000
	stxa	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000000000000000
!	%f27 = 9ce4407c, Mem[0000000030181410] = dfffffff
	sta	%f27,[%i6+%o5]0x81	! Mem[0000000030181410] = 9ce4407c
!	Mem[0000000010101408] = 00000000, %l3 = 00000000317693aa
	swapa	[%i4+%o4]0x80,%l3	! %l3 = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000030101400] = 00000000
	stha	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	%l7 = 00000000000000ff, Mem[0000000030081400] = f84e9484
	stba	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = ff4e9484
!	%l2 = ffffffffffffffff, %l0 = ffffffffffffffcf, %l5 = 00000000000000ff
	udivx	%l2,%l0,%l5		! %l5 = 0000000000000001
!	%f6  = 0df33cda 2368f943, Mem[0000000030041408] = ff000000 00000000
	stda	%f6 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 0df33cda 2368f943

p0_label_144:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ffffffff75d0cbff, %l0 = ffffffffffffffcf
	ldxa	[%i1+%o5]0x81,%l0	! %l0 = ffffffff75d0cbff
!	Mem[0000000030001400] = 000000ff, %l3 = 0000000000000000
	lduba	[%i0+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1408] = ff000000, %l3 = 00000000000000ff
	ldsba	[%i3+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181438] = 7b88834c, %f26 = bd40b55f
	lda	[%i6+0x038]%asi,%f26	! %f26 = 7b88834c
!	Mem[0000000030101408] = ff006d83, %l1 = 0000000000000000
	lduha	[%i4+%o4]0x81,%l1	! %l1 = 000000000000ff00
!	Mem[0000000030041400] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = ff000000, %l0 = ffffffff75d0cbff
	ldswa	[%i3+%o4]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[0000000030001400] = 000000ff, %f19 = 0fdff4df
	lda	[%i0+%g0]0x89,%f19	! %f19 = 000000ff
!	Mem[00000000100c1408] = 75d0cbffc214ff00, %l2 = ffffffffffffffff
	ldxa	[%i3+%o4]0x80,%l2	! %l2 = 75d0cbffc214ff00
!	Mem[0000000030141408] = 0000000043000000, %f20 = 812cee44 ff862443
	ldda	[%i5+%o4]0x81,%f20	! %f20 = 00000000 43000000

p0_label_145:
!	Starting 10 instruction Store Burst
!	%f26 = 7b88834c 9ce4407c, Mem[00000000100c1400] = 090100c6 dff4df0f
	stda	%f26,[%i3+%g0]0x80	! Mem[00000000100c1400] = 7b88834c 9ce4407c
!	Mem[00000000100c1408] = 75d0cbff, %l4 = 00000000ffffffff
	swapa	[%i3+%o4]0x80,%l4	! %l4 = 0000000075d0cbff
!	Mem[0000000030101410] = 00000000, %l2 = 00000000c214ff00
	swapa	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000
!	%l1 = 000000000000ff00, Mem[0000000010081408] = bd40b55f
	stha	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = bd40ff00
!	%f18 = 4abd32af 000000ff, Mem[0000000010041400] = bd40b55f 9ce4407c
	stda	%f18,[%i1+%g0]0x80	! Mem[0000000010041400] = 4abd32af 000000ff
!	Mem[0000000010141410] = ffffb9c0, %l3 = ffffffffffffffff
	ldstuba	[%i5+%o5]0x88,%l3	! %l3 = 00000000000000c0
!	%l0 = ffffffffff000000, Mem[0000000010101400] = 9ce4407c5f0940bd
	stx	%l0,[%i4+%g0]		! Mem[0000000010101400] = ffffffffff000000
!	%l6 = 0000000000006d83, Mem[0000000030001400] = 000000ff
	stwa	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 00006d83
!	Mem[0000000010101408] = aa937631, %l5 = 0000000000000001
	ldstuba	[%i4+%o4]0x88,%l5	! %l5 = 0000000000000031
!	%f12 = 630797d4, %f18 = 4abd32af
	fsqrts	%f12,%f18		! %f18 = 513a4fa5

p0_label_146:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00007e7b, %l3 = 00000000000000c0
	ldsha	[%i6+%g0]0x80,%l3	! %l3 = 0000000000000000
!	%l4 = 0000000075d0cbff, %l4 = 0000000075d0cbff, %l2 = 0000000000000000
	xnor	%l4,%l4,%l2		! %l2 = ffffffffffffffff
!	Mem[0000000030101408] = 836d00ff, %l5 = 0000000000000031
	lduwa	[%i4+%o4]0x89,%l5	! %l5 = 00000000836d00ff
!	Mem[0000000030081410] = ffffffff, %l5 = 00000000836d00ff
	lduwa	[%i2+%o5]0x81,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000030141408] = 00000000, %l0 = ffffffffff000000
	ldswa	[%i5+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1408] = ff000000, %l2 = ffffffffffffffff
	lduha	[%i3+%o4]0x81,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010001400] = 9ce4407c, %l4 = 0000000075d0cbff
	lduha	[%i0+%g0]0x88,%l4	! %l4 = 000000000000407c
!	Mem[0000000030181400] = 00000000, %l1 = 000000000000ff00
	lduba	[%i6+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041413] = 43f96823, %l5 = 00000000ffffffff
	ldub	[%i1+0x013],%l5		! %l5 = 0000000000000023
!	Mem[00000000100c1408] = 00ff14c2 ffffffff, %l6 = 00006d83, %l7 = 00000000
	ldda	[%i3+%o4]0x88,%l6	! %l6 = 00000000ffffffff 0000000000ff14c2

p0_label_147:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 7c40e49c, %l3 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l3	! %l3 = 000000007c40e49c
!	%l4 = 000000000000407c, Mem[0000000030141408] = 00000000
	stwa	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000407c
!	Mem[0000000030001400] = 00006d83, %l1 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000083
!	%l6 = 00000000ffffffff, Mem[0000000010001428] = 5e998531, %asi = 80
	stha	%l6,[%i0+0x028]%asi	! Mem[0000000010001428] = ffff8531
!	%f6  = 0df33cda 2368f943, Mem[00000000300c1408] = 000000ff 000000ff
	stda	%f6 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0df33cda 2368f943
!	%l2 = 0000ff00, %l3 = 7c40e49c, Mem[0000000010081400] = 00000000 c0b9ffff
	stda	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000ff00 7c40e49c
!	Mem[0000000030141408] = 7c400000, %l6 = 00000000ffffffff
	swapa	[%i5+%o4]0x89,%l6	! %l6 = 000000007c400000
!	%l4 = 000000000000407c, Mem[0000000010001408] = 00000000
	stha	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 407c0000
!	%l2 = 0000ff00, %l3 = 7c40e49c, Mem[0000000010081410] = 000075cf 6c000000
	stda	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000ff00 7c40e49c
!	%l5 = 0000000000000023, Mem[0000000010041414] = da3cf30d, %asi = 80
	stwa	%l5,[%i1+0x014]%asi	! Mem[0000000010041414] = 00000023

p0_label_148:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800041] = ffffbf40, %l4 = 000000000000407c, %asi = 80
	ldsba	[%o1+0x041]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041410] = 2368f943, %l2 = 000000000000ff00
	lduba	[%i1+%o5]0x88,%l2	! %l2 = 0000000000000043
!	Mem[0000000030001408] = 094f9b14d2a30000, %f2  = 2368f943 00000000
	ldda	[%i0+%o4]0x89,%f2 	! %f2  = 094f9b14 d2a30000
!	Mem[0000000010181410] = 812cee44ff862443, %l4 = ffffffffffffffff
	ldxa	[%i6+%o5]0x88,%l4	! %l4 = 812cee44ff862443
!	Mem[00000000300c1410] = 0000004a, %l5 = 0000000000000023
	ldsha	[%i3+%o5]0x89,%l5	! %l5 = 000000000000004a
!	Mem[0000000030181410] = 9ce4407c, %l6 = 000000007c400000
	ldswa	[%i6+%o5]0x81,%l6	! %l6 = ffffffff9ce4407c
!	Mem[0000000030101410] = 00ff14c2ffffffff, %f4  = 84944ef8 75d0cbff
	ldda	[%i4+%o5]0x81,%f4 	! %f4  = 00ff14c2 ffffffff
!	Mem[0000000030001410] = 812cee44ff862443, %f12 = 630797d4 1933c415
	ldda	[%i0+%o5]0x89,%f12	! %f12 = 812cee44 ff862443
!	Mem[0000000010041408] = 00000000, %l4 = 812cee44ff862443
	lduwa	[%i1+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000211c0000] = ffff8970, %l6 = ffffffff9ce4407c, %asi = 80
	ldsba	[%o2+0x000]%asi,%l6	! %l6 = ffffffffffffffff

p0_label_149:
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000004a, Mem[00000000211c0000] = ffff8970
	sth	%l5,[%o2+%g0]		! Mem[00000000211c0000] = 004a8970
!	%f30 = ff000000, Mem[0000000010001408] = 00007c40
	sta	%f30,[%i0+%o4]0x88	! Mem[0000000010001408] = ff000000
!	%l7 = 0000000000ff14c2, Mem[0000000010141400] = 6c000000
	stwa	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = 00ff14c2
!	%l6 = ffffffffffffffff, Mem[00000000100c1418] = 0000ca4dffffffff
	stx	%l6,[%i3+0x018]		! Mem[00000000100c1418] = ffffffffffffffff
!	%l3 = 000000007c40e49c, Mem[0000000030081400] = ff4e9484
	stha	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = e49c9484
!	%l7 = 0000000000ff14c2, Mem[00000000300c1410] = ffffffff0000004a
	stxa	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000000000ff14c2
!	%l6 = ffffffffffffffff, Mem[0000000010041408] = 000000006ea39c1d
	stx	%l6,[%i1+%o4]		! Mem[0000000010041408] = ffffffffffffffff
!	%f4  = 00ff14c2 ffffffff, Mem[0000000010141408] = 84944ef8 c2140000
	stda	%f4 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 00ff14c2 ffffffff
!	%l5 = 000000000000004a, Mem[0000000010081408] = bd40ff00
	stwa	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000004a
!	%l3 = 000000007c40e49c, Mem[0000000010141400] = c214ff00
	stba	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = c214ff9c

p0_label_150:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001420] = 7257ffe4 1f7d11af, %l0 = 00000000, %l1 = 00000083
	ldd	[%i0+0x020],%l0		! %l0 = 000000007257ffe4 000000001f7d11af
!	Mem[0000000030041410] = ffffffff, %f4  = 00ff14c2
	lda	[%i1+%o5]0x89,%f4 	! %f4 = ffffffff
!	Mem[0000000010101408] = ff7693aa0000006c, %l6 = ffffffffffffffff
	ldxa	[%i4+%o4]0x80,%l6	! %l6 = ff7693aa0000006c
!	Mem[00000000100c1404] = 9ce4407c, %l4 = 0000000000000000, %asi = 80
	lduha	[%i3+0x004]%asi,%l4	! %l4 = 0000000000009ce4
!	Mem[0000000010181410] = 432486ff, %l7 = 0000000000ff14c2
	ldsha	[%i6+%o5]0x80,%l7	! %l7 = 0000000000004324
!	Mem[000000001004140b] = ffffffff, %l5 = 000000000000004a
	ldsb	[%i1+0x00b],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010041400] = af32bd4a, %l4 = 0000000000009ce4
	lduba	[%i1+%g0]0x88,%l4	! %l4 = 000000000000004a
!	Mem[0000000010041410] = 2368f943, %l2 = 0000000000000043
	ldsba	[%i1+%o5]0x88,%l2	! %l2 = 0000000000000043
!	Mem[000000001004140c] = ffffffff, %f1  = 48a23333
	ld	[%i1+0x00c],%f1 	! %f1 = ffffffff
!	Mem[00000000100c1420] = 43000000d2a39c1d, %l2 = 0000000000000043, %asi = 80
	ldxa	[%i3+0x020]%asi,%l2	! %l2 = 43000000d2a39c1d

p0_label_151:
!	Starting 10 instruction Store Burst
!	%l0 = 000000007257ffe4, Mem[00000000300c1408] = 2368f943
	stha	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 2368ffe4
!	Code Fragment 4, seed = 419029
p0_fragment_21:
!	%l0 = 000000007257ffe4
	setx	0xd0978b7f8aca367e,%g7,%l0 ! %l0 = d0978b7f8aca367e
!	%l1 = 000000001f7d11af
	setx	0x6c87525905d4fb29,%g7,%l1 ! %l1 = 6c87525905d4fb29
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = d0978b7f8aca367e
	setx	0xd6187bde7dc23be4,%g7,%l0 ! %l0 = d6187bde7dc23be4
!	%l1 = 6c87525905d4fb29
	setx	0x4143f5baebc67baf,%g7,%l1 ! %l1 = 4143f5baebc67baf
p0_fragment_21_end:
!	%f24 = 1570c728, Mem[0000000030041410] = ffffffff
	sta	%f24,[%i1+%o5]0x81	! Mem[0000000030041410] = 1570c728
!	%l3 = 000000007c40e49c, Mem[00000000211c0000] = 004a8970, %asi = 80
	stha	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = e49c8970
!	Mem[0000000010041400] = 4abd32af, %l7 = 0000000000004324
	ldstuba	[%i1+%g0]0x80,%l7	! %l7 = 000000000000004a
!	%f10 = 168e88e6 0000006c, Mem[0000000030001400] = 00006dff b9ffffff
	stda	%f10,[%i0+%g0]0x89	! Mem[0000000030001400] = 168e88e6 0000006c
!	Mem[0000000010141408] = ffffffff, %l5 = 00000000ffffffff
	swapa	[%i5+%o4]0x80,%l5	! %l5 = 00000000ffffffff
!	%l6 = 0000006c, %l7 = 0000004a, Mem[0000000010141418] = 7f2d519e 670bffff, %asi = 80
	stda	%l6,[%i5+0x018]%asi	! Mem[0000000010141418] = 0000006c 0000004a
!	Mem[0000000010001420] = 7257ffe41f7d11af, %l1 = 4143f5baebc67baf, %l6 = ff7693aa0000006c
	add	%i0,0x20,%g1
	casxa	[%g1]0x80,%l1,%l6	! %l6 = 7257ffe41f7d11af
!	%l0 = d6187bde7dc23be4, imm = 0000000000000693, %l1 = 4143f5baebc67baf
	addc	%l0,0x693,%l1		! %l1 = d6187bde7dc24277

p0_label_152:
!	Starting 10 instruction Load Burst
!	%l7 = 000000000000004a, imm = fffffffffffff072, %l0 = d6187bde7dc23be4
	and	%l7,-0xf8e,%l0		! %l0 = 0000000000000042
!	%l5 = 00000000ffffffff, imm = fffffffffffff214, %l4 = 000000000000004a
	xor	%l5,-0xdec,%l4		! %l4 = ffffffff00000deb
!	Mem[0000000030181410] = 7c40e49c, %l3 = 000000007c40e49c
	lduha	[%i6+%o5]0x89,%l3	! %l3 = 000000000000e49c
!	Mem[0000000010001400] = 000000005fb540bd, %f30 = ff000000 00000000
	ldda	[%i0+%g0]0x80,%f30	! %f30 = 00000000 5fb540bd
!	Mem[00000000100c1420] = 43000000, %l6 = 7257ffe41f7d11af
	ldub	[%i3+0x020],%l6		! %l6 = 0000000000000043
!	Mem[0000000030041400] = 1d9ca36e 00000000, %l2 = d2a39c1d, %l3 = 0000e49c
	ldda	[%i1+%g0]0x89,%l2	! %l2 = 0000000000000000 000000001d9ca36e
!	Mem[0000000010141410] = ffb9ffff, %l1 = d6187bde7dc24277
	ldsba	[%i5+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030081410] = ffffffff, %l2 = 0000000000000000
	ldsha	[%i2+%o5]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000020800000] = 40ff7110, %l6 = 0000000000000043, %asi = 80
	ldsha	[%o1+0x000]%asi,%l6	! %l6 = 00000000000040ff
!	Mem[0000000010141408] = 00ff14c2 ffffffff, %l6 = 000040ff, %l7 = 0000004a
	ldda	[%i5+%o4]0x88,%l6	! %l6 = 00000000ffffffff 0000000000ff14c2

p0_label_153:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000ff14c2, Mem[00000000211c0000] = e49c8970
	sth	%l7,[%o2+%g0]		! Mem[00000000211c0000] = 14c28970
!	Mem[0000000010181408] = dff4df0f, %l6 = 00000000ffffffff
	swapa	[%i6+%o4]0x80,%l6	! %l6 = 00000000dff4df0f
!	%l5 = 00000000ffffffff, Mem[00000000100c1410] = ff000000
	stha	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffff0000
!	%f18 = 513a4fa5, Mem[000000001018143c] = 724d2d7f
	st	%f18,[%i6+0x03c]	! Mem[000000001018143c] = 513a4fa5
!	%l0 = 00000042, %l1 = ffffffff, Mem[0000000010141400] = 9cff14c2 836d0000
	std	%l0,[%i5+%g0]		! Mem[0000000010141400] = 00000042 ffffffff
!	%l0 = 00000042, %l1 = ffffffff, Mem[0000000010041438] = 92d5901f 92d590c0, %asi = 80
	stda	%l0,[%i1+0x038]%asi	! Mem[0000000010041438] = 00000042 ffffffff
!	Mem[0000000010001410] = 00000000, %l7 = 0000000000ff14c2
	swapa	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1400] = 9cd2ffff, %l5 = 00000000ffffffff
	ldstuba	[%i3+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%f27 = 9ce4407c, Mem[0000000030081400] = 84949ce4
	sta	%f27,[%i2+%g0]0x89	! Mem[0000000030081400] = 9ce4407c
!	%f2  = 094f9b14, Mem[0000000030081400] = 9ce4407c
	sta	%f2 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 094f9b14

p0_label_154:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00ff14c2, %l6 = 00000000dff4df0f
	ldsba	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = ffffffff, %l3 = 000000001d9ca36e
	lduwa	[%i6+%o4]0x80,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000010081408] = 1d9ca36e0000004a, %f14 = 434722b2 10afc0bb
	ldda	[%i2+%o4]0x88,%f14	! %f14 = 1d9ca36e 0000004a
!	Mem[00000000300c1410] = 0000000000ff14c2, %l0 = 0000000000000042
	ldxa	[%i3+%o5]0x89,%l0	! %l0 = 0000000000ff14c2
!	Mem[0000000030101408] = 836d00ff, %l4 = ffffffff00000deb
	ldswa	[%i4+%o4]0x89,%l4	! %l4 = ffffffff836d00ff
!	Mem[0000000030001400] = 0000006c, %l2 = ffffffffffffffff
	ldsha	[%i0+%g0]0x89,%l2	! %l2 = 000000000000006c
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000010041400] = ffbd32af 000000ff ffffffff ffffffff
!	Mem[0000000010041410] = 43f96823 00000023 6ba86f1a ffc62443
!	Mem[0000000010041420] = 69b514c2 00000000 4d62fc40 68ede351
!	Mem[0000000010041430] = 172b9743 000000ff 00000042 ffffffff
	ldda	[%i1+%g0]ASI_BLK_AIUP,%f0 	! Block Load from 0000000010041400
!	Mem[00000000100c141b] = ffffffff, %l0 = 0000000000ff14c2, %asi = 80
	ldsba	[%i3+0x01b]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1410] = ffff0000b9c01eba, %l1 = ffffffffffffffff
	ldxa	[%i3+%o5]0x80,%l1	! %l1 = ffff0000b9c01eba
!	Mem[0000000010001400] = 000000005fb540bd, %l3 = 00000000ffffffff, %asi = 80
	ldxa	[%i0+0x000]%asi,%l3	! %l3 = 000000005fb540bd

p0_label_155:
!	Starting 10 instruction Store Burst
!	%l4 = ffffffff836d00ff, imm = fffffffffffff7b0, %l1 = ffff0000b9c01eba
	addc	%l4,-0x850,%l1		! %l1 = ffffffff836cf8af
!	%l1 = ffffffff836cf8af, Mem[0000000010081438] = 1d9ca36e
	stw	%l1,[%i2+0x038]		! Mem[0000000010081438] = 836cf8af
!	%l1 = ffffffff836cf8af, %l3 = 000000005fb540bd, %l2 = 000000000000006c
	sdivx	%l1,%l3,%l2		! %l2 = ffffffffffffffff
!	%l7 = 0000000000000000, Mem[0000000030001408] = d2a30000
	stwa	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	%f24 = 1570c728 00000000, %l7 = 0000000000000000
!	Mem[0000000030181408] = ff2effff00e1bcc9
	add	%i6,0x008,%g1
	stda	%f24,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030181408] = ff2effff00e1bcc9
!	%l2 = ffffffffffffffff, Mem[0000000010141408] = ffffffff
	stwa	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffffff
!	%l6 = 0000000000000000, Mem[0000000030181408] = ffff2eff
	stba	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = ffff2e00
	membar	#Sync			! Added by membar checker (25)
!	%l2 = ffffffff, %l3 = 5fb540bd, Mem[0000000010041428] = 4d62fc40 68ede351
	std	%l2,[%i1+0x028]		! Mem[0000000010041428] = ffffffff 5fb540bd
!	%f22 = 2b79af9a 5d8ee903, Mem[00000000100c1400] = 4c83887b 7c40e49c
	stda	%f22,[%i3+%g0]0x88	! Mem[00000000100c1400] = 2b79af9a 5d8ee903
!	%f10 = 4d62fc40, %f9  = 00000000
	fcmpes	%fcc1,%f10,%f9 		! %fcc1 = 2

p0_label_156:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000, %l7 = 0000000000000000
	ldswa	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001410] = 00ff14c2, %l7 = 0000000000000000
	lduba	[%i0+%o5]0x88,%l7	! %l7 = 00000000000000c2
!	Mem[0000000010141400] = 00000042 ffffffff, %l0 = ffffffff, %l1 = 836cf8af
	ldda	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000042 00000000ffffffff
!	Mem[000000001014140a] = ffffffff, %l5 = 00000000000000ff, %asi = 80
	ldsha	[%i5+0x00a]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010141400] = 00000042 ffffffff ffffffff c214ff00
!	Mem[0000000010141410] = ffb9ffff 0000007c 0000006c 0000004a
!	Mem[0000000010141420] = 7c40e49c 5fb540bd 7e7b6ac6 75d0cbff
!	Mem[0000000010141430] = d3b540bd 0000006c 317693aa ffffffff
	ldda	[%i5+%g0]ASI_BLK_AIUP,%f16	! Block Load from 0000000010141400
!	Mem[0000000030041400] = 00000000, %l1 = 00000000ffffffff
	lduwa	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041408] = ffffffff, %l0 = 0000000000000042
	lduha	[%i1+%o4]0x80,%l0	! %l0 = 000000000000ffff
!	Mem[0000000030141410] = c2146d83, %l0 = 000000000000ffff
	lduwa	[%i5+%o5]0x89,%l0	! %l0 = 00000000c2146d83
!	Mem[0000000010081400] = 7c40e49c 0000ff00, %l2 = ffffffff, %l3 = 5fb540bd
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 000000000000ff00 000000007c40e49c
!	Mem[0000000030141410] = 836d14c2 ffcbd075, %l0 = c2146d83, %l1 = 00000000
	ldda	[%i5+%o5]0x81,%l0	! %l0 = 00000000836d14c2 00000000ffcbd075

p0_label_157:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = ff0000ff, %l4 = ffffffff836d00ff
	ldstuba	[%i5+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%l1 = 00000000ffcbd075, immd = 00000e95, %y  = 00000000
	udiv	%l1,0xe95,%l6		! %l6 = 0000000000118ab8
	mov	%l0,%y			! %y = 836d14c2
!	%l0 = 00000000836d14c2, %l0 = 00000000836d14c2, %l5 = ffffffffffffffff
	andn	%l0,%l0,%l5		! %l5 = 0000000000000000
!	%f20 = ffb9ffff 0000007c, Mem[0000000010081408] = 4a000000 6ea39c1d, %asi = 80
	stda	%f20,[%i2+0x008]%asi	! Mem[0000000010081408] = ffb9ffff 0000007c
!	%l0 = 836d14c2, %l1 = ffcbd075, Mem[0000000030081410] = ffffffff 00000000
	stda	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 836d14c2 ffcbd075
!	%f24 = 7c40e49c 5fb540bd, Mem[0000000030081400] = 094f9b14 00000000
	stda	%f24,[%i2+%g0]0x89	! Mem[0000000030081400] = 7c40e49c 5fb540bd
!	%l4 = 00000000000000ff, Mem[0000000030101400] = 00000000
	stba	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff
!	Mem[0000000030081410] = c2146d83, %l6 = 0000000000118ab8
	ldstuba	[%i2+%o5]0x81,%l6	! %l6 = 00000000000000c2
!	%f22 = 0000006c, %f2  = ffffffff, %f6  = 6ba86f1a ffc62443
	fsmuld	%f22,%f2 ,%f6 		! %f6  = ffffffff e0000000
	membar	#Sync			! Added by membar checker (26)
!	%f10 = 4d62fc40, Mem[0000000010141410] = ffffb9ff
	sta	%f10,[%i5+%o5]0x88	! Mem[0000000010141410] = 4d62fc40

p0_label_158:
!	Starting 10 instruction Load Burst
!	%l7 = 00000000000000c2, imm = ffffffffffffffc6, %l2 = 000000000000ff00
	subc	%l7,-0x03a,%l2		! %l2 = 00000000000000fc
!	Mem[0000000030081400] = 7c40e49c 5fb540bd, %l6 = 000000c2, %l7 = 000000c2
	ldda	[%i2+%g0]0x89,%l6	! %l6 = 000000005fb540bd 000000007c40e49c
!	Mem[0000000010181408] = ffffb9c0ffffffff, %f16 = 00000042 ffffffff
	ldda	[%i6+%o4]0x88,%f16	! %f16 = ffffb9c0 ffffffff
!	Mem[0000000020800000] = 40ff7110, %l3 = 000000007c40e49c
	ldub	[%o1+%g0],%l3		! %l3 = 0000000000000040
!	Mem[0000000010001400] = 00000000, %f3  = ffffffff
	lda	[%i0+%g0]0x80,%f3 	! %f3 = 00000000
!	Mem[0000000030081408] = fff00b67836d00ff, %f20 = ffb9ffff 0000007c
	ldda	[%i2+%o4]0x89,%f20	! %f20 = fff00b67 836d00ff
!	Mem[0000000030081410] = ff146d83, %l0 = 00000000836d14c2
	ldsha	[%i2+%o5]0x81,%l0	! %l0 = ffffffffffffff14
!	Mem[0000000010081410] = 00ff0000, %l2 = 00000000000000fc
	lduba	[%i2+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1408] = ffffffff, %l5 = 0000000000000000
	lduha	[%i3+%o4]0x88,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010041410] = 2368f943, %l3 = 0000000000000040
	ldstuba	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000043

p0_label_159:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ffcbd075, Mem[0000000010041408] = ffffffffffffffff
	stxa	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000ffcbd075
!	Mem[0000000030141408] = ffffffff, %l3 = 0000000000000043
	ldstuba	[%i5+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001408] = 00000000, %l6 = 000000005fb540bd
	ldstuba	[%i0+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181434] = 00ff0000, %l0 = 00000000ffffff14, %asi = 80
	swapa	[%i6+0x034]%asi,%l0	! %l0 = 0000000000ff0000
!	%l7 = 000000007c40e49c, Mem[0000000010081410] = 00ff0000
	stha	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = e49c0000
!	%f6  = ffffffff, Mem[0000000030081400] = 5fb540bd
	sta	%f6 ,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffff
!	%l0 = 0000000000ff0000, Mem[000000001004141c] = ffc62443
	stw	%l0,[%i1+0x01c]		! Mem[000000001004141c] = 00ff0000
!	%l6 = 0000000000000000, Mem[0000000010181408] = ffffffff
	stwa	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000
!	Mem[000000001010140c] = 0000006c, %l3 = 000000ff, %l2 = 00000000
	add	%i4,0x0c,%g1
	casa	[%g1]0x80,%l3,%l2	! %l2 = 000000000000006c
!	Mem[00000000100c1408] = ffffffff, %l4 = 00000000000000ff
	ldstuba	[%i3+%o4]0x80,%l4	! %l4 = 00000000000000ff

p0_label_160:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000, %l1 = 00000000ffcbd075
	ldsha	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181410] = 9ce4407c65e84a24, %l6 = 0000000000000000
	ldxa	[%i6+%o5]0x81,%l6	! %l6 = 9ce4407c65e84a24
!	Mem[0000000010001410] = 00ff14c2, %l7 = 000000007c40e49c
	lduwa	[%i0+%o5]0x88,%l7	! %l7 = 0000000000ff14c2
!	Mem[0000000030041400] = 00000000, %l3 = 00000000000000ff
	ldswa	[%i1+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1410] = ffff0000b9c01eba, %f0  = ffbd32af 000000ff
	ldd	[%i3+%o5],%f0 		! %f0  = ffff0000 b9c01eba
!	Mem[0000000010001408] = 000000ff, %l6 = 9ce4407c65e84a24
	lduwa	[%i0+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000020800000] = 40ff7110, %l5 = 000000000000ffff, %asi = 80
	lduha	[%o1+0x000]%asi,%l5	! %l5 = 00000000000040ff
!	Mem[000000001014142a] = 7e7b6ac6, %l7 = 0000000000ff14c2, %asi = 80
	ldsha	[%i5+0x02a]%asi,%l7	! %l7 = 0000000000006ac6
!	Mem[0000000030001408] = ff000000, %l0 = 0000000000ff0000
	ldswa	[%i0+%o4]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010101418] = 7a5e00ff, %f18 = ffffffff
	lda	[%i4+0x018]%asi,%f18	! %f18 = 7a5e00ff

p0_label_161:
!	Starting 10 instruction Store Burst
!	%l2 = 0000006c, %l3 = 00000000, Mem[0000000030041400] = 00000000 1d9ca36e
	stda	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000006c 00000000
!	Mem[0000000010181438] = 7b88834c, %l5 = 00000000000040ff
	swap	[%i6+0x038],%l5		! %l5 = 000000007b88834c
!	%l1 = 0000000000000000, Mem[0000000030001410] = 432486ff
	stba	%l1,[%i0+%o5]0x81	! Mem[0000000030001410] = 002486ff
!	%l5 = 000000007b88834c, Mem[00000000300c1400] = ffffd29c
	stwa	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = 7b88834c
!	Mem[0000000010141400] = 00000042 ffffffff ffffffff c214ff00
!	%f0  = ffff0000 b9c01eba ffffffff 00000000
!	%f4  = 43f96823 00000023 ffffffff e0000000
!	%f8  = 69b514c2 00000000 4d62fc40 68ede351
!	%f12 = 172b9743 000000ff 00000042 ffffffff
	stda	%f0 ,[%i5+%g0]ASI_BLK_PL	! Block Store to 0000000010141400
!	%f6  = ffffffff e0000000, %l4 = 00000000000000ff
!	Mem[0000000030001410] = 002486ff44ee2c81
	add	%i0,0x010,%g1
	stda	%f6,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030001410] = 000000e0ffffffff
!	Mem[0000000030181400] = 00000000, %l3 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181408] = ffff2e00, %l0 = 00000000ff000000
	swapa	[%i6+%o4]0x89,%l0	! %l0 = 00000000ffff2e00
!	Mem[000000001004140c] = 00000000, %l2 = 0000006c, %l1 = 00000000
	add	%i1,0x0c,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 0000000000000000
!	%l7 = 0000000000006ac6, Mem[0000000010101400] = ffffffff
	stwa	%l7,[%i4+%g0]0x80	! Mem[0000000010101400] = 00006ac6

p0_label_162:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ff006d83, %l0 = 00000000ffff2e00
	lduba	[%i2+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[00000000300c1400] = 00007e7b 4c83887b, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i3+%g0]0x89,%l0	! %l0 = 000000004c83887b 0000000000007e7b
!	Mem[0000000030141408] = ffffffff43000000, %f16 = ffffb9c0 ffffffff
	ldda	[%i5+%o4]0x81,%f16	! %f16 = ffffffff 43000000
!	Mem[0000000021800000] = 60ffcfa0, %l1 = 0000000000007e7b, %asi = 80
	ldsha	[%o3+0x000]%asi,%l1	! %l1 = 00000000000060ff
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000010141408] = 00000000ffffffff, %l0 = 000000004c83887b
	ldx	[%i5+%o4],%l0		! %l0 = 00000000ffffffff
!	Mem[0000000030181408] = 000000ff, %l3 = 0000000000000000
	lduwa	[%i6+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001410] = c214ff00, %l7 = 0000000000006ac6
	ldsha	[%i0+%o5]0x80,%l7	! %l7 = ffffffffffffc214
!	Mem[0000000010141408] = 00000000, %f18 = 7a5e00ff
	lda	[%i5+%o4]0x88,%f18	! %f18 = 00000000
!	Mem[0000000010101418] = 7a5e00ff4dcad2f3, %f14 = 00000042 ffffffff, %asi = 80
	ldda	[%i4+0x018]%asi,%f14	! %f14 = 7a5e00ff 4dcad2f3
!	Mem[0000000010141438] = ffffffff, %f30 = 317693aa
	ld	[%i5+0x038],%f30	! %f30 = ffffffff

p0_label_163:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ffffffff, Mem[00000000300c1400] = 7b88834c
	stba	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff88834c
!	%l3 = 00000000000000ff, immd = 0000000000000080, %l108 = 0000000000000006
	sdivx	%l3,0x080,%l6		! %l6 = 0000000000000001
!	%l4 = 00000000000000ff, Mem[00000000100c1408] = ffffffff
	stwa	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ff
!	%f14 = 7a5e00ff, Mem[0000000010001410] = c214ff00
	sta	%f14,[%i0+%o5]0x80	! Mem[0000000010001410] = 7a5e00ff
!	Mem[0000000010041408] = 75d0cbff, %l5 = 000000007b88834c
	swap	[%i1+%o4],%l5		! %l5 = 0000000075d0cbff
!	Mem[0000000030101410] = c214ff00, %l3 = 00000000000000ff
	swapa	[%i4+%o5]0x89,%l3	! %l3 = 00000000c214ff00
!	Mem[00000000300c1400] = 4c8388ff, %l3 = 00000000c214ff00
	swapa	[%i3+%g0]0x89,%l3	! %l3 = 000000004c8388ff
!	Mem[0000000010181420] = 0000000028c77015, %l7 = ffffffffffffc214, %l1 = 00000000000060ff
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l7,%l1	! %l1 = 0000000028c77015
!	%l5 = 0000000075d0cbff, Mem[0000000010141414] = 2368f943
	stw	%l5,[%i5+0x014]		! Mem[0000000010141414] = 75d0cbff
!	Mem[00000000100c1408] = 000000ff, %l2 = 000000000000006c
	ldstuba	[%i3+%o4]0x80,%l2	! %l2 = 0000000000000000

p0_label_164:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 23000000 75d0cbff, %l0 = ffffffff, %l1 = 28c77015
	ldda	[%i5+%o5]0x80,%l0	! %l0 = 0000000023000000 0000000075d0cbff
!	%l1 = 0000000075d0cbff, Mem[0000000020800040] = ffffbf40, %asi = 80
	stha	%l1,[%o1+0x040]%asi	! Mem[0000000020800040] = cbffbf40
!	Mem[0000000010041400] = ffbd32af, %l6 = 0000000000000001
	lduba	[%i1+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101400] = 00006ac6, %l4 = 00000000000000ff
	lduba	[%i4+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000218000c0] = 06ff8a30, %l2 = 0000000000000000
	lduh	[%o3+0x0c0],%l2		! %l2 = 00000000000006ff
!	%l7 = ffffffffffffc214, imm = fffffffffffffb81, %l7 = ffffffffffffc214
	andn	%l7,-0x47f,%l7		! %l7 = 0000000000000014
!	Mem[0000000010081410] = e49c0000, %l3 = 000000004c8388ff
	lduha	[%i2+%o5]0x80,%l3	! %l3 = 000000000000e49c
!	Mem[0000000010001408] = ff000000, %f14 = 7a5e00ff
	lda	[%i0+%o4]0x88,%f14	! %f14 = ff000000
!	Mem[0000000010181410] = ff862443, %l3 = 000000000000e49c
	lduha	[%i6+%o5]0x88,%l3	! %l3 = 0000000000002443
!	%l6 = 00000000000000ff, Mem[0000000030041408] = 0df33cda
	stha	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 00ff3cda

p0_label_165:
!	Starting 10 instruction Store Burst
!	%f3  = 00000000, Mem[0000000010141410] = 23000000
	sta	%f3 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	%f24 = 7c40e49c 5fb540bd, %l6 = 00000000000000ff
!	Mem[0000000030181438] = 4c17000044ee2c81
	add	%i6,0x038,%g1
	stda	%f24,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030181438] = bd40b55f9ce4407c
!	Mem[0000000010041408] = 7b88834c, %l0 = 0000000023000000
	ldstuba	[%i1+%o4]0x80,%l0	! %l0 = 000000000000007b
!	%f24 = 7c40e49c, Mem[0000000030141408] = ffffffff
	sta	%f24,[%i5+%o4]0x81	! Mem[0000000030141408] = 7c40e49c
!	%f26 = 7e7b6ac6 75d0cbff, Mem[0000000010081408] = ffb9ffff 0000007c
	stda	%f26,[%i2+%o4]0x80	! Mem[0000000010081408] = 7e7b6ac6 75d0cbff
!	Code Fragment 3, seed = 752838
p0_fragment_22:
!	%l0 = 000000000000007b
	setx	0xb3f9fe372ad137f6,%g7,%l0 ! %l0 = b3f9fe372ad137f6
!	%l1 = 0000000075d0cbff
	setx	0x795f58047463a321,%g7,%l1 ! %l1 = 795f58047463a321
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b3f9fe372ad137f6
	setx	0x3023893cca29c25c,%g7,%l0 ! %l0 = 3023893cca29c25c
!	%l1 = 795f58047463a321
	setx	0xa4739c0d46f298a7,%g7,%l1 ! %l1 = a4739c0d46f298a7
p0_fragment_22_end:
!	Mem[0000000030001408] = 000000ff, %l5 = 0000000075d0cbff
	ldstuba	[%i0+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%l3 = 0000000000002443, Mem[000000001000143c] = 82d3aa4c, %asi = 80
	stha	%l3,[%i0+0x03c]%asi	! Mem[000000001000143c] = 2443aa4c
!	%l4 = 0000000000000000, Mem[0000000030041410] = 1570c728
	stha	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000c728
!	%f9  = 00000000, Mem[0000000030041408] = 00ff3cda
	sta	%f9 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000

p0_label_166:
!	Starting 10 instruction Load Burst
!	Mem[000000001004140c] = 00000000, %l0 = 3023893cca29c25c, %asi = 80
	lduba	[%i1+0x00c]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181400] = ffffd29c 7b7e0000, %l2 = 000006ff, %l3 = 00002443
	ldda	[%i6+%g0]0x88,%l2	! %l2 = 000000007b7e0000 00000000ffffd29c
!	Mem[0000000010081408] = 7e7b6ac6, %l1 = a4739c0d46f298a7
	lduwa	[%i2+%o4]0x80,%l1	! %l1 = 000000007e7b6ac6
!	Mem[0000000010081400] = 00ff0000 9ce4407c, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 0000000000ff0000 000000009ce4407c
!	Mem[00000000300c1410] = 00ff14c2, %l0 = 0000000000000000
	ldsba	[%i3+%o5]0x89,%l0	! %l0 = ffffffffffffffc2
!	Mem[0000000010141410] = 00000000, %l0 = ffffffffffffffc2
	lduba	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = 2b79af9a 5d8ee903, %l4 = 00ff0000, %l5 = 9ce4407c
	ldda	[%i3+%g0]0x88,%l4	! %l4 = 000000005d8ee903 000000002b79af9a
!	Mem[00000000218001c0] = ffff4af0, %l4 = 000000005d8ee903, %asi = 80
	lduha	[%o3+0x1c0]%asi,%l4	! %l4 = 000000000000ffff
!	Mem[00000000300c1410] = c214ff00, %l4 = 000000000000ffff
	ldswa	[%i3+%o5]0x81,%l4	! %l4 = ffffffffc214ff00
!	%f27 = 75d0cbff, %f5  = 00000023, %f0  = ffff0000
	fmuls	%f27,%f5 ,%f0 		! tt=0x22, %l0 = 0000000000000022

p0_label_167:
!	Starting 10 instruction Store Burst
!	%l2 = 000000007b7e0000, Mem[000000001000140c] = 00000000
	stw	%l2,[%i0+0x00c]		! Mem[000000001000140c] = 7b7e0000
!	Mem[0000000030101408] = 836d00ff, %l5 = 000000002b79af9a
	swapa	[%i4+%o4]0x89,%l5	! %l5 = 00000000836d00ff
!	%l6 = 000000ff, %l7 = 00000014, Mem[0000000010181410] = 432486ff 44ee2c81, %asi = 80
	stda	%l6,[%i6+0x010]%asi	! Mem[0000000010181410] = 000000ff 00000014
!	Mem[00000000100c1410] = ffff0000, %l1 = 000000007e7b6ac6
	ldstuba	[%i3+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[00000000100c140c] = c214ff00, %asi = 80
	stba	%l1,[%i3+0x00c]%asi	! Mem[00000000100c140c] = ff14ff00
!	%f12 = 172b9743 000000ff, Mem[00000000300c1408] = e4ff6823 da3cf30d
	stda	%f12,[%i3+%o4]0x81	! Mem[00000000300c1408] = 172b9743 000000ff
!	%f14 = ff000000, Mem[0000000030101410] = ff000000
	sta	%f14,[%i4+%o5]0x81	! Mem[0000000030101410] = ff000000
!	%l0 = 00000022, %l1 = 000000ff, Mem[0000000010001410] = 7a5e00ff 00007e7b
	stda	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000022 000000ff
!	Mem[000000001004140c] = 00000000, %l7 = 00000014, %l3 = ffffd29c
	add	%i1,0x0c,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 0000000000000000
!	%l6 = 000000ff, %l7 = 00000014, Mem[0000000010101408] = ff7693aa 0000006c
	stda	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff 00000014

p0_label_168:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041430] = 172b9743000000ff, %l4 = ffffffffc214ff00
	ldx	[%i1+0x030],%l4		! %l4 = 172b9743000000ff
!	Mem[0000000010141400] = ffff0000b9c01eba, %f2  = ffffffff 00000000
	ldda	[%i5+%g0]0x88,%f2 	! %f2  = ffff0000 b9c01eba
!	Mem[00000000201c0000] = 00009ee0, %l2 = 000000007b7e0000, %asi = 80
	lduba	[%o0+0x000]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = 7e7b6ac6, %f13 = 000000ff
	lda	[%i2+%o4]0x80,%f13	! %f13 = 7e7b6ac6
!	Mem[0000000030181410] = 9ce4407c, %f0  = ffff0000
	lda	[%i6+%o5]0x81,%f0 	! %f0 = 9ce4407c
!	Mem[0000000010141408] = 00000000, %l3 = 0000000000000000
	ldswa	[%i5+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800040] = cbffbf40, %l2 = 0000000000000000, %asi = 80
	lduha	[%o1+0x040]%asi,%l2	! %l2 = 000000000000cbff
!	Mem[00000000100c141c] = ffffffff, %f15 = 4dcad2f3
	lda	[%i3+0x01c]%asi,%f15	! %f15 = ffffffff
!	Mem[00000000201c0000] = 00009ee0, %l4 = 172b9743000000ff, %asi = 80
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041408] = ff88834c, %l3 = 0000000000000000
	ldswa	[%i1+%o4]0x80,%l3	! %l3 = ffffffffff88834c

p0_label_169:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000022, Mem[00000000300c1410] = c214ff00
	stba	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 2214ff00
!	%f16 = ffffffff 43000000, %l0 = 0000000000000022
!	Mem[0000000010101430] = 1c1e8fc44f2b26ff
	add	%i4,0x030,%g1
	stda	%f16,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010101430] = 1c1e8fc4ffffffff
!	%l3 = ffffffffff88834c, Mem[0000000030101400] = 000000ff
	stba	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000004c
!	%f2  = ffff0000 b9c01eba, %l2 = 000000000000cbff
!	Mem[0000000010001438] = 4bece71a2443aa4c
	add	%i0,0x038,%g1
	stda	%f2,[%g1+%l2]ASI_PST16_P ! Mem[0000000010001438] = ffff0000b9c01eba
!	Mem[0000000010081410] = 00009ce4, %l5 = 00000000836d00ff
	swapa	[%i2+%o5]0x88,%l5	! %l5 = 0000000000009ce4
!	%f28 = d3b540bd, Mem[0000000030081410] = ff146d83
	sta	%f28,[%i2+%o5]0x81	! Mem[0000000030081410] = d3b540bd
!	%l6 = 00000000000000ff, Mem[00000000211c0000] = 14c28970, %asi = 80
	stba	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffc28970
!	Mem[0000000010141430] = ff000000, %l2 = 000000000000cbff
	swap	[%i5+0x030],%l2		! %l2 = 00000000ff000000
!	%l7 = 0000000000000014, immd = 00000563, %y  = 836d14c2
	sdiv	%l7,0x563,%l0		! %l0 = ffffffff80000000
	mov	%l0,%y			! %y = 80000000
!	%l2 = 00000000ff000000, Mem[0000000010101408] = ff000000
	stha	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = ff000000

p0_label_170:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = fff96823, %l3 = ffffffffff88834c
	ldsha	[%i1+%o5]0x80,%l3	! %l3 = fffffffffffffff9
!	Mem[0000000010041434] = 000000ff, %l0 = ffffffff80000000
	lduh	[%i1+0x034],%l0		! %l0 = 0000000000000000
!	Mem[0000000030041410] = 28c70000, %l4 = 0000000000000000
	ldsba	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181400] = 00007e7b9cd2ffff, %l6 = 00000000000000ff
	ldxa	[%i6+%g0]0x80,%l6	! %l6 = 00007e7b9cd2ffff
!	Mem[00000000100c1400] = 5d8ee903, %l1 = 00000000000000ff
	lduba	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000003
!	Mem[0000000010181408] = 00000000, %l3 = fffffffffffffff9
	lduha	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = 00000022, %l5 = 0000000000009ce4
	lduba	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l6 = 00007e7b9cd2ffff
	lduwa	[%i6+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = c282134c2b79af9a, %l3 = 0000000000000000
	ldxa	[%i4+%o4]0x89,%l3	! %l3 = c282134c2b79af9a
!	Mem[0000000010101408] = ff000000, %l3 = c282134c2b79af9a
	ldsba	[%i4+%o4]0x88,%l3	! %l3 = 0000000000000000

p0_label_171:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000014, Mem[00000000201c0000] = 00009ee0
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 00149ee0
!	Mem[0000000030181408] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l2 = 00000000ff000000
	ldstuba	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[00000000201c0000] = 00149ee0, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00009ee0
!	%l4 = 0000000000000000, Mem[000000001010140b] = 000000ff
	stb	%l4,[%i4+0x00b]		! Mem[0000000010101408] = 00000000
!	Mem[0000000020800040] = cbffbf40, %l1 = 0000000000000003
	ldstuba	[%o1+0x040]%asi,%l1	! %l1 = 00000000000000cb
!	%l0 = 0000000000000000, %l0 = 0000000000000000, %l6 = 0000000000000000
	xor	%l0,%l0,%l6		! %l6 = 0000000000000000
!	Mem[0000000010041408] = ff88834c, %l7 = 0000000000000014
	ldstuba	[%i1+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000030041408] = 00000000
	stwa	%l3,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	%l4 = 0000000000000000, Mem[0000000030101400] = 4c000000
	stba	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000

p0_label_172:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 000000ff, %f22 = 0000006c
	lda	[%i6+%o5]0x80,%f22	! %f22 = 000000ff
!	Mem[0000000030001408] = ff000000149b4f09, %l5 = 0000000000000000
	ldxa	[%i0+%o4]0x81,%l5	! %l5 = ff000000149b4f09
!	Mem[0000000010181410] = 000000ff00000014, %l1 = 00000000000000cb
	ldxa	[%i6+%o5]0x80,%l1	! %l1 = 000000ff00000014
!	Mem[0000000010101400] = 00006ac6ff000000, %l1 = 000000ff00000014
	ldxa	[%i4+%g0]0x80,%l1	! %l1 = 00006ac6ff000000
!	Mem[0000000030001408] = ff000000, %l1 = 00006ac6ff000000
	ldsha	[%i0+%o4]0x81,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000030081408] = ff006d83, %l4 = 0000000000000000
	lduba	[%i2+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141400] = ffff0000b9c01eba, %f12 = 172b9743 7e7b6ac6
	ldda	[%i5+%g0]0x88,%f12	! %f12 = ffff0000 b9c01eba
!	Mem[0000000010081408] = c66a7b7e, %l3 = 0000000000000000
	ldsba	[%i2+%o4]0x88,%l3	! %l3 = 000000000000007e
!	Mem[0000000010041400] = ffbd32af 000000ff, %l4 = 000000ff, %l5 = 149b4f09
	ldd	[%i1+%g0],%l4		! %l4 = 00000000ffbd32af 00000000000000ff
!	Mem[0000000030141400] = ff0000ff, %l2 = 0000000000000000
	ldsba	[%i5+%g0]0x81,%l2	! %l2 = ffffffffffffffff

p0_label_173:
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000007e, Mem[0000000010001400] = 00000000
	stba	%l3,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000007e
!	%l4 = 00000000ffbd32af, Mem[00000000100c1410] = 0000ffff
	stba	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000ffaf
!	%l3 = 000000000000007e, Mem[0000000010101410] = c9bce100
	stba	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 7ebce100
!	%f0  = 9ce4407c, Mem[0000000030081408] = ff006d83
	sta	%f0 ,[%i2+%o4]0x81	! Mem[0000000030081408] = 9ce4407c
!	%l3 = 000000000000007e, Mem[0000000030081400] = ffffffff
	stha	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = 007effff
!	%l7 = 00000000000000ff, Mem[0000000030001400] = 6c000000
	stwa	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000ff
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000030101410] = 000000ff ffffffff
	stda	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000 000000ff
!	Mem[0000000030181410] = 7c40e49c, %l0 = 0000000000000000
	swapa	[%i6+%o5]0x89,%l0	! %l0 = 000000007c40e49c
!	%l2 = ffffffffffffffff, Mem[0000000010041408] = ff88834c
	stha	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = ffff834c
!	Mem[0000000010101410] = 7ebce100ab000000, %l5 = 00000000000000ff, %l3 = 000000000000007e
	add	%i4,0x10,%g1
	casxa	[%g1]0x80,%l5,%l3	! %l3 = 7ebce100ab000000

p0_label_174:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 7ebce100, %l6 = 0000000000000000
	lduwa	[%i4+%o5]0x80,%l6	! %l6 = 000000007ebce100
!	Mem[000000001004142b] = ffffffff, %l2 = ffffffffffffffff
	ldsb	[%i1+0x02b],%l2		! %l2 = ffffffffffffffff
!	Mem[00000000201c0000] = 00009ee0, %l4 = 00000000ffbd32af, %asi = 80
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081408] = 9ce4407c670bf0ff, %f12 = ffff0000 b9c01eba
	ldda	[%i2+%o4]0x81,%f12	! %f12 = 9ce4407c 670bf0ff
!	Mem[00000000100c1410] = afff0000b9c01eba, %l3 = 7ebce100ab000000
	ldxa	[%i3+%o5]0x80,%l3	! %l3 = afff0000b9c01eba
!	Code Fragment 4, seed = 284729
p0_fragment_23:
!	%l0 = 000000007c40e49c
	setx	0x31b1e3a8579f3f5e,%g7,%l0 ! %l0 = 31b1e3a8579f3f5e
!	%l1 = ffffffffffffff00
	setx	0xd393fbc8a5f52e09,%g7,%l1 ! %l1 = d393fbc8a5f52e09
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 31b1e3a8579f3f5e
	setx	0x0bd55ad6ce0d78c4,%g7,%l0 ! %l0 = 0bd55ad6ce0d78c4
!	%l1 = d393fbc8a5f52e09
	setx	0xf31045c09896a28f,%g7,%l1 ! %l1 = f31045c09896a28f
p0_fragment_23_end:
!	Mem[0000000010181410] = 000000ff00000014, %f8  = 69b514c2 00000000
	ldda	[%i6+%o5]0x80,%f8 	! %f8  = 000000ff 00000014
!	Mem[0000000010101410] = 7ebce100, %l6 = 000000007ebce100
	ldsha	[%i4+%o5]0x80,%l6	! %l6 = 0000000000007ebc
!	Mem[0000000010181400] = 00007e7b 9cd2ffff, %l6 = 00007ebc, %l7 = 000000ff
	ldd	[%i6+%g0],%l6		! %l6 = 0000000000007e7b 000000009cd2ffff
!	Mem[0000000030081408] = 9ce4407c, %l3 = afff0000b9c01eba
	lduha	[%i2+%o4]0x81,%l3	! %l3 = 0000000000009ce4

p0_label_175:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 7e000000, %l7 = 000000009cd2ffff
	ldstuba	[%i0+%g0]0x80,%l7	! %l7 = 000000000000007e
!	%l4 = 0000000000000000, Mem[00000000300c1408] = ff00000043972b17
	stxa	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000000000000
!	Mem[0000000010141400] = ba1ec0b9 0000ffff 00000000 ffffffff
!	%f16 = ffffffff 43000000 00000000 c214ff00
!	%f20 = fff00b67 836d00ff 000000ff 0000004a
!	%f24 = 7c40e49c 5fb540bd 7e7b6ac6 75d0cbff
!	%f28 = d3b540bd 0000006c ffffffff ffffffff
	stda	%f16,[%i5+%g0]ASI_BLK_PL	! Block Store to 0000000010141400
!	Mem[000000001008142c] = 1a6fa86b, %l1 = 000000009896a28f, %asi = 80
	swapa	[%i2+0x02c]%asi,%l1	! %l1 = 000000001a6fa86b
!	%l1 = 000000001a6fa86b, Mem[0000000010081400] = 00ff0000
	stba	%l1,[%i2+%g0]0x80	! Mem[0000000010081400] = 6bff0000
!	Mem[00000000218001c0] = ffff4af0, %l4 = 0000000000000000
	ldstuba	[%o3+0x1c0]%asi,%l4	! %l4 = 00000000000000ff
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000010141400] = 00000043, %l2 = ffffffffffffffff
	ldstuba	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%f20 = fff00b67 836d00ff, %l1 = 000000001a6fa86b
!	Mem[00000000300c1410] = 2214ff0000000000
	add	%i3,0x010,%g1
	stda	%f20,[%g1+%l1]ASI_PST8_SL ! Mem[00000000300c1410] = ff00ff83000bf000
!	%f0  = 9ce4407c b9c01eba, Mem[0000000030101410] = 00000000 ff000000
	stda	%f0 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 9ce4407c b9c01eba
!	%l2 = 00000000, %l3 = 00009ce4, Mem[0000000030041400] = 6c000000 00000000
	stda	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000 00009ce4

p0_label_176:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = afff0000, %l4 = 00000000000000ff
	ldub	[%i3+%o5],%l4		! %l4 = 00000000000000af
!	%f4  = 43f96823, %f3  = b9c01eba, %f6  = ffffffff
	fmuls	%f4 ,%f3 ,%f6 		! %f6  = be3b2c0a
!	Mem[0000000021800140] = 4dff7290, %l1 = 000000001a6fa86b, %asi = 80
	lduba	[%o3+0x140]%asi,%l1	! %l1 = 000000000000004d
!	Mem[0000000020800000] = 40ff7110, %l2 = 0000000000000000
	lduh	[%o1+%g0],%l2		! %l2 = 00000000000040ff
!	Mem[0000000010101408] = 00000000, %l0 = 0bd55ad6ce0d78c4
	ldsha	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001400] = ff000000, %l7 = 000000000000007e
	lduba	[%i0+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001410] = ffffffffe0000000, %l1 = 000000000000004d
	ldxa	[%i0+%o5]0x89,%l1	! %l1 = ffffffffe0000000
!	Mem[0000000030081408] = 7c40e49c, %l0 = 0000000000000000
	lduba	[%i2+%o4]0x89,%l0	! %l0 = 000000000000009c
!	Mem[0000000010101412] = 7ebce100, %l0 = 000000000000009c, %asi = 80
	ldsba	[%i4+0x012]%asi,%l0	! %l0 = ffffffffffffffe1
!	Mem[00000000100c1422] = 43000000, %l6 = 0000000000007e7b, %asi = 80
	ldsha	[%i3+0x022]%asi,%l6	! %l6 = 0000000000000000

p0_label_177:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000010041400] = af32bdff
	stba	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = af32bdff
!	Mem[0000000010041400] = ffbd32af, %l3 = 0000000000009ce4
	swapa	[%i1+%g0]0x80,%l3	! %l3 = 00000000ffbd32af
!	%l3 = 00000000ffbd32af, Mem[00000000300c1410] = 00f00b0083ff00ff
	stxa	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000ffbd32af
!	%f9  = 00000014, %f23 = 0000004a, %f5  = 00000023
	fdivs	%f9 ,%f23,%f5 		! tt=0x22, %l0 = 0000000000000003
!	Mem[0000000010141414] = 670bf0ff, %l1 = e0000000, %l5 = 000000ff
	add	%i5,0x14,%g1
	casa	[%g1]0x80,%l1,%l5	! %l5 = 00000000670bf0ff
!	%l2 = 00000000000040ff, Mem[0000000020800000] = 40ff7110, %asi = 80
	stha	%l2,[%o1+0x000]%asi	! Mem[0000000020800000] = 40ff7110
!	%l0 = 00000003, %l1 = e0000000, Mem[0000000030141408] = 9ce4407c 00000043
	stda	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000003 e0000000
!	Mem[00000000300c1400] = 00ff14c2 7b7e0000 00000000 00000000
!	%f0  = 9ce4407c b9c01eba ffff0000 b9c01eba
!	%f4  = 43f96823 00000023 be3b2c0a e0000000
!	%f8  = 000000ff 00000014 4d62fc40 68ede351
!	%f12 = 9ce4407c 670bf0ff ff000000 ffffffff
	stda	%f0 ,[%i3+%g0]ASI_BLK_S	! Block Store to 00000000300c1400
	membar	#Sync			! Added by membar checker (29)
!	Mem[00000000300c1408] = 0000ffff, %l7 = 00000000000000ff
	swapa	[%i3+%o4]0x89,%l7	! %l7 = 000000000000ffff
!	%l1 = ffffffffe0000000, Mem[00000000100c1408] = ff0000ff
	stwa	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = e0000000

p0_label_178:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 5d8ee903, %l5 = 00000000670bf0ff
	ldsha	[%i3+%g0]0x88,%l5	! %l5 = ffffffffffffe903
!	%l4 = 00000000000000af, Mem[0000000010041410] = fff96823
	stwa	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000af
!	Mem[0000000030081408] = 9ce4407c, %l4 = 00000000000000af
	ldsha	[%i2+%o4]0x81,%l4	! %l4 = ffffffffffff9ce4
!	Mem[00000000201c0000] = 00009ee0, %l5 = ffffffffffffe903
	lduh	[%o0+%g0],%l5		! %l5 = 0000000000000000
!	Mem[0000000010081400] = 6bff0000, %l7 = 000000000000ffff
	ldsha	[%i2+%g0]0x80,%l7	! %l7 = 0000000000006bff
!	Mem[0000000030141400] = c9bce100ff0000ff, %l3 = 00000000ffbd32af
	ldxa	[%i5+%g0]0x89,%l3	! %l3 = c9bce100ff0000ff
!	Mem[0000000020800000] = 40ff7110, %l7 = 0000000000006bff
	ldsh	[%o1+%g0],%l7		! %l7 = 00000000000040ff
!	Mem[0000000010181400] = 00007e7b, %l4 = ffffffffffff9ce4
	ldsw	[%i6+%g0],%l4		! %l4 = 0000000000007e7b
!	Mem[00000000300c1400] = ba1ec0b9 7c40e49c, %l2 = 000040ff, %l3 = ff0000ff
	ldda	[%i3+%g0]0x89,%l2	! %l2 = 000000007c40e49c 00000000ba1ec0b9
!	Mem[00000000100c1410] = afff0000, %l7 = 00000000000040ff
	ldsha	[%i3+%o5]0x80,%l7	! %l7 = ffffffffffffafff

p0_label_179:
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffafff, Mem[0000000010181400] = 7b7e0000
	stba	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = 7b7e00ff
!	%l4 = 0000000000007e7b, Mem[0000000010041408] = 4c83ffff
	stba	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 4c83ff7b
!	%f16 = ffffffff 43000000, Mem[0000000030181410] = 00000000 65e84a24
	stda	%f16,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffffff 43000000
!	Mem[0000000010001400] = ff000000 5fb540bd 000000ff 7b7e0000
!	%f16 = ffffffff 43000000 00000000 c214ff00
!	%f20 = fff00b67 836d00ff 000000ff 0000004a
!	%f24 = 7c40e49c 5fb540bd 7e7b6ac6 75d0cbff
!	%f28 = d3b540bd 0000006c ffffffff ffffffff
	stda	%f16,[%i0+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010001400
!	Mem[0000000030001400] = 000000ff, %l7 = 00000000ffffafff
	swapa	[%i0+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000010101432] = 1c1e8fc4, %asi = 80
	stha	%l6,[%i4+0x032]%asi	! Mem[0000000010101430] = 1c1e0000
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000010001410] = ff006d83, %l6 = 0000000000000000
	ldstuba	[%i0+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	%l4 = 00007e7b, %l5 = 00000000, Mem[0000000030181400] = 00000000 00007e7b
	stda	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 00007e7b 00000000
!	%l7 = 00000000000000ff, Mem[0000000030001410] = 000000e0
	stba	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = ff0000e0
!	Mem[00000000100c1400] = 5d8ee903, %l4 = 0000000000007e7b
	ldstuba	[%i3+%g0]0x88,%l4	! %l4 = 0000000000000003

p0_label_180:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 6bff0000, %l3 = 00000000ba1ec0b9
	ldsba	[%i2+%g0]0x80,%l3	! %l3 = 000000000000006b
!	Mem[00000000300c1408] = 000000ff, %l2 = 000000007c40e49c
	ldsha	[%i3+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101410] = 7c40e49c, %f19 = c214ff00
	lda	[%i4+%o5]0x89,%f19	! %f19 = 7c40e49c
!	Mem[0000000030041410] = 0000c728, %f22 = 000000ff
	lda	[%i1+%o5]0x81,%f22	! %f22 = 0000c728
!	Mem[0000000010001400] = 43000000, %l3 = 000000000000006b
	ldswa	[%i0+%g0]0x88,%l3	! %l3 = 0000000043000000
!	Mem[00000000300c1408] = ff000000, %l4 = 0000000000000003
	lduha	[%i3+%o4]0x81,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030001410] = ff0000e0, %l0 = 0000000000000003
	ldswa	[%i0+%o5]0x81,%l0	! %l0 = ffffffffff0000e0
!	Mem[0000000030141410] = 836d14c2, %l5 = 0000000000000000
	ldswa	[%i5+%o5]0x81,%l5	! %l5 = ffffffff836d14c2
!	Mem[0000000010081410] = ff006d83, %l6 = 00000000000000ff
	ldsba	[%i2+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030081408] = 9ce4407c, %l6 = ffffffffffffffff
	ldsha	[%i2+%o4]0x81,%l6	! %l6 = ffffffffffff9ce4

p0_label_181:
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000ff00, Mem[00000000211c0000] = ffc28970
	stb	%l4,[%o2+%g0]		! Mem[00000000211c0000] = 00c28970
!	%l5 = ffffffff836d14c2, Mem[0000000010081408] = 7e7b6ac6
	stba	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = c27b6ac6
!	%l0 = ff0000e0, %l1 = e0000000, Mem[00000000100c1410] = afff0000 b9c01eba
	std	%l0,[%i3+%o5]		! Mem[00000000100c1410] = ff0000e0 e0000000
!	%l4 = 000000000000ff00, Mem[0000000030081400] = 7c40e49cffff7e00
	stxa	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000000000ff00
!	%l2 = 00000000000000ff, Mem[0000000030141400] = ff0000ff
	stha	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 00ff00ff
!	%l6 = ffffffffffff9ce4, Mem[000000001004142c] = 5fb540bd
	stw	%l6,[%i1+0x02c]		! Mem[000000001004142c] = ffff9ce4
!	%l0 = ffffffffff0000e0, Mem[0000000030081400] = 0000ff00
	stwa	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = ff0000e0
!	%f22 = 0000c728 0000004a, Mem[0000000010141410] = ff006d83 670bf0ff
	stda	%f22,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000c728 0000004a
!	Code Fragment 4, seed = 241695
p0_fragment_24:
!	%l0 = ffffffffff0000e0
	setx	0xc5c4eb36353f462e,%g7,%l0 ! %l0 = c5c4eb36353f462e
!	%l1 = ffffffffe0000000
	setx	0xed79e978973abbd9,%g7,%l1 ! %l1 = ed79e978973abbd9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c5c4eb36353f462e
	setx	0x69ad8d5195cddd94,%g7,%l0 ! %l0 = 69ad8d5195cddd94
!	%l1 = ed79e978973abbd9
	setx	0xf33f9cac27e62e5f,%g7,%l1 ! %l1 = f33f9cac27e62e5f
p0_fragment_24_end:
!	Mem[0000000010001438] = ffffffff, %l3 = 0000000043000000
	swap	[%i0+0x038],%l3		! %l3 = 00000000ffffffff

p0_label_182:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 7c40e49c, %l6 = ffffffffffff9ce4
	ldsha	[%i2+%o4]0x89,%l6	! %l6 = ffffffffffffe49c
!	Mem[00000000100c1400] = 5d8ee9ff, %l6 = ffffffffffffe49c
	ldsba	[%i3+%g0]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030101408] = 2b79af9a, %l5 = ffffffff836d14c2
	ldsba	[%i4+%o4]0x89,%l5	! %l5 = ffffffffffffff9a
!	Mem[0000000021800140] = 4dff7290, %l4 = 000000000000ff00
	ldsb	[%o3+0x140],%l4		! %l4 = 000000000000004d
!	Mem[000000001014141c] = ff000000, %l6 = ffffffffffffffff
	ldsh	[%i5+0x01c],%l6		! %l6 = ffffffffffffff00
!	Mem[0000000030041410] = 0000c728, %l0 = 69ad8d5195cddd94
	ldsha	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141410] = 28c70000, %l1 = f33f9cac27e62e5f
	lduha	[%i5+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[000000001014140c] = 00000000, %l0 = 0000000000000000
	ldsw	[%i5+0x00c],%l0		! %l0 = 0000000000000000
!	Mem[0000000010141408] = 00ff14c2 00000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i5+%o4]0x80,%l0	! %l0 = 0000000000ff14c2 0000000000000000
!	Mem[0000000010141420] = bd40b55f, %l6 = ffffffffffffff00
	lduw	[%i5+0x020],%l6		! %l6 = 00000000bd40b55f

p0_label_183:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000bd40b55f, Mem[0000000010101400] = 00006ac6ff000000
	stx	%l6,[%i4+%g0]		! Mem[0000000010101400] = 00000000bd40b55f
!	%f24 = 7c40e49c 5fb540bd, Mem[0000000010181408] = 00000000 c0b9ffff
	stda	%f24,[%i6+%o4]0x80	! Mem[0000000010181408] = 7c40e49c 5fb540bd
!	%f28 = d3b540bd 0000006c, Mem[0000000010181400] = 7b7e00ff ffffd29c
	stda	%f28,[%i6+%g0]0x88	! Mem[0000000010181400] = d3b540bd 0000006c
!	%l0 = 0000000000ff14c2, Mem[0000000030101400] = 4172f07d00000000
	stxa	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000000000ff14c2
!	%f26 = 7e7b6ac6 75d0cbff, Mem[0000000010141400] = ff000043 ffffffff
	std	%f26,[%i5+%g0]		! Mem[0000000010141400] = 7e7b6ac6 75d0cbff
!	%f26 = 7e7b6ac6 75d0cbff, Mem[0000000010181430] = 1b5c951b ffffff14
	std	%f26,[%i6+0x030]	! Mem[0000000010181430] = 7e7b6ac6 75d0cbff
!	Mem[0000000010081410] = ff006d83, %l4 = 000000000000004d
	ldstuba	[%i2+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%l6 = 00000000bd40b55f, Mem[00000000211c0000] = 00c28970, %asi = 80
	stha	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = b55f8970
!	%l1 = 0000000000000000, Mem[0000000010081410] = 7c40e49c836d00ff
	stxa	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000000000000000
!	%l6 = 00000000bd40b55f, Mem[0000000030081400] = e00000ff
	stba	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = 5f0000ff

p0_label_184:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 7ebce100, %l1 = 0000000000000000
	ldsha	[%i4+%o5]0x80,%l1	! %l1 = 0000000000007ebc
!	Mem[0000000010181408] = 7c40e49c, %l0 = 0000000000ff14c2
	lduwa	[%i6+%o4]0x80,%l0	! %l0 = 000000007c40e49c
!	Mem[0000000010001408] = 00ff14c2, %l4 = 00000000000000ff
	ldsba	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041408] = 4c83ff7b, %l2 = 00000000000000ff
	lduwa	[%i1+%o4]0x88,%l2	! %l2 = 000000004c83ff7b
!	Mem[00000000300c1400] = ba1ec0b97c40e49c, %l3 = 00000000ffffffff
	ldxa	[%i3+%g0]0x89,%l3	! %l3 = ba1ec0b97c40e49c
!	Code Fragment 3, seed = 779639
p0_fragment_25:
!	%l0 = 000000007c40e49c
	setx	0xfad63837a2ea736e,%g7,%l0 ! %l0 = fad63837a2ea736e
!	%l1 = 0000000000007ebc
	setx	0x698ed59056776519,%g7,%l1 ! %l1 = 698ed59056776519
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = fad63837a2ea736e
	setx	0x7d32683b6c9342d4,%g7,%l0 ! %l0 = 7d32683b6c9342d4
!	%l1 = 698ed59056776519
	setx	0xb4f72949bb878f9f,%g7,%l1 ! %l1 = b4f72949bb878f9f
p0_fragment_25_end:
!	Mem[0000000010141400] = c66a7b7e, %l3 = ba1ec0b97c40e49c
	ldsha	[%i5+%g0]0x88,%l3	! %l3 = 0000000000007b7e
!	Mem[0000000030181408] = ff0000ff, %l2 = 000000004c83ff7b
	ldswa	[%i6+%o4]0x89,%l2	! %l2 = ffffffffff0000ff
!	Mem[0000000030101410] = 9ce4407cb9c01eba, %f18 = 00000000 7c40e49c
	ldda	[%i4+%o5]0x81,%f18	! %f18 = 9ce4407c b9c01eba
!	Mem[0000000010181410] = 000000ff, %l3 = 0000000000007b7e
	lduwa	[%i6+%o5]0x80,%l3	! %l3 = 00000000000000ff

p0_label_185:
!	Starting 10 instruction Store Burst
!	%l6 = bd40b55f, %l7 = 000000ff, Mem[0000000030141400] = ff00ff00 c9bce100
	stda	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = bd40b55f 000000ff
!	Mem[00000000100c141c] = ffffffff, %l0 = 000000006c9342d4
	swap	[%i3+0x01c],%l0		! %l0 = 00000000ffffffff
!	Mem[0000000010001400] = 43000000, %l2 = ffffffffff0000ff
	ldstuba	[%i0+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1410] = 2368f943, %l6 = 00000000bd40b55f
	ldstuba	[%i3+%o5]0x89,%l6	! %l6 = 0000000000000043
!	Mem[0000000010081437] = 6cb314c2, %l5 = ffffffffffffff9a
	ldstuba	[%i2+0x037]%asi,%l5	! %l5 = 00000000000000c2
!	Mem[0000000030181410] = ffffffff, %l0 = 00000000ffffffff
	ldstuba	[%i6+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%l6 = 0000000000000043, Mem[00000000300c1408] = ba1ec0b9000000ff
	stxa	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000000000043
!	Mem[0000000010081420] = 74baca9853dda1ff, %l7 = 00000000000000ff, %l7 = 00000000000000ff
	add	%i2,0x20,%g1
	casxa	[%g1]0x80,%l7,%l7	! %l7 = 74baca9853dda1ff
!	%f26 = 7e7b6ac6, Mem[0000000010181438] = 000040ff
	st	%f26,[%i6+0x038]	! Mem[0000000010181438] = 7e7b6ac6
!	Mem[0000000010081410] = 00000000, %l1 = 00000000bb878f9f, %asi = 80
	swapa	[%i2+0x010]%asi,%l1	! %l1 = 0000000000000000

p0_label_186:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c142e] = 0000006c, %l3 = 00000000000000ff, %asi = 80
	ldsha	[%i3+0x02e]%asi,%l3	! %l3 = 000000000000006c
!	Mem[0000000010001400] = ff000043 ffffffff, %l4 = 00000000, %l5 = 000000c2
	ldda	[%i0+%g0]0x80,%l4	! %l4 = 00000000ff000043 00000000ffffffff
	membar	#Sync			! Added by membar checker (31)
!	Mem[00000000300c1400] = 9ce4407c b9c01eba 43000000 00000000
!	Mem[00000000300c1410] = fff96823 00000023 be3b2c0a e0000000
!	Mem[00000000300c1420] = 000000ff 00000014 4d62fc40 68ede351
!	Mem[00000000300c1430] = 9ce4407c 670bf0ff ff000000 ffffffff
	ldda	[%i3+%g0]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	%l4 = ff000043, %l5 = ffffffff, Mem[00000000100c1400] = ffe98e5d 9aaf792b
	stda	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = ff000043 ffffffff
!	Mem[0000000010081410] = bb878f9f, %l7 = 74baca9853dda1ff
	ldsba	[%i2+%o5]0x80,%l7	! %l7 = ffffffffffffffbb
!	Mem[0000000010041431] = 172b9743, %l5 = 00000000ffffffff, %asi = 80
	ldsba	[%i1+0x031]%asi,%l5	! %l5 = 000000000000002b
!	Mem[00000000100c1428] = 00006d83, %l0 = 00000000000000ff, %asi = 80
	lduba	[%i3+0x028]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081410] = bd40b5d3, %l3 = 000000000000006c
	lduba	[%i2+%o5]0x89,%l3	! %l3 = 00000000000000d3
!	Mem[0000000020800000] = 40ff7110, %l4 = 00000000ff000043, %asi = 80
	lduha	[%o1+0x000]%asi,%l4	! %l4 = 00000000000040ff
!	Mem[0000000030141408] = 00000003, %l6 = 0000000000000043
	ldsba	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000003

p0_label_187:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 00000000, %l2 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000000
!	%l1 = 0000000000000000, Mem[00000000100c1400] = 430000ff
	stba	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = 43000000
!	%l7 = ffffffffffffffbb, imm = 0000000000000f00, %l6 = 0000000000000003
	or	%l7,0xf00,%l6		! %l6 = ffffffffffffffbb
!	%l2 = 0000000000000000, Mem[00000000100c1418] = ffffffff
	stw	%l2,[%i3+0x018]		! Mem[00000000100c1418] = 00000000
!	Mem[0000000030181410] = ffffffff, %l2 = 0000000000000000
	swapa	[%i6+%o5]0x89,%l2	! %l2 = 00000000ffffffff
!	%l1 = 0000000000000000, Mem[0000000030041410] = 28c70000
	stha	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = 28c70000
!	%l6 = ffffffffffffffbb, Mem[0000000010041400] = 00009ce4000000ff
	stxa	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = ffffffffffffffbb
!	Mem[0000000030181408] = ff0000ff, %l1 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l1	! %l1 = 00000000ff0000ff
!	%l3 = 00000000000000d3, Mem[0000000030001410] = ffffffffe00000ff
	stxa	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000000000d3
!	Mem[0000000030001400] = ffafffff, %l0 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l0	! %l0 = 00000000000000ff

p0_label_188:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081430] = 4d520000, %l7 = ffffffffffffffbb, %asi = 80
	ldswa	[%i2+0x030]%asi,%l7	! %l7 = 000000004d520000
!	Mem[0000000030141400] = 5fb540bd ff000000 03000000 000000e0
!	Mem[0000000030141410] = 836d14c2 ffcbd075 a3f8226c baa3002f
!	Mem[0000000030141420] = 5fb540bd 00000019 4d62fc40 68ede351
!	Mem[0000000030141430] = 4dcad2f3 08aa5668 92d5901f 92d5901f
	ldda	[%i5+%g0]ASI_BLK_AIUS,%f16	! Block Load from 0000000030141400
!	Mem[0000000010101420] = 00000000 00000000, %l6 = ffffffbb, %l7 = 4d520000
	ldd	[%i4+0x020],%l6		! %l6 = 0000000000000000 0000000000000000
!	Mem[00000000300c1408] = 00000043, %f6  = be3b2c0a
	lda	[%i3+%o4]0x89,%f6 	! %f6 = 00000043
!	Mem[0000000010101410] = 00e1bc7e, %l2 = 00000000ffffffff
	ldsba	[%i4+%o5]0x88,%l2	! %l2 = 000000000000007e
!	Mem[00000000100c1408] = 000000e0, %l0 = 00000000000000ff
	lduha	[%i3+%o4]0x88,%l0	! %l0 = 00000000000000e0
!	Mem[00000000300c1408] = 00000043, %l2 = 000000000000007e
	lduha	[%i3+%o4]0x89,%l2	! %l2 = 0000000000000043
!	Mem[0000000010141400] = ffcbd075c66a7b7e, %f14 = ff000000 ffffffff
	ldda	[%i5+%g0]0x88,%f14	! %f14 = ffcbd075 c66a7b7e
!	Mem[00000000100c1426] = d2a39c1d, %l2 = 0000000000000043
	lduh	[%i3+0x026],%l2		! %l2 = 0000000000009c1d
!	Mem[00000000300c1408] = 00000043, %l1 = 00000000ff0000ff
	ldswa	[%i3+%o4]0x89,%l1	! %l1 = 0000000000000043

p0_label_189:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 00000000, %l3 = 00000000000000d3
	swapa	[%i6+%o5]0x89,%l3	! %l3 = 0000000000000000
!	%l1 = 0000000000000043, Mem[0000000010101410] = 00e1bc7e
	stha	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = 00e10043
	membar	#Sync			! Added by membar checker (32)
!	%f2  = ffff0000 b9c01eba, Mem[0000000030141410] = c2146d83 75d0cbff
	stda	%f2 ,[%i5+%o5]0x89	! Mem[0000000030141410] = ffff0000 b9c01eba
!	%f19 = 000000e0, Mem[0000000030081408] = 7c40e49c
	sta	%f19,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000e0
!	%l3 = 0000000000000000, Mem[00000000201c0000] = 00009ee0
	stb	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 00009ee0
!	Mem[0000000030041410] = 0000c728, %l2 = 0000000000009c1d
	swapa	[%i1+%o5]0x81,%l2	! %l2 = 000000000000c728
!	%l6 = 0000000000000000, Mem[0000000030001400] = ffafffff
	stba	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = ffafff00
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030001400] = ffafff00 168e88e6
	stda	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 00000000
!	%f4  = 43f96823 00000023, %l1 = 0000000000000043
!	Mem[0000000010001438] = 43000000ffffffff
	add	%i0,0x038,%g1
	stda	%f4,[%g1+%l1]ASI_PST8_P ! Mem[0000000010001438] = 43f90000ffff0023
!	Mem[0000000030181410] = d3000000, %l2 = 000000000000c728
	swapa	[%i6+%o5]0x81,%l2	! %l2 = 00000000d3000000

p0_label_190:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800100] = ffffc060, %l2 = 00000000d3000000
	ldsh	[%o3+0x100],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010181400] = d3b540bd0000006c, %l4 = 00000000000040ff
	ldxa	[%i6+%g0]0x88,%l4	! %l4 = d3b540bd0000006c
!	Mem[0000000010141410] = 0000c728, %l0 = 00000000000000e0
	ldsba	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = c214ff00, %l2 = ffffffffffffffff
	ldsha	[%i0+%o4]0x88,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010041408] = 4c83ff7b, %l4 = d3b540bd0000006c
	lduwa	[%i1+%o4]0x88,%l4	! %l4 = 000000004c83ff7b
!	Mem[0000000010041408] = 7bff834c00000000, %f2  = ffff0000 b9c01eba
	ldda	[%i1+%o4]0x80,%f2 	! %f2  = 7bff834c 00000000
!	Mem[0000000030181408] = 00000000, %l0 = 0000000000000000
	lduba	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001410] = d3000000, %f1  = b9c01eba
	lda	[%i0+%o5]0x81,%f1 	! %f1 = d3000000
!	Mem[0000000030001410] = 000000d3, %l1 = 0000000000000043
	lduwa	[%i0+%o5]0x89,%l1	! %l1 = 00000000000000d3
!	Mem[00000000100c1400] = 00000043, %l5 = 000000000000002b
	lduha	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000000

p0_label_191:
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffff00, immd = fffff731, %y  = 80000000
	sdiv	%l2,-0x8cf,%l0		! %l0 = 000000007fffffff
	mov	%l0,%y			! %y = 7fffffff
!	Mem[0000000010181410] = 000000ff, %l6 = 0000000000000000
	swap	[%i6+%o5],%l6		! %l6 = 00000000000000ff
!	%f2  = 7bff834c, Mem[00000000300c1410] = fff96823
	sta	%f2 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 7bff834c
!	Mem[0000000010041400] = ffffffff, %l4 = 000000004c83ff7b
	swapa	[%i1+%g0]0x88,%l4	! %l4 = 00000000ffffffff
!	%f20 = 836d14c2 ffcbd075, Mem[00000000100c1400] = 00000043 ffffffff
	stda	%f20,[%i3+%g0]0x80	! Mem[00000000100c1400] = 836d14c2 ffcbd075
!	%l4 = ffffffff, %l5 = 00000000, Mem[0000000010041400] = 4c83ff7b bbffffff
	stda	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = ffffffff 00000000
!	%l0 = 000000007fffffff, Mem[0000000010101410] = 4300e100ab000000
	stxa	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000007fffffff
!	%l2 = ffffff00, %l3 = 00000000, Mem[0000000030041408] = 00000000 43f96823
	stda	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffff00 00000000
!	Mem[0000000010081410] = bb878f9f00000000, %l6 = 00000000000000ff, %l0 = 000000007fffffff
	add	%i2,0x10,%g1
	casxa	[%g1]0x80,%l6,%l0	! %l0 = bb878f9f00000000
!	%f26 = 4d62fc40, Mem[0000000030081410] = bd40b5d3
	sta	%f26,[%i2+%o5]0x89	! Mem[0000000030081410] = 4d62fc40

p0_label_192:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 836d14c2 ffcbd075, %l2 = ffffff00, %l3 = 00000000
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 00000000836d14c2 00000000ffcbd075
!	Mem[0000000030041400] = 00000000, %l2 = 00000000836d14c2
	ldswa	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001408] = 094f9b14 000000ff, %l2 = 00000000, %l3 = ffcbd075
	ldda	[%i0+%o4]0x89,%l2	! %l2 = 00000000000000ff 00000000094f9b14
!	Mem[0000000010041400] = ffffffff, %f13 = 670bf0ff
	lda	[%i1+%g0]0x88,%f13	! %f13 = ffffffff
!	Mem[0000000010181410] = 00000000 00000014, %l0 = 00000000, %l1 = 000000d3
	ldd	[%i6+%o5],%l0		! %l0 = 0000000000000000 0000000000000014
!	%l1 = 0000000000000014, %l6 = 00000000000000ff, %y  = 7fffffff
	smul	%l1,%l6,%l0		! %l0 = 00000000000013ec, %y = 00000000
!	Mem[00000000201c0000] = 00009ee0, %l2 = 00000000000000ff, %asi = 80
	ldsba	[%o0+0x000]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141408] = 00ff14c2, %f1  = d3000000
	lda	[%i5+%o4]0x80,%f1 	! %f1 = 00ff14c2
!	%l3 = 00000000094f9b14, %l3 = 00000000094f9b14, %l4 = 00000000ffffffff
	andn	%l3,%l3,%l4		! %l4 = 0000000000000000
!	Mem[0000000010001410] = ff006d83, %f20 = 836d14c2
	lda	[%i0+%o5]0x80,%f20	! %f20 = ff006d83

p0_label_193:
!	Starting 10 instruction Store Burst
!	%l0 = 000013ec, %l1 = 00000014, Mem[0000000010141400] = 7e7b6ac6 75d0cbff
	stda	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 000013ec 00000014
!	Mem[0000000010041410] = af000000, %l6 = 00000000000000ff
	ldstuba	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000030101410] = 9ce4407c
	stwa	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	%f22 = a3f8226c, Mem[000000001000143c] = ffff0023
	st	%f22,[%i0+0x03c]	! Mem[000000001000143c] = a3f8226c
!	Mem[0000000010141400] = 000013ec, %l0 = 00000000000013ec
	swapa	[%i5+%g0]0x80,%l0	! %l0 = 00000000000013ec
!	Mem[0000000010001400] = ff000043, %l7 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 00000000ff000043
!	Mem[0000000030101400] = 00ff14c2, %l4 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l4	! %l4 = 00000000000000c2
!	Mem[00000000300c1410] = 4c83ff7b, %l2 = 0000000000000000
	swapa	[%i3+%o5]0x89,%l2	! %l2 = 000000004c83ff7b
!	Mem[0000000010041418] = 6ba86f1a00ff0000, %l0 = 00000000000013ec, %l6 = 0000000000000000
	add	%i1,0x18,%g1
	casxa	[%g1]0x80,%l0,%l6	! %l6 = 6ba86f1a00ff0000
!	Mem[0000000010141408] = c214ff00, %l1 = 0000000000000014
	swapa	[%i5+%o4]0x88,%l1	! %l1 = 00000000c214ff00

p0_label_194:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001418] = 4a000000, %f13 = ffffffff
	ld	[%i0+0x018],%f13	! %f13 = 4a000000
!	Mem[0000000030001400] = 00000000, %l3 = 00000000094f9b14
	lduba	[%i0+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101428] = 0000ffff 44ee2c81, %l2 = 4c83ff7b, %l3 = 00000000, %asi = 80
	ldda	[%i4+0x028]%asi,%l2	! %l2 = 000000000000ffff 0000000044ee2c81
!	Mem[0000000010041410] = af0000ff, %l3 = 0000000044ee2c81
	lduwa	[%i1+%o5]0x88,%l3	! %l3 = 00000000af0000ff
!	Mem[0000000010001410] = ff006d83, %f12 = 9ce4407c
	lda	[%i0+%o5]0x80,%f12	! %f12 = ff006d83
!	Mem[0000000010001410] = ff006d83, %l4 = 00000000000000c2
	ldswa	[%i0+%o5]0x80,%l4	! %l4 = ffffffffff006d83
!	Mem[0000000010001410] = ff006d83 670bf0ff, %l4 = ff006d83, %l5 = 00000000, %asi = 80
	ldda	[%i0+0x010]%asi,%l4	! %l4 = 00000000ff006d83 00000000670bf0ff
!	Mem[0000000010001410] = ff006d83, %l5 = 00000000670bf0ff
	lduba	[%i0+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030041408] = 00ffffff, %l5 = 00000000000000ff
	ldswa	[%i1+%o4]0x81,%l5	! %l5 = 0000000000ffffff
!	Mem[00000000100c1408] = 000000e0, %l6 = 6ba86f1a00ff0000
	ldsba	[%i3+%o4]0x88,%l6	! %l6 = ffffffffffffffe0

p0_label_195:
!	Starting 10 instruction Store Burst
!	%l2 = 000000000000ffff, Mem[0000000010081414] = 00000000
	stw	%l2,[%i2+0x014]		! Mem[0000000010081414] = 0000ffff
!	Mem[0000000010041410] = ff0000af, %l4 = 00000000ff006d83
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 00000000ff0000af
!	%l2 = 000000000000ffff, Mem[0000000030041410] = 00009c1d75d0cbff
	stxa	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000000000ffff
!	%f26 = 4d62fc40 68ede351, %l3 = 00000000af0000ff
!	Mem[0000000030181400] = 00007e7b00000000
	stda	%f26,[%i6+%l3]ASI_PST16_S ! Mem[0000000030181400] = 4d62fc4068ede351
!	Mem[0000000010141438] = ffffffff, %l6 = 00000000ffffffe0, %asi = 80
	swapa	[%i5+0x038]%asi,%l6	! %l6 = 00000000ffffffff
!	%l4 = 00000000ff0000af, %l3 = 00000000af0000ff, %l4 = 00000000ff0000af
	subc	%l4,%l3,%l4		! %l4 = 000000004fffffb0
!	Mem[0000000030101410] = 00000000, %l7 = 00000000ff000043
	ldstuba	[%i4+%o5]0x81,%l7	! %l7 = 0000000000000000
!	%l7 = 0000000000000000, Mem[00000000211c0001] = b55f8970
	stb	%l7,[%o2+0x001]		! Mem[00000000211c0000] = b5008970
!	%l0 = 000013ec, %l1 = c214ff00, Mem[00000000300c1400] = 9ce4407c b9c01eba
	stda	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000013ec c214ff00
!	Mem[000000001018143c] = 513a4fa5, %l2 = 000000000000ffff
	swap	[%i6+0x03c],%l2		! %l2 = 00000000513a4fa5

p0_label_196:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 0000ff6b, %l4 = 000000004fffffb0
	ldsba	[%i2+%g0]0x88,%l4	! %l4 = 000000000000006b
!	Mem[0000000030141410] = ffff0000b9c01eba, %f26 = 4d62fc40 68ede351
	ldda	[%i5+%o5]0x89,%f26	! %f26 = ffff0000 b9c01eba
!	Mem[0000000010041438] = 00000042 ffffffff, %l6 = ffffffff, %l7 = 00000000
	ldd	[%i1+0x038],%l6		! %l6 = 0000000000000042 00000000ffffffff
!	Mem[0000000030141400] = 5fb540bd, %l5 = 0000000000ffffff
	lduha	[%i5+%g0]0x81,%l5	! %l5 = 0000000000005fb5
!	Mem[0000000010181408] = 9ce4407c, %l6 = 0000000000000042
	lduba	[%i6+%o4]0x88,%l6	! %l6 = 000000000000007c
!	Mem[0000000030181408] = 0000000000e1bcc9, %l7 = 00000000ffffffff
	ldxa	[%i6+%o4]0x81,%l7	! %l7 = 0000000000e1bcc9
!	Mem[0000000030181400] = 4d62fc4068ede351, %f24 = 5fb540bd 00000019
	ldda	[%i6+%g0]0x81,%f24	! %f24 = 4d62fc40 68ede351
!	Mem[0000000010141430] = 6c000000, %l5 = 0000000000005fb5
	ldsb	[%i5+0x030],%l5		! %l5 = 000000000000006c
!	Mem[0000000030101408] = 2b79af9a, %l3 = 00000000af0000ff
	ldsha	[%i4+%o4]0x89,%l3	! %l3 = ffffffffffffaf9a
	membar	#Sync			! Added by membar checker (33)
!	Mem[0000000010041400] = ffffffff 00000000 7bff834c 00000000
!	Mem[0000000010041410] = ff006d83 00000023 6ba86f1a 00ff0000
!	Mem[0000000010041420] = 69b514c2 00000000 ffffffff ffff9ce4
!	Mem[0000000010041430] = 172b9743 000000ff 00000042 ffffffff
	ldda	[%i1+%g0]ASI_BLK_AIUPL,%f0 	! Block Load from 0000000010041400

p0_label_197:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 4d62fc40, %l3 = 00000000ffffaf9a
	swapa	[%i2+%o5]0x89,%l3	! %l3 = 000000004d62fc40
!	%l2 = 00000000513a4fa5, Mem[0000000010001408] = 00ff14c200000000
	stxa	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000513a4fa5
!	%l5 = 000000000000006c, Mem[0000000030081410] = 9aafffff
	stha	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = 006cffff
!	%l5 = 000000000000006c, Mem[0000000010141408] = 14000000
	stba	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 6c000000
!	%f12 = ff000000 43972b17, %l1 = 00000000c214ff00
!	Mem[0000000010101420] = 0000000000000000
	add	%i4,0x020,%g1
	stda	%f12,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010101420] = 0000000000000000
!	%f2  = 00000000, %f28 = 4dcad2f3
	fcmpes	%fcc0,%f2 ,%f28		! %fcc0 = 1
!	%f12 = ff000000 43972b17, Mem[0000000010181408] = 7c40e49c 5fb540bd
	stda	%f12,[%i6+%o4]0x80	! Mem[0000000010181408] = ff000000 43972b17
!	%f0  = 00000000 ffffffff, %l3 = 000000004d62fc40
!	Mem[0000000010181438] = 7e7b6ac60000ffff
	add	%i6,0x038,%g1
	stda	%f0,[%g1+%l3]ASI_PST8_P ! Mem[0000000010181438] = 7e006ac60000ffff
!	%f5  = 836d00ff, Mem[0000000030181400] = 40fc624d
	sta	%f5 ,[%i6+%g0]0x89	! Mem[0000000030181400] = 836d00ff
!	%l4 = 000000000000006b, Mem[0000000030081408] = e0000000
	stha	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 006b0000

p0_label_198:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00000000, %l3 = 000000004d62fc40
	lduha	[%i4+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l4 = 000000000000006b
	lduha	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041408] = ffffff00, %l3 = 0000000000000000
	lduba	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101400] = 00ff14ff, %l1 = 00000000c214ff00
	lduha	[%i4+%g0]0x89,%l1	! %l1 = 00000000000014ff
!	Mem[0000000030141410] = ba1ec0b9, %f31 = 92d5901f
	lda	[%i5+%o5]0x81,%f31	! %f31 = ba1ec0b9
!	Mem[0000000030041400] = 00000000, %l3 = 0000000000000000
	ldsba	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l2 = 00000000513a4fa5
	ldsha	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001400] = 00000000 ffffffff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000 00000000ffffffff
!	Mem[00000000100c141a] = 00000000, %l3 = 00000000ffffffff
	ldstuba	[%i3+0x01a]%asi,%l3	! %l3 = 0000000000000000
!	Mem[000000001004142c] = ffff9ce4, %f22 = a3f8226c
	lda	[%i1+0x02c]%asi,%f22	! %f22 = ffff9ce4

p0_label_199:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 6bff0000, %l5 = 000000000000006c
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 000000000000006b
!	Mem[0000000010181408] = ff000000, %l0 = 00000000000013ec
	ldstuba	[%i6+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	%f24 = 4d62fc40 68ede351, %l5 = 000000000000006b
!	Mem[00000000100c1410] = ff0000e0e0000000
	add	%i3,0x010,%g1
	stda	%f24,[%g1+%l5]ASI_PST32_P ! Mem[00000000100c1410] = 4d62fc4068ede351
!	%l7 = 0000000000e1bcc9, Mem[00000000100c142e] = 0000006c, %asi = 80
	stba	%l7,[%i3+0x02e]%asi	! Mem[00000000100c142c] = 0000c96c
!	%f4  = 23000000 836d00ff, Mem[00000000300c1410] = 00000000 00000023
	stda	%f4 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 23000000 836d00ff
!	%l2 = 0000000000000000, Mem[0000000010181408] = ff000000
	stba	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000
!	%l6 = 0000007c, %l7 = 00e1bcc9, Mem[0000000010081400] = 0000ffff 7c40e49c
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000007c 00e1bcc9
!	%l0 = 00000000000000ff, Mem[0000000010181400] = 0000006c
	stba	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff
!	Mem[0000000010041408] = 4c83ff7b, %l2 = 0000000000000000
	swapa	[%i1+%o4]0x88,%l2	! %l2 = 000000004c83ff7b
!	Mem[0000000021800100] = ffffc060, %l3 = 0000000000000000
	ldstub	[%o3+0x100],%l3		! %l3 = 00000000000000ff

p0_label_200:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000, %f23 = baa3002f
	lda	[%i4+%o5]0x80,%f23	! %f23 = 00000000
!	Mem[00000000100c1410] = 40fc624d, %l6 = 000000000000007c
	ldsha	[%i3+%o5]0x88,%l6	! %l6 = 000000000000624d
!	Mem[0000000010041400] = ffffffff, %f18 = 03000000
	lda	[%i1+%g0]0x88,%f18	! %f18 = ffffffff
!	Mem[00000000100c1410] = 51e3ed6840fc624d, %l0 = 00000000000000ff
	ldxa	[%i3+%o5]0x88,%l0	! %l0 = 51e3ed6840fc624d
	membar	#Sync			! Added by membar checker (34)
!	Mem[0000000010041400] = ffffffff 00000000 00000000 00000000
!	Mem[0000000010041410] = ff006d83 00000023 6ba86f1a 00ff0000
!	Mem[0000000010041420] = 69b514c2 00000000 ffffffff ffff9ce4
!	Mem[0000000010041430] = 172b9743 000000ff 00000042 ffffffff
	ldda	[%i1+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	%l1 = 00000000000014ff, %l1 = 00000000000014ff, %l5  = 000000000000006b
	mulx	%l1,%l1,%l5		! %l5 = 0000000001b8d601
!	Mem[00000000201c0001] = 00009ee0, %l7 = 0000000000e1bcc9
	ldub	[%o0+0x001],%l7		! %l7 = 0000000000000000
!	Mem[00000000300c1410] = 23000000, %l0 = 51e3ed6840fc624d
	ldswa	[%i3+%o5]0x81,%l0	! %l0 = 0000000023000000
!	Mem[00000000300c1400] = 00ff14c2ec130000, %f0  = 00000000 ffffffff
	ldda	[%i3+%g0]0x89,%f0 	! %f0  = 00ff14c2 ec130000
!	Mem[0000000010101408] = 00000000, %l7 = 0000000000000000
	ldsba	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000

!	End of Random Code for Thread 0

1:	membar	#Sync			! Force all stores to complete


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 0000000023000000
	bne	%xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 00000000000014ff
	bne	%xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 000000004c83ff7b
	bne	%xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 00000000000000ff
	bne	%xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000000000
	bne	%xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000001b8d601
	bne	%xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 000000000000624d
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
	cmp	%l0,%l1			! %f0  should be 00ff14c2 ec130000
	bne	%xcc,p0_freg_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00000000 4c83ff7b
	bne	%xcc,p0_freg_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 23000000 836d00ff
	bne	%xcc,p0_freg_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 0000ff00 1a6fa86b
	bne	%xcc,p0_freg_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000000 c214b569
	bne	%xcc,p0_freg_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be e49cffff ffffffff
	bne	%xcc,p0_freg_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be ff000000 43972b17
	bne	%xcc,p0_freg_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be ffffffff 42000000
	bne	%xcc,p0_freg_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be ffffffff 00000000
	bne	%xcc,p0_freg_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00000000 00000000
	bne	%xcc,p0_freg_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be ff006d83 00000023
	bne	%xcc,p0_freg_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 6ba86f1a 00ff0000
	bne	%xcc,p0_freg_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 69b514c2 00000000
	bne	%xcc,p0_freg_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be ffffffff ffff9ce4
	bne	%xcc,p0_freg_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 172b9743 000000ff
	bne	%xcc,p0_freg_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 00000042 ffffffff
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
	ldx	[%g1+0x000],%l0		! %l0 = d9f714a2f1d2b7ae
	ldx	[%g1+0x008],%l1		! %l1 = 5561e372c9717559
	ldx	[%g1+0x010],%l2		! %l2 = 681797ca83e55f14
	ldx	[%g1+0x018],%l3		! %l3 = 7637c2fd31a3f7df
	ldx	[%g1+0x020],%l4		! %l4 = ce25ff9249a752ba
	ldx	[%g1+0x028],%l5		! %l5 = eceb0ffea98912a5
	ldx	[%g1+0x030],%l6		! %l6 = 023cf423f6ad6aa0
	ldx	[%g1+0x038],%l7		! %l7 = e7d88329d37e1dab

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
	jmpl	%o7,%g0
	subc	%l0,%l2,%l1
	jmpl	%o7,%g0
	nop
p0_near_0_he:
	fdivs	%f19,%f16,%f22
	fcmps	%fcc2,%f20,%f17
	fdivs	%f29,%f23,%f25
	and	%l4,0x75c,%l0
	jmpl	%o7,%g0
	sub	%l3,%l0,%l4
p0_near_0_lo:
	jmpl	%o7,%g0
	subc	%l0,%l2,%l1
	jmpl	%o7,%g0
	nop
p0_near_0_ho:
	fdivs	%f19,%f16,%f22
	fcmps	%fcc2,%f20,%f17
	fdivs	%f29,%f23,%f25
	and	%l4,0x75c,%l0
	jmpl	%o7,%g0
	sub	%l3,%l0,%l4
near0_b2b_h:
	jmpl	%o7,%g0
	xnor	%l0,%l4,%l3
	jmpl	%o7,%g0
	nop
near0_b2b_l:
	jmpl	%o7,%g0
	and	%l5,%l7,%l7
	jmpl	%o7,%g0
	nop
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
	fadds	%f3 ,%f2 ,%f6 
	fsubs	%f0 ,%f2 ,%f13
	lduh	[%o2+0x000],%l0		! Mem[00000000211c0000]
	mulx	%l1,%l2,%l2
	add	%l0,-0xa8a,%l5
	fadds	%f13,%f8 ,%f7 
	sdivx	%l3,%l0,%l1
	jmpl	%o7,%g0
	fadds	%f0 ,%f2 ,%f14
p0_near_1_he:
	xor	%l2,0x504,%l5
	orn	%l0,%l2,%l0
	udivx	%l5,%l6,%l4
	umul	%l7,-0x958,%l0
	fmuls	%f18,%f24,%f24
	smul	%l2,%l4,%l6
	jmpl	%o7,%g0
	fadds	%f18,%f16,%f29
p0_near_1_lo:
	fadds	%f3 ,%f2 ,%f6 
	fsubs	%f0 ,%f2 ,%f13
	lduh	[%i2+0x000],%l0		! Mem[00000000211c0000]
	mulx	%l1,%l2,%l2
	add	%l0,-0xa8a,%l5
	fadds	%f13,%f8 ,%f7 
	sdivx	%l3,%l0,%l1
	jmpl	%o7,%g0
	fadds	%f0 ,%f2 ,%f14
p0_near_1_ho:
	xor	%l2,0x504,%l5
	orn	%l0,%l2,%l0
	udivx	%l5,%l6,%l4
	umul	%l7,-0x958,%l0
	fmuls	%f18,%f24,%f24
	smul	%l2,%l4,%l6
	jmpl	%o7,%g0
	fadds	%f18,%f16,%f29
near1_b2b_h:
	addc	%l1,%l7,%l5
	jmpl	%o7,%g0
	subc	%l2,-0x466,%l4
near1_b2b_l:
	fadds	%f12,%f10,%f11
	jmpl	%o7,%g0
	or	%l5,%l2,%l1
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
	fsubs	%f13,%f1 ,%f14
	xor	%l7,0xf4e,%l3
	orn	%l6,-0x551,%l6
	fsqrts	%f5 ,%f5 
	jmpl	%o7,%g0
	fsqrts	%f9 ,%f1 
p0_near_2_he:
	add	%l0,%l5,%l3
	sub	%l0,%l3,%l0
	andn	%l7,%l2,%l2
	subc	%l6,0x4c1,%l1
	std	%f18,[%i3+0x030]	! Mem[00000000100c1430]
	mulx	%l4,%l1,%l0
	jmpl	%o7,%g0
	subc	%l7,0x44d,%l2
p0_near_2_lo:
	fsubs	%f13,%f1 ,%f14
	xor	%l7,0xf4e,%l3
	orn	%l6,-0x551,%l6
	fsqrts	%f5 ,%f5 
	jmpl	%o7,%g0
	fsqrts	%f9 ,%f1 
p0_near_2_ho:
	add	%l0,%l5,%l3
	sub	%l0,%l3,%l0
	andn	%l7,%l2,%l2
	subc	%l6,0x4c1,%l1
	std	%f18,[%o3+0x030]	! Mem[00000000100c1430]
	mulx	%l4,%l1,%l0
	jmpl	%o7,%g0
	subc	%l7,0x44d,%l2
near2_b2b_h:
	orn	%l5,%l1,%l6
	fdivs	%f26,%f18,%f30
	fdivs	%f31,%f18,%f29
	fsubs	%f28,%f26,%f20
	fsubs	%f20,%f16,%f19
	mulx	%l2,%l6,%l6
	jmpl	%o7,%g0
	fsubs	%f28,%f24,%f23
near2_b2b_l:
	mulx	%l4,%l4,%l5
	smul	%l7,-0x56f,%l4
	xnor	%l1,%l6,%l0
	mulx	%l1,%l7,%l6
	sub	%l5,%l7,%l3
	fstoi	%f12,%f3 
	jmpl	%o7,%g0
	and	%l5,-0x27f,%l3
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
	umul	%l2,%l6,%l2
	sub	%l5,0x4cc,%l5
	fsqrts	%f4 ,%f13
	sub	%l4,0xe94,%l7
	jmpl	%o7,%g0
	orn	%l5,0xbf6,%l6
p0_near_3_he:
	sdivx	%l6,0x570,%l0
	fdivs	%f25,%f17,%f30
	xor	%l7,-0x033,%l3
	xor	%l4,0xf92,%l6
	fcmps	%fcc0,%f24,%f21
	or	%l1,-0x189,%l1
	umul	%l3,%l0,%l6
	jmpl	%o7,%g0
	fdivs	%f24,%f24,%f27
p0_near_3_lo:
	umul	%l2,%l6,%l2
	sub	%l5,0x4cc,%l5
	fsqrts	%f4 ,%f13
	sub	%l4,0xe94,%l7
	jmpl	%o7,%g0
	orn	%l5,0xbf6,%l6
p0_near_3_ho:
	sdivx	%l6,0x570,%l0
	fdivs	%f25,%f17,%f30
	xor	%l7,-0x033,%l3
	xor	%l4,0xf92,%l6
	fcmps	%fcc0,%f24,%f21
	or	%l1,-0x189,%l1
	umul	%l3,%l0,%l6
	jmpl	%o7,%g0
	fdivs	%f24,%f24,%f27
near3_b2b_h:
	xor	%l4,%l3,%l7
	jmpl	%o7,%g0
	xor	%l1,%l0,%l6
near3_b2b_l:
	fcmps	%fcc2,%f2 ,%f0 
	jmpl	%o7,%g0
	subc	%l0,0x812,%l4
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
	ldub	[%o3+0x000],%l1		! Mem[0000000021800000]
	mulx	%l5,0x07e,%l6
	fitos	%f15,%f15
	smul	%l2,-0xe84,%l6
	fsubs	%f8 ,%f15,%f1 
	fcmps	%fcc1,%f13,%f2 
	st	%f7 ,[%i6+0x020]	! Mem[0000000010181420]
	jmpl	%o7,%g0
	subc	%l3,%l7,%l5
p0_far_0_he:
	fsubs	%f18,%f20,%f24
	jmpl	%o7,%g0
	fmuls	%f23,%f24,%f23
p0_far_0_lo:
	ldub	[%i3+0x000],%l1		! Mem[0000000021800000]
	mulx	%l5,0x07e,%l6
	fitos	%f15,%f15
	smul	%l2,-0xe84,%l6
	fsubs	%f8 ,%f15,%f1 
	fcmps	%fcc1,%f13,%f2 
	st	%f7 ,[%o6+0x020]	! Mem[0000000010181420]
	jmpl	%o7,%g0
	subc	%l3,%l7,%l5
p0_far_0_ho:
	fsubs	%f18,%f20,%f24
	jmpl	%o7,%g0
	fmuls	%f23,%f24,%f23
far0_b2b_h:
	smul	%l1,%l0,%l4
	fdivs	%f31,%f26,%f22
	xnor	%l7,-0x406,%l1
	fitos	%f30,%f19
	xnor	%l5,%l5,%l7
	jmpl	%o7,%g0
	fmuls	%f24,%f19,%f28
far0_b2b_l:
	fadds	%f8 ,%f11,%f4 
	fdivs	%f7 ,%f2 ,%f5 
	smul	%l6,0x476,%l6
	and	%l4,-0x7b7,%l0
	fdivs	%f9 ,%f12,%f1 
	jmpl	%o7,%g0
	addc	%l7,%l7,%l5
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
	sdivx	%l4,0xcf5,%l7
	fsubs	%f1 ,%f12,%f1 
	swap	[%i0+0x000],%l4		! Mem[0000000010001400]
	jmpl	%o7,%g0
	and	%l7,%l5,%l6
p0_far_1_he:
	umul	%l5,%l0,%l3
	and	%l0,-0xd1f,%l7
	andn	%l0,%l3,%l2
	mulx	%l5,-0x564,%l0
	jmpl	%o7,%g0
	smul	%l5,%l3,%l0
p0_far_1_lo:
	sdivx	%l4,0xcf5,%l7
	fsubs	%f1 ,%f12,%f1 
	swap	[%o0+0x000],%l4		! Mem[0000000010001400]
	jmpl	%o7,%g0
	and	%l7,%l5,%l6
p0_far_1_ho:
	umul	%l5,%l0,%l3
	and	%l0,-0xd1f,%l7
	andn	%l0,%l3,%l2
	mulx	%l5,-0x564,%l0
	jmpl	%o7,%g0
	smul	%l5,%l3,%l0
far1_b2b_h:
	add	%l3,-0x282,%l7
	xnor	%l7,0x289,%l5
	subc	%l2,%l5,%l4
	sdivx	%l4,0x6b0,%l1
	jmpl	%o7,%g0
	fmuls	%f20,%f31,%f17
far1_b2b_l:
	andn	%l7,-0x8c3,%l4
	fsubs	%f3 ,%f6 ,%f7 
	fsubs	%f2 ,%f3 ,%f8 
	orn	%l7,0x0bf,%l7
	jmpl	%o7,%g0
	xor	%l1,0x23e,%l3
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
	addc	%l6,-0x1c4,%l6
	jmpl	%o7,%g0
	nop
p0_far_2_he:
	fcmps	%fcc0,%f27,%f24
	or	%l2,-0x4e7,%l5
	add	%l4,%l5,%l3
	umul	%l7,0x08c,%l2
	fcmps	%fcc3,%f30,%f21
	xor	%l3,%l7,%l7
	jmpl	%o7,%g0
	umul	%l5,0x1e1,%l1
p0_far_2_lo:
	jmpl	%o7,%g0
	addc	%l6,-0x1c4,%l6
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
p0_far_2_ho:
	fcmps	%fcc0,%f27,%f24
	or	%l2,-0x4e7,%l5
	add	%l4,%l5,%l3
	umul	%l7,0x08c,%l2
	fcmps	%fcc3,%f30,%f21
	xor	%l3,%l7,%l7
	jmpl	%o7,%g0
	umul	%l5,0x1e1,%l1
far2_b2b_h:
	xor	%l6,%l6,%l5
	sub	%l5,%l5,%l2
	jmpl	%o7,%g0
	fsubs	%f26,%f16,%f16
far2_b2b_l:
	sub	%l1,-0x8cb,%l3
	fsqrts	%f3 ,%f5 
	jmpl	%o7,%g0
	fsqrts	%f1 ,%f14
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
	subc	%l4,0xe66,%l2
	xnor	%l0,%l6,%l4
	jmpl	%o7,%g0
	orn	%l4,0x3b4,%l4
p0_far_3_he:
	add	%l5,0xc96,%l3
	fcmps	%fcc1,%f20,%f31
	udivx	%l0,0x618,%l5
	ldd	[%i3+0x000],%f30	! Mem[00000000100c1400]
	sub	%l1,%l0,%l2
	jmpl	%o7,%g0
	mulx	%l2,%l3,%l6
p0_far_3_lo:
	subc	%l4,0xe66,%l2
	xnor	%l0,%l6,%l4
	jmpl	%o7,%g0
	orn	%l4,0x3b4,%l4
p0_far_3_ho:
	add	%l5,0xc96,%l3
	fcmps	%fcc1,%f20,%f31
	udivx	%l0,0x618,%l5
	ldd	[%o3+0x000],%f30	! Mem[00000000100c1400]
	sub	%l1,%l0,%l2
	jmpl	%o7,%g0
	mulx	%l2,%l3,%l6
far3_b2b_h:
	jmpl	%o7,%g0
	addc	%l2,-0xe9e,%l6
	jmpl	%o7,%g0
	nop
far3_b2b_l:
	jmpl	%o7,%g0
	fcmps	%fcc1,%f15,%f2 
	jmpl	%o7,%g0
	nop
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	.skip	16
p0_jmpl_0_le:
	jmpl	%g6+8,%g0
	fmuls	%f8 ,%f9 ,%f10
p0_call_0_le:
	xnor	%l3,0x4b6,%l0
	smul	%l1,%l1,%l6
	fmuls	%f3 ,%f3 ,%f14
	sub	%l0,-0x79a,%l2
	retl
	addc	%l3,0x0f7,%l4
p0_jmpl_0_lo:
	jmpl	%g6+8,%g0
	fmuls	%f8 ,%f9 ,%f10
p0_call_0_lo:
	xnor	%l3,0x4b6,%l0
	smul	%l1,%l1,%l6
	fmuls	%f3 ,%f3 ,%f14
	sub	%l0,-0x79a,%l2
	retl
	addc	%l3,0x0f7,%l4
p0_jmpl_0_he:
	or	%l7,0x2de,%l2
	umul	%l6,-0x8fa,%l5
	sub	%l5,%l7,%l2
	xor	%l3,-0xb0c,%l6
	andn	%l5,-0x13c,%l6
	jmpl	%g6+8,%g0
	xnor	%l0,%l7,%l5
p0_call_0_he:
	sdivx	%l4,%l4,%l6
	umul	%l2,%l7,%l5
	swap	[%i1+0x014],%l3		! Mem[0000000010041414]
	addc	%l0,-0x653,%l2
	fsqrts	%f18,%f16
	retl
	or	%l6,-0x2bb,%l4
p0_jmpl_0_ho:
	or	%l7,0x2de,%l2
	umul	%l6,-0x8fa,%l5
	sub	%l5,%l7,%l2
	xor	%l3,-0xb0c,%l6
	andn	%l5,-0x13c,%l6
	jmpl	%g6+8,%g0
	xnor	%l0,%l7,%l5
p0_call_0_ho:
	sdivx	%l4,%l4,%l6
	umul	%l2,%l7,%l5
	swap	[%o1+0x014],%l3		! Mem[0000000010041414]
	addc	%l0,-0x653,%l2
	fsqrts	%f18,%f16
	retl
	or	%l6,-0x2bb,%l4
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	.skip	32
p0_jmpl_1_le:
	xnor	%l1,%l7,%l5
	fdivs	%f1 ,%f9 ,%f14
	jmpl	%g6+8,%g0
	andn	%l5,0x088,%l3
p0_call_1_le:
	sdivx	%l1,0xbbd,%l3
	fcmps	%fcc3,%f13,%f8 
	retl
	mulx	%l2,%l3,%l5
p0_jmpl_1_lo:
	xnor	%l1,%l7,%l5
	fdivs	%f1 ,%f9 ,%f14
	jmpl	%g6+8,%g0
	andn	%l5,0x088,%l3
p0_call_1_lo:
	sdivx	%l1,0xbbd,%l3
	fcmps	%fcc3,%f13,%f8 
	retl
	mulx	%l2,%l3,%l5
p0_jmpl_1_he:
	jmpl	%g6+8,%g0
	subc	%l3,0xaa9,%l3
p0_call_1_he:
	retl
	andn	%l6,-0x895,%l1
p0_jmpl_1_ho:
	jmpl	%g6+8,%g0
	subc	%l3,0xaa9,%l3
p0_call_1_ho:
	retl
	andn	%l6,-0x895,%l1
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	.skip	48
p0_jmpl_2_le:
	udivx	%l4,%l7,%l5
	std	%f12,[%i0+0x020]	! Mem[0000000010001420]
	jmpl	%g6+8,%g0
	andn	%l1,-0x03b,%l0
p0_call_2_le:
	andn	%l1,%l4,%l1
	or	%l7,%l6,%l2
	udivx	%l0,0x0f8,%l4
	fmuls	%f11,%f4 ,%f5 
	add	%l1,%l3,%l7
	xnor	%l6,%l7,%l3
	std	%f6 ,[%i6+%o5]		! Mem[0000000010181410]
	retl
	andn	%l1,%l7,%l3
p0_jmpl_2_lo:
	udivx	%l4,%l7,%l5
	std	%f12,[%o0+0x020]	! Mem[0000000010001420]
	jmpl	%g6+8,%g0
	andn	%l1,-0x03b,%l0
p0_call_2_lo:
	andn	%l1,%l4,%l1
	or	%l7,%l6,%l2
	udivx	%l0,0x0f8,%l4
	fmuls	%f11,%f4 ,%f5 
	add	%l1,%l3,%l7
	xnor	%l6,%l7,%l3
	std	%f6 ,[%o6+%i5]		! Mem[0000000010181410]
	retl
	andn	%l1,%l7,%l3
p0_jmpl_2_he:
	fsubs	%f21,%f24,%f22
	jmpl	%g6+8,%g0
	ldd	[%i0+0x028],%f16	! Mem[0000000010001428]
p0_call_2_he:
	fcmps	%fcc0,%f21,%f29
	andn	%l1,%l2,%l3
	or	%l2,%l5,%l1
	fsubs	%f24,%f19,%f30
	or	%l5,%l2,%l0
	retl
	subc	%l4,%l1,%l5
p0_jmpl_2_ho:
	fsubs	%f21,%f24,%f22
	jmpl	%g6+8,%g0
	ldd	[%o0+0x028],%f16	! Mem[0000000010001428]
p0_call_2_ho:
	fcmps	%fcc0,%f21,%f29
	andn	%l1,%l2,%l3
	or	%l2,%l5,%l1
	fsubs	%f24,%f19,%f30
	or	%l5,%l2,%l0
	retl
	subc	%l4,%l1,%l5
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	.skip	64
p0_jmpl_3_le:
	fsubs	%f15,%f5 ,%f12
	and	%l0,-0x167,%l5
	xnor	%l7,%l7,%l5
	xnor	%l7,%l0,%l2
	sdivx	%l7,%l0,%l1
	xnor	%l1,0x0e9,%l1
	jmpl	%g6+8,%g0
	or	%l7,-0x3de,%l6
p0_call_3_le:
	andn	%l3,%l7,%l7
	retl
	ldd	[%i4+0x038],%f10	! Mem[0000000010101438]
p0_jmpl_3_lo:
	fsubs	%f15,%f5 ,%f12
	and	%l0,-0x167,%l5
	xnor	%l7,%l7,%l5
	xnor	%l7,%l0,%l2
	sdivx	%l7,%l0,%l1
	xnor	%l1,0x0e9,%l1
	jmpl	%g6+8,%g0
	or	%l7,-0x3de,%l6
p0_call_3_lo:
	andn	%l3,%l7,%l7
	retl
	ldd	[%o4+0x038],%f10	! Mem[0000000010101438]
p0_jmpl_3_he:
	fmuls	%f17,%f29,%f20
	fmuls	%f19,%f25,%f23
	addc	%l6,0x10a,%l6
	xnor	%l6,0xec7,%l6
	addc	%l2,-0xe61,%l1
	jmpl	%g6+8,%g0
	or	%l5,-0x1e2,%l3
p0_call_3_he:
	andn	%l1,-0xd70,%l7
	ld	[%i5+0x03c],%f21	! Mem[000000001014143c]
	retl
	umul	%l6,%l5,%l3
p0_jmpl_3_ho:
	fmuls	%f17,%f29,%f20
	fmuls	%f19,%f25,%f23
	addc	%l6,0x10a,%l6
	xnor	%l6,0xec7,%l6
	addc	%l2,-0xe61,%l1
	jmpl	%g6+8,%g0
	or	%l5,-0x1e2,%l3
p0_call_3_ho:
	andn	%l1,-0xd70,%l7
	ld	[%o5+0x03c],%f21	! Mem[000000001014143c]
	retl
	umul	%l6,%l5,%l3
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
	.word	0xd9f714a2,0xf1d2b7ae		! Init value for %l0
	.word	0x5561e372,0xc9717559		! Init value for %l1
	.word	0x681797ca,0x83e55f14		! Init value for %l2
	.word	0x7637c2fd,0x31a3f7df		! Init value for %l3
	.word	0xce25ff92,0x49a752ba		! Init value for %l4
	.word	0xeceb0ffe,0xa98912a5		! Init value for %l5
	.word	0x023cf423,0xf6ad6aa0		! Init value for %l6
	.word	0xe7d88329,0xd37e1dab		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x4ecdab80,0x4cd74d91		! Init value for %f0 
	.word	0x515668be,0x7744b717		! Init value for %f2 
	.word	0x2361806c,0x4b27cb4d		! Init value for %f4 
	.word	0x68d92a0a,0x00b933b3		! Init value for %f6 
	.word	0x525b7918,0x15fc85c9		! Init value for %f8 
	.word	0x19623d16,0x0fdca30f		! Init value for %f10
	.word	0x0fb1e184,0x49131905		! Init value for %f12
	.word	0x6a874de2,0x2a72812b		! Init value for %f14
	.word	0x17bcc5b0,0x1eebe101		! Init value for %f16
	.word	0x4eddc86e,0x12670a07		! Init value for %f18
	.word	0x21e1f19c,0x7d45f9bd		! Init value for %f20
	.word	0x0106d8ba,0x172b39a3		! Init value for %f22
	.word	0x6300f148,0x7a5b3f39		! Init value for %f24
	.word	0x7e7b6ac6,0x75d0cbff		! Init value for %f26
	.word	0x2b9f10b4,0x36dc4d75		! Init value for %f28
	.word	0x0c182a92,0x03e63d1b		! Init value for %f30
	.word	0x6dd35be0,0x28ac8071		! Init value for %f32
	.word	0x7069841e,0x2112c8f7		! Init value for %f34
	.word	0x36f29ecc,0x325df42d		! Init value for %f36
	.word	0x4fb7a36a,0x2b726b93		! Init value for %f38
	.word	0x68fb6578,0x236d84a9		! Init value for %f40
	.word	0x55d27476,0x72b1e0ef		! Init value for %f42
	.word	0x3fc1fbe4,0x7d3ecde5		! Init value for %f44
	.word	0x199da342,0x65eaa50b		! Init value for %f46
	.word	0x6ddc6e10,0x18d82be1
	.word	0x665c9bce,0x783ef3e7
	.word	0x5d4e87fc,0x095eba9d
	.word	0x56be8a1a,0x7835c983
	.word	0x5ff5d5a8,0x57525619
	.word	0x6daa5a26,0x55d6e1df
	.word	0x5bb5a314,0x70899a55
	.word	0x18cab7f2,0x1386b8fb
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
	.word	0x00000000,0x23000000		! %l0
	.word	0x00000000,0x000014ff		! %l1
	.word	0x00000000,0x4c83ff7b		! %l2
	.word	0x00000000,0x000000ff		! %l3
	.word	0x00000000,0x00000000		! %l4
	.word	0x00000000,0x01b8d601		! %l5
	.word	0x00000000,0x0000624d		! %l6
	.word	0x00000000,0x00000000		! %l7
p0_expected_fp_regs:
	.word	0x00ff14c2,0xec130000		! %f0
	.word	0x00000000,0x4c83ff7b		! %f2
	.word	0x23000000,0x836d00ff		! %f4
	.word	0x0000ff00,0x1a6fa86b		! %f6
	.word	0x00000000,0xc214b569		! %f8
	.word	0xe49cffff,0xffffffff		! %f10
	.word	0xff000000,0x43972b17		! %f12
	.word	0xffffffff,0x42000000		! %f14
	.word	0xffffffff,0x00000000		! %f16
	.word	0x00000000,0x00000000		! %f18
	.word	0xff006d83,0x00000023		! %f20
	.word	0x6ba86f1a,0x00ff0000		! %f22
	.word	0x69b514c2,0x00000000		! %f24
	.word	0xffffffff,0xffff9ce4		! %f26
	.word	0x172b9743,0x000000ff		! %f28
	.word	0x00000042,0xffffffff		! %f30
	.word	0x0000002a,0x000007a0		! %fsr
p0_local0_expect:
	.word	0x00000000,0xffffffff,0x00000000,0x513a4fa5 ! PA = 0000000010001400
	.word	0xff006d83,0x670bf0ff,0x4a000000,0xff000000 ! PA = 0000000010001410
	.word	0xbd40b55f,0x9ce4407c,0xffcbd075,0xc66a7b7e ! PA = 0000000010001420
	.word	0x6c000000,0xbd40b5d3,0x43f90000,0xa3f8226c ! PA = 0000000010001430
p0_local0_sec_expect:
	.word	0x00000000,0x00000000,0xff000000,0x149b4f09 ! PA = 0000000030001400
	.word	0xd3000000,0x00000000,0x07daab7a,0x158d0963 ! PA = 0000000030001410
	.word	0x6856aa08,0x75cf9cf9,0x06a8b986,0x0808a7bf ! PA = 0000000030001420
	.word	0x812cee44,0x0000174c,0x2da7b552,0x2561e4db ! PA = 0000000030001430
!	Scratch Area for Non-Transactional Memory Stores
	.word	0x7a574cee,0xf089de9f,0x34baac12,0xc611c18b
	.word	0x516eb556,0x64122ed7,0xfd9c81ba,0x28d5d183
	.word	0x7096323e,0x31356c8f,0x66b12fe2,0x6c7e9afb
	.word	0x18026ba6,0x84c08fc7,0x968c9e8a,0x142ed5f3
p0_local1_expect:
	.word	0xffffffff,0x00000000,0x00000000,0x00000000 ! PA = 0000000010041400
	.word	0xff006d83,0x00000023,0x6ba86f1a,0x00ff0000 ! PA = 0000000010041410
	.word	0x69b514c2,0x00000000,0xffffffff,0xffff9ce4 ! PA = 0000000010041420
	.word	0x172b9743,0x000000ff,0x00000042,0xffffffff ! PA = 0000000010041430
p0_local1_sec_expect:
	.word	0x00000000,0x00009ce4,0x00ffffff,0x00000000 ! PA = 0000000030041400
	.word	0x00000000,0x0000ffff,0x0df33cda,0x2368f943 ! PA = 0000000030041410
	.word	0x5c7b6e68,0x1dcb13d9,0x168e88e6,0x161e1d9f ! PA = 0000000030041420
	.word	0x630797d4,0x1933c415,0x434722b2,0x10afc0bb ! PA = 0000000030041430
p0_local2_expect:
	.word	0x7c000000,0xc9bce100,0xc27b6ac6,0x75d0cbff ! PA = 0000000010081400
	.word	0xbb878f9f,0x0000ffff,0xf3ff218a,0x48a23333 ! PA = 0000000010081410
	.word	0x74baca98,0x53dda1ff,0x4324c6ff,0x9896a28f ! PA = 0000000010081420
	.word	0x4d520000,0x6cb314ff,0x836cf8af,0x000000ff ! PA = 0000000010081430
p0_local2_sec_expect:
	.word	0x5f0000ff,0x00000000,0x006b0000,0x670bf0ff ! PA = 0000000030081400
	.word	0x006cffff,0x75d0cbff,0x1ea03e3a,0x22019923 ! PA = 0000000030081410
	.word	0x38bc22c8,0x433cbab9,0x6673c846,0x15cf437f ! PA = 0000000030081420
	.word	0x75f2fa34,0x4720a0f5,0x0e410012,0x78a84c9b ! PA = 0000000030081430
p0_local3_expect:
	.word	0x836d14c2,0xffcbd075,0xe0000000,0xff14ff00 ! PA = 00000000100c1400
	.word	0x4d62fc40,0x68ede351,0x0000ff00,0x6c9342d4 ! PA = 00000000100c1410
	.word	0x43000000,0xd2a39c1d,0x00006d83,0x0000c96c ! PA = 00000000100c1420
	.word	0x00000000,0xffffffff,0x00000000,0x6ea39c1d ! PA = 00000000100c1430
p0_local3_sec_expect:
	.word	0x000013ec,0xc214ff00,0x43000000,0x00000000 ! PA = 00000000300c1400
	.word	0x23000000,0x836d00ff,0xbe3b2c0a,0xe0000000 ! PA = 00000000300c1410
	.word	0x000000ff,0x00000014,0x4d62fc40,0x68ede351 ! PA = 00000000300c1420
	.word	0x9ce4407c,0x670bf0ff,0xff000000,0xffffffff ! PA = 00000000300c1430
p0_local4_expect:
	.word	0x00000000,0xbd40b55f,0x00000000,0x00000014 ! PA = 0000000010101400
	.word	0x00000000,0x7fffffff,0x7a5e00ff,0x4dcad2f3 ! PA = 0000000010101410
	.word	0x00000000,0x00000000,0x0000ffff,0x44ee2c81 ! PA = 0000000010101420
	.word	0x1c1e0000,0xffffffff,0x00000043,0x1f90d592 ! PA = 0000000010101430
p0_local4_sec_expect:
	.word	0xff14ff00,0x00000000,0x9aaf792b,0x4c1382c2 ! PA = 0000000030101400
	.word	0xff000000,0xb9c01eba,0x621790fa,0x6e48e8e3 ! PA = 0000000030101410
	.word	0x26f15b88,0x32629879,0x569c9706,0x7ce49f3f ! PA = 0000000030101420
	.word	0x01868ef4,0x1d81eab5,0x42a40ad2,0x4779745b ! PA = 0000000030101430
p0_local5_expect:
	.word	0x000013ec,0x00000014,0x6c000000,0x00000000 ! PA = 0000000010141400
	.word	0x0000c728,0x0000004a,0x4a000000,0xff000000 ! PA = 0000000010141410
	.word	0xbd40b55f,0x9ce4407c,0xffcbd075,0xc66a7b7e ! PA = 0000000010141420
	.word	0x6c000000,0xbd40b5d3,0xffffffe0,0xffffffff ! PA = 0000000010141430
p0_local5_sec_expect:
	.word	0x5fb540bd,0xff000000,0x03000000,0x000000e0 ! PA = 0000000030141400
	.word	0xba1ec0b9,0x0000ffff,0xa3f8226c,0xbaa3002f ! PA = 0000000030141410
	.word	0x5fb540bd,0x00000019,0x4d62fc40,0x68ede351 ! PA = 0000000030141420
	.word	0x4dcad2f3,0x08aa5668,0x92d5901f,0x92d5901f ! PA = 0000000030141430
p0_local6_expect:
	.word	0xff000000,0xbd40b5d3,0x00000000,0x43972b17 ! PA = 0000000010181400
	.word	0x00000000,0x00000014,0x03e98e5d,0x9aaf792b ! PA = 0000000010181410
	.word	0x00000000,0x28c77015,0x7c40e49c,0x5fb540bd ! PA = 0000000010181420
	.word	0x7e7b6ac6,0x75d0cbff,0x7e006ac6,0x0000ffff ! PA = 0000000010181430
p0_local6_sec_expect:
	.word	0xff006d83,0x68ede351,0x00000000,0x00e1bcc9 ! PA = 0000000030181400
	.word	0x0000c728,0x43000000,0xa3f8226c,0xbaa3002f ! PA = 0000000030181410
	.word	0x16958e48,0x68e15121,0x2561e4db,0x43248617 ! PA = 0000000030181420
	.word	0x6ec8dd4e,0xb4e3b54f,0xbd40b55f,0x9ce4407c ! PA = 0000000030181430
share0_expect:
	.word	0x00009ee0,0x57ecd771,0x0a061f1e,0x772017f7 ! PA = 00000000201c0000
	.word	0x33ad51cc,0x6161fb2d,0x13fb2e6a,0x2474ea93 ! PA = 00000000201c0010
	.word	0x39d88878,0x15c43ba9,0x74afef76,0x6af08fef ! PA = 00000000201c0020
	.word	0x778c8ee4,0x3fa734e5,0x69780e42,0x005c840b ! PA = 00000000201c0030
share1_expect:
	.word	0x40ff7110,0x084142e1,0x6f06f6ce,0x1d8b02e7 ! PA = 0000000020800000
	.word	0x3614fafc,0x09e7819d,0x4c7bd51a,0x05b30883 ! PA = 0000000020800010
	.word	0x47aab8a8,0x3b49cd19,0x1c2d9526,0x7c8c50df ! PA = 0000000020800020
	.word	0x6ee3f614,0x0f6ec155,0x3e36e2f2,0x672b57fb ! PA = 0000000020800030
	.word	0xffffbf40,0x666fba51,0x60c22a7e,0x139d59d7 ! PA = 0000000020800040
	.word	0x0ff2e02c,0x2af4d40d,0x0a1597ca,0x63445273 ! PA = 0000000020800050
	.word	0x2897e4d8,0x3870ea89,0x505f16d6,0x53f2fdcf ! PA = 0000000020800060
	.word	0x6f171944,0x661d99c5,0x2b4053a2,0x23c8d7eb ! PA = 0000000020800070
share2_expect:
	.word	0xb5008970,0x52b73dc1,0x0b1aba2e,0x0bce1cc7 ! PA = 00000000211c0000
	.word	0x3382015c,0x4cf8f27d,0x221b767a,0x4d4fc863 ! PA = 00000000211c0010
	.word	0x67cb0d08,0x74d893f9,0x0b077486,0x0dfb96bf ! PA = 00000000211c0020
	.word	0x2f40f874,0x7182be35,0x39c76052,0x3ebc03db ! PA = 00000000211c0030
share3_expect:
	.word	0x60ffcfa0,0x5816cd31,0x61b3a5de,0x09544bb7 ! PA = 0000000021800000
	.word	0x28bd5e8c,0x1f22dced,0x3da0712a,0x00bc6a53 ! PA = 0000000021800010
	.word	0x122f3138,0x3adfc969,0x65a9ae36,0x103d1baf ! PA = 0000000021800020
	.word	0x143c93a4,0x3e2d2ea5,0x1ebf0902,0x654bdbcb ! PA = 0000000021800030
	.word	0x7cff91d0,0x1c4d68a1,0x4fefed8e,0x5026e6a7 ! PA = 0000000021800040
	.word	0x3d5ff7bc,0x6761935d,0x097787da,0x57313843 ! PA = 0000000021800050
	.word	0x666f5168,0x27a58ad9,0x4988c3e6,0x790e8c9f ! PA = 0000000021800060
	.word	0x60a4ead4,0x276beb15,0x6ada4db2,0x597f5fbb ! PA = 0000000021800070
	.word	0x2c41d000,0x4fda1011,0x68f2913e,0x54fced97 ! PA = 0000000021800080
	.word	0x34e4ccec,0x726415cd,0x6633ba8a,0x37153233 ! PA = 0000000021800090
	.word	0x04f66d98,0x1b08d849,0x1fa7b596,0x0f86e98f ! PA = 00000000218000a0
	.word	0x64d4fe04,0x474df385,0x3a8c2e62,0x621d8fab ! PA = 00000000218000b0
	.word	0x06ff8a30,0x1dfbc381,0x179e90ee,0x2d4d6087 ! PA = 00000000218000c0
	.word	0x7886de1c,0x0399643d,0x1828093a,0x038f5823 ! PA = 00000000218000d0
	.word	0x1fef85c8,0x27a8b1b9,0x00c98346,0x337d327f ! PA = 00000000218000e0
	.word	0x2ee7cd34,0x66a247f5,0x6607ab12,0x3aad6b9b ! PA = 00000000218000f0
	.word	0xffffc060,0x1cb182f1,0x4e96ec9e,0x7f4f3f77 ! PA = 0000000021800100
	.word	0x47412b4c,0x45307ead,0x776773ea,0x0c86aa13 ! PA = 0000000021800110
	.word	0x2b4599f8,0x02e41729,0x65712cf6,0x4d88676f ! PA = 0000000021800120
	.word	0x3ab85864,0x6cf7e865,0x313fc3c2,0x0375f38b ! PA = 0000000021800130
	.word	0x4dff7290,0x3cba4e61,0x383ea44e,0x71f98a67 ! PA = 0000000021800140
	.word	0x65ceb47c,0x3818651d,0x1fc4fa9a,0x7ea22803 ! PA = 0000000021800150
	.word	0x0ca3aa28,0x74da0899,0x55e1b2a6,0x3eff885f ! PA = 0000000021800160
	.word	0x21e19f94,0x509dd4d5,0x7be77872,0x317e277b ! PA = 0000000021800170
	.word	0xff81a0c0,0x399525d1,0x66b8b7fe,0x1d034157 ! PA = 0000000021800180
	.word	0x4eaa79ac,0x2400178d,0x20d39d4a,0x5348d1f3 ! PA = 0000000021800190
	.word	0x4b74b658,0x48698609,0x1a1e1456,0x51f9954f ! PA = 00000000218001a0
	.word	0x4bbea2c4,0x06a30d45,0x7171c922,0x7e8d076b ! PA = 00000000218001b0
	.word	0xffff4af0,0x09810941,0x03e827ae,0x78e36447 ! PA = 00000000218001c0
	.word	0x620f7adc,0x075695fd,0x2de65bfa,0x40a1a7e3 ! PA = 00000000218001d0
	.word	0x40e3be88,0x3b318f79,0x69e95206,0x294d8e3f ! PA = 00000000218001e0
	.word	0x1d6a61f4,0x72d691b5,0x3911b5d2,0x5929935b ! PA = 00000000218001f0
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
	.word	0x3e62fc40,0x68ede351,0x48da0f7e,0x5da28ad7	! PA = 0000000010001400
	.word	0x4570ad2c,0x67f74d0d,0x0bae8cca,0x04dc5373	! PA = 0000000010001410
	.word	0x655b41d8,0x5ee8b389,0x54061bd6,0x5756cecf	! PA = 0000000010001420
	.word	0x5cd50644,0x63cbb2c5,0x5b1268a2,0x148178eb	! PA = 0000000010001430
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
	.word	0x3fb20670,0x4d2ca6c1,0x47c4df2e,0x77b48dc7	! PA = 0000000030001400
	.word	0x05940e5c,0x6a96ab7d,0x07daab7a,0x158d0963	! PA = 0000000030001410
	.word	0x6856aa08,0x75cf9cf9,0x06a8b986,0x0808a7bf	! PA = 0000000030001420
	.word	0x1e3b2574,0x18d41735,0x2da7b552,0x2561e4db	! PA = 0000000030001430
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
	.word	0x3bd48ca0,0x24937631,0x5ac00ade,0x3dabfcb7	! PA = 0000000010041400
	.word	0x49b3ab8c,0x546bd5ed,0x3855e62a,0x1b2eeb53	! PA = 0000000010041410
	.word	0x59d30e38,0x3a661269,0x23153336,0x41836caf	! PA = 0000000010041420
	.word	0x28c300a4,0x3031c7a5,0x097d9e02,0x276efccb	! PA = 0000000010041430
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
	.word	0x16958ed0,0x68e151a1,0x712e928e,0x677fd7a7	! PA = 0000000030041400
	.word	0x038a84bc,0x7f65cc5d,0x0df33cda,0x2368f943	! PA = 0000000030041410
	.word	0x5c7b6e68,0x1dcb13d9,0x168e88e6,0x161e1d9f	! PA = 0000000030041420
	.word	0x630797d4,0x1933c415,0x434722b2,0x10afc0bb	! PA = 0000000030041430
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
	.word	0x7d800d00,0x1e953911,0x2233763e,0x5de71e97	! PA = 0000000010081400
	.word	0x1a9399ec,0x4c338ecd,0x2d45af8a,0x48a23333	! PA = 0000000010081410
	.word	0x74baca98,0x53dda149,0x4e17ba96,0x40efba8f	! PA = 0000000010081420
	.word	0x4163eb04,0x01e90c85,0x3b774362,0x5beb30ab	! PA = 0000000010081430
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
	.word	0x17df0730,0x44ee2c81,0x5cb1b5ee,0x2a58d187	! PA = 0000000030081400
	.word	0x1c09eb1c,0x12441d3d,0x1ea03e3a,0x22019923	! PA = 0000000030081410
	.word	0x38bc22c8,0x433cbab9,0x6673c846,0x15cf437f	! PA = 0000000030081420
	.word	0x75f2fa34,0x4720a0f5,0x0e410012,0x78a84c9b	! PA = 0000000030081430
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
	.word	0x36bd7d60,0x45eb2bf1,0x174c519e,0x670bf077	! PA = 00000000100c1400
	.word	0x6ae8784c,0x0fc677ad,0x7e15e8ea,0x336e2b13	! PA = 00000000100c1410
	.word	0x006a76f8,0x75476029,0x5c25b1f6,0x7153b86f	! PA = 00000000100c1420
	.word	0x208fc564,0x64698165,0x439758c2,0x3b2e148b	! PA = 00000000100c1430
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
	.word	0x04e66f90,0x664b3761,0x0066494e,0x2ef77b67	! PA = 00000000300c1400
	.word	0x6fea417c,0x59a99e1d,0x2b79af9a,0x5d8ee903	! PA = 00000000300c1410
	.word	0x1570c728,0x061c9199,0x3b7077a6,0x28d4195f	! PA = 00000000300c1420
	.word	0x7ed54c94,0x6412add5,0x7f2d4d72,0x4c83887b	! PA = 00000000300c1430
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
	.word	0x36e4ddc0,0x358d4ed1,0x2e229cfe,0x0dd27257	! PA = 0000000010101400
	.word	0x498a46ac,0x4b9c908d,0x7a5e924a,0x4dcad2f3	! PA = 0000000010101410
	.word	0x633a1358,0x149b4f09,0x50571956,0x7a67664f	! PA = 0000000010101420
	.word	0x1c1e8fc4,0x4f2b2645,0x3075de22,0x1a6fa86b	! PA = 0000000010101430
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
	.word	0x3b03c7f0,0x7df07241,0x4e644cae,0x7013d547	! PA = 0000000030101400
	.word	0x7c0387dc,0x780e4efd,0x621790fa,0x6e48e8e3	! PA = 0000000030101410
	.word	0x26f15b88,0x32629879,0x569c9706,0x7ce49f3f	! PA = 0000000030101420
	.word	0x01868ef4,0x1d81eab5,0x42a40ad2,0x4779745b	! PA = 0000000030101430
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
	.word	0x694e2e20,0x3473a1b1,0x56ce585e,0x12f2a437	! PA = 0000000010141400
	.word	0x2151050c,0x182dd96d,0x2db7abaa,0x55f02ad3	! PA = 0000000010141410
	.word	0x1f819fb8,0x53d16de9,0x29c3f0b6,0x0fe2c42f	! PA = 0000000010141420
	.word	0x65e84a24,0x25a5fb25,0x4caad382,0x1ae7ec4b	! PA = 0000000010141430
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
	.word	0x338f1050,0x68d5dd21,0x34c3c00e,0x7465df27	! PA = 0000000030141400
	.word	0x192dbe3c,0x7bea2fdd,0x2c11e25a,0x386798c3	! PA = 0000000030141410
	.word	0x3d95dfe8,0x4006cf59,0x75102666,0x4bb8d51f	! PA = 0000000030141420
	.word	0x5ddec154,0x0ce65795,0x413d3832,0x70c2103b	! PA = 0000000030141430
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
	.word	0x55516e80,0x35962491,0x7d6783be,0x43248617	! PA = 0000000010181400
	.word	0x3914b36c,0x79f2524d,0x5fb9350a,0x561632b3	! PA = 0000000010181410
	.word	0x53991c18,0x00e1bcc9,0x63843816,0x717dd20f	! PA = 0000000010181420
	.word	0x0bc4f484,0x37520005,0x1ece38e2,0x29cee02b	! PA = 0000000010181430
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
	.word	0x03e048b0,0x2ff37801,0x1d9ca36e,0x4ea59907	! PA = 0000000030181400
	.word	0x7c40e49c,0x5fb540bd,0x2f00a3ba,0x6c22f8a3	! PA = 0000000030181410
	.word	0x45b65448,0x53013639,0x4fe325c6,0x5b08baff	! PA = 0000000030181420
	.word	0x4fb5e3b4,0x37b7f475,0x1f90d592,0x1b955c1b	! PA = 0000000030181430
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
	.word	0x1e469ee0,0x57ecd771,0x0a061f1e,0x772017f7	! PA = 00000000201c0000
	.word	0x33ad51cc,0x6161fb2d,0x13fb2e6a,0x2474ea93	! PA = 00000000201c0010
	.word	0x39d88878,0x15c43ba9,0x74afef76,0x6af08fef	! PA = 00000000201c0020
	.word	0x778c8ee4,0x3fa734e5,0x69780e42,0x005c840b	! PA = 00000000201c0030
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
	.word	0x5d4f7110,0x084142e1,0x6f06f6ce,0x1d8b02e7	! PA = 0000000020800000
	.word	0x3614fafc,0x09e7819d,0x4c7bd51a,0x05b30883	! PA = 0000000020800010
	.word	0x47aab8a8,0x3b49cd19,0x1c2d9526,0x7c8c50df	! PA = 0000000020800020
	.word	0x6ee3f614,0x0f6ec155,0x3e36e2f2,0x672b57fb	! PA = 0000000020800030
	.word	0x0385bf40,0x666fba51,0x60c22a7e,0x139d59d7	! PA = 0000000020800040
	.word	0x0ff2e02c,0x2af4d40d,0x0a1597ca,0x63445273	! PA = 0000000020800050
	.word	0x2897e4d8,0x3870ea89,0x505f16d6,0x53f2fdcf	! PA = 0000000020800060
	.word	0x6f171944,0x661d99c5,0x2b4053a2,0x23c8d7eb	! PA = 0000000020800070
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
	.word	0x0d348970,0x52b73dc1,0x0b1aba2e,0x0bce1cc7	! PA = 00000000211c0000
	.word	0x3382015c,0x4cf8f27d,0x221b767a,0x4d4fc863	! PA = 00000000211c0010
	.word	0x67cb0d08,0x74d893f9,0x0b077486,0x0dfb96bf	! PA = 00000000211c0020
	.word	0x2f40f874,0x7182be35,0x39c76052,0x3ebc03db	! PA = 00000000211c0030
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
	.word	0x6066cfa0,0x5816cd31,0x61b3a5de,0x09544bb7	! PA = 0000000021800000
	.word	0x28bd5e8c,0x1f22dced,0x3da0712a,0x00bc6a53	! PA = 0000000021800010
	.word	0x122f3138,0x3adfc969,0x65a9ae36,0x103d1baf	! PA = 0000000021800020
	.word	0x143c93a4,0x3e2d2ea5,0x1ebf0902,0x654bdbcb	! PA = 0000000021800030
	.word	0x7ce791d0,0x1c4d68a1,0x4fefed8e,0x5026e6a7	! PA = 0000000021800040
	.word	0x3d5ff7bc,0x6761935d,0x097787da,0x57313843	! PA = 0000000021800050
	.word	0x666f5168,0x27a58ad9,0x4988c3e6,0x790e8c9f	! PA = 0000000021800060
	.word	0x60a4ead4,0x276beb15,0x6ada4db2,0x597f5fbb	! PA = 0000000021800070
	.word	0x2c41d000,0x4fda1011,0x68f2913e,0x54fced97	! PA = 0000000021800080
	.word	0x34e4ccec,0x726415cd,0x6633ba8a,0x37153233	! PA = 0000000021800090
	.word	0x04f66d98,0x1b08d849,0x1fa7b596,0x0f86e98f	! PA = 00000000218000a0
	.word	0x64d4fe04,0x474df385,0x3a8c2e62,0x621d8fab	! PA = 00000000218000b0
	.word	0x31c08a30,0x1dfbc381,0x179e90ee,0x2d4d6087	! PA = 00000000218000c0
	.word	0x7886de1c,0x0399643d,0x1828093a,0x038f5823	! PA = 00000000218000d0
	.word	0x1fef85c8,0x27a8b1b9,0x00c98346,0x337d327f	! PA = 00000000218000e0
	.word	0x2ee7cd34,0x66a247f5,0x6607ab12,0x3aad6b9b	! PA = 00000000218000f0
	.word	0x7a6ec060,0x1cb182f1,0x4e96ec9e,0x7f4f3f77	! PA = 0000000021800100
	.word	0x47412b4c,0x45307ead,0x776773ea,0x0c86aa13	! PA = 0000000021800110
	.word	0x2b4599f8,0x02e41729,0x65712cf6,0x4d88676f	! PA = 0000000021800120
	.word	0x3ab85864,0x6cf7e865,0x313fc3c2,0x0375f38b	! PA = 0000000021800130
	.word	0x4d177290,0x3cba4e61,0x383ea44e,0x71f98a67	! PA = 0000000021800140
	.word	0x65ceb47c,0x3818651d,0x1fc4fa9a,0x7ea22803	! PA = 0000000021800150
	.word	0x0ca3aa28,0x74da0899,0x55e1b2a6,0x3eff885f	! PA = 0000000021800160
	.word	0x21e19f94,0x509dd4d5,0x7be77872,0x317e277b	! PA = 0000000021800170
	.word	0x7a45a0c0,0x399525d1,0x66b8b7fe,0x1d034157	! PA = 0000000021800180
	.word	0x4eaa79ac,0x2400178d,0x20d39d4a,0x5348d1f3	! PA = 0000000021800190
	.word	0x4b74b658,0x48698609,0x1a1e1456,0x51f9954f	! PA = 00000000218001a0
	.word	0x4bbea2c4,0x06a30d45,0x7171c922,0x7e8d076b	! PA = 00000000218001b0
	.word	0x0c444af0,0x09810941,0x03e827ae,0x78e36447	! PA = 00000000218001c0
	.word	0x620f7adc,0x075695fd,0x2de65bfa,0x40a1a7e3	! PA = 00000000218001d0
	.word	0x40e3be88,0x3b318f79,0x69e95206,0x294d8e3f	! PA = 00000000218001e0
	.word	0x1d6a61f4,0x72d691b5,0x3911b5d2,0x5929935b	! PA = 00000000218001f0
share3_end:
