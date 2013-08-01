/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: lsu_casa_std_pst9.s
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
	setx 0x4ea8af163e3d8652, %g1, %r2
	setx 0xbb4e81a8ed5f167c, %g1, %r3
	setx 0x769779d0ff373c00, %g1, %r4
	setx 0x2b78fb1929a56203, %g1, %r5
	setx 0x4e507f5c4e8e574f, %g1, %r6
	setx 0xcd94898cec323d49, %g1, %r7
	setx 0x59336c3f693553c6, %g1, %r8

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
	.word 0xc9ba99bf  ! 1: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc6da905f  ! 2: LDXA_R	ldxa	[%r10, %r31] 0x82, %r3
	.word 0xc40ae04a  ! 3: LDUB_I	ldub	[%r11 + 0x004a], %r2
	.word 0xc49aa058  ! 4: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r2
	.word 0xc5f2d01f  ! 5: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc4a801f  ! 6: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xc59aa048  ! 7: LDDFA_I	ldda	[%r10, 0x0048], %f2
	.word 0xcdba987f  ! 8: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2911f  ! 9: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xd3baa038  ! 10: STDFA_I	stda	%f9, [0x0038, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc25ae050  ! 11: LDX_I	ldx	[%r11 + 0x0050], %r1
	.word 0xcff2d01f  ! 12: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad8bf  ! 13: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad81f  ! 14: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad93f  ! 15: STDFA_R	stda	%f7, [%r31, %r11]
TH_LABEL15:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd24ac01f  ! 16: LDSB_R	ldsb	[%r11 + %r31], %r9
	.word 0xcedaa050  ! 17: LDXA_I	ldxa	[%r10, + 0x0050] %asi, %r7
	.word 0xc612e078  ! 18: LDUH_I	lduh	[%r11 + 0x0078], %r3
	.word 0xc7ba981f  ! 19: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 20: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL20:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc4c2911f  ! 21: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r2
	.word 0xc5f2901f  ! 22: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xce42801f  ! 23: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xd1bad9bf  ! 24: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc902801f  ! 25: LDF_R	ld	[%r10, %r31], %f4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xce52a046  ! 26: LDSH_I	ldsh	[%r10 + 0x0046], %r7
	.word 0xc802e068  ! 27: LDUW_I	lduw	[%r11 + 0x0068], %r4
	.word 0xc5e2a01f  ! 28: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2901f  ! 29: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5e2a01f  ! 30: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5ba985f  ! 31: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd012a058  ! 32: LDUH_I	lduh	[%r10 + 0x0058], %r8
	.word 0xc7ba983f  ! 33: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 34: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7f2a01f  ! 35: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7baa070  ! 36: STDFA_I	stda	%f3, [0x0070, %r10]
	.word 0xd03aa040  ! 37: STD_I	std	%r8, [%r10 + 0x0040]
	.word 0xd3ba981f  ! 38: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 39: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd2da903f  ! 40: LDXA_R	ldxa	[%r10, %r31] 0x81, %r9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd292a04e  ! 41: LDUHA_I	lduha	[%r10, + 0x004e] %asi, %r9
	.word 0xcc8a915f  ! 42: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r6
	.word 0xc9f2901f  ! 43: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc242801f  ! 44: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xc83ac01f  ! 45: STD_R	std	%r4, [%r11 + %r31]
TH_LABEL45:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9e2d13f  ! 46: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc83ae068  ! 47: STD_I	std	%r4, [%r11 + 0x0068]
	.word 0xc9bad83f  ! 48: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 49: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2e01f  ! 50: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc2c2d13f  ! 51: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r1
	.word 0xd1ba995f  ! 52: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd282d15f  ! 53: LDUWA_R	lduwa	[%r11, %r31] 0x8a, %r9
	.word 0xc802a004  ! 54: LDUW_I	lduw	[%r10 + 0x0004], %r4
	.word 0xd03ac01f  ! 55: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3f2d01f  ! 56: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xc492d05f  ! 57: LDUHA_R	lduha	[%r11, %r31] 0x82, %r2
	.word 0xcfbae038  ! 58: STDFA_I	stda	%f7, [0x0038, %r11]
	.word 0xcfbad81f  ! 59: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d01f  ! 60: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfbad91f  ! 61: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc79aa058  ! 62: LDDFA_I	ldda	[%r10, 0x0058], %f3
	.word 0xc4ca917f  ! 63: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r2
	.word 0xcc3a801f  ! 64: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd19aa068  ! 65: LDDFA_I	ldda	[%r10, 0x0068], %f8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdf2a01f  ! 66: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc3a801f  ! 67: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba997f  ! 68: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xccd2a02a  ! 69: LDSHA_I	ldsha	[%r10, + 0x002a] %asi, %r6
	.word 0xcd02a06c  ! 70: LDF_I	ld	[%r10, 0x006c], %f6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcb02801f  ! 71: LDF_R	ld	[%r10, %r31], %f5
	.word 0xcde2a01f  ! 72: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2911f  ! 73: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcc02c01f  ! 74: LDUW_R	lduw	[%r11 + %r31], %r6
	.word 0xcc3aa000  ! 75: STD_I	std	%r6, [%r10 + 0x0000]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc48a913f  ! 76: LDUBA_R	lduba	[%r10, %r31] 0x89, %r2
	.word 0xc9bad89f  ! 77: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd322801f  ! 78: STF_R	st	%f9, [%r31, %r10]
	.word 0xc2c2e070  ! 79: LDSWA_I	ldswa	[%r11, + 0x0070] %asi, %r1
	.word 0xc3baa018  ! 80: STDFA_I	stda	%f1, [0x0018, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc4d2911f  ! 81: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r2
	.word 0xd092d15f  ! 82: LDUHA_R	lduha	[%r11, %r31] 0x8a, %r8
	.word 0xc9ba987f  ! 83: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 84: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83aa070  ! 85: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xccdaa050  ! 86: LDXA_I	ldxa	[%r10, + 0x0050] %asi, %r6
	.word 0xc5bad97f  ! 87: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd252a008  ! 88: LDSH_I	ldsh	[%r10 + 0x0008], %r9
	.word 0xc5ba985f  ! 89: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 90: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5ba981f  ! 91: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 92: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc92a04a  ! 93: LDUHA_I	lduha	[%r10, + 0x004a] %asi, %r6
	.word 0xc03aa058  ! 94: STD_I	std	%r0, [%r10 + 0x0058]
	.word 0xce12c01f  ! 95: LDUH_R	lduh	[%r11 + %r31], %r7
TH_LABEL95:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3ba993f  ! 96: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 97: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2901f  ! 98: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba981f  ! 99: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xced2a006  ! 100: LDSHA_I	ldsha	[%r10, + 0x0006] %asi, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd2dae020  ! 101: LDXA_I	ldxa	[%r11, + 0x0020] %asi, %r9
	.word 0xcc3aa060  ! 102: STD_I	std	%r6, [%r10 + 0x0060]
	.word 0xc9baa060  ! 103: STDFA_I	stda	%f4, [0x0060, %r10]
	.word 0xd052a07c  ! 104: LDSH_I	ldsh	[%r10 + 0x007c], %r8
	.word 0xc45a801f  ! 105: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7baa048  ! 106: STDFA_I	stda	%f3, [0x0048, %r10]
	.word 0xc5ba995f  ! 107: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2913f  ! 108: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc79aa078  ! 109: LDDFA_I	ldda	[%r10, 0x0078], %f3
	.word 0xc5ba981f  ! 110: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc43a801f  ! 111: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc302a054  ! 112: LDF_I	ld	[%r10, 0x0054], %f1
	.word 0xc602801f  ! 113: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xcbf2a01f  ! 114: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba999f  ! 115: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL115:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcf02801f  ! 116: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc3e2e01f  ! 117: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d01f  ! 118: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3e2e01f  ! 119: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3e2d13f  ! 120: CASA_I	casa	[%r11] 0x89, %r31, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3f2d01f  ! 121: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3f2e01f  ! 122: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad81f  ! 123: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc7baa020  ! 124: STDFA_I	stda	%f3, [0x0020, %r10]
	.word 0xcbba987f  ! 125: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbba981f  ! 126: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba985f  ! 127: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba985f  ! 128: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc8d2a016  ! 129: LDSHA_I	ldsha	[%r10, + 0x0016] %asi, %r4
	.word 0xcdbad85f  ! 130: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcc3ae060  ! 131: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xca8a901f  ! 132: LDUBA_R	lduba	[%r10, %r31] 0x80, %r5
	.word 0xd1ba993f  ! 133: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2911f  ! 134: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xd1e2a01f  ! 135: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd03aa060  ! 136: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd1e2a01f  ! 137: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xca92905f  ! 138: LDUHA_R	lduha	[%r10, %r31] 0x82, %r5
	.word 0xc5baa038  ! 139: STDFA_I	stda	%f2, [0x0038, %r10]
	.word 0xce92917f  ! 140: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc42a068  ! 141: LDSW_I	ldsw	[%r10 + 0x0068], %r6
	.word 0xcfbad93f  ! 142: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xccc2901f  ! 143: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r6
	.word 0xc3ba981f  ! 144: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 145: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3ba993f  ! 146: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd102c01f  ! 147: LDF_R	ld	[%r11, %r31], %f8
	.word 0xc9bad81f  ! 148: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad85f  ! 149: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcc4ae020  ! 150: LDSB_I	ldsb	[%r11 + 0x0020], %r6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd012a022  ! 151: LDUH_I	lduh	[%r10 + 0x0022], %r8
	.word 0xcc3aa060  ! 152: STD_I	std	%r6, [%r10 + 0x0060]
	.word 0xceca917f  ! 153: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r7
	.word 0xcbf2e01f  ! 154: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbf2d01f  ! 155: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd28ad11f  ! 156: LDUBA_R	lduba	[%r11, %r31] 0x88, %r9
	.word 0xc45aa020  ! 157: LDX_I	ldx	[%r10 + 0x0020], %r2
	.word 0xc9f2e01f  ! 158: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 159: STD_R	std	%r4, [%r11 + %r31]
	.word 0xca8ad01f  ! 160: LDUBA_R	lduba	[%r11, %r31] 0x80, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5baa038  ! 161: STDFA_I	stda	%f2, [0x0038, %r10]
	.word 0xc892905f  ! 162: LDUHA_R	lduha	[%r10, %r31] 0x82, %r4
	.word 0xcbba987f  ! 163: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba991f  ! 164: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2901f  ! 165: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbf2a01f  ! 166: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcec2915f  ! 167: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r7
	.word 0xcbf2e01f  ! 168: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcc8aa001  ! 169: LDUBA_I	lduba	[%r10, + 0x0001] %asi, %r6
	.word 0xc5ba997f  ! 170: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc43aa078  ! 171: STD_I	std	%r2, [%r10 + 0x0078]
	.word 0xc79aa078  ! 172: LDDFA_I	ldda	[%r10, 0x0078], %f3
	.word 0xc65aa058  ! 173: LDX_I	ldx	[%r10 + 0x0058], %r3
	.word 0xd3f2e01f  ! 174: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2e01f  ! 175: CASA_R	casa	[%r11] %asi, %r31, %r9
TH_LABEL175:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3f2d01f  ! 176: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd3bad9bf  ! 177: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcec2d13f  ! 178: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r7
	.word 0xc3ba981f  ! 179: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc64ae023  ! 180: LDSB_I	ldsb	[%r11 + 0x0023], %r3
TH_LABEL180:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3e2901f  ! 181: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3f2a01f  ! 182: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba997f  ! 183: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 184: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xca02a054  ! 185: LDUW_I	lduw	[%r10 + 0x0054], %r5
TH_LABEL185:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc43aa048  ! 186: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc5e2a01f  ! 187: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcb02a00c  ! 188: LDF_I	ld	[%r10, 0x000c], %f5
	.word 0xd202801f  ! 189: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xd252801f  ! 190: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcf9ae070  ! 191: LDDFA_I	ldda	[%r11, 0x0070], %f7
	.word 0xcc4a801f  ! 192: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xcbba983f  ! 193: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 194: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbf2a01f  ! 195: CASXA_R	casxa	[%r10]%asi, %r31, %r5
TH_LABEL195:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbf2911f  ! 196: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xcd22801f  ! 197: STF_R	st	%f6, [%r31, %r10]
	.word 0xc60ac01f  ! 198: LDUB_R	ldub	[%r11 + %r31], %r3
	.word 0xcd9ae050  ! 199: LDDFA_I	ldda	[%r11, 0x0050], %f6
	.word 0xd1ba993f  ! 200: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL200:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc59ae038  ! 201: LDDFA_I	ldda	[%r11, 0x0038], %f2
	.word 0xcd02801f  ! 202: LDF_R	ld	[%r10, %r31], %f6
	.word 0xce5a801f  ! 203: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xcfba99bf  ! 204: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd322801f  ! 205: STF_R	st	%f9, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7ba981f  ! 206: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcfbaa068  ! 207: STDFA_I	stda	%f7, [0x0068, %r10]
	.word 0xc682a060  ! 208: LDUWA_I	lduwa	[%r10, + 0x0060] %asi, %r3
	.word 0xcdf2a01f  ! 209: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba981f  ! 210: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcf9aa078  ! 211: LDDFA_I	ldda	[%r10, 0x0078], %f7
	.word 0xc03ac01f  ! 212: STD_R	std	%r0, [%r11 + %r31]
	.word 0xd042e048  ! 213: LDSW_I	ldsw	[%r11 + 0x0048], %r8
	.word 0xd3baa060  ! 214: STDFA_I	stda	%f9, [0x0060, %r10]
	.word 0xc83aa048  ! 215: STD_I	std	%r4, [%r10 + 0x0048]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc692901f  ! 216: LDUHA_R	lduha	[%r10, %r31] 0x80, %r3
	.word 0xce92a006  ! 217: LDUHA_I	lduha	[%r10, + 0x0006] %asi, %r7
	.word 0xc442801f  ! 218: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xcf9aa030  ! 219: LDDFA_I	ldda	[%r10, 0x0030], %f7
	.word 0xd242a050  ! 220: LDSW_I	ldsw	[%r10 + 0x0050], %r9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc2ca905f  ! 221: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r1
	.word 0xcde2911f  ! 222: CASA_I	casa	[%r10] 0x88, %r31, %r6
	.word 0xcdbaa048  ! 223: STDFA_I	stda	%f6, [0x0048, %r10]
	.word 0xd102801f  ! 224: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc41a801f  ! 225: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd03ac01f  ! 226: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad85f  ! 227: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 228: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad95f  ! 229: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 230: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3bad89f  ! 231: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad99f  ! 232: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 233: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad85f  ! 234: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd002a034  ! 235: LDUW_I	lduw	[%r10 + 0x0034], %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1ba993f  ! 236: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 237: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xcc42a054  ! 238: LDSW_I	ldsw	[%r10 + 0x0054], %r6
	.word 0xc7e2911f  ! 239: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba995f  ! 240: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL240:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc81aa060  ! 241: LDD_I	ldd	[%r10 + 0x0060], %r4
	.word 0xce8a903f  ! 242: LDUBA_R	lduba	[%r10, %r31] 0x81, %r7
	.word 0xd102a010  ! 243: LDF_I	ld	[%r10, 0x0010], %f8
	.word 0xd3bad85f  ! 244: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 245: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xce0a801f  ! 246: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xc48ae03d  ! 247: LDUBA_I	lduba	[%r11, + 0x003d] %asi, %r2
	.word 0xcfbaa058  ! 248: STDFA_I	stda	%f7, [0x0058, %r10]
	.word 0xc702801f  ! 249: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc5e2a01f  ! 250: CASA_R	casa	[%r10] %asi, %r31, %r2
TH_LABEL250:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc212801f  ! 251: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xc4c2905f  ! 252: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r2
	.word 0xd1ba98bf  ! 253: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2911f  ! 254: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xd1e2913f  ! 255: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xce8a911f  ! 256: LDUBA_R	lduba	[%r10, %r31] 0x88, %r7
	.word 0xc3f2d01f  ! 257: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad81f  ! 258: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad83f  ! 259: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 260: CASXA_R	casxa	[%r11]%asi, %r31, %r1
TH_LABEL260:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc2d2e06e  ! 261: LDSHA_I	ldsha	[%r11, + 0x006e] %asi, %r1
	.word 0xccc2a010  ! 262: LDSWA_I	ldswa	[%r10, + 0x0010] %asi, %r6
	.word 0xc20ac01f  ! 263: LDUB_R	ldub	[%r11 + %r31], %r1
	.word 0xd3f2a01f  ! 264: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2901f  ! 265: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3ba993f  ! 266: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd01a801f  ! 267: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xce8aa03b  ! 268: LDUBA_I	lduba	[%r10, + 0x003b] %asi, %r7
	.word 0xcb9ae008  ! 269: LDDFA_I	ldda	[%r11, 0x0008], %f5
	.word 0xd212a066  ! 270: LDUH_I	lduh	[%r10 + 0x0066], %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xce42c01f  ! 271: LDSW_R	ldsw	[%r11 + %r31], %r7
	.word 0xc6d2e006  ! 272: LDSHA_I	ldsha	[%r11, + 0x0006] %asi, %r3
	.word 0xc3f2d01f  ! 273: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad91f  ! 274: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad8bf  ! 275: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3baa068  ! 276: STDFA_I	stda	%f9, [0x0068, %r10]
	.word 0xd322801f  ! 277: STF_R	st	%f9, [%r31, %r10]
	.word 0xc59ae008  ! 278: LDDFA_I	ldda	[%r11, 0x0008], %f2
	.word 0xccdad01f  ! 279: LDXA_R	ldxa	[%r11, %r31] 0x80, %r6
	.word 0xcdba983f  ! 280: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdf2913f  ! 281: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcdf2901f  ! 282: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdf2903f  ! 283: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xc882a020  ! 284: LDUWA_I	lduwa	[%r10, + 0x0020] %asi, %r4
	.word 0xc9ba985f  ! 285: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9e2a01f  ! 286: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83aa008  ! 287: STD_I	std	%r4, [%r10 + 0x0008]
	.word 0xc9ba995f  ! 288: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2903f  ! 289: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc642801f  ! 290: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd03a801f  ! 291: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1e2a01f  ! 292: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd2d2a052  ! 293: LDSHA_I	ldsha	[%r10, + 0x0052] %asi, %r9
	.word 0xc7f2e01f  ! 294: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad97f  ! 295: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7bad89f  ! 296: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae028  ! 297: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc7bad8bf  ! 298: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd2d2901f  ! 299: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r9
	.word 0xd03a801f  ! 300: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1ba981f  ! 301: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd082a078  ! 302: LDUWA_I	lduwa	[%r10, + 0x0078] %asi, %r8
	.word 0xd3e2a01f  ! 303: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 304: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba99bf  ! 305: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3baa048  ! 306: STDFA_I	stda	%f9, [0x0048, %r10]
	.word 0xcfbaa060  ! 307: STDFA_I	stda	%f7, [0x0060, %r10]
	.word 0xcc3ac01f  ! 308: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcdf2d11f  ! 309: CASXA_I	casxa	[%r11] 0x88, %r31, %r6
	.word 0xcdbad87f  ! 310: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcd9aa040  ! 311: LDDFA_I	ldda	[%r10, 0x0040], %f6
	.word 0xcfba983f  ! 312: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc48ad11f  ! 313: LDUBA_R	lduba	[%r11, %r31] 0x88, %r2
	.word 0xd05ac01f  ! 314: LDX_R	ldx	[%r11 + %r31], %r8
	.word 0xcc3aa078  ! 315: STD_I	std	%r6, [%r10 + 0x0078]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xccdae070  ! 316: LDXA_I	ldxa	[%r11, + 0x0070] %asi, %r6
	.word 0xce52c01f  ! 317: LDSH_R	ldsh	[%r11 + %r31], %r7
	.word 0xc83aa078  ! 318: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xcbe2911f  ! 319: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xc642e038  ! 320: LDSW_I	ldsw	[%r11 + 0x0038], %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc4dae068  ! 321: LDXA_I	ldxa	[%r11, + 0x0068] %asi, %r2
	.word 0xd3f2901f  ! 322: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba981f  ! 323: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 324: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc702a028  ! 325: LDF_I	ld	[%r10, 0x0028], %f3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdbad95f  ! 326: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xca8aa03f  ! 327: LDUBA_I	lduba	[%r10, + 0x003f] %asi, %r5
	.word 0xc03ae030  ! 328: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xc3e2e01f  ! 329: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d01f  ! 330: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc03ae030  ! 331: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xc3f2e01f  ! 332: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad91f  ! 333: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc282a040  ! 334: LDUWA_I	lduwa	[%r10, + 0x0040] %asi, %r1
	.word 0xcfe2a01f  ! 335: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfe2a01f  ! 336: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc5baa038  ! 337: STDFA_I	stda	%f2, [0x0038, %r10]
	.word 0xcdf2a01f  ! 338: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd282d05f  ! 339: LDUWA_R	lduwa	[%r11, %r31] 0x82, %r9
	.word 0xc5e2d01f  ! 340: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd20ac01f  ! 341: LDUB_R	ldub	[%r11 + %r31], %r9
	.word 0xcdba981f  ! 342: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc02801f  ! 343: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xc41aa048  ! 344: LDD_I	ldd	[%r10 + 0x0048], %r2
	.word 0xc9ba99bf  ! 345: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9ba99bf  ! 346: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xce82a048  ! 347: LDUWA_I	lduwa	[%r10, + 0x0048] %asi, %r7
	.word 0xc7ba989f  ! 348: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 349: STD_R	std	%r2, [%r10 + %r31]
	.word 0xccca915f  ! 350: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd042c01f  ! 351: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xc88a901f  ! 352: LDUBA_R	lduba	[%r10, %r31] 0x80, %r4
	.word 0xc882a008  ! 353: LDUWA_I	lduwa	[%r10, + 0x0008] %asi, %r4
	.word 0xce5a801f  ! 354: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xcdba995f  ! 355: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdba991f  ! 356: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 357: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcde2911f  ! 358: CASA_I	casa	[%r10] 0x88, %r31, %r6
	.word 0xcde2a01f  ! 359: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xc502e054  ! 360: LDF_I	ld	[%r11, 0x0054], %f2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3e2a01f  ! 361: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3e2901f  ! 362: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba987f  ! 363: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 364: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xcc5a801f  ! 365: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7ba999f  ! 366: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa010  ! 367: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xc64a801f  ! 368: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xcfe2913f  ! 369: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcfe2a01f  ! 370: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcff2a01f  ! 371: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcc3aa010  ! 372: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xd0d2a04e  ! 373: LDSHA_I	ldsha	[%r10, + 0x004e] %asi, %r8
	.word 0xc3e2a01f  ! 374: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba999f  ! 375: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc2caa073  ! 376: LDSBA_I	ldsba	[%r10, + 0x0073] %asi, %r1
	.word 0xcbba995f  ! 377: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 378: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba991f  ! 379: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2913f  ! 380: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc842a04c  ! 381: LDSW_I	ldsw	[%r10 + 0x004c], %r4
	.word 0xcfe2a01f  ! 382: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcc3aa038  ! 383: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcfe2901f  ! 384: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcfba983f  ! 385: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfba985f  ! 386: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd102a048  ! 387: LDF_I	ld	[%r10, 0x0048], %f8
	.word 0xc43a801f  ! 388: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc2cae009  ! 389: LDSBA_I	ldsba	[%r11, + 0x0009] %asi, %r1
	.word 0xc502c01f  ! 390: LDF_R	ld	[%r11, %r31], %f2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdbaa028  ! 391: STDFA_I	stda	%f6, [0x0028, %r10]
	.word 0xcdba985f  ! 392: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc202c01f  ! 393: LDUW_R	lduw	[%r11 + %r31], %r1
	.word 0xcfba983f  ! 394: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba99bf  ! 395: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfba997f  ! 396: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2911f  ! 397: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xd092901f  ! 398: LDUHA_R	lduha	[%r10, %r31] 0x80, %r8
	.word 0xc68ad03f  ! 399: LDUBA_R	lduba	[%r11, %r31] 0x81, %r3
	.word 0xc412a01e  ! 400: LDUH_I	lduh	[%r10 + 0x001e], %r2
TH_LABEL400:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcde2901f  ! 401: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xcc3a801f  ! 402: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba989f  ! 403: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc81aa078  ! 404: LDD_I	ldd	[%r10 + 0x0078], %r4
	.word 0xc8cae045  ! 405: LDSBA_I	ldsba	[%r11, + 0x0045] %asi, %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd39ae070  ! 406: LDDFA_I	ldda	[%r11, 0x0070], %f9
	.word 0xcdf2a01f  ! 407: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba999f  ! 408: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcacaa03d  ! 409: LDSBA_I	ldsba	[%r10, + 0x003d] %asi, %r5
	.word 0xd3ba981f  ! 410: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1baa048  ! 411: STDFA_I	stda	%f8, [0x0048, %r10]
	.word 0xd28aa04b  ! 412: LDUBA_I	lduba	[%r10, + 0x004b] %asi, %r9
	.word 0xc702e074  ! 413: LDF_I	ld	[%r11, 0x0074], %f3
	.word 0xcff2e01f  ! 414: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xd28aa038  ! 415: LDUBA_I	lduba	[%r10, + 0x0038] %asi, %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc03ae000  ! 416: STD_I	std	%r0, [%r11 + 0x0000]
	.word 0xcbbaa008  ! 417: STDFA_I	stda	%f5, [0x0008, %r10]
	.word 0xd3e2a01f  ! 418: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 419: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3e2a01f  ! 420: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3ba987f  ! 421: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc6dad03f  ! 422: LDXA_R	ldxa	[%r11, %r31] 0x81, %r3
	.word 0xd1e2901f  ! 423: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc89aa020  ! 424: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r4
	.word 0xc83ac01f  ! 425: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbbad89f  ! 426: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc99aa060  ! 427: LDDFA_I	ldda	[%r10, 0x0060], %f4
	.word 0xcb22801f  ! 428: STF_R	st	%f5, [%r31, %r10]
	.word 0xd3bad91f  ! 429: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc7baa010  ! 430: STDFA_I	stda	%f3, [0x0010, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc702e048  ! 431: LDF_I	ld	[%r11, 0x0048], %f3
	.word 0xcc9ae050  ! 432: LDDA_I	ldda	[%r11, + 0x0050] %asi, %r6
	.word 0xc3bad9bf  ! 433: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d13f  ! 434: CASA_I	casa	[%r11] 0x89, %r31, %r1
	.word 0xc03ac01f  ! 435: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3bad89f  ! 436: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad81f  ! 437: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 438: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d13f  ! 439: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xc03ac01f  ! 440: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3f2d13f  ! 441: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xca8a901f  ! 442: LDUBA_R	lduba	[%r10, %r31] 0x80, %r5
	.word 0xcb02a064  ! 443: LDF_I	ld	[%r10, 0x0064], %f5
	.word 0xc5f2d11f  ! 444: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xc5bad81f  ! 445: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5bad9bf  ! 446: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcbbae078  ! 447: STDFA_I	stda	%f5, [0x0078, %r11]
	.word 0xd1ba999f  ! 448: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2913f  ! 449: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd1f2a01f  ! 450: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcf22801f  ! 451: STF_R	st	%f7, [%r31, %r10]
	.word 0xd3ba987f  ! 452: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc20ac01f  ! 453: LDUB_R	ldub	[%r11 + %r31], %r1
	.word 0xce02a078  ! 454: LDUW_I	lduw	[%r10 + 0x0078], %r7
	.word 0xd3ba99bf  ! 455: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd24a801f  ! 456: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xc83a801f  ! 457: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbf2a01f  ! 458: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2913f  ! 459: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xcf9ae058  ! 460: LDDFA_I	ldda	[%r11, 0x0058], %f7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7e2a01f  ! 461: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc43a801f  ! 462: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7f2911f  ! 463: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba989f  ! 464: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba985f  ! 465: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7ba985f  ! 466: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcec2a048  ! 467: LDSWA_I	ldswa	[%r10, + 0x0048] %asi, %r7
	.word 0xd24aa00f  ! 468: LDSB_I	ldsb	[%r10 + 0x000f], %r9
	.word 0xc79aa000  ! 469: LDDFA_I	ldda	[%r10, 0x0000], %f3
	.word 0xd08aa07f  ! 470: LDUBA_I	lduba	[%r10, + 0x007f] %asi, %r8
TH_LABEL470:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcecae075  ! 471: LDSBA_I	ldsba	[%r11, + 0x0075] %asi, %r7
	.word 0xc5ba995f  ! 472: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc502801f  ! 473: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc7f2901f  ! 474: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7f2a01f  ! 475: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7ba99bf  ! 476: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba985f  ! 477: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcac2907f  ! 478: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r5
	.word 0xc3ba997f  ! 479: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc4da901f  ! 480: LDXA_R	ldxa	[%r10, %r31] 0x80, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbbad91f  ! 481: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcdbae008  ! 482: STDFA_I	stda	%f6, [0x0008, %r11]
	.word 0xc3ba997f  ! 483: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 484: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc03aa008  ! 485: STD_I	std	%r0, [%r10 + 0x0008]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcb02a024  ! 486: LDF_I	ld	[%r10, 0x0024], %f5
	.word 0xc7bad93f  ! 487: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad93f  ! 488: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae078  ! 489: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xd012a076  ! 490: LDUH_I	lduh	[%r10 + 0x0076], %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc3ae030  ! 491: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcdbad93f  ! 492: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad87f  ! 493: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2d01f  ! 494: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad81f  ! 495: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc68ad13f  ! 496: LDUBA_R	lduba	[%r11, %r31] 0x89, %r3
	.word 0xc7ba993f  ! 497: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 498: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc01a801f  ! 499: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xcfba999f  ! 500: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL500:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfba987f  ! 501: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 502: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 503: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcff2a01f  ! 504: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc89ae058  ! 505: LDDA_I	ldda	[%r11, + 0x0058] %asi, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1ba98bf  ! 506: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa000  ! 507: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd1ba981f  ! 508: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc702801f  ! 509: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc03a801f  ! 510: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcf22801f  ! 511: STF_R	st	%f7, [%r31, %r10]
	.word 0xcbba985f  ! 512: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba987f  ! 513: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc302c01f  ! 514: LDF_R	ld	[%r11, %r31], %f1
	.word 0xd39ae018  ! 515: LDDFA_I	ldda	[%r11, 0x0018], %f9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc4d2901f  ! 516: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r2
	.word 0xc59aa058  ! 517: LDDFA_I	ldda	[%r10, 0x0058], %f2
	.word 0xc302801f  ! 518: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc9baa060  ! 519: STDFA_I	stda	%f4, [0x0060, %r10]
	.word 0xcff2a01f  ! 520: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfe2901f  ! 521: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcfba987f  ! 522: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 523: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 524: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xca5a801f  ! 525: LDX_R	ldx	[%r10 + %r31], %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1ba98bf  ! 526: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 527: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba989f  ! 528: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 529: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba989f  ! 530: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1e2a01f  ! 531: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 532: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc28aa023  ! 533: LDUBA_I	lduba	[%r10, + 0x0023] %asi, %r1
	.word 0xca52a04a  ! 534: LDSH_I	ldsh	[%r10 + 0x004a], %r5
	.word 0xcfba99bf  ! 535: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfe2a01f  ! 536: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2901f  ! 537: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcc3a801f  ! 538: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba999f  ! 539: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba995f  ! 540: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfbae068  ! 541: STDFA_I	stda	%f7, [0x0068, %r11]
	.word 0xcbba983f  ! 542: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 543: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba987f  ! 544: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba983f  ! 545: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba995f  ! 546: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba99bf  ! 547: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba997f  ! 548: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc2daa058  ! 549: LDXA_I	ldxa	[%r10, + 0x0058] %asi, %r1
	.word 0xc5bae068  ! 550: STDFA_I	stda	%f2, [0x0068, %r11]
TH_LABEL550:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbf2913f  ! 551: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xc83aa038  ! 552: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xcbf2a01f  ! 553: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xc6daa060  ! 554: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r3
	.word 0xc5ba989f  ! 555: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5e2901f  ! 556: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba98bf  ! 557: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 558: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 559: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc502a034  ! 560: LDF_I	ld	[%r10, 0x0034], %f2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7ba983f  ! 561: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd052801f  ! 562: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xc88aa010  ! 563: LDUBA_I	lduba	[%r10, + 0x0010] %asi, %r4
	.word 0xc60a801f  ! 564: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xc7ba98bf  ! 565: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc412801f  ! 566: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xc43aa058  ! 567: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc7ba997f  ! 568: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba983f  ! 569: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc812a03c  ! 570: LDUH_I	lduh	[%r10 + 0x003c], %r4
TH_LABEL570:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1f2d03f  ! 571: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xd1f2d01f  ! 572: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xd1e2e01f  ! 573: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xcb9ae058  ! 574: LDDFA_I	ldda	[%r11, 0x0058], %f5
	.word 0xcc1ae008  ! 575: LDD_I	ldd	[%r11 + 0x0008], %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd03aa040  ! 576: STD_I	std	%r8, [%r10 + 0x0040]
	.word 0xd3ba991f  ! 577: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 578: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba983f  ! 579: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc482905f  ! 580: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5ba987f  ! 581: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 582: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 583: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc25a801f  ! 584: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xd1baa048  ! 585: STDFA_I	stda	%f8, [0x0048, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5f2901f  ! 586: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba987f  ! 587: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2913f  ! 588: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xd002e030  ! 589: LDUW_I	lduw	[%r11 + 0x0030], %r8
	.word 0xcbba983f  ! 590: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd092913f  ! 591: LDUHA_R	lduha	[%r10, %r31] 0x89, %r8
	.word 0xc9bad87f  ! 592: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9f2e01f  ! 593: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc4ca913f  ! 594: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r2
	.word 0xd102801f  ! 595: LDF_R	ld	[%r10, %r31], %f8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc812a018  ! 596: LDUH_I	lduh	[%r10 + 0x0018], %r4
	.word 0xd3bad85f  ! 597: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad99f  ! 598: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad89f  ! 599: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xca5ae020  ! 600: LDX_I	ldx	[%r11 + 0x0020], %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5bad93f  ! 601: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc20aa062  ! 602: LDUB_I	ldub	[%r10 + 0x0062], %r1
	.word 0xcbbad95f  ! 603: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc4dad01f  ! 604: LDXA_R	ldxa	[%r11, %r31] 0x80, %r2
	.word 0xca4ac01f  ! 605: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdbaa010  ! 606: STDFA_I	stda	%f6, [0x0010, %r10]
	.word 0xc7bad81f  ! 607: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc802801f  ! 608: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xd28ae06a  ! 609: LDUBA_I	lduba	[%r11, + 0x006a] %asi, %r9
	.word 0xc412e020  ! 610: LDUH_I	lduh	[%r11 + 0x0020], %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc83ae020  ! 611: STD_I	std	%r4, [%r11 + 0x0020]
	.word 0xc9bad95f  ! 612: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc81aa078  ! 613: LDD_I	ldd	[%r10 + 0x0078], %r4
	.word 0xcdbad99f  ! 614: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc802a074  ! 615: LDUW_I	lduw	[%r10 + 0x0074], %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3f2d01f  ! 616: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xce0aa024  ! 617: LDUB_I	ldub	[%r10 + 0x0024], %r7
	.word 0xcacad01f  ! 618: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r5
	.word 0xc2d2d01f  ! 619: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r1
	.word 0xd302801f  ! 620: LDF_R	ld	[%r10, %r31], %f9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc83ae070  ! 621: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xce5ac01f  ! 622: LDX_R	ldx	[%r11 + %r31], %r7
	.word 0xd3bad99f  ! 623: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad99f  ! 624: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcb02801f  ! 625: LDF_R	ld	[%r10, %r31], %f5
TH_LABEL625:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc83a801f  ! 626: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc64aa050  ! 627: LDSB_I	ldsb	[%r10 + 0x0050], %r3
	.word 0xc3ba98bf  ! 628: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 629: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 630: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xca12a05a  ! 631: LDUH_I	lduh	[%r10 + 0x005a], %r5
	.word 0xc9bad91f  ! 632: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xce42c01f  ! 633: LDSW_R	ldsw	[%r11 + %r31], %r7
	.word 0xcc92a06a  ! 634: LDUHA_I	lduha	[%r10, + 0x006a] %asi, %r6
	.word 0xcdf2e01f  ! 635: CASXA_R	casxa	[%r11]%asi, %r31, %r6
TH_LABEL635:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc2d2e00a  ! 636: LDSHA_I	ldsha	[%r11, + 0x000a] %asi, %r1
	.word 0xcff2901f  ! 637: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcff2903f  ! 638: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcfe2913f  ! 639: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xca02801f  ! 640: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfba993f  ! 641: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc9aa000  ! 642: LDDA_I	ldda	[%r10, + 0x0000] %asi, %r6
	.word 0xc702c01f  ! 643: LDF_R	ld	[%r11, %r31], %f3
	.word 0xcf02a07c  ! 644: LDF_I	ld	[%r10, 0x007c], %f7
	.word 0xcc42801f  ! 645: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xca4ac01f  ! 646: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xd2cad03f  ! 647: LDSBA_R	ldsba	[%r11, %r31] 0x81, %r9
	.word 0xc9ba993f  ! 648: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 649: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 650: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9f2a01f  ! 651: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc83aa010  ! 652: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xc9e2903f  ! 653: CASA_I	casa	[%r10] 0x81, %r31, %r4
	.word 0xc6cae034  ! 654: LDSBA_I	ldsba	[%r11, + 0x0034] %asi, %r3
	.word 0xc2d2a07e  ! 655: LDSHA_I	ldsha	[%r10, + 0x007e] %asi, %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9ba995f  ! 656: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc8daa030  ! 657: LDXA_I	ldxa	[%r10, + 0x0030] %asi, %r4
	.word 0xc5e2913f  ! 658: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xd04aa018  ! 659: LDSB_I	ldsb	[%r10 + 0x0018], %r8
	.word 0xcc3ae030  ! 660: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfbad91f  ! 661: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc7bae018  ! 662: STDFA_I	stda	%f3, [0x0018, %r11]
	.word 0xd1e2e01f  ! 663: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xc502a03c  ! 664: LDF_I	ld	[%r10, 0x003c], %f2
	.word 0xc3ba983f  ! 665: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3ba99bf  ! 666: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2911f  ! 667: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc492d11f  ! 668: LDUHA_R	lduha	[%r11, %r31] 0x88, %r2
	.word 0xccc2913f  ! 669: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r6
	.word 0xc642801f  ! 670: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd03ac01f  ! 671: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad91f  ! 672: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcbbaa068  ! 673: STDFA_I	stda	%f5, [0x0068, %r10]
	.word 0xc5ba991f  ! 674: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa038  ! 675: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xca5ae038  ! 676: LDX_I	ldx	[%r11 + 0x0038], %r5
	.word 0xc302a03c  ! 677: LDF_I	ld	[%r10, 0x003c], %f1
	.word 0xc9e2e01f  ! 678: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad91f  ! 679: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad89f  ! 680: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9bad85f  ! 681: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d01f  ! 682: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc83ae060  ! 683: STD_I	std	%r4, [%r11 + 0x0060]
	.word 0xca8ae07d  ! 684: LDUBA_I	lduba	[%r11, + 0x007d] %asi, %r5
	.word 0xccdae058  ! 685: LDXA_I	ldxa	[%r11, + 0x0058] %asi, %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcff2e01f  ! 686: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcfbad85f  ! 687: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d01f  ! 688: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xc60a801f  ! 689: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xd1ba981f  ! 690: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd05aa008  ! 691: LDX_I	ldx	[%r10 + 0x0008], %r8
	.word 0xc6c2a054  ! 692: LDSWA_I	ldswa	[%r10, + 0x0054] %asi, %r3
	.word 0xc43ae028  ! 693: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc43ac01f  ! 694: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7bad81f  ! 695: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd20a801f  ! 696: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xc7e2a01f  ! 697: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba991f  ! 698: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc252a052  ! 699: LDSH_I	ldsh	[%r10 + 0x0052], %r1
	.word 0xc3f2a01f  ! 700: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3ba985f  ! 701: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 702: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3f2a01f  ! 703: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba991f  ! 704: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 705: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3ba99bf  ! 706: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 707: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd2daa028  ! 708: LDXA_I	ldxa	[%r10, + 0x0028] %asi, %r9
	.word 0xd202801f  ! 709: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xce42e044  ! 710: LDSW_I	ldsw	[%r11 + 0x0044], %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3e2a01f  ! 711: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3e2a01f  ! 712: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba98bf  ! 713: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2901f  ! 714: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd03a801f  ! 715: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3f2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd092915f  ! 717: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r8
	.word 0xcd9ae078  ! 718: LDDFA_I	ldda	[%r11, 0x0078], %f6
	.word 0xcd02a008  ! 719: LDF_I	ld	[%r10, 0x0008], %f6
	.word 0xd3e2d11f  ! 720: CASA_I	casa	[%r11] 0x88, %r31, %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcfbaa068  ! 721: STDFA_I	stda	%f7, [0x0068, %r10]
	.word 0xd3ba987f  ! 722: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba985f  ! 723: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 724: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba983f  ! 725: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3ba999f  ! 726: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc99aa048  ! 727: LDDFA_I	ldda	[%r10, 0x0048], %f4
	.word 0xcb22801f  ! 728: STF_R	st	%f5, [%r31, %r10]
	.word 0xd3e2e01f  ! 729: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3f2d01f  ! 730: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc88ad07f  ! 731: LDUBA_R	lduba	[%r11, %r31] 0x83, %r4
	.word 0xc5e2903f  ! 732: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba98bf  ! 733: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 734: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba989f  ! 735: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc252a05c  ! 736: LDSH_I	ldsh	[%r10 + 0x005c], %r1
	.word 0xc3ba997f  ! 737: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc24a801f  ! 738: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xc7f2a01f  ! 739: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7f2901f  ! 740: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc24aa01a  ! 741: LDSB_I	ldsb	[%r10 + 0x001a], %r1
	.word 0xcfe2a01f  ! 742: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba981f  ! 743: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 744: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd012e07e  ! 745: LDUH_I	lduh	[%r11 + 0x007e], %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xce8a901f  ! 746: LDUBA_R	lduba	[%r10, %r31] 0x80, %r7
	.word 0xcadaa050  ! 747: LDXA_I	ldxa	[%r10, + 0x0050] %asi, %r5
	.word 0xc402c01f  ! 748: LDUW_R	lduw	[%r11 + %r31], %r2
	.word 0xc412801f  ! 749: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xc09aa028  ! 750: LDDA_I	ldda	[%r10, + 0x0028] %asi, %r0
TH_LABEL750:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd082a064  ! 751: LDUWA_I	lduwa	[%r10, + 0x0064] %asi, %r8
	.word 0xc5e2e01f  ! 752: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad8bf  ! 753: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad99f  ! 754: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc64ae06f  ! 755: LDSB_I	ldsb	[%r11 + 0x006f], %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfba981f  ! 756: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca0a801f  ! 757: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xc9e2d13f  ! 758: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc9f2d11f  ! 759: CASXA_I	casxa	[%r11] 0x88, %r31, %r4
	.word 0xc49aa040  ! 760: LDDA_I	ldda	[%r10, + 0x0040] %asi, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc302a004  ! 761: LDF_I	ld	[%r10, 0x0004], %f1
	.word 0xc9ba981f  ! 762: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc80aa010  ! 763: LDUB_I	ldub	[%r10 + 0x0010], %r4
	.word 0xd302a078  ! 764: LDF_I	ld	[%r10, 0x0078], %f9
	.word 0xc9ba981f  ! 765: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc83a801f  ! 766: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba989f  ! 767: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 768: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba989f  ! 769: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc482e064  ! 771: LDUWA_I	lduwa	[%r11, + 0x0064] %asi, %r2
	.word 0xcf02c01f  ! 772: LDF_R	ld	[%r11, %r31], %f7
	.word 0xcfba985f  ! 773: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc8ae02c  ! 774: LDUBA_I	lduba	[%r11, + 0x002c] %asi, %r6
	.word 0xd01aa018  ! 775: LDD_I	ldd	[%r10 + 0x0018], %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1f2d01f  ! 776: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xcc12801f  ! 777: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xc7f2913f  ! 778: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba999f  ! 779: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc09aa000  ! 780: LDDA_I	ldda	[%r10, + 0x0000] %asi, %r0
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xce52801f  ! 781: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xcbba995f  ! 782: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba993f  ! 783: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcc8ae07b  ! 784: LDUBA_I	lduba	[%r11, + 0x007b] %asi, %r6
	.word 0xce8a905f  ! 785: LDUBA_R	lduba	[%r10, %r31] 0x82, %r7
TH_LABEL785:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3e2a01f  ! 786: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 787: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc902a048  ! 788: LDF_I	ld	[%r10, 0x0048], %f4
	.word 0xd28aa060  ! 789: LDUBA_I	lduba	[%r10, + 0x0060] %asi, %r9
	.word 0xd1bad81f  ! 790: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1bad9bf  ! 791: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 792: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc252a032  ! 793: LDSH_I	ldsh	[%r10 + 0x0032], %r1
	.word 0xc83ac01f  ! 794: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbf2e01f  ! 795: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcd9aa048  ! 796: LDDFA_I	ldda	[%r10, 0x0048], %f6
	.word 0xcdba995f  ! 797: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba989f  ! 798: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd0d2d01f  ! 799: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r8
	.word 0xca4aa07c  ! 800: LDSB_I	ldsb	[%r10 + 0x007c], %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbbae020  ! 801: STDFA_I	stda	%f5, [0x0020, %r11]
	.word 0xc5ba985f  ! 802: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 803: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43a801f  ! 804: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa068  ! 805: STD_I	std	%r2, [%r10 + 0x0068]
TH_LABEL805:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5ba993f  ! 806: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 807: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc8c2903f  ! 808: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r4
	.word 0xd1baa058  ! 809: STDFA_I	stda	%f8, [0x0058, %r10]
	.word 0xced2913f  ! 810: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd012a074  ! 811: LDUH_I	lduh	[%r10 + 0x0074], %r8
	.word 0xc9ba989f  ! 812: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 813: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba989f  ! 814: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc81ae000  ! 815: LDD_I	ldd	[%r11 + 0x0000], %r4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcecad15f  ! 816: LDSBA_R	ldsba	[%r11, %r31] 0x8a, %r7
	.word 0xcff2a01f  ! 817: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfe2a01f  ! 818: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2901f  ! 819: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xd25aa048  ! 820: LDX_I	ldx	[%r10 + 0x0048], %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfba991f  ! 821: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc6da907f  ! 822: LDXA_R	ldxa	[%r10, %r31] 0x83, %r3
	.word 0xc2dae048  ! 823: LDXA_I	ldxa	[%r11, + 0x0048] %asi, %r1
	.word 0xc5bae040  ! 824: STDFA_I	stda	%f2, [0x0040, %r11]
	.word 0xce0ac01f  ! 825: LDUB_R	ldub	[%r11 + %r31], %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd2c2d17f  ! 826: LDSWA_R	ldswa	[%r11, %r31] 0x8b, %r9
	.word 0xcc5a801f  ! 827: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xc9ba981f  ! 828: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba98bf  ! 829: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 830: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc83a801f  ! 831: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd0d2907f  ! 832: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r8
	.word 0xc642801f  ! 833: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc7e2a01f  ! 834: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba999f  ! 835: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc64ac01f  ! 836: LDSB_R	ldsb	[%r11 + %r31], %r3
	.word 0xc7ba981f  ! 837: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2901f  ! 838: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba981f  ! 839: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 840: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd28a905f  ! 841: LDUBA_R	lduba	[%r10, %r31] 0x82, %r9
	.word 0xc01a801f  ! 842: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xc7ba983f  ! 843: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 844: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2a01f  ! 845: CASA_R	casa	[%r10] %asi, %r31, %r3
TH_LABEL845:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7ba993f  ! 846: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc922801f  ! 847: STF_R	st	%f4, [%r31, %r10]
	.word 0xc5e2901f  ! 848: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2913f  ! 849: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xd01a801f  ! 850: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc39aa020  ! 851: LDDFA_I	ldda	[%r10, 0x0020], %f1
	.word 0xcc02a050  ! 852: LDUW_I	lduw	[%r10 + 0x0050], %r6
	.word 0xc7f2a01f  ! 853: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba981f  ! 854: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 855: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc682e06c  ! 856: LDUWA_I	lduwa	[%r11, + 0x006c] %asi, %r3
	.word 0xcdbaa078  ! 857: STDFA_I	stda	%f6, [0x0078, %r10]
	.word 0xd3bad85f  ! 858: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc6ca915f  ! 859: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r3
	.word 0xc9ba989f  ! 860: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9e2a01f  ! 861: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83a801f  ! 862: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc302c01f  ! 863: LDF_R	ld	[%r11, %r31], %f1
	.word 0xc302e07c  ! 864: LDF_I	ld	[%r11, 0x007c], %f1
	.word 0xd01a801f  ! 865: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1e2901f  ! 866: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xcc52c01f  ! 867: LDSH_R	ldsh	[%r11 + %r31], %r6
	.word 0xd3ba999f  ! 868: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd2d2e010  ! 869: LDSHA_I	ldsha	[%r11, + 0x0010] %asi, %r9
	.word 0xc502e03c  ! 870: LDF_I	ld	[%r11, 0x003c], %f2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbba981f  ! 871: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcc82907f  ! 872: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r6
	.word 0xcfba993f  ! 873: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 874: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcdbae008  ! 875: STDFA_I	stda	%f6, [0x0008, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3ba987f  ! 876: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2901f  ! 877: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc202801f  ! 878: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xc83ae048  ! 879: STD_I	std	%r4, [%r11 + 0x0048]
	.word 0xce92d15f  ! 880: LDUHA_R	lduha	[%r11, %r31] 0x8a, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdbae048  ! 881: STDFA_I	stda	%f6, [0x0048, %r11]
	.word 0xcdba981f  ! 882: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 883: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 884: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 885: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc89aa070  ! 886: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r4
	.word 0xd1f2a01f  ! 887: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba98bf  ! 888: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa020  ! 889: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd09aa008  ! 890: LDDA_I	ldda	[%r10, + 0x0008] %asi, %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfbad83f  ! 891: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad95f  ! 892: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcdbaa020  ! 893: STDFA_I	stda	%f6, [0x0020, %r10]
	.word 0xcbe2a01f  ! 894: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba981f  ! 895: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbba991f  ! 896: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 897: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc842c01f  ! 898: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xd2da905f  ! 899: LDXA_R	ldxa	[%r10, %r31] 0x82, %r9
	.word 0xc3bad8bf  ! 900: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3bad91f  ! 901: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d11f  ! 902: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xc3bad97f  ! 903: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcec2901f  ! 904: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r7
	.word 0xc7ba991f  ! 905: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xccc2a064  ! 906: LDSWA_I	ldswa	[%r10, + 0x0064] %asi, %r6
	.word 0xd3f2a01f  ! 907: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc702a06c  ! 908: LDF_I	ld	[%r10, 0x006c], %f3
	.word 0xcbbad81f  ! 909: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d01f  ! 910: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbf2d11f  ! 911: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xcbf2e01f  ! 912: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad85f  ! 913: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcc8ae067  ! 914: LDUBA_I	lduba	[%r11, + 0x0067] %asi, %r6
	.word 0xd3bad85f  ! 915: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd39aa030  ! 916: LDDFA_I	ldda	[%r10, 0x0030], %f9
	.word 0xc85ac01f  ! 917: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xd1bad87f  ! 918: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 919: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad99f  ! 920: STDFA_R	stda	%f8, [%r31, %r11]
TH_LABEL920:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1f2e01f  ! 921: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad85f  ! 922: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d03f  ! 923: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xd03ac01f  ! 924: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2e01f  ! 925: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1bad95f  ! 926: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd19aa018  ! 927: LDDFA_I	ldda	[%r10, 0x0018], %f8
	.word 0xcdbad95f  ! 928: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 929: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcdbad85f  ! 930: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdbad87f  ! 931: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad91f  ! 932: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad97f  ! 933: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc39aa000  ! 934: LDDFA_I	ldda	[%r10, 0x0000], %f1
	.word 0xd03aa030  ! 935: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xce5a801f  ! 936: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xcdba981f  ! 937: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba999f  ! 938: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 939: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 940: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc492907f  ! 941: LDUHA_R	lduha	[%r10, %r31] 0x83, %r2
	.word 0xc5e2903f  ! 942: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba993f  ! 943: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc692901f  ! 944: LDUHA_R	lduha	[%r10, %r31] 0x80, %r3
	.word 0xc442801f  ! 945: LDSW_R	ldsw	[%r10 + %r31], %r2
TH_LABEL945:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3ba985f  ! 946: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd39aa020  ! 947: LDDFA_I	ldda	[%r10, 0x0020], %f9
	.word 0xc5e2d01f  ! 948: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xc5bad8bf  ! 949: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 950: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcf9aa058  ! 951: LDDFA_I	ldda	[%r10, 0x0058], %f7
	.word 0xc9f2e01f  ! 952: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc88a911f  ! 953: LDUBA_R	lduba	[%r10, %r31] 0x88, %r4
	.word 0xd2cae049  ! 954: LDSBA_I	ldsba	[%r11, + 0x0049] %asi, %r9
	.word 0xcfba983f  ! 955: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc89ae058  ! 956: LDDA_I	ldda	[%r11, + 0x0058] %asi, %r4
	.word 0xcbba981f  ! 957: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa040  ! 958: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xcbba989f  ! 959: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd20a801f  ! 960: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc03aa040  ! 961: STD_I	std	%r0, [%r10 + 0x0040]
	.word 0xc3e2901f  ! 962: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba993f  ! 963: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd25ac01f  ! 964: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xc85ac01f  ! 965: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc01ae010  ! 966: LDD_I	ldd	[%r11 + 0x0010], %r0
	.word 0xcdba989f  ! 967: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 968: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 969: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 970: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc2d2d03f  ! 971: LDSHA_R	ldsha	[%r11, %r31] 0x81, %r1
	.word 0xcbba981f  ! 972: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba98bf  ! 973: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xca0aa05c  ! 974: LDUB_I	ldub	[%r10 + 0x005c], %r5
	.word 0xd3ba983f  ! 975: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3e2913f  ! 976: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd3f2a01f  ! 977: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03aa058  ! 978: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3f2a01f  ! 979: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 980: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3ba991f  ! 981: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2913f  ! 982: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba985f  ! 983: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 984: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 985: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd2d2901f  ! 986: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r9
	.word 0xc9ba991f  ! 987: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc1aa078  ! 988: LDD_I	ldd	[%r10 + 0x0078], %r6
	.word 0xcde2e01f  ! 989: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xd19aa020  ! 990: LDDFA_I	ldda	[%r10, 0x0020], %f8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd082a060  ! 991: LDUWA_I	lduwa	[%r10, + 0x0060] %asi, %r8
	.word 0xc522801f  ! 992: STF_R	st	%f2, [%r31, %r10]
	.word 0xcf9aa038  ! 993: LDDFA_I	ldda	[%r10, 0x0038], %f7
	.word 0xd302a01c  ! 994: LDF_I	ld	[%r10, 0x001c], %f9
	.word 0xc7f2d11f  ! 995: CASXA_I	casxa	[%r11] 0x88, %r31, %r3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc322c01f  ! 996: STF_R	st	%f1, [%r31, %r11]
	.word 0xc7bae000  ! 997: STDFA_I	stda	%f3, [0x0000, %r11]
	.word 0xc9f2901f  ! 998: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2901f  ! 999: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc39ae058  ! 1000: LDDFA_I	ldda	[%r11, 0x0058], %f1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	subcc %r30, 1, %r30
	bnz  TH7_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	add	%g0,	0x1,	%r30
TH6_LOOP_START:
	.word 0xc9ba989f  ! 1: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc4da907f  ! 2: LDXA_R	ldxa	[%r10, %r31] 0x83, %r2
	.word 0xcc0aa062  ! 3: LDUB_I	ldub	[%r10 + 0x0062], %r6
	.word 0xc89ae008  ! 4: LDDA_I	ldda	[%r11, + 0x0008] %asi, %r4
	.word 0xc5f2d01f  ! 5: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
TH_LABEL5:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc84a801f  ! 6: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xcd9aa030  ! 7: LDDFA_I	ldda	[%r10, 0x0030], %f6
	.word 0xcdba993f  ! 8: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 9: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdbaa040  ! 10: STDFA_I	stda	%f6, [0x0040, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd05aa060  ! 11: LDX_I	ldx	[%r10 + 0x0060], %r8
	.word 0xcff2d01f  ! 12: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad81f  ! 13: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad85f  ! 14: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad83f  ! 15: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd04a801f  ! 16: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xd2dae078  ! 17: LDXA_I	ldxa	[%r11, + 0x0078] %asi, %r9
	.word 0xd212a030  ! 18: LDUH_I	lduh	[%r10 + 0x0030], %r9
	.word 0xc7ba991f  ! 19: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 20: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcec2d01f  ! 21: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r7
	.word 0xc5f2901f  ! 22: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc642801f  ! 23: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xd1bad8bf  ! 24: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd302801f  ! 25: LDF_R	ld	[%r10, %r31], %f9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc852e026  ! 26: LDSH_I	ldsh	[%r11 + 0x0026], %r4
	.word 0xc802a028  ! 27: LDUW_I	lduw	[%r10 + 0x0028], %r4
	.word 0xc5e2a01f  ! 28: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2911f  ! 29: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5e2a01f  ! 30: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5ba989f  ! 31: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc12a050  ! 32: LDUH_I	lduh	[%r10 + 0x0050], %r6
	.word 0xc7ba999f  ! 33: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 34: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7f2a01f  ! 35: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3baa018  ! 36: STDFA_I	stda	%f9, [0x0018, %r10]
	.word 0xd03aa040  ! 37: STD_I	std	%r8, [%r10 + 0x0040]
	.word 0xd3ba99bf  ! 38: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 39: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc2da903f  ! 40: LDXA_R	ldxa	[%r10, %r31] 0x81, %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd092a03a  ! 41: LDUHA_I	lduha	[%r10, + 0x003a] %asi, %r8
	.word 0xc88a911f  ! 42: LDUBA_R	lduba	[%r10, %r31] 0x88, %r4
	.word 0xc9f2901f  ! 43: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc842801f  ! 44: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xc83ac01f  ! 45: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9e2d03f  ! 46: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xc83ae068  ! 47: STD_I	std	%r4, [%r11 + 0x0068]
	.word 0xc9bad85f  ! 48: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 49: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2e01f  ! 50: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd0c2903f  ! 51: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r8
	.word 0xd1ba981f  ! 52: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xce82d01f  ! 53: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r7
	.word 0xc802a044  ! 54: LDUW_I	lduw	[%r10 + 0x0044], %r4
	.word 0xd03ac01f  ! 55: STD_R	std	%r8, [%r11 + %r31]
TH_LABEL55:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3f2d03f  ! 56: CASXA_I	casxa	[%r11] 0x81, %r31, %r9
	.word 0xcc92901f  ! 57: LDUHA_R	lduha	[%r10, %r31] 0x80, %r6
	.word 0xc9bae068  ! 58: STDFA_I	stda	%f4, [0x0068, %r11]
	.word 0xcfbad91f  ! 59: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d01f  ! 60: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfbad95f  ! 61: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcf9aa070  ! 62: LDDFA_I	ldda	[%r10, 0x0070], %f7
	.word 0xceca901f  ! 63: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r7
	.word 0xcc3a801f  ! 64: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc79aa000  ! 65: LDDFA_I	ldda	[%r10, 0x0000], %f3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdf2a01f  ! 66: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc3a801f  ! 67: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba981f  ! 68: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd0d2a01c  ! 69: LDSHA_I	ldsha	[%r10, + 0x001c] %asi, %r8
	.word 0xc902a064  ! 70: LDF_I	ld	[%r10, 0x0064], %f4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd302801f  ! 71: LDF_R	ld	[%r10, %r31], %f9
	.word 0xcde2a01f  ! 72: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2911f  ! 73: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xc802c01f  ! 74: LDUW_R	lduw	[%r11 + %r31], %r4
	.word 0xcc3aa000  ! 75: STD_I	std	%r6, [%r10 + 0x0000]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc28a901f  ! 76: LDUBA_R	lduba	[%r10, %r31] 0x80, %r1
	.word 0xc9bad81f  ! 77: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc722c01f  ! 78: STF_R	st	%f3, [%r31, %r11]
	.word 0xcec2a054  ! 79: LDSWA_I	ldswa	[%r10, + 0x0054] %asi, %r7
	.word 0xd3baa060  ! 80: STDFA_I	stda	%f9, [0x0060, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc4d2913f  ! 81: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r2
	.word 0xd292d11f  ! 82: LDUHA_R	lduha	[%r11, %r31] 0x88, %r9
	.word 0xc9ba987f  ! 83: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 84: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83aa070  ! 85: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc8dae060  ! 86: LDXA_I	ldxa	[%r11, + 0x0060] %asi, %r4
	.word 0xc5bad83f  ! 87: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd252a064  ! 88: LDSH_I	ldsh	[%r10 + 0x0064], %r9
	.word 0xc5ba981f  ! 89: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 90: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5ba99bf  ! 91: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba983f  ! 92: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc892e008  ! 93: LDUHA_I	lduha	[%r11, + 0x0008] %asi, %r4
	.word 0xc03aa058  ! 94: STD_I	std	%r0, [%r10 + 0x0058]
	.word 0xd212c01f  ! 95: LDUH_R	lduh	[%r11 + %r31], %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3ba99bf  ! 96: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba997f  ! 97: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2901f  ! 98: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba98bf  ! 99: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd0d2a02c  ! 100: LDSHA_I	ldsha	[%r10, + 0x002c] %asi, %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcedae038  ! 101: LDXA_I	ldxa	[%r11, + 0x0038] %asi, %r7
	.word 0xcc3aa060  ! 102: STD_I	std	%r6, [%r10 + 0x0060]
	.word 0xd1baa018  ! 103: STDFA_I	stda	%f8, [0x0018, %r10]
	.word 0xd052e074  ! 104: LDSH_I	ldsh	[%r11 + 0x0074], %r8
	.word 0xcc5a801f  ! 105: LDX_R	ldx	[%r10 + %r31], %r6
TH_LABEL105:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5bae040  ! 106: STDFA_I	stda	%f2, [0x0040, %r11]
	.word 0xc5ba987f  ! 107: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2903f  ! 108: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xcf9aa030  ! 109: LDDFA_I	ldda	[%r10, 0x0030], %f7
	.word 0xc5ba983f  ! 110: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL110:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc43a801f  ! 111: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd302a054  ! 112: LDF_I	ld	[%r10, 0x0054], %f9
	.word 0xc202801f  ! 113: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xcbf2a01f  ! 114: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba997f  ! 115: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd302801f  ! 116: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc3e2e01f  ! 117: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d01f  ! 118: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3e2e01f  ! 119: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3e2d13f  ! 120: CASA_I	casa	[%r11] 0x89, %r31, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3f2d03f  ! 121: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xc3f2e01f  ! 122: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad99f  ! 123: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd3baa060  ! 124: STDFA_I	stda	%f9, [0x0060, %r10]
	.word 0xcbba989f  ! 125: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbba983f  ! 126: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba989f  ! 127: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba98bf  ! 128: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcad2a010  ! 129: LDSHA_I	ldsha	[%r10, + 0x0010] %asi, %r5
	.word 0xcdbad87f  ! 130: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc3ae060  ! 131: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xd08a905f  ! 132: LDUBA_R	lduba	[%r10, %r31] 0x82, %r8
	.word 0xd1ba983f  ! 133: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2913f  ! 134: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xd1e2a01f  ! 135: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd03aa060  ! 136: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd1e2a01f  ! 137: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc892911f  ! 138: LDUHA_R	lduha	[%r10, %r31] 0x88, %r4
	.word 0xc7baa070  ! 139: STDFA_I	stda	%f3, [0x0070, %r10]
	.word 0xc692901f  ! 140: LDUHA_R	lduha	[%r10, %r31] 0x80, %r3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd242a074  ! 141: LDSW_I	ldsw	[%r10 + 0x0074], %r9
	.word 0xcfbad99f  ! 142: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xccc2907f  ! 143: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r6
	.word 0xc3ba993f  ! 144: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 145: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3ba991f  ! 146: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc902801f  ! 147: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc9bad81f  ! 148: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad93f  ! 149: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc84aa03f  ! 150: LDSB_I	ldsb	[%r10 + 0x003f], %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc412a054  ! 151: LDUH_I	lduh	[%r10 + 0x0054], %r2
	.word 0xcc3aa060  ! 152: STD_I	std	%r6, [%r10 + 0x0060]
	.word 0xc2ca907f  ! 153: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r1
	.word 0xcbf2e01f  ! 154: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbf2d01f  ! 155: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
TH_LABEL155:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xce8a915f  ! 156: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r7
	.word 0xd05aa028  ! 157: LDX_I	ldx	[%r10 + 0x0028], %r8
	.word 0xc9f2e01f  ! 158: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 159: STD_R	std	%r4, [%r11 + %r31]
	.word 0xce8a915f  ! 160: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbbae078  ! 161: STDFA_I	stda	%f5, [0x0078, %r11]
	.word 0xc492917f  ! 162: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r2
	.word 0xcbba991f  ! 163: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 164: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2901f  ! 165: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbf2a01f  ! 166: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xd2c2915f  ! 167: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r9
	.word 0xcbf2e01f  ! 168: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xce8aa068  ! 169: LDUBA_I	lduba	[%r10, + 0x0068] %asi, %r7
	.word 0xc5ba987f  ! 170: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc43aa078  ! 171: STD_I	std	%r2, [%r10 + 0x0078]
	.word 0xc79aa000  ! 172: LDDFA_I	ldda	[%r10, 0x0000], %f3
	.word 0xc45aa068  ! 173: LDX_I	ldx	[%r10 + 0x0068], %r2
	.word 0xd3f2e01f  ! 174: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2e01f  ! 175: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3f2d03f  ! 176: CASXA_I	casxa	[%r11] 0x81, %r31, %r9
	.word 0xd3bad97f  ! 177: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc4c2905f  ! 178: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r2
	.word 0xc3ba995f  ! 179: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcc4aa021  ! 180: LDSB_I	ldsb	[%r10 + 0x0021], %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3e2913f  ! 181: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd3f2a01f  ! 182: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba98bf  ! 183: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba991f  ! 184: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc802e050  ! 185: LDUW_I	lduw	[%r11 + 0x0050], %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc43aa048  ! 186: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc5e2a01f  ! 187: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xd302a01c  ! 188: LDF_I	ld	[%r10, 0x001c], %f9
	.word 0xd202801f  ! 189: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xcc52801f  ! 190: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcb9ae048  ! 191: LDDFA_I	ldda	[%r11, 0x0048], %f5
	.word 0xc24ac01f  ! 192: LDSB_R	ldsb	[%r11 + %r31], %r1
	.word 0xcbba991f  ! 193: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 194: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbf2a01f  ! 195: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbf2901f  ! 196: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xc922801f  ! 197: STF_R	st	%f4, [%r31, %r10]
	.word 0xd20a801f  ! 198: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xd39aa048  ! 199: LDDFA_I	ldda	[%r10, 0x0048], %f9
	.word 0xd1ba981f  ! 200: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc99aa050  ! 201: LDDFA_I	ldda	[%r10, 0x0050], %f4
	.word 0xd302801f  ! 202: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc85a801f  ! 203: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xcfba995f  ! 204: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd322c01f  ! 205: STF_R	st	%f9, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7ba983f  ! 206: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd3bae050  ! 207: STDFA_I	stda	%f9, [0x0050, %r11]
	.word 0xd082a014  ! 208: LDUWA_I	lduwa	[%r10, + 0x0014] %asi, %r8
	.word 0xcdf2a01f  ! 209: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba983f  ! 210: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL210:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd39aa000  ! 211: LDDFA_I	ldda	[%r10, 0x0000], %f9
	.word 0xc03ac01f  ! 212: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc642a028  ! 213: LDSW_I	ldsw	[%r10 + 0x0028], %r3
	.word 0xd3bae008  ! 214: STDFA_I	stda	%f9, [0x0008, %r11]
	.word 0xc83aa048  ! 215: STD_I	std	%r4, [%r10 + 0x0048]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xce92911f  ! 216: LDUHA_R	lduha	[%r10, %r31] 0x88, %r7
	.word 0xcc92a078  ! 217: LDUHA_I	lduha	[%r10, + 0x0078] %asi, %r6
	.word 0xd042801f  ! 218: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xcf9ae020  ! 219: LDDFA_I	ldda	[%r11, 0x0020], %f7
	.word 0xce42e074  ! 220: LDSW_I	ldsw	[%r11 + 0x0074], %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xceca911f  ! 221: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r7
	.word 0xcde2913f  ! 222: CASA_I	casa	[%r10] 0x89, %r31, %r6
	.word 0xc9bae058  ! 223: STDFA_I	stda	%f4, [0x0058, %r11]
	.word 0xc502c01f  ! 224: LDF_R	ld	[%r11, %r31], %f2
	.word 0xcc1a801f  ! 225: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03ac01f  ! 226: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad81f  ! 227: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 228: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad9bf  ! 229: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad8bf  ! 230: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3bad85f  ! 231: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad91f  ! 232: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 233: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad83f  ! 234: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc202a060  ! 235: LDUW_I	lduw	[%r10 + 0x0060], %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1ba98bf  ! 236: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 237: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd242e040  ! 238: LDSW_I	ldsw	[%r11 + 0x0040], %r9
	.word 0xc7e2901f  ! 239: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba981f  ! 240: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc1aa008  ! 241: LDD_I	ldd	[%r10 + 0x0008], %r6
	.word 0xc48ad03f  ! 242: LDUBA_R	lduba	[%r11, %r31] 0x81, %r2
	.word 0xc702a034  ! 243: LDF_I	ld	[%r10, 0x0034], %f3
	.word 0xd3bad91f  ! 244: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad97f  ! 245: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd00a801f  ! 246: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xce8ae012  ! 247: LDUBA_I	lduba	[%r11, + 0x0012] %asi, %r7
	.word 0xc5bae070  ! 248: STDFA_I	stda	%f2, [0x0070, %r11]
	.word 0xcd02c01f  ! 249: LDF_R	ld	[%r11, %r31], %f6
	.word 0xc5e2a01f  ! 250: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xca12801f  ! 251: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xcec2911f  ! 252: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r7
	.word 0xd1ba995f  ! 253: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2901f  ! 254: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1e2901f  ! 255: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xce8a907f  ! 256: LDUBA_R	lduba	[%r10, %r31] 0x83, %r7
	.word 0xc3f2d03f  ! 257: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xc3bad97f  ! 258: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad85f  ! 259: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 260: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc4d2a02c  ! 261: LDSHA_I	ldsha	[%r10, + 0x002c] %asi, %r2
	.word 0xcec2a058  ! 262: LDSWA_I	ldswa	[%r10, + 0x0058] %asi, %r7
	.word 0xca0a801f  ! 263: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xd3f2a01f  ! 264: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2901f  ! 265: CASA_I	casa	[%r10] 0x80, %r31, %r9
TH_LABEL265:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3ba98bf  ! 266: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcc1a801f  ! 267: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xcc8ae055  ! 268: LDUBA_I	lduba	[%r11, + 0x0055] %asi, %r6
	.word 0xcb9aa060  ! 269: LDDFA_I	ldda	[%r10, 0x0060], %f5
	.word 0xc212e000  ! 270: LDUH_I	lduh	[%r11 + 0x0000], %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc642801f  ! 271: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc4d2e052  ! 272: LDSHA_I	ldsha	[%r11, + 0x0052] %asi, %r2
	.word 0xc3f2d13f  ! 273: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xc3bad81f  ! 274: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad85f  ! 275: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3baa078  ! 276: STDFA_I	stda	%f1, [0x0078, %r10]
	.word 0xc722801f  ! 277: STF_R	st	%f3, [%r31, %r10]
	.word 0xd39aa058  ! 278: LDDFA_I	ldda	[%r10, 0x0058], %f9
	.word 0xc2dad15f  ! 279: LDXA_R	ldxa	[%r11, %r31] 0x8a, %r1
	.word 0xcdba983f  ! 280: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdf2903f  ! 281: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xcdf2913f  ! 282: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcdf2901f  ! 283: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xc882a070  ! 284: LDUWA_I	lduwa	[%r10, + 0x0070] %asi, %r4
	.word 0xc9ba995f  ! 285: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9e2a01f  ! 286: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83aa008  ! 287: STD_I	std	%r4, [%r10 + 0x0008]
	.word 0xc9ba993f  ! 288: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2911f  ! 289: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xd242801f  ! 290: LDSW_R	ldsw	[%r10 + %r31], %r9
TH_LABEL290:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd03a801f  ! 291: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1e2a01f  ! 292: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd0d2e030  ! 293: LDSHA_I	ldsha	[%r11, + 0x0030] %asi, %r8
	.word 0xc7f2e01f  ! 294: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad87f  ! 295: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7bad85f  ! 296: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae028  ! 297: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc7bad83f  ! 298: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xccd2901f  ! 299: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r6
	.word 0xd03a801f  ! 300: STD_R	std	%r8, [%r10 + %r31]
TH_LABEL300:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1ba999f  ! 301: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd082e040  ! 302: LDUWA_I	lduwa	[%r11, + 0x0040] %asi, %r8
	.word 0xd3e2a01f  ! 303: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 304: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba981f  ! 305: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7baa058  ! 306: STDFA_I	stda	%f3, [0x0058, %r10]
	.word 0xcbbaa068  ! 307: STDFA_I	stda	%f5, [0x0068, %r10]
	.word 0xcc3ac01f  ! 308: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcdf2d03f  ! 309: CASXA_I	casxa	[%r11] 0x81, %r31, %r6
	.word 0xcdbad97f  ! 310: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcb9ae010  ! 311: LDDFA_I	ldda	[%r11, 0x0010], %f5
	.word 0xcfba985f  ! 312: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc68ad13f  ! 313: LDUBA_R	lduba	[%r11, %r31] 0x89, %r3
	.word 0xd05a801f  ! 314: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xcc3aa078  ! 315: STD_I	std	%r6, [%r10 + 0x0078]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc8dae020  ! 316: LDXA_I	ldxa	[%r11, + 0x0020] %asi, %r4
	.word 0xce52c01f  ! 317: LDSH_R	ldsh	[%r11 + %r31], %r7
	.word 0xc83aa078  ! 318: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xcbe2903f  ! 319: CASA_I	casa	[%r10] 0x81, %r31, %r5
	.word 0xc642e048  ! 320: LDSW_I	ldsw	[%r11 + 0x0048], %r3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc8daa030  ! 321: LDXA_I	ldxa	[%r10, + 0x0030] %asi, %r4
	.word 0xd3f2903f  ! 322: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xd3ba983f  ! 323: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 324: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc302e008  ! 325: LDF_I	ld	[%r11, 0x0008], %f1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdbad95f  ! 326: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc8aa065  ! 327: LDUBA_I	lduba	[%r10, + 0x0065] %asi, %r6
	.word 0xc03ae030  ! 328: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xc3e2e01f  ! 329: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d11f  ! 330: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc03ae030  ! 331: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xc3f2e01f  ! 332: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad91f  ! 333: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc482e01c  ! 334: LDUWA_I	lduwa	[%r11, + 0x001c] %asi, %r2
	.word 0xcfe2a01f  ! 335: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfe2a01f  ! 336: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc9baa048  ! 337: STDFA_I	stda	%f4, [0x0048, %r10]
	.word 0xcdf2a01f  ! 338: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xd282d01f  ! 339: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r9
	.word 0xc5e2d11f  ! 340: CASA_I	casa	[%r11] 0x88, %r31, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc20a801f  ! 341: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xcdba997f  ! 342: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc402c01f  ! 343: LDUW_R	lduw	[%r11 + %r31], %r2
	.word 0xc81aa068  ! 344: LDD_I	ldd	[%r10 + 0x0068], %r4
	.word 0xc9ba981f  ! 345: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL345:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9ba991f  ! 346: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc882e070  ! 347: LDUWA_I	lduwa	[%r11, + 0x0070] %asi, %r4
	.word 0xc7ba98bf  ! 348: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 349: STD_R	std	%r2, [%r10 + %r31]
	.word 0xcaca901f  ! 350: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd042801f  ! 351: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xca8a901f  ! 352: LDUBA_R	lduba	[%r10, %r31] 0x80, %r5
	.word 0xc682e038  ! 353: LDUWA_I	lduwa	[%r11, + 0x0038] %asi, %r3
	.word 0xce5a801f  ! 354: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xcdba993f  ! 355: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdba987f  ! 356: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 357: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcde2901f  ! 358: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xcde2a01f  ! 359: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xc702e064  ! 360: LDF_I	ld	[%r11, 0x0064], %f3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3e2a01f  ! 361: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3e2901f  ! 362: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba98bf  ! 363: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 364: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xcc5a801f  ! 365: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7ba997f  ! 366: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa010  ! 367: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xca4ac01f  ! 368: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xcfe2913f  ! 369: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcfe2a01f  ! 370: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcff2a01f  ! 371: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcc3aa010  ! 372: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xc2d2a05a  ! 373: LDSHA_I	ldsha	[%r10, + 0x005a] %asi, %r1
	.word 0xc3e2a01f  ! 374: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba99bf  ! 375: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc4caa06c  ! 376: LDSBA_I	ldsba	[%r10, + 0x006c] %asi, %r2
	.word 0xcbba995f  ! 377: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 378: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba983f  ! 379: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2901f  ! 380: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc242e034  ! 381: LDSW_I	ldsw	[%r11 + 0x0034], %r1
	.word 0xcfe2a01f  ! 382: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcc3aa038  ! 383: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcfe2901f  ! 384: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcfba987f  ! 385: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL385:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfba98bf  ! 386: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd302e008  ! 387: LDF_I	ld	[%r11, 0x0008], %f9
	.word 0xc43a801f  ! 388: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc4caa01e  ! 389: LDSBA_I	ldsba	[%r10, + 0x001e] %asi, %r2
	.word 0xc902c01f  ! 390: LDF_R	ld	[%r11, %r31], %f4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5bae050  ! 391: STDFA_I	stda	%f2, [0x0050, %r11]
	.word 0xcdba999f  ! 392: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc02801f  ! 393: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xcfba991f  ! 394: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 395: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfba98bf  ! 396: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 397: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xce92907f  ! 398: LDUHA_R	lduha	[%r10, %r31] 0x83, %r7
	.word 0xce8a907f  ! 399: LDUBA_R	lduba	[%r10, %r31] 0x83, %r7
	.word 0xca12a01a  ! 400: LDUH_I	lduh	[%r10 + 0x001a], %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcde2911f  ! 401: CASA_I	casa	[%r10] 0x88, %r31, %r6
	.word 0xcc3a801f  ! 402: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba985f  ! 403: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc81aa040  ! 404: LDD_I	ldd	[%r10 + 0x0040], %r4
	.word 0xc6cae003  ! 405: LDSBA_I	ldsba	[%r11, + 0x0003] %asi, %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc39aa008  ! 406: LDDFA_I	ldda	[%r10, 0x0008], %f1
	.word 0xcdf2a01f  ! 407: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba981f  ! 408: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcacae05d  ! 409: LDSBA_I	ldsba	[%r11, + 0x005d] %asi, %r5
	.word 0xd3ba98bf  ! 410: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3baa078  ! 411: STDFA_I	stda	%f1, [0x0078, %r10]
	.word 0xd28ae07e  ! 412: LDUBA_I	lduba	[%r11, + 0x007e] %asi, %r9
	.word 0xc702a018  ! 413: LDF_I	ld	[%r10, 0x0018], %f3
	.word 0xcff2e01f  ! 414: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xc68aa050  ! 415: LDUBA_I	lduba	[%r10, + 0x0050] %asi, %r3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc03ae000  ! 416: STD_I	std	%r0, [%r11 + 0x0000]
	.word 0xd1baa010  ! 417: STDFA_I	stda	%f8, [0x0010, %r10]
	.word 0xd3e2a01f  ! 418: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 419: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3e2a01f  ! 420: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3ba991f  ! 421: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd2da915f  ! 422: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r9
	.word 0xd1e2901f  ! 423: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd09aa078  ! 424: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r8
	.word 0xc83ac01f  ! 425: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbbad81f  ! 426: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd19aa058  ! 427: LDDFA_I	ldda	[%r10, 0x0058], %f8
	.word 0xcb22801f  ! 428: STF_R	st	%f5, [%r31, %r10]
	.word 0xd3bad97f  ! 429: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcbbae040  ! 430: STDFA_I	stda	%f5, [0x0040, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc902e028  ! 431: LDF_I	ld	[%r11, 0x0028], %f4
	.word 0xcc9ae008  ! 432: LDDA_I	ldda	[%r11, + 0x0008] %asi, %r6
	.word 0xc3bad99f  ! 433: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d03f  ! 434: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xc03ac01f  ! 435: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3bad8bf  ! 436: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad99f  ! 437: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 438: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d11f  ! 439: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xc03ac01f  ! 440: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3f2d01f  ! 441: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc28a901f  ! 442: LDUBA_R	lduba	[%r10, %r31] 0x80, %r1
	.word 0xd102a064  ! 443: LDF_I	ld	[%r10, 0x0064], %f8
	.word 0xc5f2d11f  ! 444: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xc5bad95f  ! 445: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5bad81f  ! 446: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcfbae000  ! 447: STDFA_I	stda	%f7, [0x0000, %r11]
	.word 0xd1ba995f  ! 448: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2903f  ! 449: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xd1f2a01f  ! 450: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc722801f  ! 451: STF_R	st	%f3, [%r31, %r10]
	.word 0xd3ba99bf  ! 452: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc40a801f  ! 453: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xd202e038  ! 454: LDUW_I	lduw	[%r11 + 0x0038], %r9
	.word 0xd3ba98bf  ! 455: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL455:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd24ac01f  ! 456: LDSB_R	ldsb	[%r11 + %r31], %r9
	.word 0xc83a801f  ! 457: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbf2a01f  ! 458: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2903f  ! 459: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xcb9ae050  ! 460: LDDFA_I	ldda	[%r11, 0x0050], %f5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7e2a01f  ! 461: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc43a801f  ! 462: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7f2901f  ! 463: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba991f  ! 464: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba983f  ! 465: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7ba991f  ! 466: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd0c2a038  ! 467: LDSWA_I	ldswa	[%r10, + 0x0038] %asi, %r8
	.word 0xc64ae05d  ! 468: LDSB_I	ldsb	[%r11 + 0x005d], %r3
	.word 0xcb9aa010  ! 469: LDDFA_I	ldda	[%r10, 0x0010], %f5
	.word 0xc88aa057  ! 470: LDUBA_I	lduba	[%r10, + 0x0057] %asi, %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcacae047  ! 471: LDSBA_I	ldsba	[%r11, + 0x0047] %asi, %r5
	.word 0xc5ba993f  ! 472: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcd02801f  ! 473: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc7f2901f  ! 474: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7f2a01f  ! 475: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7ba98bf  ! 476: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 477: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc8c2d05f  ! 478: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r4
	.word 0xc3ba98bf  ! 479: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcada911f  ! 480: LDXA_R	ldxa	[%r10, %r31] 0x88, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbbad87f  ! 481: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd3bae008  ! 482: STDFA_I	stda	%f9, [0x0008, %r11]
	.word 0xc3ba98bf  ! 483: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 484: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc03aa008  ! 485: STD_I	std	%r0, [%r10 + 0x0008]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc702a018  ! 486: LDF_I	ld	[%r10, 0x0018], %f3
	.word 0xc7bad87f  ! 487: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad85f  ! 488: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae078  ! 489: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xd012a066  ! 490: LDUH_I	lduh	[%r10 + 0x0066], %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc3ae030  ! 491: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcdbad87f  ! 492: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad8bf  ! 493: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2d01f  ! 494: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad95f  ! 495: STDFA_R	stda	%f6, [%r31, %r11]
TH_LABEL495:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd28ad01f  ! 496: LDUBA_R	lduba	[%r11, %r31] 0x80, %r9
	.word 0xc7ba98bf  ! 497: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2903f  ! 498: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc41ac01f  ! 499: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xcfba983f  ! 500: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfba981f  ! 501: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba993f  ! 502: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 503: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcff2a01f  ! 504: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xd09ae028  ! 505: LDDA_I	ldda	[%r11, + 0x0028] %asi, %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1ba987f  ! 506: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa000  ! 507: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd1ba999f  ! 508: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc702801f  ! 509: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc03a801f  ! 510: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcb22801f  ! 511: STF_R	st	%f5, [%r31, %r10]
	.word 0xcbba983f  ! 512: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 513: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcb02801f  ! 514: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc59aa060  ! 515: LDDFA_I	ldda	[%r10, 0x0060], %f2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc4d2901f  ! 516: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r2
	.word 0xc79aa040  ! 517: LDDFA_I	ldda	[%r10, 0x0040], %f3
	.word 0xd302801f  ! 518: LDF_R	ld	[%r10, %r31], %f9
	.word 0xcbbae060  ! 519: STDFA_I	stda	%f5, [0x0060, %r11]
	.word 0xcff2a01f  ! 520: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfe2911f  ! 521: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcfba997f  ! 522: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 523: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 524: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcc5a801f  ! 525: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1ba999f  ! 526: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 527: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba981f  ! 528: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 529: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba999f  ! 530: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1e2a01f  ! 531: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 532: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc48ae01b  ! 533: LDUBA_I	lduba	[%r11, + 0x001b] %asi, %r2
	.word 0xc252a010  ! 534: LDSH_I	ldsh	[%r10 + 0x0010], %r1
	.word 0xcfba989f  ! 535: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfe2a01f  ! 536: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2903f  ! 537: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcc3a801f  ! 538: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba995f  ! 539: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba983f  ! 540: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL540:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfbaa028  ! 541: STDFA_I	stda	%f7, [0x0028, %r10]
	.word 0xcbba993f  ! 542: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 543: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba981f  ! 544: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba989f  ! 545: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbba981f  ! 546: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba985f  ! 547: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba995f  ! 548: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc4daa020  ! 549: LDXA_I	ldxa	[%r10, + 0x0020] %asi, %r2
	.word 0xc9baa050  ! 550: STDFA_I	stda	%f4, [0x0050, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbf2903f  ! 551: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xc83aa038  ! 552: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xcbf2a01f  ! 553: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xd0dae020  ! 554: LDXA_I	ldxa	[%r11, + 0x0020] %asi, %r8
	.word 0xc5ba995f  ! 555: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL555:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5e2901f  ! 556: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba981f  ! 557: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 558: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 559: STD_R	std	%r2, [%r10 + %r31]
	.word 0xcd02e018  ! 560: LDF_I	ld	[%r11, 0x0018], %f6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7ba985f  ! 561: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd052c01f  ! 562: LDSH_R	ldsh	[%r11 + %r31], %r8
	.word 0xc88ae046  ! 563: LDUBA_I	lduba	[%r11, + 0x0046] %asi, %r4
	.word 0xd20ac01f  ! 564: LDUB_R	ldub	[%r11 + %r31], %r9
	.word 0xc7ba983f  ! 565: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc612801f  ! 566: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xc43aa058  ! 567: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc7ba981f  ! 568: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 569: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc812e044  ! 570: LDUH_I	lduh	[%r11 + 0x0044], %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1f2d03f  ! 571: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xd1f2d01f  ! 572: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xd1e2e01f  ! 573: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xc99aa010  ! 574: LDDFA_I	ldda	[%r10, 0x0010], %f4
	.word 0xcc1ae010  ! 575: LDD_I	ldd	[%r11 + 0x0010], %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd03aa040  ! 576: STD_I	std	%r8, [%r10 + 0x0040]
	.word 0xd3ba989f  ! 577: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2913f  ! 578: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba991f  ! 579: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce82905f  ! 580: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5ba999f  ! 581: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba983f  ! 582: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 583: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc85a801f  ! 584: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xcbbaa058  ! 585: STDFA_I	stda	%f5, [0x0058, %r10]
TH_LABEL585:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5f2901f  ! 586: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba997f  ! 587: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2901f  ! 588: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xce02a048  ! 589: LDUW_I	lduw	[%r10 + 0x0048], %r7
	.word 0xcbba991f  ! 590: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc492d03f  ! 591: LDUHA_R	lduha	[%r11, %r31] 0x81, %r2
	.word 0xc9bad95f  ! 592: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9f2e01f  ! 593: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xcacad01f  ! 594: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r5
	.word 0xcd02801f  ! 595: LDF_R	ld	[%r10, %r31], %f6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd012e046  ! 596: LDUH_I	lduh	[%r11 + 0x0046], %r8
	.word 0xd3bad87f  ! 597: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad99f  ! 598: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad91f  ! 599: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd05aa058  ! 600: LDX_I	ldx	[%r10 + 0x0058], %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5bad81f  ! 601: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd20aa01f  ! 602: LDUB_I	ldub	[%r10 + 0x001f], %r9
	.word 0xcbbad99f  ! 603: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc2da905f  ! 604: LDXA_R	ldxa	[%r10, %r31] 0x82, %r1
	.word 0xce4a801f  ! 605: LDSB_R	ldsb	[%r10 + %r31], %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1baa060  ! 606: STDFA_I	stda	%f8, [0x0060, %r10]
	.word 0xc7bad91f  ! 607: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd202801f  ! 608: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xc48aa054  ! 609: LDUBA_I	lduba	[%r10, + 0x0054] %asi, %r2
	.word 0xd212a06c  ! 610: LDUH_I	lduh	[%r10 + 0x006c], %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc83ae020  ! 611: STD_I	std	%r4, [%r11 + 0x0020]
	.word 0xc9bad97f  ! 612: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc81ae040  ! 613: LDD_I	ldd	[%r11 + 0x0040], %r4
	.word 0xcdbad83f  ! 614: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc02a00c  ! 615: LDUW_I	lduw	[%r10 + 0x000c], %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3f2d01f  ! 616: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc60aa02f  ! 617: LDUB_I	ldub	[%r10 + 0x002f], %r3
	.word 0xceca903f  ! 618: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r7
	.word 0xccd2913f  ! 619: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r6
	.word 0xc902801f  ! 620: LDF_R	ld	[%r10, %r31], %f4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc83ae070  ! 621: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xc85a801f  ! 622: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xd3bad8bf  ! 623: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad89f  ! 624: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc702801f  ! 625: LDF_R	ld	[%r10, %r31], %f3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc83a801f  ! 626: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcc4ae02a  ! 627: LDSB_I	ldsb	[%r11 + 0x002a], %r6
	.word 0xc3ba987f  ! 628: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba991f  ! 629: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 630: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd212e02a  ! 631: LDUH_I	lduh	[%r11 + 0x002a], %r9
	.word 0xc9bad87f  ! 632: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc442801f  ! 633: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xc692a074  ! 634: LDUHA_I	lduha	[%r10, + 0x0074] %asi, %r3
	.word 0xcdf2e01f  ! 635: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc4d2e076  ! 636: LDSHA_I	ldsha	[%r11, + 0x0076] %asi, %r2
	.word 0xcff2903f  ! 637: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcff2901f  ! 638: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcfe2901f  ! 639: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcc02801f  ! 640: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfba98bf  ! 641: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc9ae028  ! 642: LDDA_I	ldda	[%r11, + 0x0028] %asi, %r6
	.word 0xcb02801f  ! 643: LDF_R	ld	[%r10, %r31], %f5
	.word 0xc502a018  ! 644: LDF_I	ld	[%r10, 0x0018], %f2
	.word 0xd242c01f  ! 645: LDSW_R	ldsw	[%r11 + %r31], %r9
TH_LABEL645:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc84ac01f  ! 646: LDSB_R	ldsb	[%r11 + %r31], %r4
	.word 0xc4cad17f  ! 647: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r2
	.word 0xc9ba993f  ! 648: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 649: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba985f  ! 650: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9f2a01f  ! 651: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc83aa010  ! 652: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xc9e2913f  ! 653: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc6caa028  ! 654: LDSBA_I	ldsba	[%r10, + 0x0028] %asi, %r3
	.word 0xc6d2a028  ! 655: LDSHA_I	ldsha	[%r10, + 0x0028] %asi, %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9ba991f  ! 656: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcadaa040  ! 657: LDXA_I	ldxa	[%r10, + 0x0040] %asi, %r5
	.word 0xc5e2901f  ! 658: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xd04aa057  ! 659: LDSB_I	ldsb	[%r10 + 0x0057], %r8
	.word 0xcc3ae030  ! 660: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfbad81f  ! 661: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbaa058  ! 662: STDFA_I	stda	%f7, [0x0058, %r10]
	.word 0xd1e2e01f  ! 663: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xc702a004  ! 664: LDF_I	ld	[%r10, 0x0004], %f3
	.word 0xc3ba981f  ! 665: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL665:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3ba99bf  ! 666: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2911f  ! 667: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xd092901f  ! 668: LDUHA_R	lduha	[%r10, %r31] 0x80, %r8
	.word 0xccc2905f  ! 669: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r6
	.word 0xcc42801f  ! 670: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd03ac01f  ! 671: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad93f  ! 672: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc3baa058  ! 673: STDFA_I	stda	%f1, [0x0058, %r10]
	.word 0xc5ba98bf  ! 674: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa038  ! 675: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xca5aa050  ! 676: LDX_I	ldx	[%r10 + 0x0050], %r5
	.word 0xd302e070  ! 677: LDF_I	ld	[%r11, 0x0070], %f9
	.word 0xc9e2e01f  ! 678: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad81f  ! 679: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad8bf  ! 680: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9bad93f  ! 681: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d01f  ! 682: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc83ae060  ! 683: STD_I	std	%r4, [%r11 + 0x0060]
	.word 0xcc8aa049  ! 684: LDUBA_I	lduba	[%r10, + 0x0049] %asi, %r6
	.word 0xc4daa048  ! 685: LDXA_I	ldxa	[%r10, + 0x0048] %asi, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcff2e01f  ! 686: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcfbad8bf  ! 687: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d03f  ! 688: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xce0a801f  ! 689: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xd1ba995f  ! 690: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd25aa028  ! 691: LDX_I	ldx	[%r10 + 0x0028], %r9
	.word 0xd2c2e060  ! 692: LDSWA_I	ldswa	[%r11, + 0x0060] %asi, %r9
	.word 0xc43ae028  ! 693: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc43ac01f  ! 694: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7bad81f  ! 695: STDFA_R	stda	%f3, [%r31, %r11]
TH_LABEL695:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd20ac01f  ! 696: LDUB_R	ldub	[%r11 + %r31], %r9
	.word 0xc7e2a01f  ! 697: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba981f  ! 698: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd052a066  ! 699: LDSH_I	ldsh	[%r10 + 0x0066], %r8
	.word 0xc3f2a01f  ! 700: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3ba991f  ! 701: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 702: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3f2a01f  ! 703: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba995f  ! 704: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 705: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL705:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3ba997f  ! 706: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba983f  ! 707: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd2daa058  ! 708: LDXA_I	ldxa	[%r10, + 0x0058] %asi, %r9
	.word 0xc802801f  ! 709: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xc242a024  ! 710: LDSW_I	ldsw	[%r10 + 0x0024], %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3e2a01f  ! 711: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3e2a01f  ! 712: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba989f  ! 713: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2911f  ! 714: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd03a801f  ! 715: STD_R	std	%r8, [%r10 + %r31]
TH_LABEL715:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3f2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc892915f  ! 717: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r4
	.word 0xcb9ae068  ! 718: LDDFA_I	ldda	[%r11, 0x0068], %f5
	.word 0xd302a07c  ! 719: LDF_I	ld	[%r10, 0x007c], %f9
	.word 0xd3e2d01f  ! 720: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5baa008  ! 721: STDFA_I	stda	%f2, [0x0008, %r10]
	.word 0xd3ba987f  ! 722: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 723: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba997f  ! 724: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 725: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3ba987f  ! 726: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcf9aa040  ! 727: LDDFA_I	ldda	[%r10, 0x0040], %f7
	.word 0xc322c01f  ! 728: STF_R	st	%f1, [%r31, %r11]
	.word 0xd3e2e01f  ! 729: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3f2d13f  ! 730: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc68ad01f  ! 731: LDUBA_R	lduba	[%r11, %r31] 0x80, %r3
	.word 0xc5e2903f  ! 732: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba981f  ! 733: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 734: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba983f  ! 735: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc852a014  ! 736: LDSH_I	ldsh	[%r10 + 0x0014], %r4
	.word 0xc3ba985f  ! 737: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd04ac01f  ! 738: LDSB_R	ldsb	[%r11 + %r31], %r8
	.word 0xc7f2a01f  ! 739: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7f2901f  ! 740: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc44aa061  ! 741: LDSB_I	ldsb	[%r10 + 0x0061], %r2
	.word 0xcfe2a01f  ! 742: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba98bf  ! 743: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 744: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc812e036  ! 745: LDUH_I	lduh	[%r11 + 0x0036], %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc88ad01f  ! 746: LDUBA_R	lduba	[%r11, %r31] 0x80, %r4
	.word 0xcadaa008  ! 747: LDXA_I	ldxa	[%r10, + 0x0008] %asi, %r5
	.word 0xce02c01f  ! 748: LDUW_R	lduw	[%r11 + %r31], %r7
	.word 0xc412c01f  ! 749: LDUH_R	lduh	[%r11 + %r31], %r2
	.word 0xc09ae078  ! 750: LDDA_I	ldda	[%r11, + 0x0078] %asi, %r0
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xce82a05c  ! 751: LDUWA_I	lduwa	[%r10, + 0x005c] %asi, %r7
	.word 0xc5e2e01f  ! 752: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad8bf  ! 753: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad91f  ! 754: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc64aa07b  ! 755: LDSB_I	ldsb	[%r10 + 0x007b], %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfba985f  ! 756: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd20a801f  ! 757: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xc9e2d03f  ! 758: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xc9f2d01f  ! 759: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xc09ae048  ! 760: LDDA_I	ldda	[%r11, + 0x0048] %asi, %r0
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd302a054  ! 761: LDF_I	ld	[%r10, 0x0054], %f9
	.word 0xc9ba983f  ! 762: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd00aa022  ! 763: LDUB_I	ldub	[%r10 + 0x0022], %r8
	.word 0xcd02a058  ! 764: LDF_I	ld	[%r10, 0x0058], %f6
	.word 0xc9ba989f  ! 765: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc83a801f  ! 766: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba983f  ! 767: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 768: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba993f  ! 769: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba98bf  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xce82a008  ! 771: LDUWA_I	lduwa	[%r10, + 0x0008] %asi, %r7
	.word 0xcb02801f  ! 772: LDF_R	ld	[%r10, %r31], %f5
	.word 0xcfba983f  ! 773: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca8ae00d  ! 774: LDUBA_I	lduba	[%r11, + 0x000d] %asi, %r5
	.word 0xc81aa028  ! 775: LDD_I	ldd	[%r10 + 0x0028], %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1f2d01f  ! 776: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xd212801f  ! 777: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xc7f2901f  ! 778: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba98bf  ! 779: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc89aa078  ! 780: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc252801f  ! 781: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xcbba995f  ! 782: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 783: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc88aa046  ! 784: LDUBA_I	lduba	[%r10, + 0x0046] %asi, %r4
	.word 0xc28ad17f  ! 785: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3e2a01f  ! 786: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 787: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xcd02a050  ! 788: LDF_I	ld	[%r10, 0x0050], %f6
	.word 0xd08aa070  ! 789: LDUBA_I	lduba	[%r10, + 0x0070] %asi, %r8
	.word 0xd1bad81f  ! 790: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1bad9bf  ! 791: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad93f  ! 792: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xce52a02a  ! 793: LDSH_I	ldsh	[%r10 + 0x002a], %r7
	.word 0xc83ac01f  ! 794: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbf2e01f  ! 795: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc59aa008  ! 796: LDDFA_I	ldda	[%r10, 0x0008], %f2
	.word 0xcdba98bf  ! 797: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 798: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd2d2907f  ! 799: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r9
	.word 0xc84aa056  ! 800: LDSB_I	ldsb	[%r10 + 0x0056], %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3bae028  ! 801: STDFA_I	stda	%f9, [0x0028, %r11]
	.word 0xc5ba997f  ! 802: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 803: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43a801f  ! 804: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa068  ! 805: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5ba983f  ! 806: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 807: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xccc2905f  ! 808: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r6
	.word 0xcbbaa020  ! 809: STDFA_I	stda	%f5, [0x0020, %r10]
	.word 0xced2907f  ! 810: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd012e050  ! 811: LDUH_I	lduh	[%r11 + 0x0050], %r8
	.word 0xc9ba997f  ! 812: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 813: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba98bf  ! 814: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc81aa070  ! 815: LDD_I	ldd	[%r10 + 0x0070], %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcacad17f  ! 816: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r5
	.word 0xcff2a01f  ! 817: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfe2a01f  ! 818: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2901f  ! 819: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcc5aa068  ! 820: LDX_I	ldx	[%r10 + 0x0068], %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfba98bf  ! 821: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd2da901f  ! 822: LDXA_R	ldxa	[%r10, %r31] 0x80, %r9
	.word 0xd0dae010  ! 823: LDXA_I	ldxa	[%r11, + 0x0010] %asi, %r8
	.word 0xd3baa070  ! 824: STDFA_I	stda	%f9, [0x0070, %r10]
	.word 0xcc0ac01f  ! 825: LDUB_R	ldub	[%r11 + %r31], %r6
TH_LABEL825:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc4c2901f  ! 826: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r2
	.word 0xc65a801f  ! 827: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xc9ba981f  ! 828: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba99bf  ! 829: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 830: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL830:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc83a801f  ! 831: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc6d2901f  ! 832: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r3
	.word 0xd042801f  ! 833: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xc7e2a01f  ! 834: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba999f  ! 835: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xce4ac01f  ! 836: LDSB_R	ldsb	[%r11 + %r31], %r7
	.word 0xc7ba983f  ! 837: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2901f  ! 838: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba99bf  ! 839: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 840: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xca8ad13f  ! 841: LDUBA_R	lduba	[%r11, %r31] 0x89, %r5
	.word 0xc41a801f  ! 842: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc7ba987f  ! 843: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 844: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2a01f  ! 845: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7ba983f  ! 846: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc922801f  ! 847: STF_R	st	%f4, [%r31, %r10]
	.word 0xc5e2901f  ! 848: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2911f  ! 849: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xc81a801f  ! 850: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc99aa010  ! 851: LDDFA_I	ldda	[%r10, 0x0010], %f4
	.word 0xcc02a064  ! 852: LDUW_I	lduw	[%r10 + 0x0064], %r6
	.word 0xc7f2a01f  ! 853: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba98bf  ! 854: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 855: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc682a054  ! 856: LDUWA_I	lduwa	[%r10, + 0x0054] %asi, %r3
	.word 0xcdbaa070  ! 857: STDFA_I	stda	%f6, [0x0070, %r10]
	.word 0xd3bad99f  ! 858: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc4ca905f  ! 859: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r2
	.word 0xc9ba991f  ! 860: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9e2a01f  ! 861: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83a801f  ! 862: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcb02801f  ! 863: LDF_R	ld	[%r10, %r31], %f5
	.word 0xd302a034  ! 864: LDF_I	ld	[%r10, 0x0034], %f9
	.word 0xc81ac01f  ! 865: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1e2911f  ! 866: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xce52801f  ! 867: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xd3ba981f  ! 868: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcad2e008  ! 869: LDSHA_I	ldsha	[%r11, + 0x0008] %asi, %r5
	.word 0xc902a048  ! 870: LDF_I	ld	[%r10, 0x0048], %f4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbba983f  ! 871: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcc82907f  ! 872: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r6
	.word 0xcfba987f  ! 873: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 874: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xd3baa048  ! 875: STDFA_I	stda	%f9, [0x0048, %r10]
TH_LABEL875:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3ba993f  ! 876: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2903f  ! 877: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xce02801f  ! 878: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xc83ae048  ! 879: STD_I	std	%r4, [%r11 + 0x0048]
	.word 0xc892915f  ! 880: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc7baa010  ! 881: STDFA_I	stda	%f3, [0x0010, %r10]
	.word 0xcdba987f  ! 882: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 883: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 884: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2911f  ! 885: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd09ae020  ! 886: LDDA_I	ldda	[%r11, + 0x0020] %asi, %r8
	.word 0xd1f2a01f  ! 887: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba985f  ! 888: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa020  ! 889: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xc89aa050  ! 890: LDDA_I	ldda	[%r10, + 0x0050] %asi, %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfbad89f  ! 891: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad81f  ! 892: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcdbae020  ! 893: STDFA_I	stda	%f6, [0x0020, %r11]
	.word 0xcbe2a01f  ! 894: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba997f  ! 895: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba997f  ! 896: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 897: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd242801f  ! 898: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xccdad15f  ! 899: LDXA_R	ldxa	[%r11, %r31] 0x8a, %r6
	.word 0xc3bad85f  ! 900: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3bad9bf  ! 901: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d13f  ! 902: CASA_I	casa	[%r11] 0x89, %r31, %r1
	.word 0xc3bad81f  ! 903: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcac2907f  ! 904: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r5
	.word 0xc7ba987f  ! 905: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc4c2a074  ! 906: LDSWA_I	ldswa	[%r10, + 0x0074] %asi, %r2
	.word 0xd3f2a01f  ! 907: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc302a010  ! 908: LDF_I	ld	[%r10, 0x0010], %f1
	.word 0xcbbad91f  ! 909: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d01f  ! 910: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbf2d03f  ! 911: CASXA_I	casxa	[%r11] 0x81, %r31, %r5
	.word 0xcbf2e01f  ! 912: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad83f  ! 913: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xca8ae05f  ! 914: LDUBA_I	lduba	[%r11, + 0x005f] %asi, %r5
	.word 0xd3bad97f  ! 915: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd19aa040  ! 916: LDDFA_I	ldda	[%r10, 0x0040], %f8
	.word 0xc25ac01f  ! 917: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xd1bad97f  ! 918: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad99f  ! 919: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad97f  ! 920: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1f2e01f  ! 921: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad85f  ! 922: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d03f  ! 923: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xd03ac01f  ! 924: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2e01f  ! 925: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1bad97f  ! 926: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd39ae038  ! 927: LDDFA_I	ldda	[%r11, 0x0038], %f9
	.word 0xcdbad87f  ! 928: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 929: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcdbad95f  ! 930: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdbad87f  ! 931: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad89f  ! 932: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad85f  ! 933: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcf9ae070  ! 934: LDDFA_I	ldda	[%r11, 0x0070], %f7
	.word 0xd03aa030  ! 935: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc5ac01f  ! 936: LDX_R	ldx	[%r11 + %r31], %r6
	.word 0xcdba995f  ! 937: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba997f  ! 938: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 939: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 940: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xce92905f  ! 941: LDUHA_R	lduha	[%r10, %r31] 0x82, %r7
	.word 0xc5e2911f  ! 942: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5ba987f  ! 943: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xca92905f  ! 944: LDUHA_R	lduha	[%r10, %r31] 0x82, %r5
	.word 0xd042801f  ! 945: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3ba995f  ! 946: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcf9aa048  ! 947: LDDFA_I	ldda	[%r10, 0x0048], %f7
	.word 0xc5e2d03f  ! 948: CASA_I	casa	[%r11] 0x81, %r31, %r2
	.word 0xc5bad91f  ! 949: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 950: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc79aa070  ! 951: LDDFA_I	ldda	[%r10, 0x0070], %f3
	.word 0xc9f2e01f  ! 952: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xce8a903f  ! 953: LDUBA_R	lduba	[%r10, %r31] 0x81, %r7
	.word 0xd0cae00d  ! 954: LDSBA_I	ldsba	[%r11, + 0x000d] %asi, %r8
	.word 0xcfba995f  ! 955: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc89aa050  ! 956: LDDA_I	ldda	[%r10, + 0x0050] %asi, %r4
	.word 0xcbba99bf  ! 957: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa040  ! 958: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xcbba981f  ! 959: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc60a801f  ! 960: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc03aa040  ! 961: STD_I	std	%r0, [%r10 + 0x0040]
	.word 0xc3e2903f  ! 962: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba99bf  ! 963: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc65a801f  ! 964: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xd05a801f  ! 965: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd01ae058  ! 966: LDD_I	ldd	[%r11 + 0x0058], %r8
	.word 0xcdba981f  ! 967: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba987f  ! 968: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 969: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 970: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xced2d03f  ! 971: LDSHA_R	ldsha	[%r11, %r31] 0x81, %r7
	.word 0xcbba995f  ! 972: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba983f  ! 973: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc40aa022  ! 974: LDUB_I	ldub	[%r10 + 0x0022], %r2
	.word 0xd3ba981f  ! 975: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3e2901f  ! 976: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3f2a01f  ! 977: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03aa058  ! 978: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3f2a01f  ! 979: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 980: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3ba993f  ! 981: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 982: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd3ba99bf  ! 983: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 984: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 985: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcad2915f  ! 986: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r5
	.word 0xc9ba981f  ! 987: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc1aa070  ! 988: LDD_I	ldd	[%r10 + 0x0070], %r6
	.word 0xcde2e01f  ! 989: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xc39aa038  ! 990: LDDFA_I	ldda	[%r10, 0x0038], %f1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc82e004  ! 991: LDUWA_I	lduwa	[%r11, + 0x0004] %asi, %r6
	.word 0xc522801f  ! 992: STF_R	st	%f2, [%r31, %r10]
	.word 0xcd9aa040  ! 993: LDDFA_I	ldda	[%r10, 0x0040], %f6
	.word 0xc502e01c  ! 994: LDF_I	ld	[%r11, 0x001c], %f2
	.word 0xc7f2d03f  ! 995: CASXA_I	casxa	[%r11] 0x81, %r31, %r3
TH_LABEL995:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcf22801f  ! 996: STF_R	st	%f7, [%r31, %r10]
	.word 0xcfbaa010  ! 997: STDFA_I	stda	%f7, [0x0010, %r10]
	.word 0xc9f2901f  ! 998: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2901f  ! 999: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xcf9aa038  ! 1000: LDDFA_I	ldda	[%r10, 0x0038], %f7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	subcc %r30, 1, %r30
	bnz  TH6_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	add	%g0,	0x1,	%r30
TH5_LOOP_START:
	.word 0xc9ba989f  ! 1: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd0da901f  ! 2: LDXA_R	ldxa	[%r10, %r31] 0x80, %r8
	.word 0xd00aa025  ! 3: LDUB_I	ldub	[%r10 + 0x0025], %r8
	.word 0xc89aa000  ! 4: LDDA_I	ldda	[%r10, + 0x0000] %asi, %r4
	.word 0xc5f2d11f  ! 5: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xca4a801f  ! 6: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xcb9aa010  ! 7: LDDFA_I	ldda	[%r10, 0x0010], %f5
	.word 0xcdba995f  ! 8: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2911f  ! 9: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcfbaa040  ! 10: STDFA_I	stda	%f7, [0x0040, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc85aa058  ! 11: LDX_I	ldx	[%r10 + 0x0058], %r4
	.word 0xcff2d01f  ! 12: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad99f  ! 13: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad91f  ! 14: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad93f  ! 15: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc24ac01f  ! 16: LDSB_R	ldsb	[%r11 + %r31], %r1
	.word 0xd0dae048  ! 17: LDXA_I	ldxa	[%r11, + 0x0048] %asi, %r8
	.word 0xc812a07e  ! 18: LDUH_I	lduh	[%r10 + 0x007e], %r4
	.word 0xc7ba991f  ! 19: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 20: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcac2913f  ! 21: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r5
	.word 0xc5f2903f  ! 22: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xc442801f  ! 23: LDSW_R	ldsw	[%r10 + %r31], %r2
	.word 0xd1bad87f  ! 24: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcf02801f  ! 25: LDF_R	ld	[%r10, %r31], %f7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd252a03c  ! 26: LDSH_I	ldsh	[%r10 + 0x003c], %r9
	.word 0xc802a054  ! 27: LDUW_I	lduw	[%r10 + 0x0054], %r4
	.word 0xc5e2a01f  ! 28: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2901f  ! 29: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5e2a01f  ! 30: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5ba991f  ! 31: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc212e03a  ! 32: LDUH_I	lduh	[%r11 + 0x003a], %r1
	.word 0xc7ba989f  ! 33: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 34: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7f2a01f  ! 35: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbbae078  ! 36: STDFA_I	stda	%f5, [0x0078, %r11]
	.word 0xd03aa040  ! 37: STD_I	std	%r8, [%r10 + 0x0040]
	.word 0xd3ba99bf  ! 38: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 39: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc4da907f  ! 40: LDXA_R	ldxa	[%r10, %r31] 0x83, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc292a002  ! 41: LDUHA_I	lduha	[%r10, + 0x0002] %asi, %r1
	.word 0xca8a905f  ! 42: LDUBA_R	lduba	[%r10, %r31] 0x82, %r5
	.word 0xc9f2901f  ! 43: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc642801f  ! 44: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc83ac01f  ! 45: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9e2d13f  ! 46: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc83ae068  ! 47: STD_I	std	%r4, [%r11 + 0x0068]
	.word 0xc9bad93f  ! 48: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 49: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2e01f  ! 50: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc6c2907f  ! 51: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r3
	.word 0xd1ba985f  ! 52: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc482d03f  ! 53: LDUWA_R	lduwa	[%r11, %r31] 0x81, %r2
	.word 0xc602e050  ! 54: LDUW_I	lduw	[%r11 + 0x0050], %r3
	.word 0xd03ac01f  ! 55: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3f2d11f  ! 56: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xcc92913f  ! 57: LDUHA_R	lduha	[%r10, %r31] 0x89, %r6
	.word 0xc9baa010  ! 58: STDFA_I	stda	%f4, [0x0010, %r10]
	.word 0xcfbad8bf  ! 59: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d13f  ! 60: CASXA_I	casxa	[%r11] 0x89, %r31, %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfbad81f  ! 61: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc59aa018  ! 62: LDDFA_I	ldda	[%r10, 0x0018], %f2
	.word 0xc4cad01f  ! 63: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r2
	.word 0xcc3a801f  ! 64: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd19aa010  ! 65: LDDFA_I	ldda	[%r10, 0x0010], %f8
TH_LABEL65:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcdf2a01f  ! 66: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc3a801f  ! 67: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba993f  ! 68: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc6d2a054  ! 69: LDSHA_I	ldsha	[%r10, + 0x0054] %asi, %r3
	.word 0xcf02a078  ! 70: LDF_I	ld	[%r10, 0x0078], %f7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcd02801f  ! 71: LDF_R	ld	[%r10, %r31], %f6
	.word 0xcde2a01f  ! 72: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2911f  ! 73: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xd202801f  ! 74: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xcc3aa000  ! 75: STD_I	std	%r6, [%r10 + 0x0000]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc28ad07f  ! 76: LDUBA_R	lduba	[%r11, %r31] 0x83, %r1
	.word 0xc9bad81f  ! 77: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc522801f  ! 78: STF_R	st	%f2, [%r31, %r10]
	.word 0xccc2a078  ! 79: LDSWA_I	ldswa	[%r10, + 0x0078] %asi, %r6
	.word 0xcbbaa010  ! 80: STDFA_I	stda	%f5, [0x0010, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc8d2d17f  ! 81: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r4
	.word 0xca92911f  ! 82: LDUHA_R	lduha	[%r10, %r31] 0x88, %r5
	.word 0xc9ba99bf  ! 83: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 84: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83aa070  ! 85: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd0daa000  ! 86: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r8
	.word 0xc5bad91f  ! 87: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd252a032  ! 88: LDSH_I	ldsh	[%r10 + 0x0032], %r9
	.word 0xc5ba999f  ! 89: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 90: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5ba98bf  ! 91: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 92: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xce92a01c  ! 93: LDUHA_I	lduha	[%r10, + 0x001c] %asi, %r7
	.word 0xc03aa058  ! 94: STD_I	std	%r0, [%r10 + 0x0058]
	.word 0xd012801f  ! 95: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3ba989f  ! 96: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba99bf  ! 97: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2903f  ! 98: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba991f  ! 99: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc8d2a000  ! 100: LDSHA_I	ldsha	[%r10, + 0x0000] %asi, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc4daa028  ! 101: LDXA_I	ldxa	[%r10, + 0x0028] %asi, %r2
	.word 0xcc3aa060  ! 102: STD_I	std	%r6, [%r10 + 0x0060]
	.word 0xcfbaa000  ! 103: STDFA_I	stda	%f7, [0x0000, %r10]
	.word 0xca52a000  ! 104: LDSH_I	ldsh	[%r10 + 0x0000], %r5
	.word 0xc25a801f  ! 105: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdbaa008  ! 106: STDFA_I	stda	%f6, [0x0008, %r10]
	.word 0xc5ba983f  ! 107: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2901f  ! 108: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xcf9aa020  ! 109: LDDFA_I	ldda	[%r10, 0x0020], %f7
	.word 0xc5ba99bf  ! 110: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc43a801f  ! 111: STD_R	std	%r2, [%r10 + %r31]
	.word 0xcb02a068  ! 112: LDF_I	ld	[%r10, 0x0068], %f5
	.word 0xca02801f  ! 113: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xcbf2a01f  ! 114: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba981f  ! 115: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd102801f  ! 116: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc3e2e01f  ! 117: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d01f  ! 118: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3e2e01f  ! 119: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3e2d01f  ! 120: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3f2d11f  ! 121: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xc3f2e01f  ! 122: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad81f  ! 123: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc7baa050  ! 124: STDFA_I	stda	%f3, [0x0050, %r10]
	.word 0xcbba981f  ! 125: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba999f  ! 126: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba997f  ! 127: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba99bf  ! 128: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xccd2a052  ! 129: LDSHA_I	ldsha	[%r10, + 0x0052] %asi, %r6
	.word 0xcdbad87f  ! 130: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcc3ae060  ! 131: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xc28a917f  ! 132: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r1
	.word 0xd1ba991f  ! 133: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2911f  ! 134: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xd1e2a01f  ! 135: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd03aa060  ! 136: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd1e2a01f  ! 137: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd292911f  ! 138: LDUHA_R	lduha	[%r10, %r31] 0x88, %r9
	.word 0xcdbaa038  ! 139: STDFA_I	stda	%f6, [0x0038, %r10]
	.word 0xcc92915f  ! 140: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r6
TH_LABEL140:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xce42a06c  ! 141: LDSW_I	ldsw	[%r10 + 0x006c], %r7
	.word 0xcfbad87f  ! 142: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcec2907f  ! 143: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r7
	.word 0xc3ba983f  ! 144: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 145: CASXA_R	casxa	[%r10]%asi, %r31, %r1
TH_LABEL145:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3ba987f  ! 146: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcf02801f  ! 147: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc9bad81f  ! 148: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad95f  ! 149: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc84aa04e  ! 150: LDSB_I	ldsb	[%r10 + 0x004e], %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc812a032  ! 151: LDUH_I	lduh	[%r10 + 0x0032], %r4
	.word 0xcc3aa060  ! 152: STD_I	std	%r6, [%r10 + 0x0060]
	.word 0xccca901f  ! 153: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r6
	.word 0xcbf2e01f  ! 154: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbf2d03f  ! 155: CASXA_I	casxa	[%r11] 0x81, %r31, %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc8ad07f  ! 156: LDUBA_R	lduba	[%r11, %r31] 0x83, %r6
	.word 0xce5aa038  ! 157: LDX_I	ldx	[%r10 + 0x0038], %r7
	.word 0xc9f2e01f  ! 158: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 159: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc68a911f  ! 160: LDUBA_R	lduba	[%r10, %r31] 0x88, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbbae000  ! 161: STDFA_I	stda	%f5, [0x0000, %r11]
	.word 0xca92d01f  ! 162: LDUHA_R	lduha	[%r11, %r31] 0x80, %r5
	.word 0xcbba997f  ! 163: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba991f  ! 164: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2901f  ! 165: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbf2a01f  ! 166: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcec2d05f  ! 167: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r7
	.word 0xcbf2e01f  ! 168: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcc8aa07e  ! 169: LDUBA_I	lduba	[%r10, + 0x007e] %asi, %r6
	.word 0xc5ba981f  ! 170: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL170:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc43aa078  ! 171: STD_I	std	%r2, [%r10 + 0x0078]
	.word 0xc39ae028  ! 172: LDDFA_I	ldda	[%r11, 0x0028], %f1
	.word 0xcc5aa008  ! 173: LDX_I	ldx	[%r10 + 0x0008], %r6
	.word 0xd3f2e01f  ! 174: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2e01f  ! 175: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3f2d01f  ! 176: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd3bad8bf  ! 177: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc2c2d03f  ! 178: LDSWA_R	ldswa	[%r11, %r31] 0x81, %r1
	.word 0xc3ba993f  ! 179: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd04aa068  ! 180: LDSB_I	ldsb	[%r10 + 0x0068], %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3e2913f  ! 181: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd3f2a01f  ! 182: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba997f  ! 183: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 184: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc402a018  ! 185: LDUW_I	lduw	[%r10 + 0x0018], %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc43aa048  ! 186: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc5e2a01f  ! 187: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcd02a044  ! 188: LDF_I	ld	[%r10, 0x0044], %f6
	.word 0xce02c01f  ! 189: LDUW_R	lduw	[%r11 + %r31], %r7
	.word 0xc652c01f  ! 190: LDSH_R	ldsh	[%r11 + %r31], %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd19aa008  ! 191: LDDFA_I	ldda	[%r10, 0x0008], %f8
	.word 0xc84a801f  ! 192: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xcbba993f  ! 193: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 194: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbf2a01f  ! 195: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbf2901f  ! 196: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcf22801f  ! 197: STF_R	st	%f7, [%r31, %r10]
	.word 0xc20a801f  ! 198: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xcb9ae010  ! 199: LDDFA_I	ldda	[%r11, 0x0010], %f5
	.word 0xd1ba983f  ! 200: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc79ae050  ! 201: LDDFA_I	ldda	[%r11, 0x0050], %f3
	.word 0xc502801f  ! 202: LDF_R	ld	[%r10, %r31], %f2
	.word 0xca5ac01f  ! 203: LDX_R	ldx	[%r11 + %r31], %r5
	.word 0xcfba995f  ! 204: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcf22801f  ! 205: STF_R	st	%f7, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc7ba98bf  ! 206: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc3baa040  ! 207: STDFA_I	stda	%f1, [0x0040, %r10]
	.word 0xc882a030  ! 208: LDUWA_I	lduwa	[%r10, + 0x0030] %asi, %r4
	.word 0xcdf2a01f  ! 209: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba997f  ! 210: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd39aa048  ! 211: LDDFA_I	ldda	[%r10, 0x0048], %f9
	.word 0xc03ac01f  ! 212: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc442a040  ! 213: LDSW_I	ldsw	[%r10 + 0x0040], %r2
	.word 0xc5baa000  ! 214: STDFA_I	stda	%f2, [0x0000, %r10]
	.word 0xc83aa048  ! 215: STD_I	std	%r4, [%r10 + 0x0048]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd092917f  ! 216: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r8
	.word 0xca92e03c  ! 217: LDUHA_I	lduha	[%r11, + 0x003c] %asi, %r5
	.word 0xc842c01f  ! 218: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xcf9aa038  ! 219: LDDFA_I	ldda	[%r10, 0x0038], %f7
	.word 0xce42e078  ! 220: LDSW_I	ldsw	[%r11 + 0x0078], %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xccca901f  ! 221: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r6
	.word 0xcde2913f  ! 222: CASA_I	casa	[%r10] 0x89, %r31, %r6
	.word 0xd1baa058  ! 223: STDFA_I	stda	%f8, [0x0058, %r10]
	.word 0xd302c01f  ! 224: LDF_R	ld	[%r11, %r31], %f9
	.word 0xd01a801f  ! 225: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd03ac01f  ! 226: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad8bf  ! 227: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 228: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad93f  ! 229: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad9bf  ! 230: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3bad81f  ! 231: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad89f  ! 232: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 233: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad91f  ! 234: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc602a050  ! 235: LDUW_I	lduw	[%r10 + 0x0050], %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1ba981f  ! 236: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 237: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xca42e044  ! 238: LDSW_I	ldsw	[%r11 + 0x0044], %r5
	.word 0xc7e2901f  ! 239: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba995f  ! 240: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc81aa010  ! 241: LDD_I	ldd	[%r10 + 0x0010], %r4
	.word 0xca8a911f  ! 242: LDUBA_R	lduba	[%r10, %r31] 0x88, %r5
	.word 0xd302a018  ! 243: LDF_I	ld	[%r10, 0x0018], %f9
	.word 0xd3bad81f  ! 244: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad91f  ! 245: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc0a801f  ! 246: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xce8ae03d  ! 247: LDUBA_I	lduba	[%r11, + 0x003d] %asi, %r7
	.word 0xc9baa040  ! 248: STDFA_I	stda	%f4, [0x0040, %r10]
	.word 0xcd02801f  ! 249: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc5e2a01f  ! 250: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc412c01f  ! 251: LDUH_R	lduh	[%r11 + %r31], %r2
	.word 0xd0c2917f  ! 252: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r8
	.word 0xd1ba993f  ! 253: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2913f  ! 254: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xd1e2901f  ! 255: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc8ad15f  ! 256: LDUBA_R	lduba	[%r11, %r31] 0x8a, %r6
	.word 0xc3f2d03f  ! 257: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xc3bad95f  ! 258: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad91f  ! 259: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 260: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc2d2e032  ! 261: LDSHA_I	ldsha	[%r11, + 0x0032] %asi, %r1
	.word 0xc4c2e010  ! 262: LDSWA_I	ldswa	[%r11, + 0x0010] %asi, %r2
	.word 0xce0a801f  ! 263: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xd3f2a01f  ! 264: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2913f  ! 265: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3ba997f  ! 266: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc41ac01f  ! 267: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xc28ae007  ! 268: LDUBA_I	lduba	[%r11, + 0x0007] %asi, %r1
	.word 0xc79aa048  ! 269: LDDFA_I	ldda	[%r10, 0x0048], %f3
	.word 0xc612e050  ! 270: LDUH_I	lduh	[%r11 + 0x0050], %r3
TH_LABEL270:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc642801f  ! 271: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xd2d2a000  ! 272: LDSHA_I	ldsha	[%r10, + 0x0000] %asi, %r9
	.word 0xc3f2d01f  ! 273: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad91f  ! 274: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad81f  ! 275: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9baa028  ! 276: STDFA_I	stda	%f4, [0x0028, %r10]
	.word 0xcd22c01f  ! 277: STF_R	st	%f6, [%r31, %r11]
	.word 0xcf9aa048  ! 278: LDDFA_I	ldda	[%r10, 0x0048], %f7
	.word 0xd0da901f  ! 279: LDXA_R	ldxa	[%r10, %r31] 0x80, %r8
	.word 0xcdba99bf  ! 280: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL280:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdf2901f  ! 281: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdf2901f  ! 282: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdf2901f  ! 283: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xc282a054  ! 284: LDUWA_I	lduwa	[%r10, + 0x0054] %asi, %r1
	.word 0xc9ba995f  ! 285: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc9e2a01f  ! 286: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83aa008  ! 287: STD_I	std	%r4, [%r10 + 0x0008]
	.word 0xc9ba993f  ! 288: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 289: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xca42c01f  ! 290: LDSW_R	ldsw	[%r11 + %r31], %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd03a801f  ! 291: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1e2a01f  ! 292: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xced2a064  ! 293: LDSHA_I	ldsha	[%r10, + 0x0064] %asi, %r7
	.word 0xc7f2e01f  ! 294: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad83f  ! 295: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7bad85f  ! 296: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae028  ! 297: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc7bad8bf  ! 298: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcad2d03f  ! 299: LDSHA_R	ldsha	[%r11, %r31] 0x81, %r5
	.word 0xd03a801f  ! 300: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1ba985f  ! 301: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcc82e004  ! 302: LDUWA_I	lduwa	[%r11, + 0x0004] %asi, %r6
	.word 0xd3e2a01f  ! 303: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 304: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba987f  ! 305: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL305:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9baa040  ! 306: STDFA_I	stda	%f4, [0x0040, %r10]
	.word 0xd3baa038  ! 307: STDFA_I	stda	%f9, [0x0038, %r10]
	.word 0xcc3ac01f  ! 308: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcdf2d01f  ! 309: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad83f  ! 310: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc39aa038  ! 311: LDDFA_I	ldda	[%r10, 0x0038], %f1
	.word 0xcfba999f  ! 312: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc68a903f  ! 313: LDUBA_R	lduba	[%r10, %r31] 0x81, %r3
	.word 0xcc5a801f  ! 314: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xcc3aa078  ! 315: STD_I	std	%r6, [%r10 + 0x0078]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc4dae028  ! 316: LDXA_I	ldxa	[%r11, + 0x0028] %asi, %r2
	.word 0xce52801f  ! 317: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xc83aa078  ! 318: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xcbe2903f  ! 319: CASA_I	casa	[%r10] 0x81, %r31, %r5
	.word 0xc442a020  ! 320: LDSW_I	ldsw	[%r10 + 0x0020], %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc2dae060  ! 321: LDXA_I	ldxa	[%r11, + 0x0060] %asi, %r1
	.word 0xd3f2911f  ! 322: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd3ba995f  ! 323: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 324: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xcf02a064  ! 325: LDF_I	ld	[%r10, 0x0064], %f7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdbad8bf  ! 326: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xce8aa020  ! 327: LDUBA_I	lduba	[%r10, + 0x0020] %asi, %r7
	.word 0xc03ae030  ! 328: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xc3e2e01f  ! 329: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d03f  ! 330: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc03ae030  ! 331: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xc3f2e01f  ! 332: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad85f  ! 333: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd282a078  ! 334: LDUWA_I	lduwa	[%r10, + 0x0078] %asi, %r9
	.word 0xcfe2a01f  ! 335: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfe2a01f  ! 336: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd1baa068  ! 337: STDFA_I	stda	%f8, [0x0068, %r10]
	.word 0xcdf2a01f  ! 338: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc882907f  ! 339: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r4
	.word 0xc5e2d01f  ! 340: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc0a801f  ! 341: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xcdba987f  ! 342: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc802c01f  ! 343: LDUW_R	lduw	[%r11 + %r31], %r4
	.word 0xcc1ae070  ! 344: LDD_I	ldd	[%r11 + 0x0070], %r6
	.word 0xc9ba987f  ! 345: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9ba987f  ! 346: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xce82e058  ! 347: LDUWA_I	lduwa	[%r11, + 0x0058] %asi, %r7
	.word 0xc7ba993f  ! 348: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 349: STD_R	std	%r2, [%r10 + %r31]
	.word 0xceca915f  ! 350: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r7
TH_LABEL350:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd042801f  ! 351: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xca8ad13f  ! 352: LDUBA_R	lduba	[%r11, %r31] 0x89, %r5
	.word 0xc682e028  ! 353: LDUWA_I	lduwa	[%r11, + 0x0028] %asi, %r3
	.word 0xc85a801f  ! 354: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xcdba983f  ! 355: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdba993f  ! 356: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 357: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcde2913f  ! 358: CASA_I	casa	[%r10] 0x89, %r31, %r6
	.word 0xcde2a01f  ! 359: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcd02e028  ! 360: LDF_I	ld	[%r11, 0x0028], %f6
TH_LABEL360:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3e2a01f  ! 361: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3e2901f  ! 362: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba991f  ! 363: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 364: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xce5a801f  ! 365: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7ba999f  ! 366: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa010  ! 367: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xd24a801f  ! 368: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xcfe2911f  ! 369: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcfe2a01f  ! 370: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcff2a01f  ! 371: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcc3aa010  ! 372: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xd0d2a05c  ! 373: LDSHA_I	ldsha	[%r10, + 0x005c] %asi, %r8
	.word 0xc3e2a01f  ! 374: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba989f  ! 375: STDFA_R	stda	%f1, [%r31, %r10]
TH_LABEL375:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcccaa07b  ! 376: LDSBA_I	ldsba	[%r10, + 0x007b] %asi, %r6
	.word 0xcbba987f  ! 377: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba99bf  ! 378: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba991f  ! 379: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2913f  ! 380: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc642e05c  ! 381: LDSW_I	ldsw	[%r11 + 0x005c], %r3
	.word 0xcfe2a01f  ! 382: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcc3aa038  ! 383: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcfe2903f  ! 384: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcfba99bf  ! 385: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfba987f  ! 386: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcb02e058  ! 387: LDF_I	ld	[%r11, 0x0058], %f5
	.word 0xc43a801f  ! 388: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc2cae030  ! 389: LDSBA_I	ldsba	[%r11, + 0x0030] %asi, %r1
	.word 0xc702c01f  ! 390: LDF_R	ld	[%r11, %r31], %f3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1baa058  ! 391: STDFA_I	stda	%f8, [0x0058, %r10]
	.word 0xcdba989f  ! 392: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc02801f  ! 393: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xcfba999f  ! 394: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba99bf  ! 395: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfba981f  ! 396: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 397: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xc692d03f  ! 398: LDUHA_R	lduha	[%r11, %r31] 0x81, %r3
	.word 0xc48a905f  ! 399: LDUBA_R	lduba	[%r10, %r31] 0x82, %r2
	.word 0xca12a06c  ! 400: LDUH_I	lduh	[%r10 + 0x006c], %r5
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcde2901f  ! 401: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xcc3a801f  ! 402: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba991f  ! 403: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc01aa068  ! 404: LDD_I	ldd	[%r10 + 0x0068], %r0
	.word 0xd2caa04c  ! 405: LDSBA_I	ldsba	[%r10, + 0x004c] %asi, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd19aa028  ! 406: LDDFA_I	ldda	[%r10, 0x0028], %f8
	.word 0xcdf2a01f  ! 407: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba981f  ! 408: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc8caa054  ! 409: LDSBA_I	ldsba	[%r10, + 0x0054] %asi, %r4
	.word 0xd3ba997f  ! 410: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL410:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdbae000  ! 411: STDFA_I	stda	%f6, [0x0000, %r11]
	.word 0xc88ae075  ! 412: LDUBA_I	lduba	[%r11, + 0x0075] %asi, %r4
	.word 0xd102e04c  ! 413: LDF_I	ld	[%r11, 0x004c], %f8
	.word 0xcff2e01f  ! 414: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xca8ae05e  ! 415: LDUBA_I	lduba	[%r11, + 0x005e] %asi, %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc03ae000  ! 416: STD_I	std	%r0, [%r11 + 0x0000]
	.word 0xcdbae070  ! 417: STDFA_I	stda	%f6, [0x0070, %r11]
	.word 0xd3e2a01f  ! 418: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 419: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3e2a01f  ! 420: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3ba993f  ! 421: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc2da911f  ! 422: LDXA_R	ldxa	[%r10, %r31] 0x88, %r1
	.word 0xd1e2901f  ! 423: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc89aa058  ! 424: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r4
	.word 0xc83ac01f  ! 425: STD_R	std	%r4, [%r11 + %r31]
TH_LABEL425:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbbad81f  ! 426: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd39aa078  ! 427: LDDFA_I	ldda	[%r10, 0x0078], %f9
	.word 0xc522c01f  ! 428: STF_R	st	%f2, [%r31, %r11]
	.word 0xd3bad93f  ! 429: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc5baa058  ! 430: STDFA_I	stda	%f2, [0x0058, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd302a050  ! 431: LDF_I	ld	[%r10, 0x0050], %f9
	.word 0xd09ae028  ! 432: LDDA_I	ldda	[%r11, + 0x0028] %asi, %r8
	.word 0xc3bad99f  ! 433: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d01f  ! 434: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc03ac01f  ! 435: STD_R	std	%r0, [%r11 + %r31]
TH_LABEL435:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3bad97f  ! 436: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad85f  ! 437: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 438: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d03f  ! 439: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xc03ac01f  ! 440: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3f2d11f  ! 441: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xd28ad01f  ! 442: LDUBA_R	lduba	[%r11, %r31] 0x80, %r9
	.word 0xc502e00c  ! 443: LDF_I	ld	[%r11, 0x000c], %f2
	.word 0xc5f2d01f  ! 444: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc5bad83f  ! 445: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5bad93f  ! 446: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc3bae048  ! 447: STDFA_I	stda	%f1, [0x0048, %r11]
	.word 0xd1ba983f  ! 448: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2903f  ! 449: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xd1f2a01f  ! 450: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd322801f  ! 451: STF_R	st	%f9, [%r31, %r10]
	.word 0xd3ba997f  ! 452: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcc0a801f  ! 453: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xc202a050  ! 454: LDUW_I	lduw	[%r10 + 0x0050], %r1
	.word 0xd3ba997f  ! 455: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc4a801f  ! 456: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xc83a801f  ! 457: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbf2a01f  ! 458: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2903f  ! 459: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xc59aa028  ! 460: LDDFA_I	ldda	[%r10, 0x0028], %f2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7e2a01f  ! 461: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc43a801f  ! 462: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7f2913f  ! 463: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba981f  ! 464: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 465: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7ba99bf  ! 466: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc6c2a008  ! 467: LDSWA_I	ldswa	[%r10, + 0x0008] %asi, %r3
	.word 0xce4ae030  ! 468: LDSB_I	ldsb	[%r11 + 0x0030], %r7
	.word 0xd39ae038  ! 469: LDDFA_I	ldda	[%r11, 0x0038], %f9
	.word 0xca8ae054  ! 470: LDUBA_I	lduba	[%r11, + 0x0054] %asi, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcccaa073  ! 471: LDSBA_I	ldsba	[%r10, + 0x0073] %asi, %r6
	.word 0xc5ba999f  ! 472: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd102c01f  ! 473: LDF_R	ld	[%r11, %r31], %f8
	.word 0xc7f2903f  ! 474: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc7f2a01f  ! 475: CASXA_R	casxa	[%r10]%asi, %r31, %r3
TH_LABEL475:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7ba999f  ! 476: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 477: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc6c2d03f  ! 478: LDSWA_R	ldswa	[%r11, %r31] 0x81, %r3
	.word 0xc3ba981f  ! 479: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd2dad07f  ! 480: LDXA_R	ldxa	[%r11, %r31] 0x83, %r9
TH_LABEL480:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbbad93f  ! 481: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd1bae048  ! 482: STDFA_I	stda	%f8, [0x0048, %r11]
	.word 0xc3ba997f  ! 483: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 484: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc03aa008  ! 485: STD_I	std	%r0, [%r10 + 0x0008]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd102a074  ! 486: LDF_I	ld	[%r10, 0x0074], %f8
	.word 0xc7bad85f  ! 487: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad89f  ! 488: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae078  ! 489: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xc812a078  ! 490: LDUH_I	lduh	[%r10 + 0x0078], %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc3ae030  ! 491: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcdbad9bf  ! 492: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad81f  ! 493: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2d01f  ! 494: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad89f  ! 495: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xce8a911f  ! 496: LDUBA_R	lduba	[%r10, %r31] 0x88, %r7
	.word 0xc7ba981f  ! 497: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2903f  ! 498: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xd01a801f  ! 499: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xcfba981f  ! 500: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfba981f  ! 501: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 502: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2913f  ! 503: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xcff2a01f  ! 504: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc49ae020  ! 505: LDDA_I	ldda	[%r11, + 0x0020] %asi, %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1ba981f  ! 506: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa000  ! 507: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd1ba999f  ! 508: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcd02c01f  ! 509: LDF_R	ld	[%r11, %r31], %f6
	.word 0xc03a801f  ! 510: STD_R	std	%r0, [%r10 + %r31]
TH_LABEL510:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd322801f  ! 511: STF_R	st	%f9, [%r31, %r10]
	.word 0xcbba983f  ! 512: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 513: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcf02801f  ! 514: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc39aa070  ! 515: LDDFA_I	ldda	[%r10, 0x0070], %f1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd2d2d17f  ! 516: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r9
	.word 0xcb9ae070  ! 517: LDDFA_I	ldda	[%r11, 0x0070], %f5
	.word 0xd102801f  ! 518: LDF_R	ld	[%r10, %r31], %f8
	.word 0xd3baa070  ! 519: STDFA_I	stda	%f9, [0x0070, %r10]
	.word 0xcff2a01f  ! 520: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfe2901f  ! 521: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcfba999f  ! 522: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 523: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 524: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc65ac01f  ! 525: LDX_R	ldx	[%r11 + %r31], %r3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1ba991f  ! 526: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 527: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba997f  ! 528: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 529: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba99bf  ! 530: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1e2a01f  ! 531: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 532: STD_R	std	%r8, [%r10 + %r31]
	.word 0xce8aa036  ! 533: LDUBA_I	lduba	[%r10, + 0x0036] %asi, %r7
	.word 0xcc52a070  ! 534: LDSH_I	ldsh	[%r10 + 0x0070], %r6
	.word 0xcfba997f  ! 535: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL535:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfe2a01f  ! 536: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2901f  ! 537: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcc3a801f  ! 538: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba993f  ! 539: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba999f  ! 540: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbbaa038  ! 541: STDFA_I	stda	%f5, [0x0038, %r10]
	.word 0xcbba98bf  ! 542: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 543: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba983f  ! 544: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba995f  ! 545: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbba989f  ! 546: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba999f  ! 547: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba99bf  ! 548: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcedae070  ! 549: LDXA_I	ldxa	[%r11, + 0x0070] %asi, %r7
	.word 0xc9bae070  ! 550: STDFA_I	stda	%f4, [0x0070, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbf2901f  ! 551: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xc83aa038  ! 552: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xcbf2a01f  ! 553: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcadaa038  ! 554: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r5
	.word 0xc5ba993f  ! 555: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5e2901f  ! 556: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba981f  ! 557: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 558: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 559: STD_R	std	%r2, [%r10 + %r31]
	.word 0xcb02e068  ! 560: LDF_I	ld	[%r11, 0x0068], %f5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7ba991f  ! 561: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc252801f  ! 562: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xd28ae014  ! 563: LDUBA_I	lduba	[%r11, + 0x0014] %asi, %r9
	.word 0xc60a801f  ! 564: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xc7ba997f  ! 565: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd012801f  ! 566: LDUH_R	lduh	[%r10 + %r31], %r8
	.word 0xc43aa058  ! 567: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc7ba98bf  ! 568: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 569: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xca12a064  ! 570: LDUH_I	lduh	[%r10 + 0x0064], %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1f2d03f  ! 571: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xd1f2d11f  ! 572: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xd1e2e01f  ! 573: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd19aa048  ! 574: LDDFA_I	ldda	[%r10, 0x0048], %f8
	.word 0xc81aa038  ! 575: LDD_I	ldd	[%r10 + 0x0038], %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd03aa040  ! 576: STD_I	std	%r8, [%r10 + 0x0040]
	.word 0xd3ba991f  ! 577: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 578: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba997f  ! 579: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc282905f  ! 580: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5ba993f  ! 581: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 582: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 583: STD_R	std	%r2, [%r10 + %r31]
	.word 0xca5ac01f  ! 584: LDX_R	ldx	[%r11 + %r31], %r5
	.word 0xd1bae068  ! 585: STDFA_I	stda	%f8, [0x0068, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5f2901f  ! 586: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba991f  ! 587: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2903f  ! 588: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xca02e028  ! 589: LDUW_I	lduw	[%r11 + 0x0028], %r5
	.word 0xcbba987f  ! 590: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd092917f  ! 591: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r8
	.word 0xc9bad83f  ! 592: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9f2e01f  ! 593: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc4ca903f  ! 594: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r2
	.word 0xcf02801f  ! 595: LDF_R	ld	[%r10, %r31], %f7
TH_LABEL595:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xce12e026  ! 596: LDUH_I	lduh	[%r11 + 0x0026], %r7
	.word 0xd3bad83f  ! 597: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad87f  ! 598: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad99f  ! 599: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcc5ae040  ! 600: LDX_I	ldx	[%r11 + 0x0040], %r6
TH_LABEL600:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5bad95f  ! 601: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc40aa026  ! 602: LDUB_I	ldub	[%r10 + 0x0026], %r2
	.word 0xcbbad91f  ! 603: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xceda901f  ! 604: LDXA_R	ldxa	[%r10, %r31] 0x80, %r7
	.word 0xcc4ac01f  ! 605: LDSB_R	ldsb	[%r11 + %r31], %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3baa068  ! 606: STDFA_I	stda	%f1, [0x0068, %r10]
	.word 0xc7bad85f  ! 607: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xca02801f  ! 608: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xce8ae03a  ! 609: LDUBA_I	lduba	[%r11, + 0x003a] %asi, %r7
	.word 0xc412e072  ! 610: LDUH_I	lduh	[%r11 + 0x0072], %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc83ae020  ! 611: STD_I	std	%r4, [%r11 + 0x0020]
	.word 0xc9bad93f  ! 612: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc41aa038  ! 613: LDD_I	ldd	[%r10 + 0x0038], %r2
	.word 0xcdbad95f  ! 614: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xca02e078  ! 615: LDUW_I	lduw	[%r11 + 0x0078], %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3f2d01f  ! 616: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xce0aa057  ! 617: LDUB_I	ldub	[%r10 + 0x0057], %r7
	.word 0xcaca903f  ! 618: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r5
	.word 0xced2903f  ! 619: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r7
	.word 0xc302801f  ! 620: LDF_R	ld	[%r10, %r31], %f1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc83ae070  ! 621: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xc45a801f  ! 622: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xd3bad83f  ! 623: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 624: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc302c01f  ! 625: LDF_R	ld	[%r11, %r31], %f1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc83a801f  ! 626: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd04ae030  ! 627: LDSB_I	ldsb	[%r11 + 0x0030], %r8
	.word 0xc3ba995f  ! 628: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 629: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 630: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xca12a06c  ! 631: LDUH_I	lduh	[%r10 + 0x006c], %r5
	.word 0xc9bad8bf  ! 632: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xca42801f  ! 633: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xc892a01a  ! 634: LDUHA_I	lduha	[%r10, + 0x001a] %asi, %r4
	.word 0xcdf2e01f  ! 635: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xced2e040  ! 636: LDSHA_I	ldsha	[%r11, + 0x0040] %asi, %r7
	.word 0xcff2903f  ! 637: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcff2901f  ! 638: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcfe2903f  ! 639: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xc602801f  ! 640: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfba993f  ! 641: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc49aa000  ! 642: LDDA_I	ldda	[%r10, + 0x0000] %asi, %r2
	.word 0xcf02c01f  ! 643: LDF_R	ld	[%r11, %r31], %f7
	.word 0xcf02e050  ! 644: LDF_I	ld	[%r11, 0x0050], %f7
	.word 0xc842801f  ! 645: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc44a801f  ! 646: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xccca905f  ! 647: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r6
	.word 0xc9ba995f  ! 648: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba989f  ! 649: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 650: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9f2a01f  ! 651: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc83aa010  ! 652: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xc9e2901f  ! 653: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xcacaa021  ! 654: LDSBA_I	ldsba	[%r10, + 0x0021] %asi, %r5
	.word 0xc2d2a072  ! 655: LDSHA_I	ldsha	[%r10, + 0x0072] %asi, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9ba98bf  ! 656: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc6daa028  ! 657: LDXA_I	ldxa	[%r10, + 0x0028] %asi, %r3
	.word 0xc5e2901f  ! 658: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc44aa077  ! 659: LDSB_I	ldsb	[%r10 + 0x0077], %r2
	.word 0xcc3ae030  ! 660: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfbad95f  ! 661: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcdbaa000  ! 662: STDFA_I	stda	%f6, [0x0000, %r10]
	.word 0xd1e2e01f  ! 663: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xcf02a05c  ! 664: LDF_I	ld	[%r10, 0x005c], %f7
	.word 0xc3ba987f  ! 665: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3ba997f  ! 666: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 667: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc292907f  ! 668: LDUHA_R	lduha	[%r10, %r31] 0x83, %r1
	.word 0xd2c2915f  ! 669: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r9
	.word 0xc242801f  ! 670: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd03ac01f  ! 671: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad8bf  ! 672: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcfbaa000  ! 673: STDFA_I	stda	%f7, [0x0000, %r10]
	.word 0xc5ba983f  ! 674: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa038  ! 675: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc45aa058  ! 676: LDX_I	ldx	[%r10 + 0x0058], %r2
	.word 0xc702e038  ! 677: LDF_I	ld	[%r11, 0x0038], %f3
	.word 0xc9e2e01f  ! 678: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad81f  ! 679: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad91f  ! 680: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9bad93f  ! 681: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d01f  ! 682: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc83ae060  ! 683: STD_I	std	%r4, [%r11 + 0x0060]
	.word 0xc28aa03b  ! 684: LDUBA_I	lduba	[%r10, + 0x003b] %asi, %r1
	.word 0xc2dae030  ! 685: LDXA_I	ldxa	[%r11, + 0x0030] %asi, %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcff2e01f  ! 686: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcfbad81f  ! 687: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d13f  ! 688: CASXA_I	casxa	[%r11] 0x89, %r31, %r7
	.word 0xc80a801f  ! 689: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xd1ba981f  ! 690: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc85aa020  ! 691: LDX_I	ldx	[%r10 + 0x0020], %r4
	.word 0xccc2a00c  ! 692: LDSWA_I	ldswa	[%r10, + 0x000c] %asi, %r6
	.word 0xc43ae028  ! 693: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc43ac01f  ! 694: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7bad99f  ! 695: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc40a801f  ! 696: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xc7e2a01f  ! 697: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba985f  ! 698: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd252e014  ! 699: LDSH_I	ldsh	[%r11 + 0x0014], %r9
	.word 0xc3f2a01f  ! 700: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3ba989f  ! 701: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 702: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3f2a01f  ! 703: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba987f  ! 704: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba98bf  ! 705: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3ba983f  ! 706: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba987f  ! 707: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc6daa028  ! 708: LDXA_I	ldxa	[%r10, + 0x0028] %asi, %r3
	.word 0xca02801f  ! 709: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xc242e050  ! 710: LDSW_I	ldsw	[%r11 + 0x0050], %r1
TH_LABEL710:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3e2a01f  ! 711: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3e2a01f  ! 712: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba99bf  ! 713: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2901f  ! 714: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd03a801f  ! 715: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3f2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd292d07f  ! 717: LDUHA_R	lduha	[%r11, %r31] 0x83, %r9
	.word 0xcd9ae048  ! 718: LDDFA_I	ldda	[%r11, 0x0048], %f6
	.word 0xcb02a040  ! 719: LDF_I	ld	[%r10, 0x0040], %f5
	.word 0xd3e2d11f  ! 720: CASA_I	casa	[%r11] 0x88, %r31, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7bae060  ! 721: STDFA_I	stda	%f3, [0x0060, %r11]
	.word 0xd3ba989f  ! 722: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 723: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 724: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 725: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3ba98bf  ! 726: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcf9aa018  ! 727: LDDFA_I	ldda	[%r10, 0x0018], %f7
	.word 0xc522801f  ! 728: STF_R	st	%f2, [%r31, %r10]
	.word 0xd3e2e01f  ! 729: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3f2d13f  ! 730: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xce8a913f  ! 731: LDUBA_R	lduba	[%r10, %r31] 0x89, %r7
	.word 0xc5e2913f  ! 732: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5ba989f  ! 733: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 734: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba993f  ! 735: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc52a03c  ! 736: LDSH_I	ldsh	[%r10 + 0x003c], %r6
	.word 0xc3ba989f  ! 737: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xca4a801f  ! 738: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xc7f2a01f  ! 739: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7f2901f  ! 740: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xce4aa03b  ! 741: LDSB_I	ldsb	[%r10 + 0x003b], %r7
	.word 0xcfe2a01f  ! 742: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba99bf  ! 743: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 744: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc812e072  ! 745: LDUH_I	lduh	[%r11 + 0x0072], %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc28a905f  ! 746: LDUBA_R	lduba	[%r10, %r31] 0x82, %r1
	.word 0xc8dae020  ! 747: LDXA_I	ldxa	[%r11, + 0x0020] %asi, %r4
	.word 0xd002801f  ! 748: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xc612801f  ! 749: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xc49ae030  ! 750: LDDA_I	ldda	[%r11, + 0x0030] %asi, %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc82a034  ! 751: LDUWA_I	lduwa	[%r10, + 0x0034] %asi, %r6
	.word 0xc5e2e01f  ! 752: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad89f  ! 753: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad97f  ! 754: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xca4ae060  ! 755: LDSB_I	ldsb	[%r11 + 0x0060], %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfba987f  ! 756: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd20a801f  ! 757: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xc9e2d01f  ! 758: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9f2d03f  ! 759: CASXA_I	casxa	[%r11] 0x81, %r31, %r4
	.word 0xcc9aa070  ! 760: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r6
TH_LABEL760:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc302e01c  ! 761: LDF_I	ld	[%r11, 0x001c], %f1
	.word 0xc9ba981f  ! 762: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xce0aa003  ! 763: LDUB_I	ldub	[%r10 + 0x0003], %r7
	.word 0xd302a07c  ! 764: LDF_I	ld	[%r10, 0x007c], %f9
	.word 0xc9ba98bf  ! 765: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc83a801f  ! 766: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba991f  ! 767: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 768: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba985f  ! 769: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc482a000  ! 771: LDUWA_I	lduwa	[%r10, + 0x0000] %asi, %r2
	.word 0xcb02c01f  ! 772: LDF_R	ld	[%r11, %r31], %f5
	.word 0xcfba98bf  ! 773: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc88aa009  ! 774: LDUBA_I	lduba	[%r10, + 0x0009] %asi, %r4
	.word 0xd01ae068  ! 775: LDD_I	ldd	[%r11 + 0x0068], %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1f2d01f  ! 776: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xca12801f  ! 777: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xc7f2913f  ! 778: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba987f  ! 779: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd09ae050  ! 780: LDDA_I	ldda	[%r11, + 0x0050] %asi, %r8
TH_LABEL780:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd252801f  ! 781: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xcbba981f  ! 782: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba989f  ! 783: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc48aa03e  ! 784: LDUBA_I	lduba	[%r10, + 0x003e] %asi, %r2
	.word 0xc28a901f  ! 785: LDUBA_R	lduba	[%r10, %r31] 0x80, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3e2a01f  ! 786: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 787: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc302a078  ! 788: LDF_I	ld	[%r10, 0x0078], %f1
	.word 0xc88aa036  ! 789: LDUBA_I	lduba	[%r10, + 0x0036] %asi, %r4
	.word 0xd1bad91f  ! 790: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1bad91f  ! 791: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 792: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd252a006  ! 793: LDSH_I	ldsh	[%r10 + 0x0006], %r9
	.word 0xc83ac01f  ! 794: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbf2e01f  ! 795: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc79aa010  ! 796: LDDFA_I	ldda	[%r10, 0x0010], %f3
	.word 0xcdba991f  ! 797: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba98bf  ! 798: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xccd2911f  ! 799: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r6
	.word 0xcc4aa020  ! 800: LDSB_I	ldsb	[%r10 + 0x0020], %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1baa020  ! 801: STDFA_I	stda	%f8, [0x0020, %r10]
	.word 0xc5ba991f  ! 802: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 803: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43a801f  ! 804: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa068  ! 805: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5ba989f  ! 806: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba983f  ! 807: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcac2d03f  ! 808: LDSWA_R	ldswa	[%r11, %r31] 0x81, %r5
	.word 0xcbbae020  ! 809: STDFA_I	stda	%f5, [0x0020, %r11]
	.word 0xccd2903f  ! 810: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd012e030  ! 811: LDUH_I	lduh	[%r11 + 0x0030], %r8
	.word 0xc9ba99bf  ! 812: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 813: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba985f  ! 814: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc41ae078  ! 815: LDD_I	ldd	[%r11 + 0x0078], %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd2cad13f  ! 816: LDSBA_R	ldsba	[%r11, %r31] 0x89, %r9
	.word 0xcff2a01f  ! 817: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfe2a01f  ! 818: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2911f  ! 819: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xc45aa050  ! 820: LDX_I	ldx	[%r10 + 0x0050], %r2
TH_LABEL820:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfba997f  ! 821: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc6da917f  ! 822: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r3
	.word 0xccdaa020  ! 823: LDXA_I	ldxa	[%r10, + 0x0020] %asi, %r6
	.word 0xd3baa068  ! 824: STDFA_I	stda	%f9, [0x0068, %r10]
	.word 0xc40a801f  ! 825: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcac2d07f  ! 826: LDSWA_R	ldswa	[%r11, %r31] 0x83, %r5
	.word 0xca5ac01f  ! 827: LDX_R	ldx	[%r11 + %r31], %r5
	.word 0xc9ba985f  ! 828: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba983f  ! 829: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba999f  ! 830: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc83a801f  ! 831: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc2d2915f  ! 832: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r1
	.word 0xd042801f  ! 833: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xc7e2a01f  ! 834: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba98bf  ! 835: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL835:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc4a801f  ! 836: LDSB_R	ldsb	[%r10 + %r31], %r6
	.word 0xc7ba997f  ! 837: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2913f  ! 838: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba985f  ! 839: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 840: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc48a915f  ! 841: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r2
	.word 0xd01ac01f  ! 842: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xc7ba987f  ! 843: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 844: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2a01f  ! 845: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7ba991f  ! 846: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc722801f  ! 847: STF_R	st	%f3, [%r31, %r10]
	.word 0xc5e2903f  ! 848: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5f2903f  ! 849: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xd01ac01f  ! 850: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc79ae000  ! 851: LDDFA_I	ldda	[%r11, 0x0000], %f3
	.word 0xce02a070  ! 852: LDUW_I	lduw	[%r10 + 0x0070], %r7
	.word 0xc7f2a01f  ! 853: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba983f  ! 854: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba995f  ! 855: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL855:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd282a010  ! 856: LDUWA_I	lduwa	[%r10, + 0x0010] %asi, %r9
	.word 0xc9baa050  ! 857: STDFA_I	stda	%f4, [0x0050, %r10]
	.word 0xd3bad87f  ! 858: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xccca907f  ! 859: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r6
	.word 0xc9ba989f  ! 860: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9e2a01f  ! 861: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83a801f  ! 862: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc702801f  ! 863: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc902a070  ! 864: LDF_I	ld	[%r10, 0x0070], %f4
	.word 0xc41a801f  ! 865: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1e2911f  ! 866: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xc252c01f  ! 867: LDSH_R	ldsh	[%r11 + %r31], %r1
	.word 0xd3ba991f  ! 868: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xccd2e05c  ! 869: LDSHA_I	ldsha	[%r11, + 0x005c] %asi, %r6
	.word 0xc702a054  ! 870: LDF_I	ld	[%r10, 0x0054], %f3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbba991f  ! 871: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc282d13f  ! 872: LDUWA_R	lduwa	[%r11, %r31] 0x89, %r1
	.word 0xcfba987f  ! 873: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 874: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xd3baa078  ! 875: STDFA_I	stda	%f9, [0x0078, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3ba981f  ! 876: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2903f  ! 877: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xcc02801f  ! 878: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xc83ae048  ! 879: STD_I	std	%r4, [%r11 + 0x0048]
	.word 0xc292915f  ! 880: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1bae068  ! 881: STDFA_I	stda	%f8, [0x0068, %r11]
	.word 0xcdba981f  ! 882: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 883: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba989f  ! 884: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 885: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc9ae058  ! 886: LDDA_I	ldda	[%r11, + 0x0058] %asi, %r6
	.word 0xd1f2a01f  ! 887: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba981f  ! 888: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa020  ! 889: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xc49aa060  ! 890: LDDA_I	ldda	[%r10, + 0x0060] %asi, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfbad8bf  ! 891: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad83f  ! 892: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc7baa040  ! 893: STDFA_I	stda	%f3, [0x0040, %r10]
	.word 0xcbe2a01f  ! 894: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba981f  ! 895: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbba993f  ! 896: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 897: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd042c01f  ! 898: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xccda907f  ! 899: LDXA_R	ldxa	[%r10, %r31] 0x83, %r6
	.word 0xc3bad8bf  ! 900: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc3bad85f  ! 901: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d01f  ! 902: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad8bf  ! 903: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcac2901f  ! 904: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r5
	.word 0xc7ba981f  ! 905: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xccc2e064  ! 906: LDSWA_I	ldswa	[%r11, + 0x0064] %asi, %r6
	.word 0xd3f2a01f  ! 907: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xcd02e06c  ! 908: LDF_I	ld	[%r11, 0x006c], %f6
	.word 0xcbbad81f  ! 909: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d03f  ! 910: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbf2d03f  ! 911: CASXA_I	casxa	[%r11] 0x81, %r31, %r5
	.word 0xcbf2e01f  ! 912: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad99f  ! 913: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd08aa054  ! 914: LDUBA_I	lduba	[%r10, + 0x0054] %asi, %r8
	.word 0xd3bad81f  ! 915: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc59aa020  ! 916: LDDFA_I	ldda	[%r10, 0x0020], %f2
	.word 0xc45a801f  ! 917: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xd1bad9bf  ! 918: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 919: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad97f  ! 920: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1f2e01f  ! 921: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad8bf  ! 922: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d13f  ! 923: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
	.word 0xd03ac01f  ! 924: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2e01f  ! 925: CASA_R	casa	[%r11] %asi, %r31, %r8
TH_LABEL925:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1bad85f  ! 926: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcd9aa020  ! 927: LDDFA_I	ldda	[%r10, 0x0020], %f6
	.word 0xcdbad8bf  ! 928: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 929: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcdbad85f  ! 930: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcdbad93f  ! 931: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad8bf  ! 932: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad89f  ! 933: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc59aa010  ! 934: LDDFA_I	ldda	[%r10, 0x0010], %f2
	.word 0xd03aa030  ! 935: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xca5a801f  ! 936: LDX_R	ldx	[%r10 + %r31], %r5
	.word 0xcdba98bf  ! 937: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 938: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 939: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 940: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc292901f  ! 941: LDUHA_R	lduha	[%r10, %r31] 0x80, %r1
	.word 0xc5e2911f  ! 942: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5ba98bf  ! 943: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd292901f  ! 944: LDUHA_R	lduha	[%r10, %r31] 0x80, %r9
	.word 0xc842c01f  ! 945: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba981f  ! 946: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcf9aa058  ! 947: LDDFA_I	ldda	[%r10, 0x0058], %f7
	.word 0xc5e2d01f  ! 948: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xc5bad89f  ! 949: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 950: CASXA_R	casxa	[%r11]%asi, %r31, %r2
TH_LABEL950:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc59aa070  ! 951: LDDFA_I	ldda	[%r10, 0x0070], %f2
	.word 0xc9f2e01f  ! 952: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xce8a911f  ! 953: LDUBA_R	lduba	[%r10, %r31] 0x88, %r7
	.word 0xcacaa02c  ! 954: LDSBA_I	ldsba	[%r10, + 0x002c] %asi, %r5
	.word 0xcfba985f  ! 955: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc9ae008  ! 956: LDDA_I	ldda	[%r11, + 0x0008] %asi, %r6
	.word 0xcbba981f  ! 957: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa040  ! 958: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xcbba985f  ! 959: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc20a801f  ! 960: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc03aa040  ! 961: STD_I	std	%r0, [%r10 + 0x0040]
	.word 0xc3e2913f  ! 962: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc3ba987f  ! 963: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc45a801f  ! 964: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xc45a801f  ! 965: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc1ae040  ! 966: LDD_I	ldd	[%r11 + 0x0040], %r6
	.word 0xcdba98bf  ! 967: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba997f  ! 968: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 969: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 970: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcad2917f  ! 971: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r5
	.word 0xcbba989f  ! 972: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba989f  ! 973: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xce0aa045  ! 974: LDUB_I	ldub	[%r10 + 0x0045], %r7
	.word 0xd3ba981f  ! 975: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3e2901f  ! 976: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3f2a01f  ! 977: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03aa058  ! 978: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3f2a01f  ! 979: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 980: STD_R	std	%r8, [%r10 + %r31]
TH_LABEL980:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3ba981f  ! 981: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2913f  ! 982: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba983f  ! 983: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 984: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 985: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcad2903f  ! 986: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r5
	.word 0xc9ba981f  ! 987: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc41aa000  ! 988: LDD_I	ldd	[%r10 + 0x0000], %r2
	.word 0xcde2e01f  ! 989: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xcb9aa000  ! 990: LDDFA_I	ldda	[%r10, 0x0000], %f5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd282e010  ! 991: LDUWA_I	lduwa	[%r11, + 0x0010] %asi, %r9
	.word 0xd122c01f  ! 992: STF_R	st	%f8, [%r31, %r11]
	.word 0xd39aa038  ! 993: LDDFA_I	ldda	[%r10, 0x0038], %f9
	.word 0xc302a06c  ! 994: LDF_I	ld	[%r10, 0x006c], %f1
	.word 0xc7f2d01f  ! 995: CASXA_I	casxa	[%r11] 0x80, %r31, %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc322801f  ! 996: STF_R	st	%f1, [%r31, %r10]
	.word 0xcfbaa010  ! 997: STDFA_I	stda	%f7, [0x0010, %r10]
	.word 0xc9f2903f  ! 998: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc9f2903f  ! 999: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xcb9aa048  ! 1000: LDDFA_I	ldda	[%r10, 0x0048], %f5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	subcc %r30, 1, %r30
	bnz  TH5_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	add	%g0,	0x1,	%r30
TH4_LOOP_START:
	.word 0xc9ba985f  ! 1: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc2da905f  ! 2: LDXA_R	ldxa	[%r10, %r31] 0x82, %r1
	.word 0xcc0aa015  ! 3: LDUB_I	ldub	[%r10 + 0x0015], %r6
	.word 0xc09ae028  ! 4: LDDA_I	ldda	[%r11, + 0x0028] %asi, %r0
	.word 0xc5f2d13f  ! 5: CASXA_I	casxa	[%r11] 0x89, %r31, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc44a801f  ! 6: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xc99aa028  ! 7: LDDFA_I	ldda	[%r10, 0x0028], %f4
	.word 0xcdba991f  ! 8: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 9: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xd3bae028  ! 10: STDFA_I	stda	%f9, [0x0028, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc25aa018  ! 11: LDX_I	ldx	[%r10 + 0x0018], %r1
	.word 0xcff2d11f  ! 12: CASXA_I	casxa	[%r11] 0x88, %r31, %r7
	.word 0xcfbad99f  ! 13: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad91f  ! 14: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad95f  ! 15: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xce4a801f  ! 16: LDSB_R	ldsb	[%r10 + %r31], %r7
	.word 0xcadaa008  ! 17: LDXA_I	ldxa	[%r10, + 0x0008] %asi, %r5
	.word 0xca12a010  ! 18: LDUH_I	lduh	[%r10 + 0x0010], %r5
	.word 0xc7ba99bf  ! 19: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 20: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd0c2d01f  ! 21: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r8
	.word 0xc5f2901f  ! 22: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xcc42801f  ! 23: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xd1bad99f  ! 24: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd302c01f  ! 25: LDF_R	ld	[%r11, %r31], %f9
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xce52e048  ! 26: LDSH_I	ldsh	[%r11 + 0x0048], %r7
	.word 0xcc02e038  ! 27: LDUW_I	lduw	[%r11 + 0x0038], %r6
	.word 0xc5e2a01f  ! 28: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2901f  ! 29: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5e2a01f  ! 30: CASA_R	casa	[%r10] %asi, %r31, %r2
TH_LABEL30:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5ba99bf  ! 31: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xce12a00c  ! 32: LDUH_I	lduh	[%r10 + 0x000c], %r7
	.word 0xc7ba983f  ! 33: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 34: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7f2a01f  ! 35: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1bae050  ! 36: STDFA_I	stda	%f8, [0x0050, %r11]
	.word 0xd03aa040  ! 37: STD_I	std	%r8, [%r10 + 0x0040]
	.word 0xd3ba993f  ! 38: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba991f  ! 39: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcada913f  ! 40: LDXA_R	ldxa	[%r10, %r31] 0x89, %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd092e054  ! 41: LDUHA_I	lduha	[%r11, + 0x0054] %asi, %r8
	.word 0xd28a917f  ! 42: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r9
	.word 0xc9f2901f  ! 43: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xd042c01f  ! 44: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xc83ac01f  ! 45: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc9e2d01f  ! 46: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc83ae068  ! 47: STD_I	std	%r4, [%r11 + 0x0068]
	.word 0xc9bad93f  ! 48: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 49: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2e01f  ! 50: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd2c2d01f  ! 51: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r9
	.word 0xd1ba99bf  ! 52: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xca82917f  ! 53: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r5
	.word 0xc602e000  ! 54: LDUW_I	lduw	[%r11 + 0x0000], %r3
	.word 0xd03ac01f  ! 55: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3f2d11f  ! 56: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xce92903f  ! 57: LDUHA_R	lduha	[%r10, %r31] 0x81, %r7
	.word 0xd1baa018  ! 58: STDFA_I	stda	%f8, [0x0018, %r10]
	.word 0xcfbad81f  ! 59: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d01f  ! 60: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfbad91f  ! 61: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcd9aa070  ! 62: LDDFA_I	ldda	[%r10, 0x0070], %f6
	.word 0xc4cad17f  ! 63: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r2
	.word 0xcc3a801f  ! 64: STD_R	std	%r6, [%r10 + %r31]
	.word 0xd19ae060  ! 65: LDDFA_I	ldda	[%r11, 0x0060], %f8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdf2a01f  ! 66: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc3a801f  ! 67: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba99bf  ! 68: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc2d2e01a  ! 69: LDSHA_I	ldsha	[%r11, + 0x001a] %asi, %r1
	.word 0xd302a028  ! 70: LDF_I	ld	[%r10, 0x0028], %f9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcb02c01f  ! 71: LDF_R	ld	[%r11, %r31], %f5
	.word 0xcde2a01f  ! 72: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2913f  ! 73: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xd202801f  ! 74: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xcc3aa000  ! 75: STD_I	std	%r6, [%r10 + 0x0000]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc88ad01f  ! 76: LDUBA_R	lduba	[%r11, %r31] 0x80, %r4
	.word 0xc9bad91f  ! 77: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc922801f  ! 78: STF_R	st	%f4, [%r31, %r10]
	.word 0xd0c2a018  ! 79: LDSWA_I	ldswa	[%r10, + 0x0018] %asi, %r8
	.word 0xd3baa068  ! 80: STDFA_I	stda	%f9, [0x0068, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc2d2913f  ! 81: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r1
	.word 0xd292907f  ! 82: LDUHA_R	lduha	[%r10, %r31] 0x83, %r9
	.word 0xc9ba98bf  ! 83: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 84: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83aa070  ! 85: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc6dae058  ! 86: LDXA_I	ldxa	[%r11, + 0x0058] %asi, %r3
	.word 0xc5bad87f  ! 87: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xca52a020  ! 88: LDSH_I	ldsh	[%r10 + 0x0020], %r5
	.word 0xc5ba99bf  ! 89: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 90: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5ba985f  ! 91: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 92: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc692a03a  ! 93: LDUHA_I	lduha	[%r10, + 0x003a] %asi, %r3
	.word 0xc03aa058  ! 94: STD_I	std	%r0, [%r10 + 0x0058]
	.word 0xd212c01f  ! 95: LDUH_R	lduh	[%r11 + %r31], %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3ba981f  ! 96: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 97: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2913f  ! 98: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc3ba989f  ! 99: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd2d2a000  ! 100: LDSHA_I	ldsha	[%r10, + 0x0000] %asi, %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc8daa048  ! 101: LDXA_I	ldxa	[%r10, + 0x0048] %asi, %r4
	.word 0xcc3aa060  ! 102: STD_I	std	%r6, [%r10 + 0x0060]
	.word 0xcbbaa048  ! 103: STDFA_I	stda	%f5, [0x0048, %r10]
	.word 0xcc52a04c  ! 104: LDSH_I	ldsh	[%r10 + 0x004c], %r6
	.word 0xcc5ac01f  ! 105: LDX_R	ldx	[%r11 + %r31], %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbbaa040  ! 106: STDFA_I	stda	%f5, [0x0040, %r10]
	.word 0xc5ba987f  ! 107: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2913f  ! 108: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc79aa058  ! 109: LDDFA_I	ldda	[%r10, 0x0058], %f3
	.word 0xc5ba987f  ! 110: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc43a801f  ! 111: STD_R	std	%r2, [%r10 + %r31]
	.word 0xcb02e074  ! 112: LDF_I	ld	[%r11, 0x0074], %f5
	.word 0xc402c01f  ! 113: LDUW_R	lduw	[%r11 + %r31], %r2
	.word 0xcbf2a01f  ! 114: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba99bf  ! 115: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc302801f  ! 116: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc3e2e01f  ! 117: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d03f  ! 118: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xc3e2e01f  ! 119: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3e2d11f  ! 120: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3f2d01f  ! 121: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3f2e01f  ! 122: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad91f  ! 123: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcbbae058  ! 124: STDFA_I	stda	%f5, [0x0058, %r11]
	.word 0xcbba99bf  ! 125: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbba993f  ! 126: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba99bf  ! 127: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba993f  ! 128: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcad2a06a  ! 129: LDSHA_I	ldsha	[%r10, + 0x006a] %asi, %r5
	.word 0xcdbad89f  ! 130: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc3ae060  ! 131: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xce8a905f  ! 132: LDUBA_R	lduba	[%r10, %r31] 0x82, %r7
	.word 0xd1ba987f  ! 133: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2901f  ! 134: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1e2a01f  ! 135: CASA_R	casa	[%r10] %asi, %r31, %r8
TH_LABEL135:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd03aa060  ! 136: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd1e2a01f  ! 137: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc292913f  ! 138: LDUHA_R	lduha	[%r10, %r31] 0x89, %r1
	.word 0xcbbae040  ! 139: STDFA_I	stda	%f5, [0x0040, %r11]
	.word 0xc692d07f  ! 140: LDUHA_R	lduha	[%r11, %r31] 0x83, %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc242e030  ! 141: LDSW_I	ldsw	[%r11 + 0x0030], %r1
	.word 0xcfbad89f  ! 142: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc6c2d07f  ! 143: LDSWA_R	ldswa	[%r11, %r31] 0x83, %r3
	.word 0xc3ba983f  ! 144: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 145: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3ba983f  ! 146: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc502801f  ! 147: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc9bad89f  ! 148: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad83f  ! 149: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc64aa066  ! 150: LDSB_I	ldsb	[%r10 + 0x0066], %r3
TH_LABEL150:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc412a046  ! 151: LDUH_I	lduh	[%r10 + 0x0046], %r2
	.word 0xcc3aa060  ! 152: STD_I	std	%r6, [%r10 + 0x0060]
	.word 0xc4cad07f  ! 153: LDSBA_R	ldsba	[%r11, %r31] 0x83, %r2
	.word 0xcbf2e01f  ! 154: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbf2d03f  ! 155: CASXA_I	casxa	[%r11] 0x81, %r31, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc68ad07f  ! 156: LDUBA_R	lduba	[%r11, %r31] 0x83, %r3
	.word 0xc45ae028  ! 157: LDX_I	ldx	[%r11 + 0x0028], %r2
	.word 0xc9f2e01f  ! 158: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 159: STD_R	std	%r4, [%r11 + %r31]
	.word 0xd08a911f  ! 160: LDUBA_R	lduba	[%r10, %r31] 0x88, %r8
TH_LABEL160:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5bae050  ! 161: STDFA_I	stda	%f2, [0x0050, %r11]
	.word 0xca92905f  ! 162: LDUHA_R	lduha	[%r10, %r31] 0x82, %r5
	.word 0xcbba997f  ! 163: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba995f  ! 164: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2911f  ! 165: CASA_I	casa	[%r10] 0x88, %r31, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbf2a01f  ! 166: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcac2905f  ! 167: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r5
	.word 0xcbf2e01f  ! 168: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xd28ae054  ! 169: LDUBA_I	lduba	[%r11, + 0x0054] %asi, %r9
	.word 0xc5ba987f  ! 170: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc43aa078  ! 171: STD_I	std	%r2, [%r10 + 0x0078]
	.word 0xcb9ae028  ! 172: LDDFA_I	ldda	[%r11, 0x0028], %f5
	.word 0xce5aa020  ! 173: LDX_I	ldx	[%r10 + 0x0020], %r7
	.word 0xd3f2e01f  ! 174: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2e01f  ! 175: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3f2d01f  ! 176: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd3bad87f  ! 177: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc4c2d17f  ! 178: LDSWA_R	ldswa	[%r11, %r31] 0x8b, %r2
	.word 0xc3ba989f  ! 179: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc44aa067  ! 180: LDSB_I	ldsb	[%r10 + 0x0067], %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3e2903f  ! 181: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd3f2a01f  ! 182: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba993f  ! 183: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 184: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd202e030  ! 185: LDUW_I	lduw	[%r11 + 0x0030], %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc43aa048  ! 186: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc5e2a01f  ! 187: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc502e050  ! 188: LDF_I	ld	[%r11, 0x0050], %f2
	.word 0xc402801f  ! 189: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xc852801f  ! 190: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcb9aa048  ! 191: LDDFA_I	ldda	[%r10, 0x0048], %f5
	.word 0xca4ac01f  ! 192: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xcbba995f  ! 193: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 194: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbf2a01f  ! 195: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbf2901f  ! 196: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xd122c01f  ! 197: STF_R	st	%f8, [%r31, %r11]
	.word 0xca0a801f  ! 198: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xcf9aa078  ! 199: LDDFA_I	ldda	[%r10, 0x0078], %f7
	.word 0xd1ba981f  ! 200: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcd9aa010  ! 201: LDDFA_I	ldda	[%r10, 0x0010], %f6
	.word 0xc302c01f  ! 202: LDF_R	ld	[%r11, %r31], %f1
	.word 0xcc5ac01f  ! 203: LDX_R	ldx	[%r11 + %r31], %r6
	.word 0xcfba98bf  ! 204: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc922c01f  ! 205: STF_R	st	%f4, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7ba999f  ! 206: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcfbaa018  ! 207: STDFA_I	stda	%f7, [0x0018, %r10]
	.word 0xc482a078  ! 208: LDUWA_I	lduwa	[%r10, + 0x0078] %asi, %r2
	.word 0xcdf2a01f  ! 209: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba989f  ! 210: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcb9aa070  ! 211: LDDFA_I	ldda	[%r10, 0x0070], %f5
	.word 0xc03ac01f  ! 212: STD_R	std	%r0, [%r11 + %r31]
	.word 0xd242a020  ! 213: LDSW_I	ldsw	[%r10 + 0x0020], %r9
	.word 0xcdbaa050  ! 214: STDFA_I	stda	%f6, [0x0050, %r10]
	.word 0xc83aa048  ! 215: STD_I	std	%r4, [%r10 + 0x0048]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd092903f  ! 216: LDUHA_R	lduha	[%r10, %r31] 0x81, %r8
	.word 0xce92e068  ! 217: LDUHA_I	lduha	[%r11, + 0x0068] %asi, %r7
	.word 0xcc42801f  ! 218: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xd19aa018  ! 219: LDDFA_I	ldda	[%r10, 0x0018], %f8
	.word 0xc642a038  ! 220: LDSW_I	ldsw	[%r10 + 0x0038], %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xceca913f  ! 221: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r7
	.word 0xcde2901f  ! 222: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xc5bae078  ! 223: STDFA_I	stda	%f2, [0x0078, %r11]
	.word 0xd102801f  ! 224: LDF_R	ld	[%r10, %r31], %f8
	.word 0xc41ac01f  ! 225: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03ac01f  ! 226: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad81f  ! 227: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 228: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad83f  ! 229: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad87f  ! 230: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3bad97f  ! 231: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad95f  ! 232: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 233: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad81f  ! 234: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd202a014  ! 235: LDUW_I	lduw	[%r10 + 0x0014], %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1ba989f  ! 236: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 237: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc242e030  ! 238: LDSW_I	ldsw	[%r11 + 0x0030], %r1
	.word 0xc7e2903f  ! 239: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba987f  ! 240: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc81aa000  ! 241: LDD_I	ldd	[%r10 + 0x0000], %r4
	.word 0xd28a911f  ! 242: LDUBA_R	lduba	[%r10, %r31] 0x88, %r9
	.word 0xc502a01c  ! 243: LDF_I	ld	[%r10, 0x001c], %f2
	.word 0xd3bad87f  ! 244: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad93f  ! 245: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xca0a801f  ! 246: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xd08aa035  ! 247: LDUBA_I	lduba	[%r10, + 0x0035] %asi, %r8
	.word 0xd1bae078  ! 248: STDFA_I	stda	%f8, [0x0078, %r11]
	.word 0xcb02c01f  ! 249: LDF_R	ld	[%r11, %r31], %f5
	.word 0xc5e2a01f  ! 250: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd212c01f  ! 251: LDUH_R	lduh	[%r11 + %r31], %r9
	.word 0xc8c2903f  ! 252: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r4
	.word 0xd1ba98bf  ! 253: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2903f  ! 254: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd1e2901f  ! 255: CASA_I	casa	[%r10] 0x80, %r31, %r8
TH_LABEL255:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc8a901f  ! 256: LDUBA_R	lduba	[%r10, %r31] 0x80, %r6
	.word 0xc3f2d13f  ! 257: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xc3bad99f  ! 258: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad81f  ! 259: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 260: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd0d2a04e  ! 261: LDSHA_I	ldsha	[%r10, + 0x004e] %asi, %r8
	.word 0xc4c2e004  ! 262: LDSWA_I	ldswa	[%r11, + 0x0004] %asi, %r2
	.word 0xc80ac01f  ! 263: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xd3f2a01f  ! 264: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2901f  ! 265: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba983f  ! 266: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc01ac01f  ! 267: LDD_R	ldd	[%r11 + %r31], %r0
	.word 0xd28ae040  ! 268: LDUBA_I	lduba	[%r11, + 0x0040] %asi, %r9
	.word 0xd19aa060  ! 269: LDDFA_I	ldda	[%r10, 0x0060], %f8
	.word 0xd012a00c  ! 270: LDUH_I	lduh	[%r10 + 0x000c], %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc842801f  ! 271: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xcad2e05e  ! 272: LDSHA_I	ldsha	[%r11, + 0x005e] %asi, %r5
	.word 0xc3f2d11f  ! 273: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xc3bad89f  ! 274: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad85f  ! 275: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbbaa028  ! 276: STDFA_I	stda	%f5, [0x0028, %r10]
	.word 0xc922801f  ! 277: STF_R	st	%f4, [%r31, %r10]
	.word 0xd39ae058  ! 278: LDDFA_I	ldda	[%r11, 0x0058], %f9
	.word 0xccda911f  ! 279: LDXA_R	ldxa	[%r10, %r31] 0x88, %r6
	.word 0xcdba985f  ! 280: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdf2901f  ! 281: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdf2903f  ! 282: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xcdf2901f  ! 283: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcc82a01c  ! 284: LDUWA_I	lduwa	[%r10, + 0x001c] %asi, %r6
	.word 0xc9ba991f  ! 285: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9e2a01f  ! 286: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83aa008  ! 287: STD_I	std	%r4, [%r10 + 0x0008]
	.word 0xc9ba991f  ! 288: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 289: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xd042801f  ! 290: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd03a801f  ! 291: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1e2a01f  ! 292: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xccd2a050  ! 293: LDSHA_I	ldsha	[%r10, + 0x0050] %asi, %r6
	.word 0xc7f2e01f  ! 294: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad85f  ! 295: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7bad93f  ! 296: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae028  ! 297: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc7bad81f  ! 298: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc4d2907f  ! 299: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r2
	.word 0xd03a801f  ! 300: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1ba999f  ! 301: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd082a05c  ! 302: LDUWA_I	lduwa	[%r10, + 0x005c] %asi, %r8
	.word 0xd3e2a01f  ! 303: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 304: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba993f  ! 305: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7baa028  ! 306: STDFA_I	stda	%f3, [0x0028, %r10]
	.word 0xc5baa068  ! 307: STDFA_I	stda	%f2, [0x0068, %r10]
	.word 0xcc3ac01f  ! 308: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcdf2d11f  ! 309: CASXA_I	casxa	[%r11] 0x88, %r31, %r6
	.word 0xcdbad9bf  ! 310: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd39ae060  ! 311: LDDFA_I	ldda	[%r11, 0x0060], %f9
	.word 0xcfba991f  ! 312: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc28a915f  ! 313: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r1
	.word 0xce5a801f  ! 314: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xcc3aa078  ! 315: STD_I	std	%r6, [%r10 + 0x0078]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd0daa020  ! 316: LDXA_I	ldxa	[%r10, + 0x0020] %asi, %r8
	.word 0xc852801f  ! 317: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xc83aa078  ! 318: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xcbe2913f  ! 319: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xca42e010  ! 320: LDSW_I	ldsw	[%r11 + 0x0010], %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcedae058  ! 321: LDXA_I	ldxa	[%r11, + 0x0058] %asi, %r7
	.word 0xd3f2913f  ! 322: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba985f  ! 323: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 324: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xcb02e050  ! 325: LDF_I	ld	[%r11, 0x0050], %f5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdbad93f  ! 326: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc68ae026  ! 327: LDUBA_I	lduba	[%r11, + 0x0026] %asi, %r3
	.word 0xc03ae030  ! 328: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xc3e2e01f  ! 329: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d03f  ! 330: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc03ae030  ! 331: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xc3f2e01f  ! 332: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad93f  ! 333: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc682e064  ! 334: LDUWA_I	lduwa	[%r11, + 0x0064] %asi, %r3
	.word 0xcfe2a01f  ! 335: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfe2a01f  ! 336: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcdbaa000  ! 337: STDFA_I	stda	%f6, [0x0000, %r10]
	.word 0xcdf2a01f  ! 338: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc482915f  ! 339: LDUWA_R	lduwa	[%r10, %r31] 0x8a, %r2
	.word 0xc5e2d11f  ! 340: CASA_I	casa	[%r11] 0x88, %r31, %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc40a801f  ! 341: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xcdba995f  ! 342: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd002801f  ! 343: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xc81aa070  ! 344: LDD_I	ldd	[%r10 + 0x0070], %r4
	.word 0xc9ba98bf  ! 345: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9ba997f  ! 346: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd282e054  ! 347: LDUWA_I	lduwa	[%r11, + 0x0054] %asi, %r9
	.word 0xc7ba989f  ! 348: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 349: STD_R	std	%r2, [%r10 + %r31]
	.word 0xcecad15f  ! 350: LDSBA_R	ldsba	[%r11, %r31] 0x8a, %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd242c01f  ! 351: LDSW_R	ldsw	[%r11 + %r31], %r9
	.word 0xd08a911f  ! 352: LDUBA_R	lduba	[%r10, %r31] 0x88, %r8
	.word 0xce82a01c  ! 353: LDUWA_I	lduwa	[%r10, + 0x001c] %asi, %r7
	.word 0xce5a801f  ! 354: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xcdba999f  ! 355: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdba98bf  ! 356: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 357: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcde2911f  ! 358: CASA_I	casa	[%r10] 0x88, %r31, %r6
	.word 0xcde2a01f  ! 359: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xc902a034  ! 360: LDF_I	ld	[%r10, 0x0034], %f4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3e2a01f  ! 361: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3e2903f  ! 362: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd3ba991f  ! 363: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 364: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc85a801f  ! 365: LDX_R	ldx	[%r10 + %r31], %r4
TH_LABEL365:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7ba985f  ! 366: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa010  ! 367: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xc44a801f  ! 368: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xcfe2901f  ! 369: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcfe2a01f  ! 370: CASA_R	casa	[%r10] %asi, %r31, %r7
TH_LABEL370:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcff2a01f  ! 371: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcc3aa010  ! 372: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xc8d2a020  ! 373: LDSHA_I	ldsha	[%r10, + 0x0020] %asi, %r4
	.word 0xc3e2a01f  ! 374: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba991f  ! 375: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc8caa03d  ! 376: LDSBA_I	ldsba	[%r10, + 0x003d] %asi, %r4
	.word 0xcbba997f  ! 377: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba995f  ! 378: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba993f  ! 379: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2903f  ! 380: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xca42e00c  ! 381: LDSW_I	ldsw	[%r11 + 0x000c], %r5
	.word 0xcfe2a01f  ! 382: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcc3aa038  ! 383: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcfe2913f  ! 384: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcfba989f  ! 385: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfba989f  ! 386: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd102a014  ! 387: LDF_I	ld	[%r10, 0x0014], %f8
	.word 0xc43a801f  ! 388: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc8cae01c  ! 389: LDSBA_I	ldsba	[%r11, + 0x001c] %asi, %r4
	.word 0xcd02801f  ! 390: LDF_R	ld	[%r10, %r31], %f6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7bae060  ! 391: STDFA_I	stda	%f3, [0x0060, %r11]
	.word 0xcdba983f  ! 392: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc202801f  ! 393: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xcfba98bf  ! 394: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba991f  ! 395: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfba981f  ! 396: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2903f  ! 397: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xd092917f  ! 398: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r8
	.word 0xce8a917f  ! 399: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r7
	.word 0xc212e02e  ! 400: LDUH_I	lduh	[%r11 + 0x002e], %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcde2913f  ! 401: CASA_I	casa	[%r10] 0x89, %r31, %r6
	.word 0xcc3a801f  ! 402: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba985f  ! 403: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc1aa020  ! 404: LDD_I	ldd	[%r10 + 0x0020], %r6
	.word 0xc6caa040  ! 405: LDSBA_I	ldsba	[%r10, + 0x0040] %asi, %r3
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc79ae000  ! 406: LDDFA_I	ldda	[%r11, 0x0000], %f3
	.word 0xcdf2a01f  ! 407: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba997f  ! 408: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcecaa056  ! 409: LDSBA_I	ldsba	[%r10, + 0x0056] %asi, %r7
	.word 0xd3ba981f  ! 410: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5baa070  ! 411: STDFA_I	stda	%f2, [0x0070, %r10]
	.word 0xca8aa02a  ! 412: LDUBA_I	lduba	[%r10, + 0x002a] %asi, %r5
	.word 0xc302e060  ! 413: LDF_I	ld	[%r11, 0x0060], %f1
	.word 0xcff2e01f  ! 414: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xc48aa017  ! 415: LDUBA_I	lduba	[%r10, + 0x0017] %asi, %r2
TH_LABEL415:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc03ae000  ! 416: STD_I	std	%r0, [%r11 + 0x0000]
	.word 0xcbbaa058  ! 417: STDFA_I	stda	%f5, [0x0058, %r10]
	.word 0xd3e2a01f  ! 418: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 419: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3e2a01f  ! 420: CASA_R	casa	[%r10] %asi, %r31, %r9
TH_LABEL420:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3ba981f  ! 421: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xccda905f  ! 422: LDXA_R	ldxa	[%r10, %r31] 0x82, %r6
	.word 0xd1e2913f  ! 423: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xd09aa040  ! 424: LDDA_I	ldda	[%r10, + 0x0040] %asi, %r8
	.word 0xc83ac01f  ! 425: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbbad8bf  ! 426: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd19ae040  ! 427: LDDFA_I	ldda	[%r11, 0x0040], %f8
	.word 0xc322801f  ! 428: STF_R	st	%f1, [%r31, %r10]
	.word 0xd3bad93f  ! 429: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcbbaa040  ! 430: STDFA_I	stda	%f5, [0x0040, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcf02a01c  ! 431: LDF_I	ld	[%r10, 0x001c], %f7
	.word 0xc09aa010  ! 432: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r0
	.word 0xc3bad8bf  ! 433: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d01f  ! 434: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc03ac01f  ! 435: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3bad95f  ! 436: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad95f  ! 437: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 438: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d13f  ! 439: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xc03ac01f  ! 440: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3f2d13f  ! 441: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xc88a915f  ! 442: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r4
	.word 0xd302a008  ! 443: LDF_I	ld	[%r10, 0x0008], %f9
	.word 0xc5f2d01f  ! 444: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc5bad87f  ! 445: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5bad81f  ! 446: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd3baa028  ! 447: STDFA_I	stda	%f9, [0x0028, %r10]
	.word 0xd1ba983f  ! 448: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2911f  ! 449: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xd1f2a01f  ! 450: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcd22c01f  ! 451: STF_R	st	%f6, [%r31, %r11]
	.word 0xd3ba995f  ! 452: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc40ac01f  ! 453: LDUB_R	ldub	[%r11 + %r31], %r2
	.word 0xd202e060  ! 454: LDUW_I	lduw	[%r11 + 0x0060], %r9
	.word 0xd3ba98bf  ! 455: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd04a801f  ! 456: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xc83a801f  ! 457: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbf2a01f  ! 458: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2901f  ! 459: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcd9ae020  ! 460: LDDFA_I	ldda	[%r11, 0x0020], %f6
TH_LABEL460:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7e2a01f  ! 461: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc43a801f  ! 462: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7f2901f  ! 463: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba987f  ! 464: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba991f  ! 465: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7ba999f  ! 466: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcac2a040  ! 467: LDSWA_I	ldswa	[%r10, + 0x0040] %asi, %r5
	.word 0xc64aa01b  ! 468: LDSB_I	ldsb	[%r10 + 0x001b], %r3
	.word 0xc59aa038  ! 469: LDDFA_I	ldda	[%r10, 0x0038], %f2
	.word 0xca8aa078  ! 470: LDUBA_I	lduba	[%r10, + 0x0078] %asi, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc2cae076  ! 471: LDSBA_I	ldsba	[%r11, + 0x0076] %asi, %r1
	.word 0xc5ba985f  ! 472: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc302801f  ! 473: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc7f2913f  ! 474: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc7f2a01f  ! 475: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7ba985f  ! 476: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 477: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xccc2911f  ! 478: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r6
	.word 0xc3ba987f  ! 479: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcada917f  ! 480: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcbbad97f  ! 481: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbaa048  ! 482: STDFA_I	stda	%f5, [0x0048, %r10]
	.word 0xc3ba983f  ! 483: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 484: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc03aa008  ! 485: STD_I	std	%r0, [%r10 + 0x0008]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc702a068  ! 486: LDF_I	ld	[%r10, 0x0068], %f3
	.word 0xc7bad9bf  ! 487: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad81f  ! 488: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae078  ! 489: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xc612a062  ! 490: LDUH_I	lduh	[%r10 + 0x0062], %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcc3ae030  ! 491: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcdbad81f  ! 492: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad83f  ! 493: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2d01f  ! 494: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad81f  ! 495: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xce8ad11f  ! 496: LDUBA_R	lduba	[%r11, %r31] 0x88, %r7
	.word 0xc7ba997f  ! 497: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 498: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc81ac01f  ! 499: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xcfba981f  ! 500: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcfba995f  ! 501: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba999f  ! 502: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 503: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcff2a01f  ! 504: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc09ae018  ! 505: LDDA_I	ldda	[%r11, + 0x0018] %asi, %r0
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1ba987f  ! 506: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa000  ! 507: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd1ba991f  ! 508: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcf02801f  ! 509: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc03a801f  ! 510: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd322c01f  ! 511: STF_R	st	%f9, [%r31, %r11]
	.word 0xcbba981f  ! 512: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba995f  ! 513: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc302801f  ! 514: LDF_R	ld	[%r10, %r31], %f1
	.word 0xcb9ae050  ! 515: LDDFA_I	ldda	[%r11, 0x0050], %f5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc8d2911f  ! 516: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r4
	.word 0xc59aa028  ! 517: LDDFA_I	ldda	[%r10, 0x0028], %f2
	.word 0xcf02801f  ! 518: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc3baa038  ! 519: STDFA_I	stda	%f1, [0x0038, %r10]
	.word 0xcff2a01f  ! 520: CASXA_R	casxa	[%r10]%asi, %r31, %r7
TH_LABEL520:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfe2901f  ! 521: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcfba989f  ! 522: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 523: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 524: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc85a801f  ! 525: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1ba989f  ! 526: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 527: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba983f  ! 528: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 529: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba983f  ! 530: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1e2a01f  ! 531: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 532: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc28aa076  ! 533: LDUBA_I	lduba	[%r10, + 0x0076] %asi, %r1
	.word 0xca52e066  ! 534: LDSH_I	ldsh	[%r11 + 0x0066], %r5
	.word 0xcfba987f  ! 535: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfe2a01f  ! 536: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2911f  ! 537: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcc3a801f  ! 538: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba983f  ! 539: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba991f  ! 540: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9baa028  ! 541: STDFA_I	stda	%f4, [0x0028, %r10]
	.word 0xcbba989f  ! 542: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 543: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba981f  ! 544: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba993f  ! 545: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbba989f  ! 546: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 547: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba98bf  ! 548: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcadaa068  ! 549: LDXA_I	ldxa	[%r10, + 0x0068] %asi, %r5
	.word 0xd1baa010  ! 550: STDFA_I	stda	%f8, [0x0010, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbf2911f  ! 551: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xc83aa038  ! 552: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xcbf2a01f  ! 553: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xc4daa000  ! 554: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r2
	.word 0xc5ba98bf  ! 555: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5e2911f  ! 556: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5ba997f  ! 557: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba99bf  ! 558: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 559: STD_R	std	%r2, [%r10 + %r31]
	.word 0xcd02a010  ! 560: LDF_I	ld	[%r10, 0x0010], %f6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7ba981f  ! 561: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc452801f  ! 562: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xc28aa02c  ! 563: LDUBA_I	lduba	[%r10, + 0x002c] %asi, %r1
	.word 0xc20ac01f  ! 564: LDUB_R	ldub	[%r11 + %r31], %r1
	.word 0xc7ba98bf  ! 565: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL565:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc12801f  ! 566: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xc43aa058  ! 567: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc7ba985f  ! 568: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba987f  ! 569: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc812e048  ! 570: LDUH_I	lduh	[%r11 + 0x0048], %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1f2d13f  ! 571: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
	.word 0xd1f2d01f  ! 572: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xd1e2e01f  ! 573: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xc99aa038  ! 574: LDDFA_I	ldda	[%r10, 0x0038], %f4
	.word 0xd01aa030  ! 575: LDD_I	ldd	[%r10 + 0x0030], %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd03aa040  ! 576: STD_I	std	%r8, [%r10 + 0x0040]
	.word 0xd3ba981f  ! 577: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2911f  ! 578: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xd3ba98bf  ! 579: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc482907f  ! 580: LDUWA_R	lduwa	[%r10, %r31] 0x83, %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc5ba99bf  ! 581: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba997f  ! 582: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 583: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc85a801f  ! 584: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xc3bae008  ! 585: STDFA_I	stda	%f1, [0x0008, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5f2901f  ! 586: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba99bf  ! 587: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2911f  ! 588: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xc202e018  ! 589: LDUW_I	lduw	[%r11 + 0x0018], %r1
	.word 0xcbba981f  ! 590: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xca92d01f  ! 591: LDUHA_R	lduha	[%r11, %r31] 0x80, %r5
	.word 0xc9bad85f  ! 592: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9f2e01f  ! 593: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xceca903f  ! 594: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r7
	.word 0xc902c01f  ! 595: LDF_R	ld	[%r11, %r31], %f4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc212e002  ! 596: LDUH_I	lduh	[%r11 + 0x0002], %r1
	.word 0xd3bad9bf  ! 597: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 598: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad91f  ! 599: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd25ae030  ! 600: LDX_I	ldx	[%r11 + 0x0030], %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5bad81f  ! 601: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xca0ae073  ! 602: LDUB_I	ldub	[%r11 + 0x0073], %r5
	.word 0xcbbad85f  ! 603: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc8da903f  ! 604: LDXA_R	ldxa	[%r10, %r31] 0x81, %r4
	.word 0xc24a801f  ! 605: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc5baa028  ! 606: STDFA_I	stda	%f2, [0x0028, %r10]
	.word 0xc7bad97f  ! 607: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc202801f  ! 608: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xc88aa049  ! 609: LDUBA_I	lduba	[%r10, + 0x0049] %asi, %r4
	.word 0xcc12a01a  ! 610: LDUH_I	lduh	[%r10 + 0x001a], %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc83ae020  ! 611: STD_I	std	%r4, [%r11 + 0x0020]
	.word 0xc9bad97f  ! 612: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcc1aa008  ! 613: LDD_I	ldd	[%r10 + 0x0008], %r6
	.word 0xcdbad81f  ! 614: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc02a060  ! 615: LDUW_I	lduw	[%r10 + 0x0060], %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3f2d11f  ! 616: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xce0ae008  ! 617: LDUB_I	ldub	[%r11 + 0x0008], %r7
	.word 0xc6ca901f  ! 618: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r3
	.word 0xcad2d07f  ! 619: LDSHA_R	ldsha	[%r11, %r31] 0x83, %r5
	.word 0xcf02c01f  ! 620: LDF_R	ld	[%r11, %r31], %f7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc83ae070  ! 621: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xc25a801f  ! 622: LDX_R	ldx	[%r10 + %r31], %r1
	.word 0xd3bad95f  ! 623: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad8bf  ! 624: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcd02801f  ! 625: LDF_R	ld	[%r10, %r31], %f6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc83a801f  ! 626: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd24aa05e  ! 627: LDSB_I	ldsb	[%r10 + 0x005e], %r9
	.word 0xc3ba99bf  ! 628: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 629: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 630: STD_R	std	%r0, [%r10 + %r31]
TH_LABEL630:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd012a046  ! 631: LDUH_I	lduh	[%r10 + 0x0046], %r8
	.word 0xc9bad8bf  ! 632: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc642801f  ! 633: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc492a070  ! 634: LDUHA_I	lduha	[%r10, + 0x0070] %asi, %r2
	.word 0xcdf2e01f  ! 635: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd2d2e054  ! 636: LDSHA_I	ldsha	[%r11, + 0x0054] %asi, %r9
	.word 0xcff2901f  ! 637: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcff2911f  ! 638: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcfe2911f  ! 639: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xc602c01f  ! 640: LDUW_R	lduw	[%r11 + %r31], %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfba995f  ! 641: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc9ae040  ! 642: LDDA_I	ldda	[%r11, + 0x0040] %asi, %r6
	.word 0xcd02801f  ! 643: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc902e048  ! 644: LDF_I	ld	[%r11, 0x0048], %f4
	.word 0xc242801f  ! 645: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc24a801f  ! 646: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xcaca905f  ! 647: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r5
	.word 0xc9ba999f  ! 648: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba99bf  ! 649: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba99bf  ! 650: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9f2a01f  ! 651: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc83aa010  ! 652: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xc9e2901f  ! 653: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc8caa039  ! 654: LDSBA_I	ldsba	[%r10, + 0x0039] %asi, %r4
	.word 0xc2d2a00c  ! 655: LDSHA_I	ldsha	[%r10, + 0x000c] %asi, %r1
TH_LABEL655:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9ba98bf  ! 656: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc2daa000  ! 657: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r1
	.word 0xc5e2901f  ! 658: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xd04aa035  ! 659: LDSB_I	ldsb	[%r10 + 0x0035], %r8
	.word 0xcc3ae030  ! 660: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcfbad85f  ! 661: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd3baa058  ! 662: STDFA_I	stda	%f9, [0x0058, %r10]
	.word 0xd1e2e01f  ! 663: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xc902a050  ! 664: LDF_I	ld	[%r10, 0x0050], %f4
	.word 0xc3ba983f  ! 665: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3ba99bf  ! 666: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2901f  ! 667: CASXA_I	casxa	[%r10] 0x80, %r31, %r1
	.word 0xc492917f  ! 668: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r2
	.word 0xcec2901f  ! 669: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r7
	.word 0xc642801f  ! 670: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd03ac01f  ! 671: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad95f  ! 672: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd3baa068  ! 673: STDFA_I	stda	%f9, [0x0068, %r10]
	.word 0xc5ba999f  ! 674: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa038  ! 675: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd05aa058  ! 676: LDX_I	ldx	[%r10 + 0x0058], %r8
	.word 0xc902e04c  ! 677: LDF_I	ld	[%r11, 0x004c], %f4
	.word 0xc9e2e01f  ! 678: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad93f  ! 679: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad9bf  ! 680: STDFA_R	stda	%f4, [%r31, %r11]
TH_LABEL680:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9bad97f  ! 681: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d01f  ! 682: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc83ae060  ! 683: STD_I	std	%r4, [%r11 + 0x0060]
	.word 0xc48ae032  ! 684: LDUBA_I	lduba	[%r11, + 0x0032] %asi, %r2
	.word 0xcadaa068  ! 685: LDXA_I	ldxa	[%r10, + 0x0068] %asi, %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcff2e01f  ! 686: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcfbad8bf  ! 687: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d11f  ! 688: CASXA_I	casxa	[%r11] 0x88, %r31, %r7
	.word 0xca0a801f  ! 689: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xd1ba98bf  ! 690: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL690:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc5ae058  ! 691: LDX_I	ldx	[%r11 + 0x0058], %r6
	.word 0xd0c2e054  ! 692: LDSWA_I	ldswa	[%r11, + 0x0054] %asi, %r8
	.word 0xc43ae028  ! 693: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc43ac01f  ! 694: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7bad89f  ! 695: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd00ac01f  ! 696: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xc7e2a01f  ! 697: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba981f  ! 698: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc252a076  ! 699: LDSH_I	ldsh	[%r10 + 0x0076], %r1
	.word 0xc3f2a01f  ! 700: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3ba999f  ! 701: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 702: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3f2a01f  ! 703: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba981f  ! 704: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 705: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3ba985f  ! 706: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba99bf  ! 707: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc8daa000  ! 708: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r4
	.word 0xd002801f  ! 709: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xc442e020  ! 710: LDSW_I	ldsw	[%r11 + 0x0020], %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3e2a01f  ! 711: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3e2a01f  ! 712: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba999f  ! 713: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2913f  ! 714: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd03a801f  ! 715: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3f2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc892917f  ! 717: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r4
	.word 0xc39aa038  ! 718: LDDFA_I	ldda	[%r10, 0x0038], %f1
	.word 0xc702a078  ! 719: LDF_I	ld	[%r10, 0x0078], %f3
	.word 0xd3e2d11f  ! 720: CASA_I	casa	[%r11] 0x88, %r31, %r9
TH_LABEL720:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1baa070  ! 721: STDFA_I	stda	%f8, [0x0070, %r10]
	.word 0xd3ba985f  ! 722: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba985f  ! 723: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 724: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 725: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3ba981f  ! 726: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd19ae048  ! 727: LDDFA_I	ldda	[%r11, 0x0048], %f8
	.word 0xc522801f  ! 728: STF_R	st	%f2, [%r31, %r10]
	.word 0xd3e2e01f  ! 729: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3f2d11f  ! 730: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc48a917f  ! 731: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r2
	.word 0xc5e2911f  ! 732: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5ba987f  ! 733: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 734: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba999f  ! 735: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc252a00a  ! 736: LDSH_I	ldsh	[%r10 + 0x000a], %r1
	.word 0xc3ba989f  ! 737: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc64a801f  ! 738: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xc7f2a01f  ! 739: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7f2911f  ! 740: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xce4aa05c  ! 741: LDSB_I	ldsb	[%r10 + 0x005c], %r7
	.word 0xcfe2a01f  ! 742: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba995f  ! 743: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 744: STD_R	std	%r6, [%r10 + %r31]
	.word 0xca12a056  ! 745: LDUH_I	lduh	[%r10 + 0x0056], %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd08a917f  ! 746: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r8
	.word 0xc4daa038  ! 747: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r2
	.word 0xc602c01f  ! 748: LDUW_R	lduw	[%r11 + %r31], %r3
	.word 0xca12801f  ! 749: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xc49aa020  ! 750: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd282e00c  ! 751: LDUWA_I	lduwa	[%r11, + 0x000c] %asi, %r9
	.word 0xc5e2e01f  ! 752: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad93f  ! 753: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad93f  ! 754: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc84aa028  ! 755: LDSB_I	ldsb	[%r10 + 0x0028], %r4
TH_LABEL755:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba98bf  ! 756: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xce0a801f  ! 757: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xc9e2d11f  ! 758: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xc9f2d11f  ! 759: CASXA_I	casxa	[%r11] 0x88, %r31, %r4
	.word 0xc09ae070  ! 760: LDDA_I	ldda	[%r11, + 0x0070] %asi, %r0
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd302a030  ! 761: LDF_I	ld	[%r10, 0x0030], %f9
	.word 0xc9ba985f  ! 762: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xca0aa03e  ! 763: LDUB_I	ldub	[%r10 + 0x003e], %r5
	.word 0xd102a060  ! 764: LDF_I	ld	[%r10, 0x0060], %f8
	.word 0xc9ba981f  ! 765: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc83a801f  ! 766: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba98bf  ! 767: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2913f  ! 768: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba997f  ! 769: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba987f  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc682a07c  ! 771: LDUWA_I	lduwa	[%r10, + 0x007c] %asi, %r3
	.word 0xcb02801f  ! 772: LDF_R	ld	[%r10, %r31], %f5
	.word 0xcfba98bf  ! 773: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc68ae06b  ! 774: LDUBA_I	lduba	[%r11, + 0x006b] %asi, %r3
	.word 0xc41ae048  ! 775: LDD_I	ldd	[%r11 + 0x0048], %r2
TH_LABEL775:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1f2d11f  ! 776: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xc212c01f  ! 777: LDUH_R	lduh	[%r11 + %r31], %r1
	.word 0xc7f2901f  ! 778: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba981f  ! 779: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc49aa018  ! 780: LDDA_I	ldda	[%r10, + 0x0018] %asi, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc452801f  ! 781: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xcbba981f  ! 782: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba987f  ! 783: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc88ae05b  ! 784: LDUBA_I	lduba	[%r11, + 0x005b] %asi, %r4
	.word 0xcc8ad07f  ! 785: LDUBA_R	lduba	[%r11, %r31] 0x83, %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3e2a01f  ! 786: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 787: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc702a03c  ! 788: LDF_I	ld	[%r10, 0x003c], %f3
	.word 0xca8aa06c  ! 789: LDUBA_I	lduba	[%r10, + 0x006c] %asi, %r5
	.word 0xd1bad81f  ! 790: STDFA_R	stda	%f8, [%r31, %r11]
TH_LABEL790:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1bad9bf  ! 791: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad93f  ! 792: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc652a008  ! 793: LDSH_I	ldsh	[%r10 + 0x0008], %r3
	.word 0xc83ac01f  ! 794: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbf2e01f  ! 795: CASXA_R	casxa	[%r11]%asi, %r31, %r5
TH_LABEL795:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc99aa010  ! 796: LDDFA_I	ldda	[%r10, 0x0010], %f4
	.word 0xcdba989f  ! 797: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 798: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc6d2911f  ! 799: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r3
	.word 0xd24aa029  ! 800: LDSB_I	ldsb	[%r10 + 0x0029], %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9baa048  ! 801: STDFA_I	stda	%f4, [0x0048, %r10]
	.word 0xc5ba987f  ! 802: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 803: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43a801f  ! 804: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa068  ! 805: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5ba99bf  ! 806: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 807: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc6c2903f  ! 808: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r3
	.word 0xd1baa010  ! 809: STDFA_I	stda	%f8, [0x0010, %r10]
	.word 0xc6d2917f  ! 810: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc812e05c  ! 811: LDUH_I	lduh	[%r11 + 0x005c], %r4
	.word 0xc9ba985f  ! 812: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2911f  ! 813: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba989f  ! 814: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc1aa060  ! 815: LDD_I	ldd	[%r10 + 0x0060], %r6
TH_LABEL815:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc6ca915f  ! 816: LDSBA_R	ldsba	[%r10, %r31] 0x8a, %r3
	.word 0xcff2a01f  ! 817: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfe2a01f  ! 818: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2911f  ! 819: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xd25aa028  ! 820: LDX_I	ldx	[%r10 + 0x0028], %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba985f  ! 821: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd0dad13f  ! 822: LDXA_R	ldxa	[%r11, %r31] 0x89, %r8
	.word 0xcadaa000  ! 823: LDXA_I	ldxa	[%r10, + 0x0000] %asi, %r5
	.word 0xc7baa010  ! 824: STDFA_I	stda	%f3, [0x0010, %r10]
	.word 0xce0ac01f  ! 825: LDUB_R	ldub	[%r11 + %r31], %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc4c2d01f  ! 826: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r2
	.word 0xd25ac01f  ! 827: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xc9ba99bf  ! 828: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 829: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba98bf  ! 830: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc83a801f  ! 831: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc6d2d05f  ! 832: LDSHA_R	ldsha	[%r11, %r31] 0x82, %r3
	.word 0xca42801f  ! 833: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xc7e2a01f  ! 834: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba985f  ! 835: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xce4a801f  ! 836: LDSB_R	ldsb	[%r10 + %r31], %r7
	.word 0xc7ba991f  ! 837: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2913f  ! 838: CASA_I	casa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba989f  ! 839: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 840: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcc8a917f  ! 841: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r6
	.word 0xc81a801f  ! 842: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xc7ba999f  ! 843: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 844: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2a01f  ! 845: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7ba999f  ! 846: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc922c01f  ! 847: STF_R	st	%f4, [%r31, %r11]
	.word 0xc5e2913f  ! 848: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5f2911f  ! 849: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xc81a801f  ! 850: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc99aa010  ! 851: LDDFA_I	ldda	[%r10, 0x0010], %f4
	.word 0xc602e034  ! 852: LDUW_I	lduw	[%r11 + 0x0034], %r3
	.word 0xc7f2a01f  ! 853: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba98bf  ! 854: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 855: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd282a048  ! 856: LDUWA_I	lduwa	[%r10, + 0x0048] %asi, %r9
	.word 0xcbbaa078  ! 857: STDFA_I	stda	%f5, [0x0078, %r10]
	.word 0xd3bad91f  ! 858: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xceca905f  ! 859: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r7
	.word 0xc9ba985f  ! 860: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9e2a01f  ! 861: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83a801f  ! 862: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc302c01f  ! 863: LDF_R	ld	[%r11, %r31], %f1
	.word 0xd302e018  ! 864: LDF_I	ld	[%r11, 0x0018], %f9
	.word 0xc81ac01f  ! 865: LDD_R	ldd	[%r11 + %r31], %r4
TH_LABEL865:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1e2913f  ! 866: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xd252c01f  ! 867: LDSH_R	ldsh	[%r11 + %r31], %r9
	.word 0xd3ba98bf  ! 868: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc8d2a00c  ! 869: LDSHA_I	ldsha	[%r10, + 0x000c] %asi, %r4
	.word 0xcd02a05c  ! 870: LDF_I	ld	[%r10, 0x005c], %f6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbba99bf  ! 871: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc482911f  ! 872: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r2
	.word 0xcfba989f  ! 873: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 874: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcbbaa018  ! 875: STDFA_I	stda	%f5, [0x0018, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3ba985f  ! 876: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2903f  ! 877: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xd202c01f  ! 878: LDUW_R	lduw	[%r11 + %r31], %r9
	.word 0xc83ae048  ! 879: STD_I	std	%r4, [%r11 + 0x0048]
	.word 0xce92d07f  ! 880: LDUHA_R	lduha	[%r11, %r31] 0x83, %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbbae070  ! 881: STDFA_I	stda	%f5, [0x0070, %r11]
	.word 0xcdba999f  ! 882: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 883: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 884: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 885: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc49aa068  ! 886: LDDA_I	ldda	[%r10, + 0x0068] %asi, %r2
	.word 0xd1f2a01f  ! 887: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba993f  ! 888: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa020  ! 889: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xc89aa058  ! 890: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r4
TH_LABEL890:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfbad87f  ! 891: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad8bf  ! 892: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc5baa038  ! 893: STDFA_I	stda	%f2, [0x0038, %r10]
	.word 0xcbe2a01f  ! 894: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba999f  ! 895: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbba985f  ! 896: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 897: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcc42801f  ! 898: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xccdad05f  ! 899: LDXA_R	ldxa	[%r11, %r31] 0x82, %r6
	.word 0xc3bad97f  ! 900: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3bad99f  ! 901: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d01f  ! 902: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad99f  ! 903: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd0c2913f  ! 904: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r8
	.word 0xc7ba99bf  ! 905: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc4c2a00c  ! 906: LDSWA_I	ldswa	[%r10, + 0x000c] %asi, %r2
	.word 0xd3f2a01f  ! 907: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xcf02a010  ! 908: LDF_I	ld	[%r10, 0x0010], %f7
	.word 0xcbbad85f  ! 909: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d03f  ! 910: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbf2d11f  ! 911: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xcbf2e01f  ! 912: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad99f  ! 913: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xce8ae078  ! 914: LDUBA_I	lduba	[%r11, + 0x0078] %asi, %r7
	.word 0xd3bad83f  ! 915: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcd9aa068  ! 916: LDDFA_I	ldda	[%r10, 0x0068], %f6
	.word 0xc85a801f  ! 917: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xd1bad93f  ! 918: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad89f  ! 919: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 920: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1f2e01f  ! 921: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad9bf  ! 922: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d13f  ! 923: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
	.word 0xd03ac01f  ! 924: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2e01f  ! 925: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1bad83f  ! 926: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd39aa018  ! 927: LDDFA_I	ldda	[%r10, 0x0018], %f9
	.word 0xcdbad8bf  ! 928: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 929: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcdbad99f  ! 930: STDFA_R	stda	%f6, [%r31, %r11]
TH_LABEL930:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdbad8bf  ! 931: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad95f  ! 932: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad95f  ! 933: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd39aa000  ! 934: LDDFA_I	ldda	[%r10, 0x0000], %f9
	.word 0xd03aa030  ! 935: STD_I	std	%r8, [%r10 + 0x0030]
TH_LABEL935:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd25ac01f  ! 936: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xcdba981f  ! 937: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba989f  ! 938: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 939: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 940: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd092905f  ! 941: LDUHA_R	lduha	[%r10, %r31] 0x82, %r8
	.word 0xc5e2901f  ! 942: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba98bf  ! 943: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc692907f  ! 944: LDUHA_R	lduha	[%r10, %r31] 0x83, %r3
	.word 0xcc42c01f  ! 945: LDSW_R	ldsw	[%r11 + %r31], %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3ba987f  ! 946: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc59ae038  ! 947: LDDFA_I	ldda	[%r11, 0x0038], %f2
	.word 0xc5e2d01f  ! 948: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xc5bad85f  ! 949: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 950: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd39aa070  ! 951: LDDFA_I	ldda	[%r10, 0x0070], %f9
	.word 0xc9f2e01f  ! 952: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc68a901f  ! 953: LDUBA_R	lduba	[%r10, %r31] 0x80, %r3
	.word 0xd0cae025  ! 954: LDSBA_I	ldsba	[%r11, + 0x0025] %asi, %r8
	.word 0xcfba98bf  ! 955: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc9aa068  ! 956: LDDA_I	ldda	[%r10, + 0x0068] %asi, %r6
	.word 0xcbba98bf  ! 957: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa040  ! 958: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xcbba99bf  ! 959: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xce0a801f  ! 960: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc03aa040  ! 961: STD_I	std	%r0, [%r10 + 0x0040]
	.word 0xc3e2913f  ! 962: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc3ba981f  ! 963: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd25ac01f  ! 964: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xd05a801f  ! 965: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc01ae040  ! 966: LDD_I	ldd	[%r11 + 0x0040], %r0
	.word 0xcdba985f  ! 967: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 968: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba991f  ! 969: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 970: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcad2917f  ! 971: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r5
	.word 0xcbba993f  ! 972: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba987f  ! 973: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc60aa034  ! 974: LDUB_I	ldub	[%r10 + 0x0034], %r3
	.word 0xd3ba99bf  ! 975: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL975:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3e2901f  ! 976: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3f2a01f  ! 977: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03aa058  ! 978: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3f2a01f  ! 979: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 980: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3ba993f  ! 981: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2913f  ! 982: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba993f  ! 983: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 984: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 985: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc2d2d11f  ! 986: LDSHA_R	ldsha	[%r11, %r31] 0x88, %r1
	.word 0xc9ba989f  ! 987: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc41aa060  ! 988: LDD_I	ldd	[%r10 + 0x0060], %r2
	.word 0xcde2e01f  ! 989: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xc59aa020  ! 990: LDDFA_I	ldda	[%r10, 0x0020], %f2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc682a02c  ! 991: LDUWA_I	lduwa	[%r10, + 0x002c] %asi, %r3
	.word 0xd122801f  ! 992: STF_R	st	%f8, [%r31, %r10]
	.word 0xd19ae030  ! 993: LDDFA_I	ldda	[%r11, 0x0030], %f8
	.word 0xcb02e01c  ! 994: LDF_I	ld	[%r11, 0x001c], %f5
	.word 0xc7f2d13f  ! 995: CASXA_I	casxa	[%r11] 0x89, %r31, %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcd22801f  ! 996: STF_R	st	%f6, [%r31, %r10]
	.word 0xcbbae038  ! 997: STDFA_I	stda	%f5, [0x0038, %r11]
	.word 0xc9f2901f  ! 998: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2913f  ! 999: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc59aa008  ! 1000: LDDFA_I	ldda	[%r10, 0x0008], %f2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	subcc %r30, 1, %r30
	bnz  TH4_LOOP_START
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	add	%g0,	0x1,	%r30
TH3_LOOP_START:
	.word 0xc9ba993f  ! 1: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc8dad13f  ! 2: LDXA_R	ldxa	[%r11, %r31] 0x89, %r4
	.word 0xc80aa051  ! 3: LDUB_I	ldub	[%r10 + 0x0051], %r4
	.word 0xc89aa010  ! 4: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r4
	.word 0xc5f2d13f  ! 5: CASXA_I	casxa	[%r11] 0x89, %r31, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc84a801f  ! 6: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xc99aa008  ! 7: LDDFA_I	ldda	[%r10, 0x0008], %f4
	.word 0xcdba989f  ! 8: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2911f  ! 9: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xd1baa060  ! 10: STDFA_I	stda	%f8, [0x0060, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xce5aa018  ! 11: LDX_I	ldx	[%r10 + 0x0018], %r7
	.word 0xcff2d11f  ! 12: CASXA_I	casxa	[%r11] 0x88, %r31, %r7
	.word 0xcfbad97f  ! 13: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad99f  ! 14: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad8bf  ! 15: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc64ac01f  ! 16: LDSB_R	ldsb	[%r11 + %r31], %r3
	.word 0xccdaa048  ! 17: LDXA_I	ldxa	[%r10, + 0x0048] %asi, %r6
	.word 0xc812a02e  ! 18: LDUH_I	lduh	[%r10 + 0x002e], %r4
	.word 0xc7ba999f  ! 19: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 20: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc2c2901f  ! 21: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r1
	.word 0xc5f2903f  ! 22: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xca42801f  ! 23: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xd1bad99f  ! 24: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc302801f  ! 25: LDF_R	ld	[%r10, %r31], %f1
TH_LABEL25:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd252a046  ! 26: LDSH_I	ldsh	[%r10 + 0x0046], %r9
	.word 0xce02a05c  ! 27: LDUW_I	lduw	[%r10 + 0x005c], %r7
	.word 0xc5e2a01f  ! 28: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2913f  ! 29: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5e2a01f  ! 30: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5ba995f  ! 31: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc612e05c  ! 32: LDUH_I	lduh	[%r11 + 0x005c], %r3
	.word 0xc7ba991f  ! 33: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 34: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7f2a01f  ! 35: CASXA_R	casxa	[%r10]%asi, %r31, %r3
TH_LABEL35:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9baa028  ! 36: STDFA_I	stda	%f4, [0x0028, %r10]
	.word 0xd03aa040  ! 37: STD_I	std	%r8, [%r10 + 0x0040]
	.word 0xd3ba981f  ! 38: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 39: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xceda915f  ! 40: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r7
TH_LABEL40:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc492a072  ! 41: LDUHA_I	lduha	[%r10, + 0x0072] %asi, %r2
	.word 0xd28ad07f  ! 42: LDUBA_R	lduba	[%r11, %r31] 0x83, %r9
	.word 0xc9f2903f  ! 43: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc242801f  ! 44: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xc83ac01f  ! 45: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9e2d11f  ! 46: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xc83ae068  ! 47: STD_I	std	%r4, [%r11 + 0x0068]
	.word 0xc9bad81f  ! 48: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 49: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2e01f  ! 50: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd0c2915f  ! 51: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r8
	.word 0xd1ba989f  ! 52: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc482901f  ! 53: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r2
	.word 0xd002a078  ! 54: LDUW_I	lduw	[%r10 + 0x0078], %r8
	.word 0xd03ac01f  ! 55: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3f2d03f  ! 56: CASXA_I	casxa	[%r11] 0x81, %r31, %r9
	.word 0xcc92d01f  ! 57: LDUHA_R	lduha	[%r11, %r31] 0x80, %r6
	.word 0xcbbae058  ! 58: STDFA_I	stda	%f5, [0x0058, %r11]
	.word 0xcfbad85f  ! 59: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d01f  ! 60: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfbad89f  ! 61: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd39aa068  ! 62: LDDFA_I	ldda	[%r10, 0x0068], %f9
	.word 0xd2cad11f  ! 63: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r9
	.word 0xcc3a801f  ! 64: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc99aa010  ! 65: LDDFA_I	ldda	[%r10, 0x0010], %f4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdf2a01f  ! 66: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc3a801f  ! 67: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba999f  ! 68: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xccd2a05c  ! 69: LDSHA_I	ldsha	[%r10, + 0x005c] %asi, %r6
	.word 0xcd02a07c  ! 70: LDF_I	ld	[%r10, 0x007c], %f6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcd02801f  ! 71: LDF_R	ld	[%r10, %r31], %f6
	.word 0xcde2a01f  ! 72: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2913f  ! 73: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xca02801f  ! 74: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xcc3aa000  ! 75: STD_I	std	%r6, [%r10 + 0x0000]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd08ad03f  ! 76: LDUBA_R	lduba	[%r11, %r31] 0x81, %r8
	.word 0xc9bad9bf  ! 77: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc922801f  ! 78: STF_R	st	%f4, [%r31, %r10]
	.word 0xc6c2a014  ! 79: LDSWA_I	ldswa	[%r10, + 0x0014] %asi, %r3
	.word 0xcfbaa050  ! 80: STDFA_I	stda	%f7, [0x0050, %r10]
TH_LABEL80:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcad2d01f  ! 81: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r5
	.word 0xc292915f  ! 82: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r1
	.word 0xc9ba993f  ! 83: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 84: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83aa070  ! 85: STD_I	std	%r4, [%r10 + 0x0070]
TH_LABEL85:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcadaa060  ! 86: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r5
	.word 0xc5bad9bf  ! 87: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc252e058  ! 88: LDSH_I	ldsh	[%r11 + 0x0058], %r1
	.word 0xc5ba99bf  ! 89: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 90: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5ba987f  ! 91: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 92: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xce92e060  ! 93: LDUHA_I	lduha	[%r11, + 0x0060] %asi, %r7
	.word 0xc03aa058  ! 94: STD_I	std	%r0, [%r10 + 0x0058]
	.word 0xce12801f  ! 95: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3ba98bf  ! 96: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba997f  ! 97: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2901f  ! 98: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba983f  ! 99: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc6d2a040  ! 100: LDSHA_I	ldsha	[%r10, + 0x0040] %asi, %r3
TH_LABEL100:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc8dae040  ! 101: LDXA_I	ldxa	[%r11, + 0x0040] %asi, %r4
	.word 0xcc3aa060  ! 102: STD_I	std	%r6, [%r10 + 0x0060]
	.word 0xc9bae048  ! 103: STDFA_I	stda	%f4, [0x0048, %r11]
	.word 0xd252a028  ! 104: LDSH_I	ldsh	[%r10 + 0x0028], %r9
	.word 0xc65a801f  ! 105: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9baa070  ! 106: STDFA_I	stda	%f4, [0x0070, %r10]
	.word 0xc5ba997f  ! 107: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2911f  ! 108: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc39aa050  ! 109: LDDFA_I	ldda	[%r10, 0x0050], %f1
	.word 0xc5ba989f  ! 110: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc43a801f  ! 111: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc902a064  ! 112: LDF_I	ld	[%r10, 0x0064], %f4
	.word 0xd002801f  ! 113: LDUW_R	lduw	[%r10 + %r31], %r8
	.word 0xcbf2a01f  ! 114: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba987f  ! 115: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcd02801f  ! 116: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc3e2e01f  ! 117: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d11f  ! 118: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xc3e2e01f  ! 119: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3e2d11f  ! 120: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3f2d13f  ! 121: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xc3f2e01f  ! 122: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad87f  ! 123: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3baa048  ! 124: STDFA_I	stda	%f1, [0x0048, %r10]
	.word 0xcbba981f  ! 125: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL125:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbba999f  ! 126: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba997f  ! 127: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba993f  ! 128: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xced2a01a  ! 129: LDSHA_I	ldsha	[%r10, + 0x001a] %asi, %r7
	.word 0xcdbad81f  ! 130: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc3ae060  ! 131: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xce8ad17f  ! 132: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r7
	.word 0xd1ba993f  ! 133: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2911f  ! 134: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xd1e2a01f  ! 135: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03aa060  ! 136: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd1e2a01f  ! 137: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd092915f  ! 138: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r8
	.word 0xcbbaa040  ! 139: STDFA_I	stda	%f5, [0x0040, %r10]
	.word 0xcc92d15f  ! 140: LDUHA_R	lduha	[%r11, %r31] 0x8a, %r6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc642a054  ! 141: LDSW_I	ldsw	[%r10 + 0x0054], %r3
	.word 0xcfbad85f  ! 142: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd0c2d03f  ! 143: LDSWA_R	ldswa	[%r11, %r31] 0x81, %r8
	.word 0xc3ba98bf  ! 144: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 145: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3ba991f  ! 146: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd302801f  ! 147: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc9bad8bf  ! 148: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 149: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd04ae066  ! 150: LDSB_I	ldsb	[%r11 + 0x0066], %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd012a056  ! 151: LDUH_I	lduh	[%r10 + 0x0056], %r8
	.word 0xcc3aa060  ! 152: STD_I	std	%r6, [%r10 + 0x0060]
	.word 0xc4ca917f  ! 153: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r2
	.word 0xcbf2e01f  ! 154: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbf2d11f  ! 155: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc8ad07f  ! 156: LDUBA_R	lduba	[%r11, %r31] 0x83, %r6
	.word 0xd05aa000  ! 157: LDX_I	ldx	[%r10 + 0x0000], %r8
	.word 0xc9f2e01f  ! 158: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 159: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc48a913f  ! 160: LDUBA_R	lduba	[%r10, %r31] 0x89, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7bae078  ! 161: STDFA_I	stda	%f3, [0x0078, %r11]
	.word 0xcc92913f  ! 162: LDUHA_R	lduha	[%r10, %r31] 0x89, %r6
	.word 0xcbba983f  ! 163: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 164: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2903f  ! 165: CASA_I	casa	[%r10] 0x81, %r31, %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbf2a01f  ! 166: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xc6c2917f  ! 167: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r3
	.word 0xcbf2e01f  ! 168: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xd08aa05c  ! 169: LDUBA_I	lduba	[%r10, + 0x005c] %asi, %r8
	.word 0xc5ba999f  ! 170: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc43aa078  ! 171: STD_I	std	%r2, [%r10 + 0x0078]
	.word 0xc99ae018  ! 172: LDDFA_I	ldda	[%r11, 0x0018], %f4
	.word 0xc25aa038  ! 173: LDX_I	ldx	[%r10 + 0x0038], %r1
	.word 0xd3f2e01f  ! 174: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2e01f  ! 175: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3f2d01f  ! 176: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd3bad83f  ! 177: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc4c2d15f  ! 178: LDSWA_R	ldswa	[%r11, %r31] 0x8a, %r2
	.word 0xc3ba98bf  ! 179: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd04ae04b  ! 180: LDSB_I	ldsb	[%r11 + 0x004b], %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3e2901f  ! 181: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3f2a01f  ! 182: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba999f  ! 183: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba997f  ! 184: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcc02a008  ! 185: LDUW_I	lduw	[%r10 + 0x0008], %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc43aa048  ! 186: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc5e2a01f  ! 187: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xd102a060  ! 188: LDF_I	ld	[%r10, 0x0060], %f8
	.word 0xc802c01f  ! 189: LDUW_R	lduw	[%r11 + %r31], %r4
	.word 0xc252801f  ! 190: LDSH_R	ldsh	[%r10 + %r31], %r1
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcb9aa020  ! 191: LDDFA_I	ldda	[%r10, 0x0020], %f5
	.word 0xc44a801f  ! 192: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xcbba989f  ! 193: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 194: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbf2a01f  ! 195: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcbf2901f  ! 196: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xcf22801f  ! 197: STF_R	st	%f7, [%r31, %r10]
	.word 0xc80ac01f  ! 198: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xcd9aa050  ! 199: LDDFA_I	ldda	[%r10, 0x0050], %f6
	.word 0xd1ba989f  ! 200: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc59aa000  ! 201: LDDFA_I	ldda	[%r10, 0x0000], %f2
	.word 0xd302c01f  ! 202: LDF_R	ld	[%r11, %r31], %f9
	.word 0xc45a801f  ! 203: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xcfba997f  ! 204: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc722801f  ! 205: STF_R	st	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7ba981f  ! 206: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd1bae038  ! 207: STDFA_I	stda	%f8, [0x0038, %r11]
	.word 0xca82a020  ! 208: LDUWA_I	lduwa	[%r10, + 0x0020] %asi, %r5
	.word 0xcdf2a01f  ! 209: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba985f  ! 210: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd19aa038  ! 211: LDDFA_I	ldda	[%r10, 0x0038], %f8
	.word 0xc03ac01f  ! 212: STD_R	std	%r0, [%r11 + %r31]
	.word 0xca42e028  ! 213: LDSW_I	ldsw	[%r11 + 0x0028], %r5
	.word 0xd1bae060  ! 214: STDFA_I	stda	%f8, [0x0060, %r11]
	.word 0xc83aa048  ! 215: STD_I	std	%r4, [%r10 + 0x0048]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc692d15f  ! 216: LDUHA_R	lduha	[%r11, %r31] 0x8a, %r3
	.word 0xd092a010  ! 217: LDUHA_I	lduha	[%r10, + 0x0010] %asi, %r8
	.word 0xd042c01f  ! 218: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xd39ae068  ! 219: LDDFA_I	ldda	[%r11, 0x0068], %f9
	.word 0xd242e070  ! 220: LDSW_I	ldsw	[%r11 + 0x0070], %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcacad05f  ! 221: LDSBA_R	ldsba	[%r11, %r31] 0x82, %r5
	.word 0xcde2901f  ! 222: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xc5baa030  ! 223: STDFA_I	stda	%f2, [0x0030, %r10]
	.word 0xc902c01f  ! 224: LDF_R	ld	[%r11, %r31], %f4
	.word 0xd01a801f  ! 225: LDD_R	ldd	[%r10 + %r31], %r8
TH_LABEL225:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd03ac01f  ! 226: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad83f  ! 227: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 228: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad93f  ! 229: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad93f  ! 230: STDFA_R	stda	%f9, [%r31, %r11]
TH_LABEL230:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3bad95f  ! 231: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 232: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 233: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad9bf  ! 234: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd202a028  ! 235: LDUW_I	lduw	[%r10 + 0x0028], %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1ba99bf  ! 236: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 237: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xce42e048  ! 238: LDSW_I	ldsw	[%r11 + 0x0048], %r7
	.word 0xc7e2901f  ! 239: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba981f  ! 240: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc1aa030  ! 241: LDD_I	ldd	[%r10 + 0x0030], %r6
	.word 0xce8a915f  ! 242: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r7
	.word 0xd302e054  ! 243: LDF_I	ld	[%r11, 0x0054], %f9
	.word 0xd3bad8bf  ! 244: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 245: STDFA_R	stda	%f9, [%r31, %r11]
TH_LABEL245:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc40ac01f  ! 246: LDUB_R	ldub	[%r11 + %r31], %r2
	.word 0xc28ae049  ! 247: LDUBA_I	lduba	[%r11, + 0x0049] %asi, %r1
	.word 0xd1baa078  ! 248: STDFA_I	stda	%f8, [0x0078, %r10]
	.word 0xd302801f  ! 249: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc5e2a01f  ! 250: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc812801f  ! 251: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xccc2915f  ! 252: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r6
	.word 0xd1ba999f  ! 253: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2911f  ! 254: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xd1e2901f  ! 255: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xca8a905f  ! 256: LDUBA_R	lduba	[%r10, %r31] 0x82, %r5
	.word 0xc3f2d11f  ! 257: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xc3bad81f  ! 258: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad83f  ! 259: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 260: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcad2a056  ! 261: LDSHA_I	ldsha	[%r10, + 0x0056] %asi, %r5
	.word 0xc8c2a048  ! 262: LDSWA_I	ldswa	[%r10, + 0x0048] %asi, %r4
	.word 0xc60a801f  ! 263: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xd3f2a01f  ! 264: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2901f  ! 265: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3ba985f  ! 266: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc41a801f  ! 267: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc48aa018  ! 268: LDUBA_I	lduba	[%r10, + 0x0018] %asi, %r2
	.word 0xcd9aa038  ! 269: LDDFA_I	ldda	[%r10, 0x0038], %f6
	.word 0xd012a076  ! 270: LDUH_I	lduh	[%r10 + 0x0076], %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd242801f  ! 271: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xc4d2a050  ! 272: LDSHA_I	ldsha	[%r10, + 0x0050] %asi, %r2
	.word 0xc3f2d03f  ! 273: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xc3bad89f  ! 274: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad83f  ! 275: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcdbaa040  ! 276: STDFA_I	stda	%f6, [0x0040, %r10]
	.word 0xd322801f  ! 277: STF_R	st	%f9, [%r31, %r10]
	.word 0xcf9aa060  ! 278: LDDFA_I	ldda	[%r10, 0x0060], %f7
	.word 0xd0da915f  ! 279: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r8
	.word 0xcdba997f  ! 280: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdf2903f  ! 281: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xcdf2901f  ! 282: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdf2901f  ! 283: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xd082a010  ! 284: LDUWA_I	lduwa	[%r10, + 0x0010] %asi, %r8
	.word 0xc9ba997f  ! 285: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9e2a01f  ! 286: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83aa008  ! 287: STD_I	std	%r4, [%r10 + 0x0008]
	.word 0xc9ba987f  ! 288: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2911f  ! 289: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc842801f  ! 290: LDSW_R	ldsw	[%r10 + %r31], %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd03a801f  ! 291: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1e2a01f  ! 292: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc6d2e046  ! 293: LDSHA_I	ldsha	[%r11, + 0x0046] %asi, %r3
	.word 0xc7f2e01f  ! 294: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad85f  ! 295: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7bad99f  ! 296: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae028  ! 297: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc7bad87f  ! 298: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xcad2911f  ! 299: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r5
	.word 0xd03a801f  ! 300: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1ba989f  ! 301: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd082a06c  ! 302: LDUWA_I	lduwa	[%r10, + 0x006c] %asi, %r8
	.word 0xd3e2a01f  ! 303: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 304: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba991f  ! 305: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcdbaa030  ! 306: STDFA_I	stda	%f6, [0x0030, %r10]
	.word 0xcbbae050  ! 307: STDFA_I	stda	%f5, [0x0050, %r11]
	.word 0xcc3ac01f  ! 308: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcdf2d01f  ! 309: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad91f  ! 310: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd19aa040  ! 311: LDDFA_I	ldda	[%r10, 0x0040], %f8
	.word 0xcfba989f  ! 312: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xce8a905f  ! 313: LDUBA_R	lduba	[%r10, %r31] 0x82, %r7
	.word 0xc45a801f  ! 314: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xcc3aa078  ! 315: STD_I	std	%r6, [%r10 + 0x0078]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcedaa028  ! 316: LDXA_I	ldxa	[%r10, + 0x0028] %asi, %r7
	.word 0xcc52801f  ! 317: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xc83aa078  ! 318: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xcbe2901f  ! 319: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xd042e058  ! 320: LDSW_I	ldsw	[%r11 + 0x0058], %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd0daa050  ! 321: LDXA_I	ldxa	[%r10, + 0x0050] %asi, %r8
	.word 0xd3f2911f  ! 322: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd3ba981f  ! 323: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 324: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xcf02a044  ! 325: LDF_I	ld	[%r10, 0x0044], %f7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdbad81f  ! 326: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xce8ae074  ! 327: LDUBA_I	lduba	[%r11, + 0x0074] %asi, %r7
	.word 0xc03ae030  ! 328: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xc3e2e01f  ! 329: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d13f  ! 330: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
TH_LABEL330:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc03ae030  ! 331: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xc3f2e01f  ! 332: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad87f  ! 333: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd282e07c  ! 334: LDUWA_I	lduwa	[%r11, + 0x007c] %asi, %r9
	.word 0xcfe2a01f  ! 335: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfe2a01f  ! 336: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xd1baa028  ! 337: STDFA_I	stda	%f8, [0x0028, %r10]
	.word 0xcdf2a01f  ! 338: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc482d03f  ! 339: LDUWA_R	lduwa	[%r11, %r31] 0x81, %r2
	.word 0xc5e2d03f  ! 340: CASA_I	casa	[%r11] 0x81, %r31, %r2
TH_LABEL340:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd20a801f  ! 341: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xcdba987f  ! 342: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc802801f  ! 343: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xc41ae040  ! 344: LDD_I	ldd	[%r11 + 0x0040], %r2
	.word 0xc9ba991f  ! 345: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9ba98bf  ! 346: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc282a06c  ! 347: LDUWA_I	lduwa	[%r10, + 0x006c] %asi, %r1
	.word 0xc7ba987f  ! 348: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 349: STD_R	std	%r2, [%r10 + %r31]
	.word 0xcecad03f  ! 350: LDSBA_R	ldsba	[%r11, %r31] 0x81, %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd242801f  ! 351: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xce8a901f  ! 352: LDUBA_R	lduba	[%r10, %r31] 0x80, %r7
	.word 0xc882e020  ! 353: LDUWA_I	lduwa	[%r11, + 0x0020] %asi, %r4
	.word 0xcc5a801f  ! 354: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xcdba999f  ! 355: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdba983f  ! 356: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 357: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcde2901f  ! 358: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xcde2a01f  ! 359: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xd302a064  ! 360: LDF_I	ld	[%r10, 0x0064], %f9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3e2a01f  ! 361: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3e2901f  ! 362: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba981f  ! 363: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 364: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xca5ac01f  ! 365: LDX_R	ldx	[%r11 + %r31], %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7ba981f  ! 366: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa010  ! 367: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xd04a801f  ! 368: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xcfe2903f  ! 369: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcfe2a01f  ! 370: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcff2a01f  ! 371: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcc3aa010  ! 372: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xccd2e010  ! 373: LDSHA_I	ldsha	[%r11, + 0x0010] %asi, %r6
	.word 0xc3e2a01f  ! 374: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba981f  ! 375: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd2caa04e  ! 376: LDSBA_I	ldsba	[%r10, + 0x004e] %asi, %r9
	.word 0xcbba981f  ! 377: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba993f  ! 378: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba993f  ! 379: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2901f  ! 380: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
TH_LABEL380:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc242e054  ! 381: LDSW_I	ldsw	[%r11 + 0x0054], %r1
	.word 0xcfe2a01f  ! 382: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcc3aa038  ! 383: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcfe2903f  ! 384: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcfba983f  ! 385: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfba99bf  ! 386: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc302a068  ! 387: LDF_I	ld	[%r10, 0x0068], %f1
	.word 0xc43a801f  ! 388: STD_R	std	%r2, [%r10 + %r31]
	.word 0xcecaa020  ! 389: LDSBA_I	ldsba	[%r10, + 0x0020] %asi, %r7
	.word 0xc502801f  ! 390: LDF_R	ld	[%r10, %r31], %f2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdbaa068  ! 391: STDFA_I	stda	%f6, [0x0068, %r10]
	.word 0xcdba99bf  ! 392: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc202801f  ! 393: LDUW_R	lduw	[%r10 + %r31], %r1
	.word 0xcfba989f  ! 394: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 395: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL395:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfba983f  ! 396: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2903f  ! 397: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xc692d03f  ! 398: LDUHA_R	lduha	[%r11, %r31] 0x81, %r3
	.word 0xd28ad17f  ! 399: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r9
	.word 0xce12e018  ! 400: LDUH_I	lduh	[%r11 + 0x0018], %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcde2901f  ! 401: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xcc3a801f  ! 402: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba995f  ! 403: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd01aa068  ! 404: LDD_I	ldd	[%r10 + 0x0068], %r8
	.word 0xcecaa07b  ! 405: LDSBA_I	ldsba	[%r10, + 0x007b] %asi, %r7
TH_LABEL405:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcd9aa068  ! 406: LDDFA_I	ldda	[%r10, 0x0068], %f6
	.word 0xcdf2a01f  ! 407: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba993f  ! 408: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcacaa079  ! 409: LDSBA_I	ldsba	[%r10, + 0x0079] %asi, %r5
	.word 0xd3ba995f  ! 410: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1baa078  ! 411: STDFA_I	stda	%f8, [0x0078, %r10]
	.word 0xc88aa008  ! 412: LDUBA_I	lduba	[%r10, + 0x0008] %asi, %r4
	.word 0xc302a05c  ! 413: LDF_I	ld	[%r10, 0x005c], %f1
	.word 0xcff2e01f  ! 414: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xca8ae03d  ! 415: LDUBA_I	lduba	[%r11, + 0x003d] %asi, %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc03ae000  ! 416: STD_I	std	%r0, [%r11 + 0x0000]
	.word 0xc7baa068  ! 417: STDFA_I	stda	%f3, [0x0068, %r10]
	.word 0xd3e2a01f  ! 418: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 419: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3e2a01f  ! 420: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3ba99bf  ! 421: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc2da913f  ! 422: LDXA_R	ldxa	[%r10, %r31] 0x89, %r1
	.word 0xd1e2903f  ! 423: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xcc9aa020  ! 424: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r6
	.word 0xc83ac01f  ! 425: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbbad91f  ! 426: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd39aa030  ! 427: LDDFA_I	ldda	[%r10, 0x0030], %f9
	.word 0xd122801f  ! 428: STF_R	st	%f8, [%r31, %r10]
	.word 0xd3bad97f  ! 429: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd1bae008  ! 430: STDFA_I	stda	%f8, [0x0008, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcd02a024  ! 431: LDF_I	ld	[%r10, 0x0024], %f6
	.word 0xc49aa070  ! 432: LDDA_I	ldda	[%r10, + 0x0070] %asi, %r2
	.word 0xc3bad99f  ! 433: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d01f  ! 434: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc03ac01f  ! 435: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3bad87f  ! 436: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad95f  ! 437: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 438: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d01f  ! 439: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc03ac01f  ! 440: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3f2d13f  ! 441: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xca8ad01f  ! 442: LDUBA_R	lduba	[%r11, %r31] 0x80, %r5
	.word 0xc902e048  ! 443: LDF_I	ld	[%r11, 0x0048], %f4
	.word 0xc5f2d01f  ! 444: CASXA_I	casxa	[%r11] 0x80, %r31, %r2
	.word 0xc5bad89f  ! 445: STDFA_R	stda	%f2, [%r31, %r11]
TH_LABEL445:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5bad85f  ! 446: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd3bae028  ! 447: STDFA_I	stda	%f9, [0x0028, %r11]
	.word 0xd1ba995f  ! 448: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2911f  ! 449: CASXA_I	casxa	[%r10] 0x88, %r31, %r8
	.word 0xd1f2a01f  ! 450: CASXA_R	casxa	[%r10]%asi, %r31, %r8
TH_LABEL450:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcb22801f  ! 451: STF_R	st	%f5, [%r31, %r10]
	.word 0xd3ba981f  ! 452: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd20ac01f  ! 453: LDUB_R	ldub	[%r11 + %r31], %r9
	.word 0xca02a078  ! 454: LDUW_I	lduw	[%r10 + 0x0078], %r5
	.word 0xd3ba999f  ! 455: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc24ac01f  ! 456: LDSB_R	ldsb	[%r11 + %r31], %r1
	.word 0xc83a801f  ! 457: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbf2a01f  ! 458: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2901f  ! 459: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xd19aa048  ! 460: LDDFA_I	ldda	[%r10, 0x0048], %f8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7e2a01f  ! 461: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc43a801f  ! 462: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7f2901f  ! 463: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba991f  ! 464: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 465: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7ba981f  ! 466: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd0c2a014  ! 467: LDSWA_I	ldswa	[%r10, + 0x0014] %asi, %r8
	.word 0xc64ae02e  ! 468: LDSB_I	ldsb	[%r11 + 0x002e], %r3
	.word 0xcf9aa038  ! 469: LDDFA_I	ldda	[%r10, 0x0038], %f7
	.word 0xc88aa040  ! 470: LDUBA_I	lduba	[%r10, + 0x0040] %asi, %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcacaa041  ! 471: LDSBA_I	ldsba	[%r10, + 0x0041] %asi, %r5
	.word 0xc5ba997f  ! 472: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcd02801f  ! 473: LDF_R	ld	[%r10, %r31], %f6
	.word 0xc7f2903f  ! 474: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc7f2a01f  ! 475: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc7ba981f  ! 476: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 477: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd2c2913f  ! 478: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r9
	.word 0xc3ba987f  ! 479: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc6dad07f  ! 480: LDXA_R	ldxa	[%r11, %r31] 0x83, %r3
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbbad95f  ! 481: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc5baa050  ! 482: STDFA_I	stda	%f2, [0x0050, %r10]
	.word 0xc3ba987f  ! 483: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 484: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc03aa008  ! 485: STD_I	std	%r0, [%r10 + 0x0008]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcb02e044  ! 486: LDF_I	ld	[%r11, 0x0044], %f5
	.word 0xc7bad9bf  ! 487: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad97f  ! 488: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae078  ! 489: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xc412a066  ! 490: LDUH_I	lduh	[%r10 + 0x0066], %r2
TH_LABEL490:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc3ae030  ! 491: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcdbad81f  ! 492: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad83f  ! 493: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2d13f  ! 494: CASA_I	casa	[%r11] 0x89, %r31, %r6
	.word 0xcdbad9bf  ! 495: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc88a917f  ! 496: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r4
	.word 0xc7ba99bf  ! 497: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2911f  ! 498: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xcc1ac01f  ! 499: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xcfba981f  ! 500: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfba985f  ! 501: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba995f  ! 502: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2911f  ! 503: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcff2a01f  ! 504: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc09aa048  ! 505: LDDA_I	ldda	[%r10, + 0x0048] %asi, %r0
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1ba983f  ! 506: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa000  ! 507: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd1ba985f  ! 508: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xcf02801f  ! 509: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc03a801f  ! 510: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc722801f  ! 511: STF_R	st	%f3, [%r31, %r10]
	.word 0xcbba991f  ! 512: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 513: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc502801f  ! 514: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcd9aa048  ! 515: LDDFA_I	ldda	[%r10, 0x0048], %f6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc6d2d05f  ! 516: LDSHA_R	ldsha	[%r11, %r31] 0x82, %r3
	.word 0xd39aa018  ! 517: LDDFA_I	ldda	[%r10, 0x0018], %f9
	.word 0xc702801f  ! 518: LDF_R	ld	[%r10, %r31], %f3
	.word 0xcbbae060  ! 519: STDFA_I	stda	%f5, [0x0060, %r11]
	.word 0xcff2a01f  ! 520: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfe2901f  ! 521: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcfba991f  ! 522: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 523: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 524: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xd05ac01f  ! 525: LDX_R	ldx	[%r11 + %r31], %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1ba985f  ! 526: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 527: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba997f  ! 528: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 529: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba985f  ! 530: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1e2a01f  ! 531: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 532: STD_R	std	%r8, [%r10 + %r31]
	.word 0xcc8aa025  ! 533: LDUBA_I	lduba	[%r10, + 0x0025] %asi, %r6
	.word 0xca52a03c  ! 534: LDSH_I	ldsh	[%r10 + 0x003c], %r5
	.word 0xcfba999f  ! 535: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfe2a01f  ! 536: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2901f  ! 537: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcc3a801f  ! 538: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba99bf  ! 539: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba98bf  ! 540: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1bae058  ! 541: STDFA_I	stda	%f8, [0x0058, %r11]
	.word 0xcbba995f  ! 542: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 543: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba995f  ! 544: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba997f  ! 545: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbba991f  ! 546: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba997f  ! 547: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba991f  ! 548: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc2daa060  ! 549: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r1
	.word 0xd1baa028  ! 550: STDFA_I	stda	%f8, [0x0028, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbf2913f  ! 551: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xc83aa038  ! 552: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xcbf2a01f  ! 553: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xccdaa010  ! 554: LDXA_I	ldxa	[%r10, + 0x0010] %asi, %r6
	.word 0xc5ba983f  ! 555: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5e2911f  ! 556: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5ba993f  ! 557: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba98bf  ! 558: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 559: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc702e038  ! 560: LDF_I	ld	[%r11, 0x0038], %f3
TH_LABEL560:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7ba985f  ! 561: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd252c01f  ! 562: LDSH_R	ldsh	[%r11 + %r31], %r9
	.word 0xd28aa05c  ! 563: LDUBA_I	lduba	[%r10, + 0x005c] %asi, %r9
	.word 0xc80a801f  ! 564: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xc7ba991f  ! 565: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc612801f  ! 566: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xc43aa058  ! 567: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc7ba99bf  ! 568: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 569: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc812e040  ! 570: LDUH_I	lduh	[%r11 + 0x0040], %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1f2d01f  ! 571: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xd1f2d11f  ! 572: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xd1e2e01f  ! 573: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xc79aa068  ! 574: LDDFA_I	ldda	[%r10, 0x0068], %f3
	.word 0xc81ae000  ! 575: LDD_I	ldd	[%r11 + 0x0000], %r4
TH_LABEL575:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd03aa040  ! 576: STD_I	std	%r8, [%r10 + 0x0040]
	.word 0xd3ba997f  ! 577: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2913f  ! 578: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba987f  ! 579: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xca82d01f  ! 580: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r5
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5ba987f  ! 581: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba993f  ! 582: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 583: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc25ac01f  ! 584: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xcfbaa030  ! 585: STDFA_I	stda	%f7, [0x0030, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5f2911f  ! 586: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xc5ba999f  ! 587: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2911f  ! 588: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xca02e040  ! 589: LDUW_I	lduw	[%r11 + 0x0040], %r5
	.word 0xcbba985f  ! 590: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc492d17f  ! 591: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r2
	.word 0xc9bad93f  ! 592: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9f2e01f  ! 593: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xccca901f  ! 594: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r6
	.word 0xcd02801f  ! 595: LDF_R	ld	[%r10, %r31], %f6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd012e060  ! 596: LDUH_I	lduh	[%r11 + 0x0060], %r8
	.word 0xd3bad91f  ! 597: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad97f  ! 598: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad93f  ! 599: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc65aa068  ! 600: LDX_I	ldx	[%r10 + 0x0068], %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5bad89f  ! 601: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd20ae03b  ! 602: LDUB_I	ldub	[%r11 + 0x003b], %r9
	.word 0xcbbad9bf  ! 603: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc8da907f  ! 604: LDXA_R	ldxa	[%r10, %r31] 0x83, %r4
	.word 0xcc4ac01f  ! 605: LDSB_R	ldsb	[%r11 + %r31], %r6
TH_LABEL605:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7bae068  ! 606: STDFA_I	stda	%f3, [0x0068, %r11]
	.word 0xc7bad87f  ! 607: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc402c01f  ! 608: LDUW_R	lduw	[%r11 + %r31], %r2
	.word 0xd08ae03e  ! 609: LDUBA_I	lduba	[%r11, + 0x003e] %asi, %r8
	.word 0xc812a004  ! 610: LDUH_I	lduh	[%r10 + 0x0004], %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc83ae020  ! 611: STD_I	std	%r4, [%r11 + 0x0020]
	.word 0xc9bad93f  ! 612: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd01ae038  ! 613: LDD_I	ldd	[%r11 + 0x0038], %r8
	.word 0xcdbad9bf  ! 614: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc602a07c  ! 615: LDUW_I	lduw	[%r10 + 0x007c], %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3f2d01f  ! 616: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xca0aa012  ! 617: LDUB_I	ldub	[%r10 + 0x0012], %r5
	.word 0xd2cad05f  ! 618: LDSBA_R	ldsba	[%r11, %r31] 0x82, %r9
	.word 0xc4d2d15f  ! 619: LDSHA_R	ldsha	[%r11, %r31] 0x8a, %r2
	.word 0xd102801f  ! 620: LDF_R	ld	[%r10, %r31], %f8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc83ae070  ! 621: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xc45a801f  ! 622: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xd3bad9bf  ! 623: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad8bf  ! 624: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcd02c01f  ! 625: LDF_R	ld	[%r11, %r31], %f6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc83a801f  ! 626: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc64aa01f  ! 627: LDSB_I	ldsb	[%r10 + 0x001f], %r3
	.word 0xc3ba989f  ! 628: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba985f  ! 629: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 630: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc12a024  ! 631: LDUH_I	lduh	[%r10 + 0x0024], %r6
	.word 0xc9bad91f  ! 632: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xce42801f  ! 633: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xc892e076  ! 634: LDUHA_I	lduha	[%r11, + 0x0076] %asi, %r4
	.word 0xcdf2e01f  ! 635: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd2d2a03a  ! 636: LDSHA_I	ldsha	[%r10, + 0x003a] %asi, %r9
	.word 0xcff2911f  ! 637: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcff2913f  ! 638: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xcfe2901f  ! 639: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcc02c01f  ! 640: LDUW_R	lduw	[%r11 + %r31], %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfba997f  ! 641: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc09aa058  ! 642: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r0
	.word 0xc902801f  ! 643: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc702e060  ! 644: LDF_I	ld	[%r11, 0x0060], %f3
	.word 0xc842c01f  ! 645: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xca4a801f  ! 646: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xc4cad01f  ! 647: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r2
	.word 0xc9ba987f  ! 648: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba987f  ! 649: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba99bf  ! 650: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc9f2a01f  ! 651: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc83aa010  ! 652: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xc9e2901f  ! 653: CASA_I	casa	[%r10] 0x80, %r31, %r4
	.word 0xc6cae069  ! 654: LDSBA_I	ldsba	[%r11, + 0x0069] %asi, %r3
	.word 0xcad2a036  ! 655: LDSHA_I	ldsha	[%r10, + 0x0036] %asi, %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9ba989f  ! 656: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc2daa018  ! 657: LDXA_I	ldxa	[%r10, + 0x0018] %asi, %r1
	.word 0xc5e2911f  ! 658: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc24aa040  ! 659: LDSB_I	ldsb	[%r10 + 0x0040], %r1
	.word 0xcc3ae030  ! 660: STD_I	std	%r6, [%r11 + 0x0030]
TH_LABEL660:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfbad97f  ! 661: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc9bae040  ! 662: STDFA_I	stda	%f4, [0x0040, %r11]
	.word 0xd1e2e01f  ! 663: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd102e040  ! 664: LDF_I	ld	[%r11, 0x0040], %f8
	.word 0xc3ba985f  ! 665: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3ba989f  ! 666: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2911f  ! 667: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc292911f  ! 668: LDUHA_R	lduha	[%r10, %r31] 0x88, %r1
	.word 0xcac2915f  ! 669: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r5
	.word 0xca42c01f  ! 670: LDSW_R	ldsw	[%r11 + %r31], %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03ac01f  ! 671: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad85f  ! 672: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc3baa050  ! 673: STDFA_I	stda	%f1, [0x0050, %r10]
	.word 0xc5ba987f  ! 674: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa038  ! 675: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc45ae048  ! 676: LDX_I	ldx	[%r11 + 0x0048], %r2
	.word 0xd102a030  ! 677: LDF_I	ld	[%r10, 0x0030], %f8
	.word 0xc9e2e01f  ! 678: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad93f  ! 679: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 680: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9bad91f  ! 681: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d03f  ! 682: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xc83ae060  ! 683: STD_I	std	%r4, [%r11 + 0x0060]
	.word 0xcc8ae00d  ! 684: LDUBA_I	lduba	[%r11, + 0x000d] %asi, %r6
	.word 0xcadae010  ! 685: LDXA_I	ldxa	[%r11, + 0x0010] %asi, %r5
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcff2e01f  ! 686: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcfbad8bf  ! 687: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d13f  ! 688: CASXA_I	casxa	[%r11] 0x89, %r31, %r7
	.word 0xc20a801f  ! 689: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xd1ba983f  ! 690: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc65ae050  ! 691: LDX_I	ldx	[%r11 + 0x0050], %r3
	.word 0xc6c2e05c  ! 692: LDSWA_I	ldswa	[%r11, + 0x005c] %asi, %r3
	.word 0xc43ae028  ! 693: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc43ac01f  ! 694: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7bad81f  ! 695: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd00ac01f  ! 696: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xc7e2a01f  ! 697: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba981f  ! 698: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc852e052  ! 699: LDSH_I	ldsh	[%r11 + 0x0052], %r4
	.word 0xc3f2a01f  ! 700: CASXA_R	casxa	[%r10]%asi, %r31, %r1
TH_LABEL700:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3ba98bf  ! 701: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 702: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3f2a01f  ! 703: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba985f  ! 704: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 705: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3ba991f  ! 706: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba989f  ! 707: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcadaa070  ! 708: LDXA_I	ldxa	[%r10, + 0x0070] %asi, %r5
	.word 0xcc02c01f  ! 709: LDUW_R	lduw	[%r11 + %r31], %r6
	.word 0xca42e048  ! 710: LDSW_I	ldsw	[%r11 + 0x0048], %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd3e2a01f  ! 711: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3e2a01f  ! 712: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba999f  ! 713: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2911f  ! 714: CASXA_I	casxa	[%r10] 0x88, %r31, %r9
	.word 0xd03a801f  ! 715: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3f2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc292d03f  ! 717: LDUHA_R	lduha	[%r11, %r31] 0x81, %r1
	.word 0xcb9aa018  ! 718: LDDFA_I	ldda	[%r10, 0x0018], %f5
	.word 0xcf02a044  ! 719: LDF_I	ld	[%r10, 0x0044], %f7
	.word 0xd3e2d11f  ! 720: CASA_I	casa	[%r11] 0x88, %r31, %r9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfbaa060  ! 721: STDFA_I	stda	%f7, [0x0060, %r10]
	.word 0xd3ba985f  ! 722: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba993f  ! 723: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba999f  ! 724: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba987f  ! 725: STDFA_R	stda	%f9, [%r31, %r10]
TH_LABEL725:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3ba985f  ! 726: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc79aa060  ! 727: LDDFA_I	ldda	[%r10, 0x0060], %f3
	.word 0xc722801f  ! 728: STF_R	st	%f3, [%r31, %r10]
	.word 0xd3e2e01f  ! 729: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3f2d11f  ! 730: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc8a911f  ! 731: LDUBA_R	lduba	[%r10, %r31] 0x88, %r6
	.word 0xc5e2901f  ! 732: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba98bf  ! 733: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 734: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba999f  ! 735: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd052a006  ! 736: LDSH_I	ldsh	[%r10 + 0x0006], %r8
	.word 0xc3ba981f  ! 737: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xca4ac01f  ! 738: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xc7f2a01f  ! 739: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7f2903f  ! 740: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd24ae05b  ! 741: LDSB_I	ldsb	[%r11 + 0x005b], %r9
	.word 0xcfe2a01f  ! 742: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba991f  ! 743: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 744: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcc12e050  ! 745: LDUH_I	lduh	[%r11 + 0x0050], %r6
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc68ad07f  ! 746: LDUBA_R	lduba	[%r11, %r31] 0x83, %r3
	.word 0xc2daa038  ! 747: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r1
	.word 0xd002c01f  ! 748: LDUW_R	lduw	[%r11 + %r31], %r8
	.word 0xcc12801f  ! 749: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xc49aa008  ! 750: LDDA_I	ldda	[%r10, + 0x0008] %asi, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc482a01c  ! 751: LDUWA_I	lduwa	[%r10, + 0x001c] %asi, %r2
	.word 0xc5e2e01f  ! 752: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad89f  ! 753: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad89f  ! 754: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd24ae052  ! 755: LDSB_I	ldsb	[%r11 + 0x0052], %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfba991f  ! 756: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xce0a801f  ! 757: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xc9e2d01f  ! 758: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9f2d11f  ! 759: CASXA_I	casxa	[%r11] 0x88, %r31, %r4
	.word 0xcc9ae058  ! 760: LDDA_I	ldda	[%r11, + 0x0058] %asi, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcf02e028  ! 761: LDF_I	ld	[%r11, 0x0028], %f7
	.word 0xc9ba999f  ! 762: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd00ae01a  ! 763: LDUB_I	ldub	[%r11 + 0x001a], %r8
	.word 0xcb02a034  ! 764: LDF_I	ld	[%r10, 0x0034], %f5
	.word 0xc9ba983f  ! 765: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc83a801f  ! 766: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba981f  ! 767: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 768: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba993f  ! 769: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba997f  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc682a004  ! 771: LDUWA_I	lduwa	[%r10, + 0x0004] %asi, %r3
	.word 0xc702801f  ! 772: LDF_R	ld	[%r10, %r31], %f3
	.word 0xcfba98bf  ! 773: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd28aa064  ! 774: LDUBA_I	lduba	[%r10, + 0x0064] %asi, %r9
	.word 0xd01aa030  ! 775: LDD_I	ldd	[%r10 + 0x0030], %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1f2d03f  ! 776: CASXA_I	casxa	[%r11] 0x81, %r31, %r8
	.word 0xce12801f  ! 777: LDUH_R	lduh	[%r10 + %r31], %r7
	.word 0xc7f2913f  ! 778: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc7ba99bf  ! 779: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcc9aa030  ! 780: LDDA_I	ldda	[%r10, + 0x0030] %asi, %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc252c01f  ! 781: LDSH_R	ldsh	[%r11 + %r31], %r1
	.word 0xcbba99bf  ! 782: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba99bf  ! 783: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcc8ae025  ! 784: LDUBA_I	lduba	[%r11, + 0x0025] %asi, %r6
	.word 0xc48ad07f  ! 785: LDUBA_R	lduba	[%r11, %r31] 0x83, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3e2a01f  ! 786: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 787: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xcd02a00c  ! 788: LDF_I	ld	[%r10, 0x000c], %f6
	.word 0xcc8ae038  ! 789: LDUBA_I	lduba	[%r11, + 0x0038] %asi, %r6
	.word 0xd1bad8bf  ! 790: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1bad8bf  ! 791: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 792: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcc52a05e  ! 793: LDSH_I	ldsh	[%r10 + 0x005e], %r6
	.word 0xc83ac01f  ! 794: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbf2e01f  ! 795: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc79aa078  ! 796: LDDFA_I	ldda	[%r10, 0x0078], %f3
	.word 0xcdba98bf  ! 797: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 798: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc6d2915f  ! 799: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r3
	.word 0xca4aa052  ! 800: LDSB_I	ldsb	[%r10 + 0x0052], %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd1bae060  ! 801: STDFA_I	stda	%f8, [0x0060, %r11]
	.word 0xc5ba999f  ! 802: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 803: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43a801f  ! 804: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa068  ! 805: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5ba993f  ! 806: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba987f  ! 807: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc2c2913f  ! 808: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r1
	.word 0xc3baa028  ! 809: STDFA_I	stda	%f1, [0x0028, %r10]
	.word 0xced2911f  ! 810: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xca12a07c  ! 811: LDUH_I	lduh	[%r10 + 0x007c], %r5
	.word 0xc9ba989f  ! 812: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 813: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba98bf  ! 814: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd01aa048  ! 815: LDD_I	ldd	[%r10 + 0x0048], %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc2cad01f  ! 816: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r1
	.word 0xcff2a01f  ! 817: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfe2a01f  ! 818: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2903f  ! 819: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcc5aa048  ! 820: LDX_I	ldx	[%r10 + 0x0048], %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfba993f  ! 821: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcedad01f  ! 822: LDXA_R	ldxa	[%r11, %r31] 0x80, %r7
	.word 0xccdaa030  ! 823: LDXA_I	ldxa	[%r10, + 0x0030] %asi, %r6
	.word 0xc5baa068  ! 824: STDFA_I	stda	%f2, [0x0068, %r10]
	.word 0xc60a801f  ! 825: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc2c2d01f  ! 826: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r1
	.word 0xce5a801f  ! 827: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xc9ba987f  ! 828: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 829: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 830: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc83a801f  ! 831: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcad2905f  ! 832: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r5
	.word 0xca42801f  ! 833: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xc7e2a01f  ! 834: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba98bf  ! 835: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd04ac01f  ! 836: LDSB_R	ldsb	[%r11 + %r31], %r8
	.word 0xc7ba98bf  ! 837: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2901f  ! 838: CASA_I	casa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba981f  ! 839: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 840: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL840:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd28a915f  ! 841: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r9
	.word 0xc81ac01f  ! 842: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xc7ba997f  ! 843: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 844: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2a01f  ! 845: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7ba985f  ! 846: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc522c01f  ! 847: STF_R	st	%f2, [%r31, %r11]
	.word 0xc5e2913f  ! 848: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5f2901f  ! 849: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xcc1a801f  ! 850: LDD_R	ldd	[%r10 + %r31], %r6
TH_LABEL850:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd19ae038  ! 851: LDDFA_I	ldda	[%r11, 0x0038], %f8
	.word 0xd002e050  ! 852: LDUW_I	lduw	[%r11 + 0x0050], %r8
	.word 0xc7f2a01f  ! 853: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba999f  ! 854: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba995f  ! 855: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xca82a058  ! 856: LDUWA_I	lduwa	[%r10, + 0x0058] %asi, %r5
	.word 0xc5bae060  ! 857: STDFA_I	stda	%f2, [0x0060, %r11]
	.word 0xd3bad97f  ! 858: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc6ca901f  ! 859: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r3
	.word 0xc9ba995f  ! 860: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9e2a01f  ! 861: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83a801f  ! 862: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd102c01f  ! 863: LDF_R	ld	[%r11, %r31], %f8
	.word 0xc302a028  ! 864: LDF_I	ld	[%r10, 0x0028], %f1
	.word 0xd01ac01f  ! 865: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1e2911f  ! 866: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xcc52801f  ! 867: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xd3ba981f  ! 868: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc8d2e01a  ! 869: LDSHA_I	ldsha	[%r11, + 0x001a] %asi, %r4
	.word 0xcb02e050  ! 870: LDF_I	ld	[%r11, 0x0050], %f5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbba985f  ! 871: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd282911f  ! 872: LDUWA_R	lduwa	[%r10, %r31] 0x88, %r9
	.word 0xcfba985f  ! 873: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 874: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc9bae018  ! 875: STDFA_I	stda	%f4, [0x0018, %r11]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3ba983f  ! 876: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2901f  ! 877: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xd202c01f  ! 878: LDUW_R	lduw	[%r11 + %r31], %r9
	.word 0xc83ae048  ! 879: STD_I	std	%r4, [%r11 + 0x0048]
	.word 0xd092913f  ! 880: LDUHA_R	lduha	[%r10, %r31] 0x89, %r8
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7baa058  ! 881: STDFA_I	stda	%f3, [0x0058, %r10]
	.word 0xcdba995f  ! 882: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 883: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 884: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 885: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd09ae048  ! 886: LDDA_I	ldda	[%r11, + 0x0048] %asi, %r8
	.word 0xd1f2a01f  ! 887: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba995f  ! 888: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa020  ! 889: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xc49ae050  ! 890: LDDA_I	ldda	[%r11, + 0x0050] %asi, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfbad9bf  ! 891: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad81f  ! 892: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc7baa038  ! 893: STDFA_I	stda	%f3, [0x0038, %r10]
	.word 0xcbe2a01f  ! 894: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba999f  ! 895: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL895:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbba99bf  ! 896: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 897: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd242801f  ! 898: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xc8da913f  ! 899: LDXA_R	ldxa	[%r10, %r31] 0x89, %r4
	.word 0xc3bad89f  ! 900: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3bad81f  ! 901: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d01f  ! 902: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad83f  ! 903: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xccc2d13f  ! 904: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r6
	.word 0xc7ba99bf  ! 905: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL905:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcac2e050  ! 906: LDSWA_I	ldswa	[%r11, + 0x0050] %asi, %r5
	.word 0xd3f2a01f  ! 907: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc502e040  ! 908: LDF_I	ld	[%r11, 0x0040], %f2
	.word 0xcbbad91f  ! 909: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d01f  ! 910: CASA_I	casa	[%r11] 0x80, %r31, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbf2d01f  ! 911: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbf2e01f  ! 912: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad89f  ! 913: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc68aa06e  ! 914: LDUBA_I	lduba	[%r10, + 0x006e] %asi, %r3
	.word 0xd3bad99f  ! 915: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc79aa040  ! 916: LDDFA_I	ldda	[%r10, 0x0040], %f3
	.word 0xd05a801f  ! 917: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xd1bad91f  ! 918: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad87f  ! 919: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 920: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1f2e01f  ! 921: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad93f  ! 922: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d01f  ! 923: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xd03ac01f  ! 924: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2e01f  ! 925: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1bad83f  ! 926: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc79aa048  ! 927: LDDFA_I	ldda	[%r10, 0x0048], %f3
	.word 0xcdbad81f  ! 928: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 929: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcdbad9bf  ! 930: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdbad83f  ! 931: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad83f  ! 932: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad81f  ! 933: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd39aa000  ! 934: LDDFA_I	ldda	[%r10, 0x0000], %f9
	.word 0xd03aa030  ! 935: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc65a801f  ! 936: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xcdba989f  ! 937: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba989f  ! 938: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 939: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 940: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xce92d11f  ! 941: LDUHA_R	lduha	[%r11, %r31] 0x88, %r7
	.word 0xc5e2901f  ! 942: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba981f  ! 943: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd092901f  ! 944: LDUHA_R	lduha	[%r10, %r31] 0x80, %r8
	.word 0xc642801f  ! 945: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3ba987f  ! 946: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc39ae010  ! 947: LDDFA_I	ldda	[%r11, 0x0010], %f1
	.word 0xc5e2d03f  ! 948: CASA_I	casa	[%r11] 0x81, %r31, %r2
	.word 0xc5bad81f  ! 949: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 950: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd19aa060  ! 951: LDDFA_I	ldda	[%r10, 0x0060], %f8
	.word 0xc9f2e01f  ! 952: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xd28a903f  ! 953: LDUBA_R	lduba	[%r10, %r31] 0x81, %r9
	.word 0xcecaa070  ! 954: LDSBA_I	ldsba	[%r10, + 0x0070] %asi, %r7
	.word 0xcfba985f  ! 955: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc49ae040  ! 956: LDDA_I	ldda	[%r11, + 0x0040] %asi, %r2
	.word 0xcbba999f  ! 957: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa040  ! 958: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xcbba981f  ! 959: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcc0ac01f  ! 960: LDUB_R	ldub	[%r11 + %r31], %r6
TH_LABEL960:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc03aa040  ! 961: STD_I	std	%r0, [%r10 + 0x0040]
	.word 0xc3e2913f  ! 962: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc3ba999f  ! 963: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd05a801f  ! 964: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xc85a801f  ! 965: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc41aa008  ! 966: LDD_I	ldd	[%r10 + 0x0008], %r2
	.word 0xcdba989f  ! 967: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 968: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba991f  ! 969: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 970: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc4d2d01f  ! 971: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r2
	.word 0xcbba98bf  ! 972: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba987f  ! 973: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc80ae013  ! 974: LDUB_I	ldub	[%r11 + 0x0013], %r4
	.word 0xd3ba985f  ! 975: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3e2901f  ! 976: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3f2a01f  ! 977: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03aa058  ! 978: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3f2a01f  ! 979: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 980: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba985f  ! 981: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2913f  ! 982: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba991f  ! 983: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 984: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 985: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc8d2d11f  ! 986: LDSHA_R	ldsha	[%r11, %r31] 0x88, %r4
	.word 0xc9ba999f  ! 987: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc1ae078  ! 988: LDD_I	ldd	[%r11 + 0x0078], %r6
	.word 0xcde2e01f  ! 989: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xc39aa000  ! 990: LDDFA_I	ldda	[%r10, 0x0000], %f1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc482e04c  ! 991: LDUWA_I	lduwa	[%r11, + 0x004c] %asi, %r2
	.word 0xcd22c01f  ! 992: STF_R	st	%f6, [%r31, %r11]
	.word 0xd19ae028  ! 993: LDDFA_I	ldda	[%r11, 0x0028], %f8
	.word 0xcd02a054  ! 994: LDF_I	ld	[%r10, 0x0054], %f6
	.word 0xc7f2d11f  ! 995: CASXA_I	casxa	[%r11] 0x88, %r31, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcb22801f  ! 996: STF_R	st	%f5, [%r31, %r10]
	.word 0xcbbae060  ! 997: STDFA_I	stda	%f5, [0x0060, %r11]
	.word 0xc9f2913f  ! 998: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9f2901f  ! 999: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc99aa040  ! 1000: LDDFA_I	ldda	[%r10, 0x0040], %f4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
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
	.word 0xccda917f  ! 2: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r6
	.word 0xd20aa031  ! 3: LDUB_I	ldub	[%r10 + 0x0031], %r9
	.word 0xc89aa068  ! 4: LDDA_I	ldda	[%r10, + 0x0068] %asi, %r4
	.word 0xc5f2d13f  ! 5: CASXA_I	casxa	[%r11] 0x89, %r31, %r2
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc44ac01f  ! 6: LDSB_R	ldsb	[%r11 + %r31], %r2
	.word 0xd39aa048  ! 7: LDDFA_I	ldda	[%r10, 0x0048], %f9
	.word 0xcdba983f  ! 8: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2903f  ! 9: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xd3bae008  ! 10: STDFA_I	stda	%f9, [0x0008, %r11]
TH_LABEL10:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc85aa008  ! 11: LDX_I	ldx	[%r10 + 0x0008], %r4
	.word 0xcff2d03f  ! 12: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xcfbad93f  ! 13: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad85f  ! 14: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad91f  ! 15: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc64a801f  ! 16: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xc2dae020  ! 17: LDXA_I	ldxa	[%r11, + 0x0020] %asi, %r1
	.word 0xd212a00e  ! 18: LDUH_I	lduh	[%r10 + 0x000e], %r9
	.word 0xc7ba995f  ! 19: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 20: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xccc2915f  ! 21: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r6
	.word 0xc5f2913f  ! 22: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xca42801f  ! 23: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xd1bad87f  ! 24: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc702801f  ! 25: LDF_R	ld	[%r10, %r31], %f3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xce52a052  ! 26: LDSH_I	ldsh	[%r10 + 0x0052], %r7
	.word 0xc202a048  ! 27: LDUW_I	lduw	[%r10 + 0x0048], %r1
	.word 0xc5e2a01f  ! 28: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2911f  ! 29: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5e2a01f  ! 30: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5ba99bf  ! 31: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc612e040  ! 32: LDUH_I	lduh	[%r11 + 0x0040], %r3
	.word 0xc7ba997f  ! 33: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 34: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7f2a01f  ! 35: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbbaa058  ! 36: STDFA_I	stda	%f5, [0x0058, %r10]
	.word 0xd03aa040  ! 37: STD_I	std	%r8, [%r10 + 0x0040]
	.word 0xd3ba985f  ! 38: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 39: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcadad05f  ! 40: LDXA_R	ldxa	[%r11, %r31] 0x82, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd092a078  ! 41: LDUHA_I	lduha	[%r10, + 0x0078] %asi, %r8
	.word 0xc48a907f  ! 42: LDUBA_R	lduba	[%r10, %r31] 0x83, %r2
	.word 0xc9f2901f  ! 43: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc442c01f  ! 44: LDSW_R	ldsw	[%r11 + %r31], %r2
	.word 0xc83ac01f  ! 45: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc9e2d13f  ! 46: CASA_I	casa	[%r11] 0x89, %r31, %r4
	.word 0xc83ae068  ! 47: STD_I	std	%r4, [%r11 + 0x0068]
	.word 0xc9bad95f  ! 48: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 49: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2e01f  ! 50: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd0c2917f  ! 51: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r8
	.word 0xd1ba981f  ! 52: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd082d15f  ! 53: LDUWA_R	lduwa	[%r11, %r31] 0x8a, %r8
	.word 0xd002a030  ! 54: LDUW_I	lduw	[%r10 + 0x0030], %r8
	.word 0xd03ac01f  ! 55: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3f2d13f  ! 56: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xca92911f  ! 57: LDUHA_R	lduha	[%r10, %r31] 0x88, %r5
	.word 0xc5bae038  ! 58: STDFA_I	stda	%f2, [0x0038, %r11]
	.word 0xcfbad81f  ! 59: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d01f  ! 60: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
TH_LABEL60:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfbad99f  ! 61: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc79aa008  ! 62: LDDFA_I	ldda	[%r10, 0x0008], %f3
	.word 0xd2cad01f  ! 63: LDSBA_R	ldsba	[%r11, %r31] 0x80, %r9
	.word 0xcc3a801f  ! 64: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcb9aa028  ! 65: LDDFA_I	ldda	[%r10, 0x0028], %f5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdf2a01f  ! 66: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc3a801f  ! 67: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba991f  ! 68: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd2d2e016  ! 69: LDSHA_I	ldsha	[%r11, + 0x0016] %asi, %r9
	.word 0xc502a008  ! 70: LDF_I	ld	[%r10, 0x0008], %f2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcd02801f  ! 71: LDF_R	ld	[%r10, %r31], %f6
	.word 0xcde2a01f  ! 72: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2901f  ! 73: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcc02c01f  ! 74: LDUW_R	lduw	[%r11 + %r31], %r6
	.word 0xcc3aa000  ! 75: STD_I	std	%r6, [%r10 + 0x0000]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd08ad05f  ! 76: LDUBA_R	lduba	[%r11, %r31] 0x82, %r8
	.word 0xc9bad87f  ! 77: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc722801f  ! 78: STF_R	st	%f3, [%r31, %r10]
	.word 0xc6c2a060  ! 79: LDSWA_I	ldswa	[%r10, + 0x0060] %asi, %r3
	.word 0xc7baa060  ! 80: STDFA_I	stda	%f3, [0x0060, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc4d2907f  ! 81: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r2
	.word 0xd092905f  ! 82: LDUHA_R	lduha	[%r10, %r31] 0x82, %r8
	.word 0xc9ba981f  ! 83: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 84: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83aa070  ! 85: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcadaa038  ! 86: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r5
	.word 0xc5bad81f  ! 87: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc852a02c  ! 88: LDSH_I	ldsh	[%r10 + 0x002c], %r4
	.word 0xc5ba989f  ! 89: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 90: STD_R	std	%r2, [%r10 + %r31]
TH_LABEL90:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5ba981f  ! 91: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 92: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc492a028  ! 93: LDUHA_I	lduha	[%r10, + 0x0028] %asi, %r2
	.word 0xc03aa058  ! 94: STD_I	std	%r0, [%r10 + 0x0058]
	.word 0xc612801f  ! 95: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3ba993f  ! 96: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba993f  ! 97: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2903f  ! 98: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba987f  ! 99: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc4d2a07e  ! 100: LDSHA_I	ldsha	[%r10, + 0x007e] %asi, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd2dae058  ! 101: LDXA_I	ldxa	[%r11, + 0x0058] %asi, %r9
	.word 0xcc3aa060  ! 102: STD_I	std	%r6, [%r10 + 0x0060]
	.word 0xcfbae058  ! 103: STDFA_I	stda	%f7, [0x0058, %r11]
	.word 0xc452e05e  ! 104: LDSH_I	ldsh	[%r11 + 0x005e], %r2
	.word 0xce5a801f  ! 105: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9bae050  ! 106: STDFA_I	stda	%f4, [0x0050, %r11]
	.word 0xc5ba98bf  ! 107: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2911f  ! 108: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc79aa048  ! 109: LDDFA_I	ldda	[%r10, 0x0048], %f3
	.word 0xc5ba981f  ! 110: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc43a801f  ! 111: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd102a074  ! 112: LDF_I	ld	[%r10, 0x0074], %f8
	.word 0xd202801f  ! 113: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xcbf2a01f  ! 114: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba991f  ! 115: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc702801f  ! 116: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc3e2e01f  ! 117: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d11f  ! 118: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xc3e2e01f  ! 119: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3e2d01f  ! 120: CASA_I	casa	[%r11] 0x80, %r31, %r1
TH_LABEL120:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3f2d01f  ! 121: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3f2e01f  ! 122: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad91f  ! 123: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc7bae028  ! 124: STDFA_I	stda	%f3, [0x0028, %r11]
	.word 0xcbba997f  ! 125: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcbba99bf  ! 126: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 127: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba983f  ! 128: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcad2e03e  ! 129: LDSHA_I	ldsha	[%r11, + 0x003e] %asi, %r5
	.word 0xcdbad93f  ! 130: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc3ae060  ! 131: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xca8a901f  ! 132: LDUBA_R	lduba	[%r10, %r31] 0x80, %r5
	.word 0xd1ba98bf  ! 133: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2903f  ! 134: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd1e2a01f  ! 135: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd03aa060  ! 136: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd1e2a01f  ! 137: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xcc92d03f  ! 138: LDUHA_R	lduha	[%r11, %r31] 0x81, %r6
	.word 0xd1baa038  ! 139: STDFA_I	stda	%f8, [0x0038, %r10]
	.word 0xc692917f  ! 140: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc242e070  ! 141: LDSW_I	ldsw	[%r11 + 0x0070], %r1
	.word 0xcfbad83f  ! 142: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc2c2911f  ! 143: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r1
	.word 0xc3ba999f  ! 144: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 145: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3ba985f  ! 146: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcf02801f  ! 147: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc9bad91f  ! 148: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad85f  ! 149: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc84aa02c  ! 150: LDSB_I	ldsb	[%r10 + 0x002c], %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xca12a022  ! 151: LDUH_I	lduh	[%r10 + 0x0022], %r5
	.word 0xcc3aa060  ! 152: STD_I	std	%r6, [%r10 + 0x0060]
	.word 0xcccad15f  ! 153: LDSBA_R	ldsba	[%r11, %r31] 0x8a, %r6
	.word 0xcbf2e01f  ! 154: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbf2d11f  ! 155: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd08a901f  ! 156: LDUBA_R	lduba	[%r10, %r31] 0x80, %r8
	.word 0xc45aa010  ! 157: LDX_I	ldx	[%r10 + 0x0010], %r2
	.word 0xc9f2e01f  ! 158: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 159: STD_R	std	%r4, [%r11 + %r31]
	.word 0xc48a915f  ! 160: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd1baa010  ! 161: STDFA_I	stda	%f8, [0x0010, %r10]
	.word 0xc292d05f  ! 162: LDUHA_R	lduha	[%r11, %r31] 0x82, %r1
	.word 0xcbba991f  ! 163: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 164: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2901f  ! 165: CASA_I	casa	[%r10] 0x80, %r31, %r5
TH_LABEL165:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbf2a01f  ! 166: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcec2d01f  ! 167: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r7
	.word 0xcbf2e01f  ! 168: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xd08aa001  ! 169: LDUBA_I	lduba	[%r10, + 0x0001] %asi, %r8
	.word 0xc5ba98bf  ! 170: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc43aa078  ! 171: STD_I	std	%r2, [%r10 + 0x0078]
	.word 0xd39aa020  ! 172: LDDFA_I	ldda	[%r10, 0x0020], %f9
	.word 0xc25ae000  ! 173: LDX_I	ldx	[%r11 + 0x0000], %r1
	.word 0xd3f2e01f  ! 174: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2e01f  ! 175: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3f2d01f  ! 176: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xd3bad95f  ! 177: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc2c2901f  ! 178: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r1
	.word 0xc3ba997f  ! 179: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xca4aa017  ! 180: LDSB_I	ldsb	[%r10 + 0x0017], %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3e2901f  ! 181: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3f2a01f  ! 182: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba995f  ! 183: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba993f  ! 184: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce02a048  ! 185: LDUW_I	lduw	[%r10 + 0x0048], %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc43aa048  ! 186: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc5e2a01f  ! 187: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcb02a068  ! 188: LDF_I	ld	[%r10, 0x0068], %f5
	.word 0xc602801f  ! 189: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xd052c01f  ! 190: LDSH_R	ldsh	[%r11 + %r31], %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc39aa050  ! 191: LDDFA_I	ldda	[%r10, 0x0050], %f1
	.word 0xc84a801f  ! 192: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xcbba987f  ! 193: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 194: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbf2a01f  ! 195: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbf2903f  ! 196: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xc522801f  ! 197: STF_R	st	%f2, [%r31, %r10]
	.word 0xcc0ac01f  ! 198: LDUB_R	ldub	[%r11 + %r31], %r6
	.word 0xc59ae060  ! 199: LDDFA_I	ldda	[%r11, 0x0060], %f2
	.word 0xd1ba995f  ! 200: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc79aa028  ! 201: LDDFA_I	ldda	[%r10, 0x0028], %f3
	.word 0xcd02801f  ! 202: LDF_R	ld	[%r10, %r31], %f6
	.word 0xce5a801f  ! 203: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xcfba99bf  ! 204: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcf22801f  ! 205: STF_R	st	%f7, [%r31, %r10]
TH_LABEL205:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7ba987f  ! 206: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc5baa038  ! 207: STDFA_I	stda	%f2, [0x0038, %r10]
	.word 0xc482a038  ! 208: LDUWA_I	lduwa	[%r10, + 0x0038] %asi, %r2
	.word 0xcdf2a01f  ! 209: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba981f  ! 210: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc99aa038  ! 211: LDDFA_I	ldda	[%r10, 0x0038], %f4
	.word 0xc03ac01f  ! 212: STD_R	std	%r0, [%r11 + %r31]
	.word 0xce42a074  ! 213: LDSW_I	ldsw	[%r10 + 0x0074], %r7
	.word 0xc7baa018  ! 214: STDFA_I	stda	%f3, [0x0018, %r10]
	.word 0xc83aa048  ! 215: STD_I	std	%r4, [%r10 + 0x0048]
TH_LABEL215:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc692d13f  ! 216: LDUHA_R	lduha	[%r11, %r31] 0x89, %r3
	.word 0xc892a01e  ! 217: LDUHA_I	lduha	[%r10, + 0x001e] %asi, %r4
	.word 0xcc42801f  ! 218: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xcb9ae010  ! 219: LDDFA_I	ldda	[%r11, 0x0010], %f5
	.word 0xce42e004  ! 220: LDSW_I	ldsw	[%r11 + 0x0004], %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc2ca913f  ! 221: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r1
	.word 0xcde2903f  ! 222: CASA_I	casa	[%r10] 0x81, %r31, %r6
	.word 0xcfbaa058  ! 223: STDFA_I	stda	%f7, [0x0058, %r10]
	.word 0xc902801f  ! 224: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc01a801f  ! 225: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd03ac01f  ! 226: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad87f  ! 227: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 228: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad89f  ! 229: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad99f  ! 230: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3bad8bf  ! 231: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad83f  ! 232: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 233: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad9bf  ! 234: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xca02e06c  ! 235: LDUW_I	lduw	[%r11 + 0x006c], %r5
TH_LABEL235:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd1ba983f  ! 236: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 237: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xce42a040  ! 238: LDSW_I	ldsw	[%r10 + 0x0040], %r7
	.word 0xc7e2903f  ! 239: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba983f  ! 240: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd01ae030  ! 241: LDD_I	ldd	[%r11 + 0x0030], %r8
	.word 0xc88a917f  ! 242: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r4
	.word 0xcb02e024  ! 243: LDF_I	ld	[%r11, 0x0024], %f5
	.word 0xd3bad95f  ! 244: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad85f  ! 245: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xca0ac01f  ! 246: LDUB_R	ldub	[%r11 + %r31], %r5
	.word 0xca8ae071  ! 247: LDUBA_I	lduba	[%r11, + 0x0071] %asi, %r5
	.word 0xcbbaa020  ! 248: STDFA_I	stda	%f5, [0x0020, %r10]
	.word 0xd302801f  ! 249: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc5e2a01f  ! 250: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc12801f  ! 251: LDUH_R	lduh	[%r10 + %r31], %r6
	.word 0xd2c2915f  ! 252: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r9
	.word 0xd1ba985f  ! 253: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2903f  ! 254: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd1e2903f  ! 255: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc28ad13f  ! 256: LDUBA_R	lduba	[%r11, %r31] 0x89, %r1
	.word 0xc3f2d03f  ! 257: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xc3bad91f  ! 258: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad85f  ! 259: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 260: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc4d2a070  ! 261: LDSHA_I	ldsha	[%r10, + 0x0070] %asi, %r2
	.word 0xc6c2a048  ! 262: LDSWA_I	ldswa	[%r10, + 0x0048] %asi, %r3
	.word 0xc40a801f  ! 263: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xd3f2a01f  ! 264: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2913f  ! 265: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd3ba995f  ! 266: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc41a801f  ! 267: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xce8ae02e  ! 268: LDUBA_I	lduba	[%r11, + 0x002e] %asi, %r7
	.word 0xd19ae050  ! 269: LDDFA_I	ldda	[%r11, 0x0050], %f8
	.word 0xc812e036  ! 270: LDUH_I	lduh	[%r11 + 0x0036], %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xca42801f  ! 271: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xc6d2a056  ! 272: LDSHA_I	ldsha	[%r10, + 0x0056] %asi, %r3
	.word 0xc3f2d03f  ! 273: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xc3bad99f  ! 274: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad81f  ! 275: STDFA_R	stda	%f1, [%r31, %r11]
TH_LABEL275:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdbae018  ! 276: STDFA_I	stda	%f6, [0x0018, %r11]
	.word 0xc922801f  ! 277: STF_R	st	%f4, [%r31, %r10]
	.word 0xcb9ae070  ! 278: LDDFA_I	ldda	[%r11, 0x0070], %f5
	.word 0xd2dad15f  ! 279: LDXA_R	ldxa	[%r11, %r31] 0x8a, %r9
	.word 0xcdba99bf  ! 280: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcdf2913f  ! 281: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcdf2901f  ! 282: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdf2903f  ! 283: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xca82a040  ! 284: LDUWA_I	lduwa	[%r10, + 0x0040] %asi, %r5
	.word 0xc9ba981f  ! 285: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc9e2a01f  ! 286: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83aa008  ! 287: STD_I	std	%r4, [%r10 + 0x0008]
	.word 0xc9ba991f  ! 288: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2903f  ! 289: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc242801f  ! 290: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd03a801f  ! 291: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1e2a01f  ! 292: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xcad2a064  ! 293: LDSHA_I	ldsha	[%r10, + 0x0064] %asi, %r5
	.word 0xc7f2e01f  ! 294: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad83f  ! 295: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7bad85f  ! 296: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae028  ! 297: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc7bad97f  ! 298: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc2d2907f  ! 299: LDSHA_R	ldsha	[%r10, %r31] 0x83, %r1
	.word 0xd03a801f  ! 300: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1ba981f  ! 301: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc282e01c  ! 302: LDUWA_I	lduwa	[%r11, + 0x001c] %asi, %r1
	.word 0xd3e2a01f  ! 303: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 304: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba98bf  ! 305: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc5bae010  ! 306: STDFA_I	stda	%f2, [0x0010, %r11]
	.word 0xc3bae078  ! 307: STDFA_I	stda	%f1, [0x0078, %r11]
	.word 0xcc3ac01f  ! 308: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcdf2d11f  ! 309: CASXA_I	casxa	[%r11] 0x88, %r31, %r6
	.word 0xcdbad95f  ! 310: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc99ae010  ! 311: LDDFA_I	ldda	[%r11, 0x0010], %f4
	.word 0xcfba989f  ! 312: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xca8a903f  ! 313: LDUBA_R	lduba	[%r10, %r31] 0x81, %r5
	.word 0xc85a801f  ! 314: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xcc3aa078  ! 315: STD_I	std	%r6, [%r10 + 0x0078]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd0daa050  ! 316: LDXA_I	ldxa	[%r10, + 0x0050] %asi, %r8
	.word 0xce52801f  ! 317: LDSH_R	ldsh	[%r10 + %r31], %r7
	.word 0xc83aa078  ! 318: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xcbe2901f  ! 319: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xca42a054  ! 320: LDSW_I	ldsw	[%r10 + 0x0054], %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc8dae050  ! 321: LDXA_I	ldxa	[%r11, + 0x0050] %asi, %r4
	.word 0xd3f2913f  ! 322: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba99bf  ! 323: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 324: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc302a028  ! 325: LDF_I	ld	[%r10, 0x0028], %f1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdbad97f  ! 326: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc88aa064  ! 327: LDUBA_I	lduba	[%r10, + 0x0064] %asi, %r4
	.word 0xc03ae030  ! 328: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xc3e2e01f  ! 329: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d11f  ! 330: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc03ae030  ! 331: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xc3f2e01f  ! 332: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad91f  ! 333: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc282e02c  ! 334: LDUWA_I	lduwa	[%r11, + 0x002c] %asi, %r1
	.word 0xcfe2a01f  ! 335: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfe2a01f  ! 336: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc7bae040  ! 337: STDFA_I	stda	%f3, [0x0040, %r11]
	.word 0xcdf2a01f  ! 338: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc682903f  ! 339: LDUWA_R	lduwa	[%r10, %r31] 0x81, %r3
	.word 0xc5e2d13f  ! 340: CASA_I	casa	[%r11] 0x89, %r31, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd00a801f  ! 341: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xcdba989f  ! 342: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xce02801f  ! 343: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xd01aa010  ! 344: LDD_I	ldd	[%r10 + 0x0010], %r8
	.word 0xc9ba98bf  ! 345: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9ba997f  ! 346: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc82a078  ! 347: LDUWA_I	lduwa	[%r10, + 0x0078] %asi, %r6
	.word 0xc7ba995f  ! 348: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 349: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd2ca903f  ! 350: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc42801f  ! 351: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xc48a901f  ! 352: LDUBA_R	lduba	[%r10, %r31] 0x80, %r2
	.word 0xce82a038  ! 353: LDUWA_I	lduwa	[%r10, + 0x0038] %asi, %r7
	.word 0xd25ac01f  ! 354: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xcdba997f  ! 355: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcdba983f  ! 356: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 357: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcde2913f  ! 358: CASA_I	casa	[%r10] 0x89, %r31, %r6
	.word 0xcde2a01f  ! 359: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcf02a038  ! 360: LDF_I	ld	[%r10, 0x0038], %f7
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3e2a01f  ! 361: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3e2903f  ! 362: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd3ba995f  ! 363: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 364: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc25ac01f  ! 365: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7ba981f  ! 366: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa010  ! 367: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xc84a801f  ! 368: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xcfe2901f  ! 369: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcfe2a01f  ! 370: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcff2a01f  ! 371: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcc3aa010  ! 372: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xc4d2a006  ! 373: LDSHA_I	ldsha	[%r10, + 0x0006] %asi, %r2
	.word 0xc3e2a01f  ! 374: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba98bf  ! 375: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcccae045  ! 376: LDSBA_I	ldsba	[%r11, + 0x0045] %asi, %r6
	.word 0xcbba985f  ! 377: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 378: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba99bf  ! 379: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2903f  ! 380: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xce42e02c  ! 381: LDSW_I	ldsw	[%r11 + 0x002c], %r7
	.word 0xcfe2a01f  ! 382: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcc3aa038  ! 383: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcfe2913f  ! 384: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcfba98bf  ! 385: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcfba981f  ! 386: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd102a004  ! 387: LDF_I	ld	[%r10, 0x0004], %f8
	.word 0xc43a801f  ! 388: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc6caa033  ! 389: LDSBA_I	ldsba	[%r10, + 0x0033] %asi, %r3
	.word 0xc902801f  ! 390: LDF_R	ld	[%r10, %r31], %f4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc9bae058  ! 391: STDFA_I	stda	%f4, [0x0058, %r11]
	.word 0xcdba981f  ! 392: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc02c01f  ! 393: LDUW_R	lduw	[%r11 + %r31], %r6
	.word 0xcfba997f  ! 394: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba987f  ! 395: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfba981f  ! 396: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 397: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xd092913f  ! 398: LDUHA_R	lduha	[%r10, %r31] 0x89, %r8
	.word 0xc48a915f  ! 399: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r2
	.word 0xc812e018  ! 400: LDUH_I	lduh	[%r11 + 0x0018], %r4
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcde2901f  ! 401: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xcc3a801f  ! 402: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba995f  ! 403: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc81aa038  ! 404: LDD_I	ldd	[%r10 + 0x0038], %r4
	.word 0xc2caa02f  ! 405: LDSBA_I	ldsba	[%r10, + 0x002f] %asi, %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcd9aa038  ! 406: LDDFA_I	ldda	[%r10, 0x0038], %f6
	.word 0xcdf2a01f  ! 407: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba995f  ! 408: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc6caa058  ! 409: LDSBA_I	ldsba	[%r10, + 0x0058] %asi, %r3
	.word 0xd3ba985f  ! 410: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3baa008  ! 411: STDFA_I	stda	%f1, [0x0008, %r10]
	.word 0xc88aa014  ! 412: LDUBA_I	lduba	[%r10, + 0x0014] %asi, %r4
	.word 0xc702a070  ! 413: LDF_I	ld	[%r10, 0x0070], %f3
	.word 0xcff2e01f  ! 414: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xd08ae077  ! 415: LDUBA_I	lduba	[%r11, + 0x0077] %asi, %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc03ae000  ! 416: STD_I	std	%r0, [%r11 + 0x0000]
	.word 0xc3bae038  ! 417: STDFA_I	stda	%f1, [0x0038, %r11]
	.word 0xd3e2a01f  ! 418: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 419: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3e2a01f  ! 420: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3ba989f  ! 421: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xccda901f  ! 422: LDXA_R	ldxa	[%r10, %r31] 0x80, %r6
	.word 0xd1e2911f  ! 423: CASA_I	casa	[%r10] 0x88, %r31, %r8
	.word 0xc49aa038  ! 424: LDDA_I	ldda	[%r10, + 0x0038] %asi, %r2
	.word 0xc83ac01f  ! 425: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbbad91f  ! 426: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcf9aa070  ! 427: LDDFA_I	ldda	[%r10, 0x0070], %f7
	.word 0xc922c01f  ! 428: STF_R	st	%f4, [%r31, %r11]
	.word 0xd3bad89f  ! 429: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc9baa078  ! 430: STDFA_I	stda	%f4, [0x0078, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc702e044  ! 431: LDF_I	ld	[%r11, 0x0044], %f3
	.word 0xcc9aa048  ! 432: LDDA_I	ldda	[%r10, + 0x0048] %asi, %r6
	.word 0xc3bad89f  ! 433: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d03f  ! 434: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xc03ac01f  ! 435: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc3bad87f  ! 436: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad83f  ! 437: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 438: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d01f  ! 439: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc03ac01f  ! 440: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3f2d03f  ! 441: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xc88a901f  ! 442: LDUBA_R	lduba	[%r10, %r31] 0x80, %r4
	.word 0xc502a000  ! 443: LDF_I	ld	[%r10, 0x0000], %f2
	.word 0xc5f2d11f  ! 444: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xc5bad95f  ! 445: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5bad81f  ! 446: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcdbaa058  ! 447: STDFA_I	stda	%f6, [0x0058, %r10]
	.word 0xd1ba997f  ! 448: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2901f  ! 449: CASXA_I	casxa	[%r10] 0x80, %r31, %r8
	.word 0xd1f2a01f  ! 450: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcd22801f  ! 451: STF_R	st	%f6, [%r31, %r10]
	.word 0xd3ba99bf  ! 452: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcc0a801f  ! 453: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xd202a028  ! 454: LDUW_I	lduw	[%r10 + 0x0028], %r9
	.word 0xd3ba989f  ! 455: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc64a801f  ! 456: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xc83a801f  ! 457: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbf2a01f  ! 458: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2903f  ! 459: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xc99aa008  ! 460: LDDFA_I	ldda	[%r10, 0x0008], %f4
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7e2a01f  ! 461: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc43a801f  ! 462: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7f2901f  ! 463: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba989f  ! 464: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 465: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7ba999f  ! 466: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd2c2a064  ! 467: LDSWA_I	ldswa	[%r10, + 0x0064] %asi, %r9
	.word 0xd04ae068  ! 468: LDSB_I	ldsb	[%r11 + 0x0068], %r8
	.word 0xc99ae078  ! 469: LDDFA_I	ldda	[%r11, 0x0078], %f4
	.word 0xcc8ae006  ! 470: LDUBA_I	lduba	[%r11, + 0x0006] %asi, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc6caa057  ! 471: LDSBA_I	ldsba	[%r10, + 0x0057] %asi, %r3
	.word 0xc5ba997f  ! 472: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc302801f  ! 473: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc7f2913f  ! 474: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xc7f2a01f  ! 475: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc7ba981f  ! 476: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 477: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc6c2d15f  ! 478: LDSWA_R	ldswa	[%r11, %r31] 0x8a, %r3
	.word 0xc3ba995f  ! 479: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc6da915f  ! 480: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbbad87f  ! 481: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbbaa000  ! 482: STDFA_I	stda	%f5, [0x0000, %r10]
	.word 0xc3ba981f  ! 483: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 484: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc03aa008  ! 485: STD_I	std	%r0, [%r10 + 0x0008]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcd02a050  ! 486: LDF_I	ld	[%r10, 0x0050], %f6
	.word 0xc7bad83f  ! 487: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad9bf  ! 488: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae078  ! 489: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xd012a028  ! 490: LDUH_I	lduh	[%r10 + 0x0028], %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcc3ae030  ! 491: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcdbad99f  ! 492: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad91f  ! 493: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2d01f  ! 494: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad83f  ! 495: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc68ad07f  ! 496: LDUBA_R	lduba	[%r11, %r31] 0x83, %r3
	.word 0xc7ba989f  ! 497: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 498: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xcc1ac01f  ! 499: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xcfba99bf  ! 500: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfba999f  ! 501: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba981f  ! 502: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2913f  ! 503: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xcff2a01f  ! 504: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc49aa020  ! 505: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1ba995f  ! 506: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa000  ! 507: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd1ba981f  ! 508: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc302801f  ! 509: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc03a801f  ! 510: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc522801f  ! 511: STF_R	st	%f2, [%r31, %r10]
	.word 0xcbba995f  ! 512: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba991f  ! 513: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc302c01f  ! 514: LDF_R	ld	[%r11, %r31], %f1
	.word 0xc59aa068  ! 515: LDDFA_I	ldda	[%r10, 0x0068], %f2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc6d2d07f  ! 516: LDSHA_R	ldsha	[%r11, %r31] 0x83, %r3
	.word 0xc99aa050  ! 517: LDDFA_I	ldda	[%r10, 0x0050], %f4
	.word 0xc502801f  ! 518: LDF_R	ld	[%r10, %r31], %f2
	.word 0xd1bae048  ! 519: STDFA_I	stda	%f8, [0x0048, %r11]
	.word 0xcff2a01f  ! 520: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcfe2911f  ! 521: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcfba983f  ! 522: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 523: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 524: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc65a801f  ! 525: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1ba985f  ! 526: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 527: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba99bf  ! 528: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 529: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba987f  ! 530: STDFA_R	stda	%f8, [%r31, %r10]
TH_LABEL530:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd1e2a01f  ! 531: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 532: STD_R	std	%r8, [%r10 + %r31]
	.word 0xce8aa062  ! 533: LDUBA_I	lduba	[%r10, + 0x0062] %asi, %r7
	.word 0xc452a028  ! 534: LDSH_I	ldsh	[%r10 + 0x0028], %r2
	.word 0xcfba999f  ! 535: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcfe2a01f  ! 536: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2911f  ! 537: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcc3a801f  ! 538: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba989f  ! 539: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba985f  ! 540: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5baa008  ! 541: STDFA_I	stda	%f2, [0x0008, %r10]
	.word 0xcbba983f  ! 542: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 543: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba993f  ! 544: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba993f  ! 545: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL545:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbba983f  ! 546: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 547: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 548: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc8dae038  ! 549: LDXA_I	ldxa	[%r11, + 0x0038] %asi, %r4
	.word 0xd1baa050  ! 550: STDFA_I	stda	%f8, [0x0050, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbf2901f  ! 551: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xc83aa038  ! 552: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xcbf2a01f  ! 553: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xccdae058  ! 554: LDXA_I	ldxa	[%r11, + 0x0058] %asi, %r6
	.word 0xc5ba995f  ! 555: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5e2913f  ! 556: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5ba99bf  ! 557: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 558: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 559: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc302a07c  ! 560: LDF_I	ld	[%r10, 0x007c], %f1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7ba999f  ! 561: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd252801f  ! 562: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xca8aa017  ! 563: LDUBA_I	lduba	[%r10, + 0x0017] %asi, %r5
	.word 0xcc0a801f  ! 564: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xc7ba993f  ! 565: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc612c01f  ! 566: LDUH_R	lduh	[%r11 + %r31], %r3
	.word 0xc43aa058  ! 567: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc7ba98bf  ! 568: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba99bf  ! 569: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc812a034  ! 570: LDUH_I	lduh	[%r10 + 0x0034], %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1f2d01f  ! 571: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xd1f2d01f  ! 572: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xd1e2e01f  ! 573: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xc39aa038  ! 574: LDDFA_I	ldda	[%r10, 0x0038], %f1
	.word 0xc81aa068  ! 575: LDD_I	ldd	[%r10 + 0x0068], %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd03aa040  ! 576: STD_I	std	%r8, [%r10 + 0x0040]
	.word 0xd3ba987f  ! 577: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2911f  ! 578: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xd3ba99bf  ! 579: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc682901f  ! 580: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5ba981f  ! 581: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba981f  ! 582: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 583: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc45a801f  ! 584: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xcfbae000  ! 585: STDFA_I	stda	%f7, [0x0000, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5f2913f  ! 586: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xc5ba993f  ! 587: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2901f  ! 588: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc202a028  ! 589: LDUW_I	lduw	[%r10 + 0x0028], %r1
	.word 0xcbba983f  ! 590: STDFA_R	stda	%f5, [%r31, %r10]
TH_LABEL590:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xca92917f  ! 591: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r5
	.word 0xc9bad81f  ! 592: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9f2e01f  ! 593: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xceca913f  ! 594: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r7
	.word 0xd102801f  ! 595: LDF_R	ld	[%r10, %r31], %f8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc212a028  ! 596: LDUH_I	lduh	[%r10 + 0x0028], %r1
	.word 0xd3bad95f  ! 597: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad9bf  ! 598: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad97f  ! 599: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc45aa010  ! 600: LDX_I	ldx	[%r10 + 0x0010], %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc5bad9bf  ! 601: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc20ae066  ! 602: LDUB_I	ldub	[%r11 + 0x0066], %r1
	.word 0xcbbad8bf  ! 603: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc4dad03f  ! 604: LDXA_R	ldxa	[%r11, %r31] 0x81, %r2
	.word 0xca4a801f  ! 605: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7baa020  ! 606: STDFA_I	stda	%f3, [0x0020, %r10]
	.word 0xc7bad9bf  ! 607: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc202c01f  ! 608: LDUW_R	lduw	[%r11 + %r31], %r1
	.word 0xd28aa05c  ! 609: LDUBA_I	lduba	[%r10, + 0x005c] %asi, %r9
	.word 0xd212e03a  ! 610: LDUH_I	lduh	[%r11 + 0x003a], %r9
TH_LABEL610:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc83ae020  ! 611: STD_I	std	%r4, [%r11 + 0x0020]
	.word 0xc9bad95f  ! 612: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcc1aa030  ! 613: LDD_I	ldd	[%r10 + 0x0030], %r6
	.word 0xcdbad95f  ! 614: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd002e050  ! 615: LDUW_I	lduw	[%r11 + 0x0050], %r8
TH_LABEL615:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc3f2d13f  ! 616: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xc80ae041  ! 617: LDUB_I	ldub	[%r11 + 0x0041], %r4
	.word 0xc2cad05f  ! 618: LDSBA_R	ldsba	[%r11, %r31] 0x82, %r1
	.word 0xc4d2d01f  ! 619: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r2
	.word 0xcf02801f  ! 620: LDF_R	ld	[%r10, %r31], %f7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc83ae070  ! 621: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xc25ac01f  ! 622: LDX_R	ldx	[%r11 + %r31], %r1
	.word 0xd3bad87f  ! 623: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad95f  ! 624: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc902801f  ! 625: LDF_R	ld	[%r10, %r31], %f4
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc83a801f  ! 626: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd24ae07b  ! 627: LDSB_I	ldsb	[%r11 + 0x007b], %r9
	.word 0xc3ba991f  ! 628: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba993f  ! 629: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 630: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc212e02e  ! 631: LDUH_I	lduh	[%r11 + 0x002e], %r1
	.word 0xc9bad9bf  ! 632: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd042801f  ! 633: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xc292a004  ! 634: LDUHA_I	lduha	[%r10, + 0x0004] %asi, %r1
	.word 0xcdf2e01f  ! 635: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xced2e030  ! 636: LDSHA_I	ldsha	[%r11, + 0x0030] %asi, %r7
	.word 0xcff2911f  ! 637: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcff2911f  ! 638: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcfe2901f  ! 639: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcc02801f  ! 640: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfba993f  ! 641: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc49ae048  ! 642: LDDA_I	ldda	[%r11, + 0x0048] %asi, %r2
	.word 0xc702801f  ! 643: LDF_R	ld	[%r10, %r31], %f3
	.word 0xd102a00c  ! 644: LDF_I	ld	[%r10, 0x000c], %f8
	.word 0xcc42801f  ! 645: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xca4ac01f  ! 646: LDSB_R	ldsb	[%r11 + %r31], %r5
	.word 0xccca903f  ! 647: LDSBA_R	ldsba	[%r10, %r31] 0x81, %r6
	.word 0xc9ba981f  ! 648: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba987f  ! 649: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 650: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9f2a01f  ! 651: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc83aa010  ! 652: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xc9e2911f  ! 653: CASA_I	casa	[%r10] 0x88, %r31, %r4
	.word 0xc6caa05d  ! 654: LDSBA_I	ldsba	[%r10, + 0x005d] %asi, %r3
	.word 0xd0d2a058  ! 655: LDSHA_I	ldsha	[%r10, + 0x0058] %asi, %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc9ba991f  ! 656: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc4daa018  ! 657: LDXA_I	ldxa	[%r10, + 0x0018] %asi, %r2
	.word 0xc5e2903f  ! 658: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc64aa010  ! 659: LDSB_I	ldsb	[%r10 + 0x0010], %r3
	.word 0xcc3ae030  ! 660: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfbad99f  ! 661: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc3baa030  ! 662: STDFA_I	stda	%f1, [0x0030, %r10]
	.word 0xd1e2e01f  ! 663: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xd102a038  ! 664: LDF_I	ld	[%r10, 0x0038], %f8
	.word 0xc3ba987f  ! 665: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3ba99bf  ! 666: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2911f  ! 667: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xc692d13f  ! 668: LDUHA_R	lduha	[%r11, %r31] 0x89, %r3
	.word 0xcec2913f  ! 669: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r7
	.word 0xc442c01f  ! 670: LDSW_R	ldsw	[%r11 + %r31], %r2
TH_LABEL670:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd03ac01f  ! 671: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad93f  ! 672: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcfbaa038  ! 673: STDFA_I	stda	%f7, [0x0038, %r10]
	.word 0xc5ba995f  ! 674: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa038  ! 675: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd05aa040  ! 676: LDX_I	ldx	[%r10 + 0x0040], %r8
	.word 0xc702a008  ! 677: LDF_I	ld	[%r10, 0x0008], %f3
	.word 0xc9e2e01f  ! 678: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad99f  ! 679: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad9bf  ! 680: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc9bad95f  ! 681: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d01f  ! 682: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc83ae060  ! 683: STD_I	std	%r4, [%r11 + 0x0060]
	.word 0xce8aa05f  ! 684: LDUBA_I	lduba	[%r10, + 0x005f] %asi, %r7
	.word 0xd0daa030  ! 685: LDXA_I	ldxa	[%r10, + 0x0030] %asi, %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcff2e01f  ! 686: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcfbad97f  ! 687: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d03f  ! 688: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xc60a801f  ! 689: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xd1ba99bf  ! 690: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc25ae078  ! 691: LDX_I	ldx	[%r11 + 0x0078], %r1
	.word 0xc6c2a020  ! 692: LDSWA_I	ldswa	[%r10, + 0x0020] %asi, %r3
	.word 0xc43ae028  ! 693: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc43ac01f  ! 694: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7bad81f  ! 695: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd20a801f  ! 696: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xc7e2a01f  ! 697: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba99bf  ! 698: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc852a076  ! 699: LDSH_I	ldsh	[%r10 + 0x0076], %r4
	.word 0xc3f2a01f  ! 700: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3ba983f  ! 701: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 702: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3f2a01f  ! 703: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba99bf  ! 704: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba99bf  ! 705: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3ba997f  ! 706: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba98bf  ! 707: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc6daa008  ! 708: LDXA_I	ldxa	[%r10, + 0x0008] %asi, %r3
	.word 0xd202801f  ! 709: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xc442e000  ! 710: LDSW_I	ldsw	[%r11 + 0x0000], %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3e2a01f  ! 711: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3e2a01f  ! 712: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba991f  ! 713: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2913f  ! 714: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd03a801f  ! 715: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3f2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc692d05f  ! 717: LDUHA_R	lduha	[%r11, %r31] 0x82, %r3
	.word 0xcb9aa050  ! 718: LDDFA_I	ldda	[%r10, 0x0050], %f5
	.word 0xcf02a024  ! 719: LDF_I	ld	[%r10, 0x0024], %f7
	.word 0xd3e2d01f  ! 720: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcdbaa078  ! 721: STDFA_I	stda	%f6, [0x0078, %r10]
	.word 0xd3ba991f  ! 722: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 723: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 724: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba995f  ! 725: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3ba987f  ! 726: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc39aa008  ! 727: LDDFA_I	ldda	[%r10, 0x0008], %f1
	.word 0xc522801f  ! 728: STF_R	st	%f2, [%r31, %r10]
	.word 0xd3e2e01f  ! 729: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3f2d13f  ! 730: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc48a913f  ! 731: LDUBA_R	lduba	[%r10, %r31] 0x89, %r2
	.word 0xc5e2913f  ! 732: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5ba983f  ! 733: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 734: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba997f  ! 735: STDFA_R	stda	%f2, [%r31, %r10]
TH_LABEL735:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd252a066  ! 736: LDSH_I	ldsh	[%r10 + 0x0066], %r9
	.word 0xc3ba991f  ! 737: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd24a801f  ! 738: LDSB_R	ldsb	[%r10 + %r31], %r9
	.word 0xc7f2a01f  ! 739: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7f2911f  ! 740: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd04aa05c  ! 741: LDSB_I	ldsb	[%r10 + 0x005c], %r8
	.word 0xcfe2a01f  ! 742: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba981f  ! 743: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 744: STD_R	std	%r6, [%r10 + %r31]
	.word 0xc212a076  ! 745: LDUH_I	lduh	[%r10 + 0x0076], %r1
TH_LABEL745:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc8ad17f  ! 746: LDUBA_R	lduba	[%r11, %r31] 0x8b, %r6
	.word 0xc8daa040  ! 747: LDXA_I	ldxa	[%r10, + 0x0040] %asi, %r4
	.word 0xc402801f  ! 748: LDUW_R	lduw	[%r10 + %r31], %r2
	.word 0xc412801f  ! 749: LDUH_R	lduh	[%r10 + %r31], %r2
	.word 0xc09ae010  ! 750: LDDA_I	ldda	[%r11, + 0x0010] %asi, %r0
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xce82a048  ! 751: LDUWA_I	lduwa	[%r10, + 0x0048] %asi, %r7
	.word 0xc5e2e01f  ! 752: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad99f  ! 753: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad95f  ! 754: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd24aa056  ! 755: LDSB_I	ldsb	[%r10 + 0x0056], %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcfba997f  ! 756: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc60ac01f  ! 757: LDUB_R	ldub	[%r11 + %r31], %r3
	.word 0xc9e2d03f  ! 758: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xc9f2d01f  ! 759: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xcc9ae028  ! 760: LDDA_I	ldda	[%r11, + 0x0028] %asi, %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc902a054  ! 761: LDF_I	ld	[%r10, 0x0054], %f4
	.word 0xc9ba999f  ! 762: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc0aa04d  ! 763: LDUB_I	ldub	[%r10 + 0x004d], %r6
	.word 0xd302a058  ! 764: LDF_I	ld	[%r10, 0x0058], %f9
	.word 0xc9ba991f  ! 765: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc83a801f  ! 766: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba991f  ! 767: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2913f  ! 768: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9ba985f  ! 769: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL770:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xce82a014  ! 771: LDUWA_I	lduwa	[%r10, + 0x0014] %asi, %r7
	.word 0xcf02801f  ! 772: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcfba981f  ! 773: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc8ae029  ! 774: LDUBA_I	lduba	[%r11, + 0x0029] %asi, %r6
	.word 0xc41aa040  ! 775: LDD_I	ldd	[%r10 + 0x0040], %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1f2d01f  ! 776: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xd212801f  ! 777: LDUH_R	lduh	[%r10 + %r31], %r9
	.word 0xc7f2903f  ! 778: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba99bf  ! 779: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc89ae058  ! 780: LDDA_I	ldda	[%r11, + 0x0058] %asi, %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd052801f  ! 781: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xcbba99bf  ! 782: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba997f  ! 783: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc68ae00e  ! 784: LDUBA_I	lduba	[%r11, + 0x000e] %asi, %r3
	.word 0xd08a901f  ! 785: LDUBA_R	lduba	[%r10, %r31] 0x80, %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3e2a01f  ! 786: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 787: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc702a014  ! 788: LDF_I	ld	[%r10, 0x0014], %f3
	.word 0xce8aa03e  ! 789: LDUBA_I	lduba	[%r10, + 0x003e] %asi, %r7
	.word 0xd1bad91f  ! 790: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1bad9bf  ! 791: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad8bf  ! 792: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc452a04e  ! 793: LDSH_I	ldsh	[%r10 + 0x004e], %r2
	.word 0xc83ac01f  ! 794: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbf2e01f  ! 795: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc99ae078  ! 796: LDDFA_I	ldda	[%r11, 0x0078], %f4
	.word 0xcdba99bf  ! 797: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 798: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xced2915f  ! 799: LDSHA_R	ldsha	[%r10, %r31] 0x8a, %r7
	.word 0xd24ae062  ! 800: LDSB_I	ldsb	[%r11 + 0x0062], %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfbaa078  ! 801: STDFA_I	stda	%f7, [0x0078, %r10]
	.word 0xc5ba993f  ! 802: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 803: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43a801f  ! 804: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa068  ! 805: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5ba98bf  ! 806: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 807: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc4c2901f  ! 808: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r2
	.word 0xc5baa010  ! 809: STDFA_I	stda	%f2, [0x0010, %r10]
	.word 0xc4d2d15f  ! 810: LDSHA_R	ldsha	[%r11, %r31] 0x8a, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc212a026  ! 811: LDUH_I	lduh	[%r10 + 0x0026], %r1
	.word 0xc9ba98bf  ! 812: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 813: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba991f  ! 814: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc1ae038  ! 815: LDD_I	ldd	[%r11 + 0x0038], %r6
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd0ca911f  ! 816: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r8
	.word 0xcff2a01f  ! 817: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfe2a01f  ! 818: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2903f  ! 819: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xca5ae010  ! 820: LDX_I	ldx	[%r11 + 0x0010], %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfba981f  ! 821: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc8da915f  ! 822: LDXA_R	ldxa	[%r10, %r31] 0x8a, %r4
	.word 0xc4daa078  ! 823: LDXA_I	ldxa	[%r10, + 0x0078] %asi, %r2
	.word 0xc5baa010  ! 824: STDFA_I	stda	%f2, [0x0010, %r10]
	.word 0xcc0a801f  ! 825: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcac2905f  ! 826: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r5
	.word 0xd05a801f  ! 827: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xc9ba98bf  ! 828: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba987f  ! 829: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba98bf  ! 830: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc83a801f  ! 831: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc8d2d01f  ! 832: LDSHA_R	ldsha	[%r11, %r31] 0x80, %r4
	.word 0xd042801f  ! 833: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xc7e2a01f  ! 834: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba989f  ! 835: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc64a801f  ! 836: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xc7ba99bf  ! 837: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2903f  ! 838: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba981f  ! 839: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba989f  ! 840: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xce8a911f  ! 841: LDUBA_R	lduba	[%r10, %r31] 0x88, %r7
	.word 0xcc1ac01f  ! 842: LDD_R	ldd	[%r11 + %r31], %r6
	.word 0xc7ba993f  ! 843: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 844: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2a01f  ! 845: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7ba989f  ! 846: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcb22c01f  ! 847: STF_R	st	%f5, [%r31, %r11]
	.word 0xc5e2901f  ! 848: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2901f  ! 849: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc81a801f  ! 850: LDD_R	ldd	[%r10 + %r31], %r4
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc99ae078  ! 851: LDDFA_I	ldda	[%r11, 0x0078], %f4
	.word 0xca02a034  ! 852: LDUW_I	lduw	[%r10 + 0x0034], %r5
	.word 0xc7f2a01f  ! 853: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba981f  ! 854: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 855: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc82a01c  ! 856: LDUWA_I	lduwa	[%r10, + 0x001c] %asi, %r6
	.word 0xc9baa040  ! 857: STDFA_I	stda	%f4, [0x0040, %r10]
	.word 0xd3bad8bf  ! 858: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc8ca913f  ! 859: LDSBA_R	ldsba	[%r10, %r31] 0x89, %r4
	.word 0xc9ba99bf  ! 860: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9e2a01f  ! 861: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83a801f  ! 862: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcf02801f  ! 863: LDF_R	ld	[%r10, %r31], %f7
	.word 0xd102e078  ! 864: LDF_I	ld	[%r11, 0x0078], %f8
	.word 0xc01a801f  ! 865: LDD_R	ldd	[%r10 + %r31], %r0
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1e2903f  ! 866: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xd052801f  ! 867: LDSH_R	ldsh	[%r10 + %r31], %r8
	.word 0xd3ba993f  ! 868: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc6d2a062  ! 869: LDSHA_I	ldsha	[%r10, + 0x0062] %asi, %r3
	.word 0xd302a010  ! 870: LDF_I	ld	[%r10, 0x0010], %f9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbba99bf  ! 871: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc682d01f  ! 872: LDUWA_R	lduwa	[%r11, %r31] 0x80, %r3
	.word 0xcfba999f  ! 873: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 874: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfbaa020  ! 875: STDFA_I	stda	%f7, [0x0020, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3ba985f  ! 876: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2903f  ! 877: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xcc02801f  ! 878: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xc83ae048  ! 879: STD_I	std	%r4, [%r11 + 0x0048]
	.word 0xcc92917f  ! 880: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5baa008  ! 881: STDFA_I	stda	%f2, [0x0008, %r10]
	.word 0xcdba98bf  ! 882: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba987f  ! 883: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 884: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2911f  ! 885: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
TH_LABEL885:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcc9aa030  ! 886: LDDA_I	ldda	[%r10, + 0x0030] %asi, %r6
	.word 0xd1f2a01f  ! 887: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba981f  ! 888: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa020  ! 889: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xd09aa010  ! 890: LDDA_I	ldda	[%r10, + 0x0010] %asi, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfbad99f  ! 891: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad85f  ! 892: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc9baa060  ! 893: STDFA_I	stda	%f4, [0x0060, %r10]
	.word 0xcbe2a01f  ! 894: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba991f  ! 895: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcbba983f  ! 896: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 897: STD_R	std	%r4, [%r10 + %r31]
	.word 0xce42801f  ! 898: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xc4dad05f  ! 899: LDXA_R	ldxa	[%r11, %r31] 0x82, %r2
	.word 0xc3bad91f  ! 900: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3bad91f  ! 901: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d03f  ! 902: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xc3bad85f  ! 903: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc4c2d13f  ! 904: LDSWA_R	ldswa	[%r11, %r31] 0x89, %r2
	.word 0xc7ba995f  ! 905: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc8c2a030  ! 906: LDSWA_I	ldswa	[%r10, + 0x0030] %asi, %r4
	.word 0xd3f2a01f  ! 907: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc902a030  ! 908: LDF_I	ld	[%r10, 0x0030], %f4
	.word 0xcbbad81f  ! 909: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d03f  ! 910: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbf2d11f  ! 911: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xcbf2e01f  ! 912: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad93f  ! 913: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd08ae01e  ! 914: LDUBA_I	lduba	[%r11, + 0x001e] %asi, %r8
	.word 0xd3bad93f  ! 915: STDFA_R	stda	%f9, [%r31, %r11]
TH_LABEL915:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd39aa030  ! 916: LDDFA_I	ldda	[%r10, 0x0030], %f9
	.word 0xce5ac01f  ! 917: LDX_R	ldx	[%r11 + %r31], %r7
	.word 0xd1bad99f  ! 918: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 919: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad85f  ! 920: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1f2e01f  ! 921: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad8bf  ! 922: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d11f  ! 923: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xd03ac01f  ! 924: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2e01f  ! 925: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd1bad91f  ! 926: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcb9ae048  ! 927: LDDFA_I	ldda	[%r11, 0x0048], %f5
	.word 0xcdbad83f  ! 928: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 929: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcdbad95f  ! 930: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdbad95f  ! 931: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad89f  ! 932: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad8bf  ! 933: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc39aa000  ! 934: LDDFA_I	ldda	[%r10, 0x0000], %f1
	.word 0xd03aa030  ! 935: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc85a801f  ! 936: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xcdba98bf  ! 937: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba981f  ! 938: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 939: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 940: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc492d01f  ! 941: LDUHA_R	lduha	[%r11, %r31] 0x80, %r2
	.word 0xc5e2901f  ! 942: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba985f  ! 943: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xce92907f  ! 944: LDUHA_R	lduha	[%r10, %r31] 0x83, %r7
	.word 0xc642801f  ! 945: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd3ba997f  ! 946: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd19aa070  ! 947: LDDFA_I	ldda	[%r10, 0x0070], %f8
	.word 0xc5e2d13f  ! 948: CASA_I	casa	[%r11] 0x89, %r31, %r2
	.word 0xc5bad81f  ! 949: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 950: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc79ae000  ! 951: LDDFA_I	ldda	[%r11, 0x0000], %f3
	.word 0xc9f2e01f  ! 952: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xd28ad01f  ! 953: LDUBA_R	lduba	[%r11, %r31] 0x80, %r9
	.word 0xcacae038  ! 954: LDSBA_I	ldsba	[%r11, + 0x0038] %asi, %r5
	.word 0xcfba989f  ! 955: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd09ae010  ! 956: LDDA_I	ldda	[%r11, + 0x0010] %asi, %r8
	.word 0xcbba989f  ! 957: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa040  ! 958: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xcbba993f  ! 959: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc20a801f  ! 960: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc03aa040  ! 961: STD_I	std	%r0, [%r10 + 0x0040]
	.word 0xc3e2913f  ! 962: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc3ba983f  ! 963: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xce5a801f  ! 964: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xc65a801f  ! 965: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc1aa018  ! 966: LDD_I	ldd	[%r10 + 0x0018], %r6
	.word 0xcdba985f  ! 967: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba999f  ! 968: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba999f  ! 969: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 970: STD_R	std	%r6, [%r10 + %r31]
TH_LABEL970:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc8d2901f  ! 971: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r4
	.word 0xcbba985f  ! 972: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba99bf  ! 973: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc80aa037  ! 974: LDUB_I	ldub	[%r10 + 0x0037], %r4
	.word 0xd3ba991f  ! 975: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3e2911f  ! 976: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xd3f2a01f  ! 977: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03aa058  ! 978: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3f2a01f  ! 979: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 980: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3ba985f  ! 981: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2913f  ! 982: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba985f  ! 983: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 984: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 985: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd0d2905f  ! 986: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r8
	.word 0xc9ba981f  ! 987: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc01aa060  ! 988: LDD_I	ldd	[%r10 + 0x0060], %r0
	.word 0xcde2e01f  ! 989: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xd39aa028  ! 990: LDDFA_I	ldda	[%r10, 0x0028], %f9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc682e004  ! 991: LDUWA_I	lduwa	[%r11, + 0x0004] %asi, %r3
	.word 0xc922801f  ! 992: STF_R	st	%f4, [%r31, %r10]
	.word 0xcd9aa038  ! 993: LDDFA_I	ldda	[%r10, 0x0038], %f6
	.word 0xd102a028  ! 994: LDF_I	ld	[%r10, 0x0028], %f8
	.word 0xc7f2d13f  ! 995: CASXA_I	casxa	[%r11] 0x89, %r31, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc322801f  ! 996: STF_R	st	%f1, [%r31, %r10]
	.word 0xd1baa058  ! 997: STDFA_I	stda	%f8, [0x0058, %r10]
	.word 0xc9f2903f  ! 998: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc9f2901f  ! 999: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xcb9aa018  ! 1000: LDDFA_I	ldda	[%r10, 0x0018], %f5
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
	.word 0xc9ba99bf  ! 1: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc2da913f  ! 2: LDXA_R	ldxa	[%r10, %r31] 0x89, %r1
	.word 0xcc0ae045  ! 3: LDUB_I	ldub	[%r11 + 0x0045], %r6
	.word 0xc89ae030  ! 4: LDDA_I	ldda	[%r11, + 0x0030] %asi, %r4
	.word 0xc5f2d03f  ! 5: CASXA_I	casxa	[%r11] 0x81, %r31, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd04a801f  ! 6: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xcd9ae008  ! 7: LDDFA_I	ldda	[%r11, 0x0008], %f6
	.word 0xcdba995f  ! 8: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2913f  ! 9: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xc9baa010  ! 10: STDFA_I	stda	%f4, [0x0010, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc45aa068  ! 11: LDX_I	ldx	[%r10 + 0x0068], %r2
	.word 0xcff2d03f  ! 12: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xcfbad89f  ! 13: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad99f  ! 14: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad91f  ! 15: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc24a801f  ! 16: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xccdaa050  ! 17: LDXA_I	ldxa	[%r10, + 0x0050] %asi, %r6
	.word 0xcc12a018  ! 18: LDUH_I	lduh	[%r10 + 0x0018], %r6
	.word 0xc7ba993f  ! 19: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba983f  ! 20: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd0c2901f  ! 21: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r8
	.word 0xc5f2913f  ! 22: CASXA_I	casxa	[%r10] 0x89, %r31, %r2
	.word 0xca42801f  ! 23: LDSW_R	ldsw	[%r10 + %r31], %r5
	.word 0xd1bad85f  ! 24: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc302801f  ! 25: LDF_R	ld	[%r10, %r31], %f1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd252a062  ! 26: LDSH_I	ldsh	[%r10 + 0x0062], %r9
	.word 0xc202a03c  ! 27: LDUW_I	lduw	[%r10 + 0x003c], %r1
	.word 0xc5e2a01f  ! 28: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2903f  ! 29: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5e2a01f  ! 30: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc5ba983f  ! 31: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcc12e01a  ! 32: LDUH_I	lduh	[%r11 + 0x001a], %r6
	.word 0xc7ba985f  ! 33: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 34: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7f2a01f  ! 35: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfbaa048  ! 36: STDFA_I	stda	%f7, [0x0048, %r10]
	.word 0xd03aa040  ! 37: STD_I	std	%r8, [%r10 + 0x0040]
	.word 0xd3ba999f  ! 38: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 39: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd2da901f  ! 40: LDXA_R	ldxa	[%r10, %r31] 0x80, %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc492e040  ! 41: LDUHA_I	lduha	[%r11, + 0x0040] %asi, %r2
	.word 0xcc8ad03f  ! 42: LDUBA_R	lduba	[%r11, %r31] 0x81, %r6
	.word 0xc9f2901f  ! 43: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xd042c01f  ! 44: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xc83ac01f  ! 45: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9e2d01f  ! 46: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc83ae068  ! 47: STD_I	std	%r4, [%r11 + 0x0068]
	.word 0xc9bad97f  ! 48: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 49: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2e01f  ! 50: CASA_R	casa	[%r11] %asi, %r31, %r4
TH_LABEL50:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcec2d11f  ! 51: LDSWA_R	ldswa	[%r11, %r31] 0x88, %r7
	.word 0xd1ba991f  ! 52: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc682905f  ! 53: LDUWA_R	lduwa	[%r10, %r31] 0x82, %r3
	.word 0xd002a068  ! 54: LDUW_I	lduw	[%r10 + 0x0068], %r8
	.word 0xd03ac01f  ! 55: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3f2d11f  ! 56: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xc492917f  ! 57: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r2
	.word 0xc5bae020  ! 58: STDFA_I	stda	%f2, [0x0020, %r11]
	.word 0xcfbad85f  ! 59: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d01f  ! 60: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcfbad81f  ! 61: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc79aa068  ! 62: LDDFA_I	ldda	[%r10, 0x0068], %f3
	.word 0xcccad11f  ! 63: LDSBA_R	ldsba	[%r11, %r31] 0x88, %r6
	.word 0xcc3a801f  ! 64: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcb9aa058  ! 65: LDDFA_I	ldda	[%r10, 0x0058], %f5
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdf2a01f  ! 66: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc3a801f  ! 67: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba997f  ! 68: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc4d2a068  ! 69: LDSHA_I	ldsha	[%r10, + 0x0068] %asi, %r2
	.word 0xcd02e018  ! 70: LDF_I	ld	[%r11, 0x0018], %f6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd102801f  ! 71: LDF_R	ld	[%r10, %r31], %f8
	.word 0xcde2a01f  ! 72: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2911f  ! 73: CASXA_I	casxa	[%r10] 0x88, %r31, %r6
	.word 0xcc02801f  ! 74: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xcc3aa000  ! 75: STD_I	std	%r6, [%r10 + 0x0000]
TH_LABEL75:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd28a917f  ! 76: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r9
	.word 0xc9bad93f  ! 77: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc722801f  ! 78: STF_R	st	%f3, [%r31, %r10]
	.word 0xc8c2a048  ! 79: LDSWA_I	ldswa	[%r10, + 0x0048] %asi, %r4
	.word 0xd3baa060  ! 80: STDFA_I	stda	%f9, [0x0060, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc4d2905f  ! 81: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r2
	.word 0xce92913f  ! 82: LDUHA_R	lduha	[%r10, %r31] 0x89, %r7
	.word 0xc9ba985f  ! 83: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 84: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83aa070  ! 85: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc2daa070  ! 86: LDXA_I	ldxa	[%r10, + 0x0070] %asi, %r1
	.word 0xc5bad87f  ! 87: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc852a024  ! 88: LDSH_I	ldsh	[%r10 + 0x0024], %r4
	.word 0xc5ba99bf  ! 89: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 90: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5ba991f  ! 91: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba99bf  ! 92: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc292a078  ! 93: LDUHA_I	lduha	[%r10, + 0x0078] %asi, %r1
	.word 0xc03aa058  ! 94: STD_I	std	%r0, [%r10 + 0x0058]
	.word 0xca12801f  ! 95: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3ba993f  ! 96: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 97: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2901f  ! 98: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba999f  ! 99: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc8d2a05c  ! 100: LDSHA_I	ldsha	[%r10, + 0x005c] %asi, %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc6daa038  ! 101: LDXA_I	ldxa	[%r10, + 0x0038] %asi, %r3
	.word 0xcc3aa060  ! 102: STD_I	std	%r6, [%r10 + 0x0060]
	.word 0xcfbae000  ! 103: STDFA_I	stda	%f7, [0x0000, %r11]
	.word 0xc252e03e  ! 104: LDSH_I	ldsh	[%r11 + 0x003e], %r1
	.word 0xcc5a801f  ! 105: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3bae000  ! 106: STDFA_I	stda	%f1, [0x0000, %r11]
	.word 0xc5ba999f  ! 107: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2901f  ! 108: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc99ae050  ! 109: LDDFA_I	ldda	[%r11, 0x0050], %f4
	.word 0xc5ba981f  ! 110: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc43a801f  ! 111: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc702a000  ! 112: LDF_I	ld	[%r10, 0x0000], %f3
	.word 0xc802c01f  ! 113: LDUW_R	lduw	[%r11 + %r31], %r4
	.word 0xcbf2a01f  ! 114: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba981f  ! 115: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd302801f  ! 116: LDF_R	ld	[%r10, %r31], %f9
	.word 0xc3e2e01f  ! 117: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d11f  ! 118: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xc3e2e01f  ! 119: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3e2d13f  ! 120: CASA_I	casa	[%r11] 0x89, %r31, %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3f2d01f  ! 121: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3f2e01f  ! 122: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad91f  ! 123: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd3bae010  ! 124: STDFA_I	stda	%f9, [0x0010, %r11]
	.word 0xcbba987f  ! 125: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba999f  ! 126: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba98bf  ! 127: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba987f  ! 128: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xccd2e038  ! 129: LDSHA_I	ldsha	[%r11, + 0x0038] %asi, %r6
	.word 0xcdbad81f  ! 130: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc3ae060  ! 131: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xc68ad01f  ! 132: LDUBA_R	lduba	[%r11, %r31] 0x80, %r3
	.word 0xd1ba981f  ! 133: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2913f  ! 134: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xd1e2a01f  ! 135: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd03aa060  ! 136: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd1e2a01f  ! 137: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc292911f  ! 138: LDUHA_R	lduha	[%r10, %r31] 0x88, %r1
	.word 0xd1baa060  ! 139: STDFA_I	stda	%f8, [0x0060, %r10]
	.word 0xca92901f  ! 140: LDUHA_R	lduha	[%r10, %r31] 0x80, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc842a064  ! 141: LDSW_I	ldsw	[%r10 + 0x0064], %r4
	.word 0xcfbad81f  ! 142: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd0c2d15f  ! 143: LDSWA_R	ldswa	[%r11, %r31] 0x8a, %r8
	.word 0xc3ba993f  ! 144: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 145: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3ba995f  ! 146: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc502801f  ! 147: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc9bad81f  ! 148: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad95f  ! 149: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xca4aa03f  ! 150: LDSB_I	ldsb	[%r10 + 0x003f], %r5
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc812a008  ! 151: LDUH_I	lduh	[%r10 + 0x0008], %r4
	.word 0xcc3aa060  ! 152: STD_I	std	%r6, [%r10 + 0x0060]
	.word 0xc8ca907f  ! 153: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r4
	.word 0xcbf2e01f  ! 154: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbf2d13f  ! 155: CASXA_I	casxa	[%r11] 0x89, %r31, %r5
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd08ad07f  ! 156: LDUBA_R	lduba	[%r11, %r31] 0x83, %r8
	.word 0xce5ae058  ! 157: LDX_I	ldx	[%r11 + 0x0058], %r7
	.word 0xc9f2e01f  ! 158: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 159: STD_R	std	%r4, [%r11 + %r31]
	.word 0xca8a901f  ! 160: LDUBA_R	lduba	[%r10, %r31] 0x80, %r5
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcdbaa038  ! 161: STDFA_I	stda	%f6, [0x0038, %r10]
	.word 0xce92d17f  ! 162: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r7
	.word 0xcbba987f  ! 163: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba995f  ! 164: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2913f  ! 165: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbf2a01f  ! 166: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xc2c2917f  ! 167: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r1
	.word 0xcbf2e01f  ! 168: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xd28ae02b  ! 169: LDUBA_I	lduba	[%r11, + 0x002b] %asi, %r9
	.word 0xc5ba985f  ! 170: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc43aa078  ! 171: STD_I	std	%r2, [%r10 + 0x0078]
	.word 0xcb9ae070  ! 172: LDDFA_I	ldda	[%r11, 0x0070], %f5
	.word 0xc85ae058  ! 173: LDX_I	ldx	[%r11 + 0x0058], %r4
	.word 0xd3f2e01f  ! 174: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2e01f  ! 175: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd3f2d11f  ! 176: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xd3bad9bf  ! 177: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc2c2913f  ! 178: LDSWA_R	ldswa	[%r10, %r31] 0x89, %r1
	.word 0xc3ba98bf  ! 179: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc84aa01f  ! 180: LDSB_I	ldsb	[%r10 + 0x001f], %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3e2913f  ! 181: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd3f2a01f  ! 182: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba991f  ! 183: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 184: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc802a048  ! 185: LDUW_I	lduw	[%r10 + 0x0048], %r4
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc43aa048  ! 186: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc5e2a01f  ! 187: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xcd02a068  ! 188: LDF_I	ld	[%r10, 0x0068], %f6
	.word 0xcc02c01f  ! 189: LDUW_R	lduw	[%r11 + %r31], %r6
	.word 0xc852801f  ! 190: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc99ae068  ! 191: LDDFA_I	ldda	[%r11, 0x0068], %f4
	.word 0xd04a801f  ! 192: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xcbba999f  ! 193: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 194: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbf2a01f  ! 195: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbf2903f  ! 196: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xc722c01f  ! 197: STF_R	st	%f3, [%r31, %r11]
	.word 0xca0a801f  ! 198: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xc79ae048  ! 199: LDDFA_I	ldda	[%r11, 0x0048], %f3
	.word 0xd1ba981f  ! 200: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc79aa028  ! 201: LDDFA_I	ldda	[%r10, 0x0028], %f3
	.word 0xd302c01f  ! 202: LDF_R	ld	[%r11, %r31], %f9
	.word 0xc65a801f  ! 203: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xcfba989f  ! 204: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcd22c01f  ! 205: STF_R	st	%f6, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7ba981f  ! 206: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcbbae038  ! 207: STDFA_I	stda	%f5, [0x0038, %r11]
	.word 0xd082e010  ! 208: LDUWA_I	lduwa	[%r11, + 0x0010] %asi, %r8
	.word 0xcdf2a01f  ! 209: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba985f  ! 210: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd19aa060  ! 211: LDDFA_I	ldda	[%r10, 0x0060], %f8
	.word 0xc03ac01f  ! 212: STD_R	std	%r0, [%r11 + %r31]
	.word 0xc642e030  ! 213: LDSW_I	ldsw	[%r11 + 0x0030], %r3
	.word 0xcfbaa040  ! 214: STDFA_I	stda	%f7, [0x0040, %r10]
	.word 0xc83aa048  ! 215: STD_I	std	%r4, [%r10 + 0x0048]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc892d05f  ! 216: LDUHA_R	lduha	[%r11, %r31] 0x82, %r4
	.word 0xc292a00a  ! 217: LDUHA_I	lduha	[%r10, + 0x000a] %asi, %r1
	.word 0xd242c01f  ! 218: LDSW_R	ldsw	[%r11 + %r31], %r9
	.word 0xc59ae070  ! 219: LDDFA_I	ldda	[%r11, 0x0070], %f2
	.word 0xc242a074  ! 220: LDSW_I	ldsw	[%r10 + 0x0074], %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcccad05f  ! 221: LDSBA_R	ldsba	[%r11, %r31] 0x82, %r6
	.word 0xcde2903f  ! 222: CASA_I	casa	[%r10] 0x81, %r31, %r6
	.word 0xc3bae060  ! 223: STDFA_I	stda	%f1, [0x0060, %r11]
	.word 0xd102c01f  ! 224: LDF_R	ld	[%r11, %r31], %f8
	.word 0xd01ac01f  ! 225: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd03ac01f  ! 226: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad97f  ! 227: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 228: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad83f  ! 229: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 230: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3bad87f  ! 231: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad83f  ! 232: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 233: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad85f  ! 234: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd002e010  ! 235: LDUW_I	lduw	[%r11 + 0x0010], %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1ba991f  ! 236: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 237: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd042a028  ! 238: LDSW_I	ldsw	[%r10 + 0x0028], %r8
	.word 0xc7e2903f  ! 239: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba983f  ! 240: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc41aa058  ! 241: LDD_I	ldd	[%r10 + 0x0058], %r2
	.word 0xce8a911f  ! 242: LDUBA_R	lduba	[%r10, %r31] 0x88, %r7
	.word 0xcd02e044  ! 243: LDF_I	ld	[%r11, 0x0044], %f6
	.word 0xd3bad81f  ! 244: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad93f  ! 245: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc0a801f  ! 246: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xc28aa02a  ! 247: LDUBA_I	lduba	[%r10, + 0x002a] %asi, %r1
	.word 0xd3baa040  ! 248: STDFA_I	stda	%f9, [0x0040, %r10]
	.word 0xc702801f  ! 249: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc5e2a01f  ! 250: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc812801f  ! 251: LDUH_R	lduh	[%r10 + %r31], %r4
	.word 0xcac2905f  ! 252: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r5
	.word 0xd1ba98bf  ! 253: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2901f  ! 254: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1e2903f  ! 255: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc48a911f  ! 256: LDUBA_R	lduba	[%r10, %r31] 0x88, %r2
	.word 0xc3f2d01f  ! 257: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad83f  ! 258: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad87f  ! 259: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 260: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc8d2a06c  ! 261: LDSHA_I	ldsha	[%r10, + 0x006c] %asi, %r4
	.word 0xc8c2e008  ! 262: LDSWA_I	ldswa	[%r11, + 0x0008] %asi, %r4
	.word 0xca0a801f  ! 263: LDUB_R	ldub	[%r10 + %r31], %r5
	.word 0xd3f2a01f  ! 264: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2913f  ! 265: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3ba995f  ! 266: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc41ac01f  ! 267: LDD_R	ldd	[%r11 + %r31], %r2
	.word 0xc88aa013  ! 268: LDUBA_I	lduba	[%r10, + 0x0013] %asi, %r4
	.word 0xd39ae038  ! 269: LDDFA_I	ldda	[%r11, 0x0038], %f9
	.word 0xc412e03a  ! 270: LDUH_I	lduh	[%r11 + 0x003a], %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd042c01f  ! 271: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xc8d2a008  ! 272: LDSHA_I	ldsha	[%r10, + 0x0008] %asi, %r4
	.word 0xc3f2d01f  ! 273: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad99f  ! 274: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad95f  ! 275: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc5bae020  ! 276: STDFA_I	stda	%f2, [0x0020, %r11]
	.word 0xcd22801f  ! 277: STF_R	st	%f6, [%r31, %r10]
	.word 0xcb9ae008  ! 278: LDDFA_I	ldda	[%r11, 0x0008], %f5
	.word 0xc8da907f  ! 279: LDXA_R	ldxa	[%r10, %r31] 0x83, %r4
	.word 0xcdba98bf  ! 280: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcdf2901f  ! 281: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xcdf2913f  ! 282: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xcdf2913f  ! 283: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xc482a024  ! 284: LDUWA_I	lduwa	[%r10, + 0x0024] %asi, %r2
	.word 0xc9ba991f  ! 285: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc9e2a01f  ! 286: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83aa008  ! 287: STD_I	std	%r4, [%r10 + 0x0008]
	.word 0xc9ba993f  ! 288: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2903f  ! 289: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xd042801f  ! 290: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd03a801f  ! 291: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1e2a01f  ! 292: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc6d2a064  ! 293: LDSHA_I	ldsha	[%r10, + 0x0064] %asi, %r3
	.word 0xc7f2e01f  ! 294: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad91f  ! 295: STDFA_R	stda	%f3, [%r31, %r11]
TH_LABEL295:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7bad81f  ! 296: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae028  ! 297: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc7bad83f  ! 298: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc4d2917f  ! 299: LDSHA_R	ldsha	[%r10, %r31] 0x8b, %r2
	.word 0xd03a801f  ! 300: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd1ba983f  ! 301: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc682a010  ! 302: LDUWA_I	lduwa	[%r10, + 0x0010] %asi, %r3
	.word 0xd3e2a01f  ! 303: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 304: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba981f  ! 305: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7bae070  ! 306: STDFA_I	stda	%f3, [0x0070, %r11]
	.word 0xc9baa008  ! 307: STDFA_I	stda	%f4, [0x0008, %r10]
	.word 0xcc3ac01f  ! 308: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcdf2d01f  ! 309: CASXA_I	casxa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad93f  ! 310: STDFA_R	stda	%f6, [%r31, %r11]
TH_LABEL310:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd39ae008  ! 311: LDDFA_I	ldda	[%r11, 0x0008], %f9
	.word 0xcfba99bf  ! 312: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc88a911f  ! 313: LDUBA_R	lduba	[%r10, %r31] 0x88, %r4
	.word 0xc45a801f  ! 314: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xcc3aa078  ! 315: STD_I	std	%r6, [%r10 + 0x0078]
TH_LABEL315:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcedae038  ! 316: LDXA_I	ldxa	[%r11, + 0x0038] %asi, %r7
	.word 0xc852801f  ! 317: LDSH_R	ldsh	[%r10 + %r31], %r4
	.word 0xc83aa078  ! 318: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xcbe2913f  ! 319: CASA_I	casa	[%r10] 0x89, %r31, %r5
	.word 0xc242a034  ! 320: LDSW_I	ldsw	[%r10 + 0x0034], %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc6daa020  ! 321: LDXA_I	ldxa	[%r10, + 0x0020] %asi, %r3
	.word 0xd3f2913f  ! 322: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd3ba989f  ! 323: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 324: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xc902a03c  ! 325: LDF_I	ld	[%r10, 0x003c], %f4
TH_LABEL325:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcdbad97f  ! 326: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd28aa01a  ! 327: LDUBA_I	lduba	[%r10, + 0x001a] %asi, %r9
	.word 0xc03ae030  ! 328: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xc3e2e01f  ! 329: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d01f  ! 330: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc03ae030  ! 331: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xc3f2e01f  ! 332: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad8bf  ! 333: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xce82a060  ! 334: LDUWA_I	lduwa	[%r10, + 0x0060] %asi, %r7
	.word 0xcfe2a01f  ! 335: CASA_R	casa	[%r10] %asi, %r31, %r7
TH_LABEL335:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfe2a01f  ! 336: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xc3bae038  ! 337: STDFA_I	stda	%f1, [0x0038, %r11]
	.word 0xcdf2a01f  ! 338: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc282d13f  ! 339: LDUWA_R	lduwa	[%r11, %r31] 0x89, %r1
	.word 0xc5e2d11f  ! 340: CASA_I	casa	[%r11] 0x88, %r31, %r2
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc40ac01f  ! 341: LDUB_R	ldub	[%r11 + %r31], %r2
	.word 0xcdba99bf  ! 342: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc402c01f  ! 343: LDUW_R	lduw	[%r11 + %r31], %r2
	.word 0xcc1ae010  ! 344: LDD_I	ldd	[%r11 + 0x0010], %r6
	.word 0xc9ba983f  ! 345: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9ba993f  ! 346: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc282e074  ! 347: LDUWA_I	lduwa	[%r11, + 0x0074] %asi, %r1
	.word 0xc7ba995f  ! 348: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 349: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc4ca911f  ! 350: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc242801f  ! 351: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xcc8ad15f  ! 352: LDUBA_R	lduba	[%r11, %r31] 0x8a, %r6
	.word 0xc482a00c  ! 353: LDUWA_I	lduwa	[%r10, + 0x000c] %asi, %r2
	.word 0xcc5ac01f  ! 354: LDX_R	ldx	[%r11 + %r31], %r6
	.word 0xcdba997f  ! 355: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcdba991f  ! 356: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 357: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcde2901f  ! 358: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xcde2a01f  ! 359: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcf02a070  ! 360: LDF_I	ld	[%r10, 0x0070], %f7
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3e2a01f  ! 361: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3e2911f  ! 362: CASA_I	casa	[%r10] 0x88, %r31, %r9
	.word 0xd3ba985f  ! 363: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 364: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc85a801f  ! 365: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7ba98bf  ! 366: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa010  ! 367: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xc44a801f  ! 368: LDSB_R	ldsb	[%r10 + %r31], %r2
	.word 0xcfe2901f  ! 369: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcfe2a01f  ! 370: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcff2a01f  ! 371: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcc3aa010  ! 372: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xc2d2a030  ! 373: LDSHA_I	ldsha	[%r10, + 0x0030] %asi, %r1
	.word 0xc3e2a01f  ! 374: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba999f  ! 375: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcccaa04d  ! 376: LDSBA_I	ldsba	[%r10, + 0x004d] %asi, %r6
	.word 0xcbba981f  ! 377: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 378: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba983f  ! 379: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2911f  ! 380: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xce42a000  ! 381: LDSW_I	ldsw	[%r10 + 0x0000], %r7
	.word 0xcfe2a01f  ! 382: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcc3aa038  ! 383: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcfe2911f  ! 384: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcfba995f  ! 385: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfba987f  ! 386: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc502e02c  ! 387: LDF_I	ld	[%r11, 0x002c], %f2
	.word 0xc43a801f  ! 388: STD_R	std	%r2, [%r10 + %r31]
	.word 0xcacaa01a  ! 389: LDSBA_I	ldsba	[%r10, + 0x001a] %asi, %r5
	.word 0xc302801f  ! 390: LDF_R	ld	[%r10, %r31], %f1
TH_LABEL390:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7baa068  ! 391: STDFA_I	stda	%f3, [0x0068, %r10]
	.word 0xcdba987f  ! 392: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc02801f  ! 393: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xcfba985f  ! 394: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba985f  ! 395: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcfba995f  ! 396: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2901f  ! 397: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xce92915f  ! 398: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r7
	.word 0xcc8a903f  ! 399: LDUBA_R	lduba	[%r10, %r31] 0x81, %r6
	.word 0xcc12a038  ! 400: LDUH_I	lduh	[%r10 + 0x0038], %r6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcde2901f  ! 401: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xcc3a801f  ! 402: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba989f  ! 403: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd01aa000  ! 404: LDD_I	ldd	[%r10 + 0x0000], %r8
	.word 0xcecaa01c  ! 405: LDSBA_I	ldsba	[%r10, + 0x001c] %asi, %r7
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcd9ae028  ! 406: LDDFA_I	ldda	[%r11, 0x0028], %f6
	.word 0xcdf2a01f  ! 407: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba999f  ! 408: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc8caa01e  ! 409: LDSBA_I	ldsba	[%r10, + 0x001e] %asi, %r4
	.word 0xd3ba981f  ! 410: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc7baa058  ! 411: STDFA_I	stda	%f3, [0x0058, %r10]
	.word 0xc88aa00d  ! 412: LDUBA_I	lduba	[%r10, + 0x000d] %asi, %r4
	.word 0xd102a03c  ! 413: LDF_I	ld	[%r10, 0x003c], %f8
	.word 0xcff2e01f  ! 414: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xca8aa05f  ! 415: LDUBA_I	lduba	[%r10, + 0x005f] %asi, %r5
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc03ae000  ! 416: STD_I	std	%r0, [%r11 + 0x0000]
	.word 0xd3baa040  ! 417: STDFA_I	stda	%f9, [0x0040, %r10]
	.word 0xd3e2a01f  ! 418: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 419: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3e2a01f  ! 420: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd3ba989f  ! 421: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd0da917f  ! 422: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r8
	.word 0xd1e2903f  ! 423: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xcc9ae078  ! 424: LDDA_I	ldda	[%r11, + 0x0078] %asi, %r6
	.word 0xc83ac01f  ! 425: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcbbad91f  ! 426: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc59ae068  ! 427: LDDFA_I	ldda	[%r11, 0x0068], %f2
	.word 0xc922801f  ! 428: STF_R	st	%f4, [%r31, %r10]
	.word 0xd3bad89f  ! 429: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc7baa068  ! 430: STDFA_I	stda	%f3, [0x0068, %r10]
TH_LABEL430:
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc902a008  ! 431: LDF_I	ld	[%r10, 0x0008], %f4
	.word 0xc89ae028  ! 432: LDDA_I	ldda	[%r11, + 0x0028] %asi, %r4
	.word 0xc3bad91f  ! 433: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d03f  ! 434: CASA_I	casa	[%r11] 0x81, %r31, %r1
	.word 0xc03ac01f  ! 435: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3bad89f  ! 436: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad87f  ! 437: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 438: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d01f  ! 439: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc03ac01f  ! 440: STD_R	std	%r0, [%r11 + %r31]
TH_LABEL440:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc3f2d01f  ! 441: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc88a917f  ! 442: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r4
	.word 0xc902a074  ! 443: LDF_I	ld	[%r10, 0x0074], %f4
	.word 0xc5f2d11f  ! 444: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xc5bad81f  ! 445: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc5bad97f  ! 446: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xcfbaa078  ! 447: STDFA_I	stda	%f7, [0x0078, %r10]
	.word 0xd1ba983f  ! 448: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2903f  ! 449: CASXA_I	casxa	[%r10] 0x81, %r31, %r8
	.word 0xd1f2a01f  ! 450: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcb22801f  ! 451: STF_R	st	%f5, [%r31, %r10]
	.word 0xd3ba981f  ! 452: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd00a801f  ! 453: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xc802a008  ! 454: LDUW_I	lduw	[%r10 + 0x0008], %r4
	.word 0xd3ba99bf  ! 455: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc84a801f  ! 456: LDSB_R	ldsb	[%r10 + %r31], %r4
	.word 0xc83a801f  ! 457: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbf2a01f  ! 458: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2911f  ! 459: CASXA_I	casxa	[%r10] 0x88, %r31, %r5
	.word 0xc59aa070  ! 460: LDDFA_I	ldda	[%r10, 0x0070], %f2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc7e2a01f  ! 461: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc43a801f  ! 462: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7f2901f  ! 463: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba995f  ! 464: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba999f  ! 465: STDFA_R	stda	%f3, [%r31, %r10]
TH_LABEL465:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc7ba995f  ! 466: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc4c2a078  ! 467: LDSWA_I	ldswa	[%r10, + 0x0078] %asi, %r2
	.word 0xd24aa027  ! 468: LDSB_I	ldsb	[%r10 + 0x0027], %r9
	.word 0xc99aa050  ! 469: LDDFA_I	ldda	[%r10, 0x0050], %f4
	.word 0xc48aa01c  ! 470: LDUBA_I	lduba	[%r10, + 0x001c] %asi, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcacaa077  ! 471: LDSBA_I	ldsba	[%r10, + 0x0077] %asi, %r5
	.word 0xc5ba981f  ! 472: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc902c01f  ! 473: LDF_R	ld	[%r11, %r31], %f4
	.word 0xc7f2903f  ! 474: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc7f2a01f  ! 475: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7ba999f  ! 476: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 477: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xccc2d17f  ! 478: LDSWA_R	ldswa	[%r11, %r31] 0x8b, %r6
	.word 0xc3ba987f  ! 479: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc4da907f  ! 480: LDXA_R	ldxa	[%r10, %r31] 0x83, %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbbad89f  ! 481: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd1baa000  ! 482: STDFA_I	stda	%f8, [0x0000, %r10]
	.word 0xc3ba981f  ! 483: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 484: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc03aa008  ! 485: STD_I	std	%r0, [%r10 + 0x0008]
TH_LABEL485:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcd02a014  ! 486: LDF_I	ld	[%r10, 0x0014], %f6
	.word 0xc7bad87f  ! 487: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad9bf  ! 488: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae078  ! 489: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xd012a058  ! 490: LDUH_I	lduh	[%r10 + 0x0058], %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcc3ae030  ! 491: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcdbad85f  ! 492: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad81f  ! 493: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2d01f  ! 494: CASA_I	casa	[%r11] 0x80, %r31, %r6
	.word 0xcdbad89f  ! 495: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc48ad05f  ! 496: LDUBA_R	lduba	[%r11, %r31] 0x82, %r2
	.word 0xc7ba995f  ! 497: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2903f  ! 498: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc81ac01f  ! 499: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xcfba997f  ! 500: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfba981f  ! 501: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 502: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2911f  ! 503: CASXA_I	casxa	[%r10] 0x88, %r31, %r7
	.word 0xcff2a01f  ! 504: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc89aa038  ! 505: LDDA_I	ldda	[%r10, + 0x0038] %asi, %r4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd1ba991f  ! 506: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa000  ! 507: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd1ba991f  ! 508: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc502801f  ! 509: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc03a801f  ! 510: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc522801f  ! 511: STF_R	st	%f2, [%r31, %r10]
	.word 0xcbba981f  ! 512: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba993f  ! 513: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcf02801f  ! 514: LDF_R	ld	[%r10, %r31], %f7
	.word 0xc99aa020  ! 515: LDDFA_I	ldda	[%r10, 0x0020], %f4
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc2d2903f  ! 516: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r1
	.word 0xd19ae008  ! 517: LDDFA_I	ldda	[%r11, 0x0008], %f8
	.word 0xd302801f  ! 518: LDF_R	ld	[%r10, %r31], %f9
	.word 0xcfbae028  ! 519: STDFA_I	stda	%f7, [0x0028, %r11]
	.word 0xcff2a01f  ! 520: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfe2913f  ! 521: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcfba995f  ! 522: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 523: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 524: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xce5a801f  ! 525: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1ba983f  ! 526: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 527: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba989f  ! 528: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 529: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba98bf  ! 530: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1e2a01f  ! 531: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 532: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd08ae05d  ! 533: LDUBA_I	lduba	[%r11, + 0x005d] %asi, %r8
	.word 0xc852a06c  ! 534: LDSH_I	ldsh	[%r10 + 0x006c], %r4
	.word 0xcfba985f  ! 535: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcfe2a01f  ! 536: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2901f  ! 537: CASA_I	casa	[%r10] 0x80, %r31, %r7
	.word 0xcc3a801f  ! 538: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba985f  ! 539: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba985f  ! 540: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3baa068  ! 541: STDFA_I	stda	%f1, [0x0068, %r10]
	.word 0xcbba981f  ! 542: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 543: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba991f  ! 544: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba985f  ! 545: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbba991f  ! 546: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba991f  ! 547: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba981f  ! 548: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcadaa008  ! 549: LDXA_I	ldxa	[%r10, + 0x0008] %asi, %r5
	.word 0xcbbaa030  ! 550: STDFA_I	stda	%f5, [0x0030, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcbf2913f  ! 551: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xc83aa038  ! 552: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xcbf2a01f  ! 553: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xccdaa020  ! 554: LDXA_I	ldxa	[%r10, + 0x0020] %asi, %r6
	.word 0xc5ba993f  ! 555: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5e2903f  ! 556: CASA_I	casa	[%r10] 0x81, %r31, %r2
	.word 0xc5ba997f  ! 557: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba99bf  ! 558: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 559: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd302a00c  ! 560: LDF_I	ld	[%r10, 0x000c], %f9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc7ba981f  ! 561: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc452801f  ! 562: LDSH_R	ldsh	[%r10 + %r31], %r2
	.word 0xd28aa009  ! 563: LDUBA_I	lduba	[%r10, + 0x0009] %asi, %r9
	.word 0xc40a801f  ! 564: LDUB_R	ldub	[%r10 + %r31], %r2
	.word 0xc7ba987f  ! 565: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc412c01f  ! 566: LDUH_R	lduh	[%r11 + %r31], %r2
	.word 0xc43aa058  ! 567: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc7ba991f  ! 568: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba981f  ! 569: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc612e05c  ! 570: LDUH_I	lduh	[%r11 + 0x005c], %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1f2d11f  ! 571: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xd1f2d13f  ! 572: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
	.word 0xd1e2e01f  ! 573: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xc59aa040  ! 574: LDDFA_I	ldda	[%r10, 0x0040], %f2
	.word 0xd01ae018  ! 575: LDD_I	ldd	[%r11 + 0x0018], %r8
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd03aa040  ! 576: STD_I	std	%r8, [%r10 + 0x0040]
	.word 0xd3ba997f  ! 577: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 578: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd3ba983f  ! 579: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xce82901f  ! 580: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r7
TH_LABEL580:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5ba983f  ! 581: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba983f  ! 582: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 583: STD_R	std	%r2, [%r10 + %r31]
	.word 0xd05a801f  ! 584: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xcdbaa010  ! 585: STDFA_I	stda	%f6, [0x0010, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5f2911f  ! 586: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xc5ba981f  ! 587: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2903f  ! 588: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xce02a074  ! 589: LDUW_I	lduw	[%r10 + 0x0074], %r7
	.word 0xcbba989f  ! 590: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd092d15f  ! 591: LDUHA_R	lduha	[%r11, %r31] 0x8a, %r8
	.word 0xc9bad83f  ! 592: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9f2e01f  ! 593: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xccca901f  ! 594: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r6
	.word 0xc902801f  ! 595: LDF_R	ld	[%r10, %r31], %f4
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd212e00a  ! 596: LDUH_I	lduh	[%r11 + 0x000a], %r9
	.word 0xd3bad89f  ! 597: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad95f  ! 598: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad9bf  ! 599: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc65ae038  ! 600: LDX_I	ldx	[%r11 + 0x0038], %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5bad83f  ! 601: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd00ae015  ! 602: LDUB_I	ldub	[%r11 + 0x0015], %r8
	.word 0xcbbad83f  ! 603: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc8da913f  ! 604: LDXA_R	ldxa	[%r10, %r31] 0x89, %r4
	.word 0xc84ac01f  ! 605: LDSB_R	ldsb	[%r11 + %r31], %r4
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7bae038  ! 606: STDFA_I	stda	%f3, [0x0038, %r11]
	.word 0xc7bad95f  ! 607: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc602c01f  ! 608: LDUW_R	lduw	[%r11 + %r31], %r3
	.word 0xc68aa00b  ! 609: LDUBA_I	lduba	[%r10, + 0x000b] %asi, %r3
	.word 0xcc12a038  ! 610: LDUH_I	lduh	[%r10 + 0x0038], %r6
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc83ae020  ! 611: STD_I	std	%r4, [%r11 + 0x0020]
	.word 0xc9bad87f  ! 612: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc01ae038  ! 613: LDD_I	ldd	[%r11 + 0x0038], %r0
	.word 0xcdbad97f  ! 614: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc202a00c  ! 615: LDUW_I	lduw	[%r10 + 0x000c], %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3f2d01f  ! 616: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc80aa047  ! 617: LDUB_I	ldub	[%r10 + 0x0047], %r4
	.word 0xceca905f  ! 618: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r7
	.word 0xced2903f  ! 619: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r7
	.word 0xc702801f  ! 620: LDF_R	ld	[%r10, %r31], %f3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc83ae070  ! 621: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xc45a801f  ! 622: LDX_R	ldx	[%r10 + %r31], %r2
	.word 0xd3bad8bf  ! 623: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad99f  ! 624: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd102801f  ! 625: LDF_R	ld	[%r10, %r31], %f8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc83a801f  ! 626: STD_R	std	%r4, [%r10 + %r31]
	.word 0xce4aa01b  ! 627: LDSB_I	ldsb	[%r10 + 0x001b], %r7
	.word 0xc3ba981f  ! 628: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba993f  ! 629: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 630: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc412a02c  ! 631: LDUH_I	lduh	[%r10 + 0x002c], %r2
	.word 0xc9bad95f  ! 632: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd042801f  ! 633: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xcc92a02c  ! 634: LDUHA_I	lduha	[%r10, + 0x002c] %asi, %r6
	.word 0xcdf2e01f  ! 635: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcad2e076  ! 636: LDSHA_I	ldsha	[%r11, + 0x0076] %asi, %r5
	.word 0xcff2913f  ! 637: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xcff2901f  ! 638: CASXA_I	casxa	[%r10] 0x80, %r31, %r7
	.word 0xcfe2911f  ! 639: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xc602801f  ! 640: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfba989f  ! 641: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd09aa058  ! 642: LDDA_I	ldda	[%r10, + 0x0058] %asi, %r8
	.word 0xc902801f  ! 643: LDF_R	ld	[%r10, %r31], %f4
	.word 0xcb02e058  ! 644: LDF_I	ld	[%r11, 0x0058], %f5
	.word 0xd242801f  ! 645: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc4ac01f  ! 646: LDSB_R	ldsb	[%r11 + %r31], %r6
	.word 0xc4cad05f  ! 647: LDSBA_R	ldsba	[%r11, %r31] 0x82, %r2
	.word 0xc9ba995f  ! 648: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba989f  ! 649: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba987f  ! 650: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc9f2a01f  ! 651: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc83aa010  ! 652: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xc9e2913f  ! 653: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xcecae064  ! 654: LDSBA_I	ldsba	[%r11, + 0x0064] %asi, %r7
	.word 0xd2d2a04a  ! 655: LDSHA_I	ldsha	[%r10, + 0x004a] %asi, %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9ba997f  ! 656: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcedaa018  ! 657: LDXA_I	ldxa	[%r10, + 0x0018] %asi, %r7
	.word 0xc5e2913f  ! 658: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xce4ae070  ! 659: LDSB_I	ldsb	[%r11 + 0x0070], %r7
	.word 0xcc3ae030  ! 660: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcfbad93f  ! 661: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbae030  ! 662: STDFA_I	stda	%f7, [0x0030, %r11]
	.word 0xd1e2e01f  ! 663: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xc502a034  ! 664: LDF_I	ld	[%r10, 0x0034], %f2
	.word 0xc3ba985f  ! 665: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3ba99bf  ! 666: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2911f  ! 667: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xca92903f  ! 668: LDUHA_R	lduha	[%r10, %r31] 0x81, %r5
	.word 0xd0c2d05f  ! 669: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r8
	.word 0xd042801f  ! 670: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd03ac01f  ! 671: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad99f  ! 672: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc9baa000  ! 673: STDFA_I	stda	%f4, [0x0000, %r10]
	.word 0xc5ba987f  ! 674: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa038  ! 675: STD_I	std	%r2, [%r10 + 0x0038]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xce5ae048  ! 676: LDX_I	ldx	[%r11 + 0x0048], %r7
	.word 0xc502e070  ! 677: LDF_I	ld	[%r11, 0x0070], %f2
	.word 0xc9e2e01f  ! 678: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad8bf  ! 679: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad9bf  ! 680: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9bad95f  ! 681: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d11f  ! 682: CASA_I	casa	[%r11] 0x88, %r31, %r4
	.word 0xc83ae060  ! 683: STD_I	std	%r4, [%r11 + 0x0060]
	.word 0xcc8aa03e  ! 684: LDUBA_I	lduba	[%r10, + 0x003e] %asi, %r6
	.word 0xcadae060  ! 685: LDXA_I	ldxa	[%r11, + 0x0060] %asi, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcff2e01f  ! 686: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcfbad97f  ! 687: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d01f  ! 688: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xc60a801f  ! 689: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xd1ba985f  ! 690: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd05aa020  ! 691: LDX_I	ldx	[%r10 + 0x0020], %r8
	.word 0xcec2a034  ! 692: LDSWA_I	ldswa	[%r10, + 0x0034] %asi, %r7
	.word 0xc43ae028  ! 693: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc43ac01f  ! 694: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7bad91f  ! 695: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc80a801f  ! 696: LDUB_R	ldub	[%r10 + %r31], %r4
	.word 0xc7e2a01f  ! 697: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba993f  ! 698: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xca52e05c  ! 699: LDSH_I	ldsh	[%r11 + 0x005c], %r5
	.word 0xc3f2a01f  ! 700: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3ba999f  ! 701: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 702: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3f2a01f  ! 703: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba981f  ! 704: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba999f  ! 705: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3ba997f  ! 706: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba995f  ! 707: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc6daa078  ! 708: LDXA_I	ldxa	[%r10, + 0x0078] %asi, %r3
	.word 0xc602801f  ! 709: LDUW_R	lduw	[%r10 + %r31], %r3
	.word 0xc242e048  ! 710: LDSW_I	ldsw	[%r11 + 0x0048], %r1
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3e2a01f  ! 711: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3e2a01f  ! 712: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba981f  ! 713: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2903f  ! 714: CASXA_I	casxa	[%r10] 0x81, %r31, %r9
	.word 0xd03a801f  ! 715: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3f2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc892d01f  ! 717: LDUHA_R	lduha	[%r11, %r31] 0x80, %r4
	.word 0xc39ae048  ! 718: LDDFA_I	ldda	[%r11, 0x0048], %f1
	.word 0xc902a07c  ! 719: LDF_I	ld	[%r10, 0x007c], %f4
	.word 0xd3e2d01f  ! 720: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbbae030  ! 721: STDFA_I	stda	%f5, [0x0030, %r11]
	.word 0xd3ba993f  ! 722: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba99bf  ! 723: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba98bf  ! 724: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba983f  ! 725: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3ba981f  ! 726: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcf9aa058  ! 727: LDDFA_I	ldda	[%r10, 0x0058], %f7
	.word 0xd322c01f  ! 728: STF_R	st	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 729: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3f2d13f  ! 730: CASXA_I	casxa	[%r11] 0x89, %r31, %r9
TH_LABEL730:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xca8a907f  ! 731: LDUBA_R	lduba	[%r10, %r31] 0x83, %r5
	.word 0xc5e2911f  ! 732: CASA_I	casa	[%r10] 0x88, %r31, %r2
	.word 0xc5ba98bf  ! 733: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 734: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba995f  ! 735: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xce52a01e  ! 736: LDSH_I	ldsh	[%r10 + 0x001e], %r7
	.word 0xc3ba983f  ! 737: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xca4a801f  ! 738: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xc7f2a01f  ! 739: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7f2913f  ! 740: CASXA_I	casxa	[%r10] 0x89, %r31, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc64aa005  ! 741: LDSB_I	ldsb	[%r10 + 0x0005], %r3
	.word 0xcfe2a01f  ! 742: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba993f  ! 743: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 744: STD_R	std	%r6, [%r10 + %r31]
	.word 0xce12a034  ! 745: LDUH_I	lduh	[%r10 + 0x0034], %r7
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc88a901f  ! 746: LDUBA_R	lduba	[%r10, %r31] 0x80, %r4
	.word 0xccdae058  ! 747: LDXA_I	ldxa	[%r11, + 0x0058] %asi, %r6
	.word 0xd202c01f  ! 748: LDUW_R	lduw	[%r11 + %r31], %r9
	.word 0xca12c01f  ! 749: LDUH_R	lduh	[%r11 + %r31], %r5
	.word 0xcc9aa040  ! 750: LDDA_I	ldda	[%r10, + 0x0040] %asi, %r6
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xd082a074  ! 751: LDUWA_I	lduwa	[%r10, + 0x0074] %asi, %r8
	.word 0xc5e2e01f  ! 752: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad99f  ! 753: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad89f  ! 754: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd24aa019  ! 755: LDSB_I	ldsb	[%r10 + 0x0019], %r9
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfba991f  ! 756: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd20ac01f  ! 757: LDUB_R	ldub	[%r11 + %r31], %r9
	.word 0xc9e2d03f  ! 758: CASA_I	casa	[%r11] 0x81, %r31, %r4
	.word 0xc9f2d01f  ! 759: CASXA_I	casxa	[%r11] 0x80, %r31, %r4
	.word 0xcc9aa050  ! 760: LDDA_I	ldda	[%r10, + 0x0050] %asi, %r6
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc502a064  ! 761: LDF_I	ld	[%r10, 0x0064], %f2
	.word 0xc9ba999f  ! 762: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc40ae05c  ! 763: LDUB_I	ldub	[%r11 + 0x005c], %r2
	.word 0xc702a04c  ! 764: LDF_I	ld	[%r10, 0x004c], %f3
	.word 0xc9ba987f  ! 765: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL765:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc83a801f  ! 766: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba98bf  ! 767: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2903f  ! 768: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc9ba981f  ! 769: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba987f  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xcc82a048  ! 771: LDUWA_I	lduwa	[%r10, + 0x0048] %asi, %r6
	.word 0xd302801f  ! 772: LDF_R	ld	[%r10, %r31], %f9
	.word 0xcfba981f  ! 773: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc88aa07d  ! 774: LDUBA_I	lduba	[%r10, + 0x007d] %asi, %r4
	.word 0xc41aa030  ! 775: LDD_I	ldd	[%r10 + 0x0030], %r2
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1f2d13f  ! 776: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
	.word 0xca12801f  ! 777: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xc7f2911f  ! 778: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba991f  ! 779: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc09aa018  ! 780: LDDA_I	ldda	[%r10, + 0x0018] %asi, %r0
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xce52c01f  ! 781: LDSH_R	ldsh	[%r11 + %r31], %r7
	.word 0xcbba985f  ! 782: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba98bf  ! 783: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd28aa06a  ! 784: LDUBA_I	lduba	[%r10, + 0x006a] %asi, %r9
	.word 0xc68a915f  ! 785: LDUBA_R	lduba	[%r10, %r31] 0x8a, %r3
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd3e2a01f  ! 786: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 787: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd102a04c  ! 788: LDF_I	ld	[%r10, 0x004c], %f8
	.word 0xd28aa05e  ! 789: LDUBA_I	lduba	[%r10, + 0x005e] %asi, %r9
	.word 0xd1bad87f  ! 790: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1bad8bf  ! 791: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 792: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc452a072  ! 793: LDSH_I	ldsh	[%r10 + 0x0072], %r2
	.word 0xc83ac01f  ! 794: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbf2e01f  ! 795: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd19aa018  ! 796: LDDFA_I	ldda	[%r10, 0x0018], %f8
	.word 0xcdba99bf  ! 797: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 798: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd0d2901f  ! 799: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r8
	.word 0xc44aa008  ! 800: LDSB_I	ldsb	[%r10 + 0x0008], %r2
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5bae010  ! 801: STDFA_I	stda	%f2, [0x0010, %r11]
	.word 0xc5ba989f  ! 802: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 803: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43a801f  ! 804: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa068  ! 805: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5ba98bf  ! 806: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba999f  ! 807: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcec2903f  ! 808: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r7
	.word 0xc7baa010  ! 809: STDFA_I	stda	%f3, [0x0010, %r10]
	.word 0xcad2911f  ! 810: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r5
TH_LABEL810:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xca12e020  ! 811: LDUH_I	lduh	[%r11 + 0x0020], %r5
	.word 0xc9ba999f  ! 812: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2911f  ! 813: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc9ba985f  ! 814: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc41aa010  ! 815: LDD_I	ldd	[%r10 + 0x0010], %r2
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcaca911f  ! 816: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r5
	.word 0xcff2a01f  ! 817: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfe2a01f  ! 818: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2913f  ! 819: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xc45aa058  ! 820: LDX_I	ldx	[%r10 + 0x0058], %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba991f  ! 821: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcada905f  ! 822: LDXA_R	ldxa	[%r10, %r31] 0x82, %r5
	.word 0xcadae058  ! 823: LDXA_I	ldxa	[%r11, + 0x0058] %asi, %r5
	.word 0xc9baa068  ! 824: STDFA_I	stda	%f4, [0x0068, %r10]
	.word 0xce0a801f  ! 825: LDUB_R	ldub	[%r10 + %r31], %r7
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc8c2901f  ! 826: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r4
	.word 0xc85ac01f  ! 827: LDX_R	ldx	[%r11 + %r31], %r4
	.word 0xc9ba985f  ! 828: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 829: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba993f  ! 830: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc83a801f  ! 831: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc4d2913f  ! 832: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r2
	.word 0xce42801f  ! 833: LDSW_R	ldsw	[%r10 + %r31], %r7
	.word 0xc7e2a01f  ! 834: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba997f  ! 835: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd04a801f  ! 836: LDSB_R	ldsb	[%r10 + %r31], %r8
	.word 0xc7ba981f  ! 837: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2911f  ! 838: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba993f  ! 839: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 840: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc88a901f  ! 841: LDUBA_R	lduba	[%r10, %r31] 0x80, %r4
	.word 0xd01ac01f  ! 842: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xc7ba993f  ! 843: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 844: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2a01f  ! 845: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7ba989f  ! 846: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd122c01f  ! 847: STF_R	st	%f8, [%r31, %r11]
	.word 0xc5e2901f  ! 848: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2903f  ! 849: CASXA_I	casxa	[%r10] 0x81, %r31, %r2
	.word 0xc81ac01f  ! 850: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd19aa068  ! 851: LDDFA_I	ldda	[%r10, 0x0068], %f8
	.word 0xd002a06c  ! 852: LDUW_I	lduw	[%r10 + 0x006c], %r8
	.word 0xc7f2a01f  ! 853: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba997f  ! 854: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba983f  ! 855: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc482a06c  ! 856: LDUWA_I	lduwa	[%r10, + 0x006c] %asi, %r2
	.word 0xcfbae020  ! 857: STDFA_I	stda	%f7, [0x0020, %r11]
	.word 0xd3bad83f  ! 858: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd2cad17f  ! 859: LDSBA_R	ldsba	[%r11, %r31] 0x8b, %r9
	.word 0xc9ba995f  ! 860: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL860:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc9e2a01f  ! 861: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83a801f  ! 862: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc302801f  ! 863: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc302a00c  ! 864: LDF_I	ld	[%r10, 0x000c], %f1
	.word 0xd01ac01f  ! 865: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1e2903f  ! 866: CASA_I	casa	[%r10] 0x81, %r31, %r8
	.word 0xc652c01f  ! 867: LDSH_R	ldsh	[%r11 + %r31], %r3
	.word 0xd3ba999f  ! 868: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc6d2e000  ! 869: LDSHA_I	ldsha	[%r11, + 0x0000] %asi, %r3
	.word 0xd102a044  ! 870: LDF_I	ld	[%r10, 0x0044], %f8
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba999f  ! 871: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc282d07f  ! 872: LDUWA_R	lduwa	[%r11, %r31] 0x83, %r1
	.word 0xcfba987f  ! 873: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 874: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcdbae068  ! 875: STDFA_I	stda	%f6, [0x0068, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3ba995f  ! 876: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2911f  ! 877: CASA_I	casa	[%r10] 0x88, %r31, %r1
	.word 0xc802801f  ! 878: LDUW_R	lduw	[%r10 + %r31], %r4
	.word 0xc83ae048  ! 879: STD_I	std	%r4, [%r11 + 0x0048]
	.word 0xd292915f  ! 880: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r9
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc3baa060  ! 881: STDFA_I	stda	%f1, [0x0060, %r10]
	.word 0xcdba981f  ! 882: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba989f  ! 883: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 884: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 885: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd09aa048  ! 886: LDDA_I	ldda	[%r10, + 0x0048] %asi, %r8
	.word 0xd1f2a01f  ! 887: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba989f  ! 888: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa020  ! 889: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xc09ae068  ! 890: LDDA_I	ldda	[%r11, + 0x0068] %asi, %r0
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfbad91f  ! 891: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad93f  ! 892: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcbbaa008  ! 893: STDFA_I	stda	%f5, [0x0008, %r10]
	.word 0xcbe2a01f  ! 894: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba993f  ! 895: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcbba993f  ! 896: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 897: STD_R	std	%r4, [%r10 + %r31]
	.word 0xd042801f  ! 898: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xd2dad01f  ! 899: LDXA_R	ldxa	[%r11, %r31] 0x80, %r9
	.word 0xc3bad9bf  ! 900: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc3bad85f  ! 901: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d11f  ! 902: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xc3bad83f  ! 903: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xd2c2917f  ! 904: LDSWA_R	ldswa	[%r10, %r31] 0x8b, %r9
	.word 0xc7ba997f  ! 905: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd2c2a064  ! 906: LDSWA_I	ldswa	[%r10, + 0x0064] %asi, %r9
	.word 0xd3f2a01f  ! 907: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc502e05c  ! 908: LDF_I	ld	[%r11, 0x005c], %f2
	.word 0xcbbad81f  ! 909: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d03f  ! 910: CASA_I	casa	[%r11] 0x81, %r31, %r5
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcbf2d01f  ! 911: CASXA_I	casxa	[%r11] 0x80, %r31, %r5
	.word 0xcbf2e01f  ! 912: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad81f  ! 913: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc88ae003  ! 914: LDUBA_I	lduba	[%r11, + 0x0003] %asi, %r4
	.word 0xd3bad93f  ! 915: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc39ae050  ! 916: LDDFA_I	ldda	[%r11, 0x0050], %f1
	.word 0xd25ac01f  ! 917: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xd1bad95f  ! 918: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad99f  ! 919: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad91f  ! 920: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1f2e01f  ! 921: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad83f  ! 922: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d01f  ! 923: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xd03ac01f  ! 924: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2e01f  ! 925: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd1bad95f  ! 926: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd19ae028  ! 927: LDDFA_I	ldda	[%r11, 0x0028], %f8
	.word 0xcdbad85f  ! 928: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 929: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcdbad97f  ! 930: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcdbad83f  ! 931: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad93f  ! 932: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad85f  ! 933: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd19ae038  ! 934: LDDFA_I	ldda	[%r11, 0x0038], %f8
	.word 0xd03aa030  ! 935: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd25a801f  ! 936: LDX_R	ldx	[%r10 + %r31], %r9
	.word 0xcdba983f  ! 937: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba989f  ! 938: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 939: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 940: CASA_R	casa	[%r10] %asi, %r31, %r6
TH_LABEL940:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc892d01f  ! 941: LDUHA_R	lduha	[%r11, %r31] 0x80, %r4
	.word 0xc5e2901f  ! 942: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba999f  ! 943: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xd292d07f  ! 944: LDUHA_R	lduha	[%r11, %r31] 0x83, %r9
	.word 0xce42c01f  ! 945: LDSW_R	ldsw	[%r11 + %r31], %r7
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3ba995f  ! 946: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc99aa070  ! 947: LDDFA_I	ldda	[%r10, 0x0070], %f4
	.word 0xc5e2d01f  ! 948: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xc5bad89f  ! 949: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 950: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcb9ae030  ! 951: LDDFA_I	ldda	[%r11, 0x0030], %f5
	.word 0xc9f2e01f  ! 952: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xce8a917f  ! 953: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r7
	.word 0xcacaa024  ! 954: LDSBA_I	ldsba	[%r10, + 0x0024] %asi, %r5
	.word 0xcfba985f  ! 955: STDFA_R	stda	%f7, [%r31, %r10]
TH_LABEL955:
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcc9aa060  ! 956: LDDA_I	ldda	[%r10, + 0x0060] %asi, %r6
	.word 0xcbba98bf  ! 957: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa040  ! 958: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xcbba99bf  ! 959: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc80ac01f  ! 960: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc03aa040  ! 961: STD_I	std	%r0, [%r10 + 0x0040]
	.word 0xc3e2903f  ! 962: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc3ba989f  ! 963: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc65a801f  ! 964: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xc45ac01f  ! 965: LDX_R	ldx	[%r11 + %r31], %r2
TH_LABEL965:
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc41aa040  ! 966: LDD_I	ldd	[%r10 + 0x0040], %r2
	.word 0xcdba99bf  ! 967: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba98bf  ! 968: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba993f  ! 969: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 970: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc6d2d07f  ! 971: LDSHA_R	ldsha	[%r11, %r31] 0x83, %r3
	.word 0xcbba99bf  ! 972: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba993f  ! 973: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc40aa017  ! 974: LDUB_I	ldub	[%r10 + 0x0017], %r2
	.word 0xd3ba999f  ! 975: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3e2903f  ! 976: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd3f2a01f  ! 977: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03aa058  ! 978: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3f2a01f  ! 979: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 980: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3ba99bf  ! 981: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 982: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba989f  ! 983: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 984: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 985: CASXA_R	casxa	[%r10]%asi, %r31, %r9
TH_LABEL985:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc6d2d11f  ! 986: LDSHA_R	ldsha	[%r11, %r31] 0x88, %r3
	.word 0xc9ba991f  ! 987: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd01aa040  ! 988: LDD_I	ldd	[%r10 + 0x0040], %r8
	.word 0xcde2e01f  ! 989: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xc79aa018  ! 990: LDDFA_I	ldda	[%r10, 0x0018], %f3
TH_LABEL990:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc882a008  ! 991: LDUWA_I	lduwa	[%r10, + 0x0008] %asi, %r4
	.word 0xd322801f  ! 992: STF_R	st	%f9, [%r31, %r10]
	.word 0xc79aa008  ! 993: LDDFA_I	ldda	[%r10, 0x0008], %f3
	.word 0xc502a010  ! 994: LDF_I	ld	[%r10, 0x0010], %f2
	.word 0xc7f2d01f  ! 995: CASXA_I	casxa	[%r11] 0x80, %r31, %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcf22801f  ! 996: STF_R	st	%f7, [%r31, %r10]
	.word 0xc7bae068  ! 997: STDFA_I	stda	%f3, [0x0068, %r11]
	.word 0xc9f2913f  ! 998: CASXA_I	casxa	[%r10] 0x89, %r31, %r4
	.word 0xc9f2911f  ! 999: CASXA_I	casxa	[%r10] 0x88, %r31, %r4
	.word 0xc59aa018  ! 1000: LDDFA_I	ldda	[%r10, 0x0018], %f2
TH_LABEL1000:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
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
	.word 0xc8da911f  ! 2: LDXA_R	ldxa	[%r10, %r31] 0x88, %r4
	.word 0xce0aa031  ! 3: LDUB_I	ldub	[%r10 + 0x0031], %r7
	.word 0xc49ae060  ! 4: LDDA_I	ldda	[%r11, + 0x0060] %asi, %r2
	.word 0xc5f2d13f  ! 5: CASXA_I	casxa	[%r11] 0x89, %r31, %r2
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc64a801f  ! 6: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xcd9aa020  ! 7: LDDFA_I	ldda	[%r10, 0x0020], %f6
	.word 0xcdba991f  ! 8: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 9: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xd1baa038  ! 10: STDFA_I	stda	%f8, [0x0038, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xce5ae020  ! 11: LDX_I	ldx	[%r11 + 0x0020], %r7
	.word 0xcff2d01f  ! 12: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xcfbad83f  ! 13: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad85f  ! 14: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad91f  ! 15: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd24ac01f  ! 16: LDSB_R	ldsb	[%r11 + %r31], %r9
	.word 0xc2dae050  ! 17: LDXA_I	ldxa	[%r11, + 0x0050] %asi, %r1
	.word 0xc612a04e  ! 18: LDUH_I	lduh	[%r10 + 0x004e], %r3
	.word 0xc7ba98bf  ! 19: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba995f  ! 20: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc4c2903f  ! 21: LDSWA_R	ldswa	[%r10, %r31] 0x81, %r2
	.word 0xc5f2901f  ! 22: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xd042c01f  ! 23: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xd1bad83f  ! 24: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcd02801f  ! 25: LDF_R	ld	[%r10, %r31], %f6
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc652a02a  ! 26: LDSH_I	ldsh	[%r10 + 0x002a], %r3
	.word 0xc402a01c  ! 27: LDUW_I	lduw	[%r10 + 0x001c], %r2
	.word 0xc5e2a01f  ! 28: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc5e2901f  ! 29: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5e2a01f  ! 30: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc5ba985f  ! 31: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc612a02c  ! 32: LDUH_I	lduh	[%r10 + 0x002c], %r3
	.word 0xc7ba991f  ! 33: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 34: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7f2a01f  ! 35: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd3baa040  ! 36: STDFA_I	stda	%f9, [0x0040, %r10]
	.word 0xd03aa040  ! 37: STD_I	std	%r8, [%r10 + 0x0040]
	.word 0xd3ba983f  ! 38: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba985f  ! 39: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc4dad01f  ! 40: LDXA_R	ldxa	[%r11, %r31] 0x80, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xca92a06e  ! 41: LDUHA_I	lduha	[%r10, + 0x006e] %asi, %r5
	.word 0xc88a917f  ! 42: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r4
	.word 0xc9f2901f  ! 43: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc842c01f  ! 44: LDSW_R	ldsw	[%r11 + %r31], %r4
	.word 0xc83ac01f  ! 45: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9e2d01f  ! 46: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc83ae068  ! 47: STD_I	std	%r4, [%r11 + 0x0068]
	.word 0xc9bad9bf  ! 48: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2e01f  ! 49: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9e2e01f  ! 50: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd0c2915f  ! 51: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r8
	.word 0xd1ba987f  ! 52: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xce82917f  ! 53: LDUWA_R	lduwa	[%r10, %r31] 0x8b, %r7
	.word 0xd202e018  ! 54: LDUW_I	lduw	[%r11 + 0x0018], %r9
	.word 0xd03ac01f  ! 55: STD_R	std	%r8, [%r11 + %r31]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3f2d11f  ! 56: CASXA_I	casxa	[%r11] 0x88, %r31, %r9
	.word 0xc492d07f  ! 57: LDUHA_R	lduha	[%r11, %r31] 0x83, %r2
	.word 0xcfbae030  ! 58: STDFA_I	stda	%f7, [0x0030, %r11]
	.word 0xcfbad8bf  ! 59: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d01f  ! 60: CASXA_I	casxa	[%r11] 0x80, %r31, %r7
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xcfbad97f  ! 61: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc99aa018  ! 62: LDDFA_I	ldda	[%r10, 0x0018], %f4
	.word 0xccca905f  ! 63: LDSBA_R	ldsba	[%r10, %r31] 0x82, %r6
	.word 0xcc3a801f  ! 64: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcd9aa070  ! 65: LDDFA_I	ldda	[%r10, 0x0070], %f6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdf2a01f  ! 66: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcc3a801f  ! 67: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba991f  ! 68: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc6d2e064  ! 69: LDSHA_I	ldsha	[%r11, + 0x0064] %asi, %r3
	.word 0xc902a000  ! 70: LDF_I	ld	[%r10, 0x0000], %f4
TH_LABEL70:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcd02801f  ! 71: LDF_R	ld	[%r10, %r31], %f6
	.word 0xcde2a01f  ! 72: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xcdf2903f  ! 73: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xcc02801f  ! 74: LDUW_R	lduw	[%r10 + %r31], %r6
	.word 0xcc3aa000  ! 75: STD_I	std	%r6, [%r10 + 0x0000]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc88ad03f  ! 76: LDUBA_R	lduba	[%r11, %r31] 0x81, %r4
	.word 0xc9bad95f  ! 77: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd122801f  ! 78: STF_R	st	%f8, [%r31, %r10]
	.word 0xd0c2a034  ! 79: LDSWA_I	ldswa	[%r10, + 0x0034] %asi, %r8
	.word 0xc5baa070  ! 80: STDFA_I	stda	%f2, [0x0070, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcad2d17f  ! 81: LDSHA_R	ldsha	[%r11, %r31] 0x8b, %r5
	.word 0xc892901f  ! 82: LDUHA_R	lduha	[%r10, %r31] 0x80, %r4
	.word 0xc9ba983f  ! 83: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9e2a01f  ! 84: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83aa070  ! 85: STD_I	std	%r4, [%r10 + 0x0070]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc4dae068  ! 86: LDXA_I	ldxa	[%r11, + 0x0068] %asi, %r2
	.word 0xc5bad83f  ! 87: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc452a044  ! 88: LDSH_I	ldsh	[%r10 + 0x0044], %r2
	.word 0xc5ba98bf  ! 89: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 90: STD_R	std	%r2, [%r10 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc5ba99bf  ! 91: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba985f  ! 92: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc292a05c  ! 93: LDUHA_I	lduha	[%r10, + 0x005c] %asi, %r1
	.word 0xc03aa058  ! 94: STD_I	std	%r0, [%r10 + 0x0058]
	.word 0xc212801f  ! 95: LDUH_R	lduh	[%r10 + %r31], %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3ba999f  ! 96: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba997f  ! 97: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2901f  ! 98: CASA_I	casa	[%r10] 0x80, %r31, %r1
	.word 0xc3ba99bf  ! 99: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc4d2e064  ! 100: LDSHA_I	ldsha	[%r11, + 0x0064] %asi, %r2
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcedaa060  ! 101: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r7
	.word 0xcc3aa060  ! 102: STD_I	std	%r6, [%r10 + 0x0060]
	.word 0xc3baa058  ! 103: STDFA_I	stda	%f1, [0x0058, %r10]
	.word 0xd052a068  ! 104: LDSH_I	ldsh	[%r10 + 0x0068], %r8
	.word 0xd05a801f  ! 105: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5baa060  ! 106: STDFA_I	stda	%f2, [0x0060, %r10]
	.word 0xc5ba987f  ! 107: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5e2913f  ! 108: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc59aa048  ! 109: LDDFA_I	ldda	[%r10, 0x0048], %f2
	.word 0xc5ba987f  ! 110: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc43a801f  ! 111: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc702a068  ! 112: LDF_I	ld	[%r10, 0x0068], %f3
	.word 0xca02801f  ! 113: LDUW_R	lduw	[%r10 + %r31], %r5
	.word 0xcbf2a01f  ! 114: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbba995f  ! 115: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc302c01f  ! 116: LDF_R	ld	[%r11, %r31], %f1
	.word 0xc3e2e01f  ! 117: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d03f  ! 118: CASXA_I	casxa	[%r11] 0x81, %r31, %r1
	.word 0xc3e2e01f  ! 119: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3e2d11f  ! 120: CASA_I	casa	[%r11] 0x88, %r31, %r1
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc3f2d13f  ! 121: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xc3f2e01f  ! 122: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad81f  ! 123: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xcbbaa040  ! 124: STDFA_I	stda	%f5, [0x0040, %r10]
	.word 0xcbba987f  ! 125: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbba99bf  ! 126: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba999f  ! 127: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba985f  ! 128: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xccd2e064  ! 129: LDSHA_I	ldsha	[%r11, + 0x0064] %asi, %r6
	.word 0xcdbad99f  ! 130: STDFA_R	stda	%f6, [%r31, %r11]
TH_LABEL130:
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcc3ae060  ! 131: STD_I	std	%r6, [%r11 + 0x0060]
	.word 0xd08a913f  ! 132: LDUBA_R	lduba	[%r10, %r31] 0x89, %r8
	.word 0xd1ba98bf  ! 133: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2901f  ! 134: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1e2a01f  ! 135: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd03aa060  ! 136: STD_I	std	%r8, [%r10 + 0x0060]
	.word 0xd1e2a01f  ! 137: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd092905f  ! 138: LDUHA_R	lduha	[%r10, %r31] 0x82, %r8
	.word 0xcdbae028  ! 139: STDFA_I	stda	%f6, [0x0028, %r11]
	.word 0xc892915f  ! 140: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r4
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xce42e05c  ! 141: LDSW_I	ldsw	[%r11 + 0x005c], %r7
	.word 0xcfbad81f  ! 142: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xc2c2915f  ! 143: LDSWA_R	ldswa	[%r10, %r31] 0x8a, %r1
	.word 0xc3ba989f  ! 144: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2a01f  ! 145: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc3ba981f  ! 146: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc902c01f  ! 147: LDF_R	ld	[%r11, %r31], %f4
	.word 0xc9bad91f  ! 148: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad81f  ! 149: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd04ae067  ! 150: LDSB_I	ldsb	[%r11 + 0x0067], %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xce12a060  ! 151: LDUH_I	lduh	[%r10 + 0x0060], %r7
	.word 0xcc3aa060  ! 152: STD_I	std	%r6, [%r10 + 0x0060]
	.word 0xcacad15f  ! 153: LDSBA_R	ldsba	[%r11, %r31] 0x8a, %r5
	.word 0xcbf2e01f  ! 154: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbf2d11f  ! 155: CASXA_I	casxa	[%r11] 0x88, %r31, %r5
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xce8ad15f  ! 156: LDUBA_R	lduba	[%r11, %r31] 0x8a, %r7
	.word 0xc85ae008  ! 157: LDX_I	ldx	[%r11 + 0x0008], %r4
	.word 0xc9f2e01f  ! 158: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc83ac01f  ! 159: STD_R	std	%r4, [%r11 + %r31]
	.word 0xca8a901f  ! 160: LDUBA_R	lduba	[%r10, %r31] 0x80, %r5
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbbae020  ! 161: STDFA_I	stda	%f5, [0x0020, %r11]
	.word 0xca92915f  ! 162: LDUHA_R	lduha	[%r10, %r31] 0x8a, %r5
	.word 0xcbba991f  ! 163: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba99bf  ! 164: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2901f  ! 165: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcbf2a01f  ! 166: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcac2d05f  ! 167: LDSWA_R	ldswa	[%r11, %r31] 0x82, %r5
	.word 0xcbf2e01f  ! 168: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xc48aa07a  ! 169: LDUBA_I	lduba	[%r10, + 0x007a] %asi, %r2
	.word 0xc5ba993f  ! 170: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc43aa078  ! 171: STD_I	std	%r2, [%r10 + 0x0078]
	.word 0xcf9aa050  ! 172: LDDFA_I	ldda	[%r10, 0x0050], %f7
	.word 0xd25ae038  ! 173: LDX_I	ldx	[%r11 + 0x0038], %r9
	.word 0xd3f2e01f  ! 174: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3e2e01f  ! 175: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3f2d03f  ! 176: CASXA_I	casxa	[%r11] 0x81, %r31, %r9
	.word 0xd3bad95f  ! 177: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc2c2911f  ! 178: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r1
	.word 0xc3ba997f  ! 179: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd24aa065  ! 180: LDSB_I	ldsb	[%r10 + 0x0065], %r9
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd3e2901f  ! 181: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3f2a01f  ! 182: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba985f  ! 183: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba993f  ! 184: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc402a04c  ! 185: LDUW_I	lduw	[%r10 + 0x004c], %r2
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc43aa048  ! 186: STD_I	std	%r2, [%r10 + 0x0048]
	.word 0xc5e2a01f  ! 187: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xc502a004  ! 188: LDF_I	ld	[%r10, 0x0004], %f2
	.word 0xd202c01f  ! 189: LDUW_R	lduw	[%r11 + %r31], %r9
	.word 0xce52801f  ! 190: LDSH_R	ldsh	[%r10 + %r31], %r7
TH_LABEL190:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcd9aa020  ! 191: LDDFA_I	ldda	[%r10, 0x0020], %f6
	.word 0xca4a801f  ! 192: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xcbba983f  ! 193: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 194: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbf2a01f  ! 195: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbf2903f  ! 196: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xcb22c01f  ! 197: STF_R	st	%f5, [%r31, %r11]
	.word 0xc40ac01f  ! 198: LDUB_R	ldub	[%r11 + %r31], %r2
	.word 0xd19aa018  ! 199: LDDFA_I	ldda	[%r10, 0x0018], %f8
	.word 0xd1ba997f  ! 200: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcb9ae070  ! 201: LDDFA_I	ldda	[%r11, 0x0070], %f5
	.word 0xc702c01f  ! 202: LDF_R	ld	[%r11, %r31], %f3
	.word 0xce5a801f  ! 203: LDX_R	ldx	[%r10 + %r31], %r7
	.word 0xcfba991f  ! 204: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc722801f  ! 205: STF_R	st	%f3, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7ba981f  ! 206: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd1baa018  ! 207: STDFA_I	stda	%f8, [0x0018, %r10]
	.word 0xcc82a040  ! 208: LDUWA_I	lduwa	[%r10, + 0x0040] %asi, %r6
	.word 0xcdf2a01f  ! 209: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba985f  ! 210: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc39ae050  ! 211: LDDFA_I	ldda	[%r11, 0x0050], %f1
	.word 0xc03ac01f  ! 212: STD_R	std	%r0, [%r11 + %r31]
	.word 0xca42e00c  ! 213: LDSW_I	ldsw	[%r11 + 0x000c], %r5
	.word 0xc9baa048  ! 214: STDFA_I	stda	%f4, [0x0048, %r10]
	.word 0xc83aa048  ! 215: STD_I	std	%r4, [%r10 + 0x0048]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc692d03f  ! 216: LDUHA_R	lduha	[%r11, %r31] 0x81, %r3
	.word 0xc292a056  ! 217: LDUHA_I	lduha	[%r10, + 0x0056] %asi, %r1
	.word 0xc242801f  ! 218: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xc39ae000  ! 219: LDDFA_I	ldda	[%r11, 0x0000], %f1
	.word 0xce42e038  ! 220: LDSW_I	ldsw	[%r11 + 0x0038], %r7
TH_LABEL220:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xccca917f  ! 221: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r6
	.word 0xcde2903f  ! 222: CASA_I	casa	[%r10] 0x81, %r31, %r6
	.word 0xcfbaa068  ! 223: STDFA_I	stda	%f7, [0x0068, %r10]
	.word 0xc502801f  ! 224: LDF_R	ld	[%r10, %r31], %f2
	.word 0xd01ac01f  ! 225: LDD_R	ldd	[%r11 + %r31], %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd03ac01f  ! 226: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad99f  ! 227: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3f2e01f  ! 228: CASXA_R	casxa	[%r11]%asi, %r31, %r9
	.word 0xd3bad89f  ! 229: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad87f  ! 230: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xd3bad93f  ! 231: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad87f  ! 232: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd03ac01f  ! 233: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd3bad97f  ! 234: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd002a008  ! 235: LDUW_I	lduw	[%r10 + 0x0008], %r8
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1ba981f  ! 236: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 237: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc642a030  ! 238: LDSW_I	ldsw	[%r10 + 0x0030], %r3
	.word 0xc7e2903f  ! 239: CASA_I	casa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba98bf  ! 240: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcc1aa020  ! 241: LDD_I	ldd	[%r10 + 0x0020], %r6
	.word 0xd28ad03f  ! 242: LDUBA_R	lduba	[%r11, %r31] 0x81, %r9
	.word 0xd302e054  ! 243: LDF_I	ld	[%r11, 0x0054], %f9
	.word 0xd3bad8bf  ! 244: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad87f  ! 245: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd00ac01f  ! 246: LDUB_R	ldub	[%r11 + %r31], %r8
	.word 0xd28aa030  ! 247: LDUBA_I	lduba	[%r10, + 0x0030] %asi, %r9
	.word 0xcdbaa040  ! 248: STDFA_I	stda	%f6, [0x0040, %r10]
	.word 0xc502801f  ! 249: LDF_R	ld	[%r10, %r31], %f2
	.word 0xc5e2a01f  ! 250: CASA_R	casa	[%r10] %asi, %r31, %r2
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xca12801f  ! 251: LDUH_R	lduh	[%r10 + %r31], %r5
	.word 0xd0c2911f  ! 252: LDSWA_R	ldswa	[%r10, %r31] 0x88, %r8
	.word 0xd1ba99bf  ! 253: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2901f  ! 254: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xd1e2913f  ! 255: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc28ad11f  ! 256: LDUBA_R	lduba	[%r11, %r31] 0x88, %r1
	.word 0xc3f2d01f  ! 257: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad81f  ! 258: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad8bf  ! 259: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3f2e01f  ! 260: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd2d2a038  ! 261: LDSHA_I	ldsha	[%r10, + 0x0038] %asi, %r9
	.word 0xd2c2a060  ! 262: LDSWA_I	ldswa	[%r10, + 0x0060] %asi, %r9
	.word 0xd20a801f  ! 263: LDUB_R	ldub	[%r10 + %r31], %r9
	.word 0xd3f2a01f  ! 264: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3e2913f  ! 265: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3ba985f  ! 266: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xcc1a801f  ! 267: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xc88ae049  ! 268: LDUBA_I	lduba	[%r11, + 0x0049] %asi, %r4
	.word 0xcd9ae018  ! 269: LDDFA_I	ldda	[%r11, 0x0018], %f6
	.word 0xca12a022  ! 270: LDUH_I	lduh	[%r10 + 0x0022], %r5
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc42801f  ! 271: LDSW_R	ldsw	[%r10 + %r31], %r6
	.word 0xc2d2e008  ! 272: LDSHA_I	ldsha	[%r11, + 0x0008] %asi, %r1
	.word 0xc3f2d11f  ! 273: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xc3bad81f  ! 274: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad99f  ! 275: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3baa050  ! 276: STDFA_I	stda	%f1, [0x0050, %r10]
	.word 0xc322801f  ! 277: STF_R	st	%f1, [%r31, %r10]
	.word 0xd19aa010  ! 278: LDDFA_I	ldda	[%r10, 0x0010], %f8
	.word 0xccda901f  ! 279: LDXA_R	ldxa	[%r10, %r31] 0x80, %r6
	.word 0xcdba985f  ! 280: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcdf2903f  ! 281: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xcdf2903f  ! 282: CASXA_I	casxa	[%r10] 0x81, %r31, %r6
	.word 0xcdf2913f  ! 283: CASXA_I	casxa	[%r10] 0x89, %r31, %r6
	.word 0xc882a008  ! 284: LDUWA_I	lduwa	[%r10, + 0x0008] %asi, %r4
	.word 0xc9ba993f  ! 285: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL285:
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9e2a01f  ! 286: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83aa008  ! 287: STD_I	std	%r4, [%r10 + 0x0008]
	.word 0xc9ba989f  ! 288: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 289: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xd042801f  ! 290: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd03a801f  ! 291: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1e2a01f  ! 292: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xc6d2e02e  ! 293: LDSHA_I	ldsha	[%r11, + 0x002e] %asi, %r3
	.word 0xc7f2e01f  ! 294: CASXA_R	casxa	[%r11]%asi, %r31, %r3
	.word 0xc7bad99f  ! 295: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xc7bad91f  ! 296: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae028  ! 297: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc7bad85f  ! 298: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd0d2903f  ! 299: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r8
	.word 0xd03a801f  ! 300: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xd1ba98bf  ! 301: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd282a074  ! 302: LDUWA_I	lduwa	[%r10, + 0x0074] %asi, %r9
	.word 0xd3e2a01f  ! 303: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 304: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd3ba995f  ! 305: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xc3baa050  ! 306: STDFA_I	stda	%f1, [0x0050, %r10]
	.word 0xcdbae008  ! 307: STDFA_I	stda	%f6, [0x0008, %r11]
	.word 0xcc3ac01f  ! 308: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcdf2d11f  ! 309: CASXA_I	casxa	[%r11] 0x88, %r31, %r6
	.word 0xcdbad89f  ! 310: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcf9aa078  ! 311: LDDFA_I	ldda	[%r10, 0x0078], %f7
	.word 0xcfba995f  ! 312: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd28a917f  ! 313: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r9
	.word 0xcc5a801f  ! 314: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xcc3aa078  ! 315: STD_I	std	%r6, [%r10 + 0x0078]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd0dae078  ! 316: LDXA_I	ldxa	[%r11, + 0x0078] %asi, %r8
	.word 0xca52801f  ! 317: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xc83aa078  ! 318: STD_I	std	%r4, [%r10 + 0x0078]
	.word 0xcbe2901f  ! 319: CASA_I	casa	[%r10] 0x80, %r31, %r5
	.word 0xd042e040  ! 320: LDSW_I	ldsw	[%r11 + 0x0040], %r8
TH_LABEL320:
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd2daa068  ! 321: LDXA_I	ldxa	[%r10, + 0x0068] %asi, %r9
	.word 0xd3f2901f  ! 322: CASXA_I	casxa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba995f  ! 323: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 324: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xcd02e00c  ! 325: LDF_I	ld	[%r11, 0x000c], %f6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcdbad87f  ! 326: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc28ae032  ! 327: LDUBA_I	lduba	[%r11, + 0x0032] %asi, %r1
	.word 0xc03ae030  ! 328: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xc3e2e01f  ! 329: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d13f  ! 330: CASXA_I	casxa	[%r11] 0x89, %r31, %r1
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc03ae030  ! 331: STD_I	std	%r0, [%r11 + 0x0030]
	.word 0xc3f2e01f  ! 332: CASXA_R	casxa	[%r11]%asi, %r31, %r1
	.word 0xc3bad81f  ! 333: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xce82a018  ! 334: LDUWA_I	lduwa	[%r10, + 0x0018] %asi, %r7
	.word 0xcfe2a01f  ! 335: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfe2a01f  ! 336: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcdbaa058  ! 337: STDFA_I	stda	%f6, [0x0058, %r10]
	.word 0xcdf2a01f  ! 338: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xc482d17f  ! 339: LDUWA_R	lduwa	[%r11, %r31] 0x8b, %r2
	.word 0xc5e2d01f  ! 340: CASA_I	casa	[%r11] 0x80, %r31, %r2
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcc0a801f  ! 341: LDUB_R	ldub	[%r10 + %r31], %r6
	.word 0xcdba99bf  ! 342: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xc802c01f  ! 343: LDUW_R	lduw	[%r11 + %r31], %r4
	.word 0xc81aa048  ! 344: LDD_I	ldd	[%r10 + 0x0048], %r4
	.word 0xc9ba995f  ! 345: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc9ba993f  ! 346: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc682a040  ! 347: LDUWA_I	lduwa	[%r10, + 0x0040] %asi, %r3
	.word 0xc7ba985f  ! 348: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43a801f  ! 349: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc4cad03f  ! 350: LDSBA_R	ldsba	[%r11, %r31] 0x81, %r2
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd042801f  ! 351: LDSW_R	ldsw	[%r10 + %r31], %r8
	.word 0xd08a913f  ! 352: LDUBA_R	lduba	[%r10, %r31] 0x89, %r8
	.word 0xcc82e04c  ! 353: LDUWA_I	lduwa	[%r11, + 0x004c] %asi, %r6
	.word 0xcc5a801f  ! 354: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xcdba993f  ! 355: STDFA_R	stda	%f6, [%r31, %r10]
TH_LABEL355:
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcdba997f  ! 356: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2a01f  ! 357: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcde2901f  ! 358: CASA_I	casa	[%r10] 0x80, %r31, %r6
	.word 0xcde2a01f  ! 359: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xd302a010  ! 360: LDF_I	ld	[%r10, 0x0010], %f9
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3e2a01f  ! 361: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3e2903f  ! 362: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd3ba991f  ! 363: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2a01f  ! 364: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xc65a801f  ! 365: LDX_R	ldx	[%r10 + %r31], %r3
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc7ba999f  ! 366: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc43aa010  ! 367: STD_I	std	%r2, [%r10 + 0x0010]
	.word 0xce4a801f  ! 368: LDSB_R	ldsb	[%r10 + %r31], %r7
	.word 0xcfe2911f  ! 369: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcfe2a01f  ! 370: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcff2a01f  ! 371: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcc3aa010  ! 372: STD_I	std	%r6, [%r10 + 0x0010]
	.word 0xc2d2a06e  ! 373: LDSHA_I	ldsha	[%r10, + 0x006e] %asi, %r1
	.word 0xc3e2a01f  ! 374: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3ba985f  ! 375: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcacaa032  ! 376: LDSBA_I	ldsba	[%r10, + 0x0032] %asi, %r5
	.word 0xcbba989f  ! 377: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba99bf  ! 378: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba98bf  ! 379: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbf2901f  ! 380: CASXA_I	casxa	[%r10] 0x80, %r31, %r5
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xce42a03c  ! 381: LDSW_I	ldsw	[%r10 + 0x003c], %r7
	.word 0xcfe2a01f  ! 382: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcc3aa038  ! 383: STD_I	std	%r6, [%r10 + 0x0038]
	.word 0xcfe2911f  ! 384: CASA_I	casa	[%r10] 0x88, %r31, %r7
	.word 0xcfba989f  ! 385: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfba999f  ! 386: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc702a054  ! 387: LDF_I	ld	[%r10, 0x0054], %f3
	.word 0xc43a801f  ! 388: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc6caa05d  ! 389: LDSBA_I	ldsba	[%r10, + 0x005d] %asi, %r3
	.word 0xd102c01f  ! 390: LDF_R	ld	[%r11, %r31], %f8
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdbaa078  ! 391: STDFA_I	stda	%f6, [0x0078, %r10]
	.word 0xcdba99bf  ! 392: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xce02801f  ! 393: LDUW_R	lduw	[%r10 + %r31], %r7
	.word 0xcfba983f  ! 394: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba997f  ! 395: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xcfba983f  ! 396: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2903f  ! 397: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xd292917f  ! 398: LDUHA_R	lduha	[%r10, %r31] 0x8b, %r9
	.word 0xd28a917f  ! 399: LDUBA_R	lduba	[%r10, %r31] 0x8b, %r9
	.word 0xcc12a074  ! 400: LDUH_I	lduh	[%r10 + 0x0074], %r6
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcde2903f  ! 401: CASA_I	casa	[%r10] 0x81, %r31, %r6
	.word 0xcc3a801f  ! 402: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcdba987f  ! 403: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd01ae008  ! 404: LDD_I	ldd	[%r11 + 0x0008], %r8
	.word 0xc6caa02c  ! 405: LDSBA_I	ldsba	[%r10, + 0x002c] %asi, %r3
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xcd9aa018  ! 406: LDDFA_I	ldda	[%r10, 0x0018], %f6
	.word 0xcdf2a01f  ! 407: CASXA_R	casxa	[%r10]%asi, %r31, %r6
	.word 0xcdba981f  ! 408: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xd2caa06d  ! 409: LDSBA_I	ldsba	[%r10, + 0x006d] %asi, %r9
	.word 0xd3ba985f  ! 410: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcbbae000  ! 411: STDFA_I	stda	%f5, [0x0000, %r11]
	.word 0xc28aa03b  ! 412: LDUBA_I	lduba	[%r10, + 0x003b] %asi, %r1
	.word 0xcf02e03c  ! 413: LDF_I	ld	[%r11, 0x003c], %f7
	.word 0xcff2e01f  ! 414: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xc28ae004  ! 415: LDUBA_I	lduba	[%r11, + 0x0004] %asi, %r1
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc03ae000  ! 416: STD_I	std	%r0, [%r11 + 0x0000]
	.word 0xd3baa020  ! 417: STDFA_I	stda	%f9, [0x0020, %r10]
	.word 0xd3e2a01f  ! 418: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd03a801f  ! 419: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd3e2a01f  ! 420: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd3ba987f  ! 421: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd0da917f  ! 422: LDXA_R	ldxa	[%r10, %r31] 0x8b, %r8
	.word 0xd1e2901f  ! 423: CASA_I	casa	[%r10] 0x80, %r31, %r8
	.word 0xc89ae008  ! 424: LDDA_I	ldda	[%r11, + 0x0008] %asi, %r4
	.word 0xc83ac01f  ! 425: STD_R	std	%r4, [%r11 + %r31]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbbad81f  ! 426: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd39aa068  ! 427: LDDFA_I	ldda	[%r10, 0x0068], %f9
	.word 0xd322c01f  ! 428: STF_R	st	%f9, [%r31, %r11]
	.word 0xd3bad8bf  ! 429: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3baa058  ! 430: STDFA_I	stda	%f9, [0x0058, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcd02e064  ! 431: LDF_I	ld	[%r11, 0x0064], %f6
	.word 0xc09ae068  ! 432: LDDA_I	ldda	[%r11, + 0x0068] %asi, %r0
	.word 0xc3bad83f  ! 433: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d01f  ! 434: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc03ac01f  ! 435: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3bad8bf  ! 436: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3bad99f  ! 437: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2e01f  ! 438: CASA_R	casa	[%r11] %asi, %r31, %r1
	.word 0xc3f2d01f  ! 439: CASXA_I	casxa	[%r11] 0x80, %r31, %r1
	.word 0xc03ac01f  ! 440: STD_R	std	%r0, [%r11 + %r31]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc3f2d11f  ! 441: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xc88ad15f  ! 442: LDUBA_R	lduba	[%r11, %r31] 0x8a, %r4
	.word 0xc502e00c  ! 443: LDF_I	ld	[%r11, 0x000c], %f2
	.word 0xc5f2d11f  ! 444: CASXA_I	casxa	[%r11] 0x88, %r31, %r2
	.word 0xc5bad9bf  ! 445: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc5bad95f  ! 446: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xd1baa018  ! 447: STDFA_I	stda	%f8, [0x0018, %r10]
	.word 0xd1ba983f  ! 448: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1f2913f  ! 449: CASXA_I	casxa	[%r10] 0x89, %r31, %r8
	.word 0xd1f2a01f  ! 450: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd322801f  ! 451: STF_R	st	%f9, [%r31, %r10]
	.word 0xd3ba989f  ! 452: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc20a801f  ! 453: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xd202a030  ! 454: LDUW_I	lduw	[%r10 + 0x0030], %r9
	.word 0xd3ba995f  ! 455: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xca4a801f  ! 456: LDSB_R	ldsb	[%r10 + %r31], %r5
	.word 0xc83a801f  ! 457: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcbf2a01f  ! 458: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xcbf2903f  ! 459: CASXA_I	casxa	[%r10] 0x81, %r31, %r5
	.word 0xc79aa060  ! 460: LDDFA_I	ldda	[%r10, 0x0060], %f3
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc7e2a01f  ! 461: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc43a801f  ! 462: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc7f2903f  ! 463: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
	.word 0xc7ba991f  ! 464: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba995f  ! 465: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc7ba981f  ! 466: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc8c2e04c  ! 467: LDSWA_I	ldswa	[%r11, + 0x004c] %asi, %r4
	.word 0xc24aa00d  ! 468: LDSB_I	ldsb	[%r10 + 0x000d], %r1
	.word 0xc39ae060  ! 469: LDDFA_I	ldda	[%r11, 0x0060], %f1
	.word 0xca8ae045  ! 470: LDUBA_I	lduba	[%r11, + 0x0045] %asi, %r5
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc4caa008  ! 471: LDSBA_I	ldsba	[%r10, + 0x0008] %asi, %r2
	.word 0xc5ba993f  ! 472: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc702801f  ! 473: LDF_R	ld	[%r10, %r31], %f3
	.word 0xc7f2911f  ! 474: CASXA_I	casxa	[%r10] 0x88, %r31, %r3
	.word 0xc7f2a01f  ! 475: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc7ba985f  ! 476: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba997f  ! 477: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc2c2901f  ! 478: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r1
	.word 0xc3ba99bf  ! 479: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xcadad01f  ! 480: LDXA_R	ldxa	[%r11, %r31] 0x80, %r5
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbbad8bf  ! 481: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xc3baa008  ! 482: STDFA_I	stda	%f1, [0x0008, %r10]
	.word 0xc3ba997f  ! 483: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 484: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc03aa008  ! 485: STD_I	std	%r0, [%r10 + 0x0008]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc702e078  ! 486: LDF_I	ld	[%r11, 0x0078], %f3
	.word 0xc7bad89f  ! 487: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc7bad9bf  ! 488: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xc43ae078  ! 489: STD_I	std	%r2, [%r11 + 0x0078]
	.word 0xcc12e036  ! 490: LDUH_I	lduh	[%r11 + 0x0036], %r6
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xcc3ae030  ! 491: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xcdbad89f  ! 492: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad93f  ! 493: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcde2d03f  ! 494: CASA_I	casa	[%r11] 0x81, %r31, %r6
	.word 0xcdbad81f  ! 495: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc68a901f  ! 496: LDUBA_R	lduba	[%r10, %r31] 0x80, %r3
	.word 0xc7ba993f  ! 497: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7f2901f  ! 498: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xcc1a801f  ! 499: LDD_R	ldd	[%r10 + %r31], %r6
	.word 0xcfba997f  ! 500: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfba99bf  ! 501: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba999f  ! 502: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2913f  ! 503: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xcff2a01f  ! 504: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xd09aa000  ! 505: LDDA_I	ldda	[%r10, + 0x0000] %asi, %r8
TH_LABEL505:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xd1ba987f  ! 506: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa000  ! 507: STD_I	std	%r8, [%r10 + 0x0000]
	.word 0xd1ba993f  ! 508: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xc302801f  ! 509: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc03a801f  ! 510: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcb22801f  ! 511: STF_R	st	%f5, [%r31, %r10]
	.word 0xcbba995f  ! 512: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba989f  ! 513: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc902801f  ! 514: LDF_R	ld	[%r10, %r31], %f4
	.word 0xc59aa020  ! 515: LDDFA_I	ldda	[%r10, 0x0020], %f2
TH_LABEL515:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc6d2903f  ! 516: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r3
	.word 0xd39aa030  ! 517: LDDFA_I	ldda	[%r10, 0x0030], %f9
	.word 0xc502801f  ! 518: LDF_R	ld	[%r10, %r31], %f2
	.word 0xcfbaa038  ! 519: STDFA_I	stda	%f7, [0x0038, %r10]
	.word 0xcff2a01f  ! 520: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcfe2903f  ! 521: CASA_I	casa	[%r10] 0x81, %r31, %r7
	.word 0xcfba985f  ! 522: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfe2a01f  ! 523: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2a01f  ! 524: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xd05a801f  ! 525: LDX_R	ldx	[%r10 + %r31], %r8
TH_LABEL525:
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xd1ba981f  ! 526: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03a801f  ! 527: STD_R	std	%r8, [%r10 + %r31]
	.word 0xd1ba983f  ! 528: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd1e2a01f  ! 529: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd1ba991f  ! 530: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd1e2a01f  ! 531: CASA_R	casa	[%r10] %asi, %r31, %r8
	.word 0xd03a801f  ! 532: STD_R	std	%r8, [%r10 + %r31]
	.word 0xc88aa01a  ! 533: LDUBA_I	lduba	[%r10, + 0x001a] %asi, %r4
	.word 0xce52a002  ! 534: LDSH_I	ldsh	[%r10 + 0x0002], %r7
	.word 0xcfba985f  ! 535: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcfe2a01f  ! 536: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfe2913f  ! 537: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xcc3a801f  ! 538: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcfba985f  ! 539: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcfba999f  ! 540: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcbbaa058  ! 541: STDFA_I	stda	%f5, [0x0058, %r10]
	.word 0xcbba983f  ! 542: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbe2a01f  ! 543: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba995f  ! 544: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba98bf  ! 545: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcbba981f  ! 546: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba995f  ! 547: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba98bf  ! 548: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xccdaa058  ! 549: LDXA_I	ldxa	[%r10, + 0x0058] %asi, %r6
	.word 0xcbbaa038  ! 550: STDFA_I	stda	%f5, [0x0038, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xcbf2913f  ! 551: CASXA_I	casxa	[%r10] 0x89, %r31, %r5
	.word 0xc83aa038  ! 552: STD_I	std	%r4, [%r10 + 0x0038]
	.word 0xcbf2a01f  ! 553: CASXA_R	casxa	[%r10]%asi, %r31, %r5
	.word 0xc4daa070  ! 554: LDXA_I	ldxa	[%r10, + 0x0070] %asi, %r2
	.word 0xc5ba997f  ! 555: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc5e2901f  ! 556: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba981f  ! 557: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba983f  ! 558: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 559: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc702a008  ! 560: LDF_I	ld	[%r10, 0x0008], %f3
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc7ba995f  ! 561: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xcc52801f  ! 562: LDSH_R	ldsh	[%r10 + %r31], %r6
	.word 0xca8ae058  ! 563: LDUBA_I	lduba	[%r11, + 0x0058] %asi, %r5
	.word 0xc60a801f  ! 564: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xc7ba981f  ! 565: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc612801f  ! 566: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xc43aa058  ! 567: STD_I	std	%r2, [%r10 + 0x0058]
	.word 0xc7ba99bf  ! 568: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 569: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd012e002  ! 570: LDUH_I	lduh	[%r11 + 0x0002], %r8
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xd1f2d01f  ! 571: CASXA_I	casxa	[%r11] 0x80, %r31, %r8
	.word 0xd1f2d13f  ! 572: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
	.word 0xd1e2e01f  ! 573: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xc99aa038  ! 574: LDDFA_I	ldda	[%r10, 0x0038], %f4
	.word 0xd01aa040  ! 575: LDD_I	ldd	[%r10 + 0x0040], %r8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd03aa040  ! 576: STD_I	std	%r8, [%r10 + 0x0040]
	.word 0xd3ba985f  ! 577: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2901f  ! 578: CASA_I	casa	[%r10] 0x80, %r31, %r9
	.word 0xd3ba991f  ! 579: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc482901f  ! 580: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r2
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc5ba981f  ! 581: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba997f  ! 582: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 583: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc85a801f  ! 584: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xc5baa008  ! 585: STDFA_I	stda	%f2, [0x0008, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc5f2911f  ! 586: CASXA_I	casxa	[%r10] 0x88, %r31, %r2
	.word 0xc5ba997f  ! 587: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5f2901f  ! 588: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xca02a020  ! 589: LDUW_I	lduw	[%r10 + 0x0020], %r5
	.word 0xcbba995f  ! 590: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc892d17f  ! 591: LDUHA_R	lduha	[%r11, %r31] 0x8b, %r4
	.word 0xc9bad9bf  ! 592: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9f2e01f  ! 593: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xcecad13f  ! 594: LDSBA_R	ldsba	[%r11, %r31] 0x89, %r7
	.word 0xc702801f  ! 595: LDF_R	ld	[%r10, %r31], %f3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xd212e01a  ! 596: LDUH_I	lduh	[%r11 + 0x001a], %r9
	.word 0xd3bad93f  ! 597: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad95f  ! 598: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad9bf  ! 599: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc45ae008  ! 600: LDX_I	ldx	[%r11 + 0x0008], %r2
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc5bad81f  ! 601: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xca0ae06a  ! 602: LDUB_I	ldub	[%r11 + 0x006a], %r5
	.word 0xcbbad93f  ! 603: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xceda907f  ! 604: LDXA_R	ldxa	[%r10, %r31] 0x83, %r7
	.word 0xc44ac01f  ! 605: LDSB_R	ldsb	[%r11 + %r31], %r2
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc7bae020  ! 606: STDFA_I	stda	%f3, [0x0020, %r11]
	.word 0xc7bad9bf  ! 607: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xd202801f  ! 608: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xc88aa050  ! 609: LDUBA_I	lduba	[%r10, + 0x0050] %asi, %r4
	.word 0xc812e026  ! 610: LDUH_I	lduh	[%r11 + 0x0026], %r4
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc83ae020  ! 611: STD_I	std	%r4, [%r11 + 0x0020]
	.word 0xc9bad97f  ! 612: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xcc1ae048  ! 613: LDD_I	ldd	[%r11 + 0x0048], %r6
	.word 0xcdbad99f  ! 614: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xc202e024  ! 615: LDUW_I	lduw	[%r11 + 0x0024], %r1
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xc3f2d11f  ! 616: CASXA_I	casxa	[%r11] 0x88, %r31, %r1
	.word 0xca0ae072  ! 617: LDUB_I	ldub	[%r11 + 0x0072], %r5
	.word 0xc2ca907f  ! 618: LDSBA_R	ldsba	[%r10, %r31] 0x83, %r1
	.word 0xcad2905f  ! 619: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r5
	.word 0xcb02c01f  ! 620: LDF_R	ld	[%r11, %r31], %f5
TH_LABEL620:
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc83ae070  ! 621: STD_I	std	%r4, [%r11 + 0x0070]
	.word 0xd25ac01f  ! 622: LDX_R	ldx	[%r11 + %r31], %r9
	.word 0xd3bad85f  ! 623: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xd3bad81f  ! 624: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xcb02801f  ! 625: LDF_R	ld	[%r10, %r31], %f5
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc83a801f  ! 626: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc24aa07f  ! 627: LDSB_I	ldsb	[%r10 + 0x007f], %r1
	.word 0xc3ba991f  ! 628: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba983f  ! 629: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc03a801f  ! 630: STD_R	std	%r0, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc812e018  ! 631: LDUH_I	lduh	[%r11 + 0x0018], %r4
	.word 0xc9bad85f  ! 632: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xd042c01f  ! 633: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xcc92e00a  ! 634: LDUHA_I	lduha	[%r11, + 0x000a] %asi, %r6
	.word 0xcdf2e01f  ! 635: CASXA_R	casxa	[%r11]%asi, %r31, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xced2a07c  ! 636: LDSHA_I	ldsha	[%r10, + 0x007c] %asi, %r7
	.word 0xcff2913f  ! 637: CASXA_I	casxa	[%r10] 0x89, %r31, %r7
	.word 0xcff2903f  ! 638: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xcfe2913f  ! 639: CASA_I	casa	[%r10] 0x89, %r31, %r7
	.word 0xce02801f  ! 640: LDUW_R	lduw	[%r10 + %r31], %r7
TH_LABEL640:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xcfba999f  ! 641: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc89ae018  ! 642: LDDA_I	ldda	[%r11, + 0x0018] %asi, %r4
	.word 0xcb02801f  ! 643: LDF_R	ld	[%r10, %r31], %f5
	.word 0xd102a014  ! 644: LDF_I	ld	[%r10, 0x0014], %f8
	.word 0xc242801f  ! 645: LDSW_R	ldsw	[%r10 + %r31], %r1
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc24a801f  ! 646: LDSB_R	ldsb	[%r10 + %r31], %r1
	.word 0xc8ca917f  ! 647: LDSBA_R	ldsba	[%r10, %r31] 0x8b, %r4
	.word 0xc9ba987f  ! 648: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 649: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba991f  ! 650: STDFA_R	stda	%f4, [%r31, %r10]
TH_LABEL650:
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc9f2a01f  ! 651: CASXA_R	casxa	[%r10]%asi, %r31, %r4
	.word 0xc83aa010  ! 652: STD_I	std	%r4, [%r10 + 0x0010]
	.word 0xc9e2913f  ! 653: CASA_I	casa	[%r10] 0x89, %r31, %r4
	.word 0xc4caa078  ! 654: LDSBA_I	ldsba	[%r10, + 0x0078] %asi, %r2
	.word 0xc8d2a068  ! 655: LDSHA_I	ldsha	[%r10, + 0x0068] %asi, %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc9ba993f  ! 656: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc4daa010  ! 657: LDXA_I	ldxa	[%r10, + 0x0010] %asi, %r2
	.word 0xc5e2901f  ! 658: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xce4ae034  ! 659: LDSB_I	ldsb	[%r11 + 0x0034], %r7
	.word 0xcc3ae030  ! 660: STD_I	std	%r6, [%r11 + 0x0030]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xcfbad85f  ! 661: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xd1bae030  ! 662: STDFA_I	stda	%f8, [0x0030, %r11]
	.word 0xd1e2e01f  ! 663: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xc302a01c  ! 664: LDF_I	ld	[%r10, 0x001c], %f1
	.word 0xc3ba99bf  ! 665: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc3ba993f  ! 666: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3f2911f  ! 667: CASXA_I	casxa	[%r10] 0x88, %r31, %r1
	.word 0xce92d15f  ! 668: LDUHA_R	lduha	[%r11, %r31] 0x8a, %r7
	.word 0xc2c2901f  ! 669: LDSWA_R	ldswa	[%r10, %r31] 0x80, %r1
	.word 0xd042c01f  ! 670: LDSW_R	ldsw	[%r11 + %r31], %r8
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd03ac01f  ! 671: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1bad99f  ! 672: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xc5baa038  ! 673: STDFA_I	stda	%f2, [0x0038, %r10]
	.word 0xc5ba993f  ! 674: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43aa038  ! 675: STD_I	std	%r2, [%r10 + 0x0038]
TH_LABEL675:
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc25aa060  ! 676: LDX_I	ldx	[%r10 + 0x0060], %r1
	.word 0xc902e060  ! 677: LDF_I	ld	[%r11, 0x0060], %f4
	.word 0xc9e2e01f  ! 678: CASA_R	casa	[%r11] %asi, %r31, %r4
	.word 0xc9bad95f  ! 679: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9bad97f  ! 680: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc9bad89f  ! 681: STDFA_R	stda	%f4, [%r31, %r11]
	.word 0xc9e2d01f  ! 682: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc83ae060  ! 683: STD_I	std	%r4, [%r11 + 0x0060]
	.word 0xca8aa02d  ! 684: LDUBA_I	lduba	[%r10, + 0x002d] %asi, %r5
	.word 0xcedae070  ! 685: LDXA_I	ldxa	[%r11, + 0x0070] %asi, %r7
TH_LABEL685:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcff2e01f  ! 686: CASXA_R	casxa	[%r11]%asi, %r31, %r7
	.word 0xcfbad89f  ! 687: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcff2d03f  ! 688: CASXA_I	casxa	[%r11] 0x81, %r31, %r7
	.word 0xd00a801f  ! 689: LDUB_R	ldub	[%r10 + %r31], %r8
	.word 0xd1ba99bf  ! 690: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xc65ae028  ! 691: LDX_I	ldx	[%r11 + 0x0028], %r3
	.word 0xc6c2e028  ! 692: LDSWA_I	ldswa	[%r11, + 0x0028] %asi, %r3
	.word 0xc43ae028  ! 693: STD_I	std	%r2, [%r11 + 0x0028]
	.word 0xc43ac01f  ! 694: STD_R	std	%r2, [%r11 + %r31]
	.word 0xc7bad81f  ! 695: STDFA_R	stda	%f3, [%r31, %r11]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xc60a801f  ! 696: LDUB_R	ldub	[%r10 + %r31], %r3
	.word 0xc7e2a01f  ! 697: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba999f  ! 698: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc252a010  ! 699: LDSH_I	ldsh	[%r10 + 0x0010], %r1
	.word 0xc3f2a01f  ! 700: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc3ba983f  ! 701: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2a01f  ! 702: CASA_R	casa	[%r10] %asi, %r31, %r1
	.word 0xc3f2a01f  ! 703: CASXA_R	casxa	[%r10]%asi, %r31, %r1
	.word 0xc3ba981f  ! 704: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba981f  ! 705: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc3ba981f  ! 706: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3ba997f  ! 707: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xd2daa048  ! 708: LDXA_I	ldxa	[%r10, + 0x0048] %asi, %r9
	.word 0xd202801f  ! 709: LDUW_R	lduw	[%r10 + %r31], %r9
	.word 0xd242a074  ! 710: LDSW_I	ldsw	[%r10 + 0x0074], %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3e2a01f  ! 711: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3e2a01f  ! 712: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3ba989f  ! 713: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3f2913f  ! 714: CASXA_I	casxa	[%r10] 0x89, %r31, %r9
	.word 0xd03a801f  ! 715: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3f2a01f  ! 716: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xcc92d03f  ! 717: LDUHA_R	lduha	[%r11, %r31] 0x81, %r6
	.word 0xcf9aa010  ! 718: LDDFA_I	ldda	[%r10, 0x0010], %f7
	.word 0xd302e058  ! 719: LDF_I	ld	[%r11, 0x0058], %f9
	.word 0xd3e2d01f  ! 720: CASA_I	casa	[%r11] 0x80, %r31, %r9
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd3baa000  ! 721: STDFA_I	stda	%f9, [0x0000, %r10]
	.word 0xd3ba983f  ! 722: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 723: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba981f  ! 724: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3ba995f  ! 725: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xd3ba997f  ! 726: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc59aa078  ! 727: LDDFA_I	ldda	[%r10, 0x0078], %f2
	.word 0xd322c01f  ! 728: STF_R	st	%f9, [%r31, %r11]
	.word 0xd3e2e01f  ! 729: CASA_R	casa	[%r11] %asi, %r31, %r9
	.word 0xd3f2d01f  ! 730: CASXA_I	casxa	[%r11] 0x80, %r31, %r9
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc48a907f  ! 731: LDUBA_R	lduba	[%r10, %r31] 0x83, %r2
	.word 0xc5e2913f  ! 732: CASA_I	casa	[%r10] 0x89, %r31, %r2
	.word 0xc5ba98bf  ! 733: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 734: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc5ba987f  ! 735: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc252a028  ! 736: LDSH_I	ldsh	[%r10 + 0x0028], %r1
	.word 0xc3ba98bf  ! 737: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc64a801f  ! 738: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xc7f2a01f  ! 739: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7f2903f  ! 740: CASXA_I	casxa	[%r10] 0x81, %r31, %r3
TH_LABEL740:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xce4aa041  ! 741: LDSB_I	ldsb	[%r10 + 0x0041], %r7
	.word 0xcfe2a01f  ! 742: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcfba98bf  ! 743: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcc3a801f  ! 744: STD_R	std	%r6, [%r10 + %r31]
	.word 0xca12e008  ! 745: LDUH_I	lduh	[%r11 + 0x0008], %r5
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xca8a901f  ! 746: LDUBA_R	lduba	[%r10, %r31] 0x80, %r5
	.word 0xd0dae058  ! 747: LDXA_I	ldxa	[%r11, + 0x0058] %asi, %r8
	.word 0xc802c01f  ! 748: LDUW_R	lduw	[%r11 + %r31], %r4
	.word 0xd012c01f  ! 749: LDUH_R	lduh	[%r11 + %r31], %r8
	.word 0xc89aa038  ! 750: LDDA_I	ldda	[%r10, + 0x0038] %asi, %r4
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc482e014  ! 751: LDUWA_I	lduwa	[%r11, + 0x0014] %asi, %r2
	.word 0xc5e2e01f  ! 752: CASA_R	casa	[%r11] %asi, %r31, %r2
	.word 0xc5bad85f  ! 753: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5bad9bf  ! 754: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xce4aa04e  ! 755: LDSB_I	ldsb	[%r10 + 0x004e], %r7
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfba989f  ! 756: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc80ac01f  ! 757: LDUB_R	ldub	[%r11 + %r31], %r4
	.word 0xc9e2d01f  ! 758: CASA_I	casa	[%r11] 0x80, %r31, %r4
	.word 0xc9f2d13f  ! 759: CASXA_I	casxa	[%r11] 0x89, %r31, %r4
	.word 0xcc9aa078  ! 760: LDDA_I	ldda	[%r10, + 0x0078] %asi, %r6
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xc902a03c  ! 761: LDF_I	ld	[%r10, 0x003c], %f4
	.word 0xc9ba991f  ! 762: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xd00aa035  ! 763: LDUB_I	ldub	[%r10 + 0x0035], %r8
	.word 0xc902a040  ! 764: LDF_I	ld	[%r10, 0x0040], %f4
	.word 0xc9ba995f  ! 765: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc83a801f  ! 766: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc9ba997f  ! 767: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2903f  ! 768: CASXA_I	casxa	[%r10] 0x81, %r31, %r4
	.word 0xc9ba981f  ! 769: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 770: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc682e00c  ! 771: LDUWA_I	lduwa	[%r11, + 0x000c] %asi, %r3
	.word 0xcf02801f  ! 772: LDF_R	ld	[%r10, %r31], %f7
	.word 0xcfba99bf  ! 773: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xc48aa07a  ! 774: LDUBA_I	lduba	[%r10, + 0x007a] %asi, %r2
	.word 0xd01ae060  ! 775: LDD_I	ldd	[%r11 + 0x0060], %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1f2d11f  ! 776: CASXA_I	casxa	[%r11] 0x88, %r31, %r8
	.word 0xc612801f  ! 777: LDUH_R	lduh	[%r10 + %r31], %r3
	.word 0xc7f2901f  ! 778: CASXA_I	casxa	[%r10] 0x80, %r31, %r3
	.word 0xc7ba989f  ! 779: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xd09ae038  ! 780: LDDA_I	ldda	[%r11, + 0x0038] %asi, %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xca52801f  ! 781: LDSH_R	ldsh	[%r10 + %r31], %r5
	.word 0xcbba98bf  ! 782: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba98bf  ! 783: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc68ae06b  ! 784: LDUBA_I	lduba	[%r11, + 0x006b] %asi, %r3
	.word 0xd28a911f  ! 785: LDUBA_R	lduba	[%r10, %r31] 0x88, %r9
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xd3e2a01f  ! 786: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 787: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd102a070  ! 788: LDF_I	ld	[%r10, 0x0070], %f8
	.word 0xd08ae03e  ! 789: LDUBA_I	lduba	[%r11, + 0x003e] %asi, %r8
	.word 0xd1bad99f  ! 790: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1bad87f  ! 791: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad95f  ! 792: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xca52e07c  ! 793: LDSH_I	ldsh	[%r11 + 0x007c], %r5
	.word 0xc83ac01f  ! 794: STD_R	std	%r4, [%r11 + %r31]
	.word 0xcbf2e01f  ! 795: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xfe5f2448  ! 1: LDX_I	ldx	[%r28 + 0x0448], %r31
	.word 0xcd9aa078  ! 796: LDDFA_I	ldda	[%r10, 0x0078], %f6
	.word 0xcdba981f  ! 797: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba997f  ! 798: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcad2911f  ! 799: LDSHA_R	ldsha	[%r10, %r31] 0x88, %r5
	.word 0xc64ae01e  ! 800: LDSB_I	ldsb	[%r11 + 0x001e], %r3
TH_LABEL800:
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc5baa068  ! 801: STDFA_I	stda	%f2, [0x0068, %r10]
	.word 0xc5ba999f  ! 802: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc43a801f  ! 803: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43a801f  ! 804: STD_R	std	%r2, [%r10 + %r31]
	.word 0xc43aa068  ! 805: STD_I	std	%r2, [%r10 + 0x0068]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xc5ba997f  ! 806: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xc5ba991f  ! 807: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xcec2907f  ! 808: LDSWA_R	ldswa	[%r10, %r31] 0x83, %r7
	.word 0xcfbae028  ! 809: STDFA_I	stda	%f7, [0x0028, %r11]
	.word 0xccd2905f  ! 810: LDSHA_R	ldsha	[%r10, %r31] 0x82, %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc812a000  ! 811: LDUH_I	lduh	[%r10 + 0x0000], %r4
	.word 0xc9ba985f  ! 812: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9f2901f  ! 813: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9ba983f  ! 814: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc81aa070  ! 815: LDD_I	ldd	[%r10 + 0x0070], %r4
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xceca901f  ! 816: LDSBA_R	ldsba	[%r10, %r31] 0x80, %r7
	.word 0xcff2a01f  ! 817: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xcfe2a01f  ! 818: CASA_R	casa	[%r10] %asi, %r31, %r7
	.word 0xcff2903f  ! 819: CASXA_I	casxa	[%r10] 0x81, %r31, %r7
	.word 0xce5aa020  ! 820: LDX_I	ldx	[%r10 + 0x0020], %r7
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcfba99bf  ! 821: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xd2dad15f  ! 822: LDXA_R	ldxa	[%r11, %r31] 0x8a, %r9
	.word 0xccdaa060  ! 823: LDXA_I	ldxa	[%r10, + 0x0060] %asi, %r6
	.word 0xd3baa028  ! 824: STDFA_I	stda	%f9, [0x0028, %r10]
	.word 0xc40ac01f  ! 825: LDUB_R	ldub	[%r11 + %r31], %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc2c2d01f  ! 826: LDSWA_R	ldswa	[%r11, %r31] 0x80, %r1
	.word 0xc85a801f  ! 827: LDX_R	ldx	[%r10 + %r31], %r4
	.word 0xc9ba989f  ! 828: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba981f  ! 829: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xc9ba997f  ! 830: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc83a801f  ! 831: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc4d2903f  ! 832: LDSHA_R	ldsha	[%r10, %r31] 0x81, %r2
	.word 0xc642801f  ! 833: LDSW_R	ldsw	[%r10 + %r31], %r3
	.word 0xc7e2a01f  ! 834: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7ba991f  ! 835: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc64a801f  ! 836: LDSB_R	ldsb	[%r10 + %r31], %r3
	.word 0xc7ba987f  ! 837: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2911f  ! 838: CASA_I	casa	[%r10] 0x88, %r31, %r3
	.word 0xc7ba983f  ! 839: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba98bf  ! 840: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd28a903f  ! 841: LDUBA_R	lduba	[%r10, %r31] 0x81, %r9
	.word 0xc41a801f  ! 842: LDD_R	ldd	[%r10 + %r31], %r2
	.word 0xc7ba981f  ! 843: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7e2a01f  ! 844: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xc7e2a01f  ! 845: CASA_R	casa	[%r10] %asi, %r31, %r3
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc7ba985f  ! 846: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc522801f  ! 847: STF_R	st	%f2, [%r31, %r10]
	.word 0xc5e2901f  ! 848: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5f2901f  ! 849: CASXA_I	casxa	[%r10] 0x80, %r31, %r2
	.word 0xc81ac01f  ! 850: LDD_R	ldd	[%r11 + %r31], %r4
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc79ae010  ! 851: LDDFA_I	ldda	[%r11, 0x0010], %f3
	.word 0xc602a034  ! 852: LDUW_I	lduw	[%r10 + 0x0034], %r3
	.word 0xc7f2a01f  ! 853: CASXA_R	casxa	[%r10]%asi, %r31, %r3
	.word 0xc7ba983f  ! 854: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xc7ba993f  ! 855: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2428  ! 1: LDX_I	ldx	[%r28 + 0x0428], %r31
	.word 0xcc82a010  ! 856: LDUWA_I	lduwa	[%r10, + 0x0010] %asi, %r6
	.word 0xd3bae010  ! 857: STDFA_I	stda	%f9, [0x0010, %r11]
	.word 0xd3bad93f  ! 858: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xc8ca911f  ! 859: LDSBA_R	ldsba	[%r10, %r31] 0x88, %r4
	.word 0xc9ba993f  ! 860: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xfe5f2470  ! 1: LDX_I	ldx	[%r28 + 0x0470], %r31
	.word 0xc9e2a01f  ! 861: CASA_R	casa	[%r10] %asi, %r31, %r4
	.word 0xc83a801f  ! 862: STD_R	std	%r4, [%r10 + %r31]
	.word 0xc302801f  ! 863: LDF_R	ld	[%r10, %r31], %f1
	.word 0xc302a00c  ! 864: LDF_I	ld	[%r10, 0x000c], %f1
	.word 0xd01a801f  ! 865: LDD_R	ldd	[%r10 + %r31], %r8
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd1e2913f  ! 866: CASA_I	casa	[%r10] 0x89, %r31, %r8
	.word 0xd252801f  ! 867: LDSH_R	ldsh	[%r10 + %r31], %r9
	.word 0xd3ba983f  ! 868: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc4d2a05a  ! 869: LDSHA_I	ldsha	[%r10, + 0x005a] %asi, %r2
	.word 0xcb02a008  ! 870: LDF_I	ld	[%r10, 0x0008], %f5
TH_LABEL870:
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcbba98bf  ! 871: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xce82901f  ! 872: LDUWA_R	lduwa	[%r10, %r31] 0x80, %r7
	.word 0xcfba989f  ! 873: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xcff2a01f  ! 874: CASXA_R	casxa	[%r10]%asi, %r31, %r7
	.word 0xc3baa048  ! 875: STDFA_I	stda	%f1, [0x0048, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xc3ba981f  ! 876: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xc3e2903f  ! 877: CASA_I	casa	[%r10] 0x81, %r31, %r1
	.word 0xc802c01f  ! 878: LDUW_R	lduw	[%r11 + %r31], %r4
	.word 0xc83ae048  ! 879: STD_I	std	%r4, [%r11 + 0x0048]
	.word 0xc292d01f  ! 880: LDUHA_R	lduha	[%r11, %r31] 0x80, %r1
TH_LABEL880:
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xcdbaa020  ! 881: STDFA_I	stda	%f6, [0x0020, %r10]
	.word 0xcdba981f  ! 882: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba995f  ! 883: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba985f  ! 884: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdf2901f  ! 885: CASXA_I	casxa	[%r10] 0x80, %r31, %r6
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xd09aa020  ! 886: LDDA_I	ldda	[%r10, + 0x0020] %asi, %r8
	.word 0xd1f2a01f  ! 887: CASXA_R	casxa	[%r10]%asi, %r31, %r8
	.word 0xd1ba981f  ! 888: STDFA_R	stda	%f8, [%r31, %r10]
	.word 0xd03aa020  ! 889: STD_I	std	%r8, [%r10 + 0x0020]
	.word 0xcc9ae048  ! 890: LDDA_I	ldda	[%r11, + 0x0048] %asi, %r6
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcfbad81f  ! 891: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcfbad95f  ! 892: STDFA_R	stda	%f7, [%r31, %r11]
	.word 0xcbbaa048  ! 893: STDFA_I	stda	%f5, [0x0048, %r10]
	.word 0xcbe2a01f  ! 894: CASA_R	casa	[%r10] %asi, %r31, %r5
	.word 0xcbba99bf  ! 895: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xcbba981f  ! 896: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83a801f  ! 897: STD_R	std	%r4, [%r10 + %r31]
	.word 0xcc42c01f  ! 898: LDSW_R	ldsw	[%r11 + %r31], %r6
	.word 0xc2dad11f  ! 899: LDXA_R	ldxa	[%r11, %r31] 0x88, %r1
	.word 0xc3bad99f  ! 900: STDFA_R	stda	%f1, [%r31, %r11]
TH_LABEL900:
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xc3bad97f  ! 901: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc3e2d01f  ! 902: CASA_I	casa	[%r11] 0x80, %r31, %r1
	.word 0xc3bad8bf  ! 903: STDFA_R	stda	%f1, [%r31, %r11]
	.word 0xc6c2905f  ! 904: LDSWA_R	ldswa	[%r10, %r31] 0x82, %r3
	.word 0xc7ba987f  ! 905: STDFA_R	stda	%f3, [%r31, %r10]
	.word 0xfe5f2478  ! 1: LDX_I	ldx	[%r28 + 0x0478], %r31
	.word 0xd2c2a028  ! 906: LDSWA_I	ldswa	[%r10, + 0x0028] %asi, %r9
	.word 0xd3f2a01f  ! 907: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xcb02e03c  ! 908: LDF_I	ld	[%r11, 0x003c], %f5
	.word 0xcbbad93f  ! 909: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xcbe2d13f  ! 910: CASA_I	casa	[%r11] 0x89, %r31, %r5
TH_LABEL910:
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcbf2d13f  ! 911: CASXA_I	casxa	[%r11] 0x89, %r31, %r5
	.word 0xcbf2e01f  ! 912: CASXA_R	casxa	[%r11]%asi, %r31, %r5
	.word 0xcbbad83f  ! 913: STDFA_R	stda	%f5, [%r31, %r11]
	.word 0xd28ae079  ! 914: LDUBA_I	lduba	[%r11, + 0x0079] %asi, %r9
	.word 0xd3bad97f  ! 915: STDFA_R	stda	%f9, [%r31, %r11]
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc99aa038  ! 916: LDDFA_I	ldda	[%r10, 0x0038], %f4
	.word 0xd05ac01f  ! 917: LDX_R	ldx	[%r11 + %r31], %r8
	.word 0xd1bad95f  ! 918: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad81f  ! 919: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1bad8bf  ! 920: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xd1f2e01f  ! 921: CASXA_R	casxa	[%r11]%asi, %r31, %r8
	.word 0xd1bad9bf  ! 922: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xd1f2d13f  ! 923: CASXA_I	casxa	[%r11] 0x89, %r31, %r8
	.word 0xd03ac01f  ! 924: STD_R	std	%r8, [%r11 + %r31]
	.word 0xd1e2e01f  ! 925: CASA_R	casa	[%r11] %asi, %r31, %r8
	.word 0xfe5f2450  ! 1: LDX_I	ldx	[%r28 + 0x0450], %r31
	.word 0xd1bad87f  ! 926: STDFA_R	stda	%f8, [%r31, %r11]
	.word 0xcd9ae040  ! 927: LDDFA_I	ldda	[%r11, 0x0040], %f6
	.word 0xcdbad81f  ! 928: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcc3ac01f  ! 929: STD_R	std	%r6, [%r11 + %r31]
	.word 0xcdbad87f  ! 930: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xfe5f2408  ! 1: LDX_I	ldx	[%r28 + 0x0408], %r31
	.word 0xcdbad91f  ! 931: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad95f  ! 932: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xcdbad93f  ! 933: STDFA_R	stda	%f6, [%r31, %r11]
	.word 0xd39aa030  ! 934: LDDFA_I	ldda	[%r10, 0x0030], %f9
	.word 0xd03aa030  ! 935: STD_I	std	%r8, [%r10 + 0x0030]
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc5a801f  ! 936: LDX_R	ldx	[%r10 + %r31], %r6
	.word 0xcdba993f  ! 937: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba983f  ! 938: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 939: STD_R	std	%r6, [%r10 + %r31]
	.word 0xcde2a01f  ! 940: CASA_R	casa	[%r10] %asi, %r31, %r6
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xc492913f  ! 941: LDUHA_R	lduha	[%r10, %r31] 0x89, %r2
	.word 0xc5e2901f  ! 942: CASA_I	casa	[%r10] 0x80, %r31, %r2
	.word 0xc5ba995f  ! 943: STDFA_R	stda	%f2, [%r31, %r10]
	.word 0xce92d15f  ! 944: LDUHA_R	lduha	[%r11, %r31] 0x8a, %r7
	.word 0xd242801f  ! 945: LDSW_R	ldsw	[%r10 + %r31], %r9
	.word 0xfe5f2458  ! 1: LDX_I	ldx	[%r28 + 0x0458], %r31
	.word 0xd3ba999f  ! 946: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xc59ae018  ! 947: LDDFA_I	ldda	[%r11, 0x0018], %f2
	.word 0xc5e2d13f  ! 948: CASA_I	casa	[%r11] 0x89, %r31, %r2
	.word 0xc5bad9bf  ! 949: STDFA_R	stda	%f2, [%r31, %r11]
	.word 0xc5f2e01f  ! 950: CASXA_R	casxa	[%r11]%asi, %r31, %r2
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xc99ae010  ! 951: LDDFA_I	ldda	[%r11, 0x0010], %f4
	.word 0xc9f2e01f  ! 952: CASXA_R	casxa	[%r11]%asi, %r31, %r4
	.word 0xc48a905f  ! 953: LDUBA_R	lduba	[%r10, %r31] 0x82, %r2
	.word 0xcecaa03a  ! 954: LDSBA_I	ldsba	[%r10, + 0x003a] %asi, %r7
	.word 0xcfba98bf  ! 955: STDFA_R	stda	%f7, [%r31, %r10]
	.word 0xfe5f2438  ! 1: LDX_I	ldx	[%r28 + 0x0438], %r31
	.word 0xc89aa040  ! 956: LDDA_I	ldda	[%r10, + 0x0040] %asi, %r4
	.word 0xcbba983f  ! 957: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc83aa040  ! 958: STD_I	std	%r4, [%r10 + 0x0040]
	.word 0xcbba993f  ! 959: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xc20a801f  ! 960: LDUB_R	ldub	[%r10 + %r31], %r1
	.word 0xfe5f2440  ! 1: LDX_I	ldx	[%r28 + 0x0440], %r31
	.word 0xc03aa040  ! 961: STD_I	std	%r0, [%r10 + 0x0040]
	.word 0xc3e2913f  ! 962: CASA_I	casa	[%r10] 0x89, %r31, %r1
	.word 0xc3ba997f  ! 963: STDFA_R	stda	%f1, [%r31, %r10]
	.word 0xce5ac01f  ! 964: LDX_R	ldx	[%r11 + %r31], %r7
	.word 0xd05a801f  ! 965: LDX_R	ldx	[%r10 + %r31], %r8
	.word 0xfe5f2468  ! 1: LDX_I	ldx	[%r28 + 0x0468], %r31
	.word 0xcc1aa060  ! 966: LDD_I	ldd	[%r10 + 0x0060], %r6
	.word 0xcdba987f  ! 967: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba999f  ! 968: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcdba991f  ! 969: STDFA_R	stda	%f6, [%r31, %r10]
	.word 0xcc3a801f  ! 970: STD_R	std	%r6, [%r10 + %r31]
	.word 0xfe5f2460  ! 1: LDX_I	ldx	[%r28 + 0x0460], %r31
	.word 0xcad2901f  ! 971: LDSHA_R	ldsha	[%r10, %r31] 0x80, %r5
	.word 0xcbba999f  ! 972: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xcbba997f  ! 973: STDFA_R	stda	%f5, [%r31, %r10]
	.word 0xd20aa05e  ! 974: LDUB_I	ldub	[%r10 + 0x005e], %r9
	.word 0xd3ba997f  ! 975: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xfe5f2418  ! 1: LDX_I	ldx	[%r28 + 0x0418], %r31
	.word 0xd3e2913f  ! 976: CASA_I	casa	[%r10] 0x89, %r31, %r9
	.word 0xd3f2a01f  ! 977: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03aa058  ! 978: STD_I	std	%r8, [%r10 + 0x0058]
	.word 0xd3f2a01f  ! 979: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xd03a801f  ! 980: STD_R	std	%r8, [%r10 + %r31]
	.word 0xfe5f2400  ! 1: LDX_I	ldx	[%r28 + 0x0400], %r31
	.word 0xd3ba997f  ! 981: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2903f  ! 982: CASA_I	casa	[%r10] 0x81, %r31, %r9
	.word 0xd3ba985f  ! 983: STDFA_R	stda	%f9, [%r31, %r10]
	.word 0xd3e2a01f  ! 984: CASA_R	casa	[%r10] %asi, %r31, %r9
	.word 0xd3f2a01f  ! 985: CASXA_R	casxa	[%r10]%asi, %r31, %r9
	.word 0xfe5f2430  ! 1: LDX_I	ldx	[%r28 + 0x0430], %r31
	.word 0xc8d2913f  ! 986: LDSHA_R	ldsha	[%r10, %r31] 0x89, %r4
	.word 0xc9ba985f  ! 987: STDFA_R	stda	%f4, [%r31, %r10]
	.word 0xcc1ae040  ! 988: LDD_I	ldd	[%r11 + 0x0040], %r6
	.word 0xcde2e01f  ! 989: CASA_R	casa	[%r11] %asi, %r31, %r6
	.word 0xd19aa038  ! 990: LDDFA_I	ldda	[%r10, 0x0038], %f8
	.word 0xfe5f2420  ! 1: LDX_I	ldx	[%r28 + 0x0420], %r31
	.word 0xcc82a044  ! 991: LDUWA_I	lduwa	[%r10, + 0x0044] %asi, %r6
	.word 0xd322c01f  ! 992: STF_R	st	%f9, [%r31, %r11]
	.word 0xc99ae020  ! 993: LDDFA_I	ldda	[%r11, 0x0020], %f4
	.word 0xc702e008  ! 994: LDF_I	ld	[%r11, 0x0008], %f3
	.word 0xc7f2d03f  ! 995: CASXA_I	casxa	[%r11] 0x81, %r31, %r3
	.word 0xfe5f2410  ! 1: LDX_I	ldx	[%r28 + 0x0410], %r31
	.word 0xc522801f  ! 996: STF_R	st	%f2, [%r31, %r10]
	.word 0xc9baa068  ! 997: STDFA_I	stda	%f4, [0x0068, %r10]
	.word 0xc9f2901f  ! 998: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc9f2901f  ! 999: CASXA_I	casxa	[%r10] 0x80, %r31, %r4
	.word 0xc39aa008  ! 1000: LDDFA_I	ldda	[%r10, 0x0008], %f1
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
.xword 0xd8fa549b335f6a1d
.xword 0xfbea65ad24b38460
.xword 0xde41047a0ec94361
.xword 0x1324b6a5a1fec5cc
.xword 0xd7895f4c0d918ae2
.xword 0x4c7f599058e11f94
.xword 0x2a0421f277b85911
.xword 0x79c854f1b500857e
.xword 0x40449f3ac8abcd94
.xword 0x46ec738b468ef04b
.xword 0x240ccbb4d50ccf4e
.xword 0xf325fc46362e945c
.xword 0xac960fabdfb1f6d9
.xword 0x8b0d8530885d23df
.xword 0xc1391f54cf5a1d27
.xword 0xdf91f5ffe87883cc
.xword 0xa38974fce98e8268
.xword 0xae648d3edf3fa4cc
.xword 0xa40d0988813ad900
.xword 0x4699521493588097
.xword 0x2ad1831de1feb857
.xword 0xe6841ec3e3a14934
.xword 0xad65dfd57a2ae292
.xword 0xb21d75a3668b189f
.xword 0x163d5299e0dea108
.xword 0xf8bb62b59b6a7013
.xword 0x32c6fe8fe74c9de5
.xword 0xb53069c0fc6f4ae3
.xword 0xbf0b8bd468ba8ec6
.xword 0x48f5bde50dafe694
.xword 0xe4a2424c6c8756eb
.xword 0xa45fe6055e5e0995



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
.xword 0xf48eddc834f6a1af

.xword 0xb56d474cafad59e5

.xword 0x0cdfdd6549bbb60d

.xword 0x1a74eeeb8d4a2553

.xword 0xb6ea68f59326c236

.xword 0xa19b8642ff1c6d8e

.xword 0x0b158bfa7f4c9951

.xword 0x53d87663a69bdb05

.xword 0x325b8af688229666

.xword 0xe93c601621fe4546

.xword 0xb4660d1e37c533d8

.xword 0x02605a5a83b28075

.xword 0x0e02905464018ce7

.xword 0x2e0e49b94f13bdbc

.xword 0x5d9918fa5f26123e

.xword 0x0ec006bb82786f2f

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
.xword 0x8f6143248a1d020f
.xword 0xcb156b4440522eba
.xword 0x50e80b87580b0b00
.xword 0x115e4d6603771944
.xword 0xa6f8c22a3da772e4
.xword 0xf3e66a7321538ea6
.xword 0xc280cf153b9d32ae
.xword 0xa63e57c2e0b2a967
.xword 0xa4943baabdf0d682




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
.xword 0x5897f84c0f4c5163
.xword 0x50b5c58822129dfb
.xword 0x64d3757ea8d30c6e
.xword 0x444887c3fde3a1e3
.xword 0x56c8b7a2abb5a11d
.xword 0x05c25821541a2380
.xword 0x33a0583291fd1fc2
.xword 0x9e77c8b019466b90
.xword 0xf61d178342448cc4




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
.xword 0x61c06a9c5eef6039
.xword 0x134c4544b25a0da1
.xword 0x2b263924cb503faf
.xword 0x8b35630eb7fb97f0
.xword 0x126f1a28019215ae
.xword 0x71cf0f0e121416b7
.xword 0x858cf0a77f25e4ae
.xword 0x249a134d70ee0812
.xword 0xe5fd5b24c3cee9c6




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
.xword 0x9a8c962af3ad9aea
.xword 0x5ab73c4ac1d6016d
.xword 0x0932d863eda672b4
.xword 0x67c819804b5585cc
.xword 0xc7c2c64730a9ad35
.xword 0xd0212e83ddecf541
.xword 0x34cd48233258d99d
.xword 0x9ee301bfbfd4c16e
.xword 0x990be8d102d14326




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
.xword 0x5a9918ffd2e154b8
.xword 0xe765682c03319582
.xword 0x0eb71246d9910e42
.xword 0x55aef7fd392bb873
.xword 0x916d3357626e659a
.xword 0xb82b14dbfbc4c53f
.xword 0xbe958b7b3210fbc9
.xword 0x09c729d32b4925c5
.xword 0xa7c0fa86ce570785




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
.xword 0x31d89450f65d2ceb
.xword 0xb155477ce7e6076d
.xword 0x70bb79b6eb2c2a64
.xword 0x31b9edb48b36305a
.xword 0xe16a4a602f5fd3d9
.xword 0xc4c475ede501a714
.xword 0x621f789567e12acd
.xword 0xad6730559265bc72
.xword 0xeee156de38edfbe0




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
.xword 0xd32ce02ca24da7f2
.xword 0x43c6e0908cca7ffe
.xword 0x49ebe6af89ba97ab
.xword 0x432350fe37ad2061
.xword 0xa3c26c805158b790
.xword 0xc48ac546fa4be0f7
.xword 0x11cdad0173662fd6
.xword 0x9fa591eea167cf0b
.xword 0xb96dc4adbfe1984f






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
.xword 0xcd371abd84778f89

.xword 0x0a5fba69b626f4fe

.xword 0xac4ac8980a754fea

.xword 0x6524f5fcd7194780

.xword 0xd3307a728830131c

.xword 0xbe2842ae8b1bb5e8

.xword 0x2cbece8456f1f39a

.xword 0x9a0d9f666dd67424

.xword 0xeeb9e8c62e5cb4cd

.xword 0x456cc56de09c6305

.xword 0x06b8e19c942dedd7

.xword 0x4945975306b0a0da

.xword 0xd10e932d76e0e85e

.xword 0x44da0a5bdcc1edc3

.xword 0xe5505dd2c59c0256

.xword 0xb9baad5731c611cb




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
.xword 0x35c96a8ae903f331
.xword 0x898c768cee4c3ce6
.xword 0x25e861cde8a59c8b
.xword 0x282d4bac53d4ded0
.xword 0x505abee521d29f24
.xword 0x03dbcbec81680491
.xword 0xc48925a6cd2f275b
.xword 0x5f7f2e0233806f10



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
.xword 0x784c2424be56cce3
.xword 0x1a1ece08127e491f
.xword 0x365068256b93fecb
.xword 0x97676def0b08b006
.xword 0xd6354edb97ba7ba0
.xword 0x8f20afe45d520065
.xword 0xd8361e0cbb7ba491
.xword 0xdebd8d84ba2efbef



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
.xword 0xbd4b83f198c724ab
.xword 0xbb73a25d914c2648
.xword 0x2f7628daa8fd0d15
.xword 0xec75214fb34d3a78
.xword 0x1ef1ed02dd5837d1
.xword 0xea97a93c02eea42d
.xword 0x3c636fe1c57ff2a8
.xword 0x09dbf6de28dd90d9



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
.xword 0x964e84eefbb642e9
.xword 0x757244b85a681451
.xword 0x0a0f0b322baefcac
.xword 0x1944493dde6c13d6
.xword 0x99f83de4b8e5e962
.xword 0xba0805a9188558e6
.xword 0x7fc5ef952d50d90c
.xword 0x9f88ebe43b02c086



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
.xword 0x4f160e735eaeffcd
.xword 0x03a5f3f1e489a9f6
.xword 0x26a4e530fa4aece5
.xword 0x59429c96a22374e7
.xword 0x6381f5de6446d7c8
.xword 0x81fc931de5b78667
.xword 0xab79024461f0d183
.xword 0xc0fed691b45381f8



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
.xword 0x3c494430b5d911af
.xword 0x843190d7fc7ae8db
.xword 0x65726a912e05987f
.xword 0x9f986a9b9c5aa9dd
.xword 0x7995e49f95d3b434
.xword 0x22741238e9508440
.xword 0xfc0930faf9ed5396
.xword 0xbdc074290508041f



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
.xword 0xdefd0ddeed59075d
.xword 0xf9afdc33adf61048
.xword 0xd8dd7e7fcc099e21
.xword 0x2a6a3e4bd62e9932
.xword 0xd9987cf5d021ab7a
.xword 0x8be4ff288e6dcbb0
.xword 0xb574b6878ad96add
.xword 0x85e0f6749c36dbc2





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
.xword 0x10d6220c4ef3bd88

.xword 0x8c2f872c78bff9fd

.xword 0x9cac37f62605ea4a

.xword 0x23f5c205f8b2f2ef

.xword 0x03e92806c661d336

.xword 0x47194d305ebf7a75

.xword 0x21756fd7c3820386

.xword 0xccab357a8817fb6c

.xword 0x4433c9cf4597523c

.xword 0x681117d94207fb27

.xword 0x078c6bdf2c15699d

.xword 0x0675f81f2c2c2bb9

.xword 0x261d2b8afb579705

.xword 0xa8bd9e6fe3b061ab

.xword 0xd36fdf9b831499e2

.xword 0x035afa975e6585e2

.xword 0xf77902aa4b6ff63b

.xword 0xadf314c70e79ac90

.xword 0xa3868f7a948cd008

.xword 0x715ee850c0c8aaf5

.xword 0x019170f541efb7ab

.xword 0x2af056b20eaccee8

.xword 0x1c2657be42445a7b

.xword 0x9aa062a3256bd0f4

.xword 0x4477cff5c9858f4e

.xword 0x87d57c1ba33bc002

.xword 0xa2461840384f3161

.xword 0x3e0c726555719767

.xword 0x79334860a8f700a7

.xword 0x71a063084b86527b

.xword 0x940b46a35d2071eb

.xword 0xcdc2309147579b20

.xword 0x9f684c0bcffde1c1

.xword 0x57d7b5d4ad1cc141

.xword 0xaf7679ec0818b352

.xword 0x08dc14d012ec8ff9

.xword 0x8ee630815185476a

.xword 0x36fdb3ab54575fd2

.xword 0xc69d36935b9f9f62

.xword 0xb522e01c221f4303

.xword 0xb23abfd6d21aca2c

.xword 0x46c756c1b2d19a23

.xword 0x855cb15653de23ec

.xword 0x82513fb3e186a018

.xword 0x387cb0c311e85dca

.xword 0xea7bf464c32f0708

.xword 0x34925a7f6a60141f

.xword 0x4334c0cde2079325

.xword 0xa308fcba6314d571

.xword 0xbd6a170ec12543f7

.xword 0x22b7e3da646ac6fb

.xword 0x1341139de7b54095

.xword 0xfa02305074eb245d

.xword 0x97df9c67d0231a50

.xword 0x5f9b8bbfacf84433

.xword 0x1af4358db30df99c

.xword 0x31da7a982ff931c9

.xword 0x0079a1843161782a

.xword 0xfa18ccbe6d788da6

.xword 0xe99d2946b1ad33a2

.xword 0xa33ed87f129ad408

.xword 0xfd0fbe3e9a5637d9

.xword 0x36c22f3a9c3273ff

.xword 0x795dce1f9e991ec8

.xword 0x9c6564db9d95a6e8

.xword 0xbb097d654a902891

.xword 0x34604f87a99e4ba1

.xword 0xd061b64438f561d9

.xword 0x7660ba54ba71abb5

.xword 0x05ef8d552c475441

.xword 0xf72439ec5f4369c5

.xword 0x654afa5b523c6e1c

.xword 0x9f87c41f0bd5d81a

.xword 0xd97c8bc850261d9c

.xword 0x9c1afd05287ffaf4

.xword 0xcb7b9c390f0d8456

.xword 0x6d2d229010fe877e

.xword 0x1f33c47a35241431

.xword 0x5f2e3d70bf89d3c3

.xword 0x1b02a53e08927eb7

.xword 0x637ed205bf686d7a

.xword 0x6abfe1017d2c7960

.xword 0x5c562275476fa1c8

.xword 0xa074e3b67165c7e7

.xword 0x73dd5f8b4169842d

.xword 0x9d31e8fdb5b1a77d

.xword 0xba0694afcda65bb4

.xword 0x739b40a38121a92d

.xword 0x28e0939fb1431f99

.xword 0x2469864d758d1e0c

.xword 0x5f35e8c3ff656317

.xword 0x5758d2917d270c7e

.xword 0x4fc2924a2c3ceefb

.xword 0x5bea6e93e7f0e3ef

.xword 0xc84c02706785e437

.xword 0x993207a39cc54ead

.xword 0x5ec4295cc0680bff

.xword 0xda6eb7c5c28ed872

.xword 0x2ac5a8c3233a29de

.xword 0x0f159c28bc3f22f2

.xword 0x533a89ba7fc1b27c

.xword 0xcee1de5f0f9310bc

.xword 0x34b6839590bc6103

.xword 0xbf3be630704e8306

.xword 0x2fc051770819f355

.xword 0xf811572019e67caf

.xword 0x0664bb407ad2cdbc

.xword 0x73787a66caa4ae2f

.xword 0x6df9142c53d1b71b

.xword 0xac7fc928d2381697

.xword 0x60191fadc0d5ce73

.xword 0x717138e40ad85999

.xword 0x63beeeeb328bf191

.xword 0x43d29fedbc6e58cd

.xword 0xa70a2e1d852d1f5c

.xword 0xb9b5a5ccadd61cb7

.xword 0xe3fb95d758c4214b

.xword 0x297affbb4ecdee1e

.xword 0xf048855bf2ec3d16

.xword 0x4ada4401971ea0f8

.xword 0x7f1d0df7df5b67aa

.xword 0x53ca19b06b769756

.xword 0x02874ccd1d591e71

.xword 0xff05735f314d7a98

.xword 0x345f12a1f6d9c1bc

.xword 0x2b403d5c6016b4a2

.xword 0xccf7f9c49d0b353c

.xword 0x8a239ee8d73c6499

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
