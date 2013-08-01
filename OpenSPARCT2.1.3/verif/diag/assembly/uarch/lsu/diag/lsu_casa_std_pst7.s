/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: lsu_casa_std_pst7.s
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
#define H_HT0_Privileged_Action_0x37
#define My_HT0_Privileged_Action_0x37 \
        rdpr %tstate, %g1; \
        wrpr %g1, 0x400, %tstate; \
        retry;nop;nop;nop;nop;nop

#define  H_HT0_DAE_invalid_asi_0x14
#define SUN_H_HT0_DAE_invalid_asi_0x14 \
        done; \
        nop;nop;nop;nop;nop;nop;nop

#define  H_HT0_DAE_nc_page_0x16
#define SUN_H_HT0_DAE_nc_page_0x16 \
        ldxa   [%g0]0x47, %g0;\
        add %g0, 0x80, %g1;\
        ldxa   [%g0 + %g1]0x47, %g0;\
        add %g0, 0x8, %g1;\
        done;nop;nop;nop

#define H_HT0_Lddf_Mem_Address_Not_Aligned_0x35
#define My_HT0_Lddf_Mem_Address_Not_Aligned_0x35 \
        done;nop;nop;nop;nop;nop;nop;nop

#define H_HT0_Stdf_Mem_Address_Not_Aligned_0x36
#define My_HT0_Stdf_Mem_Address_Not_Aligned_0x36 \
        done;nop;nop;nop;nop;nop;nop;nop

#define ENABLE_HT0_DAE_Privilege_Violation_0x15
#define ENABLE_HT0_DAE_Nfo_Page_0x17
#define ENABLE_HT0_DAE_so_page_0x30
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO
#define SCONTEXT PCONTEXT
# 125 "diag.j"
#define H_HT0_Mem_Address_Not_Aligned_0x34
#define My_HT0_Mem_Address_Not_Aligned_0x34 \
        done;nop;nop;nop;nop;nop;nop;nop

# include "hboot.s"
.text
.global main

main:

main_text_start:
	setx SEC_CPPRI_DATA0_START, %r4, %r10
	setx SEC_NCPRI_DATA0_START, %r4, %r11

	mov %r10, %r27

	setx SEC_CPGOLD_DATA0_START, %r4, %r28
	mov 0x80, %g1
	wr %g1, %g0, %asi

	mov %g0, %r29
	ldd	[%r10 + 0], %f0
	ldd	[%r10 + 8], %f2
	ldd	[%r10 + 16], %f4
	ldd	[%r10 + 24], %f6
	ldd	[%r10 + 32], %f8
	ldd	[%r10 + 40], %f10
	ldd	[%r10 + 48], %f12
	ldd	[%r10 + 56], %f14
	ldd	[%r10 + 64], %f16
	ldd	[%r10 + 72], %f18
	ldd	[%r10 + 80], %f20
	ldd	[%r10 + 88], %f22
	ldd	[%r10 + 96], %f24
	ldd	[%r10 + 104], %f26
	ldd	[%r10 + 112], %f28
	ldd	[%r10 + 120], %f30
	ldd	[%r10 + 128], %f32
	ldd	[%r10 + 136], %f34
	ldd	[%r10 + 144], %f36
	ldd	[%r10 + 152], %f38
	ldd	[%r10 + 160], %f40
	ldd	[%r10 + 168], %f42
	ldd	[%r10 + 176], %f44
	ldd	[%r10 + 184], %f46
	ldd	[%r10 + 192], %f48
	ldd	[%r10 + 200], %f50
	ldd	[%r10 + 208], %f52
	ldd	[%r10 + 216], %f54
	ldd	[%r10 + 224], %f56
	ldd	[%r10 + 232], %f58
	ldd	[%r10 + 240], %f60
	ldd	[%r10 + 248], %f62
	setx 0x83b5edbbdadcd098, %g1, %r2
	setx 0x78a8d9afd5c69614, %g1, %r3
	setx 0x79e4ba0d8904c8ab, %g1, %r4
	setx 0x32db322c4c67e0bc, %g1, %r5
	setx 0x566f88bbf2e0eb8f, %g1, %r6
	setx 0x968664a8498726d6, %g1, %r7
	setx 0x84ecc67529e91aee, %g1, %r8

     mov %r2, %r1
	ta	%icc, T_RD_THID
! fork: source strm = 0xffffffff; target strm = 0x1
	cmp	%o1, 0
	setx	fork_lbl_0_1, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x2
	cmp	%o1, 1
	setx	fork_lbl_0_2, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x4
	cmp	%o1, 2
	setx	fork_lbl_0_3, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x8
	cmp	%o1, 3
	setx	fork_lbl_0_4, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x10
	cmp	%o1, 4
	setx	fork_lbl_0_5, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x20
	cmp	%o1, 5
	setx	fork_lbl_0_6, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x40
	cmp	%o1, 6
	setx	fork_lbl_0_7, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x80
	cmp	%o1, 7
	setx	fork_lbl_0_8, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_8:
	add	%g0,	0x1,	%r30
TH7_LOOP_START:
	.word 0xd1f2a01f  ! 1: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba981f  ! 2: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc84ae051  ! 3: LDSB_I	ldsb	[%r11 + 0x0051], %r4
	.word 0xc502c01f  ! 4: LDF_R	ld	[%r11, %r31], %f2
	.word 0xc85a801f  ! 5: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5e2913f  ! 6: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5ba983f  ! 7: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcd02a038  ! 8: LDF_I	ld	[%r10, 0x0038], %f6
	.word 0xcfe2e01f  ! 9: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcbbaa000  ! 10: STDFA_I	stda	%f5, [0x0000, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd19ae018  ! 11: LDDFA_I	ldda	[%r11, 0x0018], %f8
	.word 0xc7bad8bf  ! 12: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 13: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7e2e01f  ! 14: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc8ca917f  ! 15: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r4
TH_LABEL15:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc802a018  ! 16: LDUW_I	lduw	[%r10 + 0x0018], %r4
	.word 0xc5e2913f  ! 17: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5e2903f  ! 18: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba98bf  ! 19: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 20: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5f2903f  ! 21: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xc5f2a01f  ! 22: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2a01f  ! 23: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xd01a801f  ! 24: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xc03a801f  ! 25: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3ba989f  ! 26: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 27: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc402e00c  ! 28: LDUW_I	lduw	[%r11 + 0x000c], %r2
	.word 0xc692911f  ! 29: LDUHA_R	lduha	[%r10, %r31] 0x88, %r3
	.word 0xd1f2e01f  ! 30: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1bad8bf  ! 31: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcf02a048  ! 32: LDF_I	ld	[%r10, 0x0048], %f7
	.word 0xc3e2903f  ! 33: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3e2a01f  ! 34: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xcfbae048  ! 35: STDFA_I	stda	%f7, [0x0048, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc43ac01f  ! 36: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 37: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad83f  ! 38: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd102801f  ! 39: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc6c2917f  ! 40: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xce4aa037  ! 41: LDSB_I	ldsb	[%r10 + 0x0037], %r7
	.word 0xd1ba987f  ! 42: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcf22c01f  ! 43: STF_R	st	%f7, [%r31, %r11]
	.word 0xc3ba991f  ! 44: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcf02801f  ! 45: LDF_R	ld	[%r10, %r31], %f7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1bad95f  ! 46: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd08aa027  ! 47: LDUBA_I	lduba	[%r10, + 0x0027] %asi, %r8
	.word 0xc4d2901f  ! 48: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r2
	.word 0xc3e2901f  ! 49: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xca92e06a  ! 50: LDUHA_I	lduha	[%r11, + 0x006a] %asi, %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfba987f  ! 51: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba995f  ! 52: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc88ae07a  ! 53: LDUBA_I	lduba	[%r11, + 0x007a] %asi, %r4
	.word 0xd3ba997f  ! 54: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba995f  ! 55: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc49aa050  ! 56: LDDA_I	ldda	[%r10, + 0x0050] %asi, %r2
	.word 0xc702801f  ! 57: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc5e2e01f  ! 58: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc68aa037  ! 59: LDUBA_I	lduba	[%r10, + 0x0037] %asi, %r3
	.word 0xc7e2a01f  ! 60: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7e2903f  ! 61: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xcf02c01f  ! 62: LDF_R	ld	[%r11, %r31], %f7
	.word 0xc7f2e01f  ! 63: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7f2e01f  ! 64: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad81f  ! 65: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7e2e01f  ! 66: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xd082d17f  ! 67: LDUWA_R	lduwa	[%r11, %r31] 0x8b, %r8
	.word 0xc3ba991f  ! 68: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba99bf  ! 69: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba997f  ! 70: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3f2a01f  ! 71: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xd0cae077  ! 72: LDSBA_I	ldsba	[%r11, + 0x0077] %asi, %r8
	.word 0xc3e2903f  ! 73: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba989f  ! 74: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcac2d01f  ! 75: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r5
TH_LABEL75:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3bad85f  ! 76: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d01f  ! 77: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3e2e01f  ! 78: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad9bf  ! 79: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ae040  ! 80: STD_I	std	%r0, [%r11 + 0x0040]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc03ac01f  ! 81: STD_R	std	%r0, [%r11 + %r31]
	.word 0xcc1aa070  ! 82: LDD_I	ldd	[%r10 + 0x0070], %r6
	.word 0xced2903f  ! 83: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r7
	.word 0xc3f2903f  ! 84: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc3e2a01f  ! 85: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc59aa048  ! 86: LDDFA_I	ldda	[%r10, 0x0048], %f2
	.word 0xca52c01f  ! 87: LDSH_R	ldsh	[%r11 + %r31], %r5
	.word 0xc5f2d13f  ! 88: CASXA_I	casxa	[%r11] 0x89, %r31, %r2
	.word 0xc5e2e01f  ! 89: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5e2d11f  ! 90: CASA_I	casa	[%r11] 0x88, %r31, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc442c01f  ! 91: LDSW_R	ldsw	[%r11 + %r31], %r2
	.word 0xc7bad87f  ! 92: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc322801f  ! 93: STF_R	st	%f1, [%r31, %r10]
	.word 0xcc3aa000  ! 94: STD_I	std	%r6, [%r10 + 0x0000]
	.word 0xc25a801f  ! 95: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5bad81f  ! 96: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc612801f  ! 97: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xd102c01f  ! 98: LDF_R	ld	[%r11, %r31], %f8
	.word 0xd3ba983f  ! 99: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 100: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd03a801f  ! 101: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd052801f  ! 102: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xcbe2e01f  ! 103: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad83f  ! 104: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad93f  ! 105: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbbad97f  ! 106: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d03f  ! 107: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xc83ae000  ! 108: STD_I	std	%r4, [%r11 + 0x0000]
	.word 0xcf02801f  ! 109: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc9f2901f  ! 110: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9e2a01f  ! 111: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2a01f  ! 112: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2a01f  ! 113: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2901f  ! 114: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc83aa000  ! 115: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9e2a01f  ! 116: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba987f  ! 117: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 118: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2913f  ! 119: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba989f  ! 120: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc6c2903f  ! 121: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r3
	.word 0xc9f2e01f  ! 122: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 123: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad95f  ! 124: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc922801f  ! 125: STF_R	st	%f4, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3f2913f  ! 126: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba981f  ! 127: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba993f  ! 128: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba991f  ! 129: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 130: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3ba997f  ! 131: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd08a901f  ! 133: LDUBA_R	lduba	[%r10, %r31] 0x80, %r8
	.word 0xd3ba999f  ! 134: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 135: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xccdaa070  ! 136: LDXA_I	ldxa	[%r10, + 0x0070] %asi, %r6
	.word 0xd25a801f  ! 137: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xc9ba999f  ! 138: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd0c2913f  ! 139: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r8
	.word 0xc7bad9bf  ! 140: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7bad9bf  ! 141: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad93f  ! 142: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 143: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xd002a068  ! 144: LDUW_I	lduw	[%r10 + 0x0068], %r8
	.word 0xd1f2d01f  ! 145: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1f2e01f  ! 146: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1e2d03f  ! 147: CASA_I	casa	[%r11] 0x81, %r31, %r8
	.word 0xc79ae068  ! 148: LDDFA_I	ldda	[%r11, 0x0068], %f3
	.word 0xc5f2d03f  ! 149: CASXA_I	casxa	[%r11] 0x81, %r31, %r2
	.word 0xc5bad85f  ! 150: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd28aa068  ! 151: LDUBA_I	lduba	[%r10, + 0x0068] %asi, %r9
	.word 0xcdbad97f  ! 152: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad81f  ! 153: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc89ae058  ! 154: LDDA_I	ldda	[%r11, + 0x0058] %asi, %r4
	.word 0xcaca901f  ! 155: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcecaa075  ! 156: LDSBA_I	ldsba	[%r10, + 0x0075] %asi, %r7
	.word 0xd3e2901f  ! 157: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xc292917f  ! 158: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r1
	.word 0xd28aa003  ! 159: LDUBA_I	lduba	[%r10, + 0x0003] %asi, %r9
	.word 0xce8ad05f  ! 160: LDUBA_R	lduba	[%r11, %r31] 0x82, %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfba98bf  ! 161: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc84ae004  ! 162: LDSB_I	ldsb	[%r11 + 0x0004], %r4
	.word 0xd3ba983f  ! 163: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xca42801f  ! 164: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xcde2d03f  ! 165: CASA_I	casa	[%r11] 0x81, %r31, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc59aa068  ! 166: LDDFA_I	ldda	[%r10, 0x0068], %f2
	.word 0xc83aa070  ! 167: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xcbba981f  ! 168: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcac2901f  ! 169: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r5
	.word 0xca92d11f  ! 170: LDUHA_R	lduha	[%r11, %r31] 0x88, %r5
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7e2d01f  ! 171: CASA_I	casa	[%r11] 0x80, %r31, %r3
	.word 0xc7bad89f  ! 172: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae070  ! 173: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xc43ae070  ! 174: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xc59ae008  ! 175: LDDFA_I	ldda	[%r11, 0x0008], %f2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1ba999f  ! 176: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc252a026  ! 177: LDSH_I	ldsh	[%r10 + 0x0026], %r1
	.word 0xcc02e064  ! 178: LDUW_I	lduw	[%r11 + 0x0064], %r6
	.word 0xc99aa018  ! 179: LDDFA_I	ldda	[%r10, 0x0018], %f4
	.word 0xcdf2e01f  ! 180: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc442e05c  ! 181: LDSW_I	ldsw	[%r11 + 0x005c], %r2
	.word 0xd122801f  ! 182: STF_R	st	%f8, [%r31, %r10]
	.word 0xca42e06c  ! 183: LDSW_I	ldsw	[%r11 + 0x006c], %r5
	.word 0xd3ba993f  ! 184: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 185: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3e2901f  ! 186: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba99bf  ! 187: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc85aa008  ! 188: LDX_I	ldx	[%r10 + 0x0008], %r4
	.word 0xc5e2913f  ! 189: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xd39aa078  ! 190: LDDFA_I	ldda	[%r10, 0x0078], %f9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdf2901f  ! 191: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba997f  ! 192: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 193: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc8ad17f  ! 194: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r6
	.word 0xcbe2a01f  ! 195: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbba991f  ! 196: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcc1aa040  ! 197: LDD_I	ldd	[%r10 + 0x0040], %r6
	.word 0xc99aa048  ! 198: LDDFA_I	ldda	[%r10, 0x0048], %f4
	.word 0xc892905f  ! 199: LDUHA_R	lduha	[%r10, %r31] 0x82, %r4
	.word 0xc482a024  ! 200: LDUWA_I	lduwa	[%r10, + 0x0024] %asi, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5ba997f  ! 201: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd052801f  ! 202: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xd3e2d13f  ! 203: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd3f2e01f  ! 204: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad81f  ! 205: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc282d13f  ! 206: LDUWA_R	lduwa	[%r11, %r31] 0x89, %r1
	.word 0xcfe2d03f  ! 207: CASA_I	casa	[%r11] 0x81, %r31, %r7
	.word 0xcc3ac01f  ! 208: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcfe2d03f  ! 209: CASA_I	casa	[%r11] 0x81, %r31, %r7
	.word 0xcc3ac01f  ! 210: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfbad81f  ! 211: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc412c01f  ! 212: LDUH_R	lduh	[%r11 + %r31], %r2
	.word 0xc7ba98bf  ! 213: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc60ac01f  ! 214: LDUB_R	ldub	[%r11 + %r31], %r3
	.word 0xd3bad85f  ! 215: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3bad91f  ! 216: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2d01f  ! 217: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd3bad89f  ! 218: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae018  ! 219: STD_I	std	%r8, [%r11 + 0x0018]
	.word 0xc502801f  ! 220: LDF_R	ld	[%r10, %r31], %f2
TH_LABEL220:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc24aa054  ! 221: LDSB_I	ldsb	[%r10 + 0x0054], %r1
	.word 0xc3e2a01f  ! 222: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc20a801f  ! 223: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xc40a801f  ! 224: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xc5e2a01f  ! 225: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5ba981f  ! 226: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 227: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa048  ! 228: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc43a801f  ! 229: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba987f  ! 230: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5f2a01f  ! 231: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2903f  ! 232: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5e2a01f  ! 233: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcf02801f  ! 234: LDF_R	ld	[%r10, %r31], %f7
	.word 0xd3ba987f  ! 235: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3ba999f  ! 236: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2911f  ! 237: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xd3f2a01f  ! 238: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd102e04c  ! 239: LDF_I	ld	[%r11, 0x004c], %f8
	.word 0xcc92915f  ! 240: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd03a801f  ! 241: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba993f  ! 242: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd322801f  ! 243: STF_R	st	%f9, [%r31, %r10]
	.word 0xc9f2a01f  ! 244: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xcf22801f  ! 245: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd03aa060  ! 246: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd03a801f  ! 247: STD_R	std	%r8, [%r10 + %r31]
	.word 0xcc92915f  ! 248: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r6
	.word 0xc24a801f  ! 249: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xc99aa008  ! 250: LDDFA_I	ldda	[%r10, 0x0008], %f4
TH_LABEL250:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc2c2e000  ! 251: LDSWA_I	ldswa	[%r11, + 0x0000] %asi, %r1
	.word 0xc5e2a01f  ! 252: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5f2913f  ! 253: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xc5e2a01f  ! 254: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 255: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc49aa038  ! 256: LDDA_I	ldda	[%r10, + 0x0038] %asi, %r2
	.word 0xc9ba981f  ! 257: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc89aa008  ! 258: LDDA_I	ldda	[%r10, + 0x0008] %asi, %r4
	.word 0xcbba98bf  ! 259: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcf22801f  ! 260: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdbad95f  ! 261: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd0c2a06c  ! 262: LDSWA_I	ldswa	[%r10, + 0x006c] %asi, %r8
	.word 0xc9ba995f  ! 263: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 264: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba99bf  ! 265: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9f2a01f  ! 266: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2903f  ! 267: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xcc1aa078  ! 268: LDD_I	ldd	[%r10 + 0x0078], %r6
	.word 0xd1ba98bf  ! 269: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 270: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd302c01f  ! 271: LDF_R	ld	[%r11, %r31], %f9
	.word 0xc7ba981f  ! 272: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 273: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 274: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7f2901f  ! 275: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7ba99bf  ! 276: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xce5aa030  ! 277: LDX_I	ldx	[%r10 + 0x0030], %r7
	.word 0xd39aa038  ! 278: LDDFA_I	ldda	[%r10, 0x0038], %f9
	.word 0xc252801f  ! 279: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xce5ac01f  ! 280: LDX_R	ldx	[%r11 + %r31], %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3f2e01f  ! 281: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xccd2d13f  ! 282: LDSHA_R	ldsha	[%r11, %r31] 0x89, %r6
	.word 0xccc2905f  ! 283: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r6
	.word 0xcbe2901f  ! 284: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xc09ae020  ! 285: LDDA_I	ldda	[%r11, + 0x0020] %asi, %r0
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7bad9bf  ! 286: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae038  ! 287: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xd292a056  ! 288: LDUHA_I	lduha	[%r10, + 0x0056] %asi, %r9
	.word 0xc5f2e01f  ! 289: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2d13f  ! 290: CASA_I	casa	[%r11] 0x89, %r31, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5bad99f  ! 291: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad8bf  ! 292: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcd02c01f  ! 293: LDF_R	ld	[%r11, %r31], %f6
	.word 0xc722c01f  ! 294: STF_R	st	%f3, [%r31, %r11]
	.word 0xc902a038  ! 295: LDF_I	ld	[%r10, 0x0038], %f4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5baa020  ! 296: STDFA_I	stda	%f2, [0x0020, %r10]
	.word 0xcc02a000  ! 297: LDUW_I	lduw	[%r10 + 0x0000], %r6
	.word 0xc3ba98bf  ! 298: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2913f  ! 299: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xce8aa05c  ! 300: LDUBA_I	lduba	[%r10, + 0x005c] %asi, %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc202a004  ! 301: LDUW_I	lduw	[%r10 + 0x0004], %r1
	.word 0xd03a801f  ! 302: STD_R	std	%r8, [%r10 + %r31]
	.word 0xca52801f  ! 303: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xc5ba981f  ! 304: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc692d07f  ! 305: LDUHA_R	lduha	[%r11, %r31] 0x83, %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdf2a01f  ! 306: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2a01f  ! 307: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc5ae020  ! 308: LDX_I	ldx	[%r11 + 0x0020], %r6
	.word 0xc4daa070  ! 309: LDXA_I	ldxa	[%r10, + 0x0070] %asi, %r2
	.word 0xc88aa03e  ! 310: LDUBA_I	lduba	[%r10, + 0x003e] %asi, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd102e044  ! 311: LDF_I	ld	[%r11, 0x0044], %f8
	.word 0xcfba985f  ! 312: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba995f  ! 313: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa038  ! 314: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xc252c01f  ! 315: LDSH_R	ldsh	[%r11 + %r31], %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc202c01f  ! 316: LDUW_R	lduw	[%r11 + %r31], %r1
	.word 0xc40ac01f  ! 317: LDUB_R	ldub	[%r11 + %r31], %r2
	.word 0xc89aa060  ! 318: LDDA_I	ldda	[%r10, + 0x0060] %asi, %r4
	.word 0xc83ac01f  ! 319: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad91f  ! 320: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd0dad05f  ! 321: LDXA_R	ldxa	[%r11, %r31] 0x82, %r8
	.word 0xc722c01f  ! 322: STF_R	st	%f3, [%r31, %r11]
	.word 0xcadaa020  ! 323: LDXA_I	ldxa	[%r10, + 0x0020] %asi, %r5
	.word 0xd1ba983f  ! 324: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcb02c01f  ! 325: LDF_R	ld	[%r11, %r31], %f5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc3a801f  ! 326: STD_R	std	%r6, [%r10 + %r31]
	.word 0xce92901f  ! 327: LDUHA_R	lduha	[%r10, %r31] 0x80, %r7
	.word 0xcdf2903f  ! 328: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xcdf2901f  ! 329: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xc4da901f  ! 330: LDXA_R	ldxa	[%r10, %r31] 0x80, %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3bad87f  ! 331: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad85f  ! 332: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad8bf  ! 333: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xca42801f  ! 334: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xc7ba997f  ! 335: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc802a068  ! 336: LDUW_I	lduw	[%r10 + 0x0068], %r4
	.word 0xd322801f  ! 337: STF_R	st	%f9, [%r31, %r10]
	.word 0xd1bae000  ! 338: STDFA_I	stda	%f8, [0x0000, %r11]
	.word 0xcfbad87f  ! 339: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc252801f  ! 340: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd08ae07c  ! 341: LDUBA_I	lduba	[%r11, + 0x007c] %asi, %r8
	.word 0xd1bad91f  ! 342: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d13f  ! 343: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xd1bad81f  ! 344: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcc8aa079  ! 345: LDUBA_I	lduba	[%r10, + 0x0079] %asi, %r6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd2d2e03c  ! 346: LDSHA_I	ldsha	[%r11, + 0x003c] %asi, %r9
	.word 0xd2c2905f  ! 347: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r9
	.word 0xcfbad85f  ! 348: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc59aa040  ! 349: LDDFA_I	ldda	[%r10, 0x0040], %f2
	.word 0xcad2e046  ! 350: LDSHA_I	ldsha	[%r11, + 0x0046] %asi, %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcb02e074  ! 351: LDF_I	ld	[%r11, 0x0074], %f5
	.word 0xc852e03c  ! 352: LDSH_I	ldsh	[%r11 + 0x003c], %r4
	.word 0xc9f2e01f  ! 353: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xcd9aa068  ! 354: LDDFA_I	ldda	[%r10, 0x0068], %f6
	.word 0xcdba999f  ! 355: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdba985f  ! 356: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc28ad13f  ! 357: LDUBA_R	lduba	[%r11, %r31] 0x89, %r1
	.word 0xd3bad89f  ! 358: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad97f  ! 359: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 360: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3bad85f  ! 361: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcdbaa058  ! 362: STDFA_I	stda	%f6, [0x0058, %r10]
	.word 0xcff2911f  ! 363: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcfe2a01f  ! 364: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc88a907f  ! 365: LDUBA_R	lduba	[%r10, %r31] 0x83, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfba98bf  ! 366: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba995f  ! 367: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 368: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcff2911f  ! 369: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcfba981f  ! 370: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcff2911f  ! 371: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcfba981f  ! 372: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc6daa048  ! 373: LDXA_I	ldxa	[%r10, + 0x0048] %asi, %r3
	.word 0xc3f2d13f  ! 374: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xc6d2d15f  ! 375: LDSHA_R	ldsha	[%r11, %r31] 0x8a, %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd19ae050  ! 376: LDDFA_I	ldda	[%r11, 0x0050], %f8
	.word 0xcc3ae048  ! 377: STD_I	std	%r6, [%r11 + 0x0048]
	.word 0xcc3ae048  ! 378: STD_I	std	%r6, [%r11 + 0x0048]
	.word 0xd04aa003  ! 379: LDSB_I	ldsb	[%r10 + 0x0003], %r8
	.word 0xc522801f  ! 380: STF_R	st	%f2, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1ba987f  ! 381: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc302801f  ! 382: LDF_R	ld	[%r10, %r31], %f1
	.word 0xd1ba983f  ! 383: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 384: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba987f  ! 385: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1ba99bf  ! 386: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 387: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd19ae068  ! 388: LDDFA_I	ldda	[%r11, 0x0068], %f8
	.word 0xca5ac01f  ! 389: LDX_R	ldx	[%r11 + %r31], %r5
	.word 0xca92901f  ! 390: LDUHA_R	lduha	[%r10, %r31] 0x80, %r5
TH_LABEL390:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc702a03c  ! 391: LDF_I	ld	[%r10, 0x003c], %f3
	.word 0xc842e048  ! 392: LDSW_I	ldsw	[%r11 + 0x0048], %r4
	.word 0xc83ae040  ! 393: STD_I	std	%r4, [%r11 + 0x0040]
	.word 0xc9bad93f  ! 394: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc502801f  ! 395: LDF_R	ld	[%r10, %r31], %f2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc83a801f  ! 396: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc39ae048  ! 397: LDDFA_I	ldda	[%r11, 0x0048], %f1
	.word 0xcfba991f  ! 398: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 399: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xd04aa03f  ! 400: LDSB_I	ldsb	[%r10 + 0x003f], %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc68a903f  ! 401: LDUBA_R	lduba	[%r10, %r31] 0x81, %r3
	.word 0xc3ba98bf  ! 402: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc902a070  ! 403: LDF_I	ld	[%r10, 0x0070], %f4
	.word 0xc5baa070  ! 404: STDFA_I	stda	%f2, [0x0070, %r10]
	.word 0xc83a801f  ! 405: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9ba98bf  ! 406: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 407: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd302801f  ! 408: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd1ba989f  ! 409: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba985f  ! 410: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL410:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1f2901f  ! 411: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xcc8ae044  ! 412: LDUBA_I	lduba	[%r11, + 0x0044] %asi, %r6
	.word 0xc5f2d11f  ! 413: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xcc4a801f  ! 414: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xd3ba993f  ! 415: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd03aa060  ! 416: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd3ba987f  ! 417: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2911f  ! 418: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xd03aa060  ! 419: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd042a074  ! 420: LDSW_I	ldsw	[%r10 + 0x0074], %r8
TH_LABEL420:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1bad99f  ! 421: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 422: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad95f  ! 423: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d01f  ! 424: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xc8c2911f  ! 425: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc802a04c  ! 426: LDUW_I	lduw	[%r10 + 0x004c], %r4
	.word 0xcc02801f  ! 427: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xd08a903f  ! 428: LDUBA_R	lduba	[%r10, %r31] 0x81, %r8
	.word 0xc5ba989f  ! 429: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2903f  ! 430: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
TH_LABEL430:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5ba981f  ! 431: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcb22801f  ! 432: STF_R	st	%f5, [%r31, %r10]
	.word 0xcb22801f  ! 433: STF_R	st	%f5, [%r31, %r10]
	.word 0xc3bae070  ! 434: STDFA_I	stda	%f1, [0x0070, %r11]
	.word 0xcdba997f  ! 435: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc3aa038  ! 436: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcf9aa058  ! 437: LDDFA_I	ldda	[%r10, 0x0058], %f7
	.word 0xc4caa027  ! 438: LDSBA_I	ldsba	[%r10, + 0x0027] %asi, %r2
	.word 0xc5e2e01f  ! 439: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad95f  ! 440: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5f2d01f  ! 441: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc702e010  ! 442: LDF_I	ld	[%r11, 0x0010], %f3
	.word 0xc9ba985f  ! 443: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xca8aa02e  ! 444: LDUBA_I	lduba	[%r10, + 0x002e] %asi, %r5
	.word 0xc3bad93f  ! 445: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3e2d11f  ! 446: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xcd02801f  ! 447: LDF_R	ld	[%r10, %r31], %f6
	.word 0xd3f2a01f  ! 448: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc41a801f  ! 449: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc03aa008  ! 450: STD_I	std	%r0, [%r10 + 0x0008]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3f2911f  ! 451: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xd1baa048  ! 452: STDFA_I	stda	%f8, [0x0048, %r10]
	.word 0xd102e048  ! 453: LDF_I	ld	[%r11, 0x0048], %f8
	.word 0xc7ba98bf  ! 454: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 455: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7e2901f  ! 456: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7f2911f  ! 457: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba993f  ! 458: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc60a801f  ! 459: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xd1ba995f  ! 460: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL460:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1ba983f  ! 461: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 462: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2901f  ! 463: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1f2901f  ! 464: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1f2911f  ! 465: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1f2a01f  ! 466: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd2da901f  ! 467: LDXA_R	ldxa	[%r10, %r31] 0x80, %r9
	.word 0xc5ba997f  ! 468: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 469: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 470: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc39ae038  ! 471: LDDFA_I	ldda	[%r11, 0x0038], %f1
	.word 0xd1e2913f  ! 472: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xd19aa060  ! 473: LDDFA_I	ldda	[%r10, 0x0060], %f8
	.word 0xd1bad81f  ! 474: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2e01f  ! 475: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc702a008  ! 476: LDF_I	ld	[%r10, 0x0008], %f3
	.word 0xd1ba99bf  ! 477: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 478: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba991f  ! 479: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc282905f  ! 480: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9f2a01f  ! 481: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc522c01f  ! 482: STF_R	st	%f2, [%r31, %r11]
	.word 0xca4a801f  ! 483: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xccd2a06a  ! 484: LDSHA_I	ldsha	[%r10, + 0x006a] %asi, %r6
	.word 0xd302c01f  ! 485: LDF_R	ld	[%r11, %r31], %f9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcd02e06c  ! 486: LDF_I	ld	[%r11, 0x006c], %f6
	.word 0xc9ba981f  ! 487: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba987f  ! 488: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcd02a050  ! 489: LDF_I	ld	[%r10, 0x0050], %f6
	.word 0xcc3a801f  ! 490: STD_R	std	%r6, [%r10 + %r31]
TH_LABEL490:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc682d05f  ! 491: LDUWA_R	lduwa	[%r11, %r31] 0x82, %r3
	.word 0xcdba981f  ! 492: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 493: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba989f  ! 494: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 495: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7baa000  ! 496: STDFA_I	stda	%f3, [0x0000, %r10]
	.word 0xcc12801f  ! 497: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xd3ba981f  ! 498: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 499: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2a01f  ! 500: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc85aa060  ! 501: LDX_I	ldx	[%r10 + 0x0060], %r4
	.word 0xc492913f  ! 502: LDUHA_R	lduha	[%r10, %r31] 0x89, %r2
	.word 0xcbf2913f  ! 503: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xcbf2a01f  ! 504: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba993f  ! 505: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbf2a01f  ! 506: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2913f  ! 507: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xcbba989f  ! 508: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd39aa040  ! 509: LDDFA_I	ldda	[%r10, 0x0040], %f9
	.word 0xcc9aa008  ! 510: LDDA_I	ldda	[%r10, + 0x0008] %asi, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc52801f  ! 511: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xc43a801f  ! 512: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba981f  ! 513: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd102801f  ! 514: LDF_R	ld	[%r10, %r31], %f8
	.word 0xd2d2a040  ! 515: LDSHA_I	ldsha	[%r10, + 0x0040] %asi, %r9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbba989f  ! 516: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba997f  ! 517: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 518: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc6cad07f  ! 519: LDSBA_R	ldsba	[%r11, %r31] 0x83, %r3
	.word 0xd2d2901f  ! 520: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc722c01f  ! 521: STF_R	st	%f3, [%r31, %r11]
	.word 0xc202c01f  ! 522: LDUW_R	lduw	[%r11 + %r31], %r1
	.word 0xc3bae038  ! 523: STDFA_I	stda	%f1, [0x0038, %r11]
	.word 0xc3ba985f  ! 524: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa028  ! 525: STD_I	std	%r0, [%r10 + 0x0028]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd242801f  ! 526: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xd012e066  ! 527: LDUH_I	lduh	[%r11 + 0x0066], %r8
	.word 0xc9f2a01f  ! 528: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xd082e078  ! 529: LDUWA_I	lduwa	[%r11, + 0x0078] %asi, %r8
	.word 0xc3baa030  ! 530: STDFA_I	stda	%f1, [0x0030, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcb02801f  ! 531: LDF_R	ld	[%r10, %r31], %f5
	.word 0xcdbad93f  ! 532: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcedaa048  ! 533: LDXA_I	ldxa	[%r10, + 0x0048] %asi, %r7
	.word 0xc9ba997f  ! 534: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 535: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc252801f  ! 536: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xcc3aa070  ! 537: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcfba99bf  ! 538: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2913f  ! 539: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xca5a801f  ! 540: LDX_R	ldx	[%r10 + %r31], %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9e2901f  ! 541: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc2d2901f  ! 542: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r1
	.word 0xc502a020  ! 543: LDF_I	ld	[%r10, 0x0020], %f2
	.word 0xcbba981f  ! 544: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xca52801f  ! 545: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc3a801f  ! 546: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2a01f  ! 547: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba981f  ! 548: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba98bf  ! 549: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2911f  ! 550: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfe2a01f  ! 551: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba981f  ! 552: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd252801f  ! 553: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xc24a801f  ! 554: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xc242a068  ! 555: LDSW_I	ldsw	[%r10 + 0x0068], %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcedaa068  ! 556: LDXA_I	ldxa	[%r10, + 0x0068] %asi, %r7
	.word 0xd0d2e07a  ! 557: LDSHA_I	ldsha	[%r11, + 0x007a] %asi, %r8
	.word 0xd24aa043  ! 558: LDSB_I	ldsb	[%r10 + 0x0043], %r9
	.word 0xc8cad11f  ! 559: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r4
	.word 0xc5f2a01f  ! 560: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcedad13f  ! 561: LDXA_R	ldxa	[%r11, %r31] 0x89, %r7
	.word 0xc81ae038  ! 562: LDD_I	ldd	[%r11 + 0x0038], %r4
	.word 0xd3ba99bf  ! 563: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2903f  ! 564: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xcb22c01f  ! 565: STF_R	st	%f5, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03ac01f  ! 566: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2e01f  ! 567: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad8bf  ! 568: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad87f  ! 569: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d11f  ! 570: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc722c01f  ! 571: STF_R	st	%f3, [%r31, %r11]
	.word 0xcbbad83f  ! 572: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd2caa059  ! 573: LDSBA_I	ldsba	[%r10, + 0x0059] %asi, %r9
	.word 0xcde2a01f  ! 574: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2901f  ! 575: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xca52c01f  ! 576: LDSH_R	ldsh	[%r11 + %r31], %r5
	.word 0xcb02801f  ! 577: LDF_R	ld	[%r10, %r31], %f5
	.word 0xd1f2a01f  ! 578: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc39aa020  ! 579: LDDFA_I	ldda	[%r10, 0x0020], %f1
	.word 0xc5e2e01f  ! 580: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc43ae030  ! 581: STD_I	std	%r2, [%r11 + 0x0030]
	.word 0xc5bad97f  ! 582: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2d01f  ! 583: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xca0a801f  ! 584: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xcb22c01f  ! 585: STF_R	st	%f5, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3f2903f  ! 586: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc03aa030  ! 587: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba991f  ! 588: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcccad15f  ! 589: LDSBA_R	ldsba	[%r11, %r31] 0x8a, %r6
	.word 0xd052a07c  ! 590: LDSH_I	ldsh	[%r10 + 0x007c], %r8
TH_LABEL590:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbba995f  ! 591: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 592: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xd2c2d03f  ! 593: LDSWA_R	ldswa	[%r11, %r31] 0x81, %r9
	.word 0xcfba985f  ! 594: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba99bf  ! 595: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc642e030  ! 596: LDSW_I	ldsw	[%r11 + 0x0030], %r3
	.word 0xd012a056  ! 597: LDUH_I	lduh	[%r10 + 0x0056], %r8
	.word 0xd1e2d03f  ! 598: CASA_I	casa	[%r11] 0x81, %r31, %r8
	.word 0xd1e2e01f  ! 599: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1f2e01f  ! 600: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd03ae070  ! 601: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xc79aa038  ! 602: LDDFA_I	ldda	[%r10, 0x0038], %f3
	.word 0xc412a022  ! 603: LDUH_I	lduh	[%r10 + 0x0022], %r2
	.word 0xc212801f  ! 604: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xd3ba999f  ! 605: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3ba991f  ! 606: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 607: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd212c01f  ! 608: LDUH_R	lduh	[%r11 + %r31], %r9
	.word 0xc2caa077  ! 609: LDSBA_I	ldsba	[%r10, + 0x0077] %asi, %r1
	.word 0xc402801f  ! 610: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc652801f  ! 611: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xd3ba983f  ! 612: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 613: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 614: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3f2a01f  ! 615: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3ba997f  ! 616: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc6c2a070  ! 617: LDSWA_I	ldswa	[%r10, + 0x0070] %asi, %r3
	.word 0xc9e2a01f  ! 618: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba991f  ! 619: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 620: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc83a801f  ! 621: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba981f  ! 622: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 623: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9e2a01f  ! 624: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc60a801f  ! 625: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3e2903f  ! 626: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3e2911f  ! 627: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xc3ba993f  ! 628: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba997f  ! 629: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd01a801f  ! 630: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7ba995f  ! 631: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 632: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 633: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba981f  ! 634: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc892e06c  ! 635: LDUHA_I	lduha	[%r11, + 0x006c] %asi, %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbba983f  ! 636: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba99bf  ! 637: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba991f  ! 638: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xca12a03a  ! 639: LDUH_I	lduh	[%r10 + 0x003a], %r5
	.word 0xcc4a801f  ! 640: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfba995f  ! 641: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2901f  ! 642: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcfba98bf  ! 643: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcb02801f  ! 644: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc5e2901f  ! 645: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbbaa008  ! 646: STDFA_I	stda	%f5, [0x0008, %r10]
	.word 0xd3baa058  ! 647: STDFA_I	stda	%f9, [0x0058, %r10]
	.word 0xd3e2a01f  ! 648: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba997f  ! 649: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 650: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3f2903f  ! 651: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xd03a801f  ! 652: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba98bf  ! 653: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd302a070  ! 654: LDF_I	ld	[%r10, 0x0070], %f9
	.word 0xccc2d13f  ! 655: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd0d2a016  ! 656: LDSHA_I	ldsha	[%r10, + 0x0016] %asi, %r8
	.word 0xc43a801f  ! 657: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa048  ! 658: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc7ba999f  ! 659: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd3baa000  ! 660: STDFA_I	stda	%f9, [0x0000, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xccd2903f  ! 661: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r6
	.word 0xc9e2913f  ! 662: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba993f  ! 663: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba989f  ! 664: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd24a801f  ! 665: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd39aa018  ! 666: LDDFA_I	ldda	[%r10, 0x0018], %f9
	.word 0xc60aa042  ! 667: LDUB_I	ldub	[%r10 + 0x0042], %r3
	.word 0xc3bad93f  ! 668: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc892907f  ! 669: LDUHA_R	lduha	[%r10, %r31] 0x83, %r4
	.word 0xcc0a801f  ! 670: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3bad91f  ! 671: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc45a801f  ! 672: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xd1ba989f  ! 673: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc902801f  ! 674: LDF_R	ld	[%r10, %r31], %f4
	.word 0xcdf2e01f  ! 675: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcdbad85f  ! 676: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd04ac01f  ! 677: LDSB_R	ldsb	[%r11 + %r31], %r8
	.word 0xc3f2901f  ! 678: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xd2caa020  ! 679: LDSBA_I	ldsba	[%r10, + 0x0020] %asi, %r9
	.word 0xc43a801f  ! 680: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcf02801f  ! 681: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc7bad81f  ! 682: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad81f  ! 683: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcf02e03c  ! 684: LDF_I	ld	[%r11, 0x003c], %f7
	.word 0xc702c01f  ! 685: LDF_R	ld	[%r11, %r31], %f3
TH_LABEL685:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd012c01f  ! 686: LDUH_R	lduh	[%r11 + %r31], %r8
	.word 0xcf22801f  ! 687: STF_R	st	%f7, [%r31, %r10]
	.word 0xcfbad99f  ! 688: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc5baa068  ! 689: STDFA_I	stda	%f2, [0x0068, %r10]
	.word 0xc20ac01f  ! 690: LDUB_R	ldub	[%r11 + %r31], %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03a801f  ! 691: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba99bf  ! 692: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 693: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc41ae078  ! 694: LDD_I	ldd	[%r11 + 0x0078], %r2
	.word 0xcc02a03c  ! 695: LDUW_I	lduw	[%r10 + 0x003c], %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5bae020  ! 696: STDFA_I	stda	%f2, [0x0020, %r11]
	.word 0xc81a801f  ! 697: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xd3e2e01f  ! 698: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad91f  ! 699: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 700: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc8aa03e  ! 701: LDUBA_I	lduba	[%r10, + 0x003e] %asi, %r6
	.word 0xc3e2a01f  ! 702: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba981f  ! 703: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc01ac01f  ! 704: LDD_R	ldd	[%r11 + %r31], %r0
	.word 0xc402801f  ! 705: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7e2903f  ! 706: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xc49aa058  ! 707: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r2
	.word 0xc7f2a01f  ! 708: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xd302a004  ! 709: LDF_I	ld	[%r10, 0x0004], %f9
	.word 0xcad2901f  ! 710: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3bad89f  ! 711: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 712: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc03ae040  ! 713: STD_I	std	%r0, [%r11 + 0x0040]
	.word 0xd20a801f  ! 714: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xcc4aa056  ! 715: LDSB_I	ldsb	[%r10 + 0x0056], %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc12801f  ! 716: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xc5baa028  ! 717: STDFA_I	stda	%f2, [0x0028, %r10]
	.word 0xcec2a058  ! 718: LDSWA_I	ldswa	[%r10, + 0x0058] %asi, %r7
	.word 0xd05ae010  ! 719: LDX_I	ldx	[%r11 + 0x0010], %r8
	.word 0xc5bad87f  ! 720: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xccdae068  ! 721: LDXA_I	ldxa	[%r11, + 0x0068] %asi, %r6
	.word 0xc7bad99f  ! 722: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc722801f  ! 723: STF_R	st	%f3, [%r31, %r10]
	.word 0xc9e2901f  ! 724: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2901f  ! 725: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc24a801f  ! 726: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xc80ac01f  ! 727: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xcbba989f  ! 728: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 729: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 730: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcd9aa050  ! 731: LDDFA_I	ldda	[%r10, 0x0050], %f6
	.word 0xd3f2d11f  ! 732: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xd3bad91f  ! 733: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc452801f  ! 734: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xc9f2d01f  ! 735: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
TH_LABEL735:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9bad81f  ! 736: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd2cad05f  ! 737: LDSBA_R	ldsba	[%r11, %r31] 0x82, %r9
	.word 0xc83a801f  ! 738: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba981f  ! 739: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 740: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc8c2911f  ! 741: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r4
	.word 0xc652a006  ! 742: LDSH_I	ldsh	[%r10 + 0x0006], %r3
	.word 0xc252801f  ! 743: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xc3bae028  ! 744: STDFA_I	stda	%f1, [0x0028, %r11]
	.word 0xc5baa008  ! 745: STDFA_I	stda	%f2, [0x0008, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcd9aa020  ! 746: LDDFA_I	ldda	[%r10, 0x0020], %f6
	.word 0xcc3aa068  ! 747: STD_I	std	%r6, [%r10 + 0x0068]
	.word 0xcdba98bf  ! 748: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcfbae068  ! 749: STDFA_I	stda	%f7, [0x0068, %r11]
	.word 0xc5ba983f  ! 750: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5f2901f  ! 751: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xcc0ae069  ! 752: LDUB_I	ldub	[%r11 + 0x0069], %r6
	.word 0xd322801f  ! 753: STF_R	st	%f9, [%r31, %r10]
	.word 0xd2ca901f  ! 754: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r9
	.word 0xd24a801f  ! 755: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd28aa033  ! 756: LDUBA_I	lduba	[%r10, + 0x0033] %asi, %r9
	.word 0xcb02e04c  ! 757: LDF_I	ld	[%r11, 0x004c], %f5
	.word 0xccca915f  ! 758: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r6
	.word 0xc702c01f  ! 759: LDF_R	ld	[%r11, %r31], %f3
	.word 0xc43a801f  ! 760: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7e2913f  ! 761: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc43aa038  ! 762: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc6c2d07f  ! 763: LDSWA_R	ldswa	[%r11, %r31] 0x83, %r3
	.word 0xc3bad83f  ! 764: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 765: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd00ac01f  ! 766: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xd1bad93f  ! 767: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ac01f  ! 768: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1f2d01f  ! 769: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xc642801f  ! 770: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3ba989f  ! 771: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcccad17f  ! 772: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r6
	.word 0xc5ba997f  ! 773: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 774: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba983f  ! 775: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc12a00a  ! 776: LDUH_I	lduh	[%r10 + 0x000a], %r6
	.word 0xc4da901f  ! 777: LDXA_R	ldxa	[%r10, %r31] 0x80, %r2
	.word 0xc25a801f  ! 778: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xd052a018  ! 779: LDSH_I	ldsh	[%r10 + 0x0018], %r8
	.word 0xc652e060  ! 780: LDSH_I	ldsh	[%r11 + 0x0060], %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3ba98bf  ! 781: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 782: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa060  ! 783: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd3ba985f  ! 784: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa060  ! 785: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc922801f  ! 786: STF_R	st	%f4, [%r31, %r10]
	.word 0xc01a801f  ! 787: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xd28a915f  ! 788: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r9
	.word 0xcfba997f  ! 789: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd19ae068  ! 790: LDDFA_I	ldda	[%r11, 0x0068], %f8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc89ae020  ! 791: LDDA_I	ldda	[%r11, + 0x0020] %asi, %r4
	.word 0xc7ba99bf  ! 792: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa068  ! 793: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xc39aa030  ! 794: LDDFA_I	ldda	[%r10, 0x0030], %f1
	.word 0xcfba983f  ! 795: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xced2905f  ! 796: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r7
	.word 0xc60a801f  ! 797: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xcc82905f  ! 798: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r6
	.word 0xcbe2e01f  ! 799: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xc492903f  ! 800: LDUHA_R	lduha	[%r10, %r31] 0x81, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbf2e01f  ! 801: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad99f  ! 802: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc702a058  ! 803: LDF_I	ld	[%r10, 0x0058], %f3
	.word 0xd20aa005  ! 804: LDUB_I	ldub	[%r10 + 0x0005], %r9
	.word 0xc7bad95f  ! 805: STDFA_R	stda	%f3, [%r31, %r11]
TH_LABEL805:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc482a02c  ! 806: LDUWA_I	lduwa	[%r10, + 0x002c] %asi, %r2
	.word 0xcfba981f  ! 807: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 808: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 809: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 810: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL810:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc502a050  ! 811: LDF_I	ld	[%r10, 0x0050], %f2
	.word 0xca5ac01f  ! 812: LDX_R	ldx	[%r11 + %r31], %r5
	.word 0xc492a076  ! 813: LDUHA_I	lduha	[%r10, + 0x0076] %asi, %r2
	.word 0xc68aa017  ! 814: LDUBA_I	lduba	[%r10, + 0x0017] %asi, %r3
	.word 0xd03ae060  ! 815: STD_I	std	%r8, [%r11 + 0x0060]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3bad91f  ! 816: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 817: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xcb02e04c  ! 818: LDF_I	ld	[%r11, 0x004c], %f5
	.word 0xcac2913f  ! 819: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r5
	.word 0xcc02a000  ! 820: LDUW_I	lduw	[%r10 + 0x0000], %r6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3ba987f  ! 821: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc59aa028  ! 822: LDDFA_I	ldda	[%r10, 0x0028], %f2
	.word 0xc5bad9bf  ! 823: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad87f  ! 824: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad87f  ! 825: STDFA_R	stda	%f2, [%r31, %r11]
TH_LABEL825:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xce92a076  ! 826: LDUHA_I	lduha	[%r10, + 0x0076] %asi, %r7
	.word 0xcbbad89f  ! 827: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad97f  ! 828: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd002a070  ! 829: LDUW_I	lduw	[%r10 + 0x0070], %r8
	.word 0xc9bad81f  ! 830: STDFA_R	stda	%f4, [%r31, %r11]
TH_LABEL830:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9f2e01f  ! 831: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 832: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9f2d01f  ! 833: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xcccae072  ! 834: LDSBA_I	ldsba	[%r11, + 0x0072] %asi, %r6
	.word 0xc9baa048  ! 835: STDFA_I	stda	%f4, [0x0048, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7ba989f  ! 836: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc4ca915f  ! 837: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r2
	.word 0xc3e2903f  ! 838: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xd3bae040  ! 839: STDFA_I	stda	%f9, [0x0040, %r11]
	.word 0xc492a00e  ! 840: LDUHA_I	lduha	[%r10, + 0x000e] %asi, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc83ac01f  ! 841: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9e2d13f  ! 842: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc9e2d11f  ! 843: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xd082907f  ! 844: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r8
	.word 0xcd02c01f  ! 845: LDF_R	ld	[%r11, %r31], %f6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc43aa038  ! 846: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc43aa038  ! 847: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc7f2a01f  ! 848: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba993f  ! 849: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcf9aa038  ! 850: LDDFA_I	ldda	[%r10, 0x0038], %f7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbf2e01f  ! 851: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad99f  ! 852: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc282901f  ! 853: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r1
	.word 0xd19ae028  ! 854: LDDFA_I	ldda	[%r11, 0x0028], %f8
	.word 0xd1e2901f  ! 855: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd03aa018  ! 856: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xc2d2915f  ! 857: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r1
	.word 0xc9ba98bf  ! 858: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xce92917f  ! 859: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r7
	.word 0xcccae03d  ! 860: LDSBA_I	ldsba	[%r11, + 0x003d] %asi, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9bad83f  ! 861: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d13f  ! 862: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc9f2d13f  ! 863: CASXA_I	casxa	[%r11] 0x89, %r31, %r4
	.word 0xc83ac01f  ! 864: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9f2d01f  ! 865: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9e2d01f  ! 866: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc682907f  ! 867: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r3
	.word 0xc3e2d03f  ! 868: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xc702801f  ! 869: LDF_R	ld	[%r10, %r31], %f3
	.word 0xcc42c01f  ! 870: LDSW_R	ldsw	[%r11 + %r31], %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5ba98bf  ! 871: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc02801f  ! 872: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xc5f2e01f  ! 873: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2e01f  ! 874: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 875: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc43ac01f  ! 876: STD_R	std	%r2, [%r11 + %r31]
	.word 0xd002801f  ! 877: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xd002a020  ! 878: LDUW_I	lduw	[%r10 + 0x0020], %r8
	.word 0xc882a02c  ! 879: LDUWA_I	lduwa	[%r10, + 0x002c] %asi, %r4
	.word 0xc5e2a01f  ! 880: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc79aa050  ! 881: LDDFA_I	ldda	[%r10, 0x0050], %f3
	.word 0xcc52c01f  ! 882: LDSH_R	ldsh	[%r11 + %r31], %r6
	.word 0xc68aa067  ! 883: LDUBA_I	lduba	[%r10, + 0x0067] %asi, %r3
	.word 0xc5ba981f  ! 884: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 885: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc99aa040  ! 886: LDDFA_I	ldda	[%r10, 0x0040], %f4
	.word 0xd1e2911f  ! 887: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xcc02c01f  ! 888: LDUW_R	lduw	[%r11 + %r31], %r6
	.word 0xc802801f  ! 889: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xc3f2903f  ! 890: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd122801f  ! 891: STF_R	st	%f8, [%r31, %r10]
	.word 0xd3e2a01f  ! 892: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xcec2915f  ! 893: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r7
	.word 0xcadad15f  ! 894: LDXA_R	ldxa	[%r11, %r31] 0x8a, %r5
	.word 0xd3e2d13f  ! 895: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3f2d11f  ! 896: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xd3e2d01f  ! 897: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xcc92901f  ! 898: LDUHA_R	lduha	[%r10, %r31] 0x80, %r6
	.word 0xc882901f  ! 899: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r4
	.word 0xc3f2d11f  ! 900: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
TH_LABEL900:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3f2e01f  ! 901: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad95f  ! 902: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc81ae040  ! 903: LDD_I	ldd	[%r11 + 0x0040], %r4
	.word 0xcc3a801f  ! 904: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc322c01f  ! 905: STF_R	st	%f1, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc83aa060  ! 906: STD_I	std	%r4, [%r10 + 0x0060]
	.word 0xcc4aa016  ! 907: LDSB_I	ldsb	[%r10 + 0x0016], %r6
	.word 0xc81aa010  ! 908: LDD_I	ldd	[%r10 + 0x0010], %r4
	.word 0xc5f2a01f  ! 909: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc882a060  ! 910: LDUWA_I	lduwa	[%r10, + 0x0060] %asi, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc5a801f  ! 911: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xcfbad87f  ! 912: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd2d2d13f  ! 913: LDSHA_R	ldsha	[%r11, %r31] 0x89, %r9
	.word 0xd0d2a062  ! 914: LDSHA_I	ldsha	[%r10, + 0x0062] %asi, %r8
	.word 0xd1f2a01f  ! 915: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1f2a01f  ! 916: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xcbbaa078  ! 917: STDFA_I	stda	%f5, [0x0078, %r10]
	.word 0xd3ba989f  ! 918: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc99aa000  ! 919: LDDFA_I	ldda	[%r10, 0x0000], %f4
	.word 0xc24a801f  ! 920: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc902801f  ! 921: LDF_R	ld	[%r10, %r31], %f4
	.word 0xcfba999f  ! 922: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa000  ! 923: STD_I	std	%r6, [%r10 + 0x0000]
	.word 0xcfbaa058  ! 924: STDFA_I	stda	%f7, [0x0058, %r10]
	.word 0xc7ba983f  ! 925: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc242801f  ! 926: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xc5f2d13f  ! 927: CASXA_I	casxa	[%r11] 0x89, %r31, %r2
	.word 0xc5f2e01f  ! 928: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2e01f  ! 929: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 930: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5bad95f  ! 931: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad91f  ! 932: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad97f  ! 933: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcc9aa010  ! 934: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r6
	.word 0xc7ba987f  ! 935: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7ba981f  ! 936: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc852801f  ! 937: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xd03ac01f  ! 938: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc852a066  ! 939: LDSH_I	ldsh	[%r10 + 0x0066], %r4
	.word 0xc452801f  ! 940: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3ba993f  ! 941: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xce82e008  ! 942: LDUWA_I	lduwa	[%r11, + 0x0008] %asi, %r7
	.word 0xc7bae050  ! 943: STDFA_I	stda	%f3, [0x0050, %r11]
	.word 0xc442e02c  ! 944: LDSW_I	ldsw	[%r11 + 0x002c], %r2
	.word 0xc9e2913f  ! 945: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9e2a01f  ! 946: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba997f  ! 947: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2903f  ! 948: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc01a801f  ! 949: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xc252e06a  ! 950: LDSH_I	ldsh	[%r11 + 0x006a], %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc882a04c  ! 951: LDUWA_I	lduwa	[%r10, + 0x004c] %asi, %r4
	.word 0xcc42801f  ! 952: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xd302801f  ! 953: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd202a038  ! 954: LDUW_I	lduw	[%r10 + 0x0038], %r9
	.word 0xc7ba995f  ! 955: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcd02e050  ! 956: LDF_I	ld	[%r11, 0x0050], %f6
	.word 0xc7bad93f  ! 957: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae070  ! 958: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xc7e2e01f  ! 959: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc59aa048  ! 960: LDDFA_I	ldda	[%r10, 0x0048], %f2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3ba983f  ! 961: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 962: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcdbae050  ! 963: STDFA_I	stda	%f6, [0x0050, %r11]
	.word 0xc7ba999f  ! 964: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 965: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7ba981f  ! 966: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2901f  ! 967: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba991f  ! 968: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc39ae030  ! 969: LDDFA_I	ldda	[%r11, 0x0030], %f1
	.word 0xcdf2a01f  ! 970: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdf2901f  ! 971: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba981f  ! 972: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd052a04a  ! 973: LDSH_I	ldsh	[%r10 + 0x004a], %r8
	.word 0xc43aa020  ! 974: STD_I	std	%r2, [%r10 + 0x0020]
	.word 0xc7ba99bf  ! 975: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7ba997f  ! 976: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc4da901f  ! 977: LDXA_R	ldxa	[%r10, %r31] 0x80, %r2
	.word 0xc9ba991f  ! 978: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa020  ! 979: STD_I	std	%r4, [%r10 + 0x0020]
	.word 0xc65aa068  ! 980: LDX_I	ldx	[%r10 + 0x0068], %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc2c2a044  ! 981: LDSWA_I	ldswa	[%r10, + 0x0044] %asi, %r1
	.word 0xcff2d03f  ! 982: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xcfbad99f  ! 983: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d01f  ! 984: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xc722801f  ! 985: STF_R	st	%f3, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7f2e01f  ! 986: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad99f  ! 987: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcc1ae078  ! 988: LDD_I	ldd	[%r11 + 0x0078], %r6
	.word 0xc7f2e01f  ! 989: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad81f  ! 990: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7f2d01f  ! 991: CASXA_I	casxa	[%r11] 0x80, %r31, %r3
	.word 0xc3bae040  ! 992: STDFA_I	stda	%f1, [0x0040, %r11]
	.word 0xc39aa018  ! 993: LDDFA_I	ldda	[%r10, 0x0018], %f1
	.word 0xc812a06c  ! 994: LDUH_I	lduh	[%r10 + 0x006c], %r4
	.word 0xd122c01f  ! 995: STF_R	st	%f8, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1ba99bf  ! 996: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc28a903f  ! 997: LDUBA_R	lduba	[%r10, %r31] 0x81, %r1
	.word 0xc84a801f  ! 998: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xd3ba991f  ! 999: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2903f  ! 1000: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	subcc %r30, 1, %r30
	bnz  TH7_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	add	%g0,	0x1,	%r30
TH6_LOOP_START:
	.word 0xd1f2a01f  ! 1: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba997f  ! 2: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc64aa01c  ! 3: LDSB_I	ldsb	[%r10 + 0x001c], %r3
	.word 0xd302c01f  ! 4: LDF_R	ld	[%r11, %r31], %f9
	.word 0xce5ac01f  ! 5: LDX_R	ldx	[%r11 + %r31], %r7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5e2911f  ! 6: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5ba987f  ! 7: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc702e048  ! 8: LDF_I	ld	[%r11, 0x0048], %f3
	.word 0xcfe2e01f  ! 9: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xd1baa008  ! 10: STDFA_I	stda	%f8, [0x0008, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcb9aa078  ! 11: LDDFA_I	ldda	[%r10, 0x0078], %f5
	.word 0xc7bad99f  ! 12: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 13: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7e2e01f  ! 14: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc8ca917f  ! 15: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc202a04c  ! 16: LDUW_I	lduw	[%r10 + 0x004c], %r1
	.word 0xc5e2911f  ! 17: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5e2901f  ! 18: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba993f  ! 19: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba983f  ! 20: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5f2901f  ! 21: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2a01f  ! 22: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2a01f  ! 23: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc01a801f  ! 24: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xc03a801f  ! 25: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3ba98bf  ! 26: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 27: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xca02e064  ! 28: LDUW_I	lduw	[%r11 + 0x0064], %r5
	.word 0xc292913f  ! 29: LDUHA_R	lduha	[%r10, %r31] 0x89, %r1
	.word 0xd1f2e01f  ! 30: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1bad81f  ! 31: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcb02e030  ! 32: LDF_I	ld	[%r11, 0x0030], %f5
	.word 0xc3e2901f  ! 33: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3e2a01f  ! 34: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc7baa068  ! 35: STDFA_I	stda	%f3, [0x0068, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc43ac01f  ! 36: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 37: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad97f  ! 38: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcd02801f  ! 39: LDF_R	ld	[%r10, %r31], %f6
	.word 0xcac2905f  ! 40: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc64aa008  ! 41: LDSB_I	ldsb	[%r10 + 0x0008], %r3
	.word 0xd1ba993f  ! 42: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc522c01f  ! 43: STF_R	st	%f2, [%r31, %r11]
	.word 0xc3ba99bf  ! 44: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcf02801f  ! 45: LDF_R	ld	[%r10, %r31], %f7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1bad95f  ! 46: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc88ae03f  ! 47: LDUBA_I	lduba	[%r11, + 0x003f] %asi, %r4
	.word 0xd0d2903f  ! 48: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r8
	.word 0xc3e2911f  ! 49: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xd092a04a  ! 50: LDUHA_I	lduha	[%r10, + 0x004a] %asi, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba983f  ! 51: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba993f  ! 52: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd08ae044  ! 53: LDUBA_I	lduba	[%r11, + 0x0044] %asi, %r8
	.word 0xd3ba997f  ! 54: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba997f  ! 55: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc9aa000  ! 56: LDDA_I	ldda	[%r10, + 0x0000] %asi, %r6
	.word 0xc902801f  ! 57: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc5e2e01f  ! 58: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xcc8aa03a  ! 59: LDUBA_I	lduba	[%r10, + 0x003a] %asi, %r6
	.word 0xc7e2a01f  ! 60: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7e2911f  ! 61: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xc902c01f  ! 62: LDF_R	ld	[%r11, %r31], %f4
	.word 0xc7f2e01f  ! 63: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7f2e01f  ! 64: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad97f  ! 65: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7e2e01f  ! 66: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc282903f  ! 67: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r1
	.word 0xc3ba985f  ! 68: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 69: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 70: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3f2a01f  ! 71: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc6caa064  ! 72: LDSBA_I	ldsba	[%r10, + 0x0064] %asi, %r3
	.word 0xc3e2911f  ! 73: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xc3ba99bf  ! 74: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc6c2913f  ! 75: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3bad95f  ! 76: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d01f  ! 77: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3e2e01f  ! 78: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad9bf  ! 79: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ae040  ! 80: STD_I	std	%r0, [%r11 + 0x0040]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc03ac01f  ! 81: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc81aa070  ! 82: LDD_I	ldd	[%r10 + 0x0070], %r4
	.word 0xcad2903f  ! 83: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r5
	.word 0xc3f2903f  ! 84: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc3e2a01f  ! 85: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc39aa060  ! 86: LDDFA_I	ldda	[%r10, 0x0060], %f1
	.word 0xc652c01f  ! 87: LDSH_R	ldsh	[%r11 + %r31], %r3
	.word 0xc5f2d01f  ! 88: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc5e2e01f  ! 89: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5e2d11f  ! 90: CASA_I	casa	[%r11] 0x88, %r31, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc442c01f  ! 91: LDSW_R	ldsw	[%r11 + %r31], %r2
	.word 0xc7bad87f  ! 92: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc922801f  ! 93: STF_R	st	%f4, [%r31, %r10]
	.word 0xcc3aa000  ! 94: STD_I	std	%r6, [%r10 + 0x0000]
	.word 0xc85ac01f  ! 95: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5bad81f  ! 96: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd212c01f  ! 97: LDUH_R	lduh	[%r11 + %r31], %r9
	.word 0xc302c01f  ! 98: LDF_R	ld	[%r11, %r31], %f1
	.word 0xd3ba985f  ! 99: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 100: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd03a801f  ! 101: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc652801f  ! 102: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xcbe2e01f  ! 103: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad89f  ! 104: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad9bf  ! 105: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbbad97f  ! 106: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d03f  ! 107: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xc83ae000  ! 108: STD_I	std	%r4, [%r11 + 0x0000]
	.word 0xc902801f  ! 109: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc9f2913f  ! 110: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9e2a01f  ! 111: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2a01f  ! 112: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2a01f  ! 113: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2911f  ! 114: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc83aa000  ! 115: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9e2a01f  ! 116: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba991f  ! 117: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 118: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2901f  ! 119: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba99bf  ! 120: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc8c2915f  ! 121: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r4
	.word 0xc9f2e01f  ! 122: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 123: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad8bf  ! 124: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcf22801f  ! 125: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3f2911f  ! 126: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd3ba98bf  ! 127: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 128: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba995f  ! 129: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 130: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3ba981f  ! 131: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba991f  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc88a913f  ! 133: LDUBA_R	lduba	[%r10, %r31] 0x89, %r4
	.word 0xd3ba983f  ! 134: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 135: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcedaa038  ! 136: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r7
	.word 0xcc5a801f  ! 137: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xc9ba989f  ! 138: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc2c2905f  ! 139: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r1
	.word 0xc7bad87f  ! 140: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7bad81f  ! 141: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad9bf  ! 142: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 143: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xd202e054  ! 144: LDUW_I	lduw	[%r11 + 0x0054], %r9
	.word 0xd1f2d11f  ! 145: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1f2e01f  ! 146: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1e2d11f  ! 147: CASA_I	casa	[%r11] 0x88, %r31, %r8
	.word 0xc39aa010  ! 148: LDDFA_I	ldda	[%r10, 0x0010], %f1
	.word 0xc5f2d01f  ! 149: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc5bad93f  ! 150: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xce8aa070  ! 151: LDUBA_I	lduba	[%r10, + 0x0070] %asi, %r7
	.word 0xcdbad87f  ! 152: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad95f  ! 153: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc89ae070  ! 154: LDDA_I	ldda	[%r11, + 0x0070] %asi, %r4
	.word 0xc8cad01f  ! 155: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc8caa042  ! 156: LDSBA_I	ldsba	[%r10, + 0x0042] %asi, %r4
	.word 0xd3e2901f  ! 157: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd092905f  ! 158: LDUHA_R	lduha	[%r10, %r31] 0x82, %r8
	.word 0xd08aa037  ! 159: LDUBA_I	lduba	[%r10, + 0x0037] %asi, %r8
	.word 0xce8ad01f  ! 160: LDUBA_R	lduba	[%r11, %r31] 0x80, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfba995f  ! 161: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca4aa04f  ! 162: LDSB_I	ldsb	[%r10 + 0x004f], %r5
	.word 0xd3ba987f  ! 163: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd242801f  ! 164: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xcde2d11f  ! 165: CASA_I	casa	[%r11] 0x88, %r31, %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcd9aa008  ! 166: LDDFA_I	ldda	[%r10, 0x0008], %f6
	.word 0xc83aa070  ! 167: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xcbba981f  ! 168: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc2c2901f  ! 169: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r1
	.word 0xce92d01f  ! 170: LDUHA_R	lduha	[%r11, %r31] 0x80, %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7e2d03f  ! 171: CASA_I	casa	[%r11] 0x81, %r31, %r3
	.word 0xc7bad81f  ! 172: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae070  ! 173: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xc43ae070  ! 174: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xcb9aa040  ! 175: LDDFA_I	ldda	[%r10, 0x0040], %f5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1ba999f  ! 176: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc252a038  ! 177: LDSH_I	ldsh	[%r10 + 0x0038], %r1
	.word 0xce02e004  ! 178: LDUW_I	lduw	[%r11 + 0x0004], %r7
	.word 0xd39ae040  ! 179: LDDFA_I	ldda	[%r11, 0x0040], %f9
	.word 0xcdf2e01f  ! 180: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xce42e010  ! 181: LDSW_I	ldsw	[%r11 + 0x0010], %r7
	.word 0xc722801f  ! 182: STF_R	st	%f3, [%r31, %r10]
	.word 0xc642a014  ! 183: LDSW_I	ldsw	[%r10 + 0x0014], %r3
	.word 0xd3ba98bf  ! 184: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 185: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3e2913f  ! 186: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba995f  ! 187: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xca5aa028  ! 188: LDX_I	ldx	[%r10 + 0x0028], %r5
	.word 0xc5e2901f  ! 189: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xcb9aa010  ! 190: LDDFA_I	ldda	[%r10, 0x0010], %f5
TH_LABEL190:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdf2901f  ! 191: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba993f  ! 192: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba991f  ! 193: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd08a903f  ! 194: LDUBA_R	lduba	[%r10, %r31] 0x81, %r8
	.word 0xcbe2a01f  ! 195: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbba989f  ! 196: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc01aa078  ! 197: LDD_I	ldd	[%r10 + 0x0078], %r0
	.word 0xc59aa070  ! 198: LDDFA_I	ldda	[%r10, 0x0070], %f2
	.word 0xca92d07f  ! 199: LDUHA_R	lduha	[%r11, %r31] 0x83, %r5
	.word 0xcc82a000  ! 200: LDUWA_I	lduwa	[%r10, + 0x0000] %asi, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5ba997f  ! 201: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc452801f  ! 202: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xd3e2d03f  ! 203: CASA_I	casa	[%r11] 0x81, %r31, %r9
	.word 0xd3f2e01f  ! 204: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad91f  ! 205: STDFA_R	stda	%f9, [%r31, %r11]
TH_LABEL205:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd282d03f  ! 206: LDUWA_R	lduwa	[%r11, %r31] 0x81, %r9
	.word 0xcfe2d13f  ! 207: CASA_I	casa	[%r11] 0x89, %r31, %r7
	.word 0xcc3ac01f  ! 208: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcfe2d01f  ! 209: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcc3ac01f  ! 210: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfbad81f  ! 211: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc212801f  ! 212: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xc7ba989f  ! 213: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc20a801f  ! 214: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xd3bad87f  ! 215: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3bad85f  ! 216: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2d11f  ! 217: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xd3bad89f  ! 218: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae018  ! 219: STD_I	std	%r8, [%r11 + 0x0018]
	.word 0xcf02801f  ! 220: LDF_R	ld	[%r10, %r31], %f7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc4aa027  ! 221: LDSB_I	ldsb	[%r10 + 0x0027], %r6
	.word 0xc3e2a01f  ! 222: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xd00a801f  ! 223: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xd20ac01f  ! 224: LDUB_R	ldub	[%r11 + %r31], %r9
	.word 0xc5e2a01f  ! 225: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5ba985f  ! 226: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba98bf  ! 227: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa048  ! 228: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc43a801f  ! 229: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba993f  ! 230: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5f2a01f  ! 231: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2901f  ! 232: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5e2a01f  ! 233: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc302801f  ! 234: LDF_R	ld	[%r10, %r31], %f1
	.word 0xd3ba987f  ! 235: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3ba985f  ! 236: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2911f  ! 237: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xd3f2a01f  ! 238: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc302e038  ! 239: LDF_I	ld	[%r11, 0x0038], %f1
	.word 0xc292917f  ! 240: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd03a801f  ! 241: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba985f  ! 242: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc922801f  ! 243: STF_R	st	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 244: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc322c01f  ! 245: STF_R	st	%f1, [%r31, %r11]
TH_LABEL245:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd03aa060  ! 246: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd03a801f  ! 247: STD_R	std	%r8, [%r10 + %r31]
	.word 0xcc92901f  ! 248: LDUHA_R	lduha	[%r10, %r31] 0x80, %r6
	.word 0xcc4ac01f  ! 249: LDSB_R	ldsb	[%r11 + %r31], %r6
	.word 0xcf9ae020  ! 250: LDDFA_I	ldda	[%r11, 0x0020], %f7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc8c2e018  ! 251: LDSWA_I	ldswa	[%r11, + 0x0018] %asi, %r4
	.word 0xc5e2a01f  ! 252: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5f2913f  ! 253: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xc5e2a01f  ! 254: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 255: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc9aa070  ! 256: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r6
	.word 0xc9ba981f  ! 257: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc09ae018  ! 258: LDDA_I	ldda	[%r11, + 0x0018] %asi, %r0
	.word 0xcbba99bf  ! 259: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd322801f  ! 260: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdbad97f  ! 261: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd2c2a078  ! 262: LDSWA_I	ldswa	[%r10, + 0x0078] %asi, %r9
	.word 0xc9ba987f  ! 263: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba989f  ! 264: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 265: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9f2a01f  ! 266: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2911f  ! 267: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xd01aa020  ! 268: LDD_I	ldd	[%r10 + 0x0020], %r8
	.word 0xd1ba99bf  ! 269: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 270: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcd02c01f  ! 271: LDF_R	ld	[%r11, %r31], %f6
	.word 0xc7ba995f  ! 272: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 273: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 274: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7f2901f  ! 275: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7ba98bf  ! 276: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc85aa048  ! 277: LDX_I	ldx	[%r10 + 0x0048], %r4
	.word 0xcd9aa000  ! 278: LDDFA_I	ldda	[%r10, 0x0000], %f6
	.word 0xcc52801f  ! 279: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xc25a801f  ! 280: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3f2e01f  ! 281: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xced2905f  ! 282: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r7
	.word 0xcac2d15f  ! 283: LDSWA_R	ldswa	[%r11, %r31] 0x8a, %r5
	.word 0xcbe2903f  ! 284: CASA_I	casa	[%r10] 0x81, %r31, %r5
	.word 0xc49aa070  ! 285: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7bad89f  ! 286: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae038  ! 287: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xc492a04e  ! 288: LDUHA_I	lduha	[%r10, + 0x004e] %asi, %r2
	.word 0xc5f2e01f  ! 289: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2d01f  ! 290: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5bad83f  ! 291: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad87f  ! 292: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc302c01f  ! 293: LDF_R	ld	[%r11, %r31], %f1
	.word 0xc922c01f  ! 294: STF_R	st	%f4, [%r31, %r11]
	.word 0xc302a008  ! 295: LDF_I	ld	[%r10, 0x0008], %f1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7bae060  ! 296: STDFA_I	stda	%f3, [0x0060, %r11]
	.word 0xc802e03c  ! 297: LDUW_I	lduw	[%r11 + 0x003c], %r4
	.word 0xc3ba989f  ! 298: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 299: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xce8aa01d  ! 300: LDUBA_I	lduba	[%r10, + 0x001d] %asi, %r7
TH_LABEL300:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc202a05c  ! 301: LDUW_I	lduw	[%r10 + 0x005c], %r1
	.word 0xd03a801f  ! 302: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc652801f  ! 303: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xc5ba991f  ! 304: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc92901f  ! 305: LDUHA_R	lduha	[%r10, %r31] 0x80, %r6
TH_LABEL305:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdf2a01f  ! 306: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2a01f  ! 307: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xca5ae038  ! 308: LDX_I	ldx	[%r11 + 0x0038], %r5
	.word 0xd2daa060  ! 309: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r9
	.word 0xca8aa053  ! 310: LDUBA_I	lduba	[%r10, + 0x0053] %asi, %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd102e05c  ! 311: LDF_I	ld	[%r11, 0x005c], %f8
	.word 0xcfba983f  ! 312: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba98bf  ! 313: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa038  ! 314: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xd052c01f  ! 315: LDSH_R	ldsh	[%r11 + %r31], %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xca02801f  ! 316: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xce0a801f  ! 317: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xc89ae038  ! 318: LDDA_I	ldda	[%r11, + 0x0038] %asi, %r4
	.word 0xc83ac01f  ! 319: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad89f  ! 320: STDFA_R	stda	%f5, [%r31, %r11]
TH_LABEL320:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcadad11f  ! 321: LDXA_R	ldxa	[%r11, %r31] 0x88, %r5
	.word 0xcf22801f  ! 322: STF_R	st	%f7, [%r31, %r10]
	.word 0xccdae008  ! 323: LDXA_I	ldxa	[%r11, + 0x0008] %asi, %r6
	.word 0xd1ba993f  ! 324: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc902801f  ! 325: LDF_R	ld	[%r10, %r31], %f4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc3a801f  ! 326: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc92905f  ! 327: LDUHA_R	lduha	[%r10, %r31] 0x82, %r6
	.word 0xcdf2913f  ! 328: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcdf2911f  ! 329: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xccda913f  ! 330: LDXA_R	ldxa	[%r10, %r31] 0x89, %r6
TH_LABEL330:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3bad99f  ! 331: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad9bf  ! 332: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad95f  ! 333: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc642801f  ! 334: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc7ba989f  ! 335: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc802e07c  ! 336: LDUW_I	lduw	[%r11 + 0x007c], %r4
	.word 0xc922801f  ! 337: STF_R	st	%f4, [%r31, %r10]
	.word 0xcfbae040  ! 338: STDFA_I	stda	%f7, [0x0040, %r11]
	.word 0xcfbad81f  ! 339: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd052c01f  ! 340: LDSH_R	ldsh	[%r11 + %r31], %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd28aa064  ! 341: LDUBA_I	lduba	[%r10, + 0x0064] %asi, %r9
	.word 0xd1bad9bf  ! 342: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d13f  ! 343: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xd1bad85f  ! 344: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd28aa04d  ! 345: LDUBA_I	lduba	[%r10, + 0x004d] %asi, %r9
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc2d2e072  ! 346: LDSHA_I	ldsha	[%r11, + 0x0072] %asi, %r1
	.word 0xcac2901f  ! 347: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r5
	.word 0xcfbad85f  ! 348: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd39aa038  ! 349: LDDFA_I	ldda	[%r10, 0x0038], %f9
	.word 0xc8d2e05c  ! 350: LDSHA_I	ldsha	[%r11, + 0x005c] %asi, %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcb02e044  ! 351: LDF_I	ld	[%r11, 0x0044], %f5
	.word 0xd052e05e  ! 352: LDSH_I	ldsh	[%r11 + 0x005e], %r8
	.word 0xc9f2e01f  ! 353: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc99aa078  ! 354: LDDFA_I	ldda	[%r10, 0x0078], %f4
	.word 0xcdba995f  ! 355: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdba981f  ! 356: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd08a917f  ! 357: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r8
	.word 0xd3bad9bf  ! 358: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad89f  ! 359: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 360: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3bad83f  ! 361: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcfbae060  ! 362: STDFA_I	stda	%f7, [0x0060, %r11]
	.word 0xcff2901f  ! 363: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcfe2a01f  ! 364: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd28a911f  ! 365: LDUBA_R	lduba	[%r10, %r31] 0x88, %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfba991f  ! 366: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba99bf  ! 367: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 368: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcff2913f  ! 369: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xcfba999f  ! 370: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcff2901f  ! 371: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcfba981f  ! 372: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd2dae060  ! 373: LDXA_I	ldxa	[%r11, + 0x0060] %asi, %r9
	.word 0xc3f2d13f  ! 374: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xced2901f  ! 375: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc39ae010  ! 376: LDDFA_I	ldda	[%r11, 0x0010], %f1
	.word 0xcc3ae048  ! 377: STD_I	std	%r6, [%r11 + 0x0048]
	.word 0xcc3ae048  ! 378: STD_I	std	%r6, [%r11 + 0x0048]
	.word 0xc64aa01c  ! 379: LDSB_I	ldsb	[%r10 + 0x001c], %r3
	.word 0xc722801f  ! 380: STF_R	st	%f3, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1ba981f  ! 381: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc502801f  ! 382: LDF_R	ld	[%r10, %r31], %f2
	.word 0xd1ba995f  ! 383: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba997f  ! 384: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba985f  ! 385: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1ba983f  ! 386: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 387: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc39aa010  ! 388: LDDFA_I	ldda	[%r10, 0x0010], %f1
	.word 0xd25ac01f  ! 389: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xc692901f  ! 390: LDUHA_R	lduha	[%r10, %r31] 0x80, %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd102a020  ! 391: LDF_I	ld	[%r10, 0x0020], %f8
	.word 0xd242a030  ! 392: LDSW_I	ldsw	[%r10 + 0x0030], %r9
	.word 0xc83ae040  ! 393: STD_I	std	%r4, [%r11 + 0x0040]
	.word 0xc9bad9bf  ! 394: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcf02801f  ! 395: LDF_R	ld	[%r10, %r31], %f7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc83a801f  ! 396: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd19aa068  ! 397: LDDFA_I	ldda	[%r10, 0x0068], %f8
	.word 0xcfba997f  ! 398: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 399: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xd24ae038  ! 400: LDSB_I	ldsb	[%r11 + 0x0038], %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc68a901f  ! 401: LDUBA_R	lduba	[%r10, %r31] 0x80, %r3
	.word 0xc3ba999f  ! 402: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc902a020  ! 403: LDF_I	ld	[%r10, 0x0020], %f4
	.word 0xc3bae060  ! 404: STDFA_I	stda	%f1, [0x0060, %r11]
	.word 0xc83a801f  ! 405: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9ba989f  ! 406: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 407: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcf02801f  ! 408: LDF_R	ld	[%r10, %r31], %f7
	.word 0xd1ba98bf  ! 409: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba997f  ! 410: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1f2901f  ! 411: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xcc8aa046  ! 412: LDUBA_I	lduba	[%r10, + 0x0046] %asi, %r6
	.word 0xc5f2d01f  ! 413: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xd04a801f  ! 414: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xd3ba989f  ! 415: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL415:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd03aa060  ! 416: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd3ba991f  ! 417: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 418: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd03aa060  ! 419: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xce42e008  ! 420: LDSW_I	ldsw	[%r11 + 0x0008], %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1bad99f  ! 421: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 422: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 423: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d11f  ! 424: CASA_I	casa	[%r11] 0x88, %r31, %r8
	.word 0xccc2913f  ! 425: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc602a050  ! 426: LDUW_I	lduw	[%r10 + 0x0050], %r3
	.word 0xc202801f  ! 427: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xc88ad17f  ! 428: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r4
	.word 0xc5ba985f  ! 429: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2913f  ! 430: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5ba997f  ! 431: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcf22801f  ! 432: STF_R	st	%f7, [%r31, %r10]
	.word 0xd122c01f  ! 433: STF_R	st	%f8, [%r31, %r11]
	.word 0xcbbaa068  ! 434: STDFA_I	stda	%f5, [0x0068, %r10]
	.word 0xcdba983f  ! 435: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc3aa038  ! 436: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xc99ae040  ! 437: LDDFA_I	ldda	[%r11, 0x0040], %f4
	.word 0xd2caa05c  ! 438: LDSBA_I	ldsba	[%r10, + 0x005c] %asi, %r9
	.word 0xc5e2e01f  ! 439: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad81f  ! 440: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5f2d01f  ! 441: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xd102e00c  ! 442: LDF_I	ld	[%r11, 0x000c], %f8
	.word 0xc9ba989f  ! 443: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc8aa034  ! 444: LDUBA_I	lduba	[%r10, + 0x0034] %asi, %r6
	.word 0xc3bad81f  ! 445: STDFA_R	stda	%f1, [%r31, %r11]
TH_LABEL445:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3e2d11f  ! 446: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xcd02801f  ! 447: LDF_R	ld	[%r10, %r31], %f6
	.word 0xd3f2a01f  ! 448: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xcc1a801f  ! 449: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc03aa008  ! 450: STD_I	std	%r0, [%r10 + 0x0008]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3f2901f  ! 451: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc5baa078  ! 452: STDFA_I	stda	%f2, [0x0078, %r10]
	.word 0xc302a004  ! 453: LDF_I	ld	[%r10, 0x0004], %f1
	.word 0xc7ba985f  ! 454: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 455: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7e2913f  ! 456: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc7f2913f  ! 457: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba981f  ! 458: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc40ac01f  ! 459: LDUB_R	ldub	[%r11 + %r31], %r2
	.word 0xd1ba999f  ! 460: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1ba991f  ! 461: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 462: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2913f  ! 463: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd1f2901f  ! 464: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1f2903f  ! 465: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
TH_LABEL465:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1f2a01f  ! 466: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc6da915f  ! 467: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r3
	.word 0xc5ba985f  ! 468: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 469: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 470: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc79aa008  ! 471: LDDFA_I	ldda	[%r10, 0x0008], %f3
	.word 0xd1e2901f  ! 472: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd39aa050  ! 473: LDDFA_I	ldda	[%r10, 0x0050], %f9
	.word 0xd1bad89f  ! 474: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2e01f  ! 475: CASXA_R	casxa	[%r11]%asi, %r31, %r8
TH_LABEL475:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc902a028  ! 476: LDF_I	ld	[%r10, 0x0028], %f4
	.word 0xd1ba98bf  ! 477: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 478: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 479: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc282d13f  ! 480: LDUWA_R	lduwa	[%r11, %r31] 0x89, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9f2a01f  ! 481: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xd122801f  ! 482: STF_R	st	%f8, [%r31, %r10]
	.word 0xc44ac01f  ! 483: LDSB_R	ldsb	[%r11 + %r31], %r2
	.word 0xcad2e06e  ! 484: LDSHA_I	ldsha	[%r11, + 0x006e] %asi, %r5
	.word 0xd302801f  ! 485: LDF_R	ld	[%r10, %r31], %f9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc902a034  ! 486: LDF_I	ld	[%r10, 0x0034], %f4
	.word 0xc9ba981f  ! 487: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba987f  ! 488: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc502e070  ! 489: LDF_I	ld	[%r11, 0x0070], %f2
	.word 0xcc3a801f  ! 490: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xca82d17f  ! 491: LDUWA_R	lduwa	[%r11, %r31] 0x8b, %r5
	.word 0xcdba995f  ! 492: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 493: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba997f  ! 494: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 495: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbbae048  ! 496: STDFA_I	stda	%f5, [0x0048, %r11]
	.word 0xc612801f  ! 497: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xd3ba999f  ! 498: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 499: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2a01f  ! 500: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xce5aa030  ! 501: LDX_I	ldx	[%r10 + 0x0030], %r7
	.word 0xce92903f  ! 502: LDUHA_R	lduha	[%r10, %r31] 0x81, %r7
	.word 0xcbf2903f  ! 503: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xcbf2a01f  ! 504: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba987f  ! 505: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbf2a01f  ! 506: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2901f  ! 507: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbba993f  ! 508: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd39aa060  ! 509: LDDFA_I	ldda	[%r10, 0x0060], %f9
	.word 0xcc9ae008  ! 510: LDDA_I	ldda	[%r11, + 0x0008] %asi, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc452801f  ! 511: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xc43a801f  ! 512: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba981f  ! 513: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcd02c01f  ! 514: LDF_R	ld	[%r11, %r31], %f6
	.word 0xd0d2a078  ! 515: LDSHA_I	ldsha	[%r10, + 0x0078] %asi, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbba999f  ! 516: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba98bf  ! 517: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 518: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc2ca901f  ! 519: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r1
	.word 0xd2d2915f  ! 520: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcb22801f  ! 521: STF_R	st	%f5, [%r31, %r10]
	.word 0xce02c01f  ! 522: LDUW_R	lduw	[%r11 + %r31], %r7
	.word 0xcdbaa040  ! 523: STDFA_I	stda	%f6, [0x0040, %r10]
	.word 0xc3ba985f  ! 524: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa028  ! 525: STD_I	std	%r0, [%r10 + 0x0028]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xca42c01f  ! 526: LDSW_R	ldsw	[%r11 + %r31], %r5
	.word 0xc612a01e  ! 527: LDUH_I	lduh	[%r10 + 0x001e], %r3
	.word 0xc9f2a01f  ! 528: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc482a028  ! 529: LDUWA_I	lduwa	[%r10, + 0x0028] %asi, %r2
	.word 0xcbbae020  ! 530: STDFA_I	stda	%f5, [0x0020, %r11]
TH_LABEL530:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd102801f  ! 531: LDF_R	ld	[%r10, %r31], %f8
	.word 0xcdbad87f  ! 532: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xccdae028  ! 533: LDXA_I	ldxa	[%r11, + 0x0028] %asi, %r6
	.word 0xc9ba981f  ! 534: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 535: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xce52801f  ! 536: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xcc3aa070  ! 537: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcfba983f  ! 538: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2911f  ! 539: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xc85a801f  ! 540: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9e2913f  ! 541: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xccd2d01f  ! 542: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r6
	.word 0xc902a068  ! 543: LDF_I	ld	[%r10, 0x0068], %f4
	.word 0xcbba997f  ! 544: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc452801f  ! 545: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc3a801f  ! 546: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2a01f  ! 547: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba985f  ! 548: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 549: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2901f  ! 550: CASA_I	casa	[%r10] 0x80, %r31, %r7
TH_LABEL550:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfe2a01f  ! 551: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba99bf  ! 552: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd252801f  ! 553: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xd04a801f  ! 554: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xce42a010  ! 555: LDSW_I	ldsw	[%r10 + 0x0010], %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc2daa030  ! 556: LDXA_I	ldxa	[%r10, + 0x0030] %asi, %r1
	.word 0xced2a076  ! 557: LDSHA_I	ldsha	[%r10, + 0x0076] %asi, %r7
	.word 0xc24ae04c  ! 558: LDSB_I	ldsb	[%r11 + 0x004c], %r1
	.word 0xc8ca901f  ! 559: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r4
	.word 0xc5f2a01f  ! 560: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcedad05f  ! 561: LDXA_R	ldxa	[%r11, %r31] 0x82, %r7
	.word 0xc41aa068  ! 562: LDD_I	ldd	[%r10 + 0x0068], %r2
	.word 0xd3ba993f  ! 563: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2911f  ! 564: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xcb22801f  ! 565: STF_R	st	%f5, [%r31, %r10]
TH_LABEL565:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd03ac01f  ! 566: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2e01f  ! 567: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad89f  ! 568: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad97f  ! 569: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d01f  ! 570: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc522801f  ! 571: STF_R	st	%f2, [%r31, %r10]
	.word 0xcbbad93f  ! 572: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc6caa06d  ! 573: LDSBA_I	ldsba	[%r10, + 0x006d] %asi, %r3
	.word 0xcde2a01f  ! 574: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2913f  ! 575: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc252801f  ! 576: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xc702801f  ! 577: LDF_R	ld	[%r10, %r31], %f3
	.word 0xd1f2a01f  ! 578: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xcf9ae000  ! 579: LDDFA_I	ldda	[%r11, 0x0000], %f7
	.word 0xc5e2e01f  ! 580: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc43ae030  ! 581: STD_I	std	%r2, [%r11 + 0x0030]
	.word 0xc5bad97f  ! 582: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2d01f  ! 583: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xcc0a801f  ! 584: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xcf22801f  ! 585: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3f2901f  ! 586: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc03aa030  ! 587: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba99bf  ! 588: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc4ca915f  ! 589: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r2
	.word 0xd252a042  ! 590: LDSH_I	ldsh	[%r10 + 0x0042], %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbba999f  ! 591: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 592: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xc4c2d03f  ! 593: LDSWA_R	ldswa	[%r11, %r31] 0x81, %r2
	.word 0xcfba997f  ! 594: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 595: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xca42e01c  ! 596: LDSW_I	ldsw	[%r11 + 0x001c], %r5
	.word 0xc412a064  ! 597: LDUH_I	lduh	[%r10 + 0x0064], %r2
	.word 0xd1e2d01f  ! 598: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xd1e2e01f  ! 599: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1f2e01f  ! 600: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd03ae070  ! 601: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xcf9ae008  ! 602: LDDFA_I	ldda	[%r11, 0x0008], %f7
	.word 0xc212e05e  ! 603: LDUH_I	lduh	[%r11 + 0x005e], %r1
	.word 0xc812801f  ! 604: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xd3ba989f  ! 605: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3ba991f  ! 606: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 607: STD_R	std	%r8, [%r10 + %r31]
	.word 0xca12801f  ! 608: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xc2cae032  ! 609: LDSBA_I	ldsba	[%r11, + 0x0032] %asi, %r1
	.word 0xc802801f  ! 610: LDUW_R	lduw	[%r10 + %r31], %r4
TH_LABEL610:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc52801f  ! 611: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xd3ba993f  ! 612: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 613: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 614: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3f2a01f  ! 615: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3ba981f  ! 616: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc2c2a024  ! 617: LDSWA_I	ldswa	[%r10, + 0x0024] %asi, %r1
	.word 0xc9e2a01f  ! 618: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba987f  ! 619: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 620: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc83a801f  ! 621: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba995f  ! 622: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2911f  ! 623: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc9e2a01f  ! 624: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc60a801f  ! 625: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3e2901f  ! 626: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3e2903f  ! 627: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba991f  ! 628: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba987f  ! 629: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc41a801f  ! 630: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7ba983f  ! 631: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 632: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 633: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba999f  ! 634: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xca92e012  ! 635: LDUHA_I	lduha	[%r11, + 0x0012] %asi, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbba985f  ! 636: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba997f  ! 637: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba987f  ! 638: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xca12a04c  ! 639: LDUH_I	lduh	[%r10 + 0x004c], %r5
	.word 0xce4a801f  ! 640: LDSB_R	ldsb	[%r10 + %r31], %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfba993f  ! 641: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2903f  ! 642: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcfba995f  ! 643: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcb02801f  ! 644: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc5e2913f  ! 645: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9baa050  ! 646: STDFA_I	stda	%f4, [0x0050, %r10]
	.word 0xc7baa048  ! 647: STDFA_I	stda	%f3, [0x0048, %r10]
	.word 0xd3e2a01f  ! 648: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba999f  ! 649: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 650: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3f2911f  ! 651: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd03a801f  ! 652: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba983f  ! 653: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc902a01c  ! 654: LDF_I	ld	[%r10, 0x001c], %f4
	.word 0xc4c2915f  ! 655: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc6d2e03c  ! 656: LDSHA_I	ldsha	[%r11, + 0x003c] %asi, %r3
	.word 0xc43a801f  ! 657: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa048  ! 658: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc7ba99bf  ! 659: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd3baa048  ! 660: STDFA_I	stda	%f9, [0x0048, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xccd2d13f  ! 661: LDSHA_R	ldsha	[%r11, %r31] 0x89, %r6
	.word 0xc9e2911f  ! 662: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba999f  ! 663: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 664: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd24a801f  ! 665: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc39aa068  ! 666: LDDFA_I	ldda	[%r10, 0x0068], %f1
	.word 0xd00ae034  ! 667: LDUB_I	ldub	[%r11 + 0x0034], %r8
	.word 0xc3bad93f  ! 668: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xca92915f  ! 669: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r5
	.word 0xce0ac01f  ! 670: LDUB_R	ldub	[%r11 + %r31], %r7
TH_LABEL670:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3bad91f  ! 671: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcc5a801f  ! 672: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xd1ba983f  ! 673: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcb02801f  ! 674: LDF_R	ld	[%r10, %r31], %f5
	.word 0xcdf2e01f  ! 675: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdbad87f  ! 676: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc44ac01f  ! 677: LDSB_R	ldsb	[%r11 + %r31], %r2
	.word 0xc3f2901f  ! 678: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xcacaa01f  ! 679: LDSBA_I	ldsba	[%r10, + 0x001f] %asi, %r5
	.word 0xc43a801f  ! 680: STD_R	std	%r2, [%r10 + %r31]
TH_LABEL680:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc502801f  ! 681: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc7bad89f  ! 682: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad9bf  ! 683: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd302e064  ! 684: LDF_I	ld	[%r11, 0x0064], %f9
	.word 0xc302801f  ! 685: LDF_R	ld	[%r10, %r31], %f1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc612801f  ! 686: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xd122801f  ! 687: STF_R	st	%f8, [%r31, %r10]
	.word 0xcfbad89f  ! 688: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd3baa008  ! 689: STDFA_I	stda	%f9, [0x0008, %r10]
	.word 0xcc0a801f  ! 690: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd03a801f  ! 691: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba997f  ! 692: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba983f  ! 693: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc81aa010  ! 694: LDD_I	ldd	[%r10 + 0x0010], %r4
	.word 0xc402a068  ! 695: LDUW_I	lduw	[%r10 + 0x0068], %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfbaa008  ! 696: STDFA_I	stda	%f7, [0x0008, %r10]
	.word 0xc41ac01f  ! 697: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xd3e2e01f  ! 698: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad83f  ! 699: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad9bf  ! 700: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xca8ae04b  ! 701: LDUBA_I	lduba	[%r11, + 0x004b] %asi, %r5
	.word 0xc3e2a01f  ! 702: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba989f  ! 703: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcc1a801f  ! 704: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xd002c01f  ! 705: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7e2901f  ! 706: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc89aa030  ! 707: LDDA_I	ldda	[%r10, + 0x0030] %asi, %r4
	.word 0xc7f2a01f  ! 708: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc702e068  ! 709: LDF_I	ld	[%r11, 0x0068], %f3
	.word 0xcad2913f  ! 710: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3bad83f  ! 711: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 712: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc03ae040  ! 713: STD_I	std	%r0, [%r11 + 0x0040]
	.word 0xcc0ac01f  ! 714: LDUB_R	ldub	[%r11 + %r31], %r6
	.word 0xc44aa039  ! 715: LDSB_I	ldsb	[%r10 + 0x0039], %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd012801f  ! 716: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xc7baa038  ! 717: STDFA_I	stda	%f3, [0x0038, %r10]
	.word 0xc6c2a004  ! 718: LDSWA_I	ldswa	[%r10, + 0x0004] %asi, %r3
	.word 0xc65aa028  ! 719: LDX_I	ldx	[%r10 + 0x0028], %r3
	.word 0xc5bad87f  ! 720: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xccdae048  ! 721: LDXA_I	ldxa	[%r11, + 0x0048] %asi, %r6
	.word 0xc7bad97f  ! 722: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc522c01f  ! 723: STF_R	st	%f2, [%r31, %r11]
	.word 0xc9e2911f  ! 724: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9f2913f  ! 725: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xce4a801f  ! 726: LDSB_R	ldsb	[%r10 + %r31], %r7
	.word 0xc80ac01f  ! 727: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xcbba981f  ! 728: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 729: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba989f  ! 730: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc39aa020  ! 731: LDDFA_I	ldda	[%r10, 0x0020], %f1
	.word 0xd3f2d01f  ! 732: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd3bad85f  ! 733: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xce52c01f  ! 734: LDSH_R	ldsh	[%r11 + %r31], %r7
	.word 0xc9f2d01f  ! 735: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9bad89f  ! 736: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcacad01f  ! 737: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r5
	.word 0xc83a801f  ! 738: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba993f  ! 739: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 740: CASXA_R	casxa	[%r10]%asi, %r31, %r5
TH_LABEL740:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc2c2915f  ! 741: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r1
	.word 0xcc52a022  ! 742: LDSH_I	ldsh	[%r10 + 0x0022], %r6
	.word 0xce52801f  ! 743: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xd1bae030  ! 744: STDFA_I	stda	%f8, [0x0030, %r11]
	.word 0xcdbae010  ! 745: STDFA_I	stda	%f6, [0x0010, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc99ae000  ! 746: LDDFA_I	ldda	[%r11, 0x0000], %f4
	.word 0xcc3aa068  ! 747: STD_I	std	%r6, [%r10 + 0x0068]
	.word 0xcdba993f  ! 748: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc9bae078  ! 749: STDFA_I	stda	%f4, [0x0078, %r11]
	.word 0xc5ba983f  ! 750: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5f2901f  ! 751: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc40aa066  ! 752: LDUB_I	ldub	[%r10 + 0x0066], %r2
	.word 0xcb22801f  ! 753: STF_R	st	%f5, [%r31, %r10]
	.word 0xceca901f  ! 754: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r7
	.word 0xd04a801f  ! 755: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc28ae041  ! 756: LDUBA_I	lduba	[%r11, + 0x0041] %asi, %r1
	.word 0xc302e01c  ! 757: LDF_I	ld	[%r11, 0x001c], %f1
	.word 0xc2ca917f  ! 758: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r1
	.word 0xc502801f  ! 759: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc43a801f  ! 760: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7e2901f  ! 761: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc43aa038  ! 762: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xd2c2901f  ! 763: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r9
	.word 0xc3bad9bf  ! 764: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 765: CASA_R	casa	[%r11] %asi, %r31, %r1
TH_LABEL765:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc20ac01f  ! 766: LDUB_R	ldub	[%r11 + %r31], %r1
	.word 0xd1bad81f  ! 767: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ac01f  ! 768: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1f2d11f  ! 769: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xca42801f  ! 770: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3ba99bf  ! 771: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xccca901f  ! 772: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r6
	.word 0xc5ba99bf  ! 773: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba99bf  ! 774: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 775: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xca12a028  ! 776: LDUH_I	lduh	[%r10 + 0x0028], %r5
	.word 0xc4da913f  ! 777: LDXA_R	ldxa	[%r10, %r31] 0x89, %r2
	.word 0xd05a801f  ! 778: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xce52a06c  ! 779: LDSH_I	ldsh	[%r10 + 0x006c], %r7
	.word 0xc252e03e  ! 780: LDSH_I	ldsh	[%r11 + 0x003e], %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3ba981f  ! 781: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 782: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa060  ! 783: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd3ba98bf  ! 784: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa060  ! 785: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc922c01f  ! 786: STF_R	st	%f4, [%r31, %r11]
	.word 0xc41a801f  ! 787: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc28a903f  ! 788: LDUBA_R	lduba	[%r10, %r31] 0x81, %r1
	.word 0xcfba98bf  ! 789: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcb9aa050  ! 790: LDDFA_I	ldda	[%r10, 0x0050], %f5
TH_LABEL790:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd09ae050  ! 791: LDDA_I	ldda	[%r11, + 0x0050] %asi, %r8
	.word 0xc7ba98bf  ! 792: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa068  ! 793: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xc39aa020  ! 794: LDDFA_I	ldda	[%r10, 0x0020], %f1
	.word 0xcfba995f  ! 795: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL795:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xced2917f  ! 796: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r7
	.word 0xd20a801f  ! 797: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xca82d03f  ! 798: LDUWA_R	lduwa	[%r11, %r31] 0x81, %r5
	.word 0xcbe2e01f  ! 799: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xca92917f  ! 800: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbf2e01f  ! 801: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad85f  ! 802: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcb02e01c  ! 803: LDF_I	ld	[%r11, 0x001c], %f5
	.word 0xc20ae051  ! 804: LDUB_I	ldub	[%r11 + 0x0051], %r1
	.word 0xc7bad85f  ! 805: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xca82a070  ! 806: LDUWA_I	lduwa	[%r10, + 0x0070] %asi, %r5
	.word 0xcfba98bf  ! 807: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 808: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba993f  ! 809: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 810: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc902a030  ! 811: LDF_I	ld	[%r10, 0x0030], %f4
	.word 0xc85a801f  ! 812: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xce92a060  ! 813: LDUHA_I	lduha	[%r10, + 0x0060] %asi, %r7
	.word 0xc88ae020  ! 814: LDUBA_I	lduba	[%r11, + 0x0020] %asi, %r4
	.word 0xd03ae060  ! 815: STD_I	std	%r8, [%r11 + 0x0060]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3bad91f  ! 816: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 817: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd102e024  ! 818: LDF_I	ld	[%r11, 0x0024], %f8
	.word 0xd0c2901f  ! 819: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r8
	.word 0xd202e044  ! 820: LDUW_I	lduw	[%r11 + 0x0044], %r9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3ba993f  ! 821: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc39aa028  ! 822: LDDFA_I	ldda	[%r10, 0x0028], %f1
	.word 0xc5bad99f  ! 823: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad8bf  ! 824: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad81f  ! 825: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc292e028  ! 826: LDUHA_I	lduha	[%r11, + 0x0028] %asi, %r1
	.word 0xcbbad91f  ! 827: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad97f  ! 828: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd002e05c  ! 829: LDUW_I	lduw	[%r11 + 0x005c], %r8
	.word 0xc9bad95f  ! 830: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9f2e01f  ! 831: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 832: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9f2d01f  ! 833: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc6caa036  ! 834: LDSBA_I	ldsba	[%r10, + 0x0036] %asi, %r3
	.word 0xc7baa010  ! 835: STDFA_I	stda	%f3, [0x0010, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7ba997f  ! 836: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd0ca911f  ! 837: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r8
	.word 0xc3e2901f  ! 838: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xd1baa058  ! 839: STDFA_I	stda	%f8, [0x0058, %r10]
	.word 0xc292a04c  ! 840: LDUHA_I	lduha	[%r10, + 0x004c] %asi, %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc83ac01f  ! 841: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9e2d03f  ! 842: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xc9e2d01f  ! 843: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xca82917f  ! 844: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r5
	.word 0xcb02801f  ! 845: LDF_R	ld	[%r10, %r31], %f5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc43aa038  ! 846: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc43aa038  ! 847: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc7f2a01f  ! 848: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba993f  ! 849: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcd9aa060  ! 850: LDDFA_I	ldda	[%r10, 0x0060], %f6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbf2e01f  ! 851: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad8bf  ! 852: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc82907f  ! 853: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r6
	.word 0xc39aa010  ! 854: LDDFA_I	ldda	[%r10, 0x0010], %f1
	.word 0xd1e2901f  ! 855: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd03aa018  ! 856: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xcad2913f  ! 857: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r5
	.word 0xc9ba999f  ! 858: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc892917f  ! 859: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r4
	.word 0xc8caa027  ! 860: LDSBA_I	ldsba	[%r10, + 0x0027] %asi, %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9bad9bf  ! 861: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d11f  ! 862: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xc9f2d13f  ! 863: CASXA_I	casxa	[%r11] 0x89, %r31, %r4
	.word 0xc83ac01f  ! 864: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9f2d01f  ! 865: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9e2d11f  ! 866: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xd082d01f  ! 867: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r8
	.word 0xc3e2d01f  ! 868: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc302801f  ! 869: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc842801f  ! 870: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5ba987f  ! 871: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd202c01f  ! 872: LDUW_R	lduw	[%r11 + %r31], %r9
	.word 0xc5f2e01f  ! 873: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2e01f  ! 874: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 875: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc43ac01f  ! 876: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc602c01f  ! 877: LDUW_R	lduw	[%r11 + %r31], %r3
	.word 0xc602a05c  ! 878: LDUW_I	lduw	[%r10 + 0x005c], %r3
	.word 0xce82e068  ! 879: LDUWA_I	lduwa	[%r11, + 0x0068] %asi, %r7
	.word 0xc5e2a01f  ! 880: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc39ae020  ! 881: LDDFA_I	ldda	[%r11, 0x0020], %f1
	.word 0xcc52801f  ! 882: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xcc8aa05b  ! 883: LDUBA_I	lduba	[%r10, + 0x005b] %asi, %r6
	.word 0xc5ba99bf  ! 884: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 885: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcd9aa040  ! 886: LDDFA_I	ldda	[%r10, 0x0040], %f6
	.word 0xd1e2901f  ! 887: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc402801f  ! 888: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xc402c01f  ! 889: LDUW_R	lduw	[%r11 + %r31], %r2
	.word 0xc3f2901f  ! 890: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcd22c01f  ! 891: STF_R	st	%f6, [%r31, %r11]
	.word 0xd3e2a01f  ! 892: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc2c2d13f  ! 893: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r1
	.word 0xc8da907f  ! 894: LDXA_R	ldxa	[%r10, %r31] 0x83, %r4
	.word 0xd3e2d03f  ! 895: CASA_I	casa	[%r11] 0x81, %r31, %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3f2d11f  ! 896: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xd3e2d01f  ! 897: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xc692d03f  ! 898: LDUHA_R	lduha	[%r11, %r31] 0x81, %r3
	.word 0xd282d15f  ! 899: LDUWA_R	lduwa	[%r11, %r31] 0x8a, %r9
	.word 0xc3f2d01f  ! 900: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3f2e01f  ! 901: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad9bf  ! 902: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc01aa068  ! 903: LDD_I	ldd	[%r10 + 0x0068], %r0
	.word 0xcc3a801f  ! 904: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcb22801f  ! 905: STF_R	st	%f5, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc83aa060  ! 906: STD_I	std	%r4, [%r10 + 0x0060]
	.word 0xc44ae057  ! 907: LDSB_I	ldsb	[%r11 + 0x0057], %r2
	.word 0xc41aa040  ! 908: LDD_I	ldd	[%r10 + 0x0040], %r2
	.word 0xc5f2a01f  ! 909: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xcc82e014  ! 910: LDUWA_I	lduwa	[%r11, + 0x0014] %asi, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc25a801f  ! 911: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xcfbad81f  ! 912: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xccd2d15f  ! 913: LDSHA_R	ldsha	[%r11, %r31] 0x8a, %r6
	.word 0xd0d2e000  ! 914: LDSHA_I	ldsha	[%r11, + 0x0000] %asi, %r8
	.word 0xd1f2a01f  ! 915: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1f2a01f  ! 916: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc7bae038  ! 917: STDFA_I	stda	%f3, [0x0038, %r11]
	.word 0xd3ba99bf  ! 918: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcb9ae028  ! 919: LDDFA_I	ldda	[%r11, 0x0028], %f5
	.word 0xc24a801f  ! 920: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc902801f  ! 921: LDF_R	ld	[%r10, %r31], %f4
	.word 0xcfba999f  ! 922: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa000  ! 923: STD_I	std	%r6, [%r10 + 0x0000]
	.word 0xcbbaa078  ! 924: STDFA_I	stda	%f5, [0x0078, %r10]
	.word 0xc7ba981f  ! 925: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc642801f  ! 926: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc5f2d01f  ! 927: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc5f2e01f  ! 928: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2e01f  ! 929: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 930: CASXA_R	casxa	[%r11]%asi, %r31, %r2
TH_LABEL930:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5bad97f  ! 931: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad81f  ! 932: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad89f  ! 933: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd09ae010  ! 934: LDDA_I	ldda	[%r11, + 0x0010] %asi, %r8
	.word 0xc7ba981f  ! 935: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7ba995f  ! 936: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd252801f  ! 937: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xd03ac01f  ! 938: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc652e066  ! 939: LDSH_I	ldsh	[%r11 + 0x0066], %r3
	.word 0xc852c01f  ! 940: LDSH_R	ldsh	[%r11 + %r31], %r4
TH_LABEL940:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3ba981f  ! 941: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc682a05c  ! 942: LDUWA_I	lduwa	[%r10, + 0x005c] %asi, %r3
	.word 0xd3baa008  ! 943: STDFA_I	stda	%f9, [0x0008, %r10]
	.word 0xd042e014  ! 944: LDSW_I	ldsw	[%r11 + 0x0014], %r8
	.word 0xc9e2901f  ! 945: CASA_I	casa	[%r10] 0x80, %r31, %r4
TH_LABEL945:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9e2a01f  ! 946: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba995f  ! 947: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2911f  ! 948: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc41ac01f  ! 949: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xc652a050  ! 950: LDSH_I	ldsh	[%r10 + 0x0050], %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd082a004  ! 951: LDUWA_I	lduwa	[%r10, + 0x0004] %asi, %r8
	.word 0xd042c01f  ! 952: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xc302c01f  ! 953: LDF_R	ld	[%r11, %r31], %f1
	.word 0xca02a018  ! 954: LDUW_I	lduw	[%r10 + 0x0018], %r5
	.word 0xc7ba98bf  ! 955: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcd02a014  ! 956: LDF_I	ld	[%r10, 0x0014], %f6
	.word 0xc7bad81f  ! 957: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae070  ! 958: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xc7e2e01f  ! 959: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xd39aa038  ! 960: LDDFA_I	ldda	[%r10, 0x0038], %f9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3ba993f  ! 961: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 962: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc9baa030  ! 963: STDFA_I	stda	%f4, [0x0030, %r10]
	.word 0xc7ba995f  ! 964: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba99bf  ! 965: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7ba991f  ! 966: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2901f  ! 967: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba989f  ! 968: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc79aa078  ! 969: LDDFA_I	ldda	[%r10, 0x0078], %f3
	.word 0xcdf2a01f  ! 970: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdf2913f  ! 971: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcdba99bf  ! 972: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd052a066  ! 973: LDSH_I	ldsh	[%r10 + 0x0066], %r8
	.word 0xc43aa020  ! 974: STD_I	std	%r2, [%r10 + 0x0020]
	.word 0xc7ba993f  ! 975: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7ba983f  ! 976: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc6da907f  ! 977: LDXA_R	ldxa	[%r10, %r31] 0x83, %r3
	.word 0xc9ba98bf  ! 978: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa020  ! 979: STD_I	std	%r4, [%r10 + 0x0020]
	.word 0xce5aa070  ! 980: LDX_I	ldx	[%r10 + 0x0070], %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc6c2e018  ! 981: LDSWA_I	ldswa	[%r11, + 0x0018] %asi, %r3
	.word 0xcff2d13f  ! 982: CASXA_I	casxa	[%r11] 0x89, %r31, %r7
	.word 0xcfbad83f  ! 983: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d03f  ! 984: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xcd22801f  ! 985: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7f2e01f  ! 986: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad93f  ! 987: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcc1ae020  ! 988: LDD_I	ldd	[%r11 + 0x0020], %r6
	.word 0xc7f2e01f  ! 989: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad93f  ! 990: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7f2d13f  ! 991: CASXA_I	casxa	[%r11] 0x89, %r31, %r3
	.word 0xc9bae018  ! 992: STDFA_I	stda	%f4, [0x0018, %r11]
	.word 0xcf9aa008  ! 993: LDDFA_I	ldda	[%r10, 0x0008], %f7
	.word 0xce12e07a  ! 994: LDUH_I	lduh	[%r11 + 0x007a], %r7
	.word 0xcd22801f  ! 995: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1ba999f  ! 996: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc8a913f  ! 997: LDUBA_R	lduba	[%r10, %r31] 0x89, %r6
	.word 0xcc4a801f  ! 998: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xd3ba985f  ! 999: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2911f  ! 1000: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
TH_LABEL1000:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	subcc %r30, 1, %r30
	bnz  TH6_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	add	%g0,	0x1,	%r30
TH5_LOOP_START:
	.word 0xd1f2a01f  ! 1: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba983f  ! 2: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc84ae05e  ! 3: LDSB_I	ldsb	[%r11 + 0x005e], %r4
	.word 0xc502c01f  ! 4: LDF_R	ld	[%r11, %r31], %f2
	.word 0xcc5a801f  ! 5: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5e2913f  ! 6: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5ba985f  ! 7: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcd02e004  ! 8: LDF_I	ld	[%r11, 0x0004], %f6
	.word 0xcfe2e01f  ! 9: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xd3baa030  ! 10: STDFA_I	stda	%f9, [0x0030, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcb9aa028  ! 11: LDDFA_I	ldda	[%r10, 0x0028], %f5
	.word 0xc7bad99f  ! 12: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 13: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7e2e01f  ! 14: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc8ca907f  ! 15: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xce02e004  ! 16: LDUW_I	lduw	[%r11 + 0x0004], %r7
	.word 0xc5e2901f  ! 17: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5e2901f  ! 18: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba981f  ! 19: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 20: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5f2903f  ! 21: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xc5f2a01f  ! 22: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2a01f  ! 23: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc41a801f  ! 24: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc03a801f  ! 25: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3ba997f  ! 26: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 27: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xd002e058  ! 28: LDUW_I	lduw	[%r11 + 0x0058], %r8
	.word 0xd092d15f  ! 29: LDUHA_R	lduha	[%r11, %r31] 0x8a, %r8
	.word 0xd1f2e01f  ! 30: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1bad97f  ! 31: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc502a074  ! 32: LDF_I	ld	[%r10, 0x0074], %f2
	.word 0xc3e2901f  ! 33: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3e2a01f  ! 34: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc7bae030  ! 35: STDFA_I	stda	%f3, [0x0030, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc43ac01f  ! 36: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 37: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad81f  ! 38: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc502801f  ! 39: LDF_R	ld	[%r10, %r31], %f2
	.word 0xccc2d17f  ! 40: LDSWA_R	ldswa	[%r11, %r31] 0x8b, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd24aa06d  ! 41: LDSB_I	ldsb	[%r10 + 0x006d], %r9
	.word 0xd1ba995f  ! 42: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd322801f  ! 43: STF_R	st	%f9, [%r31, %r10]
	.word 0xc3ba989f  ! 44: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcf02801f  ! 45: LDF_R	ld	[%r10, %r31], %f7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1bad81f  ! 46: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xce8ae075  ! 47: LDUBA_I	lduba	[%r11, + 0x0075] %asi, %r7
	.word 0xccd2d01f  ! 48: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r6
	.word 0xc3e2903f  ! 49: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xd092a044  ! 50: LDUHA_I	lduha	[%r10, + 0x0044] %asi, %r8
TH_LABEL50:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfba98bf  ! 51: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba993f  ! 52: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc28ae04e  ! 53: LDUBA_I	lduba	[%r11, + 0x004e] %asi, %r1
	.word 0xd3ba985f  ! 54: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba993f  ! 55: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc49aa078  ! 56: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r2
	.word 0xc502801f  ! 57: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc5e2e01f  ! 58: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc28aa02f  ! 59: LDUBA_I	lduba	[%r10, + 0x002f] %asi, %r1
	.word 0xc7e2a01f  ! 60: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7e2911f  ! 61: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xc302801f  ! 62: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc7f2e01f  ! 63: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7f2e01f  ! 64: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad9bf  ! 65: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7e2e01f  ! 66: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xce82917f  ! 67: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r7
	.word 0xc3ba991f  ! 68: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 69: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba985f  ! 70: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3f2a01f  ! 71: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xcacae01f  ! 72: LDSBA_I	ldsba	[%r11, + 0x001f] %asi, %r5
	.word 0xc3e2911f  ! 73: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xc3ba98bf  ! 74: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd0c2901f  ! 75: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3bad87f  ! 76: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d03f  ! 77: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xc3e2e01f  ! 78: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad81f  ! 79: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ae040  ! 80: STD_I	std	%r0, [%r11 + 0x0040]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc03ac01f  ! 81: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc41ae060  ! 82: LDD_I	ldd	[%r11 + 0x0060], %r2
	.word 0xd2d2d15f  ! 83: LDSHA_R	ldsha	[%r11, %r31] 0x8a, %r9
	.word 0xc3f2901f  ! 84: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3e2a01f  ! 85: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc59aa040  ! 86: LDDFA_I	ldda	[%r10, 0x0040], %f2
	.word 0xc852c01f  ! 87: LDSH_R	ldsh	[%r11 + %r31], %r4
	.word 0xc5f2d13f  ! 88: CASXA_I	casxa	[%r11] 0x89, %r31, %r2
	.word 0xc5e2e01f  ! 89: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5e2d01f  ! 90: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xce42801f  ! 91: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xc7bad97f  ! 92: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcb22801f  ! 93: STF_R	st	%f5, [%r31, %r10]
	.word 0xcc3aa000  ! 94: STD_I	std	%r6, [%r10 + 0x0000]
	.word 0xd05a801f  ! 95: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5bad8bf  ! 96: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xca12801f  ! 97: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xc902801f  ! 98: LDF_R	ld	[%r10, %r31], %f4
	.word 0xd3ba98bf  ! 99: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 100: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03a801f  ! 101: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc452801f  ! 102: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xcbe2e01f  ! 103: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad9bf  ! 104: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad95f  ! 105: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbbad85f  ! 106: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d03f  ! 107: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xc83ae000  ! 108: STD_I	std	%r4, [%r11 + 0x0000]
	.word 0xcf02801f  ! 109: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc9f2901f  ! 110: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9e2a01f  ! 111: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2a01f  ! 112: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2a01f  ! 113: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2913f  ! 114: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc83aa000  ! 115: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9e2a01f  ! 116: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba989f  ! 117: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 118: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2903f  ! 119: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc9ba993f  ! 120: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL120:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd0c2d01f  ! 121: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r8
	.word 0xc9f2e01f  ! 122: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 123: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad95f  ! 124: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcd22801f  ! 125: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3f2911f  ! 126: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd3ba991f  ! 127: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 128: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba993f  ! 129: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 130: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3ba995f  ! 131: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba985f  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcc8ad05f  ! 133: LDUBA_R	lduba	[%r11, %r31] 0x82, %r6
	.word 0xd3ba997f  ! 134: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 135: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcedaa070  ! 136: LDXA_I	ldxa	[%r10, + 0x0070] %asi, %r7
	.word 0xce5a801f  ! 137: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xc9ba993f  ! 138: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcec2905f  ! 139: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r7
	.word 0xc7bad87f  ! 140: STDFA_R	stda	%f3, [%r31, %r11]
TH_LABEL140:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7bad81f  ! 141: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad87f  ! 142: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 143: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xce02a01c  ! 144: LDUW_I	lduw	[%r10 + 0x001c], %r7
	.word 0xd1f2d01f  ! 145: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1f2e01f  ! 146: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1e2d11f  ! 147: CASA_I	casa	[%r11] 0x88, %r31, %r8
	.word 0xcb9aa030  ! 148: LDDFA_I	ldda	[%r10, 0x0030], %f5
	.word 0xc5f2d01f  ! 149: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc5bad95f  ! 150: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc8aa032  ! 151: LDUBA_I	lduba	[%r10, + 0x0032] %asi, %r6
	.word 0xcdbad95f  ! 152: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad97f  ! 153: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc9ae008  ! 154: LDDA_I	ldda	[%r11, + 0x0008] %asi, %r6
	.word 0xc2ca907f  ! 155: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd2cae010  ! 156: LDSBA_I	ldsba	[%r11, + 0x0010] %asi, %r9
	.word 0xd3e2901f  ! 157: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xc892d01f  ! 158: LDUHA_R	lduha	[%r11, %r31] 0x80, %r4
	.word 0xd28aa02b  ! 159: LDUBA_I	lduba	[%r10, + 0x002b] %asi, %r9
	.word 0xc88ad05f  ! 160: LDUBA_R	lduba	[%r11, %r31] 0x82, %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfba991f  ! 161: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc44aa058  ! 162: LDSB_I	ldsb	[%r10 + 0x0058], %r2
	.word 0xd3ba999f  ! 163: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xca42801f  ! 164: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xcde2d01f  ! 165: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcf9ae068  ! 166: LDDFA_I	ldda	[%r11, 0x0068], %f7
	.word 0xc83aa070  ! 167: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xcbba983f  ! 168: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xccc2d05f  ! 169: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r6
	.word 0xca92d11f  ! 170: LDUHA_R	lduha	[%r11, %r31] 0x88, %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7e2d01f  ! 171: CASA_I	casa	[%r11] 0x80, %r31, %r3
	.word 0xc7bad81f  ! 172: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae070  ! 173: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xc43ae070  ! 174: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xd19ae010  ! 175: LDDFA_I	ldda	[%r11, 0x0010], %f8
TH_LABEL175:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1ba985f  ! 176: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xce52a002  ! 177: LDSH_I	ldsh	[%r10 + 0x0002], %r7
	.word 0xcc02a004  ! 178: LDUW_I	lduw	[%r10 + 0x0004], %r6
	.word 0xc99aa008  ! 179: LDDFA_I	ldda	[%r10, 0x0008], %f4
	.word 0xcdf2e01f  ! 180: CASXA_R	casxa	[%r11]%asi, %r31, %r6
TH_LABEL180:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc642e008  ! 181: LDSW_I	ldsw	[%r11 + 0x0008], %r3
	.word 0xc522801f  ! 182: STF_R	st	%f2, [%r31, %r10]
	.word 0xd242a078  ! 183: LDSW_I	ldsw	[%r10 + 0x0078], %r9
	.word 0xd3ba993f  ! 184: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 185: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3e2901f  ! 186: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba981f  ! 187: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce5aa010  ! 188: LDX_I	ldx	[%r10 + 0x0010], %r7
	.word 0xc5e2913f  ! 189: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xcf9aa060  ! 190: LDDFA_I	ldda	[%r10, 0x0060], %f7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdf2913f  ! 191: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcdba989f  ! 192: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 193: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc88a911f  ! 194: LDUBA_R	lduba	[%r10, %r31] 0x88, %r4
	.word 0xcbe2a01f  ! 195: CASA_R	casa	[%r10] %asi, %r31, %r5
TH_LABEL195:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbba989f  ! 196: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd01aa010  ! 197: LDD_I	ldd	[%r10 + 0x0010], %r8
	.word 0xd19aa020  ! 198: LDDFA_I	ldda	[%r10, 0x0020], %f8
	.word 0xd292903f  ! 199: LDUHA_R	lduha	[%r10, %r31] 0x81, %r9
	.word 0xc682a020  ! 200: LDUWA_I	lduwa	[%r10, + 0x0020] %asi, %r3
TH_LABEL200:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5ba991f  ! 201: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd052c01f  ! 202: LDSH_R	ldsh	[%r11 + %r31], %r8
	.word 0xd3e2d13f  ! 203: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd3f2e01f  ! 204: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad9bf  ! 205: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc82901f  ! 206: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r6
	.word 0xcfe2d01f  ! 207: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcc3ac01f  ! 208: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcfe2d13f  ! 209: CASA_I	casa	[%r11] 0x89, %r31, %r7
	.word 0xcc3ac01f  ! 210: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfbad87f  ! 211: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc412801f  ! 212: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xc7ba983f  ! 213: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xce0a801f  ! 214: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xd3bad87f  ! 215: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3bad89f  ! 216: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2d01f  ! 217: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd3bad93f  ! 218: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae018  ! 219: STD_I	std	%r8, [%r11 + 0x0018]
	.word 0xd102801f  ! 220: LDF_R	ld	[%r10, %r31], %f8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xca4aa020  ! 221: LDSB_I	ldsb	[%r10 + 0x0020], %r5
	.word 0xc3e2a01f  ! 222: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xcc0ac01f  ! 223: LDUB_R	ldub	[%r11 + %r31], %r6
	.word 0xc80ac01f  ! 224: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xc5e2a01f  ! 225: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5ba997f  ! 226: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 227: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa048  ! 228: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc43a801f  ! 229: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba989f  ! 230: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5f2a01f  ! 231: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2911f  ! 232: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5e2a01f  ! 233: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcd02c01f  ! 234: LDF_R	ld	[%r11, %r31], %f6
	.word 0xd3ba995f  ! 235: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3ba987f  ! 236: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 237: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd3f2a01f  ! 238: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd302e074  ! 239: LDF_I	ld	[%r11, 0x0074], %f9
	.word 0xc892915f  ! 240: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd03a801f  ! 241: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba991f  ! 242: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc522c01f  ! 243: STF_R	st	%f2, [%r31, %r11]
	.word 0xc9f2a01f  ! 244: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xd122801f  ! 245: STF_R	st	%f8, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd03aa060  ! 246: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd03a801f  ! 247: STD_R	std	%r8, [%r10 + %r31]
	.word 0xce92915f  ! 248: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r7
	.word 0xc44a801f  ! 249: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xc59ae048  ! 250: LDDFA_I	ldda	[%r11, 0x0048], %f2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc2c2a064  ! 251: LDSWA_I	ldswa	[%r10, + 0x0064] %asi, %r1
	.word 0xc5e2a01f  ! 252: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5f2901f  ! 253: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5e2a01f  ! 254: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 255: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc89ae008  ! 256: LDDA_I	ldda	[%r11, + 0x0008] %asi, %r4
	.word 0xc9ba997f  ! 257: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc89aa010  ! 258: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r4
	.word 0xcbba981f  ! 259: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcd22801f  ! 260: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdbad91f  ! 261: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcec2a060  ! 262: LDSWA_I	ldswa	[%r10, + 0x0060] %asi, %r7
	.word 0xc9ba993f  ! 263: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 264: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba98bf  ! 265: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL265:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9f2a01f  ! 266: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2911f  ! 267: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc41aa000  ! 268: LDD_I	ldd	[%r10 + 0x0000], %r2
	.word 0xd1ba993f  ! 269: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba987f  ! 270: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd302801f  ! 271: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc7ba987f  ! 272: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 273: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 274: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7f2913f  ! 275: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7ba987f  ! 276: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc85ae038  ! 277: LDX_I	ldx	[%r11 + 0x0038], %r4
	.word 0xc59aa000  ! 278: LDDFA_I	ldda	[%r10, 0x0000], %f2
	.word 0xcc52801f  ! 279: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xd25ac01f  ! 280: LDX_R	ldx	[%r11 + %r31], %r9
TH_LABEL280:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3f2e01f  ! 281: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc2d2d01f  ! 282: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r1
	.word 0xd0c2915f  ! 283: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r8
	.word 0xcbe2903f  ! 284: CASA_I	casa	[%r10] 0x81, %r31, %r5
	.word 0xc89ae040  ! 285: LDDA_I	ldda	[%r11, + 0x0040] %asi, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7bad91f  ! 286: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae038  ! 287: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xc692a064  ! 288: LDUHA_I	lduha	[%r10, + 0x0064] %asi, %r3
	.word 0xc5f2e01f  ! 289: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2d01f  ! 290: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5bad99f  ! 291: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad9bf  ! 292: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcd02801f  ! 293: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc722c01f  ! 294: STF_R	st	%f3, [%r31, %r11]
	.word 0xcb02e028  ! 295: LDF_I	ld	[%r11, 0x0028], %f5
TH_LABEL295:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfbae028  ! 296: STDFA_I	stda	%f7, [0x0028, %r11]
	.word 0xc802a064  ! 297: LDUW_I	lduw	[%r10 + 0x0064], %r4
	.word 0xc3ba99bf  ! 298: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2913f  ! 299: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xd08aa05a  ! 300: LDUBA_I	lduba	[%r10, + 0x005a] %asi, %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd202a058  ! 301: LDUW_I	lduw	[%r10 + 0x0058], %r9
	.word 0xd03a801f  ! 302: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc252801f  ! 303: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xc5ba993f  ! 304: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc892d17f  ! 305: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcdf2a01f  ! 306: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2a01f  ! 307: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc45ae040  ! 308: LDX_I	ldx	[%r11 + 0x0040], %r2
	.word 0xc4daa000  ! 309: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r2
	.word 0xc48aa05a  ! 310: LDUBA_I	lduba	[%r10, + 0x005a] %asi, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcf02a02c  ! 311: LDF_I	ld	[%r10, 0x002c], %f7
	.word 0xcfba989f  ! 312: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 313: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa038  ! 314: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xc252801f  ! 315: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd202801f  ! 316: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xc20a801f  ! 317: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xc09aa078  ! 318: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r0
	.word 0xc83ac01f  ! 319: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad97f  ! 320: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcadad05f  ! 321: LDXA_R	ldxa	[%r11, %r31] 0x82, %r5
	.word 0xc322c01f  ! 322: STF_R	st	%f1, [%r31, %r11]
	.word 0xcadaa050  ! 323: LDXA_I	ldxa	[%r10, + 0x0050] %asi, %r5
	.word 0xd1ba999f  ! 324: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc702c01f  ! 325: LDF_R	ld	[%r11, %r31], %f3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc3a801f  ! 326: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc92903f  ! 327: LDUHA_R	lduha	[%r10, %r31] 0x81, %r6
	.word 0xcdf2903f  ! 328: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xcdf2913f  ! 329: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xc4da901f  ! 330: LDXA_R	ldxa	[%r10, %r31] 0x80, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3bad8bf  ! 331: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad95f  ! 332: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad9bf  ! 333: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xce42801f  ! 334: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xc7ba985f  ! 335: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc02a068  ! 336: LDUW_I	lduw	[%r10 + 0x0068], %r6
	.word 0xcf22801f  ! 337: STF_R	st	%f7, [%r31, %r10]
	.word 0xcbbaa020  ! 338: STDFA_I	stda	%f5, [0x0020, %r10]
	.word 0xcfbad89f  ! 339: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc252801f  ! 340: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd28ae004  ! 341: LDUBA_I	lduba	[%r11, + 0x0004] %asi, %r9
	.word 0xd1bad87f  ! 342: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d11f  ! 343: CASA_I	casa	[%r11] 0x88, %r31, %r8
	.word 0xd1bad93f  ! 344: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcc8ae05e  ! 345: LDUBA_I	lduba	[%r11, + 0x005e] %asi, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xced2e072  ! 346: LDSHA_I	ldsha	[%r11, + 0x0072] %asi, %r7
	.word 0xc6c2907f  ! 347: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r3
	.word 0xcfbad85f  ! 348: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcb9aa008  ! 349: LDDFA_I	ldda	[%r10, 0x0008], %f5
	.word 0xced2a06e  ! 350: LDSHA_I	ldsha	[%r10, + 0x006e] %asi, %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc902a008  ! 351: LDF_I	ld	[%r10, 0x0008], %f4
	.word 0xca52a068  ! 352: LDSH_I	ldsh	[%r10 + 0x0068], %r5
	.word 0xc9f2e01f  ! 353: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc59ae010  ! 354: LDDFA_I	ldda	[%r11, 0x0010], %f2
	.word 0xcdba999f  ! 355: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdba989f  ! 356: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xca8ad17f  ! 357: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r5
	.word 0xd3bad83f  ! 358: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad93f  ! 359: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 360: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3bad97f  ! 361: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc5baa068  ! 362: STDFA_I	stda	%f2, [0x0068, %r10]
	.word 0xcff2903f  ! 363: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcfe2a01f  ! 364: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xce8a903f  ! 365: LDUBA_R	lduba	[%r10, %r31] 0x81, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfba999f  ! 366: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 367: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 368: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcff2903f  ! 369: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcfba99bf  ! 370: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcff2911f  ! 371: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcfba981f  ! 372: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc6dae068  ! 373: LDXA_I	ldxa	[%r11, + 0x0068] %asi, %r3
	.word 0xc3f2d01f  ! 374: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xd0d2917f  ! 375: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcd9aa050  ! 376: LDDFA_I	ldda	[%r10, 0x0050], %f6
	.word 0xcc3ae048  ! 377: STD_I	std	%r6, [%r11 + 0x0048]
	.word 0xcc3ae048  ! 378: STD_I	std	%r6, [%r11 + 0x0048]
	.word 0xd24aa070  ! 379: LDSB_I	ldsb	[%r10 + 0x0070], %r9
	.word 0xcd22c01f  ! 380: STF_R	st	%f6, [%r31, %r11]
TH_LABEL380:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1ba989f  ! 381: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc702801f  ! 382: LDF_R	ld	[%r10, %r31], %f3
	.word 0xd1ba98bf  ! 383: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 384: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 385: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1ba991f  ! 386: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 387: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd19ae070  ! 388: LDDFA_I	ldda	[%r11, 0x0070], %f8
	.word 0xd05a801f  ! 389: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xc692917f  ! 390: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc702a018  ! 391: LDF_I	ld	[%r10, 0x0018], %f3
	.word 0xd042e074  ! 392: LDSW_I	ldsw	[%r11 + 0x0074], %r8
	.word 0xc83ae040  ! 393: STD_I	std	%r4, [%r11 + 0x0040]
	.word 0xc9bad81f  ! 394: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd102c01f  ! 395: LDF_R	ld	[%r11, %r31], %f8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc83a801f  ! 396: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc39aa060  ! 397: LDDFA_I	ldda	[%r10, 0x0060], %f1
	.word 0xcfba997f  ! 398: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 399: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xd04aa05c  ! 400: LDSB_I	ldsb	[%r10 + 0x005c], %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd28a911f  ! 401: LDUBA_R	lduba	[%r10, %r31] 0x88, %r9
	.word 0xc3ba993f  ! 402: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc702a044  ! 403: LDF_I	ld	[%r10, 0x0044], %f3
	.word 0xcbbae060  ! 404: STDFA_I	stda	%f5, [0x0060, %r11]
	.word 0xc83a801f  ! 405: STD_R	std	%r4, [%r10 + %r31]
TH_LABEL405:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9ba983f  ! 406: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 407: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcf02801f  ! 408: LDF_R	ld	[%r10, %r31], %f7
	.word 0xd1ba985f  ! 409: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 410: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1f2911f  ! 411: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xc28ae007  ! 412: LDUBA_I	lduba	[%r11, + 0x0007] %asi, %r1
	.word 0xc5f2d01f  ! 413: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xd24ac01f  ! 414: LDSB_R	ldsb	[%r11 + %r31], %r9
	.word 0xd3ba98bf  ! 415: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03aa060  ! 416: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd3ba993f  ! 417: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2913f  ! 418: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd03aa060  ! 419: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xce42a044  ! 420: LDSW_I	ldsw	[%r10 + 0x0044], %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1bad81f  ! 421: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad9bf  ! 422: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad8bf  ! 423: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d11f  ! 424: CASA_I	casa	[%r11] 0x88, %r31, %r8
	.word 0xd2c2901f  ! 425: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r9
TH_LABEL425:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd002a004  ! 426: LDUW_I	lduw	[%r10 + 0x0004], %r8
	.word 0xcc02801f  ! 427: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xc28a907f  ! 428: LDUBA_R	lduba	[%r10, %r31] 0x83, %r1
	.word 0xc5ba997f  ! 429: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2901f  ! 430: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5ba983f  ! 431: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc722801f  ! 432: STF_R	st	%f3, [%r31, %r10]
	.word 0xc722801f  ! 433: STF_R	st	%f3, [%r31, %r10]
	.word 0xc5bae050  ! 434: STDFA_I	stda	%f2, [0x0050, %r11]
	.word 0xcdba983f  ! 435: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc3aa038  ! 436: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xc59aa008  ! 437: LDDFA_I	ldda	[%r10, 0x0008], %f2
	.word 0xcccaa068  ! 438: LDSBA_I	ldsba	[%r10, + 0x0068] %asi, %r6
	.word 0xc5e2e01f  ! 439: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad93f  ! 440: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5f2d03f  ! 441: CASXA_I	casxa	[%r11] 0x81, %r31, %r2
	.word 0xc702a044  ! 442: LDF_I	ld	[%r10, 0x0044], %f3
	.word 0xc9ba993f  ! 443: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc88ae04a  ! 444: LDUBA_I	lduba	[%r11, + 0x004a] %asi, %r4
	.word 0xc3bad89f  ! 445: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3e2d11f  ! 446: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xc702801f  ! 447: LDF_R	ld	[%r10, %r31], %f3
	.word 0xd3f2a01f  ! 448: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc81a801f  ! 449: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc03aa008  ! 450: STD_I	std	%r0, [%r10 + 0x0008]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3f2913f  ! 451: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xcdbaa058  ! 452: STDFA_I	stda	%f6, [0x0058, %r10]
	.word 0xcd02a07c  ! 453: LDF_I	ld	[%r10, 0x007c], %f6
	.word 0xc7ba999f  ! 454: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 455: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL455:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7e2913f  ! 456: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc7f2901f  ! 457: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba981f  ! 458: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xce0a801f  ! 459: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xd1ba99bf  ! 460: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1ba993f  ! 461: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 462: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2903f  ! 463: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xd1f2913f  ! 464: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd1f2901f  ! 465: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1f2a01f  ! 466: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc4da915f  ! 467: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r2
	.word 0xc5ba993f  ! 468: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 469: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 470: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcb9aa008  ! 471: LDDFA_I	ldda	[%r10, 0x0008], %f5
	.word 0xd1e2901f  ! 472: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd39ae060  ! 473: LDDFA_I	ldda	[%r11, 0x0060], %f9
	.word 0xd1bad83f  ! 474: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2e01f  ! 475: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc502a060  ! 476: LDF_I	ld	[%r10, 0x0060], %f2
	.word 0xd1ba985f  ! 477: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba99bf  ! 478: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 479: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd082913f  ! 480: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9f2a01f  ! 481: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xcd22801f  ! 482: STF_R	st	%f6, [%r31, %r10]
	.word 0xca4a801f  ! 483: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xc2d2a05c  ! 484: LDSHA_I	ldsha	[%r10, + 0x005c] %asi, %r1
	.word 0xc302801f  ! 485: LDF_R	ld	[%r10, %r31], %f1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd302a000  ! 486: LDF_I	ld	[%r10, 0x0000], %f9
	.word 0xc9ba983f  ! 487: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba987f  ! 488: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc902a000  ! 489: LDF_I	ld	[%r10, 0x0000], %f4
	.word 0xcc3a801f  ! 490: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc82d03f  ! 491: LDUWA_R	lduwa	[%r11, %r31] 0x81, %r6
	.word 0xcdba989f  ! 492: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 493: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba981f  ! 494: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 495: CASA_R	casa	[%r10] %asi, %r31, %r6
TH_LABEL495:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3baa050  ! 496: STDFA_I	stda	%f9, [0x0050, %r10]
	.word 0xcc12801f  ! 497: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xd3ba983f  ! 498: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 499: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2a01f  ! 500: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc85aa020  ! 501: LDX_I	ldx	[%r10 + 0x0020], %r4
	.word 0xc692911f  ! 502: LDUHA_R	lduha	[%r10, %r31] 0x88, %r3
	.word 0xcbf2903f  ! 503: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xcbf2a01f  ! 504: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba997f  ! 505: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbf2a01f  ! 506: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2901f  ! 507: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbba98bf  ! 508: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc39aa060  ! 509: LDDFA_I	ldda	[%r10, 0x0060], %f1
	.word 0xc09aa000  ! 510: LDDA_I	ldda	[%r10, + 0x0000] %asi, %r0
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xca52801f  ! 511: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xc43a801f  ! 512: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba997f  ! 513: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcf02c01f  ! 514: LDF_R	ld	[%r11, %r31], %f7
	.word 0xc6d2a030  ! 515: LDSHA_I	ldsha	[%r10, + 0x0030] %asi, %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbba985f  ! 516: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba995f  ! 517: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 518: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc4ca913f  ! 519: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r2
	.word 0xc2d2d03f  ! 520: LDSHA_R	ldsha	[%r11, %r31] 0x81, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcf22c01f  ! 521: STF_R	st	%f7, [%r31, %r11]
	.word 0xcc02801f  ! 522: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xc9bae070  ! 523: STDFA_I	stda	%f4, [0x0070, %r11]
	.word 0xc3ba99bf  ! 524: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa028  ! 525: STD_I	std	%r0, [%r10 + 0x0028]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xce42801f  ! 526: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xc212a02c  ! 527: LDUH_I	lduh	[%r10 + 0x002c], %r1
	.word 0xc9f2a01f  ! 528: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc482a048  ! 529: LDUWA_I	lduwa	[%r10, + 0x0048] %asi, %r2
	.word 0xc5bae008  ! 530: STDFA_I	stda	%f2, [0x0008, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc902801f  ! 531: LDF_R	ld	[%r10, %r31], %f4
	.word 0xcdbad85f  ! 532: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcedaa050  ! 533: LDXA_I	ldxa	[%r10, + 0x0050] %asi, %r7
	.word 0xc9ba989f  ! 534: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba989f  ! 535: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xca52c01f  ! 536: LDSH_R	ldsh	[%r11 + %r31], %r5
	.word 0xcc3aa070  ! 537: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcfba989f  ! 538: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2911f  ! 539: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcc5ac01f  ! 540: LDX_R	ldx	[%r11 + %r31], %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9e2913f  ! 541: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc2d2d07f  ! 542: LDSHA_R	ldsha	[%r11, %r31] 0x83, %r1
	.word 0xcf02e068  ! 543: LDF_I	ld	[%r11, 0x0068], %f7
	.word 0xcbba98bf  ! 544: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc852c01f  ! 545: LDSH_R	ldsh	[%r11 + %r31], %r4
TH_LABEL545:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc3a801f  ! 546: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2a01f  ! 547: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba997f  ! 548: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba993f  ! 549: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2911f  ! 550: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfe2a01f  ! 551: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba995f  ! 552: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca52801f  ! 553: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xce4a801f  ! 554: LDSB_R	ldsb	[%r10 + %r31], %r7
	.word 0xd242e050  ! 555: LDSW_I	ldsw	[%r11 + 0x0050], %r9
TH_LABEL555:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcedaa020  ! 556: LDXA_I	ldxa	[%r10, + 0x0020] %asi, %r7
	.word 0xd0d2a000  ! 557: LDSHA_I	ldsha	[%r10, + 0x0000] %asi, %r8
	.word 0xd04ae012  ! 558: LDSB_I	ldsb	[%r11 + 0x0012], %r8
	.word 0xd2ca903f  ! 559: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r9
	.word 0xc5f2a01f  ! 560: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc2da905f  ! 561: LDXA_R	ldxa	[%r10, %r31] 0x82, %r1
	.word 0xcc1aa050  ! 562: LDD_I	ldd	[%r10 + 0x0050], %r6
	.word 0xd3ba981f  ! 563: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2913f  ! 564: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd322801f  ! 565: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd03ac01f  ! 566: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2e01f  ! 567: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad97f  ! 568: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad83f  ! 569: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d13f  ! 570: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc722801f  ! 571: STF_R	st	%f3, [%r31, %r10]
	.word 0xcbbad83f  ! 572: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcecae050  ! 573: LDSBA_I	ldsba	[%r11, + 0x0050] %asi, %r7
	.word 0xcde2a01f  ! 574: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2903f  ! 575: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc452c01f  ! 576: LDSH_R	ldsh	[%r11 + %r31], %r2
	.word 0xd302801f  ! 577: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd1f2a01f  ! 578: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xcf9ae068  ! 579: LDDFA_I	ldda	[%r11, 0x0068], %f7
	.word 0xc5e2e01f  ! 580: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc43ae030  ! 581: STD_I	std	%r2, [%r11 + 0x0030]
	.word 0xc5bad97f  ! 582: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2d01f  ! 583: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xc80a801f  ! 584: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xd322801f  ! 585: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3f2901f  ! 586: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc03aa030  ! 587: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba995f  ! 588: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcccad05f  ! 589: LDSBA_R	ldsba	[%r11, %r31] 0x82, %r6
	.word 0xc252e04e  ! 590: LDSH_I	ldsh	[%r11 + 0x004e], %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbba98bf  ! 591: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 592: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xd0c2911f  ! 593: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r8
	.word 0xcfba98bf  ! 594: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba999f  ! 595: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc42a024  ! 596: LDSW_I	ldsw	[%r10 + 0x0024], %r6
	.word 0xc412e07a  ! 597: LDUH_I	lduh	[%r11 + 0x007a], %r2
	.word 0xd1e2d03f  ! 598: CASA_I	casa	[%r11] 0x81, %r31, %r8
	.word 0xd1e2e01f  ! 599: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1f2e01f  ! 600: CASXA_R	casxa	[%r11]%asi, %r31, %r8
TH_LABEL600:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd03ae070  ! 601: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xcb9aa020  ! 602: LDDFA_I	ldda	[%r10, 0x0020], %f5
	.word 0xce12a078  ! 603: LDUH_I	lduh	[%r10 + 0x0078], %r7
	.word 0xc612801f  ! 604: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xd3ba98bf  ! 605: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL605:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3ba995f  ! 606: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 607: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc612801f  ! 608: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xcacaa05a  ! 609: LDSBA_I	ldsba	[%r10, + 0x005a] %asi, %r5
	.word 0xc602801f  ! 610: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd052c01f  ! 611: LDSH_R	ldsh	[%r11 + %r31], %r8
	.word 0xd3ba981f  ! 612: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 613: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 614: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3f2a01f  ! 615: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3ba98bf  ! 616: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcac2e020  ! 617: LDSWA_I	ldswa	[%r11, + 0x0020] %asi, %r5
	.word 0xc9e2a01f  ! 618: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba999f  ! 619: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 620: CASXA_R	casxa	[%r10]%asi, %r31, %r4
TH_LABEL620:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc83a801f  ! 621: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba983f  ! 622: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 623: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9e2a01f  ! 624: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc20a801f  ! 625: LDUB_R	ldub	[%r10 + %r31], %r1
TH_LABEL625:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3e2913f  ! 626: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc3e2913f  ! 627: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc3ba991f  ! 628: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 629: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc81a801f  ! 630: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7ba991f  ! 631: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba983f  ! 632: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 633: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba981f  ! 634: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xce92a050  ! 635: LDUHA_I	lduha	[%r10, + 0x0050] %asi, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbba997f  ! 636: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba993f  ! 637: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 638: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc412a016  ! 639: LDUH_I	lduh	[%r10 + 0x0016], %r2
	.word 0xc84a801f  ! 640: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfba993f  ! 641: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2913f  ! 642: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcfba997f  ! 643: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc702c01f  ! 644: LDF_R	ld	[%r11, %r31], %f3
	.word 0xc5e2901f  ! 645: CASA_I	casa	[%r10] 0x80, %r31, %r2
TH_LABEL645:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbbaa000  ! 646: STDFA_I	stda	%f5, [0x0000, %r10]
	.word 0xc9bae040  ! 647: STDFA_I	stda	%f4, [0x0040, %r11]
	.word 0xd3e2a01f  ! 648: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba989f  ! 649: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 650: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3f2911f  ! 651: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd03a801f  ! 652: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba981f  ! 653: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd102e034  ! 654: LDF_I	ld	[%r11, 0x0034], %f8
	.word 0xcac2901f  ! 655: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcad2a014  ! 656: LDSHA_I	ldsha	[%r10, + 0x0014] %asi, %r5
	.word 0xc43a801f  ! 657: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa048  ! 658: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc7ba981f  ! 659: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc9baa058  ! 660: STDFA_I	stda	%f4, [0x0058, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc8d2911f  ! 661: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r4
	.word 0xc9e2901f  ! 662: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba99bf  ! 663: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba997f  ! 664: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc4a801f  ! 665: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc79ae028  ! 666: LDDFA_I	ldda	[%r11, 0x0028], %f3
	.word 0xd00aa062  ! 667: LDUB_I	ldub	[%r10 + 0x0062], %r8
	.word 0xc3bad85f  ! 668: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd292907f  ! 669: LDUHA_R	lduha	[%r10, %r31] 0x83, %r9
	.word 0xc60ac01f  ! 670: LDUB_R	ldub	[%r11 + %r31], %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3bad95f  ! 671: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc65a801f  ! 672: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xd1ba991f  ! 673: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc302801f  ! 674: LDF_R	ld	[%r10, %r31], %f1
	.word 0xcdf2e01f  ! 675: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdbad81f  ! 676: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc44ac01f  ! 677: LDSB_R	ldsb	[%r11 + %r31], %r2
	.word 0xc3f2901f  ! 678: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xcccaa002  ! 679: LDSBA_I	ldsba	[%r10, + 0x0002] %asi, %r6
	.word 0xc43a801f  ! 680: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcb02801f  ! 681: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc7bad99f  ! 682: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad91f  ! 683: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc902a024  ! 684: LDF_I	ld	[%r10, 0x0024], %f4
	.word 0xcb02c01f  ! 685: LDF_R	ld	[%r11, %r31], %f5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xca12801f  ! 686: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xd122801f  ! 687: STF_R	st	%f8, [%r31, %r10]
	.word 0xcfbad8bf  ! 688: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc9baa078  ! 689: STDFA_I	stda	%f4, [0x0078, %r10]
	.word 0xc40a801f  ! 690: LDUB_R	ldub	[%r10 + %r31], %r2
TH_LABEL690:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd03a801f  ! 691: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba995f  ! 692: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba993f  ! 693: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc01ae068  ! 694: LDD_I	ldd	[%r11 + 0x0068], %r0
	.word 0xca02e050  ! 695: LDUW_I	lduw	[%r11 + 0x0050], %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdbaa060  ! 696: STDFA_I	stda	%f6, [0x0060, %r10]
	.word 0xcc1ac01f  ! 697: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xd3e2e01f  ! 698: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad95f  ! 699: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad97f  ! 700: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc48aa07f  ! 701: LDUBA_I	lduba	[%r10, + 0x007f] %asi, %r2
	.word 0xc3e2a01f  ! 702: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba98bf  ! 703: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc81ac01f  ! 704: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xc402801f  ! 705: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7e2901f  ! 706: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xcc9aa048  ! 707: LDDA_I	ldda	[%r10, + 0x0048] %asi, %r6
	.word 0xc7f2a01f  ! 708: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc902a064  ! 709: LDF_I	ld	[%r10, 0x0064], %f4
	.word 0xced2917f  ! 710: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3bad95f  ! 711: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 712: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc03ae040  ! 713: STD_I	std	%r0, [%r11 + 0x0040]
	.word 0xc20a801f  ! 714: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xd24aa07c  ! 715: LDSB_I	ldsb	[%r10 + 0x007c], %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc612801f  ! 716: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xc7baa070  ! 717: STDFA_I	stda	%f3, [0x0070, %r10]
	.word 0xd2c2a07c  ! 718: LDSWA_I	ldswa	[%r10, + 0x007c] %asi, %r9
	.word 0xce5ae038  ! 719: LDX_I	ldx	[%r11 + 0x0038], %r7
	.word 0xc5bad97f  ! 720: STDFA_R	stda	%f2, [%r31, %r11]
TH_LABEL720:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc4dae078  ! 721: LDXA_I	ldxa	[%r11, + 0x0078] %asi, %r2
	.word 0xc7bad93f  ! 722: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd322c01f  ! 723: STF_R	st	%f9, [%r31, %r11]
	.word 0xc9e2901f  ! 724: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2901f  ! 725: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd04a801f  ! 726: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xd00ac01f  ! 727: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xcbba997f  ! 728: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 729: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 730: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc79ae078  ! 731: LDDFA_I	ldda	[%r11, 0x0078], %f3
	.word 0xd3f2d01f  ! 732: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd3bad83f  ! 733: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc652801f  ! 734: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xc9f2d01f  ! 735: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9bad81f  ! 736: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc2cad17f  ! 737: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r1
	.word 0xc83a801f  ! 738: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba987f  ! 739: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 740: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc8c2901f  ! 741: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r4
	.word 0xcc52e00a  ! 742: LDSH_I	ldsh	[%r11 + 0x000a], %r6
	.word 0xd052801f  ! 743: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xc5baa048  ! 744: STDFA_I	stda	%f2, [0x0048, %r10]
	.word 0xcbbaa070  ! 745: STDFA_I	stda	%f5, [0x0070, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcf9ae028  ! 746: LDDFA_I	ldda	[%r11, 0x0028], %f7
	.word 0xcc3aa068  ! 747: STD_I	std	%r6, [%r10 + 0x0068]
	.word 0xcdba99bf  ! 748: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcfbae078  ! 749: STDFA_I	stda	%f7, [0x0078, %r11]
	.word 0xc5ba989f  ! 750: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL750:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5f2901f  ! 751: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xce0aa044  ! 752: LDUB_I	ldub	[%r10 + 0x0044], %r7
	.word 0xd122801f  ! 753: STF_R	st	%f8, [%r31, %r10]
	.word 0xd2cad05f  ! 754: LDSBA_R	ldsba	[%r11, %r31] 0x82, %r9
	.word 0xce4a801f  ! 755: LDSB_R	ldsb	[%r10 + %r31], %r7
TH_LABEL755:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd08aa00a  ! 756: LDUBA_I	lduba	[%r10, + 0x000a] %asi, %r8
	.word 0xc702a020  ! 757: LDF_I	ld	[%r10, 0x0020], %f3
	.word 0xd0ca903f  ! 758: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r8
	.word 0xc702c01f  ! 759: LDF_R	ld	[%r11, %r31], %f3
	.word 0xc43a801f  ! 760: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7e2903f  ! 761: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xc43aa038  ! 762: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xcac2903f  ! 763: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r5
	.word 0xc3bad81f  ! 764: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 765: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc60a801f  ! 766: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xd1bad91f  ! 767: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ac01f  ! 768: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1f2d03f  ! 769: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xc242801f  ! 770: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba99bf  ! 771: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd2ca913f  ! 772: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r9
	.word 0xc5ba98bf  ! 773: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 774: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 775: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc12a04a  ! 776: LDUH_I	lduh	[%r10 + 0x004a], %r6
	.word 0xd0da903f  ! 777: LDXA_R	ldxa	[%r10, %r31] 0x81, %r8
	.word 0xc65ac01f  ! 778: LDX_R	ldx	[%r11 + %r31], %r3
	.word 0xd252a06a  ! 779: LDSH_I	ldsh	[%r10 + 0x006a], %r9
	.word 0xd052a048  ! 780: LDSH_I	ldsh	[%r10 + 0x0048], %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3ba985f  ! 781: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 782: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa060  ! 783: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd3ba991f  ! 784: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa060  ! 785: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd122c01f  ! 786: STF_R	st	%f8, [%r31, %r11]
	.word 0xcc1ac01f  ! 787: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xcc8a907f  ! 788: LDUBA_R	lduba	[%r10, %r31] 0x83, %r6
	.word 0xcfba995f  ! 789: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd39ae000  ! 790: LDDFA_I	ldda	[%r11, 0x0000], %f9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd09aa060  ! 791: LDDA_I	ldda	[%r10, + 0x0060] %asi, %r8
	.word 0xc7ba991f  ! 792: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa068  ! 793: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xcf9aa068  ! 794: LDDFA_I	ldda	[%r10, 0x0068], %f7
	.word 0xcfba983f  ! 795: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc4d2917f  ! 796: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r2
	.word 0xc20ac01f  ! 797: LDUB_R	ldub	[%r11 + %r31], %r1
	.word 0xce82901f  ! 798: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r7
	.word 0xcbe2e01f  ! 799: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xc292d17f  ! 800: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbf2e01f  ! 801: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad91f  ! 802: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcf02a008  ! 803: LDF_I	ld	[%r10, 0x0008], %f7
	.word 0xd00ae052  ! 804: LDUB_I	ldub	[%r11 + 0x0052], %r8
	.word 0xc7bad99f  ! 805: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc82e040  ! 806: LDUWA_I	lduwa	[%r11, + 0x0040] %asi, %r6
	.word 0xcfba995f  ! 807: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba995f  ! 808: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba993f  ! 809: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 810: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcd02a058  ! 811: LDF_I	ld	[%r10, 0x0058], %f6
	.word 0xc45a801f  ! 812: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xc292e04c  ! 813: LDUHA_I	lduha	[%r11, + 0x004c] %asi, %r1
	.word 0xc28aa05f  ! 814: LDUBA_I	lduba	[%r10, + 0x005f] %asi, %r1
	.word 0xd03ae060  ! 815: STD_I	std	%r8, [%r11 + 0x0060]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3bad93f  ! 816: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 817: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xcf02e004  ! 818: LDF_I	ld	[%r11, 0x0004], %f7
	.word 0xc4c2d15f  ! 819: LDSWA_R	ldswa	[%r11, %r31] 0x8a, %r2
	.word 0xc602e05c  ! 820: LDUW_I	lduw	[%r11 + 0x005c], %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3ba997f  ! 821: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc79ae018  ! 822: LDDFA_I	ldda	[%r11, 0x0018], %f3
	.word 0xc5bad83f  ! 823: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad97f  ! 824: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad8bf  ! 825: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc692e078  ! 826: LDUHA_I	lduha	[%r11, + 0x0078] %asi, %r3
	.word 0xcbbad81f  ! 827: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad83f  ! 828: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc402a074  ! 829: LDUW_I	lduw	[%r10 + 0x0074], %r2
	.word 0xc9bad9bf  ! 830: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9f2e01f  ! 831: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 832: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9f2d01f  ! 833: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xcccae006  ! 834: LDSBA_I	ldsba	[%r11, + 0x0006] %asi, %r6
	.word 0xcfbae040  ! 835: STDFA_I	stda	%f7, [0x0040, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7ba99bf  ! 836: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd2ca903f  ! 837: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r9
	.word 0xc3e2901f  ! 838: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xd1baa028  ! 839: STDFA_I	stda	%f8, [0x0028, %r10]
	.word 0xd092e03c  ! 840: LDUHA_I	lduha	[%r11, + 0x003c] %asi, %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc83ac01f  ! 841: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9e2d03f  ! 842: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xc9e2d01f  ! 843: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xce82903f  ! 844: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r7
	.word 0xd102801f  ! 845: LDF_R	ld	[%r10, %r31], %f8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc43aa038  ! 846: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc43aa038  ! 847: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc7f2a01f  ! 848: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba989f  ! 849: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc79aa048  ! 850: LDDFA_I	ldda	[%r10, 0x0048], %f3
TH_LABEL850:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbf2e01f  ! 851: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad83f  ! 852: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xce82d05f  ! 853: LDUWA_R	lduwa	[%r11, %r31] 0x82, %r7
	.word 0xc39aa048  ! 854: LDDFA_I	ldda	[%r10, 0x0048], %f1
	.word 0xd1e2911f  ! 855: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd03aa018  ! 856: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xc2d2917f  ! 857: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r1
	.word 0xc9ba995f  ! 858: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc92d05f  ! 859: LDUHA_R	lduha	[%r11, %r31] 0x82, %r6
	.word 0xc6caa067  ! 860: LDSBA_I	ldsba	[%r10, + 0x0067] %asi, %r3
TH_LABEL860:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9bad95f  ! 861: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d11f  ! 862: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xc9f2d01f  ! 863: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc83ac01f  ! 864: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9f2d01f  ! 865: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9e2d01f  ! 866: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xce82901f  ! 867: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r7
	.word 0xc3e2d13f  ! 868: CASA_I	casa	[%r11] 0x89, %r31, %r1
	.word 0xd102801f  ! 869: LDF_R	ld	[%r10, %r31], %f8
	.word 0xcc42c01f  ! 870: LDSW_R	ldsw	[%r11 + %r31], %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5ba995f  ! 871: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd202c01f  ! 872: LDUW_R	lduw	[%r11 + %r31], %r9
	.word 0xc5f2e01f  ! 873: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2e01f  ! 874: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 875: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc43ac01f  ! 876: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc602801f  ! 877: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xce02e050  ! 878: LDUW_I	lduw	[%r11 + 0x0050], %r7
	.word 0xcc82e070  ! 879: LDUWA_I	lduwa	[%r11, + 0x0070] %asi, %r6
	.word 0xc5e2a01f  ! 880: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc99ae070  ! 881: LDDFA_I	ldda	[%r11, 0x0070], %f4
	.word 0xd052801f  ! 882: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xce8ae053  ! 883: LDUBA_I	lduba	[%r11, + 0x0053] %asi, %r7
	.word 0xc5ba993f  ! 884: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 885: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc79aa058  ! 886: LDDFA_I	ldda	[%r10, 0x0058], %f3
	.word 0xd1e2901f  ! 887: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xce02801f  ! 888: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xc802c01f  ! 889: LDUW_R	lduw	[%r11 + %r31], %r4
	.word 0xc3f2911f  ! 890: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc522c01f  ! 891: STF_R	st	%f2, [%r31, %r11]
	.word 0xd3e2a01f  ! 892: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc6c2907f  ! 893: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r3
	.word 0xc8da903f  ! 894: LDXA_R	ldxa	[%r10, %r31] 0x81, %r4
	.word 0xd3e2d03f  ! 895: CASA_I	casa	[%r11] 0x81, %r31, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3f2d03f  ! 896: CASXA_I	casxa	[%r11] 0x81, %r31, %r9
	.word 0xd3e2d13f  ! 897: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xc292905f  ! 898: LDUHA_R	lduha	[%r10, %r31] 0x82, %r1
	.word 0xc882907f  ! 899: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r4
	.word 0xc3f2d01f  ! 900: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3f2e01f  ! 901: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad81f  ! 902: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc41aa018  ! 903: LDD_I	ldd	[%r10 + 0x0018], %r2
	.word 0xcc3a801f  ! 904: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd122c01f  ! 905: STF_R	st	%f8, [%r31, %r11]
TH_LABEL905:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc83aa060  ! 906: STD_I	std	%r4, [%r10 + 0x0060]
	.word 0xc24ae01c  ! 907: LDSB_I	ldsb	[%r11 + 0x001c], %r1
	.word 0xd01ae070  ! 908: LDD_I	ldd	[%r11 + 0x0070], %r8
	.word 0xc5f2a01f  ! 909: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc882a014  ! 910: LDUWA_I	lduwa	[%r10, + 0x0014] %asi, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc25ac01f  ! 911: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xcfbad89f  ! 912: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc6d2905f  ! 913: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r3
	.word 0xccd2e04e  ! 914: LDSHA_I	ldsha	[%r11, + 0x004e] %asi, %r6
	.word 0xd1f2a01f  ! 915: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1f2a01f  ! 916: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc5bae010  ! 917: STDFA_I	stda	%f2, [0x0010, %r11]
	.word 0xd3ba997f  ! 918: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc39ae040  ! 919: LDDFA_I	ldda	[%r11, 0x0040], %f1
	.word 0xcc4a801f  ! 920: LDSB_R	ldsb	[%r10 + %r31], %r6
TH_LABEL920:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc702801f  ! 921: LDF_R	ld	[%r10, %r31], %f3
	.word 0xcfba985f  ! 922: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa000  ! 923: STD_I	std	%r6, [%r10 + 0x0000]
	.word 0xc9bae018  ! 924: STDFA_I	stda	%f4, [0x0018, %r11]
	.word 0xc7ba997f  ! 925: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc442801f  ! 926: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xc5f2d01f  ! 927: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc5f2e01f  ! 928: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2e01f  ! 929: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 930: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5bad81f  ! 931: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad87f  ! 932: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad85f  ! 933: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc09aa038  ! 934: LDDA_I	ldda	[%r10, + 0x0038] %asi, %r0
	.word 0xc7ba99bf  ! 935: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7ba983f  ! 936: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcc52801f  ! 937: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xd03ac01f  ! 938: STD_R	std	%r8, [%r11 + %r31]
	.word 0xcc52a05e  ! 939: LDSH_I	ldsh	[%r10 + 0x005e], %r6
	.word 0xc252c01f  ! 940: LDSH_R	ldsh	[%r11 + %r31], %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3ba983f  ! 941: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd082e064  ! 942: LDUWA_I	lduwa	[%r11, + 0x0064] %asi, %r8
	.word 0xcdbaa050  ! 943: STDFA_I	stda	%f6, [0x0050, %r10]
	.word 0xd042a010  ! 944: LDSW_I	ldsw	[%r10 + 0x0010], %r8
	.word 0xc9e2903f  ! 945: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9e2a01f  ! 946: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba987f  ! 947: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 948: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc81a801f  ! 949: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc852a02e  ! 950: LDSH_I	ldsh	[%r10 + 0x002e], %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd082e000  ! 951: LDUWA_I	lduwa	[%r11, + 0x0000] %asi, %r8
	.word 0xcc42801f  ! 952: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xcd02801f  ! 953: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc602a034  ! 954: LDUW_I	lduw	[%r10 + 0x0034], %r3
	.word 0xc7ba999f  ! 955: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL955:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc902a028  ! 956: LDF_I	ld	[%r10, 0x0028], %f4
	.word 0xc7bad89f  ! 957: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae070  ! 958: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xc7e2e01f  ! 959: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xd39ae048  ! 960: LDDFA_I	ldda	[%r11, 0x0048], %f9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3ba983f  ! 961: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba987f  ! 962: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc9baa008  ! 963: STDFA_I	stda	%f4, [0x0008, %r10]
	.word 0xc7ba981f  ! 964: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 965: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7ba983f  ! 966: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2903f  ! 967: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba989f  ! 968: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcd9aa010  ! 969: LDDFA_I	ldda	[%r10, 0x0010], %f6
	.word 0xcdf2a01f  ! 970: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdf2901f  ! 971: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba98bf  ! 972: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc52e010  ! 973: LDSH_I	ldsh	[%r11 + 0x0010], %r6
	.word 0xc43aa020  ! 974: STD_I	std	%r2, [%r10 + 0x0020]
	.word 0xc7ba997f  ! 975: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7ba989f  ! 976: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd2dad01f  ! 977: LDXA_R	ldxa	[%r11, %r31] 0x80, %r9
	.word 0xc9ba995f  ! 978: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa020  ! 979: STD_I	std	%r4, [%r10 + 0x0020]
	.word 0xc45aa078  ! 980: LDX_I	ldx	[%r10 + 0x0078], %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc4c2a04c  ! 981: LDSWA_I	ldswa	[%r10, + 0x004c] %asi, %r2
	.word 0xcff2d13f  ! 982: CASXA_I	casxa	[%r11] 0x89, %r31, %r7
	.word 0xcfbad93f  ! 983: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d01f  ! 984: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xcd22801f  ! 985: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7f2e01f  ! 986: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad99f  ! 987: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd01ae060  ! 988: LDD_I	ldd	[%r11 + 0x0060], %r8
	.word 0xc7f2e01f  ! 989: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad87f  ! 990: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7f2d01f  ! 991: CASXA_I	casxa	[%r11] 0x80, %r31, %r3
	.word 0xcbbae030  ! 992: STDFA_I	stda	%f5, [0x0030, %r11]
	.word 0xd39ae020  ! 993: LDDFA_I	ldda	[%r11, 0x0020], %f9
	.word 0xd012e012  ! 994: LDUH_I	lduh	[%r11 + 0x0012], %r8
	.word 0xcd22c01f  ! 995: STF_R	st	%f6, [%r31, %r11]
TH_LABEL995:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1ba985f  ! 996: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca8ad17f  ! 997: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r5
	.word 0xd04ac01f  ! 998: LDSB_R	ldsb	[%r11 + %r31], %r8
	.word 0xd3ba989f  ! 999: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2911f  ! 1000: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	subcc %r30, 1, %r30
	bnz  TH5_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	add	%g0,	0x1,	%r30
TH4_LOOP_START:
	.word 0xd1f2a01f  ! 1: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba981f  ! 2: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd24ae03d  ! 3: LDSB_I	ldsb	[%r11 + 0x003d], %r9
	.word 0xc702801f  ! 4: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc85a801f  ! 5: LDX_R	ldx	[%r10 + %r31], %r4
TH_LABEL5:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5e2911f  ! 6: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5ba983f  ! 7: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc302a02c  ! 8: LDF_I	ld	[%r10, 0x002c], %f1
	.word 0xcfe2e01f  ! 9: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcbbaa008  ! 10: STDFA_I	stda	%f5, [0x0008, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcd9aa050  ! 11: LDDFA_I	ldda	[%r10, 0x0050], %f6
	.word 0xc7bad83f  ! 12: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 13: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7e2e01f  ! 14: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc2ca913f  ! 15: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd002a010  ! 16: LDUW_I	lduw	[%r10 + 0x0010], %r8
	.word 0xc5e2901f  ! 17: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5e2903f  ! 18: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba995f  ! 19: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 20: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5f2911f  ! 21: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xc5f2a01f  ! 22: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2a01f  ! 23: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc81a801f  ! 24: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc03a801f  ! 25: STD_R	std	%r0, [%r10 + %r31]
TH_LABEL25:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3ba981f  ! 26: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 27: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xcc02a010  ! 28: LDUW_I	lduw	[%r10 + 0x0010], %r6
	.word 0xd292d13f  ! 29: LDUHA_R	lduha	[%r11, %r31] 0x89, %r9
	.word 0xd1f2e01f  ! 30: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1bad95f  ! 31: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd302e030  ! 32: LDF_I	ld	[%r11, 0x0030], %f9
	.word 0xc3e2903f  ! 33: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3e2a01f  ! 34: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc5baa018  ! 35: STDFA_I	stda	%f2, [0x0018, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc43ac01f  ! 36: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 37: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad87f  ! 38: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc702c01f  ! 39: LDF_R	ld	[%r11, %r31], %f3
	.word 0xc4c2911f  ! 40: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc64aa025  ! 41: LDSB_I	ldsb	[%r10 + 0x0025], %r3
	.word 0xd1ba987f  ! 42: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc722801f  ! 43: STF_R	st	%f3, [%r31, %r10]
	.word 0xc3ba987f  ! 44: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcd02801f  ! 45: LDF_R	ld	[%r10, %r31], %f6
TH_LABEL45:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1bad87f  ! 46: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd08aa008  ! 47: LDUBA_I	lduba	[%r10, + 0x0008] %asi, %r8
	.word 0xc8d2d11f  ! 48: LDSHA_R	ldsha	[%r11, %r31] 0x88, %r4
	.word 0xc3e2901f  ! 49: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xce92a03c  ! 50: LDUHA_I	lduha	[%r10, + 0x003c] %asi, %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfba993f  ! 51: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba983f  ! 52: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd08aa042  ! 53: LDUBA_I	lduba	[%r10, + 0x0042] %asi, %r8
	.word 0xd3ba993f  ! 54: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba991f  ! 55: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc89aa050  ! 56: LDDA_I	ldda	[%r10, + 0x0050] %asi, %r4
	.word 0xd302801f  ! 57: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc5e2e01f  ! 58: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc68aa019  ! 59: LDUBA_I	lduba	[%r10, + 0x0019] %asi, %r3
	.word 0xc7e2a01f  ! 60: CASA_R	casa	[%r10] %asi, %r31, %r3
TH_LABEL60:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7e2901f  ! 61: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc302801f  ! 62: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc7f2e01f  ! 63: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7f2e01f  ! 64: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad8bf  ! 65: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7e2e01f  ! 66: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xca82d07f  ! 67: LDUWA_R	lduwa	[%r11, %r31] 0x83, %r5
	.word 0xc3ba98bf  ! 68: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 69: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 70: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3f2a01f  ! 71: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xcacaa062  ! 72: LDSBA_I	ldsba	[%r10, + 0x0062] %asi, %r5
	.word 0xc3e2903f  ! 73: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba995f  ! 74: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xccc2917f  ! 75: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3bad83f  ! 76: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d01f  ! 77: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3e2e01f  ! 78: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad85f  ! 79: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ae040  ! 80: STD_I	std	%r0, [%r11 + 0x0040]
TH_LABEL80:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc03ac01f  ! 81: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc01aa070  ! 82: LDD_I	ldd	[%r10 + 0x0070], %r0
	.word 0xc2d2d03f  ! 83: LDSHA_R	ldsha	[%r11, %r31] 0x81, %r1
	.word 0xc3f2911f  ! 84: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc3e2a01f  ! 85: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcd9ae038  ! 86: LDDFA_I	ldda	[%r11, 0x0038], %f6
	.word 0xc652c01f  ! 87: LDSH_R	ldsh	[%r11 + %r31], %r3
	.word 0xc5f2d11f  ! 88: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xc5e2e01f  ! 89: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5e2d01f  ! 90: CASA_I	casa	[%r11] 0x80, %r31, %r2
TH_LABEL90:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc842c01f  ! 91: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xc7bad95f  ! 92: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd122801f  ! 93: STF_R	st	%f8, [%r31, %r10]
	.word 0xcc3aa000  ! 94: STD_I	std	%r6, [%r10 + 0x0000]
	.word 0xcc5a801f  ! 95: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5bad81f  ! 96: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcc12c01f  ! 97: LDUH_R	lduh	[%r11 + %r31], %r6
	.word 0xd302801f  ! 98: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd3ba98bf  ! 99: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 100: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03a801f  ! 101: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc852801f  ! 102: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xcbe2e01f  ! 103: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad81f  ! 104: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad95f  ! 105: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbbad85f  ! 106: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d13f  ! 107: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xc83ae000  ! 108: STD_I	std	%r4, [%r11 + 0x0000]
	.word 0xcf02801f  ! 109: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc9f2901f  ! 110: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9e2a01f  ! 111: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2a01f  ! 112: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2a01f  ! 113: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2903f  ! 114: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc83aa000  ! 115: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9e2a01f  ! 116: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba985f  ! 117: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 118: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2903f  ! 119: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc9ba987f  ! 120: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcac2903f  ! 121: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r5
	.word 0xc9f2e01f  ! 122: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 123: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad81f  ! 124: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcf22801f  ! 125: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3f2901f  ! 126: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba993f  ! 127: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba983f  ! 128: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba999f  ! 129: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 130: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3ba993f  ! 131: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba991f  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc28a907f  ! 133: LDUBA_R	lduba	[%r10, %r31] 0x83, %r1
	.word 0xd3ba993f  ! 134: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 135: CASXA_R	casxa	[%r10]%asi, %r31, %r9
TH_LABEL135:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd0daa000  ! 136: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r8
	.word 0xd25ac01f  ! 137: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xc9ba987f  ! 138: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd2c2d15f  ! 139: LDSWA_R	ldswa	[%r11, %r31] 0x8a, %r9
	.word 0xc7bad93f  ! 140: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7bad89f  ! 141: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad91f  ! 142: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 143: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc602a058  ! 144: LDUW_I	lduw	[%r10 + 0x0058], %r3
	.word 0xd1f2d01f  ! 145: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1f2e01f  ! 146: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1e2d03f  ! 147: CASA_I	casa	[%r11] 0x81, %r31, %r8
	.word 0xcf9ae028  ! 148: LDDFA_I	ldda	[%r11, 0x0028], %f7
	.word 0xc5f2d03f  ! 149: CASXA_I	casxa	[%r11] 0x81, %r31, %r2
	.word 0xc5bad81f  ! 150: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xce8aa034  ! 151: LDUBA_I	lduba	[%r10, + 0x0034] %asi, %r7
	.word 0xcdbad81f  ! 152: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad97f  ! 153: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc9ae070  ! 154: LDDA_I	ldda	[%r11, + 0x0070] %asi, %r6
	.word 0xc6ca917f  ! 155: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc2cae059  ! 156: LDSBA_I	ldsba	[%r11, + 0x0059] %asi, %r1
	.word 0xd3e2913f  ! 157: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xc292901f  ! 158: LDUHA_R	lduha	[%r10, %r31] 0x80, %r1
	.word 0xd08ae04d  ! 159: LDUBA_I	lduba	[%r11, + 0x004d] %asi, %r8
	.word 0xc48ad03f  ! 160: LDUBA_R	lduba	[%r11, %r31] 0x81, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfba985f  ! 161: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc44ae03c  ! 162: LDSB_I	ldsb	[%r11 + 0x003c], %r2
	.word 0xd3ba987f  ! 163: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc842801f  ! 164: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xcde2d01f  ! 165: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc99aa028  ! 166: LDDFA_I	ldda	[%r10, 0x0028], %f4
	.word 0xc83aa070  ! 167: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xcbba985f  ! 168: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc6c2d13f  ! 169: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r3
	.word 0xca92905f  ! 170: LDUHA_R	lduha	[%r10, %r31] 0x82, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7e2d03f  ! 171: CASA_I	casa	[%r11] 0x81, %r31, %r3
	.word 0xc7bad81f  ! 172: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae070  ! 173: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xc43ae070  ! 174: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xc99aa020  ! 175: LDDFA_I	ldda	[%r10, 0x0020], %f4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1ba983f  ! 176: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd252a036  ! 177: LDSH_I	ldsh	[%r10 + 0x0036], %r9
	.word 0xc602e074  ! 178: LDUW_I	lduw	[%r11 + 0x0074], %r3
	.word 0xd39aa008  ! 179: LDDFA_I	ldda	[%r10, 0x0008], %f9
	.word 0xcdf2e01f  ! 180: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc442a020  ! 181: LDSW_I	ldsw	[%r10 + 0x0020], %r2
	.word 0xc722801f  ! 182: STF_R	st	%f3, [%r31, %r10]
	.word 0xd042a02c  ! 183: LDSW_I	ldsw	[%r10 + 0x002c], %r8
	.word 0xd3ba997f  ! 184: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba991f  ! 185: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL185:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3e2911f  ! 186: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xd3ba985f  ! 187: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc85ae070  ! 188: LDX_I	ldx	[%r11 + 0x0070], %r4
	.word 0xc5e2901f  ! 189: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc59ae008  ! 190: LDDFA_I	ldda	[%r11, 0x0008], %f2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdf2911f  ! 191: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcdba989f  ! 192: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba987f  ! 193: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc88a901f  ! 194: LDUBA_R	lduba	[%r10, %r31] 0x80, %r4
	.word 0xcbe2a01f  ! 195: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbba983f  ! 196: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc41aa058  ! 197: LDD_I	ldd	[%r10 + 0x0058], %r2
	.word 0xc39ae008  ! 198: LDDFA_I	ldda	[%r11, 0x0008], %f1
	.word 0xca92d17f  ! 199: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r5
	.word 0xce82a024  ! 200: LDUWA_I	lduwa	[%r10, + 0x0024] %asi, %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5ba997f  ! 201: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xca52801f  ! 202: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xd3e2d03f  ! 203: CASA_I	casa	[%r11] 0x81, %r31, %r9
	.word 0xd3f2e01f  ! 204: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad95f  ! 205: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc882d01f  ! 206: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r4
	.word 0xcfe2d01f  ! 207: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcc3ac01f  ! 208: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcfe2d11f  ! 209: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xcc3ac01f  ! 210: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfbad93f  ! 211: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xce12c01f  ! 212: LDUH_R	lduh	[%r11 + %r31], %r7
	.word 0xc7ba98bf  ! 213: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc20a801f  ! 214: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xd3bad87f  ! 215: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3bad93f  ! 216: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2d03f  ! 217: CASXA_I	casxa	[%r11] 0x81, %r31, %r9
	.word 0xd3bad91f  ! 218: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae018  ! 219: STD_I	std	%r8, [%r11 + 0x0018]
	.word 0xd102801f  ! 220: LDF_R	ld	[%r10, %r31], %f8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc4aa038  ! 221: LDSB_I	ldsb	[%r10 + 0x0038], %r6
	.word 0xc3e2a01f  ! 222: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xd00a801f  ! 223: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xcc0a801f  ! 224: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xc5e2a01f  ! 225: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5ba991f  ! 226: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 227: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa048  ! 228: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc43a801f  ! 229: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba989f  ! 230: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5f2a01f  ! 231: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2903f  ! 232: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5e2a01f  ! 233: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc502801f  ! 234: LDF_R	ld	[%r10, %r31], %f2
	.word 0xd3ba989f  ! 235: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3ba981f  ! 236: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2911f  ! 237: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xd3f2a01f  ! 238: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc302e014  ! 239: LDF_I	ld	[%r11, 0x0014], %f1
	.word 0xc292901f  ! 240: LDUHA_R	lduha	[%r10, %r31] 0x80, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd03a801f  ! 241: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba989f  ! 242: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc722c01f  ! 243: STF_R	st	%f3, [%r31, %r11]
	.word 0xc9f2a01f  ! 244: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xcb22c01f  ! 245: STF_R	st	%f5, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd03aa060  ! 246: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd03a801f  ! 247: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc692913f  ! 248: LDUHA_R	lduha	[%r10, %r31] 0x89, %r3
	.word 0xcc4ac01f  ! 249: LDSB_R	ldsb	[%r11 + %r31], %r6
	.word 0xc39ae020  ! 250: LDDFA_I	ldda	[%r11, 0x0020], %f1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc8c2e03c  ! 251: LDSWA_I	ldswa	[%r11, + 0x003c] %asi, %r4
	.word 0xc5e2a01f  ! 252: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5f2901f  ! 253: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5e2a01f  ! 254: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 255: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc9ae008  ! 256: LDDA_I	ldda	[%r11, + 0x0008] %asi, %r6
	.word 0xc9ba99bf  ! 257: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc49aa000  ! 258: LDDA_I	ldda	[%r10, + 0x0000] %asi, %r2
	.word 0xcbba985f  ! 259: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd322801f  ! 260: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdbad89f  ! 261: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd2c2a068  ! 262: LDSWA_I	ldswa	[%r10, + 0x0068] %asi, %r9
	.word 0xc9ba987f  ! 263: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 264: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba99bf  ! 265: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9f2a01f  ! 266: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2903f  ! 267: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc41aa040  ! 268: LDD_I	ldd	[%r10 + 0x0040], %r2
	.word 0xd1ba985f  ! 269: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba987f  ! 270: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd102c01f  ! 271: LDF_R	ld	[%r11, %r31], %f8
	.word 0xc7ba995f  ! 272: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 273: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 274: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7f2901f  ! 275: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7ba985f  ! 276: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcc5aa058  ! 277: LDX_I	ldx	[%r10 + 0x0058], %r6
	.word 0xd39aa040  ! 278: LDDFA_I	ldda	[%r10, 0x0040], %f9
	.word 0xd052801f  ! 279: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xc85a801f  ! 280: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3f2e01f  ! 281: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xcad2903f  ! 282: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r5
	.word 0xc6c2903f  ! 283: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r3
	.word 0xcbe2913f  ! 284: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xd09ae010  ! 285: LDDA_I	ldda	[%r11, + 0x0010] %asi, %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7bad83f  ! 286: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae038  ! 287: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xca92a06a  ! 288: LDUHA_I	lduha	[%r10, + 0x006a] %asi, %r5
	.word 0xc5f2e01f  ! 289: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2d01f  ! 290: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5bad8bf  ! 291: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad97f  ! 292: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd302c01f  ! 293: LDF_R	ld	[%r11, %r31], %f9
	.word 0xcf22c01f  ! 294: STF_R	st	%f7, [%r31, %r11]
	.word 0xc302e070  ! 295: LDF_I	ld	[%r11, 0x0070], %f1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9baa058  ! 296: STDFA_I	stda	%f4, [0x0058, %r10]
	.word 0xc602e010  ! 297: LDUW_I	lduw	[%r11 + 0x0010], %r3
	.word 0xc3ba991f  ! 298: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 299: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc88ae011  ! 300: LDUBA_I	lduba	[%r11, + 0x0011] %asi, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xce02a07c  ! 301: LDUW_I	lduw	[%r10 + 0x007c], %r7
	.word 0xd03a801f  ! 302: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc652801f  ! 303: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xc5ba985f  ! 304: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xca92911f  ! 305: LDUHA_R	lduha	[%r10, %r31] 0x88, %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdf2a01f  ! 306: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2a01f  ! 307: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc25aa028  ! 308: LDX_I	ldx	[%r10 + 0x0028], %r1
	.word 0xcadae038  ! 309: LDXA_I	ldxa	[%r11, + 0x0038] %asi, %r5
	.word 0xce8aa002  ! 310: LDUBA_I	lduba	[%r10, + 0x0002] %asi, %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc902a068  ! 311: LDF_I	ld	[%r10, 0x0068], %f4
	.word 0xcfba999f  ! 312: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba99bf  ! 313: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa038  ! 314: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xc852801f  ! 315: LDSH_R	ldsh	[%r10 + %r31], %r4
TH_LABEL315:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd002c01f  ! 316: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xce0ac01f  ! 317: LDUB_R	ldub	[%r11 + %r31], %r7
	.word 0xc49aa000  ! 318: LDDA_I	ldda	[%r10, + 0x0000] %asi, %r2
	.word 0xc83ac01f  ! 319: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad9bf  ! 320: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xceda915f  ! 321: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r7
	.word 0xcb22801f  ! 322: STF_R	st	%f5, [%r31, %r10]
	.word 0xc4daa040  ! 323: LDXA_I	ldxa	[%r10, + 0x0040] %asi, %r2
	.word 0xd1ba983f  ! 324: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd302801f  ! 325: LDF_R	ld	[%r10, %r31], %f9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc3a801f  ! 326: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc492917f  ! 327: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r2
	.word 0xcdf2913f  ! 328: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcdf2903f  ! 329: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xccda901f  ! 330: LDXA_R	ldxa	[%r10, %r31] 0x80, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3bad89f  ! 331: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad89f  ! 332: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad81f  ! 333: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd242c01f  ! 334: LDSW_R	ldsw	[%r11 + %r31], %r9
	.word 0xc7ba98bf  ! 335: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc802a014  ! 336: LDUW_I	lduw	[%r10 + 0x0014], %r4
	.word 0xcb22c01f  ! 337: STF_R	st	%f5, [%r31, %r11]
	.word 0xcfbaa010  ! 338: STDFA_I	stda	%f7, [0x0010, %r10]
	.word 0xcfbad93f  ! 339: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc52c01f  ! 340: LDSH_R	ldsh	[%r11 + %r31], %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc48aa034  ! 341: LDUBA_I	lduba	[%r10, + 0x0034] %asi, %r2
	.word 0xd1bad85f  ! 342: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d13f  ! 343: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xd1bad8bf  ! 344: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc68aa016  ! 345: LDUBA_I	lduba	[%r10, + 0x0016] %asi, %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd2d2a040  ! 346: LDSHA_I	ldsha	[%r10, + 0x0040] %asi, %r9
	.word 0xd0c2915f  ! 347: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r8
	.word 0xcfbad93f  ! 348: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd39aa000  ! 349: LDDFA_I	ldda	[%r10, 0x0000], %f9
	.word 0xd0d2e054  ! 350: LDSHA_I	ldsha	[%r11, + 0x0054] %asi, %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcd02a03c  ! 351: LDF_I	ld	[%r10, 0x003c], %f6
	.word 0xce52e074  ! 352: LDSH_I	ldsh	[%r11 + 0x0074], %r7
	.word 0xc9f2e01f  ! 353: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xcf9aa060  ! 354: LDDFA_I	ldda	[%r10, 0x0060], %f7
	.word 0xcdba981f  ! 355: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdba981f  ! 356: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc68a907f  ! 357: LDUBA_R	lduba	[%r10, %r31] 0x83, %r3
	.word 0xd3bad81f  ! 358: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad97f  ! 359: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 360: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3bad9bf  ! 361: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd1baa030  ! 362: STDFA_I	stda	%f8, [0x0030, %r10]
	.word 0xcff2911f  ! 363: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcfe2a01f  ! 364: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xca8ad03f  ! 365: LDUBA_R	lduba	[%r11, %r31] 0x81, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfba981f  ! 366: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba98bf  ! 367: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 368: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcff2913f  ! 369: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xcfba999f  ! 370: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcff2901f  ! 371: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcfba991f  ! 372: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd0dae048  ! 373: LDXA_I	ldxa	[%r11, + 0x0048] %asi, %r8
	.word 0xc3f2d11f  ! 374: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xccd2d11f  ! 375: LDSHA_R	ldsha	[%r11, %r31] 0x88, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcb9aa048  ! 376: LDDFA_I	ldda	[%r10, 0x0048], %f5
	.word 0xcc3ae048  ! 377: STD_I	std	%r6, [%r11 + 0x0048]
	.word 0xcc3ae048  ! 378: STD_I	std	%r6, [%r11 + 0x0048]
	.word 0xc84aa01e  ! 379: LDSB_I	ldsb	[%r10 + 0x001e], %r4
	.word 0xd322c01f  ! 380: STF_R	st	%f9, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1ba999f  ! 381: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc502801f  ! 382: LDF_R	ld	[%r10, %r31], %f2
	.word 0xd1ba987f  ! 383: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 384: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba987f  ! 385: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1ba997f  ! 386: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba98bf  ! 387: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc39aa020  ! 388: LDDFA_I	ldda	[%r10, 0x0020], %f1
	.word 0xc25a801f  ! 389: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xcc92d01f  ! 390: LDUHA_R	lduha	[%r11, %r31] 0x80, %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc502a00c  ! 391: LDF_I	ld	[%r10, 0x000c], %f2
	.word 0xce42e044  ! 392: LDSW_I	ldsw	[%r11 + 0x0044], %r7
	.word 0xc83ae040  ! 393: STD_I	std	%r4, [%r11 + 0x0040]
	.word 0xc9bad9bf  ! 394: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd302801f  ! 395: LDF_R	ld	[%r10, %r31], %f9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc83a801f  ! 396: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcf9aa058  ! 397: LDDFA_I	ldda	[%r10, 0x0058], %f7
	.word 0xcfba993f  ! 398: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 399: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xd24ae071  ! 400: LDSB_I	ldsb	[%r11 + 0x0071], %r9
TH_LABEL400:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc28a911f  ! 401: LDUBA_R	lduba	[%r10, %r31] 0x88, %r1
	.word 0xc3ba981f  ! 402: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc502e054  ! 403: LDF_I	ld	[%r11, 0x0054], %f2
	.word 0xd1baa070  ! 404: STDFA_I	stda	%f8, [0x0070, %r10]
	.word 0xc83a801f  ! 405: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9ba98bf  ! 406: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 407: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcf02801f  ! 408: LDF_R	ld	[%r10, %r31], %f7
	.word 0xd1ba993f  ! 409: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 410: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1f2911f  ! 411: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xc68ae06a  ! 412: LDUBA_I	lduba	[%r11, + 0x006a] %asi, %r3
	.word 0xc5f2d01f  ! 413: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc24ac01f  ! 414: LDSB_R	ldsb	[%r11 + %r31], %r1
	.word 0xd3ba981f  ! 415: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03aa060  ! 416: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd3ba983f  ! 417: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 418: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd03aa060  ! 419: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xc842a074  ! 420: LDSW_I	ldsw	[%r10 + 0x0074], %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1bad97f  ! 421: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad91f  ! 422: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad87f  ! 423: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d13f  ! 424: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xd0c2905f  ! 425: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd202a068  ! 426: LDUW_I	lduw	[%r10 + 0x0068], %r9
	.word 0xd002c01f  ! 427: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xcc8ad17f  ! 428: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r6
	.word 0xc5ba997f  ! 429: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2913f  ! 430: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5ba99bf  ! 431: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcd22c01f  ! 432: STF_R	st	%f6, [%r31, %r11]
	.word 0xc522c01f  ! 433: STF_R	st	%f2, [%r31, %r11]
	.word 0xc5baa048  ! 434: STDFA_I	stda	%f2, [0x0048, %r10]
	.word 0xcdba985f  ! 435: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc3aa038  ! 436: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xd39aa058  ! 437: LDDFA_I	ldda	[%r10, 0x0058], %f9
	.word 0xcecaa00a  ! 438: LDSBA_I	ldsba	[%r10, + 0x000a] %asi, %r7
	.word 0xc5e2e01f  ! 439: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad91f  ! 440: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5f2d11f  ! 441: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xc702e050  ! 442: LDF_I	ld	[%r11, 0x0050], %f3
	.word 0xc9ba999f  ! 443: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc68aa001  ! 444: LDUBA_I	lduba	[%r10, + 0x0001] %asi, %r3
	.word 0xc3bad91f  ! 445: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3e2d01f  ! 446: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xd302c01f  ! 447: LDF_R	ld	[%r11, %r31], %f9
	.word 0xd3f2a01f  ! 448: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd01a801f  ! 449: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xc03aa008  ! 450: STD_I	std	%r0, [%r10 + 0x0008]
TH_LABEL450:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3f2901f  ! 451: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc5baa050  ! 452: STDFA_I	stda	%f2, [0x0050, %r10]
	.word 0xc302a04c  ! 453: LDF_I	ld	[%r10, 0x004c], %f1
	.word 0xc7ba999f  ! 454: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 455: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7e2913f  ! 456: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc7f2911f  ! 457: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba995f  ! 458: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd00a801f  ! 459: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xd1ba98bf  ! 460: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1ba995f  ! 461: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 462: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2903f  ! 463: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xd1f2911f  ! 464: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xd1f2903f  ! 465: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1f2a01f  ! 466: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xccda913f  ! 467: LDXA_R	ldxa	[%r10, %r31] 0x89, %r6
	.word 0xc5ba993f  ! 468: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba983f  ! 469: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 470: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd39aa038  ! 471: LDDFA_I	ldda	[%r10, 0x0038], %f9
	.word 0xd1e2913f  ! 472: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xc39aa030  ! 473: LDDFA_I	ldda	[%r10, 0x0030], %f1
	.word 0xd1bad8bf  ! 474: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2e01f  ! 475: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc702a04c  ! 476: LDF_I	ld	[%r10, 0x004c], %f3
	.word 0xd1ba981f  ! 477: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba991f  ! 478: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 479: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd082d03f  ! 480: LDUWA_R	lduwa	[%r11, %r31] 0x81, %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9f2a01f  ! 481: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xcd22801f  ! 482: STF_R	st	%f6, [%r31, %r10]
	.word 0xd04a801f  ! 483: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xd0d2a028  ! 484: LDSHA_I	ldsha	[%r10, + 0x0028] %asi, %r8
	.word 0xc502801f  ! 485: LDF_R	ld	[%r10, %r31], %f2
TH_LABEL485:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcb02e024  ! 486: LDF_I	ld	[%r11, 0x0024], %f5
	.word 0xc9ba981f  ! 487: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 488: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc702e058  ! 489: LDF_I	ld	[%r11, 0x0058], %f3
	.word 0xcc3a801f  ! 490: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xce82d13f  ! 491: LDUWA_R	lduwa	[%r11, %r31] 0x89, %r7
	.word 0xcdba985f  ! 492: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 493: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba985f  ! 494: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 495: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcdbae068  ! 496: STDFA_I	stda	%f6, [0x0068, %r11]
	.word 0xce12c01f  ! 497: LDUH_R	lduh	[%r11 + %r31], %r7
	.word 0xd3ba99bf  ! 498: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 499: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2a01f  ! 500: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xce5aa078  ! 501: LDX_I	ldx	[%r10 + 0x0078], %r7
	.word 0xc892903f  ! 502: LDUHA_R	lduha	[%r10, %r31] 0x81, %r4
	.word 0xcbf2901f  ! 503: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbf2a01f  ! 504: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba983f  ! 505: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL505:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbf2a01f  ! 506: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2913f  ! 507: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xcbba999f  ! 508: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc59ae058  ! 509: LDDFA_I	ldda	[%r11, 0x0058], %f2
	.word 0xcc9aa008  ! 510: LDDA_I	ldda	[%r10, + 0x0008] %asi, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd052801f  ! 511: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xc43a801f  ! 512: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba981f  ! 513: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc502801f  ! 514: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcad2a06c  ! 515: LDSHA_I	ldsha	[%r10, + 0x006c] %asi, %r5
TH_LABEL515:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbba981f  ! 516: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba989f  ! 517: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 518: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd0ca911f  ! 519: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r8
	.word 0xc4d2901f  ! 520: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r2
TH_LABEL520:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcd22801f  ! 521: STF_R	st	%f6, [%r31, %r10]
	.word 0xce02c01f  ! 522: LDUW_R	lduw	[%r11 + %r31], %r7
	.word 0xd1bae068  ! 523: STDFA_I	stda	%f8, [0x0068, %r11]
	.word 0xc3ba993f  ! 524: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa028  ! 525: STD_I	std	%r0, [%r10 + 0x0028]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc642801f  ! 526: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xd212a062  ! 527: LDUH_I	lduh	[%r10 + 0x0062], %r9
	.word 0xc9f2a01f  ! 528: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xcc82e068  ! 529: LDUWA_I	lduwa	[%r11, + 0x0068] %asi, %r6
	.word 0xcfbaa078  ! 530: STDFA_I	stda	%f7, [0x0078, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc502c01f  ! 531: LDF_R	ld	[%r11, %r31], %f2
	.word 0xcdbad93f  ! 532: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd0daa008  ! 533: LDXA_I	ldxa	[%r10, + 0x0008] %asi, %r8
	.word 0xc9ba981f  ! 534: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba99bf  ! 535: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL535:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xca52c01f  ! 536: LDSH_R	ldsh	[%r11 + %r31], %r5
	.word 0xcc3aa070  ! 537: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcfba999f  ! 538: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2911f  ! 539: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xca5ac01f  ! 540: LDX_R	ldx	[%r11 + %r31], %r5
TH_LABEL540:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9e2901f  ! 541: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc2d2d07f  ! 542: LDSHA_R	ldsha	[%r11, %r31] 0x83, %r1
	.word 0xc902e020  ! 543: LDF_I	ld	[%r11, 0x0020], %f4
	.word 0xcbba995f  ! 544: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc452801f  ! 545: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc3a801f  ! 546: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2a01f  ! 547: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba999f  ! 548: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba98bf  ! 549: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2901f  ! 550: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfe2a01f  ! 551: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba983f  ! 552: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd252801f  ! 553: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xc84a801f  ! 554: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xc642a030  ! 555: LDSW_I	ldsw	[%r10 + 0x0030], %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd0dae078  ! 556: LDXA_I	ldxa	[%r11, + 0x0078] %asi, %r8
	.word 0xc8d2a05a  ! 557: LDSHA_I	ldsha	[%r10, + 0x005a] %asi, %r4
	.word 0xcc4ae005  ! 558: LDSB_I	ldsb	[%r11 + 0x0005], %r6
	.word 0xd2ca907f  ! 559: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r9
	.word 0xc5f2a01f  ! 560: CASXA_R	casxa	[%r10]%asi, %r31, %r2
TH_LABEL560:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xceda907f  ! 561: LDXA_R	ldxa	[%r10, %r31] 0x83, %r7
	.word 0xd01aa068  ! 562: LDD_I	ldd	[%r10 + 0x0068], %r8
	.word 0xd3ba989f  ! 563: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2913f  ! 564: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd322801f  ! 565: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd03ac01f  ! 566: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2e01f  ! 567: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad95f  ! 568: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad91f  ! 569: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d01f  ! 570: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc322c01f  ! 571: STF_R	st	%f1, [%r31, %r11]
	.word 0xcbbad8bf  ! 572: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc6cae005  ! 573: LDSBA_I	ldsba	[%r11, + 0x0005] %asi, %r3
	.word 0xcde2a01f  ! 574: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2911f  ! 575: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc852801f  ! 576: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xcf02801f  ! 577: LDF_R	ld	[%r10, %r31], %f7
	.word 0xd1f2a01f  ! 578: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc99ae030  ! 579: LDDFA_I	ldda	[%r11, 0x0030], %f4
	.word 0xc5e2e01f  ! 580: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc43ae030  ! 581: STD_I	std	%r2, [%r11 + 0x0030]
	.word 0xc5bad93f  ! 582: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2d03f  ! 583: CASA_I	casa	[%r11] 0x81, %r31, %r2
	.word 0xc40a801f  ! 584: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xcf22801f  ! 585: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3f2911f  ! 586: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc03aa030  ! 587: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba995f  ! 588: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcccad13f  ! 589: LDSBA_R	ldsba	[%r11, %r31] 0x89, %r6
	.word 0xce52a06c  ! 590: LDSH_I	ldsh	[%r10 + 0x006c], %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbba995f  ! 591: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 592: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xc8c2917f  ! 593: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r4
	.word 0xcfba981f  ! 594: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 595: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc642a058  ! 596: LDSW_I	ldsw	[%r10 + 0x0058], %r3
	.word 0xca12e026  ! 597: LDUH_I	lduh	[%r11 + 0x0026], %r5
	.word 0xd1e2d13f  ! 598: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xd1e2e01f  ! 599: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1f2e01f  ! 600: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd03ae070  ! 601: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xcd9aa008  ! 602: LDDFA_I	ldda	[%r10, 0x0008], %f6
	.word 0xca12a042  ! 603: LDUH_I	lduh	[%r10 + 0x0042], %r5
	.word 0xd212801f  ! 604: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xd3ba989f  ! 605: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba981f  ! 606: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 607: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc412801f  ! 608: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xc8caa048  ! 609: LDSBA_I	ldsba	[%r10, + 0x0048] %asi, %r4
	.word 0xc602801f  ! 610: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc452801f  ! 611: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xd3ba985f  ! 612: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 613: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 614: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3f2a01f  ! 615: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3ba997f  ! 616: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd2c2a00c  ! 617: LDSWA_I	ldswa	[%r10, + 0x000c] %asi, %r9
	.word 0xc9e2a01f  ! 618: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba985f  ! 619: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 620: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc83a801f  ! 621: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba991f  ! 622: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 623: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9e2a01f  ! 624: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xca0a801f  ! 625: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3e2901f  ! 626: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3e2903f  ! 627: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba997f  ! 628: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 629: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc81ac01f  ! 630: LDD_R	ldd	[%r11 + %r31], %r4
TH_LABEL630:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7ba991f  ! 631: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba995f  ! 632: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 633: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba985f  ! 634: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcc92a042  ! 635: LDUHA_I	lduha	[%r10, + 0x0042] %asi, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbba983f  ! 636: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba993f  ! 637: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba991f  ! 638: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xce12e00a  ! 639: LDUH_I	lduh	[%r11 + 0x000a], %r7
	.word 0xce4a801f  ! 640: LDSB_R	ldsb	[%r10 + %r31], %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfba985f  ! 641: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2913f  ! 642: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcfba999f  ! 643: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcd02c01f  ! 644: LDF_R	ld	[%r11, %r31], %f6
	.word 0xc5e2901f  ! 645: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbbaa060  ! 646: STDFA_I	stda	%f5, [0x0060, %r10]
	.word 0xcbbaa040  ! 647: STDFA_I	stda	%f5, [0x0040, %r10]
	.word 0xd3e2a01f  ! 648: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba997f  ! 649: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 650: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3f2911f  ! 651: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd03a801f  ! 652: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba989f  ! 653: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcf02a034  ! 654: LDF_I	ld	[%r10, 0x0034], %f7
	.word 0xc6c2917f  ! 655: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd0d2a04e  ! 656: LDSHA_I	ldsha	[%r10, + 0x004e] %asi, %r8
	.word 0xc43a801f  ! 657: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa048  ! 658: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc7ba989f  ! 659: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcfbaa000  ! 660: STDFA_I	stda	%f7, [0x0000, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc2d2d17f  ! 661: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r1
	.word 0xc9e2913f  ! 662: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba981f  ! 663: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba995f  ! 664: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xce4ac01f  ! 665: LDSB_R	ldsb	[%r11 + %r31], %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc59aa040  ! 666: LDDFA_I	ldda	[%r10, 0x0040], %f2
	.word 0xca0aa077  ! 667: LDUB_I	ldub	[%r10 + 0x0077], %r5
	.word 0xc3bad93f  ! 668: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xce92d17f  ! 669: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r7
	.word 0xd20a801f  ! 670: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3bad97f  ! 671: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd05a801f  ! 672: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xd1ba981f  ! 673: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc902801f  ! 674: LDF_R	ld	[%r10, %r31], %f4
	.word 0xcdf2e01f  ! 675: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdbad8bf  ! 676: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc84a801f  ! 677: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xc3f2913f  ! 678: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xd2cae043  ! 679: LDSBA_I	ldsba	[%r11, + 0x0043] %asi, %r9
	.word 0xc43a801f  ! 680: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcd02c01f  ! 681: LDF_R	ld	[%r11, %r31], %f6
	.word 0xc7bad83f  ! 682: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad99f  ! 683: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd102e068  ! 684: LDF_I	ld	[%r11, 0x0068], %f8
	.word 0xcf02801f  ! 685: LDF_R	ld	[%r10, %r31], %f7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xca12801f  ! 686: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xc922801f  ! 687: STF_R	st	%f4, [%r31, %r10]
	.word 0xcfbad99f  ! 688: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcbbaa058  ! 689: STDFA_I	stda	%f5, [0x0058, %r10]
	.word 0xcc0ac01f  ! 690: LDUB_R	ldub	[%r11 + %r31], %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd03a801f  ! 691: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba987f  ! 692: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 693: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd01ae050  ! 694: LDD_I	ldd	[%r11 + 0x0050], %r8
	.word 0xc202a074  ! 695: LDUW_I	lduw	[%r10 + 0x0074], %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdbaa028  ! 696: STDFA_I	stda	%f6, [0x0028, %r10]
	.word 0xc01a801f  ! 697: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xd3e2e01f  ! 698: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad81f  ! 699: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad8bf  ! 700: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc8aa059  ! 701: LDUBA_I	lduba	[%r10, + 0x0059] %asi, %r6
	.word 0xc3e2a01f  ! 702: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba981f  ! 703: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc41a801f  ! 704: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xca02801f  ! 705: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7e2901f  ! 706: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xd09aa030  ! 707: LDDA_I	ldda	[%r10, + 0x0030] %asi, %r8
	.word 0xc7f2a01f  ! 708: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xcd02e020  ! 709: LDF_I	ld	[%r11, 0x0020], %f6
	.word 0xc2d2d13f  ! 710: LDSHA_R	ldsha	[%r11, %r31] 0x89, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3bad89f  ! 711: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 712: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc03ae040  ! 713: STD_I	std	%r0, [%r11 + 0x0040]
	.word 0xca0ac01f  ! 714: LDUB_R	ldub	[%r11 + %r31], %r5
	.word 0xca4aa078  ! 715: LDSB_I	ldsb	[%r10 + 0x0078], %r5
TH_LABEL715:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xce12801f  ! 716: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xc7baa040  ! 717: STDFA_I	stda	%f3, [0x0040, %r10]
	.word 0xcec2a064  ! 718: LDSWA_I	ldswa	[%r10, + 0x0064] %asi, %r7
	.word 0xc65aa050  ! 719: LDX_I	ldx	[%r10 + 0x0050], %r3
	.word 0xc5bad81f  ! 720: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcedae058  ! 721: LDXA_I	ldxa	[%r11, + 0x0058] %asi, %r7
	.word 0xc7bad81f  ! 722: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd122801f  ! 723: STF_R	st	%f8, [%r31, %r10]
	.word 0xc9e2913f  ! 724: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9f2903f  ! 725: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xce4ac01f  ! 726: LDSB_R	ldsb	[%r11 + %r31], %r7
	.word 0xca0a801f  ! 727: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xcbba995f  ! 728: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba999f  ! 729: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba991f  ! 730: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcb9aa028  ! 731: LDDFA_I	ldda	[%r10, 0x0028], %f5
	.word 0xd3f2d13f  ! 732: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xd3bad9bf  ! 733: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc252801f  ! 734: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xc9f2d13f  ! 735: CASXA_I	casxa	[%r11] 0x89, %r31, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9bad85f  ! 736: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc6ca917f  ! 737: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r3
	.word 0xc83a801f  ! 738: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba981f  ! 739: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 740: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd2c2905f  ! 741: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r9
	.word 0xc252e046  ! 742: LDSH_I	ldsh	[%r11 + 0x0046], %r1
	.word 0xc652801f  ! 743: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xcfbaa078  ! 744: STDFA_I	stda	%f7, [0x0078, %r10]
	.word 0xc7bae070  ! 745: STDFA_I	stda	%f3, [0x0070, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcf9ae048  ! 746: LDDFA_I	ldda	[%r11, 0x0048], %f7
	.word 0xcc3aa068  ! 747: STD_I	std	%r6, [%r10 + 0x0068]
	.word 0xcdba989f  ! 748: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcfbaa038  ! 749: STDFA_I	stda	%f7, [0x0038, %r10]
	.word 0xc5ba997f  ! 750: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5f2901f  ! 751: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xd20aa04a  ! 752: LDUB_I	ldub	[%r10 + 0x004a], %r9
	.word 0xcb22c01f  ! 753: STF_R	st	%f5, [%r31, %r11]
	.word 0xceca915f  ! 754: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r7
	.word 0xd04a801f  ! 755: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc88ae02f  ! 756: LDUBA_I	lduba	[%r11, + 0x002f] %asi, %r4
	.word 0xcf02a048  ! 757: LDF_I	ld	[%r10, 0x0048], %f7
	.word 0xd2cad15f  ! 758: LDSBA_R	ldsba	[%r11, %r31] 0x8a, %r9
	.word 0xd102801f  ! 759: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc43a801f  ! 760: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7e2901f  ! 761: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc43aa038  ! 762: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xd2c2907f  ! 763: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r9
	.word 0xc3bad87f  ! 764: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 765: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd00a801f  ! 766: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xd1bad89f  ! 767: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ac01f  ! 768: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1f2d11f  ! 769: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xc642c01f  ! 770: LDSW_R	ldsw	[%r11 + %r31], %r3
TH_LABEL770:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3ba993f  ! 771: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc6ca911f  ! 772: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r3
	.word 0xc5ba989f  ! 773: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 774: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 775: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xce12a074  ! 776: LDUH_I	lduh	[%r10 + 0x0074], %r7
	.word 0xc8da901f  ! 777: LDXA_R	ldxa	[%r10, %r31] 0x80, %r4
	.word 0xc25a801f  ! 778: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xcc52a004  ! 779: LDSH_I	ldsh	[%r10 + 0x0004], %r6
	.word 0xca52e002  ! 780: LDSH_I	ldsh	[%r11 + 0x0002], %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3ba993f  ! 781: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba983f  ! 782: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa060  ! 783: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd3ba985f  ! 784: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa060  ! 785: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcb22c01f  ! 786: STF_R	st	%f5, [%r31, %r11]
	.word 0xc41a801f  ! 787: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xca8ad11f  ! 788: LDUBA_R	lduba	[%r11, %r31] 0x88, %r5
	.word 0xcfba985f  ! 789: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd39aa008  ! 790: LDDFA_I	ldda	[%r10, 0x0008], %f9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd09aa048  ! 791: LDDA_I	ldda	[%r10, + 0x0048] %asi, %r8
	.word 0xc7ba981f  ! 792: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa068  ! 793: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xd39ae010  ! 794: LDDFA_I	ldda	[%r11, 0x0010], %f9
	.word 0xcfba991f  ! 795: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd0d2d01f  ! 796: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r8
	.word 0xc80a801f  ! 797: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xc682903f  ! 798: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r3
	.word 0xcbe2e01f  ! 799: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xc892901f  ! 800: LDUHA_R	lduha	[%r10, %r31] 0x80, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbf2e01f  ! 801: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad89f  ! 802: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd302a054  ! 803: LDF_I	ld	[%r10, 0x0054], %f9
	.word 0xca0aa04a  ! 804: LDUB_I	ldub	[%r10 + 0x004a], %r5
	.word 0xc7bad95f  ! 805: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xca82a01c  ! 806: LDUWA_I	lduwa	[%r10, + 0x001c] %asi, %r5
	.word 0xcfba997f  ! 807: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba999f  ! 808: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 809: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba985f  ! 810: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcd02a06c  ! 811: LDF_I	ld	[%r10, 0x006c], %f6
	.word 0xd05ac01f  ! 812: LDX_R	ldx	[%r11 + %r31], %r8
	.word 0xcc92a022  ! 813: LDUHA_I	lduha	[%r10, + 0x0022] %asi, %r6
	.word 0xd28aa01c  ! 814: LDUBA_I	lduba	[%r10, + 0x001c] %asi, %r9
	.word 0xd03ae060  ! 815: STD_I	std	%r8, [%r11 + 0x0060]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3bad81f  ! 816: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 817: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xcf02e02c  ! 818: LDF_I	ld	[%r11, 0x002c], %f7
	.word 0xcec2d15f  ! 819: LDSWA_R	ldswa	[%r11, %r31] 0x8a, %r7
	.word 0xce02e030  ! 820: LDUW_I	lduw	[%r11 + 0x0030], %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3ba983f  ! 821: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc39ae008  ! 822: LDDFA_I	ldda	[%r11, 0x0008], %f1
	.word 0xc5bad99f  ! 823: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad91f  ! 824: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad91f  ! 825: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc292e030  ! 826: LDUHA_I	lduha	[%r11, + 0x0030] %asi, %r1
	.word 0xcbbad87f  ! 827: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad83f  ! 828: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc02a05c  ! 829: LDUW_I	lduw	[%r10 + 0x005c], %r6
	.word 0xc9bad93f  ! 830: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9f2e01f  ! 831: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 832: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9f2d13f  ! 833: CASXA_I	casxa	[%r11] 0x89, %r31, %r4
	.word 0xcccae017  ! 834: LDSBA_I	ldsba	[%r11, + 0x0017] %asi, %r6
	.word 0xc9baa020  ! 835: STDFA_I	stda	%f4, [0x0020, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7ba99bf  ! 836: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc4ca907f  ! 837: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r2
	.word 0xc3e2901f  ! 838: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xcbbaa010  ! 839: STDFA_I	stda	%f5, [0x0010, %r10]
	.word 0xce92a078  ! 840: LDUHA_I	lduha	[%r10, + 0x0078] %asi, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc83ac01f  ! 841: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9e2d03f  ! 842: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xc9e2d03f  ! 843: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xd082915f  ! 844: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r8
	.word 0xc702c01f  ! 845: LDF_R	ld	[%r11, %r31], %f3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc43aa038  ! 846: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc43aa038  ! 847: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc7f2a01f  ! 848: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba991f  ! 849: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcf9aa038  ! 850: LDDFA_I	ldda	[%r10, 0x0038], %f7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbf2e01f  ! 851: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad8bf  ! 852: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc682d05f  ! 853: LDUWA_R	lduwa	[%r11, %r31] 0x82, %r3
	.word 0xc79ae000  ! 854: LDDFA_I	ldda	[%r11, 0x0000], %f3
	.word 0xd1e2911f  ! 855: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03aa018  ! 856: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xcad2d13f  ! 857: LDSHA_R	ldsha	[%r11, %r31] 0x89, %r5
	.word 0xc9ba989f  ! 858: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd092905f  ! 859: LDUHA_R	lduha	[%r10, %r31] 0x82, %r8
	.word 0xc6caa038  ! 860: LDSBA_I	ldsba	[%r10, + 0x0038] %asi, %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9bad99f  ! 861: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d11f  ! 862: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xc9f2d11f  ! 863: CASXA_I	casxa	[%r11] 0x88, %r31, %r4
	.word 0xc83ac01f  ! 864: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9f2d01f  ! 865: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9e2d01f  ! 866: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xce82907f  ! 867: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r7
	.word 0xc3e2d03f  ! 868: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xcf02c01f  ! 869: LDF_R	ld	[%r11, %r31], %f7
	.word 0xc842801f  ! 870: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5ba983f  ! 871: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc02c01f  ! 872: LDUW_R	lduw	[%r11 + %r31], %r6
	.word 0xc5f2e01f  ! 873: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2e01f  ! 874: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 875: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc43ac01f  ! 876: STD_R	std	%r2, [%r11 + %r31]
	.word 0xcc02801f  ! 877: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xc602e040  ! 878: LDUW_I	lduw	[%r11 + 0x0040], %r3
	.word 0xcc82e038  ! 879: LDUWA_I	lduwa	[%r11, + 0x0038] %asi, %r6
	.word 0xc5e2a01f  ! 880: CASA_R	casa	[%r10] %asi, %r31, %r2
TH_LABEL880:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc59aa050  ! 881: LDDFA_I	ldda	[%r10, 0x0050], %f2
	.word 0xc452c01f  ! 882: LDSH_R	ldsh	[%r11 + %r31], %r2
	.word 0xc68ae02d  ! 883: LDUBA_I	lduba	[%r11, + 0x002d] %asi, %r3
	.word 0xc5ba983f  ! 884: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 885: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL885:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc59ae068  ! 886: LDDFA_I	ldda	[%r11, 0x0068], %f2
	.word 0xd1e2901f  ! 887: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc202c01f  ! 888: LDUW_R	lduw	[%r11 + %r31], %r1
	.word 0xc402801f  ! 889: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xc3f2903f  ! 890: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
TH_LABEL890:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd122801f  ! 891: STF_R	st	%f8, [%r31, %r10]
	.word 0xd3e2a01f  ! 892: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc8c2901f  ! 893: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r4
	.word 0xceda905f  ! 894: LDXA_R	ldxa	[%r10, %r31] 0x82, %r7
	.word 0xd3e2d01f  ! 895: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3f2d01f  ! 896: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd3e2d11f  ! 897: CASA_I	casa	[%r11] 0x88, %r31, %r9
	.word 0xc692d05f  ! 898: LDUHA_R	lduha	[%r11, %r31] 0x82, %r3
	.word 0xd082d03f  ! 899: LDUWA_R	lduwa	[%r11, %r31] 0x81, %r8
	.word 0xc3f2d11f  ! 900: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3f2e01f  ! 901: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad95f  ! 902: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcc1ae018  ! 903: LDD_I	ldd	[%r11 + 0x0018], %r6
	.word 0xcc3a801f  ! 904: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcd22801f  ! 905: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc83aa060  ! 906: STD_I	std	%r4, [%r10 + 0x0060]
	.word 0xce4aa055  ! 907: LDSB_I	ldsb	[%r10 + 0x0055], %r7
	.word 0xc01aa060  ! 908: LDD_I	ldd	[%r10 + 0x0060], %r0
	.word 0xc5f2a01f  ! 909: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xd082a004  ! 910: LDUWA_I	lduwa	[%r10, + 0x0004] %asi, %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc45ac01f  ! 911: LDX_R	ldx	[%r11 + %r31], %r2
	.word 0xcfbad91f  ! 912: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc8d2913f  ! 913: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r4
	.word 0xced2a02a  ! 914: LDSHA_I	ldsha	[%r10, + 0x002a] %asi, %r7
	.word 0xd1f2a01f  ! 915: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1f2a01f  ! 916: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd3bae068  ! 917: STDFA_I	stda	%f9, [0x0068, %r11]
	.word 0xd3ba985f  ! 918: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcb9aa068  ! 919: LDDFA_I	ldda	[%r10, 0x0068], %f5
	.word 0xce4a801f  ! 920: LDSB_R	ldsb	[%r10 + %r31], %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd302801f  ! 921: LDF_R	ld	[%r10, %r31], %f9
	.word 0xcfba981f  ! 922: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa000  ! 923: STD_I	std	%r6, [%r10 + 0x0000]
	.word 0xcfbaa010  ! 924: STDFA_I	stda	%f7, [0x0010, %r10]
	.word 0xc7ba999f  ! 925: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc642801f  ! 926: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc5f2d03f  ! 927: CASXA_I	casxa	[%r11] 0x81, %r31, %r2
	.word 0xc5f2e01f  ! 928: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2e01f  ! 929: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 930: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5bad95f  ! 931: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad8bf  ! 932: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad85f  ! 933: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc09ae078  ! 934: LDDA_I	ldda	[%r11, + 0x0078] %asi, %r0
	.word 0xc7ba995f  ! 935: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7ba997f  ! 936: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xce52801f  ! 937: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xd03ac01f  ! 938: STD_R	std	%r8, [%r11 + %r31]
	.word 0xcc52e078  ! 939: LDSH_I	ldsh	[%r11 + 0x0078], %r6
	.word 0xce52c01f  ! 940: LDSH_R	ldsh	[%r11 + %r31], %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3ba99bf  ! 941: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd082a058  ! 942: LDUWA_I	lduwa	[%r10, + 0x0058] %asi, %r8
	.word 0xc9baa010  ! 943: STDFA_I	stda	%f4, [0x0010, %r10]
	.word 0xc842a078  ! 944: LDSW_I	ldsw	[%r10 + 0x0078], %r4
	.word 0xc9e2903f  ! 945: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9e2a01f  ! 946: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba981f  ! 947: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2913f  ! 948: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xcc1ac01f  ! 949: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xd052e038  ! 950: LDSH_I	ldsh	[%r11 + 0x0038], %r8
TH_LABEL950:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc482a06c  ! 951: LDUWA_I	lduwa	[%r10, + 0x006c] %asi, %r2
	.word 0xc642801f  ! 952: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc902801f  ! 953: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc402e008  ! 954: LDUW_I	lduw	[%r11 + 0x0008], %r2
	.word 0xc7ba991f  ! 955: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd302a00c  ! 956: LDF_I	ld	[%r10, 0x000c], %f9
	.word 0xc7bad91f  ! 957: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae070  ! 958: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xc7e2e01f  ! 959: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xd19aa028  ! 960: LDDFA_I	ldda	[%r10, 0x0028], %f8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3ba981f  ! 961: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 962: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3bae010  ! 963: STDFA_I	stda	%f1, [0x0010, %r11]
	.word 0xc7ba999f  ! 964: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 965: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7ba985f  ! 966: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2901f  ! 967: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba99bf  ! 968: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcb9ae078  ! 969: LDDFA_I	ldda	[%r11, 0x0078], %f5
	.word 0xcdf2a01f  ! 970: CASXA_R	casxa	[%r10]%asi, %r31, %r6
TH_LABEL970:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcdf2913f  ! 971: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcdba987f  ! 972: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xce52e040  ! 973: LDSH_I	ldsh	[%r11 + 0x0040], %r7
	.word 0xc43aa020  ! 974: STD_I	std	%r2, [%r10 + 0x0020]
	.word 0xc7ba987f  ! 975: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7ba99bf  ! 976: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xccda907f  ! 977: LDXA_R	ldxa	[%r10, %r31] 0x83, %r6
	.word 0xc9ba997f  ! 978: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa020  ! 979: STD_I	std	%r4, [%r10 + 0x0020]
	.word 0xc45ae028  ! 980: LDX_I	ldx	[%r11 + 0x0028], %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc4c2e04c  ! 981: LDSWA_I	ldswa	[%r11, + 0x004c] %asi, %r2
	.word 0xcff2d01f  ! 982: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad8bf  ! 983: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d11f  ! 984: CASXA_I	casxa	[%r11] 0x88, %r31, %r7
	.word 0xcd22801f  ! 985: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7f2e01f  ! 986: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad85f  ! 987: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcc1aa038  ! 988: LDD_I	ldd	[%r10 + 0x0038], %r6
	.word 0xc7f2e01f  ! 989: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad99f  ! 990: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7f2d13f  ! 991: CASXA_I	casxa	[%r11] 0x89, %r31, %r3
	.word 0xc7bae068  ! 992: STDFA_I	stda	%f3, [0x0068, %r11]
	.word 0xd19ae068  ! 993: LDDFA_I	ldda	[%r11, 0x0068], %f8
	.word 0xc812e076  ! 994: LDUH_I	lduh	[%r11 + 0x0076], %r4
	.word 0xd322801f  ! 995: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1ba983f  ! 996: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xce8a901f  ! 997: LDUBA_R	lduba	[%r10, %r31] 0x80, %r7
	.word 0xc64ac01f  ! 998: LDSB_R	ldsb	[%r11 + %r31], %r3
	.word 0xd3ba981f  ! 999: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2903f  ! 1000: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	subcc %r30, 1, %r30
	bnz  TH4_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	add	%g0,	0x1,	%r30
TH3_LOOP_START:
	.word 0xd1f2a01f  ! 1: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba981f  ! 2: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc24aa014  ! 3: LDSB_I	ldsb	[%r10 + 0x0014], %r1
	.word 0xc302c01f  ! 4: LDF_R	ld	[%r11, %r31], %f1
	.word 0xc45a801f  ! 5: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5e2913f  ! 6: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5ba993f  ! 7: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcb02a020  ! 8: LDF_I	ld	[%r10, 0x0020], %f5
	.word 0xcfe2e01f  ! 9: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcdbaa068  ! 10: STDFA_I	stda	%f6, [0x0068, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcd9aa048  ! 11: LDDFA_I	ldda	[%r10, 0x0048], %f6
	.word 0xc7bad97f  ! 12: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 13: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7e2e01f  ! 14: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xceca901f  ! 15: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc402a070  ! 16: LDUW_I	lduw	[%r10 + 0x0070], %r2
	.word 0xc5e2911f  ! 17: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5e2901f  ! 18: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba999f  ! 19: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 20: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL20:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5f2901f  ! 21: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2a01f  ! 22: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2a01f  ! 23: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc41ac01f  ! 24: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xc03a801f  ! 25: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3ba985f  ! 26: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 27: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xd202e074  ! 28: LDUW_I	lduw	[%r11 + 0x0074], %r9
	.word 0xce92d13f  ! 29: LDUHA_R	lduha	[%r11, %r31] 0x89, %r7
	.word 0xd1f2e01f  ! 30: CASXA_R	casxa	[%r11]%asi, %r31, %r8
TH_LABEL30:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1bad99f  ! 31: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc502a044  ! 32: LDF_I	ld	[%r10, 0x0044], %f2
	.word 0xc3e2913f  ! 33: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc3e2a01f  ! 34: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3baa010  ! 35: STDFA_I	stda	%f1, [0x0010, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc43ac01f  ! 36: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 37: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad87f  ! 38: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc702801f  ! 39: LDF_R	ld	[%r10, %r31], %f3
	.word 0xccc2d15f  ! 40: LDSWA_R	ldswa	[%r11, %r31] 0x8a, %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xca4ae05a  ! 41: LDSB_I	ldsb	[%r11 + 0x005a], %r5
	.word 0xd1ba993f  ! 42: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd122c01f  ! 43: STF_R	st	%f8, [%r31, %r11]
	.word 0xc3ba999f  ! 44: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcf02801f  ! 45: LDF_R	ld	[%r10, %r31], %f7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1bad89f  ! 46: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd08aa041  ! 47: LDUBA_I	lduba	[%r10, + 0x0041] %asi, %r8
	.word 0xd0d2d03f  ! 48: LDSHA_R	ldsha	[%r11, %r31] 0x81, %r8
	.word 0xc3e2913f  ! 49: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc292a06a  ! 50: LDUHA_I	lduha	[%r10, + 0x006a] %asi, %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfba995f  ! 51: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba993f  ! 52: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca8ae038  ! 53: LDUBA_I	lduba	[%r11, + 0x0038] %asi, %r5
	.word 0xd3ba987f  ! 54: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 55: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL55:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc09aa030  ! 56: LDDA_I	ldda	[%r10, + 0x0030] %asi, %r0
	.word 0xd102c01f  ! 57: LDF_R	ld	[%r11, %r31], %f8
	.word 0xc5e2e01f  ! 58: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xca8aa046  ! 59: LDUBA_I	lduba	[%r10, + 0x0046] %asi, %r5
	.word 0xc7e2a01f  ! 60: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7e2903f  ! 61: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xd102801f  ! 62: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc7f2e01f  ! 63: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7f2e01f  ! 64: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad95f  ! 65: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7e2e01f  ! 66: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc682905f  ! 67: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r3
	.word 0xc3ba985f  ! 68: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 69: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 70: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL70:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3f2a01f  ! 71: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc8caa064  ! 72: LDSBA_I	ldsba	[%r10, + 0x0064] %asi, %r4
	.word 0xc3e2913f  ! 73: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc3ba981f  ! 74: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc2c2901f  ! 75: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3bad99f  ! 76: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d01f  ! 77: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3e2e01f  ! 78: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad81f  ! 79: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ae040  ! 80: STD_I	std	%r0, [%r11 + 0x0040]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc03ac01f  ! 81: STD_R	std	%r0, [%r11 + %r31]
	.word 0xcc1ae008  ! 82: LDD_I	ldd	[%r11 + 0x0008], %r6
	.word 0xc8d2915f  ! 83: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r4
	.word 0xc3f2901f  ! 84: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3e2a01f  ! 85: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc99aa030  ! 86: LDDFA_I	ldda	[%r10, 0x0030], %f4
	.word 0xd252801f  ! 87: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xc5f2d03f  ! 88: CASXA_I	casxa	[%r11] 0x81, %r31, %r2
	.word 0xc5e2e01f  ! 89: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5e2d01f  ! 90: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd042801f  ! 91: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xc7bad91f  ! 92: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc522c01f  ! 93: STF_R	st	%f2, [%r31, %r11]
	.word 0xcc3aa000  ! 94: STD_I	std	%r6, [%r10 + 0x0000]
	.word 0xcc5a801f  ! 95: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5bad97f  ! 96: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd012801f  ! 97: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xc302c01f  ! 98: LDF_R	ld	[%r11, %r31], %f1
	.word 0xd3ba991f  ! 99: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 100: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd03a801f  ! 101: STD_R	std	%r8, [%r10 + %r31]
	.word 0xca52801f  ! 102: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xcbe2e01f  ! 103: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad81f  ! 104: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 105: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbbad83f  ! 106: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d01f  ! 107: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xc83ae000  ! 108: STD_I	std	%r4, [%r11 + 0x0000]
	.word 0xcb02801f  ! 109: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc9f2911f  ! 110: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9e2a01f  ! 111: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2a01f  ! 112: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2a01f  ! 113: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2901f  ! 114: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc83aa000  ! 115: STD_I	std	%r4, [%r10 + 0x0000]
TH_LABEL115:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9e2a01f  ! 116: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba98bf  ! 117: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 118: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2911f  ! 119: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba981f  ! 120: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc6c2d01f  ! 121: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r3
	.word 0xc9f2e01f  ! 122: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 123: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad95f  ! 124: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcf22801f  ! 125: STF_R	st	%f7, [%r31, %r10]
TH_LABEL125:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3f2911f  ! 126: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd3ba99bf  ! 127: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba991f  ! 128: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba985f  ! 129: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 130: STD_I	std	%r8, [%r10 + 0x0000]
TH_LABEL130:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3ba981f  ! 131: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc68a901f  ! 133: LDUBA_R	lduba	[%r10, %r31] 0x80, %r3
	.word 0xd3ba99bf  ! 134: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 135: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd0dae020  ! 136: LDXA_I	ldxa	[%r11, + 0x0020] %asi, %r8
	.word 0xce5a801f  ! 137: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xc9ba981f  ! 138: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcec2903f  ! 139: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r7
	.word 0xc7bad99f  ! 140: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7bad91f  ! 141: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad91f  ! 142: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 143: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xce02a048  ! 144: LDUW_I	lduw	[%r10 + 0x0048], %r7
	.word 0xd1f2d13f  ! 145: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1f2e01f  ! 146: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1e2d01f  ! 147: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xcf9ae040  ! 148: LDDFA_I	ldda	[%r11, 0x0040], %f7
	.word 0xc5f2d13f  ! 149: CASXA_I	casxa	[%r11] 0x89, %r31, %r2
	.word 0xc5bad89f  ! 150: STDFA_R	stda	%f2, [%r31, %r11]
TH_LABEL150:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc48aa078  ! 151: LDUBA_I	lduba	[%r10, + 0x0078] %asi, %r2
	.word 0xcdbad99f  ! 152: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad85f  ! 153: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc9aa078  ! 154: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r6
	.word 0xd0cad17f  ! 155: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcecae026  ! 156: LDSBA_I	ldsba	[%r11, + 0x0026] %asi, %r7
	.word 0xd3e2901f  ! 157: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd292d05f  ! 158: LDUHA_R	lduha	[%r11, %r31] 0x82, %r9
	.word 0xce8ae067  ! 159: LDUBA_I	lduba	[%r11, + 0x0067] %asi, %r7
	.word 0xd28a917f  ! 160: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfba981f  ! 161: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xce4ae00a  ! 162: LDSB_I	ldsb	[%r11 + 0x000a], %r7
	.word 0xd3ba997f  ! 163: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc842c01f  ! 164: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xcde2d03f  ! 165: CASA_I	casa	[%r11] 0x81, %r31, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc39aa038  ! 166: LDDFA_I	ldda	[%r10, 0x0038], %f1
	.word 0xc83aa070  ! 167: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xcbba995f  ! 168: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcec2d11f  ! 169: LDSWA_R	ldswa	[%r11, %r31] 0x88, %r7
	.word 0xd092917f  ! 170: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7e2d11f  ! 171: CASA_I	casa	[%r11] 0x88, %r31, %r3
	.word 0xc7bad85f  ! 172: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae070  ! 173: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xc43ae070  ! 174: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xd19aa008  ! 175: LDDFA_I	ldda	[%r10, 0x0008], %f8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1ba991f  ! 176: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca52a078  ! 177: LDSH_I	ldsh	[%r10 + 0x0078], %r5
	.word 0xcc02a05c  ! 178: LDUW_I	lduw	[%r10 + 0x005c], %r6
	.word 0xd19aa008  ! 179: LDDFA_I	ldda	[%r10, 0x0008], %f8
	.word 0xcdf2e01f  ! 180: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc442e040  ! 181: LDSW_I	ldsw	[%r11 + 0x0040], %r2
	.word 0xcd22c01f  ! 182: STF_R	st	%f6, [%r31, %r11]
	.word 0xce42a05c  ! 183: LDSW_I	ldsw	[%r10 + 0x005c], %r7
	.word 0xd3ba981f  ! 184: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 185: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3e2901f  ! 186: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba995f  ! 187: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd25ae058  ! 188: LDX_I	ldx	[%r11 + 0x0058], %r9
	.word 0xc5e2901f  ! 189: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc79aa008  ! 190: LDDFA_I	ldda	[%r10, 0x0008], %f3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdf2901f  ! 191: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba999f  ! 192: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 193: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc28ad03f  ! 194: LDUBA_R	lduba	[%r11, %r31] 0x81, %r1
	.word 0xcbe2a01f  ! 195: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba997f  ! 196: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc81aa030  ! 197: LDD_I	ldd	[%r10 + 0x0030], %r4
	.word 0xc79aa060  ! 198: LDDFA_I	ldda	[%r10, 0x0060], %f3
	.word 0xce92917f  ! 199: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r7
	.word 0xd282e064  ! 200: LDUWA_I	lduwa	[%r11, + 0x0064] %asi, %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5ba98bf  ! 201: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd252801f  ! 202: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xd3e2d11f  ! 203: CASA_I	casa	[%r11] 0x88, %r31, %r9
	.word 0xd3f2e01f  ! 204: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad85f  ! 205: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd282d05f  ! 206: LDUWA_R	lduwa	[%r11, %r31] 0x82, %r9
	.word 0xcfe2d13f  ! 207: CASA_I	casa	[%r11] 0x89, %r31, %r7
	.word 0xcc3ac01f  ! 208: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcfe2d11f  ! 209: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xcc3ac01f  ! 210: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfbad87f  ! 211: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xca12c01f  ! 212: LDUH_R	lduh	[%r11 + %r31], %r5
	.word 0xc7ba987f  ! 213: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc40ac01f  ! 214: LDUB_R	ldub	[%r11 + %r31], %r2
	.word 0xd3bad9bf  ! 215: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3bad85f  ! 216: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2d01f  ! 217: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd3bad81f  ! 218: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae018  ! 219: STD_I	std	%r8, [%r11 + 0x0018]
	.word 0xd302801f  ! 220: LDF_R	ld	[%r10, %r31], %f9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xca4aa059  ! 221: LDSB_I	ldsb	[%r10 + 0x0059], %r5
	.word 0xc3e2a01f  ! 222: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xca0a801f  ! 223: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xce0a801f  ! 224: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xc5e2a01f  ! 225: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5ba985f  ! 226: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba997f  ! 227: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa048  ! 228: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc43a801f  ! 229: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba983f  ! 230: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5f2a01f  ! 231: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2903f  ! 232: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5e2a01f  ! 233: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc302c01f  ! 234: LDF_R	ld	[%r11, %r31], %f1
	.word 0xd3ba983f  ! 235: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3ba983f  ! 236: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2911f  ! 237: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xd3f2a01f  ! 238: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc502a034  ! 239: LDF_I	ld	[%r10, 0x0034], %f2
	.word 0xd092d05f  ! 240: LDUHA_R	lduha	[%r11, %r31] 0x82, %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd03a801f  ! 241: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba997f  ! 242: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcf22c01f  ! 243: STF_R	st	%f7, [%r31, %r11]
	.word 0xc9f2a01f  ! 244: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc922801f  ! 245: STF_R	st	%f4, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd03aa060  ! 246: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd03a801f  ! 247: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc292d11f  ! 248: LDUHA_R	lduha	[%r11, %r31] 0x88, %r1
	.word 0xcc4ac01f  ! 249: LDSB_R	ldsb	[%r11 + %r31], %r6
	.word 0xd19aa048  ! 250: LDDFA_I	ldda	[%r10, 0x0048], %f8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd0c2a06c  ! 251: LDSWA_I	ldswa	[%r10, + 0x006c] %asi, %r8
	.word 0xc5e2a01f  ! 252: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5f2901f  ! 253: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5e2a01f  ! 254: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 255: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd09aa078  ! 256: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r8
	.word 0xc9ba997f  ! 257: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc9aa010  ! 258: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r6
	.word 0xcbba981f  ! 259: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd322801f  ! 260: STF_R	st	%f9, [%r31, %r10]
TH_LABEL260:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdbad81f  ! 261: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc8c2a068  ! 262: LDSWA_I	ldswa	[%r10, + 0x0068] %asi, %r4
	.word 0xc9ba985f  ! 263: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 264: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 265: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9f2a01f  ! 266: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2913f  ! 267: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc41ae008  ! 268: LDD_I	ldd	[%r11 + 0x0008], %r2
	.word 0xd1ba981f  ! 269: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 270: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcd02c01f  ! 271: LDF_R	ld	[%r11, %r31], %f6
	.word 0xc7ba987f  ! 272: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 273: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 274: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7f2901f  ! 275: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7ba99bf  ! 276: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc65ae048  ! 277: LDX_I	ldx	[%r11 + 0x0048], %r3
	.word 0xcd9ae000  ! 278: LDDFA_I	ldda	[%r11, 0x0000], %f6
	.word 0xc452801f  ! 279: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xce5a801f  ! 280: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3f2e01f  ! 281: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xd2d2d13f  ! 282: LDSHA_R	ldsha	[%r11, %r31] 0x89, %r9
	.word 0xc8c2917f  ! 283: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r4
	.word 0xcbe2901f  ! 284: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xc49aa078  ! 285: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7bad89f  ! 286: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae038  ! 287: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xcc92e00a  ! 288: LDUHA_I	lduha	[%r11, + 0x000a] %asi, %r6
	.word 0xc5f2e01f  ! 289: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2d01f  ! 290: CASA_I	casa	[%r11] 0x80, %r31, %r2
TH_LABEL290:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5bad8bf  ! 291: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad89f  ! 292: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc302801f  ! 293: LDF_R	ld	[%r10, %r31], %f1
	.word 0xd322801f  ! 294: STF_R	st	%f9, [%r31, %r10]
	.word 0xcf02a030  ! 295: LDF_I	ld	[%r10, 0x0030], %f7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdbae000  ! 296: STDFA_I	stda	%f6, [0x0000, %r11]
	.word 0xc202e02c  ! 297: LDUW_I	lduw	[%r11 + 0x002c], %r1
	.word 0xc3ba981f  ! 298: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 299: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xd08ae00f  ! 300: LDUBA_I	lduba	[%r11, + 0x000f] %asi, %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc602e004  ! 301: LDUW_I	lduw	[%r11 + 0x0004], %r3
	.word 0xd03a801f  ! 302: STD_R	std	%r8, [%r10 + %r31]
	.word 0xce52c01f  ! 303: LDSH_R	ldsh	[%r11 + %r31], %r7
	.word 0xc5ba985f  ! 304: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd092917f  ! 305: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdf2a01f  ! 306: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2a01f  ! 307: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xca5aa050  ! 308: LDX_I	ldx	[%r10 + 0x0050], %r5
	.word 0xd0daa038  ! 309: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r8
	.word 0xca8aa014  ! 310: LDUBA_I	lduba	[%r10, + 0x0014] %asi, %r5
TH_LABEL310:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd102e008  ! 311: LDF_I	ld	[%r11, 0x0008], %f8
	.word 0xcfba99bf  ! 312: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba989f  ! 313: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa038  ! 314: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcc52801f  ! 315: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xca02801f  ! 316: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xd20a801f  ! 317: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xc09ae050  ! 318: LDDA_I	ldda	[%r11, + 0x0050] %asi, %r0
	.word 0xc83ac01f  ! 319: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad85f  ! 320: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd2dad13f  ! 321: LDXA_R	ldxa	[%r11, %r31] 0x89, %r9
	.word 0xd122801f  ! 322: STF_R	st	%f8, [%r31, %r10]
	.word 0xd0daa060  ! 323: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r8
	.word 0xd1ba987f  ! 324: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcf02801f  ! 325: LDF_R	ld	[%r10, %r31], %f7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc3a801f  ! 326: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc692d15f  ! 327: LDUHA_R	lduha	[%r11, %r31] 0x8a, %r3
	.word 0xcdf2901f  ! 328: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdf2901f  ! 329: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xceda911f  ! 330: LDXA_R	ldxa	[%r10, %r31] 0x88, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3bad99f  ! 331: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad93f  ! 332: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad81f  ! 333: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcc42801f  ! 334: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xc7ba99bf  ! 335: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xca02e03c  ! 336: LDUW_I	lduw	[%r11 + 0x003c], %r5
	.word 0xc522801f  ! 337: STF_R	st	%f2, [%r31, %r10]
	.word 0xd1baa028  ! 338: STDFA_I	stda	%f8, [0x0028, %r10]
	.word 0xcfbad81f  ! 339: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc852801f  ! 340: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc48aa051  ! 341: LDUBA_I	lduba	[%r10, + 0x0051] %asi, %r2
	.word 0xd1bad85f  ! 342: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d01f  ! 343: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xd1bad87f  ! 344: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc88aa055  ! 345: LDUBA_I	lduba	[%r10, + 0x0055] %asi, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc4d2a00e  ! 346: LDSHA_I	ldsha	[%r10, + 0x000e] %asi, %r2
	.word 0xd2c2915f  ! 347: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r9
	.word 0xcfbad81f  ! 348: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcf9aa070  ! 349: LDDFA_I	ldda	[%r10, 0x0070], %f7
	.word 0xc8d2a020  ! 350: LDSHA_I	ldsha	[%r10, + 0x0020] %asi, %r4
TH_LABEL350:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc302e03c  ! 351: LDF_I	ld	[%r11, 0x003c], %f1
	.word 0xd252a02c  ! 352: LDSH_I	ldsh	[%r10 + 0x002c], %r9
	.word 0xc9f2e01f  ! 353: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xd39ae070  ! 354: LDDFA_I	ldda	[%r11, 0x0070], %f9
	.word 0xcdba995f  ! 355: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL355:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdba993f  ! 356: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc8a905f  ! 357: LDUBA_R	lduba	[%r10, %r31] 0x82, %r6
	.word 0xd3bad9bf  ! 358: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad89f  ! 359: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 360: STD_R	std	%r8, [%r11 + %r31]
TH_LABEL360:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3bad87f  ! 361: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcdbae060  ! 362: STDFA_I	stda	%f6, [0x0060, %r11]
	.word 0xcff2901f  ! 363: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcfe2a01f  ! 364: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc68a903f  ! 365: LDUBA_R	lduba	[%r10, %r31] 0x81, %r3
TH_LABEL365:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfba983f  ! 366: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba983f  ! 367: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 368: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcff2901f  ! 369: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcfba989f  ! 370: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL370:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcff2901f  ! 371: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcfba983f  ! 372: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcadae058  ! 373: LDXA_I	ldxa	[%r11, + 0x0058] %asi, %r5
	.word 0xc3f2d11f  ! 374: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xcad2907f  ! 375: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcf9aa040  ! 376: LDDFA_I	ldda	[%r10, 0x0040], %f7
	.word 0xcc3ae048  ! 377: STD_I	std	%r6, [%r11 + 0x0048]
	.word 0xcc3ae048  ! 378: STD_I	std	%r6, [%r11 + 0x0048]
	.word 0xcc4aa01e  ! 379: LDSB_I	ldsb	[%r10 + 0x001e], %r6
	.word 0xc522801f  ! 380: STF_R	st	%f2, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1ba989f  ! 381: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcf02801f  ! 382: LDF_R	ld	[%r10, %r31], %f7
	.word 0xd1ba99bf  ! 383: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 384: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 385: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1ba987f  ! 386: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 387: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd19ae020  ! 388: LDDFA_I	ldda	[%r11, 0x0020], %f8
	.word 0xce5a801f  ! 389: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xc292907f  ! 390: LDUHA_R	lduha	[%r10, %r31] 0x83, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcd02e078  ! 391: LDF_I	ld	[%r11, 0x0078], %f6
	.word 0xc442e060  ! 392: LDSW_I	ldsw	[%r11 + 0x0060], %r2
	.word 0xc83ae040  ! 393: STD_I	std	%r4, [%r11 + 0x0040]
	.word 0xc9bad97f  ! 394: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcf02c01f  ! 395: LDF_R	ld	[%r11, %r31], %f7
TH_LABEL395:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc83a801f  ! 396: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd39aa028  ! 397: LDDFA_I	ldda	[%r10, 0x0028], %f9
	.word 0xcfba985f  ! 398: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 399: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xc64aa01b  ! 400: LDSB_I	ldsb	[%r10 + 0x001b], %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xce8a903f  ! 401: LDUBA_R	lduba	[%r10, %r31] 0x81, %r7
	.word 0xc3ba991f  ! 402: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd302a040  ! 403: LDF_I	ld	[%r10, 0x0040], %f9
	.word 0xcfbae030  ! 404: STDFA_I	stda	%f7, [0x0030, %r11]
	.word 0xc83a801f  ! 405: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9ba991f  ! 406: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 407: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd102801f  ! 408: LDF_R	ld	[%r10, %r31], %f8
	.word 0xd1ba995f  ! 409: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba991f  ! 410: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1f2913f  ! 411: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xc68ae061  ! 412: LDUBA_I	lduba	[%r11, + 0x0061] %asi, %r3
	.word 0xc5f2d01f  ! 413: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xd04a801f  ! 414: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xd3ba981f  ! 415: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03aa060  ! 416: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd3ba983f  ! 417: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 418: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd03aa060  ! 419: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd242e058  ! 420: LDSW_I	ldsw	[%r11 + 0x0058], %r9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1bad9bf  ! 421: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad91f  ! 422: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad99f  ! 423: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d01f  ! 424: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xccc2913f  ! 425: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc402a050  ! 426: LDUW_I	lduw	[%r10 + 0x0050], %r2
	.word 0xc402801f  ! 427: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xcc8a917f  ! 428: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r6
	.word 0xc5ba989f  ! 429: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2903f  ! 430: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5ba991f  ! 431: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc722801f  ! 432: STF_R	st	%f3, [%r31, %r10]
	.word 0xcf22c01f  ! 433: STF_R	st	%f7, [%r31, %r11]
	.word 0xd3bae010  ! 434: STDFA_I	stda	%f9, [0x0010, %r11]
	.word 0xcdba997f  ! 435: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc3aa038  ! 436: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xc99aa048  ! 437: LDDFA_I	ldda	[%r10, 0x0048], %f4
	.word 0xd2caa048  ! 438: LDSBA_I	ldsba	[%r10, + 0x0048] %asi, %r9
	.word 0xc5e2e01f  ! 439: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad91f  ! 440: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5f2d11f  ! 441: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xc302e074  ! 442: LDF_I	ld	[%r11, 0x0074], %f1
	.word 0xc9ba989f  ! 443: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd08ae07b  ! 444: LDUBA_I	lduba	[%r11, + 0x007b] %asi, %r8
	.word 0xc3bad89f  ! 445: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3e2d01f  ! 446: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc702c01f  ! 447: LDF_R	ld	[%r11, %r31], %f3
	.word 0xd3f2a01f  ! 448: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc41a801f  ! 449: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc03aa008  ! 450: STD_I	std	%r0, [%r10 + 0x0008]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3f2913f  ! 451: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xcbbaa040  ! 452: STDFA_I	stda	%f5, [0x0040, %r10]
	.word 0xc302a03c  ! 453: LDF_I	ld	[%r10, 0x003c], %f1
	.word 0xc7ba99bf  ! 454: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 455: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7e2903f  ! 456: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xc7f2913f  ! 457: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba983f  ! 458: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xce0a801f  ! 459: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xd1ba99bf  ! 460: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1ba993f  ! 461: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 462: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2903f  ! 463: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xd1f2901f  ! 464: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1f2901f  ! 465: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1f2a01f  ! 466: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xccda913f  ! 467: LDXA_R	ldxa	[%r10, %r31] 0x89, %r6
	.word 0xc5ba983f  ! 468: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 469: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 470: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc99aa020  ! 471: LDDFA_I	ldda	[%r10, 0x0020], %f4
	.word 0xd1e2901f  ! 472: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc99aa060  ! 473: LDDFA_I	ldda	[%r10, 0x0060], %f4
	.word 0xd1bad91f  ! 474: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2e01f  ! 475: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc302e048  ! 476: LDF_I	ld	[%r11, 0x0048], %f1
	.word 0xd1ba991f  ! 477: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 478: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba99bf  ! 479: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xce82d15f  ! 480: LDUWA_R	lduwa	[%r11, %r31] 0x8a, %r7
TH_LABEL480:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9f2a01f  ! 481: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc522c01f  ! 482: STF_R	st	%f2, [%r31, %r11]
	.word 0xca4a801f  ! 483: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xc4d2a062  ! 484: LDSHA_I	ldsha	[%r10, + 0x0062] %asi, %r2
	.word 0xcb02801f  ! 485: LDF_R	ld	[%r10, %r31], %f5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc902a004  ! 486: LDF_I	ld	[%r10, 0x0004], %f4
	.word 0xc9ba985f  ! 487: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 488: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd302e01c  ! 489: LDF_I	ld	[%r11, 0x001c], %f9
	.word 0xcc3a801f  ! 490: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc682913f  ! 491: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r3
	.word 0xcdba987f  ! 492: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 493: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba989f  ! 494: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 495: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbbaa048  ! 496: STDFA_I	stda	%f5, [0x0048, %r10]
	.word 0xcc12801f  ! 497: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xd3ba983f  ! 498: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 499: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2a01f  ! 500: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc5aa040  ! 501: LDX_I	ldx	[%r10 + 0x0040], %r6
	.word 0xc492913f  ! 502: LDUHA_R	lduha	[%r10, %r31] 0x89, %r2
	.word 0xcbf2901f  ! 503: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbf2a01f  ! 504: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba991f  ! 505: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbf2a01f  ! 506: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2903f  ! 507: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xcbba985f  ! 508: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd19aa070  ! 509: LDDFA_I	ldda	[%r10, 0x0070], %f8
	.word 0xc89ae020  ! 510: LDDA_I	ldda	[%r11, + 0x0020] %asi, %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xca52c01f  ! 511: LDSH_R	ldsh	[%r11 + %r31], %r5
	.word 0xc43a801f  ! 512: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba991f  ! 513: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd302c01f  ! 514: LDF_R	ld	[%r11, %r31], %f9
	.word 0xc2d2a002  ! 515: LDSHA_I	ldsha	[%r10, + 0x0002] %asi, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba98bf  ! 516: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba991f  ! 517: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 518: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcaca903f  ! 519: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r5
	.word 0xccd2907f  ! 520: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc322801f  ! 521: STF_R	st	%f1, [%r31, %r10]
	.word 0xc802801f  ! 522: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xc7baa078  ! 523: STDFA_I	stda	%f3, [0x0078, %r10]
	.word 0xc3ba99bf  ! 524: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa028  ! 525: STD_I	std	%r0, [%r10 + 0x0028]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd042801f  ! 526: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xca12a056  ! 527: LDUH_I	lduh	[%r10 + 0x0056], %r5
	.word 0xc9f2a01f  ! 528: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xcc82e018  ! 529: LDUWA_I	lduwa	[%r11, + 0x0018] %asi, %r6
	.word 0xcbbaa008  ! 530: STDFA_I	stda	%f5, [0x0008, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcd02801f  ! 531: LDF_R	ld	[%r10, %r31], %f6
	.word 0xcdbad99f  ! 532: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xccdaa020  ! 533: LDXA_I	ldxa	[%r10, + 0x0020] %asi, %r6
	.word 0xc9ba985f  ! 534: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 535: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd252801f  ! 536: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xcc3aa070  ! 537: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcfba981f  ! 538: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2913f  ! 539: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xc85a801f  ! 540: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9e2913f  ! 541: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xccd2901f  ! 542: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r6
	.word 0xd302e070  ! 543: LDF_I	ld	[%r11, 0x0070], %f9
	.word 0xcbba981f  ! 544: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc652c01f  ! 545: LDSH_R	ldsh	[%r11 + %r31], %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc3a801f  ! 546: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2a01f  ! 547: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba98bf  ! 548: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba98bf  ! 549: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2903f  ! 550: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfe2a01f  ! 551: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba989f  ! 552: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc652801f  ! 553: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xca4ac01f  ! 554: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xc242a030  ! 555: LDSW_I	ldsw	[%r10 + 0x0030], %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcedaa060  ! 556: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r7
	.word 0xcad2e006  ! 557: LDSHA_I	ldsha	[%r11, + 0x0006] %asi, %r5
	.word 0xd04aa077  ! 558: LDSB_I	ldsb	[%r10 + 0x0077], %r8
	.word 0xcacad07f  ! 559: LDSBA_R	ldsba	[%r11, %r31] 0x83, %r5
	.word 0xc5f2a01f  ! 560: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc6da913f  ! 561: LDXA_R	ldxa	[%r10, %r31] 0x89, %r3
	.word 0xc41ae068  ! 562: LDD_I	ldd	[%r11 + 0x0068], %r2
	.word 0xd3ba985f  ! 563: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2913f  ! 564: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xc522801f  ! 565: STF_R	st	%f2, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd03ac01f  ! 566: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2e01f  ! 567: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad95f  ! 568: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad91f  ! 569: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d01f  ! 570: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcf22c01f  ! 571: STF_R	st	%f7, [%r31, %r11]
	.word 0xcbbad93f  ! 572: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd2cae008  ! 573: LDSBA_I	ldsba	[%r11, + 0x0008] %asi, %r9
	.word 0xcde2a01f  ! 574: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2913f  ! 575: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd252801f  ! 576: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xd102c01f  ! 577: LDF_R	ld	[%r11, %r31], %f8
	.word 0xd1f2a01f  ! 578: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc59aa028  ! 579: LDDFA_I	ldda	[%r10, 0x0028], %f2
	.word 0xc5e2e01f  ! 580: CASA_R	casa	[%r11] %asi, %r31, %r2
TH_LABEL580:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc43ae030  ! 581: STD_I	std	%r2, [%r11 + 0x0030]
	.word 0xc5bad85f  ! 582: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2d01f  ! 583: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xcc0a801f  ! 584: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xcf22801f  ! 585: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3f2911f  ! 586: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc03aa030  ! 587: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba997f  ! 588: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd2ca911f  ! 589: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r9
	.word 0xc252a06a  ! 590: LDSH_I	ldsh	[%r10 + 0x006a], %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba99bf  ! 591: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 592: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xd0c2903f  ! 593: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r8
	.word 0xcfba995f  ! 594: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba99bf  ! 595: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd042a074  ! 596: LDSW_I	ldsw	[%r10 + 0x0074], %r8
	.word 0xca12a062  ! 597: LDUH_I	lduh	[%r10 + 0x0062], %r5
	.word 0xd1e2d01f  ! 598: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xd1e2e01f  ! 599: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1f2e01f  ! 600: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd03ae070  ! 601: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xc59aa078  ! 602: LDDFA_I	ldda	[%r10, 0x0078], %f2
	.word 0xc812a044  ! 603: LDUH_I	lduh	[%r10 + 0x0044], %r4
	.word 0xd012801f  ! 604: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xd3ba999f  ! 605: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba999f  ! 606: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 607: STD_R	std	%r8, [%r10 + %r31]
	.word 0xca12c01f  ! 608: LDUH_R	lduh	[%r11 + %r31], %r5
	.word 0xcecaa006  ! 609: LDSBA_I	ldsba	[%r10, + 0x0006] %asi, %r7
	.word 0xc402801f  ! 610: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd052801f  ! 611: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xd3ba987f  ! 612: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 613: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 614: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3f2a01f  ! 615: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3ba995f  ! 616: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcec2a024  ! 617: LDSWA_I	ldswa	[%r10, + 0x0024] %asi, %r7
	.word 0xc9e2a01f  ! 618: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba997f  ! 619: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 620: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc83a801f  ! 621: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba985f  ! 622: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 623: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9e2a01f  ! 624: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xd00a801f  ! 625: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3e2901f  ! 626: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3e2913f  ! 627: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc3ba985f  ! 628: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba99bf  ! 629: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcc1a801f  ! 630: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7ba981f  ! 631: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 632: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 633: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba999f  ! 634: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcc92e078  ! 635: LDUHA_I	lduha	[%r11, + 0x0078] %asi, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbba983f  ! 636: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 637: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba989f  ! 638: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc212a03e  ! 639: LDUH_I	lduh	[%r10 + 0x003e], %r1
	.word 0xc44ac01f  ! 640: LDSB_R	ldsb	[%r11 + %r31], %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba983f  ! 641: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2901f  ! 642: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcfba985f  ! 643: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd302c01f  ! 644: LDF_R	ld	[%r11, %r31], %f9
	.word 0xc5e2913f  ! 645: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3baa010  ! 646: STDFA_I	stda	%f9, [0x0010, %r10]
	.word 0xc7baa078  ! 647: STDFA_I	stda	%f3, [0x0078, %r10]
	.word 0xd3e2a01f  ! 648: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba991f  ! 649: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 650: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3f2901f  ! 651: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd03a801f  ! 652: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba98bf  ! 653: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd302e068  ! 654: LDF_I	ld	[%r11, 0x0068], %f9
	.word 0xcac2d01f  ! 655: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc8d2a052  ! 656: LDSHA_I	ldsha	[%r10, + 0x0052] %asi, %r4
	.word 0xc43a801f  ! 657: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa048  ! 658: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc7ba995f  ! 659: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcdbae060  ! 660: STDFA_I	stda	%f6, [0x0060, %r11]
TH_LABEL660:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc2d2d03f  ! 661: LDSHA_R	ldsha	[%r11, %r31] 0x81, %r1
	.word 0xc9e2911f  ! 662: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba983f  ! 663: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba99bf  ! 664: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xce4a801f  ! 665: LDSB_R	ldsb	[%r10 + %r31], %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc99aa058  ! 666: LDDFA_I	ldda	[%r10, 0x0058], %f4
	.word 0xcc0aa03f  ! 667: LDUB_I	ldub	[%r10 + 0x003f], %r6
	.word 0xc3bad87f  ! 668: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd292903f  ! 669: LDUHA_R	lduha	[%r10, %r31] 0x81, %r9
	.word 0xc20a801f  ! 670: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3bad9bf  ! 671: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc65ac01f  ! 672: LDX_R	ldx	[%r11 + %r31], %r3
	.word 0xd1ba987f  ! 673: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd302801f  ! 674: LDF_R	ld	[%r10, %r31], %f9
	.word 0xcdf2e01f  ! 675: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdbad9bf  ! 676: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc24ac01f  ! 677: LDSB_R	ldsb	[%r11 + %r31], %r1
	.word 0xc3f2913f  ! 678: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xcccaa004  ! 679: LDSBA_I	ldsba	[%r10, + 0x0004] %asi, %r6
	.word 0xc43a801f  ! 680: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc302801f  ! 681: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc7bad9bf  ! 682: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad89f  ! 683: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc502a04c  ! 684: LDF_I	ld	[%r10, 0x004c], %f2
	.word 0xc302801f  ! 685: LDF_R	ld	[%r10, %r31], %f1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc812801f  ! 686: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xc322801f  ! 687: STF_R	st	%f1, [%r31, %r10]
	.word 0xcfbad95f  ! 688: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd1baa048  ! 689: STDFA_I	stda	%f8, [0x0048, %r10]
	.word 0xc40a801f  ! 690: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd03a801f  ! 691: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba99bf  ! 692: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 693: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc41aa030  ! 694: LDD_I	ldd	[%r10 + 0x0030], %r2
	.word 0xca02a078  ! 695: LDUW_I	lduw	[%r10 + 0x0078], %r5
TH_LABEL695:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7baa068  ! 696: STDFA_I	stda	%f3, [0x0068, %r10]
	.word 0xcc1a801f  ! 697: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xd3e2e01f  ! 698: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad99f  ! 699: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad87f  ! 700: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc8aa009  ! 701: LDUBA_I	lduba	[%r10, + 0x0009] %asi, %r6
	.word 0xc3e2a01f  ! 702: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba987f  ! 703: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcc1ac01f  ! 704: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xc402c01f  ! 705: LDUW_R	lduw	[%r11 + %r31], %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7e2901f  ! 706: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc09aa020  ! 707: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r0
	.word 0xc7f2a01f  ! 708: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xcd02a020  ! 709: LDF_I	ld	[%r10, 0x0020], %f6
	.word 0xc4d2907f  ! 710: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3bad81f  ! 711: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 712: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc03ae040  ! 713: STD_I	std	%r0, [%r11 + 0x0040]
	.word 0xcc0a801f  ! 714: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xc44aa01d  ! 715: LDSB_I	ldsb	[%r10 + 0x001d], %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc612801f  ! 716: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xcbbae010  ! 717: STDFA_I	stda	%f5, [0x0010, %r11]
	.word 0xc8c2e024  ! 718: LDSWA_I	ldswa	[%r11, + 0x0024] %asi, %r4
	.word 0xce5aa070  ! 719: LDX_I	ldx	[%r10 + 0x0070], %r7
	.word 0xc5bad95f  ! 720: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xccdaa010  ! 721: LDXA_I	ldxa	[%r10, + 0x0010] %asi, %r6
	.word 0xc7bad9bf  ! 722: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd122801f  ! 723: STF_R	st	%f8, [%r31, %r10]
	.word 0xc9e2911f  ! 724: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9f2913f  ! 725: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc64ac01f  ! 726: LDSB_R	ldsb	[%r11 + %r31], %r3
	.word 0xcc0ac01f  ! 727: LDUB_R	ldub	[%r11 + %r31], %r6
	.word 0xcbba983f  ! 728: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 729: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 730: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc39aa048  ! 731: LDDFA_I	ldda	[%r10, 0x0048], %f1
	.word 0xd3f2d01f  ! 732: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd3bad81f  ! 733: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xca52801f  ! 734: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xc9f2d11f  ! 735: CASXA_I	casxa	[%r11] 0x88, %r31, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9bad81f  ! 736: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc6cad15f  ! 737: LDSBA_R	ldsba	[%r11, %r31] 0x8a, %r3
	.word 0xc83a801f  ! 738: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba999f  ! 739: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 740: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xccc2905f  ! 741: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r6
	.word 0xcc52a056  ! 742: LDSH_I	ldsh	[%r10 + 0x0056], %r6
	.word 0xc652801f  ! 743: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xd1bae070  ! 744: STDFA_I	stda	%f8, [0x0070, %r11]
	.word 0xc9baa070  ! 745: STDFA_I	stda	%f4, [0x0070, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc79aa048  ! 746: LDDFA_I	ldda	[%r10, 0x0048], %f3
	.word 0xcc3aa068  ! 747: STD_I	std	%r6, [%r10 + 0x0068]
	.word 0xcdba997f  ! 748: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc3baa020  ! 749: STDFA_I	stda	%f1, [0x0020, %r10]
	.word 0xc5ba983f  ! 750: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5f2911f  ! 751: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xc40aa01b  ! 752: LDUB_I	ldub	[%r10 + 0x001b], %r2
	.word 0xcd22c01f  ! 753: STF_R	st	%f6, [%r31, %r11]
	.word 0xd2ca917f  ! 754: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r9
	.word 0xca4a801f  ! 755: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc8aa014  ! 756: LDUBA_I	lduba	[%r10, + 0x0014] %asi, %r6
	.word 0xd302e054  ! 757: LDF_I	ld	[%r11, 0x0054], %f9
	.word 0xccca903f  ! 758: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r6
	.word 0xc702801f  ! 759: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc43a801f  ! 760: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7e2913f  ! 761: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc43aa038  ! 762: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc6c2d01f  ! 763: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r3
	.word 0xc3bad99f  ! 764: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 765: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd20a801f  ! 766: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xd1bad81f  ! 767: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ac01f  ! 768: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1f2d03f  ! 769: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xc242801f  ! 770: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3ba983f  ! 771: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcaca901f  ! 772: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r5
	.word 0xc5ba995f  ! 773: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 774: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 775: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd012a00e  ! 776: LDUH_I	lduh	[%r10 + 0x000e], %r8
	.word 0xceda905f  ! 777: LDXA_R	ldxa	[%r10, %r31] 0x82, %r7
	.word 0xcc5a801f  ! 778: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xc852a00a  ! 779: LDSH_I	ldsh	[%r10 + 0x000a], %r4
	.word 0xd252e06a  ! 780: LDSH_I	ldsh	[%r11 + 0x006a], %r9
TH_LABEL780:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3ba981f  ! 781: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 782: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa060  ! 783: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd3ba983f  ! 784: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa060  ! 785: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc922801f  ! 786: STF_R	st	%f4, [%r31, %r10]
	.word 0xd01a801f  ! 787: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xc48a917f  ! 788: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r2
	.word 0xcfba989f  ! 789: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcb9ae028  ! 790: LDDFA_I	ldda	[%r11, 0x0028], %f5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc89aa060  ! 791: LDDA_I	ldda	[%r10, + 0x0060] %asi, %r4
	.word 0xc7ba997f  ! 792: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa068  ! 793: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xcf9ae050  ! 794: LDDFA_I	ldda	[%r11, 0x0050], %f7
	.word 0xcfba991f  ! 795: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc6d2901f  ! 796: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r3
	.word 0xd20ac01f  ! 797: LDUB_R	ldub	[%r11 + %r31], %r9
	.word 0xd082903f  ! 798: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r8
	.word 0xcbe2e01f  ! 799: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xce92917f  ! 800: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbf2e01f  ! 801: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad81f  ! 802: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc902a078  ! 803: LDF_I	ld	[%r10, 0x0078], %f4
	.word 0xcc0aa033  ! 804: LDUB_I	ldub	[%r10 + 0x0033], %r6
	.word 0xc7bad8bf  ! 805: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc482a054  ! 806: LDUWA_I	lduwa	[%r10, + 0x0054] %asi, %r2
	.word 0xcfba981f  ! 807: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba98bf  ! 808: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba991f  ! 809: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 810: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd102a068  ! 811: LDF_I	ld	[%r10, 0x0068], %f8
	.word 0xd05ac01f  ! 812: LDX_R	ldx	[%r11 + %r31], %r8
	.word 0xce92a046  ! 813: LDUHA_I	lduha	[%r10, + 0x0046] %asi, %r7
	.word 0xd28aa05d  ! 814: LDUBA_I	lduba	[%r10, + 0x005d] %asi, %r9
	.word 0xd03ae060  ! 815: STD_I	std	%r8, [%r11 + 0x0060]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3bad91f  ! 816: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 817: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xcb02e06c  ! 818: LDF_I	ld	[%r11, 0x006c], %f5
	.word 0xcac2917f  ! 819: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r5
	.word 0xcc02a050  ! 820: LDUW_I	lduw	[%r10 + 0x0050], %r6
TH_LABEL820:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3ba993f  ! 821: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc59aa008  ! 822: LDDFA_I	ldda	[%r10, 0x0008], %f2
	.word 0xc5bad9bf  ! 823: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad93f  ! 824: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad97f  ! 825: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd292e05a  ! 826: LDUHA_I	lduha	[%r11, + 0x005a] %asi, %r9
	.word 0xcbbad87f  ! 827: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad83f  ! 828: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc802e024  ! 829: LDUW_I	lduw	[%r11 + 0x0024], %r4
	.word 0xc9bad93f  ! 830: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9f2e01f  ! 831: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 832: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9f2d13f  ! 833: CASXA_I	casxa	[%r11] 0x89, %r31, %r4
	.word 0xcacaa018  ! 834: LDSBA_I	ldsba	[%r10, + 0x0018] %asi, %r5
	.word 0xc9bae050  ! 835: STDFA_I	stda	%f4, [0x0050, %r11]
TH_LABEL835:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7ba981f  ! 836: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcaca917f  ! 837: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r5
	.word 0xc3e2901f  ! 838: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xcdbaa018  ! 839: STDFA_I	stda	%f6, [0x0018, %r10]
	.word 0xca92e032  ! 840: LDUHA_I	lduha	[%r11, + 0x0032] %asi, %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc83ac01f  ! 841: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9e2d13f  ! 842: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc9e2d03f  ! 843: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xc882d03f  ! 844: LDUWA_R	lduwa	[%r11, %r31] 0x81, %r4
	.word 0xd302c01f  ! 845: LDF_R	ld	[%r11, %r31], %f9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc43aa038  ! 846: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc43aa038  ! 847: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc7f2a01f  ! 848: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba981f  ! 849: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc99ae018  ! 850: LDDFA_I	ldda	[%r11, 0x0018], %f4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbf2e01f  ! 851: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad89f  ! 852: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc82915f  ! 853: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r6
	.word 0xd19ae048  ! 854: LDDFA_I	ldda	[%r11, 0x0048], %f8
	.word 0xd1e2913f  ! 855: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd03aa018  ! 856: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xc6d2d01f  ! 857: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r3
	.word 0xc9ba983f  ! 858: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc492901f  ! 859: LDUHA_R	lduha	[%r10, %r31] 0x80, %r2
	.word 0xd0caa075  ! 860: LDSBA_I	ldsba	[%r10, + 0x0075] %asi, %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9bad81f  ! 861: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d03f  ! 862: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xc9f2d13f  ! 863: CASXA_I	casxa	[%r11] 0x89, %r31, %r4
	.word 0xc83ac01f  ! 864: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9f2d11f  ! 865: CASXA_I	casxa	[%r11] 0x88, %r31, %r4
TH_LABEL865:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9e2d01f  ! 866: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc882d17f  ! 867: LDUWA_R	lduwa	[%r11, %r31] 0x8b, %r4
	.word 0xc3e2d11f  ! 868: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xc702c01f  ! 869: LDF_R	ld	[%r11, %r31], %f3
	.word 0xc442801f  ! 870: LDSW_R	ldsw	[%r10 + %r31], %r2
TH_LABEL870:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5ba99bf  ! 871: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc802801f  ! 872: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xc5f2e01f  ! 873: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2e01f  ! 874: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 875: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc43ac01f  ! 876: STD_R	std	%r2, [%r11 + %r31]
	.word 0xd202801f  ! 877: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xd202e064  ! 878: LDUW_I	lduw	[%r11 + 0x0064], %r9
	.word 0xc682a028  ! 879: LDUWA_I	lduwa	[%r10, + 0x0028] %asi, %r3
	.word 0xc5e2a01f  ! 880: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcf9ae068  ! 881: LDDFA_I	ldda	[%r11, 0x0068], %f7
	.word 0xce52801f  ! 882: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xc88ae021  ! 883: LDUBA_I	lduba	[%r11, + 0x0021] %asi, %r4
	.word 0xc5ba995f  ! 884: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 885: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd39aa070  ! 886: LDDFA_I	ldda	[%r10, 0x0070], %f9
	.word 0xd1e2913f  ! 887: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xc402c01f  ! 888: LDUW_R	lduw	[%r11 + %r31], %r2
	.word 0xd202801f  ! 889: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xc3f2913f  ! 890: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcb22801f  ! 891: STF_R	st	%f5, [%r31, %r10]
	.word 0xd3e2a01f  ! 892: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd0c2915f  ! 893: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r8
	.word 0xd2da907f  ! 894: LDXA_R	ldxa	[%r10, %r31] 0x83, %r9
	.word 0xd3e2d01f  ! 895: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3f2d11f  ! 896: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xd3e2d01f  ! 897: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xce92907f  ! 898: LDUHA_R	lduha	[%r10, %r31] 0x83, %r7
	.word 0xc282d05f  ! 899: LDUWA_R	lduwa	[%r11, %r31] 0x82, %r1
	.word 0xc3f2d01f  ! 900: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3f2e01f  ! 901: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad91f  ! 902: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcc1aa018  ! 903: LDD_I	ldd	[%r10 + 0x0018], %r6
	.word 0xcc3a801f  ! 904: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcd22801f  ! 905: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc83aa060  ! 906: STD_I	std	%r4, [%r10 + 0x0060]
	.word 0xc84aa05a  ! 907: LDSB_I	ldsb	[%r10 + 0x005a], %r4
	.word 0xd01ae010  ! 908: LDD_I	ldd	[%r11 + 0x0010], %r8
	.word 0xc5f2a01f  ! 909: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xca82e058  ! 910: LDUWA_I	lduwa	[%r11, + 0x0058] %asi, %r5
TH_LABEL910:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc5a801f  ! 911: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xcfbad85f  ! 912: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd0d2901f  ! 913: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r8
	.word 0xc2d2a01e  ! 914: LDSHA_I	ldsha	[%r10, + 0x001e] %asi, %r1
	.word 0xd1f2a01f  ! 915: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1f2a01f  ! 916: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xcfbaa058  ! 917: STDFA_I	stda	%f7, [0x0058, %r10]
	.word 0xd3ba999f  ! 918: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcd9aa018  ! 919: LDDFA_I	ldda	[%r10, 0x0018], %f6
	.word 0xc64a801f  ! 920: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc902c01f  ! 921: LDF_R	ld	[%r11, %r31], %f4
	.word 0xcfba981f  ! 922: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa000  ! 923: STD_I	std	%r6, [%r10 + 0x0000]
	.word 0xcbbaa058  ! 924: STDFA_I	stda	%f5, [0x0058, %r10]
	.word 0xc7ba995f  ! 925: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xce42c01f  ! 926: LDSW_R	ldsw	[%r11 + %r31], %r7
	.word 0xc5f2d11f  ! 927: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xc5f2e01f  ! 928: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2e01f  ! 929: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 930: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5bad91f  ! 931: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad89f  ! 932: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad93f  ! 933: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc09ae038  ! 934: LDDA_I	ldda	[%r11, + 0x0038] %asi, %r0
	.word 0xc7ba991f  ! 935: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL935:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7ba985f  ! 936: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xca52801f  ! 937: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xd03ac01f  ! 938: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc852a046  ! 939: LDSH_I	ldsh	[%r10 + 0x0046], %r4
	.word 0xc452801f  ! 940: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3ba997f  ! 941: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd082a070  ! 942: LDUWA_I	lduwa	[%r10, + 0x0070] %asi, %r8
	.word 0xc3baa030  ! 943: STDFA_I	stda	%f1, [0x0030, %r10]
	.word 0xc442e060  ! 944: LDSW_I	ldsw	[%r11 + 0x0060], %r2
	.word 0xc9e2913f  ! 945: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9e2a01f  ! 946: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba981f  ! 947: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2913f  ! 948: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc81ac01f  ! 949: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xd252a072  ! 950: LDSH_I	ldsh	[%r10 + 0x0072], %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd282a010  ! 951: LDUWA_I	lduwa	[%r10, + 0x0010] %asi, %r9
	.word 0xca42801f  ! 952: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xc702801f  ! 953: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc402e04c  ! 954: LDUW_I	lduw	[%r11 + 0x004c], %r2
	.word 0xc7ba983f  ! 955: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcd02a054  ! 956: LDF_I	ld	[%r10, 0x0054], %f6
	.word 0xc7bad91f  ! 957: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae070  ! 958: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xc7e2e01f  ! 959: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc59aa000  ! 960: LDDFA_I	ldda	[%r10, 0x0000], %f2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3ba981f  ! 961: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba987f  ! 962: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd1bae060  ! 963: STDFA_I	stda	%f8, [0x0060, %r11]
	.word 0xc7ba987f  ! 964: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba99bf  ! 965: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7ba989f  ! 966: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2901f  ! 967: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba981f  ! 968: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcb9aa038  ! 969: LDDFA_I	ldda	[%r10, 0x0038], %f5
	.word 0xcdf2a01f  ! 970: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdf2911f  ! 971: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcdba989f  ! 972: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc252e056  ! 973: LDSH_I	ldsh	[%r11 + 0x0056], %r1
	.word 0xc43aa020  ! 974: STD_I	std	%r2, [%r10 + 0x0020]
	.word 0xc7ba987f  ! 975: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7ba981f  ! 976: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcedad01f  ! 977: LDXA_R	ldxa	[%r11, %r31] 0x80, %r7
	.word 0xc9ba98bf  ! 978: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa020  ! 979: STD_I	std	%r4, [%r10 + 0x0020]
	.word 0xcc5ae038  ! 980: LDX_I	ldx	[%r11 + 0x0038], %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcac2a060  ! 981: LDSWA_I	ldswa	[%r10, + 0x0060] %asi, %r5
	.word 0xcff2d03f  ! 982: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xcfbad85f  ! 983: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d01f  ! 984: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xc522801f  ! 985: STF_R	st	%f2, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7f2e01f  ! 986: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad85f  ! 987: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd01ae048  ! 988: LDD_I	ldd	[%r11 + 0x0048], %r8
	.word 0xc7f2e01f  ! 989: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad91f  ! 990: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7f2d01f  ! 991: CASXA_I	casxa	[%r11] 0x80, %r31, %r3
	.word 0xd1bae060  ! 992: STDFA_I	stda	%f8, [0x0060, %r11]
	.word 0xc79aa058  ! 993: LDDFA_I	ldda	[%r10, 0x0058], %f3
	.word 0xcc12e042  ! 994: LDUH_I	lduh	[%r11 + 0x0042], %r6
	.word 0xcf22c01f  ! 995: STF_R	st	%f7, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1ba997f  ! 996: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca8a911f  ! 997: LDUBA_R	lduba	[%r10, %r31] 0x88, %r5
	.word 0xc44a801f  ! 998: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xd3ba999f  ! 999: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2913f  ! 1000: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	subcc %r30, 1, %r30
	bnz  TH3_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	add	%g0,	0x1,	%r30
TH2_LOOP_START:
	.word 0xd1f2a01f  ! 1: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba981f  ! 2: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc64ae030  ! 3: LDSB_I	ldsb	[%r11 + 0x0030], %r3
	.word 0xc702c01f  ! 4: LDF_R	ld	[%r11, %r31], %f3
	.word 0xd05a801f  ! 5: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5e2903f  ! 6: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba985f  ! 7: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd302a074  ! 8: LDF_I	ld	[%r10, 0x0074], %f9
	.word 0xcfe2e01f  ! 9: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xd1baa030  ! 10: STDFA_I	stda	%f8, [0x0030, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcd9aa070  ! 11: LDDFA_I	ldda	[%r10, 0x0070], %f6
	.word 0xc7bad85f  ! 12: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 13: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7e2e01f  ! 14: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xd2ca915f  ! 15: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xca02e058  ! 16: LDUW_I	lduw	[%r11 + 0x0058], %r5
	.word 0xc5e2901f  ! 17: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5e2903f  ! 18: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba999f  ! 19: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 20: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5f2911f  ! 21: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xc5f2a01f  ! 22: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2a01f  ! 23: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc41a801f  ! 24: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc03a801f  ! 25: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3ba981f  ! 26: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 27: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xd202e024  ! 28: LDUW_I	lduw	[%r11 + 0x0024], %r9
	.word 0xd092905f  ! 29: LDUHA_R	lduha	[%r10, %r31] 0x82, %r8
	.word 0xd1f2e01f  ! 30: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1bad95f  ! 31: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc702a07c  ! 32: LDF_I	ld	[%r10, 0x007c], %f3
	.word 0xc3e2903f  ! 33: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3e2a01f  ! 34: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xcfbaa028  ! 35: STDFA_I	stda	%f7, [0x0028, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc43ac01f  ! 36: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 37: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad95f  ! 38: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcb02801f  ! 39: LDF_R	ld	[%r10, %r31], %f5
	.word 0xd2c2d05f  ! 40: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xce4aa030  ! 41: LDSB_I	ldsb	[%r10 + 0x0030], %r7
	.word 0xd1ba995f  ! 42: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc322801f  ! 43: STF_R	st	%f1, [%r31, %r10]
	.word 0xc3ba995f  ! 44: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc902801f  ! 45: LDF_R	ld	[%r10, %r31], %f4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1bad91f  ! 46: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc88aa016  ! 47: LDUBA_I	lduba	[%r10, + 0x0016] %asi, %r4
	.word 0xc8d2d01f  ! 48: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r4
	.word 0xc3e2903f  ! 49: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xd092a062  ! 50: LDUHA_I	lduha	[%r10, + 0x0062] %asi, %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfba98bf  ! 51: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 52: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc68aa013  ! 53: LDUBA_I	lduba	[%r10, + 0x0013] %asi, %r3
	.word 0xd3ba981f  ! 54: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba991f  ! 55: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc09aa070  ! 56: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r0
	.word 0xd102801f  ! 57: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc5e2e01f  ! 58: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc28aa04f  ! 59: LDUBA_I	lduba	[%r10, + 0x004f] %asi, %r1
	.word 0xc7e2a01f  ! 60: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7e2911f  ! 61: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xd102c01f  ! 62: LDF_R	ld	[%r11, %r31], %f8
	.word 0xc7f2e01f  ! 63: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7f2e01f  ! 64: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad85f  ! 65: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7e2e01f  ! 66: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc682915f  ! 67: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r3
	.word 0xc3ba99bf  ! 68: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba98bf  ! 69: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 70: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3f2a01f  ! 71: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xcacaa034  ! 72: LDSBA_I	ldsba	[%r10, + 0x0034] %asi, %r5
	.word 0xc3e2901f  ! 73: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba995f  ! 74: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcac2d01f  ! 75: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3bad91f  ! 76: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d13f  ! 77: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xc3e2e01f  ! 78: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad8bf  ! 79: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ae040  ! 80: STD_I	std	%r0, [%r11 + 0x0040]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc03ac01f  ! 81: STD_R	std	%r0, [%r11 + %r31]
	.word 0xd01ae070  ! 82: LDD_I	ldd	[%r11 + 0x0070], %r8
	.word 0xc6d2d01f  ! 83: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r3
	.word 0xc3f2901f  ! 84: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3e2a01f  ! 85: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc39aa040  ! 86: LDDFA_I	ldda	[%r10, 0x0040], %f1
	.word 0xd052801f  ! 87: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xc5f2d11f  ! 88: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xc5e2e01f  ! 89: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5e2d01f  ! 90: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc842801f  ! 91: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xc7bad99f  ! 92: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd122c01f  ! 93: STF_R	st	%f8, [%r31, %r11]
	.word 0xcc3aa000  ! 94: STD_I	std	%r6, [%r10 + 0x0000]
	.word 0xd05a801f  ! 95: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5bad91f  ! 96: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc612801f  ! 97: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xc902801f  ! 98: LDF_R	ld	[%r10, %r31], %f4
	.word 0xd3ba983f  ! 99: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 100: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd03a801f  ! 101: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc852801f  ! 102: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xcbe2e01f  ! 103: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad83f  ! 104: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad8bf  ! 105: STDFA_R	stda	%f5, [%r31, %r11]
TH_LABEL105:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbbad8bf  ! 106: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d11f  ! 107: CASA_I	casa	[%r11] 0x88, %r31, %r5
	.word 0xc83ae000  ! 108: STD_I	std	%r4, [%r11 + 0x0000]
	.word 0xd102c01f  ! 109: LDF_R	ld	[%r11, %r31], %f8
	.word 0xc9f2901f  ! 110: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9e2a01f  ! 111: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2a01f  ! 112: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2a01f  ! 113: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2901f  ! 114: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc83aa000  ! 115: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9e2a01f  ! 116: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba999f  ! 117: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba997f  ! 118: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2911f  ! 119: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba999f  ! 120: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xccc2901f  ! 121: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r6
	.word 0xc9f2e01f  ! 122: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 123: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad81f  ! 124: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd322801f  ! 125: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3f2901f  ! 126: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba981f  ! 127: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba991f  ! 128: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 129: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 130: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3ba989f  ! 131: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba995f  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc28a901f  ! 133: LDUBA_R	lduba	[%r10, %r31] 0x80, %r1
	.word 0xd3ba983f  ! 134: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 135: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd2dae058  ! 136: LDXA_I	ldxa	[%r11, + 0x0058] %asi, %r9
	.word 0xc25a801f  ! 137: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xc9ba989f  ! 138: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc6c2903f  ! 139: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r3
	.word 0xc7bad9bf  ! 140: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7bad83f  ! 141: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad85f  ! 142: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 143: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc802a020  ! 144: LDUW_I	lduw	[%r10 + 0x0020], %r4
	.word 0xd1f2d01f  ! 145: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1f2e01f  ! 146: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1e2d01f  ! 147: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xc39aa000  ! 148: LDDFA_I	ldda	[%r10, 0x0000], %f1
	.word 0xc5f2d01f  ! 149: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc5bad8bf  ! 150: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd08aa062  ! 151: LDUBA_I	lduba	[%r10, + 0x0062] %asi, %r8
	.word 0xcdbad89f  ! 152: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad97f  ! 153: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc09aa010  ! 154: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r0
	.word 0xcaca913f  ! 155: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r5
TH_LABEL155:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc2caa07d  ! 156: LDSBA_I	ldsba	[%r10, + 0x007d] %asi, %r1
	.word 0xd3e2901f  ! 157: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd292903f  ! 158: LDUHA_R	lduha	[%r10, %r31] 0x81, %r9
	.word 0xc48aa01a  ! 159: LDUBA_I	lduba	[%r10, + 0x001a] %asi, %r2
	.word 0xce8a905f  ! 160: LDUBA_R	lduba	[%r10, %r31] 0x82, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfba98bf  ! 161: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xce4aa057  ! 162: LDSB_I	ldsb	[%r10 + 0x0057], %r7
	.word 0xd3ba987f  ! 163: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc442c01f  ! 164: LDSW_R	ldsw	[%r11 + %r31], %r2
	.word 0xcde2d01f  ! 165: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc79aa028  ! 166: LDDFA_I	ldda	[%r10, 0x0028], %f3
	.word 0xc83aa070  ! 167: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xcbba99bf  ! 168: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xccc2903f  ! 169: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r6
	.word 0xc292d01f  ! 170: LDUHA_R	lduha	[%r11, %r31] 0x80, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7e2d13f  ! 171: CASA_I	casa	[%r11] 0x89, %r31, %r3
	.word 0xc7bad89f  ! 172: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae070  ! 173: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xc43ae070  ! 174: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xcb9aa050  ! 175: LDDFA_I	ldda	[%r10, 0x0050], %f5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1ba985f  ! 176: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc852a00c  ! 177: LDSH_I	ldsh	[%r10 + 0x000c], %r4
	.word 0xc802e01c  ! 178: LDUW_I	lduw	[%r11 + 0x001c], %r4
	.word 0xcf9aa050  ! 179: LDDFA_I	ldda	[%r10, 0x0050], %f7
	.word 0xcdf2e01f  ! 180: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xce42a02c  ! 181: LDSW_I	ldsw	[%r10 + 0x002c], %r7
	.word 0xcd22801f  ! 182: STF_R	st	%f6, [%r31, %r10]
	.word 0xd242a02c  ! 183: LDSW_I	ldsw	[%r10 + 0x002c], %r9
	.word 0xd3ba989f  ! 184: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 185: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3e2913f  ! 186: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba98bf  ! 187: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xca5aa030  ! 188: LDX_I	ldx	[%r10 + 0x0030], %r5
	.word 0xc5e2911f  ! 189: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xd19aa030  ! 190: LDDFA_I	ldda	[%r10, 0x0030], %f8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdf2901f  ! 191: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba997f  ! 192: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 193: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xce8a901f  ! 194: LDUBA_R	lduba	[%r10, %r31] 0x80, %r7
	.word 0xcbe2a01f  ! 195: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbba985f  ! 196: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc01ae068  ! 197: LDD_I	ldd	[%r11 + 0x0068], %r0
	.word 0xc39aa050  ! 198: LDDFA_I	ldda	[%r10, 0x0050], %f1
	.word 0xd092917f  ! 199: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r8
	.word 0xc282a038  ! 200: LDUWA_I	lduwa	[%r10, + 0x0038] %asi, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5ba987f  ! 201: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc252c01f  ! 202: LDSH_R	ldsh	[%r11 + %r31], %r1
	.word 0xd3e2d11f  ! 203: CASA_I	casa	[%r11] 0x88, %r31, %r9
	.word 0xd3f2e01f  ! 204: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad97f  ! 205: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc282903f  ! 206: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r1
	.word 0xcfe2d01f  ! 207: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcc3ac01f  ! 208: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcfe2d11f  ! 209: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xcc3ac01f  ! 210: STD_R	std	%r6, [%r11 + %r31]
TH_LABEL210:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfbad83f  ! 211: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd012801f  ! 212: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xc7ba99bf  ! 213: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd00a801f  ! 214: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xd3bad8bf  ! 215: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3bad9bf  ! 216: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2d03f  ! 217: CASXA_I	casxa	[%r11] 0x81, %r31, %r9
	.word 0xd3bad99f  ! 218: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae018  ! 219: STD_I	std	%r8, [%r11 + 0x0018]
	.word 0xcd02801f  ! 220: LDF_R	ld	[%r10, %r31], %f6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc4aa058  ! 221: LDSB_I	ldsb	[%r10 + 0x0058], %r6
	.word 0xc3e2a01f  ! 222: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xce0a801f  ! 223: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xd20ac01f  ! 224: LDUB_R	ldub	[%r11 + %r31], %r9
	.word 0xc5e2a01f  ! 225: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5ba985f  ! 226: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 227: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa048  ! 228: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc43a801f  ! 229: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba991f  ! 230: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL230:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5f2a01f  ! 231: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2913f  ! 232: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5e2a01f  ! 233: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc302c01f  ! 234: LDF_R	ld	[%r11, %r31], %f1
	.word 0xd3ba999f  ! 235: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3ba985f  ! 236: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 237: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd3f2a01f  ! 238: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xcb02a074  ! 239: LDF_I	ld	[%r10, 0x0074], %f5
	.word 0xca92901f  ! 240: LDUHA_R	lduha	[%r10, %r31] 0x80, %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd03a801f  ! 241: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba98bf  ! 242: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcb22801f  ! 243: STF_R	st	%f5, [%r31, %r10]
	.word 0xc9f2a01f  ! 244: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xd322c01f  ! 245: STF_R	st	%f9, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd03aa060  ! 246: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd03a801f  ! 247: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc892d01f  ! 248: LDUHA_R	lduha	[%r11, %r31] 0x80, %r4
	.word 0xc44a801f  ! 249: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xc99aa018  ! 250: LDDFA_I	ldda	[%r10, 0x0018], %f4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xccc2a03c  ! 251: LDSWA_I	ldswa	[%r10, + 0x003c] %asi, %r6
	.word 0xc5e2a01f  ! 252: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5f2901f  ! 253: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5e2a01f  ! 254: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 255: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc89ae018  ! 256: LDDA_I	ldda	[%r11, + 0x0018] %asi, %r4
	.word 0xc9ba99bf  ! 257: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd09aa018  ! 258: LDDA_I	ldda	[%r10, + 0x0018] %asi, %r8
	.word 0xcbba989f  ! 259: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd122c01f  ! 260: STF_R	st	%f8, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdbad93f  ! 261: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc8c2a004  ! 262: LDSWA_I	ldswa	[%r10, + 0x0004] %asi, %r4
	.word 0xc9ba997f  ! 263: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 264: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 265: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9f2a01f  ! 266: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2901f  ! 267: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc81aa068  ! 268: LDD_I	ldd	[%r10 + 0x0068], %r4
	.word 0xd1ba987f  ! 269: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba991f  ! 270: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcb02801f  ! 271: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc7ba995f  ! 272: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 273: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 274: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7f2901f  ! 275: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7ba995f  ! 276: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc65ae078  ! 277: LDX_I	ldx	[%r11 + 0x0078], %r3
	.word 0xc39ae078  ! 278: LDDFA_I	ldda	[%r11, 0x0078], %f1
	.word 0xc452c01f  ! 279: LDSH_R	ldsh	[%r11 + %r31], %r2
	.word 0xca5a801f  ! 280: LDX_R	ldx	[%r10 + %r31], %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3f2e01f  ! 281: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xccd2d13f  ! 282: LDSHA_R	ldsha	[%r11, %r31] 0x89, %r6
	.word 0xd2c2901f  ! 283: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r9
	.word 0xcbe2901f  ! 284: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcc9aa058  ! 285: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7bad91f  ! 286: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae038  ! 287: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xc292a05c  ! 288: LDUHA_I	lduha	[%r10, + 0x005c] %asi, %r1
	.word 0xc5f2e01f  ! 289: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2d01f  ! 290: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5bad83f  ! 291: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad89f  ! 292: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcf02801f  ! 293: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcb22801f  ! 294: STF_R	st	%f5, [%r31, %r10]
	.word 0xcb02e04c  ! 295: LDF_I	ld	[%r11, 0x004c], %f5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbbaa050  ! 296: STDFA_I	stda	%f5, [0x0050, %r10]
	.word 0xca02a004  ! 297: LDUW_I	lduw	[%r10 + 0x0004], %r5
	.word 0xc3ba995f  ! 298: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 299: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc28aa033  ! 300: LDUBA_I	lduba	[%r10, + 0x0033] %asi, %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc602e038  ! 301: LDUW_I	lduw	[%r11 + 0x0038], %r3
	.word 0xd03a801f  ! 302: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd252801f  ! 303: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xc5ba989f  ! 304: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc492903f  ! 305: LDUHA_R	lduha	[%r10, %r31] 0x81, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdf2a01f  ! 306: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2a01f  ! 307: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xca5aa030  ! 308: LDX_I	ldx	[%r10 + 0x0030], %r5
	.word 0xccdaa018  ! 309: LDXA_I	ldxa	[%r10, + 0x0018] %asi, %r6
	.word 0xc28aa070  ! 310: LDUBA_I	lduba	[%r10, + 0x0070] %asi, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc302e060  ! 311: LDF_I	ld	[%r11, 0x0060], %f1
	.word 0xcfba989f  ! 312: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba983f  ! 313: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa038  ! 314: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xc652801f  ! 315: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd002801f  ! 316: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xc40a801f  ! 317: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xc89aa010  ! 318: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r4
	.word 0xc83ac01f  ! 319: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad91f  ! 320: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd0da917f  ! 321: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r8
	.word 0xd122c01f  ! 322: STF_R	st	%f8, [%r31, %r11]
	.word 0xccdae008  ! 323: LDXA_I	ldxa	[%r11, + 0x0008] %asi, %r6
	.word 0xd1ba989f  ! 324: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcf02c01f  ! 325: LDF_R	ld	[%r11, %r31], %f7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc3a801f  ! 326: STD_R	std	%r6, [%r10 + %r31]
	.word 0xca92d11f  ! 327: LDUHA_R	lduha	[%r11, %r31] 0x88, %r5
	.word 0xcdf2913f  ! 328: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcdf2901f  ! 329: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xc8da901f  ! 330: LDXA_R	ldxa	[%r10, %r31] 0x80, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3bad81f  ! 331: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad97f  ! 332: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad95f  ! 333: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcc42801f  ! 334: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xc7ba98bf  ! 335: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc602a008  ! 336: LDUW_I	lduw	[%r10 + 0x0008], %r3
	.word 0xcb22801f  ! 337: STF_R	st	%f5, [%r31, %r10]
	.word 0xcfbae000  ! 338: STDFA_I	stda	%f7, [0x0000, %r11]
	.word 0xcfbad85f  ! 339: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc52801f  ! 340: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd28ae058  ! 341: LDUBA_I	lduba	[%r11, + 0x0058] %asi, %r9
	.word 0xd1bad85f  ! 342: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d01f  ! 343: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xd1bad91f  ! 344: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc28ae051  ! 345: LDUBA_I	lduba	[%r11, + 0x0051] %asi, %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd2d2a074  ! 346: LDSHA_I	ldsha	[%r10, + 0x0074] %asi, %r9
	.word 0xcac2905f  ! 347: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r5
	.word 0xcfbad97f  ! 348: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcf9aa068  ! 349: LDDFA_I	ldda	[%r10, 0x0068], %f7
	.word 0xc2d2e034  ! 350: LDSHA_I	ldsha	[%r11, + 0x0034] %asi, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc502a010  ! 351: LDF_I	ld	[%r10, 0x0010], %f2
	.word 0xd052a000  ! 352: LDSH_I	ldsh	[%r10 + 0x0000], %r8
	.word 0xc9f2e01f  ! 353: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc79aa008  ! 354: LDDFA_I	ldda	[%r10, 0x0008], %f3
	.word 0xcdba981f  ! 355: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdba989f  ! 356: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xca8ad03f  ! 357: LDUBA_R	lduba	[%r11, %r31] 0x81, %r5
	.word 0xd3bad85f  ! 358: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad97f  ! 359: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 360: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3bad95f  ! 361: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd1baa028  ! 362: STDFA_I	stda	%f8, [0x0028, %r10]
	.word 0xcff2913f  ! 363: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xcfe2a01f  ! 364: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd08a917f  ! 365: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba981f  ! 366: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba983f  ! 367: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 368: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcff2901f  ! 369: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcfba991f  ! 370: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcff2903f  ! 371: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcfba985f  ! 372: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcadaa028  ! 373: LDXA_I	ldxa	[%r10, + 0x0028] %asi, %r5
	.word 0xc3f2d03f  ! 374: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xccd2901f  ! 375: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc39ae048  ! 376: LDDFA_I	ldda	[%r11, 0x0048], %f1
	.word 0xcc3ae048  ! 377: STD_I	std	%r6, [%r11 + 0x0048]
	.word 0xcc3ae048  ! 378: STD_I	std	%r6, [%r11 + 0x0048]
	.word 0xc64ae045  ! 379: LDSB_I	ldsb	[%r11 + 0x0045], %r3
	.word 0xd322801f  ! 380: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1ba997f  ! 381: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc902c01f  ! 382: LDF_R	ld	[%r11, %r31], %f4
	.word 0xd1ba999f  ! 383: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba98bf  ! 384: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba985f  ! 385: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL385:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1ba993f  ! 386: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 387: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcd9aa028  ! 388: LDDFA_I	ldda	[%r10, 0x0028], %f6
	.word 0xcc5a801f  ! 389: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xc492d05f  ! 390: LDUHA_R	lduha	[%r11, %r31] 0x82, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd302e004  ! 391: LDF_I	ld	[%r11, 0x0004], %f9
	.word 0xc842e028  ! 392: LDSW_I	ldsw	[%r11 + 0x0028], %r4
	.word 0xc83ae040  ! 393: STD_I	std	%r4, [%r11 + 0x0040]
	.word 0xc9bad99f  ! 394: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcb02801f  ! 395: LDF_R	ld	[%r10, %r31], %f5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc83a801f  ! 396: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcf9ae008  ! 397: LDDFA_I	ldda	[%r11, 0x0008], %f7
	.word 0xcfba983f  ! 398: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 399: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xce4ae00d  ! 400: LDSB_I	ldsb	[%r11 + 0x000d], %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc68a901f  ! 401: LDUBA_R	lduba	[%r10, %r31] 0x80, %r3
	.word 0xc3ba997f  ! 402: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc502a01c  ! 403: LDF_I	ld	[%r10, 0x001c], %f2
	.word 0xc3baa028  ! 404: STDFA_I	stda	%f1, [0x0028, %r10]
	.word 0xc83a801f  ! 405: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9ba991f  ! 406: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 407: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc502801f  ! 408: LDF_R	ld	[%r10, %r31], %f2
	.word 0xd1ba995f  ! 409: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba997f  ! 410: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1f2901f  ! 411: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xc88aa01e  ! 412: LDUBA_I	lduba	[%r10, + 0x001e] %asi, %r4
	.word 0xc5f2d01f  ! 413: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc84ac01f  ! 414: LDSB_R	ldsb	[%r11 + %r31], %r4
	.word 0xd3ba991f  ! 415: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03aa060  ! 416: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd3ba987f  ! 417: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 418: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd03aa060  ! 419: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xce42a000  ! 420: LDSW_I	ldsw	[%r10 + 0x0000], %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1bad89f  ! 421: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad87f  ! 422: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 423: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d13f  ! 424: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xc4c2d01f  ! 425: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd002e070  ! 426: LDUW_I	lduw	[%r11 + 0x0070], %r8
	.word 0xc802c01f  ! 427: LDUW_R	lduw	[%r11 + %r31], %r4
	.word 0xc88a903f  ! 428: LDUBA_R	lduba	[%r10, %r31] 0x81, %r4
	.word 0xc5ba995f  ! 429: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2903f  ! 430: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5ba989f  ! 431: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd322801f  ! 432: STF_R	st	%f9, [%r31, %r10]
	.word 0xc522c01f  ! 433: STF_R	st	%f2, [%r31, %r11]
	.word 0xc3baa060  ! 434: STDFA_I	stda	%f1, [0x0060, %r10]
	.word 0xcdba999f  ! 435: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc3aa038  ! 436: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcb9aa030  ! 437: LDDFA_I	ldda	[%r10, 0x0030], %f5
	.word 0xc2caa008  ! 438: LDSBA_I	ldsba	[%r10, + 0x0008] %asi, %r1
	.word 0xc5e2e01f  ! 439: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad89f  ! 440: STDFA_R	stda	%f2, [%r31, %r11]
TH_LABEL440:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5f2d11f  ! 441: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xc302e074  ! 442: LDF_I	ld	[%r11, 0x0074], %f1
	.word 0xc9ba989f  ! 443: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc48aa016  ! 444: LDUBA_I	lduba	[%r10, + 0x0016] %asi, %r2
	.word 0xc3bad83f  ! 445: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3e2d03f  ! 446: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xd102c01f  ! 447: LDF_R	ld	[%r11, %r31], %f8
	.word 0xd3f2a01f  ! 448: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc41a801f  ! 449: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc03aa008  ! 450: STD_I	std	%r0, [%r10 + 0x0008]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3f2901f  ! 451: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc7bae078  ! 452: STDFA_I	stda	%f3, [0x0078, %r11]
	.word 0xd102a004  ! 453: LDF_I	ld	[%r10, 0x0004], %f8
	.word 0xc7ba981f  ! 454: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 455: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7e2911f  ! 456: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xc7f2901f  ! 457: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba989f  ! 458: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcc0a801f  ! 459: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xd1ba981f  ! 460: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1ba987f  ! 461: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 462: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2911f  ! 463: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xd1f2911f  ! 464: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xd1f2911f  ! 465: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1f2a01f  ! 466: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc4dad03f  ! 467: LDXA_R	ldxa	[%r11, %r31] 0x81, %r2
	.word 0xc5ba98bf  ! 468: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 469: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 470: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc99aa040  ! 471: LDDFA_I	ldda	[%r10, 0x0040], %f4
	.word 0xd1e2903f  ! 472: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd39aa020  ! 473: LDDFA_I	ldda	[%r10, 0x0020], %f9
	.word 0xd1bad81f  ! 474: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2e01f  ! 475: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd102a01c  ! 476: LDF_I	ld	[%r10, 0x001c], %f8
	.word 0xd1ba985f  ! 477: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba98bf  ! 478: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba997f  ! 479: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc882d07f  ! 480: LDUWA_R	lduwa	[%r11, %r31] 0x83, %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9f2a01f  ! 481: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xcf22801f  ! 482: STF_R	st	%f7, [%r31, %r10]
	.word 0xc84ac01f  ! 483: LDSB_R	ldsb	[%r11 + %r31], %r4
	.word 0xd0d2a05c  ! 484: LDSHA_I	ldsha	[%r10, + 0x005c] %asi, %r8
	.word 0xcf02801f  ! 485: LDF_R	ld	[%r10, %r31], %f7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc902e058  ! 486: LDF_I	ld	[%r11, 0x0058], %f4
	.word 0xc9ba999f  ! 487: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba995f  ! 488: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc902e034  ! 489: LDF_I	ld	[%r11, 0x0034], %f4
	.word 0xcc3a801f  ! 490: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd282d05f  ! 491: LDUWA_R	lduwa	[%r11, %r31] 0x82, %r9
	.word 0xcdba985f  ! 492: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 493: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba997f  ! 494: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 495: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbbaa010  ! 496: STDFA_I	stda	%f5, [0x0010, %r10]
	.word 0xce12c01f  ! 497: LDUH_R	lduh	[%r11 + %r31], %r7
	.word 0xd3ba991f  ! 498: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 499: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2a01f  ! 500: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc65ae078  ! 501: LDX_I	ldx	[%r11 + 0x0078], %r3
	.word 0xca92907f  ! 502: LDUHA_R	lduha	[%r10, %r31] 0x83, %r5
	.word 0xcbf2903f  ! 503: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xcbf2a01f  ! 504: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba983f  ! 505: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbf2a01f  ! 506: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2903f  ! 507: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xcbba991f  ! 508: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc39aa018  ! 509: LDDFA_I	ldda	[%r10, 0x0018], %f1
	.word 0xcc9ae038  ! 510: LDDA_I	ldda	[%r11, + 0x0038] %asi, %r6
TH_LABEL510:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc52801f  ! 511: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xc43a801f  ! 512: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba99bf  ! 513: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc702c01f  ! 514: LDF_R	ld	[%r11, %r31], %f3
	.word 0xc2d2a066  ! 515: LDSHA_I	ldsha	[%r10, + 0x0066] %asi, %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbba98bf  ! 516: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba991f  ! 517: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 518: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc4cad11f  ! 519: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r2
	.word 0xced2d11f  ! 520: LDSHA_R	ldsha	[%r11, %r31] 0x88, %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcb22801f  ! 521: STF_R	st	%f5, [%r31, %r10]
	.word 0xc202801f  ! 522: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xd1baa000  ! 523: STDFA_I	stda	%f8, [0x0000, %r10]
	.word 0xc3ba981f  ! 524: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa028  ! 525: STD_I	std	%r0, [%r10 + 0x0028]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd042c01f  ! 526: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xce12a030  ! 527: LDUH_I	lduh	[%r10 + 0x0030], %r7
	.word 0xc9f2a01f  ! 528: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xca82a034  ! 529: LDUWA_I	lduwa	[%r10, + 0x0034] %asi, %r5
	.word 0xcdbae048  ! 530: STDFA_I	stda	%f6, [0x0048, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcd02801f  ! 531: LDF_R	ld	[%r10, %r31], %f6
	.word 0xcdbad99f  ! 532: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcadaa070  ! 533: LDXA_I	ldxa	[%r10, + 0x0070] %asi, %r5
	.word 0xc9ba98bf  ! 534: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba987f  ! 535: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc252801f  ! 536: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xcc3aa070  ! 537: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcfba999f  ! 538: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 539: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xc25a801f  ! 540: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9e2911f  ! 541: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc4d2907f  ! 542: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r2
	.word 0xc502a024  ! 543: LDF_I	ld	[%r10, 0x0024], %f2
	.word 0xcbba995f  ! 544: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc652c01f  ! 545: LDSH_R	ldsh	[%r11 + %r31], %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc3a801f  ! 546: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2a01f  ! 547: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba983f  ! 548: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba985f  ! 549: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2901f  ! 550: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfe2a01f  ! 551: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba999f  ! 552: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc852801f  ! 553: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xca4a801f  ! 554: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xd242e028  ! 555: LDSW_I	ldsw	[%r11 + 0x0028], %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc4daa020  ! 556: LDXA_I	ldxa	[%r10, + 0x0020] %asi, %r2
	.word 0xcad2a022  ! 557: LDSHA_I	ldsha	[%r10, + 0x0022] %asi, %r5
	.word 0xc84ae03a  ! 558: LDSB_I	ldsb	[%r11 + 0x003a], %r4
	.word 0xcacad15f  ! 559: LDSBA_R	ldsba	[%r11, %r31] 0x8a, %r5
	.word 0xc5f2a01f  ! 560: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc8dad03f  ! 561: LDXA_R	ldxa	[%r11, %r31] 0x81, %r4
	.word 0xc01aa050  ! 562: LDD_I	ldd	[%r10 + 0x0050], %r0
	.word 0xd3ba98bf  ! 563: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2903f  ! 564: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xcf22801f  ! 565: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03ac01f  ! 566: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2e01f  ! 567: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad91f  ! 568: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad89f  ! 569: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d03f  ! 570: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcf22801f  ! 571: STF_R	st	%f7, [%r31, %r10]
	.word 0xcbbad87f  ! 572: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc8caa06b  ! 573: LDSBA_I	ldsba	[%r10, + 0x006b] %asi, %r4
	.word 0xcde2a01f  ! 574: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2913f  ! 575: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
TH_LABEL575:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc652801f  ! 576: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xd302801f  ! 577: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd1f2a01f  ! 578: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc59ae070  ! 579: LDDFA_I	ldda	[%r11, 0x0070], %f2
	.word 0xc5e2e01f  ! 580: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc43ae030  ! 581: STD_I	std	%r2, [%r11 + 0x0030]
	.word 0xc5bad99f  ! 582: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2d03f  ! 583: CASA_I	casa	[%r11] 0x81, %r31, %r2
	.word 0xc60ac01f  ! 584: LDUB_R	ldub	[%r11 + %r31], %r3
	.word 0xd322801f  ! 585: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3f2901f  ! 586: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc03aa030  ! 587: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba993f  ! 588: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc6cad01f  ! 589: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r3
	.word 0xc652e01e  ! 590: LDSH_I	ldsh	[%r11 + 0x001e], %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbba99bf  ! 591: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 592: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xc8c2905f  ! 593: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r4
	.word 0xcfba997f  ! 594: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba98bf  ! 595: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL595:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd042a020  ! 596: LDSW_I	ldsw	[%r10 + 0x0020], %r8
	.word 0xd212e06c  ! 597: LDUH_I	lduh	[%r11 + 0x006c], %r9
	.word 0xd1e2d03f  ! 598: CASA_I	casa	[%r11] 0x81, %r31, %r8
	.word 0xd1e2e01f  ! 599: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1f2e01f  ! 600: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd03ae070  ! 601: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xc59ae078  ! 602: LDDFA_I	ldda	[%r11, 0x0078], %f2
	.word 0xd012a032  ! 603: LDUH_I	lduh	[%r10 + 0x0032], %r8
	.word 0xca12c01f  ! 604: LDUH_R	lduh	[%r11 + %r31], %r5
	.word 0xd3ba983f  ! 605: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3ba989f  ! 606: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 607: STD_R	std	%r8, [%r10 + %r31]
	.word 0xce12801f  ! 608: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xd0cae042  ! 609: LDSBA_I	ldsba	[%r11, + 0x0042] %asi, %r8
	.word 0xd002801f  ! 610: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xce52801f  ! 611: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xd3ba981f  ! 612: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 613: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 614: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3f2a01f  ! 615: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3ba99bf  ! 616: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xccc2a010  ! 617: LDSWA_I	ldswa	[%r10, + 0x0010] %asi, %r6
	.word 0xc9e2a01f  ! 618: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba985f  ! 619: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 620: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc83a801f  ! 621: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba985f  ! 622: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2913f  ! 623: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9e2a01f  ! 624: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xd20a801f  ! 625: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3e2911f  ! 626: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xc3e2901f  ! 627: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba985f  ! 628: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 629: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc41ac01f  ! 630: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7ba991f  ! 631: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba995f  ! 632: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 633: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba99bf  ! 634: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd292a068  ! 635: LDUHA_I	lduha	[%r10, + 0x0068] %asi, %r9
TH_LABEL635:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbba985f  ! 636: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba98bf  ! 637: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba995f  ! 638: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc812e05c  ! 639: LDUH_I	lduh	[%r11 + 0x005c], %r4
	.word 0xc84ac01f  ! 640: LDSB_R	ldsb	[%r11 + %r31], %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfba999f  ! 641: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2901f  ! 642: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcfba993f  ! 643: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcb02801f  ! 644: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc5e2901f  ! 645: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3bae018  ! 646: STDFA_I	stda	%f9, [0x0018, %r11]
	.word 0xcbbaa030  ! 647: STDFA_I	stda	%f5, [0x0030, %r10]
	.word 0xd3e2a01f  ! 648: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba993f  ! 649: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 650: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL650:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3f2903f  ! 651: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xd03a801f  ! 652: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba993f  ! 653: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcd02a01c  ! 654: LDF_I	ld	[%r10, 0x001c], %f6
	.word 0xc4c2d13f  ! 655: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc6d2a014  ! 656: LDSHA_I	ldsha	[%r10, + 0x0014] %asi, %r3
	.word 0xc43a801f  ! 657: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa048  ! 658: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc7ba993f  ! 659: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcdbae060  ! 660: STDFA_I	stda	%f6, [0x0060, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xccd2903f  ! 661: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r6
	.word 0xc9e2913f  ! 662: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba99bf  ! 663: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 664: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd04a801f  ! 665: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc79aa020  ! 666: LDDFA_I	ldda	[%r10, 0x0020], %f3
	.word 0xd00ae068  ! 667: LDUB_I	ldub	[%r11 + 0x0068], %r8
	.word 0xc3bad85f  ! 668: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xca92901f  ! 669: LDUHA_R	lduha	[%r10, %r31] 0x80, %r5
	.word 0xc20ac01f  ! 670: LDUB_R	ldub	[%r11 + %r31], %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3bad85f  ! 671: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc85ac01f  ! 672: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xd1ba991f  ! 673: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc502801f  ! 674: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcdf2e01f  ! 675: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdbad9bf  ! 676: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc44a801f  ! 677: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xc3f2911f  ! 678: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xd0caa01f  ! 679: LDSBA_I	ldsba	[%r10, + 0x001f] %asi, %r8
	.word 0xc43a801f  ! 680: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc302c01f  ! 681: LDF_R	ld	[%r11, %r31], %f1
	.word 0xc7bad9bf  ! 682: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad89f  ! 683: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc702e034  ! 684: LDF_I	ld	[%r11, 0x0034], %f3
	.word 0xd302801f  ! 685: LDF_R	ld	[%r10, %r31], %f9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc12801f  ! 686: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xc522801f  ! 687: STF_R	st	%f2, [%r31, %r10]
	.word 0xcfbad89f  ! 688: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc7bae000  ! 689: STDFA_I	stda	%f3, [0x0000, %r11]
	.word 0xcc0a801f  ! 690: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd03a801f  ! 691: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba981f  ! 692: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 693: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc01ae030  ! 694: LDD_I	ldd	[%r11 + 0x0030], %r0
	.word 0xca02e050  ! 695: LDUW_I	lduw	[%r11 + 0x0050], %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5baa030  ! 696: STDFA_I	stda	%f2, [0x0030, %r10]
	.word 0xc41a801f  ! 697: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xd3e2e01f  ! 698: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad9bf  ! 699: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad99f  ! 700: STDFA_R	stda	%f9, [%r31, %r11]
TH_LABEL700:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc28ae017  ! 701: LDUBA_I	lduba	[%r11, + 0x0017] %asi, %r1
	.word 0xc3e2a01f  ! 702: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba981f  ! 703: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc41a801f  ! 704: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xca02c01f  ! 705: LDUW_R	lduw	[%r11 + %r31], %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7e2901f  ! 706: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc09ae068  ! 707: LDDA_I	ldda	[%r11, + 0x0068] %asi, %r0
	.word 0xc7f2a01f  ! 708: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc702e054  ! 709: LDF_I	ld	[%r11, 0x0054], %f3
	.word 0xcad2913f  ! 710: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3bad8bf  ! 711: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 712: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc03ae040  ! 713: STD_I	std	%r0, [%r11 + 0x0040]
	.word 0xd20a801f  ! 714: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xc84ae051  ! 715: LDSB_I	ldsb	[%r11 + 0x0051], %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd012801f  ! 716: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xcbbaa040  ! 717: STDFA_I	stda	%f5, [0x0040, %r10]
	.word 0xc6c2e05c  ! 718: LDSWA_I	ldswa	[%r11, + 0x005c] %asi, %r3
	.word 0xc45aa038  ! 719: LDX_I	ldx	[%r10 + 0x0038], %r2
	.word 0xc5bad8bf  ! 720: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcedae028  ! 721: LDXA_I	ldxa	[%r11, + 0x0028] %asi, %r7
	.word 0xc7bad99f  ! 722: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcf22c01f  ! 723: STF_R	st	%f7, [%r31, %r11]
	.word 0xc9e2901f  ! 724: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2911f  ! 725: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd24a801f  ! 726: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xc60a801f  ! 727: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xcbba987f  ! 728: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba995f  ! 729: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 730: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcb9aa040  ! 731: LDDFA_I	ldda	[%r10, 0x0040], %f5
	.word 0xd3f2d01f  ! 732: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd3bad99f  ! 733: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc852801f  ! 734: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xc9f2d03f  ! 735: CASXA_I	casxa	[%r11] 0x81, %r31, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9bad85f  ! 736: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc6ca917f  ! 737: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r3
	.word 0xc83a801f  ! 738: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba989f  ! 739: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 740: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcac2911f  ! 741: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r5
	.word 0xce52e068  ! 742: LDSH_I	ldsh	[%r11 + 0x0068], %r7
	.word 0xcc52801f  ! 743: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xcbbae070  ! 744: STDFA_I	stda	%f5, [0x0070, %r11]
	.word 0xc7bae010  ! 745: STDFA_I	stda	%f3, [0x0010, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc99aa000  ! 746: LDDFA_I	ldda	[%r10, 0x0000], %f4
	.word 0xcc3aa068  ! 747: STD_I	std	%r6, [%r10 + 0x0068]
	.word 0xcdba981f  ! 748: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd3baa028  ! 749: STDFA_I	stda	%f9, [0x0028, %r10]
	.word 0xc5ba993f  ! 750: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5f2901f  ! 751: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xce0aa075  ! 752: LDUB_I	ldub	[%r10 + 0x0075], %r7
	.word 0xcb22c01f  ! 753: STF_R	st	%f5, [%r31, %r11]
	.word 0xd2cad01f  ! 754: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r9
	.word 0xce4ac01f  ! 755: LDSB_R	ldsb	[%r11 + %r31], %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xca8aa018  ! 756: LDUBA_I	lduba	[%r10, + 0x0018] %asi, %r5
	.word 0xcb02a04c  ! 757: LDF_I	ld	[%r10, 0x004c], %f5
	.word 0xceca911f  ! 758: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r7
	.word 0xc502c01f  ! 759: LDF_R	ld	[%r11, %r31], %f2
	.word 0xc43a801f  ! 760: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7e2913f  ! 761: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc43aa038  ! 762: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xcec2901f  ! 763: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r7
	.word 0xc3bad99f  ! 764: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 765: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xca0a801f  ! 766: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xd1bad81f  ! 767: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ac01f  ! 768: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1f2d11f  ! 769: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xc442801f  ! 770: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3ba981f  ! 771: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcecad01f  ! 772: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r7
	.word 0xc5ba995f  ! 773: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 774: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 775: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xce12a078  ! 776: LDUH_I	lduh	[%r10 + 0x0078], %r7
	.word 0xceda911f  ! 777: LDXA_R	ldxa	[%r10, %r31] 0x88, %r7
	.word 0xc25ac01f  ! 778: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xc452a024  ! 779: LDSH_I	ldsh	[%r10 + 0x0024], %r2
	.word 0xd252a036  ! 780: LDSH_I	ldsh	[%r10 + 0x0036], %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3ba993f  ! 781: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba993f  ! 782: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa060  ! 783: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd3ba989f  ! 784: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa060  ! 785: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcb22801f  ! 786: STF_R	st	%f5, [%r31, %r10]
	.word 0xc41a801f  ! 787: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xd08a913f  ! 788: LDUBA_R	lduba	[%r10, %r31] 0x89, %r8
	.word 0xcfba99bf  ! 789: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc59aa010  ! 790: LDDFA_I	ldda	[%r10, 0x0010], %f2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc89aa020  ! 791: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r4
	.word 0xc7ba993f  ! 792: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa068  ! 793: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xcb9aa000  ! 794: LDDFA_I	ldda	[%r10, 0x0000], %f5
	.word 0xcfba993f  ! 795: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcad2d13f  ! 796: LDSHA_R	ldsha	[%r11, %r31] 0x89, %r5
	.word 0xc80a801f  ! 797: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xc282903f  ! 798: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r1
	.word 0xcbe2e01f  ! 799: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xca92913f  ! 800: LDUHA_R	lduha	[%r10, %r31] 0x89, %r5
TH_LABEL800:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbf2e01f  ! 801: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad91f  ! 802: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc502e014  ! 803: LDF_I	ld	[%r11, 0x0014], %f2
	.word 0xc60aa029  ! 804: LDUB_I	ldub	[%r10 + 0x0029], %r3
	.word 0xc7bad83f  ! 805: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc682e044  ! 806: LDUWA_I	lduwa	[%r11, + 0x0044] %asi, %r3
	.word 0xcfba999f  ! 807: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba991f  ! 808: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba983f  ! 809: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba991f  ! 810: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcf02e014  ! 811: LDF_I	ld	[%r11, 0x0014], %f7
	.word 0xce5ac01f  ! 812: LDX_R	ldx	[%r11 + %r31], %r7
	.word 0xc292a042  ! 813: LDUHA_I	lduha	[%r10, + 0x0042] %asi, %r1
	.word 0xd08ae047  ! 814: LDUBA_I	lduba	[%r11, + 0x0047] %asi, %r8
	.word 0xd03ae060  ! 815: STD_I	std	%r8, [%r11 + 0x0060]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3bad93f  ! 816: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 817: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xc502e060  ! 818: LDF_I	ld	[%r11, 0x0060], %f2
	.word 0xcac2913f  ! 819: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r5
	.word 0xd002a058  ! 820: LDUW_I	lduw	[%r10 + 0x0058], %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3ba983f  ! 821: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd39aa060  ! 822: LDDFA_I	ldda	[%r10, 0x0060], %f9
	.word 0xc5bad97f  ! 823: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad87f  ! 824: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad99f  ! 825: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd092a05e  ! 826: LDUHA_I	lduha	[%r10, + 0x005e] %asi, %r8
	.word 0xcbbad97f  ! 827: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad89f  ! 828: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd002a030  ! 829: LDUW_I	lduw	[%r10 + 0x0030], %r8
	.word 0xc9bad93f  ! 830: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9f2e01f  ! 831: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 832: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9f2d13f  ! 833: CASXA_I	casxa	[%r11] 0x89, %r31, %r4
	.word 0xcccae07f  ! 834: LDSBA_I	ldsba	[%r11, + 0x007f] %asi, %r6
	.word 0xd1baa060  ! 835: STDFA_I	stda	%f8, [0x0060, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7ba98bf  ! 836: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd0cad15f  ! 837: LDSBA_R	ldsba	[%r11, %r31] 0x8a, %r8
	.word 0xc3e2913f  ! 838: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc7baa068  ! 839: STDFA_I	stda	%f3, [0x0068, %r10]
	.word 0xca92a028  ! 840: LDUHA_I	lduha	[%r10, + 0x0028] %asi, %r5
TH_LABEL840:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc83ac01f  ! 841: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9e2d13f  ! 842: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc9e2d01f  ! 843: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc482d07f  ! 844: LDUWA_R	lduwa	[%r11, %r31] 0x83, %r2
	.word 0xc902801f  ! 845: LDF_R	ld	[%r10, %r31], %f4
TH_LABEL845:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc43aa038  ! 846: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc43aa038  ! 847: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc7f2a01f  ! 848: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba98bf  ! 849: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcd9aa050  ! 850: LDDFA_I	ldda	[%r10, 0x0050], %f6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbf2e01f  ! 851: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad83f  ! 852: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xca82915f  ! 853: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r5
	.word 0xd19ae018  ! 854: LDDFA_I	ldda	[%r11, 0x0018], %f8
	.word 0xd1e2901f  ! 855: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd03aa018  ! 856: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xc4d2905f  ! 857: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r2
	.word 0xc9ba981f  ! 858: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd292917f  ! 859: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r9
	.word 0xcacaa053  ! 860: LDSBA_I	ldsba	[%r10, + 0x0053] %asi, %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9bad87f  ! 861: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d03f  ! 862: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xc9f2d03f  ! 863: CASXA_I	casxa	[%r11] 0x81, %r31, %r4
	.word 0xc83ac01f  ! 864: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9f2d01f  ! 865: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9e2d01f  ! 866: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xd082917f  ! 867: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r8
	.word 0xc3e2d01f  ! 868: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xcd02801f  ! 869: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc642801f  ! 870: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5ba999f  ! 871: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xce02801f  ! 872: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xc5f2e01f  ! 873: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2e01f  ! 874: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 875: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc43ac01f  ! 876: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc402801f  ! 877: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xc402a07c  ! 878: LDUW_I	lduw	[%r10 + 0x007c], %r2
	.word 0xcc82e02c  ! 879: LDUWA_I	lduwa	[%r11, + 0x002c] %asi, %r6
	.word 0xc5e2a01f  ! 880: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc59aa000  ! 881: LDDFA_I	ldda	[%r10, 0x0000], %f2
	.word 0xd052801f  ! 882: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xc68aa063  ! 883: LDUBA_I	lduba	[%r10, + 0x0063] %asi, %r3
	.word 0xc5ba987f  ! 884: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 885: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd19aa068  ! 886: LDDFA_I	ldda	[%r10, 0x0068], %f8
	.word 0xd1e2913f  ! 887: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xc602c01f  ! 888: LDUW_R	lduw	[%r11 + %r31], %r3
	.word 0xd002801f  ! 889: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xc3f2911f  ! 890: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc922801f  ! 891: STF_R	st	%f4, [%r31, %r10]
	.word 0xd3e2a01f  ! 892: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xcec2d11f  ! 893: LDSWA_R	ldswa	[%r11, %r31] 0x88, %r7
	.word 0xd2dad03f  ! 894: LDXA_R	ldxa	[%r11, %r31] 0x81, %r9
	.word 0xd3e2d01f  ! 895: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3f2d01f  ! 896: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd3e2d11f  ! 897: CASA_I	casa	[%r11] 0x88, %r31, %r9
	.word 0xcc92907f  ! 898: LDUHA_R	lduha	[%r10, %r31] 0x83, %r6
	.word 0xc282901f  ! 899: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r1
	.word 0xc3f2d01f  ! 900: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3f2e01f  ! 901: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad99f  ! 902: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc41aa030  ! 903: LDD_I	ldd	[%r10 + 0x0030], %r2
	.word 0xcc3a801f  ! 904: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc322c01f  ! 905: STF_R	st	%f1, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc83aa060  ! 906: STD_I	std	%r4, [%r10 + 0x0060]
	.word 0xd04ae049  ! 907: LDSB_I	ldsb	[%r11 + 0x0049], %r8
	.word 0xc81aa008  ! 908: LDD_I	ldd	[%r10 + 0x0008], %r4
	.word 0xc5f2a01f  ! 909: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc482e030  ! 910: LDUWA_I	lduwa	[%r11, + 0x0030] %asi, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc25a801f  ! 911: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xcfbad81f  ! 912: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc6d2901f  ! 913: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r3
	.word 0xd0d2a07e  ! 914: LDSHA_I	ldsha	[%r10, + 0x007e] %asi, %r8
	.word 0xd1f2a01f  ! 915: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1f2a01f  ! 916: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc9baa020  ! 917: STDFA_I	stda	%f4, [0x0020, %r10]
	.word 0xd3ba989f  ! 918: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcd9aa070  ! 919: LDDFA_I	ldda	[%r10, 0x0070], %f6
	.word 0xcc4ac01f  ! 920: LDSB_R	ldsb	[%r11 + %r31], %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcf02801f  ! 921: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcfba981f  ! 922: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa000  ! 923: STD_I	std	%r6, [%r10 + 0x0000]
	.word 0xcfbaa048  ! 924: STDFA_I	stda	%f7, [0x0048, %r10]
	.word 0xc7ba989f  ! 925: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc442801f  ! 926: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xc5f2d01f  ! 927: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc5f2e01f  ! 928: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2e01f  ! 929: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 930: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5bad8bf  ! 931: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad8bf  ! 932: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad9bf  ! 933: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc89ae018  ! 934: LDDA_I	ldda	[%r11, + 0x0018] %asi, %r4
	.word 0xc7ba993f  ! 935: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7ba995f  ! 936: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcc52801f  ! 937: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xd03ac01f  ! 938: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd052a07e  ! 939: LDSH_I	ldsh	[%r10 + 0x007e], %r8
	.word 0xcc52c01f  ! 940: LDSH_R	ldsh	[%r11 + %r31], %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3ba997f  ! 941: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcc82a064  ! 942: LDUWA_I	lduwa	[%r10, + 0x0064] %asi, %r6
	.word 0xd3bae008  ! 943: STDFA_I	stda	%f9, [0x0008, %r11]
	.word 0xc242a020  ! 944: LDSW_I	ldsw	[%r10 + 0x0020], %r1
	.word 0xc9e2911f  ! 945: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9e2a01f  ! 946: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba993f  ! 947: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2911f  ! 948: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc81ac01f  ! 949: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xc652e002  ! 950: LDSH_I	ldsh	[%r11 + 0x0002], %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xce82a020  ! 951: LDUWA_I	lduwa	[%r10, + 0x0020] %asi, %r7
	.word 0xd242801f  ! 952: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xc702801f  ! 953: LDF_R	ld	[%r10, %r31], %f3
	.word 0xce02e04c  ! 954: LDUW_I	lduw	[%r11 + 0x004c], %r7
	.word 0xc7ba999f  ! 955: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc502e058  ! 956: LDF_I	ld	[%r11, 0x0058], %f2
	.word 0xc7bad99f  ! 957: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae070  ! 958: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xc7e2e01f  ! 959: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xcd9aa028  ! 960: LDDFA_I	ldda	[%r10, 0x0028], %f6
TH_LABEL960:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3ba985f  ! 961: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 962: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc5baa078  ! 963: STDFA_I	stda	%f2, [0x0078, %r10]
	.word 0xc7ba993f  ! 964: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 965: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL965:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7ba98bf  ! 966: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2911f  ! 967: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba981f  ! 968: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcd9ae040  ! 969: LDDFA_I	ldda	[%r11, 0x0040], %f6
	.word 0xcdf2a01f  ! 970: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdf2911f  ! 971: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcdba993f  ! 972: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd052a04e  ! 973: LDSH_I	ldsh	[%r10 + 0x004e], %r8
	.word 0xc43aa020  ! 974: STD_I	std	%r2, [%r10 + 0x0020]
	.word 0xc7ba997f  ! 975: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7ba999f  ! 976: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc6da915f  ! 977: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r3
	.word 0xc9ba99bf  ! 978: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa020  ! 979: STD_I	std	%r4, [%r10 + 0x0020]
	.word 0xd25aa050  ! 980: LDX_I	ldx	[%r10 + 0x0050], %r9
TH_LABEL980:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc4c2a000  ! 981: LDSWA_I	ldswa	[%r10, + 0x0000] %asi, %r2
	.word 0xcff2d11f  ! 982: CASXA_I	casxa	[%r11] 0x88, %r31, %r7
	.word 0xcfbad93f  ! 983: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d01f  ! 984: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xc522801f  ! 985: STF_R	st	%f2, [%r31, %r10]
TH_LABEL985:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7f2e01f  ! 986: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad93f  ! 987: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcc1aa010  ! 988: LDD_I	ldd	[%r10 + 0x0010], %r6
	.word 0xc7f2e01f  ! 989: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad81f  ! 990: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7f2d03f  ! 991: CASXA_I	casxa	[%r11] 0x81, %r31, %r3
	.word 0xcbbaa030  ! 992: STDFA_I	stda	%f5, [0x0030, %r10]
	.word 0xd19aa048  ! 993: LDDFA_I	ldda	[%r10, 0x0048], %f8
	.word 0xce12a056  ! 994: LDUH_I	lduh	[%r10 + 0x0056], %r7
	.word 0xc922801f  ! 995: STF_R	st	%f4, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1ba987f  ! 996: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xce8a911f  ! 997: LDUBA_R	lduba	[%r10, %r31] 0x88, %r7
	.word 0xd04a801f  ! 998: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xd3ba997f  ! 999: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2901f  ! 1000: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	subcc %r30, 1, %r30
	bnz  TH2_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	add	%g0,	0x1,	%r30
TH1_LOOP_START:
	.word 0xd1f2a01f  ! 1: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba981f  ! 2: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc84aa012  ! 3: LDSB_I	ldsb	[%r10 + 0x0012], %r4
	.word 0xc502c01f  ! 4: LDF_R	ld	[%r11, %r31], %f2
	.word 0xd25a801f  ! 5: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5e2913f  ! 6: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5ba99bf  ! 7: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcd02a03c  ! 8: LDF_I	ld	[%r10, 0x003c], %f6
	.word 0xcfe2e01f  ! 9: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xd1baa020  ! 10: STDFA_I	stda	%f8, [0x0020, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcd9aa050  ! 11: LDDFA_I	ldda	[%r10, 0x0050], %f6
	.word 0xc7bad81f  ! 12: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 13: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7e2e01f  ! 14: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc8ca901f  ! 15: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc402a038  ! 16: LDUW_I	lduw	[%r10 + 0x0038], %r2
	.word 0xc5e2901f  ! 17: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5e2903f  ! 18: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba997f  ! 19: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba983f  ! 20: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5f2913f  ! 21: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xc5f2a01f  ! 22: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2a01f  ! 23: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcc1ac01f  ! 24: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xc03a801f  ! 25: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3ba98bf  ! 26: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 27: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xd002a014  ! 28: LDUW_I	lduw	[%r10 + 0x0014], %r8
	.word 0xc892911f  ! 29: LDUHA_R	lduha	[%r10, %r31] 0x88, %r4
	.word 0xd1f2e01f  ! 30: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1bad95f  ! 31: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd102a06c  ! 32: LDF_I	ld	[%r10, 0x006c], %f8
	.word 0xc3e2901f  ! 33: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3e2a01f  ! 34: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc7baa010  ! 35: STDFA_I	stda	%f3, [0x0010, %r10]
TH_LABEL35:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc43ac01f  ! 36: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 37: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad8bf  ! 38: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcf02c01f  ! 39: LDF_R	ld	[%r11, %r31], %f7
	.word 0xc8c2903f  ! 40: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc84ae022  ! 41: LDSB_I	ldsb	[%r11 + 0x0022], %r4
	.word 0xd1ba989f  ! 42: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc722c01f  ! 43: STF_R	st	%f3, [%r31, %r11]
	.word 0xc3ba981f  ! 44: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd102801f  ! 45: LDF_R	ld	[%r10, %r31], %f8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1bad95f  ! 46: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd28ae04e  ! 47: LDUBA_I	lduba	[%r11, + 0x004e] %asi, %r9
	.word 0xc4d2d17f  ! 48: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r2
	.word 0xc3e2913f  ! 49: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc692a07a  ! 50: LDUHA_I	lduha	[%r10, + 0x007a] %asi, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba981f  ! 51: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 52: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd28ae05f  ! 53: LDUBA_I	lduba	[%r11, + 0x005f] %asi, %r9
	.word 0xd3ba981f  ! 54: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 55: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc49aa028  ! 56: LDDA_I	ldda	[%r10, + 0x0028] %asi, %r2
	.word 0xd302801f  ! 57: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc5e2e01f  ! 58: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xcc8ae05b  ! 59: LDUBA_I	lduba	[%r11, + 0x005b] %asi, %r6
	.word 0xc7e2a01f  ! 60: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7e2903f  ! 61: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xcb02c01f  ! 62: LDF_R	ld	[%r11, %r31], %f5
	.word 0xc7f2e01f  ! 63: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7f2e01f  ! 64: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad95f  ! 65: STDFA_R	stda	%f3, [%r31, %r11]
TH_LABEL65:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7e2e01f  ! 66: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xce82911f  ! 67: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r7
	.word 0xc3ba981f  ! 68: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 69: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 70: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3f2a01f  ! 71: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xcccaa06a  ! 72: LDSBA_I	ldsba	[%r10, + 0x006a] %asi, %r6
	.word 0xc3e2911f  ! 73: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xc3ba993f  ! 74: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc8c2d11f  ! 75: LDSWA_R	ldswa	[%r11, %r31] 0x88, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3bad81f  ! 76: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d11f  ! 77: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xc3e2e01f  ! 78: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad81f  ! 79: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ae040  ! 80: STD_I	std	%r0, [%r11 + 0x0040]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc03ac01f  ! 81: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc81ae078  ! 82: LDD_I	ldd	[%r11 + 0x0078], %r4
	.word 0xd0d2d15f  ! 83: LDSHA_R	ldsha	[%r11, %r31] 0x8a, %r8
	.word 0xc3f2911f  ! 84: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc3e2a01f  ! 85: CASA_R	casa	[%r10] %asi, %r31, %r1
TH_LABEL85:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcd9aa038  ! 86: LDDFA_I	ldda	[%r10, 0x0038], %f6
	.word 0xd252c01f  ! 87: LDSH_R	ldsh	[%r11 + %r31], %r9
	.word 0xc5f2d03f  ! 88: CASXA_I	casxa	[%r11] 0x81, %r31, %r2
	.word 0xc5e2e01f  ! 89: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5e2d01f  ! 90: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd042801f  ! 91: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xc7bad91f  ! 92: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc522c01f  ! 93: STF_R	st	%f2, [%r31, %r11]
	.word 0xcc3aa000  ! 94: STD_I	std	%r6, [%r10 + 0x0000]
	.word 0xcc5a801f  ! 95: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5bad85f  ! 96: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd012801f  ! 97: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xc902801f  ! 98: LDF_R	ld	[%r10, %r31], %f4
	.word 0xd3ba99bf  ! 99: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 100: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd03a801f  ! 101: STD_R	std	%r8, [%r10 + %r31]
	.word 0xcc52c01f  ! 102: LDSH_R	ldsh	[%r11 + %r31], %r6
	.word 0xcbe2e01f  ! 103: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad95f  ! 104: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad87f  ! 105: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbbad97f  ! 106: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d11f  ! 107: CASA_I	casa	[%r11] 0x88, %r31, %r5
	.word 0xc83ae000  ! 108: STD_I	std	%r4, [%r11 + 0x0000]
	.word 0xc702801f  ! 109: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc9f2903f  ! 110: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
TH_LABEL110:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9e2a01f  ! 111: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2a01f  ! 112: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2a01f  ! 113: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2913f  ! 114: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc83aa000  ! 115: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9e2a01f  ! 116: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba989f  ! 117: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba98bf  ! 118: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2903f  ! 119: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc9ba983f  ! 120: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcec2d01f  ! 121: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r7
	.word 0xc9f2e01f  ! 122: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 123: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad97f  ! 124: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcf22801f  ! 125: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3f2911f  ! 126: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd3ba98bf  ! 127: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 128: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba999f  ! 129: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 130: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3ba995f  ! 131: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc88a911f  ! 133: LDUBA_R	lduba	[%r10, %r31] 0x88, %r4
	.word 0xd3ba981f  ! 134: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 135: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc2dae060  ! 136: LDXA_I	ldxa	[%r11, + 0x0060] %asi, %r1
	.word 0xc85a801f  ! 137: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xc9ba985f  ! 138: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc4c2913f  ! 139: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r2
	.word 0xc7bad93f  ! 140: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7bad95f  ! 141: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad85f  ! 142: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 143: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc202a03c  ! 144: LDUW_I	lduw	[%r10 + 0x003c], %r1
	.word 0xd1f2d01f  ! 145: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1f2e01f  ! 146: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1e2d03f  ! 147: CASA_I	casa	[%r11] 0x81, %r31, %r8
	.word 0xcf9aa010  ! 148: LDDFA_I	ldda	[%r10, 0x0010], %f7
	.word 0xc5f2d01f  ! 149: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc5bad89f  ! 150: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xca8ae056  ! 151: LDUBA_I	lduba	[%r11, + 0x0056] %asi, %r5
	.word 0xcdbad93f  ! 152: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad91f  ! 153: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc89aa060  ! 154: LDDA_I	ldda	[%r10, + 0x0060] %asi, %r4
	.word 0xd0ca911f  ! 155: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc4caa04e  ! 156: LDSBA_I	ldsba	[%r10, + 0x004e] %asi, %r2
	.word 0xd3e2901f  ! 157: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xc892911f  ! 158: LDUHA_R	lduha	[%r10, %r31] 0x88, %r4
	.word 0xd28aa05b  ! 159: LDUBA_I	lduba	[%r10, + 0x005b] %asi, %r9
	.word 0xca8ad07f  ! 160: LDUBA_R	lduba	[%r11, %r31] 0x83, %r5
TH_LABEL160:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba991f  ! 161: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc44aa01d  ! 162: LDSB_I	ldsb	[%r10 + 0x001d], %r2
	.word 0xd3ba993f  ! 163: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd042c01f  ! 164: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xcde2d11f  ! 165: CASA_I	casa	[%r11] 0x88, %r31, %r6
TH_LABEL165:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc79aa020  ! 166: LDDFA_I	ldda	[%r10, 0x0020], %f3
	.word 0xc83aa070  ! 167: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xcbba999f  ! 168: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc8c2d01f  ! 169: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r4
	.word 0xca92903f  ! 170: LDUHA_R	lduha	[%r10, %r31] 0x81, %r5
TH_LABEL170:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7e2d01f  ! 171: CASA_I	casa	[%r11] 0x80, %r31, %r3
	.word 0xc7bad81f  ! 172: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae070  ! 173: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xc43ae070  ! 174: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xc59ae030  ! 175: LDDFA_I	ldda	[%r11, 0x0030], %f2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1ba991f  ! 176: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc252a008  ! 177: LDSH_I	ldsh	[%r10 + 0x0008], %r1
	.word 0xcc02a048  ! 178: LDUW_I	lduw	[%r10 + 0x0048], %r6
	.word 0xcd9aa078  ! 179: LDDFA_I	ldda	[%r10, 0x0078], %f6
	.word 0xcdf2e01f  ! 180: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc842a07c  ! 181: LDSW_I	ldsw	[%r10 + 0x007c], %r4
	.word 0xcd22801f  ! 182: STF_R	st	%f6, [%r31, %r10]
	.word 0xce42a030  ! 183: LDSW_I	ldsw	[%r10 + 0x0030], %r7
	.word 0xd3ba999f  ! 184: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 185: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3e2911f  ! 186: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xd3ba989f  ! 187: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc45aa018  ! 188: LDX_I	ldx	[%r10 + 0x0018], %r2
	.word 0xc5e2901f  ! 189: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xcd9aa068  ! 190: LDDFA_I	ldda	[%r10, 0x0068], %f6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdf2901f  ! 191: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba985f  ! 192: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 193: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xce8a901f  ! 194: LDUBA_R	lduba	[%r10, %r31] 0x80, %r7
	.word 0xcbe2a01f  ! 195: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbba983f  ! 196: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc81aa028  ! 197: LDD_I	ldd	[%r10 + 0x0028], %r4
	.word 0xd39ae078  ! 198: LDDFA_I	ldda	[%r11, 0x0078], %f9
	.word 0xc892d15f  ! 199: LDUHA_R	lduha	[%r11, %r31] 0x8a, %r4
	.word 0xc482e014  ! 200: LDUWA_I	lduwa	[%r11, + 0x0014] %asi, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5ba999f  ! 201: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc252801f  ! 202: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xd3e2d01f  ! 203: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd3f2e01f  ! 204: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad87f  ! 205: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc282d05f  ! 206: LDUWA_R	lduwa	[%r11, %r31] 0x82, %r1
	.word 0xcfe2d01f  ! 207: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcc3ac01f  ! 208: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcfe2d11f  ! 209: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xcc3ac01f  ! 210: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfbad91f  ! 211: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xca12c01f  ! 212: LDUH_R	lduh	[%r11 + %r31], %r5
	.word 0xc7ba981f  ! 213: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc80ac01f  ! 214: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xd3bad85f  ! 215: STDFA_R	stda	%f9, [%r31, %r11]
TH_LABEL215:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3bad93f  ! 216: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2d01f  ! 217: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd3bad95f  ! 218: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae018  ! 219: STD_I	std	%r8, [%r11 + 0x0018]
	.word 0xd102c01f  ! 220: LDF_R	ld	[%r11, %r31], %f8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc84aa000  ! 221: LDSB_I	ldsb	[%r10 + 0x0000], %r4
	.word 0xc3e2a01f  ! 222: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xcc0a801f  ! 223: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xcc0ac01f  ! 224: LDUB_R	ldub	[%r11 + %r31], %r6
	.word 0xc5e2a01f  ! 225: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5ba981f  ! 226: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 227: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa048  ! 228: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc43a801f  ! 229: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba993f  ! 230: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5f2a01f  ! 231: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2901f  ! 232: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5e2a01f  ! 233: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcb02801f  ! 234: LDF_R	ld	[%r10, %r31], %f5
	.word 0xd3ba985f  ! 235: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL235:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3ba981f  ! 236: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 237: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3f2a01f  ! 238: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xcb02a040  ! 239: LDF_I	ld	[%r10, 0x0040], %f5
	.word 0xce92d07f  ! 240: LDUHA_R	lduha	[%r11, %r31] 0x83, %r7
TH_LABEL240:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd03a801f  ! 241: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba993f  ! 242: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcf22c01f  ! 243: STF_R	st	%f7, [%r31, %r11]
	.word 0xc9f2a01f  ! 244: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xcd22801f  ! 245: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03aa060  ! 246: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd03a801f  ! 247: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd092913f  ! 248: LDUHA_R	lduha	[%r10, %r31] 0x89, %r8
	.word 0xc44a801f  ! 249: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xcf9aa030  ! 250: LDDFA_I	ldda	[%r10, 0x0030], %f7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc8c2e04c  ! 251: LDSWA_I	ldswa	[%r11, + 0x004c] %asi, %r4
	.word 0xc5e2a01f  ! 252: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5f2903f  ! 253: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xc5e2a01f  ! 254: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 255: CASA_R	casa	[%r10] %asi, %r31, %r2
TH_LABEL255:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc09aa010  ! 256: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r0
	.word 0xc9ba993f  ! 257: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc09aa078  ! 258: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r0
	.word 0xcbba997f  ! 259: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc922c01f  ! 260: STF_R	st	%f4, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdbad99f  ! 261: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd2c2a07c  ! 262: LDSWA_I	ldswa	[%r10, + 0x007c] %asi, %r9
	.word 0xc9ba991f  ! 263: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 264: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 265: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9f2a01f  ! 266: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2913f  ! 267: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xcc1aa028  ! 268: LDD_I	ldd	[%r10 + 0x0028], %r6
	.word 0xd1ba983f  ! 269: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 270: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc902801f  ! 271: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc7ba99bf  ! 272: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 273: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 274: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7f2901f  ! 275: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
TH_LABEL275:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7ba98bf  ! 276: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcc5aa010  ! 277: LDX_I	ldx	[%r10 + 0x0010], %r6
	.word 0xd39aa058  ! 278: LDDFA_I	ldda	[%r10, 0x0058], %f9
	.word 0xc452c01f  ! 279: LDSH_R	ldsh	[%r11 + %r31], %r2
	.word 0xc85ac01f  ! 280: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3f2e01f  ! 281: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xcad2901f  ! 282: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r5
	.word 0xc6c2905f  ! 283: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r3
	.word 0xcbe2913f  ! 284: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xd09aa070  ! 285: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7bad85f  ! 286: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae038  ! 287: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xce92e068  ! 288: LDUHA_I	lduha	[%r11, + 0x0068] %asi, %r7
	.word 0xc5f2e01f  ! 289: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2d11f  ! 290: CASA_I	casa	[%r11] 0x88, %r31, %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5bad99f  ! 291: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad97f  ! 292: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd302801f  ! 293: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc722801f  ! 294: STF_R	st	%f3, [%r31, %r10]
	.word 0xc302a058  ! 295: LDF_I	ld	[%r10, 0x0058], %f1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7baa048  ! 296: STDFA_I	stda	%f3, [0x0048, %r10]
	.word 0xce02a004  ! 297: LDUW_I	lduw	[%r10 + 0x0004], %r7
	.word 0xc3ba99bf  ! 298: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2911f  ! 299: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc88aa07c  ! 300: LDUBA_I	lduba	[%r10, + 0x007c] %asi, %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xce02a014  ! 301: LDUW_I	lduw	[%r10 + 0x0014], %r7
	.word 0xd03a801f  ! 302: STD_R	std	%r8, [%r10 + %r31]
	.word 0xca52c01f  ! 303: LDSH_R	ldsh	[%r11 + %r31], %r5
	.word 0xc5ba981f  ! 304: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc892907f  ! 305: LDUHA_R	lduha	[%r10, %r31] 0x83, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdf2a01f  ! 306: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2a01f  ! 307: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xca5aa028  ! 308: LDX_I	ldx	[%r10 + 0x0028], %r5
	.word 0xd2daa018  ! 309: LDXA_I	ldxa	[%r10, + 0x0018] %asi, %r9
	.word 0xc48aa00a  ! 310: LDUBA_I	lduba	[%r10, + 0x000a] %asi, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd302a064  ! 311: LDF_I	ld	[%r10, 0x0064], %f9
	.word 0xcfba991f  ! 312: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba993f  ! 313: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa038  ! 314: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xd052c01f  ! 315: LDSH_R	ldsh	[%r11 + %r31], %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc402801f  ! 316: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xd20ac01f  ! 317: LDUB_R	ldub	[%r11 + %r31], %r9
	.word 0xc49aa058  ! 318: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r2
	.word 0xc83ac01f  ! 319: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad8bf  ! 320: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd0da915f  ! 321: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r8
	.word 0xc522c01f  ! 322: STF_R	st	%f2, [%r31, %r11]
	.word 0xc6daa070  ! 323: LDXA_I	ldxa	[%r10, + 0x0070] %asi, %r3
	.word 0xd1ba981f  ! 324: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd102801f  ! 325: LDF_R	ld	[%r10, %r31], %f8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc3a801f  ! 326: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc292913f  ! 327: LDUHA_R	lduha	[%r10, %r31] 0x89, %r1
	.word 0xcdf2901f  ! 328: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdf2911f  ! 329: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xc6dad05f  ! 330: LDXA_R	ldxa	[%r11, %r31] 0x82, %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3bad97f  ! 331: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad89f  ! 332: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad99f  ! 333: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xce42801f  ! 334: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xc7ba999f  ! 335: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL335:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc02a058  ! 336: LDUW_I	lduw	[%r10 + 0x0058], %r6
	.word 0xc322801f  ! 337: STF_R	st	%f1, [%r31, %r10]
	.word 0xcfbaa000  ! 338: STDFA_I	stda	%f7, [0x0000, %r10]
	.word 0xcfbad8bf  ! 339: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc652c01f  ! 340: LDSH_R	ldsh	[%r11 + %r31], %r3
TH_LABEL340:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc48ae01d  ! 341: LDUBA_I	lduba	[%r11, + 0x001d] %asi, %r2
	.word 0xd1bad9bf  ! 342: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d01f  ! 343: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xd1bad95f  ! 344: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xce8aa025  ! 345: LDUBA_I	lduba	[%r10, + 0x0025] %asi, %r7
TH_LABEL345:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc8d2a036  ! 346: LDSHA_I	ldsha	[%r10, + 0x0036] %asi, %r4
	.word 0xc6c2d07f  ! 347: LDSWA_R	ldswa	[%r11, %r31] 0x83, %r3
	.word 0xcfbad85f  ! 348: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc99aa000  ! 349: LDDFA_I	ldda	[%r10, 0x0000], %f4
	.word 0xc8d2a07a  ! 350: LDSHA_I	ldsha	[%r10, + 0x007a] %asi, %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc302a054  ! 351: LDF_I	ld	[%r10, 0x0054], %f1
	.word 0xd052a038  ! 352: LDSH_I	ldsh	[%r10 + 0x0038], %r8
	.word 0xc9f2e01f  ! 353: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xd39ae008  ! 354: LDDFA_I	ldda	[%r11, 0x0008], %f9
	.word 0xcdba983f  ! 355: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdba985f  ! 356: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc88a901f  ! 357: LDUBA_R	lduba	[%r10, %r31] 0x80, %r4
	.word 0xd3bad9bf  ! 358: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad83f  ! 359: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 360: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3bad81f  ! 361: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3baa038  ! 362: STDFA_I	stda	%f9, [0x0038, %r10]
	.word 0xcff2901f  ! 363: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcfe2a01f  ! 364: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xce8a901f  ! 365: LDUBA_R	lduba	[%r10, %r31] 0x80, %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfba981f  ! 366: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba991f  ! 367: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 368: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcff2911f  ! 369: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcfba981f  ! 370: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcff2901f  ! 371: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcfba98bf  ! 372: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcedaa058  ! 373: LDXA_I	ldxa	[%r10, + 0x0058] %asi, %r7
	.word 0xc3f2d03f  ! 374: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xc6d2901f  ! 375: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcd9ae050  ! 376: LDDFA_I	ldda	[%r11, 0x0050], %f6
	.word 0xcc3ae048  ! 377: STD_I	std	%r6, [%r11 + 0x0048]
	.word 0xcc3ae048  ! 378: STD_I	std	%r6, [%r11 + 0x0048]
	.word 0xce4aa00d  ! 379: LDSB_I	ldsb	[%r10 + 0x000d], %r7
	.word 0xc322c01f  ! 380: STF_R	st	%f1, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1ba993f  ! 381: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd302801f  ! 382: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd1ba997f  ! 383: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba997f  ! 384: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 385: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1ba981f  ! 386: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 387: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd19aa070  ! 388: LDDFA_I	ldda	[%r10, 0x0070], %f8
	.word 0xd25a801f  ! 389: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xcc92913f  ! 390: LDUHA_R	lduha	[%r10, %r31] 0x89, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc702a074  ! 391: LDF_I	ld	[%r10, 0x0074], %f3
	.word 0xcc42a050  ! 392: LDSW_I	ldsw	[%r10 + 0x0050], %r6
	.word 0xc83ae040  ! 393: STD_I	std	%r4, [%r11 + 0x0040]
	.word 0xc9bad97f  ! 394: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc502801f  ! 395: LDF_R	ld	[%r10, %r31], %f2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc83a801f  ! 396: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc79aa040  ! 397: LDDFA_I	ldda	[%r10, 0x0040], %f3
	.word 0xcfba981f  ! 398: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 399: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xc64aa017  ! 400: LDSB_I	ldsb	[%r10 + 0x0017], %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xce8a917f  ! 401: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r7
	.word 0xc3ba995f  ! 402: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcb02a044  ! 403: LDF_I	ld	[%r10, 0x0044], %f5
	.word 0xc5baa040  ! 404: STDFA_I	stda	%f2, [0x0040, %r10]
	.word 0xc83a801f  ! 405: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9ba99bf  ! 406: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba98bf  ! 407: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc702801f  ! 408: LDF_R	ld	[%r10, %r31], %f3
	.word 0xd1ba99bf  ! 409: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 410: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1f2913f  ! 411: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xca8aa017  ! 412: LDUBA_I	lduba	[%r10, + 0x0017] %asi, %r5
	.word 0xc5f2d13f  ! 413: CASXA_I	casxa	[%r11] 0x89, %r31, %r2
	.word 0xc44a801f  ! 414: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xd3ba999f  ! 415: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd03aa060  ! 416: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd3ba995f  ! 417: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 418: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd03aa060  ! 419: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xcc42a02c  ! 420: LDSW_I	ldsw	[%r10 + 0x002c], %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1bad81f  ! 421: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad89f  ! 422: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad95f  ! 423: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d01f  ! 424: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xc6c2d05f  ! 425: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc402a01c  ! 426: LDUW_I	lduw	[%r10 + 0x001c], %r2
	.word 0xd202801f  ! 427: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xc68a913f  ! 428: LDUBA_R	lduba	[%r10, %r31] 0x89, %r3
	.word 0xc5ba991f  ! 429: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2911f  ! 430: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5ba981f  ! 431: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc322c01f  ! 432: STF_R	st	%f1, [%r31, %r11]
	.word 0xcd22801f  ! 433: STF_R	st	%f6, [%r31, %r10]
	.word 0xcdbae000  ! 434: STDFA_I	stda	%f6, [0x0000, %r11]
	.word 0xcdba987f  ! 435: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc3aa038  ! 436: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xd39aa018  ! 437: LDDFA_I	ldda	[%r10, 0x0018], %f9
	.word 0xcecae040  ! 438: LDSBA_I	ldsba	[%r11, + 0x0040] %asi, %r7
	.word 0xc5e2e01f  ! 439: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad81f  ! 440: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5f2d01f  ! 441: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc702a020  ! 442: LDF_I	ld	[%r10, 0x0020], %f3
	.word 0xc9ba985f  ! 443: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xce8ae050  ! 444: LDUBA_I	lduba	[%r11, + 0x0050] %asi, %r7
	.word 0xc3bad89f  ! 445: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3e2d01f  ! 446: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xd302801f  ! 447: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd3f2a01f  ! 448: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc41a801f  ! 449: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc03aa008  ! 450: STD_I	std	%r0, [%r10 + 0x0008]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3f2911f  ! 451: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc7baa078  ! 452: STDFA_I	stda	%f3, [0x0078, %r10]
	.word 0xc902a030  ! 453: LDF_I	ld	[%r10, 0x0030], %f4
	.word 0xc7ba99bf  ! 454: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba99bf  ! 455: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7e2901f  ! 456: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7f2913f  ! 457: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba993f  ! 458: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc40a801f  ! 459: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xd1ba997f  ! 460: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1ba983f  ! 461: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 462: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2901f  ! 463: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1f2901f  ! 464: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1f2913f  ! 465: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1f2a01f  ! 466: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd2da907f  ! 467: LDXA_R	ldxa	[%r10, %r31] 0x83, %r9
	.word 0xc5ba985f  ! 468: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 469: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 470: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL470:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd19aa060  ! 471: LDDFA_I	ldda	[%r10, 0x0060], %f8
	.word 0xd1e2913f  ! 472: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xcf9aa040  ! 473: LDDFA_I	ldda	[%r10, 0x0040], %f7
	.word 0xd1bad9bf  ! 474: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2e01f  ! 475: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc902e058  ! 476: LDF_I	ld	[%r11, 0x0058], %f4
	.word 0xd1ba997f  ! 477: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 478: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 479: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd082913f  ! 480: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9f2a01f  ! 481: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xd322c01f  ! 482: STF_R	st	%f9, [%r31, %r11]
	.word 0xc84ac01f  ! 483: LDSB_R	ldsb	[%r11 + %r31], %r4
	.word 0xd0d2e004  ! 484: LDSHA_I	ldsha	[%r11, + 0x0004] %asi, %r8
	.word 0xcb02c01f  ! 485: LDF_R	ld	[%r11, %r31], %f5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc502a004  ! 486: LDF_I	ld	[%r10, 0x0004], %f2
	.word 0xc9ba995f  ! 487: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba995f  ! 488: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcd02a010  ! 489: LDF_I	ld	[%r10, 0x0010], %f6
	.word 0xcc3a801f  ! 490: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc682d11f  ! 491: LDUWA_R	lduwa	[%r11, %r31] 0x88, %r3
	.word 0xcdba99bf  ! 492: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 493: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba999f  ! 494: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 495: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdbaa018  ! 496: STDFA_I	stda	%f6, [0x0018, %r10]
	.word 0xc412801f  ! 497: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xd3ba991f  ! 498: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 499: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2a01f  ! 500: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc85aa050  ! 501: LDX_I	ldx	[%r10 + 0x0050], %r4
	.word 0xcc92907f  ! 502: LDUHA_R	lduha	[%r10, %r31] 0x83, %r6
	.word 0xcbf2913f  ! 503: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xcbf2a01f  ! 504: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba997f  ! 505: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbf2a01f  ! 506: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2911f  ! 507: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xcbba981f  ! 508: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc59ae038  ! 509: LDDFA_I	ldda	[%r11, 0x0038], %f2
	.word 0xcc9aa050  ! 510: LDDA_I	ldda	[%r10, + 0x0050] %asi, %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xca52801f  ! 511: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xc43a801f  ! 512: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba991f  ! 513: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd302801f  ! 514: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd2d2a00c  ! 515: LDSHA_I	ldsha	[%r10, + 0x000c] %asi, %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbba999f  ! 516: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba993f  ! 517: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 518: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc2ca917f  ! 519: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r1
	.word 0xc8d2905f  ! 520: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc322801f  ! 521: STF_R	st	%f1, [%r31, %r10]
	.word 0xce02801f  ! 522: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xc5baa028  ! 523: STDFA_I	stda	%f2, [0x0028, %r10]
	.word 0xc3ba993f  ! 524: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa028  ! 525: STD_I	std	%r0, [%r10 + 0x0028]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xca42c01f  ! 526: LDSW_R	ldsw	[%r11 + %r31], %r5
	.word 0xca12a01a  ! 527: LDUH_I	lduh	[%r10 + 0x001a], %r5
	.word 0xc9f2a01f  ! 528: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xd082a00c  ! 529: LDUWA_I	lduwa	[%r10, + 0x000c] %asi, %r8
	.word 0xd3bae038  ! 530: STDFA_I	stda	%f9, [0x0038, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc702c01f  ! 531: LDF_R	ld	[%r11, %r31], %f3
	.word 0xcdbad81f  ! 532: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd0daa068  ! 533: LDXA_I	ldxa	[%r10, + 0x0068] %asi, %r8
	.word 0xc9ba997f  ! 534: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 535: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd252c01f  ! 536: LDSH_R	ldsh	[%r11 + %r31], %r9
	.word 0xcc3aa070  ! 537: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcfba981f  ! 538: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 539: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xce5a801f  ! 540: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9e2901f  ! 541: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc8d2d17f  ! 542: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r4
	.word 0xcb02e024  ! 543: LDF_I	ld	[%r11, 0x0024], %f5
	.word 0xcbba989f  ! 544: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcc52c01f  ! 545: LDSH_R	ldsh	[%r11 + %r31], %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc3a801f  ! 546: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2a01f  ! 547: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba997f  ! 548: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 549: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2911f  ! 550: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfe2a01f  ! 551: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba985f  ! 552: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc452801f  ! 553: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xc84a801f  ! 554: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xc442a078  ! 555: LDSW_I	ldsw	[%r10 + 0x0078], %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc6daa030  ! 556: LDXA_I	ldxa	[%r10, + 0x0030] %asi, %r3
	.word 0xccd2a02c  ! 557: LDSHA_I	ldsha	[%r10, + 0x002c] %asi, %r6
	.word 0xca4aa072  ! 558: LDSB_I	ldsb	[%r10 + 0x0072], %r5
	.word 0xd2ca917f  ! 559: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r9
	.word 0xc5f2a01f  ! 560: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc8da901f  ! 561: LDXA_R	ldxa	[%r10, %r31] 0x80, %r4
	.word 0xc41aa038  ! 562: LDD_I	ldd	[%r10 + 0x0038], %r2
	.word 0xd3ba985f  ! 563: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2913f  ! 564: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xcf22c01f  ! 565: STF_R	st	%f7, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd03ac01f  ! 566: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2e01f  ! 567: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad87f  ! 568: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad97f  ! 569: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d01f  ! 570: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
TH_LABEL570:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc322801f  ! 571: STF_R	st	%f1, [%r31, %r10]
	.word 0xcbbad95f  ! 572: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcccae05f  ! 573: LDSBA_I	ldsba	[%r11, + 0x005f] %asi, %r6
	.word 0xcde2a01f  ! 574: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2911f  ! 575: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc252c01f  ! 576: LDSH_R	ldsh	[%r11 + %r31], %r1
	.word 0xd102801f  ! 577: LDF_R	ld	[%r10, %r31], %f8
	.word 0xd1f2a01f  ! 578: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xcd9aa050  ! 579: LDDFA_I	ldda	[%r10, 0x0050], %f6
	.word 0xc5e2e01f  ! 580: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc43ae030  ! 581: STD_I	std	%r2, [%r11 + 0x0030]
	.word 0xc5bad89f  ! 582: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2d01f  ! 583: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xc80a801f  ! 584: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xc722801f  ! 585: STF_R	st	%f3, [%r31, %r10]
TH_LABEL585:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3f2903f  ! 586: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc03aa030  ! 587: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba99bf  ! 588: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc2cad13f  ! 589: LDSBA_R	ldsba	[%r11, %r31] 0x89, %r1
	.word 0xce52a074  ! 590: LDSH_I	ldsh	[%r10 + 0x0074], %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbba981f  ! 591: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 592: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xc2c2901f  ! 593: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r1
	.word 0xcfba997f  ! 594: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba989f  ! 595: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc242a040  ! 596: LDSW_I	ldsw	[%r10 + 0x0040], %r1
	.word 0xc212e06a  ! 597: LDUH_I	lduh	[%r11 + 0x006a], %r1
	.word 0xd1e2d01f  ! 598: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xd1e2e01f  ! 599: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1f2e01f  ! 600: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd03ae070  ! 601: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xd19ae010  ! 602: LDDFA_I	ldda	[%r11, 0x0010], %f8
	.word 0xcc12e02e  ! 603: LDUH_I	lduh	[%r11 + 0x002e], %r6
	.word 0xcc12801f  ! 604: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xd3ba981f  ! 605: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3ba98bf  ! 606: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 607: STD_R	std	%r8, [%r10 + %r31]
	.word 0xca12801f  ! 608: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xcecae000  ! 609: LDSBA_I	ldsba	[%r11, + 0x0000] %asi, %r7
	.word 0xc402801f  ! 610: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc852c01f  ! 611: LDSH_R	ldsh	[%r11 + %r31], %r4
	.word 0xd3ba99bf  ! 612: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 613: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 614: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3f2a01f  ! 615: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3ba983f  ! 616: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcec2a068  ! 617: LDSWA_I	ldswa	[%r10, + 0x0068] %asi, %r7
	.word 0xc9e2a01f  ! 618: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba981f  ! 619: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 620: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc83a801f  ! 621: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba989f  ! 622: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 623: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9e2a01f  ! 624: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc40a801f  ! 625: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3e2901f  ! 626: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3e2913f  ! 627: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc3ba987f  ! 628: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 629: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc41ac01f  ! 630: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7ba999f  ! 631: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba99bf  ! 632: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 633: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba997f  ! 634: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc292a054  ! 635: LDUHA_I	lduha	[%r10, + 0x0054] %asi, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba987f  ! 636: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba991f  ! 637: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba991f  ! 638: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcc12e036  ! 639: LDUH_I	lduh	[%r11 + 0x0036], %r6
	.word 0xd04a801f  ! 640: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcfba987f  ! 641: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2911f  ! 642: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcfba989f  ! 643: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcf02801f  ! 644: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc5e2903f  ! 645: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1bae040  ! 646: STDFA_I	stda	%f8, [0x0040, %r11]
	.word 0xc7bae028  ! 647: STDFA_I	stda	%f3, [0x0028, %r11]
	.word 0xd3e2a01f  ! 648: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba999f  ! 649: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 650: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3f2913f  ! 651: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd03a801f  ! 652: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba991f  ! 653: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc502e074  ! 654: LDF_I	ld	[%r11, 0x0074], %f2
	.word 0xd0c2d07f  ! 655: LDSWA_R	ldswa	[%r11, %r31] 0x83, %r8
TH_LABEL655:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd2d2a046  ! 656: LDSHA_I	ldsha	[%r10, + 0x0046] %asi, %r9
	.word 0xc43a801f  ! 657: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa048  ! 658: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc7ba997f  ! 659: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc5baa008  ! 660: STDFA_I	stda	%f2, [0x0008, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc4d2915f  ! 661: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r2
	.word 0xc9e2913f  ! 662: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba993f  ! 663: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 664: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xce4ac01f  ! 665: LDSB_R	ldsb	[%r11 + %r31], %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd19ae078  ! 666: LDDFA_I	ldda	[%r11, 0x0078], %f8
	.word 0xca0ae048  ! 667: LDUB_I	ldub	[%r11 + 0x0048], %r5
	.word 0xc3bad83f  ! 668: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc692d03f  ! 669: LDUHA_R	lduha	[%r11, %r31] 0x81, %r3
	.word 0xd20ac01f  ! 670: LDUB_R	ldub	[%r11 + %r31], %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3bad99f  ! 671: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xce5a801f  ! 672: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xd1ba991f  ! 673: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc502c01f  ! 674: LDF_R	ld	[%r11, %r31], %f2
	.word 0xcdf2e01f  ! 675: CASXA_R	casxa	[%r11]%asi, %r31, %r6
TH_LABEL675:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdbad85f  ! 676: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc64ac01f  ! 677: LDSB_R	ldsb	[%r11 + %r31], %r3
	.word 0xc3f2901f  ! 678: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xcecaa000  ! 679: LDSBA_I	ldsba	[%r10, + 0x0000] %asi, %r7
	.word 0xc43a801f  ! 680: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc902c01f  ! 681: LDF_R	ld	[%r11, %r31], %f4
	.word 0xc7bad99f  ! 682: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad95f  ! 683: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcd02a000  ! 684: LDF_I	ld	[%r10, 0x0000], %f6
	.word 0xd102801f  ! 685: LDF_R	ld	[%r10, %r31], %f8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc212801f  ! 686: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xcb22801f  ! 687: STF_R	st	%f5, [%r31, %r10]
	.word 0xcfbad81f  ! 688: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd3baa040  ! 689: STDFA_I	stda	%f9, [0x0040, %r10]
	.word 0xc80ac01f  ! 690: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd03a801f  ! 691: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba991f  ! 692: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 693: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc81aa030  ! 694: LDD_I	ldd	[%r10 + 0x0030], %r4
	.word 0xca02a02c  ! 695: LDUW_I	lduw	[%r10 + 0x002c], %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9bae008  ! 696: STDFA_I	stda	%f4, [0x0008, %r11]
	.word 0xc41a801f  ! 697: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xd3e2e01f  ! 698: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad8bf  ! 699: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 700: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc88aa02e  ! 701: LDUBA_I	lduba	[%r10, + 0x002e] %asi, %r4
	.word 0xc3e2a01f  ! 702: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba983f  ! 703: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc81ac01f  ! 704: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xd202801f  ! 705: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7e2901f  ! 706: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xd09aa030  ! 707: LDDA_I	ldda	[%r10, + 0x0030] %asi, %r8
	.word 0xc7f2a01f  ! 708: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc902e04c  ! 709: LDF_I	ld	[%r11, 0x004c], %f4
	.word 0xced2913f  ! 710: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r7
TH_LABEL710:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3bad99f  ! 711: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 712: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc03ae040  ! 713: STD_I	std	%r0, [%r11 + 0x0040]
	.word 0xc40ac01f  ! 714: LDUB_R	ldub	[%r11 + %r31], %r2
	.word 0xce4aa06a  ! 715: LDSB_I	ldsb	[%r10 + 0x006a], %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd212801f  ! 716: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xc5baa028  ! 717: STDFA_I	stda	%f2, [0x0028, %r10]
	.word 0xc4c2a05c  ! 718: LDSWA_I	ldswa	[%r10, + 0x005c] %asi, %r2
	.word 0xd05aa008  ! 719: LDX_I	ldx	[%r10 + 0x0008], %r8
	.word 0xc5bad93f  ! 720: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcadaa010  ! 721: LDXA_I	ldxa	[%r10, + 0x0010] %asi, %r5
	.word 0xc7bad81f  ! 722: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc522c01f  ! 723: STF_R	st	%f2, [%r31, %r11]
	.word 0xc9e2901f  ! 724: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2911f  ! 725: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
TH_LABEL725:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc4a801f  ! 726: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xc20a801f  ! 727: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xcbba993f  ! 728: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba987f  ! 729: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba997f  ! 730: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL730:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc99ae048  ! 731: LDDFA_I	ldda	[%r11, 0x0048], %f4
	.word 0xd3f2d11f  ! 732: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xd3bad81f  ! 733: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc452c01f  ! 734: LDSH_R	ldsh	[%r11 + %r31], %r2
	.word 0xc9f2d03f  ! 735: CASXA_I	casxa	[%r11] 0x81, %r31, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9bad99f  ! 736: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc6ca905f  ! 737: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r3
	.word 0xc83a801f  ! 738: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba997f  ! 739: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 740: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc2c2907f  ! 741: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r1
	.word 0xd052a034  ! 742: LDSH_I	ldsh	[%r10 + 0x0034], %r8
	.word 0xc452801f  ! 743: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xc7baa018  ! 744: STDFA_I	stda	%f3, [0x0018, %r10]
	.word 0xd3bae070  ! 745: STDFA_I	stda	%f9, [0x0070, %r11]
TH_LABEL745:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcd9aa058  ! 746: LDDFA_I	ldda	[%r10, 0x0058], %f6
	.word 0xcc3aa068  ! 747: STD_I	std	%r6, [%r10 + 0x0068]
	.word 0xcdba981f  ! 748: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc9bae000  ! 749: STDFA_I	stda	%f4, [0x0000, %r11]
	.word 0xc5ba995f  ! 750: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5f2911f  ! 751: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xd20aa017  ! 752: LDUB_I	ldub	[%r10 + 0x0017], %r9
	.word 0xc722801f  ! 753: STF_R	st	%f3, [%r31, %r10]
	.word 0xd2ca905f  ! 754: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r9
	.word 0xd04a801f  ! 755: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd28ae00e  ! 756: LDUBA_I	lduba	[%r11, + 0x000e] %asi, %r9
	.word 0xc702a034  ! 757: LDF_I	ld	[%r10, 0x0034], %f3
	.word 0xc8ca903f  ! 758: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r4
	.word 0xd102801f  ! 759: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc43a801f  ! 760: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7e2911f  ! 761: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xc43aa038  ! 762: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xd0c2d05f  ! 763: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r8
	.word 0xc3bad95f  ! 764: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 765: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd00a801f  ! 766: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xd1bad89f  ! 767: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ac01f  ! 768: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1f2d01f  ! 769: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xc442801f  ! 770: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba983f  ! 771: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc6ca913f  ! 772: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r3
	.word 0xc5ba981f  ! 773: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba997f  ! 774: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 775: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc212e020  ! 776: LDUH_I	lduh	[%r11 + 0x0020], %r1
	.word 0xc6da911f  ! 777: LDXA_R	ldxa	[%r10, %r31] 0x88, %r3
	.word 0xd05ac01f  ! 778: LDX_R	ldx	[%r11 + %r31], %r8
	.word 0xd252a028  ! 779: LDSH_I	ldsh	[%r10 + 0x0028], %r9
	.word 0xd252a02a  ! 780: LDSH_I	ldsh	[%r10 + 0x002a], %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3ba981f  ! 781: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba997f  ! 782: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa060  ! 783: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd3ba999f  ! 784: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa060  ! 785: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc922c01f  ! 786: STF_R	st	%f4, [%r31, %r11]
	.word 0xd01a801f  ! 787: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xce8a911f  ! 788: LDUBA_R	lduba	[%r10, %r31] 0x88, %r7
	.word 0xcfba985f  ! 789: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcf9ae030  ! 790: LDDFA_I	ldda	[%r11, 0x0030], %f7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc09aa008  ! 791: LDDA_I	ldda	[%r10, + 0x0008] %asi, %r0
	.word 0xc7ba983f  ! 792: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa068  ! 793: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xcf9aa020  ! 794: LDDFA_I	ldda	[%r10, 0x0020], %f7
	.word 0xcfba987f  ! 795: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd2d2901f  ! 796: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r9
	.word 0xcc0a801f  ! 797: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xd282901f  ! 798: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r9
	.word 0xcbe2e01f  ! 799: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xd092911f  ! 800: LDUHA_R	lduha	[%r10, %r31] 0x88, %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbf2e01f  ! 801: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad93f  ! 802: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcb02e074  ! 803: LDF_I	ld	[%r11, 0x0074], %f5
	.word 0xce0aa023  ! 804: LDUB_I	ldub	[%r10 + 0x0023], %r7
	.word 0xc7bad97f  ! 805: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xca82e030  ! 806: LDUWA_I	lduwa	[%r11, + 0x0030] %asi, %r5
	.word 0xcfba983f  ! 807: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 808: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba985f  ! 809: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba98bf  ! 810: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc302a010  ! 811: LDF_I	ld	[%r10, 0x0010], %f1
	.word 0xce5a801f  ! 812: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xd092a010  ! 813: LDUHA_I	lduha	[%r10, + 0x0010] %asi, %r8
	.word 0xce8ae003  ! 814: LDUBA_I	lduba	[%r11, + 0x0003] %asi, %r7
	.word 0xd03ae060  ! 815: STD_I	std	%r8, [%r11 + 0x0060]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3bad89f  ! 816: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 817: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xcd02a000  ! 818: LDF_I	ld	[%r10, 0x0000], %f6
	.word 0xc2c2907f  ! 819: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r1
	.word 0xd202a05c  ! 820: LDUW_I	lduw	[%r10 + 0x005c], %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3ba98bf  ! 821: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd19aa060  ! 822: LDDFA_I	ldda	[%r10, 0x0060], %f8
	.word 0xc5bad87f  ! 823: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad91f  ! 824: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad89f  ! 825: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd092a028  ! 826: LDUHA_I	lduha	[%r10, + 0x0028] %asi, %r8
	.word 0xcbbad89f  ! 827: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad95f  ! 828: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc602a03c  ! 829: LDUW_I	lduw	[%r10 + 0x003c], %r3
	.word 0xc9bad8bf  ! 830: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9f2e01f  ! 831: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 832: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9f2d11f  ! 833: CASXA_I	casxa	[%r11] 0x88, %r31, %r4
	.word 0xd0caa030  ! 834: LDSBA_I	ldsba	[%r10, + 0x0030] %asi, %r8
	.word 0xcdbae038  ! 835: STDFA_I	stda	%f6, [0x0038, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7ba997f  ! 836: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcacad15f  ! 837: LDSBA_R	ldsba	[%r11, %r31] 0x8a, %r5
	.word 0xc3e2903f  ! 838: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xcfbaa010  ! 839: STDFA_I	stda	%f7, [0x0010, %r10]
	.word 0xd292a036  ! 840: LDUHA_I	lduha	[%r10, + 0x0036] %asi, %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc83ac01f  ! 841: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9e2d01f  ! 842: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9e2d03f  ! 843: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xc882901f  ! 844: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r4
	.word 0xcb02801f  ! 845: LDF_R	ld	[%r10, %r31], %f5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc43aa038  ! 846: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc43aa038  ! 847: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc7f2a01f  ! 848: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba981f  ! 849: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc79ae070  ! 850: LDDFA_I	ldda	[%r11, 0x0070], %f3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbf2e01f  ! 851: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad89f  ! 852: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd082915f  ! 853: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r8
	.word 0xc79ae000  ! 854: LDDFA_I	ldda	[%r11, 0x0000], %f3
	.word 0xd1e2903f  ! 855: CASA_I	casa	[%r10] 0x81, %r31, %r8
TH_LABEL855:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd03aa018  ! 856: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xc6d2d11f  ! 857: LDSHA_R	ldsha	[%r11, %r31] 0x88, %r3
	.word 0xc9ba983f  ! 858: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc892d05f  ! 859: LDUHA_R	lduha	[%r11, %r31] 0x82, %r4
	.word 0xd0cae02f  ! 860: LDSBA_I	ldsba	[%r11, + 0x002f] %asi, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9bad8bf  ! 861: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d01f  ! 862: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9f2d01f  ! 863: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc83ac01f  ! 864: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9f2d13f  ! 865: CASXA_I	casxa	[%r11] 0x89, %r31, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9e2d11f  ! 866: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xc882d11f  ! 867: LDUWA_R	lduwa	[%r11, %r31] 0x88, %r4
	.word 0xc3e2d13f  ! 868: CASA_I	casa	[%r11] 0x89, %r31, %r1
	.word 0xc502801f  ! 869: LDF_R	ld	[%r10, %r31], %f2
	.word 0xd242c01f  ! 870: LDSW_R	ldsw	[%r11 + %r31], %r9
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5ba993f  ! 871: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc602801f  ! 872: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xc5f2e01f  ! 873: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2e01f  ! 874: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 875: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc43ac01f  ! 876: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc402801f  ! 877: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xc602a050  ! 878: LDUW_I	lduw	[%r10 + 0x0050], %r3
	.word 0xca82a064  ! 879: LDUWA_I	lduwa	[%r10, + 0x0064] %asi, %r5
	.word 0xc5e2a01f  ! 880: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc59ae008  ! 881: LDDFA_I	ldda	[%r11, 0x0008], %f2
	.word 0xd252c01f  ! 882: LDSH_R	ldsh	[%r11 + %r31], %r9
	.word 0xca8ae000  ! 883: LDUBA_I	lduba	[%r11, + 0x0000] %asi, %r5
	.word 0xc5ba989f  ! 884: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 885: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc39aa028  ! 886: LDDFA_I	ldda	[%r10, 0x0028], %f1
	.word 0xd1e2901f  ! 887: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc202c01f  ! 888: LDUW_R	lduw	[%r11 + %r31], %r1
	.word 0xca02801f  ! 889: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xc3f2913f  ! 890: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc322c01f  ! 891: STF_R	st	%f1, [%r31, %r11]
	.word 0xd3e2a01f  ! 892: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd2c2901f  ! 893: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r9
	.word 0xc6da903f  ! 894: LDXA_R	ldxa	[%r10, %r31] 0x81, %r3
	.word 0xd3e2d01f  ! 895: CASA_I	casa	[%r11] 0x80, %r31, %r9
TH_LABEL895:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3f2d11f  ! 896: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xd3e2d11f  ! 897: CASA_I	casa	[%r11] 0x88, %r31, %r9
	.word 0xc292d03f  ! 898: LDUHA_R	lduha	[%r11, %r31] 0x81, %r1
	.word 0xc682d03f  ! 899: LDUWA_R	lduwa	[%r11, %r31] 0x81, %r3
	.word 0xc3f2d01f  ! 900: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3f2e01f  ! 901: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad83f  ! 902: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd01ae070  ! 903: LDD_I	ldd	[%r11 + 0x0070], %r8
	.word 0xcc3a801f  ! 904: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc522c01f  ! 905: STF_R	st	%f2, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc83aa060  ! 906: STD_I	std	%r4, [%r10 + 0x0060]
	.word 0xce4aa07a  ! 907: LDSB_I	ldsb	[%r10 + 0x007a], %r7
	.word 0xc41aa040  ! 908: LDD_I	ldd	[%r10 + 0x0040], %r2
	.word 0xc5f2a01f  ! 909: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc282a00c  ! 910: LDUWA_I	lduwa	[%r10, + 0x000c] %asi, %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc25ac01f  ! 911: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xcfbad91f  ! 912: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xced2901f  ! 913: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r7
	.word 0xced2a014  ! 914: LDSHA_I	ldsha	[%r10, + 0x0014] %asi, %r7
	.word 0xd1f2a01f  ! 915: CASXA_R	casxa	[%r10]%asi, %r31, %r8
TH_LABEL915:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1f2a01f  ! 916: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xcdbaa068  ! 917: STDFA_I	stda	%f6, [0x0068, %r10]
	.word 0xd3ba983f  ! 918: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcd9ae078  ! 919: LDDFA_I	ldda	[%r11, 0x0078], %f6
	.word 0xc44a801f  ! 920: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc302801f  ! 921: LDF_R	ld	[%r10, %r31], %f1
	.word 0xcfba987f  ! 922: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa000  ! 923: STD_I	std	%r6, [%r10 + 0x0000]
	.word 0xc7baa008  ! 924: STDFA_I	stda	%f3, [0x0008, %r10]
	.word 0xc7ba983f  ! 925: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc42801f  ! 926: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xc5f2d13f  ! 927: CASXA_I	casxa	[%r11] 0x89, %r31, %r2
	.word 0xc5f2e01f  ! 928: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2e01f  ! 929: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 930: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5bad9bf  ! 931: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad87f  ! 932: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad93f  ! 933: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcc9aa010  ! 934: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r6
	.word 0xc7ba983f  ! 935: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7ba987f  ! 936: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xce52801f  ! 937: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xd03ac01f  ! 938: STD_R	std	%r8, [%r11 + %r31]
	.word 0xca52a03e  ! 939: LDSH_I	ldsh	[%r10 + 0x003e], %r5
	.word 0xc452c01f  ! 940: LDSH_R	ldsh	[%r11 + %r31], %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3ba991f  ! 941: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xca82a05c  ! 942: LDUWA_I	lduwa	[%r10, + 0x005c] %asi, %r5
	.word 0xd3bae058  ! 943: STDFA_I	stda	%f9, [0x0058, %r11]
	.word 0xc242e010  ! 944: LDSW_I	ldsw	[%r11 + 0x0010], %r1
	.word 0xc9e2901f  ! 945: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9e2a01f  ! 946: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba987f  ! 947: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 948: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc81a801f  ! 949: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xd252e030  ! 950: LDSH_I	ldsh	[%r11 + 0x0030], %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc682e03c  ! 951: LDUWA_I	lduwa	[%r11, + 0x003c] %asi, %r3
	.word 0xce42c01f  ! 952: LDSW_R	ldsw	[%r11 + %r31], %r7
	.word 0xd302801f  ! 953: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd202e064  ! 954: LDUW_I	lduw	[%r11 + 0x0064], %r9
	.word 0xc7ba997f  ! 955: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcf02a058  ! 956: LDF_I	ld	[%r10, 0x0058], %f7
	.word 0xc7bad87f  ! 957: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae070  ! 958: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xc7e2e01f  ! 959: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc99aa030  ! 960: LDDFA_I	ldda	[%r10, 0x0030], %f4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3ba999f  ! 961: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 962: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc7bae070  ! 963: STDFA_I	stda	%f3, [0x0070, %r11]
	.word 0xc7ba989f  ! 964: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 965: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7ba98bf  ! 966: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2913f  ! 967: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba997f  ! 968: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc59aa000  ! 969: LDDFA_I	ldda	[%r10, 0x0000], %f2
	.word 0xcdf2a01f  ! 970: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdf2913f  ! 971: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcdba995f  ! 972: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc652a072  ! 973: LDSH_I	ldsh	[%r10 + 0x0072], %r3
	.word 0xc43aa020  ! 974: STD_I	std	%r2, [%r10 + 0x0020]
	.word 0xc7ba991f  ! 975: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7ba985f  ! 976: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xccdad07f  ! 977: LDXA_R	ldxa	[%r11, %r31] 0x83, %r6
	.word 0xc9ba985f  ! 978: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa020  ! 979: STD_I	std	%r4, [%r10 + 0x0020]
	.word 0xca5ae048  ! 980: LDX_I	ldx	[%r11 + 0x0048], %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd0c2a030  ! 981: LDSWA_I	ldswa	[%r10, + 0x0030] %asi, %r8
	.word 0xcff2d03f  ! 982: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xcfbad91f  ! 983: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d03f  ! 984: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xc322c01f  ! 985: STF_R	st	%f1, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7f2e01f  ! 986: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad85f  ! 987: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcc1ae030  ! 988: LDD_I	ldd	[%r11 + 0x0030], %r6
	.word 0xc7f2e01f  ! 989: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad99f  ! 990: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7f2d13f  ! 991: CASXA_I	casxa	[%r11] 0x89, %r31, %r3
	.word 0xcfbaa028  ! 992: STDFA_I	stda	%f7, [0x0028, %r10]
	.word 0xcd9aa040  ! 993: LDDFA_I	ldda	[%r10, 0x0040], %f6
	.word 0xc812a026  ! 994: LDUH_I	lduh	[%r10 + 0x0026], %r4
	.word 0xcd22c01f  ! 995: STF_R	st	%f6, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1ba99bf  ! 996: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc8a907f  ! 997: LDUBA_R	lduba	[%r10, %r31] 0x83, %r6
	.word 0xca4ac01f  ! 998: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xd3ba983f  ! 999: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2901f  ! 1000: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	subcc %r30, 1, %r30
	bnz  TH1_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	add	%g0,	0x1,	%r30
TH0_LOOP_START:
	.word 0xd1f2a01f  ! 1: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba983f  ! 2: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc4aa019  ! 3: LDSB_I	ldsb	[%r10 + 0x0019], %r6
	.word 0xd102c01f  ! 4: LDF_R	ld	[%r11, %r31], %f8
	.word 0xc45a801f  ! 5: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5e2901f  ! 6: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba991f  ! 7: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcf02e078  ! 8: LDF_I	ld	[%r11, 0x0078], %f7
	.word 0xcfe2e01f  ! 9: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xc3baa078  ! 10: STDFA_I	stda	%f1, [0x0078, %r10]
TH_LABEL10:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc79ae020  ! 11: LDDFA_I	ldda	[%r11, 0x0020], %f3
	.word 0xc7bad81f  ! 12: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 13: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7e2e01f  ! 14: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc2ca905f  ! 15: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc402a058  ! 16: LDUW_I	lduw	[%r10 + 0x0058], %r2
	.word 0xc5e2903f  ! 17: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5e2911f  ! 18: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5ba981f  ! 19: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba983f  ! 20: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5f2901f  ! 21: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2a01f  ! 22: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2a01f  ! 23: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc01a801f  ! 24: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xc03a801f  ! 25: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3ba993f  ! 26: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 27: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xd002a060  ! 28: LDUW_I	lduw	[%r10 + 0x0060], %r8
	.word 0xd092d17f  ! 29: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r8
	.word 0xd1f2e01f  ! 30: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1bad97f  ! 31: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc302a064  ! 32: LDF_I	ld	[%r10, 0x0064], %f1
	.word 0xc3e2913f  ! 33: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc3e2a01f  ! 34: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc5bae020  ! 35: STDFA_I	stda	%f2, [0x0020, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc43ac01f  ! 36: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 37: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad89f  ! 38: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcf02801f  ! 39: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc8c2911f  ! 40: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r4
TH_LABEL40:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd04aa021  ! 41: LDSB_I	ldsb	[%r10 + 0x0021], %r8
	.word 0xd1ba991f  ! 42: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc322801f  ! 43: STF_R	st	%f1, [%r31, %r10]
	.word 0xc3ba99bf  ! 44: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd102c01f  ! 45: LDF_R	ld	[%r11, %r31], %f8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1bad99f  ! 46: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xce8ae06e  ! 47: LDUBA_I	lduba	[%r11, + 0x006e] %asi, %r7
	.word 0xc2d2907f  ! 48: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r1
	.word 0xc3e2901f  ! 49: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xce92a074  ! 50: LDUHA_I	lduha	[%r10, + 0x0074] %asi, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfba991f  ! 51: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba989f  ! 52: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd28aa03c  ! 53: LDUBA_I	lduba	[%r10, + 0x003c] %asi, %r9
	.word 0xd3ba98bf  ! 54: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba983f  ! 55: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc09aa070  ! 56: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r0
	.word 0xc502c01f  ! 57: LDF_R	ld	[%r11, %r31], %f2
	.word 0xc5e2e01f  ! 58: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc68aa02c  ! 59: LDUBA_I	lduba	[%r10, + 0x002c] %asi, %r3
	.word 0xc7e2a01f  ! 60: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7e2901f  ! 61: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc702c01f  ! 62: LDF_R	ld	[%r11, %r31], %f3
	.word 0xc7f2e01f  ! 63: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7f2e01f  ! 64: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad89f  ! 65: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7e2e01f  ! 66: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc282905f  ! 67: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r1
	.word 0xc3ba987f  ! 68: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 69: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 70: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3f2a01f  ! 71: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc2caa046  ! 72: LDSBA_I	ldsba	[%r10, + 0x0046] %asi, %r1
	.word 0xc3e2913f  ! 73: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc3ba981f  ! 74: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc2c2d15f  ! 75: LDSWA_R	ldswa	[%r11, %r31] 0x8a, %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3bad99f  ! 76: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d01f  ! 77: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3e2e01f  ! 78: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3bad83f  ! 79: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ae040  ! 80: STD_I	std	%r0, [%r11 + 0x0040]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc03ac01f  ! 81: STD_R	std	%r0, [%r11 + %r31]
	.word 0xcc1ae060  ! 82: LDD_I	ldd	[%r11 + 0x0060], %r6
	.word 0xc2d2911f  ! 83: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r1
	.word 0xc3f2903f  ! 84: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc3e2a01f  ! 85: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcf9ae000  ! 86: LDDFA_I	ldda	[%r11, 0x0000], %f7
	.word 0xc452c01f  ! 87: LDSH_R	ldsh	[%r11 + %r31], %r2
	.word 0xc5f2d11f  ! 88: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xc5e2e01f  ! 89: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5e2d13f  ! 90: CASA_I	casa	[%r11] 0x89, %r31, %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc642c01f  ! 91: LDSW_R	ldsw	[%r11 + %r31], %r3
	.word 0xc7bad9bf  ! 92: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcd22801f  ! 93: STF_R	st	%f6, [%r31, %r10]
	.word 0xcc3aa000  ! 94: STD_I	std	%r6, [%r10 + 0x0000]
	.word 0xc45ac01f  ! 95: LDX_R	ldx	[%r11 + %r31], %r2
TH_LABEL95:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5bad91f  ! 96: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc612c01f  ! 97: LDUH_R	lduh	[%r11 + %r31], %r3
	.word 0xd302801f  ! 98: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd3ba999f  ! 99: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 100: STD_I	std	%r8, [%r10 + 0x0000]
TH_LABEL100:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03a801f  ! 101: STD_R	std	%r8, [%r10 + %r31]
	.word 0xca52c01f  ! 102: LDSH_R	ldsh	[%r11 + %r31], %r5
	.word 0xcbe2e01f  ! 103: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad81f  ! 104: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad93f  ! 105: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbbad9bf  ! 106: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d01f  ! 107: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xc83ae000  ! 108: STD_I	std	%r4, [%r11 + 0x0000]
	.word 0xc902801f  ! 109: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc9f2903f  ! 110: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9e2a01f  ! 111: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2a01f  ! 112: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2a01f  ! 113: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9f2903f  ! 114: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc83aa000  ! 115: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9e2a01f  ! 116: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba983f  ! 117: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 118: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2903f  ! 119: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc9ba983f  ! 120: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc8c2d13f  ! 121: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r4
	.word 0xc9f2e01f  ! 122: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 123: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9bad83f  ! 124: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd322801f  ! 125: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3f2903f  ! 126: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xd3ba997f  ! 127: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 128: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 129: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 130: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3ba989f  ! 131: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 132: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd28a915f  ! 133: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r9
	.word 0xd3ba99bf  ! 134: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 135: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcadaa000  ! 136: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r5
	.word 0xc85a801f  ! 137: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xc9ba995f  ! 138: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc6c2d07f  ! 139: LDSWA_R	ldswa	[%r11, %r31] 0x83, %r3
	.word 0xc7bad8bf  ! 140: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7bad87f  ! 141: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad89f  ! 142: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 143: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xd002e060  ! 144: LDUW_I	lduw	[%r11 + 0x0060], %r8
	.word 0xd1f2d01f  ! 145: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
TH_LABEL145:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1f2e01f  ! 146: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1e2d01f  ! 147: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xc59ae020  ! 148: LDDFA_I	ldda	[%r11, 0x0020], %f2
	.word 0xc5f2d13f  ! 149: CASXA_I	casxa	[%r11] 0x89, %r31, %r2
	.word 0xc5bad95f  ! 150: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc8ae02b  ! 151: LDUBA_I	lduba	[%r11, + 0x002b] %asi, %r6
	.word 0xcdbad81f  ! 152: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad89f  ! 153: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc49aa050  ! 154: LDDA_I	ldda	[%r10, + 0x0050] %asi, %r2
	.word 0xc2ca903f  ! 155: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd2caa016  ! 156: LDSBA_I	ldsba	[%r10, + 0x0016] %asi, %r9
	.word 0xd3e2901f  ! 157: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd292905f  ! 158: LDUHA_R	lduha	[%r10, %r31] 0x82, %r9
	.word 0xc88ae031  ! 159: LDUBA_I	lduba	[%r11, + 0x0031] %asi, %r4
	.word 0xce8a901f  ! 160: LDUBA_R	lduba	[%r10, %r31] 0x80, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfba98bf  ! 161: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd24aa062  ! 162: LDSB_I	ldsb	[%r10 + 0x0062], %r9
	.word 0xd3ba989f  ! 163: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcc42c01f  ! 164: LDSW_R	ldsw	[%r11 + %r31], %r6
	.word 0xcde2d03f  ! 165: CASA_I	casa	[%r11] 0x81, %r31, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcb9aa070  ! 166: LDDFA_I	ldda	[%r10, 0x0070], %f5
	.word 0xc83aa070  ! 167: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xcbba991f  ! 168: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc8c2d03f  ! 169: LDSWA_R	ldswa	[%r11, %r31] 0x81, %r4
	.word 0xc692d05f  ! 170: LDUHA_R	lduha	[%r11, %r31] 0x82, %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7e2d11f  ! 171: CASA_I	casa	[%r11] 0x88, %r31, %r3
	.word 0xc7bad91f  ! 172: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae070  ! 173: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xc43ae070  ! 174: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xd19aa070  ! 175: LDDFA_I	ldda	[%r10, 0x0070], %f8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1ba993f  ! 176: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd052a072  ! 177: LDSH_I	ldsh	[%r10 + 0x0072], %r8
	.word 0xcc02a06c  ! 178: LDUW_I	lduw	[%r10 + 0x006c], %r6
	.word 0xcd9ae048  ! 179: LDDFA_I	ldda	[%r11, 0x0048], %f6
	.word 0xcdf2e01f  ! 180: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xce42a078  ! 181: LDSW_I	ldsw	[%r10 + 0x0078], %r7
	.word 0xcd22801f  ! 182: STF_R	st	%f6, [%r31, %r10]
	.word 0xd242a01c  ! 183: LDSW_I	ldsw	[%r10 + 0x001c], %r9
	.word 0xd3ba985f  ! 184: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 185: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3e2911f  ! 186: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xd3ba993f  ! 187: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc45aa028  ! 188: LDX_I	ldx	[%r10 + 0x0028], %r2
	.word 0xc5e2911f  ! 189: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xcd9aa038  ! 190: LDDFA_I	ldda	[%r10, 0x0038], %f6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdf2911f  ! 191: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcdba991f  ! 192: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba987f  ! 193: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xca8a905f  ! 194: LDUBA_R	lduba	[%r10, %r31] 0x82, %r5
	.word 0xcbe2a01f  ! 195: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbba981f  ! 196: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc41aa040  ! 197: LDD_I	ldd	[%r10 + 0x0040], %r2
	.word 0xcb9aa060  ! 198: LDDFA_I	ldda	[%r10, 0x0060], %f5
	.word 0xc692d15f  ! 199: LDUHA_R	lduha	[%r11, %r31] 0x8a, %r3
	.word 0xc482a01c  ! 200: LDUWA_I	lduwa	[%r10, + 0x001c] %asi, %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5ba995f  ! 201: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd252c01f  ! 202: LDSH_R	ldsh	[%r11 + %r31], %r9
	.word 0xd3e2d11f  ! 203: CASA_I	casa	[%r11] 0x88, %r31, %r9
	.word 0xd3f2e01f  ! 204: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad93f  ! 205: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xce82d01f  ! 206: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r7
	.word 0xcfe2d01f  ! 207: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcc3ac01f  ! 208: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcfe2d03f  ! 209: CASA_I	casa	[%r11] 0x81, %r31, %r7
	.word 0xcc3ac01f  ! 210: STD_R	std	%r6, [%r11 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfbad93f  ! 211: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc612801f  ! 212: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xc7ba991f  ! 213: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd20ac01f  ! 214: LDUB_R	ldub	[%r11 + %r31], %r9
	.word 0xd3bad81f  ! 215: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3bad83f  ! 216: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2d11f  ! 217: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xd3bad87f  ! 218: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae018  ! 219: STD_I	std	%r8, [%r11 + 0x0018]
	.word 0xd102c01f  ! 220: LDF_R	ld	[%r11, %r31], %f8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc24aa04f  ! 221: LDSB_I	ldsb	[%r10 + 0x004f], %r1
	.word 0xc3e2a01f  ! 222: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc80a801f  ! 223: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xc40a801f  ! 224: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xc5e2a01f  ! 225: CASA_R	casa	[%r10] %asi, %r31, %r2
TH_LABEL225:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5ba983f  ! 226: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 227: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa048  ! 228: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc43a801f  ! 229: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba983f  ! 230: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5f2a01f  ! 231: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2911f  ! 232: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5e2a01f  ! 233: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xd302801f  ! 234: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd3ba981f  ! 235: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3ba987f  ! 236: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 237: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3f2a01f  ! 238: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xcf02e060  ! 239: LDF_I	ld	[%r11, 0x0060], %f7
	.word 0xd292917f  ! 240: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd03a801f  ! 241: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba991f  ! 242: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc922801f  ! 243: STF_R	st	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 244: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xd322801f  ! 245: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd03aa060  ! 246: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd03a801f  ! 247: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc692903f  ! 248: LDUHA_R	lduha	[%r10, %r31] 0x81, %r3
	.word 0xd04ac01f  ! 249: LDSB_R	ldsb	[%r11 + %r31], %r8
	.word 0xd39aa078  ! 250: LDDFA_I	ldda	[%r10, 0x0078], %f9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc4c2a004  ! 251: LDSWA_I	ldswa	[%r10, + 0x0004] %asi, %r2
	.word 0xc5e2a01f  ! 252: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5f2901f  ! 253: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5e2a01f  ! 254: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 255: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc89aa060  ! 256: LDDA_I	ldda	[%r10, + 0x0060] %asi, %r4
	.word 0xc9ba995f  ! 257: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc89aa060  ! 258: LDDA_I	ldda	[%r10, + 0x0060] %asi, %r4
	.word 0xcbba981f  ! 259: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcd22c01f  ! 260: STF_R	st	%f6, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdbad87f  ! 261: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc8c2a028  ! 262: LDSWA_I	ldswa	[%r10, + 0x0028] %asi, %r4
	.word 0xc9ba993f  ! 263: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba98bf  ! 264: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 265: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9f2a01f  ! 266: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2911f  ! 267: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xd01aa038  ! 268: LDD_I	ldd	[%r10 + 0x0038], %r8
	.word 0xd1ba991f  ! 269: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 270: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL270:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc702801f  ! 271: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc7ba981f  ! 272: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 273: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 274: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7f2913f  ! 275: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7ba985f  ! 276: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd05aa060  ! 277: LDX_I	ldx	[%r10 + 0x0060], %r8
	.word 0xd39aa028  ! 278: LDDFA_I	ldda	[%r10, 0x0028], %f9
	.word 0xc452801f  ! 279: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xc25ac01f  ! 280: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3f2e01f  ! 281: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xd0d2d05f  ! 282: LDSHA_R	ldsha	[%r11, %r31] 0x82, %r8
	.word 0xcac2905f  ! 283: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r5
	.word 0xcbe2903f  ! 284: CASA_I	casa	[%r10] 0x81, %r31, %r5
	.word 0xc49ae038  ! 285: LDDA_I	ldda	[%r11, + 0x0038] %asi, %r2
TH_LABEL285:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7bad87f  ! 286: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae038  ! 287: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xc492e01c  ! 288: LDUHA_I	lduha	[%r11, + 0x001c] %asi, %r2
	.word 0xc5f2e01f  ! 289: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2d11f  ! 290: CASA_I	casa	[%r11] 0x88, %r31, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5bad89f  ! 291: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad81f  ! 292: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcf02801f  ! 293: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc322801f  ! 294: STF_R	st	%f1, [%r31, %r10]
	.word 0xcb02a020  ! 295: LDF_I	ld	[%r10, 0x0020], %f5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1baa020  ! 296: STDFA_I	stda	%f8, [0x0020, %r10]
	.word 0xc202a068  ! 297: LDUW_I	lduw	[%r10 + 0x0068], %r1
	.word 0xc3ba981f  ! 298: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2903f  ! 299: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc48ae02e  ! 300: LDUBA_I	lduba	[%r11, + 0x002e] %asi, %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd002a02c  ! 301: LDUW_I	lduw	[%r10 + 0x002c], %r8
	.word 0xd03a801f  ! 302: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc452801f  ! 303: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xc5ba983f  ! 304: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc92903f  ! 305: LDUHA_R	lduha	[%r10, %r31] 0x81, %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdf2a01f  ! 306: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2a01f  ! 307: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd05aa050  ! 308: LDX_I	ldx	[%r10 + 0x0050], %r8
	.word 0xc4dae040  ! 309: LDXA_I	ldxa	[%r11, + 0x0040] %asi, %r2
	.word 0xce8aa03c  ! 310: LDUBA_I	lduba	[%r10, + 0x003c] %asi, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcf02a03c  ! 311: LDF_I	ld	[%r10, 0x003c], %f7
	.word 0xcfba983f  ! 312: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba99bf  ! 313: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa038  ! 314: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xce52c01f  ! 315: LDSH_R	ldsh	[%r11 + %r31], %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd002c01f  ! 316: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xc80ac01f  ! 317: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xc89ae030  ! 318: LDDA_I	ldda	[%r11, + 0x0030] %asi, %r4
	.word 0xc83ac01f  ! 319: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad83f  ! 320: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc4dad03f  ! 321: LDXA_R	ldxa	[%r11, %r31] 0x81, %r2
	.word 0xc322801f  ! 322: STF_R	st	%f1, [%r31, %r10]
	.word 0xd0daa078  ! 323: LDXA_I	ldxa	[%r10, + 0x0078] %asi, %r8
	.word 0xd1ba981f  ! 324: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcf02801f  ! 325: LDF_R	ld	[%r10, %r31], %f7
TH_LABEL325:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc3a801f  ! 326: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc92911f  ! 327: LDUHA_R	lduha	[%r10, %r31] 0x88, %r6
	.word 0xcdf2903f  ! 328: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xcdf2911f  ! 329: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xc2dad05f  ! 330: LDXA_R	ldxa	[%r11, %r31] 0x82, %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3bad85f  ! 331: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad91f  ! 332: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad97f  ! 333: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc642801f  ! 334: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc7ba985f  ! 335: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xce02e00c  ! 336: LDUW_I	lduw	[%r11 + 0x000c], %r7
	.word 0xcd22c01f  ! 337: STF_R	st	%f6, [%r31, %r11]
	.word 0xcfbae050  ! 338: STDFA_I	stda	%f7, [0x0050, %r11]
	.word 0xcfbad91f  ! 339: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd052801f  ! 340: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd08ae077  ! 341: LDUBA_I	lduba	[%r11, + 0x0077] %asi, %r8
	.word 0xd1bad89f  ! 342: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d11f  ! 343: CASA_I	casa	[%r11] 0x88, %r31, %r8
	.word 0xd1bad8bf  ! 344: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd08aa050  ! 345: LDUBA_I	lduba	[%r10, + 0x0050] %asi, %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xced2a040  ! 346: LDSHA_I	ldsha	[%r10, + 0x0040] %asi, %r7
	.word 0xcec2d13f  ! 347: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r7
	.word 0xcfbad89f  ! 348: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcb9aa028  ! 349: LDDFA_I	ldda	[%r10, 0x0028], %f5
	.word 0xc6d2e07c  ! 350: LDSHA_I	ldsha	[%r11, + 0x007c] %asi, %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd102a058  ! 351: LDF_I	ld	[%r10, 0x0058], %f8
	.word 0xc852e056  ! 352: LDSH_I	ldsh	[%r11 + 0x0056], %r4
	.word 0xc9f2e01f  ! 353: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xcd9aa058  ! 354: LDDFA_I	ldda	[%r10, 0x0058], %f6
	.word 0xcdba993f  ! 355: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdba987f  ! 356: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd28ad15f  ! 357: LDUBA_R	lduba	[%r11, %r31] 0x8a, %r9
	.word 0xd3bad9bf  ! 358: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad97f  ! 359: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 360: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3bad95f  ! 361: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcfbaa078  ! 362: STDFA_I	stda	%f7, [0x0078, %r10]
	.word 0xcff2903f  ! 363: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcfe2a01f  ! 364: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xce8a901f  ! 365: LDUBA_R	lduba	[%r10, %r31] 0x80, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfba981f  ! 366: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 367: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 368: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcff2911f  ! 369: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcfba98bf  ! 370: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcff2901f  ! 371: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcfba999f  ! 372: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc2dae028  ! 373: LDXA_I	ldxa	[%r11, + 0x0028] %asi, %r1
	.word 0xc3f2d01f  ! 374: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xd0d2905f  ! 375: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r8
TH_LABEL375:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcf9ae048  ! 376: LDDFA_I	ldda	[%r11, 0x0048], %f7
	.word 0xcc3ae048  ! 377: STD_I	std	%r6, [%r11 + 0x0048]
	.word 0xcc3ae048  ! 378: STD_I	std	%r6, [%r11 + 0x0048]
	.word 0xcc4aa065  ! 379: LDSB_I	ldsb	[%r10 + 0x0065], %r6
	.word 0xd122801f  ! 380: STF_R	st	%f8, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1ba981f  ! 381: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd102801f  ! 382: LDF_R	ld	[%r10, %r31], %f8
	.word 0xd1ba981f  ! 383: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba985f  ! 384: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba997f  ! 385: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1ba991f  ! 386: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba987f  ! 387: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcd9aa058  ! 388: LDDFA_I	ldda	[%r10, 0x0058], %f6
	.word 0xd25a801f  ! 389: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xd092d17f  ! 390: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcd02a01c  ! 391: LDF_I	ld	[%r10, 0x001c], %f6
	.word 0xc842e044  ! 392: LDSW_I	ldsw	[%r11 + 0x0044], %r4
	.word 0xc83ae040  ! 393: STD_I	std	%r4, [%r11 + 0x0040]
	.word 0xc9bad89f  ! 394: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc902801f  ! 395: LDF_R	ld	[%r10, %r31], %f4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc83a801f  ! 396: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcf9aa050  ! 397: LDDFA_I	ldda	[%r10, 0x0050], %f7
	.word 0xcfba99bf  ! 398: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 399: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xc84ae04b  ! 400: LDSB_I	ldsb	[%r11 + 0x004b], %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc28a905f  ! 401: LDUBA_R	lduba	[%r10, %r31] 0x82, %r1
	.word 0xc3ba989f  ! 402: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc502a00c  ! 403: LDF_I	ld	[%r10, 0x000c], %f2
	.word 0xc9baa040  ! 404: STDFA_I	stda	%f4, [0x0040, %r10]
	.word 0xc83a801f  ! 405: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9ba995f  ! 406: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 407: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd102801f  ! 408: LDF_R	ld	[%r10, %r31], %f8
	.word 0xd1ba997f  ! 409: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba987f  ! 410: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1f2901f  ! 411: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xc48ae063  ! 412: LDUBA_I	lduba	[%r11, + 0x0063] %asi, %r2
	.word 0xc5f2d03f  ! 413: CASXA_I	casxa	[%r11] 0x81, %r31, %r2
	.word 0xd24a801f  ! 414: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xd3ba993f  ! 415: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd03aa060  ! 416: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd3ba985f  ! 417: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2913f  ! 418: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd03aa060  ! 419: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd042e018  ! 420: LDSW_I	ldsw	[%r11 + 0x0018], %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1bad87f  ! 421: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad95f  ! 422: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad8bf  ! 423: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d01f  ! 424: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xc2c2913f  ! 425: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd002a020  ! 426: LDUW_I	lduw	[%r10 + 0x0020], %r8
	.word 0xca02c01f  ! 427: LDUW_R	lduw	[%r11 + %r31], %r5
	.word 0xc48a907f  ! 428: LDUBA_R	lduba	[%r10, %r31] 0x83, %r2
	.word 0xc5ba995f  ! 429: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2903f  ! 430: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5ba995f  ! 431: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd122c01f  ! 432: STF_R	st	%f8, [%r31, %r11]
	.word 0xcf22c01f  ! 433: STF_R	st	%f7, [%r31, %r11]
	.word 0xcdbaa038  ! 434: STDFA_I	stda	%f6, [0x0038, %r10]
	.word 0xcdba98bf  ! 435: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL435:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc3aa038  ! 436: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xd39aa048  ! 437: LDDFA_I	ldda	[%r10, 0x0048], %f9
	.word 0xc4cae032  ! 438: LDSBA_I	ldsba	[%r11, + 0x0032] %asi, %r2
	.word 0xc5e2e01f  ! 439: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad81f  ! 440: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5f2d13f  ! 441: CASXA_I	casxa	[%r11] 0x89, %r31, %r2
	.word 0xc902a014  ! 442: LDF_I	ld	[%r10, 0x0014], %f4
	.word 0xc9ba989f  ! 443: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc28ae008  ! 444: LDUBA_I	lduba	[%r11, + 0x0008] %asi, %r1
	.word 0xc3bad89f  ! 445: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3e2d03f  ! 446: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xd302801f  ! 447: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd3f2a01f  ! 448: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc01a801f  ! 449: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xc03aa008  ! 450: STD_I	std	%r0, [%r10 + 0x0008]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3f2901f  ! 451: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xd3baa078  ! 452: STDFA_I	stda	%f9, [0x0078, %r10]
	.word 0xc702a014  ! 453: LDF_I	ld	[%r10, 0x0014], %f3
	.word 0xc7ba989f  ! 454: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 455: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7e2911f  ! 456: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xc7f2901f  ! 457: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba991f  ! 458: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd00a801f  ! 459: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xd1ba981f  ! 460: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1ba989f  ! 461: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 462: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2913f  ! 463: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd1f2901f  ! 464: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1f2901f  ! 465: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1f2a01f  ! 466: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc4da901f  ! 467: LDXA_R	ldxa	[%r10, %r31] 0x80, %r2
	.word 0xc5ba999f  ! 468: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba983f  ! 469: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba98bf  ! 470: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd19aa040  ! 471: LDDFA_I	ldda	[%r10, 0x0040], %f8
	.word 0xd1e2901f  ! 472: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd19ae018  ! 473: LDDFA_I	ldda	[%r11, 0x0018], %f8
	.word 0xd1bad99f  ! 474: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2e01f  ! 475: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd102a05c  ! 476: LDF_I	ld	[%r10, 0x005c], %f8
	.word 0xd1ba993f  ! 477: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 478: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 479: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc882917f  ! 480: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9f2a01f  ! 481: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc522c01f  ! 482: STF_R	st	%f2, [%r31, %r11]
	.word 0xca4ac01f  ! 483: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xcad2a02a  ! 484: LDSHA_I	ldsha	[%r10, + 0x002a] %asi, %r5
	.word 0xd302801f  ! 485: LDF_R	ld	[%r10, %r31], %f9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc902a054  ! 486: LDF_I	ld	[%r10, 0x0054], %f4
	.word 0xc9ba989f  ! 487: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 488: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcf02a060  ! 489: LDF_I	ld	[%r10, 0x0060], %f7
	.word 0xcc3a801f  ! 490: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc82901f  ! 491: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r6
	.word 0xcdba999f  ! 492: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 493: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba985f  ! 494: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2a01f  ! 495: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdbaa008  ! 496: STDFA_I	stda	%f6, [0x0008, %r10]
	.word 0xd212801f  ! 497: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xd3ba981f  ! 498: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 499: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2a01f  ! 500: CASA_R	casa	[%r10] %asi, %r31, %r9
TH_LABEL500:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xca5ae070  ! 501: LDX_I	ldx	[%r11 + 0x0070], %r5
	.word 0xca92913f  ! 502: LDUHA_R	lduha	[%r10, %r31] 0x89, %r5
	.word 0xcbf2903f  ! 503: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xcbf2a01f  ! 504: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba999f  ! 505: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbf2a01f  ! 506: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2903f  ! 507: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xcbba997f  ! 508: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd19aa078  ! 509: LDDFA_I	ldda	[%r10, 0x0078], %f8
	.word 0xd09aa008  ! 510: LDDA_I	ldda	[%r10, + 0x0008] %asi, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc652801f  ! 511: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xc43a801f  ! 512: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba981f  ! 513: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc702801f  ! 514: LDF_R	ld	[%r10, %r31], %f3
	.word 0xcad2a032  ! 515: LDSHA_I	ldsha	[%r10, + 0x0032] %asi, %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbba983f  ! 516: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba995f  ! 517: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 518: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd2ca903f  ! 519: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r9
	.word 0xcad2905f  ! 520: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc922c01f  ! 521: STF_R	st	%f4, [%r31, %r11]
	.word 0xc402801f  ! 522: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xc3baa028  ! 523: STDFA_I	stda	%f1, [0x0028, %r10]
	.word 0xc3ba987f  ! 524: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa028  ! 525: STD_I	std	%r0, [%r10 + 0x0028]
TH_LABEL525:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc842c01f  ! 526: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xc812a060  ! 527: LDUH_I	lduh	[%r10 + 0x0060], %r4
	.word 0xc9f2a01f  ! 528: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc282e008  ! 529: LDUWA_I	lduwa	[%r11, + 0x0008] %asi, %r1
	.word 0xd1baa030  ! 530: STDFA_I	stda	%f8, [0x0030, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcd02c01f  ! 531: LDF_R	ld	[%r11, %r31], %f6
	.word 0xcdbad81f  ! 532: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc8daa070  ! 533: LDXA_I	ldxa	[%r10, + 0x0070] %asi, %r4
	.word 0xc9ba99bf  ! 534: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba98bf  ! 535: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xce52801f  ! 536: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xcc3aa070  ! 537: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcfba995f  ! 538: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2913f  ! 539: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xc85a801f  ! 540: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9e2901f  ! 541: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc2d2901f  ! 542: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r1
	.word 0xcb02a034  ! 543: LDF_I	ld	[%r10, 0x0034], %f5
	.word 0xcbba981f  ! 544: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xce52801f  ! 545: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc3a801f  ! 546: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcff2a01f  ! 547: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfba983f  ! 548: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba991f  ! 549: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2911f  ! 550: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfe2a01f  ! 551: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba985f  ! 552: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca52801f  ! 553: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xc64ac01f  ! 554: LDSB_R	ldsb	[%r11 + %r31], %r3
	.word 0xd042a064  ! 555: LDSW_I	ldsw	[%r10 + 0x0064], %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc4dae068  ! 556: LDXA_I	ldxa	[%r11, + 0x0068] %asi, %r2
	.word 0xccd2a00c  ! 557: LDSHA_I	ldsha	[%r10, + 0x000c] %asi, %r6
	.word 0xd04aa037  ! 558: LDSB_I	ldsb	[%r10 + 0x0037], %r8
	.word 0xc4ca901f  ! 559: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r2
	.word 0xc5f2a01f  ! 560: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xceda903f  ! 561: LDXA_R	ldxa	[%r10, %r31] 0x81, %r7
	.word 0xd01aa050  ! 562: LDD_I	ldd	[%r10 + 0x0050], %r8
	.word 0xd3ba995f  ! 563: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2901f  ! 564: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd122c01f  ! 565: STF_R	st	%f8, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd03ac01f  ! 566: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2e01f  ! 567: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad95f  ! 568: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad87f  ! 569: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d11f  ! 570: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcb22c01f  ! 571: STF_R	st	%f5, [%r31, %r11]
	.word 0xcbbad9bf  ! 572: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcccaa010  ! 573: LDSBA_I	ldsba	[%r10, + 0x0010] %asi, %r6
	.word 0xcde2a01f  ! 574: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2903f  ! 575: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc52801f  ! 576: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xd102801f  ! 577: LDF_R	ld	[%r10, %r31], %f8
	.word 0xd1f2a01f  ! 578: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc59ae030  ! 579: LDDFA_I	ldda	[%r11, 0x0030], %f2
	.word 0xc5e2e01f  ! 580: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc43ae030  ! 581: STD_I	std	%r2, [%r11 + 0x0030]
	.word 0xc5bad91f  ! 582: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2d01f  ! 583: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xc60ac01f  ! 584: LDUB_R	ldub	[%r11 + %r31], %r3
	.word 0xc322801f  ! 585: STF_R	st	%f1, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3f2903f  ! 586: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc03aa030  ! 587: STD_I	std	%r0, [%r10 + 0x0030]
	.word 0xc3ba993f  ! 588: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc6ca903f  ! 589: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r3
	.word 0xca52a018  ! 590: LDSH_I	ldsh	[%r10 + 0x0018], %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbba987f  ! 591: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 592: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcec2917f  ! 593: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r7
	.word 0xcfba989f  ! 594: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba983f  ! 595: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc242e040  ! 596: LDSW_I	ldsw	[%r11 + 0x0040], %r1
	.word 0xd012e070  ! 597: LDUH_I	lduh	[%r11 + 0x0070], %r8
	.word 0xd1e2d03f  ! 598: CASA_I	casa	[%r11] 0x81, %r31, %r8
	.word 0xd1e2e01f  ! 599: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1f2e01f  ! 600: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd03ae070  ! 601: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xcf9aa008  ! 602: LDDFA_I	ldda	[%r10, 0x0008], %f7
	.word 0xce12a002  ! 603: LDUH_I	lduh	[%r10 + 0x0002], %r7
	.word 0xd212801f  ! 604: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xd3ba99bf  ! 605: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3ba983f  ! 606: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 607: STD_R	std	%r8, [%r10 + %r31]
	.word 0xca12801f  ! 608: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xd0caa004  ! 609: LDSBA_I	ldsba	[%r10, + 0x0004] %asi, %r8
	.word 0xce02801f  ! 610: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd252801f  ! 611: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xd3ba987f  ! 612: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 613: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 614: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3f2a01f  ! 615: CASXA_R	casxa	[%r10]%asi, %r31, %r9
TH_LABEL615:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba99bf  ! 616: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc8c2a05c  ! 617: LDSWA_I	ldswa	[%r10, + 0x005c] %asi, %r4
	.word 0xc9e2a01f  ! 618: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba991f  ! 619: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 620: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc83a801f  ! 621: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba98bf  ! 622: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2911f  ! 623: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc9e2a01f  ! 624: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc20a801f  ! 625: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3e2903f  ! 626: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3e2901f  ! 627: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba981f  ! 628: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba997f  ! 629: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc41a801f  ! 630: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7ba989f  ! 631: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba99bf  ! 632: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 633: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba995f  ! 634: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xca92a07a  ! 635: LDUHA_I	lduha	[%r10, + 0x007a] %asi, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbba983f  ! 636: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba989f  ! 637: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba98bf  ! 638: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc812a00a  ! 639: LDUH_I	lduh	[%r10 + 0x000a], %r4
	.word 0xce4a801f  ! 640: LDSB_R	ldsb	[%r10 + %r31], %r7
TH_LABEL640:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfba981f  ! 641: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2911f  ! 642: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcfba993f  ! 643: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc502801f  ! 644: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc5e2911f  ! 645: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5bae058  ! 646: STDFA_I	stda	%f2, [0x0058, %r11]
	.word 0xd3baa000  ! 647: STDFA_I	stda	%f9, [0x0000, %r10]
	.word 0xd3e2a01f  ! 648: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba983f  ! 649: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba985f  ! 650: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3f2901f  ! 651: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd03a801f  ! 652: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba999f  ! 653: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcb02a060  ! 654: LDF_I	ld	[%r10, 0x0060], %f5
	.word 0xccc2d13f  ! 655: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc6d2a04c  ! 656: LDSHA_I	ldsha	[%r10, + 0x004c] %asi, %r3
	.word 0xc43a801f  ! 657: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa048  ! 658: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc7ba995f  ! 659: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcfbaa008  ! 660: STDFA_I	stda	%f7, [0x0008, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc8d2901f  ! 661: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r4
	.word 0xc9e2903f  ! 662: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc9ba997f  ! 663: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 664: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc24a801f  ! 665: LDSB_R	ldsb	[%r10 + %r31], %r1
TH_LABEL665:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc79aa058  ! 666: LDDFA_I	ldda	[%r10, 0x0058], %f3
	.word 0xc20ae019  ! 667: LDUB_I	ldub	[%r11 + 0x0019], %r1
	.word 0xc3bad83f  ! 668: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xca92d05f  ! 669: LDUHA_R	lduha	[%r11, %r31] 0x82, %r5
	.word 0xd20ac01f  ! 670: LDUB_R	ldub	[%r11 + %r31], %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3bad81f  ! 671: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd05a801f  ! 672: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xd1ba997f  ! 673: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcd02c01f  ! 674: LDF_R	ld	[%r11, %r31], %f6
	.word 0xcdf2e01f  ! 675: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdbad93f  ! 676: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc24a801f  ! 677: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xc3f2913f  ! 678: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xc6caa008  ! 679: LDSBA_I	ldsba	[%r10, + 0x0008] %asi, %r3
	.word 0xc43a801f  ! 680: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc702c01f  ! 681: LDF_R	ld	[%r11, %r31], %f3
	.word 0xc7bad81f  ! 682: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad97f  ! 683: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc302a038  ! 684: LDF_I	ld	[%r10, 0x0038], %f1
	.word 0xc502801f  ! 685: LDF_R	ld	[%r10, %r31], %f2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xce12c01f  ! 686: LDUH_R	lduh	[%r11 + %r31], %r7
	.word 0xcf22c01f  ! 687: STF_R	st	%f7, [%r31, %r11]
	.word 0xcfbad81f  ! 688: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd3baa070  ! 689: STDFA_I	stda	%f9, [0x0070, %r10]
	.word 0xd20a801f  ! 690: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd03a801f  ! 691: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba999f  ! 692: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 693: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc81aa058  ! 694: LDD_I	ldd	[%r10 + 0x0058], %r4
	.word 0xc802e03c  ! 695: LDUW_I	lduw	[%r11 + 0x003c], %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5baa048  ! 696: STDFA_I	stda	%f2, [0x0048, %r10]
	.word 0xd01ac01f  ! 697: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xd3e2e01f  ! 698: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3bad95f  ! 699: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 700: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc28aa071  ! 701: LDUBA_I	lduba	[%r10, + 0x0071] %asi, %r1
	.word 0xc3e2a01f  ! 702: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba981f  ! 703: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcc1a801f  ! 704: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc602801f  ! 705: LDUW_R	lduw	[%r10 + %r31], %r3
TH_LABEL705:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7e2911f  ! 706: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xc49aa018  ! 707: LDDA_I	ldda	[%r10, + 0x0018] %asi, %r2
	.word 0xc7f2a01f  ! 708: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc302e040  ! 709: LDF_I	ld	[%r11, 0x0040], %f1
	.word 0xc2d2d01f  ! 710: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3bad99f  ! 711: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 712: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc03ae040  ! 713: STD_I	std	%r0, [%r11 + 0x0040]
	.word 0xd00a801f  ! 714: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xd24aa013  ! 715: LDSB_I	ldsb	[%r10 + 0x0013], %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc612801f  ! 716: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xcfbae010  ! 717: STDFA_I	stda	%f7, [0x0010, %r11]
	.word 0xd2c2a064  ! 718: LDSWA_I	ldswa	[%r10, + 0x0064] %asi, %r9
	.word 0xc45ae058  ! 719: LDX_I	ldx	[%r11 + 0x0058], %r2
	.word 0xc5bad89f  ! 720: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc6dae018  ! 721: LDXA_I	ldxa	[%r11, + 0x0018] %asi, %r3
	.word 0xc7bad93f  ! 722: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc922801f  ! 723: STF_R	st	%f4, [%r31, %r10]
	.word 0xc9e2911f  ! 724: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9f2901f  ! 725: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc24ac01f  ! 726: LDSB_R	ldsb	[%r11 + %r31], %r1
	.word 0xca0a801f  ! 727: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xcbba987f  ! 728: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba995f  ! 729: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 730: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd39ae000  ! 731: LDDFA_I	ldda	[%r11, 0x0000], %f9
	.word 0xd3f2d01f  ! 732: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd3bad95f  ! 733: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc852c01f  ! 734: LDSH_R	ldsh	[%r11 + %r31], %r4
	.word 0xc9f2d01f  ! 735: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9bad91f  ! 736: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcaca901f  ! 737: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r5
	.word 0xc83a801f  ! 738: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba985f  ! 739: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 740: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd0c2901f  ! 741: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r8
	.word 0xca52e00a  ! 742: LDSH_I	ldsh	[%r11 + 0x000a], %r5
	.word 0xd252c01f  ! 743: LDSH_R	ldsh	[%r11 + %r31], %r9
	.word 0xd3baa000  ! 744: STDFA_I	stda	%f9, [0x0000, %r10]
	.word 0xcdbaa070  ! 745: STDFA_I	stda	%f6, [0x0070, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcd9aa068  ! 746: LDDFA_I	ldda	[%r10, 0x0068], %f6
	.word 0xcc3aa068  ! 747: STD_I	std	%r6, [%r10 + 0x0068]
	.word 0xcdba995f  ! 748: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc5baa018  ! 749: STDFA_I	stda	%f2, [0x0018, %r10]
	.word 0xc5ba981f  ! 750: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5f2901f  ! 751: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xca0aa067  ! 752: LDUB_I	ldub	[%r10 + 0x0067], %r5
	.word 0xcf22801f  ! 753: STF_R	st	%f7, [%r31, %r10]
	.word 0xd0ca905f  ! 754: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r8
	.word 0xc84ac01f  ! 755: LDSB_R	ldsb	[%r11 + %r31], %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xca8aa041  ! 756: LDUBA_I	lduba	[%r10, + 0x0041] %asi, %r5
	.word 0xd102a038  ! 757: LDF_I	ld	[%r10, 0x0038], %f8
	.word 0xd2ca917f  ! 758: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r9
	.word 0xc702801f  ! 759: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc43a801f  ! 760: STD_R	std	%r2, [%r10 + %r31]
TH_LABEL760:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7e2901f  ! 761: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc43aa038  ! 762: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc2c2d15f  ! 763: LDSWA_R	ldswa	[%r11, %r31] 0x8a, %r1
	.word 0xc3bad8bf  ! 764: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 765: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd00ac01f  ! 766: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xd1bad8bf  ! 767: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ac01f  ! 768: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1f2d03f  ! 769: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xd242801f  ! 770: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3ba997f  ! 771: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc4ca911f  ! 772: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r2
	.word 0xc5ba98bf  ! 773: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 774: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba99bf  ! 775: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL775:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd012e022  ! 776: LDUH_I	lduh	[%r11 + 0x0022], %r8
	.word 0xc2da907f  ! 777: LDXA_R	ldxa	[%r10, %r31] 0x83, %r1
	.word 0xcc5ac01f  ! 778: LDX_R	ldx	[%r11 + %r31], %r6
	.word 0xc452e036  ! 779: LDSH_I	ldsh	[%r11 + 0x0036], %r2
	.word 0xd252a060  ! 780: LDSH_I	ldsh	[%r10 + 0x0060], %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3ba983f  ! 781: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba985f  ! 782: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa060  ! 783: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd3ba993f  ! 784: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa060  ! 785: STD_I	std	%r8, [%r10 + 0x0060]
TH_LABEL785:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd322801f  ! 786: STF_R	st	%f9, [%r31, %r10]
	.word 0xc41a801f  ! 787: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xce8a915f  ! 788: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r7
	.word 0xcfba991f  ! 789: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcb9ae058  ! 790: LDDFA_I	ldda	[%r11, 0x0058], %f5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc49aa068  ! 791: LDDA_I	ldda	[%r10, + 0x0068] %asi, %r2
	.word 0xc7ba981f  ! 792: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa068  ! 793: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xcf9aa028  ! 794: LDDFA_I	ldda	[%r10, 0x0028], %f7
	.word 0xcfba987f  ! 795: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc8d2905f  ! 796: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r4
	.word 0xd20a801f  ! 797: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xca82d05f  ! 798: LDUWA_R	lduwa	[%r11, %r31] 0x82, %r5
	.word 0xcbe2e01f  ! 799: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xca92d01f  ! 800: LDUHA_R	lduha	[%r11, %r31] 0x80, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbf2e01f  ! 801: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad95f  ! 802: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc902e038  ! 803: LDF_I	ld	[%r11, 0x0038], %f4
	.word 0xc60ae043  ! 804: LDUB_I	ldub	[%r11 + 0x0043], %r3
	.word 0xc7bad95f  ! 805: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xce82a05c  ! 806: LDUWA_I	lduwa	[%r10, + 0x005c] %asi, %r7
	.word 0xcfba989f  ! 807: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 808: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 809: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba983f  ! 810: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcf02a02c  ! 811: LDF_I	ld	[%r10, 0x002c], %f7
	.word 0xd25a801f  ! 812: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xd092a03e  ! 813: LDUHA_I	lduha	[%r10, + 0x003e] %asi, %r8
	.word 0xd28ae060  ! 814: LDUBA_I	lduba	[%r11, + 0x0060] %asi, %r9
	.word 0xd03ae060  ! 815: STD_I	std	%r8, [%r11 + 0x0060]
TH_LABEL815:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3bad81f  ! 816: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 817: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xcd02a018  ! 818: LDF_I	ld	[%r10, 0x0018], %f6
	.word 0xd2c2911f  ! 819: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r9
	.word 0xc202a02c  ! 820: LDUW_I	lduw	[%r10 + 0x002c], %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3ba987f  ! 821: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc59ae038  ! 822: LDDFA_I	ldda	[%r11, 0x0038], %f2
	.word 0xc5bad83f  ! 823: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad87f  ! 824: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad83f  ! 825: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xca92e038  ! 826: LDUHA_I	lduha	[%r11, + 0x0038] %asi, %r5
	.word 0xcbbad89f  ! 827: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad87f  ! 828: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc802e070  ! 829: LDUW_I	lduw	[%r11 + 0x0070], %r4
	.word 0xc9bad95f  ! 830: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9f2e01f  ! 831: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 832: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9f2d01f  ! 833: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc8caa070  ! 834: LDSBA_I	ldsba	[%r10, + 0x0070] %asi, %r4
	.word 0xc7baa040  ! 835: STDFA_I	stda	%f3, [0x0040, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7ba995f  ! 836: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc2ca901f  ! 837: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r1
	.word 0xc3e2903f  ! 838: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3baa040  ! 839: STDFA_I	stda	%f1, [0x0040, %r10]
	.word 0xc892e03a  ! 840: LDUHA_I	lduha	[%r11, + 0x003a] %asi, %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc83ac01f  ! 841: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9e2d11f  ! 842: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xc9e2d03f  ! 843: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xcc82915f  ! 844: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r6
	.word 0xc702801f  ! 845: LDF_R	ld	[%r10, %r31], %f3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc43aa038  ! 846: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc43aa038  ! 847: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xc7f2a01f  ! 848: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba983f  ! 849: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcb9ae040  ! 850: LDDFA_I	ldda	[%r11, 0x0040], %f5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbf2e01f  ! 851: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad85f  ! 852: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc82d03f  ! 853: LDUWA_R	lduwa	[%r11, %r31] 0x81, %r6
	.word 0xd19aa018  ! 854: LDDFA_I	ldda	[%r10, 0x0018], %f8
	.word 0xd1e2913f  ! 855: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd03aa018  ! 856: STD_I	std	%r8, [%r10 + 0x0018]
	.word 0xc8d2907f  ! 857: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r4
	.word 0xc9ba99bf  ! 858: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc692d03f  ! 859: LDUHA_R	lduha	[%r11, %r31] 0x81, %r3
	.word 0xc8cae07d  ! 860: LDSBA_I	ldsba	[%r11, + 0x007d] %asi, %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9bad99f  ! 861: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d01f  ! 862: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9f2d01f  ! 863: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc83ac01f  ! 864: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc9f2d13f  ! 865: CASXA_I	casxa	[%r11] 0x89, %r31, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9e2d13f  ! 866: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc282d15f  ! 867: LDUWA_R	lduwa	[%r11, %r31] 0x8a, %r1
	.word 0xc3e2d01f  ! 868: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xd302c01f  ! 869: LDF_R	ld	[%r11, %r31], %f9
	.word 0xc442801f  ! 870: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5ba997f  ! 871: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc402c01f  ! 872: LDUW_R	lduw	[%r11 + %r31], %r2
	.word 0xc5f2e01f  ! 873: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2e01f  ! 874: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 875: CASXA_R	casxa	[%r11]%asi, %r31, %r2
TH_LABEL875:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc43ac01f  ! 876: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc402801f  ! 877: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xc202a010  ! 878: LDUW_I	lduw	[%r10 + 0x0010], %r1
	.word 0xc482a060  ! 879: LDUWA_I	lduwa	[%r10, + 0x0060] %asi, %r2
	.word 0xc5e2a01f  ! 880: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc59ae068  ! 881: LDDFA_I	ldda	[%r11, 0x0068], %f2
	.word 0xc452801f  ! 882: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xc48aa038  ! 883: LDUBA_I	lduba	[%r10, + 0x0038] %asi, %r2
	.word 0xc5ba981f  ! 884: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 885: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd19aa060  ! 886: LDDFA_I	ldda	[%r10, 0x0060], %f8
	.word 0xd1e2901f  ! 887: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xca02801f  ! 888: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xc202801f  ! 889: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xc3f2901f  ! 890: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd322801f  ! 891: STF_R	st	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 892: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd2c2d01f  ! 893: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r9
	.word 0xd2dad01f  ! 894: LDXA_R	ldxa	[%r11, %r31] 0x80, %r9
	.word 0xd3e2d11f  ! 895: CASA_I	casa	[%r11] 0x88, %r31, %r9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3f2d03f  ! 896: CASXA_I	casxa	[%r11] 0x81, %r31, %r9
	.word 0xd3e2d01f  ! 897: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xc692917f  ! 898: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r3
	.word 0xc282d07f  ! 899: LDUWA_R	lduwa	[%r11, %r31] 0x83, %r1
	.word 0xc3f2d01f  ! 900: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3f2e01f  ! 901: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad81f  ! 902: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcc1aa060  ! 903: LDD_I	ldd	[%r10 + 0x0060], %r6
	.word 0xcc3a801f  ! 904: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc922801f  ! 905: STF_R	st	%f4, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc83aa060  ! 906: STD_I	std	%r4, [%r10 + 0x0060]
	.word 0xc84aa063  ! 907: LDSB_I	ldsb	[%r10 + 0x0063], %r4
	.word 0xc41aa020  ! 908: LDD_I	ldd	[%r10 + 0x0020], %r2
	.word 0xc5f2a01f  ! 909: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc282e064  ! 910: LDUWA_I	lduwa	[%r11, + 0x0064] %asi, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xce5ac01f  ! 911: LDX_R	ldx	[%r11 + %r31], %r7
	.word 0xcfbad99f  ! 912: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc8d2d03f  ! 913: LDSHA_R	ldsha	[%r11, %r31] 0x81, %r4
	.word 0xd0d2a02c  ! 914: LDSHA_I	ldsha	[%r10, + 0x002c] %asi, %r8
	.word 0xd1f2a01f  ! 915: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1f2a01f  ! 916: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd3baa028  ! 917: STDFA_I	stda	%f9, [0x0028, %r10]
	.word 0xd3ba993f  ! 918: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc79aa000  ! 919: LDDFA_I	ldda	[%r10, 0x0000], %f3
	.word 0xc24ac01f  ! 920: LDSB_R	ldsb	[%r11 + %r31], %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcf02801f  ! 921: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcfba981f  ! 922: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa000  ! 923: STD_I	std	%r6, [%r10 + 0x0000]
	.word 0xc7baa068  ! 924: STDFA_I	stda	%f3, [0x0068, %r10]
	.word 0xc7ba991f  ! 925: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL925:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc442c01f  ! 926: LDSW_R	ldsw	[%r11 + %r31], %r2
	.word 0xc5f2d11f  ! 927: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xc5f2e01f  ! 928: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5e2e01f  ! 929: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5f2e01f  ! 930: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5bad85f  ! 931: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad85f  ! 932: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad99f  ! 933: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc49aa010  ! 934: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r2
	.word 0xc7ba981f  ! 935: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7ba99bf  ! 936: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd052c01f  ! 937: LDSH_R	ldsh	[%r11 + %r31], %r8
	.word 0xd03ac01f  ! 938: STD_R	std	%r8, [%r11 + %r31]
	.word 0xc852a056  ! 939: LDSH_I	ldsh	[%r10 + 0x0056], %r4
	.word 0xc252801f  ! 940: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3ba989f  ! 941: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd082e024  ! 942: LDUWA_I	lduwa	[%r11, + 0x0024] %asi, %r8
	.word 0xc7bae078  ! 943: STDFA_I	stda	%f3, [0x0078, %r11]
	.word 0xc842a064  ! 944: LDSW_I	ldsw	[%r10 + 0x0064], %r4
	.word 0xc9e2901f  ! 945: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9e2a01f  ! 946: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9ba985f  ! 947: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2913f  ! 948: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc41a801f  ! 949: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xca52e03c  ! 950: LDSH_I	ldsh	[%r11 + 0x003c], %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd282a078  ! 951: LDUWA_I	lduwa	[%r10, + 0x0078] %asi, %r9
	.word 0xc442c01f  ! 952: LDSW_R	ldsw	[%r11 + %r31], %r2
	.word 0xcf02c01f  ! 953: LDF_R	ld	[%r11, %r31], %f7
	.word 0xc602a024  ! 954: LDUW_I	lduw	[%r10 + 0x0024], %r3
	.word 0xc7ba981f  ! 955: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc702e074  ! 956: LDF_I	ld	[%r11, 0x0074], %f3
	.word 0xc7bad93f  ! 957: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae070  ! 958: STD_I	std	%r2, [%r11 + 0x0070]
	.word 0xc7e2e01f  ! 959: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc39aa018  ! 960: LDDFA_I	ldda	[%r10, 0x0018], %f1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3ba99bf  ! 961: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 962: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc7baa008  ! 963: STDFA_I	stda	%f3, [0x0008, %r10]
	.word 0xc7ba995f  ! 964: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 965: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7ba981f  ! 966: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2901f  ! 967: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba983f  ! 968: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcd9aa048  ! 969: LDDFA_I	ldda	[%r10, 0x0048], %f6
	.word 0xcdf2a01f  ! 970: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdf2911f  ! 971: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcdba987f  ! 972: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc652a020  ! 973: LDSH_I	ldsh	[%r10 + 0x0020], %r3
	.word 0xc43aa020  ! 974: STD_I	std	%r2, [%r10 + 0x0020]
	.word 0xc7ba997f  ! 975: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL975:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7ba99bf  ! 976: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc8da917f  ! 977: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r4
	.word 0xc9ba981f  ! 978: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa020  ! 979: STD_I	std	%r4, [%r10 + 0x0020]
	.word 0xd05ae020  ! 980: LDX_I	ldx	[%r11 + 0x0020], %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcec2e058  ! 981: LDSWA_I	ldswa	[%r11, + 0x0058] %asi, %r7
	.word 0xcff2d01f  ! 982: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad9bf  ! 983: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d11f  ! 984: CASXA_I	casxa	[%r11] 0x88, %r31, %r7
	.word 0xc722c01f  ! 985: STF_R	st	%f3, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7f2e01f  ! 986: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad83f  ! 987: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc41ae068  ! 988: LDD_I	ldd	[%r11 + 0x0068], %r2
	.word 0xc7f2e01f  ! 989: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad81f  ! 990: STDFA_R	stda	%f3, [%r31, %r11]
TH_LABEL990:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7f2d01f  ! 991: CASXA_I	casxa	[%r11] 0x80, %r31, %r3
	.word 0xcbbae020  ! 992: STDFA_I	stda	%f5, [0x0020, %r11]
	.word 0xd39aa028  ! 993: LDDFA_I	ldda	[%r10, 0x0028], %f9
	.word 0xca12a036  ! 994: LDUH_I	lduh	[%r10 + 0x0036], %r5
	.word 0xd122801f  ! 995: STF_R	st	%f8, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1ba99bf  ! 996: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xce8a905f  ! 997: LDUBA_R	lduba	[%r10, %r31] 0x82, %r7
	.word 0xd24a801f  ! 998: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xd3ba995f  ! 999: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2911f  ! 1000: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	subcc %r30, 1, %r30
	bnz  TH0_LOOP_START
	nop

join_lbl_0_0:
main_text_end:
	ta %icc, T_GOOD_TRAP
	nop
	nop
	nop

main_data_start:
.xword 0x8dd29c4018f2c686
.xword 0x2078cc024aa87c50
.xword 0x02bbbe0692135c1f
.xword 0xc53d1b8244537832
.xword 0x6961706c9ab937db
.xword 0x4fd8cfe555383604
.xword 0x19584ee0433e95ca
.xword 0xba1022f426e9610b
.xword 0xa90a864db7ea5ffd
.xword 0x141eaf5625c682b0
.xword 0xbb14c6e77c589e24
.xword 0x0d8a63a9f2e84539
.xword 0xd2c81fc6435f4937
.xword 0x56afaccd958b6d38
.xword 0xf70d578481ab14ba
.xword 0x707dc8ac0f13c2fe
.xword 0x04c813ce6f17efcb
.xword 0x104f5d241fb0e03c
.xword 0xf5d9ffc122a0f218
.xword 0xe5b14c6c44e690b7
.xword 0xccdb30c851ad4dd6
.xword 0x2ccbb8dabc3dda7e
.xword 0x59a087f7938b9c4c
.xword 0x0baae67fb186bc00
.xword 0x521d7a7bbb001bb9
.xword 0xa741a32d5757034d
.xword 0xb472a3027f73965c
.xword 0xa755a7b2cc13ea0b
.xword 0x5110fd367dfbc985
.xword 0x03ecf368e5f12d81
.xword 0xb143f037d372524e
.xword 0xd08e63f97dc0d839



SECTION .CPPRI_SEG_0 DATA_VA = 0x0000005abcc00000
attr_data {
	Name	 = .CPPRI_SEG_0,
	VA	 = 0x0000005abcc00000,
	RA	 = 0x0000005123400000,
	PA	 = ra2pa(0x0000005123400000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CPPRI_DATA0_START
SEC_CPPRI_DATA0_START:
 attr_data {
 NAME = .CPPRI_SEG_0,
 hypervisor
}
.xword 0x92f2963f4155c291

.xword 0xd169ebf13e81d596

.xword 0x65273b84d6a460e4

.xword 0xa08af0d0fa4cbbbf

.xword 0x95f45da5ab028082

.xword 0x7d66b990d02f26bb

.xword 0x13454686b3963df9

.xword 0x094e325c656db671

.xword 0x4ec2f53b0d2295cd

.xword 0xef79ed2393758c82

.xword 0x17ed6c1308fb02ca

.xword 0x80508fd5ebfd4786

.xword 0x77d503ff3369ef76

.xword 0xc7ea2184e947a385

.xword 0xbc8c258d88cff7d6

.xword 0x55bfb65d9f9d15a9

.xword 0x4008
.xword 0x8010
.xword 0xc018
.xword 0x10020
.xword 0x14028
.xword 0x18030
.xword 0x1c038
.xword 0x4008



SECTION .CPPRI_SEG_1 DATA_VA = 0x0000005abcc04000
attr_data {
	Name	 = .CPPRI_SEG_1,
	VA	 = 0x0000005abcc04000,
	RA	 = 0x0000005123402000,
	PA	 = ra2pa(0x0000005123402000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CPPRI_DATA1_START
SEC_CPPRI_DATA1_START:
 attr_data {
 NAME = .CPPRI_SEG_1,
 hypervisor
}
.xword 0x2bee2b972cb4bc08
.xword 0x82aeed12ab608b63
.xword 0x5e014fc6815c2928
.xword 0x88c16f26a0f3c131
.xword 0x315e456b8262e16b
.xword 0x961559dade8082e9
.xword 0x180f396a797fd7c7
.xword 0xe200f21db8e1b599
.xword 0xc58e4790d6e76f31




SECTION .CPPRI_SEG_2 DATA_VA = 0x0000005abcc08000
attr_data {
	Name	 = .CPPRI_SEG_2,
	VA	 = 0x0000005abcc08000,
	RA	 = 0x0000005123404000,
	PA	 = ra2pa(0x0000005123404000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CPPRI_DATA2_START
SEC_CPPRI_DATA2_START:
 attr_data {
 NAME = .CPPRI_SEG_2,
 hypervisor
}
.xword 0x8bef9d7ed646f4c2
.xword 0xed393bc0ef6c7786
.xword 0xd65e09527a9b9eee
.xword 0x7c6b28ff27961fcf
.xword 0xafc000b713a6c012
.xword 0x5e8c359c58c65b5e
.xword 0x108678068e79595b
.xword 0x6142565d006d80e1
.xword 0x48f76feffe90f779




SECTION .CPPRI_SEG_3 DATA_VA = 0x0000005abcc0c000
attr_data {
	Name	 = .CPPRI_SEG_3,
	VA	 = 0x0000005abcc0c000,
	RA	 = 0x0000005123406000,
	PA	 = ra2pa(0x0000005123406000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CPPRI_DATA3_START
SEC_CPPRI_DATA3_START:
 attr_data {
 NAME = .CPPRI_SEG_3,
 hypervisor
}
.xword 0x1c74c4234cb9bc7b
.xword 0x027a2130eb731b1e
.xword 0xfdc81be68b530841
.xword 0x02ca1fa2f0618c8a
.xword 0xda265e8104fe3e76
.xword 0x69bdb8f5a494054a
.xword 0x52085f2dbdc46263
.xword 0xe709d2b3c7aa466a
.xword 0x91819c9932ad41af




SECTION .CPPRI_SEG_4 DATA_VA = 0x0000005abcc10000
attr_data {
	Name	 = .CPPRI_SEG_4,
	VA	 = 0x0000005abcc10000,
	RA	 = 0x0000005123408000,
	PA	 = ra2pa(0x0000005123408000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CPPRI_DATA4_START
SEC_CPPRI_DATA4_START:
 attr_data {
 NAME = .CPPRI_SEG_4,
 hypervisor
}
.xword 0x7fbf1f6d1db49637
.xword 0xc1066d603d86eaad
.xword 0xc2f87f4a3a83c2f2
.xword 0xbf0ca9b1b0e27baa
.xword 0x2d4d4c292b75150c
.xword 0x91e22a943d8431c8
.xword 0x038ffb3b200b3e30
.xword 0xe39838a9f490d89a
.xword 0xd9441f6f36f04ebc




SECTION .CPPRI_SEG_5 DATA_VA = 0x0000005abcc14000
attr_data {
	Name	 = .CPPRI_SEG_5,
	VA	 = 0x0000005abcc14000,
	RA	 = 0x000000512340a000,
	PA	 = ra2pa(0x000000512340a000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CPPRI_DATA5_START
SEC_CPPRI_DATA5_START:
 attr_data {
 NAME = .CPPRI_SEG_5,
 hypervisor
}
.xword 0x2c75379ccdb9fd04
.xword 0xeaf68ea2b40e467a
.xword 0xe2e96e0bc713fd84
.xword 0xb0abcdca16581c9c
.xword 0xaef484d6e1ed401b
.xword 0x1b005d9e5a93de9c
.xword 0x65c3bca39895411b
.xword 0xe9d071544ca798ff
.xword 0x943e49a30971da3a




SECTION .CPPRI_SEG_6 DATA_VA = 0x0000005abcc18000
attr_data {
	Name	 = .CPPRI_SEG_6,
	VA	 = 0x0000005abcc18000,
	RA	 = 0x000000512340c000,
	PA	 = ra2pa(0x000000512340c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CPPRI_DATA6_START
SEC_CPPRI_DATA6_START:
 attr_data {
 NAME = .CPPRI_SEG_6,
 hypervisor
}
.xword 0x5c32696bd8093064
.xword 0xf5567cad688b072c
.xword 0xd65c8963ababfe43
.xword 0x77f160952ee400ec
.xword 0x2d14a5952512d421
.xword 0x9af9baa00bf4147f
.xword 0x3555a5279c700769
.xword 0x11557c424dc66b79
.xword 0xac5ca6a8a4436c1a




SECTION .CPPRI_SEG_7 DATA_VA = 0x0000005abcc1c000
attr_data {
	Name	 = .CPPRI_SEG_7,
	VA	 = 0x0000005abcc1c000,
	RA	 = 0x000000512340e000,
	PA	 = ra2pa(0x000000512340e000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_CPPRI_DATA7_START
SEC_CPPRI_DATA7_START:
 attr_data {
 NAME = .CPPRI_SEG_7,
 hypervisor
}
.xword 0x2755d405f7e47bb2
.xword 0x748f318bd979eaf7
.xword 0x411d7808918b47c1
.xword 0xb6a54cc89eb9c25f
.xword 0x627f71e9a8120862
.xword 0xb983df579c574c79
.xword 0xaa9e60b8ed8dbe36
.xword 0x85ce66d53f863c53
.xword 0xb3da2a2db9594511






SECTION .NCPRI_SEG_0 DATA_VA = 0x0000006def280000
attr_data {
	Name	 = .NCPRI_SEG_0,
	VA	 = 0x0000006def280000,
	RA	 = 0x0000003123400000,
	PA	 = ra2pa(0x0000003123400000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA0_START
SEC_NCPRI_DATA0_START:
 attr_data {
 NAME = .NCPRI_SEG_0,
 hypervisor
}
.xword 0x85c612c3ff222c65

.xword 0xccf3f848d486340e

.xword 0x3b8427618e27d696

.xword 0x09ad5049c7f18687

.xword 0x4a74bfa6c65561aa

.xword 0x69d05b764d1be352

.xword 0x5e3f644ad78ddce1

.xword 0xc2e1567d9b973a42

.xword 0x1765a2c5491fc2f0

.xword 0x6466d7b90357ae1e

.xword 0x5a0cb96d67799856

.xword 0x82895e9e1189bc23

.xword 0x59d8f89c3d3066ec

.xword 0xa5f3354683e97091

.xword 0x81140f77c772eedf

.xword 0xdf95cb3d35c60717




SECTION .NCPRI_SEG_1 DATA_VA = 0x0000006def284000
attr_data {
	Name	 = .NCPRI_SEG_1,
	VA	 = 0x0000006def284000,
	RA	 = 0x0000003123402000,
	PA	 = ra2pa(0x0000003123402000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA1_START
SEC_NCPRI_DATA1_START:
 attr_data {
 NAME = .NCPRI_SEG_1,
 hypervisor
}
.xword 0xe36d991c6488c415
.xword 0x0eb524de48a46e5b
.xword 0x5b64e25c26e86db9
.xword 0xae74f85aa1a35e5f
.xword 0x0614efe1bcdff2f3
.xword 0x2e39dab9d49ad7b2
.xword 0xcdcca450b771f859
.xword 0x2435cdc25ecea071



SECTION .NCPRI_SEG_2 DATA_VA = 0x0000006def288000
attr_data {
	Name	 = .NCPRI_SEG_2,
	VA	 = 0x0000006def288000,
	RA	 = 0x0000003123404000,
	PA	 = ra2pa(0x0000003123404000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA2_START
SEC_NCPRI_DATA2_START:
 attr_data {
 NAME = .NCPRI_SEG_2,
 hypervisor
}
.xword 0xf0f6ae34ccc12d33
.xword 0x8323b26e9ee7c654
.xword 0x879fd03c3cc92975
.xword 0x558c04b62458e2de
.xword 0x1410912abbc81036
.xword 0xa6a235bac1bd7121
.xword 0xf3f8b50bdb55841a
.xword 0xcbcfeb5db6794da0



SECTION .NCPRI_SEG_3 DATA_VA = 0x0000006def28c000
attr_data {
	Name	 = .NCPRI_SEG_3,
	VA	 = 0x0000006def28c000,
	RA	 = 0x0000003123406000,
	PA	 = ra2pa(0x0000003123406000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA3_START
SEC_NCPRI_DATA3_START:
 attr_data {
 NAME = .NCPRI_SEG_3,
 hypervisor
}
.xword 0xa96e06bd7d05ddac
.xword 0x8de5f8b77e139bf0
.xword 0xf5ee7f8c809ddde3
.xword 0x3e82a38a84e436af
.xword 0xd6bf210570b41a98
.xword 0x605ce9e3b6494310
.xword 0xcd8d0d64a2380937
.xword 0x168baf7c84b0f899



SECTION .NCPRI_SEG_4 DATA_VA = 0x0000006def290000
attr_data {
	Name	 = .NCPRI_SEG_4,
	VA	 = 0x0000006def290000,
	RA	 = 0x0000003123408000,
	PA	 = ra2pa(0x0000003123408000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA4_START
SEC_NCPRI_DATA4_START:
 attr_data {
 NAME = .NCPRI_SEG_4,
 hypervisor
}
.xword 0x318ec18259551e1d
.xword 0x221d4cefe1223978
.xword 0xf11b691831211462
.xword 0xbbb4156704db57b6
.xword 0x54eb559939699558
.xword 0xfc5428381b7ad34a
.xword 0xdf90090a598db824
.xword 0x37cf74f088fb6f80



SECTION .NCPRI_SEG_5 DATA_VA = 0x0000006def294000
attr_data {
	Name	 = .NCPRI_SEG_5,
	VA	 = 0x0000006def294000,
	RA	 = 0x000000312340a000,
	PA	 = ra2pa(0x000000312340a000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA5_START
SEC_NCPRI_DATA5_START:
 attr_data {
 NAME = .NCPRI_SEG_5,
 hypervisor
}
.xword 0xbb08a3c37553a1d1
.xword 0x762e3b32df339f6b
.xword 0xe077517e443d8055
.xword 0x46a4a6dc2b747984
.xword 0xb22981b97a10bcab
.xword 0x29bd25cf2e3fcca2
.xword 0xb2bf8920e2a7e595
.xword 0x6df606c3291c961e



SECTION .NCPRI_SEG_6 DATA_VA = 0x0000006def298000
attr_data {
	Name	 = .NCPRI_SEG_6,
	VA	 = 0x0000006def298000,
	RA	 = 0x000000312340c000,
	PA	 = ra2pa(0x000000312340c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA6_START
SEC_NCPRI_DATA6_START:
 attr_data {
 NAME = .NCPRI_SEG_6,
 hypervisor
}
.xword 0x3f68c83dea75f496
.xword 0xfa3fa50d1321150d
.xword 0x81adaedb976e77fc
.xword 0xae98177c1ff22a62
.xword 0xc9da7b0e00a4951c
.xword 0x3a401b022ffbc840
.xword 0x4da57892cb31471b
.xword 0x3a8033c27fb58e51



SECTION .NCPRI_SEG_7 DATA_VA = 0x0000006def29c000
attr_data {
	Name	 = .NCPRI_SEG_7,
	VA	 = 0x0000006def29c000,
	RA	 = 0x000000312340e000,
	PA	 = ra2pa(0x000000312340e000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global SEC_NCPRI_DATA7_START
SEC_NCPRI_DATA7_START:
 attr_data {
 NAME = .NCPRI_SEG_7,
 hypervisor
}
.xword 0xcc26b03cee0d7037
.xword 0x7e5dd37e7b383d19
.xword 0xc738477a2478563b
.xword 0x8a7e737cd137389a
.xword 0xc948cdd6a2b8f061
.xword 0x23a8a56ba14a80f9
.xword 0x3ce1fffa6875a4be
.xword 0x3ff4b9671e2c1c8d





SECTION .CPGOLD_SEG_0 DATA_VA = 0x0000007def300000
attr_data {
	Name	 = .CPGOLD_SEG_0,
	VA	 = 0x0000007def300000,
	RA	 = 0x0000006bff300000,
	PA	 = ra2pa(0x0000006bff300000,0),
	part_0_ctx_zero_tsb_config_1,
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

 attr_data {
 NAME = .CPGOLD_SEG_0,
 hypervisor
}
.data
.global SEC_CPGOLD_DATA0_START
SEC_CPGOLD_DATA0_START:
.xword 0xf68599b7dd8dcf64

.xword 0x84bb1d1aa4bb1a7e

.xword 0x44af2673d9880665

.xword 0xcb0e479957032f13

.xword 0xbcd140f477e25300

.xword 0x22a3a3192cbe02b9

.xword 0xbf0b775ddad1a9e6

.xword 0x1bab52e7e2638ab3

.xword 0x22dfc3795b3c937c

.xword 0xf830a1813a1a40ee

.xword 0x2a1600a74f5d5e54

.xword 0x93a9aeb5cd0c5321

.xword 0x7ac3a9dadf8c7913

.xword 0x1f8134c9214c0d4d

.xword 0xe18b2087c41333d3

.xword 0xcdf58862099b6f69

.xword 0xfee0de64d534ecff

.xword 0xfa4738060aaf2ea0

.xword 0xd3925a0dbdaddee9

.xword 0xbc38d238d64bdf85

.xword 0x75951c34b21714ab

.xword 0x450efc93833961a1

.xword 0xf6b99206bab9893d

.xword 0xf2d7964e15303ba9

.xword 0x2fde1f4d3f358970

.xword 0xa87adff72291878b

.xword 0x52c992f6efb69d9a

.xword 0xad52d2615d63b4bf

.xword 0xe4b8d97d487aafea

.xword 0x030945502e87488e

.xword 0xd14cb7ad04b51df5

.xword 0x015a25892a13a8ae

.xword 0x14cae36d42c44e54

.xword 0x7d363abb9011308a

.xword 0x363f1986949a69a9

.xword 0x2e403c7c000bb262

.xword 0x71fff641b64d5b8d

.xword 0xa88a737d8580cfad

.xword 0x5c28e1b10a550a39

.xword 0xcc85862670c98070

.xword 0xefd29d1a383fa118

.xword 0x4cd0cd2a7de510b7

.xword 0x4dcf5c0cc3592e93

.xword 0x5b46d35e00a890f3

.xword 0x1da107cc43f7ec00

.xword 0x39a367babef384fb

.xword 0x14a5ef2d2dd79686

.xword 0xe931ccba74242420

.xword 0x9effcc0bc98e551b

.xword 0x5d04120d5e43f3a6

.xword 0x8777c9f5131bf061

.xword 0x41942d0049a781cb

.xword 0x7384804349c6160b

.xword 0x9af79348e94e9a19

.xword 0x67b01df1922852a1

.xword 0x1ecc9855e3713bf8

.xword 0x10803c883bc8f1ca

.xword 0xebdf7d317ac3dccc

.xword 0xb93cc59f4aad534f

.xword 0x35134ba0d3857e58

.xword 0xb1a1182948cce99e

.xword 0x31c1842dcac4b229

.xword 0x48a355653e717f04

.xword 0xf1ea3bb914a617b0

.xword 0xf37c9dce863e6f3c

.xword 0x02a2f2701a7e988d

.xword 0x79e681a2adf5ee99

.xword 0xda3355d1348494b7

.xword 0xedd6593c4988731d

.xword 0xa259bf6b1f37e063

.xword 0xecdfa749a34f5a96

.xword 0x70a7c99588dc18d3

.xword 0x736a37f7bc3c7811

.xword 0xf1a309914988fe82

.xword 0xba09280fc73f9e2c

.xword 0x131ffefb97dd03b3

.xword 0x302a4757a16871ea

.xword 0x934cdac1b847d11c

.xword 0x8dcd3fe04e8eb7b9

.xword 0x2347b002cdd847b7

.xword 0x8c8035beef4eca48

.xword 0x8cf55ff72ba037a6

.xword 0xbecd9c5c99332bce

.xword 0x018c007de1f19bbb

.xword 0xbde4d500eec3ae08

.xword 0xa10788125606e795

.xword 0x8b5e99e76e5ed6f6

.xword 0x182883bc41be44e3

.xword 0x5b0e636612237088

.xword 0x898c464b9cb44eb3

.xword 0x604e6c0cd77fbcec

.xword 0x54882b8346e4be1e

.xword 0x20c327ed6dda9207

.xword 0x4b8a14b7500284ea

.xword 0x4440517c3caef067

.xword 0x9e1d3df89c69b545

.xword 0x66e235966709f4f4

.xword 0x95ffc5918e66bd21

.xword 0xee22a0c333381094

.xword 0x3fdc143ef1945a6b

.xword 0x63a8363a3884c2c2

.xword 0x32342871dc45548b

.xword 0x07b790490ad537d9

.xword 0x86a84db25566540d

.xword 0x675028f82a85a563

.xword 0x655ddfac061dd7df

.xword 0xa52d547bac378aa2

.xword 0xb2c3becaa7e85da5

.xword 0xcc9d62f20a2360f0

.xword 0x81df6b599b046928

.xword 0xccecde3a60156b25

.xword 0xf6ad643ecb660e0d

.xword 0x8cf0b913f3078109

.xword 0x56af018aa6d7b336

.xword 0x4d59e3270144b179

.xword 0xf43b1859a631a717

.xword 0xf15bb96e62b5a3d8

.xword 0xf10ce1ba0f209e7b

.xword 0x1f2a3eb2fdc52f51

.xword 0x4993377ded0540b1

.xword 0x891c0299724e1abf

.xword 0xec88138be4abed18

.xword 0x33d822701c5232c3

.xword 0x157841892278a86e

.xword 0x933b505e7f81e0ae

.xword 0xa419a48b1227611d

.xword 0x55c0337771052360

.xword 0x5aa361c37a308512

.xword 0x4008
.xword 0x8010
.xword 0xc018
.xword 0x10020
.xword 0x14028
.xword 0x18030
.xword 0x1c038
.xword 0x4008
.xword 0x4028
.xword 0x8038
.xword 0xc020
.xword 0x10030
.xword 0x14038
.xword 0x18020
.xword 0x1c028
.xword 0x4038



#if 0
#endif
