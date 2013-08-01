/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: lsu_casa_std_pst1.s
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
	setx 0x5f45a3ce8ba321fd, %g1, %r2
	setx 0x8f27707d923354d4, %g1, %r3
	setx 0x29d8ee0ec0831b68, %g1, %r4
	setx 0xaa1d1c024df47bb5, %g1, %r5
	setx 0xad38b8592acec50f, %g1, %r6
	setx 0x67361ff9bba98160, %g1, %r7
	setx 0x9b67985a569c6b6e, %g1, %r8

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
	.word 0xc5ba997f  ! 1: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd282a008  ! 2: LDUWA_I	lduwa	[%r10, + 0x0008] %asi, %r9
	.word 0xcc02e044  ! 3: LDUW_I	lduw	[%r11 + 0x0044], %r6
	.word 0xc85a801f  ! 4: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xcde2e01f  ! 5: CASA_R	casa	[%r11] %asi, %r31, %r6
TH_LABEL5:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdbad95f  ! 6: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd2d2917f  ! 7: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r9
	.word 0xc9e2901f  ! 8: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc442a000  ! 9: LDSW_I	ldsw	[%r10 + 0x0000], %r2
	.word 0xce8aa054  ! 10: LDUBA_I	lduba	[%r10, + 0x0054] %asi, %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc9aa010  ! 11: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r6
	.word 0xd102a028  ! 12: LDF_I	ld	[%r10, 0x0028], %f8
	.word 0xc3ba993f  ! 13: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 14: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba997f  ! 15: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcecae065  ! 16: LDSBA_I	ldsba	[%r11, + 0x0065] %asi, %r7
	.word 0xca8aa015  ! 17: LDUBA_I	lduba	[%r10, + 0x0015] %asi, %r5
	.word 0xcdf2a01f  ! 18: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2913f  ! 19: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcdba985f  ! 20: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdba985f  ! 21: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 22: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc882d11f  ! 23: LDUWA_R	lduwa	[%r11, %r31] 0x88, %r4
	.word 0xd3ba999f  ! 24: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2913f  ! 25: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbbaa020  ! 26: STDFA_I	stda	%f5, [0x0020, %r10]
	.word 0xd1e2e01f  ! 27: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd322c01f  ! 28: STF_R	st	%f9, [%r31, %r11]
	.word 0xc9bad87f  ! 29: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad99f  ! 30: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9e2e01f  ! 31: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xd3baa020  ! 32: STDFA_I	stda	%f9, [0x0020, %r10]
	.word 0xcdba991f  ! 33: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 34: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba98bf  ! 35: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc3aa028  ! 36: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xcc3a801f  ! 37: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2911f  ! 38: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcdba997f  ! 39: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 40: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc41aa010  ! 41: LDD_I	ldd	[%r10 + 0x0010], %r2
	.word 0xc5f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2a01f  ! 43: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcbbae038  ! 44: STDFA_I	stda	%f5, [0x0038, %r11]
	.word 0xcbe2e01f  ! 45: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd0dad01f  ! 46: LDXA_R	ldxa	[%r11, %r31] 0x80, %r8
	.word 0xd1ba995f  ! 47: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 48: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1f2a01f  ! 49: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba99bf  ! 50: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9bae040  ! 51: STDFA_I	stda	%f4, [0x0040, %r11]
	.word 0xd28ae044  ! 52: LDUBA_I	lduba	[%r11, + 0x0044] %asi, %r9
	.word 0xc68a917f  ! 53: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r3
	.word 0xd39aa060  ! 54: LDDFA_I	ldda	[%r10, 0x0060], %f9
	.word 0xc03ac01f  ! 55: STD_R	std	%r0, [%r11 + %r31]
TH_LABEL55:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc82a038  ! 56: LDUWA_I	lduwa	[%r10, + 0x0038] %asi, %r6
	.word 0xc9bad8bf  ! 57: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad93f  ! 58: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc5baa010  ! 59: STDFA_I	stda	%f2, [0x0010, %r10]
	.word 0xc702801f  ! 60: LDF_R	ld	[%r10, %r31], %f3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3ba991f  ! 61: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc6c2901f  ! 62: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r3
	.word 0xce02c01f  ! 63: LDUW_R	lduw	[%r11 + %r31], %r7
	.word 0xc5ba99bf  ! 64: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcfbae020  ! 65: STDFA_I	stda	%f7, [0x0020, %r11]
TH_LABEL65:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1f2e01f  ! 66: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd03ac01f  ! 67: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad93f  ! 68: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae048  ! 69: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xc412801f  ! 70: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xca42a034  ! 71: LDSW_I	ldsw	[%r10 + 0x0034], %r5
	.word 0xd01a801f  ! 72: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xd212c01f  ! 73: LDUH_R	lduh	[%r11 + %r31], %r9
	.word 0xc9f2e01f  ! 74: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xd302801f  ! 75: LDF_R	ld	[%r10, %r31], %f9
TH_LABEL75:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbba981f  ! 76: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcd02801f  ! 77: LDF_R	ld	[%r10, %r31], %f6
	.word 0xd3baa040  ! 78: STDFA_I	stda	%f9, [0x0040, %r10]
	.word 0xcbbad83f  ! 79: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd322801f  ! 80: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc492911f  ! 81: LDUHA_R	lduha	[%r10, %r31] 0x88, %r2
	.word 0xd3bad81f  ! 82: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 83: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad89f  ! 84: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad87f  ! 85: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcf9aa020  ! 86: LDDFA_I	ldda	[%r10, 0x0020], %f7
	.word 0xc3f2d03f  ! 87: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xc3e2d11f  ! 88: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xd082917f  ! 89: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r8
	.word 0xcf9aa060  ! 90: LDDFA_I	ldda	[%r10, 0x0060], %f7
TH_LABEL90:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc83aa070  ! 91: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xcbbae050  ! 92: STDFA_I	stda	%f5, [0x0050, %r11]
	.word 0xc3ba987f  ! 93: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcbbae010  ! 94: STDFA_I	stda	%f5, [0x0010, %r11]
	.word 0xcc3a801f  ! 95: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc3a801f  ! 96: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 97: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba983f  ! 98: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 99: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc01ae058  ! 100: LDD_I	ldd	[%r11 + 0x0058], %r0
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5bad9bf  ! 101: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad83f  ! 102: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xca4ac01f  ! 103: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xca52e058  ! 104: LDSH_I	ldsh	[%r11 + 0x0058], %r5
	.word 0xd3f2e01f  ! 105: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3f2e01f  ! 106: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xcada913f  ! 107: LDXA_R	ldxa	[%r10, %r31] 0x89, %r5
	.word 0xcfba997f  ! 108: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba983f  ! 109: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc442e04c  ! 110: LDSW_I	ldsw	[%r11 + 0x004c], %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xccdae068  ! 111: LDXA_I	ldxa	[%r11, + 0x0068] %asi, %r6
	.word 0xc7bae078  ! 112: STDFA_I	stda	%f3, [0x0078, %r11]
	.word 0xc9f2903f  ! 113: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xd24ac01f  ! 114: LDSB_R	ldsb	[%r11 + %r31], %r9
	.word 0xc9f2901f  ! 115: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9e2901f  ! 116: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9e2901f  ! 117: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba995f  ! 118: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 119: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba995f  ! 120: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9e2913f  ! 121: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc24aa014  ! 122: LDSB_I	ldsb	[%r10 + 0x0014], %r1
	.word 0xcdbad97f  ! 123: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc8daa070  ! 124: LDXA_I	ldxa	[%r10, + 0x0070] %asi, %r4
	.word 0xd03ac01f  ! 125: STD_R	std	%r8, [%r11 + %r31]
TH_LABEL125:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1bad93f  ! 126: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad89f  ! 127: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd01aa010  ! 128: LDD_I	ldd	[%r10 + 0x0010], %r8
	.word 0xd3ba989f  ! 129: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 130: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc02801f  ! 131: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xc3ba99bf  ! 132: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc59aa058  ! 133: LDDFA_I	ldda	[%r10, 0x0058], %f2
	.word 0xcfba981f  ! 134: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd3baa078  ! 135: STDFA_I	stda	%f9, [0x0078, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5ba985f  ! 136: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2901f  ! 137: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xd2cad07f  ! 138: LDSBA_R	ldsba	[%r11, %r31] 0x83, %r9
	.word 0xcdf2a01f  ! 139: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba991f  ! 140: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xca82a054  ! 141: LDUWA_I	lduwa	[%r10, + 0x0054] %asi, %r5
	.word 0xc2ca911f  ! 142: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r1
	.word 0xc3f2e01f  ! 143: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc64a801f  ! 144: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xcadaa070  ! 145: LDXA_I	ldxa	[%r10, + 0x0070] %asi, %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5e2a01f  ! 146: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xd302e020  ! 147: LDF_I	ld	[%r11, 0x0020], %f9
	.word 0xc3ba993f  ! 148: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 149: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3e2a01f  ! 150: CASA_R	casa	[%r10] %asi, %r31, %r1
TH_LABEL150:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc2c2901f  ! 151: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r1
	.word 0xc5e2e01f  ! 152: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xca02a078  ! 153: LDUW_I	lduw	[%r10 + 0x0078], %r5
	.word 0xc7ba981f  ! 154: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 155: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7ba99bf  ! 156: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 157: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xd19aa058  ! 158: LDDFA_I	ldda	[%r10, 0x0058], %f8
	.word 0xcdbaa048  ! 159: STDFA_I	stda	%f6, [0x0048, %r10]
	.word 0xc412a07c  ! 160: LDUH_I	lduh	[%r10 + 0x007c], %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc6ca901f  ! 161: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r3
	.word 0xc3bad85f  ! 162: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 163: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3e2e01f  ! 164: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2e01f  ! 165: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd302801f  ! 166: LDF_R	ld	[%r10, %r31], %f9
	.word 0xce92915f  ! 167: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r7
	.word 0xcdbae020  ! 168: STDFA_I	stda	%f6, [0x0020, %r11]
	.word 0xc41a801f  ! 169: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc5e2e01f  ! 170: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc59aa008  ! 171: LDDFA_I	ldda	[%r10, 0x0008], %f2
	.word 0xd3bad81f  ! 172: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 173: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xcf9aa018  ! 174: LDDFA_I	ldda	[%r10, 0x0018], %f7
	.word 0xcbbad93f  ! 175: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbbad95f  ! 176: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc9baa008  ! 177: STDFA_I	stda	%f4, [0x0008, %r10]
	.word 0xc9ba98bf  ! 178: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xce42a068  ! 179: LDSW_I	ldsw	[%r10 + 0x0068], %r7
	.word 0xc322c01f  ! 180: STF_R	st	%f1, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfbad87f  ! 181: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc2d2a004  ! 182: LDSHA_I	ldsha	[%r10, + 0x0004] %asi, %r1
	.word 0xc85aa048  ! 183: LDX_I	ldx	[%r10 + 0x0048], %r4
	.word 0xcacad11f  ! 184: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r5
	.word 0xc7e2e01f  ! 185: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc45ac01f  ! 186: LDX_R	ldx	[%r11 + %r31], %r2
	.word 0xc3bad81f  ! 187: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd2da915f  ! 188: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r9
	.word 0xc3e2901f  ! 189: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xcad2d01f  ! 190: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r5
TH_LABEL190:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9bad83f  ! 191: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd00aa016  ! 192: LDUB_I	ldub	[%r10 + 0x0016], %r8
	.word 0xcfbad97f  ! 193: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xca4ac01f  ! 194: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xc65ac01f  ! 195: LDX_R	ldx	[%r11 + %r31], %r3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd39aa020  ! 196: LDDFA_I	ldda	[%r10, 0x0020], %f9
	.word 0xc9baa078  ! 197: STDFA_I	stda	%f4, [0x0078, %r10]
	.word 0xc85aa078  ! 198: LDX_I	ldx	[%r10 + 0x0078], %r4
	.word 0xca4ae062  ! 199: LDSB_I	ldsb	[%r11 + 0x0062], %r5
	.word 0xc9e2d13f  ! 200: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd05ac01f  ! 201: LDX_R	ldx	[%r11 + %r31], %r8
	.word 0xc5e2a01f  ! 202: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcfbaa018  ! 203: STDFA_I	stda	%f7, [0x0018, %r10]
	.word 0xc5ba993f  ! 204: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd19ae030  ! 205: LDDFA_I	ldda	[%r11, 0x0030], %f8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd25aa000  ! 206: LDX_I	ldx	[%r10 + 0x0000], %r9
	.word 0xc41a801f  ! 207: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc812801f  ! 208: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xc502801f  ! 209: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc39aa028  ! 210: LDDFA_I	ldda	[%r10, 0x0028], %f1
TH_LABEL210:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdba995f  ! 211: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc502c01f  ! 212: LDF_R	ld	[%r11, %r31], %f2
	.word 0xc7bad83f  ! 213: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc452a03c  ! 214: LDSH_I	ldsh	[%r10 + 0x003c], %r2
	.word 0xc5f2a01f  ! 215: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5ba98bf  ! 216: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 217: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba99bf  ! 218: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc20a801f  ! 219: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xc45aa000  ! 220: LDX_I	ldx	[%r10 + 0x0000], %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3e2913f  ! 221: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd03a801f  ! 222: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd25ac01f  ! 223: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xc5e2a01f  ! 224: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc482d11f  ! 225: LDUWA_R	lduwa	[%r11, %r31] 0x88, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xccc2903f  ! 226: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r6
	.word 0xd3ba981f  ! 227: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 228: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 229: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 230: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd03aa010  ! 231: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd3e2a01f  ! 232: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 233: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba989f  ! 234: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa010  ! 235: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd03a801f  ! 236: STD_R	std	%r8, [%r10 + %r31]
	.word 0xccd2915f  ! 237: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r6
	.word 0xcd22801f  ! 238: STF_R	st	%f6, [%r31, %r10]
	.word 0xcfba993f  ! 239: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcf02801f  ! 240: LDF_R	ld	[%r10, %r31], %f7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc43aa010  ! 241: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xc502e038  ! 242: LDF_I	ld	[%r11, 0x0038], %f2
	.word 0xcf02801f  ! 243: LDF_R	ld	[%r10, %r31], %f7
	.word 0xd08ad07f  ! 244: LDUBA_R	lduba	[%r11, %r31] 0x83, %r8
	.word 0xd03aa038  ! 245: STD_I	std	%r8, [%r10 + 0x0038]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3ba999f  ! 246: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba999f  ! 247: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2911f  ! 248: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xce82d15f  ! 249: LDUWA_R	lduwa	[%r11, %r31] 0x8a, %r7
	.word 0xcbba983f  ! 250: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba981f  ! 251: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa038  ! 252: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xc80aa00d  ! 253: LDUB_I	ldub	[%r10 + 0x000d], %r4
	.word 0xd3ba993f  ! 254: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 255: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3f2a01f  ! 256: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03aa058  ! 257: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3ba981f  ! 258: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc642801f  ! 259: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xca0aa069  ! 260: LDUB_I	ldub	[%r10 + 0x0069], %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1bad87f  ! 261: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad8bf  ! 262: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad87f  ! 263: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc8c2903f  ! 264: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r4
	.word 0xc7e2a01f  ! 265: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7ba985f  ! 266: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 267: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba995f  ! 268: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc4ca913f  ! 269: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r2
	.word 0xd39aa058  ! 270: LDDFA_I	ldda	[%r10, 0x0058], %f9
TH_LABEL270:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc1aa070  ! 271: LDD_I	ldd	[%r10 + 0x0070], %r6
	.word 0xc4d2a022  ! 272: LDSHA_I	ldsha	[%r10, + 0x0022] %asi, %r2
	.word 0xc43aa058  ! 273: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc5f2a01f  ! 274: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5f2901f  ! 275: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfbae078  ! 276: STDFA_I	stda	%f7, [0x0078, %r11]
	.word 0xc60a801f  ! 277: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xcc3aa038  ! 278: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcfba997f  ! 279: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba999f  ! 280: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfe2a01f  ! 281: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcc1aa048  ! 282: LDD_I	ldd	[%r10 + 0x0048], %r6
	.word 0xcde2d13f  ! 283: CASA_I	casa	[%r11] 0x89, %r31, %r6
	.word 0xcdf2d01f  ! 284: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xd212e03a  ! 285: LDUH_I	lduh	[%r11 + 0x003a], %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd102e024  ! 286: LDF_I	ld	[%r11, 0x0024], %f8
	.word 0xc5ba991f  ! 287: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2901f  ! 288: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba995f  ! 289: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc2da911f  ! 290: LDXA_R	ldxa	[%r10, %r31] 0x88, %r1
TH_LABEL290:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9ba983f  ! 291: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 292: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xcf9aa020  ! 293: LDDFA_I	ldda	[%r10, 0x0020], %f7
	.word 0xcbf2913f  ! 294: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xcbf2901f  ! 295: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc8d2a07a  ! 296: LDSHA_I	ldsha	[%r10, + 0x007a] %asi, %r4
	.word 0xc03ac01f  ! 297: STD_R	std	%r0, [%r11 + %r31]
	.word 0xcc02a068  ! 298: LDUW_I	lduw	[%r10 + 0x0068], %r6
	.word 0xcd9ae008  ! 299: LDDFA_I	ldda	[%r11, 0x0008], %f6
	.word 0xcc3aa040  ! 300: STD_I	std	%r6, [%r10 + 0x0040]
TH_LABEL300:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdba989f  ! 301: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 302: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 303: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xcc82911f  ! 304: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r6
	.word 0xd3bad93f  ! 305: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3bad81f  ! 306: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 307: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad8bf  ! 308: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc4dae028  ! 309: LDXA_I	ldxa	[%r11, + 0x0028] %asi, %r2
	.word 0xc602a058  ! 310: LDUW_I	lduw	[%r10 + 0x0058], %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbbaa060  ! 311: STDFA_I	stda	%f5, [0x0060, %r10]
	.word 0xc3e2911f  ! 312: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xc6ca903f  ! 313: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r3
	.word 0xca92a042  ! 314: LDUHA_I	lduha	[%r10, + 0x0042] %asi, %r5
	.word 0xc7bad81f  ! 315: STDFA_R	stda	%f3, [%r31, %r11]
TH_LABEL315:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdbaa048  ! 316: STDFA_I	stda	%f6, [0x0048, %r10]
	.word 0xc64aa066  ! 317: LDSB_I	ldsb	[%r10 + 0x0066], %r3
	.word 0xcbf2e01f  ! 318: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcdbaa058  ! 319: STDFA_I	stda	%f6, [0x0058, %r10]
	.word 0xca42e04c  ! 320: LDSW_I	ldsw	[%r11 + 0x004c], %r5
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd03aa050  ! 321: STD_I	std	%r8, [%r10 + 0x0050]
	.word 0xd1f2a01f  ! 322: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba999f  ! 323: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 324: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc4d2e062  ! 325: LDSHA_I	ldsha	[%r11, + 0x0062] %asi, %r2
TH_LABEL325:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5ba983f  ! 326: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd05ae060  ! 327: LDX_I	ldx	[%r11 + 0x0060], %r8
	.word 0xcfba995f  ! 328: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd2d2e050  ! 329: LDSHA_I	ldsha	[%r11, + 0x0050] %asi, %r9
	.word 0xc5bad91f  ! 330: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7bae040  ! 331: STDFA_I	stda	%f3, [0x0040, %r11]
	.word 0xc6cae003  ! 332: LDSBA_I	ldsba	[%r11, + 0x0003] %asi, %r3
	.word 0xd03a801f  ! 333: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba99bf  ! 334: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd20a801f  ! 335: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3e2d01f  ! 336: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc3e2d03f  ! 337: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xd3baa070  ! 338: STDFA_I	stda	%f9, [0x0070, %r10]
	.word 0xc83ae018  ! 339: STD_I	std	%r4, [%r11 + 0x0018]
	.word 0xced2917f  ! 340: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcb02e004  ! 341: LDF_I	ld	[%r11, 0x0004], %f5
	.word 0xc7ba981f  ! 342: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc852a038  ! 343: LDSH_I	ldsh	[%r10 + 0x0038], %r4
	.word 0xd2dad05f  ! 344: LDXA_R	ldxa	[%r11, %r31] 0x82, %r9
	.word 0xd28aa036  ! 345: LDUBA_I	lduba	[%r10, + 0x0036] %asi, %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3baa048  ! 346: STDFA_I	stda	%f9, [0x0048, %r10]
	.word 0xd3bad91f  ! 347: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d01f  ! 348: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd03ae010  ! 349: STD_I	std	%r8, [%r11 + 0x0010]
	.word 0xd3bad91f  ! 350: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcaca903f  ! 351: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r5
	.word 0xc9f2901f  ! 352: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2911f  ! 353: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc83a801f  ! 354: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 355: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9e2901f  ! 356: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc902a078  ! 357: LDF_I	ld	[%r10, 0x0078], %f4
	.word 0xc43aa000  ! 358: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc43aa000  ! 359: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xd002801f  ! 360: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5e2a01f  ! 361: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc6cad07f  ! 362: LDSBA_R	ldsba	[%r11, %r31] 0x83, %r3
	.word 0xc3ba999f  ! 363: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xceda917f  ! 364: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r7
	.word 0xd0ca901f  ! 365: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd03aa000  ! 366: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xcc02801f  ! 367: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xd19aa058  ! 368: LDDFA_I	ldda	[%r10, 0x0058], %f8
	.word 0xcdba997f  ! 369: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 370: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdf2a01f  ! 371: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba997f  ! 372: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba997f  ! 373: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc522c01f  ! 374: STF_R	st	%f2, [%r31, %r11]
	.word 0xc9ba99bf  ! 375: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc292905f  ! 376: LDUHA_R	lduha	[%r10, %r31] 0x82, %r1
	.word 0xd1f2a01f  ! 377: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc302a058  ! 378: LDF_I	ld	[%r10, 0x0058], %f1
	.word 0xd03a801f  ! 379: STD_R	std	%r8, [%r10 + %r31]
	.word 0xcf22801f  ! 380: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3ba993f  ! 381: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba985f  ! 382: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xccd2e07a  ! 383: LDSHA_I	ldsha	[%r11, + 0x007a] %asi, %r6
	.word 0xd0d2905f  ! 384: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r8
	.word 0xca4a801f  ! 385: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7ba981f  ! 386: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xce8aa067  ! 387: LDUBA_I	lduba	[%r10, + 0x0067] %asi, %r7
	.word 0xc7ba991f  ! 388: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 389: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xce82e044  ! 390: LDUWA_I	lduwa	[%r11, + 0x0044] %asi, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc03ac01f  ! 391: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc25a801f  ! 392: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xc03ac01f  ! 393: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad89f  ! 394: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcadad15f  ! 395: LDXA_R	ldxa	[%r11, %r31] 0x8a, %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcff2a01f  ! 396: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xccc2901f  ! 397: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r6
	.word 0xcecaa079  ! 398: LDSBA_I	ldsba	[%r10, + 0x0079] %asi, %r7
	.word 0xc9bad8bf  ! 399: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 400: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc42e04c  ! 401: LDSW_I	ldsw	[%r11 + 0x004c], %r6
	.word 0xc282a000  ! 402: LDUWA_I	lduwa	[%r10, + 0x0000] %asi, %r1
	.word 0xc7e2d13f  ! 403: CASA_I	casa	[%r11] 0x89, %r31, %r3
	.word 0xc7f2e01f  ! 404: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc20ac01f  ! 405: LDUB_R	ldub	[%r11 + %r31], %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdf2d11f  ! 406: CASXA_I	casxa	[%r11] 0x88, %r31, %r6
	.word 0xcdbad97f  ! 407: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd252c01f  ! 408: LDSH_R	ldsh	[%r11 + %r31], %r9
	.word 0xc4d2e070  ! 409: LDSHA_I	ldsha	[%r11, + 0x0070] %asi, %r2
	.word 0xcdf2e01f  ! 410: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdf2d03f  ! 411: CASXA_I	casxa	[%r11] 0x81, %r31, %r6
	.word 0xcdbad8bf  ! 412: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad83f  ! 413: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc252801f  ! 414: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xd05ae018  ! 415: LDX_I	ldx	[%r11 + 0x0018], %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5ba99bf  ! 416: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc652a06e  ! 417: LDSH_I	ldsh	[%r10 + 0x006e], %r3
	.word 0xc482d05f  ! 418: LDUWA_R	lduwa	[%r11, %r31] 0x82, %r2
	.word 0xcfbad89f  ! 419: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc0a801f  ! 420: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfba987f  ! 421: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 422: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba983f  ! 423: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba985f  ! 424: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd212c01f  ! 425: LDUH_R	lduh	[%r11 + %r31], %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc8c2913f  ! 426: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r4
	.word 0xc902a010  ! 427: LDF_I	ld	[%r10, 0x0010], %f4
	.word 0xc3baa028  ! 428: STDFA_I	stda	%f1, [0x0028, %r10]
	.word 0xc3ba999f  ! 429: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba993f  ! 430: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc48ae01b  ! 431: LDUBA_I	lduba	[%r11, + 0x001b] %asi, %r2
	.word 0xcc8ae069  ! 432: LDUBA_I	lduba	[%r11, + 0x0069] %asi, %r6
	.word 0xcc3a801f  ! 433: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba981f  ! 434: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 435: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc89aa030  ! 436: LDDA_I	ldda	[%r10, + 0x0030] %asi, %r4
	.word 0xc522801f  ! 437: STF_R	st	%f2, [%r31, %r10]
	.word 0xcbf2d01f  ! 438: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xce4ac01f  ! 439: LDSB_R	ldsb	[%r11 + %r31], %r7
	.word 0xd1f2901f  ! 440: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1ba991f  ! 441: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 442: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2901f  ! 443: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba987f  ! 444: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa048  ! 445: STD_I	std	%r8, [%r10 + 0x0048]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xced2901f  ! 446: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r7
	.word 0xcbbad95f  ! 447: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xce0aa055  ! 448: LDUB_I	ldub	[%r10 + 0x0055], %r7
	.word 0xc9f2911f  ! 449: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba983f  ! 450: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9ba987f  ! 451: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 452: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba99bf  ! 453: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcf02e060  ! 454: LDF_I	ld	[%r11, 0x0060], %f7
	.word 0xd3ba981f  ! 455: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc692915f  ! 456: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r3
	.word 0xc2caa05e  ! 457: LDSBA_I	ldsba	[%r10, + 0x005e] %asi, %r1
	.word 0xc3ba983f  ! 458: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc65ac01f  ! 459: LDX_R	ldx	[%r11 + %r31], %r3
	.word 0xca92d17f  ! 460: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcd02c01f  ! 461: LDF_R	ld	[%r11, %r31], %f6
	.word 0xd3f2a01f  ! 462: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba999f  ! 463: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba999f  ! 464: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3baa040  ! 465: STDFA_I	stda	%f9, [0x0040, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbbad81f  ! 466: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad83f  ! 467: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d03f  ! 468: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xc292e018  ! 469: LDUHA_I	lduha	[%r11, + 0x0018] %asi, %r1
	.word 0xd03aa008  ! 470: STD_I	std	%r8, [%r10 + 0x0008]
TH_LABEL470:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3ba99bf  ! 471: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 472: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba993f  ! 473: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 474: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd1bae048  ! 475: STDFA_I	stda	%f8, [0x0048, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbe2d13f  ! 476: CASA_I	casa	[%r11] 0x89, %r31, %r5
	.word 0xcbbae040  ! 477: STDFA_I	stda	%f5, [0x0040, %r11]
	.word 0xd3ba985f  ! 478: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 479: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd00ae00c  ! 480: LDUB_I	ldub	[%r11 + 0x000c], %r8
TH_LABEL480:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc79aa008  ! 481: LDDFA_I	ldda	[%r10, 0x0008], %f3
	.word 0xc9bad95f  ! 482: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd302c01f  ! 483: LDF_R	ld	[%r11, %r31], %f9
	.word 0xc9bad81f  ! 484: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d01f  ! 485: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcd9aa078  ! 486: LDDFA_I	ldda	[%r10, 0x0078], %f6
	.word 0xc28a913f  ! 487: LDUBA_R	lduba	[%r10, %r31] 0x89, %r1
	.word 0xc6c2e070  ! 488: LDSWA_I	ldswa	[%r11, + 0x0070] %asi, %r3
	.word 0xc7ba99bf  ! 489: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 490: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc20ac01f  ! 491: LDUB_R	ldub	[%r11 + %r31], %r1
	.word 0xcbba98bf  ! 492: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc412c01f  ! 493: LDUH_R	lduh	[%r11 + %r31], %r2
	.word 0xc41ac01f  ! 494: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xca8aa006  ! 495: LDUBA_I	lduba	[%r10, + 0x0006] %asi, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3f2a01f  ! 496: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba997f  ! 497: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 498: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3e2913f  ! 499: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba997f  ! 500: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3f2a01f  ! 501: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba991f  ! 502: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2911f  ! 503: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd3ba997f  ! 504: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc252801f  ! 505: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcde2a01f  ! 506: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcc3a801f  ! 507: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc702801f  ! 508: LDF_R	ld	[%r10, %r31], %f3
	.word 0xca02801f  ! 509: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xc612c01f  ! 510: LDUH_R	lduh	[%r11 + %r31], %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7e2911f  ! 511: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba981f  ! 512: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa000  ! 513: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc7f2901f  ! 514: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba98bf  ! 515: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7f2901f  ! 516: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xd09ae000  ! 517: LDDA_I	ldda	[%r11, + 0x0000] %asi, %r8
	.word 0xcc0aa06e  ! 518: LDUB_I	ldub	[%r10 + 0x006e], %r6
	.word 0xcd9aa048  ! 519: LDDFA_I	ldda	[%r10, 0x0048], %f6
	.word 0xcfba981f  ! 520: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL520:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xca52a076  ! 521: LDSH_I	ldsh	[%r10 + 0x0076], %r5
	.word 0xc612a02e  ! 522: LDUH_I	lduh	[%r10 + 0x002e], %r3
	.word 0xcada907f  ! 523: LDXA_R	ldxa	[%r10, %r31] 0x83, %r5
	.word 0xcfba987f  ! 524: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 525: STD_I	std	%r6, [%r10 + 0x0050]
TH_LABEL525:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc502801f  ! 526: LDF_R	ld	[%r10, %r31], %f2
	.word 0xca4a801f  ! 527: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xd3ba985f  ! 528: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd052801f  ! 529: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xd1e2d01f  ! 530: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc49ae008  ! 531: LDDA_I	ldda	[%r11, + 0x0008] %asi, %r2
	.word 0xc5ba981f  ! 532: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc92911f  ! 533: LDUHA_R	lduha	[%r10, %r31] 0x88, %r6
	.word 0xc9bad8bf  ! 534: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 535: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc59ae000  ! 536: LDDFA_I	ldda	[%r11, 0x0000], %f2
	.word 0xcbba981f  ! 537: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba98bf  ! 538: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xce0ae034  ! 539: LDUB_I	ldub	[%r11 + 0x0034], %r7
	.word 0xc8dad17f  ! 540: LDXA_R	ldxa	[%r11, %r31] 0x8b, %r4
TH_LABEL540:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfbad93f  ! 541: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc4d2a026  ! 542: LDSHA_I	ldsha	[%r10, + 0x0026] %asi, %r2
	.word 0xd19ae008  ! 543: LDDFA_I	ldda	[%r11, 0x0008], %f8
	.word 0xc302801f  ! 544: LDF_R	ld	[%r10, %r31], %f1
	.word 0xca12c01f  ! 545: LDUH_R	lduh	[%r11 + %r31], %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcfbad81f  ! 546: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 547: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xd01ac01f  ! 548: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xd322801f  ! 549: STF_R	st	%f9, [%r31, %r10]
	.word 0xc9ba997f  ! 550: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9e2901f  ! 551: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc59aa010  ! 552: LDDFA_I	ldda	[%r10, 0x0010], %f2
	.word 0xd19aa070  ! 553: LDDFA_I	ldda	[%r10, 0x0070], %f8
	.word 0xcbba985f  ! 554: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 555: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xce92e044  ! 556: LDUHA_I	lduha	[%r11, + 0x0044] %asi, %r7
	.word 0xc5e2911f  ! 557: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5ba981f  ! 558: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 559: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 560: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL560:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1baa078  ! 561: STDFA_I	stda	%f8, [0x0078, %r10]
	.word 0xc9ba98bf  ! 562: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa000  ! 563: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xc9ba989f  ! 564: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc8c2e050  ! 565: LDSWA_I	ldswa	[%r11, + 0x0050] %asi, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc412c01f  ! 566: LDUH_R	lduh	[%r11 + %r31], %r2
	.word 0xc7ba981f  ! 567: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa048  ! 568: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc7ba999f  ! 569: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba99bf  ! 570: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7e2901f  ! 571: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba995f  ! 572: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd302e074  ! 573: LDF_I	ld	[%r11, 0x0074], %f9
	.word 0xc9ba983f  ! 574: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 575: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9e2a01f  ! 576: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xcc92a024  ! 577: LDUHA_I	lduha	[%r10, + 0x0024] %asi, %r6
	.word 0xc9e2911f  ! 578: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba997f  ! 579: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9baa050  ! 580: STDFA_I	stda	%f4, [0x0050, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xca12801f  ! 581: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xc3bad81f  ! 582: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad83f  ! 583: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad97f  ! 584: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad9bf  ! 585: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc492911f  ! 586: LDUHA_R	lduha	[%r10, %r31] 0x88, %r2
	.word 0xd3bad87f  ! 587: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd2d2a062  ! 588: LDSHA_I	ldsha	[%r10, + 0x0062] %asi, %r9
	.word 0xca02a034  ! 589: LDUW_I	lduw	[%r10 + 0x0034], %r5
	.word 0xc3e2e01f  ! 590: CASA_R	casa	[%r11] %asi, %r31, %r1
TH_LABEL590:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3bad81f  ! 591: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc41aa050  ! 592: LDD_I	ldd	[%r10 + 0x0050], %r2
	.word 0xc3bad87f  ! 593: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc322801f  ! 594: STF_R	st	%f1, [%r31, %r10]
	.word 0xca4ac01f  ! 595: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc43ae060  ! 596: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xd25a801f  ! 597: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xd2daa018  ! 598: LDXA_I	ldxa	[%r10, + 0x0018] %asi, %r9
	.word 0xc99ae048  ! 599: LDDFA_I	ldda	[%r11, 0x0048], %f4
	.word 0xcc12e060  ! 600: LDUH_I	lduh	[%r11 + 0x0060], %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdbad99f  ! 601: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc412801f  ! 602: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xc80a801f  ! 603: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xd1ba98bf  ! 604: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd282907f  ! 605: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r9
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5ba989f  ! 606: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 607: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcc1a801f  ! 608: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc522801f  ! 609: STF_R	st	%f2, [%r31, %r10]
	.word 0xd1e2d13f  ! 610: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc81ae068  ! 611: LDD_I	ldd	[%r11 + 0x0068], %r4
	.word 0xc83a801f  ! 612: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba981f  ! 613: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 614: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc8ad13f  ! 615: LDUBA_R	lduba	[%r11, %r31] 0x89, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbbad87f  ! 616: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ac01f  ! 617: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad89f  ! 618: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d13f  ! 619: CASXA_I	casxa	[%r11] 0x89, %r31, %r5
	.word 0xc452a046  ! 620: LDSH_I	ldsh	[%r10 + 0x0046], %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd2d2915f  ! 621: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r9
	.word 0xcc1ae078  ! 622: LDD_I	ldd	[%r11 + 0x0078], %r6
	.word 0xcbba991f  ! 623: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2911f  ! 624: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xcc9aa010  ! 625: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc65a801f  ! 626: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xc5f2a01f  ! 627: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5f2901f  ! 628: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5e2901f  ! 629: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xce92a022  ! 630: LDUHA_I	lduha	[%r10, + 0x0022] %asi, %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc2ca911f  ! 631: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r1
	.word 0xcaca911f  ! 632: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r5
	.word 0xc4c2913f  ! 633: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r2
	.word 0xc702801f  ! 634: LDF_R	ld	[%r10, %r31], %f3
	.word 0xd08ae009  ! 635: LDUBA_I	lduba	[%r11, + 0x0009] %asi, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc3ae040  ! 636: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xcdbad9bf  ! 637: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad85f  ! 638: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad87f  ! 639: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdf2e01f  ! 640: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc3ae040  ! 641: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xca0aa023  ! 642: LDUB_I	ldub	[%r10 + 0x0023], %r5
	.word 0xc43aa030  ! 643: STD_I	std	%r2, [%r10 + 0x0030]
	.word 0xc442801f  ! 644: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xcccaa064  ! 645: LDSBA_I	ldsba	[%r10, + 0x0064] %asi, %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc99ae028  ! 646: LDDFA_I	ldda	[%r11, 0x0028], %f4
	.word 0xd1bad81f  ! 647: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 648: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc8da901f  ! 649: LDXA_R	ldxa	[%r10, %r31] 0x80, %r4
	.word 0xca42801f  ! 650: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3e2911f  ! 651: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xd3e2a01f  ! 652: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba995f  ! 653: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 654: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xc44a801f  ! 655: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc4c2905f  ! 656: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r2
	.word 0xcc3ac01f  ! 657: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcde2e01f  ! 658: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdbad8bf  ! 659: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc292915f  ! 660: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r1
TH_LABEL660:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1ba981f  ! 661: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca92907f  ! 662: LDUHA_R	lduha	[%r10, %r31] 0x83, %r5
	.word 0xc7bad97f  ! 663: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xce0aa060  ! 664: LDUB_I	ldub	[%r10 + 0x0060], %r7
	.word 0xcc12a05a  ! 665: LDUH_I	lduh	[%r10 + 0x005a], %r6
TH_LABEL665:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc40a801f  ! 666: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xc9ba983f  ! 667: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd08a901f  ! 668: LDUBA_R	lduba	[%r10, %r31] 0x80, %r8
	.word 0xc682915f  ! 669: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r3
	.word 0xc83aa070  ! 670: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbf2903f  ! 671: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xcbba991f  ! 672: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa070  ! 673: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xcbba981f  ! 674: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2901f  ! 675: CASA_I	casa	[%r10] 0x80, %r31, %r5
TH_LABEL675:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc59ae040  ! 676: LDDFA_I	ldda	[%r11, 0x0040], %f2
	.word 0xc5bad85f  ! 677: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ac01f  ! 678: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad87f  ! 679: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2e01f  ! 680: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5f2e01f  ! 681: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad97f  ! 682: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd09aa020  ! 683: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r8
	.word 0xc43ac01f  ! 684: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc48a901f  ! 685: LDUBA_R	lduba	[%r10, %r31] 0x80, %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc6ca917f  ! 686: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r3
	.word 0xd04ae051  ! 687: LDSB_I	ldsb	[%r11 + 0x0051], %r8
	.word 0xcbba981f  ! 688: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc5baa028  ! 689: STDFA_I	stda	%f2, [0x0028, %r10]
	.word 0xcbf2901f  ! 690: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
TH_LABEL690:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbe2903f  ! 691: CASA_I	casa	[%r10] 0x81, %r31, %r5
	.word 0xcbe2913f  ! 692: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xcbe2a01f  ! 693: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xccdaa010  ! 694: LDXA_I	ldxa	[%r10, + 0x0010] %asi, %r6
	.word 0xceca915f  ! 695: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc442801f  ! 696: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xc9e2d01f  ! 697: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9bad83f  ! 698: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d13f  ! 699: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc9bad99f  ! 700: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9bad99f  ! 701: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc45ac01f  ! 702: LDX_R	ldx	[%r11 + %r31], %r2
	.word 0xd1f2a01f  ! 703: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd0dae008  ! 704: LDXA_I	ldxa	[%r11, + 0x0008] %asi, %r8
	.word 0xd302801f  ! 705: LDF_R	ld	[%r10, %r31], %f9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc41aa008  ! 706: LDD_I	ldd	[%r10 + 0x0008], %r2
	.word 0xcdf2a01f  ! 707: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcadad17f  ! 708: LDXA_R	ldxa	[%r11, %r31] 0x8b, %r5
	.word 0xc43ac01f  ! 709: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae060  ! 710: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7bad83f  ! 711: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2d01f  ! 712: CASA_I	casa	[%r11] 0x80, %r31, %r3
	.word 0xc7bad9bf  ! 713: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae060  ! 714: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xcc12801f  ! 715: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdf2903f  ! 716: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xc652a064  ! 717: LDSH_I	ldsh	[%r10 + 0x0064], %r3
	.word 0xcbba985f  ! 718: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd052c01f  ! 719: LDSH_R	ldsh	[%r11 + %r31], %r8
	.word 0xcfe2a01f  ! 720: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc852801f  ! 721: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xcfbad83f  ! 722: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc65ac01f  ! 723: LDX_R	ldx	[%r11 + %r31], %r3
	.word 0xc9ba981f  ! 724: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd122c01f  ! 725: STF_R	st	%f8, [%r31, %r11]
TH_LABEL725:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3ba98bf  ! 726: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc41a801f  ! 727: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xcfba995f  ! 728: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc20aa056  ! 729: LDUB_I	ldub	[%r10 + 0x0056], %r1
	.word 0xd03ae070  ! 730: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc39ae038  ! 731: LDDFA_I	ldda	[%r11, 0x0038], %f1
	.word 0xc8dae078  ! 732: LDXA_I	ldxa	[%r11, + 0x0078] %asi, %r4
	.word 0xc83ac01f  ! 733: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcc9aa060  ! 734: LDDA_I	ldda	[%r10, + 0x0060] %asi, %r6
	.word 0xc9e2901f  ! 735: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9ba98bf  ! 736: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 737: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa078  ! 738: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xc79aa070  ! 739: LDDFA_I	ldda	[%r10, 0x0070], %f3
	.word 0xd1ba991f  ! 740: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5baa060  ! 741: STDFA_I	stda	%f2, [0x0060, %r10]
	.word 0xcbba983f  ! 742: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba98bf  ! 743: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2901f  ! 744: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbf2913f  ! 745: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
TH_LABEL745:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc83a801f  ! 746: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba985f  ! 747: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc242c01f  ! 748: LDSW_R	ldsw	[%r11 + %r31], %r1
	.word 0xcff2e01f  ! 749: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcacaa031  ! 750: LDSBA_I	ldsba	[%r10, + 0x0031] %asi, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3e2911f  ! 751: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xc3ba99bf  ! 752: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 753: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa058  ! 754: STD_I	std	%r0, [%r10 + 0x0058]
	.word 0xc3e2901f  ! 755: CASA_I	casa	[%r10] 0x80, %r31, %r1
TH_LABEL755:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xca0a801f  ! 756: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xcedaa028  ! 757: LDXA_I	ldxa	[%r10, + 0x0028] %asi, %r7
	.word 0xd082d01f  ! 758: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r8
	.word 0xcfba981f  ! 759: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcd02801f  ! 760: LDF_R	ld	[%r10, %r31], %f6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc482d11f  ! 761: LDUWA_R	lduwa	[%r11, %r31] 0x88, %r2
	.word 0xc842801f  ! 762: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xc3ba983f  ! 763: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd102801f  ! 764: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc522c01f  ! 765: STF_R	st	%f2, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd2c2a074  ! 766: LDSWA_I	ldswa	[%r10, + 0x0074] %asi, %r9
	.word 0xc83a801f  ! 767: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba987f  ! 768: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 769: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba989f  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc83aa038  ! 771: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xc9f2a01f  ! 772: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba987f  ! 773: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc702801f  ! 774: LDF_R	ld	[%r10, %r31], %f3
	.word 0xd3ba987f  ! 775: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL775:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd302a044  ! 776: LDF_I	ld	[%r10, 0x0044], %f9
	.word 0xc292d13f  ! 777: LDUHA_R	lduha	[%r11, %r31] 0x89, %r1
	.word 0xcb02a014  ! 778: LDF_I	ld	[%r10, 0x0014], %f5
	.word 0xcc52801f  ! 779: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xc3ba981f  ! 780: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc4c2a070  ! 781: LDSWA_I	ldswa	[%r10, + 0x0070] %asi, %r2
	.word 0xc5e2903f  ! 782: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba981f  ! 783: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2913f  ! 784: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc43aa018  ! 785: STD_I	std	%r2, [%r10 + 0x0018]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc01ae070  ! 786: LDD_I	ldd	[%r11 + 0x0070], %r0
	.word 0xd03ae050  ! 787: STD_I	std	%r8, [%r11 + 0x0050]
	.word 0xcf9aa058  ! 788: LDDFA_I	ldda	[%r10, 0x0058], %f7
	.word 0xd1ba997f  ! 789: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd25a801f  ! 790: LDX_R	ldx	[%r10 + %r31], %r9
TH_LABEL790:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3ba985f  ! 791: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xca8a903f  ! 792: LDUBA_R	lduba	[%r10, %r31] 0x81, %r5
	.word 0xd3f2a01f  ! 793: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba993f  ! 794: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 795: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc40aa020  ! 796: LDUB_I	ldub	[%r10 + 0x0020], %r2
	.word 0xd1ba991f  ! 797: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2901f  ! 798: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba995f  ! 799: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba991f  ! 800: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd002a030  ! 801: LDUW_I	lduw	[%r10 + 0x0030], %r8
	.word 0xc9ba981f  ! 802: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xca82905f  ! 803: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r5
	.word 0xcc1ae050  ! 804: LDD_I	ldd	[%r11 + 0x0050], %r6
	.word 0xcc3a801f  ! 805: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc3a801f  ! 806: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2913f  ! 807: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcdba989f  ! 808: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba997f  ! 809: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 810: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc3a801f  ! 811: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba995f  ! 812: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa010  ! 813: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcc3aa010  ! 814: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcb22c01f  ! 815: STF_R	st	%f5, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9ba987f  ! 816: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc59aa060  ! 817: LDDFA_I	ldda	[%r10, 0x0060], %f2
	.word 0xcdbad99f  ! 818: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad8bf  ! 819: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2e01f  ! 820: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcde2d01f  ! 821: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xc502801f  ! 822: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc83a801f  ! 823: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc4cad07f  ! 824: LDSBA_R	ldsba	[%r11, %r31] 0x83, %r2
	.word 0xc9bad81f  ! 825: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc83ac01f  ! 826: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcd22801f  ! 827: STF_R	st	%f6, [%r31, %r10]
	.word 0xcdba98bf  ! 828: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcac2905f  ! 829: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r5
	.word 0xc9bad85f  ! 830: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xce52a06e  ! 831: LDSH_I	ldsh	[%r10 + 0x006e], %r7
	.word 0xcfbae070  ! 832: STDFA_I	stda	%f7, [0x0070, %r11]
	.word 0xcbe2a01f  ! 833: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbe2a01f  ! 834: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xd102a050  ! 835: LDF_I	ld	[%r10, 0x0050], %f8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3ba985f  ! 836: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce12e058  ! 837: LDUH_I	lduh	[%r11 + 0x0058], %r7
	.word 0xc09ae040  ! 838: LDDA_I	ldda	[%r11, + 0x0040] %asi, %r0
	.word 0xd3bad97f  ! 839: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae000  ! 840: STD_I	std	%r8, [%r11 + 0x0000]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3bad97f  ! 841: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 842: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xc9baa020  ! 843: STDFA_I	stda	%f4, [0x0020, %r10]
	.word 0xc83ac01f  ! 844: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc8d2903f  ! 845: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc8daa030  ! 846: LDXA_I	ldxa	[%r10, + 0x0030] %asi, %r4
	.word 0xd03ae048  ! 847: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xd3f2e01f  ! 848: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2d01f  ! 849: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd3f2e01f  ! 850: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc02801f  ! 851: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xc3ba999f  ! 852: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba983f  ! 853: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2901f  ! 854: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba999f  ! 855: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc79ae050  ! 856: LDDFA_I	ldda	[%r11, 0x0050], %f3
	.word 0xcfba993f  ! 857: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc252a01e  ! 858: LDSH_I	ldsh	[%r10 + 0x001e], %r1
	.word 0xcac2d05f  ! 859: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r5
	.word 0xc302e068  ! 860: LDF_I	ld	[%r11, 0x0068], %f1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdba999f  ! 861: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcd9aa048  ! 862: LDDFA_I	ldda	[%r10, 0x0048], %f6
	.word 0xcfe2a01f  ! 863: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba981f  ! 864: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 865: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc3aa020  ! 866: STD_I	std	%r6, [%r10 + 0x0020]
	.word 0xcfe2a01f  ! 867: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc522c01f  ! 868: STF_R	st	%f2, [%r31, %r11]
	.word 0xc322801f  ! 869: STF_R	st	%f1, [%r31, %r10]
	.word 0xc5f2d03f  ! 870: CASXA_I	casxa	[%r11] 0x81, %r31, %r2
TH_LABEL870:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5e2d11f  ! 871: CASA_I	casa	[%r11] 0x88, %r31, %r2
	.word 0xc43ac01f  ! 872: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad91f  ! 873: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xca5aa070  ! 874: LDX_I	ldx	[%r10 + 0x0070], %r5
	.word 0xcdbaa028  ! 875: STDFA_I	stda	%f6, [0x0028, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xce8aa062  ! 876: LDUBA_I	lduba	[%r10, + 0x0062] %asi, %r7
	.word 0xc5bad91f  ! 877: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc79aa060  ! 878: LDDFA_I	ldda	[%r10, 0x0060], %f3
	.word 0xcdf2d03f  ! 879: CASXA_I	casxa	[%r11] 0x81, %r31, %r6
	.word 0xccd2e07a  ! 880: LDSHA_I	ldsha	[%r11, + 0x007a] %asi, %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5f2913f  ! 881: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xc5f2a01f  ! 882: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba995f  ! 883: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 884: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd19ae008  ! 885: LDDFA_I	ldda	[%r11, 0x0008], %f8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc902a02c  ! 886: LDF_I	ld	[%r10, 0x002c], %f4
	.word 0xc3f2e01f  ! 887: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3f2e01f  ! 888: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad93f  ! 889: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc452801f  ! 890: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc8d2d11f  ! 891: LDSHA_R	ldsha	[%r11, %r31] 0x88, %r4
	.word 0xd1ba98bf  ! 892: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 893: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 894: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba981f  ! 895: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03aa028  ! 896: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd1ba991f  ! 897: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 898: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc502801f  ! 899: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc902a014  ! 900: LDF_I	ld	[%r10, 0x0014], %f4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfbaa060  ! 901: STDFA_I	stda	%f7, [0x0060, %r10]
	.word 0xd252e04e  ! 902: LDSH_I	ldsh	[%r11 + 0x004e], %r9
	.word 0xce12801f  ! 903: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xc282a054  ! 904: LDUWA_I	lduwa	[%r10, + 0x0054] %asi, %r1
	.word 0xc39aa008  ! 905: LDDFA_I	ldda	[%r10, 0x0008], %f1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7f2d01f  ! 906: CASXA_I	casxa	[%r11] 0x80, %r31, %r3
	.word 0xd302c01f  ! 907: LDF_R	ld	[%r11, %r31], %f9
	.word 0xc84aa00d  ! 908: LDSB_I	ldsb	[%r10 + 0x000d], %r4
	.word 0xc44aa02a  ! 909: LDSB_I	ldsb	[%r10 + 0x002a], %r2
	.word 0xc83aa008  ! 910: STD_I	std	%r4, [%r10 + 0x0008]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd302a040  ! 911: LDF_I	ld	[%r10, 0x0040], %f9
	.word 0xd302a020  ! 912: LDF_I	ld	[%r10, 0x0020], %f9
	.word 0xc3e2a01f  ! 913: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3f2913f  ! 914: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xc3f2a01f  ! 915: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3ba98bf  ! 916: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 917: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xcc02801f  ! 918: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xcb9aa070  ! 919: LDDFA_I	ldda	[%r10, 0x0070], %f5
	.word 0xc4d2d15f  ! 920: LDSHA_R	ldsha	[%r11, %r31] 0x8a, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd03aa010  ! 921: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1e2913f  ! 922: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xd1ba99bf  ! 923: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2913f  ! 924: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xd03aa010  ! 925: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc252801f  ! 926: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xc3e2e01f  ! 927: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc8c2e068  ! 928: LDSWA_I	ldswa	[%r11, + 0x0068] %asi, %r4
	.word 0xc7bad95f  ! 929: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc4c2d13f  ! 930: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1baa038  ! 931: STDFA_I	stda	%f8, [0x0038, %r10]
	.word 0xcde2a01f  ! 932: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2901f  ! 933: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba989f  ! 934: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa070  ! 935: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc3aa070  ! 936: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xc9bae010  ! 937: STDFA_I	stda	%f4, [0x0010, %r11]
	.word 0xcacad11f  ! 938: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r5
	.word 0xc99ae018  ! 939: LDDFA_I	ldda	[%r11, 0x0018], %f4
	.word 0xc692901f  ! 940: LDUHA_R	lduha	[%r10, %r31] 0x80, %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfbae050  ! 941: STDFA_I	stda	%f7, [0x0050, %r11]
	.word 0xc802c01f  ! 942: LDUW_R	lduw	[%r11 + %r31], %r4
	.word 0xd1ba987f  ! 943: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 944: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba995f  ! 945: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1ba983f  ! 946: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2911f  ! 947: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xd0c2907f  ! 948: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r8
	.word 0xcf02801f  ! 949: LDF_R	ld	[%r10, %r31], %f7
	.word 0xd3e2903f  ! 950: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc4d2a014  ! 951: LDSHA_I	ldsha	[%r10, + 0x0014] %asi, %r2
	.word 0xc43ae028  ! 952: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc43ac01f  ! 953: STD_R	std	%r2, [%r11 + %r31]
	.word 0xcd02a054  ! 954: LDF_I	ld	[%r10, 0x0054], %f6
	.word 0xcdbaa040  ! 955: STDFA_I	stda	%f6, [0x0040, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd292915f  ! 956: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r9
	.word 0xc3ba991f  ! 957: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa008  ! 958: STD_I	std	%r0, [%r10 + 0x0008]
	.word 0xcdbaa020  ! 959: STDFA_I	stda	%f6, [0x0020, %r10]
	.word 0xcfba997f  ! 960: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xce0aa051  ! 961: LDUB_I	ldub	[%r10 + 0x0051], %r7
	.word 0xc25aa000  ! 962: LDX_I	ldx	[%r10 + 0x0000], %r1
	.word 0xcbbad85f  ! 963: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc602801f  ! 964: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xd1ba99bf  ! 965: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd03aa030  ! 966: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xd1ba991f  ! 967: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcf02e028  ! 968: LDF_I	ld	[%r11, 0x0028], %f7
	.word 0xc3bad83f  ! 969: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad99f  ! 970: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc39aa038  ! 971: LDDFA_I	ldda	[%r10, 0x0038], %f1
	.word 0xd3ba99bf  ! 972: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2911f  ! 973: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xc4cad01f  ! 974: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r2
	.word 0xc81aa060  ! 975: LDD_I	ldd	[%r10 + 0x0060], %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcec2915f  ! 976: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r7
	.word 0xc642a068  ! 977: LDSW_I	ldsw	[%r10 + 0x0068], %r3
	.word 0xc2c2d01f  ! 978: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r1
	.word 0xccdad15f  ! 979: LDXA_R	ldxa	[%r11, %r31] 0x8a, %r6
	.word 0xcc3aa030  ! 980: STD_I	std	%r6, [%r10 + 0x0030]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc3aa030  ! 981: STD_I	std	%r6, [%r10 + 0x0030]
	.word 0xc84ac01f  ! 982: LDSB_R	ldsb	[%r11 + %r31], %r4
	.word 0xc7e2903f  ! 983: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xd20ae017  ! 984: LDUB_I	ldub	[%r11 + 0x0017], %r9
	.word 0xc20aa00c  ! 985: LDUB_I	ldub	[%r10 + 0x000c], %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7f2a01f  ! 986: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba991f  ! 987: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc28ae003  ! 988: LDUBA_I	lduba	[%r11, + 0x0003] %asi, %r1
	.word 0xcf02e038  ! 989: LDF_I	ld	[%r11, 0x0038], %f7
	.word 0xcff2a01f  ! 990: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc3a801f  ! 991: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba993f  ! 992: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd04aa023  ! 993: LDSB_I	ldsb	[%r10 + 0x0023], %r8
	.word 0xc9bad8bf  ! 994: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad85f  ! 995: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcb9ae020  ! 996: LDDFA_I	ldda	[%r11, 0x0020], %f5
	.word 0xcac2a03c  ! 997: LDSWA_I	ldswa	[%r10, + 0x003c] %asi, %r5
	.word 0xcfbad9bf  ! 998: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbaa078  ! 999: STDFA_I	stda	%f7, [0x0078, %r10]
	.word 0xc03a801f  ! 1000: STD_R	std	%r0, [%r10 + %r31]
TH_LABEL1000:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	subcc %r30, 1, %r30
	bnz  TH7_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	add	%g0,	0x1,	%r30
TH6_LOOP_START:
	.word 0xc5ba999f  ! 1: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd282e02c  ! 2: LDUWA_I	lduwa	[%r11, + 0x002c] %asi, %r9
	.word 0xd202e014  ! 3: LDUW_I	lduw	[%r11 + 0x0014], %r9
	.word 0xca5ac01f  ! 4: LDX_R	ldx	[%r11 + %r31], %r5
	.word 0xcde2e01f  ! 5: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcdbad99f  ! 6: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcad2901f  ! 7: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r5
	.word 0xc9e2903f  ! 8: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc842e03c  ! 9: LDSW_I	ldsw	[%r11 + 0x003c], %r4
	.word 0xc28aa026  ! 10: LDUBA_I	lduba	[%r10, + 0x0026] %asi, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc09aa030  ! 11: LDDA_I	ldda	[%r10, + 0x0030] %asi, %r0
	.word 0xcb02e00c  ! 12: LDF_I	ld	[%r11, 0x000c], %f5
	.word 0xc3ba989f  ! 13: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 14: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba981f  ! 15: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc4caa04b  ! 16: LDSBA_I	ldsba	[%r10, + 0x004b] %asi, %r2
	.word 0xd08ae035  ! 17: LDUBA_I	lduba	[%r11, + 0x0035] %asi, %r8
	.word 0xcdf2a01f  ! 18: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2901f  ! 19: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba98bf  ! 20: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcdba983f  ! 21: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 22: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc82913f  ! 23: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r6
	.word 0xd3ba99bf  ! 24: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 25: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfbaa050  ! 26: STDFA_I	stda	%f7, [0x0050, %r10]
	.word 0xd1e2e01f  ! 27: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xc922801f  ! 28: STF_R	st	%f4, [%r31, %r10]
	.word 0xc9bad97f  ! 29: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad93f  ! 30: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9e2e01f  ! 31: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc3bae078  ! 32: STDFA_I	stda	%f1, [0x0078, %r11]
	.word 0xcdba991f  ! 33: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 34: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba999f  ! 35: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc3aa028  ! 36: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xcc3a801f  ! 37: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2911f  ! 38: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcdba993f  ! 39: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2911f  ! 40: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc81ae020  ! 41: LDD_I	ldd	[%r11 + 0x0020], %r4
	.word 0xc5f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2a01f  ! 43: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc9baa010  ! 44: STDFA_I	stda	%f4, [0x0010, %r10]
	.word 0xcbe2e01f  ! 45: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc4da901f  ! 46: LDXA_R	ldxa	[%r10, %r31] 0x80, %r2
	.word 0xd1ba981f  ! 47: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 48: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1f2a01f  ! 49: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba98bf  ! 50: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3baa070  ! 51: STDFA_I	stda	%f1, [0x0070, %r10]
	.word 0xcc8aa069  ! 52: LDUBA_I	lduba	[%r10, + 0x0069] %asi, %r6
	.word 0xca8a915f  ! 53: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r5
	.word 0xcb9ae048  ! 54: LDDFA_I	ldda	[%r11, 0x0048], %f5
	.word 0xc03ac01f  ! 55: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd282e060  ! 56: LDUWA_I	lduwa	[%r11, + 0x0060] %asi, %r9
	.word 0xc9bad83f  ! 57: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad9bf  ! 58: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd3bae068  ! 59: STDFA_I	stda	%f9, [0x0068, %r11]
	.word 0xd102801f  ! 60: LDF_R	ld	[%r10, %r31], %f8
TH_LABEL60:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3ba999f  ! 61: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc4c2915f  ! 62: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r2
	.word 0xc202801f  ! 63: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xc5ba99bf  ! 64: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc3baa078  ! 65: STDFA_I	stda	%f1, [0x0078, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1f2e01f  ! 66: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd03ac01f  ! 67: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad85f  ! 68: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae048  ! 69: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xca12801f  ! 70: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd242a05c  ! 71: LDSW_I	ldsw	[%r10 + 0x005c], %r9
	.word 0xc01a801f  ! 72: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xc412c01f  ! 73: LDUH_R	lduh	[%r11 + %r31], %r2
	.word 0xc9f2e01f  ! 74: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc702801f  ! 75: LDF_R	ld	[%r10, %r31], %f3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbba981f  ! 76: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd302801f  ! 77: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc7baa010  ! 78: STDFA_I	stda	%f3, [0x0010, %r10]
	.word 0xcbbad95f  ! 79: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd122c01f  ! 80: STF_R	st	%f8, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd292d11f  ! 81: LDUHA_R	lduha	[%r11, %r31] 0x88, %r9
	.word 0xd3bad89f  ! 82: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 83: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad95f  ! 84: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad93f  ! 85: STDFA_R	stda	%f9, [%r31, %r11]
TH_LABEL85:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc39ae000  ! 86: LDDFA_I	ldda	[%r11, 0x0000], %f1
	.word 0xc3f2d01f  ! 87: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3e2d01f  ! 88: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc482901f  ! 89: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r2
	.word 0xc39aa020  ! 90: LDDFA_I	ldda	[%r10, 0x0020], %f1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc83aa070  ! 91: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xc3bae058  ! 92: STDFA_I	stda	%f1, [0x0058, %r11]
	.word 0xc3ba989f  ! 93: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc9baa070  ! 94: STDFA_I	stda	%f4, [0x0070, %r10]
	.word 0xcc3a801f  ! 95: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc3a801f  ! 96: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 97: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba989f  ! 98: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 99: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd01aa040  ! 100: LDD_I	ldd	[%r10 + 0x0040], %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5bad91f  ! 101: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad89f  ! 102: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc24ac01f  ! 103: LDSB_R	ldsb	[%r11 + %r31], %r1
	.word 0xd052e074  ! 104: LDSH_I	ldsh	[%r11 + 0x0074], %r8
	.word 0xd3f2e01f  ! 105: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3f2e01f  ! 106: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xc4da903f  ! 107: LDXA_R	ldxa	[%r10, %r31] 0x81, %r2
	.word 0xcfba983f  ! 108: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba991f  ! 109: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc42a014  ! 110: LDSW_I	ldsw	[%r10 + 0x0014], %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc8dae030  ! 111: LDXA_I	ldxa	[%r11, + 0x0030] %asi, %r4
	.word 0xc5baa020  ! 112: STDFA_I	stda	%f2, [0x0020, %r10]
	.word 0xc9f2903f  ! 113: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xcc4ac01f  ! 114: LDSB_R	ldsb	[%r11 + %r31], %r6
	.word 0xc9f2913f  ! 115: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9e2913f  ! 116: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9e2901f  ! 117: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba997f  ! 118: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 119: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba99bf  ! 120: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9e2901f  ! 121: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc64aa00a  ! 122: LDSB_I	ldsb	[%r10 + 0x000a], %r3
	.word 0xcdbad89f  ! 123: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc4dae028  ! 124: LDXA_I	ldxa	[%r11, + 0x0028] %asi, %r2
	.word 0xd03ac01f  ! 125: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1bad85f  ! 126: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad8bf  ! 127: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc01aa038  ! 128: LDD_I	ldd	[%r10 + 0x0038], %r0
	.word 0xd3ba997f  ! 129: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba983f  ! 130: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL130:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc602c01f  ! 131: LDUW_R	lduw	[%r11 + %r31], %r3
	.word 0xc3ba983f  ! 132: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcf9aa058  ! 133: LDDFA_I	ldda	[%r10, 0x0058], %f7
	.word 0xcfba995f  ! 134: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcdbaa020  ! 135: STDFA_I	stda	%f6, [0x0020, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5ba985f  ! 136: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2901f  ! 137: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xceca901f  ! 138: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r7
	.word 0xcdf2a01f  ! 139: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba99bf  ! 140: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc682a02c  ! 141: LDUWA_I	lduwa	[%r10, + 0x002c] %asi, %r3
	.word 0xd0cad11f  ! 142: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r8
	.word 0xc3f2e01f  ! 143: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xcc4a801f  ! 144: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xccdaa028  ! 145: LDXA_I	ldxa	[%r10, + 0x0028] %asi, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5e2a01f  ! 146: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcd02a044  ! 147: LDF_I	ld	[%r10, 0x0044], %f6
	.word 0xc3ba989f  ! 148: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2903f  ! 149: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc3e2a01f  ! 150: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd0c2d17f  ! 151: LDSWA_R	ldswa	[%r11, %r31] 0x8b, %r8
	.word 0xc5e2e01f  ! 152: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xcc02a034  ! 153: LDUW_I	lduw	[%r10 + 0x0034], %r6
	.word 0xc7ba995f  ! 154: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 155: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7ba985f  ! 156: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 157: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xd19ae008  ! 158: LDDFA_I	ldda	[%r11, 0x0008], %f8
	.word 0xd1baa008  ! 159: STDFA_I	stda	%f8, [0x0008, %r10]
	.word 0xc812e066  ! 160: LDUH_I	lduh	[%r11 + 0x0066], %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc4cad17f  ! 161: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r2
	.word 0xc3bad99f  ! 162: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 163: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3e2e01f  ! 164: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2e01f  ! 165: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd102801f  ! 166: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc692d05f  ! 167: LDUHA_R	lduha	[%r11, %r31] 0x82, %r3
	.word 0xc3baa008  ! 168: STDFA_I	stda	%f1, [0x0008, %r10]
	.word 0xc41a801f  ! 169: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc5e2e01f  ! 170: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc59aa058  ! 171: LDDFA_I	ldda	[%r10, 0x0058], %f2
	.word 0xd3bad87f  ! 172: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 173: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xc39ae058  ! 174: LDDFA_I	ldda	[%r11, 0x0058], %f1
	.word 0xcbbad91f  ! 175: STDFA_R	stda	%f5, [%r31, %r11]
TH_LABEL175:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbbad9bf  ! 176: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcdbae038  ! 177: STDFA_I	stda	%f6, [0x0038, %r11]
	.word 0xc9ba997f  ! 178: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd242e014  ! 179: LDSW_I	ldsw	[%r11 + 0x0014], %r9
	.word 0xcf22c01f  ! 180: STF_R	st	%f7, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfbad81f  ! 181: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc2d2e04e  ! 182: LDSHA_I	ldsha	[%r11, + 0x004e] %asi, %r1
	.word 0xca5ae078  ! 183: LDX_I	ldx	[%r11 + 0x0078], %r5
	.word 0xceca911f  ! 184: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r7
	.word 0xc7e2e01f  ! 185: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xca5ac01f  ! 186: LDX_R	ldx	[%r11 + %r31], %r5
	.word 0xc3bad85f  ! 187: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcada911f  ! 188: LDXA_R	ldxa	[%r10, %r31] 0x88, %r5
	.word 0xc3e2911f  ! 189: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xc8d2d11f  ! 190: LDSHA_R	ldsha	[%r11, %r31] 0x88, %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9bad8bf  ! 191: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xce0aa02c  ! 192: LDUB_I	ldub	[%r10 + 0x002c], %r7
	.word 0xcfbad8bf  ! 193: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd04a801f  ! 194: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xd05ac01f  ! 195: LDX_R	ldx	[%r11 + %r31], %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc59ae058  ! 196: LDDFA_I	ldda	[%r11, 0x0058], %f2
	.word 0xcdbaa020  ! 197: STDFA_I	stda	%f6, [0x0020, %r10]
	.word 0xc65aa078  ! 198: LDX_I	ldx	[%r10 + 0x0078], %r3
	.word 0xc24ae06b  ! 199: LDSB_I	ldsb	[%r11 + 0x006b], %r1
	.word 0xc9e2d03f  ! 200: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xca5a801f  ! 201: LDX_R	ldx	[%r10 + %r31], %r5
	.word 0xc5e2a01f  ! 202: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc7baa048  ! 203: STDFA_I	stda	%f3, [0x0048, %r10]
	.word 0xc5ba981f  ! 204: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd39ae010  ! 205: LDDFA_I	ldda	[%r11, 0x0010], %f9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xce5ae060  ! 206: LDX_I	ldx	[%r11 + 0x0060], %r7
	.word 0xc81ac01f  ! 207: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xca12c01f  ! 208: LDUH_R	lduh	[%r11 + %r31], %r5
	.word 0xd102801f  ! 209: LDF_R	ld	[%r10, %r31], %f8
	.word 0xd19aa050  ! 210: LDDFA_I	ldda	[%r10, 0x0050], %f8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdba981f  ! 211: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc702c01f  ! 212: LDF_R	ld	[%r11, %r31], %f3
	.word 0xc7bad8bf  ! 213: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xce52e016  ! 214: LDSH_I	ldsh	[%r11 + 0x0016], %r7
	.word 0xc5f2a01f  ! 215: CASXA_R	casxa	[%r10]%asi, %r31, %r2
TH_LABEL215:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5ba981f  ! 216: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 217: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 218: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc40a801f  ! 219: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xc85ae050  ! 220: LDX_I	ldx	[%r11 + 0x0050], %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3e2903f  ! 221: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd03a801f  ! 222: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd25ac01f  ! 223: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xc5e2a01f  ! 224: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc482d15f  ! 225: LDUWA_R	lduwa	[%r11, %r31] 0x8a, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcec2901f  ! 226: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r7
	.word 0xd3ba993f  ! 227: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba999f  ! 228: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 229: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 230: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd03aa010  ! 231: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd3e2a01f  ! 232: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 233: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba993f  ! 234: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa010  ! 235: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd03a801f  ! 236: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd2d2911f  ! 237: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r9
	.word 0xd122801f  ! 238: STF_R	st	%f8, [%r31, %r10]
	.word 0xcfba981f  ! 239: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd102c01f  ! 240: LDF_R	ld	[%r11, %r31], %f8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc43aa010  ! 241: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xc702a034  ! 242: LDF_I	ld	[%r10, 0x0034], %f3
	.word 0xcb02801f  ! 243: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc48a907f  ! 244: LDUBA_R	lduba	[%r10, %r31] 0x83, %r2
	.word 0xd03aa038  ! 245: STD_I	std	%r8, [%r10 + 0x0038]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3ba981f  ! 246: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 247: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2911f  ! 248: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xc482905f  ! 249: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r2
	.word 0xcbba99bf  ! 250: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL250:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba985f  ! 251: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa038  ! 252: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xca0ae00c  ! 253: LDUB_I	ldub	[%r11 + 0x000c], %r5
	.word 0xd3ba993f  ! 254: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 255: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3f2a01f  ! 256: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03aa058  ! 257: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3ba989f  ! 258: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xca42c01f  ! 259: LDSW_R	ldsw	[%r11 + %r31], %r5
	.word 0xd20aa077  ! 260: LDUB_I	ldub	[%r10 + 0x0077], %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1bad87f  ! 261: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad89f  ! 262: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad97f  ! 263: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcac2901f  ! 264: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r5
	.word 0xc7e2a01f  ! 265: CASA_R	casa	[%r10] %asi, %r31, %r3
TH_LABEL265:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7ba991f  ! 266: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 267: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 268: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc2ca915f  ! 269: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r1
	.word 0xc59ae038  ! 270: LDDFA_I	ldda	[%r11, 0x0038], %f2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc81ae020  ! 271: LDD_I	ldd	[%r11 + 0x0020], %r4
	.word 0xc8d2a036  ! 272: LDSHA_I	ldsha	[%r10, + 0x0036] %asi, %r4
	.word 0xc43aa058  ! 273: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc5f2a01f  ! 274: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5f2901f  ! 275: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdbae038  ! 276: STDFA_I	stda	%f6, [0x0038, %r11]
	.word 0xca0ac01f  ! 277: LDUB_R	ldub	[%r11 + %r31], %r5
	.word 0xcc3aa038  ! 278: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcfba985f  ! 279: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 280: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfe2a01f  ! 281: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcc1aa070  ! 282: LDD_I	ldd	[%r10 + 0x0070], %r6
	.word 0xcde2d11f  ! 283: CASA_I	casa	[%r11] 0x88, %r31, %r6
	.word 0xcdf2d01f  ! 284: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xc212e072  ! 285: LDUH_I	lduh	[%r11 + 0x0072], %r1
TH_LABEL285:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc702e048  ! 286: LDF_I	ld	[%r11, 0x0048], %f3
	.word 0xc5ba993f  ! 287: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2913f  ! 288: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5ba991f  ! 289: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc6da905f  ! 290: LDXA_R	ldxa	[%r10, %r31] 0x82, %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9ba999f  ! 291: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 292: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xcb9ae070  ! 293: LDDFA_I	ldda	[%r11, 0x0070], %f5
	.word 0xcbf2901f  ! 294: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbf2913f  ! 295: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc6d2e048  ! 296: LDSHA_I	ldsha	[%r11, + 0x0048] %asi, %r3
	.word 0xc03ac01f  ! 297: STD_R	std	%r0, [%r11 + %r31]
	.word 0xcc02a02c  ! 298: LDUW_I	lduw	[%r10 + 0x002c], %r6
	.word 0xd19aa030  ! 299: LDDFA_I	ldda	[%r10, 0x0030], %f8
	.word 0xcc3aa040  ! 300: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdba983f  ! 301: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba989f  ! 302: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2913f  ! 303: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xd282917f  ! 304: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r9
	.word 0xd3bad91f  ! 305: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3bad83f  ! 306: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 307: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad87f  ! 308: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcadaa060  ! 309: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r5
	.word 0xca02a064  ! 310: LDUW_I	lduw	[%r10 + 0x0064], %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7baa050  ! 311: STDFA_I	stda	%f3, [0x0050, %r10]
	.word 0xc3e2901f  ! 312: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xcaca903f  ! 313: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r5
	.word 0xc692e02e  ! 314: LDUHA_I	lduha	[%r11, + 0x002e] %asi, %r3
	.word 0xc7bad91f  ! 315: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9baa030  ! 316: STDFA_I	stda	%f4, [0x0030, %r10]
	.word 0xc64aa05e  ! 317: LDSB_I	ldsb	[%r10 + 0x005e], %r3
	.word 0xcbf2e01f  ! 318: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xd3bae038  ! 319: STDFA_I	stda	%f9, [0x0038, %r11]
	.word 0xcc42e014  ! 320: LDSW_I	ldsw	[%r11 + 0x0014], %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd03aa050  ! 321: STD_I	std	%r8, [%r10 + 0x0050]
	.word 0xd1f2a01f  ! 322: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba985f  ! 323: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 324: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xccd2a006  ! 325: LDSHA_I	ldsha	[%r10, + 0x0006] %asi, %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5ba991f  ! 326: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd25ae050  ! 327: LDX_I	ldx	[%r11 + 0x0050], %r9
	.word 0xcfba997f  ! 328: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd0d2a076  ! 329: LDSHA_I	ldsha	[%r10, + 0x0076] %asi, %r8
	.word 0xc5bad9bf  ! 330: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3bae000  ! 331: STDFA_I	stda	%f1, [0x0000, %r11]
	.word 0xcccaa035  ! 332: LDSBA_I	ldsba	[%r10, + 0x0035] %asi, %r6
	.word 0xd03a801f  ! 333: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba995f  ! 334: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcc0a801f  ! 335: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3e2d11f  ! 336: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xc3e2d11f  ! 337: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xc5bae000  ! 338: STDFA_I	stda	%f2, [0x0000, %r11]
	.word 0xc83ae018  ! 339: STD_I	std	%r4, [%r11 + 0x0018]
	.word 0xd0d2d11f  ! 340: LDSHA_R	ldsha	[%r11, %r31] 0x88, %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcb02a048  ! 341: LDF_I	ld	[%r10, 0x0048], %f5
	.word 0xc7ba98bf  ! 342: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc852a05a  ! 343: LDSH_I	ldsh	[%r10 + 0x005a], %r4
	.word 0xcada915f  ! 344: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r5
	.word 0xd28aa067  ! 345: LDUBA_I	lduba	[%r10, + 0x0067] %asi, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdbae020  ! 346: STDFA_I	stda	%f6, [0x0020, %r11]
	.word 0xd3bad85f  ! 347: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d01f  ! 348: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd03ae010  ! 349: STD_I	std	%r8, [%r11 + 0x0010]
	.word 0xd3bad93f  ! 350: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd0cad13f  ! 351: LDSBA_R	ldsba	[%r11, %r31] 0x89, %r8
	.word 0xc9f2901f  ! 352: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2913f  ! 353: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc83a801f  ! 354: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 355: CASA_R	casa	[%r10] %asi, %r31, %r4
TH_LABEL355:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9e2903f  ! 356: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xcf02e050  ! 357: LDF_I	ld	[%r11, 0x0050], %f7
	.word 0xc43aa000  ! 358: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc43aa000  ! 359: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc202c01f  ! 360: LDUW_R	lduw	[%r11 + %r31], %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5e2a01f  ! 361: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcaca903f  ! 362: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r5
	.word 0xc3ba98bf  ! 363: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc2da901f  ! 364: LDXA_R	ldxa	[%r10, %r31] 0x80, %r1
	.word 0xceca911f  ! 365: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03aa000  ! 366: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd002801f  ! 367: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xc99aa050  ! 368: LDDFA_I	ldda	[%r10, 0x0050], %f4
	.word 0xcdba995f  ! 369: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 370: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdf2a01f  ! 371: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba99bf  ! 372: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 373: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc722801f  ! 374: STF_R	st	%f3, [%r31, %r10]
	.word 0xc9ba99bf  ! 375: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc292903f  ! 376: LDUHA_R	lduha	[%r10, %r31] 0x81, %r1
	.word 0xd1f2a01f  ! 377: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc302a070  ! 378: LDF_I	ld	[%r10, 0x0070], %f1
	.word 0xd03a801f  ! 379: STD_R	std	%r8, [%r10 + %r31]
	.word 0xcb22801f  ! 380: STF_R	st	%f5, [%r31, %r10]
TH_LABEL380:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3ba991f  ! 381: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 382: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc6d2e06e  ! 383: LDSHA_I	ldsha	[%r11, + 0x006e] %asi, %r3
	.word 0xd2d2d17f  ! 384: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r9
	.word 0xc84ac01f  ! 385: LDSB_R	ldsb	[%r11 + %r31], %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7ba985f  ! 386: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc48aa055  ! 387: LDUBA_I	lduba	[%r10, + 0x0055] %asi, %r2
	.word 0xc7ba997f  ! 388: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2911f  ! 389: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xce82a064  ! 390: LDUWA_I	lduwa	[%r10, + 0x0064] %asi, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc03ac01f  ! 391: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc85a801f  ! 392: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xc03ac01f  ! 393: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad91f  ! 394: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd0da915f  ! 395: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcff2a01f  ! 396: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc2c2903f  ! 397: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r1
	.word 0xcecaa037  ! 398: LDSBA_I	ldsba	[%r10, + 0x0037] %asi, %r7
	.word 0xc9bad99f  ! 399: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 400: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc642a004  ! 401: LDSW_I	ldsw	[%r10 + 0x0004], %r3
	.word 0xc682e06c  ! 402: LDUWA_I	lduwa	[%r11, + 0x006c] %asi, %r3
	.word 0xc7e2d13f  ! 403: CASA_I	casa	[%r11] 0x89, %r31, %r3
	.word 0xc7f2e01f  ! 404: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xd00ac01f  ! 405: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdf2d01f  ! 406: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad8bf  ! 407: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xca52801f  ! 408: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xc6d2a060  ! 409: LDSHA_I	ldsha	[%r10, + 0x0060] %asi, %r3
	.word 0xcdf2e01f  ! 410: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdf2d01f  ! 411: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad99f  ! 412: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad95f  ! 413: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc652801f  ! 414: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xcc5ae050  ! 415: LDX_I	ldx	[%r11 + 0x0050], %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5ba981f  ! 416: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc852a01c  ! 417: LDSH_I	ldsh	[%r10 + 0x001c], %r4
	.word 0xc482905f  ! 418: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r2
	.word 0xcfbad87f  ! 419: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd00ac01f  ! 420: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfba985f  ! 421: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 422: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba999f  ! 423: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 424: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc212c01f  ! 425: LDUH_R	lduh	[%r11 + %r31], %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc4c2905f  ! 426: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r2
	.word 0xc702a050  ! 427: LDF_I	ld	[%r10, 0x0050], %f3
	.word 0xcbbae040  ! 428: STDFA_I	stda	%f5, [0x0040, %r11]
	.word 0xc3ba999f  ! 429: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba99bf  ! 430: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc68ae01d  ! 431: LDUBA_I	lduba	[%r11, + 0x001d] %asi, %r3
	.word 0xc88aa055  ! 432: LDUBA_I	lduba	[%r10, + 0x0055] %asi, %r4
	.word 0xcc3a801f  ! 433: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba997f  ! 434: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 435: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc89ae038  ! 436: LDDA_I	ldda	[%r11, + 0x0038] %asi, %r4
	.word 0xc922801f  ! 437: STF_R	st	%f4, [%r31, %r10]
	.word 0xcbf2d01f  ! 438: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xc44ac01f  ! 439: LDSB_R	ldsb	[%r11 + %r31], %r2
	.word 0xd1f2903f  ! 440: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1ba98bf  ! 441: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba991f  ! 442: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2903f  ! 443: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xd1ba981f  ! 444: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa048  ! 445: STD_I	std	%r8, [%r10 + 0x0048]
TH_LABEL445:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd2d2901f  ! 446: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r9
	.word 0xcbbad83f  ! 447: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xca0aa05b  ! 448: LDUB_I	ldub	[%r10 + 0x005b], %r5
	.word 0xc9f2901f  ! 449: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba99bf  ! 450: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9ba981f  ! 451: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba995f  ! 452: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba99bf  ! 453: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc302e07c  ! 454: LDF_I	ld	[%r11, 0x007c], %f1
	.word 0xd3ba983f  ! 455: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc892d01f  ! 456: LDUHA_R	lduha	[%r11, %r31] 0x80, %r4
	.word 0xcccaa02c  ! 457: LDSBA_I	ldsba	[%r10, + 0x002c] %asi, %r6
	.word 0xc3ba995f  ! 458: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xca5ac01f  ! 459: LDX_R	ldx	[%r11 + %r31], %r5
	.word 0xc292d01f  ! 460: LDUHA_R	lduha	[%r11, %r31] 0x80, %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc702c01f  ! 461: LDF_R	ld	[%r11, %r31], %f3
	.word 0xd3f2a01f  ! 462: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba98bf  ! 463: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba993f  ! 464: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3bae020  ! 465: STDFA_I	stda	%f9, [0x0020, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbbad87f  ! 466: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad9bf  ! 467: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d03f  ! 468: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xce92e06e  ! 469: LDUHA_I	lduha	[%r11, + 0x006e] %asi, %r7
	.word 0xd03aa008  ! 470: STD_I	std	%r8, [%r10 + 0x0008]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3ba983f  ! 471: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 472: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba98bf  ! 473: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 474: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xcbbaa060  ! 475: STDFA_I	stda	%f5, [0x0060, %r10]
TH_LABEL475:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbe2d01f  ! 476: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xcfbaa028  ! 477: STDFA_I	stda	%f7, [0x0028, %r10]
	.word 0xd3ba983f  ! 478: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba985f  ! 479: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd00ae030  ! 480: LDUB_I	ldub	[%r11 + 0x0030], %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcf9ae070  ! 481: LDDFA_I	ldda	[%r11, 0x0070], %f7
	.word 0xc9bad83f  ! 482: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc502c01f  ! 483: LDF_R	ld	[%r11, %r31], %f2
	.word 0xc9bad87f  ! 484: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d11f  ! 485: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcf9aa008  ! 486: LDDFA_I	ldda	[%r10, 0x0008], %f7
	.word 0xc28ad15f  ! 487: LDUBA_R	lduba	[%r11, %r31] 0x8a, %r1
	.word 0xcac2a034  ! 488: LDSWA_I	ldswa	[%r10, + 0x0034] %asi, %r5
	.word 0xc7ba995f  ! 489: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 490: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc40a801f  ! 491: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xcbba985f  ! 492: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc412801f  ! 493: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xc81ac01f  ! 494: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xd08ae02f  ! 495: LDUBA_I	lduba	[%r11, + 0x002f] %asi, %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3f2a01f  ! 496: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba985f  ! 497: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 498: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3e2901f  ! 499: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba99bf  ! 500: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL500:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3f2a01f  ! 501: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba989f  ! 502: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2913f  ! 503: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba99bf  ! 504: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc652801f  ! 505: LDSH_R	ldsh	[%r10 + %r31], %r3
TH_LABEL505:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcde2a01f  ! 506: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcc3a801f  ! 507: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd102801f  ! 508: LDF_R	ld	[%r10, %r31], %f8
	.word 0xce02801f  ! 509: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xce12801f  ! 510: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7e2901f  ! 511: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba98bf  ! 512: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa000  ! 513: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc7f2913f  ! 514: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba98bf  ! 515: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7f2901f  ! 516: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc09aa030  ! 517: LDDA_I	ldda	[%r10, + 0x0030] %asi, %r0
	.word 0xd00aa02f  ! 518: LDUB_I	ldub	[%r10 + 0x002f], %r8
	.word 0xd19aa078  ! 519: LDDFA_I	ldda	[%r10, 0x0078], %f8
	.word 0xcfba983f  ! 520: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd252e030  ! 521: LDSH_I	ldsh	[%r11 + 0x0030], %r9
	.word 0xce12a01c  ! 522: LDUH_I	lduh	[%r10 + 0x001c], %r7
	.word 0xc6da917f  ! 523: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r3
	.word 0xcfba993f  ! 524: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 525: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc702801f  ! 526: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc84a801f  ! 527: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xd3ba983f  ! 528: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc852801f  ! 529: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xd1e2d01f  ! 530: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd09aa000  ! 531: LDDA_I	ldda	[%r10, + 0x0000] %asi, %r8
	.word 0xc5ba99bf  ! 532: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc292915f  ! 533: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r1
	.word 0xc9bad93f  ! 534: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad95f  ! 535: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcb9aa040  ! 536: LDDFA_I	ldda	[%r10, 0x0040], %f5
	.word 0xcbba981f  ! 537: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba983f  ! 538: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd20aa01e  ! 539: LDUB_I	ldub	[%r10 + 0x001e], %r9
	.word 0xccdad03f  ! 540: LDXA_R	ldxa	[%r11, %r31] 0x81, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfbad85f  ! 541: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc4d2a014  ! 542: LDSHA_I	ldsha	[%r10, + 0x0014] %asi, %r2
	.word 0xcf9aa048  ! 543: LDDFA_I	ldda	[%r10, 0x0048], %f7
	.word 0xc302c01f  ! 544: LDF_R	ld	[%r11, %r31], %f1
	.word 0xc212c01f  ! 545: LDUH_R	lduh	[%r11 + %r31], %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfbad95f  ! 546: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 547: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xc41a801f  ! 548: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc922801f  ! 549: STF_R	st	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 550: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9e2903f  ! 551: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xcf9ae058  ! 552: LDDFA_I	ldda	[%r11, 0x0058], %f7
	.word 0xd39aa060  ! 553: LDDFA_I	ldda	[%r10, 0x0060], %f9
	.word 0xcbba981f  ! 554: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 555: CASXA_R	casxa	[%r10]%asi, %r31, %r5
TH_LABEL555:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xca92a042  ! 556: LDUHA_I	lduha	[%r10, + 0x0042] %asi, %r5
	.word 0xc5e2913f  ! 557: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5ba999f  ! 558: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba997f  ! 559: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba997f  ! 560: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9bae060  ! 561: STDFA_I	stda	%f4, [0x0060, %r11]
	.word 0xc9ba987f  ! 562: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa000  ! 563: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xc9ba983f  ! 564: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd0c2a00c  ! 565: LDSWA_I	ldswa	[%r10, + 0x000c] %asi, %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc812c01f  ! 566: LDUH_R	lduh	[%r11 + %r31], %r4
	.word 0xc7ba999f  ! 567: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa048  ! 568: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc7ba981f  ! 569: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 570: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7e2913f  ! 571: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba991f  ! 572: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc502e020  ! 573: LDF_I	ld	[%r11, 0x0020], %f2
	.word 0xc9ba981f  ! 574: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 575: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9e2a01f  ! 576: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc692a030  ! 577: LDUHA_I	lduha	[%r10, + 0x0030] %asi, %r3
	.word 0xc9e2901f  ! 578: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba987f  ! 579: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd3bae028  ! 580: STDFA_I	stda	%f9, [0x0028, %r11]
TH_LABEL580:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc812801f  ! 581: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xc3bad87f  ! 582: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad9bf  ! 583: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad81f  ! 584: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad91f  ! 585: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd292d07f  ! 586: LDUHA_R	lduha	[%r11, %r31] 0x83, %r9
	.word 0xd3bad95f  ! 587: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xccd2a062  ! 588: LDSHA_I	ldsha	[%r10, + 0x0062] %asi, %r6
	.word 0xc802a054  ! 589: LDUW_I	lduw	[%r10 + 0x0054], %r4
	.word 0xc3e2e01f  ! 590: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3bad87f  ! 591: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc41aa058  ! 592: LDD_I	ldd	[%r10 + 0x0058], %r2
	.word 0xc3bad87f  ! 593: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc522801f  ! 594: STF_R	st	%f2, [%r31, %r10]
	.word 0xce4ac01f  ! 595: LDSB_R	ldsb	[%r11 + %r31], %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc43ae060  ! 596: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xc65a801f  ! 597: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xd0daa038  ! 598: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r8
	.word 0xcd9aa018  ! 599: LDDFA_I	ldda	[%r10, 0x0018], %f6
	.word 0xc612a07c  ! 600: LDUH_I	lduh	[%r10 + 0x007c], %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdbad9bf  ! 601: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc12801f  ! 602: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xc60a801f  ! 603: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xd1ba99bf  ! 604: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca82911f  ! 605: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5ba987f  ! 606: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 607: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc01ac01f  ! 608: LDD_R	ldd	[%r11 + %r31], %r0
	.word 0xcb22c01f  ! 609: STF_R	st	%f5, [%r31, %r11]
	.word 0xd1e2d01f  ! 610: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc01ae038  ! 611: LDD_I	ldd	[%r11 + 0x0038], %r0
	.word 0xc83a801f  ! 612: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba983f  ! 613: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 614: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd28a901f  ! 615: LDUBA_R	lduba	[%r10, %r31] 0x80, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbbad81f  ! 616: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ac01f  ! 617: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad99f  ! 618: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d11f  ! 619: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xcc52a032  ! 620: LDSH_I	ldsh	[%r10 + 0x0032], %r6
TH_LABEL620:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc6d2d17f  ! 621: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r3
	.word 0xd01aa028  ! 622: LDD_I	ldd	[%r10 + 0x0028], %r8
	.word 0xcbba981f  ! 623: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2913f  ! 624: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xd09aa068  ! 625: LDDA_I	ldda	[%r10, + 0x0068] %asi, %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc25a801f  ! 626: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xc5f2a01f  ! 627: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5f2903f  ! 628: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xc5e2911f  ! 629: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc892a02e  ! 630: LDUHA_I	lduha	[%r10, + 0x002e] %asi, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd2ca901f  ! 631: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r9
	.word 0xcecad15f  ! 632: LDSBA_R	ldsba	[%r11, %r31] 0x8a, %r7
	.word 0xcec2917f  ! 633: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r7
	.word 0xc502801f  ! 634: LDF_R	ld	[%r10, %r31], %f2
	.word 0xce8ae010  ! 635: LDUBA_I	lduba	[%r11, + 0x0010] %asi, %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc3ae040  ! 636: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xcdbad91f  ! 637: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad89f  ! 638: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad83f  ! 639: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdf2e01f  ! 640: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc3ae040  ! 641: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xc60aa027  ! 642: LDUB_I	ldub	[%r10 + 0x0027], %r3
	.word 0xc43aa030  ! 643: STD_I	std	%r2, [%r10 + 0x0030]
	.word 0xca42c01f  ! 644: LDSW_R	ldsw	[%r11 + %r31], %r5
	.word 0xc2cae022  ! 645: LDSBA_I	ldsba	[%r11, + 0x0022] %asi, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc99ae010  ! 646: LDDFA_I	ldda	[%r11, 0x0010], %f4
	.word 0xd1bad95f  ! 647: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad89f  ! 648: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc8da903f  ! 649: LDXA_R	ldxa	[%r10, %r31] 0x81, %r4
	.word 0xcc42c01f  ! 650: LDSW_R	ldsw	[%r11 + %r31], %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3e2901f  ! 651: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3e2a01f  ! 652: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba989f  ! 653: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2913f  ! 654: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd24ac01f  ! 655: LDSB_R	ldsb	[%r11 + %r31], %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcec2913f  ! 656: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r7
	.word 0xcc3ac01f  ! 657: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcde2e01f  ! 658: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdbad93f  ! 659: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc492d13f  ! 660: LDUHA_R	lduha	[%r11, %r31] 0x89, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1ba989f  ! 661: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd092913f  ! 662: LDUHA_R	lduha	[%r10, %r31] 0x89, %r8
	.word 0xc7bad9bf  ! 663: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xce0ae048  ! 664: LDUB_I	ldub	[%r11 + 0x0048], %r7
	.word 0xca12a054  ! 665: LDUH_I	lduh	[%r10 + 0x0054], %r5
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd00ac01f  ! 666: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xc9ba989f  ! 667: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xce8ad15f  ! 668: LDUBA_R	lduba	[%r11, %r31] 0x8a, %r7
	.word 0xd082d01f  ! 669: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r8
	.word 0xc83aa070  ! 670: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbf2901f  ! 671: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbba989f  ! 672: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa070  ! 673: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xcbba987f  ! 674: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2903f  ! 675: CASA_I	casa	[%r10] 0x81, %r31, %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc79aa038  ! 676: LDDFA_I	ldda	[%r10, 0x0038], %f3
	.word 0xc5bad97f  ! 677: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ac01f  ! 678: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad89f  ! 679: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2e01f  ! 680: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5f2e01f  ! 681: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad87f  ! 682: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcc9aa070  ! 683: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r6
	.word 0xc43ac01f  ! 684: STD_R	std	%r2, [%r11 + %r31]
	.word 0xca8a905f  ! 685: LDUBA_R	lduba	[%r10, %r31] 0x82, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd2ca913f  ! 686: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r9
	.word 0xd04aa032  ! 687: LDSB_I	ldsb	[%r10 + 0x0032], %r8
	.word 0xcbba997f  ! 688: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd1baa030  ! 689: STDFA_I	stda	%f8, [0x0030, %r10]
	.word 0xcbf2901f  ! 690: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbe2901f  ! 691: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbe2901f  ! 692: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbe2a01f  ! 693: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc6daa068  ! 694: LDXA_I	ldxa	[%r10, + 0x0068] %asi, %r3
	.word 0xd0ca911f  ! 695: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc842801f  ! 696: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xc9e2d01f  ! 697: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9bad99f  ! 698: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d01f  ! 699: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9bad9bf  ! 700: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9bad89f  ! 701: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcc5a801f  ! 702: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xd1f2a01f  ! 703: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc2dae030  ! 704: LDXA_I	ldxa	[%r11, + 0x0030] %asi, %r1
	.word 0xcf02801f  ! 705: LDF_R	ld	[%r10, %r31], %f7
TH_LABEL705:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc41ae020  ! 706: LDD_I	ldd	[%r11 + 0x0020], %r2
	.word 0xcdf2a01f  ! 707: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcedad07f  ! 708: LDXA_R	ldxa	[%r11, %r31] 0x83, %r7
	.word 0xc43ac01f  ! 709: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae060  ! 710: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7bad99f  ! 711: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2d01f  ! 712: CASA_I	casa	[%r11] 0x80, %r31, %r3
	.word 0xc7bad9bf  ! 713: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae060  ! 714: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xd212801f  ! 715: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdf2911f  ! 716: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcc52a062  ! 717: LDSH_I	ldsh	[%r10 + 0x0062], %r6
	.word 0xcbba983f  ! 718: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xca52801f  ! 719: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xcfe2a01f  ! 720: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc252c01f  ! 721: LDSH_R	ldsh	[%r11 + %r31], %r1
	.word 0xcfbad93f  ! 722: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xce5a801f  ! 723: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xc9ba991f  ! 724: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc922801f  ! 725: STF_R	st	%f4, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3ba981f  ! 726: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd01a801f  ! 727: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xcfba997f  ! 728: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xce0ae010  ! 729: LDUB_I	ldub	[%r11 + 0x0010], %r7
	.word 0xd03ae070  ! 730: STD_I	std	%r8, [%r11 + 0x0070]
TH_LABEL730:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc59aa048  ! 731: LDDFA_I	ldda	[%r10, 0x0048], %f2
	.word 0xc8daa070  ! 732: LDXA_I	ldxa	[%r10, + 0x0070] %asi, %r4
	.word 0xc83ac01f  ! 733: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc09aa030  ! 734: LDDA_I	ldda	[%r10, + 0x0030] %asi, %r0
	.word 0xc9e2903f  ! 735: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9ba99bf  ! 736: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba987f  ! 737: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa078  ! 738: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xcd9aa038  ! 739: LDDFA_I	ldda	[%r10, 0x0038], %f6
	.word 0xd1ba98bf  ! 740: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbbaa048  ! 741: STDFA_I	stda	%f5, [0x0048, %r10]
	.word 0xcbba981f  ! 742: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba993f  ! 743: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2911f  ! 744: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xcbf2911f  ! 745: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc83a801f  ! 746: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba993f  ! 747: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xce42801f  ! 748: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xcff2e01f  ! 749: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xc6caa067  ! 750: LDSBA_I	ldsba	[%r10, + 0x0067] %asi, %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3e2901f  ! 751: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba98bf  ! 752: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba99bf  ! 753: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa058  ! 754: STD_I	std	%r0, [%r10 + 0x0058]
	.word 0xc3e2901f  ! 755: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc20ac01f  ! 756: LDUB_R	ldub	[%r11 + %r31], %r1
	.word 0xd2dae018  ! 757: LDXA_I	ldxa	[%r11, + 0x0018] %asi, %r9
	.word 0xc882d07f  ! 758: LDUWA_R	lduwa	[%r11, %r31] 0x83, %r4
	.word 0xcfba983f  ! 759: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc902801f  ! 760: LDF_R	ld	[%r10, %r31], %f4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc282911f  ! 761: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r1
	.word 0xc642c01f  ! 762: LDSW_R	ldsw	[%r11 + %r31], %r3
	.word 0xc3ba981f  ! 763: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd302801f  ! 764: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc922c01f  ! 765: STF_R	st	%f4, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcac2a064  ! 766: LDSWA_I	ldswa	[%r10, + 0x0064] %asi, %r5
	.word 0xc83a801f  ! 767: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba997f  ! 768: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 769: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba989f  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc83aa038  ! 771: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xc9f2a01f  ! 772: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba99bf  ! 773: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc702801f  ! 774: LDF_R	ld	[%r10, %r31], %f3
	.word 0xd3ba983f  ! 775: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc902a040  ! 776: LDF_I	ld	[%r10, 0x0040], %f4
	.word 0xc892901f  ! 777: LDUHA_R	lduha	[%r10, %r31] 0x80, %r4
	.word 0xc502a020  ! 778: LDF_I	ld	[%r10, 0x0020], %f2
	.word 0xc852801f  ! 779: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xc3ba983f  ! 780: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd2c2e014  ! 781: LDSWA_I	ldswa	[%r11, + 0x0014] %asi, %r9
	.word 0xc5e2911f  ! 782: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5ba991f  ! 783: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2903f  ! 784: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc43aa018  ! 785: STD_I	std	%r2, [%r10 + 0x0018]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd01aa078  ! 786: LDD_I	ldd	[%r10 + 0x0078], %r8
	.word 0xd03ae050  ! 787: STD_I	std	%r8, [%r11 + 0x0050]
	.word 0xc99aa078  ! 788: LDDFA_I	ldda	[%r10, 0x0078], %f4
	.word 0xd1ba98bf  ! 789: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc85ac01f  ! 790: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3ba995f  ! 791: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xca8a911f  ! 792: LDUBA_R	lduba	[%r10, %r31] 0x88, %r5
	.word 0xd3f2a01f  ! 793: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba98bf  ! 794: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 795: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xca0aa053  ! 796: LDUB_I	ldub	[%r10 + 0x0053], %r5
	.word 0xd1ba983f  ! 797: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2903f  ! 798: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xd1ba997f  ! 799: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 800: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc02e054  ! 801: LDUW_I	lduw	[%r11 + 0x0054], %r6
	.word 0xc9ba999f  ! 802: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc482907f  ! 803: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r2
	.word 0xc41ae038  ! 804: LDD_I	ldd	[%r11 + 0x0038], %r2
	.word 0xcc3a801f  ! 805: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc3a801f  ! 806: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2911f  ! 807: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcdba989f  ! 808: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba987f  ! 809: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba991f  ! 810: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc3a801f  ! 811: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba995f  ! 812: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa010  ! 813: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcc3aa010  ! 814: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xc922c01f  ! 815: STF_R	st	%f4, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9ba985f  ! 816: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc59aa038  ! 817: LDDFA_I	ldda	[%r10, 0x0038], %f2
	.word 0xcdbad97f  ! 818: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad8bf  ! 819: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2e01f  ! 820: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcde2d11f  ! 821: CASA_I	casa	[%r11] 0x88, %r31, %r6
	.word 0xc702801f  ! 822: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc83a801f  ! 823: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc6cad17f  ! 824: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r3
	.word 0xc9bad93f  ! 825: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc83ac01f  ! 826: STD_R	std	%r4, [%r11 + %r31]
	.word 0xd122801f  ! 827: STF_R	st	%f8, [%r31, %r10]
	.word 0xcdba989f  ! 828: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcec2901f  ! 829: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r7
	.word 0xc9bad87f  ! 830: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc652e012  ! 831: LDSH_I	ldsh	[%r11 + 0x0012], %r3
	.word 0xcdbaa018  ! 832: STDFA_I	stda	%f6, [0x0018, %r10]
	.word 0xcbe2a01f  ! 833: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbe2a01f  ! 834: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xd302a078  ! 835: LDF_I	ld	[%r10, 0x0078], %f9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba989f  ! 836: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc612a056  ! 837: LDUH_I	lduh	[%r10 + 0x0056], %r3
	.word 0xcc9aa018  ! 838: LDDA_I	ldda	[%r10, + 0x0018] %asi, %r6
	.word 0xd3bad99f  ! 839: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae000  ! 840: STD_I	std	%r8, [%r11 + 0x0000]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3bad87f  ! 841: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 842: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd1baa058  ! 843: STDFA_I	stda	%f8, [0x0058, %r10]
	.word 0xc83ac01f  ! 844: STD_R	std	%r4, [%r11 + %r31]
	.word 0xced2913f  ! 845: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc4daa000  ! 846: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r2
	.word 0xd03ae048  ! 847: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xd3f2e01f  ! 848: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2d13f  ! 849: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd3f2e01f  ! 850: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc02801f  ! 851: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xc3ba981f  ! 852: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba99bf  ! 853: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2901f  ! 854: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba987f  ! 855: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL855:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcf9aa068  ! 856: LDDFA_I	ldda	[%r10, 0x0068], %f7
	.word 0xcfba985f  ! 857: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd252a034  ! 858: LDSH_I	ldsh	[%r10 + 0x0034], %r9
	.word 0xd0c2d01f  ! 859: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r8
	.word 0xd102a030  ! 860: LDF_I	ld	[%r10, 0x0030], %f8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdba981f  ! 861: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcb9aa060  ! 862: LDDFA_I	ldda	[%r10, 0x0060], %f5
	.word 0xcfe2a01f  ! 863: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba987f  ! 864: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 865: CASXA_R	casxa	[%r10]%asi, %r31, %r7
TH_LABEL865:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc3aa020  ! 866: STD_I	std	%r6, [%r10 + 0x0020]
	.word 0xcfe2a01f  ! 867: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd122801f  ! 868: STF_R	st	%f8, [%r31, %r10]
	.word 0xd122801f  ! 869: STF_R	st	%f8, [%r31, %r10]
	.word 0xc5f2d01f  ! 870: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5e2d11f  ! 871: CASA_I	casa	[%r11] 0x88, %r31, %r2
	.word 0xc43ac01f  ! 872: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad97f  ! 873: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc25aa048  ! 874: LDX_I	ldx	[%r10 + 0x0048], %r1
	.word 0xc9bae060  ! 875: STDFA_I	stda	%f4, [0x0060, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd08aa075  ! 876: LDUBA_I	lduba	[%r10, + 0x0075] %asi, %r8
	.word 0xc5bad95f  ! 877: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd19ae010  ! 878: LDDFA_I	ldda	[%r11, 0x0010], %f8
	.word 0xcdf2d11f  ! 879: CASXA_I	casxa	[%r11] 0x88, %r31, %r6
	.word 0xc2d2a07e  ! 880: LDSHA_I	ldsha	[%r10, + 0x007e] %asi, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5f2913f  ! 881: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xc5f2a01f  ! 882: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba98bf  ! 883: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 884: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcf9aa008  ! 885: LDDFA_I	ldda	[%r10, 0x0008], %f7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd102a004  ! 886: LDF_I	ld	[%r10, 0x0004], %f8
	.word 0xc3f2e01f  ! 887: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3f2e01f  ! 888: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad83f  ! 889: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc452801f  ! 890: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd0d2915f  ! 891: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r8
	.word 0xd1ba989f  ! 892: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba987f  ! 893: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 894: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba987f  ! 895: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL895:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd03aa028  ! 896: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd1ba985f  ! 897: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 898: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xcd02801f  ! 899: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc702a02c  ! 900: LDF_I	ld	[%r10, 0x002c], %f3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9bae000  ! 901: STDFA_I	stda	%f4, [0x0000, %r11]
	.word 0xd052e026  ! 902: LDSH_I	ldsh	[%r11 + 0x0026], %r8
	.word 0xc412801f  ! 903: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xc882e02c  ! 904: LDUWA_I	lduwa	[%r11, + 0x002c] %asi, %r4
	.word 0xc99aa078  ! 905: LDDFA_I	ldda	[%r10, 0x0078], %f4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7f2d03f  ! 906: CASXA_I	casxa	[%r11] 0x81, %r31, %r3
	.word 0xcb02c01f  ! 907: LDF_R	ld	[%r11, %r31], %f5
	.word 0xd24aa07e  ! 908: LDSB_I	ldsb	[%r10 + 0x007e], %r9
	.word 0xc64aa009  ! 909: LDSB_I	ldsb	[%r10 + 0x0009], %r3
	.word 0xc83aa008  ! 910: STD_I	std	%r4, [%r10 + 0x0008]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcb02a038  ! 911: LDF_I	ld	[%r10, 0x0038], %f5
	.word 0xd102e018  ! 912: LDF_I	ld	[%r11, 0x0018], %f8
	.word 0xc3e2a01f  ! 913: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3f2913f  ! 914: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xc3f2a01f  ! 915: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3ba987f  ! 916: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2903f  ! 917: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xca02801f  ! 918: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xcd9ae030  ! 919: LDDFA_I	ldda	[%r11, 0x0030], %f6
	.word 0xc8d2915f  ! 920: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd03aa010  ! 921: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1e2901f  ! 922: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba987f  ! 923: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2913f  ! 924: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xd03aa010  ! 925: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc652801f  ! 926: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xc3e2e01f  ! 927: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc6c2e040  ! 928: LDSWA_I	ldswa	[%r11, + 0x0040] %asi, %r3
	.word 0xc7bad9bf  ! 929: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd2c2901f  ! 930: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfbae018  ! 931: STDFA_I	stda	%f7, [0x0018, %r11]
	.word 0xcde2a01f  ! 932: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2913f  ! 933: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcdba997f  ! 934: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa070  ! 935: STD_I	std	%r6, [%r10 + 0x0070]
TH_LABEL935:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc3aa070  ! 936: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xd3baa058  ! 937: STDFA_I	stda	%f9, [0x0058, %r10]
	.word 0xc8ca905f  ! 938: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r4
	.word 0xc59aa048  ! 939: LDDFA_I	ldda	[%r10, 0x0048], %f2
	.word 0xcc92d15f  ! 940: LDUHA_R	lduha	[%r11, %r31] 0x8a, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3baa028  ! 941: STDFA_I	stda	%f1, [0x0028, %r10]
	.word 0xc402c01f  ! 942: LDUW_R	lduw	[%r11 + %r31], %r2
	.word 0xd1ba981f  ! 943: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 944: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba985f  ! 945: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1ba989f  ! 946: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2901f  ! 947: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc4c2901f  ! 948: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r2
	.word 0xcf02801f  ! 949: LDF_R	ld	[%r10, %r31], %f7
	.word 0xd3e2901f  ! 950: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xced2e042  ! 951: LDSHA_I	ldsha	[%r11, + 0x0042] %asi, %r7
	.word 0xc43ae028  ! 952: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc43ac01f  ! 953: STD_R	std	%r2, [%r11 + %r31]
	.word 0xcb02a02c  ! 954: LDF_I	ld	[%r10, 0x002c], %f5
	.word 0xc3baa010  ! 955: STDFA_I	stda	%f1, [0x0010, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xce92d05f  ! 956: LDUHA_R	lduha	[%r11, %r31] 0x82, %r7
	.word 0xc3ba999f  ! 957: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa008  ! 958: STD_I	std	%r0, [%r10 + 0x0008]
	.word 0xc7baa068  ! 959: STDFA_I	stda	%f3, [0x0068, %r10]
	.word 0xcfba993f  ! 960: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xca0ae045  ! 961: LDUB_I	ldub	[%r11 + 0x0045], %r5
	.word 0xce5aa038  ! 962: LDX_I	ldx	[%r10 + 0x0038], %r7
	.word 0xcbbad8bf  ! 963: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xca02801f  ! 964: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xd1ba981f  ! 965: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03aa030  ! 966: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xd1ba98bf  ! 967: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc902a004  ! 968: LDF_I	ld	[%r10, 0x0004], %f4
	.word 0xc3bad85f  ! 969: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad9bf  ! 970: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd39aa048  ! 971: LDDFA_I	ldda	[%r10, 0x0048], %f9
	.word 0xd3ba983f  ! 972: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2911f  ! 973: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xcaca911f  ! 974: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r5
	.word 0xc01aa008  ! 975: LDD_I	ldd	[%r10 + 0x0008], %r0
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc2c2d07f  ! 976: LDSWA_R	ldswa	[%r11, %r31] 0x83, %r1
	.word 0xc442a024  ! 977: LDSW_I	ldsw	[%r10 + 0x0024], %r2
	.word 0xd0c2915f  ! 978: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r8
	.word 0xc4dad07f  ! 979: LDXA_R	ldxa	[%r11, %r31] 0x83, %r2
	.word 0xcc3aa030  ! 980: STD_I	std	%r6, [%r10 + 0x0030]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc3aa030  ! 981: STD_I	std	%r6, [%r10 + 0x0030]
	.word 0xd24a801f  ! 982: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xc7e2911f  ! 983: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xc20aa049  ! 984: LDUB_I	ldub	[%r10 + 0x0049], %r1
	.word 0xc40ae018  ! 985: LDUB_I	ldub	[%r11 + 0x0018], %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7f2a01f  ! 986: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba985f  ! 987: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc28aa041  ! 988: LDUBA_I	lduba	[%r10, + 0x0041] %asi, %r1
	.word 0xcb02e03c  ! 989: LDF_I	ld	[%r11, 0x003c], %f5
	.word 0xcff2a01f  ! 990: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc3a801f  ! 991: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba993f  ! 992: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc44aa032  ! 993: LDSB_I	ldsb	[%r10 + 0x0032], %r2
	.word 0xc9bad81f  ! 994: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 995: STDFA_R	stda	%f4, [%r31, %r11]
TH_LABEL995:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc99aa020  ! 996: LDDFA_I	ldda	[%r10, 0x0020], %f4
	.word 0xc6c2a020  ! 997: LDSWA_I	ldswa	[%r10, + 0x0020] %asi, %r3
	.word 0xcfbad85f  ! 998: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc5baa018  ! 999: STDFA_I	stda	%f2, [0x0018, %r10]
	.word 0xc03a801f  ! 1000: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	subcc %r30, 1, %r30
	bnz  TH6_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	add	%g0,	0x1,	%r30
TH5_LOOP_START:
	.word 0xc5ba991f  ! 1: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc682e044  ! 2: LDUWA_I	lduwa	[%r11, + 0x0044] %asi, %r3
	.word 0xcc02a074  ! 3: LDUW_I	lduw	[%r10 + 0x0074], %r6
	.word 0xcc5a801f  ! 4: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xcde2e01f  ! 5: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdbad89f  ! 6: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc8d2905f  ! 7: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r4
	.word 0xc9e2913f  ! 8: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc842e070  ! 9: LDSW_I	ldsw	[%r11 + 0x0070], %r4
	.word 0xc48ae031  ! 10: LDUBA_I	lduba	[%r11, + 0x0031] %asi, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc9aa028  ! 11: LDDA_I	ldda	[%r10, + 0x0028] %asi, %r6
	.word 0xc502e02c  ! 12: LDF_I	ld	[%r11, 0x002c], %f2
	.word 0xc3ba997f  ! 13: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 14: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba993f  ! 15: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcccaa04e  ! 16: LDSBA_I	ldsba	[%r10, + 0x004e] %asi, %r6
	.word 0xca8ae00b  ! 17: LDUBA_I	lduba	[%r11, + 0x000b] %asi, %r5
	.word 0xcdf2a01f  ! 18: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2903f  ! 19: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xcdba999f  ! 20: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdba989f  ! 21: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 22: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc82d15f  ! 23: LDUWA_R	lduwa	[%r11, %r31] 0x8a, %r6
	.word 0xd3ba99bf  ! 24: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 25: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1baa020  ! 26: STDFA_I	stda	%f8, [0x0020, %r10]
	.word 0xd1e2e01f  ! 27: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd322801f  ! 28: STF_R	st	%f9, [%r31, %r10]
	.word 0xc9bad8bf  ! 29: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad91f  ! 30: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9e2e01f  ! 31: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc3bae048  ! 32: STDFA_I	stda	%f1, [0x0048, %r11]
	.word 0xcdba989f  ! 33: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 34: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba98bf  ! 35: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc3aa028  ! 36: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xcc3a801f  ! 37: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2913f  ! 38: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcdba997f  ! 39: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2911f  ! 40: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd01aa018  ! 41: LDD_I	ldd	[%r10 + 0x0018], %r8
	.word 0xc5f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2a01f  ! 43: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc7bae020  ! 44: STDFA_I	stda	%f3, [0x0020, %r11]
	.word 0xcbe2e01f  ! 45: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc2da901f  ! 46: LDXA_R	ldxa	[%r10, %r31] 0x80, %r1
	.word 0xd1ba981f  ! 47: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 48: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1f2a01f  ! 49: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba983f  ! 50: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3baa060  ! 51: STDFA_I	stda	%f1, [0x0060, %r10]
	.word 0xd28aa02f  ! 52: LDUBA_I	lduba	[%r10, + 0x002f] %asi, %r9
	.word 0xce8a905f  ! 53: LDUBA_R	lduba	[%r10, %r31] 0x82, %r7
	.word 0xc59aa008  ! 54: LDDFA_I	ldda	[%r10, 0x0008], %f2
	.word 0xc03ac01f  ! 55: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd282a000  ! 56: LDUWA_I	lduwa	[%r10, + 0x0000] %asi, %r9
	.word 0xc9bad87f  ! 57: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad87f  ! 58: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcfbaa078  ! 59: STDFA_I	stda	%f7, [0x0078, %r10]
	.word 0xd302801f  ! 60: LDF_R	ld	[%r10, %r31], %f9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3ba983f  ! 61: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd2c2903f  ! 62: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r9
	.word 0xc202c01f  ! 63: LDUW_R	lduw	[%r11 + %r31], %r1
	.word 0xc5ba99bf  ! 64: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc9baa068  ! 65: STDFA_I	stda	%f4, [0x0068, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1f2e01f  ! 66: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd03ac01f  ! 67: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad93f  ! 68: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae048  ! 69: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xcc12801f  ! 70: LDUH_R	lduh	[%r10 + %r31], %r6
TH_LABEL70:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc242e074  ! 71: LDSW_I	ldsw	[%r11 + 0x0074], %r1
	.word 0xd01a801f  ! 72: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xc612801f  ! 73: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xc9f2e01f  ! 74: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xd302c01f  ! 75: LDF_R	ld	[%r11, %r31], %f9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbba987f  ! 76: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc702801f  ! 77: LDF_R	ld	[%r10, %r31], %f3
	.word 0xcdbaa070  ! 78: STDFA_I	stda	%f6, [0x0070, %r10]
	.word 0xcbbad97f  ! 79: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc722801f  ! 80: STF_R	st	%f3, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xce92915f  ! 81: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r7
	.word 0xd3bad81f  ! 82: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 83: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad89f  ! 84: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad99f  ! 85: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc79aa038  ! 86: LDDFA_I	ldda	[%r10, 0x0038], %f3
	.word 0xc3f2d11f  ! 87: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xc3e2d03f  ! 88: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xc682d03f  ! 89: LDUWA_R	lduwa	[%r11, %r31] 0x81, %r3
	.word 0xc39ae010  ! 90: LDDFA_I	ldda	[%r11, 0x0010], %f1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc83aa070  ! 91: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xcbbae028  ! 92: STDFA_I	stda	%f5, [0x0028, %r11]
	.word 0xc3ba981f  ! 93: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcdbae058  ! 94: STDFA_I	stda	%f6, [0x0058, %r11]
	.word 0xcc3a801f  ! 95: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc3a801f  ! 96: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 97: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba989f  ! 98: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 99: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc41aa010  ! 100: LDD_I	ldd	[%r10 + 0x0010], %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5bad85f  ! 101: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad9bf  ! 102: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc84ac01f  ! 103: LDSB_R	ldsb	[%r11 + %r31], %r4
	.word 0xc452a03a  ! 104: LDSH_I	ldsh	[%r10 + 0x003a], %r2
	.word 0xd3f2e01f  ! 105: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3f2e01f  ! 106: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd0dad05f  ! 107: LDXA_R	ldxa	[%r11, %r31] 0x82, %r8
	.word 0xcfba993f  ! 108: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba995f  ! 109: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc442e038  ! 110: LDSW_I	ldsw	[%r11 + 0x0038], %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc2daa040  ! 111: LDXA_I	ldxa	[%r10, + 0x0040] %asi, %r1
	.word 0xcdbaa038  ! 112: STDFA_I	stda	%f6, [0x0038, %r10]
	.word 0xc9f2901f  ! 113: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc64a801f  ! 114: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xc9f2903f  ! 115: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9e2903f  ! 116: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc9e2901f  ! 117: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba991f  ! 118: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 119: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba983f  ! 120: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9e2903f  ! 121: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc64aa040  ! 122: LDSB_I	ldsb	[%r10 + 0x0040], %r3
	.word 0xcdbad89f  ! 123: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc2daa060  ! 124: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r1
	.word 0xd03ac01f  ! 125: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1bad87f  ! 126: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad83f  ! 127: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc41aa068  ! 128: LDD_I	ldd	[%r10 + 0x0068], %r2
	.word 0xd3ba983f  ! 129: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba995f  ! 130: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xca02c01f  ! 131: LDUW_R	lduw	[%r11 + %r31], %r5
	.word 0xc3ba983f  ! 132: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcf9aa018  ! 133: LDDFA_I	ldda	[%r10, 0x0018], %f7
	.word 0xcfba995f  ! 134: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc5baa020  ! 135: STDFA_I	stda	%f2, [0x0020, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5ba995f  ! 136: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2901f  ! 137: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xcaca903f  ! 138: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r5
	.word 0xcdf2a01f  ! 139: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba985f  ! 140: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL140:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc482a008  ! 141: LDUWA_I	lduwa	[%r10, + 0x0008] %asi, %r2
	.word 0xd0ca917f  ! 142: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r8
	.word 0xc3f2e01f  ! 143: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xd24ac01f  ! 144: LDSB_R	ldsb	[%r11 + %r31], %r9
	.word 0xd0daa040  ! 145: LDXA_I	ldxa	[%r10, + 0x0040] %asi, %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5e2a01f  ! 146: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcb02e034  ! 147: LDF_I	ld	[%r11, 0x0034], %f5
	.word 0xc3ba989f  ! 148: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 149: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3e2a01f  ! 150: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc4c2d13f  ! 151: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r2
	.word 0xc5e2e01f  ! 152: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xd202a02c  ! 153: LDUW_I	lduw	[%r10 + 0x002c], %r9
	.word 0xc7ba995f  ! 154: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 155: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7ba993f  ! 156: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 157: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc39ae010  ! 158: LDDFA_I	ldda	[%r11, 0x0010], %f1
	.word 0xcdbaa028  ! 159: STDFA_I	stda	%f6, [0x0028, %r10]
	.word 0xc412a006  ! 160: LDUH_I	lduh	[%r10 + 0x0006], %r2
TH_LABEL160:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xceca901f  ! 161: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r7
	.word 0xc3bad97f  ! 162: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 163: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3e2e01f  ! 164: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2e01f  ! 165: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcf02801f  ! 166: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc292915f  ! 167: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r1
	.word 0xcbbaa028  ! 168: STDFA_I	stda	%f5, [0x0028, %r10]
	.word 0xcc1a801f  ! 169: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc5e2e01f  ! 170: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc79aa060  ! 171: LDDFA_I	ldda	[%r10, 0x0060], %f3
	.word 0xd3bad8bf  ! 172: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 173: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd39aa020  ! 174: LDDFA_I	ldda	[%r10, 0x0020], %f9
	.word 0xcbbad81f  ! 175: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbbad95f  ! 176: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcfbaa000  ! 177: STDFA_I	stda	%f7, [0x0000, %r10]
	.word 0xc9ba989f  ! 178: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc642e024  ! 179: LDSW_I	ldsw	[%r11 + 0x0024], %r3
	.word 0xc522c01f  ! 180: STF_R	st	%f2, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfbad91f  ! 181: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xced2a028  ! 182: LDSHA_I	ldsha	[%r10, + 0x0028] %asi, %r7
	.word 0xd25aa050  ! 183: LDX_I	ldx	[%r10 + 0x0050], %r9
	.word 0xd2ca915f  ! 184: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r9
	.word 0xc7e2e01f  ! 185: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xca5ac01f  ! 186: LDX_R	ldx	[%r11 + %r31], %r5
	.word 0xc3bad87f  ! 187: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd2dad07f  ! 188: LDXA_R	ldxa	[%r11, %r31] 0x83, %r9
	.word 0xc3e2913f  ! 189: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xd2d2901f  ! 190: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9bad95f  ! 191: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xce0aa05e  ! 192: LDUB_I	ldub	[%r10 + 0x005e], %r7
	.word 0xcfbad97f  ! 193: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xce4ac01f  ! 194: LDSB_R	ldsb	[%r11 + %r31], %r7
	.word 0xc25ac01f  ! 195: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd19aa038  ! 196: LDDFA_I	ldda	[%r10, 0x0038], %f8
	.word 0xc9bae018  ! 197: STDFA_I	stda	%f4, [0x0018, %r11]
	.word 0xd25aa030  ! 198: LDX_I	ldx	[%r10 + 0x0030], %r9
	.word 0xc84ae071  ! 199: LDSB_I	ldsb	[%r11 + 0x0071], %r4
	.word 0xc9e2d13f  ! 200: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd25a801f  ! 201: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xc5e2a01f  ! 202: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xd1baa028  ! 203: STDFA_I	stda	%f8, [0x0028, %r10]
	.word 0xc5ba991f  ! 204: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc79aa058  ! 205: LDDFA_I	ldda	[%r10, 0x0058], %f3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xce5ae010  ! 206: LDX_I	ldx	[%r11 + 0x0010], %r7
	.word 0xc41a801f  ! 207: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xd012c01f  ! 208: LDUH_R	lduh	[%r11 + %r31], %r8
	.word 0xc902801f  ! 209: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc99aa068  ! 210: LDDFA_I	ldda	[%r10, 0x0068], %f4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdba993f  ! 211: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc902801f  ! 212: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc7bad8bf  ! 213: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc652e020  ! 214: LDSH_I	ldsh	[%r11 + 0x0020], %r3
	.word 0xc5f2a01f  ! 215: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5ba981f  ! 216: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 217: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 218: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc80a801f  ! 219: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xc45aa008  ! 220: LDX_I	ldx	[%r10 + 0x0008], %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3e2913f  ! 221: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd03a801f  ! 222: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd05a801f  ! 223: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xc5e2a01f  ! 224: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcc82905f  ! 225: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc6c2913f  ! 226: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r3
	.word 0xd3ba995f  ! 227: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 228: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 229: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba995f  ! 230: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd03aa010  ! 231: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd3e2a01f  ! 232: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 233: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba981f  ! 234: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa010  ! 235: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03a801f  ! 236: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc8d2915f  ! 237: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r4
	.word 0xc522c01f  ! 238: STF_R	st	%f2, [%r31, %r11]
	.word 0xcfba999f  ! 239: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd102c01f  ! 240: LDF_R	ld	[%r11, %r31], %f8
TH_LABEL240:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc43aa010  ! 241: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xc702a038  ! 242: LDF_I	ld	[%r10, 0x0038], %f3
	.word 0xd302801f  ! 243: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc88a917f  ! 244: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r4
	.word 0xd03aa038  ! 245: STD_I	std	%r8, [%r10 + 0x0038]
TH_LABEL245:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3ba983f  ! 246: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba999f  ! 247: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2913f  ! 248: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xc682915f  ! 249: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r3
	.word 0xcbba985f  ! 250: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbba987f  ! 251: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa038  ! 252: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xd00aa054  ! 253: LDUB_I	ldub	[%r10 + 0x0054], %r8
	.word 0xd3ba981f  ! 254: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 255: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3f2a01f  ! 256: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03aa058  ! 257: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3ba98bf  ! 258: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc242801f  ! 259: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xca0aa01f  ! 260: LDUB_I	ldub	[%r10 + 0x001f], %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1bad99f  ! 261: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 262: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad87f  ! 263: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc4c2d11f  ! 264: LDSWA_R	ldswa	[%r11, %r31] 0x88, %r2
	.word 0xc7e2a01f  ! 265: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7ba985f  ! 266: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 267: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 268: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc8ca901f  ! 269: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r4
	.word 0xc59ae038  ! 270: LDDFA_I	ldda	[%r11, 0x0038], %f2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc41aa078  ! 271: LDD_I	ldd	[%r10 + 0x0078], %r2
	.word 0xd0d2a040  ! 272: LDSHA_I	ldsha	[%r10, + 0x0040] %asi, %r8
	.word 0xc43aa058  ! 273: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc5f2a01f  ! 274: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5f2903f  ! 275: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
TH_LABEL275:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbbae048  ! 276: STDFA_I	stda	%f5, [0x0048, %r11]
	.word 0xc60ac01f  ! 277: LDUB_R	ldub	[%r11 + %r31], %r3
	.word 0xcc3aa038  ! 278: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcfba981f  ! 279: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba99bf  ! 280: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfe2a01f  ! 281: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc41ae078  ! 282: LDD_I	ldd	[%r11 + 0x0078], %r2
	.word 0xcde2d03f  ! 283: CASA_I	casa	[%r11] 0x81, %r31, %r6
	.word 0xcdf2d11f  ! 284: CASXA_I	casxa	[%r11] 0x88, %r31, %r6
	.word 0xd212e068  ! 285: LDUH_I	lduh	[%r11 + 0x0068], %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd102e050  ! 286: LDF_I	ld	[%r11, 0x0050], %f8
	.word 0xc5ba981f  ! 287: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2901f  ! 288: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba987f  ! 289: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcadad11f  ! 290: LDXA_R	ldxa	[%r11, %r31] 0x88, %r5
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9ba98bf  ! 291: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 292: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc39ae038  ! 293: LDDFA_I	ldda	[%r11, 0x0038], %f1
	.word 0xcbf2901f  ! 294: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbf2901f  ! 295: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc6d2a000  ! 296: LDSHA_I	ldsha	[%r10, + 0x0000] %asi, %r3
	.word 0xc03ac01f  ! 297: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc802a054  ! 298: LDUW_I	lduw	[%r10 + 0x0054], %r4
	.word 0xcf9ae010  ! 299: LDDFA_I	ldda	[%r11, 0x0010], %f7
	.word 0xcc3aa040  ! 300: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdba987f  ! 301: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 302: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2913f  ! 303: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xc282917f  ! 304: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r1
	.word 0xd3bad97f  ! 305: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3bad89f  ! 306: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 307: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad81f  ! 308: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcedaa078  ! 309: LDXA_I	ldxa	[%r10, + 0x0078] %asi, %r7
	.word 0xc602e04c  ! 310: LDUW_I	lduw	[%r11 + 0x004c], %r3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3bae008  ! 311: STDFA_I	stda	%f9, [0x0008, %r11]
	.word 0xc3e2911f  ! 312: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xc8cad05f  ! 313: LDSBA_R	ldsba	[%r11, %r31] 0x82, %r4
	.word 0xce92a00e  ! 314: LDUHA_I	lduha	[%r10, + 0x000e] %asi, %r7
	.word 0xc7bad8bf  ! 315: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7bae050  ! 316: STDFA_I	stda	%f3, [0x0050, %r11]
	.word 0xd24ae057  ! 317: LDSB_I	ldsb	[%r11 + 0x0057], %r9
	.word 0xcbf2e01f  ! 318: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xc9baa050  ! 319: STDFA_I	stda	%f4, [0x0050, %r10]
	.word 0xc642e034  ! 320: LDSW_I	ldsw	[%r11 + 0x0034], %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03aa050  ! 321: STD_I	std	%r8, [%r10 + 0x0050]
	.word 0xd1f2a01f  ! 322: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba983f  ! 323: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba98bf  ! 324: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc8d2e032  ! 325: LDSHA_I	ldsha	[%r11, + 0x0032] %asi, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5ba99bf  ! 326: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc85aa028  ! 327: LDX_I	ldx	[%r10 + 0x0028], %r4
	.word 0xcfba989f  ! 328: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc4d2a07a  ! 329: LDSHA_I	ldsha	[%r10, + 0x007a] %asi, %r2
	.word 0xc5bad83f  ! 330: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1baa030  ! 331: STDFA_I	stda	%f8, [0x0030, %r10]
	.word 0xcecaa03c  ! 332: LDSBA_I	ldsba	[%r10, + 0x003c] %asi, %r7
	.word 0xd03a801f  ! 333: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba997f  ! 334: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xca0ac01f  ! 335: LDUB_R	ldub	[%r11 + %r31], %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3e2d03f  ! 336: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xc3e2d03f  ! 337: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xc3baa038  ! 338: STDFA_I	stda	%f1, [0x0038, %r10]
	.word 0xc83ae018  ! 339: STD_I	std	%r4, [%r11 + 0x0018]
	.word 0xccd2d05f  ! 340: LDSHA_R	ldsha	[%r11, %r31] 0x82, %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcf02e04c  ! 341: LDF_I	ld	[%r11, 0x004c], %f7
	.word 0xc7ba989f  ! 342: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd052a05a  ! 343: LDSH_I	ldsh	[%r10 + 0x005a], %r8
	.word 0xc4da913f  ! 344: LDXA_R	ldxa	[%r10, %r31] 0x89, %r2
	.word 0xc68aa005  ! 345: LDUBA_I	lduba	[%r10, + 0x0005] %asi, %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7bae008  ! 346: STDFA_I	stda	%f3, [0x0008, %r11]
	.word 0xd3bad95f  ! 347: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d01f  ! 348: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd03ae010  ! 349: STD_I	std	%r8, [%r11 + 0x0010]
	.word 0xd3bad91f  ! 350: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd2cad01f  ! 351: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r9
	.word 0xc9f2911f  ! 352: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc9f2913f  ! 353: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc83a801f  ! 354: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 355: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9e2911f  ! 356: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xd302a078  ! 357: LDF_I	ld	[%r10, 0x0078], %f9
	.word 0xc43aa000  ! 358: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc43aa000  ! 359: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xca02801f  ! 360: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5e2a01f  ! 361: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc8ca917f  ! 362: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r4
	.word 0xc3ba98bf  ! 363: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd0da913f  ! 364: LDXA_R	ldxa	[%r10, %r31] 0x89, %r8
	.word 0xceca901f  ! 365: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r7
TH_LABEL365:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd03aa000  ! 366: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xc402801f  ! 367: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xd39aa038  ! 368: LDDFA_I	ldda	[%r10, 0x0038], %f9
	.word 0xcdba98bf  ! 369: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba987f  ! 370: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL370:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdf2a01f  ! 371: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba993f  ! 372: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba99bf  ! 373: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc722c01f  ! 374: STF_R	st	%f3, [%r31, %r11]
	.word 0xc9ba98bf  ! 375: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL375:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc492d03f  ! 376: LDUHA_R	lduha	[%r11, %r31] 0x81, %r2
	.word 0xd1f2a01f  ! 377: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc702a060  ! 378: LDF_I	ld	[%r10, 0x0060], %f3
	.word 0xd03a801f  ! 379: STD_R	std	%r8, [%r10 + %r31]
	.word 0xcb22801f  ! 380: STF_R	st	%f5, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3ba981f  ! 381: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba983f  ! 382: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc8d2e014  ! 383: LDSHA_I	ldsha	[%r11, + 0x0014] %asi, %r4
	.word 0xcad2d11f  ! 384: LDSHA_R	ldsha	[%r11, %r31] 0x88, %r5
	.word 0xd24a801f  ! 385: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7ba983f  ! 386: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcc8aa066  ! 387: LDUBA_I	lduba	[%r10, + 0x0066] %asi, %r6
	.word 0xc7ba991f  ! 388: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 389: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc882e028  ! 390: LDUWA_I	lduwa	[%r11, + 0x0028] %asi, %r4
TH_LABEL390:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc03ac01f  ! 391: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc45a801f  ! 392: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xc03ac01f  ! 393: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad9bf  ! 394: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd0da901f  ! 395: LDXA_R	ldxa	[%r10, %r31] 0x80, %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcff2a01f  ! 396: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xd2c2901f  ! 397: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r9
	.word 0xc6cae05a  ! 398: LDSBA_I	ldsba	[%r11, + 0x005a] %asi, %r3
	.word 0xc9bad95f  ! 399: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 400: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd242a058  ! 401: LDSW_I	ldsw	[%r10 + 0x0058], %r9
	.word 0xd082a074  ! 402: LDUWA_I	lduwa	[%r10, + 0x0074] %asi, %r8
	.word 0xc7e2d01f  ! 403: CASA_I	casa	[%r11] 0x80, %r31, %r3
	.word 0xc7f2e01f  ! 404: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc40ac01f  ! 405: LDUB_R	ldub	[%r11 + %r31], %r2
TH_LABEL405:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdf2d13f  ! 406: CASXA_I	casxa	[%r11] 0x89, %r31, %r6
	.word 0xcdbad83f  ! 407: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd052801f  ! 408: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xc2d2a004  ! 409: LDSHA_I	ldsha	[%r10, + 0x0004] %asi, %r1
	.word 0xcdf2e01f  ! 410: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdf2d03f  ! 411: CASXA_I	casxa	[%r11] 0x81, %r31, %r6
	.word 0xcdbad81f  ! 412: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad87f  ! 413: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc52801f  ! 414: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xc25ae010  ! 415: LDX_I	ldx	[%r11 + 0x0010], %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5ba999f  ! 416: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xce52e058  ! 417: LDSH_I	ldsh	[%r11 + 0x0058], %r7
	.word 0xc282d15f  ! 418: LDUWA_R	lduwa	[%r11, %r31] 0x8a, %r1
	.word 0xcfbad99f  ! 419: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd00a801f  ! 420: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfba98bf  ! 421: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba99bf  ! 422: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 423: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 424: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca12801f  ! 425: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xccc2901f  ! 426: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r6
	.word 0xcf02a008  ! 427: LDF_I	ld	[%r10, 0x0008], %f7
	.word 0xcbbae068  ! 428: STDFA_I	stda	%f5, [0x0068, %r11]
	.word 0xc3ba99bf  ! 429: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 430: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc28aa000  ! 431: LDUBA_I	lduba	[%r10, + 0x0000] %asi, %r1
	.word 0xd28aa063  ! 432: LDUBA_I	lduba	[%r10, + 0x0063] %asi, %r9
	.word 0xcc3a801f  ! 433: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba983f  ! 434: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 435: STD_R	std	%r6, [%r10 + %r31]
TH_LABEL435:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc89aa040  ! 436: LDDA_I	ldda	[%r10, + 0x0040] %asi, %r4
	.word 0xcf22c01f  ! 437: STF_R	st	%f7, [%r31, %r11]
	.word 0xcbf2d11f  ! 438: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xd04a801f  ! 439: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xd1f2903f  ! 440: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
TH_LABEL440:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1ba99bf  ! 441: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 442: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2913f  ! 443: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd1ba98bf  ! 444: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa048  ! 445: STD_I	std	%r8, [%r10 + 0x0048]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc6d2917f  ! 446: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r3
	.word 0xcbbad8bf  ! 447: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc40aa01d  ! 448: LDUB_I	ldub	[%r10 + 0x001d], %r2
	.word 0xc9f2901f  ! 449: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba985f  ! 450: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9ba991f  ! 451: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba987f  ! 452: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 453: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc902a018  ! 454: LDF_I	ld	[%r10, 0x0018], %f4
	.word 0xd3ba981f  ! 455: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd092917f  ! 456: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r8
	.word 0xcacaa019  ! 457: LDSBA_I	ldsba	[%r10, + 0x0019] %asi, %r5
	.word 0xc3ba985f  ! 458: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc25a801f  ! 459: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xc892905f  ! 460: LDUHA_R	lduha	[%r10, %r31] 0x82, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc502801f  ! 461: LDF_R	ld	[%r10, %r31], %f2
	.word 0xd3f2a01f  ! 462: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba989f  ! 463: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba999f  ! 464: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3baa048  ! 465: STDFA_I	stda	%f9, [0x0048, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbbad91f  ! 466: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad95f  ! 467: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d01f  ! 468: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xc692e062  ! 469: LDUHA_I	lduha	[%r11, + 0x0062] %asi, %r3
	.word 0xd03aa008  ! 470: STD_I	std	%r8, [%r10 + 0x0008]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3ba987f  ! 471: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 472: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba993f  ! 473: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 474: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc9baa078  ! 475: STDFA_I	stda	%f4, [0x0078, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbe2d01f  ! 476: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xc5bae038  ! 477: STDFA_I	stda	%f2, [0x0038, %r11]
	.word 0xd3ba999f  ! 478: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba985f  ! 479: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcc0ae02f  ! 480: LDUB_I	ldub	[%r11 + 0x002f], %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc59ae038  ! 481: LDDFA_I	ldda	[%r11, 0x0038], %f2
	.word 0xc9bad97f  ! 482: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcb02801f  ! 483: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc9bad81f  ! 484: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d03f  ! 485: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc39aa030  ! 486: LDDFA_I	ldda	[%r10, 0x0030], %f1
	.word 0xc48a901f  ! 487: LDUBA_R	lduba	[%r10, %r31] 0x80, %r2
	.word 0xcac2e020  ! 488: LDSWA_I	ldswa	[%r11, + 0x0020] %asi, %r5
	.word 0xc7ba995f  ! 489: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 490: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd20ac01f  ! 491: LDUB_R	ldub	[%r11 + %r31], %r9
	.word 0xcbba981f  ! 492: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc212801f  ! 493: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xcc1a801f  ! 494: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc28aa071  ! 495: LDUBA_I	lduba	[%r10, + 0x0071] %asi, %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3f2a01f  ! 496: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba991f  ! 497: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 498: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3e2901f  ! 499: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba987f  ! 500: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3f2a01f  ! 501: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba99bf  ! 502: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2901f  ! 503: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba98bf  ! 504: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd052801f  ! 505: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcde2a01f  ! 506: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcc3a801f  ! 507: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd102801f  ! 508: LDF_R	ld	[%r10, %r31], %f8
	.word 0xce02c01f  ! 509: LDUW_R	lduw	[%r11 + %r31], %r7
	.word 0xce12c01f  ! 510: LDUH_R	lduh	[%r11 + %r31], %r7
TH_LABEL510:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7e2913f  ! 511: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba997f  ! 512: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa000  ! 513: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc7f2911f  ! 514: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba985f  ! 515: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7f2901f  ! 516: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc89aa028  ! 517: LDDA_I	ldda	[%r10, + 0x0028] %asi, %r4
	.word 0xca0aa060  ! 518: LDUB_I	ldub	[%r10 + 0x0060], %r5
	.word 0xd19aa010  ! 519: LDDFA_I	ldda	[%r10, 0x0010], %f8
	.word 0xcfba999f  ! 520: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc252e024  ! 521: LDSH_I	ldsh	[%r11 + 0x0024], %r1
	.word 0xd212a01a  ! 522: LDUH_I	lduh	[%r10 + 0x001a], %r9
	.word 0xcadad13f  ! 523: LDXA_R	ldxa	[%r11, %r31] 0x89, %r5
	.word 0xcfba98bf  ! 524: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 525: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc902801f  ! 526: LDF_R	ld	[%r10, %r31], %f4
	.word 0xca4a801f  ! 527: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xd3ba981f  ! 528: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xca52801f  ! 529: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xd1e2d01f  ! 530: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc49ae070  ! 531: LDDA_I	ldda	[%r11, + 0x0070] %asi, %r2
	.word 0xc5ba987f  ! 532: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xca92d17f  ! 533: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r5
	.word 0xc9bad97f  ! 534: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad87f  ! 535: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcf9ae070  ! 536: LDDFA_I	ldda	[%r11, 0x0070], %f7
	.word 0xcbba999f  ! 537: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba995f  ! 538: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xca0aa047  ! 539: LDUB_I	ldub	[%r10 + 0x0047], %r5
	.word 0xc4da911f  ! 540: LDXA_R	ldxa	[%r10, %r31] 0x88, %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfbad91f  ! 541: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc4d2a034  ! 542: LDSHA_I	ldsha	[%r10, + 0x0034] %asi, %r2
	.word 0xc99aa008  ! 543: LDDFA_I	ldda	[%r10, 0x0008], %f4
	.word 0xc502801f  ! 544: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc812c01f  ! 545: LDUH_R	lduh	[%r11 + %r31], %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfbad95f  ! 546: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 547: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xc81a801f  ! 548: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xcb22801f  ! 549: STF_R	st	%f5, [%r31, %r10]
	.word 0xc9ba999f  ! 550: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9e2911f  ! 551: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xd19aa008  ! 552: LDDFA_I	ldda	[%r10, 0x0008], %f8
	.word 0xcf9ae078  ! 553: LDDFA_I	ldda	[%r11, 0x0078], %f7
	.word 0xcbba99bf  ! 554: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 555: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc492e038  ! 556: LDUHA_I	lduha	[%r11, + 0x0038] %asi, %r2
	.word 0xc5e2913f  ! 557: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5ba981f  ! 558: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 559: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba98bf  ! 560: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbbae068  ! 561: STDFA_I	stda	%f5, [0x0068, %r11]
	.word 0xc9ba985f  ! 562: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa000  ! 563: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xc9ba997f  ! 564: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd0c2a078  ! 565: LDSWA_I	ldswa	[%r10, + 0x0078] %asi, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xce12801f  ! 566: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xc7ba999f  ! 567: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa048  ! 568: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc7ba99bf  ! 569: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 570: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7e2901f  ! 571: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba981f  ! 572: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc302a068  ! 573: LDF_I	ld	[%r10, 0x0068], %f1
	.word 0xc9ba98bf  ! 574: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 575: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9e2a01f  ! 576: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc292a026  ! 577: LDUHA_I	lduha	[%r10, + 0x0026] %asi, %r1
	.word 0xc9e2903f  ! 578: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc9ba99bf  ! 579: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc3baa018  ! 580: STDFA_I	stda	%f1, [0x0018, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc812c01f  ! 581: LDUH_R	lduh	[%r11 + %r31], %r4
	.word 0xc3bad95f  ! 582: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad99f  ! 583: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad95f  ! 584: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad87f  ! 585: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xce92d03f  ! 586: LDUHA_R	lduha	[%r11, %r31] 0x81, %r7
	.word 0xd3bad95f  ! 587: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xccd2e076  ! 588: LDSHA_I	ldsha	[%r11, + 0x0076] %asi, %r6
	.word 0xce02a050  ! 589: LDUW_I	lduw	[%r10 + 0x0050], %r7
	.word 0xc3e2e01f  ! 590: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3bad81f  ! 591: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc41ae060  ! 592: LDD_I	ldd	[%r11 + 0x0060], %r2
	.word 0xc3bad81f  ! 593: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcb22c01f  ! 594: STF_R	st	%f5, [%r31, %r11]
	.word 0xd04ac01f  ! 595: LDSB_R	ldsb	[%r11 + %r31], %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc43ae060  ! 596: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xcc5a801f  ! 597: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xc2daa060  ! 598: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r1
	.word 0xc39aa078  ! 599: LDDFA_I	ldda	[%r10, 0x0078], %f1
	.word 0xca12e06e  ! 600: LDUH_I	lduh	[%r11 + 0x006e], %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdbad83f  ! 601: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc412801f  ! 602: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xc80a801f  ! 603: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xd1ba99bf  ! 604: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd282905f  ! 605: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5ba999f  ! 606: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 607: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc81ac01f  ! 608: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xc722801f  ! 609: STF_R	st	%f3, [%r31, %r10]
	.word 0xd1e2d11f  ! 610: CASA_I	casa	[%r11] 0x88, %r31, %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc81aa008  ! 611: LDD_I	ldd	[%r10 + 0x0008], %r4
	.word 0xc83a801f  ! 612: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba989f  ! 613: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 614: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc88a913f  ! 615: LDUBA_R	lduba	[%r10, %r31] 0x89, %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbbad81f  ! 616: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ac01f  ! 617: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad81f  ! 618: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d13f  ! 619: CASXA_I	casxa	[%r11] 0x89, %r31, %r5
	.word 0xd052a020  ! 620: LDSH_I	ldsh	[%r10 + 0x0020], %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcad2903f  ! 621: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r5
	.word 0xcc1ae030  ! 622: LDD_I	ldd	[%r11 + 0x0030], %r6
	.word 0xcbba98bf  ! 623: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2903f  ! 624: CASA_I	casa	[%r10] 0x81, %r31, %r5
	.word 0xc09aa068  ! 625: LDDA_I	ldda	[%r10, + 0x0068] %asi, %r0
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc85a801f  ! 626: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xc5f2a01f  ! 627: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5f2901f  ! 628: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5e2903f  ! 629: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xce92e03a  ! 630: LDUHA_I	lduha	[%r11, + 0x003a] %asi, %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xceca901f  ! 631: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r7
	.word 0xc2ca905f  ! 632: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r1
	.word 0xc8c2903f  ! 633: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r4
	.word 0xd102c01f  ! 634: LDF_R	ld	[%r11, %r31], %f8
	.word 0xca8ae019  ! 635: LDUBA_I	lduba	[%r11, + 0x0019] %asi, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc3ae040  ! 636: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xcdbad97f  ! 637: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad89f  ! 638: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad9bf  ! 639: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdf2e01f  ! 640: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc3ae040  ! 641: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xc60aa012  ! 642: LDUB_I	ldub	[%r10 + 0x0012], %r3
	.word 0xc43aa030  ! 643: STD_I	std	%r2, [%r10 + 0x0030]
	.word 0xc842801f  ! 644: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xc4caa049  ! 645: LDSBA_I	ldsba	[%r10, + 0x0049] %asi, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc99ae040  ! 646: LDDFA_I	ldda	[%r11, 0x0040], %f4
	.word 0xd1bad81f  ! 647: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad83f  ! 648: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc2da917f  ! 649: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r1
	.word 0xc842801f  ! 650: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3e2901f  ! 651: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3e2a01f  ! 652: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba985f  ! 653: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 654: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xc24a801f  ! 655: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd0c2d01f  ! 656: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r8
	.word 0xcc3ac01f  ! 657: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcde2e01f  ! 658: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdbad83f  ! 659: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xce92d03f  ! 660: LDUHA_R	lduha	[%r11, %r31] 0x81, %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1ba985f  ! 661: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc92d01f  ! 662: LDUHA_R	lduha	[%r11, %r31] 0x80, %r6
	.word 0xc7bad93f  ! 663: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcc0aa034  ! 664: LDUB_I	ldub	[%r10 + 0x0034], %r6
	.word 0xcc12e00e  ! 665: LDUH_I	lduh	[%r11 + 0x000e], %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xca0ac01f  ! 666: LDUB_R	ldub	[%r11 + %r31], %r5
	.word 0xc9ba995f  ! 667: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc68a907f  ! 668: LDUBA_R	lduba	[%r10, %r31] 0x83, %r3
	.word 0xd282911f  ! 669: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r9
	.word 0xc83aa070  ! 670: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbf2901f  ! 671: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbba993f  ! 672: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa070  ! 673: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xcbba987f  ! 674: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2911f  ! 675: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd39aa030  ! 676: LDDFA_I	ldda	[%r10, 0x0030], %f9
	.word 0xc5bad95f  ! 677: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ac01f  ! 678: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad99f  ! 679: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2e01f  ! 680: CASA_R	casa	[%r11] %asi, %r31, %r2
TH_LABEL680:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5f2e01f  ! 681: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad95f  ! 682: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd09aa040  ! 683: LDDA_I	ldda	[%r10, + 0x0040] %asi, %r8
	.word 0xc43ac01f  ! 684: STD_R	std	%r2, [%r11 + %r31]
	.word 0xcc8ad15f  ! 685: LDUBA_R	lduba	[%r11, %r31] 0x8a, %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd0cad17f  ! 686: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r8
	.word 0xc84aa05b  ! 687: LDSB_I	ldsb	[%r10 + 0x005b], %r4
	.word 0xcbba993f  ! 688: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbbaa060  ! 689: STDFA_I	stda	%f5, [0x0060, %r10]
	.word 0xcbf2903f  ! 690: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbe2901f  ! 691: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbe2913f  ! 692: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xcbe2a01f  ! 693: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xccdaa010  ! 694: LDXA_I	ldxa	[%r10, + 0x0010] %asi, %r6
	.word 0xc8cad01f  ! 695: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xce42801f  ! 696: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xc9e2d11f  ! 697: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xc9bad99f  ! 698: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d01f  ! 699: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9bad83f  ! 700: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9bad95f  ! 701: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc85a801f  ! 702: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xd1f2a01f  ! 703: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc4dae048  ! 704: LDXA_I	ldxa	[%r11, + 0x0048] %asi, %r2
	.word 0xc302801f  ! 705: LDF_R	ld	[%r10, %r31], %f1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc41aa058  ! 706: LDD_I	ldd	[%r10 + 0x0058], %r2
	.word 0xcdf2a01f  ! 707: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc2dad17f  ! 708: LDXA_R	ldxa	[%r11, %r31] 0x8b, %r1
	.word 0xc43ac01f  ! 709: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae060  ! 710: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7bad91f  ! 711: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2d01f  ! 712: CASA_I	casa	[%r11] 0x80, %r31, %r3
	.word 0xc7bad87f  ! 713: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae060  ! 714: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xca12801f  ! 715: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdf2913f  ! 716: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xd252a04e  ! 717: LDSH_I	ldsh	[%r10 + 0x004e], %r9
	.word 0xcbba99bf  ! 718: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc852c01f  ! 719: LDSH_R	ldsh	[%r11 + %r31], %r4
	.word 0xcfe2a01f  ! 720: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xce52801f  ! 721: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xcfbad97f  ! 722: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd25ac01f  ! 723: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xc9ba997f  ! 724: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcb22c01f  ! 725: STF_R	st	%f5, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3ba989f  ! 726: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc41a801f  ! 727: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xcfba983f  ! 728: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc60ae029  ! 729: LDUB_I	ldub	[%r11 + 0x0029], %r3
	.word 0xd03ae070  ! 730: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc99ae008  ! 731: LDDFA_I	ldda	[%r11, 0x0008], %f4
	.word 0xcadae040  ! 732: LDXA_I	ldxa	[%r11, + 0x0040] %asi, %r5
	.word 0xc83ac01f  ! 733: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc49aa020  ! 734: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r2
	.word 0xc9e2911f  ! 735: CASA_I	casa	[%r10] 0x88, %r31, %r4
TH_LABEL735:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9ba981f  ! 736: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 737: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa078  ! 738: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xc79aa008  ! 739: LDDFA_I	ldda	[%r10, 0x0008], %f3
	.word 0xd1ba983f  ! 740: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5bae018  ! 741: STDFA_I	stda	%f2, [0x0018, %r11]
	.word 0xcbba989f  ! 742: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba99bf  ! 743: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2901f  ! 744: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbf2903f  ! 745: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc83a801f  ! 746: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba991f  ! 747: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd242c01f  ! 748: LDSW_R	ldsw	[%r11 + %r31], %r9
	.word 0xcff2e01f  ! 749: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcacaa04c  ! 750: LDSBA_I	ldsba	[%r10, + 0x004c] %asi, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3e2901f  ! 751: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba997f  ! 752: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba997f  ! 753: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa058  ! 754: STD_I	std	%r0, [%r10 + 0x0058]
	.word 0xc3e2901f  ! 755: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xce0a801f  ! 756: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xc4daa018  ! 757: LDXA_I	ldxa	[%r10, + 0x0018] %asi, %r2
	.word 0xc682903f  ! 758: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r3
	.word 0xcfba987f  ! 759: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc302801f  ! 760: LDF_R	ld	[%r10, %r31], %f1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xce82d07f  ! 761: LDUWA_R	lduwa	[%r11, %r31] 0x83, %r7
	.word 0xca42801f  ! 762: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xc3ba997f  ! 763: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc302801f  ! 764: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc922801f  ! 765: STF_R	st	%f4, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc8c2a064  ! 766: LDSWA_I	ldswa	[%r10, + 0x0064] %asi, %r4
	.word 0xc83a801f  ! 767: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba997f  ! 768: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 769: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba997f  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc83aa038  ! 771: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xc9f2a01f  ! 772: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba989f  ! 773: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc902c01f  ! 774: LDF_R	ld	[%r11, %r31], %f4
	.word 0xd3ba99bf  ! 775: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc702a070  ! 776: LDF_I	ld	[%r10, 0x0070], %f3
	.word 0xce92907f  ! 777: LDUHA_R	lduha	[%r10, %r31] 0x83, %r7
	.word 0xd302a060  ! 778: LDF_I	ld	[%r10, 0x0060], %f9
	.word 0xc452801f  ! 779: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xc3ba987f  ! 780: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd2c2e064  ! 781: LDSWA_I	ldswa	[%r11, + 0x0064] %asi, %r9
	.word 0xc5e2901f  ! 782: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba993f  ! 783: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2913f  ! 784: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc43aa018  ! 785: STD_I	std	%r2, [%r10 + 0x0018]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc41ae010  ! 786: LDD_I	ldd	[%r11 + 0x0010], %r2
	.word 0xd03ae050  ! 787: STD_I	std	%r8, [%r11 + 0x0050]
	.word 0xd39ae060  ! 788: LDDFA_I	ldda	[%r11, 0x0060], %f9
	.word 0xd1ba981f  ! 789: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca5a801f  ! 790: LDX_R	ldx	[%r10 + %r31], %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3ba997f  ! 791: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc28a901f  ! 792: LDUBA_R	lduba	[%r10, %r31] 0x80, %r1
	.word 0xd3f2a01f  ! 793: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba981f  ! 794: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 795: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc80ae002  ! 796: LDUB_I	ldub	[%r11 + 0x0002], %r4
	.word 0xd1ba987f  ! 797: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2901f  ! 798: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba981f  ! 799: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 800: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL800:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc402e00c  ! 801: LDUW_I	lduw	[%r11 + 0x000c], %r2
	.word 0xc9ba981f  ! 802: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc482901f  ! 803: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r2
	.word 0xc41aa078  ! 804: LDD_I	ldd	[%r10 + 0x0078], %r2
	.word 0xcc3a801f  ! 805: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc3a801f  ! 806: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2913f  ! 807: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcdba981f  ! 808: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 809: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 810: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc3a801f  ! 811: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba991f  ! 812: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa010  ! 813: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcc3aa010  ! 814: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xc922801f  ! 815: STF_R	st	%f4, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9ba997f  ! 816: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcd9ae010  ! 817: LDDFA_I	ldda	[%r11, 0x0010], %f6
	.word 0xcdbad97f  ! 818: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad95f  ! 819: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2e01f  ! 820: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcde2d13f  ! 821: CASA_I	casa	[%r11] 0x89, %r31, %r6
	.word 0xc902c01f  ! 822: LDF_R	ld	[%r11, %r31], %f4
	.word 0xc83a801f  ! 823: STD_R	std	%r4, [%r10 + %r31]
	.word 0xceca915f  ! 824: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r7
	.word 0xc9bad99f  ! 825: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc83ac01f  ! 826: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc522801f  ! 827: STF_R	st	%f2, [%r31, %r10]
	.word 0xcdba981f  ! 828: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc6c2d17f  ! 829: LDSWA_R	ldswa	[%r11, %r31] 0x8b, %r3
	.word 0xc9bad9bf  ! 830: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd052a066  ! 831: LDSH_I	ldsh	[%r10 + 0x0066], %r8
	.word 0xd1baa008  ! 832: STDFA_I	stda	%f8, [0x0008, %r10]
	.word 0xcbe2a01f  ! 833: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbe2a01f  ! 834: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcd02e02c  ! 835: LDF_I	ld	[%r11, 0x002c], %f6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3ba989f  ! 836: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc612a06e  ! 837: LDUH_I	lduh	[%r10 + 0x006e], %r3
	.word 0xc89aa048  ! 838: LDDA_I	ldda	[%r10, + 0x0048] %asi, %r4
	.word 0xd3bad99f  ! 839: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae000  ! 840: STD_I	std	%r8, [%r11 + 0x0000]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3bad81f  ! 841: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 842: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xc9baa060  ! 843: STDFA_I	stda	%f4, [0x0060, %r10]
	.word 0xc83ac01f  ! 844: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc8d2901f  ! 845: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcadae048  ! 846: LDXA_I	ldxa	[%r11, + 0x0048] %asi, %r5
	.word 0xd03ae048  ! 847: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xd3f2e01f  ! 848: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2d01f  ! 849: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd3f2e01f  ! 850: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xce02c01f  ! 851: LDUW_R	lduw	[%r11 + %r31], %r7
	.word 0xc3ba995f  ! 852: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 853: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2901f  ! 854: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba981f  ! 855: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc79ae018  ! 856: LDDFA_I	ldda	[%r11, 0x0018], %f3
	.word 0xcfba997f  ! 857: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd252e034  ! 858: LDSH_I	ldsh	[%r11 + 0x0034], %r9
	.word 0xc4c2917f  ! 859: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r2
	.word 0xd302a01c  ! 860: LDF_I	ld	[%r10, 0x001c], %f9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdba991f  ! 861: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc39aa008  ! 862: LDDFA_I	ldda	[%r10, 0x0008], %f1
	.word 0xcfe2a01f  ! 863: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba99bf  ! 864: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 865: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc3aa020  ! 866: STD_I	std	%r6, [%r10 + 0x0020]
	.word 0xcfe2a01f  ! 867: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd322c01f  ! 868: STF_R	st	%f9, [%r31, %r11]
	.word 0xcd22801f  ! 869: STF_R	st	%f6, [%r31, %r10]
	.word 0xc5f2d13f  ! 870: CASXA_I	casxa	[%r11] 0x89, %r31, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5e2d13f  ! 871: CASA_I	casa	[%r11] 0x89, %r31, %r2
	.word 0xc43ac01f  ! 872: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad91f  ! 873: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc45aa068  ! 874: LDX_I	ldx	[%r10 + 0x0068], %r2
	.word 0xcdbae060  ! 875: STDFA_I	stda	%f6, [0x0060, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc68aa03c  ! 876: LDUBA_I	lduba	[%r10, + 0x003c] %asi, %r3
	.word 0xc5bad81f  ! 877: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcb9ae050  ! 878: LDDFA_I	ldda	[%r11, 0x0050], %f5
	.word 0xcdf2d01f  ! 879: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xc8d2a034  ! 880: LDSHA_I	ldsha	[%r10, + 0x0034] %asi, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5f2911f  ! 881: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xc5f2a01f  ! 882: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba981f  ! 883: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 884: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc39aa030  ! 885: LDDFA_I	ldda	[%r10, 0x0030], %f1
TH_LABEL885:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc302a008  ! 886: LDF_I	ld	[%r10, 0x0008], %f1
	.word 0xc3f2e01f  ! 887: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3f2e01f  ! 888: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad93f  ! 889: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc652c01f  ! 890: LDSH_R	ldsh	[%r11 + %r31], %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc8d2901f  ! 891: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r4
	.word 0xd1ba999f  ! 892: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba989f  ! 893: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 894: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba993f  ! 895: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd03aa028  ! 896: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd1ba99bf  ! 897: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 898: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc702801f  ! 899: LDF_R	ld	[%r10, %r31], %f3
	.word 0xd102e054  ! 900: LDF_I	ld	[%r11, 0x0054], %f8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1baa040  ! 901: STDFA_I	stda	%f8, [0x0040, %r10]
	.word 0xcc52a064  ! 902: LDSH_I	ldsh	[%r10 + 0x0064], %r6
	.word 0xc412c01f  ! 903: LDUH_R	lduh	[%r11 + %r31], %r2
	.word 0xd082a06c  ! 904: LDUWA_I	lduwa	[%r10, + 0x006c] %asi, %r8
	.word 0xcd9aa010  ! 905: LDDFA_I	ldda	[%r10, 0x0010], %f6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7f2d03f  ! 906: CASXA_I	casxa	[%r11] 0x81, %r31, %r3
	.word 0xc702801f  ! 907: LDF_R	ld	[%r10, %r31], %f3
	.word 0xd24ae01f  ! 908: LDSB_I	ldsb	[%r11 + 0x001f], %r9
	.word 0xd24aa023  ! 909: LDSB_I	ldsb	[%r10 + 0x0023], %r9
	.word 0xc83aa008  ! 910: STD_I	std	%r4, [%r10 + 0x0008]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcd02e044  ! 911: LDF_I	ld	[%r11, 0x0044], %f6
	.word 0xcd02a01c  ! 912: LDF_I	ld	[%r10, 0x001c], %f6
	.word 0xc3e2a01f  ! 913: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3f2913f  ! 914: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xc3f2a01f  ! 915: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3ba991f  ! 916: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2903f  ! 917: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc402801f  ! 918: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xc59aa078  ! 919: LDDFA_I	ldda	[%r10, 0x0078], %f2
	.word 0xced2903f  ! 920: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd03aa010  ! 921: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1e2901f  ! 922: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba987f  ! 923: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2913f  ! 924: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xd03aa010  ! 925: STD_I	std	%r8, [%r10 + 0x0010]
TH_LABEL925:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xca52801f  ! 926: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xc3e2e01f  ! 927: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xccc2e03c  ! 928: LDSWA_I	ldswa	[%r11, + 0x003c] %asi, %r6
	.word 0xc7bad97f  ! 929: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc2c2915f  ! 930: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3baa078  ! 931: STDFA_I	stda	%f1, [0x0078, %r10]
	.word 0xcde2a01f  ! 932: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2901f  ! 933: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba985f  ! 934: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa070  ! 935: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc3aa070  ! 936: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xd3bae060  ! 937: STDFA_I	stda	%f9, [0x0060, %r11]
	.word 0xccca915f  ! 938: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r6
	.word 0xc59aa038  ! 939: LDDFA_I	ldda	[%r10, 0x0038], %f2
	.word 0xd092911f  ! 940: LDUHA_R	lduha	[%r10, %r31] 0x88, %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9baa058  ! 941: STDFA_I	stda	%f4, [0x0058, %r10]
	.word 0xd002801f  ! 942: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xd1ba98bf  ! 943: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 944: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba981f  ! 945: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1ba987f  ! 946: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2901f  ! 947: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xcac2901f  ! 948: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r5
	.word 0xcd02c01f  ! 949: LDF_R	ld	[%r11, %r31], %f6
	.word 0xd3e2913f  ! 950: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd2d2a01a  ! 951: LDSHA_I	ldsha	[%r10, + 0x001a] %asi, %r9
	.word 0xc43ae028  ! 952: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc43ac01f  ! 953: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc702a018  ! 954: LDF_I	ld	[%r10, 0x0018], %f3
	.word 0xd1baa030  ! 955: STDFA_I	stda	%f8, [0x0030, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc492901f  ! 956: LDUHA_R	lduha	[%r10, %r31] 0x80, %r2
	.word 0xc3ba987f  ! 957: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa008  ! 958: STD_I	std	%r0, [%r10 + 0x0008]
	.word 0xcfbae070  ! 959: STDFA_I	stda	%f7, [0x0070, %r11]
	.word 0xcfba987f  ! 960: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd00aa000  ! 961: LDUB_I	ldub	[%r10 + 0x0000], %r8
	.word 0xd05aa058  ! 962: LDX_I	ldx	[%r10 + 0x0058], %r8
	.word 0xcbbad89f  ! 963: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd002801f  ! 964: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xd1ba987f  ! 965: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd03aa030  ! 966: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xd1ba991f  ! 967: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc902a020  ! 968: LDF_I	ld	[%r10, 0x0020], %f4
	.word 0xc3bad85f  ! 969: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad97f  ! 970: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc59aa040  ! 971: LDDFA_I	ldda	[%r10, 0x0040], %f2
	.word 0xd3ba987f  ! 972: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2911f  ! 973: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xc2ca917f  ! 974: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r1
	.word 0xd01ae048  ! 975: LDD_I	ldd	[%r11 + 0x0048], %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd2c2911f  ! 976: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r9
	.word 0xd242a044  ! 977: LDSW_I	ldsw	[%r10 + 0x0044], %r9
	.word 0xcac2903f  ! 978: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r5
	.word 0xcadad03f  ! 979: LDXA_R	ldxa	[%r11, %r31] 0x81, %r5
	.word 0xcc3aa030  ! 980: STD_I	std	%r6, [%r10 + 0x0030]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc3aa030  ! 981: STD_I	std	%r6, [%r10 + 0x0030]
	.word 0xca4ac01f  ! 982: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xc7e2913f  ! 983: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc60ae060  ! 984: LDUB_I	ldub	[%r11 + 0x0060], %r3
	.word 0xc60ae060  ! 985: LDUB_I	ldub	[%r11 + 0x0060], %r3
TH_LABEL985:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7f2a01f  ! 986: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba981f  ! 987: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xce8aa06c  ! 988: LDUBA_I	lduba	[%r10, + 0x006c] %asi, %r7
	.word 0xcb02e040  ! 989: LDF_I	ld	[%r11, 0x0040], %f5
	.word 0xcff2a01f  ! 990: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc3a801f  ! 991: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba981f  ! 992: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd04aa006  ! 993: LDSB_I	ldsb	[%r10 + 0x0006], %r8
	.word 0xc9bad95f  ! 994: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad97f  ! 995: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcf9ae020  ! 996: LDDFA_I	ldda	[%r11, 0x0020], %f7
	.word 0xccc2e044  ! 997: LDSWA_I	ldswa	[%r11, + 0x0044] %asi, %r6
	.word 0xcfbad87f  ! 998: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc9baa058  ! 999: STDFA_I	stda	%f4, [0x0058, %r10]
	.word 0xc03a801f  ! 1000: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	subcc %r30, 1, %r30
	bnz  TH5_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	add	%g0,	0x1,	%r30
TH4_LOOP_START:
	.word 0xc5ba981f  ! 1: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc82a028  ! 2: LDUWA_I	lduwa	[%r10, + 0x0028] %asi, %r6
	.word 0xcc02e030  ! 3: LDUW_I	lduw	[%r11 + 0x0030], %r6
	.word 0xce5a801f  ! 4: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xcde2e01f  ! 5: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdbad83f  ! 6: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc2d2d15f  ! 7: LDSHA_R	ldsha	[%r11, %r31] 0x8a, %r1
	.word 0xc9e2901f  ! 8: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xcc42a018  ! 9: LDSW_I	ldsw	[%r10 + 0x0018], %r6
	.word 0xc68aa03b  ! 10: LDUBA_I	lduba	[%r10, + 0x003b] %asi, %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc49ae050  ! 11: LDDA_I	ldda	[%r11, + 0x0050] %asi, %r2
	.word 0xcb02a074  ! 12: LDF_I	ld	[%r10, 0x0074], %f5
	.word 0xc3ba98bf  ! 13: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 14: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba99bf  ! 15: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc8caa027  ! 16: LDSBA_I	ldsba	[%r10, + 0x0027] %asi, %r4
	.word 0xca8aa079  ! 17: LDUBA_I	lduba	[%r10, + 0x0079] %asi, %r5
	.word 0xcdf2a01f  ! 18: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2901f  ! 19: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba993f  ! 20: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdba987f  ! 21: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 22: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc882901f  ! 23: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r4
	.word 0xd3ba987f  ! 24: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 25: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3baa010  ! 26: STDFA_I	stda	%f9, [0x0010, %r10]
	.word 0xd1e2e01f  ! 27: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xcb22801f  ! 28: STF_R	st	%f5, [%r31, %r10]
	.word 0xc9bad93f  ! 29: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad83f  ! 30: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9e2e01f  ! 31: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xd1bae018  ! 32: STDFA_I	stda	%f8, [0x0018, %r11]
	.word 0xcdba991f  ! 33: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 34: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba995f  ! 35: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc3aa028  ! 36: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xcc3a801f  ! 37: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2901f  ! 38: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba997f  ! 39: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2913f  ! 40: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc1aa040  ! 41: LDD_I	ldd	[%r10 + 0x0040], %r6
	.word 0xc5f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2a01f  ! 43: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xd3bae008  ! 44: STDFA_I	stda	%f9, [0x0008, %r11]
	.word 0xcbe2e01f  ! 45: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc8da907f  ! 46: LDXA_R	ldxa	[%r10, %r31] 0x83, %r4
	.word 0xd1ba985f  ! 47: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 48: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1f2a01f  ! 49: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba981f  ! 50: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9baa038  ! 51: STDFA_I	stda	%f4, [0x0038, %r10]
	.word 0xc88aa002  ! 52: LDUBA_I	lduba	[%r10, + 0x0002] %asi, %r4
	.word 0xd28a905f  ! 53: LDUBA_R	lduba	[%r10, %r31] 0x82, %r9
	.word 0xc79aa048  ! 54: LDDFA_I	ldda	[%r10, 0x0048], %f3
	.word 0xc03ac01f  ! 55: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc482a020  ! 56: LDUWA_I	lduwa	[%r10, + 0x0020] %asi, %r2
	.word 0xc9bad85f  ! 57: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 58: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcbbaa008  ! 59: STDFA_I	stda	%f5, [0x0008, %r10]
	.word 0xc302c01f  ! 60: LDF_R	ld	[%r11, %r31], %f1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3ba993f  ! 61: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd0c2903f  ! 62: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r8
	.word 0xc802801f  ! 63: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xc5ba987f  ! 64: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc7baa008  ! 65: STDFA_I	stda	%f3, [0x0008, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1f2e01f  ! 66: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd03ac01f  ! 67: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad97f  ! 68: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae048  ! 69: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xc812801f  ! 70: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd242e030  ! 71: LDSW_I	ldsw	[%r11 + 0x0030], %r9
	.word 0xc41a801f  ! 72: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xca12801f  ! 73: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xc9f2e01f  ! 74: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xd302801f  ! 75: LDF_R	ld	[%r10, %r31], %f9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbba99bf  ! 76: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd302801f  ! 77: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd1bae040  ! 78: STDFA_I	stda	%f8, [0x0040, %r11]
	.word 0xcbbad81f  ! 79: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc922801f  ! 80: STF_R	st	%f4, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd092d13f  ! 81: LDUHA_R	lduha	[%r11, %r31] 0x89, %r8
	.word 0xd3bad85f  ! 82: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 83: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad87f  ! 84: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad99f  ! 85: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcd9aa020  ! 86: LDDFA_I	ldda	[%r10, 0x0020], %f6
	.word 0xc3f2d03f  ! 87: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xc3e2d11f  ! 88: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xce82901f  ! 89: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r7
	.word 0xcb9aa028  ! 90: LDDFA_I	ldda	[%r10, 0x0028], %f5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc83aa070  ! 91: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xd3baa020  ! 92: STDFA_I	stda	%f9, [0x0020, %r10]
	.word 0xc3ba989f  ! 93: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcfbaa058  ! 94: STDFA_I	stda	%f7, [0x0058, %r10]
	.word 0xcc3a801f  ! 95: STD_R	std	%r6, [%r10 + %r31]
TH_LABEL95:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc3a801f  ! 96: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 97: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba993f  ! 98: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba989f  ! 99: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc81ae060  ! 100: LDD_I	ldd	[%r11 + 0x0060], %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5bad81f  ! 101: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad83f  ! 102: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd24a801f  ! 103: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xce52a036  ! 104: LDSH_I	ldsh	[%r10 + 0x0036], %r7
	.word 0xd3f2e01f  ! 105: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3f2e01f  ! 106: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xcada911f  ! 107: LDXA_R	ldxa	[%r10, %r31] 0x88, %r5
	.word 0xcfba985f  ! 108: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 109: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca42e064  ! 110: LDSW_I	ldsw	[%r11 + 0x0064], %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc6daa018  ! 111: LDXA_I	ldxa	[%r10, + 0x0018] %asi, %r3
	.word 0xc9baa070  ! 112: STDFA_I	stda	%f4, [0x0070, %r10]
	.word 0xc9f2903f  ! 113: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc44a801f  ! 114: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xc9f2911f  ! 115: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9e2901f  ! 116: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9e2901f  ! 117: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba987f  ! 118: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 119: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba98bf  ! 120: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9e2903f  ! 121: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xd04aa011  ! 122: LDSB_I	ldsb	[%r10 + 0x0011], %r8
	.word 0xcdbad81f  ! 123: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd2daa050  ! 124: LDXA_I	ldxa	[%r10, + 0x0050] %asi, %r9
	.word 0xd03ac01f  ! 125: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1bad81f  ! 126: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 127: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd01ae040  ! 128: LDD_I	ldd	[%r11 + 0x0040], %r8
	.word 0xd3ba989f  ! 129: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba999f  ! 130: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xce02c01f  ! 131: LDUW_R	lduw	[%r11 + %r31], %r7
	.word 0xc3ba993f  ! 132: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcf9aa028  ! 133: LDDFA_I	ldda	[%r10, 0x0028], %f7
	.word 0xcfba98bf  ! 134: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcdbaa050  ! 135: STDFA_I	stda	%f6, [0x0050, %r10]
TH_LABEL135:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5ba98bf  ! 136: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2911f  ! 137: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc6ca903f  ! 138: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r3
	.word 0xcdf2a01f  ! 139: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba98bf  ! 140: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd082a074  ! 141: LDUWA_I	lduwa	[%r10, + 0x0074] %asi, %r8
	.word 0xc8ca911f  ! 142: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r4
	.word 0xc3f2e01f  ! 143: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xca4a801f  ! 144: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xcadae068  ! 145: LDXA_I	ldxa	[%r11, + 0x0068] %asi, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5e2a01f  ! 146: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc302e030  ! 147: LDF_I	ld	[%r11, 0x0030], %f1
	.word 0xc3ba991f  ! 148: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2911f  ! 149: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc3e2a01f  ! 150: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcac2901f  ! 151: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r5
	.word 0xc5e2e01f  ! 152: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc602e044  ! 153: LDUW_I	lduw	[%r11 + 0x0044], %r3
	.word 0xc7ba989f  ! 154: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 155: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7ba999f  ! 156: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 157: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xd39aa068  ! 158: LDDFA_I	ldda	[%r10, 0x0068], %f9
	.word 0xd1baa038  ! 159: STDFA_I	stda	%f8, [0x0038, %r10]
	.word 0xc612a03e  ! 160: LDUH_I	lduh	[%r10 + 0x003e], %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc6ca905f  ! 161: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r3
	.word 0xc3bad85f  ! 162: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 163: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3e2e01f  ! 164: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2e01f  ! 165: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcf02801f  ! 166: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcc92911f  ! 167: LDUHA_R	lduha	[%r10, %r31] 0x88, %r6
	.word 0xc9baa018  ! 168: STDFA_I	stda	%f4, [0x0018, %r10]
	.word 0xcc1a801f  ! 169: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc5e2e01f  ! 170: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcf9aa018  ! 171: LDDFA_I	ldda	[%r10, 0x0018], %f7
	.word 0xd3bad97f  ! 172: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 173: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xc59aa078  ! 174: LDDFA_I	ldda	[%r10, 0x0078], %f2
	.word 0xcbbad8bf  ! 175: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbbad99f  ! 176: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc7baa010  ! 177: STDFA_I	stda	%f3, [0x0010, %r10]
	.word 0xc9ba981f  ! 178: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc642a01c  ! 179: LDSW_I	ldsw	[%r10 + 0x001c], %r3
	.word 0xd322c01f  ! 180: STF_R	st	%f9, [%r31, %r11]
TH_LABEL180:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfbad9bf  ! 181: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xccd2a010  ! 182: LDSHA_I	ldsha	[%r10, + 0x0010] %asi, %r6
	.word 0xc65aa060  ! 183: LDX_I	ldx	[%r10 + 0x0060], %r3
	.word 0xc2ca903f  ! 184: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r1
	.word 0xc7e2e01f  ! 185: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xce5ac01f  ! 186: LDX_R	ldx	[%r11 + %r31], %r7
	.word 0xc3bad89f  ! 187: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcada901f  ! 188: LDXA_R	ldxa	[%r10, %r31] 0x80, %r5
	.word 0xc3e2901f  ! 189: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xcad2d13f  ! 190: LDSHA_R	ldsha	[%r11, %r31] 0x89, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9bad83f  ! 191: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xce0aa026  ! 192: LDUB_I	ldub	[%r10 + 0x0026], %r7
	.word 0xcfbad85f  ! 193: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc24a801f  ! 194: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xc85ac01f  ! 195: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcb9aa070  ! 196: LDDFA_I	ldda	[%r10, 0x0070], %f5
	.word 0xd1baa048  ! 197: STDFA_I	stda	%f8, [0x0048, %r10]
	.word 0xc45aa058  ! 198: LDX_I	ldx	[%r10 + 0x0058], %r2
	.word 0xd04aa064  ! 199: LDSB_I	ldsb	[%r10 + 0x0064], %r8
	.word 0xc9e2d01f  ! 200: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc25a801f  ! 201: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xc5e2a01f  ! 202: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcdbae068  ! 203: STDFA_I	stda	%f6, [0x0068, %r11]
	.word 0xc5ba981f  ! 204: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcb9aa030  ! 205: LDDFA_I	ldda	[%r10, 0x0030], %f5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc25ae040  ! 206: LDX_I	ldx	[%r11 + 0x0040], %r1
	.word 0xc81ac01f  ! 207: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xc412801f  ! 208: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xcb02c01f  ! 209: LDF_R	ld	[%r11, %r31], %f5
	.word 0xc39ae048  ! 210: LDDFA_I	ldda	[%r11, 0x0048], %f1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdba983f  ! 211: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc702801f  ! 212: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc7bad83f  ! 213: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc652a03c  ! 214: LDSH_I	ldsh	[%r10 + 0x003c], %r3
	.word 0xc5f2a01f  ! 215: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5ba999f  ! 216: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 217: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba983f  ! 218: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc40ac01f  ! 219: LDUB_R	ldub	[%r11 + %r31], %r2
	.word 0xc85aa010  ! 220: LDX_I	ldx	[%r10 + 0x0010], %r4
TH_LABEL220:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3e2901f  ! 221: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd03a801f  ! 222: STD_R	std	%r8, [%r10 + %r31]
	.word 0xcc5a801f  ! 223: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xc5e2a01f  ! 224: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xce82913f  ! 225: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc6c2915f  ! 226: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r3
	.word 0xd3ba987f  ! 227: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba983f  ! 228: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba983f  ! 229: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 230: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd03aa010  ! 231: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd3e2a01f  ! 232: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 233: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba983f  ! 234: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa010  ! 235: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd03a801f  ! 236: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc4d2d15f  ! 237: LDSHA_R	ldsha	[%r11, %r31] 0x8a, %r2
	.word 0xcf22c01f  ! 238: STF_R	st	%f7, [%r31, %r11]
	.word 0xcfba993f  ! 239: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd102801f  ! 240: LDF_R	ld	[%r10, %r31], %f8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc43aa010  ! 241: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xc502a014  ! 242: LDF_I	ld	[%r10, 0x0014], %f2
	.word 0xc302801f  ! 243: LDF_R	ld	[%r10, %r31], %f1
	.word 0xd08a903f  ! 244: LDUBA_R	lduba	[%r10, %r31] 0x81, %r8
	.word 0xd03aa038  ! 245: STD_I	std	%r8, [%r10 + 0x0038]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3ba99bf  ! 246: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba999f  ! 247: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 248: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xcc82901f  ! 249: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r6
	.word 0xcbba983f  ! 250: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbba997f  ! 251: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa038  ! 252: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xd20aa035  ! 253: LDUB_I	ldub	[%r10 + 0x0035], %r9
	.word 0xd3ba989f  ! 254: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 255: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3f2a01f  ! 256: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03aa058  ! 257: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3ba981f  ! 258: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc642801f  ! 259: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xce0aa032  ! 260: LDUB_I	ldub	[%r10 + 0x0032], %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1bad9bf  ! 261: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad91f  ! 262: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad93f  ! 263: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc2c2d01f  ! 264: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r1
	.word 0xc7e2a01f  ! 265: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7ba981f  ! 266: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 267: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 268: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xceca913f  ! 269: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r7
	.word 0xcf9aa008  ! 270: LDDFA_I	ldda	[%r10, 0x0008], %f7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc1aa050  ! 271: LDD_I	ldd	[%r10 + 0x0050], %r6
	.word 0xd0d2e070  ! 272: LDSHA_I	ldsha	[%r11, + 0x0070] %asi, %r8
	.word 0xc43aa058  ! 273: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc5f2a01f  ! 274: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5f2903f  ! 275: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbbae000  ! 276: STDFA_I	stda	%f5, [0x0000, %r11]
	.word 0xc40a801f  ! 277: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xcc3aa038  ! 278: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcfba987f  ! 279: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba993f  ! 280: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfe2a01f  ! 281: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd01ae048  ! 282: LDD_I	ldd	[%r11 + 0x0048], %r8
	.word 0xcde2d03f  ! 283: CASA_I	casa	[%r11] 0x81, %r31, %r6
	.word 0xcdf2d13f  ! 284: CASXA_I	casxa	[%r11] 0x89, %r31, %r6
	.word 0xce12e00e  ! 285: LDUH_I	lduh	[%r11 + 0x000e], %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc502e008  ! 286: LDF_I	ld	[%r11, 0x0008], %f2
	.word 0xc5ba981f  ! 287: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2901f  ! 288: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba987f  ! 289: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd2da907f  ! 290: LDXA_R	ldxa	[%r10, %r31] 0x83, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9ba985f  ! 291: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 292: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc99aa010  ! 293: LDDFA_I	ldda	[%r10, 0x0010], %f4
	.word 0xcbf2901f  ! 294: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbf2901f  ! 295: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
TH_LABEL295:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc4d2e00e  ! 296: LDSHA_I	ldsha	[%r11, + 0x000e] %asi, %r2
	.word 0xc03ac01f  ! 297: STD_R	std	%r0, [%r11 + %r31]
	.word 0xce02a024  ! 298: LDUW_I	lduw	[%r10 + 0x0024], %r7
	.word 0xc79ae000  ! 299: LDDFA_I	ldda	[%r11, 0x0000], %f3
	.word 0xcc3aa040  ! 300: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdba99bf  ! 301: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 302: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2913f  ! 303: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xd082903f  ! 304: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r8
	.word 0xd3bad91f  ! 305: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3bad87f  ! 306: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 307: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad8bf  ! 308: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc6daa060  ! 309: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r3
	.word 0xc802a068  ! 310: LDUW_I	lduw	[%r10 + 0x0068], %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7bae050  ! 311: STDFA_I	stda	%f3, [0x0050, %r11]
	.word 0xc3e2903f  ! 312: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc4ca901f  ! 313: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r2
	.word 0xc892a042  ! 314: LDUHA_I	lduha	[%r10, + 0x0042] %asi, %r4
	.word 0xc7bad89f  ! 315: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3baa050  ! 316: STDFA_I	stda	%f1, [0x0050, %r10]
	.word 0xc84ae003  ! 317: LDSB_I	ldsb	[%r11 + 0x0003], %r4
	.word 0xcbf2e01f  ! 318: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xd3bae028  ! 319: STDFA_I	stda	%f9, [0x0028, %r11]
	.word 0xc242e024  ! 320: LDSW_I	ldsw	[%r11 + 0x0024], %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd03aa050  ! 321: STD_I	std	%r8, [%r10 + 0x0050]
	.word 0xd1f2a01f  ! 322: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba993f  ! 323: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 324: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc6d2a004  ! 325: LDSHA_I	ldsha	[%r10, + 0x0004] %asi, %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5ba985f  ! 326: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xca5aa068  ! 327: LDX_I	ldx	[%r10 + 0x0068], %r5
	.word 0xcfba999f  ! 328: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xccd2a002  ! 329: LDSHA_I	ldsha	[%r10, + 0x0002] %asi, %r6
	.word 0xc5bad9bf  ! 330: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdbae000  ! 331: STDFA_I	stda	%f6, [0x0000, %r11]
	.word 0xd2caa025  ! 332: LDSBA_I	ldsba	[%r10, + 0x0025] %asi, %r9
	.word 0xd03a801f  ! 333: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba999f  ! 334: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcc0a801f  ! 335: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3e2d03f  ! 336: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xc3e2d11f  ! 337: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xc5bae028  ! 338: STDFA_I	stda	%f2, [0x0028, %r11]
	.word 0xc83ae018  ! 339: STD_I	std	%r4, [%r11 + 0x0018]
	.word 0xced2901f  ! 340: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcf02a010  ! 341: LDF_I	ld	[%r10, 0x0010], %f7
	.word 0xc7ba999f  ! 342: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xca52e026  ! 343: LDSH_I	ldsh	[%r11 + 0x0026], %r5
	.word 0xd0da917f  ! 344: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r8
	.word 0xc48aa049  ! 345: LDUBA_I	lduba	[%r10, + 0x0049] %asi, %r2
TH_LABEL345:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7bae028  ! 346: STDFA_I	stda	%f3, [0x0028, %r11]
	.word 0xd3bad95f  ! 347: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d13f  ! 348: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd03ae010  ! 349: STD_I	std	%r8, [%r11 + 0x0010]
	.word 0xd3bad8bf  ! 350: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc2ca917f  ! 351: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r1
	.word 0xc9f2913f  ! 352: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9f2901f  ! 353: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc83a801f  ! 354: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 355: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9e2911f  ! 356: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xcf02a050  ! 357: LDF_I	ld	[%r10, 0x0050], %f7
	.word 0xc43aa000  ! 358: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc43aa000  ! 359: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xce02801f  ! 360: LDUW_R	lduw	[%r10 + %r31], %r7
TH_LABEL360:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5e2a01f  ! 361: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc4ca903f  ! 362: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r2
	.word 0xc3ba995f  ! 363: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xccda907f  ! 364: LDXA_R	ldxa	[%r10, %r31] 0x83, %r6
	.word 0xc6cad07f  ! 365: LDSBA_R	ldsba	[%r11, %r31] 0x83, %r3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03aa000  ! 366: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xc802c01f  ! 367: LDUW_R	lduw	[%r11 + %r31], %r4
	.word 0xc59ae010  ! 368: LDDFA_I	ldda	[%r11, 0x0010], %f2
	.word 0xcdba987f  ! 369: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 370: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdf2a01f  ! 371: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba981f  ! 372: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 373: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc322801f  ! 374: STF_R	st	%f1, [%r31, %r10]
	.word 0xc9ba981f  ! 375: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc892d13f  ! 376: LDUHA_R	lduha	[%r11, %r31] 0x89, %r4
	.word 0xd1f2a01f  ! 377: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc902a018  ! 378: LDF_I	ld	[%r10, 0x0018], %f4
	.word 0xd03a801f  ! 379: STD_R	std	%r8, [%r10 + %r31]
	.word 0xcf22c01f  ! 380: STF_R	st	%f7, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3ba99bf  ! 381: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba999f  ! 382: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd0d2a052  ! 383: LDSHA_I	ldsha	[%r10, + 0x0052] %asi, %r8
	.word 0xc2d2913f  ! 384: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r1
	.word 0xc24a801f  ! 385: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7ba995f  ! 386: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcc8aa066  ! 387: LDUBA_I	lduba	[%r10, + 0x0066] %asi, %r6
	.word 0xc7ba981f  ! 388: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 389: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc482a048  ! 390: LDUWA_I	lduwa	[%r10, + 0x0048] %asi, %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc03ac01f  ! 391: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc65ac01f  ! 392: LDX_R	ldx	[%r11 + %r31], %r3
	.word 0xc03ac01f  ! 393: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad81f  ! 394: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd2da901f  ! 395: LDXA_R	ldxa	[%r10, %r31] 0x80, %r9
TH_LABEL395:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcff2a01f  ! 396: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc2c2915f  ! 397: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r1
	.word 0xc8caa005  ! 398: LDSBA_I	ldsba	[%r10, + 0x0005] %asi, %r4
	.word 0xc9bad8bf  ! 399: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 400: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd242a010  ! 401: LDSW_I	ldsw	[%r10 + 0x0010], %r9
	.word 0xc882a078  ! 402: LDUWA_I	lduwa	[%r10, + 0x0078] %asi, %r4
	.word 0xc7e2d01f  ! 403: CASA_I	casa	[%r11] 0x80, %r31, %r3
	.word 0xc7f2e01f  ! 404: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xca0a801f  ! 405: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdf2d13f  ! 406: CASXA_I	casxa	[%r11] 0x89, %r31, %r6
	.word 0xcdbad85f  ! 407: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd252c01f  ! 408: LDSH_R	ldsh	[%r11 + %r31], %r9
	.word 0xcad2a040  ! 409: LDSHA_I	ldsha	[%r10, + 0x0040] %asi, %r5
	.word 0xcdf2e01f  ! 410: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdf2d01f  ! 411: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad95f  ! 412: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad87f  ! 413: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd052801f  ! 414: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xca5aa058  ! 415: LDX_I	ldx	[%r10 + 0x0058], %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5ba98bf  ! 416: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc852a02c  ! 417: LDSH_I	ldsh	[%r10 + 0x002c], %r4
	.word 0xc682903f  ! 418: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r3
	.word 0xcfbad87f  ! 419: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xce0a801f  ! 420: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfba993f  ! 421: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 422: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba989f  ! 423: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba999f  ! 424: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd012c01f  ! 425: LDUH_R	lduh	[%r11 + %r31], %r8
TH_LABEL425:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd0c2901f  ! 426: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r8
	.word 0xcf02a018  ! 427: LDF_I	ld	[%r10, 0x0018], %f7
	.word 0xcbbae010  ! 428: STDFA_I	stda	%f5, [0x0010, %r11]
	.word 0xc3ba991f  ! 429: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 430: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xca8aa02e  ! 431: LDUBA_I	lduba	[%r10, + 0x002e] %asi, %r5
	.word 0xcc8aa062  ! 432: LDUBA_I	lduba	[%r10, + 0x0062] %asi, %r6
	.word 0xcc3a801f  ! 433: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba991f  ! 434: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 435: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc9ae040  ! 436: LDDA_I	ldda	[%r11, + 0x0040] %asi, %r6
	.word 0xcf22801f  ! 437: STF_R	st	%f7, [%r31, %r10]
	.word 0xcbf2d01f  ! 438: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xd04a801f  ! 439: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xd1f2901f  ! 440: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1ba99bf  ! 441: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba985f  ! 442: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2901f  ! 443: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba997f  ! 444: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa048  ! 445: STD_I	std	%r8, [%r10 + 0x0048]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc4d2901f  ! 446: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r2
	.word 0xcbbad81f  ! 447: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xce0ae063  ! 448: LDUB_I	ldub	[%r11 + 0x0063], %r7
	.word 0xc9f2911f  ! 449: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba999f  ! 450: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL450:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9ba999f  ! 451: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 452: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 453: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc702e040  ! 454: LDF_I	ld	[%r11, 0x0040], %f3
	.word 0xd3ba995f  ! 455: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc492d13f  ! 456: LDUHA_R	lduha	[%r11, %r31] 0x89, %r2
	.word 0xc8caa051  ! 457: LDSBA_I	ldsba	[%r10, + 0x0051] %asi, %r4
	.word 0xc3ba99bf  ! 458: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xca5ac01f  ! 459: LDX_R	ldx	[%r11 + %r31], %r5
	.word 0xc492901f  ! 460: LDUHA_R	lduha	[%r10, %r31] 0x80, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc502801f  ! 461: LDF_R	ld	[%r10, %r31], %f2
	.word 0xd3f2a01f  ! 462: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba997f  ! 463: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba983f  ! 464: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcdbaa010  ! 465: STDFA_I	stda	%f6, [0x0010, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbbad91f  ! 466: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad81f  ! 467: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d01f  ! 468: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xc692a026  ! 469: LDUHA_I	lduha	[%r10, + 0x0026] %asi, %r3
	.word 0xd03aa008  ! 470: STD_I	std	%r8, [%r10 + 0x0008]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3ba997f  ! 471: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 472: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba991f  ! 473: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 474: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc3bae048  ! 475: STDFA_I	stda	%f1, [0x0048, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbe2d01f  ! 476: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xc9baa060  ! 477: STDFA_I	stda	%f4, [0x0060, %r10]
	.word 0xd3ba991f  ! 478: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba995f  ! 479: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd20ae068  ! 480: LDUB_I	ldub	[%r11 + 0x0068], %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc59aa010  ! 481: LDDFA_I	ldda	[%r10, 0x0010], %f2
	.word 0xc9bad81f  ! 482: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd302801f  ! 483: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc9bad95f  ! 484: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d01f  ! 485: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcb9aa028  ! 486: LDDFA_I	ldda	[%r10, 0x0028], %f5
	.word 0xd08a905f  ! 487: LDUBA_R	lduba	[%r10, %r31] 0x82, %r8
	.word 0xd2c2e024  ! 488: LDSWA_I	ldswa	[%r11, + 0x0024] %asi, %r9
	.word 0xc7ba98bf  ! 489: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 490: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd00ac01f  ! 491: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xcbba987f  ! 492: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcc12801f  ! 493: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xcc1ac01f  ! 494: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xc48aa02a  ! 495: LDUBA_I	lduba	[%r10, + 0x002a] %asi, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3f2a01f  ! 496: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba98bf  ! 497: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 498: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3e2901f  ! 499: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba997f  ! 500: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3f2a01f  ! 501: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba98bf  ! 502: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2913f  ! 503: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba981f  ! 504: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd252c01f  ! 505: LDSH_R	ldsh	[%r11 + %r31], %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcde2a01f  ! 506: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcc3a801f  ! 507: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc302801f  ! 508: LDF_R	ld	[%r10, %r31], %f1
	.word 0xcc02801f  ! 509: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xc812c01f  ! 510: LDUH_R	lduh	[%r11 + %r31], %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7e2903f  ! 511: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba983f  ! 512: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa000  ! 513: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc7f2903f  ! 514: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba981f  ! 515: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7f2911f  ! 516: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xc09aa008  ! 517: LDDA_I	ldda	[%r10, + 0x0008] %asi, %r0
	.word 0xc40aa067  ! 518: LDUB_I	ldub	[%r10 + 0x0067], %r2
	.word 0xd19aa010  ! 519: LDDFA_I	ldda	[%r10, 0x0010], %f8
	.word 0xcfba997f  ! 520: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xca52a02c  ! 521: LDSH_I	ldsh	[%r10 + 0x002c], %r5
	.word 0xca12e024  ! 522: LDUH_I	lduh	[%r11 + 0x0024], %r5
	.word 0xd2da917f  ! 523: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r9
	.word 0xcfba989f  ! 524: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 525: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcb02801f  ! 526: LDF_R	ld	[%r10, %r31], %f5
	.word 0xca4ac01f  ! 527: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xd3ba989f  ! 528: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd252c01f  ! 529: LDSH_R	ldsh	[%r11 + %r31], %r9
	.word 0xd1e2d13f  ! 530: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd09aa050  ! 531: LDDA_I	ldda	[%r10, + 0x0050] %asi, %r8
	.word 0xc5ba985f  ! 532: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc692913f  ! 533: LDUHA_R	lduha	[%r10, %r31] 0x89, %r3
	.word 0xc9bad81f  ! 534: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad85f  ! 535: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd39aa030  ! 536: LDDFA_I	ldda	[%r10, 0x0030], %f9
	.word 0xcbba985f  ! 537: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba993f  ! 538: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xca0aa01a  ! 539: LDUB_I	ldub	[%r10 + 0x001a], %r5
	.word 0xc8da905f  ! 540: LDXA_R	ldxa	[%r10, %r31] 0x82, %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfbad83f  ! 541: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc6d2a030  ! 542: LDSHA_I	ldsha	[%r10, + 0x0030] %asi, %r3
	.word 0xc99aa000  ! 543: LDDFA_I	ldda	[%r10, 0x0000], %f4
	.word 0xc502801f  ! 544: LDF_R	ld	[%r10, %r31], %f2
	.word 0xd212c01f  ! 545: LDUH_R	lduh	[%r11 + %r31], %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfbad81f  ! 546: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 547: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xd01a801f  ! 548: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xc722801f  ! 549: STF_R	st	%f3, [%r31, %r10]
	.word 0xc9ba985f  ! 550: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9e2901f  ! 551: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xcd9aa010  ! 552: LDDFA_I	ldda	[%r10, 0x0010], %f6
	.word 0xc39aa010  ! 553: LDDFA_I	ldda	[%r10, 0x0010], %f1
	.word 0xcbba987f  ! 554: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 555: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc292e00c  ! 556: LDUHA_I	lduha	[%r11, + 0x000c] %asi, %r1
	.word 0xc5e2913f  ! 557: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5ba983f  ! 558: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 559: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 560: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1baa060  ! 561: STDFA_I	stda	%f8, [0x0060, %r10]
	.word 0xc9ba98bf  ! 562: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa000  ! 563: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xc9ba981f  ! 564: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcac2e040  ! 565: LDSWA_I	ldswa	[%r11, + 0x0040] %asi, %r5
TH_LABEL565:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc412c01f  ! 566: LDUH_R	lduh	[%r11 + %r31], %r2
	.word 0xc7ba99bf  ! 567: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa048  ! 568: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc7ba993f  ! 569: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 570: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7e2903f  ! 571: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba98bf  ! 572: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcd02a050  ! 573: LDF_I	ld	[%r10, 0x0050], %f6
	.word 0xc9ba99bf  ! 574: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 575: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9e2a01f  ! 576: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xca92a06c  ! 577: LDUHA_I	lduha	[%r10, + 0x006c] %asi, %r5
	.word 0xc9e2913f  ! 578: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba981f  ! 579: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc5baa018  ! 580: STDFA_I	stda	%f2, [0x0018, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc612801f  ! 581: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xc3bad95f  ! 582: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad83f  ! 583: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad87f  ! 584: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad81f  ! 585: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xce92917f  ! 586: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r7
	.word 0xd3bad81f  ! 587: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc8d2e010  ! 588: LDSHA_I	ldsha	[%r11, + 0x0010] %asi, %r4
	.word 0xd002a064  ! 589: LDUW_I	lduw	[%r10 + 0x0064], %r8
	.word 0xc3e2e01f  ! 590: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3bad9bf  ! 591: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc81ae008  ! 592: LDD_I	ldd	[%r11 + 0x0008], %r4
	.word 0xc3bad9bf  ! 593: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc522c01f  ! 594: STF_R	st	%f2, [%r31, %r11]
	.word 0xd04ac01f  ! 595: LDSB_R	ldsb	[%r11 + %r31], %r8
TH_LABEL595:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc43ae060  ! 596: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xcc5ac01f  ! 597: LDX_R	ldx	[%r11 + %r31], %r6
	.word 0xc6daa000  ! 598: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r3
	.word 0xd39aa010  ! 599: LDDFA_I	ldda	[%r10, 0x0010], %f9
	.word 0xd012a02a  ! 600: LDUH_I	lduh	[%r10 + 0x002a], %r8
TH_LABEL600:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdbad89f  ! 601: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc412801f  ! 602: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xcc0ac01f  ! 603: LDUB_R	ldub	[%r11 + %r31], %r6
	.word 0xd1ba991f  ! 604: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca82903f  ! 605: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5ba999f  ! 606: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 607: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc81a801f  ! 608: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc722801f  ! 609: STF_R	st	%f3, [%r31, %r10]
	.word 0xd1e2d11f  ! 610: CASA_I	casa	[%r11] 0x88, %r31, %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc1aa060  ! 611: LDD_I	ldd	[%r10 + 0x0060], %r6
	.word 0xc83a801f  ! 612: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba981f  ! 613: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba997f  ! 614: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc68a903f  ! 615: LDUBA_R	lduba	[%r10, %r31] 0x81, %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbbad95f  ! 616: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ac01f  ! 617: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad89f  ! 618: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d11f  ! 619: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xc252a01a  ! 620: LDSH_I	ldsh	[%r10 + 0x001a], %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd0d2d07f  ! 621: LDSHA_R	ldsha	[%r11, %r31] 0x83, %r8
	.word 0xcc1aa038  ! 622: LDD_I	ldd	[%r10 + 0x0038], %r6
	.word 0xcbba981f  ! 623: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2901f  ! 624: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xc89aa078  ! 625: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc5ac01f  ! 626: LDX_R	ldx	[%r11 + %r31], %r6
	.word 0xc5f2a01f  ! 627: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5f2901f  ! 628: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5e2911f  ! 629: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc492a012  ! 630: LDUHA_I	lduha	[%r10, + 0x0012] %asi, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd2ca915f  ! 631: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r9
	.word 0xc8ca911f  ! 632: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r4
	.word 0xcac2903f  ! 633: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r5
	.word 0xcf02801f  ! 634: LDF_R	ld	[%r10, %r31], %f7
	.word 0xd08aa017  ! 635: LDUBA_I	lduba	[%r10, + 0x0017] %asi, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc3ae040  ! 636: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xcdbad83f  ! 637: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad91f  ! 638: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad83f  ! 639: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdf2e01f  ! 640: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc3ae040  ! 641: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xc80aa002  ! 642: LDUB_I	ldub	[%r10 + 0x0002], %r4
	.word 0xc43aa030  ! 643: STD_I	std	%r2, [%r10 + 0x0030]
	.word 0xc442801f  ! 644: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xc2caa020  ! 645: LDSBA_I	ldsba	[%r10, + 0x0020] %asi, %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd19ae048  ! 646: LDDFA_I	ldda	[%r11, 0x0048], %f8
	.word 0xd1bad91f  ! 647: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 648: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcada905f  ! 649: LDXA_R	ldxa	[%r10, %r31] 0x82, %r5
	.word 0xca42c01f  ! 650: LDSW_R	ldsw	[%r11 + %r31], %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3e2913f  ! 651: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd3e2a01f  ! 652: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba985f  ! 653: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2911f  ! 654: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xc64ac01f  ! 655: LDSB_R	ldsb	[%r11 + %r31], %r3
TH_LABEL655:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcec2915f  ! 656: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r7
	.word 0xcc3ac01f  ! 657: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcde2e01f  ! 658: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdbad87f  ! 659: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd292903f  ! 660: LDUHA_R	lduha	[%r10, %r31] 0x81, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1ba981f  ! 661: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd292901f  ! 662: LDUHA_R	lduha	[%r10, %r31] 0x80, %r9
	.word 0xc7bad81f  ! 663: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc60aa038  ! 664: LDUB_I	ldub	[%r10 + 0x0038], %r3
	.word 0xd212a072  ! 665: LDUH_I	lduh	[%r10 + 0x0072], %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc0a801f  ! 666: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xc9ba985f  ! 667: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc28ad05f  ! 668: LDUBA_R	lduba	[%r11, %r31] 0x82, %r1
	.word 0xc282901f  ! 669: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r1
	.word 0xc83aa070  ! 670: STD_I	std	%r4, [%r10 + 0x0070]
TH_LABEL670:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbf2911f  ! 671: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xcbba999f  ! 672: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa070  ! 673: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xcbba98bf  ! 674: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2911f  ! 675: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc99ae078  ! 676: LDDFA_I	ldda	[%r11, 0x0078], %f4
	.word 0xc5bad93f  ! 677: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ac01f  ! 678: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad85f  ! 679: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2e01f  ! 680: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5f2e01f  ! 681: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad9bf  ! 682: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc89ae030  ! 683: LDDA_I	ldda	[%r11, + 0x0030] %asi, %r4
	.word 0xc43ac01f  ! 684: STD_R	std	%r2, [%r11 + %r31]
	.word 0xd08ad01f  ! 685: LDUBA_R	lduba	[%r11, %r31] 0x80, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc4cad03f  ! 686: LDSBA_R	ldsba	[%r11, %r31] 0x81, %r2
	.word 0xcc4ae064  ! 687: LDSB_I	ldsb	[%r11 + 0x0064], %r6
	.word 0xcbba985f  ! 688: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc9bae030  ! 689: STDFA_I	stda	%f4, [0x0030, %r11]
	.word 0xcbf2903f  ! 690: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbe2911f  ! 691: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xcbe2913f  ! 692: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xcbe2a01f  ! 693: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc2daa040  ! 694: LDXA_I	ldxa	[%r10, + 0x0040] %asi, %r1
	.word 0xc8ca917f  ! 695: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc842801f  ! 696: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xc9e2d03f  ! 697: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xc9bad85f  ! 698: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d03f  ! 699: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xc9bad81f  ! 700: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9bad83f  ! 701: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc85ac01f  ! 702: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xd1f2a01f  ! 703: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xcedaa010  ! 704: LDXA_I	ldxa	[%r10, + 0x0010] %asi, %r7
	.word 0xcf02801f  ! 705: LDF_R	ld	[%r10, %r31], %f7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc1aa040  ! 706: LDD_I	ldd	[%r10 + 0x0040], %r6
	.word 0xcdf2a01f  ! 707: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd0da911f  ! 708: LDXA_R	ldxa	[%r10, %r31] 0x88, %r8
	.word 0xc43ac01f  ! 709: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae060  ! 710: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7bad91f  ! 711: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2d01f  ! 712: CASA_I	casa	[%r11] 0x80, %r31, %r3
	.word 0xc7bad9bf  ! 713: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae060  ! 714: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xd212801f  ! 715: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdf2913f  ! 716: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xd252e012  ! 717: LDSH_I	ldsh	[%r11 + 0x0012], %r9
	.word 0xcbba987f  ! 718: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd252801f  ! 719: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xcfe2a01f  ! 720: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc52801f  ! 721: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xcfbad83f  ! 722: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc85a801f  ! 723: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xc9ba981f  ! 724: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc922801f  ! 725: STF_R	st	%f4, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3ba99bf  ! 726: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd01a801f  ! 727: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xcfba981f  ! 728: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc60aa038  ! 729: LDUB_I	ldub	[%r10 + 0x0038], %r3
	.word 0xd03ae070  ! 730: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc79aa018  ! 731: LDDFA_I	ldda	[%r10, 0x0018], %f3
	.word 0xccdae050  ! 732: LDXA_I	ldxa	[%r11, + 0x0050] %asi, %r6
	.word 0xc83ac01f  ! 733: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc09aa020  ! 734: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r0
	.word 0xc9e2901f  ! 735: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9ba997f  ! 736: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba997f  ! 737: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa078  ! 738: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xd39ae018  ! 739: LDDFA_I	ldda	[%r11, 0x0018], %f9
	.word 0xd1ba981f  ! 740: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5baa038  ! 741: STDFA_I	stda	%f2, [0x0038, %r10]
	.word 0xcbba999f  ! 742: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba98bf  ! 743: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2903f  ! 744: CASA_I	casa	[%r10] 0x81, %r31, %r5
	.word 0xcbf2911f  ! 745: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc83a801f  ! 746: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba983f  ! 747: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd242801f  ! 748: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xcff2e01f  ! 749: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xd2cae006  ! 750: LDSBA_I	ldsba	[%r11, + 0x0006] %asi, %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3e2903f  ! 751: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba997f  ! 752: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba983f  ! 753: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa058  ! 754: STD_I	std	%r0, [%r10 + 0x0058]
	.word 0xc3e2913f  ! 755: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc20a801f  ! 756: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xc2dae070  ! 757: LDXA_I	ldxa	[%r11, + 0x0070] %asi, %r1
	.word 0xce82901f  ! 758: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r7
	.word 0xcfba981f  ! 759: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc502801f  ! 760: LDF_R	ld	[%r10, %r31], %f2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc282913f  ! 761: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r1
	.word 0xc642c01f  ! 762: LDSW_R	ldsw	[%r11 + %r31], %r3
	.word 0xc3ba989f  ! 763: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc502801f  ! 764: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc322c01f  ! 765: STF_R	st	%f1, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcac2a054  ! 766: LDSWA_I	ldswa	[%r10, + 0x0054] %asi, %r5
	.word 0xc83a801f  ! 767: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba993f  ! 768: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 769: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba987f  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc83aa038  ! 771: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xc9f2a01f  ! 772: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba99bf  ! 773: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc502801f  ! 774: LDF_R	ld	[%r10, %r31], %f2
	.word 0xd3ba987f  ! 775: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc502a034  ! 776: LDF_I	ld	[%r10, 0x0034], %f2
	.word 0xc292d07f  ! 777: LDUHA_R	lduha	[%r11, %r31] 0x83, %r1
	.word 0xc502a054  ! 778: LDF_I	ld	[%r10, 0x0054], %f2
	.word 0xc452801f  ! 779: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xc3ba99bf  ! 780: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd2c2e040  ! 781: LDSWA_I	ldswa	[%r11, + 0x0040] %asi, %r9
	.word 0xc5e2911f  ! 782: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5ba98bf  ! 783: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2911f  ! 784: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc43aa018  ! 785: STD_I	std	%r2, [%r10 + 0x0018]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc41aa070  ! 786: LDD_I	ldd	[%r10 + 0x0070], %r2
	.word 0xd03ae050  ! 787: STD_I	std	%r8, [%r11 + 0x0050]
	.word 0xcd9aa068  ! 788: LDDFA_I	ldda	[%r10, 0x0068], %f6
	.word 0xd1ba995f  ! 789: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xce5ac01f  ! 790: LDX_R	ldx	[%r11 + %r31], %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3ba993f  ! 791: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc48ad07f  ! 792: LDUBA_R	lduba	[%r11, %r31] 0x83, %r2
	.word 0xd3f2a01f  ! 793: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba991f  ! 794: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 795: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc60aa02c  ! 796: LDUB_I	ldub	[%r10 + 0x002c], %r3
	.word 0xd1ba989f  ! 797: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2901f  ! 798: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba983f  ! 799: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba98bf  ! 800: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc402e07c  ! 801: LDUW_I	lduw	[%r11 + 0x007c], %r2
	.word 0xc9ba999f  ! 802: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xca82901f  ! 803: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r5
	.word 0xc01aa058  ! 804: LDD_I	ldd	[%r10 + 0x0058], %r0
	.word 0xcc3a801f  ! 805: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc3a801f  ! 806: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2911f  ! 807: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcdba983f  ! 808: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba98bf  ! 809: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 810: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc3a801f  ! 811: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba985f  ! 812: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa010  ! 813: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcc3aa010  ! 814: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xd122801f  ! 815: STF_R	st	%f8, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9ba987f  ! 816: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcd9aa068  ! 817: LDDFA_I	ldda	[%r10, 0x0068], %f6
	.word 0xcdbad8bf  ! 818: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad8bf  ! 819: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2e01f  ! 820: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcde2d13f  ! 821: CASA_I	casa	[%r11] 0x89, %r31, %r6
	.word 0xcd02801f  ! 822: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc83a801f  ! 823: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd0ca907f  ! 824: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r8
	.word 0xc9bad85f  ! 825: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc83ac01f  ! 826: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc922801f  ! 827: STF_R	st	%f4, [%r31, %r10]
	.word 0xcdba999f  ! 828: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd0c2901f  ! 829: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r8
	.word 0xc9bad9bf  ! 830: STDFA_R	stda	%f4, [%r31, %r11]
TH_LABEL830:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xce52a024  ! 831: LDSH_I	ldsh	[%r10 + 0x0024], %r7
	.word 0xd1baa058  ! 832: STDFA_I	stda	%f8, [0x0058, %r10]
	.word 0xcbe2a01f  ! 833: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbe2a01f  ! 834: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc502e01c  ! 835: LDF_I	ld	[%r11, 0x001c], %f2
TH_LABEL835:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3ba981f  ! 836: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc612a074  ! 837: LDUH_I	lduh	[%r10 + 0x0074], %r3
	.word 0xcc9ae058  ! 838: LDDA_I	ldda	[%r11, + 0x0058] %asi, %r6
	.word 0xd3bad81f  ! 839: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae000  ! 840: STD_I	std	%r8, [%r11 + 0x0000]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3bad91f  ! 841: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 842: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xcdbaa000  ! 843: STDFA_I	stda	%f6, [0x0000, %r10]
	.word 0xc83ac01f  ! 844: STD_R	std	%r4, [%r11 + %r31]
	.word 0xccd2905f  ! 845: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcedaa038  ! 846: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r7
	.word 0xd03ae048  ! 847: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xd3f2e01f  ! 848: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2d13f  ! 849: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd3f2e01f  ! 850: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc602801f  ! 851: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xc3ba997f  ! 852: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 853: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2901f  ! 854: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba983f  ! 855: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc39ae048  ! 856: LDDFA_I	ldda	[%r11, 0x0048], %f1
	.word 0xcfba985f  ! 857: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc52a010  ! 858: LDSH_I	ldsh	[%r10 + 0x0010], %r6
	.word 0xcec2911f  ! 859: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r7
	.word 0xc902a074  ! 860: LDF_I	ld	[%r10, 0x0074], %f4
TH_LABEL860:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdba98bf  ! 861: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcb9ae050  ! 862: LDDFA_I	ldda	[%r11, 0x0050], %f5
	.word 0xcfe2a01f  ! 863: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba985f  ! 864: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 865: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc3aa020  ! 866: STD_I	std	%r6, [%r10 + 0x0020]
	.word 0xcfe2a01f  ! 867: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc722801f  ! 868: STF_R	st	%f3, [%r31, %r10]
	.word 0xc322801f  ! 869: STF_R	st	%f1, [%r31, %r10]
	.word 0xc5f2d13f  ! 870: CASXA_I	casxa	[%r11] 0x89, %r31, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5e2d03f  ! 871: CASA_I	casa	[%r11] 0x81, %r31, %r2
	.word 0xc43ac01f  ! 872: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad99f  ! 873: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc85aa060  ! 874: LDX_I	ldx	[%r10 + 0x0060], %r4
	.word 0xc9baa068  ! 875: STDFA_I	stda	%f4, [0x0068, %r10]
TH_LABEL875:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc8aa05f  ! 876: LDUBA_I	lduba	[%r10, + 0x005f] %asi, %r6
	.word 0xc5bad93f  ! 877: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcb9ae010  ! 878: LDDFA_I	ldda	[%r11, 0x0010], %f5
	.word 0xcdf2d01f  ! 879: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xc2d2e076  ! 880: LDSHA_I	ldsha	[%r11, + 0x0076] %asi, %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5f2903f  ! 881: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xc5f2a01f  ! 882: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba981f  ! 883: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba983f  ! 884: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd19aa040  ! 885: LDDFA_I	ldda	[%r10, 0x0040], %f8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd302a004  ! 886: LDF_I	ld	[%r10, 0x0004], %f9
	.word 0xc3f2e01f  ! 887: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3f2e01f  ! 888: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad95f  ! 889: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc652801f  ! 890: LDSH_R	ldsh	[%r10 + %r31], %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc2d2901f  ! 891: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r1
	.word 0xd1ba987f  ! 892: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 893: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 894: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba987f  ! 895: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd03aa028  ! 896: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd1ba997f  ! 897: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 898: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc302c01f  ! 899: LDF_R	ld	[%r11, %r31], %f1
	.word 0xd302a004  ! 900: LDF_I	ld	[%r10, 0x0004], %f9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdbae028  ! 901: STDFA_I	stda	%f6, [0x0028, %r11]
	.word 0xce52a058  ! 902: LDSH_I	ldsh	[%r10 + 0x0058], %r7
	.word 0xc612801f  ! 903: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xd082e014  ! 904: LDUWA_I	lduwa	[%r11, + 0x0014] %asi, %r8
	.word 0xd39ae070  ! 905: LDDFA_I	ldda	[%r11, 0x0070], %f9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7f2d03f  ! 906: CASXA_I	casxa	[%r11] 0x81, %r31, %r3
	.word 0xd102801f  ! 907: LDF_R	ld	[%r10, %r31], %f8
	.word 0xce4aa01c  ! 908: LDSB_I	ldsb	[%r10 + 0x001c], %r7
	.word 0xce4ae02c  ! 909: LDSB_I	ldsb	[%r11 + 0x002c], %r7
	.word 0xc83aa008  ! 910: STD_I	std	%r4, [%r10 + 0x0008]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcd02a070  ! 911: LDF_I	ld	[%r10, 0x0070], %f6
	.word 0xcd02a00c  ! 912: LDF_I	ld	[%r10, 0x000c], %f6
	.word 0xc3e2a01f  ! 913: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3f2901f  ! 914: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3f2a01f  ! 915: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3ba995f  ! 916: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 917: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xcc02c01f  ! 918: LDUW_R	lduw	[%r11 + %r31], %r6
	.word 0xcb9ae038  ! 919: LDDFA_I	ldda	[%r11, 0x0038], %f5
	.word 0xd2d2903f  ! 920: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03aa010  ! 921: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1e2913f  ! 922: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xd1ba989f  ! 923: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2901f  ! 924: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd03aa010  ! 925: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc52c01f  ! 926: LDSH_R	ldsh	[%r11 + %r31], %r6
	.word 0xc3e2e01f  ! 927: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xd2c2a060  ! 928: LDSWA_I	ldswa	[%r10, + 0x0060] %asi, %r9
	.word 0xc7bad8bf  ! 929: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd0c2903f  ! 930: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r8
TH_LABEL930:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfbae070  ! 931: STDFA_I	stda	%f7, [0x0070, %r11]
	.word 0xcde2a01f  ! 932: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2901f  ! 933: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba987f  ! 934: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa070  ! 935: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc3aa070  ! 936: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcfbaa008  ! 937: STDFA_I	stda	%f7, [0x0008, %r10]
	.word 0xc6ca913f  ! 938: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r3
	.word 0xcb9aa060  ! 939: LDDFA_I	ldda	[%r10, 0x0060], %f5
	.word 0xc692907f  ! 940: LDUHA_R	lduha	[%r10, %r31] 0x83, %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5bae040  ! 941: STDFA_I	stda	%f2, [0x0040, %r11]
	.word 0xd002c01f  ! 942: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xd1ba991f  ! 943: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 944: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba999f  ! 945: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1ba991f  ! 946: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2901f  ! 947: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd0c2917f  ! 948: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r8
	.word 0xc702801f  ! 949: LDF_R	ld	[%r10, %r31], %f3
	.word 0xd3e2901f  ! 950: CASA_I	casa	[%r10] 0x80, %r31, %r9
TH_LABEL950:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc6d2a014  ! 951: LDSHA_I	ldsha	[%r10, + 0x0014] %asi, %r3
	.word 0xc43ae028  ! 952: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc43ac01f  ! 953: STD_R	std	%r2, [%r11 + %r31]
	.word 0xd302a000  ! 954: LDF_I	ld	[%r10, 0x0000], %f9
	.word 0xcfbae008  ! 955: STDFA_I	stda	%f7, [0x0008, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc892d03f  ! 956: LDUHA_R	lduha	[%r11, %r31] 0x81, %r4
	.word 0xc3ba999f  ! 957: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa008  ! 958: STD_I	std	%r0, [%r10 + 0x0008]
	.word 0xc9baa018  ! 959: STDFA_I	stda	%f4, [0x0018, %r10]
	.word 0xcfba999f  ! 960: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd20aa05c  ! 961: LDUB_I	ldub	[%r10 + 0x005c], %r9
	.word 0xd25aa040  ! 962: LDX_I	ldx	[%r10 + 0x0040], %r9
	.word 0xcbbad9bf  ! 963: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd002c01f  ! 964: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xd1ba991f  ! 965: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd03aa030  ! 966: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xd1ba989f  ! 967: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcb02a004  ! 968: LDF_I	ld	[%r10, 0x0004], %f5
	.word 0xc3bad85f  ! 969: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad87f  ! 970: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc39aa038  ! 971: LDDFA_I	ldda	[%r10, 0x0038], %f1
	.word 0xd3ba985f  ! 972: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 973: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xc8ca901f  ! 974: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r4
	.word 0xc81aa040  ! 975: LDD_I	ldd	[%r10 + 0x0040], %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc6c2911f  ! 976: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r3
	.word 0xc442a060  ! 977: LDSW_I	ldsw	[%r10 + 0x0060], %r2
	.word 0xd0c2d05f  ! 978: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r8
	.word 0xd0da915f  ! 979: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r8
	.word 0xcc3aa030  ! 980: STD_I	std	%r6, [%r10 + 0x0030]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc3aa030  ! 981: STD_I	std	%r6, [%r10 + 0x0030]
	.word 0xcc4ac01f  ! 982: LDSB_R	ldsb	[%r11 + %r31], %r6
	.word 0xc7e2901f  ! 983: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xca0aa05d  ! 984: LDUB_I	ldub	[%r10 + 0x005d], %r5
	.word 0xd00aa01e  ! 985: LDUB_I	ldub	[%r10 + 0x001e], %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7f2a01f  ! 986: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba999f  ! 987: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcc8aa02c  ! 988: LDUBA_I	lduba	[%r10, + 0x002c] %asi, %r6
	.word 0xd102a078  ! 989: LDF_I	ld	[%r10, 0x0078], %f8
	.word 0xcff2a01f  ! 990: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc3a801f  ! 991: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba987f  ! 992: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc64aa056  ! 993: LDSB_I	ldsb	[%r10 + 0x0056], %r3
	.word 0xc9bad81f  ! 994: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad99f  ! 995: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcf9aa048  ! 996: LDDFA_I	ldda	[%r10, 0x0048], %f7
	.word 0xc4c2a048  ! 997: LDSWA_I	ldswa	[%r10, + 0x0048] %asi, %r2
	.word 0xcfbad87f  ! 998: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcbbae040  ! 999: STDFA_I	stda	%f5, [0x0040, %r11]
	.word 0xc03a801f  ! 1000: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	subcc %r30, 1, %r30
	bnz  TH4_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	add	%g0,	0x1,	%r30
TH3_LOOP_START:
	.word 0xc5ba99bf  ! 1: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc282e008  ! 2: LDUWA_I	lduwa	[%r11, + 0x0008] %asi, %r1
	.word 0xcc02e044  ! 3: LDUW_I	lduw	[%r11 + 0x0044], %r6
	.word 0xd05ac01f  ! 4: LDX_R	ldx	[%r11 + %r31], %r8
	.word 0xcde2e01f  ! 5: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdbad93f  ! 6: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcad2d11f  ! 7: LDSHA_R	ldsha	[%r11, %r31] 0x88, %r5
	.word 0xc9e2901f  ! 8: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xca42e064  ! 9: LDSW_I	ldsw	[%r11 + 0x0064], %r5
	.word 0xce8aa034  ! 10: LDUBA_I	lduba	[%r10, + 0x0034] %asi, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc49ae018  ! 11: LDDA_I	ldda	[%r11, + 0x0018] %asi, %r2
	.word 0xcf02a060  ! 12: LDF_I	ld	[%r10, 0x0060], %f7
	.word 0xc3ba99bf  ! 13: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 14: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba985f  ! 15: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL15:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc6caa048  ! 16: LDSBA_I	ldsba	[%r10, + 0x0048] %asi, %r3
	.word 0xd08aa059  ! 17: LDUBA_I	lduba	[%r10, + 0x0059] %asi, %r8
	.word 0xcdf2a01f  ! 18: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2913f  ! 19: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcdba98bf  ! 20: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL20:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdba995f  ! 21: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 22: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd082d01f  ! 23: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r8
	.word 0xd3ba99bf  ! 24: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 25: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdbaa058  ! 26: STDFA_I	stda	%f6, [0x0058, %r10]
	.word 0xd1e2e01f  ! 27: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xc722c01f  ! 28: STF_R	st	%f3, [%r31, %r11]
	.word 0xc9bad81f  ! 29: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad99f  ! 30: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9e2e01f  ! 31: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xd3baa048  ! 32: STDFA_I	stda	%f9, [0x0048, %r10]
	.word 0xcdba991f  ! 33: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 34: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba993f  ! 35: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc3aa028  ! 36: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xcc3a801f  ! 37: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2903f  ! 38: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xcdba99bf  ! 39: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 40: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
TH_LABEL40:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc1aa060  ! 41: LDD_I	ldd	[%r10 + 0x0060], %r6
	.word 0xc5f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2a01f  ! 43: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5baa058  ! 44: STDFA_I	stda	%f2, [0x0058, %r10]
	.word 0xcbe2e01f  ! 45: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcada903f  ! 46: LDXA_R	ldxa	[%r10, %r31] 0x81, %r5
	.word 0xd1ba993f  ! 47: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 48: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1f2a01f  ! 49: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba987f  ! 50: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfbaa050  ! 51: STDFA_I	stda	%f7, [0x0050, %r10]
	.word 0xc28ae043  ! 52: LDUBA_I	lduba	[%r11, + 0x0043] %asi, %r1
	.word 0xc48a907f  ! 53: LDUBA_R	lduba	[%r10, %r31] 0x83, %r2
	.word 0xcf9aa060  ! 54: LDDFA_I	ldda	[%r10, 0x0060], %f7
	.word 0xc03ac01f  ! 55: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc682a010  ! 56: LDUWA_I	lduwa	[%r10, + 0x0010] %asi, %r3
	.word 0xc9bad93f  ! 57: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 58: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc5baa070  ! 59: STDFA_I	stda	%f2, [0x0070, %r10]
	.word 0xd102801f  ! 60: LDF_R	ld	[%r10, %r31], %f8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3ba987f  ! 61: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc2c2901f  ! 62: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r1
	.word 0xce02801f  ! 63: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xc5ba993f  ! 64: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc7baa078  ! 65: STDFA_I	stda	%f3, [0x0078, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1f2e01f  ! 66: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd03ac01f  ! 67: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad93f  ! 68: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae048  ! 69: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xc612c01f  ! 70: LDUH_R	lduh	[%r11 + %r31], %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd242a050  ! 71: LDSW_I	ldsw	[%r10 + 0x0050], %r9
	.word 0xc81a801f  ! 72: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xd012801f  ! 73: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xc9f2e01f  ! 74: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xcd02801f  ! 75: LDF_R	ld	[%r10, %r31], %f6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbba997f  ! 76: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc902801f  ! 77: LDF_R	ld	[%r10, %r31], %f4
	.word 0xcdbaa060  ! 78: STDFA_I	stda	%f6, [0x0060, %r10]
	.word 0xcbbad87f  ! 79: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd122801f  ! 80: STF_R	st	%f8, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc292905f  ! 81: LDUHA_R	lduha	[%r10, %r31] 0x82, %r1
	.word 0xd3bad83f  ! 82: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 83: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad93f  ! 84: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad89f  ! 85: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcf9ae008  ! 86: LDDFA_I	ldda	[%r11, 0x0008], %f7
	.word 0xc3f2d03f  ! 87: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xc3e2d03f  ! 88: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xd282907f  ! 89: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r9
	.word 0xd19ae060  ! 90: LDDFA_I	ldda	[%r11, 0x0060], %f8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc83aa070  ! 91: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xc3baa050  ! 92: STDFA_I	stda	%f1, [0x0050, %r10]
	.word 0xc3ba985f  ! 93: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd3baa020  ! 94: STDFA_I	stda	%f9, [0x0020, %r10]
	.word 0xcc3a801f  ! 95: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc3a801f  ! 96: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 97: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba981f  ! 98: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba989f  ! 99: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc1aa010  ! 100: LDD_I	ldd	[%r10 + 0x0010], %r6
TH_LABEL100:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5bad81f  ! 101: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad9bf  ! 102: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xce4ac01f  ! 103: LDSB_R	ldsb	[%r11 + %r31], %r7
	.word 0xcc52a04a  ! 104: LDSH_I	ldsh	[%r10 + 0x004a], %r6
	.word 0xd3f2e01f  ! 105: CASXA_R	casxa	[%r11]%asi, %r31, %r9
TH_LABEL105:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3f2e01f  ! 106: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xc4da903f  ! 107: LDXA_R	ldxa	[%r10, %r31] 0x81, %r2
	.word 0xcfba993f  ! 108: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba995f  ! 109: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca42e000  ! 110: LDSW_I	ldsw	[%r11 + 0x0000], %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc2dae008  ! 111: LDXA_I	ldxa	[%r11, + 0x0008] %asi, %r1
	.word 0xc7bae060  ! 112: STDFA_I	stda	%f3, [0x0060, %r11]
	.word 0xc9f2901f  ! 113: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xd24a801f  ! 114: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xc9f2901f  ! 115: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
TH_LABEL115:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9e2903f  ! 116: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc9e2911f  ! 117: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba999f  ! 118: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 119: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba991f  ! 120: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL120:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9e2901f  ! 121: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc44ae077  ! 122: LDSB_I	ldsb	[%r11 + 0x0077], %r2
	.word 0xcdbad97f  ! 123: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcedae038  ! 124: LDXA_I	ldxa	[%r11, + 0x0038] %asi, %r7
	.word 0xd03ac01f  ! 125: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1bad81f  ! 126: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad97f  ! 127: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc41aa068  ! 128: LDD_I	ldd	[%r10 + 0x0068], %r2
	.word 0xd3ba989f  ! 129: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba983f  ! 130: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xca02801f  ! 131: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xc3ba993f  ! 132: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc59aa000  ! 133: LDDFA_I	ldda	[%r10, 0x0000], %f2
	.word 0xcfba995f  ! 134: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd3baa028  ! 135: STDFA_I	stda	%f9, [0x0028, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5ba989f  ! 136: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2903f  ! 137: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xd2cad05f  ! 138: LDSBA_R	ldsba	[%r11, %r31] 0x82, %r9
	.word 0xcdf2a01f  ! 139: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba983f  ! 140: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc882a068  ! 141: LDUWA_I	lduwa	[%r10, + 0x0068] %asi, %r4
	.word 0xc2ca907f  ! 142: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r1
	.word 0xc3f2e01f  ! 143: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xd04a801f  ! 144: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xccdae050  ! 145: LDXA_I	ldxa	[%r11, + 0x0050] %asi, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5e2a01f  ! 146: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc902a074  ! 147: LDF_I	ld	[%r10, 0x0074], %f4
	.word 0xc3ba989f  ! 148: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 149: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3e2a01f  ! 150: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc6c2d17f  ! 151: LDSWA_R	ldswa	[%r11, %r31] 0x8b, %r3
	.word 0xc5e2e01f  ! 152: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc202e044  ! 153: LDUW_I	lduw	[%r11 + 0x0044], %r1
	.word 0xc7ba993f  ! 154: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 155: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7ba99bf  ! 156: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 157: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc59ae020  ! 158: LDDFA_I	ldda	[%r11, 0x0020], %f2
	.word 0xc9bae028  ! 159: STDFA_I	stda	%f4, [0x0028, %r11]
	.word 0xc212a036  ! 160: LDUH_I	lduh	[%r10 + 0x0036], %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd0ca917f  ! 161: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r8
	.word 0xc3bad9bf  ! 162: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 163: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3e2e01f  ! 164: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2e01f  ! 165: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc502801f  ! 166: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc692d07f  ! 167: LDUHA_R	lduha	[%r11, %r31] 0x83, %r3
	.word 0xcfbaa068  ! 168: STDFA_I	stda	%f7, [0x0068, %r10]
	.word 0xc41ac01f  ! 169: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xc5e2e01f  ! 170: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcb9aa030  ! 171: LDDFA_I	ldda	[%r10, 0x0030], %f5
	.word 0xd3bad95f  ! 172: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 173: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xcf9ae048  ! 174: LDDFA_I	ldda	[%r11, 0x0048], %f7
	.word 0xcbbad91f  ! 175: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbbad87f  ! 176: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc5bae038  ! 177: STDFA_I	stda	%f2, [0x0038, %r11]
	.word 0xc9ba991f  ! 178: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd242a034  ! 179: LDSW_I	ldsw	[%r10 + 0x0034], %r9
	.word 0xcd22c01f  ! 180: STF_R	st	%f6, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfbad97f  ! 181: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc4d2a020  ! 182: LDSHA_I	ldsha	[%r10, + 0x0020] %asi, %r2
	.word 0xc45aa000  ! 183: LDX_I	ldx	[%r10 + 0x0000], %r2
	.word 0xc4ca907f  ! 184: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r2
	.word 0xc7e2e01f  ! 185: CASA_R	casa	[%r11] %asi, %r31, %r3
TH_LABEL185:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc45a801f  ! 186: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xc3bad83f  ! 187: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc4da911f  ! 188: LDXA_R	ldxa	[%r10, %r31] 0x88, %r2
	.word 0xc3e2903f  ! 189: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc6d2907f  ! 190: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9bad83f  ! 191: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc60aa012  ! 192: LDUB_I	ldub	[%r10 + 0x0012], %r3
	.word 0xcfbad93f  ! 193: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc24a801f  ! 194: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xce5a801f  ! 195: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcf9aa068  ! 196: LDDFA_I	ldda	[%r10, 0x0068], %f7
	.word 0xcfbae048  ! 197: STDFA_I	stda	%f7, [0x0048, %r11]
	.word 0xca5aa030  ! 198: LDX_I	ldx	[%r10 + 0x0030], %r5
	.word 0xd24aa077  ! 199: LDSB_I	ldsb	[%r10 + 0x0077], %r9
	.word 0xc9e2d03f  ! 200: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc45a801f  ! 201: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xc5e2a01f  ! 202: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc3baa040  ! 203: STDFA_I	stda	%f1, [0x0040, %r10]
	.word 0xc5ba999f  ! 204: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcf9aa030  ! 205: LDDFA_I	ldda	[%r10, 0x0030], %f7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc85ae020  ! 206: LDX_I	ldx	[%r11 + 0x0020], %r4
	.word 0xcc1ac01f  ! 207: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xc812801f  ! 208: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xcf02801f  ! 209: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcb9aa050  ! 210: LDDFA_I	ldda	[%r10, 0x0050], %f5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcdba999f  ! 211: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcb02801f  ! 212: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc7bad87f  ! 213: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd052e026  ! 214: LDSH_I	ldsh	[%r11 + 0x0026], %r8
	.word 0xc5f2a01f  ! 215: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5ba987f  ! 216: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 217: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 218: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xca0a801f  ! 219: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xcc5aa040  ! 220: LDX_I	ldx	[%r10 + 0x0040], %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3e2903f  ! 221: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd03a801f  ! 222: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd25a801f  ! 223: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xc5e2a01f  ! 224: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc682915f  ! 225: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc6c2d05f  ! 226: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r3
	.word 0xd3ba997f  ! 227: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 228: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 229: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba985f  ! 230: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd03aa010  ! 231: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd3e2a01f  ! 232: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 233: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba98bf  ! 234: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa010  ! 235: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd03a801f  ! 236: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc6d2d05f  ! 237: LDSHA_R	ldsha	[%r11, %r31] 0x82, %r3
	.word 0xd322801f  ! 238: STF_R	st	%f9, [%r31, %r10]
	.word 0xcfba995f  ! 239: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc702c01f  ! 240: LDF_R	ld	[%r11, %r31], %f3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc43aa010  ! 241: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xc302e06c  ! 242: LDF_I	ld	[%r11, 0x006c], %f1
	.word 0xd102c01f  ! 243: LDF_R	ld	[%r11, %r31], %f8
	.word 0xc28ad13f  ! 244: LDUBA_R	lduba	[%r11, %r31] 0x89, %r1
	.word 0xd03aa038  ! 245: STD_I	std	%r8, [%r10 + 0x0038]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3ba997f  ! 246: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 247: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 248: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xc282d01f  ! 249: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r1
	.word 0xcbba999f  ! 250: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbba999f  ! 251: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa038  ! 252: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xd00aa010  ! 253: LDUB_I	ldub	[%r10 + 0x0010], %r8
	.word 0xd3ba98bf  ! 254: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 255: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3f2a01f  ! 256: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03aa058  ! 257: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3ba997f  ! 258: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd242801f  ! 259: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xcc0ae073  ! 260: LDUB_I	ldub	[%r11 + 0x0073], %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1bad9bf  ! 261: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 262: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad9bf  ! 263: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xccc2915f  ! 264: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r6
	.word 0xc7e2a01f  ! 265: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7ba981f  ! 266: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba983f  ! 267: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba995f  ! 268: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc6ca913f  ! 269: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r3
	.word 0xc79ae060  ! 270: LDDFA_I	ldda	[%r11, 0x0060], %f3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc41aa070  ! 271: LDD_I	ldd	[%r10 + 0x0070], %r2
	.word 0xccd2e01c  ! 272: LDSHA_I	ldsha	[%r11, + 0x001c] %asi, %r6
	.word 0xc43aa058  ! 273: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc5f2a01f  ! 274: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5f2911f  ! 275: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3bae038  ! 276: STDFA_I	stda	%f9, [0x0038, %r11]
	.word 0xc80ac01f  ! 277: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xcc3aa038  ! 278: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcfba985f  ! 279: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba989f  ! 280: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfe2a01f  ! 281: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc81aa010  ! 282: LDD_I	ldd	[%r10 + 0x0010], %r4
	.word 0xcde2d03f  ! 283: CASA_I	casa	[%r11] 0x81, %r31, %r6
	.word 0xcdf2d11f  ! 284: CASXA_I	casxa	[%r11] 0x88, %r31, %r6
	.word 0xc812a01e  ! 285: LDUH_I	lduh	[%r10 + 0x001e], %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcd02a054  ! 286: LDF_I	ld	[%r10, 0x0054], %f6
	.word 0xc5ba985f  ! 287: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2901f  ! 288: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba981f  ! 289: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc4da905f  ! 290: LDXA_R	ldxa	[%r10, %r31] 0x82, %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9ba989f  ! 291: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 292: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xcb9aa028  ! 293: LDDFA_I	ldda	[%r10, 0x0028], %f5
	.word 0xcbf2911f  ! 294: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xcbf2911f  ! 295: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd2d2e042  ! 296: LDSHA_I	ldsha	[%r11, + 0x0042] %asi, %r9
	.word 0xc03ac01f  ! 297: STD_R	std	%r0, [%r11 + %r31]
	.word 0xd202a02c  ! 298: LDUW_I	lduw	[%r10 + 0x002c], %r9
	.word 0xcb9aa030  ! 299: LDDFA_I	ldda	[%r10, 0x0030], %f5
	.word 0xcc3aa040  ! 300: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdba981f  ! 301: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba999f  ! 302: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2911f  ! 303: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xc282913f  ! 304: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r1
	.word 0xd3bad8bf  ! 305: STDFA_R	stda	%f9, [%r31, %r11]
TH_LABEL305:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3bad99f  ! 306: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 307: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad8bf  ! 308: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd0dae058  ! 309: LDXA_I	ldxa	[%r11, + 0x0058] %asi, %r8
	.word 0xce02e03c  ! 310: LDUW_I	lduw	[%r11 + 0x003c], %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3bae038  ! 311: STDFA_I	stda	%f1, [0x0038, %r11]
	.word 0xc3e2913f  ! 312: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc8ca907f  ! 313: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r4
	.word 0xc492a07c  ! 314: LDUHA_I	lduha	[%r10, + 0x007c] %asi, %r2
	.word 0xc7bad9bf  ! 315: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9baa000  ! 316: STDFA_I	stda	%f4, [0x0000, %r10]
	.word 0xc84aa000  ! 317: LDSB_I	ldsb	[%r10 + 0x0000], %r4
	.word 0xcbf2e01f  ! 318: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xc3baa018  ! 319: STDFA_I	stda	%f1, [0x0018, %r10]
	.word 0xce42a06c  ! 320: LDSW_I	ldsw	[%r10 + 0x006c], %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd03aa050  ! 321: STD_I	std	%r8, [%r10 + 0x0050]
	.word 0xd1f2a01f  ! 322: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba999f  ! 323: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba991f  ! 324: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc2d2a018  ! 325: LDSHA_I	ldsha	[%r10, + 0x0018] %asi, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5ba993f  ! 326: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc5ae068  ! 327: LDX_I	ldx	[%r11 + 0x0068], %r6
	.word 0xcfba983f  ! 328: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd2d2e006  ! 329: LDSHA_I	ldsha	[%r11, + 0x0006] %asi, %r9
	.word 0xc5bad97f  ! 330: STDFA_R	stda	%f2, [%r31, %r11]
TH_LABEL330:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5baa068  ! 331: STDFA_I	stda	%f2, [0x0068, %r10]
	.word 0xd2caa055  ! 332: LDSBA_I	ldsba	[%r10, + 0x0055] %asi, %r9
	.word 0xd03a801f  ! 333: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba991f  ! 334: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc20a801f  ! 335: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3e2d03f  ! 336: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xc3e2d13f  ! 337: CASA_I	casa	[%r11] 0x89, %r31, %r1
	.word 0xc3bae000  ! 338: STDFA_I	stda	%f1, [0x0000, %r11]
	.word 0xc83ae018  ! 339: STD_I	std	%r4, [%r11 + 0x0018]
	.word 0xc4d2913f  ! 340: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc702e068  ! 341: LDF_I	ld	[%r11, 0x0068], %f3
	.word 0xc7ba989f  ! 342: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xca52e072  ! 343: LDSH_I	ldsh	[%r11 + 0x0072], %r5
	.word 0xc4da911f  ! 344: LDXA_R	ldxa	[%r10, %r31] 0x88, %r2
	.word 0xd08aa053  ! 345: LDUBA_I	lduba	[%r10, + 0x0053] %asi, %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5bae018  ! 346: STDFA_I	stda	%f2, [0x0018, %r11]
	.word 0xd3bad9bf  ! 347: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d03f  ! 348: CASA_I	casa	[%r11] 0x81, %r31, %r9
	.word 0xd03ae010  ! 349: STD_I	std	%r8, [%r11 + 0x0010]
	.word 0xd3bad89f  ! 350: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc8ca907f  ! 351: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r4
	.word 0xc9f2901f  ! 352: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2911f  ! 353: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc83a801f  ! 354: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 355: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9e2911f  ! 356: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xd302e060  ! 357: LDF_I	ld	[%r11, 0x0060], %f9
	.word 0xc43aa000  ! 358: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc43aa000  ! 359: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc402c01f  ! 360: LDUW_R	lduw	[%r11 + %r31], %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5e2a01f  ! 361: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xd0ca901f  ! 362: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r8
	.word 0xc3ba981f  ! 363: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc6da903f  ! 364: LDXA_R	ldxa	[%r10, %r31] 0x81, %r3
	.word 0xccca905f  ! 365: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd03aa000  ! 366: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xca02801f  ! 367: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xc59aa030  ! 368: LDDFA_I	ldda	[%r10, 0x0030], %f2
	.word 0xcdba997f  ! 369: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba99bf  ! 370: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdf2a01f  ! 371: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba995f  ! 372: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 373: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd322801f  ! 374: STF_R	st	%f9, [%r31, %r10]
	.word 0xc9ba997f  ! 375: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc292907f  ! 376: LDUHA_R	lduha	[%r10, %r31] 0x83, %r1
	.word 0xd1f2a01f  ! 377: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd102a034  ! 378: LDF_I	ld	[%r10, 0x0034], %f8
	.word 0xd03a801f  ! 379: STD_R	std	%r8, [%r10 + %r31]
	.word 0xcb22c01f  ! 380: STF_R	st	%f5, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3ba995f  ! 381: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 382: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xced2a070  ! 383: LDSHA_I	ldsha	[%r10, + 0x0070] %asi, %r7
	.word 0xced2901f  ! 384: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r7
	.word 0xd04a801f  ! 385: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7ba985f  ! 386: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcc8ae04e  ! 387: LDUBA_I	lduba	[%r11, + 0x004e] %asi, %r6
	.word 0xc7ba981f  ! 388: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 389: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xd282a064  ! 390: LDUWA_I	lduwa	[%r10, + 0x0064] %asi, %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc03ac01f  ! 391: STD_R	std	%r0, [%r11 + %r31]
	.word 0xcc5a801f  ! 392: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xc03ac01f  ! 393: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad91f  ! 394: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcada911f  ! 395: LDXA_R	ldxa	[%r10, %r31] 0x88, %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcff2a01f  ! 396: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xd2c2d05f  ! 397: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r9
	.word 0xcccaa026  ! 398: LDSBA_I	ldsba	[%r10, + 0x0026] %asi, %r6
	.word 0xc9bad81f  ! 399: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 400: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xca42a008  ! 401: LDSW_I	ldsw	[%r10 + 0x0008], %r5
	.word 0xd082e020  ! 402: LDUWA_I	lduwa	[%r11, + 0x0020] %asi, %r8
	.word 0xc7e2d11f  ! 403: CASA_I	casa	[%r11] 0x88, %r31, %r3
	.word 0xc7f2e01f  ! 404: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xd20a801f  ! 405: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdf2d01f  ! 406: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad9bf  ! 407: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc852c01f  ! 408: LDSH_R	ldsh	[%r11 + %r31], %r4
	.word 0xc4d2a04c  ! 409: LDSHA_I	ldsha	[%r10, + 0x004c] %asi, %r2
	.word 0xcdf2e01f  ! 410: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcdf2d03f  ! 411: CASXA_I	casxa	[%r11] 0x81, %r31, %r6
	.word 0xcdbad93f  ! 412: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad91f  ! 413: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd252c01f  ! 414: LDSH_R	ldsh	[%r11 + %r31], %r9
	.word 0xc65aa050  ! 415: LDX_I	ldx	[%r10 + 0x0050], %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5ba989f  ! 416: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd252a03c  ! 417: LDSH_I	ldsh	[%r10 + 0x003c], %r9
	.word 0xc282913f  ! 418: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r1
	.word 0xcfbad87f  ! 419: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc40a801f  ! 420: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba993f  ! 421: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 422: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba989f  ! 423: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 424: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc612c01f  ! 425: LDUH_R	lduh	[%r11 + %r31], %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd2c2d01f  ! 426: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r9
	.word 0xc302a064  ! 427: LDF_I	ld	[%r10, 0x0064], %f1
	.word 0xd1bae008  ! 428: STDFA_I	stda	%f8, [0x0008, %r11]
	.word 0xc3ba987f  ! 429: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba997f  ! 430: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL430:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xce8aa052  ! 431: LDUBA_I	lduba	[%r10, + 0x0052] %asi, %r7
	.word 0xd28ae05f  ! 432: LDUBA_I	lduba	[%r11, + 0x005f] %asi, %r9
	.word 0xcc3a801f  ! 433: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba99bf  ! 434: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 435: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc9aa078  ! 436: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r6
	.word 0xd122c01f  ! 437: STF_R	st	%f8, [%r31, %r11]
	.word 0xcbf2d11f  ! 438: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xca4ac01f  ! 439: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xd1f2903f  ! 440: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1ba981f  ! 441: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 442: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2913f  ! 443: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd1ba981f  ! 444: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa048  ! 445: STD_I	std	%r8, [%r10 + 0x0048]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc8d2d11f  ! 446: LDSHA_R	ldsha	[%r11, %r31] 0x88, %r4
	.word 0xcbbad95f  ! 447: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc0aa07b  ! 448: LDUB_I	ldub	[%r10 + 0x007b], %r6
	.word 0xc9f2901f  ! 449: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba98bf  ! 450: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9ba981f  ! 451: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 452: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba997f  ! 453: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcf02a07c  ! 454: LDF_I	ld	[%r10, 0x007c], %f7
	.word 0xd3ba991f  ! 455: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL455:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd092901f  ! 456: LDUHA_R	lduha	[%r10, %r31] 0x80, %r8
	.word 0xcacaa028  ! 457: LDSBA_I	ldsba	[%r10, + 0x0028] %asi, %r5
	.word 0xc3ba98bf  ! 458: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc25ac01f  ! 459: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xc692915f  ! 460: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc302801f  ! 461: LDF_R	ld	[%r10, %r31], %f1
	.word 0xd3f2a01f  ! 462: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba985f  ! 463: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba993f  ! 464: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc7baa068  ! 465: STDFA_I	stda	%f3, [0x0068, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbbad81f  ! 466: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad91f  ! 467: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d01f  ! 468: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xd292e05a  ! 469: LDUHA_I	lduha	[%r11, + 0x005a] %asi, %r9
	.word 0xd03aa008  ! 470: STD_I	std	%r8, [%r10 + 0x0008]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3ba99bf  ! 471: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 472: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba981f  ! 473: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 474: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc5bae078  ! 475: STDFA_I	stda	%f2, [0x0078, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbe2d01f  ! 476: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xc7bae010  ! 477: STDFA_I	stda	%f3, [0x0010, %r11]
	.word 0xd3ba991f  ! 478: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 479: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd20aa065  ! 480: LDUB_I	ldub	[%r10 + 0x0065], %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd19ae040  ! 481: LDDFA_I	ldda	[%r11, 0x0040], %f8
	.word 0xc9bad93f  ! 482: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc702c01f  ! 483: LDF_R	ld	[%r11, %r31], %f3
	.word 0xc9bad9bf  ! 484: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d01f  ! 485: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd39aa028  ! 486: LDDFA_I	ldda	[%r10, 0x0028], %f9
	.word 0xca8a907f  ! 487: LDUBA_R	lduba	[%r10, %r31] 0x83, %r5
	.word 0xc8c2a014  ! 488: LDSWA_I	ldswa	[%r10, + 0x0014] %asi, %r4
	.word 0xc7ba991f  ! 489: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 490: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc0ac01f  ! 491: LDUB_R	ldub	[%r11 + %r31], %r6
	.word 0xcbba999f  ! 492: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd212801f  ! 493: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xc81a801f  ! 494: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xca8ae016  ! 495: LDUBA_I	lduba	[%r11, + 0x0016] %asi, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3f2a01f  ! 496: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba981f  ! 497: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 498: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3e2913f  ! 499: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba999f  ! 500: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3f2a01f  ! 501: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba997f  ! 502: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2903f  ! 503: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xd3ba985f  ! 504: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xca52801f  ! 505: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcde2a01f  ! 506: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcc3a801f  ! 507: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc502801f  ! 508: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc802c01f  ! 509: LDUW_R	lduw	[%r11 + %r31], %r4
	.word 0xc212801f  ! 510: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7e2901f  ! 511: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba983f  ! 512: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa000  ! 513: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc7f2913f  ! 514: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba981f  ! 515: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7f2913f  ! 516: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc49ae010  ! 517: LDDA_I	ldda	[%r11, + 0x0010] %asi, %r2
	.word 0xc20aa00b  ! 518: LDUB_I	ldub	[%r10 + 0x000b], %r1
	.word 0xc59aa068  ! 519: LDDFA_I	ldda	[%r10, 0x0068], %f2
	.word 0xcfba983f  ! 520: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc252a042  ! 521: LDSH_I	ldsh	[%r10 + 0x0042], %r1
	.word 0xca12e05a  ! 522: LDUH_I	lduh	[%r11 + 0x005a], %r5
	.word 0xc2da917f  ! 523: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r1
	.word 0xcfba993f  ! 524: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 525: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcf02801f  ! 526: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc84a801f  ! 527: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xd3ba985f  ! 528: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xca52801f  ! 529: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xd1e2d03f  ! 530: CASA_I	casa	[%r11] 0x81, %r31, %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc49aa008  ! 531: LDDA_I	ldda	[%r10, + 0x0008] %asi, %r2
	.word 0xc5ba983f  ! 532: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc692d17f  ! 533: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r3
	.word 0xc9bad81f  ! 534: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 535: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd39aa028  ! 536: LDDFA_I	ldda	[%r10, 0x0028], %f9
	.word 0xcbba981f  ! 537: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 538: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc20aa061  ! 539: LDUB_I	ldub	[%r10 + 0x0061], %r1
	.word 0xc2da901f  ! 540: LDXA_R	ldxa	[%r10, %r31] 0x80, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfbad9bf  ! 541: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd0d2a072  ! 542: LDSHA_I	ldsha	[%r10, + 0x0072] %asi, %r8
	.word 0xc39ae018  ! 543: LDDFA_I	ldda	[%r11, 0x0018], %f1
	.word 0xc902801f  ! 544: LDF_R	ld	[%r10, %r31], %f4
	.word 0xd212801f  ! 545: LDUH_R	lduh	[%r10 + %r31], %r9
TH_LABEL545:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfbad85f  ! 546: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 547: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xc41a801f  ! 548: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc722801f  ! 549: STF_R	st	%f3, [%r31, %r10]
	.word 0xc9ba987f  ! 550: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9e2901f  ! 551: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc39aa000  ! 552: LDDFA_I	ldda	[%r10, 0x0000], %f1
	.word 0xc39aa010  ! 553: LDDFA_I	ldda	[%r10, 0x0010], %f1
	.word 0xcbba999f  ! 554: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 555: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc492a004  ! 556: LDUHA_I	lduha	[%r10, + 0x0004] %asi, %r2
	.word 0xc5e2901f  ! 557: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba989f  ! 558: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba995f  ! 559: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 560: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdbaa000  ! 561: STDFA_I	stda	%f6, [0x0000, %r10]
	.word 0xc9ba981f  ! 562: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa000  ! 563: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xc9ba981f  ! 564: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc4c2a06c  ! 565: LDSWA_I	ldswa	[%r10, + 0x006c] %asi, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc212801f  ! 566: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xc7ba993f  ! 567: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa048  ! 568: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc7ba981f  ! 569: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba985f  ! 570: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL570:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7e2913f  ! 571: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba981f  ! 572: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcd02e068  ! 573: LDF_I	ld	[%r11, 0x0068], %f6
	.word 0xc9ba987f  ! 574: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 575: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9e2a01f  ! 576: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc692e04e  ! 577: LDUHA_I	lduha	[%r11, + 0x004e] %asi, %r3
	.word 0xc9e2903f  ! 578: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc9ba997f  ! 579: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd1bae078  ! 580: STDFA_I	stda	%f8, [0x0078, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd012c01f  ! 581: LDUH_R	lduh	[%r11 + %r31], %r8
	.word 0xc3bad89f  ! 582: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad8bf  ! 583: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad87f  ! 584: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad97f  ! 585: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc92d07f  ! 586: LDUHA_R	lduha	[%r11, %r31] 0x83, %r6
	.word 0xd3bad91f  ! 587: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc4d2e058  ! 588: LDSHA_I	ldsha	[%r11, + 0x0058] %asi, %r2
	.word 0xc802a01c  ! 589: LDUW_I	lduw	[%r10 + 0x001c], %r4
	.word 0xc3e2e01f  ! 590: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3bad8bf  ! 591: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc41aa070  ! 592: LDD_I	ldd	[%r10 + 0x0070], %r2
	.word 0xc3bad99f  ! 593: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc922c01f  ! 594: STF_R	st	%f4, [%r31, %r11]
	.word 0xd24ac01f  ! 595: LDSB_R	ldsb	[%r11 + %r31], %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc43ae060  ! 596: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xc25a801f  ! 597: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xcadaa028  ! 598: LDXA_I	ldxa	[%r10, + 0x0028] %asi, %r5
	.word 0xcf9aa018  ! 599: LDDFA_I	ldda	[%r10, 0x0018], %f7
	.word 0xce12a002  ! 600: LDUH_I	lduh	[%r10 + 0x0002], %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdbad89f  ! 601: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xce12c01f  ! 602: LDUH_R	lduh	[%r11 + %r31], %r7
	.word 0xcc0a801f  ! 603: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xd1ba98bf  ! 604: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc682901f  ! 605: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5ba983f  ! 606: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 607: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc81a801f  ! 608: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc922801f  ! 609: STF_R	st	%f4, [%r31, %r10]
	.word 0xd1e2d11f  ! 610: CASA_I	casa	[%r11] 0x88, %r31, %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd01aa008  ! 611: LDD_I	ldd	[%r10 + 0x0008], %r8
	.word 0xc83a801f  ! 612: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba99bf  ! 613: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 614: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xca8a911f  ! 615: LDUBA_R	lduba	[%r10, %r31] 0x88, %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbbad8bf  ! 616: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ac01f  ! 617: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad83f  ! 618: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d03f  ! 619: CASXA_I	casxa	[%r11] 0x81, %r31, %r5
	.word 0xc252a04e  ! 620: LDSH_I	ldsh	[%r10 + 0x004e], %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc4d2907f  ! 621: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r2
	.word 0xc41aa038  ! 622: LDD_I	ldd	[%r10 + 0x0038], %r2
	.word 0xcbba989f  ! 623: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2901f  ! 624: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xc89aa040  ! 625: LDDA_I	ldda	[%r10, + 0x0040] %asi, %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc65a801f  ! 626: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xc5f2a01f  ! 627: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5f2911f  ! 628: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xc5e2911f  ! 629: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xd092a030  ! 630: LDUHA_I	lduha	[%r10, + 0x0030] %asi, %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd0cad01f  ! 631: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r8
	.word 0xc2cad07f  ! 632: LDSBA_R	ldsba	[%r11, %r31] 0x83, %r1
	.word 0xc6c2917f  ! 633: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r3
	.word 0xd102801f  ! 634: LDF_R	ld	[%r10, %r31], %f8
	.word 0xd08aa07f  ! 635: LDUBA_I	lduba	[%r10, + 0x007f] %asi, %r8
TH_LABEL635:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc3ae040  ! 636: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xcdbad83f  ! 637: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad95f  ! 638: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad97f  ! 639: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdf2e01f  ! 640: CASXA_R	casxa	[%r11]%asi, %r31, %r6
TH_LABEL640:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc3ae040  ! 641: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xc20aa05b  ! 642: LDUB_I	ldub	[%r10 + 0x005b], %r1
	.word 0xc43aa030  ! 643: STD_I	std	%r2, [%r10 + 0x0030]
	.word 0xce42801f  ! 644: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xcacae04f  ! 645: LDSBA_I	ldsba	[%r11, + 0x004f] %asi, %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd39aa040  ! 646: LDDFA_I	ldda	[%r10, 0x0040], %f9
	.word 0xd1bad81f  ! 647: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 648: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcada901f  ! 649: LDXA_R	ldxa	[%r10, %r31] 0x80, %r5
	.word 0xd242801f  ! 650: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3e2903f  ! 651: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd3e2a01f  ! 652: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba99bf  ! 653: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 654: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xca4a801f  ! 655: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcec2d11f  ! 656: LDSWA_R	ldswa	[%r11, %r31] 0x88, %r7
	.word 0xcc3ac01f  ! 657: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcde2e01f  ! 658: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdbad99f  ! 659: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xca92903f  ! 660: LDUHA_R	lduha	[%r10, %r31] 0x81, %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1ba997f  ! 661: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca92917f  ! 662: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r5
	.word 0xc7bad85f  ! 663: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xce0ae009  ! 664: LDUB_I	ldub	[%r11 + 0x0009], %r7
	.word 0xcc12e006  ! 665: LDUH_I	lduh	[%r11 + 0x0006], %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xce0ac01f  ! 666: LDUB_R	ldub	[%r11 + %r31], %r7
	.word 0xc9ba985f  ! 667: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xce8a903f  ! 668: LDUBA_R	lduba	[%r10, %r31] 0x81, %r7
	.word 0xc882901f  ! 669: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r4
	.word 0xc83aa070  ! 670: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbf2901f  ! 671: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbba981f  ! 672: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa070  ! 673: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xcbba997f  ! 674: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2901f  ! 675: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc59aa018  ! 676: LDDFA_I	ldda	[%r10, 0x0018], %f2
	.word 0xc5bad9bf  ! 677: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ac01f  ! 678: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad99f  ! 679: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2e01f  ! 680: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5f2e01f  ! 681: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad95f  ! 682: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc49aa030  ! 683: LDDA_I	ldda	[%r10, + 0x0030] %asi, %r2
	.word 0xc43ac01f  ! 684: STD_R	std	%r2, [%r11 + %r31]
	.word 0xd08ad13f  ! 685: LDUBA_R	lduba	[%r11, %r31] 0x89, %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc6ca901f  ! 686: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r3
	.word 0xca4ae016  ! 687: LDSB_I	ldsb	[%r11 + 0x0016], %r5
	.word 0xcbba987f  ! 688: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcdbae020  ! 689: STDFA_I	stda	%f6, [0x0020, %r11]
	.word 0xcbf2901f  ! 690: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbe2913f  ! 691: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xcbe2911f  ! 692: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xcbe2a01f  ! 693: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc2daa038  ! 694: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r1
	.word 0xc4ca917f  ! 695: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xca42801f  ! 696: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xc9e2d13f  ! 697: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc9bad89f  ! 698: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d11f  ! 699: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xc9bad81f  ! 700: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9bad97f  ! 701: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcc5ac01f  ! 702: LDX_R	ldx	[%r11 + %r31], %r6
	.word 0xd1f2a01f  ! 703: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xcedaa028  ! 704: LDXA_I	ldxa	[%r10, + 0x0028] %asi, %r7
	.word 0xd102801f  ! 705: LDF_R	ld	[%r10, %r31], %f8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc1aa040  ! 706: LDD_I	ldd	[%r10 + 0x0040], %r6
	.word 0xcdf2a01f  ! 707: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc6da917f  ! 708: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r3
	.word 0xc43ac01f  ! 709: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae060  ! 710: STD_I	std	%r2, [%r11 + 0x0060]
TH_LABEL710:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7bad97f  ! 711: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2d13f  ! 712: CASA_I	casa	[%r11] 0x89, %r31, %r3
	.word 0xc7bad8bf  ! 713: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae060  ! 714: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xc612801f  ! 715: LDUH_R	lduh	[%r10 + %r31], %r3
TH_LABEL715:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdf2901f  ! 716: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xce52e050  ! 717: LDSH_I	ldsh	[%r11 + 0x0050], %r7
	.word 0xcbba985f  ! 718: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd252801f  ! 719: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xcfe2a01f  ! 720: CASA_R	casa	[%r10] %asi, %r31, %r7
TH_LABEL720:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc452801f  ! 721: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xcfbad99f  ! 722: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xce5a801f  ! 723: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xc9ba983f  ! 724: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc722801f  ! 725: STF_R	st	%f3, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3ba987f  ! 726: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc01a801f  ! 727: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xcfba98bf  ! 728: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca0aa048  ! 729: LDUB_I	ldub	[%r10 + 0x0048], %r5
	.word 0xd03ae070  ! 730: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc99aa018  ! 731: LDDFA_I	ldda	[%r10, 0x0018], %f4
	.word 0xcedae070  ! 732: LDXA_I	ldxa	[%r11, + 0x0070] %asi, %r7
	.word 0xc83ac01f  ! 733: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc89aa040  ! 734: LDDA_I	ldda	[%r10, + 0x0040] %asi, %r4
	.word 0xc9e2903f  ! 735: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9ba987f  ! 736: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba98bf  ! 737: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa078  ! 738: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xd19aa030  ! 739: LDDFA_I	ldda	[%r10, 0x0030], %f8
	.word 0xd1ba983f  ! 740: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdbaa008  ! 741: STDFA_I	stda	%f6, [0x0008, %r10]
	.word 0xcbba981f  ! 742: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba989f  ! 743: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2901f  ! 744: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbf2901f  ! 745: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc83a801f  ! 746: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba991f  ! 747: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc442801f  ! 748: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xcff2e01f  ! 749: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xd0cae00c  ! 750: LDSBA_I	ldsba	[%r11, + 0x000c] %asi, %r8
TH_LABEL750:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3e2901f  ! 751: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba983f  ! 752: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 753: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa058  ! 754: STD_I	std	%r0, [%r10 + 0x0058]
	.word 0xc3e2903f  ! 755: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc20a801f  ! 756: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xd2dae068  ! 757: LDXA_I	ldxa	[%r11, + 0x0068] %asi, %r9
	.word 0xc482917f  ! 758: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r2
	.word 0xcfba985f  ! 759: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc702801f  ! 760: LDF_R	ld	[%r10, %r31], %f3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc882d11f  ! 761: LDUWA_R	lduwa	[%r11, %r31] 0x88, %r4
	.word 0xd242801f  ! 762: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xc3ba997f  ! 763: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd102c01f  ! 764: LDF_R	ld	[%r11, %r31], %f8
	.word 0xc922c01f  ! 765: STF_R	st	%f4, [%r31, %r11]
TH_LABEL765:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd0c2e018  ! 766: LDSWA_I	ldswa	[%r11, + 0x0018] %asi, %r8
	.word 0xc83a801f  ! 767: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba995f  ! 768: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 769: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba999f  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL770:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc83aa038  ! 771: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xc9f2a01f  ! 772: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba997f  ! 773: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc702c01f  ! 774: LDF_R	ld	[%r11, %r31], %f3
	.word 0xd3ba981f  ! 775: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc302a014  ! 776: LDF_I	ld	[%r10, 0x0014], %f1
	.word 0xc492d13f  ! 777: LDUHA_R	lduha	[%r11, %r31] 0x89, %r2
	.word 0xc302e054  ! 778: LDF_I	ld	[%r11, 0x0054], %f1
	.word 0xcc52c01f  ! 779: LDSH_R	ldsh	[%r11 + %r31], %r6
	.word 0xc3ba98bf  ! 780: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd0c2e070  ! 781: LDSWA_I	ldswa	[%r11, + 0x0070] %asi, %r8
	.word 0xc5e2913f  ! 782: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5ba999f  ! 783: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2903f  ! 784: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc43aa018  ! 785: STD_I	std	%r2, [%r10 + 0x0018]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc81aa048  ! 786: LDD_I	ldd	[%r10 + 0x0048], %r4
	.word 0xd03ae050  ! 787: STD_I	std	%r8, [%r11 + 0x0050]
	.word 0xcb9aa068  ! 788: LDDFA_I	ldda	[%r10, 0x0068], %f5
	.word 0xd1ba985f  ! 789: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc85a801f  ! 790: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3ba991f  ! 791: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc88a907f  ! 792: LDUBA_R	lduba	[%r10, %r31] 0x83, %r4
	.word 0xd3f2a01f  ! 793: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba981f  ! 794: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 795: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xca0aa024  ! 796: LDUB_I	ldub	[%r10 + 0x0024], %r5
	.word 0xd1ba995f  ! 797: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2901f  ! 798: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba985f  ! 799: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 800: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc02e028  ! 801: LDUW_I	lduw	[%r11 + 0x0028], %r6
	.word 0xc9ba981f  ! 802: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xca82905f  ! 803: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r5
	.word 0xcc1aa018  ! 804: LDD_I	ldd	[%r10 + 0x0018], %r6
	.word 0xcc3a801f  ! 805: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc3a801f  ! 806: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2901f  ! 807: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba99bf  ! 808: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 809: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba99bf  ! 810: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc3a801f  ! 811: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba997f  ! 812: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa010  ! 813: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcc3aa010  ! 814: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xc922801f  ! 815: STF_R	st	%f4, [%r31, %r10]
TH_LABEL815:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9ba99bf  ! 816: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd19aa018  ! 817: LDDFA_I	ldda	[%r10, 0x0018], %f8
	.word 0xcdbad8bf  ! 818: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad95f  ! 819: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2e01f  ! 820: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcde2d13f  ! 821: CASA_I	casa	[%r11] 0x89, %r31, %r6
	.word 0xcf02801f  ! 822: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc83a801f  ! 823: STD_R	std	%r4, [%r10 + %r31]
	.word 0xccca903f  ! 824: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r6
	.word 0xc9bad83f  ! 825: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc83ac01f  ! 826: STD_R	std	%r4, [%r11 + %r31]
	.word 0xd122801f  ! 827: STF_R	st	%f8, [%r31, %r10]
	.word 0xcdba983f  ! 828: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc4c2901f  ! 829: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r2
	.word 0xc9bad81f  ! 830: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc452a042  ! 831: LDSH_I	ldsh	[%r10 + 0x0042], %r2
	.word 0xd1baa030  ! 832: STDFA_I	stda	%f8, [0x0030, %r10]
	.word 0xcbe2a01f  ! 833: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbe2a01f  ! 834: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc902a074  ! 835: LDF_I	ld	[%r10, 0x0074], %f4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3ba98bf  ! 836: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xca12e044  ! 837: LDUH_I	lduh	[%r11 + 0x0044], %r5
	.word 0xd09aa070  ! 838: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r8
	.word 0xd3bad83f  ! 839: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae000  ! 840: STD_I	std	%r8, [%r11 + 0x0000]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3bad91f  ! 841: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 842: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xcfbaa070  ! 843: STDFA_I	stda	%f7, [0x0070, %r10]
	.word 0xc83ac01f  ! 844: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc6d2d15f  ! 845: LDSHA_R	ldsha	[%r11, %r31] 0x8a, %r3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc2daa000  ! 846: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r1
	.word 0xd03ae048  ! 847: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xd3f2e01f  ! 848: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2d01f  ! 849: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd3f2e01f  ! 850: CASXA_R	casxa	[%r11]%asi, %r31, %r9
TH_LABEL850:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc202801f  ! 851: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xc3ba981f  ! 852: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 853: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2913f  ! 854: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc3ba991f  ! 855: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc79aa018  ! 856: LDDFA_I	ldda	[%r10, 0x0018], %f3
	.word 0xcfba985f  ! 857: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc652a00a  ! 858: LDSH_I	ldsh	[%r10 + 0x000a], %r3
	.word 0xd2c2d01f  ! 859: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r9
	.word 0xc502a010  ! 860: LDF_I	ld	[%r10, 0x0010], %f2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdba98bf  ! 861: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc99aa040  ! 862: LDDFA_I	ldda	[%r10, 0x0040], %f4
	.word 0xcfe2a01f  ! 863: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba989f  ! 864: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 865: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc3aa020  ! 866: STD_I	std	%r6, [%r10 + 0x0020]
	.word 0xcfe2a01f  ! 867: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcf22c01f  ! 868: STF_R	st	%f7, [%r31, %r11]
	.word 0xcb22801f  ! 869: STF_R	st	%f5, [%r31, %r10]
	.word 0xc5f2d01f  ! 870: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5e2d13f  ! 871: CASA_I	casa	[%r11] 0x89, %r31, %r2
	.word 0xc43ac01f  ! 872: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad97f  ! 873: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xca5aa030  ! 874: LDX_I	ldx	[%r10 + 0x0030], %r5
	.word 0xd3bae050  ! 875: STDFA_I	stda	%f9, [0x0050, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd08ae069  ! 876: LDUBA_I	lduba	[%r11, + 0x0069] %asi, %r8
	.word 0xc5bad95f  ! 877: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc79aa010  ! 878: LDDFA_I	ldda	[%r10, 0x0010], %f3
	.word 0xcdf2d03f  ! 879: CASXA_I	casxa	[%r11] 0x81, %r31, %r6
	.word 0xc8d2e050  ! 880: LDSHA_I	ldsha	[%r11, + 0x0050] %asi, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5f2901f  ! 881: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2a01f  ! 882: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba981f  ! 883: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 884: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc39aa028  ! 885: LDDFA_I	ldda	[%r10, 0x0028], %f1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc302a018  ! 886: LDF_I	ld	[%r10, 0x0018], %f1
	.word 0xc3f2e01f  ! 887: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3f2e01f  ! 888: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad87f  ! 889: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcc52c01f  ! 890: LDSH_R	ldsh	[%r11 + %r31], %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcad2911f  ! 891: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r5
	.word 0xd1ba983f  ! 892: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 893: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 894: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba993f  ! 895: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd03aa028  ! 896: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd1ba989f  ! 897: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 898: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xcb02c01f  ! 899: LDF_R	ld	[%r11, %r31], %f5
	.word 0xd102e01c  ! 900: LDF_I	ld	[%r11, 0x001c], %f8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdbaa068  ! 901: STDFA_I	stda	%f6, [0x0068, %r10]
	.word 0xca52a06c  ! 902: LDSH_I	ldsh	[%r10 + 0x006c], %r5
	.word 0xc412801f  ! 903: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xcc82a078  ! 904: LDUWA_I	lduwa	[%r10, + 0x0078] %asi, %r6
	.word 0xcb9aa058  ! 905: LDDFA_I	ldda	[%r10, 0x0058], %f5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7f2d03f  ! 906: CASXA_I	casxa	[%r11] 0x81, %r31, %r3
	.word 0xd302801f  ! 907: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc44ae026  ! 908: LDSB_I	ldsb	[%r11 + 0x0026], %r2
	.word 0xca4ae020  ! 909: LDSB_I	ldsb	[%r11 + 0x0020], %r5
	.word 0xc83aa008  ! 910: STD_I	std	%r4, [%r10 + 0x0008]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc302a010  ! 911: LDF_I	ld	[%r10, 0x0010], %f1
	.word 0xd102e044  ! 912: LDF_I	ld	[%r11, 0x0044], %f8
	.word 0xc3e2a01f  ! 913: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3f2913f  ! 914: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xc3f2a01f  ! 915: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3ba995f  ! 916: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2903f  ! 917: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc402801f  ! 918: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xcd9aa048  ! 919: LDDFA_I	ldda	[%r10, 0x0048], %f6
	.word 0xc6d2d17f  ! 920: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03aa010  ! 921: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1e2901f  ! 922: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba987f  ! 923: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2903f  ! 924: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd03aa010  ! 925: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xca52801f  ! 926: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xc3e2e01f  ! 927: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc4c2a028  ! 928: LDSWA_I	ldswa	[%r10, + 0x0028] %asi, %r2
	.word 0xc7bad83f  ! 929: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd0c2913f  ! 930: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdbaa008  ! 931: STDFA_I	stda	%f6, [0x0008, %r10]
	.word 0xcde2a01f  ! 932: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2911f  ! 933: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcdba983f  ! 934: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa070  ! 935: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc3aa070  ! 936: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xd1baa040  ! 937: STDFA_I	stda	%f8, [0x0040, %r10]
	.word 0xccca911f  ! 938: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r6
	.word 0xd19aa028  ! 939: LDDFA_I	ldda	[%r10, 0x0028], %f8
	.word 0xd292d11f  ! 940: LDUHA_R	lduha	[%r11, %r31] 0x88, %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5baa030  ! 941: STDFA_I	stda	%f2, [0x0030, %r10]
	.word 0xd002801f  ! 942: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xd1ba995f  ! 943: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 944: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba989f  ! 945: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1ba98bf  ! 946: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2901f  ! 947: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xcec2905f  ! 948: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r7
	.word 0xc502c01f  ! 949: LDF_R	ld	[%r11, %r31], %f2
	.word 0xd3e2903f  ! 950: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xccd2a01e  ! 951: LDSHA_I	ldsha	[%r10, + 0x001e] %asi, %r6
	.word 0xc43ae028  ! 952: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc43ac01f  ! 953: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc502a02c  ! 954: LDF_I	ld	[%r10, 0x002c], %f2
	.word 0xcfbaa060  ! 955: STDFA_I	stda	%f7, [0x0060, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc892d17f  ! 956: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r4
	.word 0xc3ba989f  ! 957: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa008  ! 958: STD_I	std	%r0, [%r10 + 0x0008]
	.word 0xcdbaa078  ! 959: STDFA_I	stda	%f6, [0x0078, %r10]
	.word 0xcfba989f  ! 960: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc20ae00c  ! 961: LDUB_I	ldub	[%r11 + 0x000c], %r1
	.word 0xc65aa030  ! 962: LDX_I	ldx	[%r10 + 0x0030], %r3
	.word 0xcbbad95f  ! 963: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc02c01f  ! 964: LDUW_R	lduw	[%r11 + %r31], %r6
	.word 0xd1ba983f  ! 965: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd03aa030  ! 966: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xd1ba981f  ! 967: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcf02e074  ! 968: LDF_I	ld	[%r11, 0x0074], %f7
	.word 0xc3bad93f  ! 969: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad99f  ! 970: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd39aa050  ! 971: LDDFA_I	ldda	[%r10, 0x0050], %f9
	.word 0xd3ba993f  ! 972: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2913f  ! 973: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xc6cad05f  ! 974: LDSBA_R	ldsba	[%r11, %r31] 0x82, %r3
	.word 0xc41aa060  ! 975: LDD_I	ldd	[%r10 + 0x0060], %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc6c2d11f  ! 976: LDSWA_R	ldswa	[%r11, %r31] 0x88, %r3
	.word 0xc242a02c  ! 977: LDSW_I	ldsw	[%r10 + 0x002c], %r1
	.word 0xd2c2d01f  ! 978: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r9
	.word 0xd0da911f  ! 979: LDXA_R	ldxa	[%r10, %r31] 0x88, %r8
	.word 0xcc3aa030  ! 980: STD_I	std	%r6, [%r10 + 0x0030]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc3aa030  ! 981: STD_I	std	%r6, [%r10 + 0x0030]
	.word 0xc64a801f  ! 982: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xc7e2901f  ! 983: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xd20ae06d  ! 984: LDUB_I	ldub	[%r11 + 0x006d], %r9
	.word 0xca0aa015  ! 985: LDUB_I	ldub	[%r10 + 0x0015], %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7f2a01f  ! 986: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba99bf  ! 987: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xce8ae03e  ! 988: LDUBA_I	lduba	[%r11, + 0x003e] %asi, %r7
	.word 0xd102e024  ! 989: LDF_I	ld	[%r11, 0x0024], %f8
	.word 0xcff2a01f  ! 990: CASXA_R	casxa	[%r10]%asi, %r31, %r7
TH_LABEL990:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc3a801f  ! 991: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba987f  ! 992: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc24ae006  ! 993: LDSB_I	ldsb	[%r11 + 0x0006], %r1
	.word 0xc9bad93f  ! 994: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad91f  ! 995: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc59aa050  ! 996: LDDFA_I	ldda	[%r10, 0x0050], %f2
	.word 0xc2c2a020  ! 997: LDSWA_I	ldswa	[%r10, + 0x0020] %asi, %r1
	.word 0xcfbad9bf  ! 998: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcdbaa060  ! 999: STDFA_I	stda	%f6, [0x0060, %r10]
	.word 0xc03a801f  ! 1000: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	subcc %r30, 1, %r30
	bnz  TH3_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	add	%g0,	0x1,	%r30
TH2_LOOP_START:
	.word 0xc5ba989f  ! 1: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd082e018  ! 2: LDUWA_I	lduwa	[%r11, + 0x0018] %asi, %r8
	.word 0xd202e000  ! 3: LDUW_I	lduw	[%r11 + 0x0000], %r9
	.word 0xc85a801f  ! 4: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xcde2e01f  ! 5: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdbad99f  ! 6: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xccd2d17f  ! 7: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r6
	.word 0xc9e2911f  ! 8: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xd042a07c  ! 9: LDSW_I	ldsw	[%r10 + 0x007c], %r8
	.word 0xc88ae00d  ! 10: LDUBA_I	lduba	[%r11, + 0x000d] %asi, %r4
TH_LABEL10:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc89ae068  ! 11: LDDA_I	ldda	[%r11, + 0x0068] %asi, %r4
	.word 0xc702e028  ! 12: LDF_I	ld	[%r11, 0x0028], %f3
	.word 0xc3ba997f  ! 13: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 14: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba981f  ! 15: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc8cae024  ! 16: LDSBA_I	ldsba	[%r11, + 0x0024] %asi, %r4
	.word 0xc48ae04b  ! 17: LDUBA_I	lduba	[%r11, + 0x004b] %asi, %r2
	.word 0xcdf2a01f  ! 18: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2911f  ! 19: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcdba987f  ! 20: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdba99bf  ! 21: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 22: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd082901f  ! 23: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r8
	.word 0xd3ba995f  ! 24: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2913f  ! 25: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7baa040  ! 26: STDFA_I	stda	%f3, [0x0040, %r10]
	.word 0xd1e2e01f  ! 27: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xc922801f  ! 28: STF_R	st	%f4, [%r31, %r10]
	.word 0xc9bad8bf  ! 29: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad8bf  ! 30: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9e2e01f  ! 31: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc3bae028  ! 32: STDFA_I	stda	%f1, [0x0028, %r11]
	.word 0xcdba981f  ! 33: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 34: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba991f  ! 35: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc3aa028  ! 36: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xcc3a801f  ! 37: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2911f  ! 38: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcdba987f  ! 39: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 40: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc01aa038  ! 41: LDD_I	ldd	[%r10 + 0x0038], %r0
	.word 0xc5f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2a01f  ! 43: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcfbae008  ! 44: STDFA_I	stda	%f7, [0x0008, %r11]
	.word 0xcbe2e01f  ! 45: CASA_R	casa	[%r11] %asi, %r31, %r5
TH_LABEL45:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc2dad07f  ! 46: LDXA_R	ldxa	[%r11, %r31] 0x83, %r1
	.word 0xd1ba98bf  ! 47: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 48: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1f2a01f  ! 49: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba983f  ! 50: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL50:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfbae020  ! 51: STDFA_I	stda	%f7, [0x0020, %r11]
	.word 0xd08aa03f  ! 52: LDUBA_I	lduba	[%r10, + 0x003f] %asi, %r8
	.word 0xcc8ad01f  ! 53: LDUBA_R	lduba	[%r11, %r31] 0x80, %r6
	.word 0xcf9aa058  ! 54: LDDFA_I	ldda	[%r10, 0x0058], %f7
	.word 0xc03ac01f  ! 55: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc682e064  ! 56: LDUWA_I	lduwa	[%r11, + 0x0064] %asi, %r3
	.word 0xc9bad83f  ! 57: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad93f  ! 58: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bae048  ! 59: STDFA_I	stda	%f4, [0x0048, %r11]
	.word 0xc302c01f  ! 60: LDF_R	ld	[%r11, %r31], %f1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3ba98bf  ! 61: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc2c2903f  ! 62: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r1
	.word 0xd202801f  ! 63: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xc5ba989f  ! 64: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc9bae030  ! 65: STDFA_I	stda	%f4, [0x0030, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1f2e01f  ! 66: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd03ac01f  ! 67: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad99f  ! 68: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae048  ! 69: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xcc12c01f  ! 70: LDUH_R	lduh	[%r11 + %r31], %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xca42a050  ! 71: LDSW_I	ldsw	[%r10 + 0x0050], %r5
	.word 0xcc1a801f  ! 72: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xd012801f  ! 73: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xc9f2e01f  ! 74: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xd302801f  ! 75: LDF_R	ld	[%r10, %r31], %f9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbba993f  ! 76: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcd02c01f  ! 77: LDF_R	ld	[%r11, %r31], %f6
	.word 0xcbbaa060  ! 78: STDFA_I	stda	%f5, [0x0060, %r10]
	.word 0xcbbad97f  ! 79: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd322801f  ! 80: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd092903f  ! 81: LDUHA_R	lduha	[%r10, %r31] 0x81, %r8
	.word 0xd3bad95f  ! 82: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 83: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad89f  ! 84: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 85: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcf9ae078  ! 86: LDDFA_I	ldda	[%r11, 0x0078], %f7
	.word 0xc3f2d01f  ! 87: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3e2d13f  ! 88: CASA_I	casa	[%r11] 0x89, %r31, %r1
	.word 0xd082d17f  ! 89: LDUWA_R	lduwa	[%r11, %r31] 0x8b, %r8
	.word 0xc79aa078  ! 90: LDDFA_I	ldda	[%r10, 0x0078], %f3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc83aa070  ! 91: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xd3bae040  ! 92: STDFA_I	stda	%f9, [0x0040, %r11]
	.word 0xc3ba985f  ! 93: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd1bae058  ! 94: STDFA_I	stda	%f8, [0x0058, %r11]
	.word 0xcc3a801f  ! 95: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc3a801f  ! 96: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 97: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba985f  ! 98: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 99: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd01aa008  ! 100: LDD_I	ldd	[%r10 + 0x0008], %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5bad89f  ! 101: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad81f  ! 102: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc24a801f  ! 103: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xce52a052  ! 104: LDSH_I	ldsh	[%r10 + 0x0052], %r7
	.word 0xd3f2e01f  ! 105: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3f2e01f  ! 106: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xc8da911f  ! 107: LDXA_R	ldxa	[%r10, %r31] 0x88, %r4
	.word 0xcfba983f  ! 108: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba991f  ! 109: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc242a03c  ! 110: LDSW_I	ldsw	[%r10 + 0x003c], %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc2daa070  ! 111: LDXA_I	ldxa	[%r10, + 0x0070] %asi, %r1
	.word 0xc9bae020  ! 112: STDFA_I	stda	%f4, [0x0020, %r11]
	.word 0xc9f2913f  ! 113: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xd24ac01f  ! 114: LDSB_R	ldsb	[%r11 + %r31], %r9
	.word 0xc9f2911f  ! 115: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9e2911f  ! 116: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9e2903f  ! 117: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc9ba993f  ! 118: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 119: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba983f  ! 120: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9e2911f  ! 121: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xd24ae01f  ! 122: LDSB_I	ldsb	[%r11 + 0x001f], %r9
	.word 0xcdbad91f  ! 123: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd2daa068  ! 124: LDXA_I	ldxa	[%r10, + 0x0068] %asi, %r9
	.word 0xd03ac01f  ! 125: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1bad8bf  ! 126: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad95f  ! 127: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc81aa020  ! 128: LDD_I	ldd	[%r10 + 0x0020], %r4
	.word 0xd3ba987f  ! 129: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba997f  ! 130: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc402c01f  ! 131: LDUW_R	lduw	[%r11 + %r31], %r2
	.word 0xc3ba981f  ! 132: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc59aa018  ! 133: LDDFA_I	ldda	[%r10, 0x0018], %f2
	.word 0xcfba98bf  ! 134: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfbaa038  ! 135: STDFA_I	stda	%f7, [0x0038, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5ba991f  ! 136: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2903f  ! 137: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xd2ca913f  ! 138: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r9
	.word 0xcdf2a01f  ! 139: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba981f  ! 140: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc482a004  ! 141: LDUWA_I	lduwa	[%r10, + 0x0004] %asi, %r2
	.word 0xceca911f  ! 142: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r7
	.word 0xc3f2e01f  ! 143: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc84ac01f  ! 144: LDSB_R	ldsb	[%r11 + %r31], %r4
	.word 0xc8daa010  ! 145: LDXA_I	ldxa	[%r10, + 0x0010] %asi, %r4
TH_LABEL145:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5e2a01f  ! 146: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc302a020  ! 147: LDF_I	ld	[%r10, 0x0020], %f1
	.word 0xc3ba985f  ! 148: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 149: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3e2a01f  ! 150: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd0c2d17f  ! 151: LDSWA_R	ldswa	[%r11, %r31] 0x8b, %r8
	.word 0xc5e2e01f  ! 152: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc602a028  ! 153: LDUW_I	lduw	[%r10 + 0x0028], %r3
	.word 0xc7ba985f  ! 154: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 155: STD_R	std	%r2, [%r10 + %r31]
TH_LABEL155:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7ba997f  ! 156: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 157: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xcb9aa020  ! 158: LDDFA_I	ldda	[%r10, 0x0020], %f5
	.word 0xcfbae010  ! 159: STDFA_I	stda	%f7, [0x0010, %r11]
	.word 0xcc12a02e  ! 160: LDUH_I	lduh	[%r10 + 0x002e], %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc4ca915f  ! 161: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r2
	.word 0xc3bad87f  ! 162: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 163: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3e2e01f  ! 164: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2e01f  ! 165: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc702801f  ! 166: LDF_R	ld	[%r10, %r31], %f3
	.word 0xd092901f  ! 167: LDUHA_R	lduha	[%r10, %r31] 0x80, %r8
	.word 0xc9baa048  ! 168: STDFA_I	stda	%f4, [0x0048, %r10]
	.word 0xc41a801f  ! 169: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc5e2e01f  ! 170: CASA_R	casa	[%r11] %asi, %r31, %r2
TH_LABEL170:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcb9ae060  ! 171: LDDFA_I	ldda	[%r11, 0x0060], %f5
	.word 0xd3bad95f  ! 172: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 173: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd39aa070  ! 174: LDDFA_I	ldda	[%r10, 0x0070], %f9
	.word 0xcbbad83f  ! 175: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbbad85f  ! 176: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcdbaa020  ! 177: STDFA_I	stda	%f6, [0x0020, %r10]
	.word 0xc9ba997f  ! 178: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd242a000  ! 179: LDSW_I	ldsw	[%r10 + 0x0000], %r9
	.word 0xcd22801f  ! 180: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfbad81f  ! 181: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcad2a028  ! 182: LDSHA_I	ldsha	[%r10, + 0x0028] %asi, %r5
	.word 0xcc5aa018  ! 183: LDX_I	ldx	[%r10 + 0x0018], %r6
	.word 0xd2ca901f  ! 184: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r9
	.word 0xc7e2e01f  ! 185: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd25a801f  ! 186: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xc3bad91f  ! 187: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcada911f  ! 188: LDXA_R	ldxa	[%r10, %r31] 0x88, %r5
	.word 0xc3e2903f  ! 189: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xd0d2901f  ! 190: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9bad89f  ! 191: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc60aa05c  ! 192: LDUB_I	ldub	[%r10 + 0x005c], %r3
	.word 0xcfbad87f  ! 193: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc4ac01f  ! 194: LDSB_R	ldsb	[%r11 + %r31], %r6
	.word 0xcc5a801f  ! 195: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc59aa040  ! 196: LDDFA_I	ldda	[%r10, 0x0040], %f2
	.word 0xc5baa050  ! 197: STDFA_I	stda	%f2, [0x0050, %r10]
	.word 0xc65aa070  ! 198: LDX_I	ldx	[%r10 + 0x0070], %r3
	.word 0xc24aa00e  ! 199: LDSB_I	ldsb	[%r10 + 0x000e], %r1
	.word 0xc9e2d11f  ! 200: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc5a801f  ! 201: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xc5e2a01f  ! 202: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcfbae060  ! 203: STDFA_I	stda	%f7, [0x0060, %r11]
	.word 0xc5ba99bf  ! 204: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcf9aa070  ! 205: LDDFA_I	ldda	[%r10, 0x0070], %f7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd25aa028  ! 206: LDX_I	ldx	[%r10 + 0x0028], %r9
	.word 0xd01a801f  ! 207: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xc412801f  ! 208: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xd302c01f  ! 209: LDF_R	ld	[%r11, %r31], %f9
	.word 0xcb9aa030  ! 210: LDDFA_I	ldda	[%r10, 0x0030], %f5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdba995f  ! 211: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcb02c01f  ! 212: LDF_R	ld	[%r11, %r31], %f5
	.word 0xc7bad93f  ! 213: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd252a060  ! 214: LDSH_I	ldsh	[%r10 + 0x0060], %r9
	.word 0xc5f2a01f  ! 215: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5ba991f  ! 216: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 217: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 218: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc60ac01f  ! 219: LDUB_R	ldub	[%r11 + %r31], %r3
	.word 0xd05aa010  ! 220: LDX_I	ldx	[%r10 + 0x0010], %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3e2903f  ! 221: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd03a801f  ! 222: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc25a801f  ! 223: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xc5e2a01f  ! 224: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xca82907f  ! 225: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcec2913f  ! 226: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r7
	.word 0xd3ba99bf  ! 227: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba997f  ! 228: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 229: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba983f  ! 230: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL230:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd03aa010  ! 231: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd3e2a01f  ! 232: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 233: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba991f  ! 234: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa010  ! 235: STD_I	std	%r8, [%r10 + 0x0010]
TH_LABEL235:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd03a801f  ! 236: STD_R	std	%r8, [%r10 + %r31]
	.word 0xccd2917f  ! 237: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r6
	.word 0xc522c01f  ! 238: STF_R	st	%f2, [%r31, %r11]
	.word 0xcfba981f  ! 239: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd102801f  ! 240: LDF_R	ld	[%r10, %r31], %f8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc43aa010  ! 241: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xd302e058  ! 242: LDF_I	ld	[%r11, 0x0058], %f9
	.word 0xc702c01f  ! 243: LDF_R	ld	[%r11, %r31], %f3
	.word 0xc68a901f  ! 244: LDUBA_R	lduba	[%r10, %r31] 0x80, %r3
	.word 0xd03aa038  ! 245: STD_I	std	%r8, [%r10 + 0x0038]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3ba981f  ! 246: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 247: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 248: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xc482917f  ! 249: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r2
	.word 0xcbba993f  ! 250: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbba985f  ! 251: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa038  ! 252: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xcc0aa020  ! 253: LDUB_I	ldub	[%r10 + 0x0020], %r6
	.word 0xd3ba987f  ! 254: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 255: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3f2a01f  ! 256: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03aa058  ! 257: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3ba987f  ! 258: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcc42801f  ! 259: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xca0aa006  ! 260: LDUB_I	ldub	[%r10 + 0x0006], %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1bad85f  ! 261: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 262: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 263: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd2c2911f  ! 264: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r9
	.word 0xc7e2a01f  ! 265: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7ba999f  ! 266: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 267: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 268: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc6cad13f  ! 269: LDSBA_R	ldsba	[%r11, %r31] 0x89, %r3
	.word 0xd39aa030  ! 270: LDDFA_I	ldda	[%r10, 0x0030], %f9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc01aa028  ! 271: LDD_I	ldd	[%r10 + 0x0028], %r0
	.word 0xc8d2a072  ! 272: LDSHA_I	ldsha	[%r10, + 0x0072] %asi, %r4
	.word 0xc43aa058  ! 273: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc5f2a01f  ! 274: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5f2903f  ! 275: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbbaa030  ! 276: STDFA_I	stda	%f5, [0x0030, %r10]
	.word 0xc80a801f  ! 277: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xcc3aa038  ! 278: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcfba989f  ! 279: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 280: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL280:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfe2a01f  ! 281: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc01ae018  ! 282: LDD_I	ldd	[%r11 + 0x0018], %r0
	.word 0xcde2d11f  ! 283: CASA_I	casa	[%r11] 0x88, %r31, %r6
	.word 0xcdf2d01f  ! 284: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xc612e004  ! 285: LDUH_I	lduh	[%r11 + 0x0004], %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcf02e01c  ! 286: LDF_I	ld	[%r11, 0x001c], %f7
	.word 0xc5ba99bf  ! 287: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2901f  ! 288: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba987f  ! 289: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc4da901f  ! 290: LDXA_R	ldxa	[%r10, %r31] 0x80, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9ba98bf  ! 291: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 292: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc59aa048  ! 293: LDDFA_I	ldda	[%r10, 0x0048], %f2
	.word 0xcbf2901f  ! 294: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbf2901f  ! 295: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd0d2a038  ! 296: LDSHA_I	ldsha	[%r10, + 0x0038] %asi, %r8
	.word 0xc03ac01f  ! 297: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc402a058  ! 298: LDUW_I	lduw	[%r10 + 0x0058], %r2
	.word 0xcd9ae058  ! 299: LDDFA_I	ldda	[%r11, 0x0058], %f6
	.word 0xcc3aa040  ! 300: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdba997f  ! 301: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 302: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 303: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xca82901f  ! 304: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r5
	.word 0xd3bad85f  ! 305: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3bad93f  ! 306: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 307: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad87f  ! 308: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd2daa050  ! 309: LDXA_I	ldxa	[%r10, + 0x0050] %asi, %r9
	.word 0xc202a060  ! 310: LDUW_I	lduw	[%r10 + 0x0060], %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3bae010  ! 311: STDFA_I	stda	%f9, [0x0010, %r11]
	.word 0xc3e2901f  ! 312: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc4ca917f  ! 313: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r2
	.word 0xce92a00a  ! 314: LDUHA_I	lduha	[%r10, + 0x000a] %asi, %r7
	.word 0xc7bad83f  ! 315: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3baa008  ! 316: STDFA_I	stda	%f1, [0x0008, %r10]
	.word 0xca4aa068  ! 317: LDSB_I	ldsb	[%r10 + 0x0068], %r5
	.word 0xcbf2e01f  ! 318: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xc3baa000  ! 319: STDFA_I	stda	%f1, [0x0000, %r10]
	.word 0xce42e040  ! 320: LDSW_I	ldsw	[%r11 + 0x0040], %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd03aa050  ! 321: STD_I	std	%r8, [%r10 + 0x0050]
	.word 0xd1f2a01f  ! 322: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba993f  ! 323: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 324: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc8d2a030  ! 325: LDSHA_I	ldsha	[%r10, + 0x0030] %asi, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5ba98bf  ! 326: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd05aa048  ! 327: LDX_I	ldx	[%r10 + 0x0048], %r8
	.word 0xcfba997f  ! 328: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xccd2e060  ! 329: LDSHA_I	ldsha	[%r11, + 0x0060] %asi, %r6
	.word 0xc5bad87f  ! 330: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3baa028  ! 331: STDFA_I	stda	%f1, [0x0028, %r10]
	.word 0xc4caa025  ! 332: LDSBA_I	ldsba	[%r10, + 0x0025] %asi, %r2
	.word 0xd03a801f  ! 333: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba991f  ! 334: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce0a801f  ! 335: LDUB_R	ldub	[%r10 + %r31], %r7
TH_LABEL335:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3e2d03f  ! 336: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xc3e2d03f  ! 337: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xc9baa028  ! 338: STDFA_I	stda	%f4, [0x0028, %r10]
	.word 0xc83ae018  ! 339: STD_I	std	%r4, [%r11 + 0x0018]
	.word 0xd0d2d17f  ! 340: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcd02e03c  ! 341: LDF_I	ld	[%r11, 0x003c], %f6
	.word 0xc7ba989f  ! 342: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd052a000  ! 343: LDSH_I	ldsh	[%r10 + 0x0000], %r8
	.word 0xd2da907f  ! 344: LDXA_R	ldxa	[%r10, %r31] 0x83, %r9
	.word 0xca8ae016  ! 345: LDUBA_I	lduba	[%r11, + 0x0016] %asi, %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5baa010  ! 346: STDFA_I	stda	%f2, [0x0010, %r10]
	.word 0xd3bad91f  ! 347: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d13f  ! 348: CASA_I	casa	[%r11] 0x89, %r31, %r9
	.word 0xd03ae010  ! 349: STD_I	std	%r8, [%r11 + 0x0010]
	.word 0xd3bad93f  ! 350: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc8cad11f  ! 351: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r4
	.word 0xc9f2913f  ! 352: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9f2901f  ! 353: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc83a801f  ! 354: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 355: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9e2901f  ! 356: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc502a048  ! 357: LDF_I	ld	[%r10, 0x0048], %f2
	.word 0xc43aa000  ! 358: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc43aa000  ! 359: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xce02801f  ! 360: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5e2a01f  ! 361: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcaca905f  ! 362: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r5
	.word 0xc3ba997f  ! 363: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc6da901f  ! 364: LDXA_R	ldxa	[%r10, %r31] 0x80, %r3
	.word 0xd0cad11f  ! 365: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd03aa000  ! 366: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xc202c01f  ! 367: LDUW_R	lduw	[%r11 + %r31], %r1
	.word 0xcf9ae078  ! 368: LDDFA_I	ldda	[%r11, 0x0078], %f7
	.word 0xcdba997f  ! 369: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 370: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdf2a01f  ! 371: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba993f  ! 372: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba999f  ! 373: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcb22801f  ! 374: STF_R	st	%f5, [%r31, %r10]
	.word 0xc9ba981f  ! 375: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc492911f  ! 376: LDUHA_R	lduha	[%r10, %r31] 0x88, %r2
	.word 0xd1f2a01f  ! 377: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd102a04c  ! 378: LDF_I	ld	[%r10, 0x004c], %f8
	.word 0xd03a801f  ! 379: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc722c01f  ! 380: STF_R	st	%f3, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3ba997f  ! 381: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba995f  ! 382: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcad2a066  ! 383: LDSHA_I	ldsha	[%r10, + 0x0066] %asi, %r5
	.word 0xc8d2915f  ! 384: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r4
	.word 0xc24a801f  ! 385: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7ba995f  ! 386: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd28aa029  ! 387: LDUBA_I	lduba	[%r10, + 0x0029] %asi, %r9
	.word 0xc7ba981f  ! 388: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 389: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xcc82a004  ! 390: LDUWA_I	lduwa	[%r10, + 0x0004] %asi, %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc03ac01f  ! 391: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc85ac01f  ! 392: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xc03ac01f  ! 393: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad83f  ! 394: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc2dad01f  ! 395: LDXA_R	ldxa	[%r11, %r31] 0x80, %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcff2a01f  ! 396: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcac2911f  ! 397: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r5
	.word 0xd0caa011  ! 398: LDSBA_I	ldsba	[%r10, + 0x0011] %asi, %r8
	.word 0xc9bad8bf  ! 399: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 400: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc42e000  ! 401: LDSW_I	ldsw	[%r11 + 0x0000], %r6
	.word 0xd082e05c  ! 402: LDUWA_I	lduwa	[%r11, + 0x005c] %asi, %r8
	.word 0xc7e2d13f  ! 403: CASA_I	casa	[%r11] 0x89, %r31, %r3
	.word 0xc7f2e01f  ! 404: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc80a801f  ! 405: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdf2d13f  ! 406: CASXA_I	casxa	[%r11] 0x89, %r31, %r6
	.word 0xcdbad95f  ! 407: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd052801f  ! 408: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xd2d2a03a  ! 409: LDSHA_I	ldsha	[%r10, + 0x003a] %asi, %r9
	.word 0xcdf2e01f  ! 410: CASXA_R	casxa	[%r11]%asi, %r31, %r6
TH_LABEL410:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcdf2d11f  ! 411: CASXA_I	casxa	[%r11] 0x88, %r31, %r6
	.word 0xcdbad97f  ! 412: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad81f  ! 413: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc652c01f  ! 414: LDSH_R	ldsh	[%r11 + %r31], %r3
	.word 0xce5aa008  ! 415: LDX_I	ldx	[%r10 + 0x0008], %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5ba993f  ! 416: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xce52a030  ! 417: LDSH_I	ldsh	[%r10 + 0x0030], %r7
	.word 0xc682d07f  ! 418: LDUWA_R	lduwa	[%r11, %r31] 0x83, %r3
	.word 0xcfbad87f  ! 419: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xca0a801f  ! 420: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfba983f  ! 421: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 422: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba985f  ! 423: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 424: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc612801f  ! 425: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcac2901f  ! 426: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r5
	.word 0xc302a04c  ! 427: LDF_I	ld	[%r10, 0x004c], %f1
	.word 0xd1baa068  ! 428: STDFA_I	stda	%f8, [0x0068, %r10]
	.word 0xc3ba99bf  ! 429: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba993f  ! 430: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc8ae077  ! 431: LDUBA_I	lduba	[%r11, + 0x0077] %asi, %r6
	.word 0xc48ae001  ! 432: LDUBA_I	lduba	[%r11, + 0x0001] %asi, %r2
	.word 0xcc3a801f  ! 433: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba989f  ! 434: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 435: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc89aa050  ! 436: LDDA_I	ldda	[%r10, + 0x0050] %asi, %r4
	.word 0xc322801f  ! 437: STF_R	st	%f1, [%r31, %r10]
	.word 0xcbf2d03f  ! 438: CASXA_I	casxa	[%r11] 0x81, %r31, %r5
	.word 0xc64ac01f  ! 439: LDSB_R	ldsb	[%r11 + %r31], %r3
	.word 0xd1f2903f  ! 440: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1ba995f  ! 441: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba99bf  ! 442: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2913f  ! 443: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd1ba987f  ! 444: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa048  ! 445: STD_I	std	%r8, [%r10 + 0x0048]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd0d2915f  ! 446: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r8
	.word 0xcbbad95f  ! 447: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd20aa062  ! 448: LDUB_I	ldub	[%r10 + 0x0062], %r9
	.word 0xc9f2911f  ! 449: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba985f  ! 450: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9ba98bf  ! 451: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 452: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 453: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc302a020  ! 454: LDF_I	ld	[%r10, 0x0020], %f1
	.word 0xd3ba991f  ! 455: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xca92903f  ! 456: LDUHA_R	lduha	[%r10, %r31] 0x81, %r5
	.word 0xc8caa01a  ! 457: LDSBA_I	ldsba	[%r10, + 0x001a] %asi, %r4
	.word 0xc3ba983f  ! 458: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd25a801f  ! 459: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xc892d15f  ! 460: LDUHA_R	lduha	[%r11, %r31] 0x8a, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcd02801f  ! 461: LDF_R	ld	[%r10, %r31], %f6
	.word 0xd3f2a01f  ! 462: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba999f  ! 463: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba997f  ! 464: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcbbaa078  ! 465: STDFA_I	stda	%f5, [0x0078, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbbad9bf  ! 466: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad95f  ! 467: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d03f  ! 468: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xc692e046  ! 469: LDUHA_I	lduha	[%r11, + 0x0046] %asi, %r3
	.word 0xd03aa008  ! 470: STD_I	std	%r8, [%r10 + 0x0008]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3ba98bf  ! 471: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 472: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba993f  ! 473: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 474: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xcfbaa060  ! 475: STDFA_I	stda	%f7, [0x0060, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbe2d03f  ! 476: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xcbbae050  ! 477: STDFA_I	stda	%f5, [0x0050, %r11]
	.word 0xd3ba999f  ! 478: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 479: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd00ae07e  ! 480: LDUB_I	ldub	[%r11 + 0x007e], %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd19ae070  ! 481: LDDFA_I	ldda	[%r11, 0x0070], %f8
	.word 0xc9bad85f  ! 482: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd102c01f  ! 483: LDF_R	ld	[%r11, %r31], %f8
	.word 0xc9bad93f  ! 484: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d01f  ! 485: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc59aa020  ! 486: LDDFA_I	ldda	[%r10, 0x0020], %f2
	.word 0xc88a901f  ! 487: LDUBA_R	lduba	[%r10, %r31] 0x80, %r4
	.word 0xc2c2a078  ! 488: LDSWA_I	ldswa	[%r10, + 0x0078] %asi, %r1
	.word 0xc7ba995f  ! 489: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba983f  ! 490: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL490:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xca0a801f  ! 491: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xcbba99bf  ! 492: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcc12801f  ! 493: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xcc1a801f  ! 494: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xca8ae065  ! 495: LDUBA_I	lduba	[%r11, + 0x0065] %asi, %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3f2a01f  ! 496: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba99bf  ! 497: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 498: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3e2903f  ! 499: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd3ba983f  ! 500: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3f2a01f  ! 501: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba997f  ! 502: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2901f  ! 503: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba997f  ! 504: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce52801f  ! 505: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcde2a01f  ! 506: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcc3a801f  ! 507: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc502801f  ! 508: LDF_R	ld	[%r10, %r31], %f2
	.word 0xd202801f  ! 509: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xc412801f  ! 510: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7e2901f  ! 511: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba985f  ! 512: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa000  ! 513: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc7f2911f  ! 514: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba999f  ! 515: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL515:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7f2911f  ! 516: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xc89ae020  ! 517: LDDA_I	ldda	[%r11, + 0x0020] %asi, %r4
	.word 0xd20aa031  ! 518: LDUB_I	ldub	[%r10 + 0x0031], %r9
	.word 0xc59aa020  ! 519: LDDFA_I	ldda	[%r10, 0x0020], %f2
	.word 0xcfba987f  ! 520: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc452e04e  ! 521: LDSH_I	ldsh	[%r11 + 0x004e], %r2
	.word 0xce12a012  ! 522: LDUH_I	lduh	[%r10 + 0x0012], %r7
	.word 0xccda901f  ! 523: LDXA_R	ldxa	[%r10, %r31] 0x80, %r6
	.word 0xcfba997f  ! 524: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 525: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc502801f  ! 526: LDF_R	ld	[%r10, %r31], %f2
	.word 0xd04a801f  ! 527: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xd3ba991f  ! 528: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc252c01f  ! 529: LDSH_R	ldsh	[%r11 + %r31], %r1
	.word 0xd1e2d13f  ! 530: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc89aa020  ! 531: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r4
	.word 0xc5ba98bf  ! 532: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd092d01f  ! 533: LDUHA_R	lduha	[%r11, %r31] 0x80, %r8
	.word 0xc9bad91f  ! 534: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad8bf  ! 535: STDFA_R	stda	%f4, [%r31, %r11]
TH_LABEL535:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc59aa038  ! 536: LDDFA_I	ldda	[%r10, 0x0038], %f2
	.word 0xcbba997f  ! 537: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba985f  ! 538: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc60aa01d  ! 539: LDUB_I	ldub	[%r10 + 0x001d], %r3
	.word 0xd2da913f  ! 540: LDXA_R	ldxa	[%r10, %r31] 0x89, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfbad91f  ! 541: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xccd2a006  ! 542: LDSHA_I	ldsha	[%r10, + 0x0006] %asi, %r6
	.word 0xcb9aa010  ! 543: LDDFA_I	ldda	[%r10, 0x0010], %f5
	.word 0xc302801f  ! 544: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc412801f  ! 545: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfbad91f  ! 546: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 547: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xd01a801f  ! 548: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xd122c01f  ! 549: STF_R	st	%f8, [%r31, %r11]
	.word 0xc9ba983f  ! 550: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL550:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9e2903f  ! 551: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xcf9aa078  ! 552: LDDFA_I	ldda	[%r10, 0x0078], %f7
	.word 0xcd9aa010  ! 553: LDDFA_I	ldda	[%r10, 0x0010], %f6
	.word 0xcbba999f  ! 554: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 555: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc692a07e  ! 556: LDUHA_I	lduha	[%r10, + 0x007e] %asi, %r3
	.word 0xc5e2901f  ! 557: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba995f  ! 558: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 559: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 560: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9baa010  ! 561: STDFA_I	stda	%f4, [0x0010, %r10]
	.word 0xc9ba989f  ! 562: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa000  ! 563: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xc9ba993f  ! 564: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc2c2a008  ! 565: LDSWA_I	ldswa	[%r10, + 0x0008] %asi, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd212801f  ! 566: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xc7ba989f  ! 567: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa048  ! 568: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc7ba989f  ! 569: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 570: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7e2903f  ! 571: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba989f  ! 572: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd102e06c  ! 573: LDF_I	ld	[%r11, 0x006c], %f8
	.word 0xc9ba987f  ! 574: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 575: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9e2a01f  ! 576: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xca92e060  ! 577: LDUHA_I	lduha	[%r11, + 0x0060] %asi, %r5
	.word 0xc9e2901f  ! 578: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba985f  ! 579: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc3baa038  ! 580: STDFA_I	stda	%f1, [0x0038, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd012801f  ! 581: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xc3bad89f  ! 582: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad99f  ! 583: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad99f  ! 584: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad83f  ! 585: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc892913f  ! 586: LDUHA_R	lduha	[%r10, %r31] 0x89, %r4
	.word 0xd3bad89f  ! 587: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc8d2e06c  ! 588: LDSHA_I	ldsha	[%r11, + 0x006c] %asi, %r4
	.word 0xc202e02c  ! 589: LDUW_I	lduw	[%r11 + 0x002c], %r1
	.word 0xc3e2e01f  ! 590: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3bad81f  ! 591: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc81aa050  ! 592: LDD_I	ldd	[%r10 + 0x0050], %r4
	.word 0xc3bad8bf  ! 593: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd122801f  ! 594: STF_R	st	%f8, [%r31, %r10]
	.word 0xce4a801f  ! 595: LDSB_R	ldsb	[%r10 + %r31], %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc43ae060  ! 596: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xcc5ac01f  ! 597: LDX_R	ldx	[%r11 + %r31], %r6
	.word 0xd2dae048  ! 598: LDXA_I	ldxa	[%r11, + 0x0048] %asi, %r9
	.word 0xc39aa008  ! 599: LDDFA_I	ldda	[%r10, 0x0008], %f1
	.word 0xc612a03a  ! 600: LDUH_I	lduh	[%r10 + 0x003a], %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdbad81f  ! 601: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd012801f  ! 602: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xcc0a801f  ! 603: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xd1ba987f  ! 604: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd082915f  ! 605: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5ba995f  ! 606: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 607: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc01a801f  ! 608: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xd122801f  ! 609: STF_R	st	%f8, [%r31, %r10]
	.word 0xd1e2d03f  ! 610: CASA_I	casa	[%r11] 0x81, %r31, %r8
TH_LABEL610:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc1aa038  ! 611: LDD_I	ldd	[%r10 + 0x0038], %r6
	.word 0xc83a801f  ! 612: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba987f  ! 613: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 614: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc48a907f  ! 615: LDUBA_R	lduba	[%r10, %r31] 0x83, %r2
TH_LABEL615:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbbad85f  ! 616: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ac01f  ! 617: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad83f  ! 618: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d11f  ! 619: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xc252a012  ! 620: LDSH_I	ldsh	[%r10 + 0x0012], %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc8d2917f  ! 621: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r4
	.word 0xc41ae038  ! 622: LDD_I	ldd	[%r11 + 0x0038], %r2
	.word 0xcbba993f  ! 623: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2901f  ! 624: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xc49ae078  ! 625: LDDA_I	ldda	[%r11, + 0x0078] %asi, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd25a801f  ! 626: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xc5f2a01f  ! 627: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5f2913f  ! 628: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xc5e2903f  ! 629: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc492e024  ! 630: LDUHA_I	lduha	[%r11, + 0x0024] %asi, %r2
TH_LABEL630:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcccad11f  ! 631: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r6
	.word 0xcccad05f  ! 632: LDSBA_R	ldsba	[%r11, %r31] 0x82, %r6
	.word 0xc2c2917f  ! 633: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r1
	.word 0xc902801f  ! 634: LDF_R	ld	[%r10, %r31], %f4
	.word 0xd08aa04c  ! 635: LDUBA_I	lduba	[%r10, + 0x004c] %asi, %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc3ae040  ! 636: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xcdbad8bf  ! 637: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad93f  ! 638: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad91f  ! 639: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdf2e01f  ! 640: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc3ae040  ! 641: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xd20ae031  ! 642: LDUB_I	ldub	[%r11 + 0x0031], %r9
	.word 0xc43aa030  ! 643: STD_I	std	%r2, [%r10 + 0x0030]
	.word 0xc442801f  ! 644: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xc2caa02e  ! 645: LDSBA_I	ldsba	[%r10, + 0x002e] %asi, %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc39aa018  ! 646: LDDFA_I	ldda	[%r10, 0x0018], %f1
	.word 0xd1bad8bf  ! 647: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad89f  ! 648: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcada917f  ! 649: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r5
	.word 0xc642801f  ! 650: LDSW_R	ldsw	[%r10 + %r31], %r3
TH_LABEL650:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3e2903f  ! 651: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd3e2a01f  ! 652: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba99bf  ! 653: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2911f  ! 654: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xce4a801f  ! 655: LDSB_R	ldsb	[%r10 + %r31], %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xccc2911f  ! 656: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r6
	.word 0xcc3ac01f  ! 657: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcde2e01f  ! 658: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdbad91f  ! 659: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc892915f  ! 660: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1ba993f  ! 661: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc292d17f  ! 662: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r1
	.word 0xc7bad85f  ! 663: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xca0aa07d  ! 664: LDUB_I	ldub	[%r10 + 0x007d], %r5
	.word 0xc612a01a  ! 665: LDUH_I	lduh	[%r10 + 0x001a], %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xce0ac01f  ! 666: LDUB_R	ldub	[%r11 + %r31], %r7
	.word 0xc9ba997f  ! 667: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc88ad01f  ! 668: LDUBA_R	lduba	[%r11, %r31] 0x80, %r4
	.word 0xce82d17f  ! 669: LDUWA_R	lduwa	[%r11, %r31] 0x8b, %r7
	.word 0xc83aa070  ! 670: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbf2913f  ! 671: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xcbba99bf  ! 672: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa070  ! 673: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xcbba987f  ! 674: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2903f  ! 675: CASA_I	casa	[%r10] 0x81, %r31, %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd19ae048  ! 676: LDDFA_I	ldda	[%r11, 0x0048], %f8
	.word 0xc5bad83f  ! 677: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ac01f  ! 678: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad9bf  ! 679: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2e01f  ! 680: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5f2e01f  ! 681: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad91f  ! 682: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc89ae018  ! 683: LDDA_I	ldda	[%r11, + 0x0018] %asi, %r4
	.word 0xc43ac01f  ! 684: STD_R	std	%r2, [%r11 + %r31]
	.word 0xce8ad01f  ! 685: LDUBA_R	lduba	[%r11, %r31] 0x80, %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xceca907f  ! 686: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r7
	.word 0xc84aa033  ! 687: LDSB_I	ldsb	[%r10 + 0x0033], %r4
	.word 0xcbba983f  ! 688: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc3baa000  ! 689: STDFA_I	stda	%f1, [0x0000, %r10]
	.word 0xcbf2911f  ! 690: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbe2913f  ! 691: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xcbe2913f  ! 692: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xcbe2a01f  ! 693: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc4daa070  ! 694: LDXA_I	ldxa	[%r10, + 0x0070] %asi, %r2
	.word 0xc4ca913f  ! 695: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r2
TH_LABEL695:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xca42c01f  ! 696: LDSW_R	ldsw	[%r11 + %r31], %r5
	.word 0xc9e2d01f  ! 697: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9bad81f  ! 698: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d01f  ! 699: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9bad89f  ! 700: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9bad95f  ! 701: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc45a801f  ! 702: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xd1f2a01f  ! 703: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xc4dae078  ! 704: LDXA_I	ldxa	[%r11, + 0x0078] %asi, %r2
	.word 0xc902801f  ! 705: LDF_R	ld	[%r10, %r31], %f4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc41ae010  ! 706: LDD_I	ldd	[%r11 + 0x0010], %r2
	.word 0xcdf2a01f  ! 707: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcedad01f  ! 708: LDXA_R	ldxa	[%r11, %r31] 0x80, %r7
	.word 0xc43ac01f  ! 709: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae060  ! 710: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7bad85f  ! 711: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2d01f  ! 712: CASA_I	casa	[%r11] 0x80, %r31, %r3
	.word 0xc7bad97f  ! 713: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae060  ! 714: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xd212801f  ! 715: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdf2901f  ! 716: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xc452a06e  ! 717: LDSH_I	ldsh	[%r10 + 0x006e], %r2
	.word 0xcbba98bf  ! 718: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc852c01f  ! 719: LDSH_R	ldsh	[%r11 + %r31], %r4
	.word 0xcfe2a01f  ! 720: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc252c01f  ! 721: LDSH_R	ldsh	[%r11 + %r31], %r1
	.word 0xcfbad9bf  ! 722: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc5ac01f  ! 723: LDX_R	ldx	[%r11 + %r31], %r6
	.word 0xc9ba999f  ! 724: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd322801f  ! 725: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3ba987f  ! 726: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd01a801f  ! 727: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xcfba989f  ! 728: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc0aa04a  ! 729: LDUB_I	ldub	[%r10 + 0x004a], %r6
	.word 0xd03ae070  ! 730: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcf9ae010  ! 731: LDDFA_I	ldda	[%r11, 0x0010], %f7
	.word 0xd0dae068  ! 732: LDXA_I	ldxa	[%r11, + 0x0068] %asi, %r8
	.word 0xc83ac01f  ! 733: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc49ae000  ! 734: LDDA_I	ldda	[%r11, + 0x0000] %asi, %r2
	.word 0xc9e2913f  ! 735: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9ba993f  ! 736: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 737: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa078  ! 738: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xc39aa070  ! 739: LDDFA_I	ldda	[%r10, 0x0070], %f1
	.word 0xd1ba995f  ! 740: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL740:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7baa060  ! 741: STDFA_I	stda	%f3, [0x0060, %r10]
	.word 0xcbba995f  ! 742: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba999f  ! 743: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2911f  ! 744: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xcbf2911f  ! 745: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc83a801f  ! 746: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba987f  ! 747: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd242c01f  ! 748: LDSW_R	ldsw	[%r11 + %r31], %r9
	.word 0xcff2e01f  ! 749: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xd0caa071  ! 750: LDSBA_I	ldsba	[%r10, + 0x0071] %asi, %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3e2913f  ! 751: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc3ba991f  ! 752: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 753: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa058  ! 754: STD_I	std	%r0, [%r10 + 0x0058]
	.word 0xc3e2913f  ! 755: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc40a801f  ! 756: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xc8daa050  ! 757: LDXA_I	ldxa	[%r10, + 0x0050] %asi, %r4
	.word 0xc282903f  ! 758: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r1
	.word 0xcfba98bf  ! 759: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd302801f  ! 760: LDF_R	ld	[%r10, %r31], %f9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xce82901f  ! 761: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r7
	.word 0xd242801f  ! 762: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xc3ba991f  ! 763: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc502c01f  ! 764: LDF_R	ld	[%r11, %r31], %f2
	.word 0xc522801f  ! 765: STF_R	st	%f2, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcac2e004  ! 766: LDSWA_I	ldswa	[%r11, + 0x0004] %asi, %r5
	.word 0xc83a801f  ! 767: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba98bf  ! 768: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 769: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba997f  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc83aa038  ! 771: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xc9f2a01f  ! 772: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba981f  ! 773: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd102c01f  ! 774: LDF_R	ld	[%r11, %r31], %f8
	.word 0xd3ba98bf  ! 775: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc702a058  ! 776: LDF_I	ld	[%r10, 0x0058], %f3
	.word 0xca92d01f  ! 777: LDUHA_R	lduha	[%r11, %r31] 0x80, %r5
	.word 0xc702a034  ! 778: LDF_I	ld	[%r10, 0x0034], %f3
	.word 0xc252801f  ! 779: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xc3ba989f  ! 780: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL780:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xccc2e07c  ! 781: LDSWA_I	ldswa	[%r11, + 0x007c] %asi, %r6
	.word 0xc5e2901f  ! 782: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba993f  ! 783: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2901f  ! 784: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc43aa018  ! 785: STD_I	std	%r2, [%r10 + 0x0018]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc81aa010  ! 786: LDD_I	ldd	[%r10 + 0x0010], %r4
	.word 0xd03ae050  ! 787: STD_I	std	%r8, [%r11 + 0x0050]
	.word 0xc99aa060  ! 788: LDDFA_I	ldda	[%r10, 0x0060], %f4
	.word 0xd1ba985f  ! 789: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc65a801f  ! 790: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3ba983f  ! 791: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xca8ad13f  ! 792: LDUBA_R	lduba	[%r11, %r31] 0x89, %r5
	.word 0xd3f2a01f  ! 793: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba987f  ! 794: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 795: STD_R	std	%r8, [%r10 + %r31]
TH_LABEL795:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xce0aa046  ! 796: LDUB_I	ldub	[%r10 + 0x0046], %r7
	.word 0xd1ba985f  ! 797: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2913f  ! 798: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd1ba98bf  ! 799: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 800: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xca02e000  ! 801: LDUW_I	lduw	[%r11 + 0x0000], %r5
	.word 0xc9ba983f  ! 802: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc682901f  ! 803: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r3
	.word 0xcc1aa048  ! 804: LDD_I	ldd	[%r10 + 0x0048], %r6
	.word 0xcc3a801f  ! 805: STD_R	std	%r6, [%r10 + %r31]
TH_LABEL805:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc3a801f  ! 806: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2903f  ! 807: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xcdba985f  ! 808: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 809: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba999f  ! 810: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc3a801f  ! 811: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba985f  ! 812: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa010  ! 813: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcc3aa010  ! 814: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xc922801f  ! 815: STF_R	st	%f4, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9ba997f  ! 816: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc39aa038  ! 817: LDDFA_I	ldda	[%r10, 0x0038], %f1
	.word 0xcdbad87f  ! 818: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad97f  ! 819: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2e01f  ! 820: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcde2d01f  ! 821: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xcb02c01f  ! 822: LDF_R	ld	[%r11, %r31], %f5
	.word 0xc83a801f  ! 823: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcaca905f  ! 824: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r5
	.word 0xc9bad91f  ! 825: STDFA_R	stda	%f4, [%r31, %r11]
TH_LABEL825:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc83ac01f  ! 826: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcd22801f  ! 827: STF_R	st	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 828: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc2c2901f  ! 829: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r1
	.word 0xc9bad93f  ! 830: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc252a00a  ! 831: LDSH_I	ldsh	[%r10 + 0x000a], %r1
	.word 0xcfbaa010  ! 832: STDFA_I	stda	%f7, [0x0010, %r10]
	.word 0xcbe2a01f  ! 833: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbe2a01f  ! 834: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc902a038  ! 835: LDF_I	ld	[%r10, 0x0038], %f4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3ba997f  ! 836: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc412a046  ! 837: LDUH_I	lduh	[%r10 + 0x0046], %r2
	.word 0xd09aa048  ! 838: LDDA_I	ldda	[%r10, + 0x0048] %asi, %r8
	.word 0xd3bad8bf  ! 839: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae000  ! 840: STD_I	std	%r8, [%r11 + 0x0000]
TH_LABEL840:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3bad97f  ! 841: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 842: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd1bae048  ! 843: STDFA_I	stda	%f8, [0x0048, %r11]
	.word 0xc83ac01f  ! 844: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc6d2d11f  ! 845: LDSHA_R	ldsha	[%r11, %r31] 0x88, %r3
TH_LABEL845:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xccdaa060  ! 846: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r6
	.word 0xd03ae048  ! 847: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xd3f2e01f  ! 848: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2d03f  ! 849: CASA_I	casa	[%r11] 0x81, %r31, %r9
	.word 0xd3f2e01f  ! 850: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc402801f  ! 851: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xc3ba985f  ! 852: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 853: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2903f  ! 854: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba99bf  ! 855: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcf9aa000  ! 856: LDDFA_I	ldda	[%r10, 0x0000], %f7
	.word 0xcfba987f  ! 857: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca52a074  ! 858: LDSH_I	ldsh	[%r10 + 0x0074], %r5
	.word 0xd0c2917f  ! 859: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r8
	.word 0xd302e000  ! 860: LDF_I	ld	[%r11, 0x0000], %f9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdba999f  ! 861: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcb9aa078  ! 862: LDDFA_I	ldda	[%r10, 0x0078], %f5
	.word 0xcfe2a01f  ! 863: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba985f  ! 864: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 865: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc3aa020  ! 866: STD_I	std	%r6, [%r10 + 0x0020]
	.word 0xcfe2a01f  ! 867: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc922c01f  ! 868: STF_R	st	%f4, [%r31, %r11]
	.word 0xc322801f  ! 869: STF_R	st	%f1, [%r31, %r10]
	.word 0xc5f2d11f  ! 870: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5e2d01f  ! 871: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xc43ac01f  ! 872: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad89f  ! 873: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcc5aa028  ! 874: LDX_I	ldx	[%r10 + 0x0028], %r6
	.word 0xcfbaa078  ! 875: STDFA_I	stda	%f7, [0x0078, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xca8aa056  ! 876: LDUBA_I	lduba	[%r10, + 0x0056] %asi, %r5
	.word 0xc5bad81f  ! 877: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcb9aa030  ! 878: LDDFA_I	ldda	[%r10, 0x0030], %f5
	.word 0xcdf2d01f  ! 879: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xc6d2a07e  ! 880: LDSHA_I	ldsha	[%r10, + 0x007e] %asi, %r3
TH_LABEL880:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5f2901f  ! 881: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2a01f  ! 882: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba995f  ! 883: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba99bf  ! 884: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcd9aa030  ! 885: LDDFA_I	ldda	[%r10, 0x0030], %f6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc902e010  ! 886: LDF_I	ld	[%r11, 0x0010], %f4
	.word 0xc3f2e01f  ! 887: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3f2e01f  ! 888: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad85f  ! 889: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcc52801f  ! 890: LDSH_R	ldsh	[%r10 + %r31], %r6
TH_LABEL890:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc8d2901f  ! 891: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r4
	.word 0xd1ba99bf  ! 892: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba997f  ! 893: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 894: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba987f  ! 895: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd03aa028  ! 896: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd1ba995f  ! 897: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 898: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd302801f  ! 899: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd302a004  ! 900: LDF_I	ld	[%r10, 0x0004], %f9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5bae048  ! 901: STDFA_I	stda	%f2, [0x0048, %r11]
	.word 0xd052e01e  ! 902: LDSH_I	ldsh	[%r11 + 0x001e], %r8
	.word 0xca12801f  ! 903: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xd082e028  ! 904: LDUWA_I	lduwa	[%r11, + 0x0028] %asi, %r8
	.word 0xd19aa068  ! 905: LDDFA_I	ldda	[%r10, 0x0068], %f8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7f2d03f  ! 906: CASXA_I	casxa	[%r11] 0x81, %r31, %r3
	.word 0xcb02801f  ! 907: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc44aa02c  ! 908: LDSB_I	ldsb	[%r10 + 0x002c], %r2
	.word 0xc64aa06b  ! 909: LDSB_I	ldsb	[%r10 + 0x006b], %r3
	.word 0xc83aa008  ! 910: STD_I	std	%r4, [%r10 + 0x0008]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd302a020  ! 911: LDF_I	ld	[%r10, 0x0020], %f9
	.word 0xd302e00c  ! 912: LDF_I	ld	[%r11, 0x000c], %f9
	.word 0xc3e2a01f  ! 913: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3f2901f  ! 914: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3f2a01f  ! 915: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3ba98bf  ! 916: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 917: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc602c01f  ! 918: LDUW_R	lduw	[%r11 + %r31], %r3
	.word 0xcf9aa078  ! 919: LDDFA_I	ldda	[%r10, 0x0078], %f7
	.word 0xc6d2905f  ! 920: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r3
TH_LABEL920:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd03aa010  ! 921: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1e2903f  ! 922: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd1ba995f  ! 923: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2913f  ! 924: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xd03aa010  ! 925: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc52c01f  ! 926: LDSH_R	ldsh	[%r11 + %r31], %r6
	.word 0xc3e2e01f  ! 927: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xcec2a008  ! 928: LDSWA_I	ldswa	[%r10, + 0x0008] %asi, %r7
	.word 0xc7bad9bf  ! 929: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd2c2d17f  ! 930: LDSWA_R	ldswa	[%r11, %r31] 0x8b, %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5baa078  ! 931: STDFA_I	stda	%f2, [0x0078, %r10]
	.word 0xcde2a01f  ! 932: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2911f  ! 933: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcdba987f  ! 934: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa070  ! 935: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc3aa070  ! 936: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xcfbaa070  ! 937: STDFA_I	stda	%f7, [0x0070, %r10]
	.word 0xccca907f  ! 938: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r6
	.word 0xcb9ae040  ! 939: LDDFA_I	ldda	[%r11, 0x0040], %f5
	.word 0xca92901f  ! 940: LDUHA_R	lduha	[%r10, %r31] 0x80, %r5
TH_LABEL940:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3baa008  ! 941: STDFA_I	stda	%f1, [0x0008, %r10]
	.word 0xc202801f  ! 942: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xd1ba997f  ! 943: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 944: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba981f  ! 945: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL945:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1ba983f  ! 946: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2901f  ! 947: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xcec2d03f  ! 948: LDSWA_R	ldswa	[%r11, %r31] 0x81, %r7
	.word 0xd302c01f  ! 949: LDF_R	ld	[%r11, %r31], %f9
	.word 0xd3e2911f  ! 950: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xccd2a05e  ! 951: LDSHA_I	ldsha	[%r10, + 0x005e] %asi, %r6
	.word 0xc43ae028  ! 952: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc43ac01f  ! 953: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc302a02c  ! 954: LDF_I	ld	[%r10, 0x002c], %f1
	.word 0xcfbaa008  ! 955: STDFA_I	stda	%f7, [0x0008, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc92d17f  ! 956: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r6
	.word 0xc3ba991f  ! 957: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa008  ! 958: STD_I	std	%r0, [%r10 + 0x0008]
	.word 0xcfbaa040  ! 959: STDFA_I	stda	%f7, [0x0040, %r10]
	.word 0xcfba995f  ! 960: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xca0aa013  ! 961: LDUB_I	ldub	[%r10 + 0x0013], %r5
	.word 0xc85ae070  ! 962: LDX_I	ldx	[%r11 + 0x0070], %r4
	.word 0xcbbad87f  ! 963: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd002c01f  ! 964: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xd1ba98bf  ! 965: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd03aa030  ! 966: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xd1ba991f  ! 967: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcb02a00c  ! 968: LDF_I	ld	[%r10, 0x000c], %f5
	.word 0xc3bad81f  ! 969: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad89f  ! 970: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc59ae028  ! 971: LDDFA_I	ldda	[%r11, 0x0028], %f2
	.word 0xd3ba985f  ! 972: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 973: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xcaca911f  ! 974: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r5
	.word 0xc81aa018  ! 975: LDD_I	ldd	[%r10 + 0x0018], %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd2c2903f  ! 976: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r9
	.word 0xc442a040  ! 977: LDSW_I	ldsw	[%r10 + 0x0040], %r2
	.word 0xcac2d07f  ! 978: LDSWA_R	ldswa	[%r11, %r31] 0x83, %r5
	.word 0xd0da905f  ! 979: LDXA_R	ldxa	[%r10, %r31] 0x82, %r8
	.word 0xcc3aa030  ! 980: STD_I	std	%r6, [%r10 + 0x0030]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc3aa030  ! 981: STD_I	std	%r6, [%r10 + 0x0030]
	.word 0xc64a801f  ! 982: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xc7e2913f  ! 983: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xce0aa047  ! 984: LDUB_I	ldub	[%r10 + 0x0047], %r7
	.word 0xc60ae074  ! 985: LDUB_I	ldub	[%r11 + 0x0074], %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7f2a01f  ! 986: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba987f  ! 987: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xca8aa03b  ! 988: LDUBA_I	lduba	[%r10, + 0x003b] %asi, %r5
	.word 0xcd02a05c  ! 989: LDF_I	ld	[%r10, 0x005c], %f6
	.word 0xcff2a01f  ! 990: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc3a801f  ! 991: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba995f  ! 992: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc64aa058  ! 993: LDSB_I	ldsb	[%r10 + 0x0058], %r3
	.word 0xc9bad81f  ! 994: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad99f  ! 995: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc99aa048  ! 996: LDDFA_I	ldda	[%r10, 0x0048], %f4
	.word 0xc6c2e004  ! 997: LDSWA_I	ldswa	[%r11, + 0x0004] %asi, %r3
	.word 0xcfbad93f  ! 998: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd3baa058  ! 999: STDFA_I	stda	%f9, [0x0058, %r10]
	.word 0xc03a801f  ! 1000: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	subcc %r30, 1, %r30
	bnz  TH2_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	add	%g0,	0x1,	%r30
TH1_LOOP_START:
	.word 0xc5ba983f  ! 1: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd082a044  ! 2: LDUWA_I	lduwa	[%r10, + 0x0044] %asi, %r8
	.word 0xc602e010  ! 3: LDUW_I	lduw	[%r11 + 0x0010], %r3
	.word 0xc85a801f  ! 4: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xcde2e01f  ! 5: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdbad93f  ! 6: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc2d2903f  ! 7: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r1
	.word 0xc9e2903f  ! 8: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xd042a034  ! 9: LDSW_I	ldsw	[%r10 + 0x0034], %r8
	.word 0xc48aa05e  ! 10: LDUBA_I	lduba	[%r10, + 0x005e] %asi, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc89aa068  ! 11: LDDA_I	ldda	[%r10, + 0x0068] %asi, %r4
	.word 0xcb02a04c  ! 12: LDF_I	ld	[%r10, 0x004c], %f5
	.word 0xc3ba991f  ! 13: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 14: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba995f  ! 15: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcccae069  ! 16: LDSBA_I	ldsba	[%r11, + 0x0069] %asi, %r6
	.word 0xce8aa023  ! 17: LDUBA_I	lduba	[%r10, + 0x0023] %asi, %r7
	.word 0xcdf2a01f  ! 18: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2903f  ! 19: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xcdba983f  ! 20: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdba99bf  ! 21: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 22: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xce82d13f  ! 23: LDUWA_R	lduwa	[%r11, %r31] 0x89, %r7
	.word 0xd3ba989f  ! 24: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 25: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7baa030  ! 26: STDFA_I	stda	%f3, [0x0030, %r10]
	.word 0xd1e2e01f  ! 27: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xc522801f  ! 28: STF_R	st	%f2, [%r31, %r10]
	.word 0xc9bad87f  ! 29: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad95f  ! 30: STDFA_R	stda	%f4, [%r31, %r11]
TH_LABEL30:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9e2e01f  ! 31: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xcbbaa018  ! 32: STDFA_I	stda	%f5, [0x0018, %r10]
	.word 0xcdba99bf  ! 33: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 34: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba991f  ! 35: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc3aa028  ! 36: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xcc3a801f  ! 37: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2913f  ! 38: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcdba985f  ! 39: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2913f  ! 40: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc41aa018  ! 41: LDD_I	ldd	[%r10 + 0x0018], %r2
	.word 0xc5f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2a01f  ! 43: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcdbaa030  ! 44: STDFA_I	stda	%f6, [0x0030, %r10]
	.word 0xcbe2e01f  ! 45: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcada903f  ! 46: LDXA_R	ldxa	[%r10, %r31] 0x81, %r5
	.word 0xd1ba995f  ! 47: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 48: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1f2a01f  ! 49: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba991f  ! 50: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1bae008  ! 51: STDFA_I	stda	%f8, [0x0008, %r11]
	.word 0xc68ae02f  ! 52: LDUBA_I	lduba	[%r11, + 0x002f] %asi, %r3
	.word 0xc28a907f  ! 53: LDUBA_R	lduba	[%r10, %r31] 0x83, %r1
	.word 0xcb9aa000  ! 54: LDDFA_I	ldda	[%r10, 0x0000], %f5
	.word 0xc03ac01f  ! 55: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc682a02c  ! 56: LDUWA_I	lduwa	[%r10, + 0x002c] %asi, %r3
	.word 0xc9bad89f  ! 57: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 58: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcfbaa010  ! 59: STDFA_I	stda	%f7, [0x0010, %r10]
	.word 0xc502801f  ! 60: LDF_R	ld	[%r10, %r31], %f2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3ba981f  ! 61: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc8c2d03f  ! 62: LDSWA_R	ldswa	[%r11, %r31] 0x81, %r4
	.word 0xc202801f  ! 63: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xc5ba981f  ! 64: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5baa000  ! 65: STDFA_I	stda	%f2, [0x0000, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1f2e01f  ! 66: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd03ac01f  ! 67: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad93f  ! 68: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae048  ! 69: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xd012c01f  ! 70: LDUH_R	lduh	[%r11 + %r31], %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc442a064  ! 71: LDSW_I	ldsw	[%r10 + 0x0064], %r2
	.word 0xd01a801f  ! 72: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xd012801f  ! 73: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xc9f2e01f  ! 74: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc702801f  ! 75: LDF_R	ld	[%r10, %r31], %f3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbba991f  ! 76: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc302801f  ! 77: LDF_R	ld	[%r10, %r31], %f1
	.word 0xd3baa068  ! 78: STDFA_I	stda	%f9, [0x0068, %r10]
	.word 0xcbbad91f  ! 79: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcd22c01f  ! 80: STF_R	st	%f6, [%r31, %r11]
TH_LABEL80:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc892901f  ! 81: LDUHA_R	lduha	[%r10, %r31] 0x80, %r4
	.word 0xd3bad97f  ! 82: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 83: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad8bf  ! 84: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad91f  ! 85: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd19ae070  ! 86: LDDFA_I	ldda	[%r11, 0x0070], %f8
	.word 0xc3f2d03f  ! 87: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xc3e2d13f  ! 88: CASA_I	casa	[%r11] 0x89, %r31, %r1
	.word 0xc882901f  ! 89: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r4
	.word 0xcf9ae058  ! 90: LDDFA_I	ldda	[%r11, 0x0058], %f7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc83aa070  ! 91: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xc9baa028  ! 92: STDFA_I	stda	%f4, [0x0028, %r10]
	.word 0xc3ba991f  ! 93: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcbbae030  ! 94: STDFA_I	stda	%f5, [0x0030, %r11]
	.word 0xcc3a801f  ! 95: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc3a801f  ! 96: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 97: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba995f  ! 98: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba99bf  ! 99: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc1ae058  ! 100: LDD_I	ldd	[%r11 + 0x0058], %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5bad87f  ! 101: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad83f  ! 102: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc44ac01f  ! 103: LDSB_R	ldsb	[%r11 + %r31], %r2
	.word 0xcc52a064  ! 104: LDSH_I	ldsh	[%r10 + 0x0064], %r6
	.word 0xd3f2e01f  ! 105: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3f2e01f  ! 106: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xc4dad13f  ! 107: LDXA_R	ldxa	[%r11, %r31] 0x89, %r2
	.word 0xcfba999f  ! 108: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 109: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc42a008  ! 110: LDSW_I	ldsw	[%r10 + 0x0008], %r6
TH_LABEL110:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc8daa018  ! 111: LDXA_I	ldxa	[%r10, + 0x0018] %asi, %r4
	.word 0xc9bae048  ! 112: STDFA_I	stda	%f4, [0x0048, %r11]
	.word 0xc9f2901f  ! 113: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc64ac01f  ! 114: LDSB_R	ldsb	[%r11 + %r31], %r3
	.word 0xc9f2901f  ! 115: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9e2911f  ! 116: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc9e2901f  ! 117: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba989f  ! 118: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 119: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba983f  ! 120: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9e2911f  ! 121: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc84aa01a  ! 122: LDSB_I	ldsb	[%r10 + 0x001a], %r4
	.word 0xcdbad9bf  ! 123: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd0dae010  ! 124: LDXA_I	ldxa	[%r11, + 0x0010] %asi, %r8
	.word 0xd03ac01f  ! 125: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1bad8bf  ! 126: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 127: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcc1aa058  ! 128: LDD_I	ldd	[%r10 + 0x0058], %r6
	.word 0xd3ba985f  ! 129: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 130: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc202801f  ! 131: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xc3ba989f  ! 132: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc79ae028  ! 133: LDDFA_I	ldda	[%r11, 0x0028], %f3
	.word 0xcfba98bf  ! 134: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc3baa028  ! 135: STDFA_I	stda	%f1, [0x0028, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5ba983f  ! 136: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2913f  ! 137: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc6ca901f  ! 138: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r3
	.word 0xcdf2a01f  ! 139: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba983f  ! 140: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xce82a068  ! 141: LDUWA_I	lduwa	[%r10, + 0x0068] %asi, %r7
	.word 0xd2ca901f  ! 142: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r9
	.word 0xc3f2e01f  ! 143: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc64ac01f  ! 144: LDSB_R	ldsb	[%r11 + %r31], %r3
	.word 0xc2daa038  ! 145: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5e2a01f  ! 146: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xd302e000  ! 147: LDF_I	ld	[%r11, 0x0000], %f9
	.word 0xc3ba983f  ! 148: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2903f  ! 149: CASXA_I	casxa	[%r10] 0x81, %r31, %r1
	.word 0xc3e2a01f  ! 150: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd2c2901f  ! 151: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r9
	.word 0xc5e2e01f  ! 152: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xd202a058  ! 153: LDUW_I	lduw	[%r10 + 0x0058], %r9
	.word 0xc7ba981f  ! 154: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 155: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7ba997f  ! 156: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 157: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xd39aa028  ! 158: LDDFA_I	ldda	[%r10, 0x0028], %f9
	.word 0xd3baa050  ! 159: STDFA_I	stda	%f9, [0x0050, %r10]
	.word 0xc812e04e  ! 160: LDUH_I	lduh	[%r11 + 0x004e], %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcaca917f  ! 161: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r5
	.word 0xc3bad91f  ! 162: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 163: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3e2e01f  ! 164: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2e01f  ! 165: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcb02801f  ! 166: LDF_R	ld	[%r10, %r31], %f5
	.word 0xce92913f  ! 167: LDUHA_R	lduha	[%r10, %r31] 0x89, %r7
	.word 0xd3baa028  ! 168: STDFA_I	stda	%f9, [0x0028, %r10]
	.word 0xc81a801f  ! 169: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc5e2e01f  ! 170: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd19aa050  ! 171: LDDFA_I	ldda	[%r10, 0x0050], %f8
	.word 0xd3bad99f  ! 172: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 173: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xc39aa048  ! 174: LDDFA_I	ldda	[%r10, 0x0048], %f1
	.word 0xcbbad87f  ! 175: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbbad85f  ! 176: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbaa018  ! 177: STDFA_I	stda	%f5, [0x0018, %r10]
	.word 0xc9ba993f  ! 178: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc642a068  ! 179: LDSW_I	ldsw	[%r10 + 0x0068], %r3
	.word 0xc922c01f  ! 180: STF_R	st	%f4, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfbad89f  ! 181: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc4d2e068  ! 182: LDSHA_I	ldsha	[%r11, + 0x0068] %asi, %r2
	.word 0xd05ae028  ! 183: LDX_I	ldx	[%r11 + 0x0028], %r8
	.word 0xcecad05f  ! 184: LDSBA_R	ldsba	[%r11, %r31] 0x82, %r7
	.word 0xc7e2e01f  ! 185: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd25a801f  ! 186: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xc3bad83f  ! 187: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd2da901f  ! 188: LDXA_R	ldxa	[%r10, %r31] 0x80, %r9
	.word 0xc3e2903f  ! 189: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc6d2917f  ! 190: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9bad95f  ! 191: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc20ae02b  ! 192: LDUB_I	ldub	[%r11 + 0x002b], %r1
	.word 0xcfbad87f  ! 193: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xca4a801f  ! 194: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xc85a801f  ! 195: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc59aa060  ! 196: LDDFA_I	ldda	[%r10, 0x0060], %f2
	.word 0xcdbaa018  ! 197: STDFA_I	stda	%f6, [0x0018, %r10]
	.word 0xce5ae068  ! 198: LDX_I	ldx	[%r11 + 0x0068], %r7
	.word 0xce4ae04b  ! 199: LDSB_I	ldsb	[%r11 + 0x004b], %r7
	.word 0xc9e2d01f  ! 200: CASA_I	casa	[%r11] 0x80, %r31, %r4
TH_LABEL200:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xce5ac01f  ! 201: LDX_R	ldx	[%r11 + %r31], %r7
	.word 0xc5e2a01f  ! 202: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xd3bae068  ! 203: STDFA_I	stda	%f9, [0x0068, %r11]
	.word 0xc5ba981f  ! 204: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcf9aa058  ! 205: LDDFA_I	ldda	[%r10, 0x0058], %f7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc25aa070  ! 206: LDX_I	ldx	[%r10 + 0x0070], %r1
	.word 0xd01a801f  ! 207: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xc812c01f  ! 208: LDUH_R	lduh	[%r11 + %r31], %r4
	.word 0xd102801f  ! 209: LDF_R	ld	[%r10, %r31], %f8
	.word 0xcd9ae008  ! 210: LDDFA_I	ldda	[%r11, 0x0008], %f6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdba995f  ! 211: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc502c01f  ! 212: LDF_R	ld	[%r11, %r31], %f2
	.word 0xc7bad87f  ! 213: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc652a054  ! 214: LDSH_I	ldsh	[%r10 + 0x0054], %r3
	.word 0xc5f2a01f  ! 215: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5ba99bf  ! 216: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 217: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 218: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd20ac01f  ! 219: LDUB_R	ldub	[%r11 + %r31], %r9
	.word 0xc45aa058  ! 220: LDX_I	ldx	[%r10 + 0x0058], %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3e2903f  ! 221: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd03a801f  ! 222: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc65a801f  ! 223: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xc5e2a01f  ! 224: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xd282907f  ! 225: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r9
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc8c2d03f  ! 226: LDSWA_R	ldswa	[%r11, %r31] 0x81, %r4
	.word 0xd3ba987f  ! 227: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 228: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 229: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 230: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd03aa010  ! 231: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd3e2a01f  ! 232: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 233: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba987f  ! 234: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa010  ! 235: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd03a801f  ! 236: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc6d2903f  ! 237: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r3
	.word 0xc722801f  ! 238: STF_R	st	%f3, [%r31, %r10]
	.word 0xcfba995f  ! 239: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcb02c01f  ! 240: LDF_R	ld	[%r11, %r31], %f5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc43aa010  ! 241: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xc302a024  ! 242: LDF_I	ld	[%r10, 0x0024], %f1
	.word 0xc502801f  ! 243: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc48a903f  ! 244: LDUBA_R	lduba	[%r10, %r31] 0x81, %r2
	.word 0xd03aa038  ! 245: STD_I	std	%r8, [%r10 + 0x0038]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3ba981f  ! 246: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 247: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 248: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd082d15f  ! 249: LDUWA_R	lduwa	[%r11, %r31] 0x8a, %r8
	.word 0xcbba985f  ! 250: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbba985f  ! 251: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa038  ! 252: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xc80aa04e  ! 253: LDUB_I	ldub	[%r10 + 0x004e], %r4
	.word 0xd3ba989f  ! 254: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 255: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3f2a01f  ! 256: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03aa058  ! 257: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3ba989f  ! 258: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd042801f  ! 259: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xc60aa02d  ! 260: LDUB_I	ldub	[%r10 + 0x002d], %r3
TH_LABEL260:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1bad99f  ! 261: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 262: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad89f  ! 263: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xccc2d01f  ! 264: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r6
	.word 0xc7e2a01f  ! 265: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7ba99bf  ! 266: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 267: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 268: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcaca915f  ! 269: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r5
	.word 0xc39ae058  ! 270: LDDFA_I	ldda	[%r11, 0x0058], %f1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc41aa040  ! 271: LDD_I	ldd	[%r10 + 0x0040], %r2
	.word 0xccd2a04a  ! 272: LDSHA_I	ldsha	[%r10, + 0x004a] %asi, %r6
	.word 0xc43aa058  ! 273: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc5f2a01f  ! 274: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5f2901f  ! 275: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbbae018  ! 276: STDFA_I	stda	%f5, [0x0018, %r11]
	.word 0xca0a801f  ! 277: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xcc3aa038  ! 278: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcfba985f  ! 279: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba99bf  ! 280: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfe2a01f  ! 281: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc41aa058  ! 282: LDD_I	ldd	[%r10 + 0x0058], %r2
	.word 0xcde2d01f  ! 283: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xcdf2d03f  ! 284: CASXA_I	casxa	[%r11] 0x81, %r31, %r6
	.word 0xc212a064  ! 285: LDUH_I	lduh	[%r10 + 0x0064], %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd102e000  ! 286: LDF_I	ld	[%r11, 0x0000], %f8
	.word 0xc5ba99bf  ! 287: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2901f  ! 288: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba981f  ! 289: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xccda903f  ! 290: LDXA_R	ldxa	[%r10, %r31] 0x81, %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9ba983f  ! 291: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 292: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc59ae008  ! 293: LDDFA_I	ldda	[%r11, 0x0008], %f2
	.word 0xcbf2901f  ! 294: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbf2903f  ! 295: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd0d2e00e  ! 296: LDSHA_I	ldsha	[%r11, + 0x000e] %asi, %r8
	.word 0xc03ac01f  ! 297: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc602e000  ! 298: LDUW_I	lduw	[%r11 + 0x0000], %r3
	.word 0xcd9aa050  ! 299: LDDFA_I	ldda	[%r10, 0x0050], %f6
	.word 0xcc3aa040  ! 300: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdba991f  ! 301: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 302: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 303: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xd282903f  ! 304: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r9
	.word 0xd3bad99f  ! 305: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3bad81f  ! 306: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 307: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad9bf  ! 308: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc4dae048  ! 309: LDXA_I	ldxa	[%r11, + 0x0048] %asi, %r2
	.word 0xd002a068  ! 310: LDUW_I	lduw	[%r10 + 0x0068], %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1bae030  ! 311: STDFA_I	stda	%f8, [0x0030, %r11]
	.word 0xc3e2913f  ! 312: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xd2ca917f  ! 313: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r9
	.word 0xc292e028  ! 314: LDUHA_I	lduha	[%r11, + 0x0028] %asi, %r1
	.word 0xc7bad8bf  ! 315: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3baa008  ! 316: STDFA_I	stda	%f9, [0x0008, %r10]
	.word 0xd24aa004  ! 317: LDSB_I	ldsb	[%r10 + 0x0004], %r9
	.word 0xcbf2e01f  ! 318: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xc9baa068  ! 319: STDFA_I	stda	%f4, [0x0068, %r10]
	.word 0xc642a060  ! 320: LDSW_I	ldsw	[%r10 + 0x0060], %r3
TH_LABEL320:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd03aa050  ! 321: STD_I	std	%r8, [%r10 + 0x0050]
	.word 0xd1f2a01f  ! 322: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba981f  ! 323: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba983f  ! 324: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc8d2a076  ! 325: LDSHA_I	ldsha	[%r10, + 0x0076] %asi, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5ba987f  ! 326: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc5aa020  ! 327: LDX_I	ldx	[%r10 + 0x0020], %r6
	.word 0xcfba983f  ! 328: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc6d2e006  ! 329: LDSHA_I	ldsha	[%r11, + 0x0006] %asi, %r3
	.word 0xc5bad83f  ! 330: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9baa078  ! 331: STDFA_I	stda	%f4, [0x0078, %r10]
	.word 0xd2cae02f  ! 332: LDSBA_I	ldsba	[%r11, + 0x002f] %asi, %r9
	.word 0xd03a801f  ! 333: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba987f  ! 334: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd00a801f  ! 335: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3e2d11f  ! 336: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xc3e2d01f  ! 337: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc5baa040  ! 338: STDFA_I	stda	%f2, [0x0040, %r10]
	.word 0xc83ae018  ! 339: STD_I	std	%r4, [%r11 + 0x0018]
	.word 0xced2911f  ! 340: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r7
TH_LABEL340:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc902a030  ! 341: LDF_I	ld	[%r10, 0x0030], %f4
	.word 0xc7ba983f  ! 342: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xca52a006  ! 343: LDSH_I	ldsh	[%r10 + 0x0006], %r5
	.word 0xc8da901f  ! 344: LDXA_R	ldxa	[%r10, %r31] 0x80, %r4
	.word 0xc68aa06a  ! 345: LDUBA_I	lduba	[%r10, + 0x006a] %asi, %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1baa000  ! 346: STDFA_I	stda	%f8, [0x0000, %r10]
	.word 0xd3bad85f  ! 347: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d01f  ! 348: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd03ae010  ! 349: STD_I	std	%r8, [%r11 + 0x0010]
	.word 0xd3bad8bf  ! 350: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcccad11f  ! 351: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r6
	.word 0xc9f2901f  ! 352: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2903f  ! 353: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc83a801f  ! 354: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 355: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9e2903f  ! 356: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xcb02e02c  ! 357: LDF_I	ld	[%r11, 0x002c], %f5
	.word 0xc43aa000  ! 358: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc43aa000  ! 359: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xca02801f  ! 360: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5e2a01f  ! 361: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc8ca905f  ! 362: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r4
	.word 0xc3ba997f  ! 363: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc8da901f  ! 364: LDXA_R	ldxa	[%r10, %r31] 0x80, %r4
	.word 0xc2cad17f  ! 365: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd03aa000  ! 366: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xc402801f  ! 367: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xc39ae018  ! 368: LDDFA_I	ldda	[%r11, 0x0018], %f1
	.word 0xcdba997f  ! 369: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 370: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdf2a01f  ! 371: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba997f  ! 372: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba997f  ! 373: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcd22801f  ! 374: STF_R	st	%f6, [%r31, %r10]
	.word 0xc9ba985f  ! 375: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc692915f  ! 376: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r3
	.word 0xd1f2a01f  ! 377: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd302e004  ! 378: LDF_I	ld	[%r11, 0x0004], %f9
	.word 0xd03a801f  ! 379: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc922801f  ! 380: STF_R	st	%f4, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3ba995f  ! 381: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba995f  ! 382: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xccd2a05a  ! 383: LDSHA_I	ldsha	[%r10, + 0x005a] %asi, %r6
	.word 0xccd2907f  ! 384: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r6
	.word 0xd04a801f  ! 385: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7ba995f  ! 386: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc48ae06e  ! 387: LDUBA_I	lduba	[%r11, + 0x006e] %asi, %r2
	.word 0xc7ba989f  ! 388: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 389: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc682a000  ! 390: LDUWA_I	lduwa	[%r10, + 0x0000] %asi, %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc03ac01f  ! 391: STD_R	std	%r0, [%r11 + %r31]
	.word 0xd05ac01f  ! 392: LDX_R	ldx	[%r11 + %r31], %r8
	.word 0xc03ac01f  ! 393: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad95f  ! 394: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd2dad01f  ! 395: LDXA_R	ldxa	[%r11, %r31] 0x80, %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcff2a01f  ! 396: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xd0c2903f  ! 397: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r8
	.word 0xc8caa02b  ! 398: LDSBA_I	ldsba	[%r10, + 0x002b] %asi, %r4
	.word 0xc9bad93f  ! 399: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 400: CASA_R	casa	[%r11] %asi, %r31, %r4
TH_LABEL400:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc242a06c  ! 401: LDSW_I	ldsw	[%r10 + 0x006c], %r1
	.word 0xce82a064  ! 402: LDUWA_I	lduwa	[%r10, + 0x0064] %asi, %r7
	.word 0xc7e2d11f  ! 403: CASA_I	casa	[%r11] 0x88, %r31, %r3
	.word 0xc7f2e01f  ! 404: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc20a801f  ! 405: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdf2d13f  ! 406: CASXA_I	casxa	[%r11] 0x89, %r31, %r6
	.word 0xcdbad91f  ! 407: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc852c01f  ! 408: LDSH_R	ldsh	[%r11 + %r31], %r4
	.word 0xc6d2a020  ! 409: LDSHA_I	ldsha	[%r10, + 0x0020] %asi, %r3
	.word 0xcdf2e01f  ! 410: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdf2d03f  ! 411: CASXA_I	casxa	[%r11] 0x81, %r31, %r6
	.word 0xcdbad9bf  ! 412: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad93f  ! 413: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xce52801f  ! 414: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xc25ae050  ! 415: LDX_I	ldx	[%r11 + 0x0050], %r1
TH_LABEL415:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5ba981f  ! 416: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd052e012  ! 417: LDSH_I	ldsh	[%r11 + 0x0012], %r8
	.word 0xc882d01f  ! 418: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r4
	.word 0xcfbad97f  ! 419: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc20a801f  ! 420: LDUB_R	ldub	[%r10 + %r31], %r1
TH_LABEL420:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba987f  ! 421: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba98bf  ! 422: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 423: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 424: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca12c01f  ! 425: LDUH_R	lduh	[%r11 + %r31], %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc6c2d01f  ! 426: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r3
	.word 0xc902e034  ! 427: LDF_I	ld	[%r11, 0x0034], %f4
	.word 0xc9bae010  ! 428: STDFA_I	stda	%f4, [0x0010, %r11]
	.word 0xc3ba981f  ! 429: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 430: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc68aa02f  ! 431: LDUBA_I	lduba	[%r10, + 0x002f] %asi, %r3
	.word 0xc28aa04e  ! 432: LDUBA_I	lduba	[%r10, + 0x004e] %asi, %r1
	.word 0xcc3a801f  ! 433: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba985f  ! 434: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 435: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc89ae078  ! 436: LDDA_I	ldda	[%r11, + 0x0078] %asi, %r4
	.word 0xcb22801f  ! 437: STF_R	st	%f5, [%r31, %r10]
	.word 0xcbf2d13f  ! 438: CASXA_I	casxa	[%r11] 0x89, %r31, %r5
	.word 0xc44a801f  ! 439: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xd1f2913f  ! 440: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1ba985f  ! 441: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba993f  ! 442: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2913f  ! 443: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd1ba983f  ! 444: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa048  ! 445: STD_I	std	%r8, [%r10 + 0x0048]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xccd2913f  ! 446: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r6
	.word 0xcbbad93f  ! 447: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc40aa066  ! 448: LDUB_I	ldub	[%r10 + 0x0066], %r2
	.word 0xc9f2903f  ! 449: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc9ba997f  ! 450: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9ba985f  ! 451: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba99bf  ! 452: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba987f  ! 453: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc502e064  ! 454: LDF_I	ld	[%r11, 0x0064], %f2
	.word 0xd3ba983f  ! 455: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc692915f  ! 456: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r3
	.word 0xc6caa021  ! 457: LDSBA_I	ldsba	[%r10, + 0x0021] %asi, %r3
	.word 0xc3ba981f  ! 458: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd25ac01f  ! 459: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xc892911f  ! 460: LDUHA_R	lduha	[%r10, %r31] 0x88, %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc702801f  ! 461: LDF_R	ld	[%r10, %r31], %f3
	.word 0xd3f2a01f  ! 462: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba993f  ! 463: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 464: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcfbaa058  ! 465: STDFA_I	stda	%f7, [0x0058, %r10]
TH_LABEL465:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbbad83f  ! 466: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad99f  ! 467: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d01f  ! 468: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xd292e02e  ! 469: LDUHA_I	lduha	[%r11, + 0x002e] %asi, %r9
	.word 0xd03aa008  ! 470: STD_I	std	%r8, [%r10 + 0x0008]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3ba995f  ! 471: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 472: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba983f  ! 473: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 474: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xcdbaa068  ! 475: STDFA_I	stda	%f6, [0x0068, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbe2d03f  ! 476: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xcbbaa008  ! 477: STDFA_I	stda	%f5, [0x0008, %r10]
	.word 0xd3ba99bf  ! 478: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba983f  ! 479: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc40aa069  ! 480: LDUB_I	ldub	[%r10 + 0x0069], %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcf9aa070  ! 481: LDDFA_I	ldda	[%r10, 0x0070], %f7
	.word 0xc9bad97f  ! 482: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc702c01f  ! 483: LDF_R	ld	[%r11, %r31], %f3
	.word 0xc9bad97f  ! 484: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d11f  ! 485: CASA_I	casa	[%r11] 0x88, %r31, %r4
TH_LABEL485:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc99aa060  ! 486: LDDFA_I	ldda	[%r10, 0x0060], %f4
	.word 0xc68a905f  ! 487: LDUBA_R	lduba	[%r10, %r31] 0x82, %r3
	.word 0xc8c2a020  ! 488: LDSWA_I	ldswa	[%r10, + 0x0020] %asi, %r4
	.word 0xc7ba991f  ! 489: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 490: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc20ac01f  ! 491: LDUB_R	ldub	[%r11 + %r31], %r1
	.word 0xcbba999f  ! 492: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xca12c01f  ! 493: LDUH_R	lduh	[%r11 + %r31], %r5
	.word 0xc81ac01f  ! 494: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xc28aa021  ! 495: LDUBA_I	lduba	[%r10, + 0x0021] %asi, %r1
TH_LABEL495:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3f2a01f  ! 496: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba983f  ! 497: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 498: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3e2901f  ! 499: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba989f  ! 500: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3f2a01f  ! 501: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba999f  ! 502: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2911f  ! 503: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd3ba989f  ! 504: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd052c01f  ! 505: LDSH_R	ldsh	[%r11 + %r31], %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcde2a01f  ! 506: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcc3a801f  ! 507: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc502c01f  ! 508: LDF_R	ld	[%r11, %r31], %f2
	.word 0xc802801f  ! 509: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xd212801f  ! 510: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7e2901f  ! 511: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba999f  ! 512: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa000  ! 513: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc7f2911f  ! 514: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba983f  ! 515: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7f2901f  ! 516: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xcc9aa030  ! 517: LDDA_I	ldda	[%r10, + 0x0030] %asi, %r6
	.word 0xcc0ae07f  ! 518: LDUB_I	ldub	[%r11 + 0x007f], %r6
	.word 0xc79aa078  ! 519: LDDFA_I	ldda	[%r10, 0x0078], %f3
	.word 0xcfba98bf  ! 520: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc652e00a  ! 521: LDSH_I	ldsh	[%r11 + 0x000a], %r3
	.word 0xcc12a032  ! 522: LDUH_I	lduh	[%r10 + 0x0032], %r6
	.word 0xd0dad11f  ! 523: LDXA_R	ldxa	[%r11, %r31] 0x88, %r8
	.word 0xcfba985f  ! 524: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 525: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd302801f  ! 526: LDF_R	ld	[%r10, %r31], %f9
	.word 0xcc4a801f  ! 527: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xd3ba983f  ! 528: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd252c01f  ! 529: LDSH_R	ldsh	[%r11 + %r31], %r9
	.word 0xd1e2d01f  ! 530: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd09aa038  ! 531: LDDA_I	ldda	[%r10, + 0x0038] %asi, %r8
	.word 0xc5ba997f  ! 532: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc492d05f  ! 533: LDUHA_R	lduha	[%r11, %r31] 0x82, %r2
	.word 0xc9bad91f  ! 534: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad85f  ! 535: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd19ae048  ! 536: LDDFA_I	ldda	[%r11, 0x0048], %f8
	.word 0xcbba989f  ! 537: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba985f  ! 538: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xca0aa060  ! 539: LDUB_I	ldub	[%r10 + 0x0060], %r5
	.word 0xceda901f  ! 540: LDXA_R	ldxa	[%r10, %r31] 0x80, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfbad91f  ! 541: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd0d2a00e  ! 542: LDSHA_I	ldsha	[%r10, + 0x000e] %asi, %r8
	.word 0xc39ae058  ! 543: LDDFA_I	ldda	[%r11, 0x0058], %f1
	.word 0xcb02801f  ! 544: LDF_R	ld	[%r10, %r31], %f5
	.word 0xca12c01f  ! 545: LDUH_R	lduh	[%r11 + %r31], %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfbad99f  ! 546: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 547: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xc41a801f  ! 548: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xd322c01f  ! 549: STF_R	st	%f9, [%r31, %r11]
	.word 0xc9ba985f  ! 550: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9e2913f  ! 551: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc59aa038  ! 552: LDDFA_I	ldda	[%r10, 0x0038], %f2
	.word 0xd39ae038  ! 553: LDDFA_I	ldda	[%r11, 0x0038], %f9
	.word 0xcbba991f  ! 554: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 555: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xce92a038  ! 556: LDUHA_I	lduha	[%r10, + 0x0038] %asi, %r7
	.word 0xc5e2903f  ! 557: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba981f  ! 558: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 559: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 560: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1baa030  ! 561: STDFA_I	stda	%f8, [0x0030, %r10]
	.word 0xc9ba995f  ! 562: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa000  ! 563: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xc9ba983f  ! 564: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcac2a068  ! 565: LDSWA_I	ldswa	[%r10, + 0x0068] %asi, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc412c01f  ! 566: LDUH_R	lduh	[%r11 + %r31], %r2
	.word 0xc7ba989f  ! 567: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa048  ! 568: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc7ba99bf  ! 569: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 570: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7e2913f  ! 571: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba995f  ! 572: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc502a074  ! 573: LDF_I	ld	[%r10, 0x0074], %f2
	.word 0xc9ba989f  ! 574: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 575: STD_R	std	%r4, [%r10 + %r31]
TH_LABEL575:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9e2a01f  ! 576: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xce92e06e  ! 577: LDUHA_I	lduha	[%r11, + 0x006e] %asi, %r7
	.word 0xc9e2901f  ! 578: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba999f  ! 579: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcdbae010  ! 580: STDFA_I	stda	%f6, [0x0010, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc812801f  ! 581: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xc3bad85f  ! 582: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad91f  ! 583: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad89f  ! 584: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad89f  ! 585: STDFA_R	stda	%f1, [%r31, %r11]
TH_LABEL585:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xca92d11f  ! 586: LDUHA_R	lduha	[%r11, %r31] 0x88, %r5
	.word 0xd3bad85f  ! 587: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcad2a072  ! 588: LDSHA_I	ldsha	[%r10, + 0x0072] %asi, %r5
	.word 0xca02a050  ! 589: LDUW_I	lduw	[%r10 + 0x0050], %r5
	.word 0xc3e2e01f  ! 590: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3bad89f  ! 591: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcc1aa078  ! 592: LDD_I	ldd	[%r10 + 0x0078], %r6
	.word 0xc3bad93f  ! 593: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcd22c01f  ! 594: STF_R	st	%f6, [%r31, %r11]
	.word 0xc24ac01f  ! 595: LDSB_R	ldsb	[%r11 + %r31], %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc43ae060  ! 596: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xc45ac01f  ! 597: LDX_R	ldx	[%r11 + %r31], %r2
	.word 0xc4dae038  ! 598: LDXA_I	ldxa	[%r11, + 0x0038] %asi, %r2
	.word 0xcd9aa058  ! 599: LDDFA_I	ldda	[%r10, 0x0058], %f6
	.word 0xd212a016  ! 600: LDUH_I	lduh	[%r10 + 0x0016], %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdbad85f  ! 601: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc812801f  ! 602: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xcc0a801f  ! 603: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xd1ba981f  ! 604: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc82d05f  ! 605: LDUWA_R	lduwa	[%r11, %r31] 0x82, %r6
TH_LABEL605:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5ba995f  ! 606: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 607: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xd01a801f  ! 608: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xc722c01f  ! 609: STF_R	st	%f3, [%r31, %r11]
	.word 0xd1e2d01f  ! 610: CASA_I	casa	[%r11] 0x80, %r31, %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc81aa060  ! 611: LDD_I	ldd	[%r10 + 0x0060], %r4
	.word 0xc83a801f  ! 612: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba993f  ! 613: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 614: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xca8a917f  ! 615: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbbad87f  ! 616: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ac01f  ! 617: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad95f  ! 618: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d01f  ! 619: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xd052a006  ! 620: LDSH_I	ldsh	[%r10 + 0x0006], %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc4d2903f  ! 621: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r2
	.word 0xc01aa038  ! 622: LDD_I	ldd	[%r10 + 0x0038], %r0
	.word 0xcbba993f  ! 623: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2901f  ! 624: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xc09aa070  ! 625: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r0
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc5a801f  ! 626: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xc5f2a01f  ! 627: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5f2901f  ! 628: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5e2913f  ! 629: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc892a036  ! 630: LDUHA_I	lduha	[%r10, + 0x0036] %asi, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc2cad17f  ! 631: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r1
	.word 0xc8ca903f  ! 632: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r4
	.word 0xc6c2d01f  ! 633: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r3
	.word 0xcb02801f  ! 634: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc48ae01d  ! 635: LDUBA_I	lduba	[%r11, + 0x001d] %asi, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc3ae040  ! 636: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xcdbad97f  ! 637: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad9bf  ! 638: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad97f  ! 639: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdf2e01f  ! 640: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc3ae040  ! 641: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xc60aa05d  ! 642: LDUB_I	ldub	[%r10 + 0x005d], %r3
	.word 0xc43aa030  ! 643: STD_I	std	%r2, [%r10 + 0x0030]
	.word 0xc242801f  ! 644: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xd0caa07e  ! 645: LDSBA_I	ldsba	[%r10, + 0x007e] %asi, %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcd9aa048  ! 646: LDDFA_I	ldda	[%r10, 0x0048], %f6
	.word 0xd1bad81f  ! 647: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad93f  ! 648: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd0da901f  ! 649: LDXA_R	ldxa	[%r10, %r31] 0x80, %r8
	.word 0xd042c01f  ! 650: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3e2911f  ! 651: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xd3e2a01f  ! 652: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba99bf  ! 653: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 654: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xc24a801f  ! 655: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcac2903f  ! 656: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r5
	.word 0xcc3ac01f  ! 657: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcde2e01f  ! 658: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdbad8bf  ! 659: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xce92917f  ! 660: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1ba99bf  ! 661: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca92901f  ! 662: LDUHA_R	lduha	[%r10, %r31] 0x80, %r5
	.word 0xc7bad93f  ! 663: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc80aa009  ! 664: LDUB_I	ldub	[%r10 + 0x0009], %r4
	.word 0xce12a012  ! 665: LDUH_I	lduh	[%r10 + 0x0012], %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc20a801f  ! 666: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xc9ba991f  ! 667: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc48ad17f  ! 668: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r2
	.word 0xc282d07f  ! 669: LDUWA_R	lduwa	[%r11, %r31] 0x83, %r1
	.word 0xc83aa070  ! 670: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbf2901f  ! 671: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbba999f  ! 672: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa070  ! 673: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xcbba991f  ! 674: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2913f  ! 675: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc59aa050  ! 676: LDDFA_I	ldda	[%r10, 0x0050], %f2
	.word 0xc5bad81f  ! 677: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ac01f  ! 678: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad89f  ! 679: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2e01f  ! 680: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5f2e01f  ! 681: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad83f  ! 682: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc49ae040  ! 683: LDDA_I	ldda	[%r11, + 0x0040] %asi, %r2
	.word 0xc43ac01f  ! 684: STD_R	std	%r2, [%r11 + %r31]
	.word 0xcc8a917f  ! 685: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r6
TH_LABEL685:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc4cad01f  ! 686: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r2
	.word 0xca4aa039  ! 687: LDSB_I	ldsb	[%r10 + 0x0039], %r5
	.word 0xcbba989f  ! 688: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbbaa078  ! 689: STDFA_I	stda	%f5, [0x0078, %r10]
	.word 0xcbf2901f  ! 690: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbe2913f  ! 691: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xcbe2901f  ! 692: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcbe2a01f  ! 693: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcadaa030  ! 694: LDXA_I	ldxa	[%r10, + 0x0030] %asi, %r5
	.word 0xc2ca905f  ! 695: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc242c01f  ! 696: LDSW_R	ldsw	[%r11 + %r31], %r1
	.word 0xc9e2d13f  ! 697: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc9bad89f  ! 698: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d03f  ! 699: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xc9bad85f  ! 700: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9bad95f  ! 701: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc45a801f  ! 702: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xd1f2a01f  ! 703: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xcadaa028  ! 704: LDXA_I	ldxa	[%r10, + 0x0028] %asi, %r5
	.word 0xc702801f  ! 705: LDF_R	ld	[%r10, %r31], %f3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc81aa008  ! 706: LDD_I	ldd	[%r10 + 0x0008], %r4
	.word 0xcdf2a01f  ! 707: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xceda917f  ! 708: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r7
	.word 0xc43ac01f  ! 709: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae060  ! 710: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7bad83f  ! 711: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2d11f  ! 712: CASA_I	casa	[%r11] 0x88, %r31, %r3
	.word 0xc7bad99f  ! 713: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae060  ! 714: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xca12801f  ! 715: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdf2903f  ! 716: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xd252a022  ! 717: LDSH_I	ldsh	[%r10 + 0x0022], %r9
	.word 0xcbba987f  ! 718: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd052c01f  ! 719: LDSH_R	ldsh	[%r11 + %r31], %r8
	.word 0xcfe2a01f  ! 720: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd052801f  ! 721: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xcfbad81f  ! 722: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc85a801f  ! 723: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xc9ba995f  ! 724: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc322c01f  ! 725: STF_R	st	%f1, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3ba993f  ! 726: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc81a801f  ! 727: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xcfba989f  ! 728: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc40aa020  ! 729: LDUB_I	ldub	[%r10 + 0x0020], %r2
	.word 0xd03ae070  ! 730: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcb9ae058  ! 731: LDDFA_I	ldda	[%r11, 0x0058], %f5
	.word 0xc2daa040  ! 732: LDXA_I	ldxa	[%r10, + 0x0040] %asi, %r1
	.word 0xc83ac01f  ! 733: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcc9ae048  ! 734: LDDA_I	ldda	[%r11, + 0x0048] %asi, %r6
	.word 0xc9e2903f  ! 735: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9ba99bf  ! 736: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 737: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa078  ! 738: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xcd9ae008  ! 739: LDDFA_I	ldda	[%r11, 0x0008], %f6
	.word 0xd1ba981f  ! 740: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdbaa028  ! 741: STDFA_I	stda	%f6, [0x0028, %r10]
	.word 0xcbba981f  ! 742: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba98bf  ! 743: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2913f  ! 744: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xcbf2901f  ! 745: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc83a801f  ! 746: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba999f  ! 747: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcc42801f  ! 748: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xcff2e01f  ! 749: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcccaa052  ! 750: LDSBA_I	ldsba	[%r10, + 0x0052] %asi, %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3e2903f  ! 751: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba981f  ! 752: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba997f  ! 753: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa058  ! 754: STD_I	std	%r0, [%r10 + 0x0058]
	.word 0xc3e2901f  ! 755: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc40a801f  ! 756: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xc6daa008  ! 757: LDXA_I	ldxa	[%r10, + 0x0008] %asi, %r3
	.word 0xd282911f  ! 758: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r9
	.word 0xcfba995f  ! 759: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd302801f  ! 760: LDF_R	ld	[%r10, %r31], %f9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc682913f  ! 761: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r3
	.word 0xd242801f  ! 762: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xc3ba987f  ! 763: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcd02c01f  ! 764: LDF_R	ld	[%r11, %r31], %f6
	.word 0xcf22801f  ! 765: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc2c2a078  ! 766: LDSWA_I	ldswa	[%r10, + 0x0078] %asi, %r1
	.word 0xc83a801f  ! 767: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba981f  ! 768: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 769: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba99bf  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc83aa038  ! 771: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xc9f2a01f  ! 772: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba991f  ! 773: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcb02801f  ! 774: LDF_R	ld	[%r10, %r31], %f5
	.word 0xd3ba981f  ! 775: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc702a01c  ! 776: LDF_I	ld	[%r10, 0x001c], %f3
	.word 0xce92907f  ! 777: LDUHA_R	lduha	[%r10, %r31] 0x83, %r7
	.word 0xc702a06c  ! 778: LDF_I	ld	[%r10, 0x006c], %f3
	.word 0xcc52801f  ! 779: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xc3ba985f  ! 780: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc2c2a070  ! 781: LDSWA_I	ldswa	[%r10, + 0x0070] %asi, %r1
	.word 0xc5e2901f  ! 782: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba981f  ! 783: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2911f  ! 784: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc43aa018  ! 785: STD_I	std	%r2, [%r10 + 0x0018]
TH_LABEL785:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc1aa070  ! 786: LDD_I	ldd	[%r10 + 0x0070], %r6
	.word 0xd03ae050  ! 787: STD_I	std	%r8, [%r11 + 0x0050]
	.word 0xd19ae010  ! 788: LDDFA_I	ldda	[%r11, 0x0010], %f8
	.word 0xd1ba989f  ! 789: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc25a801f  ! 790: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3ba987f  ! 791: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc88a901f  ! 792: LDUBA_R	lduba	[%r10, %r31] 0x80, %r4
	.word 0xd3f2a01f  ! 793: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba995f  ! 794: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 795: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc80aa070  ! 796: LDUB_I	ldub	[%r10 + 0x0070], %r4
	.word 0xd1ba993f  ! 797: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2903f  ! 798: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xd1ba985f  ! 799: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba99bf  ! 800: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xce02a064  ! 801: LDUW_I	lduw	[%r10 + 0x0064], %r7
	.word 0xc9ba989f  ! 802: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc882907f  ! 803: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r4
	.word 0xd01aa010  ! 804: LDD_I	ldd	[%r10 + 0x0010], %r8
	.word 0xcc3a801f  ! 805: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc3a801f  ! 806: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2901f  ! 807: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba981f  ! 808: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 809: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 810: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL810:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc3a801f  ! 811: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba98bf  ! 812: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa010  ! 813: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcc3aa010  ! 814: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xc922801f  ! 815: STF_R	st	%f4, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9ba981f  ! 816: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd39aa040  ! 817: LDDFA_I	ldda	[%r10, 0x0040], %f9
	.word 0xcdbad81f  ! 818: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad91f  ! 819: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2e01f  ! 820: CASA_R	casa	[%r11] %asi, %r31, %r6
TH_LABEL820:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcde2d11f  ! 821: CASA_I	casa	[%r11] 0x88, %r31, %r6
	.word 0xcd02801f  ! 822: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc83a801f  ! 823: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd0cad01f  ! 824: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r8
	.word 0xc9bad8bf  ! 825: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc83ac01f  ! 826: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcd22801f  ! 827: STF_R	st	%f6, [%r31, %r10]
	.word 0xcdba987f  ! 828: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc6c2d17f  ! 829: LDSWA_R	ldswa	[%r11, %r31] 0x8b, %r3
	.word 0xc9bad81f  ! 830: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc852e00c  ! 831: LDSH_I	ldsh	[%r11 + 0x000c], %r4
	.word 0xc5bae030  ! 832: STDFA_I	stda	%f2, [0x0030, %r11]
	.word 0xcbe2a01f  ! 833: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbe2a01f  ! 834: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc702e058  ! 835: LDF_I	ld	[%r11, 0x0058], %f3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3ba985f  ! 836: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd012e01a  ! 837: LDUH_I	lduh	[%r11 + 0x001a], %r8
	.word 0xc49aa018  ! 838: LDDA_I	ldda	[%r10, + 0x0018] %asi, %r2
	.word 0xd3bad91f  ! 839: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae000  ! 840: STD_I	std	%r8, [%r11 + 0x0000]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3bad97f  ! 841: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 842: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xcfbaa038  ! 843: STDFA_I	stda	%f7, [0x0038, %r10]
	.word 0xc83ac01f  ! 844: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc2d2901f  ! 845: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcedaa058  ! 846: LDXA_I	ldxa	[%r10, + 0x0058] %asi, %r7
	.word 0xd03ae048  ! 847: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xd3f2e01f  ! 848: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2d11f  ! 849: CASA_I	casa	[%r11] 0x88, %r31, %r9
	.word 0xd3f2e01f  ! 850: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd002c01f  ! 851: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xc3ba991f  ! 852: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba995f  ! 853: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2903f  ! 854: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba983f  ! 855: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc59aa000  ! 856: LDDFA_I	ldda	[%r10, 0x0000], %f2
	.word 0xcfba981f  ! 857: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc252a042  ! 858: LDSH_I	ldsh	[%r10 + 0x0042], %r1
	.word 0xcec2903f  ! 859: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r7
	.word 0xc702e040  ! 860: LDF_I	ld	[%r11, 0x0040], %f3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdba991f  ! 861: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc79aa058  ! 862: LDDFA_I	ldda	[%r10, 0x0058], %f3
	.word 0xcfe2a01f  ! 863: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba99bf  ! 864: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 865: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc3aa020  ! 866: STD_I	std	%r6, [%r10 + 0x0020]
	.word 0xcfe2a01f  ! 867: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd122801f  ! 868: STF_R	st	%f8, [%r31, %r10]
	.word 0xc922801f  ! 869: STF_R	st	%f4, [%r31, %r10]
	.word 0xc5f2d01f  ! 870: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5e2d01f  ! 871: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xc43ac01f  ! 872: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad91f  ! 873: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc45aa030  ! 874: LDX_I	ldx	[%r10 + 0x0030], %r2
	.word 0xc3bae068  ! 875: STDFA_I	stda	%f1, [0x0068, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xca8ae07d  ! 876: LDUBA_I	lduba	[%r11, + 0x007d] %asi, %r5
	.word 0xc5bad81f  ! 877: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc39aa058  ! 878: LDDFA_I	ldda	[%r10, 0x0058], %f1
	.word 0xcdf2d03f  ! 879: CASXA_I	casxa	[%r11] 0x81, %r31, %r6
	.word 0xced2e04e  ! 880: LDSHA_I	ldsha	[%r11, + 0x004e] %asi, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5f2911f  ! 881: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xc5f2a01f  ! 882: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba987f  ! 883: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba997f  ! 884: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd19aa068  ! 885: LDDFA_I	ldda	[%r10, 0x0068], %f8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc702a018  ! 886: LDF_I	ld	[%r10, 0x0018], %f3
	.word 0xc3f2e01f  ! 887: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3f2e01f  ! 888: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad85f  ! 889: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc852c01f  ! 890: LDSH_R	ldsh	[%r11 + %r31], %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc2d2903f  ! 891: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r1
	.word 0xd1ba995f  ! 892: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba999f  ! 893: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 894: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba985f  ! 895: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd03aa028  ! 896: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd1ba981f  ! 897: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 898: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc302c01f  ! 899: LDF_R	ld	[%r11, %r31], %f1
	.word 0xc302e030  ! 900: LDF_I	ld	[%r11, 0x0030], %f1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3baa038  ! 901: STDFA_I	stda	%f1, [0x0038, %r10]
	.word 0xc652a004  ! 902: LDSH_I	ldsh	[%r10 + 0x0004], %r3
	.word 0xce12c01f  ! 903: LDUH_R	lduh	[%r11 + %r31], %r7
	.word 0xc682a040  ! 904: LDUWA_I	lduwa	[%r10, + 0x0040] %asi, %r3
	.word 0xc59aa010  ! 905: LDDFA_I	ldda	[%r10, 0x0010], %f2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7f2d03f  ! 906: CASXA_I	casxa	[%r11] 0x81, %r31, %r3
	.word 0xc302c01f  ! 907: LDF_R	ld	[%r11, %r31], %f1
	.word 0xc64ae010  ! 908: LDSB_I	ldsb	[%r11 + 0x0010], %r3
	.word 0xd04aa04b  ! 909: LDSB_I	ldsb	[%r10 + 0x004b], %r8
	.word 0xc83aa008  ! 910: STD_I	std	%r4, [%r10 + 0x0008]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcb02a03c  ! 911: LDF_I	ld	[%r10, 0x003c], %f5
	.word 0xd102a00c  ! 912: LDF_I	ld	[%r10, 0x000c], %f8
	.word 0xc3e2a01f  ! 913: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3f2913f  ! 914: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xc3f2a01f  ! 915: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3ba99bf  ! 916: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2913f  ! 917: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xd202801f  ! 918: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xcf9ae068  ! 919: LDDFA_I	ldda	[%r11, 0x0068], %f7
	.word 0xc8d2913f  ! 920: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd03aa010  ! 921: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1e2901f  ! 922: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1ba981f  ! 923: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2901f  ! 924: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd03aa010  ! 925: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc852c01f  ! 926: LDSH_R	ldsh	[%r11 + %r31], %r4
	.word 0xc3e2e01f  ! 927: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xccc2a02c  ! 928: LDSWA_I	ldswa	[%r10, + 0x002c] %asi, %r6
	.word 0xc7bad85f  ! 929: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcac2903f  ! 930: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3baa058  ! 931: STDFA_I	stda	%f1, [0x0058, %r10]
	.word 0xcde2a01f  ! 932: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2901f  ! 933: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba987f  ! 934: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa070  ! 935: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc3aa070  ! 936: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xc5bae018  ! 937: STDFA_I	stda	%f2, [0x0018, %r11]
	.word 0xd2cad13f  ! 938: LDSBA_R	ldsba	[%r11, %r31] 0x89, %r9
	.word 0xd39ae018  ! 939: LDDFA_I	ldda	[%r11, 0x0018], %f9
	.word 0xd292901f  ! 940: LDUHA_R	lduha	[%r10, %r31] 0x80, %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9bae048  ! 941: STDFA_I	stda	%f4, [0x0048, %r11]
	.word 0xc202801f  ! 942: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xd1ba995f  ! 943: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 944: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba999f  ! 945: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1ba993f  ! 946: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2903f  ! 947: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xccc2907f  ! 948: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r6
	.word 0xcf02801f  ! 949: LDF_R	ld	[%r10, %r31], %f7
	.word 0xd3e2901f  ! 950: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcad2e01c  ! 951: LDSHA_I	ldsha	[%r11, + 0x001c] %asi, %r5
	.word 0xc43ae028  ! 952: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc43ac01f  ! 953: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc502e038  ! 954: LDF_I	ld	[%r11, 0x0038], %f2
	.word 0xcbbae020  ! 955: STDFA_I	stda	%f5, [0x0020, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xce92915f  ! 956: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r7
	.word 0xc3ba993f  ! 957: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa008  ! 958: STD_I	std	%r0, [%r10 + 0x0008]
	.word 0xc9baa020  ! 959: STDFA_I	stda	%f4, [0x0020, %r10]
	.word 0xcfba987f  ! 960: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL960:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc80aa069  ! 961: LDUB_I	ldub	[%r10 + 0x0069], %r4
	.word 0xc25aa040  ! 962: LDX_I	ldx	[%r10 + 0x0040], %r1
	.word 0xcbbad83f  ! 963: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc402801f  ! 964: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xd1ba983f  ! 965: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL965:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd03aa030  ! 966: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xd1ba995f  ! 967: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc902a004  ! 968: LDF_I	ld	[%r10, 0x0004], %f4
	.word 0xc3bad87f  ! 969: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad95f  ! 970: STDFA_R	stda	%f1, [%r31, %r11]
TH_LABEL970:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc39aa060  ! 971: LDDFA_I	ldda	[%r10, 0x0060], %f1
	.word 0xd3ba991f  ! 972: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2913f  ! 973: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xccca915f  ! 974: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r6
	.word 0xc81aa028  ! 975: LDD_I	ldd	[%r10 + 0x0028], %r4
TH_LABEL975:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd0c2913f  ! 976: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r8
	.word 0xc642e014  ! 977: LDSW_I	ldsw	[%r11 + 0x0014], %r3
	.word 0xccc2905f  ! 978: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r6
	.word 0xcada915f  ! 979: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r5
	.word 0xcc3aa030  ! 980: STD_I	std	%r6, [%r10 + 0x0030]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc3aa030  ! 981: STD_I	std	%r6, [%r10 + 0x0030]
	.word 0xc44ac01f  ! 982: LDSB_R	ldsb	[%r11 + %r31], %r2
	.word 0xc7e2901f  ! 983: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc80aa072  ! 984: LDUB_I	ldub	[%r10 + 0x0072], %r4
	.word 0xd20aa011  ! 985: LDUB_I	ldub	[%r10 + 0x0011], %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7f2a01f  ! 986: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba993f  ! 987: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc68aa067  ! 988: LDUBA_I	lduba	[%r10, + 0x0067] %asi, %r3
	.word 0xc902e004  ! 989: LDF_I	ld	[%r11, 0x0004], %f4
	.word 0xcff2a01f  ! 990: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc3a801f  ! 991: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba98bf  ! 992: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd24ae04a  ! 993: LDSB_I	ldsb	[%r11 + 0x004a], %r9
	.word 0xc9bad91f  ! 994: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad93f  ! 995: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcf9aa058  ! 996: LDDFA_I	ldda	[%r10, 0x0058], %f7
	.word 0xcac2a024  ! 997: LDSWA_I	ldswa	[%r10, + 0x0024] %asi, %r5
	.word 0xcfbad93f  ! 998: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc7bae010  ! 999: STDFA_I	stda	%f3, [0x0010, %r11]
	.word 0xc03a801f  ! 1000: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	subcc %r30, 1, %r30
	bnz  TH1_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	add	%g0,	0x1,	%r30
TH0_LOOP_START:
	.word 0xc5ba991f  ! 1: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc882e06c  ! 2: LDUWA_I	lduwa	[%r11, + 0x006c] %asi, %r4
	.word 0xd202e060  ! 3: LDUW_I	lduw	[%r11 + 0x0060], %r9
	.word 0xcc5ac01f  ! 4: LDX_R	ldx	[%r11 + %r31], %r6
	.word 0xcde2e01f  ! 5: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdbad83f  ! 6: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc8d2901f  ! 7: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r4
	.word 0xc9e2911f  ! 8: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc442e05c  ! 9: LDSW_I	ldsw	[%r11 + 0x005c], %r2
	.word 0xc48aa070  ! 10: LDUBA_I	lduba	[%r10, + 0x0070] %asi, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc89aa068  ! 11: LDDA_I	ldda	[%r10, + 0x0068] %asi, %r4
	.word 0xc302a040  ! 12: LDF_I	ld	[%r10, 0x0040], %f1
	.word 0xc3ba981f  ! 13: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 14: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba981f  ! 15: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc2caa06c  ! 16: LDSBA_I	ldsba	[%r10, + 0x006c] %asi, %r1
	.word 0xcc8aa03f  ! 17: LDUBA_I	lduba	[%r10, + 0x003f] %asi, %r6
	.word 0xcdf2a01f  ! 18: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdf2901f  ! 19: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba981f  ! 20: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdba993f  ! 21: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 22: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd282901f  ! 23: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r9
	.word 0xd3ba981f  ! 24: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 25: CASA_I	casa	[%r10] 0x81, %r31, %r9
TH_LABEL25:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1bae020  ! 26: STDFA_I	stda	%f8, [0x0020, %r11]
	.word 0xd1e2e01f  ! 27: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xc922c01f  ! 28: STF_R	st	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 29: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad8bf  ! 30: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9e2e01f  ! 31: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xcdbaa028  ! 32: STDFA_I	stda	%f6, [0x0028, %r10]
	.word 0xcdba991f  ! 33: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 34: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba989f  ! 35: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL35:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc3aa028  ! 36: STD_I	std	%r6, [%r10 + 0x0028]
	.word 0xcc3a801f  ! 37: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2901f  ! 38: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba999f  ! 39: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 40: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc41aa008  ! 41: LDD_I	ldd	[%r10 + 0x0008], %r2
	.word 0xc5f2a01f  ! 42: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5e2a01f  ! 43: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcbbae040  ! 44: STDFA_I	stda	%f5, [0x0040, %r11]
	.word 0xcbe2e01f  ! 45: CASA_R	casa	[%r11] %asi, %r31, %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd0da905f  ! 46: LDXA_R	ldxa	[%r10, %r31] 0x82, %r8
	.word 0xd1ba997f  ! 47: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 48: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1f2a01f  ! 49: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba989f  ! 50: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3baa040  ! 51: STDFA_I	stda	%f9, [0x0040, %r10]
	.word 0xc48aa012  ! 52: LDUBA_I	lduba	[%r10, + 0x0012] %asi, %r2
	.word 0xc68a917f  ! 53: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r3
	.word 0xc39ae048  ! 54: LDDFA_I	ldda	[%r11, 0x0048], %f1
	.word 0xc03ac01f  ! 55: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc882e048  ! 56: LDUWA_I	lduwa	[%r11, + 0x0048] %asi, %r4
	.word 0xc9bad85f  ! 57: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad97f  ! 58: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcbbae048  ! 59: STDFA_I	stda	%f5, [0x0048, %r11]
	.word 0xd302801f  ! 60: LDF_R	ld	[%r10, %r31], %f9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3ba993f  ! 61: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcac2913f  ! 62: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r5
	.word 0xc402801f  ! 63: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xc5ba99bf  ! 64: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd1bae048  ! 65: STDFA_I	stda	%f8, [0x0048, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1f2e01f  ! 66: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd03ac01f  ! 67: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad93f  ! 68: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd03ae048  ! 69: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xce12c01f  ! 70: LDUH_R	lduh	[%r11 + %r31], %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd042a07c  ! 71: LDSW_I	ldsw	[%r10 + 0x007c], %r8
	.word 0xcc1ac01f  ! 72: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xc812c01f  ! 73: LDUH_R	lduh	[%r11 + %r31], %r4
	.word 0xc9f2e01f  ! 74: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xcb02801f  ! 75: LDF_R	ld	[%r10, %r31], %f5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbba981f  ! 76: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc902801f  ! 77: LDF_R	ld	[%r10, %r31], %f4
	.word 0xcbbae008  ! 78: STDFA_I	stda	%f5, [0x0008, %r11]
	.word 0xcbbad95f  ! 79: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd322801f  ! 80: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd292d05f  ! 81: LDUHA_R	lduha	[%r11, %r31] 0x82, %r9
	.word 0xd3bad8bf  ! 82: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 83: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad83f  ! 84: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad87f  ! 85: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc39ae060  ! 86: LDDFA_I	ldda	[%r11, 0x0060], %f1
	.word 0xc3f2d01f  ! 87: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3e2d03f  ! 88: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xc682d13f  ! 89: LDUWA_R	lduwa	[%r11, %r31] 0x89, %r3
	.word 0xc99aa070  ! 90: LDDFA_I	ldda	[%r10, 0x0070], %f4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc83aa070  ! 91: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xc3baa010  ! 92: STDFA_I	stda	%f1, [0x0010, %r10]
	.word 0xc3ba991f  ! 93: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcdbaa050  ! 94: STDFA_I	stda	%f6, [0x0050, %r10]
	.word 0xcc3a801f  ! 95: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc3a801f  ! 96: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 97: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdba997f  ! 98: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba987f  ! 99: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc41ae020  ! 100: LDD_I	ldd	[%r11 + 0x0020], %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5bad9bf  ! 101: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad93f  ! 102: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xca4ac01f  ! 103: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xd252e00e  ! 104: LDSH_I	ldsh	[%r11 + 0x000e], %r9
	.word 0xd3f2e01f  ! 105: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3f2e01f  ! 106: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xceda905f  ! 107: LDXA_R	ldxa	[%r10, %r31] 0x82, %r7
	.word 0xcfba98bf  ! 108: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba983f  ! 109: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc42a04c  ! 110: LDSW_I	ldsw	[%r10 + 0x004c], %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc8daa000  ! 111: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r4
	.word 0xc9baa048  ! 112: STDFA_I	stda	%f4, [0x0048, %r10]
	.word 0xc9f2903f  ! 113: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc84a801f  ! 114: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xc9f2911f  ! 115: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9e2913f  ! 116: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9e2913f  ! 117: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba991f  ! 118: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 119: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba983f  ! 120: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9e2901f  ! 121: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xcc4ae023  ! 122: LDSB_I	ldsb	[%r11 + 0x0023], %r6
	.word 0xcdbad81f  ! 123: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd0dae000  ! 124: LDXA_I	ldxa	[%r11, + 0x0000] %asi, %r8
	.word 0xd03ac01f  ! 125: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1bad81f  ! 126: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad97f  ! 127: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd01aa028  ! 128: LDD_I	ldd	[%r10 + 0x0028], %r8
	.word 0xd3ba98bf  ! 129: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 130: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc202801f  ! 131: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xc3ba997f  ! 132: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcf9aa050  ! 133: LDDFA_I	ldda	[%r10, 0x0050], %f7
	.word 0xcfba99bf  ! 134: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc5baa038  ! 135: STDFA_I	stda	%f2, [0x0038, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5ba98bf  ! 136: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2911f  ! 137: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xccca905f  ! 138: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r6
	.word 0xcdf2a01f  ! 139: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba981f  ! 140: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc682e024  ! 141: LDUWA_I	lduwa	[%r11, + 0x0024] %asi, %r3
	.word 0xc2cad17f  ! 142: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r1
	.word 0xc3f2e01f  ! 143: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xd04a801f  ! 144: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xc4daa038  ! 145: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5e2a01f  ! 146: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc302a03c  ! 147: LDF_I	ld	[%r10, 0x003c], %f1
	.word 0xc3ba983f  ! 148: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 149: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc3e2a01f  ! 150: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc4c2d01f  ! 151: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r2
	.word 0xc5e2e01f  ! 152: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc602a050  ! 153: LDUW_I	lduw	[%r10 + 0x0050], %r3
	.word 0xc7ba981f  ! 154: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 155: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7ba997f  ! 156: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2a01f  ! 157: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xcb9aa070  ! 158: LDDFA_I	ldda	[%r10, 0x0070], %f5
	.word 0xc7baa050  ! 159: STDFA_I	stda	%f3, [0x0050, %r10]
	.word 0xce12a024  ! 160: LDUH_I	lduh	[%r10 + 0x0024], %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc2cad03f  ! 161: LDSBA_R	ldsba	[%r11, %r31] 0x81, %r1
	.word 0xc3bad87f  ! 162: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc03ac01f  ! 163: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3e2e01f  ! 164: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2e01f  ! 165: CASXA_R	casxa	[%r11]%asi, %r31, %r1
TH_LABEL165:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd102c01f  ! 166: LDF_R	ld	[%r11, %r31], %f8
	.word 0xc692905f  ! 167: LDUHA_R	lduha	[%r10, %r31] 0x82, %r3
	.word 0xd1baa040  ! 168: STDFA_I	stda	%f8, [0x0040, %r10]
	.word 0xc41ac01f  ! 169: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xc5e2e01f  ! 170: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd39ae070  ! 171: LDDFA_I	ldda	[%r11, 0x0070], %f9
	.word 0xd3bad9bf  ! 172: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 173: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xcb9ae040  ! 174: LDDFA_I	ldda	[%r11, 0x0040], %f5
	.word 0xcbbad85f  ! 175: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbbad89f  ! 176: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc9baa068  ! 177: STDFA_I	stda	%f4, [0x0068, %r10]
	.word 0xc9ba987f  ! 178: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc42e074  ! 179: LDSW_I	ldsw	[%r11 + 0x0074], %r6
	.word 0xcf22c01f  ! 180: STF_R	st	%f7, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfbad93f  ! 181: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd0d2e03a  ! 182: LDSHA_I	ldsha	[%r11, + 0x003a] %asi, %r8
	.word 0xcc5aa070  ! 183: LDX_I	ldx	[%r10 + 0x0070], %r6
	.word 0xc6cad11f  ! 184: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r3
	.word 0xc7e2e01f  ! 185: CASA_R	casa	[%r11] %asi, %r31, %r3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc25ac01f  ! 186: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xc3bad93f  ! 187: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc2da901f  ! 188: LDXA_R	ldxa	[%r10, %r31] 0x80, %r1
	.word 0xc3e2913f  ! 189: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc8d2d01f  ! 190: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9bad83f  ! 191: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xce0ae073  ! 192: LDUB_I	ldub	[%r11 + 0x0073], %r7
	.word 0xcfbad85f  ! 193: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcc4a801f  ! 194: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xc25a801f  ! 195: LDX_R	ldx	[%r10 + %r31], %r1
TH_LABEL195:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcd9ae018  ! 196: LDDFA_I	ldda	[%r11, 0x0018], %f6
	.word 0xcbbae040  ! 197: STDFA_I	stda	%f5, [0x0040, %r11]
	.word 0xd25aa050  ! 198: LDX_I	ldx	[%r10 + 0x0050], %r9
	.word 0xc84ae07a  ! 199: LDSB_I	ldsb	[%r11 + 0x007a], %r4
	.word 0xc9e2d11f  ! 200: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc45a801f  ! 201: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xc5e2a01f  ! 202: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5baa070  ! 203: STDFA_I	stda	%f2, [0x0070, %r10]
	.word 0xc5ba981f  ! 204: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd39aa030  ! 205: LDDFA_I	ldda	[%r10, 0x0030], %f9
TH_LABEL205:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc45aa000  ! 206: LDX_I	ldx	[%r10 + 0x0000], %r2
	.word 0xcc1ac01f  ! 207: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xc412801f  ! 208: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xd102c01f  ! 209: LDF_R	ld	[%r11, %r31], %f8
	.word 0xcd9aa030  ! 210: LDDFA_I	ldda	[%r10, 0x0030], %f6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdba98bf  ! 211: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc702c01f  ! 212: LDF_R	ld	[%r11, %r31], %f3
	.word 0xc7bad87f  ! 213: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc452a01e  ! 214: LDSH_I	ldsh	[%r10 + 0x001e], %r2
	.word 0xc5f2a01f  ! 215: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5ba981f  ! 216: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba989f  ! 217: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba997f  ! 218: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd00ac01f  ! 219: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xd25aa010  ! 220: LDX_I	ldx	[%r10 + 0x0010], %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3e2901f  ! 221: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd03a801f  ! 222: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc45a801f  ! 223: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xc5e2a01f  ! 224: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc482d01f  ! 225: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r2
TH_LABEL225:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd2c2901f  ! 226: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r9
	.word 0xd3ba993f  ! 227: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 228: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba993f  ! 229: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba997f  ! 230: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd03aa010  ! 231: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd3e2a01f  ! 232: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 233: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba98bf  ! 234: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa010  ! 235: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd03a801f  ! 236: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd0d2d13f  ! 237: LDSHA_R	ldsha	[%r11, %r31] 0x89, %r8
	.word 0xcf22801f  ! 238: STF_R	st	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 239: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc702801f  ! 240: LDF_R	ld	[%r10, %r31], %f3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc43aa010  ! 241: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xcf02a03c  ! 242: LDF_I	ld	[%r10, 0x003c], %f7
	.word 0xc902c01f  ! 243: LDF_R	ld	[%r11, %r31], %f4
	.word 0xd28a905f  ! 244: LDUBA_R	lduba	[%r10, %r31] 0x82, %r9
	.word 0xd03aa038  ! 245: STD_I	std	%r8, [%r10 + 0x0038]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3ba99bf  ! 246: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba995f  ! 247: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 248: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xca82905f  ! 249: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r5
	.word 0xcbba999f  ! 250: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbba981f  ! 251: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa038  ! 252: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xd20aa05a  ! 253: LDUB_I	ldub	[%r10 + 0x005a], %r9
	.word 0xd3ba991f  ! 254: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 255: CASA_R	casa	[%r10] %asi, %r31, %r9
TH_LABEL255:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3f2a01f  ! 256: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03aa058  ! 257: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3ba999f  ! 258: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc442c01f  ! 259: LDSW_R	ldsw	[%r11 + %r31], %r2
	.word 0xd00ae00f  ! 260: LDUB_I	ldub	[%r11 + 0x000f], %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1bad95f  ! 261: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad93f  ! 262: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 263: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc6c2901f  ! 264: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r3
	.word 0xc7e2a01f  ! 265: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7ba99bf  ! 266: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba99bf  ! 267: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 268: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcccad17f  ! 269: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r6
	.word 0xc79aa050  ! 270: LDDFA_I	ldda	[%r10, 0x0050], %f3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc41aa028  ! 271: LDD_I	ldd	[%r10 + 0x0028], %r2
	.word 0xc4d2a058  ! 272: LDSHA_I	ldsha	[%r10, + 0x0058] %asi, %r2
	.word 0xc43aa058  ! 273: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc5f2a01f  ! 274: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5f2901f  ! 275: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7baa038  ! 276: STDFA_I	stda	%f3, [0x0038, %r10]
	.word 0xce0a801f  ! 277: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xcc3aa038  ! 278: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcfba99bf  ! 279: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 280: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfe2a01f  ! 281: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcc1ae000  ! 282: LDD_I	ldd	[%r11 + 0x0000], %r6
	.word 0xcde2d13f  ! 283: CASA_I	casa	[%r11] 0x89, %r31, %r6
	.word 0xcdf2d03f  ! 284: CASXA_I	casxa	[%r11] 0x81, %r31, %r6
	.word 0xc812e04e  ! 285: LDUH_I	lduh	[%r11 + 0x004e], %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc502a024  ! 286: LDF_I	ld	[%r10, 0x0024], %f2
	.word 0xc5ba989f  ! 287: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2911f  ! 288: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5ba995f  ! 289: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc8da905f  ! 290: LDXA_R	ldxa	[%r10, %r31] 0x82, %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9ba98bf  ! 291: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 292: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xcb9aa078  ! 293: LDDFA_I	ldda	[%r10, 0x0078], %f5
	.word 0xcbf2903f  ! 294: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xcbf2913f  ! 295: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc2d2e044  ! 296: LDSHA_I	ldsha	[%r11, + 0x0044] %asi, %r1
	.word 0xc03ac01f  ! 297: STD_R	std	%r0, [%r11 + %r31]
	.word 0xcc02a054  ! 298: LDUW_I	lduw	[%r10 + 0x0054], %r6
	.word 0xcd9aa040  ! 299: LDDFA_I	ldda	[%r10, 0x0040], %f6
	.word 0xcc3aa040  ! 300: STD_I	std	%r6, [%r10 + 0x0040]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdba997f  ! 301: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba98bf  ! 302: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2913f  ! 303: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xd282d07f  ! 304: LDUWA_R	lduwa	[%r11, %r31] 0x83, %r9
	.word 0xd3bad83f  ! 305: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3bad9bf  ! 306: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 307: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad9bf  ! 308: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc2dae010  ! 309: LDXA_I	ldxa	[%r11, + 0x0010] %asi, %r1
	.word 0xcc02a04c  ! 310: LDUW_I	lduw	[%r10 + 0x004c], %r6
TH_LABEL310:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3baa038  ! 311: STDFA_I	stda	%f1, [0x0038, %r10]
	.word 0xc3e2913f  ! 312: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xcaca911f  ! 313: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r5
	.word 0xc692e002  ! 314: LDUHA_I	lduha	[%r11, + 0x0002] %asi, %r3
	.word 0xc7bad81f  ! 315: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdbae040  ! 316: STDFA_I	stda	%f6, [0x0040, %r11]
	.word 0xca4ae07b  ! 317: LDSB_I	ldsb	[%r11 + 0x007b], %r5
	.word 0xcbf2e01f  ! 318: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xc9baa008  ! 319: STDFA_I	stda	%f4, [0x0008, %r10]
	.word 0xd042a054  ! 320: LDSW_I	ldsw	[%r10 + 0x0054], %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03aa050  ! 321: STD_I	std	%r8, [%r10 + 0x0050]
	.word 0xd1f2a01f  ! 322: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba989f  ! 323: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba995f  ! 324: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc4d2a014  ! 325: LDSHA_I	ldsha	[%r10, + 0x0014] %asi, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5ba983f  ! 326: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xce5aa038  ! 327: LDX_I	ldx	[%r10 + 0x0038], %r7
	.word 0xcfba98bf  ! 328: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc4d2e064  ! 329: LDSHA_I	ldsha	[%r11, + 0x0064] %asi, %r2
	.word 0xc5bad93f  ! 330: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1baa008  ! 331: STDFA_I	stda	%f8, [0x0008, %r10]
	.word 0xd2caa056  ! 332: LDSBA_I	ldsba	[%r10, + 0x0056] %asi, %r9
	.word 0xd03a801f  ! 333: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3ba989f  ! 334: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc20ac01f  ! 335: LDUB_R	ldub	[%r11 + %r31], %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3e2d13f  ! 336: CASA_I	casa	[%r11] 0x89, %r31, %r1
	.word 0xc3e2d01f  ! 337: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc9bae018  ! 338: STDFA_I	stda	%f4, [0x0018, %r11]
	.word 0xc83ae018  ! 339: STD_I	std	%r4, [%r11 + 0x0018]
	.word 0xc2d2905f  ! 340: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc702a028  ! 341: LDF_I	ld	[%r10, 0x0028], %f3
	.word 0xc7ba997f  ! 342: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc252e03a  ! 343: LDSH_I	ldsh	[%r11 + 0x003a], %r1
	.word 0xc2da913f  ! 344: LDXA_R	ldxa	[%r10, %r31] 0x89, %r1
	.word 0xc68ae023  ! 345: LDUBA_I	lduba	[%r11, + 0x0023] %asi, %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3bae010  ! 346: STDFA_I	stda	%f9, [0x0010, %r11]
	.word 0xd3bad81f  ! 347: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3e2d01f  ! 348: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd03ae010  ! 349: STD_I	std	%r8, [%r11 + 0x0010]
	.word 0xd3bad9bf  ! 350: STDFA_R	stda	%f9, [%r31, %r11]
TH_LABEL350:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc8ca913f  ! 351: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r4
	.word 0xc9f2911f  ! 352: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc9f2903f  ! 353: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc83a801f  ! 354: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9e2a01f  ! 355: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9e2911f  ! 356: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc502a004  ! 357: LDF_I	ld	[%r10, 0x0004], %f2
	.word 0xc43aa000  ! 358: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc43aa000  ! 359: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc402801f  ! 360: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5e2a01f  ! 361: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc2ca903f  ! 362: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r1
	.word 0xc3ba987f  ! 363: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xceda901f  ! 364: LDXA_R	ldxa	[%r10, %r31] 0x80, %r7
	.word 0xd0ca917f  ! 365: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd03aa000  ! 366: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xce02801f  ! 367: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xcd9aa058  ! 368: LDDFA_I	ldda	[%r10, 0x0058], %f6
	.word 0xcdba999f  ! 369: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba991f  ! 370: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdf2a01f  ! 371: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba991f  ! 372: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba989f  ! 373: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc922801f  ! 374: STF_R	st	%f4, [%r31, %r10]
	.word 0xc9ba997f  ! 375: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd092901f  ! 376: LDUHA_R	lduha	[%r10, %r31] 0x80, %r8
	.word 0xd1f2a01f  ! 377: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd302a04c  ! 378: LDF_I	ld	[%r10, 0x004c], %f9
	.word 0xd03a801f  ! 379: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd322801f  ! 380: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3ba98bf  ! 381: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba991f  ! 382: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd0d2a03a  ! 383: LDSHA_I	ldsha	[%r10, + 0x003a] %asi, %r8
	.word 0xc2d2905f  ! 384: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r1
	.word 0xc64a801f  ! 385: LDSB_R	ldsb	[%r10 + %r31], %r3
TH_LABEL385:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7ba989f  ! 386: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc68aa025  ! 387: LDUBA_I	lduba	[%r10, + 0x0025] %asi, %r3
	.word 0xc7ba98bf  ! 388: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 389: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc282e030  ! 390: LDUWA_I	lduwa	[%r11, + 0x0030] %asi, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc03ac01f  ! 391: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc25ac01f  ! 392: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xc03ac01f  ! 393: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc3bad81f  ! 394: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xceda907f  ! 395: LDXA_R	ldxa	[%r10, %r31] 0x83, %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcff2a01f  ! 396: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc8c2d07f  ! 397: LDSWA_R	ldswa	[%r11, %r31] 0x83, %r4
	.word 0xc8cae07f  ! 398: LDSBA_I	ldsba	[%r11, + 0x007f] %asi, %r4
	.word 0xc9bad83f  ! 399: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 400: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd042a04c  ! 401: LDSW_I	ldsw	[%r10 + 0x004c], %r8
	.word 0xc682e074  ! 402: LDUWA_I	lduwa	[%r11, + 0x0074] %asi, %r3
	.word 0xc7e2d01f  ! 403: CASA_I	casa	[%r11] 0x80, %r31, %r3
	.word 0xc7f2e01f  ! 404: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xcc0ac01f  ! 405: LDUB_R	ldub	[%r11 + %r31], %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdf2d01f  ! 406: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad9bf  ! 407: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd052801f  ! 408: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xccd2e042  ! 409: LDSHA_I	ldsha	[%r11, + 0x0042] %asi, %r6
	.word 0xcdf2e01f  ! 410: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdf2d01f  ! 411: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad81f  ! 412: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad81f  ! 413: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xce52801f  ! 414: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xc45aa058  ! 415: LDX_I	ldx	[%r10 + 0x0058], %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5ba993f  ! 416: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc852a022  ! 417: LDSH_I	ldsh	[%r10 + 0x0022], %r4
	.word 0xce82d17f  ! 418: LDUWA_R	lduwa	[%r11, %r31] 0x8b, %r7
	.word 0xcfbad89f  ! 419: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xce0a801f  ! 420: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfba981f  ! 421: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 422: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba999f  ! 423: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 424: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc12801f  ! 425: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcac2d03f  ! 426: LDSWA_R	ldswa	[%r11, %r31] 0x81, %r5
	.word 0xd302a078  ! 427: LDF_I	ld	[%r10, 0x0078], %f9
	.word 0xc3baa008  ! 428: STDFA_I	stda	%f1, [0x0008, %r10]
	.word 0xc3ba989f  ! 429: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba987f  ! 430: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd28aa07e  ! 431: LDUBA_I	lduba	[%r10, + 0x007e] %asi, %r9
	.word 0xce8aa03f  ! 432: LDUBA_I	lduba	[%r10, + 0x003f] %asi, %r7
	.word 0xcc3a801f  ! 433: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba995f  ! 434: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 435: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc49aa048  ! 436: LDDA_I	ldda	[%r10, + 0x0048] %asi, %r2
	.word 0xcb22c01f  ! 437: STF_R	st	%f5, [%r31, %r11]
	.word 0xcbf2d01f  ! 438: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xd04a801f  ! 439: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xd1f2913f  ! 440: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1ba981f  ! 441: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba981f  ! 442: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2911f  ! 443: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xd1ba993f  ! 444: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa048  ! 445: STD_I	std	%r8, [%r10 + 0x0048]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcad2d01f  ! 446: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r5
	.word 0xcbbad87f  ! 447: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc80aa064  ! 448: LDUB_I	ldub	[%r10 + 0x0064], %r4
	.word 0xc9f2911f  ! 449: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba99bf  ! 450: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9ba999f  ! 451: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 452: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba99bf  ! 453: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd302a014  ! 454: LDF_I	ld	[%r10, 0x0014], %f9
	.word 0xd3ba989f  ! 455: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd292d13f  ! 456: LDUHA_R	lduha	[%r11, %r31] 0x89, %r9
	.word 0xc2caa059  ! 457: LDSBA_I	ldsba	[%r10, + 0x0059] %asi, %r1
	.word 0xc3ba993f  ! 458: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc45a801f  ! 459: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xd092913f  ! 460: LDUHA_R	lduha	[%r10, %r31] 0x89, %r8
TH_LABEL460:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd302801f  ! 461: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd3f2a01f  ! 462: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba991f  ! 463: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 464: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcbbae008  ! 465: STDFA_I	stda	%f5, [0x0008, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbbad89f  ! 466: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbad93f  ! 467: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d01f  ! 468: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xd292a00e  ! 469: LDUHA_I	lduha	[%r10, + 0x000e] %asi, %r9
	.word 0xd03aa008  ! 470: STD_I	std	%r8, [%r10 + 0x0008]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3ba993f  ! 471: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 472: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba995f  ! 473: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 474: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xcbbae008  ! 475: STDFA_I	stda	%f5, [0x0008, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbe2d11f  ! 476: CASA_I	casa	[%r11] 0x88, %r31, %r5
	.word 0xd3baa010  ! 477: STDFA_I	stda	%f9, [0x0010, %r10]
	.word 0xd3ba981f  ! 478: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba983f  ! 479: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xca0aa044  ! 480: LDUB_I	ldub	[%r10 + 0x0044], %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc99ae048  ! 481: LDDFA_I	ldda	[%r11, 0x0048], %f4
	.word 0xc9bad81f  ! 482: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc902c01f  ! 483: LDF_R	ld	[%r11, %r31], %f4
	.word 0xc9bad83f  ! 484: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d01f  ! 485: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcb9aa008  ! 486: LDDFA_I	ldda	[%r10, 0x0008], %f5
	.word 0xc28a907f  ! 487: LDUBA_R	lduba	[%r10, %r31] 0x83, %r1
	.word 0xc6c2a058  ! 488: LDSWA_I	ldswa	[%r10, + 0x0058] %asi, %r3
	.word 0xc7ba991f  ! 489: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 490: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xca0a801f  ! 491: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xcbba999f  ! 492: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc412801f  ! 493: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xd01a801f  ! 494: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xd28aa000  ! 495: LDUBA_I	lduba	[%r10, + 0x0000] %asi, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3f2a01f  ! 496: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba995f  ! 497: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03aa000  ! 498: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd3e2903f  ! 499: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd3ba997f  ! 500: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3f2a01f  ! 501: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba991f  ! 502: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2901f  ! 503: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba99bf  ! 504: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcc52801f  ! 505: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcde2a01f  ! 506: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcc3a801f  ! 507: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc902c01f  ! 508: LDF_R	ld	[%r11, %r31], %f4
	.word 0xca02801f  ! 509: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xc612801f  ! 510: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7e2913f  ! 511: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba981f  ! 512: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa000  ! 513: STD_I	std	%r2, [%r10 + 0x0000]
	.word 0xc7f2913f  ! 514: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba981f  ! 515: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7f2901f  ! 516: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xd09aa078  ! 517: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r8
	.word 0xce0aa01c  ! 518: LDUB_I	ldub	[%r10 + 0x001c], %r7
	.word 0xcf9aa050  ! 519: LDDFA_I	ldda	[%r10, 0x0050], %f7
	.word 0xcfba983f  ! 520: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc652a03c  ! 521: LDSH_I	ldsh	[%r10 + 0x003c], %r3
	.word 0xd012a052  ! 522: LDUH_I	lduh	[%r10 + 0x0052], %r8
	.word 0xceda915f  ! 523: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r7
	.word 0xcfba989f  ! 524: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3aa050  ! 525: STD_I	std	%r6, [%r10 + 0x0050]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcb02c01f  ! 526: LDF_R	ld	[%r11, %r31], %f5
	.word 0xd24a801f  ! 527: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xd3ba999f  ! 528: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd052c01f  ! 529: LDSH_R	ldsh	[%r11 + %r31], %r8
	.word 0xd1e2d01f  ! 530: CASA_I	casa	[%r11] 0x80, %r31, %r8
TH_LABEL530:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc49aa020  ! 531: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r2
	.word 0xc5ba987f  ! 532: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc892d01f  ! 533: LDUHA_R	lduha	[%r11, %r31] 0x80, %r4
	.word 0xc9bad89f  ! 534: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 535: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcb9aa020  ! 536: LDDFA_I	ldda	[%r10, 0x0020], %f5
	.word 0xcbba991f  ! 537: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba985f  ! 538: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd20ae07a  ! 539: LDUB_I	ldub	[%r11 + 0x007a], %r9
	.word 0xcedad15f  ! 540: LDXA_R	ldxa	[%r11, %r31] 0x8a, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfbad81f  ! 541: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd0d2a034  ! 542: LDSHA_I	ldsha	[%r10, + 0x0034] %asi, %r8
	.word 0xcb9aa048  ! 543: LDDFA_I	ldda	[%r10, 0x0048], %f5
	.word 0xc302801f  ! 544: LDF_R	ld	[%r10, %r31], %f1
	.word 0xce12c01f  ! 545: LDUH_R	lduh	[%r11 + %r31], %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfbad85f  ! 546: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2e01f  ! 547: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcc1a801f  ! 548: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc922801f  ! 549: STF_R	st	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 550: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9e2901f  ! 551: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc99ae028  ! 552: LDDFA_I	ldda	[%r11, 0x0028], %f4
	.word 0xcb9aa020  ! 553: LDDFA_I	ldda	[%r10, 0x0020], %f5
	.word 0xcbba997f  ! 554: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2a01f  ! 555: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc492a050  ! 556: LDUHA_I	lduha	[%r10, + 0x0050] %asi, %r2
	.word 0xc5e2903f  ! 557: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba98bf  ! 558: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba99bf  ! 559: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 560: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9baa000  ! 561: STDFA_I	stda	%f4, [0x0000, %r10]
	.word 0xc9ba997f  ! 562: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa000  ! 563: STD_I	std	%r4, [%r10 + 0x0000]
	.word 0xc9ba981f  ! 564: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc8c2a048  ! 565: LDSWA_I	ldswa	[%r10, + 0x0048] %asi, %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc612801f  ! 566: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xc7ba991f  ! 567: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa048  ! 568: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc7ba981f  ! 569: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba995f  ! 570: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7e2901f  ! 571: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba999f  ! 572: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc902a008  ! 573: LDF_I	ld	[%r10, 0x0008], %f4
	.word 0xc9ba995f  ! 574: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83a801f  ! 575: STD_R	std	%r4, [%r10 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9e2a01f  ! 576: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc892a044  ! 577: LDUHA_I	lduha	[%r10, + 0x0044] %asi, %r4
	.word 0xc9e2901f  ! 578: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba983f  ! 579: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc5baa068  ! 580: STDFA_I	stda	%f2, [0x0068, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc212c01f  ! 581: LDUH_R	lduh	[%r11 + %r31], %r1
	.word 0xc3bad97f  ! 582: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad81f  ! 583: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad87f  ! 584: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad81f  ! 585: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd292d05f  ! 586: LDUHA_R	lduha	[%r11, %r31] 0x82, %r9
	.word 0xd3bad9bf  ! 587: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd0d2e056  ! 588: LDSHA_I	ldsha	[%r11, + 0x0056] %asi, %r8
	.word 0xc202e008  ! 589: LDUW_I	lduw	[%r11 + 0x0008], %r1
	.word 0xc3e2e01f  ! 590: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3bad8bf  ! 591: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc01ae060  ! 592: LDD_I	ldd	[%r11 + 0x0060], %r0
	.word 0xc3bad85f  ! 593: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc522801f  ! 594: STF_R	st	%f2, [%r31, %r10]
	.word 0xc44ac01f  ! 595: LDSB_R	ldsb	[%r11 + %r31], %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc43ae060  ! 596: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xc25a801f  ! 597: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xc4daa000  ! 598: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r2
	.word 0xcf9ae068  ! 599: LDDFA_I	ldda	[%r11, 0x0068], %f7
	.word 0xcc12e024  ! 600: LDUH_I	lduh	[%r11 + 0x0024], %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdbad8bf  ! 601: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xce12801f  ! 602: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xd00a801f  ! 603: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xd1ba985f  ! 604: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc482913f  ! 605: LDUWA_R	lduwa	[%r10, %r31] 0x89, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5ba995f  ! 606: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2a01f  ! 607: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xd01ac01f  ! 608: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xd122c01f  ! 609: STF_R	st	%f8, [%r31, %r11]
	.word 0xd1e2d13f  ! 610: CASA_I	casa	[%r11] 0x89, %r31, %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc81aa050  ! 611: LDD_I	ldd	[%r10 + 0x0050], %r4
	.word 0xc83a801f  ! 612: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba997f  ! 613: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba98bf  ! 614: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xca8ad07f  ! 615: LDUBA_R	lduba	[%r11, %r31] 0x83, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbbad99f  ! 616: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc83ac01f  ! 617: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbbad83f  ! 618: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbf2d01f  ! 619: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xc852a002  ! 620: LDSH_I	ldsh	[%r10 + 0x0002], %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd2d2917f  ! 621: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r9
	.word 0xc81aa020  ! 622: LDD_I	ldd	[%r10 + 0x0020], %r4
	.word 0xcbba987f  ! 623: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2901f  ! 624: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xcc9aa020  ! 625: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r6
TH_LABEL625:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc45a801f  ! 626: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xc5f2a01f  ! 627: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5f2911f  ! 628: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xc5e2901f  ! 629: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc692e07e  ! 630: LDUHA_I	lduha	[%r11, + 0x007e] %asi, %r3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcecad07f  ! 631: LDSBA_R	ldsba	[%r11, %r31] 0x83, %r7
	.word 0xceca915f  ! 632: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r7
	.word 0xc8c2911f  ! 633: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r4
	.word 0xc302c01f  ! 634: LDF_R	ld	[%r11, %r31], %f1
	.word 0xcc8ae040  ! 635: LDUBA_I	lduba	[%r11, + 0x0040] %asi, %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc3ae040  ! 636: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xcdbad87f  ! 637: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad93f  ! 638: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad9bf  ! 639: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdf2e01f  ! 640: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc3ae040  ! 641: STD_I	std	%r6, [%r11 + 0x0040]
	.word 0xc40aa034  ! 642: LDUB_I	ldub	[%r10 + 0x0034], %r2
	.word 0xc43aa030  ! 643: STD_I	std	%r2, [%r10 + 0x0030]
	.word 0xc442801f  ! 644: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xc4cae070  ! 645: LDSBA_I	ldsba	[%r11, + 0x0070] %asi, %r2
TH_LABEL645:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd19ae038  ! 646: LDDFA_I	ldda	[%r11, 0x0038], %f8
	.word 0xd1bad97f  ! 647: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 648: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc6da917f  ! 649: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r3
	.word 0xd242801f  ! 650: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3e2911f  ! 651: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xd3e2a01f  ! 652: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba993f  ! 653: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 654: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xcc4a801f  ! 655: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xccc2d01f  ! 656: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r6
	.word 0xcc3ac01f  ! 657: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcde2e01f  ! 658: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcdbad9bf  ! 659: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd092913f  ! 660: LDUHA_R	lduha	[%r10, %r31] 0x89, %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1ba995f  ! 661: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc692d03f  ! 662: LDUHA_R	lduha	[%r11, %r31] 0x81, %r3
	.word 0xc7bad91f  ! 663: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc60aa000  ! 664: LDUB_I	ldub	[%r10 + 0x0000], %r3
	.word 0xd012a070  ! 665: LDUH_I	lduh	[%r10 + 0x0070], %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc80a801f  ! 666: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xc9ba99bf  ! 667: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd08a905f  ! 668: LDUBA_R	lduba	[%r10, %r31] 0x82, %r8
	.word 0xca82907f  ! 669: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r5
	.word 0xc83aa070  ! 670: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbf2901f  ! 671: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcbba997f  ! 672: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa070  ! 673: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xcbba995f  ! 674: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2911f  ! 675: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc59ae058  ! 676: LDDFA_I	ldda	[%r11, 0x0058], %f2
	.word 0xc5bad83f  ! 677: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc43ac01f  ! 678: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad97f  ! 679: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5e2e01f  ! 680: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5f2e01f  ! 681: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xc5bad89f  ! 682: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc49ae040  ! 683: LDDA_I	ldda	[%r11, + 0x0040] %asi, %r2
	.word 0xc43ac01f  ! 684: STD_R	std	%r2, [%r11 + %r31]
	.word 0xca8ad01f  ! 685: LDUBA_R	lduba	[%r11, %r31] 0x80, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc4cad07f  ! 686: LDSBA_R	ldsba	[%r11, %r31] 0x83, %r2
	.word 0xca4aa059  ! 687: LDSB_I	ldsb	[%r10 + 0x0059], %r5
	.word 0xcbba981f  ! 688: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbbaa030  ! 689: STDFA_I	stda	%f5, [0x0030, %r10]
	.word 0xcbf2913f  ! 690: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbe2911f  ! 691: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xcbe2911f  ! 692: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xcbe2a01f  ! 693: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xc4daa008  ! 694: LDXA_I	ldxa	[%r10, + 0x0008] %asi, %r2
	.word 0xcaca907f  ! 695: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc842c01f  ! 696: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xc9e2d13f  ! 697: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc9bad8bf  ! 698: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d01f  ! 699: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9bad93f  ! 700: STDFA_R	stda	%f4, [%r31, %r11]
TH_LABEL700:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9bad87f  ! 701: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd05a801f  ! 702: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xd1f2a01f  ! 703: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xccdaa070  ! 704: LDXA_I	ldxa	[%r10, + 0x0070] %asi, %r6
	.word 0xd102801f  ! 705: LDF_R	ld	[%r10, %r31], %f8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc1aa060  ! 706: LDD_I	ldd	[%r10 + 0x0060], %r6
	.word 0xcdf2a01f  ! 707: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc6dad11f  ! 708: LDXA_R	ldxa	[%r11, %r31] 0x88, %r3
	.word 0xc43ac01f  ! 709: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc43ae060  ! 710: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7bad83f  ! 711: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7e2d03f  ! 712: CASA_I	casa	[%r11] 0x81, %r31, %r3
	.word 0xc7bad87f  ! 713: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae060  ! 714: STD_I	std	%r2, [%r11 + 0x0060]
	.word 0xcc12801f  ! 715: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdf2901f  ! 716: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xca52a066  ! 717: LDSH_I	ldsh	[%r10 + 0x0066], %r5
	.word 0xcbba981f  ! 718: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xce52801f  ! 719: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xcfe2a01f  ! 720: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xce52c01f  ! 721: LDSH_R	ldsh	[%r11 + %r31], %r7
	.word 0xcfbad87f  ! 722: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc85a801f  ! 723: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xc9ba987f  ! 724: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc322801f  ! 725: STF_R	st	%f1, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3ba99bf  ! 726: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcc1a801f  ! 727: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xcfba983f  ! 728: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd00ae070  ! 729: LDUB_I	ldub	[%r11 + 0x0070], %r8
	.word 0xd03ae070  ! 730: STD_I	std	%r8, [%r11 + 0x0070]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc39ae018  ! 731: LDDFA_I	ldda	[%r11, 0x0018], %f1
	.word 0xcadae048  ! 732: LDXA_I	ldxa	[%r11, + 0x0048] %asi, %r5
	.word 0xc83ac01f  ! 733: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc89aa078  ! 734: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r4
	.word 0xc9e2901f  ! 735: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9ba98bf  ! 736: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 737: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc83aa078  ! 738: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xd19aa048  ! 739: LDDFA_I	ldda	[%r10, 0x0048], %f8
	.word 0xd1ba981f  ! 740: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbbaa028  ! 741: STDFA_I	stda	%f5, [0x0028, %r10]
	.word 0xcbba999f  ! 742: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba991f  ! 743: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2913f  ! 744: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xcbf2901f  ! 745: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc83a801f  ! 746: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbba991f  ! 747: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xce42c01f  ! 748: LDSW_R	ldsw	[%r11 + %r31], %r7
	.word 0xcff2e01f  ! 749: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xc2caa05d  ! 750: LDSBA_I	ldsba	[%r10, + 0x005d] %asi, %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3e2901f  ! 751: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba981f  ! 752: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba997f  ! 753: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa058  ! 754: STD_I	std	%r0, [%r10 + 0x0058]
	.word 0xc3e2911f  ! 755: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc80a801f  ! 756: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xd0daa040  ! 757: LDXA_I	ldxa	[%r10, + 0x0040] %asi, %r8
	.word 0xce82901f  ! 758: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r7
	.word 0xcfba993f  ! 759: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd302801f  ! 760: LDF_R	ld	[%r10, %r31], %f9
TH_LABEL760:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc682901f  ! 761: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r3
	.word 0xc242801f  ! 762: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xc3ba989f  ! 763: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc502c01f  ! 764: LDF_R	ld	[%r11, %r31], %f2
	.word 0xcd22801f  ! 765: STF_R	st	%f6, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc8c2a03c  ! 766: LDSWA_I	ldswa	[%r10, + 0x003c] %asi, %r4
	.word 0xc83a801f  ! 767: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba98bf  ! 768: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2a01f  ! 769: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba997f  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc83aa038  ! 771: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xc9f2a01f  ! 772: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc9ba99bf  ! 773: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd302801f  ! 774: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd3ba981f  ! 775: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd302a00c  ! 776: LDF_I	ld	[%r10, 0x000c], %f9
	.word 0xc692d01f  ! 777: LDUHA_R	lduha	[%r11, %r31] 0x80, %r3
	.word 0xd102a038  ! 778: LDF_I	ld	[%r10, 0x0038], %f8
	.word 0xc252801f  ! 779: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xc3ba987f  ! 780: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc4c2a01c  ! 781: LDSWA_I	ldswa	[%r10, + 0x001c] %asi, %r2
	.word 0xc5e2913f  ! 782: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5ba981f  ! 783: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2901f  ! 784: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc43aa018  ! 785: STD_I	std	%r2, [%r10 + 0x0018]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd01ae050  ! 786: LDD_I	ldd	[%r11 + 0x0050], %r8
	.word 0xd03ae050  ! 787: STD_I	std	%r8, [%r11 + 0x0050]
	.word 0xd19aa078  ! 788: LDDFA_I	ldda	[%r10, 0x0078], %f8
	.word 0xd1ba985f  ! 789: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc25a801f  ! 790: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3ba999f  ! 791: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd28a903f  ! 792: LDUBA_R	lduba	[%r10, %r31] 0x81, %r9
	.word 0xd3f2a01f  ! 793: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba999f  ! 794: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd03a801f  ! 795: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd00aa02b  ! 796: LDUB_I	ldub	[%r10 + 0x002b], %r8
	.word 0xd1ba991f  ! 797: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2913f  ! 798: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd1ba98bf  ! 799: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba997f  ! 800: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc802a038  ! 801: LDUW_I	lduw	[%r10 + 0x0038], %r4
	.word 0xc9ba999f  ! 802: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xce82905f  ! 803: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r7
	.word 0xcc1aa010  ! 804: LDD_I	ldd	[%r10 + 0x0010], %r6
	.word 0xcc3a801f  ! 805: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc3a801f  ! 806: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdf2901f  ! 807: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba991f  ! 808: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba987f  ! 809: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 810: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc3a801f  ! 811: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba989f  ! 812: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa010  ! 813: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xcc3aa010  ! 814: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xc922801f  ! 815: STF_R	st	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9ba985f  ! 816: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcd9ae040  ! 817: LDDFA_I	ldda	[%r11, 0x0040], %f6
	.word 0xcdbad99f  ! 818: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad81f  ! 819: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2e01f  ! 820: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcde2d01f  ! 821: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xc902801f  ! 822: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc83a801f  ! 823: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc8cad11f  ! 824: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r4
	.word 0xc9bad95f  ! 825: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc83ac01f  ! 826: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcd22801f  ! 827: STF_R	st	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 828: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc8c2d01f  ! 829: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r4
	.word 0xc9bad97f  ! 830: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc652a030  ! 831: LDSH_I	ldsh	[%r10 + 0x0030], %r3
	.word 0xcbbaa028  ! 832: STDFA_I	stda	%f5, [0x0028, %r10]
	.word 0xcbe2a01f  ! 833: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbe2a01f  ! 834: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xd302a000  ! 835: LDF_I	ld	[%r10, 0x0000], %f9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3ba99bf  ! 836: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc412a04a  ! 837: LDUH_I	lduh	[%r10 + 0x004a], %r2
	.word 0xd09ae000  ! 838: LDDA_I	ldda	[%r11, + 0x0000] %asi, %r8
	.word 0xd3bad99f  ! 839: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ae000  ! 840: STD_I	std	%r8, [%r11 + 0x0000]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3bad81f  ! 841: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 842: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xcbbae070  ! 843: STDFA_I	stda	%f5, [0x0070, %r11]
	.word 0xc83ac01f  ! 844: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcad2903f  ! 845: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd2dae048  ! 846: LDXA_I	ldxa	[%r11, + 0x0048] %asi, %r9
	.word 0xd03ae048  ! 847: STD_I	std	%r8, [%r11 + 0x0048]
	.word 0xd3f2e01f  ! 848: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2d01f  ! 849: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xd3f2e01f  ! 850: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc202801f  ! 851: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xc3ba985f  ! 852: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 853: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2911f  ! 854: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xc3ba985f  ! 855: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcf9aa038  ! 856: LDDFA_I	ldda	[%r10, 0x0038], %f7
	.word 0xcfba999f  ! 857: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc852a038  ! 858: LDSH_I	ldsh	[%r10 + 0x0038], %r4
	.word 0xd0c2917f  ! 859: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r8
	.word 0xcd02a02c  ! 860: LDF_I	ld	[%r10, 0x002c], %f6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdba993f  ! 861: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcf9aa020  ! 862: LDDFA_I	ldda	[%r10, 0x0020], %f7
	.word 0xcfe2a01f  ! 863: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba997f  ! 864: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 865: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc3aa020  ! 866: STD_I	std	%r6, [%r10 + 0x0020]
	.word 0xcfe2a01f  ! 867: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc322801f  ! 868: STF_R	st	%f1, [%r31, %r10]
	.word 0xc522c01f  ! 869: STF_R	st	%f2, [%r31, %r11]
	.word 0xc5f2d13f  ! 870: CASXA_I	casxa	[%r11] 0x89, %r31, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5e2d01f  ! 871: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xc43ac01f  ! 872: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc5bad81f  ! 873: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xca5aa000  ! 874: LDX_I	ldx	[%r10 + 0x0000], %r5
	.word 0xc5bae008  ! 875: STDFA_I	stda	%f2, [0x0008, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc48ae026  ! 876: LDUBA_I	lduba	[%r11, + 0x0026] %asi, %r2
	.word 0xc5bad99f  ! 877: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcd9ae018  ! 878: LDDFA_I	ldda	[%r11, 0x0018], %f6
	.word 0xcdf2d01f  ! 879: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xc4d2a01e  ! 880: LDSHA_I	ldsha	[%r10, + 0x001e] %asi, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5f2901f  ! 881: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2a01f  ! 882: CASXA_R	casxa	[%r10]%asi, %r31, %r2
	.word 0xc5ba999f  ! 883: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba99bf  ! 884: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcb9aa038  ! 885: LDDFA_I	ldda	[%r10, 0x0038], %f5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc302e02c  ! 886: LDF_I	ld	[%r11, 0x002c], %f1
	.word 0xc3f2e01f  ! 887: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3f2e01f  ! 888: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad93f  ! 889: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc452801f  ! 890: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd0d2913f  ! 891: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r8
	.word 0xd1ba985f  ! 892: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1ba98bf  ! 893: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 894: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba981f  ! 895: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd03aa028  ! 896: STD_I	std	%r8, [%r10 + 0x0028]
	.word 0xd1ba993f  ! 897: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 898: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd102c01f  ! 899: LDF_R	ld	[%r11, %r31], %f8
	.word 0xcb02e010  ! 900: LDF_I	ld	[%r11, 0x0010], %f5
TH_LABEL900:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7baa020  ! 901: STDFA_I	stda	%f3, [0x0020, %r10]
	.word 0xca52e000  ! 902: LDSH_I	ldsh	[%r11 + 0x0000], %r5
	.word 0xce12801f  ! 903: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xc682a078  ! 904: LDUWA_I	lduwa	[%r10, + 0x0078] %asi, %r3
	.word 0xc79ae000  ! 905: LDDFA_I	ldda	[%r11, 0x0000], %f3
TH_LABEL905:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7f2d13f  ! 906: CASXA_I	casxa	[%r11] 0x89, %r31, %r3
	.word 0xc302801f  ! 907: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc24aa020  ! 908: LDSB_I	ldsb	[%r10 + 0x0020], %r1
	.word 0xc84aa00e  ! 909: LDSB_I	ldsb	[%r10 + 0x000e], %r4
	.word 0xc83aa008  ! 910: STD_I	std	%r4, [%r10 + 0x0008]
TH_LABEL910:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcf02a064  ! 911: LDF_I	ld	[%r10, 0x0064], %f7
	.word 0xc302a010  ! 912: LDF_I	ld	[%r10, 0x0010], %f1
	.word 0xc3e2a01f  ! 913: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3f2913f  ! 914: CASXA_I	casxa	[%r10] 0x89, %r31, %r1
	.word 0xc3f2a01f  ! 915: CASXA_R	casxa	[%r10]%asi, %r31, %r1
TH_LABEL915:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3ba983f  ! 916: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2911f  ! 917: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xcc02c01f  ! 918: LDUW_R	lduw	[%r11 + %r31], %r6
	.word 0xc79ae010  ! 919: LDDFA_I	ldda	[%r11, 0x0010], %f3
	.word 0xd0d2915f  ! 920: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd03aa010  ! 921: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xd1e2911f  ! 922: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xd1ba995f  ! 923: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2901f  ! 924: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd03aa010  ! 925: STD_I	std	%r8, [%r10 + 0x0010]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc252c01f  ! 926: LDSH_R	ldsh	[%r11 + %r31], %r1
	.word 0xc3e2e01f  ! 927: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc6c2e034  ! 928: LDSWA_I	ldswa	[%r11, + 0x0034] %asi, %r3
	.word 0xc7bad81f  ! 929: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc4c2915f  ! 930: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdbaa070  ! 931: STDFA_I	stda	%f6, [0x0070, %r10]
	.word 0xcde2a01f  ! 932: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2901f  ! 933: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdba999f  ! 934: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3aa070  ! 935: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc3aa070  ! 936: STD_I	std	%r6, [%r10 + 0x0070]
	.word 0xc7baa058  ! 937: STDFA_I	stda	%f3, [0x0058, %r10]
	.word 0xd2ca913f  ! 938: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r9
	.word 0xcb9ae030  ! 939: LDDFA_I	ldda	[%r11, 0x0030], %f5
	.word 0xc492d03f  ! 940: LDUHA_R	lduha	[%r11, %r31] 0x81, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9bae058  ! 941: STDFA_I	stda	%f4, [0x0058, %r11]
	.word 0xd002801f  ! 942: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xd1ba99bf  ! 943: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 944: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba995f  ! 945: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1ba98bf  ! 946: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2901f  ! 947: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc4c2915f  ! 948: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r2
	.word 0xd302801f  ! 949: LDF_R	ld	[%r10, %r31], %f9
	.word 0xd3e2903f  ! 950: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc6d2e02a  ! 951: LDSHA_I	ldsha	[%r11, + 0x002a] %asi, %r3
	.word 0xc43ae028  ! 952: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc43ac01f  ! 953: STD_R	std	%r2, [%r11 + %r31]
	.word 0xd102a030  ! 954: LDF_I	ld	[%r10, 0x0030], %f8
	.word 0xc5bae008  ! 955: STDFA_I	stda	%f2, [0x0008, %r11]
TH_LABEL955:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc292911f  ! 956: LDUHA_R	lduha	[%r10, %r31] 0x88, %r1
	.word 0xc3ba997f  ! 957: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03aa008  ! 958: STD_I	std	%r0, [%r10 + 0x0008]
	.word 0xcfbaa048  ! 959: STDFA_I	stda	%f7, [0x0048, %r10]
	.word 0xcfba999f  ! 960: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xca0ae013  ! 961: LDUB_I	ldub	[%r11 + 0x0013], %r5
	.word 0xca5ae030  ! 962: LDX_I	ldx	[%r11 + 0x0030], %r5
	.word 0xcbbad9bf  ! 963: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd002801f  ! 964: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xd1ba989f  ! 965: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd03aa030  ! 966: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xd1ba98bf  ! 967: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc302e070  ! 968: LDF_I	ld	[%r11, 0x0070], %f1
	.word 0xc3bad87f  ! 969: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad91f  ! 970: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd39aa058  ! 971: LDDFA_I	ldda	[%r10, 0x0058], %f9
	.word 0xd3ba991f  ! 972: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 973: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd2ca915f  ! 974: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r9
	.word 0xd01aa068  ! 975: LDD_I	ldd	[%r10 + 0x0068], %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xccc2d07f  ! 976: LDSWA_R	ldswa	[%r11, %r31] 0x83, %r6
	.word 0xcc42a030  ! 977: LDSW_I	ldsw	[%r10 + 0x0030], %r6
	.word 0xd2c2907f  ! 978: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r9
	.word 0xceda913f  ! 979: LDXA_R	ldxa	[%r10, %r31] 0x89, %r7
	.word 0xcc3aa030  ! 980: STD_I	std	%r6, [%r10 + 0x0030]
TH_LABEL980:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc3aa030  ! 981: STD_I	std	%r6, [%r10 + 0x0030]
	.word 0xc64a801f  ! 982: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xc7e2901f  ! 983: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xd20aa002  ! 984: LDUB_I	ldub	[%r10 + 0x0002], %r9
	.word 0xc60aa040  ! 985: LDUB_I	ldub	[%r10 + 0x0040], %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7f2a01f  ! 986: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba999f  ! 987: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc68aa03b  ! 988: LDUBA_I	lduba	[%r10, + 0x003b] %asi, %r3
	.word 0xcf02a038  ! 989: LDF_I	ld	[%r10, 0x0038], %f7
	.word 0xcff2a01f  ! 990: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc3a801f  ! 991: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba99bf  ! 992: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc84ae018  ! 993: LDSB_I	ldsb	[%r11 + 0x0018], %r4
	.word 0xc9bad81f  ! 994: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 995: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcf9aa030  ! 996: LDDFA_I	ldda	[%r10, 0x0030], %f7
	.word 0xcec2e034  ! 997: LDSWA_I	ldswa	[%r11, + 0x0034] %asi, %r7
	.word 0xcfbad81f  ! 998: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc3baa018  ! 999: STDFA_I	stda	%f1, [0x0018, %r10]
	.word 0xc03a801f  ! 1000: STD_R	std	%r0, [%r10 + %r31]
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
.xword 0x132c2961491d300f
.xword 0xc0fb6c94a5c0d8a4
.xword 0x989e9cc4a3cfdce6
.xword 0x36228bb729def116
.xword 0xfd8e88b682d2a618
.xword 0x3fc063fa4c636dd7
.xword 0x808505033a0a28b1
.xword 0x45dbb28856a280ed
.xword 0x7f27dac61451992a
.xword 0x780f0aa61bc7ca3e
.xword 0x6987bc621836ab36
.xword 0x7a8c00ca9779fb81
.xword 0xa7015a54891a7cab
.xword 0xea9ed95abd79fa0e
.xword 0x929d2b82952e6e18
.xword 0x520a263de61d92c7
.xword 0x2abd95fe4f131ed8
.xword 0x4c58544c2b2a7bc6
.xword 0x834160e03dc1655f
.xword 0x2b1798eed6c96a1e
.xword 0xafbf5dd13b5be312
.xword 0xa710ee16ceecc5f6
.xword 0xeb1ae529f1045e80
.xword 0xbe6082df30b7ab1a
.xword 0xad5e914a745f5359
.xword 0xe132df387b847e49
.xword 0xbd3897697df8943d
.xword 0x9812beb943b973aa
.xword 0x77160ce2557b9e73
.xword 0x017b198dc0401707
.xword 0xd7b0d2889929dd38
.xword 0x7c69cbc6fbcbf0c0



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
.xword 0x2e14e91acae3ce05

.xword 0xf9bc92fb6dacc7e1

.xword 0x6616e10c4e7f01b3

.xword 0xf0a3103bbcf5fefa

.xword 0x10d7e5f5bd30f8c6

.xword 0x3425110363394023

.xword 0xd21763a42a4cf4fe

.xword 0xa303d18a7afdec51

.xword 0xdd5600d8773f32a6

.xword 0xf8b87977c85a6ffd

.xword 0x01e3e2f6a10e231d

.xword 0xf18d6ab1c473098b

.xword 0x33872f61abef555c

.xword 0xc2f8842a372de12b

.xword 0x2557ac274d7454e1

.xword 0xd103ed2d90717d6b

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
.xword 0xe939e541f199b6cd
.xword 0xc58cf8dbaf365847
.xword 0x1e1a8436548cc92e
.xword 0x454736cdda1446eb
.xword 0x507b3a6b2227f800
.xword 0x798c5cf8ca3da330
.xword 0x17b194221a6db362
.xword 0x49e6d428984d3227
.xword 0x7778c1984da2c60e




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
.xword 0x258069469a796182
.xword 0xffe5f2be1b58dec9
.xword 0x0200e5973233f167
.xword 0xcbd7a9c910040555
.xword 0x21ea348f9afe85ba
.xword 0xf350194e31647055
.xword 0x8a6e79cd453b5a82
.xword 0x39c9a4da44dcf9f4
.xword 0xa200e50502bee454




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
.xword 0x92ae7873a9eb1881
.xword 0xacbdd9778a1f31b4
.xword 0x4d955784a59c5169
.xword 0xdaa5b4f80244eb41
.xword 0x05c3a18df038a76c
.xword 0x259f9c91f95a3abf
.xword 0x2f2c9c0ab0846dea
.xword 0x3fc15bc5126e60c1
.xword 0xea5e9639f93bf5de




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
.xword 0xffc4f1ad449039fd
.xword 0x670a4a4018f8fa1a
.xword 0x6ccb0e95fa248dec
.xword 0xdea16b0e066ce575
.xword 0xb9bca78a0b319657
.xword 0x74bb40dc5572806a
.xword 0x6dfe218c8165644f
.xword 0xd23a8d5510ba1824
.xword 0xbfa5297829e0b634




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
.xword 0xaef4dcf76c241311
.xword 0xdc420c313edc1129
.xword 0x270400af4532b451
.xword 0xed357feadfbfa92d
.xword 0xe90bb998a9f485da
.xword 0x2422ccfbaead089f
.xword 0x5fac69bb1e5c2aac
.xword 0xf9e6587226103056
.xword 0x47f8e5f98b44eaae




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
.xword 0x92e0b34b53f2d117
.xword 0xf97ab9a51985b19c
.xword 0x81551d3c591c1c07
.xword 0xcbfc2b24d0d14248
.xword 0x31cb201212482f8e
.xword 0x1d4924e6dafebdc4
.xword 0x865a9f04b7383696
.xword 0x2bdc1c817c2cb658
.xword 0x5b61eff0aaf0efc1




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
.xword 0x9aff284ebba21ece
.xword 0x1e576f82cff3fb2d
.xword 0x84dc37268e3683e8
.xword 0x16003a96aeccacee
.xword 0x77faa7da03275705
.xword 0x9d55a5b7c796d587
.xword 0xdf44309d7614d5e2
.xword 0xcf8b84520b4eb1f3
.xword 0x667ff48817a94279






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
.xword 0xc5f4c3eff76c9a80

.xword 0x1030ade24d67c805

.xword 0x93e632fbb0f28333

.xword 0x6ff3563d9848e576

.xword 0x4c985e163a4aaed1

.xword 0x7e9039332e8faf69

.xword 0xc42ec2f70d5ae059

.xword 0x0d3ae1bf7b45ed38

.xword 0xf41dd1fb835cd67d

.xword 0x73e258b2f623cff2

.xword 0x83ca88239b208fed

.xword 0xf1a6cbcae605cec2

.xword 0xb5a3341dd2821547

.xword 0xb5e24d476969ab3f

.xword 0xc112e0f742f79afb

.xword 0x0ebf2cf25c0720be




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
.xword 0x4ce34167e550f553
.xword 0x13f19821d11e4f86
.xword 0x07db609d4d2b9d78
.xword 0x7698d8b69797311b
.xword 0x44971bfc9a589fac
.xword 0xf3787180c6a2d9b3
.xword 0x387a39b1f6280537
.xword 0x4f0f30a9b8036b3a



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
.xword 0xb22fc8b108da0c23
.xword 0x1af52bf7d73e8f2b
.xword 0x77e2606d00547f7c
.xword 0x3672009ffb469838
.xword 0x912283fbccbdbab3
.xword 0x280e11080443cf79
.xword 0x39bb408936d0ed43
.xword 0x2da8bcec7271e37e



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
.xword 0x89919ff2d141ecf1
.xword 0xec03f9094b015f6d
.xword 0x0c33babf07b2b685
.xword 0xfaea76c865ea6730
.xword 0x64b6b99b90b5d7c6
.xword 0xa652a348f5663389
.xword 0x27b6ca443f03df62
.xword 0xc0128421a0457688



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
.xword 0x3d65c3ae66c0cdf6
.xword 0xc4d997fbf53ae7f4
.xword 0x08a91bb14c583a01
.xword 0xc10e725219db11dd
.xword 0x9bafc0d595a1a039
.xword 0xb6eee05882f78bbc
.xword 0x4136a995292f1788
.xword 0xdb2b8bf369ba6f6c



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
.xword 0x9b1fb976b5ed320f
.xword 0xb774aac78959f2f9
.xword 0x6c094ec638ea6c42
.xword 0x0d482d3fa3dcee52
.xword 0x3e46b41515cabf03
.xword 0xd70f3ce55e4559cc
.xword 0xc2d890ff5fba3c47
.xword 0xb761e2472a5f83aa



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
.xword 0xc06d1c5e8e1f60f7
.xword 0x5a8bf9a2572c6350
.xword 0x4a29e9648c18bd7b
.xword 0xa3e09a0fc5b7a8aa
.xword 0x5200dc63cbe14296
.xword 0x4e699fa37b0fd04d
.xword 0xa87f6a4dcdbce578
.xword 0x6ec35f2084700460



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
.xword 0x0b3a43826d234b34
.xword 0xc54be5495a65e552
.xword 0x037b6fe2f80e9248
.xword 0x4f58463ff138688f
.xword 0x01ab9ab906e3cc18
.xword 0xf89ae34b9592c056
.xword 0xd7eb122f8a5393b3
.xword 0x50e22d1fb0329fa0





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
.xword 0x2bef686ae3958b92

.xword 0x09a2b3bb387895dc

.xword 0x32f593f34ce965fe

.xword 0xee4b63ac285a5413

.xword 0x62114d4f60dc7cd2

.xword 0x45d5e1fa3949b4d1

.xword 0xa9704fc37eb17998

.xword 0x5c0b798bbeb03316

.xword 0x3bb5a825064dfa8e

.xword 0x647889815d64e3b9

.xword 0x04ce381d8461631c

.xword 0x623f70dfa6e90907

.xword 0xb5f2da619667c18a

.xword 0x1e0b1faaa49876bf

.xword 0x22da8d848b5d6420

.xword 0x83e30a8b11523fc9

.xword 0xdf55754b54381797

.xword 0xfa0a9b51b2c6b381

.xword 0xa1d84d1a2c7ed36d

.xword 0x6eb30e99433dfc8f

.xword 0xd7284ec950025c08

.xword 0x9ba1b2d001da05db

.xword 0x97d91016cf0df650

.xword 0x83bf57c3f635739f

.xword 0xe3d18816661a066d

.xword 0xe89ae772bdebd536

.xword 0x7087b41c80f02b83

.xword 0x180c7dd54c874552

.xword 0x6ba4127f08417ae3

.xword 0xc5404bbaa87d979a

.xword 0x8d859844dc141f37

.xword 0x3ce26f62aaed1e72

.xword 0x65c2b8484fef8a32

.xword 0x8fb5e13753508079

.xword 0x9dccc63cc4275c4b

.xword 0x3193f853194691d1

.xword 0x81fa81ef34d8076a

.xword 0xbc5f77e8699fae65

.xword 0xf185cc4e93551d0f

.xword 0x0e96fa0738e9c8ef

.xword 0x28370c20f551ea4f

.xword 0x11a314302c2c147b

.xword 0x5d2fd028246087de

.xword 0x03eea8904e367ed5

.xword 0x0c523589ee33e2a4

.xword 0xfbcbc836b95fe852

.xword 0x810d6e2130e424e8

.xword 0xf2ca4a1d048eb00a

.xword 0xeefaf712fbb13527

.xword 0xef682d758b35310b

.xword 0x8861b08b7bd7b5ac

.xword 0xb753efdb09113cbf

.xword 0x8448f40850a9e9d2

.xword 0xf168119c43ed3329

.xword 0x19ee8e51131a9c5a

.xword 0x759a0f87c0b029ac

.xword 0xf22fb75191daacdf

.xword 0x3b2c358d798ebc89

.xword 0xce9fc85415be500b

.xword 0x5d45333b6f28fc33

.xword 0xcb38fb45e220496f

.xword 0xe36be57ed493dd2d

.xword 0x8d243f2a2ee7bf06

.xword 0x6b39a195b5f453a8

.xword 0x32f4660d5ffa96be

.xword 0xd15309f456d8dec4

.xword 0x404ca86c60358b8a

.xword 0xce6c748f4d86b7df

.xword 0x7f2cae6e6f807564

.xword 0xf3a2e411fb2c2aa4

.xword 0xace73f4cc8acaeee

.xword 0xc85adf90214f985d

.xword 0x934e95c1823c1e6e

.xword 0xa86b70087f93ae68

.xword 0x4523950adfb8b0a6

.xword 0x07fe2a4d76bea047

.xword 0xb14aefc9b42f3e20

.xword 0xa0b4ef2f4c0542b8

.xword 0x2bfa6806897446ca

.xword 0x5b34b0d660556988

.xword 0x375296a20786b541

.xword 0xfd386d07947800d9

.xword 0x727d719398ec2eb7

.xword 0xade52166e8f4210f

.xword 0xdaf58df099e8ca92

.xword 0xe054a987c88ffad9

.xword 0x98c6f84e1497613c

.xword 0x053626cf8aacc685

.xword 0xc90643beb571788e

.xword 0xea17773146438250

.xword 0xd221ac82e8137e84

.xword 0x6f1ff2696bf969a4

.xword 0x4cd730d7d5b9f90c

.xword 0xaa410a244e125de6

.xword 0x5e1eb43622df1d47

.xword 0x53c0436f19a29600

.xword 0xbddd906cdd54b0bf

.xword 0x4e6c5126953f580a

.xword 0x2fd89e513c01b0a2

.xword 0x4fa05586b4e7a1b5

.xword 0x4ac524657366ccc4

.xword 0x8d4bdd762ade8555

.xword 0xe92fdf1ac2ce3b14

.xword 0x2b9be7abff6caf98

.xword 0x11a03ed83d201b8b

.xword 0x677675310bbb2592

.xword 0xcf00bf7520964e1b

.xword 0xfbfaa75c6a940fc6

.xword 0xe0ccfeb4c09633a0

.xword 0x55c42cea02def0a1

.xword 0xc2c243d5d3d6e5ca

.xword 0x973732ff020d6939

.xword 0xd6747e2889f1ee52

.xword 0x04e88db10b0f8239

.xword 0x7469230618c814e0

.xword 0xa70faa231e6e8b0c

.xword 0xb4cacb4b9a2fbe7b

.xword 0x41adf35dfdf243b1

.xword 0x063745df474a70e7

.xword 0x0f371229d0d6fe93

.xword 0xcdbb6ca64588d8eb

.xword 0x08cad06416f88cb6

.xword 0x5010561f1ee2441d

.xword 0x68f999c26e472e0a

.xword 0x58f3579162aba2b0

.xword 0x43c83b99e5b001b0

.xword 0xd5c2692ea894d1d9

.xword 0xb4361df1aad76fd3

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
