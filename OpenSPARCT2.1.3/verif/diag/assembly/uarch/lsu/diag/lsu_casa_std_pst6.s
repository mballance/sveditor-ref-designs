/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: lsu_casa_std_pst6.s
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
	setx 0x2cea393ede1f7c8d, %g1, %r2
	setx 0x37e75a1d26112ad4, %g1, %r3
	setx 0x4886aa9ee52131d8, %g1, %r4
	setx 0x8b2877a2d0ba83a5, %g1, %r5
	setx 0x15c81f394e55350f, %g1, %r6
	setx 0x3c116c4926b0de80, %g1, %r7
	setx 0xbabda70ab5b6a16e, %g1, %r8

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
	.word 0xc9ba997f  ! 1: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba98bf  ! 2: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd292913f  ! 3: LDUHA_R	lduha	[%r10, %r31] 0x89, %r9
	.word 0xca12a018  ! 4: LDUH_I	lduh	[%r10 + 0x0018], %r5
	.word 0xd1baa060  ! 5: STDFA_I	stda	%f8, [0x0060, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc0a801f  ! 6: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xcfba987f  ! 7: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc5bae040  ! 8: STDFA_I	stda	%f2, [0x0040, %r11]
	.word 0xc9bae010  ! 9: STDFA_I	stda	%f4, [0x0010, %r11]
	.word 0xcdf2903f  ! 10: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd242801f  ! 11: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xc9bad89f  ! 12: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xca0aa073  ! 13: LDUB_I	ldub	[%r10 + 0x0073], %r5
	.word 0xcbf2e01f  ! 14: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad81f  ! 15: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbbad93f  ! 16: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 17: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad97f  ! 18: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad83f  ! 19: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad89f  ! 20: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc85aa040  ! 21: LDX_I	ldx	[%r10 + 0x0040], %r4
	.word 0xc7ba997f  ! 22: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcf02a058  ! 23: LDF_I	ld	[%r10, 0x0058], %f7
	.word 0xd082901f  ! 24: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r8
	.word 0xc5f2901f  ! 25: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5f2a01f  ! 26: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xcf9aa018  ! 27: LDDFA_I	ldda	[%r10, 0x0018], %f7
	.word 0xc7f2913f  ! 28: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba997f  ! 29: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 30: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc8ca915f  ! 31: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r4
	.word 0xd102801f  ! 32: LDF_R	ld	[%r10, %r31], %f8
	.word 0xcdba981f  ! 33: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 34: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 35: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd292915f  ! 36: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r9
	.word 0xc9ba995f  ! 37: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 38: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2901f  ! 39: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba999f  ! 40: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd102801f  ! 41: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc7f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7e2a01f  ! 43: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xcb9ae070  ! 44: LDDFA_I	ldda	[%r11, 0x0070], %f5
	.word 0xd25a801f  ! 45: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcedad13f  ! 46: LDXA_R	ldxa	[%r11, %r31] 0x89, %r7
	.word 0xcfe2911f  ! 47: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcfe2a01f  ! 48: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba987f  ! 49: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd282913f  ! 50: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3bad81f  ! 51: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 52: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad85f  ! 53: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xca82a00c  ! 54: LDUWA_I	lduwa	[%r10, + 0x000c] %asi, %r5
	.word 0xc81aa070  ! 55: LDD_I	ldd	[%r10 + 0x0070], %r4
TH_LABEL55:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7bad91f  ! 56: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad85f  ! 57: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xce42801f  ! 58: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xcccaa073  ! 59: LDSBA_I	ldsba	[%r10, + 0x0073] %asi, %r6
	.word 0xcf02801f  ! 60: LDF_R	ld	[%r10, %r31], %f7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3ba983f  ! 61: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc8dae038  ! 62: LDXA_I	ldxa	[%r11, + 0x0038] %asi, %r4
	.word 0xcc3ae060  ! 63: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xd0da907f  ! 64: LDXA_R	ldxa	[%r10, %r31] 0x83, %r8
	.word 0xc5f2903f  ! 65: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5ba991f  ! 66: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 67: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xce8ae00d  ! 68: LDUBA_I	lduba	[%r11, + 0x000d] %asi, %r7
	.word 0xc7f2a01f  ! 69: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba983f  ! 70: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7e2901f  ! 71: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba983f  ! 72: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 73: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 74: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd28aa06b  ! 75: LDUBA_I	lduba	[%r10, + 0x006b] %asi, %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc43ae000  ! 76: STD_I	std	%r2, [%r11 + 0x0000]
	.word 0xc5f2d01f  ! 77: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc5f2e01f  ! 78: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc43ac01f  ! 79: STD_R	std	%r2, [%r11 + %r31]
	.word 0xcc9ae058  ! 80: LDDA_I	ldda	[%r11, + 0x0058] %asi, %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc03ae000  ! 81: STD_I	std	%r0, [%r11 + 0x0000]
	.word 0xd20aa047  ! 82: LDUB_I	ldub	[%r10 + 0x0047], %r9
	.word 0xc83a801f  ! 83: STD_R	std	%r4, [%r10 + %r31]
	.word 0xca82907f  ! 84: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r5
	.word 0xcbba989f  ! 85: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbf2911f  ! 86: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xcedad01f  ! 87: LDXA_R	ldxa	[%r11, %r31] 0x80, %r7
	.word 0xc922c01f  ! 88: STF_R	st	%f4, [%r31, %r11]
	.word 0xcc5a801f  ! 89: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xc3e2901f  ! 90: CASA_I	casa	[%r10] 0x80, %r31, %r1
TH_LABEL90:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc03a801f  ! 91: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3ba995f  ! 92: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 93: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc68a901f  ! 94: LDUBA_R	lduba	[%r10, %r31] 0x80, %r3
	.word 0xc612a028  ! 95: LDUH_I	lduh	[%r10 + 0x0028], %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc1ac01f  ! 96: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xc24a801f  ! 97: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xc43ae050  ! 98: STD_I	std	%r2, [%r11 + 0x0050]
	.word 0xc43ae050  ! 99: STD_I	std	%r2, [%r11 + 0x0050]
	.word 0xd0d2d05f  ! 100: LDSHA_R	ldsha	[%r11, %r31] 0x82, %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc402801f  ! 101: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xd082a038  ! 102: LDUWA_I	lduwa	[%r10, + 0x0038] %asi, %r8
	.word 0xc3f2901f  ! 103: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3e2a01f  ! 104: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba995f  ! 105: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3e2a01f  ! 106: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba999f  ! 107: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 108: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba997f  ! 109: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba985f  ! 110: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd302a024  ! 111: LDF_I	ld	[%r10, 0x0024], %f9
	.word 0xc43ae038  ! 112: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xc43ac01f  ! 113: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae038  ! 114: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xc43ae038  ! 115: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xca0aa00a  ! 116: LDUB_I	ldub	[%r10 + 0x000a], %r5
	.word 0xd1ba999f  ! 117: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 118: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc88ae005  ! 119: LDUBA_I	lduba	[%r11, + 0x0005] %asi, %r4
	.word 0xc7baa040  ! 120: STDFA_I	stda	%f3, [0x0040, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9f2911f  ! 121: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc9f2903f  ! 122: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc9ba995f  ! 123: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 124: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2913f  ! 125: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9ba99bf  ! 126: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba997f  ! 127: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc42801f  ! 128: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xc9e2e01f  ! 129: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xd19ae000  ! 130: LDDFA_I	ldda	[%r11, 0x0000], %f8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfe2a01f  ! 131: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xce8aa069  ! 132: LDUBA_I	lduba	[%r10, + 0x0069] %asi, %r7
	.word 0xcc3aa028  ! 133: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xcc3a801f  ! 134: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc09aa028  ! 135: LDDA_I	ldda	[%r10, + 0x0028] %asi, %r0
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3f2e01f  ! 136: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc612801f  ! 137: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xcdba985f  ! 138: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba997f  ! 139: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 140: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
TH_LABEL140:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd05a801f  ! 141: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xcbba989f  ! 142: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2901f  ! 143: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbba981f  ! 144: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba987f  ! 145: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbf2a01f  ! 146: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xd052a05e  ! 147: LDSH_I	ldsh	[%r10 + 0x005e], %r8
	.word 0xce02801f  ! 148: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xcdba991f  ! 149: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba98bf  ! 150: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd102a074  ! 151: LDF_I	ld	[%r10, 0x0074], %f8
	.word 0xc28ad13f  ! 152: LDUBA_R	lduba	[%r11, %r31] 0x89, %r1
	.word 0xc302e03c  ! 153: LDF_I	ld	[%r11, 0x003c], %f1
	.word 0xcf9ae010  ! 154: LDDFA_I	ldda	[%r11, 0x0010], %f7
	.word 0xc3ba993f  ! 155: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc03a801f  ! 156: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3f2901f  ! 157: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3f2903f  ! 158: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba999f  ! 159: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc502a030  ! 160: LDF_I	ld	[%r10, 0x0030], %f2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc1a801f  ! 161: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc3baa068  ! 162: STDFA_I	stda	%f1, [0x0068, %r10]
	.word 0xd302a068  ! 163: LDF_I	ld	[%r10, 0x0068], %f9
	.word 0xccd2a06e  ! 164: LDSHA_I	ldsha	[%r10, + 0x006e] %asi, %r6
	.word 0xc64ac01f  ! 165: LDSB_R	ldsb	[%r11 + %r31], %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3ba981f  ! 166: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 167: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc60ac01f  ! 168: LDUB_R	ldub	[%r11 + %r31], %r3
	.word 0xcf22801f  ! 169: STF_R	st	%f7, [%r31, %r10]
	.word 0xd1f2911f  ! 170: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03aa028  ! 171: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd03a801f  ! 172: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba981f  ! 173: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba985f  ! 174: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 175: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL175:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1f2a01f  ! 176: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2901f  ! 177: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xcc42a008  ! 178: LDSW_I	ldsw	[%r10 + 0x0008], %r6
	.word 0xcbe2d03f  ! 179: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xd28ad17f  ! 180: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbe2a01f  ! 181: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc83a801f  ! 182: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba981f  ! 183: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2901f  ! 184: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xd39aa038  ! 185: LDDFA_I	ldda	[%r10, 0x0038], %f9
TH_LABEL185:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcb02e01c  ! 186: LDF_I	ld	[%r11, 0x001c], %f5
	.word 0xd1bad9bf  ! 187: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae060  ! 188: STD_I	std	%r8, [%r11 + 0x0060]
	.word 0xc402c01f  ! 189: LDUW_R	lduw	[%r11 + %r31], %r2
	.word 0xd1bad8bf  ! 190: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1bad8bf  ! 191: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad91f  ! 192: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc812a04e  ! 193: LDUH_I	lduh	[%r10 + 0x004e], %r4
	.word 0xcc42801f  ! 194: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xc9ba987f  ! 195: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9ba981f  ! 196: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 197: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba987f  ! 198: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba997f  ! 199: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2911f  ! 200: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc8d2a070  ! 201: LDSHA_I	ldsha	[%r10, + 0x0070] %asi, %r4
	.word 0xd1ba997f  ! 202: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc292e07a  ! 203: LDUHA_I	lduha	[%r11, + 0x007a] %asi, %r1
	.word 0xc5bad97f  ! 204: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 205: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5e2d11f  ! 206: CASA_I	casa	[%r11] 0x88, %r31, %r2
	.word 0xc5baa058  ! 207: STDFA_I	stda	%f2, [0x0058, %r10]
	.word 0xc9ba991f  ! 208: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc79aa028  ! 209: LDDFA_I	ldda	[%r10, 0x0028], %f3
	.word 0xc68ad03f  ! 210: LDUBA_R	lduba	[%r11, %r31] 0x81, %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5ba99bf  ! 211: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 212: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd092d05f  ! 213: LDUHA_R	lduha	[%r11, %r31] 0x82, %r8
	.word 0xc7ba993f  ! 214: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc322801f  ! 215: STF_R	st	%f1, [%r31, %r10]
TH_LABEL215:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3ba98bf  ! 216: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcec2915f  ! 217: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r7
	.word 0xcde2901f  ! 218: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xcdba995f  ! 219: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2913f  ! 220: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdba989f  ! 221: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 222: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2903f  ! 223: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xd39aa060  ! 224: LDDFA_I	ldda	[%r10, 0x0060], %f9
	.word 0xd012c01f  ! 225: LDUH_R	lduh	[%r11 + %r31], %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc502a068  ! 226: LDF_I	ld	[%r10, 0x0068], %f2
	.word 0xd2c2a060  ! 227: LDSWA_I	ldswa	[%r10, + 0x0060] %asi, %r9
	.word 0xc282911f  ! 228: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r1
	.word 0xd09ae020  ! 229: LDDA_I	ldda	[%r11, + 0x0020] %asi, %r8
	.word 0xd3baa020  ! 230: STDFA_I	stda	%f9, [0x0020, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcac2d01f  ! 231: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r5
	.word 0xd0da907f  ! 232: LDXA_R	ldxa	[%r10, %r31] 0x83, %r8
	.word 0xc81aa040  ! 233: LDD_I	ldd	[%r10 + 0x0040], %r4
	.word 0xcc1a801f  ! 234: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc9f2911f  ! 235: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9ba995f  ! 236: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 237: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 238: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2a01f  ! 239: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2a01f  ! 240: CASXA_R	casxa	[%r10]%asi, %r31, %r4
TH_LABEL240:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc902801f  ! 241: LDF_R	ld	[%r10, %r31], %f4
	.word 0xcfe2a01f  ! 242: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd252801f  ! 243: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xd2c2907f  ! 244: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r9
	.word 0xc252801f  ! 245: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7ba981f  ! 246: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba995f  ! 247: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 248: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba985f  ! 249: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 250: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7f2913f  ! 251: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc7f2a01f  ! 252: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba997f  ! 253: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 254: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba995f  ! 255: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9baa020  ! 256: STDFA_I	stda	%f4, [0x0020, %r10]
	.word 0xc6caa056  ! 257: LDSBA_I	ldsba	[%r10, + 0x0056] %asi, %r3
	.word 0xc2c2a00c  ! 258: LDSWA_I	ldswa	[%r10, + 0x000c] %asi, %r1
	.word 0xca8aa01f  ! 259: LDUBA_I	lduba	[%r10, + 0x001f] %asi, %r5
	.word 0xc692917f  ! 260: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfba987f  ! 261: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba995f  ! 262: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2911f  ! 263: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcfba99bf  ! 264: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc612e058  ! 265: LDUH_I	lduh	[%r11 + 0x0058], %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd03aa068  ! 266: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xd3e2a01f  ! 267: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc2caa031  ! 268: LDSBA_I	ldsba	[%r10, + 0x0031] %asi, %r1
	.word 0xcdf2913f  ! 269: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcc42c01f  ! 270: LDSW_R	ldsw	[%r11 + %r31], %r6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc4d2a014  ! 271: LDSHA_I	ldsha	[%r10, + 0x0014] %asi, %r2
	.word 0xcc3a801f  ! 272: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd0cad07f  ! 273: LDSBA_R	ldsba	[%r11, %r31] 0x83, %r8
	.word 0xc3e2d11f  ! 274: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xc3bad95f  ! 275: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc28aa053  ! 276: LDUBA_I	lduba	[%r10, + 0x0053] %asi, %r1
	.word 0xc2d2d07f  ! 277: LDSHA_R	ldsha	[%r11, %r31] 0x83, %r1
	.word 0xc412c01f  ! 278: LDUH_R	lduh	[%r11 + %r31], %r2
	.word 0xc5e2901f  ! 279: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba981f  ! 280: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL280:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd322801f  ! 281: STF_R	st	%f9, [%r31, %r10]
	.word 0xd3ba985f  ! 282: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc612c01f  ! 283: LDUH_R	lduh	[%r11 + %r31], %r3
	.word 0xc43ac01f  ! 284: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 285: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcf9ae030  ! 286: LDDFA_I	ldda	[%r11, 0x0030], %f7
	.word 0xcc92917f  ! 287: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r6
	.word 0xc80ac01f  ! 288: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xc502e060  ! 289: LDF_I	ld	[%r11, 0x0060], %f2
	.word 0xd03a801f  ! 290: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3ba995f  ! 291: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba983f  ! 292: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd08a901f  ! 293: LDUBA_R	lduba	[%r10, %r31] 0x80, %r8
	.word 0xcbf2e01f  ! 294: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcb02a004  ! 295: LDF_I	ld	[%r10, 0x0004], %f5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcada907f  ! 296: LDXA_R	ldxa	[%r10, %r31] 0x83, %r5
	.word 0xcbba99bf  ! 297: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba99bf  ! 298: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 299: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba981f  ! 300: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbba985f  ! 301: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd212801f  ! 302: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xc5ba983f  ! 303: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 304: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba999f  ! 305: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL305:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5e2913f  ! 306: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xcc8ad05f  ! 307: LDUBA_R	lduba	[%r11, %r31] 0x82, %r6
	.word 0xd002801f  ! 308: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xcdba999f  ! 309: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 310: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdf2a01f  ! 311: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba981f  ! 312: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba997f  ! 313: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba991f  ! 314: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba997f  ! 315: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcde2a01f  ! 316: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba991f  ! 317: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 318: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xc652801f  ! 319: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xc7ba981f  ! 320: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7ba997f  ! 321: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 322: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 323: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 324: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xccc2903f  ! 325: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r6
TH_LABEL325:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcac2a038  ! 326: LDSWA_I	ldswa	[%r10, + 0x0038] %asi, %r5
	.word 0xd3f2d01f  ! 327: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd302c01f  ! 328: LDF_R	ld	[%r11, %r31], %f9
	.word 0xc79ae050  ! 329: LDDFA_I	ldda	[%r11, 0x0050], %f3
	.word 0xcc8aa06a  ! 330: LDUBA_I	lduba	[%r10, + 0x006a] %asi, %r6
TH_LABEL330:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9e2911f  ! 331: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba981f  ! 332: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc6d2a072  ! 333: LDSHA_I	ldsha	[%r10, + 0x0072] %asi, %r3
	.word 0xc322801f  ! 334: STF_R	st	%f1, [%r31, %r10]
	.word 0xc41ae060  ! 335: LDD_I	ldd	[%r11 + 0x0060], %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xccc2a054  ! 336: LDSWA_I	ldswa	[%r10, + 0x0054] %asi, %r6
	.word 0xd1ba98bf  ! 337: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 338: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 339: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 340: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc6d2a04e  ! 341: LDSHA_I	ldsha	[%r10, + 0x004e] %asi, %r3
	.word 0xcfbad95f  ! 342: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc25a801f  ! 343: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xce42a034  ! 344: LDSW_I	ldsw	[%r10 + 0x0034], %r7
	.word 0xc3f2e01f  ! 345: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3bad9bf  ! 346: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd2c2a060  ! 347: LDSWA_I	ldswa	[%r10, + 0x0060] %asi, %r9
	.word 0xc03ac01f  ! 348: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad91f  ! 349: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d13f  ! 350: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc412e06e  ! 351: LDUH_I	lduh	[%r11 + 0x006e], %r2
	.word 0xd242801f  ! 352: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xcfbad81f  ! 353: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ae030  ! 354: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcff2d03f  ! 355: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc3ae030  ! 356: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcfbad9bf  ! 357: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2e01f  ! 358: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcfbad85f  ! 359: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad91f  ! 360: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc42801f  ! 361: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xd03aa030  ! 362: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xd20a801f  ! 363: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xc3ba99bf  ! 364: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcc5a801f  ! 365: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3ba989f  ! 366: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 367: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc9baa008  ! 368: STDFA_I	stda	%f4, [0x0008, %r10]
	.word 0xd1e2901f  ! 369: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba995f  ! 370: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1e2901f  ! 371: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba98bf  ! 372: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 373: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa010  ! 374: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1ba995f  ! 375: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc402801f  ! 376: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xcbbad87f  ! 377: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d13f  ! 378: CASXA_I	casxa	[%r11] 0x89, %r31, %r5
	.word 0xcbe2e01f  ! 379: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbf2d13f  ! 380: CASXA_I	casxa	[%r11] 0x89, %r31, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc502801f  ! 381: LDF_R	ld	[%r10, %r31], %f2
	.word 0xd1ba989f  ! 382: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 383: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2911f  ! 384: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xc7bae010  ! 385: STDFA_I	stda	%f3, [0x0010, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9bae000  ! 386: STDFA_I	stda	%f4, [0x0000, %r11]
	.word 0xcff2a01f  ! 387: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc85ac01f  ! 388: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xcbbaa060  ! 389: STDFA_I	stda	%f5, [0x0060, %r10]
	.word 0xc43a801f  ! 390: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc82a040  ! 391: LDUWA_I	lduwa	[%r10, + 0x0040] %asi, %r6
	.word 0xd3bad89f  ! 392: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 393: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xc652a04c  ! 394: LDSH_I	ldsh	[%r10 + 0x004c], %r3
	.word 0xc9ba997f  ! 395: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9ba995f  ! 396: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 397: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xced2901f  ! 398: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r7
	.word 0xcc12c01f  ! 399: LDUH_R	lduh	[%r11 + %r31], %r6
	.word 0xcbbaa030  ! 400: STDFA_I	stda	%f5, [0x0030, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdbad81f  ! 401: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad9bf  ! 402: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad89f  ! 403: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 404: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcc3ae050  ! 405: STD_I	std	%r6, [%r11 + 0x0050]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc3ac01f  ! 406: STD_R	std	%r6, [%r11 + %r31]
	.word 0xc402a000  ! 407: LDUW_I	lduw	[%r10 + 0x0000], %r2
	.word 0xc7e2d11f  ! 408: CASA_I	casa	[%r11] 0x88, %r31, %r3
	.word 0xc7bad91f  ! 409: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad91f  ! 410: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7e2e01f  ! 411: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc7bad99f  ! 412: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc282e020  ! 413: LDUWA_I	lduwa	[%r11, + 0x0020] %asi, %r1
	.word 0xc99aa078  ! 414: LDDFA_I	ldda	[%r10, 0x0078], %f4
	.word 0xc03a801f  ! 415: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3ba987f  ! 416: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2911f  ! 417: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc842e050  ! 418: LDSW_I	ldsw	[%r11 + 0x0050], %r4
	.word 0xc83ae020  ! 419: STD_I	std	%r4, [%r11 + 0x0020]
	.word 0xc83ac01f  ! 420: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc702801f  ! 421: LDF_R	ld	[%r10, %r31], %f3
	.word 0xd1ba99bf  ! 422: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 423: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc412e052  ! 424: LDUH_I	lduh	[%r11 + 0x0052], %r2
	.word 0xc3ba987f  ! 425: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3ba993f  ! 426: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd252801f  ! 427: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xcf9aa078  ! 428: LDDFA_I	ldda	[%r10, 0x0078], %f7
	.word 0xcfba98bf  ! 429: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba989f  ! 430: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfba991f  ! 431: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba983f  ! 432: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba985f  ! 433: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc8c2a04c  ! 434: LDSWA_I	ldswa	[%r10, + 0x004c] %asi, %r4
	.word 0xd3ba989f  ! 435: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL435:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd03a801f  ! 436: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc65aa028  ! 437: LDX_I	ldx	[%r10 + 0x0028], %r3
	.word 0xd3bad81f  ! 438: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 439: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd03ac01f  ! 440: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcf02801f  ! 441: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc892901f  ! 442: LDUHA_R	lduha	[%r10, %r31] 0x80, %r4
	.word 0xd3f2a01f  ! 443: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc99ae008  ! 444: LDDFA_I	ldda	[%r11, 0x0008], %f4
	.word 0xd292e022  ! 445: LDUHA_I	lduha	[%r11, + 0x0022] %asi, %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd302c01f  ! 446: LDF_R	ld	[%r11, %r31], %f9
	.word 0xcfba987f  ! 447: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 448: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xccc2901f  ! 449: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r6
	.word 0xd2d2e044  ! 450: LDSHA_I	ldsha	[%r11, + 0x0044] %asi, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5f2a01f  ! 451: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc452a01c  ! 452: LDSH_I	ldsh	[%r10 + 0x001c], %r2
	.word 0xc652801f  ! 453: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xc3bad85f  ! 454: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad8bf  ! 455: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3bad97f  ! 456: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc01ae028  ! 457: LDD_I	ldd	[%r11 + 0x0028], %r0
	.word 0xd3ba991f  ! 458: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd39aa048  ! 459: LDDFA_I	ldda	[%r10, 0x0048], %f9
	.word 0xcbbad81f  ! 460: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbbad95f  ! 461: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcb02e010  ! 462: LDF_I	ld	[%r11, 0x0010], %f5
	.word 0xc3e2a01f  ! 463: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xceca901f  ! 464: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r7
	.word 0xca0a801f  ! 465: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xca12801f  ! 466: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xc7bad81f  ! 467: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 468: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad93f  ! 469: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad83f  ! 470: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc43ae010  ! 471: STD_I	std	%r2, [%r11 + 0x0010]
	.word 0xc24ae038  ! 472: LDSB_I	ldsb	[%r11 + 0x0038], %r1
	.word 0xc9e2e01f  ! 473: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d11f  ! 474: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xcb9aa040  ! 475: LDDFA_I	ldda	[%r10, 0x0040], %f5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc6da917f  ! 476: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r3
	.word 0xc43a801f  ! 477: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba99bf  ! 478: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcb9aa070  ! 479: LDDFA_I	ldda	[%r10, 0x0070], %f5
	.word 0xc7ba99bf  ! 480: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xca4a801f  ! 481: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xcfba981f  ! 482: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd252e024  ! 483: LDSH_I	ldsh	[%r11 + 0x0024], %r9
	.word 0xcc82907f  ! 484: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r6
	.word 0xc7f2a01f  ! 485: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7ba983f  ! 486: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 487: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xd302a01c  ! 488: LDF_I	ld	[%r10, 0x001c], %f9
	.word 0xcacad07f  ! 489: LDSBA_R	ldsba	[%r11, %r31] 0x83, %r5
	.word 0xcfba997f  ! 490: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcb22801f  ! 491: STF_R	st	%f5, [%r31, %r10]
	.word 0xc7bae028  ! 492: STDFA_I	stda	%f3, [0x0028, %r11]
	.word 0xcccae044  ! 493: LDSBA_I	ldsba	[%r11, + 0x0044] %asi, %r6
	.word 0xcd02c01f  ! 494: LDF_R	ld	[%r11, %r31], %f6
	.word 0xcd02c01f  ! 495: LDF_R	ld	[%r11, %r31], %f6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd242e04c  ! 496: LDSW_I	ldsw	[%r11 + 0x004c], %r9
	.word 0xd052a016  ! 497: LDSH_I	ldsh	[%r10 + 0x0016], %r8
	.word 0xc5e2903f  ! 498: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba981f  ! 499: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 500: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcb9ae000  ! 501: LDDFA_I	ldda	[%r11, 0x0000], %f5
	.word 0xc4ca911f  ! 502: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r2
	.word 0xc612a078  ! 503: LDUH_I	lduh	[%r10 + 0x0078], %r3
	.word 0xcfbad89f  ! 504: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d13f  ! 505: CASXA_I	casxa	[%r11] 0x89, %r31, %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfe2d03f  ! 506: CASA_I	casa	[%r11] 0x81, %r31, %r7
	.word 0xcfbad85f  ! 507: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcd02c01f  ! 508: LDF_R	ld	[%r11, %r31], %f6
	.word 0xc5ba987f  ! 509: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 510: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5ba991f  ! 511: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba983f  ! 512: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 513: STD_R	std	%r2, [%r10 + %r31]
	.word 0xce4aa07b  ! 514: LDSB_I	ldsb	[%r10 + 0x007b], %r7
	.word 0xce42801f  ! 515: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcedaa078  ! 516: LDXA_I	ldxa	[%r10, + 0x0078] %asi, %r7
	.word 0xcccaa049  ! 517: LDSBA_I	ldsba	[%r10, + 0x0049] %asi, %r6
	.word 0xce0a801f  ! 518: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xd042e04c  ! 519: LDSW_I	ldsw	[%r11 + 0x004c], %r8
	.word 0xc9bad81f  ! 520: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc41aa068  ! 521: LDD_I	ldd	[%r10 + 0x0068], %r2
	.word 0xc9baa010  ! 522: STDFA_I	stda	%f4, [0x0010, %r10]
	.word 0xc83a801f  ! 523: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba983f  ! 524: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 525: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9f2a01f  ! 526: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xcbbaa058  ! 527: STDFA_I	stda	%f5, [0x0058, %r10]
	.word 0xcbbaa040  ! 528: STDFA_I	stda	%f5, [0x0040, %r10]
	.word 0xc5baa038  ! 529: STDFA_I	stda	%f2, [0x0038, %r10]
	.word 0xcdba985f  ! 530: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdba985f  ! 531: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdbae048  ! 532: STDFA_I	stda	%f6, [0x0048, %r11]
	.word 0xcdbad91f  ! 533: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd282e01c  ! 534: LDUWA_I	lduwa	[%r11, + 0x001c] %asi, %r9
	.word 0xd03a801f  ! 535: STD_R	std	%r8, [%r10 + %r31]
TH_LABEL535:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3e2913f  ! 536: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xc892a072  ! 537: LDUHA_I	lduha	[%r10, + 0x0072] %asi, %r4
	.word 0xce52801f  ! 538: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xd1bad97f  ! 539: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcc52c01f  ! 540: LDSH_R	ldsh	[%r11 + %r31], %r6
TH_LABEL540:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9e2e01f  ! 541: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2e01f  ! 542: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xcadaa028  ! 543: LDXA_I	ldxa	[%r10, + 0x0028] %asi, %r5
	.word 0xccd2911f  ! 544: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r6
	.word 0xc7ba983f  ! 545: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL545:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc43aa008  ! 546: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7ba995f  ! 547: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 548: STD_R	std	%r2, [%r10 + %r31]
	.word 0xcf22801f  ! 549: STF_R	st	%f7, [%r31, %r10]
	.word 0xd3bad9bf  ! 550: STDFA_R	stda	%f9, [%r31, %r11]
TH_LABEL550:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3bad93f  ! 551: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae008  ! 552: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3bad83f  ! 553: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae008  ! 554: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3e2e01f  ! 555: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc602a014  ! 556: LDUW_I	lduw	[%r10 + 0x0014], %r3
	.word 0xd1ba985f  ! 557: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd052e02c  ! 558: LDSH_I	ldsh	[%r11 + 0x002c], %r8
	.word 0xc83ae028  ! 559: STD_I	std	%r4, [%r11 + 0x0028]
	.word 0xc9bad81f  ! 560: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9bad87f  ! 561: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 562: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad85f  ! 563: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc48aa065  ! 564: LDUBA_I	lduba	[%r10, + 0x0065] %asi, %r2
	.word 0xcde2d13f  ! 565: CASA_I	casa	[%r11] 0x89, %r31, %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd25a801f  ! 566: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xc49aa038  ! 567: LDDA_I	ldda	[%r10, + 0x0038] %asi, %r2
	.word 0xd1e2901f  ! 568: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xcada901f  ! 569: LDXA_R	ldxa	[%r10, %r31] 0x80, %r5
	.word 0xc9f2903f  ! 570: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc8ae03d  ! 571: LDUBA_I	lduba	[%r11, + 0x003d] %asi, %r6
	.word 0xcdf2a01f  ! 572: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc3baa000  ! 573: STDFA_I	stda	%f1, [0x0000, %r10]
	.word 0xc7f2901f  ! 574: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba99bf  ! 575: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc2c2913f  ! 576: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r1
	.word 0xc2caa043  ! 577: LDSBA_I	ldsba	[%r10, + 0x0043] %asi, %r1
	.word 0xc83aa010  ! 578: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xcbf2913f  ! 579: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xcbba985f  ! 580: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc83a801f  ! 581: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbe2a01f  ! 582: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc65a801f  ! 583: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xc3bad95f  ! 584: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 585: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcb02a014  ! 586: LDF_I	ld	[%r10, 0x0014], %f5
	.word 0xc83aa008  ! 587: STD_I	std	%r4, [%r10 + 0x0008]
	.word 0xd24a801f  ! 588: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xc03a801f  ! 589: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc4c2a008  ! 590: LDSWA_I	ldswa	[%r10, + 0x0008] %asi, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfbad8bf  ! 591: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xca5ac01f  ! 592: LDX_R	ldx	[%r11 + %r31], %r5
	.word 0xc5f2a01f  ! 593: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc902801f  ! 594: LDF_R	ld	[%r10, %r31], %f4
	.word 0xd1ba995f  ! 595: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd03aa028  ! 596: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd1f2a01f  ! 597: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2901f  ! 598: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xcc42e03c  ! 599: LDSW_I	ldsw	[%r11 + 0x003c], %r6
	.word 0xd3f2a01f  ! 600: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd202c01f  ! 601: LDUW_R	lduw	[%r11 + %r31], %r9
	.word 0xcf02c01f  ! 602: LDF_R	ld	[%r11, %r31], %f7
	.word 0xc5e2a01f  ! 603: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 604: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba985f  ! 605: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc59aa008  ! 606: LDDFA_I	ldda	[%r10, 0x0008], %f2
	.word 0xc522801f  ! 607: STF_R	st	%f2, [%r31, %r10]
	.word 0xcbba98bf  ! 608: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 609: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xc41ae010  ! 610: LDD_I	ldd	[%r11 + 0x0010], %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xca42a04c  ! 611: LDSW_I	ldsw	[%r10 + 0x004c], %r5
	.word 0xd1bad97f  ! 612: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad91f  ! 613: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad99f  ! 614: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d03f  ! 615: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1bad99f  ! 616: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad8bf  ! 617: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcd9aa060  ! 618: LDDFA_I	ldda	[%r10, 0x0060], %f6
	.word 0xd1bad97f  ! 619: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 620: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd01a801f  ! 621: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xcc8aa04c  ! 622: LDUBA_I	lduba	[%r10, + 0x004c] %asi, %r6
	.word 0xcecad03f  ! 623: LDSBA_R	ldsba	[%r11, %r31] 0x81, %r7
	.word 0xc7bae018  ! 624: STDFA_I	stda	%f3, [0x0018, %r11]
	.word 0xcbbaa020  ! 625: STDFA_I	stda	%f5, [0x0020, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc28a903f  ! 626: LDUBA_R	lduba	[%r10, %r31] 0x81, %r1
	.word 0xcbbad8bf  ! 627: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad95f  ! 628: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad99f  ! 629: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad85f  ! 630: STDFA_R	stda	%f5, [%r31, %r11]
TH_LABEL630:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbbad93f  ! 631: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 632: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbf2d01f  ! 633: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad93f  ! 634: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad95f  ! 635: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc83ac01f  ! 636: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad87f  ! 637: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad97f  ! 638: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad95f  ! 639: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc612a01a  ! 640: LDUH_I	lduh	[%r10 + 0x001a], %r3
TH_LABEL640:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbf2a01f  ! 641: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba989f  ! 642: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 643: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba981f  ! 644: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc45aa060  ! 645: LDX_I	ldx	[%r10 + 0x0060], %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9ba993f  ! 646: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc4ae060  ! 647: LDSB_I	ldsb	[%r11 + 0x0060], %r6
	.word 0xcdba993f  ! 648: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba98bf  ! 649: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc41ae018  ! 650: LDD_I	ldd	[%r11 + 0x0018], %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd01a801f  ! 651: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xc3ba991f  ! 652: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 653: STD_R	std	%r0, [%r10 + %r31]
	.word 0xcaca915f  ! 654: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r5
	.word 0xc3f2a01f  ! 655: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd04ac01f  ! 656: LDSB_R	ldsb	[%r11 + %r31], %r8
	.word 0xc3ba989f  ! 657: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba98bf  ! 659: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2901f  ! 660: CASA_I	casa	[%r10] 0x80, %r31, %r1
TH_LABEL660:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xce4ae019  ! 661: LDSB_I	ldsb	[%r11 + 0x0019], %r7
	.word 0xc502a05c  ! 662: LDF_I	ld	[%r10, 0x005c], %f2
	.word 0xcfe2911f  ! 663: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcc3a801f  ! 664: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc3a801f  ! 665: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5baa050  ! 666: STDFA_I	stda	%f2, [0x0050, %r10]
	.word 0xcfbad93f  ! 667: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad8bf  ! 668: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d03f  ! 669: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xc202e028  ! 670: LDUW_I	lduw	[%r11 + 0x0028], %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xca02c01f  ! 671: LDUW_R	lduw	[%r11 + %r31], %r5
	.word 0xcbba999f  ! 672: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba99bf  ! 673: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd3bae020  ! 674: STDFA_I	stda	%f9, [0x0020, %r11]
	.word 0xd08ad07f  ! 675: LDUBA_R	lduba	[%r11, %r31] 0x83, %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7e2a01f  ! 676: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xcadaa048  ! 677: LDXA_I	ldxa	[%r10, + 0x0048] %asi, %r5
	.word 0xc43a801f  ! 678: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba987f  ! 679: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 680: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc302801f  ! 681: LDF_R	ld	[%r10, %r31], %f1
	.word 0xd102801f  ! 682: LDF_R	ld	[%r10, %r31], %f8
	.word 0xcdf2e01f  ! 683: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xcdbad9bf  ! 684: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae040  ! 685: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdbad97f  ! 686: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd19aa020  ! 687: LDDFA_I	ldda	[%r10, 0x0020], %f8
	.word 0xc722801f  ! 688: STF_R	st	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 689: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 690: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xccd2d17f  ! 691: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r6
	.word 0xd282a054  ! 692: LDUWA_I	lduwa	[%r10, + 0x0054] %asi, %r9
	.word 0xc502a05c  ! 693: LDF_I	ld	[%r10, 0x005c], %f2
	.word 0xc83aa000  ! 694: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xc692e002  ! 695: LDUHA_I	lduha	[%r11, + 0x0002] %asi, %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcfba99bf  ! 696: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xce42a050  ! 697: LDSW_I	ldsw	[%r10 + 0x0050], %r7
	.word 0xc3bad87f  ! 698: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xccdaa050  ! 699: LDXA_I	ldxa	[%r10, + 0x0050] %asi, %r6
	.word 0xceda911f  ! 700: LDXA_R	ldxa	[%r10, %r31] 0x88, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3e2911f  ! 701: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xd3ba981f  ! 702: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba995f  ! 703: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcec2a058  ! 704: LDSWA_I	ldswa	[%r10, + 0x0058] %asi, %r7
	.word 0xcbbad87f  ! 705: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xccc2a074  ! 706: LDSWA_I	ldswa	[%r10, + 0x0074] %asi, %r6
	.word 0xc5ba981f  ! 707: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 708: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd2d2e04e  ! 709: LDSHA_I	ldsha	[%r11, + 0x004e] %asi, %r9
	.word 0xc3e2a01f  ! 710: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc03aa010  ! 711: STD_I	std	%r0, [%r10 + 0x0010]
	.word 0xc3ba981f  ! 712: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 713: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcc5aa000  ! 714: LDX_I	ldx	[%r10 + 0x0000], %r6
	.word 0xcdbaa038  ! 715: STDFA_I	stda	%f6, [0x0038, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1f2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba999f  ! 717: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba987f  ! 718: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba985f  ! 719: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca5ac01f  ! 720: LDX_R	ldx	[%r11 + %r31], %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5ba987f  ! 721: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2911f  ! 722: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc09ae000  ! 723: LDDA_I	ldda	[%r11, + 0x0000] %asi, %r0
	.word 0xca02a008  ! 724: LDUW_I	lduw	[%r10 + 0x0008], %r5
	.word 0xcc42a004  ! 725: LDSW_I	ldsw	[%r10 + 0x0004], %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbbad85f  ! 726: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 727: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 728: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc612a056  ! 729: LDUH_I	lduh	[%r10 + 0x0056], %r3
	.word 0xd3f2a01f  ! 730: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3e2a01f  ! 731: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc41a801f  ! 732: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xd09aa038  ! 733: LDDA_I	ldda	[%r10, + 0x0038] %asi, %r8
	.word 0xc902e078  ! 734: LDF_I	ld	[%r11, 0x0078], %f4
	.word 0xcc3aa008  ! 735: STD_I	std	%r6, [%r10 + 0x0008]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfe2a01f  ! 736: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd242e048  ! 737: LDSW_I	ldsw	[%r11 + 0x0048], %r9
	.word 0xc722c01f  ! 738: STF_R	st	%f3, [%r31, %r11]
	.word 0xca12801f  ! 739: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xd1f2911f  ! 740: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1ba989f  ! 741: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc4c2a024  ! 742: LDSWA_I	ldswa	[%r10, + 0x0024] %asi, %r2
	.word 0xce8aa057  ! 743: LDUBA_I	lduba	[%r10, + 0x0057] %asi, %r7
	.word 0xc83ac01f  ! 744: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbe2d11f  ! 745: CASA_I	casa	[%r11] 0x88, %r31, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbbad93f  ! 746: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad83f  ! 747: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd302801f  ! 748: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc3bad93f  ! 749: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcf02a074  ! 750: LDF_I	ld	[%r10, 0x0074], %f7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd242801f  ! 751: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xd1f2a01f  ! 752: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2a01f  ! 753: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa000  ! 754: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xcc5a801f  ! 755: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9f2d11f  ! 756: CASXA_I	casxa	[%r11] 0x88, %r31, %r4
	.word 0xc892a064  ! 757: LDUHA_I	lduha	[%r10, + 0x0064] %asi, %r4
	.word 0xcfbad81f  ! 758: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc502a068  ! 759: LDF_I	ld	[%r10, 0x0068], %f2
	.word 0xcdba989f  ! 760: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdba987f  ! 761: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2901f  ! 762: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xc642801f  ! 763: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc9e2d01f  ! 764: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xd39ae000  ! 765: LDDFA_I	ldda	[%r11, 0x0000], %f9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1e2a01f  ! 766: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1e2a01f  ! 767: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 768: STD_R	std	%r8, [%r10 + %r31]
	.word 0xcc12a008  ! 769: LDUH_I	lduh	[%r10 + 0x0008], %r6
	.word 0xc9bad83f  ! 770: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9bad91f  ! 771: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xca52e048  ! 772: LDSH_I	ldsh	[%r11 + 0x0048], %r5
	.word 0xc902801f  ! 773: LDF_R	ld	[%r10, %r31], %f4
	.word 0xcccad03f  ! 774: LDSBA_R	ldsba	[%r11, %r31] 0x81, %r6
	.word 0xd1f2913f  ! 775: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd03aa058  ! 776: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xc7baa008  ! 777: STDFA_I	stda	%f3, [0x0008, %r10]
	.word 0xca0ac01f  ! 778: LDUB_R	ldub	[%r11 + %r31], %r5
	.word 0xc7ba989f  ! 779: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 780: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7ba983f  ! 781: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba983f  ! 782: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2903f  ! 783: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba995f  ! 784: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc9bae018  ! 785: STDFA_I	stda	%f4, [0x0018, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdbaa050  ! 786: STDFA_I	stda	%f6, [0x0050, %r10]
	.word 0xc9bad97f  ! 787: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad93f  ! 788: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 789: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcc92911f  ! 790: LDUHA_R	lduha	[%r10, %r31] 0x88, %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc322801f  ! 791: STF_R	st	%f1, [%r31, %r10]
	.word 0xc7ba99bf  ! 792: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc4c2a014  ! 793: LDSWA_I	ldswa	[%r10, + 0x0014] %asi, %r2
	.word 0xc3e2a01f  ! 794: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc5bae050  ! 795: STDFA_I	stda	%f2, [0x0050, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc24aa005  ! 796: LDSB_I	ldsb	[%r10 + 0x0005], %r1
	.word 0xcfba987f  ! 797: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba995f  ! 798: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc09aa010  ! 799: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r0
	.word 0xd0caa055  ! 800: LDSBA_I	ldsba	[%r10, + 0x0055] %asi, %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3f2d01f  ! 801: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc652801f  ! 802: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xc43ae048  ! 803: STD_I	std	%r2, [%r11 + 0x0048]
	.word 0xcada917f  ! 804: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r5
	.word 0xc692e060  ! 805: LDUHA_I	lduha	[%r11, + 0x0060] %asi, %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcde2e01f  ! 806: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xc7baa008  ! 807: STDFA_I	stda	%f3, [0x0008, %r10]
	.word 0xc9f2901f  ! 808: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9e2913f  ! 809: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9e2a01f  ! 810: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9f2a01f  ! 811: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc812a000  ! 812: LDUH_I	lduh	[%r10 + 0x0000], %r4
	.word 0xcad2a008  ! 813: LDSHA_I	ldsha	[%r10, + 0x0008] %asi, %r5
	.word 0xd002c01f  ! 814: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xd1bad81f  ! 815: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1bad81f  ! 816: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d11f  ! 817: CASA_I	casa	[%r11] 0x88, %r31, %r8
	.word 0xd122801f  ! 818: STF_R	st	%f8, [%r31, %r10]
	.word 0xc452e072  ! 819: LDSH_I	ldsh	[%r11 + 0x0072], %r2
	.word 0xc652a058  ! 820: LDSH_I	ldsh	[%r10 + 0x0058], %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc43aa060  ! 821: STD_I	std	%r2, [%r10 + 0x0060]
	.word 0xcc1ae058  ! 822: LDD_I	ldd	[%r11 + 0x0058], %r6
	.word 0xc4c2915f  ! 823: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r2
	.word 0xc3ba993f  ! 824: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba983f  ! 825: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc81aa050  ! 826: LDD_I	ldd	[%r10 + 0x0050], %r4
	.word 0xd1f2a01f  ! 827: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc2d2a002  ! 828: LDSHA_I	ldsha	[%r10, + 0x0002] %asi, %r1
	.word 0xcc3aa050  ! 829: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xcff2913f  ! 830: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfba987f  ! 831: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba991f  ! 832: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc442e00c  ! 833: LDSW_I	ldsw	[%r11 + 0x000c], %r2
	.word 0xd3ba99bf  ! 834: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd0caa028  ! 835: LDSBA_I	ldsba	[%r10, + 0x0028] %asi, %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc212801f  ! 836: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xcb22c01f  ! 837: STF_R	st	%f5, [%r31, %r11]
	.word 0xc452801f  ! 838: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xcdbad85f  ! 839: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc452c01f  ! 840: LDSH_R	ldsh	[%r11 + %r31], %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc28ae077  ! 841: LDUBA_I	lduba	[%r11, + 0x0077] %asi, %r1
	.word 0xd1ba989f  ! 842: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd19aa038  ! 843: LDDFA_I	ldda	[%r10, 0x0038], %f8
	.word 0xcbba981f  ! 844: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc842a078  ! 845: LDSW_I	ldsw	[%r10 + 0x0078], %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7bae038  ! 846: STDFA_I	stda	%f3, [0x0038, %r11]
	.word 0xd092e004  ! 847: LDUHA_I	lduha	[%r11, + 0x0004] %asi, %r8
	.word 0xce52801f  ! 848: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xcdba989f  ! 849: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc68a911f  ! 850: LDUBA_R	lduba	[%r10, %r31] 0x88, %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3e2d01f  ! 851: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xc4d2a026  ! 852: LDSHA_I	ldsha	[%r10, + 0x0026] %asi, %r2
	.word 0xd122801f  ! 853: STF_R	st	%f8, [%r31, %r10]
	.word 0xd1e2903f  ! 854: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd322801f  ! 855: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc43ae008  ! 856: STD_I	std	%r2, [%r11 + 0x0008]
	.word 0xc64ac01f  ! 857: LDSB_R	ldsb	[%r11 + %r31], %r3
	.word 0xc3bad83f  ! 858: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad81f  ! 859: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc282915f  ! 860: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfba983f  ! 861: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 862: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc702e064  ! 863: LDF_I	ld	[%r11, 0x0064], %f3
	.word 0xc25ac01f  ! 864: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xd3ba995f  ! 865: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba993f  ! 866: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 867: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 868: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba995f  ! 869: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 870: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc412a01a  ! 871: LDUH_I	lduh	[%r10 + 0x001a], %r2
	.word 0xc7ba993f  ! 872: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 873: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc4caa041  ! 874: LDSBA_I	ldsba	[%r10, + 0x0041] %asi, %r2
	.word 0xd1ba991f  ! 875: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcb02a070  ! 876: LDF_I	ld	[%r10, 0x0070], %f5
	.word 0xcdf2e01f  ! 877: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xc4d2915f  ! 878: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r2
	.word 0xd19aa008  ! 879: LDDFA_I	ldda	[%r10, 0x0008], %f8
	.word 0xc48aa03b  ! 880: LDUBA_I	lduba	[%r10, + 0x003b] %asi, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc0ac01f  ! 881: LDUB_R	ldub	[%r11 + %r31], %r6
	.word 0xc3ba981f  ! 882: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 883: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc702801f  ! 884: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc01a801f  ! 885: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc602801f  ! 886: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xcbbad95f  ! 887: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 888: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xc922c01f  ! 889: STF_R	st	%f4, [%r31, %r11]
	.word 0xc9baa010  ! 890: STDFA_I	stda	%f4, [0x0010, %r10]
TH_LABEL890:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9f2903f  ! 891: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xcc9aa020  ! 892: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r6
	.word 0xd09aa008  ! 893: LDDA_I	ldda	[%r10, + 0x0008] %asi, %r8
	.word 0xd1f2a01f  ! 894: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba99bf  ! 895: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xca12a01c  ! 896: LDUH_I	lduh	[%r10 + 0x001c], %r5
	.word 0xd2d2a058  ! 897: LDSHA_I	ldsha	[%r10, + 0x0058] %asi, %r9
	.word 0xc8c2a00c  ! 898: LDSWA_I	ldswa	[%r10, + 0x000c] %asi, %r4
	.word 0xd1ba983f  ! 899: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc82e038  ! 900: LDUWA_I	lduwa	[%r11, + 0x0038] %asi, %r6
TH_LABEL900:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcf9aa078  ! 901: LDDFA_I	ldda	[%r10, 0x0078], %f7
	.word 0xc282e028  ! 902: LDUWA_I	lduwa	[%r11, + 0x0028] %asi, %r1
	.word 0xcc9aa020  ! 903: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r6
	.word 0xcfbad83f  ! 904: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xce0a801f  ! 905: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc212801f  ! 906: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xc4cad17f  ! 907: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r2
	.word 0xc7e2903f  ! 908: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba99bf  ! 909: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa030  ! 910: STD_I	std	%r2, [%r10 + 0x0030]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd19ae070  ! 911: LDDFA_I	ldda	[%r11, 0x0070], %f8
	.word 0xcbba989f  ! 912: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba995f  ! 913: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcf22801f  ! 914: STF_R	st	%f7, [%r31, %r10]
	.word 0xcc3ae050  ! 915: STD_I	std	%r6, [%r11 + 0x0050]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdbad81f  ! 916: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd242c01f  ! 917: LDSW_R	ldsw	[%r11 + %r31], %r9
	.word 0xd1e2e01f  ! 918: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad91f  ! 919: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc8c2a02c  ! 920: LDSWA_I	ldswa	[%r10, + 0x002c] %asi, %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbba997f  ! 921: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 922: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 923: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba99bf  ! 924: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa028  ! 925: STD_I	std	%r4, [%r10 + 0x0028]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbba999f  ! 926: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc41ae030  ! 927: LDD_I	ldd	[%r11 + 0x0030], %r2
	.word 0xc9ba99bf  ! 928: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc302c01f  ! 929: LDF_R	ld	[%r11, %r31], %f1
	.word 0xce12801f  ! 930: LDUH_R	lduh	[%r10 + %r31], %r7
TH_LABEL930:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc52801f  ! 931: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xd09ae070  ! 932: LDDA_I	ldda	[%r11, + 0x0070] %asi, %r8
	.word 0xc79aa068  ! 933: LDDFA_I	ldda	[%r10, 0x0068], %f3
	.word 0xcde2d13f  ! 934: CASA_I	casa	[%r11] 0x89, %r31, %r6
	.word 0xc502a070  ! 935: LDF_I	ld	[%r10, 0x0070], %f2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5f2a01f  ! 936: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc43a801f  ! 937: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba987f  ! 938: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc842801f  ! 939: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xcbba991f  ! 940: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbf2a01f  ! 941: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xc292a036  ! 942: LDUHA_I	lduha	[%r10, + 0x0036] %asi, %r1
	.word 0xd102e00c  ! 943: LDF_I	ld	[%r11, 0x000c], %f8
	.word 0xd3bad83f  ! 944: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2d03f  ! 945: CASXA_I	casxa	[%r11] 0x81, %r31, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3bad81f  ! 946: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc302a018  ! 947: LDF_I	ld	[%r10, 0x0018], %f1
	.word 0xd1bad89f  ! 948: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcecaa061  ! 949: LDSBA_I	ldsba	[%r10, + 0x0061] %asi, %r7
	.word 0xcdba983f  ! 950: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd082e020  ! 951: LDUWA_I	lduwa	[%r11, + 0x0020] %asi, %r8
	.word 0xcc52801f  ! 952: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xc642e05c  ! 953: LDSW_I	ldsw	[%r11 + 0x005c], %r3
	.word 0xcfe2913f  ! 954: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcff2913f  ! 955: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcfe2911f  ! 956: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcfba981f  ! 957: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa010  ! 958: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcfba991f  ! 959: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc9bae028  ! 960: STDFA_I	stda	%f4, [0x0028, %r11]
TH_LABEL960:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xca5a801f  ! 961: LDX_R	ldx	[%r10 + %r31], %r5
	.word 0xd1ba985f  ! 962: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd042a07c  ! 963: LDSW_I	ldsw	[%r10 + 0x007c], %r8
	.word 0xc3ba983f  ! 964: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd20aa04e  ! 965: LDUB_I	ldub	[%r10 + 0x004e], %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc81a801f  ! 966: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xcfba997f  ! 967: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa038  ! 968: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcc3aa038  ! 969: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcc3a801f  ! 970: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xca4ac01f  ! 971: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xd24a801f  ! 972: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xc4c2e00c  ! 973: LDSWA_I	ldswa	[%r11, + 0x000c] %asi, %r2
	.word 0xd1bad81f  ! 974: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad93f  ! 975: STDFA_R	stda	%f8, [%r31, %r11]
TH_LABEL975:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd08ae061  ! 976: LDUBA_I	lduba	[%r11, + 0x0061] %asi, %r8
	.word 0xcecad13f  ! 977: LDSBA_R	ldsba	[%r11, %r31] 0x89, %r7
	.word 0xc88aa031  ! 978: LDUBA_I	lduba	[%r10, + 0x0031] %asi, %r4
	.word 0xd3e2a01f  ! 979: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba981f  ! 980: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd03aa058  ! 981: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3e2a01f  ! 982: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xcb02801f  ! 983: LDF_R	ld	[%r10, %r31], %f5
	.word 0xce92a00a  ! 984: LDUHA_I	lduha	[%r10, + 0x000a] %asi, %r7
	.word 0xd242801f  ! 985: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd202a024  ! 986: LDUW_I	lduw	[%r10 + 0x0024], %r9
	.word 0xd00ae057  ! 987: LDUB_I	ldub	[%r11 + 0x0057], %r8
	.word 0xc79ae048  ! 988: LDDFA_I	ldda	[%r11, 0x0048], %f3
	.word 0xc2daa018  ! 989: LDXA_I	ldxa	[%r10, + 0x0018] %asi, %r1
	.word 0xc5bad95f  ! 990: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5bad91f  ! 991: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc892d05f  ! 992: LDUHA_R	lduha	[%r11, %r31] 0x82, %r4
	.word 0xcb22c01f  ! 993: STF_R	st	%f5, [%r31, %r11]
	.word 0xc7ba981f  ! 994: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcd22801f  ! 995: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3f2a01f  ! 996: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xce8a915f  ! 997: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r7
	.word 0xcfba993f  ! 998: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd0ca913f  ! 999: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r8
	.word 0xc502801f  ! 1000: LDF_R	ld	[%r10, %r31], %f2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	subcc %r30, 1, %r30
	bnz  TH7_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	add	%g0,	0x1,	%r30
TH6_LOOP_START:
	.word 0xc9ba981f  ! 1: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba997f  ! 2: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc92d13f  ! 3: LDUHA_R	lduha	[%r11, %r31] 0x89, %r6
	.word 0xce12a02c  ! 4: LDUH_I	lduh	[%r10 + 0x002c], %r7
	.word 0xc3bae058  ! 5: STDFA_I	stda	%f1, [0x0058, %r11]
TH_LABEL5:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc20a801f  ! 6: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xcfba991f  ! 7: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc9bae050  ! 8: STDFA_I	stda	%f4, [0x0050, %r11]
	.word 0xc5baa010  ! 9: STDFA_I	stda	%f2, [0x0010, %r10]
	.word 0xcdf2901f  ! 10: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc242801f  ! 11: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xc9bad99f  ! 12: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc40ae06e  ! 13: LDUB_I	ldub	[%r11 + 0x006e], %r2
	.word 0xcbf2e01f  ! 14: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad89f  ! 15: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbbad9bf  ! 16: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 17: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad8bf  ! 18: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad87f  ! 19: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 20: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc5aa038  ! 21: LDX_I	ldx	[%r10 + 0x0038], %r6
	.word 0xc7ba989f  ! 22: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcd02a07c  ! 23: LDF_I	ld	[%r10, 0x007c], %f6
	.word 0xca82905f  ! 24: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r5
	.word 0xc5f2901f  ! 25: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5f2a01f  ! 26: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc99aa028  ! 27: LDDFA_I	ldda	[%r10, 0x0028], %f4
	.word 0xc7f2901f  ! 28: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba993f  ! 29: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 30: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd0cad13f  ! 31: LDSBA_R	ldsba	[%r11, %r31] 0x89, %r8
	.word 0xcb02801f  ! 32: LDF_R	ld	[%r10, %r31], %f5
	.word 0xcdba989f  ! 33: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba997f  ! 34: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 35: STD_R	std	%r6, [%r10 + %r31]
TH_LABEL35:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc92d01f  ! 36: LDUHA_R	lduha	[%r11, %r31] 0x80, %r6
	.word 0xc9ba991f  ! 37: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 38: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2901f  ! 39: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba983f  ! 40: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcb02801f  ! 41: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc7f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7e2a01f  ! 43: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc59ae018  ! 44: LDDFA_I	ldda	[%r11, 0x0018], %f2
	.word 0xd05a801f  ! 45: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcada915f  ! 46: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r5
	.word 0xcfe2913f  ! 47: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcfe2a01f  ! 48: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba997f  ! 49: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc82d01f  ! 50: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3bad9bf  ! 51: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad85f  ! 52: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad89f  ! 53: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd082a02c  ! 54: LDUWA_I	lduwa	[%r10, + 0x002c] %asi, %r8
	.word 0xd01ae060  ! 55: LDD_I	ldd	[%r11 + 0x0060], %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7bad93f  ! 56: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad93f  ! 57: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc842c01f  ! 58: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xcccae040  ! 59: LDSBA_I	ldsba	[%r11, + 0x0040] %asi, %r6
	.word 0xcb02801f  ! 60: LDF_R	ld	[%r10, %r31], %f5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3ba983f  ! 61: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc2dae010  ! 62: LDXA_I	ldxa	[%r11, + 0x0010] %asi, %r1
	.word 0xcc3ae060  ! 63: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xccda907f  ! 64: LDXA_R	ldxa	[%r10, %r31] 0x83, %r6
	.word 0xc5f2903f  ! 65: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5ba983f  ! 66: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 67: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc88aa05b  ! 68: LDUBA_I	lduba	[%r10, + 0x005b] %asi, %r4
	.word 0xc7f2a01f  ! 69: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba991f  ! 70: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7e2901f  ! 71: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba991f  ! 72: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 73: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba983f  ! 74: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcc8aa075  ! 75: LDUBA_I	lduba	[%r10, + 0x0075] %asi, %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc43ae000  ! 76: STD_I	std	%r2, [%r11 + 0x0000]
	.word 0xc5f2d11f  ! 77: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xc5f2e01f  ! 78: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc43ac01f  ! 79: STD_R	std	%r2, [%r11 + %r31]
	.word 0xcc9aa060  ! 80: LDDA_I	ldda	[%r10, + 0x0060] %asi, %r6
TH_LABEL80:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc03ae000  ! 81: STD_I	std	%r0, [%r11 + 0x0000]
	.word 0xc40aa042  ! 82: LDUB_I	ldub	[%r10 + 0x0042], %r2
	.word 0xc83a801f  ! 83: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcc82915f  ! 84: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r6
	.word 0xcbba985f  ! 85: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbf2901f  ! 86: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xd0da911f  ! 87: LDXA_R	ldxa	[%r10, %r31] 0x88, %r8
	.word 0xc322c01f  ! 88: STF_R	st	%f1, [%r31, %r11]
	.word 0xc45a801f  ! 89: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xc3e2901f  ! 90: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc03a801f  ! 91: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3ba997f  ! 92: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 93: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xcc8a915f  ! 94: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r6
	.word 0xcc12a072  ! 95: LDUH_I	lduh	[%r10 + 0x0072], %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc81a801f  ! 96: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xcc4a801f  ! 97: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xc43ae050  ! 98: STD_I	std	%r2, [%r11 + 0x0050]
	.word 0xc43ae050  ! 99: STD_I	std	%r2, [%r11 + 0x0050]
	.word 0xc8d2d13f  ! 100: LDSHA_R	ldsha	[%r11, %r31] 0x89, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc02801f  ! 101: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xce82a020  ! 102: LDUWA_I	lduwa	[%r10, + 0x0020] %asi, %r7
	.word 0xc3f2901f  ! 103: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3e2a01f  ! 104: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba995f  ! 105: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3e2a01f  ! 106: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba981f  ! 107: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 108: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba995f  ! 109: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba985f  ! 110: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL110:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd302a054  ! 111: LDF_I	ld	[%r10, 0x0054], %f9
	.word 0xc43ae038  ! 112: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xc43ac01f  ! 113: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae038  ! 114: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xc43ae038  ! 115: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc20aa070  ! 116: LDUB_I	ldub	[%r10 + 0x0070], %r1
	.word 0xd1ba995f  ! 117: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 118: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd28aa06d  ! 119: LDUBA_I	lduba	[%r10, + 0x006d] %asi, %r9
	.word 0xd1baa058  ! 120: STDFA_I	stda	%f8, [0x0058, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9f2901f  ! 121: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2911f  ! 122: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba997f  ! 123: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2913f  ! 124: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9f2903f  ! 125: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9ba98bf  ! 126: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 127: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xca42801f  ! 128: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xc9e2e01f  ! 129: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc99aa018  ! 130: LDDFA_I	ldda	[%r10, 0x0018], %f4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfe2a01f  ! 131: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcc8aa020  ! 132: LDUBA_I	lduba	[%r10, + 0x0020] %asi, %r6
	.word 0xcc3aa028  ! 133: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xcc3a801f  ! 134: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc49aa018  ! 135: LDDA_I	ldda	[%r10, + 0x0018] %asi, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3f2e01f  ! 136: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc612c01f  ! 137: LDUH_R	lduh	[%r11 + %r31], %r3
	.word 0xcdba997f  ! 138: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 139: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2911f  ! 140: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd25a801f  ! 141: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xcbba999f  ! 142: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2911f  ! 143: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xcbba997f  ! 144: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 145: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbf2a01f  ! 146: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xd052e004  ! 147: LDSH_I	ldsh	[%r11 + 0x0004], %r8
	.word 0xc802801f  ! 148: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xcdba99bf  ! 149: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba991f  ! 150: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc502e01c  ! 151: LDF_I	ld	[%r11, 0x001c], %f2
	.word 0xca8ad03f  ! 152: LDUBA_R	lduba	[%r11, %r31] 0x81, %r5
	.word 0xd102a024  ! 153: LDF_I	ld	[%r10, 0x0024], %f8
	.word 0xc39aa060  ! 154: LDDFA_I	ldda	[%r10, 0x0060], %f1
	.word 0xc3ba993f  ! 155: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL155:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc03a801f  ! 156: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3f2901f  ! 157: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3f2901f  ! 158: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba997f  ! 159: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc902a074  ! 160: LDF_I	ld	[%r10, 0x0074], %f4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd01a801f  ! 161: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xc5baa020  ! 162: STDFA_I	stda	%f2, [0x0020, %r10]
	.word 0xcd02a03c  ! 163: LDF_I	ld	[%r10, 0x003c], %f6
	.word 0xc8d2e024  ! 164: LDSHA_I	ldsha	[%r11, + 0x0024] %asi, %r4
	.word 0xc24ac01f  ! 165: LDSB_R	ldsb	[%r11 + %r31], %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3ba989f  ! 166: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 167: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xd00a801f  ! 168: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xc922801f  ! 169: STF_R	st	%f4, [%r31, %r10]
	.word 0xd1f2903f  ! 170: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd03aa028  ! 171: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd03a801f  ! 172: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba997f  ! 173: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 174: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba99bf  ! 175: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1f2a01f  ! 176: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2901f  ! 177: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xcc42e050  ! 178: LDSW_I	ldsw	[%r11 + 0x0050], %r6
	.word 0xcbe2d01f  ! 179: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xd28a905f  ! 180: LDUBA_R	lduba	[%r10, %r31] 0x82, %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbe2a01f  ! 181: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc83a801f  ! 182: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba995f  ! 183: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2901f  ! 184: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xc59aa030  ! 185: LDDFA_I	ldda	[%r10, 0x0030], %f2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc302a07c  ! 186: LDF_I	ld	[%r10, 0x007c], %f1
	.word 0xd1bad85f  ! 187: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae060  ! 188: STD_I	std	%r8, [%r11 + 0x0060]
	.word 0xd202801f  ! 189: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xd1bad97f  ! 190: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1bad91f  ! 191: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad93f  ! 192: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xce12a01a  ! 193: LDUH_I	lduh	[%r10 + 0x001a], %r7
	.word 0xcc42801f  ! 194: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xc9ba987f  ! 195: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9ba981f  ! 196: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba995f  ! 197: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 198: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba995f  ! 199: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2913f  ! 200: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd2d2a020  ! 201: LDSHA_I	ldsha	[%r10, + 0x0020] %asi, %r9
	.word 0xd1ba981f  ! 202: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc292a03a  ! 203: LDUHA_I	lduha	[%r10, + 0x003a] %asi, %r1
	.word 0xc5bad81f  ! 204: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 205: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5e2d03f  ! 206: CASA_I	casa	[%r11] 0x81, %r31, %r2
	.word 0xd3bae038  ! 207: STDFA_I	stda	%f9, [0x0038, %r11]
	.word 0xc9ba993f  ! 208: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcd9aa000  ! 209: LDDFA_I	ldda	[%r10, 0x0000], %f6
	.word 0xd28a905f  ! 210: LDUBA_R	lduba	[%r10, %r31] 0x82, %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5ba991f  ! 211: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 212: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc692d15f  ! 213: LDUHA_R	lduha	[%r11, %r31] 0x8a, %r3
	.word 0xc7ba987f  ! 214: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc922801f  ! 215: STF_R	st	%f4, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3ba983f  ! 216: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc4c2905f  ! 217: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r2
	.word 0xcde2901f  ! 218: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xcdba997f  ! 219: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 220: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdba995f  ! 221: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 222: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2911f  ! 223: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xc39aa070  ! 224: LDDFA_I	ldda	[%r10, 0x0070], %f1
	.word 0xc812801f  ! 225: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd302a064  ! 226: LDF_I	ld	[%r10, 0x0064], %f9
	.word 0xccc2a068  ! 227: LDSWA_I	ldswa	[%r10, + 0x0068] %asi, %r6
	.word 0xd282d07f  ! 228: LDUWA_R	lduwa	[%r11, %r31] 0x83, %r9
	.word 0xd09aa000  ! 229: LDDA_I	ldda	[%r10, + 0x0000] %asi, %r8
	.word 0xcdbaa000  ! 230: STDFA_I	stda	%f6, [0x0000, %r10]
TH_LABEL230:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc2c2907f  ! 231: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r1
	.word 0xc2dad05f  ! 232: LDXA_R	ldxa	[%r11, %r31] 0x82, %r1
	.word 0xc81ae078  ! 233: LDD_I	ldd	[%r11 + 0x0078], %r4
	.word 0xc81ac01f  ! 234: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xc9f2901f  ! 235: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9ba983f  ! 236: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 237: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 238: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2a01f  ! 239: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2a01f  ! 240: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcb02801f  ! 241: LDF_R	ld	[%r10, %r31], %f5
	.word 0xcfe2a01f  ! 242: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xce52801f  ! 243: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xccc2905f  ! 244: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r6
	.word 0xd252801f  ! 245: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7ba98bf  ! 246: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba99bf  ! 247: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 248: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 249: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 250: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7f2911f  ! 251: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xc7f2a01f  ! 252: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba98bf  ! 253: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 254: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba999f  ! 255: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5bae060  ! 256: STDFA_I	stda	%f2, [0x0060, %r11]
	.word 0xd2cae018  ! 257: LDSBA_I	ldsba	[%r11, + 0x0018] %asi, %r9
	.word 0xc6c2a050  ! 258: LDSWA_I	ldswa	[%r10, + 0x0050] %asi, %r3
	.word 0xd28aa04f  ! 259: LDUBA_I	lduba	[%r10, + 0x004f] %asi, %r9
	.word 0xc492913f  ! 260: LDUHA_R	lduha	[%r10, %r31] 0x89, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfba991f  ! 261: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 262: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2901f  ! 263: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcfba99bf  ! 264: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca12a078  ! 265: LDUH_I	lduh	[%r10 + 0x0078], %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd03aa068  ! 266: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xd3e2a01f  ! 267: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc2caa013  ! 268: LDSBA_I	ldsba	[%r10, + 0x0013] %asi, %r1
	.word 0xcdf2911f  ! 269: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xca42c01f  ! 270: LDSW_R	ldsw	[%r11 + %r31], %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc4d2a07a  ! 271: LDSHA_I	ldsha	[%r10, + 0x007a] %asi, %r2
	.word 0xcc3a801f  ! 272: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd0ca901f  ! 273: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r8
	.word 0xc3e2d03f  ! 274: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xc3bad99f  ! 275: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc28aa071  ! 276: LDUBA_I	lduba	[%r10, + 0x0071] %asi, %r1
	.word 0xc6d2d17f  ! 277: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r3
	.word 0xd212801f  ! 278: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xc5e2901f  ! 279: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba997f  ! 280: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcd22801f  ! 281: STF_R	st	%f6, [%r31, %r10]
	.word 0xd3ba989f  ! 282: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd212801f  ! 283: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xc43ac01f  ! 284: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 285: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd19aa048  ! 286: LDDFA_I	ldda	[%r10, 0x0048], %f8
	.word 0xd092915f  ! 287: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r8
	.word 0xcc0a801f  ! 288: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xd102a028  ! 289: LDF_I	ld	[%r10, 0x0028], %f8
	.word 0xd03a801f  ! 290: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3ba987f  ! 291: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba999f  ! 292: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc28ad11f  ! 293: LDUBA_R	lduba	[%r11, %r31] 0x88, %r1
	.word 0xcbf2e01f  ! 294: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xd302a034  ! 295: LDF_I	ld	[%r10, 0x0034], %f9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcedad13f  ! 296: LDXA_R	ldxa	[%r11, %r31] 0x89, %r7
	.word 0xcbba993f  ! 297: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba983f  ! 298: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 299: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba989f  ! 300: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbba981f  ! 301: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xce12c01f  ! 302: LDUH_R	lduh	[%r11 + %r31], %r7
	.word 0xc5ba98bf  ! 303: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 304: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba993f  ! 305: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5e2901f  ! 306: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xca8a917f  ! 307: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r5
	.word 0xd202c01f  ! 308: LDUW_R	lduw	[%r11 + %r31], %r9
	.word 0xcdba981f  ! 309: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba991f  ! 310: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL310:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdf2a01f  ! 311: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba985f  ! 312: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 313: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba999f  ! 314: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba99bf  ! 315: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL315:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcde2a01f  ! 316: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba987f  ! 317: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2913f  ! 318: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xc252801f  ! 319: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xc7ba983f  ! 320: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7ba999f  ! 321: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 322: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 323: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 324: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc6c2903f  ! 325: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc6c2e044  ! 326: LDSWA_I	ldswa	[%r11, + 0x0044] %asi, %r3
	.word 0xd3f2d01f  ! 327: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd302801f  ! 328: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc59aa078  ! 329: LDDFA_I	ldda	[%r10, 0x0078], %f2
	.word 0xcc8ae067  ! 330: LDUBA_I	lduba	[%r11, + 0x0067] %asi, %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9e2911f  ! 331: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba983f  ! 332: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd2d2a01a  ! 333: LDSHA_I	ldsha	[%r10, + 0x001a] %asi, %r9
	.word 0xc322801f  ! 334: STF_R	st	%f1, [%r31, %r10]
	.word 0xc81aa070  ! 335: LDD_I	ldd	[%r10 + 0x0070], %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc2c2a020  ! 336: LDSWA_I	ldswa	[%r10, + 0x0020] %asi, %r1
	.word 0xd1ba987f  ! 337: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba991f  ! 338: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 339: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba987f  ! 340: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xced2a052  ! 341: LDSHA_I	ldsha	[%r10, + 0x0052] %asi, %r7
	.word 0xcfbad97f  ! 342: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc5a801f  ! 343: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xc842e068  ! 344: LDSW_I	ldsw	[%r11 + 0x0068], %r4
	.word 0xc3f2e01f  ! 345: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3bad91f  ! 346: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc6c2a020  ! 347: LDSWA_I	ldswa	[%r10, + 0x0020] %asi, %r3
	.word 0xc03ac01f  ! 348: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad99f  ! 349: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d03f  ! 350: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xce12e054  ! 351: LDUH_I	lduh	[%r11 + 0x0054], %r7
	.word 0xc642c01f  ! 352: LDSW_R	ldsw	[%r11 + %r31], %r3
	.word 0xcfbad9bf  ! 353: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ae030  ! 354: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcff2d13f  ! 355: CASXA_I	casxa	[%r11] 0x89, %r31, %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc3ae030  ! 356: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcfbad93f  ! 357: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2e01f  ! 358: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcfbad81f  ! 359: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad87f  ! 360: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xce42c01f  ! 361: LDSW_R	ldsw	[%r11 + %r31], %r7
	.word 0xd03aa030  ! 362: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xc20a801f  ! 363: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xc3ba987f  ! 364: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xca5a801f  ! 365: LDX_R	ldx	[%r10 + %r31], %r5
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3ba997f  ! 366: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 367: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcbbaa070  ! 368: STDFA_I	stda	%f5, [0x0070, %r10]
	.word 0xd1e2901f  ! 369: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba993f  ! 370: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1e2901f  ! 371: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba981f  ! 372: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 373: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa010  ! 374: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1ba985f  ! 375: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc602801f  ! 376: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xcbbad95f  ! 377: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d01f  ! 378: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbe2e01f  ! 379: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbf2d13f  ! 380: CASXA_I	casxa	[%r11] 0x89, %r31, %r5
TH_LABEL380:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc502c01f  ! 381: LDF_R	ld	[%r11, %r31], %f2
	.word 0xd1ba981f  ! 382: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 383: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2903f  ! 384: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xc5baa078  ! 385: STDFA_I	stda	%f2, [0x0078, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1baa008  ! 386: STDFA_I	stda	%f8, [0x0008, %r10]
	.word 0xcff2a01f  ! 387: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xd25a801f  ! 388: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xd3baa020  ! 389: STDFA_I	stda	%f9, [0x0020, %r10]
	.word 0xc43a801f  ! 390: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc682a060  ! 391: LDUWA_I	lduwa	[%r10, + 0x0060] %asi, %r3
	.word 0xd3bad91f  ! 392: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 393: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xc852a00a  ! 394: LDSH_I	ldsh	[%r10 + 0x000a], %r4
	.word 0xc9ba997f  ! 395: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9ba993f  ! 396: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 397: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xccd2917f  ! 398: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r6
	.word 0xd212801f  ! 399: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xcbbaa030  ! 400: STDFA_I	stda	%f5, [0x0030, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdbad99f  ! 401: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad9bf  ! 402: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad87f  ! 403: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 404: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcc3ae050  ! 405: STD_I	std	%r6, [%r11 + 0x0050]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc3ac01f  ! 406: STD_R	std	%r6, [%r11 + %r31]
	.word 0xc202a000  ! 407: LDUW_I	lduw	[%r10 + 0x0000], %r1
	.word 0xc7e2d11f  ! 408: CASA_I	casa	[%r11] 0x88, %r31, %r3
	.word 0xc7bad85f  ! 409: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad91f  ! 410: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7e2e01f  ! 411: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc7bad81f  ! 412: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd282a064  ! 413: LDUWA_I	lduwa	[%r10, + 0x0064] %asi, %r9
	.word 0xc59aa068  ! 414: LDDFA_I	ldda	[%r10, 0x0068], %f2
	.word 0xc03a801f  ! 415: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3ba98bf  ! 416: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2903f  ! 417: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xce42e038  ! 418: LDSW_I	ldsw	[%r11 + 0x0038], %r7
	.word 0xc83ae020  ! 419: STD_I	std	%r4, [%r11 + 0x0020]
	.word 0xc83ac01f  ! 420: STD_R	std	%r4, [%r11 + %r31]
TH_LABEL420:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd102c01f  ! 421: LDF_R	ld	[%r11, %r31], %f8
	.word 0xd1ba999f  ! 422: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 423: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd212a03c  ! 424: LDUH_I	lduh	[%r10 + 0x003c], %r9
	.word 0xc3ba99bf  ! 425: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL425:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3ba993f  ! 426: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xce52801f  ! 427: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xcf9ae008  ! 428: LDDFA_I	ldda	[%r11, 0x0008], %f7
	.word 0xcfba981f  ! 429: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba999f  ! 430: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfba981f  ! 431: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba999f  ! 432: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 433: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd2c2a070  ! 434: LDSWA_I	ldswa	[%r10, + 0x0070] %asi, %r9
	.word 0xd3ba987f  ! 435: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd03a801f  ! 436: STD_R	std	%r8, [%r10 + %r31]
	.word 0xcc5ae000  ! 437: LDX_I	ldx	[%r11 + 0x0000], %r6
	.word 0xd3bad91f  ! 438: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 439: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd03ac01f  ! 440: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd102801f  ! 441: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc492d11f  ! 442: LDUHA_R	lduha	[%r11, %r31] 0x88, %r2
	.word 0xd3f2a01f  ! 443: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xcb9ae010  ! 444: LDDFA_I	ldda	[%r11, 0x0010], %f5
	.word 0xc892a068  ! 445: LDUHA_I	lduha	[%r10, + 0x0068] %asi, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcd02c01f  ! 446: LDF_R	ld	[%r11, %r31], %f6
	.word 0xcfba993f  ! 447: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 448: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xd2c2d11f  ! 449: LDSWA_R	ldswa	[%r11, %r31] 0x88, %r9
	.word 0xc2d2a026  ! 450: LDSHA_I	ldsha	[%r10, + 0x0026] %asi, %r1
TH_LABEL450:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5f2a01f  ! 451: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc452e07c  ! 452: LDSH_I	ldsh	[%r11 + 0x007c], %r2
	.word 0xc252801f  ! 453: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xc3bad89f  ! 454: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad81f  ! 455: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3bad91f  ! 456: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcc1ae038  ! 457: LDD_I	ldd	[%r11 + 0x0038], %r6
	.word 0xd3ba983f  ! 458: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd39ae048  ! 459: LDDFA_I	ldda	[%r11, 0x0048], %f9
	.word 0xcbbad85f  ! 460: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbbad89f  ! 461: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd102a02c  ! 462: LDF_I	ld	[%r10, 0x002c], %f8
	.word 0xc3e2a01f  ! 463: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xd0cad07f  ! 464: LDSBA_R	ldsba	[%r11, %r31] 0x83, %r8
	.word 0xc40ac01f  ! 465: LDUB_R	ldub	[%r11 + %r31], %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc412801f  ! 466: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xc7bad99f  ! 467: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 468: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad99f  ! 469: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad8bf  ! 470: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc43ae010  ! 471: STD_I	std	%r2, [%r11 + 0x0010]
	.word 0xcc4aa010  ! 472: LDSB_I	ldsb	[%r10 + 0x0010], %r6
	.word 0xc9e2e01f  ! 473: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d13f  ! 474: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc39aa068  ! 475: LDDFA_I	ldda	[%r10, 0x0068], %f1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd0da911f  ! 476: LDXA_R	ldxa	[%r10, %r31] 0x88, %r8
	.word 0xc43a801f  ! 477: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba981f  ! 478: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcf9aa018  ! 479: LDDFA_I	ldda	[%r10, 0x0018], %f7
	.word 0xc7ba995f  ! 480: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc84a801f  ! 481: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xcfba985f  ! 482: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc852a00c  ! 483: LDSH_I	ldsh	[%r10 + 0x000c], %r4
	.word 0xc482901f  ! 484: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r2
	.word 0xc7f2a01f  ! 485: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7ba993f  ! 486: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 487: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc902e04c  ! 488: LDF_I	ld	[%r11, 0x004c], %f4
	.word 0xc4cad01f  ! 489: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r2
	.word 0xcfba989f  ! 490: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcd22801f  ! 491: STF_R	st	%f6, [%r31, %r10]
	.word 0xc5bae038  ! 492: STDFA_I	stda	%f2, [0x0038, %r11]
	.word 0xc4cae02b  ! 493: LDSBA_I	ldsba	[%r11, + 0x002b] %asi, %r2
	.word 0xcf02c01f  ! 494: LDF_R	ld	[%r11, %r31], %f7
	.word 0xc902801f  ! 495: LDF_R	ld	[%r10, %r31], %f4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc42a044  ! 496: LDSW_I	ldsw	[%r10 + 0x0044], %r6
	.word 0xc452a012  ! 497: LDSH_I	ldsh	[%r10 + 0x0012], %r2
	.word 0xc5e2911f  ! 498: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5ba989f  ! 499: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 500: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd19ae000  ! 501: LDDFA_I	ldda	[%r11, 0x0000], %f8
	.word 0xccca915f  ! 502: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r6
	.word 0xc612a01a  ! 503: LDUH_I	lduh	[%r10 + 0x001a], %r3
	.word 0xcfbad83f  ! 504: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d03f  ! 505: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfe2d11f  ! 506: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xcfbad95f  ! 507: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcb02c01f  ! 508: LDF_R	ld	[%r11, %r31], %f5
	.word 0xc5ba981f  ! 509: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba99bf  ! 510: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5ba981f  ! 511: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 512: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 513: STD_R	std	%r2, [%r10 + %r31]
	.word 0xcc4ae03f  ! 514: LDSB_I	ldsb	[%r11 + 0x003f], %r6
	.word 0xc242801f  ! 515: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc6daa040  ! 516: LDXA_I	ldxa	[%r10, + 0x0040] %asi, %r3
	.word 0xc2caa062  ! 517: LDSBA_I	ldsba	[%r10, + 0x0062] %asi, %r1
	.word 0xd20a801f  ! 518: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xd242e004  ! 519: LDSW_I	ldsw	[%r11 + 0x0004], %r9
	.word 0xc9bad83f  ! 520: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc01aa060  ! 521: LDD_I	ldd	[%r10 + 0x0060], %r0
	.word 0xcdbae078  ! 522: STDFA_I	stda	%f6, [0x0078, %r11]
	.word 0xc83a801f  ! 523: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba989f  ! 524: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 525: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9f2a01f  ! 526: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xcbbae048  ! 527: STDFA_I	stda	%f5, [0x0048, %r11]
	.word 0xc7bae038  ! 528: STDFA_I	stda	%f3, [0x0038, %r11]
	.word 0xc9bae028  ! 529: STDFA_I	stda	%f4, [0x0028, %r11]
	.word 0xcdba989f  ! 530: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdba987f  ! 531: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd3baa058  ! 532: STDFA_I	stda	%f9, [0x0058, %r10]
	.word 0xcdbad83f  ! 533: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc482e030  ! 534: LDUWA_I	lduwa	[%r11, + 0x0030] %asi, %r2
	.word 0xd03a801f  ! 535: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3e2913f  ! 536: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xc892a03c  ! 537: LDUHA_I	lduha	[%r10, + 0x003c] %asi, %r4
	.word 0xd052801f  ! 538: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xd1bad99f  ! 539: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xca52801f  ! 540: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9e2e01f  ! 541: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2e01f  ! 542: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc6daa078  ! 543: LDXA_I	ldxa	[%r10, + 0x0078] %asi, %r3
	.word 0xd2d2901f  ! 544: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r9
	.word 0xc7ba991f  ! 545: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc43aa008  ! 546: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7ba983f  ! 547: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 548: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd322801f  ! 549: STF_R	st	%f9, [%r31, %r10]
	.word 0xd3bad99f  ! 550: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3bad87f  ! 551: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae008  ! 552: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3bad83f  ! 553: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae008  ! 554: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3e2e01f  ! 555: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc602a014  ! 556: LDUW_I	lduw	[%r10 + 0x0014], %r3
	.word 0xd1ba993f  ! 557: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca52e068  ! 558: LDSH_I	ldsh	[%r11 + 0x0068], %r5
	.word 0xc83ae028  ! 559: STD_I	std	%r4, [%r11 + 0x0028]
	.word 0xc9bad97f  ! 560: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9bad9bf  ! 561: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 562: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad93f  ! 563: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc28ae07f  ! 564: LDUBA_I	lduba	[%r11, + 0x007f] %asi, %r1
	.word 0xcde2d03f  ! 565: CASA_I	casa	[%r11] 0x81, %r31, %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc25ac01f  ! 566: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xc49aa040  ! 567: LDDA_I	ldda	[%r10, + 0x0040] %asi, %r2
	.word 0xd1e2911f  ! 568: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xc6da901f  ! 569: LDXA_R	ldxa	[%r10, %r31] 0x80, %r3
	.word 0xc9f2901f  ! 570: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
TH_LABEL570:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd08ae00f  ! 571: LDUBA_I	lduba	[%r11, + 0x000f] %asi, %r8
	.word 0xcdf2a01f  ! 572: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcfbae030  ! 573: STDFA_I	stda	%f7, [0x0030, %r11]
	.word 0xc7f2901f  ! 574: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba997f  ! 575: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc8c2905f  ! 576: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r4
	.word 0xc8cae031  ! 577: LDSBA_I	ldsba	[%r11, + 0x0031] %asi, %r4
	.word 0xc83aa010  ! 578: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xcbf2911f  ! 579: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xcbba995f  ! 580: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc83a801f  ! 581: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbe2a01f  ! 582: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xca5ac01f  ! 583: LDX_R	ldx	[%r11 + %r31], %r5
	.word 0xc3bad91f  ! 584: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 585: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc702a048  ! 586: LDF_I	ld	[%r10, 0x0048], %f3
	.word 0xc83aa008  ! 587: STD_I	std	%r4, [%r10 + 0x0008]
	.word 0xd24a801f  ! 588: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xc03a801f  ! 589: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc4c2e04c  ! 590: LDSWA_I	ldswa	[%r11, + 0x004c] %asi, %r2
TH_LABEL590:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfbad91f  ! 591: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc65ac01f  ! 592: LDX_R	ldx	[%r11 + %r31], %r3
	.word 0xc5f2a01f  ! 593: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xd302801f  ! 594: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd1ba987f  ! 595: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd03aa028  ! 596: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd1f2a01f  ! 597: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2901f  ! 598: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xc442e068  ! 599: LDSW_I	ldsw	[%r11 + 0x0068], %r2
	.word 0xd3f2a01f  ! 600: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc402801f  ! 601: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xd302c01f  ! 602: LDF_R	ld	[%r11, %r31], %f9
	.word 0xc5e2a01f  ! 603: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 604: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba987f  ! 605: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc39aa068  ! 606: LDDFA_I	ldda	[%r10, 0x0068], %f1
	.word 0xc922801f  ! 607: STF_R	st	%f4, [%r31, %r10]
	.word 0xcbba983f  ! 608: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 609: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcc1aa078  ! 610: LDD_I	ldd	[%r10 + 0x0078], %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd242a078  ! 611: LDSW_I	ldsw	[%r10 + 0x0078], %r9
	.word 0xd1bad89f  ! 612: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 613: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 614: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d03f  ! 615: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1bad95f  ! 616: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad8bf  ! 617: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc39aa040  ! 618: LDDFA_I	ldda	[%r10, 0x0040], %f1
	.word 0xd1bad93f  ! 619: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 620: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc1a801f  ! 621: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc68aa051  ! 622: LDUBA_I	lduba	[%r10, + 0x0051] %asi, %r3
	.word 0xceca905f  ! 623: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r7
	.word 0xcbbaa038  ! 624: STDFA_I	stda	%f5, [0x0038, %r10]
	.word 0xcdbae008  ! 625: STDFA_I	stda	%f6, [0x0008, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc68a901f  ! 626: LDUBA_R	lduba	[%r10, %r31] 0x80, %r3
	.word 0xcbbad9bf  ! 627: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad95f  ! 628: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad95f  ! 629: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad87f  ! 630: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbbad93f  ! 631: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 632: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbf2d01f  ! 633: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad89f  ! 634: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 635: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc83ac01f  ! 636: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad81f  ! 637: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad9bf  ! 638: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad8bf  ! 639: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc612a02e  ! 640: LDUH_I	lduh	[%r10 + 0x002e], %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbf2a01f  ! 641: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba983f  ! 642: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 643: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba989f  ! 644: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd05aa048  ! 645: LDX_I	ldx	[%r10 + 0x0048], %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9ba989f  ! 646: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc44ae029  ! 647: LDSB_I	ldsb	[%r11 + 0x0029], %r2
	.word 0xcdba997f  ! 648: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba991f  ! 649: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd01ae070  ! 650: LDD_I	ldd	[%r11 + 0x0070], %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd01ac01f  ! 651: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xc3ba997f  ! 652: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 653: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc4ca915f  ! 654: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r2
	.word 0xc3f2a01f  ! 655: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc44a801f  ! 656: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xc3ba983f  ! 657: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba989f  ! 659: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2901f  ! 660: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc64aa05d  ! 661: LDSB_I	ldsb	[%r10 + 0x005d], %r3
	.word 0xc502e050  ! 662: LDF_I	ld	[%r11, 0x0050], %f2
	.word 0xcfe2901f  ! 663: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcc3a801f  ! 664: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc3a801f  ! 665: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9baa010  ! 666: STDFA_I	stda	%f4, [0x0010, %r10]
	.word 0xcfbad93f  ! 667: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad93f  ! 668: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d13f  ! 669: CASXA_I	casxa	[%r11] 0x89, %r31, %r7
	.word 0xd202e014  ! 670: LDUW_I	lduw	[%r11 + 0x0014], %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xce02c01f  ! 671: LDUW_R	lduw	[%r11 + %r31], %r7
	.word 0xcbba993f  ! 672: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba995f  ! 673: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc7bae038  ! 674: STDFA_I	stda	%f3, [0x0038, %r11]
	.word 0xc88a917f  ! 675: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7e2a01f  ! 676: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xccdae050  ! 677: LDXA_I	ldxa	[%r11, + 0x0050] %asi, %r6
	.word 0xc43a801f  ! 678: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba997f  ! 679: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 680: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc702c01f  ! 681: LDF_R	ld	[%r11, %r31], %f3
	.word 0xc902801f  ! 682: LDF_R	ld	[%r10, %r31], %f4
	.word 0xcdf2e01f  ! 683: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xcdbad95f  ! 684: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae040  ! 685: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdbad81f  ! 686: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc79ae058  ! 687: LDDFA_I	ldda	[%r11, 0x0058], %f3
	.word 0xc722801f  ! 688: STF_R	st	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 689: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 690: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc4d2d01f  ! 691: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r2
	.word 0xc282e064  ! 692: LDUWA_I	lduwa	[%r11, + 0x0064] %asi, %r1
	.word 0xd302e078  ! 693: LDF_I	ld	[%r11, 0x0078], %f9
	.word 0xc83aa000  ! 694: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xce92a014  ! 695: LDUHA_I	lduha	[%r10, + 0x0014] %asi, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfba98bf  ! 696: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc42a02c  ! 697: LDSW_I	ldsw	[%r10 + 0x002c], %r6
	.word 0xc3bad81f  ! 698: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcedae060  ! 699: LDXA_I	ldxa	[%r11, + 0x0060] %asi, %r7
	.word 0xccda907f  ! 700: LDXA_R	ldxa	[%r10, %r31] 0x83, %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3e2903f  ! 701: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd3ba991f  ! 702: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 703: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcac2e07c  ! 704: LDSWA_I	ldswa	[%r11, + 0x007c] %asi, %r5
	.word 0xcbbad91f  ! 705: STDFA_R	stda	%f5, [%r31, %r11]
TH_LABEL705:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcec2e05c  ! 706: LDSWA_I	ldswa	[%r11, + 0x005c] %asi, %r7
	.word 0xc5ba989f  ! 707: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 708: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcad2a072  ! 709: LDSHA_I	ldsha	[%r10, + 0x0072] %asi, %r5
	.word 0xc3e2a01f  ! 710: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc03aa010  ! 711: STD_I	std	%r0, [%r10 + 0x0010]
	.word 0xc3ba993f  ! 712: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba983f  ! 713: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc45ae010  ! 714: LDX_I	ldx	[%r11 + 0x0010], %r2
	.word 0xcfbaa008  ! 715: STDFA_I	stda	%f7, [0x0008, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1f2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba999f  ! 717: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba991f  ! 718: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 719: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc5a801f  ! 720: LDX_R	ldx	[%r10 + %r31], %r6
TH_LABEL720:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5ba997f  ! 721: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2903f  ! 722: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc09ae058  ! 723: LDDA_I	ldda	[%r11, + 0x0058] %asi, %r0
	.word 0xca02a004  ! 724: LDUW_I	lduw	[%r10 + 0x0004], %r5
	.word 0xce42a01c  ! 725: LDSW_I	ldsw	[%r10 + 0x001c], %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbbad85f  ! 726: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad95f  ! 727: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad9bf  ! 728: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc812a024  ! 729: LDUH_I	lduh	[%r10 + 0x0024], %r4
	.word 0xd3f2a01f  ! 730: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3e2a01f  ! 731: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc01ac01f  ! 732: LDD_R	ldd	[%r11 + %r31], %r0
	.word 0xc09aa000  ! 733: LDDA_I	ldda	[%r10, + 0x0000] %asi, %r0
	.word 0xc702e00c  ! 734: LDF_I	ld	[%r11, 0x000c], %f3
	.word 0xcc3aa008  ! 735: STD_I	std	%r6, [%r10 + 0x0008]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfe2a01f  ! 736: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc242a060  ! 737: LDSW_I	ldsw	[%r10 + 0x0060], %r1
	.word 0xd122801f  ! 738: STF_R	st	%f8, [%r31, %r10]
	.word 0xca12c01f  ! 739: LDUH_R	lduh	[%r11 + %r31], %r5
	.word 0xd1f2913f  ! 740: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
TH_LABEL740:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1ba983f  ! 741: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc2c2a044  ! 742: LDSWA_I	ldswa	[%r10, + 0x0044] %asi, %r1
	.word 0xc68ae057  ! 743: LDUBA_I	lduba	[%r11, + 0x0057] %asi, %r3
	.word 0xc83ac01f  ! 744: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbe2d11f  ! 745: CASA_I	casa	[%r11] 0x88, %r31, %r5
TH_LABEL745:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbbad81f  ! 746: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad9bf  ! 747: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcf02801f  ! 748: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc3bad85f  ! 749: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc702e038  ! 750: LDF_I	ld	[%r11, 0x0038], %f3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd242c01f  ! 751: LDSW_R	ldsw	[%r11 + %r31], %r9
	.word 0xd1f2a01f  ! 752: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2a01f  ! 753: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa000  ! 754: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xce5ac01f  ! 755: LDX_R	ldx	[%r11 + %r31], %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9f2d13f  ! 756: CASXA_I	casxa	[%r11] 0x89, %r31, %r4
	.word 0xd092e050  ! 757: LDUHA_I	lduha	[%r11, + 0x0050] %asi, %r8
	.word 0xcfbad91f  ! 758: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc902a030  ! 759: LDF_I	ld	[%r10, 0x0030], %f4
	.word 0xcdba999f  ! 760: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdba98bf  ! 761: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2901f  ! 762: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xc842c01f  ! 763: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xc9e2d13f  ! 764: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xd19ae028  ! 765: LDDFA_I	ldda	[%r11, 0x0028], %f8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1e2a01f  ! 766: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1e2a01f  ! 767: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 768: STD_R	std	%r8, [%r10 + %r31]
	.word 0xca12a078  ! 769: LDUH_I	lduh	[%r10 + 0x0078], %r5
	.word 0xc9bad81f  ! 770: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9bad97f  ! 771: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc252a00c  ! 772: LDSH_I	ldsh	[%r10 + 0x000c], %r1
	.word 0xc902801f  ! 773: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc4ca913f  ! 774: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r2
	.word 0xd1f2913f  ! 775: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd03aa058  ! 776: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd1baa038  ! 777: STDFA_I	stda	%f8, [0x0038, %r10]
	.word 0xcc0a801f  ! 778: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xc7ba995f  ! 779: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 780: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7ba995f  ! 781: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 782: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2903f  ! 783: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba981f  ! 784: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc9baa028  ! 785: STDFA_I	stda	%f4, [0x0028, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7baa078  ! 786: STDFA_I	stda	%f3, [0x0078, %r10]
	.word 0xc9bad99f  ! 787: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad8bf  ! 788: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 789: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc292d03f  ! 790: LDUHA_R	lduha	[%r11, %r31] 0x81, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc322c01f  ! 791: STF_R	st	%f1, [%r31, %r11]
	.word 0xc7ba981f  ! 792: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc6c2a030  ! 793: LDSWA_I	ldswa	[%r10, + 0x0030] %asi, %r3
	.word 0xc3e2a01f  ! 794: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xcfbae028  ! 795: STDFA_I	stda	%f7, [0x0028, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc4aa021  ! 796: LDSB_I	ldsb	[%r10 + 0x0021], %r6
	.word 0xcfba999f  ! 797: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 798: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc89ae058  ! 799: LDDA_I	ldda	[%r11, + 0x0058] %asi, %r4
	.word 0xc2caa030  ! 800: LDSBA_I	ldsba	[%r10, + 0x0030] %asi, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3f2d01f  ! 801: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc652c01f  ! 802: LDSH_R	ldsh	[%r11 + %r31], %r3
	.word 0xc43ae048  ! 803: STD_I	std	%r2, [%r11 + 0x0048]
	.word 0xc8da911f  ! 804: LDXA_R	ldxa	[%r10, %r31] 0x88, %r4
	.word 0xcc92a06e  ! 805: LDUHA_I	lduha	[%r10, + 0x006e] %asi, %r6
TH_LABEL805:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcde2e01f  ! 806: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xc7bae028  ! 807: STDFA_I	stda	%f3, [0x0028, %r11]
	.word 0xc9f2913f  ! 808: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9e2903f  ! 809: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc9e2a01f  ! 810: CASA_R	casa	[%r10] %asi, %r31, %r4
TH_LABEL810:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9f2a01f  ! 811: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xca12e076  ! 812: LDUH_I	lduh	[%r11 + 0x0076], %r5
	.word 0xd2d2a04c  ! 813: LDSHA_I	ldsha	[%r10, + 0x004c] %asi, %r9
	.word 0xd002801f  ! 814: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xd1bad95f  ! 815: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1bad81f  ! 816: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d01f  ! 817: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xc922c01f  ! 818: STF_R	st	%f4, [%r31, %r11]
	.word 0xd052a062  ! 819: LDSH_I	ldsh	[%r10 + 0x0062], %r8
	.word 0xce52a054  ! 820: LDSH_I	ldsh	[%r10 + 0x0054], %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc43aa060  ! 821: STD_I	std	%r2, [%r10 + 0x0060]
	.word 0xd01ae068  ! 822: LDD_I	ldd	[%r11 + 0x0068], %r8
	.word 0xc4c2913f  ! 823: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r2
	.word 0xc3ba995f  ! 824: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba987f  ! 825: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd01aa000  ! 826: LDD_I	ldd	[%r10 + 0x0000], %r8
	.word 0xd1f2a01f  ! 827: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd0d2a078  ! 828: LDSHA_I	ldsha	[%r10, + 0x0078] %asi, %r8
	.word 0xcc3aa050  ! 829: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xcff2901f  ! 830: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfba991f  ! 831: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 832: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc242a018  ! 833: LDSW_I	ldsw	[%r10 + 0x0018], %r1
	.word 0xd3ba987f  ! 834: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcccaa04f  ! 835: LDSBA_I	ldsba	[%r10, + 0x004f] %asi, %r6
TH_LABEL835:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc612c01f  ! 836: LDUH_R	lduh	[%r11 + %r31], %r3
	.word 0xd122801f  ! 837: STF_R	st	%f8, [%r31, %r10]
	.word 0xc452c01f  ! 838: LDSH_R	ldsh	[%r11 + %r31], %r2
	.word 0xcdbad9bf  ! 839: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc652801f  ! 840: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd08aa051  ! 841: LDUBA_I	lduba	[%r10, + 0x0051] %asi, %r8
	.word 0xd1ba983f  ! 842: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc79aa030  ! 843: LDDFA_I	ldda	[%r10, 0x0030], %f3
	.word 0xcbba981f  ! 844: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd042e028  ! 845: LDSW_I	ldsw	[%r11 + 0x0028], %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1bae030  ! 846: STDFA_I	stda	%f8, [0x0030, %r11]
	.word 0xca92e04a  ! 847: LDUHA_I	lduha	[%r11, + 0x004a] %asi, %r5
	.word 0xc252801f  ! 848: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xcdba987f  ! 849: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc28a907f  ! 850: LDUBA_R	lduba	[%r10, %r31] 0x83, %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3e2d13f  ! 851: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd0d2a016  ! 852: LDSHA_I	ldsha	[%r10, + 0x0016] %asi, %r8
	.word 0xd122801f  ! 853: STF_R	st	%f8, [%r31, %r10]
	.word 0xd1e2903f  ! 854: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd122801f  ! 855: STF_R	st	%f8, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc43ae008  ! 856: STD_I	std	%r2, [%r11 + 0x0008]
	.word 0xc64a801f  ! 857: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xc3bad87f  ! 858: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad81f  ! 859: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd082915f  ! 860: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r8
TH_LABEL860:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfba981f  ! 861: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 862: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcd02a038  ! 863: LDF_I	ld	[%r10, 0x0038], %f6
	.word 0xcc5a801f  ! 864: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xd3ba997f  ! 865: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3ba995f  ! 866: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 867: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 868: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba993f  ! 869: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 870: CASA_I	casa	[%r10] 0x81, %r31, %r9
TH_LABEL870:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xce12e032  ! 871: LDUH_I	lduh	[%r11 + 0x0032], %r7
	.word 0xc7ba981f  ! 872: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 873: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xd0caa039  ! 874: LDSBA_I	ldsba	[%r10, + 0x0039] %asi, %r8
	.word 0xd1ba995f  ! 875: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcd02a034  ! 876: LDF_I	ld	[%r10, 0x0034], %f6
	.word 0xcdf2e01f  ! 877: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xcad2911f  ! 878: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r5
	.word 0xc39aa028  ! 879: LDDFA_I	ldda	[%r10, 0x0028], %f1
	.word 0xce8ae01d  ! 880: LDUBA_I	lduba	[%r11, + 0x001d] %asi, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc40ac01f  ! 881: LDUB_R	ldub	[%r11 + %r31], %r2
	.word 0xc3ba999f  ! 882: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 883: STD_R	std	%r0, [%r10 + %r31]
	.word 0xcf02c01f  ! 884: LDF_R	ld	[%r11, %r31], %f7
	.word 0xc01ac01f  ! 885: LDD_R	ldd	[%r11 + %r31], %r0
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc402801f  ! 886: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xcbbad99f  ! 887: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 888: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xd122801f  ! 889: STF_R	st	%f8, [%r31, %r10]
	.word 0xc3baa028  ! 890: STDFA_I	stda	%f1, [0x0028, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9f2911f  ! 891: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc49aa058  ! 892: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r2
	.word 0xcc9aa018  ! 893: LDDA_I	ldda	[%r10, + 0x0018] %asi, %r6
	.word 0xd1f2a01f  ! 894: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba981f  ! 895: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc12a078  ! 896: LDUH_I	lduh	[%r10 + 0x0078], %r6
	.word 0xc4d2a048  ! 897: LDSHA_I	ldsha	[%r10, + 0x0048] %asi, %r2
	.word 0xccc2e00c  ! 898: LDSWA_I	ldswa	[%r11, + 0x000c] %asi, %r6
	.word 0xd1ba989f  ! 899: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc882a008  ! 900: LDUWA_I	lduwa	[%r10, + 0x0008] %asi, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcb9aa000  ! 901: LDDFA_I	ldda	[%r10, 0x0000], %f5
	.word 0xd082a060  ! 902: LDUWA_I	lduwa	[%r10, + 0x0060] %asi, %r8
	.word 0xc49ae040  ! 903: LDDA_I	ldda	[%r11, + 0x0040] %asi, %r2
	.word 0xcfbad99f  ! 904: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc20a801f  ! 905: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xca12801f  ! 906: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xcaca903f  ! 907: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r5
	.word 0xc7e2911f  ! 908: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba985f  ! 909: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa030  ! 910: STD_I	std	%r2, [%r10 + 0x0030]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcb9ae028  ! 911: LDDFA_I	ldda	[%r11, 0x0028], %f5
	.word 0xcbba981f  ! 912: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba999f  ! 913: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc922c01f  ! 914: STF_R	st	%f4, [%r31, %r11]
	.word 0xcc3ae050  ! 915: STD_I	std	%r6, [%r11 + 0x0050]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdbad85f  ! 916: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc242c01f  ! 917: LDSW_R	ldsw	[%r11 + %r31], %r1
	.word 0xd1e2e01f  ! 918: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad99f  ! 919: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcec2a06c  ! 920: LDSWA_I	ldswa	[%r10, + 0x006c] %asi, %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbba98bf  ! 921: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba99bf  ! 922: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 923: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba985f  ! 924: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa028  ! 925: STD_I	std	%r4, [%r10 + 0x0028]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbba993f  ! 926: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc41ae030  ! 927: LDD_I	ldd	[%r11 + 0x0030], %r2
	.word 0xc9ba997f  ! 928: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc302801f  ! 929: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc212801f  ! 930: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc252c01f  ! 931: LDSH_R	ldsh	[%r11 + %r31], %r1
	.word 0xc49ae078  ! 932: LDDA_I	ldda	[%r11, + 0x0078] %asi, %r2
	.word 0xcd9aa048  ! 933: LDDFA_I	ldda	[%r10, 0x0048], %f6
	.word 0xcde2d03f  ! 934: CASA_I	casa	[%r11] 0x81, %r31, %r6
	.word 0xcb02e06c  ! 935: LDF_I	ld	[%r11, 0x006c], %f5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5f2a01f  ! 936: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc43a801f  ! 937: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba993f  ! 938: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd242801f  ! 939: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xcbba989f  ! 940: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbf2a01f  ! 941: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xc492e06e  ! 942: LDUHA_I	lduha	[%r11, + 0x006e] %asi, %r2
	.word 0xcb02a020  ! 943: LDF_I	ld	[%r10, 0x0020], %f5
	.word 0xd3bad87f  ! 944: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2d01f  ! 945: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3bad81f  ! 946: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd102a04c  ! 947: LDF_I	ld	[%r10, 0x004c], %f8
	.word 0xd1bad99f  ! 948: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcecaa011  ! 949: LDSBA_I	ldsba	[%r10, + 0x0011] %asi, %r7
	.word 0xcdba995f  ! 950: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc482e038  ! 951: LDUWA_I	lduwa	[%r11, + 0x0038] %asi, %r2
	.word 0xc852c01f  ! 952: LDSH_R	ldsh	[%r11 + %r31], %r4
	.word 0xca42a074  ! 953: LDSW_I	ldsw	[%r10 + 0x0074], %r5
	.word 0xcfe2913f  ! 954: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcff2911f  ! 955: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfe2913f  ! 956: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcfba985f  ! 957: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa010  ! 958: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcfba983f  ! 959: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfbaa068  ! 960: STDFA_I	stda	%f7, [0x0068, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc65a801f  ! 961: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xd1ba987f  ! 962: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc642e074  ! 963: LDSW_I	ldsw	[%r11 + 0x0074], %r3
	.word 0xc3ba99bf  ! 964: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd20aa06b  ! 965: LDUB_I	ldub	[%r10 + 0x006b], %r9
TH_LABEL965:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc81a801f  ! 966: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xcfba983f  ! 967: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa038  ! 968: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcc3aa038  ! 969: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcc3a801f  ! 970: STD_R	std	%r6, [%r10 + %r31]
TH_LABEL970:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xce4a801f  ! 971: LDSB_R	ldsb	[%r10 + %r31], %r7
	.word 0xd24a801f  ! 972: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xcac2a028  ! 973: LDSWA_I	ldswa	[%r10, + 0x0028] %asi, %r5
	.word 0xd1bad97f  ! 974: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad93f  ! 975: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xce8aa003  ! 976: LDUBA_I	lduba	[%r10, + 0x0003] %asi, %r7
	.word 0xccca901f  ! 977: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r6
	.word 0xc48ae068  ! 978: LDUBA_I	lduba	[%r11, + 0x0068] %asi, %r2
	.word 0xd3e2a01f  ! 979: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba985f  ! 980: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL980:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd03aa058  ! 981: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3e2a01f  ! 982: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc902801f  ! 983: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc492e04a  ! 984: LDUHA_I	lduha	[%r11, + 0x004a] %asi, %r2
	.word 0xcc42c01f  ! 985: LDSW_R	ldsw	[%r11 + %r31], %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc02e018  ! 986: LDUW_I	lduw	[%r11 + 0x0018], %r6
	.word 0xd20aa029  ! 987: LDUB_I	ldub	[%r10 + 0x0029], %r9
	.word 0xc59ae030  ! 988: LDDFA_I	ldda	[%r11, 0x0030], %f2
	.word 0xc8dae060  ! 989: LDXA_I	ldxa	[%r11, + 0x0060] %asi, %r4
	.word 0xc5bad95f  ! 990: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5bad9bf  ! 991: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc892905f  ! 992: LDUHA_R	lduha	[%r10, %r31] 0x82, %r4
	.word 0xcb22801f  ! 993: STF_R	st	%f5, [%r31, %r10]
	.word 0xc7ba987f  ! 994: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcf22801f  ! 995: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3f2a01f  ! 996: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xce8a903f  ! 997: LDUBA_R	lduba	[%r10, %r31] 0x81, %r7
	.word 0xcfba98bf  ! 998: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd2ca905f  ! 999: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r9
	.word 0xcf02801f  ! 1000: LDF_R	ld	[%r10, %r31], %f7
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
	.word 0xc9ba981f  ! 1: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 2: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc692907f  ! 3: LDUHA_R	lduha	[%r10, %r31] 0x83, %r3
	.word 0xc412e078  ! 4: LDUH_I	lduh	[%r11 + 0x0078], %r2
	.word 0xc3baa058  ! 5: STDFA_I	stda	%f1, [0x0058, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc40a801f  ! 6: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xcfba995f  ! 7: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc7baa010  ! 8: STDFA_I	stda	%f3, [0x0010, %r10]
	.word 0xc9baa048  ! 9: STDFA_I	stda	%f4, [0x0048, %r10]
	.word 0xcdf2911f  ! 10: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc842801f  ! 11: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xc9bad85f  ! 12: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc40aa014  ! 13: LDUB_I	ldub	[%r10 + 0x0014], %r2
	.word 0xcbf2e01f  ! 14: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad85f  ! 15: STDFA_R	stda	%f5, [%r31, %r11]
TH_LABEL15:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbbad87f  ! 16: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 17: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad9bf  ! 18: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad89f  ! 19: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad99f  ! 20: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xca5aa048  ! 21: LDX_I	ldx	[%r10 + 0x0048], %r5
	.word 0xc7ba995f  ! 22: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcf02e03c  ! 23: LDF_I	ld	[%r11, 0x003c], %f7
	.word 0xca82d11f  ! 24: LDUWA_R	lduwa	[%r11, %r31] 0x88, %r5
	.word 0xc5f2903f  ! 25: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5f2a01f  ! 26: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xcf9aa010  ! 27: LDDFA_I	ldda	[%r10, 0x0010], %f7
	.word 0xc7f2901f  ! 28: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba991f  ! 29: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 30: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc4ca907f  ! 31: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r2
	.word 0xcb02801f  ! 32: LDF_R	ld	[%r10, %r31], %f5
	.word 0xcdba991f  ! 33: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba991f  ! 34: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 35: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd292907f  ! 36: LDUHA_R	lduha	[%r10, %r31] 0x83, %r9
	.word 0xc9ba983f  ! 37: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 38: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2901f  ! 39: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba98bf  ! 40: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd302c01f  ! 41: LDF_R	ld	[%r11, %r31], %f9
	.word 0xc7f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7e2a01f  ! 43: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xcb9aa008  ! 44: LDDFA_I	ldda	[%r10, 0x0008], %f5
	.word 0xd05a801f  ! 45: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc2da905f  ! 46: LDXA_R	ldxa	[%r10, %r31] 0x82, %r1
	.word 0xcfe2901f  ! 47: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcfe2a01f  ! 48: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba993f  ! 49: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd082911f  ! 50: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3bad81f  ! 51: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 52: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad99f  ! 53: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc882e020  ! 54: LDUWA_I	lduwa	[%r11, + 0x0020] %asi, %r4
	.word 0xc81ae040  ! 55: LDD_I	ldd	[%r11 + 0x0040], %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7bad99f  ! 56: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad89f  ! 57: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcc42c01f  ! 58: LDSW_R	ldsw	[%r11 + %r31], %r6
	.word 0xd0caa057  ! 59: LDSBA_I	ldsba	[%r10, + 0x0057] %asi, %r8
	.word 0xd302c01f  ! 60: LDF_R	ld	[%r11, %r31], %f9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3ba991f  ! 61: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd0dae028  ! 62: LDXA_I	ldxa	[%r11, + 0x0028] %asi, %r8
	.word 0xcc3ae060  ! 63: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xc4da901f  ! 64: LDXA_R	ldxa	[%r10, %r31] 0x80, %r2
	.word 0xc5f2911f  ! 65: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5ba987f  ! 66: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba98bf  ! 67: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc48aa071  ! 68: LDUBA_I	lduba	[%r10, + 0x0071] %asi, %r2
	.word 0xc7f2a01f  ! 69: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba99bf  ! 70: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL70:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7e2903f  ! 71: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba997f  ! 72: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba995f  ! 73: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 74: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd08aa02a  ! 75: LDUBA_I	lduba	[%r10, + 0x002a] %asi, %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc43ae000  ! 76: STD_I	std	%r2, [%r11 + 0x0000]
	.word 0xc5f2d13f  ! 77: CASXA_I	casxa	[%r11] 0x89, %r31, %r2
	.word 0xc5f2e01f  ! 78: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc43ac01f  ! 79: STD_R	std	%r2, [%r11 + %r31]
	.word 0xd09aa058  ! 80: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc03ae000  ! 81: STD_I	std	%r0, [%r11 + 0x0000]
	.word 0xc60aa063  ! 82: LDUB_I	ldub	[%r10 + 0x0063], %r3
	.word 0xc83a801f  ! 83: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc882d07f  ! 84: LDUWA_R	lduwa	[%r11, %r31] 0x83, %r4
	.word 0xcbba98bf  ! 85: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbf2901f  ! 86: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xc6da917f  ! 87: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r3
	.word 0xc522c01f  ! 88: STF_R	st	%f2, [%r31, %r11]
	.word 0xcc5a801f  ! 89: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xc3e2901f  ! 90: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc03a801f  ! 91: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3ba987f  ! 92: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 93: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xce8ad17f  ! 94: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r7
	.word 0xd012e074  ! 95: LDUH_I	lduh	[%r11 + 0x0074], %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc81ac01f  ! 96: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xc24ac01f  ! 97: LDSB_R	ldsb	[%r11 + %r31], %r1
	.word 0xc43ae050  ! 98: STD_I	std	%r2, [%r11 + 0x0050]
	.word 0xc43ae050  ! 99: STD_I	std	%r2, [%r11 + 0x0050]
	.word 0xced2d01f  ! 100: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc602801f  ! 101: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xc682e030  ! 102: LDUWA_I	lduwa	[%r11, + 0x0030] %asi, %r3
	.word 0xc3f2913f  ! 103: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xc3e2a01f  ! 104: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba985f  ! 105: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3e2a01f  ! 106: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba991f  ! 107: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba987f  ! 108: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba993f  ! 109: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba983f  ! 110: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd102e004  ! 111: LDF_I	ld	[%r11, 0x0004], %f8
	.word 0xc43ae038  ! 112: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xc43ac01f  ! 113: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae038  ! 114: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xc43ae038  ! 115: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc20aa04e  ! 116: LDUB_I	ldub	[%r10 + 0x004e], %r1
	.word 0xd1ba981f  ! 117: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 118: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc68ae053  ! 119: LDUBA_I	lduba	[%r11, + 0x0053] %asi, %r3
	.word 0xd1bae048  ! 120: STDFA_I	stda	%f8, [0x0048, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9f2903f  ! 121: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc9f2913f  ! 122: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba987f  ! 123: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2913f  ! 124: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9f2903f  ! 125: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9ba991f  ! 126: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 127: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc42801f  ! 128: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xc9e2e01f  ! 129: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc79aa010  ! 130: LDDFA_I	ldda	[%r10, 0x0010], %f3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfe2a01f  ! 131: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd08aa02e  ! 132: LDUBA_I	lduba	[%r10, + 0x002e] %asi, %r8
	.word 0xcc3aa028  ! 133: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xcc3a801f  ! 134: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd09ae028  ! 135: LDDA_I	ldda	[%r11, + 0x0028] %asi, %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3f2e01f  ! 136: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc612c01f  ! 137: LDUH_R	lduh	[%r11 + %r31], %r3
	.word 0xcdba999f  ! 138: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 139: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2911f  ! 140: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd05a801f  ! 141: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xcbba99bf  ! 142: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2901f  ! 143: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbba981f  ! 144: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 145: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbf2a01f  ! 146: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xca52a04a  ! 147: LDSH_I	ldsh	[%r10 + 0x004a], %r5
	.word 0xc802c01f  ! 148: LDUW_R	lduw	[%r11 + %r31], %r4
	.word 0xcdba995f  ! 149: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba999f  ! 150: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL150:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcd02a034  ! 151: LDF_I	ld	[%r10, 0x0034], %f6
	.word 0xca8a913f  ! 152: LDUBA_R	lduba	[%r10, %r31] 0x89, %r5
	.word 0xcd02a018  ! 153: LDF_I	ld	[%r10, 0x0018], %f6
	.word 0xcd9aa058  ! 154: LDDFA_I	ldda	[%r10, 0x0058], %f6
	.word 0xc3ba983f  ! 155: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc03a801f  ! 156: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3f2913f  ! 157: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xc3f2901f  ! 158: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba987f  ! 159: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd302a07c  ! 160: LDF_I	ld	[%r10, 0x007c], %f9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc1a801f  ! 161: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc9bae018  ! 162: STDFA_I	stda	%f4, [0x0018, %r11]
	.word 0xd102a00c  ! 163: LDF_I	ld	[%r10, 0x000c], %f8
	.word 0xcad2a030  ! 164: LDSHA_I	ldsha	[%r10, + 0x0030] %asi, %r5
	.word 0xc44ac01f  ! 165: LDSB_R	ldsb	[%r11 + %r31], %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3ba99bf  ! 166: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 167: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xca0ac01f  ! 168: LDUB_R	ldub	[%r11 + %r31], %r5
	.word 0xcb22801f  ! 169: STF_R	st	%f5, [%r31, %r10]
	.word 0xd1f2911f  ! 170: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd03aa028  ! 171: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd03a801f  ! 172: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba981f  ! 173: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 174: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 175: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1f2a01f  ! 176: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2913f  ! 177: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xc442a074  ! 178: LDSW_I	ldsw	[%r10 + 0x0074], %r2
	.word 0xcbe2d13f  ! 179: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xc88a917f  ! 180: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbe2a01f  ! 181: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc83a801f  ! 182: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba981f  ! 183: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2901f  ! 184: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xc79ae078  ! 185: LDDFA_I	ldda	[%r11, 0x0078], %f3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc902a02c  ! 186: LDF_I	ld	[%r10, 0x002c], %f4
	.word 0xd1bad87f  ! 187: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae060  ! 188: STD_I	std	%r8, [%r11 + 0x0060]
	.word 0xca02c01f  ! 189: LDUW_R	lduw	[%r11 + %r31], %r5
	.word 0xd1bad95f  ! 190: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1bad89f  ! 191: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad83f  ! 192: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc412a024  ! 193: LDUH_I	lduh	[%r10 + 0x0024], %r2
	.word 0xcc42c01f  ! 194: LDSW_R	ldsw	[%r11 + %r31], %r6
	.word 0xc9ba999f  ! 195: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9ba987f  ! 196: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 197: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 198: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba989f  ! 199: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2903f  ! 200: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc8d2a048  ! 201: LDSHA_I	ldsha	[%r10, + 0x0048] %asi, %r4
	.word 0xd1ba983f  ! 202: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc692a070  ! 203: LDUHA_I	lduha	[%r10, + 0x0070] %asi, %r3
	.word 0xc5bad97f  ! 204: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 205: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5e2d11f  ! 206: CASA_I	casa	[%r11] 0x88, %r31, %r2
	.word 0xc7bae000  ! 207: STDFA_I	stda	%f3, [0x0000, %r11]
	.word 0xc9ba987f  ! 208: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcd9ae048  ! 209: LDDFA_I	ldda	[%r11, 0x0048], %f6
	.word 0xd28a907f  ! 210: LDUBA_R	lduba	[%r10, %r31] 0x83, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5ba993f  ! 211: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba98bf  ! 212: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xce92d15f  ! 213: LDUHA_R	lduha	[%r11, %r31] 0x8a, %r7
	.word 0xc7ba995f  ! 214: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd322801f  ! 215: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3ba981f  ! 216: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xccc2913f  ! 217: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r6
	.word 0xcde2901f  ! 218: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xcdba981f  ! 219: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 220: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdba981f  ! 221: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 222: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2901f  ! 223: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xd39ae008  ! 224: LDDFA_I	ldda	[%r11, 0x0008], %f9
	.word 0xcc12801f  ! 225: LDUH_R	lduh	[%r10 + %r31], %r6
TH_LABEL225:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcb02e02c  ! 226: LDF_I	ld	[%r11, 0x002c], %f5
	.word 0xcac2a048  ! 227: LDSWA_I	ldswa	[%r10, + 0x0048] %asi, %r5
	.word 0xd082d07f  ! 228: LDUWA_R	lduwa	[%r11, %r31] 0x83, %r8
	.word 0xc09ae048  ! 229: LDDA_I	ldda	[%r11, + 0x0048] %asi, %r0
	.word 0xcbbaa078  ! 230: STDFA_I	stda	%f5, [0x0078, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd0c2917f  ! 231: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r8
	.word 0xccda911f  ! 232: LDXA_R	ldxa	[%r10, %r31] 0x88, %r6
	.word 0xcc1ae068  ! 233: LDD_I	ldd	[%r11 + 0x0068], %r6
	.word 0xc41ac01f  ! 234: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xc9f2911f  ! 235: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9ba995f  ! 236: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 237: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 238: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2a01f  ! 239: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2a01f  ! 240: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc502801f  ! 241: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcfe2a01f  ! 242: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xce52c01f  ! 243: LDSH_R	ldsh	[%r11 + %r31], %r7
	.word 0xd2c2d03f  ! 244: LDSWA_R	ldswa	[%r11, %r31] 0x81, %r9
	.word 0xd052801f  ! 245: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7ba983f  ! 246: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba995f  ! 247: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 248: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba99bf  ! 249: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 250: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7f2901f  ! 251: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7f2a01f  ! 252: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba98bf  ! 253: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 254: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba98bf  ! 255: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdbaa040  ! 256: STDFA_I	stda	%f6, [0x0040, %r10]
	.word 0xc6cae02b  ! 257: LDSBA_I	ldsba	[%r11, + 0x002b] %asi, %r3
	.word 0xcac2a034  ! 258: LDSWA_I	ldswa	[%r10, + 0x0034] %asi, %r5
	.word 0xc88aa03c  ! 259: LDUBA_I	lduba	[%r10, + 0x003c] %asi, %r4
	.word 0xc492903f  ! 260: LDUHA_R	lduha	[%r10, %r31] 0x81, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfba993f  ! 261: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba98bf  ! 262: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2913f  ! 263: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcfba991f  ! 264: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc12a034  ! 265: LDUH_I	lduh	[%r10 + 0x0034], %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd03aa068  ! 266: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xd3e2a01f  ! 267: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc8caa01b  ! 268: LDSBA_I	ldsba	[%r10, + 0x001b] %asi, %r4
	.word 0xcdf2911f  ! 269: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xc642c01f  ! 270: LDSW_R	ldsw	[%r11 + %r31], %r3
TH_LABEL270:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcad2e06a  ! 271: LDSHA_I	ldsha	[%r11, + 0x006a] %asi, %r5
	.word 0xcc3a801f  ! 272: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc2cad11f  ! 273: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r1
	.word 0xc3e2d01f  ! 274: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad89f  ! 275: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc8ae01c  ! 276: LDUBA_I	lduba	[%r11, + 0x001c] %asi, %r6
	.word 0xcad2907f  ! 277: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r5
	.word 0xc612801f  ! 278: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xc5e2913f  ! 279: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5ba989f  ! 280: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcd22c01f  ! 281: STF_R	st	%f6, [%r31, %r11]
	.word 0xd3ba999f  ! 282: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc412c01f  ! 283: LDUH_R	lduh	[%r11 + %r31], %r2
	.word 0xc43ac01f  ! 284: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 285: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd39ae020  ! 286: LDDFA_I	ldda	[%r11, 0x0020], %f9
	.word 0xd092d01f  ! 287: LDUHA_R	lduha	[%r11, %r31] 0x80, %r8
	.word 0xca0ac01f  ! 288: LDUB_R	ldub	[%r11 + %r31], %r5
	.word 0xcf02a038  ! 289: LDF_I	ld	[%r10, 0x0038], %f7
	.word 0xd03a801f  ! 290: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba999f  ! 291: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba983f  ! 292: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd08a915f  ! 293: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r8
	.word 0xcbf2e01f  ! 294: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xc702a064  ! 295: LDF_I	ld	[%r10, 0x0064], %f3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc4dad11f  ! 296: LDXA_R	ldxa	[%r11, %r31] 0x88, %r2
	.word 0xcbba98bf  ! 297: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba99bf  ! 298: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 299: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba987f  ! 300: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbba983f  ! 301: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xca12801f  ! 302: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xc5ba985f  ! 303: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 304: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba983f  ! 305: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5e2911f  ! 306: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xcc8ad03f  ! 307: LDUBA_R	lduba	[%r11, %r31] 0x81, %r6
	.word 0xd002c01f  ! 308: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xcdba993f  ! 309: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba989f  ! 310: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdf2a01f  ! 311: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba983f  ! 312: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 313: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba999f  ! 314: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba999f  ! 315: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcde2a01f  ! 316: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba98bf  ! 317: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 318: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xc852801f  ! 319: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xc7ba98bf  ! 320: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7ba995f  ! 321: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 322: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 323: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 324: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc4c2901f  ! 325: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd0c2e07c  ! 326: LDSWA_I	ldswa	[%r11, + 0x007c] %asi, %r8
	.word 0xd3f2d13f  ! 327: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xd302801f  ! 328: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc79aa028  ! 329: LDDFA_I	ldda	[%r10, 0x0028], %f3
	.word 0xcc8ae054  ! 330: LDUBA_I	lduba	[%r11, + 0x0054] %asi, %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9e2911f  ! 331: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba98bf  ! 332: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc2d2a078  ! 333: LDSHA_I	ldsha	[%r10, + 0x0078] %asi, %r1
	.word 0xcf22c01f  ! 334: STF_R	st	%f7, [%r31, %r11]
	.word 0xd01aa070  ! 335: LDD_I	ldd	[%r10 + 0x0070], %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc4c2a068  ! 336: LDSWA_I	ldswa	[%r10, + 0x0068] %asi, %r2
	.word 0xd1ba993f  ! 337: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 338: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba997f  ! 339: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba987f  ! 340: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xced2a028  ! 341: LDSHA_I	ldsha	[%r10, + 0x0028] %asi, %r7
	.word 0xcfbad81f  ! 342: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xca5a801f  ! 343: LDX_R	ldx	[%r10 + %r31], %r5
	.word 0xc642e008  ! 344: LDSW_I	ldsw	[%r11 + 0x0008], %r3
	.word 0xc3f2e01f  ! 345: CASXA_R	casxa	[%r11]%asi, %r31, %r1
TH_LABEL345:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3bad81f  ! 346: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd2c2a044  ! 347: LDSWA_I	ldswa	[%r10, + 0x0044] %asi, %r9
	.word 0xc03ac01f  ! 348: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad8bf  ! 349: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d01f  ! 350: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
TH_LABEL350:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc812a024  ! 351: LDUH_I	lduh	[%r10 + 0x0024], %r4
	.word 0xc442c01f  ! 352: LDSW_R	ldsw	[%r11 + %r31], %r2
	.word 0xcfbad9bf  ! 353: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ae030  ! 354: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcff2d01f  ! 355: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc3ae030  ! 356: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcfbad91f  ! 357: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2e01f  ! 358: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcfbad83f  ! 359: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad85f  ! 360: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xce42c01f  ! 361: LDSW_R	ldsw	[%r11 + %r31], %r7
	.word 0xd03aa030  ! 362: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xc60ac01f  ! 363: LDUB_R	ldub	[%r11 + %r31], %r3
	.word 0xc3ba991f  ! 364: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xca5a801f  ! 365: LDX_R	ldx	[%r10 + %r31], %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3ba98bf  ! 366: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 367: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3baa010  ! 368: STDFA_I	stda	%f9, [0x0010, %r10]
	.word 0xd1e2903f  ! 369: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd1ba997f  ! 370: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1e2913f  ! 371: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xd1ba987f  ! 372: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 373: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa010  ! 374: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1ba999f  ! 375: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc602801f  ! 376: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xcbbad91f  ! 377: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d13f  ! 378: CASXA_I	casxa	[%r11] 0x89, %r31, %r5
	.word 0xcbe2e01f  ! 379: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbf2d13f  ! 380: CASXA_I	casxa	[%r11] 0x89, %r31, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd302c01f  ! 381: LDF_R	ld	[%r11, %r31], %f9
	.word 0xd1ba993f  ! 382: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 383: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2913f  ! 384: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xc5bae028  ! 385: STDFA_I	stda	%f2, [0x0028, %r11]
TH_LABEL385:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5bae020  ! 386: STDFA_I	stda	%f2, [0x0020, %r11]
	.word 0xcff2a01f  ! 387: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc65a801f  ! 388: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xcdbae048  ! 389: STDFA_I	stda	%f6, [0x0048, %r11]
	.word 0xc43a801f  ! 390: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc82e03c  ! 391: LDUWA_I	lduwa	[%r11, + 0x003c] %asi, %r6
	.word 0xd3bad97f  ! 392: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 393: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xcc52a03a  ! 394: LDSH_I	ldsh	[%r10 + 0x003a], %r6
	.word 0xc9ba98bf  ! 395: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9ba997f  ! 396: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba99bf  ! 397: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc6d2911f  ! 398: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r3
	.word 0xc612c01f  ! 399: LDUH_R	lduh	[%r11 + %r31], %r3
	.word 0xcdbaa050  ! 400: STDFA_I	stda	%f6, [0x0050, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdbad95f  ! 401: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad85f  ! 402: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad95f  ! 403: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 404: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcc3ae050  ! 405: STD_I	std	%r6, [%r11 + 0x0050]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc3ac01f  ! 406: STD_R	std	%r6, [%r11 + %r31]
	.word 0xca02a04c  ! 407: LDUW_I	lduw	[%r10 + 0x004c], %r5
	.word 0xc7e2d01f  ! 408: CASA_I	casa	[%r11] 0x80, %r31, %r3
	.word 0xc7bad81f  ! 409: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad89f  ! 410: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7e2e01f  ! 411: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc7bad95f  ! 412: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc882a070  ! 413: LDUWA_I	lduwa	[%r10, + 0x0070] %asi, %r4
	.word 0xd19aa008  ! 414: LDDFA_I	ldda	[%r10, 0x0008], %f8
	.word 0xc03a801f  ! 415: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3ba99bf  ! 416: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 417: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xd242a034  ! 418: LDSW_I	ldsw	[%r10 + 0x0034], %r9
	.word 0xc83ae020  ! 419: STD_I	std	%r4, [%r11 + 0x0020]
	.word 0xc83ac01f  ! 420: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc302801f  ! 421: LDF_R	ld	[%r10, %r31], %f1
	.word 0xd1ba983f  ! 422: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba985f  ! 423: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd012a01a  ! 424: LDUH_I	lduh	[%r10 + 0x001a], %r8
	.word 0xc3ba989f  ! 425: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3ba991f  ! 426: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc252c01f  ! 427: LDSH_R	ldsh	[%r11 + %r31], %r1
	.word 0xd39ae010  ! 428: LDDFA_I	ldda	[%r11, 0x0010], %f9
	.word 0xcfba981f  ! 429: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba995f  ! 430: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfba985f  ! 431: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 432: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba989f  ! 433: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc6c2a000  ! 434: LDSWA_I	ldswa	[%r10, + 0x0000] %asi, %r3
	.word 0xd3ba993f  ! 435: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd03a801f  ! 436: STD_R	std	%r8, [%r10 + %r31]
	.word 0xce5aa048  ! 437: LDX_I	ldx	[%r10 + 0x0048], %r7
	.word 0xd3bad83f  ! 438: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 439: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd03ac01f  ! 440: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcf02801f  ! 441: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc692907f  ! 442: LDUHA_R	lduha	[%r10, %r31] 0x83, %r3
	.word 0xd3f2a01f  ! 443: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xcf9aa018  ! 444: LDDFA_I	ldda	[%r10, 0x0018], %f7
	.word 0xd092a058  ! 445: LDUHA_I	lduha	[%r10, + 0x0058] %asi, %r8
TH_LABEL445:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc502c01f  ! 446: LDF_R	ld	[%r11, %r31], %f2
	.word 0xcfba981f  ! 447: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2913f  ! 448: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xccc2911f  ! 449: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r6
	.word 0xc6d2a050  ! 450: LDSHA_I	ldsha	[%r10, + 0x0050] %asi, %r3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5f2a01f  ! 451: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xd052a04a  ! 452: LDSH_I	ldsh	[%r10 + 0x004a], %r8
	.word 0xcc52801f  ! 453: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xc3bad93f  ! 454: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad85f  ! 455: STDFA_R	stda	%f1, [%r31, %r11]
TH_LABEL455:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3bad81f  ! 456: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd01aa048  ! 457: LDD_I	ldd	[%r10 + 0x0048], %r8
	.word 0xd3ba993f  ! 458: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd19aa048  ! 459: LDDFA_I	ldda	[%r10, 0x0048], %f8
	.word 0xcbbad99f  ! 460: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbbad99f  ! 461: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc902e000  ! 462: LDF_I	ld	[%r11, 0x0000], %f4
	.word 0xc3e2a01f  ! 463: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xd0cad01f  ! 464: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r8
	.word 0xd20ac01f  ! 465: LDUB_R	ldub	[%r11 + %r31], %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xca12801f  ! 466: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xc7bad9bf  ! 467: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 468: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad91f  ! 469: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad9bf  ! 470: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc43ae010  ! 471: STD_I	std	%r2, [%r11 + 0x0010]
	.word 0xce4aa07b  ! 472: LDSB_I	ldsb	[%r10 + 0x007b], %r7
	.word 0xc9e2e01f  ! 473: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d01f  ! 474: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xcd9aa020  ! 475: LDDFA_I	ldda	[%r10, 0x0020], %f6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcedad17f  ! 476: LDXA_R	ldxa	[%r11, %r31] 0x8b, %r7
	.word 0xc43a801f  ! 477: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba997f  ! 478: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc99aa008  ! 479: LDDFA_I	ldda	[%r10, 0x0008], %f4
	.word 0xc7ba987f  ! 480: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL480:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xca4ac01f  ! 481: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xcfba997f  ! 482: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd252e056  ! 483: LDSH_I	ldsh	[%r11 + 0x0056], %r9
	.word 0xcc82915f  ! 484: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r6
	.word 0xc7f2a01f  ! 485: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7ba987f  ! 486: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 487: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xcd02e054  ! 488: LDF_I	ld	[%r11, 0x0054], %f6
	.word 0xc8ca901f  ! 489: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r4
	.word 0xcfba997f  ! 490: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc322801f  ! 491: STF_R	st	%f1, [%r31, %r10]
	.word 0xc5bae018  ! 492: STDFA_I	stda	%f2, [0x0018, %r11]
	.word 0xc6caa050  ! 493: LDSBA_I	ldsba	[%r10, + 0x0050] %asi, %r3
	.word 0xc502c01f  ! 494: LDF_R	ld	[%r11, %r31], %f2
	.word 0xcb02c01f  ! 495: LDF_R	ld	[%r11, %r31], %f5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc842e050  ! 496: LDSW_I	ldsw	[%r11 + 0x0050], %r4
	.word 0xc652a04a  ! 497: LDSH_I	ldsh	[%r10 + 0x004a], %r3
	.word 0xc5e2901f  ! 498: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba997f  ! 499: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba98bf  ! 500: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcf9aa050  ! 501: LDDFA_I	ldda	[%r10, 0x0050], %f7
	.word 0xceca911f  ! 502: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r7
	.word 0xca12a07e  ! 503: LDUH_I	lduh	[%r10 + 0x007e], %r5
	.word 0xcfbad87f  ! 504: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d13f  ! 505: CASXA_I	casxa	[%r11] 0x89, %r31, %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfe2d03f  ! 506: CASA_I	casa	[%r11] 0x81, %r31, %r7
	.word 0xcfbad89f  ! 507: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcb02801f  ! 508: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc5ba995f  ! 509: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 510: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5ba981f  ! 511: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba98bf  ! 512: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 513: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd24ae008  ! 514: LDSB_I	ldsb	[%r11 + 0x0008], %r9
	.word 0xc442801f  ! 515: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc2daa000  ! 516: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r1
	.word 0xcecae05c  ! 517: LDSBA_I	ldsba	[%r11, + 0x005c] %asi, %r7
	.word 0xc40ac01f  ! 518: LDUB_R	ldub	[%r11 + %r31], %r2
	.word 0xd242a030  ! 519: LDSW_I	ldsw	[%r10 + 0x0030], %r9
	.word 0xc9bad81f  ! 520: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc41ae048  ! 521: LDD_I	ldd	[%r11 + 0x0048], %r2
	.word 0xcdbaa000  ! 522: STDFA_I	stda	%f6, [0x0000, %r10]
	.word 0xc83a801f  ! 523: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba99bf  ! 524: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 525: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9f2a01f  ! 526: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xcdbae020  ! 527: STDFA_I	stda	%f6, [0x0020, %r11]
	.word 0xd1bae018  ! 528: STDFA_I	stda	%f8, [0x0018, %r11]
	.word 0xcdbae060  ! 529: STDFA_I	stda	%f6, [0x0060, %r11]
	.word 0xcdba981f  ! 530: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdba983f  ! 531: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcbbaa070  ! 532: STDFA_I	stda	%f5, [0x0070, %r10]
	.word 0xcdbad93f  ! 533: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc282a004  ! 534: LDUWA_I	lduwa	[%r10, + 0x0004] %asi, %r1
	.word 0xd03a801f  ! 535: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3e2913f  ! 536: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xc292e03e  ! 537: LDUHA_I	lduha	[%r11, + 0x003e] %asi, %r1
	.word 0xce52801f  ! 538: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xd1bad91f  ! 539: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc452801f  ! 540: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9e2e01f  ! 541: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2e01f  ! 542: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xcadaa020  ! 543: LDXA_I	ldxa	[%r10, + 0x0020] %asi, %r5
	.word 0xc4d2915f  ! 544: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r2
	.word 0xc7ba995f  ! 545: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc43aa008  ! 546: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7ba981f  ! 547: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 548: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc322801f  ! 549: STF_R	st	%f1, [%r31, %r10]
	.word 0xd3bad8bf  ! 550: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3bad81f  ! 551: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae008  ! 552: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3bad87f  ! 553: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae008  ! 554: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3e2e01f  ! 555: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc02e040  ! 556: LDUW_I	lduw	[%r11 + 0x0040], %r6
	.word 0xd1ba985f  ! 557: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc52a00e  ! 558: LDSH_I	ldsh	[%r10 + 0x000e], %r6
	.word 0xc83ae028  ! 559: STD_I	std	%r4, [%r11 + 0x0028]
	.word 0xc9bad97f  ! 560: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9bad81f  ! 561: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 562: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad93f  ! 563: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc68aa07f  ! 564: LDUBA_I	lduba	[%r10, + 0x007f] %asi, %r3
	.word 0xcde2d03f  ! 565: CASA_I	casa	[%r11] 0x81, %r31, %r6
TH_LABEL565:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc65ac01f  ! 566: LDX_R	ldx	[%r11 + %r31], %r3
	.word 0xd09aa020  ! 567: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r8
	.word 0xd1e2901f  ! 568: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc8da905f  ! 569: LDXA_R	ldxa	[%r10, %r31] 0x82, %r4
	.word 0xc9f2913f  ! 570: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc68ae04a  ! 571: LDUBA_I	lduba	[%r11, + 0x004a] %asi, %r3
	.word 0xcdf2a01f  ! 572: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc7baa068  ! 573: STDFA_I	stda	%f3, [0x0068, %r10]
	.word 0xc7f2911f  ! 574: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba99bf  ! 575: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd0c2907f  ! 576: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r8
	.word 0xd2caa058  ! 577: LDSBA_I	ldsba	[%r10, + 0x0058] %asi, %r9
	.word 0xc83aa010  ! 578: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xcbf2903f  ! 579: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xcbba995f  ! 580: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc83a801f  ! 581: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbe2a01f  ! 582: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcc5ac01f  ! 583: LDX_R	ldx	[%r11 + %r31], %r6
	.word 0xc3bad91f  ! 584: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 585: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc702e024  ! 586: LDF_I	ld	[%r11, 0x0024], %f3
	.word 0xc83aa008  ! 587: STD_I	std	%r4, [%r10 + 0x0008]
	.word 0xcc4a801f  ! 588: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xc03a801f  ! 589: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc2c2e02c  ! 590: LDSWA_I	ldswa	[%r11, + 0x002c] %asi, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfbad87f  ! 591: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd05a801f  ! 592: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xc5f2a01f  ! 593: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xd302801f  ! 594: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd1ba981f  ! 595: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd03aa028  ! 596: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd1f2a01f  ! 597: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2903f  ! 598: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xd242a068  ! 599: LDSW_I	ldsw	[%r10 + 0x0068], %r9
	.word 0xd3f2a01f  ! 600: CASXA_R	casxa	[%r10]%asi, %r31, %r9
TH_LABEL600:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc202801f  ! 601: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xcf02c01f  ! 602: LDF_R	ld	[%r11, %r31], %f7
	.word 0xc5e2a01f  ! 603: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 604: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba997f  ! 605: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcb9ae060  ! 606: LDDFA_I	ldda	[%r11, 0x0060], %f5
	.word 0xcd22801f  ! 607: STF_R	st	%f6, [%r31, %r10]
	.word 0xcbba985f  ! 608: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 609: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xc81ae018  ! 610: LDD_I	ldd	[%r11 + 0x0018], %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xca42a064  ! 611: LDSW_I	ldsw	[%r10 + 0x0064], %r5
	.word 0xd1bad91f  ! 612: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad99f  ! 613: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad9bf  ! 614: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d13f  ! 615: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
TH_LABEL615:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1bad85f  ! 616: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad83f  ! 617: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcb9aa020  ! 618: LDDFA_I	ldda	[%r10, 0x0020], %f5
	.word 0xd1bad99f  ! 619: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 620: CASA_R	casa	[%r11] %asi, %r31, %r8
TH_LABEL620:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc1ac01f  ! 621: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xce8aa05d  ! 622: LDUBA_I	lduba	[%r10, + 0x005d] %asi, %r7
	.word 0xd2ca901f  ! 623: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r9
	.word 0xc9baa058  ! 624: STDFA_I	stda	%f4, [0x0058, %r10]
	.word 0xc9baa030  ! 625: STDFA_I	stda	%f4, [0x0030, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc28a901f  ! 626: LDUBA_R	lduba	[%r10, %r31] 0x80, %r1
	.word 0xcbbad83f  ! 627: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad87f  ! 628: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad93f  ! 629: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 630: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbbad81f  ! 631: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 632: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbf2d01f  ! 633: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad8bf  ! 634: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad93f  ! 635: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc83ac01f  ! 636: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad81f  ! 637: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad91f  ! 638: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad97f  ! 639: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd212e026  ! 640: LDUH_I	lduh	[%r11 + 0x0026], %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbf2a01f  ! 641: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba997f  ! 642: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 643: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba989f  ! 644: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc85ae058  ! 645: LDX_I	ldx	[%r11 + 0x0058], %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9ba997f  ! 646: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd24aa040  ! 647: LDSB_I	ldsb	[%r10 + 0x0040], %r9
	.word 0xcdba99bf  ! 648: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 649: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc41ae058  ! 650: LDD_I	ldd	[%r11 + 0x0058], %r2
TH_LABEL650:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc41a801f  ! 651: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc3ba995f  ! 652: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 653: STD_R	std	%r0, [%r10 + %r31]
	.word 0xceca917f  ! 654: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r7
	.word 0xc3f2a01f  ! 655: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc84a801f  ! 656: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xc3ba99bf  ! 657: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba997f  ! 659: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2903f  ! 660: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc4ae03a  ! 661: LDSB_I	ldsb	[%r11 + 0x003a], %r6
	.word 0xc702e00c  ! 662: LDF_I	ld	[%r11, 0x000c], %f3
	.word 0xcfe2901f  ! 663: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcc3a801f  ! 664: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc3a801f  ! 665: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbbaa058  ! 666: STDFA_I	stda	%f5, [0x0058, %r10]
	.word 0xcfbad91f  ! 667: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad81f  ! 668: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d11f  ! 669: CASXA_I	casxa	[%r11] 0x88, %r31, %r7
	.word 0xc402a00c  ! 670: LDUW_I	lduw	[%r10 + 0x000c], %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc202801f  ! 671: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xcbba989f  ! 672: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba98bf  ! 673: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd1baa048  ! 674: STDFA_I	stda	%f8, [0x0048, %r10]
	.word 0xc88a901f  ! 675: LDUBA_R	lduba	[%r10, %r31] 0x80, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7e2a01f  ! 676: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xd0dae008  ! 677: LDXA_I	ldxa	[%r11, + 0x0008] %asi, %r8
	.word 0xc43a801f  ! 678: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba981f  ! 679: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba985f  ! 680: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcd02801f  ! 681: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc702801f  ! 682: LDF_R	ld	[%r10, %r31], %f3
	.word 0xcdf2e01f  ! 683: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xcdbad97f  ! 684: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae040  ! 685: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdbad97f  ! 686: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcf9ae020  ! 687: LDDFA_I	ldda	[%r11, 0x0020], %f7
	.word 0xcd22801f  ! 688: STF_R	st	%f6, [%r31, %r10]
	.word 0xc7ba995f  ! 689: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 690: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc6d2907f  ! 691: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r3
	.word 0xca82a058  ! 692: LDUWA_I	lduwa	[%r10, + 0x0058] %asi, %r5
	.word 0xc302a06c  ! 693: LDF_I	ld	[%r10, 0x006c], %f1
	.word 0xc83aa000  ! 694: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xc892e01c  ! 695: LDUHA_I	lduha	[%r11, + 0x001c] %asi, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfba989f  ! 696: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc642e068  ! 697: LDSW_I	ldsw	[%r11 + 0x0068], %r3
	.word 0xc3bad81f  ! 698: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc6dae050  ! 699: LDXA_I	ldxa	[%r11, + 0x0050] %asi, %r3
	.word 0xc8da903f  ! 700: LDXA_R	ldxa	[%r10, %r31] 0x81, %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3e2901f  ! 701: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba981f  ! 702: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba991f  ! 703: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc4c2a078  ! 704: LDSWA_I	ldswa	[%r10, + 0x0078] %asi, %r2
	.word 0xcbbad97f  ! 705: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc4c2a004  ! 706: LDSWA_I	ldswa	[%r10, + 0x0004] %asi, %r2
	.word 0xc5ba983f  ! 707: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 708: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc2d2e016  ! 709: LDSHA_I	ldsha	[%r11, + 0x0016] %asi, %r1
	.word 0xc3e2a01f  ! 710: CASA_R	casa	[%r10] %asi, %r31, %r1
TH_LABEL710:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc03aa010  ! 711: STD_I	std	%r0, [%r10 + 0x0010]
	.word 0xc3ba995f  ! 712: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba995f  ! 713: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc45aa038  ! 714: LDX_I	ldx	[%r10 + 0x0038], %r2
	.word 0xc9baa018  ! 715: STDFA_I	stda	%f4, [0x0018, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1f2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba99bf  ! 717: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba997f  ! 718: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba99bf  ! 719: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc25a801f  ! 720: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5ba991f  ! 721: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2913f  ! 722: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc89aa028  ! 723: LDDA_I	ldda	[%r10, + 0x0028] %asi, %r4
	.word 0xcc02e064  ! 724: LDUW_I	lduw	[%r11 + 0x0064], %r6
	.word 0xc642e07c  ! 725: LDSW_I	ldsw	[%r11 + 0x007c], %r3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbbad97f  ! 726: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad9bf  ! 727: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad97f  ! 728: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc812a008  ! 729: LDUH_I	lduh	[%r10 + 0x0008], %r4
	.word 0xd3f2a01f  ! 730: CASXA_R	casxa	[%r10]%asi, %r31, %r9
TH_LABEL730:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3e2a01f  ! 731: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc41a801f  ! 732: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc49aa000  ! 733: LDDA_I	ldda	[%r10, + 0x0000] %asi, %r2
	.word 0xd302a010  ! 734: LDF_I	ld	[%r10, 0x0010], %f9
	.word 0xcc3aa008  ! 735: STD_I	std	%r6, [%r10 + 0x0008]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfe2a01f  ! 736: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd242a038  ! 737: LDSW_I	ldsw	[%r10 + 0x0038], %r9
	.word 0xc722801f  ! 738: STF_R	st	%f3, [%r31, %r10]
	.word 0xd012801f  ! 739: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xd1f2911f  ! 740: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1ba98bf  ! 741: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd0c2a07c  ! 742: LDSWA_I	ldswa	[%r10, + 0x007c] %asi, %r8
	.word 0xc88aa05f  ! 743: LDUBA_I	lduba	[%r10, + 0x005f] %asi, %r4
	.word 0xc83ac01f  ! 744: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbe2d01f  ! 745: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbbad81f  ! 746: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad89f  ! 747: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcd02c01f  ! 748: LDF_R	ld	[%r11, %r31], %f6
	.word 0xc3bad95f  ! 749: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcf02a020  ! 750: LDF_I	ld	[%r10, 0x0020], %f7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc642801f  ! 751: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xd1f2a01f  ! 752: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2a01f  ! 753: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa000  ! 754: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xc85a801f  ! 755: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9f2d13f  ! 756: CASXA_I	casxa	[%r11] 0x89, %r31, %r4
	.word 0xc492a042  ! 757: LDUHA_I	lduha	[%r10, + 0x0042] %asi, %r2
	.word 0xcfbad81f  ! 758: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcf02a044  ! 759: LDF_I	ld	[%r10, 0x0044], %f7
	.word 0xcdba991f  ! 760: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdba985f  ! 761: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2913f  ! 762: CASA_I	casa	[%r10] 0x89, %r31, %r6
	.word 0xc642c01f  ! 763: LDSW_R	ldsw	[%r11 + %r31], %r3
	.word 0xc9e2d01f  ! 764: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xcf9aa030  ! 765: LDDFA_I	ldda	[%r10, 0x0030], %f7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1e2a01f  ! 766: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1e2a01f  ! 767: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 768: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc812a038  ! 769: LDUH_I	lduh	[%r10 + 0x0038], %r4
	.word 0xc9bad8bf  ! 770: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9bad99f  ! 771: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc652a078  ! 772: LDSH_I	ldsh	[%r10 + 0x0078], %r3
	.word 0xd102801f  ! 773: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc4cad07f  ! 774: LDSBA_R	ldsba	[%r11, %r31] 0x83, %r2
	.word 0xd1f2913f  ! 775: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd03aa058  ! 776: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xcfbaa008  ! 777: STDFA_I	stda	%f7, [0x0008, %r10]
	.word 0xce0a801f  ! 778: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xc7ba987f  ! 779: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 780: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7ba98bf  ! 781: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 782: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2911f  ! 783: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba991f  ! 784: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc9bae070  ! 785: STDFA_I	stda	%f4, [0x0070, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfbaa040  ! 786: STDFA_I	stda	%f7, [0x0040, %r10]
	.word 0xc9bad93f  ! 787: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad99f  ! 788: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 789: STD_R	std	%r4, [%r11 + %r31]
	.word 0xd092915f  ! 790: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcb22801f  ! 791: STF_R	st	%f5, [%r31, %r10]
	.word 0xc7ba989f  ! 792: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcec2e024  ! 793: LDSWA_I	ldswa	[%r11, + 0x0024] %asi, %r7
	.word 0xc3e2a01f  ! 794: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xd1baa020  ! 795: STDFA_I	stda	%f8, [0x0020, %r10]
TH_LABEL795:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc64aa038  ! 796: LDSB_I	ldsb	[%r10 + 0x0038], %r3
	.word 0xcfba981f  ! 797: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 798: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc49aa070  ! 799: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r2
	.word 0xd0cae043  ! 800: LDSBA_I	ldsba	[%r11, + 0x0043] %asi, %r8
TH_LABEL800:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3f2d03f  ! 801: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xcc52801f  ! 802: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xc43ae048  ! 803: STD_I	std	%r2, [%r11 + 0x0048]
	.word 0xcadad13f  ! 804: LDXA_R	ldxa	[%r11, %r31] 0x89, %r5
	.word 0xc292e02a  ! 805: LDUHA_I	lduha	[%r11, + 0x002a] %asi, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcde2e01f  ! 806: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xd3baa030  ! 807: STDFA_I	stda	%f9, [0x0030, %r10]
	.word 0xc9f2901f  ! 808: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9e2911f  ! 809: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9e2a01f  ! 810: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9f2a01f  ! 811: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc612a03e  ! 812: LDUH_I	lduh	[%r10 + 0x003e], %r3
	.word 0xc6d2a06c  ! 813: LDSHA_I	ldsha	[%r10, + 0x006c] %asi, %r3
	.word 0xc602c01f  ! 814: LDUW_R	lduw	[%r11 + %r31], %r3
	.word 0xd1bad99f  ! 815: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1bad85f  ! 816: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d03f  ! 817: CASA_I	casa	[%r11] 0x81, %r31, %r8
	.word 0xcf22801f  ! 818: STF_R	st	%f7, [%r31, %r10]
	.word 0xcc52e068  ! 819: LDSH_I	ldsh	[%r11 + 0x0068], %r6
	.word 0xd052a04e  ! 820: LDSH_I	ldsh	[%r10 + 0x004e], %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc43aa060  ! 821: STD_I	std	%r2, [%r10 + 0x0060]
	.word 0xc01aa048  ! 822: LDD_I	ldd	[%r10 + 0x0048], %r0
	.word 0xc2c2901f  ! 823: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r1
	.word 0xc3ba981f  ! 824: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba98bf  ! 825: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc1aa058  ! 826: LDD_I	ldd	[%r10 + 0x0058], %r6
	.word 0xd1f2a01f  ! 827: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd0d2e04a  ! 828: LDSHA_I	ldsha	[%r11, + 0x004a] %asi, %r8
	.word 0xcc3aa050  ! 829: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xcff2903f  ! 830: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfba997f  ! 831: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 832: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca42e038  ! 833: LDSW_I	ldsw	[%r11 + 0x0038], %r5
	.word 0xd3ba981f  ! 834: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd2caa021  ! 835: LDSBA_I	ldsba	[%r10, + 0x0021] %asi, %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xca12801f  ! 836: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xc322c01f  ! 837: STF_R	st	%f1, [%r31, %r11]
	.word 0xce52c01f  ! 838: LDSH_R	ldsh	[%r11 + %r31], %r7
	.word 0xcdbad91f  ! 839: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc852801f  ! 840: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc28aa00e  ! 841: LDUBA_I	lduba	[%r10, + 0x000e] %asi, %r1
	.word 0xd1ba983f  ! 842: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc39ae048  ! 843: LDDFA_I	ldda	[%r11, 0x0048], %f1
	.word 0xcbba981f  ! 844: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd242e070  ! 845: LDSW_I	ldsw	[%r11 + 0x0070], %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9baa020  ! 846: STDFA_I	stda	%f4, [0x0020, %r10]
	.word 0xd092a074  ! 847: LDUHA_I	lduha	[%r10, + 0x0074] %asi, %r8
	.word 0xcc52801f  ! 848: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xcdba987f  ! 849: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xca8a915f  ! 850: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3e2d11f  ! 851: CASA_I	casa	[%r11] 0x88, %r31, %r9
	.word 0xcad2a042  ! 852: LDSHA_I	ldsha	[%r10, + 0x0042] %asi, %r5
	.word 0xc522801f  ! 853: STF_R	st	%f2, [%r31, %r10]
	.word 0xd1e2901f  ! 854: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xcf22801f  ! 855: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc43ae008  ! 856: STD_I	std	%r2, [%r11 + 0x0008]
	.word 0xc24ac01f  ! 857: LDSB_R	ldsb	[%r11 + %r31], %r1
	.word 0xc3bad91f  ! 858: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad81f  ! 859: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcc82d07f  ! 860: LDUWA_R	lduwa	[%r11, %r31] 0x83, %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfba981f  ! 861: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 862: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc302a040  ! 863: LDF_I	ld	[%r10, 0x0040], %f1
	.word 0xc25a801f  ! 864: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xd3ba989f  ! 865: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3ba981f  ! 866: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 867: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 868: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba991f  ! 869: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 870: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc212a022  ! 871: LDUH_I	lduh	[%r10 + 0x0022], %r1
	.word 0xc7ba995f  ! 872: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 873: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xd2cae00e  ! 874: LDSBA_I	ldsba	[%r11, + 0x000e] %asi, %r9
	.word 0xd1ba997f  ! 875: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc702a058  ! 876: LDF_I	ld	[%r10, 0x0058], %f3
	.word 0xcdf2e01f  ! 877: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xc2d2d07f  ! 878: LDSHA_R	ldsha	[%r11, %r31] 0x83, %r1
	.word 0xcd9ae048  ! 879: LDDFA_I	ldda	[%r11, 0x0048], %f6
	.word 0xc48ae05e  ! 880: LDUBA_I	lduba	[%r11, + 0x005e] %asi, %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc80a801f  ! 881: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xc3ba993f  ! 882: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 883: STD_R	std	%r0, [%r10 + %r31]
	.word 0xcb02801f  ! 884: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc81a801f  ! 885: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc802c01f  ! 886: LDUW_R	lduw	[%r11 + %r31], %r4
	.word 0xcbbad9bf  ! 887: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 888: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xd122c01f  ! 889: STF_R	st	%f8, [%r31, %r11]
	.word 0xcdbaa050  ! 890: STDFA_I	stda	%f6, [0x0050, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9f2903f  ! 891: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc09ae048  ! 892: LDDA_I	ldda	[%r11, + 0x0048] %asi, %r0
	.word 0xcc9ae048  ! 893: LDDA_I	ldda	[%r11, + 0x0048] %asi, %r6
	.word 0xd1f2a01f  ! 894: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba991f  ! 895: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xce12e072  ! 896: LDUH_I	lduh	[%r11 + 0x0072], %r7
	.word 0xd2d2a03e  ! 897: LDSHA_I	ldsha	[%r10, + 0x003e] %asi, %r9
	.word 0xd2c2a020  ! 898: LDSWA_I	ldswa	[%r10, + 0x0020] %asi, %r9
	.word 0xd1ba98bf  ! 899: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca82e07c  ! 900: LDUWA_I	lduwa	[%r11, + 0x007c] %asi, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcf9aa000  ! 901: LDDFA_I	ldda	[%r10, 0x0000], %f7
	.word 0xc282e04c  ! 902: LDUWA_I	lduwa	[%r11, + 0x004c] %asi, %r1
	.word 0xd09ae058  ! 903: LDDA_I	ldda	[%r11, + 0x0058] %asi, %r8
	.word 0xcfbad99f  ! 904: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xce0ac01f  ! 905: LDUB_R	ldub	[%r11 + %r31], %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xce12801f  ! 906: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xc8cad15f  ! 907: LDSBA_R	ldsba	[%r11, %r31] 0x8a, %r4
	.word 0xc7e2901f  ! 908: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba993f  ! 909: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa030  ! 910: STD_I	std	%r2, [%r10 + 0x0030]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd39aa000  ! 911: LDDFA_I	ldda	[%r10, 0x0000], %f9
	.word 0xcbba981f  ! 912: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba999f  ! 913: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcd22c01f  ! 914: STF_R	st	%f6, [%r31, %r11]
	.word 0xcc3ae050  ! 915: STD_I	std	%r6, [%r11 + 0x0050]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdbad91f  ! 916: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd242801f  ! 917: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xd1e2e01f  ! 918: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad9bf  ! 919: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc4c2e070  ! 920: LDSWA_I	ldswa	[%r11, + 0x0070] %asi, %r2
TH_LABEL920:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbba997f  ! 921: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba99bf  ! 922: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 923: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba989f  ! 924: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa028  ! 925: STD_I	std	%r4, [%r10 + 0x0028]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbba981f  ! 926: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd01aa060  ! 927: LDD_I	ldd	[%r10 + 0x0060], %r8
	.word 0xc9ba981f  ! 928: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc302801f  ! 929: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc612801f  ! 930: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc452801f  ! 931: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xc89ae048  ! 932: LDDA_I	ldda	[%r11, + 0x0048] %asi, %r4
	.word 0xcb9ae040  ! 933: LDDFA_I	ldda	[%r11, 0x0040], %f5
	.word 0xcde2d03f  ! 934: CASA_I	casa	[%r11] 0x81, %r31, %r6
	.word 0xc502a060  ! 935: LDF_I	ld	[%r10, 0x0060], %f2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5f2a01f  ! 936: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc43a801f  ! 937: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba993f  ! 938: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc642801f  ! 939: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xcbba995f  ! 940: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbf2a01f  ! 941: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xc692e040  ! 942: LDUHA_I	lduha	[%r11, + 0x0040] %asi, %r3
	.word 0xc702e030  ! 943: LDF_I	ld	[%r11, 0x0030], %f3
	.word 0xd3bad9bf  ! 944: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2d01f  ! 945: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
TH_LABEL945:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3bad87f  ! 946: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcd02a01c  ! 947: LDF_I	ld	[%r10, 0x001c], %f6
	.word 0xd1bad81f  ! 948: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd2caa063  ! 949: LDSBA_I	ldsba	[%r10, + 0x0063] %asi, %r9
	.word 0xcdba989f  ! 950: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc282a070  ! 951: LDUWA_I	lduwa	[%r10, + 0x0070] %asi, %r1
	.word 0xc452801f  ! 952: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xc242a060  ! 953: LDSW_I	ldsw	[%r10 + 0x0060], %r1
	.word 0xcfe2911f  ! 954: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcff2901f  ! 955: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfe2903f  ! 956: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcfba981f  ! 957: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa010  ! 958: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcfba991f  ! 959: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcbbaa038  ! 960: STDFA_I	stda	%f5, [0x0038, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc45ac01f  ! 961: LDX_R	ldx	[%r11 + %r31], %r2
	.word 0xd1ba999f  ! 962: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd042e030  ! 963: LDSW_I	ldsw	[%r11 + 0x0030], %r8
	.word 0xc3ba991f  ! 964: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcc0ae016  ! 965: LDUB_I	ldub	[%r11 + 0x0016], %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc81a801f  ! 966: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xcfba995f  ! 967: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa038  ! 968: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcc3aa038  ! 969: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcc3a801f  ! 970: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc64a801f  ! 971: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xce4a801f  ! 972: LDSB_R	ldsb	[%r10 + %r31], %r7
	.word 0xc4c2a054  ! 973: LDSWA_I	ldswa	[%r10, + 0x0054] %asi, %r2
	.word 0xd1bad81f  ! 974: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad93f  ! 975: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xce8ae016  ! 976: LDUBA_I	lduba	[%r11, + 0x0016] %asi, %r7
	.word 0xcaca917f  ! 977: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r5
	.word 0xce8aa056  ! 978: LDUBA_I	lduba	[%r10, + 0x0056] %asi, %r7
	.word 0xd3e2a01f  ! 979: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba983f  ! 980: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03aa058  ! 981: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3e2a01f  ! 982: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc702c01f  ! 983: LDF_R	ld	[%r11, %r31], %f3
	.word 0xd292e038  ! 984: LDUHA_I	lduha	[%r11, + 0x0038] %asi, %r9
	.word 0xce42801f  ! 985: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xca02a070  ! 986: LDUW_I	lduw	[%r10 + 0x0070], %r5
	.word 0xc60ae07b  ! 987: LDUB_I	ldub	[%r11 + 0x007b], %r3
	.word 0xd39aa078  ! 988: LDDFA_I	ldda	[%r10, 0x0078], %f9
	.word 0xc6daa018  ! 989: LDXA_I	ldxa	[%r10, + 0x0018] %asi, %r3
	.word 0xc5bad89f  ! 990: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5bad95f  ! 991: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd092901f  ! 992: LDUHA_R	lduha	[%r10, %r31] 0x80, %r8
	.word 0xc722801f  ! 993: STF_R	st	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 994: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc522801f  ! 995: STF_R	st	%f2, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3f2a01f  ! 996: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc28a913f  ! 997: LDUBA_R	lduba	[%r10, %r31] 0x89, %r1
	.word 0xcfba997f  ! 998: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xceca907f  ! 999: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r7
	.word 0xc702801f  ! 1000: LDF_R	ld	[%r10, %r31], %f3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	subcc %r30, 1, %r30
	bnz  TH5_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	add	%g0,	0x1,	%r30
TH4_LOOP_START:
	.word 0xc9ba993f  ! 1: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba995f  ! 2: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd292917f  ! 3: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r9
	.word 0xc212a020  ! 4: LDUH_I	lduh	[%r10 + 0x0020], %r1
	.word 0xc7bae068  ! 5: STDFA_I	stda	%f3, [0x0068, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd20a801f  ! 6: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xcfba987f  ! 7: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc9bae068  ! 8: STDFA_I	stda	%f4, [0x0068, %r11]
	.word 0xcbbaa060  ! 9: STDFA_I	stda	%f5, [0x0060, %r10]
	.word 0xcdf2911f  ! 10: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc842801f  ! 11: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xc9bad93f  ! 12: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcc0aa078  ! 13: LDUB_I	ldub	[%r10 + 0x0078], %r6
	.word 0xcbf2e01f  ! 14: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad93f  ! 15: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbbad83f  ! 16: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 17: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad83f  ! 18: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad87f  ! 19: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad83f  ! 20: STDFA_R	stda	%f5, [%r31, %r11]
TH_LABEL20:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc25aa028  ! 21: LDX_I	ldx	[%r10 + 0x0028], %r1
	.word 0xc7ba99bf  ! 22: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc502a00c  ! 23: LDF_I	ld	[%r10, 0x000c], %f2
	.word 0xce82911f  ! 24: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r7
	.word 0xc5f2903f  ! 25: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5f2a01f  ! 26: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc79aa050  ! 27: LDDFA_I	ldda	[%r10, 0x0050], %f3
	.word 0xc7f2901f  ! 28: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba985f  ! 29: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 30: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd0ca913f  ! 31: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r8
	.word 0xc302801f  ! 32: LDF_R	ld	[%r10, %r31], %f1
	.word 0xcdba981f  ! 33: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 34: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 35: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xca92915f  ! 36: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r5
	.word 0xc9ba995f  ! 37: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba987f  ! 38: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2913f  ! 39: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba997f  ! 40: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcd02801f  ! 41: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc7f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7e2a01f  ! 43: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc39ae028  ! 44: LDDFA_I	ldda	[%r11, 0x0028], %f1
	.word 0xc45a801f  ! 45: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc2da915f  ! 46: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r1
	.word 0xcfe2901f  ! 47: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcfe2a01f  ! 48: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba98bf  ! 49: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd082915f  ! 50: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3bad89f  ! 51: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad85f  ! 52: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad83f  ! 53: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd282a060  ! 54: LDUWA_I	lduwa	[%r10, + 0x0060] %asi, %r9
	.word 0xcc1aa038  ! 55: LDD_I	ldd	[%r10 + 0x0038], %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7bad85f  ! 56: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad95f  ! 57: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc642801f  ! 58: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc6caa04c  ! 59: LDSBA_I	ldsba	[%r10, + 0x004c] %asi, %r3
	.word 0xcf02c01f  ! 60: LDF_R	ld	[%r11, %r31], %f7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3ba981f  ! 61: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd0daa048  ! 62: LDXA_I	ldxa	[%r10, + 0x0048] %asi, %r8
	.word 0xcc3ae060  ! 63: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xc8da917f  ! 64: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r4
	.word 0xc5f2901f  ! 65: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5ba987f  ! 66: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 67: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc88aa004  ! 68: LDUBA_I	lduba	[%r10, + 0x0004] %asi, %r4
	.word 0xc7f2a01f  ! 69: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba999f  ! 70: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7e2901f  ! 71: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba997f  ! 72: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 73: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 74: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xca8aa017  ! 75: LDUBA_I	lduba	[%r10, + 0x0017] %asi, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc43ae000  ! 76: STD_I	std	%r2, [%r11 + 0x0000]
	.word 0xc5f2d11f  ! 77: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xc5f2e01f  ! 78: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc43ac01f  ! 79: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc89aa028  ! 80: LDDA_I	ldda	[%r10, + 0x0028] %asi, %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc03ae000  ! 81: STD_I	std	%r0, [%r11 + 0x0000]
	.word 0xc60aa033  ! 82: LDUB_I	ldub	[%r10 + 0x0033], %r3
	.word 0xc83a801f  ! 83: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd282903f  ! 84: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r9
	.word 0xcbba997f  ! 85: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbf2903f  ! 86: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xc6dad17f  ! 87: LDXA_R	ldxa	[%r11, %r31] 0x8b, %r3
	.word 0xcf22801f  ! 88: STF_R	st	%f7, [%r31, %r10]
	.word 0xc85a801f  ! 89: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xc3e2911f  ! 90: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc03a801f  ! 91: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3ba993f  ! 92: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 93: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xd08a915f  ! 94: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r8
	.word 0xd212a054  ! 95: LDUH_I	lduh	[%r10 + 0x0054], %r9
TH_LABEL95:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc1ac01f  ! 96: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xcc4ac01f  ! 97: LDSB_R	ldsb	[%r11 + %r31], %r6
	.word 0xc43ae050  ! 98: STD_I	std	%r2, [%r11 + 0x0050]
	.word 0xc43ae050  ! 99: STD_I	std	%r2, [%r11 + 0x0050]
	.word 0xd2d2907f  ! 100: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r9
TH_LABEL100:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc802801f  ! 101: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xc282e048  ! 102: LDUWA_I	lduwa	[%r11, + 0x0048] %asi, %r1
	.word 0xc3f2901f  ! 103: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3e2a01f  ! 104: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba985f  ! 105: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3e2a01f  ! 106: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba991f  ! 107: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba987f  ! 108: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 109: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 110: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc302e02c  ! 111: LDF_I	ld	[%r11, 0x002c], %f1
	.word 0xc43ae038  ! 112: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xc43ac01f  ! 113: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae038  ! 114: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xc43ae038  ! 115: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc40aa023  ! 116: LDUB_I	ldub	[%r10 + 0x0023], %r2
	.word 0xd1ba987f  ! 117: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba997f  ! 118: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca8aa07a  ! 119: LDUBA_I	lduba	[%r10, + 0x007a] %asi, %r5
	.word 0xcbbae010  ! 120: STDFA_I	stda	%f5, [0x0010, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9f2901f  ! 121: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2911f  ! 122: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba987f  ! 123: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2913f  ! 124: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9f2903f  ! 125: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9ba993f  ! 126: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba98bf  ! 127: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd042801f  ! 128: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xc9e2e01f  ! 129: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc79aa008  ! 130: LDDFA_I	ldda	[%r10, 0x0008], %f3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfe2a01f  ! 131: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd08ae05b  ! 132: LDUBA_I	lduba	[%r11, + 0x005b] %asi, %r8
	.word 0xcc3aa028  ! 133: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xcc3a801f  ! 134: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc49aa050  ! 135: LDDA_I	ldda	[%r10, + 0x0050] %asi, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3f2e01f  ! 136: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xd212c01f  ! 137: LDUH_R	lduh	[%r11 + %r31], %r9
	.word 0xcdba985f  ! 138: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba989f  ! 139: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 140: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc5a801f  ! 141: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xcbba993f  ! 142: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2901f  ! 143: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbba981f  ! 144: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba989f  ! 145: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL145:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbf2a01f  ! 146: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xc852a05c  ! 147: LDSH_I	ldsh	[%r10 + 0x005c], %r4
	.word 0xce02801f  ! 148: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xcdba985f  ! 149: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 150: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd302a060  ! 151: LDF_I	ld	[%r10, 0x0060], %f9
	.word 0xce8a901f  ! 152: LDUBA_R	lduba	[%r10, %r31] 0x80, %r7
	.word 0xc702a030  ! 153: LDF_I	ld	[%r10, 0x0030], %f3
	.word 0xc39ae050  ! 154: LDDFA_I	ldda	[%r11, 0x0050], %f1
	.word 0xc3ba989f  ! 155: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc03a801f  ! 156: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3f2901f  ! 157: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3f2903f  ! 158: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba981f  ! 159: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcd02e004  ! 160: LDF_I	ld	[%r11, 0x0004], %f6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd01ac01f  ! 161: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xc7baa038  ! 162: STDFA_I	stda	%f3, [0x0038, %r10]
	.word 0xcb02a058  ! 163: LDF_I	ld	[%r10, 0x0058], %f5
	.word 0xc6d2a054  ! 164: LDSHA_I	ldsha	[%r10, + 0x0054] %asi, %r3
	.word 0xcc4a801f  ! 165: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3ba993f  ! 166: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 167: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xcc0ac01f  ! 168: LDUB_R	ldub	[%r11 + %r31], %r6
	.word 0xc322801f  ! 169: STF_R	st	%f1, [%r31, %r10]
	.word 0xd1f2901f  ! 170: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd03aa028  ! 171: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd03a801f  ! 172: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba985f  ! 173: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 174: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 175: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1f2a01f  ! 176: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2903f  ! 177: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xca42a048  ! 178: LDSW_I	ldsw	[%r10 + 0x0048], %r5
	.word 0xcbe2d01f  ! 179: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xc48ad01f  ! 180: LDUBA_R	lduba	[%r11, %r31] 0x80, %r2
TH_LABEL180:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbe2a01f  ! 181: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc83a801f  ! 182: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba993f  ! 183: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2901f  ! 184: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xd39ae028  ! 185: LDDFA_I	ldda	[%r11, 0x0028], %f9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc502e06c  ! 186: LDF_I	ld	[%r11, 0x006c], %f2
	.word 0xd1bad89f  ! 187: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae060  ! 188: STD_I	std	%r8, [%r11 + 0x0060]
	.word 0xcc02801f  ! 189: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xd1bad81f  ! 190: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1bad81f  ! 191: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad87f  ! 192: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcc12a00c  ! 193: LDUH_I	lduh	[%r10 + 0x000c], %r6
	.word 0xce42801f  ! 194: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xc9ba991f  ! 195: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL195:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9ba985f  ! 196: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 197: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 198: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 199: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2901f  ! 200: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc4d2e05e  ! 201: LDSHA_I	ldsha	[%r11, + 0x005e] %asi, %r2
	.word 0xd1ba991f  ! 202: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc492e016  ! 203: LDUHA_I	lduha	[%r11, + 0x0016] %asi, %r2
	.word 0xc5bad91f  ! 204: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 205: CASXA_R	casxa	[%r11]%asi, %r31, %r2
TH_LABEL205:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5e2d11f  ! 206: CASA_I	casa	[%r11] 0x88, %r31, %r2
	.word 0xcfbaa050  ! 207: STDFA_I	stda	%f7, [0x0050, %r10]
	.word 0xc9ba991f  ! 208: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc39ae060  ! 209: LDDFA_I	ldda	[%r11, 0x0060], %f1
	.word 0xca8ad01f  ! 210: LDUBA_R	lduba	[%r11, %r31] 0x80, %r5
TH_LABEL210:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5ba991f  ! 211: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 212: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd092d01f  ! 213: LDUHA_R	lduha	[%r11, %r31] 0x80, %r8
	.word 0xc7ba983f  ! 214: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc522c01f  ! 215: STF_R	st	%f2, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3ba997f  ! 216: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xccc2d13f  ! 217: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r6
	.word 0xcde2911f  ! 218: CASA_I	casa	[%r10] 0x88, %r31, %r6
	.word 0xcdba999f  ! 219: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2911f  ! 220: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdba991f  ! 221: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 222: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2911f  ! 223: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xd19aa008  ! 224: LDDFA_I	ldda	[%r10, 0x0008], %f8
	.word 0xce12c01f  ! 225: LDUH_R	lduh	[%r11 + %r31], %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc302e014  ! 226: LDF_I	ld	[%r11, 0x0014], %f1
	.word 0xcac2a040  ! 227: LDSWA_I	ldswa	[%r10, + 0x0040] %asi, %r5
	.word 0xcc82907f  ! 228: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r6
	.word 0xc89aa058  ! 229: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r4
	.word 0xcbbaa010  ! 230: STDFA_I	stda	%f5, [0x0010, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd2c2901f  ! 231: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r9
	.word 0xcada905f  ! 232: LDXA_R	ldxa	[%r10, %r31] 0x82, %r5
	.word 0xc01aa078  ! 233: LDD_I	ldd	[%r10 + 0x0078], %r0
	.word 0xc41a801f  ! 234: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc9f2911f  ! 235: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
TH_LABEL235:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9ba993f  ! 236: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 237: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 238: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2a01f  ! 239: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2a01f  ! 240: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc902801f  ! 241: LDF_R	ld	[%r10, %r31], %f4
	.word 0xcfe2a01f  ! 242: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd252801f  ! 243: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xd0c2903f  ! 244: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r8
	.word 0xd052801f  ! 245: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7ba981f  ! 246: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 247: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 248: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 249: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 250: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7f2913f  ! 251: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc7f2a01f  ! 252: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba991f  ! 253: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 254: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba983f  ! 255: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdbaa048  ! 256: STDFA_I	stda	%f6, [0x0048, %r10]
	.word 0xd0caa01d  ! 257: LDSBA_I	ldsba	[%r10, + 0x001d] %asi, %r8
	.word 0xc2c2e060  ! 258: LDSWA_I	ldswa	[%r11, + 0x0060] %asi, %r1
	.word 0xc88aa00e  ! 259: LDUBA_I	lduba	[%r10, + 0x000e] %asi, %r4
	.word 0xce92901f  ! 260: LDUHA_R	lduha	[%r10, %r31] 0x80, %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba98bf  ! 261: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 262: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2911f  ! 263: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcfba989f  ! 264: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc12a00a  ! 265: LDUH_I	lduh	[%r10 + 0x000a], %r6
TH_LABEL265:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd03aa068  ! 266: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xd3e2a01f  ! 267: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc6caa025  ! 268: LDSBA_I	ldsba	[%r10, + 0x0025] %asi, %r3
	.word 0xcdf2911f  ! 269: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcc42c01f  ! 270: LDSW_R	ldsw	[%r11 + %r31], %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd0d2a038  ! 271: LDSHA_I	ldsha	[%r10, + 0x0038] %asi, %r8
	.word 0xcc3a801f  ! 272: STD_R	std	%r6, [%r10 + %r31]
	.word 0xceca901f  ! 273: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r7
	.word 0xc3e2d01f  ! 274: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad95f  ! 275: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc28ae04d  ! 276: LDUBA_I	lduba	[%r11, + 0x004d] %asi, %r1
	.word 0xcad2915f  ! 277: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r5
	.word 0xce12801f  ! 278: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xc5e2911f  ! 279: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5ba99bf  ! 280: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd122801f  ! 281: STF_R	st	%f8, [%r31, %r10]
	.word 0xd3ba981f  ! 282: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc812801f  ! 283: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xc43ac01f  ! 284: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 285: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcb9aa008  ! 286: LDDFA_I	ldda	[%r10, 0x0008], %f5
	.word 0xc292907f  ! 287: LDUHA_R	lduha	[%r10, %r31] 0x83, %r1
	.word 0xd00ac01f  ! 288: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xc302e014  ! 289: LDF_I	ld	[%r11, 0x0014], %f1
	.word 0xd03a801f  ! 290: STD_R	std	%r8, [%r10 + %r31]
TH_LABEL290:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3ba985f  ! 291: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba983f  ! 292: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce8ad17f  ! 293: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r7
	.word 0xcbf2e01f  ! 294: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcf02e074  ! 295: LDF_I	ld	[%r11, 0x0074], %f7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xccda917f  ! 296: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r6
	.word 0xcbba989f  ! 297: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba995f  ! 298: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 299: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba99bf  ! 300: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL300:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbba995f  ! 301: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xce12801f  ! 302: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xc5ba991f  ! 303: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 304: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba99bf  ! 305: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5e2901f  ! 306: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xcc8a901f  ! 307: LDUBA_R	lduba	[%r10, %r31] 0x80, %r6
	.word 0xce02801f  ! 308: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xcdba981f  ! 309: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 310: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdf2a01f  ! 311: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba989f  ! 312: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba987f  ! 313: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 314: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba991f  ! 315: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcde2a01f  ! 316: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba981f  ! 317: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 318: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xca52c01f  ! 319: LDSH_R	ldsh	[%r11 + %r31], %r5
	.word 0xc7ba981f  ! 320: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL320:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7ba999f  ! 321: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 322: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba985f  ! 323: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 324: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcec2d13f  ! 325: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcec2e058  ! 326: LDSWA_I	ldswa	[%r11, + 0x0058] %asi, %r7
	.word 0xd3f2d01f  ! 327: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd102801f  ! 328: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc79aa060  ! 329: LDDFA_I	ldda	[%r10, 0x0060], %f3
	.word 0xca8ae06f  ! 330: LDUBA_I	lduba	[%r11, + 0x006f] %asi, %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9e2913f  ! 331: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba991f  ! 332: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc4d2a03a  ! 333: LDSHA_I	ldsha	[%r10, + 0x003a] %asi, %r2
	.word 0xc922801f  ! 334: STF_R	st	%f4, [%r31, %r10]
	.word 0xc81aa010  ! 335: LDD_I	ldd	[%r10 + 0x0010], %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xccc2e018  ! 336: LDSWA_I	ldswa	[%r11, + 0x0018] %asi, %r6
	.word 0xd1ba989f  ! 337: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 338: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 339: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 340: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc8d2e028  ! 341: LDSHA_I	ldsha	[%r11, + 0x0028] %asi, %r4
	.word 0xcfbad83f  ! 342: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd25ac01f  ! 343: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xcc42a02c  ! 344: LDSW_I	ldsw	[%r10 + 0x002c], %r6
	.word 0xc3f2e01f  ! 345: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3bad83f  ! 346: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcac2a04c  ! 347: LDSWA_I	ldswa	[%r10, + 0x004c] %asi, %r5
	.word 0xc03ac01f  ! 348: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad91f  ! 349: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d11f  ! 350: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd012a03e  ! 351: LDUH_I	lduh	[%r10 + 0x003e], %r8
	.word 0xc442801f  ! 352: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xcfbad9bf  ! 353: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ae030  ! 354: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcff2d03f  ! 355: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc3ae030  ! 356: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcfbad87f  ! 357: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2e01f  ! 358: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcfbad8bf  ! 359: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad8bf  ! 360: STDFA_R	stda	%f7, [%r31, %r11]
TH_LABEL360:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd042c01f  ! 361: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xd03aa030  ! 362: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xd00a801f  ! 363: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xc3ba98bf  ! 364: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc25ac01f  ! 365: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3ba981f  ! 366: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba997f  ! 367: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc9baa078  ! 368: STDFA_I	stda	%f4, [0x0078, %r10]
	.word 0xd1e2911f  ! 369: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xd1ba991f  ! 370: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1e2913f  ! 371: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xd1ba981f  ! 372: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba987f  ! 373: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa010  ! 374: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1ba99bf  ! 375: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL375:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd202801f  ! 376: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xcbbad99f  ! 377: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d03f  ! 378: CASXA_I	casxa	[%r11] 0x81, %r31, %r5
	.word 0xcbe2e01f  ! 379: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbf2d13f  ! 380: CASXA_I	casxa	[%r11] 0x89, %r31, %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc702801f  ! 381: LDF_R	ld	[%r10, %r31], %f3
	.word 0xd1ba983f  ! 382: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 383: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2901f  ! 384: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1bae000  ! 385: STDFA_I	stda	%f8, [0x0000, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3baa070  ! 386: STDFA_I	stda	%f9, [0x0070, %r10]
	.word 0xcff2a01f  ! 387: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc65a801f  ! 388: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xc7bae058  ! 389: STDFA_I	stda	%f3, [0x0058, %r11]
	.word 0xc43a801f  ! 390: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc82a044  ! 391: LDUWA_I	lduwa	[%r10, + 0x0044] %asi, %r6
	.word 0xd3bad85f  ! 392: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 393: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xca52a01e  ! 394: LDSH_I	ldsh	[%r10 + 0x001e], %r5
	.word 0xc9ba98bf  ! 395: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9ba997f  ! 396: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba997f  ! 397: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd2d2905f  ! 398: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r9
	.word 0xce12801f  ! 399: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xcfbaa050  ! 400: STDFA_I	stda	%f7, [0x0050, %r10]
TH_LABEL400:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdbad95f  ! 401: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad99f  ! 402: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad83f  ! 403: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 404: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcc3ae050  ! 405: STD_I	std	%r6, [%r11 + 0x0050]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc3ac01f  ! 406: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcc02e020  ! 407: LDUW_I	lduw	[%r11 + 0x0020], %r6
	.word 0xc7e2d03f  ! 408: CASA_I	casa	[%r11] 0x81, %r31, %r3
	.word 0xc7bad9bf  ! 409: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad93f  ! 410: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7e2e01f  ! 411: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc7bad97f  ! 412: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc282a04c  ! 413: LDUWA_I	lduwa	[%r10, + 0x004c] %asi, %r1
	.word 0xcb9ae000  ! 414: LDDFA_I	ldda	[%r11, 0x0000], %f5
	.word 0xc03a801f  ! 415: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3ba997f  ! 416: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 417: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc242a06c  ! 418: LDSW_I	ldsw	[%r10 + 0x006c], %r1
	.word 0xc83ae020  ! 419: STD_I	std	%r4, [%r11 + 0x0020]
	.word 0xc83ac01f  ! 420: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcd02801f  ! 421: LDF_R	ld	[%r10, %r31], %f6
	.word 0xd1ba98bf  ! 422: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 423: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xce12a060  ! 424: LDUH_I	lduh	[%r10 + 0x0060], %r7
	.word 0xc3ba983f  ! 425: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3ba98bf  ! 426: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xce52801f  ! 427: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xc99aa058  ! 428: LDDFA_I	ldda	[%r10, 0x0058], %f4
	.word 0xcfba991f  ! 429: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba99bf  ! 430: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfba99bf  ! 431: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 432: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba989f  ! 433: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcec2a040  ! 434: LDSWA_I	ldswa	[%r10, + 0x0040] %asi, %r7
	.word 0xd3ba99bf  ! 435: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd03a801f  ! 436: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc25aa040  ! 437: LDX_I	ldx	[%r10 + 0x0040], %r1
	.word 0xd3bad93f  ! 438: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 439: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd03ac01f  ! 440: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcd02c01f  ! 441: LDF_R	ld	[%r11, %r31], %f6
	.word 0xd292d15f  ! 442: LDUHA_R	lduha	[%r11, %r31] 0x8a, %r9
	.word 0xd3f2a01f  ! 443: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc79ae020  ! 444: LDDFA_I	ldda	[%r11, 0x0020], %f3
	.word 0xc492e014  ! 445: LDUHA_I	lduha	[%r11, + 0x0014] %asi, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc502801f  ! 446: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcfba987f  ! 447: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 448: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xd0c2901f  ! 449: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r8
	.word 0xc6d2a03c  ! 450: LDSHA_I	ldsha	[%r10, + 0x003c] %asi, %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5f2a01f  ! 451: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc652a016  ! 452: LDSH_I	ldsh	[%r10 + 0x0016], %r3
	.word 0xc252801f  ! 453: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xc3bad87f  ! 454: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad97f  ! 455: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3bad83f  ! 456: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc41ae060  ! 457: LDD_I	ldd	[%r11 + 0x0060], %r2
	.word 0xd3ba985f  ! 458: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc79aa068  ! 459: LDDFA_I	ldda	[%r10, 0x0068], %f3
	.word 0xcbbad91f  ! 460: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbbad89f  ! 461: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc702e020  ! 462: LDF_I	ld	[%r11, 0x0020], %f3
	.word 0xc3e2a01f  ! 463: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc8ca907f  ! 464: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r4
	.word 0xc80ac01f  ! 465: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc12801f  ! 466: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xc7bad87f  ! 467: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 468: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad81f  ! 469: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad99f  ! 470: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc43ae010  ! 471: STD_I	std	%r2, [%r11 + 0x0010]
	.word 0xd04aa063  ! 472: LDSB_I	ldsb	[%r10 + 0x0063], %r8
	.word 0xc9e2e01f  ! 473: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d01f  ! 474: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xcd9aa028  ! 475: LDDFA_I	ldda	[%r10, 0x0028], %f6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd2da903f  ! 476: LDXA_R	ldxa	[%r10, %r31] 0x81, %r9
	.word 0xc43a801f  ! 477: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba981f  ! 478: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc99aa058  ! 479: LDDFA_I	ldda	[%r10, 0x0058], %f4
	.word 0xc7ba995f  ! 480: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc24a801f  ! 481: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xcfba98bf  ! 482: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc252a04a  ! 483: LDSH_I	ldsh	[%r10 + 0x004a], %r1
	.word 0xd082d11f  ! 484: LDUWA_R	lduwa	[%r11, %r31] 0x88, %r8
	.word 0xc7f2a01f  ! 485: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7ba99bf  ! 486: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 487: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc502a06c  ! 488: LDF_I	ld	[%r10, 0x006c], %f2
	.word 0xcaca901f  ! 489: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r5
	.word 0xcfba983f  ! 490: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc322801f  ! 491: STF_R	st	%f1, [%r31, %r10]
	.word 0xd3bae048  ! 492: STDFA_I	stda	%f9, [0x0048, %r11]
	.word 0xd0caa074  ! 493: LDSBA_I	ldsba	[%r10, + 0x0074] %asi, %r8
	.word 0xcf02c01f  ! 494: LDF_R	ld	[%r11, %r31], %f7
	.word 0xcf02801f  ! 495: LDF_R	ld	[%r10, %r31], %f7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc642a068  ! 496: LDSW_I	ldsw	[%r10 + 0x0068], %r3
	.word 0xcc52e014  ! 497: LDSH_I	ldsh	[%r11 + 0x0014], %r6
	.word 0xc5e2903f  ! 498: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba997f  ! 499: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 500: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd39aa040  ! 501: LDDFA_I	ldda	[%r10, 0x0040], %f9
	.word 0xc8cad01f  ! 502: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r4
	.word 0xc412a02a  ! 503: LDUH_I	lduh	[%r10 + 0x002a], %r2
	.word 0xcfbad83f  ! 504: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d03f  ! 505: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfe2d11f  ! 506: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xcfbad81f  ! 507: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcb02c01f  ! 508: LDF_R	ld	[%r11, %r31], %f5
	.word 0xc5ba981f  ! 509: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 510: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5ba981f  ! 511: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 512: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 513: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd04aa077  ! 514: LDSB_I	ldsb	[%r10 + 0x0077], %r8
	.word 0xc242801f  ! 515: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd2daa000  ! 516: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r9
	.word 0xc6caa037  ! 517: LDSBA_I	ldsba	[%r10, + 0x0037] %asi, %r3
	.word 0xd20a801f  ! 518: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xc442a074  ! 519: LDSW_I	ldsw	[%r10 + 0x0074], %r2
	.word 0xc9bad87f  ! 520: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc81aa000  ! 521: LDD_I	ldd	[%r10 + 0x0000], %r4
	.word 0xc3baa070  ! 522: STDFA_I	stda	%f1, [0x0070, %r10]
	.word 0xc83a801f  ! 523: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba981f  ! 524: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 525: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9f2a01f  ! 526: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xd1baa008  ! 527: STDFA_I	stda	%f8, [0x0008, %r10]
	.word 0xcdbaa008  ! 528: STDFA_I	stda	%f6, [0x0008, %r10]
	.word 0xc3baa018  ! 529: STDFA_I	stda	%f1, [0x0018, %r10]
	.word 0xcdba995f  ! 530: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdba991f  ! 531: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcbbaa058  ! 532: STDFA_I	stda	%f5, [0x0058, %r10]
	.word 0xcdbad81f  ! 533: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc682a064  ! 534: LDUWA_I	lduwa	[%r10, + 0x0064] %asi, %r3
	.word 0xd03a801f  ! 535: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3e2913f  ! 536: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd292a00c  ! 537: LDUHA_I	lduha	[%r10, + 0x000c] %asi, %r9
	.word 0xd052801f  ! 538: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xd1bad97f  ! 539: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc452801f  ! 540: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9e2e01f  ! 541: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2e01f  ! 542: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xccdae000  ! 543: LDXA_I	ldxa	[%r11, + 0x0000] %asi, %r6
	.word 0xd0d2d01f  ! 544: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r8
	.word 0xc7ba999f  ! 545: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc43aa008  ! 546: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7ba983f  ! 547: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 548: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc922801f  ! 549: STF_R	st	%f4, [%r31, %r10]
	.word 0xd3bad85f  ! 550: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3bad91f  ! 551: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae008  ! 552: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3bad93f  ! 553: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae008  ! 554: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3e2e01f  ! 555: CASA_R	casa	[%r11] %asi, %r31, %r9
TH_LABEL555:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd202a078  ! 556: LDUW_I	lduw	[%r10 + 0x0078], %r9
	.word 0xd1ba985f  ! 557: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc452e012  ! 558: LDSH_I	ldsh	[%r11 + 0x0012], %r2
	.word 0xc83ae028  ! 559: STD_I	std	%r4, [%r11 + 0x0028]
	.word 0xc9bad81f  ! 560: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9bad81f  ! 561: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 562: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad8bf  ! 563: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd08ae079  ! 564: LDUBA_I	lduba	[%r11, + 0x0079] %asi, %r8
	.word 0xcde2d13f  ! 565: CASA_I	casa	[%r11] 0x89, %r31, %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc65a801f  ! 566: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xc09aa038  ! 567: LDDA_I	ldda	[%r10, + 0x0038] %asi, %r0
	.word 0xd1e2903f  ! 568: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xcedad01f  ! 569: LDXA_R	ldxa	[%r11, %r31] 0x80, %r7
	.word 0xc9f2903f  ! 570: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc68aa06e  ! 571: LDUBA_I	lduba	[%r10, + 0x006e] %asi, %r3
	.word 0xcdf2a01f  ! 572: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc5baa030  ! 573: STDFA_I	stda	%f2, [0x0030, %r10]
	.word 0xc7f2901f  ! 574: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba991f  ! 575: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xccc2911f  ! 576: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r6
	.word 0xc8cae013  ! 577: LDSBA_I	ldsba	[%r11, + 0x0013] %asi, %r4
	.word 0xc83aa010  ! 578: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xcbf2901f  ! 579: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbba981f  ! 580: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL580:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc83a801f  ! 581: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbe2a01f  ! 582: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc45a801f  ! 583: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xc3bad8bf  ! 584: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 585: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc902e070  ! 586: LDF_I	ld	[%r11, 0x0070], %f4
	.word 0xc83aa008  ! 587: STD_I	std	%r4, [%r10 + 0x0008]
	.word 0xca4a801f  ! 588: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xc03a801f  ! 589: STD_R	std	%r0, [%r10 + %r31]
	.word 0xcac2a070  ! 590: LDSWA_I	ldswa	[%r10, + 0x0070] %asi, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfbad91f  ! 591: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc45a801f  ! 592: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xc5f2a01f  ! 593: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xd302801f  ! 594: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd1ba985f  ! 595: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL595:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd03aa028  ! 596: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd1f2a01f  ! 597: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2911f  ! 598: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xc442a074  ! 599: LDSW_I	ldsw	[%r10 + 0x0074], %r2
	.word 0xd3f2a01f  ! 600: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc202801f  ! 601: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xc702c01f  ! 602: LDF_R	ld	[%r11, %r31], %f3
	.word 0xc5e2a01f  ! 603: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 604: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba991f  ! 605: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd19ae070  ! 606: LDDFA_I	ldda	[%r11, 0x0070], %f8
	.word 0xc322801f  ! 607: STF_R	st	%f1, [%r31, %r10]
	.word 0xcbba987f  ! 608: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 609: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcc1aa078  ! 610: LDD_I	ldd	[%r10 + 0x0078], %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xca42e03c  ! 611: LDSW_I	ldsw	[%r11 + 0x003c], %r5
	.word 0xd1bad97f  ! 612: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad9bf  ! 613: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad8bf  ! 614: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d01f  ! 615: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1bad93f  ! 616: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad83f  ! 617: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd39aa050  ! 618: LDDFA_I	ldda	[%r10, 0x0050], %f9
	.word 0xd1bad81f  ! 619: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 620: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc1a801f  ! 621: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc28aa06e  ! 622: LDUBA_I	lduba	[%r10, + 0x006e] %asi, %r1
	.word 0xc8cad17f  ! 623: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r4
	.word 0xc7baa060  ! 624: STDFA_I	stda	%f3, [0x0060, %r10]
	.word 0xcdbaa038  ! 625: STDFA_I	stda	%f6, [0x0038, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc8a903f  ! 626: LDUBA_R	lduba	[%r10, %r31] 0x81, %r6
	.word 0xcbbad83f  ! 627: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad95f  ! 628: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad8bf  ! 629: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad85f  ! 630: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbbad97f  ! 631: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 632: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbf2d01f  ! 633: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad99f  ! 634: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad99f  ! 635: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc83ac01f  ! 636: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad97f  ! 637: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad8bf  ! 638: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad85f  ! 639: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc12a04c  ! 640: LDUH_I	lduh	[%r10 + 0x004c], %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbf2a01f  ! 641: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba997f  ! 642: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 643: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba987f  ! 644: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd05aa000  ! 645: LDX_I	ldx	[%r10 + 0x0000], %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9ba987f  ! 646: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc4aa052  ! 647: LDSB_I	ldsb	[%r10 + 0x0052], %r6
	.word 0xcdba993f  ! 648: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba99bf  ! 649: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc41ae028  ! 650: LDD_I	ldd	[%r11 + 0x0028], %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd01ac01f  ! 651: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xc3ba985f  ! 652: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 653: STD_R	std	%r0, [%r10 + %r31]
	.word 0xd0cad11f  ! 654: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r8
	.word 0xc3f2a01f  ! 655: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd24a801f  ! 656: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xc3ba995f  ! 657: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba999f  ! 659: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2913f  ! 660: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd24aa01f  ! 661: LDSB_I	ldsb	[%r10 + 0x001f], %r9
	.word 0xd102e02c  ! 662: LDF_I	ld	[%r11, 0x002c], %f8
	.word 0xcfe2911f  ! 663: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcc3a801f  ! 664: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc3a801f  ! 665: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbbaa048  ! 666: STDFA_I	stda	%f5, [0x0048, %r10]
	.word 0xcfbad99f  ! 667: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad9bf  ! 668: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d01f  ! 669: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xd002e070  ! 670: LDUW_I	lduw	[%r11 + 0x0070], %r8
TH_LABEL670:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc202801f  ! 671: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xcbba995f  ! 672: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba99bf  ! 673: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd1baa040  ! 674: STDFA_I	stda	%f8, [0x0040, %r10]
	.word 0xd28a911f  ! 675: LDUBA_R	lduba	[%r10, %r31] 0x88, %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7e2a01f  ! 676: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xcadaa060  ! 677: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r5
	.word 0xc43a801f  ! 678: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba985f  ! 679: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba985f  ! 680: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL680:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc902801f  ! 681: LDF_R	ld	[%r10, %r31], %f4
	.word 0xcb02801f  ! 682: LDF_R	ld	[%r10, %r31], %f5
	.word 0xcdf2e01f  ! 683: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xcdbad81f  ! 684: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae040  ! 685: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdbad87f  ! 686: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc39aa060  ! 687: LDDFA_I	ldda	[%r10, 0x0060], %f1
	.word 0xc322801f  ! 688: STF_R	st	%f1, [%r31, %r10]
	.word 0xc7ba989f  ! 689: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba983f  ! 690: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xccd2917f  ! 691: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r6
	.word 0xc682a060  ! 692: LDUWA_I	lduwa	[%r10, + 0x0060] %asi, %r3
	.word 0xc702a058  ! 693: LDF_I	ld	[%r10, 0x0058], %f3
	.word 0xc83aa000  ! 694: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xc692a012  ! 695: LDUHA_I	lduha	[%r10, + 0x0012] %asi, %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfba981f  ! 696: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc242a070  ! 697: LDSW_I	ldsw	[%r10 + 0x0070], %r1
	.word 0xc3bad97f  ! 698: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd2daa020  ! 699: LDXA_I	ldxa	[%r10, + 0x0020] %asi, %r9
	.word 0xcedad07f  ! 700: LDXA_R	ldxa	[%r11, %r31] 0x83, %r7
TH_LABEL700:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3e2901f  ! 701: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba995f  ! 702: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba997f  ! 703: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xccc2a068  ! 704: LDSWA_I	ldswa	[%r10, + 0x0068] %asi, %r6
	.word 0xcbbad81f  ! 705: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc6c2a028  ! 706: LDSWA_I	ldswa	[%r10, + 0x0028] %asi, %r3
	.word 0xc5ba989f  ! 707: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba98bf  ! 708: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc4d2e036  ! 709: LDSHA_I	ldsha	[%r11, + 0x0036] %asi, %r2
	.word 0xc3e2a01f  ! 710: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc03aa010  ! 711: STD_I	std	%r0, [%r10 + 0x0010]
	.word 0xc3ba99bf  ! 712: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 713: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xce5aa030  ! 714: LDX_I	ldx	[%r10 + 0x0030], %r7
	.word 0xcdbaa020  ! 715: STDFA_I	stda	%f6, [0x0020, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1f2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba993f  ! 717: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba991f  ! 718: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 719: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc25ac01f  ! 720: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5ba981f  ! 721: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2901f  ! 722: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc49aa070  ! 723: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r2
	.word 0xc802a060  ! 724: LDUW_I	lduw	[%r10 + 0x0060], %r4
	.word 0xd242a034  ! 725: LDSW_I	ldsw	[%r10 + 0x0034], %r9
TH_LABEL725:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbbad97f  ! 726: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad83f  ! 727: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad85f  ! 728: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xce12e076  ! 729: LDUH_I	lduh	[%r11 + 0x0076], %r7
	.word 0xd3f2a01f  ! 730: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3e2a01f  ! 731: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc81a801f  ! 732: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc49aa058  ! 733: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r2
	.word 0xcd02e064  ! 734: LDF_I	ld	[%r11, 0x0064], %f6
	.word 0xcc3aa008  ! 735: STD_I	std	%r6, [%r10 + 0x0008]
TH_LABEL735:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfe2a01f  ! 736: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc242a030  ! 737: LDSW_I	ldsw	[%r10 + 0x0030], %r1
	.word 0xc922801f  ! 738: STF_R	st	%f4, [%r31, %r10]
	.word 0xc212801f  ! 739: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xd1f2913f  ! 740: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1ba985f  ! 741: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc6c2a040  ! 742: LDSWA_I	ldswa	[%r10, + 0x0040] %asi, %r3
	.word 0xc88aa029  ! 743: LDUBA_I	lduba	[%r10, + 0x0029] %asi, %r4
	.word 0xc83ac01f  ! 744: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbe2d01f  ! 745: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbbad9bf  ! 746: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad83f  ! 747: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc302801f  ! 748: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc3bad85f  ! 749: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcf02e058  ! 750: LDF_I	ld	[%r11, 0x0058], %f7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc642c01f  ! 751: LDSW_R	ldsw	[%r11 + %r31], %r3
	.word 0xd1f2a01f  ! 752: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2a01f  ! 753: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa000  ! 754: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd05ac01f  ! 755: LDX_R	ldx	[%r11 + %r31], %r8
TH_LABEL755:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9f2d01f  ! 756: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc492e000  ! 757: LDUHA_I	lduha	[%r11, + 0x0000] %asi, %r2
	.word 0xcfbad97f  ! 758: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcf02a040  ! 759: LDF_I	ld	[%r10, 0x0040], %f7
	.word 0xcdba987f  ! 760: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdba989f  ! 761: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2901f  ! 762: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xd042801f  ! 763: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xc9e2d01f  ! 764: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc59ae068  ! 765: LDDFA_I	ldda	[%r11, 0x0068], %f2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1e2a01f  ! 766: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1e2a01f  ! 767: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 768: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd012a070  ! 769: LDUH_I	lduh	[%r10 + 0x0070], %r8
	.word 0xc9bad99f  ! 770: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9bad9bf  ! 771: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xca52a000  ! 772: LDSH_I	ldsh	[%r10 + 0x0000], %r5
	.word 0xcd02c01f  ! 773: LDF_R	ld	[%r11, %r31], %f6
	.word 0xceca915f  ! 774: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r7
	.word 0xd1f2901f  ! 775: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03aa058  ! 776: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3bae068  ! 777: STDFA_I	stda	%f9, [0x0068, %r11]
	.word 0xce0a801f  ! 778: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xc7ba981f  ! 779: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 780: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7ba985f  ! 781: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 782: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 783: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba997f  ! 784: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcfbaa018  ! 785: STDFA_I	stda	%f7, [0x0018, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1baa000  ! 786: STDFA_I	stda	%f8, [0x0000, %r10]
	.word 0xc9bad81f  ! 787: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad95f  ! 788: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 789: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc492915f  ! 790: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcf22c01f  ! 791: STF_R	st	%f7, [%r31, %r11]
	.word 0xc7ba987f  ! 792: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc2c2a040  ! 793: LDSWA_I	ldswa	[%r10, + 0x0040] %asi, %r1
	.word 0xc3e2a01f  ! 794: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xcbbaa000  ! 795: STDFA_I	stda	%f5, [0x0000, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xce4ae036  ! 796: LDSB_I	ldsb	[%r11 + 0x0036], %r7
	.word 0xcfba981f  ! 797: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba993f  ! 798: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc49ae058  ! 799: LDDA_I	ldda	[%r11, + 0x0058] %asi, %r2
	.word 0xd2cae054  ! 800: LDSBA_I	ldsba	[%r11, + 0x0054] %asi, %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3f2d01f  ! 801: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xca52801f  ! 802: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xc43ae048  ! 803: STD_I	std	%r2, [%r11 + 0x0048]
	.word 0xccda901f  ! 804: LDXA_R	ldxa	[%r10, %r31] 0x80, %r6
	.word 0xc892a054  ! 805: LDUHA_I	lduha	[%r10, + 0x0054] %asi, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcde2e01f  ! 806: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xc5baa000  ! 807: STDFA_I	stda	%f2, [0x0000, %r10]
	.word 0xc9f2911f  ! 808: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc9e2903f  ! 809: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc9e2a01f  ! 810: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9f2a01f  ! 811: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xd212a03e  ! 812: LDUH_I	lduh	[%r10 + 0x003e], %r9
	.word 0xc6d2a038  ! 813: LDSHA_I	ldsha	[%r10, + 0x0038] %asi, %r3
	.word 0xd202c01f  ! 814: LDUW_R	lduw	[%r11 + %r31], %r9
	.word 0xd1bad87f  ! 815: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1bad93f  ! 816: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d13f  ! 817: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xc522801f  ! 818: STF_R	st	%f2, [%r31, %r10]
	.word 0xcc52e062  ! 819: LDSH_I	ldsh	[%r11 + 0x0062], %r6
	.word 0xcc52a06a  ! 820: LDSH_I	ldsh	[%r10 + 0x006a], %r6
TH_LABEL820:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc43aa060  ! 821: STD_I	std	%r2, [%r10 + 0x0060]
	.word 0xc81ae020  ! 822: LDD_I	ldd	[%r11 + 0x0020], %r4
	.word 0xcec2d17f  ! 823: LDSWA_R	ldswa	[%r11, %r31] 0x8b, %r7
	.word 0xc3ba991f  ! 824: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba98bf  ! 825: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc41aa050  ! 826: LDD_I	ldd	[%r10 + 0x0050], %r2
	.word 0xd1f2a01f  ! 827: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xccd2a070  ! 828: LDSHA_I	ldsha	[%r10, + 0x0070] %asi, %r6
	.word 0xcc3aa050  ! 829: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xcff2901f  ! 830: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
TH_LABEL830:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfba991f  ! 831: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba991f  ! 832: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca42e074  ! 833: LDSW_I	ldsw	[%r11 + 0x0074], %r5
	.word 0xd3ba981f  ! 834: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc6caa01a  ! 835: LDSBA_I	ldsba	[%r10, + 0x001a] %asi, %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc612801f  ! 836: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xc522801f  ! 837: STF_R	st	%f2, [%r31, %r10]
	.word 0xd052801f  ! 838: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xcdbad81f  ! 839: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc452801f  ! 840: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc8aa056  ! 841: LDUBA_I	lduba	[%r10, + 0x0056] %asi, %r6
	.word 0xd1ba999f  ! 842: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcf9aa000  ! 843: LDDFA_I	ldda	[%r10, 0x0000], %f7
	.word 0xcbba981f  ! 844: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc642e034  ! 845: LDSW_I	ldsw	[%r11 + 0x0034], %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbbae028  ! 846: STDFA_I	stda	%f5, [0x0028, %r11]
	.word 0xc492e00e  ! 847: LDUHA_I	lduha	[%r11, + 0x000e] %asi, %r2
	.word 0xc452801f  ! 848: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xcdba981f  ! 849: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc8a917f  ! 850: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3e2d13f  ! 851: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xc8d2e002  ! 852: LDSHA_I	ldsha	[%r11, + 0x0002] %asi, %r4
	.word 0xc322801f  ! 853: STF_R	st	%f1, [%r31, %r10]
	.word 0xd1e2901f  ! 854: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc522801f  ! 855: STF_R	st	%f2, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc43ae008  ! 856: STD_I	std	%r2, [%r11 + 0x0008]
	.word 0xce4a801f  ! 857: LDSB_R	ldsb	[%r10 + %r31], %r7
	.word 0xc3bad93f  ! 858: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad89f  ! 859: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc882901f  ! 860: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba991f  ! 861: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 862: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc702a074  ! 863: LDF_I	ld	[%r10, 0x0074], %f3
	.word 0xc65ac01f  ! 864: LDX_R	ldx	[%r11 + %r31], %r3
	.word 0xd3ba985f  ! 865: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3ba983f  ! 866: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 867: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 868: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba981f  ! 869: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 870: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xca12a02a  ! 871: LDUH_I	lduh	[%r10 + 0x002a], %r5
	.word 0xc7ba987f  ! 872: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 873: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xd2cae005  ! 874: LDSBA_I	ldsba	[%r11, + 0x0005] %asi, %r9
	.word 0xd1ba999f  ! 875: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL875:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc502e060  ! 876: LDF_I	ld	[%r11, 0x0060], %f2
	.word 0xcdf2e01f  ! 877: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xd2d2d17f  ! 878: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r9
	.word 0xc79aa070  ! 879: LDDFA_I	ldda	[%r10, 0x0070], %f3
	.word 0xc68aa02e  ! 880: LDUBA_I	lduba	[%r10, + 0x002e] %asi, %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc20ac01f  ! 881: LDUB_R	ldub	[%r11 + %r31], %r1
	.word 0xc3ba991f  ! 882: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 883: STD_R	std	%r0, [%r10 + %r31]
	.word 0xcd02801f  ! 884: LDF_R	ld	[%r10, %r31], %f6
	.word 0xcc1a801f  ! 885: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd002801f  ! 886: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xcbbad81f  ! 887: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 888: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xc522c01f  ! 889: STF_R	st	%f2, [%r31, %r11]
	.word 0xd3baa070  ! 890: STDFA_I	stda	%f9, [0x0070, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9f2901f  ! 891: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xd09aa038  ! 892: LDDA_I	ldda	[%r10, + 0x0038] %asi, %r8
	.word 0xd09ae048  ! 893: LDDA_I	ldda	[%r11, + 0x0048] %asi, %r8
	.word 0xd1f2a01f  ! 894: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba981f  ! 895: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL895:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd212e008  ! 896: LDUH_I	lduh	[%r11 + 0x0008], %r9
	.word 0xccd2a026  ! 897: LDSHA_I	ldsha	[%r10, + 0x0026] %asi, %r6
	.word 0xc2c2e00c  ! 898: LDSWA_I	ldswa	[%r11, + 0x000c] %asi, %r1
	.word 0xd1ba997f  ! 899: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc882a030  ! 900: LDUWA_I	lduwa	[%r10, + 0x0030] %asi, %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc59aa070  ! 901: LDDFA_I	ldda	[%r10, 0x0070], %f2
	.word 0xca82a064  ! 902: LDUWA_I	lduwa	[%r10, + 0x0064] %asi, %r5
	.word 0xc09aa050  ! 903: LDDA_I	ldda	[%r10, + 0x0050] %asi, %r0
	.word 0xcfbad8bf  ! 904: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc60a801f  ! 905: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xca12801f  ! 906: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xd2cad15f  ! 907: LDSBA_R	ldsba	[%r11, %r31] 0x8a, %r9
	.word 0xc7e2911f  ! 908: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba991f  ! 909: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa030  ! 910: STD_I	std	%r2, [%r10 + 0x0030]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc39aa030  ! 911: LDDFA_I	ldda	[%r10, 0x0030], %f1
	.word 0xcbba98bf  ! 912: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba993f  ! 913: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcd22801f  ! 914: STF_R	st	%f6, [%r31, %r10]
	.word 0xcc3ae050  ! 915: STD_I	std	%r6, [%r11 + 0x0050]
TH_LABEL915:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdbad81f  ! 916: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xce42c01f  ! 917: LDSW_R	ldsw	[%r11 + %r31], %r7
	.word 0xd1e2e01f  ! 918: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad81f  ! 919: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc6c2a018  ! 920: LDSWA_I	ldswa	[%r10, + 0x0018] %asi, %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbba98bf  ! 921: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba997f  ! 922: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 923: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba999f  ! 924: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa028  ! 925: STD_I	std	%r4, [%r10 + 0x0028]
TH_LABEL925:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbba99bf  ! 926: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd01aa000  ! 927: LDD_I	ldd	[%r10 + 0x0000], %r8
	.word 0xc9ba999f  ! 928: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc502801f  ! 929: LDF_R	ld	[%r10, %r31], %f2
	.word 0xd212c01f  ! 930: LDUH_R	lduh	[%r11 + %r31], %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd052c01f  ! 931: LDSH_R	ldsh	[%r11 + %r31], %r8
	.word 0xd09aa050  ! 932: LDDA_I	ldda	[%r10, + 0x0050] %asi, %r8
	.word 0xcf9ae010  ! 933: LDDFA_I	ldda	[%r11, 0x0010], %f7
	.word 0xcde2d11f  ! 934: CASA_I	casa	[%r11] 0x88, %r31, %r6
	.word 0xcb02e068  ! 935: LDF_I	ld	[%r11, 0x0068], %f5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5f2a01f  ! 936: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc43a801f  ! 937: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba999f  ! 938: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc842c01f  ! 939: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xcbba985f  ! 940: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL940:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbf2a01f  ! 941: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcc92a024  ! 942: LDUHA_I	lduha	[%r10, + 0x0024] %asi, %r6
	.word 0xcb02e038  ! 943: LDF_I	ld	[%r11, 0x0038], %f5
	.word 0xd3bad99f  ! 944: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2d13f  ! 945: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3bad91f  ! 946: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc502a018  ! 947: LDF_I	ld	[%r10, 0x0018], %f2
	.word 0xd1bad81f  ! 948: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd2caa046  ! 949: LDSBA_I	ldsba	[%r10, + 0x0046] %asi, %r9
	.word 0xcdba997f  ! 950: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc82e008  ! 951: LDUWA_I	lduwa	[%r11, + 0x0008] %asi, %r6
	.word 0xd052801f  ! 952: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xc242a050  ! 953: LDSW_I	ldsw	[%r10 + 0x0050], %r1
	.word 0xcfe2901f  ! 954: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcff2901f  ! 955: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcfe2913f  ! 956: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcfba983f  ! 957: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa010  ! 958: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcfba987f  ! 959: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfbaa028  ! 960: STDFA_I	stda	%f7, [0x0028, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc85a801f  ! 961: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xd1ba99bf  ! 962: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca42e020  ! 963: LDSW_I	ldsw	[%r11 + 0x0020], %r5
	.word 0xc3ba993f  ! 964: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc80aa049  ! 965: LDUB_I	ldub	[%r10 + 0x0049], %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc1a801f  ! 966: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xcfba981f  ! 967: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa038  ! 968: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcc3aa038  ! 969: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcc3a801f  ! 970: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc64a801f  ! 971: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xcc4ac01f  ! 972: LDSB_R	ldsb	[%r11 + %r31], %r6
	.word 0xc8c2a018  ! 973: LDSWA_I	ldswa	[%r10, + 0x0018] %asi, %r4
	.word 0xd1bad85f  ! 974: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad83f  ! 975: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xce8aa01e  ! 976: LDUBA_I	lduba	[%r10, + 0x001e] %asi, %r7
	.word 0xccca915f  ! 977: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r6
	.word 0xcc8ae001  ! 978: LDUBA_I	lduba	[%r11, + 0x0001] %asi, %r6
	.word 0xd3e2a01f  ! 979: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba99bf  ! 980: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd03aa058  ! 981: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3e2a01f  ! 982: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xcf02801f  ! 983: LDF_R	ld	[%r10, %r31], %f7
	.word 0xce92e06c  ! 984: LDUHA_I	lduha	[%r11, + 0x006c] %asi, %r7
	.word 0xd042c01f  ! 985: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc402a02c  ! 986: LDUW_I	lduw	[%r10 + 0x002c], %r2
	.word 0xc20ae071  ! 987: LDUB_I	ldub	[%r11 + 0x0071], %r1
	.word 0xc59aa028  ! 988: LDDFA_I	ldda	[%r10, 0x0028], %f2
	.word 0xc2daa028  ! 989: LDXA_I	ldxa	[%r10, + 0x0028] %asi, %r1
	.word 0xc5bad81f  ! 990: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5bad91f  ! 991: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc292907f  ! 992: LDUHA_R	lduha	[%r10, %r31] 0x83, %r1
	.word 0xcf22c01f  ! 993: STF_R	st	%f7, [%r31, %r11]
	.word 0xc7ba981f  ! 994: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcd22801f  ! 995: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3f2a01f  ! 996: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc28a905f  ! 997: LDUBA_R	lduba	[%r10, %r31] 0x82, %r1
	.word 0xcfba997f  ! 998: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc2cad11f  ! 999: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r1
	.word 0xc302c01f  ! 1000: LDF_R	ld	[%r11, %r31], %f1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	subcc %r30, 1, %r30
	bnz  TH4_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	add	%g0,	0x1,	%r30
TH3_LOOP_START:
	.word 0xc9ba989f  ! 1: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 2: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd292917f  ! 3: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r9
	.word 0xc212a03c  ! 4: LDUH_I	lduh	[%r10 + 0x003c], %r1
	.word 0xcdbaa050  ! 5: STDFA_I	stda	%f6, [0x0050, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd00a801f  ! 6: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xcfba987f  ! 7: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc5bae060  ! 8: STDFA_I	stda	%f2, [0x0060, %r11]
	.word 0xcfbaa000  ! 9: STDFA_I	stda	%f7, [0x0000, %r10]
	.word 0xcdf2901f  ! 10: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xca42c01f  ! 11: LDSW_R	ldsw	[%r11 + %r31], %r5
	.word 0xc9bad83f  ! 12: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc20ae036  ! 13: LDUB_I	ldub	[%r11 + 0x0036], %r1
	.word 0xcbf2e01f  ! 14: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad97f  ! 15: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbbad91f  ! 16: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 17: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad83f  ! 18: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad97f  ! 19: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad8bf  ! 20: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd05aa030  ! 21: LDX_I	ldx	[%r10 + 0x0030], %r8
	.word 0xc7ba981f  ! 22: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcb02e020  ! 23: LDF_I	ld	[%r11, 0x0020], %f5
	.word 0xcc82d01f  ! 24: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r6
	.word 0xc5f2901f  ! 25: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
TH_LABEL25:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5f2a01f  ! 26: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc99ae020  ! 27: LDDFA_I	ldda	[%r11, 0x0020], %f4
	.word 0xc7f2901f  ! 28: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba989f  ! 29: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2913f  ! 30: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xceca913f  ! 31: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r7
	.word 0xc502801f  ! 32: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcdba991f  ! 33: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba999f  ! 34: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 35: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xce92d01f  ! 36: LDUHA_R	lduha	[%r11, %r31] 0x80, %r7
	.word 0xc9ba981f  ! 37: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba997f  ! 38: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2901f  ! 39: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba989f  ! 40: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcd02c01f  ! 41: LDF_R	ld	[%r11, %r31], %f6
	.word 0xc7f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7e2a01f  ! 43: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc79aa028  ! 44: LDDFA_I	ldda	[%r10, 0x0028], %f3
	.word 0xc65ac01f  ! 45: LDX_R	ldx	[%r11 + %r31], %r3
TH_LABEL45:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc2da903f  ! 46: LDXA_R	ldxa	[%r10, %r31] 0x81, %r1
	.word 0xcfe2903f  ! 47: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcfe2a01f  ! 48: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba99bf  ! 49: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca82901f  ! 50: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3bad81f  ! 51: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 52: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad83f  ! 53: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xca82a004  ! 54: LDUWA_I	lduwa	[%r10, + 0x0004] %asi, %r5
	.word 0xc81ae068  ! 55: LDD_I	ldd	[%r11 + 0x0068], %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7bad89f  ! 56: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad89f  ! 57: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcc42801f  ! 58: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xcccaa016  ! 59: LDSBA_I	ldsba	[%r10, + 0x0016] %asi, %r6
	.word 0xcd02801f  ! 60: LDF_R	ld	[%r10, %r31], %f6
TH_LABEL60:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3ba981f  ! 61: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xccdae050  ! 62: LDXA_I	ldxa	[%r11, + 0x0050] %asi, %r6
	.word 0xcc3ae060  ! 63: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xd2da915f  ! 64: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r9
	.word 0xc5f2901f  ! 65: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5ba991f  ! 66: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 67: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc28ae060  ! 68: LDUBA_I	lduba	[%r11, + 0x0060] %asi, %r1
	.word 0xc7f2a01f  ! 69: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba995f  ! 70: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7e2913f  ! 71: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba991f  ! 72: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 73: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 74: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc28aa038  ! 75: LDUBA_I	lduba	[%r10, + 0x0038] %asi, %r1
TH_LABEL75:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc43ae000  ! 76: STD_I	std	%r2, [%r11 + 0x0000]
	.word 0xc5f2d13f  ! 77: CASXA_I	casxa	[%r11] 0x89, %r31, %r2
	.word 0xc5f2e01f  ! 78: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc43ac01f  ! 79: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc89ae000  ! 80: LDDA_I	ldda	[%r11, + 0x0000] %asi, %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc03ae000  ! 81: STD_I	std	%r0, [%r11 + 0x0000]
	.word 0xc80aa021  ! 82: LDUB_I	ldub	[%r10 + 0x0021], %r4
	.word 0xc83a801f  ! 83: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc482905f  ! 84: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r2
	.word 0xcbba981f  ! 85: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbf2903f  ! 86: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xccda917f  ! 87: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r6
	.word 0xcf22801f  ! 88: STF_R	st	%f7, [%r31, %r10]
	.word 0xcc5ac01f  ! 89: LDX_R	ldx	[%r11 + %r31], %r6
	.word 0xc3e2911f  ! 90: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc03a801f  ! 91: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3ba997f  ! 92: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 93: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc28ad05f  ! 94: LDUBA_R	lduba	[%r11, %r31] 0x82, %r1
	.word 0xc412a008  ! 95: LDUH_I	lduh	[%r10 + 0x0008], %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd01a801f  ! 96: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xc64a801f  ! 97: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xc43ae050  ! 98: STD_I	std	%r2, [%r11 + 0x0050]
	.word 0xc43ae050  ! 99: STD_I	std	%r2, [%r11 + 0x0050]
	.word 0xc8d2d13f  ! 100: LDSHA_R	ldsha	[%r11, %r31] 0x89, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc402c01f  ! 101: LDUW_R	lduw	[%r11 + %r31], %r2
	.word 0xcc82a044  ! 102: LDUWA_I	lduwa	[%r10, + 0x0044] %asi, %r6
	.word 0xc3f2901f  ! 103: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3e2a01f  ! 104: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba981f  ! 105: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL105:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3e2a01f  ! 106: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba993f  ! 107: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 108: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 109: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 110: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcf02a074  ! 111: LDF_I	ld	[%r10, 0x0074], %f7
	.word 0xc43ae038  ! 112: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xc43ac01f  ! 113: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae038  ! 114: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xc43ae038  ! 115: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xca0aa047  ! 116: LDUB_I	ldub	[%r10 + 0x0047], %r5
	.word 0xd1ba995f  ! 117: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba997f  ! 118: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc48aa05c  ! 119: LDUBA_I	lduba	[%r10, + 0x005c] %asi, %r2
	.word 0xc9baa058  ! 120: STDFA_I	stda	%f4, [0x0058, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9f2901f  ! 121: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2903f  ! 122: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc9ba987f  ! 123: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2913f  ! 124: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9f2913f  ! 125: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9ba981f  ! 126: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba989f  ! 127: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc42801f  ! 128: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xc9e2e01f  ! 129: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xd39ae008  ! 130: LDDFA_I	ldda	[%r11, 0x0008], %f9
TH_LABEL130:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfe2a01f  ! 131: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xce8aa00f  ! 132: LDUBA_I	lduba	[%r10, + 0x000f] %asi, %r7
	.word 0xcc3aa028  ! 133: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xcc3a801f  ! 134: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd09aa058  ! 135: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3f2e01f  ! 136: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc212c01f  ! 137: LDUH_R	lduh	[%r11 + %r31], %r1
	.word 0xcdba991f  ! 138: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba989f  ! 139: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 140: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc65ac01f  ! 141: LDX_R	ldx	[%r11 + %r31], %r3
	.word 0xcbba997f  ! 142: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2913f  ! 143: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xcbba991f  ! 144: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba989f  ! 145: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbf2a01f  ! 146: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xce52a038  ! 147: LDSH_I	ldsh	[%r10 + 0x0038], %r7
	.word 0xcc02801f  ! 148: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xcdba985f  ! 149: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 150: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc902a070  ! 151: LDF_I	ld	[%r10, 0x0070], %f4
	.word 0xca8ad01f  ! 152: LDUBA_R	lduba	[%r11, %r31] 0x80, %r5
	.word 0xc502a014  ! 153: LDF_I	ld	[%r10, 0x0014], %f2
	.word 0xcd9aa028  ! 154: LDDFA_I	ldda	[%r10, 0x0028], %f6
	.word 0xc3ba989f  ! 155: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc03a801f  ! 156: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3f2903f  ! 157: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc3f2903f  ! 158: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba981f  ! 159: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcb02a04c  ! 160: LDF_I	ld	[%r10, 0x004c], %f5
TH_LABEL160:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc81ac01f  ! 161: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xc3baa020  ! 162: STDFA_I	stda	%f1, [0x0020, %r10]
	.word 0xc702e078  ! 163: LDF_I	ld	[%r11, 0x0078], %f3
	.word 0xced2a006  ! 164: LDSHA_I	ldsha	[%r10, + 0x0006] %asi, %r7
	.word 0xcc4ac01f  ! 165: LDSB_R	ldsb	[%r11 + %r31], %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3ba99bf  ! 166: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 167: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc20a801f  ! 168: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xcd22801f  ! 169: STF_R	st	%f6, [%r31, %r10]
	.word 0xd1f2903f  ! 170: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03aa028  ! 171: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd03a801f  ! 172: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba981f  ! 173: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 174: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 175: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1f2a01f  ! 176: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2901f  ! 177: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xce42a05c  ! 178: LDSW_I	ldsw	[%r10 + 0x005c], %r7
	.word 0xcbe2d01f  ! 179: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xce8ad01f  ! 180: LDUBA_R	lduba	[%r11, %r31] 0x80, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbe2a01f  ! 181: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc83a801f  ! 182: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba997f  ! 183: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2901f  ! 184: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcd9ae048  ! 185: LDDFA_I	ldda	[%r11, 0x0048], %f6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd302a050  ! 186: LDF_I	ld	[%r10, 0x0050], %f9
	.word 0xd1bad81f  ! 187: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae060  ! 188: STD_I	std	%r8, [%r11 + 0x0060]
	.word 0xd202801f  ! 189: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xd1bad9bf  ! 190: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1bad99f  ! 191: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 192: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc812a07e  ! 193: LDUH_I	lduh	[%r10 + 0x007e], %r4
	.word 0xc842801f  ! 194: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xc9ba987f  ! 195: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9ba991f  ! 196: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba99bf  ! 197: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 198: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 199: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2901f  ! 200: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcad2a040  ! 201: LDSHA_I	ldsha	[%r10, + 0x0040] %asi, %r5
	.word 0xd1ba99bf  ! 202: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd092e06e  ! 203: LDUHA_I	lduha	[%r11, + 0x006e] %asi, %r8
	.word 0xc5bad95f  ! 204: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 205: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5e2d11f  ! 206: CASA_I	casa	[%r11] 0x88, %r31, %r2
	.word 0xd3baa010  ! 207: STDFA_I	stda	%f9, [0x0010, %r10]
	.word 0xc9ba989f  ! 208: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcd9aa070  ! 209: LDDFA_I	ldda	[%r10, 0x0070], %f6
	.word 0xd28a911f  ! 210: LDUBA_R	lduba	[%r10, %r31] 0x88, %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5ba98bf  ! 211: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 212: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc692913f  ! 213: LDUHA_R	lduha	[%r10, %r31] 0x89, %r3
	.word 0xc7ba981f  ! 214: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd122801f  ! 215: STF_R	st	%f8, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3ba995f  ! 216: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcec2903f  ! 217: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r7
	.word 0xcde2913f  ! 218: CASA_I	casa	[%r10] 0x89, %r31, %r6
	.word 0xcdba989f  ! 219: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 220: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdba991f  ! 221: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 222: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2901f  ! 223: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcd9aa038  ! 224: LDDFA_I	ldda	[%r10, 0x0038], %f6
	.word 0xcc12c01f  ! 225: LDUH_R	lduh	[%r11 + %r31], %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcf02a06c  ! 226: LDF_I	ld	[%r10, 0x006c], %f7
	.word 0xcec2a04c  ! 227: LDSWA_I	ldswa	[%r10, + 0x004c] %asi, %r7
	.word 0xce82d15f  ! 228: LDUWA_R	lduwa	[%r11, %r31] 0x8a, %r7
	.word 0xcc9aa048  ! 229: LDDA_I	ldda	[%r10, + 0x0048] %asi, %r6
	.word 0xc9baa018  ! 230: STDFA_I	stda	%f4, [0x0018, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc8c2905f  ! 231: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r4
	.word 0xccdad13f  ! 232: LDXA_R	ldxa	[%r11, %r31] 0x89, %r6
	.word 0xc81aa020  ! 233: LDD_I	ldd	[%r10 + 0x0020], %r4
	.word 0xd01ac01f  ! 234: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xc9f2911f  ! 235: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9ba995f  ! 236: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba997f  ! 237: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 238: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2a01f  ! 239: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2a01f  ! 240: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcf02801f  ! 241: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcfe2a01f  ! 242: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc452801f  ! 243: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xd0c2903f  ! 244: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r8
	.word 0xc452c01f  ! 245: LDSH_R	ldsh	[%r11 + %r31], %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7ba985f  ! 246: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 247: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba99bf  ! 248: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba985f  ! 249: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 250: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7f2901f  ! 251: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7f2a01f  ! 252: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba991f  ! 253: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 254: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba98bf  ! 255: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9baa068  ! 256: STDFA_I	stda	%f4, [0x0068, %r10]
	.word 0xcecae017  ! 257: LDSBA_I	ldsba	[%r11, + 0x0017] %asi, %r7
	.word 0xcac2e064  ! 258: LDSWA_I	ldswa	[%r11, + 0x0064] %asi, %r5
	.word 0xc28ae012  ! 259: LDUBA_I	lduba	[%r11, + 0x0012] %asi, %r1
	.word 0xc692901f  ! 260: LDUHA_R	lduha	[%r10, %r31] 0x80, %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfba981f  ! 261: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba99bf  ! 262: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2913f  ! 263: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcfba983f  ! 264: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc812e04a  ! 265: LDUH_I	lduh	[%r11 + 0x004a], %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd03aa068  ! 266: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xd3e2a01f  ! 267: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc6caa047  ! 268: LDSBA_I	ldsba	[%r10, + 0x0047] %asi, %r3
	.word 0xcdf2901f  ! 269: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xc442801f  ! 270: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xccd2a076  ! 271: LDSHA_I	ldsha	[%r10, + 0x0076] %asi, %r6
	.word 0xcc3a801f  ! 272: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcaca917f  ! 273: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r5
	.word 0xc3e2d03f  ! 274: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xc3bad93f  ! 275: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc68aa068  ! 276: LDUBA_I	lduba	[%r10, + 0x0068] %asi, %r3
	.word 0xc2d2911f  ! 277: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r1
	.word 0xd012801f  ! 278: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xc5e2913f  ! 279: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5ba991f  ! 280: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcb22801f  ! 281: STF_R	st	%f5, [%r31, %r10]
	.word 0xd3ba985f  ! 282: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc212c01f  ! 283: LDUH_R	lduh	[%r11 + %r31], %r1
	.word 0xc43ac01f  ! 284: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 285: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd19ae048  ! 286: LDDFA_I	ldda	[%r11, 0x0048], %f8
	.word 0xc692913f  ! 287: LDUHA_R	lduha	[%r10, %r31] 0x89, %r3
	.word 0xca0a801f  ! 288: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xd302a054  ! 289: LDF_I	ld	[%r10, 0x0054], %f9
	.word 0xd03a801f  ! 290: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3ba989f  ! 291: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 292: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce8a901f  ! 293: LDUBA_R	lduba	[%r10, %r31] 0x80, %r7
	.word 0xcbf2e01f  ! 294: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcd02a06c  ! 295: LDF_I	ld	[%r10, 0x006c], %f6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc6da903f  ! 296: LDXA_R	ldxa	[%r10, %r31] 0x81, %r3
	.word 0xcbba987f  ! 297: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba999f  ! 298: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 299: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba985f  ! 300: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbba98bf  ! 301: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xce12801f  ! 302: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xc5ba983f  ! 303: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 304: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba995f  ! 305: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5e2901f  ! 306: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc48a917f  ! 307: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r2
	.word 0xc602801f  ! 308: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xcdba981f  ! 309: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba98bf  ! 310: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdf2a01f  ! 311: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba991f  ! 312: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba987f  ! 313: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba99bf  ! 314: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba991f  ! 315: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcde2a01f  ! 316: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba989f  ! 317: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2911f  ! 318: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xc452801f  ! 319: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xc7ba993f  ! 320: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7ba989f  ! 321: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba983f  ! 322: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 323: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 324: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcac2901f  ! 325: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc4c2a050  ! 326: LDSWA_I	ldswa	[%r10, + 0x0050] %asi, %r2
	.word 0xd3f2d13f  ! 327: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xc702c01f  ! 328: LDF_R	ld	[%r11, %r31], %f3
	.word 0xc79ae050  ! 329: LDDFA_I	ldda	[%r11, 0x0050], %f3
	.word 0xd28aa05f  ! 330: LDUBA_I	lduba	[%r10, + 0x005f] %asi, %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9e2911f  ! 331: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba999f  ! 332: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc6d2a006  ! 333: LDSHA_I	ldsha	[%r10, + 0x0006] %asi, %r3
	.word 0xc922801f  ! 334: STF_R	st	%f4, [%r31, %r10]
	.word 0xc41aa060  ! 335: LDD_I	ldd	[%r10 + 0x0060], %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xccc2a018  ! 336: LDSWA_I	ldswa	[%r10, + 0x0018] %asi, %r6
	.word 0xd1ba997f  ! 337: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 338: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 339: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba987f  ! 340: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc4d2a060  ! 341: LDSHA_I	ldsha	[%r10, + 0x0060] %asi, %r2
	.word 0xcfbad83f  ! 342: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc85a801f  ! 343: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xc842a060  ! 344: LDSW_I	ldsw	[%r10 + 0x0060], %r4
	.word 0xc3f2e01f  ! 345: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3bad87f  ! 346: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd0c2e068  ! 347: LDSWA_I	ldswa	[%r11, + 0x0068] %asi, %r8
	.word 0xc03ac01f  ! 348: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad97f  ! 349: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d03f  ! 350: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xce12e00a  ! 351: LDUH_I	lduh	[%r11 + 0x000a], %r7
	.word 0xc842801f  ! 352: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xcfbad93f  ! 353: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ae030  ! 354: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcff2d03f  ! 355: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
TH_LABEL355:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc3ae030  ! 356: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcfbad99f  ! 357: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2e01f  ! 358: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcfbad81f  ! 359: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad97f  ! 360: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xca42801f  ! 361: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xd03aa030  ! 362: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xce0a801f  ! 363: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xc3ba993f  ! 364: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xce5ac01f  ! 365: LDX_R	ldx	[%r11 + %r31], %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3ba989f  ! 366: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba993f  ! 367: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3baa020  ! 368: STDFA_I	stda	%f9, [0x0020, %r10]
	.word 0xd1e2901f  ! 369: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba987f  ! 370: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1e2903f  ! 371: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd1ba995f  ! 372: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba985f  ! 373: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa010  ! 374: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1ba991f  ! 375: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd002c01f  ! 376: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xcbbad93f  ! 377: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d01f  ! 378: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbe2e01f  ! 379: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbf2d11f  ! 380: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc302c01f  ! 381: LDF_R	ld	[%r11, %r31], %f1
	.word 0xd1ba999f  ! 382: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 383: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2901f  ! 384: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1bae068  ! 385: STDFA_I	stda	%f8, [0x0068, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3bae028  ! 386: STDFA_I	stda	%f9, [0x0028, %r11]
	.word 0xcff2a01f  ! 387: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xce5a801f  ! 388: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xc3bae008  ! 389: STDFA_I	stda	%f1, [0x0008, %r11]
	.word 0xc43a801f  ! 390: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xca82a000  ! 391: LDUWA_I	lduwa	[%r10, + 0x0000] %asi, %r5
	.word 0xd3bad9bf  ! 392: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 393: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xc252a034  ! 394: LDSH_I	ldsh	[%r10 + 0x0034], %r1
	.word 0xc9ba993f  ! 395: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9ba993f  ! 396: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba989f  ! 397: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcad2901f  ! 398: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r5
	.word 0xce12801f  ! 399: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xd1baa060  ! 400: STDFA_I	stda	%f8, [0x0060, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcdbad89f  ! 401: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad87f  ! 402: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad89f  ! 403: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 404: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcc3ae050  ! 405: STD_I	std	%r6, [%r11 + 0x0050]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc3ac01f  ! 406: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcc02e050  ! 407: LDUW_I	lduw	[%r11 + 0x0050], %r6
	.word 0xc7e2d11f  ! 408: CASA_I	casa	[%r11] 0x88, %r31, %r3
	.word 0xc7bad89f  ! 409: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad87f  ! 410: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7e2e01f  ! 411: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc7bad95f  ! 412: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xce82a000  ! 413: LDUWA_I	lduwa	[%r10, + 0x0000] %asi, %r7
	.word 0xcf9aa050  ! 414: LDDFA_I	ldda	[%r10, 0x0050], %f7
	.word 0xc03a801f  ! 415: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3ba999f  ! 416: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 417: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xce42a074  ! 418: LDSW_I	ldsw	[%r10 + 0x0074], %r7
	.word 0xc83ae020  ! 419: STD_I	std	%r4, [%r11 + 0x0020]
	.word 0xc83ac01f  ! 420: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcf02801f  ! 421: LDF_R	ld	[%r10, %r31], %f7
	.word 0xd1ba98bf  ! 422: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 423: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc212e02e  ! 424: LDUH_I	lduh	[%r11 + 0x002e], %r1
	.word 0xc3ba983f  ! 425: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3ba997f  ! 426: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc452c01f  ! 427: LDSH_R	ldsh	[%r11 + %r31], %r2
	.word 0xc79aa018  ! 428: LDDFA_I	ldda	[%r10, 0x0018], %f3
	.word 0xcfba987f  ! 429: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 430: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL430:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfba981f  ! 431: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba989f  ! 432: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba995f  ! 433: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcec2a018  ! 434: LDSWA_I	ldswa	[%r10, + 0x0018] %asi, %r7
	.word 0xd3ba985f  ! 435: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd03a801f  ! 436: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd25ae000  ! 437: LDX_I	ldx	[%r11 + 0x0000], %r9
	.word 0xd3bad9bf  ! 438: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 439: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd03ac01f  ! 440: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcf02801f  ! 441: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc692911f  ! 442: LDUHA_R	lduha	[%r10, %r31] 0x88, %r3
	.word 0xd3f2a01f  ! 443: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xcb9aa050  ! 444: LDDFA_I	ldda	[%r10, 0x0050], %f5
	.word 0xc692a018  ! 445: LDUHA_I	lduha	[%r10, + 0x0018] %asi, %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc702c01f  ! 446: LDF_R	ld	[%r11, %r31], %f3
	.word 0xcfba989f  ! 447: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 448: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xc2c2905f  ! 449: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r1
	.word 0xc6d2a010  ! 450: LDSHA_I	ldsha	[%r10, + 0x0010] %asi, %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5f2a01f  ! 451: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xd052e026  ! 452: LDSH_I	ldsh	[%r11 + 0x0026], %r8
	.word 0xcc52801f  ! 453: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xc3bad89f  ! 454: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad95f  ! 455: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3bad9bf  ! 456: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcc1aa018  ! 457: LDD_I	ldd	[%r10 + 0x0018], %r6
	.word 0xd3ba991f  ! 458: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcf9ae050  ! 459: LDDFA_I	ldda	[%r11, 0x0050], %f7
	.word 0xcbbad89f  ! 460: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbbad97f  ! 461: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc902a04c  ! 462: LDF_I	ld	[%r10, 0x004c], %f4
	.word 0xc3e2a01f  ! 463: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc4ca913f  ! 464: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r2
	.word 0xce0ac01f  ! 465: LDUB_R	ldub	[%r11 + %r31], %r7
TH_LABEL465:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc212801f  ! 466: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xc7bad9bf  ! 467: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 468: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad83f  ! 469: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad9bf  ! 470: STDFA_R	stda	%f3, [%r31, %r11]
TH_LABEL470:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc43ae010  ! 471: STD_I	std	%r2, [%r11 + 0x0010]
	.word 0xd24aa017  ! 472: LDSB_I	ldsb	[%r10 + 0x0017], %r9
	.word 0xc9e2e01f  ! 473: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d03f  ! 474: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xc59aa068  ! 475: LDDFA_I	ldda	[%r10, 0x0068], %f2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcada913f  ! 476: LDXA_R	ldxa	[%r10, %r31] 0x89, %r5
	.word 0xc43a801f  ! 477: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba981f  ! 478: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcb9aa010  ! 479: LDDFA_I	ldda	[%r10, 0x0010], %f5
	.word 0xc7ba989f  ! 480: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc64ac01f  ! 481: LDSB_R	ldsb	[%r11 + %r31], %r3
	.word 0xcfba983f  ! 482: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd252a068  ! 483: LDSH_I	ldsh	[%r10 + 0x0068], %r9
	.word 0xce82d01f  ! 484: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r7
	.word 0xc7f2a01f  ! 485: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7ba991f  ! 486: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 487: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc702a02c  ! 488: LDF_I	ld	[%r10, 0x002c], %f3
	.word 0xcaca917f  ! 489: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r5
	.word 0xcfba995f  ! 490: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL490:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcd22801f  ! 491: STF_R	st	%f6, [%r31, %r10]
	.word 0xcdbaa018  ! 492: STDFA_I	stda	%f6, [0x0018, %r10]
	.word 0xc4caa055  ! 493: LDSBA_I	ldsba	[%r10, + 0x0055] %asi, %r2
	.word 0xc702c01f  ! 494: LDF_R	ld	[%r11, %r31], %f3
	.word 0xcd02801f  ! 495: LDF_R	ld	[%r10, %r31], %f6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc842a058  ! 496: LDSW_I	ldsw	[%r10 + 0x0058], %r4
	.word 0xd052a036  ! 497: LDSH_I	ldsh	[%r10 + 0x0036], %r8
	.word 0xc5e2911f  ! 498: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5ba99bf  ! 499: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 500: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc59aa020  ! 501: LDDFA_I	ldda	[%r10, 0x0020], %f2
	.word 0xd0ca915f  ! 502: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r8
	.word 0xc612a05a  ! 503: LDUH_I	lduh	[%r10 + 0x005a], %r3
	.word 0xcfbad97f  ! 504: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d11f  ! 505: CASXA_I	casxa	[%r11] 0x88, %r31, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfe2d01f  ! 506: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad99f  ! 507: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc502801f  ! 508: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc5ba999f  ! 509: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 510: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5ba99bf  ! 511: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba99bf  ! 512: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 513: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd24aa054  ! 514: LDSB_I	ldsb	[%r10 + 0x0054], %r9
	.word 0xd042801f  ! 515: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcadaa048  ! 516: LDXA_I	ldxa	[%r10, + 0x0048] %asi, %r5
	.word 0xc2caa07d  ! 517: LDSBA_I	ldsba	[%r10, + 0x007d] %asi, %r1
	.word 0xc20a801f  ! 518: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xcc42a05c  ! 519: LDSW_I	ldsw	[%r10 + 0x005c], %r6
	.word 0xc9bad93f  ! 520: STDFA_R	stda	%f4, [%r31, %r11]
TH_LABEL520:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc41aa018  ! 521: LDD_I	ldd	[%r10 + 0x0018], %r2
	.word 0xc3baa010  ! 522: STDFA_I	stda	%f1, [0x0010, %r10]
	.word 0xc83a801f  ! 523: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba99bf  ! 524: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 525: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9f2a01f  ! 526: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xcbbaa038  ! 527: STDFA_I	stda	%f5, [0x0038, %r10]
	.word 0xd1bae078  ! 528: STDFA_I	stda	%f8, [0x0078, %r11]
	.word 0xc3bae018  ! 529: STDFA_I	stda	%f1, [0x0018, %r11]
	.word 0xcdba993f  ! 530: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdba991f  ! 531: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcbbaa018  ! 532: STDFA_I	stda	%f5, [0x0018, %r10]
	.word 0xcdbad87f  ! 533: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc282a058  ! 534: LDUWA_I	lduwa	[%r10, + 0x0058] %asi, %r1
	.word 0xd03a801f  ! 535: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3e2901f  ! 536: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xc692e06a  ! 537: LDUHA_I	lduha	[%r11, + 0x006a] %asi, %r3
	.word 0xc852801f  ! 538: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xd1bad85f  ! 539: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc852801f  ! 540: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9e2e01f  ! 541: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2e01f  ! 542: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc6daa060  ! 543: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r3
	.word 0xced2911f  ! 544: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r7
	.word 0xc7ba987f  ! 545: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc43aa008  ! 546: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7ba989f  ! 547: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 548: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd322801f  ! 549: STF_R	st	%f9, [%r31, %r10]
	.word 0xd3bad85f  ! 550: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3bad91f  ! 551: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae008  ! 552: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3bad85f  ! 553: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae008  ! 554: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3e2e01f  ! 555: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xce02a008  ! 556: LDUW_I	lduw	[%r10 + 0x0008], %r7
	.word 0xd1ba993f  ! 557: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca52e03c  ! 558: LDSH_I	ldsh	[%r11 + 0x003c], %r5
	.word 0xc83ae028  ! 559: STD_I	std	%r4, [%r11 + 0x0028]
	.word 0xc9bad97f  ! 560: STDFA_R	stda	%f4, [%r31, %r11]
TH_LABEL560:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9bad8bf  ! 561: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 562: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad89f  ! 563: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc68ae03b  ! 564: LDUBA_I	lduba	[%r11, + 0x003b] %asi, %r3
	.word 0xcde2d01f  ! 565: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc25ac01f  ! 566: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xd09aa018  ! 567: LDDA_I	ldda	[%r10, + 0x0018] %asi, %r8
	.word 0xd1e2901f  ! 568: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc2da901f  ! 569: LDXA_R	ldxa	[%r10, %r31] 0x80, %r1
	.word 0xc9f2901f  ! 570: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd28ae00f  ! 571: LDUBA_I	lduba	[%r11, + 0x000f] %asi, %r9
	.word 0xcdf2a01f  ! 572: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc9baa018  ! 573: STDFA_I	stda	%f4, [0x0018, %r10]
	.word 0xc7f2913f  ! 574: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba991f  ! 575: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd2c2d13f  ! 576: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r9
	.word 0xcccaa033  ! 577: LDSBA_I	ldsba	[%r10, + 0x0033] %asi, %r6
	.word 0xc83aa010  ! 578: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xcbf2913f  ! 579: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xcbba995f  ! 580: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc83a801f  ! 581: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbe2a01f  ! 582: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc65ac01f  ! 583: LDX_R	ldx	[%r11 + %r31], %r3
	.word 0xc3bad9bf  ! 584: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 585: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc302e064  ! 586: LDF_I	ld	[%r11, 0x0064], %f1
	.word 0xc83aa008  ! 587: STD_I	std	%r4, [%r10 + 0x0008]
	.word 0xcc4a801f  ! 588: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xc03a801f  ! 589: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc4c2e064  ! 590: LDSWA_I	ldswa	[%r11, + 0x0064] %asi, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfbad91f  ! 591: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc85a801f  ! 592: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xc5f2a01f  ! 593: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc702c01f  ! 594: LDF_R	ld	[%r11, %r31], %f3
	.word 0xd1ba999f  ! 595: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd03aa028  ! 596: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd1f2a01f  ! 597: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2913f  ! 598: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xc442a050  ! 599: LDSW_I	ldsw	[%r10 + 0x0050], %r2
	.word 0xd3f2a01f  ! 600: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd002801f  ! 601: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xd102801f  ! 602: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc5e2a01f  ! 603: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 604: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba981f  ! 605: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcd9aa068  ! 606: LDDFA_I	ldda	[%r10, 0x0068], %f6
	.word 0xcb22c01f  ! 607: STF_R	st	%f5, [%r31, %r11]
	.word 0xcbba981f  ! 608: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 609: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xc41ae020  ! 610: LDD_I	ldd	[%r11 + 0x0020], %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc242a010  ! 611: LDSW_I	ldsw	[%r10 + 0x0010], %r1
	.word 0xd1bad91f  ! 612: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad93f  ! 613: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad95f  ! 614: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d13f  ! 615: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1bad97f  ! 616: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad91f  ! 617: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc39aa000  ! 618: LDDFA_I	ldda	[%r10, 0x0000], %f1
	.word 0xd1bad8bf  ! 619: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 620: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc81a801f  ! 621: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc48ae034  ! 622: LDUBA_I	lduba	[%r11, + 0x0034] %asi, %r2
	.word 0xc6ca917f  ! 623: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r3
	.word 0xc5baa068  ! 624: STDFA_I	stda	%f2, [0x0068, %r10]
	.word 0xc7bae048  ! 625: STDFA_I	stda	%f3, [0x0048, %r11]
TH_LABEL625:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc28a903f  ! 626: LDUBA_R	lduba	[%r10, %r31] 0x81, %r1
	.word 0xcbbad81f  ! 627: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad83f  ! 628: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad9bf  ! 629: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad87f  ! 630: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbbad8bf  ! 631: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 632: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbf2d01f  ! 633: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad89f  ! 634: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad83f  ! 635: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc83ac01f  ! 636: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad99f  ! 637: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad87f  ! 638: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 639: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc612e000  ! 640: LDUH_I	lduh	[%r11 + 0x0000], %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbf2a01f  ! 641: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba985f  ! 642: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 643: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba995f  ! 644: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc25ae040  ! 645: LDX_I	ldx	[%r11 + 0x0040], %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9ba997f  ! 646: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc4aa077  ! 647: LDSB_I	ldsb	[%r10 + 0x0077], %r6
	.word 0xcdba997f  ! 648: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 649: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc81ae030  ! 650: LDD_I	ldd	[%r11 + 0x0030], %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc1a801f  ! 651: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc3ba98bf  ! 652: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 653: STD_R	std	%r0, [%r10 + %r31]
	.word 0xd0ca905f  ! 654: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r8
	.word 0xc3f2a01f  ! 655: CASXA_R	casxa	[%r10]%asi, %r31, %r1
TH_LABEL655:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc4a801f  ! 656: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xc3ba983f  ! 657: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba995f  ! 659: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2913f  ! 660: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd04aa060  ! 661: LDSB_I	ldsb	[%r10 + 0x0060], %r8
	.word 0xcf02a000  ! 662: LDF_I	ld	[%r10, 0x0000], %f7
	.word 0xcfe2901f  ! 663: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcc3a801f  ! 664: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc3a801f  ! 665: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3baa028  ! 666: STDFA_I	stda	%f1, [0x0028, %r10]
	.word 0xcfbad81f  ! 667: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad89f  ! 668: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d13f  ! 669: CASXA_I	casxa	[%r11] 0x89, %r31, %r7
	.word 0xc802e03c  ! 670: LDUW_I	lduw	[%r11 + 0x003c], %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd202801f  ! 671: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xcbba989f  ! 672: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba999f  ! 673: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd1baa060  ! 674: STDFA_I	stda	%f8, [0x0060, %r10]
	.word 0xca8a915f  ! 675: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r5
TH_LABEL675:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7e2a01f  ! 676: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xcadaa008  ! 677: LDXA_I	ldxa	[%r10, + 0x0008] %asi, %r5
	.word 0xc43a801f  ! 678: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba981f  ! 679: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 680: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcf02801f  ! 681: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcb02801f  ! 682: LDF_R	ld	[%r10, %r31], %f5
	.word 0xcdf2e01f  ! 683: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xcdbad9bf  ! 684: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae040  ! 685: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdbad93f  ! 686: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc59aa028  ! 687: LDDFA_I	ldda	[%r10, 0x0028], %f2
	.word 0xd122801f  ! 688: STF_R	st	%f8, [%r31, %r10]
	.word 0xc7ba995f  ! 689: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 690: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xced2915f  ! 691: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r7
	.word 0xc882a030  ! 692: LDUWA_I	lduwa	[%r10, + 0x0030] %asi, %r4
	.word 0xc702a004  ! 693: LDF_I	ld	[%r10, 0x0004], %f3
	.word 0xc83aa000  ! 694: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xcc92e05c  ! 695: LDUHA_I	lduha	[%r11, + 0x005c] %asi, %r6
TH_LABEL695:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfba987f  ! 696: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd042e074  ! 697: LDSW_I	ldsw	[%r11 + 0x0074], %r8
	.word 0xc3bad95f  ! 698: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc4dae010  ! 699: LDXA_I	ldxa	[%r11, + 0x0010] %asi, %r2
	.word 0xc2da905f  ! 700: LDXA_R	ldxa	[%r10, %r31] 0x82, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3e2903f  ! 701: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd3ba987f  ! 702: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba985f  ! 703: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc8c2e020  ! 704: LDSWA_I	ldswa	[%r11, + 0x0020] %asi, %r4
	.word 0xcbbad93f  ! 705: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd0c2a03c  ! 706: LDSWA_I	ldswa	[%r10, + 0x003c] %asi, %r8
	.word 0xc5ba983f  ! 707: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 708: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xccd2a040  ! 709: LDSHA_I	ldsha	[%r10, + 0x0040] %asi, %r6
	.word 0xc3e2a01f  ! 710: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc03aa010  ! 711: STD_I	std	%r0, [%r10 + 0x0010]
	.word 0xc3ba999f  ! 712: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba993f  ! 713: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd25ae018  ! 714: LDX_I	ldx	[%r11 + 0x0018], %r9
	.word 0xcdbaa060  ! 715: STDFA_I	stda	%f6, [0x0060, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1f2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba999f  ! 717: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 718: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba985f  ! 719: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc85ac01f  ! 720: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5ba999f  ! 721: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2913f  ! 722: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xcc9ae068  ! 723: LDDA_I	ldda	[%r11, + 0x0068] %asi, %r6
	.word 0xca02e040  ! 724: LDUW_I	lduw	[%r11 + 0x0040], %r5
	.word 0xce42a074  ! 725: LDSW_I	ldsw	[%r10 + 0x0074], %r7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbbad81f  ! 726: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad85f  ! 727: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad8bf  ! 728: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc212a07e  ! 729: LDUH_I	lduh	[%r10 + 0x007e], %r1
	.word 0xd3f2a01f  ! 730: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3e2a01f  ! 731: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc81a801f  ! 732: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xd09aa048  ! 733: LDDA_I	ldda	[%r10, + 0x0048] %asi, %r8
	.word 0xcb02a014  ! 734: LDF_I	ld	[%r10, 0x0014], %f5
	.word 0xcc3aa008  ! 735: STD_I	std	%r6, [%r10 + 0x0008]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcfe2a01f  ! 736: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd242e050  ! 737: LDSW_I	ldsw	[%r11 + 0x0050], %r9
	.word 0xc322801f  ! 738: STF_R	st	%f1, [%r31, %r10]
	.word 0xc812c01f  ! 739: LDUH_R	lduh	[%r11 + %r31], %r4
	.word 0xd1f2901f  ! 740: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1ba981f  ! 741: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xccc2a05c  ! 742: LDSWA_I	ldswa	[%r10, + 0x005c] %asi, %r6
	.word 0xd08ae046  ! 743: LDUBA_I	lduba	[%r11, + 0x0046] %asi, %r8
	.word 0xc83ac01f  ! 744: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbe2d01f  ! 745: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbbad97f  ! 746: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad91f  ! 747: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc302801f  ! 748: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc3bad91f  ! 749: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc702a078  ! 750: LDF_I	ld	[%r10, 0x0078], %f3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd042801f  ! 751: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xd1f2a01f  ! 752: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2a01f  ! 753: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa000  ! 754: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xc85a801f  ! 755: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9f2d01f  ! 756: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xca92e056  ! 757: LDUHA_I	lduha	[%r11, + 0x0056] %asi, %r5
	.word 0xcfbad85f  ! 758: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc702a078  ! 759: LDF_I	ld	[%r10, 0x0078], %f3
	.word 0xcdba98bf  ! 760: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcdba98bf  ! 761: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2903f  ! 762: CASA_I	casa	[%r10] 0x81, %r31, %r6
	.word 0xc642801f  ! 763: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc9e2d03f  ! 764: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xd19aa058  ! 765: LDDFA_I	ldda	[%r10, 0x0058], %f8
TH_LABEL765:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1e2a01f  ! 766: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1e2a01f  ! 767: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 768: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc812a07c  ! 769: LDUH_I	lduh	[%r10 + 0x007c], %r4
	.word 0xc9bad89f  ! 770: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9bad99f  ! 771: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc252a076  ! 772: LDSH_I	ldsh	[%r10 + 0x0076], %r1
	.word 0xc302801f  ! 773: LDF_R	ld	[%r10, %r31], %f1
	.word 0xd2ca903f  ! 774: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r9
	.word 0xd1f2901f  ! 775: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd03aa058  ! 776: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xcbbaa048  ! 777: STDFA_I	stda	%f5, [0x0048, %r10]
	.word 0xca0a801f  ! 778: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xc7ba99bf  ! 779: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 780: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7ba989f  ! 781: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 782: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2903f  ! 783: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba999f  ! 784: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcfbaa038  ! 785: STDFA_I	stda	%f7, [0x0038, %r10]
TH_LABEL785:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9baa030  ! 786: STDFA_I	stda	%f4, [0x0030, %r10]
	.word 0xc9bad9bf  ! 787: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad87f  ! 788: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 789: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc492d15f  ! 790: LDUHA_R	lduha	[%r11, %r31] 0x8a, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcd22c01f  ! 791: STF_R	st	%f6, [%r31, %r11]
	.word 0xc7ba981f  ! 792: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc6c2e01c  ! 793: LDSWA_I	ldswa	[%r11, + 0x001c] %asi, %r3
	.word 0xc3e2a01f  ! 794: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc5baa060  ! 795: STDFA_I	stda	%f2, [0x0060, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xca4aa05a  ! 796: LDSB_I	ldsb	[%r10 + 0x005a], %r5
	.word 0xcfba991f  ! 797: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 798: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd09aa018  ! 799: LDDA_I	ldda	[%r10, + 0x0018] %asi, %r8
	.word 0xc4caa005  ! 800: LDSBA_I	ldsba	[%r10, + 0x0005] %asi, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3f2d13f  ! 801: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xc452c01f  ! 802: LDSH_R	ldsh	[%r11 + %r31], %r2
	.word 0xc43ae048  ! 803: STD_I	std	%r2, [%r11 + 0x0048]
	.word 0xc4da901f  ! 804: LDXA_R	ldxa	[%r10, %r31] 0x80, %r2
	.word 0xce92e026  ! 805: LDUHA_I	lduha	[%r11, + 0x0026] %asi, %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcde2e01f  ! 806: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdbae040  ! 807: STDFA_I	stda	%f6, [0x0040, %r11]
	.word 0xc9f2901f  ! 808: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9e2913f  ! 809: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9e2a01f  ! 810: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9f2a01f  ! 811: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc812a01e  ! 812: LDUH_I	lduh	[%r10 + 0x001e], %r4
	.word 0xccd2a06a  ! 813: LDSHA_I	ldsha	[%r10, + 0x006a] %asi, %r6
	.word 0xc202c01f  ! 814: LDUW_R	lduw	[%r11 + %r31], %r1
	.word 0xd1bad87f  ! 815: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1bad83f  ! 816: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d01f  ! 817: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xc322801f  ! 818: STF_R	st	%f1, [%r31, %r10]
	.word 0xd052e076  ! 819: LDSH_I	ldsh	[%r11 + 0x0076], %r8
	.word 0xca52e048  ! 820: LDSH_I	ldsh	[%r11 + 0x0048], %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc43aa060  ! 821: STD_I	std	%r2, [%r10 + 0x0060]
	.word 0xcc1ae078  ! 822: LDD_I	ldd	[%r11 + 0x0078], %r6
	.word 0xcac2d15f  ! 823: LDSWA_R	ldswa	[%r11, %r31] 0x8a, %r5
	.word 0xc3ba99bf  ! 824: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 825: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc81aa018  ! 826: LDD_I	ldd	[%r10 + 0x0018], %r4
	.word 0xd1f2a01f  ! 827: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd0d2a01e  ! 828: LDSHA_I	ldsha	[%r10, + 0x001e] %asi, %r8
	.word 0xcc3aa050  ! 829: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xcff2903f  ! 830: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfba981f  ! 831: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 832: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca42a078  ! 833: LDSW_I	ldsw	[%r10 + 0x0078], %r5
	.word 0xd3ba981f  ! 834: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcecaa06b  ! 835: LDSBA_I	ldsba	[%r10, + 0x006b] %asi, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd012c01f  ! 836: LDUH_R	lduh	[%r11 + %r31], %r8
	.word 0xcf22801f  ! 837: STF_R	st	%f7, [%r31, %r10]
	.word 0xcc52c01f  ! 838: LDSH_R	ldsh	[%r11 + %r31], %r6
	.word 0xcdbad9bf  ! 839: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc52c01f  ! 840: LDSH_R	ldsh	[%r11 + %r31], %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd28ae01c  ! 841: LDUBA_I	lduba	[%r11, + 0x001c] %asi, %r9
	.word 0xd1ba985f  ! 842: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd39aa010  ! 843: LDDFA_I	ldda	[%r10, 0x0010], %f9
	.word 0xcbba985f  ! 844: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc442a044  ! 845: LDSW_I	ldsw	[%r10 + 0x0044], %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9baa070  ! 846: STDFA_I	stda	%f4, [0x0070, %r10]
	.word 0xd292a07e  ! 847: LDUHA_I	lduha	[%r10, + 0x007e] %asi, %r9
	.word 0xca52c01f  ! 848: LDSH_R	ldsh	[%r11 + %r31], %r5
	.word 0xcdba987f  ! 849: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd28ad01f  ! 850: LDUBA_R	lduba	[%r11, %r31] 0x80, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3e2d13f  ! 851: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd2d2a06e  ! 852: LDSHA_I	ldsha	[%r10, + 0x006e] %asi, %r9
	.word 0xc322c01f  ! 853: STF_R	st	%f1, [%r31, %r11]
	.word 0xd1e2911f  ! 854: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xcb22801f  ! 855: STF_R	st	%f5, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc43ae008  ! 856: STD_I	std	%r2, [%r11 + 0x0008]
	.word 0xca4ac01f  ! 857: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xc3bad85f  ! 858: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad87f  ! 859: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc882903f  ! 860: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfba997f  ! 861: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 862: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd302a060  ! 863: LDF_I	ld	[%r10, 0x0060], %f9
	.word 0xca5ac01f  ! 864: LDX_R	ldx	[%r11 + %r31], %r5
	.word 0xd3ba99bf  ! 865: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3ba995f  ! 866: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 867: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 868: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba993f  ! 869: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 870: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc612a062  ! 871: LDUH_I	lduh	[%r10 + 0x0062], %r3
	.word 0xc7ba993f  ! 872: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 873: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xd2caa070  ! 874: LDSBA_I	ldsba	[%r10, + 0x0070] %asi, %r9
	.word 0xd1ba999f  ! 875: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc502e038  ! 876: LDF_I	ld	[%r11, 0x0038], %f2
	.word 0xcdf2e01f  ! 877: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xc8d2911f  ! 878: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r4
	.word 0xc99aa018  ! 879: LDDFA_I	ldda	[%r10, 0x0018], %f4
	.word 0xd08aa054  ! 880: LDUBA_I	lduba	[%r10, + 0x0054] %asi, %r8
TH_LABEL880:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd00ac01f  ! 881: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xc3ba991f  ! 882: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 883: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc302c01f  ! 884: LDF_R	ld	[%r11, %r31], %f1
	.word 0xd01a801f  ! 885: LDD_R	ldd	[%r10 + %r31], %r8
TH_LABEL885:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc202801f  ! 886: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xcbbad9bf  ! 887: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 888: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xd122c01f  ! 889: STF_R	st	%f8, [%r31, %r11]
	.word 0xc5bae020  ! 890: STDFA_I	stda	%f2, [0x0020, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9f2903f  ! 891: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xcc9aa008  ! 892: LDDA_I	ldda	[%r10, + 0x0008] %asi, %r6
	.word 0xd09ae048  ! 893: LDDA_I	ldda	[%r11, + 0x0048] %asi, %r8
	.word 0xd1f2a01f  ! 894: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba997f  ! 895: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc612a03a  ! 896: LDUH_I	lduh	[%r10 + 0x003a], %r3
	.word 0xd0d2e000  ! 897: LDSHA_I	ldsha	[%r11, + 0x0000] %asi, %r8
	.word 0xc4c2a004  ! 898: LDSWA_I	ldswa	[%r10, + 0x0004] %asi, %r2
	.word 0xd1ba985f  ! 899: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc882a074  ! 900: LDUWA_I	lduwa	[%r10, + 0x0074] %asi, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcb9ae048  ! 901: LDDFA_I	ldda	[%r11, 0x0048], %f5
	.word 0xc282e02c  ! 902: LDUWA_I	lduwa	[%r11, + 0x002c] %asi, %r1
	.word 0xc89ae078  ! 903: LDDA_I	ldda	[%r11, + 0x0078] %asi, %r4
	.word 0xcfbad81f  ! 904: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd00a801f  ! 905: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd212801f  ! 906: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xcecad01f  ! 907: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r7
	.word 0xc7e2903f  ! 908: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba98bf  ! 909: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa030  ! 910: STD_I	std	%r2, [%r10 + 0x0030]
TH_LABEL910:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc39aa010  ! 911: LDDFA_I	ldda	[%r10, 0x0010], %f1
	.word 0xcbba99bf  ! 912: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba993f  ! 913: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcd22801f  ! 914: STF_R	st	%f6, [%r31, %r10]
	.word 0xcc3ae050  ! 915: STD_I	std	%r6, [%r11 + 0x0050]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdbad91f  ! 916: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc842c01f  ! 917: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xd1e2e01f  ! 918: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad95f  ! 919: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc2c2a064  ! 920: LDSWA_I	ldswa	[%r10, + 0x0064] %asi, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbba99bf  ! 921: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba98bf  ! 922: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 923: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba983f  ! 924: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa028  ! 925: STD_I	std	%r4, [%r10 + 0x0028]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbba983f  ! 926: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc41aa058  ! 927: LDD_I	ldd	[%r10 + 0x0058], %r2
	.word 0xc9ba993f  ! 928: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc902801f  ! 929: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc212c01f  ! 930: LDUH_R	lduh	[%r11 + %r31], %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc252801f  ! 931: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xc49aa050  ! 932: LDDA_I	ldda	[%r10, + 0x0050] %asi, %r2
	.word 0xc99aa040  ! 933: LDDFA_I	ldda	[%r10, 0x0040], %f4
	.word 0xcde2d13f  ! 934: CASA_I	casa	[%r11] 0x89, %r31, %r6
	.word 0xc502a018  ! 935: LDF_I	ld	[%r10, 0x0018], %f2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5f2a01f  ! 936: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc43a801f  ! 937: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba997f  ! 938: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc42801f  ! 939: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xcbba995f  ! 940: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbf2a01f  ! 941: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcc92a000  ! 942: LDUHA_I	lduha	[%r10, + 0x0000] %asi, %r6
	.word 0xc902a068  ! 943: LDF_I	ld	[%r10, 0x0068], %f4
	.word 0xd3bad9bf  ! 944: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2d01f  ! 945: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3bad81f  ! 946: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc502e06c  ! 947: LDF_I	ld	[%r11, 0x006c], %f2
	.word 0xd1bad8bf  ! 948: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc4cae03b  ! 949: LDSBA_I	ldsba	[%r11, + 0x003b] %asi, %r2
	.word 0xcdba993f  ! 950: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd082a054  ! 951: LDUWA_I	lduwa	[%r10, + 0x0054] %asi, %r8
	.word 0xc652c01f  ! 952: LDSH_R	ldsh	[%r11 + %r31], %r3
	.word 0xc642a064  ! 953: LDSW_I	ldsw	[%r10 + 0x0064], %r3
	.word 0xcfe2901f  ! 954: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcff2901f  ! 955: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfe2901f  ! 956: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcfba981f  ! 957: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa010  ! 958: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcfba993f  ! 959: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd3baa038  ! 960: STDFA_I	stda	%f9, [0x0038, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc65a801f  ! 961: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xd1ba98bf  ! 962: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc442e028  ! 963: LDSW_I	ldsw	[%r11 + 0x0028], %r2
	.word 0xc3ba993f  ! 964: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd00aa062  ! 965: LDUB_I	ldub	[%r10 + 0x0062], %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc1ac01f  ! 966: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xcfba981f  ! 967: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa038  ! 968: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcc3aa038  ! 969: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcc3a801f  ! 970: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xca4a801f  ! 971: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xca4a801f  ! 972: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xc4c2e05c  ! 973: LDSWA_I	ldswa	[%r11, + 0x005c] %asi, %r2
	.word 0xd1bad89f  ! 974: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad9bf  ! 975: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc88aa003  ! 976: LDUBA_I	lduba	[%r10, + 0x0003] %asi, %r4
	.word 0xd0ca915f  ! 977: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r8
	.word 0xc68aa078  ! 978: LDUBA_I	lduba	[%r10, + 0x0078] %asi, %r3
	.word 0xd3e2a01f  ! 979: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba981f  ! 980: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd03aa058  ! 981: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3e2a01f  ! 982: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd102801f  ! 983: LDF_R	ld	[%r10, %r31], %f8
	.word 0xd092a07c  ! 984: LDUHA_I	lduha	[%r10, + 0x007c] %asi, %r8
	.word 0xc242801f  ! 985: LDSW_R	ldsw	[%r10 + %r31], %r1
TH_LABEL985:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc802e070  ! 986: LDUW_I	lduw	[%r11 + 0x0070], %r4
	.word 0xce0ae006  ! 987: LDUB_I	ldub	[%r11 + 0x0006], %r7
	.word 0xcb9aa038  ! 988: LDDFA_I	ldda	[%r10, 0x0038], %f5
	.word 0xc2dae070  ! 989: LDXA_I	ldxa	[%r11, + 0x0070] %asi, %r1
	.word 0xc5bad97f  ! 990: STDFA_R	stda	%f2, [%r31, %r11]
TH_LABEL990:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5bad99f  ! 991: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xce92d11f  ! 992: LDUHA_R	lduha	[%r11, %r31] 0x88, %r7
	.word 0xcd22c01f  ! 993: STF_R	st	%f6, [%r31, %r11]
	.word 0xc7ba983f  ! 994: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd122801f  ! 995: STF_R	st	%f8, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3f2a01f  ! 996: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd08a913f  ! 997: LDUBA_R	lduba	[%r10, %r31] 0x89, %r8
	.word 0xcfba997f  ! 998: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc2ca903f  ! 999: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r1
	.word 0xcd02801f  ! 1000: LDF_R	ld	[%r10, %r31], %f6
TH_LABEL1000:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	subcc %r30, 1, %r30
	bnz  TH3_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	add	%g0,	0x1,	%r30
TH2_LOOP_START:
	.word 0xc9ba981f  ! 1: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba997f  ! 2: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xca92d05f  ! 3: LDUHA_R	lduha	[%r11, %r31] 0x82, %r5
	.word 0xca12e014  ! 4: LDUH_I	lduh	[%r11 + 0x0014], %r5
	.word 0xd3bae048  ! 5: STDFA_I	stda	%f9, [0x0048, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd00ac01f  ! 6: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xcfba98bf  ! 7: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd3baa028  ! 8: STDFA_I	stda	%f9, [0x0028, %r10]
	.word 0xd3baa000  ! 9: STDFA_I	stda	%f9, [0x0000, %r10]
	.word 0xcdf2903f  ! 10: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc842801f  ! 11: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xc9bad85f  ! 12: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd20ae033  ! 13: LDUB_I	ldub	[%r11 + 0x0033], %r9
	.word 0xcbf2e01f  ! 14: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad89f  ! 15: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbbad9bf  ! 16: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 17: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad99f  ! 18: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad97f  ! 19: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad99f  ! 20: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc65aa008  ! 21: LDX_I	ldx	[%r10 + 0x0008], %r3
	.word 0xc7ba989f  ! 22: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc902a028  ! 23: LDF_I	ld	[%r10, 0x0028], %f4
	.word 0xc482901f  ! 24: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r2
	.word 0xc5f2901f  ! 25: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5f2a01f  ! 26: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xd19ae050  ! 27: LDDFA_I	ldda	[%r11, 0x0050], %f8
	.word 0xc7f2903f  ! 28: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba98bf  ! 29: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 30: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd2ca903f  ! 31: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r9
	.word 0xc302801f  ! 32: LDF_R	ld	[%r10, %r31], %f1
	.word 0xcdba981f  ! 33: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 34: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 35: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xca92911f  ! 36: LDUHA_R	lduha	[%r10, %r31] 0x88, %r5
	.word 0xc9ba997f  ! 37: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 38: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2901f  ! 39: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba98bf  ! 40: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL40:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc702801f  ! 41: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc7f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7e2a01f  ! 43: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xcd9aa038  ! 44: LDDFA_I	ldda	[%r10, 0x0038], %f6
	.word 0xc85a801f  ! 45: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc8da903f  ! 46: LDXA_R	ldxa	[%r10, %r31] 0x81, %r4
	.word 0xcfe2901f  ! 47: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcfe2a01f  ! 48: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba98bf  ! 49: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc482901f  ! 50: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3bad95f  ! 51: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad9bf  ! 52: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad97f  ! 53: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc482a024  ! 54: LDUWA_I	lduwa	[%r10, + 0x0024] %asi, %r2
	.word 0xc81aa068  ! 55: LDD_I	ldd	[%r10 + 0x0068], %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7bad9bf  ! 56: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad9bf  ! 57: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc842c01f  ! 58: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xcecae01a  ! 59: LDSBA_I	ldsba	[%r11, + 0x001a] %asi, %r7
	.word 0xc702801f  ! 60: LDF_R	ld	[%r10, %r31], %f3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3ba995f  ! 61: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc6daa058  ! 62: LDXA_I	ldxa	[%r10, + 0x0058] %asi, %r3
	.word 0xcc3ae060  ! 63: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xc6da911f  ! 64: LDXA_R	ldxa	[%r10, %r31] 0x88, %r3
	.word 0xc5f2901f  ! 65: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5ba983f  ! 66: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 67: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd28aa04f  ! 68: LDUBA_I	lduba	[%r10, + 0x004f] %asi, %r9
	.word 0xc7f2a01f  ! 69: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba981f  ! 70: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7e2911f  ! 71: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba997f  ! 72: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba985f  ! 73: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba99bf  ! 74: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd28aa050  ! 75: LDUBA_I	lduba	[%r10, + 0x0050] %asi, %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc43ae000  ! 76: STD_I	std	%r2, [%r11 + 0x0000]
	.word 0xc5f2d11f  ! 77: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xc5f2e01f  ! 78: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc43ac01f  ! 79: STD_R	std	%r2, [%r11 + %r31]
	.word 0xcc9aa010  ! 80: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc03ae000  ! 81: STD_I	std	%r0, [%r11 + 0x0000]
	.word 0xd20ae05e  ! 82: LDUB_I	ldub	[%r11 + 0x005e], %r9
	.word 0xc83a801f  ! 83: STD_R	std	%r4, [%r10 + %r31]
	.word 0xca82905f  ! 84: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r5
	.word 0xcbba995f  ! 85: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL85:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbf2913f  ! 86: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xd2da913f  ! 87: LDXA_R	ldxa	[%r10, %r31] 0x89, %r9
	.word 0xc722801f  ! 88: STF_R	st	%f3, [%r31, %r10]
	.word 0xd05a801f  ! 89: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xc3e2903f  ! 90: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc03a801f  ! 91: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3ba987f  ! 92: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 93: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xd08ad01f  ! 94: LDUBA_R	lduba	[%r11, %r31] 0x80, %r8
	.word 0xc412a01e  ! 95: LDUH_I	lduh	[%r10 + 0x001e], %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc1a801f  ! 96: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc44a801f  ! 97: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xc43ae050  ! 98: STD_I	std	%r2, [%r11 + 0x0050]
	.word 0xc43ae050  ! 99: STD_I	std	%r2, [%r11 + 0x0050]
	.word 0xccd2d01f  ! 100: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc802801f  ! 101: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xcc82a030  ! 102: LDUWA_I	lduwa	[%r10, + 0x0030] %asi, %r6
	.word 0xc3f2911f  ! 103: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc3e2a01f  ! 104: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba985f  ! 105: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3e2a01f  ! 106: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba981f  ! 107: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba98bf  ! 108: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba993f  ! 109: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba983f  ! 110: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc702a058  ! 111: LDF_I	ld	[%r10, 0x0058], %f3
	.word 0xc43ae038  ! 112: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xc43ac01f  ! 113: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae038  ! 114: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xc43ae038  ! 115: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc80aa002  ! 116: LDUB_I	ldub	[%r10 + 0x0002], %r4
	.word 0xd1ba989f  ! 117: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba985f  ! 118: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc68ae07e  ! 119: LDUBA_I	lduba	[%r11, + 0x007e] %asi, %r3
	.word 0xd1baa078  ! 120: STDFA_I	stda	%f8, [0x0078, %r10]
TH_LABEL120:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9f2901f  ! 121: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2901f  ! 122: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba989f  ! 123: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 124: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2901f  ! 125: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
TH_LABEL125:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9ba997f  ! 126: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba987f  ! 127: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc42c01f  ! 128: LDSW_R	ldsw	[%r11 + %r31], %r6
	.word 0xc9e2e01f  ! 129: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xcb9aa020  ! 130: LDDFA_I	ldda	[%r10, 0x0020], %f5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfe2a01f  ! 131: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc28aa07e  ! 132: LDUBA_I	lduba	[%r10, + 0x007e] %asi, %r1
	.word 0xcc3aa028  ! 133: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xcc3a801f  ! 134: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd09aa050  ! 135: LDDA_I	ldda	[%r10, + 0x0050] %asi, %r8
TH_LABEL135:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3f2e01f  ! 136: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc212801f  ! 137: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xcdba98bf  ! 138: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba987f  ! 139: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2911f  ! 140: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd25a801f  ! 141: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xcbba99bf  ! 142: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2911f  ! 143: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xcbba995f  ! 144: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 145: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbf2a01f  ! 146: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xce52e00a  ! 147: LDSH_I	ldsh	[%r11 + 0x000a], %r7
	.word 0xcc02801f  ! 148: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xcdba995f  ! 149: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 150: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcf02e060  ! 151: LDF_I	ld	[%r11, 0x0060], %f7
	.word 0xc88ad11f  ! 152: LDUBA_R	lduba	[%r11, %r31] 0x88, %r4
	.word 0xc902a020  ! 153: LDF_I	ld	[%r10, 0x0020], %f4
	.word 0xc79aa038  ! 154: LDDFA_I	ldda	[%r10, 0x0038], %f3
	.word 0xc3ba995f  ! 155: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc03a801f  ! 156: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3f2911f  ! 157: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc3f2903f  ! 158: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba993f  ! 159: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcd02a024  ! 160: LDF_I	ld	[%r10, 0x0024], %f6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc81a801f  ! 161: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xcdbaa018  ! 162: STDFA_I	stda	%f6, [0x0018, %r10]
	.word 0xc502a04c  ! 163: LDF_I	ld	[%r10, 0x004c], %f2
	.word 0xc4d2e00a  ! 164: LDSHA_I	ldsha	[%r11, + 0x000a] %asi, %r2
	.word 0xce4ac01f  ! 165: LDSB_R	ldsb	[%r11 + %r31], %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3ba99bf  ! 166: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 167: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xce0a801f  ! 168: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xcb22c01f  ! 169: STF_R	st	%f5, [%r31, %r11]
	.word 0xd1f2901f  ! 170: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
TH_LABEL170:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd03aa028  ! 171: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd03a801f  ! 172: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba993f  ! 173: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba98bf  ! 174: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 175: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1f2a01f  ! 176: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2913f  ! 177: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xc242a070  ! 178: LDSW_I	ldsw	[%r10 + 0x0070], %r1
	.word 0xcbe2d13f  ! 179: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xc28a901f  ! 180: LDUBA_R	lduba	[%r10, %r31] 0x80, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbe2a01f  ! 181: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc83a801f  ! 182: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba997f  ! 183: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2901f  ! 184: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xc79ae010  ! 185: LDDFA_I	ldda	[%r11, 0x0010], %f3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc702a020  ! 186: LDF_I	ld	[%r10, 0x0020], %f3
	.word 0xd1bad81f  ! 187: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae060  ! 188: STD_I	std	%r8, [%r11 + 0x0060]
	.word 0xc802801f  ! 189: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xd1bad91f  ! 190: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1bad99f  ! 191: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad97f  ! 192: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd012a060  ! 193: LDUH_I	lduh	[%r10 + 0x0060], %r8
	.word 0xc842c01f  ! 194: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xc9ba989f  ! 195: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9ba981f  ! 196: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 197: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba997f  ! 198: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba987f  ! 199: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2903f  ! 200: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc2d2a01c  ! 201: LDSHA_I	ldsha	[%r10, + 0x001c] %asi, %r1
	.word 0xd1ba985f  ! 202: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca92a068  ! 203: LDUHA_I	lduha	[%r10, + 0x0068] %asi, %r5
	.word 0xc5bad81f  ! 204: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 205: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5e2d03f  ! 206: CASA_I	casa	[%r11] 0x81, %r31, %r2
	.word 0xc3bae068  ! 207: STDFA_I	stda	%f1, [0x0068, %r11]
	.word 0xc9ba98bf  ! 208: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc99ae060  ! 209: LDDFA_I	ldda	[%r11, 0x0060], %f4
	.word 0xc48a917f  ! 210: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5ba985f  ! 211: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 212: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc92d15f  ! 213: LDUHA_R	lduha	[%r11, %r31] 0x8a, %r6
	.word 0xc7ba985f  ! 214: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd122801f  ! 215: STF_R	st	%f8, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3ba985f  ! 216: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd0c2d11f  ! 217: LDSWA_R	ldswa	[%r11, %r31] 0x88, %r8
	.word 0xcde2901f  ! 218: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xcdba981f  ! 219: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 220: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdba98bf  ! 221: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 222: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2901f  ! 223: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xd39ae050  ! 224: LDDFA_I	ldda	[%r11, 0x0050], %f9
	.word 0xc412801f  ! 225: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc502a05c  ! 226: LDF_I	ld	[%r10, 0x005c], %f2
	.word 0xc4c2a00c  ! 227: LDSWA_I	ldswa	[%r10, + 0x000c] %asi, %r2
	.word 0xd082903f  ! 228: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r8
	.word 0xc49ae010  ! 229: LDDA_I	ldda	[%r11, + 0x0010] %asi, %r2
	.word 0xc9baa078  ! 230: STDFA_I	stda	%f4, [0x0078, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc6c2911f  ! 231: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r3
	.word 0xc2dad15f  ! 232: LDXA_R	ldxa	[%r11, %r31] 0x8a, %r1
	.word 0xc01aa020  ! 233: LDD_I	ldd	[%r10 + 0x0020], %r0
	.word 0xc81a801f  ! 234: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc9f2913f  ! 235: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9ba991f  ! 236: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba987f  ! 237: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 238: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2a01f  ! 239: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2a01f  ! 240: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc702801f  ! 241: LDF_R	ld	[%r10, %r31], %f3
	.word 0xcfe2a01f  ! 242: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc852801f  ! 243: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xc8c2905f  ! 244: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r4
	.word 0xc452801f  ! 245: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7ba997f  ! 246: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 247: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba995f  ! 248: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 249: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 250: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL250:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7f2901f  ! 251: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7f2a01f  ! 252: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba981f  ! 253: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 254: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba995f  ! 255: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9bae048  ! 256: STDFA_I	stda	%f4, [0x0048, %r11]
	.word 0xcacaa073  ! 257: LDSBA_I	ldsba	[%r10, + 0x0073] %asi, %r5
	.word 0xd2c2a058  ! 258: LDSWA_I	ldswa	[%r10, + 0x0058] %asi, %r9
	.word 0xd08aa038  ! 259: LDUBA_I	lduba	[%r10, + 0x0038] %asi, %r8
	.word 0xc692d17f  ! 260: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r3
TH_LABEL260:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfba98bf  ! 261: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba985f  ! 262: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2913f  ! 263: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcfba991f  ! 264: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xce12a006  ! 265: LDUH_I	lduh	[%r10 + 0x0006], %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd03aa068  ! 266: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xd3e2a01f  ! 267: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc2caa020  ! 268: LDSBA_I	ldsba	[%r10, + 0x0020] %asi, %r1
	.word 0xcdf2901f  ! 269: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xce42c01f  ! 270: LDSW_R	ldsw	[%r11 + %r31], %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xced2a01e  ! 271: LDSHA_I	ldsha	[%r10, + 0x001e] %asi, %r7
	.word 0xcc3a801f  ! 272: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc4ca911f  ! 273: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r2
	.word 0xc3e2d01f  ! 274: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad93f  ! 275: STDFA_R	stda	%f1, [%r31, %r11]
TH_LABEL275:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xce8aa02c  ! 276: LDUBA_I	lduba	[%r10, + 0x002c] %asi, %r7
	.word 0xc8d2913f  ! 277: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r4
	.word 0xd212801f  ! 278: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xc5e2911f  ! 279: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5ba981f  ! 280: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcb22801f  ! 281: STF_R	st	%f5, [%r31, %r10]
	.word 0xd3ba981f  ! 282: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xca12c01f  ! 283: LDUH_R	lduh	[%r11 + %r31], %r5
	.word 0xc43ac01f  ! 284: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 285: STD_R	std	%r2, [%r11 + %r31]
TH_LABEL285:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd39aa068  ! 286: LDDFA_I	ldda	[%r10, 0x0068], %f9
	.word 0xca92915f  ! 287: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r5
	.word 0xca0a801f  ! 288: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xd302a030  ! 289: LDF_I	ld	[%r10, 0x0030], %f9
	.word 0xd03a801f  ! 290: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3ba995f  ! 291: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba997f  ! 292: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc48ad07f  ! 293: LDUBA_R	lduba	[%r11, %r31] 0x83, %r2
	.word 0xcbf2e01f  ! 294: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xd302a000  ! 295: LDF_I	ld	[%r10, 0x0000], %f9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc4da915f  ! 296: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r2
	.word 0xcbba983f  ! 297: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba989f  ! 298: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 299: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba991f  ! 300: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbba991f  ! 301: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc812c01f  ! 302: LDUH_R	lduh	[%r11 + %r31], %r4
	.word 0xc5ba981f  ! 303: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 304: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba991f  ! 305: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5e2903f  ! 306: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xcc8a911f  ! 307: LDUBA_R	lduba	[%r10, %r31] 0x88, %r6
	.word 0xd002c01f  ! 308: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xcdba997f  ! 309: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 310: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdf2a01f  ! 311: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba985f  ! 312: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba99bf  ! 313: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba98bf  ! 314: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 315: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcde2a01f  ! 316: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba999f  ! 317: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2913f  ! 318: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xc452801f  ! 319: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xc7ba99bf  ! 320: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7ba991f  ! 321: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 322: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 323: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba99bf  ! 324: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc2c2d11f  ! 325: LDSWA_R	ldswa	[%r11, %r31] 0x88, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc6c2a07c  ! 326: LDSWA_I	ldswa	[%r10, + 0x007c] %asi, %r3
	.word 0xd3f2d13f  ! 327: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xc702c01f  ! 328: LDF_R	ld	[%r11, %r31], %f3
	.word 0xc39ae050  ! 329: LDDFA_I	ldda	[%r11, 0x0050], %f1
	.word 0xc28aa00f  ! 330: LDUBA_I	lduba	[%r10, + 0x000f] %asi, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9e2901f  ! 331: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba991f  ! 332: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcad2a034  ! 333: LDSHA_I	ldsha	[%r10, + 0x0034] %asi, %r5
	.word 0xc922801f  ! 334: STF_R	st	%f4, [%r31, %r10]
	.word 0xc01ae018  ! 335: LDD_I	ldd	[%r11 + 0x0018], %r0
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc2c2a060  ! 336: LDSWA_I	ldswa	[%r10, + 0x0060] %asi, %r1
	.word 0xd1ba999f  ! 337: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 338: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba987f  ! 339: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 340: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd2d2e062  ! 341: LDSHA_I	ldsha	[%r11, + 0x0062] %asi, %r9
	.word 0xcfbad85f  ! 342: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc45a801f  ! 343: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xd042a000  ! 344: LDSW_I	ldsw	[%r10 + 0x0000], %r8
	.word 0xc3f2e01f  ! 345: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3bad87f  ! 346: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xccc2a070  ! 347: LDSWA_I	ldswa	[%r10, + 0x0070] %asi, %r6
	.word 0xc03ac01f  ! 348: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad81f  ! 349: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d01f  ! 350: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc612e04c  ! 351: LDUH_I	lduh	[%r11 + 0x004c], %r3
	.word 0xca42801f  ! 352: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xcfbad81f  ! 353: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ae030  ! 354: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcff2d01f  ! 355: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc3ae030  ! 356: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcfbad89f  ! 357: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2e01f  ! 358: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcfbad83f  ! 359: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad81f  ! 360: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc242801f  ! 361: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xd03aa030  ! 362: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xca0a801f  ! 363: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xc3ba985f  ! 364: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xca5a801f  ! 365: LDX_R	ldx	[%r10 + %r31], %r5
TH_LABEL365:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3ba981f  ! 366: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba993f  ! 367: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3bae018  ! 368: STDFA_I	stda	%f9, [0x0018, %r11]
	.word 0xd1e2901f  ! 369: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba981f  ! 370: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL370:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1e2913f  ! 371: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xd1ba991f  ! 372: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba985f  ! 373: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa010  ! 374: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1ba999f  ! 375: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd202801f  ! 376: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xcbbad9bf  ! 377: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d11f  ! 378: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xcbe2e01f  ! 379: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbf2d11f  ! 380: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcd02801f  ! 381: LDF_R	ld	[%r10, %r31], %f6
	.word 0xd1ba983f  ! 382: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 383: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2913f  ! 384: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xc9baa058  ! 385: STDFA_I	stda	%f4, [0x0058, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7bae068  ! 386: STDFA_I	stda	%f3, [0x0068, %r11]
	.word 0xcff2a01f  ! 387: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xd25a801f  ! 388: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xd1baa028  ! 389: STDFA_I	stda	%f8, [0x0028, %r10]
	.word 0xc43a801f  ! 390: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd082a028  ! 391: LDUWA_I	lduwa	[%r10, + 0x0028] %asi, %r8
	.word 0xd3bad87f  ! 392: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 393: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xc652a056  ! 394: LDSH_I	ldsh	[%r10 + 0x0056], %r3
	.word 0xc9ba981f  ! 395: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9ba98bf  ! 396: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 397: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd2d2903f  ! 398: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r9
	.word 0xce12c01f  ! 399: LDUH_R	lduh	[%r11 + %r31], %r7
	.word 0xcdbaa048  ! 400: STDFA_I	stda	%f6, [0x0048, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdbad93f  ! 401: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad87f  ! 402: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad9bf  ! 403: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 404: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcc3ae050  ! 405: STD_I	std	%r6, [%r11 + 0x0050]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc3ac01f  ! 406: STD_R	std	%r6, [%r11 + %r31]
	.word 0xc202a060  ! 407: LDUW_I	lduw	[%r10 + 0x0060], %r1
	.word 0xc7e2d11f  ! 408: CASA_I	casa	[%r11] 0x88, %r31, %r3
	.word 0xc7bad95f  ! 409: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad97f  ! 410: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7e2e01f  ! 411: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc7bad97f  ! 412: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xce82e054  ! 413: LDUWA_I	lduwa	[%r11, + 0x0054] %asi, %r7
	.word 0xcf9aa000  ! 414: LDDFA_I	ldda	[%r10, 0x0000], %f7
	.word 0xc03a801f  ! 415: STD_R	std	%r0, [%r10 + %r31]
TH_LABEL415:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3ba987f  ! 416: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2903f  ! 417: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc842a060  ! 418: LDSW_I	ldsw	[%r10 + 0x0060], %r4
	.word 0xc83ae020  ! 419: STD_I	std	%r4, [%r11 + 0x0020]
	.word 0xc83ac01f  ! 420: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc702801f  ! 421: LDF_R	ld	[%r10, %r31], %f3
	.word 0xd1ba987f  ! 422: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 423: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd212a03e  ! 424: LDUH_I	lduh	[%r10 + 0x003e], %r9
	.word 0xc3ba98bf  ! 425: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3ba993f  ! 426: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc252c01f  ! 427: LDSH_R	ldsh	[%r11 + %r31], %r1
	.word 0xc39ae008  ! 428: LDDFA_I	ldda	[%r11, 0x0008], %f1
	.word 0xcfba987f  ! 429: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba991f  ! 430: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfba985f  ! 431: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba995f  ! 432: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba98bf  ! 433: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xccc2a058  ! 434: LDSWA_I	ldswa	[%r10, + 0x0058] %asi, %r6
	.word 0xd3ba981f  ! 435: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd03a801f  ! 436: STD_R	std	%r8, [%r10 + %r31]
	.word 0xcc5aa030  ! 437: LDX_I	ldx	[%r10 + 0x0030], %r6
	.word 0xd3bad9bf  ! 438: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 439: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd03ac01f  ! 440: STD_R	std	%r8, [%r11 + %r31]
TH_LABEL440:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd102801f  ! 441: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc692917f  ! 442: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r3
	.word 0xd3f2a01f  ! 443: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc59aa028  ! 444: LDDFA_I	ldda	[%r10, 0x0028], %f2
	.word 0xc692e078  ! 445: LDUHA_I	lduha	[%r11, + 0x0078] %asi, %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd302c01f  ! 446: LDF_R	ld	[%r11, %r31], %f9
	.word 0xcfba995f  ! 447: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2911f  ! 448: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xd0c2915f  ! 449: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r8
	.word 0xc4d2e05e  ! 450: LDSHA_I	ldsha	[%r11, + 0x005e] %asi, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5f2a01f  ! 451: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc252a008  ! 452: LDSH_I	ldsh	[%r10 + 0x0008], %r1
	.word 0xd052c01f  ! 453: LDSH_R	ldsh	[%r11 + %r31], %r8
	.word 0xc3bad85f  ! 454: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad97f  ! 455: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3bad95f  ! 456: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc41aa060  ! 457: LDD_I	ldd	[%r10 + 0x0060], %r2
	.word 0xd3ba989f  ! 458: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcf9aa020  ! 459: LDDFA_I	ldda	[%r10, 0x0020], %f7
	.word 0xcbbad85f  ! 460: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbbad89f  ! 461: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd102a048  ! 462: LDF_I	ld	[%r10, 0x0048], %f8
	.word 0xc3e2a01f  ! 463: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc6ca913f  ! 464: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r3
	.word 0xc80ac01f  ! 465: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xca12c01f  ! 466: LDUH_R	lduh	[%r11 + %r31], %r5
	.word 0xc7bad83f  ! 467: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 468: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad89f  ! 469: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad97f  ! 470: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc43ae010  ! 471: STD_I	std	%r2, [%r11 + 0x0010]
	.word 0xcc4aa01a  ! 472: LDSB_I	ldsb	[%r10 + 0x001a], %r6
	.word 0xc9e2e01f  ! 473: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d03f  ! 474: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xd19aa038  ! 475: LDDFA_I	ldda	[%r10, 0x0038], %f8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc6da907f  ! 476: LDXA_R	ldxa	[%r10, %r31] 0x83, %r3
	.word 0xc43a801f  ! 477: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba99bf  ! 478: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc79aa028  ! 479: LDDFA_I	ldda	[%r10, 0x0028], %f3
	.word 0xc7ba985f  ! 480: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc44ac01f  ! 481: LDSB_R	ldsb	[%r11 + %r31], %r2
	.word 0xcfba981f  ! 482: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc452a064  ! 483: LDSH_I	ldsh	[%r10 + 0x0064], %r2
	.word 0xc482d07f  ! 484: LDUWA_R	lduwa	[%r11, %r31] 0x83, %r2
	.word 0xc7f2a01f  ! 485: CASXA_R	casxa	[%r10]%asi, %r31, %r3
TH_LABEL485:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7ba991f  ! 486: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 487: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xd302e038  ! 488: LDF_I	ld	[%r11, 0x0038], %f9
	.word 0xccca911f  ! 489: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r6
	.word 0xcfba989f  ! 490: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc722c01f  ! 491: STF_R	st	%f3, [%r31, %r11]
	.word 0xc9baa000  ! 492: STDFA_I	stda	%f4, [0x0000, %r10]
	.word 0xcecaa075  ! 493: LDSBA_I	ldsba	[%r10, + 0x0075] %asi, %r7
	.word 0xc502c01f  ! 494: LDF_R	ld	[%r11, %r31], %f2
	.word 0xc502801f  ! 495: LDF_R	ld	[%r10, %r31], %f2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc642a040  ! 496: LDSW_I	ldsw	[%r10 + 0x0040], %r3
	.word 0xce52e07c  ! 497: LDSH_I	ldsh	[%r11 + 0x007c], %r7
	.word 0xc5e2913f  ! 498: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5ba989f  ! 499: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 500: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc99aa070  ! 501: LDDFA_I	ldda	[%r10, 0x0070], %f4
	.word 0xc4ca913f  ! 502: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r2
	.word 0xc812a038  ! 503: LDUH_I	lduh	[%r10 + 0x0038], %r4
	.word 0xcfbad97f  ! 504: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d03f  ! 505: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
TH_LABEL505:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfe2d01f  ! 506: CASA_I	casa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad9bf  ! 507: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcf02c01f  ! 508: LDF_R	ld	[%r11, %r31], %f7
	.word 0xc5ba999f  ! 509: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 510: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5ba981f  ! 511: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 512: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 513: STD_R	std	%r2, [%r10 + %r31]
	.word 0xce4aa006  ! 514: LDSB_I	ldsb	[%r10 + 0x0006], %r7
	.word 0xcc42c01f  ! 515: LDSW_R	ldsw	[%r11 + %r31], %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcadaa040  ! 516: LDXA_I	ldxa	[%r10, + 0x0040] %asi, %r5
	.word 0xc6caa04b  ! 517: LDSBA_I	ldsba	[%r10, + 0x004b] %asi, %r3
	.word 0xcc0a801f  ! 518: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xd042e05c  ! 519: LDSW_I	ldsw	[%r11 + 0x005c], %r8
	.word 0xc9bad83f  ! 520: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc41ae000  ! 521: LDD_I	ldd	[%r11 + 0x0000], %r2
	.word 0xc3baa010  ! 522: STDFA_I	stda	%f1, [0x0010, %r10]
	.word 0xc83a801f  ! 523: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba991f  ! 524: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 525: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9f2a01f  ! 526: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc7baa078  ! 527: STDFA_I	stda	%f3, [0x0078, %r10]
	.word 0xd3bae048  ! 528: STDFA_I	stda	%f9, [0x0048, %r11]
	.word 0xc7baa040  ! 529: STDFA_I	stda	%f3, [0x0040, %r10]
	.word 0xcdba997f  ! 530: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL530:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdba99bf  ! 531: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc5baa008  ! 532: STDFA_I	stda	%f2, [0x0008, %r10]
	.word 0xcdbad81f  ! 533: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc682a04c  ! 534: LDUWA_I	lduwa	[%r10, + 0x004c] %asi, %r3
	.word 0xd03a801f  ! 535: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3e2903f  ! 536: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd292a032  ! 537: LDUHA_I	lduha	[%r10, + 0x0032] %asi, %r9
	.word 0xd052801f  ! 538: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xd1bad9bf  ! 539: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc252801f  ! 540: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9e2e01f  ! 541: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2e01f  ! 542: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xccdae018  ! 543: LDXA_I	ldxa	[%r11, + 0x0018] %asi, %r6
	.word 0xc2d2917f  ! 544: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r1
	.word 0xc7ba991f  ! 545: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc43aa008  ! 546: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7ba985f  ! 547: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 548: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc522801f  ! 549: STF_R	st	%f2, [%r31, %r10]
	.word 0xd3bad97f  ! 550: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3bad95f  ! 551: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae008  ! 552: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3bad89f  ! 553: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae008  ! 554: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3e2e01f  ! 555: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc602e00c  ! 556: LDUW_I	lduw	[%r11 + 0x000c], %r3
	.word 0xd1ba991f  ! 557: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc452e052  ! 558: LDSH_I	ldsh	[%r11 + 0x0052], %r2
	.word 0xc83ae028  ! 559: STD_I	std	%r4, [%r11 + 0x0028]
	.word 0xc9bad91f  ! 560: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9bad8bf  ! 561: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 562: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad83f  ! 563: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc68aa006  ! 564: LDUBA_I	lduba	[%r10, + 0x0006] %asi, %r3
	.word 0xcde2d03f  ! 565: CASA_I	casa	[%r11] 0x81, %r31, %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xce5a801f  ! 566: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xc89ae048  ! 567: LDDA_I	ldda	[%r11, + 0x0048] %asi, %r4
	.word 0xd1e2913f  ! 568: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xc2dad11f  ! 569: LDXA_R	ldxa	[%r11, %r31] 0x88, %r1
	.word 0xc9f2901f  ! 570: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc68ae02f  ! 571: LDUBA_I	lduba	[%r11, + 0x002f] %asi, %r3
	.word 0xcdf2a01f  ! 572: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc3bae060  ! 573: STDFA_I	stda	%f1, [0x0060, %r11]
	.word 0xc7f2901f  ! 574: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba98bf  ! 575: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL575:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xccc2901f  ! 576: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r6
	.word 0xcccae05c  ! 577: LDSBA_I	ldsba	[%r11, + 0x005c] %asi, %r6
	.word 0xc83aa010  ! 578: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xcbf2911f  ! 579: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xcbba999f  ! 580: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc83a801f  ! 581: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbe2a01f  ! 582: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc25ac01f  ! 583: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xc3bad83f  ! 584: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 585: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc502a068  ! 586: LDF_I	ld	[%r10, 0x0068], %f2
	.word 0xc83aa008  ! 587: STD_I	std	%r4, [%r10 + 0x0008]
	.word 0xd04a801f  ! 588: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xc03a801f  ! 589: STD_R	std	%r0, [%r10 + %r31]
	.word 0xd0c2a028  ! 590: LDSWA_I	ldswa	[%r10, + 0x0028] %asi, %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfbad81f  ! 591: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd05a801f  ! 592: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xc5f2a01f  ! 593: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xcd02801f  ! 594: LDF_R	ld	[%r10, %r31], %f6
	.word 0xd1ba991f  ! 595: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03aa028  ! 596: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd1f2a01f  ! 597: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2913f  ! 598: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd242a048  ! 599: LDSW_I	ldsw	[%r10 + 0x0048], %r9
	.word 0xd3f2a01f  ! 600: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc402c01f  ! 601: LDUW_R	lduw	[%r11 + %r31], %r2
	.word 0xc302c01f  ! 602: LDF_R	ld	[%r11, %r31], %f1
	.word 0xc5e2a01f  ! 603: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 604: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba999f  ! 605: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcb9aa028  ! 606: LDDFA_I	ldda	[%r10, 0x0028], %f5
	.word 0xcd22c01f  ! 607: STF_R	st	%f6, [%r31, %r11]
	.word 0xcbba99bf  ! 608: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 609: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xc41aa050  ! 610: LDD_I	ldd	[%r10 + 0x0050], %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc42e01c  ! 611: LDSW_I	ldsw	[%r11 + 0x001c], %r6
	.word 0xd1bad99f  ! 612: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad99f  ! 613: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 614: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d11f  ! 615: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1bad89f  ! 616: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad9bf  ! 617: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd19aa078  ! 618: LDDFA_I	ldda	[%r10, 0x0078], %f8
	.word 0xd1bad85f  ! 619: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 620: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc41a801f  ! 621: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xca8ae01e  ! 622: LDUBA_I	lduba	[%r11, + 0x001e] %asi, %r5
	.word 0xcaca901f  ! 623: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r5
	.word 0xc9baa020  ! 624: STDFA_I	stda	%f4, [0x0020, %r10]
	.word 0xd1baa048  ! 625: STDFA_I	stda	%f8, [0x0048, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd28a901f  ! 626: LDUBA_R	lduba	[%r10, %r31] 0x80, %r9
	.word 0xcbbad81f  ! 627: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 628: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad99f  ! 629: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad99f  ! 630: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbbad99f  ! 631: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 632: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbf2d01f  ! 633: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad81f  ! 634: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad8bf  ! 635: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc83ac01f  ! 636: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad93f  ! 637: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad87f  ! 638: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad83f  ! 639: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xce12e074  ! 640: LDUH_I	lduh	[%r11 + 0x0074], %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbf2a01f  ! 641: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba981f  ! 642: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 643: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba981f  ! 644: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xce5ae050  ! 645: LDX_I	ldx	[%r11 + 0x0050], %r7
TH_LABEL645:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9ba98bf  ! 646: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc84ae015  ! 647: LDSB_I	ldsb	[%r11 + 0x0015], %r4
	.word 0xcdba993f  ! 648: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 649: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd01ae000  ! 650: LDD_I	ldd	[%r11 + 0x0000], %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc01a801f  ! 651: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xc3ba985f  ! 652: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 653: STD_R	std	%r0, [%r10 + %r31]
	.word 0xd0ca901f  ! 654: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r8
	.word 0xc3f2a01f  ! 655: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc24ac01f  ! 656: LDSB_R	ldsb	[%r11 + %r31], %r1
	.word 0xc3ba985f  ! 657: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba989f  ! 659: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2913f  ! 660: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd24ae07e  ! 661: LDSB_I	ldsb	[%r11 + 0x007e], %r9
	.word 0xc502e070  ! 662: LDF_I	ld	[%r11, 0x0070], %f2
	.word 0xcfe2901f  ! 663: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcc3a801f  ! 664: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc3a801f  ! 665: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5baa038  ! 666: STDFA_I	stda	%f2, [0x0038, %r10]
	.word 0xcfbad83f  ! 667: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad93f  ! 668: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d11f  ! 669: CASXA_I	casxa	[%r11] 0x88, %r31, %r7
	.word 0xd002a020  ! 670: LDUW_I	lduw	[%r10 + 0x0020], %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd002c01f  ! 671: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xcbba991f  ! 672: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba983f  ! 673: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc5baa020  ! 674: STDFA_I	stda	%f2, [0x0020, %r10]
	.word 0xcc8ad11f  ! 675: LDUBA_R	lduba	[%r11, %r31] 0x88, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7e2a01f  ! 676: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xd2daa068  ! 677: LDXA_I	ldxa	[%r10, + 0x0068] %asi, %r9
	.word 0xc43a801f  ! 678: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba999f  ! 679: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 680: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc702801f  ! 681: LDF_R	ld	[%r10, %r31], %f3
	.word 0xcf02c01f  ! 682: LDF_R	ld	[%r11, %r31], %f7
	.word 0xcdf2e01f  ! 683: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xcdbad99f  ! 684: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae040  ! 685: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdbad95f  ! 686: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd19aa050  ! 687: LDDFA_I	ldda	[%r10, 0x0050], %f8
	.word 0xcb22c01f  ! 688: STF_R	st	%f5, [%r31, %r11]
	.word 0xc7ba999f  ! 689: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 690: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xccd2911f  ! 691: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r6
	.word 0xce82a034  ! 692: LDUWA_I	lduwa	[%r10, + 0x0034] %asi, %r7
	.word 0xc702a068  ! 693: LDF_I	ld	[%r10, 0x0068], %f3
	.word 0xc83aa000  ! 694: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xd092a046  ! 695: LDUHA_I	lduha	[%r10, + 0x0046] %asi, %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfba997f  ! 696: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc642e034  ! 697: LDSW_I	ldsw	[%r11 + 0x0034], %r3
	.word 0xc3bad87f  ! 698: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcadae038  ! 699: LDXA_I	ldxa	[%r11, + 0x0038] %asi, %r5
	.word 0xccdad05f  ! 700: LDXA_R	ldxa	[%r11, %r31] 0x82, %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3e2903f  ! 701: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd3ba991f  ! 702: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba983f  ! 703: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcec2a01c  ! 704: LDSWA_I	ldswa	[%r10, + 0x001c] %asi, %r7
	.word 0xcbbad93f  ! 705: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd0c2a05c  ! 706: LDSWA_I	ldswa	[%r10, + 0x005c] %asi, %r8
	.word 0xc5ba99bf  ! 707: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba98bf  ! 708: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xced2a032  ! 709: LDSHA_I	ldsha	[%r10, + 0x0032] %asi, %r7
	.word 0xc3e2a01f  ! 710: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc03aa010  ! 711: STD_I	std	%r0, [%r10 + 0x0010]
	.word 0xc3ba997f  ! 712: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 713: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc45aa018  ! 714: LDX_I	ldx	[%r10 + 0x0018], %r2
	.word 0xc7baa000  ! 715: STDFA_I	stda	%f3, [0x0000, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1f2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba989f  ! 717: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba98bf  ! 718: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 719: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca5a801f  ! 720: LDX_R	ldx	[%r10 + %r31], %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5ba985f  ! 721: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2901f  ! 722: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc89ae078  ! 723: LDDA_I	ldda	[%r11, + 0x0078] %asi, %r4
	.word 0xd202e024  ! 724: LDUW_I	lduw	[%r11 + 0x0024], %r9
	.word 0xca42a018  ! 725: LDSW_I	ldsw	[%r10 + 0x0018], %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbbad83f  ! 726: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad89f  ! 727: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad87f  ! 728: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc412e060  ! 729: LDUH_I	lduh	[%r11 + 0x0060], %r2
	.word 0xd3f2a01f  ! 730: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3e2a01f  ! 731: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xcc1a801f  ! 732: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc49aa058  ! 733: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r2
	.word 0xc302a000  ! 734: LDF_I	ld	[%r10, 0x0000], %f1
	.word 0xcc3aa008  ! 735: STD_I	std	%r6, [%r10 + 0x0008]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfe2a01f  ! 736: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xca42a048  ! 737: LDSW_I	ldsw	[%r10 + 0x0048], %r5
	.word 0xc722c01f  ! 738: STF_R	st	%f3, [%r31, %r11]
	.word 0xd012c01f  ! 739: LDUH_R	lduh	[%r11 + %r31], %r8
	.word 0xd1f2901f  ! 740: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1ba99bf  ! 741: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc4c2e05c  ! 742: LDSWA_I	ldswa	[%r11, + 0x005c] %asi, %r2
	.word 0xcc8aa076  ! 743: LDUBA_I	lduba	[%r10, + 0x0076] %asi, %r6
	.word 0xc83ac01f  ! 744: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbe2d11f  ! 745: CASA_I	casa	[%r11] 0x88, %r31, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbbad91f  ! 746: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad95f  ! 747: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcf02c01f  ! 748: LDF_R	ld	[%r11, %r31], %f7
	.word 0xc3bad81f  ! 749: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd302e034  ! 750: LDF_I	ld	[%r11, 0x0034], %f9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc42801f  ! 751: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xd1f2a01f  ! 752: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2a01f  ! 753: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa000  ! 754: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xcc5a801f  ! 755: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9f2d11f  ! 756: CASXA_I	casxa	[%r11] 0x88, %r31, %r4
	.word 0xc692a05a  ! 757: LDUHA_I	lduha	[%r10, + 0x005a] %asi, %r3
	.word 0xcfbad95f  ! 758: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc502e074  ! 759: LDF_I	ld	[%r11, 0x0074], %f2
	.word 0xcdba98bf  ! 760: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdba98bf  ! 761: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2913f  ! 762: CASA_I	casa	[%r10] 0x89, %r31, %r6
	.word 0xce42801f  ! 763: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xc9e2d01f  ! 764: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc99aa050  ! 765: LDDFA_I	ldda	[%r10, 0x0050], %f4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1e2a01f  ! 766: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1e2a01f  ! 767: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 768: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc212a072  ! 769: LDUH_I	lduh	[%r10 + 0x0072], %r1
	.word 0xc9bad83f  ! 770: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9bad91f  ! 771: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd052a04e  ! 772: LDSH_I	ldsh	[%r10 + 0x004e], %r8
	.word 0xc902801f  ! 773: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc6cad07f  ! 774: LDSBA_R	ldsba	[%r11, %r31] 0x83, %r3
	.word 0xd1f2901f  ! 775: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd03aa058  ! 776: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xc3baa028  ! 777: STDFA_I	stda	%f1, [0x0028, %r10]
	.word 0xc60a801f  ! 778: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xc7ba99bf  ! 779: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 780: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7ba987f  ! 781: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 782: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 783: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba98bf  ! 784: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcbbae030  ! 785: STDFA_I	stda	%f5, [0x0030, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdbaa040  ! 786: STDFA_I	stda	%f6, [0x0040, %r10]
	.word 0xc9bad95f  ! 787: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad93f  ! 788: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 789: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcc92917f  ! 790: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r6
TH_LABEL790:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc722801f  ! 791: STF_R	st	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 792: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xccc2e078  ! 793: LDSWA_I	ldswa	[%r11, + 0x0078] %asi, %r6
	.word 0xc3e2a01f  ! 794: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xd3baa020  ! 795: STDFA_I	stda	%f9, [0x0020, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc44aa04d  ! 796: LDSB_I	ldsb	[%r10 + 0x004d], %r2
	.word 0xcfba98bf  ! 797: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 798: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc49ae050  ! 799: LDDA_I	ldda	[%r11, + 0x0050] %asi, %r2
	.word 0xc2cae019  ! 800: LDSBA_I	ldsba	[%r11, + 0x0019] %asi, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3f2d01f  ! 801: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc652801f  ! 802: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xc43ae048  ! 803: STD_I	std	%r2, [%r11 + 0x0048]
	.word 0xd0da905f  ! 804: LDXA_R	ldxa	[%r10, %r31] 0x82, %r8
	.word 0xd292a034  ! 805: LDUHA_I	lduha	[%r10, + 0x0034] %asi, %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcde2e01f  ! 806: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xd3bae068  ! 807: STDFA_I	stda	%f9, [0x0068, %r11]
	.word 0xc9f2903f  ! 808: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc9e2901f  ! 809: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9e2a01f  ! 810: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9f2a01f  ! 811: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xca12a076  ! 812: LDUH_I	lduh	[%r10 + 0x0076], %r5
	.word 0xd0d2a01a  ! 813: LDSHA_I	ldsha	[%r10, + 0x001a] %asi, %r8
	.word 0xd002801f  ! 814: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xd1bad9bf  ! 815: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1bad9bf  ! 816: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d01f  ! 817: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xc722801f  ! 818: STF_R	st	%f3, [%r31, %r10]
	.word 0xc852a020  ! 819: LDSH_I	ldsh	[%r10 + 0x0020], %r4
	.word 0xc852a01a  ! 820: LDSH_I	ldsh	[%r10 + 0x001a], %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc43aa060  ! 821: STD_I	std	%r2, [%r10 + 0x0060]
	.word 0xcc1aa028  ! 822: LDD_I	ldd	[%r10 + 0x0028], %r6
	.word 0xcac2913f  ! 823: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r5
	.word 0xc3ba99bf  ! 824: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 825: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc1ae000  ! 826: LDD_I	ldd	[%r11 + 0x0000], %r6
	.word 0xd1f2a01f  ! 827: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd2d2a020  ! 828: LDSHA_I	ldsha	[%r10, + 0x0020] %asi, %r9
	.word 0xcc3aa050  ! 829: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xcff2903f  ! 830: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfba993f  ! 831: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba999f  ! 832: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc842a040  ! 833: LDSW_I	ldsw	[%r10 + 0x0040], %r4
	.word 0xd3ba987f  ! 834: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc8caa060  ! 835: LDSBA_I	ldsba	[%r10, + 0x0060] %asi, %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc612801f  ! 836: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xd122801f  ! 837: STF_R	st	%f8, [%r31, %r10]
	.word 0xcc52801f  ! 838: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xcdbad85f  ! 839: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc252c01f  ! 840: LDSH_R	ldsh	[%r11 + %r31], %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd28ae067  ! 841: LDUBA_I	lduba	[%r11, + 0x0067] %asi, %r9
	.word 0xd1ba985f  ! 842: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd19aa070  ! 843: LDDFA_I	ldda	[%r10, 0x0070], %f8
	.word 0xcbba999f  ! 844: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc442a014  ! 845: LDSW_I	ldsw	[%r10 + 0x0014], %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3baa058  ! 846: STDFA_I	stda	%f9, [0x0058, %r10]
	.word 0xc292a07a  ! 847: LDUHA_I	lduha	[%r10, + 0x007a] %asi, %r1
	.word 0xce52801f  ! 848: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xcdba997f  ! 849: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc28ad11f  ! 850: LDUBA_R	lduba	[%r11, %r31] 0x88, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3e2d01f  ! 851: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xcad2e002  ! 852: LDSHA_I	ldsha	[%r11, + 0x0002] %asi, %r5
	.word 0xc522801f  ! 853: STF_R	st	%f2, [%r31, %r10]
	.word 0xd1e2901f  ! 854: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd322c01f  ! 855: STF_R	st	%f9, [%r31, %r11]
TH_LABEL855:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc43ae008  ! 856: STD_I	std	%r2, [%r11 + 0x0008]
	.word 0xc24a801f  ! 857: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xc3bad9bf  ! 858: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad93f  ! 859: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd082d01f  ! 860: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba981f  ! 861: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 862: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd102a018  ! 863: LDF_I	ld	[%r10, 0x0018], %f8
	.word 0xc85a801f  ! 864: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xd3ba995f  ! 865: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3ba981f  ! 866: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba993f  ! 867: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 868: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba981f  ! 869: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 870: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd212a042  ! 871: LDUH_I	lduh	[%r10 + 0x0042], %r9
	.word 0xc7ba991f  ! 872: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 873: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xd0cae023  ! 874: LDSBA_I	ldsba	[%r11, + 0x0023] %asi, %r8
	.word 0xd1ba993f  ! 875: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcf02a02c  ! 876: LDF_I	ld	[%r10, 0x002c], %f7
	.word 0xcdf2e01f  ! 877: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xccd2d17f  ! 878: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r6
	.word 0xcb9aa030  ! 879: LDDFA_I	ldda	[%r10, 0x0030], %f5
	.word 0xcc8aa00a  ! 880: LDUBA_I	lduba	[%r10, + 0x000a] %asi, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd00a801f  ! 881: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xc3ba987f  ! 882: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 883: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc302801f  ! 884: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc81a801f  ! 885: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc802801f  ! 886: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xcbbad83f  ! 887: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 888: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcd22801f  ! 889: STF_R	st	%f6, [%r31, %r10]
	.word 0xc7baa040  ! 890: STDFA_I	stda	%f3, [0x0040, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9f2901f  ! 891: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xd09aa048  ! 892: LDDA_I	ldda	[%r10, + 0x0048] %asi, %r8
	.word 0xcc9ae050  ! 893: LDDA_I	ldda	[%r11, + 0x0050] %asi, %r6
	.word 0xd1f2a01f  ! 894: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba99bf  ! 895: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xca12a016  ! 896: LDUH_I	lduh	[%r10 + 0x0016], %r5
	.word 0xc6d2a042  ! 897: LDSHA_I	ldsha	[%r10, + 0x0042] %asi, %r3
	.word 0xc8c2a060  ! 898: LDSWA_I	ldswa	[%r10, + 0x0060] %asi, %r4
	.word 0xd1ba98bf  ! 899: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc682a008  ! 900: LDUWA_I	lduwa	[%r10, + 0x0008] %asi, %r3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd19aa048  ! 901: LDDFA_I	ldda	[%r10, 0x0048], %f8
	.word 0xd082e020  ! 902: LDUWA_I	lduwa	[%r11, + 0x0020] %asi, %r8
	.word 0xc89ae038  ! 903: LDDA_I	ldda	[%r11, + 0x0038] %asi, %r4
	.word 0xcfbad97f  ! 904: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xca0a801f  ! 905: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd212801f  ! 906: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xd0ca901f  ! 907: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r8
	.word 0xc7e2913f  ! 908: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba981f  ! 909: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa030  ! 910: STD_I	std	%r2, [%r10 + 0x0030]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc99aa018  ! 911: LDDFA_I	ldda	[%r10, 0x0018], %f4
	.word 0xcbba989f  ! 912: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 913: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcb22801f  ! 914: STF_R	st	%f5, [%r31, %r10]
	.word 0xcc3ae050  ! 915: STD_I	std	%r6, [%r11 + 0x0050]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdbad97f  ! 916: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc642801f  ! 917: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xd1e2e01f  ! 918: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad83f  ! 919: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xccc2e050  ! 920: LDSWA_I	ldswa	[%r11, + 0x0050] %asi, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbba991f  ! 921: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba99bf  ! 922: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 923: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba98bf  ! 924: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa028  ! 925: STD_I	std	%r4, [%r10 + 0x0028]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbba981f  ! 926: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd01ae010  ! 927: LDD_I	ldd	[%r11 + 0x0010], %r8
	.word 0xc9ba987f  ! 928: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd302c01f  ! 929: LDF_R	ld	[%r11, %r31], %f9
	.word 0xc612801f  ! 930: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc852801f  ! 931: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xc49ae018  ! 932: LDDA_I	ldda	[%r11, + 0x0018] %asi, %r2
	.word 0xd39aa000  ! 933: LDDFA_I	ldda	[%r10, 0x0000], %f9
	.word 0xcde2d03f  ! 934: CASA_I	casa	[%r11] 0x81, %r31, %r6
	.word 0xd302e048  ! 935: LDF_I	ld	[%r11, 0x0048], %f9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5f2a01f  ! 936: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc43a801f  ! 937: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba999f  ! 938: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xca42801f  ! 939: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xcbba98bf  ! 940: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbf2a01f  ! 941: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xd092e078  ! 942: LDUHA_I	lduha	[%r11, + 0x0078] %asi, %r8
	.word 0xc702e000  ! 943: LDF_I	ld	[%r11, 0x0000], %f3
	.word 0xd3bad95f  ! 944: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2d01f  ! 945: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3bad99f  ! 946: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd102a028  ! 947: LDF_I	ld	[%r10, 0x0028], %f8
	.word 0xd1bad87f  ! 948: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd2caa010  ! 949: LDSBA_I	ldsba	[%r10, + 0x0010] %asi, %r9
	.word 0xcdba985f  ! 950: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc482a07c  ! 951: LDUWA_I	lduwa	[%r10, + 0x007c] %asi, %r2
	.word 0xc652801f  ! 952: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xc242e074  ! 953: LDSW_I	ldsw	[%r11 + 0x0074], %r1
	.word 0xcfe2903f  ! 954: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcff2911f  ! 955: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
TH_LABEL955:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfe2903f  ! 956: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcfba99bf  ! 957: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa010  ! 958: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcfba985f  ! 959: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc9baa000  ! 960: STDFA_I	stda	%f4, [0x0000, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc85ac01f  ! 961: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xd1ba995f  ! 962: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc642e004  ! 963: LDSW_I	ldsw	[%r11 + 0x0004], %r3
	.word 0xc3ba981f  ! 964: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc80aa01a  ! 965: LDUB_I	ldub	[%r10 + 0x001a], %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc1a801f  ! 966: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xcfba993f  ! 967: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa038  ! 968: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcc3aa038  ! 969: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcc3a801f  ! 970: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xca4ac01f  ! 971: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xcc4ac01f  ! 972: LDSB_R	ldsb	[%r11 + %r31], %r6
	.word 0xccc2a010  ! 973: LDSWA_I	ldswa	[%r10, + 0x0010] %asi, %r6
	.word 0xd1bad81f  ! 974: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 975: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc8aa06a  ! 976: LDUBA_I	lduba	[%r10, + 0x006a] %asi, %r6
	.word 0xd2ca901f  ! 977: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r9
	.word 0xce8aa07e  ! 978: LDUBA_I	lduba	[%r10, + 0x007e] %asi, %r7
	.word 0xd3e2a01f  ! 979: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba983f  ! 980: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd03aa058  ! 981: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3e2a01f  ! 982: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd102801f  ! 983: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc892a034  ! 984: LDUHA_I	lduha	[%r10, + 0x0034] %asi, %r4
	.word 0xd042801f  ! 985: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc802a000  ! 986: LDUW_I	lduw	[%r10 + 0x0000], %r4
	.word 0xd00aa040  ! 987: LDUB_I	ldub	[%r10 + 0x0040], %r8
	.word 0xcf9aa060  ! 988: LDDFA_I	ldda	[%r10, 0x0060], %f7
	.word 0xd0dae068  ! 989: LDXA_I	ldxa	[%r11, + 0x0068] %asi, %r8
	.word 0xc5bad87f  ! 990: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5bad8bf  ! 991: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd292917f  ! 992: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r9
	.word 0xcf22801f  ! 993: STF_R	st	%f7, [%r31, %r10]
	.word 0xc7ba999f  ! 994: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc722801f  ! 995: STF_R	st	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3f2a01f  ! 996: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd08a911f  ! 997: LDUBA_R	lduba	[%r10, %r31] 0x88, %r8
	.word 0xcfba989f  ! 998: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xccca911f  ! 999: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r6
	.word 0xc702801f  ! 1000: LDF_R	ld	[%r10, %r31], %f3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	subcc %r30, 1, %r30
	bnz  TH2_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	add	%g0,	0x1,	%r30
TH1_LOOP_START:
	.word 0xc9ba981f  ! 1: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba98bf  ! 2: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc892d07f  ! 3: LDUHA_R	lduha	[%r11, %r31] 0x83, %r4
	.word 0xc212e02e  ! 4: LDUH_I	lduh	[%r11 + 0x002e], %r1
	.word 0xc9baa058  ! 5: STDFA_I	stda	%f4, [0x0058, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc40a801f  ! 6: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xcfba983f  ! 7: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc9bae068  ! 8: STDFA_I	stda	%f4, [0x0068, %r11]
	.word 0xc7bae060  ! 9: STDFA_I	stda	%f3, [0x0060, %r11]
	.word 0xcdf2913f  ! 10: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
TH_LABEL10:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc642801f  ! 11: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc9bad81f  ! 12: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc80aa059  ! 13: LDUB_I	ldub	[%r10 + 0x0059], %r4
	.word 0xcbf2e01f  ! 14: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad99f  ! 15: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbbad9bf  ! 16: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 17: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad81f  ! 18: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad91f  ! 19: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad8bf  ! 20: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc65aa030  ! 21: LDX_I	ldx	[%r10 + 0x0030], %r3
	.word 0xc7ba991f  ! 22: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcf02a040  ! 23: LDF_I	ld	[%r10, 0x0040], %f7
	.word 0xc282917f  ! 24: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r1
	.word 0xc5f2901f  ! 25: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5f2a01f  ! 26: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc79ae050  ! 27: LDDFA_I	ldda	[%r11, 0x0050], %f3
	.word 0xc7f2901f  ! 28: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba999f  ! 29: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2911f  ! 30: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcecad15f  ! 31: LDSBA_R	ldsba	[%r11, %r31] 0x8a, %r7
	.word 0xcf02c01f  ! 32: LDF_R	ld	[%r11, %r31], %f7
	.word 0xcdba999f  ! 33: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 34: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 35: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc92915f  ! 36: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r6
	.word 0xc9ba98bf  ! 37: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 38: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2911f  ! 39: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba995f  ! 40: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc302801f  ! 41: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc7f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7e2a01f  ! 43: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xd39aa020  ! 44: LDDFA_I	ldda	[%r10, 0x0020], %f9
	.word 0xd25a801f  ! 45: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc8da913f  ! 46: LDXA_R	ldxa	[%r10, %r31] 0x89, %r4
	.word 0xcfe2903f  ! 47: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcfe2a01f  ! 48: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba999f  ! 49: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca82d15f  ! 50: LDUWA_R	lduwa	[%r11, %r31] 0x8a, %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3bad95f  ! 51: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad87f  ! 52: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad85f  ! 53: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc482a014  ! 54: LDUWA_I	lduwa	[%r10, + 0x0014] %asi, %r2
	.word 0xc81ae068  ! 55: LDD_I	ldd	[%r11 + 0x0068], %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7bad97f  ! 56: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad9bf  ! 57: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc642c01f  ! 58: LDSW_R	ldsw	[%r11 + %r31], %r3
	.word 0xcacaa06c  ! 59: LDSBA_I	ldsba	[%r10, + 0x006c] %asi, %r5
	.word 0xc702c01f  ! 60: LDF_R	ld	[%r11, %r31], %f3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3ba99bf  ! 61: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc4daa020  ! 62: LDXA_I	ldxa	[%r10, + 0x0020] %asi, %r2
	.word 0xcc3ae060  ! 63: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xc6dad15f  ! 64: LDXA_R	ldxa	[%r11, %r31] 0x8a, %r3
	.word 0xc5f2901f  ! 65: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5ba98bf  ! 66: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba99bf  ! 67: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc48aa05b  ! 68: LDUBA_I	lduba	[%r10, + 0x005b] %asi, %r2
	.word 0xc7f2a01f  ! 69: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba99bf  ! 70: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7e2901f  ! 71: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba999f  ! 72: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 73: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 74: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcc8aa06d  ! 75: LDUBA_I	lduba	[%r10, + 0x006d] %asi, %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc43ae000  ! 76: STD_I	std	%r2, [%r11 + 0x0000]
	.word 0xc5f2d01f  ! 77: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc5f2e01f  ! 78: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc43ac01f  ! 79: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc49aa050  ! 80: LDDA_I	ldda	[%r10, + 0x0050] %asi, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc03ae000  ! 81: STD_I	std	%r0, [%r11 + 0x0000]
	.word 0xca0ae06e  ! 82: LDUB_I	ldub	[%r11 + 0x006e], %r5
	.word 0xc83a801f  ! 83: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc682913f  ! 84: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r3
	.word 0xcbba983f  ! 85: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbf2901f  ! 86: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xc6dad13f  ! 87: LDXA_R	ldxa	[%r11, %r31] 0x89, %r3
	.word 0xc922801f  ! 88: STF_R	st	%f4, [%r31, %r10]
	.word 0xd25ac01f  ! 89: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xc3e2901f  ! 90: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc03a801f  ! 91: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3ba99bf  ! 92: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 93: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc68ad17f  ! 94: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r3
	.word 0xce12a068  ! 95: LDUH_I	lduh	[%r10 + 0x0068], %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc41ac01f  ! 96: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xca4a801f  ! 97: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xc43ae050  ! 98: STD_I	std	%r2, [%r11 + 0x0050]
	.word 0xc43ae050  ! 99: STD_I	std	%r2, [%r11 + 0x0050]
	.word 0xd0d2911f  ! 100: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc602c01f  ! 101: LDUW_R	lduw	[%r11 + %r31], %r3
	.word 0xd082a070  ! 102: LDUWA_I	lduwa	[%r10, + 0x0070] %asi, %r8
	.word 0xc3f2903f  ! 103: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc3e2a01f  ! 104: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba981f  ! 105: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3e2a01f  ! 106: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba99bf  ! 107: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 108: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba99bf  ! 109: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba983f  ! 110: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcd02a05c  ! 111: LDF_I	ld	[%r10, 0x005c], %f6
	.word 0xc43ae038  ! 112: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xc43ac01f  ! 113: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae038  ! 114: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xc43ae038  ! 115: STD_I	std	%r2, [%r11 + 0x0038]
TH_LABEL115:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc0ae01d  ! 116: LDUB_I	ldub	[%r11 + 0x001d], %r6
	.word 0xd1ba983f  ! 117: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 118: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xce8ae01b  ! 119: LDUBA_I	lduba	[%r11, + 0x001b] %asi, %r7
	.word 0xc9baa048  ! 120: STDFA_I	stda	%f4, [0x0048, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9f2901f  ! 121: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2901f  ! 122: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba997f  ! 123: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2903f  ! 124: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc9f2901f  ! 125: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9ba991f  ! 126: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 127: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc42c01f  ! 128: LDSW_R	ldsw	[%r11 + %r31], %r6
	.word 0xc9e2e01f  ! 129: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xd19ae040  ! 130: LDDFA_I	ldda	[%r11, 0x0040], %f8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfe2a01f  ! 131: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc88aa03b  ! 132: LDUBA_I	lduba	[%r10, + 0x003b] %asi, %r4
	.word 0xcc3aa028  ! 133: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xcc3a801f  ! 134: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc9ae058  ! 135: LDDA_I	ldda	[%r11, + 0x0058] %asi, %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3f2e01f  ! 136: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xca12801f  ! 137: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xcdba997f  ! 138: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba997f  ! 139: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 140: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd25ac01f  ! 141: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xcbba98bf  ! 142: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2913f  ! 143: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xcbba985f  ! 144: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba983f  ! 145: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbf2a01f  ! 146: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xc652e048  ! 147: LDSH_I	ldsh	[%r11 + 0x0048], %r3
	.word 0xc202801f  ! 148: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xcdba991f  ! 149: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 150: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd102e01c  ! 151: LDF_I	ld	[%r11, 0x001c], %f8
	.word 0xca8ad15f  ! 152: LDUBA_R	lduba	[%r11, %r31] 0x8a, %r5
	.word 0xc302e048  ! 153: LDF_I	ld	[%r11, 0x0048], %f1
	.word 0xcf9aa038  ! 154: LDDFA_I	ldda	[%r10, 0x0038], %f7
	.word 0xc3ba99bf  ! 155: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc03a801f  ! 156: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3f2913f  ! 157: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xc3f2901f  ! 158: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba985f  ! 159: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcf02e058  ! 160: LDF_I	ld	[%r11, 0x0058], %f7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd01a801f  ! 161: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xc3bae050  ! 162: STDFA_I	stda	%f1, [0x0050, %r11]
	.word 0xcb02a018  ! 163: LDF_I	ld	[%r10, 0x0018], %f5
	.word 0xd2d2a070  ! 164: LDSHA_I	ldsha	[%r10, + 0x0070] %asi, %r9
	.word 0xd24ac01f  ! 165: LDSB_R	ldsb	[%r11 + %r31], %r9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3ba991f  ! 166: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 167: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xd00a801f  ! 168: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xc522c01f  ! 169: STF_R	st	%f2, [%r31, %r11]
	.word 0xd1f2901f  ! 170: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd03aa028  ! 171: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd03a801f  ! 172: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba995f  ! 173: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 174: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 175: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1f2a01f  ! 176: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2913f  ! 177: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xc842a074  ! 178: LDSW_I	ldsw	[%r10 + 0x0074], %r4
	.word 0xcbe2d13f  ! 179: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xc88a913f  ! 180: LDUBA_R	lduba	[%r10, %r31] 0x89, %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbe2a01f  ! 181: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc83a801f  ! 182: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba991f  ! 183: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2901f  ! 184: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xd39aa048  ! 185: LDDFA_I	ldda	[%r10, 0x0048], %f9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd302a010  ! 186: LDF_I	ld	[%r10, 0x0010], %f9
	.word 0xd1bad99f  ! 187: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae060  ! 188: STD_I	std	%r8, [%r11 + 0x0060]
	.word 0xce02801f  ! 189: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xd1bad85f  ! 190: STDFA_R	stda	%f8, [%r31, %r11]
TH_LABEL190:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1bad91f  ! 191: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 192: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xce12e028  ! 193: LDUH_I	lduh	[%r11 + 0x0028], %r7
	.word 0xc842801f  ! 194: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xc9ba993f  ! 195: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9ba98bf  ! 196: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba99bf  ! 197: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 198: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 199: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2901f  ! 200: CASA_I	casa	[%r10] 0x80, %r31, %r4
TH_LABEL200:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc2d2e00a  ! 201: LDSHA_I	ldsha	[%r11, + 0x000a] %asi, %r1
	.word 0xd1ba993f  ! 202: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca92e050  ! 203: LDUHA_I	lduha	[%r11, + 0x0050] %asi, %r5
	.word 0xc5bad85f  ! 204: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 205: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5e2d13f  ! 206: CASA_I	casa	[%r11] 0x89, %r31, %r2
	.word 0xd1baa040  ! 207: STDFA_I	stda	%f8, [0x0040, %r10]
	.word 0xc9ba985f  ! 208: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc59aa058  ! 209: LDDFA_I	ldda	[%r10, 0x0058], %f2
	.word 0xc88a911f  ! 210: LDUBA_R	lduba	[%r10, %r31] 0x88, %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5ba989f  ! 211: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 212: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc92917f  ! 213: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r6
	.word 0xc7ba981f  ! 214: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc922801f  ! 215: STF_R	st	%f4, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3ba983f  ! 216: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd0c2917f  ! 217: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r8
	.word 0xcde2913f  ! 218: CASA_I	casa	[%r10] 0x89, %r31, %r6
	.word 0xcdba999f  ! 219: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2913f  ! 220: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdba989f  ! 221: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 222: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2901f  ! 223: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xd39aa070  ! 224: LDDFA_I	ldda	[%r10, 0x0070], %f9
	.word 0xcc12c01f  ! 225: LDUH_R	lduh	[%r11 + %r31], %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc902a034  ! 226: LDF_I	ld	[%r10, 0x0034], %f4
	.word 0xcec2a01c  ! 227: LDSWA_I	ldswa	[%r10, + 0x001c] %asi, %r7
	.word 0xca82901f  ! 228: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r5
	.word 0xd09ae020  ! 229: LDDA_I	ldda	[%r11, + 0x0020] %asi, %r8
	.word 0xc5bae078  ! 230: STDFA_I	stda	%f2, [0x0078, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcec2d15f  ! 231: LDSWA_R	ldswa	[%r11, %r31] 0x8a, %r7
	.word 0xc8da905f  ! 232: LDXA_R	ldxa	[%r10, %r31] 0x82, %r4
	.word 0xd01ae038  ! 233: LDD_I	ldd	[%r11 + 0x0038], %r8
	.word 0xc41a801f  ! 234: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc9f2903f  ! 235: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9ba987f  ! 236: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba98bf  ! 237: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 238: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2a01f  ! 239: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2a01f  ! 240: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd102801f  ! 241: LDF_R	ld	[%r10, %r31], %f8
	.word 0xcfe2a01f  ! 242: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcc52c01f  ! 243: LDSH_R	ldsh	[%r11 + %r31], %r6
	.word 0xc4c2907f  ! 244: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r2
	.word 0xc252801f  ! 245: LDSH_R	ldsh	[%r10 + %r31], %r1
TH_LABEL245:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7ba987f  ! 246: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba995f  ! 247: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 248: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 249: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 250: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7f2901f  ! 251: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7f2a01f  ! 252: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba997f  ! 253: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 254: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba995f  ! 255: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL255:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7bae028  ! 256: STDFA_I	stda	%f3, [0x0028, %r11]
	.word 0xcccaa04d  ! 257: LDSBA_I	ldsba	[%r10, + 0x004d] %asi, %r6
	.word 0xcac2a040  ! 258: LDSWA_I	ldswa	[%r10, + 0x0040] %asi, %r5
	.word 0xc28ae019  ! 259: LDUBA_I	lduba	[%r11, + 0x0019] %asi, %r1
	.word 0xcc92907f  ! 260: LDUHA_R	lduha	[%r10, %r31] 0x83, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcfba985f  ! 261: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba991f  ! 262: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2903f  ! 263: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcfba989f  ! 264: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd212a024  ! 265: LDUH_I	lduh	[%r10 + 0x0024], %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd03aa068  ! 266: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xd3e2a01f  ! 267: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xcecaa048  ! 268: LDSBA_I	ldsba	[%r10, + 0x0048] %asi, %r7
	.word 0xcdf2913f  ! 269: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xca42801f  ! 270: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc8d2e052  ! 271: LDSHA_I	ldsha	[%r11, + 0x0052] %asi, %r4
	.word 0xcc3a801f  ! 272: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc8cad01f  ! 273: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r4
	.word 0xc3e2d11f  ! 274: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xc3bad97f  ! 275: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc48aa005  ! 276: LDUBA_I	lduba	[%r10, + 0x0005] %asi, %r2
	.word 0xd2d2d11f  ! 277: LDSHA_R	ldsha	[%r11, %r31] 0x88, %r9
	.word 0xd212c01f  ! 278: LDUH_R	lduh	[%r11 + %r31], %r9
	.word 0xc5e2901f  ! 279: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba985f  ! 280: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc722801f  ! 281: STF_R	st	%f3, [%r31, %r10]
	.word 0xd3ba981f  ! 282: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc212801f  ! 283: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xc43ac01f  ! 284: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 285: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcd9aa030  ! 286: LDDFA_I	ldda	[%r10, 0x0030], %f6
	.word 0xca92d13f  ! 287: LDUHA_R	lduha	[%r11, %r31] 0x89, %r5
	.word 0xd00ac01f  ! 288: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xc502a050  ! 289: LDF_I	ld	[%r10, 0x0050], %f2
	.word 0xd03a801f  ! 290: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3ba983f  ! 291: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 292: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc28ad17f  ! 293: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r1
	.word 0xcbf2e01f  ! 294: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xc702a064  ! 295: LDF_I	ld	[%r10, 0x0064], %f3
TH_LABEL295:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xceda911f  ! 296: LDXA_R	ldxa	[%r10, %r31] 0x88, %r7
	.word 0xcbba983f  ! 297: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 298: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 299: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba983f  ! 300: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbba987f  ! 301: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd012801f  ! 302: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xc5ba995f  ! 303: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 304: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba991f  ! 305: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5e2911f  ! 306: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc68a905f  ! 307: LDUBA_R	lduba	[%r10, %r31] 0x82, %r3
	.word 0xca02801f  ! 308: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xcdba987f  ! 309: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 310: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdf2a01f  ! 311: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba993f  ! 312: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba98bf  ! 313: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba997f  ! 314: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba997f  ! 315: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcde2a01f  ! 316: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba991f  ! 317: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2911f  ! 318: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcc52801f  ! 319: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xc7ba98bf  ! 320: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7ba981f  ! 321: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 322: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba985f  ! 323: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba985f  ! 324: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcec2d03f  ! 325: LDSWA_R	ldswa	[%r11, %r31] 0x81, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc2c2a050  ! 326: LDSWA_I	ldswa	[%r10, + 0x0050] %asi, %r1
	.word 0xd3f2d11f  ! 327: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xd102801f  ! 328: LDF_R	ld	[%r10, %r31], %f8
	.word 0xcd9aa050  ! 329: LDDFA_I	ldda	[%r10, 0x0050], %f6
	.word 0xd28aa043  ! 330: LDUBA_I	lduba	[%r10, + 0x0043] %asi, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9e2913f  ! 331: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba989f  ! 332: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc6d2a04a  ! 333: LDSHA_I	ldsha	[%r10, + 0x004a] %asi, %r3
	.word 0xc922801f  ! 334: STF_R	st	%f4, [%r31, %r10]
	.word 0xc81aa020  ! 335: LDD_I	ldd	[%r10 + 0x0020], %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc2c2a07c  ! 336: LDSWA_I	ldswa	[%r10, + 0x007c] %asi, %r1
	.word 0xd1ba981f  ! 337: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 338: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 339: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba991f  ! 340: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc2d2e060  ! 341: LDSHA_I	ldsha	[%r11, + 0x0060] %asi, %r1
	.word 0xcfbad81f  ! 342: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc85a801f  ! 343: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xc842e004  ! 344: LDSW_I	ldsw	[%r11 + 0x0004], %r4
	.word 0xc3f2e01f  ! 345: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3bad85f  ! 346: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc6c2e038  ! 347: LDSWA_I	ldswa	[%r11, + 0x0038] %asi, %r3
	.word 0xc03ac01f  ! 348: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad93f  ! 349: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d11f  ! 350: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc212e014  ! 351: LDUH_I	lduh	[%r11 + 0x0014], %r1
	.word 0xc642c01f  ! 352: LDSW_R	ldsw	[%r11 + %r31], %r3
	.word 0xcfbad83f  ! 353: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ae030  ! 354: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcff2d11f  ! 355: CASXA_I	casxa	[%r11] 0x88, %r31, %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc3ae030  ! 356: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcfbad85f  ! 357: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2e01f  ! 358: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcfbad8bf  ! 359: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad89f  ! 360: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc842801f  ! 361: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xd03aa030  ! 362: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xc20a801f  ! 363: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xc3ba981f  ! 364: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcc5a801f  ! 365: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3ba989f  ! 366: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 367: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcfbae048  ! 368: STDFA_I	stda	%f7, [0x0048, %r11]
	.word 0xd1e2913f  ! 369: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xd1ba99bf  ! 370: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1e2911f  ! 371: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xd1ba981f  ! 372: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 373: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa010  ! 374: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1ba981f  ! 375: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd202801f  ! 376: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xcbbad85f  ! 377: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d11f  ! 378: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xcbe2e01f  ! 379: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbf2d13f  ! 380: CASXA_I	casxa	[%r11] 0x89, %r31, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc702c01f  ! 381: LDF_R	ld	[%r11, %r31], %f3
	.word 0xd1ba987f  ! 382: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 383: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2901f  ! 384: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xc5baa070  ! 385: STDFA_I	stda	%f2, [0x0070, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7baa068  ! 386: STDFA_I	stda	%f3, [0x0068, %r10]
	.word 0xcff2a01f  ! 387: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc65ac01f  ! 388: LDX_R	ldx	[%r11 + %r31], %r3
	.word 0xc3baa068  ! 389: STDFA_I	stda	%f1, [0x0068, %r10]
	.word 0xc43a801f  ! 390: STD_R	std	%r2, [%r10 + %r31]
TH_LABEL390:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd282a044  ! 391: LDUWA_I	lduwa	[%r10, + 0x0044] %asi, %r9
	.word 0xd3bad97f  ! 392: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 393: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xc252a020  ! 394: LDSH_I	ldsh	[%r10 + 0x0020], %r1
	.word 0xc9ba983f  ! 395: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9ba981f  ! 396: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 397: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc4d2905f  ! 398: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r2
	.word 0xce12c01f  ! 399: LDUH_R	lduh	[%r11 + %r31], %r7
	.word 0xd1baa038  ! 400: STDFA_I	stda	%f8, [0x0038, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdbad89f  ! 401: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad81f  ! 402: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad87f  ! 403: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 404: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcc3ae050  ! 405: STD_I	std	%r6, [%r11 + 0x0050]
TH_LABEL405:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc3ac01f  ! 406: STD_R	std	%r6, [%r11 + %r31]
	.word 0xc602a07c  ! 407: LDUW_I	lduw	[%r10 + 0x007c], %r3
	.word 0xc7e2d03f  ! 408: CASA_I	casa	[%r11] 0x81, %r31, %r3
	.word 0xc7bad9bf  ! 409: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad9bf  ! 410: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7e2e01f  ! 411: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc7bad81f  ! 412: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc882a04c  ! 413: LDUWA_I	lduwa	[%r10, + 0x004c] %asi, %r4
	.word 0xcb9aa048  ! 414: LDDFA_I	ldda	[%r10, 0x0048], %f5
	.word 0xc03a801f  ! 415: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3ba981f  ! 416: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 417: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xca42e070  ! 418: LDSW_I	ldsw	[%r11 + 0x0070], %r5
	.word 0xc83ae020  ! 419: STD_I	std	%r4, [%r11 + 0x0020]
	.word 0xc83ac01f  ! 420: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd302c01f  ! 421: LDF_R	ld	[%r11, %r31], %f9
	.word 0xd1ba993f  ! 422: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 423: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca12a02c  ! 424: LDUH_I	lduh	[%r10 + 0x002c], %r5
	.word 0xc3ba985f  ! 425: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3ba987f  ! 426: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xce52801f  ! 427: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xd19ae020  ! 428: LDDFA_I	ldda	[%r11, 0x0020], %f8
	.word 0xcfba985f  ! 429: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba999f  ! 430: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfba981f  ! 431: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba989f  ! 432: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba999f  ! 433: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc6c2a008  ! 434: LDSWA_I	ldswa	[%r10, + 0x0008] %asi, %r3
	.word 0xd3ba987f  ! 435: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd03a801f  ! 436: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc45ae048  ! 437: LDX_I	ldx	[%r11 + 0x0048], %r2
	.word 0xd3bad8bf  ! 438: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 439: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd03ac01f  ! 440: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc902c01f  ! 441: LDF_R	ld	[%r11, %r31], %f4
	.word 0xd092901f  ! 442: LDUHA_R	lduha	[%r10, %r31] 0x80, %r8
	.word 0xd3f2a01f  ! 443: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc39ae068  ! 444: LDDFA_I	ldda	[%r11, 0x0068], %f1
	.word 0xc492a06a  ! 445: LDUHA_I	lduha	[%r10, + 0x006a] %asi, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc702c01f  ! 446: LDF_R	ld	[%r11, %r31], %f3
	.word 0xcfba995f  ! 447: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 448: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xc2c2915f  ! 449: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r1
	.word 0xd2d2a07c  ! 450: LDSHA_I	ldsha	[%r10, + 0x007c] %asi, %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5f2a01f  ! 451: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xce52e07c  ! 452: LDSH_I	ldsh	[%r11 + 0x007c], %r7
	.word 0xc852801f  ! 453: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xc3bad87f  ! 454: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad81f  ! 455: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3bad85f  ! 456: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcc1aa030  ! 457: LDD_I	ldd	[%r10 + 0x0030], %r6
	.word 0xd3ba981f  ! 458: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd19aa058  ! 459: LDDFA_I	ldda	[%r10, 0x0058], %f8
	.word 0xcbbad97f  ! 460: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbbad95f  ! 461: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd102e000  ! 462: LDF_I	ld	[%r11, 0x0000], %f8
	.word 0xc3e2a01f  ! 463: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc2ca901f  ! 464: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r1
	.word 0xce0a801f  ! 465: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xce12801f  ! 466: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xc7bad81f  ! 467: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 468: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad95f  ! 469: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad8bf  ! 470: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc43ae010  ! 471: STD_I	std	%r2, [%r11 + 0x0010]
	.word 0xd24ae04b  ! 472: LDSB_I	ldsb	[%r11 + 0x004b], %r9
	.word 0xc9e2e01f  ! 473: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d13f  ! 474: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xcb9aa020  ! 475: LDDFA_I	ldda	[%r10, 0x0020], %f5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xccdad13f  ! 476: LDXA_R	ldxa	[%r11, %r31] 0x89, %r6
	.word 0xc43a801f  ! 477: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba993f  ! 478: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcb9aa040  ! 479: LDDFA_I	ldda	[%r10, 0x0040], %f5
	.word 0xc7ba995f  ! 480: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc4ac01f  ! 481: LDSB_R	ldsb	[%r11 + %r31], %r6
	.word 0xcfba985f  ! 482: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc252a010  ! 483: LDSH_I	ldsh	[%r10 + 0x0010], %r1
	.word 0xc282915f  ! 484: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r1
	.word 0xc7f2a01f  ! 485: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7ba997f  ! 486: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 487: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xcb02a070  ! 488: LDF_I	ld	[%r10, 0x0070], %f5
	.word 0xc2cad07f  ! 489: LDSBA_R	ldsba	[%r11, %r31] 0x83, %r1
	.word 0xcfba989f  ! 490: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcb22801f  ! 491: STF_R	st	%f5, [%r31, %r10]
	.word 0xcdbaa048  ! 492: STDFA_I	stda	%f6, [0x0048, %r10]
	.word 0xcccaa05c  ! 493: LDSBA_I	ldsba	[%r10, + 0x005c] %asi, %r6
	.word 0xcf02c01f  ! 494: LDF_R	ld	[%r11, %r31], %f7
	.word 0xc302801f  ! 495: LDF_R	ld	[%r10, %r31], %f1
TH_LABEL495:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc42a060  ! 496: LDSW_I	ldsw	[%r10 + 0x0060], %r6
	.word 0xc652a064  ! 497: LDSH_I	ldsh	[%r10 + 0x0064], %r3
	.word 0xc5e2901f  ! 498: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba997f  ! 499: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba983f  ! 500: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL500:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc59aa000  ! 501: LDDFA_I	ldda	[%r10, 0x0000], %f2
	.word 0xcccad15f  ! 502: LDSBA_R	ldsba	[%r11, %r31] 0x8a, %r6
	.word 0xd212a070  ! 503: LDUH_I	lduh	[%r10 + 0x0070], %r9
	.word 0xcfbad99f  ! 504: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d03f  ! 505: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfe2d11f  ! 506: CASA_I	casa	[%r11] 0x88, %r31, %r7
	.word 0xcfbad83f  ! 507: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc302801f  ! 508: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc5ba991f  ! 509: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 510: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5ba997f  ! 511: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 512: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 513: STD_R	std	%r2, [%r10 + %r31]
	.word 0xca4ae067  ! 514: LDSB_I	ldsb	[%r11 + 0x0067], %r5
	.word 0xc242801f  ! 515: LDSW_R	ldsw	[%r10 + %r31], %r1
TH_LABEL515:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc2daa040  ! 516: LDXA_I	ldxa	[%r10, + 0x0040] %asi, %r1
	.word 0xc8caa066  ! 517: LDSBA_I	ldsba	[%r10, + 0x0066] %asi, %r4
	.word 0xcc0ac01f  ! 518: LDUB_R	ldub	[%r11 + %r31], %r6
	.word 0xcc42a004  ! 519: LDSW_I	ldsw	[%r10 + 0x0004], %r6
	.word 0xc9bad83f  ! 520: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc1aa008  ! 521: LDD_I	ldd	[%r10 + 0x0008], %r6
	.word 0xd3baa058  ! 522: STDFA_I	stda	%f9, [0x0058, %r10]
	.word 0xc83a801f  ! 523: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba981f  ! 524: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 525: CASA_R	casa	[%r10] %asi, %r31, %r4
TH_LABEL525:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9f2a01f  ! 526: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc3bae010  ! 527: STDFA_I	stda	%f1, [0x0010, %r11]
	.word 0xd3baa030  ! 528: STDFA_I	stda	%f9, [0x0030, %r10]
	.word 0xd1baa040  ! 529: STDFA_I	stda	%f8, [0x0040, %r10]
	.word 0xcdba995f  ! 530: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdba999f  ! 531: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd3baa060  ! 532: STDFA_I	stda	%f9, [0x0060, %r10]
	.word 0xcdbad95f  ! 533: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd082a05c  ! 534: LDUWA_I	lduwa	[%r10, + 0x005c] %asi, %r8
	.word 0xd03a801f  ! 535: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3e2901f  ! 536: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd092a07e  ! 537: LDUHA_I	lduha	[%r10, + 0x007e] %asi, %r8
	.word 0xc852c01f  ! 538: LDSH_R	ldsh	[%r11 + %r31], %r4
	.word 0xd1bad81f  ! 539: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc452c01f  ! 540: LDSH_R	ldsh	[%r11 + %r31], %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9e2e01f  ! 541: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2e01f  ! 542: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xccdaa060  ! 543: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r6
	.word 0xccd2903f  ! 544: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r6
	.word 0xc7ba987f  ! 545: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc43aa008  ! 546: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7ba983f  ! 547: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 548: STD_R	std	%r2, [%r10 + %r31]
	.word 0xcb22801f  ! 549: STF_R	st	%f5, [%r31, %r10]
	.word 0xd3bad83f  ! 550: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3bad81f  ! 551: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae008  ! 552: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3bad8bf  ! 553: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae008  ! 554: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3e2e01f  ! 555: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc02e008  ! 556: LDUW_I	lduw	[%r11 + 0x0008], %r6
	.word 0xd1ba993f  ! 557: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc652e04c  ! 558: LDSH_I	ldsh	[%r11 + 0x004c], %r3
	.word 0xc83ae028  ! 559: STD_I	std	%r4, [%r11 + 0x0028]
	.word 0xc9bad8bf  ! 560: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9bad9bf  ! 561: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 562: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad89f  ! 563: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd08aa073  ! 564: LDUBA_I	lduba	[%r10, + 0x0073] %asi, %r8
	.word 0xcde2d13f  ! 565: CASA_I	casa	[%r11] 0x89, %r31, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xce5a801f  ! 566: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xc49aa010  ! 567: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r2
	.word 0xd1e2913f  ! 568: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xc8da917f  ! 569: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r4
	.word 0xc9f2913f  ! 570: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd28aa052  ! 571: LDUBA_I	lduba	[%r10, + 0x0052] %asi, %r9
	.word 0xcdf2a01f  ! 572: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd1bae060  ! 573: STDFA_I	stda	%f8, [0x0060, %r11]
	.word 0xc7f2903f  ! 574: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba981f  ! 575: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd0c2d17f  ! 576: LDSWA_R	ldswa	[%r11, %r31] 0x8b, %r8
	.word 0xcacaa07f  ! 577: LDSBA_I	ldsba	[%r10, + 0x007f] %asi, %r5
	.word 0xc83aa010  ! 578: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xcbf2901f  ! 579: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbba995f  ! 580: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc83a801f  ! 581: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbe2a01f  ! 582: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xd25a801f  ! 583: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xc3bad87f  ! 584: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 585: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd102a078  ! 586: LDF_I	ld	[%r10, 0x0078], %f8
	.word 0xc83aa008  ! 587: STD_I	std	%r4, [%r10 + 0x0008]
	.word 0xc24ac01f  ! 588: LDSB_R	ldsb	[%r11 + %r31], %r1
	.word 0xc03a801f  ! 589: STD_R	std	%r0, [%r10 + %r31]
	.word 0xd2c2e03c  ! 590: LDSWA_I	ldswa	[%r11, + 0x003c] %asi, %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfbad81f  ! 591: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc65a801f  ! 592: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xc5f2a01f  ! 593: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc502801f  ! 594: LDF_R	ld	[%r10, %r31], %f2
	.word 0xd1ba981f  ! 595: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd03aa028  ! 596: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd1f2a01f  ! 597: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2913f  ! 598: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd242a078  ! 599: LDSW_I	ldsw	[%r10 + 0x0078], %r9
	.word 0xd3f2a01f  ! 600: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd202801f  ! 601: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xc902c01f  ! 602: LDF_R	ld	[%r11, %r31], %f4
	.word 0xc5e2a01f  ! 603: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 604: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba993f  ! 605: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc99aa008  ! 606: LDDFA_I	ldda	[%r10, 0x0008], %f4
	.word 0xcf22801f  ! 607: STF_R	st	%f7, [%r31, %r10]
	.word 0xcbba991f  ! 608: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 609: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xd01aa038  ! 610: LDD_I	ldd	[%r10 + 0x0038], %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc642a004  ! 611: LDSW_I	ldsw	[%r10 + 0x0004], %r3
	.word 0xd1bad81f  ! 612: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad99f  ! 613: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad87f  ! 614: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d11f  ! 615: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1bad8bf  ! 616: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad87f  ! 617: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc79aa000  ! 618: LDDFA_I	ldda	[%r10, 0x0000], %f3
	.word 0xd1bad85f  ! 619: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 620: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc81a801f  ! 621: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xce8ae040  ! 622: LDUBA_I	lduba	[%r11, + 0x0040] %asi, %r7
	.word 0xd2ca917f  ! 623: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r9
	.word 0xd3baa048  ! 624: STDFA_I	stda	%f9, [0x0048, %r10]
	.word 0xc7bae060  ! 625: STDFA_I	stda	%f3, [0x0060, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc28ad11f  ! 626: LDUBA_R	lduba	[%r11, %r31] 0x88, %r1
	.word 0xcbbad95f  ! 627: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad97f  ! 628: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad83f  ! 629: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad87f  ! 630: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbbad93f  ! 631: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 632: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbf2d01f  ! 633: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad81f  ! 634: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad97f  ! 635: STDFA_R	stda	%f5, [%r31, %r11]
TH_LABEL635:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc83ac01f  ! 636: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad97f  ! 637: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad83f  ! 638: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad85f  ! 639: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc412e00c  ! 640: LDUH_I	lduh	[%r11 + 0x000c], %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbf2a01f  ! 641: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba981f  ! 642: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 643: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba989f  ! 644: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcc5ae050  ! 645: LDX_I	ldx	[%r11 + 0x0050], %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9ba991f  ! 646: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc24aa030  ! 647: LDSB_I	ldsb	[%r10 + 0x0030], %r1
	.word 0xcdba981f  ! 648: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba98bf  ! 649: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc41aa020  ! 650: LDD_I	ldd	[%r10 + 0x0020], %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc81ac01f  ! 651: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xc3ba987f  ! 652: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 653: STD_R	std	%r0, [%r10 + %r31]
	.word 0xceca905f  ! 654: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r7
	.word 0xc3f2a01f  ! 655: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc84a801f  ! 656: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xc3ba987f  ! 657: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba987f  ! 659: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2913f  ! 660: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd24aa044  ! 661: LDSB_I	ldsb	[%r10 + 0x0044], %r9
	.word 0xcd02e058  ! 662: LDF_I	ld	[%r11, 0x0058], %f6
	.word 0xcfe2903f  ! 663: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcc3a801f  ! 664: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc3a801f  ! 665: STD_R	std	%r6, [%r10 + %r31]
TH_LABEL665:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3baa050  ! 666: STDFA_I	stda	%f9, [0x0050, %r10]
	.word 0xcfbad83f  ! 667: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad93f  ! 668: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d03f  ! 669: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xce02a04c  ! 670: LDUW_I	lduw	[%r10 + 0x004c], %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc02801f  ! 671: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xcbba99bf  ! 672: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba999f  ! 673: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc7baa038  ! 674: STDFA_I	stda	%f3, [0x0038, %r10]
	.word 0xc68ad15f  ! 675: LDUBA_R	lduba	[%r11, %r31] 0x8a, %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7e2a01f  ! 676: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xccdae030  ! 677: LDXA_I	ldxa	[%r11, + 0x0030] %asi, %r6
	.word 0xc43a801f  ! 678: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba99bf  ! 679: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba995f  ! 680: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd102801f  ! 681: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc302801f  ! 682: LDF_R	ld	[%r10, %r31], %f1
	.word 0xcdf2e01f  ! 683: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xcdbad9bf  ! 684: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae040  ! 685: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdbad91f  ! 686: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd39ae030  ! 687: LDDFA_I	ldda	[%r11, 0x0030], %f9
	.word 0xc522801f  ! 688: STF_R	st	%f2, [%r31, %r10]
	.word 0xc7ba993f  ! 689: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 690: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xced2903f  ! 691: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r7
	.word 0xd282a07c  ! 692: LDUWA_I	lduwa	[%r10, + 0x007c] %asi, %r9
	.word 0xd302a010  ! 693: LDF_I	ld	[%r10, 0x0010], %f9
	.word 0xc83aa000  ! 694: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xce92a014  ! 695: LDUHA_I	lduha	[%r10, + 0x0014] %asi, %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfba981f  ! 696: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc842a04c  ! 697: LDSW_I	ldsw	[%r10 + 0x004c], %r4
	.word 0xc3bad87f  ! 698: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd0daa040  ! 699: LDXA_I	ldxa	[%r10, + 0x0040] %asi, %r8
	.word 0xd2dad15f  ! 700: LDXA_R	ldxa	[%r11, %r31] 0x8a, %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3e2903f  ! 701: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd3ba987f  ! 702: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba995f  ! 703: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc4c2e010  ! 704: LDSWA_I	ldswa	[%r11, + 0x0010] %asi, %r2
	.word 0xcbbad93f  ! 705: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc8c2a074  ! 706: LDSWA_I	ldswa	[%r10, + 0x0074] %asi, %r4
	.word 0xc5ba99bf  ! 707: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba99bf  ! 708: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc6d2a02e  ! 709: LDSHA_I	ldsha	[%r10, + 0x002e] %asi, %r3
	.word 0xc3e2a01f  ! 710: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc03aa010  ! 711: STD_I	std	%r0, [%r10 + 0x0010]
	.word 0xc3ba981f  ! 712: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba993f  ! 713: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xce5aa068  ! 714: LDX_I	ldx	[%r10 + 0x0068], %r7
	.word 0xd1baa028  ! 715: STDFA_I	stda	%f8, [0x0028, %r10]
TH_LABEL715:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1f2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba997f  ! 717: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 718: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 719: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xce5a801f  ! 720: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5ba981f  ! 721: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2911f  ! 722: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xcc9aa060  ! 723: LDDA_I	ldda	[%r10, + 0x0060] %asi, %r6
	.word 0xcc02a018  ! 724: LDUW_I	lduw	[%r10 + 0x0018], %r6
	.word 0xd042a078  ! 725: LDSW_I	ldsw	[%r10 + 0x0078], %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbbad91f  ! 726: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad99f  ! 727: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad8bf  ! 728: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc12e016  ! 729: LDUH_I	lduh	[%r11 + 0x0016], %r6
	.word 0xd3f2a01f  ! 730: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3e2a01f  ! 731: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc41a801f  ! 732: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc09aa058  ! 733: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r0
	.word 0xcf02a078  ! 734: LDF_I	ld	[%r10, 0x0078], %f7
	.word 0xcc3aa008  ! 735: STD_I	std	%r6, [%r10 + 0x0008]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfe2a01f  ! 736: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcc42a078  ! 737: LDSW_I	ldsw	[%r10 + 0x0078], %r6
	.word 0xcf22801f  ! 738: STF_R	st	%f7, [%r31, %r10]
	.word 0xcc12c01f  ! 739: LDUH_R	lduh	[%r11 + %r31], %r6
	.word 0xd1f2911f  ! 740: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1ba987f  ! 741: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcac2e010  ! 742: LDSWA_I	ldswa	[%r11, + 0x0010] %asi, %r5
	.word 0xc68aa04c  ! 743: LDUBA_I	lduba	[%r10, + 0x004c] %asi, %r3
	.word 0xc83ac01f  ! 744: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbe2d01f  ! 745: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbbad81f  ! 746: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad83f  ! 747: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc302801f  ! 748: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc3bad85f  ! 749: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd302a060  ! 750: LDF_I	ld	[%r10, 0x0060], %f9
TH_LABEL750:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd242801f  ! 751: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xd1f2a01f  ! 752: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2a01f  ! 753: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa000  ! 754: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xc45a801f  ! 755: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9f2d01f  ! 756: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xcc92a034  ! 757: LDUHA_I	lduha	[%r10, + 0x0034] %asi, %r6
	.word 0xcfbad8bf  ! 758: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc502a038  ! 759: LDF_I	ld	[%r10, 0x0038], %f2
	.word 0xcdba985f  ! 760: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdba989f  ! 761: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2913f  ! 762: CASA_I	casa	[%r10] 0x89, %r31, %r6
	.word 0xc642801f  ! 763: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc9e2d03f  ! 764: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xcf9aa000  ! 765: LDDFA_I	ldda	[%r10, 0x0000], %f7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1e2a01f  ! 766: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1e2a01f  ! 767: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 768: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd212e026  ! 769: LDUH_I	lduh	[%r11 + 0x0026], %r9
	.word 0xc9bad83f  ! 770: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9bad87f  ! 771: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc852a036  ! 772: LDSH_I	ldsh	[%r10 + 0x0036], %r4
	.word 0xcf02c01f  ! 773: LDF_R	ld	[%r11, %r31], %f7
	.word 0xc8ca915f  ! 774: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r4
	.word 0xd1f2903f  ! 775: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
TH_LABEL775:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd03aa058  ! 776: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xcdbae070  ! 777: STDFA_I	stda	%f6, [0x0070, %r11]
	.word 0xc80ac01f  ! 778: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xc7ba993f  ! 779: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 780: STD_R	std	%r2, [%r10 + %r31]
TH_LABEL780:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7ba983f  ! 781: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 782: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2903f  ! 783: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba997f  ! 784: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd3bae020  ! 785: STDFA_I	stda	%f9, [0x0020, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbbaa018  ! 786: STDFA_I	stda	%f5, [0x0018, %r10]
	.word 0xc9bad99f  ! 787: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad8bf  ! 788: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 789: STD_R	std	%r4, [%r11 + %r31]
	.word 0xd292913f  ! 790: LDUHA_R	lduha	[%r10, %r31] 0x89, %r9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc922c01f  ! 791: STF_R	st	%f4, [%r31, %r11]
	.word 0xc7ba98bf  ! 792: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcac2e024  ! 793: LDSWA_I	ldswa	[%r11, + 0x0024] %asi, %r5
	.word 0xc3e2a01f  ! 794: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xcdbae048  ! 795: STDFA_I	stda	%f6, [0x0048, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc84aa06e  ! 796: LDSB_I	ldsb	[%r10 + 0x006e], %r4
	.word 0xcfba989f  ! 797: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba985f  ! 798: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc49aa078  ! 799: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r2
	.word 0xcacaa024  ! 800: LDSBA_I	ldsba	[%r10, + 0x0024] %asi, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3f2d01f  ! 801: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xcc52801f  ! 802: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xc43ae048  ! 803: STD_I	std	%r2, [%r11 + 0x0048]
	.word 0xcadad07f  ! 804: LDXA_R	ldxa	[%r11, %r31] 0x83, %r5
	.word 0xc692e05c  ! 805: LDUHA_I	lduha	[%r11, + 0x005c] %asi, %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcde2e01f  ! 806: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xc3bae068  ! 807: STDFA_I	stda	%f1, [0x0068, %r11]
	.word 0xc9f2901f  ! 808: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9e2901f  ! 809: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9e2a01f  ! 810: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9f2a01f  ! 811: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xd012a066  ! 812: LDUH_I	lduh	[%r10 + 0x0066], %r8
	.word 0xccd2a000  ! 813: LDSHA_I	ldsha	[%r10, + 0x0000] %asi, %r6
	.word 0xca02801f  ! 814: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xd1bad91f  ! 815: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1bad81f  ! 816: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d01f  ! 817: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xc722801f  ! 818: STF_R	st	%f3, [%r31, %r10]
	.word 0xca52e06e  ! 819: LDSH_I	ldsh	[%r11 + 0x006e], %r5
	.word 0xca52a04a  ! 820: LDSH_I	ldsh	[%r10 + 0x004a], %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc43aa060  ! 821: STD_I	std	%r2, [%r10 + 0x0060]
	.word 0xcc1aa010  ! 822: LDD_I	ldd	[%r10 + 0x0010], %r6
	.word 0xccc2915f  ! 823: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r6
	.word 0xc3ba993f  ! 824: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba99bf  ! 825: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL825:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc41aa010  ! 826: LDD_I	ldd	[%r10 + 0x0010], %r2
	.word 0xd1f2a01f  ! 827: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc4d2a01a  ! 828: LDSHA_I	ldsha	[%r10, + 0x001a] %asi, %r2
	.word 0xcc3aa050  ! 829: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xcff2901f  ! 830: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfba995f  ! 831: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba983f  ! 832: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc842e028  ! 833: LDSW_I	ldsw	[%r11 + 0x0028], %r4
	.word 0xd3ba993f  ! 834: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcacaa01a  ! 835: LDSBA_I	ldsba	[%r10, + 0x001a] %asi, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc12801f  ! 836: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xcf22c01f  ! 837: STF_R	st	%f7, [%r31, %r11]
	.word 0xd052c01f  ! 838: LDSH_R	ldsh	[%r11 + %r31], %r8
	.word 0xcdbad9bf  ! 839: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xca52801f  ! 840: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xca8aa015  ! 841: LDUBA_I	lduba	[%r10, + 0x0015] %asi, %r5
	.word 0xd1ba999f  ! 842: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc39aa010  ! 843: LDDFA_I	ldda	[%r10, 0x0010], %f1
	.word 0xcbba98bf  ! 844: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xca42a060  ! 845: LDSW_I	ldsw	[%r10 + 0x0060], %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5baa058  ! 846: STDFA_I	stda	%f2, [0x0058, %r10]
	.word 0xc492e040  ! 847: LDUHA_I	lduha	[%r11, + 0x0040] %asi, %r2
	.word 0xc252801f  ! 848: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xcdba981f  ! 849: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xce8ad01f  ! 850: LDUBA_R	lduba	[%r11, %r31] 0x80, %r7
TH_LABEL850:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3e2d01f  ! 851: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd2d2a04e  ! 852: LDSHA_I	ldsha	[%r10, + 0x004e] %asi, %r9
	.word 0xc322c01f  ! 853: STF_R	st	%f1, [%r31, %r11]
	.word 0xd1e2901f  ! 854: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xcf22801f  ! 855: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc43ae008  ! 856: STD_I	std	%r2, [%r11 + 0x0008]
	.word 0xd04a801f  ! 857: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xc3bad8bf  ! 858: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad93f  ! 859: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc482901f  ! 860: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfba997f  ! 861: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 862: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd102a058  ! 863: LDF_I	ld	[%r10, 0x0058], %f8
	.word 0xcc5ac01f  ! 864: LDX_R	ldx	[%r11 + %r31], %r6
	.word 0xd3ba999f  ! 865: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL865:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3ba989f  ! 866: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 867: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 868: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba999f  ! 869: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 870: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc12e070  ! 871: LDUH_I	lduh	[%r11 + 0x0070], %r6
	.word 0xc7ba997f  ! 872: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 873: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xcccaa011  ! 874: LDSBA_I	ldsba	[%r10, + 0x0011] %asi, %r6
	.word 0xd1ba995f  ! 875: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc702a024  ! 876: LDF_I	ld	[%r10, 0x0024], %f3
	.word 0xcdf2e01f  ! 877: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xc4d2d17f  ! 878: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r2
	.word 0xc99aa008  ! 879: LDDFA_I	ldda	[%r10, 0x0008], %f4
	.word 0xc88aa07b  ! 880: LDUBA_I	lduba	[%r10, + 0x007b] %asi, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd20a801f  ! 881: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xc3ba997f  ! 882: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 883: STD_R	std	%r0, [%r10 + %r31]
	.word 0xcd02801f  ! 884: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc41a801f  ! 885: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc802c01f  ! 886: LDUW_R	lduw	[%r11 + %r31], %r4
	.word 0xcbbad93f  ! 887: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 888: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcb22801f  ! 889: STF_R	st	%f5, [%r31, %r10]
	.word 0xc7bae000  ! 890: STDFA_I	stda	%f3, [0x0000, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9f2901f  ! 891: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc49aa058  ! 892: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r2
	.word 0xc09ae050  ! 893: LDDA_I	ldda	[%r11, + 0x0050] %asi, %r0
	.word 0xd1f2a01f  ! 894: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba989f  ! 895: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc12a06a  ! 896: LDUH_I	lduh	[%r10 + 0x006a], %r6
	.word 0xc2d2a016  ! 897: LDSHA_I	ldsha	[%r10, + 0x0016] %asi, %r1
	.word 0xc8c2e000  ! 898: LDSWA_I	ldswa	[%r11, + 0x0000] %asi, %r4
	.word 0xd1ba987f  ! 899: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc682a02c  ! 900: LDUWA_I	lduwa	[%r10, + 0x002c] %asi, %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc99ae068  ! 901: LDDFA_I	ldda	[%r11, 0x0068], %f4
	.word 0xc282e028  ! 902: LDUWA_I	lduwa	[%r11, + 0x0028] %asi, %r1
	.word 0xc49aa020  ! 903: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r2
	.word 0xcfbad91f  ! 904: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd00a801f  ! 905: LDUB_R	ldub	[%r10 + %r31], %r8
TH_LABEL905:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc12c01f  ! 906: LDUH_R	lduh	[%r11 + %r31], %r6
	.word 0xccca903f  ! 907: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r6
	.word 0xc7e2901f  ! 908: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba999f  ! 909: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa030  ! 910: STD_I	std	%r2, [%r10 + 0x0030]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc79aa058  ! 911: LDDFA_I	ldda	[%r10, 0x0058], %f3
	.word 0xcbba991f  ! 912: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba989f  ! 913: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd122c01f  ! 914: STF_R	st	%f8, [%r31, %r11]
	.word 0xcc3ae050  ! 915: STD_I	std	%r6, [%r11 + 0x0050]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdbad85f  ! 916: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xca42801f  ! 917: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xd1e2e01f  ! 918: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad95f  ! 919: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc8c2a044  ! 920: LDSWA_I	ldswa	[%r10, + 0x0044] %asi, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbba987f  ! 921: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba999f  ! 922: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 923: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba987f  ! 924: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa028  ! 925: STD_I	std	%r4, [%r10 + 0x0028]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbba997f  ! 926: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc01aa020  ! 927: LDD_I	ldd	[%r10 + 0x0020], %r0
	.word 0xc9ba995f  ! 928: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd102c01f  ! 929: LDF_R	ld	[%r11, %r31], %f8
	.word 0xca12801f  ! 930: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc252c01f  ! 931: LDSH_R	ldsh	[%r11 + %r31], %r1
	.word 0xc49aa068  ! 932: LDDA_I	ldda	[%r10, + 0x0068] %asi, %r2
	.word 0xcf9aa038  ! 933: LDDFA_I	ldda	[%r10, 0x0038], %f7
	.word 0xcde2d01f  ! 934: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xd102a038  ! 935: LDF_I	ld	[%r10, 0x0038], %f8
TH_LABEL935:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5f2a01f  ! 936: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc43a801f  ! 937: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba981f  ! 938: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc442801f  ! 939: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xcbba98bf  ! 940: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbf2a01f  ! 941: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xca92a056  ! 942: LDUHA_I	lduha	[%r10, + 0x0056] %asi, %r5
	.word 0xcb02a05c  ! 943: LDF_I	ld	[%r10, 0x005c], %f5
	.word 0xd3bad89f  ! 944: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2d11f  ! 945: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3bad9bf  ! 946: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc702a054  ! 947: LDF_I	ld	[%r10, 0x0054], %f3
	.word 0xd1bad99f  ! 948: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc6caa06a  ! 949: LDSBA_I	ldsba	[%r10, + 0x006a] %asi, %r3
	.word 0xcdba997f  ! 950: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc82e068  ! 951: LDUWA_I	lduwa	[%r11, + 0x0068] %asi, %r6
	.word 0xca52801f  ! 952: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xc442a06c  ! 953: LDSW_I	ldsw	[%r10 + 0x006c], %r2
	.word 0xcfe2903f  ! 954: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcff2903f  ! 955: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfe2903f  ! 956: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcfba991f  ! 957: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa010  ! 958: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcfba991f  ! 959: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd1bae068  ! 960: STDFA_I	stda	%f8, [0x0068, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xca5ac01f  ! 961: LDX_R	ldx	[%r11 + %r31], %r5
	.word 0xd1ba991f  ! 962: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xce42a040  ! 963: LDSW_I	ldsw	[%r10 + 0x0040], %r7
	.word 0xc3ba987f  ! 964: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc60aa06d  ! 965: LDUB_I	ldub	[%r10 + 0x006d], %r3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd01ac01f  ! 966: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xcfba989f  ! 967: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa038  ! 968: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcc3aa038  ! 969: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcc3a801f  ! 970: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xce4ac01f  ! 971: LDSB_R	ldsb	[%r11 + %r31], %r7
	.word 0xc64a801f  ! 972: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xccc2a028  ! 973: LDSWA_I	ldswa	[%r10, + 0x0028] %asi, %r6
	.word 0xd1bad81f  ! 974: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad83f  ! 975: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xce8aa02d  ! 976: LDUBA_I	lduba	[%r10, + 0x002d] %asi, %r7
	.word 0xd2cad17f  ! 977: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r9
	.word 0xce8aa072  ! 978: LDUBA_I	lduba	[%r10, + 0x0072] %asi, %r7
	.word 0xd3e2a01f  ! 979: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba98bf  ! 980: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03aa058  ! 981: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3e2a01f  ! 982: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd302801f  ! 983: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd092e05e  ! 984: LDUHA_I	lduha	[%r11, + 0x005e] %asi, %r8
	.word 0xce42c01f  ! 985: LDSW_R	ldsw	[%r11 + %r31], %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xce02e050  ! 986: LDUW_I	lduw	[%r11 + 0x0050], %r7
	.word 0xd00aa055  ! 987: LDUB_I	ldub	[%r10 + 0x0055], %r8
	.word 0xcb9aa028  ! 988: LDDFA_I	ldda	[%r10, 0x0028], %f5
	.word 0xccdae028  ! 989: LDXA_I	ldxa	[%r11, + 0x0028] %asi, %r6
	.word 0xc5bad89f  ! 990: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5bad89f  ! 991: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc892d01f  ! 992: LDUHA_R	lduha	[%r11, %r31] 0x80, %r4
	.word 0xd122801f  ! 993: STF_R	st	%f8, [%r31, %r10]
	.word 0xc7ba99bf  ! 994: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd122c01f  ! 995: STF_R	st	%f8, [%r31, %r11]
TH_LABEL995:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3f2a01f  ! 996: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd28a917f  ! 997: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r9
	.word 0xcfba997f  ! 998: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc2ca917f  ! 999: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r1
	.word 0xcd02c01f  ! 1000: LDF_R	ld	[%r11, %r31], %f6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	subcc %r30, 1, %r30
	bnz  TH1_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	add	%g0,	0x1,	%r30
TH0_LOOP_START:
	.word 0xc9ba995f  ! 1: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 2: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xce92d11f  ! 3: LDUHA_R	lduha	[%r11, %r31] 0x88, %r7
	.word 0xc612a06a  ! 4: LDUH_I	lduh	[%r10 + 0x006a], %r3
	.word 0xd3baa050  ! 5: STDFA_I	stda	%f9, [0x0050, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xce0a801f  ! 6: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xcfba981f  ! 7: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfbaa018  ! 8: STDFA_I	stda	%f7, [0x0018, %r10]
	.word 0xcdbaa038  ! 9: STDFA_I	stda	%f6, [0x0038, %r10]
	.word 0xcdf2913f  ! 10: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc842c01f  ! 11: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xc9bad93f  ! 12: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xca0ae026  ! 13: LDUB_I	ldub	[%r11 + 0x0026], %r5
	.word 0xcbf2e01f  ! 14: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad91f  ! 15: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbbad83f  ! 16: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 17: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbbad91f  ! 18: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad93f  ! 19: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad87f  ! 20: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc65aa060  ! 21: LDX_I	ldx	[%r10 + 0x0060], %r3
	.word 0xc7ba987f  ! 22: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcb02a048  ! 23: LDF_I	ld	[%r10, 0x0048], %f5
	.word 0xc482915f  ! 24: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r2
	.word 0xc5f2903f  ! 25: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5f2a01f  ! 26: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc79aa018  ! 27: LDDFA_I	ldda	[%r10, 0x0018], %f3
	.word 0xc7f2911f  ! 28: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba991f  ! 29: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2903f  ! 30: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
TH_LABEL30:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc6ca917f  ! 31: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r3
	.word 0xcd02801f  ! 32: LDF_R	ld	[%r10, %r31], %f6
	.word 0xcdba981f  ! 33: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 34: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 35: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc892913f  ! 36: LDUHA_R	lduha	[%r10, %r31] 0x89, %r4
	.word 0xc9ba981f  ! 37: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 38: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2901f  ! 39: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba993f  ! 40: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc702801f  ! 41: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc7f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7e2a01f  ! 43: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xcf9aa040  ! 44: LDDFA_I	ldda	[%r10, 0x0040], %f7
	.word 0xd25a801f  ! 45: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xceda913f  ! 46: LDXA_R	ldxa	[%r10, %r31] 0x89, %r7
	.word 0xcfe2911f  ! 47: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcfe2a01f  ! 48: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba989f  ! 49: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd282d15f  ! 50: LDUWA_R	lduwa	[%r11, %r31] 0x8a, %r9
TH_LABEL50:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3bad81f  ! 51: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad93f  ! 52: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad95f  ! 53: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xca82e070  ! 54: LDUWA_I	lduwa	[%r11, + 0x0070] %asi, %r5
	.word 0xc41ae018  ! 55: LDD_I	ldd	[%r11 + 0x0018], %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7bad81f  ! 56: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad93f  ! 57: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc242801f  ! 58: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xd2caa044  ! 59: LDSBA_I	ldsba	[%r10, + 0x0044] %asi, %r9
	.word 0xd302801f  ! 60: LDF_R	ld	[%r10, %r31], %f9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3ba99bf  ! 61: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcedae060  ! 62: LDXA_I	ldxa	[%r11, + 0x0060] %asi, %r7
	.word 0xcc3ae060  ! 63: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xc4da903f  ! 64: LDXA_R	ldxa	[%r10, %r31] 0x81, %r2
	.word 0xc5f2901f  ! 65: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
TH_LABEL65:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5ba991f  ! 66: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 67: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc68aa047  ! 68: LDUBA_I	lduba	[%r10, + 0x0047] %asi, %r3
	.word 0xc7f2a01f  ! 69: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba993f  ! 70: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7e2911f  ! 71: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba983f  ! 72: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 73: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 74: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc48ae005  ! 75: LDUBA_I	lduba	[%r11, + 0x0005] %asi, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc43ae000  ! 76: STD_I	std	%r2, [%r11 + 0x0000]
	.word 0xc5f2d11f  ! 77: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xc5f2e01f  ! 78: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc43ac01f  ! 79: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc09ae000  ! 80: LDDA_I	ldda	[%r11, + 0x0000] %asi, %r0
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc03ae000  ! 81: STD_I	std	%r0, [%r11 + 0x0000]
	.word 0xc80aa01b  ! 82: LDUB_I	ldub	[%r10 + 0x001b], %r4
	.word 0xc83a801f  ! 83: STD_R	std	%r4, [%r10 + %r31]
	.word 0xca82915f  ! 84: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r5
	.word 0xcbba999f  ! 85: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbf2901f  ! 86: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xc2dad11f  ! 87: LDXA_R	ldxa	[%r11, %r31] 0x88, %r1
	.word 0xcd22c01f  ! 88: STF_R	st	%f6, [%r31, %r11]
	.word 0xc25a801f  ! 89: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xc3e2911f  ! 90: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc03a801f  ! 91: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3ba997f  ! 92: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 93: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc48a915f  ! 94: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r2
	.word 0xcc12a054  ! 95: LDUH_I	lduh	[%r10 + 0x0054], %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc41a801f  ! 96: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc64ac01f  ! 97: LDSB_R	ldsb	[%r11 + %r31], %r3
	.word 0xc43ae050  ! 98: STD_I	std	%r2, [%r11 + 0x0050]
	.word 0xc43ae050  ! 99: STD_I	std	%r2, [%r11 + 0x0050]
	.word 0xc6d2907f  ! 100: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd202801f  ! 101: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xc282a014  ! 102: LDUWA_I	lduwa	[%r10, + 0x0014] %asi, %r1
	.word 0xc3f2901f  ! 103: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3e2a01f  ! 104: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba989f  ! 105: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3e2a01f  ! 106: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba993f  ! 107: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 108: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 109: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 110: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc502e038  ! 111: LDF_I	ld	[%r11, 0x0038], %f2
	.word 0xc43ae038  ! 112: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xc43ac01f  ! 113: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae038  ! 114: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xc43ae038  ! 115: STD_I	std	%r2, [%r11 + 0x0038]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd00aa040  ! 116: LDUB_I	ldub	[%r10 + 0x0040], %r8
	.word 0xd1ba989f  ! 117: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 118: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc8aa006  ! 119: LDUBA_I	lduba	[%r10, + 0x0006] %asi, %r6
	.word 0xc9baa018  ! 120: STDFA_I	stda	%f4, [0x0018, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9f2903f  ! 121: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc9f2901f  ! 122: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba983f  ! 123: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2903f  ! 124: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc9f2901f  ! 125: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9ba98bf  ! 126: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 127: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc842c01f  ! 128: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xc9e2e01f  ! 129: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xcf9aa070  ! 130: LDDFA_I	ldda	[%r10, 0x0070], %f7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfe2a01f  ! 131: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xce8aa02d  ! 132: LDUBA_I	lduba	[%r10, + 0x002d] %asi, %r7
	.word 0xcc3aa028  ! 133: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xcc3a801f  ! 134: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc09ae048  ! 135: LDDA_I	ldda	[%r11, + 0x0048] %asi, %r0
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3f2e01f  ! 136: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xcc12801f  ! 137: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xcdba983f  ! 138: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba997f  ! 139: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 140: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xca5a801f  ! 141: LDX_R	ldx	[%r10 + %r31], %r5
	.word 0xcbba99bf  ! 142: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2901f  ! 143: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbba991f  ! 144: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba995f  ! 145: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbf2a01f  ! 146: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xc452a056  ! 147: LDSH_I	ldsh	[%r10 + 0x0056], %r2
	.word 0xcc02801f  ! 148: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xcdba991f  ! 149: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba991f  ! 150: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcf02a03c  ! 151: LDF_I	ld	[%r10, 0x003c], %f7
	.word 0xd08a911f  ! 152: LDUBA_R	lduba	[%r10, %r31] 0x88, %r8
	.word 0xc302e008  ! 153: LDF_I	ld	[%r11, 0x0008], %f1
	.word 0xc39aa020  ! 154: LDDFA_I	ldda	[%r10, 0x0020], %f1
	.word 0xc3ba993f  ! 155: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc03a801f  ! 156: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc3f2903f  ! 157: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc3f2903f  ! 158: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba993f  ! 159: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcd02a068  ! 160: LDF_I	ld	[%r10, 0x0068], %f6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc41ac01f  ! 161: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xd3baa060  ! 162: STDFA_I	stda	%f9, [0x0060, %r10]
	.word 0xc302e018  ! 163: LDF_I	ld	[%r11, 0x0018], %f1
	.word 0xc6d2a02a  ! 164: LDSHA_I	ldsha	[%r10, + 0x002a] %asi, %r3
	.word 0xc24a801f  ! 165: LDSB_R	ldsb	[%r10 + %r31], %r1
TH_LABEL165:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3ba991f  ! 166: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 167: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xce0a801f  ! 168: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xd122801f  ! 169: STF_R	st	%f8, [%r31, %r10]
	.word 0xd1f2903f  ! 170: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03aa028  ! 171: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd03a801f  ! 172: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba995f  ! 173: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 174: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba997f  ! 175: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1f2a01f  ! 176: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2913f  ! 177: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xca42e050  ! 178: LDSW_I	ldsw	[%r11 + 0x0050], %r5
	.word 0xcbe2d01f  ! 179: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xca8a915f  ! 180: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbe2a01f  ! 181: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc83a801f  ! 182: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba991f  ! 183: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2901f  ! 184: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xc59aa068  ! 185: LDDFA_I	ldda	[%r10, 0x0068], %f2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd102e060  ! 186: LDF_I	ld	[%r11, 0x0060], %f8
	.word 0xd1bad95f  ! 187: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae060  ! 188: STD_I	std	%r8, [%r11 + 0x0060]
	.word 0xd002c01f  ! 189: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xd1bad85f  ! 190: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1bad89f  ! 191: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad95f  ! 192: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xca12e022  ! 193: LDUH_I	lduh	[%r11 + 0x0022], %r5
	.word 0xc842801f  ! 194: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xc9ba999f  ! 195: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9ba987f  ! 196: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 197: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 198: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba995f  ! 199: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2901f  ! 200: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd0d2a03e  ! 201: LDSHA_I	ldsha	[%r10, + 0x003e] %asi, %r8
	.word 0xd1ba995f  ! 202: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc492e076  ! 203: LDUHA_I	lduha	[%r11, + 0x0076] %asi, %r2
	.word 0xc5bad91f  ! 204: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 205: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5e2d13f  ! 206: CASA_I	casa	[%r11] 0x89, %r31, %r2
	.word 0xc9baa078  ! 207: STDFA_I	stda	%f4, [0x0078, %r10]
	.word 0xc9ba991f  ! 208: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc39aa078  ! 209: LDDFA_I	ldda	[%r10, 0x0078], %f1
	.word 0xc48a901f  ! 210: LDUBA_R	lduba	[%r10, %r31] 0x80, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5ba997f  ! 211: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 212: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc692901f  ! 213: LDUHA_R	lduha	[%r10, %r31] 0x80, %r3
	.word 0xc7ba991f  ! 214: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd322801f  ! 215: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3ba983f  ! 216: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xccc2917f  ! 217: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r6
	.word 0xcde2901f  ! 218: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xcdba987f  ! 219: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 220: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
TH_LABEL220:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdba991f  ! 221: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 222: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2913f  ! 223: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xc59ae030  ! 224: LDDFA_I	ldda	[%r11, 0x0030], %f2
	.word 0xc212801f  ! 225: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcb02e020  ! 226: LDF_I	ld	[%r11, 0x0020], %f5
	.word 0xd0c2a010  ! 227: LDSWA_I	ldswa	[%r10, + 0x0010] %asi, %r8
	.word 0xc482d01f  ! 228: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r2
	.word 0xc09aa030  ! 229: LDDA_I	ldda	[%r10, + 0x0030] %asi, %r0
	.word 0xc5baa008  ! 230: STDFA_I	stda	%f2, [0x0008, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcec2d05f  ! 231: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r7
	.word 0xd0dad03f  ! 232: LDXA_R	ldxa	[%r11, %r31] 0x81, %r8
	.word 0xc41aa008  ! 233: LDD_I	ldd	[%r10 + 0x0008], %r2
	.word 0xc81a801f  ! 234: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc9f2913f  ! 235: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9ba99bf  ! 236: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 237: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 238: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9e2a01f  ! 239: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc9f2a01f  ! 240: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcf02801f  ! 241: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcfe2a01f  ! 242: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc852c01f  ! 243: LDSH_R	ldsh	[%r11 + %r31], %r4
	.word 0xc4c2d05f  ! 244: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r2
	.word 0xc652801f  ! 245: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7ba981f  ! 246: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 247: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 248: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba985f  ! 249: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba983f  ! 250: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7f2901f  ! 251: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7f2a01f  ! 252: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba995f  ! 253: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 254: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba987f  ! 255: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfbaa008  ! 256: STDFA_I	stda	%f7, [0x0008, %r10]
	.word 0xd2cae030  ! 257: LDSBA_I	ldsba	[%r11, + 0x0030] %asi, %r9
	.word 0xd2c2e070  ! 258: LDSWA_I	ldswa	[%r11, + 0x0070] %asi, %r9
	.word 0xc48aa033  ! 259: LDUBA_I	lduba	[%r10, + 0x0033] %asi, %r2
	.word 0xce92911f  ! 260: LDUHA_R	lduha	[%r10, %r31] 0x88, %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfba981f  ! 261: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba991f  ! 262: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2903f  ! 263: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcfba99bf  ! 264: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd212a06e  ! 265: LDUH_I	lduh	[%r10 + 0x006e], %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03aa068  ! 266: STD_I	std	%r8, [%r10 + 0x0068]
	.word 0xd3e2a01f  ! 267: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xcccaa005  ! 268: LDSBA_I	ldsba	[%r10, + 0x0005] %asi, %r6
	.word 0xcdf2903f  ! 269: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xc842801f  ! 270: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xced2a07a  ! 271: LDSHA_I	ldsha	[%r10, + 0x007a] %asi, %r7
	.word 0xcc3a801f  ! 272: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc2cad01f  ! 273: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r1
	.word 0xc3e2d13f  ! 274: CASA_I	casa	[%r11] 0x89, %r31, %r1
	.word 0xc3bad81f  ! 275: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc48ae079  ! 276: LDUBA_I	lduba	[%r11, + 0x0079] %asi, %r2
	.word 0xc6d2913f  ! 277: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r3
	.word 0xc412801f  ! 278: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xc5e2903f  ! 279: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba983f  ! 280: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd322801f  ! 281: STF_R	st	%f9, [%r31, %r10]
	.word 0xd3ba985f  ! 282: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc612c01f  ! 283: LDUH_R	lduh	[%r11 + %r31], %r3
	.word 0xc43ac01f  ! 284: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ac01f  ! 285: STD_R	std	%r2, [%r11 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc79aa078  ! 286: LDDFA_I	ldda	[%r10, 0x0078], %f3
	.word 0xce92911f  ! 287: LDUHA_R	lduha	[%r10, %r31] 0x88, %r7
	.word 0xcc0ac01f  ! 288: LDUB_R	ldub	[%r11 + %r31], %r6
	.word 0xd302a058  ! 289: LDF_I	ld	[%r10, 0x0058], %f9
	.word 0xd03a801f  ! 290: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3ba999f  ! 291: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 292: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xca8ad01f  ! 293: LDUBA_R	lduba	[%r11, %r31] 0x80, %r5
	.word 0xcbf2e01f  ! 294: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcf02e010  ! 295: LDF_I	ld	[%r11, 0x0010], %f7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcada903f  ! 296: LDXA_R	ldxa	[%r10, %r31] 0x81, %r5
	.word 0xcbba985f  ! 297: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba985f  ! 298: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 299: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba985f  ! 300: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbba985f  ! 301: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc412801f  ! 302: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xc5ba981f  ! 303: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2a01f  ! 304: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba985f  ! 305: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5e2901f  ! 306: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xcc8a905f  ! 307: LDUBA_R	lduba	[%r10, %r31] 0x82, %r6
	.word 0xcc02801f  ! 308: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xcdba991f  ! 309: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 310: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdf2a01f  ! 311: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba997f  ! 312: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 313: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 314: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 315: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcde2a01f  ! 316: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba995f  ! 317: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 318: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xc652801f  ! 319: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xc7ba981f  ! 320: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7ba999f  ! 321: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba985f  ! 322: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 323: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 324: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd2c2911f  ! 325: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd2c2e02c  ! 326: LDSWA_I	ldswa	[%r11, + 0x002c] %asi, %r9
	.word 0xd3f2d01f  ! 327: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xc502c01f  ! 328: LDF_R	ld	[%r11, %r31], %f2
	.word 0xcd9ae008  ! 329: LDDFA_I	ldda	[%r11, 0x0008], %f6
	.word 0xc88aa071  ! 330: LDUBA_I	lduba	[%r10, + 0x0071] %asi, %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9e2913f  ! 331: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba983f  ! 332: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcad2a056  ! 333: LDSHA_I	ldsha	[%r10, + 0x0056] %asi, %r5
	.word 0xd122801f  ! 334: STF_R	st	%f8, [%r31, %r10]
	.word 0xcc1aa018  ! 335: LDD_I	ldd	[%r10 + 0x0018], %r6
TH_LABEL335:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd0c2a05c  ! 336: LDSWA_I	ldswa	[%r10, + 0x005c] %asi, %r8
	.word 0xd1ba993f  ! 337: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba997f  ! 338: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 339: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba98bf  ! 340: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL340:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xced2e050  ! 341: LDSHA_I	ldsha	[%r11, + 0x0050] %asi, %r7
	.word 0xcfbad87f  ! 342: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd05a801f  ! 343: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xc242e028  ! 344: LDSW_I	ldsw	[%r11 + 0x0028], %r1
	.word 0xc3f2e01f  ! 345: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3bad97f  ! 346: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc2c2e054  ! 347: LDSWA_I	ldswa	[%r11, + 0x0054] %asi, %r1
	.word 0xc03ac01f  ! 348: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad9bf  ! 349: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2d03f  ! 350: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd012a032  ! 351: LDUH_I	lduh	[%r10 + 0x0032], %r8
	.word 0xce42c01f  ! 352: LDSW_R	ldsw	[%r11 + %r31], %r7
	.word 0xcfbad81f  ! 353: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc3ae030  ! 354: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcff2d13f  ! 355: CASXA_I	casxa	[%r11] 0x89, %r31, %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc3ae030  ! 356: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcfbad9bf  ! 357: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfe2e01f  ! 358: CASA_R	casa	[%r11] %asi, %r31, %r7
	.word 0xcfbad99f  ! 359: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad81f  ! 360: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd242801f  ! 361: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xd03aa030  ! 362: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xc20a801f  ! 363: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xc3ba991f  ! 364: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd25a801f  ! 365: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3ba991f  ! 366: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba991f  ! 367: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd1baa010  ! 368: STDFA_I	stda	%f8, [0x0010, %r10]
	.word 0xd1e2911f  ! 369: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xd1ba991f  ! 370: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1e2901f  ! 371: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba991f  ! 372: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba99bf  ! 373: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa010  ! 374: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1ba98bf  ! 375: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xca02c01f  ! 376: LDUW_R	lduw	[%r11 + %r31], %r5
	.word 0xcbbad8bf  ! 377: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d13f  ! 378: CASXA_I	casxa	[%r11] 0x89, %r31, %r5
	.word 0xcbe2e01f  ! 379: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbf2d01f  ! 380: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd102801f  ! 381: LDF_R	ld	[%r10, %r31], %f8
	.word 0xd1ba983f  ! 382: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2a01f  ! 383: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2901f  ! 384: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xc7bae078  ! 385: STDFA_I	stda	%f3, [0x0078, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfbaa018  ! 386: STDFA_I	stda	%f7, [0x0018, %r10]
	.word 0xcff2a01f  ! 387: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc45a801f  ! 388: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xc7baa060  ! 389: STDFA_I	stda	%f3, [0x0060, %r10]
	.word 0xc43a801f  ! 390: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd282e01c  ! 391: LDUWA_I	lduwa	[%r11, + 0x001c] %asi, %r9
	.word 0xd3bad83f  ! 392: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 393: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xc852a072  ! 394: LDSH_I	ldsh	[%r10 + 0x0072], %r4
	.word 0xc9ba989f  ! 395: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL395:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9ba987f  ! 396: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba989f  ! 397: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcad2913f  ! 398: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r5
	.word 0xc612c01f  ! 399: LDUH_R	lduh	[%r11 + %r31], %r3
	.word 0xcdbae050  ! 400: STDFA_I	stda	%f6, [0x0050, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdbad83f  ! 401: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad95f  ! 402: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad89f  ! 403: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 404: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcc3ae050  ! 405: STD_I	std	%r6, [%r11 + 0x0050]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc3ac01f  ! 406: STD_R	std	%r6, [%r11 + %r31]
	.word 0xc602e048  ! 407: LDUW_I	lduw	[%r11 + 0x0048], %r3
	.word 0xc7e2d01f  ! 408: CASA_I	casa	[%r11] 0x80, %r31, %r3
	.word 0xc7bad87f  ! 409: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad83f  ! 410: STDFA_R	stda	%f3, [%r31, %r11]
TH_LABEL410:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7e2e01f  ! 411: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xc7bad8bf  ! 412: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xca82a068  ! 413: LDUWA_I	lduwa	[%r10, + 0x0068] %asi, %r5
	.word 0xc39aa030  ! 414: LDDFA_I	ldda	[%r10, 0x0030], %f1
	.word 0xc03a801f  ! 415: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3ba983f  ! 416: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2913f  ! 417: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xc842e020  ! 418: LDSW_I	ldsw	[%r11 + 0x0020], %r4
	.word 0xc83ae020  ! 419: STD_I	std	%r4, [%r11 + 0x0020]
	.word 0xc83ac01f  ! 420: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd102801f  ! 421: LDF_R	ld	[%r10, %r31], %f8
	.word 0xd1ba983f  ! 422: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 423: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc212a012  ! 424: LDUH_I	lduh	[%r10 + 0x0012], %r1
	.word 0xc3ba995f  ! 425: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3ba991f  ! 426: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xca52c01f  ! 427: LDSH_R	ldsh	[%r11 + %r31], %r5
	.word 0xcf9aa000  ! 428: LDDFA_I	ldda	[%r10, 0x0000], %f7
	.word 0xcfba997f  ! 429: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 430: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfba983f  ! 431: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba993f  ! 432: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 433: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd2c2a068  ! 434: LDSWA_I	ldswa	[%r10, + 0x0068] %asi, %r9
	.word 0xd3ba995f  ! 435: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd03a801f  ! 436: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd25ae050  ! 437: LDX_I	ldx	[%r11 + 0x0050], %r9
	.word 0xd3bad93f  ! 438: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 439: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd03ac01f  ! 440: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc302801f  ! 441: LDF_R	ld	[%r10, %r31], %f1
	.word 0xd292917f  ! 442: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r9
	.word 0xd3f2a01f  ! 443: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd19aa030  ! 444: LDDFA_I	ldda	[%r10, 0x0030], %f8
	.word 0xce92a00c  ! 445: LDUHA_I	lduha	[%r10, + 0x000c] %asi, %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcf02801f  ! 446: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcfba995f  ! 447: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 448: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcac2d05f  ! 449: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r5
	.word 0xc4d2a006  ! 450: LDSHA_I	ldsha	[%r10, + 0x0006] %asi, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5f2a01f  ! 451: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xca52a018  ! 452: LDSH_I	ldsh	[%r10 + 0x0018], %r5
	.word 0xc252c01f  ! 453: LDSH_R	ldsh	[%r11 + %r31], %r1
	.word 0xc3bad97f  ! 454: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad97f  ! 455: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3bad81f  ! 456: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd01aa030  ! 457: LDD_I	ldd	[%r10 + 0x0030], %r8
	.word 0xd3ba981f  ! 458: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcb9ae068  ! 459: LDDFA_I	ldda	[%r11, 0x0068], %f5
	.word 0xcbbad8bf  ! 460: STDFA_R	stda	%f5, [%r31, %r11]
TH_LABEL460:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbbad8bf  ! 461: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc302a010  ! 462: LDF_I	ld	[%r10, 0x0010], %f1
	.word 0xc3e2a01f  ! 463: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc4ca911f  ! 464: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r2
	.word 0xc40ac01f  ! 465: LDUB_R	ldub	[%r11 + %r31], %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc612c01f  ! 466: LDUH_R	lduh	[%r11 + %r31], %r3
	.word 0xc7bad87f  ! 467: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7f2e01f  ! 468: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad81f  ! 469: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad99f  ! 470: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc43ae010  ! 471: STD_I	std	%r2, [%r11 + 0x0010]
	.word 0xc84ae006  ! 472: LDSB_I	ldsb	[%r11 + 0x0006], %r4
	.word 0xc9e2e01f  ! 473: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2d03f  ! 474: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xc59aa028  ! 475: LDDFA_I	ldda	[%r10, 0x0028], %f2
TH_LABEL475:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc6da907f  ! 476: LDXA_R	ldxa	[%r10, %r31] 0x83, %r3
	.word 0xc43a801f  ! 477: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba991f  ! 478: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc79aa048  ! 479: LDDFA_I	ldda	[%r10, 0x0048], %f3
	.word 0xc7ba995f  ! 480: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xce4a801f  ! 481: LDSB_R	ldsb	[%r10 + %r31], %r7
	.word 0xcfba981f  ! 482: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc652a018  ! 483: LDSH_I	ldsh	[%r10 + 0x0018], %r3
	.word 0xc682913f  ! 484: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r3
	.word 0xc7f2a01f  ! 485: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7ba997f  ! 486: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 487: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xcb02e004  ! 488: LDF_I	ld	[%r11, 0x0004], %f5
	.word 0xceca901f  ! 489: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r7
	.word 0xcfba987f  ! 490: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd122c01f  ! 491: STF_R	st	%f8, [%r31, %r11]
	.word 0xc7baa020  ! 492: STDFA_I	stda	%f3, [0x0020, %r10]
	.word 0xc8caa057  ! 493: LDSBA_I	ldsba	[%r10, + 0x0057] %asi, %r4
	.word 0xc502801f  ! 494: LDF_R	ld	[%r10, %r31], %f2
	.word 0xd302c01f  ! 495: LDF_R	ld	[%r11, %r31], %f9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xce42a050  ! 496: LDSW_I	ldsw	[%r10 + 0x0050], %r7
	.word 0xc452a016  ! 497: LDSH_I	ldsh	[%r10 + 0x0016], %r2
	.word 0xc5e2913f  ! 498: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5ba985f  ! 499: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 500: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd19aa058  ! 501: LDDFA_I	ldda	[%r10, 0x0058], %f8
	.word 0xc2ca903f  ! 502: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r1
	.word 0xce12e07a  ! 503: LDUH_I	lduh	[%r11 + 0x007a], %r7
	.word 0xcfbad99f  ! 504: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d01f  ! 505: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfe2d03f  ! 506: CASA_I	casa	[%r11] 0x81, %r31, %r7
	.word 0xcfbad95f  ! 507: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc502801f  ! 508: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc5ba991f  ! 509: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 510: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL510:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5ba981f  ! 511: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba99bf  ! 512: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 513: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc64ae00c  ! 514: LDSB_I	ldsb	[%r11 + 0x000c], %r3
	.word 0xd042c01f  ! 515: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcadaa020  ! 516: LDXA_I	ldxa	[%r10, + 0x0020] %asi, %r5
	.word 0xc8cae06a  ! 517: LDSBA_I	ldsba	[%r11, + 0x006a] %asi, %r4
	.word 0xcc0ac01f  ! 518: LDUB_R	ldub	[%r11 + %r31], %r6
	.word 0xc842e024  ! 519: LDSW_I	ldsw	[%r11 + 0x0024], %r4
	.word 0xc9bad81f  ! 520: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd01aa068  ! 521: LDD_I	ldd	[%r10 + 0x0068], %r8
	.word 0xc9baa068  ! 522: STDFA_I	stda	%f4, [0x0068, %r10]
	.word 0xc83a801f  ! 523: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba983f  ! 524: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 525: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9f2a01f  ! 526: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xcfbae048  ! 527: STDFA_I	stda	%f7, [0x0048, %r11]
	.word 0xcfbae038  ! 528: STDFA_I	stda	%f7, [0x0038, %r11]
	.word 0xcdbaa040  ! 529: STDFA_I	stda	%f6, [0x0040, %r10]
	.word 0xcdba981f  ! 530: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdba991f  ! 531: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdbae008  ! 532: STDFA_I	stda	%f6, [0x0008, %r11]
	.word 0xcdbad97f  ! 533: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd282a02c  ! 534: LDUWA_I	lduwa	[%r10, + 0x002c] %asi, %r9
	.word 0xd03a801f  ! 535: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3e2901f  ! 536: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xc292e07c  ! 537: LDUHA_I	lduha	[%r11, + 0x007c] %asi, %r1
	.word 0xd052c01f  ! 538: LDSH_R	ldsh	[%r11 + %r31], %r8
	.word 0xd1bad97f  ! 539: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc852c01f  ! 540: LDSH_R	ldsh	[%r11 + %r31], %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9e2e01f  ! 541: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2e01f  ! 542: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xcedae008  ! 543: LDXA_I	ldxa	[%r11, + 0x0008] %asi, %r7
	.word 0xc6d2917f  ! 544: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r3
	.word 0xc7ba981f  ! 545: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc43aa008  ! 546: STD_I	std	%r2, [%r10 + 0x0008]
	.word 0xc7ba993f  ! 547: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 548: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd322c01f  ! 549: STF_R	st	%f9, [%r31, %r11]
	.word 0xd3bad8bf  ! 550: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3bad85f  ! 551: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae008  ! 552: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3bad8bf  ! 553: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae008  ! 554: STD_I	std	%r8, [%r11 + 0x0008]
	.word 0xd3e2e01f  ! 555: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd002a078  ! 556: LDUW_I	lduw	[%r10 + 0x0078], %r8
	.word 0xd1ba981f  ! 557: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc852e02c  ! 558: LDSH_I	ldsh	[%r11 + 0x002c], %r4
	.word 0xc83ae028  ! 559: STD_I	std	%r4, [%r11 + 0x0028]
	.word 0xc9bad91f  ! 560: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9bad9bf  ! 561: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 562: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad81f  ! 563: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcc8ae07c  ! 564: LDUBA_I	lduba	[%r11, + 0x007c] %asi, %r6
	.word 0xcde2d11f  ! 565: CASA_I	casa	[%r11] 0x88, %r31, %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc25a801f  ! 566: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xd09aa078  ! 567: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r8
	.word 0xd1e2903f  ! 568: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xc8da917f  ! 569: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r4
	.word 0xc9f2901f  ! 570: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc8aa045  ! 571: LDUBA_I	lduba	[%r10, + 0x0045] %asi, %r6
	.word 0xcdf2a01f  ! 572: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc7baa048  ! 573: STDFA_I	stda	%f3, [0x0048, %r10]
	.word 0xc7f2903f  ! 574: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba99bf  ! 575: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcec2905f  ! 576: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r7
	.word 0xcacaa015  ! 577: LDSBA_I	ldsba	[%r10, + 0x0015] %asi, %r5
	.word 0xc83aa010  ! 578: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xcbf2901f  ! 579: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbba981f  ! 580: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc83a801f  ! 581: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbe2a01f  ! 582: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc25ac01f  ! 583: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xc3bad81f  ! 584: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 585: STD_R	std	%r0, [%r11 + %r31]
TH_LABEL585:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc902a00c  ! 586: LDF_I	ld	[%r10, 0x000c], %f4
	.word 0xc83aa008  ! 587: STD_I	std	%r4, [%r10 + 0x0008]
	.word 0xc24a801f  ! 588: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xc03a801f  ! 589: STD_R	std	%r0, [%r10 + %r31]
	.word 0xcec2e02c  ! 590: LDSWA_I	ldswa	[%r11, + 0x002c] %asi, %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfbad95f  ! 591: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc45a801f  ! 592: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xc5f2a01f  ! 593: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xd102801f  ! 594: LDF_R	ld	[%r10, %r31], %f8
	.word 0xd1ba981f  ! 595: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03aa028  ! 596: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd1f2a01f  ! 597: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2903f  ! 598: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xd242a07c  ! 599: LDSW_I	ldsw	[%r10 + 0x007c], %r9
	.word 0xd3f2a01f  ! 600: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc02801f  ! 601: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xc502801f  ! 602: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc5e2a01f  ! 603: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2a01f  ! 604: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5ba98bf  ! 605: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL605:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc79aa028  ! 606: LDDFA_I	ldda	[%r10, 0x0028], %f3
	.word 0xcb22801f  ! 607: STF_R	st	%f5, [%r31, %r10]
	.word 0xcbba991f  ! 608: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 609: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xd01ae068  ! 610: LDD_I	ldd	[%r11 + 0x0068], %r8
TH_LABEL610:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd042e040  ! 611: LDSW_I	ldsw	[%r11 + 0x0040], %r8
	.word 0xd1bad99f  ! 612: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad97f  ! 613: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad87f  ! 614: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d03f  ! 615: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1bad91f  ! 616: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad83f  ! 617: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd19ae000  ! 618: LDDFA_I	ldda	[%r11, 0x0000], %f8
	.word 0xd1bad85f  ! 619: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2e01f  ! 620: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd01a801f  ! 621: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xd28aa03e  ! 622: LDUBA_I	lduba	[%r10, + 0x003e] %asi, %r9
	.word 0xc8ca915f  ! 623: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r4
	.word 0xcbbaa070  ! 624: STDFA_I	stda	%f5, [0x0070, %r10]
	.word 0xc7baa018  ! 625: STDFA_I	stda	%f3, [0x0018, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xca8ad03f  ! 626: LDUBA_R	lduba	[%r11, %r31] 0x81, %r5
	.word 0xcbbad89f  ! 627: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad93f  ! 628: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad8bf  ! 629: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad93f  ! 630: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbbad95f  ! 631: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 632: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xcbf2d01f  ! 633: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbbad95f  ! 634: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 635: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc83ac01f  ! 636: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad91f  ! 637: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad95f  ! 638: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 639: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xca12a068  ! 640: LDUH_I	lduh	[%r10 + 0x0068], %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbf2a01f  ! 641: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba99bf  ! 642: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 643: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba991f  ! 644: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc85aa048  ! 645: LDX_I	ldx	[%r10 + 0x0048], %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9ba995f  ! 646: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc4aa074  ! 647: LDSB_I	ldsb	[%r10 + 0x0074], %r6
	.word 0xcdba993f  ! 648: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba987f  ! 649: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc1ae058  ! 650: LDD_I	ldd	[%r11 + 0x0058], %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc01a801f  ! 651: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xc3ba983f  ! 652: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 653: STD_R	std	%r0, [%r10 + %r31]
	.word 0xc2ca907f  ! 654: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r1
	.word 0xc3f2a01f  ! 655: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc24a801f  ! 656: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xc3ba997f  ! 657: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 658: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba995f  ! 659: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2901f  ! 660: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc64aa030  ! 661: LDSB_I	ldsb	[%r10 + 0x0030], %r3
	.word 0xcf02a00c  ! 662: LDF_I	ld	[%r10, 0x000c], %f7
	.word 0xcfe2903f  ! 663: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcc3a801f  ! 664: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc3a801f  ! 665: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfbae050  ! 666: STDFA_I	stda	%f7, [0x0050, %r11]
	.word 0xcfbad93f  ! 667: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad87f  ! 668: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d01f  ! 669: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xcc02a05c  ! 670: LDUW_I	lduw	[%r10 + 0x005c], %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xca02801f  ! 671: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xcbba989f  ! 672: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba991f  ! 673: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcdbaa038  ! 674: STDFA_I	stda	%f6, [0x0038, %r10]
	.word 0xc68a901f  ! 675: LDUBA_R	lduba	[%r10, %r31] 0x80, %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7e2a01f  ! 676: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc6daa040  ! 677: LDXA_I	ldxa	[%r10, + 0x0040] %asi, %r3
	.word 0xc43a801f  ! 678: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7ba981f  ! 679: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 680: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd302801f  ! 681: LDF_R	ld	[%r10, %r31], %f9
	.word 0xcd02c01f  ! 682: LDF_R	ld	[%r11, %r31], %f6
	.word 0xcdf2e01f  ! 683: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xcdbad93f  ! 684: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ae040  ! 685: STD_I	std	%r6, [%r11 + 0x0040]
TH_LABEL685:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdbad91f  ! 686: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd39ae060  ! 687: LDDFA_I	ldda	[%r11, 0x0060], %f9
	.word 0xc722801f  ! 688: STF_R	st	%f3, [%r31, %r10]
	.word 0xc7ba985f  ! 689: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 690: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL690:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd0d2901f  ! 691: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r8
	.word 0xce82a074  ! 692: LDUWA_I	lduwa	[%r10, + 0x0074] %asi, %r7
	.word 0xcb02a000  ! 693: LDF_I	ld	[%r10, 0x0000], %f5
	.word 0xc83aa000  ! 694: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xce92a064  ! 695: LDUHA_I	lduha	[%r10, + 0x0064] %asi, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfba995f  ! 696: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc242e000  ! 697: LDSW_I	ldsw	[%r11 + 0x0000], %r1
	.word 0xc3bad81f  ! 698: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcadae060  ! 699: LDXA_I	ldxa	[%r11, + 0x0060] %asi, %r5
	.word 0xd2da917f  ! 700: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3e2913f  ! 701: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba99bf  ! 702: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 703: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcac2e038  ! 704: LDSWA_I	ldswa	[%r11, + 0x0038] %asi, %r5
	.word 0xcbbad97f  ! 705: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc4c2a058  ! 706: LDSWA_I	ldswa	[%r10, + 0x0058] %asi, %r2
	.word 0xc5ba995f  ! 707: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 708: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc2d2a010  ! 709: LDSHA_I	ldsha	[%r10, + 0x0010] %asi, %r1
	.word 0xc3e2a01f  ! 710: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc03aa010  ! 711: STD_I	std	%r0, [%r10 + 0x0010]
	.word 0xc3ba993f  ! 712: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba983f  ! 713: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc45ae030  ! 714: LDX_I	ldx	[%r11 + 0x0030], %r2
	.word 0xd1baa078  ! 715: STDFA_I	stda	%f8, [0x0078, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1f2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba997f  ! 717: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba991f  ! 718: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 719: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc45a801f  ! 720: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5ba98bf  ! 721: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2901f  ! 722: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xd09ae068  ! 723: LDDA_I	ldda	[%r11, + 0x0068] %asi, %r8
	.word 0xc202e024  ! 724: LDUW_I	lduw	[%r11 + 0x0024], %r1
	.word 0xca42e024  ! 725: LDSW_I	ldsw	[%r11 + 0x0024], %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbbad99f  ! 726: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad93f  ! 727: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad99f  ! 728: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd212a070  ! 729: LDUH_I	lduh	[%r10 + 0x0070], %r9
	.word 0xd3f2a01f  ! 730: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3e2a01f  ! 731: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd01a801f  ! 732: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xcc9ae070  ! 733: LDDA_I	ldda	[%r11, + 0x0070] %asi, %r6
	.word 0xcf02a00c  ! 734: LDF_I	ld	[%r10, 0x000c], %f7
	.word 0xcc3aa008  ! 735: STD_I	std	%r6, [%r10 + 0x0008]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfe2a01f  ! 736: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc242e010  ! 737: LDSW_I	ldsw	[%r11 + 0x0010], %r1
	.word 0xc522801f  ! 738: STF_R	st	%f2, [%r31, %r10]
	.word 0xd012801f  ! 739: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xd1f2913f  ! 740: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1ba989f  ! 741: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd2c2a020  ! 742: LDSWA_I	ldswa	[%r10, + 0x0020] %asi, %r9
	.word 0xca8ae073  ! 743: LDUBA_I	lduba	[%r11, + 0x0073] %asi, %r5
	.word 0xc83ac01f  ! 744: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbe2d01f  ! 745: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbbad9bf  ! 746: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad83f  ! 747: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc302c01f  ! 748: LDF_R	ld	[%r11, %r31], %f1
	.word 0xc3bad93f  ! 749: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd302a004  ! 750: LDF_I	ld	[%r10, 0x0004], %f9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd042801f  ! 751: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xd1f2a01f  ! 752: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1f2a01f  ! 753: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd03aa000  ! 754: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xc85ac01f  ! 755: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9f2d01f  ! 756: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xce92e078  ! 757: LDUHA_I	lduha	[%r11, + 0x0078] %asi, %r7
	.word 0xcfbad93f  ! 758: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcd02a00c  ! 759: LDF_I	ld	[%r10, 0x000c], %f6
	.word 0xcdba989f  ! 760: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL760:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcdba98bf  ! 761: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcde2903f  ! 762: CASA_I	casa	[%r10] 0x81, %r31, %r6
	.word 0xc842c01f  ! 763: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xc9e2d11f  ! 764: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xd19aa068  ! 765: LDDFA_I	ldda	[%r10, 0x0068], %f8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1e2a01f  ! 766: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1e2a01f  ! 767: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 768: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc812e02e  ! 769: LDUH_I	lduh	[%r11 + 0x002e], %r4
	.word 0xc9bad99f  ! 770: STDFA_R	stda	%f4, [%r31, %r11]
TH_LABEL770:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9bad95f  ! 771: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc852a058  ! 772: LDSH_I	ldsh	[%r10 + 0x0058], %r4
	.word 0xd102c01f  ! 773: LDF_R	ld	[%r11, %r31], %f8
	.word 0xd0ca911f  ! 774: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r8
	.word 0xd1f2913f  ! 775: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd03aa058  ! 776: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xcfbae040  ! 777: STDFA_I	stda	%f7, [0x0040, %r11]
	.word 0xc60a801f  ! 778: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xc7ba98bf  ! 779: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 780: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7ba981f  ! 781: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba985f  ! 782: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2911f  ! 783: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba991f  ! 784: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd1baa020  ! 785: STDFA_I	stda	%f8, [0x0020, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9bae050  ! 786: STDFA_I	stda	%f4, [0x0050, %r11]
	.word 0xc9bad89f  ! 787: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 788: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc83ac01f  ! 789: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc292d15f  ! 790: LDUHA_R	lduha	[%r11, %r31] 0x8a, %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc722801f  ! 791: STF_R	st	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 792: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc2c2a068  ! 793: LDSWA_I	ldswa	[%r10, + 0x0068] %asi, %r1
	.word 0xc3e2a01f  ! 794: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xcbbae018  ! 795: STDFA_I	stda	%f5, [0x0018, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xce4aa071  ! 796: LDSB_I	ldsb	[%r10 + 0x0071], %r7
	.word 0xcfba983f  ! 797: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba99bf  ! 798: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc49aa058  ! 799: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r2
	.word 0xc2cae04a  ! 800: LDSBA_I	ldsba	[%r11, + 0x004a] %asi, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3f2d01f  ! 801: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc652c01f  ! 802: LDSH_R	ldsh	[%r11 + %r31], %r3
	.word 0xc43ae048  ! 803: STD_I	std	%r2, [%r11 + 0x0048]
	.word 0xc8da901f  ! 804: LDXA_R	ldxa	[%r10, %r31] 0x80, %r4
	.word 0xcc92e05e  ! 805: LDUHA_I	lduha	[%r11, + 0x005e] %asi, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcde2e01f  ! 806: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xc9baa038  ! 807: STDFA_I	stda	%f4, [0x0038, %r10]
	.word 0xc9f2901f  ! 808: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9e2901f  ! 809: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9e2a01f  ! 810: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9f2a01f  ! 811: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc612a044  ! 812: LDUH_I	lduh	[%r10 + 0x0044], %r3
	.word 0xd2d2e004  ! 813: LDSHA_I	ldsha	[%r11, + 0x0004] %asi, %r9
	.word 0xd002c01f  ! 814: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xd1bad83f  ! 815: STDFA_R	stda	%f8, [%r31, %r11]
TH_LABEL815:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1bad9bf  ! 816: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1e2d13f  ! 817: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xcf22801f  ! 818: STF_R	st	%f7, [%r31, %r10]
	.word 0xca52a008  ! 819: LDSH_I	ldsh	[%r10 + 0x0008], %r5
	.word 0xc452a062  ! 820: LDSH_I	ldsh	[%r10 + 0x0062], %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc43aa060  ! 821: STD_I	std	%r2, [%r10 + 0x0060]
	.word 0xc81aa028  ! 822: LDD_I	ldd	[%r10 + 0x0028], %r4
	.word 0xc2c2903f  ! 823: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r1
	.word 0xc3ba981f  ! 824: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 825: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd01aa020  ! 826: LDD_I	ldd	[%r10 + 0x0020], %r8
	.word 0xd1f2a01f  ! 827: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xced2a052  ! 828: LDSHA_I	ldsha	[%r10, + 0x0052] %asi, %r7
	.word 0xcc3aa050  ! 829: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xcff2913f  ! 830: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfba981f  ! 831: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 832: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd242a07c  ! 833: LDSW_I	ldsw	[%r10 + 0x007c], %r9
	.word 0xd3ba98bf  ! 834: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcacae07c  ! 835: LDSBA_I	ldsba	[%r11, + 0x007c] %asi, %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd012801f  ! 836: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xc922801f  ! 837: STF_R	st	%f4, [%r31, %r10]
	.word 0xcc52c01f  ! 838: LDSH_R	ldsh	[%r11 + %r31], %r6
	.word 0xcdbad8bf  ! 839: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc652801f  ! 840: LDSH_R	ldsh	[%r10 + %r31], %r3
TH_LABEL840:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd08aa003  ! 841: LDUBA_I	lduba	[%r10, + 0x0003] %asi, %r8
	.word 0xd1ba981f  ! 842: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcb9aa048  ! 843: LDDFA_I	ldda	[%r10, 0x0048], %f5
	.word 0xcbba985f  ! 844: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc242a00c  ! 845: LDSW_I	ldsw	[%r10 + 0x000c], %r1
TH_LABEL845:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdbaa048  ! 846: STDFA_I	stda	%f6, [0x0048, %r10]
	.word 0xc692a078  ! 847: LDUHA_I	lduha	[%r10, + 0x0078] %asi, %r3
	.word 0xcc52801f  ! 848: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xcdba993f  ! 849: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd28ad01f  ! 850: LDUBA_R	lduba	[%r11, %r31] 0x80, %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3e2d03f  ! 851: CASA_I	casa	[%r11] 0x81, %r31, %r9
	.word 0xc6d2e008  ! 852: LDSHA_I	ldsha	[%r11, + 0x0008] %asi, %r3
	.word 0xd122801f  ! 853: STF_R	st	%f8, [%r31, %r10]
	.word 0xd1e2901f  ! 854: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc722c01f  ! 855: STF_R	st	%f3, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc43ae008  ! 856: STD_I	std	%r2, [%r11 + 0x0008]
	.word 0xc24ac01f  ! 857: LDSB_R	ldsb	[%r11 + %r31], %r1
	.word 0xc3bad95f  ! 858: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad87f  ! 859: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xce82911f  ! 860: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfba985f  ! 861: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 862: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd302e060  ! 863: LDF_I	ld	[%r11, 0x0060], %f9
	.word 0xd25a801f  ! 864: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xd3ba983f  ! 865: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3ba993f  ! 866: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 867: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 868: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba98bf  ! 869: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 870: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc612a014  ! 871: LDUH_I	lduh	[%r10 + 0x0014], %r3
	.word 0xc7ba983f  ! 872: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 873: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xd0caa04e  ! 874: LDSBA_I	ldsba	[%r10, + 0x004e] %asi, %r8
	.word 0xd1ba999f  ! 875: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcd02e018  ! 876: LDF_I	ld	[%r11, 0x0018], %f6
	.word 0xcdf2e01f  ! 877: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xc8d2905f  ! 878: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r4
	.word 0xcf9aa000  ! 879: LDDFA_I	ldda	[%r10, 0x0000], %f7
	.word 0xd08aa03d  ! 880: LDUBA_I	lduba	[%r10, + 0x003d] %asi, %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc20a801f  ! 881: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xc3ba983f  ! 882: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 883: STD_R	std	%r0, [%r10 + %r31]
	.word 0xd302801f  ! 884: LDF_R	ld	[%r10, %r31], %f9
	.word 0xcc1a801f  ! 885: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xca02c01f  ! 886: LDUW_R	lduw	[%r11 + %r31], %r5
	.word 0xcbbad8bf  ! 887: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2e01f  ! 888: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xd122c01f  ! 889: STF_R	st	%f8, [%r31, %r11]
	.word 0xc9baa040  ! 890: STDFA_I	stda	%f4, [0x0040, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9f2901f  ! 891: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc89aa070  ! 892: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r4
	.word 0xd09aa040  ! 893: LDDA_I	ldda	[%r10, + 0x0040] %asi, %r8
	.word 0xd1f2a01f  ! 894: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba999f  ! 895: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc12a032  ! 896: LDUH_I	lduh	[%r10 + 0x0032], %r6
	.word 0xc8d2a00e  ! 897: LDSHA_I	ldsha	[%r10, + 0x000e] %asi, %r4
	.word 0xd0c2a050  ! 898: LDSWA_I	ldswa	[%r10, + 0x0050] %asi, %r8
	.word 0xd1ba98bf  ! 899: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc682a014  ! 900: LDUWA_I	lduwa	[%r10, + 0x0014] %asi, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcb9aa068  ! 901: LDDFA_I	ldda	[%r10, 0x0068], %f5
	.word 0xce82a018  ! 902: LDUWA_I	lduwa	[%r10, + 0x0018] %asi, %r7
	.word 0xcc9ae030  ! 903: LDDA_I	ldda	[%r11, + 0x0030] %asi, %r6
	.word 0xcfbad89f  ! 904: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc60ac01f  ! 905: LDUB_R	ldub	[%r11 + %r31], %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd212801f  ! 906: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xc6ca907f  ! 907: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r3
	.word 0xc7e2911f  ! 908: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba997f  ! 909: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa030  ! 910: STD_I	std	%r2, [%r10 + 0x0030]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcb9aa050  ! 911: LDDFA_I	ldda	[%r10, 0x0050], %f5
	.word 0xcbba98bf  ! 912: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 913: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcd22c01f  ! 914: STF_R	st	%f6, [%r31, %r11]
	.word 0xcc3ae050  ! 915: STD_I	std	%r6, [%r11 + 0x0050]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdbad93f  ! 916: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd042c01f  ! 917: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xd1e2e01f  ! 918: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd1bad81f  ! 919: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcac2a028  ! 920: LDSWA_I	ldswa	[%r10, + 0x0028] %asi, %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbba995f  ! 921: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba999f  ! 922: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 923: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba999f  ! 924: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa028  ! 925: STD_I	std	%r4, [%r10 + 0x0028]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbba981f  ! 926: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc81aa020  ! 927: LDD_I	ldd	[%r10 + 0x0020], %r4
	.word 0xc9ba985f  ! 928: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd302801f  ! 929: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd012801f  ! 930: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc452801f  ! 931: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xcc9aa040  ! 932: LDDA_I	ldda	[%r10, + 0x0040] %asi, %r6
	.word 0xcd9ae068  ! 933: LDDFA_I	ldda	[%r11, 0x0068], %f6
	.word 0xcde2d11f  ! 934: CASA_I	casa	[%r11] 0x88, %r31, %r6
	.word 0xc502a000  ! 935: LDF_I	ld	[%r10, 0x0000], %f2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5f2a01f  ! 936: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc43a801f  ! 937: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba999f  ! 938: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xca42801f  ! 939: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xcbba981f  ! 940: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbf2a01f  ! 941: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xc692a032  ! 942: LDUHA_I	lduha	[%r10, + 0x0032] %asi, %r3
	.word 0xd302e030  ! 943: LDF_I	ld	[%r11, 0x0030], %f9
	.word 0xd3bad81f  ! 944: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2d13f  ! 945: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3bad95f  ! 946: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd102e07c  ! 947: LDF_I	ld	[%r11, 0x007c], %f8
	.word 0xd1bad89f  ! 948: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcccaa025  ! 949: LDSBA_I	ldsba	[%r10, + 0x0025] %asi, %r6
	.word 0xcdba993f  ! 950: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL950:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd282e04c  ! 951: LDUWA_I	lduwa	[%r11, + 0x004c] %asi, %r9
	.word 0xca52c01f  ! 952: LDSH_R	ldsh	[%r11 + %r31], %r5
	.word 0xce42a010  ! 953: LDSW_I	ldsw	[%r10 + 0x0010], %r7
	.word 0xcfe2903f  ! 954: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcff2901f  ! 955: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfe2901f  ! 956: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcfba997f  ! 957: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa010  ! 958: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcfba993f  ! 959: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc5baa028  ! 960: STDFA_I	stda	%f2, [0x0028, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd05a801f  ! 961: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xd1ba987f  ! 962: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc242a04c  ! 963: LDSW_I	ldsw	[%r10 + 0x004c], %r1
	.word 0xc3ba997f  ! 964: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xca0ae038  ! 965: LDUB_I	ldub	[%r11 + 0x0038], %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc1a801f  ! 966: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xcfba985f  ! 967: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa038  ! 968: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcc3aa038  ! 969: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcc3a801f  ! 970: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc24a801f  ! 971: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xc84a801f  ! 972: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xd0c2e010  ! 973: LDSWA_I	ldswa	[%r11, + 0x0010] %asi, %r8
	.word 0xd1bad85f  ! 974: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad9bf  ! 975: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc48aa06d  ! 976: LDUBA_I	lduba	[%r10, + 0x006d] %asi, %r2
	.word 0xc4ca901f  ! 977: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r2
	.word 0xd28aa05f  ! 978: LDUBA_I	lduba	[%r10, + 0x005f] %asi, %r9
	.word 0xd3e2a01f  ! 979: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba981f  ! 980: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd03aa058  ! 981: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3e2a01f  ! 982: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc302c01f  ! 983: LDF_R	ld	[%r11, %r31], %f1
	.word 0xc292a05e  ! 984: LDUHA_I	lduha	[%r10, + 0x005e] %asi, %r1
	.word 0xca42801f  ! 985: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd202a05c  ! 986: LDUW_I	lduw	[%r10 + 0x005c], %r9
	.word 0xc20ae031  ! 987: LDUB_I	ldub	[%r11 + 0x0031], %r1
	.word 0xcd9aa058  ! 988: LDDFA_I	ldda	[%r10, 0x0058], %f6
	.word 0xc4dae010  ! 989: LDXA_I	ldxa	[%r11, + 0x0010] %asi, %r2
	.word 0xc5bad95f  ! 990: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5bad93f  ! 991: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc292915f  ! 992: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r1
	.word 0xc722801f  ! 993: STF_R	st	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 994: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd322801f  ! 995: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3f2a01f  ! 996: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xce8a911f  ! 997: LDUBA_R	lduba	[%r10, %r31] 0x88, %r7
	.word 0xcfba981f  ! 998: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xceca907f  ! 999: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r7
	.word 0xcd02801f  ! 1000: LDF_R	ld	[%r10, %r31], %f6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
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
.xword 0x7bc564f1c893377f
.xword 0x161023ca56fd93eb
.xword 0xaf0e36f06aa068b5
.xword 0x70a1a9c90264b11e
.xword 0x51b1ea39d77d005e
.xword 0xa6320a6f90f02d63
.xword 0x59cfc359e10dff30
.xword 0xdb9c5d80d4a8a954
.xword 0x424be4c81a2ee8e1
.xword 0x2b2427f97b4d5600
.xword 0xbc6b20a4a4c0745a
.xword 0xda8aca8099cbd787
.xword 0x757f0828a60450af
.xword 0xcb3c92d99932b795
.xword 0x6ac1ac3e90846ab8
.xword 0xb8f9542c3620ff3c
.xword 0xd0625f4acda3bf3a
.xword 0x0a080f6c7d86dcdb
.xword 0x97340289ab6725e0
.xword 0x5a63ee30c84c0072
.xword 0x1876096aefed8c63
.xword 0x0495a9aeb2ecde37
.xword 0xd59ac98be384ca47
.xword 0x389a94bfb572a432
.xword 0xd5c3600c95b0cbd8
.xword 0xcf95b78f7e40d477
.xword 0xebf3180fe1320b89
.xword 0x998fd6f9401cf944
.xword 0xf4540618c83f2eec
.xword 0xc2b782804d6dcf29
.xword 0x9e989f329b58db61
.xword 0x8410c53469a819bf



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
.xword 0x8f462b9616196777

.xword 0x895d6be6834f7d65

.xword 0x3779083e3bdc369e

.xword 0xd6c95677e2df83df

.xword 0x0146c4a114b99f92

.xword 0x0e865caef388224b

.xword 0xa23ad22be3de5786

.xword 0x358c3ff54b3f8560

.xword 0x9938623b8ac6428e

.xword 0xb9b1fa04856a5fb7

.xword 0x1ede02984c4b72a5

.xword 0xd9a55c289cfb0804

.xword 0xeb363be16a5fb09e

.xword 0x7bb6d1172b32f14d

.xword 0x530aeeb6566ffe15

.xword 0x6295660897a6431e

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
.xword 0xddc84f072789ea6b
.xword 0xaa95aabe6a24421a
.xword 0xc8be770ec6664f40
.xword 0x7e2d7d7c345fe2fa
.xword 0x6c87fcac9f3d549d
.xword 0xf8a76ed2aabece08
.xword 0xeb970afde483b28a
.xword 0xf3b7ee9ec2832f77
.xword 0x4b6e46611d07231f




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
.xword 0xc72f8cf35dc0b180
.xword 0xbf5d3fd740305edc
.xword 0xffb55fd8dca5df14
.xword 0xa074884fe71cf1c2
.xword 0x3954550fb56aad31
.xword 0xfff823b1a115dfcb
.xword 0xc73cbfcd1793c33a
.xword 0x235cd8b34f8b6a12
.xword 0xbbd9cb239388a854




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
.xword 0xb69e625944467c42
.xword 0xe783968a98574cfc
.xword 0x20a8813769b92602
.xword 0x5d9285426cf35497
.xword 0xf85c7b80522edc2a
.xword 0xa08d6dbf6082b4e9
.xword 0x619d87b7cc02bc34
.xword 0x6922a667511f6752
.xword 0xda5d2d7acfbdd093




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
.xword 0x21505962b40b4eaa
.xword 0x78e0fa76b7150118
.xword 0xf9ae2b1537e0cc6d
.xword 0x23826a1ff19966fe
.xword 0xb21bc75be6773e0d
.xword 0xc7231f5341a00578
.xword 0xccdfb5124174c10b
.xword 0xc28376fffea80657
.xword 0xf5a2d2e60461091b




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
.xword 0x3b72b04ae7605a83
.xword 0xb65c3e3264eacc6a
.xword 0x24205094c2b85934
.xword 0x5ac32c4ca31c5a88
.xword 0x62c3319968974855
.xword 0x6846af2e473b134f
.xword 0xc162beef5365a1f5
.xword 0x9138c4bdc025ccfb
.xword 0x4715a415a0903d26




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
.xword 0x1b10dfd534327161
.xword 0x3bcbcfcfa3499816
.xword 0xc6ee5657aecf32f6
.xword 0x1cd4c99b43b90390
.xword 0xb59ddb270cfffeb8
.xword 0x31c2f5568900d0bf
.xword 0x5c27bde6e19b7f76
.xword 0x781decb1341cb1ae
.xword 0x66f2706845ba99e6




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
.xword 0xa67b8e16ea797e93
.xword 0x998e7995eabf63b5
.xword 0xb91d5c4078b1bb90
.xword 0x6ed98379dbf195f1
.xword 0x16ed57eb9fbb465d
.xword 0xb2bed64bccac0dba
.xword 0x51caedb8009c57c0
.xword 0x1458a1c8f91c9692
.xword 0x95ffe5ed7f7dd1b3






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
.xword 0x5e50af38e91e15bb

.xword 0x2b75796d5b875df1

.xword 0xc7da5da1528baab0

.xword 0x55838b00a1cb7a7d

.xword 0x91bb5855655e2620

.xword 0xee0be2640553b149

.xword 0x626d2163f87b237b

.xword 0xb8273503453f506e

.xword 0x6014ae49359b88ab

.xword 0x5a4ee8c0c77f169f

.xword 0x7ef9e4d002351505

.xword 0x388cf31d0a5b886b

.xword 0xe1dc4baac7250ee0

.xword 0xe9bd9ba1d0395a5a

.xword 0x0ac773f343babfe1

.xword 0x4b9bf598cd1c7283




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
.xword 0x09c02bb7e5ca361e
.xword 0x4a523d7741f2ee99
.xword 0x8e5e4d8446aeafd6
.xword 0xd270b87a0d38949b
.xword 0xbca904cb2f3ad522
.xword 0x662b206509097158
.xword 0x0ad1080d228869b8
.xword 0xf7f6a9714eac6195



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
.xword 0x4c1ce4a018ad8510
.xword 0xf117629a8ad1063d
.xword 0x4b77645ab3137d84
.xword 0x18dd4f4e9cdd697e
.xword 0x5fc2d1f5659b92a4
.xword 0x12acde03c4baac76
.xword 0x826ed62e69997d43
.xword 0x676911e8d9d4f8bd



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
.xword 0x74558dd9b234a882
.xword 0x418eea7f629f2b62
.xword 0x577514c33b13a1e5
.xword 0x7e1c8330617c3e09
.xword 0x5ac6cb101f5f16c9
.xword 0x5c0a026f348e6c29
.xword 0xad5e8d6a9031f72a
.xword 0x0627c90001bd2f77



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
.xword 0x7780c297f5c7821c
.xword 0x81867a5cb582584d
.xword 0xde1d9d70e69fda57
.xword 0xced01bd85dd1c49a
.xword 0x8aaee6412e97c615
.xword 0xc7eaea5a874adf05
.xword 0x4e22f2d7b2355a9c
.xword 0xede9ee8990121c9e



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
.xword 0xb9c557e2c51b93fb
.xword 0x1c50dda31397a4de
.xword 0x786ede86d4608a13
.xword 0xd0a2317c00bf9e1e
.xword 0xd2aae18e9dadcc61
.xword 0x44c576c3ebcb68ee
.xword 0x0b0bda2bbb9029c8
.xword 0xd345ce1e1f5e3ebd



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
.xword 0xa1040f64ae2f2e41
.xword 0x0f4c368240fdb48e
.xword 0x5bbce02e4a4c6288
.xword 0x4a05c36f9d79ce53
.xword 0xe3947a5c97097509
.xword 0xdac732e6f5c7cd1b
.xword 0xd33587127f39e848
.xword 0xea74aab29576b19e



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
.xword 0x93d719279ce3fe82
.xword 0xa60ed6fd8ce5a9a2
.xword 0x004d6b12eb68585a
.xword 0x37d78fe0333d612d
.xword 0x86a0ba314f4b6ad6
.xword 0x8391c5e2c766df86
.xword 0x37f2600feb0476f0
.xword 0x88258b4eeaaa1760





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
.xword 0x44a50d02ea9c3ad7

.xword 0xc2d0fad27eadd115

.xword 0xd0732cbf5262ccb2

.xword 0x4d12fa537d2564d7

.xword 0xe589b2b0f1859108

.xword 0x2590b22a8571d1d7

.xword 0x687ed3675a3a3b28

.xword 0xb2b5ac4cfbd93f0c

.xword 0x67f6f40c06f6149c

.xword 0x05dc0a492bdac62d

.xword 0x250514eab71b0e0e

.xword 0x12bfdc202bdb69d3

.xword 0xb2812da9162f7fbb

.xword 0xed8532b266985821

.xword 0x5f192e9c41b89d90

.xword 0x0df2b31da1c135f9

.xword 0xb638277497b5bb48

.xword 0x47274fef99356162

.xword 0xcec8a23e605fb2b0

.xword 0x6d2f5690f25b9fba

.xword 0xe68ece5f5bd8aefb

.xword 0x7c95017eae30a799

.xword 0x567cf9ee5382ece3

.xword 0x8c9be4ec77850214

.xword 0xb1090f4507783b31

.xword 0x6962212d9e56239a

.xword 0xf5f4cc828546ffbc

.xword 0x00a3ed3dd13f1e20

.xword 0x75a09e1ab93c7275

.xword 0xf07983cca4863b88

.xword 0x9af1399c431eca6b

.xword 0xec1108476170ae4d

.xword 0x1914285262c0008b

.xword 0x2e723c9d90fa38a5

.xword 0xd5159672cc35a9cc

.xword 0xed15ce5ca3106f54

.xword 0xadb7f274136ea95b

.xword 0x474b3de779458548

.xword 0x8f017ff43afbc04c

.xword 0x35b9b0bfdae1c195

.xword 0x58934b9d5b60b212

.xword 0x8ed1850f3319253f

.xword 0x8d028add4555623d

.xword 0xc0fef6f2d157310f

.xword 0x8c28b9fa580b6d86

.xword 0xbbb0a94d1e036050

.xword 0x752d155c9387f1bb

.xword 0x55bae141a959bb55

.xword 0xf9ea85c6f74b574e

.xword 0xf6ad756ebc76387d

.xword 0xea210d018dfb7580

.xword 0x3eae9b9dbe8806d2

.xword 0x3f8fa67598690415

.xword 0xe7818b49335588a4

.xword 0x88bd50eda57c75fd

.xword 0xe3fd4c6bb9fd27ec

.xword 0x2cd058dd93937aa2

.xword 0x6510ec6c6ee4c02c

.xword 0x016527b5c7e7b6ba

.xword 0x9706b68d98b79ac6

.xword 0xc8dab480d45ad83c

.xword 0xe8f0938d1c7b71e4

.xword 0xc447214d5d7f94b0

.xword 0x5ee6db410124c29f

.xword 0xa384a82c58774bf3

.xword 0xf8a3ac83c1826777

.xword 0x179d3cb99ab5ae5b

.xword 0xc1f44425a50ff269

.xword 0x0e654f29a081766c

.xword 0x70f83a0ad8367b25

.xword 0x87fe4fbdb4d00f1f

.xword 0x8e94ac4f8cdcf5de

.xword 0x6132dfb6f96d02d6

.xword 0x2bab081732f62ebf

.xword 0x7143313ec6461efe

.xword 0x390e6efecfffdb02

.xword 0x0c28974ef6ee50a2

.xword 0xa027a6c8b1f72e8c

.xword 0x0df87c2849a36b30

.xword 0x3d5bf05887e6b787

.xword 0x7f2aa525fe7dac93

.xword 0xb6636d6d015fdcc4

.xword 0xecf77b1ced8d0d3f

.xword 0x7f2368eaf986a5c8

.xword 0x90a379703589e73e

.xword 0x8461ee2ed9417ffa

.xword 0xf324eb35259c4dee

.xword 0xfef7b718edeb1904

.xword 0xbd21a1e719ac9d07

.xword 0xdd4e305303ad3e3c

.xword 0xb05abc7f93a63dab

.xword 0xe9a73c2e96e6721b

.xword 0x750876d163760416

.xword 0x2c524cf795f06108

.xword 0x17ebdc7495436828

.xword 0x4f3fab0912670948

.xword 0x4787aac8aac5fdee

.xword 0xa8bbd4d6950afcc5

.xword 0xba7317ce5064601b

.xword 0x38b56f7e6d1fa65a

.xword 0x427021188f4e5d20

.xword 0x791427605c024d95

.xword 0xdd9e062555a12a33

.xword 0xe5ca8457e8606274

.xword 0x26a1d79b8db429dd

.xword 0x276888f34feaa1d3

.xword 0x4a9e541018da0c72

.xword 0xd6a7a4819c8a5109

.xword 0x6c4c3424dad0f68d

.xword 0xbe04490e4467263c

.xword 0xbbc0f13f64e7927f

.xword 0x4d4d46d876622b2a

.xword 0x5d7d2fdd8349fe39

.xword 0x0bbb6aa2cd901bb9

.xword 0xcf9be1f557f6840f

.xword 0xfe93fb0b82ef1bdf

.xword 0x9e52e2ae552dd23a

.xword 0xc7b83e88cb625e21

.xword 0x314aa8b0718fcff5

.xword 0x8f4d9e60a622ef9b

.xword 0x6a1d8fcd2ae68066

.xword 0x16e27ab1195cd9ed

.xword 0x743b61e08683e6af

.xword 0x7566ebe270721f4f

.xword 0xb5eb4f280015a656

.xword 0xd1090315332c8cd1

.xword 0x1a4b5eb9782c1cba

.xword 0xdea032ed48252e2b

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
